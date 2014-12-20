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
-3.147054, -1.576417, -1.894609, 1, 0, 0, 1,
-2.731769, -1.013993, -2.796109, 1, 0.007843138, 0, 1,
-2.600837, 0.5145113, -1.50641, 1, 0.01176471, 0, 1,
-2.426566, 1.203228, -2.907136, 1, 0.01960784, 0, 1,
-2.403867, 1.407484, -0.8182194, 1, 0.02352941, 0, 1,
-2.399382, 0.7486933, -1.131493, 1, 0.03137255, 0, 1,
-2.38977, 1.450539, -1.340431, 1, 0.03529412, 0, 1,
-2.29487, -0.6409063, -1.810241, 1, 0.04313726, 0, 1,
-2.290318, -1.537825, -1.645334, 1, 0.04705882, 0, 1,
-2.277873, -0.2563002, -2.428537, 1, 0.05490196, 0, 1,
-2.276028, -0.882795, -0.7672543, 1, 0.05882353, 0, 1,
-2.2572, -0.1140066, -2.446088, 1, 0.06666667, 0, 1,
-2.191511, -0.2642692, -1.155076, 1, 0.07058824, 0, 1,
-2.160874, -1.399432, -2.920208, 1, 0.07843138, 0, 1,
-2.147696, 0.004018582, -3.538129, 1, 0.08235294, 0, 1,
-2.024788, -0.6166614, -1.659538, 1, 0.09019608, 0, 1,
-2.024208, 1.200107, -0.3492742, 1, 0.09411765, 0, 1,
-1.991262, 1.117048, -1.466079, 1, 0.1019608, 0, 1,
-1.986683, 0.828072, -0.6219913, 1, 0.1098039, 0, 1,
-1.973171, -1.350371, -1.445906, 1, 0.1137255, 0, 1,
-1.947517, -0.7142668, -2.287512, 1, 0.1215686, 0, 1,
-1.931858, -0.9800277, -1.167074, 1, 0.1254902, 0, 1,
-1.911545, 0.4260018, -1.545535, 1, 0.1333333, 0, 1,
-1.906262, 0.7067778, -0.4095323, 1, 0.1372549, 0, 1,
-1.905063, 0.676026, -0.4152667, 1, 0.145098, 0, 1,
-1.8788, 0.01029523, -1.668808, 1, 0.1490196, 0, 1,
-1.867097, 1.169204, -1.540448, 1, 0.1568628, 0, 1,
-1.857267, 0.004519414, -2.668421, 1, 0.1607843, 0, 1,
-1.855954, 0.9129196, -0.4782415, 1, 0.1686275, 0, 1,
-1.841728, -0.4845095, -2.799431, 1, 0.172549, 0, 1,
-1.837103, 1.574973, -0.5432066, 1, 0.1803922, 0, 1,
-1.831689, 0.4646772, -0.8559363, 1, 0.1843137, 0, 1,
-1.811583, -0.7874632, -1.926043, 1, 0.1921569, 0, 1,
-1.810844, -0.528318, -1.266469, 1, 0.1960784, 0, 1,
-1.810602, -1.503772, -2.977277, 1, 0.2039216, 0, 1,
-1.768852, 1.4052, -0.8648588, 1, 0.2117647, 0, 1,
-1.744182, -0.301789, -1.107279, 1, 0.2156863, 0, 1,
-1.737805, -0.2694343, -1.845243, 1, 0.2235294, 0, 1,
-1.717321, -0.3055358, -1.479511, 1, 0.227451, 0, 1,
-1.7077, -0.5581466, -3.313123, 1, 0.2352941, 0, 1,
-1.701457, 0.6315126, -3.13149, 1, 0.2392157, 0, 1,
-1.677882, 0.7281032, -1.489822, 1, 0.2470588, 0, 1,
-1.677565, -0.185775, -1.416854, 1, 0.2509804, 0, 1,
-1.658064, 1.529422, 0.3231344, 1, 0.2588235, 0, 1,
-1.657861, 0.7509373, -1.620855, 1, 0.2627451, 0, 1,
-1.650496, 1.67163, -0.5516059, 1, 0.2705882, 0, 1,
-1.648871, -0.9868671, -1.729584, 1, 0.2745098, 0, 1,
-1.638703, -0.4411426, -1.920662, 1, 0.282353, 0, 1,
-1.622107, 0.5759858, -0.375989, 1, 0.2862745, 0, 1,
-1.614283, -0.4688363, -1.421796, 1, 0.2941177, 0, 1,
-1.606477, -0.195687, -1.259283, 1, 0.3019608, 0, 1,
-1.603993, 0.3373373, -2.691298, 1, 0.3058824, 0, 1,
-1.597762, -0.7498738, -1.336698, 1, 0.3137255, 0, 1,
-1.589875, -0.3163856, -1.150217, 1, 0.3176471, 0, 1,
-1.580955, 0.6707704, -1.237887, 1, 0.3254902, 0, 1,
-1.569399, 0.4945893, -1.666817, 1, 0.3294118, 0, 1,
-1.568825, 0.7736353, -0.0555213, 1, 0.3372549, 0, 1,
-1.565076, 1.347093, -0.6564731, 1, 0.3411765, 0, 1,
-1.553837, 0.8024262, -1.577757, 1, 0.3490196, 0, 1,
-1.553401, -0.9327159, -3.489374, 1, 0.3529412, 0, 1,
-1.550644, 0.593972, -2.153018, 1, 0.3607843, 0, 1,
-1.547697, -0.7365242, -1.448827, 1, 0.3647059, 0, 1,
-1.543963, 0.210819, -2.630371, 1, 0.372549, 0, 1,
-1.525701, -0.03770202, -2.723513, 1, 0.3764706, 0, 1,
-1.499986, -2.392603, -1.663037, 1, 0.3843137, 0, 1,
-1.489874, -0.6922151, -1.929863, 1, 0.3882353, 0, 1,
-1.487905, -0.04400485, -2.125504, 1, 0.3960784, 0, 1,
-1.486143, 1.126013, -0.5918095, 1, 0.4039216, 0, 1,
-1.484847, 0.3912338, -2.841097, 1, 0.4078431, 0, 1,
-1.480341, -0.1518125, -1.199431, 1, 0.4156863, 0, 1,
-1.475717, -2.011385, -3.310376, 1, 0.4196078, 0, 1,
-1.455148, 0.3944403, -1.298285, 1, 0.427451, 0, 1,
-1.452123, -0.7410581, -1.373942, 1, 0.4313726, 0, 1,
-1.433652, 0.1334517, -1.727497, 1, 0.4392157, 0, 1,
-1.431305, 1.074253, -0.5822321, 1, 0.4431373, 0, 1,
-1.425964, -0.8795682, -2.287528, 1, 0.4509804, 0, 1,
-1.417997, -1.242205, -2.526317, 1, 0.454902, 0, 1,
-1.41743, -1.11564, -1.928067, 1, 0.4627451, 0, 1,
-1.413787, 1.670896, -0.7813492, 1, 0.4666667, 0, 1,
-1.405198, -1.620249, -2.517128, 1, 0.4745098, 0, 1,
-1.398462, -2.654694, -0.998494, 1, 0.4784314, 0, 1,
-1.396832, -0.7355695, -2.551013, 1, 0.4862745, 0, 1,
-1.390283, -1.332802, -1.466082, 1, 0.4901961, 0, 1,
-1.387514, 0.2221594, -0.6765493, 1, 0.4980392, 0, 1,
-1.385525, 0.2828507, -0.884791, 1, 0.5058824, 0, 1,
-1.371836, -0.9607995, -0.5966634, 1, 0.509804, 0, 1,
-1.364882, 1.407937, -0.6045892, 1, 0.5176471, 0, 1,
-1.364647, -0.8762723, -2.759834, 1, 0.5215687, 0, 1,
-1.355971, 0.7975326, -0.5396443, 1, 0.5294118, 0, 1,
-1.351924, 0.5454872, -0.3746082, 1, 0.5333334, 0, 1,
-1.346935, -0.1048028, -1.931842, 1, 0.5411765, 0, 1,
-1.346378, 0.2108861, 0.3884983, 1, 0.5450981, 0, 1,
-1.342807, -0.3248568, -0.4916033, 1, 0.5529412, 0, 1,
-1.335503, 0.3519943, -1.745965, 1, 0.5568628, 0, 1,
-1.325245, 0.6343881, -1.786972, 1, 0.5647059, 0, 1,
-1.316148, 1.187708, -0.8046325, 1, 0.5686275, 0, 1,
-1.309312, 1.899901, 1.175418, 1, 0.5764706, 0, 1,
-1.302248, 0.04139607, -2.317257, 1, 0.5803922, 0, 1,
-1.296069, -0.3571507, -3.178917, 1, 0.5882353, 0, 1,
-1.289932, 0.105397, -2.63615, 1, 0.5921569, 0, 1,
-1.267498, 1.62373, 0.313539, 1, 0.6, 0, 1,
-1.265609, 1.997651, -2.123699, 1, 0.6078432, 0, 1,
-1.258276, -0.5884944, -2.319176, 1, 0.6117647, 0, 1,
-1.251267, -1.078834, -2.742895, 1, 0.6196079, 0, 1,
-1.247358, 0.2872096, 0.2250259, 1, 0.6235294, 0, 1,
-1.24524, -0.8377288, -0.04343821, 1, 0.6313726, 0, 1,
-1.241751, 0.8504552, -1.610578, 1, 0.6352941, 0, 1,
-1.22938, -0.8674657, -4.842915, 1, 0.6431373, 0, 1,
-1.226672, -0.8230068, -0.0446068, 1, 0.6470588, 0, 1,
-1.219799, -0.8551677, -2.117763, 1, 0.654902, 0, 1,
-1.219094, -0.9789827, -1.295874, 1, 0.6588235, 0, 1,
-1.21344, -1.333746, -1.390539, 1, 0.6666667, 0, 1,
-1.205423, -1.713917, -4.009569, 1, 0.6705883, 0, 1,
-1.200794, 0.1336267, -0.4816689, 1, 0.6784314, 0, 1,
-1.196603, 0.1698708, -1.201952, 1, 0.682353, 0, 1,
-1.191362, -0.2333937, -2.515673, 1, 0.6901961, 0, 1,
-1.189891, 1.531761, 1.210922, 1, 0.6941177, 0, 1,
-1.182156, 0.4078276, -2.401936, 1, 0.7019608, 0, 1,
-1.180085, -1.401553, -1.7606, 1, 0.7098039, 0, 1,
-1.158088, 0.3800552, 0.9299492, 1, 0.7137255, 0, 1,
-1.15097, 0.4096214, -3.021119, 1, 0.7215686, 0, 1,
-1.143131, 0.421876, -1.746265, 1, 0.7254902, 0, 1,
-1.142399, -0.327565, -2.373235, 1, 0.7333333, 0, 1,
-1.130357, -1.309634, -2.522779, 1, 0.7372549, 0, 1,
-1.120743, 0.6011536, 0.2387918, 1, 0.7450981, 0, 1,
-1.114666, -0.1768504, -2.495042, 1, 0.7490196, 0, 1,
-1.114432, -0.2786726, -2.840645, 1, 0.7568628, 0, 1,
-1.112042, 0.2293142, -3.55985, 1, 0.7607843, 0, 1,
-1.104137, -0.1998264, -3.533804, 1, 0.7686275, 0, 1,
-1.09877, -1.112925, -1.297756, 1, 0.772549, 0, 1,
-1.093703, -2.411083, -3.612846, 1, 0.7803922, 0, 1,
-1.077939, 1.329066, 1.737815, 1, 0.7843137, 0, 1,
-1.074296, -1.491682, -2.631824, 1, 0.7921569, 0, 1,
-1.069658, 0.6455683, -1.211768, 1, 0.7960784, 0, 1,
-1.064968, 1.119785, 0.4241769, 1, 0.8039216, 0, 1,
-1.054603, -2.103278, -2.802762, 1, 0.8117647, 0, 1,
-1.04274, -0.7356672, -4.062108, 1, 0.8156863, 0, 1,
-1.042344, 0.03912843, -1.353507, 1, 0.8235294, 0, 1,
-1.038368, 1.639137, -1.271765, 1, 0.827451, 0, 1,
-1.035668, -0.4888001, -2.299441, 1, 0.8352941, 0, 1,
-1.034558, 0.5021258, 0.06571686, 1, 0.8392157, 0, 1,
-1.029702, -0.9496117, -2.204303, 1, 0.8470588, 0, 1,
-1.025102, -0.2310246, -0.645323, 1, 0.8509804, 0, 1,
-1.023351, -0.167881, -2.485415, 1, 0.8588235, 0, 1,
-1.020457, -0.07209969, -1.714794, 1, 0.8627451, 0, 1,
-1.017735, 0.08152805, -1.709474, 1, 0.8705882, 0, 1,
-1.010041, 0.1497004, -0.9301919, 1, 0.8745098, 0, 1,
-1.005073, -1.511272, -4.618605, 1, 0.8823529, 0, 1,
-1.004767, 0.6943783, -2.769167, 1, 0.8862745, 0, 1,
-0.9990341, 0.6229334, -1.744556, 1, 0.8941177, 0, 1,
-0.9888991, 0.4713624, -0.08169182, 1, 0.8980392, 0, 1,
-0.9843079, 0.3876334, -1.33936, 1, 0.9058824, 0, 1,
-0.9809436, 0.9662789, 0.2040296, 1, 0.9137255, 0, 1,
-0.9772021, 0.3856898, -0.3520527, 1, 0.9176471, 0, 1,
-0.9749975, 0.02525156, -2.653936, 1, 0.9254902, 0, 1,
-0.9740874, -0.7586229, -2.425358, 1, 0.9294118, 0, 1,
-0.9618279, 0.5460232, -0.4661088, 1, 0.9372549, 0, 1,
-0.96109, -0.4552298, -2.820958, 1, 0.9411765, 0, 1,
-0.9591764, -1.912818, -1.806714, 1, 0.9490196, 0, 1,
-0.9547644, 0.184376, -1.793948, 1, 0.9529412, 0, 1,
-0.9494197, -0.5001858, -0.7637115, 1, 0.9607843, 0, 1,
-0.9418718, 1.798613, -0.3921416, 1, 0.9647059, 0, 1,
-0.9405802, -0.2428837, -2.44514, 1, 0.972549, 0, 1,
-0.9270405, 0.2651348, -1.812166, 1, 0.9764706, 0, 1,
-0.9215617, -0.1014224, -2.316589, 1, 0.9843137, 0, 1,
-0.9137947, -0.5040588, -1.491428, 1, 0.9882353, 0, 1,
-0.9095842, 1.328297, 1.21226, 1, 0.9960784, 0, 1,
-0.9095206, -0.1886029, -1.018376, 0.9960784, 1, 0, 1,
-0.9049522, 0.6285059, -0.3222952, 0.9921569, 1, 0, 1,
-0.9027882, -0.8819848, -3.083755, 0.9843137, 1, 0, 1,
-0.9006665, 0.04379985, -2.127825, 0.9803922, 1, 0, 1,
-0.8919746, 0.06290234, -0.1240047, 0.972549, 1, 0, 1,
-0.8917758, -1.018241, -1.725538, 0.9686275, 1, 0, 1,
-0.8914189, 0.4533136, -0.2904467, 0.9607843, 1, 0, 1,
-0.891284, -0.1153003, -0.9808237, 0.9568627, 1, 0, 1,
-0.8805206, 1.300688, 0.2873166, 0.9490196, 1, 0, 1,
-0.8761671, 0.1851379, 0.7538491, 0.945098, 1, 0, 1,
-0.8746158, 0.2191406, -2.95575, 0.9372549, 1, 0, 1,
-0.8745188, -0.05149843, -2.293665, 0.9333333, 1, 0, 1,
-0.8736082, -0.8838466, -2.330547, 0.9254902, 1, 0, 1,
-0.8733053, -0.6607681, -2.359099, 0.9215686, 1, 0, 1,
-0.8688734, 1.125645, -0.5582145, 0.9137255, 1, 0, 1,
-0.8678569, -0.93362, 0.320784, 0.9098039, 1, 0, 1,
-0.8627629, -0.02935189, -2.071332, 0.9019608, 1, 0, 1,
-0.8576207, -2.359647, -4.107374, 0.8941177, 1, 0, 1,
-0.853462, 1.31251, 1.572368, 0.8901961, 1, 0, 1,
-0.8529124, 0.185951, -2.265684, 0.8823529, 1, 0, 1,
-0.8511852, -0.1722558, -1.284347, 0.8784314, 1, 0, 1,
-0.8496318, 0.1236148, -1.623024, 0.8705882, 1, 0, 1,
-0.833778, 0.3520035, -1.948405, 0.8666667, 1, 0, 1,
-0.8328341, -1.543616, -3.556895, 0.8588235, 1, 0, 1,
-0.8271117, 0.8271964, 0.005430398, 0.854902, 1, 0, 1,
-0.8257508, -1.036762, -2.19929, 0.8470588, 1, 0, 1,
-0.8161322, -2.061134, -4.952873, 0.8431373, 1, 0, 1,
-0.8065029, 0.2784888, -2.466401, 0.8352941, 1, 0, 1,
-0.7989969, 0.2440517, -1.140532, 0.8313726, 1, 0, 1,
-0.7970282, -1.825735, -3.367228, 0.8235294, 1, 0, 1,
-0.796635, 1.000351, -0.7125736, 0.8196079, 1, 0, 1,
-0.7880653, -1.674851, -1.394214, 0.8117647, 1, 0, 1,
-0.7869685, 0.7816765, -1.62982, 0.8078431, 1, 0, 1,
-0.783517, 1.206867, 0.3812745, 0.8, 1, 0, 1,
-0.7692422, -1.044652, -2.535645, 0.7921569, 1, 0, 1,
-0.7668993, 1.487328, 0.9329302, 0.7882353, 1, 0, 1,
-0.7655902, -0.4528438, -2.524513, 0.7803922, 1, 0, 1,
-0.7581382, 0.04398662, -1.579916, 0.7764706, 1, 0, 1,
-0.745946, 0.5580221, -2.493224, 0.7686275, 1, 0, 1,
-0.7458543, -1.769826, -2.989774, 0.7647059, 1, 0, 1,
-0.745698, -0.5838477, -1.664367, 0.7568628, 1, 0, 1,
-0.7439732, 0.2249297, -1.205977, 0.7529412, 1, 0, 1,
-0.7410566, 1.236279, 0.3174246, 0.7450981, 1, 0, 1,
-0.7391823, -0.7710251, -0.9511235, 0.7411765, 1, 0, 1,
-0.7371619, -0.3025573, -0.57507, 0.7333333, 1, 0, 1,
-0.730947, 0.5343571, -0.2865424, 0.7294118, 1, 0, 1,
-0.7256487, 1.023678, -1.299755, 0.7215686, 1, 0, 1,
-0.7245551, -1.004801, -1.319772, 0.7176471, 1, 0, 1,
-0.7229484, 0.0478033, -2.003979, 0.7098039, 1, 0, 1,
-0.7223284, -0.3409433, -1.999408, 0.7058824, 1, 0, 1,
-0.7126298, 0.1588184, -1.143881, 0.6980392, 1, 0, 1,
-0.7105224, -2.04525, -2.919057, 0.6901961, 1, 0, 1,
-0.7103138, 0.5603366, -2.165246, 0.6862745, 1, 0, 1,
-0.7102398, 0.3529715, -1.732591, 0.6784314, 1, 0, 1,
-0.7064444, 1.728755, 0.005003377, 0.6745098, 1, 0, 1,
-0.7061804, 1.1474, 0.09872978, 0.6666667, 1, 0, 1,
-0.702271, 0.2039788, -2.639342, 0.6627451, 1, 0, 1,
-0.6959007, -0.8137104, -2.744241, 0.654902, 1, 0, 1,
-0.6932356, 0.4036945, -2.101428, 0.6509804, 1, 0, 1,
-0.692709, -0.04335483, -1.170295, 0.6431373, 1, 0, 1,
-0.6918588, 1.851959, 2.384402, 0.6392157, 1, 0, 1,
-0.6905462, -0.6166572, -4.367362, 0.6313726, 1, 0, 1,
-0.6903364, -0.275192, -1.306111, 0.627451, 1, 0, 1,
-0.6902804, -1.272691, -1.375375, 0.6196079, 1, 0, 1,
-0.6843998, -1.372175, -3.005544, 0.6156863, 1, 0, 1,
-0.677826, 2.083613, -0.4572816, 0.6078432, 1, 0, 1,
-0.677038, -1.772246, -4.937519, 0.6039216, 1, 0, 1,
-0.6756133, -0.8617799, -0.8460219, 0.5960785, 1, 0, 1,
-0.6704638, 0.06167735, -0.7411929, 0.5882353, 1, 0, 1,
-0.6679405, 0.0362431, -1.728239, 0.5843138, 1, 0, 1,
-0.6670256, 2.046773, -1.120157, 0.5764706, 1, 0, 1,
-0.6653566, 0.5649381, -1.637707, 0.572549, 1, 0, 1,
-0.6646395, -1.669966, -2.764191, 0.5647059, 1, 0, 1,
-0.6592834, -0.3865967, -2.207567, 0.5607843, 1, 0, 1,
-0.6578509, -2.490303, -3.749849, 0.5529412, 1, 0, 1,
-0.6534066, -0.507099, -1.114996, 0.5490196, 1, 0, 1,
-0.6524388, -0.3747025, 0.41758, 0.5411765, 1, 0, 1,
-0.649385, -0.1037989, -1.024988, 0.5372549, 1, 0, 1,
-0.6491392, -0.04593784, -0.5286331, 0.5294118, 1, 0, 1,
-0.6467528, -0.2057509, -4.246843, 0.5254902, 1, 0, 1,
-0.6446459, -0.7196941, -2.407181, 0.5176471, 1, 0, 1,
-0.6436456, -0.8311227, -1.237797, 0.5137255, 1, 0, 1,
-0.6401278, 1.170373, -0.6320652, 0.5058824, 1, 0, 1,
-0.6300026, -1.26753, -2.810432, 0.5019608, 1, 0, 1,
-0.6298036, 1.354788, -0.6330568, 0.4941176, 1, 0, 1,
-0.6292183, -0.7511421, -1.784988, 0.4862745, 1, 0, 1,
-0.6242416, 0.450109, 0.4446634, 0.4823529, 1, 0, 1,
-0.6228083, -0.2451914, -2.175006, 0.4745098, 1, 0, 1,
-0.6226614, -0.06929749, -1.455389, 0.4705882, 1, 0, 1,
-0.6204847, -0.1248682, -1.541716, 0.4627451, 1, 0, 1,
-0.620038, -1.537532, -2.452637, 0.4588235, 1, 0, 1,
-0.6064267, -0.6640897, -3.184134, 0.4509804, 1, 0, 1,
-0.604884, 0.8022585, -0.9617269, 0.4470588, 1, 0, 1,
-0.6026886, 0.09264732, -0.7777572, 0.4392157, 1, 0, 1,
-0.6020378, -2.723213, -2.116704, 0.4352941, 1, 0, 1,
-0.6001893, -0.1268778, -1.390773, 0.427451, 1, 0, 1,
-0.5996266, 0.1135307, -2.459104, 0.4235294, 1, 0, 1,
-0.5921227, -0.6840841, -1.547019, 0.4156863, 1, 0, 1,
-0.5866112, -0.8069991, -3.642865, 0.4117647, 1, 0, 1,
-0.5826142, 0.879559, -0.1971822, 0.4039216, 1, 0, 1,
-0.5799696, -0.4386526, -2.942556, 0.3960784, 1, 0, 1,
-0.5733191, -1.303305, -3.441776, 0.3921569, 1, 0, 1,
-0.5732464, -0.3371485, -1.803571, 0.3843137, 1, 0, 1,
-0.5726485, -0.9455343, -2.853202, 0.3803922, 1, 0, 1,
-0.5683978, 0.2669601, -1.731048, 0.372549, 1, 0, 1,
-0.5617332, 0.08599875, -2.504349, 0.3686275, 1, 0, 1,
-0.5520672, 0.6308036, -0.5932574, 0.3607843, 1, 0, 1,
-0.5512892, 0.2696039, -1.678708, 0.3568628, 1, 0, 1,
-0.5512237, 1.210542, -0.7558237, 0.3490196, 1, 0, 1,
-0.5462506, 1.103346, 0.142108, 0.345098, 1, 0, 1,
-0.5458643, -1.026557, -1.914498, 0.3372549, 1, 0, 1,
-0.5405225, -1.628237, -2.123427, 0.3333333, 1, 0, 1,
-0.5400208, 1.217484, -1.168503, 0.3254902, 1, 0, 1,
-0.5380177, 0.3434352, -1.791076, 0.3215686, 1, 0, 1,
-0.5351325, -0.7880741, -2.773425, 0.3137255, 1, 0, 1,
-0.5303137, 0.2020186, -0.6552917, 0.3098039, 1, 0, 1,
-0.5302818, 0.6625657, -2.657082, 0.3019608, 1, 0, 1,
-0.5283867, 0.1298053, -1.321756, 0.2941177, 1, 0, 1,
-0.52711, 0.7387804, -2.001991, 0.2901961, 1, 0, 1,
-0.5251427, 0.855197, 0.5131148, 0.282353, 1, 0, 1,
-0.5218689, -0.8554772, -3.15119, 0.2784314, 1, 0, 1,
-0.512953, 0.531656, -1.426775, 0.2705882, 1, 0, 1,
-0.5076097, 0.03847892, -1.256123, 0.2666667, 1, 0, 1,
-0.506749, 0.9202122, -0.2231944, 0.2588235, 1, 0, 1,
-0.4986118, 1.424541, 0.4410088, 0.254902, 1, 0, 1,
-0.4967721, -0.09729131, -2.05354, 0.2470588, 1, 0, 1,
-0.4964705, -0.1467042, 1.170921, 0.2431373, 1, 0, 1,
-0.4938352, -0.1330131, -0.1703113, 0.2352941, 1, 0, 1,
-0.4912584, -0.3056588, -3.291677, 0.2313726, 1, 0, 1,
-0.480253, -0.1908168, -2.436532, 0.2235294, 1, 0, 1,
-0.4792387, 0.5504352, -1.109844, 0.2196078, 1, 0, 1,
-0.475039, -0.4410419, -3.220774, 0.2117647, 1, 0, 1,
-0.4746232, -1.054736, -2.006074, 0.2078431, 1, 0, 1,
-0.4667135, -0.745329, -1.814406, 0.2, 1, 0, 1,
-0.464666, -0.4112976, -1.898631, 0.1921569, 1, 0, 1,
-0.4627211, 1.161153, -2.452395, 0.1882353, 1, 0, 1,
-0.4612571, -0.4198188, -2.845162, 0.1803922, 1, 0, 1,
-0.4606272, 1.45786, -1.235379, 0.1764706, 1, 0, 1,
-0.4602623, 0.44197, 0.09491481, 0.1686275, 1, 0, 1,
-0.4592382, 1.318687, 0.1235659, 0.1647059, 1, 0, 1,
-0.4554909, -1.29328, -1.815521, 0.1568628, 1, 0, 1,
-0.4550367, -0.4773441, -3.676423, 0.1529412, 1, 0, 1,
-0.4459563, 1.496874, 1.538563, 0.145098, 1, 0, 1,
-0.4436626, -0.3692258, -3.018541, 0.1411765, 1, 0, 1,
-0.4416811, -2.330739, -3.699991, 0.1333333, 1, 0, 1,
-0.4408806, -1.30634, -3.240794, 0.1294118, 1, 0, 1,
-0.4392643, 1.490097, -0.9738336, 0.1215686, 1, 0, 1,
-0.4329291, -0.4495457, -1.629808, 0.1176471, 1, 0, 1,
-0.4306894, -0.9572421, -2.428482, 0.1098039, 1, 0, 1,
-0.4277847, 2.24079, -1.191085, 0.1058824, 1, 0, 1,
-0.4261987, 0.3420721, -2.237958, 0.09803922, 1, 0, 1,
-0.4261956, 0.09417137, -2.707055, 0.09019608, 1, 0, 1,
-0.4177692, -0.3041733, -1.905909, 0.08627451, 1, 0, 1,
-0.4121318, -0.2788353, -1.751406, 0.07843138, 1, 0, 1,
-0.4003005, -0.0774521, -0.3124232, 0.07450981, 1, 0, 1,
-0.3924349, -1.799268, -3.229034, 0.06666667, 1, 0, 1,
-0.3892565, -1.364516, -3.214557, 0.0627451, 1, 0, 1,
-0.3882897, 0.0174215, 0.1098949, 0.05490196, 1, 0, 1,
-0.3859377, 2.34245, -0.01616932, 0.05098039, 1, 0, 1,
-0.3853869, -1.478139, -3.188661, 0.04313726, 1, 0, 1,
-0.3839006, 0.8649431, 0.01635629, 0.03921569, 1, 0, 1,
-0.3816631, 0.2679119, 0.1360524, 0.03137255, 1, 0, 1,
-0.3782495, 0.7913464, -1.314179, 0.02745098, 1, 0, 1,
-0.3597527, -0.286833, -1.505932, 0.01960784, 1, 0, 1,
-0.3559163, 3.196505, 0.04509511, 0.01568628, 1, 0, 1,
-0.3546478, 0.02469913, 0.3823652, 0.007843138, 1, 0, 1,
-0.3543778, -0.08819991, -1.984321, 0.003921569, 1, 0, 1,
-0.3520931, -1.059267, -2.798485, 0, 1, 0.003921569, 1,
-0.3518047, 0.4068466, -0.2441915, 0, 1, 0.01176471, 1,
-0.3509255, 0.132644, -1.914467, 0, 1, 0.01568628, 1,
-0.3454746, 1.748865, -1.233462, 0, 1, 0.02352941, 1,
-0.3409541, 2.228335, 0.1740693, 0, 1, 0.02745098, 1,
-0.3309734, -0.8534982, -3.083616, 0, 1, 0.03529412, 1,
-0.3258443, -0.3007004, -1.878326, 0, 1, 0.03921569, 1,
-0.3228041, -0.1274074, -3.774573, 0, 1, 0.04705882, 1,
-0.3188133, 0.3023553, -1.933416, 0, 1, 0.05098039, 1,
-0.3186696, -0.1772427, -0.8495851, 0, 1, 0.05882353, 1,
-0.3138955, -0.1125608, -2.709301, 0, 1, 0.0627451, 1,
-0.3133109, 1.267089, -0.290652, 0, 1, 0.07058824, 1,
-0.3126457, -0.6768295, -3.718234, 0, 1, 0.07450981, 1,
-0.3082634, 0.09417349, -0.4177997, 0, 1, 0.08235294, 1,
-0.3062118, 0.5363133, -1.305547, 0, 1, 0.08627451, 1,
-0.3049246, 1.41013, -2.455297, 0, 1, 0.09411765, 1,
-0.3009554, -0.81638, -3.249311, 0, 1, 0.1019608, 1,
-0.3002396, 0.5181481, -0.9510926, 0, 1, 0.1058824, 1,
-0.2985496, -0.2254002, -1.748842, 0, 1, 0.1137255, 1,
-0.2950676, -1.321258, -2.683729, 0, 1, 0.1176471, 1,
-0.2946635, 0.2647188, -1.265205, 0, 1, 0.1254902, 1,
-0.2939104, -0.3597111, -1.481912, 0, 1, 0.1294118, 1,
-0.2926089, 0.3118303, -1.545058, 0, 1, 0.1372549, 1,
-0.2886449, 1.524067, 0.4437791, 0, 1, 0.1411765, 1,
-0.2868103, -1.19435, -2.221074, 0, 1, 0.1490196, 1,
-0.2850711, 0.8678488, 0.05496894, 0, 1, 0.1529412, 1,
-0.2836178, 1.117896, 0.8286102, 0, 1, 0.1607843, 1,
-0.2833965, -2.481067, -3.466616, 0, 1, 0.1647059, 1,
-0.2770642, -0.8958609, -3.849249, 0, 1, 0.172549, 1,
-0.2764782, -0.7857583, -1.443323, 0, 1, 0.1764706, 1,
-0.2757748, 0.1639546, -0.1025869, 0, 1, 0.1843137, 1,
-0.2744935, -0.1796512, -1.942659, 0, 1, 0.1882353, 1,
-0.2743908, -0.9563265, -3.916431, 0, 1, 0.1960784, 1,
-0.2729138, 0.1836741, -1.502748, 0, 1, 0.2039216, 1,
-0.2727703, -0.4639684, -3.405059, 0, 1, 0.2078431, 1,
-0.2723966, 1.026171, -0.03092683, 0, 1, 0.2156863, 1,
-0.2707682, 0.3358881, -1.677992, 0, 1, 0.2196078, 1,
-0.2695882, 1.967309, 0.9671736, 0, 1, 0.227451, 1,
-0.2681694, 0.4412487, -0.4136734, 0, 1, 0.2313726, 1,
-0.2657932, 0.2375956, 0.3790264, 0, 1, 0.2392157, 1,
-0.2604242, -1.647755, -4.873867, 0, 1, 0.2431373, 1,
-0.2598422, -0.8583485, -2.433317, 0, 1, 0.2509804, 1,
-0.2580153, 0.6099702, 0.8938602, 0, 1, 0.254902, 1,
-0.255823, 1.737632, -0.9882081, 0, 1, 0.2627451, 1,
-0.2548679, -0.7330034, -2.341866, 0, 1, 0.2666667, 1,
-0.2541077, 0.8241029, -0.7883226, 0, 1, 0.2745098, 1,
-0.2518196, -0.5104572, -1.706402, 0, 1, 0.2784314, 1,
-0.249753, 1.026246, 0.1046233, 0, 1, 0.2862745, 1,
-0.2437816, 0.7218638, -0.1788915, 0, 1, 0.2901961, 1,
-0.2434124, 0.2055714, -1.677909, 0, 1, 0.2980392, 1,
-0.2423625, -0.3918615, -4.37934, 0, 1, 0.3058824, 1,
-0.2422871, 0.07179911, -0.3570314, 0, 1, 0.3098039, 1,
-0.2422781, 0.2804114, 0.8794816, 0, 1, 0.3176471, 1,
-0.2406252, 0.1409409, -0.2582721, 0, 1, 0.3215686, 1,
-0.2360548, -0.4276449, -4.596756, 0, 1, 0.3294118, 1,
-0.2352169, 1.793288, -0.2947802, 0, 1, 0.3333333, 1,
-0.2279869, -1.254596, -2.105299, 0, 1, 0.3411765, 1,
-0.2241156, 0.1543085, 0.4208502, 0, 1, 0.345098, 1,
-0.2234152, -0.405736, -2.923068, 0, 1, 0.3529412, 1,
-0.2199233, 0.8562766, -0.03243518, 0, 1, 0.3568628, 1,
-0.216222, 0.0953017, -1.126361, 0, 1, 0.3647059, 1,
-0.2149968, 0.7725429, -1.005813, 0, 1, 0.3686275, 1,
-0.2139026, -3.069122, -3.073523, 0, 1, 0.3764706, 1,
-0.21371, -0.3274008, -1.237371, 0, 1, 0.3803922, 1,
-0.210557, 1.22591, 0.1257942, 0, 1, 0.3882353, 1,
-0.2092291, 0.4233165, -0.02925438, 0, 1, 0.3921569, 1,
-0.2088986, 0.3279777, -0.802494, 0, 1, 0.4, 1,
-0.2073121, -0.4786467, -2.201036, 0, 1, 0.4078431, 1,
-0.2030732, -0.7405525, -1.338857, 0, 1, 0.4117647, 1,
-0.2026558, -1.225316, -4.723253, 0, 1, 0.4196078, 1,
-0.202626, 0.1899979, -1.123628, 0, 1, 0.4235294, 1,
-0.2000197, 0.8903874, 0.4264458, 0, 1, 0.4313726, 1,
-0.1973827, 1.841646, -1.478474, 0, 1, 0.4352941, 1,
-0.1967887, -1.295512, -0.2514958, 0, 1, 0.4431373, 1,
-0.1941053, 0.2433597, -2.071488, 0, 1, 0.4470588, 1,
-0.1936921, -1.075014, -1.776538, 0, 1, 0.454902, 1,
-0.1877668, 1.174796, -0.7857267, 0, 1, 0.4588235, 1,
-0.1869263, 1.568909, -0.2689003, 0, 1, 0.4666667, 1,
-0.1869061, 0.5216053, -0.5013452, 0, 1, 0.4705882, 1,
-0.1869044, 0.8068359, -0.1364427, 0, 1, 0.4784314, 1,
-0.1804366, -0.0350619, -2.965888, 0, 1, 0.4823529, 1,
-0.1791111, -0.4859418, -1.029507, 0, 1, 0.4901961, 1,
-0.1774685, 0.6609964, 0.5139616, 0, 1, 0.4941176, 1,
-0.1774226, 0.7259752, -0.9710032, 0, 1, 0.5019608, 1,
-0.1636958, -0.09738883, -0.7991147, 0, 1, 0.509804, 1,
-0.1585321, -1.887756, -3.858429, 0, 1, 0.5137255, 1,
-0.1584768, 1.03691, -1.51549, 0, 1, 0.5215687, 1,
-0.1523904, 0.4543964, -1.923754, 0, 1, 0.5254902, 1,
-0.1519602, -1.392627, -3.348915, 0, 1, 0.5333334, 1,
-0.1496696, -0.4691903, -2.837725, 0, 1, 0.5372549, 1,
-0.1459397, 0.8780686, 0.5030707, 0, 1, 0.5450981, 1,
-0.1443056, -0.6221346, -2.825999, 0, 1, 0.5490196, 1,
-0.1399104, 0.9654414, 0.6398767, 0, 1, 0.5568628, 1,
-0.1370453, -0.1286274, -1.0043, 0, 1, 0.5607843, 1,
-0.1303167, 0.09645321, -0.733963, 0, 1, 0.5686275, 1,
-0.1278693, -1.289601, -3.123622, 0, 1, 0.572549, 1,
-0.1242306, 1.007737, 0.4267024, 0, 1, 0.5803922, 1,
-0.1214206, -0.3232724, -2.347456, 0, 1, 0.5843138, 1,
-0.1212229, -0.5296157, -3.376471, 0, 1, 0.5921569, 1,
-0.1187355, -0.1597067, -3.198702, 0, 1, 0.5960785, 1,
-0.1177919, -0.9761388, -3.419512, 0, 1, 0.6039216, 1,
-0.1161707, 0.2175534, 0.0294386, 0, 1, 0.6117647, 1,
-0.116083, -0.7237226, -2.344017, 0, 1, 0.6156863, 1,
-0.1123677, -0.5788873, -2.94396, 0, 1, 0.6235294, 1,
-0.1118813, -0.9611011, -3.489852, 0, 1, 0.627451, 1,
-0.1096608, -0.3566577, -2.348071, 0, 1, 0.6352941, 1,
-0.1075655, -1.404054, -1.452761, 0, 1, 0.6392157, 1,
-0.1059606, -1.168944, -1.935023, 0, 1, 0.6470588, 1,
-0.1026145, -0.3840748, -2.466339, 0, 1, 0.6509804, 1,
-0.1023983, -0.7881119, -4.098381, 0, 1, 0.6588235, 1,
-0.1012248, -1.550989, -3.965935, 0, 1, 0.6627451, 1,
-0.09208461, -0.3729278, -1.732816, 0, 1, 0.6705883, 1,
-0.08391134, -1.85572, -3.869214, 0, 1, 0.6745098, 1,
-0.07790895, -0.4265057, -1.489082, 0, 1, 0.682353, 1,
-0.07721196, -0.4745267, -2.740005, 0, 1, 0.6862745, 1,
-0.07556061, 0.1559133, -0.7046208, 0, 1, 0.6941177, 1,
-0.07381737, 0.2275758, -0.5269624, 0, 1, 0.7019608, 1,
-0.0734957, 0.8601757, 0.6721553, 0, 1, 0.7058824, 1,
-0.06768762, -0.3831528, -2.172146, 0, 1, 0.7137255, 1,
-0.06260818, 0.648567, -1.003873, 0, 1, 0.7176471, 1,
-0.0613914, -0.7543403, -3.087443, 0, 1, 0.7254902, 1,
-0.0585089, -0.5976148, -3.548351, 0, 1, 0.7294118, 1,
-0.05749528, 1.484516, -0.3663223, 0, 1, 0.7372549, 1,
-0.05652569, -0.1190205, -2.561333, 0, 1, 0.7411765, 1,
-0.05342837, -1.569426, -2.59416, 0, 1, 0.7490196, 1,
-0.05326164, 0.4308618, -1.778658, 0, 1, 0.7529412, 1,
-0.04930948, 0.1864896, -1.031557, 0, 1, 0.7607843, 1,
-0.04887753, -0.758081, -2.492471, 0, 1, 0.7647059, 1,
-0.04852262, -1.200317, -2.784183, 0, 1, 0.772549, 1,
-0.04541894, 1.129562, -0.04259102, 0, 1, 0.7764706, 1,
-0.04349133, 2.482818, 1.398301, 0, 1, 0.7843137, 1,
-0.0431445, -0.2609989, -1.622219, 0, 1, 0.7882353, 1,
-0.04267718, 0.3877404, -0.7615545, 0, 1, 0.7960784, 1,
-0.04189648, -0.2325242, -3.59146, 0, 1, 0.8039216, 1,
-0.03793424, -0.4007699, -2.566937, 0, 1, 0.8078431, 1,
-0.03457421, 0.05530546, -0.08427646, 0, 1, 0.8156863, 1,
-0.03319969, 0.1167332, 0.6585938, 0, 1, 0.8196079, 1,
-0.03108977, -0.68074, -2.475432, 0, 1, 0.827451, 1,
-0.02865523, -1.43418, -5.462042, 0, 1, 0.8313726, 1,
-0.02542674, 1.050132, 0.5052141, 0, 1, 0.8392157, 1,
-0.02528368, -2.101304, -3.090974, 0, 1, 0.8431373, 1,
-0.0249868, -0.3564579, -3.746993, 0, 1, 0.8509804, 1,
-0.02340916, 3.46205, -0.536542, 0, 1, 0.854902, 1,
-0.02227645, -1.735368, -2.74585, 0, 1, 0.8627451, 1,
-0.02100472, 0.06819353, 0.5740864, 0, 1, 0.8666667, 1,
-0.01944352, -0.233564, -2.048659, 0, 1, 0.8745098, 1,
-0.01923904, -0.5930683, -3.610961, 0, 1, 0.8784314, 1,
-0.01793153, 0.9572858, -0.8436219, 0, 1, 0.8862745, 1,
-0.01707835, 0.7511657, -1.013593, 0, 1, 0.8901961, 1,
-0.01613266, -1.061671, -2.573132, 0, 1, 0.8980392, 1,
-0.01180704, -1.880204, -3.867709, 0, 1, 0.9058824, 1,
-0.01133268, 0.6007657, 0.866499, 0, 1, 0.9098039, 1,
-0.007235155, 0.9093674, -1.024091, 0, 1, 0.9176471, 1,
-0.006667668, 0.1163371, -0.9564592, 0, 1, 0.9215686, 1,
0.008731777, -0.3608778, 2.870731, 0, 1, 0.9294118, 1,
0.01119191, 0.9341105, -1.742343, 0, 1, 0.9333333, 1,
0.01154404, -0.7267327, 3.073045, 0, 1, 0.9411765, 1,
0.01187756, 0.2681143, 0.3276559, 0, 1, 0.945098, 1,
0.01585895, 0.5890406, -1.073075, 0, 1, 0.9529412, 1,
0.01709055, -1.141179, 4.036197, 0, 1, 0.9568627, 1,
0.01755679, 1.102178, -0.3720908, 0, 1, 0.9647059, 1,
0.02118718, 0.4602226, 0.2965418, 0, 1, 0.9686275, 1,
0.02186076, 0.1733847, 1.184645, 0, 1, 0.9764706, 1,
0.02532222, 0.8625345, 0.235471, 0, 1, 0.9803922, 1,
0.02547947, -0.8785154, 2.644321, 0, 1, 0.9882353, 1,
0.0260344, -0.8860014, 2.433512, 0, 1, 0.9921569, 1,
0.02914655, 2.169322, 0.1222381, 0, 1, 1, 1,
0.02995958, 1.129926, 0.4584042, 0, 0.9921569, 1, 1,
0.03105438, -0.495404, 2.784098, 0, 0.9882353, 1, 1,
0.03319764, 0.9258178, -2.376343, 0, 0.9803922, 1, 1,
0.03341983, 2.345806, 0.651447, 0, 0.9764706, 1, 1,
0.03534488, -0.692941, 2.986894, 0, 0.9686275, 1, 1,
0.0356411, 0.4312151, -0.7347976, 0, 0.9647059, 1, 1,
0.04104769, -0.4470047, 2.154159, 0, 0.9568627, 1, 1,
0.04311807, -0.8147742, 2.581619, 0, 0.9529412, 1, 1,
0.04410093, 0.1758951, 0.9142488, 0, 0.945098, 1, 1,
0.04544339, 0.8148612, 0.671276, 0, 0.9411765, 1, 1,
0.04952515, -0.9207539, 3.188777, 0, 0.9333333, 1, 1,
0.05483234, -0.01358207, 1.738682, 0, 0.9294118, 1, 1,
0.05587988, -1.33376, 4.000285, 0, 0.9215686, 1, 1,
0.06144845, -0.1445211, 2.604548, 0, 0.9176471, 1, 1,
0.06313223, -2.262551, 2.855142, 0, 0.9098039, 1, 1,
0.06411657, -0.02050223, 3.08302, 0, 0.9058824, 1, 1,
0.06445565, -0.3537032, 3.440916, 0, 0.8980392, 1, 1,
0.06719661, -0.0005845603, 0.1118471, 0, 0.8901961, 1, 1,
0.07334338, -0.07808077, 3.032402, 0, 0.8862745, 1, 1,
0.07435922, -1.256375, 2.529285, 0, 0.8784314, 1, 1,
0.074545, 0.3666099, 3.772295, 0, 0.8745098, 1, 1,
0.07704743, 0.1426765, -1.044912, 0, 0.8666667, 1, 1,
0.07953938, 1.139506, -0.8904814, 0, 0.8627451, 1, 1,
0.08632486, 0.2309423, 2.518454, 0, 0.854902, 1, 1,
0.08760294, -0.4253015, 2.296686, 0, 0.8509804, 1, 1,
0.08835776, 1.785771, -0.2179463, 0, 0.8431373, 1, 1,
0.0956568, 0.6297524, 0.9675277, 0, 0.8392157, 1, 1,
0.09985281, -1.181432, 2.384689, 0, 0.8313726, 1, 1,
0.1001132, -0.8900965, 3.335859, 0, 0.827451, 1, 1,
0.1017863, 1.417286, 0.6834546, 0, 0.8196079, 1, 1,
0.1117261, -1.326739, 1.935229, 0, 0.8156863, 1, 1,
0.1119942, -0.07728945, 2.752015, 0, 0.8078431, 1, 1,
0.1123783, -0.5593589, 3.103335, 0, 0.8039216, 1, 1,
0.1156063, -0.1853272, 2.2692, 0, 0.7960784, 1, 1,
0.116084, -0.8385924, 3.792438, 0, 0.7882353, 1, 1,
0.1192146, 1.06047, 0.8182603, 0, 0.7843137, 1, 1,
0.1193501, -0.1415699, 2.080678, 0, 0.7764706, 1, 1,
0.1221034, 0.02612151, -0.16311, 0, 0.772549, 1, 1,
0.1232331, 3.139975, -0.750415, 0, 0.7647059, 1, 1,
0.1350707, -0.1383124, 3.370778, 0, 0.7607843, 1, 1,
0.1352599, -0.2210985, 1.803375, 0, 0.7529412, 1, 1,
0.135789, -0.5874501, 2.717834, 0, 0.7490196, 1, 1,
0.1376091, 0.7560687, -1.39697, 0, 0.7411765, 1, 1,
0.1409407, 0.902317, 0.6285961, 0, 0.7372549, 1, 1,
0.1437342, 1.705833, -1.268116, 0, 0.7294118, 1, 1,
0.1499281, -0.5969106, 4.102797, 0, 0.7254902, 1, 1,
0.152963, 1.442402, 1.346374, 0, 0.7176471, 1, 1,
0.1579487, 1.353018, -0.7923, 0, 0.7137255, 1, 1,
0.162491, -1.307261, 3.851245, 0, 0.7058824, 1, 1,
0.1671937, 0.5347495, 1.550475, 0, 0.6980392, 1, 1,
0.1704982, 1.205163, -0.5765022, 0, 0.6941177, 1, 1,
0.1781582, 2.853203, -1.279633, 0, 0.6862745, 1, 1,
0.1887655, -0.9594758, 3.859032, 0, 0.682353, 1, 1,
0.1965822, -0.8669567, 3.571267, 0, 0.6745098, 1, 1,
0.1989529, -1.028375, 4.311938, 0, 0.6705883, 1, 1,
0.2046655, -1.277172, 3.539506, 0, 0.6627451, 1, 1,
0.210553, 0.09461856, -0.2405424, 0, 0.6588235, 1, 1,
0.2107095, 0.1871052, 1.55506, 0, 0.6509804, 1, 1,
0.2175188, 1.859468, -0.141987, 0, 0.6470588, 1, 1,
0.2198452, 0.7287744, 0.5285166, 0, 0.6392157, 1, 1,
0.2211794, 0.1643974, 1.715035, 0, 0.6352941, 1, 1,
0.2258682, -0.5069464, 2.708735, 0, 0.627451, 1, 1,
0.2304317, 0.1298382, 1.745382, 0, 0.6235294, 1, 1,
0.2355368, -0.7724549, 1.634589, 0, 0.6156863, 1, 1,
0.2357603, -0.9953988, 2.614867, 0, 0.6117647, 1, 1,
0.2363612, 0.8447528, -0.1419368, 0, 0.6039216, 1, 1,
0.2366968, 1.943615, 1.492147, 0, 0.5960785, 1, 1,
0.2418161, 1.363844, 0.1674116, 0, 0.5921569, 1, 1,
0.2475828, -0.09881566, 1.854688, 0, 0.5843138, 1, 1,
0.2496532, -1.503222, 4.611713, 0, 0.5803922, 1, 1,
0.2515384, 2.100094, -0.8306078, 0, 0.572549, 1, 1,
0.2566348, 0.2802519, 0.6726322, 0, 0.5686275, 1, 1,
0.256831, -0.09686186, 1.673654, 0, 0.5607843, 1, 1,
0.2572805, 1.349679, -0.3208976, 0, 0.5568628, 1, 1,
0.2579531, -0.5386651, 2.480747, 0, 0.5490196, 1, 1,
0.2621114, 1.119077, -0.8590448, 0, 0.5450981, 1, 1,
0.2626403, -2.316484, 3.216174, 0, 0.5372549, 1, 1,
0.2662702, 1.240299, -0.8638348, 0, 0.5333334, 1, 1,
0.2717564, 0.7017399, 1.742108, 0, 0.5254902, 1, 1,
0.2718257, 0.6284195, -0.06411414, 0, 0.5215687, 1, 1,
0.2737634, 0.1471064, 0.9160249, 0, 0.5137255, 1, 1,
0.2745939, 0.2596047, 2.578012, 0, 0.509804, 1, 1,
0.2746381, 0.1808183, -0.5170671, 0, 0.5019608, 1, 1,
0.2748542, -0.2234827, -0.3016862, 0, 0.4941176, 1, 1,
0.2752332, -0.5667079, 3.886178, 0, 0.4901961, 1, 1,
0.2776111, 0.1539382, 2.123747, 0, 0.4823529, 1, 1,
0.2782583, -0.1041387, 2.22178, 0, 0.4784314, 1, 1,
0.2782824, -0.2101642, 2.654572, 0, 0.4705882, 1, 1,
0.2812218, -0.1931998, 2.639829, 0, 0.4666667, 1, 1,
0.2909833, -1.046726, 2.368077, 0, 0.4588235, 1, 1,
0.291539, 0.08427969, 1.038142, 0, 0.454902, 1, 1,
0.2959879, 0.8433596, 1.199926, 0, 0.4470588, 1, 1,
0.2978731, 0.6082931, 1.212955, 0, 0.4431373, 1, 1,
0.2979088, 0.8573422, 1.234619, 0, 0.4352941, 1, 1,
0.2993823, -1.116359, 1.103531, 0, 0.4313726, 1, 1,
0.3007244, 1.534183, 0.3946868, 0, 0.4235294, 1, 1,
0.3008815, -0.8195812, 2.918797, 0, 0.4196078, 1, 1,
0.301136, 0.645839, -1.276754, 0, 0.4117647, 1, 1,
0.3049208, -1.240827, 1.884289, 0, 0.4078431, 1, 1,
0.3052325, 1.336787, -0.9283824, 0, 0.4, 1, 1,
0.3123554, 0.02401931, 1.309824, 0, 0.3921569, 1, 1,
0.315279, -0.9996977, 2.363616, 0, 0.3882353, 1, 1,
0.318924, 0.9753119, -0.9809418, 0, 0.3803922, 1, 1,
0.32099, -0.7797966, 4.507682, 0, 0.3764706, 1, 1,
0.3223378, -0.3945528, 2.786194, 0, 0.3686275, 1, 1,
0.3228776, 0.2671108, 1.929343, 0, 0.3647059, 1, 1,
0.3255959, 0.9219846, -1.24686, 0, 0.3568628, 1, 1,
0.3270279, 0.5970268, 2.397851, 0, 0.3529412, 1, 1,
0.3275533, -1.500733, 2.911314, 0, 0.345098, 1, 1,
0.3292126, -0.2346498, 1.962816, 0, 0.3411765, 1, 1,
0.3295958, 1.116286, -0.3345082, 0, 0.3333333, 1, 1,
0.3339804, -0.5822107, 3.777088, 0, 0.3294118, 1, 1,
0.3368714, 0.5012582, -0.1882617, 0, 0.3215686, 1, 1,
0.3387536, 0.8748248, 0.2576161, 0, 0.3176471, 1, 1,
0.3407153, 2.927012, 2.180699, 0, 0.3098039, 1, 1,
0.3408293, 1.644068, -1.06939, 0, 0.3058824, 1, 1,
0.343768, 0.4483289, 2.226872, 0, 0.2980392, 1, 1,
0.3460894, -1.392685, 2.302809, 0, 0.2901961, 1, 1,
0.3475573, -1.707468, 2.419047, 0, 0.2862745, 1, 1,
0.347583, -0.1512918, 2.192683, 0, 0.2784314, 1, 1,
0.3488014, 0.6623972, 2.057513, 0, 0.2745098, 1, 1,
0.3519449, -1.835787, 2.629567, 0, 0.2666667, 1, 1,
0.3552128, 0.1859557, 1.125584, 0, 0.2627451, 1, 1,
0.3581318, -0.8687397, 4.001518, 0, 0.254902, 1, 1,
0.3649963, 0.06836074, 2.201951, 0, 0.2509804, 1, 1,
0.3661048, 0.04382398, 2.002703, 0, 0.2431373, 1, 1,
0.3667889, -0.0524167, 2.156971, 0, 0.2392157, 1, 1,
0.3683973, -0.1357198, 1.184917, 0, 0.2313726, 1, 1,
0.3695392, -0.3582384, 4.591465, 0, 0.227451, 1, 1,
0.3721306, 2.734195, -1.311863, 0, 0.2196078, 1, 1,
0.3750995, -1.562596, 3.485929, 0, 0.2156863, 1, 1,
0.3791931, 1.20464, 0.3031543, 0, 0.2078431, 1, 1,
0.384829, -0.901791, 1.226217, 0, 0.2039216, 1, 1,
0.3849909, 0.7675459, 0.6643441, 0, 0.1960784, 1, 1,
0.3851356, 0.7664266, 0.585688, 0, 0.1882353, 1, 1,
0.3868085, 0.341248, 0.2096701, 0, 0.1843137, 1, 1,
0.3876526, -0.3119459, 0.731527, 0, 0.1764706, 1, 1,
0.3879523, -0.348093, 0.4801785, 0, 0.172549, 1, 1,
0.3894977, -1.177027, 3.820277, 0, 0.1647059, 1, 1,
0.3924233, -0.9194779, 2.711528, 0, 0.1607843, 1, 1,
0.3970518, 0.5217382, -0.9380991, 0, 0.1529412, 1, 1,
0.3972892, -0.7812583, 3.316739, 0, 0.1490196, 1, 1,
0.3994122, -0.6209431, 0.6853709, 0, 0.1411765, 1, 1,
0.4011832, -2.695443, 3.632776, 0, 0.1372549, 1, 1,
0.4026472, -1.714236, 1.706276, 0, 0.1294118, 1, 1,
0.4047368, -0.8441463, 4.150657, 0, 0.1254902, 1, 1,
0.4064191, -0.5924622, 1.860091, 0, 0.1176471, 1, 1,
0.4144885, 0.4164053, 2.752561, 0, 0.1137255, 1, 1,
0.4184713, -0.4141788, 2.008942, 0, 0.1058824, 1, 1,
0.419692, 0.7828216, -0.5205655, 0, 0.09803922, 1, 1,
0.4203367, 1.501653, -1.20592, 0, 0.09411765, 1, 1,
0.4212876, 0.7333924, 2.168004, 0, 0.08627451, 1, 1,
0.4218539, -0.2296723, -0.8084874, 0, 0.08235294, 1, 1,
0.4228722, -0.1071388, 1.429085, 0, 0.07450981, 1, 1,
0.4234003, 1.026554, 0.207558, 0, 0.07058824, 1, 1,
0.4343355, 0.7425292, 0.4833433, 0, 0.0627451, 1, 1,
0.4345453, -0.004679543, 2.092208, 0, 0.05882353, 1, 1,
0.4392437, 0.1921313, -0.2372946, 0, 0.05098039, 1, 1,
0.4394812, -0.9753855, 2.321374, 0, 0.04705882, 1, 1,
0.4424056, -0.85822, 2.257488, 0, 0.03921569, 1, 1,
0.4428863, 1.665477, 0.6030091, 0, 0.03529412, 1, 1,
0.4434778, -1.472822, 2.327905, 0, 0.02745098, 1, 1,
0.4472618, -0.4221063, 3.140955, 0, 0.02352941, 1, 1,
0.4529643, -1.738864, 3.969392, 0, 0.01568628, 1, 1,
0.4532733, 1.04803, 1.177294, 0, 0.01176471, 1, 1,
0.4576025, -0.1806182, 3.083263, 0, 0.003921569, 1, 1,
0.4604001, 1.209301, -0.2362799, 0.003921569, 0, 1, 1,
0.4674353, 1.149674, -1.016441, 0.007843138, 0, 1, 1,
0.4695347, -1.871967, 1.618686, 0.01568628, 0, 1, 1,
0.4716653, 1.367688, -0.8541127, 0.01960784, 0, 1, 1,
0.4741201, 0.1304561, -0.2041727, 0.02745098, 0, 1, 1,
0.4743778, 0.2678428, -1.095856, 0.03137255, 0, 1, 1,
0.4784548, -0.1407157, 1.594632, 0.03921569, 0, 1, 1,
0.4798488, -0.09267978, 4.194043, 0.04313726, 0, 1, 1,
0.4818014, 0.3758061, 1.163201, 0.05098039, 0, 1, 1,
0.4841642, 1.066876, 1.469834, 0.05490196, 0, 1, 1,
0.4845718, -0.9008557, 2.968502, 0.0627451, 0, 1, 1,
0.48494, 1.48503, -0.7719331, 0.06666667, 0, 1, 1,
0.486205, -1.659651, 1.98619, 0.07450981, 0, 1, 1,
0.4871293, 1.161787, 0.7693979, 0.07843138, 0, 1, 1,
0.4883748, -0.2278658, 3.23324, 0.08627451, 0, 1, 1,
0.4917896, -0.3595566, 1.543258, 0.09019608, 0, 1, 1,
0.4932035, 0.1300218, 1.523898, 0.09803922, 0, 1, 1,
0.4937731, 0.3241081, -0.3484245, 0.1058824, 0, 1, 1,
0.4980918, 0.5090919, 0.9135136, 0.1098039, 0, 1, 1,
0.4997424, 1.301485, 0.0544927, 0.1176471, 0, 1, 1,
0.5003312, -0.07514953, 2.28429, 0.1215686, 0, 1, 1,
0.5020916, -0.4745539, 0.9748992, 0.1294118, 0, 1, 1,
0.5037408, 0.8678755, 1.458036, 0.1333333, 0, 1, 1,
0.5043829, -0.5176648, 3.284365, 0.1411765, 0, 1, 1,
0.5061249, 0.5386015, 0.06632219, 0.145098, 0, 1, 1,
0.5105159, -0.06857462, 1.786428, 0.1529412, 0, 1, 1,
0.5158033, 0.7947416, 0.1509604, 0.1568628, 0, 1, 1,
0.5262468, -0.6976138, 3.269464, 0.1647059, 0, 1, 1,
0.5302833, -1.472536, 4.041207, 0.1686275, 0, 1, 1,
0.5417449, -0.2860709, 2.134964, 0.1764706, 0, 1, 1,
0.5456035, -0.3557906, 3.110537, 0.1803922, 0, 1, 1,
0.5477942, -1.853214, 2.408352, 0.1882353, 0, 1, 1,
0.5519022, 1.620391, 0.4817526, 0.1921569, 0, 1, 1,
0.5563996, 0.7458815, -0.9313534, 0.2, 0, 1, 1,
0.5619326, 1.109644, 0.06038041, 0.2078431, 0, 1, 1,
0.5638175, 0.4985392, 1.574476, 0.2117647, 0, 1, 1,
0.5650334, -0.9602185, 2.359856, 0.2196078, 0, 1, 1,
0.5655693, 0.01180378, 2.576016, 0.2235294, 0, 1, 1,
0.5676486, 0.3006848, 2.063098, 0.2313726, 0, 1, 1,
0.5730985, -2.368507, 3.472783, 0.2352941, 0, 1, 1,
0.5803239, 0.5364723, 0.6352134, 0.2431373, 0, 1, 1,
0.5869629, 0.5542307, 1.456714, 0.2470588, 0, 1, 1,
0.5921286, -0.6856888, 3.960233, 0.254902, 0, 1, 1,
0.5957003, 1.065312, -0.5315551, 0.2588235, 0, 1, 1,
0.5970529, -0.4213057, 1.550663, 0.2666667, 0, 1, 1,
0.598799, -0.3036586, 2.694925, 0.2705882, 0, 1, 1,
0.6008583, 1.09554, -0.5750217, 0.2784314, 0, 1, 1,
0.6040638, 0.9134089, 0.8831312, 0.282353, 0, 1, 1,
0.6102944, -1.226542, 2.836209, 0.2901961, 0, 1, 1,
0.613965, 1.382641, 0.2766255, 0.2941177, 0, 1, 1,
0.614818, -0.4834061, 4.075711, 0.3019608, 0, 1, 1,
0.614924, -1.244086, 2.478513, 0.3098039, 0, 1, 1,
0.6186051, 0.4728798, 2.351135, 0.3137255, 0, 1, 1,
0.6249861, 0.1068486, 0.700725, 0.3215686, 0, 1, 1,
0.6262325, -1.321654, 3.350071, 0.3254902, 0, 1, 1,
0.6270271, 0.823701, 0.9250569, 0.3333333, 0, 1, 1,
0.6272101, 1.11997, 0.06185517, 0.3372549, 0, 1, 1,
0.6310714, 0.1468625, 2.671885, 0.345098, 0, 1, 1,
0.6313029, -1.685087, 1.405679, 0.3490196, 0, 1, 1,
0.6327461, -1.211884, 3.328889, 0.3568628, 0, 1, 1,
0.6371447, -0.03626178, 1.187838, 0.3607843, 0, 1, 1,
0.6381836, 1.296243, 0.3997917, 0.3686275, 0, 1, 1,
0.6383229, 0.5471789, 2.739896, 0.372549, 0, 1, 1,
0.641501, -0.2025023, -1.060776, 0.3803922, 0, 1, 1,
0.643865, 1.41473, 1.344439, 0.3843137, 0, 1, 1,
0.6459414, -0.1394556, 2.700008, 0.3921569, 0, 1, 1,
0.6581023, 0.1356319, 2.217808, 0.3960784, 0, 1, 1,
0.6620669, 0.3833361, 1.584708, 0.4039216, 0, 1, 1,
0.6742153, 0.7922654, 0.2843633, 0.4117647, 0, 1, 1,
0.677223, 3.117448, 0.7401947, 0.4156863, 0, 1, 1,
0.6836642, 1.038412, 1.297888, 0.4235294, 0, 1, 1,
0.684062, -0.892589, 1.977767, 0.427451, 0, 1, 1,
0.6847359, -0.1145793, 2.696535, 0.4352941, 0, 1, 1,
0.6848984, -0.2545633, 0.9064304, 0.4392157, 0, 1, 1,
0.6859365, -2.876473, 3.978418, 0.4470588, 0, 1, 1,
0.6919795, -0.7888046, 1.143302, 0.4509804, 0, 1, 1,
0.6966095, -0.955331, 1.434289, 0.4588235, 0, 1, 1,
0.6974192, 0.4701233, 0.9608428, 0.4627451, 0, 1, 1,
0.7075275, 0.3668201, 3.015525, 0.4705882, 0, 1, 1,
0.7104754, 0.2465897, 1.882337, 0.4745098, 0, 1, 1,
0.7167426, -0.2131059, 0.1565919, 0.4823529, 0, 1, 1,
0.7204183, 0.5440122, 1.10219, 0.4862745, 0, 1, 1,
0.7205914, -0.3226128, 2.254576, 0.4941176, 0, 1, 1,
0.7217248, 0.2625384, 0.1866921, 0.5019608, 0, 1, 1,
0.7217851, 1.730851, 0.4940172, 0.5058824, 0, 1, 1,
0.726153, 0.03800138, 2.137382, 0.5137255, 0, 1, 1,
0.7356441, 0.4073035, 1.935036, 0.5176471, 0, 1, 1,
0.7362148, 0.09557144, 2.280197, 0.5254902, 0, 1, 1,
0.7368065, -0.06962081, 2.184176, 0.5294118, 0, 1, 1,
0.7438706, 0.4527747, 0.01983215, 0.5372549, 0, 1, 1,
0.7443713, -0.6901429, 0.3755849, 0.5411765, 0, 1, 1,
0.748872, -0.3069091, 2.212749, 0.5490196, 0, 1, 1,
0.7500299, -0.3150343, 2.440781, 0.5529412, 0, 1, 1,
0.7506572, -0.3699314, 1.392762, 0.5607843, 0, 1, 1,
0.7529583, 0.8011702, 1.552613, 0.5647059, 0, 1, 1,
0.7537392, -0.7879095, 3.142021, 0.572549, 0, 1, 1,
0.7576684, 0.5735089, 1.661562, 0.5764706, 0, 1, 1,
0.7581255, -0.984746, 3.170959, 0.5843138, 0, 1, 1,
0.7596413, -0.3361875, 2.634665, 0.5882353, 0, 1, 1,
0.7598816, 1.858226, 0.4964048, 0.5960785, 0, 1, 1,
0.7618626, 0.1439077, 1.147366, 0.6039216, 0, 1, 1,
0.7632529, -0.9286575, 3.052076, 0.6078432, 0, 1, 1,
0.7698789, 0.07533029, 1.599279, 0.6156863, 0, 1, 1,
0.7701412, -0.3967982, 2.039846, 0.6196079, 0, 1, 1,
0.7769557, -0.2560708, 2.201267, 0.627451, 0, 1, 1,
0.7782924, 0.4421029, 1.980706, 0.6313726, 0, 1, 1,
0.7789041, -1.556057, 2.583267, 0.6392157, 0, 1, 1,
0.7791206, 0.4087454, -1.3643, 0.6431373, 0, 1, 1,
0.7802827, 0.7667522, 1.28203, 0.6509804, 0, 1, 1,
0.7889978, -0.4836575, 1.358767, 0.654902, 0, 1, 1,
0.790648, 0.4330441, 0.9149306, 0.6627451, 0, 1, 1,
0.7912785, -0.9955031, 3.29074, 0.6666667, 0, 1, 1,
0.7946379, 1.39826, 2.610017, 0.6745098, 0, 1, 1,
0.7951539, 0.7385983, 2.440949, 0.6784314, 0, 1, 1,
0.7951849, 0.07638171, 1.107811, 0.6862745, 0, 1, 1,
0.7964938, 0.005000345, 2.019631, 0.6901961, 0, 1, 1,
0.8034037, -0.8154556, 3.167472, 0.6980392, 0, 1, 1,
0.8070955, -1.070373, 4.580981, 0.7058824, 0, 1, 1,
0.8087018, -0.1472929, 3.202249, 0.7098039, 0, 1, 1,
0.8151988, -0.7226644, 2.168508, 0.7176471, 0, 1, 1,
0.818556, -1.702948, 4.478422, 0.7215686, 0, 1, 1,
0.8189504, -0.3661795, 1.786435, 0.7294118, 0, 1, 1,
0.8208892, 0.09347057, 0.9737099, 0.7333333, 0, 1, 1,
0.8233875, -0.2539482, -0.000237111, 0.7411765, 0, 1, 1,
0.8237517, -0.48006, 1.941466, 0.7450981, 0, 1, 1,
0.8262848, -1.222535, 2.582368, 0.7529412, 0, 1, 1,
0.8266536, -1.721102, 3.198905, 0.7568628, 0, 1, 1,
0.8293123, -0.962989, 1.491585, 0.7647059, 0, 1, 1,
0.8339573, 1.554599, -0.4327909, 0.7686275, 0, 1, 1,
0.8343984, 0.5512114, -0.2399937, 0.7764706, 0, 1, 1,
0.8344915, -0.8391723, 2.925783, 0.7803922, 0, 1, 1,
0.8413644, -1.027696, 2.408035, 0.7882353, 0, 1, 1,
0.8485721, 0.452311, 1.318493, 0.7921569, 0, 1, 1,
0.850325, -1.14195, 3.85021, 0.8, 0, 1, 1,
0.8554642, 1.66942, 1.827404, 0.8078431, 0, 1, 1,
0.8561811, 0.9152794, 1.05162, 0.8117647, 0, 1, 1,
0.8602347, -2.855206, 1.774248, 0.8196079, 0, 1, 1,
0.8631793, 0.8048116, 1.384033, 0.8235294, 0, 1, 1,
0.8717397, -1.130636, 2.078236, 0.8313726, 0, 1, 1,
0.8806958, -0.7342327, 2.481064, 0.8352941, 0, 1, 1,
0.8838757, -0.1710777, 3.840736, 0.8431373, 0, 1, 1,
0.8874298, 0.003492516, 1.359242, 0.8470588, 0, 1, 1,
0.8919421, 1.451225, 0.3595752, 0.854902, 0, 1, 1,
0.8938844, 0.9823907, -0.07874222, 0.8588235, 0, 1, 1,
0.8976042, -0.09752519, 1.87772, 0.8666667, 0, 1, 1,
0.9012892, 0.7695972, 0.06247113, 0.8705882, 0, 1, 1,
0.9027722, 0.311069, 1.974387, 0.8784314, 0, 1, 1,
0.9039752, -0.5367953, 2.877239, 0.8823529, 0, 1, 1,
0.9065181, -0.6178535, 2.524499, 0.8901961, 0, 1, 1,
0.9074447, 2.257701, 0.07455321, 0.8941177, 0, 1, 1,
0.908478, 0.7172402, 0.05066669, 0.9019608, 0, 1, 1,
0.9125837, -0.3019334, 3.068431, 0.9098039, 0, 1, 1,
0.9205641, 2.05659, 1.735141, 0.9137255, 0, 1, 1,
0.9278452, -0.5548139, 3.020978, 0.9215686, 0, 1, 1,
0.931123, 0.1630894, 0.0951625, 0.9254902, 0, 1, 1,
0.9389, 0.8694635, 1.620264, 0.9333333, 0, 1, 1,
0.9412528, 0.434936, 0.09577098, 0.9372549, 0, 1, 1,
0.9453897, -1.595129, 2.926655, 0.945098, 0, 1, 1,
0.9455402, 1.019309, -0.2278651, 0.9490196, 0, 1, 1,
0.9546873, 0.6121796, -0.5823236, 0.9568627, 0, 1, 1,
0.956638, 0.3177976, 1.946192, 0.9607843, 0, 1, 1,
0.962952, -0.02368595, 0.8104213, 0.9686275, 0, 1, 1,
0.9657782, 0.2540262, 1.428755, 0.972549, 0, 1, 1,
0.9696624, 0.5943735, -0.2779314, 0.9803922, 0, 1, 1,
0.9708605, 0.1817288, -0.6729763, 0.9843137, 0, 1, 1,
0.9762385, 0.4782594, 2.665416, 0.9921569, 0, 1, 1,
0.980309, 2.018356, 0.6881703, 0.9960784, 0, 1, 1,
0.9835051, 0.8234794, 1.76356, 1, 0, 0.9960784, 1,
0.9958287, 0.4446751, 0.4647301, 1, 0, 0.9882353, 1,
1.002542, 0.01323058, 1.737483, 1, 0, 0.9843137, 1,
1.013928, -0.7569932, 1.771793, 1, 0, 0.9764706, 1,
1.021985, 1.346124, 2.326565, 1, 0, 0.972549, 1,
1.025425, -0.3911388, 1.190464, 1, 0, 0.9647059, 1,
1.026268, -1.912131, 0.9009448, 1, 0, 0.9607843, 1,
1.03156, 0.2815982, 1.534351, 1, 0, 0.9529412, 1,
1.033554, 1.344122, 0.4005818, 1, 0, 0.9490196, 1,
1.050744, 0.4979327, 0.5988207, 1, 0, 0.9411765, 1,
1.058811, -0.7025908, 2.169989, 1, 0, 0.9372549, 1,
1.06993, -0.5943403, 1.545726, 1, 0, 0.9294118, 1,
1.071004, 1.424044, 1.587463, 1, 0, 0.9254902, 1,
1.075893, 0.1176144, 2.41428, 1, 0, 0.9176471, 1,
1.07831, 1.227834, -0.07268669, 1, 0, 0.9137255, 1,
1.082479, 0.5049483, 0.01879988, 1, 0, 0.9058824, 1,
1.084805, 0.1879352, 2.009366, 1, 0, 0.9019608, 1,
1.091882, -1.089764, 0.8800018, 1, 0, 0.8941177, 1,
1.099473, 0.1823246, 0.9918464, 1, 0, 0.8862745, 1,
1.102951, 0.4268518, -0.1559948, 1, 0, 0.8823529, 1,
1.106644, 0.6700757, 2.174668, 1, 0, 0.8745098, 1,
1.116793, 0.06931552, 2.094844, 1, 0, 0.8705882, 1,
1.118663, 1.095971, 0.1525724, 1, 0, 0.8627451, 1,
1.124974, -2.7199, 5.388993, 1, 0, 0.8588235, 1,
1.1283, 1.667428, 1.326106, 1, 0, 0.8509804, 1,
1.129953, 0.4490055, 0.001807945, 1, 0, 0.8470588, 1,
1.132536, 1.213491, 0.7088009, 1, 0, 0.8392157, 1,
1.145213, 0.6604664, 3.014657, 1, 0, 0.8352941, 1,
1.148019, 1.767354, 1.110321, 1, 0, 0.827451, 1,
1.148481, -0.2392284, 0.5504351, 1, 0, 0.8235294, 1,
1.163698, 2.084135, 0.1012299, 1, 0, 0.8156863, 1,
1.164227, 1.401435, 1.922079, 1, 0, 0.8117647, 1,
1.16524, 1.475576, 0.1295041, 1, 0, 0.8039216, 1,
1.169632, -1.119918, 1.86885, 1, 0, 0.7960784, 1,
1.170271, -0.9571908, 1.79778, 1, 0, 0.7921569, 1,
1.170274, 0.2057193, -0.5043028, 1, 0, 0.7843137, 1,
1.172322, 0.2218305, -0.6325853, 1, 0, 0.7803922, 1,
1.17636, -0.2142239, 0.4400834, 1, 0, 0.772549, 1,
1.177408, 1.599775, 0.7317624, 1, 0, 0.7686275, 1,
1.178769, 0.02719912, 2.319347, 1, 0, 0.7607843, 1,
1.184369, 0.4544888, 0.6718122, 1, 0, 0.7568628, 1,
1.187111, 0.4965923, 0.9566621, 1, 0, 0.7490196, 1,
1.193807, -0.06097156, 2.022641, 1, 0, 0.7450981, 1,
1.19779, 0.5271585, 1.962535, 1, 0, 0.7372549, 1,
1.197973, -1.847837, 4.260796, 1, 0, 0.7333333, 1,
1.213801, -1.471699, 3.773847, 1, 0, 0.7254902, 1,
1.225298, -1.200397, 1.402564, 1, 0, 0.7215686, 1,
1.227335, -1.603743, 2.320766, 1, 0, 0.7137255, 1,
1.231089, 1.705426, 1.814171, 1, 0, 0.7098039, 1,
1.23319, -0.7250152, 2.359506, 1, 0, 0.7019608, 1,
1.234448, 0.07226485, 2.29913, 1, 0, 0.6941177, 1,
1.236241, -0.9500046, 2.88163, 1, 0, 0.6901961, 1,
1.240181, -0.6553705, 2.583517, 1, 0, 0.682353, 1,
1.24741, -0.2718261, 2.578811, 1, 0, 0.6784314, 1,
1.256891, -1.707741, 2.081327, 1, 0, 0.6705883, 1,
1.258828, 1.444365, 2.537669, 1, 0, 0.6666667, 1,
1.25951, 0.8183147, 0.9233828, 1, 0, 0.6588235, 1,
1.261354, -0.6754136, 2.212973, 1, 0, 0.654902, 1,
1.278384, 1.973063, -1.279066, 1, 0, 0.6470588, 1,
1.280274, -1.139877, 2.654962, 1, 0, 0.6431373, 1,
1.288582, 0.5125372, 2.216934, 1, 0, 0.6352941, 1,
1.293185, -0.006301935, 1.807909, 1, 0, 0.6313726, 1,
1.298738, 1.368016, -0.1477687, 1, 0, 0.6235294, 1,
1.313019, 0.1042954, 2.865522, 1, 0, 0.6196079, 1,
1.327339, 0.8666479, 2.033159, 1, 0, 0.6117647, 1,
1.339023, 1.309156, 1.573555, 1, 0, 0.6078432, 1,
1.341503, 0.9249948, -0.6168205, 1, 0, 0.6, 1,
1.344377, 0.13102, 0.8820509, 1, 0, 0.5921569, 1,
1.34965, -1.424086, 3.680481, 1, 0, 0.5882353, 1,
1.353158, 0.6213385, 1.554278, 1, 0, 0.5803922, 1,
1.360617, 0.1924979, 1.271841, 1, 0, 0.5764706, 1,
1.376989, -0.7936336, 1.437163, 1, 0, 0.5686275, 1,
1.390612, 2.732266, 0.4115238, 1, 0, 0.5647059, 1,
1.391141, 0.9326433, 0.8871707, 1, 0, 0.5568628, 1,
1.392919, -0.5286745, 1.69264, 1, 0, 0.5529412, 1,
1.396639, -0.1206747, 1.362028, 1, 0, 0.5450981, 1,
1.407651, -0.1792072, 1.093522, 1, 0, 0.5411765, 1,
1.438694, 1.218894, -0.5105057, 1, 0, 0.5333334, 1,
1.445698, 0.327308, 1.412629, 1, 0, 0.5294118, 1,
1.453302, 2.063317, 0.6135321, 1, 0, 0.5215687, 1,
1.460387, 0.7821194, 0.4702778, 1, 0, 0.5176471, 1,
1.46065, 1.931727, -1.696687, 1, 0, 0.509804, 1,
1.467303, 0.3172678, 1.807678, 1, 0, 0.5058824, 1,
1.474845, -1.409955, 3.596929, 1, 0, 0.4980392, 1,
1.484794, -0.1386561, 3.079258, 1, 0, 0.4901961, 1,
1.496485, 0.4353159, 3.082228, 1, 0, 0.4862745, 1,
1.501557, 0.8480435, 1.6331, 1, 0, 0.4784314, 1,
1.502326, 0.2487762, 0.04436007, 1, 0, 0.4745098, 1,
1.511905, -0.1279068, 2.246094, 1, 0, 0.4666667, 1,
1.526876, 1.017079, 1.935319, 1, 0, 0.4627451, 1,
1.539237, -0.4156103, 2.161356, 1, 0, 0.454902, 1,
1.539985, -1.272752, 2.743175, 1, 0, 0.4509804, 1,
1.542752, -0.009884882, 0.8697313, 1, 0, 0.4431373, 1,
1.555604, -0.4121253, 1.293863, 1, 0, 0.4392157, 1,
1.561837, -1.146873, 1.933131, 1, 0, 0.4313726, 1,
1.563068, -1.003305, 1.41701, 1, 0, 0.427451, 1,
1.564094, -0.1549427, 2.771877, 1, 0, 0.4196078, 1,
1.573296, 0.2132801, 1.727563, 1, 0, 0.4156863, 1,
1.573726, 0.4761896, 0.5849292, 1, 0, 0.4078431, 1,
1.587588, -1.315874, 0.6824429, 1, 0, 0.4039216, 1,
1.588836, 1.371897, -0.5030405, 1, 0, 0.3960784, 1,
1.594719, -1.565593, 1.740976, 1, 0, 0.3882353, 1,
1.594839, -0.3273065, 3.485431, 1, 0, 0.3843137, 1,
1.595326, -1.260626, 2.544481, 1, 0, 0.3764706, 1,
1.601327, -0.1699251, 0.9497042, 1, 0, 0.372549, 1,
1.61211, 1.225098, 1.907527, 1, 0, 0.3647059, 1,
1.616039, 1.03831, 2.35619, 1, 0, 0.3607843, 1,
1.621229, 1.211892, 4.527697, 1, 0, 0.3529412, 1,
1.626358, 0.5534359, 1.272129, 1, 0, 0.3490196, 1,
1.629252, -0.1150454, 0.3897364, 1, 0, 0.3411765, 1,
1.629755, 0.968908, 0.3887838, 1, 0, 0.3372549, 1,
1.66594, 0.2687851, -0.03293249, 1, 0, 0.3294118, 1,
1.669009, 1.459747, 2.193443, 1, 0, 0.3254902, 1,
1.692146, 0.380737, 1.222227, 1, 0, 0.3176471, 1,
1.710222, -0.8564598, 1.599548, 1, 0, 0.3137255, 1,
1.710993, 0.05364519, 0.3668696, 1, 0, 0.3058824, 1,
1.717243, 0.1164889, 1.459176, 1, 0, 0.2980392, 1,
1.729576, 0.4098853, 1.159291, 1, 0, 0.2941177, 1,
1.746565, 0.7161102, 1.130709, 1, 0, 0.2862745, 1,
1.74657, -1.255961, 1.651098, 1, 0, 0.282353, 1,
1.768335, 0.9023873, 0.1236902, 1, 0, 0.2745098, 1,
1.785326, -1.662408, 3.070692, 1, 0, 0.2705882, 1,
1.795074, -1.170009, 1.89778, 1, 0, 0.2627451, 1,
1.81738, -0.300685, 2.281129, 1, 0, 0.2588235, 1,
1.835034, 0.06773125, 0.9583257, 1, 0, 0.2509804, 1,
1.83524, 1.078964, 2.382155, 1, 0, 0.2470588, 1,
1.848013, -1.142712, 0.9422681, 1, 0, 0.2392157, 1,
1.864429, -0.4061842, 1.156813, 1, 0, 0.2352941, 1,
1.867018, 1.537397, -0.1919437, 1, 0, 0.227451, 1,
1.881044, 0.7958508, 2.520062, 1, 0, 0.2235294, 1,
1.912252, -1.283344, 1.037898, 1, 0, 0.2156863, 1,
1.930918, -1.078051, 2.699172, 1, 0, 0.2117647, 1,
1.932288, 0.2443145, 1.895366, 1, 0, 0.2039216, 1,
1.974311, -0.2341241, 1.558519, 1, 0, 0.1960784, 1,
1.978392, -0.969946, 1.089819, 1, 0, 0.1921569, 1,
1.997109, -0.2633296, 3.235946, 1, 0, 0.1843137, 1,
1.997656, -1.696833, 2.484771, 1, 0, 0.1803922, 1,
2.024873, -0.1660763, 3.445582, 1, 0, 0.172549, 1,
2.068015, -0.7679136, 1.591266, 1, 0, 0.1686275, 1,
2.091587, -1.246601, 1.254367, 1, 0, 0.1607843, 1,
2.097322, 0.2085111, 0.09992304, 1, 0, 0.1568628, 1,
2.131979, 0.7532474, 1.436251, 1, 0, 0.1490196, 1,
2.160602, 1.516818, 0.3676386, 1, 0, 0.145098, 1,
2.19565, -0.6381063, 2.205824, 1, 0, 0.1372549, 1,
2.205998, 1.415254, 1.025355, 1, 0, 0.1333333, 1,
2.233538, -1.849489, -0.9400593, 1, 0, 0.1254902, 1,
2.279937, 0.7767943, 2.065972, 1, 0, 0.1215686, 1,
2.289966, -0.3982787, 2.027968, 1, 0, 0.1137255, 1,
2.315534, -0.02768298, 1.828477, 1, 0, 0.1098039, 1,
2.338702, -0.05061939, 0.3221105, 1, 0, 0.1019608, 1,
2.394541, 1.589485, 1.339015, 1, 0, 0.09411765, 1,
2.469397, 0.7205671, 1.100226, 1, 0, 0.09019608, 1,
2.530107, 1.653698, 2.887237, 1, 0, 0.08235294, 1,
2.569464, 0.4892927, 1.432847, 1, 0, 0.07843138, 1,
2.616265, 0.3074545, 1.963102, 1, 0, 0.07058824, 1,
2.618066, 0.8992228, -0.2197445, 1, 0, 0.06666667, 1,
2.625592, 0.6996368, 1.455638, 1, 0, 0.05882353, 1,
2.700234, 3.252211, 0.3564792, 1, 0, 0.05490196, 1,
2.718264, 0.6083626, 1.039244, 1, 0, 0.04705882, 1,
2.767084, -1.148603, 0.677378, 1, 0, 0.04313726, 1,
2.867109, 0.8163214, 0.6245625, 1, 0, 0.03529412, 1,
2.899452, -1.176481, 0.5705977, 1, 0, 0.03137255, 1,
2.917274, -0.1260826, 2.681646, 1, 0, 0.02352941, 1,
3.009204, -1.871737, 1.770474, 1, 0, 0.01960784, 1,
3.030624, -0.9176949, 1.787958, 1, 0, 0.01176471, 1,
3.293341, -1.482097, 1.232531, 1, 0, 0.007843138, 1
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
0.07314348, -4.176156, -7.301293, 0, -0.5, 0.5, 0.5,
0.07314348, -4.176156, -7.301293, 1, -0.5, 0.5, 0.5,
0.07314348, -4.176156, -7.301293, 1, 1.5, 0.5, 0.5,
0.07314348, -4.176156, -7.301293, 0, 1.5, 0.5, 0.5
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
-4.238701, 0.1964639, -7.301293, 0, -0.5, 0.5, 0.5,
-4.238701, 0.1964639, -7.301293, 1, -0.5, 0.5, 0.5,
-4.238701, 0.1964639, -7.301293, 1, 1.5, 0.5, 0.5,
-4.238701, 0.1964639, -7.301293, 0, 1.5, 0.5, 0.5
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
-4.238701, -4.176156, -0.03652477, 0, -0.5, 0.5, 0.5,
-4.238701, -4.176156, -0.03652477, 1, -0.5, 0.5, 0.5,
-4.238701, -4.176156, -0.03652477, 1, 1.5, 0.5, 0.5,
-4.238701, -4.176156, -0.03652477, 0, 1.5, 0.5, 0.5
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
-3, -3.16709, -5.624808,
3, -3.16709, -5.624808,
-3, -3.16709, -5.624808,
-3, -3.335268, -5.904222,
-2, -3.16709, -5.624808,
-2, -3.335268, -5.904222,
-1, -3.16709, -5.624808,
-1, -3.335268, -5.904222,
0, -3.16709, -5.624808,
0, -3.335268, -5.904222,
1, -3.16709, -5.624808,
1, -3.335268, -5.904222,
2, -3.16709, -5.624808,
2, -3.335268, -5.904222,
3, -3.16709, -5.624808,
3, -3.335268, -5.904222
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
-3, -3.671623, -6.46305, 0, -0.5, 0.5, 0.5,
-3, -3.671623, -6.46305, 1, -0.5, 0.5, 0.5,
-3, -3.671623, -6.46305, 1, 1.5, 0.5, 0.5,
-3, -3.671623, -6.46305, 0, 1.5, 0.5, 0.5,
-2, -3.671623, -6.46305, 0, -0.5, 0.5, 0.5,
-2, -3.671623, -6.46305, 1, -0.5, 0.5, 0.5,
-2, -3.671623, -6.46305, 1, 1.5, 0.5, 0.5,
-2, -3.671623, -6.46305, 0, 1.5, 0.5, 0.5,
-1, -3.671623, -6.46305, 0, -0.5, 0.5, 0.5,
-1, -3.671623, -6.46305, 1, -0.5, 0.5, 0.5,
-1, -3.671623, -6.46305, 1, 1.5, 0.5, 0.5,
-1, -3.671623, -6.46305, 0, 1.5, 0.5, 0.5,
0, -3.671623, -6.46305, 0, -0.5, 0.5, 0.5,
0, -3.671623, -6.46305, 1, -0.5, 0.5, 0.5,
0, -3.671623, -6.46305, 1, 1.5, 0.5, 0.5,
0, -3.671623, -6.46305, 0, 1.5, 0.5, 0.5,
1, -3.671623, -6.46305, 0, -0.5, 0.5, 0.5,
1, -3.671623, -6.46305, 1, -0.5, 0.5, 0.5,
1, -3.671623, -6.46305, 1, 1.5, 0.5, 0.5,
1, -3.671623, -6.46305, 0, 1.5, 0.5, 0.5,
2, -3.671623, -6.46305, 0, -0.5, 0.5, 0.5,
2, -3.671623, -6.46305, 1, -0.5, 0.5, 0.5,
2, -3.671623, -6.46305, 1, 1.5, 0.5, 0.5,
2, -3.671623, -6.46305, 0, 1.5, 0.5, 0.5,
3, -3.671623, -6.46305, 0, -0.5, 0.5, 0.5,
3, -3.671623, -6.46305, 1, -0.5, 0.5, 0.5,
3, -3.671623, -6.46305, 1, 1.5, 0.5, 0.5,
3, -3.671623, -6.46305, 0, 1.5, 0.5, 0.5
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
-3.24366, -3, -5.624808,
-3.24366, 3, -5.624808,
-3.24366, -3, -5.624808,
-3.4095, -3, -5.904222,
-3.24366, -2, -5.624808,
-3.4095, -2, -5.904222,
-3.24366, -1, -5.624808,
-3.4095, -1, -5.904222,
-3.24366, 0, -5.624808,
-3.4095, 0, -5.904222,
-3.24366, 1, -5.624808,
-3.4095, 1, -5.904222,
-3.24366, 2, -5.624808,
-3.4095, 2, -5.904222,
-3.24366, 3, -5.624808,
-3.4095, 3, -5.904222
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
"-3",
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
-3.74118, -3, -6.46305, 0, -0.5, 0.5, 0.5,
-3.74118, -3, -6.46305, 1, -0.5, 0.5, 0.5,
-3.74118, -3, -6.46305, 1, 1.5, 0.5, 0.5,
-3.74118, -3, -6.46305, 0, 1.5, 0.5, 0.5,
-3.74118, -2, -6.46305, 0, -0.5, 0.5, 0.5,
-3.74118, -2, -6.46305, 1, -0.5, 0.5, 0.5,
-3.74118, -2, -6.46305, 1, 1.5, 0.5, 0.5,
-3.74118, -2, -6.46305, 0, 1.5, 0.5, 0.5,
-3.74118, -1, -6.46305, 0, -0.5, 0.5, 0.5,
-3.74118, -1, -6.46305, 1, -0.5, 0.5, 0.5,
-3.74118, -1, -6.46305, 1, 1.5, 0.5, 0.5,
-3.74118, -1, -6.46305, 0, 1.5, 0.5, 0.5,
-3.74118, 0, -6.46305, 0, -0.5, 0.5, 0.5,
-3.74118, 0, -6.46305, 1, -0.5, 0.5, 0.5,
-3.74118, 0, -6.46305, 1, 1.5, 0.5, 0.5,
-3.74118, 0, -6.46305, 0, 1.5, 0.5, 0.5,
-3.74118, 1, -6.46305, 0, -0.5, 0.5, 0.5,
-3.74118, 1, -6.46305, 1, -0.5, 0.5, 0.5,
-3.74118, 1, -6.46305, 1, 1.5, 0.5, 0.5,
-3.74118, 1, -6.46305, 0, 1.5, 0.5, 0.5,
-3.74118, 2, -6.46305, 0, -0.5, 0.5, 0.5,
-3.74118, 2, -6.46305, 1, -0.5, 0.5, 0.5,
-3.74118, 2, -6.46305, 1, 1.5, 0.5, 0.5,
-3.74118, 2, -6.46305, 0, 1.5, 0.5, 0.5,
-3.74118, 3, -6.46305, 0, -0.5, 0.5, 0.5,
-3.74118, 3, -6.46305, 1, -0.5, 0.5, 0.5,
-3.74118, 3, -6.46305, 1, 1.5, 0.5, 0.5,
-3.74118, 3, -6.46305, 0, 1.5, 0.5, 0.5
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
-3.24366, -3.16709, -4,
-3.24366, -3.16709, 4,
-3.24366, -3.16709, -4,
-3.4095, -3.335268, -4,
-3.24366, -3.16709, -2,
-3.4095, -3.335268, -2,
-3.24366, -3.16709, 0,
-3.4095, -3.335268, 0,
-3.24366, -3.16709, 2,
-3.4095, -3.335268, 2,
-3.24366, -3.16709, 4,
-3.4095, -3.335268, 4
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
-3.74118, -3.671623, -4, 0, -0.5, 0.5, 0.5,
-3.74118, -3.671623, -4, 1, -0.5, 0.5, 0.5,
-3.74118, -3.671623, -4, 1, 1.5, 0.5, 0.5,
-3.74118, -3.671623, -4, 0, 1.5, 0.5, 0.5,
-3.74118, -3.671623, -2, 0, -0.5, 0.5, 0.5,
-3.74118, -3.671623, -2, 1, -0.5, 0.5, 0.5,
-3.74118, -3.671623, -2, 1, 1.5, 0.5, 0.5,
-3.74118, -3.671623, -2, 0, 1.5, 0.5, 0.5,
-3.74118, -3.671623, 0, 0, -0.5, 0.5, 0.5,
-3.74118, -3.671623, 0, 1, -0.5, 0.5, 0.5,
-3.74118, -3.671623, 0, 1, 1.5, 0.5, 0.5,
-3.74118, -3.671623, 0, 0, 1.5, 0.5, 0.5,
-3.74118, -3.671623, 2, 0, -0.5, 0.5, 0.5,
-3.74118, -3.671623, 2, 1, -0.5, 0.5, 0.5,
-3.74118, -3.671623, 2, 1, 1.5, 0.5, 0.5,
-3.74118, -3.671623, 2, 0, 1.5, 0.5, 0.5,
-3.74118, -3.671623, 4, 0, -0.5, 0.5, 0.5,
-3.74118, -3.671623, 4, 1, -0.5, 0.5, 0.5,
-3.74118, -3.671623, 4, 1, 1.5, 0.5, 0.5,
-3.74118, -3.671623, 4, 0, 1.5, 0.5, 0.5
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
-3.24366, -3.16709, -5.624808,
-3.24366, 3.560018, -5.624808,
-3.24366, -3.16709, 5.551758,
-3.24366, 3.560018, 5.551758,
-3.24366, -3.16709, -5.624808,
-3.24366, -3.16709, 5.551758,
-3.24366, 3.560018, -5.624808,
-3.24366, 3.560018, 5.551758,
-3.24366, -3.16709, -5.624808,
3.389947, -3.16709, -5.624808,
-3.24366, -3.16709, 5.551758,
3.389947, -3.16709, 5.551758,
-3.24366, 3.560018, -5.624808,
3.389947, 3.560018, -5.624808,
-3.24366, 3.560018, 5.551758,
3.389947, 3.560018, 5.551758,
3.389947, -3.16709, -5.624808,
3.389947, 3.560018, -5.624808,
3.389947, -3.16709, 5.551758,
3.389947, 3.560018, 5.551758,
3.389947, -3.16709, -5.624808,
3.389947, -3.16709, 5.551758,
3.389947, 3.560018, -5.624808,
3.389947, 3.560018, 5.551758
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
var radius = 7.814644;
var distance = 34.76823;
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
mvMatrix.translate( -0.07314348, -0.1964639, 0.03652477 );
mvMatrix.scale( 1.273718, 1.256015, 0.7559876 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76823);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Phenylacetate<-read.table("Phenylacetate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenylacetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
```

```r
y<-Phenylacetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
```

```r
z<-Phenylacetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
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
-3.147054, -1.576417, -1.894609, 0, 0, 1, 1, 1,
-2.731769, -1.013993, -2.796109, 1, 0, 0, 1, 1,
-2.600837, 0.5145113, -1.50641, 1, 0, 0, 1, 1,
-2.426566, 1.203228, -2.907136, 1, 0, 0, 1, 1,
-2.403867, 1.407484, -0.8182194, 1, 0, 0, 1, 1,
-2.399382, 0.7486933, -1.131493, 1, 0, 0, 1, 1,
-2.38977, 1.450539, -1.340431, 0, 0, 0, 1, 1,
-2.29487, -0.6409063, -1.810241, 0, 0, 0, 1, 1,
-2.290318, -1.537825, -1.645334, 0, 0, 0, 1, 1,
-2.277873, -0.2563002, -2.428537, 0, 0, 0, 1, 1,
-2.276028, -0.882795, -0.7672543, 0, 0, 0, 1, 1,
-2.2572, -0.1140066, -2.446088, 0, 0, 0, 1, 1,
-2.191511, -0.2642692, -1.155076, 0, 0, 0, 1, 1,
-2.160874, -1.399432, -2.920208, 1, 1, 1, 1, 1,
-2.147696, 0.004018582, -3.538129, 1, 1, 1, 1, 1,
-2.024788, -0.6166614, -1.659538, 1, 1, 1, 1, 1,
-2.024208, 1.200107, -0.3492742, 1, 1, 1, 1, 1,
-1.991262, 1.117048, -1.466079, 1, 1, 1, 1, 1,
-1.986683, 0.828072, -0.6219913, 1, 1, 1, 1, 1,
-1.973171, -1.350371, -1.445906, 1, 1, 1, 1, 1,
-1.947517, -0.7142668, -2.287512, 1, 1, 1, 1, 1,
-1.931858, -0.9800277, -1.167074, 1, 1, 1, 1, 1,
-1.911545, 0.4260018, -1.545535, 1, 1, 1, 1, 1,
-1.906262, 0.7067778, -0.4095323, 1, 1, 1, 1, 1,
-1.905063, 0.676026, -0.4152667, 1, 1, 1, 1, 1,
-1.8788, 0.01029523, -1.668808, 1, 1, 1, 1, 1,
-1.867097, 1.169204, -1.540448, 1, 1, 1, 1, 1,
-1.857267, 0.004519414, -2.668421, 1, 1, 1, 1, 1,
-1.855954, 0.9129196, -0.4782415, 0, 0, 1, 1, 1,
-1.841728, -0.4845095, -2.799431, 1, 0, 0, 1, 1,
-1.837103, 1.574973, -0.5432066, 1, 0, 0, 1, 1,
-1.831689, 0.4646772, -0.8559363, 1, 0, 0, 1, 1,
-1.811583, -0.7874632, -1.926043, 1, 0, 0, 1, 1,
-1.810844, -0.528318, -1.266469, 1, 0, 0, 1, 1,
-1.810602, -1.503772, -2.977277, 0, 0, 0, 1, 1,
-1.768852, 1.4052, -0.8648588, 0, 0, 0, 1, 1,
-1.744182, -0.301789, -1.107279, 0, 0, 0, 1, 1,
-1.737805, -0.2694343, -1.845243, 0, 0, 0, 1, 1,
-1.717321, -0.3055358, -1.479511, 0, 0, 0, 1, 1,
-1.7077, -0.5581466, -3.313123, 0, 0, 0, 1, 1,
-1.701457, 0.6315126, -3.13149, 0, 0, 0, 1, 1,
-1.677882, 0.7281032, -1.489822, 1, 1, 1, 1, 1,
-1.677565, -0.185775, -1.416854, 1, 1, 1, 1, 1,
-1.658064, 1.529422, 0.3231344, 1, 1, 1, 1, 1,
-1.657861, 0.7509373, -1.620855, 1, 1, 1, 1, 1,
-1.650496, 1.67163, -0.5516059, 1, 1, 1, 1, 1,
-1.648871, -0.9868671, -1.729584, 1, 1, 1, 1, 1,
-1.638703, -0.4411426, -1.920662, 1, 1, 1, 1, 1,
-1.622107, 0.5759858, -0.375989, 1, 1, 1, 1, 1,
-1.614283, -0.4688363, -1.421796, 1, 1, 1, 1, 1,
-1.606477, -0.195687, -1.259283, 1, 1, 1, 1, 1,
-1.603993, 0.3373373, -2.691298, 1, 1, 1, 1, 1,
-1.597762, -0.7498738, -1.336698, 1, 1, 1, 1, 1,
-1.589875, -0.3163856, -1.150217, 1, 1, 1, 1, 1,
-1.580955, 0.6707704, -1.237887, 1, 1, 1, 1, 1,
-1.569399, 0.4945893, -1.666817, 1, 1, 1, 1, 1,
-1.568825, 0.7736353, -0.0555213, 0, 0, 1, 1, 1,
-1.565076, 1.347093, -0.6564731, 1, 0, 0, 1, 1,
-1.553837, 0.8024262, -1.577757, 1, 0, 0, 1, 1,
-1.553401, -0.9327159, -3.489374, 1, 0, 0, 1, 1,
-1.550644, 0.593972, -2.153018, 1, 0, 0, 1, 1,
-1.547697, -0.7365242, -1.448827, 1, 0, 0, 1, 1,
-1.543963, 0.210819, -2.630371, 0, 0, 0, 1, 1,
-1.525701, -0.03770202, -2.723513, 0, 0, 0, 1, 1,
-1.499986, -2.392603, -1.663037, 0, 0, 0, 1, 1,
-1.489874, -0.6922151, -1.929863, 0, 0, 0, 1, 1,
-1.487905, -0.04400485, -2.125504, 0, 0, 0, 1, 1,
-1.486143, 1.126013, -0.5918095, 0, 0, 0, 1, 1,
-1.484847, 0.3912338, -2.841097, 0, 0, 0, 1, 1,
-1.480341, -0.1518125, -1.199431, 1, 1, 1, 1, 1,
-1.475717, -2.011385, -3.310376, 1, 1, 1, 1, 1,
-1.455148, 0.3944403, -1.298285, 1, 1, 1, 1, 1,
-1.452123, -0.7410581, -1.373942, 1, 1, 1, 1, 1,
-1.433652, 0.1334517, -1.727497, 1, 1, 1, 1, 1,
-1.431305, 1.074253, -0.5822321, 1, 1, 1, 1, 1,
-1.425964, -0.8795682, -2.287528, 1, 1, 1, 1, 1,
-1.417997, -1.242205, -2.526317, 1, 1, 1, 1, 1,
-1.41743, -1.11564, -1.928067, 1, 1, 1, 1, 1,
-1.413787, 1.670896, -0.7813492, 1, 1, 1, 1, 1,
-1.405198, -1.620249, -2.517128, 1, 1, 1, 1, 1,
-1.398462, -2.654694, -0.998494, 1, 1, 1, 1, 1,
-1.396832, -0.7355695, -2.551013, 1, 1, 1, 1, 1,
-1.390283, -1.332802, -1.466082, 1, 1, 1, 1, 1,
-1.387514, 0.2221594, -0.6765493, 1, 1, 1, 1, 1,
-1.385525, 0.2828507, -0.884791, 0, 0, 1, 1, 1,
-1.371836, -0.9607995, -0.5966634, 1, 0, 0, 1, 1,
-1.364882, 1.407937, -0.6045892, 1, 0, 0, 1, 1,
-1.364647, -0.8762723, -2.759834, 1, 0, 0, 1, 1,
-1.355971, 0.7975326, -0.5396443, 1, 0, 0, 1, 1,
-1.351924, 0.5454872, -0.3746082, 1, 0, 0, 1, 1,
-1.346935, -0.1048028, -1.931842, 0, 0, 0, 1, 1,
-1.346378, 0.2108861, 0.3884983, 0, 0, 0, 1, 1,
-1.342807, -0.3248568, -0.4916033, 0, 0, 0, 1, 1,
-1.335503, 0.3519943, -1.745965, 0, 0, 0, 1, 1,
-1.325245, 0.6343881, -1.786972, 0, 0, 0, 1, 1,
-1.316148, 1.187708, -0.8046325, 0, 0, 0, 1, 1,
-1.309312, 1.899901, 1.175418, 0, 0, 0, 1, 1,
-1.302248, 0.04139607, -2.317257, 1, 1, 1, 1, 1,
-1.296069, -0.3571507, -3.178917, 1, 1, 1, 1, 1,
-1.289932, 0.105397, -2.63615, 1, 1, 1, 1, 1,
-1.267498, 1.62373, 0.313539, 1, 1, 1, 1, 1,
-1.265609, 1.997651, -2.123699, 1, 1, 1, 1, 1,
-1.258276, -0.5884944, -2.319176, 1, 1, 1, 1, 1,
-1.251267, -1.078834, -2.742895, 1, 1, 1, 1, 1,
-1.247358, 0.2872096, 0.2250259, 1, 1, 1, 1, 1,
-1.24524, -0.8377288, -0.04343821, 1, 1, 1, 1, 1,
-1.241751, 0.8504552, -1.610578, 1, 1, 1, 1, 1,
-1.22938, -0.8674657, -4.842915, 1, 1, 1, 1, 1,
-1.226672, -0.8230068, -0.0446068, 1, 1, 1, 1, 1,
-1.219799, -0.8551677, -2.117763, 1, 1, 1, 1, 1,
-1.219094, -0.9789827, -1.295874, 1, 1, 1, 1, 1,
-1.21344, -1.333746, -1.390539, 1, 1, 1, 1, 1,
-1.205423, -1.713917, -4.009569, 0, 0, 1, 1, 1,
-1.200794, 0.1336267, -0.4816689, 1, 0, 0, 1, 1,
-1.196603, 0.1698708, -1.201952, 1, 0, 0, 1, 1,
-1.191362, -0.2333937, -2.515673, 1, 0, 0, 1, 1,
-1.189891, 1.531761, 1.210922, 1, 0, 0, 1, 1,
-1.182156, 0.4078276, -2.401936, 1, 0, 0, 1, 1,
-1.180085, -1.401553, -1.7606, 0, 0, 0, 1, 1,
-1.158088, 0.3800552, 0.9299492, 0, 0, 0, 1, 1,
-1.15097, 0.4096214, -3.021119, 0, 0, 0, 1, 1,
-1.143131, 0.421876, -1.746265, 0, 0, 0, 1, 1,
-1.142399, -0.327565, -2.373235, 0, 0, 0, 1, 1,
-1.130357, -1.309634, -2.522779, 0, 0, 0, 1, 1,
-1.120743, 0.6011536, 0.2387918, 0, 0, 0, 1, 1,
-1.114666, -0.1768504, -2.495042, 1, 1, 1, 1, 1,
-1.114432, -0.2786726, -2.840645, 1, 1, 1, 1, 1,
-1.112042, 0.2293142, -3.55985, 1, 1, 1, 1, 1,
-1.104137, -0.1998264, -3.533804, 1, 1, 1, 1, 1,
-1.09877, -1.112925, -1.297756, 1, 1, 1, 1, 1,
-1.093703, -2.411083, -3.612846, 1, 1, 1, 1, 1,
-1.077939, 1.329066, 1.737815, 1, 1, 1, 1, 1,
-1.074296, -1.491682, -2.631824, 1, 1, 1, 1, 1,
-1.069658, 0.6455683, -1.211768, 1, 1, 1, 1, 1,
-1.064968, 1.119785, 0.4241769, 1, 1, 1, 1, 1,
-1.054603, -2.103278, -2.802762, 1, 1, 1, 1, 1,
-1.04274, -0.7356672, -4.062108, 1, 1, 1, 1, 1,
-1.042344, 0.03912843, -1.353507, 1, 1, 1, 1, 1,
-1.038368, 1.639137, -1.271765, 1, 1, 1, 1, 1,
-1.035668, -0.4888001, -2.299441, 1, 1, 1, 1, 1,
-1.034558, 0.5021258, 0.06571686, 0, 0, 1, 1, 1,
-1.029702, -0.9496117, -2.204303, 1, 0, 0, 1, 1,
-1.025102, -0.2310246, -0.645323, 1, 0, 0, 1, 1,
-1.023351, -0.167881, -2.485415, 1, 0, 0, 1, 1,
-1.020457, -0.07209969, -1.714794, 1, 0, 0, 1, 1,
-1.017735, 0.08152805, -1.709474, 1, 0, 0, 1, 1,
-1.010041, 0.1497004, -0.9301919, 0, 0, 0, 1, 1,
-1.005073, -1.511272, -4.618605, 0, 0, 0, 1, 1,
-1.004767, 0.6943783, -2.769167, 0, 0, 0, 1, 1,
-0.9990341, 0.6229334, -1.744556, 0, 0, 0, 1, 1,
-0.9888991, 0.4713624, -0.08169182, 0, 0, 0, 1, 1,
-0.9843079, 0.3876334, -1.33936, 0, 0, 0, 1, 1,
-0.9809436, 0.9662789, 0.2040296, 0, 0, 0, 1, 1,
-0.9772021, 0.3856898, -0.3520527, 1, 1, 1, 1, 1,
-0.9749975, 0.02525156, -2.653936, 1, 1, 1, 1, 1,
-0.9740874, -0.7586229, -2.425358, 1, 1, 1, 1, 1,
-0.9618279, 0.5460232, -0.4661088, 1, 1, 1, 1, 1,
-0.96109, -0.4552298, -2.820958, 1, 1, 1, 1, 1,
-0.9591764, -1.912818, -1.806714, 1, 1, 1, 1, 1,
-0.9547644, 0.184376, -1.793948, 1, 1, 1, 1, 1,
-0.9494197, -0.5001858, -0.7637115, 1, 1, 1, 1, 1,
-0.9418718, 1.798613, -0.3921416, 1, 1, 1, 1, 1,
-0.9405802, -0.2428837, -2.44514, 1, 1, 1, 1, 1,
-0.9270405, 0.2651348, -1.812166, 1, 1, 1, 1, 1,
-0.9215617, -0.1014224, -2.316589, 1, 1, 1, 1, 1,
-0.9137947, -0.5040588, -1.491428, 1, 1, 1, 1, 1,
-0.9095842, 1.328297, 1.21226, 1, 1, 1, 1, 1,
-0.9095206, -0.1886029, -1.018376, 1, 1, 1, 1, 1,
-0.9049522, 0.6285059, -0.3222952, 0, 0, 1, 1, 1,
-0.9027882, -0.8819848, -3.083755, 1, 0, 0, 1, 1,
-0.9006665, 0.04379985, -2.127825, 1, 0, 0, 1, 1,
-0.8919746, 0.06290234, -0.1240047, 1, 0, 0, 1, 1,
-0.8917758, -1.018241, -1.725538, 1, 0, 0, 1, 1,
-0.8914189, 0.4533136, -0.2904467, 1, 0, 0, 1, 1,
-0.891284, -0.1153003, -0.9808237, 0, 0, 0, 1, 1,
-0.8805206, 1.300688, 0.2873166, 0, 0, 0, 1, 1,
-0.8761671, 0.1851379, 0.7538491, 0, 0, 0, 1, 1,
-0.8746158, 0.2191406, -2.95575, 0, 0, 0, 1, 1,
-0.8745188, -0.05149843, -2.293665, 0, 0, 0, 1, 1,
-0.8736082, -0.8838466, -2.330547, 0, 0, 0, 1, 1,
-0.8733053, -0.6607681, -2.359099, 0, 0, 0, 1, 1,
-0.8688734, 1.125645, -0.5582145, 1, 1, 1, 1, 1,
-0.8678569, -0.93362, 0.320784, 1, 1, 1, 1, 1,
-0.8627629, -0.02935189, -2.071332, 1, 1, 1, 1, 1,
-0.8576207, -2.359647, -4.107374, 1, 1, 1, 1, 1,
-0.853462, 1.31251, 1.572368, 1, 1, 1, 1, 1,
-0.8529124, 0.185951, -2.265684, 1, 1, 1, 1, 1,
-0.8511852, -0.1722558, -1.284347, 1, 1, 1, 1, 1,
-0.8496318, 0.1236148, -1.623024, 1, 1, 1, 1, 1,
-0.833778, 0.3520035, -1.948405, 1, 1, 1, 1, 1,
-0.8328341, -1.543616, -3.556895, 1, 1, 1, 1, 1,
-0.8271117, 0.8271964, 0.005430398, 1, 1, 1, 1, 1,
-0.8257508, -1.036762, -2.19929, 1, 1, 1, 1, 1,
-0.8161322, -2.061134, -4.952873, 1, 1, 1, 1, 1,
-0.8065029, 0.2784888, -2.466401, 1, 1, 1, 1, 1,
-0.7989969, 0.2440517, -1.140532, 1, 1, 1, 1, 1,
-0.7970282, -1.825735, -3.367228, 0, 0, 1, 1, 1,
-0.796635, 1.000351, -0.7125736, 1, 0, 0, 1, 1,
-0.7880653, -1.674851, -1.394214, 1, 0, 0, 1, 1,
-0.7869685, 0.7816765, -1.62982, 1, 0, 0, 1, 1,
-0.783517, 1.206867, 0.3812745, 1, 0, 0, 1, 1,
-0.7692422, -1.044652, -2.535645, 1, 0, 0, 1, 1,
-0.7668993, 1.487328, 0.9329302, 0, 0, 0, 1, 1,
-0.7655902, -0.4528438, -2.524513, 0, 0, 0, 1, 1,
-0.7581382, 0.04398662, -1.579916, 0, 0, 0, 1, 1,
-0.745946, 0.5580221, -2.493224, 0, 0, 0, 1, 1,
-0.7458543, -1.769826, -2.989774, 0, 0, 0, 1, 1,
-0.745698, -0.5838477, -1.664367, 0, 0, 0, 1, 1,
-0.7439732, 0.2249297, -1.205977, 0, 0, 0, 1, 1,
-0.7410566, 1.236279, 0.3174246, 1, 1, 1, 1, 1,
-0.7391823, -0.7710251, -0.9511235, 1, 1, 1, 1, 1,
-0.7371619, -0.3025573, -0.57507, 1, 1, 1, 1, 1,
-0.730947, 0.5343571, -0.2865424, 1, 1, 1, 1, 1,
-0.7256487, 1.023678, -1.299755, 1, 1, 1, 1, 1,
-0.7245551, -1.004801, -1.319772, 1, 1, 1, 1, 1,
-0.7229484, 0.0478033, -2.003979, 1, 1, 1, 1, 1,
-0.7223284, -0.3409433, -1.999408, 1, 1, 1, 1, 1,
-0.7126298, 0.1588184, -1.143881, 1, 1, 1, 1, 1,
-0.7105224, -2.04525, -2.919057, 1, 1, 1, 1, 1,
-0.7103138, 0.5603366, -2.165246, 1, 1, 1, 1, 1,
-0.7102398, 0.3529715, -1.732591, 1, 1, 1, 1, 1,
-0.7064444, 1.728755, 0.005003377, 1, 1, 1, 1, 1,
-0.7061804, 1.1474, 0.09872978, 1, 1, 1, 1, 1,
-0.702271, 0.2039788, -2.639342, 1, 1, 1, 1, 1,
-0.6959007, -0.8137104, -2.744241, 0, 0, 1, 1, 1,
-0.6932356, 0.4036945, -2.101428, 1, 0, 0, 1, 1,
-0.692709, -0.04335483, -1.170295, 1, 0, 0, 1, 1,
-0.6918588, 1.851959, 2.384402, 1, 0, 0, 1, 1,
-0.6905462, -0.6166572, -4.367362, 1, 0, 0, 1, 1,
-0.6903364, -0.275192, -1.306111, 1, 0, 0, 1, 1,
-0.6902804, -1.272691, -1.375375, 0, 0, 0, 1, 1,
-0.6843998, -1.372175, -3.005544, 0, 0, 0, 1, 1,
-0.677826, 2.083613, -0.4572816, 0, 0, 0, 1, 1,
-0.677038, -1.772246, -4.937519, 0, 0, 0, 1, 1,
-0.6756133, -0.8617799, -0.8460219, 0, 0, 0, 1, 1,
-0.6704638, 0.06167735, -0.7411929, 0, 0, 0, 1, 1,
-0.6679405, 0.0362431, -1.728239, 0, 0, 0, 1, 1,
-0.6670256, 2.046773, -1.120157, 1, 1, 1, 1, 1,
-0.6653566, 0.5649381, -1.637707, 1, 1, 1, 1, 1,
-0.6646395, -1.669966, -2.764191, 1, 1, 1, 1, 1,
-0.6592834, -0.3865967, -2.207567, 1, 1, 1, 1, 1,
-0.6578509, -2.490303, -3.749849, 1, 1, 1, 1, 1,
-0.6534066, -0.507099, -1.114996, 1, 1, 1, 1, 1,
-0.6524388, -0.3747025, 0.41758, 1, 1, 1, 1, 1,
-0.649385, -0.1037989, -1.024988, 1, 1, 1, 1, 1,
-0.6491392, -0.04593784, -0.5286331, 1, 1, 1, 1, 1,
-0.6467528, -0.2057509, -4.246843, 1, 1, 1, 1, 1,
-0.6446459, -0.7196941, -2.407181, 1, 1, 1, 1, 1,
-0.6436456, -0.8311227, -1.237797, 1, 1, 1, 1, 1,
-0.6401278, 1.170373, -0.6320652, 1, 1, 1, 1, 1,
-0.6300026, -1.26753, -2.810432, 1, 1, 1, 1, 1,
-0.6298036, 1.354788, -0.6330568, 1, 1, 1, 1, 1,
-0.6292183, -0.7511421, -1.784988, 0, 0, 1, 1, 1,
-0.6242416, 0.450109, 0.4446634, 1, 0, 0, 1, 1,
-0.6228083, -0.2451914, -2.175006, 1, 0, 0, 1, 1,
-0.6226614, -0.06929749, -1.455389, 1, 0, 0, 1, 1,
-0.6204847, -0.1248682, -1.541716, 1, 0, 0, 1, 1,
-0.620038, -1.537532, -2.452637, 1, 0, 0, 1, 1,
-0.6064267, -0.6640897, -3.184134, 0, 0, 0, 1, 1,
-0.604884, 0.8022585, -0.9617269, 0, 0, 0, 1, 1,
-0.6026886, 0.09264732, -0.7777572, 0, 0, 0, 1, 1,
-0.6020378, -2.723213, -2.116704, 0, 0, 0, 1, 1,
-0.6001893, -0.1268778, -1.390773, 0, 0, 0, 1, 1,
-0.5996266, 0.1135307, -2.459104, 0, 0, 0, 1, 1,
-0.5921227, -0.6840841, -1.547019, 0, 0, 0, 1, 1,
-0.5866112, -0.8069991, -3.642865, 1, 1, 1, 1, 1,
-0.5826142, 0.879559, -0.1971822, 1, 1, 1, 1, 1,
-0.5799696, -0.4386526, -2.942556, 1, 1, 1, 1, 1,
-0.5733191, -1.303305, -3.441776, 1, 1, 1, 1, 1,
-0.5732464, -0.3371485, -1.803571, 1, 1, 1, 1, 1,
-0.5726485, -0.9455343, -2.853202, 1, 1, 1, 1, 1,
-0.5683978, 0.2669601, -1.731048, 1, 1, 1, 1, 1,
-0.5617332, 0.08599875, -2.504349, 1, 1, 1, 1, 1,
-0.5520672, 0.6308036, -0.5932574, 1, 1, 1, 1, 1,
-0.5512892, 0.2696039, -1.678708, 1, 1, 1, 1, 1,
-0.5512237, 1.210542, -0.7558237, 1, 1, 1, 1, 1,
-0.5462506, 1.103346, 0.142108, 1, 1, 1, 1, 1,
-0.5458643, -1.026557, -1.914498, 1, 1, 1, 1, 1,
-0.5405225, -1.628237, -2.123427, 1, 1, 1, 1, 1,
-0.5400208, 1.217484, -1.168503, 1, 1, 1, 1, 1,
-0.5380177, 0.3434352, -1.791076, 0, 0, 1, 1, 1,
-0.5351325, -0.7880741, -2.773425, 1, 0, 0, 1, 1,
-0.5303137, 0.2020186, -0.6552917, 1, 0, 0, 1, 1,
-0.5302818, 0.6625657, -2.657082, 1, 0, 0, 1, 1,
-0.5283867, 0.1298053, -1.321756, 1, 0, 0, 1, 1,
-0.52711, 0.7387804, -2.001991, 1, 0, 0, 1, 1,
-0.5251427, 0.855197, 0.5131148, 0, 0, 0, 1, 1,
-0.5218689, -0.8554772, -3.15119, 0, 0, 0, 1, 1,
-0.512953, 0.531656, -1.426775, 0, 0, 0, 1, 1,
-0.5076097, 0.03847892, -1.256123, 0, 0, 0, 1, 1,
-0.506749, 0.9202122, -0.2231944, 0, 0, 0, 1, 1,
-0.4986118, 1.424541, 0.4410088, 0, 0, 0, 1, 1,
-0.4967721, -0.09729131, -2.05354, 0, 0, 0, 1, 1,
-0.4964705, -0.1467042, 1.170921, 1, 1, 1, 1, 1,
-0.4938352, -0.1330131, -0.1703113, 1, 1, 1, 1, 1,
-0.4912584, -0.3056588, -3.291677, 1, 1, 1, 1, 1,
-0.480253, -0.1908168, -2.436532, 1, 1, 1, 1, 1,
-0.4792387, 0.5504352, -1.109844, 1, 1, 1, 1, 1,
-0.475039, -0.4410419, -3.220774, 1, 1, 1, 1, 1,
-0.4746232, -1.054736, -2.006074, 1, 1, 1, 1, 1,
-0.4667135, -0.745329, -1.814406, 1, 1, 1, 1, 1,
-0.464666, -0.4112976, -1.898631, 1, 1, 1, 1, 1,
-0.4627211, 1.161153, -2.452395, 1, 1, 1, 1, 1,
-0.4612571, -0.4198188, -2.845162, 1, 1, 1, 1, 1,
-0.4606272, 1.45786, -1.235379, 1, 1, 1, 1, 1,
-0.4602623, 0.44197, 0.09491481, 1, 1, 1, 1, 1,
-0.4592382, 1.318687, 0.1235659, 1, 1, 1, 1, 1,
-0.4554909, -1.29328, -1.815521, 1, 1, 1, 1, 1,
-0.4550367, -0.4773441, -3.676423, 0, 0, 1, 1, 1,
-0.4459563, 1.496874, 1.538563, 1, 0, 0, 1, 1,
-0.4436626, -0.3692258, -3.018541, 1, 0, 0, 1, 1,
-0.4416811, -2.330739, -3.699991, 1, 0, 0, 1, 1,
-0.4408806, -1.30634, -3.240794, 1, 0, 0, 1, 1,
-0.4392643, 1.490097, -0.9738336, 1, 0, 0, 1, 1,
-0.4329291, -0.4495457, -1.629808, 0, 0, 0, 1, 1,
-0.4306894, -0.9572421, -2.428482, 0, 0, 0, 1, 1,
-0.4277847, 2.24079, -1.191085, 0, 0, 0, 1, 1,
-0.4261987, 0.3420721, -2.237958, 0, 0, 0, 1, 1,
-0.4261956, 0.09417137, -2.707055, 0, 0, 0, 1, 1,
-0.4177692, -0.3041733, -1.905909, 0, 0, 0, 1, 1,
-0.4121318, -0.2788353, -1.751406, 0, 0, 0, 1, 1,
-0.4003005, -0.0774521, -0.3124232, 1, 1, 1, 1, 1,
-0.3924349, -1.799268, -3.229034, 1, 1, 1, 1, 1,
-0.3892565, -1.364516, -3.214557, 1, 1, 1, 1, 1,
-0.3882897, 0.0174215, 0.1098949, 1, 1, 1, 1, 1,
-0.3859377, 2.34245, -0.01616932, 1, 1, 1, 1, 1,
-0.3853869, -1.478139, -3.188661, 1, 1, 1, 1, 1,
-0.3839006, 0.8649431, 0.01635629, 1, 1, 1, 1, 1,
-0.3816631, 0.2679119, 0.1360524, 1, 1, 1, 1, 1,
-0.3782495, 0.7913464, -1.314179, 1, 1, 1, 1, 1,
-0.3597527, -0.286833, -1.505932, 1, 1, 1, 1, 1,
-0.3559163, 3.196505, 0.04509511, 1, 1, 1, 1, 1,
-0.3546478, 0.02469913, 0.3823652, 1, 1, 1, 1, 1,
-0.3543778, -0.08819991, -1.984321, 1, 1, 1, 1, 1,
-0.3520931, -1.059267, -2.798485, 1, 1, 1, 1, 1,
-0.3518047, 0.4068466, -0.2441915, 1, 1, 1, 1, 1,
-0.3509255, 0.132644, -1.914467, 0, 0, 1, 1, 1,
-0.3454746, 1.748865, -1.233462, 1, 0, 0, 1, 1,
-0.3409541, 2.228335, 0.1740693, 1, 0, 0, 1, 1,
-0.3309734, -0.8534982, -3.083616, 1, 0, 0, 1, 1,
-0.3258443, -0.3007004, -1.878326, 1, 0, 0, 1, 1,
-0.3228041, -0.1274074, -3.774573, 1, 0, 0, 1, 1,
-0.3188133, 0.3023553, -1.933416, 0, 0, 0, 1, 1,
-0.3186696, -0.1772427, -0.8495851, 0, 0, 0, 1, 1,
-0.3138955, -0.1125608, -2.709301, 0, 0, 0, 1, 1,
-0.3133109, 1.267089, -0.290652, 0, 0, 0, 1, 1,
-0.3126457, -0.6768295, -3.718234, 0, 0, 0, 1, 1,
-0.3082634, 0.09417349, -0.4177997, 0, 0, 0, 1, 1,
-0.3062118, 0.5363133, -1.305547, 0, 0, 0, 1, 1,
-0.3049246, 1.41013, -2.455297, 1, 1, 1, 1, 1,
-0.3009554, -0.81638, -3.249311, 1, 1, 1, 1, 1,
-0.3002396, 0.5181481, -0.9510926, 1, 1, 1, 1, 1,
-0.2985496, -0.2254002, -1.748842, 1, 1, 1, 1, 1,
-0.2950676, -1.321258, -2.683729, 1, 1, 1, 1, 1,
-0.2946635, 0.2647188, -1.265205, 1, 1, 1, 1, 1,
-0.2939104, -0.3597111, -1.481912, 1, 1, 1, 1, 1,
-0.2926089, 0.3118303, -1.545058, 1, 1, 1, 1, 1,
-0.2886449, 1.524067, 0.4437791, 1, 1, 1, 1, 1,
-0.2868103, -1.19435, -2.221074, 1, 1, 1, 1, 1,
-0.2850711, 0.8678488, 0.05496894, 1, 1, 1, 1, 1,
-0.2836178, 1.117896, 0.8286102, 1, 1, 1, 1, 1,
-0.2833965, -2.481067, -3.466616, 1, 1, 1, 1, 1,
-0.2770642, -0.8958609, -3.849249, 1, 1, 1, 1, 1,
-0.2764782, -0.7857583, -1.443323, 1, 1, 1, 1, 1,
-0.2757748, 0.1639546, -0.1025869, 0, 0, 1, 1, 1,
-0.2744935, -0.1796512, -1.942659, 1, 0, 0, 1, 1,
-0.2743908, -0.9563265, -3.916431, 1, 0, 0, 1, 1,
-0.2729138, 0.1836741, -1.502748, 1, 0, 0, 1, 1,
-0.2727703, -0.4639684, -3.405059, 1, 0, 0, 1, 1,
-0.2723966, 1.026171, -0.03092683, 1, 0, 0, 1, 1,
-0.2707682, 0.3358881, -1.677992, 0, 0, 0, 1, 1,
-0.2695882, 1.967309, 0.9671736, 0, 0, 0, 1, 1,
-0.2681694, 0.4412487, -0.4136734, 0, 0, 0, 1, 1,
-0.2657932, 0.2375956, 0.3790264, 0, 0, 0, 1, 1,
-0.2604242, -1.647755, -4.873867, 0, 0, 0, 1, 1,
-0.2598422, -0.8583485, -2.433317, 0, 0, 0, 1, 1,
-0.2580153, 0.6099702, 0.8938602, 0, 0, 0, 1, 1,
-0.255823, 1.737632, -0.9882081, 1, 1, 1, 1, 1,
-0.2548679, -0.7330034, -2.341866, 1, 1, 1, 1, 1,
-0.2541077, 0.8241029, -0.7883226, 1, 1, 1, 1, 1,
-0.2518196, -0.5104572, -1.706402, 1, 1, 1, 1, 1,
-0.249753, 1.026246, 0.1046233, 1, 1, 1, 1, 1,
-0.2437816, 0.7218638, -0.1788915, 1, 1, 1, 1, 1,
-0.2434124, 0.2055714, -1.677909, 1, 1, 1, 1, 1,
-0.2423625, -0.3918615, -4.37934, 1, 1, 1, 1, 1,
-0.2422871, 0.07179911, -0.3570314, 1, 1, 1, 1, 1,
-0.2422781, 0.2804114, 0.8794816, 1, 1, 1, 1, 1,
-0.2406252, 0.1409409, -0.2582721, 1, 1, 1, 1, 1,
-0.2360548, -0.4276449, -4.596756, 1, 1, 1, 1, 1,
-0.2352169, 1.793288, -0.2947802, 1, 1, 1, 1, 1,
-0.2279869, -1.254596, -2.105299, 1, 1, 1, 1, 1,
-0.2241156, 0.1543085, 0.4208502, 1, 1, 1, 1, 1,
-0.2234152, -0.405736, -2.923068, 0, 0, 1, 1, 1,
-0.2199233, 0.8562766, -0.03243518, 1, 0, 0, 1, 1,
-0.216222, 0.0953017, -1.126361, 1, 0, 0, 1, 1,
-0.2149968, 0.7725429, -1.005813, 1, 0, 0, 1, 1,
-0.2139026, -3.069122, -3.073523, 1, 0, 0, 1, 1,
-0.21371, -0.3274008, -1.237371, 1, 0, 0, 1, 1,
-0.210557, 1.22591, 0.1257942, 0, 0, 0, 1, 1,
-0.2092291, 0.4233165, -0.02925438, 0, 0, 0, 1, 1,
-0.2088986, 0.3279777, -0.802494, 0, 0, 0, 1, 1,
-0.2073121, -0.4786467, -2.201036, 0, 0, 0, 1, 1,
-0.2030732, -0.7405525, -1.338857, 0, 0, 0, 1, 1,
-0.2026558, -1.225316, -4.723253, 0, 0, 0, 1, 1,
-0.202626, 0.1899979, -1.123628, 0, 0, 0, 1, 1,
-0.2000197, 0.8903874, 0.4264458, 1, 1, 1, 1, 1,
-0.1973827, 1.841646, -1.478474, 1, 1, 1, 1, 1,
-0.1967887, -1.295512, -0.2514958, 1, 1, 1, 1, 1,
-0.1941053, 0.2433597, -2.071488, 1, 1, 1, 1, 1,
-0.1936921, -1.075014, -1.776538, 1, 1, 1, 1, 1,
-0.1877668, 1.174796, -0.7857267, 1, 1, 1, 1, 1,
-0.1869263, 1.568909, -0.2689003, 1, 1, 1, 1, 1,
-0.1869061, 0.5216053, -0.5013452, 1, 1, 1, 1, 1,
-0.1869044, 0.8068359, -0.1364427, 1, 1, 1, 1, 1,
-0.1804366, -0.0350619, -2.965888, 1, 1, 1, 1, 1,
-0.1791111, -0.4859418, -1.029507, 1, 1, 1, 1, 1,
-0.1774685, 0.6609964, 0.5139616, 1, 1, 1, 1, 1,
-0.1774226, 0.7259752, -0.9710032, 1, 1, 1, 1, 1,
-0.1636958, -0.09738883, -0.7991147, 1, 1, 1, 1, 1,
-0.1585321, -1.887756, -3.858429, 1, 1, 1, 1, 1,
-0.1584768, 1.03691, -1.51549, 0, 0, 1, 1, 1,
-0.1523904, 0.4543964, -1.923754, 1, 0, 0, 1, 1,
-0.1519602, -1.392627, -3.348915, 1, 0, 0, 1, 1,
-0.1496696, -0.4691903, -2.837725, 1, 0, 0, 1, 1,
-0.1459397, 0.8780686, 0.5030707, 1, 0, 0, 1, 1,
-0.1443056, -0.6221346, -2.825999, 1, 0, 0, 1, 1,
-0.1399104, 0.9654414, 0.6398767, 0, 0, 0, 1, 1,
-0.1370453, -0.1286274, -1.0043, 0, 0, 0, 1, 1,
-0.1303167, 0.09645321, -0.733963, 0, 0, 0, 1, 1,
-0.1278693, -1.289601, -3.123622, 0, 0, 0, 1, 1,
-0.1242306, 1.007737, 0.4267024, 0, 0, 0, 1, 1,
-0.1214206, -0.3232724, -2.347456, 0, 0, 0, 1, 1,
-0.1212229, -0.5296157, -3.376471, 0, 0, 0, 1, 1,
-0.1187355, -0.1597067, -3.198702, 1, 1, 1, 1, 1,
-0.1177919, -0.9761388, -3.419512, 1, 1, 1, 1, 1,
-0.1161707, 0.2175534, 0.0294386, 1, 1, 1, 1, 1,
-0.116083, -0.7237226, -2.344017, 1, 1, 1, 1, 1,
-0.1123677, -0.5788873, -2.94396, 1, 1, 1, 1, 1,
-0.1118813, -0.9611011, -3.489852, 1, 1, 1, 1, 1,
-0.1096608, -0.3566577, -2.348071, 1, 1, 1, 1, 1,
-0.1075655, -1.404054, -1.452761, 1, 1, 1, 1, 1,
-0.1059606, -1.168944, -1.935023, 1, 1, 1, 1, 1,
-0.1026145, -0.3840748, -2.466339, 1, 1, 1, 1, 1,
-0.1023983, -0.7881119, -4.098381, 1, 1, 1, 1, 1,
-0.1012248, -1.550989, -3.965935, 1, 1, 1, 1, 1,
-0.09208461, -0.3729278, -1.732816, 1, 1, 1, 1, 1,
-0.08391134, -1.85572, -3.869214, 1, 1, 1, 1, 1,
-0.07790895, -0.4265057, -1.489082, 1, 1, 1, 1, 1,
-0.07721196, -0.4745267, -2.740005, 0, 0, 1, 1, 1,
-0.07556061, 0.1559133, -0.7046208, 1, 0, 0, 1, 1,
-0.07381737, 0.2275758, -0.5269624, 1, 0, 0, 1, 1,
-0.0734957, 0.8601757, 0.6721553, 1, 0, 0, 1, 1,
-0.06768762, -0.3831528, -2.172146, 1, 0, 0, 1, 1,
-0.06260818, 0.648567, -1.003873, 1, 0, 0, 1, 1,
-0.0613914, -0.7543403, -3.087443, 0, 0, 0, 1, 1,
-0.0585089, -0.5976148, -3.548351, 0, 0, 0, 1, 1,
-0.05749528, 1.484516, -0.3663223, 0, 0, 0, 1, 1,
-0.05652569, -0.1190205, -2.561333, 0, 0, 0, 1, 1,
-0.05342837, -1.569426, -2.59416, 0, 0, 0, 1, 1,
-0.05326164, 0.4308618, -1.778658, 0, 0, 0, 1, 1,
-0.04930948, 0.1864896, -1.031557, 0, 0, 0, 1, 1,
-0.04887753, -0.758081, -2.492471, 1, 1, 1, 1, 1,
-0.04852262, -1.200317, -2.784183, 1, 1, 1, 1, 1,
-0.04541894, 1.129562, -0.04259102, 1, 1, 1, 1, 1,
-0.04349133, 2.482818, 1.398301, 1, 1, 1, 1, 1,
-0.0431445, -0.2609989, -1.622219, 1, 1, 1, 1, 1,
-0.04267718, 0.3877404, -0.7615545, 1, 1, 1, 1, 1,
-0.04189648, -0.2325242, -3.59146, 1, 1, 1, 1, 1,
-0.03793424, -0.4007699, -2.566937, 1, 1, 1, 1, 1,
-0.03457421, 0.05530546, -0.08427646, 1, 1, 1, 1, 1,
-0.03319969, 0.1167332, 0.6585938, 1, 1, 1, 1, 1,
-0.03108977, -0.68074, -2.475432, 1, 1, 1, 1, 1,
-0.02865523, -1.43418, -5.462042, 1, 1, 1, 1, 1,
-0.02542674, 1.050132, 0.5052141, 1, 1, 1, 1, 1,
-0.02528368, -2.101304, -3.090974, 1, 1, 1, 1, 1,
-0.0249868, -0.3564579, -3.746993, 1, 1, 1, 1, 1,
-0.02340916, 3.46205, -0.536542, 0, 0, 1, 1, 1,
-0.02227645, -1.735368, -2.74585, 1, 0, 0, 1, 1,
-0.02100472, 0.06819353, 0.5740864, 1, 0, 0, 1, 1,
-0.01944352, -0.233564, -2.048659, 1, 0, 0, 1, 1,
-0.01923904, -0.5930683, -3.610961, 1, 0, 0, 1, 1,
-0.01793153, 0.9572858, -0.8436219, 1, 0, 0, 1, 1,
-0.01707835, 0.7511657, -1.013593, 0, 0, 0, 1, 1,
-0.01613266, -1.061671, -2.573132, 0, 0, 0, 1, 1,
-0.01180704, -1.880204, -3.867709, 0, 0, 0, 1, 1,
-0.01133268, 0.6007657, 0.866499, 0, 0, 0, 1, 1,
-0.007235155, 0.9093674, -1.024091, 0, 0, 0, 1, 1,
-0.006667668, 0.1163371, -0.9564592, 0, 0, 0, 1, 1,
0.008731777, -0.3608778, 2.870731, 0, 0, 0, 1, 1,
0.01119191, 0.9341105, -1.742343, 1, 1, 1, 1, 1,
0.01154404, -0.7267327, 3.073045, 1, 1, 1, 1, 1,
0.01187756, 0.2681143, 0.3276559, 1, 1, 1, 1, 1,
0.01585895, 0.5890406, -1.073075, 1, 1, 1, 1, 1,
0.01709055, -1.141179, 4.036197, 1, 1, 1, 1, 1,
0.01755679, 1.102178, -0.3720908, 1, 1, 1, 1, 1,
0.02118718, 0.4602226, 0.2965418, 1, 1, 1, 1, 1,
0.02186076, 0.1733847, 1.184645, 1, 1, 1, 1, 1,
0.02532222, 0.8625345, 0.235471, 1, 1, 1, 1, 1,
0.02547947, -0.8785154, 2.644321, 1, 1, 1, 1, 1,
0.0260344, -0.8860014, 2.433512, 1, 1, 1, 1, 1,
0.02914655, 2.169322, 0.1222381, 1, 1, 1, 1, 1,
0.02995958, 1.129926, 0.4584042, 1, 1, 1, 1, 1,
0.03105438, -0.495404, 2.784098, 1, 1, 1, 1, 1,
0.03319764, 0.9258178, -2.376343, 1, 1, 1, 1, 1,
0.03341983, 2.345806, 0.651447, 0, 0, 1, 1, 1,
0.03534488, -0.692941, 2.986894, 1, 0, 0, 1, 1,
0.0356411, 0.4312151, -0.7347976, 1, 0, 0, 1, 1,
0.04104769, -0.4470047, 2.154159, 1, 0, 0, 1, 1,
0.04311807, -0.8147742, 2.581619, 1, 0, 0, 1, 1,
0.04410093, 0.1758951, 0.9142488, 1, 0, 0, 1, 1,
0.04544339, 0.8148612, 0.671276, 0, 0, 0, 1, 1,
0.04952515, -0.9207539, 3.188777, 0, 0, 0, 1, 1,
0.05483234, -0.01358207, 1.738682, 0, 0, 0, 1, 1,
0.05587988, -1.33376, 4.000285, 0, 0, 0, 1, 1,
0.06144845, -0.1445211, 2.604548, 0, 0, 0, 1, 1,
0.06313223, -2.262551, 2.855142, 0, 0, 0, 1, 1,
0.06411657, -0.02050223, 3.08302, 0, 0, 0, 1, 1,
0.06445565, -0.3537032, 3.440916, 1, 1, 1, 1, 1,
0.06719661, -0.0005845603, 0.1118471, 1, 1, 1, 1, 1,
0.07334338, -0.07808077, 3.032402, 1, 1, 1, 1, 1,
0.07435922, -1.256375, 2.529285, 1, 1, 1, 1, 1,
0.074545, 0.3666099, 3.772295, 1, 1, 1, 1, 1,
0.07704743, 0.1426765, -1.044912, 1, 1, 1, 1, 1,
0.07953938, 1.139506, -0.8904814, 1, 1, 1, 1, 1,
0.08632486, 0.2309423, 2.518454, 1, 1, 1, 1, 1,
0.08760294, -0.4253015, 2.296686, 1, 1, 1, 1, 1,
0.08835776, 1.785771, -0.2179463, 1, 1, 1, 1, 1,
0.0956568, 0.6297524, 0.9675277, 1, 1, 1, 1, 1,
0.09985281, -1.181432, 2.384689, 1, 1, 1, 1, 1,
0.1001132, -0.8900965, 3.335859, 1, 1, 1, 1, 1,
0.1017863, 1.417286, 0.6834546, 1, 1, 1, 1, 1,
0.1117261, -1.326739, 1.935229, 1, 1, 1, 1, 1,
0.1119942, -0.07728945, 2.752015, 0, 0, 1, 1, 1,
0.1123783, -0.5593589, 3.103335, 1, 0, 0, 1, 1,
0.1156063, -0.1853272, 2.2692, 1, 0, 0, 1, 1,
0.116084, -0.8385924, 3.792438, 1, 0, 0, 1, 1,
0.1192146, 1.06047, 0.8182603, 1, 0, 0, 1, 1,
0.1193501, -0.1415699, 2.080678, 1, 0, 0, 1, 1,
0.1221034, 0.02612151, -0.16311, 0, 0, 0, 1, 1,
0.1232331, 3.139975, -0.750415, 0, 0, 0, 1, 1,
0.1350707, -0.1383124, 3.370778, 0, 0, 0, 1, 1,
0.1352599, -0.2210985, 1.803375, 0, 0, 0, 1, 1,
0.135789, -0.5874501, 2.717834, 0, 0, 0, 1, 1,
0.1376091, 0.7560687, -1.39697, 0, 0, 0, 1, 1,
0.1409407, 0.902317, 0.6285961, 0, 0, 0, 1, 1,
0.1437342, 1.705833, -1.268116, 1, 1, 1, 1, 1,
0.1499281, -0.5969106, 4.102797, 1, 1, 1, 1, 1,
0.152963, 1.442402, 1.346374, 1, 1, 1, 1, 1,
0.1579487, 1.353018, -0.7923, 1, 1, 1, 1, 1,
0.162491, -1.307261, 3.851245, 1, 1, 1, 1, 1,
0.1671937, 0.5347495, 1.550475, 1, 1, 1, 1, 1,
0.1704982, 1.205163, -0.5765022, 1, 1, 1, 1, 1,
0.1781582, 2.853203, -1.279633, 1, 1, 1, 1, 1,
0.1887655, -0.9594758, 3.859032, 1, 1, 1, 1, 1,
0.1965822, -0.8669567, 3.571267, 1, 1, 1, 1, 1,
0.1989529, -1.028375, 4.311938, 1, 1, 1, 1, 1,
0.2046655, -1.277172, 3.539506, 1, 1, 1, 1, 1,
0.210553, 0.09461856, -0.2405424, 1, 1, 1, 1, 1,
0.2107095, 0.1871052, 1.55506, 1, 1, 1, 1, 1,
0.2175188, 1.859468, -0.141987, 1, 1, 1, 1, 1,
0.2198452, 0.7287744, 0.5285166, 0, 0, 1, 1, 1,
0.2211794, 0.1643974, 1.715035, 1, 0, 0, 1, 1,
0.2258682, -0.5069464, 2.708735, 1, 0, 0, 1, 1,
0.2304317, 0.1298382, 1.745382, 1, 0, 0, 1, 1,
0.2355368, -0.7724549, 1.634589, 1, 0, 0, 1, 1,
0.2357603, -0.9953988, 2.614867, 1, 0, 0, 1, 1,
0.2363612, 0.8447528, -0.1419368, 0, 0, 0, 1, 1,
0.2366968, 1.943615, 1.492147, 0, 0, 0, 1, 1,
0.2418161, 1.363844, 0.1674116, 0, 0, 0, 1, 1,
0.2475828, -0.09881566, 1.854688, 0, 0, 0, 1, 1,
0.2496532, -1.503222, 4.611713, 0, 0, 0, 1, 1,
0.2515384, 2.100094, -0.8306078, 0, 0, 0, 1, 1,
0.2566348, 0.2802519, 0.6726322, 0, 0, 0, 1, 1,
0.256831, -0.09686186, 1.673654, 1, 1, 1, 1, 1,
0.2572805, 1.349679, -0.3208976, 1, 1, 1, 1, 1,
0.2579531, -0.5386651, 2.480747, 1, 1, 1, 1, 1,
0.2621114, 1.119077, -0.8590448, 1, 1, 1, 1, 1,
0.2626403, -2.316484, 3.216174, 1, 1, 1, 1, 1,
0.2662702, 1.240299, -0.8638348, 1, 1, 1, 1, 1,
0.2717564, 0.7017399, 1.742108, 1, 1, 1, 1, 1,
0.2718257, 0.6284195, -0.06411414, 1, 1, 1, 1, 1,
0.2737634, 0.1471064, 0.9160249, 1, 1, 1, 1, 1,
0.2745939, 0.2596047, 2.578012, 1, 1, 1, 1, 1,
0.2746381, 0.1808183, -0.5170671, 1, 1, 1, 1, 1,
0.2748542, -0.2234827, -0.3016862, 1, 1, 1, 1, 1,
0.2752332, -0.5667079, 3.886178, 1, 1, 1, 1, 1,
0.2776111, 0.1539382, 2.123747, 1, 1, 1, 1, 1,
0.2782583, -0.1041387, 2.22178, 1, 1, 1, 1, 1,
0.2782824, -0.2101642, 2.654572, 0, 0, 1, 1, 1,
0.2812218, -0.1931998, 2.639829, 1, 0, 0, 1, 1,
0.2909833, -1.046726, 2.368077, 1, 0, 0, 1, 1,
0.291539, 0.08427969, 1.038142, 1, 0, 0, 1, 1,
0.2959879, 0.8433596, 1.199926, 1, 0, 0, 1, 1,
0.2978731, 0.6082931, 1.212955, 1, 0, 0, 1, 1,
0.2979088, 0.8573422, 1.234619, 0, 0, 0, 1, 1,
0.2993823, -1.116359, 1.103531, 0, 0, 0, 1, 1,
0.3007244, 1.534183, 0.3946868, 0, 0, 0, 1, 1,
0.3008815, -0.8195812, 2.918797, 0, 0, 0, 1, 1,
0.301136, 0.645839, -1.276754, 0, 0, 0, 1, 1,
0.3049208, -1.240827, 1.884289, 0, 0, 0, 1, 1,
0.3052325, 1.336787, -0.9283824, 0, 0, 0, 1, 1,
0.3123554, 0.02401931, 1.309824, 1, 1, 1, 1, 1,
0.315279, -0.9996977, 2.363616, 1, 1, 1, 1, 1,
0.318924, 0.9753119, -0.9809418, 1, 1, 1, 1, 1,
0.32099, -0.7797966, 4.507682, 1, 1, 1, 1, 1,
0.3223378, -0.3945528, 2.786194, 1, 1, 1, 1, 1,
0.3228776, 0.2671108, 1.929343, 1, 1, 1, 1, 1,
0.3255959, 0.9219846, -1.24686, 1, 1, 1, 1, 1,
0.3270279, 0.5970268, 2.397851, 1, 1, 1, 1, 1,
0.3275533, -1.500733, 2.911314, 1, 1, 1, 1, 1,
0.3292126, -0.2346498, 1.962816, 1, 1, 1, 1, 1,
0.3295958, 1.116286, -0.3345082, 1, 1, 1, 1, 1,
0.3339804, -0.5822107, 3.777088, 1, 1, 1, 1, 1,
0.3368714, 0.5012582, -0.1882617, 1, 1, 1, 1, 1,
0.3387536, 0.8748248, 0.2576161, 1, 1, 1, 1, 1,
0.3407153, 2.927012, 2.180699, 1, 1, 1, 1, 1,
0.3408293, 1.644068, -1.06939, 0, 0, 1, 1, 1,
0.343768, 0.4483289, 2.226872, 1, 0, 0, 1, 1,
0.3460894, -1.392685, 2.302809, 1, 0, 0, 1, 1,
0.3475573, -1.707468, 2.419047, 1, 0, 0, 1, 1,
0.347583, -0.1512918, 2.192683, 1, 0, 0, 1, 1,
0.3488014, 0.6623972, 2.057513, 1, 0, 0, 1, 1,
0.3519449, -1.835787, 2.629567, 0, 0, 0, 1, 1,
0.3552128, 0.1859557, 1.125584, 0, 0, 0, 1, 1,
0.3581318, -0.8687397, 4.001518, 0, 0, 0, 1, 1,
0.3649963, 0.06836074, 2.201951, 0, 0, 0, 1, 1,
0.3661048, 0.04382398, 2.002703, 0, 0, 0, 1, 1,
0.3667889, -0.0524167, 2.156971, 0, 0, 0, 1, 1,
0.3683973, -0.1357198, 1.184917, 0, 0, 0, 1, 1,
0.3695392, -0.3582384, 4.591465, 1, 1, 1, 1, 1,
0.3721306, 2.734195, -1.311863, 1, 1, 1, 1, 1,
0.3750995, -1.562596, 3.485929, 1, 1, 1, 1, 1,
0.3791931, 1.20464, 0.3031543, 1, 1, 1, 1, 1,
0.384829, -0.901791, 1.226217, 1, 1, 1, 1, 1,
0.3849909, 0.7675459, 0.6643441, 1, 1, 1, 1, 1,
0.3851356, 0.7664266, 0.585688, 1, 1, 1, 1, 1,
0.3868085, 0.341248, 0.2096701, 1, 1, 1, 1, 1,
0.3876526, -0.3119459, 0.731527, 1, 1, 1, 1, 1,
0.3879523, -0.348093, 0.4801785, 1, 1, 1, 1, 1,
0.3894977, -1.177027, 3.820277, 1, 1, 1, 1, 1,
0.3924233, -0.9194779, 2.711528, 1, 1, 1, 1, 1,
0.3970518, 0.5217382, -0.9380991, 1, 1, 1, 1, 1,
0.3972892, -0.7812583, 3.316739, 1, 1, 1, 1, 1,
0.3994122, -0.6209431, 0.6853709, 1, 1, 1, 1, 1,
0.4011832, -2.695443, 3.632776, 0, 0, 1, 1, 1,
0.4026472, -1.714236, 1.706276, 1, 0, 0, 1, 1,
0.4047368, -0.8441463, 4.150657, 1, 0, 0, 1, 1,
0.4064191, -0.5924622, 1.860091, 1, 0, 0, 1, 1,
0.4144885, 0.4164053, 2.752561, 1, 0, 0, 1, 1,
0.4184713, -0.4141788, 2.008942, 1, 0, 0, 1, 1,
0.419692, 0.7828216, -0.5205655, 0, 0, 0, 1, 1,
0.4203367, 1.501653, -1.20592, 0, 0, 0, 1, 1,
0.4212876, 0.7333924, 2.168004, 0, 0, 0, 1, 1,
0.4218539, -0.2296723, -0.8084874, 0, 0, 0, 1, 1,
0.4228722, -0.1071388, 1.429085, 0, 0, 0, 1, 1,
0.4234003, 1.026554, 0.207558, 0, 0, 0, 1, 1,
0.4343355, 0.7425292, 0.4833433, 0, 0, 0, 1, 1,
0.4345453, -0.004679543, 2.092208, 1, 1, 1, 1, 1,
0.4392437, 0.1921313, -0.2372946, 1, 1, 1, 1, 1,
0.4394812, -0.9753855, 2.321374, 1, 1, 1, 1, 1,
0.4424056, -0.85822, 2.257488, 1, 1, 1, 1, 1,
0.4428863, 1.665477, 0.6030091, 1, 1, 1, 1, 1,
0.4434778, -1.472822, 2.327905, 1, 1, 1, 1, 1,
0.4472618, -0.4221063, 3.140955, 1, 1, 1, 1, 1,
0.4529643, -1.738864, 3.969392, 1, 1, 1, 1, 1,
0.4532733, 1.04803, 1.177294, 1, 1, 1, 1, 1,
0.4576025, -0.1806182, 3.083263, 1, 1, 1, 1, 1,
0.4604001, 1.209301, -0.2362799, 1, 1, 1, 1, 1,
0.4674353, 1.149674, -1.016441, 1, 1, 1, 1, 1,
0.4695347, -1.871967, 1.618686, 1, 1, 1, 1, 1,
0.4716653, 1.367688, -0.8541127, 1, 1, 1, 1, 1,
0.4741201, 0.1304561, -0.2041727, 1, 1, 1, 1, 1,
0.4743778, 0.2678428, -1.095856, 0, 0, 1, 1, 1,
0.4784548, -0.1407157, 1.594632, 1, 0, 0, 1, 1,
0.4798488, -0.09267978, 4.194043, 1, 0, 0, 1, 1,
0.4818014, 0.3758061, 1.163201, 1, 0, 0, 1, 1,
0.4841642, 1.066876, 1.469834, 1, 0, 0, 1, 1,
0.4845718, -0.9008557, 2.968502, 1, 0, 0, 1, 1,
0.48494, 1.48503, -0.7719331, 0, 0, 0, 1, 1,
0.486205, -1.659651, 1.98619, 0, 0, 0, 1, 1,
0.4871293, 1.161787, 0.7693979, 0, 0, 0, 1, 1,
0.4883748, -0.2278658, 3.23324, 0, 0, 0, 1, 1,
0.4917896, -0.3595566, 1.543258, 0, 0, 0, 1, 1,
0.4932035, 0.1300218, 1.523898, 0, 0, 0, 1, 1,
0.4937731, 0.3241081, -0.3484245, 0, 0, 0, 1, 1,
0.4980918, 0.5090919, 0.9135136, 1, 1, 1, 1, 1,
0.4997424, 1.301485, 0.0544927, 1, 1, 1, 1, 1,
0.5003312, -0.07514953, 2.28429, 1, 1, 1, 1, 1,
0.5020916, -0.4745539, 0.9748992, 1, 1, 1, 1, 1,
0.5037408, 0.8678755, 1.458036, 1, 1, 1, 1, 1,
0.5043829, -0.5176648, 3.284365, 1, 1, 1, 1, 1,
0.5061249, 0.5386015, 0.06632219, 1, 1, 1, 1, 1,
0.5105159, -0.06857462, 1.786428, 1, 1, 1, 1, 1,
0.5158033, 0.7947416, 0.1509604, 1, 1, 1, 1, 1,
0.5262468, -0.6976138, 3.269464, 1, 1, 1, 1, 1,
0.5302833, -1.472536, 4.041207, 1, 1, 1, 1, 1,
0.5417449, -0.2860709, 2.134964, 1, 1, 1, 1, 1,
0.5456035, -0.3557906, 3.110537, 1, 1, 1, 1, 1,
0.5477942, -1.853214, 2.408352, 1, 1, 1, 1, 1,
0.5519022, 1.620391, 0.4817526, 1, 1, 1, 1, 1,
0.5563996, 0.7458815, -0.9313534, 0, 0, 1, 1, 1,
0.5619326, 1.109644, 0.06038041, 1, 0, 0, 1, 1,
0.5638175, 0.4985392, 1.574476, 1, 0, 0, 1, 1,
0.5650334, -0.9602185, 2.359856, 1, 0, 0, 1, 1,
0.5655693, 0.01180378, 2.576016, 1, 0, 0, 1, 1,
0.5676486, 0.3006848, 2.063098, 1, 0, 0, 1, 1,
0.5730985, -2.368507, 3.472783, 0, 0, 0, 1, 1,
0.5803239, 0.5364723, 0.6352134, 0, 0, 0, 1, 1,
0.5869629, 0.5542307, 1.456714, 0, 0, 0, 1, 1,
0.5921286, -0.6856888, 3.960233, 0, 0, 0, 1, 1,
0.5957003, 1.065312, -0.5315551, 0, 0, 0, 1, 1,
0.5970529, -0.4213057, 1.550663, 0, 0, 0, 1, 1,
0.598799, -0.3036586, 2.694925, 0, 0, 0, 1, 1,
0.6008583, 1.09554, -0.5750217, 1, 1, 1, 1, 1,
0.6040638, 0.9134089, 0.8831312, 1, 1, 1, 1, 1,
0.6102944, -1.226542, 2.836209, 1, 1, 1, 1, 1,
0.613965, 1.382641, 0.2766255, 1, 1, 1, 1, 1,
0.614818, -0.4834061, 4.075711, 1, 1, 1, 1, 1,
0.614924, -1.244086, 2.478513, 1, 1, 1, 1, 1,
0.6186051, 0.4728798, 2.351135, 1, 1, 1, 1, 1,
0.6249861, 0.1068486, 0.700725, 1, 1, 1, 1, 1,
0.6262325, -1.321654, 3.350071, 1, 1, 1, 1, 1,
0.6270271, 0.823701, 0.9250569, 1, 1, 1, 1, 1,
0.6272101, 1.11997, 0.06185517, 1, 1, 1, 1, 1,
0.6310714, 0.1468625, 2.671885, 1, 1, 1, 1, 1,
0.6313029, -1.685087, 1.405679, 1, 1, 1, 1, 1,
0.6327461, -1.211884, 3.328889, 1, 1, 1, 1, 1,
0.6371447, -0.03626178, 1.187838, 1, 1, 1, 1, 1,
0.6381836, 1.296243, 0.3997917, 0, 0, 1, 1, 1,
0.6383229, 0.5471789, 2.739896, 1, 0, 0, 1, 1,
0.641501, -0.2025023, -1.060776, 1, 0, 0, 1, 1,
0.643865, 1.41473, 1.344439, 1, 0, 0, 1, 1,
0.6459414, -0.1394556, 2.700008, 1, 0, 0, 1, 1,
0.6581023, 0.1356319, 2.217808, 1, 0, 0, 1, 1,
0.6620669, 0.3833361, 1.584708, 0, 0, 0, 1, 1,
0.6742153, 0.7922654, 0.2843633, 0, 0, 0, 1, 1,
0.677223, 3.117448, 0.7401947, 0, 0, 0, 1, 1,
0.6836642, 1.038412, 1.297888, 0, 0, 0, 1, 1,
0.684062, -0.892589, 1.977767, 0, 0, 0, 1, 1,
0.6847359, -0.1145793, 2.696535, 0, 0, 0, 1, 1,
0.6848984, -0.2545633, 0.9064304, 0, 0, 0, 1, 1,
0.6859365, -2.876473, 3.978418, 1, 1, 1, 1, 1,
0.6919795, -0.7888046, 1.143302, 1, 1, 1, 1, 1,
0.6966095, -0.955331, 1.434289, 1, 1, 1, 1, 1,
0.6974192, 0.4701233, 0.9608428, 1, 1, 1, 1, 1,
0.7075275, 0.3668201, 3.015525, 1, 1, 1, 1, 1,
0.7104754, 0.2465897, 1.882337, 1, 1, 1, 1, 1,
0.7167426, -0.2131059, 0.1565919, 1, 1, 1, 1, 1,
0.7204183, 0.5440122, 1.10219, 1, 1, 1, 1, 1,
0.7205914, -0.3226128, 2.254576, 1, 1, 1, 1, 1,
0.7217248, 0.2625384, 0.1866921, 1, 1, 1, 1, 1,
0.7217851, 1.730851, 0.4940172, 1, 1, 1, 1, 1,
0.726153, 0.03800138, 2.137382, 1, 1, 1, 1, 1,
0.7356441, 0.4073035, 1.935036, 1, 1, 1, 1, 1,
0.7362148, 0.09557144, 2.280197, 1, 1, 1, 1, 1,
0.7368065, -0.06962081, 2.184176, 1, 1, 1, 1, 1,
0.7438706, 0.4527747, 0.01983215, 0, 0, 1, 1, 1,
0.7443713, -0.6901429, 0.3755849, 1, 0, 0, 1, 1,
0.748872, -0.3069091, 2.212749, 1, 0, 0, 1, 1,
0.7500299, -0.3150343, 2.440781, 1, 0, 0, 1, 1,
0.7506572, -0.3699314, 1.392762, 1, 0, 0, 1, 1,
0.7529583, 0.8011702, 1.552613, 1, 0, 0, 1, 1,
0.7537392, -0.7879095, 3.142021, 0, 0, 0, 1, 1,
0.7576684, 0.5735089, 1.661562, 0, 0, 0, 1, 1,
0.7581255, -0.984746, 3.170959, 0, 0, 0, 1, 1,
0.7596413, -0.3361875, 2.634665, 0, 0, 0, 1, 1,
0.7598816, 1.858226, 0.4964048, 0, 0, 0, 1, 1,
0.7618626, 0.1439077, 1.147366, 0, 0, 0, 1, 1,
0.7632529, -0.9286575, 3.052076, 0, 0, 0, 1, 1,
0.7698789, 0.07533029, 1.599279, 1, 1, 1, 1, 1,
0.7701412, -0.3967982, 2.039846, 1, 1, 1, 1, 1,
0.7769557, -0.2560708, 2.201267, 1, 1, 1, 1, 1,
0.7782924, 0.4421029, 1.980706, 1, 1, 1, 1, 1,
0.7789041, -1.556057, 2.583267, 1, 1, 1, 1, 1,
0.7791206, 0.4087454, -1.3643, 1, 1, 1, 1, 1,
0.7802827, 0.7667522, 1.28203, 1, 1, 1, 1, 1,
0.7889978, -0.4836575, 1.358767, 1, 1, 1, 1, 1,
0.790648, 0.4330441, 0.9149306, 1, 1, 1, 1, 1,
0.7912785, -0.9955031, 3.29074, 1, 1, 1, 1, 1,
0.7946379, 1.39826, 2.610017, 1, 1, 1, 1, 1,
0.7951539, 0.7385983, 2.440949, 1, 1, 1, 1, 1,
0.7951849, 0.07638171, 1.107811, 1, 1, 1, 1, 1,
0.7964938, 0.005000345, 2.019631, 1, 1, 1, 1, 1,
0.8034037, -0.8154556, 3.167472, 1, 1, 1, 1, 1,
0.8070955, -1.070373, 4.580981, 0, 0, 1, 1, 1,
0.8087018, -0.1472929, 3.202249, 1, 0, 0, 1, 1,
0.8151988, -0.7226644, 2.168508, 1, 0, 0, 1, 1,
0.818556, -1.702948, 4.478422, 1, 0, 0, 1, 1,
0.8189504, -0.3661795, 1.786435, 1, 0, 0, 1, 1,
0.8208892, 0.09347057, 0.9737099, 1, 0, 0, 1, 1,
0.8233875, -0.2539482, -0.000237111, 0, 0, 0, 1, 1,
0.8237517, -0.48006, 1.941466, 0, 0, 0, 1, 1,
0.8262848, -1.222535, 2.582368, 0, 0, 0, 1, 1,
0.8266536, -1.721102, 3.198905, 0, 0, 0, 1, 1,
0.8293123, -0.962989, 1.491585, 0, 0, 0, 1, 1,
0.8339573, 1.554599, -0.4327909, 0, 0, 0, 1, 1,
0.8343984, 0.5512114, -0.2399937, 0, 0, 0, 1, 1,
0.8344915, -0.8391723, 2.925783, 1, 1, 1, 1, 1,
0.8413644, -1.027696, 2.408035, 1, 1, 1, 1, 1,
0.8485721, 0.452311, 1.318493, 1, 1, 1, 1, 1,
0.850325, -1.14195, 3.85021, 1, 1, 1, 1, 1,
0.8554642, 1.66942, 1.827404, 1, 1, 1, 1, 1,
0.8561811, 0.9152794, 1.05162, 1, 1, 1, 1, 1,
0.8602347, -2.855206, 1.774248, 1, 1, 1, 1, 1,
0.8631793, 0.8048116, 1.384033, 1, 1, 1, 1, 1,
0.8717397, -1.130636, 2.078236, 1, 1, 1, 1, 1,
0.8806958, -0.7342327, 2.481064, 1, 1, 1, 1, 1,
0.8838757, -0.1710777, 3.840736, 1, 1, 1, 1, 1,
0.8874298, 0.003492516, 1.359242, 1, 1, 1, 1, 1,
0.8919421, 1.451225, 0.3595752, 1, 1, 1, 1, 1,
0.8938844, 0.9823907, -0.07874222, 1, 1, 1, 1, 1,
0.8976042, -0.09752519, 1.87772, 1, 1, 1, 1, 1,
0.9012892, 0.7695972, 0.06247113, 0, 0, 1, 1, 1,
0.9027722, 0.311069, 1.974387, 1, 0, 0, 1, 1,
0.9039752, -0.5367953, 2.877239, 1, 0, 0, 1, 1,
0.9065181, -0.6178535, 2.524499, 1, 0, 0, 1, 1,
0.9074447, 2.257701, 0.07455321, 1, 0, 0, 1, 1,
0.908478, 0.7172402, 0.05066669, 1, 0, 0, 1, 1,
0.9125837, -0.3019334, 3.068431, 0, 0, 0, 1, 1,
0.9205641, 2.05659, 1.735141, 0, 0, 0, 1, 1,
0.9278452, -0.5548139, 3.020978, 0, 0, 0, 1, 1,
0.931123, 0.1630894, 0.0951625, 0, 0, 0, 1, 1,
0.9389, 0.8694635, 1.620264, 0, 0, 0, 1, 1,
0.9412528, 0.434936, 0.09577098, 0, 0, 0, 1, 1,
0.9453897, -1.595129, 2.926655, 0, 0, 0, 1, 1,
0.9455402, 1.019309, -0.2278651, 1, 1, 1, 1, 1,
0.9546873, 0.6121796, -0.5823236, 1, 1, 1, 1, 1,
0.956638, 0.3177976, 1.946192, 1, 1, 1, 1, 1,
0.962952, -0.02368595, 0.8104213, 1, 1, 1, 1, 1,
0.9657782, 0.2540262, 1.428755, 1, 1, 1, 1, 1,
0.9696624, 0.5943735, -0.2779314, 1, 1, 1, 1, 1,
0.9708605, 0.1817288, -0.6729763, 1, 1, 1, 1, 1,
0.9762385, 0.4782594, 2.665416, 1, 1, 1, 1, 1,
0.980309, 2.018356, 0.6881703, 1, 1, 1, 1, 1,
0.9835051, 0.8234794, 1.76356, 1, 1, 1, 1, 1,
0.9958287, 0.4446751, 0.4647301, 1, 1, 1, 1, 1,
1.002542, 0.01323058, 1.737483, 1, 1, 1, 1, 1,
1.013928, -0.7569932, 1.771793, 1, 1, 1, 1, 1,
1.021985, 1.346124, 2.326565, 1, 1, 1, 1, 1,
1.025425, -0.3911388, 1.190464, 1, 1, 1, 1, 1,
1.026268, -1.912131, 0.9009448, 0, 0, 1, 1, 1,
1.03156, 0.2815982, 1.534351, 1, 0, 0, 1, 1,
1.033554, 1.344122, 0.4005818, 1, 0, 0, 1, 1,
1.050744, 0.4979327, 0.5988207, 1, 0, 0, 1, 1,
1.058811, -0.7025908, 2.169989, 1, 0, 0, 1, 1,
1.06993, -0.5943403, 1.545726, 1, 0, 0, 1, 1,
1.071004, 1.424044, 1.587463, 0, 0, 0, 1, 1,
1.075893, 0.1176144, 2.41428, 0, 0, 0, 1, 1,
1.07831, 1.227834, -0.07268669, 0, 0, 0, 1, 1,
1.082479, 0.5049483, 0.01879988, 0, 0, 0, 1, 1,
1.084805, 0.1879352, 2.009366, 0, 0, 0, 1, 1,
1.091882, -1.089764, 0.8800018, 0, 0, 0, 1, 1,
1.099473, 0.1823246, 0.9918464, 0, 0, 0, 1, 1,
1.102951, 0.4268518, -0.1559948, 1, 1, 1, 1, 1,
1.106644, 0.6700757, 2.174668, 1, 1, 1, 1, 1,
1.116793, 0.06931552, 2.094844, 1, 1, 1, 1, 1,
1.118663, 1.095971, 0.1525724, 1, 1, 1, 1, 1,
1.124974, -2.7199, 5.388993, 1, 1, 1, 1, 1,
1.1283, 1.667428, 1.326106, 1, 1, 1, 1, 1,
1.129953, 0.4490055, 0.001807945, 1, 1, 1, 1, 1,
1.132536, 1.213491, 0.7088009, 1, 1, 1, 1, 1,
1.145213, 0.6604664, 3.014657, 1, 1, 1, 1, 1,
1.148019, 1.767354, 1.110321, 1, 1, 1, 1, 1,
1.148481, -0.2392284, 0.5504351, 1, 1, 1, 1, 1,
1.163698, 2.084135, 0.1012299, 1, 1, 1, 1, 1,
1.164227, 1.401435, 1.922079, 1, 1, 1, 1, 1,
1.16524, 1.475576, 0.1295041, 1, 1, 1, 1, 1,
1.169632, -1.119918, 1.86885, 1, 1, 1, 1, 1,
1.170271, -0.9571908, 1.79778, 0, 0, 1, 1, 1,
1.170274, 0.2057193, -0.5043028, 1, 0, 0, 1, 1,
1.172322, 0.2218305, -0.6325853, 1, 0, 0, 1, 1,
1.17636, -0.2142239, 0.4400834, 1, 0, 0, 1, 1,
1.177408, 1.599775, 0.7317624, 1, 0, 0, 1, 1,
1.178769, 0.02719912, 2.319347, 1, 0, 0, 1, 1,
1.184369, 0.4544888, 0.6718122, 0, 0, 0, 1, 1,
1.187111, 0.4965923, 0.9566621, 0, 0, 0, 1, 1,
1.193807, -0.06097156, 2.022641, 0, 0, 0, 1, 1,
1.19779, 0.5271585, 1.962535, 0, 0, 0, 1, 1,
1.197973, -1.847837, 4.260796, 0, 0, 0, 1, 1,
1.213801, -1.471699, 3.773847, 0, 0, 0, 1, 1,
1.225298, -1.200397, 1.402564, 0, 0, 0, 1, 1,
1.227335, -1.603743, 2.320766, 1, 1, 1, 1, 1,
1.231089, 1.705426, 1.814171, 1, 1, 1, 1, 1,
1.23319, -0.7250152, 2.359506, 1, 1, 1, 1, 1,
1.234448, 0.07226485, 2.29913, 1, 1, 1, 1, 1,
1.236241, -0.9500046, 2.88163, 1, 1, 1, 1, 1,
1.240181, -0.6553705, 2.583517, 1, 1, 1, 1, 1,
1.24741, -0.2718261, 2.578811, 1, 1, 1, 1, 1,
1.256891, -1.707741, 2.081327, 1, 1, 1, 1, 1,
1.258828, 1.444365, 2.537669, 1, 1, 1, 1, 1,
1.25951, 0.8183147, 0.9233828, 1, 1, 1, 1, 1,
1.261354, -0.6754136, 2.212973, 1, 1, 1, 1, 1,
1.278384, 1.973063, -1.279066, 1, 1, 1, 1, 1,
1.280274, -1.139877, 2.654962, 1, 1, 1, 1, 1,
1.288582, 0.5125372, 2.216934, 1, 1, 1, 1, 1,
1.293185, -0.006301935, 1.807909, 1, 1, 1, 1, 1,
1.298738, 1.368016, -0.1477687, 0, 0, 1, 1, 1,
1.313019, 0.1042954, 2.865522, 1, 0, 0, 1, 1,
1.327339, 0.8666479, 2.033159, 1, 0, 0, 1, 1,
1.339023, 1.309156, 1.573555, 1, 0, 0, 1, 1,
1.341503, 0.9249948, -0.6168205, 1, 0, 0, 1, 1,
1.344377, 0.13102, 0.8820509, 1, 0, 0, 1, 1,
1.34965, -1.424086, 3.680481, 0, 0, 0, 1, 1,
1.353158, 0.6213385, 1.554278, 0, 0, 0, 1, 1,
1.360617, 0.1924979, 1.271841, 0, 0, 0, 1, 1,
1.376989, -0.7936336, 1.437163, 0, 0, 0, 1, 1,
1.390612, 2.732266, 0.4115238, 0, 0, 0, 1, 1,
1.391141, 0.9326433, 0.8871707, 0, 0, 0, 1, 1,
1.392919, -0.5286745, 1.69264, 0, 0, 0, 1, 1,
1.396639, -0.1206747, 1.362028, 1, 1, 1, 1, 1,
1.407651, -0.1792072, 1.093522, 1, 1, 1, 1, 1,
1.438694, 1.218894, -0.5105057, 1, 1, 1, 1, 1,
1.445698, 0.327308, 1.412629, 1, 1, 1, 1, 1,
1.453302, 2.063317, 0.6135321, 1, 1, 1, 1, 1,
1.460387, 0.7821194, 0.4702778, 1, 1, 1, 1, 1,
1.46065, 1.931727, -1.696687, 1, 1, 1, 1, 1,
1.467303, 0.3172678, 1.807678, 1, 1, 1, 1, 1,
1.474845, -1.409955, 3.596929, 1, 1, 1, 1, 1,
1.484794, -0.1386561, 3.079258, 1, 1, 1, 1, 1,
1.496485, 0.4353159, 3.082228, 1, 1, 1, 1, 1,
1.501557, 0.8480435, 1.6331, 1, 1, 1, 1, 1,
1.502326, 0.2487762, 0.04436007, 1, 1, 1, 1, 1,
1.511905, -0.1279068, 2.246094, 1, 1, 1, 1, 1,
1.526876, 1.017079, 1.935319, 1, 1, 1, 1, 1,
1.539237, -0.4156103, 2.161356, 0, 0, 1, 1, 1,
1.539985, -1.272752, 2.743175, 1, 0, 0, 1, 1,
1.542752, -0.009884882, 0.8697313, 1, 0, 0, 1, 1,
1.555604, -0.4121253, 1.293863, 1, 0, 0, 1, 1,
1.561837, -1.146873, 1.933131, 1, 0, 0, 1, 1,
1.563068, -1.003305, 1.41701, 1, 0, 0, 1, 1,
1.564094, -0.1549427, 2.771877, 0, 0, 0, 1, 1,
1.573296, 0.2132801, 1.727563, 0, 0, 0, 1, 1,
1.573726, 0.4761896, 0.5849292, 0, 0, 0, 1, 1,
1.587588, -1.315874, 0.6824429, 0, 0, 0, 1, 1,
1.588836, 1.371897, -0.5030405, 0, 0, 0, 1, 1,
1.594719, -1.565593, 1.740976, 0, 0, 0, 1, 1,
1.594839, -0.3273065, 3.485431, 0, 0, 0, 1, 1,
1.595326, -1.260626, 2.544481, 1, 1, 1, 1, 1,
1.601327, -0.1699251, 0.9497042, 1, 1, 1, 1, 1,
1.61211, 1.225098, 1.907527, 1, 1, 1, 1, 1,
1.616039, 1.03831, 2.35619, 1, 1, 1, 1, 1,
1.621229, 1.211892, 4.527697, 1, 1, 1, 1, 1,
1.626358, 0.5534359, 1.272129, 1, 1, 1, 1, 1,
1.629252, -0.1150454, 0.3897364, 1, 1, 1, 1, 1,
1.629755, 0.968908, 0.3887838, 1, 1, 1, 1, 1,
1.66594, 0.2687851, -0.03293249, 1, 1, 1, 1, 1,
1.669009, 1.459747, 2.193443, 1, 1, 1, 1, 1,
1.692146, 0.380737, 1.222227, 1, 1, 1, 1, 1,
1.710222, -0.8564598, 1.599548, 1, 1, 1, 1, 1,
1.710993, 0.05364519, 0.3668696, 1, 1, 1, 1, 1,
1.717243, 0.1164889, 1.459176, 1, 1, 1, 1, 1,
1.729576, 0.4098853, 1.159291, 1, 1, 1, 1, 1,
1.746565, 0.7161102, 1.130709, 0, 0, 1, 1, 1,
1.74657, -1.255961, 1.651098, 1, 0, 0, 1, 1,
1.768335, 0.9023873, 0.1236902, 1, 0, 0, 1, 1,
1.785326, -1.662408, 3.070692, 1, 0, 0, 1, 1,
1.795074, -1.170009, 1.89778, 1, 0, 0, 1, 1,
1.81738, -0.300685, 2.281129, 1, 0, 0, 1, 1,
1.835034, 0.06773125, 0.9583257, 0, 0, 0, 1, 1,
1.83524, 1.078964, 2.382155, 0, 0, 0, 1, 1,
1.848013, -1.142712, 0.9422681, 0, 0, 0, 1, 1,
1.864429, -0.4061842, 1.156813, 0, 0, 0, 1, 1,
1.867018, 1.537397, -0.1919437, 0, 0, 0, 1, 1,
1.881044, 0.7958508, 2.520062, 0, 0, 0, 1, 1,
1.912252, -1.283344, 1.037898, 0, 0, 0, 1, 1,
1.930918, -1.078051, 2.699172, 1, 1, 1, 1, 1,
1.932288, 0.2443145, 1.895366, 1, 1, 1, 1, 1,
1.974311, -0.2341241, 1.558519, 1, 1, 1, 1, 1,
1.978392, -0.969946, 1.089819, 1, 1, 1, 1, 1,
1.997109, -0.2633296, 3.235946, 1, 1, 1, 1, 1,
1.997656, -1.696833, 2.484771, 1, 1, 1, 1, 1,
2.024873, -0.1660763, 3.445582, 1, 1, 1, 1, 1,
2.068015, -0.7679136, 1.591266, 1, 1, 1, 1, 1,
2.091587, -1.246601, 1.254367, 1, 1, 1, 1, 1,
2.097322, 0.2085111, 0.09992304, 1, 1, 1, 1, 1,
2.131979, 0.7532474, 1.436251, 1, 1, 1, 1, 1,
2.160602, 1.516818, 0.3676386, 1, 1, 1, 1, 1,
2.19565, -0.6381063, 2.205824, 1, 1, 1, 1, 1,
2.205998, 1.415254, 1.025355, 1, 1, 1, 1, 1,
2.233538, -1.849489, -0.9400593, 1, 1, 1, 1, 1,
2.279937, 0.7767943, 2.065972, 0, 0, 1, 1, 1,
2.289966, -0.3982787, 2.027968, 1, 0, 0, 1, 1,
2.315534, -0.02768298, 1.828477, 1, 0, 0, 1, 1,
2.338702, -0.05061939, 0.3221105, 1, 0, 0, 1, 1,
2.394541, 1.589485, 1.339015, 1, 0, 0, 1, 1,
2.469397, 0.7205671, 1.100226, 1, 0, 0, 1, 1,
2.530107, 1.653698, 2.887237, 0, 0, 0, 1, 1,
2.569464, 0.4892927, 1.432847, 0, 0, 0, 1, 1,
2.616265, 0.3074545, 1.963102, 0, 0, 0, 1, 1,
2.618066, 0.8992228, -0.2197445, 0, 0, 0, 1, 1,
2.625592, 0.6996368, 1.455638, 0, 0, 0, 1, 1,
2.700234, 3.252211, 0.3564792, 0, 0, 0, 1, 1,
2.718264, 0.6083626, 1.039244, 0, 0, 0, 1, 1,
2.767084, -1.148603, 0.677378, 1, 1, 1, 1, 1,
2.867109, 0.8163214, 0.6245625, 1, 1, 1, 1, 1,
2.899452, -1.176481, 0.5705977, 1, 1, 1, 1, 1,
2.917274, -0.1260826, 2.681646, 1, 1, 1, 1, 1,
3.009204, -1.871737, 1.770474, 1, 1, 1, 1, 1,
3.030624, -0.9176949, 1.787958, 1, 1, 1, 1, 1,
3.293341, -1.482097, 1.232531, 1, 1, 1, 1, 1
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
var radius = 9.670781;
var distance = 33.96821;
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
mvMatrix.translate( -0.07314348, -0.1964641, 0.03652477 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96821);
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
