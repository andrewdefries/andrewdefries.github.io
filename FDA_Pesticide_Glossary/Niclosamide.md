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
-2.998348, 0.4017588, -2.838818, 1, 0, 0, 1,
-2.961576, -1.280216, -1.744327, 1, 0.007843138, 0, 1,
-2.947078, 1.762992, -1.222114, 1, 0.01176471, 0, 1,
-2.656616, 0.7214826, 0.6786424, 1, 0.01960784, 0, 1,
-2.555202, 1.296778, -1.659025, 1, 0.02352941, 0, 1,
-2.491896, -0.4155109, -1.712457, 1, 0.03137255, 0, 1,
-2.445255, -0.4285688, -2.277297, 1, 0.03529412, 0, 1,
-2.439076, 0.6086426, -0.7930585, 1, 0.04313726, 0, 1,
-2.405586, -2.229047, -2.875982, 1, 0.04705882, 0, 1,
-2.391829, -0.310384, -3.483761, 1, 0.05490196, 0, 1,
-2.287074, -0.4087481, 0.6441551, 1, 0.05882353, 0, 1,
-2.256276, 0.3826025, -2.547641, 1, 0.06666667, 0, 1,
-2.238081, -2.02463, -1.351044, 1, 0.07058824, 0, 1,
-2.212484, -0.605487, -1.712019, 1, 0.07843138, 0, 1,
-2.20596, 0.7131268, -1.088211, 1, 0.08235294, 0, 1,
-2.156331, 0.2864371, -2.983768, 1, 0.09019608, 0, 1,
-2.14864, -0.6756321, -1.487801, 1, 0.09411765, 0, 1,
-2.1413, -0.2365119, -0.6320367, 1, 0.1019608, 0, 1,
-2.087209, 0.4438139, -0.5080745, 1, 0.1098039, 0, 1,
-2.075575, -0.2961599, -0.5795867, 1, 0.1137255, 0, 1,
-2.071199, -0.5718638, -1.224146, 1, 0.1215686, 0, 1,
-2.020561, -1.385897, -0.3360687, 1, 0.1254902, 0, 1,
-2.008598, 0.6398434, -1.853476, 1, 0.1333333, 0, 1,
-1.962534, -1.210497, 0.3389474, 1, 0.1372549, 0, 1,
-1.94598, 0.1387753, -1.268134, 1, 0.145098, 0, 1,
-1.94318, 1.590385, -0.7864701, 1, 0.1490196, 0, 1,
-1.903047, 0.00647007, -1.370588, 1, 0.1568628, 0, 1,
-1.901896, 0.5038143, -3.302509, 1, 0.1607843, 0, 1,
-1.877343, 0.7243041, -1.408926, 1, 0.1686275, 0, 1,
-1.849039, 0.03905881, -2.52799, 1, 0.172549, 0, 1,
-1.827686, -0.8017642, -2.967672, 1, 0.1803922, 0, 1,
-1.821754, -0.2326999, -2.960689, 1, 0.1843137, 0, 1,
-1.818828, 1.924396, -0.9910445, 1, 0.1921569, 0, 1,
-1.812689, 1.784401, -0.4866005, 1, 0.1960784, 0, 1,
-1.796841, 0.6065136, -1.437405, 1, 0.2039216, 0, 1,
-1.791864, 0.01315695, -1.258372, 1, 0.2117647, 0, 1,
-1.79086, 0.3021537, -2.757692, 1, 0.2156863, 0, 1,
-1.784188, -2.643325, -1.8401, 1, 0.2235294, 0, 1,
-1.77378, 0.2420061, -1.569086, 1, 0.227451, 0, 1,
-1.768907, -1.773032, -1.259433, 1, 0.2352941, 0, 1,
-1.738184, 0.9909725, -0.4974056, 1, 0.2392157, 0, 1,
-1.730232, -1.942314, -2.51094, 1, 0.2470588, 0, 1,
-1.704045, -1.390189, -3.878894, 1, 0.2509804, 0, 1,
-1.657053, 0.2608094, -1.216985, 1, 0.2588235, 0, 1,
-1.649687, -0.3672802, -1.296744, 1, 0.2627451, 0, 1,
-1.642149, -1.687595, -3.407326, 1, 0.2705882, 0, 1,
-1.631644, -0.5557819, -0.05918011, 1, 0.2745098, 0, 1,
-1.602901, -1.167332, -1.841143, 1, 0.282353, 0, 1,
-1.588844, 0.2724037, -1.182694, 1, 0.2862745, 0, 1,
-1.580182, 0.02855125, -1.789128, 1, 0.2941177, 0, 1,
-1.56776, 0.3515759, -2.031139, 1, 0.3019608, 0, 1,
-1.565779, -0.2707117, -1.734634, 1, 0.3058824, 0, 1,
-1.552103, 0.9021647, 2.005203, 1, 0.3137255, 0, 1,
-1.542331, -0.3726733, -0.6668056, 1, 0.3176471, 0, 1,
-1.536882, 2.125865, 1.587018, 1, 0.3254902, 0, 1,
-1.531518, -1.225817, -2.628014, 1, 0.3294118, 0, 1,
-1.517455, 0.9447162, -0.3371152, 1, 0.3372549, 0, 1,
-1.517428, 2.562325, -0.8880367, 1, 0.3411765, 0, 1,
-1.49789, -1.018565, -2.843416, 1, 0.3490196, 0, 1,
-1.492433, -1.358582, -2.23345, 1, 0.3529412, 0, 1,
-1.490873, -1.020972, -2.614756, 1, 0.3607843, 0, 1,
-1.480675, -1.559467, -2.298029, 1, 0.3647059, 0, 1,
-1.476847, 1.049979, -0.9214087, 1, 0.372549, 0, 1,
-1.474672, 0.5207221, -2.011583, 1, 0.3764706, 0, 1,
-1.468737, -0.6724359, -2.763697, 1, 0.3843137, 0, 1,
-1.468328, 0.339857, -0.3295686, 1, 0.3882353, 0, 1,
-1.465896, -0.8423116, -2.626522, 1, 0.3960784, 0, 1,
-1.450807, -1.283779, -1.901723, 1, 0.4039216, 0, 1,
-1.447934, 0.1566429, -1.027443, 1, 0.4078431, 0, 1,
-1.431707, 1.302979, -0.8263879, 1, 0.4156863, 0, 1,
-1.420919, 1.079103, 0.3202801, 1, 0.4196078, 0, 1,
-1.41658, 0.6170666, -3.273027, 1, 0.427451, 0, 1,
-1.412771, 2.061032, -2.292416, 1, 0.4313726, 0, 1,
-1.403569, 1.193711, -1.227273, 1, 0.4392157, 0, 1,
-1.402808, 1.170297, -2.34388, 1, 0.4431373, 0, 1,
-1.393107, -0.5384733, -0.8994709, 1, 0.4509804, 0, 1,
-1.390809, 1.035887, -0.8851848, 1, 0.454902, 0, 1,
-1.385128, -0.03201816, -1.042822, 1, 0.4627451, 0, 1,
-1.384963, 0.0861506, -2.358868, 1, 0.4666667, 0, 1,
-1.377811, 0.5043952, -0.6720812, 1, 0.4745098, 0, 1,
-1.374568, 0.3305797, -0.2725733, 1, 0.4784314, 0, 1,
-1.365581, -1.12233, -0.8487254, 1, 0.4862745, 0, 1,
-1.349418, -0.6676342, -1.906337, 1, 0.4901961, 0, 1,
-1.346887, 0.3200321, -1.816796, 1, 0.4980392, 0, 1,
-1.339555, -0.2979484, -0.9114625, 1, 0.5058824, 0, 1,
-1.339126, 0.3807489, 1.233091, 1, 0.509804, 0, 1,
-1.332424, 1.225387, -1.503888, 1, 0.5176471, 0, 1,
-1.325457, 0.9400029, -0.6896652, 1, 0.5215687, 0, 1,
-1.322359, 0.9696996, -0.315171, 1, 0.5294118, 0, 1,
-1.314897, 1.206135, -0.7602733, 1, 0.5333334, 0, 1,
-1.30624, 0.02269924, -1.065157, 1, 0.5411765, 0, 1,
-1.302417, 2.396706, -0.4651265, 1, 0.5450981, 0, 1,
-1.292654, 1.815847, -0.934177, 1, 0.5529412, 0, 1,
-1.287456, -0.515395, -1.470798, 1, 0.5568628, 0, 1,
-1.277169, 0.6253668, -2.52492, 1, 0.5647059, 0, 1,
-1.262899, -0.6366509, -2.107697, 1, 0.5686275, 0, 1,
-1.261216, -0.8044961, -2.478091, 1, 0.5764706, 0, 1,
-1.256551, -0.213381, -4.34278, 1, 0.5803922, 0, 1,
-1.254518, -0.9207655, -4.202495, 1, 0.5882353, 0, 1,
-1.244995, 1.746441, 0.01863758, 1, 0.5921569, 0, 1,
-1.240699, 0.7260996, -0.8260227, 1, 0.6, 0, 1,
-1.239687, -0.4675, -1.746108, 1, 0.6078432, 0, 1,
-1.237871, -0.2453142, -1.748301, 1, 0.6117647, 0, 1,
-1.237108, 1.139272, -0.9123136, 1, 0.6196079, 0, 1,
-1.236001, -0.7710649, -2.310667, 1, 0.6235294, 0, 1,
-1.230934, -1.157955, -3.211345, 1, 0.6313726, 0, 1,
-1.226092, 0.520748, -4.428538, 1, 0.6352941, 0, 1,
-1.225714, -0.2337736, -0.05723637, 1, 0.6431373, 0, 1,
-1.222578, -0.05986981, -1.128981, 1, 0.6470588, 0, 1,
-1.206432, 1.642287, -0.2972609, 1, 0.654902, 0, 1,
-1.205933, -0.2377985, -1.233594, 1, 0.6588235, 0, 1,
-1.20034, -0.2072795, -3.575424, 1, 0.6666667, 0, 1,
-1.198565, -0.3019096, -1.365432, 1, 0.6705883, 0, 1,
-1.196823, -0.5788714, -0.6218151, 1, 0.6784314, 0, 1,
-1.195276, 0.9167147, 0.1480048, 1, 0.682353, 0, 1,
-1.194869, -0.4981271, -0.6216105, 1, 0.6901961, 0, 1,
-1.189558, -0.7336114, -1.739851, 1, 0.6941177, 0, 1,
-1.18695, 0.2478368, -1.556618, 1, 0.7019608, 0, 1,
-1.183854, 0.238709, -3.276589, 1, 0.7098039, 0, 1,
-1.171101, -0.7952384, -1.971843, 1, 0.7137255, 0, 1,
-1.162696, -0.5809141, -1.494036, 1, 0.7215686, 0, 1,
-1.158245, 0.4334147, -1.886339, 1, 0.7254902, 0, 1,
-1.156709, 0.004458271, -2.836563, 1, 0.7333333, 0, 1,
-1.154517, -1.080871, -3.112813, 1, 0.7372549, 0, 1,
-1.152867, 0.5478329, -2.153331, 1, 0.7450981, 0, 1,
-1.150654, -0.1811117, -0.5450759, 1, 0.7490196, 0, 1,
-1.143416, -1.070462, -3.799034, 1, 0.7568628, 0, 1,
-1.143251, 1.122465, -0.5214797, 1, 0.7607843, 0, 1,
-1.140768, 0.9887506, -1.512755, 1, 0.7686275, 0, 1,
-1.131914, 0.8431501, -1.504595, 1, 0.772549, 0, 1,
-1.130336, -1.230172, -2.527032, 1, 0.7803922, 0, 1,
-1.129752, -0.0405674, 1.13036, 1, 0.7843137, 0, 1,
-1.128613, -0.7969455, -2.601871, 1, 0.7921569, 0, 1,
-1.127186, -0.07242365, -0.3938037, 1, 0.7960784, 0, 1,
-1.126571, 0.06402788, -2.005052, 1, 0.8039216, 0, 1,
-1.12446, -1.202803, -1.752842, 1, 0.8117647, 0, 1,
-1.121584, -0.7783231, -2.880729, 1, 0.8156863, 0, 1,
-1.117682, -0.9687547, -3.103941, 1, 0.8235294, 0, 1,
-1.114192, -0.4792138, -1.792719, 1, 0.827451, 0, 1,
-1.088943, -0.2727365, -0.225973, 1, 0.8352941, 0, 1,
-1.08837, -0.5072723, -2.542604, 1, 0.8392157, 0, 1,
-1.088207, -0.4702426, -2.446163, 1, 0.8470588, 0, 1,
-1.085222, -0.8510686, -3.149405, 1, 0.8509804, 0, 1,
-1.071045, -0.3788559, -1.655286, 1, 0.8588235, 0, 1,
-1.070175, -1.495127, -2.148686, 1, 0.8627451, 0, 1,
-1.069164, 1.28161, -0.8273512, 1, 0.8705882, 0, 1,
-1.063221, 0.8894494, -1.248556, 1, 0.8745098, 0, 1,
-1.059667, -0.7781798, -0.766162, 1, 0.8823529, 0, 1,
-1.057844, 0.4643289, -2.42874, 1, 0.8862745, 0, 1,
-1.056073, 2.618825, 0.5370129, 1, 0.8941177, 0, 1,
-1.049774, -0.234801, -0.2055379, 1, 0.8980392, 0, 1,
-1.047076, 0.1100321, -1.23591, 1, 0.9058824, 0, 1,
-1.046562, 1.743262, 1.75495, 1, 0.9137255, 0, 1,
-1.039918, 1.823537, -0.7435306, 1, 0.9176471, 0, 1,
-1.035199, 0.2194465, -0.2101877, 1, 0.9254902, 0, 1,
-1.033856, -0.3690109, -2.33821, 1, 0.9294118, 0, 1,
-1.032849, -1.252975, -1.464799, 1, 0.9372549, 0, 1,
-1.032801, 1.455085, 0.9117103, 1, 0.9411765, 0, 1,
-1.031158, -0.691415, -2.773977, 1, 0.9490196, 0, 1,
-1.021319, -1.882192, -3.90937, 1, 0.9529412, 0, 1,
-1.011741, 0.8662007, -0.3763455, 1, 0.9607843, 0, 1,
-1.006541, 0.01560212, -2.07636, 1, 0.9647059, 0, 1,
-0.9953353, 0.07428647, -2.232086, 1, 0.972549, 0, 1,
-0.9952084, 1.390548, -0.9187672, 1, 0.9764706, 0, 1,
-0.9886252, -0.5926365, -0.5949144, 1, 0.9843137, 0, 1,
-0.9869088, 0.2205145, -1.202498, 1, 0.9882353, 0, 1,
-0.9830842, 0.8605134, -0.5974773, 1, 0.9960784, 0, 1,
-0.9809695, 0.1463641, -1.461086, 0.9960784, 1, 0, 1,
-0.9716505, -0.0590514, -3.129102, 0.9921569, 1, 0, 1,
-0.9642261, -0.2585269, -3.05921, 0.9843137, 1, 0, 1,
-0.9634038, 0.3780441, -0.6541499, 0.9803922, 1, 0, 1,
-0.9599162, -0.6143206, -2.518708, 0.972549, 1, 0, 1,
-0.9574682, 0.5969533, 0.007628003, 0.9686275, 1, 0, 1,
-0.9553061, 0.7054826, 1.184849, 0.9607843, 1, 0, 1,
-0.953073, -0.6295334, -1.687627, 0.9568627, 1, 0, 1,
-0.9483356, 0.2526979, -1.339382, 0.9490196, 1, 0, 1,
-0.9409027, 0.3499062, 0.6786499, 0.945098, 1, 0, 1,
-0.9368955, -2.001862, -2.134232, 0.9372549, 1, 0, 1,
-0.9364746, -1.230209, -3.317682, 0.9333333, 1, 0, 1,
-0.9360172, -0.1780956, -2.588272, 0.9254902, 1, 0, 1,
-0.9310324, -1.424117, -3.383629, 0.9215686, 1, 0, 1,
-0.9128196, -0.1702355, -1.298632, 0.9137255, 1, 0, 1,
-0.8991103, -1.65522, -2.409352, 0.9098039, 1, 0, 1,
-0.8973227, 0.5539661, -2.593975, 0.9019608, 1, 0, 1,
-0.8950227, 0.301434, -2.571759, 0.8941177, 1, 0, 1,
-0.8851366, 0.5594763, 0.7578135, 0.8901961, 1, 0, 1,
-0.8847826, 0.2771167, -0.1715273, 0.8823529, 1, 0, 1,
-0.8762748, 0.1696278, -2.244903, 0.8784314, 1, 0, 1,
-0.8699549, 2.809358, -0.6395257, 0.8705882, 1, 0, 1,
-0.8639005, -1.539366, -2.050442, 0.8666667, 1, 0, 1,
-0.8603951, -0.3146649, -1.335128, 0.8588235, 1, 0, 1,
-0.8521142, 1.977325, -2.623574, 0.854902, 1, 0, 1,
-0.8520321, 0.3707307, -3.354674, 0.8470588, 1, 0, 1,
-0.8485032, -1.934533, -4.249238, 0.8431373, 1, 0, 1,
-0.8478523, 0.1665893, -2.409661, 0.8352941, 1, 0, 1,
-0.8473266, -0.3929247, -1.217685, 0.8313726, 1, 0, 1,
-0.847106, 0.2321291, -2.661354, 0.8235294, 1, 0, 1,
-0.8464261, 0.8489844, -0.3056205, 0.8196079, 1, 0, 1,
-0.8445915, -1.278442, -1.748013, 0.8117647, 1, 0, 1,
-0.8280613, -2.326374, -1.480259, 0.8078431, 1, 0, 1,
-0.823275, 0.3974327, -1.555633, 0.8, 1, 0, 1,
-0.8161516, -0.02072963, -2.791357, 0.7921569, 1, 0, 1,
-0.8148575, 1.532142, 0.6564906, 0.7882353, 1, 0, 1,
-0.8129377, 0.529812, -0.2835448, 0.7803922, 1, 0, 1,
-0.8100643, -0.9527411, -2.197214, 0.7764706, 1, 0, 1,
-0.8096003, -0.8926532, -3.453086, 0.7686275, 1, 0, 1,
-0.8061188, -1.291723, -2.525551, 0.7647059, 1, 0, 1,
-0.8043266, 2.131624, -1.572884, 0.7568628, 1, 0, 1,
-0.7986423, -0.7250527, -3.570917, 0.7529412, 1, 0, 1,
-0.7968385, 1.025416, 0.4293963, 0.7450981, 1, 0, 1,
-0.7940527, -0.7296391, -1.590559, 0.7411765, 1, 0, 1,
-0.7873029, -1.562265, -0.9250078, 0.7333333, 1, 0, 1,
-0.7816442, -0.4353397, -1.20384, 0.7294118, 1, 0, 1,
-0.7735171, -0.2475553, -0.1375517, 0.7215686, 1, 0, 1,
-0.7732248, 1.182657, -0.7841275, 0.7176471, 1, 0, 1,
-0.7703314, 0.4436139, -2.311882, 0.7098039, 1, 0, 1,
-0.7584433, 1.988431, -2.14668, 0.7058824, 1, 0, 1,
-0.7435723, 0.9780157, -0.5993937, 0.6980392, 1, 0, 1,
-0.7426214, -0.4292659, -3.470679, 0.6901961, 1, 0, 1,
-0.7334797, -0.7267195, -3.087357, 0.6862745, 1, 0, 1,
-0.7304552, -1.271845, -2.865887, 0.6784314, 1, 0, 1,
-0.7303134, -0.3873217, -1.235969, 0.6745098, 1, 0, 1,
-0.725758, 1.20582, -0.6025705, 0.6666667, 1, 0, 1,
-0.7252089, -2.441569, -2.91213, 0.6627451, 1, 0, 1,
-0.7182599, -0.8545292, -1.427713, 0.654902, 1, 0, 1,
-0.7175707, -0.4196682, -4.021292, 0.6509804, 1, 0, 1,
-0.7154258, 0.257636, -2.096486, 0.6431373, 1, 0, 1,
-0.711454, -0.712755, -3.021366, 0.6392157, 1, 0, 1,
-0.7107426, 1.383831, -0.5640678, 0.6313726, 1, 0, 1,
-0.70945, 1.709779, -1.76303, 0.627451, 1, 0, 1,
-0.7027311, 0.01252401, -0.6002443, 0.6196079, 1, 0, 1,
-0.6948724, -1.490307, -3.351082, 0.6156863, 1, 0, 1,
-0.6933393, 0.5659065, -1.909836, 0.6078432, 1, 0, 1,
-0.6932771, -0.8509032, -3.584733, 0.6039216, 1, 0, 1,
-0.6931702, -0.5611982, -2.619192, 0.5960785, 1, 0, 1,
-0.6855141, 0.6330544, 0.08978975, 0.5882353, 1, 0, 1,
-0.6832643, 1.150572, -1.130248, 0.5843138, 1, 0, 1,
-0.6824461, -0.2346182, -2.176065, 0.5764706, 1, 0, 1,
-0.674266, -1.80501, -3.853384, 0.572549, 1, 0, 1,
-0.6742046, -0.3782186, -2.799753, 0.5647059, 1, 0, 1,
-0.6733903, -0.07295521, -1.998846, 0.5607843, 1, 0, 1,
-0.6727682, -1.613861, -3.571713, 0.5529412, 1, 0, 1,
-0.6701544, -1.251228, -0.9584598, 0.5490196, 1, 0, 1,
-0.6700232, -1.322565, -2.020434, 0.5411765, 1, 0, 1,
-0.6668565, 0.2815487, -0.6598683, 0.5372549, 1, 0, 1,
-0.6632963, -0.7246829, -5.801378, 0.5294118, 1, 0, 1,
-0.6623273, 0.9716251, -2.781791, 0.5254902, 1, 0, 1,
-0.6593181, 0.03383797, -1.693256, 0.5176471, 1, 0, 1,
-0.6581446, -0.830391, -2.892915, 0.5137255, 1, 0, 1,
-0.6501899, 0.9115423, -0.4856164, 0.5058824, 1, 0, 1,
-0.6490149, 0.04742412, -1.648628, 0.5019608, 1, 0, 1,
-0.6471668, -0.756391, -2.006416, 0.4941176, 1, 0, 1,
-0.6458888, 1.400086, 0.0788942, 0.4862745, 1, 0, 1,
-0.639085, -0.8061112, -3.938797, 0.4823529, 1, 0, 1,
-0.6387197, 0.6038333, -0.9812719, 0.4745098, 1, 0, 1,
-0.6386549, -0.7044983, -2.860284, 0.4705882, 1, 0, 1,
-0.6339896, 0.2264397, -1.283391, 0.4627451, 1, 0, 1,
-0.6307778, 1.259403, -1.235722, 0.4588235, 1, 0, 1,
-0.6244275, -0.9989898, -3.327079, 0.4509804, 1, 0, 1,
-0.6203445, -1.724658, -3.582282, 0.4470588, 1, 0, 1,
-0.6172196, 0.5012656, -2.510005, 0.4392157, 1, 0, 1,
-0.6139975, 2.132646, -1.839816, 0.4352941, 1, 0, 1,
-0.6076459, 0.6889693, 0.3905892, 0.427451, 1, 0, 1,
-0.6056472, 1.608017, -1.442586, 0.4235294, 1, 0, 1,
-0.6045011, -0.3281665, -2.61661, 0.4156863, 1, 0, 1,
-0.6037472, 0.7764902, -0.1132808, 0.4117647, 1, 0, 1,
-0.6004152, 1.63053, -1.143641, 0.4039216, 1, 0, 1,
-0.5952826, 2.175204, -1.475289, 0.3960784, 1, 0, 1,
-0.5938859, -1.328962, -4.070622, 0.3921569, 1, 0, 1,
-0.5910304, -0.113632, -1.412615, 0.3843137, 1, 0, 1,
-0.5878413, -0.09428681, 0.5430676, 0.3803922, 1, 0, 1,
-0.5875719, 0.3707135, -0.5444628, 0.372549, 1, 0, 1,
-0.5862875, -1.150396, -3.291602, 0.3686275, 1, 0, 1,
-0.5862128, 1.174405, -0.3015102, 0.3607843, 1, 0, 1,
-0.571245, 0.5623777, -2.286177, 0.3568628, 1, 0, 1,
-0.5709282, -0.3364658, -2.184242, 0.3490196, 1, 0, 1,
-0.5678045, 0.8695419, -1.252019, 0.345098, 1, 0, 1,
-0.5644397, 0.3038531, 0.3828407, 0.3372549, 1, 0, 1,
-0.5621769, -2.016972, -3.214574, 0.3333333, 1, 0, 1,
-0.5569376, -1.895946, -1.3705, 0.3254902, 1, 0, 1,
-0.5542254, 0.7108393, 0.03269696, 0.3215686, 1, 0, 1,
-0.5490997, 0.3783245, -1.556544, 0.3137255, 1, 0, 1,
-0.5447504, 1.648974, -0.4817737, 0.3098039, 1, 0, 1,
-0.538845, -1.386531, -2.068784, 0.3019608, 1, 0, 1,
-0.5367646, 0.156799, -1.164545, 0.2941177, 1, 0, 1,
-0.5344915, -0.6650085, -2.365461, 0.2901961, 1, 0, 1,
-0.5326956, -0.06585692, -1.66715, 0.282353, 1, 0, 1,
-0.5319057, -1.09689, -3.43261, 0.2784314, 1, 0, 1,
-0.5312758, 0.4727029, -1.918797, 0.2705882, 1, 0, 1,
-0.5275205, 0.2026955, -0.5462772, 0.2666667, 1, 0, 1,
-0.5271385, 1.900246, -0.6462932, 0.2588235, 1, 0, 1,
-0.5187024, -0.9644633, -2.149373, 0.254902, 1, 0, 1,
-0.5183167, -0.05595728, -0.3687005, 0.2470588, 1, 0, 1,
-0.5134794, 0.07851157, -2.132254, 0.2431373, 1, 0, 1,
-0.5081924, -1.495166, -2.212142, 0.2352941, 1, 0, 1,
-0.5079598, 0.3426927, -0.6315012, 0.2313726, 1, 0, 1,
-0.5064985, 1.229998, -0.3532948, 0.2235294, 1, 0, 1,
-0.5036454, 0.6724128, 0.9483783, 0.2196078, 1, 0, 1,
-0.4995466, 0.8248808, -0.381965, 0.2117647, 1, 0, 1,
-0.4976496, 0.8004804, -0.007173369, 0.2078431, 1, 0, 1,
-0.4965857, 0.197943, -0.6162514, 0.2, 1, 0, 1,
-0.4958292, 1.308763, 0.8609581, 0.1921569, 1, 0, 1,
-0.4952525, 1.896963, 0.8510072, 0.1882353, 1, 0, 1,
-0.4940657, 0.07676411, -2.275214, 0.1803922, 1, 0, 1,
-0.4931535, 0.3275938, -1.166961, 0.1764706, 1, 0, 1,
-0.4828759, 1.465781, -2.72082, 0.1686275, 1, 0, 1,
-0.481693, 0.263921, -0.2629502, 0.1647059, 1, 0, 1,
-0.4758329, -0.3951607, -0.9600528, 0.1568628, 1, 0, 1,
-0.4669451, 0.09405328, -1.814516, 0.1529412, 1, 0, 1,
-0.4659299, 1.165443, -0.05202122, 0.145098, 1, 0, 1,
-0.4638942, 2.875659, -0.1089757, 0.1411765, 1, 0, 1,
-0.4635457, -0.8271417, -3.380771, 0.1333333, 1, 0, 1,
-0.4507432, 1.783502, 1.104164, 0.1294118, 1, 0, 1,
-0.4507157, -0.4290908, -2.907684, 0.1215686, 1, 0, 1,
-0.450038, -0.4859456, -3.561884, 0.1176471, 1, 0, 1,
-0.4487974, -0.6637062, -1.872578, 0.1098039, 1, 0, 1,
-0.4478467, 1.105664, -1.706996, 0.1058824, 1, 0, 1,
-0.4465974, -0.5541463, -2.647952, 0.09803922, 1, 0, 1,
-0.4440022, -0.8416306, -2.166121, 0.09019608, 1, 0, 1,
-0.4362999, 0.742036, 0.4106602, 0.08627451, 1, 0, 1,
-0.4280606, 1.036997, -1.693541, 0.07843138, 1, 0, 1,
-0.4240116, -0.6802801, -4.078491, 0.07450981, 1, 0, 1,
-0.4230344, 0.2723132, -1.110973, 0.06666667, 1, 0, 1,
-0.4154149, -0.979664, -2.208333, 0.0627451, 1, 0, 1,
-0.4100294, -0.5519, -2.580161, 0.05490196, 1, 0, 1,
-0.4091763, 0.6508286, -0.3782136, 0.05098039, 1, 0, 1,
-0.403332, -1.425849, -2.981391, 0.04313726, 1, 0, 1,
-0.4014424, -1.11364, -4.109004, 0.03921569, 1, 0, 1,
-0.4009707, -0.9266805, -1.939176, 0.03137255, 1, 0, 1,
-0.3988135, 1.092561, -0.9393989, 0.02745098, 1, 0, 1,
-0.3967152, -0.8779309, -3.013631, 0.01960784, 1, 0, 1,
-0.3966409, -0.3632178, -3.18644, 0.01568628, 1, 0, 1,
-0.3961594, 0.1166602, 0.06312066, 0.007843138, 1, 0, 1,
-0.3874986, 1.099756, -0.05022034, 0.003921569, 1, 0, 1,
-0.3841446, -0.1702723, -0.2418928, 0, 1, 0.003921569, 1,
-0.3831622, 1.449589, 0.3184789, 0, 1, 0.01176471, 1,
-0.3825471, 0.6395847, -2.794997, 0, 1, 0.01568628, 1,
-0.3796168, -0.1101598, -2.086624, 0, 1, 0.02352941, 1,
-0.3787558, -0.5466855, -0.6421379, 0, 1, 0.02745098, 1,
-0.3726443, 0.7163847, -0.7255752, 0, 1, 0.03529412, 1,
-0.3719235, -0.9737012, -2.615932, 0, 1, 0.03921569, 1,
-0.3670721, 0.1770517, -1.63603, 0, 1, 0.04705882, 1,
-0.3669119, 1.07215, 0.4858026, 0, 1, 0.05098039, 1,
-0.3616352, -0.9866305, -3.014991, 0, 1, 0.05882353, 1,
-0.3588213, -0.02759317, -2.871584, 0, 1, 0.0627451, 1,
-0.3579035, 1.087961, -1.085173, 0, 1, 0.07058824, 1,
-0.3529215, -1.238772, -5.515106, 0, 1, 0.07450981, 1,
-0.3482645, 1.527553, -0.7140452, 0, 1, 0.08235294, 1,
-0.3473934, -0.4019186, -1.293945, 0, 1, 0.08627451, 1,
-0.3451926, -0.126582, -3.936413, 0, 1, 0.09411765, 1,
-0.3422605, -0.4548012, -2.893878, 0, 1, 0.1019608, 1,
-0.3349, 1.788167, 0.449254, 0, 1, 0.1058824, 1,
-0.3329442, -0.3096473, -1.194173, 0, 1, 0.1137255, 1,
-0.328852, 0.883185, -1.522663, 0, 1, 0.1176471, 1,
-0.3273132, -1.403829, -0.9509605, 0, 1, 0.1254902, 1,
-0.3268692, -0.01973588, -2.05061, 0, 1, 0.1294118, 1,
-0.3229857, 0.06830984, -0.5965227, 0, 1, 0.1372549, 1,
-0.3205203, 1.700388, -1.829931, 0, 1, 0.1411765, 1,
-0.3193228, -0.7067543, -2.39995, 0, 1, 0.1490196, 1,
-0.3182808, 1.517042, 0.4884886, 0, 1, 0.1529412, 1,
-0.3141785, 1.111935, -1.344536, 0, 1, 0.1607843, 1,
-0.3057988, -0.3538269, -3.497712, 0, 1, 0.1647059, 1,
-0.2951156, -1.693627, -2.973336, 0, 1, 0.172549, 1,
-0.2898303, 0.9361515, 0.2978961, 0, 1, 0.1764706, 1,
-0.2813399, -0.5823071, -2.486342, 0, 1, 0.1843137, 1,
-0.2788081, 0.8056479, -0.8111129, 0, 1, 0.1882353, 1,
-0.2771799, -0.871632, -2.363435, 0, 1, 0.1960784, 1,
-0.274322, 1.271838, -0.2443514, 0, 1, 0.2039216, 1,
-0.2728958, 1.167633, 1.927422, 0, 1, 0.2078431, 1,
-0.2525995, 0.4966289, 0.723752, 0, 1, 0.2156863, 1,
-0.2446234, 0.6328671, 0.211579, 0, 1, 0.2196078, 1,
-0.243739, -0.4596405, -2.656337, 0, 1, 0.227451, 1,
-0.2430528, -0.2640865, -1.935166, 0, 1, 0.2313726, 1,
-0.2418175, 2.539563, -0.1228048, 0, 1, 0.2392157, 1,
-0.2410471, 0.6045351, -1.475963, 0, 1, 0.2431373, 1,
-0.2352169, 0.3255037, -0.8750123, 0, 1, 0.2509804, 1,
-0.2346641, -0.7808754, -2.248441, 0, 1, 0.254902, 1,
-0.2334896, 0.6850137, 1.386634, 0, 1, 0.2627451, 1,
-0.2328771, -1.359615, -2.985501, 0, 1, 0.2666667, 1,
-0.2293489, -2.050294, -3.665423, 0, 1, 0.2745098, 1,
-0.2277707, -0.6214873, -2.848881, 0, 1, 0.2784314, 1,
-0.219704, 0.3962988, -0.3348045, 0, 1, 0.2862745, 1,
-0.2188045, -0.6880696, -3.652072, 0, 1, 0.2901961, 1,
-0.2183623, 0.1721243, -0.4508883, 0, 1, 0.2980392, 1,
-0.2166478, 2.198525, 0.228058, 0, 1, 0.3058824, 1,
-0.2151671, 1.059147, 0.2907446, 0, 1, 0.3098039, 1,
-0.2112167, -0.5340909, -1.107281, 0, 1, 0.3176471, 1,
-0.2087683, -0.2910535, -1.677032, 0, 1, 0.3215686, 1,
-0.2000558, -0.7347649, -2.933808, 0, 1, 0.3294118, 1,
-0.1994833, 0.8799851, -0.8680665, 0, 1, 0.3333333, 1,
-0.1986117, -1.37228, -3.488832, 0, 1, 0.3411765, 1,
-0.1978828, 0.9695954, 0.192292, 0, 1, 0.345098, 1,
-0.196825, -0.816871, -2.364426, 0, 1, 0.3529412, 1,
-0.1931691, 1.462569, -0.2840018, 0, 1, 0.3568628, 1,
-0.1928623, -0.256474, -1.661625, 0, 1, 0.3647059, 1,
-0.1886151, -0.02643692, -1.392864, 0, 1, 0.3686275, 1,
-0.1886005, 0.6447107, -1.925913, 0, 1, 0.3764706, 1,
-0.1848202, 0.04544899, -2.69137, 0, 1, 0.3803922, 1,
-0.1842456, 0.8353382, -0.04818149, 0, 1, 0.3882353, 1,
-0.1836959, 1.360284, 0.223734, 0, 1, 0.3921569, 1,
-0.1836208, 0.4820968, 1.329121, 0, 1, 0.4, 1,
-0.182157, -0.7603063, -1.383208, 0, 1, 0.4078431, 1,
-0.1820378, -0.9542688, -3.250397, 0, 1, 0.4117647, 1,
-0.1769817, -0.03985282, -1.647312, 0, 1, 0.4196078, 1,
-0.1760255, -0.2469097, -2.00497, 0, 1, 0.4235294, 1,
-0.1743178, -0.6724917, -3.028439, 0, 1, 0.4313726, 1,
-0.1742467, 0.1283161, -1.916805, 0, 1, 0.4352941, 1,
-0.174192, 0.2796119, -0.3396719, 0, 1, 0.4431373, 1,
-0.1736206, 2.082552, -1.264732, 0, 1, 0.4470588, 1,
-0.1698479, -0.3789136, -1.376826, 0, 1, 0.454902, 1,
-0.1671876, -0.3854566, -1.982676, 0, 1, 0.4588235, 1,
-0.1639569, 2.290585, -1.233931, 0, 1, 0.4666667, 1,
-0.1636387, -1.671411, -5.318686, 0, 1, 0.4705882, 1,
-0.1634618, -0.3886539, -2.793455, 0, 1, 0.4784314, 1,
-0.1625355, 1.230567, 0.6635147, 0, 1, 0.4823529, 1,
-0.1579926, -1.150535, -3.613723, 0, 1, 0.4901961, 1,
-0.15758, 0.8204142, -0.0197189, 0, 1, 0.4941176, 1,
-0.1575171, -0.7239037, -2.393039, 0, 1, 0.5019608, 1,
-0.1568061, 1.418263, -0.6949071, 0, 1, 0.509804, 1,
-0.156249, 1.380242, -1.390432, 0, 1, 0.5137255, 1,
-0.1540306, 0.6594551, -1.759736, 0, 1, 0.5215687, 1,
-0.150124, -0.2667594, -0.2959585, 0, 1, 0.5254902, 1,
-0.1497634, -0.1763818, -1.760936, 0, 1, 0.5333334, 1,
-0.1476651, 1.114722, 0.3684172, 0, 1, 0.5372549, 1,
-0.1457835, 0.04913474, -2.445567, 0, 1, 0.5450981, 1,
-0.1451904, 0.430404, 0.420472, 0, 1, 0.5490196, 1,
-0.1403665, 0.3492101, -0.1395368, 0, 1, 0.5568628, 1,
-0.138354, 0.7337529, 0.01743893, 0, 1, 0.5607843, 1,
-0.1380125, -2.410888, -3.303364, 0, 1, 0.5686275, 1,
-0.1377344, 1.030324, 0.8419373, 0, 1, 0.572549, 1,
-0.133933, -0.2850416, -4.072112, 0, 1, 0.5803922, 1,
-0.1322978, 0.1041859, -3.162238, 0, 1, 0.5843138, 1,
-0.1301759, -0.4194967, -2.002419, 0, 1, 0.5921569, 1,
-0.1296473, 0.4966012, 0.294294, 0, 1, 0.5960785, 1,
-0.1291345, -1.309265, -5.598837, 0, 1, 0.6039216, 1,
-0.1283938, -0.4939452, -3.100648, 0, 1, 0.6117647, 1,
-0.1265696, 0.1718743, -0.5298183, 0, 1, 0.6156863, 1,
-0.1263951, -0.5671855, -3.573937, 0, 1, 0.6235294, 1,
-0.1255416, -1.304748, -3.0581, 0, 1, 0.627451, 1,
-0.1229275, -0.1235626, -3.434662, 0, 1, 0.6352941, 1,
-0.1195733, 0.5539059, -1.484092, 0, 1, 0.6392157, 1,
-0.1150651, -0.02540839, -1.817284, 0, 1, 0.6470588, 1,
-0.1116453, 1.125431, -0.381515, 0, 1, 0.6509804, 1,
-0.1110611, -0.08779654, -2.739453, 0, 1, 0.6588235, 1,
-0.1083882, 0.896893, -0.7793478, 0, 1, 0.6627451, 1,
-0.09706513, 1.626256, -0.2292565, 0, 1, 0.6705883, 1,
-0.09634895, 0.7742493, -0.318841, 0, 1, 0.6745098, 1,
-0.09550412, -0.1903507, -1.994248, 0, 1, 0.682353, 1,
-0.09364467, -0.3726771, -2.594432, 0, 1, 0.6862745, 1,
-0.09208408, -0.4938623, -2.703514, 0, 1, 0.6941177, 1,
-0.08811846, 0.8645191, -0.6401704, 0, 1, 0.7019608, 1,
-0.08727642, -1.8579, -2.35256, 0, 1, 0.7058824, 1,
-0.08476385, 0.08165241, -1.808698, 0, 1, 0.7137255, 1,
-0.08258183, 0.1294743, -0.1171405, 0, 1, 0.7176471, 1,
-0.08249675, 0.5428358, -0.0512029, 0, 1, 0.7254902, 1,
-0.07853226, -0.4570455, -1.462687, 0, 1, 0.7294118, 1,
-0.07786017, -0.4383423, -2.476134, 0, 1, 0.7372549, 1,
-0.0757272, 1.180208, -0.07560156, 0, 1, 0.7411765, 1,
-0.07528985, 0.2067317, -1.745748, 0, 1, 0.7490196, 1,
-0.0689898, 0.3619578, 0.6200979, 0, 1, 0.7529412, 1,
-0.06370573, 1.495203, 0.3281023, 0, 1, 0.7607843, 1,
-0.06319607, -1.019255, -2.864411, 0, 1, 0.7647059, 1,
-0.06067498, 0.9239656, 0.2844818, 0, 1, 0.772549, 1,
-0.05711691, -0.5356565, -1.040238, 0, 1, 0.7764706, 1,
-0.0562388, 0.2887837, 0.557074, 0, 1, 0.7843137, 1,
-0.05570376, 0.4014682, 1.070448, 0, 1, 0.7882353, 1,
-0.05442645, -0.878925, -2.854191, 0, 1, 0.7960784, 1,
-0.05358209, 1.165025, -0.5394662, 0, 1, 0.8039216, 1,
-0.04919046, 0.3799998, -0.5955771, 0, 1, 0.8078431, 1,
-0.04056673, -1.099454, -3.720662, 0, 1, 0.8156863, 1,
-0.04044459, -1.173581, -2.066603, 0, 1, 0.8196079, 1,
-0.03818898, 1.586735, -0.8626004, 0, 1, 0.827451, 1,
-0.03808462, -0.5860576, -3.098566, 0, 1, 0.8313726, 1,
-0.0370818, 1.284014, -0.446125, 0, 1, 0.8392157, 1,
-0.03240889, -0.2093949, -2.019606, 0, 1, 0.8431373, 1,
-0.03137961, -0.2631248, -2.716105, 0, 1, 0.8509804, 1,
-0.03006479, -1.842213, -2.745027, 0, 1, 0.854902, 1,
-0.02869662, -0.4940295, -3.448932, 0, 1, 0.8627451, 1,
-0.02595542, 1.182022, -0.7622349, 0, 1, 0.8666667, 1,
-0.02486697, 0.930234, 0.2353351, 0, 1, 0.8745098, 1,
-0.02291368, -0.1429859, -2.844985, 0, 1, 0.8784314, 1,
-0.02231284, -0.8850813, -3.055032, 0, 1, 0.8862745, 1,
-0.02114943, -1.667315, -3.74236, 0, 1, 0.8901961, 1,
-0.02093993, -0.714824, -2.932628, 0, 1, 0.8980392, 1,
-0.0201517, -1.112095, -1.683099, 0, 1, 0.9058824, 1,
-0.01916778, 1.883784, -2.455056, 0, 1, 0.9098039, 1,
-0.01906681, 0.2359284, 0.614055, 0, 1, 0.9176471, 1,
-0.01899164, 1.341586, 0.3091473, 0, 1, 0.9215686, 1,
-0.01878582, -0.750667, -2.12159, 0, 1, 0.9294118, 1,
-0.0178101, 0.5334802, -0.3552693, 0, 1, 0.9333333, 1,
-0.01632746, 0.7705795, 1.053201, 0, 1, 0.9411765, 1,
-0.007599896, -1.437063, -3.007285, 0, 1, 0.945098, 1,
-0.007331287, 1.658102, -0.9194257, 0, 1, 0.9529412, 1,
-0.00607229, 1.77359, -0.6871263, 0, 1, 0.9568627, 1,
-0.004708907, 0.4817601, -1.126388, 0, 1, 0.9647059, 1,
-0.0044011, -0.7719012, -3.2336, 0, 1, 0.9686275, 1,
-0.0008878116, -0.6657974, -2.596143, 0, 1, 0.9764706, 1,
0.006029284, -2.046935, 2.934322, 0, 1, 0.9803922, 1,
0.0062001, 1.061761, 0.4560477, 0, 1, 0.9882353, 1,
0.008160637, 0.2742974, 0.5729946, 0, 1, 0.9921569, 1,
0.009511353, -0.5389128, 3.510957, 0, 1, 1, 1,
0.01431746, 0.3670935, -1.120776, 0, 0.9921569, 1, 1,
0.01589044, -1.222572, 3.153584, 0, 0.9882353, 1, 1,
0.01861355, 0.649569, -0.1038251, 0, 0.9803922, 1, 1,
0.01939206, -0.04134661, 2.403508, 0, 0.9764706, 1, 1,
0.02276891, 0.2191371, 0.1163093, 0, 0.9686275, 1, 1,
0.02416936, 2.688391, 0.7742253, 0, 0.9647059, 1, 1,
0.02658992, 0.3624195, 1.743062, 0, 0.9568627, 1, 1,
0.02869649, -0.2297101, 1.821482, 0, 0.9529412, 1, 1,
0.03261764, -0.1610144, 1.524297, 0, 0.945098, 1, 1,
0.03309495, 1.039714, 0.07270379, 0, 0.9411765, 1, 1,
0.03381791, 0.560768, 0.0658692, 0, 0.9333333, 1, 1,
0.03414521, -0.8843045, 3.254729, 0, 0.9294118, 1, 1,
0.04100185, -1.762238, 2.523415, 0, 0.9215686, 1, 1,
0.04553778, 0.5597903, 0.4458, 0, 0.9176471, 1, 1,
0.04589295, -0.6372156, 3.566026, 0, 0.9098039, 1, 1,
0.04717708, -1.387929, 2.278407, 0, 0.9058824, 1, 1,
0.04738025, -0.891079, 3.933708, 0, 0.8980392, 1, 1,
0.05333262, -0.5587928, 1.990665, 0, 0.8901961, 1, 1,
0.05674117, -2.261909, 2.361496, 0, 0.8862745, 1, 1,
0.0588599, -0.4968768, 1.253093, 0, 0.8784314, 1, 1,
0.0619729, 0.2245665, 0.8290836, 0, 0.8745098, 1, 1,
0.06257269, 1.39574, -0.5767615, 0, 0.8666667, 1, 1,
0.06318311, 0.4953863, -0.4082194, 0, 0.8627451, 1, 1,
0.0690634, 0.1472158, -0.6497539, 0, 0.854902, 1, 1,
0.07416081, -1.710681, 2.982651, 0, 0.8509804, 1, 1,
0.07794117, 1.673837, -0.4277681, 0, 0.8431373, 1, 1,
0.08397676, -0.6755234, 2.555122, 0, 0.8392157, 1, 1,
0.08469447, -0.1331991, 4.075551, 0, 0.8313726, 1, 1,
0.08600965, -0.40005, 1.951058, 0, 0.827451, 1, 1,
0.0873227, 1.091446, -1.542063, 0, 0.8196079, 1, 1,
0.08897175, -0.8289888, 3.872185, 0, 0.8156863, 1, 1,
0.09105612, 0.2675543, -0.08947052, 0, 0.8078431, 1, 1,
0.09152567, -1.223246, 4.038845, 0, 0.8039216, 1, 1,
0.0958506, 0.9765635, 0.5769908, 0, 0.7960784, 1, 1,
0.09864095, 0.7805643, -0.6943035, 0, 0.7882353, 1, 1,
0.09973308, 0.5139165, 1.39542, 0, 0.7843137, 1, 1,
0.102205, -0.03608466, 0.8054337, 0, 0.7764706, 1, 1,
0.1036903, 1.245357, 2.560178, 0, 0.772549, 1, 1,
0.1040626, 0.9654499, 0.4967262, 0, 0.7647059, 1, 1,
0.1062185, 0.4655515, 0.9952987, 0, 0.7607843, 1, 1,
0.1081512, 0.2390279, 0.6574002, 0, 0.7529412, 1, 1,
0.1090486, 0.07233881, -0.295557, 0, 0.7490196, 1, 1,
0.112952, -0.01505336, 0.9994182, 0, 0.7411765, 1, 1,
0.1242648, 0.3848808, 0.5844302, 0, 0.7372549, 1, 1,
0.126063, 1.12017, -1.458487, 0, 0.7294118, 1, 1,
0.1268726, -0.4252836, 4.041439, 0, 0.7254902, 1, 1,
0.1272865, 1.789256, 0.8348957, 0, 0.7176471, 1, 1,
0.1273235, 0.1296275, -0.1465213, 0, 0.7137255, 1, 1,
0.1280685, -0.7064506, 3.921153, 0, 0.7058824, 1, 1,
0.1287054, 0.6174703, 0.7241706, 0, 0.6980392, 1, 1,
0.134567, -0.4426542, 2.016019, 0, 0.6941177, 1, 1,
0.1385273, -0.2462884, 2.047111, 0, 0.6862745, 1, 1,
0.1405422, -1.327032, 1.312295, 0, 0.682353, 1, 1,
0.1438734, -0.5248885, 0.4289106, 0, 0.6745098, 1, 1,
0.1443763, -1.271697, 2.637317, 0, 0.6705883, 1, 1,
0.1462841, 0.2027199, 1.155996, 0, 0.6627451, 1, 1,
0.1501099, 0.06484697, 0.6420861, 0, 0.6588235, 1, 1,
0.1503939, -0.08545428, 1.406995, 0, 0.6509804, 1, 1,
0.1516522, -0.9352945, 3.048158, 0, 0.6470588, 1, 1,
0.1549324, 0.5830691, 0.9122173, 0, 0.6392157, 1, 1,
0.1558218, -0.5492796, 1.71121, 0, 0.6352941, 1, 1,
0.1563769, -0.3672807, 1.729376, 0, 0.627451, 1, 1,
0.157543, 0.06112235, -0.1281665, 0, 0.6235294, 1, 1,
0.1577742, -1.963217, 3.839414, 0, 0.6156863, 1, 1,
0.1595099, 1.589359, -1.875633, 0, 0.6117647, 1, 1,
0.1627285, -1.3291, 4.040182, 0, 0.6039216, 1, 1,
0.1652452, -1.344328, 2.194663, 0, 0.5960785, 1, 1,
0.1656374, -0.6818413, 2.566243, 0, 0.5921569, 1, 1,
0.167418, -0.9596499, 2.256872, 0, 0.5843138, 1, 1,
0.1703535, -0.1952309, 2.08419, 0, 0.5803922, 1, 1,
0.1758557, 0.1420733, 1.30556, 0, 0.572549, 1, 1,
0.1785837, 1.370481, 0.2412401, 0, 0.5686275, 1, 1,
0.1816291, 0.4640772, 1.487258, 0, 0.5607843, 1, 1,
0.182699, -1.69686, 4.635933, 0, 0.5568628, 1, 1,
0.1858413, -0.1803144, 1.1427, 0, 0.5490196, 1, 1,
0.1878827, 0.6311725, 0.6416287, 0, 0.5450981, 1, 1,
0.1940053, 0.8916489, 0.7497462, 0, 0.5372549, 1, 1,
0.1962367, -0.03607672, 2.998639, 0, 0.5333334, 1, 1,
0.1989262, -0.140186, 0.6343031, 0, 0.5254902, 1, 1,
0.1990899, -0.9595393, 1.869791, 0, 0.5215687, 1, 1,
0.1995826, 0.7471513, -0.8662084, 0, 0.5137255, 1, 1,
0.1998377, -0.406272, 2.538567, 0, 0.509804, 1, 1,
0.2005499, 0.4750806, -0.2760256, 0, 0.5019608, 1, 1,
0.2079664, 0.8112866, 0.4443516, 0, 0.4941176, 1, 1,
0.2080624, -0.1581027, 0.7511558, 0, 0.4901961, 1, 1,
0.2088407, 1.094436, -0.07187972, 0, 0.4823529, 1, 1,
0.2106911, 0.4187225, 0.3628243, 0, 0.4784314, 1, 1,
0.2116596, 0.7634544, -0.4032416, 0, 0.4705882, 1, 1,
0.2130953, -2.018847, 2.336383, 0, 0.4666667, 1, 1,
0.21365, 1.748868, -0.2480505, 0, 0.4588235, 1, 1,
0.2138566, -1.003941, 3.447819, 0, 0.454902, 1, 1,
0.2155443, -0.1779528, 1.931619, 0, 0.4470588, 1, 1,
0.2155992, 0.1827375, 1.490429, 0, 0.4431373, 1, 1,
0.2163762, -0.05513325, -0.3581235, 0, 0.4352941, 1, 1,
0.2171094, -0.554068, 3.658724, 0, 0.4313726, 1, 1,
0.2173923, -0.07968091, 0.9368505, 0, 0.4235294, 1, 1,
0.2181464, -1.317935, 2.676844, 0, 0.4196078, 1, 1,
0.2218223, -1.803347, 3.047865, 0, 0.4117647, 1, 1,
0.2227574, -1.66497, 2.822543, 0, 0.4078431, 1, 1,
0.2274055, -1.036046, 3.860223, 0, 0.4, 1, 1,
0.228408, 2.430815, 0.5454102, 0, 0.3921569, 1, 1,
0.2331147, -0.1533277, 2.833721, 0, 0.3882353, 1, 1,
0.2387578, -2.246763, 2.96015, 0, 0.3803922, 1, 1,
0.2393733, 1.160101, 0.1427047, 0, 0.3764706, 1, 1,
0.2398276, 0.2195259, 2.145504, 0, 0.3686275, 1, 1,
0.2428894, 1.074068, 1.429869, 0, 0.3647059, 1, 1,
0.2499831, 1.057015, 0.4085151, 0, 0.3568628, 1, 1,
0.2504696, -0.7977242, 0.3291826, 0, 0.3529412, 1, 1,
0.2504717, 0.2373912, 0.3024319, 0, 0.345098, 1, 1,
0.2514254, -0.2300434, 2.451754, 0, 0.3411765, 1, 1,
0.2594932, 1.017128, -1.156226, 0, 0.3333333, 1, 1,
0.2687181, -0.5632496, 4.105495, 0, 0.3294118, 1, 1,
0.269531, 0.02727939, 2.467914, 0, 0.3215686, 1, 1,
0.2711874, -0.09375081, 3.937184, 0, 0.3176471, 1, 1,
0.2726908, -1.112541, 1.513191, 0, 0.3098039, 1, 1,
0.2739862, 0.4387558, 0.1121953, 0, 0.3058824, 1, 1,
0.274291, -1.741329, 3.369598, 0, 0.2980392, 1, 1,
0.2761695, 0.004573376, 1.089822, 0, 0.2901961, 1, 1,
0.2770044, 1.69534, 0.97093, 0, 0.2862745, 1, 1,
0.2847835, -1.83974, 2.41479, 0, 0.2784314, 1, 1,
0.2867155, -0.3825612, 3.216247, 0, 0.2745098, 1, 1,
0.2893054, 0.2470425, 2.083118, 0, 0.2666667, 1, 1,
0.2956258, -0.6826861, 3.364101, 0, 0.2627451, 1, 1,
0.303777, 1.296018, 0.3429108, 0, 0.254902, 1, 1,
0.303785, -0.8323603, 3.079925, 0, 0.2509804, 1, 1,
0.3044933, 0.09077378, -0.8053827, 0, 0.2431373, 1, 1,
0.3063911, 0.1360254, 0.2823403, 0, 0.2392157, 1, 1,
0.3064044, -2.364482, 1.065017, 0, 0.2313726, 1, 1,
0.3069884, 0.592276, -0.5036253, 0, 0.227451, 1, 1,
0.3107976, -1.160197, 3.990255, 0, 0.2196078, 1, 1,
0.3115704, -0.7249675, 4.238842, 0, 0.2156863, 1, 1,
0.3143958, 0.3949851, 2.129177, 0, 0.2078431, 1, 1,
0.316108, -0.4315927, 2.454753, 0, 0.2039216, 1, 1,
0.3195283, -0.4290234, 2.227091, 0, 0.1960784, 1, 1,
0.323887, 0.8724811, -0.5664272, 0, 0.1882353, 1, 1,
0.3295928, 0.9863887, -0.6475711, 0, 0.1843137, 1, 1,
0.3299786, 1.3689, 0.5148033, 0, 0.1764706, 1, 1,
0.3301385, 0.9718025, 1.303846, 0, 0.172549, 1, 1,
0.3302999, -0.3287289, 3.11684, 0, 0.1647059, 1, 1,
0.3326226, 0.2351265, -1.156371, 0, 0.1607843, 1, 1,
0.3379161, 1.916117, -0.9775369, 0, 0.1529412, 1, 1,
0.3381408, 0.5795426, 0.3140505, 0, 0.1490196, 1, 1,
0.3389586, 0.5484741, 0.1389883, 0, 0.1411765, 1, 1,
0.3397993, -0.1339103, 1.459036, 0, 0.1372549, 1, 1,
0.341205, -1.125951, 2.301037, 0, 0.1294118, 1, 1,
0.341436, 0.3392684, 1.18065, 0, 0.1254902, 1, 1,
0.3433116, 0.4145016, 0.6416772, 0, 0.1176471, 1, 1,
0.3499116, -0.5903999, 1.936918, 0, 0.1137255, 1, 1,
0.3568105, -0.9899639, 2.384573, 0, 0.1058824, 1, 1,
0.3571755, 0.4329883, 2.773194, 0, 0.09803922, 1, 1,
0.3611827, 1.192427, -0.08676382, 0, 0.09411765, 1, 1,
0.3614362, -1.373691, 1.565007, 0, 0.08627451, 1, 1,
0.3628331, -0.1628446, 0.7668887, 0, 0.08235294, 1, 1,
0.3642567, 1.29924, -0.03748501, 0, 0.07450981, 1, 1,
0.3674015, -0.6414762, 0.5746974, 0, 0.07058824, 1, 1,
0.3691488, -0.8907027, 1.22314, 0, 0.0627451, 1, 1,
0.3726253, 1.981565, -0.7105055, 0, 0.05882353, 1, 1,
0.3763953, -0.2980213, 2.185198, 0, 0.05098039, 1, 1,
0.3868632, 1.301371, 0.01465264, 0, 0.04705882, 1, 1,
0.3872535, -0.6201979, 1.360703, 0, 0.03921569, 1, 1,
0.3898314, 0.9253278, -0.6887333, 0, 0.03529412, 1, 1,
0.3931907, 1.205769, 1.04972, 0, 0.02745098, 1, 1,
0.3974041, -1.158882, 2.383151, 0, 0.02352941, 1, 1,
0.4066768, -0.4319955, 1.263097, 0, 0.01568628, 1, 1,
0.4092077, -1.543426, 1.853973, 0, 0.01176471, 1, 1,
0.411499, 0.5283488, -0.6558678, 0, 0.003921569, 1, 1,
0.4169279, 0.9062942, 0.5155256, 0.003921569, 0, 1, 1,
0.417227, 0.1608017, 2.92708, 0.007843138, 0, 1, 1,
0.4174317, -1.884461, 3.086572, 0.01568628, 0, 1, 1,
0.418606, 0.1858918, 2.023699, 0.01960784, 0, 1, 1,
0.4194172, -0.6111682, 1.883105, 0.02745098, 0, 1, 1,
0.4198976, 2.053764, 0.07662013, 0.03137255, 0, 1, 1,
0.4208587, 0.3775786, 0.6538314, 0.03921569, 0, 1, 1,
0.4264336, -0.7453942, 2.36373, 0.04313726, 0, 1, 1,
0.4299027, -1.642003, 3.255285, 0.05098039, 0, 1, 1,
0.4316024, -1.789657, 2.488789, 0.05490196, 0, 1, 1,
0.4373524, 0.355307, 0.794613, 0.0627451, 0, 1, 1,
0.4375322, -2.041659, 2.981398, 0.06666667, 0, 1, 1,
0.4445661, -0.5783697, 2.788155, 0.07450981, 0, 1, 1,
0.4449433, -0.04171861, 0.75016, 0.07843138, 0, 1, 1,
0.4450468, -1.301778, 2.531145, 0.08627451, 0, 1, 1,
0.4467695, -0.4662223, 2.775525, 0.09019608, 0, 1, 1,
0.4505368, -0.7595933, 5.919219, 0.09803922, 0, 1, 1,
0.452913, -2.052597, 1.656179, 0.1058824, 0, 1, 1,
0.4530002, 0.5091513, 0.1085995, 0.1098039, 0, 1, 1,
0.4541783, -0.5432801, 3.31621, 0.1176471, 0, 1, 1,
0.4548883, 0.0098836, 0.7338236, 0.1215686, 0, 1, 1,
0.45941, -1.293943, 4.565498, 0.1294118, 0, 1, 1,
0.4598597, 0.3117419, 0.8290126, 0.1333333, 0, 1, 1,
0.4654806, -0.9032853, 2.53541, 0.1411765, 0, 1, 1,
0.4670281, -0.2926129, 1.738598, 0.145098, 0, 1, 1,
0.4679082, -0.4237089, 3.478594, 0.1529412, 0, 1, 1,
0.4716127, 1.137107, 0.758662, 0.1568628, 0, 1, 1,
0.4835537, 0.8481773, -1.827879, 0.1647059, 0, 1, 1,
0.484436, 0.8101253, -0.04180624, 0.1686275, 0, 1, 1,
0.4844584, -0.2006687, 4.266535, 0.1764706, 0, 1, 1,
0.4948019, 0.5015056, 1.215514, 0.1803922, 0, 1, 1,
0.4969588, -0.9256253, 1.803107, 0.1882353, 0, 1, 1,
0.4977118, -0.07722548, 1.081985, 0.1921569, 0, 1, 1,
0.4982719, -0.5791297, 1.857614, 0.2, 0, 1, 1,
0.4986649, 0.7117327, -0.1000535, 0.2078431, 0, 1, 1,
0.5010775, -1.337051, 2.612267, 0.2117647, 0, 1, 1,
0.5046166, 0.4608883, 0.1794562, 0.2196078, 0, 1, 1,
0.5054892, -0.9356998, 3.43287, 0.2235294, 0, 1, 1,
0.5091605, -0.2696894, 0.5651462, 0.2313726, 0, 1, 1,
0.5113896, 0.8692073, 0.6576459, 0.2352941, 0, 1, 1,
0.5182251, -0.4922111, 2.196598, 0.2431373, 0, 1, 1,
0.5243455, 1.159502, -1.342524, 0.2470588, 0, 1, 1,
0.5307016, -0.02304834, 1.394272, 0.254902, 0, 1, 1,
0.531045, 0.8729167, -0.6845328, 0.2588235, 0, 1, 1,
0.531195, 0.02868707, 1.098484, 0.2666667, 0, 1, 1,
0.5374798, -1.216424, 3.233303, 0.2705882, 0, 1, 1,
0.5423617, 0.9561206, 1.737984, 0.2784314, 0, 1, 1,
0.5442346, 0.1831919, 0.8380008, 0.282353, 0, 1, 1,
0.544495, -1.357423, 2.22185, 0.2901961, 0, 1, 1,
0.5447425, -1.068172, 3.436823, 0.2941177, 0, 1, 1,
0.5486557, 0.8555117, -0.6581845, 0.3019608, 0, 1, 1,
0.5588917, -2.969388, 3.720608, 0.3098039, 0, 1, 1,
0.5590937, -0.8898821, 1.59452, 0.3137255, 0, 1, 1,
0.5607442, -0.6940573, 3.717985, 0.3215686, 0, 1, 1,
0.5647213, 0.0390723, 2.375761, 0.3254902, 0, 1, 1,
0.5664476, 0.5331857, 1.425953, 0.3333333, 0, 1, 1,
0.5735065, 1.650922, 0.9709044, 0.3372549, 0, 1, 1,
0.5753015, 0.1830323, 0.08854946, 0.345098, 0, 1, 1,
0.5755781, 0.8558175, 0.6402983, 0.3490196, 0, 1, 1,
0.5796546, -0.7237639, 2.391327, 0.3568628, 0, 1, 1,
0.5827026, 0.1312089, 2.368494, 0.3607843, 0, 1, 1,
0.5894397, 0.03694689, 1.71536, 0.3686275, 0, 1, 1,
0.5912787, 0.5743911, -0.2000388, 0.372549, 0, 1, 1,
0.59189, 0.5459855, -0.02053152, 0.3803922, 0, 1, 1,
0.5924765, -1.004166, 3.426405, 0.3843137, 0, 1, 1,
0.5951643, -1.236232, 1.313064, 0.3921569, 0, 1, 1,
0.6043357, 0.5640805, -0.3642879, 0.3960784, 0, 1, 1,
0.605141, -1.396799, 0.2823525, 0.4039216, 0, 1, 1,
0.6067279, 0.05375838, 3.847688, 0.4117647, 0, 1, 1,
0.6084784, -0.4169097, 1.428224, 0.4156863, 0, 1, 1,
0.6097067, 0.6519737, 1.450033, 0.4235294, 0, 1, 1,
0.6140196, 0.7493737, 1.109566, 0.427451, 0, 1, 1,
0.6147547, 0.3867357, 1.87817, 0.4352941, 0, 1, 1,
0.6151152, 1.070221, -0.9238608, 0.4392157, 0, 1, 1,
0.6154276, 0.5372987, 1.864484, 0.4470588, 0, 1, 1,
0.618131, -0.4244823, 3.756552, 0.4509804, 0, 1, 1,
0.6200972, 1.520426, -0.05608159, 0.4588235, 0, 1, 1,
0.6209803, 0.5414311, 2.869663, 0.4627451, 0, 1, 1,
0.6272704, -1.548334, 2.035323, 0.4705882, 0, 1, 1,
0.6316624, 0.9577166, -0.04119555, 0.4745098, 0, 1, 1,
0.6340999, 0.7237145, 0.492038, 0.4823529, 0, 1, 1,
0.6347257, -2.850322, 3.468955, 0.4862745, 0, 1, 1,
0.6358773, -0.6231003, 2.324675, 0.4941176, 0, 1, 1,
0.6365973, -1.223923, 3.62265, 0.5019608, 0, 1, 1,
0.6462469, 1.05502, 1.826248, 0.5058824, 0, 1, 1,
0.6477172, 1.393144, 0.6752381, 0.5137255, 0, 1, 1,
0.6504759, -0.9897945, 2.311745, 0.5176471, 0, 1, 1,
0.6505815, -0.2361169, 2.784317, 0.5254902, 0, 1, 1,
0.6511537, 1.030765, 1.946735, 0.5294118, 0, 1, 1,
0.6529351, 1.604877, 1.513738, 0.5372549, 0, 1, 1,
0.6550866, 0.4081012, 0.9597992, 0.5411765, 0, 1, 1,
0.6577454, 0.3876172, 2.193983, 0.5490196, 0, 1, 1,
0.6600809, 0.02941518, 2.701597, 0.5529412, 0, 1, 1,
0.6601084, 0.2866223, 1.818365, 0.5607843, 0, 1, 1,
0.6636474, -0.7567726, 3.801505, 0.5647059, 0, 1, 1,
0.6668196, 0.5355064, 1.723557, 0.572549, 0, 1, 1,
0.667401, -0.4011042, 3.033567, 0.5764706, 0, 1, 1,
0.6709808, 0.5298085, 0.3483347, 0.5843138, 0, 1, 1,
0.6758769, -1.951089, 2.509147, 0.5882353, 0, 1, 1,
0.6775343, -2.107342, 2.006995, 0.5960785, 0, 1, 1,
0.6815075, 0.3757156, 0.6639791, 0.6039216, 0, 1, 1,
0.6857999, -0.1261758, 2.138484, 0.6078432, 0, 1, 1,
0.688233, 0.03080639, 1.629605, 0.6156863, 0, 1, 1,
0.695883, -1.02516, 3.289295, 0.6196079, 0, 1, 1,
0.6970415, -1.362581, 3.161977, 0.627451, 0, 1, 1,
0.6991974, 0.7311807, 1.096928, 0.6313726, 0, 1, 1,
0.7020869, 0.2519163, -0.4148097, 0.6392157, 0, 1, 1,
0.7061939, -0.1978367, 2.03663, 0.6431373, 0, 1, 1,
0.7104362, 0.6972399, 2.194082, 0.6509804, 0, 1, 1,
0.7111499, -0.2323619, 1.362288, 0.654902, 0, 1, 1,
0.714014, 1.945178, 1.614452, 0.6627451, 0, 1, 1,
0.725319, -0.6217082, 0.9083901, 0.6666667, 0, 1, 1,
0.7310367, -0.5443407, 1.882142, 0.6745098, 0, 1, 1,
0.7323044, 1.004597, 1.804092, 0.6784314, 0, 1, 1,
0.7405986, -1.13146, 4.315557, 0.6862745, 0, 1, 1,
0.7418637, -0.2436356, 2.242413, 0.6901961, 0, 1, 1,
0.7440201, -0.7148941, 2.109607, 0.6980392, 0, 1, 1,
0.7498848, -1.778163, 5.033966, 0.7058824, 0, 1, 1,
0.7523228, 0.155597, 1.156671, 0.7098039, 0, 1, 1,
0.7554541, -1.085688, 1.08268, 0.7176471, 0, 1, 1,
0.760988, -0.0938462, 1.216927, 0.7215686, 0, 1, 1,
0.761142, -0.4934256, 0.6605789, 0.7294118, 0, 1, 1,
0.7628785, 0.6479025, 0.3519158, 0.7333333, 0, 1, 1,
0.7644085, -0.4384998, 2.912355, 0.7411765, 0, 1, 1,
0.7670762, 1.857175, -0.426114, 0.7450981, 0, 1, 1,
0.7723976, -0.650598, 3.051408, 0.7529412, 0, 1, 1,
0.7753556, -0.8380563, 2.688954, 0.7568628, 0, 1, 1,
0.7762083, 1.306533, 0.2397015, 0.7647059, 0, 1, 1,
0.7786111, 0.9438142, -0.3425864, 0.7686275, 0, 1, 1,
0.7860017, -1.62195, 2.400757, 0.7764706, 0, 1, 1,
0.7866042, 0.5275775, 1.094114, 0.7803922, 0, 1, 1,
0.7873264, -0.9926163, 0.6791356, 0.7882353, 0, 1, 1,
0.7891306, 1.112436, 0.5392244, 0.7921569, 0, 1, 1,
0.7944351, 1.47172, -0.05407488, 0.8, 0, 1, 1,
0.79692, -0.1248598, 0.8742223, 0.8078431, 0, 1, 1,
0.8166109, -0.5267578, 2.285644, 0.8117647, 0, 1, 1,
0.8196068, -0.4849848, 2.168539, 0.8196079, 0, 1, 1,
0.8214233, 2.087897, -0.6421028, 0.8235294, 0, 1, 1,
0.8377519, 1.038329, -0.7683864, 0.8313726, 0, 1, 1,
0.8477151, 0.7088532, 2.459864, 0.8352941, 0, 1, 1,
0.8567654, 0.8226265, -0.7896547, 0.8431373, 0, 1, 1,
0.861448, -0.1055317, 0.5639002, 0.8470588, 0, 1, 1,
0.8641925, 0.04630858, 1.752513, 0.854902, 0, 1, 1,
0.8659536, -1.772839, 3.653818, 0.8588235, 0, 1, 1,
0.8680117, 0.490897, 0.5692667, 0.8666667, 0, 1, 1,
0.8688791, 0.2934383, 1.576026, 0.8705882, 0, 1, 1,
0.8695387, 0.9679141, 2.013007, 0.8784314, 0, 1, 1,
0.870935, -0.4457991, 2.902737, 0.8823529, 0, 1, 1,
0.8713516, -0.869212, 3.094881, 0.8901961, 0, 1, 1,
0.8834353, 0.8886212, -0.4399191, 0.8941177, 0, 1, 1,
0.8895588, -0.4900604, 2.986727, 0.9019608, 0, 1, 1,
0.899685, 1.917955, -0.9860092, 0.9098039, 0, 1, 1,
0.9010277, -0.09459659, 2.185438, 0.9137255, 0, 1, 1,
0.9026838, 0.2940325, 1.915767, 0.9215686, 0, 1, 1,
0.9090444, -0.6379461, 2.312534, 0.9254902, 0, 1, 1,
0.916501, 0.04629416, 2.512411, 0.9333333, 0, 1, 1,
0.9249328, 0.7103387, 1.411491, 0.9372549, 0, 1, 1,
0.9341167, -1.458343, 2.154617, 0.945098, 0, 1, 1,
0.9363863, 0.05809352, 1.283849, 0.9490196, 0, 1, 1,
0.9395247, 0.940078, 1.760043, 0.9568627, 0, 1, 1,
0.9451466, 1.482568, -0.2597327, 0.9607843, 0, 1, 1,
0.9470028, -1.16931, 3.194829, 0.9686275, 0, 1, 1,
0.9501702, -1.995233, 1.175838, 0.972549, 0, 1, 1,
0.9557137, 0.3176838, 3.166654, 0.9803922, 0, 1, 1,
0.9562074, 0.2220857, 1.058383, 0.9843137, 0, 1, 1,
0.958234, 0.2512622, 2.164004, 0.9921569, 0, 1, 1,
0.9621286, 0.9110808, 0.9545078, 0.9960784, 0, 1, 1,
0.9756232, 0.7295198, 0.8082343, 1, 0, 0.9960784, 1,
0.9764511, -0.9377007, 3.493689, 1, 0, 0.9882353, 1,
0.9774637, 1.371168, 1.134192, 1, 0, 0.9843137, 1,
0.9842201, 0.9122973, 0.828162, 1, 0, 0.9764706, 1,
0.9858248, 0.1345699, 2.958446, 1, 0, 0.972549, 1,
0.9881487, -1.155904, 3.473883, 1, 0, 0.9647059, 1,
0.9893066, 0.3695149, 1.204621, 1, 0, 0.9607843, 1,
0.9946986, 0.8466622, -0.8987679, 1, 0, 0.9529412, 1,
0.9981744, 0.2511514, 1.621394, 1, 0, 0.9490196, 1,
1.00278, 0.2892888, 1.60104, 1, 0, 0.9411765, 1,
1.009721, -0.6494798, 1.506099, 1, 0, 0.9372549, 1,
1.017225, -1.000559, 1.592798, 1, 0, 0.9294118, 1,
1.018783, 1.989859, -0.3553524, 1, 0, 0.9254902, 1,
1.020782, 0.3881518, 1.907735, 1, 0, 0.9176471, 1,
1.025007, -0.493389, -1.357223, 1, 0, 0.9137255, 1,
1.027534, -0.4675334, 2.435547, 1, 0, 0.9058824, 1,
1.028006, -1.330871, 1.855602, 1, 0, 0.9019608, 1,
1.028205, 1.027207, 1.169407, 1, 0, 0.8941177, 1,
1.030001, 1.494486, 0.2203282, 1, 0, 0.8862745, 1,
1.037437, -1.007926, 0.9092144, 1, 0, 0.8823529, 1,
1.050353, 1.119839, -0.4289013, 1, 0, 0.8745098, 1,
1.056283, -0.8500047, 2.674172, 1, 0, 0.8705882, 1,
1.058963, 0.2559921, 1.217567, 1, 0, 0.8627451, 1,
1.061845, -0.4894335, 1.810583, 1, 0, 0.8588235, 1,
1.067753, -1.482275, 3.139615, 1, 0, 0.8509804, 1,
1.073764, -1.94156, 2.144035, 1, 0, 0.8470588, 1,
1.075301, -1.530427, 3.800233, 1, 0, 0.8392157, 1,
1.080914, 0.3874114, 2.227277, 1, 0, 0.8352941, 1,
1.088283, -0.2146861, 1.608383, 1, 0, 0.827451, 1,
1.088565, 0.234509, 0.3980005, 1, 0, 0.8235294, 1,
1.095061, 0.9741771, 1.707506, 1, 0, 0.8156863, 1,
1.099376, 0.6290975, 2.11217, 1, 0, 0.8117647, 1,
1.102792, 0.1537525, 2.154308, 1, 0, 0.8039216, 1,
1.105667, 0.5534217, 0.4767326, 1, 0, 0.7960784, 1,
1.108877, -0.639448, 2.810288, 1, 0, 0.7921569, 1,
1.113098, -1.372801, 0.6445829, 1, 0, 0.7843137, 1,
1.114295, 0.5122759, 1.845927, 1, 0, 0.7803922, 1,
1.120707, -0.8059995, 2.777342, 1, 0, 0.772549, 1,
1.122325, -1.494614, 4.160007, 1, 0, 0.7686275, 1,
1.123498, -0.3353128, 0.674605, 1, 0, 0.7607843, 1,
1.12494, -0.320226, 1.185899, 1, 0, 0.7568628, 1,
1.132377, 0.09943137, 1.441894, 1, 0, 0.7490196, 1,
1.1335, -0.01063116, 3.454138, 1, 0, 0.7450981, 1,
1.134614, 0.9860964, 0.9550022, 1, 0, 0.7372549, 1,
1.142942, 0.1463857, 1.769392, 1, 0, 0.7333333, 1,
1.166829, -0.1565984, 2.036293, 1, 0, 0.7254902, 1,
1.167574, 1.536712, -1.437548, 1, 0, 0.7215686, 1,
1.169478, 0.7308154, -0.9093897, 1, 0, 0.7137255, 1,
1.171913, 0.9914719, 1.264642, 1, 0, 0.7098039, 1,
1.182465, -0.3109063, 1.648171, 1, 0, 0.7019608, 1,
1.185262, 1.390666, -0.3960076, 1, 0, 0.6941177, 1,
1.185279, 0.4377351, 1.09601, 1, 0, 0.6901961, 1,
1.189267, -1.790654, 2.035623, 1, 0, 0.682353, 1,
1.215176, -0.1549435, 2.381745, 1, 0, 0.6784314, 1,
1.216165, -0.5164559, 3.160617, 1, 0, 0.6705883, 1,
1.233149, 0.3828206, 0.7823781, 1, 0, 0.6666667, 1,
1.23809, 0.4327858, -0.1362081, 1, 0, 0.6588235, 1,
1.249828, 0.8168188, 0.5167027, 1, 0, 0.654902, 1,
1.26201, -1.219145, 1.596868, 1, 0, 0.6470588, 1,
1.262358, 2.404403, -0.03504503, 1, 0, 0.6431373, 1,
1.273439, -1.283196, 0.7238783, 1, 0, 0.6352941, 1,
1.275702, 0.2554398, 1.113718, 1, 0, 0.6313726, 1,
1.282586, 1.27845, 0.8693293, 1, 0, 0.6235294, 1,
1.284428, -0.6357669, 2.110898, 1, 0, 0.6196079, 1,
1.28451, 0.3458743, 2.285138, 1, 0, 0.6117647, 1,
1.288954, -0.832958, 1.914665, 1, 0, 0.6078432, 1,
1.292331, 0.2101843, 0.4195885, 1, 0, 0.6, 1,
1.295463, -0.07759157, 2.175996, 1, 0, 0.5921569, 1,
1.297067, 0.5987016, 1.780134, 1, 0, 0.5882353, 1,
1.307316, -0.6787885, 2.735863, 1, 0, 0.5803922, 1,
1.311182, -0.8764122, 3.188001, 1, 0, 0.5764706, 1,
1.311643, -0.3038459, 1.444545, 1, 0, 0.5686275, 1,
1.316098, -0.5250633, 0.254066, 1, 0, 0.5647059, 1,
1.31697, -0.616475, 1.229746, 1, 0, 0.5568628, 1,
1.328633, -0.1197371, 0.2100202, 1, 0, 0.5529412, 1,
1.331098, -1.801366, 1.524008, 1, 0, 0.5450981, 1,
1.338781, 0.06761648, 1.40029, 1, 0, 0.5411765, 1,
1.340257, 1.15955, 0.9257681, 1, 0, 0.5333334, 1,
1.354241, -0.2031994, 0.5584829, 1, 0, 0.5294118, 1,
1.355336, 0.4789018, 1.939954, 1, 0, 0.5215687, 1,
1.359442, 0.8051649, 0.4323691, 1, 0, 0.5176471, 1,
1.360891, -1.918929, 2.900846, 1, 0, 0.509804, 1,
1.361663, -0.8914946, 1.306958, 1, 0, 0.5058824, 1,
1.362185, 1.109749, 0.8937876, 1, 0, 0.4980392, 1,
1.363645, 0.1622138, 1.953017, 1, 0, 0.4901961, 1,
1.364104, 0.6524031, 0.8081017, 1, 0, 0.4862745, 1,
1.368353, 0.9416366, -0.3991927, 1, 0, 0.4784314, 1,
1.368633, 0.2309053, 0.3071972, 1, 0, 0.4745098, 1,
1.374332, -1.190694, 2.527731, 1, 0, 0.4666667, 1,
1.375913, 1.549706, 1.83443, 1, 0, 0.4627451, 1,
1.376923, 0.1116134, 1.650811, 1, 0, 0.454902, 1,
1.377641, 0.03838405, 0.7056846, 1, 0, 0.4509804, 1,
1.42195, 1.332073, 1.09946, 1, 0, 0.4431373, 1,
1.425318, 0.5579327, 1.12217, 1, 0, 0.4392157, 1,
1.428281, -0.4772536, 1.358962, 1, 0, 0.4313726, 1,
1.43266, 1.116563, 0.8354049, 1, 0, 0.427451, 1,
1.443308, -0.2890019, 2.516669, 1, 0, 0.4196078, 1,
1.44538, -0.1173149, 1.519077, 1, 0, 0.4156863, 1,
1.447406, 1.459344, 0.9453382, 1, 0, 0.4078431, 1,
1.472432, -0.8456394, 1.352755, 1, 0, 0.4039216, 1,
1.476822, -0.387658, 2.967569, 1, 0, 0.3960784, 1,
1.487452, -1.043085, 2.271469, 1, 0, 0.3882353, 1,
1.488389, 1.749895, 0.9195892, 1, 0, 0.3843137, 1,
1.503116, -1.260652, 2.599527, 1, 0, 0.3764706, 1,
1.507769, -0.1247511, 2.625856, 1, 0, 0.372549, 1,
1.518583, 0.4026496, 0.9350628, 1, 0, 0.3647059, 1,
1.536084, 0.5249319, 0.7669159, 1, 0, 0.3607843, 1,
1.559843, -1.119462, 2.125633, 1, 0, 0.3529412, 1,
1.560553, -1.136558, 2.283009, 1, 0, 0.3490196, 1,
1.561239, 2.811296, 1.664511, 1, 0, 0.3411765, 1,
1.56582, 0.6495878, 1.18908, 1, 0, 0.3372549, 1,
1.592949, -0.03448861, 2.460509, 1, 0, 0.3294118, 1,
1.593736, 0.5013973, 0.7370735, 1, 0, 0.3254902, 1,
1.594476, -1.333011, 1.888294, 1, 0, 0.3176471, 1,
1.606606, 0.7119055, 1.304564, 1, 0, 0.3137255, 1,
1.623626, 0.1630338, 0.5478221, 1, 0, 0.3058824, 1,
1.626116, 1.196675, 0.0371597, 1, 0, 0.2980392, 1,
1.653247, -0.0090231, 1.680684, 1, 0, 0.2941177, 1,
1.659522, -1.360893, 2.430013, 1, 0, 0.2862745, 1,
1.677323, -1.283966, 1.449573, 1, 0, 0.282353, 1,
1.690652, -0.4136458, 0.4668225, 1, 0, 0.2745098, 1,
1.694534, -1.181853, 2.198041, 1, 0, 0.2705882, 1,
1.706777, -0.233111, 1.742559, 1, 0, 0.2627451, 1,
1.709492, -0.3933922, 2.323951, 1, 0, 0.2588235, 1,
1.710966, -0.06431184, 0.9425482, 1, 0, 0.2509804, 1,
1.717049, -2.557815, 3.772153, 1, 0, 0.2470588, 1,
1.737937, 1.027548, 1.572011, 1, 0, 0.2392157, 1,
1.752698, 0.2865185, 0.9960446, 1, 0, 0.2352941, 1,
1.757754, 0.05727267, 2.024639, 1, 0, 0.227451, 1,
1.768316, -0.7443724, 1.25942, 1, 0, 0.2235294, 1,
1.769681, -1.460427, 2.713363, 1, 0, 0.2156863, 1,
1.775702, -0.6585481, 1.350915, 1, 0, 0.2117647, 1,
1.784634, 0.08342499, 2.94998, 1, 0, 0.2039216, 1,
1.799901, -1.044112, 3.654217, 1, 0, 0.1960784, 1,
1.814217, 0.6336043, 0.311574, 1, 0, 0.1921569, 1,
1.846412, -0.9825327, 2.89476, 1, 0, 0.1843137, 1,
1.848403, 0.1562857, 2.355169, 1, 0, 0.1803922, 1,
1.851102, -0.5441733, 2.558644, 1, 0, 0.172549, 1,
1.877954, -1.164854, 0.9659751, 1, 0, 0.1686275, 1,
1.883062, 1.171188, -0.0888928, 1, 0, 0.1607843, 1,
1.910003, -0.829226, 1.130632, 1, 0, 0.1568628, 1,
1.91043, -0.1989745, 1.484752, 1, 0, 0.1490196, 1,
1.920836, 0.2965441, 0.0516283, 1, 0, 0.145098, 1,
1.945106, -2.076515, 2.66456, 1, 0, 0.1372549, 1,
1.958697, -0.5233361, 2.840484, 1, 0, 0.1333333, 1,
1.960515, -1.314307, 2.699968, 1, 0, 0.1254902, 1,
1.997461, 0.07911597, 1.566761, 1, 0, 0.1215686, 1,
2.002565, -0.3546747, 1.615253, 1, 0, 0.1137255, 1,
2.008134, 0.00124346, -0.2557809, 1, 0, 0.1098039, 1,
2.015107, -0.0339185, 1.673299, 1, 0, 0.1019608, 1,
2.028394, 0.337663, 1.476199, 1, 0, 0.09411765, 1,
2.055697, -0.5370495, 1.478343, 1, 0, 0.09019608, 1,
2.078495, -0.3958867, 1.911805, 1, 0, 0.08235294, 1,
2.101001, 1.213665, 2.641054, 1, 0, 0.07843138, 1,
2.298218, 0.2311084, 1.921753, 1, 0, 0.07058824, 1,
2.430291, 0.05605306, 0.6062847, 1, 0, 0.06666667, 1,
2.466743, -2.306347, 2.210169, 1, 0, 0.05882353, 1,
2.543116, 1.069433, 0.7479822, 1, 0, 0.05490196, 1,
2.555422, -1.477521, 1.407102, 1, 0, 0.04705882, 1,
2.573508, -0.5070316, 1.870104, 1, 0, 0.04313726, 1,
2.588621, 1.448822, 1.476678, 1, 0, 0.03529412, 1,
2.620257, -0.03885305, 0.2656434, 1, 0, 0.03137255, 1,
2.656997, -0.8053839, 2.606056, 1, 0, 0.02352941, 1,
2.691562, 0.7104402, 1.468962, 1, 0, 0.01960784, 1,
2.90539, -0.8000054, 2.546519, 1, 0, 0.01176471, 1,
3.412814, 0.5790941, 2.497452, 1, 0, 0.007843138, 1
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
0.2072332, -3.960123, -7.788019, 0, -0.5, 0.5, 0.5,
0.2072332, -3.960123, -7.788019, 1, -0.5, 0.5, 0.5,
0.2072332, -3.960123, -7.788019, 1, 1.5, 0.5, 0.5,
0.2072332, -3.960123, -7.788019, 0, 1.5, 0.5, 0.5
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
-4.08504, -0.04686415, -7.788019, 0, -0.5, 0.5, 0.5,
-4.08504, -0.04686415, -7.788019, 1, -0.5, 0.5, 0.5,
-4.08504, -0.04686415, -7.788019, 1, 1.5, 0.5, 0.5,
-4.08504, -0.04686415, -7.788019, 0, 1.5, 0.5, 0.5
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
-4.08504, -3.960123, 0.05892086, 0, -0.5, 0.5, 0.5,
-4.08504, -3.960123, 0.05892086, 1, -0.5, 0.5, 0.5,
-4.08504, -3.960123, 0.05892086, 1, 1.5, 0.5, 0.5,
-4.08504, -3.960123, 0.05892086, 0, 1.5, 0.5, 0.5
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
-2, -3.057064, -5.977187,
3, -3.057064, -5.977187,
-2, -3.057064, -5.977187,
-2, -3.207573, -6.278992,
-1, -3.057064, -5.977187,
-1, -3.207573, -6.278992,
0, -3.057064, -5.977187,
0, -3.207573, -6.278992,
1, -3.057064, -5.977187,
1, -3.207573, -6.278992,
2, -3.057064, -5.977187,
2, -3.207573, -6.278992,
3, -3.057064, -5.977187,
3, -3.207573, -6.278992
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
-2, -3.508593, -6.882603, 0, -0.5, 0.5, 0.5,
-2, -3.508593, -6.882603, 1, -0.5, 0.5, 0.5,
-2, -3.508593, -6.882603, 1, 1.5, 0.5, 0.5,
-2, -3.508593, -6.882603, 0, 1.5, 0.5, 0.5,
-1, -3.508593, -6.882603, 0, -0.5, 0.5, 0.5,
-1, -3.508593, -6.882603, 1, -0.5, 0.5, 0.5,
-1, -3.508593, -6.882603, 1, 1.5, 0.5, 0.5,
-1, -3.508593, -6.882603, 0, 1.5, 0.5, 0.5,
0, -3.508593, -6.882603, 0, -0.5, 0.5, 0.5,
0, -3.508593, -6.882603, 1, -0.5, 0.5, 0.5,
0, -3.508593, -6.882603, 1, 1.5, 0.5, 0.5,
0, -3.508593, -6.882603, 0, 1.5, 0.5, 0.5,
1, -3.508593, -6.882603, 0, -0.5, 0.5, 0.5,
1, -3.508593, -6.882603, 1, -0.5, 0.5, 0.5,
1, -3.508593, -6.882603, 1, 1.5, 0.5, 0.5,
1, -3.508593, -6.882603, 0, 1.5, 0.5, 0.5,
2, -3.508593, -6.882603, 0, -0.5, 0.5, 0.5,
2, -3.508593, -6.882603, 1, -0.5, 0.5, 0.5,
2, -3.508593, -6.882603, 1, 1.5, 0.5, 0.5,
2, -3.508593, -6.882603, 0, 1.5, 0.5, 0.5,
3, -3.508593, -6.882603, 0, -0.5, 0.5, 0.5,
3, -3.508593, -6.882603, 1, -0.5, 0.5, 0.5,
3, -3.508593, -6.882603, 1, 1.5, 0.5, 0.5,
3, -3.508593, -6.882603, 0, 1.5, 0.5, 0.5
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
-3.094515, -2, -5.977187,
-3.094515, 2, -5.977187,
-3.094515, -2, -5.977187,
-3.259602, -2, -6.278992,
-3.094515, -1, -5.977187,
-3.259602, -1, -6.278992,
-3.094515, 0, -5.977187,
-3.259602, 0, -6.278992,
-3.094515, 1, -5.977187,
-3.259602, 1, -6.278992,
-3.094515, 2, -5.977187,
-3.259602, 2, -6.278992
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
-3.589777, -2, -6.882603, 0, -0.5, 0.5, 0.5,
-3.589777, -2, -6.882603, 1, -0.5, 0.5, 0.5,
-3.589777, -2, -6.882603, 1, 1.5, 0.5, 0.5,
-3.589777, -2, -6.882603, 0, 1.5, 0.5, 0.5,
-3.589777, -1, -6.882603, 0, -0.5, 0.5, 0.5,
-3.589777, -1, -6.882603, 1, -0.5, 0.5, 0.5,
-3.589777, -1, -6.882603, 1, 1.5, 0.5, 0.5,
-3.589777, -1, -6.882603, 0, 1.5, 0.5, 0.5,
-3.589777, 0, -6.882603, 0, -0.5, 0.5, 0.5,
-3.589777, 0, -6.882603, 1, -0.5, 0.5, 0.5,
-3.589777, 0, -6.882603, 1, 1.5, 0.5, 0.5,
-3.589777, 0, -6.882603, 0, 1.5, 0.5, 0.5,
-3.589777, 1, -6.882603, 0, -0.5, 0.5, 0.5,
-3.589777, 1, -6.882603, 1, -0.5, 0.5, 0.5,
-3.589777, 1, -6.882603, 1, 1.5, 0.5, 0.5,
-3.589777, 1, -6.882603, 0, 1.5, 0.5, 0.5,
-3.589777, 2, -6.882603, 0, -0.5, 0.5, 0.5,
-3.589777, 2, -6.882603, 1, -0.5, 0.5, 0.5,
-3.589777, 2, -6.882603, 1, 1.5, 0.5, 0.5,
-3.589777, 2, -6.882603, 0, 1.5, 0.5, 0.5
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
-3.094515, -3.057064, -4,
-3.094515, -3.057064, 4,
-3.094515, -3.057064, -4,
-3.259602, -3.207573, -4,
-3.094515, -3.057064, -2,
-3.259602, -3.207573, -2,
-3.094515, -3.057064, 0,
-3.259602, -3.207573, 0,
-3.094515, -3.057064, 2,
-3.259602, -3.207573, 2,
-3.094515, -3.057064, 4,
-3.259602, -3.207573, 4
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
-3.589777, -3.508593, -4, 0, -0.5, 0.5, 0.5,
-3.589777, -3.508593, -4, 1, -0.5, 0.5, 0.5,
-3.589777, -3.508593, -4, 1, 1.5, 0.5, 0.5,
-3.589777, -3.508593, -4, 0, 1.5, 0.5, 0.5,
-3.589777, -3.508593, -2, 0, -0.5, 0.5, 0.5,
-3.589777, -3.508593, -2, 1, -0.5, 0.5, 0.5,
-3.589777, -3.508593, -2, 1, 1.5, 0.5, 0.5,
-3.589777, -3.508593, -2, 0, 1.5, 0.5, 0.5,
-3.589777, -3.508593, 0, 0, -0.5, 0.5, 0.5,
-3.589777, -3.508593, 0, 1, -0.5, 0.5, 0.5,
-3.589777, -3.508593, 0, 1, 1.5, 0.5, 0.5,
-3.589777, -3.508593, 0, 0, 1.5, 0.5, 0.5,
-3.589777, -3.508593, 2, 0, -0.5, 0.5, 0.5,
-3.589777, -3.508593, 2, 1, -0.5, 0.5, 0.5,
-3.589777, -3.508593, 2, 1, 1.5, 0.5, 0.5,
-3.589777, -3.508593, 2, 0, 1.5, 0.5, 0.5,
-3.589777, -3.508593, 4, 0, -0.5, 0.5, 0.5,
-3.589777, -3.508593, 4, 1, -0.5, 0.5, 0.5,
-3.589777, -3.508593, 4, 1, 1.5, 0.5, 0.5,
-3.589777, -3.508593, 4, 0, 1.5, 0.5, 0.5
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
-3.094515, -3.057064, -5.977187,
-3.094515, 2.963335, -5.977187,
-3.094515, -3.057064, 6.095028,
-3.094515, 2.963335, 6.095028,
-3.094515, -3.057064, -5.977187,
-3.094515, -3.057064, 6.095028,
-3.094515, 2.963335, -5.977187,
-3.094515, 2.963335, 6.095028,
-3.094515, -3.057064, -5.977187,
3.508981, -3.057064, -5.977187,
-3.094515, -3.057064, 6.095028,
3.508981, -3.057064, 6.095028,
-3.094515, 2.963335, -5.977187,
3.508981, 2.963335, -5.977187,
-3.094515, 2.963335, 6.095028,
3.508981, 2.963335, 6.095028,
3.508981, -3.057064, -5.977187,
3.508981, 2.963335, -5.977187,
3.508981, -3.057064, 6.095028,
3.508981, 2.963335, 6.095028,
3.508981, -3.057064, -5.977187,
3.508981, -3.057064, 6.095028,
3.508981, 2.963335, -5.977187,
3.508981, 2.963335, 6.095028
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
var radius = 8.020199;
var distance = 35.68277;
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
mvMatrix.translate( -0.2072332, 0.04686415, -0.05892086 );
mvMatrix.scale( 1.313183, 1.440369, 0.7183103 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.68277);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Niclosamide<-read.table("Niclosamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Niclosamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Niclosamide' not found
```

```r
y<-Niclosamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Niclosamide' not found
```

```r
z<-Niclosamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Niclosamide' not found
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
-2.998348, 0.4017588, -2.838818, 0, 0, 1, 1, 1,
-2.961576, -1.280216, -1.744327, 1, 0, 0, 1, 1,
-2.947078, 1.762992, -1.222114, 1, 0, 0, 1, 1,
-2.656616, 0.7214826, 0.6786424, 1, 0, 0, 1, 1,
-2.555202, 1.296778, -1.659025, 1, 0, 0, 1, 1,
-2.491896, -0.4155109, -1.712457, 1, 0, 0, 1, 1,
-2.445255, -0.4285688, -2.277297, 0, 0, 0, 1, 1,
-2.439076, 0.6086426, -0.7930585, 0, 0, 0, 1, 1,
-2.405586, -2.229047, -2.875982, 0, 0, 0, 1, 1,
-2.391829, -0.310384, -3.483761, 0, 0, 0, 1, 1,
-2.287074, -0.4087481, 0.6441551, 0, 0, 0, 1, 1,
-2.256276, 0.3826025, -2.547641, 0, 0, 0, 1, 1,
-2.238081, -2.02463, -1.351044, 0, 0, 0, 1, 1,
-2.212484, -0.605487, -1.712019, 1, 1, 1, 1, 1,
-2.20596, 0.7131268, -1.088211, 1, 1, 1, 1, 1,
-2.156331, 0.2864371, -2.983768, 1, 1, 1, 1, 1,
-2.14864, -0.6756321, -1.487801, 1, 1, 1, 1, 1,
-2.1413, -0.2365119, -0.6320367, 1, 1, 1, 1, 1,
-2.087209, 0.4438139, -0.5080745, 1, 1, 1, 1, 1,
-2.075575, -0.2961599, -0.5795867, 1, 1, 1, 1, 1,
-2.071199, -0.5718638, -1.224146, 1, 1, 1, 1, 1,
-2.020561, -1.385897, -0.3360687, 1, 1, 1, 1, 1,
-2.008598, 0.6398434, -1.853476, 1, 1, 1, 1, 1,
-1.962534, -1.210497, 0.3389474, 1, 1, 1, 1, 1,
-1.94598, 0.1387753, -1.268134, 1, 1, 1, 1, 1,
-1.94318, 1.590385, -0.7864701, 1, 1, 1, 1, 1,
-1.903047, 0.00647007, -1.370588, 1, 1, 1, 1, 1,
-1.901896, 0.5038143, -3.302509, 1, 1, 1, 1, 1,
-1.877343, 0.7243041, -1.408926, 0, 0, 1, 1, 1,
-1.849039, 0.03905881, -2.52799, 1, 0, 0, 1, 1,
-1.827686, -0.8017642, -2.967672, 1, 0, 0, 1, 1,
-1.821754, -0.2326999, -2.960689, 1, 0, 0, 1, 1,
-1.818828, 1.924396, -0.9910445, 1, 0, 0, 1, 1,
-1.812689, 1.784401, -0.4866005, 1, 0, 0, 1, 1,
-1.796841, 0.6065136, -1.437405, 0, 0, 0, 1, 1,
-1.791864, 0.01315695, -1.258372, 0, 0, 0, 1, 1,
-1.79086, 0.3021537, -2.757692, 0, 0, 0, 1, 1,
-1.784188, -2.643325, -1.8401, 0, 0, 0, 1, 1,
-1.77378, 0.2420061, -1.569086, 0, 0, 0, 1, 1,
-1.768907, -1.773032, -1.259433, 0, 0, 0, 1, 1,
-1.738184, 0.9909725, -0.4974056, 0, 0, 0, 1, 1,
-1.730232, -1.942314, -2.51094, 1, 1, 1, 1, 1,
-1.704045, -1.390189, -3.878894, 1, 1, 1, 1, 1,
-1.657053, 0.2608094, -1.216985, 1, 1, 1, 1, 1,
-1.649687, -0.3672802, -1.296744, 1, 1, 1, 1, 1,
-1.642149, -1.687595, -3.407326, 1, 1, 1, 1, 1,
-1.631644, -0.5557819, -0.05918011, 1, 1, 1, 1, 1,
-1.602901, -1.167332, -1.841143, 1, 1, 1, 1, 1,
-1.588844, 0.2724037, -1.182694, 1, 1, 1, 1, 1,
-1.580182, 0.02855125, -1.789128, 1, 1, 1, 1, 1,
-1.56776, 0.3515759, -2.031139, 1, 1, 1, 1, 1,
-1.565779, -0.2707117, -1.734634, 1, 1, 1, 1, 1,
-1.552103, 0.9021647, 2.005203, 1, 1, 1, 1, 1,
-1.542331, -0.3726733, -0.6668056, 1, 1, 1, 1, 1,
-1.536882, 2.125865, 1.587018, 1, 1, 1, 1, 1,
-1.531518, -1.225817, -2.628014, 1, 1, 1, 1, 1,
-1.517455, 0.9447162, -0.3371152, 0, 0, 1, 1, 1,
-1.517428, 2.562325, -0.8880367, 1, 0, 0, 1, 1,
-1.49789, -1.018565, -2.843416, 1, 0, 0, 1, 1,
-1.492433, -1.358582, -2.23345, 1, 0, 0, 1, 1,
-1.490873, -1.020972, -2.614756, 1, 0, 0, 1, 1,
-1.480675, -1.559467, -2.298029, 1, 0, 0, 1, 1,
-1.476847, 1.049979, -0.9214087, 0, 0, 0, 1, 1,
-1.474672, 0.5207221, -2.011583, 0, 0, 0, 1, 1,
-1.468737, -0.6724359, -2.763697, 0, 0, 0, 1, 1,
-1.468328, 0.339857, -0.3295686, 0, 0, 0, 1, 1,
-1.465896, -0.8423116, -2.626522, 0, 0, 0, 1, 1,
-1.450807, -1.283779, -1.901723, 0, 0, 0, 1, 1,
-1.447934, 0.1566429, -1.027443, 0, 0, 0, 1, 1,
-1.431707, 1.302979, -0.8263879, 1, 1, 1, 1, 1,
-1.420919, 1.079103, 0.3202801, 1, 1, 1, 1, 1,
-1.41658, 0.6170666, -3.273027, 1, 1, 1, 1, 1,
-1.412771, 2.061032, -2.292416, 1, 1, 1, 1, 1,
-1.403569, 1.193711, -1.227273, 1, 1, 1, 1, 1,
-1.402808, 1.170297, -2.34388, 1, 1, 1, 1, 1,
-1.393107, -0.5384733, -0.8994709, 1, 1, 1, 1, 1,
-1.390809, 1.035887, -0.8851848, 1, 1, 1, 1, 1,
-1.385128, -0.03201816, -1.042822, 1, 1, 1, 1, 1,
-1.384963, 0.0861506, -2.358868, 1, 1, 1, 1, 1,
-1.377811, 0.5043952, -0.6720812, 1, 1, 1, 1, 1,
-1.374568, 0.3305797, -0.2725733, 1, 1, 1, 1, 1,
-1.365581, -1.12233, -0.8487254, 1, 1, 1, 1, 1,
-1.349418, -0.6676342, -1.906337, 1, 1, 1, 1, 1,
-1.346887, 0.3200321, -1.816796, 1, 1, 1, 1, 1,
-1.339555, -0.2979484, -0.9114625, 0, 0, 1, 1, 1,
-1.339126, 0.3807489, 1.233091, 1, 0, 0, 1, 1,
-1.332424, 1.225387, -1.503888, 1, 0, 0, 1, 1,
-1.325457, 0.9400029, -0.6896652, 1, 0, 0, 1, 1,
-1.322359, 0.9696996, -0.315171, 1, 0, 0, 1, 1,
-1.314897, 1.206135, -0.7602733, 1, 0, 0, 1, 1,
-1.30624, 0.02269924, -1.065157, 0, 0, 0, 1, 1,
-1.302417, 2.396706, -0.4651265, 0, 0, 0, 1, 1,
-1.292654, 1.815847, -0.934177, 0, 0, 0, 1, 1,
-1.287456, -0.515395, -1.470798, 0, 0, 0, 1, 1,
-1.277169, 0.6253668, -2.52492, 0, 0, 0, 1, 1,
-1.262899, -0.6366509, -2.107697, 0, 0, 0, 1, 1,
-1.261216, -0.8044961, -2.478091, 0, 0, 0, 1, 1,
-1.256551, -0.213381, -4.34278, 1, 1, 1, 1, 1,
-1.254518, -0.9207655, -4.202495, 1, 1, 1, 1, 1,
-1.244995, 1.746441, 0.01863758, 1, 1, 1, 1, 1,
-1.240699, 0.7260996, -0.8260227, 1, 1, 1, 1, 1,
-1.239687, -0.4675, -1.746108, 1, 1, 1, 1, 1,
-1.237871, -0.2453142, -1.748301, 1, 1, 1, 1, 1,
-1.237108, 1.139272, -0.9123136, 1, 1, 1, 1, 1,
-1.236001, -0.7710649, -2.310667, 1, 1, 1, 1, 1,
-1.230934, -1.157955, -3.211345, 1, 1, 1, 1, 1,
-1.226092, 0.520748, -4.428538, 1, 1, 1, 1, 1,
-1.225714, -0.2337736, -0.05723637, 1, 1, 1, 1, 1,
-1.222578, -0.05986981, -1.128981, 1, 1, 1, 1, 1,
-1.206432, 1.642287, -0.2972609, 1, 1, 1, 1, 1,
-1.205933, -0.2377985, -1.233594, 1, 1, 1, 1, 1,
-1.20034, -0.2072795, -3.575424, 1, 1, 1, 1, 1,
-1.198565, -0.3019096, -1.365432, 0, 0, 1, 1, 1,
-1.196823, -0.5788714, -0.6218151, 1, 0, 0, 1, 1,
-1.195276, 0.9167147, 0.1480048, 1, 0, 0, 1, 1,
-1.194869, -0.4981271, -0.6216105, 1, 0, 0, 1, 1,
-1.189558, -0.7336114, -1.739851, 1, 0, 0, 1, 1,
-1.18695, 0.2478368, -1.556618, 1, 0, 0, 1, 1,
-1.183854, 0.238709, -3.276589, 0, 0, 0, 1, 1,
-1.171101, -0.7952384, -1.971843, 0, 0, 0, 1, 1,
-1.162696, -0.5809141, -1.494036, 0, 0, 0, 1, 1,
-1.158245, 0.4334147, -1.886339, 0, 0, 0, 1, 1,
-1.156709, 0.004458271, -2.836563, 0, 0, 0, 1, 1,
-1.154517, -1.080871, -3.112813, 0, 0, 0, 1, 1,
-1.152867, 0.5478329, -2.153331, 0, 0, 0, 1, 1,
-1.150654, -0.1811117, -0.5450759, 1, 1, 1, 1, 1,
-1.143416, -1.070462, -3.799034, 1, 1, 1, 1, 1,
-1.143251, 1.122465, -0.5214797, 1, 1, 1, 1, 1,
-1.140768, 0.9887506, -1.512755, 1, 1, 1, 1, 1,
-1.131914, 0.8431501, -1.504595, 1, 1, 1, 1, 1,
-1.130336, -1.230172, -2.527032, 1, 1, 1, 1, 1,
-1.129752, -0.0405674, 1.13036, 1, 1, 1, 1, 1,
-1.128613, -0.7969455, -2.601871, 1, 1, 1, 1, 1,
-1.127186, -0.07242365, -0.3938037, 1, 1, 1, 1, 1,
-1.126571, 0.06402788, -2.005052, 1, 1, 1, 1, 1,
-1.12446, -1.202803, -1.752842, 1, 1, 1, 1, 1,
-1.121584, -0.7783231, -2.880729, 1, 1, 1, 1, 1,
-1.117682, -0.9687547, -3.103941, 1, 1, 1, 1, 1,
-1.114192, -0.4792138, -1.792719, 1, 1, 1, 1, 1,
-1.088943, -0.2727365, -0.225973, 1, 1, 1, 1, 1,
-1.08837, -0.5072723, -2.542604, 0, 0, 1, 1, 1,
-1.088207, -0.4702426, -2.446163, 1, 0, 0, 1, 1,
-1.085222, -0.8510686, -3.149405, 1, 0, 0, 1, 1,
-1.071045, -0.3788559, -1.655286, 1, 0, 0, 1, 1,
-1.070175, -1.495127, -2.148686, 1, 0, 0, 1, 1,
-1.069164, 1.28161, -0.8273512, 1, 0, 0, 1, 1,
-1.063221, 0.8894494, -1.248556, 0, 0, 0, 1, 1,
-1.059667, -0.7781798, -0.766162, 0, 0, 0, 1, 1,
-1.057844, 0.4643289, -2.42874, 0, 0, 0, 1, 1,
-1.056073, 2.618825, 0.5370129, 0, 0, 0, 1, 1,
-1.049774, -0.234801, -0.2055379, 0, 0, 0, 1, 1,
-1.047076, 0.1100321, -1.23591, 0, 0, 0, 1, 1,
-1.046562, 1.743262, 1.75495, 0, 0, 0, 1, 1,
-1.039918, 1.823537, -0.7435306, 1, 1, 1, 1, 1,
-1.035199, 0.2194465, -0.2101877, 1, 1, 1, 1, 1,
-1.033856, -0.3690109, -2.33821, 1, 1, 1, 1, 1,
-1.032849, -1.252975, -1.464799, 1, 1, 1, 1, 1,
-1.032801, 1.455085, 0.9117103, 1, 1, 1, 1, 1,
-1.031158, -0.691415, -2.773977, 1, 1, 1, 1, 1,
-1.021319, -1.882192, -3.90937, 1, 1, 1, 1, 1,
-1.011741, 0.8662007, -0.3763455, 1, 1, 1, 1, 1,
-1.006541, 0.01560212, -2.07636, 1, 1, 1, 1, 1,
-0.9953353, 0.07428647, -2.232086, 1, 1, 1, 1, 1,
-0.9952084, 1.390548, -0.9187672, 1, 1, 1, 1, 1,
-0.9886252, -0.5926365, -0.5949144, 1, 1, 1, 1, 1,
-0.9869088, 0.2205145, -1.202498, 1, 1, 1, 1, 1,
-0.9830842, 0.8605134, -0.5974773, 1, 1, 1, 1, 1,
-0.9809695, 0.1463641, -1.461086, 1, 1, 1, 1, 1,
-0.9716505, -0.0590514, -3.129102, 0, 0, 1, 1, 1,
-0.9642261, -0.2585269, -3.05921, 1, 0, 0, 1, 1,
-0.9634038, 0.3780441, -0.6541499, 1, 0, 0, 1, 1,
-0.9599162, -0.6143206, -2.518708, 1, 0, 0, 1, 1,
-0.9574682, 0.5969533, 0.007628003, 1, 0, 0, 1, 1,
-0.9553061, 0.7054826, 1.184849, 1, 0, 0, 1, 1,
-0.953073, -0.6295334, -1.687627, 0, 0, 0, 1, 1,
-0.9483356, 0.2526979, -1.339382, 0, 0, 0, 1, 1,
-0.9409027, 0.3499062, 0.6786499, 0, 0, 0, 1, 1,
-0.9368955, -2.001862, -2.134232, 0, 0, 0, 1, 1,
-0.9364746, -1.230209, -3.317682, 0, 0, 0, 1, 1,
-0.9360172, -0.1780956, -2.588272, 0, 0, 0, 1, 1,
-0.9310324, -1.424117, -3.383629, 0, 0, 0, 1, 1,
-0.9128196, -0.1702355, -1.298632, 1, 1, 1, 1, 1,
-0.8991103, -1.65522, -2.409352, 1, 1, 1, 1, 1,
-0.8973227, 0.5539661, -2.593975, 1, 1, 1, 1, 1,
-0.8950227, 0.301434, -2.571759, 1, 1, 1, 1, 1,
-0.8851366, 0.5594763, 0.7578135, 1, 1, 1, 1, 1,
-0.8847826, 0.2771167, -0.1715273, 1, 1, 1, 1, 1,
-0.8762748, 0.1696278, -2.244903, 1, 1, 1, 1, 1,
-0.8699549, 2.809358, -0.6395257, 1, 1, 1, 1, 1,
-0.8639005, -1.539366, -2.050442, 1, 1, 1, 1, 1,
-0.8603951, -0.3146649, -1.335128, 1, 1, 1, 1, 1,
-0.8521142, 1.977325, -2.623574, 1, 1, 1, 1, 1,
-0.8520321, 0.3707307, -3.354674, 1, 1, 1, 1, 1,
-0.8485032, -1.934533, -4.249238, 1, 1, 1, 1, 1,
-0.8478523, 0.1665893, -2.409661, 1, 1, 1, 1, 1,
-0.8473266, -0.3929247, -1.217685, 1, 1, 1, 1, 1,
-0.847106, 0.2321291, -2.661354, 0, 0, 1, 1, 1,
-0.8464261, 0.8489844, -0.3056205, 1, 0, 0, 1, 1,
-0.8445915, -1.278442, -1.748013, 1, 0, 0, 1, 1,
-0.8280613, -2.326374, -1.480259, 1, 0, 0, 1, 1,
-0.823275, 0.3974327, -1.555633, 1, 0, 0, 1, 1,
-0.8161516, -0.02072963, -2.791357, 1, 0, 0, 1, 1,
-0.8148575, 1.532142, 0.6564906, 0, 0, 0, 1, 1,
-0.8129377, 0.529812, -0.2835448, 0, 0, 0, 1, 1,
-0.8100643, -0.9527411, -2.197214, 0, 0, 0, 1, 1,
-0.8096003, -0.8926532, -3.453086, 0, 0, 0, 1, 1,
-0.8061188, -1.291723, -2.525551, 0, 0, 0, 1, 1,
-0.8043266, 2.131624, -1.572884, 0, 0, 0, 1, 1,
-0.7986423, -0.7250527, -3.570917, 0, 0, 0, 1, 1,
-0.7968385, 1.025416, 0.4293963, 1, 1, 1, 1, 1,
-0.7940527, -0.7296391, -1.590559, 1, 1, 1, 1, 1,
-0.7873029, -1.562265, -0.9250078, 1, 1, 1, 1, 1,
-0.7816442, -0.4353397, -1.20384, 1, 1, 1, 1, 1,
-0.7735171, -0.2475553, -0.1375517, 1, 1, 1, 1, 1,
-0.7732248, 1.182657, -0.7841275, 1, 1, 1, 1, 1,
-0.7703314, 0.4436139, -2.311882, 1, 1, 1, 1, 1,
-0.7584433, 1.988431, -2.14668, 1, 1, 1, 1, 1,
-0.7435723, 0.9780157, -0.5993937, 1, 1, 1, 1, 1,
-0.7426214, -0.4292659, -3.470679, 1, 1, 1, 1, 1,
-0.7334797, -0.7267195, -3.087357, 1, 1, 1, 1, 1,
-0.7304552, -1.271845, -2.865887, 1, 1, 1, 1, 1,
-0.7303134, -0.3873217, -1.235969, 1, 1, 1, 1, 1,
-0.725758, 1.20582, -0.6025705, 1, 1, 1, 1, 1,
-0.7252089, -2.441569, -2.91213, 1, 1, 1, 1, 1,
-0.7182599, -0.8545292, -1.427713, 0, 0, 1, 1, 1,
-0.7175707, -0.4196682, -4.021292, 1, 0, 0, 1, 1,
-0.7154258, 0.257636, -2.096486, 1, 0, 0, 1, 1,
-0.711454, -0.712755, -3.021366, 1, 0, 0, 1, 1,
-0.7107426, 1.383831, -0.5640678, 1, 0, 0, 1, 1,
-0.70945, 1.709779, -1.76303, 1, 0, 0, 1, 1,
-0.7027311, 0.01252401, -0.6002443, 0, 0, 0, 1, 1,
-0.6948724, -1.490307, -3.351082, 0, 0, 0, 1, 1,
-0.6933393, 0.5659065, -1.909836, 0, 0, 0, 1, 1,
-0.6932771, -0.8509032, -3.584733, 0, 0, 0, 1, 1,
-0.6931702, -0.5611982, -2.619192, 0, 0, 0, 1, 1,
-0.6855141, 0.6330544, 0.08978975, 0, 0, 0, 1, 1,
-0.6832643, 1.150572, -1.130248, 0, 0, 0, 1, 1,
-0.6824461, -0.2346182, -2.176065, 1, 1, 1, 1, 1,
-0.674266, -1.80501, -3.853384, 1, 1, 1, 1, 1,
-0.6742046, -0.3782186, -2.799753, 1, 1, 1, 1, 1,
-0.6733903, -0.07295521, -1.998846, 1, 1, 1, 1, 1,
-0.6727682, -1.613861, -3.571713, 1, 1, 1, 1, 1,
-0.6701544, -1.251228, -0.9584598, 1, 1, 1, 1, 1,
-0.6700232, -1.322565, -2.020434, 1, 1, 1, 1, 1,
-0.6668565, 0.2815487, -0.6598683, 1, 1, 1, 1, 1,
-0.6632963, -0.7246829, -5.801378, 1, 1, 1, 1, 1,
-0.6623273, 0.9716251, -2.781791, 1, 1, 1, 1, 1,
-0.6593181, 0.03383797, -1.693256, 1, 1, 1, 1, 1,
-0.6581446, -0.830391, -2.892915, 1, 1, 1, 1, 1,
-0.6501899, 0.9115423, -0.4856164, 1, 1, 1, 1, 1,
-0.6490149, 0.04742412, -1.648628, 1, 1, 1, 1, 1,
-0.6471668, -0.756391, -2.006416, 1, 1, 1, 1, 1,
-0.6458888, 1.400086, 0.0788942, 0, 0, 1, 1, 1,
-0.639085, -0.8061112, -3.938797, 1, 0, 0, 1, 1,
-0.6387197, 0.6038333, -0.9812719, 1, 0, 0, 1, 1,
-0.6386549, -0.7044983, -2.860284, 1, 0, 0, 1, 1,
-0.6339896, 0.2264397, -1.283391, 1, 0, 0, 1, 1,
-0.6307778, 1.259403, -1.235722, 1, 0, 0, 1, 1,
-0.6244275, -0.9989898, -3.327079, 0, 0, 0, 1, 1,
-0.6203445, -1.724658, -3.582282, 0, 0, 0, 1, 1,
-0.6172196, 0.5012656, -2.510005, 0, 0, 0, 1, 1,
-0.6139975, 2.132646, -1.839816, 0, 0, 0, 1, 1,
-0.6076459, 0.6889693, 0.3905892, 0, 0, 0, 1, 1,
-0.6056472, 1.608017, -1.442586, 0, 0, 0, 1, 1,
-0.6045011, -0.3281665, -2.61661, 0, 0, 0, 1, 1,
-0.6037472, 0.7764902, -0.1132808, 1, 1, 1, 1, 1,
-0.6004152, 1.63053, -1.143641, 1, 1, 1, 1, 1,
-0.5952826, 2.175204, -1.475289, 1, 1, 1, 1, 1,
-0.5938859, -1.328962, -4.070622, 1, 1, 1, 1, 1,
-0.5910304, -0.113632, -1.412615, 1, 1, 1, 1, 1,
-0.5878413, -0.09428681, 0.5430676, 1, 1, 1, 1, 1,
-0.5875719, 0.3707135, -0.5444628, 1, 1, 1, 1, 1,
-0.5862875, -1.150396, -3.291602, 1, 1, 1, 1, 1,
-0.5862128, 1.174405, -0.3015102, 1, 1, 1, 1, 1,
-0.571245, 0.5623777, -2.286177, 1, 1, 1, 1, 1,
-0.5709282, -0.3364658, -2.184242, 1, 1, 1, 1, 1,
-0.5678045, 0.8695419, -1.252019, 1, 1, 1, 1, 1,
-0.5644397, 0.3038531, 0.3828407, 1, 1, 1, 1, 1,
-0.5621769, -2.016972, -3.214574, 1, 1, 1, 1, 1,
-0.5569376, -1.895946, -1.3705, 1, 1, 1, 1, 1,
-0.5542254, 0.7108393, 0.03269696, 0, 0, 1, 1, 1,
-0.5490997, 0.3783245, -1.556544, 1, 0, 0, 1, 1,
-0.5447504, 1.648974, -0.4817737, 1, 0, 0, 1, 1,
-0.538845, -1.386531, -2.068784, 1, 0, 0, 1, 1,
-0.5367646, 0.156799, -1.164545, 1, 0, 0, 1, 1,
-0.5344915, -0.6650085, -2.365461, 1, 0, 0, 1, 1,
-0.5326956, -0.06585692, -1.66715, 0, 0, 0, 1, 1,
-0.5319057, -1.09689, -3.43261, 0, 0, 0, 1, 1,
-0.5312758, 0.4727029, -1.918797, 0, 0, 0, 1, 1,
-0.5275205, 0.2026955, -0.5462772, 0, 0, 0, 1, 1,
-0.5271385, 1.900246, -0.6462932, 0, 0, 0, 1, 1,
-0.5187024, -0.9644633, -2.149373, 0, 0, 0, 1, 1,
-0.5183167, -0.05595728, -0.3687005, 0, 0, 0, 1, 1,
-0.5134794, 0.07851157, -2.132254, 1, 1, 1, 1, 1,
-0.5081924, -1.495166, -2.212142, 1, 1, 1, 1, 1,
-0.5079598, 0.3426927, -0.6315012, 1, 1, 1, 1, 1,
-0.5064985, 1.229998, -0.3532948, 1, 1, 1, 1, 1,
-0.5036454, 0.6724128, 0.9483783, 1, 1, 1, 1, 1,
-0.4995466, 0.8248808, -0.381965, 1, 1, 1, 1, 1,
-0.4976496, 0.8004804, -0.007173369, 1, 1, 1, 1, 1,
-0.4965857, 0.197943, -0.6162514, 1, 1, 1, 1, 1,
-0.4958292, 1.308763, 0.8609581, 1, 1, 1, 1, 1,
-0.4952525, 1.896963, 0.8510072, 1, 1, 1, 1, 1,
-0.4940657, 0.07676411, -2.275214, 1, 1, 1, 1, 1,
-0.4931535, 0.3275938, -1.166961, 1, 1, 1, 1, 1,
-0.4828759, 1.465781, -2.72082, 1, 1, 1, 1, 1,
-0.481693, 0.263921, -0.2629502, 1, 1, 1, 1, 1,
-0.4758329, -0.3951607, -0.9600528, 1, 1, 1, 1, 1,
-0.4669451, 0.09405328, -1.814516, 0, 0, 1, 1, 1,
-0.4659299, 1.165443, -0.05202122, 1, 0, 0, 1, 1,
-0.4638942, 2.875659, -0.1089757, 1, 0, 0, 1, 1,
-0.4635457, -0.8271417, -3.380771, 1, 0, 0, 1, 1,
-0.4507432, 1.783502, 1.104164, 1, 0, 0, 1, 1,
-0.4507157, -0.4290908, -2.907684, 1, 0, 0, 1, 1,
-0.450038, -0.4859456, -3.561884, 0, 0, 0, 1, 1,
-0.4487974, -0.6637062, -1.872578, 0, 0, 0, 1, 1,
-0.4478467, 1.105664, -1.706996, 0, 0, 0, 1, 1,
-0.4465974, -0.5541463, -2.647952, 0, 0, 0, 1, 1,
-0.4440022, -0.8416306, -2.166121, 0, 0, 0, 1, 1,
-0.4362999, 0.742036, 0.4106602, 0, 0, 0, 1, 1,
-0.4280606, 1.036997, -1.693541, 0, 0, 0, 1, 1,
-0.4240116, -0.6802801, -4.078491, 1, 1, 1, 1, 1,
-0.4230344, 0.2723132, -1.110973, 1, 1, 1, 1, 1,
-0.4154149, -0.979664, -2.208333, 1, 1, 1, 1, 1,
-0.4100294, -0.5519, -2.580161, 1, 1, 1, 1, 1,
-0.4091763, 0.6508286, -0.3782136, 1, 1, 1, 1, 1,
-0.403332, -1.425849, -2.981391, 1, 1, 1, 1, 1,
-0.4014424, -1.11364, -4.109004, 1, 1, 1, 1, 1,
-0.4009707, -0.9266805, -1.939176, 1, 1, 1, 1, 1,
-0.3988135, 1.092561, -0.9393989, 1, 1, 1, 1, 1,
-0.3967152, -0.8779309, -3.013631, 1, 1, 1, 1, 1,
-0.3966409, -0.3632178, -3.18644, 1, 1, 1, 1, 1,
-0.3961594, 0.1166602, 0.06312066, 1, 1, 1, 1, 1,
-0.3874986, 1.099756, -0.05022034, 1, 1, 1, 1, 1,
-0.3841446, -0.1702723, -0.2418928, 1, 1, 1, 1, 1,
-0.3831622, 1.449589, 0.3184789, 1, 1, 1, 1, 1,
-0.3825471, 0.6395847, -2.794997, 0, 0, 1, 1, 1,
-0.3796168, -0.1101598, -2.086624, 1, 0, 0, 1, 1,
-0.3787558, -0.5466855, -0.6421379, 1, 0, 0, 1, 1,
-0.3726443, 0.7163847, -0.7255752, 1, 0, 0, 1, 1,
-0.3719235, -0.9737012, -2.615932, 1, 0, 0, 1, 1,
-0.3670721, 0.1770517, -1.63603, 1, 0, 0, 1, 1,
-0.3669119, 1.07215, 0.4858026, 0, 0, 0, 1, 1,
-0.3616352, -0.9866305, -3.014991, 0, 0, 0, 1, 1,
-0.3588213, -0.02759317, -2.871584, 0, 0, 0, 1, 1,
-0.3579035, 1.087961, -1.085173, 0, 0, 0, 1, 1,
-0.3529215, -1.238772, -5.515106, 0, 0, 0, 1, 1,
-0.3482645, 1.527553, -0.7140452, 0, 0, 0, 1, 1,
-0.3473934, -0.4019186, -1.293945, 0, 0, 0, 1, 1,
-0.3451926, -0.126582, -3.936413, 1, 1, 1, 1, 1,
-0.3422605, -0.4548012, -2.893878, 1, 1, 1, 1, 1,
-0.3349, 1.788167, 0.449254, 1, 1, 1, 1, 1,
-0.3329442, -0.3096473, -1.194173, 1, 1, 1, 1, 1,
-0.328852, 0.883185, -1.522663, 1, 1, 1, 1, 1,
-0.3273132, -1.403829, -0.9509605, 1, 1, 1, 1, 1,
-0.3268692, -0.01973588, -2.05061, 1, 1, 1, 1, 1,
-0.3229857, 0.06830984, -0.5965227, 1, 1, 1, 1, 1,
-0.3205203, 1.700388, -1.829931, 1, 1, 1, 1, 1,
-0.3193228, -0.7067543, -2.39995, 1, 1, 1, 1, 1,
-0.3182808, 1.517042, 0.4884886, 1, 1, 1, 1, 1,
-0.3141785, 1.111935, -1.344536, 1, 1, 1, 1, 1,
-0.3057988, -0.3538269, -3.497712, 1, 1, 1, 1, 1,
-0.2951156, -1.693627, -2.973336, 1, 1, 1, 1, 1,
-0.2898303, 0.9361515, 0.2978961, 1, 1, 1, 1, 1,
-0.2813399, -0.5823071, -2.486342, 0, 0, 1, 1, 1,
-0.2788081, 0.8056479, -0.8111129, 1, 0, 0, 1, 1,
-0.2771799, -0.871632, -2.363435, 1, 0, 0, 1, 1,
-0.274322, 1.271838, -0.2443514, 1, 0, 0, 1, 1,
-0.2728958, 1.167633, 1.927422, 1, 0, 0, 1, 1,
-0.2525995, 0.4966289, 0.723752, 1, 0, 0, 1, 1,
-0.2446234, 0.6328671, 0.211579, 0, 0, 0, 1, 1,
-0.243739, -0.4596405, -2.656337, 0, 0, 0, 1, 1,
-0.2430528, -0.2640865, -1.935166, 0, 0, 0, 1, 1,
-0.2418175, 2.539563, -0.1228048, 0, 0, 0, 1, 1,
-0.2410471, 0.6045351, -1.475963, 0, 0, 0, 1, 1,
-0.2352169, 0.3255037, -0.8750123, 0, 0, 0, 1, 1,
-0.2346641, -0.7808754, -2.248441, 0, 0, 0, 1, 1,
-0.2334896, 0.6850137, 1.386634, 1, 1, 1, 1, 1,
-0.2328771, -1.359615, -2.985501, 1, 1, 1, 1, 1,
-0.2293489, -2.050294, -3.665423, 1, 1, 1, 1, 1,
-0.2277707, -0.6214873, -2.848881, 1, 1, 1, 1, 1,
-0.219704, 0.3962988, -0.3348045, 1, 1, 1, 1, 1,
-0.2188045, -0.6880696, -3.652072, 1, 1, 1, 1, 1,
-0.2183623, 0.1721243, -0.4508883, 1, 1, 1, 1, 1,
-0.2166478, 2.198525, 0.228058, 1, 1, 1, 1, 1,
-0.2151671, 1.059147, 0.2907446, 1, 1, 1, 1, 1,
-0.2112167, -0.5340909, -1.107281, 1, 1, 1, 1, 1,
-0.2087683, -0.2910535, -1.677032, 1, 1, 1, 1, 1,
-0.2000558, -0.7347649, -2.933808, 1, 1, 1, 1, 1,
-0.1994833, 0.8799851, -0.8680665, 1, 1, 1, 1, 1,
-0.1986117, -1.37228, -3.488832, 1, 1, 1, 1, 1,
-0.1978828, 0.9695954, 0.192292, 1, 1, 1, 1, 1,
-0.196825, -0.816871, -2.364426, 0, 0, 1, 1, 1,
-0.1931691, 1.462569, -0.2840018, 1, 0, 0, 1, 1,
-0.1928623, -0.256474, -1.661625, 1, 0, 0, 1, 1,
-0.1886151, -0.02643692, -1.392864, 1, 0, 0, 1, 1,
-0.1886005, 0.6447107, -1.925913, 1, 0, 0, 1, 1,
-0.1848202, 0.04544899, -2.69137, 1, 0, 0, 1, 1,
-0.1842456, 0.8353382, -0.04818149, 0, 0, 0, 1, 1,
-0.1836959, 1.360284, 0.223734, 0, 0, 0, 1, 1,
-0.1836208, 0.4820968, 1.329121, 0, 0, 0, 1, 1,
-0.182157, -0.7603063, -1.383208, 0, 0, 0, 1, 1,
-0.1820378, -0.9542688, -3.250397, 0, 0, 0, 1, 1,
-0.1769817, -0.03985282, -1.647312, 0, 0, 0, 1, 1,
-0.1760255, -0.2469097, -2.00497, 0, 0, 0, 1, 1,
-0.1743178, -0.6724917, -3.028439, 1, 1, 1, 1, 1,
-0.1742467, 0.1283161, -1.916805, 1, 1, 1, 1, 1,
-0.174192, 0.2796119, -0.3396719, 1, 1, 1, 1, 1,
-0.1736206, 2.082552, -1.264732, 1, 1, 1, 1, 1,
-0.1698479, -0.3789136, -1.376826, 1, 1, 1, 1, 1,
-0.1671876, -0.3854566, -1.982676, 1, 1, 1, 1, 1,
-0.1639569, 2.290585, -1.233931, 1, 1, 1, 1, 1,
-0.1636387, -1.671411, -5.318686, 1, 1, 1, 1, 1,
-0.1634618, -0.3886539, -2.793455, 1, 1, 1, 1, 1,
-0.1625355, 1.230567, 0.6635147, 1, 1, 1, 1, 1,
-0.1579926, -1.150535, -3.613723, 1, 1, 1, 1, 1,
-0.15758, 0.8204142, -0.0197189, 1, 1, 1, 1, 1,
-0.1575171, -0.7239037, -2.393039, 1, 1, 1, 1, 1,
-0.1568061, 1.418263, -0.6949071, 1, 1, 1, 1, 1,
-0.156249, 1.380242, -1.390432, 1, 1, 1, 1, 1,
-0.1540306, 0.6594551, -1.759736, 0, 0, 1, 1, 1,
-0.150124, -0.2667594, -0.2959585, 1, 0, 0, 1, 1,
-0.1497634, -0.1763818, -1.760936, 1, 0, 0, 1, 1,
-0.1476651, 1.114722, 0.3684172, 1, 0, 0, 1, 1,
-0.1457835, 0.04913474, -2.445567, 1, 0, 0, 1, 1,
-0.1451904, 0.430404, 0.420472, 1, 0, 0, 1, 1,
-0.1403665, 0.3492101, -0.1395368, 0, 0, 0, 1, 1,
-0.138354, 0.7337529, 0.01743893, 0, 0, 0, 1, 1,
-0.1380125, -2.410888, -3.303364, 0, 0, 0, 1, 1,
-0.1377344, 1.030324, 0.8419373, 0, 0, 0, 1, 1,
-0.133933, -0.2850416, -4.072112, 0, 0, 0, 1, 1,
-0.1322978, 0.1041859, -3.162238, 0, 0, 0, 1, 1,
-0.1301759, -0.4194967, -2.002419, 0, 0, 0, 1, 1,
-0.1296473, 0.4966012, 0.294294, 1, 1, 1, 1, 1,
-0.1291345, -1.309265, -5.598837, 1, 1, 1, 1, 1,
-0.1283938, -0.4939452, -3.100648, 1, 1, 1, 1, 1,
-0.1265696, 0.1718743, -0.5298183, 1, 1, 1, 1, 1,
-0.1263951, -0.5671855, -3.573937, 1, 1, 1, 1, 1,
-0.1255416, -1.304748, -3.0581, 1, 1, 1, 1, 1,
-0.1229275, -0.1235626, -3.434662, 1, 1, 1, 1, 1,
-0.1195733, 0.5539059, -1.484092, 1, 1, 1, 1, 1,
-0.1150651, -0.02540839, -1.817284, 1, 1, 1, 1, 1,
-0.1116453, 1.125431, -0.381515, 1, 1, 1, 1, 1,
-0.1110611, -0.08779654, -2.739453, 1, 1, 1, 1, 1,
-0.1083882, 0.896893, -0.7793478, 1, 1, 1, 1, 1,
-0.09706513, 1.626256, -0.2292565, 1, 1, 1, 1, 1,
-0.09634895, 0.7742493, -0.318841, 1, 1, 1, 1, 1,
-0.09550412, -0.1903507, -1.994248, 1, 1, 1, 1, 1,
-0.09364467, -0.3726771, -2.594432, 0, 0, 1, 1, 1,
-0.09208408, -0.4938623, -2.703514, 1, 0, 0, 1, 1,
-0.08811846, 0.8645191, -0.6401704, 1, 0, 0, 1, 1,
-0.08727642, -1.8579, -2.35256, 1, 0, 0, 1, 1,
-0.08476385, 0.08165241, -1.808698, 1, 0, 0, 1, 1,
-0.08258183, 0.1294743, -0.1171405, 1, 0, 0, 1, 1,
-0.08249675, 0.5428358, -0.0512029, 0, 0, 0, 1, 1,
-0.07853226, -0.4570455, -1.462687, 0, 0, 0, 1, 1,
-0.07786017, -0.4383423, -2.476134, 0, 0, 0, 1, 1,
-0.0757272, 1.180208, -0.07560156, 0, 0, 0, 1, 1,
-0.07528985, 0.2067317, -1.745748, 0, 0, 0, 1, 1,
-0.0689898, 0.3619578, 0.6200979, 0, 0, 0, 1, 1,
-0.06370573, 1.495203, 0.3281023, 0, 0, 0, 1, 1,
-0.06319607, -1.019255, -2.864411, 1, 1, 1, 1, 1,
-0.06067498, 0.9239656, 0.2844818, 1, 1, 1, 1, 1,
-0.05711691, -0.5356565, -1.040238, 1, 1, 1, 1, 1,
-0.0562388, 0.2887837, 0.557074, 1, 1, 1, 1, 1,
-0.05570376, 0.4014682, 1.070448, 1, 1, 1, 1, 1,
-0.05442645, -0.878925, -2.854191, 1, 1, 1, 1, 1,
-0.05358209, 1.165025, -0.5394662, 1, 1, 1, 1, 1,
-0.04919046, 0.3799998, -0.5955771, 1, 1, 1, 1, 1,
-0.04056673, -1.099454, -3.720662, 1, 1, 1, 1, 1,
-0.04044459, -1.173581, -2.066603, 1, 1, 1, 1, 1,
-0.03818898, 1.586735, -0.8626004, 1, 1, 1, 1, 1,
-0.03808462, -0.5860576, -3.098566, 1, 1, 1, 1, 1,
-0.0370818, 1.284014, -0.446125, 1, 1, 1, 1, 1,
-0.03240889, -0.2093949, -2.019606, 1, 1, 1, 1, 1,
-0.03137961, -0.2631248, -2.716105, 1, 1, 1, 1, 1,
-0.03006479, -1.842213, -2.745027, 0, 0, 1, 1, 1,
-0.02869662, -0.4940295, -3.448932, 1, 0, 0, 1, 1,
-0.02595542, 1.182022, -0.7622349, 1, 0, 0, 1, 1,
-0.02486697, 0.930234, 0.2353351, 1, 0, 0, 1, 1,
-0.02291368, -0.1429859, -2.844985, 1, 0, 0, 1, 1,
-0.02231284, -0.8850813, -3.055032, 1, 0, 0, 1, 1,
-0.02114943, -1.667315, -3.74236, 0, 0, 0, 1, 1,
-0.02093993, -0.714824, -2.932628, 0, 0, 0, 1, 1,
-0.0201517, -1.112095, -1.683099, 0, 0, 0, 1, 1,
-0.01916778, 1.883784, -2.455056, 0, 0, 0, 1, 1,
-0.01906681, 0.2359284, 0.614055, 0, 0, 0, 1, 1,
-0.01899164, 1.341586, 0.3091473, 0, 0, 0, 1, 1,
-0.01878582, -0.750667, -2.12159, 0, 0, 0, 1, 1,
-0.0178101, 0.5334802, -0.3552693, 1, 1, 1, 1, 1,
-0.01632746, 0.7705795, 1.053201, 1, 1, 1, 1, 1,
-0.007599896, -1.437063, -3.007285, 1, 1, 1, 1, 1,
-0.007331287, 1.658102, -0.9194257, 1, 1, 1, 1, 1,
-0.00607229, 1.77359, -0.6871263, 1, 1, 1, 1, 1,
-0.004708907, 0.4817601, -1.126388, 1, 1, 1, 1, 1,
-0.0044011, -0.7719012, -3.2336, 1, 1, 1, 1, 1,
-0.0008878116, -0.6657974, -2.596143, 1, 1, 1, 1, 1,
0.006029284, -2.046935, 2.934322, 1, 1, 1, 1, 1,
0.0062001, 1.061761, 0.4560477, 1, 1, 1, 1, 1,
0.008160637, 0.2742974, 0.5729946, 1, 1, 1, 1, 1,
0.009511353, -0.5389128, 3.510957, 1, 1, 1, 1, 1,
0.01431746, 0.3670935, -1.120776, 1, 1, 1, 1, 1,
0.01589044, -1.222572, 3.153584, 1, 1, 1, 1, 1,
0.01861355, 0.649569, -0.1038251, 1, 1, 1, 1, 1,
0.01939206, -0.04134661, 2.403508, 0, 0, 1, 1, 1,
0.02276891, 0.2191371, 0.1163093, 1, 0, 0, 1, 1,
0.02416936, 2.688391, 0.7742253, 1, 0, 0, 1, 1,
0.02658992, 0.3624195, 1.743062, 1, 0, 0, 1, 1,
0.02869649, -0.2297101, 1.821482, 1, 0, 0, 1, 1,
0.03261764, -0.1610144, 1.524297, 1, 0, 0, 1, 1,
0.03309495, 1.039714, 0.07270379, 0, 0, 0, 1, 1,
0.03381791, 0.560768, 0.0658692, 0, 0, 0, 1, 1,
0.03414521, -0.8843045, 3.254729, 0, 0, 0, 1, 1,
0.04100185, -1.762238, 2.523415, 0, 0, 0, 1, 1,
0.04553778, 0.5597903, 0.4458, 0, 0, 0, 1, 1,
0.04589295, -0.6372156, 3.566026, 0, 0, 0, 1, 1,
0.04717708, -1.387929, 2.278407, 0, 0, 0, 1, 1,
0.04738025, -0.891079, 3.933708, 1, 1, 1, 1, 1,
0.05333262, -0.5587928, 1.990665, 1, 1, 1, 1, 1,
0.05674117, -2.261909, 2.361496, 1, 1, 1, 1, 1,
0.0588599, -0.4968768, 1.253093, 1, 1, 1, 1, 1,
0.0619729, 0.2245665, 0.8290836, 1, 1, 1, 1, 1,
0.06257269, 1.39574, -0.5767615, 1, 1, 1, 1, 1,
0.06318311, 0.4953863, -0.4082194, 1, 1, 1, 1, 1,
0.0690634, 0.1472158, -0.6497539, 1, 1, 1, 1, 1,
0.07416081, -1.710681, 2.982651, 1, 1, 1, 1, 1,
0.07794117, 1.673837, -0.4277681, 1, 1, 1, 1, 1,
0.08397676, -0.6755234, 2.555122, 1, 1, 1, 1, 1,
0.08469447, -0.1331991, 4.075551, 1, 1, 1, 1, 1,
0.08600965, -0.40005, 1.951058, 1, 1, 1, 1, 1,
0.0873227, 1.091446, -1.542063, 1, 1, 1, 1, 1,
0.08897175, -0.8289888, 3.872185, 1, 1, 1, 1, 1,
0.09105612, 0.2675543, -0.08947052, 0, 0, 1, 1, 1,
0.09152567, -1.223246, 4.038845, 1, 0, 0, 1, 1,
0.0958506, 0.9765635, 0.5769908, 1, 0, 0, 1, 1,
0.09864095, 0.7805643, -0.6943035, 1, 0, 0, 1, 1,
0.09973308, 0.5139165, 1.39542, 1, 0, 0, 1, 1,
0.102205, -0.03608466, 0.8054337, 1, 0, 0, 1, 1,
0.1036903, 1.245357, 2.560178, 0, 0, 0, 1, 1,
0.1040626, 0.9654499, 0.4967262, 0, 0, 0, 1, 1,
0.1062185, 0.4655515, 0.9952987, 0, 0, 0, 1, 1,
0.1081512, 0.2390279, 0.6574002, 0, 0, 0, 1, 1,
0.1090486, 0.07233881, -0.295557, 0, 0, 0, 1, 1,
0.112952, -0.01505336, 0.9994182, 0, 0, 0, 1, 1,
0.1242648, 0.3848808, 0.5844302, 0, 0, 0, 1, 1,
0.126063, 1.12017, -1.458487, 1, 1, 1, 1, 1,
0.1268726, -0.4252836, 4.041439, 1, 1, 1, 1, 1,
0.1272865, 1.789256, 0.8348957, 1, 1, 1, 1, 1,
0.1273235, 0.1296275, -0.1465213, 1, 1, 1, 1, 1,
0.1280685, -0.7064506, 3.921153, 1, 1, 1, 1, 1,
0.1287054, 0.6174703, 0.7241706, 1, 1, 1, 1, 1,
0.134567, -0.4426542, 2.016019, 1, 1, 1, 1, 1,
0.1385273, -0.2462884, 2.047111, 1, 1, 1, 1, 1,
0.1405422, -1.327032, 1.312295, 1, 1, 1, 1, 1,
0.1438734, -0.5248885, 0.4289106, 1, 1, 1, 1, 1,
0.1443763, -1.271697, 2.637317, 1, 1, 1, 1, 1,
0.1462841, 0.2027199, 1.155996, 1, 1, 1, 1, 1,
0.1501099, 0.06484697, 0.6420861, 1, 1, 1, 1, 1,
0.1503939, -0.08545428, 1.406995, 1, 1, 1, 1, 1,
0.1516522, -0.9352945, 3.048158, 1, 1, 1, 1, 1,
0.1549324, 0.5830691, 0.9122173, 0, 0, 1, 1, 1,
0.1558218, -0.5492796, 1.71121, 1, 0, 0, 1, 1,
0.1563769, -0.3672807, 1.729376, 1, 0, 0, 1, 1,
0.157543, 0.06112235, -0.1281665, 1, 0, 0, 1, 1,
0.1577742, -1.963217, 3.839414, 1, 0, 0, 1, 1,
0.1595099, 1.589359, -1.875633, 1, 0, 0, 1, 1,
0.1627285, -1.3291, 4.040182, 0, 0, 0, 1, 1,
0.1652452, -1.344328, 2.194663, 0, 0, 0, 1, 1,
0.1656374, -0.6818413, 2.566243, 0, 0, 0, 1, 1,
0.167418, -0.9596499, 2.256872, 0, 0, 0, 1, 1,
0.1703535, -0.1952309, 2.08419, 0, 0, 0, 1, 1,
0.1758557, 0.1420733, 1.30556, 0, 0, 0, 1, 1,
0.1785837, 1.370481, 0.2412401, 0, 0, 0, 1, 1,
0.1816291, 0.4640772, 1.487258, 1, 1, 1, 1, 1,
0.182699, -1.69686, 4.635933, 1, 1, 1, 1, 1,
0.1858413, -0.1803144, 1.1427, 1, 1, 1, 1, 1,
0.1878827, 0.6311725, 0.6416287, 1, 1, 1, 1, 1,
0.1940053, 0.8916489, 0.7497462, 1, 1, 1, 1, 1,
0.1962367, -0.03607672, 2.998639, 1, 1, 1, 1, 1,
0.1989262, -0.140186, 0.6343031, 1, 1, 1, 1, 1,
0.1990899, -0.9595393, 1.869791, 1, 1, 1, 1, 1,
0.1995826, 0.7471513, -0.8662084, 1, 1, 1, 1, 1,
0.1998377, -0.406272, 2.538567, 1, 1, 1, 1, 1,
0.2005499, 0.4750806, -0.2760256, 1, 1, 1, 1, 1,
0.2079664, 0.8112866, 0.4443516, 1, 1, 1, 1, 1,
0.2080624, -0.1581027, 0.7511558, 1, 1, 1, 1, 1,
0.2088407, 1.094436, -0.07187972, 1, 1, 1, 1, 1,
0.2106911, 0.4187225, 0.3628243, 1, 1, 1, 1, 1,
0.2116596, 0.7634544, -0.4032416, 0, 0, 1, 1, 1,
0.2130953, -2.018847, 2.336383, 1, 0, 0, 1, 1,
0.21365, 1.748868, -0.2480505, 1, 0, 0, 1, 1,
0.2138566, -1.003941, 3.447819, 1, 0, 0, 1, 1,
0.2155443, -0.1779528, 1.931619, 1, 0, 0, 1, 1,
0.2155992, 0.1827375, 1.490429, 1, 0, 0, 1, 1,
0.2163762, -0.05513325, -0.3581235, 0, 0, 0, 1, 1,
0.2171094, -0.554068, 3.658724, 0, 0, 0, 1, 1,
0.2173923, -0.07968091, 0.9368505, 0, 0, 0, 1, 1,
0.2181464, -1.317935, 2.676844, 0, 0, 0, 1, 1,
0.2218223, -1.803347, 3.047865, 0, 0, 0, 1, 1,
0.2227574, -1.66497, 2.822543, 0, 0, 0, 1, 1,
0.2274055, -1.036046, 3.860223, 0, 0, 0, 1, 1,
0.228408, 2.430815, 0.5454102, 1, 1, 1, 1, 1,
0.2331147, -0.1533277, 2.833721, 1, 1, 1, 1, 1,
0.2387578, -2.246763, 2.96015, 1, 1, 1, 1, 1,
0.2393733, 1.160101, 0.1427047, 1, 1, 1, 1, 1,
0.2398276, 0.2195259, 2.145504, 1, 1, 1, 1, 1,
0.2428894, 1.074068, 1.429869, 1, 1, 1, 1, 1,
0.2499831, 1.057015, 0.4085151, 1, 1, 1, 1, 1,
0.2504696, -0.7977242, 0.3291826, 1, 1, 1, 1, 1,
0.2504717, 0.2373912, 0.3024319, 1, 1, 1, 1, 1,
0.2514254, -0.2300434, 2.451754, 1, 1, 1, 1, 1,
0.2594932, 1.017128, -1.156226, 1, 1, 1, 1, 1,
0.2687181, -0.5632496, 4.105495, 1, 1, 1, 1, 1,
0.269531, 0.02727939, 2.467914, 1, 1, 1, 1, 1,
0.2711874, -0.09375081, 3.937184, 1, 1, 1, 1, 1,
0.2726908, -1.112541, 1.513191, 1, 1, 1, 1, 1,
0.2739862, 0.4387558, 0.1121953, 0, 0, 1, 1, 1,
0.274291, -1.741329, 3.369598, 1, 0, 0, 1, 1,
0.2761695, 0.004573376, 1.089822, 1, 0, 0, 1, 1,
0.2770044, 1.69534, 0.97093, 1, 0, 0, 1, 1,
0.2847835, -1.83974, 2.41479, 1, 0, 0, 1, 1,
0.2867155, -0.3825612, 3.216247, 1, 0, 0, 1, 1,
0.2893054, 0.2470425, 2.083118, 0, 0, 0, 1, 1,
0.2956258, -0.6826861, 3.364101, 0, 0, 0, 1, 1,
0.303777, 1.296018, 0.3429108, 0, 0, 0, 1, 1,
0.303785, -0.8323603, 3.079925, 0, 0, 0, 1, 1,
0.3044933, 0.09077378, -0.8053827, 0, 0, 0, 1, 1,
0.3063911, 0.1360254, 0.2823403, 0, 0, 0, 1, 1,
0.3064044, -2.364482, 1.065017, 0, 0, 0, 1, 1,
0.3069884, 0.592276, -0.5036253, 1, 1, 1, 1, 1,
0.3107976, -1.160197, 3.990255, 1, 1, 1, 1, 1,
0.3115704, -0.7249675, 4.238842, 1, 1, 1, 1, 1,
0.3143958, 0.3949851, 2.129177, 1, 1, 1, 1, 1,
0.316108, -0.4315927, 2.454753, 1, 1, 1, 1, 1,
0.3195283, -0.4290234, 2.227091, 1, 1, 1, 1, 1,
0.323887, 0.8724811, -0.5664272, 1, 1, 1, 1, 1,
0.3295928, 0.9863887, -0.6475711, 1, 1, 1, 1, 1,
0.3299786, 1.3689, 0.5148033, 1, 1, 1, 1, 1,
0.3301385, 0.9718025, 1.303846, 1, 1, 1, 1, 1,
0.3302999, -0.3287289, 3.11684, 1, 1, 1, 1, 1,
0.3326226, 0.2351265, -1.156371, 1, 1, 1, 1, 1,
0.3379161, 1.916117, -0.9775369, 1, 1, 1, 1, 1,
0.3381408, 0.5795426, 0.3140505, 1, 1, 1, 1, 1,
0.3389586, 0.5484741, 0.1389883, 1, 1, 1, 1, 1,
0.3397993, -0.1339103, 1.459036, 0, 0, 1, 1, 1,
0.341205, -1.125951, 2.301037, 1, 0, 0, 1, 1,
0.341436, 0.3392684, 1.18065, 1, 0, 0, 1, 1,
0.3433116, 0.4145016, 0.6416772, 1, 0, 0, 1, 1,
0.3499116, -0.5903999, 1.936918, 1, 0, 0, 1, 1,
0.3568105, -0.9899639, 2.384573, 1, 0, 0, 1, 1,
0.3571755, 0.4329883, 2.773194, 0, 0, 0, 1, 1,
0.3611827, 1.192427, -0.08676382, 0, 0, 0, 1, 1,
0.3614362, -1.373691, 1.565007, 0, 0, 0, 1, 1,
0.3628331, -0.1628446, 0.7668887, 0, 0, 0, 1, 1,
0.3642567, 1.29924, -0.03748501, 0, 0, 0, 1, 1,
0.3674015, -0.6414762, 0.5746974, 0, 0, 0, 1, 1,
0.3691488, -0.8907027, 1.22314, 0, 0, 0, 1, 1,
0.3726253, 1.981565, -0.7105055, 1, 1, 1, 1, 1,
0.3763953, -0.2980213, 2.185198, 1, 1, 1, 1, 1,
0.3868632, 1.301371, 0.01465264, 1, 1, 1, 1, 1,
0.3872535, -0.6201979, 1.360703, 1, 1, 1, 1, 1,
0.3898314, 0.9253278, -0.6887333, 1, 1, 1, 1, 1,
0.3931907, 1.205769, 1.04972, 1, 1, 1, 1, 1,
0.3974041, -1.158882, 2.383151, 1, 1, 1, 1, 1,
0.4066768, -0.4319955, 1.263097, 1, 1, 1, 1, 1,
0.4092077, -1.543426, 1.853973, 1, 1, 1, 1, 1,
0.411499, 0.5283488, -0.6558678, 1, 1, 1, 1, 1,
0.4169279, 0.9062942, 0.5155256, 1, 1, 1, 1, 1,
0.417227, 0.1608017, 2.92708, 1, 1, 1, 1, 1,
0.4174317, -1.884461, 3.086572, 1, 1, 1, 1, 1,
0.418606, 0.1858918, 2.023699, 1, 1, 1, 1, 1,
0.4194172, -0.6111682, 1.883105, 1, 1, 1, 1, 1,
0.4198976, 2.053764, 0.07662013, 0, 0, 1, 1, 1,
0.4208587, 0.3775786, 0.6538314, 1, 0, 0, 1, 1,
0.4264336, -0.7453942, 2.36373, 1, 0, 0, 1, 1,
0.4299027, -1.642003, 3.255285, 1, 0, 0, 1, 1,
0.4316024, -1.789657, 2.488789, 1, 0, 0, 1, 1,
0.4373524, 0.355307, 0.794613, 1, 0, 0, 1, 1,
0.4375322, -2.041659, 2.981398, 0, 0, 0, 1, 1,
0.4445661, -0.5783697, 2.788155, 0, 0, 0, 1, 1,
0.4449433, -0.04171861, 0.75016, 0, 0, 0, 1, 1,
0.4450468, -1.301778, 2.531145, 0, 0, 0, 1, 1,
0.4467695, -0.4662223, 2.775525, 0, 0, 0, 1, 1,
0.4505368, -0.7595933, 5.919219, 0, 0, 0, 1, 1,
0.452913, -2.052597, 1.656179, 0, 0, 0, 1, 1,
0.4530002, 0.5091513, 0.1085995, 1, 1, 1, 1, 1,
0.4541783, -0.5432801, 3.31621, 1, 1, 1, 1, 1,
0.4548883, 0.0098836, 0.7338236, 1, 1, 1, 1, 1,
0.45941, -1.293943, 4.565498, 1, 1, 1, 1, 1,
0.4598597, 0.3117419, 0.8290126, 1, 1, 1, 1, 1,
0.4654806, -0.9032853, 2.53541, 1, 1, 1, 1, 1,
0.4670281, -0.2926129, 1.738598, 1, 1, 1, 1, 1,
0.4679082, -0.4237089, 3.478594, 1, 1, 1, 1, 1,
0.4716127, 1.137107, 0.758662, 1, 1, 1, 1, 1,
0.4835537, 0.8481773, -1.827879, 1, 1, 1, 1, 1,
0.484436, 0.8101253, -0.04180624, 1, 1, 1, 1, 1,
0.4844584, -0.2006687, 4.266535, 1, 1, 1, 1, 1,
0.4948019, 0.5015056, 1.215514, 1, 1, 1, 1, 1,
0.4969588, -0.9256253, 1.803107, 1, 1, 1, 1, 1,
0.4977118, -0.07722548, 1.081985, 1, 1, 1, 1, 1,
0.4982719, -0.5791297, 1.857614, 0, 0, 1, 1, 1,
0.4986649, 0.7117327, -0.1000535, 1, 0, 0, 1, 1,
0.5010775, -1.337051, 2.612267, 1, 0, 0, 1, 1,
0.5046166, 0.4608883, 0.1794562, 1, 0, 0, 1, 1,
0.5054892, -0.9356998, 3.43287, 1, 0, 0, 1, 1,
0.5091605, -0.2696894, 0.5651462, 1, 0, 0, 1, 1,
0.5113896, 0.8692073, 0.6576459, 0, 0, 0, 1, 1,
0.5182251, -0.4922111, 2.196598, 0, 0, 0, 1, 1,
0.5243455, 1.159502, -1.342524, 0, 0, 0, 1, 1,
0.5307016, -0.02304834, 1.394272, 0, 0, 0, 1, 1,
0.531045, 0.8729167, -0.6845328, 0, 0, 0, 1, 1,
0.531195, 0.02868707, 1.098484, 0, 0, 0, 1, 1,
0.5374798, -1.216424, 3.233303, 0, 0, 0, 1, 1,
0.5423617, 0.9561206, 1.737984, 1, 1, 1, 1, 1,
0.5442346, 0.1831919, 0.8380008, 1, 1, 1, 1, 1,
0.544495, -1.357423, 2.22185, 1, 1, 1, 1, 1,
0.5447425, -1.068172, 3.436823, 1, 1, 1, 1, 1,
0.5486557, 0.8555117, -0.6581845, 1, 1, 1, 1, 1,
0.5588917, -2.969388, 3.720608, 1, 1, 1, 1, 1,
0.5590937, -0.8898821, 1.59452, 1, 1, 1, 1, 1,
0.5607442, -0.6940573, 3.717985, 1, 1, 1, 1, 1,
0.5647213, 0.0390723, 2.375761, 1, 1, 1, 1, 1,
0.5664476, 0.5331857, 1.425953, 1, 1, 1, 1, 1,
0.5735065, 1.650922, 0.9709044, 1, 1, 1, 1, 1,
0.5753015, 0.1830323, 0.08854946, 1, 1, 1, 1, 1,
0.5755781, 0.8558175, 0.6402983, 1, 1, 1, 1, 1,
0.5796546, -0.7237639, 2.391327, 1, 1, 1, 1, 1,
0.5827026, 0.1312089, 2.368494, 1, 1, 1, 1, 1,
0.5894397, 0.03694689, 1.71536, 0, 0, 1, 1, 1,
0.5912787, 0.5743911, -0.2000388, 1, 0, 0, 1, 1,
0.59189, 0.5459855, -0.02053152, 1, 0, 0, 1, 1,
0.5924765, -1.004166, 3.426405, 1, 0, 0, 1, 1,
0.5951643, -1.236232, 1.313064, 1, 0, 0, 1, 1,
0.6043357, 0.5640805, -0.3642879, 1, 0, 0, 1, 1,
0.605141, -1.396799, 0.2823525, 0, 0, 0, 1, 1,
0.6067279, 0.05375838, 3.847688, 0, 0, 0, 1, 1,
0.6084784, -0.4169097, 1.428224, 0, 0, 0, 1, 1,
0.6097067, 0.6519737, 1.450033, 0, 0, 0, 1, 1,
0.6140196, 0.7493737, 1.109566, 0, 0, 0, 1, 1,
0.6147547, 0.3867357, 1.87817, 0, 0, 0, 1, 1,
0.6151152, 1.070221, -0.9238608, 0, 0, 0, 1, 1,
0.6154276, 0.5372987, 1.864484, 1, 1, 1, 1, 1,
0.618131, -0.4244823, 3.756552, 1, 1, 1, 1, 1,
0.6200972, 1.520426, -0.05608159, 1, 1, 1, 1, 1,
0.6209803, 0.5414311, 2.869663, 1, 1, 1, 1, 1,
0.6272704, -1.548334, 2.035323, 1, 1, 1, 1, 1,
0.6316624, 0.9577166, -0.04119555, 1, 1, 1, 1, 1,
0.6340999, 0.7237145, 0.492038, 1, 1, 1, 1, 1,
0.6347257, -2.850322, 3.468955, 1, 1, 1, 1, 1,
0.6358773, -0.6231003, 2.324675, 1, 1, 1, 1, 1,
0.6365973, -1.223923, 3.62265, 1, 1, 1, 1, 1,
0.6462469, 1.05502, 1.826248, 1, 1, 1, 1, 1,
0.6477172, 1.393144, 0.6752381, 1, 1, 1, 1, 1,
0.6504759, -0.9897945, 2.311745, 1, 1, 1, 1, 1,
0.6505815, -0.2361169, 2.784317, 1, 1, 1, 1, 1,
0.6511537, 1.030765, 1.946735, 1, 1, 1, 1, 1,
0.6529351, 1.604877, 1.513738, 0, 0, 1, 1, 1,
0.6550866, 0.4081012, 0.9597992, 1, 0, 0, 1, 1,
0.6577454, 0.3876172, 2.193983, 1, 0, 0, 1, 1,
0.6600809, 0.02941518, 2.701597, 1, 0, 0, 1, 1,
0.6601084, 0.2866223, 1.818365, 1, 0, 0, 1, 1,
0.6636474, -0.7567726, 3.801505, 1, 0, 0, 1, 1,
0.6668196, 0.5355064, 1.723557, 0, 0, 0, 1, 1,
0.667401, -0.4011042, 3.033567, 0, 0, 0, 1, 1,
0.6709808, 0.5298085, 0.3483347, 0, 0, 0, 1, 1,
0.6758769, -1.951089, 2.509147, 0, 0, 0, 1, 1,
0.6775343, -2.107342, 2.006995, 0, 0, 0, 1, 1,
0.6815075, 0.3757156, 0.6639791, 0, 0, 0, 1, 1,
0.6857999, -0.1261758, 2.138484, 0, 0, 0, 1, 1,
0.688233, 0.03080639, 1.629605, 1, 1, 1, 1, 1,
0.695883, -1.02516, 3.289295, 1, 1, 1, 1, 1,
0.6970415, -1.362581, 3.161977, 1, 1, 1, 1, 1,
0.6991974, 0.7311807, 1.096928, 1, 1, 1, 1, 1,
0.7020869, 0.2519163, -0.4148097, 1, 1, 1, 1, 1,
0.7061939, -0.1978367, 2.03663, 1, 1, 1, 1, 1,
0.7104362, 0.6972399, 2.194082, 1, 1, 1, 1, 1,
0.7111499, -0.2323619, 1.362288, 1, 1, 1, 1, 1,
0.714014, 1.945178, 1.614452, 1, 1, 1, 1, 1,
0.725319, -0.6217082, 0.9083901, 1, 1, 1, 1, 1,
0.7310367, -0.5443407, 1.882142, 1, 1, 1, 1, 1,
0.7323044, 1.004597, 1.804092, 1, 1, 1, 1, 1,
0.7405986, -1.13146, 4.315557, 1, 1, 1, 1, 1,
0.7418637, -0.2436356, 2.242413, 1, 1, 1, 1, 1,
0.7440201, -0.7148941, 2.109607, 1, 1, 1, 1, 1,
0.7498848, -1.778163, 5.033966, 0, 0, 1, 1, 1,
0.7523228, 0.155597, 1.156671, 1, 0, 0, 1, 1,
0.7554541, -1.085688, 1.08268, 1, 0, 0, 1, 1,
0.760988, -0.0938462, 1.216927, 1, 0, 0, 1, 1,
0.761142, -0.4934256, 0.6605789, 1, 0, 0, 1, 1,
0.7628785, 0.6479025, 0.3519158, 1, 0, 0, 1, 1,
0.7644085, -0.4384998, 2.912355, 0, 0, 0, 1, 1,
0.7670762, 1.857175, -0.426114, 0, 0, 0, 1, 1,
0.7723976, -0.650598, 3.051408, 0, 0, 0, 1, 1,
0.7753556, -0.8380563, 2.688954, 0, 0, 0, 1, 1,
0.7762083, 1.306533, 0.2397015, 0, 0, 0, 1, 1,
0.7786111, 0.9438142, -0.3425864, 0, 0, 0, 1, 1,
0.7860017, -1.62195, 2.400757, 0, 0, 0, 1, 1,
0.7866042, 0.5275775, 1.094114, 1, 1, 1, 1, 1,
0.7873264, -0.9926163, 0.6791356, 1, 1, 1, 1, 1,
0.7891306, 1.112436, 0.5392244, 1, 1, 1, 1, 1,
0.7944351, 1.47172, -0.05407488, 1, 1, 1, 1, 1,
0.79692, -0.1248598, 0.8742223, 1, 1, 1, 1, 1,
0.8166109, -0.5267578, 2.285644, 1, 1, 1, 1, 1,
0.8196068, -0.4849848, 2.168539, 1, 1, 1, 1, 1,
0.8214233, 2.087897, -0.6421028, 1, 1, 1, 1, 1,
0.8377519, 1.038329, -0.7683864, 1, 1, 1, 1, 1,
0.8477151, 0.7088532, 2.459864, 1, 1, 1, 1, 1,
0.8567654, 0.8226265, -0.7896547, 1, 1, 1, 1, 1,
0.861448, -0.1055317, 0.5639002, 1, 1, 1, 1, 1,
0.8641925, 0.04630858, 1.752513, 1, 1, 1, 1, 1,
0.8659536, -1.772839, 3.653818, 1, 1, 1, 1, 1,
0.8680117, 0.490897, 0.5692667, 1, 1, 1, 1, 1,
0.8688791, 0.2934383, 1.576026, 0, 0, 1, 1, 1,
0.8695387, 0.9679141, 2.013007, 1, 0, 0, 1, 1,
0.870935, -0.4457991, 2.902737, 1, 0, 0, 1, 1,
0.8713516, -0.869212, 3.094881, 1, 0, 0, 1, 1,
0.8834353, 0.8886212, -0.4399191, 1, 0, 0, 1, 1,
0.8895588, -0.4900604, 2.986727, 1, 0, 0, 1, 1,
0.899685, 1.917955, -0.9860092, 0, 0, 0, 1, 1,
0.9010277, -0.09459659, 2.185438, 0, 0, 0, 1, 1,
0.9026838, 0.2940325, 1.915767, 0, 0, 0, 1, 1,
0.9090444, -0.6379461, 2.312534, 0, 0, 0, 1, 1,
0.916501, 0.04629416, 2.512411, 0, 0, 0, 1, 1,
0.9249328, 0.7103387, 1.411491, 0, 0, 0, 1, 1,
0.9341167, -1.458343, 2.154617, 0, 0, 0, 1, 1,
0.9363863, 0.05809352, 1.283849, 1, 1, 1, 1, 1,
0.9395247, 0.940078, 1.760043, 1, 1, 1, 1, 1,
0.9451466, 1.482568, -0.2597327, 1, 1, 1, 1, 1,
0.9470028, -1.16931, 3.194829, 1, 1, 1, 1, 1,
0.9501702, -1.995233, 1.175838, 1, 1, 1, 1, 1,
0.9557137, 0.3176838, 3.166654, 1, 1, 1, 1, 1,
0.9562074, 0.2220857, 1.058383, 1, 1, 1, 1, 1,
0.958234, 0.2512622, 2.164004, 1, 1, 1, 1, 1,
0.9621286, 0.9110808, 0.9545078, 1, 1, 1, 1, 1,
0.9756232, 0.7295198, 0.8082343, 1, 1, 1, 1, 1,
0.9764511, -0.9377007, 3.493689, 1, 1, 1, 1, 1,
0.9774637, 1.371168, 1.134192, 1, 1, 1, 1, 1,
0.9842201, 0.9122973, 0.828162, 1, 1, 1, 1, 1,
0.9858248, 0.1345699, 2.958446, 1, 1, 1, 1, 1,
0.9881487, -1.155904, 3.473883, 1, 1, 1, 1, 1,
0.9893066, 0.3695149, 1.204621, 0, 0, 1, 1, 1,
0.9946986, 0.8466622, -0.8987679, 1, 0, 0, 1, 1,
0.9981744, 0.2511514, 1.621394, 1, 0, 0, 1, 1,
1.00278, 0.2892888, 1.60104, 1, 0, 0, 1, 1,
1.009721, -0.6494798, 1.506099, 1, 0, 0, 1, 1,
1.017225, -1.000559, 1.592798, 1, 0, 0, 1, 1,
1.018783, 1.989859, -0.3553524, 0, 0, 0, 1, 1,
1.020782, 0.3881518, 1.907735, 0, 0, 0, 1, 1,
1.025007, -0.493389, -1.357223, 0, 0, 0, 1, 1,
1.027534, -0.4675334, 2.435547, 0, 0, 0, 1, 1,
1.028006, -1.330871, 1.855602, 0, 0, 0, 1, 1,
1.028205, 1.027207, 1.169407, 0, 0, 0, 1, 1,
1.030001, 1.494486, 0.2203282, 0, 0, 0, 1, 1,
1.037437, -1.007926, 0.9092144, 1, 1, 1, 1, 1,
1.050353, 1.119839, -0.4289013, 1, 1, 1, 1, 1,
1.056283, -0.8500047, 2.674172, 1, 1, 1, 1, 1,
1.058963, 0.2559921, 1.217567, 1, 1, 1, 1, 1,
1.061845, -0.4894335, 1.810583, 1, 1, 1, 1, 1,
1.067753, -1.482275, 3.139615, 1, 1, 1, 1, 1,
1.073764, -1.94156, 2.144035, 1, 1, 1, 1, 1,
1.075301, -1.530427, 3.800233, 1, 1, 1, 1, 1,
1.080914, 0.3874114, 2.227277, 1, 1, 1, 1, 1,
1.088283, -0.2146861, 1.608383, 1, 1, 1, 1, 1,
1.088565, 0.234509, 0.3980005, 1, 1, 1, 1, 1,
1.095061, 0.9741771, 1.707506, 1, 1, 1, 1, 1,
1.099376, 0.6290975, 2.11217, 1, 1, 1, 1, 1,
1.102792, 0.1537525, 2.154308, 1, 1, 1, 1, 1,
1.105667, 0.5534217, 0.4767326, 1, 1, 1, 1, 1,
1.108877, -0.639448, 2.810288, 0, 0, 1, 1, 1,
1.113098, -1.372801, 0.6445829, 1, 0, 0, 1, 1,
1.114295, 0.5122759, 1.845927, 1, 0, 0, 1, 1,
1.120707, -0.8059995, 2.777342, 1, 0, 0, 1, 1,
1.122325, -1.494614, 4.160007, 1, 0, 0, 1, 1,
1.123498, -0.3353128, 0.674605, 1, 0, 0, 1, 1,
1.12494, -0.320226, 1.185899, 0, 0, 0, 1, 1,
1.132377, 0.09943137, 1.441894, 0, 0, 0, 1, 1,
1.1335, -0.01063116, 3.454138, 0, 0, 0, 1, 1,
1.134614, 0.9860964, 0.9550022, 0, 0, 0, 1, 1,
1.142942, 0.1463857, 1.769392, 0, 0, 0, 1, 1,
1.166829, -0.1565984, 2.036293, 0, 0, 0, 1, 1,
1.167574, 1.536712, -1.437548, 0, 0, 0, 1, 1,
1.169478, 0.7308154, -0.9093897, 1, 1, 1, 1, 1,
1.171913, 0.9914719, 1.264642, 1, 1, 1, 1, 1,
1.182465, -0.3109063, 1.648171, 1, 1, 1, 1, 1,
1.185262, 1.390666, -0.3960076, 1, 1, 1, 1, 1,
1.185279, 0.4377351, 1.09601, 1, 1, 1, 1, 1,
1.189267, -1.790654, 2.035623, 1, 1, 1, 1, 1,
1.215176, -0.1549435, 2.381745, 1, 1, 1, 1, 1,
1.216165, -0.5164559, 3.160617, 1, 1, 1, 1, 1,
1.233149, 0.3828206, 0.7823781, 1, 1, 1, 1, 1,
1.23809, 0.4327858, -0.1362081, 1, 1, 1, 1, 1,
1.249828, 0.8168188, 0.5167027, 1, 1, 1, 1, 1,
1.26201, -1.219145, 1.596868, 1, 1, 1, 1, 1,
1.262358, 2.404403, -0.03504503, 1, 1, 1, 1, 1,
1.273439, -1.283196, 0.7238783, 1, 1, 1, 1, 1,
1.275702, 0.2554398, 1.113718, 1, 1, 1, 1, 1,
1.282586, 1.27845, 0.8693293, 0, 0, 1, 1, 1,
1.284428, -0.6357669, 2.110898, 1, 0, 0, 1, 1,
1.28451, 0.3458743, 2.285138, 1, 0, 0, 1, 1,
1.288954, -0.832958, 1.914665, 1, 0, 0, 1, 1,
1.292331, 0.2101843, 0.4195885, 1, 0, 0, 1, 1,
1.295463, -0.07759157, 2.175996, 1, 0, 0, 1, 1,
1.297067, 0.5987016, 1.780134, 0, 0, 0, 1, 1,
1.307316, -0.6787885, 2.735863, 0, 0, 0, 1, 1,
1.311182, -0.8764122, 3.188001, 0, 0, 0, 1, 1,
1.311643, -0.3038459, 1.444545, 0, 0, 0, 1, 1,
1.316098, -0.5250633, 0.254066, 0, 0, 0, 1, 1,
1.31697, -0.616475, 1.229746, 0, 0, 0, 1, 1,
1.328633, -0.1197371, 0.2100202, 0, 0, 0, 1, 1,
1.331098, -1.801366, 1.524008, 1, 1, 1, 1, 1,
1.338781, 0.06761648, 1.40029, 1, 1, 1, 1, 1,
1.340257, 1.15955, 0.9257681, 1, 1, 1, 1, 1,
1.354241, -0.2031994, 0.5584829, 1, 1, 1, 1, 1,
1.355336, 0.4789018, 1.939954, 1, 1, 1, 1, 1,
1.359442, 0.8051649, 0.4323691, 1, 1, 1, 1, 1,
1.360891, -1.918929, 2.900846, 1, 1, 1, 1, 1,
1.361663, -0.8914946, 1.306958, 1, 1, 1, 1, 1,
1.362185, 1.109749, 0.8937876, 1, 1, 1, 1, 1,
1.363645, 0.1622138, 1.953017, 1, 1, 1, 1, 1,
1.364104, 0.6524031, 0.8081017, 1, 1, 1, 1, 1,
1.368353, 0.9416366, -0.3991927, 1, 1, 1, 1, 1,
1.368633, 0.2309053, 0.3071972, 1, 1, 1, 1, 1,
1.374332, -1.190694, 2.527731, 1, 1, 1, 1, 1,
1.375913, 1.549706, 1.83443, 1, 1, 1, 1, 1,
1.376923, 0.1116134, 1.650811, 0, 0, 1, 1, 1,
1.377641, 0.03838405, 0.7056846, 1, 0, 0, 1, 1,
1.42195, 1.332073, 1.09946, 1, 0, 0, 1, 1,
1.425318, 0.5579327, 1.12217, 1, 0, 0, 1, 1,
1.428281, -0.4772536, 1.358962, 1, 0, 0, 1, 1,
1.43266, 1.116563, 0.8354049, 1, 0, 0, 1, 1,
1.443308, -0.2890019, 2.516669, 0, 0, 0, 1, 1,
1.44538, -0.1173149, 1.519077, 0, 0, 0, 1, 1,
1.447406, 1.459344, 0.9453382, 0, 0, 0, 1, 1,
1.472432, -0.8456394, 1.352755, 0, 0, 0, 1, 1,
1.476822, -0.387658, 2.967569, 0, 0, 0, 1, 1,
1.487452, -1.043085, 2.271469, 0, 0, 0, 1, 1,
1.488389, 1.749895, 0.9195892, 0, 0, 0, 1, 1,
1.503116, -1.260652, 2.599527, 1, 1, 1, 1, 1,
1.507769, -0.1247511, 2.625856, 1, 1, 1, 1, 1,
1.518583, 0.4026496, 0.9350628, 1, 1, 1, 1, 1,
1.536084, 0.5249319, 0.7669159, 1, 1, 1, 1, 1,
1.559843, -1.119462, 2.125633, 1, 1, 1, 1, 1,
1.560553, -1.136558, 2.283009, 1, 1, 1, 1, 1,
1.561239, 2.811296, 1.664511, 1, 1, 1, 1, 1,
1.56582, 0.6495878, 1.18908, 1, 1, 1, 1, 1,
1.592949, -0.03448861, 2.460509, 1, 1, 1, 1, 1,
1.593736, 0.5013973, 0.7370735, 1, 1, 1, 1, 1,
1.594476, -1.333011, 1.888294, 1, 1, 1, 1, 1,
1.606606, 0.7119055, 1.304564, 1, 1, 1, 1, 1,
1.623626, 0.1630338, 0.5478221, 1, 1, 1, 1, 1,
1.626116, 1.196675, 0.0371597, 1, 1, 1, 1, 1,
1.653247, -0.0090231, 1.680684, 1, 1, 1, 1, 1,
1.659522, -1.360893, 2.430013, 0, 0, 1, 1, 1,
1.677323, -1.283966, 1.449573, 1, 0, 0, 1, 1,
1.690652, -0.4136458, 0.4668225, 1, 0, 0, 1, 1,
1.694534, -1.181853, 2.198041, 1, 0, 0, 1, 1,
1.706777, -0.233111, 1.742559, 1, 0, 0, 1, 1,
1.709492, -0.3933922, 2.323951, 1, 0, 0, 1, 1,
1.710966, -0.06431184, 0.9425482, 0, 0, 0, 1, 1,
1.717049, -2.557815, 3.772153, 0, 0, 0, 1, 1,
1.737937, 1.027548, 1.572011, 0, 0, 0, 1, 1,
1.752698, 0.2865185, 0.9960446, 0, 0, 0, 1, 1,
1.757754, 0.05727267, 2.024639, 0, 0, 0, 1, 1,
1.768316, -0.7443724, 1.25942, 0, 0, 0, 1, 1,
1.769681, -1.460427, 2.713363, 0, 0, 0, 1, 1,
1.775702, -0.6585481, 1.350915, 1, 1, 1, 1, 1,
1.784634, 0.08342499, 2.94998, 1, 1, 1, 1, 1,
1.799901, -1.044112, 3.654217, 1, 1, 1, 1, 1,
1.814217, 0.6336043, 0.311574, 1, 1, 1, 1, 1,
1.846412, -0.9825327, 2.89476, 1, 1, 1, 1, 1,
1.848403, 0.1562857, 2.355169, 1, 1, 1, 1, 1,
1.851102, -0.5441733, 2.558644, 1, 1, 1, 1, 1,
1.877954, -1.164854, 0.9659751, 1, 1, 1, 1, 1,
1.883062, 1.171188, -0.0888928, 1, 1, 1, 1, 1,
1.910003, -0.829226, 1.130632, 1, 1, 1, 1, 1,
1.91043, -0.1989745, 1.484752, 1, 1, 1, 1, 1,
1.920836, 0.2965441, 0.0516283, 1, 1, 1, 1, 1,
1.945106, -2.076515, 2.66456, 1, 1, 1, 1, 1,
1.958697, -0.5233361, 2.840484, 1, 1, 1, 1, 1,
1.960515, -1.314307, 2.699968, 1, 1, 1, 1, 1,
1.997461, 0.07911597, 1.566761, 0, 0, 1, 1, 1,
2.002565, -0.3546747, 1.615253, 1, 0, 0, 1, 1,
2.008134, 0.00124346, -0.2557809, 1, 0, 0, 1, 1,
2.015107, -0.0339185, 1.673299, 1, 0, 0, 1, 1,
2.028394, 0.337663, 1.476199, 1, 0, 0, 1, 1,
2.055697, -0.5370495, 1.478343, 1, 0, 0, 1, 1,
2.078495, -0.3958867, 1.911805, 0, 0, 0, 1, 1,
2.101001, 1.213665, 2.641054, 0, 0, 0, 1, 1,
2.298218, 0.2311084, 1.921753, 0, 0, 0, 1, 1,
2.430291, 0.05605306, 0.6062847, 0, 0, 0, 1, 1,
2.466743, -2.306347, 2.210169, 0, 0, 0, 1, 1,
2.543116, 1.069433, 0.7479822, 0, 0, 0, 1, 1,
2.555422, -1.477521, 1.407102, 0, 0, 0, 1, 1,
2.573508, -0.5070316, 1.870104, 1, 1, 1, 1, 1,
2.588621, 1.448822, 1.476678, 1, 1, 1, 1, 1,
2.620257, -0.03885305, 0.2656434, 1, 1, 1, 1, 1,
2.656997, -0.8053839, 2.606056, 1, 1, 1, 1, 1,
2.691562, 0.7104402, 1.468962, 1, 1, 1, 1, 1,
2.90539, -0.8000054, 2.546519, 1, 1, 1, 1, 1,
3.412814, 0.5790941, 2.497452, 1, 1, 1, 1, 1
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
var radius = 9.847108;
var distance = 34.58755;
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
mvMatrix.translate( -0.2072333, 0.04686415, -0.05892086 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.58755);
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