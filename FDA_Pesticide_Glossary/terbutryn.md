---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.053627, 0.2072091, -3.190164, 1, 0, 0, 1,
-2.880714, -1.481586, -2.58299, 1, 0.007843138, 0, 1,
-2.864042, 0.4943936, -0.771181, 1, 0.01176471, 0, 1,
-2.504488, 0.2891511, 0.433116, 1, 0.01960784, 0, 1,
-2.448208, 2.289072, -0.6040848, 1, 0.02352941, 0, 1,
-2.42302, -0.3682874, -2.277456, 1, 0.03137255, 0, 1,
-2.388666, -0.5789984, -0.4746631, 1, 0.03529412, 0, 1,
-2.347672, 0.8615766, 0.7582067, 1, 0.04313726, 0, 1,
-2.339095, -0.2851614, -0.782586, 1, 0.04705882, 0, 1,
-2.316113, -0.5509003, -2.562247, 1, 0.05490196, 0, 1,
-2.234222, -0.7235767, -1.236336, 1, 0.05882353, 0, 1,
-2.172295, -0.8147418, -3.034948, 1, 0.06666667, 0, 1,
-2.166165, 1.710476, -0.9351033, 1, 0.07058824, 0, 1,
-2.145726, -1.159086, -0.8164538, 1, 0.07843138, 0, 1,
-2.122897, 0.28501, -2.845826, 1, 0.08235294, 0, 1,
-2.11925, 2.161046, -1.178846, 1, 0.09019608, 0, 1,
-2.08599, 0.3927095, -2.235235, 1, 0.09411765, 0, 1,
-2.071136, -0.7605141, -2.806062, 1, 0.1019608, 0, 1,
-2.047909, 0.4377566, -0.8343138, 1, 0.1098039, 0, 1,
-2.037974, 1.078799, 0.4312405, 1, 0.1137255, 0, 1,
-2.027059, -0.0629637, -0.6723087, 1, 0.1215686, 0, 1,
-2.017948, 2.050946, -1.870088, 1, 0.1254902, 0, 1,
-2.016377, 2.492014, -0.7463379, 1, 0.1333333, 0, 1,
-1.994471, -0.4409279, -2.458605, 1, 0.1372549, 0, 1,
-1.976171, -0.7682832, -2.280834, 1, 0.145098, 0, 1,
-1.958435, -1.402718, -2.392471, 1, 0.1490196, 0, 1,
-1.955816, 0.3232874, -1.097891, 1, 0.1568628, 0, 1,
-1.952414, -0.3819415, -1.035466, 1, 0.1607843, 0, 1,
-1.943243, 0.2616304, -2.252459, 1, 0.1686275, 0, 1,
-1.923862, -0.8324533, -2.777467, 1, 0.172549, 0, 1,
-1.921851, -0.9729971, -2.442605, 1, 0.1803922, 0, 1,
-1.850085, 1.539842, -2.238399, 1, 0.1843137, 0, 1,
-1.819441, 1.327032, -0.3171385, 1, 0.1921569, 0, 1,
-1.818816, -2.618319, -2.101099, 1, 0.1960784, 0, 1,
-1.818526, -1.669654, -4.764341, 1, 0.2039216, 0, 1,
-1.813389, 0.09795985, -1.061797, 1, 0.2117647, 0, 1,
-1.774144, 0.3271532, -1.73595, 1, 0.2156863, 0, 1,
-1.734051, 0.7572933, 0.2382453, 1, 0.2235294, 0, 1,
-1.726189, -0.1933731, -1.030555, 1, 0.227451, 0, 1,
-1.720565, -1.236389, -2.387088, 1, 0.2352941, 0, 1,
-1.716909, 1.438404, 1.001038, 1, 0.2392157, 0, 1,
-1.711344, -1.509022, -2.252422, 1, 0.2470588, 0, 1,
-1.7098, 0.3878381, -1.491029, 1, 0.2509804, 0, 1,
-1.707453, 1.577461, -0.4681189, 1, 0.2588235, 0, 1,
-1.701882, 2.134213, -1.102043, 1, 0.2627451, 0, 1,
-1.696225, -1.072966, -1.225043, 1, 0.2705882, 0, 1,
-1.684036, -0.1366124, -0.06576344, 1, 0.2745098, 0, 1,
-1.671119, -0.5073703, -1.019435, 1, 0.282353, 0, 1,
-1.666301, -0.2395753, -0.427167, 1, 0.2862745, 0, 1,
-1.664276, -0.343955, -1.086392, 1, 0.2941177, 0, 1,
-1.652914, -0.07545609, -1.416948, 1, 0.3019608, 0, 1,
-1.62251, -1.444863, -0.627339, 1, 0.3058824, 0, 1,
-1.614884, 0.4234321, -1.799303, 1, 0.3137255, 0, 1,
-1.608727, -1.946193, -0.4727119, 1, 0.3176471, 0, 1,
-1.607895, 1.063478, -1.03122, 1, 0.3254902, 0, 1,
-1.599186, 0.7243613, -3.043835, 1, 0.3294118, 0, 1,
-1.591884, 1.015221, -3.027206, 1, 0.3372549, 0, 1,
-1.582646, 1.150919, 0.08869452, 1, 0.3411765, 0, 1,
-1.569296, -1.033215, -1.394028, 1, 0.3490196, 0, 1,
-1.565946, -0.1417439, -2.174101, 1, 0.3529412, 0, 1,
-1.560533, -0.1765086, 1.13755, 1, 0.3607843, 0, 1,
-1.544228, 0.9220916, -1.132144, 1, 0.3647059, 0, 1,
-1.533154, -1.933846, -3.04557, 1, 0.372549, 0, 1,
-1.529217, -0.4080028, -2.262828, 1, 0.3764706, 0, 1,
-1.524854, 0.4592293, -1.272227, 1, 0.3843137, 0, 1,
-1.516772, -1.014765, -0.9317496, 1, 0.3882353, 0, 1,
-1.512347, -0.1227192, -0.5175781, 1, 0.3960784, 0, 1,
-1.507282, -0.1884077, -4.979711, 1, 0.4039216, 0, 1,
-1.501778, 0.05882649, -2.111099, 1, 0.4078431, 0, 1,
-1.485566, 0.3282209, -0.9752961, 1, 0.4156863, 0, 1,
-1.481074, -0.3561825, -2.217149, 1, 0.4196078, 0, 1,
-1.47929, 0.2557397, -1.238988, 1, 0.427451, 0, 1,
-1.478504, 0.8968148, -1.886602, 1, 0.4313726, 0, 1,
-1.469214, -0.5016857, -0.584803, 1, 0.4392157, 0, 1,
-1.466294, 1.398736, -1.04071, 1, 0.4431373, 0, 1,
-1.462112, -1.076285, -0.7655091, 1, 0.4509804, 0, 1,
-1.461607, 1.265944, -0.9990707, 1, 0.454902, 0, 1,
-1.451306, -2.754933, -2.451523, 1, 0.4627451, 0, 1,
-1.442485, -0.7495793, -2.912619, 1, 0.4666667, 0, 1,
-1.440443, -0.7300695, -2.473153, 1, 0.4745098, 0, 1,
-1.434608, -0.1525247, -2.593505, 1, 0.4784314, 0, 1,
-1.434168, 1.20714, 0.3339718, 1, 0.4862745, 0, 1,
-1.419586, -0.09449791, -2.65036, 1, 0.4901961, 0, 1,
-1.409695, 0.5776837, -0.6110915, 1, 0.4980392, 0, 1,
-1.404126, -0.9505765, -1.931894, 1, 0.5058824, 0, 1,
-1.394074, -0.09113349, -0.7566476, 1, 0.509804, 0, 1,
-1.387829, -2.027439, -2.553, 1, 0.5176471, 0, 1,
-1.380736, -0.2751341, 0.3890414, 1, 0.5215687, 0, 1,
-1.379276, 1.221417, 0.3900194, 1, 0.5294118, 0, 1,
-1.378562, 2.05644, -0.7440073, 1, 0.5333334, 0, 1,
-1.378148, 0.03332486, -0.8742164, 1, 0.5411765, 0, 1,
-1.376379, 0.4286173, -0.6946436, 1, 0.5450981, 0, 1,
-1.374077, 1.25715, -0.8394589, 1, 0.5529412, 0, 1,
-1.357217, 0.1420961, -0.6028672, 1, 0.5568628, 0, 1,
-1.348217, 0.1603478, 0.1233075, 1, 0.5647059, 0, 1,
-1.338404, -0.4914179, -0.4863946, 1, 0.5686275, 0, 1,
-1.325551, -0.1116632, -2.3402, 1, 0.5764706, 0, 1,
-1.320472, 0.3776994, -2.149889, 1, 0.5803922, 0, 1,
-1.305235, 0.4248466, -2.049485, 1, 0.5882353, 0, 1,
-1.290547, 1.587892, -0.008205044, 1, 0.5921569, 0, 1,
-1.287365, 0.7111792, -0.5112267, 1, 0.6, 0, 1,
-1.267424, 0.1756709, -1.37491, 1, 0.6078432, 0, 1,
-1.26427, 1.210632, -0.005898866, 1, 0.6117647, 0, 1,
-1.263337, 0.9974241, -1.702, 1, 0.6196079, 0, 1,
-1.261695, 0.8130749, -1.317966, 1, 0.6235294, 0, 1,
-1.260679, 1.166795, -1.746005, 1, 0.6313726, 0, 1,
-1.258145, 0.2493353, -1.209471, 1, 0.6352941, 0, 1,
-1.245105, 0.07730244, -1.925578, 1, 0.6431373, 0, 1,
-1.241425, -0.2456387, -2.412454, 1, 0.6470588, 0, 1,
-1.238284, 0.9297488, 0.645009, 1, 0.654902, 0, 1,
-1.230269, 0.7164187, -2.087787, 1, 0.6588235, 0, 1,
-1.214806, 0.2969732, -1.346319, 1, 0.6666667, 0, 1,
-1.210576, 0.6320672, 0.0006475956, 1, 0.6705883, 0, 1,
-1.205531, 1.231807, -0.8256792, 1, 0.6784314, 0, 1,
-1.198539, -0.865344, -1.59667, 1, 0.682353, 0, 1,
-1.194222, -0.5377634, -2.437894, 1, 0.6901961, 0, 1,
-1.189908, 0.03697154, -1.246697, 1, 0.6941177, 0, 1,
-1.183995, -0.9107068, -2.693368, 1, 0.7019608, 0, 1,
-1.174167, 1.119316, -1.316113, 1, 0.7098039, 0, 1,
-1.172369, -1.180293, -2.048093, 1, 0.7137255, 0, 1,
-1.163695, 0.7896034, -1.935275, 1, 0.7215686, 0, 1,
-1.163094, 2.066884, -0.947127, 1, 0.7254902, 0, 1,
-1.161562, -0.2115864, -1.960481, 1, 0.7333333, 0, 1,
-1.159477, -0.8339717, -3.313644, 1, 0.7372549, 0, 1,
-1.158647, -0.262552, -2.454102, 1, 0.7450981, 0, 1,
-1.140231, -0.6571285, -1.902294, 1, 0.7490196, 0, 1,
-1.136752, -0.06991817, -1.593575, 1, 0.7568628, 0, 1,
-1.135653, -0.37753, -2.520504, 1, 0.7607843, 0, 1,
-1.132131, -0.1437272, -2.184418, 1, 0.7686275, 0, 1,
-1.130541, -1.489719, -3.303335, 1, 0.772549, 0, 1,
-1.122464, 0.5061762, 0.09908346, 1, 0.7803922, 0, 1,
-1.11482, -0.04059151, -1.038328, 1, 0.7843137, 0, 1,
-1.112005, 0.6702922, -1.058055, 1, 0.7921569, 0, 1,
-1.110476, 0.1428751, -0.7457886, 1, 0.7960784, 0, 1,
-1.108358, 0.1098119, -1.858785, 1, 0.8039216, 0, 1,
-1.100837, -1.608368, -1.410077, 1, 0.8117647, 0, 1,
-1.100065, -1.689028, -2.187513, 1, 0.8156863, 0, 1,
-1.099508, -0.6177022, -3.476159, 1, 0.8235294, 0, 1,
-1.09908, -0.008902804, -1.963001, 1, 0.827451, 0, 1,
-1.098961, -0.130003, -1.148623, 1, 0.8352941, 0, 1,
-1.098797, -0.55123, -1.429279, 1, 0.8392157, 0, 1,
-1.097279, -0.1512657, -2.424039, 1, 0.8470588, 0, 1,
-1.091467, -0.7883083, -2.524251, 1, 0.8509804, 0, 1,
-1.08526, -1.709179, -3.796577, 1, 0.8588235, 0, 1,
-1.085147, 0.5429865, -2.950619, 1, 0.8627451, 0, 1,
-1.060232, 1.841361, -1.293034, 1, 0.8705882, 0, 1,
-1.050432, -0.825289, -2.366177, 1, 0.8745098, 0, 1,
-1.045564, -0.2654845, -1.849204, 1, 0.8823529, 0, 1,
-1.045189, 1.08441, 0.5212556, 1, 0.8862745, 0, 1,
-1.043122, 1.350363, -1.832914, 1, 0.8941177, 0, 1,
-1.042157, -1.950802, -2.634282, 1, 0.8980392, 0, 1,
-1.040538, -0.5459366, -1.647099, 1, 0.9058824, 0, 1,
-1.034089, 0.4922267, -0.2447154, 1, 0.9137255, 0, 1,
-1.031635, -1.029353, -3.893428, 1, 0.9176471, 0, 1,
-1.031076, 0.05366271, -2.799008, 1, 0.9254902, 0, 1,
-1.030269, -0.8786163, -1.844762, 1, 0.9294118, 0, 1,
-1.02472, 1.376152, -0.1351235, 1, 0.9372549, 0, 1,
-1.018542, 0.476687, -0.942531, 1, 0.9411765, 0, 1,
-1.016078, 0.5445863, -2.504249, 1, 0.9490196, 0, 1,
-1.015932, -0.5330466, -1.618929, 1, 0.9529412, 0, 1,
-1.013544, -0.9629408, -0.9334845, 1, 0.9607843, 0, 1,
-1.008867, -1.099642, -4.02835, 1, 0.9647059, 0, 1,
-1.008578, -0.8983385, -2.317481, 1, 0.972549, 0, 1,
-0.9990691, -1.431317, -2.777803, 1, 0.9764706, 0, 1,
-0.9974624, 1.169146, 0.149563, 1, 0.9843137, 0, 1,
-0.9930044, -0.6466156, -1.17643, 1, 0.9882353, 0, 1,
-0.9791993, -0.9479889, -1.377548, 1, 0.9960784, 0, 1,
-0.9751249, -0.3920144, -1.655103, 0.9960784, 1, 0, 1,
-0.9742299, 0.502255, 0.0787538, 0.9921569, 1, 0, 1,
-0.96864, 1.742049, 0.403888, 0.9843137, 1, 0, 1,
-0.963237, -0.3954672, -2.26697, 0.9803922, 1, 0, 1,
-0.9615957, 1.572242, -1.969128, 0.972549, 1, 0, 1,
-0.9533369, -0.5490118, -1.11095, 0.9686275, 1, 0, 1,
-0.9506399, -0.07013011, -0.5651733, 0.9607843, 1, 0, 1,
-0.9421061, -0.505967, -2.425955, 0.9568627, 1, 0, 1,
-0.9400991, -0.5912191, -0.7077436, 0.9490196, 1, 0, 1,
-0.9376013, 0.4457924, -1.276499, 0.945098, 1, 0, 1,
-0.9334291, 1.249036, -0.3902518, 0.9372549, 1, 0, 1,
-0.9317154, 0.7457112, -1.190006, 0.9333333, 1, 0, 1,
-0.9207434, -1.237069, -1.035985, 0.9254902, 1, 0, 1,
-0.9163896, 0.0009852537, -3.194152, 0.9215686, 1, 0, 1,
-0.9151196, -1.409211, -1.810442, 0.9137255, 1, 0, 1,
-0.9142402, -1.084983, -3.660848, 0.9098039, 1, 0, 1,
-0.9129137, 0.5873691, -1.778188, 0.9019608, 1, 0, 1,
-0.9042038, -0.04748071, -1.511416, 0.8941177, 1, 0, 1,
-0.8917848, 0.3706282, -0.9490845, 0.8901961, 1, 0, 1,
-0.8876997, -0.4800998, -1.998551, 0.8823529, 1, 0, 1,
-0.886353, -0.1745812, -2.254112, 0.8784314, 1, 0, 1,
-0.884799, -1.861376, -2.21202, 0.8705882, 1, 0, 1,
-0.882499, -0.2641003, -2.310303, 0.8666667, 1, 0, 1,
-0.8773211, -0.7548407, -3.058251, 0.8588235, 1, 0, 1,
-0.8767062, -0.9872852, -1.790226, 0.854902, 1, 0, 1,
-0.8764616, 0.8417251, -0.8605963, 0.8470588, 1, 0, 1,
-0.8747942, 0.1986201, -0.9288004, 0.8431373, 1, 0, 1,
-0.8737227, 0.4292331, -3.079738, 0.8352941, 1, 0, 1,
-0.8723225, 0.3712468, -1.565013, 0.8313726, 1, 0, 1,
-0.8715708, -1.048433, -1.310619, 0.8235294, 1, 0, 1,
-0.867856, -0.531656, -0.9979827, 0.8196079, 1, 0, 1,
-0.8643067, 0.3666916, -1.335857, 0.8117647, 1, 0, 1,
-0.8615172, 0.1324804, -0.9816151, 0.8078431, 1, 0, 1,
-0.8535829, -0.8192646, -3.546914, 0.8, 1, 0, 1,
-0.8520029, 0.9646275, -3.018881, 0.7921569, 1, 0, 1,
-0.8452094, -1.130013, -2.436383, 0.7882353, 1, 0, 1,
-0.8432602, 0.6957426, -1.134183, 0.7803922, 1, 0, 1,
-0.8377222, -0.6331945, -1.707945, 0.7764706, 1, 0, 1,
-0.8350444, -0.2884496, -1.137474, 0.7686275, 1, 0, 1,
-0.8321588, 1.763425, -0.5525667, 0.7647059, 1, 0, 1,
-0.8304388, 0.3603285, -0.8862049, 0.7568628, 1, 0, 1,
-0.8294502, -0.469469, -3.955362, 0.7529412, 1, 0, 1,
-0.8282, 1.398739, -1.611412, 0.7450981, 1, 0, 1,
-0.8238159, -0.593848, -1.660976, 0.7411765, 1, 0, 1,
-0.819676, -1.376286, -4.696819, 0.7333333, 1, 0, 1,
-0.8192831, 0.6983934, -1.475152, 0.7294118, 1, 0, 1,
-0.8161662, -0.571444, -2.438303, 0.7215686, 1, 0, 1,
-0.8148341, -1.04946, -1.79243, 0.7176471, 1, 0, 1,
-0.8128343, -0.1851512, -2.554053, 0.7098039, 1, 0, 1,
-0.8120978, 0.06510687, -1.45852, 0.7058824, 1, 0, 1,
-0.8077592, 0.6019473, -1.446075, 0.6980392, 1, 0, 1,
-0.8023065, -0.09464873, -1.435807, 0.6901961, 1, 0, 1,
-0.7951674, -0.4555364, -1.765183, 0.6862745, 1, 0, 1,
-0.7950191, -0.08502778, -2.439413, 0.6784314, 1, 0, 1,
-0.7920009, 0.158877, -0.8468222, 0.6745098, 1, 0, 1,
-0.7877563, 2.137667, 0.1925869, 0.6666667, 1, 0, 1,
-0.7840567, 1.490777, -0.2563302, 0.6627451, 1, 0, 1,
-0.7807167, 0.354362, -1.478858, 0.654902, 1, 0, 1,
-0.779211, -0.5525023, -1.020229, 0.6509804, 1, 0, 1,
-0.7785815, -0.06016774, -0.5681926, 0.6431373, 1, 0, 1,
-0.7768134, 0.33817, -1.864226, 0.6392157, 1, 0, 1,
-0.7760146, -0.762135, -3.76768, 0.6313726, 1, 0, 1,
-0.7735566, -0.6737888, -1.692936, 0.627451, 1, 0, 1,
-0.773449, 1.769902, -0.1423918, 0.6196079, 1, 0, 1,
-0.7704061, -0.2523076, -1.404827, 0.6156863, 1, 0, 1,
-0.7683445, -0.3776402, -1.159242, 0.6078432, 1, 0, 1,
-0.7682683, 2.13595, 0.1244745, 0.6039216, 1, 0, 1,
-0.7646168, -1.411709, -1.79294, 0.5960785, 1, 0, 1,
-0.7639593, 0.8251573, 0.00540138, 0.5882353, 1, 0, 1,
-0.7622108, 1.015797, -0.02743501, 0.5843138, 1, 0, 1,
-0.7597419, 0.2822683, -2.349168, 0.5764706, 1, 0, 1,
-0.7552105, -0.6739867, -3.892712, 0.572549, 1, 0, 1,
-0.7547783, 0.7226692, -1.356808, 0.5647059, 1, 0, 1,
-0.7464978, -0.6203797, -2.051432, 0.5607843, 1, 0, 1,
-0.7438329, -0.4549335, -2.169376, 0.5529412, 1, 0, 1,
-0.7365881, 0.08048125, -1.995143, 0.5490196, 1, 0, 1,
-0.7345867, -0.6708697, -2.526964, 0.5411765, 1, 0, 1,
-0.7309515, -1.88406, -3.115832, 0.5372549, 1, 0, 1,
-0.729446, -0.4717188, -1.907066, 0.5294118, 1, 0, 1,
-0.7293306, 0.1238038, -1.782186, 0.5254902, 1, 0, 1,
-0.7272699, 1.060908, -0.682082, 0.5176471, 1, 0, 1,
-0.7242821, 0.2662871, -2.020335, 0.5137255, 1, 0, 1,
-0.7137319, 0.4879788, -1.661406, 0.5058824, 1, 0, 1,
-0.7135248, -0.9806944, -2.283828, 0.5019608, 1, 0, 1,
-0.7133943, -0.3350336, -0.6750972, 0.4941176, 1, 0, 1,
-0.7128456, -0.6270768, -3.779901, 0.4862745, 1, 0, 1,
-0.7118455, -1.910351, -2.16776, 0.4823529, 1, 0, 1,
-0.7109644, 0.5061039, 0.1966461, 0.4745098, 1, 0, 1,
-0.7107915, -0.6202663, -2.631167, 0.4705882, 1, 0, 1,
-0.7102737, 1.111974, -0.9872776, 0.4627451, 1, 0, 1,
-0.7101173, -0.06576983, -1.05953, 0.4588235, 1, 0, 1,
-0.7087426, 1.307938, -0.2292724, 0.4509804, 1, 0, 1,
-0.7085195, 1.715959, 0.8287708, 0.4470588, 1, 0, 1,
-0.7064802, -0.01342181, -2.092053, 0.4392157, 1, 0, 1,
-0.7058651, -0.5283372, -3.23837, 0.4352941, 1, 0, 1,
-0.7020782, 0.7111623, -0.8761951, 0.427451, 1, 0, 1,
-0.6987538, 1.435149, 0.5238507, 0.4235294, 1, 0, 1,
-0.6954793, 0.3985065, 0.01314268, 0.4156863, 1, 0, 1,
-0.6896066, 1.16072, -1.397841, 0.4117647, 1, 0, 1,
-0.6876759, -0.2537287, -2.956903, 0.4039216, 1, 0, 1,
-0.6747726, -0.4759956, -3.15735, 0.3960784, 1, 0, 1,
-0.6655803, -0.7208917, -0.2771681, 0.3921569, 1, 0, 1,
-0.6577297, -0.1297019, -3.053953, 0.3843137, 1, 0, 1,
-0.6532489, 3.734733, 0.7763366, 0.3803922, 1, 0, 1,
-0.651911, -0.5908193, -3.023671, 0.372549, 1, 0, 1,
-0.6512196, -1.798333, -1.080653, 0.3686275, 1, 0, 1,
-0.6487939, -0.05426764, -1.838807, 0.3607843, 1, 0, 1,
-0.6482041, 1.325873, -0.5728793, 0.3568628, 1, 0, 1,
-0.6433136, -0.8594769, -2.792525, 0.3490196, 1, 0, 1,
-0.6418759, 0.433367, -1.64488, 0.345098, 1, 0, 1,
-0.6408101, -1.169372, -1.524715, 0.3372549, 1, 0, 1,
-0.6389027, 0.2064747, 0.7238916, 0.3333333, 1, 0, 1,
-0.6365598, 1.726904, -2.73203, 0.3254902, 1, 0, 1,
-0.6364146, 0.06064114, -0.6972895, 0.3215686, 1, 0, 1,
-0.6346692, 0.9969457, -0.301022, 0.3137255, 1, 0, 1,
-0.632071, 0.6760908, -2.250456, 0.3098039, 1, 0, 1,
-0.6303521, -0.43783, -2.224879, 0.3019608, 1, 0, 1,
-0.6299046, -0.7356256, -3.419217, 0.2941177, 1, 0, 1,
-0.6285621, -1.294739, -3.399579, 0.2901961, 1, 0, 1,
-0.6247722, -0.3828538, -3.058374, 0.282353, 1, 0, 1,
-0.6161965, 0.7951632, 0.04184967, 0.2784314, 1, 0, 1,
-0.6125376, -0.3253334, -3.017329, 0.2705882, 1, 0, 1,
-0.6114767, 0.9530423, -0.2838691, 0.2666667, 1, 0, 1,
-0.610487, 0.6159757, -1.625511, 0.2588235, 1, 0, 1,
-0.6077151, 0.2838143, -0.180171, 0.254902, 1, 0, 1,
-0.604656, 0.7293457, -1.053389, 0.2470588, 1, 0, 1,
-0.592063, -0.2369788, -1.734918, 0.2431373, 1, 0, 1,
-0.5915699, 0.1138552, -2.592635, 0.2352941, 1, 0, 1,
-0.5899919, -0.9370419, -2.385163, 0.2313726, 1, 0, 1,
-0.5892957, 1.416443, -0.7644837, 0.2235294, 1, 0, 1,
-0.5854834, 0.1668253, -1.465798, 0.2196078, 1, 0, 1,
-0.5825078, 0.1439234, -0.147026, 0.2117647, 1, 0, 1,
-0.5727476, -1.538211, -1.972056, 0.2078431, 1, 0, 1,
-0.5703928, 0.04901102, -1.626976, 0.2, 1, 0, 1,
-0.5701893, -0.8876758, -2.269052, 0.1921569, 1, 0, 1,
-0.5655805, -0.7120316, -2.652071, 0.1882353, 1, 0, 1,
-0.5607781, 0.742195, -0.8670968, 0.1803922, 1, 0, 1,
-0.5600947, -0.460903, -3.554532, 0.1764706, 1, 0, 1,
-0.5599148, 0.02353105, -1.306321, 0.1686275, 1, 0, 1,
-0.5542506, 0.7075663, -0.6180822, 0.1647059, 1, 0, 1,
-0.5536555, -0.5526977, -0.8025191, 0.1568628, 1, 0, 1,
-0.5499989, 2.035379, -0.2978604, 0.1529412, 1, 0, 1,
-0.5482528, -0.04303522, -2.280411, 0.145098, 1, 0, 1,
-0.5460519, -0.7093287, -4.057262, 0.1411765, 1, 0, 1,
-0.5441264, -0.2434888, -2.634866, 0.1333333, 1, 0, 1,
-0.5408696, -0.1841809, -3.046494, 0.1294118, 1, 0, 1,
-0.5407346, -0.03900598, -1.325548, 0.1215686, 1, 0, 1,
-0.5406122, -1.104197, -1.772822, 0.1176471, 1, 0, 1,
-0.5370601, 0.3920656, -0.0352014, 0.1098039, 1, 0, 1,
-0.5357521, -1.458334, -0.4058034, 0.1058824, 1, 0, 1,
-0.5334957, -1.726803, -1.591637, 0.09803922, 1, 0, 1,
-0.5322555, -0.6642655, -1.109629, 0.09019608, 1, 0, 1,
-0.5285109, 0.7538605, -0.2145839, 0.08627451, 1, 0, 1,
-0.5248054, 0.8397756, -0.7015728, 0.07843138, 1, 0, 1,
-0.5246629, -0.1711263, -2.293714, 0.07450981, 1, 0, 1,
-0.523091, -0.4332803, -3.521078, 0.06666667, 1, 0, 1,
-0.5216892, 0.5530587, -0.7605172, 0.0627451, 1, 0, 1,
-0.5183634, -0.6613547, -1.493598, 0.05490196, 1, 0, 1,
-0.5178995, -0.04215061, -2.231136, 0.05098039, 1, 0, 1,
-0.5144027, -1.669991, -2.801877, 0.04313726, 1, 0, 1,
-0.5131753, 1.619717, -0.530884, 0.03921569, 1, 0, 1,
-0.5058016, -1.504367, -3.910276, 0.03137255, 1, 0, 1,
-0.5025414, 0.475915, -0.2157278, 0.02745098, 1, 0, 1,
-0.4980867, 0.2631735, -3.333822, 0.01960784, 1, 0, 1,
-0.4972428, 0.6893056, -0.084202, 0.01568628, 1, 0, 1,
-0.496177, 1.049516, -0.7056786, 0.007843138, 1, 0, 1,
-0.4912346, -0.6309842, -2.81692, 0.003921569, 1, 0, 1,
-0.4806707, 0.05747326, -0.2278049, 0, 1, 0.003921569, 1,
-0.4784315, 0.06471725, -0.7887027, 0, 1, 0.01176471, 1,
-0.4766811, 0.9011934, 0.7153283, 0, 1, 0.01568628, 1,
-0.4763702, 0.06188505, -2.071468, 0, 1, 0.02352941, 1,
-0.4740494, -0.6736218, -2.70304, 0, 1, 0.02745098, 1,
-0.472286, 0.3906919, -1.706621, 0, 1, 0.03529412, 1,
-0.4665841, 1.128677, -0.1202522, 0, 1, 0.03921569, 1,
-0.4641225, -0.3434877, -0.8384488, 0, 1, 0.04705882, 1,
-0.4607051, -0.9142829, -2.141205, 0, 1, 0.05098039, 1,
-0.4568036, 0.38887, -1.112531, 0, 1, 0.05882353, 1,
-0.4552245, 0.6979889, 0.2339001, 0, 1, 0.0627451, 1,
-0.4520266, -0.6893398, -2.353017, 0, 1, 0.07058824, 1,
-0.451154, 0.5478437, -1.668267, 0, 1, 0.07450981, 1,
-0.4491075, -0.8568402, -2.392846, 0, 1, 0.08235294, 1,
-0.447891, 0.7971771, -1.029686, 0, 1, 0.08627451, 1,
-0.4441281, -2.839324, -2.474222, 0, 1, 0.09411765, 1,
-0.4414917, -1.798936, -2.080014, 0, 1, 0.1019608, 1,
-0.4382796, -0.710669, -4.654706, 0, 1, 0.1058824, 1,
-0.4382219, 1.177119, -2.107439, 0, 1, 0.1137255, 1,
-0.4367625, -0.3346441, -1.911193, 0, 1, 0.1176471, 1,
-0.4363717, -2.067432, -2.600739, 0, 1, 0.1254902, 1,
-0.4307971, 0.4495438, -0.6981267, 0, 1, 0.1294118, 1,
-0.4298839, -1.646766, -4.457644, 0, 1, 0.1372549, 1,
-0.4240994, -0.1767712, -2.425729, 0, 1, 0.1411765, 1,
-0.4192046, -0.3946799, -2.029073, 0, 1, 0.1490196, 1,
-0.4179134, 1.558489, -0.9949586, 0, 1, 0.1529412, 1,
-0.4133575, -0.5323055, -3.11177, 0, 1, 0.1607843, 1,
-0.412154, 0.3215187, -2.642162, 0, 1, 0.1647059, 1,
-0.4117219, 0.2123875, -1.134963, 0, 1, 0.172549, 1,
-0.4054505, -1.112227, -3.296078, 0, 1, 0.1764706, 1,
-0.4047985, -2.533003, -4.446095, 0, 1, 0.1843137, 1,
-0.4043966, 0.9741411, -0.5693383, 0, 1, 0.1882353, 1,
-0.399906, 0.7955991, -2.067018, 0, 1, 0.1960784, 1,
-0.3885537, -0.398185, -3.207837, 0, 1, 0.2039216, 1,
-0.387891, -1.493567, -1.311802, 0, 1, 0.2078431, 1,
-0.3850286, -2.41201, -3.132854, 0, 1, 0.2156863, 1,
-0.3795111, 0.5935979, 0.646833, 0, 1, 0.2196078, 1,
-0.3788983, -2.001225, -2.444964, 0, 1, 0.227451, 1,
-0.3770041, 0.4547619, -0.5768826, 0, 1, 0.2313726, 1,
-0.3709562, 0.6514744, -0.03250766, 0, 1, 0.2392157, 1,
-0.3624354, 0.4062573, 1.026656, 0, 1, 0.2431373, 1,
-0.3594677, -2.373782, -1.753991, 0, 1, 0.2509804, 1,
-0.3556983, 1.20428, 0.0654905, 0, 1, 0.254902, 1,
-0.3547949, 0.317049, 0.2430696, 0, 1, 0.2627451, 1,
-0.349099, 0.02996002, -0.7709374, 0, 1, 0.2666667, 1,
-0.3484522, -1.027075, -3.924395, 0, 1, 0.2745098, 1,
-0.3460356, -1.241369, -1.597026, 0, 1, 0.2784314, 1,
-0.3444229, -1.140742, -3.60824, 0, 1, 0.2862745, 1,
-0.344341, -0.6887919, -3.738989, 0, 1, 0.2901961, 1,
-0.343397, 0.433131, -0.3789346, 0, 1, 0.2980392, 1,
-0.3397439, 0.2350468, -1.007471, 0, 1, 0.3058824, 1,
-0.3390638, -2.11884, -3.143132, 0, 1, 0.3098039, 1,
-0.3347174, 1.098712, -2.018284, 0, 1, 0.3176471, 1,
-0.3273635, -0.7572891, -2.00158, 0, 1, 0.3215686, 1,
-0.3263083, -0.3838943, -2.373741, 0, 1, 0.3294118, 1,
-0.313208, -0.005137756, -0.9337967, 0, 1, 0.3333333, 1,
-0.3131112, -0.7028173, -2.003867, 0, 1, 0.3411765, 1,
-0.3119981, 0.1499963, -0.1949749, 0, 1, 0.345098, 1,
-0.3115411, -2.055694, -2.687582, 0, 1, 0.3529412, 1,
-0.3102604, 0.7269329, -0.7562099, 0, 1, 0.3568628, 1,
-0.3066336, 0.7710195, -0.9476002, 0, 1, 0.3647059, 1,
-0.305685, 0.02996132, -1.669937, 0, 1, 0.3686275, 1,
-0.3016143, 0.134317, 0.1235596, 0, 1, 0.3764706, 1,
-0.3013617, -0.8417354, -2.815921, 0, 1, 0.3803922, 1,
-0.296531, 0.2819505, -0.2692985, 0, 1, 0.3882353, 1,
-0.289693, -1.318486, -2.206944, 0, 1, 0.3921569, 1,
-0.286313, -1.065826, -1.843932, 0, 1, 0.4, 1,
-0.2846079, 0.5972657, -0.821983, 0, 1, 0.4078431, 1,
-0.2831414, 1.646726, 0.3410246, 0, 1, 0.4117647, 1,
-0.2820942, -0.6938509, -1.779719, 0, 1, 0.4196078, 1,
-0.2791011, -0.9182526, -2.580185, 0, 1, 0.4235294, 1,
-0.2750182, -1.396992, -2.842066, 0, 1, 0.4313726, 1,
-0.2748167, -1.166025, -3.265069, 0, 1, 0.4352941, 1,
-0.2723044, 1.205222, -0.6547821, 0, 1, 0.4431373, 1,
-0.2677052, -0.3315204, -3.013604, 0, 1, 0.4470588, 1,
-0.2651189, -0.2546384, -2.207001, 0, 1, 0.454902, 1,
-0.2631501, -0.6574191, -2.985962, 0, 1, 0.4588235, 1,
-0.260354, -0.9566596, -4.742966, 0, 1, 0.4666667, 1,
-0.2533717, 0.5370932, -0.1590126, 0, 1, 0.4705882, 1,
-0.2451378, -0.06897572, -3.174732, 0, 1, 0.4784314, 1,
-0.2450131, 1.117029, 0.7269354, 0, 1, 0.4823529, 1,
-0.2425286, -1.824281, -1.77145, 0, 1, 0.4901961, 1,
-0.2398733, 1.826025, -0.489211, 0, 1, 0.4941176, 1,
-0.2382694, 1.276697, 0.3481412, 0, 1, 0.5019608, 1,
-0.2332061, 0.7228366, -1.701048, 0, 1, 0.509804, 1,
-0.2330198, -0.7647008, -1.849924, 0, 1, 0.5137255, 1,
-0.2312928, -0.2400685, -1.309403, 0, 1, 0.5215687, 1,
-0.2312728, 0.3172501, -0.5639766, 0, 1, 0.5254902, 1,
-0.2301033, 0.680789, -0.3409453, 0, 1, 0.5333334, 1,
-0.2293439, -0.7423831, -2.088643, 0, 1, 0.5372549, 1,
-0.2292434, -0.09755289, -1.531897, 0, 1, 0.5450981, 1,
-0.2277789, 1.605993, 0.1043168, 0, 1, 0.5490196, 1,
-0.2265616, 0.3659955, -0.1535345, 0, 1, 0.5568628, 1,
-0.2240034, -0.9546403, -3.331335, 0, 1, 0.5607843, 1,
-0.2105231, 1.593679, -1.554628, 0, 1, 0.5686275, 1,
-0.2024436, 2.28729, -0.4164772, 0, 1, 0.572549, 1,
-0.2001447, -0.6770858, -4.108939, 0, 1, 0.5803922, 1,
-0.1959182, 1.02333, -0.4632526, 0, 1, 0.5843138, 1,
-0.1932123, -0.6747057, -0.5383071, 0, 1, 0.5921569, 1,
-0.1772733, -0.2943914, -0.5739741, 0, 1, 0.5960785, 1,
-0.1756886, -1.410033, -2.003986, 0, 1, 0.6039216, 1,
-0.1737044, 0.2973952, -0.3771614, 0, 1, 0.6117647, 1,
-0.1668155, 2.107676, -0.6305814, 0, 1, 0.6156863, 1,
-0.165553, -0.2307812, -1.988935, 0, 1, 0.6235294, 1,
-0.1624893, -1.834355, -3.935001, 0, 1, 0.627451, 1,
-0.1608427, -0.1545584, -2.947453, 0, 1, 0.6352941, 1,
-0.1595202, -2.443864, -3.453275, 0, 1, 0.6392157, 1,
-0.1576135, -1.170547, -2.365845, 0, 1, 0.6470588, 1,
-0.1571315, 1.550631, -0.6808744, 0, 1, 0.6509804, 1,
-0.1564768, 0.5041098, 0.3933654, 0, 1, 0.6588235, 1,
-0.1532235, 0.9016733, 1.696702, 0, 1, 0.6627451, 1,
-0.151694, -0.02446546, -0.6680656, 0, 1, 0.6705883, 1,
-0.1472376, -1.542886, -2.864941, 0, 1, 0.6745098, 1,
-0.1452265, 1.322858, 0.02507671, 0, 1, 0.682353, 1,
-0.1415518, 0.272901, -0.9722113, 0, 1, 0.6862745, 1,
-0.1361505, 0.06148807, -1.779648, 0, 1, 0.6941177, 1,
-0.1334014, 0.08510434, -1.451229, 0, 1, 0.7019608, 1,
-0.133012, -0.7589356, -1.058391, 0, 1, 0.7058824, 1,
-0.1322616, 1.170943, 1.47869, 0, 1, 0.7137255, 1,
-0.1296226, -0.4661154, -3.846205, 0, 1, 0.7176471, 1,
-0.1279702, -0.6467203, -4.496276, 0, 1, 0.7254902, 1,
-0.1266547, 1.425214, -0.3597907, 0, 1, 0.7294118, 1,
-0.1237715, 0.4276734, -0.1816411, 0, 1, 0.7372549, 1,
-0.1190741, -0.4794197, -3.516569, 0, 1, 0.7411765, 1,
-0.1174489, -1.602888, -1.982667, 0, 1, 0.7490196, 1,
-0.1165717, 1.29713, -0.4186221, 0, 1, 0.7529412, 1,
-0.1154819, -0.658817, -3.261322, 0, 1, 0.7607843, 1,
-0.1151655, 0.5389628, -1.043075, 0, 1, 0.7647059, 1,
-0.107121, 0.7647635, -0.2951464, 0, 1, 0.772549, 1,
-0.1048776, 0.3668855, 0.3695984, 0, 1, 0.7764706, 1,
-0.1045801, -0.004299223, -0.2394316, 0, 1, 0.7843137, 1,
-0.1019135, -0.09700118, -2.554801, 0, 1, 0.7882353, 1,
-0.09325602, 1.020002, 0.3469633, 0, 1, 0.7960784, 1,
-0.09302285, -0.472211, -2.495722, 0, 1, 0.8039216, 1,
-0.09276789, -0.8355787, -1.987435, 0, 1, 0.8078431, 1,
-0.0919015, 0.6891346, -0.6133503, 0, 1, 0.8156863, 1,
-0.08953992, 0.9304429, 1.930604, 0, 1, 0.8196079, 1,
-0.08707372, 0.6541101, -2.726145, 0, 1, 0.827451, 1,
-0.0824642, 1.112429, -0.1439084, 0, 1, 0.8313726, 1,
-0.08133038, 0.02251862, -0.1006559, 0, 1, 0.8392157, 1,
-0.07903638, 0.7785959, -1.643665, 0, 1, 0.8431373, 1,
-0.07746439, 0.7869806, 0.3675256, 0, 1, 0.8509804, 1,
-0.07648467, 2.111459, 0.5944139, 0, 1, 0.854902, 1,
-0.07271306, -0.4916781, -5.594118, 0, 1, 0.8627451, 1,
-0.07245703, 0.2955813, 0.7224619, 0, 1, 0.8666667, 1,
-0.07221386, 0.09845056, 1.874029, 0, 1, 0.8745098, 1,
-0.0669257, 2.960954, 0.9841312, 0, 1, 0.8784314, 1,
-0.06474663, 0.7776154, -0.8200149, 0, 1, 0.8862745, 1,
-0.06150154, 1.666941, -0.2802643, 0, 1, 0.8901961, 1,
-0.06110896, -0.5763896, -3.188127, 0, 1, 0.8980392, 1,
-0.06078675, 0.6977726, -1.58307, 0, 1, 0.9058824, 1,
-0.06042932, -0.1285737, -2.673506, 0, 1, 0.9098039, 1,
-0.05983777, 0.2103283, -1.443292, 0, 1, 0.9176471, 1,
-0.05509687, -0.5198581, -2.27785, 0, 1, 0.9215686, 1,
-0.05333076, 1.449524, 2.538101, 0, 1, 0.9294118, 1,
-0.05245599, -1.49856, -3.171272, 0, 1, 0.9333333, 1,
-0.0456329, 1.226307, 0.6564438, 0, 1, 0.9411765, 1,
-0.04496743, 0.1310797, 1.25482, 0, 1, 0.945098, 1,
-0.04303122, -0.7598948, -4.374812, 0, 1, 0.9529412, 1,
-0.04252017, -0.6892659, -4.035397, 0, 1, 0.9568627, 1,
-0.03896539, 0.6689467, 0.1916914, 0, 1, 0.9647059, 1,
-0.03806574, 0.2303683, -0.6451841, 0, 1, 0.9686275, 1,
-0.03800163, 0.1884751, -1.292388, 0, 1, 0.9764706, 1,
-0.03766512, -1.209056, -2.929574, 0, 1, 0.9803922, 1,
-0.03479552, -0.06203174, -1.638547, 0, 1, 0.9882353, 1,
-0.02678158, -0.6156127, -1.952972, 0, 1, 0.9921569, 1,
-0.02536551, 0.9378256, 0.6406372, 0, 1, 1, 1,
-0.02268914, -0.876827, -3.844587, 0, 0.9921569, 1, 1,
-0.02250395, -0.05338818, -2.991021, 0, 0.9882353, 1, 1,
-0.02042441, -1.121989, -3.920578, 0, 0.9803922, 1, 1,
-0.01963573, -0.8826427, -1.027112, 0, 0.9764706, 1, 1,
-0.0165592, 0.2913205, -1.420038, 0, 0.9686275, 1, 1,
-0.01432804, -0.3072239, -3.022938, 0, 0.9647059, 1, 1,
-0.01393499, -0.6378636, -2.034711, 0, 0.9568627, 1, 1,
-0.01387277, 0.2732158, 0.3590082, 0, 0.9529412, 1, 1,
-0.008469127, -0.4162558, -2.770145, 0, 0.945098, 1, 1,
-0.00802608, 0.9144677, 0.1812722, 0, 0.9411765, 1, 1,
-0.007843926, 2.69232, -0.5871113, 0, 0.9333333, 1, 1,
-0.004882049, -0.179244, -3.881233, 0, 0.9294118, 1, 1,
0.001327591, -0.6790013, 3.140897, 0, 0.9215686, 1, 1,
0.001528387, -1.689399, 4.373576, 0, 0.9176471, 1, 1,
0.0130522, 1.621025, -0.1394193, 0, 0.9098039, 1, 1,
0.01362574, 0.338047, 0.3812562, 0, 0.9058824, 1, 1,
0.01620995, -0.4165812, 5.209407, 0, 0.8980392, 1, 1,
0.02007754, 0.1397029, -0.8867616, 0, 0.8901961, 1, 1,
0.02163131, -0.6536645, 2.02593, 0, 0.8862745, 1, 1,
0.02370364, 1.722136, -0.4612303, 0, 0.8784314, 1, 1,
0.02421684, 0.5148077, -1.007639, 0, 0.8745098, 1, 1,
0.02883809, -1.610872, 3.246902, 0, 0.8666667, 1, 1,
0.02985109, -2.233357, 3.864615, 0, 0.8627451, 1, 1,
0.03244836, -1.814148, 2.451769, 0, 0.854902, 1, 1,
0.03815334, -0.2433029, 3.407059, 0, 0.8509804, 1, 1,
0.0383243, 0.8115085, 0.9055301, 0, 0.8431373, 1, 1,
0.0425071, 0.5666355, 0.03503571, 0, 0.8392157, 1, 1,
0.04443412, -0.2176516, 1.953752, 0, 0.8313726, 1, 1,
0.0493519, -0.7339701, 3.781956, 0, 0.827451, 1, 1,
0.04980185, 0.3601819, -0.5674381, 0, 0.8196079, 1, 1,
0.0504746, 1.187022, -0.766763, 0, 0.8156863, 1, 1,
0.05956741, -0.07898302, 1.96966, 0, 0.8078431, 1, 1,
0.06095524, 1.501028, 0.8106981, 0, 0.8039216, 1, 1,
0.06243618, 1.365748, -1.137503, 0, 0.7960784, 1, 1,
0.06603795, 1.749775, 0.9567237, 0, 0.7882353, 1, 1,
0.06612509, 1.389023, 1.200491, 0, 0.7843137, 1, 1,
0.06841478, 1.8831, -0.5972411, 0, 0.7764706, 1, 1,
0.06857254, 0.2221137, 1.866994, 0, 0.772549, 1, 1,
0.07065155, 0.5543042, -0.2697237, 0, 0.7647059, 1, 1,
0.07107512, 0.5970886, -1.011568, 0, 0.7607843, 1, 1,
0.07377049, -0.5692264, 2.327478, 0, 0.7529412, 1, 1,
0.07613286, -0.1608997, 2.557351, 0, 0.7490196, 1, 1,
0.07945628, -0.6914118, 3.992035, 0, 0.7411765, 1, 1,
0.08008596, -0.9537947, 2.095851, 0, 0.7372549, 1, 1,
0.08063182, 0.1475484, -0.874802, 0, 0.7294118, 1, 1,
0.08202962, -2.084196, 1.700845, 0, 0.7254902, 1, 1,
0.08259858, -1.317804, 2.6827, 0, 0.7176471, 1, 1,
0.08427965, 0.9454383, 0.1324172, 0, 0.7137255, 1, 1,
0.08541849, 0.1514989, 1.620894, 0, 0.7058824, 1, 1,
0.08729376, 0.5980825, -0.2720295, 0, 0.6980392, 1, 1,
0.09046466, 1.604339, 0.9463443, 0, 0.6941177, 1, 1,
0.0948066, -0.06613111, 2.562529, 0, 0.6862745, 1, 1,
0.1084052, 0.2317818, -0.7686725, 0, 0.682353, 1, 1,
0.111922, 0.2806343, 1.316962, 0, 0.6745098, 1, 1,
0.1158859, 0.6701012, -0.6134681, 0, 0.6705883, 1, 1,
0.1212189, -1.06487, 3.542529, 0, 0.6627451, 1, 1,
0.1252422, 0.9734551, 0.3643142, 0, 0.6588235, 1, 1,
0.1261899, 0.09848488, 0.7803993, 0, 0.6509804, 1, 1,
0.1272388, 0.453869, 2.392355, 0, 0.6470588, 1, 1,
0.1348873, 1.686706, -1.039579, 0, 0.6392157, 1, 1,
0.138608, 2.029212, -1.352407, 0, 0.6352941, 1, 1,
0.1399255, 0.9958537, -0.4646873, 0, 0.627451, 1, 1,
0.1435422, 1.283815, 0.5955662, 0, 0.6235294, 1, 1,
0.1436824, -0.2885712, 3.196489, 0, 0.6156863, 1, 1,
0.1458068, -1.182819, 1.11992, 0, 0.6117647, 1, 1,
0.1470391, -0.6859791, 3.043232, 0, 0.6039216, 1, 1,
0.1501514, 0.8122009, -0.3788268, 0, 0.5960785, 1, 1,
0.1538895, 1.370245, 0.4797716, 0, 0.5921569, 1, 1,
0.1562968, -1.221291, 3.230373, 0, 0.5843138, 1, 1,
0.1605807, -0.03440721, 0.3321273, 0, 0.5803922, 1, 1,
0.1610799, 0.3663872, 2.299215, 0, 0.572549, 1, 1,
0.1617557, 1.713864, 0.8266042, 0, 0.5686275, 1, 1,
0.1620431, -0.287976, 4.179816, 0, 0.5607843, 1, 1,
0.1623495, 0.1853064, -0.5085039, 0, 0.5568628, 1, 1,
0.1635516, -0.9679276, 4.496955, 0, 0.5490196, 1, 1,
0.1648425, -0.1142579, 3.013943, 0, 0.5450981, 1, 1,
0.1651402, 0.5439405, 0.02357575, 0, 0.5372549, 1, 1,
0.1654328, 0.32622, 0.9665511, 0, 0.5333334, 1, 1,
0.1744943, 0.1385857, 0.1719436, 0, 0.5254902, 1, 1,
0.1755924, -0.08706146, 3.376845, 0, 0.5215687, 1, 1,
0.177404, -0.5772615, 2.089976, 0, 0.5137255, 1, 1,
0.1845181, -1.253381, 2.110295, 0, 0.509804, 1, 1,
0.1856256, 0.3635751, 0.4788828, 0, 0.5019608, 1, 1,
0.187785, 0.5684528, 1.194635, 0, 0.4941176, 1, 1,
0.1895068, 0.4673834, 0.6423263, 0, 0.4901961, 1, 1,
0.1899676, 0.7961376, -0.7169502, 0, 0.4823529, 1, 1,
0.1918922, -1.243385, 2.730464, 0, 0.4784314, 1, 1,
0.195525, -0.8625447, 4.600125, 0, 0.4705882, 1, 1,
0.1967326, 1.53163, -1.176586, 0, 0.4666667, 1, 1,
0.199916, 0.5583683, 1.716887, 0, 0.4588235, 1, 1,
0.2006649, -0.2205563, 0.8548641, 0, 0.454902, 1, 1,
0.202529, -1.366674, 3.588671, 0, 0.4470588, 1, 1,
0.2062462, -0.3898014, 2.588602, 0, 0.4431373, 1, 1,
0.2064978, -0.8807539, 2.291202, 0, 0.4352941, 1, 1,
0.2074701, -0.5518938, 3.235969, 0, 0.4313726, 1, 1,
0.2138486, 1.865933, 0.61897, 0, 0.4235294, 1, 1,
0.2139753, -1.980667, 2.03373, 0, 0.4196078, 1, 1,
0.2145008, 1.965004, -0.2020254, 0, 0.4117647, 1, 1,
0.2241923, 0.5076702, 1.146593, 0, 0.4078431, 1, 1,
0.2247715, -0.4552215, 3.549428, 0, 0.4, 1, 1,
0.2252178, -0.1685109, 3.255132, 0, 0.3921569, 1, 1,
0.2253326, 0.4334183, -0.5090523, 0, 0.3882353, 1, 1,
0.226068, 0.1161071, 1.620009, 0, 0.3803922, 1, 1,
0.2288871, 0.1987074, 1.222811, 0, 0.3764706, 1, 1,
0.2302866, -0.9319874, 2.852062, 0, 0.3686275, 1, 1,
0.2308271, 1.055803, 0.8259844, 0, 0.3647059, 1, 1,
0.2316889, 0.2166324, 0.8687775, 0, 0.3568628, 1, 1,
0.237009, -0.1211486, 1.775196, 0, 0.3529412, 1, 1,
0.2372997, -0.8596908, 3.615929, 0, 0.345098, 1, 1,
0.2403124, 0.8080689, -3.364379, 0, 0.3411765, 1, 1,
0.2405806, -0.6851949, 3.789714, 0, 0.3333333, 1, 1,
0.2411253, 0.3041108, 3.095273, 0, 0.3294118, 1, 1,
0.2459663, -0.459223, 2.529596, 0, 0.3215686, 1, 1,
0.2482509, 0.3085086, 1.047597, 0, 0.3176471, 1, 1,
0.2504101, 0.8662738, -0.8320603, 0, 0.3098039, 1, 1,
0.2558751, 0.4348746, 2.187598, 0, 0.3058824, 1, 1,
0.2558933, 1.473514, 0.8689769, 0, 0.2980392, 1, 1,
0.2560681, -0.4249034, 0.09053902, 0, 0.2901961, 1, 1,
0.2614634, 0.6696599, 0.8274036, 0, 0.2862745, 1, 1,
0.2630319, -0.175869, 0.5755093, 0, 0.2784314, 1, 1,
0.2636945, 1.671489, -1.011997, 0, 0.2745098, 1, 1,
0.2651537, 0.6958396, 1.531719, 0, 0.2666667, 1, 1,
0.2651949, -0.4017666, 2.31202, 0, 0.2627451, 1, 1,
0.2666299, 0.2231152, 0.3099209, 0, 0.254902, 1, 1,
0.2693325, 2.386813, 0.06158583, 0, 0.2509804, 1, 1,
0.2696798, -0.8675364, 4.530204, 0, 0.2431373, 1, 1,
0.2742725, 0.6644288, 0.2020403, 0, 0.2392157, 1, 1,
0.2744016, -0.2321547, 3.243169, 0, 0.2313726, 1, 1,
0.2826233, -0.3327438, 1.928466, 0, 0.227451, 1, 1,
0.2845142, -0.6592846, 3.542379, 0, 0.2196078, 1, 1,
0.2870434, -2.053141, 3.968087, 0, 0.2156863, 1, 1,
0.2921723, -2.440759, 3.040483, 0, 0.2078431, 1, 1,
0.2928784, -0.5890074, 2.017531, 0, 0.2039216, 1, 1,
0.2969624, -2.227206, 3.70969, 0, 0.1960784, 1, 1,
0.2993986, 0.1449181, -0.5577303, 0, 0.1882353, 1, 1,
0.3025045, -0.9341438, 1.726993, 0, 0.1843137, 1, 1,
0.3045045, 0.05446627, 2.466403, 0, 0.1764706, 1, 1,
0.3058892, -1.972932, 0.9446691, 0, 0.172549, 1, 1,
0.3069603, 0.8760347, -0.2334474, 0, 0.1647059, 1, 1,
0.3077196, 2.099924, 0.7612792, 0, 0.1607843, 1, 1,
0.3093995, -0.6219029, 3.368357, 0, 0.1529412, 1, 1,
0.3140022, -0.7199404, 2.084075, 0, 0.1490196, 1, 1,
0.3198839, 0.6156118, 0.4303457, 0, 0.1411765, 1, 1,
0.3223524, 0.2478356, 0.4550658, 0, 0.1372549, 1, 1,
0.3296984, 0.1623994, 0.91333, 0, 0.1294118, 1, 1,
0.3311402, 0.5376348, 0.3114789, 0, 0.1254902, 1, 1,
0.3324637, 0.2112844, 0.707768, 0, 0.1176471, 1, 1,
0.3331441, 0.7542639, 1.455932, 0, 0.1137255, 1, 1,
0.3347748, 0.2564042, 1.038572, 0, 0.1058824, 1, 1,
0.3351071, -0.5434359, 4.041404, 0, 0.09803922, 1, 1,
0.3357254, 2.276295, -0.4170727, 0, 0.09411765, 1, 1,
0.3373503, 0.7191069, -0.7238669, 0, 0.08627451, 1, 1,
0.338928, 0.3673787, 0.02549761, 0, 0.08235294, 1, 1,
0.3390599, 0.07306055, 1.901863, 0, 0.07450981, 1, 1,
0.339119, -0.04836945, 0.3168381, 0, 0.07058824, 1, 1,
0.344008, -0.6356008, 2.945498, 0, 0.0627451, 1, 1,
0.3561197, -1.052195, 3.374423, 0, 0.05882353, 1, 1,
0.3617518, 0.3839908, -1.157979, 0, 0.05098039, 1, 1,
0.3635134, 0.9105994, 0.2394493, 0, 0.04705882, 1, 1,
0.3642432, 1.181436, -0.8068218, 0, 0.03921569, 1, 1,
0.3651337, 0.1464538, 0.5804756, 0, 0.03529412, 1, 1,
0.3670065, 1.591182, 0.6649071, 0, 0.02745098, 1, 1,
0.3763372, 0.2364302, 1.647567, 0, 0.02352941, 1, 1,
0.3817881, 1.573927, 0.935045, 0, 0.01568628, 1, 1,
0.3830603, -1.45868, 4.052122, 0, 0.01176471, 1, 1,
0.3861187, -0.08974671, 1.943329, 0, 0.003921569, 1, 1,
0.387991, -1.051387, 3.838414, 0.003921569, 0, 1, 1,
0.3901429, -1.188156, 4.905943, 0.007843138, 0, 1, 1,
0.3937834, 0.7339432, 1.759319, 0.01568628, 0, 1, 1,
0.3956246, 0.7669228, 0.4179676, 0.01960784, 0, 1, 1,
0.3957474, -0.5694793, 4.252554, 0.02745098, 0, 1, 1,
0.3989869, 1.069678, -0.4588879, 0.03137255, 0, 1, 1,
0.4015054, -0.4267737, 2.020777, 0.03921569, 0, 1, 1,
0.4031808, 0.6230091, 1.669268, 0.04313726, 0, 1, 1,
0.4063255, -1.607528, 1.843479, 0.05098039, 0, 1, 1,
0.4116952, -0.1236984, 3.653219, 0.05490196, 0, 1, 1,
0.4147182, -0.9145042, 3.320496, 0.0627451, 0, 1, 1,
0.4205021, 0.4612613, 1.076849, 0.06666667, 0, 1, 1,
0.4223717, 0.1364766, -0.4467134, 0.07450981, 0, 1, 1,
0.4262, 0.1198937, 0.4142483, 0.07843138, 0, 1, 1,
0.4294733, -0.3952776, 2.877927, 0.08627451, 0, 1, 1,
0.4298561, -0.8420178, 3.226363, 0.09019608, 0, 1, 1,
0.4304816, -0.3409962, 3.052682, 0.09803922, 0, 1, 1,
0.4350021, 0.4537823, 0.9696397, 0.1058824, 0, 1, 1,
0.4405001, -0.7993247, 2.246254, 0.1098039, 0, 1, 1,
0.4414659, -0.06731184, 0.6205218, 0.1176471, 0, 1, 1,
0.4417126, 0.03126737, 1.299639, 0.1215686, 0, 1, 1,
0.4457602, -0.1430817, 1.38143, 0.1294118, 0, 1, 1,
0.4459563, 0.2298034, -0.3188384, 0.1333333, 0, 1, 1,
0.4461434, -0.7863935, 2.653759, 0.1411765, 0, 1, 1,
0.4487707, 1.649298, 0.03448676, 0.145098, 0, 1, 1,
0.450967, 1.768665, 2.385817, 0.1529412, 0, 1, 1,
0.4525562, 0.5001335, 1.293567, 0.1568628, 0, 1, 1,
0.4544805, -0.0002585428, 1.347918, 0.1647059, 0, 1, 1,
0.4648375, -1.122215, 3.667598, 0.1686275, 0, 1, 1,
0.464843, 0.9056463, -0.4282882, 0.1764706, 0, 1, 1,
0.4649337, 0.6655853, 1.631575, 0.1803922, 0, 1, 1,
0.4650832, 0.4399921, -1.258686, 0.1882353, 0, 1, 1,
0.4672364, -1.195564, 3.480778, 0.1921569, 0, 1, 1,
0.4712215, -0.9223494, 1.542714, 0.2, 0, 1, 1,
0.4719862, 0.5817101, -0.558587, 0.2078431, 0, 1, 1,
0.472708, 0.0297814, 4.85004, 0.2117647, 0, 1, 1,
0.4798775, 0.1851301, 0.8629959, 0.2196078, 0, 1, 1,
0.481486, 0.4425232, 0.5767695, 0.2235294, 0, 1, 1,
0.4814915, 0.4514272, -0.2603402, 0.2313726, 0, 1, 1,
0.4817334, -0.02344666, 2.265149, 0.2352941, 0, 1, 1,
0.4823027, -1.201209, 0.8089628, 0.2431373, 0, 1, 1,
0.4829972, 1.432016, 0.8176089, 0.2470588, 0, 1, 1,
0.4947064, 0.1567497, 2.039968, 0.254902, 0, 1, 1,
0.4953085, 0.6704642, -0.1296291, 0.2588235, 0, 1, 1,
0.4961571, 1.636738, -1.046967, 0.2666667, 0, 1, 1,
0.4961738, -0.3873015, 3.252583, 0.2705882, 0, 1, 1,
0.5052497, -0.6266268, 1.560868, 0.2784314, 0, 1, 1,
0.5065522, 0.2514524, -0.110322, 0.282353, 0, 1, 1,
0.5089232, -0.720444, 2.563981, 0.2901961, 0, 1, 1,
0.5127794, 0.1589609, 1.939142, 0.2941177, 0, 1, 1,
0.5144179, -2.721934, 3.869171, 0.3019608, 0, 1, 1,
0.5244617, 1.256378, 1.214241, 0.3098039, 0, 1, 1,
0.5259972, 1.451476, 0.2843622, 0.3137255, 0, 1, 1,
0.5290115, -0.8231207, 3.152883, 0.3215686, 0, 1, 1,
0.5315465, 0.001521128, -0.4441178, 0.3254902, 0, 1, 1,
0.5409687, -0.02972792, 2.947401, 0.3333333, 0, 1, 1,
0.5433388, -1.666512, 2.972107, 0.3372549, 0, 1, 1,
0.5457317, -1.229568, 0.6558797, 0.345098, 0, 1, 1,
0.5457496, 0.2013814, 2.465832, 0.3490196, 0, 1, 1,
0.5460842, 0.1749241, 1.800972, 0.3568628, 0, 1, 1,
0.5501904, -0.8619539, 5.178534, 0.3607843, 0, 1, 1,
0.5513993, 1.82345, 1.704547, 0.3686275, 0, 1, 1,
0.5613005, -1.195575, 1.407403, 0.372549, 0, 1, 1,
0.5663015, -0.1485796, 0.5365804, 0.3803922, 0, 1, 1,
0.5702361, 0.9950233, -1.035256, 0.3843137, 0, 1, 1,
0.570752, 0.3229264, 0.6033036, 0.3921569, 0, 1, 1,
0.5708898, 0.9157825, -0.3219903, 0.3960784, 0, 1, 1,
0.574077, -0.1336195, 1.369326, 0.4039216, 0, 1, 1,
0.5765766, -1.92616, 4.808734, 0.4117647, 0, 1, 1,
0.5772171, -0.3622012, 2.279158, 0.4156863, 0, 1, 1,
0.5824606, -0.6749139, 1.533944, 0.4235294, 0, 1, 1,
0.5837249, -1.38158, 3.420936, 0.427451, 0, 1, 1,
0.5850646, 0.9890753, -1.168479, 0.4352941, 0, 1, 1,
0.5879312, -0.1784201, 3.079953, 0.4392157, 0, 1, 1,
0.5894888, -1.037679, 2.2005, 0.4470588, 0, 1, 1,
0.5967666, 1.383983, 1.432378, 0.4509804, 0, 1, 1,
0.5974026, -0.2050309, 1.794169, 0.4588235, 0, 1, 1,
0.6050379, 0.5671345, -0.3139999, 0.4627451, 0, 1, 1,
0.6088061, -0.6977185, 3.147072, 0.4705882, 0, 1, 1,
0.6120849, -1.910824, 1.50548, 0.4745098, 0, 1, 1,
0.6139871, -0.9645901, 2.446258, 0.4823529, 0, 1, 1,
0.617996, 1.73306, 2.038306, 0.4862745, 0, 1, 1,
0.6243226, 0.2770475, 1.652668, 0.4941176, 0, 1, 1,
0.6316409, 1.055004, 0.7205493, 0.5019608, 0, 1, 1,
0.6329126, -0.8179338, -0.222186, 0.5058824, 0, 1, 1,
0.6357302, 0.05187416, 0.9257923, 0.5137255, 0, 1, 1,
0.639447, -1.478919, 2.661518, 0.5176471, 0, 1, 1,
0.6427925, 0.7162411, -1.330307, 0.5254902, 0, 1, 1,
0.6438575, -1.154166, 2.838339, 0.5294118, 0, 1, 1,
0.6495042, -1.020592, 2.220923, 0.5372549, 0, 1, 1,
0.6504876, -0.5130485, 2.967649, 0.5411765, 0, 1, 1,
0.6563062, -0.6329269, 0.9371057, 0.5490196, 0, 1, 1,
0.6567535, -0.5669484, 0.9735603, 0.5529412, 0, 1, 1,
0.6571473, 0.3455591, -0.09565432, 0.5607843, 0, 1, 1,
0.6582888, 0.5825187, 0.8745287, 0.5647059, 0, 1, 1,
0.6598632, -0.1837036, 2.507886, 0.572549, 0, 1, 1,
0.660556, 1.24228, -0.4085472, 0.5764706, 0, 1, 1,
0.6663204, -1.01099, 2.890147, 0.5843138, 0, 1, 1,
0.6671632, -0.9622456, 3.228942, 0.5882353, 0, 1, 1,
0.6713431, -0.5372658, 1.031944, 0.5960785, 0, 1, 1,
0.6785096, 0.9762713, 1.973835, 0.6039216, 0, 1, 1,
0.6803377, 0.5796003, 1.097825, 0.6078432, 0, 1, 1,
0.6868227, -0.5751499, 2.988725, 0.6156863, 0, 1, 1,
0.6936509, -0.3934472, 3.029585, 0.6196079, 0, 1, 1,
0.6949918, -1.537827, 2.030126, 0.627451, 0, 1, 1,
0.7012808, -1.41721, -0.06448934, 0.6313726, 0, 1, 1,
0.7020301, -0.7774742, 2.731854, 0.6392157, 0, 1, 1,
0.7055203, 1.389781, 0.6132697, 0.6431373, 0, 1, 1,
0.717306, 0.6703724, -0.1661241, 0.6509804, 0, 1, 1,
0.7182999, 0.6829378, -0.4210162, 0.654902, 0, 1, 1,
0.7189643, -0.6893175, 2.632418, 0.6627451, 0, 1, 1,
0.7227638, 0.5648243, 1.168138, 0.6666667, 0, 1, 1,
0.7232418, 0.2472012, 2.505863, 0.6745098, 0, 1, 1,
0.7334451, -0.1063428, 1.730283, 0.6784314, 0, 1, 1,
0.7409842, 0.1712936, 1.898689, 0.6862745, 0, 1, 1,
0.7511712, 0.7578378, 0.829588, 0.6901961, 0, 1, 1,
0.7566819, -0.3708836, 3.817535, 0.6980392, 0, 1, 1,
0.7590725, 0.1572551, 0.8254752, 0.7058824, 0, 1, 1,
0.7620164, 0.669506, 0.7583349, 0.7098039, 0, 1, 1,
0.7676134, -1.283008, 2.569197, 0.7176471, 0, 1, 1,
0.7700837, -1.485644, 3.757532, 0.7215686, 0, 1, 1,
0.7772623, -0.08304927, 3.396648, 0.7294118, 0, 1, 1,
0.785055, 0.02446415, 1.684847, 0.7333333, 0, 1, 1,
0.7886274, -1.117662, 2.293674, 0.7411765, 0, 1, 1,
0.7887358, -0.8622718, 3.566948, 0.7450981, 0, 1, 1,
0.7961748, -2.781956, 3.635571, 0.7529412, 0, 1, 1,
0.8153922, 2.214933, 0.009586418, 0.7568628, 0, 1, 1,
0.8159747, 0.4258262, -1.376361, 0.7647059, 0, 1, 1,
0.820435, -1.467352, 2.043679, 0.7686275, 0, 1, 1,
0.8234436, -0.1074123, 1.945252, 0.7764706, 0, 1, 1,
0.8247178, -0.6618478, 1.03355, 0.7803922, 0, 1, 1,
0.8258026, 0.2307853, 2.853233, 0.7882353, 0, 1, 1,
0.8279908, 0.4793415, 2.162131, 0.7921569, 0, 1, 1,
0.831422, -0.8989378, 4.123813, 0.8, 0, 1, 1,
0.832262, 0.7579153, 3.07207, 0.8078431, 0, 1, 1,
0.8326211, 1.6261, -0.3607099, 0.8117647, 0, 1, 1,
0.8377004, -0.2553468, 0.5713212, 0.8196079, 0, 1, 1,
0.8382737, 1.145143, 0.320249, 0.8235294, 0, 1, 1,
0.8384688, -1.153088, 3.390963, 0.8313726, 0, 1, 1,
0.8406368, 0.2490378, 1.634077, 0.8352941, 0, 1, 1,
0.842676, -0.6122385, 2.732239, 0.8431373, 0, 1, 1,
0.8548759, -0.1677936, 1.412928, 0.8470588, 0, 1, 1,
0.8607562, -0.6030555, 1.404078, 0.854902, 0, 1, 1,
0.8639479, 0.2656715, 0.6055415, 0.8588235, 0, 1, 1,
0.8676061, -0.1268344, 0.2000545, 0.8666667, 0, 1, 1,
0.8682874, -0.1074687, 2.113101, 0.8705882, 0, 1, 1,
0.8738844, 0.3439589, 1.766142, 0.8784314, 0, 1, 1,
0.8789358, -0.5645573, 1.49968, 0.8823529, 0, 1, 1,
0.8801293, -0.7292184, 2.860017, 0.8901961, 0, 1, 1,
0.8925311, 0.661474, 2.434108, 0.8941177, 0, 1, 1,
0.892831, 0.2348912, 2.058524, 0.9019608, 0, 1, 1,
0.8948812, 0.7473297, 0.5529683, 0.9098039, 0, 1, 1,
0.9085522, 0.3307592, 1.235932, 0.9137255, 0, 1, 1,
0.9328996, 1.737444, 0.3972965, 0.9215686, 0, 1, 1,
0.9363731, -0.08818441, 2.586612, 0.9254902, 0, 1, 1,
0.9596336, 0.2196979, 1.494674, 0.9333333, 0, 1, 1,
0.9598684, -0.2009294, 2.066769, 0.9372549, 0, 1, 1,
0.959954, -0.07081626, -0.2456044, 0.945098, 0, 1, 1,
0.9601384, 1.125801, 1.349805, 0.9490196, 0, 1, 1,
0.9649608, -0.7333198, 1.1971, 0.9568627, 0, 1, 1,
0.9682741, -0.6114665, 1.903503, 0.9607843, 0, 1, 1,
0.9725374, -0.1227034, 1.319539, 0.9686275, 0, 1, 1,
0.9726859, -0.2223859, 0.05172575, 0.972549, 0, 1, 1,
0.9728184, -2.064411, 2.150238, 0.9803922, 0, 1, 1,
0.9760255, 0.5462829, 0.7918848, 0.9843137, 0, 1, 1,
0.9785285, 1.118627, 0.2028747, 0.9921569, 0, 1, 1,
0.9845482, -1.671139, 1.314271, 0.9960784, 0, 1, 1,
0.9899595, 0.04369011, 1.275476, 1, 0, 0.9960784, 1,
0.9910409, 0.5465224, -0.4067705, 1, 0, 0.9882353, 1,
0.9920567, -1.434698, 1.018848, 1, 0, 0.9843137, 1,
0.9928972, -2.10872, 2.233697, 1, 0, 0.9764706, 1,
0.9989798, 0.8439845, -0.330099, 1, 0, 0.972549, 1,
1.010386, 0.1567283, 0.4928974, 1, 0, 0.9647059, 1,
1.011002, -0.02349589, 2.377767, 1, 0, 0.9607843, 1,
1.018331, 0.3788959, 0.3683422, 1, 0, 0.9529412, 1,
1.019602, -0.21958, 0.8319201, 1, 0, 0.9490196, 1,
1.026436, -1.69153, 1.273667, 1, 0, 0.9411765, 1,
1.026715, 0.4116184, 1.58294, 1, 0, 0.9372549, 1,
1.031003, -0.617831, 0.4608131, 1, 0, 0.9294118, 1,
1.032353, -1.561056, 1.1969, 1, 0, 0.9254902, 1,
1.048151, -0.6808632, 2.902546, 1, 0, 0.9176471, 1,
1.04894, 0.1813778, 1.744133, 1, 0, 0.9137255, 1,
1.055269, -0.7962505, 2.436857, 1, 0, 0.9058824, 1,
1.056767, 0.4127093, 1.272373, 1, 0, 0.9019608, 1,
1.061501, 0.5843857, 3.199996, 1, 0, 0.8941177, 1,
1.063931, -0.6112753, 3.409697, 1, 0, 0.8862745, 1,
1.06741, 1.153115, 1.759137, 1, 0, 0.8823529, 1,
1.06927, 0.5425152, 0.3538438, 1, 0, 0.8745098, 1,
1.071927, 0.08374986, 1.442392, 1, 0, 0.8705882, 1,
1.074242, -0.6561494, 3.117927, 1, 0, 0.8627451, 1,
1.075478, -1.154964, 1.150708, 1, 0, 0.8588235, 1,
1.080815, 0.1308355, -1.445849, 1, 0, 0.8509804, 1,
1.085783, -0.1076207, 1.693153, 1, 0, 0.8470588, 1,
1.09111, 1.338259, 1.207964, 1, 0, 0.8392157, 1,
1.097801, -0.1914919, 1.833127, 1, 0, 0.8352941, 1,
1.099033, 1.091947, 0.2602317, 1, 0, 0.827451, 1,
1.105215, 1.849125, 0.4770287, 1, 0, 0.8235294, 1,
1.106173, 0.8251216, 1.636396, 1, 0, 0.8156863, 1,
1.106469, -0.2923331, 1.631864, 1, 0, 0.8117647, 1,
1.109403, 0.2024746, 3.049993, 1, 0, 0.8039216, 1,
1.113061, 0.5257696, 0.9964889, 1, 0, 0.7960784, 1,
1.114117, 0.9446365, -0.1231381, 1, 0, 0.7921569, 1,
1.119437, -1.365007, 2.156482, 1, 0, 0.7843137, 1,
1.119447, -0.350272, 1.028482, 1, 0, 0.7803922, 1,
1.121768, -0.07218394, 2.454513, 1, 0, 0.772549, 1,
1.12298, -0.1554435, 2.485486, 1, 0, 0.7686275, 1,
1.125132, -1.150443, 2.276732, 1, 0, 0.7607843, 1,
1.131839, -0.9740966, 4.352629, 1, 0, 0.7568628, 1,
1.137339, -1.672634, 0.2125263, 1, 0, 0.7490196, 1,
1.145187, -1.207992, 4.047452, 1, 0, 0.7450981, 1,
1.156267, -0.9331931, 2.202535, 1, 0, 0.7372549, 1,
1.158623, -1.69274, 2.955087, 1, 0, 0.7333333, 1,
1.158705, -0.7132077, 0.5290875, 1, 0, 0.7254902, 1,
1.164522, 0.3399117, -0.7850555, 1, 0, 0.7215686, 1,
1.180887, 1.703198, -0.6768096, 1, 0, 0.7137255, 1,
1.184608, -2.641045, 5.151758, 1, 0, 0.7098039, 1,
1.198276, -1.876262, 1.904881, 1, 0, 0.7019608, 1,
1.201382, 1.009491, -0.8139453, 1, 0, 0.6941177, 1,
1.206138, 1.00428, 0.3968793, 1, 0, 0.6901961, 1,
1.21018, 1.132753, 1.06357, 1, 0, 0.682353, 1,
1.210877, 0.1838505, 1.206524, 1, 0, 0.6784314, 1,
1.226959, 0.1909875, -0.8972141, 1, 0, 0.6705883, 1,
1.243662, -0.2852587, 0.06852239, 1, 0, 0.6666667, 1,
1.245091, -1.187691, 3.01124, 1, 0, 0.6588235, 1,
1.248941, -2.937526, 1.490417, 1, 0, 0.654902, 1,
1.250874, -0.4104776, 0.650052, 1, 0, 0.6470588, 1,
1.259508, 0.254409, 1.814522, 1, 0, 0.6431373, 1,
1.271021, 0.9305047, 1.582844, 1, 0, 0.6352941, 1,
1.272603, -0.60689, 2.475967, 1, 0, 0.6313726, 1,
1.272629, 0.0700897, 1.460595, 1, 0, 0.6235294, 1,
1.273849, 1.241986, 1.479154, 1, 0, 0.6196079, 1,
1.274105, 0.5020187, 1.958195, 1, 0, 0.6117647, 1,
1.279068, 0.8815556, 0.6064, 1, 0, 0.6078432, 1,
1.280895, 0.3286041, 1.672525, 1, 0, 0.6, 1,
1.30663, 1.993808, 0.3607725, 1, 0, 0.5921569, 1,
1.326669, -1.603954, 1.727689, 1, 0, 0.5882353, 1,
1.335771, -1.93414, 0.6507381, 1, 0, 0.5803922, 1,
1.337286, -0.8716246, 2.624779, 1, 0, 0.5764706, 1,
1.351765, -1.615395, 1.071859, 1, 0, 0.5686275, 1,
1.358271, -1.089307, 2.17535, 1, 0, 0.5647059, 1,
1.362841, -0.99922, 2.963523, 1, 0, 0.5568628, 1,
1.365089, -2.118729, 3.34672, 1, 0, 0.5529412, 1,
1.365674, 0.3799284, -0.2232825, 1, 0, 0.5450981, 1,
1.366637, 0.3762522, 2.110727, 1, 0, 0.5411765, 1,
1.368838, 0.738281, 0.7972083, 1, 0, 0.5333334, 1,
1.380409, -0.833924, 3.176419, 1, 0, 0.5294118, 1,
1.385307, -0.001442597, -0.3754371, 1, 0, 0.5215687, 1,
1.38915, -1.578936, 2.147157, 1, 0, 0.5176471, 1,
1.390778, 2.021733, -0.8340322, 1, 0, 0.509804, 1,
1.395302, -0.9817454, 2.50939, 1, 0, 0.5058824, 1,
1.402976, 0.5628922, -0.1894616, 1, 0, 0.4980392, 1,
1.418305, 1.895048, 0.1539392, 1, 0, 0.4901961, 1,
1.430663, 0.3363475, 2.221385, 1, 0, 0.4862745, 1,
1.430926, -1.094373, 4.354674, 1, 0, 0.4784314, 1,
1.444157, 0.03676459, 1.094196, 1, 0, 0.4745098, 1,
1.448972, 0.8472747, 2.163393, 1, 0, 0.4666667, 1,
1.452385, 0.8700769, -0.2198885, 1, 0, 0.4627451, 1,
1.452399, -0.4390435, 1.084811, 1, 0, 0.454902, 1,
1.460768, -1.555773, 2.685864, 1, 0, 0.4509804, 1,
1.465452, 0.2342821, 0.1679436, 1, 0, 0.4431373, 1,
1.471732, 0.1884153, 0.3463819, 1, 0, 0.4392157, 1,
1.474799, 0.0615292, 1.318641, 1, 0, 0.4313726, 1,
1.491418, 0.5887408, 0.2270864, 1, 0, 0.427451, 1,
1.502887, 2.513467, 0.1323074, 1, 0, 0.4196078, 1,
1.509486, 0.6171496, 3.748278, 1, 0, 0.4156863, 1,
1.51277, -0.7848232, 0.9577627, 1, 0, 0.4078431, 1,
1.51583, -0.9519866, 0.3660097, 1, 0, 0.4039216, 1,
1.517917, 0.1760235, 2.688456, 1, 0, 0.3960784, 1,
1.527884, -0.06372014, 2.088341, 1, 0, 0.3882353, 1,
1.550162, 1.079846, 0.9136926, 1, 0, 0.3843137, 1,
1.551206, -0.4921868, 1.832826, 1, 0, 0.3764706, 1,
1.555761, 1.687559, 0.304041, 1, 0, 0.372549, 1,
1.561543, 0.952358, 1.441089, 1, 0, 0.3647059, 1,
1.588807, -0.4894897, 2.878722, 1, 0, 0.3607843, 1,
1.589872, 0.8203878, -0.5320962, 1, 0, 0.3529412, 1,
1.596436, -0.4365504, 1.854158, 1, 0, 0.3490196, 1,
1.606089, -0.612694, 1.817757, 1, 0, 0.3411765, 1,
1.608981, -0.4678261, 1.48638, 1, 0, 0.3372549, 1,
1.630743, -0.5662581, 4.538015, 1, 0, 0.3294118, 1,
1.631064, 0.1092406, 3.039119, 1, 0, 0.3254902, 1,
1.655825, -1.029974, 2.087032, 1, 0, 0.3176471, 1,
1.668924, -0.6000342, 0.8644451, 1, 0, 0.3137255, 1,
1.678839, -0.804155, 3.050734, 1, 0, 0.3058824, 1,
1.682671, -0.1696827, 1.526338, 1, 0, 0.2980392, 1,
1.686907, -3.397223, 2.134176, 1, 0, 0.2941177, 1,
1.706455, -0.5588709, 3.501005, 1, 0, 0.2862745, 1,
1.717367, -1.026302, 1.449514, 1, 0, 0.282353, 1,
1.724839, 0.45288, 2.004846, 1, 0, 0.2745098, 1,
1.739689, 0.5477123, 2.671722, 1, 0, 0.2705882, 1,
1.741649, 1.194085, 1.609111, 1, 0, 0.2627451, 1,
1.753528, -0.7010966, 1.606056, 1, 0, 0.2588235, 1,
1.765444, 0.5939413, 0.7326236, 1, 0, 0.2509804, 1,
1.817662, -0.9508883, 0.685603, 1, 0, 0.2470588, 1,
1.826693, 1.300552, 0.6386418, 1, 0, 0.2392157, 1,
1.865374, 1.340733, 0.5613016, 1, 0, 0.2352941, 1,
1.93067, -0.1980307, 1.232997, 1, 0, 0.227451, 1,
1.939943, -1.846728, 2.9989, 1, 0, 0.2235294, 1,
1.94217, 0.5465852, 0.8355882, 1, 0, 0.2156863, 1,
1.968739, -0.445751, 1.463988, 1, 0, 0.2117647, 1,
1.972419, 0.1345439, 0.7514734, 1, 0, 0.2039216, 1,
1.992677, -1.064261, 1.473653, 1, 0, 0.1960784, 1,
1.994606, -0.5126045, 1.844851, 1, 0, 0.1921569, 1,
1.994959, 0.9146, 1.118669, 1, 0, 0.1843137, 1,
1.998659, 0.8086537, 2.367464, 1, 0, 0.1803922, 1,
2.012645, -0.2525859, 0.5147632, 1, 0, 0.172549, 1,
2.04574, 0.780045, 0.2272841, 1, 0, 0.1686275, 1,
2.047896, 1.831729, -0.1410737, 1, 0, 0.1607843, 1,
2.048604, 0.606974, 2.28932, 1, 0, 0.1568628, 1,
2.06816, 0.6409186, 3.125409, 1, 0, 0.1490196, 1,
2.083147, 0.5983963, 0.8998916, 1, 0, 0.145098, 1,
2.09947, 1.673429, 1.396016, 1, 0, 0.1372549, 1,
2.129568, -1.192925, 0.8446294, 1, 0, 0.1333333, 1,
2.136964, 2.605164, 0.4918711, 1, 0, 0.1254902, 1,
2.168036, 0.3043014, 1.262235, 1, 0, 0.1215686, 1,
2.171484, -1.088782, 4.611348, 1, 0, 0.1137255, 1,
2.210711, -0.5354536, 3.578368, 1, 0, 0.1098039, 1,
2.21237, 0.8922383, 0.5149696, 1, 0, 0.1019608, 1,
2.214138, 0.4592969, 0.2122107, 1, 0, 0.09411765, 1,
2.232227, -0.3435965, 0.9319659, 1, 0, 0.09019608, 1,
2.243252, -1.817027, 2.763229, 1, 0, 0.08235294, 1,
2.255143, 0.176722, 0.1210287, 1, 0, 0.07843138, 1,
2.26096, 0.46576, 1.666414, 1, 0, 0.07058824, 1,
2.280524, 1.251813, 0.4847402, 1, 0, 0.06666667, 1,
2.281177, -0.3755119, 1.460486, 1, 0, 0.05882353, 1,
2.327158, 0.06100427, 0.979691, 1, 0, 0.05490196, 1,
2.342523, -1.544109, 1.128824, 1, 0, 0.04705882, 1,
2.398439, 0.8863286, 0.3644359, 1, 0, 0.04313726, 1,
2.561634, 0.35497, 1.425399, 1, 0, 0.03529412, 1,
2.61199, -0.7281267, 1.445113, 1, 0, 0.03137255, 1,
2.638455, -1.916447, 2.877288, 1, 0, 0.02352941, 1,
2.657561, -0.641607, 2.490033, 1, 0, 0.01960784, 1,
3.051044, 2.179829, -0.08867907, 1, 0, 0.01176471, 1,
3.305543, 0.5077389, 0.5890222, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.1259583, -4.60609, -7.425316, 0, -0.5, 0.5, 0.5,
0.1259583, -4.60609, -7.425316, 1, -0.5, 0.5, 0.5,
0.1259583, -4.60609, -7.425316, 1, 1.5, 0.5, 0.5,
0.1259583, -4.60609, -7.425316, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.131506, 0.1687552, -7.425316, 0, -0.5, 0.5, 0.5,
-4.131506, 0.1687552, -7.425316, 1, -0.5, 0.5, 0.5,
-4.131506, 0.1687552, -7.425316, 1, 1.5, 0.5, 0.5,
-4.131506, 0.1687552, -7.425316, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.131506, -4.60609, -0.1923554, 0, -0.5, 0.5, 0.5,
-4.131506, -4.60609, -0.1923554, 1, -0.5, 0.5, 0.5,
-4.131506, -4.60609, -0.1923554, 1, 1.5, 0.5, 0.5,
-4.131506, -4.60609, -0.1923554, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.504202, -5.756171,
3, -3.504202, -5.756171,
-3, -3.504202, -5.756171,
-3, -3.68785, -6.034362,
-2, -3.504202, -5.756171,
-2, -3.68785, -6.034362,
-1, -3.504202, -5.756171,
-1, -3.68785, -6.034362,
0, -3.504202, -5.756171,
0, -3.68785, -6.034362,
1, -3.504202, -5.756171,
1, -3.68785, -6.034362,
2, -3.504202, -5.756171,
2, -3.68785, -6.034362,
3, -3.504202, -5.756171,
3, -3.68785, -6.034362
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.055146, -6.590744, 0, -0.5, 0.5, 0.5,
-3, -4.055146, -6.590744, 1, -0.5, 0.5, 0.5,
-3, -4.055146, -6.590744, 1, 1.5, 0.5, 0.5,
-3, -4.055146, -6.590744, 0, 1.5, 0.5, 0.5,
-2, -4.055146, -6.590744, 0, -0.5, 0.5, 0.5,
-2, -4.055146, -6.590744, 1, -0.5, 0.5, 0.5,
-2, -4.055146, -6.590744, 1, 1.5, 0.5, 0.5,
-2, -4.055146, -6.590744, 0, 1.5, 0.5, 0.5,
-1, -4.055146, -6.590744, 0, -0.5, 0.5, 0.5,
-1, -4.055146, -6.590744, 1, -0.5, 0.5, 0.5,
-1, -4.055146, -6.590744, 1, 1.5, 0.5, 0.5,
-1, -4.055146, -6.590744, 0, 1.5, 0.5, 0.5,
0, -4.055146, -6.590744, 0, -0.5, 0.5, 0.5,
0, -4.055146, -6.590744, 1, -0.5, 0.5, 0.5,
0, -4.055146, -6.590744, 1, 1.5, 0.5, 0.5,
0, -4.055146, -6.590744, 0, 1.5, 0.5, 0.5,
1, -4.055146, -6.590744, 0, -0.5, 0.5, 0.5,
1, -4.055146, -6.590744, 1, -0.5, 0.5, 0.5,
1, -4.055146, -6.590744, 1, 1.5, 0.5, 0.5,
1, -4.055146, -6.590744, 0, 1.5, 0.5, 0.5,
2, -4.055146, -6.590744, 0, -0.5, 0.5, 0.5,
2, -4.055146, -6.590744, 1, -0.5, 0.5, 0.5,
2, -4.055146, -6.590744, 1, 1.5, 0.5, 0.5,
2, -4.055146, -6.590744, 0, 1.5, 0.5, 0.5,
3, -4.055146, -6.590744, 0, -0.5, 0.5, 0.5,
3, -4.055146, -6.590744, 1, -0.5, 0.5, 0.5,
3, -4.055146, -6.590744, 1, 1.5, 0.5, 0.5,
3, -4.055146, -6.590744, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.149014, -2, -5.756171,
-3.149014, 2, -5.756171,
-3.149014, -2, -5.756171,
-3.312763, -2, -6.034362,
-3.149014, 0, -5.756171,
-3.312763, 0, -6.034362,
-3.149014, 2, -5.756171,
-3.312763, 2, -6.034362
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.64026, -2, -6.590744, 0, -0.5, 0.5, 0.5,
-3.64026, -2, -6.590744, 1, -0.5, 0.5, 0.5,
-3.64026, -2, -6.590744, 1, 1.5, 0.5, 0.5,
-3.64026, -2, -6.590744, 0, 1.5, 0.5, 0.5,
-3.64026, 0, -6.590744, 0, -0.5, 0.5, 0.5,
-3.64026, 0, -6.590744, 1, -0.5, 0.5, 0.5,
-3.64026, 0, -6.590744, 1, 1.5, 0.5, 0.5,
-3.64026, 0, -6.590744, 0, 1.5, 0.5, 0.5,
-3.64026, 2, -6.590744, 0, -0.5, 0.5, 0.5,
-3.64026, 2, -6.590744, 1, -0.5, 0.5, 0.5,
-3.64026, 2, -6.590744, 1, 1.5, 0.5, 0.5,
-3.64026, 2, -6.590744, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.149014, -3.504202, -4,
-3.149014, -3.504202, 4,
-3.149014, -3.504202, -4,
-3.312763, -3.68785, -4,
-3.149014, -3.504202, -2,
-3.312763, -3.68785, -2,
-3.149014, -3.504202, 0,
-3.312763, -3.68785, 0,
-3.149014, -3.504202, 2,
-3.312763, -3.68785, 2,
-3.149014, -3.504202, 4,
-3.312763, -3.68785, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.64026, -4.055146, -4, 0, -0.5, 0.5, 0.5,
-3.64026, -4.055146, -4, 1, -0.5, 0.5, 0.5,
-3.64026, -4.055146, -4, 1, 1.5, 0.5, 0.5,
-3.64026, -4.055146, -4, 0, 1.5, 0.5, 0.5,
-3.64026, -4.055146, -2, 0, -0.5, 0.5, 0.5,
-3.64026, -4.055146, -2, 1, -0.5, 0.5, 0.5,
-3.64026, -4.055146, -2, 1, 1.5, 0.5, 0.5,
-3.64026, -4.055146, -2, 0, 1.5, 0.5, 0.5,
-3.64026, -4.055146, 0, 0, -0.5, 0.5, 0.5,
-3.64026, -4.055146, 0, 1, -0.5, 0.5, 0.5,
-3.64026, -4.055146, 0, 1, 1.5, 0.5, 0.5,
-3.64026, -4.055146, 0, 0, 1.5, 0.5, 0.5,
-3.64026, -4.055146, 2, 0, -0.5, 0.5, 0.5,
-3.64026, -4.055146, 2, 1, -0.5, 0.5, 0.5,
-3.64026, -4.055146, 2, 1, 1.5, 0.5, 0.5,
-3.64026, -4.055146, 2, 0, 1.5, 0.5, 0.5,
-3.64026, -4.055146, 4, 0, -0.5, 0.5, 0.5,
-3.64026, -4.055146, 4, 1, -0.5, 0.5, 0.5,
-3.64026, -4.055146, 4, 1, 1.5, 0.5, 0.5,
-3.64026, -4.055146, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.149014, -3.504202, -5.756171,
-3.149014, 3.841713, -5.756171,
-3.149014, -3.504202, 5.37146,
-3.149014, 3.841713, 5.37146,
-3.149014, -3.504202, -5.756171,
-3.149014, -3.504202, 5.37146,
-3.149014, 3.841713, -5.756171,
-3.149014, 3.841713, 5.37146,
-3.149014, -3.504202, -5.756171,
3.400931, -3.504202, -5.756171,
-3.149014, -3.504202, 5.37146,
3.400931, -3.504202, 5.37146,
-3.149014, 3.841713, -5.756171,
3.400931, 3.841713, -5.756171,
-3.149014, 3.841713, 5.37146,
3.400931, 3.841713, 5.37146,
3.400931, -3.504202, -5.756171,
3.400931, 3.841713, -5.756171,
3.400931, -3.504202, 5.37146,
3.400931, 3.841713, 5.37146,
3.400931, -3.504202, -5.756171,
3.400931, -3.504202, 5.37146,
3.400931, 3.841713, -5.756171,
3.400931, 3.841713, 5.37146
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.932594;
var distance = 35.29301;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1259583, -0.1687552, 0.1923554 );
mvMatrix.scale( 1.309458, 1.167571, 0.7707729 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.29301);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
terbutryn<-read.table("terbutryn.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-terbutryn$V2
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
```

```r
y<-terbutryn$V3
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
```

```r
z<-terbutryn$V4
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.053627, 0.2072091, -3.190164, 0, 0, 1, 1, 1,
-2.880714, -1.481586, -2.58299, 1, 0, 0, 1, 1,
-2.864042, 0.4943936, -0.771181, 1, 0, 0, 1, 1,
-2.504488, 0.2891511, 0.433116, 1, 0, 0, 1, 1,
-2.448208, 2.289072, -0.6040848, 1, 0, 0, 1, 1,
-2.42302, -0.3682874, -2.277456, 1, 0, 0, 1, 1,
-2.388666, -0.5789984, -0.4746631, 0, 0, 0, 1, 1,
-2.347672, 0.8615766, 0.7582067, 0, 0, 0, 1, 1,
-2.339095, -0.2851614, -0.782586, 0, 0, 0, 1, 1,
-2.316113, -0.5509003, -2.562247, 0, 0, 0, 1, 1,
-2.234222, -0.7235767, -1.236336, 0, 0, 0, 1, 1,
-2.172295, -0.8147418, -3.034948, 0, 0, 0, 1, 1,
-2.166165, 1.710476, -0.9351033, 0, 0, 0, 1, 1,
-2.145726, -1.159086, -0.8164538, 1, 1, 1, 1, 1,
-2.122897, 0.28501, -2.845826, 1, 1, 1, 1, 1,
-2.11925, 2.161046, -1.178846, 1, 1, 1, 1, 1,
-2.08599, 0.3927095, -2.235235, 1, 1, 1, 1, 1,
-2.071136, -0.7605141, -2.806062, 1, 1, 1, 1, 1,
-2.047909, 0.4377566, -0.8343138, 1, 1, 1, 1, 1,
-2.037974, 1.078799, 0.4312405, 1, 1, 1, 1, 1,
-2.027059, -0.0629637, -0.6723087, 1, 1, 1, 1, 1,
-2.017948, 2.050946, -1.870088, 1, 1, 1, 1, 1,
-2.016377, 2.492014, -0.7463379, 1, 1, 1, 1, 1,
-1.994471, -0.4409279, -2.458605, 1, 1, 1, 1, 1,
-1.976171, -0.7682832, -2.280834, 1, 1, 1, 1, 1,
-1.958435, -1.402718, -2.392471, 1, 1, 1, 1, 1,
-1.955816, 0.3232874, -1.097891, 1, 1, 1, 1, 1,
-1.952414, -0.3819415, -1.035466, 1, 1, 1, 1, 1,
-1.943243, 0.2616304, -2.252459, 0, 0, 1, 1, 1,
-1.923862, -0.8324533, -2.777467, 1, 0, 0, 1, 1,
-1.921851, -0.9729971, -2.442605, 1, 0, 0, 1, 1,
-1.850085, 1.539842, -2.238399, 1, 0, 0, 1, 1,
-1.819441, 1.327032, -0.3171385, 1, 0, 0, 1, 1,
-1.818816, -2.618319, -2.101099, 1, 0, 0, 1, 1,
-1.818526, -1.669654, -4.764341, 0, 0, 0, 1, 1,
-1.813389, 0.09795985, -1.061797, 0, 0, 0, 1, 1,
-1.774144, 0.3271532, -1.73595, 0, 0, 0, 1, 1,
-1.734051, 0.7572933, 0.2382453, 0, 0, 0, 1, 1,
-1.726189, -0.1933731, -1.030555, 0, 0, 0, 1, 1,
-1.720565, -1.236389, -2.387088, 0, 0, 0, 1, 1,
-1.716909, 1.438404, 1.001038, 0, 0, 0, 1, 1,
-1.711344, -1.509022, -2.252422, 1, 1, 1, 1, 1,
-1.7098, 0.3878381, -1.491029, 1, 1, 1, 1, 1,
-1.707453, 1.577461, -0.4681189, 1, 1, 1, 1, 1,
-1.701882, 2.134213, -1.102043, 1, 1, 1, 1, 1,
-1.696225, -1.072966, -1.225043, 1, 1, 1, 1, 1,
-1.684036, -0.1366124, -0.06576344, 1, 1, 1, 1, 1,
-1.671119, -0.5073703, -1.019435, 1, 1, 1, 1, 1,
-1.666301, -0.2395753, -0.427167, 1, 1, 1, 1, 1,
-1.664276, -0.343955, -1.086392, 1, 1, 1, 1, 1,
-1.652914, -0.07545609, -1.416948, 1, 1, 1, 1, 1,
-1.62251, -1.444863, -0.627339, 1, 1, 1, 1, 1,
-1.614884, 0.4234321, -1.799303, 1, 1, 1, 1, 1,
-1.608727, -1.946193, -0.4727119, 1, 1, 1, 1, 1,
-1.607895, 1.063478, -1.03122, 1, 1, 1, 1, 1,
-1.599186, 0.7243613, -3.043835, 1, 1, 1, 1, 1,
-1.591884, 1.015221, -3.027206, 0, 0, 1, 1, 1,
-1.582646, 1.150919, 0.08869452, 1, 0, 0, 1, 1,
-1.569296, -1.033215, -1.394028, 1, 0, 0, 1, 1,
-1.565946, -0.1417439, -2.174101, 1, 0, 0, 1, 1,
-1.560533, -0.1765086, 1.13755, 1, 0, 0, 1, 1,
-1.544228, 0.9220916, -1.132144, 1, 0, 0, 1, 1,
-1.533154, -1.933846, -3.04557, 0, 0, 0, 1, 1,
-1.529217, -0.4080028, -2.262828, 0, 0, 0, 1, 1,
-1.524854, 0.4592293, -1.272227, 0, 0, 0, 1, 1,
-1.516772, -1.014765, -0.9317496, 0, 0, 0, 1, 1,
-1.512347, -0.1227192, -0.5175781, 0, 0, 0, 1, 1,
-1.507282, -0.1884077, -4.979711, 0, 0, 0, 1, 1,
-1.501778, 0.05882649, -2.111099, 0, 0, 0, 1, 1,
-1.485566, 0.3282209, -0.9752961, 1, 1, 1, 1, 1,
-1.481074, -0.3561825, -2.217149, 1, 1, 1, 1, 1,
-1.47929, 0.2557397, -1.238988, 1, 1, 1, 1, 1,
-1.478504, 0.8968148, -1.886602, 1, 1, 1, 1, 1,
-1.469214, -0.5016857, -0.584803, 1, 1, 1, 1, 1,
-1.466294, 1.398736, -1.04071, 1, 1, 1, 1, 1,
-1.462112, -1.076285, -0.7655091, 1, 1, 1, 1, 1,
-1.461607, 1.265944, -0.9990707, 1, 1, 1, 1, 1,
-1.451306, -2.754933, -2.451523, 1, 1, 1, 1, 1,
-1.442485, -0.7495793, -2.912619, 1, 1, 1, 1, 1,
-1.440443, -0.7300695, -2.473153, 1, 1, 1, 1, 1,
-1.434608, -0.1525247, -2.593505, 1, 1, 1, 1, 1,
-1.434168, 1.20714, 0.3339718, 1, 1, 1, 1, 1,
-1.419586, -0.09449791, -2.65036, 1, 1, 1, 1, 1,
-1.409695, 0.5776837, -0.6110915, 1, 1, 1, 1, 1,
-1.404126, -0.9505765, -1.931894, 0, 0, 1, 1, 1,
-1.394074, -0.09113349, -0.7566476, 1, 0, 0, 1, 1,
-1.387829, -2.027439, -2.553, 1, 0, 0, 1, 1,
-1.380736, -0.2751341, 0.3890414, 1, 0, 0, 1, 1,
-1.379276, 1.221417, 0.3900194, 1, 0, 0, 1, 1,
-1.378562, 2.05644, -0.7440073, 1, 0, 0, 1, 1,
-1.378148, 0.03332486, -0.8742164, 0, 0, 0, 1, 1,
-1.376379, 0.4286173, -0.6946436, 0, 0, 0, 1, 1,
-1.374077, 1.25715, -0.8394589, 0, 0, 0, 1, 1,
-1.357217, 0.1420961, -0.6028672, 0, 0, 0, 1, 1,
-1.348217, 0.1603478, 0.1233075, 0, 0, 0, 1, 1,
-1.338404, -0.4914179, -0.4863946, 0, 0, 0, 1, 1,
-1.325551, -0.1116632, -2.3402, 0, 0, 0, 1, 1,
-1.320472, 0.3776994, -2.149889, 1, 1, 1, 1, 1,
-1.305235, 0.4248466, -2.049485, 1, 1, 1, 1, 1,
-1.290547, 1.587892, -0.008205044, 1, 1, 1, 1, 1,
-1.287365, 0.7111792, -0.5112267, 1, 1, 1, 1, 1,
-1.267424, 0.1756709, -1.37491, 1, 1, 1, 1, 1,
-1.26427, 1.210632, -0.005898866, 1, 1, 1, 1, 1,
-1.263337, 0.9974241, -1.702, 1, 1, 1, 1, 1,
-1.261695, 0.8130749, -1.317966, 1, 1, 1, 1, 1,
-1.260679, 1.166795, -1.746005, 1, 1, 1, 1, 1,
-1.258145, 0.2493353, -1.209471, 1, 1, 1, 1, 1,
-1.245105, 0.07730244, -1.925578, 1, 1, 1, 1, 1,
-1.241425, -0.2456387, -2.412454, 1, 1, 1, 1, 1,
-1.238284, 0.9297488, 0.645009, 1, 1, 1, 1, 1,
-1.230269, 0.7164187, -2.087787, 1, 1, 1, 1, 1,
-1.214806, 0.2969732, -1.346319, 1, 1, 1, 1, 1,
-1.210576, 0.6320672, 0.0006475956, 0, 0, 1, 1, 1,
-1.205531, 1.231807, -0.8256792, 1, 0, 0, 1, 1,
-1.198539, -0.865344, -1.59667, 1, 0, 0, 1, 1,
-1.194222, -0.5377634, -2.437894, 1, 0, 0, 1, 1,
-1.189908, 0.03697154, -1.246697, 1, 0, 0, 1, 1,
-1.183995, -0.9107068, -2.693368, 1, 0, 0, 1, 1,
-1.174167, 1.119316, -1.316113, 0, 0, 0, 1, 1,
-1.172369, -1.180293, -2.048093, 0, 0, 0, 1, 1,
-1.163695, 0.7896034, -1.935275, 0, 0, 0, 1, 1,
-1.163094, 2.066884, -0.947127, 0, 0, 0, 1, 1,
-1.161562, -0.2115864, -1.960481, 0, 0, 0, 1, 1,
-1.159477, -0.8339717, -3.313644, 0, 0, 0, 1, 1,
-1.158647, -0.262552, -2.454102, 0, 0, 0, 1, 1,
-1.140231, -0.6571285, -1.902294, 1, 1, 1, 1, 1,
-1.136752, -0.06991817, -1.593575, 1, 1, 1, 1, 1,
-1.135653, -0.37753, -2.520504, 1, 1, 1, 1, 1,
-1.132131, -0.1437272, -2.184418, 1, 1, 1, 1, 1,
-1.130541, -1.489719, -3.303335, 1, 1, 1, 1, 1,
-1.122464, 0.5061762, 0.09908346, 1, 1, 1, 1, 1,
-1.11482, -0.04059151, -1.038328, 1, 1, 1, 1, 1,
-1.112005, 0.6702922, -1.058055, 1, 1, 1, 1, 1,
-1.110476, 0.1428751, -0.7457886, 1, 1, 1, 1, 1,
-1.108358, 0.1098119, -1.858785, 1, 1, 1, 1, 1,
-1.100837, -1.608368, -1.410077, 1, 1, 1, 1, 1,
-1.100065, -1.689028, -2.187513, 1, 1, 1, 1, 1,
-1.099508, -0.6177022, -3.476159, 1, 1, 1, 1, 1,
-1.09908, -0.008902804, -1.963001, 1, 1, 1, 1, 1,
-1.098961, -0.130003, -1.148623, 1, 1, 1, 1, 1,
-1.098797, -0.55123, -1.429279, 0, 0, 1, 1, 1,
-1.097279, -0.1512657, -2.424039, 1, 0, 0, 1, 1,
-1.091467, -0.7883083, -2.524251, 1, 0, 0, 1, 1,
-1.08526, -1.709179, -3.796577, 1, 0, 0, 1, 1,
-1.085147, 0.5429865, -2.950619, 1, 0, 0, 1, 1,
-1.060232, 1.841361, -1.293034, 1, 0, 0, 1, 1,
-1.050432, -0.825289, -2.366177, 0, 0, 0, 1, 1,
-1.045564, -0.2654845, -1.849204, 0, 0, 0, 1, 1,
-1.045189, 1.08441, 0.5212556, 0, 0, 0, 1, 1,
-1.043122, 1.350363, -1.832914, 0, 0, 0, 1, 1,
-1.042157, -1.950802, -2.634282, 0, 0, 0, 1, 1,
-1.040538, -0.5459366, -1.647099, 0, 0, 0, 1, 1,
-1.034089, 0.4922267, -0.2447154, 0, 0, 0, 1, 1,
-1.031635, -1.029353, -3.893428, 1, 1, 1, 1, 1,
-1.031076, 0.05366271, -2.799008, 1, 1, 1, 1, 1,
-1.030269, -0.8786163, -1.844762, 1, 1, 1, 1, 1,
-1.02472, 1.376152, -0.1351235, 1, 1, 1, 1, 1,
-1.018542, 0.476687, -0.942531, 1, 1, 1, 1, 1,
-1.016078, 0.5445863, -2.504249, 1, 1, 1, 1, 1,
-1.015932, -0.5330466, -1.618929, 1, 1, 1, 1, 1,
-1.013544, -0.9629408, -0.9334845, 1, 1, 1, 1, 1,
-1.008867, -1.099642, -4.02835, 1, 1, 1, 1, 1,
-1.008578, -0.8983385, -2.317481, 1, 1, 1, 1, 1,
-0.9990691, -1.431317, -2.777803, 1, 1, 1, 1, 1,
-0.9974624, 1.169146, 0.149563, 1, 1, 1, 1, 1,
-0.9930044, -0.6466156, -1.17643, 1, 1, 1, 1, 1,
-0.9791993, -0.9479889, -1.377548, 1, 1, 1, 1, 1,
-0.9751249, -0.3920144, -1.655103, 1, 1, 1, 1, 1,
-0.9742299, 0.502255, 0.0787538, 0, 0, 1, 1, 1,
-0.96864, 1.742049, 0.403888, 1, 0, 0, 1, 1,
-0.963237, -0.3954672, -2.26697, 1, 0, 0, 1, 1,
-0.9615957, 1.572242, -1.969128, 1, 0, 0, 1, 1,
-0.9533369, -0.5490118, -1.11095, 1, 0, 0, 1, 1,
-0.9506399, -0.07013011, -0.5651733, 1, 0, 0, 1, 1,
-0.9421061, -0.505967, -2.425955, 0, 0, 0, 1, 1,
-0.9400991, -0.5912191, -0.7077436, 0, 0, 0, 1, 1,
-0.9376013, 0.4457924, -1.276499, 0, 0, 0, 1, 1,
-0.9334291, 1.249036, -0.3902518, 0, 0, 0, 1, 1,
-0.9317154, 0.7457112, -1.190006, 0, 0, 0, 1, 1,
-0.9207434, -1.237069, -1.035985, 0, 0, 0, 1, 1,
-0.9163896, 0.0009852537, -3.194152, 0, 0, 0, 1, 1,
-0.9151196, -1.409211, -1.810442, 1, 1, 1, 1, 1,
-0.9142402, -1.084983, -3.660848, 1, 1, 1, 1, 1,
-0.9129137, 0.5873691, -1.778188, 1, 1, 1, 1, 1,
-0.9042038, -0.04748071, -1.511416, 1, 1, 1, 1, 1,
-0.8917848, 0.3706282, -0.9490845, 1, 1, 1, 1, 1,
-0.8876997, -0.4800998, -1.998551, 1, 1, 1, 1, 1,
-0.886353, -0.1745812, -2.254112, 1, 1, 1, 1, 1,
-0.884799, -1.861376, -2.21202, 1, 1, 1, 1, 1,
-0.882499, -0.2641003, -2.310303, 1, 1, 1, 1, 1,
-0.8773211, -0.7548407, -3.058251, 1, 1, 1, 1, 1,
-0.8767062, -0.9872852, -1.790226, 1, 1, 1, 1, 1,
-0.8764616, 0.8417251, -0.8605963, 1, 1, 1, 1, 1,
-0.8747942, 0.1986201, -0.9288004, 1, 1, 1, 1, 1,
-0.8737227, 0.4292331, -3.079738, 1, 1, 1, 1, 1,
-0.8723225, 0.3712468, -1.565013, 1, 1, 1, 1, 1,
-0.8715708, -1.048433, -1.310619, 0, 0, 1, 1, 1,
-0.867856, -0.531656, -0.9979827, 1, 0, 0, 1, 1,
-0.8643067, 0.3666916, -1.335857, 1, 0, 0, 1, 1,
-0.8615172, 0.1324804, -0.9816151, 1, 0, 0, 1, 1,
-0.8535829, -0.8192646, -3.546914, 1, 0, 0, 1, 1,
-0.8520029, 0.9646275, -3.018881, 1, 0, 0, 1, 1,
-0.8452094, -1.130013, -2.436383, 0, 0, 0, 1, 1,
-0.8432602, 0.6957426, -1.134183, 0, 0, 0, 1, 1,
-0.8377222, -0.6331945, -1.707945, 0, 0, 0, 1, 1,
-0.8350444, -0.2884496, -1.137474, 0, 0, 0, 1, 1,
-0.8321588, 1.763425, -0.5525667, 0, 0, 0, 1, 1,
-0.8304388, 0.3603285, -0.8862049, 0, 0, 0, 1, 1,
-0.8294502, -0.469469, -3.955362, 0, 0, 0, 1, 1,
-0.8282, 1.398739, -1.611412, 1, 1, 1, 1, 1,
-0.8238159, -0.593848, -1.660976, 1, 1, 1, 1, 1,
-0.819676, -1.376286, -4.696819, 1, 1, 1, 1, 1,
-0.8192831, 0.6983934, -1.475152, 1, 1, 1, 1, 1,
-0.8161662, -0.571444, -2.438303, 1, 1, 1, 1, 1,
-0.8148341, -1.04946, -1.79243, 1, 1, 1, 1, 1,
-0.8128343, -0.1851512, -2.554053, 1, 1, 1, 1, 1,
-0.8120978, 0.06510687, -1.45852, 1, 1, 1, 1, 1,
-0.8077592, 0.6019473, -1.446075, 1, 1, 1, 1, 1,
-0.8023065, -0.09464873, -1.435807, 1, 1, 1, 1, 1,
-0.7951674, -0.4555364, -1.765183, 1, 1, 1, 1, 1,
-0.7950191, -0.08502778, -2.439413, 1, 1, 1, 1, 1,
-0.7920009, 0.158877, -0.8468222, 1, 1, 1, 1, 1,
-0.7877563, 2.137667, 0.1925869, 1, 1, 1, 1, 1,
-0.7840567, 1.490777, -0.2563302, 1, 1, 1, 1, 1,
-0.7807167, 0.354362, -1.478858, 0, 0, 1, 1, 1,
-0.779211, -0.5525023, -1.020229, 1, 0, 0, 1, 1,
-0.7785815, -0.06016774, -0.5681926, 1, 0, 0, 1, 1,
-0.7768134, 0.33817, -1.864226, 1, 0, 0, 1, 1,
-0.7760146, -0.762135, -3.76768, 1, 0, 0, 1, 1,
-0.7735566, -0.6737888, -1.692936, 1, 0, 0, 1, 1,
-0.773449, 1.769902, -0.1423918, 0, 0, 0, 1, 1,
-0.7704061, -0.2523076, -1.404827, 0, 0, 0, 1, 1,
-0.7683445, -0.3776402, -1.159242, 0, 0, 0, 1, 1,
-0.7682683, 2.13595, 0.1244745, 0, 0, 0, 1, 1,
-0.7646168, -1.411709, -1.79294, 0, 0, 0, 1, 1,
-0.7639593, 0.8251573, 0.00540138, 0, 0, 0, 1, 1,
-0.7622108, 1.015797, -0.02743501, 0, 0, 0, 1, 1,
-0.7597419, 0.2822683, -2.349168, 1, 1, 1, 1, 1,
-0.7552105, -0.6739867, -3.892712, 1, 1, 1, 1, 1,
-0.7547783, 0.7226692, -1.356808, 1, 1, 1, 1, 1,
-0.7464978, -0.6203797, -2.051432, 1, 1, 1, 1, 1,
-0.7438329, -0.4549335, -2.169376, 1, 1, 1, 1, 1,
-0.7365881, 0.08048125, -1.995143, 1, 1, 1, 1, 1,
-0.7345867, -0.6708697, -2.526964, 1, 1, 1, 1, 1,
-0.7309515, -1.88406, -3.115832, 1, 1, 1, 1, 1,
-0.729446, -0.4717188, -1.907066, 1, 1, 1, 1, 1,
-0.7293306, 0.1238038, -1.782186, 1, 1, 1, 1, 1,
-0.7272699, 1.060908, -0.682082, 1, 1, 1, 1, 1,
-0.7242821, 0.2662871, -2.020335, 1, 1, 1, 1, 1,
-0.7137319, 0.4879788, -1.661406, 1, 1, 1, 1, 1,
-0.7135248, -0.9806944, -2.283828, 1, 1, 1, 1, 1,
-0.7133943, -0.3350336, -0.6750972, 1, 1, 1, 1, 1,
-0.7128456, -0.6270768, -3.779901, 0, 0, 1, 1, 1,
-0.7118455, -1.910351, -2.16776, 1, 0, 0, 1, 1,
-0.7109644, 0.5061039, 0.1966461, 1, 0, 0, 1, 1,
-0.7107915, -0.6202663, -2.631167, 1, 0, 0, 1, 1,
-0.7102737, 1.111974, -0.9872776, 1, 0, 0, 1, 1,
-0.7101173, -0.06576983, -1.05953, 1, 0, 0, 1, 1,
-0.7087426, 1.307938, -0.2292724, 0, 0, 0, 1, 1,
-0.7085195, 1.715959, 0.8287708, 0, 0, 0, 1, 1,
-0.7064802, -0.01342181, -2.092053, 0, 0, 0, 1, 1,
-0.7058651, -0.5283372, -3.23837, 0, 0, 0, 1, 1,
-0.7020782, 0.7111623, -0.8761951, 0, 0, 0, 1, 1,
-0.6987538, 1.435149, 0.5238507, 0, 0, 0, 1, 1,
-0.6954793, 0.3985065, 0.01314268, 0, 0, 0, 1, 1,
-0.6896066, 1.16072, -1.397841, 1, 1, 1, 1, 1,
-0.6876759, -0.2537287, -2.956903, 1, 1, 1, 1, 1,
-0.6747726, -0.4759956, -3.15735, 1, 1, 1, 1, 1,
-0.6655803, -0.7208917, -0.2771681, 1, 1, 1, 1, 1,
-0.6577297, -0.1297019, -3.053953, 1, 1, 1, 1, 1,
-0.6532489, 3.734733, 0.7763366, 1, 1, 1, 1, 1,
-0.651911, -0.5908193, -3.023671, 1, 1, 1, 1, 1,
-0.6512196, -1.798333, -1.080653, 1, 1, 1, 1, 1,
-0.6487939, -0.05426764, -1.838807, 1, 1, 1, 1, 1,
-0.6482041, 1.325873, -0.5728793, 1, 1, 1, 1, 1,
-0.6433136, -0.8594769, -2.792525, 1, 1, 1, 1, 1,
-0.6418759, 0.433367, -1.64488, 1, 1, 1, 1, 1,
-0.6408101, -1.169372, -1.524715, 1, 1, 1, 1, 1,
-0.6389027, 0.2064747, 0.7238916, 1, 1, 1, 1, 1,
-0.6365598, 1.726904, -2.73203, 1, 1, 1, 1, 1,
-0.6364146, 0.06064114, -0.6972895, 0, 0, 1, 1, 1,
-0.6346692, 0.9969457, -0.301022, 1, 0, 0, 1, 1,
-0.632071, 0.6760908, -2.250456, 1, 0, 0, 1, 1,
-0.6303521, -0.43783, -2.224879, 1, 0, 0, 1, 1,
-0.6299046, -0.7356256, -3.419217, 1, 0, 0, 1, 1,
-0.6285621, -1.294739, -3.399579, 1, 0, 0, 1, 1,
-0.6247722, -0.3828538, -3.058374, 0, 0, 0, 1, 1,
-0.6161965, 0.7951632, 0.04184967, 0, 0, 0, 1, 1,
-0.6125376, -0.3253334, -3.017329, 0, 0, 0, 1, 1,
-0.6114767, 0.9530423, -0.2838691, 0, 0, 0, 1, 1,
-0.610487, 0.6159757, -1.625511, 0, 0, 0, 1, 1,
-0.6077151, 0.2838143, -0.180171, 0, 0, 0, 1, 1,
-0.604656, 0.7293457, -1.053389, 0, 0, 0, 1, 1,
-0.592063, -0.2369788, -1.734918, 1, 1, 1, 1, 1,
-0.5915699, 0.1138552, -2.592635, 1, 1, 1, 1, 1,
-0.5899919, -0.9370419, -2.385163, 1, 1, 1, 1, 1,
-0.5892957, 1.416443, -0.7644837, 1, 1, 1, 1, 1,
-0.5854834, 0.1668253, -1.465798, 1, 1, 1, 1, 1,
-0.5825078, 0.1439234, -0.147026, 1, 1, 1, 1, 1,
-0.5727476, -1.538211, -1.972056, 1, 1, 1, 1, 1,
-0.5703928, 0.04901102, -1.626976, 1, 1, 1, 1, 1,
-0.5701893, -0.8876758, -2.269052, 1, 1, 1, 1, 1,
-0.5655805, -0.7120316, -2.652071, 1, 1, 1, 1, 1,
-0.5607781, 0.742195, -0.8670968, 1, 1, 1, 1, 1,
-0.5600947, -0.460903, -3.554532, 1, 1, 1, 1, 1,
-0.5599148, 0.02353105, -1.306321, 1, 1, 1, 1, 1,
-0.5542506, 0.7075663, -0.6180822, 1, 1, 1, 1, 1,
-0.5536555, -0.5526977, -0.8025191, 1, 1, 1, 1, 1,
-0.5499989, 2.035379, -0.2978604, 0, 0, 1, 1, 1,
-0.5482528, -0.04303522, -2.280411, 1, 0, 0, 1, 1,
-0.5460519, -0.7093287, -4.057262, 1, 0, 0, 1, 1,
-0.5441264, -0.2434888, -2.634866, 1, 0, 0, 1, 1,
-0.5408696, -0.1841809, -3.046494, 1, 0, 0, 1, 1,
-0.5407346, -0.03900598, -1.325548, 1, 0, 0, 1, 1,
-0.5406122, -1.104197, -1.772822, 0, 0, 0, 1, 1,
-0.5370601, 0.3920656, -0.0352014, 0, 0, 0, 1, 1,
-0.5357521, -1.458334, -0.4058034, 0, 0, 0, 1, 1,
-0.5334957, -1.726803, -1.591637, 0, 0, 0, 1, 1,
-0.5322555, -0.6642655, -1.109629, 0, 0, 0, 1, 1,
-0.5285109, 0.7538605, -0.2145839, 0, 0, 0, 1, 1,
-0.5248054, 0.8397756, -0.7015728, 0, 0, 0, 1, 1,
-0.5246629, -0.1711263, -2.293714, 1, 1, 1, 1, 1,
-0.523091, -0.4332803, -3.521078, 1, 1, 1, 1, 1,
-0.5216892, 0.5530587, -0.7605172, 1, 1, 1, 1, 1,
-0.5183634, -0.6613547, -1.493598, 1, 1, 1, 1, 1,
-0.5178995, -0.04215061, -2.231136, 1, 1, 1, 1, 1,
-0.5144027, -1.669991, -2.801877, 1, 1, 1, 1, 1,
-0.5131753, 1.619717, -0.530884, 1, 1, 1, 1, 1,
-0.5058016, -1.504367, -3.910276, 1, 1, 1, 1, 1,
-0.5025414, 0.475915, -0.2157278, 1, 1, 1, 1, 1,
-0.4980867, 0.2631735, -3.333822, 1, 1, 1, 1, 1,
-0.4972428, 0.6893056, -0.084202, 1, 1, 1, 1, 1,
-0.496177, 1.049516, -0.7056786, 1, 1, 1, 1, 1,
-0.4912346, -0.6309842, -2.81692, 1, 1, 1, 1, 1,
-0.4806707, 0.05747326, -0.2278049, 1, 1, 1, 1, 1,
-0.4784315, 0.06471725, -0.7887027, 1, 1, 1, 1, 1,
-0.4766811, 0.9011934, 0.7153283, 0, 0, 1, 1, 1,
-0.4763702, 0.06188505, -2.071468, 1, 0, 0, 1, 1,
-0.4740494, -0.6736218, -2.70304, 1, 0, 0, 1, 1,
-0.472286, 0.3906919, -1.706621, 1, 0, 0, 1, 1,
-0.4665841, 1.128677, -0.1202522, 1, 0, 0, 1, 1,
-0.4641225, -0.3434877, -0.8384488, 1, 0, 0, 1, 1,
-0.4607051, -0.9142829, -2.141205, 0, 0, 0, 1, 1,
-0.4568036, 0.38887, -1.112531, 0, 0, 0, 1, 1,
-0.4552245, 0.6979889, 0.2339001, 0, 0, 0, 1, 1,
-0.4520266, -0.6893398, -2.353017, 0, 0, 0, 1, 1,
-0.451154, 0.5478437, -1.668267, 0, 0, 0, 1, 1,
-0.4491075, -0.8568402, -2.392846, 0, 0, 0, 1, 1,
-0.447891, 0.7971771, -1.029686, 0, 0, 0, 1, 1,
-0.4441281, -2.839324, -2.474222, 1, 1, 1, 1, 1,
-0.4414917, -1.798936, -2.080014, 1, 1, 1, 1, 1,
-0.4382796, -0.710669, -4.654706, 1, 1, 1, 1, 1,
-0.4382219, 1.177119, -2.107439, 1, 1, 1, 1, 1,
-0.4367625, -0.3346441, -1.911193, 1, 1, 1, 1, 1,
-0.4363717, -2.067432, -2.600739, 1, 1, 1, 1, 1,
-0.4307971, 0.4495438, -0.6981267, 1, 1, 1, 1, 1,
-0.4298839, -1.646766, -4.457644, 1, 1, 1, 1, 1,
-0.4240994, -0.1767712, -2.425729, 1, 1, 1, 1, 1,
-0.4192046, -0.3946799, -2.029073, 1, 1, 1, 1, 1,
-0.4179134, 1.558489, -0.9949586, 1, 1, 1, 1, 1,
-0.4133575, -0.5323055, -3.11177, 1, 1, 1, 1, 1,
-0.412154, 0.3215187, -2.642162, 1, 1, 1, 1, 1,
-0.4117219, 0.2123875, -1.134963, 1, 1, 1, 1, 1,
-0.4054505, -1.112227, -3.296078, 1, 1, 1, 1, 1,
-0.4047985, -2.533003, -4.446095, 0, 0, 1, 1, 1,
-0.4043966, 0.9741411, -0.5693383, 1, 0, 0, 1, 1,
-0.399906, 0.7955991, -2.067018, 1, 0, 0, 1, 1,
-0.3885537, -0.398185, -3.207837, 1, 0, 0, 1, 1,
-0.387891, -1.493567, -1.311802, 1, 0, 0, 1, 1,
-0.3850286, -2.41201, -3.132854, 1, 0, 0, 1, 1,
-0.3795111, 0.5935979, 0.646833, 0, 0, 0, 1, 1,
-0.3788983, -2.001225, -2.444964, 0, 0, 0, 1, 1,
-0.3770041, 0.4547619, -0.5768826, 0, 0, 0, 1, 1,
-0.3709562, 0.6514744, -0.03250766, 0, 0, 0, 1, 1,
-0.3624354, 0.4062573, 1.026656, 0, 0, 0, 1, 1,
-0.3594677, -2.373782, -1.753991, 0, 0, 0, 1, 1,
-0.3556983, 1.20428, 0.0654905, 0, 0, 0, 1, 1,
-0.3547949, 0.317049, 0.2430696, 1, 1, 1, 1, 1,
-0.349099, 0.02996002, -0.7709374, 1, 1, 1, 1, 1,
-0.3484522, -1.027075, -3.924395, 1, 1, 1, 1, 1,
-0.3460356, -1.241369, -1.597026, 1, 1, 1, 1, 1,
-0.3444229, -1.140742, -3.60824, 1, 1, 1, 1, 1,
-0.344341, -0.6887919, -3.738989, 1, 1, 1, 1, 1,
-0.343397, 0.433131, -0.3789346, 1, 1, 1, 1, 1,
-0.3397439, 0.2350468, -1.007471, 1, 1, 1, 1, 1,
-0.3390638, -2.11884, -3.143132, 1, 1, 1, 1, 1,
-0.3347174, 1.098712, -2.018284, 1, 1, 1, 1, 1,
-0.3273635, -0.7572891, -2.00158, 1, 1, 1, 1, 1,
-0.3263083, -0.3838943, -2.373741, 1, 1, 1, 1, 1,
-0.313208, -0.005137756, -0.9337967, 1, 1, 1, 1, 1,
-0.3131112, -0.7028173, -2.003867, 1, 1, 1, 1, 1,
-0.3119981, 0.1499963, -0.1949749, 1, 1, 1, 1, 1,
-0.3115411, -2.055694, -2.687582, 0, 0, 1, 1, 1,
-0.3102604, 0.7269329, -0.7562099, 1, 0, 0, 1, 1,
-0.3066336, 0.7710195, -0.9476002, 1, 0, 0, 1, 1,
-0.305685, 0.02996132, -1.669937, 1, 0, 0, 1, 1,
-0.3016143, 0.134317, 0.1235596, 1, 0, 0, 1, 1,
-0.3013617, -0.8417354, -2.815921, 1, 0, 0, 1, 1,
-0.296531, 0.2819505, -0.2692985, 0, 0, 0, 1, 1,
-0.289693, -1.318486, -2.206944, 0, 0, 0, 1, 1,
-0.286313, -1.065826, -1.843932, 0, 0, 0, 1, 1,
-0.2846079, 0.5972657, -0.821983, 0, 0, 0, 1, 1,
-0.2831414, 1.646726, 0.3410246, 0, 0, 0, 1, 1,
-0.2820942, -0.6938509, -1.779719, 0, 0, 0, 1, 1,
-0.2791011, -0.9182526, -2.580185, 0, 0, 0, 1, 1,
-0.2750182, -1.396992, -2.842066, 1, 1, 1, 1, 1,
-0.2748167, -1.166025, -3.265069, 1, 1, 1, 1, 1,
-0.2723044, 1.205222, -0.6547821, 1, 1, 1, 1, 1,
-0.2677052, -0.3315204, -3.013604, 1, 1, 1, 1, 1,
-0.2651189, -0.2546384, -2.207001, 1, 1, 1, 1, 1,
-0.2631501, -0.6574191, -2.985962, 1, 1, 1, 1, 1,
-0.260354, -0.9566596, -4.742966, 1, 1, 1, 1, 1,
-0.2533717, 0.5370932, -0.1590126, 1, 1, 1, 1, 1,
-0.2451378, -0.06897572, -3.174732, 1, 1, 1, 1, 1,
-0.2450131, 1.117029, 0.7269354, 1, 1, 1, 1, 1,
-0.2425286, -1.824281, -1.77145, 1, 1, 1, 1, 1,
-0.2398733, 1.826025, -0.489211, 1, 1, 1, 1, 1,
-0.2382694, 1.276697, 0.3481412, 1, 1, 1, 1, 1,
-0.2332061, 0.7228366, -1.701048, 1, 1, 1, 1, 1,
-0.2330198, -0.7647008, -1.849924, 1, 1, 1, 1, 1,
-0.2312928, -0.2400685, -1.309403, 0, 0, 1, 1, 1,
-0.2312728, 0.3172501, -0.5639766, 1, 0, 0, 1, 1,
-0.2301033, 0.680789, -0.3409453, 1, 0, 0, 1, 1,
-0.2293439, -0.7423831, -2.088643, 1, 0, 0, 1, 1,
-0.2292434, -0.09755289, -1.531897, 1, 0, 0, 1, 1,
-0.2277789, 1.605993, 0.1043168, 1, 0, 0, 1, 1,
-0.2265616, 0.3659955, -0.1535345, 0, 0, 0, 1, 1,
-0.2240034, -0.9546403, -3.331335, 0, 0, 0, 1, 1,
-0.2105231, 1.593679, -1.554628, 0, 0, 0, 1, 1,
-0.2024436, 2.28729, -0.4164772, 0, 0, 0, 1, 1,
-0.2001447, -0.6770858, -4.108939, 0, 0, 0, 1, 1,
-0.1959182, 1.02333, -0.4632526, 0, 0, 0, 1, 1,
-0.1932123, -0.6747057, -0.5383071, 0, 0, 0, 1, 1,
-0.1772733, -0.2943914, -0.5739741, 1, 1, 1, 1, 1,
-0.1756886, -1.410033, -2.003986, 1, 1, 1, 1, 1,
-0.1737044, 0.2973952, -0.3771614, 1, 1, 1, 1, 1,
-0.1668155, 2.107676, -0.6305814, 1, 1, 1, 1, 1,
-0.165553, -0.2307812, -1.988935, 1, 1, 1, 1, 1,
-0.1624893, -1.834355, -3.935001, 1, 1, 1, 1, 1,
-0.1608427, -0.1545584, -2.947453, 1, 1, 1, 1, 1,
-0.1595202, -2.443864, -3.453275, 1, 1, 1, 1, 1,
-0.1576135, -1.170547, -2.365845, 1, 1, 1, 1, 1,
-0.1571315, 1.550631, -0.6808744, 1, 1, 1, 1, 1,
-0.1564768, 0.5041098, 0.3933654, 1, 1, 1, 1, 1,
-0.1532235, 0.9016733, 1.696702, 1, 1, 1, 1, 1,
-0.151694, -0.02446546, -0.6680656, 1, 1, 1, 1, 1,
-0.1472376, -1.542886, -2.864941, 1, 1, 1, 1, 1,
-0.1452265, 1.322858, 0.02507671, 1, 1, 1, 1, 1,
-0.1415518, 0.272901, -0.9722113, 0, 0, 1, 1, 1,
-0.1361505, 0.06148807, -1.779648, 1, 0, 0, 1, 1,
-0.1334014, 0.08510434, -1.451229, 1, 0, 0, 1, 1,
-0.133012, -0.7589356, -1.058391, 1, 0, 0, 1, 1,
-0.1322616, 1.170943, 1.47869, 1, 0, 0, 1, 1,
-0.1296226, -0.4661154, -3.846205, 1, 0, 0, 1, 1,
-0.1279702, -0.6467203, -4.496276, 0, 0, 0, 1, 1,
-0.1266547, 1.425214, -0.3597907, 0, 0, 0, 1, 1,
-0.1237715, 0.4276734, -0.1816411, 0, 0, 0, 1, 1,
-0.1190741, -0.4794197, -3.516569, 0, 0, 0, 1, 1,
-0.1174489, -1.602888, -1.982667, 0, 0, 0, 1, 1,
-0.1165717, 1.29713, -0.4186221, 0, 0, 0, 1, 1,
-0.1154819, -0.658817, -3.261322, 0, 0, 0, 1, 1,
-0.1151655, 0.5389628, -1.043075, 1, 1, 1, 1, 1,
-0.107121, 0.7647635, -0.2951464, 1, 1, 1, 1, 1,
-0.1048776, 0.3668855, 0.3695984, 1, 1, 1, 1, 1,
-0.1045801, -0.004299223, -0.2394316, 1, 1, 1, 1, 1,
-0.1019135, -0.09700118, -2.554801, 1, 1, 1, 1, 1,
-0.09325602, 1.020002, 0.3469633, 1, 1, 1, 1, 1,
-0.09302285, -0.472211, -2.495722, 1, 1, 1, 1, 1,
-0.09276789, -0.8355787, -1.987435, 1, 1, 1, 1, 1,
-0.0919015, 0.6891346, -0.6133503, 1, 1, 1, 1, 1,
-0.08953992, 0.9304429, 1.930604, 1, 1, 1, 1, 1,
-0.08707372, 0.6541101, -2.726145, 1, 1, 1, 1, 1,
-0.0824642, 1.112429, -0.1439084, 1, 1, 1, 1, 1,
-0.08133038, 0.02251862, -0.1006559, 1, 1, 1, 1, 1,
-0.07903638, 0.7785959, -1.643665, 1, 1, 1, 1, 1,
-0.07746439, 0.7869806, 0.3675256, 1, 1, 1, 1, 1,
-0.07648467, 2.111459, 0.5944139, 0, 0, 1, 1, 1,
-0.07271306, -0.4916781, -5.594118, 1, 0, 0, 1, 1,
-0.07245703, 0.2955813, 0.7224619, 1, 0, 0, 1, 1,
-0.07221386, 0.09845056, 1.874029, 1, 0, 0, 1, 1,
-0.0669257, 2.960954, 0.9841312, 1, 0, 0, 1, 1,
-0.06474663, 0.7776154, -0.8200149, 1, 0, 0, 1, 1,
-0.06150154, 1.666941, -0.2802643, 0, 0, 0, 1, 1,
-0.06110896, -0.5763896, -3.188127, 0, 0, 0, 1, 1,
-0.06078675, 0.6977726, -1.58307, 0, 0, 0, 1, 1,
-0.06042932, -0.1285737, -2.673506, 0, 0, 0, 1, 1,
-0.05983777, 0.2103283, -1.443292, 0, 0, 0, 1, 1,
-0.05509687, -0.5198581, -2.27785, 0, 0, 0, 1, 1,
-0.05333076, 1.449524, 2.538101, 0, 0, 0, 1, 1,
-0.05245599, -1.49856, -3.171272, 1, 1, 1, 1, 1,
-0.0456329, 1.226307, 0.6564438, 1, 1, 1, 1, 1,
-0.04496743, 0.1310797, 1.25482, 1, 1, 1, 1, 1,
-0.04303122, -0.7598948, -4.374812, 1, 1, 1, 1, 1,
-0.04252017, -0.6892659, -4.035397, 1, 1, 1, 1, 1,
-0.03896539, 0.6689467, 0.1916914, 1, 1, 1, 1, 1,
-0.03806574, 0.2303683, -0.6451841, 1, 1, 1, 1, 1,
-0.03800163, 0.1884751, -1.292388, 1, 1, 1, 1, 1,
-0.03766512, -1.209056, -2.929574, 1, 1, 1, 1, 1,
-0.03479552, -0.06203174, -1.638547, 1, 1, 1, 1, 1,
-0.02678158, -0.6156127, -1.952972, 1, 1, 1, 1, 1,
-0.02536551, 0.9378256, 0.6406372, 1, 1, 1, 1, 1,
-0.02268914, -0.876827, -3.844587, 1, 1, 1, 1, 1,
-0.02250395, -0.05338818, -2.991021, 1, 1, 1, 1, 1,
-0.02042441, -1.121989, -3.920578, 1, 1, 1, 1, 1,
-0.01963573, -0.8826427, -1.027112, 0, 0, 1, 1, 1,
-0.0165592, 0.2913205, -1.420038, 1, 0, 0, 1, 1,
-0.01432804, -0.3072239, -3.022938, 1, 0, 0, 1, 1,
-0.01393499, -0.6378636, -2.034711, 1, 0, 0, 1, 1,
-0.01387277, 0.2732158, 0.3590082, 1, 0, 0, 1, 1,
-0.008469127, -0.4162558, -2.770145, 1, 0, 0, 1, 1,
-0.00802608, 0.9144677, 0.1812722, 0, 0, 0, 1, 1,
-0.007843926, 2.69232, -0.5871113, 0, 0, 0, 1, 1,
-0.004882049, -0.179244, -3.881233, 0, 0, 0, 1, 1,
0.001327591, -0.6790013, 3.140897, 0, 0, 0, 1, 1,
0.001528387, -1.689399, 4.373576, 0, 0, 0, 1, 1,
0.0130522, 1.621025, -0.1394193, 0, 0, 0, 1, 1,
0.01362574, 0.338047, 0.3812562, 0, 0, 0, 1, 1,
0.01620995, -0.4165812, 5.209407, 1, 1, 1, 1, 1,
0.02007754, 0.1397029, -0.8867616, 1, 1, 1, 1, 1,
0.02163131, -0.6536645, 2.02593, 1, 1, 1, 1, 1,
0.02370364, 1.722136, -0.4612303, 1, 1, 1, 1, 1,
0.02421684, 0.5148077, -1.007639, 1, 1, 1, 1, 1,
0.02883809, -1.610872, 3.246902, 1, 1, 1, 1, 1,
0.02985109, -2.233357, 3.864615, 1, 1, 1, 1, 1,
0.03244836, -1.814148, 2.451769, 1, 1, 1, 1, 1,
0.03815334, -0.2433029, 3.407059, 1, 1, 1, 1, 1,
0.0383243, 0.8115085, 0.9055301, 1, 1, 1, 1, 1,
0.0425071, 0.5666355, 0.03503571, 1, 1, 1, 1, 1,
0.04443412, -0.2176516, 1.953752, 1, 1, 1, 1, 1,
0.0493519, -0.7339701, 3.781956, 1, 1, 1, 1, 1,
0.04980185, 0.3601819, -0.5674381, 1, 1, 1, 1, 1,
0.0504746, 1.187022, -0.766763, 1, 1, 1, 1, 1,
0.05956741, -0.07898302, 1.96966, 0, 0, 1, 1, 1,
0.06095524, 1.501028, 0.8106981, 1, 0, 0, 1, 1,
0.06243618, 1.365748, -1.137503, 1, 0, 0, 1, 1,
0.06603795, 1.749775, 0.9567237, 1, 0, 0, 1, 1,
0.06612509, 1.389023, 1.200491, 1, 0, 0, 1, 1,
0.06841478, 1.8831, -0.5972411, 1, 0, 0, 1, 1,
0.06857254, 0.2221137, 1.866994, 0, 0, 0, 1, 1,
0.07065155, 0.5543042, -0.2697237, 0, 0, 0, 1, 1,
0.07107512, 0.5970886, -1.011568, 0, 0, 0, 1, 1,
0.07377049, -0.5692264, 2.327478, 0, 0, 0, 1, 1,
0.07613286, -0.1608997, 2.557351, 0, 0, 0, 1, 1,
0.07945628, -0.6914118, 3.992035, 0, 0, 0, 1, 1,
0.08008596, -0.9537947, 2.095851, 0, 0, 0, 1, 1,
0.08063182, 0.1475484, -0.874802, 1, 1, 1, 1, 1,
0.08202962, -2.084196, 1.700845, 1, 1, 1, 1, 1,
0.08259858, -1.317804, 2.6827, 1, 1, 1, 1, 1,
0.08427965, 0.9454383, 0.1324172, 1, 1, 1, 1, 1,
0.08541849, 0.1514989, 1.620894, 1, 1, 1, 1, 1,
0.08729376, 0.5980825, -0.2720295, 1, 1, 1, 1, 1,
0.09046466, 1.604339, 0.9463443, 1, 1, 1, 1, 1,
0.0948066, -0.06613111, 2.562529, 1, 1, 1, 1, 1,
0.1084052, 0.2317818, -0.7686725, 1, 1, 1, 1, 1,
0.111922, 0.2806343, 1.316962, 1, 1, 1, 1, 1,
0.1158859, 0.6701012, -0.6134681, 1, 1, 1, 1, 1,
0.1212189, -1.06487, 3.542529, 1, 1, 1, 1, 1,
0.1252422, 0.9734551, 0.3643142, 1, 1, 1, 1, 1,
0.1261899, 0.09848488, 0.7803993, 1, 1, 1, 1, 1,
0.1272388, 0.453869, 2.392355, 1, 1, 1, 1, 1,
0.1348873, 1.686706, -1.039579, 0, 0, 1, 1, 1,
0.138608, 2.029212, -1.352407, 1, 0, 0, 1, 1,
0.1399255, 0.9958537, -0.4646873, 1, 0, 0, 1, 1,
0.1435422, 1.283815, 0.5955662, 1, 0, 0, 1, 1,
0.1436824, -0.2885712, 3.196489, 1, 0, 0, 1, 1,
0.1458068, -1.182819, 1.11992, 1, 0, 0, 1, 1,
0.1470391, -0.6859791, 3.043232, 0, 0, 0, 1, 1,
0.1501514, 0.8122009, -0.3788268, 0, 0, 0, 1, 1,
0.1538895, 1.370245, 0.4797716, 0, 0, 0, 1, 1,
0.1562968, -1.221291, 3.230373, 0, 0, 0, 1, 1,
0.1605807, -0.03440721, 0.3321273, 0, 0, 0, 1, 1,
0.1610799, 0.3663872, 2.299215, 0, 0, 0, 1, 1,
0.1617557, 1.713864, 0.8266042, 0, 0, 0, 1, 1,
0.1620431, -0.287976, 4.179816, 1, 1, 1, 1, 1,
0.1623495, 0.1853064, -0.5085039, 1, 1, 1, 1, 1,
0.1635516, -0.9679276, 4.496955, 1, 1, 1, 1, 1,
0.1648425, -0.1142579, 3.013943, 1, 1, 1, 1, 1,
0.1651402, 0.5439405, 0.02357575, 1, 1, 1, 1, 1,
0.1654328, 0.32622, 0.9665511, 1, 1, 1, 1, 1,
0.1744943, 0.1385857, 0.1719436, 1, 1, 1, 1, 1,
0.1755924, -0.08706146, 3.376845, 1, 1, 1, 1, 1,
0.177404, -0.5772615, 2.089976, 1, 1, 1, 1, 1,
0.1845181, -1.253381, 2.110295, 1, 1, 1, 1, 1,
0.1856256, 0.3635751, 0.4788828, 1, 1, 1, 1, 1,
0.187785, 0.5684528, 1.194635, 1, 1, 1, 1, 1,
0.1895068, 0.4673834, 0.6423263, 1, 1, 1, 1, 1,
0.1899676, 0.7961376, -0.7169502, 1, 1, 1, 1, 1,
0.1918922, -1.243385, 2.730464, 1, 1, 1, 1, 1,
0.195525, -0.8625447, 4.600125, 0, 0, 1, 1, 1,
0.1967326, 1.53163, -1.176586, 1, 0, 0, 1, 1,
0.199916, 0.5583683, 1.716887, 1, 0, 0, 1, 1,
0.2006649, -0.2205563, 0.8548641, 1, 0, 0, 1, 1,
0.202529, -1.366674, 3.588671, 1, 0, 0, 1, 1,
0.2062462, -0.3898014, 2.588602, 1, 0, 0, 1, 1,
0.2064978, -0.8807539, 2.291202, 0, 0, 0, 1, 1,
0.2074701, -0.5518938, 3.235969, 0, 0, 0, 1, 1,
0.2138486, 1.865933, 0.61897, 0, 0, 0, 1, 1,
0.2139753, -1.980667, 2.03373, 0, 0, 0, 1, 1,
0.2145008, 1.965004, -0.2020254, 0, 0, 0, 1, 1,
0.2241923, 0.5076702, 1.146593, 0, 0, 0, 1, 1,
0.2247715, -0.4552215, 3.549428, 0, 0, 0, 1, 1,
0.2252178, -0.1685109, 3.255132, 1, 1, 1, 1, 1,
0.2253326, 0.4334183, -0.5090523, 1, 1, 1, 1, 1,
0.226068, 0.1161071, 1.620009, 1, 1, 1, 1, 1,
0.2288871, 0.1987074, 1.222811, 1, 1, 1, 1, 1,
0.2302866, -0.9319874, 2.852062, 1, 1, 1, 1, 1,
0.2308271, 1.055803, 0.8259844, 1, 1, 1, 1, 1,
0.2316889, 0.2166324, 0.8687775, 1, 1, 1, 1, 1,
0.237009, -0.1211486, 1.775196, 1, 1, 1, 1, 1,
0.2372997, -0.8596908, 3.615929, 1, 1, 1, 1, 1,
0.2403124, 0.8080689, -3.364379, 1, 1, 1, 1, 1,
0.2405806, -0.6851949, 3.789714, 1, 1, 1, 1, 1,
0.2411253, 0.3041108, 3.095273, 1, 1, 1, 1, 1,
0.2459663, -0.459223, 2.529596, 1, 1, 1, 1, 1,
0.2482509, 0.3085086, 1.047597, 1, 1, 1, 1, 1,
0.2504101, 0.8662738, -0.8320603, 1, 1, 1, 1, 1,
0.2558751, 0.4348746, 2.187598, 0, 0, 1, 1, 1,
0.2558933, 1.473514, 0.8689769, 1, 0, 0, 1, 1,
0.2560681, -0.4249034, 0.09053902, 1, 0, 0, 1, 1,
0.2614634, 0.6696599, 0.8274036, 1, 0, 0, 1, 1,
0.2630319, -0.175869, 0.5755093, 1, 0, 0, 1, 1,
0.2636945, 1.671489, -1.011997, 1, 0, 0, 1, 1,
0.2651537, 0.6958396, 1.531719, 0, 0, 0, 1, 1,
0.2651949, -0.4017666, 2.31202, 0, 0, 0, 1, 1,
0.2666299, 0.2231152, 0.3099209, 0, 0, 0, 1, 1,
0.2693325, 2.386813, 0.06158583, 0, 0, 0, 1, 1,
0.2696798, -0.8675364, 4.530204, 0, 0, 0, 1, 1,
0.2742725, 0.6644288, 0.2020403, 0, 0, 0, 1, 1,
0.2744016, -0.2321547, 3.243169, 0, 0, 0, 1, 1,
0.2826233, -0.3327438, 1.928466, 1, 1, 1, 1, 1,
0.2845142, -0.6592846, 3.542379, 1, 1, 1, 1, 1,
0.2870434, -2.053141, 3.968087, 1, 1, 1, 1, 1,
0.2921723, -2.440759, 3.040483, 1, 1, 1, 1, 1,
0.2928784, -0.5890074, 2.017531, 1, 1, 1, 1, 1,
0.2969624, -2.227206, 3.70969, 1, 1, 1, 1, 1,
0.2993986, 0.1449181, -0.5577303, 1, 1, 1, 1, 1,
0.3025045, -0.9341438, 1.726993, 1, 1, 1, 1, 1,
0.3045045, 0.05446627, 2.466403, 1, 1, 1, 1, 1,
0.3058892, -1.972932, 0.9446691, 1, 1, 1, 1, 1,
0.3069603, 0.8760347, -0.2334474, 1, 1, 1, 1, 1,
0.3077196, 2.099924, 0.7612792, 1, 1, 1, 1, 1,
0.3093995, -0.6219029, 3.368357, 1, 1, 1, 1, 1,
0.3140022, -0.7199404, 2.084075, 1, 1, 1, 1, 1,
0.3198839, 0.6156118, 0.4303457, 1, 1, 1, 1, 1,
0.3223524, 0.2478356, 0.4550658, 0, 0, 1, 1, 1,
0.3296984, 0.1623994, 0.91333, 1, 0, 0, 1, 1,
0.3311402, 0.5376348, 0.3114789, 1, 0, 0, 1, 1,
0.3324637, 0.2112844, 0.707768, 1, 0, 0, 1, 1,
0.3331441, 0.7542639, 1.455932, 1, 0, 0, 1, 1,
0.3347748, 0.2564042, 1.038572, 1, 0, 0, 1, 1,
0.3351071, -0.5434359, 4.041404, 0, 0, 0, 1, 1,
0.3357254, 2.276295, -0.4170727, 0, 0, 0, 1, 1,
0.3373503, 0.7191069, -0.7238669, 0, 0, 0, 1, 1,
0.338928, 0.3673787, 0.02549761, 0, 0, 0, 1, 1,
0.3390599, 0.07306055, 1.901863, 0, 0, 0, 1, 1,
0.339119, -0.04836945, 0.3168381, 0, 0, 0, 1, 1,
0.344008, -0.6356008, 2.945498, 0, 0, 0, 1, 1,
0.3561197, -1.052195, 3.374423, 1, 1, 1, 1, 1,
0.3617518, 0.3839908, -1.157979, 1, 1, 1, 1, 1,
0.3635134, 0.9105994, 0.2394493, 1, 1, 1, 1, 1,
0.3642432, 1.181436, -0.8068218, 1, 1, 1, 1, 1,
0.3651337, 0.1464538, 0.5804756, 1, 1, 1, 1, 1,
0.3670065, 1.591182, 0.6649071, 1, 1, 1, 1, 1,
0.3763372, 0.2364302, 1.647567, 1, 1, 1, 1, 1,
0.3817881, 1.573927, 0.935045, 1, 1, 1, 1, 1,
0.3830603, -1.45868, 4.052122, 1, 1, 1, 1, 1,
0.3861187, -0.08974671, 1.943329, 1, 1, 1, 1, 1,
0.387991, -1.051387, 3.838414, 1, 1, 1, 1, 1,
0.3901429, -1.188156, 4.905943, 1, 1, 1, 1, 1,
0.3937834, 0.7339432, 1.759319, 1, 1, 1, 1, 1,
0.3956246, 0.7669228, 0.4179676, 1, 1, 1, 1, 1,
0.3957474, -0.5694793, 4.252554, 1, 1, 1, 1, 1,
0.3989869, 1.069678, -0.4588879, 0, 0, 1, 1, 1,
0.4015054, -0.4267737, 2.020777, 1, 0, 0, 1, 1,
0.4031808, 0.6230091, 1.669268, 1, 0, 0, 1, 1,
0.4063255, -1.607528, 1.843479, 1, 0, 0, 1, 1,
0.4116952, -0.1236984, 3.653219, 1, 0, 0, 1, 1,
0.4147182, -0.9145042, 3.320496, 1, 0, 0, 1, 1,
0.4205021, 0.4612613, 1.076849, 0, 0, 0, 1, 1,
0.4223717, 0.1364766, -0.4467134, 0, 0, 0, 1, 1,
0.4262, 0.1198937, 0.4142483, 0, 0, 0, 1, 1,
0.4294733, -0.3952776, 2.877927, 0, 0, 0, 1, 1,
0.4298561, -0.8420178, 3.226363, 0, 0, 0, 1, 1,
0.4304816, -0.3409962, 3.052682, 0, 0, 0, 1, 1,
0.4350021, 0.4537823, 0.9696397, 0, 0, 0, 1, 1,
0.4405001, -0.7993247, 2.246254, 1, 1, 1, 1, 1,
0.4414659, -0.06731184, 0.6205218, 1, 1, 1, 1, 1,
0.4417126, 0.03126737, 1.299639, 1, 1, 1, 1, 1,
0.4457602, -0.1430817, 1.38143, 1, 1, 1, 1, 1,
0.4459563, 0.2298034, -0.3188384, 1, 1, 1, 1, 1,
0.4461434, -0.7863935, 2.653759, 1, 1, 1, 1, 1,
0.4487707, 1.649298, 0.03448676, 1, 1, 1, 1, 1,
0.450967, 1.768665, 2.385817, 1, 1, 1, 1, 1,
0.4525562, 0.5001335, 1.293567, 1, 1, 1, 1, 1,
0.4544805, -0.0002585428, 1.347918, 1, 1, 1, 1, 1,
0.4648375, -1.122215, 3.667598, 1, 1, 1, 1, 1,
0.464843, 0.9056463, -0.4282882, 1, 1, 1, 1, 1,
0.4649337, 0.6655853, 1.631575, 1, 1, 1, 1, 1,
0.4650832, 0.4399921, -1.258686, 1, 1, 1, 1, 1,
0.4672364, -1.195564, 3.480778, 1, 1, 1, 1, 1,
0.4712215, -0.9223494, 1.542714, 0, 0, 1, 1, 1,
0.4719862, 0.5817101, -0.558587, 1, 0, 0, 1, 1,
0.472708, 0.0297814, 4.85004, 1, 0, 0, 1, 1,
0.4798775, 0.1851301, 0.8629959, 1, 0, 0, 1, 1,
0.481486, 0.4425232, 0.5767695, 1, 0, 0, 1, 1,
0.4814915, 0.4514272, -0.2603402, 1, 0, 0, 1, 1,
0.4817334, -0.02344666, 2.265149, 0, 0, 0, 1, 1,
0.4823027, -1.201209, 0.8089628, 0, 0, 0, 1, 1,
0.4829972, 1.432016, 0.8176089, 0, 0, 0, 1, 1,
0.4947064, 0.1567497, 2.039968, 0, 0, 0, 1, 1,
0.4953085, 0.6704642, -0.1296291, 0, 0, 0, 1, 1,
0.4961571, 1.636738, -1.046967, 0, 0, 0, 1, 1,
0.4961738, -0.3873015, 3.252583, 0, 0, 0, 1, 1,
0.5052497, -0.6266268, 1.560868, 1, 1, 1, 1, 1,
0.5065522, 0.2514524, -0.110322, 1, 1, 1, 1, 1,
0.5089232, -0.720444, 2.563981, 1, 1, 1, 1, 1,
0.5127794, 0.1589609, 1.939142, 1, 1, 1, 1, 1,
0.5144179, -2.721934, 3.869171, 1, 1, 1, 1, 1,
0.5244617, 1.256378, 1.214241, 1, 1, 1, 1, 1,
0.5259972, 1.451476, 0.2843622, 1, 1, 1, 1, 1,
0.5290115, -0.8231207, 3.152883, 1, 1, 1, 1, 1,
0.5315465, 0.001521128, -0.4441178, 1, 1, 1, 1, 1,
0.5409687, -0.02972792, 2.947401, 1, 1, 1, 1, 1,
0.5433388, -1.666512, 2.972107, 1, 1, 1, 1, 1,
0.5457317, -1.229568, 0.6558797, 1, 1, 1, 1, 1,
0.5457496, 0.2013814, 2.465832, 1, 1, 1, 1, 1,
0.5460842, 0.1749241, 1.800972, 1, 1, 1, 1, 1,
0.5501904, -0.8619539, 5.178534, 1, 1, 1, 1, 1,
0.5513993, 1.82345, 1.704547, 0, 0, 1, 1, 1,
0.5613005, -1.195575, 1.407403, 1, 0, 0, 1, 1,
0.5663015, -0.1485796, 0.5365804, 1, 0, 0, 1, 1,
0.5702361, 0.9950233, -1.035256, 1, 0, 0, 1, 1,
0.570752, 0.3229264, 0.6033036, 1, 0, 0, 1, 1,
0.5708898, 0.9157825, -0.3219903, 1, 0, 0, 1, 1,
0.574077, -0.1336195, 1.369326, 0, 0, 0, 1, 1,
0.5765766, -1.92616, 4.808734, 0, 0, 0, 1, 1,
0.5772171, -0.3622012, 2.279158, 0, 0, 0, 1, 1,
0.5824606, -0.6749139, 1.533944, 0, 0, 0, 1, 1,
0.5837249, -1.38158, 3.420936, 0, 0, 0, 1, 1,
0.5850646, 0.9890753, -1.168479, 0, 0, 0, 1, 1,
0.5879312, -0.1784201, 3.079953, 0, 0, 0, 1, 1,
0.5894888, -1.037679, 2.2005, 1, 1, 1, 1, 1,
0.5967666, 1.383983, 1.432378, 1, 1, 1, 1, 1,
0.5974026, -0.2050309, 1.794169, 1, 1, 1, 1, 1,
0.6050379, 0.5671345, -0.3139999, 1, 1, 1, 1, 1,
0.6088061, -0.6977185, 3.147072, 1, 1, 1, 1, 1,
0.6120849, -1.910824, 1.50548, 1, 1, 1, 1, 1,
0.6139871, -0.9645901, 2.446258, 1, 1, 1, 1, 1,
0.617996, 1.73306, 2.038306, 1, 1, 1, 1, 1,
0.6243226, 0.2770475, 1.652668, 1, 1, 1, 1, 1,
0.6316409, 1.055004, 0.7205493, 1, 1, 1, 1, 1,
0.6329126, -0.8179338, -0.222186, 1, 1, 1, 1, 1,
0.6357302, 0.05187416, 0.9257923, 1, 1, 1, 1, 1,
0.639447, -1.478919, 2.661518, 1, 1, 1, 1, 1,
0.6427925, 0.7162411, -1.330307, 1, 1, 1, 1, 1,
0.6438575, -1.154166, 2.838339, 1, 1, 1, 1, 1,
0.6495042, -1.020592, 2.220923, 0, 0, 1, 1, 1,
0.6504876, -0.5130485, 2.967649, 1, 0, 0, 1, 1,
0.6563062, -0.6329269, 0.9371057, 1, 0, 0, 1, 1,
0.6567535, -0.5669484, 0.9735603, 1, 0, 0, 1, 1,
0.6571473, 0.3455591, -0.09565432, 1, 0, 0, 1, 1,
0.6582888, 0.5825187, 0.8745287, 1, 0, 0, 1, 1,
0.6598632, -0.1837036, 2.507886, 0, 0, 0, 1, 1,
0.660556, 1.24228, -0.4085472, 0, 0, 0, 1, 1,
0.6663204, -1.01099, 2.890147, 0, 0, 0, 1, 1,
0.6671632, -0.9622456, 3.228942, 0, 0, 0, 1, 1,
0.6713431, -0.5372658, 1.031944, 0, 0, 0, 1, 1,
0.6785096, 0.9762713, 1.973835, 0, 0, 0, 1, 1,
0.6803377, 0.5796003, 1.097825, 0, 0, 0, 1, 1,
0.6868227, -0.5751499, 2.988725, 1, 1, 1, 1, 1,
0.6936509, -0.3934472, 3.029585, 1, 1, 1, 1, 1,
0.6949918, -1.537827, 2.030126, 1, 1, 1, 1, 1,
0.7012808, -1.41721, -0.06448934, 1, 1, 1, 1, 1,
0.7020301, -0.7774742, 2.731854, 1, 1, 1, 1, 1,
0.7055203, 1.389781, 0.6132697, 1, 1, 1, 1, 1,
0.717306, 0.6703724, -0.1661241, 1, 1, 1, 1, 1,
0.7182999, 0.6829378, -0.4210162, 1, 1, 1, 1, 1,
0.7189643, -0.6893175, 2.632418, 1, 1, 1, 1, 1,
0.7227638, 0.5648243, 1.168138, 1, 1, 1, 1, 1,
0.7232418, 0.2472012, 2.505863, 1, 1, 1, 1, 1,
0.7334451, -0.1063428, 1.730283, 1, 1, 1, 1, 1,
0.7409842, 0.1712936, 1.898689, 1, 1, 1, 1, 1,
0.7511712, 0.7578378, 0.829588, 1, 1, 1, 1, 1,
0.7566819, -0.3708836, 3.817535, 1, 1, 1, 1, 1,
0.7590725, 0.1572551, 0.8254752, 0, 0, 1, 1, 1,
0.7620164, 0.669506, 0.7583349, 1, 0, 0, 1, 1,
0.7676134, -1.283008, 2.569197, 1, 0, 0, 1, 1,
0.7700837, -1.485644, 3.757532, 1, 0, 0, 1, 1,
0.7772623, -0.08304927, 3.396648, 1, 0, 0, 1, 1,
0.785055, 0.02446415, 1.684847, 1, 0, 0, 1, 1,
0.7886274, -1.117662, 2.293674, 0, 0, 0, 1, 1,
0.7887358, -0.8622718, 3.566948, 0, 0, 0, 1, 1,
0.7961748, -2.781956, 3.635571, 0, 0, 0, 1, 1,
0.8153922, 2.214933, 0.009586418, 0, 0, 0, 1, 1,
0.8159747, 0.4258262, -1.376361, 0, 0, 0, 1, 1,
0.820435, -1.467352, 2.043679, 0, 0, 0, 1, 1,
0.8234436, -0.1074123, 1.945252, 0, 0, 0, 1, 1,
0.8247178, -0.6618478, 1.03355, 1, 1, 1, 1, 1,
0.8258026, 0.2307853, 2.853233, 1, 1, 1, 1, 1,
0.8279908, 0.4793415, 2.162131, 1, 1, 1, 1, 1,
0.831422, -0.8989378, 4.123813, 1, 1, 1, 1, 1,
0.832262, 0.7579153, 3.07207, 1, 1, 1, 1, 1,
0.8326211, 1.6261, -0.3607099, 1, 1, 1, 1, 1,
0.8377004, -0.2553468, 0.5713212, 1, 1, 1, 1, 1,
0.8382737, 1.145143, 0.320249, 1, 1, 1, 1, 1,
0.8384688, -1.153088, 3.390963, 1, 1, 1, 1, 1,
0.8406368, 0.2490378, 1.634077, 1, 1, 1, 1, 1,
0.842676, -0.6122385, 2.732239, 1, 1, 1, 1, 1,
0.8548759, -0.1677936, 1.412928, 1, 1, 1, 1, 1,
0.8607562, -0.6030555, 1.404078, 1, 1, 1, 1, 1,
0.8639479, 0.2656715, 0.6055415, 1, 1, 1, 1, 1,
0.8676061, -0.1268344, 0.2000545, 1, 1, 1, 1, 1,
0.8682874, -0.1074687, 2.113101, 0, 0, 1, 1, 1,
0.8738844, 0.3439589, 1.766142, 1, 0, 0, 1, 1,
0.8789358, -0.5645573, 1.49968, 1, 0, 0, 1, 1,
0.8801293, -0.7292184, 2.860017, 1, 0, 0, 1, 1,
0.8925311, 0.661474, 2.434108, 1, 0, 0, 1, 1,
0.892831, 0.2348912, 2.058524, 1, 0, 0, 1, 1,
0.8948812, 0.7473297, 0.5529683, 0, 0, 0, 1, 1,
0.9085522, 0.3307592, 1.235932, 0, 0, 0, 1, 1,
0.9328996, 1.737444, 0.3972965, 0, 0, 0, 1, 1,
0.9363731, -0.08818441, 2.586612, 0, 0, 0, 1, 1,
0.9596336, 0.2196979, 1.494674, 0, 0, 0, 1, 1,
0.9598684, -0.2009294, 2.066769, 0, 0, 0, 1, 1,
0.959954, -0.07081626, -0.2456044, 0, 0, 0, 1, 1,
0.9601384, 1.125801, 1.349805, 1, 1, 1, 1, 1,
0.9649608, -0.7333198, 1.1971, 1, 1, 1, 1, 1,
0.9682741, -0.6114665, 1.903503, 1, 1, 1, 1, 1,
0.9725374, -0.1227034, 1.319539, 1, 1, 1, 1, 1,
0.9726859, -0.2223859, 0.05172575, 1, 1, 1, 1, 1,
0.9728184, -2.064411, 2.150238, 1, 1, 1, 1, 1,
0.9760255, 0.5462829, 0.7918848, 1, 1, 1, 1, 1,
0.9785285, 1.118627, 0.2028747, 1, 1, 1, 1, 1,
0.9845482, -1.671139, 1.314271, 1, 1, 1, 1, 1,
0.9899595, 0.04369011, 1.275476, 1, 1, 1, 1, 1,
0.9910409, 0.5465224, -0.4067705, 1, 1, 1, 1, 1,
0.9920567, -1.434698, 1.018848, 1, 1, 1, 1, 1,
0.9928972, -2.10872, 2.233697, 1, 1, 1, 1, 1,
0.9989798, 0.8439845, -0.330099, 1, 1, 1, 1, 1,
1.010386, 0.1567283, 0.4928974, 1, 1, 1, 1, 1,
1.011002, -0.02349589, 2.377767, 0, 0, 1, 1, 1,
1.018331, 0.3788959, 0.3683422, 1, 0, 0, 1, 1,
1.019602, -0.21958, 0.8319201, 1, 0, 0, 1, 1,
1.026436, -1.69153, 1.273667, 1, 0, 0, 1, 1,
1.026715, 0.4116184, 1.58294, 1, 0, 0, 1, 1,
1.031003, -0.617831, 0.4608131, 1, 0, 0, 1, 1,
1.032353, -1.561056, 1.1969, 0, 0, 0, 1, 1,
1.048151, -0.6808632, 2.902546, 0, 0, 0, 1, 1,
1.04894, 0.1813778, 1.744133, 0, 0, 0, 1, 1,
1.055269, -0.7962505, 2.436857, 0, 0, 0, 1, 1,
1.056767, 0.4127093, 1.272373, 0, 0, 0, 1, 1,
1.061501, 0.5843857, 3.199996, 0, 0, 0, 1, 1,
1.063931, -0.6112753, 3.409697, 0, 0, 0, 1, 1,
1.06741, 1.153115, 1.759137, 1, 1, 1, 1, 1,
1.06927, 0.5425152, 0.3538438, 1, 1, 1, 1, 1,
1.071927, 0.08374986, 1.442392, 1, 1, 1, 1, 1,
1.074242, -0.6561494, 3.117927, 1, 1, 1, 1, 1,
1.075478, -1.154964, 1.150708, 1, 1, 1, 1, 1,
1.080815, 0.1308355, -1.445849, 1, 1, 1, 1, 1,
1.085783, -0.1076207, 1.693153, 1, 1, 1, 1, 1,
1.09111, 1.338259, 1.207964, 1, 1, 1, 1, 1,
1.097801, -0.1914919, 1.833127, 1, 1, 1, 1, 1,
1.099033, 1.091947, 0.2602317, 1, 1, 1, 1, 1,
1.105215, 1.849125, 0.4770287, 1, 1, 1, 1, 1,
1.106173, 0.8251216, 1.636396, 1, 1, 1, 1, 1,
1.106469, -0.2923331, 1.631864, 1, 1, 1, 1, 1,
1.109403, 0.2024746, 3.049993, 1, 1, 1, 1, 1,
1.113061, 0.5257696, 0.9964889, 1, 1, 1, 1, 1,
1.114117, 0.9446365, -0.1231381, 0, 0, 1, 1, 1,
1.119437, -1.365007, 2.156482, 1, 0, 0, 1, 1,
1.119447, -0.350272, 1.028482, 1, 0, 0, 1, 1,
1.121768, -0.07218394, 2.454513, 1, 0, 0, 1, 1,
1.12298, -0.1554435, 2.485486, 1, 0, 0, 1, 1,
1.125132, -1.150443, 2.276732, 1, 0, 0, 1, 1,
1.131839, -0.9740966, 4.352629, 0, 0, 0, 1, 1,
1.137339, -1.672634, 0.2125263, 0, 0, 0, 1, 1,
1.145187, -1.207992, 4.047452, 0, 0, 0, 1, 1,
1.156267, -0.9331931, 2.202535, 0, 0, 0, 1, 1,
1.158623, -1.69274, 2.955087, 0, 0, 0, 1, 1,
1.158705, -0.7132077, 0.5290875, 0, 0, 0, 1, 1,
1.164522, 0.3399117, -0.7850555, 0, 0, 0, 1, 1,
1.180887, 1.703198, -0.6768096, 1, 1, 1, 1, 1,
1.184608, -2.641045, 5.151758, 1, 1, 1, 1, 1,
1.198276, -1.876262, 1.904881, 1, 1, 1, 1, 1,
1.201382, 1.009491, -0.8139453, 1, 1, 1, 1, 1,
1.206138, 1.00428, 0.3968793, 1, 1, 1, 1, 1,
1.21018, 1.132753, 1.06357, 1, 1, 1, 1, 1,
1.210877, 0.1838505, 1.206524, 1, 1, 1, 1, 1,
1.226959, 0.1909875, -0.8972141, 1, 1, 1, 1, 1,
1.243662, -0.2852587, 0.06852239, 1, 1, 1, 1, 1,
1.245091, -1.187691, 3.01124, 1, 1, 1, 1, 1,
1.248941, -2.937526, 1.490417, 1, 1, 1, 1, 1,
1.250874, -0.4104776, 0.650052, 1, 1, 1, 1, 1,
1.259508, 0.254409, 1.814522, 1, 1, 1, 1, 1,
1.271021, 0.9305047, 1.582844, 1, 1, 1, 1, 1,
1.272603, -0.60689, 2.475967, 1, 1, 1, 1, 1,
1.272629, 0.0700897, 1.460595, 0, 0, 1, 1, 1,
1.273849, 1.241986, 1.479154, 1, 0, 0, 1, 1,
1.274105, 0.5020187, 1.958195, 1, 0, 0, 1, 1,
1.279068, 0.8815556, 0.6064, 1, 0, 0, 1, 1,
1.280895, 0.3286041, 1.672525, 1, 0, 0, 1, 1,
1.30663, 1.993808, 0.3607725, 1, 0, 0, 1, 1,
1.326669, -1.603954, 1.727689, 0, 0, 0, 1, 1,
1.335771, -1.93414, 0.6507381, 0, 0, 0, 1, 1,
1.337286, -0.8716246, 2.624779, 0, 0, 0, 1, 1,
1.351765, -1.615395, 1.071859, 0, 0, 0, 1, 1,
1.358271, -1.089307, 2.17535, 0, 0, 0, 1, 1,
1.362841, -0.99922, 2.963523, 0, 0, 0, 1, 1,
1.365089, -2.118729, 3.34672, 0, 0, 0, 1, 1,
1.365674, 0.3799284, -0.2232825, 1, 1, 1, 1, 1,
1.366637, 0.3762522, 2.110727, 1, 1, 1, 1, 1,
1.368838, 0.738281, 0.7972083, 1, 1, 1, 1, 1,
1.380409, -0.833924, 3.176419, 1, 1, 1, 1, 1,
1.385307, -0.001442597, -0.3754371, 1, 1, 1, 1, 1,
1.38915, -1.578936, 2.147157, 1, 1, 1, 1, 1,
1.390778, 2.021733, -0.8340322, 1, 1, 1, 1, 1,
1.395302, -0.9817454, 2.50939, 1, 1, 1, 1, 1,
1.402976, 0.5628922, -0.1894616, 1, 1, 1, 1, 1,
1.418305, 1.895048, 0.1539392, 1, 1, 1, 1, 1,
1.430663, 0.3363475, 2.221385, 1, 1, 1, 1, 1,
1.430926, -1.094373, 4.354674, 1, 1, 1, 1, 1,
1.444157, 0.03676459, 1.094196, 1, 1, 1, 1, 1,
1.448972, 0.8472747, 2.163393, 1, 1, 1, 1, 1,
1.452385, 0.8700769, -0.2198885, 1, 1, 1, 1, 1,
1.452399, -0.4390435, 1.084811, 0, 0, 1, 1, 1,
1.460768, -1.555773, 2.685864, 1, 0, 0, 1, 1,
1.465452, 0.2342821, 0.1679436, 1, 0, 0, 1, 1,
1.471732, 0.1884153, 0.3463819, 1, 0, 0, 1, 1,
1.474799, 0.0615292, 1.318641, 1, 0, 0, 1, 1,
1.491418, 0.5887408, 0.2270864, 1, 0, 0, 1, 1,
1.502887, 2.513467, 0.1323074, 0, 0, 0, 1, 1,
1.509486, 0.6171496, 3.748278, 0, 0, 0, 1, 1,
1.51277, -0.7848232, 0.9577627, 0, 0, 0, 1, 1,
1.51583, -0.9519866, 0.3660097, 0, 0, 0, 1, 1,
1.517917, 0.1760235, 2.688456, 0, 0, 0, 1, 1,
1.527884, -0.06372014, 2.088341, 0, 0, 0, 1, 1,
1.550162, 1.079846, 0.9136926, 0, 0, 0, 1, 1,
1.551206, -0.4921868, 1.832826, 1, 1, 1, 1, 1,
1.555761, 1.687559, 0.304041, 1, 1, 1, 1, 1,
1.561543, 0.952358, 1.441089, 1, 1, 1, 1, 1,
1.588807, -0.4894897, 2.878722, 1, 1, 1, 1, 1,
1.589872, 0.8203878, -0.5320962, 1, 1, 1, 1, 1,
1.596436, -0.4365504, 1.854158, 1, 1, 1, 1, 1,
1.606089, -0.612694, 1.817757, 1, 1, 1, 1, 1,
1.608981, -0.4678261, 1.48638, 1, 1, 1, 1, 1,
1.630743, -0.5662581, 4.538015, 1, 1, 1, 1, 1,
1.631064, 0.1092406, 3.039119, 1, 1, 1, 1, 1,
1.655825, -1.029974, 2.087032, 1, 1, 1, 1, 1,
1.668924, -0.6000342, 0.8644451, 1, 1, 1, 1, 1,
1.678839, -0.804155, 3.050734, 1, 1, 1, 1, 1,
1.682671, -0.1696827, 1.526338, 1, 1, 1, 1, 1,
1.686907, -3.397223, 2.134176, 1, 1, 1, 1, 1,
1.706455, -0.5588709, 3.501005, 0, 0, 1, 1, 1,
1.717367, -1.026302, 1.449514, 1, 0, 0, 1, 1,
1.724839, 0.45288, 2.004846, 1, 0, 0, 1, 1,
1.739689, 0.5477123, 2.671722, 1, 0, 0, 1, 1,
1.741649, 1.194085, 1.609111, 1, 0, 0, 1, 1,
1.753528, -0.7010966, 1.606056, 1, 0, 0, 1, 1,
1.765444, 0.5939413, 0.7326236, 0, 0, 0, 1, 1,
1.817662, -0.9508883, 0.685603, 0, 0, 0, 1, 1,
1.826693, 1.300552, 0.6386418, 0, 0, 0, 1, 1,
1.865374, 1.340733, 0.5613016, 0, 0, 0, 1, 1,
1.93067, -0.1980307, 1.232997, 0, 0, 0, 1, 1,
1.939943, -1.846728, 2.9989, 0, 0, 0, 1, 1,
1.94217, 0.5465852, 0.8355882, 0, 0, 0, 1, 1,
1.968739, -0.445751, 1.463988, 1, 1, 1, 1, 1,
1.972419, 0.1345439, 0.7514734, 1, 1, 1, 1, 1,
1.992677, -1.064261, 1.473653, 1, 1, 1, 1, 1,
1.994606, -0.5126045, 1.844851, 1, 1, 1, 1, 1,
1.994959, 0.9146, 1.118669, 1, 1, 1, 1, 1,
1.998659, 0.8086537, 2.367464, 1, 1, 1, 1, 1,
2.012645, -0.2525859, 0.5147632, 1, 1, 1, 1, 1,
2.04574, 0.780045, 0.2272841, 1, 1, 1, 1, 1,
2.047896, 1.831729, -0.1410737, 1, 1, 1, 1, 1,
2.048604, 0.606974, 2.28932, 1, 1, 1, 1, 1,
2.06816, 0.6409186, 3.125409, 1, 1, 1, 1, 1,
2.083147, 0.5983963, 0.8998916, 1, 1, 1, 1, 1,
2.09947, 1.673429, 1.396016, 1, 1, 1, 1, 1,
2.129568, -1.192925, 0.8446294, 1, 1, 1, 1, 1,
2.136964, 2.605164, 0.4918711, 1, 1, 1, 1, 1,
2.168036, 0.3043014, 1.262235, 0, 0, 1, 1, 1,
2.171484, -1.088782, 4.611348, 1, 0, 0, 1, 1,
2.210711, -0.5354536, 3.578368, 1, 0, 0, 1, 1,
2.21237, 0.8922383, 0.5149696, 1, 0, 0, 1, 1,
2.214138, 0.4592969, 0.2122107, 1, 0, 0, 1, 1,
2.232227, -0.3435965, 0.9319659, 1, 0, 0, 1, 1,
2.243252, -1.817027, 2.763229, 0, 0, 0, 1, 1,
2.255143, 0.176722, 0.1210287, 0, 0, 0, 1, 1,
2.26096, 0.46576, 1.666414, 0, 0, 0, 1, 1,
2.280524, 1.251813, 0.4847402, 0, 0, 0, 1, 1,
2.281177, -0.3755119, 1.460486, 0, 0, 0, 1, 1,
2.327158, 0.06100427, 0.979691, 0, 0, 0, 1, 1,
2.342523, -1.544109, 1.128824, 0, 0, 0, 1, 1,
2.398439, 0.8863286, 0.3644359, 1, 1, 1, 1, 1,
2.561634, 0.35497, 1.425399, 1, 1, 1, 1, 1,
2.61199, -0.7281267, 1.445113, 1, 1, 1, 1, 1,
2.638455, -1.916447, 2.877288, 1, 1, 1, 1, 1,
2.657561, -0.641607, 2.490033, 1, 1, 1, 1, 1,
3.051044, 2.179829, -0.08867907, 1, 1, 1, 1, 1,
3.305543, 0.5077389, 0.5890222, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.795539;
var distance = 34.40641;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1259582, -0.1687553, 0.1923554 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.40641);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
