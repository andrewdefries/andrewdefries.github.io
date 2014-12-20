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
-3.224402, -0.1584858, -2.348928, 1, 0, 0, 1,
-2.994573, 1.183429, -1.346504, 1, 0.007843138, 0, 1,
-2.926683, -0.6999261, -1.966372, 1, 0.01176471, 0, 1,
-2.781978, -1.567373, -1.734698, 1, 0.01960784, 0, 1,
-2.721063, -1.190047, -2.576559, 1, 0.02352941, 0, 1,
-2.625072, -0.9142598, -0.1670991, 1, 0.03137255, 0, 1,
-2.567087, 0.4923807, -2.033823, 1, 0.03529412, 0, 1,
-2.400478, -0.998658, -1.920563, 1, 0.04313726, 0, 1,
-2.395327, -1.229172, -1.864425, 1, 0.04705882, 0, 1,
-2.394733, -0.1367571, -1.870299, 1, 0.05490196, 0, 1,
-2.374417, 0.3351703, -1.980204, 1, 0.05882353, 0, 1,
-2.343864, 1.744009, -1.263513, 1, 0.06666667, 0, 1,
-2.303452, 0.3584816, -2.580792, 1, 0.07058824, 0, 1,
-2.253121, 1.354293, -1.093403, 1, 0.07843138, 0, 1,
-2.250906, -0.09513135, -1.419917, 1, 0.08235294, 0, 1,
-2.2507, 1.163531, -1.745027, 1, 0.09019608, 0, 1,
-2.195564, 1.181277, -1.807652, 1, 0.09411765, 0, 1,
-2.176068, -1.079212, -1.258564, 1, 0.1019608, 0, 1,
-2.156269, -0.3741298, -0.3473985, 1, 0.1098039, 0, 1,
-2.146961, -1.779795, -2.634773, 1, 0.1137255, 0, 1,
-2.140691, -0.2851699, -1.921333, 1, 0.1215686, 0, 1,
-2.105311, -0.4818858, -1.362921, 1, 0.1254902, 0, 1,
-2.099893, 0.2890449, 0.3018861, 1, 0.1333333, 0, 1,
-2.048362, -0.02282846, -2.39877, 1, 0.1372549, 0, 1,
-2.033076, -0.5139278, -1.121404, 1, 0.145098, 0, 1,
-2.006102, -0.9152189, -2.696409, 1, 0.1490196, 0, 1,
-2.004727, -0.8332253, -2.443631, 1, 0.1568628, 0, 1,
-1.995349, -0.6399727, -0.6664331, 1, 0.1607843, 0, 1,
-1.984933, -0.4100535, -2.918263, 1, 0.1686275, 0, 1,
-1.975504, 0.161141, -1.175237, 1, 0.172549, 0, 1,
-1.950016, -1.065346, -2.533289, 1, 0.1803922, 0, 1,
-1.934432, 0.5403118, -1.193387, 1, 0.1843137, 0, 1,
-1.907866, -0.0942337, -1.708767, 1, 0.1921569, 0, 1,
-1.893574, -1.54048, -2.278694, 1, 0.1960784, 0, 1,
-1.882945, 0.6785664, -1.220612, 1, 0.2039216, 0, 1,
-1.851489, -0.5084555, -1.690947, 1, 0.2117647, 0, 1,
-1.807621, 0.1013835, -1.398339, 1, 0.2156863, 0, 1,
-1.802409, 2.223678, -0.2485857, 1, 0.2235294, 0, 1,
-1.785072, -0.2753076, -1.136572, 1, 0.227451, 0, 1,
-1.775923, 0.4243705, -2.405991, 1, 0.2352941, 0, 1,
-1.767641, -1.752305, -2.723579, 1, 0.2392157, 0, 1,
-1.753693, -0.9081619, -2.264596, 1, 0.2470588, 0, 1,
-1.746977, -1.501742, -2.706167, 1, 0.2509804, 0, 1,
-1.741254, -0.1469398, -2.235454, 1, 0.2588235, 0, 1,
-1.690295, -0.4601799, -0.4577445, 1, 0.2627451, 0, 1,
-1.665104, 1.018651, -0.5481483, 1, 0.2705882, 0, 1,
-1.663467, -0.8392954, 0.07812354, 1, 0.2745098, 0, 1,
-1.648929, 0.299301, 0.7231344, 1, 0.282353, 0, 1,
-1.643732, 0.9380404, -0.1554296, 1, 0.2862745, 0, 1,
-1.640373, 0.7333999, -1.089106, 1, 0.2941177, 0, 1,
-1.635401, 0.2401087, -2.133988, 1, 0.3019608, 0, 1,
-1.624341, 2.211709, -0.1808818, 1, 0.3058824, 0, 1,
-1.619841, -1.063245, -2.829731, 1, 0.3137255, 0, 1,
-1.603378, -0.5497313, -2.77089, 1, 0.3176471, 0, 1,
-1.585465, -1.335722, -3.057477, 1, 0.3254902, 0, 1,
-1.584359, 1.443164, 0.576085, 1, 0.3294118, 0, 1,
-1.583319, 0.4699767, -1.742472, 1, 0.3372549, 0, 1,
-1.581122, -1.204921, -1.816324, 1, 0.3411765, 0, 1,
-1.572346, 0.8423403, -1.224444, 1, 0.3490196, 0, 1,
-1.569325, -0.8776317, -2.23201, 1, 0.3529412, 0, 1,
-1.564023, 0.626317, -2.809798, 1, 0.3607843, 0, 1,
-1.56018, 0.5245953, 0.2408058, 1, 0.3647059, 0, 1,
-1.555933, 0.06837244, -1.591965, 1, 0.372549, 0, 1,
-1.553214, 0.06542588, -1.616987, 1, 0.3764706, 0, 1,
-1.542445, 0.3544187, -0.9292982, 1, 0.3843137, 0, 1,
-1.542065, -1.466268, -2.497341, 1, 0.3882353, 0, 1,
-1.501, 0.7838126, -2.542582, 1, 0.3960784, 0, 1,
-1.493234, -0.188748, -2.481511, 1, 0.4039216, 0, 1,
-1.486651, 0.8475637, -1.429309, 1, 0.4078431, 0, 1,
-1.481169, 0.2800362, -3.131104, 1, 0.4156863, 0, 1,
-1.476966, -0.5386361, -2.550681, 1, 0.4196078, 0, 1,
-1.457487, 0.7559263, -2.135477, 1, 0.427451, 0, 1,
-1.451216, 1.022506, -2.406421, 1, 0.4313726, 0, 1,
-1.427946, -0.9883547, -2.571301, 1, 0.4392157, 0, 1,
-1.423931, 1.188594, 0.4272645, 1, 0.4431373, 0, 1,
-1.420128, 1.585532, -0.9477188, 1, 0.4509804, 0, 1,
-1.416824, 1.068545, -2.026184, 1, 0.454902, 0, 1,
-1.412523, -0.4685547, -1.624947, 1, 0.4627451, 0, 1,
-1.406752, 0.1608205, 0.42022, 1, 0.4666667, 0, 1,
-1.405831, 1.271188, -1.51201, 1, 0.4745098, 0, 1,
-1.399405, -0.4293827, -3.007342, 1, 0.4784314, 0, 1,
-1.396166, 1.531782, -1.520878, 1, 0.4862745, 0, 1,
-1.388935, 0.5603179, -0.4062664, 1, 0.4901961, 0, 1,
-1.385502, 1.422784, -1.451705, 1, 0.4980392, 0, 1,
-1.363041, 0.4649063, -2.710593, 1, 0.5058824, 0, 1,
-1.362956, -1.707137, -0.8774771, 1, 0.509804, 0, 1,
-1.362802, 2.174617, -1.438907, 1, 0.5176471, 0, 1,
-1.35843, -1.611529, -2.307927, 1, 0.5215687, 0, 1,
-1.354557, 0.0005455801, -0.7551383, 1, 0.5294118, 0, 1,
-1.353037, -1.011069, -1.800429, 1, 0.5333334, 0, 1,
-1.348976, -0.7320614, -2.328733, 1, 0.5411765, 0, 1,
-1.345138, -0.5343115, -0.6050022, 1, 0.5450981, 0, 1,
-1.34509, -1.444566, -3.451931, 1, 0.5529412, 0, 1,
-1.338434, -1.353063, -2.293441, 1, 0.5568628, 0, 1,
-1.336255, -0.5002794, -1.718839, 1, 0.5647059, 0, 1,
-1.334322, 2.1539, 0.3052696, 1, 0.5686275, 0, 1,
-1.315062, 1.163743, 0.2997294, 1, 0.5764706, 0, 1,
-1.305234, 0.2266126, -1.032303, 1, 0.5803922, 0, 1,
-1.304377, -0.09611132, -1.431589, 1, 0.5882353, 0, 1,
-1.303319, 0.1487675, -1.630639, 1, 0.5921569, 0, 1,
-1.301262, 1.87581, 0.08908574, 1, 0.6, 0, 1,
-1.295961, 0.09623115, -2.060054, 1, 0.6078432, 0, 1,
-1.288849, -0.63226, -2.38044, 1, 0.6117647, 0, 1,
-1.284943, 0.4927119, -0.573366, 1, 0.6196079, 0, 1,
-1.277875, -1.720456, -1.270368, 1, 0.6235294, 0, 1,
-1.274718, 0.3095455, -0.2103351, 1, 0.6313726, 0, 1,
-1.261842, 2.373643, -0.970642, 1, 0.6352941, 0, 1,
-1.260817, 1.424082, -0.4161187, 1, 0.6431373, 0, 1,
-1.254803, -1.420673, -2.715561, 1, 0.6470588, 0, 1,
-1.253984, 0.8417016, -0.5099126, 1, 0.654902, 0, 1,
-1.251937, -0.5983526, -3.248542, 1, 0.6588235, 0, 1,
-1.249287, -0.1138197, -0.742139, 1, 0.6666667, 0, 1,
-1.241821, -0.4859488, -2.923752, 1, 0.6705883, 0, 1,
-1.22773, -1.014396, -1.412922, 1, 0.6784314, 0, 1,
-1.215162, -0.06211376, -3.090004, 1, 0.682353, 0, 1,
-1.208586, -0.4734831, 0.07805912, 1, 0.6901961, 0, 1,
-1.20793, -0.5190921, -2.1464, 1, 0.6941177, 0, 1,
-1.201209, 0.2473487, -0.3030888, 1, 0.7019608, 0, 1,
-1.191944, 0.3794726, 1.064266, 1, 0.7098039, 0, 1,
-1.168855, 0.5681572, -2.246907, 1, 0.7137255, 0, 1,
-1.1676, 2.757206, -2.163015, 1, 0.7215686, 0, 1,
-1.166515, -1.794169, -3.180097, 1, 0.7254902, 0, 1,
-1.166083, -0.2951669, -1.964409, 1, 0.7333333, 0, 1,
-1.161028, 0.6689183, -0.6413167, 1, 0.7372549, 0, 1,
-1.159913, -0.1477483, -0.6357916, 1, 0.7450981, 0, 1,
-1.15716, 0.4800109, -2.118454, 1, 0.7490196, 0, 1,
-1.154281, 0.9064705, -1.565466, 1, 0.7568628, 0, 1,
-1.153393, 1.775656, -0.9767798, 1, 0.7607843, 0, 1,
-1.149411, 1.359226, 0.001757796, 1, 0.7686275, 0, 1,
-1.139812, -1.136718, -5.203193, 1, 0.772549, 0, 1,
-1.123726, 0.07182947, -1.901477, 1, 0.7803922, 0, 1,
-1.115539, -0.1463542, -1.707948, 1, 0.7843137, 0, 1,
-1.114259, 0.971127, -1.023902, 1, 0.7921569, 0, 1,
-1.108546, -1.563233, -2.618508, 1, 0.7960784, 0, 1,
-1.105183, -1.998196, -2.468903, 1, 0.8039216, 0, 1,
-1.105087, 0.2498804, -0.5846303, 1, 0.8117647, 0, 1,
-1.091809, 0.02532354, -0.7367781, 1, 0.8156863, 0, 1,
-1.091286, 0.4122142, -2.573651, 1, 0.8235294, 0, 1,
-1.084662, 0.6396941, -0.6811654, 1, 0.827451, 0, 1,
-1.081779, -1.957314, -2.731263, 1, 0.8352941, 0, 1,
-1.079146, 1.684343, 0.7325991, 1, 0.8392157, 0, 1,
-1.078093, 0.6522925, -0.7994773, 1, 0.8470588, 0, 1,
-1.075734, -0.6181797, -2.679292, 1, 0.8509804, 0, 1,
-1.071775, -0.07210342, -2.514529, 1, 0.8588235, 0, 1,
-1.070383, 0.2441871, -1.636807, 1, 0.8627451, 0, 1,
-1.065359, 0.08249787, -2.121935, 1, 0.8705882, 0, 1,
-1.064178, 0.2939709, -1.395754, 1, 0.8745098, 0, 1,
-1.062119, 0.8021432, -0.8520339, 1, 0.8823529, 0, 1,
-1.051495, -0.9105412, -0.879142, 1, 0.8862745, 0, 1,
-1.048279, -0.4543866, -2.773872, 1, 0.8941177, 0, 1,
-1.047818, -0.3068704, -2.603041, 1, 0.8980392, 0, 1,
-1.033261, -1.825775, -2.577726, 1, 0.9058824, 0, 1,
-1.023715, 1.017543, -1.281287, 1, 0.9137255, 0, 1,
-1.023121, -0.8644644, -2.981838, 1, 0.9176471, 0, 1,
-1.02075, 0.204755, 0.1646743, 1, 0.9254902, 0, 1,
-1.020178, -1.30166, -3.074368, 1, 0.9294118, 0, 1,
-1.018066, 1.455704, -2.229027, 1, 0.9372549, 0, 1,
-1.015852, 0.4286264, -1.151691, 1, 0.9411765, 0, 1,
-1.013961, -0.2068556, -0.7029654, 1, 0.9490196, 0, 1,
-1.012681, 1.66278, -1.50671, 1, 0.9529412, 0, 1,
-1.011564, -0.6792858, -1.034434, 1, 0.9607843, 0, 1,
-1.003485, 0.842144, -1.286212, 1, 0.9647059, 0, 1,
-1.002954, -0.4316757, -2.155003, 1, 0.972549, 0, 1,
-1.001613, 0.2519912, -2.274545, 1, 0.9764706, 0, 1,
-0.9999961, -1.046142, -2.818063, 1, 0.9843137, 0, 1,
-0.9974533, -0.2123329, -1.682908, 1, 0.9882353, 0, 1,
-0.9947805, 0.7733898, -2.231839, 1, 0.9960784, 0, 1,
-0.9941484, -0.5562018, -1.233347, 0.9960784, 1, 0, 1,
-0.9931757, -1.737785, -1.331043, 0.9921569, 1, 0, 1,
-0.9881156, -1.378493, -0.8755049, 0.9843137, 1, 0, 1,
-0.983089, 1.475301, 2.429623, 0.9803922, 1, 0, 1,
-0.9794828, 0.3172659, -1.420698, 0.972549, 1, 0, 1,
-0.9755619, 0.1594178, -0.1794487, 0.9686275, 1, 0, 1,
-0.9751515, -1.189561, -3.668756, 0.9607843, 1, 0, 1,
-0.9734583, 0.2124747, -1.903704, 0.9568627, 1, 0, 1,
-0.9682427, -0.7605142, -1.640753, 0.9490196, 1, 0, 1,
-0.9677558, 1.750722, 0.2121196, 0.945098, 1, 0, 1,
-0.9634905, 0.4914243, -0.5938969, 0.9372549, 1, 0, 1,
-0.9618909, 0.6377562, -0.660488, 0.9333333, 1, 0, 1,
-0.9568163, -0.126774, -3.045912, 0.9254902, 1, 0, 1,
-0.95522, 1.855567, -1.998969, 0.9215686, 1, 0, 1,
-0.9509441, 0.9835156, -0.457916, 0.9137255, 1, 0, 1,
-0.9502292, 0.9476099, -1.309555, 0.9098039, 1, 0, 1,
-0.9428045, 1.191298, -0.4019428, 0.9019608, 1, 0, 1,
-0.9381567, 0.1538325, -0.2988978, 0.8941177, 1, 0, 1,
-0.9327853, 0.5306437, -0.2087051, 0.8901961, 1, 0, 1,
-0.9189433, -0.5919698, -1.140795, 0.8823529, 1, 0, 1,
-0.9187707, -1.710846, -3.150511, 0.8784314, 1, 0, 1,
-0.9068598, -0.5519905, -1.793864, 0.8705882, 1, 0, 1,
-0.9022226, 1.382848, 1.042513, 0.8666667, 1, 0, 1,
-0.8918917, 1.654451, -1.805889, 0.8588235, 1, 0, 1,
-0.8844447, 0.6420735, -0.9057884, 0.854902, 1, 0, 1,
-0.8768211, -1.072727, -4.555746, 0.8470588, 1, 0, 1,
-0.8645469, -0.4340813, -2.959331, 0.8431373, 1, 0, 1,
-0.8576014, -1.91168, -2.834725, 0.8352941, 1, 0, 1,
-0.8317031, -1.00032, -2.793809, 0.8313726, 1, 0, 1,
-0.8278967, -0.6425402, -1.532326, 0.8235294, 1, 0, 1,
-0.8208917, -0.3275699, -1.622723, 0.8196079, 1, 0, 1,
-0.8188347, -0.8292625, -2.006621, 0.8117647, 1, 0, 1,
-0.8173794, 0.1733096, -0.3750164, 0.8078431, 1, 0, 1,
-0.8155479, -0.6458014, -4.552608, 0.8, 1, 0, 1,
-0.8143908, 1.622813, -0.04178677, 0.7921569, 1, 0, 1,
-0.8068983, 0.3315706, -1.270836, 0.7882353, 1, 0, 1,
-0.8068477, -1.164343, -1.982724, 0.7803922, 1, 0, 1,
-0.8058264, 0.8142597, 0.2663393, 0.7764706, 1, 0, 1,
-0.805694, -0.09414142, -0.1182217, 0.7686275, 1, 0, 1,
-0.8043283, 2.491107, -0.5169988, 0.7647059, 1, 0, 1,
-0.8018963, 2.006201, 0.1480382, 0.7568628, 1, 0, 1,
-0.7981116, -0.4866114, -1.93947, 0.7529412, 1, 0, 1,
-0.7971082, -0.595745, -2.538387, 0.7450981, 1, 0, 1,
-0.7963955, -0.1057094, -0.6506425, 0.7411765, 1, 0, 1,
-0.7960952, -0.3449595, -2.193011, 0.7333333, 1, 0, 1,
-0.7941098, -1.205345, -1.203228, 0.7294118, 1, 0, 1,
-0.7899096, 1.078926, -0.9733954, 0.7215686, 1, 0, 1,
-0.787331, 0.5521508, -0.1210163, 0.7176471, 1, 0, 1,
-0.7806709, -1.070233, -1.329939, 0.7098039, 1, 0, 1,
-0.776019, -1.56935, -2.681537, 0.7058824, 1, 0, 1,
-0.7742965, -0.7499937, -0.4034247, 0.6980392, 1, 0, 1,
-0.7691405, -0.8441894, -0.7387959, 0.6901961, 1, 0, 1,
-0.769101, 0.5613248, -1.103493, 0.6862745, 1, 0, 1,
-0.7677497, -0.2788119, -0.2750923, 0.6784314, 1, 0, 1,
-0.7635035, -0.4430506, -1.617747, 0.6745098, 1, 0, 1,
-0.7620478, -0.02777001, -2.040849, 0.6666667, 1, 0, 1,
-0.7534108, -0.6059734, -4.659405, 0.6627451, 1, 0, 1,
-0.7523347, -1.055555, -2.995216, 0.654902, 1, 0, 1,
-0.7512252, -0.06283239, -0.06464621, 0.6509804, 1, 0, 1,
-0.7480577, -0.8674352, -3.8681, 0.6431373, 1, 0, 1,
-0.7466549, -0.4570207, -0.6140385, 0.6392157, 1, 0, 1,
-0.730713, -0.3139944, -2.097643, 0.6313726, 1, 0, 1,
-0.7305655, 0.130143, -1.849365, 0.627451, 1, 0, 1,
-0.7292084, -0.5097322, -1.457005, 0.6196079, 1, 0, 1,
-0.7288109, 0.3289309, -1.788347, 0.6156863, 1, 0, 1,
-0.7282879, 0.1709725, -0.8740113, 0.6078432, 1, 0, 1,
-0.7252414, -1.030528, -2.707172, 0.6039216, 1, 0, 1,
-0.7235005, 0.3751482, 0.09063063, 0.5960785, 1, 0, 1,
-0.7214224, -0.3611723, -2.153839, 0.5882353, 1, 0, 1,
-0.7142595, -0.2675833, -3.232354, 0.5843138, 1, 0, 1,
-0.7140275, 0.654475, -0.09031267, 0.5764706, 1, 0, 1,
-0.7127598, -0.4393669, -2.106532, 0.572549, 1, 0, 1,
-0.7094058, 0.4394123, -0.6002643, 0.5647059, 1, 0, 1,
-0.6969236, 0.4509021, -0.3786558, 0.5607843, 1, 0, 1,
-0.6926544, 0.09961996, -2.134073, 0.5529412, 1, 0, 1,
-0.6917689, 1.557159, -1.40418, 0.5490196, 1, 0, 1,
-0.6894616, -0.918025, -1.915163, 0.5411765, 1, 0, 1,
-0.688125, 1.124547, -1.109461, 0.5372549, 1, 0, 1,
-0.6879925, -0.324037, -1.778071, 0.5294118, 1, 0, 1,
-0.6870924, -0.1476323, 0.07264771, 0.5254902, 1, 0, 1,
-0.6838698, 0.5533282, -0.6854292, 0.5176471, 1, 0, 1,
-0.6830509, -0.1609253, -1.78826, 0.5137255, 1, 0, 1,
-0.6661066, -1.119555, -3.484449, 0.5058824, 1, 0, 1,
-0.6633416, -1.594432, -2.459745, 0.5019608, 1, 0, 1,
-0.6565995, 0.08575694, -1.540799, 0.4941176, 1, 0, 1,
-0.6539853, -1.467583, -3.247447, 0.4862745, 1, 0, 1,
-0.6537947, 0.7906499, -1.556494, 0.4823529, 1, 0, 1,
-0.6537875, 0.04838258, -1.3847, 0.4745098, 1, 0, 1,
-0.65039, 0.9684727, -1.989644, 0.4705882, 1, 0, 1,
-0.637394, -0.6771035, -2.433165, 0.4627451, 1, 0, 1,
-0.6322747, -0.3519171, -1.875041, 0.4588235, 1, 0, 1,
-0.6313239, 0.3011412, -0.4951629, 0.4509804, 1, 0, 1,
-0.6280983, -0.4707141, -2.384404, 0.4470588, 1, 0, 1,
-0.6226597, 0.9802753, -2.592268, 0.4392157, 1, 0, 1,
-0.6211767, -1.465443, -2.796937, 0.4352941, 1, 0, 1,
-0.6193786, -0.6950685, -1.597633, 0.427451, 1, 0, 1,
-0.6159449, -1.234402, -4.783064, 0.4235294, 1, 0, 1,
-0.6137505, 0.6045576, -0.6631994, 0.4156863, 1, 0, 1,
-0.6123534, -1.545576, -4.936607, 0.4117647, 1, 0, 1,
-0.6116053, 1.011111, -1.301934, 0.4039216, 1, 0, 1,
-0.6095738, -0.6391585, -2.419708, 0.3960784, 1, 0, 1,
-0.6076173, 0.3495026, -1.738189, 0.3921569, 1, 0, 1,
-0.6072564, -0.07268061, -2.851567, 0.3843137, 1, 0, 1,
-0.6029489, -0.6224643, -3.241702, 0.3803922, 1, 0, 1,
-0.6002536, -1.886421, -3.241386, 0.372549, 1, 0, 1,
-0.5991915, 0.2978358, -0.380182, 0.3686275, 1, 0, 1,
-0.5986674, -0.8730515, -1.434535, 0.3607843, 1, 0, 1,
-0.5974855, -0.3103201, -1.434017, 0.3568628, 1, 0, 1,
-0.5967085, -0.9003312, -3.601506, 0.3490196, 1, 0, 1,
-0.5954452, -1.295796, -1.331604, 0.345098, 1, 0, 1,
-0.5954409, -0.008745866, -0.8579122, 0.3372549, 1, 0, 1,
-0.5908719, 1.25323, -1.391309, 0.3333333, 1, 0, 1,
-0.5898873, 1.086461, -0.7113444, 0.3254902, 1, 0, 1,
-0.5882505, -1.25433, -2.063926, 0.3215686, 1, 0, 1,
-0.5876845, 1.417655, 0.689738, 0.3137255, 1, 0, 1,
-0.5850249, 2.110103, -1.297064, 0.3098039, 1, 0, 1,
-0.5799386, 0.2963795, -0.7516442, 0.3019608, 1, 0, 1,
-0.5766338, -0.6253617, -2.704567, 0.2941177, 1, 0, 1,
-0.5737109, -0.4491966, -2.268404, 0.2901961, 1, 0, 1,
-0.573129, -0.7406918, -1.333279, 0.282353, 1, 0, 1,
-0.5730903, 0.336768, -2.083557, 0.2784314, 1, 0, 1,
-0.5676496, -0.3968922, -1.715916, 0.2705882, 1, 0, 1,
-0.5645949, 0.1496917, -1.523286, 0.2666667, 1, 0, 1,
-0.561406, -0.06483702, -1.49237, 0.2588235, 1, 0, 1,
-0.5597649, 0.3792594, -0.9992531, 0.254902, 1, 0, 1,
-0.5579379, -0.8200567, -2.011071, 0.2470588, 1, 0, 1,
-0.5574394, -0.1559291, -2.449964, 0.2431373, 1, 0, 1,
-0.5515729, -0.8435515, -1.939511, 0.2352941, 1, 0, 1,
-0.5452833, -0.3504141, -3.376199, 0.2313726, 1, 0, 1,
-0.545012, 0.80684, 2.120727, 0.2235294, 1, 0, 1,
-0.5397047, -1.435574, -2.511029, 0.2196078, 1, 0, 1,
-0.5359789, 0.8084346, -0.5168104, 0.2117647, 1, 0, 1,
-0.535062, -0.3118132, -3.21152, 0.2078431, 1, 0, 1,
-0.5284936, -0.5752969, -0.7365441, 0.2, 1, 0, 1,
-0.5215755, 0.006376135, -1.931424, 0.1921569, 1, 0, 1,
-0.5164291, -0.3403188, -1.839115, 0.1882353, 1, 0, 1,
-0.5132681, -1.11431, -3.061079, 0.1803922, 1, 0, 1,
-0.5092658, 0.3277266, 0.3127643, 0.1764706, 1, 0, 1,
-0.5057861, 0.6731029, -0.1142479, 0.1686275, 1, 0, 1,
-0.4953732, 1.023786, -1.975724, 0.1647059, 1, 0, 1,
-0.4951873, 1.551966, 0.2625145, 0.1568628, 1, 0, 1,
-0.4935786, -0.3636032, -2.245308, 0.1529412, 1, 0, 1,
-0.4926746, 1.203556, -0.8711463, 0.145098, 1, 0, 1,
-0.4902804, -1.173055, -3.269288, 0.1411765, 1, 0, 1,
-0.484951, -0.7819234, -2.388851, 0.1333333, 1, 0, 1,
-0.4844353, 1.576878, 0.6289002, 0.1294118, 1, 0, 1,
-0.4781763, -1.208714, -2.946776, 0.1215686, 1, 0, 1,
-0.4736755, -1.810752, -3.22153, 0.1176471, 1, 0, 1,
-0.4707845, -0.7122661, -3.383228, 0.1098039, 1, 0, 1,
-0.4628801, 0.5159799, -0.6540393, 0.1058824, 1, 0, 1,
-0.461868, -1.333021, -2.633809, 0.09803922, 1, 0, 1,
-0.4602941, 0.112937, -1.752674, 0.09019608, 1, 0, 1,
-0.4472452, 0.2669058, -3.175733, 0.08627451, 1, 0, 1,
-0.4472402, -0.6622844, -3.177688, 0.07843138, 1, 0, 1,
-0.446609, -0.04781565, -2.370551, 0.07450981, 1, 0, 1,
-0.4460441, -0.6492094, -2.230166, 0.06666667, 1, 0, 1,
-0.4447202, -1.108544, -2.388328, 0.0627451, 1, 0, 1,
-0.4428717, -2.331339, -3.726304, 0.05490196, 1, 0, 1,
-0.4411756, -1.178844, -5.226849, 0.05098039, 1, 0, 1,
-0.4404821, 1.111409, -0.08632779, 0.04313726, 1, 0, 1,
-0.4381864, 0.7776965, -0.6163282, 0.03921569, 1, 0, 1,
-0.4305831, -0.2696952, -1.07971, 0.03137255, 1, 0, 1,
-0.4266984, -0.5371688, -4.134595, 0.02745098, 1, 0, 1,
-0.4261829, 1.63119, 0.6381305, 0.01960784, 1, 0, 1,
-0.4205442, -0.3629221, -2.452374, 0.01568628, 1, 0, 1,
-0.4198883, 0.7555346, -1.941971, 0.007843138, 1, 0, 1,
-0.4183285, 0.4436785, -1.317457, 0.003921569, 1, 0, 1,
-0.4093879, 1.125999, 1.203973, 0, 1, 0.003921569, 1,
-0.4085915, 0.5955503, -1.652812, 0, 1, 0.01176471, 1,
-0.4060863, 0.4341557, -1.135248, 0, 1, 0.01568628, 1,
-0.4052115, 1.750894, -1.7701, 0, 1, 0.02352941, 1,
-0.4040543, 1.001992, 0.8971327, 0, 1, 0.02745098, 1,
-0.4034382, 0.9172971, -2.931505, 0, 1, 0.03529412, 1,
-0.402507, 0.003136315, -2.932686, 0, 1, 0.03921569, 1,
-0.3931531, -0.4161713, -3.170618, 0, 1, 0.04705882, 1,
-0.3915152, 0.1439464, 0.4110647, 0, 1, 0.05098039, 1,
-0.3910661, -1.729074, -2.015078, 0, 1, 0.05882353, 1,
-0.3829792, 0.6556719, -0.3068395, 0, 1, 0.0627451, 1,
-0.3814989, -1.751824, -4.16929, 0, 1, 0.07058824, 1,
-0.3800859, -0.2726795, -1.605331, 0, 1, 0.07450981, 1,
-0.3769354, -0.9399612, -1.531077, 0, 1, 0.08235294, 1,
-0.3744071, 0.4046695, -1.430884, 0, 1, 0.08627451, 1,
-0.3743584, -0.7578585, -2.48343, 0, 1, 0.09411765, 1,
-0.3728064, -0.04786191, -1.292764, 0, 1, 0.1019608, 1,
-0.3720009, 0.5240053, 0.2715987, 0, 1, 0.1058824, 1,
-0.3706703, -0.238872, -3.07673, 0, 1, 0.1137255, 1,
-0.3662707, -0.09382191, -2.21082, 0, 1, 0.1176471, 1,
-0.3652136, 0.6593578, -0.5550925, 0, 1, 0.1254902, 1,
-0.364971, -0.7028534, -2.615229, 0, 1, 0.1294118, 1,
-0.3644623, 1.059538, -0.6766257, 0, 1, 0.1372549, 1,
-0.3642399, 0.5659084, -0.4657708, 0, 1, 0.1411765, 1,
-0.3640073, 0.3181079, -1.755515, 0, 1, 0.1490196, 1,
-0.3591443, 1.415326, 0.01566894, 0, 1, 0.1529412, 1,
-0.3565791, -2.027202, -2.579211, 0, 1, 0.1607843, 1,
-0.3537081, -0.546783, -3.287769, 0, 1, 0.1647059, 1,
-0.3497441, -0.1481567, -1.539232, 0, 1, 0.172549, 1,
-0.3473874, -1.305425, -1.980091, 0, 1, 0.1764706, 1,
-0.3439048, -2.585531, -2.763456, 0, 1, 0.1843137, 1,
-0.343302, 0.6218259, -0.3523504, 0, 1, 0.1882353, 1,
-0.3431259, 0.3768821, -0.6421849, 0, 1, 0.1960784, 1,
-0.3395855, 0.8284122, -1.783447, 0, 1, 0.2039216, 1,
-0.3366932, 0.9997458, -0.1650817, 0, 1, 0.2078431, 1,
-0.3306161, -2.377481, -3.00111, 0, 1, 0.2156863, 1,
-0.3297217, 1.998045, -1.054732, 0, 1, 0.2196078, 1,
-0.3269896, 0.3631926, -0.9572085, 0, 1, 0.227451, 1,
-0.3261573, -1.006228, -4.594009, 0, 1, 0.2313726, 1,
-0.3256903, -0.7096579, -3.814401, 0, 1, 0.2392157, 1,
-0.3252657, -0.5405113, -5.105779, 0, 1, 0.2431373, 1,
-0.3223799, 0.01284476, -1.198955, 0, 1, 0.2509804, 1,
-0.3164635, -0.769471, -1.726416, 0, 1, 0.254902, 1,
-0.313046, -0.2006548, -2.385472, 0, 1, 0.2627451, 1,
-0.3110247, -0.4008979, -2.034503, 0, 1, 0.2666667, 1,
-0.3106537, 1.109492, -1.069556, 0, 1, 0.2745098, 1,
-0.3079002, -0.2636512, -3.921412, 0, 1, 0.2784314, 1,
-0.3068557, 0.1856126, -1.061077, 0, 1, 0.2862745, 1,
-0.3055418, -2.008009, -2.759829, 0, 1, 0.2901961, 1,
-0.3050334, -0.330453, -4.176514, 0, 1, 0.2980392, 1,
-0.2991476, 0.2847882, 0.9000207, 0, 1, 0.3058824, 1,
-0.2988122, 0.4259048, -0.6542072, 0, 1, 0.3098039, 1,
-0.2966662, 0.2731467, -1.66191, 0, 1, 0.3176471, 1,
-0.2943034, 1.83746, 0.8567088, 0, 1, 0.3215686, 1,
-0.2926967, 0.01906617, -0.2589792, 0, 1, 0.3294118, 1,
-0.2897296, -0.6723416, -0.5244028, 0, 1, 0.3333333, 1,
-0.2880061, -0.07634217, 0.6926187, 0, 1, 0.3411765, 1,
-0.2865781, -1.692505, -3.282917, 0, 1, 0.345098, 1,
-0.2824923, 0.6487615, 0.09043807, 0, 1, 0.3529412, 1,
-0.2744154, 1.442677, 1.536564, 0, 1, 0.3568628, 1,
-0.2679436, -0.1735707, -2.923835, 0, 1, 0.3647059, 1,
-0.2613941, 1.113505, -2.632256, 0, 1, 0.3686275, 1,
-0.2569419, 0.8828696, -1.77549, 0, 1, 0.3764706, 1,
-0.2555872, -0.6002646, -3.329139, 0, 1, 0.3803922, 1,
-0.2547992, 0.8546994, -0.41138, 0, 1, 0.3882353, 1,
-0.2527909, 0.07248212, -0.7939932, 0, 1, 0.3921569, 1,
-0.2513504, -0.5651794, -3.092728, 0, 1, 0.4, 1,
-0.2508531, -0.3355404, -2.503092, 0, 1, 0.4078431, 1,
-0.2428807, 1.339233, 0.1232833, 0, 1, 0.4117647, 1,
-0.2411058, -0.1518885, -3.070776, 0, 1, 0.4196078, 1,
-0.2321417, 0.4911776, -2.014778, 0, 1, 0.4235294, 1,
-0.2307268, -0.5728358, -1.669617, 0, 1, 0.4313726, 1,
-0.2259731, 0.2024713, -0.3328106, 0, 1, 0.4352941, 1,
-0.2203755, 0.7417171, -0.1741684, 0, 1, 0.4431373, 1,
-0.2126094, -0.8443192, -3.335273, 0, 1, 0.4470588, 1,
-0.210884, 0.7118609, -1.809327, 0, 1, 0.454902, 1,
-0.2037423, -1.946184, -4.126503, 0, 1, 0.4588235, 1,
-0.2014286, -0.6096795, -2.327981, 0, 1, 0.4666667, 1,
-0.2007461, -0.3684582, -1.365409, 0, 1, 0.4705882, 1,
-0.2003735, -0.05258801, -2.49624, 0, 1, 0.4784314, 1,
-0.1948613, -0.7865326, -2.698472, 0, 1, 0.4823529, 1,
-0.1836973, 0.1096911, -1.531636, 0, 1, 0.4901961, 1,
-0.1818706, 0.4997259, -0.2129589, 0, 1, 0.4941176, 1,
-0.1816018, 0.3224587, 0.3315759, 0, 1, 0.5019608, 1,
-0.179088, 0.4996287, -0.8090215, 0, 1, 0.509804, 1,
-0.1776228, 0.5000363, -2.960907, 0, 1, 0.5137255, 1,
-0.177053, -0.2947251, -3.065052, 0, 1, 0.5215687, 1,
-0.1727088, 2.15073, 1.079664, 0, 1, 0.5254902, 1,
-0.1673833, -0.849367, -5.335458, 0, 1, 0.5333334, 1,
-0.1653609, -0.2277263, -2.2229, 0, 1, 0.5372549, 1,
-0.1636131, 0.09190316, 0.3485624, 0, 1, 0.5450981, 1,
-0.1552848, 0.8507876, 0.01689123, 0, 1, 0.5490196, 1,
-0.1483827, 0.1640269, -1.784676, 0, 1, 0.5568628, 1,
-0.1473789, -0.03567427, -2.077956, 0, 1, 0.5607843, 1,
-0.1415856, 0.06203445, -1.45142, 0, 1, 0.5686275, 1,
-0.1402934, 1.126411, -0.711659, 0, 1, 0.572549, 1,
-0.138432, -1.719127, -2.764332, 0, 1, 0.5803922, 1,
-0.1379275, -0.3671024, -3.113276, 0, 1, 0.5843138, 1,
-0.1370805, 0.1106718, -0.2393142, 0, 1, 0.5921569, 1,
-0.1307679, 1.427606, 0.6712081, 0, 1, 0.5960785, 1,
-0.1267287, 1.407691, 1.000691, 0, 1, 0.6039216, 1,
-0.1256753, -1.612358, -2.021842, 0, 1, 0.6117647, 1,
-0.1242452, 1.899046, -0.2420224, 0, 1, 0.6156863, 1,
-0.124184, 3.20716, -0.3113163, 0, 1, 0.6235294, 1,
-0.1195933, -0.02277716, -0.7820033, 0, 1, 0.627451, 1,
-0.1183827, -0.452947, -3.200616, 0, 1, 0.6352941, 1,
-0.1148783, -0.4286687, -2.461575, 0, 1, 0.6392157, 1,
-0.1144766, -1.225689, -2.617069, 0, 1, 0.6470588, 1,
-0.1136117, -0.5152934, -3.697949, 0, 1, 0.6509804, 1,
-0.1109321, -0.4630834, -2.953561, 0, 1, 0.6588235, 1,
-0.1067987, 0.1899474, -0.7077082, 0, 1, 0.6627451, 1,
-0.1066829, 1.005611, -0.2149226, 0, 1, 0.6705883, 1,
-0.1065808, 0.2558656, -0.2130316, 0, 1, 0.6745098, 1,
-0.1006088, -0.06461217, -1.526926, 0, 1, 0.682353, 1,
-0.09960902, 0.6750019, 2.548634, 0, 1, 0.6862745, 1,
-0.09739824, -0.1222238, -2.080262, 0, 1, 0.6941177, 1,
-0.09668117, 1.327443, 0.4736419, 0, 1, 0.7019608, 1,
-0.09425887, -1.301725, -1.827464, 0, 1, 0.7058824, 1,
-0.08938631, 1.54073, -0.4326674, 0, 1, 0.7137255, 1,
-0.08862262, 0.666243, -1.798728, 0, 1, 0.7176471, 1,
-0.08719307, -0.853293, -3.769919, 0, 1, 0.7254902, 1,
-0.08620133, -1.011745, -2.064997, 0, 1, 0.7294118, 1,
-0.08538099, 0.4081761, -0.5093095, 0, 1, 0.7372549, 1,
-0.08407401, 0.6539388, 1.456567, 0, 1, 0.7411765, 1,
-0.07594647, 0.01774165, -0.9276397, 0, 1, 0.7490196, 1,
-0.07530119, -0.9560491, -4.121613, 0, 1, 0.7529412, 1,
-0.07324957, -0.02394468, -2.770286, 0, 1, 0.7607843, 1,
-0.06868076, -3.325166, -3.775308, 0, 1, 0.7647059, 1,
-0.06647141, 0.1078761, -1.401644, 0, 1, 0.772549, 1,
-0.06621234, 1.491911, 2.376035, 0, 1, 0.7764706, 1,
-0.06307382, 0.2685148, -1.07143, 0, 1, 0.7843137, 1,
-0.06018354, 1.205607, 1.191106, 0, 1, 0.7882353, 1,
-0.05814733, -0.2914267, -2.878737, 0, 1, 0.7960784, 1,
-0.04958511, -0.598116, -4.576678, 0, 1, 0.8039216, 1,
-0.04808062, -0.6017008, -2.461823, 0, 1, 0.8078431, 1,
-0.04710761, 0.7711583, 1.352875, 0, 1, 0.8156863, 1,
-0.04668054, 1.603327, -1.507375, 0, 1, 0.8196079, 1,
-0.04493287, 0.0841554, -0.1862605, 0, 1, 0.827451, 1,
-0.04237906, -0.1168324, -2.197902, 0, 1, 0.8313726, 1,
-0.04189664, 0.4854209, -0.8790539, 0, 1, 0.8392157, 1,
-0.0272047, -0.5334077, -1.856291, 0, 1, 0.8431373, 1,
-0.02623451, 0.4495106, -1.951276, 0, 1, 0.8509804, 1,
-0.02457712, 0.04576306, -0.5916194, 0, 1, 0.854902, 1,
-0.0244804, -1.181666, -2.608986, 0, 1, 0.8627451, 1,
-0.02161824, 1.188305, -0.09697495, 0, 1, 0.8666667, 1,
-0.01934625, 0.2977264, -0.05824468, 0, 1, 0.8745098, 1,
-0.01850214, -0.416334, -3.406795, 0, 1, 0.8784314, 1,
-0.01848231, 0.436264, -0.7202011, 0, 1, 0.8862745, 1,
-0.01600104, -0.3552698, -3.231257, 0, 1, 0.8901961, 1,
-0.01127606, -1.174721, -3.902157, 0, 1, 0.8980392, 1,
-0.009606906, -0.4292421, -5.041069, 0, 1, 0.9058824, 1,
-0.007935537, 0.04543502, 0.3914273, 0, 1, 0.9098039, 1,
-0.005802985, -0.08898368, -4.257018, 0, 1, 0.9176471, 1,
-0.003220379, 0.6197799, -1.325067, 0, 1, 0.9215686, 1,
-0.002635634, -0.7731462, -3.173838, 0, 1, 0.9294118, 1,
0.002323918, -0.9036351, 3.157853, 0, 1, 0.9333333, 1,
0.005101854, 0.2797157, -0.1401541, 0, 1, 0.9411765, 1,
0.009141745, 0.9487554, 1.825319, 0, 1, 0.945098, 1,
0.01257825, 0.4369536, -1.707026, 0, 1, 0.9529412, 1,
0.01369065, 0.8238835, -0.009353726, 0, 1, 0.9568627, 1,
0.01562234, 0.07749195, 0.588716, 0, 1, 0.9647059, 1,
0.01950505, 0.02317283, -0.8788465, 0, 1, 0.9686275, 1,
0.02340688, -0.3531137, 2.775429, 0, 1, 0.9764706, 1,
0.02613075, 1.181924, -0.2066071, 0, 1, 0.9803922, 1,
0.02650782, -0.3576717, 4.079477, 0, 1, 0.9882353, 1,
0.02944005, -0.5627269, 4.34385, 0, 1, 0.9921569, 1,
0.03340103, -0.9247289, 3.845697, 0, 1, 1, 1,
0.03379551, -0.3599807, 2.074869, 0, 0.9921569, 1, 1,
0.03814089, -0.4318709, 3.804812, 0, 0.9882353, 1, 1,
0.03872439, 1.167685, 0.04132612, 0, 0.9803922, 1, 1,
0.03904868, 0.2912791, 0.4015368, 0, 0.9764706, 1, 1,
0.03957275, -0.3373605, 2.672471, 0, 0.9686275, 1, 1,
0.04086944, 0.9271693, -0.2474385, 0, 0.9647059, 1, 1,
0.0480097, 1.043131, -0.6769788, 0, 0.9568627, 1, 1,
0.05058262, 0.6814138, 1.209365, 0, 0.9529412, 1, 1,
0.05328526, -1.178122, 4.389976, 0, 0.945098, 1, 1,
0.06071265, -0.8171502, 1.296569, 0, 0.9411765, 1, 1,
0.06211403, 0.7778919, -0.9135132, 0, 0.9333333, 1, 1,
0.06264296, -1.03079, 2.997581, 0, 0.9294118, 1, 1,
0.06740585, 0.1651839, 1.15997, 0, 0.9215686, 1, 1,
0.0677408, -0.3978356, 2.129755, 0, 0.9176471, 1, 1,
0.07014318, 0.5611837, -2.108496, 0, 0.9098039, 1, 1,
0.07100984, 0.6410831, -0.8576989, 0, 0.9058824, 1, 1,
0.0756823, -0.2878283, 2.898041, 0, 0.8980392, 1, 1,
0.0787235, -0.01971696, 2.783828, 0, 0.8901961, 1, 1,
0.08038059, 0.6716359, -0.7552569, 0, 0.8862745, 1, 1,
0.08247628, -1.611861, 2.90552, 0, 0.8784314, 1, 1,
0.08294537, -0.9031557, 1.828906, 0, 0.8745098, 1, 1,
0.08642629, -1.212666, 3.701787, 0, 0.8666667, 1, 1,
0.08650959, 0.2053631, -0.1426605, 0, 0.8627451, 1, 1,
0.08691832, 0.4760687, 0.4032397, 0, 0.854902, 1, 1,
0.08792181, 0.9502071, -0.1921495, 0, 0.8509804, 1, 1,
0.08875588, -2.244119, 2.81415, 0, 0.8431373, 1, 1,
0.09092586, 0.6921868, 0.760861, 0, 0.8392157, 1, 1,
0.09130815, 0.3623531, -0.625045, 0, 0.8313726, 1, 1,
0.09223617, -0.5890678, 2.98663, 0, 0.827451, 1, 1,
0.09324699, 0.4213787, -0.5701571, 0, 0.8196079, 1, 1,
0.09439528, -0.6204012, 5.32941, 0, 0.8156863, 1, 1,
0.0988568, 0.2803291, 0.5871975, 0, 0.8078431, 1, 1,
0.1071234, -1.112429, 1.363356, 0, 0.8039216, 1, 1,
0.107215, -1.102846, 3.66267, 0, 0.7960784, 1, 1,
0.1130521, 0.371278, 0.3701065, 0, 0.7882353, 1, 1,
0.1137552, 0.001716467, 3.306635, 0, 0.7843137, 1, 1,
0.1150952, -1.719473, 2.884976, 0, 0.7764706, 1, 1,
0.1151835, 0.8975721, -0.04870937, 0, 0.772549, 1, 1,
0.115502, 1.01062, -0.4840125, 0, 0.7647059, 1, 1,
0.1161281, 0.218626, 0.7972837, 0, 0.7607843, 1, 1,
0.117672, 0.9227723, 0.3685794, 0, 0.7529412, 1, 1,
0.1178616, -0.3319445, 2.188634, 0, 0.7490196, 1, 1,
0.119508, -1.088096, 2.751198, 0, 0.7411765, 1, 1,
0.1257393, -0.9839076, 3.577251, 0, 0.7372549, 1, 1,
0.1260267, 0.6497701, 0.5207172, 0, 0.7294118, 1, 1,
0.1327547, 0.2216076, 1.475827, 0, 0.7254902, 1, 1,
0.1332752, 0.6329591, 0.5434594, 0, 0.7176471, 1, 1,
0.1359949, -0.4914953, 4.140301, 0, 0.7137255, 1, 1,
0.1401743, -1.236759, 3.382809, 0, 0.7058824, 1, 1,
0.1418094, 0.4789934, -0.006009496, 0, 0.6980392, 1, 1,
0.1434896, -0.05338489, 3.867907, 0, 0.6941177, 1, 1,
0.1442847, 0.01056181, 0.5715714, 0, 0.6862745, 1, 1,
0.1457036, 0.4534678, 0.3490244, 0, 0.682353, 1, 1,
0.14738, -0.2781627, 2.040388, 0, 0.6745098, 1, 1,
0.1523055, -1.349397, 4.331637, 0, 0.6705883, 1, 1,
0.1632525, -1.252045, 2.088822, 0, 0.6627451, 1, 1,
0.1635981, -1.34782, 4.7936, 0, 0.6588235, 1, 1,
0.167059, 0.8786219, 0.1565193, 0, 0.6509804, 1, 1,
0.1701301, -0.7258781, 3.750464, 0, 0.6470588, 1, 1,
0.1718058, 1.000143, 0.7223667, 0, 0.6392157, 1, 1,
0.1740152, -1.69117, 2.122206, 0, 0.6352941, 1, 1,
0.175125, 0.8385966, -0.2381602, 0, 0.627451, 1, 1,
0.1768614, 0.5930281, -1.015595, 0, 0.6235294, 1, 1,
0.1783108, -0.4876338, 3.053782, 0, 0.6156863, 1, 1,
0.1783958, -2.397579, 1.946004, 0, 0.6117647, 1, 1,
0.1795007, 0.2272818, -0.3869406, 0, 0.6039216, 1, 1,
0.1805543, 0.4858739, 0.7111226, 0, 0.5960785, 1, 1,
0.1819512, -0.6744736, 3.206789, 0, 0.5921569, 1, 1,
0.1855721, 3.154021, -0.08304778, 0, 0.5843138, 1, 1,
0.1858914, 0.2815488, 0.9730622, 0, 0.5803922, 1, 1,
0.1890173, 1.176773, -0.6622853, 0, 0.572549, 1, 1,
0.1905658, -1.43059, 3.661454, 0, 0.5686275, 1, 1,
0.1972179, 0.5991924, 1.278499, 0, 0.5607843, 1, 1,
0.1972727, -0.1074091, 2.491321, 0, 0.5568628, 1, 1,
0.2000462, 0.8943123, 1.637032, 0, 0.5490196, 1, 1,
0.2017346, -1.026539, 5.36664, 0, 0.5450981, 1, 1,
0.2111052, -1.018641, 3.757666, 0, 0.5372549, 1, 1,
0.2111415, -0.3492994, 2.182458, 0, 0.5333334, 1, 1,
0.2133276, -0.5146068, 3.61137, 0, 0.5254902, 1, 1,
0.2264523, 0.7593521, 0.1062808, 0, 0.5215687, 1, 1,
0.2312308, -0.2725885, 1.875553, 0, 0.5137255, 1, 1,
0.2341718, 1.477702, -0.6286895, 0, 0.509804, 1, 1,
0.2469584, -0.5039366, 0.5059157, 0, 0.5019608, 1, 1,
0.2505759, 2.060901, -0.09192432, 0, 0.4941176, 1, 1,
0.2514012, 0.4237217, 1.582676, 0, 0.4901961, 1, 1,
0.2590638, 1.748622, 0.4714911, 0, 0.4823529, 1, 1,
0.2600502, 1.387572, -0.09738951, 0, 0.4784314, 1, 1,
0.2605789, -1.372934, 2.161859, 0, 0.4705882, 1, 1,
0.261713, -0.3220815, 2.377283, 0, 0.4666667, 1, 1,
0.2653253, -0.5138666, 2.828192, 0, 0.4588235, 1, 1,
0.2693182, -2.39069, 2.721856, 0, 0.454902, 1, 1,
0.2709301, 0.3099266, -0.6157417, 0, 0.4470588, 1, 1,
0.2736083, 0.4393339, -0.03679865, 0, 0.4431373, 1, 1,
0.2799968, -0.04358919, -0.009331126, 0, 0.4352941, 1, 1,
0.2801323, 1.019701, 1.127072, 0, 0.4313726, 1, 1,
0.2849213, -0.6336628, 1.701222, 0, 0.4235294, 1, 1,
0.290989, 1.3739, 1.060573, 0, 0.4196078, 1, 1,
0.294248, 0.3211417, 0.7958052, 0, 0.4117647, 1, 1,
0.2954959, -1.92196, 2.444103, 0, 0.4078431, 1, 1,
0.2971769, 1.308896, -1.794311, 0, 0.4, 1, 1,
0.3009564, -0.005442918, 0.3645587, 0, 0.3921569, 1, 1,
0.3029177, 1.288975, 1.476974, 0, 0.3882353, 1, 1,
0.3042782, -0.03432978, 1.919765, 0, 0.3803922, 1, 1,
0.3063855, 0.3767316, 1.710291, 0, 0.3764706, 1, 1,
0.311539, -2.293447, 2.058227, 0, 0.3686275, 1, 1,
0.314287, -0.6425442, 4.675417, 0, 0.3647059, 1, 1,
0.3143608, -1.49628, 3.572426, 0, 0.3568628, 1, 1,
0.326271, 0.5282085, 1.807734, 0, 0.3529412, 1, 1,
0.3266255, -0.1523631, 2.955586, 0, 0.345098, 1, 1,
0.3286328, 0.03207396, 0.905345, 0, 0.3411765, 1, 1,
0.3354289, 0.5063591, -0.2847753, 0, 0.3333333, 1, 1,
0.3374385, -0.02759023, 1.846417, 0, 0.3294118, 1, 1,
0.3381581, 0.68854, 1.752649, 0, 0.3215686, 1, 1,
0.3391158, -0.1762875, 2.005459, 0, 0.3176471, 1, 1,
0.3400673, 0.3062417, 0.8554632, 0, 0.3098039, 1, 1,
0.3404924, 0.1798284, 1.852101, 0, 0.3058824, 1, 1,
0.3410694, 1.27831, 0.1576109, 0, 0.2980392, 1, 1,
0.3424847, -0.294714, 1.430789, 0, 0.2901961, 1, 1,
0.3453642, -0.463762, 2.812146, 0, 0.2862745, 1, 1,
0.3518247, -0.5377652, 2.839966, 0, 0.2784314, 1, 1,
0.3524144, -1.430081, 2.222251, 0, 0.2745098, 1, 1,
0.357329, 0.9881502, 1.113156, 0, 0.2666667, 1, 1,
0.3602788, 0.68496, 1.019524, 0, 0.2627451, 1, 1,
0.3608764, 1.81442, 2.693069, 0, 0.254902, 1, 1,
0.3641007, -1.779141, 0.8595912, 0, 0.2509804, 1, 1,
0.36484, 0.001606486, 1.789472, 0, 0.2431373, 1, 1,
0.3717162, 0.4299301, 2.828429, 0, 0.2392157, 1, 1,
0.3735629, 0.759473, -0.8114205, 0, 0.2313726, 1, 1,
0.3763236, -0.8845119, 5.289821, 0, 0.227451, 1, 1,
0.3772265, -0.4156126, 3.862024, 0, 0.2196078, 1, 1,
0.3838373, 1.086736, 0.4988564, 0, 0.2156863, 1, 1,
0.3855096, 0.7589204, -0.0117869, 0, 0.2078431, 1, 1,
0.3916171, 0.7447808, 0.3040346, 0, 0.2039216, 1, 1,
0.393217, -0.6616141, 3.929721, 0, 0.1960784, 1, 1,
0.3934104, -1.357174, 2.989989, 0, 0.1882353, 1, 1,
0.3941692, 0.1240316, 2.941601, 0, 0.1843137, 1, 1,
0.3969383, 0.6364965, 1.16788, 0, 0.1764706, 1, 1,
0.4005265, 1.146467, -0.6146861, 0, 0.172549, 1, 1,
0.4091583, -1.056658, 3.508133, 0, 0.1647059, 1, 1,
0.4104351, -1.251935, 3.891674, 0, 0.1607843, 1, 1,
0.4112751, -1.85583, 2.534476, 0, 0.1529412, 1, 1,
0.4120433, 1.361235, -0.09295965, 0, 0.1490196, 1, 1,
0.4130177, 0.6857572, 0.5761937, 0, 0.1411765, 1, 1,
0.4167345, -2.15575, 2.139173, 0, 0.1372549, 1, 1,
0.4237771, 1.240235, -0.3619033, 0, 0.1294118, 1, 1,
0.425509, -1.231409, 4.366602, 0, 0.1254902, 1, 1,
0.4271088, -0.227012, 4.032192, 0, 0.1176471, 1, 1,
0.4286736, 0.1870419, 1.635758, 0, 0.1137255, 1, 1,
0.4293128, -0.589834, 3.748185, 0, 0.1058824, 1, 1,
0.4295993, -0.4555568, 3.379552, 0, 0.09803922, 1, 1,
0.4305972, 1.702418, 0.005263038, 0, 0.09411765, 1, 1,
0.4314323, 0.1785878, 1.058552, 0, 0.08627451, 1, 1,
0.4353223, -1.064891, 2.634745, 0, 0.08235294, 1, 1,
0.4377837, 2.099574, 1.100567, 0, 0.07450981, 1, 1,
0.4515513, -1.473013, 1.874022, 0, 0.07058824, 1, 1,
0.4530671, 0.8299405, 3.227026, 0, 0.0627451, 1, 1,
0.4533576, 2.439382, -0.6984426, 0, 0.05882353, 1, 1,
0.4551212, 0.1983591, 0.6521786, 0, 0.05098039, 1, 1,
0.4553424, -1.187992, 1.958083, 0, 0.04705882, 1, 1,
0.4571239, -1.898764, 4.422198, 0, 0.03921569, 1, 1,
0.4660634, 0.9734474, -0.4767416, 0, 0.03529412, 1, 1,
0.472067, -0.0208876, 3.831201, 0, 0.02745098, 1, 1,
0.4805649, -0.7275589, 3.601856, 0, 0.02352941, 1, 1,
0.4809241, 1.573963, 0.1877632, 0, 0.01568628, 1, 1,
0.4810351, -0.426742, 3.440242, 0, 0.01176471, 1, 1,
0.4821728, 0.3258008, 0.7681343, 0, 0.003921569, 1, 1,
0.4826149, -0.2967243, 1.299981, 0.003921569, 0, 1, 1,
0.4830739, -0.5352715, 2.798704, 0.007843138, 0, 1, 1,
0.4881338, 0.5470345, 0.7341008, 0.01568628, 0, 1, 1,
0.4889175, 1.456505, 0.01545819, 0.01960784, 0, 1, 1,
0.4909874, 2.316638, 0.1131724, 0.02745098, 0, 1, 1,
0.49264, -0.3451651, 2.45605, 0.03137255, 0, 1, 1,
0.4948928, -0.6922284, 0.9583549, 0.03921569, 0, 1, 1,
0.4955373, -1.647112, 1.880614, 0.04313726, 0, 1, 1,
0.4969285, 0.1733029, 1.710629, 0.05098039, 0, 1, 1,
0.5029134, -0.9412302, 2.655951, 0.05490196, 0, 1, 1,
0.5071658, 1.661004, 0.3206532, 0.0627451, 0, 1, 1,
0.5089896, -0.4439948, 3.20504, 0.06666667, 0, 1, 1,
0.5117455, -0.3334, 2.300036, 0.07450981, 0, 1, 1,
0.5154982, 0.2052042, 1.691359, 0.07843138, 0, 1, 1,
0.516425, -0.9636546, 3.108255, 0.08627451, 0, 1, 1,
0.5204368, -1.654462, 3.419889, 0.09019608, 0, 1, 1,
0.5221689, -1.328872, 3.734275, 0.09803922, 0, 1, 1,
0.5254357, -0.3665749, 3.14402, 0.1058824, 0, 1, 1,
0.5260444, 0.5948101, -0.3694697, 0.1098039, 0, 1, 1,
0.5289487, 1.033196, 1.323826, 0.1176471, 0, 1, 1,
0.5297557, 1.119335, 2.393404, 0.1215686, 0, 1, 1,
0.5300936, -0.3548577, 4.168388, 0.1294118, 0, 1, 1,
0.5309747, -1.313181, 2.404628, 0.1333333, 0, 1, 1,
0.5339977, -0.04433182, 1.139836, 0.1411765, 0, 1, 1,
0.535565, 0.8739218, 1.85446, 0.145098, 0, 1, 1,
0.5404525, -0.3757559, 1.737846, 0.1529412, 0, 1, 1,
0.5522441, 0.2758864, -0.1870683, 0.1568628, 0, 1, 1,
0.556734, 1.854222, 2.019074, 0.1647059, 0, 1, 1,
0.5610065, -0.8002305, 3.544916, 0.1686275, 0, 1, 1,
0.5648823, 1.238166, 1.23037, 0.1764706, 0, 1, 1,
0.5650008, -1.046938, 1.974062, 0.1803922, 0, 1, 1,
0.5651235, 0.1919698, 1.538198, 0.1882353, 0, 1, 1,
0.5656415, -1.299448, 2.718716, 0.1921569, 0, 1, 1,
0.5671328, 0.157795, -0.09717207, 0.2, 0, 1, 1,
0.5754902, 0.178387, 0.9046293, 0.2078431, 0, 1, 1,
0.5772037, -1.420901, 2.98562, 0.2117647, 0, 1, 1,
0.5790126, 1.387853, 0.896037, 0.2196078, 0, 1, 1,
0.5804296, 1.043085, -0.1766744, 0.2235294, 0, 1, 1,
0.5823249, -1.459103, 1.953261, 0.2313726, 0, 1, 1,
0.5834655, -1.600728, 4.084118, 0.2352941, 0, 1, 1,
0.5861191, 0.3049772, 2.115171, 0.2431373, 0, 1, 1,
0.588855, 0.7578681, 2.046416, 0.2470588, 0, 1, 1,
0.5911776, 0.3806957, 1.894505, 0.254902, 0, 1, 1,
0.5928007, 0.8078638, 0.1343244, 0.2588235, 0, 1, 1,
0.5963109, 0.221852, 3.483557, 0.2666667, 0, 1, 1,
0.598455, -0.9327273, 3.394046, 0.2705882, 0, 1, 1,
0.6008582, 0.2053748, 1.799254, 0.2784314, 0, 1, 1,
0.6050712, -0.2024856, 0.4909559, 0.282353, 0, 1, 1,
0.6082404, -1.374854, 3.978093, 0.2901961, 0, 1, 1,
0.609292, -1.610966, 3.063478, 0.2941177, 0, 1, 1,
0.6151356, -1.739026, 3.122333, 0.3019608, 0, 1, 1,
0.6176697, -1.428051, 2.382943, 0.3098039, 0, 1, 1,
0.6211972, -2.558741, 2.774761, 0.3137255, 0, 1, 1,
0.6214259, 0.8918844, -0.1281799, 0.3215686, 0, 1, 1,
0.6232756, -1.188608, 1.945817, 0.3254902, 0, 1, 1,
0.6260779, 1.544543, 0.893481, 0.3333333, 0, 1, 1,
0.6279663, -0.6200922, 1.190302, 0.3372549, 0, 1, 1,
0.6286168, 0.3615838, 0.3660907, 0.345098, 0, 1, 1,
0.6322222, -1.450594, 2.06538, 0.3490196, 0, 1, 1,
0.6348901, -0.2442734, 1.317336, 0.3568628, 0, 1, 1,
0.6438366, -0.006682904, 0.01665143, 0.3607843, 0, 1, 1,
0.6458756, 0.3652347, 0.9416819, 0.3686275, 0, 1, 1,
0.6469157, 0.5408142, 3.503869, 0.372549, 0, 1, 1,
0.6525404, 0.2491441, 1.181866, 0.3803922, 0, 1, 1,
0.653189, 1.34111, 0.4292868, 0.3843137, 0, 1, 1,
0.6531932, -0.3345588, 2.325894, 0.3921569, 0, 1, 1,
0.6539987, -1.86353, 1.843046, 0.3960784, 0, 1, 1,
0.6563838, -1.840051, 1.464309, 0.4039216, 0, 1, 1,
0.6571395, -0.1375013, 2.11841, 0.4117647, 0, 1, 1,
0.6630951, -0.8745049, 2.641336, 0.4156863, 0, 1, 1,
0.6665947, -0.806471, 3.955185, 0.4235294, 0, 1, 1,
0.6673719, -1.728685, 2.997893, 0.427451, 0, 1, 1,
0.6789111, -0.8452714, 3.466136, 0.4352941, 0, 1, 1,
0.6814362, -0.6826918, 1.804343, 0.4392157, 0, 1, 1,
0.6856384, -1.03593, 2.978665, 0.4470588, 0, 1, 1,
0.6881451, -0.349727, 0.1569614, 0.4509804, 0, 1, 1,
0.7020889, 1.28788, 0.889432, 0.4588235, 0, 1, 1,
0.7022448, 0.3962089, 2.366491, 0.4627451, 0, 1, 1,
0.7028511, 0.6613038, 1.325464, 0.4705882, 0, 1, 1,
0.7088574, 0.2174788, 0.08974293, 0.4745098, 0, 1, 1,
0.7108165, 0.402378, 0.3437777, 0.4823529, 0, 1, 1,
0.7157122, 1.279212, 2.152984, 0.4862745, 0, 1, 1,
0.7171127, 2.011398, 0.5172784, 0.4941176, 0, 1, 1,
0.7181026, -0.3155947, -0.226747, 0.5019608, 0, 1, 1,
0.7213388, 0.8433847, -1.091275, 0.5058824, 0, 1, 1,
0.7216731, 0.660276, 0.9431602, 0.5137255, 0, 1, 1,
0.729748, -0.1197065, 1.708162, 0.5176471, 0, 1, 1,
0.731848, 0.2768102, 1.894375, 0.5254902, 0, 1, 1,
0.7339672, -0.2474758, 2.291149, 0.5294118, 0, 1, 1,
0.7340546, -0.6152914, 2.61274, 0.5372549, 0, 1, 1,
0.7386423, 0.5373566, 0.4558727, 0.5411765, 0, 1, 1,
0.740586, 1.747836, 0.3288777, 0.5490196, 0, 1, 1,
0.7458905, -0.0007193548, 0.6980824, 0.5529412, 0, 1, 1,
0.7466412, 3.437742, -0.003250268, 0.5607843, 0, 1, 1,
0.7472826, 0.4191758, 0.1896572, 0.5647059, 0, 1, 1,
0.7477046, -2.995554, 1.786164, 0.572549, 0, 1, 1,
0.7493831, -0.1109748, 2.202844, 0.5764706, 0, 1, 1,
0.7507293, -0.1549472, 0.6366467, 0.5843138, 0, 1, 1,
0.7529173, -0.4753273, 3.106628, 0.5882353, 0, 1, 1,
0.7553597, -0.2000031, 1.670152, 0.5960785, 0, 1, 1,
0.7567564, -0.5044085, 0.5461102, 0.6039216, 0, 1, 1,
0.7591413, -1.292921, 4.724573, 0.6078432, 0, 1, 1,
0.7601557, 1.150666, 0.7974581, 0.6156863, 0, 1, 1,
0.7616948, -0.05894329, 1.903636, 0.6196079, 0, 1, 1,
0.7623934, 1.311889, 0.4576283, 0.627451, 0, 1, 1,
0.7701964, 0.1601086, 3.035201, 0.6313726, 0, 1, 1,
0.7735161, 1.3016, 1.741967, 0.6392157, 0, 1, 1,
0.7796673, 0.4013403, 2.19056, 0.6431373, 0, 1, 1,
0.7931253, -0.4819469, 1.960259, 0.6509804, 0, 1, 1,
0.796496, 1.580118, -0.7973193, 0.654902, 0, 1, 1,
0.7966098, -1.019945, 3.141056, 0.6627451, 0, 1, 1,
0.7971138, 1.385956, 0.2851267, 0.6666667, 0, 1, 1,
0.7988634, 0.4153673, 0.6344649, 0.6745098, 0, 1, 1,
0.799291, -0.3567637, 1.294408, 0.6784314, 0, 1, 1,
0.800934, -0.6049354, 2.353492, 0.6862745, 0, 1, 1,
0.8025468, -0.4383967, 2.245895, 0.6901961, 0, 1, 1,
0.8026859, -0.4005959, 2.488896, 0.6980392, 0, 1, 1,
0.8027507, -1.324015, 1.420424, 0.7058824, 0, 1, 1,
0.8042649, 1.669454, -0.6907968, 0.7098039, 0, 1, 1,
0.8073621, -0.5999485, 2.802268, 0.7176471, 0, 1, 1,
0.8119252, 0.9162821, 0.3518071, 0.7215686, 0, 1, 1,
0.8120056, -0.1315553, 1.877117, 0.7294118, 0, 1, 1,
0.8171269, -0.596393, 1.710312, 0.7333333, 0, 1, 1,
0.8177642, 1.290474, 2.513032, 0.7411765, 0, 1, 1,
0.8223775, 0.5643021, 1.078277, 0.7450981, 0, 1, 1,
0.8281807, 0.3231606, 2.738982, 0.7529412, 0, 1, 1,
0.8516375, -0.4699216, 1.622933, 0.7568628, 0, 1, 1,
0.8541515, -0.608258, 1.92067, 0.7647059, 0, 1, 1,
0.8544849, -0.5326258, 2.854679, 0.7686275, 0, 1, 1,
0.8547176, 0.6206658, 0.649664, 0.7764706, 0, 1, 1,
0.8566297, 1.141419, 0.6056039, 0.7803922, 0, 1, 1,
0.8621923, -0.9901021, 1.530849, 0.7882353, 0, 1, 1,
0.8633061, -1.561447, 1.359075, 0.7921569, 0, 1, 1,
0.8685422, -0.007217813, 1.538841, 0.8, 0, 1, 1,
0.8699135, 0.1731399, 1.274879, 0.8078431, 0, 1, 1,
0.8708135, 1.412951, 2.40902, 0.8117647, 0, 1, 1,
0.8806199, 0.3842861, 0.4129638, 0.8196079, 0, 1, 1,
0.8837404, 1.097997, 0.3463825, 0.8235294, 0, 1, 1,
0.8853298, 0.6355019, -0.1601177, 0.8313726, 0, 1, 1,
0.8863534, 0.6167614, 1.581699, 0.8352941, 0, 1, 1,
0.8913907, -1.463453, 2.456077, 0.8431373, 0, 1, 1,
0.8915133, 2.017194, 0.1212366, 0.8470588, 0, 1, 1,
0.8959499, -1.44922, 3.124659, 0.854902, 0, 1, 1,
0.8996004, -0.06565139, 3.482949, 0.8588235, 0, 1, 1,
0.9019071, 0.08656617, 0.828531, 0.8666667, 0, 1, 1,
0.9033183, -0.8132589, 2.889362, 0.8705882, 0, 1, 1,
0.9042953, -1.276039, 2.984751, 0.8784314, 0, 1, 1,
0.9088995, 0.735332, 1.004283, 0.8823529, 0, 1, 1,
0.9130796, 0.9564294, 0.5246813, 0.8901961, 0, 1, 1,
0.913623, 0.7142166, -0.3291215, 0.8941177, 0, 1, 1,
0.9217554, -0.8217994, 2.231005, 0.9019608, 0, 1, 1,
0.9219685, -0.1157295, -0.3289649, 0.9098039, 0, 1, 1,
0.9238411, 0.5792205, 2.637119, 0.9137255, 0, 1, 1,
0.9252225, -0.9999049, 2.718962, 0.9215686, 0, 1, 1,
0.9446543, -0.2113849, 3.351651, 0.9254902, 0, 1, 1,
0.9516394, -1.356092, 2.531786, 0.9333333, 0, 1, 1,
0.9522545, -0.3209315, 1.479037, 0.9372549, 0, 1, 1,
0.960786, 0.6664452, 1.411941, 0.945098, 0, 1, 1,
0.9611972, 0.02844449, 1.990663, 0.9490196, 0, 1, 1,
0.9616595, -1.519935, 1.949338, 0.9568627, 0, 1, 1,
0.976667, -0.5188699, 2.024025, 0.9607843, 0, 1, 1,
0.9818282, -1.688776, 0.9330593, 0.9686275, 0, 1, 1,
0.9941479, -0.5280663, 1.648507, 0.972549, 0, 1, 1,
1.009767, 0.8859465, -0.03095886, 0.9803922, 0, 1, 1,
1.014057, 1.507717, 0.3643682, 0.9843137, 0, 1, 1,
1.015498, 1.207812, 1.734918, 0.9921569, 0, 1, 1,
1.01703, 1.302627, 1.979713, 0.9960784, 0, 1, 1,
1.019658, -0.01085118, 0.5050874, 1, 0, 0.9960784, 1,
1.021225, 1.993093, -0.04963216, 1, 0, 0.9882353, 1,
1.034026, -0.1717058, 2.309843, 1, 0, 0.9843137, 1,
1.035518, 0.572891, 0.05932267, 1, 0, 0.9764706, 1,
1.042402, -0.2048678, 0.4695222, 1, 0, 0.972549, 1,
1.046052, -0.403815, 1.511453, 1, 0, 0.9647059, 1,
1.047974, -1.250232, 1.667976, 1, 0, 0.9607843, 1,
1.048634, 1.321258, 1.799369, 1, 0, 0.9529412, 1,
1.061469, 0.3733132, 1.050039, 1, 0, 0.9490196, 1,
1.063955, -0.3379676, 0.1413259, 1, 0, 0.9411765, 1,
1.065375, -1.040974, 1.542212, 1, 0, 0.9372549, 1,
1.067087, -0.7118914, 1.500242, 1, 0, 0.9294118, 1,
1.069012, 0.8828177, -1.431384, 1, 0, 0.9254902, 1,
1.071936, 0.7881077, 0.2361946, 1, 0, 0.9176471, 1,
1.073881, 0.4134845, 1.226083, 1, 0, 0.9137255, 1,
1.079919, 0.7350176, -0.03642541, 1, 0, 0.9058824, 1,
1.081681, 1.277214, 1.079213, 1, 0, 0.9019608, 1,
1.087191, -0.8967273, 2.171245, 1, 0, 0.8941177, 1,
1.091676, 2.100098, -0.109771, 1, 0, 0.8862745, 1,
1.092501, -3.232816, 2.075783, 1, 0, 0.8823529, 1,
1.097964, -0.9164252, 0.9951599, 1, 0, 0.8745098, 1,
1.099871, -0.4438955, 2.384904, 1, 0, 0.8705882, 1,
1.102362, 0.7433919, 0.8619841, 1, 0, 0.8627451, 1,
1.107859, 0.1238472, 1.543347, 1, 0, 0.8588235, 1,
1.107916, -0.4551761, 3.361745, 1, 0, 0.8509804, 1,
1.111383, 2.141706, 0.5218057, 1, 0, 0.8470588, 1,
1.127756, 0.8253022, 0.5612852, 1, 0, 0.8392157, 1,
1.133737, -0.9392847, 1.624227, 1, 0, 0.8352941, 1,
1.139061, -0.9433767, 3.266738, 1, 0, 0.827451, 1,
1.142485, 0.9205992, 0.5423294, 1, 0, 0.8235294, 1,
1.144236, 0.3828395, 2.543018, 1, 0, 0.8156863, 1,
1.14543, 0.318842, 1.433323, 1, 0, 0.8117647, 1,
1.147227, -1.281087, 2.059408, 1, 0, 0.8039216, 1,
1.151754, -0.9983539, 1.890725, 1, 0, 0.7960784, 1,
1.157113, -0.7100329, 2.679132, 1, 0, 0.7921569, 1,
1.161935, 1.513589, 1.138478, 1, 0, 0.7843137, 1,
1.168783, -0.2253121, 2.952805, 1, 0, 0.7803922, 1,
1.174616, 0.1960241, 2.885287, 1, 0, 0.772549, 1,
1.177835, 0.1320421, 1.435493, 1, 0, 0.7686275, 1,
1.18439, 1.134683, -1.278825, 1, 0, 0.7607843, 1,
1.185148, -0.9066125, 1.185714, 1, 0, 0.7568628, 1,
1.185371, 2.496496, 1.698294, 1, 0, 0.7490196, 1,
1.195309, -0.4135517, 2.736777, 1, 0, 0.7450981, 1,
1.19622, 0.4176858, -1.570096, 1, 0, 0.7372549, 1,
1.200196, 0.05882226, 2.767364, 1, 0, 0.7333333, 1,
1.202271, -1.091747, 2.68373, 1, 0, 0.7254902, 1,
1.202599, -0.3661331, 0.5378626, 1, 0, 0.7215686, 1,
1.20267, -0.709785, 2.712976, 1, 0, 0.7137255, 1,
1.204929, -1.403501, 2.600463, 1, 0, 0.7098039, 1,
1.206908, 0.1986263, 0.07196281, 1, 0, 0.7019608, 1,
1.219482, -1.717843, 3.214308, 1, 0, 0.6941177, 1,
1.233873, 0.5053462, 2.336232, 1, 0, 0.6901961, 1,
1.240317, -0.7497079, 1.740535, 1, 0, 0.682353, 1,
1.247551, -2.275469, 2.475301, 1, 0, 0.6784314, 1,
1.247952, 0.6087057, 2.434005, 1, 0, 0.6705883, 1,
1.249912, -0.5934731, 2.228097, 1, 0, 0.6666667, 1,
1.250035, 1.226177, 0.6161057, 1, 0, 0.6588235, 1,
1.265626, -3.597058, 0.7453557, 1, 0, 0.654902, 1,
1.275592, -1.202872, 2.661993, 1, 0, 0.6470588, 1,
1.276616, -0.5290419, 2.575572, 1, 0, 0.6431373, 1,
1.28255, 0.1887234, 0.7998322, 1, 0, 0.6352941, 1,
1.283663, 0.1662991, 2.145369, 1, 0, 0.6313726, 1,
1.28434, -0.1623667, 2.028932, 1, 0, 0.6235294, 1,
1.297696, -0.440607, 1.797806, 1, 0, 0.6196079, 1,
1.307764, -0.2791558, 1.117849, 1, 0, 0.6117647, 1,
1.311683, -0.2283321, 1.709973, 1, 0, 0.6078432, 1,
1.317258, -1.47729, 2.169068, 1, 0, 0.6, 1,
1.319927, 1.024949, -0.156167, 1, 0, 0.5921569, 1,
1.326841, -0.2386264, 2.1397, 1, 0, 0.5882353, 1,
1.331222, 0.5663822, 0.306251, 1, 0, 0.5803922, 1,
1.331715, -0.3422423, 1.699403, 1, 0, 0.5764706, 1,
1.342795, 0.3435056, 0.8706698, 1, 0, 0.5686275, 1,
1.348768, -1.48289, 2.583091, 1, 0, 0.5647059, 1,
1.350292, 0.1568958, 1.546984, 1, 0, 0.5568628, 1,
1.356957, -0.4186659, 1.787877, 1, 0, 0.5529412, 1,
1.357491, 1.295428, -0.479146, 1, 0, 0.5450981, 1,
1.373108, 0.1552524, 2.294056, 1, 0, 0.5411765, 1,
1.376796, 1.467098, 3.3371, 1, 0, 0.5333334, 1,
1.387069, -0.6765441, 3.107949, 1, 0, 0.5294118, 1,
1.388506, 0.2863798, 1.867427, 1, 0, 0.5215687, 1,
1.391798, -1.325001, 1.596117, 1, 0, 0.5176471, 1,
1.393729, 0.2822142, 1.838757, 1, 0, 0.509804, 1,
1.397203, 1.600859, 1.420088, 1, 0, 0.5058824, 1,
1.399528, 1.388708, 1.115286, 1, 0, 0.4980392, 1,
1.406026, 0.2248029, 2.297496, 1, 0, 0.4901961, 1,
1.40623, -0.5879918, -0.004224909, 1, 0, 0.4862745, 1,
1.423609, 1.19957, -0.2360395, 1, 0, 0.4784314, 1,
1.425686, 0.07086275, 3.232089, 1, 0, 0.4745098, 1,
1.433168, -0.08895843, 2.964259, 1, 0, 0.4666667, 1,
1.43888, 0.5916858, 0.5864289, 1, 0, 0.4627451, 1,
1.449066, -3.82933, 3.902086, 1, 0, 0.454902, 1,
1.452786, -0.7698034, -0.5402891, 1, 0, 0.4509804, 1,
1.454422, -0.4287871, 2.985695, 1, 0, 0.4431373, 1,
1.474906, 0.4696778, -0.4925925, 1, 0, 0.4392157, 1,
1.475235, -1.57676, 3.126391, 1, 0, 0.4313726, 1,
1.479056, 1.86801, 1.212055, 1, 0, 0.427451, 1,
1.495293, -1.125161, 0.9318551, 1, 0, 0.4196078, 1,
1.497096, -0.7505229, 1.499539, 1, 0, 0.4156863, 1,
1.504024, 0.46434, 2.360371, 1, 0, 0.4078431, 1,
1.509434, -0.5081376, 3.645071, 1, 0, 0.4039216, 1,
1.510832, 0.7558764, 3.268678, 1, 0, 0.3960784, 1,
1.514908, -0.3330689, 2.289516, 1, 0, 0.3882353, 1,
1.517158, 0.5347608, 2.162277, 1, 0, 0.3843137, 1,
1.521482, 0.3970036, 1.32904, 1, 0, 0.3764706, 1,
1.532949, -0.8654641, 2.853437, 1, 0, 0.372549, 1,
1.532999, -1.135288, 2.493349, 1, 0, 0.3647059, 1,
1.539033, 0.02427657, 1.553575, 1, 0, 0.3607843, 1,
1.541754, -0.6795769, 2.58713, 1, 0, 0.3529412, 1,
1.543164, 0.4218667, 0.7524425, 1, 0, 0.3490196, 1,
1.546557, -1.752533, 3.902928, 1, 0, 0.3411765, 1,
1.554099, -0.2017814, 3.297935, 1, 0, 0.3372549, 1,
1.559095, -0.1417636, 0.3031155, 1, 0, 0.3294118, 1,
1.561932, 1.313346, -0.5815673, 1, 0, 0.3254902, 1,
1.562, -0.5786832, 2.233655, 1, 0, 0.3176471, 1,
1.57381, 1.263914, 2.827215, 1, 0, 0.3137255, 1,
1.586428, -1.242191, 2.411037, 1, 0, 0.3058824, 1,
1.592704, 0.0857559, 1.644489, 1, 0, 0.2980392, 1,
1.594458, 1.834807, 0.2125766, 1, 0, 0.2941177, 1,
1.643363, -1.806106, 1.146271, 1, 0, 0.2862745, 1,
1.654134, -1.766201, 1.992595, 1, 0, 0.282353, 1,
1.707073, -0.3183305, 1.800064, 1, 0, 0.2745098, 1,
1.717849, 1.51545, -1.331908, 1, 0, 0.2705882, 1,
1.729855, 2.269254, 2.16659, 1, 0, 0.2627451, 1,
1.73071, -0.460439, 1.636076, 1, 0, 0.2588235, 1,
1.752455, -0.3532238, 2.499579, 1, 0, 0.2509804, 1,
1.753648, -0.8552881, 3.772947, 1, 0, 0.2470588, 1,
1.770568, 0.08527286, 2.236606, 1, 0, 0.2392157, 1,
1.774397, -0.002155135, 2.217793, 1, 0, 0.2352941, 1,
1.782534, 0.5496231, 0.7774479, 1, 0, 0.227451, 1,
1.784691, 1.851021, 0.5609745, 1, 0, 0.2235294, 1,
1.825194, -0.4541931, 0.09007332, 1, 0, 0.2156863, 1,
1.835835, -0.1138068, 1.628023, 1, 0, 0.2117647, 1,
1.854555, 0.5274227, 1.192852, 1, 0, 0.2039216, 1,
1.872794, -1.169214, 1.412612, 1, 0, 0.1960784, 1,
1.89106, -0.8437168, 2.936277, 1, 0, 0.1921569, 1,
1.900853, -0.1857851, -0.6068965, 1, 0, 0.1843137, 1,
1.904641, 0.6312588, 0.2645205, 1, 0, 0.1803922, 1,
1.922256, 0.8032635, 0.8004626, 1, 0, 0.172549, 1,
1.935515, -0.4392585, 1.681211, 1, 0, 0.1686275, 1,
1.977751, 0.3770837, 2.261852, 1, 0, 0.1607843, 1,
1.989449, 1.975475, 0.9662895, 1, 0, 0.1568628, 1,
2.001683, 1.945596, 1.147609, 1, 0, 0.1490196, 1,
2.009995, 0.5454794, 1.024913, 1, 0, 0.145098, 1,
2.025341, -0.6833639, 0.08317079, 1, 0, 0.1372549, 1,
2.061361, 0.01500558, -0.4999906, 1, 0, 0.1333333, 1,
2.080438, 0.7141111, 1.717072, 1, 0, 0.1254902, 1,
2.092128, -1.279667, 1.820115, 1, 0, 0.1215686, 1,
2.109421, 0.7598649, 1.096237, 1, 0, 0.1137255, 1,
2.113528, -0.1822354, 2.028307, 1, 0, 0.1098039, 1,
2.142756, -1.805822, 0.583841, 1, 0, 0.1019608, 1,
2.153, 0.2267745, 2.888165, 1, 0, 0.09411765, 1,
2.221487, 1.147618, 1.384282, 1, 0, 0.09019608, 1,
2.222195, 0.2833208, 0.6445017, 1, 0, 0.08235294, 1,
2.241595, -1.738276, 2.664514, 1, 0, 0.07843138, 1,
2.250325, 1.120307, 0.5842025, 1, 0, 0.07058824, 1,
2.258489, -0.4179415, 0.1292677, 1, 0, 0.06666667, 1,
2.31698, 0.08969028, 1.802578, 1, 0, 0.05882353, 1,
2.412084, 1.435842, 1.502884, 1, 0, 0.05490196, 1,
2.414284, 1.326849, 2.710839, 1, 0, 0.04705882, 1,
2.444188, 2.639493, 1.099843, 1, 0, 0.04313726, 1,
2.498648, 0.1719897, 2.447397, 1, 0, 0.03529412, 1,
2.580253, 0.9427328, 0.8534825, 1, 0, 0.03137255, 1,
2.652391, 1.152232, -1.159737, 1, 0, 0.02352941, 1,
2.769143, 0.480363, 1.80467, 1, 0, 0.01960784, 1,
2.78563, 1.415676, 0.2453644, 1, 0, 0.01176471, 1,
3.420938, -1.783309, 1.293074, 1, 0, 0.007843138, 1
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
0.09826827, -5.061098, -7.149463, 0, -0.5, 0.5, 0.5,
0.09826827, -5.061098, -7.149463, 1, -0.5, 0.5, 0.5,
0.09826827, -5.061098, -7.149463, 1, 1.5, 0.5, 0.5,
0.09826827, -5.061098, -7.149463, 0, 1.5, 0.5, 0.5
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
-4.350787, -0.1957941, -7.149463, 0, -0.5, 0.5, 0.5,
-4.350787, -0.1957941, -7.149463, 1, -0.5, 0.5, 0.5,
-4.350787, -0.1957941, -7.149463, 1, 1.5, 0.5, 0.5,
-4.350787, -0.1957941, -7.149463, 0, 1.5, 0.5, 0.5
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
-4.350787, -5.061098, 0.01559091, 0, -0.5, 0.5, 0.5,
-4.350787, -5.061098, 0.01559091, 1, -0.5, 0.5, 0.5,
-4.350787, -5.061098, 0.01559091, 1, 1.5, 0.5, 0.5,
-4.350787, -5.061098, 0.01559091, 0, 1.5, 0.5, 0.5
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
-3, -3.938336, -5.495989,
3, -3.938336, -5.495989,
-3, -3.938336, -5.495989,
-3, -4.125463, -5.771568,
-2, -3.938336, -5.495989,
-2, -4.125463, -5.771568,
-1, -3.938336, -5.495989,
-1, -4.125463, -5.771568,
0, -3.938336, -5.495989,
0, -4.125463, -5.771568,
1, -3.938336, -5.495989,
1, -4.125463, -5.771568,
2, -3.938336, -5.495989,
2, -4.125463, -5.771568,
3, -3.938336, -5.495989,
3, -4.125463, -5.771568
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
-3, -4.499717, -6.322726, 0, -0.5, 0.5, 0.5,
-3, -4.499717, -6.322726, 1, -0.5, 0.5, 0.5,
-3, -4.499717, -6.322726, 1, 1.5, 0.5, 0.5,
-3, -4.499717, -6.322726, 0, 1.5, 0.5, 0.5,
-2, -4.499717, -6.322726, 0, -0.5, 0.5, 0.5,
-2, -4.499717, -6.322726, 1, -0.5, 0.5, 0.5,
-2, -4.499717, -6.322726, 1, 1.5, 0.5, 0.5,
-2, -4.499717, -6.322726, 0, 1.5, 0.5, 0.5,
-1, -4.499717, -6.322726, 0, -0.5, 0.5, 0.5,
-1, -4.499717, -6.322726, 1, -0.5, 0.5, 0.5,
-1, -4.499717, -6.322726, 1, 1.5, 0.5, 0.5,
-1, -4.499717, -6.322726, 0, 1.5, 0.5, 0.5,
0, -4.499717, -6.322726, 0, -0.5, 0.5, 0.5,
0, -4.499717, -6.322726, 1, -0.5, 0.5, 0.5,
0, -4.499717, -6.322726, 1, 1.5, 0.5, 0.5,
0, -4.499717, -6.322726, 0, 1.5, 0.5, 0.5,
1, -4.499717, -6.322726, 0, -0.5, 0.5, 0.5,
1, -4.499717, -6.322726, 1, -0.5, 0.5, 0.5,
1, -4.499717, -6.322726, 1, 1.5, 0.5, 0.5,
1, -4.499717, -6.322726, 0, 1.5, 0.5, 0.5,
2, -4.499717, -6.322726, 0, -0.5, 0.5, 0.5,
2, -4.499717, -6.322726, 1, -0.5, 0.5, 0.5,
2, -4.499717, -6.322726, 1, 1.5, 0.5, 0.5,
2, -4.499717, -6.322726, 0, 1.5, 0.5, 0.5,
3, -4.499717, -6.322726, 0, -0.5, 0.5, 0.5,
3, -4.499717, -6.322726, 1, -0.5, 0.5, 0.5,
3, -4.499717, -6.322726, 1, 1.5, 0.5, 0.5,
3, -4.499717, -6.322726, 0, 1.5, 0.5, 0.5
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
-3.324082, -2, -5.495989,
-3.324082, 2, -5.495989,
-3.324082, -2, -5.495989,
-3.495199, -2, -5.771568,
-3.324082, 0, -5.495989,
-3.495199, 0, -5.771568,
-3.324082, 2, -5.495989,
-3.495199, 2, -5.771568
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
-3.837434, -2, -6.322726, 0, -0.5, 0.5, 0.5,
-3.837434, -2, -6.322726, 1, -0.5, 0.5, 0.5,
-3.837434, -2, -6.322726, 1, 1.5, 0.5, 0.5,
-3.837434, -2, -6.322726, 0, 1.5, 0.5, 0.5,
-3.837434, 0, -6.322726, 0, -0.5, 0.5, 0.5,
-3.837434, 0, -6.322726, 1, -0.5, 0.5, 0.5,
-3.837434, 0, -6.322726, 1, 1.5, 0.5, 0.5,
-3.837434, 0, -6.322726, 0, 1.5, 0.5, 0.5,
-3.837434, 2, -6.322726, 0, -0.5, 0.5, 0.5,
-3.837434, 2, -6.322726, 1, -0.5, 0.5, 0.5,
-3.837434, 2, -6.322726, 1, 1.5, 0.5, 0.5,
-3.837434, 2, -6.322726, 0, 1.5, 0.5, 0.5
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
-3.324082, -3.938336, -4,
-3.324082, -3.938336, 4,
-3.324082, -3.938336, -4,
-3.495199, -4.125463, -4,
-3.324082, -3.938336, -2,
-3.495199, -4.125463, -2,
-3.324082, -3.938336, 0,
-3.495199, -4.125463, 0,
-3.324082, -3.938336, 2,
-3.495199, -4.125463, 2,
-3.324082, -3.938336, 4,
-3.495199, -4.125463, 4
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
-3.837434, -4.499717, -4, 0, -0.5, 0.5, 0.5,
-3.837434, -4.499717, -4, 1, -0.5, 0.5, 0.5,
-3.837434, -4.499717, -4, 1, 1.5, 0.5, 0.5,
-3.837434, -4.499717, -4, 0, 1.5, 0.5, 0.5,
-3.837434, -4.499717, -2, 0, -0.5, 0.5, 0.5,
-3.837434, -4.499717, -2, 1, -0.5, 0.5, 0.5,
-3.837434, -4.499717, -2, 1, 1.5, 0.5, 0.5,
-3.837434, -4.499717, -2, 0, 1.5, 0.5, 0.5,
-3.837434, -4.499717, 0, 0, -0.5, 0.5, 0.5,
-3.837434, -4.499717, 0, 1, -0.5, 0.5, 0.5,
-3.837434, -4.499717, 0, 1, 1.5, 0.5, 0.5,
-3.837434, -4.499717, 0, 0, 1.5, 0.5, 0.5,
-3.837434, -4.499717, 2, 0, -0.5, 0.5, 0.5,
-3.837434, -4.499717, 2, 1, -0.5, 0.5, 0.5,
-3.837434, -4.499717, 2, 1, 1.5, 0.5, 0.5,
-3.837434, -4.499717, 2, 0, 1.5, 0.5, 0.5,
-3.837434, -4.499717, 4, 0, -0.5, 0.5, 0.5,
-3.837434, -4.499717, 4, 1, -0.5, 0.5, 0.5,
-3.837434, -4.499717, 4, 1, 1.5, 0.5, 0.5,
-3.837434, -4.499717, 4, 0, 1.5, 0.5, 0.5
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
-3.324082, -3.938336, -5.495989,
-3.324082, 3.546748, -5.495989,
-3.324082, -3.938336, 5.527171,
-3.324082, 3.546748, 5.527171,
-3.324082, -3.938336, -5.495989,
-3.324082, -3.938336, 5.527171,
-3.324082, 3.546748, -5.495989,
-3.324082, 3.546748, 5.527171,
-3.324082, -3.938336, -5.495989,
3.520618, -3.938336, -5.495989,
-3.324082, -3.938336, 5.527171,
3.520618, -3.938336, 5.527171,
-3.324082, 3.546748, -5.495989,
3.520618, 3.546748, -5.495989,
-3.324082, 3.546748, 5.527171,
3.520618, 3.546748, 5.527171,
3.520618, -3.938336, -5.495989,
3.520618, 3.546748, -5.495989,
3.520618, -3.938336, 5.527171,
3.520618, 3.546748, 5.527171,
3.520618, -3.938336, -5.495989,
3.520618, -3.938336, 5.527171,
3.520618, 3.546748, -5.495989,
3.520618, 3.546748, 5.527171
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
var radius = 7.998781;
var distance = 35.58748;
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
mvMatrix.translate( -0.09826827, 0.1957941, -0.01559091 );
mvMatrix.scale( 1.263523, 1.155423, 0.7845697 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.58748);
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
Oxycarboxin<-read.table("Oxycarboxin.xyz")
```

```
## Error in read.table("Oxycarboxin.xyz"): no lines available in input
```

```r
x<-Oxycarboxin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oxycarboxin' not found
```

```r
y<-Oxycarboxin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oxycarboxin' not found
```

```r
z<-Oxycarboxin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oxycarboxin' not found
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
-3.224402, -0.1584858, -2.348928, 0, 0, 1, 1, 1,
-2.994573, 1.183429, -1.346504, 1, 0, 0, 1, 1,
-2.926683, -0.6999261, -1.966372, 1, 0, 0, 1, 1,
-2.781978, -1.567373, -1.734698, 1, 0, 0, 1, 1,
-2.721063, -1.190047, -2.576559, 1, 0, 0, 1, 1,
-2.625072, -0.9142598, -0.1670991, 1, 0, 0, 1, 1,
-2.567087, 0.4923807, -2.033823, 0, 0, 0, 1, 1,
-2.400478, -0.998658, -1.920563, 0, 0, 0, 1, 1,
-2.395327, -1.229172, -1.864425, 0, 0, 0, 1, 1,
-2.394733, -0.1367571, -1.870299, 0, 0, 0, 1, 1,
-2.374417, 0.3351703, -1.980204, 0, 0, 0, 1, 1,
-2.343864, 1.744009, -1.263513, 0, 0, 0, 1, 1,
-2.303452, 0.3584816, -2.580792, 0, 0, 0, 1, 1,
-2.253121, 1.354293, -1.093403, 1, 1, 1, 1, 1,
-2.250906, -0.09513135, -1.419917, 1, 1, 1, 1, 1,
-2.2507, 1.163531, -1.745027, 1, 1, 1, 1, 1,
-2.195564, 1.181277, -1.807652, 1, 1, 1, 1, 1,
-2.176068, -1.079212, -1.258564, 1, 1, 1, 1, 1,
-2.156269, -0.3741298, -0.3473985, 1, 1, 1, 1, 1,
-2.146961, -1.779795, -2.634773, 1, 1, 1, 1, 1,
-2.140691, -0.2851699, -1.921333, 1, 1, 1, 1, 1,
-2.105311, -0.4818858, -1.362921, 1, 1, 1, 1, 1,
-2.099893, 0.2890449, 0.3018861, 1, 1, 1, 1, 1,
-2.048362, -0.02282846, -2.39877, 1, 1, 1, 1, 1,
-2.033076, -0.5139278, -1.121404, 1, 1, 1, 1, 1,
-2.006102, -0.9152189, -2.696409, 1, 1, 1, 1, 1,
-2.004727, -0.8332253, -2.443631, 1, 1, 1, 1, 1,
-1.995349, -0.6399727, -0.6664331, 1, 1, 1, 1, 1,
-1.984933, -0.4100535, -2.918263, 0, 0, 1, 1, 1,
-1.975504, 0.161141, -1.175237, 1, 0, 0, 1, 1,
-1.950016, -1.065346, -2.533289, 1, 0, 0, 1, 1,
-1.934432, 0.5403118, -1.193387, 1, 0, 0, 1, 1,
-1.907866, -0.0942337, -1.708767, 1, 0, 0, 1, 1,
-1.893574, -1.54048, -2.278694, 1, 0, 0, 1, 1,
-1.882945, 0.6785664, -1.220612, 0, 0, 0, 1, 1,
-1.851489, -0.5084555, -1.690947, 0, 0, 0, 1, 1,
-1.807621, 0.1013835, -1.398339, 0, 0, 0, 1, 1,
-1.802409, 2.223678, -0.2485857, 0, 0, 0, 1, 1,
-1.785072, -0.2753076, -1.136572, 0, 0, 0, 1, 1,
-1.775923, 0.4243705, -2.405991, 0, 0, 0, 1, 1,
-1.767641, -1.752305, -2.723579, 0, 0, 0, 1, 1,
-1.753693, -0.9081619, -2.264596, 1, 1, 1, 1, 1,
-1.746977, -1.501742, -2.706167, 1, 1, 1, 1, 1,
-1.741254, -0.1469398, -2.235454, 1, 1, 1, 1, 1,
-1.690295, -0.4601799, -0.4577445, 1, 1, 1, 1, 1,
-1.665104, 1.018651, -0.5481483, 1, 1, 1, 1, 1,
-1.663467, -0.8392954, 0.07812354, 1, 1, 1, 1, 1,
-1.648929, 0.299301, 0.7231344, 1, 1, 1, 1, 1,
-1.643732, 0.9380404, -0.1554296, 1, 1, 1, 1, 1,
-1.640373, 0.7333999, -1.089106, 1, 1, 1, 1, 1,
-1.635401, 0.2401087, -2.133988, 1, 1, 1, 1, 1,
-1.624341, 2.211709, -0.1808818, 1, 1, 1, 1, 1,
-1.619841, -1.063245, -2.829731, 1, 1, 1, 1, 1,
-1.603378, -0.5497313, -2.77089, 1, 1, 1, 1, 1,
-1.585465, -1.335722, -3.057477, 1, 1, 1, 1, 1,
-1.584359, 1.443164, 0.576085, 1, 1, 1, 1, 1,
-1.583319, 0.4699767, -1.742472, 0, 0, 1, 1, 1,
-1.581122, -1.204921, -1.816324, 1, 0, 0, 1, 1,
-1.572346, 0.8423403, -1.224444, 1, 0, 0, 1, 1,
-1.569325, -0.8776317, -2.23201, 1, 0, 0, 1, 1,
-1.564023, 0.626317, -2.809798, 1, 0, 0, 1, 1,
-1.56018, 0.5245953, 0.2408058, 1, 0, 0, 1, 1,
-1.555933, 0.06837244, -1.591965, 0, 0, 0, 1, 1,
-1.553214, 0.06542588, -1.616987, 0, 0, 0, 1, 1,
-1.542445, 0.3544187, -0.9292982, 0, 0, 0, 1, 1,
-1.542065, -1.466268, -2.497341, 0, 0, 0, 1, 1,
-1.501, 0.7838126, -2.542582, 0, 0, 0, 1, 1,
-1.493234, -0.188748, -2.481511, 0, 0, 0, 1, 1,
-1.486651, 0.8475637, -1.429309, 0, 0, 0, 1, 1,
-1.481169, 0.2800362, -3.131104, 1, 1, 1, 1, 1,
-1.476966, -0.5386361, -2.550681, 1, 1, 1, 1, 1,
-1.457487, 0.7559263, -2.135477, 1, 1, 1, 1, 1,
-1.451216, 1.022506, -2.406421, 1, 1, 1, 1, 1,
-1.427946, -0.9883547, -2.571301, 1, 1, 1, 1, 1,
-1.423931, 1.188594, 0.4272645, 1, 1, 1, 1, 1,
-1.420128, 1.585532, -0.9477188, 1, 1, 1, 1, 1,
-1.416824, 1.068545, -2.026184, 1, 1, 1, 1, 1,
-1.412523, -0.4685547, -1.624947, 1, 1, 1, 1, 1,
-1.406752, 0.1608205, 0.42022, 1, 1, 1, 1, 1,
-1.405831, 1.271188, -1.51201, 1, 1, 1, 1, 1,
-1.399405, -0.4293827, -3.007342, 1, 1, 1, 1, 1,
-1.396166, 1.531782, -1.520878, 1, 1, 1, 1, 1,
-1.388935, 0.5603179, -0.4062664, 1, 1, 1, 1, 1,
-1.385502, 1.422784, -1.451705, 1, 1, 1, 1, 1,
-1.363041, 0.4649063, -2.710593, 0, 0, 1, 1, 1,
-1.362956, -1.707137, -0.8774771, 1, 0, 0, 1, 1,
-1.362802, 2.174617, -1.438907, 1, 0, 0, 1, 1,
-1.35843, -1.611529, -2.307927, 1, 0, 0, 1, 1,
-1.354557, 0.0005455801, -0.7551383, 1, 0, 0, 1, 1,
-1.353037, -1.011069, -1.800429, 1, 0, 0, 1, 1,
-1.348976, -0.7320614, -2.328733, 0, 0, 0, 1, 1,
-1.345138, -0.5343115, -0.6050022, 0, 0, 0, 1, 1,
-1.34509, -1.444566, -3.451931, 0, 0, 0, 1, 1,
-1.338434, -1.353063, -2.293441, 0, 0, 0, 1, 1,
-1.336255, -0.5002794, -1.718839, 0, 0, 0, 1, 1,
-1.334322, 2.1539, 0.3052696, 0, 0, 0, 1, 1,
-1.315062, 1.163743, 0.2997294, 0, 0, 0, 1, 1,
-1.305234, 0.2266126, -1.032303, 1, 1, 1, 1, 1,
-1.304377, -0.09611132, -1.431589, 1, 1, 1, 1, 1,
-1.303319, 0.1487675, -1.630639, 1, 1, 1, 1, 1,
-1.301262, 1.87581, 0.08908574, 1, 1, 1, 1, 1,
-1.295961, 0.09623115, -2.060054, 1, 1, 1, 1, 1,
-1.288849, -0.63226, -2.38044, 1, 1, 1, 1, 1,
-1.284943, 0.4927119, -0.573366, 1, 1, 1, 1, 1,
-1.277875, -1.720456, -1.270368, 1, 1, 1, 1, 1,
-1.274718, 0.3095455, -0.2103351, 1, 1, 1, 1, 1,
-1.261842, 2.373643, -0.970642, 1, 1, 1, 1, 1,
-1.260817, 1.424082, -0.4161187, 1, 1, 1, 1, 1,
-1.254803, -1.420673, -2.715561, 1, 1, 1, 1, 1,
-1.253984, 0.8417016, -0.5099126, 1, 1, 1, 1, 1,
-1.251937, -0.5983526, -3.248542, 1, 1, 1, 1, 1,
-1.249287, -0.1138197, -0.742139, 1, 1, 1, 1, 1,
-1.241821, -0.4859488, -2.923752, 0, 0, 1, 1, 1,
-1.22773, -1.014396, -1.412922, 1, 0, 0, 1, 1,
-1.215162, -0.06211376, -3.090004, 1, 0, 0, 1, 1,
-1.208586, -0.4734831, 0.07805912, 1, 0, 0, 1, 1,
-1.20793, -0.5190921, -2.1464, 1, 0, 0, 1, 1,
-1.201209, 0.2473487, -0.3030888, 1, 0, 0, 1, 1,
-1.191944, 0.3794726, 1.064266, 0, 0, 0, 1, 1,
-1.168855, 0.5681572, -2.246907, 0, 0, 0, 1, 1,
-1.1676, 2.757206, -2.163015, 0, 0, 0, 1, 1,
-1.166515, -1.794169, -3.180097, 0, 0, 0, 1, 1,
-1.166083, -0.2951669, -1.964409, 0, 0, 0, 1, 1,
-1.161028, 0.6689183, -0.6413167, 0, 0, 0, 1, 1,
-1.159913, -0.1477483, -0.6357916, 0, 0, 0, 1, 1,
-1.15716, 0.4800109, -2.118454, 1, 1, 1, 1, 1,
-1.154281, 0.9064705, -1.565466, 1, 1, 1, 1, 1,
-1.153393, 1.775656, -0.9767798, 1, 1, 1, 1, 1,
-1.149411, 1.359226, 0.001757796, 1, 1, 1, 1, 1,
-1.139812, -1.136718, -5.203193, 1, 1, 1, 1, 1,
-1.123726, 0.07182947, -1.901477, 1, 1, 1, 1, 1,
-1.115539, -0.1463542, -1.707948, 1, 1, 1, 1, 1,
-1.114259, 0.971127, -1.023902, 1, 1, 1, 1, 1,
-1.108546, -1.563233, -2.618508, 1, 1, 1, 1, 1,
-1.105183, -1.998196, -2.468903, 1, 1, 1, 1, 1,
-1.105087, 0.2498804, -0.5846303, 1, 1, 1, 1, 1,
-1.091809, 0.02532354, -0.7367781, 1, 1, 1, 1, 1,
-1.091286, 0.4122142, -2.573651, 1, 1, 1, 1, 1,
-1.084662, 0.6396941, -0.6811654, 1, 1, 1, 1, 1,
-1.081779, -1.957314, -2.731263, 1, 1, 1, 1, 1,
-1.079146, 1.684343, 0.7325991, 0, 0, 1, 1, 1,
-1.078093, 0.6522925, -0.7994773, 1, 0, 0, 1, 1,
-1.075734, -0.6181797, -2.679292, 1, 0, 0, 1, 1,
-1.071775, -0.07210342, -2.514529, 1, 0, 0, 1, 1,
-1.070383, 0.2441871, -1.636807, 1, 0, 0, 1, 1,
-1.065359, 0.08249787, -2.121935, 1, 0, 0, 1, 1,
-1.064178, 0.2939709, -1.395754, 0, 0, 0, 1, 1,
-1.062119, 0.8021432, -0.8520339, 0, 0, 0, 1, 1,
-1.051495, -0.9105412, -0.879142, 0, 0, 0, 1, 1,
-1.048279, -0.4543866, -2.773872, 0, 0, 0, 1, 1,
-1.047818, -0.3068704, -2.603041, 0, 0, 0, 1, 1,
-1.033261, -1.825775, -2.577726, 0, 0, 0, 1, 1,
-1.023715, 1.017543, -1.281287, 0, 0, 0, 1, 1,
-1.023121, -0.8644644, -2.981838, 1, 1, 1, 1, 1,
-1.02075, 0.204755, 0.1646743, 1, 1, 1, 1, 1,
-1.020178, -1.30166, -3.074368, 1, 1, 1, 1, 1,
-1.018066, 1.455704, -2.229027, 1, 1, 1, 1, 1,
-1.015852, 0.4286264, -1.151691, 1, 1, 1, 1, 1,
-1.013961, -0.2068556, -0.7029654, 1, 1, 1, 1, 1,
-1.012681, 1.66278, -1.50671, 1, 1, 1, 1, 1,
-1.011564, -0.6792858, -1.034434, 1, 1, 1, 1, 1,
-1.003485, 0.842144, -1.286212, 1, 1, 1, 1, 1,
-1.002954, -0.4316757, -2.155003, 1, 1, 1, 1, 1,
-1.001613, 0.2519912, -2.274545, 1, 1, 1, 1, 1,
-0.9999961, -1.046142, -2.818063, 1, 1, 1, 1, 1,
-0.9974533, -0.2123329, -1.682908, 1, 1, 1, 1, 1,
-0.9947805, 0.7733898, -2.231839, 1, 1, 1, 1, 1,
-0.9941484, -0.5562018, -1.233347, 1, 1, 1, 1, 1,
-0.9931757, -1.737785, -1.331043, 0, 0, 1, 1, 1,
-0.9881156, -1.378493, -0.8755049, 1, 0, 0, 1, 1,
-0.983089, 1.475301, 2.429623, 1, 0, 0, 1, 1,
-0.9794828, 0.3172659, -1.420698, 1, 0, 0, 1, 1,
-0.9755619, 0.1594178, -0.1794487, 1, 0, 0, 1, 1,
-0.9751515, -1.189561, -3.668756, 1, 0, 0, 1, 1,
-0.9734583, 0.2124747, -1.903704, 0, 0, 0, 1, 1,
-0.9682427, -0.7605142, -1.640753, 0, 0, 0, 1, 1,
-0.9677558, 1.750722, 0.2121196, 0, 0, 0, 1, 1,
-0.9634905, 0.4914243, -0.5938969, 0, 0, 0, 1, 1,
-0.9618909, 0.6377562, -0.660488, 0, 0, 0, 1, 1,
-0.9568163, -0.126774, -3.045912, 0, 0, 0, 1, 1,
-0.95522, 1.855567, -1.998969, 0, 0, 0, 1, 1,
-0.9509441, 0.9835156, -0.457916, 1, 1, 1, 1, 1,
-0.9502292, 0.9476099, -1.309555, 1, 1, 1, 1, 1,
-0.9428045, 1.191298, -0.4019428, 1, 1, 1, 1, 1,
-0.9381567, 0.1538325, -0.2988978, 1, 1, 1, 1, 1,
-0.9327853, 0.5306437, -0.2087051, 1, 1, 1, 1, 1,
-0.9189433, -0.5919698, -1.140795, 1, 1, 1, 1, 1,
-0.9187707, -1.710846, -3.150511, 1, 1, 1, 1, 1,
-0.9068598, -0.5519905, -1.793864, 1, 1, 1, 1, 1,
-0.9022226, 1.382848, 1.042513, 1, 1, 1, 1, 1,
-0.8918917, 1.654451, -1.805889, 1, 1, 1, 1, 1,
-0.8844447, 0.6420735, -0.9057884, 1, 1, 1, 1, 1,
-0.8768211, -1.072727, -4.555746, 1, 1, 1, 1, 1,
-0.8645469, -0.4340813, -2.959331, 1, 1, 1, 1, 1,
-0.8576014, -1.91168, -2.834725, 1, 1, 1, 1, 1,
-0.8317031, -1.00032, -2.793809, 1, 1, 1, 1, 1,
-0.8278967, -0.6425402, -1.532326, 0, 0, 1, 1, 1,
-0.8208917, -0.3275699, -1.622723, 1, 0, 0, 1, 1,
-0.8188347, -0.8292625, -2.006621, 1, 0, 0, 1, 1,
-0.8173794, 0.1733096, -0.3750164, 1, 0, 0, 1, 1,
-0.8155479, -0.6458014, -4.552608, 1, 0, 0, 1, 1,
-0.8143908, 1.622813, -0.04178677, 1, 0, 0, 1, 1,
-0.8068983, 0.3315706, -1.270836, 0, 0, 0, 1, 1,
-0.8068477, -1.164343, -1.982724, 0, 0, 0, 1, 1,
-0.8058264, 0.8142597, 0.2663393, 0, 0, 0, 1, 1,
-0.805694, -0.09414142, -0.1182217, 0, 0, 0, 1, 1,
-0.8043283, 2.491107, -0.5169988, 0, 0, 0, 1, 1,
-0.8018963, 2.006201, 0.1480382, 0, 0, 0, 1, 1,
-0.7981116, -0.4866114, -1.93947, 0, 0, 0, 1, 1,
-0.7971082, -0.595745, -2.538387, 1, 1, 1, 1, 1,
-0.7963955, -0.1057094, -0.6506425, 1, 1, 1, 1, 1,
-0.7960952, -0.3449595, -2.193011, 1, 1, 1, 1, 1,
-0.7941098, -1.205345, -1.203228, 1, 1, 1, 1, 1,
-0.7899096, 1.078926, -0.9733954, 1, 1, 1, 1, 1,
-0.787331, 0.5521508, -0.1210163, 1, 1, 1, 1, 1,
-0.7806709, -1.070233, -1.329939, 1, 1, 1, 1, 1,
-0.776019, -1.56935, -2.681537, 1, 1, 1, 1, 1,
-0.7742965, -0.7499937, -0.4034247, 1, 1, 1, 1, 1,
-0.7691405, -0.8441894, -0.7387959, 1, 1, 1, 1, 1,
-0.769101, 0.5613248, -1.103493, 1, 1, 1, 1, 1,
-0.7677497, -0.2788119, -0.2750923, 1, 1, 1, 1, 1,
-0.7635035, -0.4430506, -1.617747, 1, 1, 1, 1, 1,
-0.7620478, -0.02777001, -2.040849, 1, 1, 1, 1, 1,
-0.7534108, -0.6059734, -4.659405, 1, 1, 1, 1, 1,
-0.7523347, -1.055555, -2.995216, 0, 0, 1, 1, 1,
-0.7512252, -0.06283239, -0.06464621, 1, 0, 0, 1, 1,
-0.7480577, -0.8674352, -3.8681, 1, 0, 0, 1, 1,
-0.7466549, -0.4570207, -0.6140385, 1, 0, 0, 1, 1,
-0.730713, -0.3139944, -2.097643, 1, 0, 0, 1, 1,
-0.7305655, 0.130143, -1.849365, 1, 0, 0, 1, 1,
-0.7292084, -0.5097322, -1.457005, 0, 0, 0, 1, 1,
-0.7288109, 0.3289309, -1.788347, 0, 0, 0, 1, 1,
-0.7282879, 0.1709725, -0.8740113, 0, 0, 0, 1, 1,
-0.7252414, -1.030528, -2.707172, 0, 0, 0, 1, 1,
-0.7235005, 0.3751482, 0.09063063, 0, 0, 0, 1, 1,
-0.7214224, -0.3611723, -2.153839, 0, 0, 0, 1, 1,
-0.7142595, -0.2675833, -3.232354, 0, 0, 0, 1, 1,
-0.7140275, 0.654475, -0.09031267, 1, 1, 1, 1, 1,
-0.7127598, -0.4393669, -2.106532, 1, 1, 1, 1, 1,
-0.7094058, 0.4394123, -0.6002643, 1, 1, 1, 1, 1,
-0.6969236, 0.4509021, -0.3786558, 1, 1, 1, 1, 1,
-0.6926544, 0.09961996, -2.134073, 1, 1, 1, 1, 1,
-0.6917689, 1.557159, -1.40418, 1, 1, 1, 1, 1,
-0.6894616, -0.918025, -1.915163, 1, 1, 1, 1, 1,
-0.688125, 1.124547, -1.109461, 1, 1, 1, 1, 1,
-0.6879925, -0.324037, -1.778071, 1, 1, 1, 1, 1,
-0.6870924, -0.1476323, 0.07264771, 1, 1, 1, 1, 1,
-0.6838698, 0.5533282, -0.6854292, 1, 1, 1, 1, 1,
-0.6830509, -0.1609253, -1.78826, 1, 1, 1, 1, 1,
-0.6661066, -1.119555, -3.484449, 1, 1, 1, 1, 1,
-0.6633416, -1.594432, -2.459745, 1, 1, 1, 1, 1,
-0.6565995, 0.08575694, -1.540799, 1, 1, 1, 1, 1,
-0.6539853, -1.467583, -3.247447, 0, 0, 1, 1, 1,
-0.6537947, 0.7906499, -1.556494, 1, 0, 0, 1, 1,
-0.6537875, 0.04838258, -1.3847, 1, 0, 0, 1, 1,
-0.65039, 0.9684727, -1.989644, 1, 0, 0, 1, 1,
-0.637394, -0.6771035, -2.433165, 1, 0, 0, 1, 1,
-0.6322747, -0.3519171, -1.875041, 1, 0, 0, 1, 1,
-0.6313239, 0.3011412, -0.4951629, 0, 0, 0, 1, 1,
-0.6280983, -0.4707141, -2.384404, 0, 0, 0, 1, 1,
-0.6226597, 0.9802753, -2.592268, 0, 0, 0, 1, 1,
-0.6211767, -1.465443, -2.796937, 0, 0, 0, 1, 1,
-0.6193786, -0.6950685, -1.597633, 0, 0, 0, 1, 1,
-0.6159449, -1.234402, -4.783064, 0, 0, 0, 1, 1,
-0.6137505, 0.6045576, -0.6631994, 0, 0, 0, 1, 1,
-0.6123534, -1.545576, -4.936607, 1, 1, 1, 1, 1,
-0.6116053, 1.011111, -1.301934, 1, 1, 1, 1, 1,
-0.6095738, -0.6391585, -2.419708, 1, 1, 1, 1, 1,
-0.6076173, 0.3495026, -1.738189, 1, 1, 1, 1, 1,
-0.6072564, -0.07268061, -2.851567, 1, 1, 1, 1, 1,
-0.6029489, -0.6224643, -3.241702, 1, 1, 1, 1, 1,
-0.6002536, -1.886421, -3.241386, 1, 1, 1, 1, 1,
-0.5991915, 0.2978358, -0.380182, 1, 1, 1, 1, 1,
-0.5986674, -0.8730515, -1.434535, 1, 1, 1, 1, 1,
-0.5974855, -0.3103201, -1.434017, 1, 1, 1, 1, 1,
-0.5967085, -0.9003312, -3.601506, 1, 1, 1, 1, 1,
-0.5954452, -1.295796, -1.331604, 1, 1, 1, 1, 1,
-0.5954409, -0.008745866, -0.8579122, 1, 1, 1, 1, 1,
-0.5908719, 1.25323, -1.391309, 1, 1, 1, 1, 1,
-0.5898873, 1.086461, -0.7113444, 1, 1, 1, 1, 1,
-0.5882505, -1.25433, -2.063926, 0, 0, 1, 1, 1,
-0.5876845, 1.417655, 0.689738, 1, 0, 0, 1, 1,
-0.5850249, 2.110103, -1.297064, 1, 0, 0, 1, 1,
-0.5799386, 0.2963795, -0.7516442, 1, 0, 0, 1, 1,
-0.5766338, -0.6253617, -2.704567, 1, 0, 0, 1, 1,
-0.5737109, -0.4491966, -2.268404, 1, 0, 0, 1, 1,
-0.573129, -0.7406918, -1.333279, 0, 0, 0, 1, 1,
-0.5730903, 0.336768, -2.083557, 0, 0, 0, 1, 1,
-0.5676496, -0.3968922, -1.715916, 0, 0, 0, 1, 1,
-0.5645949, 0.1496917, -1.523286, 0, 0, 0, 1, 1,
-0.561406, -0.06483702, -1.49237, 0, 0, 0, 1, 1,
-0.5597649, 0.3792594, -0.9992531, 0, 0, 0, 1, 1,
-0.5579379, -0.8200567, -2.011071, 0, 0, 0, 1, 1,
-0.5574394, -0.1559291, -2.449964, 1, 1, 1, 1, 1,
-0.5515729, -0.8435515, -1.939511, 1, 1, 1, 1, 1,
-0.5452833, -0.3504141, -3.376199, 1, 1, 1, 1, 1,
-0.545012, 0.80684, 2.120727, 1, 1, 1, 1, 1,
-0.5397047, -1.435574, -2.511029, 1, 1, 1, 1, 1,
-0.5359789, 0.8084346, -0.5168104, 1, 1, 1, 1, 1,
-0.535062, -0.3118132, -3.21152, 1, 1, 1, 1, 1,
-0.5284936, -0.5752969, -0.7365441, 1, 1, 1, 1, 1,
-0.5215755, 0.006376135, -1.931424, 1, 1, 1, 1, 1,
-0.5164291, -0.3403188, -1.839115, 1, 1, 1, 1, 1,
-0.5132681, -1.11431, -3.061079, 1, 1, 1, 1, 1,
-0.5092658, 0.3277266, 0.3127643, 1, 1, 1, 1, 1,
-0.5057861, 0.6731029, -0.1142479, 1, 1, 1, 1, 1,
-0.4953732, 1.023786, -1.975724, 1, 1, 1, 1, 1,
-0.4951873, 1.551966, 0.2625145, 1, 1, 1, 1, 1,
-0.4935786, -0.3636032, -2.245308, 0, 0, 1, 1, 1,
-0.4926746, 1.203556, -0.8711463, 1, 0, 0, 1, 1,
-0.4902804, -1.173055, -3.269288, 1, 0, 0, 1, 1,
-0.484951, -0.7819234, -2.388851, 1, 0, 0, 1, 1,
-0.4844353, 1.576878, 0.6289002, 1, 0, 0, 1, 1,
-0.4781763, -1.208714, -2.946776, 1, 0, 0, 1, 1,
-0.4736755, -1.810752, -3.22153, 0, 0, 0, 1, 1,
-0.4707845, -0.7122661, -3.383228, 0, 0, 0, 1, 1,
-0.4628801, 0.5159799, -0.6540393, 0, 0, 0, 1, 1,
-0.461868, -1.333021, -2.633809, 0, 0, 0, 1, 1,
-0.4602941, 0.112937, -1.752674, 0, 0, 0, 1, 1,
-0.4472452, 0.2669058, -3.175733, 0, 0, 0, 1, 1,
-0.4472402, -0.6622844, -3.177688, 0, 0, 0, 1, 1,
-0.446609, -0.04781565, -2.370551, 1, 1, 1, 1, 1,
-0.4460441, -0.6492094, -2.230166, 1, 1, 1, 1, 1,
-0.4447202, -1.108544, -2.388328, 1, 1, 1, 1, 1,
-0.4428717, -2.331339, -3.726304, 1, 1, 1, 1, 1,
-0.4411756, -1.178844, -5.226849, 1, 1, 1, 1, 1,
-0.4404821, 1.111409, -0.08632779, 1, 1, 1, 1, 1,
-0.4381864, 0.7776965, -0.6163282, 1, 1, 1, 1, 1,
-0.4305831, -0.2696952, -1.07971, 1, 1, 1, 1, 1,
-0.4266984, -0.5371688, -4.134595, 1, 1, 1, 1, 1,
-0.4261829, 1.63119, 0.6381305, 1, 1, 1, 1, 1,
-0.4205442, -0.3629221, -2.452374, 1, 1, 1, 1, 1,
-0.4198883, 0.7555346, -1.941971, 1, 1, 1, 1, 1,
-0.4183285, 0.4436785, -1.317457, 1, 1, 1, 1, 1,
-0.4093879, 1.125999, 1.203973, 1, 1, 1, 1, 1,
-0.4085915, 0.5955503, -1.652812, 1, 1, 1, 1, 1,
-0.4060863, 0.4341557, -1.135248, 0, 0, 1, 1, 1,
-0.4052115, 1.750894, -1.7701, 1, 0, 0, 1, 1,
-0.4040543, 1.001992, 0.8971327, 1, 0, 0, 1, 1,
-0.4034382, 0.9172971, -2.931505, 1, 0, 0, 1, 1,
-0.402507, 0.003136315, -2.932686, 1, 0, 0, 1, 1,
-0.3931531, -0.4161713, -3.170618, 1, 0, 0, 1, 1,
-0.3915152, 0.1439464, 0.4110647, 0, 0, 0, 1, 1,
-0.3910661, -1.729074, -2.015078, 0, 0, 0, 1, 1,
-0.3829792, 0.6556719, -0.3068395, 0, 0, 0, 1, 1,
-0.3814989, -1.751824, -4.16929, 0, 0, 0, 1, 1,
-0.3800859, -0.2726795, -1.605331, 0, 0, 0, 1, 1,
-0.3769354, -0.9399612, -1.531077, 0, 0, 0, 1, 1,
-0.3744071, 0.4046695, -1.430884, 0, 0, 0, 1, 1,
-0.3743584, -0.7578585, -2.48343, 1, 1, 1, 1, 1,
-0.3728064, -0.04786191, -1.292764, 1, 1, 1, 1, 1,
-0.3720009, 0.5240053, 0.2715987, 1, 1, 1, 1, 1,
-0.3706703, -0.238872, -3.07673, 1, 1, 1, 1, 1,
-0.3662707, -0.09382191, -2.21082, 1, 1, 1, 1, 1,
-0.3652136, 0.6593578, -0.5550925, 1, 1, 1, 1, 1,
-0.364971, -0.7028534, -2.615229, 1, 1, 1, 1, 1,
-0.3644623, 1.059538, -0.6766257, 1, 1, 1, 1, 1,
-0.3642399, 0.5659084, -0.4657708, 1, 1, 1, 1, 1,
-0.3640073, 0.3181079, -1.755515, 1, 1, 1, 1, 1,
-0.3591443, 1.415326, 0.01566894, 1, 1, 1, 1, 1,
-0.3565791, -2.027202, -2.579211, 1, 1, 1, 1, 1,
-0.3537081, -0.546783, -3.287769, 1, 1, 1, 1, 1,
-0.3497441, -0.1481567, -1.539232, 1, 1, 1, 1, 1,
-0.3473874, -1.305425, -1.980091, 1, 1, 1, 1, 1,
-0.3439048, -2.585531, -2.763456, 0, 0, 1, 1, 1,
-0.343302, 0.6218259, -0.3523504, 1, 0, 0, 1, 1,
-0.3431259, 0.3768821, -0.6421849, 1, 0, 0, 1, 1,
-0.3395855, 0.8284122, -1.783447, 1, 0, 0, 1, 1,
-0.3366932, 0.9997458, -0.1650817, 1, 0, 0, 1, 1,
-0.3306161, -2.377481, -3.00111, 1, 0, 0, 1, 1,
-0.3297217, 1.998045, -1.054732, 0, 0, 0, 1, 1,
-0.3269896, 0.3631926, -0.9572085, 0, 0, 0, 1, 1,
-0.3261573, -1.006228, -4.594009, 0, 0, 0, 1, 1,
-0.3256903, -0.7096579, -3.814401, 0, 0, 0, 1, 1,
-0.3252657, -0.5405113, -5.105779, 0, 0, 0, 1, 1,
-0.3223799, 0.01284476, -1.198955, 0, 0, 0, 1, 1,
-0.3164635, -0.769471, -1.726416, 0, 0, 0, 1, 1,
-0.313046, -0.2006548, -2.385472, 1, 1, 1, 1, 1,
-0.3110247, -0.4008979, -2.034503, 1, 1, 1, 1, 1,
-0.3106537, 1.109492, -1.069556, 1, 1, 1, 1, 1,
-0.3079002, -0.2636512, -3.921412, 1, 1, 1, 1, 1,
-0.3068557, 0.1856126, -1.061077, 1, 1, 1, 1, 1,
-0.3055418, -2.008009, -2.759829, 1, 1, 1, 1, 1,
-0.3050334, -0.330453, -4.176514, 1, 1, 1, 1, 1,
-0.2991476, 0.2847882, 0.9000207, 1, 1, 1, 1, 1,
-0.2988122, 0.4259048, -0.6542072, 1, 1, 1, 1, 1,
-0.2966662, 0.2731467, -1.66191, 1, 1, 1, 1, 1,
-0.2943034, 1.83746, 0.8567088, 1, 1, 1, 1, 1,
-0.2926967, 0.01906617, -0.2589792, 1, 1, 1, 1, 1,
-0.2897296, -0.6723416, -0.5244028, 1, 1, 1, 1, 1,
-0.2880061, -0.07634217, 0.6926187, 1, 1, 1, 1, 1,
-0.2865781, -1.692505, -3.282917, 1, 1, 1, 1, 1,
-0.2824923, 0.6487615, 0.09043807, 0, 0, 1, 1, 1,
-0.2744154, 1.442677, 1.536564, 1, 0, 0, 1, 1,
-0.2679436, -0.1735707, -2.923835, 1, 0, 0, 1, 1,
-0.2613941, 1.113505, -2.632256, 1, 0, 0, 1, 1,
-0.2569419, 0.8828696, -1.77549, 1, 0, 0, 1, 1,
-0.2555872, -0.6002646, -3.329139, 1, 0, 0, 1, 1,
-0.2547992, 0.8546994, -0.41138, 0, 0, 0, 1, 1,
-0.2527909, 0.07248212, -0.7939932, 0, 0, 0, 1, 1,
-0.2513504, -0.5651794, -3.092728, 0, 0, 0, 1, 1,
-0.2508531, -0.3355404, -2.503092, 0, 0, 0, 1, 1,
-0.2428807, 1.339233, 0.1232833, 0, 0, 0, 1, 1,
-0.2411058, -0.1518885, -3.070776, 0, 0, 0, 1, 1,
-0.2321417, 0.4911776, -2.014778, 0, 0, 0, 1, 1,
-0.2307268, -0.5728358, -1.669617, 1, 1, 1, 1, 1,
-0.2259731, 0.2024713, -0.3328106, 1, 1, 1, 1, 1,
-0.2203755, 0.7417171, -0.1741684, 1, 1, 1, 1, 1,
-0.2126094, -0.8443192, -3.335273, 1, 1, 1, 1, 1,
-0.210884, 0.7118609, -1.809327, 1, 1, 1, 1, 1,
-0.2037423, -1.946184, -4.126503, 1, 1, 1, 1, 1,
-0.2014286, -0.6096795, -2.327981, 1, 1, 1, 1, 1,
-0.2007461, -0.3684582, -1.365409, 1, 1, 1, 1, 1,
-0.2003735, -0.05258801, -2.49624, 1, 1, 1, 1, 1,
-0.1948613, -0.7865326, -2.698472, 1, 1, 1, 1, 1,
-0.1836973, 0.1096911, -1.531636, 1, 1, 1, 1, 1,
-0.1818706, 0.4997259, -0.2129589, 1, 1, 1, 1, 1,
-0.1816018, 0.3224587, 0.3315759, 1, 1, 1, 1, 1,
-0.179088, 0.4996287, -0.8090215, 1, 1, 1, 1, 1,
-0.1776228, 0.5000363, -2.960907, 1, 1, 1, 1, 1,
-0.177053, -0.2947251, -3.065052, 0, 0, 1, 1, 1,
-0.1727088, 2.15073, 1.079664, 1, 0, 0, 1, 1,
-0.1673833, -0.849367, -5.335458, 1, 0, 0, 1, 1,
-0.1653609, -0.2277263, -2.2229, 1, 0, 0, 1, 1,
-0.1636131, 0.09190316, 0.3485624, 1, 0, 0, 1, 1,
-0.1552848, 0.8507876, 0.01689123, 1, 0, 0, 1, 1,
-0.1483827, 0.1640269, -1.784676, 0, 0, 0, 1, 1,
-0.1473789, -0.03567427, -2.077956, 0, 0, 0, 1, 1,
-0.1415856, 0.06203445, -1.45142, 0, 0, 0, 1, 1,
-0.1402934, 1.126411, -0.711659, 0, 0, 0, 1, 1,
-0.138432, -1.719127, -2.764332, 0, 0, 0, 1, 1,
-0.1379275, -0.3671024, -3.113276, 0, 0, 0, 1, 1,
-0.1370805, 0.1106718, -0.2393142, 0, 0, 0, 1, 1,
-0.1307679, 1.427606, 0.6712081, 1, 1, 1, 1, 1,
-0.1267287, 1.407691, 1.000691, 1, 1, 1, 1, 1,
-0.1256753, -1.612358, -2.021842, 1, 1, 1, 1, 1,
-0.1242452, 1.899046, -0.2420224, 1, 1, 1, 1, 1,
-0.124184, 3.20716, -0.3113163, 1, 1, 1, 1, 1,
-0.1195933, -0.02277716, -0.7820033, 1, 1, 1, 1, 1,
-0.1183827, -0.452947, -3.200616, 1, 1, 1, 1, 1,
-0.1148783, -0.4286687, -2.461575, 1, 1, 1, 1, 1,
-0.1144766, -1.225689, -2.617069, 1, 1, 1, 1, 1,
-0.1136117, -0.5152934, -3.697949, 1, 1, 1, 1, 1,
-0.1109321, -0.4630834, -2.953561, 1, 1, 1, 1, 1,
-0.1067987, 0.1899474, -0.7077082, 1, 1, 1, 1, 1,
-0.1066829, 1.005611, -0.2149226, 1, 1, 1, 1, 1,
-0.1065808, 0.2558656, -0.2130316, 1, 1, 1, 1, 1,
-0.1006088, -0.06461217, -1.526926, 1, 1, 1, 1, 1,
-0.09960902, 0.6750019, 2.548634, 0, 0, 1, 1, 1,
-0.09739824, -0.1222238, -2.080262, 1, 0, 0, 1, 1,
-0.09668117, 1.327443, 0.4736419, 1, 0, 0, 1, 1,
-0.09425887, -1.301725, -1.827464, 1, 0, 0, 1, 1,
-0.08938631, 1.54073, -0.4326674, 1, 0, 0, 1, 1,
-0.08862262, 0.666243, -1.798728, 1, 0, 0, 1, 1,
-0.08719307, -0.853293, -3.769919, 0, 0, 0, 1, 1,
-0.08620133, -1.011745, -2.064997, 0, 0, 0, 1, 1,
-0.08538099, 0.4081761, -0.5093095, 0, 0, 0, 1, 1,
-0.08407401, 0.6539388, 1.456567, 0, 0, 0, 1, 1,
-0.07594647, 0.01774165, -0.9276397, 0, 0, 0, 1, 1,
-0.07530119, -0.9560491, -4.121613, 0, 0, 0, 1, 1,
-0.07324957, -0.02394468, -2.770286, 0, 0, 0, 1, 1,
-0.06868076, -3.325166, -3.775308, 1, 1, 1, 1, 1,
-0.06647141, 0.1078761, -1.401644, 1, 1, 1, 1, 1,
-0.06621234, 1.491911, 2.376035, 1, 1, 1, 1, 1,
-0.06307382, 0.2685148, -1.07143, 1, 1, 1, 1, 1,
-0.06018354, 1.205607, 1.191106, 1, 1, 1, 1, 1,
-0.05814733, -0.2914267, -2.878737, 1, 1, 1, 1, 1,
-0.04958511, -0.598116, -4.576678, 1, 1, 1, 1, 1,
-0.04808062, -0.6017008, -2.461823, 1, 1, 1, 1, 1,
-0.04710761, 0.7711583, 1.352875, 1, 1, 1, 1, 1,
-0.04668054, 1.603327, -1.507375, 1, 1, 1, 1, 1,
-0.04493287, 0.0841554, -0.1862605, 1, 1, 1, 1, 1,
-0.04237906, -0.1168324, -2.197902, 1, 1, 1, 1, 1,
-0.04189664, 0.4854209, -0.8790539, 1, 1, 1, 1, 1,
-0.0272047, -0.5334077, -1.856291, 1, 1, 1, 1, 1,
-0.02623451, 0.4495106, -1.951276, 1, 1, 1, 1, 1,
-0.02457712, 0.04576306, -0.5916194, 0, 0, 1, 1, 1,
-0.0244804, -1.181666, -2.608986, 1, 0, 0, 1, 1,
-0.02161824, 1.188305, -0.09697495, 1, 0, 0, 1, 1,
-0.01934625, 0.2977264, -0.05824468, 1, 0, 0, 1, 1,
-0.01850214, -0.416334, -3.406795, 1, 0, 0, 1, 1,
-0.01848231, 0.436264, -0.7202011, 1, 0, 0, 1, 1,
-0.01600104, -0.3552698, -3.231257, 0, 0, 0, 1, 1,
-0.01127606, -1.174721, -3.902157, 0, 0, 0, 1, 1,
-0.009606906, -0.4292421, -5.041069, 0, 0, 0, 1, 1,
-0.007935537, 0.04543502, 0.3914273, 0, 0, 0, 1, 1,
-0.005802985, -0.08898368, -4.257018, 0, 0, 0, 1, 1,
-0.003220379, 0.6197799, -1.325067, 0, 0, 0, 1, 1,
-0.002635634, -0.7731462, -3.173838, 0, 0, 0, 1, 1,
0.002323918, -0.9036351, 3.157853, 1, 1, 1, 1, 1,
0.005101854, 0.2797157, -0.1401541, 1, 1, 1, 1, 1,
0.009141745, 0.9487554, 1.825319, 1, 1, 1, 1, 1,
0.01257825, 0.4369536, -1.707026, 1, 1, 1, 1, 1,
0.01369065, 0.8238835, -0.009353726, 1, 1, 1, 1, 1,
0.01562234, 0.07749195, 0.588716, 1, 1, 1, 1, 1,
0.01950505, 0.02317283, -0.8788465, 1, 1, 1, 1, 1,
0.02340688, -0.3531137, 2.775429, 1, 1, 1, 1, 1,
0.02613075, 1.181924, -0.2066071, 1, 1, 1, 1, 1,
0.02650782, -0.3576717, 4.079477, 1, 1, 1, 1, 1,
0.02944005, -0.5627269, 4.34385, 1, 1, 1, 1, 1,
0.03340103, -0.9247289, 3.845697, 1, 1, 1, 1, 1,
0.03379551, -0.3599807, 2.074869, 1, 1, 1, 1, 1,
0.03814089, -0.4318709, 3.804812, 1, 1, 1, 1, 1,
0.03872439, 1.167685, 0.04132612, 1, 1, 1, 1, 1,
0.03904868, 0.2912791, 0.4015368, 0, 0, 1, 1, 1,
0.03957275, -0.3373605, 2.672471, 1, 0, 0, 1, 1,
0.04086944, 0.9271693, -0.2474385, 1, 0, 0, 1, 1,
0.0480097, 1.043131, -0.6769788, 1, 0, 0, 1, 1,
0.05058262, 0.6814138, 1.209365, 1, 0, 0, 1, 1,
0.05328526, -1.178122, 4.389976, 1, 0, 0, 1, 1,
0.06071265, -0.8171502, 1.296569, 0, 0, 0, 1, 1,
0.06211403, 0.7778919, -0.9135132, 0, 0, 0, 1, 1,
0.06264296, -1.03079, 2.997581, 0, 0, 0, 1, 1,
0.06740585, 0.1651839, 1.15997, 0, 0, 0, 1, 1,
0.0677408, -0.3978356, 2.129755, 0, 0, 0, 1, 1,
0.07014318, 0.5611837, -2.108496, 0, 0, 0, 1, 1,
0.07100984, 0.6410831, -0.8576989, 0, 0, 0, 1, 1,
0.0756823, -0.2878283, 2.898041, 1, 1, 1, 1, 1,
0.0787235, -0.01971696, 2.783828, 1, 1, 1, 1, 1,
0.08038059, 0.6716359, -0.7552569, 1, 1, 1, 1, 1,
0.08247628, -1.611861, 2.90552, 1, 1, 1, 1, 1,
0.08294537, -0.9031557, 1.828906, 1, 1, 1, 1, 1,
0.08642629, -1.212666, 3.701787, 1, 1, 1, 1, 1,
0.08650959, 0.2053631, -0.1426605, 1, 1, 1, 1, 1,
0.08691832, 0.4760687, 0.4032397, 1, 1, 1, 1, 1,
0.08792181, 0.9502071, -0.1921495, 1, 1, 1, 1, 1,
0.08875588, -2.244119, 2.81415, 1, 1, 1, 1, 1,
0.09092586, 0.6921868, 0.760861, 1, 1, 1, 1, 1,
0.09130815, 0.3623531, -0.625045, 1, 1, 1, 1, 1,
0.09223617, -0.5890678, 2.98663, 1, 1, 1, 1, 1,
0.09324699, 0.4213787, -0.5701571, 1, 1, 1, 1, 1,
0.09439528, -0.6204012, 5.32941, 1, 1, 1, 1, 1,
0.0988568, 0.2803291, 0.5871975, 0, 0, 1, 1, 1,
0.1071234, -1.112429, 1.363356, 1, 0, 0, 1, 1,
0.107215, -1.102846, 3.66267, 1, 0, 0, 1, 1,
0.1130521, 0.371278, 0.3701065, 1, 0, 0, 1, 1,
0.1137552, 0.001716467, 3.306635, 1, 0, 0, 1, 1,
0.1150952, -1.719473, 2.884976, 1, 0, 0, 1, 1,
0.1151835, 0.8975721, -0.04870937, 0, 0, 0, 1, 1,
0.115502, 1.01062, -0.4840125, 0, 0, 0, 1, 1,
0.1161281, 0.218626, 0.7972837, 0, 0, 0, 1, 1,
0.117672, 0.9227723, 0.3685794, 0, 0, 0, 1, 1,
0.1178616, -0.3319445, 2.188634, 0, 0, 0, 1, 1,
0.119508, -1.088096, 2.751198, 0, 0, 0, 1, 1,
0.1257393, -0.9839076, 3.577251, 0, 0, 0, 1, 1,
0.1260267, 0.6497701, 0.5207172, 1, 1, 1, 1, 1,
0.1327547, 0.2216076, 1.475827, 1, 1, 1, 1, 1,
0.1332752, 0.6329591, 0.5434594, 1, 1, 1, 1, 1,
0.1359949, -0.4914953, 4.140301, 1, 1, 1, 1, 1,
0.1401743, -1.236759, 3.382809, 1, 1, 1, 1, 1,
0.1418094, 0.4789934, -0.006009496, 1, 1, 1, 1, 1,
0.1434896, -0.05338489, 3.867907, 1, 1, 1, 1, 1,
0.1442847, 0.01056181, 0.5715714, 1, 1, 1, 1, 1,
0.1457036, 0.4534678, 0.3490244, 1, 1, 1, 1, 1,
0.14738, -0.2781627, 2.040388, 1, 1, 1, 1, 1,
0.1523055, -1.349397, 4.331637, 1, 1, 1, 1, 1,
0.1632525, -1.252045, 2.088822, 1, 1, 1, 1, 1,
0.1635981, -1.34782, 4.7936, 1, 1, 1, 1, 1,
0.167059, 0.8786219, 0.1565193, 1, 1, 1, 1, 1,
0.1701301, -0.7258781, 3.750464, 1, 1, 1, 1, 1,
0.1718058, 1.000143, 0.7223667, 0, 0, 1, 1, 1,
0.1740152, -1.69117, 2.122206, 1, 0, 0, 1, 1,
0.175125, 0.8385966, -0.2381602, 1, 0, 0, 1, 1,
0.1768614, 0.5930281, -1.015595, 1, 0, 0, 1, 1,
0.1783108, -0.4876338, 3.053782, 1, 0, 0, 1, 1,
0.1783958, -2.397579, 1.946004, 1, 0, 0, 1, 1,
0.1795007, 0.2272818, -0.3869406, 0, 0, 0, 1, 1,
0.1805543, 0.4858739, 0.7111226, 0, 0, 0, 1, 1,
0.1819512, -0.6744736, 3.206789, 0, 0, 0, 1, 1,
0.1855721, 3.154021, -0.08304778, 0, 0, 0, 1, 1,
0.1858914, 0.2815488, 0.9730622, 0, 0, 0, 1, 1,
0.1890173, 1.176773, -0.6622853, 0, 0, 0, 1, 1,
0.1905658, -1.43059, 3.661454, 0, 0, 0, 1, 1,
0.1972179, 0.5991924, 1.278499, 1, 1, 1, 1, 1,
0.1972727, -0.1074091, 2.491321, 1, 1, 1, 1, 1,
0.2000462, 0.8943123, 1.637032, 1, 1, 1, 1, 1,
0.2017346, -1.026539, 5.36664, 1, 1, 1, 1, 1,
0.2111052, -1.018641, 3.757666, 1, 1, 1, 1, 1,
0.2111415, -0.3492994, 2.182458, 1, 1, 1, 1, 1,
0.2133276, -0.5146068, 3.61137, 1, 1, 1, 1, 1,
0.2264523, 0.7593521, 0.1062808, 1, 1, 1, 1, 1,
0.2312308, -0.2725885, 1.875553, 1, 1, 1, 1, 1,
0.2341718, 1.477702, -0.6286895, 1, 1, 1, 1, 1,
0.2469584, -0.5039366, 0.5059157, 1, 1, 1, 1, 1,
0.2505759, 2.060901, -0.09192432, 1, 1, 1, 1, 1,
0.2514012, 0.4237217, 1.582676, 1, 1, 1, 1, 1,
0.2590638, 1.748622, 0.4714911, 1, 1, 1, 1, 1,
0.2600502, 1.387572, -0.09738951, 1, 1, 1, 1, 1,
0.2605789, -1.372934, 2.161859, 0, 0, 1, 1, 1,
0.261713, -0.3220815, 2.377283, 1, 0, 0, 1, 1,
0.2653253, -0.5138666, 2.828192, 1, 0, 0, 1, 1,
0.2693182, -2.39069, 2.721856, 1, 0, 0, 1, 1,
0.2709301, 0.3099266, -0.6157417, 1, 0, 0, 1, 1,
0.2736083, 0.4393339, -0.03679865, 1, 0, 0, 1, 1,
0.2799968, -0.04358919, -0.009331126, 0, 0, 0, 1, 1,
0.2801323, 1.019701, 1.127072, 0, 0, 0, 1, 1,
0.2849213, -0.6336628, 1.701222, 0, 0, 0, 1, 1,
0.290989, 1.3739, 1.060573, 0, 0, 0, 1, 1,
0.294248, 0.3211417, 0.7958052, 0, 0, 0, 1, 1,
0.2954959, -1.92196, 2.444103, 0, 0, 0, 1, 1,
0.2971769, 1.308896, -1.794311, 0, 0, 0, 1, 1,
0.3009564, -0.005442918, 0.3645587, 1, 1, 1, 1, 1,
0.3029177, 1.288975, 1.476974, 1, 1, 1, 1, 1,
0.3042782, -0.03432978, 1.919765, 1, 1, 1, 1, 1,
0.3063855, 0.3767316, 1.710291, 1, 1, 1, 1, 1,
0.311539, -2.293447, 2.058227, 1, 1, 1, 1, 1,
0.314287, -0.6425442, 4.675417, 1, 1, 1, 1, 1,
0.3143608, -1.49628, 3.572426, 1, 1, 1, 1, 1,
0.326271, 0.5282085, 1.807734, 1, 1, 1, 1, 1,
0.3266255, -0.1523631, 2.955586, 1, 1, 1, 1, 1,
0.3286328, 0.03207396, 0.905345, 1, 1, 1, 1, 1,
0.3354289, 0.5063591, -0.2847753, 1, 1, 1, 1, 1,
0.3374385, -0.02759023, 1.846417, 1, 1, 1, 1, 1,
0.3381581, 0.68854, 1.752649, 1, 1, 1, 1, 1,
0.3391158, -0.1762875, 2.005459, 1, 1, 1, 1, 1,
0.3400673, 0.3062417, 0.8554632, 1, 1, 1, 1, 1,
0.3404924, 0.1798284, 1.852101, 0, 0, 1, 1, 1,
0.3410694, 1.27831, 0.1576109, 1, 0, 0, 1, 1,
0.3424847, -0.294714, 1.430789, 1, 0, 0, 1, 1,
0.3453642, -0.463762, 2.812146, 1, 0, 0, 1, 1,
0.3518247, -0.5377652, 2.839966, 1, 0, 0, 1, 1,
0.3524144, -1.430081, 2.222251, 1, 0, 0, 1, 1,
0.357329, 0.9881502, 1.113156, 0, 0, 0, 1, 1,
0.3602788, 0.68496, 1.019524, 0, 0, 0, 1, 1,
0.3608764, 1.81442, 2.693069, 0, 0, 0, 1, 1,
0.3641007, -1.779141, 0.8595912, 0, 0, 0, 1, 1,
0.36484, 0.001606486, 1.789472, 0, 0, 0, 1, 1,
0.3717162, 0.4299301, 2.828429, 0, 0, 0, 1, 1,
0.3735629, 0.759473, -0.8114205, 0, 0, 0, 1, 1,
0.3763236, -0.8845119, 5.289821, 1, 1, 1, 1, 1,
0.3772265, -0.4156126, 3.862024, 1, 1, 1, 1, 1,
0.3838373, 1.086736, 0.4988564, 1, 1, 1, 1, 1,
0.3855096, 0.7589204, -0.0117869, 1, 1, 1, 1, 1,
0.3916171, 0.7447808, 0.3040346, 1, 1, 1, 1, 1,
0.393217, -0.6616141, 3.929721, 1, 1, 1, 1, 1,
0.3934104, -1.357174, 2.989989, 1, 1, 1, 1, 1,
0.3941692, 0.1240316, 2.941601, 1, 1, 1, 1, 1,
0.3969383, 0.6364965, 1.16788, 1, 1, 1, 1, 1,
0.4005265, 1.146467, -0.6146861, 1, 1, 1, 1, 1,
0.4091583, -1.056658, 3.508133, 1, 1, 1, 1, 1,
0.4104351, -1.251935, 3.891674, 1, 1, 1, 1, 1,
0.4112751, -1.85583, 2.534476, 1, 1, 1, 1, 1,
0.4120433, 1.361235, -0.09295965, 1, 1, 1, 1, 1,
0.4130177, 0.6857572, 0.5761937, 1, 1, 1, 1, 1,
0.4167345, -2.15575, 2.139173, 0, 0, 1, 1, 1,
0.4237771, 1.240235, -0.3619033, 1, 0, 0, 1, 1,
0.425509, -1.231409, 4.366602, 1, 0, 0, 1, 1,
0.4271088, -0.227012, 4.032192, 1, 0, 0, 1, 1,
0.4286736, 0.1870419, 1.635758, 1, 0, 0, 1, 1,
0.4293128, -0.589834, 3.748185, 1, 0, 0, 1, 1,
0.4295993, -0.4555568, 3.379552, 0, 0, 0, 1, 1,
0.4305972, 1.702418, 0.005263038, 0, 0, 0, 1, 1,
0.4314323, 0.1785878, 1.058552, 0, 0, 0, 1, 1,
0.4353223, -1.064891, 2.634745, 0, 0, 0, 1, 1,
0.4377837, 2.099574, 1.100567, 0, 0, 0, 1, 1,
0.4515513, -1.473013, 1.874022, 0, 0, 0, 1, 1,
0.4530671, 0.8299405, 3.227026, 0, 0, 0, 1, 1,
0.4533576, 2.439382, -0.6984426, 1, 1, 1, 1, 1,
0.4551212, 0.1983591, 0.6521786, 1, 1, 1, 1, 1,
0.4553424, -1.187992, 1.958083, 1, 1, 1, 1, 1,
0.4571239, -1.898764, 4.422198, 1, 1, 1, 1, 1,
0.4660634, 0.9734474, -0.4767416, 1, 1, 1, 1, 1,
0.472067, -0.0208876, 3.831201, 1, 1, 1, 1, 1,
0.4805649, -0.7275589, 3.601856, 1, 1, 1, 1, 1,
0.4809241, 1.573963, 0.1877632, 1, 1, 1, 1, 1,
0.4810351, -0.426742, 3.440242, 1, 1, 1, 1, 1,
0.4821728, 0.3258008, 0.7681343, 1, 1, 1, 1, 1,
0.4826149, -0.2967243, 1.299981, 1, 1, 1, 1, 1,
0.4830739, -0.5352715, 2.798704, 1, 1, 1, 1, 1,
0.4881338, 0.5470345, 0.7341008, 1, 1, 1, 1, 1,
0.4889175, 1.456505, 0.01545819, 1, 1, 1, 1, 1,
0.4909874, 2.316638, 0.1131724, 1, 1, 1, 1, 1,
0.49264, -0.3451651, 2.45605, 0, 0, 1, 1, 1,
0.4948928, -0.6922284, 0.9583549, 1, 0, 0, 1, 1,
0.4955373, -1.647112, 1.880614, 1, 0, 0, 1, 1,
0.4969285, 0.1733029, 1.710629, 1, 0, 0, 1, 1,
0.5029134, -0.9412302, 2.655951, 1, 0, 0, 1, 1,
0.5071658, 1.661004, 0.3206532, 1, 0, 0, 1, 1,
0.5089896, -0.4439948, 3.20504, 0, 0, 0, 1, 1,
0.5117455, -0.3334, 2.300036, 0, 0, 0, 1, 1,
0.5154982, 0.2052042, 1.691359, 0, 0, 0, 1, 1,
0.516425, -0.9636546, 3.108255, 0, 0, 0, 1, 1,
0.5204368, -1.654462, 3.419889, 0, 0, 0, 1, 1,
0.5221689, -1.328872, 3.734275, 0, 0, 0, 1, 1,
0.5254357, -0.3665749, 3.14402, 0, 0, 0, 1, 1,
0.5260444, 0.5948101, -0.3694697, 1, 1, 1, 1, 1,
0.5289487, 1.033196, 1.323826, 1, 1, 1, 1, 1,
0.5297557, 1.119335, 2.393404, 1, 1, 1, 1, 1,
0.5300936, -0.3548577, 4.168388, 1, 1, 1, 1, 1,
0.5309747, -1.313181, 2.404628, 1, 1, 1, 1, 1,
0.5339977, -0.04433182, 1.139836, 1, 1, 1, 1, 1,
0.535565, 0.8739218, 1.85446, 1, 1, 1, 1, 1,
0.5404525, -0.3757559, 1.737846, 1, 1, 1, 1, 1,
0.5522441, 0.2758864, -0.1870683, 1, 1, 1, 1, 1,
0.556734, 1.854222, 2.019074, 1, 1, 1, 1, 1,
0.5610065, -0.8002305, 3.544916, 1, 1, 1, 1, 1,
0.5648823, 1.238166, 1.23037, 1, 1, 1, 1, 1,
0.5650008, -1.046938, 1.974062, 1, 1, 1, 1, 1,
0.5651235, 0.1919698, 1.538198, 1, 1, 1, 1, 1,
0.5656415, -1.299448, 2.718716, 1, 1, 1, 1, 1,
0.5671328, 0.157795, -0.09717207, 0, 0, 1, 1, 1,
0.5754902, 0.178387, 0.9046293, 1, 0, 0, 1, 1,
0.5772037, -1.420901, 2.98562, 1, 0, 0, 1, 1,
0.5790126, 1.387853, 0.896037, 1, 0, 0, 1, 1,
0.5804296, 1.043085, -0.1766744, 1, 0, 0, 1, 1,
0.5823249, -1.459103, 1.953261, 1, 0, 0, 1, 1,
0.5834655, -1.600728, 4.084118, 0, 0, 0, 1, 1,
0.5861191, 0.3049772, 2.115171, 0, 0, 0, 1, 1,
0.588855, 0.7578681, 2.046416, 0, 0, 0, 1, 1,
0.5911776, 0.3806957, 1.894505, 0, 0, 0, 1, 1,
0.5928007, 0.8078638, 0.1343244, 0, 0, 0, 1, 1,
0.5963109, 0.221852, 3.483557, 0, 0, 0, 1, 1,
0.598455, -0.9327273, 3.394046, 0, 0, 0, 1, 1,
0.6008582, 0.2053748, 1.799254, 1, 1, 1, 1, 1,
0.6050712, -0.2024856, 0.4909559, 1, 1, 1, 1, 1,
0.6082404, -1.374854, 3.978093, 1, 1, 1, 1, 1,
0.609292, -1.610966, 3.063478, 1, 1, 1, 1, 1,
0.6151356, -1.739026, 3.122333, 1, 1, 1, 1, 1,
0.6176697, -1.428051, 2.382943, 1, 1, 1, 1, 1,
0.6211972, -2.558741, 2.774761, 1, 1, 1, 1, 1,
0.6214259, 0.8918844, -0.1281799, 1, 1, 1, 1, 1,
0.6232756, -1.188608, 1.945817, 1, 1, 1, 1, 1,
0.6260779, 1.544543, 0.893481, 1, 1, 1, 1, 1,
0.6279663, -0.6200922, 1.190302, 1, 1, 1, 1, 1,
0.6286168, 0.3615838, 0.3660907, 1, 1, 1, 1, 1,
0.6322222, -1.450594, 2.06538, 1, 1, 1, 1, 1,
0.6348901, -0.2442734, 1.317336, 1, 1, 1, 1, 1,
0.6438366, -0.006682904, 0.01665143, 1, 1, 1, 1, 1,
0.6458756, 0.3652347, 0.9416819, 0, 0, 1, 1, 1,
0.6469157, 0.5408142, 3.503869, 1, 0, 0, 1, 1,
0.6525404, 0.2491441, 1.181866, 1, 0, 0, 1, 1,
0.653189, 1.34111, 0.4292868, 1, 0, 0, 1, 1,
0.6531932, -0.3345588, 2.325894, 1, 0, 0, 1, 1,
0.6539987, -1.86353, 1.843046, 1, 0, 0, 1, 1,
0.6563838, -1.840051, 1.464309, 0, 0, 0, 1, 1,
0.6571395, -0.1375013, 2.11841, 0, 0, 0, 1, 1,
0.6630951, -0.8745049, 2.641336, 0, 0, 0, 1, 1,
0.6665947, -0.806471, 3.955185, 0, 0, 0, 1, 1,
0.6673719, -1.728685, 2.997893, 0, 0, 0, 1, 1,
0.6789111, -0.8452714, 3.466136, 0, 0, 0, 1, 1,
0.6814362, -0.6826918, 1.804343, 0, 0, 0, 1, 1,
0.6856384, -1.03593, 2.978665, 1, 1, 1, 1, 1,
0.6881451, -0.349727, 0.1569614, 1, 1, 1, 1, 1,
0.7020889, 1.28788, 0.889432, 1, 1, 1, 1, 1,
0.7022448, 0.3962089, 2.366491, 1, 1, 1, 1, 1,
0.7028511, 0.6613038, 1.325464, 1, 1, 1, 1, 1,
0.7088574, 0.2174788, 0.08974293, 1, 1, 1, 1, 1,
0.7108165, 0.402378, 0.3437777, 1, 1, 1, 1, 1,
0.7157122, 1.279212, 2.152984, 1, 1, 1, 1, 1,
0.7171127, 2.011398, 0.5172784, 1, 1, 1, 1, 1,
0.7181026, -0.3155947, -0.226747, 1, 1, 1, 1, 1,
0.7213388, 0.8433847, -1.091275, 1, 1, 1, 1, 1,
0.7216731, 0.660276, 0.9431602, 1, 1, 1, 1, 1,
0.729748, -0.1197065, 1.708162, 1, 1, 1, 1, 1,
0.731848, 0.2768102, 1.894375, 1, 1, 1, 1, 1,
0.7339672, -0.2474758, 2.291149, 1, 1, 1, 1, 1,
0.7340546, -0.6152914, 2.61274, 0, 0, 1, 1, 1,
0.7386423, 0.5373566, 0.4558727, 1, 0, 0, 1, 1,
0.740586, 1.747836, 0.3288777, 1, 0, 0, 1, 1,
0.7458905, -0.0007193548, 0.6980824, 1, 0, 0, 1, 1,
0.7466412, 3.437742, -0.003250268, 1, 0, 0, 1, 1,
0.7472826, 0.4191758, 0.1896572, 1, 0, 0, 1, 1,
0.7477046, -2.995554, 1.786164, 0, 0, 0, 1, 1,
0.7493831, -0.1109748, 2.202844, 0, 0, 0, 1, 1,
0.7507293, -0.1549472, 0.6366467, 0, 0, 0, 1, 1,
0.7529173, -0.4753273, 3.106628, 0, 0, 0, 1, 1,
0.7553597, -0.2000031, 1.670152, 0, 0, 0, 1, 1,
0.7567564, -0.5044085, 0.5461102, 0, 0, 0, 1, 1,
0.7591413, -1.292921, 4.724573, 0, 0, 0, 1, 1,
0.7601557, 1.150666, 0.7974581, 1, 1, 1, 1, 1,
0.7616948, -0.05894329, 1.903636, 1, 1, 1, 1, 1,
0.7623934, 1.311889, 0.4576283, 1, 1, 1, 1, 1,
0.7701964, 0.1601086, 3.035201, 1, 1, 1, 1, 1,
0.7735161, 1.3016, 1.741967, 1, 1, 1, 1, 1,
0.7796673, 0.4013403, 2.19056, 1, 1, 1, 1, 1,
0.7931253, -0.4819469, 1.960259, 1, 1, 1, 1, 1,
0.796496, 1.580118, -0.7973193, 1, 1, 1, 1, 1,
0.7966098, -1.019945, 3.141056, 1, 1, 1, 1, 1,
0.7971138, 1.385956, 0.2851267, 1, 1, 1, 1, 1,
0.7988634, 0.4153673, 0.6344649, 1, 1, 1, 1, 1,
0.799291, -0.3567637, 1.294408, 1, 1, 1, 1, 1,
0.800934, -0.6049354, 2.353492, 1, 1, 1, 1, 1,
0.8025468, -0.4383967, 2.245895, 1, 1, 1, 1, 1,
0.8026859, -0.4005959, 2.488896, 1, 1, 1, 1, 1,
0.8027507, -1.324015, 1.420424, 0, 0, 1, 1, 1,
0.8042649, 1.669454, -0.6907968, 1, 0, 0, 1, 1,
0.8073621, -0.5999485, 2.802268, 1, 0, 0, 1, 1,
0.8119252, 0.9162821, 0.3518071, 1, 0, 0, 1, 1,
0.8120056, -0.1315553, 1.877117, 1, 0, 0, 1, 1,
0.8171269, -0.596393, 1.710312, 1, 0, 0, 1, 1,
0.8177642, 1.290474, 2.513032, 0, 0, 0, 1, 1,
0.8223775, 0.5643021, 1.078277, 0, 0, 0, 1, 1,
0.8281807, 0.3231606, 2.738982, 0, 0, 0, 1, 1,
0.8516375, -0.4699216, 1.622933, 0, 0, 0, 1, 1,
0.8541515, -0.608258, 1.92067, 0, 0, 0, 1, 1,
0.8544849, -0.5326258, 2.854679, 0, 0, 0, 1, 1,
0.8547176, 0.6206658, 0.649664, 0, 0, 0, 1, 1,
0.8566297, 1.141419, 0.6056039, 1, 1, 1, 1, 1,
0.8621923, -0.9901021, 1.530849, 1, 1, 1, 1, 1,
0.8633061, -1.561447, 1.359075, 1, 1, 1, 1, 1,
0.8685422, -0.007217813, 1.538841, 1, 1, 1, 1, 1,
0.8699135, 0.1731399, 1.274879, 1, 1, 1, 1, 1,
0.8708135, 1.412951, 2.40902, 1, 1, 1, 1, 1,
0.8806199, 0.3842861, 0.4129638, 1, 1, 1, 1, 1,
0.8837404, 1.097997, 0.3463825, 1, 1, 1, 1, 1,
0.8853298, 0.6355019, -0.1601177, 1, 1, 1, 1, 1,
0.8863534, 0.6167614, 1.581699, 1, 1, 1, 1, 1,
0.8913907, -1.463453, 2.456077, 1, 1, 1, 1, 1,
0.8915133, 2.017194, 0.1212366, 1, 1, 1, 1, 1,
0.8959499, -1.44922, 3.124659, 1, 1, 1, 1, 1,
0.8996004, -0.06565139, 3.482949, 1, 1, 1, 1, 1,
0.9019071, 0.08656617, 0.828531, 1, 1, 1, 1, 1,
0.9033183, -0.8132589, 2.889362, 0, 0, 1, 1, 1,
0.9042953, -1.276039, 2.984751, 1, 0, 0, 1, 1,
0.9088995, 0.735332, 1.004283, 1, 0, 0, 1, 1,
0.9130796, 0.9564294, 0.5246813, 1, 0, 0, 1, 1,
0.913623, 0.7142166, -0.3291215, 1, 0, 0, 1, 1,
0.9217554, -0.8217994, 2.231005, 1, 0, 0, 1, 1,
0.9219685, -0.1157295, -0.3289649, 0, 0, 0, 1, 1,
0.9238411, 0.5792205, 2.637119, 0, 0, 0, 1, 1,
0.9252225, -0.9999049, 2.718962, 0, 0, 0, 1, 1,
0.9446543, -0.2113849, 3.351651, 0, 0, 0, 1, 1,
0.9516394, -1.356092, 2.531786, 0, 0, 0, 1, 1,
0.9522545, -0.3209315, 1.479037, 0, 0, 0, 1, 1,
0.960786, 0.6664452, 1.411941, 0, 0, 0, 1, 1,
0.9611972, 0.02844449, 1.990663, 1, 1, 1, 1, 1,
0.9616595, -1.519935, 1.949338, 1, 1, 1, 1, 1,
0.976667, -0.5188699, 2.024025, 1, 1, 1, 1, 1,
0.9818282, -1.688776, 0.9330593, 1, 1, 1, 1, 1,
0.9941479, -0.5280663, 1.648507, 1, 1, 1, 1, 1,
1.009767, 0.8859465, -0.03095886, 1, 1, 1, 1, 1,
1.014057, 1.507717, 0.3643682, 1, 1, 1, 1, 1,
1.015498, 1.207812, 1.734918, 1, 1, 1, 1, 1,
1.01703, 1.302627, 1.979713, 1, 1, 1, 1, 1,
1.019658, -0.01085118, 0.5050874, 1, 1, 1, 1, 1,
1.021225, 1.993093, -0.04963216, 1, 1, 1, 1, 1,
1.034026, -0.1717058, 2.309843, 1, 1, 1, 1, 1,
1.035518, 0.572891, 0.05932267, 1, 1, 1, 1, 1,
1.042402, -0.2048678, 0.4695222, 1, 1, 1, 1, 1,
1.046052, -0.403815, 1.511453, 1, 1, 1, 1, 1,
1.047974, -1.250232, 1.667976, 0, 0, 1, 1, 1,
1.048634, 1.321258, 1.799369, 1, 0, 0, 1, 1,
1.061469, 0.3733132, 1.050039, 1, 0, 0, 1, 1,
1.063955, -0.3379676, 0.1413259, 1, 0, 0, 1, 1,
1.065375, -1.040974, 1.542212, 1, 0, 0, 1, 1,
1.067087, -0.7118914, 1.500242, 1, 0, 0, 1, 1,
1.069012, 0.8828177, -1.431384, 0, 0, 0, 1, 1,
1.071936, 0.7881077, 0.2361946, 0, 0, 0, 1, 1,
1.073881, 0.4134845, 1.226083, 0, 0, 0, 1, 1,
1.079919, 0.7350176, -0.03642541, 0, 0, 0, 1, 1,
1.081681, 1.277214, 1.079213, 0, 0, 0, 1, 1,
1.087191, -0.8967273, 2.171245, 0, 0, 0, 1, 1,
1.091676, 2.100098, -0.109771, 0, 0, 0, 1, 1,
1.092501, -3.232816, 2.075783, 1, 1, 1, 1, 1,
1.097964, -0.9164252, 0.9951599, 1, 1, 1, 1, 1,
1.099871, -0.4438955, 2.384904, 1, 1, 1, 1, 1,
1.102362, 0.7433919, 0.8619841, 1, 1, 1, 1, 1,
1.107859, 0.1238472, 1.543347, 1, 1, 1, 1, 1,
1.107916, -0.4551761, 3.361745, 1, 1, 1, 1, 1,
1.111383, 2.141706, 0.5218057, 1, 1, 1, 1, 1,
1.127756, 0.8253022, 0.5612852, 1, 1, 1, 1, 1,
1.133737, -0.9392847, 1.624227, 1, 1, 1, 1, 1,
1.139061, -0.9433767, 3.266738, 1, 1, 1, 1, 1,
1.142485, 0.9205992, 0.5423294, 1, 1, 1, 1, 1,
1.144236, 0.3828395, 2.543018, 1, 1, 1, 1, 1,
1.14543, 0.318842, 1.433323, 1, 1, 1, 1, 1,
1.147227, -1.281087, 2.059408, 1, 1, 1, 1, 1,
1.151754, -0.9983539, 1.890725, 1, 1, 1, 1, 1,
1.157113, -0.7100329, 2.679132, 0, 0, 1, 1, 1,
1.161935, 1.513589, 1.138478, 1, 0, 0, 1, 1,
1.168783, -0.2253121, 2.952805, 1, 0, 0, 1, 1,
1.174616, 0.1960241, 2.885287, 1, 0, 0, 1, 1,
1.177835, 0.1320421, 1.435493, 1, 0, 0, 1, 1,
1.18439, 1.134683, -1.278825, 1, 0, 0, 1, 1,
1.185148, -0.9066125, 1.185714, 0, 0, 0, 1, 1,
1.185371, 2.496496, 1.698294, 0, 0, 0, 1, 1,
1.195309, -0.4135517, 2.736777, 0, 0, 0, 1, 1,
1.19622, 0.4176858, -1.570096, 0, 0, 0, 1, 1,
1.200196, 0.05882226, 2.767364, 0, 0, 0, 1, 1,
1.202271, -1.091747, 2.68373, 0, 0, 0, 1, 1,
1.202599, -0.3661331, 0.5378626, 0, 0, 0, 1, 1,
1.20267, -0.709785, 2.712976, 1, 1, 1, 1, 1,
1.204929, -1.403501, 2.600463, 1, 1, 1, 1, 1,
1.206908, 0.1986263, 0.07196281, 1, 1, 1, 1, 1,
1.219482, -1.717843, 3.214308, 1, 1, 1, 1, 1,
1.233873, 0.5053462, 2.336232, 1, 1, 1, 1, 1,
1.240317, -0.7497079, 1.740535, 1, 1, 1, 1, 1,
1.247551, -2.275469, 2.475301, 1, 1, 1, 1, 1,
1.247952, 0.6087057, 2.434005, 1, 1, 1, 1, 1,
1.249912, -0.5934731, 2.228097, 1, 1, 1, 1, 1,
1.250035, 1.226177, 0.6161057, 1, 1, 1, 1, 1,
1.265626, -3.597058, 0.7453557, 1, 1, 1, 1, 1,
1.275592, -1.202872, 2.661993, 1, 1, 1, 1, 1,
1.276616, -0.5290419, 2.575572, 1, 1, 1, 1, 1,
1.28255, 0.1887234, 0.7998322, 1, 1, 1, 1, 1,
1.283663, 0.1662991, 2.145369, 1, 1, 1, 1, 1,
1.28434, -0.1623667, 2.028932, 0, 0, 1, 1, 1,
1.297696, -0.440607, 1.797806, 1, 0, 0, 1, 1,
1.307764, -0.2791558, 1.117849, 1, 0, 0, 1, 1,
1.311683, -0.2283321, 1.709973, 1, 0, 0, 1, 1,
1.317258, -1.47729, 2.169068, 1, 0, 0, 1, 1,
1.319927, 1.024949, -0.156167, 1, 0, 0, 1, 1,
1.326841, -0.2386264, 2.1397, 0, 0, 0, 1, 1,
1.331222, 0.5663822, 0.306251, 0, 0, 0, 1, 1,
1.331715, -0.3422423, 1.699403, 0, 0, 0, 1, 1,
1.342795, 0.3435056, 0.8706698, 0, 0, 0, 1, 1,
1.348768, -1.48289, 2.583091, 0, 0, 0, 1, 1,
1.350292, 0.1568958, 1.546984, 0, 0, 0, 1, 1,
1.356957, -0.4186659, 1.787877, 0, 0, 0, 1, 1,
1.357491, 1.295428, -0.479146, 1, 1, 1, 1, 1,
1.373108, 0.1552524, 2.294056, 1, 1, 1, 1, 1,
1.376796, 1.467098, 3.3371, 1, 1, 1, 1, 1,
1.387069, -0.6765441, 3.107949, 1, 1, 1, 1, 1,
1.388506, 0.2863798, 1.867427, 1, 1, 1, 1, 1,
1.391798, -1.325001, 1.596117, 1, 1, 1, 1, 1,
1.393729, 0.2822142, 1.838757, 1, 1, 1, 1, 1,
1.397203, 1.600859, 1.420088, 1, 1, 1, 1, 1,
1.399528, 1.388708, 1.115286, 1, 1, 1, 1, 1,
1.406026, 0.2248029, 2.297496, 1, 1, 1, 1, 1,
1.40623, -0.5879918, -0.004224909, 1, 1, 1, 1, 1,
1.423609, 1.19957, -0.2360395, 1, 1, 1, 1, 1,
1.425686, 0.07086275, 3.232089, 1, 1, 1, 1, 1,
1.433168, -0.08895843, 2.964259, 1, 1, 1, 1, 1,
1.43888, 0.5916858, 0.5864289, 1, 1, 1, 1, 1,
1.449066, -3.82933, 3.902086, 0, 0, 1, 1, 1,
1.452786, -0.7698034, -0.5402891, 1, 0, 0, 1, 1,
1.454422, -0.4287871, 2.985695, 1, 0, 0, 1, 1,
1.474906, 0.4696778, -0.4925925, 1, 0, 0, 1, 1,
1.475235, -1.57676, 3.126391, 1, 0, 0, 1, 1,
1.479056, 1.86801, 1.212055, 1, 0, 0, 1, 1,
1.495293, -1.125161, 0.9318551, 0, 0, 0, 1, 1,
1.497096, -0.7505229, 1.499539, 0, 0, 0, 1, 1,
1.504024, 0.46434, 2.360371, 0, 0, 0, 1, 1,
1.509434, -0.5081376, 3.645071, 0, 0, 0, 1, 1,
1.510832, 0.7558764, 3.268678, 0, 0, 0, 1, 1,
1.514908, -0.3330689, 2.289516, 0, 0, 0, 1, 1,
1.517158, 0.5347608, 2.162277, 0, 0, 0, 1, 1,
1.521482, 0.3970036, 1.32904, 1, 1, 1, 1, 1,
1.532949, -0.8654641, 2.853437, 1, 1, 1, 1, 1,
1.532999, -1.135288, 2.493349, 1, 1, 1, 1, 1,
1.539033, 0.02427657, 1.553575, 1, 1, 1, 1, 1,
1.541754, -0.6795769, 2.58713, 1, 1, 1, 1, 1,
1.543164, 0.4218667, 0.7524425, 1, 1, 1, 1, 1,
1.546557, -1.752533, 3.902928, 1, 1, 1, 1, 1,
1.554099, -0.2017814, 3.297935, 1, 1, 1, 1, 1,
1.559095, -0.1417636, 0.3031155, 1, 1, 1, 1, 1,
1.561932, 1.313346, -0.5815673, 1, 1, 1, 1, 1,
1.562, -0.5786832, 2.233655, 1, 1, 1, 1, 1,
1.57381, 1.263914, 2.827215, 1, 1, 1, 1, 1,
1.586428, -1.242191, 2.411037, 1, 1, 1, 1, 1,
1.592704, 0.0857559, 1.644489, 1, 1, 1, 1, 1,
1.594458, 1.834807, 0.2125766, 1, 1, 1, 1, 1,
1.643363, -1.806106, 1.146271, 0, 0, 1, 1, 1,
1.654134, -1.766201, 1.992595, 1, 0, 0, 1, 1,
1.707073, -0.3183305, 1.800064, 1, 0, 0, 1, 1,
1.717849, 1.51545, -1.331908, 1, 0, 0, 1, 1,
1.729855, 2.269254, 2.16659, 1, 0, 0, 1, 1,
1.73071, -0.460439, 1.636076, 1, 0, 0, 1, 1,
1.752455, -0.3532238, 2.499579, 0, 0, 0, 1, 1,
1.753648, -0.8552881, 3.772947, 0, 0, 0, 1, 1,
1.770568, 0.08527286, 2.236606, 0, 0, 0, 1, 1,
1.774397, -0.002155135, 2.217793, 0, 0, 0, 1, 1,
1.782534, 0.5496231, 0.7774479, 0, 0, 0, 1, 1,
1.784691, 1.851021, 0.5609745, 0, 0, 0, 1, 1,
1.825194, -0.4541931, 0.09007332, 0, 0, 0, 1, 1,
1.835835, -0.1138068, 1.628023, 1, 1, 1, 1, 1,
1.854555, 0.5274227, 1.192852, 1, 1, 1, 1, 1,
1.872794, -1.169214, 1.412612, 1, 1, 1, 1, 1,
1.89106, -0.8437168, 2.936277, 1, 1, 1, 1, 1,
1.900853, -0.1857851, -0.6068965, 1, 1, 1, 1, 1,
1.904641, 0.6312588, 0.2645205, 1, 1, 1, 1, 1,
1.922256, 0.8032635, 0.8004626, 1, 1, 1, 1, 1,
1.935515, -0.4392585, 1.681211, 1, 1, 1, 1, 1,
1.977751, 0.3770837, 2.261852, 1, 1, 1, 1, 1,
1.989449, 1.975475, 0.9662895, 1, 1, 1, 1, 1,
2.001683, 1.945596, 1.147609, 1, 1, 1, 1, 1,
2.009995, 0.5454794, 1.024913, 1, 1, 1, 1, 1,
2.025341, -0.6833639, 0.08317079, 1, 1, 1, 1, 1,
2.061361, 0.01500558, -0.4999906, 1, 1, 1, 1, 1,
2.080438, 0.7141111, 1.717072, 1, 1, 1, 1, 1,
2.092128, -1.279667, 1.820115, 0, 0, 1, 1, 1,
2.109421, 0.7598649, 1.096237, 1, 0, 0, 1, 1,
2.113528, -0.1822354, 2.028307, 1, 0, 0, 1, 1,
2.142756, -1.805822, 0.583841, 1, 0, 0, 1, 1,
2.153, 0.2267745, 2.888165, 1, 0, 0, 1, 1,
2.221487, 1.147618, 1.384282, 1, 0, 0, 1, 1,
2.222195, 0.2833208, 0.6445017, 0, 0, 0, 1, 1,
2.241595, -1.738276, 2.664514, 0, 0, 0, 1, 1,
2.250325, 1.120307, 0.5842025, 0, 0, 0, 1, 1,
2.258489, -0.4179415, 0.1292677, 0, 0, 0, 1, 1,
2.31698, 0.08969028, 1.802578, 0, 0, 0, 1, 1,
2.412084, 1.435842, 1.502884, 0, 0, 0, 1, 1,
2.414284, 1.326849, 2.710839, 0, 0, 0, 1, 1,
2.444188, 2.639493, 1.099843, 1, 1, 1, 1, 1,
2.498648, 0.1719897, 2.447397, 1, 1, 1, 1, 1,
2.580253, 0.9427328, 0.8534825, 1, 1, 1, 1, 1,
2.652391, 1.152232, -1.159737, 1, 1, 1, 1, 1,
2.769143, 0.480363, 1.80467, 1, 1, 1, 1, 1,
2.78563, 1.415676, 0.2453644, 1, 1, 1, 1, 1,
3.420938, -1.783309, 1.293074, 1, 1, 1, 1, 1
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
var radius = 9.868842;
var distance = 34.66389;
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
mvMatrix.translate( -0.09826851, 0.1957941, -0.01559091 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66389);
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
