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
-3.298761, 1.006403, -0.9518848, 1, 0, 0, 1,
-2.513644, -0.5038902, -0.8012052, 1, 0.007843138, 0, 1,
-2.502722, -1.708134, -0.7693997, 1, 0.01176471, 0, 1,
-2.490163, -1.793767, -3.106137, 1, 0.01960784, 0, 1,
-2.489171, 1.416019, -1.646496, 1, 0.02352941, 0, 1,
-2.482149, 1.135454, 0.6163912, 1, 0.03137255, 0, 1,
-2.47539, 0.3522729, -1.372862, 1, 0.03529412, 0, 1,
-2.455276, -0.1555859, -2.494126, 1, 0.04313726, 0, 1,
-2.448384, -0.3577778, -1.23534, 1, 0.04705882, 0, 1,
-2.365919, 2.061157, -2.076735, 1, 0.05490196, 0, 1,
-2.308764, -0.5660709, -2.142274, 1, 0.05882353, 0, 1,
-2.283301, -1.069052, -2.92475, 1, 0.06666667, 0, 1,
-2.195807, -2.963335, -2.70735, 1, 0.07058824, 0, 1,
-2.153955, 0.6001918, -0.1367749, 1, 0.07843138, 0, 1,
-2.127573, -1.679056, -2.447012, 1, 0.08235294, 0, 1,
-2.121804, -0.5732579, -3.135571, 1, 0.09019608, 0, 1,
-2.107241, 0.1507924, -2.050805, 1, 0.09411765, 0, 1,
-2.096917, 1.125536, 0.92256, 1, 0.1019608, 0, 1,
-2.056134, 0.3108629, -2.728291, 1, 0.1098039, 0, 1,
-2.034013, -0.6654844, -1.802251, 1, 0.1137255, 0, 1,
-2.026954, 1.785858, -0.9399896, 1, 0.1215686, 0, 1,
-2.015234, 0.32251, -3.870944, 1, 0.1254902, 0, 1,
-2.012237, 0.1467406, -2.463906, 1, 0.1333333, 0, 1,
-2.000957, -1.960901, -0.4846513, 1, 0.1372549, 0, 1,
-1.994999, -1.067348, -1.757694, 1, 0.145098, 0, 1,
-1.991181, 0.9613165, 0.1282972, 1, 0.1490196, 0, 1,
-1.984287, -0.7321021, -1.509952, 1, 0.1568628, 0, 1,
-1.983093, -1.571137, -2.164005, 1, 0.1607843, 0, 1,
-1.96905, -0.5906657, -0.2635152, 1, 0.1686275, 0, 1,
-1.932704, 1.353012, -1.687706, 1, 0.172549, 0, 1,
-1.925487, 0.2977362, -0.2309279, 1, 0.1803922, 0, 1,
-1.925254, 0.6850278, -2.756943, 1, 0.1843137, 0, 1,
-1.899019, -2.570518, -4.312405, 1, 0.1921569, 0, 1,
-1.884874, 1.324313, -1.472387, 1, 0.1960784, 0, 1,
-1.871893, 0.4463451, -0.2492267, 1, 0.2039216, 0, 1,
-1.846932, 0.1251972, -0.2793031, 1, 0.2117647, 0, 1,
-1.846429, 1.655576, -0.7814846, 1, 0.2156863, 0, 1,
-1.843364, -2.386423, -3.080797, 1, 0.2235294, 0, 1,
-1.841857, -2.118222, -2.027163, 1, 0.227451, 0, 1,
-1.838047, -0.6164901, -3.177411, 1, 0.2352941, 0, 1,
-1.830191, 1.105425, 0.1476818, 1, 0.2392157, 0, 1,
-1.826879, -0.3511407, -1.913714, 1, 0.2470588, 0, 1,
-1.814413, 0.2372597, -0.4840226, 1, 0.2509804, 0, 1,
-1.787269, -0.05192839, -1.43447, 1, 0.2588235, 0, 1,
-1.783167, 1.397303, -2.227704, 1, 0.2627451, 0, 1,
-1.777753, 0.6165614, -0.3130081, 1, 0.2705882, 0, 1,
-1.777029, 0.5761082, -1.085526, 1, 0.2745098, 0, 1,
-1.768557, -0.3512618, -0.9028605, 1, 0.282353, 0, 1,
-1.752615, -2.121957, 0.559936, 1, 0.2862745, 0, 1,
-1.739043, -0.3624067, -0.4946243, 1, 0.2941177, 0, 1,
-1.723104, 0.1185302, -0.02298564, 1, 0.3019608, 0, 1,
-1.709497, -0.8904871, -1.736796, 1, 0.3058824, 0, 1,
-1.703906, -0.6891993, -2.772441, 1, 0.3137255, 0, 1,
-1.688083, -0.3735678, -1.617942, 1, 0.3176471, 0, 1,
-1.686467, 0.1475488, -0.3317119, 1, 0.3254902, 0, 1,
-1.683923, 0.8088203, -1.772584, 1, 0.3294118, 0, 1,
-1.67187, -0.04445558, -2.161058, 1, 0.3372549, 0, 1,
-1.670827, -0.7428371, -3.148688, 1, 0.3411765, 0, 1,
-1.647215, 0.5837367, -0.5468469, 1, 0.3490196, 0, 1,
-1.63396, 0.6665998, -0.102914, 1, 0.3529412, 0, 1,
-1.624212, -0.02758666, -0.5053401, 1, 0.3607843, 0, 1,
-1.62087, -0.4379703, -2.482078, 1, 0.3647059, 0, 1,
-1.61391, -0.5981824, -3.536731, 1, 0.372549, 0, 1,
-1.608009, 0.7125006, -2.124327, 1, 0.3764706, 0, 1,
-1.591286, -0.4496536, -0.7973522, 1, 0.3843137, 0, 1,
-1.584237, 0.7848805, -0.2506765, 1, 0.3882353, 0, 1,
-1.579559, -0.6012225, -2.477677, 1, 0.3960784, 0, 1,
-1.576932, 0.5295236, -1.419767, 1, 0.4039216, 0, 1,
-1.57688, -0.259641, -1.340443, 1, 0.4078431, 0, 1,
-1.558498, -0.7052166, -3.081439, 1, 0.4156863, 0, 1,
-1.556184, -0.1479213, -2.320494, 1, 0.4196078, 0, 1,
-1.553218, -1.042442, -2.343136, 1, 0.427451, 0, 1,
-1.546872, 1.283053, 0.00152806, 1, 0.4313726, 0, 1,
-1.538937, -0.7445447, -2.244568, 1, 0.4392157, 0, 1,
-1.537701, 0.3161544, 1.051129, 1, 0.4431373, 0, 1,
-1.533858, 0.8525421, -3.470321, 1, 0.4509804, 0, 1,
-1.520948, -0.3053267, -1.27088, 1, 0.454902, 0, 1,
-1.508628, -1.103908, -1.796042, 1, 0.4627451, 0, 1,
-1.501547, -1.603713, -1.125561, 1, 0.4666667, 0, 1,
-1.500847, -1.991148, -5.134742, 1, 0.4745098, 0, 1,
-1.496982, 1.300409, -1.082212, 1, 0.4784314, 0, 1,
-1.496017, 1.686069, -0.415769, 1, 0.4862745, 0, 1,
-1.493231, 0.5330634, -1.930301, 1, 0.4901961, 0, 1,
-1.488284, -0.5930538, -0.5525206, 1, 0.4980392, 0, 1,
-1.487935, 0.9473355, -2.016891, 1, 0.5058824, 0, 1,
-1.485235, 0.129473, 0.946241, 1, 0.509804, 0, 1,
-1.479656, 0.004245746, -1.639044, 1, 0.5176471, 0, 1,
-1.465351, -1.382289, -2.413653, 1, 0.5215687, 0, 1,
-1.463254, 0.1821086, -1.365089, 1, 0.5294118, 0, 1,
-1.462379, 0.949917, 0.6866475, 1, 0.5333334, 0, 1,
-1.451341, -0.8922904, -1.878555, 1, 0.5411765, 0, 1,
-1.445085, 0.5293603, -2.642764, 1, 0.5450981, 0, 1,
-1.440447, 0.705725, 0.1730146, 1, 0.5529412, 0, 1,
-1.435697, -0.7767252, -2.598444, 1, 0.5568628, 0, 1,
-1.429562, 0.5208539, 0.1965918, 1, 0.5647059, 0, 1,
-1.423946, 0.2522369, -2.099866, 1, 0.5686275, 0, 1,
-1.41821, 1.076786, -2.117774, 1, 0.5764706, 0, 1,
-1.417008, 0.1528192, -1.317575, 1, 0.5803922, 0, 1,
-1.416211, 0.5050913, -1.639937, 1, 0.5882353, 0, 1,
-1.408166, -1.345268, -1.524243, 1, 0.5921569, 0, 1,
-1.389175, 0.4506333, -0.7404878, 1, 0.6, 0, 1,
-1.387339, 0.7601132, -0.5461904, 1, 0.6078432, 0, 1,
-1.369604, -1.284991, -2.150408, 1, 0.6117647, 0, 1,
-1.366967, 0.1486373, -2.822792, 1, 0.6196079, 0, 1,
-1.366063, 0.2065751, -1.772661, 1, 0.6235294, 0, 1,
-1.359021, 1.346322, -1.0405, 1, 0.6313726, 0, 1,
-1.347594, 0.0381845, -2.484446, 1, 0.6352941, 0, 1,
-1.347351, 0.1144004, -0.9006308, 1, 0.6431373, 0, 1,
-1.345374, 1.072811, 0.9801297, 1, 0.6470588, 0, 1,
-1.343294, 1.806816, -1.519968, 1, 0.654902, 0, 1,
-1.336677, 1.013358, 0.1305996, 1, 0.6588235, 0, 1,
-1.332611, -0.1812537, -3.11342, 1, 0.6666667, 0, 1,
-1.331852, 1.746782, 0.5797085, 1, 0.6705883, 0, 1,
-1.326896, 0.4360527, -0.6017382, 1, 0.6784314, 0, 1,
-1.315324, -0.8006912, -4.13148, 1, 0.682353, 0, 1,
-1.312177, -0.103337, -1.01562, 1, 0.6901961, 0, 1,
-1.311798, -1.322315, -4.013219, 1, 0.6941177, 0, 1,
-1.310051, 1.707459, -0.3866023, 1, 0.7019608, 0, 1,
-1.309524, 0.07122257, -0.8385238, 1, 0.7098039, 0, 1,
-1.306425, 0.6557688, -1.354039, 1, 0.7137255, 0, 1,
-1.304641, -1.131122, -0.4252773, 1, 0.7215686, 0, 1,
-1.289937, -0.7098162, -2.477589, 1, 0.7254902, 0, 1,
-1.274548, -0.2032183, -2.716758, 1, 0.7333333, 0, 1,
-1.270537, -1.192638, -0.6028584, 1, 0.7372549, 0, 1,
-1.258028, -0.9824271, -2.491737, 1, 0.7450981, 0, 1,
-1.257716, 0.9235362, -0.8721772, 1, 0.7490196, 0, 1,
-1.254089, -0.943736, -2.061558, 1, 0.7568628, 0, 1,
-1.253539, 1.902066, -0.2918359, 1, 0.7607843, 0, 1,
-1.250581, 1.64133, -2.047506, 1, 0.7686275, 0, 1,
-1.244264, 1.559151, -1.150032, 1, 0.772549, 0, 1,
-1.244033, -0.05665961, 0.9821212, 1, 0.7803922, 0, 1,
-1.243458, 2.594958, -2.148615, 1, 0.7843137, 0, 1,
-1.243338, 0.5638632, -2.260995, 1, 0.7921569, 0, 1,
-1.236342, 0.3303938, -0.7832933, 1, 0.7960784, 0, 1,
-1.235789, 2.126028, 0.3317113, 1, 0.8039216, 0, 1,
-1.229402, 0.7191318, -1.171326, 1, 0.8117647, 0, 1,
-1.227779, -0.3577366, -4.319941, 1, 0.8156863, 0, 1,
-1.226652, -0.02583899, -0.5242515, 1, 0.8235294, 0, 1,
-1.22093, -0.3671864, -2.570796, 1, 0.827451, 0, 1,
-1.215029, 0.3503926, -1.25389, 1, 0.8352941, 0, 1,
-1.196209, 1.719441, -2.25807, 1, 0.8392157, 0, 1,
-1.186614, 0.09583774, -0.6485112, 1, 0.8470588, 0, 1,
-1.184912, -0.401334, -1.925671, 1, 0.8509804, 0, 1,
-1.17111, 0.01959453, -2.17802, 1, 0.8588235, 0, 1,
-1.159547, 1.58274, 0.0897129, 1, 0.8627451, 0, 1,
-1.159243, 0.005088637, -1.645403, 1, 0.8705882, 0, 1,
-1.154291, 0.5911348, -1.592196, 1, 0.8745098, 0, 1,
-1.150693, 3.126612, -2.285839, 1, 0.8823529, 0, 1,
-1.143915, 0.6894983, -0.5543025, 1, 0.8862745, 0, 1,
-1.134186, -0.05569717, -3.548866, 1, 0.8941177, 0, 1,
-1.128533, -0.2391984, -3.191773, 1, 0.8980392, 0, 1,
-1.122465, 0.8031737, -1.709425, 1, 0.9058824, 0, 1,
-1.104079, -0.1211467, -0.8673295, 1, 0.9137255, 0, 1,
-1.098421, 0.6137631, -1.204789, 1, 0.9176471, 0, 1,
-1.097534, -1.309382, -1.64172, 1, 0.9254902, 0, 1,
-1.09005, 0.6765656, -1.013624, 1, 0.9294118, 0, 1,
-1.089649, -0.5974036, -0.6514288, 1, 0.9372549, 0, 1,
-1.087028, 1.163327, -0.4263579, 1, 0.9411765, 0, 1,
-1.086146, -1.075097, -2.723075, 1, 0.9490196, 0, 1,
-1.086099, 0.5421525, -2.355643, 1, 0.9529412, 0, 1,
-1.080419, 1.27215, -1.817804, 1, 0.9607843, 0, 1,
-1.076471, -0.5419608, -3.009152, 1, 0.9647059, 0, 1,
-1.074944, 1.630278, -2.619285, 1, 0.972549, 0, 1,
-1.073403, -1.575739, -2.316895, 1, 0.9764706, 0, 1,
-1.070779, -0.5895872, -3.214093, 1, 0.9843137, 0, 1,
-1.051733, -2.202458, -3.753238, 1, 0.9882353, 0, 1,
-1.046613, -0.8023752, -2.952511, 1, 0.9960784, 0, 1,
-1.037525, 1.427193, -1.716143, 0.9960784, 1, 0, 1,
-1.035955, 1.508112, -0.6348497, 0.9921569, 1, 0, 1,
-1.031265, -0.4253107, -3.234221, 0.9843137, 1, 0, 1,
-1.025241, 0.04491292, -0.6810601, 0.9803922, 1, 0, 1,
-1.017126, 0.03942675, -0.7350716, 0.972549, 1, 0, 1,
-1.014937, -0.4372587, -2.354123, 0.9686275, 1, 0, 1,
-1.008629, -1.049154, -1.985131, 0.9607843, 1, 0, 1,
-0.9963114, 0.4654323, -1.188273, 0.9568627, 1, 0, 1,
-0.988497, 1.155039, -1.106601, 0.9490196, 1, 0, 1,
-0.9880223, 0.6820207, 0.5836582, 0.945098, 1, 0, 1,
-0.9879525, 0.2411026, -2.1532, 0.9372549, 1, 0, 1,
-0.9842741, -1.874897, -3.253044, 0.9333333, 1, 0, 1,
-0.9709616, -0.1175604, -3.288548, 0.9254902, 1, 0, 1,
-0.9629493, 0.7165763, -0.3196563, 0.9215686, 1, 0, 1,
-0.9577013, -0.7576134, -1.714648, 0.9137255, 1, 0, 1,
-0.9568555, 0.7246197, -1.846942, 0.9098039, 1, 0, 1,
-0.9568359, 0.3204355, 0.4975328, 0.9019608, 1, 0, 1,
-0.9431874, 0.312055, -0.5547389, 0.8941177, 1, 0, 1,
-0.9420128, -1.233036, -2.558958, 0.8901961, 1, 0, 1,
-0.9355081, -0.2229988, -0.5944697, 0.8823529, 1, 0, 1,
-0.9272075, 0.9005921, -2.069964, 0.8784314, 1, 0, 1,
-0.9189801, 0.3890166, -1.234023, 0.8705882, 1, 0, 1,
-0.9177488, 1.541158, 0.05409636, 0.8666667, 1, 0, 1,
-0.9109801, 0.1927825, -1.611026, 0.8588235, 1, 0, 1,
-0.9029356, -0.6426193, -2.848476, 0.854902, 1, 0, 1,
-0.8991337, 0.7121128, 0.0358812, 0.8470588, 1, 0, 1,
-0.8985136, 1.338979, -0.003983578, 0.8431373, 1, 0, 1,
-0.8912268, 0.4887916, -1.443358, 0.8352941, 1, 0, 1,
-0.8911604, -0.2390162, -2.785461, 0.8313726, 1, 0, 1,
-0.8833261, 1.257199, -1.039662, 0.8235294, 1, 0, 1,
-0.8810736, -0.9266164, -1.82465, 0.8196079, 1, 0, 1,
-0.8786656, -0.1844751, -0.9309347, 0.8117647, 1, 0, 1,
-0.8755124, -0.4218583, -3.112334, 0.8078431, 1, 0, 1,
-0.871133, -1.087652, -1.33043, 0.8, 1, 0, 1,
-0.865885, -0.7628863, -2.148118, 0.7921569, 1, 0, 1,
-0.864667, -0.3470616, -2.403343, 0.7882353, 1, 0, 1,
-0.8616489, -0.3793608, -1.745309, 0.7803922, 1, 0, 1,
-0.8612837, 0.2162184, -1.294822, 0.7764706, 1, 0, 1,
-0.8598647, -0.9670724, -2.157649, 0.7686275, 1, 0, 1,
-0.8582952, 0.1118185, -1.233713, 0.7647059, 1, 0, 1,
-0.8566548, 0.9101443, -0.7117999, 0.7568628, 1, 0, 1,
-0.8500649, -0.768052, -0.7625443, 0.7529412, 1, 0, 1,
-0.8443639, -1.220329, -2.908305, 0.7450981, 1, 0, 1,
-0.8383265, -0.5136966, -2.585165, 0.7411765, 1, 0, 1,
-0.8342123, -0.9641479, -4.382872, 0.7333333, 1, 0, 1,
-0.8334047, 0.9105709, -0.5291974, 0.7294118, 1, 0, 1,
-0.8315445, -1.174551, -2.211679, 0.7215686, 1, 0, 1,
-0.8296225, 0.04901382, -1.121573, 0.7176471, 1, 0, 1,
-0.8288182, -1.829681, -1.311412, 0.7098039, 1, 0, 1,
-0.8235213, 0.3161294, -2.207304, 0.7058824, 1, 0, 1,
-0.8142762, -0.7104689, -1.195837, 0.6980392, 1, 0, 1,
-0.8107848, 1.1482, -1.013586, 0.6901961, 1, 0, 1,
-0.8072261, -1.044641, -1.614553, 0.6862745, 1, 0, 1,
-0.8063116, 0.2337301, -1.54439, 0.6784314, 1, 0, 1,
-0.8050205, 0.4532316, -3.57856, 0.6745098, 1, 0, 1,
-0.803027, -0.1478063, -0.9699668, 0.6666667, 1, 0, 1,
-0.8004684, 0.6929866, -0.5376878, 0.6627451, 1, 0, 1,
-0.7994665, -0.3775318, -1.076156, 0.654902, 1, 0, 1,
-0.798585, 2.075874, -2.136714, 0.6509804, 1, 0, 1,
-0.7939394, 1.126263, -1.589349, 0.6431373, 1, 0, 1,
-0.7935154, -1.751759, -2.221948, 0.6392157, 1, 0, 1,
-0.7934884, 0.4821582, 0.02293202, 0.6313726, 1, 0, 1,
-0.7922835, 0.2638815, -1.071555, 0.627451, 1, 0, 1,
-0.7838088, -1.827847, -5.130605, 0.6196079, 1, 0, 1,
-0.7822691, -0.7049319, -1.691382, 0.6156863, 1, 0, 1,
-0.779569, 0.1093514, -2.908871, 0.6078432, 1, 0, 1,
-0.7782604, -0.9218197, -2.182874, 0.6039216, 1, 0, 1,
-0.7770905, -0.6706057, -1.475454, 0.5960785, 1, 0, 1,
-0.7643272, 0.534694, -0.6926979, 0.5882353, 1, 0, 1,
-0.7602486, 0.3681469, 0.02822676, 0.5843138, 1, 0, 1,
-0.7568847, 0.2899475, -0.7823851, 0.5764706, 1, 0, 1,
-0.7558795, -1.292717, -1.174637, 0.572549, 1, 0, 1,
-0.7556406, 1.339097, -1.683955, 0.5647059, 1, 0, 1,
-0.7547111, -0.7852255, -1.070775, 0.5607843, 1, 0, 1,
-0.7462685, -1.507928, -3.341639, 0.5529412, 1, 0, 1,
-0.7438604, -0.8061518, -2.38939, 0.5490196, 1, 0, 1,
-0.7347147, -0.517912, -0.2335222, 0.5411765, 1, 0, 1,
-0.7345304, 0.02770566, -1.353593, 0.5372549, 1, 0, 1,
-0.7292041, -1.539669, -2.698445, 0.5294118, 1, 0, 1,
-0.7210584, -1.326954, -2.39135, 0.5254902, 1, 0, 1,
-0.7209198, -0.5895704, -1.654256, 0.5176471, 1, 0, 1,
-0.7168578, -1.068424, -2.267369, 0.5137255, 1, 0, 1,
-0.714981, -0.1899524, -0.4707656, 0.5058824, 1, 0, 1,
-0.7130318, 0.8888288, 0.8862797, 0.5019608, 1, 0, 1,
-0.7106188, 0.1705701, -1.318156, 0.4941176, 1, 0, 1,
-0.7105061, 0.1903742, -1.921733, 0.4862745, 1, 0, 1,
-0.7036228, -0.261782, -0.569351, 0.4823529, 1, 0, 1,
-0.7027354, 0.1567066, -0.3198532, 0.4745098, 1, 0, 1,
-0.7011895, -0.8295752, -2.262381, 0.4705882, 1, 0, 1,
-0.6982011, 0.1336952, -1.90915, 0.4627451, 1, 0, 1,
-0.697434, 1.746606, -0.1633668, 0.4588235, 1, 0, 1,
-0.6970026, 0.1211804, -1.579666, 0.4509804, 1, 0, 1,
-0.6954602, 0.07736735, -1.781997, 0.4470588, 1, 0, 1,
-0.694859, 0.9264768, -0.6615039, 0.4392157, 1, 0, 1,
-0.6943063, 0.4966542, -1.069148, 0.4352941, 1, 0, 1,
-0.6879083, -0.7115061, -2.172076, 0.427451, 1, 0, 1,
-0.6869281, -1.043358, -2.337957, 0.4235294, 1, 0, 1,
-0.6826572, 0.3157243, -1.592048, 0.4156863, 1, 0, 1,
-0.681529, -1.867799, -1.593811, 0.4117647, 1, 0, 1,
-0.6769767, 1.384897, -0.6459273, 0.4039216, 1, 0, 1,
-0.6648917, 1.61227, -0.5881953, 0.3960784, 1, 0, 1,
-0.6630121, 0.3110603, -0.7671237, 0.3921569, 1, 0, 1,
-0.6597773, -1.833033, -3.060454, 0.3843137, 1, 0, 1,
-0.6581097, -0.1613703, -1.33891, 0.3803922, 1, 0, 1,
-0.6520296, -1.491849, -4.343199, 0.372549, 1, 0, 1,
-0.6310699, 1.017231, -0.3300515, 0.3686275, 1, 0, 1,
-0.630633, 2.483987, -0.1828181, 0.3607843, 1, 0, 1,
-0.6281847, -2.36735, -3.379269, 0.3568628, 1, 0, 1,
-0.6188266, 0.3227119, -1.024419, 0.3490196, 1, 0, 1,
-0.6119855, -0.4269685, -3.300477, 0.345098, 1, 0, 1,
-0.6058944, 0.2770053, 0.66907, 0.3372549, 1, 0, 1,
-0.6039193, 2.068911, -0.2106841, 0.3333333, 1, 0, 1,
-0.6015101, -0.6211393, -1.605562, 0.3254902, 1, 0, 1,
-0.5998523, 1.060812, -0.6705207, 0.3215686, 1, 0, 1,
-0.5954351, -0.1398283, -1.957218, 0.3137255, 1, 0, 1,
-0.5951129, 0.2132638, -2.175794, 0.3098039, 1, 0, 1,
-0.5929487, -0.472139, -2.128999, 0.3019608, 1, 0, 1,
-0.576631, 0.1067529, -1.885173, 0.2941177, 1, 0, 1,
-0.5753348, -1.13687, -3.86786, 0.2901961, 1, 0, 1,
-0.574881, -1.004821, -2.185677, 0.282353, 1, 0, 1,
-0.5740374, -1.724519, -1.501778, 0.2784314, 1, 0, 1,
-0.5717427, 0.7244224, -0.5378655, 0.2705882, 1, 0, 1,
-0.5717052, 1.809072, -0.09883259, 0.2666667, 1, 0, 1,
-0.5650758, 0.5711175, 0.6765637, 0.2588235, 1, 0, 1,
-0.5608843, -1.393868, -2.989483, 0.254902, 1, 0, 1,
-0.5534785, -0.00441932, -0.3403317, 0.2470588, 1, 0, 1,
-0.5532275, -0.08746852, -4.230869, 0.2431373, 1, 0, 1,
-0.550805, 0.124496, -1.767498, 0.2352941, 1, 0, 1,
-0.5498735, -0.5986192, -2.499571, 0.2313726, 1, 0, 1,
-0.545462, 1.621232, 0.06929347, 0.2235294, 1, 0, 1,
-0.5347839, 0.8352244, -0.5744017, 0.2196078, 1, 0, 1,
-0.5346754, -1.371911, -3.605491, 0.2117647, 1, 0, 1,
-0.5331772, -0.9755388, -2.96052, 0.2078431, 1, 0, 1,
-0.5316844, -0.6220129, -1.9311, 0.2, 1, 0, 1,
-0.5264649, -1.083462, -1.704547, 0.1921569, 1, 0, 1,
-0.5259892, 0.1873037, -0.9719506, 0.1882353, 1, 0, 1,
-0.522613, 0.3518549, -1.136088, 0.1803922, 1, 0, 1,
-0.5179354, -2.240273, -3.00733, 0.1764706, 1, 0, 1,
-0.5168762, 0.873154, -0.0821586, 0.1686275, 1, 0, 1,
-0.5130708, -0.6455973, -1.859488, 0.1647059, 1, 0, 1,
-0.5126732, -2.069271, -5.143194, 0.1568628, 1, 0, 1,
-0.5112545, -0.7806511, -1.296082, 0.1529412, 1, 0, 1,
-0.5058718, 0.4280694, -1.212235, 0.145098, 1, 0, 1,
-0.5053522, -0.379752, -3.745023, 0.1411765, 1, 0, 1,
-0.4975138, 0.1104031, -1.446415, 0.1333333, 1, 0, 1,
-0.4975091, 0.3840712, -0.9711921, 0.1294118, 1, 0, 1,
-0.491042, -0.618048, -3.873315, 0.1215686, 1, 0, 1,
-0.490864, 0.2871238, 0.06069971, 0.1176471, 1, 0, 1,
-0.4898039, -0.06760234, -2.700276, 0.1098039, 1, 0, 1,
-0.4863353, 0.140312, -0.07127313, 0.1058824, 1, 0, 1,
-0.4831787, -0.3156058, -4.72346, 0.09803922, 1, 0, 1,
-0.4788553, 0.5949378, -0.3853606, 0.09019608, 1, 0, 1,
-0.4788362, -0.03890069, -1.954562, 0.08627451, 1, 0, 1,
-0.4742693, 0.5436123, -0.531664, 0.07843138, 1, 0, 1,
-0.4707368, -0.3178031, -1.208367, 0.07450981, 1, 0, 1,
-0.4679009, 1.494197, -0.5119359, 0.06666667, 1, 0, 1,
-0.464983, -0.3091199, -2.477125, 0.0627451, 1, 0, 1,
-0.462563, 1.262726, 0.4788469, 0.05490196, 1, 0, 1,
-0.4575113, 0.6495515, -0.7349397, 0.05098039, 1, 0, 1,
-0.4558105, -0.4690305, -2.28839, 0.04313726, 1, 0, 1,
-0.4490892, -2.138142, -3.982831, 0.03921569, 1, 0, 1,
-0.4489679, 0.3982992, -0.6097521, 0.03137255, 1, 0, 1,
-0.446747, -0.584482, -1.889896, 0.02745098, 1, 0, 1,
-0.4458104, 1.27846, 0.0996162, 0.01960784, 1, 0, 1,
-0.4440984, -0.8427376, -2.033982, 0.01568628, 1, 0, 1,
-0.4432802, 0.2171878, -2.446454, 0.007843138, 1, 0, 1,
-0.4429682, -0.807945, -3.20517, 0.003921569, 1, 0, 1,
-0.441486, -0.7740011, -3.260702, 0, 1, 0.003921569, 1,
-0.4389009, 0.710102, -1.563396, 0, 1, 0.01176471, 1,
-0.4386921, -0.4102489, -1.153818, 0, 1, 0.01568628, 1,
-0.437804, 1.31371, -0.3938378, 0, 1, 0.02352941, 1,
-0.4375612, -1.78186, -2.971665, 0, 1, 0.02745098, 1,
-0.4372551, 1.166491, -1.004234, 0, 1, 0.03529412, 1,
-0.431872, -0.7961935, -3.226322, 0, 1, 0.03921569, 1,
-0.4316463, 0.1924532, -1.601683, 0, 1, 0.04705882, 1,
-0.4306036, 0.6926063, 0.2925112, 0, 1, 0.05098039, 1,
-0.4279988, 0.7268983, -1.503582, 0, 1, 0.05882353, 1,
-0.4221708, -0.9574506, -2.879959, 0, 1, 0.0627451, 1,
-0.4217848, 0.9619187, 2.224522, 0, 1, 0.07058824, 1,
-0.4209502, 0.8655792, -0.2266453, 0, 1, 0.07450981, 1,
-0.4209277, 0.39226, -0.625568, 0, 1, 0.08235294, 1,
-0.4193735, -0.9546213, -2.868909, 0, 1, 0.08627451, 1,
-0.418669, -1.304073, -3.174032, 0, 1, 0.09411765, 1,
-0.4156274, -1.085064, -3.630461, 0, 1, 0.1019608, 1,
-0.4030443, 0.7170542, 0.7203047, 0, 1, 0.1058824, 1,
-0.40072, -0.5592204, -2.553298, 0, 1, 0.1137255, 1,
-0.397891, -1.776142, -3.654385, 0, 1, 0.1176471, 1,
-0.3905777, 1.00835, -0.3047005, 0, 1, 0.1254902, 1,
-0.3904613, 0.5345489, -2.134407, 0, 1, 0.1294118, 1,
-0.3838048, -1.85518, -3.954341, 0, 1, 0.1372549, 1,
-0.3813655, 0.5504093, 0.5869534, 0, 1, 0.1411765, 1,
-0.3767267, 0.5736818, 0.5912192, 0, 1, 0.1490196, 1,
-0.3719924, 0.1145578, -2.224846, 0, 1, 0.1529412, 1,
-0.3706729, -0.6837142, -4.20274, 0, 1, 0.1607843, 1,
-0.3690007, -0.003750146, 0.3504032, 0, 1, 0.1647059, 1,
-0.3676606, 0.5214313, -0.6434728, 0, 1, 0.172549, 1,
-0.36595, -0.8411866, -4.389036, 0, 1, 0.1764706, 1,
-0.3524665, -0.305997, -1.981432, 0, 1, 0.1843137, 1,
-0.3508668, -1.143503, -4.919697, 0, 1, 0.1882353, 1,
-0.350849, 0.3979873, 0.8536387, 0, 1, 0.1960784, 1,
-0.3508149, -0.7757547, -1.719554, 0, 1, 0.2039216, 1,
-0.339849, 0.1352608, -1.635339, 0, 1, 0.2078431, 1,
-0.3397434, -0.8457803, -1.536937, 0, 1, 0.2156863, 1,
-0.3396194, 0.9448512, -2.742287, 0, 1, 0.2196078, 1,
-0.3370787, -2.051529, -3.243154, 0, 1, 0.227451, 1,
-0.3361065, 0.6055378, -1.317387, 0, 1, 0.2313726, 1,
-0.3344446, 0.7317448, 1.301301, 0, 1, 0.2392157, 1,
-0.3332116, -0.2479066, -2.568977, 0, 1, 0.2431373, 1,
-0.3318137, 0.6491551, -1.064141, 0, 1, 0.2509804, 1,
-0.3269432, 0.1790398, 0.5806584, 0, 1, 0.254902, 1,
-0.3213462, -1.395531, -4.422315, 0, 1, 0.2627451, 1,
-0.3209995, -1.95358, -2.476554, 0, 1, 0.2666667, 1,
-0.3195302, -0.2804248, -3.184446, 0, 1, 0.2745098, 1,
-0.3145485, 1.166026, 0.2748384, 0, 1, 0.2784314, 1,
-0.3144918, -0.6386905, -3.592456, 0, 1, 0.2862745, 1,
-0.3137201, 0.1721111, 0.2260098, 0, 1, 0.2901961, 1,
-0.3136981, 0.01311137, -1.070134, 0, 1, 0.2980392, 1,
-0.3087439, -0.1245641, -2.231518, 0, 1, 0.3058824, 1,
-0.3067054, -0.5136883, -2.207211, 0, 1, 0.3098039, 1,
-0.3050834, -0.5956975, -2.597341, 0, 1, 0.3176471, 1,
-0.3003405, -2.032248, -3.308385, 0, 1, 0.3215686, 1,
-0.2989899, 0.5037354, 0.4812302, 0, 1, 0.3294118, 1,
-0.2974691, -0.6121798, -2.174924, 0, 1, 0.3333333, 1,
-0.2927767, -0.9589532, -2.467799, 0, 1, 0.3411765, 1,
-0.292635, 1.765479, 0.5399003, 0, 1, 0.345098, 1,
-0.2924132, -0.625559, -0.9670509, 0, 1, 0.3529412, 1,
-0.2887859, 0.4963493, -0.8255676, 0, 1, 0.3568628, 1,
-0.2883323, 0.0861019, 0.5032114, 0, 1, 0.3647059, 1,
-0.2866838, -0.6077742, -4.555156, 0, 1, 0.3686275, 1,
-0.2814213, 0.2232714, -0.6194513, 0, 1, 0.3764706, 1,
-0.2813626, 1.284412, 1.024651, 0, 1, 0.3803922, 1,
-0.2772017, 0.8149177, 0.3512985, 0, 1, 0.3882353, 1,
-0.2727851, 2.900035, -0.7211523, 0, 1, 0.3921569, 1,
-0.2717088, -0.6642237, -0.1785546, 0, 1, 0.4, 1,
-0.2715668, 2.515865, -0.6478524, 0, 1, 0.4078431, 1,
-0.2688533, -1.064878, -2.205078, 0, 1, 0.4117647, 1,
-0.2664407, -0.5469983, -3.055999, 0, 1, 0.4196078, 1,
-0.2645061, 1.554693, -1.009219, 0, 1, 0.4235294, 1,
-0.2643688, 0.0468515, -2.064101, 0, 1, 0.4313726, 1,
-0.2641241, 0.458295, 0.4465384, 0, 1, 0.4352941, 1,
-0.2619744, 0.9585328, -1.654905, 0, 1, 0.4431373, 1,
-0.2604099, -0.812125, -2.834089, 0, 1, 0.4470588, 1,
-0.2594873, -2.201117, -3.070367, 0, 1, 0.454902, 1,
-0.2585533, 2.059206, 0.5433974, 0, 1, 0.4588235, 1,
-0.2572844, -0.191368, -1.788406, 0, 1, 0.4666667, 1,
-0.2558982, -0.3508146, -2.841277, 0, 1, 0.4705882, 1,
-0.254369, -1.374877, -3.319291, 0, 1, 0.4784314, 1,
-0.2487236, 2.434437, 1.553194, 0, 1, 0.4823529, 1,
-0.2444668, -0.3386495, -1.406575, 0, 1, 0.4901961, 1,
-0.239631, 0.06490073, -2.037685, 0, 1, 0.4941176, 1,
-0.2332375, -0.1274882, -2.701258, 0, 1, 0.5019608, 1,
-0.2327715, 0.03580737, -1.855533, 0, 1, 0.509804, 1,
-0.2321355, 1.572487, 0.4356528, 0, 1, 0.5137255, 1,
-0.231384, 0.6812539, -1.036501, 0, 1, 0.5215687, 1,
-0.2307675, 1.310145, 0.567297, 0, 1, 0.5254902, 1,
-0.2263953, -1.028495, -2.647503, 0, 1, 0.5333334, 1,
-0.2236908, -0.8663555, -1.949739, 0, 1, 0.5372549, 1,
-0.2227273, -0.1843691, -2.846133, 0, 1, 0.5450981, 1,
-0.221656, 0.6260406, -0.5900169, 0, 1, 0.5490196, 1,
-0.2207532, 1.222215, 1.164821, 0, 1, 0.5568628, 1,
-0.2194142, -0.6161478, -2.378788, 0, 1, 0.5607843, 1,
-0.2133341, 0.7657839, 0.9124214, 0, 1, 0.5686275, 1,
-0.2113235, 0.2057586, -1.274389, 0, 1, 0.572549, 1,
-0.2017806, -0.4542265, -1.356116, 0, 1, 0.5803922, 1,
-0.1986893, 0.2293224, -0.7236252, 0, 1, 0.5843138, 1,
-0.1984544, -0.1960015, -1.83334, 0, 1, 0.5921569, 1,
-0.1909098, -0.01776298, -2.550035, 0, 1, 0.5960785, 1,
-0.188612, -0.008619426, -0.8230341, 0, 1, 0.6039216, 1,
-0.1829161, 0.2984023, 0.5423455, 0, 1, 0.6117647, 1,
-0.1790157, -0.736367, -1.614844, 0, 1, 0.6156863, 1,
-0.1757982, 1.586971, -0.1558735, 0, 1, 0.6235294, 1,
-0.1745654, 1.113982, -0.7371947, 0, 1, 0.627451, 1,
-0.1720169, -0.03571591, -0.2913563, 0, 1, 0.6352941, 1,
-0.1693023, 0.7420414, -0.06460634, 0, 1, 0.6392157, 1,
-0.1661949, 0.7423294, -0.8082372, 0, 1, 0.6470588, 1,
-0.1628437, -0.2335071, -3.485672, 0, 1, 0.6509804, 1,
-0.1619353, -0.1568779, -2.629315, 0, 1, 0.6588235, 1,
-0.1469865, 0.4243277, 0.366164, 0, 1, 0.6627451, 1,
-0.1465548, 0.1553383, 2.135025, 0, 1, 0.6705883, 1,
-0.1393072, -0.5400553, -3.399168, 0, 1, 0.6745098, 1,
-0.1339732, -1.094648, -2.424649, 0, 1, 0.682353, 1,
-0.1332408, 1.597243, -1.518227, 0, 1, 0.6862745, 1,
-0.1213502, -0.1631747, -0.9006072, 0, 1, 0.6941177, 1,
-0.1151299, 1.167973, -1.384445, 0, 1, 0.7019608, 1,
-0.1134735, 1.406612, -0.1345892, 0, 1, 0.7058824, 1,
-0.1039845, -0.2957804, -3.962264, 0, 1, 0.7137255, 1,
-0.1021566, 1.691, 0.5954896, 0, 1, 0.7176471, 1,
-0.1019435, 0.05982254, -0.399498, 0, 1, 0.7254902, 1,
-0.1016818, 0.2792249, 0.9086879, 0, 1, 0.7294118, 1,
-0.0965925, 0.3631178, -1.164391, 0, 1, 0.7372549, 1,
-0.09445453, -0.5574485, -2.220556, 0, 1, 0.7411765, 1,
-0.0917609, -2.510637, -4.898568, 0, 1, 0.7490196, 1,
-0.0916812, -0.1436227, -1.584698, 0, 1, 0.7529412, 1,
-0.09166174, 1.742046, -0.2403797, 0, 1, 0.7607843, 1,
-0.08935754, 1.453146, 0.3747581, 0, 1, 0.7647059, 1,
-0.08888353, 0.6223, -1.419844, 0, 1, 0.772549, 1,
-0.0860242, 0.9056241, -0.5800223, 0, 1, 0.7764706, 1,
-0.08374763, -2.679675, -1.751546, 0, 1, 0.7843137, 1,
-0.08273786, -0.789534, -3.471768, 0, 1, 0.7882353, 1,
-0.08237872, 0.8217292, -1.045224, 0, 1, 0.7960784, 1,
-0.07971898, -1.505334, -2.046896, 0, 1, 0.8039216, 1,
-0.07906499, -2.037198, -2.682818, 0, 1, 0.8078431, 1,
-0.07661653, -1.233189, -2.335484, 0, 1, 0.8156863, 1,
-0.07647385, 0.8560897, -1.088075, 0, 1, 0.8196079, 1,
-0.06922918, -1.100567, -2.464249, 0, 1, 0.827451, 1,
-0.06772959, -1.560858, -2.922783, 0, 1, 0.8313726, 1,
-0.06383889, -0.2216958, -2.720037, 0, 1, 0.8392157, 1,
-0.06363255, -0.6708044, -3.72403, 0, 1, 0.8431373, 1,
-0.06018057, -0.9690315, -3.48581, 0, 1, 0.8509804, 1,
-0.05818459, -0.7551496, -4.566742, 0, 1, 0.854902, 1,
-0.05811239, 0.7064319, 0.9904416, 0, 1, 0.8627451, 1,
-0.05701869, 0.001546894, -4.011549, 0, 1, 0.8666667, 1,
-0.05399454, -0.5692763, -3.199371, 0, 1, 0.8745098, 1,
-0.05152279, -0.8034621, -2.69362, 0, 1, 0.8784314, 1,
-0.0512275, 0.1303149, -1.01742, 0, 1, 0.8862745, 1,
-0.05109892, -0.0551515, -2.124483, 0, 1, 0.8901961, 1,
-0.05064634, 1.371856, -0.3495586, 0, 1, 0.8980392, 1,
-0.04771345, -1.464445, -5.257391, 0, 1, 0.9058824, 1,
-0.04379352, -0.3456255, -4.456443, 0, 1, 0.9098039, 1,
-0.04222962, -2.111246, -3.079486, 0, 1, 0.9176471, 1,
-0.04003363, -1.859027, -1.944449, 0, 1, 0.9215686, 1,
-0.03201651, -1.705227, -3.826539, 0, 1, 0.9294118, 1,
-0.03004444, 0.1239335, -0.8236089, 0, 1, 0.9333333, 1,
-0.02770645, 0.9371812, -0.9818642, 0, 1, 0.9411765, 1,
-0.0276654, 0.5829806, -0.02396601, 0, 1, 0.945098, 1,
-0.01761054, -0.6981992, -0.3852918, 0, 1, 0.9529412, 1,
-0.01712818, -1.686637, -3.651798, 0, 1, 0.9568627, 1,
-0.01673942, -0.3852357, -4.04399, 0, 1, 0.9647059, 1,
-0.01276557, -0.1305783, -3.311221, 0, 1, 0.9686275, 1,
-0.01124533, 0.5723692, -0.2114002, 0, 1, 0.9764706, 1,
-0.003449948, 0.3951814, -1.52618, 0, 1, 0.9803922, 1,
0.002843011, -0.02291621, 2.060726, 0, 1, 0.9882353, 1,
0.006142488, -1.066604, 2.648699, 0, 1, 0.9921569, 1,
0.007243412, -0.05926663, 3.489595, 0, 1, 1, 1,
0.008765794, 0.6198751, -0.1692669, 0, 0.9921569, 1, 1,
0.009658489, -0.2567211, 2.942007, 0, 0.9882353, 1, 1,
0.01049364, 0.4303776, -0.4372804, 0, 0.9803922, 1, 1,
0.01154787, -0.6050155, 1.686578, 0, 0.9764706, 1, 1,
0.01220373, 0.7493163, 1.133304, 0, 0.9686275, 1, 1,
0.01466623, -1.244435, 2.732531, 0, 0.9647059, 1, 1,
0.01895437, -0.575712, 2.465615, 0, 0.9568627, 1, 1,
0.0281979, -0.1344073, 2.139697, 0, 0.9529412, 1, 1,
0.02888663, -0.724631, 4.323368, 0, 0.945098, 1, 1,
0.03003488, 0.2570162, -0.1872366, 0, 0.9411765, 1, 1,
0.03543502, -0.4445151, 3.139795, 0, 0.9333333, 1, 1,
0.03908285, -0.1923689, 2.706565, 0, 0.9294118, 1, 1,
0.0405354, -0.9825844, 1.491723, 0, 0.9215686, 1, 1,
0.04490741, -2.723864, 2.901105, 0, 0.9176471, 1, 1,
0.0460788, 0.4843549, -0.05161392, 0, 0.9098039, 1, 1,
0.04684253, 0.01721938, 1.799125, 0, 0.9058824, 1, 1,
0.04708255, -1.781649, 3.622589, 0, 0.8980392, 1, 1,
0.05470524, 0.1505572, 1.28054, 0, 0.8901961, 1, 1,
0.05621925, 0.8695538, 0.3355014, 0, 0.8862745, 1, 1,
0.05736521, -0.4508545, 1.276938, 0, 0.8784314, 1, 1,
0.0611906, 0.6169237, 0.8024487, 0, 0.8745098, 1, 1,
0.06443022, 0.5422173, 0.4626714, 0, 0.8666667, 1, 1,
0.06562129, 0.881896, 0.5958812, 0, 0.8627451, 1, 1,
0.06615423, 0.5654658, -0.2066608, 0, 0.854902, 1, 1,
0.07524917, 0.2559668, 1.446249, 0, 0.8509804, 1, 1,
0.07964458, 0.635052, -1.748557, 0, 0.8431373, 1, 1,
0.08343232, -2.081726, 2.348664, 0, 0.8392157, 1, 1,
0.08543986, 0.05327177, 1.771064, 0, 0.8313726, 1, 1,
0.08655847, -0.278092, 2.891153, 0, 0.827451, 1, 1,
0.08752842, -0.1382808, 3.352644, 0, 0.8196079, 1, 1,
0.08962074, -0.9441646, 2.564341, 0, 0.8156863, 1, 1,
0.09315424, 0.003815737, 0.2972136, 0, 0.8078431, 1, 1,
0.09318203, 0.1741609, 1.253205, 0, 0.8039216, 1, 1,
0.09918579, -0.260196, 1.942718, 0, 0.7960784, 1, 1,
0.109937, -0.2284068, 1.776333, 0, 0.7882353, 1, 1,
0.1158001, 1.975446, -0.809368, 0, 0.7843137, 1, 1,
0.1164022, 1.603572, 1.103763, 0, 0.7764706, 1, 1,
0.1168174, 0.2928107, 0.2226705, 0, 0.772549, 1, 1,
0.1185097, 0.505969, -1.163528, 0, 0.7647059, 1, 1,
0.1189486, -0.1393348, 3.269195, 0, 0.7607843, 1, 1,
0.1200037, 1.10887, -1.079923, 0, 0.7529412, 1, 1,
0.1225191, 0.7901933, -0.7456346, 0, 0.7490196, 1, 1,
0.1236748, 1.036536, -1.029121, 0, 0.7411765, 1, 1,
0.1275286, 1.738325, -1.445019, 0, 0.7372549, 1, 1,
0.1283247, 0.3355606, 0.1807201, 0, 0.7294118, 1, 1,
0.1306323, -0.196842, 0.3028172, 0, 0.7254902, 1, 1,
0.1350678, -0.4387785, 1.193786, 0, 0.7176471, 1, 1,
0.1384141, -0.5265125, 3.420667, 0, 0.7137255, 1, 1,
0.1431387, 0.2902625, 0.3444298, 0, 0.7058824, 1, 1,
0.1440396, 0.5244845, -0.6076494, 0, 0.6980392, 1, 1,
0.1441609, 0.6761005, -0.4544985, 0, 0.6941177, 1, 1,
0.1469411, -1.306673, 3.013631, 0, 0.6862745, 1, 1,
0.1475899, -0.2059869, 2.057759, 0, 0.682353, 1, 1,
0.1492992, 0.4595055, 0.01999071, 0, 0.6745098, 1, 1,
0.1543954, 0.07715855, 1.005174, 0, 0.6705883, 1, 1,
0.1548691, -0.09429922, 1.96576, 0, 0.6627451, 1, 1,
0.1596538, 0.1700495, 1.11851, 0, 0.6588235, 1, 1,
0.1627141, -0.02070843, 1.193477, 0, 0.6509804, 1, 1,
0.1646148, -0.02867501, 3.223752, 0, 0.6470588, 1, 1,
0.1668796, -0.3463648, 2.210951, 0, 0.6392157, 1, 1,
0.166969, -1.259346, 3.617106, 0, 0.6352941, 1, 1,
0.1674863, -0.175367, 2.264916, 0, 0.627451, 1, 1,
0.1709965, 0.3706776, 0.01551936, 0, 0.6235294, 1, 1,
0.1711479, -0.3649352, 3.552541, 0, 0.6156863, 1, 1,
0.1723999, -0.0130796, 1.165366, 0, 0.6117647, 1, 1,
0.1740618, 0.1980279, 1.568121, 0, 0.6039216, 1, 1,
0.1772974, 1.935698, 1.951856, 0, 0.5960785, 1, 1,
0.1811818, -1.051494, 2.931059, 0, 0.5921569, 1, 1,
0.1844831, -0.5397554, 1.37456, 0, 0.5843138, 1, 1,
0.1857158, 1.562981, 1.227082, 0, 0.5803922, 1, 1,
0.1861884, 1.550854, -0.7401242, 0, 0.572549, 1, 1,
0.1885416, 0.4742231, 0.369138, 0, 0.5686275, 1, 1,
0.1887511, 0.4110453, 1.82024, 0, 0.5607843, 1, 1,
0.2002805, 1.006628, -0.9871014, 0, 0.5568628, 1, 1,
0.2013512, -0.710224, 2.746659, 0, 0.5490196, 1, 1,
0.2078788, -0.2411656, 3.142502, 0, 0.5450981, 1, 1,
0.2141698, 0.2177465, 1.109024, 0, 0.5372549, 1, 1,
0.2166959, 0.8072903, 0.809375, 0, 0.5333334, 1, 1,
0.220363, 1.202194, -0.2226167, 0, 0.5254902, 1, 1,
0.2204731, -0.4998276, 2.276208, 0, 0.5215687, 1, 1,
0.2207271, -0.2542034, 2.717096, 0, 0.5137255, 1, 1,
0.2220755, 0.3736307, -0.4145119, 0, 0.509804, 1, 1,
0.2231895, -0.2874291, 2.059835, 0, 0.5019608, 1, 1,
0.2253494, 0.8696917, 1.089554, 0, 0.4941176, 1, 1,
0.2266807, -1.403843, 2.573776, 0, 0.4901961, 1, 1,
0.2270782, 0.1117896, 0.9799162, 0, 0.4823529, 1, 1,
0.2279626, 0.8897742, -0.1045287, 0, 0.4784314, 1, 1,
0.2291686, 1.537696, 2.458055, 0, 0.4705882, 1, 1,
0.231754, 0.6334217, -1.054889, 0, 0.4666667, 1, 1,
0.2357879, 0.1778072, -1.021521, 0, 0.4588235, 1, 1,
0.2368236, 0.8573502, -0.7146679, 0, 0.454902, 1, 1,
0.2385674, 0.620303, 0.8876345, 0, 0.4470588, 1, 1,
0.2431811, -0.9595546, 1.568447, 0, 0.4431373, 1, 1,
0.2447329, 0.009298403, 1.826907, 0, 0.4352941, 1, 1,
0.2458131, 0.4712106, 1.238243, 0, 0.4313726, 1, 1,
0.2590387, 0.288212, 1.517305, 0, 0.4235294, 1, 1,
0.2601776, 0.7416849, -0.7036642, 0, 0.4196078, 1, 1,
0.263491, -0.9738894, 2.274731, 0, 0.4117647, 1, 1,
0.2648736, 0.6832156, 0.8370236, 0, 0.4078431, 1, 1,
0.2660717, 1.425006, 0.6294114, 0, 0.4, 1, 1,
0.2663725, 0.7754357, 0.8379136, 0, 0.3921569, 1, 1,
0.268122, -0.3533115, 1.2745, 0, 0.3882353, 1, 1,
0.2689133, 0.7487561, -0.992315, 0, 0.3803922, 1, 1,
0.2697862, -0.4905518, 2.297221, 0, 0.3764706, 1, 1,
0.2711284, -0.597474, 3.09033, 0, 0.3686275, 1, 1,
0.2716293, 0.2325491, 1.687206, 0, 0.3647059, 1, 1,
0.2735879, -1.98473, 4.704959, 0, 0.3568628, 1, 1,
0.2745641, -0.3249892, 0.4106998, 0, 0.3529412, 1, 1,
0.2762768, -0.8210855, 4.14702, 0, 0.345098, 1, 1,
0.2839593, 0.3683605, -0.4312251, 0, 0.3411765, 1, 1,
0.2886699, -0.9180953, 4.345844, 0, 0.3333333, 1, 1,
0.2892553, -1.513909, 2.65254, 0, 0.3294118, 1, 1,
0.2904111, -0.1537377, 0.967971, 0, 0.3215686, 1, 1,
0.2913571, -1.177992, 4.502977, 0, 0.3176471, 1, 1,
0.2947124, 2.222447, 0.03691756, 0, 0.3098039, 1, 1,
0.2955927, -1.326643, 3.813836, 0, 0.3058824, 1, 1,
0.2965876, -1.513911, 2.705647, 0, 0.2980392, 1, 1,
0.3026233, -0.6066032, 3.335513, 0, 0.2901961, 1, 1,
0.3064163, -0.02133442, 2.447404, 0, 0.2862745, 1, 1,
0.3077926, -0.8773697, 1.482816, 0, 0.2784314, 1, 1,
0.3091987, 1.002555, -1.034236, 0, 0.2745098, 1, 1,
0.3107209, -0.8063494, 2.133637, 0, 0.2666667, 1, 1,
0.3161729, 0.8151203, 1.468777, 0, 0.2627451, 1, 1,
0.3251441, 0.2898376, 0.2998376, 0, 0.254902, 1, 1,
0.3351548, 1.248522, 1.094798, 0, 0.2509804, 1, 1,
0.337887, -0.004501475, 0.8820657, 0, 0.2431373, 1, 1,
0.3390093, 0.02380506, 1.827294, 0, 0.2392157, 1, 1,
0.3458739, 0.486844, 2.721039, 0, 0.2313726, 1, 1,
0.3473506, 0.1734902, 0.9055265, 0, 0.227451, 1, 1,
0.3488172, -0.6048761, 3.167777, 0, 0.2196078, 1, 1,
0.3498525, -1.767707, 4.361935, 0, 0.2156863, 1, 1,
0.350035, -2.587338, 3.988823, 0, 0.2078431, 1, 1,
0.354234, 0.9004608, -0.9674808, 0, 0.2039216, 1, 1,
0.3558359, -0.5313668, 3.198754, 0, 0.1960784, 1, 1,
0.3565703, -0.6972255, 3.594683, 0, 0.1882353, 1, 1,
0.3652081, 0.7998952, 0.1828578, 0, 0.1843137, 1, 1,
0.3723175, -0.2063829, 3.32794, 0, 0.1764706, 1, 1,
0.3767706, -0.009091326, 2.508339, 0, 0.172549, 1, 1,
0.3795949, -0.9795004, 2.793777, 0, 0.1647059, 1, 1,
0.3808095, -0.2719806, 1.736387, 0, 0.1607843, 1, 1,
0.3841205, -1.135606, 1.901631, 0, 0.1529412, 1, 1,
0.3841425, 1.22557, 1.545787, 0, 0.1490196, 1, 1,
0.3843952, 1.19504, 1.770479, 0, 0.1411765, 1, 1,
0.3896448, -0.04370038, 1.966222, 0, 0.1372549, 1, 1,
0.3912425, 0.4448269, 2.246287, 0, 0.1294118, 1, 1,
0.3932882, -1.476769, 2.070306, 0, 0.1254902, 1, 1,
0.3946057, -1.278171, 1.619092, 0, 0.1176471, 1, 1,
0.3960261, -1.73007, 2.60957, 0, 0.1137255, 1, 1,
0.3985376, -0.08096286, 2.45319, 0, 0.1058824, 1, 1,
0.4013002, 0.7371649, 1.285902, 0, 0.09803922, 1, 1,
0.405113, 0.2270466, -0.3149403, 0, 0.09411765, 1, 1,
0.405929, 0.8944222, -0.391493, 0, 0.08627451, 1, 1,
0.4076733, 0.5368297, 2.502369, 0, 0.08235294, 1, 1,
0.4118573, -0.6552211, 2.543189, 0, 0.07450981, 1, 1,
0.4139126, 1.388959, 0.23853, 0, 0.07058824, 1, 1,
0.4157095, -0.03078145, 1.90846, 0, 0.0627451, 1, 1,
0.4173137, -0.05487965, 1.974193, 0, 0.05882353, 1, 1,
0.4185891, 0.6655849, -0.6711698, 0, 0.05098039, 1, 1,
0.4189594, 0.2042938, 3.526591, 0, 0.04705882, 1, 1,
0.4211625, -0.312245, 0.7720765, 0, 0.03921569, 1, 1,
0.4251514, -0.2099371, 2.008214, 0, 0.03529412, 1, 1,
0.4255551, -0.8504596, 0.9211701, 0, 0.02745098, 1, 1,
0.4278786, 0.7716242, -0.5798076, 0, 0.02352941, 1, 1,
0.4293828, -1.55356, 1.710472, 0, 0.01568628, 1, 1,
0.4314314, 1.099781, 2.190167, 0, 0.01176471, 1, 1,
0.4328937, -0.4024367, 2.214675, 0, 0.003921569, 1, 1,
0.4331281, 1.486751, -0.6861193, 0.003921569, 0, 1, 1,
0.434201, 1.395018, -0.001742052, 0.007843138, 0, 1, 1,
0.4361124, 0.9032691, -0.1376568, 0.01568628, 0, 1, 1,
0.4376656, 0.9585051, -1.008443, 0.01960784, 0, 1, 1,
0.4431348, -1.049461, 1.868493, 0.02745098, 0, 1, 1,
0.4443011, 1.367449, 0.3379664, 0.03137255, 0, 1, 1,
0.4449198, 0.319556, 2.121459, 0.03921569, 0, 1, 1,
0.4460218, -0.638795, 1.442958, 0.04313726, 0, 1, 1,
0.4491055, -0.3587575, 2.969679, 0.05098039, 0, 1, 1,
0.450488, 0.9732127, -0.008590945, 0.05490196, 0, 1, 1,
0.4520852, 1.895757, 1.459769, 0.0627451, 0, 1, 1,
0.4537424, -1.088232, 2.621947, 0.06666667, 0, 1, 1,
0.4544295, -1.048954, 2.03514, 0.07450981, 0, 1, 1,
0.4545118, 0.4449092, -1.330784, 0.07843138, 0, 1, 1,
0.4548255, -0.7862713, 1.759264, 0.08627451, 0, 1, 1,
0.4603368, -0.3447463, 2.851807, 0.09019608, 0, 1, 1,
0.460793, 2.527971, 0.7678282, 0.09803922, 0, 1, 1,
0.4617293, -0.1417364, 3.641808, 0.1058824, 0, 1, 1,
0.4621522, -0.8665477, 4.020425, 0.1098039, 0, 1, 1,
0.462328, -0.8044876, 4.151369, 0.1176471, 0, 1, 1,
0.4627843, 0.8784769, 1.04495, 0.1215686, 0, 1, 1,
0.4742572, 0.5969823, 1.14967, 0.1294118, 0, 1, 1,
0.4756648, -0.6565164, 3.778743, 0.1333333, 0, 1, 1,
0.4774568, -0.3639766, 2.035949, 0.1411765, 0, 1, 1,
0.4819727, 0.5737393, 0.01558722, 0.145098, 0, 1, 1,
0.4867803, 0.1668716, 0.7601889, 0.1529412, 0, 1, 1,
0.4886288, -1.03533, 3.438315, 0.1568628, 0, 1, 1,
0.4916546, -0.4145242, 1.342845, 0.1647059, 0, 1, 1,
0.4946926, 0.09058667, 0.3099098, 0.1686275, 0, 1, 1,
0.4989699, -0.2155163, 2.071949, 0.1764706, 0, 1, 1,
0.4996653, 0.7686498, -0.6673266, 0.1803922, 0, 1, 1,
0.5014551, 0.1316579, 1.869543, 0.1882353, 0, 1, 1,
0.5021936, 0.8987939, 0.8009751, 0.1921569, 0, 1, 1,
0.5022164, -0.5815464, 3.922643, 0.2, 0, 1, 1,
0.502333, -1.751199, 4.332066, 0.2078431, 0, 1, 1,
0.5064302, -0.006170901, 0.4628145, 0.2117647, 0, 1, 1,
0.5079448, -1.074122, 3.152226, 0.2196078, 0, 1, 1,
0.5084277, -0.9846445, 1.405083, 0.2235294, 0, 1, 1,
0.5089305, 0.104596, -0.3084258, 0.2313726, 0, 1, 1,
0.5099868, 0.06501877, 2.772104, 0.2352941, 0, 1, 1,
0.5106306, -0.2806523, 1.927125, 0.2431373, 0, 1, 1,
0.5147655, -0.1882459, 1.739129, 0.2470588, 0, 1, 1,
0.5157002, -2.365595, 3.347083, 0.254902, 0, 1, 1,
0.5162231, -1.45859, 2.731437, 0.2588235, 0, 1, 1,
0.5162948, -0.7594113, 1.342023, 0.2666667, 0, 1, 1,
0.522687, -1.839223, 3.52147, 0.2705882, 0, 1, 1,
0.5278531, 0.215055, -0.3184597, 0.2784314, 0, 1, 1,
0.5278908, 2.026097, 2.256661, 0.282353, 0, 1, 1,
0.5319934, -1.082986, 3.322734, 0.2901961, 0, 1, 1,
0.5357595, -0.08266829, 0.8164439, 0.2941177, 0, 1, 1,
0.5357966, -1.334622, 4.618227, 0.3019608, 0, 1, 1,
0.5393183, 0.7063079, 0.4390055, 0.3098039, 0, 1, 1,
0.5400082, -2.265743, 2.755415, 0.3137255, 0, 1, 1,
0.5440984, 0.6697863, -0.4548357, 0.3215686, 0, 1, 1,
0.5454072, -0.4980429, 1.760388, 0.3254902, 0, 1, 1,
0.5485313, -0.2883714, 2.117821, 0.3333333, 0, 1, 1,
0.5491293, 0.09864901, 1.675622, 0.3372549, 0, 1, 1,
0.5503878, -1.096201, 2.309699, 0.345098, 0, 1, 1,
0.5539377, 0.8236459, 0.795134, 0.3490196, 0, 1, 1,
0.5576318, 0.3825362, 2.364127, 0.3568628, 0, 1, 1,
0.5585737, 1.365008, 1.077719, 0.3607843, 0, 1, 1,
0.5587103, 1.026646, 1.104351, 0.3686275, 0, 1, 1,
0.5593821, -0.5144853, 2.940021, 0.372549, 0, 1, 1,
0.5640193, -0.6532856, 2.475176, 0.3803922, 0, 1, 1,
0.5664358, 0.2569417, 1.501387, 0.3843137, 0, 1, 1,
0.5708593, 1.32121, -0.01859198, 0.3921569, 0, 1, 1,
0.57184, 0.3102483, 2.796741, 0.3960784, 0, 1, 1,
0.5734308, -1.100964, 3.92478, 0.4039216, 0, 1, 1,
0.5761427, 0.01139013, 0.9746063, 0.4117647, 0, 1, 1,
0.5783111, 0.4038189, 1.142703, 0.4156863, 0, 1, 1,
0.5796937, 1.296748, 1.387831, 0.4235294, 0, 1, 1,
0.5874609, -0.9122128, 1.425589, 0.427451, 0, 1, 1,
0.5876505, 0.3745849, 0.1809175, 0.4352941, 0, 1, 1,
0.5936352, 0.1882384, 1.143175, 0.4392157, 0, 1, 1,
0.5962746, -0.7641451, 2.428533, 0.4470588, 0, 1, 1,
0.6042864, -0.2770216, 0.8829433, 0.4509804, 0, 1, 1,
0.609452, -1.137104, 3.708964, 0.4588235, 0, 1, 1,
0.6107928, -1.886944, 3.579302, 0.4627451, 0, 1, 1,
0.6110348, 1.674674, 1.350774, 0.4705882, 0, 1, 1,
0.6276315, 1.03573, -1.756621, 0.4745098, 0, 1, 1,
0.6276549, -0.1598005, -0.7931891, 0.4823529, 0, 1, 1,
0.6301416, 0.1469822, 0.1453679, 0.4862745, 0, 1, 1,
0.6364577, -1.705345, 2.377881, 0.4941176, 0, 1, 1,
0.6407695, -0.5114894, 1.774902, 0.5019608, 0, 1, 1,
0.6409945, 1.858997, 0.6924238, 0.5058824, 0, 1, 1,
0.6419321, -0.1276578, 2.71226, 0.5137255, 0, 1, 1,
0.648771, 0.415985, 0.9496388, 0.5176471, 0, 1, 1,
0.6510463, -1.314063, 3.404072, 0.5254902, 0, 1, 1,
0.6536089, -2.934641, 3.202134, 0.5294118, 0, 1, 1,
0.6537487, 1.133366, -0.3191154, 0.5372549, 0, 1, 1,
0.6548192, 0.1791053, 1.473975, 0.5411765, 0, 1, 1,
0.655128, -0.5244148, 1.75809, 0.5490196, 0, 1, 1,
0.6561553, -0.3697436, 2.55196, 0.5529412, 0, 1, 1,
0.656669, -0.1699276, 2.102341, 0.5607843, 0, 1, 1,
0.6570091, 0.9309599, -0.5700346, 0.5647059, 0, 1, 1,
0.6596021, -0.4147143, 2.426053, 0.572549, 0, 1, 1,
0.6619433, 0.04237318, 0.704594, 0.5764706, 0, 1, 1,
0.6634806, 0.9516369, 1.622993, 0.5843138, 0, 1, 1,
0.6752409, 1.006435, 0.971469, 0.5882353, 0, 1, 1,
0.6767015, -0.1576856, 1.270529, 0.5960785, 0, 1, 1,
0.6808841, 0.5422376, 0.9626248, 0.6039216, 0, 1, 1,
0.6859514, 0.7452483, 0.3542922, 0.6078432, 0, 1, 1,
0.6888661, -0.9435045, 2.935947, 0.6156863, 0, 1, 1,
0.6910333, -0.5899079, 3.60954, 0.6196079, 0, 1, 1,
0.6989477, -0.223299, 1.446965, 0.627451, 0, 1, 1,
0.700223, -0.5501275, 1.548854, 0.6313726, 0, 1, 1,
0.7082542, -1.378139, 2.598632, 0.6392157, 0, 1, 1,
0.7092278, -0.05377191, 1.71656, 0.6431373, 0, 1, 1,
0.7128549, 0.6475958, 1.23589, 0.6509804, 0, 1, 1,
0.715385, 0.6321995, 0.4976066, 0.654902, 0, 1, 1,
0.7182252, 1.086704, 0.2757624, 0.6627451, 0, 1, 1,
0.7196838, -1.767763, 4.546476, 0.6666667, 0, 1, 1,
0.7268037, 0.6373147, 1.985166, 0.6745098, 0, 1, 1,
0.7303776, 1.245313, 0.5960757, 0.6784314, 0, 1, 1,
0.7355521, -0.5447155, 1.785085, 0.6862745, 0, 1, 1,
0.736002, 1.647817, -0.7731739, 0.6901961, 0, 1, 1,
0.7364865, 2.107951, -0.9692696, 0.6980392, 0, 1, 1,
0.7381177, -0.04420684, 3.45076, 0.7058824, 0, 1, 1,
0.744439, 0.08897489, 0.8758736, 0.7098039, 0, 1, 1,
0.7453451, -0.1374466, 0.532563, 0.7176471, 0, 1, 1,
0.74725, 0.07252775, 0.5217226, 0.7215686, 0, 1, 1,
0.7473642, -1.28956, 1.857493, 0.7294118, 0, 1, 1,
0.7553664, -1.338695, 3.971737, 0.7333333, 0, 1, 1,
0.7561554, 0.2268167, 1.838231, 0.7411765, 0, 1, 1,
0.7592815, 0.642198, -0.3225953, 0.7450981, 0, 1, 1,
0.7696734, 0.7938737, 2.046789, 0.7529412, 0, 1, 1,
0.7715306, -0.8571709, 3.091637, 0.7568628, 0, 1, 1,
0.7739276, 1.22801, 0.6307057, 0.7647059, 0, 1, 1,
0.7770806, -0.9227462, 2.227698, 0.7686275, 0, 1, 1,
0.7812535, 0.2032997, 1.105788, 0.7764706, 0, 1, 1,
0.7812971, -0.1956572, 1.338753, 0.7803922, 0, 1, 1,
0.7813674, -0.5683867, 2.802096, 0.7882353, 0, 1, 1,
0.7833939, 0.6895221, 1.350697, 0.7921569, 0, 1, 1,
0.7844003, -0.3512453, 1.687942, 0.8, 0, 1, 1,
0.7897668, 0.5016435, -0.6131372, 0.8078431, 0, 1, 1,
0.7898525, 1.406727, -0.1274959, 0.8117647, 0, 1, 1,
0.7900345, -1.81535, 2.158194, 0.8196079, 0, 1, 1,
0.7921861, 1.049362, 2.904847, 0.8235294, 0, 1, 1,
0.7927, -0.1549522, 2.226137, 0.8313726, 0, 1, 1,
0.7965513, -0.4737896, 2.857776, 0.8352941, 0, 1, 1,
0.7965522, 0.2540424, 2.354226, 0.8431373, 0, 1, 1,
0.7989646, 0.2650717, 0.2697135, 0.8470588, 0, 1, 1,
0.8049271, -1.31714, 2.242558, 0.854902, 0, 1, 1,
0.8135537, 0.7604328, 2.614273, 0.8588235, 0, 1, 1,
0.8196405, 1.4907, -1.870242, 0.8666667, 0, 1, 1,
0.8274871, -0.4371677, 2.081805, 0.8705882, 0, 1, 1,
0.8277249, 0.5489693, 1.291601, 0.8784314, 0, 1, 1,
0.8280831, -0.8985795, 2.462188, 0.8823529, 0, 1, 1,
0.830009, -0.9198939, 2.060101, 0.8901961, 0, 1, 1,
0.8328544, 1.226176, 0.1110561, 0.8941177, 0, 1, 1,
0.8345947, 0.264492, 1.083502, 0.9019608, 0, 1, 1,
0.8375059, -0.3359617, 2.993464, 0.9098039, 0, 1, 1,
0.8377601, -1.031906, 3.00011, 0.9137255, 0, 1, 1,
0.8378729, 0.561132, -0.2236822, 0.9215686, 0, 1, 1,
0.8383965, 0.01145781, 1.843705, 0.9254902, 0, 1, 1,
0.8499658, -0.08495528, 2.307134, 0.9333333, 0, 1, 1,
0.8548015, -0.01237848, 1.237213, 0.9372549, 0, 1, 1,
0.855181, 2.220611, -0.7045811, 0.945098, 0, 1, 1,
0.8624801, 0.05378811, 2.633176, 0.9490196, 0, 1, 1,
0.8660973, -1.364454, 3.511328, 0.9568627, 0, 1, 1,
0.8685334, 0.8015071, 1.030291, 0.9607843, 0, 1, 1,
0.8755723, -0.4063973, 2.662684, 0.9686275, 0, 1, 1,
0.882844, 2.074554, 0.810968, 0.972549, 0, 1, 1,
0.8831661, -0.9184549, 2.226573, 0.9803922, 0, 1, 1,
0.9013186, 0.8972936, 1.656592, 0.9843137, 0, 1, 1,
0.9031383, -0.4141867, 0.4626336, 0.9921569, 0, 1, 1,
0.9167592, -0.616931, 1.134586, 0.9960784, 0, 1, 1,
0.9180482, 0.5257084, 0.2434116, 1, 0, 0.9960784, 1,
0.9278806, 1.214249, 0.4601853, 1, 0, 0.9882353, 1,
0.9287887, -0.9663078, 2.344523, 1, 0, 0.9843137, 1,
0.929363, 0.8704528, 1.656204, 1, 0, 0.9764706, 1,
0.9374011, -0.5717255, 1.061577, 1, 0, 0.972549, 1,
0.9438243, -2.012488, 3.84693, 1, 0, 0.9647059, 1,
0.9486911, -0.36443, 2.28752, 1, 0, 0.9607843, 1,
0.9498404, -0.1674987, 1.622429, 1, 0, 0.9529412, 1,
0.9522125, 1.752497, 0.6821309, 1, 0, 0.9490196, 1,
0.9551493, -0.3406395, 2.559066, 1, 0, 0.9411765, 1,
0.961931, 1.060876, 1.020963, 1, 0, 0.9372549, 1,
0.9692802, 0.836553, -0.01793576, 1, 0, 0.9294118, 1,
0.9710818, 1.779929, -0.8912266, 1, 0, 0.9254902, 1,
0.9719109, 1.273641, 0.9518148, 1, 0, 0.9176471, 1,
0.9981894, -1.152548, 1.641399, 1, 0, 0.9137255, 1,
0.9997389, -2.514976, 2.941894, 1, 0, 0.9058824, 1,
0.9999245, -0.9466454, 4.372272, 1, 0, 0.9019608, 1,
1.002726, -0.3135478, 2.469489, 1, 0, 0.8941177, 1,
1.010325, -2.40844, 1.404384, 1, 0, 0.8862745, 1,
1.010608, -1.562452, 3.250857, 1, 0, 0.8823529, 1,
1.011037, 0.3337621, 1.939784, 1, 0, 0.8745098, 1,
1.013299, 0.0003980639, 2.897036, 1, 0, 0.8705882, 1,
1.016549, -0.3301691, 0.9541748, 1, 0, 0.8627451, 1,
1.017278, 0.6483359, 1.275474, 1, 0, 0.8588235, 1,
1.020259, 0.0657222, 0.9319244, 1, 0, 0.8509804, 1,
1.026462, 0.1773747, 0.5858774, 1, 0, 0.8470588, 1,
1.034412, 1.064471, 1.438772, 1, 0, 0.8392157, 1,
1.036561, 0.350411, 1.449993, 1, 0, 0.8352941, 1,
1.0367, 0.9303269, -0.3391286, 1, 0, 0.827451, 1,
1.03703, 0.6618233, 0.8575417, 1, 0, 0.8235294, 1,
1.056121, 0.3932073, -0.5455016, 1, 0, 0.8156863, 1,
1.066061, -1.720374, 2.559427, 1, 0, 0.8117647, 1,
1.067702, 0.1228857, 0.4410687, 1, 0, 0.8039216, 1,
1.087834, 0.4461166, 1.9012, 1, 0, 0.7960784, 1,
1.098473, 0.2570474, 2.000826, 1, 0, 0.7921569, 1,
1.099429, -0.1468112, 1.338758, 1, 0, 0.7843137, 1,
1.100644, 1.703091, 0.1574121, 1, 0, 0.7803922, 1,
1.100935, 0.4099032, 0.9846789, 1, 0, 0.772549, 1,
1.104687, -0.09743959, 1.709837, 1, 0, 0.7686275, 1,
1.105357, 0.655535, 1.585546, 1, 0, 0.7607843, 1,
1.106388, 0.4915032, 0.9227719, 1, 0, 0.7568628, 1,
1.109136, 0.0942408, 0.8615185, 1, 0, 0.7490196, 1,
1.119566, -0.6544416, 3.129812, 1, 0, 0.7450981, 1,
1.129245, 1.122959, 1.040452, 1, 0, 0.7372549, 1,
1.138795, -0.151963, 1.602012, 1, 0, 0.7333333, 1,
1.14189, 0.8747524, 0.207115, 1, 0, 0.7254902, 1,
1.145977, -1.366729, 2.807832, 1, 0, 0.7215686, 1,
1.150203, -0.6939448, 0.6607901, 1, 0, 0.7137255, 1,
1.152145, 0.6158581, -0.1464638, 1, 0, 0.7098039, 1,
1.162915, -2.326908, 2.315106, 1, 0, 0.7019608, 1,
1.163002, 2.042717, 1.954478, 1, 0, 0.6941177, 1,
1.165219, 1.563351, 2.359196, 1, 0, 0.6901961, 1,
1.165974, -0.780638, 1.512776, 1, 0, 0.682353, 1,
1.168431, -0.3994139, 1.907672, 1, 0, 0.6784314, 1,
1.183048, -0.4097153, 3.6579, 1, 0, 0.6705883, 1,
1.18818, 0.3973193, 0.2235112, 1, 0, 0.6666667, 1,
1.189607, 0.8639824, 1.143348, 1, 0, 0.6588235, 1,
1.194477, -0.3152138, 2.405504, 1, 0, 0.654902, 1,
1.195248, 0.03422458, 3.523616, 1, 0, 0.6470588, 1,
1.196349, 0.49727, 1.025664, 1, 0, 0.6431373, 1,
1.220294, -0.2518359, 0.9773461, 1, 0, 0.6352941, 1,
1.223155, 0.3285228, 0.8128828, 1, 0, 0.6313726, 1,
1.234594, 0.1535407, 0.8446192, 1, 0, 0.6235294, 1,
1.236325, 0.9664047, 0.8901271, 1, 0, 0.6196079, 1,
1.240685, 2.817876, -0.5946591, 1, 0, 0.6117647, 1,
1.248027, 0.2219135, 1.679272, 1, 0, 0.6078432, 1,
1.26845, 0.9351236, 0.4636174, 1, 0, 0.6, 1,
1.268729, -0.04408438, 0.2123839, 1, 0, 0.5921569, 1,
1.270079, -0.58996, 1.400431, 1, 0, 0.5882353, 1,
1.273213, -0.392508, 1.802751, 1, 0, 0.5803922, 1,
1.281097, 1.369507, 0.3480394, 1, 0, 0.5764706, 1,
1.281283, -0.9114913, 2.07599, 1, 0, 0.5686275, 1,
1.283589, 1.021816, 1.418653, 1, 0, 0.5647059, 1,
1.289323, -0.4286715, 2.274363, 1, 0, 0.5568628, 1,
1.298933, -1.283086, 1.463243, 1, 0, 0.5529412, 1,
1.309388, -0.1302987, 2.653844, 1, 0, 0.5450981, 1,
1.310762, -1.297831, 3.295683, 1, 0, 0.5411765, 1,
1.312362, -1.051669, 2.402848, 1, 0, 0.5333334, 1,
1.312765, 0.004673741, 1.050312, 1, 0, 0.5294118, 1,
1.313692, -0.1479996, 1.390447, 1, 0, 0.5215687, 1,
1.338278, 1.34588, -0.7153227, 1, 0, 0.5176471, 1,
1.344838, -0.5861729, 1.801817, 1, 0, 0.509804, 1,
1.357249, 0.1558062, -0.5678908, 1, 0, 0.5058824, 1,
1.359336, 1.415972, -0.5692869, 1, 0, 0.4980392, 1,
1.360083, -1.143168, 3.054062, 1, 0, 0.4901961, 1,
1.366901, 1.225625, -0.2514648, 1, 0, 0.4862745, 1,
1.36718, 1.736887, 1.297439, 1, 0, 0.4784314, 1,
1.374238, -0.6473838, 1.745997, 1, 0, 0.4745098, 1,
1.390426, -0.1655931, 3.182981, 1, 0, 0.4666667, 1,
1.429337, -0.1276415, 2.141443, 1, 0, 0.4627451, 1,
1.436461, 0.9640308, -0.8499933, 1, 0, 0.454902, 1,
1.446092, 0.895649, 2.615508, 1, 0, 0.4509804, 1,
1.457671, -0.4239745, 2.144859, 1, 0, 0.4431373, 1,
1.459858, -0.1901767, 2.460621, 1, 0, 0.4392157, 1,
1.475523, 0.7996542, 1.229608, 1, 0, 0.4313726, 1,
1.477916, 0.2902826, 1.755942, 1, 0, 0.427451, 1,
1.48026, -1.071849, 2.060993, 1, 0, 0.4196078, 1,
1.484771, -1.010722, 2.182592, 1, 0, 0.4156863, 1,
1.498911, -0.3411749, 2.331425, 1, 0, 0.4078431, 1,
1.502918, 1.064166, 1.475061, 1, 0, 0.4039216, 1,
1.514063, 1.078426, -0.7875574, 1, 0, 0.3960784, 1,
1.518387, -0.7911913, 1.736107, 1, 0, 0.3882353, 1,
1.525196, 0.3852511, 0.8265624, 1, 0, 0.3843137, 1,
1.528105, -1.628093, 4.091439, 1, 0, 0.3764706, 1,
1.537167, -0.1064529, 1.945009, 1, 0, 0.372549, 1,
1.550186, 0.2399338, 0.9546005, 1, 0, 0.3647059, 1,
1.551493, 2.035879, 1.662678, 1, 0, 0.3607843, 1,
1.559016, 1.98596, 1.494273, 1, 0, 0.3529412, 1,
1.579391, 0.1005272, 2.678475, 1, 0, 0.3490196, 1,
1.603348, -0.2394466, 1.832727, 1, 0, 0.3411765, 1,
1.606814, 1.518895, -0.9045112, 1, 0, 0.3372549, 1,
1.618302, -0.8483413, 0.8286059, 1, 0, 0.3294118, 1,
1.628958, -0.9972998, 0.9621047, 1, 0, 0.3254902, 1,
1.633621, -0.5245093, 2.018271, 1, 0, 0.3176471, 1,
1.655212, 1.850524, 1.762746, 1, 0, 0.3137255, 1,
1.673876, 0.1894453, 1.951152, 1, 0, 0.3058824, 1,
1.683296, 1.870925, 0.6732155, 1, 0, 0.2980392, 1,
1.689657, -0.8042579, 3.411135, 1, 0, 0.2941177, 1,
1.691112, -1.017127, 0.5407101, 1, 0, 0.2862745, 1,
1.697164, 2.44775, 0.2438381, 1, 0, 0.282353, 1,
1.703892, 1.054132, 1.469918, 1, 0, 0.2745098, 1,
1.705842, -2.086177, 2.885727, 1, 0, 0.2705882, 1,
1.712829, -0.2072238, 1.511462, 1, 0, 0.2627451, 1,
1.738418, -1.429625, 1.325562, 1, 0, 0.2588235, 1,
1.752224, -0.4138263, 1.592008, 1, 0, 0.2509804, 1,
1.755167, 0.5771115, -0.4596291, 1, 0, 0.2470588, 1,
1.768285, 0.04822321, 2.024704, 1, 0, 0.2392157, 1,
1.78649, 1.276553, 0.6905141, 1, 0, 0.2352941, 1,
1.802489, 2.98052, -0.9175176, 1, 0, 0.227451, 1,
1.813901, 0.6996444, 1.078057, 1, 0, 0.2235294, 1,
1.818419, 0.5937979, 1.661667, 1, 0, 0.2156863, 1,
1.823426, -0.7643053, 1.359281, 1, 0, 0.2117647, 1,
1.832052, -0.4269335, 3.101715, 1, 0, 0.2039216, 1,
1.835884, 0.3342707, 0.8090212, 1, 0, 0.1960784, 1,
1.837306, 0.3123997, 0.8263095, 1, 0, 0.1921569, 1,
1.854164, -0.4106627, 1.612393, 1, 0, 0.1843137, 1,
1.883263, 1.246934, 0.2847302, 1, 0, 0.1803922, 1,
1.887876, -0.9416922, 0.6690136, 1, 0, 0.172549, 1,
1.91117, -1.462913, 2.829725, 1, 0, 0.1686275, 1,
1.920798, -0.1797843, 2.534758, 1, 0, 0.1607843, 1,
1.923381, -0.06889804, 2.327718, 1, 0, 0.1568628, 1,
1.93697, -0.1013463, 1.97544, 1, 0, 0.1490196, 1,
1.960534, -0.3821059, 2.475509, 1, 0, 0.145098, 1,
1.988479, 1.020155, 1.814458, 1, 0, 0.1372549, 1,
1.993805, -0.05350618, 1.812823, 1, 0, 0.1333333, 1,
2.00079, 0.8523006, 2.000643, 1, 0, 0.1254902, 1,
2.00828, -1.356104, 0.4881749, 1, 0, 0.1215686, 1,
2.073666, 1.131347, 1.614744, 1, 0, 0.1137255, 1,
2.076854, -0.9357697, 2.154576, 1, 0, 0.1098039, 1,
2.083201, -0.007071919, 0.5759571, 1, 0, 0.1019608, 1,
2.12937, -0.9725589, 0.4795527, 1, 0, 0.09411765, 1,
2.137809, 2.731394, 0.6186115, 1, 0, 0.09019608, 1,
2.165441, 1.44915, 1.379495, 1, 0, 0.08235294, 1,
2.167039, -0.1269521, 2.52603, 1, 0, 0.07843138, 1,
2.17817, -0.5779067, 0.6550389, 1, 0, 0.07058824, 1,
2.270834, -1.46511, 3.465469, 1, 0, 0.06666667, 1,
2.295323, -0.1750229, 0.5006317, 1, 0, 0.05882353, 1,
2.30421, -1.964486, 3.107335, 1, 0, 0.05490196, 1,
2.3281, 0.1734153, 1.2967, 1, 0, 0.04705882, 1,
2.340356, -1.987248, 2.226611, 1, 0, 0.04313726, 1,
2.424461, 1.77442, 1.872616, 1, 0, 0.03529412, 1,
2.467982, 0.5004917, 1.624002, 1, 0, 0.03137255, 1,
2.500242, -0.4585984, 2.112333, 1, 0, 0.02352941, 1,
2.562749, -1.593158, 2.632687, 1, 0, 0.01960784, 1,
2.824326, -0.5213082, 1.888366, 1, 0, 0.01176471, 1,
3.184312, 0.2293963, 3.322422, 1, 0, 0.007843138, 1
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
-0.05722463, -3.995581, -6.94601, 0, -0.5, 0.5, 0.5,
-0.05722463, -3.995581, -6.94601, 1, -0.5, 0.5, 0.5,
-0.05722463, -3.995581, -6.94601, 1, 1.5, 0.5, 0.5,
-0.05722463, -3.995581, -6.94601, 0, 1.5, 0.5, 0.5
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
-4.397642, 0.08163834, -6.94601, 0, -0.5, 0.5, 0.5,
-4.397642, 0.08163834, -6.94601, 1, -0.5, 0.5, 0.5,
-4.397642, 0.08163834, -6.94601, 1, 1.5, 0.5, 0.5,
-4.397642, 0.08163834, -6.94601, 0, 1.5, 0.5, 0.5
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
-4.397642, -3.995581, -0.276216, 0, -0.5, 0.5, 0.5,
-4.397642, -3.995581, -0.276216, 1, -0.5, 0.5, 0.5,
-4.397642, -3.995581, -0.276216, 1, 1.5, 0.5, 0.5,
-4.397642, -3.995581, -0.276216, 0, 1.5, 0.5, 0.5
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
-3, -3.054684, -5.406826,
3, -3.054684, -5.406826,
-3, -3.054684, -5.406826,
-3, -3.2115, -5.663357,
-2, -3.054684, -5.406826,
-2, -3.2115, -5.663357,
-1, -3.054684, -5.406826,
-1, -3.2115, -5.663357,
0, -3.054684, -5.406826,
0, -3.2115, -5.663357,
1, -3.054684, -5.406826,
1, -3.2115, -5.663357,
2, -3.054684, -5.406826,
2, -3.2115, -5.663357,
3, -3.054684, -5.406826,
3, -3.2115, -5.663357
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
-3, -3.525133, -6.176418, 0, -0.5, 0.5, 0.5,
-3, -3.525133, -6.176418, 1, -0.5, 0.5, 0.5,
-3, -3.525133, -6.176418, 1, 1.5, 0.5, 0.5,
-3, -3.525133, -6.176418, 0, 1.5, 0.5, 0.5,
-2, -3.525133, -6.176418, 0, -0.5, 0.5, 0.5,
-2, -3.525133, -6.176418, 1, -0.5, 0.5, 0.5,
-2, -3.525133, -6.176418, 1, 1.5, 0.5, 0.5,
-2, -3.525133, -6.176418, 0, 1.5, 0.5, 0.5,
-1, -3.525133, -6.176418, 0, -0.5, 0.5, 0.5,
-1, -3.525133, -6.176418, 1, -0.5, 0.5, 0.5,
-1, -3.525133, -6.176418, 1, 1.5, 0.5, 0.5,
-1, -3.525133, -6.176418, 0, 1.5, 0.5, 0.5,
0, -3.525133, -6.176418, 0, -0.5, 0.5, 0.5,
0, -3.525133, -6.176418, 1, -0.5, 0.5, 0.5,
0, -3.525133, -6.176418, 1, 1.5, 0.5, 0.5,
0, -3.525133, -6.176418, 0, 1.5, 0.5, 0.5,
1, -3.525133, -6.176418, 0, -0.5, 0.5, 0.5,
1, -3.525133, -6.176418, 1, -0.5, 0.5, 0.5,
1, -3.525133, -6.176418, 1, 1.5, 0.5, 0.5,
1, -3.525133, -6.176418, 0, 1.5, 0.5, 0.5,
2, -3.525133, -6.176418, 0, -0.5, 0.5, 0.5,
2, -3.525133, -6.176418, 1, -0.5, 0.5, 0.5,
2, -3.525133, -6.176418, 1, 1.5, 0.5, 0.5,
2, -3.525133, -6.176418, 0, 1.5, 0.5, 0.5,
3, -3.525133, -6.176418, 0, -0.5, 0.5, 0.5,
3, -3.525133, -6.176418, 1, -0.5, 0.5, 0.5,
3, -3.525133, -6.176418, 1, 1.5, 0.5, 0.5,
3, -3.525133, -6.176418, 0, 1.5, 0.5, 0.5
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
-3.396007, -2, -5.406826,
-3.396007, 3, -5.406826,
-3.396007, -2, -5.406826,
-3.562946, -2, -5.663357,
-3.396007, -1, -5.406826,
-3.562946, -1, -5.663357,
-3.396007, 0, -5.406826,
-3.562946, 0, -5.663357,
-3.396007, 1, -5.406826,
-3.562946, 1, -5.663357,
-3.396007, 2, -5.406826,
-3.562946, 2, -5.663357,
-3.396007, 3, -5.406826,
-3.562946, 3, -5.663357
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
"-1",
"0",
"1",
"2",
"3"
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
-3.896824, -2, -6.176418, 0, -0.5, 0.5, 0.5,
-3.896824, -2, -6.176418, 1, -0.5, 0.5, 0.5,
-3.896824, -2, -6.176418, 1, 1.5, 0.5, 0.5,
-3.896824, -2, -6.176418, 0, 1.5, 0.5, 0.5,
-3.896824, -1, -6.176418, 0, -0.5, 0.5, 0.5,
-3.896824, -1, -6.176418, 1, -0.5, 0.5, 0.5,
-3.896824, -1, -6.176418, 1, 1.5, 0.5, 0.5,
-3.896824, -1, -6.176418, 0, 1.5, 0.5, 0.5,
-3.896824, 0, -6.176418, 0, -0.5, 0.5, 0.5,
-3.896824, 0, -6.176418, 1, -0.5, 0.5, 0.5,
-3.896824, 0, -6.176418, 1, 1.5, 0.5, 0.5,
-3.896824, 0, -6.176418, 0, 1.5, 0.5, 0.5,
-3.896824, 1, -6.176418, 0, -0.5, 0.5, 0.5,
-3.896824, 1, -6.176418, 1, -0.5, 0.5, 0.5,
-3.896824, 1, -6.176418, 1, 1.5, 0.5, 0.5,
-3.896824, 1, -6.176418, 0, 1.5, 0.5, 0.5,
-3.896824, 2, -6.176418, 0, -0.5, 0.5, 0.5,
-3.896824, 2, -6.176418, 1, -0.5, 0.5, 0.5,
-3.896824, 2, -6.176418, 1, 1.5, 0.5, 0.5,
-3.896824, 2, -6.176418, 0, 1.5, 0.5, 0.5,
-3.896824, 3, -6.176418, 0, -0.5, 0.5, 0.5,
-3.896824, 3, -6.176418, 1, -0.5, 0.5, 0.5,
-3.896824, 3, -6.176418, 1, 1.5, 0.5, 0.5,
-3.896824, 3, -6.176418, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.396007, -3.054684, -4,
-3.396007, -3.054684, 4,
-3.396007, -3.054684, -4,
-3.562946, -3.2115, -4,
-3.396007, -3.054684, -2,
-3.562946, -3.2115, -2,
-3.396007, -3.054684, 0,
-3.562946, -3.2115, 0,
-3.396007, -3.054684, 2,
-3.562946, -3.2115, 2,
-3.396007, -3.054684, 4,
-3.562946, -3.2115, 4
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
-3.896824, -3.525133, -4, 0, -0.5, 0.5, 0.5,
-3.896824, -3.525133, -4, 1, -0.5, 0.5, 0.5,
-3.896824, -3.525133, -4, 1, 1.5, 0.5, 0.5,
-3.896824, -3.525133, -4, 0, 1.5, 0.5, 0.5,
-3.896824, -3.525133, -2, 0, -0.5, 0.5, 0.5,
-3.896824, -3.525133, -2, 1, -0.5, 0.5, 0.5,
-3.896824, -3.525133, -2, 1, 1.5, 0.5, 0.5,
-3.896824, -3.525133, -2, 0, 1.5, 0.5, 0.5,
-3.896824, -3.525133, 0, 0, -0.5, 0.5, 0.5,
-3.896824, -3.525133, 0, 1, -0.5, 0.5, 0.5,
-3.896824, -3.525133, 0, 1, 1.5, 0.5, 0.5,
-3.896824, -3.525133, 0, 0, 1.5, 0.5, 0.5,
-3.896824, -3.525133, 2, 0, -0.5, 0.5, 0.5,
-3.896824, -3.525133, 2, 1, -0.5, 0.5, 0.5,
-3.896824, -3.525133, 2, 1, 1.5, 0.5, 0.5,
-3.896824, -3.525133, 2, 0, 1.5, 0.5, 0.5,
-3.896824, -3.525133, 4, 0, -0.5, 0.5, 0.5,
-3.896824, -3.525133, 4, 1, -0.5, 0.5, 0.5,
-3.896824, -3.525133, 4, 1, 1.5, 0.5, 0.5,
-3.896824, -3.525133, 4, 0, 1.5, 0.5, 0.5
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
-3.396007, -3.054684, -5.406826,
-3.396007, 3.217961, -5.406826,
-3.396007, -3.054684, 4.854394,
-3.396007, 3.217961, 4.854394,
-3.396007, -3.054684, -5.406826,
-3.396007, -3.054684, 4.854394,
-3.396007, 3.217961, -5.406826,
-3.396007, 3.217961, 4.854394,
-3.396007, -3.054684, -5.406826,
3.281558, -3.054684, -5.406826,
-3.396007, -3.054684, 4.854394,
3.281558, -3.054684, 4.854394,
-3.396007, 3.217961, -5.406826,
3.281558, 3.217961, -5.406826,
-3.396007, 3.217961, 4.854394,
3.281558, 3.217961, 4.854394,
3.281558, -3.054684, -5.406826,
3.281558, 3.217961, -5.406826,
3.281558, -3.054684, 4.854394,
3.281558, 3.217961, 4.854394,
3.281558, -3.054684, -5.406826,
3.281558, -3.054684, 4.854394,
3.281558, 3.217961, -5.406826,
3.281558, 3.217961, 4.854394
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
var radius = 7.345458;
var distance = 32.68077;
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
mvMatrix.translate( 0.05722463, -0.08163834, 0.276216 );
mvMatrix.scale( 1.189364, 1.266141, 0.7739871 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.68077);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Niacin<-read.table("Niacin.xyz")
```

```
## Error in read.table("Niacin.xyz"): no lines available in input
```

```r
x<-Niacin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Niacin' not found
```

```r
y<-Niacin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Niacin' not found
```

```r
z<-Niacin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Niacin' not found
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
-3.298761, 1.006403, -0.9518848, 0, 0, 1, 1, 1,
-2.513644, -0.5038902, -0.8012052, 1, 0, 0, 1, 1,
-2.502722, -1.708134, -0.7693997, 1, 0, 0, 1, 1,
-2.490163, -1.793767, -3.106137, 1, 0, 0, 1, 1,
-2.489171, 1.416019, -1.646496, 1, 0, 0, 1, 1,
-2.482149, 1.135454, 0.6163912, 1, 0, 0, 1, 1,
-2.47539, 0.3522729, -1.372862, 0, 0, 0, 1, 1,
-2.455276, -0.1555859, -2.494126, 0, 0, 0, 1, 1,
-2.448384, -0.3577778, -1.23534, 0, 0, 0, 1, 1,
-2.365919, 2.061157, -2.076735, 0, 0, 0, 1, 1,
-2.308764, -0.5660709, -2.142274, 0, 0, 0, 1, 1,
-2.283301, -1.069052, -2.92475, 0, 0, 0, 1, 1,
-2.195807, -2.963335, -2.70735, 0, 0, 0, 1, 1,
-2.153955, 0.6001918, -0.1367749, 1, 1, 1, 1, 1,
-2.127573, -1.679056, -2.447012, 1, 1, 1, 1, 1,
-2.121804, -0.5732579, -3.135571, 1, 1, 1, 1, 1,
-2.107241, 0.1507924, -2.050805, 1, 1, 1, 1, 1,
-2.096917, 1.125536, 0.92256, 1, 1, 1, 1, 1,
-2.056134, 0.3108629, -2.728291, 1, 1, 1, 1, 1,
-2.034013, -0.6654844, -1.802251, 1, 1, 1, 1, 1,
-2.026954, 1.785858, -0.9399896, 1, 1, 1, 1, 1,
-2.015234, 0.32251, -3.870944, 1, 1, 1, 1, 1,
-2.012237, 0.1467406, -2.463906, 1, 1, 1, 1, 1,
-2.000957, -1.960901, -0.4846513, 1, 1, 1, 1, 1,
-1.994999, -1.067348, -1.757694, 1, 1, 1, 1, 1,
-1.991181, 0.9613165, 0.1282972, 1, 1, 1, 1, 1,
-1.984287, -0.7321021, -1.509952, 1, 1, 1, 1, 1,
-1.983093, -1.571137, -2.164005, 1, 1, 1, 1, 1,
-1.96905, -0.5906657, -0.2635152, 0, 0, 1, 1, 1,
-1.932704, 1.353012, -1.687706, 1, 0, 0, 1, 1,
-1.925487, 0.2977362, -0.2309279, 1, 0, 0, 1, 1,
-1.925254, 0.6850278, -2.756943, 1, 0, 0, 1, 1,
-1.899019, -2.570518, -4.312405, 1, 0, 0, 1, 1,
-1.884874, 1.324313, -1.472387, 1, 0, 0, 1, 1,
-1.871893, 0.4463451, -0.2492267, 0, 0, 0, 1, 1,
-1.846932, 0.1251972, -0.2793031, 0, 0, 0, 1, 1,
-1.846429, 1.655576, -0.7814846, 0, 0, 0, 1, 1,
-1.843364, -2.386423, -3.080797, 0, 0, 0, 1, 1,
-1.841857, -2.118222, -2.027163, 0, 0, 0, 1, 1,
-1.838047, -0.6164901, -3.177411, 0, 0, 0, 1, 1,
-1.830191, 1.105425, 0.1476818, 0, 0, 0, 1, 1,
-1.826879, -0.3511407, -1.913714, 1, 1, 1, 1, 1,
-1.814413, 0.2372597, -0.4840226, 1, 1, 1, 1, 1,
-1.787269, -0.05192839, -1.43447, 1, 1, 1, 1, 1,
-1.783167, 1.397303, -2.227704, 1, 1, 1, 1, 1,
-1.777753, 0.6165614, -0.3130081, 1, 1, 1, 1, 1,
-1.777029, 0.5761082, -1.085526, 1, 1, 1, 1, 1,
-1.768557, -0.3512618, -0.9028605, 1, 1, 1, 1, 1,
-1.752615, -2.121957, 0.559936, 1, 1, 1, 1, 1,
-1.739043, -0.3624067, -0.4946243, 1, 1, 1, 1, 1,
-1.723104, 0.1185302, -0.02298564, 1, 1, 1, 1, 1,
-1.709497, -0.8904871, -1.736796, 1, 1, 1, 1, 1,
-1.703906, -0.6891993, -2.772441, 1, 1, 1, 1, 1,
-1.688083, -0.3735678, -1.617942, 1, 1, 1, 1, 1,
-1.686467, 0.1475488, -0.3317119, 1, 1, 1, 1, 1,
-1.683923, 0.8088203, -1.772584, 1, 1, 1, 1, 1,
-1.67187, -0.04445558, -2.161058, 0, 0, 1, 1, 1,
-1.670827, -0.7428371, -3.148688, 1, 0, 0, 1, 1,
-1.647215, 0.5837367, -0.5468469, 1, 0, 0, 1, 1,
-1.63396, 0.6665998, -0.102914, 1, 0, 0, 1, 1,
-1.624212, -0.02758666, -0.5053401, 1, 0, 0, 1, 1,
-1.62087, -0.4379703, -2.482078, 1, 0, 0, 1, 1,
-1.61391, -0.5981824, -3.536731, 0, 0, 0, 1, 1,
-1.608009, 0.7125006, -2.124327, 0, 0, 0, 1, 1,
-1.591286, -0.4496536, -0.7973522, 0, 0, 0, 1, 1,
-1.584237, 0.7848805, -0.2506765, 0, 0, 0, 1, 1,
-1.579559, -0.6012225, -2.477677, 0, 0, 0, 1, 1,
-1.576932, 0.5295236, -1.419767, 0, 0, 0, 1, 1,
-1.57688, -0.259641, -1.340443, 0, 0, 0, 1, 1,
-1.558498, -0.7052166, -3.081439, 1, 1, 1, 1, 1,
-1.556184, -0.1479213, -2.320494, 1, 1, 1, 1, 1,
-1.553218, -1.042442, -2.343136, 1, 1, 1, 1, 1,
-1.546872, 1.283053, 0.00152806, 1, 1, 1, 1, 1,
-1.538937, -0.7445447, -2.244568, 1, 1, 1, 1, 1,
-1.537701, 0.3161544, 1.051129, 1, 1, 1, 1, 1,
-1.533858, 0.8525421, -3.470321, 1, 1, 1, 1, 1,
-1.520948, -0.3053267, -1.27088, 1, 1, 1, 1, 1,
-1.508628, -1.103908, -1.796042, 1, 1, 1, 1, 1,
-1.501547, -1.603713, -1.125561, 1, 1, 1, 1, 1,
-1.500847, -1.991148, -5.134742, 1, 1, 1, 1, 1,
-1.496982, 1.300409, -1.082212, 1, 1, 1, 1, 1,
-1.496017, 1.686069, -0.415769, 1, 1, 1, 1, 1,
-1.493231, 0.5330634, -1.930301, 1, 1, 1, 1, 1,
-1.488284, -0.5930538, -0.5525206, 1, 1, 1, 1, 1,
-1.487935, 0.9473355, -2.016891, 0, 0, 1, 1, 1,
-1.485235, 0.129473, 0.946241, 1, 0, 0, 1, 1,
-1.479656, 0.004245746, -1.639044, 1, 0, 0, 1, 1,
-1.465351, -1.382289, -2.413653, 1, 0, 0, 1, 1,
-1.463254, 0.1821086, -1.365089, 1, 0, 0, 1, 1,
-1.462379, 0.949917, 0.6866475, 1, 0, 0, 1, 1,
-1.451341, -0.8922904, -1.878555, 0, 0, 0, 1, 1,
-1.445085, 0.5293603, -2.642764, 0, 0, 0, 1, 1,
-1.440447, 0.705725, 0.1730146, 0, 0, 0, 1, 1,
-1.435697, -0.7767252, -2.598444, 0, 0, 0, 1, 1,
-1.429562, 0.5208539, 0.1965918, 0, 0, 0, 1, 1,
-1.423946, 0.2522369, -2.099866, 0, 0, 0, 1, 1,
-1.41821, 1.076786, -2.117774, 0, 0, 0, 1, 1,
-1.417008, 0.1528192, -1.317575, 1, 1, 1, 1, 1,
-1.416211, 0.5050913, -1.639937, 1, 1, 1, 1, 1,
-1.408166, -1.345268, -1.524243, 1, 1, 1, 1, 1,
-1.389175, 0.4506333, -0.7404878, 1, 1, 1, 1, 1,
-1.387339, 0.7601132, -0.5461904, 1, 1, 1, 1, 1,
-1.369604, -1.284991, -2.150408, 1, 1, 1, 1, 1,
-1.366967, 0.1486373, -2.822792, 1, 1, 1, 1, 1,
-1.366063, 0.2065751, -1.772661, 1, 1, 1, 1, 1,
-1.359021, 1.346322, -1.0405, 1, 1, 1, 1, 1,
-1.347594, 0.0381845, -2.484446, 1, 1, 1, 1, 1,
-1.347351, 0.1144004, -0.9006308, 1, 1, 1, 1, 1,
-1.345374, 1.072811, 0.9801297, 1, 1, 1, 1, 1,
-1.343294, 1.806816, -1.519968, 1, 1, 1, 1, 1,
-1.336677, 1.013358, 0.1305996, 1, 1, 1, 1, 1,
-1.332611, -0.1812537, -3.11342, 1, 1, 1, 1, 1,
-1.331852, 1.746782, 0.5797085, 0, 0, 1, 1, 1,
-1.326896, 0.4360527, -0.6017382, 1, 0, 0, 1, 1,
-1.315324, -0.8006912, -4.13148, 1, 0, 0, 1, 1,
-1.312177, -0.103337, -1.01562, 1, 0, 0, 1, 1,
-1.311798, -1.322315, -4.013219, 1, 0, 0, 1, 1,
-1.310051, 1.707459, -0.3866023, 1, 0, 0, 1, 1,
-1.309524, 0.07122257, -0.8385238, 0, 0, 0, 1, 1,
-1.306425, 0.6557688, -1.354039, 0, 0, 0, 1, 1,
-1.304641, -1.131122, -0.4252773, 0, 0, 0, 1, 1,
-1.289937, -0.7098162, -2.477589, 0, 0, 0, 1, 1,
-1.274548, -0.2032183, -2.716758, 0, 0, 0, 1, 1,
-1.270537, -1.192638, -0.6028584, 0, 0, 0, 1, 1,
-1.258028, -0.9824271, -2.491737, 0, 0, 0, 1, 1,
-1.257716, 0.9235362, -0.8721772, 1, 1, 1, 1, 1,
-1.254089, -0.943736, -2.061558, 1, 1, 1, 1, 1,
-1.253539, 1.902066, -0.2918359, 1, 1, 1, 1, 1,
-1.250581, 1.64133, -2.047506, 1, 1, 1, 1, 1,
-1.244264, 1.559151, -1.150032, 1, 1, 1, 1, 1,
-1.244033, -0.05665961, 0.9821212, 1, 1, 1, 1, 1,
-1.243458, 2.594958, -2.148615, 1, 1, 1, 1, 1,
-1.243338, 0.5638632, -2.260995, 1, 1, 1, 1, 1,
-1.236342, 0.3303938, -0.7832933, 1, 1, 1, 1, 1,
-1.235789, 2.126028, 0.3317113, 1, 1, 1, 1, 1,
-1.229402, 0.7191318, -1.171326, 1, 1, 1, 1, 1,
-1.227779, -0.3577366, -4.319941, 1, 1, 1, 1, 1,
-1.226652, -0.02583899, -0.5242515, 1, 1, 1, 1, 1,
-1.22093, -0.3671864, -2.570796, 1, 1, 1, 1, 1,
-1.215029, 0.3503926, -1.25389, 1, 1, 1, 1, 1,
-1.196209, 1.719441, -2.25807, 0, 0, 1, 1, 1,
-1.186614, 0.09583774, -0.6485112, 1, 0, 0, 1, 1,
-1.184912, -0.401334, -1.925671, 1, 0, 0, 1, 1,
-1.17111, 0.01959453, -2.17802, 1, 0, 0, 1, 1,
-1.159547, 1.58274, 0.0897129, 1, 0, 0, 1, 1,
-1.159243, 0.005088637, -1.645403, 1, 0, 0, 1, 1,
-1.154291, 0.5911348, -1.592196, 0, 0, 0, 1, 1,
-1.150693, 3.126612, -2.285839, 0, 0, 0, 1, 1,
-1.143915, 0.6894983, -0.5543025, 0, 0, 0, 1, 1,
-1.134186, -0.05569717, -3.548866, 0, 0, 0, 1, 1,
-1.128533, -0.2391984, -3.191773, 0, 0, 0, 1, 1,
-1.122465, 0.8031737, -1.709425, 0, 0, 0, 1, 1,
-1.104079, -0.1211467, -0.8673295, 0, 0, 0, 1, 1,
-1.098421, 0.6137631, -1.204789, 1, 1, 1, 1, 1,
-1.097534, -1.309382, -1.64172, 1, 1, 1, 1, 1,
-1.09005, 0.6765656, -1.013624, 1, 1, 1, 1, 1,
-1.089649, -0.5974036, -0.6514288, 1, 1, 1, 1, 1,
-1.087028, 1.163327, -0.4263579, 1, 1, 1, 1, 1,
-1.086146, -1.075097, -2.723075, 1, 1, 1, 1, 1,
-1.086099, 0.5421525, -2.355643, 1, 1, 1, 1, 1,
-1.080419, 1.27215, -1.817804, 1, 1, 1, 1, 1,
-1.076471, -0.5419608, -3.009152, 1, 1, 1, 1, 1,
-1.074944, 1.630278, -2.619285, 1, 1, 1, 1, 1,
-1.073403, -1.575739, -2.316895, 1, 1, 1, 1, 1,
-1.070779, -0.5895872, -3.214093, 1, 1, 1, 1, 1,
-1.051733, -2.202458, -3.753238, 1, 1, 1, 1, 1,
-1.046613, -0.8023752, -2.952511, 1, 1, 1, 1, 1,
-1.037525, 1.427193, -1.716143, 1, 1, 1, 1, 1,
-1.035955, 1.508112, -0.6348497, 0, 0, 1, 1, 1,
-1.031265, -0.4253107, -3.234221, 1, 0, 0, 1, 1,
-1.025241, 0.04491292, -0.6810601, 1, 0, 0, 1, 1,
-1.017126, 0.03942675, -0.7350716, 1, 0, 0, 1, 1,
-1.014937, -0.4372587, -2.354123, 1, 0, 0, 1, 1,
-1.008629, -1.049154, -1.985131, 1, 0, 0, 1, 1,
-0.9963114, 0.4654323, -1.188273, 0, 0, 0, 1, 1,
-0.988497, 1.155039, -1.106601, 0, 0, 0, 1, 1,
-0.9880223, 0.6820207, 0.5836582, 0, 0, 0, 1, 1,
-0.9879525, 0.2411026, -2.1532, 0, 0, 0, 1, 1,
-0.9842741, -1.874897, -3.253044, 0, 0, 0, 1, 1,
-0.9709616, -0.1175604, -3.288548, 0, 0, 0, 1, 1,
-0.9629493, 0.7165763, -0.3196563, 0, 0, 0, 1, 1,
-0.9577013, -0.7576134, -1.714648, 1, 1, 1, 1, 1,
-0.9568555, 0.7246197, -1.846942, 1, 1, 1, 1, 1,
-0.9568359, 0.3204355, 0.4975328, 1, 1, 1, 1, 1,
-0.9431874, 0.312055, -0.5547389, 1, 1, 1, 1, 1,
-0.9420128, -1.233036, -2.558958, 1, 1, 1, 1, 1,
-0.9355081, -0.2229988, -0.5944697, 1, 1, 1, 1, 1,
-0.9272075, 0.9005921, -2.069964, 1, 1, 1, 1, 1,
-0.9189801, 0.3890166, -1.234023, 1, 1, 1, 1, 1,
-0.9177488, 1.541158, 0.05409636, 1, 1, 1, 1, 1,
-0.9109801, 0.1927825, -1.611026, 1, 1, 1, 1, 1,
-0.9029356, -0.6426193, -2.848476, 1, 1, 1, 1, 1,
-0.8991337, 0.7121128, 0.0358812, 1, 1, 1, 1, 1,
-0.8985136, 1.338979, -0.003983578, 1, 1, 1, 1, 1,
-0.8912268, 0.4887916, -1.443358, 1, 1, 1, 1, 1,
-0.8911604, -0.2390162, -2.785461, 1, 1, 1, 1, 1,
-0.8833261, 1.257199, -1.039662, 0, 0, 1, 1, 1,
-0.8810736, -0.9266164, -1.82465, 1, 0, 0, 1, 1,
-0.8786656, -0.1844751, -0.9309347, 1, 0, 0, 1, 1,
-0.8755124, -0.4218583, -3.112334, 1, 0, 0, 1, 1,
-0.871133, -1.087652, -1.33043, 1, 0, 0, 1, 1,
-0.865885, -0.7628863, -2.148118, 1, 0, 0, 1, 1,
-0.864667, -0.3470616, -2.403343, 0, 0, 0, 1, 1,
-0.8616489, -0.3793608, -1.745309, 0, 0, 0, 1, 1,
-0.8612837, 0.2162184, -1.294822, 0, 0, 0, 1, 1,
-0.8598647, -0.9670724, -2.157649, 0, 0, 0, 1, 1,
-0.8582952, 0.1118185, -1.233713, 0, 0, 0, 1, 1,
-0.8566548, 0.9101443, -0.7117999, 0, 0, 0, 1, 1,
-0.8500649, -0.768052, -0.7625443, 0, 0, 0, 1, 1,
-0.8443639, -1.220329, -2.908305, 1, 1, 1, 1, 1,
-0.8383265, -0.5136966, -2.585165, 1, 1, 1, 1, 1,
-0.8342123, -0.9641479, -4.382872, 1, 1, 1, 1, 1,
-0.8334047, 0.9105709, -0.5291974, 1, 1, 1, 1, 1,
-0.8315445, -1.174551, -2.211679, 1, 1, 1, 1, 1,
-0.8296225, 0.04901382, -1.121573, 1, 1, 1, 1, 1,
-0.8288182, -1.829681, -1.311412, 1, 1, 1, 1, 1,
-0.8235213, 0.3161294, -2.207304, 1, 1, 1, 1, 1,
-0.8142762, -0.7104689, -1.195837, 1, 1, 1, 1, 1,
-0.8107848, 1.1482, -1.013586, 1, 1, 1, 1, 1,
-0.8072261, -1.044641, -1.614553, 1, 1, 1, 1, 1,
-0.8063116, 0.2337301, -1.54439, 1, 1, 1, 1, 1,
-0.8050205, 0.4532316, -3.57856, 1, 1, 1, 1, 1,
-0.803027, -0.1478063, -0.9699668, 1, 1, 1, 1, 1,
-0.8004684, 0.6929866, -0.5376878, 1, 1, 1, 1, 1,
-0.7994665, -0.3775318, -1.076156, 0, 0, 1, 1, 1,
-0.798585, 2.075874, -2.136714, 1, 0, 0, 1, 1,
-0.7939394, 1.126263, -1.589349, 1, 0, 0, 1, 1,
-0.7935154, -1.751759, -2.221948, 1, 0, 0, 1, 1,
-0.7934884, 0.4821582, 0.02293202, 1, 0, 0, 1, 1,
-0.7922835, 0.2638815, -1.071555, 1, 0, 0, 1, 1,
-0.7838088, -1.827847, -5.130605, 0, 0, 0, 1, 1,
-0.7822691, -0.7049319, -1.691382, 0, 0, 0, 1, 1,
-0.779569, 0.1093514, -2.908871, 0, 0, 0, 1, 1,
-0.7782604, -0.9218197, -2.182874, 0, 0, 0, 1, 1,
-0.7770905, -0.6706057, -1.475454, 0, 0, 0, 1, 1,
-0.7643272, 0.534694, -0.6926979, 0, 0, 0, 1, 1,
-0.7602486, 0.3681469, 0.02822676, 0, 0, 0, 1, 1,
-0.7568847, 0.2899475, -0.7823851, 1, 1, 1, 1, 1,
-0.7558795, -1.292717, -1.174637, 1, 1, 1, 1, 1,
-0.7556406, 1.339097, -1.683955, 1, 1, 1, 1, 1,
-0.7547111, -0.7852255, -1.070775, 1, 1, 1, 1, 1,
-0.7462685, -1.507928, -3.341639, 1, 1, 1, 1, 1,
-0.7438604, -0.8061518, -2.38939, 1, 1, 1, 1, 1,
-0.7347147, -0.517912, -0.2335222, 1, 1, 1, 1, 1,
-0.7345304, 0.02770566, -1.353593, 1, 1, 1, 1, 1,
-0.7292041, -1.539669, -2.698445, 1, 1, 1, 1, 1,
-0.7210584, -1.326954, -2.39135, 1, 1, 1, 1, 1,
-0.7209198, -0.5895704, -1.654256, 1, 1, 1, 1, 1,
-0.7168578, -1.068424, -2.267369, 1, 1, 1, 1, 1,
-0.714981, -0.1899524, -0.4707656, 1, 1, 1, 1, 1,
-0.7130318, 0.8888288, 0.8862797, 1, 1, 1, 1, 1,
-0.7106188, 0.1705701, -1.318156, 1, 1, 1, 1, 1,
-0.7105061, 0.1903742, -1.921733, 0, 0, 1, 1, 1,
-0.7036228, -0.261782, -0.569351, 1, 0, 0, 1, 1,
-0.7027354, 0.1567066, -0.3198532, 1, 0, 0, 1, 1,
-0.7011895, -0.8295752, -2.262381, 1, 0, 0, 1, 1,
-0.6982011, 0.1336952, -1.90915, 1, 0, 0, 1, 1,
-0.697434, 1.746606, -0.1633668, 1, 0, 0, 1, 1,
-0.6970026, 0.1211804, -1.579666, 0, 0, 0, 1, 1,
-0.6954602, 0.07736735, -1.781997, 0, 0, 0, 1, 1,
-0.694859, 0.9264768, -0.6615039, 0, 0, 0, 1, 1,
-0.6943063, 0.4966542, -1.069148, 0, 0, 0, 1, 1,
-0.6879083, -0.7115061, -2.172076, 0, 0, 0, 1, 1,
-0.6869281, -1.043358, -2.337957, 0, 0, 0, 1, 1,
-0.6826572, 0.3157243, -1.592048, 0, 0, 0, 1, 1,
-0.681529, -1.867799, -1.593811, 1, 1, 1, 1, 1,
-0.6769767, 1.384897, -0.6459273, 1, 1, 1, 1, 1,
-0.6648917, 1.61227, -0.5881953, 1, 1, 1, 1, 1,
-0.6630121, 0.3110603, -0.7671237, 1, 1, 1, 1, 1,
-0.6597773, -1.833033, -3.060454, 1, 1, 1, 1, 1,
-0.6581097, -0.1613703, -1.33891, 1, 1, 1, 1, 1,
-0.6520296, -1.491849, -4.343199, 1, 1, 1, 1, 1,
-0.6310699, 1.017231, -0.3300515, 1, 1, 1, 1, 1,
-0.630633, 2.483987, -0.1828181, 1, 1, 1, 1, 1,
-0.6281847, -2.36735, -3.379269, 1, 1, 1, 1, 1,
-0.6188266, 0.3227119, -1.024419, 1, 1, 1, 1, 1,
-0.6119855, -0.4269685, -3.300477, 1, 1, 1, 1, 1,
-0.6058944, 0.2770053, 0.66907, 1, 1, 1, 1, 1,
-0.6039193, 2.068911, -0.2106841, 1, 1, 1, 1, 1,
-0.6015101, -0.6211393, -1.605562, 1, 1, 1, 1, 1,
-0.5998523, 1.060812, -0.6705207, 0, 0, 1, 1, 1,
-0.5954351, -0.1398283, -1.957218, 1, 0, 0, 1, 1,
-0.5951129, 0.2132638, -2.175794, 1, 0, 0, 1, 1,
-0.5929487, -0.472139, -2.128999, 1, 0, 0, 1, 1,
-0.576631, 0.1067529, -1.885173, 1, 0, 0, 1, 1,
-0.5753348, -1.13687, -3.86786, 1, 0, 0, 1, 1,
-0.574881, -1.004821, -2.185677, 0, 0, 0, 1, 1,
-0.5740374, -1.724519, -1.501778, 0, 0, 0, 1, 1,
-0.5717427, 0.7244224, -0.5378655, 0, 0, 0, 1, 1,
-0.5717052, 1.809072, -0.09883259, 0, 0, 0, 1, 1,
-0.5650758, 0.5711175, 0.6765637, 0, 0, 0, 1, 1,
-0.5608843, -1.393868, -2.989483, 0, 0, 0, 1, 1,
-0.5534785, -0.00441932, -0.3403317, 0, 0, 0, 1, 1,
-0.5532275, -0.08746852, -4.230869, 1, 1, 1, 1, 1,
-0.550805, 0.124496, -1.767498, 1, 1, 1, 1, 1,
-0.5498735, -0.5986192, -2.499571, 1, 1, 1, 1, 1,
-0.545462, 1.621232, 0.06929347, 1, 1, 1, 1, 1,
-0.5347839, 0.8352244, -0.5744017, 1, 1, 1, 1, 1,
-0.5346754, -1.371911, -3.605491, 1, 1, 1, 1, 1,
-0.5331772, -0.9755388, -2.96052, 1, 1, 1, 1, 1,
-0.5316844, -0.6220129, -1.9311, 1, 1, 1, 1, 1,
-0.5264649, -1.083462, -1.704547, 1, 1, 1, 1, 1,
-0.5259892, 0.1873037, -0.9719506, 1, 1, 1, 1, 1,
-0.522613, 0.3518549, -1.136088, 1, 1, 1, 1, 1,
-0.5179354, -2.240273, -3.00733, 1, 1, 1, 1, 1,
-0.5168762, 0.873154, -0.0821586, 1, 1, 1, 1, 1,
-0.5130708, -0.6455973, -1.859488, 1, 1, 1, 1, 1,
-0.5126732, -2.069271, -5.143194, 1, 1, 1, 1, 1,
-0.5112545, -0.7806511, -1.296082, 0, 0, 1, 1, 1,
-0.5058718, 0.4280694, -1.212235, 1, 0, 0, 1, 1,
-0.5053522, -0.379752, -3.745023, 1, 0, 0, 1, 1,
-0.4975138, 0.1104031, -1.446415, 1, 0, 0, 1, 1,
-0.4975091, 0.3840712, -0.9711921, 1, 0, 0, 1, 1,
-0.491042, -0.618048, -3.873315, 1, 0, 0, 1, 1,
-0.490864, 0.2871238, 0.06069971, 0, 0, 0, 1, 1,
-0.4898039, -0.06760234, -2.700276, 0, 0, 0, 1, 1,
-0.4863353, 0.140312, -0.07127313, 0, 0, 0, 1, 1,
-0.4831787, -0.3156058, -4.72346, 0, 0, 0, 1, 1,
-0.4788553, 0.5949378, -0.3853606, 0, 0, 0, 1, 1,
-0.4788362, -0.03890069, -1.954562, 0, 0, 0, 1, 1,
-0.4742693, 0.5436123, -0.531664, 0, 0, 0, 1, 1,
-0.4707368, -0.3178031, -1.208367, 1, 1, 1, 1, 1,
-0.4679009, 1.494197, -0.5119359, 1, 1, 1, 1, 1,
-0.464983, -0.3091199, -2.477125, 1, 1, 1, 1, 1,
-0.462563, 1.262726, 0.4788469, 1, 1, 1, 1, 1,
-0.4575113, 0.6495515, -0.7349397, 1, 1, 1, 1, 1,
-0.4558105, -0.4690305, -2.28839, 1, 1, 1, 1, 1,
-0.4490892, -2.138142, -3.982831, 1, 1, 1, 1, 1,
-0.4489679, 0.3982992, -0.6097521, 1, 1, 1, 1, 1,
-0.446747, -0.584482, -1.889896, 1, 1, 1, 1, 1,
-0.4458104, 1.27846, 0.0996162, 1, 1, 1, 1, 1,
-0.4440984, -0.8427376, -2.033982, 1, 1, 1, 1, 1,
-0.4432802, 0.2171878, -2.446454, 1, 1, 1, 1, 1,
-0.4429682, -0.807945, -3.20517, 1, 1, 1, 1, 1,
-0.441486, -0.7740011, -3.260702, 1, 1, 1, 1, 1,
-0.4389009, 0.710102, -1.563396, 1, 1, 1, 1, 1,
-0.4386921, -0.4102489, -1.153818, 0, 0, 1, 1, 1,
-0.437804, 1.31371, -0.3938378, 1, 0, 0, 1, 1,
-0.4375612, -1.78186, -2.971665, 1, 0, 0, 1, 1,
-0.4372551, 1.166491, -1.004234, 1, 0, 0, 1, 1,
-0.431872, -0.7961935, -3.226322, 1, 0, 0, 1, 1,
-0.4316463, 0.1924532, -1.601683, 1, 0, 0, 1, 1,
-0.4306036, 0.6926063, 0.2925112, 0, 0, 0, 1, 1,
-0.4279988, 0.7268983, -1.503582, 0, 0, 0, 1, 1,
-0.4221708, -0.9574506, -2.879959, 0, 0, 0, 1, 1,
-0.4217848, 0.9619187, 2.224522, 0, 0, 0, 1, 1,
-0.4209502, 0.8655792, -0.2266453, 0, 0, 0, 1, 1,
-0.4209277, 0.39226, -0.625568, 0, 0, 0, 1, 1,
-0.4193735, -0.9546213, -2.868909, 0, 0, 0, 1, 1,
-0.418669, -1.304073, -3.174032, 1, 1, 1, 1, 1,
-0.4156274, -1.085064, -3.630461, 1, 1, 1, 1, 1,
-0.4030443, 0.7170542, 0.7203047, 1, 1, 1, 1, 1,
-0.40072, -0.5592204, -2.553298, 1, 1, 1, 1, 1,
-0.397891, -1.776142, -3.654385, 1, 1, 1, 1, 1,
-0.3905777, 1.00835, -0.3047005, 1, 1, 1, 1, 1,
-0.3904613, 0.5345489, -2.134407, 1, 1, 1, 1, 1,
-0.3838048, -1.85518, -3.954341, 1, 1, 1, 1, 1,
-0.3813655, 0.5504093, 0.5869534, 1, 1, 1, 1, 1,
-0.3767267, 0.5736818, 0.5912192, 1, 1, 1, 1, 1,
-0.3719924, 0.1145578, -2.224846, 1, 1, 1, 1, 1,
-0.3706729, -0.6837142, -4.20274, 1, 1, 1, 1, 1,
-0.3690007, -0.003750146, 0.3504032, 1, 1, 1, 1, 1,
-0.3676606, 0.5214313, -0.6434728, 1, 1, 1, 1, 1,
-0.36595, -0.8411866, -4.389036, 1, 1, 1, 1, 1,
-0.3524665, -0.305997, -1.981432, 0, 0, 1, 1, 1,
-0.3508668, -1.143503, -4.919697, 1, 0, 0, 1, 1,
-0.350849, 0.3979873, 0.8536387, 1, 0, 0, 1, 1,
-0.3508149, -0.7757547, -1.719554, 1, 0, 0, 1, 1,
-0.339849, 0.1352608, -1.635339, 1, 0, 0, 1, 1,
-0.3397434, -0.8457803, -1.536937, 1, 0, 0, 1, 1,
-0.3396194, 0.9448512, -2.742287, 0, 0, 0, 1, 1,
-0.3370787, -2.051529, -3.243154, 0, 0, 0, 1, 1,
-0.3361065, 0.6055378, -1.317387, 0, 0, 0, 1, 1,
-0.3344446, 0.7317448, 1.301301, 0, 0, 0, 1, 1,
-0.3332116, -0.2479066, -2.568977, 0, 0, 0, 1, 1,
-0.3318137, 0.6491551, -1.064141, 0, 0, 0, 1, 1,
-0.3269432, 0.1790398, 0.5806584, 0, 0, 0, 1, 1,
-0.3213462, -1.395531, -4.422315, 1, 1, 1, 1, 1,
-0.3209995, -1.95358, -2.476554, 1, 1, 1, 1, 1,
-0.3195302, -0.2804248, -3.184446, 1, 1, 1, 1, 1,
-0.3145485, 1.166026, 0.2748384, 1, 1, 1, 1, 1,
-0.3144918, -0.6386905, -3.592456, 1, 1, 1, 1, 1,
-0.3137201, 0.1721111, 0.2260098, 1, 1, 1, 1, 1,
-0.3136981, 0.01311137, -1.070134, 1, 1, 1, 1, 1,
-0.3087439, -0.1245641, -2.231518, 1, 1, 1, 1, 1,
-0.3067054, -0.5136883, -2.207211, 1, 1, 1, 1, 1,
-0.3050834, -0.5956975, -2.597341, 1, 1, 1, 1, 1,
-0.3003405, -2.032248, -3.308385, 1, 1, 1, 1, 1,
-0.2989899, 0.5037354, 0.4812302, 1, 1, 1, 1, 1,
-0.2974691, -0.6121798, -2.174924, 1, 1, 1, 1, 1,
-0.2927767, -0.9589532, -2.467799, 1, 1, 1, 1, 1,
-0.292635, 1.765479, 0.5399003, 1, 1, 1, 1, 1,
-0.2924132, -0.625559, -0.9670509, 0, 0, 1, 1, 1,
-0.2887859, 0.4963493, -0.8255676, 1, 0, 0, 1, 1,
-0.2883323, 0.0861019, 0.5032114, 1, 0, 0, 1, 1,
-0.2866838, -0.6077742, -4.555156, 1, 0, 0, 1, 1,
-0.2814213, 0.2232714, -0.6194513, 1, 0, 0, 1, 1,
-0.2813626, 1.284412, 1.024651, 1, 0, 0, 1, 1,
-0.2772017, 0.8149177, 0.3512985, 0, 0, 0, 1, 1,
-0.2727851, 2.900035, -0.7211523, 0, 0, 0, 1, 1,
-0.2717088, -0.6642237, -0.1785546, 0, 0, 0, 1, 1,
-0.2715668, 2.515865, -0.6478524, 0, 0, 0, 1, 1,
-0.2688533, -1.064878, -2.205078, 0, 0, 0, 1, 1,
-0.2664407, -0.5469983, -3.055999, 0, 0, 0, 1, 1,
-0.2645061, 1.554693, -1.009219, 0, 0, 0, 1, 1,
-0.2643688, 0.0468515, -2.064101, 1, 1, 1, 1, 1,
-0.2641241, 0.458295, 0.4465384, 1, 1, 1, 1, 1,
-0.2619744, 0.9585328, -1.654905, 1, 1, 1, 1, 1,
-0.2604099, -0.812125, -2.834089, 1, 1, 1, 1, 1,
-0.2594873, -2.201117, -3.070367, 1, 1, 1, 1, 1,
-0.2585533, 2.059206, 0.5433974, 1, 1, 1, 1, 1,
-0.2572844, -0.191368, -1.788406, 1, 1, 1, 1, 1,
-0.2558982, -0.3508146, -2.841277, 1, 1, 1, 1, 1,
-0.254369, -1.374877, -3.319291, 1, 1, 1, 1, 1,
-0.2487236, 2.434437, 1.553194, 1, 1, 1, 1, 1,
-0.2444668, -0.3386495, -1.406575, 1, 1, 1, 1, 1,
-0.239631, 0.06490073, -2.037685, 1, 1, 1, 1, 1,
-0.2332375, -0.1274882, -2.701258, 1, 1, 1, 1, 1,
-0.2327715, 0.03580737, -1.855533, 1, 1, 1, 1, 1,
-0.2321355, 1.572487, 0.4356528, 1, 1, 1, 1, 1,
-0.231384, 0.6812539, -1.036501, 0, 0, 1, 1, 1,
-0.2307675, 1.310145, 0.567297, 1, 0, 0, 1, 1,
-0.2263953, -1.028495, -2.647503, 1, 0, 0, 1, 1,
-0.2236908, -0.8663555, -1.949739, 1, 0, 0, 1, 1,
-0.2227273, -0.1843691, -2.846133, 1, 0, 0, 1, 1,
-0.221656, 0.6260406, -0.5900169, 1, 0, 0, 1, 1,
-0.2207532, 1.222215, 1.164821, 0, 0, 0, 1, 1,
-0.2194142, -0.6161478, -2.378788, 0, 0, 0, 1, 1,
-0.2133341, 0.7657839, 0.9124214, 0, 0, 0, 1, 1,
-0.2113235, 0.2057586, -1.274389, 0, 0, 0, 1, 1,
-0.2017806, -0.4542265, -1.356116, 0, 0, 0, 1, 1,
-0.1986893, 0.2293224, -0.7236252, 0, 0, 0, 1, 1,
-0.1984544, -0.1960015, -1.83334, 0, 0, 0, 1, 1,
-0.1909098, -0.01776298, -2.550035, 1, 1, 1, 1, 1,
-0.188612, -0.008619426, -0.8230341, 1, 1, 1, 1, 1,
-0.1829161, 0.2984023, 0.5423455, 1, 1, 1, 1, 1,
-0.1790157, -0.736367, -1.614844, 1, 1, 1, 1, 1,
-0.1757982, 1.586971, -0.1558735, 1, 1, 1, 1, 1,
-0.1745654, 1.113982, -0.7371947, 1, 1, 1, 1, 1,
-0.1720169, -0.03571591, -0.2913563, 1, 1, 1, 1, 1,
-0.1693023, 0.7420414, -0.06460634, 1, 1, 1, 1, 1,
-0.1661949, 0.7423294, -0.8082372, 1, 1, 1, 1, 1,
-0.1628437, -0.2335071, -3.485672, 1, 1, 1, 1, 1,
-0.1619353, -0.1568779, -2.629315, 1, 1, 1, 1, 1,
-0.1469865, 0.4243277, 0.366164, 1, 1, 1, 1, 1,
-0.1465548, 0.1553383, 2.135025, 1, 1, 1, 1, 1,
-0.1393072, -0.5400553, -3.399168, 1, 1, 1, 1, 1,
-0.1339732, -1.094648, -2.424649, 1, 1, 1, 1, 1,
-0.1332408, 1.597243, -1.518227, 0, 0, 1, 1, 1,
-0.1213502, -0.1631747, -0.9006072, 1, 0, 0, 1, 1,
-0.1151299, 1.167973, -1.384445, 1, 0, 0, 1, 1,
-0.1134735, 1.406612, -0.1345892, 1, 0, 0, 1, 1,
-0.1039845, -0.2957804, -3.962264, 1, 0, 0, 1, 1,
-0.1021566, 1.691, 0.5954896, 1, 0, 0, 1, 1,
-0.1019435, 0.05982254, -0.399498, 0, 0, 0, 1, 1,
-0.1016818, 0.2792249, 0.9086879, 0, 0, 0, 1, 1,
-0.0965925, 0.3631178, -1.164391, 0, 0, 0, 1, 1,
-0.09445453, -0.5574485, -2.220556, 0, 0, 0, 1, 1,
-0.0917609, -2.510637, -4.898568, 0, 0, 0, 1, 1,
-0.0916812, -0.1436227, -1.584698, 0, 0, 0, 1, 1,
-0.09166174, 1.742046, -0.2403797, 0, 0, 0, 1, 1,
-0.08935754, 1.453146, 0.3747581, 1, 1, 1, 1, 1,
-0.08888353, 0.6223, -1.419844, 1, 1, 1, 1, 1,
-0.0860242, 0.9056241, -0.5800223, 1, 1, 1, 1, 1,
-0.08374763, -2.679675, -1.751546, 1, 1, 1, 1, 1,
-0.08273786, -0.789534, -3.471768, 1, 1, 1, 1, 1,
-0.08237872, 0.8217292, -1.045224, 1, 1, 1, 1, 1,
-0.07971898, -1.505334, -2.046896, 1, 1, 1, 1, 1,
-0.07906499, -2.037198, -2.682818, 1, 1, 1, 1, 1,
-0.07661653, -1.233189, -2.335484, 1, 1, 1, 1, 1,
-0.07647385, 0.8560897, -1.088075, 1, 1, 1, 1, 1,
-0.06922918, -1.100567, -2.464249, 1, 1, 1, 1, 1,
-0.06772959, -1.560858, -2.922783, 1, 1, 1, 1, 1,
-0.06383889, -0.2216958, -2.720037, 1, 1, 1, 1, 1,
-0.06363255, -0.6708044, -3.72403, 1, 1, 1, 1, 1,
-0.06018057, -0.9690315, -3.48581, 1, 1, 1, 1, 1,
-0.05818459, -0.7551496, -4.566742, 0, 0, 1, 1, 1,
-0.05811239, 0.7064319, 0.9904416, 1, 0, 0, 1, 1,
-0.05701869, 0.001546894, -4.011549, 1, 0, 0, 1, 1,
-0.05399454, -0.5692763, -3.199371, 1, 0, 0, 1, 1,
-0.05152279, -0.8034621, -2.69362, 1, 0, 0, 1, 1,
-0.0512275, 0.1303149, -1.01742, 1, 0, 0, 1, 1,
-0.05109892, -0.0551515, -2.124483, 0, 0, 0, 1, 1,
-0.05064634, 1.371856, -0.3495586, 0, 0, 0, 1, 1,
-0.04771345, -1.464445, -5.257391, 0, 0, 0, 1, 1,
-0.04379352, -0.3456255, -4.456443, 0, 0, 0, 1, 1,
-0.04222962, -2.111246, -3.079486, 0, 0, 0, 1, 1,
-0.04003363, -1.859027, -1.944449, 0, 0, 0, 1, 1,
-0.03201651, -1.705227, -3.826539, 0, 0, 0, 1, 1,
-0.03004444, 0.1239335, -0.8236089, 1, 1, 1, 1, 1,
-0.02770645, 0.9371812, -0.9818642, 1, 1, 1, 1, 1,
-0.0276654, 0.5829806, -0.02396601, 1, 1, 1, 1, 1,
-0.01761054, -0.6981992, -0.3852918, 1, 1, 1, 1, 1,
-0.01712818, -1.686637, -3.651798, 1, 1, 1, 1, 1,
-0.01673942, -0.3852357, -4.04399, 1, 1, 1, 1, 1,
-0.01276557, -0.1305783, -3.311221, 1, 1, 1, 1, 1,
-0.01124533, 0.5723692, -0.2114002, 1, 1, 1, 1, 1,
-0.003449948, 0.3951814, -1.52618, 1, 1, 1, 1, 1,
0.002843011, -0.02291621, 2.060726, 1, 1, 1, 1, 1,
0.006142488, -1.066604, 2.648699, 1, 1, 1, 1, 1,
0.007243412, -0.05926663, 3.489595, 1, 1, 1, 1, 1,
0.008765794, 0.6198751, -0.1692669, 1, 1, 1, 1, 1,
0.009658489, -0.2567211, 2.942007, 1, 1, 1, 1, 1,
0.01049364, 0.4303776, -0.4372804, 1, 1, 1, 1, 1,
0.01154787, -0.6050155, 1.686578, 0, 0, 1, 1, 1,
0.01220373, 0.7493163, 1.133304, 1, 0, 0, 1, 1,
0.01466623, -1.244435, 2.732531, 1, 0, 0, 1, 1,
0.01895437, -0.575712, 2.465615, 1, 0, 0, 1, 1,
0.0281979, -0.1344073, 2.139697, 1, 0, 0, 1, 1,
0.02888663, -0.724631, 4.323368, 1, 0, 0, 1, 1,
0.03003488, 0.2570162, -0.1872366, 0, 0, 0, 1, 1,
0.03543502, -0.4445151, 3.139795, 0, 0, 0, 1, 1,
0.03908285, -0.1923689, 2.706565, 0, 0, 0, 1, 1,
0.0405354, -0.9825844, 1.491723, 0, 0, 0, 1, 1,
0.04490741, -2.723864, 2.901105, 0, 0, 0, 1, 1,
0.0460788, 0.4843549, -0.05161392, 0, 0, 0, 1, 1,
0.04684253, 0.01721938, 1.799125, 0, 0, 0, 1, 1,
0.04708255, -1.781649, 3.622589, 1, 1, 1, 1, 1,
0.05470524, 0.1505572, 1.28054, 1, 1, 1, 1, 1,
0.05621925, 0.8695538, 0.3355014, 1, 1, 1, 1, 1,
0.05736521, -0.4508545, 1.276938, 1, 1, 1, 1, 1,
0.0611906, 0.6169237, 0.8024487, 1, 1, 1, 1, 1,
0.06443022, 0.5422173, 0.4626714, 1, 1, 1, 1, 1,
0.06562129, 0.881896, 0.5958812, 1, 1, 1, 1, 1,
0.06615423, 0.5654658, -0.2066608, 1, 1, 1, 1, 1,
0.07524917, 0.2559668, 1.446249, 1, 1, 1, 1, 1,
0.07964458, 0.635052, -1.748557, 1, 1, 1, 1, 1,
0.08343232, -2.081726, 2.348664, 1, 1, 1, 1, 1,
0.08543986, 0.05327177, 1.771064, 1, 1, 1, 1, 1,
0.08655847, -0.278092, 2.891153, 1, 1, 1, 1, 1,
0.08752842, -0.1382808, 3.352644, 1, 1, 1, 1, 1,
0.08962074, -0.9441646, 2.564341, 1, 1, 1, 1, 1,
0.09315424, 0.003815737, 0.2972136, 0, 0, 1, 1, 1,
0.09318203, 0.1741609, 1.253205, 1, 0, 0, 1, 1,
0.09918579, -0.260196, 1.942718, 1, 0, 0, 1, 1,
0.109937, -0.2284068, 1.776333, 1, 0, 0, 1, 1,
0.1158001, 1.975446, -0.809368, 1, 0, 0, 1, 1,
0.1164022, 1.603572, 1.103763, 1, 0, 0, 1, 1,
0.1168174, 0.2928107, 0.2226705, 0, 0, 0, 1, 1,
0.1185097, 0.505969, -1.163528, 0, 0, 0, 1, 1,
0.1189486, -0.1393348, 3.269195, 0, 0, 0, 1, 1,
0.1200037, 1.10887, -1.079923, 0, 0, 0, 1, 1,
0.1225191, 0.7901933, -0.7456346, 0, 0, 0, 1, 1,
0.1236748, 1.036536, -1.029121, 0, 0, 0, 1, 1,
0.1275286, 1.738325, -1.445019, 0, 0, 0, 1, 1,
0.1283247, 0.3355606, 0.1807201, 1, 1, 1, 1, 1,
0.1306323, -0.196842, 0.3028172, 1, 1, 1, 1, 1,
0.1350678, -0.4387785, 1.193786, 1, 1, 1, 1, 1,
0.1384141, -0.5265125, 3.420667, 1, 1, 1, 1, 1,
0.1431387, 0.2902625, 0.3444298, 1, 1, 1, 1, 1,
0.1440396, 0.5244845, -0.6076494, 1, 1, 1, 1, 1,
0.1441609, 0.6761005, -0.4544985, 1, 1, 1, 1, 1,
0.1469411, -1.306673, 3.013631, 1, 1, 1, 1, 1,
0.1475899, -0.2059869, 2.057759, 1, 1, 1, 1, 1,
0.1492992, 0.4595055, 0.01999071, 1, 1, 1, 1, 1,
0.1543954, 0.07715855, 1.005174, 1, 1, 1, 1, 1,
0.1548691, -0.09429922, 1.96576, 1, 1, 1, 1, 1,
0.1596538, 0.1700495, 1.11851, 1, 1, 1, 1, 1,
0.1627141, -0.02070843, 1.193477, 1, 1, 1, 1, 1,
0.1646148, -0.02867501, 3.223752, 1, 1, 1, 1, 1,
0.1668796, -0.3463648, 2.210951, 0, 0, 1, 1, 1,
0.166969, -1.259346, 3.617106, 1, 0, 0, 1, 1,
0.1674863, -0.175367, 2.264916, 1, 0, 0, 1, 1,
0.1709965, 0.3706776, 0.01551936, 1, 0, 0, 1, 1,
0.1711479, -0.3649352, 3.552541, 1, 0, 0, 1, 1,
0.1723999, -0.0130796, 1.165366, 1, 0, 0, 1, 1,
0.1740618, 0.1980279, 1.568121, 0, 0, 0, 1, 1,
0.1772974, 1.935698, 1.951856, 0, 0, 0, 1, 1,
0.1811818, -1.051494, 2.931059, 0, 0, 0, 1, 1,
0.1844831, -0.5397554, 1.37456, 0, 0, 0, 1, 1,
0.1857158, 1.562981, 1.227082, 0, 0, 0, 1, 1,
0.1861884, 1.550854, -0.7401242, 0, 0, 0, 1, 1,
0.1885416, 0.4742231, 0.369138, 0, 0, 0, 1, 1,
0.1887511, 0.4110453, 1.82024, 1, 1, 1, 1, 1,
0.2002805, 1.006628, -0.9871014, 1, 1, 1, 1, 1,
0.2013512, -0.710224, 2.746659, 1, 1, 1, 1, 1,
0.2078788, -0.2411656, 3.142502, 1, 1, 1, 1, 1,
0.2141698, 0.2177465, 1.109024, 1, 1, 1, 1, 1,
0.2166959, 0.8072903, 0.809375, 1, 1, 1, 1, 1,
0.220363, 1.202194, -0.2226167, 1, 1, 1, 1, 1,
0.2204731, -0.4998276, 2.276208, 1, 1, 1, 1, 1,
0.2207271, -0.2542034, 2.717096, 1, 1, 1, 1, 1,
0.2220755, 0.3736307, -0.4145119, 1, 1, 1, 1, 1,
0.2231895, -0.2874291, 2.059835, 1, 1, 1, 1, 1,
0.2253494, 0.8696917, 1.089554, 1, 1, 1, 1, 1,
0.2266807, -1.403843, 2.573776, 1, 1, 1, 1, 1,
0.2270782, 0.1117896, 0.9799162, 1, 1, 1, 1, 1,
0.2279626, 0.8897742, -0.1045287, 1, 1, 1, 1, 1,
0.2291686, 1.537696, 2.458055, 0, 0, 1, 1, 1,
0.231754, 0.6334217, -1.054889, 1, 0, 0, 1, 1,
0.2357879, 0.1778072, -1.021521, 1, 0, 0, 1, 1,
0.2368236, 0.8573502, -0.7146679, 1, 0, 0, 1, 1,
0.2385674, 0.620303, 0.8876345, 1, 0, 0, 1, 1,
0.2431811, -0.9595546, 1.568447, 1, 0, 0, 1, 1,
0.2447329, 0.009298403, 1.826907, 0, 0, 0, 1, 1,
0.2458131, 0.4712106, 1.238243, 0, 0, 0, 1, 1,
0.2590387, 0.288212, 1.517305, 0, 0, 0, 1, 1,
0.2601776, 0.7416849, -0.7036642, 0, 0, 0, 1, 1,
0.263491, -0.9738894, 2.274731, 0, 0, 0, 1, 1,
0.2648736, 0.6832156, 0.8370236, 0, 0, 0, 1, 1,
0.2660717, 1.425006, 0.6294114, 0, 0, 0, 1, 1,
0.2663725, 0.7754357, 0.8379136, 1, 1, 1, 1, 1,
0.268122, -0.3533115, 1.2745, 1, 1, 1, 1, 1,
0.2689133, 0.7487561, -0.992315, 1, 1, 1, 1, 1,
0.2697862, -0.4905518, 2.297221, 1, 1, 1, 1, 1,
0.2711284, -0.597474, 3.09033, 1, 1, 1, 1, 1,
0.2716293, 0.2325491, 1.687206, 1, 1, 1, 1, 1,
0.2735879, -1.98473, 4.704959, 1, 1, 1, 1, 1,
0.2745641, -0.3249892, 0.4106998, 1, 1, 1, 1, 1,
0.2762768, -0.8210855, 4.14702, 1, 1, 1, 1, 1,
0.2839593, 0.3683605, -0.4312251, 1, 1, 1, 1, 1,
0.2886699, -0.9180953, 4.345844, 1, 1, 1, 1, 1,
0.2892553, -1.513909, 2.65254, 1, 1, 1, 1, 1,
0.2904111, -0.1537377, 0.967971, 1, 1, 1, 1, 1,
0.2913571, -1.177992, 4.502977, 1, 1, 1, 1, 1,
0.2947124, 2.222447, 0.03691756, 1, 1, 1, 1, 1,
0.2955927, -1.326643, 3.813836, 0, 0, 1, 1, 1,
0.2965876, -1.513911, 2.705647, 1, 0, 0, 1, 1,
0.3026233, -0.6066032, 3.335513, 1, 0, 0, 1, 1,
0.3064163, -0.02133442, 2.447404, 1, 0, 0, 1, 1,
0.3077926, -0.8773697, 1.482816, 1, 0, 0, 1, 1,
0.3091987, 1.002555, -1.034236, 1, 0, 0, 1, 1,
0.3107209, -0.8063494, 2.133637, 0, 0, 0, 1, 1,
0.3161729, 0.8151203, 1.468777, 0, 0, 0, 1, 1,
0.3251441, 0.2898376, 0.2998376, 0, 0, 0, 1, 1,
0.3351548, 1.248522, 1.094798, 0, 0, 0, 1, 1,
0.337887, -0.004501475, 0.8820657, 0, 0, 0, 1, 1,
0.3390093, 0.02380506, 1.827294, 0, 0, 0, 1, 1,
0.3458739, 0.486844, 2.721039, 0, 0, 0, 1, 1,
0.3473506, 0.1734902, 0.9055265, 1, 1, 1, 1, 1,
0.3488172, -0.6048761, 3.167777, 1, 1, 1, 1, 1,
0.3498525, -1.767707, 4.361935, 1, 1, 1, 1, 1,
0.350035, -2.587338, 3.988823, 1, 1, 1, 1, 1,
0.354234, 0.9004608, -0.9674808, 1, 1, 1, 1, 1,
0.3558359, -0.5313668, 3.198754, 1, 1, 1, 1, 1,
0.3565703, -0.6972255, 3.594683, 1, 1, 1, 1, 1,
0.3652081, 0.7998952, 0.1828578, 1, 1, 1, 1, 1,
0.3723175, -0.2063829, 3.32794, 1, 1, 1, 1, 1,
0.3767706, -0.009091326, 2.508339, 1, 1, 1, 1, 1,
0.3795949, -0.9795004, 2.793777, 1, 1, 1, 1, 1,
0.3808095, -0.2719806, 1.736387, 1, 1, 1, 1, 1,
0.3841205, -1.135606, 1.901631, 1, 1, 1, 1, 1,
0.3841425, 1.22557, 1.545787, 1, 1, 1, 1, 1,
0.3843952, 1.19504, 1.770479, 1, 1, 1, 1, 1,
0.3896448, -0.04370038, 1.966222, 0, 0, 1, 1, 1,
0.3912425, 0.4448269, 2.246287, 1, 0, 0, 1, 1,
0.3932882, -1.476769, 2.070306, 1, 0, 0, 1, 1,
0.3946057, -1.278171, 1.619092, 1, 0, 0, 1, 1,
0.3960261, -1.73007, 2.60957, 1, 0, 0, 1, 1,
0.3985376, -0.08096286, 2.45319, 1, 0, 0, 1, 1,
0.4013002, 0.7371649, 1.285902, 0, 0, 0, 1, 1,
0.405113, 0.2270466, -0.3149403, 0, 0, 0, 1, 1,
0.405929, 0.8944222, -0.391493, 0, 0, 0, 1, 1,
0.4076733, 0.5368297, 2.502369, 0, 0, 0, 1, 1,
0.4118573, -0.6552211, 2.543189, 0, 0, 0, 1, 1,
0.4139126, 1.388959, 0.23853, 0, 0, 0, 1, 1,
0.4157095, -0.03078145, 1.90846, 0, 0, 0, 1, 1,
0.4173137, -0.05487965, 1.974193, 1, 1, 1, 1, 1,
0.4185891, 0.6655849, -0.6711698, 1, 1, 1, 1, 1,
0.4189594, 0.2042938, 3.526591, 1, 1, 1, 1, 1,
0.4211625, -0.312245, 0.7720765, 1, 1, 1, 1, 1,
0.4251514, -0.2099371, 2.008214, 1, 1, 1, 1, 1,
0.4255551, -0.8504596, 0.9211701, 1, 1, 1, 1, 1,
0.4278786, 0.7716242, -0.5798076, 1, 1, 1, 1, 1,
0.4293828, -1.55356, 1.710472, 1, 1, 1, 1, 1,
0.4314314, 1.099781, 2.190167, 1, 1, 1, 1, 1,
0.4328937, -0.4024367, 2.214675, 1, 1, 1, 1, 1,
0.4331281, 1.486751, -0.6861193, 1, 1, 1, 1, 1,
0.434201, 1.395018, -0.001742052, 1, 1, 1, 1, 1,
0.4361124, 0.9032691, -0.1376568, 1, 1, 1, 1, 1,
0.4376656, 0.9585051, -1.008443, 1, 1, 1, 1, 1,
0.4431348, -1.049461, 1.868493, 1, 1, 1, 1, 1,
0.4443011, 1.367449, 0.3379664, 0, 0, 1, 1, 1,
0.4449198, 0.319556, 2.121459, 1, 0, 0, 1, 1,
0.4460218, -0.638795, 1.442958, 1, 0, 0, 1, 1,
0.4491055, -0.3587575, 2.969679, 1, 0, 0, 1, 1,
0.450488, 0.9732127, -0.008590945, 1, 0, 0, 1, 1,
0.4520852, 1.895757, 1.459769, 1, 0, 0, 1, 1,
0.4537424, -1.088232, 2.621947, 0, 0, 0, 1, 1,
0.4544295, -1.048954, 2.03514, 0, 0, 0, 1, 1,
0.4545118, 0.4449092, -1.330784, 0, 0, 0, 1, 1,
0.4548255, -0.7862713, 1.759264, 0, 0, 0, 1, 1,
0.4603368, -0.3447463, 2.851807, 0, 0, 0, 1, 1,
0.460793, 2.527971, 0.7678282, 0, 0, 0, 1, 1,
0.4617293, -0.1417364, 3.641808, 0, 0, 0, 1, 1,
0.4621522, -0.8665477, 4.020425, 1, 1, 1, 1, 1,
0.462328, -0.8044876, 4.151369, 1, 1, 1, 1, 1,
0.4627843, 0.8784769, 1.04495, 1, 1, 1, 1, 1,
0.4742572, 0.5969823, 1.14967, 1, 1, 1, 1, 1,
0.4756648, -0.6565164, 3.778743, 1, 1, 1, 1, 1,
0.4774568, -0.3639766, 2.035949, 1, 1, 1, 1, 1,
0.4819727, 0.5737393, 0.01558722, 1, 1, 1, 1, 1,
0.4867803, 0.1668716, 0.7601889, 1, 1, 1, 1, 1,
0.4886288, -1.03533, 3.438315, 1, 1, 1, 1, 1,
0.4916546, -0.4145242, 1.342845, 1, 1, 1, 1, 1,
0.4946926, 0.09058667, 0.3099098, 1, 1, 1, 1, 1,
0.4989699, -0.2155163, 2.071949, 1, 1, 1, 1, 1,
0.4996653, 0.7686498, -0.6673266, 1, 1, 1, 1, 1,
0.5014551, 0.1316579, 1.869543, 1, 1, 1, 1, 1,
0.5021936, 0.8987939, 0.8009751, 1, 1, 1, 1, 1,
0.5022164, -0.5815464, 3.922643, 0, 0, 1, 1, 1,
0.502333, -1.751199, 4.332066, 1, 0, 0, 1, 1,
0.5064302, -0.006170901, 0.4628145, 1, 0, 0, 1, 1,
0.5079448, -1.074122, 3.152226, 1, 0, 0, 1, 1,
0.5084277, -0.9846445, 1.405083, 1, 0, 0, 1, 1,
0.5089305, 0.104596, -0.3084258, 1, 0, 0, 1, 1,
0.5099868, 0.06501877, 2.772104, 0, 0, 0, 1, 1,
0.5106306, -0.2806523, 1.927125, 0, 0, 0, 1, 1,
0.5147655, -0.1882459, 1.739129, 0, 0, 0, 1, 1,
0.5157002, -2.365595, 3.347083, 0, 0, 0, 1, 1,
0.5162231, -1.45859, 2.731437, 0, 0, 0, 1, 1,
0.5162948, -0.7594113, 1.342023, 0, 0, 0, 1, 1,
0.522687, -1.839223, 3.52147, 0, 0, 0, 1, 1,
0.5278531, 0.215055, -0.3184597, 1, 1, 1, 1, 1,
0.5278908, 2.026097, 2.256661, 1, 1, 1, 1, 1,
0.5319934, -1.082986, 3.322734, 1, 1, 1, 1, 1,
0.5357595, -0.08266829, 0.8164439, 1, 1, 1, 1, 1,
0.5357966, -1.334622, 4.618227, 1, 1, 1, 1, 1,
0.5393183, 0.7063079, 0.4390055, 1, 1, 1, 1, 1,
0.5400082, -2.265743, 2.755415, 1, 1, 1, 1, 1,
0.5440984, 0.6697863, -0.4548357, 1, 1, 1, 1, 1,
0.5454072, -0.4980429, 1.760388, 1, 1, 1, 1, 1,
0.5485313, -0.2883714, 2.117821, 1, 1, 1, 1, 1,
0.5491293, 0.09864901, 1.675622, 1, 1, 1, 1, 1,
0.5503878, -1.096201, 2.309699, 1, 1, 1, 1, 1,
0.5539377, 0.8236459, 0.795134, 1, 1, 1, 1, 1,
0.5576318, 0.3825362, 2.364127, 1, 1, 1, 1, 1,
0.5585737, 1.365008, 1.077719, 1, 1, 1, 1, 1,
0.5587103, 1.026646, 1.104351, 0, 0, 1, 1, 1,
0.5593821, -0.5144853, 2.940021, 1, 0, 0, 1, 1,
0.5640193, -0.6532856, 2.475176, 1, 0, 0, 1, 1,
0.5664358, 0.2569417, 1.501387, 1, 0, 0, 1, 1,
0.5708593, 1.32121, -0.01859198, 1, 0, 0, 1, 1,
0.57184, 0.3102483, 2.796741, 1, 0, 0, 1, 1,
0.5734308, -1.100964, 3.92478, 0, 0, 0, 1, 1,
0.5761427, 0.01139013, 0.9746063, 0, 0, 0, 1, 1,
0.5783111, 0.4038189, 1.142703, 0, 0, 0, 1, 1,
0.5796937, 1.296748, 1.387831, 0, 0, 0, 1, 1,
0.5874609, -0.9122128, 1.425589, 0, 0, 0, 1, 1,
0.5876505, 0.3745849, 0.1809175, 0, 0, 0, 1, 1,
0.5936352, 0.1882384, 1.143175, 0, 0, 0, 1, 1,
0.5962746, -0.7641451, 2.428533, 1, 1, 1, 1, 1,
0.6042864, -0.2770216, 0.8829433, 1, 1, 1, 1, 1,
0.609452, -1.137104, 3.708964, 1, 1, 1, 1, 1,
0.6107928, -1.886944, 3.579302, 1, 1, 1, 1, 1,
0.6110348, 1.674674, 1.350774, 1, 1, 1, 1, 1,
0.6276315, 1.03573, -1.756621, 1, 1, 1, 1, 1,
0.6276549, -0.1598005, -0.7931891, 1, 1, 1, 1, 1,
0.6301416, 0.1469822, 0.1453679, 1, 1, 1, 1, 1,
0.6364577, -1.705345, 2.377881, 1, 1, 1, 1, 1,
0.6407695, -0.5114894, 1.774902, 1, 1, 1, 1, 1,
0.6409945, 1.858997, 0.6924238, 1, 1, 1, 1, 1,
0.6419321, -0.1276578, 2.71226, 1, 1, 1, 1, 1,
0.648771, 0.415985, 0.9496388, 1, 1, 1, 1, 1,
0.6510463, -1.314063, 3.404072, 1, 1, 1, 1, 1,
0.6536089, -2.934641, 3.202134, 1, 1, 1, 1, 1,
0.6537487, 1.133366, -0.3191154, 0, 0, 1, 1, 1,
0.6548192, 0.1791053, 1.473975, 1, 0, 0, 1, 1,
0.655128, -0.5244148, 1.75809, 1, 0, 0, 1, 1,
0.6561553, -0.3697436, 2.55196, 1, 0, 0, 1, 1,
0.656669, -0.1699276, 2.102341, 1, 0, 0, 1, 1,
0.6570091, 0.9309599, -0.5700346, 1, 0, 0, 1, 1,
0.6596021, -0.4147143, 2.426053, 0, 0, 0, 1, 1,
0.6619433, 0.04237318, 0.704594, 0, 0, 0, 1, 1,
0.6634806, 0.9516369, 1.622993, 0, 0, 0, 1, 1,
0.6752409, 1.006435, 0.971469, 0, 0, 0, 1, 1,
0.6767015, -0.1576856, 1.270529, 0, 0, 0, 1, 1,
0.6808841, 0.5422376, 0.9626248, 0, 0, 0, 1, 1,
0.6859514, 0.7452483, 0.3542922, 0, 0, 0, 1, 1,
0.6888661, -0.9435045, 2.935947, 1, 1, 1, 1, 1,
0.6910333, -0.5899079, 3.60954, 1, 1, 1, 1, 1,
0.6989477, -0.223299, 1.446965, 1, 1, 1, 1, 1,
0.700223, -0.5501275, 1.548854, 1, 1, 1, 1, 1,
0.7082542, -1.378139, 2.598632, 1, 1, 1, 1, 1,
0.7092278, -0.05377191, 1.71656, 1, 1, 1, 1, 1,
0.7128549, 0.6475958, 1.23589, 1, 1, 1, 1, 1,
0.715385, 0.6321995, 0.4976066, 1, 1, 1, 1, 1,
0.7182252, 1.086704, 0.2757624, 1, 1, 1, 1, 1,
0.7196838, -1.767763, 4.546476, 1, 1, 1, 1, 1,
0.7268037, 0.6373147, 1.985166, 1, 1, 1, 1, 1,
0.7303776, 1.245313, 0.5960757, 1, 1, 1, 1, 1,
0.7355521, -0.5447155, 1.785085, 1, 1, 1, 1, 1,
0.736002, 1.647817, -0.7731739, 1, 1, 1, 1, 1,
0.7364865, 2.107951, -0.9692696, 1, 1, 1, 1, 1,
0.7381177, -0.04420684, 3.45076, 0, 0, 1, 1, 1,
0.744439, 0.08897489, 0.8758736, 1, 0, 0, 1, 1,
0.7453451, -0.1374466, 0.532563, 1, 0, 0, 1, 1,
0.74725, 0.07252775, 0.5217226, 1, 0, 0, 1, 1,
0.7473642, -1.28956, 1.857493, 1, 0, 0, 1, 1,
0.7553664, -1.338695, 3.971737, 1, 0, 0, 1, 1,
0.7561554, 0.2268167, 1.838231, 0, 0, 0, 1, 1,
0.7592815, 0.642198, -0.3225953, 0, 0, 0, 1, 1,
0.7696734, 0.7938737, 2.046789, 0, 0, 0, 1, 1,
0.7715306, -0.8571709, 3.091637, 0, 0, 0, 1, 1,
0.7739276, 1.22801, 0.6307057, 0, 0, 0, 1, 1,
0.7770806, -0.9227462, 2.227698, 0, 0, 0, 1, 1,
0.7812535, 0.2032997, 1.105788, 0, 0, 0, 1, 1,
0.7812971, -0.1956572, 1.338753, 1, 1, 1, 1, 1,
0.7813674, -0.5683867, 2.802096, 1, 1, 1, 1, 1,
0.7833939, 0.6895221, 1.350697, 1, 1, 1, 1, 1,
0.7844003, -0.3512453, 1.687942, 1, 1, 1, 1, 1,
0.7897668, 0.5016435, -0.6131372, 1, 1, 1, 1, 1,
0.7898525, 1.406727, -0.1274959, 1, 1, 1, 1, 1,
0.7900345, -1.81535, 2.158194, 1, 1, 1, 1, 1,
0.7921861, 1.049362, 2.904847, 1, 1, 1, 1, 1,
0.7927, -0.1549522, 2.226137, 1, 1, 1, 1, 1,
0.7965513, -0.4737896, 2.857776, 1, 1, 1, 1, 1,
0.7965522, 0.2540424, 2.354226, 1, 1, 1, 1, 1,
0.7989646, 0.2650717, 0.2697135, 1, 1, 1, 1, 1,
0.8049271, -1.31714, 2.242558, 1, 1, 1, 1, 1,
0.8135537, 0.7604328, 2.614273, 1, 1, 1, 1, 1,
0.8196405, 1.4907, -1.870242, 1, 1, 1, 1, 1,
0.8274871, -0.4371677, 2.081805, 0, 0, 1, 1, 1,
0.8277249, 0.5489693, 1.291601, 1, 0, 0, 1, 1,
0.8280831, -0.8985795, 2.462188, 1, 0, 0, 1, 1,
0.830009, -0.9198939, 2.060101, 1, 0, 0, 1, 1,
0.8328544, 1.226176, 0.1110561, 1, 0, 0, 1, 1,
0.8345947, 0.264492, 1.083502, 1, 0, 0, 1, 1,
0.8375059, -0.3359617, 2.993464, 0, 0, 0, 1, 1,
0.8377601, -1.031906, 3.00011, 0, 0, 0, 1, 1,
0.8378729, 0.561132, -0.2236822, 0, 0, 0, 1, 1,
0.8383965, 0.01145781, 1.843705, 0, 0, 0, 1, 1,
0.8499658, -0.08495528, 2.307134, 0, 0, 0, 1, 1,
0.8548015, -0.01237848, 1.237213, 0, 0, 0, 1, 1,
0.855181, 2.220611, -0.7045811, 0, 0, 0, 1, 1,
0.8624801, 0.05378811, 2.633176, 1, 1, 1, 1, 1,
0.8660973, -1.364454, 3.511328, 1, 1, 1, 1, 1,
0.8685334, 0.8015071, 1.030291, 1, 1, 1, 1, 1,
0.8755723, -0.4063973, 2.662684, 1, 1, 1, 1, 1,
0.882844, 2.074554, 0.810968, 1, 1, 1, 1, 1,
0.8831661, -0.9184549, 2.226573, 1, 1, 1, 1, 1,
0.9013186, 0.8972936, 1.656592, 1, 1, 1, 1, 1,
0.9031383, -0.4141867, 0.4626336, 1, 1, 1, 1, 1,
0.9167592, -0.616931, 1.134586, 1, 1, 1, 1, 1,
0.9180482, 0.5257084, 0.2434116, 1, 1, 1, 1, 1,
0.9278806, 1.214249, 0.4601853, 1, 1, 1, 1, 1,
0.9287887, -0.9663078, 2.344523, 1, 1, 1, 1, 1,
0.929363, 0.8704528, 1.656204, 1, 1, 1, 1, 1,
0.9374011, -0.5717255, 1.061577, 1, 1, 1, 1, 1,
0.9438243, -2.012488, 3.84693, 1, 1, 1, 1, 1,
0.9486911, -0.36443, 2.28752, 0, 0, 1, 1, 1,
0.9498404, -0.1674987, 1.622429, 1, 0, 0, 1, 1,
0.9522125, 1.752497, 0.6821309, 1, 0, 0, 1, 1,
0.9551493, -0.3406395, 2.559066, 1, 0, 0, 1, 1,
0.961931, 1.060876, 1.020963, 1, 0, 0, 1, 1,
0.9692802, 0.836553, -0.01793576, 1, 0, 0, 1, 1,
0.9710818, 1.779929, -0.8912266, 0, 0, 0, 1, 1,
0.9719109, 1.273641, 0.9518148, 0, 0, 0, 1, 1,
0.9981894, -1.152548, 1.641399, 0, 0, 0, 1, 1,
0.9997389, -2.514976, 2.941894, 0, 0, 0, 1, 1,
0.9999245, -0.9466454, 4.372272, 0, 0, 0, 1, 1,
1.002726, -0.3135478, 2.469489, 0, 0, 0, 1, 1,
1.010325, -2.40844, 1.404384, 0, 0, 0, 1, 1,
1.010608, -1.562452, 3.250857, 1, 1, 1, 1, 1,
1.011037, 0.3337621, 1.939784, 1, 1, 1, 1, 1,
1.013299, 0.0003980639, 2.897036, 1, 1, 1, 1, 1,
1.016549, -0.3301691, 0.9541748, 1, 1, 1, 1, 1,
1.017278, 0.6483359, 1.275474, 1, 1, 1, 1, 1,
1.020259, 0.0657222, 0.9319244, 1, 1, 1, 1, 1,
1.026462, 0.1773747, 0.5858774, 1, 1, 1, 1, 1,
1.034412, 1.064471, 1.438772, 1, 1, 1, 1, 1,
1.036561, 0.350411, 1.449993, 1, 1, 1, 1, 1,
1.0367, 0.9303269, -0.3391286, 1, 1, 1, 1, 1,
1.03703, 0.6618233, 0.8575417, 1, 1, 1, 1, 1,
1.056121, 0.3932073, -0.5455016, 1, 1, 1, 1, 1,
1.066061, -1.720374, 2.559427, 1, 1, 1, 1, 1,
1.067702, 0.1228857, 0.4410687, 1, 1, 1, 1, 1,
1.087834, 0.4461166, 1.9012, 1, 1, 1, 1, 1,
1.098473, 0.2570474, 2.000826, 0, 0, 1, 1, 1,
1.099429, -0.1468112, 1.338758, 1, 0, 0, 1, 1,
1.100644, 1.703091, 0.1574121, 1, 0, 0, 1, 1,
1.100935, 0.4099032, 0.9846789, 1, 0, 0, 1, 1,
1.104687, -0.09743959, 1.709837, 1, 0, 0, 1, 1,
1.105357, 0.655535, 1.585546, 1, 0, 0, 1, 1,
1.106388, 0.4915032, 0.9227719, 0, 0, 0, 1, 1,
1.109136, 0.0942408, 0.8615185, 0, 0, 0, 1, 1,
1.119566, -0.6544416, 3.129812, 0, 0, 0, 1, 1,
1.129245, 1.122959, 1.040452, 0, 0, 0, 1, 1,
1.138795, -0.151963, 1.602012, 0, 0, 0, 1, 1,
1.14189, 0.8747524, 0.207115, 0, 0, 0, 1, 1,
1.145977, -1.366729, 2.807832, 0, 0, 0, 1, 1,
1.150203, -0.6939448, 0.6607901, 1, 1, 1, 1, 1,
1.152145, 0.6158581, -0.1464638, 1, 1, 1, 1, 1,
1.162915, -2.326908, 2.315106, 1, 1, 1, 1, 1,
1.163002, 2.042717, 1.954478, 1, 1, 1, 1, 1,
1.165219, 1.563351, 2.359196, 1, 1, 1, 1, 1,
1.165974, -0.780638, 1.512776, 1, 1, 1, 1, 1,
1.168431, -0.3994139, 1.907672, 1, 1, 1, 1, 1,
1.183048, -0.4097153, 3.6579, 1, 1, 1, 1, 1,
1.18818, 0.3973193, 0.2235112, 1, 1, 1, 1, 1,
1.189607, 0.8639824, 1.143348, 1, 1, 1, 1, 1,
1.194477, -0.3152138, 2.405504, 1, 1, 1, 1, 1,
1.195248, 0.03422458, 3.523616, 1, 1, 1, 1, 1,
1.196349, 0.49727, 1.025664, 1, 1, 1, 1, 1,
1.220294, -0.2518359, 0.9773461, 1, 1, 1, 1, 1,
1.223155, 0.3285228, 0.8128828, 1, 1, 1, 1, 1,
1.234594, 0.1535407, 0.8446192, 0, 0, 1, 1, 1,
1.236325, 0.9664047, 0.8901271, 1, 0, 0, 1, 1,
1.240685, 2.817876, -0.5946591, 1, 0, 0, 1, 1,
1.248027, 0.2219135, 1.679272, 1, 0, 0, 1, 1,
1.26845, 0.9351236, 0.4636174, 1, 0, 0, 1, 1,
1.268729, -0.04408438, 0.2123839, 1, 0, 0, 1, 1,
1.270079, -0.58996, 1.400431, 0, 0, 0, 1, 1,
1.273213, -0.392508, 1.802751, 0, 0, 0, 1, 1,
1.281097, 1.369507, 0.3480394, 0, 0, 0, 1, 1,
1.281283, -0.9114913, 2.07599, 0, 0, 0, 1, 1,
1.283589, 1.021816, 1.418653, 0, 0, 0, 1, 1,
1.289323, -0.4286715, 2.274363, 0, 0, 0, 1, 1,
1.298933, -1.283086, 1.463243, 0, 0, 0, 1, 1,
1.309388, -0.1302987, 2.653844, 1, 1, 1, 1, 1,
1.310762, -1.297831, 3.295683, 1, 1, 1, 1, 1,
1.312362, -1.051669, 2.402848, 1, 1, 1, 1, 1,
1.312765, 0.004673741, 1.050312, 1, 1, 1, 1, 1,
1.313692, -0.1479996, 1.390447, 1, 1, 1, 1, 1,
1.338278, 1.34588, -0.7153227, 1, 1, 1, 1, 1,
1.344838, -0.5861729, 1.801817, 1, 1, 1, 1, 1,
1.357249, 0.1558062, -0.5678908, 1, 1, 1, 1, 1,
1.359336, 1.415972, -0.5692869, 1, 1, 1, 1, 1,
1.360083, -1.143168, 3.054062, 1, 1, 1, 1, 1,
1.366901, 1.225625, -0.2514648, 1, 1, 1, 1, 1,
1.36718, 1.736887, 1.297439, 1, 1, 1, 1, 1,
1.374238, -0.6473838, 1.745997, 1, 1, 1, 1, 1,
1.390426, -0.1655931, 3.182981, 1, 1, 1, 1, 1,
1.429337, -0.1276415, 2.141443, 1, 1, 1, 1, 1,
1.436461, 0.9640308, -0.8499933, 0, 0, 1, 1, 1,
1.446092, 0.895649, 2.615508, 1, 0, 0, 1, 1,
1.457671, -0.4239745, 2.144859, 1, 0, 0, 1, 1,
1.459858, -0.1901767, 2.460621, 1, 0, 0, 1, 1,
1.475523, 0.7996542, 1.229608, 1, 0, 0, 1, 1,
1.477916, 0.2902826, 1.755942, 1, 0, 0, 1, 1,
1.48026, -1.071849, 2.060993, 0, 0, 0, 1, 1,
1.484771, -1.010722, 2.182592, 0, 0, 0, 1, 1,
1.498911, -0.3411749, 2.331425, 0, 0, 0, 1, 1,
1.502918, 1.064166, 1.475061, 0, 0, 0, 1, 1,
1.514063, 1.078426, -0.7875574, 0, 0, 0, 1, 1,
1.518387, -0.7911913, 1.736107, 0, 0, 0, 1, 1,
1.525196, 0.3852511, 0.8265624, 0, 0, 0, 1, 1,
1.528105, -1.628093, 4.091439, 1, 1, 1, 1, 1,
1.537167, -0.1064529, 1.945009, 1, 1, 1, 1, 1,
1.550186, 0.2399338, 0.9546005, 1, 1, 1, 1, 1,
1.551493, 2.035879, 1.662678, 1, 1, 1, 1, 1,
1.559016, 1.98596, 1.494273, 1, 1, 1, 1, 1,
1.579391, 0.1005272, 2.678475, 1, 1, 1, 1, 1,
1.603348, -0.2394466, 1.832727, 1, 1, 1, 1, 1,
1.606814, 1.518895, -0.9045112, 1, 1, 1, 1, 1,
1.618302, -0.8483413, 0.8286059, 1, 1, 1, 1, 1,
1.628958, -0.9972998, 0.9621047, 1, 1, 1, 1, 1,
1.633621, -0.5245093, 2.018271, 1, 1, 1, 1, 1,
1.655212, 1.850524, 1.762746, 1, 1, 1, 1, 1,
1.673876, 0.1894453, 1.951152, 1, 1, 1, 1, 1,
1.683296, 1.870925, 0.6732155, 1, 1, 1, 1, 1,
1.689657, -0.8042579, 3.411135, 1, 1, 1, 1, 1,
1.691112, -1.017127, 0.5407101, 0, 0, 1, 1, 1,
1.697164, 2.44775, 0.2438381, 1, 0, 0, 1, 1,
1.703892, 1.054132, 1.469918, 1, 0, 0, 1, 1,
1.705842, -2.086177, 2.885727, 1, 0, 0, 1, 1,
1.712829, -0.2072238, 1.511462, 1, 0, 0, 1, 1,
1.738418, -1.429625, 1.325562, 1, 0, 0, 1, 1,
1.752224, -0.4138263, 1.592008, 0, 0, 0, 1, 1,
1.755167, 0.5771115, -0.4596291, 0, 0, 0, 1, 1,
1.768285, 0.04822321, 2.024704, 0, 0, 0, 1, 1,
1.78649, 1.276553, 0.6905141, 0, 0, 0, 1, 1,
1.802489, 2.98052, -0.9175176, 0, 0, 0, 1, 1,
1.813901, 0.6996444, 1.078057, 0, 0, 0, 1, 1,
1.818419, 0.5937979, 1.661667, 0, 0, 0, 1, 1,
1.823426, -0.7643053, 1.359281, 1, 1, 1, 1, 1,
1.832052, -0.4269335, 3.101715, 1, 1, 1, 1, 1,
1.835884, 0.3342707, 0.8090212, 1, 1, 1, 1, 1,
1.837306, 0.3123997, 0.8263095, 1, 1, 1, 1, 1,
1.854164, -0.4106627, 1.612393, 1, 1, 1, 1, 1,
1.883263, 1.246934, 0.2847302, 1, 1, 1, 1, 1,
1.887876, -0.9416922, 0.6690136, 1, 1, 1, 1, 1,
1.91117, -1.462913, 2.829725, 1, 1, 1, 1, 1,
1.920798, -0.1797843, 2.534758, 1, 1, 1, 1, 1,
1.923381, -0.06889804, 2.327718, 1, 1, 1, 1, 1,
1.93697, -0.1013463, 1.97544, 1, 1, 1, 1, 1,
1.960534, -0.3821059, 2.475509, 1, 1, 1, 1, 1,
1.988479, 1.020155, 1.814458, 1, 1, 1, 1, 1,
1.993805, -0.05350618, 1.812823, 1, 1, 1, 1, 1,
2.00079, 0.8523006, 2.000643, 1, 1, 1, 1, 1,
2.00828, -1.356104, 0.4881749, 0, 0, 1, 1, 1,
2.073666, 1.131347, 1.614744, 1, 0, 0, 1, 1,
2.076854, -0.9357697, 2.154576, 1, 0, 0, 1, 1,
2.083201, -0.007071919, 0.5759571, 1, 0, 0, 1, 1,
2.12937, -0.9725589, 0.4795527, 1, 0, 0, 1, 1,
2.137809, 2.731394, 0.6186115, 1, 0, 0, 1, 1,
2.165441, 1.44915, 1.379495, 0, 0, 0, 1, 1,
2.167039, -0.1269521, 2.52603, 0, 0, 0, 1, 1,
2.17817, -0.5779067, 0.6550389, 0, 0, 0, 1, 1,
2.270834, -1.46511, 3.465469, 0, 0, 0, 1, 1,
2.295323, -0.1750229, 0.5006317, 0, 0, 0, 1, 1,
2.30421, -1.964486, 3.107335, 0, 0, 0, 1, 1,
2.3281, 0.1734153, 1.2967, 0, 0, 0, 1, 1,
2.340356, -1.987248, 2.226611, 1, 1, 1, 1, 1,
2.424461, 1.77442, 1.872616, 1, 1, 1, 1, 1,
2.467982, 0.5004917, 1.624002, 1, 1, 1, 1, 1,
2.500242, -0.4585984, 2.112333, 1, 1, 1, 1, 1,
2.562749, -1.593158, 2.632687, 1, 1, 1, 1, 1,
2.824326, -0.5213082, 1.888366, 1, 1, 1, 1, 1,
3.184312, 0.2293963, 3.322422, 1, 1, 1, 1, 1
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
var radius = 9.211599;
var distance = 32.35535;
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
mvMatrix.translate( 0.05722451, -0.08163834, 0.276216 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.35535);
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
