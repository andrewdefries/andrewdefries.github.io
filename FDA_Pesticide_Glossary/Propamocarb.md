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
-3.7046, 1.12474, -1.536777, 1, 0, 0, 1,
-3.223521, 0.4336264, -2.877044, 1, 0.007843138, 0, 1,
-2.872783, -0.8972219, -3.492791, 1, 0.01176471, 0, 1,
-2.686543, -0.09887476, -1.556521, 1, 0.01960784, 0, 1,
-2.627891, -2.403318, -1.038961, 1, 0.02352941, 0, 1,
-2.617725, -0.3052542, -3.313682, 1, 0.03137255, 0, 1,
-2.588443, -0.9079963, -1.109716, 1, 0.03529412, 0, 1,
-2.566408, 0.8163047, -2.022801, 1, 0.04313726, 0, 1,
-2.56144, -0.3630468, -2.406749, 1, 0.04705882, 0, 1,
-2.548244, 0.8551423, -0.9445387, 1, 0.05490196, 0, 1,
-2.537347, -0.6562736, 0.1996682, 1, 0.05882353, 0, 1,
-2.514232, -1.846029, -3.234266, 1, 0.06666667, 0, 1,
-2.38537, -0.05848625, -1.772684, 1, 0.07058824, 0, 1,
-2.272349, -0.6493769, -1.24049, 1, 0.07843138, 0, 1,
-2.264631, -1.028802, -2.090844, 1, 0.08235294, 0, 1,
-2.184714, 0.0763397, -0.2353613, 1, 0.09019608, 0, 1,
-2.177267, -0.6155422, 0.2043244, 1, 0.09411765, 0, 1,
-2.124292, 0.8686667, -1.909052, 1, 0.1019608, 0, 1,
-2.078754, 0.1909688, 0.05674403, 1, 0.1098039, 0, 1,
-2.076407, -1.657514, -2.986216, 1, 0.1137255, 0, 1,
-2.061202, 0.4992555, 0.3174911, 1, 0.1215686, 0, 1,
-1.961283, 0.5905017, -1.928437, 1, 0.1254902, 0, 1,
-1.949999, 0.05210502, -0.2687936, 1, 0.1333333, 0, 1,
-1.935481, -1.372859, -1.095737, 1, 0.1372549, 0, 1,
-1.876555, 1.415318, -0.4050308, 1, 0.145098, 0, 1,
-1.876443, 0.4221997, -1.503204, 1, 0.1490196, 0, 1,
-1.855196, 0.9096726, -1.071698, 1, 0.1568628, 0, 1,
-1.837165, 2.018388, -0.47973, 1, 0.1607843, 0, 1,
-1.82421, 0.5552611, -2.043678, 1, 0.1686275, 0, 1,
-1.800912, 0.4184917, -2.325642, 1, 0.172549, 0, 1,
-1.794549, -0.07377399, 0.6040587, 1, 0.1803922, 0, 1,
-1.791565, -0.5799755, -1.147393, 1, 0.1843137, 0, 1,
-1.7868, 1.109545, -1.549035, 1, 0.1921569, 0, 1,
-1.783128, 1.072254, -1.289375, 1, 0.1960784, 0, 1,
-1.778108, 1.305023, -0.7489591, 1, 0.2039216, 0, 1,
-1.755863, 0.6241891, -1.970063, 1, 0.2117647, 0, 1,
-1.748997, -1.596726, -0.9561012, 1, 0.2156863, 0, 1,
-1.732847, -0.05995165, -3.712092, 1, 0.2235294, 0, 1,
-1.729745, 0.17612, -1.232295, 1, 0.227451, 0, 1,
-1.724111, -0.05791027, -1.724492, 1, 0.2352941, 0, 1,
-1.722835, 1.49821, -0.5908318, 1, 0.2392157, 0, 1,
-1.717853, -0.09932889, -1.985285, 1, 0.2470588, 0, 1,
-1.713733, -1.4278, -1.548078, 1, 0.2509804, 0, 1,
-1.712626, -0.3210596, -1.578194, 1, 0.2588235, 0, 1,
-1.70104, 0.4702181, -0.290975, 1, 0.2627451, 0, 1,
-1.698357, -1.490944, -1.005352, 1, 0.2705882, 0, 1,
-1.698254, 0.138856, -0.5947409, 1, 0.2745098, 0, 1,
-1.685284, 1.070985, -1.703583, 1, 0.282353, 0, 1,
-1.674416, 0.2779804, -2.717134, 1, 0.2862745, 0, 1,
-1.665988, -0.5278106, -1.961259, 1, 0.2941177, 0, 1,
-1.652391, 0.6718289, -0.3583311, 1, 0.3019608, 0, 1,
-1.650253, -0.505275, -1.733018, 1, 0.3058824, 0, 1,
-1.618721, 1.797069, -0.3629976, 1, 0.3137255, 0, 1,
-1.61373, 0.5807273, -1.360518, 1, 0.3176471, 0, 1,
-1.604646, 0.1673003, -3.66789, 1, 0.3254902, 0, 1,
-1.582638, 0.3156019, -2.869353, 1, 0.3294118, 0, 1,
-1.545835, -1.363918, -2.766907, 1, 0.3372549, 0, 1,
-1.529719, -0.257392, -0.9740963, 1, 0.3411765, 0, 1,
-1.528979, -0.7631517, -2.951937, 1, 0.3490196, 0, 1,
-1.502927, 0.6926107, -0.5194342, 1, 0.3529412, 0, 1,
-1.492992, 0.8684298, -0.8731278, 1, 0.3607843, 0, 1,
-1.492896, 0.7153951, -0.6548739, 1, 0.3647059, 0, 1,
-1.485718, 1.007032, -3.378065, 1, 0.372549, 0, 1,
-1.484711, -0.8265128, -2.681391, 1, 0.3764706, 0, 1,
-1.465345, -0.01225922, -3.556043, 1, 0.3843137, 0, 1,
-1.459587, -0.6833439, -2.665511, 1, 0.3882353, 0, 1,
-1.454897, 1.791972, -0.862949, 1, 0.3960784, 0, 1,
-1.451859, -0.1499824, -1.201739, 1, 0.4039216, 0, 1,
-1.436652, -0.9679238, -2.784323, 1, 0.4078431, 0, 1,
-1.430079, -0.4242712, -2.632717, 1, 0.4156863, 0, 1,
-1.429808, 1.102676, -1.455524, 1, 0.4196078, 0, 1,
-1.427554, -0.3497318, -2.030039, 1, 0.427451, 0, 1,
-1.425485, -2.285951, -3.040211, 1, 0.4313726, 0, 1,
-1.412405, 0.6254013, 0.06583725, 1, 0.4392157, 0, 1,
-1.403743, 0.02403504, -2.363166, 1, 0.4431373, 0, 1,
-1.398265, -0.2771782, -2.40597, 1, 0.4509804, 0, 1,
-1.392004, -0.15582, -3.024258, 1, 0.454902, 0, 1,
-1.389377, 0.7731988, -2.926424, 1, 0.4627451, 0, 1,
-1.386637, -1.216259, -3.713115, 1, 0.4666667, 0, 1,
-1.384029, 0.1775574, -1.080586, 1, 0.4745098, 0, 1,
-1.363391, 0.4670693, -0.2026146, 1, 0.4784314, 0, 1,
-1.362279, 2.156521, -1.080815, 1, 0.4862745, 0, 1,
-1.352597, -0.7590969, -2.452441, 1, 0.4901961, 0, 1,
-1.343096, -0.8802172, -1.052723, 1, 0.4980392, 0, 1,
-1.341027, 1.539648, -0.01985562, 1, 0.5058824, 0, 1,
-1.336355, -0.7150488, -2.580172, 1, 0.509804, 0, 1,
-1.334349, 0.09014301, -0.8455465, 1, 0.5176471, 0, 1,
-1.333343, 0.3469169, -3.26175, 1, 0.5215687, 0, 1,
-1.329344, 0.2669138, -0.8186396, 1, 0.5294118, 0, 1,
-1.327788, -1.447364, -2.622041, 1, 0.5333334, 0, 1,
-1.324502, 0.7821022, -1.965363, 1, 0.5411765, 0, 1,
-1.318535, 1.088272, -1.037677, 1, 0.5450981, 0, 1,
-1.302661, 2.290035, 1.715895, 1, 0.5529412, 0, 1,
-1.301884, -1.611263, -1.11654, 1, 0.5568628, 0, 1,
-1.300064, 0.3441922, -2.188113, 1, 0.5647059, 0, 1,
-1.296395, 0.3305851, -1.855808, 1, 0.5686275, 0, 1,
-1.295585, -0.0297924, -1.312593, 1, 0.5764706, 0, 1,
-1.292788, 0.888319, -2.282149, 1, 0.5803922, 0, 1,
-1.289823, -0.626765, -3.056681, 1, 0.5882353, 0, 1,
-1.286483, -0.2027416, -3.206695, 1, 0.5921569, 0, 1,
-1.260284, 0.2390861, -1.486149, 1, 0.6, 0, 1,
-1.259067, -0.5903267, -3.131112, 1, 0.6078432, 0, 1,
-1.241772, -0.07207845, -0.1880213, 1, 0.6117647, 0, 1,
-1.238471, -0.4220417, -2.405629, 1, 0.6196079, 0, 1,
-1.236507, -0.7522032, -1.720878, 1, 0.6235294, 0, 1,
-1.235618, -1.43879, -3.257132, 1, 0.6313726, 0, 1,
-1.232422, -0.4143693, -1.719067, 1, 0.6352941, 0, 1,
-1.223908, -0.3440388, -2.470513, 1, 0.6431373, 0, 1,
-1.221167, 0.01365614, -1.232456, 1, 0.6470588, 0, 1,
-1.219669, 1.10955, -1.295671, 1, 0.654902, 0, 1,
-1.214348, -0.9982616, -4.561838, 1, 0.6588235, 0, 1,
-1.212888, 0.196431, -1.881346, 1, 0.6666667, 0, 1,
-1.212412, 0.4715375, -0.8115032, 1, 0.6705883, 0, 1,
-1.211546, 0.7383067, -1.265181, 1, 0.6784314, 0, 1,
-1.201324, -1.044668, -2.441639, 1, 0.682353, 0, 1,
-1.200295, 2.545283, -0.3734657, 1, 0.6901961, 0, 1,
-1.195422, -0.1965271, -3.249549, 1, 0.6941177, 0, 1,
-1.188291, 1.692684, 0.4716842, 1, 0.7019608, 0, 1,
-1.186282, 1.580736, -1.380135, 1, 0.7098039, 0, 1,
-1.183507, 1.438817, -1.278088, 1, 0.7137255, 0, 1,
-1.17916, 0.8764267, -0.8962927, 1, 0.7215686, 0, 1,
-1.171162, -0.3983291, -1.654616, 1, 0.7254902, 0, 1,
-1.165879, -1.102663, -1.981877, 1, 0.7333333, 0, 1,
-1.165096, -0.9143699, -2.13253, 1, 0.7372549, 0, 1,
-1.153796, -0.1308249, -1.125314, 1, 0.7450981, 0, 1,
-1.148979, -0.09063976, -0.93973, 1, 0.7490196, 0, 1,
-1.146305, -0.479583, -2.241966, 1, 0.7568628, 0, 1,
-1.144721, 1.930689, -1.297132, 1, 0.7607843, 0, 1,
-1.143468, -1.132652, -1.523581, 1, 0.7686275, 0, 1,
-1.141166, 0.7503167, -1.506557, 1, 0.772549, 0, 1,
-1.139853, 0.003913024, -1.3073, 1, 0.7803922, 0, 1,
-1.135549, -0.4645098, -1.667278, 1, 0.7843137, 0, 1,
-1.126915, 1.471436, -1.322464, 1, 0.7921569, 0, 1,
-1.122872, -0.280349, -1.554894, 1, 0.7960784, 0, 1,
-1.119607, -1.020841, -1.80275, 1, 0.8039216, 0, 1,
-1.117855, -0.844811, -2.264615, 1, 0.8117647, 0, 1,
-1.114644, 0.5571036, -1.980569, 1, 0.8156863, 0, 1,
-1.111531, 2.155007, -0.6214198, 1, 0.8235294, 0, 1,
-1.110698, -1.445196, -2.525133, 1, 0.827451, 0, 1,
-1.105144, 0.9908231, -0.4245348, 1, 0.8352941, 0, 1,
-1.090706, 0.3473193, 0.385983, 1, 0.8392157, 0, 1,
-1.085552, 0.5247299, -2.255974, 1, 0.8470588, 0, 1,
-1.065926, -1.152619, -1.401613, 1, 0.8509804, 0, 1,
-1.058941, -0.09490905, -2.107662, 1, 0.8588235, 0, 1,
-1.051927, 1.359944, 0.3419684, 1, 0.8627451, 0, 1,
-1.051246, -1.284857, -4.370853, 1, 0.8705882, 0, 1,
-1.039521, -0.1854861, -1.35271, 1, 0.8745098, 0, 1,
-1.036551, 0.1512544, -1.573235, 1, 0.8823529, 0, 1,
-1.036519, 0.06352193, -1.640079, 1, 0.8862745, 0, 1,
-1.036216, -0.5404314, -3.097516, 1, 0.8941177, 0, 1,
-1.036139, -0.8237286, -0.5967457, 1, 0.8980392, 0, 1,
-1.027614, 1.112575, -2.877365, 1, 0.9058824, 0, 1,
-1.026219, -2.242325, -2.317608, 1, 0.9137255, 0, 1,
-1.020925, 0.3150854, -1.489623, 1, 0.9176471, 0, 1,
-1.020527, -1.784949, -2.301175, 1, 0.9254902, 0, 1,
-1.016207, -0.8282922, -2.478042, 1, 0.9294118, 0, 1,
-1.011422, -0.03585107, 1.558256, 1, 0.9372549, 0, 1,
-1.007856, 1.346644, -0.4553026, 1, 0.9411765, 0, 1,
-0.994361, -1.374041, -5.079322, 1, 0.9490196, 0, 1,
-0.9884775, 1.017707, -0.4972253, 1, 0.9529412, 0, 1,
-0.9837112, -0.09431069, -0.6389832, 1, 0.9607843, 0, 1,
-0.9814405, 0.02246758, -0.3799085, 1, 0.9647059, 0, 1,
-0.9813331, 1.46425, -1.085976, 1, 0.972549, 0, 1,
-0.976488, -2.093458, -2.796364, 1, 0.9764706, 0, 1,
-0.9763864, -0.1414777, -2.440597, 1, 0.9843137, 0, 1,
-0.9713234, -0.7904327, -2.9748, 1, 0.9882353, 0, 1,
-0.9710682, -1.335113, -1.400006, 1, 0.9960784, 0, 1,
-0.9692663, -0.7058665, -2.778229, 0.9960784, 1, 0, 1,
-0.9617897, -0.9208605, -0.2956624, 0.9921569, 1, 0, 1,
-0.9546804, 1.5539, -1.363656, 0.9843137, 1, 0, 1,
-0.9492864, 1.573626, -1.935254, 0.9803922, 1, 0, 1,
-0.9466833, -1.238425, -3.237188, 0.972549, 1, 0, 1,
-0.9458384, -0.3350259, -2.151777, 0.9686275, 1, 0, 1,
-0.9449487, 0.8007979, -2.179159, 0.9607843, 1, 0, 1,
-0.9447224, 1.210998, -1.473391, 0.9568627, 1, 0, 1,
-0.941401, -0.9410163, -1.928714, 0.9490196, 1, 0, 1,
-0.9324057, 0.4788477, -0.6912099, 0.945098, 1, 0, 1,
-0.9312454, -0.1412744, -1.801952, 0.9372549, 1, 0, 1,
-0.9291767, 0.6098011, -2.639326, 0.9333333, 1, 0, 1,
-0.9284031, 0.5328182, -0.617101, 0.9254902, 1, 0, 1,
-0.9254702, -1.745122, -3.264, 0.9215686, 1, 0, 1,
-0.9239531, 1.327059, -0.37961, 0.9137255, 1, 0, 1,
-0.923601, -0.4973115, -1.551488, 0.9098039, 1, 0, 1,
-0.9121996, 0.009927165, -1.881119, 0.9019608, 1, 0, 1,
-0.9058585, 1.46038, -1.182154, 0.8941177, 1, 0, 1,
-0.9028176, -0.4343798, -1.930729, 0.8901961, 1, 0, 1,
-0.9027984, 1.123523, -0.5477975, 0.8823529, 1, 0, 1,
-0.8944452, -0.5143915, -0.5592505, 0.8784314, 1, 0, 1,
-0.8913621, 0.04246859, -1.269802, 0.8705882, 1, 0, 1,
-0.8879616, -0.03995734, -2.825496, 0.8666667, 1, 0, 1,
-0.8856969, -0.9856954, -2.881386, 0.8588235, 1, 0, 1,
-0.8841724, -0.3928421, -2.563946, 0.854902, 1, 0, 1,
-0.882063, -0.05482018, -0.9677129, 0.8470588, 1, 0, 1,
-0.8812522, 1.507416, -0.1432019, 0.8431373, 1, 0, 1,
-0.8803592, -1.284763, -4.704551, 0.8352941, 1, 0, 1,
-0.8788491, 0.07977908, -0.6057886, 0.8313726, 1, 0, 1,
-0.8638644, -0.1916646, -1.7376, 0.8235294, 1, 0, 1,
-0.8624507, -0.8561149, -0.2175203, 0.8196079, 1, 0, 1,
-0.8609067, -0.4700627, -1.817381, 0.8117647, 1, 0, 1,
-0.8586828, -0.2014263, -1.662466, 0.8078431, 1, 0, 1,
-0.8579078, -0.9049166, -1.264075, 0.8, 1, 0, 1,
-0.8565741, -0.5758806, -1.805111, 0.7921569, 1, 0, 1,
-0.8535323, -0.7643934, -2.272047, 0.7882353, 1, 0, 1,
-0.8460693, 0.3898598, 1.033799, 0.7803922, 1, 0, 1,
-0.8393408, -1.630406, -2.906298, 0.7764706, 1, 0, 1,
-0.8306847, -0.6204196, -1.431992, 0.7686275, 1, 0, 1,
-0.8243271, 0.8281776, -0.815059, 0.7647059, 1, 0, 1,
-0.8217466, 0.2102356, 0.1067345, 0.7568628, 1, 0, 1,
-0.8217275, -0.9033207, -0.6372698, 0.7529412, 1, 0, 1,
-0.8208196, 0.2126833, -2.751932, 0.7450981, 1, 0, 1,
-0.8185413, -0.9866761, -1.572564, 0.7411765, 1, 0, 1,
-0.8174711, -2.717525, -3.630395, 0.7333333, 1, 0, 1,
-0.8038707, 0.2894729, -1.204875, 0.7294118, 1, 0, 1,
-0.7916619, 2.213069, -0.6949446, 0.7215686, 1, 0, 1,
-0.7910756, 0.238646, -1.742199, 0.7176471, 1, 0, 1,
-0.7883713, -0.3484371, -0.8109614, 0.7098039, 1, 0, 1,
-0.78376, 0.4912007, -0.9449577, 0.7058824, 1, 0, 1,
-0.7819, 1.73672, -0.9498975, 0.6980392, 1, 0, 1,
-0.7812661, -0.1247246, 0.02004124, 0.6901961, 1, 0, 1,
-0.7801577, 0.4579731, -1.433293, 0.6862745, 1, 0, 1,
-0.7800658, 0.245488, -0.4853018, 0.6784314, 1, 0, 1,
-0.7782727, -1.525408, -2.261656, 0.6745098, 1, 0, 1,
-0.7764524, 0.5850638, -3.070464, 0.6666667, 1, 0, 1,
-0.7763597, -1.566688, -4.405646, 0.6627451, 1, 0, 1,
-0.7736946, -0.264791, -0.9360347, 0.654902, 1, 0, 1,
-0.7638388, -0.4392502, -1.42847, 0.6509804, 1, 0, 1,
-0.7629811, -0.1710205, -1.08637, 0.6431373, 1, 0, 1,
-0.7598132, -0.6993102, -4.719673, 0.6392157, 1, 0, 1,
-0.7583545, -0.2836295, -2.003964, 0.6313726, 1, 0, 1,
-0.746021, -0.4762095, -2.902172, 0.627451, 1, 0, 1,
-0.7447457, -1.057669, -2.398589, 0.6196079, 1, 0, 1,
-0.7377977, -0.2329296, -0.6803428, 0.6156863, 1, 0, 1,
-0.7338883, 0.2448223, -0.8921687, 0.6078432, 1, 0, 1,
-0.72846, 0.5364133, -1.635052, 0.6039216, 1, 0, 1,
-0.7269311, -0.8923108, -1.840201, 0.5960785, 1, 0, 1,
-0.7265137, -1.149231, -3.506191, 0.5882353, 1, 0, 1,
-0.720848, 1.729702, -1.618378, 0.5843138, 1, 0, 1,
-0.7187682, 0.1432696, -1.5925, 0.5764706, 1, 0, 1,
-0.714177, 0.5272205, 0.4471544, 0.572549, 1, 0, 1,
-0.7132435, 0.1262445, -1.727573, 0.5647059, 1, 0, 1,
-0.7108234, -0.2526372, -2.390212, 0.5607843, 1, 0, 1,
-0.6954495, -0.3587809, -1.393004, 0.5529412, 1, 0, 1,
-0.6944758, -0.2499814, -1.691636, 0.5490196, 1, 0, 1,
-0.6931594, -0.005377911, -1.650824, 0.5411765, 1, 0, 1,
-0.6916839, -0.3482478, 0.09866677, 0.5372549, 1, 0, 1,
-0.6916608, -0.9668589, -2.60016, 0.5294118, 1, 0, 1,
-0.6884093, 0.1212469, -2.486828, 0.5254902, 1, 0, 1,
-0.6805339, 0.3643376, -3.344891, 0.5176471, 1, 0, 1,
-0.6767305, 1.025848, -1.054173, 0.5137255, 1, 0, 1,
-0.6749981, 0.145056, -1.658982, 0.5058824, 1, 0, 1,
-0.6701136, -1.390643, -1.557033, 0.5019608, 1, 0, 1,
-0.6692117, 0.7241142, -0.5881076, 0.4941176, 1, 0, 1,
-0.6651877, 1.257249, -1.828129, 0.4862745, 1, 0, 1,
-0.6624296, -0.1652471, -2.515288, 0.4823529, 1, 0, 1,
-0.659444, 0.9394034, -0.2384901, 0.4745098, 1, 0, 1,
-0.6544, -1.054777, -2.6941, 0.4705882, 1, 0, 1,
-0.6472806, 1.051571, -0.3635671, 0.4627451, 1, 0, 1,
-0.6467228, 0.03412246, -1.635353, 0.4588235, 1, 0, 1,
-0.6446173, -0.601339, -2.604819, 0.4509804, 1, 0, 1,
-0.6416295, -1.72762, -4.02705, 0.4470588, 1, 0, 1,
-0.6401368, 0.8201518, -1.872049, 0.4392157, 1, 0, 1,
-0.6391241, -0.06236984, -1.193049, 0.4352941, 1, 0, 1,
-0.6306873, 0.9581316, -1.293028, 0.427451, 1, 0, 1,
-0.6154202, 1.006606, -1.204652, 0.4235294, 1, 0, 1,
-0.6107183, -1.592885, -1.457139, 0.4156863, 1, 0, 1,
-0.6107133, -0.08442487, -1.334181, 0.4117647, 1, 0, 1,
-0.6102169, 1.38503, -0.4979817, 0.4039216, 1, 0, 1,
-0.6075819, 1.704084, -0.943922, 0.3960784, 1, 0, 1,
-0.6015289, -1.752509, -0.7330366, 0.3921569, 1, 0, 1,
-0.5999054, 0.4394702, -0.3679661, 0.3843137, 1, 0, 1,
-0.5969797, -0.005397437, -3.007068, 0.3803922, 1, 0, 1,
-0.5966003, -0.5258844, -3.482599, 0.372549, 1, 0, 1,
-0.5943063, -1.180211, -2.160723, 0.3686275, 1, 0, 1,
-0.5939738, 0.2821308, -2.250379, 0.3607843, 1, 0, 1,
-0.5921298, -1.965108, -2.52545, 0.3568628, 1, 0, 1,
-0.5911496, -0.4787285, -2.284142, 0.3490196, 1, 0, 1,
-0.5830572, 0.08540369, -1.418423, 0.345098, 1, 0, 1,
-0.582707, 1.760666, -0.8406743, 0.3372549, 1, 0, 1,
-0.5821015, 0.6058308, -2.382669, 0.3333333, 1, 0, 1,
-0.5771687, -0.8681216, -1.727924, 0.3254902, 1, 0, 1,
-0.5714395, 0.4746103, 0.3482443, 0.3215686, 1, 0, 1,
-0.5693961, 1.390242, -0.008073729, 0.3137255, 1, 0, 1,
-0.5636283, -0.05191679, -1.304252, 0.3098039, 1, 0, 1,
-0.5628315, 2.072716, -0.3690272, 0.3019608, 1, 0, 1,
-0.5609657, 0.240869, -2.765254, 0.2941177, 1, 0, 1,
-0.5561934, -0.1995812, -2.100263, 0.2901961, 1, 0, 1,
-0.5534586, -0.6747575, -3.293519, 0.282353, 1, 0, 1,
-0.5514698, 0.02039621, -1.447494, 0.2784314, 1, 0, 1,
-0.5427296, -1.219127, -3.432188, 0.2705882, 1, 0, 1,
-0.542604, -0.4080935, -2.356523, 0.2666667, 1, 0, 1,
-0.5413343, 0.1274304, -2.303456, 0.2588235, 1, 0, 1,
-0.5384603, -0.8463055, -2.993086, 0.254902, 1, 0, 1,
-0.5330638, -0.3305116, -1.928058, 0.2470588, 1, 0, 1,
-0.521377, -0.8281528, -2.124062, 0.2431373, 1, 0, 1,
-0.5161008, -0.2943942, -3.070088, 0.2352941, 1, 0, 1,
-0.5140615, 0.8252813, -0.4717944, 0.2313726, 1, 0, 1,
-0.5139942, 1.481472, 0.4446705, 0.2235294, 1, 0, 1,
-0.5125689, -0.8207068, -1.703239, 0.2196078, 1, 0, 1,
-0.511262, 1.196295, -1.112891, 0.2117647, 1, 0, 1,
-0.5100475, -3.299257, -2.491471, 0.2078431, 1, 0, 1,
-0.5037454, 0.409252, -0.675685, 0.2, 1, 0, 1,
-0.5026274, -0.3150744, -2.090171, 0.1921569, 1, 0, 1,
-0.5020964, 1.0032, -0.3329273, 0.1882353, 1, 0, 1,
-0.4977583, -2.021042, -1.283231, 0.1803922, 1, 0, 1,
-0.4935682, -1.147189, -3.559697, 0.1764706, 1, 0, 1,
-0.489297, 0.02295399, -2.001938, 0.1686275, 1, 0, 1,
-0.4876982, 0.1820704, -1.293265, 0.1647059, 1, 0, 1,
-0.4872661, -1.644181, -3.079678, 0.1568628, 1, 0, 1,
-0.4827889, 1.111758, -1.095438, 0.1529412, 1, 0, 1,
-0.4805645, 0.2386352, -2.074302, 0.145098, 1, 0, 1,
-0.4780887, 0.8802868, 1.733218, 0.1411765, 1, 0, 1,
-0.477457, -0.3081675, -1.561633, 0.1333333, 1, 0, 1,
-0.4770179, -1.532829, -1.930074, 0.1294118, 1, 0, 1,
-0.4752988, 0.1140935, -3.134613, 0.1215686, 1, 0, 1,
-0.4740173, -1.559486, -2.103031, 0.1176471, 1, 0, 1,
-0.4712887, -0.8564411, -0.9019881, 0.1098039, 1, 0, 1,
-0.469595, 0.2458821, -1.120599, 0.1058824, 1, 0, 1,
-0.4685934, 0.5680335, -1.541309, 0.09803922, 1, 0, 1,
-0.4654284, -0.7936385, -2.339238, 0.09019608, 1, 0, 1,
-0.4611144, -0.3229506, -2.149879, 0.08627451, 1, 0, 1,
-0.4543641, 0.7911627, -1.815481, 0.07843138, 1, 0, 1,
-0.4488181, -0.4923295, -1.742188, 0.07450981, 1, 0, 1,
-0.4476868, 0.1448061, -3.975489, 0.06666667, 1, 0, 1,
-0.4473297, -0.8165079, -3.294983, 0.0627451, 1, 0, 1,
-0.4465846, 0.6047652, -1.458655, 0.05490196, 1, 0, 1,
-0.4462487, 1.387361, -0.758371, 0.05098039, 1, 0, 1,
-0.4462183, 0.1643948, -1.916498, 0.04313726, 1, 0, 1,
-0.4288711, -0.1609379, -4.932991, 0.03921569, 1, 0, 1,
-0.4280784, -0.8521897, -1.927264, 0.03137255, 1, 0, 1,
-0.4230382, 0.1867062, -0.5625589, 0.02745098, 1, 0, 1,
-0.4212873, 0.1503047, -2.688957, 0.01960784, 1, 0, 1,
-0.4211822, -0.8181472, -3.405467, 0.01568628, 1, 0, 1,
-0.4199172, -1.17107, -2.749775, 0.007843138, 1, 0, 1,
-0.4182061, 1.403595, -0.9019913, 0.003921569, 1, 0, 1,
-0.417857, 0.02393773, -2.152641, 0, 1, 0.003921569, 1,
-0.4172511, -0.1089958, -2.103607, 0, 1, 0.01176471, 1,
-0.415413, -0.9429543, -2.577627, 0, 1, 0.01568628, 1,
-0.4148169, 0.7148531, 0.8652116, 0, 1, 0.02352941, 1,
-0.4144843, 0.1318299, -0.001103372, 0, 1, 0.02745098, 1,
-0.4093093, 0.4156621, -0.4347706, 0, 1, 0.03529412, 1,
-0.4066098, 0.4380565, -2.323542, 0, 1, 0.03921569, 1,
-0.4032339, -0.7367665, -2.425519, 0, 1, 0.04705882, 1,
-0.4010235, -1.46944, -2.749851, 0, 1, 0.05098039, 1,
-0.4009994, -0.0651419, -3.191589, 0, 1, 0.05882353, 1,
-0.3973584, 0.5035824, 0.3700534, 0, 1, 0.0627451, 1,
-0.3942603, -0.1742389, -1.0991, 0, 1, 0.07058824, 1,
-0.3920996, 1.692418, -0.7274258, 0, 1, 0.07450981, 1,
-0.3920946, -0.1897, -2.035843, 0, 1, 0.08235294, 1,
-0.3911361, 0.155894, -1.379255, 0, 1, 0.08627451, 1,
-0.3857903, 1.435616, 0.2579991, 0, 1, 0.09411765, 1,
-0.3809864, -0.6778948, -2.238501, 0, 1, 0.1019608, 1,
-0.3801311, 0.8121426, -0.8586866, 0, 1, 0.1058824, 1,
-0.3796562, 0.4092251, -0.6929091, 0, 1, 0.1137255, 1,
-0.3764357, -0.04191035, -3.792922, 0, 1, 0.1176471, 1,
-0.3763846, -0.544738, -3.893717, 0, 1, 0.1254902, 1,
-0.370868, 1.705322, 0.5166156, 0, 1, 0.1294118, 1,
-0.3580556, 0.9671683, -0.7376512, 0, 1, 0.1372549, 1,
-0.3569717, -0.7338572, -3.429976, 0, 1, 0.1411765, 1,
-0.3565252, -0.1851621, -3.024988, 0, 1, 0.1490196, 1,
-0.3557797, -1.29979, -3.537269, 0, 1, 0.1529412, 1,
-0.3553795, 0.2838057, -2.167339, 0, 1, 0.1607843, 1,
-0.3532428, -0.6062799, -3.1323, 0, 1, 0.1647059, 1,
-0.3500884, 2.267603, -0.1177595, 0, 1, 0.172549, 1,
-0.3486335, -1.726891, -3.128761, 0, 1, 0.1764706, 1,
-0.3454631, 1.06028, 0.210057, 0, 1, 0.1843137, 1,
-0.3417393, -0.6646544, -1.334692, 0, 1, 0.1882353, 1,
-0.3408326, 0.3361277, -1.430174, 0, 1, 0.1960784, 1,
-0.3389236, 0.05795038, -0.9466359, 0, 1, 0.2039216, 1,
-0.3335148, -1.037102, -3.072301, 0, 1, 0.2078431, 1,
-0.3314418, -0.2393172, -2.444298, 0, 1, 0.2156863, 1,
-0.3285799, 1.117569, -0.6081292, 0, 1, 0.2196078, 1,
-0.326226, 1.624584, -0.8923692, 0, 1, 0.227451, 1,
-0.3231836, -0.1162917, -1.965018, 0, 1, 0.2313726, 1,
-0.3214622, 0.5688663, 1.191252, 0, 1, 0.2392157, 1,
-0.316113, -1.501315, -4.289698, 0, 1, 0.2431373, 1,
-0.315511, -1.06314, -1.900284, 0, 1, 0.2509804, 1,
-0.3137945, -1.911934, -4.442198, 0, 1, 0.254902, 1,
-0.3111723, -1.596093, -3.012966, 0, 1, 0.2627451, 1,
-0.3092395, -0.8783135, -3.351497, 0, 1, 0.2666667, 1,
-0.306874, -0.7973545, -2.239878, 0, 1, 0.2745098, 1,
-0.3053861, -0.321332, -1.327653, 0, 1, 0.2784314, 1,
-0.3025976, 0.2713802, 0.5693158, 0, 1, 0.2862745, 1,
-0.2959218, 0.3025412, -0.05481466, 0, 1, 0.2901961, 1,
-0.2883478, -0.2032235, -2.468024, 0, 1, 0.2980392, 1,
-0.2876325, -1.150183, -1.88143, 0, 1, 0.3058824, 1,
-0.2869073, -1.154887, -2.921961, 0, 1, 0.3098039, 1,
-0.2857016, 0.5333572, -0.3357043, 0, 1, 0.3176471, 1,
-0.2821713, 0.5062681, 0.4895394, 0, 1, 0.3215686, 1,
-0.2794454, 0.2219761, -1.300255, 0, 1, 0.3294118, 1,
-0.2785904, 0.8654891, 1.30275, 0, 1, 0.3333333, 1,
-0.2783984, -1.514883, -2.119043, 0, 1, 0.3411765, 1,
-0.2778149, -0.3310094, -1.678954, 0, 1, 0.345098, 1,
-0.2742458, -0.04190857, -4.226619, 0, 1, 0.3529412, 1,
-0.2742284, 0.4522035, 0.3988085, 0, 1, 0.3568628, 1,
-0.2727244, -1.055713, -1.017731, 0, 1, 0.3647059, 1,
-0.2696036, 0.3395908, -0.1106577, 0, 1, 0.3686275, 1,
-0.2643496, 0.2783665, -1.048118, 0, 1, 0.3764706, 1,
-0.2608962, -0.6775051, -2.966906, 0, 1, 0.3803922, 1,
-0.2593047, 1.720368, -0.5579696, 0, 1, 0.3882353, 1,
-0.2577625, -0.6280457, -2.160417, 0, 1, 0.3921569, 1,
-0.2569344, 1.00416, 2.228726, 0, 1, 0.4, 1,
-0.2567965, 2.432021, -1.241544, 0, 1, 0.4078431, 1,
-0.2559186, -0.3223646, -2.011455, 0, 1, 0.4117647, 1,
-0.254815, -0.05180085, -0.7435954, 0, 1, 0.4196078, 1,
-0.2516499, 0.2287217, -1.51844, 0, 1, 0.4235294, 1,
-0.2483925, 0.2732854, -1.987107, 0, 1, 0.4313726, 1,
-0.2469181, 0.7717817, -0.6510619, 0, 1, 0.4352941, 1,
-0.2456728, -0.2656506, -2.120292, 0, 1, 0.4431373, 1,
-0.2444533, 0.5458009, -0.064215, 0, 1, 0.4470588, 1,
-0.2423569, 0.8749585, 0.6001772, 0, 1, 0.454902, 1,
-0.2405556, -0.01584071, -3.54915, 0, 1, 0.4588235, 1,
-0.2391862, 1.154716, 0.1364596, 0, 1, 0.4666667, 1,
-0.2338794, -0.2809193, -3.016257, 0, 1, 0.4705882, 1,
-0.2317443, 0.2749397, -0.04508192, 0, 1, 0.4784314, 1,
-0.2307982, -0.7755612, -4.697533, 0, 1, 0.4823529, 1,
-0.2187302, 1.552354, 1.216014, 0, 1, 0.4901961, 1,
-0.2140996, -0.1661806, -2.048524, 0, 1, 0.4941176, 1,
-0.2114727, 0.3607571, 1.525576, 0, 1, 0.5019608, 1,
-0.2059031, -1.320971, -3.810783, 0, 1, 0.509804, 1,
-0.2016252, -1.315944, -3.861273, 0, 1, 0.5137255, 1,
-0.1969485, -1.931143, -4.182746, 0, 1, 0.5215687, 1,
-0.1967845, -0.09492835, -1.067152, 0, 1, 0.5254902, 1,
-0.1967613, 0.08609228, -2.954595, 0, 1, 0.5333334, 1,
-0.1944226, 0.4180869, -0.8393515, 0, 1, 0.5372549, 1,
-0.1917134, 0.4591462, -0.03141947, 0, 1, 0.5450981, 1,
-0.1913833, -0.4498653, -2.642887, 0, 1, 0.5490196, 1,
-0.1897958, -0.240221, -1.311326, 0, 1, 0.5568628, 1,
-0.1768525, -0.01502834, -1.516628, 0, 1, 0.5607843, 1,
-0.1746677, 0.2193849, 0.2210197, 0, 1, 0.5686275, 1,
-0.1724825, -0.2779807, -1.090433, 0, 1, 0.572549, 1,
-0.1705912, 1.412281, -0.5900199, 0, 1, 0.5803922, 1,
-0.1682828, 1.516503, 0.2552285, 0, 1, 0.5843138, 1,
-0.1660089, 0.1245411, -0.9831586, 0, 1, 0.5921569, 1,
-0.1623399, -0.4468653, -2.905823, 0, 1, 0.5960785, 1,
-0.1613927, 0.753897, 0.3514214, 0, 1, 0.6039216, 1,
-0.1566767, 1.244872, -0.4621146, 0, 1, 0.6117647, 1,
-0.1563701, -0.3960606, -2.873628, 0, 1, 0.6156863, 1,
-0.1550472, -1.134524, -3.088611, 0, 1, 0.6235294, 1,
-0.1514277, -0.9003572, -2.506625, 0, 1, 0.627451, 1,
-0.1509638, 0.1447976, 0.004571062, 0, 1, 0.6352941, 1,
-0.1410934, -0.08663858, -0.6111805, 0, 1, 0.6392157, 1,
-0.1352996, -0.3322069, -3.993742, 0, 1, 0.6470588, 1,
-0.1297669, -0.72392, -3.34757, 0, 1, 0.6509804, 1,
-0.1281829, -0.2581424, -3.327012, 0, 1, 0.6588235, 1,
-0.1225756, -0.2318152, -3.264647, 0, 1, 0.6627451, 1,
-0.1225253, -0.3956488, -2.268551, 0, 1, 0.6705883, 1,
-0.1211666, -0.809938, -4.719367, 0, 1, 0.6745098, 1,
-0.1185883, -1.025258, -2.990619, 0, 1, 0.682353, 1,
-0.1182934, -2.061247, -4.378666, 0, 1, 0.6862745, 1,
-0.1171685, -0.4233372, -3.887408, 0, 1, 0.6941177, 1,
-0.1168493, 0.1607053, 0.8315905, 0, 1, 0.7019608, 1,
-0.1162788, 0.2454873, -0.8699601, 0, 1, 0.7058824, 1,
-0.114196, -1.252786, -1.761116, 0, 1, 0.7137255, 1,
-0.1138287, -0.6151658, -3.453543, 0, 1, 0.7176471, 1,
-0.1128032, 0.9985492, -0.4447179, 0, 1, 0.7254902, 1,
-0.1093532, -0.6494955, -2.01077, 0, 1, 0.7294118, 1,
-0.1064918, -1.145681, -3.10342, 0, 1, 0.7372549, 1,
-0.1026552, 0.3466662, -1.898304, 0, 1, 0.7411765, 1,
-0.1017906, 0.0158258, -1.485607, 0, 1, 0.7490196, 1,
-0.09995376, 0.04581631, -0.9697214, 0, 1, 0.7529412, 1,
-0.09946724, -0.6365535, -1.654561, 0, 1, 0.7607843, 1,
-0.09773788, -0.06687083, -1.330567, 0, 1, 0.7647059, 1,
-0.09618001, 1.280423, 0.5692035, 0, 1, 0.772549, 1,
-0.09279152, -0.402246, -4.698075, 0, 1, 0.7764706, 1,
-0.0927351, 0.5283089, 1.278921, 0, 1, 0.7843137, 1,
-0.08728575, 0.1366545, -0.2942587, 0, 1, 0.7882353, 1,
-0.08652578, 1.682028, 0.1977656, 0, 1, 0.7960784, 1,
-0.08594403, 0.05202826, -0.9275425, 0, 1, 0.8039216, 1,
-0.08551656, -2.082007, -4.677271, 0, 1, 0.8078431, 1,
-0.08411264, 0.7661577, -1.084142, 0, 1, 0.8156863, 1,
-0.08258338, -1.274175, -3.298365, 0, 1, 0.8196079, 1,
-0.08028129, -1.463406, -2.783053, 0, 1, 0.827451, 1,
-0.07074095, -1.253413, -3.104483, 0, 1, 0.8313726, 1,
-0.0681268, -0.07727292, -2.734732, 0, 1, 0.8392157, 1,
-0.05999191, -1.445664, -2.227013, 0, 1, 0.8431373, 1,
-0.05881701, -1.619594, -4.002275, 0, 1, 0.8509804, 1,
-0.05810044, 0.6464345, 0.5714983, 0, 1, 0.854902, 1,
-0.05442059, -0.402496, -5.178041, 0, 1, 0.8627451, 1,
-0.0534271, -0.6121773, -1.448564, 0, 1, 0.8666667, 1,
-0.05075035, 2.273737, -1.107594, 0, 1, 0.8745098, 1,
-0.05010194, 1.19276, -0.2769851, 0, 1, 0.8784314, 1,
-0.04831358, -0.4443126, -3.190561, 0, 1, 0.8862745, 1,
-0.04684813, 1.494819, 0.8588033, 0, 1, 0.8901961, 1,
-0.04239371, -0.9806815, -4.107843, 0, 1, 0.8980392, 1,
-0.03697069, -1.771088, -2.644679, 0, 1, 0.9058824, 1,
-0.03492364, -0.8753334, -5.331734, 0, 1, 0.9098039, 1,
-0.03437314, -0.4538314, -4.240232, 0, 1, 0.9176471, 1,
-0.03060938, 0.1774584, 1.187382, 0, 1, 0.9215686, 1,
-0.02644941, -0.5315551, -2.911667, 0, 1, 0.9294118, 1,
-0.02609044, -0.527572, -2.672045, 0, 1, 0.9333333, 1,
-0.02563235, 1.220659, 1.33672, 0, 1, 0.9411765, 1,
-0.02473876, -0.7147703, -4.87294, 0, 1, 0.945098, 1,
-0.01735027, 0.2253739, 0.07010075, 0, 1, 0.9529412, 1,
-0.01632687, 1.119884, -0.06693941, 0, 1, 0.9568627, 1,
-0.01474733, 0.8516911, 0.08597799, 0, 1, 0.9647059, 1,
-0.01230249, 0.0191368, -0.661679, 0, 1, 0.9686275, 1,
-0.006610006, -0.3359745, -3.900512, 0, 1, 0.9764706, 1,
0.002319499, 0.1084794, -0.5648661, 0, 1, 0.9803922, 1,
0.00425966, -2.158707, 3.883382, 0, 1, 0.9882353, 1,
0.00596051, -0.5001088, 1.494414, 0, 1, 0.9921569, 1,
0.007503489, 0.5191293, -0.8202584, 0, 1, 1, 1,
0.009610377, -1.084919, 3.509138, 0, 0.9921569, 1, 1,
0.01206087, 0.7444736, -0.8697491, 0, 0.9882353, 1, 1,
0.01484965, 0.8272021, -0.5003234, 0, 0.9803922, 1, 1,
0.01682596, 1.037913, -1.417546, 0, 0.9764706, 1, 1,
0.01896501, 2.983849, -1.177333, 0, 0.9686275, 1, 1,
0.02164492, 1.803468, -1.788843, 0, 0.9647059, 1, 1,
0.02170396, -0.8881643, 2.393246, 0, 0.9568627, 1, 1,
0.02206831, 0.3442658, 1.440498, 0, 0.9529412, 1, 1,
0.0290817, 0.9758834, 1.170164, 0, 0.945098, 1, 1,
0.02924137, 0.07366858, 0.2199587, 0, 0.9411765, 1, 1,
0.03045991, -0.1238738, 2.878621, 0, 0.9333333, 1, 1,
0.03063086, -0.6352127, 2.499925, 0, 0.9294118, 1, 1,
0.03325124, 0.717429, 0.009724615, 0, 0.9215686, 1, 1,
0.0358137, -1.537606, 2.095558, 0, 0.9176471, 1, 1,
0.0373799, -0.6244292, 2.617344, 0, 0.9098039, 1, 1,
0.03885772, 0.4319884, -1.06719, 0, 0.9058824, 1, 1,
0.03933099, 1.21756, -0.4907096, 0, 0.8980392, 1, 1,
0.04086091, 0.2409218, 1.419472, 0, 0.8901961, 1, 1,
0.0425232, 0.5464258, 1.413383, 0, 0.8862745, 1, 1,
0.04285973, 0.3917114, 2.12407, 0, 0.8784314, 1, 1,
0.04424087, 0.6691707, -1.272961, 0, 0.8745098, 1, 1,
0.04485056, 1.001321, 0.2256966, 0, 0.8666667, 1, 1,
0.04754931, 0.9381016, -0.4686108, 0, 0.8627451, 1, 1,
0.04997686, 1.481121, 0.7223405, 0, 0.854902, 1, 1,
0.0512583, 0.06105585, -0.05538253, 0, 0.8509804, 1, 1,
0.0532141, 2.750844, 0.6892757, 0, 0.8431373, 1, 1,
0.05678011, 0.9813988, -1.196606, 0, 0.8392157, 1, 1,
0.05729829, -0.3070018, 3.977787, 0, 0.8313726, 1, 1,
0.0596083, -0.6360936, 3.485773, 0, 0.827451, 1, 1,
0.06066434, -1.027467, 3.122021, 0, 0.8196079, 1, 1,
0.06210921, -0.4848415, 4.316602, 0, 0.8156863, 1, 1,
0.07501747, -0.6496603, 4.015253, 0, 0.8078431, 1, 1,
0.08106393, 1.165336, 2.231026, 0, 0.8039216, 1, 1,
0.08417863, 0.6040657, 0.6676744, 0, 0.7960784, 1, 1,
0.08647364, -0.08072697, 1.96302, 0, 0.7882353, 1, 1,
0.09366659, -0.114323, 2.687052, 0, 0.7843137, 1, 1,
0.09753726, 2.226523, -0.183457, 0, 0.7764706, 1, 1,
0.09873929, -0.4232696, 2.395541, 0, 0.772549, 1, 1,
0.1079556, 2.526172, -1.401688, 0, 0.7647059, 1, 1,
0.1108204, -0.2795121, 1.771933, 0, 0.7607843, 1, 1,
0.1153784, -1.313644, 3.958987, 0, 0.7529412, 1, 1,
0.1162349, 0.4839045, 1.032753, 0, 0.7490196, 1, 1,
0.1235749, 0.6267939, -0.1401932, 0, 0.7411765, 1, 1,
0.1288418, -0.5370603, 4.425295, 0, 0.7372549, 1, 1,
0.1313242, -1.102259, 3.26576, 0, 0.7294118, 1, 1,
0.1319444, -0.3583629, 2.417247, 0, 0.7254902, 1, 1,
0.134458, -0.5788615, 5.803297, 0, 0.7176471, 1, 1,
0.1408664, 1.076063, -0.7596558, 0, 0.7137255, 1, 1,
0.1433586, -2.143911, 3.111101, 0, 0.7058824, 1, 1,
0.1458652, -0.6231363, 0.8985247, 0, 0.6980392, 1, 1,
0.1478128, 0.4853822, -0.4565782, 0, 0.6941177, 1, 1,
0.1479546, -0.3965827, 3.897028, 0, 0.6862745, 1, 1,
0.1547583, -1.014673, 1.855445, 0, 0.682353, 1, 1,
0.1573264, -0.3028443, 5.006366, 0, 0.6745098, 1, 1,
0.1619358, 0.3510063, 0.3036163, 0, 0.6705883, 1, 1,
0.163612, 0.3143715, -0.05143496, 0, 0.6627451, 1, 1,
0.1677318, -0.9148118, 2.957614, 0, 0.6588235, 1, 1,
0.1678254, -1.138832, 3.159049, 0, 0.6509804, 1, 1,
0.169156, 0.7870045, 0.03552712, 0, 0.6470588, 1, 1,
0.1705536, -1.817249, 3.086837, 0, 0.6392157, 1, 1,
0.1718075, 0.470133, -1.230428, 0, 0.6352941, 1, 1,
0.1718518, -1.814453, 2.980797, 0, 0.627451, 1, 1,
0.1743258, 1.488113, 0.2666452, 0, 0.6235294, 1, 1,
0.176935, -0.6303582, 2.292213, 0, 0.6156863, 1, 1,
0.1807509, 1.437717, 1.797895, 0, 0.6117647, 1, 1,
0.1808596, -0.2052965, 0.9973423, 0, 0.6039216, 1, 1,
0.1877987, -1.485297, 2.121351, 0, 0.5960785, 1, 1,
0.1888602, 0.7897873, -0.9909662, 0, 0.5921569, 1, 1,
0.1889066, -1.019529, 2.782675, 0, 0.5843138, 1, 1,
0.1903991, -0.5351089, 3.285632, 0, 0.5803922, 1, 1,
0.1965725, -0.09024002, 1.016098, 0, 0.572549, 1, 1,
0.1995436, 2.619158, 1.089727, 0, 0.5686275, 1, 1,
0.2002881, -0.504055, 2.848731, 0, 0.5607843, 1, 1,
0.2014201, 0.5672281, 0.8113153, 0, 0.5568628, 1, 1,
0.2018218, 0.904425, -0.1359043, 0, 0.5490196, 1, 1,
0.2045609, -2.240065, 1.787812, 0, 0.5450981, 1, 1,
0.2063301, 1.273996, -0.8675458, 0, 0.5372549, 1, 1,
0.2068172, 0.4613303, 0.1379496, 0, 0.5333334, 1, 1,
0.2116744, -0.2810155, 3.079316, 0, 0.5254902, 1, 1,
0.2118322, 0.6712157, -0.3413873, 0, 0.5215687, 1, 1,
0.2120946, 0.07677733, 0.911319, 0, 0.5137255, 1, 1,
0.2125234, 1.026507, -2.590159, 0, 0.509804, 1, 1,
0.2136248, -0.1496683, 2.516769, 0, 0.5019608, 1, 1,
0.2175937, -0.1532274, 2.942376, 0, 0.4941176, 1, 1,
0.2219677, 2.480567, 0.3361552, 0, 0.4901961, 1, 1,
0.2230246, -0.03997234, 2.398248, 0, 0.4823529, 1, 1,
0.2328521, -0.6181087, 3.214632, 0, 0.4784314, 1, 1,
0.23491, -1.621197, 2.211637, 0, 0.4705882, 1, 1,
0.2361903, -0.6031958, 2.431654, 0, 0.4666667, 1, 1,
0.2369817, 0.3230158, 2.483537, 0, 0.4588235, 1, 1,
0.2389796, -0.5470941, 2.625275, 0, 0.454902, 1, 1,
0.2432498, 0.2799053, -1.311435, 0, 0.4470588, 1, 1,
0.2458595, 0.1399979, 0.2777107, 0, 0.4431373, 1, 1,
0.2541001, 0.2702989, 0.4575167, 0, 0.4352941, 1, 1,
0.2565066, -1.579185, 4.211387, 0, 0.4313726, 1, 1,
0.260054, 0.324017, 0.4513001, 0, 0.4235294, 1, 1,
0.2628924, -1.298065, 2.11896, 0, 0.4196078, 1, 1,
0.2635078, -0.4227972, 3.348235, 0, 0.4117647, 1, 1,
0.2668768, 0.7208068, -1.138968, 0, 0.4078431, 1, 1,
0.2719446, -0.9091254, 3.843235, 0, 0.4, 1, 1,
0.2755816, 0.4447596, 0.5347075, 0, 0.3921569, 1, 1,
0.2773457, -0.6889746, 2.976447, 0, 0.3882353, 1, 1,
0.2776812, -0.5592826, 3.957661, 0, 0.3803922, 1, 1,
0.2806115, -0.1341391, 2.412586, 0, 0.3764706, 1, 1,
0.2818845, -0.3191503, 0.4671347, 0, 0.3686275, 1, 1,
0.2845018, 0.3494679, -0.01562061, 0, 0.3647059, 1, 1,
0.2849693, -0.219206, 3.550398, 0, 0.3568628, 1, 1,
0.2889223, -2.727798, 2.595771, 0, 0.3529412, 1, 1,
0.2896531, 2.442316, 1.3336, 0, 0.345098, 1, 1,
0.2902248, -1.187485, 2.023614, 0, 0.3411765, 1, 1,
0.2914174, 1.015148, 0.4069921, 0, 0.3333333, 1, 1,
0.2934803, 0.2001506, -0.1141575, 0, 0.3294118, 1, 1,
0.296402, 0.8403056, -0.8777182, 0, 0.3215686, 1, 1,
0.2998495, -1.977976, 3.673456, 0, 0.3176471, 1, 1,
0.3082312, -0.978353, 1.828676, 0, 0.3098039, 1, 1,
0.3093941, -1.185256, 3.516484, 0, 0.3058824, 1, 1,
0.3125148, -1.234713, 2.346325, 0, 0.2980392, 1, 1,
0.3252775, 1.153046, 2.679575, 0, 0.2901961, 1, 1,
0.3267667, 0.5351998, 0.03850783, 0, 0.2862745, 1, 1,
0.3296176, -0.04868453, 1.305948, 0, 0.2784314, 1, 1,
0.3296757, -1.212479, 1.509804, 0, 0.2745098, 1, 1,
0.331856, 0.02130527, 0.8295103, 0, 0.2666667, 1, 1,
0.333042, -0.9099418, 1.924782, 0, 0.2627451, 1, 1,
0.3345023, 0.4869163, -0.7279516, 0, 0.254902, 1, 1,
0.3352958, 0.4464328, 1.375822, 0, 0.2509804, 1, 1,
0.3412754, 0.1357404, 2.010649, 0, 0.2431373, 1, 1,
0.3422939, 0.2839823, 1.061399, 0, 0.2392157, 1, 1,
0.3448335, 0.05119777, 2.686541, 0, 0.2313726, 1, 1,
0.3506288, -0.20017, 0.5326535, 0, 0.227451, 1, 1,
0.3517639, -0.4071878, 0.4380137, 0, 0.2196078, 1, 1,
0.3529821, -0.114001, 1.582458, 0, 0.2156863, 1, 1,
0.3532721, -0.5421408, 3.768834, 0, 0.2078431, 1, 1,
0.3535028, -1.202507, 1.356877, 0, 0.2039216, 1, 1,
0.3589301, 0.7216212, -0.9610894, 0, 0.1960784, 1, 1,
0.3674444, -0.182608, 1.010314, 0, 0.1882353, 1, 1,
0.3712623, -0.3692162, 0.8862997, 0, 0.1843137, 1, 1,
0.3723425, -1.00857, 2.277604, 0, 0.1764706, 1, 1,
0.3776074, -1.221847, 3.513316, 0, 0.172549, 1, 1,
0.3792738, -1.245823, 3.289214, 0, 0.1647059, 1, 1,
0.3837639, -0.157718, 0.9306412, 0, 0.1607843, 1, 1,
0.3841238, 0.1313255, -0.3083982, 0, 0.1529412, 1, 1,
0.3843133, 0.7016386, 1.960443, 0, 0.1490196, 1, 1,
0.3882178, -0.3534795, 1.858302, 0, 0.1411765, 1, 1,
0.3884927, 0.8361225, 1.924178, 0, 0.1372549, 1, 1,
0.3893574, 1.305133, 0.04146763, 0, 0.1294118, 1, 1,
0.3916239, -0.4708467, 3.708265, 0, 0.1254902, 1, 1,
0.3929403, -0.1321815, 2.103436, 0, 0.1176471, 1, 1,
0.3933279, -0.05185459, 2.866128, 0, 0.1137255, 1, 1,
0.396131, -1.100633, 2.569557, 0, 0.1058824, 1, 1,
0.3986019, -0.1622121, 1.395597, 0, 0.09803922, 1, 1,
0.4002351, 0.05686981, 0.4009477, 0, 0.09411765, 1, 1,
0.4003411, 0.8431069, -1.207497, 0, 0.08627451, 1, 1,
0.4024148, 0.001788638, 1.847463, 0, 0.08235294, 1, 1,
0.4062266, -0.4917475, 2.991183, 0, 0.07450981, 1, 1,
0.40727, -0.115354, 3.963614, 0, 0.07058824, 1, 1,
0.4074235, 1.714726, -1.329534, 0, 0.0627451, 1, 1,
0.4085562, -0.1028977, 1.400005, 0, 0.05882353, 1, 1,
0.4109764, 0.6187163, 1.049227, 0, 0.05098039, 1, 1,
0.4110979, -0.2093, 3.51736, 0, 0.04705882, 1, 1,
0.4147182, 0.03937068, 1.070393, 0, 0.03921569, 1, 1,
0.4177731, -0.9882802, 3.147482, 0, 0.03529412, 1, 1,
0.4182951, 1.334599, -1.79539, 0, 0.02745098, 1, 1,
0.4205252, 0.8325323, 0.1029362, 0, 0.02352941, 1, 1,
0.4215425, -1.913369, 2.226515, 0, 0.01568628, 1, 1,
0.4215525, 0.9800938, -0.05959413, 0, 0.01176471, 1, 1,
0.4279328, 1.174928, 1.319563, 0, 0.003921569, 1, 1,
0.4342242, 0.6985055, 2.670214, 0.003921569, 0, 1, 1,
0.4347329, 0.02313493, 1.287095, 0.007843138, 0, 1, 1,
0.4401005, -0.3771562, 4.810186, 0.01568628, 0, 1, 1,
0.4419238, -0.6651432, 1.604497, 0.01960784, 0, 1, 1,
0.4420263, -0.07831337, -0.2068266, 0.02745098, 0, 1, 1,
0.4423507, -0.8044439, 4.711949, 0.03137255, 0, 1, 1,
0.445576, 0.6356966, 1.251363, 0.03921569, 0, 1, 1,
0.454328, -0.3244689, 3.587548, 0.04313726, 0, 1, 1,
0.4568219, -0.179371, 1.858097, 0.05098039, 0, 1, 1,
0.4599018, 1.078513, 0.2190297, 0.05490196, 0, 1, 1,
0.4753439, -0.9935695, 0.7326607, 0.0627451, 0, 1, 1,
0.4753977, -1.207014, 2.20789, 0.06666667, 0, 1, 1,
0.4788442, -0.53415, 2.893826, 0.07450981, 0, 1, 1,
0.4814391, 0.06556213, 0.3021735, 0.07843138, 0, 1, 1,
0.4828695, 0.2959025, 1.101535, 0.08627451, 0, 1, 1,
0.4829232, 0.9098444, 0.07432617, 0.09019608, 0, 1, 1,
0.4855777, 0.6897944, -0.8727502, 0.09803922, 0, 1, 1,
0.4937519, 0.9792261, 2.244844, 0.1058824, 0, 1, 1,
0.4982423, 1.973669, 1.909913, 0.1098039, 0, 1, 1,
0.4983667, -0.7888594, 2.849208, 0.1176471, 0, 1, 1,
0.5006686, -1.033383, 1.305557, 0.1215686, 0, 1, 1,
0.5007219, -0.2898463, 3.685603, 0.1294118, 0, 1, 1,
0.5026872, -0.5734084, 3.489946, 0.1333333, 0, 1, 1,
0.5041893, 1.5481, 0.6622157, 0.1411765, 0, 1, 1,
0.5058562, -0.3845487, 3.377273, 0.145098, 0, 1, 1,
0.5063691, 0.003481678, 2.802061, 0.1529412, 0, 1, 1,
0.5068363, 2.105467, 0.609198, 0.1568628, 0, 1, 1,
0.5111966, 1.663289, -0.8022232, 0.1647059, 0, 1, 1,
0.513842, 1.43783, 0.07368155, 0.1686275, 0, 1, 1,
0.5169737, 0.2989109, -0.001734926, 0.1764706, 0, 1, 1,
0.519101, -1.997434, 1.416943, 0.1803922, 0, 1, 1,
0.5192953, -2.205435, 3.10866, 0.1882353, 0, 1, 1,
0.5199839, 0.7491377, 0.9368612, 0.1921569, 0, 1, 1,
0.5202431, 0.06862928, 1.81996, 0.2, 0, 1, 1,
0.5306024, 0.6041457, -0.00193879, 0.2078431, 0, 1, 1,
0.5347289, -0.2735801, 2.014852, 0.2117647, 0, 1, 1,
0.5355843, -0.8944125, 2.529971, 0.2196078, 0, 1, 1,
0.535782, 0.4463988, -0.6809297, 0.2235294, 0, 1, 1,
0.5388919, -0.5091585, 2.864676, 0.2313726, 0, 1, 1,
0.5391756, -1.077485, 2.339486, 0.2352941, 0, 1, 1,
0.5396525, -0.4401516, 1.510455, 0.2431373, 0, 1, 1,
0.541557, 0.5055062, 1.519425, 0.2470588, 0, 1, 1,
0.5433521, -1.10175, 3.051711, 0.254902, 0, 1, 1,
0.5434664, -1.375635, 1.881344, 0.2588235, 0, 1, 1,
0.5438612, -3.117329, 1.044552, 0.2666667, 0, 1, 1,
0.5548225, 1.516451, -0.1961337, 0.2705882, 0, 1, 1,
0.5567074, 0.7630416, 0.3924662, 0.2784314, 0, 1, 1,
0.5645017, -1.034494, 3.354152, 0.282353, 0, 1, 1,
0.5658233, 0.2301825, 1.215979, 0.2901961, 0, 1, 1,
0.5666135, 0.72701, 0.2264014, 0.2941177, 0, 1, 1,
0.5676306, -0.4923313, 4.260982, 0.3019608, 0, 1, 1,
0.5687615, 0.296347, 1.914574, 0.3098039, 0, 1, 1,
0.5754431, 0.1458868, 0.4666293, 0.3137255, 0, 1, 1,
0.576945, 0.6906151, 0.3913155, 0.3215686, 0, 1, 1,
0.5821159, 1.065069, -0.9174349, 0.3254902, 0, 1, 1,
0.5824643, -0.5704838, 0.5875892, 0.3333333, 0, 1, 1,
0.5877169, -1.190071, 3.975576, 0.3372549, 0, 1, 1,
0.5913072, 0.7851222, 0.8613022, 0.345098, 0, 1, 1,
0.593047, 1.637706, -1.105979, 0.3490196, 0, 1, 1,
0.601429, -2.366823, 2.56541, 0.3568628, 0, 1, 1,
0.6044505, 1.447016, 1.024344, 0.3607843, 0, 1, 1,
0.6057774, -0.6336172, 3.931987, 0.3686275, 0, 1, 1,
0.6137134, 0.8543941, 0.4521534, 0.372549, 0, 1, 1,
0.6180453, 0.4443242, -0.1032119, 0.3803922, 0, 1, 1,
0.6199396, 0.08766939, 1.671614, 0.3843137, 0, 1, 1,
0.6227115, 1.111267, 0.7989724, 0.3921569, 0, 1, 1,
0.628782, -1.172172, 2.864547, 0.3960784, 0, 1, 1,
0.6310449, 1.760821, 1.450543, 0.4039216, 0, 1, 1,
0.6327412, -0.4474836, 4.00316, 0.4117647, 0, 1, 1,
0.6332662, -2.384079, 4.252446, 0.4156863, 0, 1, 1,
0.6363969, 0.8394164, 0.5157771, 0.4235294, 0, 1, 1,
0.6366944, 0.1819874, 3.058565, 0.427451, 0, 1, 1,
0.6389333, -0.1535445, 0.8185385, 0.4352941, 0, 1, 1,
0.6429412, 0.5754513, 3.022668, 0.4392157, 0, 1, 1,
0.6439353, 1.558488, -0.4591954, 0.4470588, 0, 1, 1,
0.6440572, -0.8340969, 2.011279, 0.4509804, 0, 1, 1,
0.6460471, -1.545496, 1.135864, 0.4588235, 0, 1, 1,
0.6475641, 0.3528652, 1.241536, 0.4627451, 0, 1, 1,
0.6485631, 0.2511537, -0.1441284, 0.4705882, 0, 1, 1,
0.6506703, -0.8727579, 2.035757, 0.4745098, 0, 1, 1,
0.6509572, 0.3743382, 0.9932823, 0.4823529, 0, 1, 1,
0.654065, 0.4468217, 2.021181, 0.4862745, 0, 1, 1,
0.661109, -0.3287928, 3.042849, 0.4941176, 0, 1, 1,
0.6623771, 2.143651, 0.1357174, 0.5019608, 0, 1, 1,
0.6632093, 0.7455077, 0.08766221, 0.5058824, 0, 1, 1,
0.6681305, -0.1155869, 1.584529, 0.5137255, 0, 1, 1,
0.6701667, -0.4665127, 2.027781, 0.5176471, 0, 1, 1,
0.67142, 0.4209607, 1.85614, 0.5254902, 0, 1, 1,
0.6763943, -1.46038, 3.888488, 0.5294118, 0, 1, 1,
0.6796924, -0.8918177, 2.443166, 0.5372549, 0, 1, 1,
0.6807708, 1.072598, -1.06096, 0.5411765, 0, 1, 1,
0.6822413, 0.7991856, 0.8166667, 0.5490196, 0, 1, 1,
0.6825797, -2.594818, 4.233575, 0.5529412, 0, 1, 1,
0.6834391, 1.071422, 0.004542814, 0.5607843, 0, 1, 1,
0.6866404, -0.435669, 2.456789, 0.5647059, 0, 1, 1,
0.6875945, -0.1713494, 2.801785, 0.572549, 0, 1, 1,
0.6952376, 0.02858361, 1.019584, 0.5764706, 0, 1, 1,
0.6966825, 1.891005, 1.809857, 0.5843138, 0, 1, 1,
0.6976091, 1.620351, -0.2329691, 0.5882353, 0, 1, 1,
0.6996412, -1.307729, 1.475597, 0.5960785, 0, 1, 1,
0.7000903, 2.544391, 0.7952307, 0.6039216, 0, 1, 1,
0.7003369, 0.9683986, 1.601307, 0.6078432, 0, 1, 1,
0.701703, -0.5888561, 1.632909, 0.6156863, 0, 1, 1,
0.7021251, 2.78129, 0.9296976, 0.6196079, 0, 1, 1,
0.7044119, 0.3936642, 0.6432512, 0.627451, 0, 1, 1,
0.706943, -0.1778396, 1.809761, 0.6313726, 0, 1, 1,
0.7214153, -0.3934571, 3.034333, 0.6392157, 0, 1, 1,
0.7254529, 1.003883, -0.2996657, 0.6431373, 0, 1, 1,
0.7266884, -0.695685, 3.297845, 0.6509804, 0, 1, 1,
0.7290997, -1.47369, 2.363348, 0.654902, 0, 1, 1,
0.7304659, -0.100617, 3.157497, 0.6627451, 0, 1, 1,
0.7305984, 0.4507165, -1.74275, 0.6666667, 0, 1, 1,
0.741853, 2.280691, 0.3571938, 0.6745098, 0, 1, 1,
0.7432157, 2.216973, 1.145902, 0.6784314, 0, 1, 1,
0.7505172, -0.5706224, 1.607815, 0.6862745, 0, 1, 1,
0.7526429, -0.7395741, 2.553639, 0.6901961, 0, 1, 1,
0.7708259, -0.0488809, 3.255443, 0.6980392, 0, 1, 1,
0.7712393, 0.4557876, 0.7705474, 0.7058824, 0, 1, 1,
0.7713234, -0.007853745, 3.07249, 0.7098039, 0, 1, 1,
0.7763498, 1.99653, 0.4343596, 0.7176471, 0, 1, 1,
0.778982, -0.9952686, 1.584354, 0.7215686, 0, 1, 1,
0.7809879, -0.5255111, 1.401679, 0.7294118, 0, 1, 1,
0.7813339, 0.08709338, 1.43284, 0.7333333, 0, 1, 1,
0.7838035, 0.02272275, 0.9036541, 0.7411765, 0, 1, 1,
0.7907022, 1.139422, 0.9857632, 0.7450981, 0, 1, 1,
0.7911704, 0.3023626, 1.757479, 0.7529412, 0, 1, 1,
0.7924693, 0.2968126, 1.392926, 0.7568628, 0, 1, 1,
0.796338, 1.190726, 0.09259532, 0.7647059, 0, 1, 1,
0.7967884, 0.6292216, 2.236282, 0.7686275, 0, 1, 1,
0.8015107, -0.8233902, 3.422046, 0.7764706, 0, 1, 1,
0.8036746, 0.3572221, 0.6919924, 0.7803922, 0, 1, 1,
0.8050757, 0.2777743, 1.548869, 0.7882353, 0, 1, 1,
0.8093409, -0.1841559, 2.30788, 0.7921569, 0, 1, 1,
0.8098651, -0.8053007, 2.892038, 0.8, 0, 1, 1,
0.815012, -0.1311675, 2.315724, 0.8078431, 0, 1, 1,
0.8191645, -1.367374, 3.639629, 0.8117647, 0, 1, 1,
0.821785, 0.4289852, 1.129168, 0.8196079, 0, 1, 1,
0.8235435, 0.9978161, 0.5264867, 0.8235294, 0, 1, 1,
0.8318545, -0.6448943, 4.1874, 0.8313726, 0, 1, 1,
0.8323904, -0.3633314, 2.010697, 0.8352941, 0, 1, 1,
0.8396435, -0.4182658, 0.8064005, 0.8431373, 0, 1, 1,
0.8468685, -1.048323, 1.791238, 0.8470588, 0, 1, 1,
0.8522537, 0.1203082, -0.2174805, 0.854902, 0, 1, 1,
0.8603334, 0.949199, -0.141397, 0.8588235, 0, 1, 1,
0.8619884, 0.2471975, 0.8150856, 0.8666667, 0, 1, 1,
0.8637776, -0.1131912, 1.994053, 0.8705882, 0, 1, 1,
0.8651657, 0.357603, 0.1978409, 0.8784314, 0, 1, 1,
0.8694009, -0.9650252, 1.661756, 0.8823529, 0, 1, 1,
0.877063, 3.042655, 1.403005, 0.8901961, 0, 1, 1,
0.8828315, -0.04273909, 1.788765, 0.8941177, 0, 1, 1,
0.8902721, -1.28189, 3.401557, 0.9019608, 0, 1, 1,
0.890767, -0.9718575, 2.075194, 0.9098039, 0, 1, 1,
0.891339, -0.547481, 1.814303, 0.9137255, 0, 1, 1,
0.8953869, -0.5157095, 1.524432, 0.9215686, 0, 1, 1,
0.899941, 0.6787226, 1.682361, 0.9254902, 0, 1, 1,
0.9009029, -1.898041, 4.449798, 0.9333333, 0, 1, 1,
0.903434, 0.5555715, -0.02098859, 0.9372549, 0, 1, 1,
0.9079624, -1.427893, 1.550553, 0.945098, 0, 1, 1,
0.9141179, 0.9573457, 1.670327, 0.9490196, 0, 1, 1,
0.9148821, -0.2593038, 2.835403, 0.9568627, 0, 1, 1,
0.9194203, -0.2702756, 1.319059, 0.9607843, 0, 1, 1,
0.9241297, 1.779932, -0.5450601, 0.9686275, 0, 1, 1,
0.9403247, -0.9804371, 1.581611, 0.972549, 0, 1, 1,
0.9419239, 0.3987666, 1.160385, 0.9803922, 0, 1, 1,
0.9450908, 0.007591475, 2.131406, 0.9843137, 0, 1, 1,
0.9514319, -0.9781955, 2.60103, 0.9921569, 0, 1, 1,
0.9541451, 0.08446484, 1.520194, 0.9960784, 0, 1, 1,
0.9576501, 0.3122259, 0.9972801, 1, 0, 0.9960784, 1,
0.9670777, -0.2353409, 2.436105, 1, 0, 0.9882353, 1,
0.9688885, 0.1627712, 1.709866, 1, 0, 0.9843137, 1,
0.9701208, -0.124917, 1.156164, 1, 0, 0.9764706, 1,
0.9817996, -1.029698, 4.389428, 1, 0, 0.972549, 1,
0.9837294, 1.334059, -2.181428, 1, 0, 0.9647059, 1,
0.9865586, -1.553935, 1.949563, 1, 0, 0.9607843, 1,
0.9889538, 0.5471679, 0.8423754, 1, 0, 0.9529412, 1,
0.9900677, -1.256209, 2.44657, 1, 0, 0.9490196, 1,
0.9948224, 0.5478375, 0.8326772, 1, 0, 0.9411765, 1,
1.012297, 1.405063, 0.4079639, 1, 0, 0.9372549, 1,
1.015479, -1.346079, 2.261976, 1, 0, 0.9294118, 1,
1.034641, -1.693571, 1.512338, 1, 0, 0.9254902, 1,
1.036559, -0.7991809, 2.565997, 1, 0, 0.9176471, 1,
1.043367, -0.7328216, 2.758208, 1, 0, 0.9137255, 1,
1.050489, -0.2464738, 3.043233, 1, 0, 0.9058824, 1,
1.054227, -1.206136, 1.356127, 1, 0, 0.9019608, 1,
1.063862, -1.037877, 4.519038, 1, 0, 0.8941177, 1,
1.068204, 0.3800253, 2.28804, 1, 0, 0.8862745, 1,
1.074745, -0.3336464, 0.09710684, 1, 0, 0.8823529, 1,
1.075974, 1.435133, 0.4322136, 1, 0, 0.8745098, 1,
1.084292, -0.3846259, 2.384754, 1, 0, 0.8705882, 1,
1.0843, 1.090763, 2.072806, 1, 0, 0.8627451, 1,
1.09261, 1.04556, 1.15351, 1, 0, 0.8588235, 1,
1.096027, 0.191488, 2.636047, 1, 0, 0.8509804, 1,
1.109468, -0.2665656, 2.268804, 1, 0, 0.8470588, 1,
1.112128, -0.6153345, 2.808108, 1, 0, 0.8392157, 1,
1.11481, 0.7387872, 1.125369, 1, 0, 0.8352941, 1,
1.116118, -0.3129729, 1.227162, 1, 0, 0.827451, 1,
1.116334, -0.1762571, 2.136413, 1, 0, 0.8235294, 1,
1.135329, -0.1625493, 0.9914284, 1, 0, 0.8156863, 1,
1.136248, 0.1662737, 3.413844, 1, 0, 0.8117647, 1,
1.137215, 0.5956317, 1.13452, 1, 0, 0.8039216, 1,
1.139832, -0.9131395, 1.528551, 1, 0, 0.7960784, 1,
1.141805, -1.612666, 2.874407, 1, 0, 0.7921569, 1,
1.142801, 1.432332, 0.5574371, 1, 0, 0.7843137, 1,
1.146377, 1.323158, 0.8175184, 1, 0, 0.7803922, 1,
1.152861, -1.395788, 1.512895, 1, 0, 0.772549, 1,
1.167396, 2.478247, 0.01521518, 1, 0, 0.7686275, 1,
1.179487, -0.05030992, 1.705663, 1, 0, 0.7607843, 1,
1.179957, 0.8826444, 1.810972, 1, 0, 0.7568628, 1,
1.180322, 0.7499766, 2.587875, 1, 0, 0.7490196, 1,
1.180787, 0.565114, -0.354897, 1, 0, 0.7450981, 1,
1.18133, -1.288859, 2.404825, 1, 0, 0.7372549, 1,
1.19358, 2.074061, 1.408994, 1, 0, 0.7333333, 1,
1.193731, -0.4401402, 0.7335795, 1, 0, 0.7254902, 1,
1.19941, 1.805765, 0.3019187, 1, 0, 0.7215686, 1,
1.20256, -1.767882, 2.774237, 1, 0, 0.7137255, 1,
1.205417, 0.194285, 1.898288, 1, 0, 0.7098039, 1,
1.206857, 1.171804, 1.067391, 1, 0, 0.7019608, 1,
1.220758, 1.236634, 0.9563023, 1, 0, 0.6941177, 1,
1.225994, -0.3965555, 2.434482, 1, 0, 0.6901961, 1,
1.228716, -0.1591997, 0.8883944, 1, 0, 0.682353, 1,
1.233167, 0.7142031, -0.0696853, 1, 0, 0.6784314, 1,
1.234599, 0.9128368, 1.800181, 1, 0, 0.6705883, 1,
1.241017, -0.563267, 0.495654, 1, 0, 0.6666667, 1,
1.247437, 0.3607373, -0.1603762, 1, 0, 0.6588235, 1,
1.254418, -0.4803356, 2.545538, 1, 0, 0.654902, 1,
1.255472, -0.2754447, 2.959455, 1, 0, 0.6470588, 1,
1.268044, -0.7242672, 2.051488, 1, 0, 0.6431373, 1,
1.278791, -1.803016, 4.664443, 1, 0, 0.6352941, 1,
1.281574, -0.5824761, 1.848783, 1, 0, 0.6313726, 1,
1.29009, -0.2066446, 0.472617, 1, 0, 0.6235294, 1,
1.294713, -0.04939298, 0.9053044, 1, 0, 0.6196079, 1,
1.295426, -2.224979, 4.421304, 1, 0, 0.6117647, 1,
1.295605, -0.4459637, 3.758689, 1, 0, 0.6078432, 1,
1.297395, -1.830474, 2.967628, 1, 0, 0.6, 1,
1.320644, 1.81154, 0.467565, 1, 0, 0.5921569, 1,
1.322585, 0.224942, 1.524986, 1, 0, 0.5882353, 1,
1.339943, -1.757499, 2.861015, 1, 0, 0.5803922, 1,
1.35041, 0.494942, 1.213237, 1, 0, 0.5764706, 1,
1.351714, 2.118291, -1.427844, 1, 0, 0.5686275, 1,
1.368132, -1.074452, 1.132342, 1, 0, 0.5647059, 1,
1.390075, 0.4146177, 0.8902458, 1, 0, 0.5568628, 1,
1.39259, 0.134472, 2.168856, 1, 0, 0.5529412, 1,
1.400488, 1.685183, 1.218235, 1, 0, 0.5450981, 1,
1.405689, -0.04233469, 1.397594, 1, 0, 0.5411765, 1,
1.412834, 0.8501241, 1.384367, 1, 0, 0.5333334, 1,
1.421531, 0.5670852, -0.05371703, 1, 0, 0.5294118, 1,
1.428966, -0.6861741, 1.501974, 1, 0, 0.5215687, 1,
1.435763, -0.4245889, 1.254891, 1, 0, 0.5176471, 1,
1.447766, 1.831284, -0.3953997, 1, 0, 0.509804, 1,
1.447799, 1.04109, -1.088232, 1, 0, 0.5058824, 1,
1.457667, 0.05387123, 2.142879, 1, 0, 0.4980392, 1,
1.470713, 0.03627755, 0.8820894, 1, 0, 0.4901961, 1,
1.474292, 0.9206573, 1.26193, 1, 0, 0.4862745, 1,
1.477793, 1.317501, -1.46536, 1, 0, 0.4784314, 1,
1.488494, 0.145193, 1.753615, 1, 0, 0.4745098, 1,
1.490395, 0.7309475, 0.340682, 1, 0, 0.4666667, 1,
1.494989, 0.3647371, 0.9208456, 1, 0, 0.4627451, 1,
1.505476, 0.1163454, 1.409844, 1, 0, 0.454902, 1,
1.536173, -1.337977, 2.008367, 1, 0, 0.4509804, 1,
1.558637, 0.01606154, 1.881847, 1, 0, 0.4431373, 1,
1.560304, 0.7467915, 1.707085, 1, 0, 0.4392157, 1,
1.572892, -0.2157334, 2.254003, 1, 0, 0.4313726, 1,
1.57808, 0.086725, -0.3523132, 1, 0, 0.427451, 1,
1.585205, 0.9257403, 1.169679, 1, 0, 0.4196078, 1,
1.587749, -0.5906113, -0.4813326, 1, 0, 0.4156863, 1,
1.602115, 0.1057727, 0.8214824, 1, 0, 0.4078431, 1,
1.605287, 0.06741153, 3.848379, 1, 0, 0.4039216, 1,
1.60772, 1.538664, 1.225983, 1, 0, 0.3960784, 1,
1.61008, 0.1674209, 0.8236417, 1, 0, 0.3882353, 1,
1.625219, -0.6935958, 1.265218, 1, 0, 0.3843137, 1,
1.626382, 0.5795133, -0.4499831, 1, 0, 0.3764706, 1,
1.637348, 1.074978, 1.147715, 1, 0, 0.372549, 1,
1.637595, 0.9810574, 0.9754363, 1, 0, 0.3647059, 1,
1.640216, -0.485394, 2.4231, 1, 0, 0.3607843, 1,
1.642657, -0.07885875, 2.528311, 1, 0, 0.3529412, 1,
1.643365, -0.8167149, 2.148945, 1, 0, 0.3490196, 1,
1.649076, -0.4078336, 0.9985458, 1, 0, 0.3411765, 1,
1.653647, 0.04766689, 1.730106, 1, 0, 0.3372549, 1,
1.653795, 0.4933133, 1.630043, 1, 0, 0.3294118, 1,
1.656259, 0.7950451, 0.7482672, 1, 0, 0.3254902, 1,
1.666288, -0.6847122, 3.335663, 1, 0, 0.3176471, 1,
1.675559, -0.2784146, 1.746976, 1, 0, 0.3137255, 1,
1.704583, 0.03946044, 0.1398024, 1, 0, 0.3058824, 1,
1.705939, 0.5257931, 1.379325, 1, 0, 0.2980392, 1,
1.707608, 1.11069, -0.1742961, 1, 0, 0.2941177, 1,
1.707856, 0.8476723, -0.08173402, 1, 0, 0.2862745, 1,
1.71235, -0.9747494, 2.805824, 1, 0, 0.282353, 1,
1.720213, 1.771018, 1.017425, 1, 0, 0.2745098, 1,
1.729967, -0.1580315, 1.377324, 1, 0, 0.2705882, 1,
1.738288, -0.8997622, 1.947827, 1, 0, 0.2627451, 1,
1.764493, 0.2308359, 2.71347, 1, 0, 0.2588235, 1,
1.764498, 0.810127, 2.033059, 1, 0, 0.2509804, 1,
1.76851, -0.7812711, 1.436569, 1, 0, 0.2470588, 1,
1.769766, -1.567961, 3.035248, 1, 0, 0.2392157, 1,
1.770249, 0.5488276, 0.8467783, 1, 0, 0.2352941, 1,
1.779457, -0.08115854, 2.598053, 1, 0, 0.227451, 1,
1.783538, 1.116966, 0.7431641, 1, 0, 0.2235294, 1,
1.783852, 0.3578647, 0.7341129, 1, 0, 0.2156863, 1,
1.792508, 0.2343745, 0.1906571, 1, 0, 0.2117647, 1,
1.828352, -0.04528691, 1.726775, 1, 0, 0.2039216, 1,
1.848885, 0.9951717, 0.8190747, 1, 0, 0.1960784, 1,
1.860795, -0.3061113, 1.112745, 1, 0, 0.1921569, 1,
1.869814, 1.386721, 1.113039, 1, 0, 0.1843137, 1,
1.893709, 0.9410548, -0.3625013, 1, 0, 0.1803922, 1,
1.899125, 0.1261144, 0.6949481, 1, 0, 0.172549, 1,
1.914939, 0.01526233, 0.7717237, 1, 0, 0.1686275, 1,
1.921709, -2.652975, 2.731759, 1, 0, 0.1607843, 1,
1.923589, 0.3836887, 2.123141, 1, 0, 0.1568628, 1,
1.953634, 0.6469625, 1.30221, 1, 0, 0.1490196, 1,
1.967339, -1.529399, 2.924154, 1, 0, 0.145098, 1,
1.977378, -0.140095, 1.98643, 1, 0, 0.1372549, 1,
1.980419, 0.03140523, 2.323387, 1, 0, 0.1333333, 1,
1.986629, -2.252743, 3.284367, 1, 0, 0.1254902, 1,
2.028793, 0.1428187, 2.385215, 1, 0, 0.1215686, 1,
2.038357, -1.207255, 1.909962, 1, 0, 0.1137255, 1,
2.038529, -0.8189074, 0.3401466, 1, 0, 0.1098039, 1,
2.096381, 0.220478, 1.548377, 1, 0, 0.1019608, 1,
2.133618, 1.088303, 0.9099077, 1, 0, 0.09411765, 1,
2.163922, 0.8824857, -0.4601674, 1, 0, 0.09019608, 1,
2.232713, 2.077899, -0.1416985, 1, 0, 0.08235294, 1,
2.296753, 0.03742531, 2.486753, 1, 0, 0.07843138, 1,
2.381042, 0.1021929, 0.009819504, 1, 0, 0.07058824, 1,
2.449243, 2.92628, 0.6686597, 1, 0, 0.06666667, 1,
2.478756, -1.117657, 2.558921, 1, 0, 0.05882353, 1,
2.609007, 0.2464814, 3.345993, 1, 0, 0.05490196, 1,
2.615353, -0.4197176, 1.629335, 1, 0, 0.04705882, 1,
2.680754, 0.3839131, 2.84535, 1, 0, 0.04313726, 1,
2.746992, -0.7801343, 2.502911, 1, 0, 0.03529412, 1,
2.757018, -2.09797, 2.5899, 1, 0, 0.03137255, 1,
2.804692, 1.272062, 0.3363214, 1, 0, 0.02352941, 1,
2.896678, -0.9524888, 1.142445, 1, 0, 0.01960784, 1,
3.247043, -0.3973915, 0.7376763, 1, 0, 0.01176471, 1,
3.56379, 0.1070552, 2.393845, 1, 0, 0.007843138, 1
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
-0.07040513, -4.374211, -7.219122, 0, -0.5, 0.5, 0.5,
-0.07040513, -4.374211, -7.219122, 1, -0.5, 0.5, 0.5,
-0.07040513, -4.374211, -7.219122, 1, 1.5, 0.5, 0.5,
-0.07040513, -4.374211, -7.219122, 0, 1.5, 0.5, 0.5
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
-4.936592, -0.1283013, -7.219122, 0, -0.5, 0.5, 0.5,
-4.936592, -0.1283013, -7.219122, 1, -0.5, 0.5, 0.5,
-4.936592, -0.1283013, -7.219122, 1, 1.5, 0.5, 0.5,
-4.936592, -0.1283013, -7.219122, 0, 1.5, 0.5, 0.5
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
-4.936592, -4.374211, 0.2357814, 0, -0.5, 0.5, 0.5,
-4.936592, -4.374211, 0.2357814, 1, -0.5, 0.5, 0.5,
-4.936592, -4.374211, 0.2357814, 1, 1.5, 0.5, 0.5,
-4.936592, -4.374211, 0.2357814, 0, 1.5, 0.5, 0.5
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
-2, -3.394386, -5.49876,
2, -3.394386, -5.49876,
-2, -3.394386, -5.49876,
-2, -3.55769, -5.785487,
0, -3.394386, -5.49876,
0, -3.55769, -5.785487,
2, -3.394386, -5.49876,
2, -3.55769, -5.785487
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
"0",
"2"
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
-2, -3.884299, -6.358941, 0, -0.5, 0.5, 0.5,
-2, -3.884299, -6.358941, 1, -0.5, 0.5, 0.5,
-2, -3.884299, -6.358941, 1, 1.5, 0.5, 0.5,
-2, -3.884299, -6.358941, 0, 1.5, 0.5, 0.5,
0, -3.884299, -6.358941, 0, -0.5, 0.5, 0.5,
0, -3.884299, -6.358941, 1, -0.5, 0.5, 0.5,
0, -3.884299, -6.358941, 1, 1.5, 0.5, 0.5,
0, -3.884299, -6.358941, 0, 1.5, 0.5, 0.5,
2, -3.884299, -6.358941, 0, -0.5, 0.5, 0.5,
2, -3.884299, -6.358941, 1, -0.5, 0.5, 0.5,
2, -3.884299, -6.358941, 1, 1.5, 0.5, 0.5,
2, -3.884299, -6.358941, 0, 1.5, 0.5, 0.5
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
-3.813626, -3, -5.49876,
-3.813626, 3, -5.49876,
-3.813626, -3, -5.49876,
-4.000787, -3, -5.785487,
-3.813626, -2, -5.49876,
-4.000787, -2, -5.785487,
-3.813626, -1, -5.49876,
-4.000787, -1, -5.785487,
-3.813626, 0, -5.49876,
-4.000787, 0, -5.785487,
-3.813626, 1, -5.49876,
-4.000787, 1, -5.785487,
-3.813626, 2, -5.49876,
-4.000787, 2, -5.785487,
-3.813626, 3, -5.49876,
-4.000787, 3, -5.785487
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
-4.375109, -3, -6.358941, 0, -0.5, 0.5, 0.5,
-4.375109, -3, -6.358941, 1, -0.5, 0.5, 0.5,
-4.375109, -3, -6.358941, 1, 1.5, 0.5, 0.5,
-4.375109, -3, -6.358941, 0, 1.5, 0.5, 0.5,
-4.375109, -2, -6.358941, 0, -0.5, 0.5, 0.5,
-4.375109, -2, -6.358941, 1, -0.5, 0.5, 0.5,
-4.375109, -2, -6.358941, 1, 1.5, 0.5, 0.5,
-4.375109, -2, -6.358941, 0, 1.5, 0.5, 0.5,
-4.375109, -1, -6.358941, 0, -0.5, 0.5, 0.5,
-4.375109, -1, -6.358941, 1, -0.5, 0.5, 0.5,
-4.375109, -1, -6.358941, 1, 1.5, 0.5, 0.5,
-4.375109, -1, -6.358941, 0, 1.5, 0.5, 0.5,
-4.375109, 0, -6.358941, 0, -0.5, 0.5, 0.5,
-4.375109, 0, -6.358941, 1, -0.5, 0.5, 0.5,
-4.375109, 0, -6.358941, 1, 1.5, 0.5, 0.5,
-4.375109, 0, -6.358941, 0, 1.5, 0.5, 0.5,
-4.375109, 1, -6.358941, 0, -0.5, 0.5, 0.5,
-4.375109, 1, -6.358941, 1, -0.5, 0.5, 0.5,
-4.375109, 1, -6.358941, 1, 1.5, 0.5, 0.5,
-4.375109, 1, -6.358941, 0, 1.5, 0.5, 0.5,
-4.375109, 2, -6.358941, 0, -0.5, 0.5, 0.5,
-4.375109, 2, -6.358941, 1, -0.5, 0.5, 0.5,
-4.375109, 2, -6.358941, 1, 1.5, 0.5, 0.5,
-4.375109, 2, -6.358941, 0, 1.5, 0.5, 0.5,
-4.375109, 3, -6.358941, 0, -0.5, 0.5, 0.5,
-4.375109, 3, -6.358941, 1, -0.5, 0.5, 0.5,
-4.375109, 3, -6.358941, 1, 1.5, 0.5, 0.5,
-4.375109, 3, -6.358941, 0, 1.5, 0.5, 0.5
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
-3.813626, -3.394386, -4,
-3.813626, -3.394386, 4,
-3.813626, -3.394386, -4,
-4.000787, -3.55769, -4,
-3.813626, -3.394386, -2,
-4.000787, -3.55769, -2,
-3.813626, -3.394386, 0,
-4.000787, -3.55769, 0,
-3.813626, -3.394386, 2,
-4.000787, -3.55769, 2,
-3.813626, -3.394386, 4,
-4.000787, -3.55769, 4
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
-4.375109, -3.884299, -4, 0, -0.5, 0.5, 0.5,
-4.375109, -3.884299, -4, 1, -0.5, 0.5, 0.5,
-4.375109, -3.884299, -4, 1, 1.5, 0.5, 0.5,
-4.375109, -3.884299, -4, 0, 1.5, 0.5, 0.5,
-4.375109, -3.884299, -2, 0, -0.5, 0.5, 0.5,
-4.375109, -3.884299, -2, 1, -0.5, 0.5, 0.5,
-4.375109, -3.884299, -2, 1, 1.5, 0.5, 0.5,
-4.375109, -3.884299, -2, 0, 1.5, 0.5, 0.5,
-4.375109, -3.884299, 0, 0, -0.5, 0.5, 0.5,
-4.375109, -3.884299, 0, 1, -0.5, 0.5, 0.5,
-4.375109, -3.884299, 0, 1, 1.5, 0.5, 0.5,
-4.375109, -3.884299, 0, 0, 1.5, 0.5, 0.5,
-4.375109, -3.884299, 2, 0, -0.5, 0.5, 0.5,
-4.375109, -3.884299, 2, 1, -0.5, 0.5, 0.5,
-4.375109, -3.884299, 2, 1, 1.5, 0.5, 0.5,
-4.375109, -3.884299, 2, 0, 1.5, 0.5, 0.5,
-4.375109, -3.884299, 4, 0, -0.5, 0.5, 0.5,
-4.375109, -3.884299, 4, 1, -0.5, 0.5, 0.5,
-4.375109, -3.884299, 4, 1, 1.5, 0.5, 0.5,
-4.375109, -3.884299, 4, 0, 1.5, 0.5, 0.5
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
-3.813626, -3.394386, -5.49876,
-3.813626, 3.137784, -5.49876,
-3.813626, -3.394386, 5.970323,
-3.813626, 3.137784, 5.970323,
-3.813626, -3.394386, -5.49876,
-3.813626, -3.394386, 5.970323,
-3.813626, 3.137784, -5.49876,
-3.813626, 3.137784, 5.970323,
-3.813626, -3.394386, -5.49876,
3.672816, -3.394386, -5.49876,
-3.813626, -3.394386, 5.970323,
3.672816, -3.394386, 5.970323,
-3.813626, 3.137784, -5.49876,
3.672816, 3.137784, -5.49876,
-3.813626, 3.137784, 5.970323,
3.672816, 3.137784, 5.970323,
3.672816, -3.394386, -5.49876,
3.672816, 3.137784, -5.49876,
3.672816, -3.394386, 5.970323,
3.672816, 3.137784, 5.970323,
3.672816, -3.394386, -5.49876,
3.672816, -3.394386, 5.970323,
3.672816, 3.137784, -5.49876,
3.672816, 3.137784, 5.970323
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
var radius = 8.10272;
var distance = 36.04992;
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
mvMatrix.translate( 0.07040513, 0.1283013, -0.2357814 );
mvMatrix.scale( 1.170225, 1.341181, 0.763864 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.04992);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Propamocarb<-read.table("Propamocarb.xyz")
```

```
## Error in read.table("Propamocarb.xyz"): no lines available in input
```

```r
x<-Propamocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propamocarb' not found
```

```r
y<-Propamocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propamocarb' not found
```

```r
z<-Propamocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propamocarb' not found
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
-3.7046, 1.12474, -1.536777, 0, 0, 1, 1, 1,
-3.223521, 0.4336264, -2.877044, 1, 0, 0, 1, 1,
-2.872783, -0.8972219, -3.492791, 1, 0, 0, 1, 1,
-2.686543, -0.09887476, -1.556521, 1, 0, 0, 1, 1,
-2.627891, -2.403318, -1.038961, 1, 0, 0, 1, 1,
-2.617725, -0.3052542, -3.313682, 1, 0, 0, 1, 1,
-2.588443, -0.9079963, -1.109716, 0, 0, 0, 1, 1,
-2.566408, 0.8163047, -2.022801, 0, 0, 0, 1, 1,
-2.56144, -0.3630468, -2.406749, 0, 0, 0, 1, 1,
-2.548244, 0.8551423, -0.9445387, 0, 0, 0, 1, 1,
-2.537347, -0.6562736, 0.1996682, 0, 0, 0, 1, 1,
-2.514232, -1.846029, -3.234266, 0, 0, 0, 1, 1,
-2.38537, -0.05848625, -1.772684, 0, 0, 0, 1, 1,
-2.272349, -0.6493769, -1.24049, 1, 1, 1, 1, 1,
-2.264631, -1.028802, -2.090844, 1, 1, 1, 1, 1,
-2.184714, 0.0763397, -0.2353613, 1, 1, 1, 1, 1,
-2.177267, -0.6155422, 0.2043244, 1, 1, 1, 1, 1,
-2.124292, 0.8686667, -1.909052, 1, 1, 1, 1, 1,
-2.078754, 0.1909688, 0.05674403, 1, 1, 1, 1, 1,
-2.076407, -1.657514, -2.986216, 1, 1, 1, 1, 1,
-2.061202, 0.4992555, 0.3174911, 1, 1, 1, 1, 1,
-1.961283, 0.5905017, -1.928437, 1, 1, 1, 1, 1,
-1.949999, 0.05210502, -0.2687936, 1, 1, 1, 1, 1,
-1.935481, -1.372859, -1.095737, 1, 1, 1, 1, 1,
-1.876555, 1.415318, -0.4050308, 1, 1, 1, 1, 1,
-1.876443, 0.4221997, -1.503204, 1, 1, 1, 1, 1,
-1.855196, 0.9096726, -1.071698, 1, 1, 1, 1, 1,
-1.837165, 2.018388, -0.47973, 1, 1, 1, 1, 1,
-1.82421, 0.5552611, -2.043678, 0, 0, 1, 1, 1,
-1.800912, 0.4184917, -2.325642, 1, 0, 0, 1, 1,
-1.794549, -0.07377399, 0.6040587, 1, 0, 0, 1, 1,
-1.791565, -0.5799755, -1.147393, 1, 0, 0, 1, 1,
-1.7868, 1.109545, -1.549035, 1, 0, 0, 1, 1,
-1.783128, 1.072254, -1.289375, 1, 0, 0, 1, 1,
-1.778108, 1.305023, -0.7489591, 0, 0, 0, 1, 1,
-1.755863, 0.6241891, -1.970063, 0, 0, 0, 1, 1,
-1.748997, -1.596726, -0.9561012, 0, 0, 0, 1, 1,
-1.732847, -0.05995165, -3.712092, 0, 0, 0, 1, 1,
-1.729745, 0.17612, -1.232295, 0, 0, 0, 1, 1,
-1.724111, -0.05791027, -1.724492, 0, 0, 0, 1, 1,
-1.722835, 1.49821, -0.5908318, 0, 0, 0, 1, 1,
-1.717853, -0.09932889, -1.985285, 1, 1, 1, 1, 1,
-1.713733, -1.4278, -1.548078, 1, 1, 1, 1, 1,
-1.712626, -0.3210596, -1.578194, 1, 1, 1, 1, 1,
-1.70104, 0.4702181, -0.290975, 1, 1, 1, 1, 1,
-1.698357, -1.490944, -1.005352, 1, 1, 1, 1, 1,
-1.698254, 0.138856, -0.5947409, 1, 1, 1, 1, 1,
-1.685284, 1.070985, -1.703583, 1, 1, 1, 1, 1,
-1.674416, 0.2779804, -2.717134, 1, 1, 1, 1, 1,
-1.665988, -0.5278106, -1.961259, 1, 1, 1, 1, 1,
-1.652391, 0.6718289, -0.3583311, 1, 1, 1, 1, 1,
-1.650253, -0.505275, -1.733018, 1, 1, 1, 1, 1,
-1.618721, 1.797069, -0.3629976, 1, 1, 1, 1, 1,
-1.61373, 0.5807273, -1.360518, 1, 1, 1, 1, 1,
-1.604646, 0.1673003, -3.66789, 1, 1, 1, 1, 1,
-1.582638, 0.3156019, -2.869353, 1, 1, 1, 1, 1,
-1.545835, -1.363918, -2.766907, 0, 0, 1, 1, 1,
-1.529719, -0.257392, -0.9740963, 1, 0, 0, 1, 1,
-1.528979, -0.7631517, -2.951937, 1, 0, 0, 1, 1,
-1.502927, 0.6926107, -0.5194342, 1, 0, 0, 1, 1,
-1.492992, 0.8684298, -0.8731278, 1, 0, 0, 1, 1,
-1.492896, 0.7153951, -0.6548739, 1, 0, 0, 1, 1,
-1.485718, 1.007032, -3.378065, 0, 0, 0, 1, 1,
-1.484711, -0.8265128, -2.681391, 0, 0, 0, 1, 1,
-1.465345, -0.01225922, -3.556043, 0, 0, 0, 1, 1,
-1.459587, -0.6833439, -2.665511, 0, 0, 0, 1, 1,
-1.454897, 1.791972, -0.862949, 0, 0, 0, 1, 1,
-1.451859, -0.1499824, -1.201739, 0, 0, 0, 1, 1,
-1.436652, -0.9679238, -2.784323, 0, 0, 0, 1, 1,
-1.430079, -0.4242712, -2.632717, 1, 1, 1, 1, 1,
-1.429808, 1.102676, -1.455524, 1, 1, 1, 1, 1,
-1.427554, -0.3497318, -2.030039, 1, 1, 1, 1, 1,
-1.425485, -2.285951, -3.040211, 1, 1, 1, 1, 1,
-1.412405, 0.6254013, 0.06583725, 1, 1, 1, 1, 1,
-1.403743, 0.02403504, -2.363166, 1, 1, 1, 1, 1,
-1.398265, -0.2771782, -2.40597, 1, 1, 1, 1, 1,
-1.392004, -0.15582, -3.024258, 1, 1, 1, 1, 1,
-1.389377, 0.7731988, -2.926424, 1, 1, 1, 1, 1,
-1.386637, -1.216259, -3.713115, 1, 1, 1, 1, 1,
-1.384029, 0.1775574, -1.080586, 1, 1, 1, 1, 1,
-1.363391, 0.4670693, -0.2026146, 1, 1, 1, 1, 1,
-1.362279, 2.156521, -1.080815, 1, 1, 1, 1, 1,
-1.352597, -0.7590969, -2.452441, 1, 1, 1, 1, 1,
-1.343096, -0.8802172, -1.052723, 1, 1, 1, 1, 1,
-1.341027, 1.539648, -0.01985562, 0, 0, 1, 1, 1,
-1.336355, -0.7150488, -2.580172, 1, 0, 0, 1, 1,
-1.334349, 0.09014301, -0.8455465, 1, 0, 0, 1, 1,
-1.333343, 0.3469169, -3.26175, 1, 0, 0, 1, 1,
-1.329344, 0.2669138, -0.8186396, 1, 0, 0, 1, 1,
-1.327788, -1.447364, -2.622041, 1, 0, 0, 1, 1,
-1.324502, 0.7821022, -1.965363, 0, 0, 0, 1, 1,
-1.318535, 1.088272, -1.037677, 0, 0, 0, 1, 1,
-1.302661, 2.290035, 1.715895, 0, 0, 0, 1, 1,
-1.301884, -1.611263, -1.11654, 0, 0, 0, 1, 1,
-1.300064, 0.3441922, -2.188113, 0, 0, 0, 1, 1,
-1.296395, 0.3305851, -1.855808, 0, 0, 0, 1, 1,
-1.295585, -0.0297924, -1.312593, 0, 0, 0, 1, 1,
-1.292788, 0.888319, -2.282149, 1, 1, 1, 1, 1,
-1.289823, -0.626765, -3.056681, 1, 1, 1, 1, 1,
-1.286483, -0.2027416, -3.206695, 1, 1, 1, 1, 1,
-1.260284, 0.2390861, -1.486149, 1, 1, 1, 1, 1,
-1.259067, -0.5903267, -3.131112, 1, 1, 1, 1, 1,
-1.241772, -0.07207845, -0.1880213, 1, 1, 1, 1, 1,
-1.238471, -0.4220417, -2.405629, 1, 1, 1, 1, 1,
-1.236507, -0.7522032, -1.720878, 1, 1, 1, 1, 1,
-1.235618, -1.43879, -3.257132, 1, 1, 1, 1, 1,
-1.232422, -0.4143693, -1.719067, 1, 1, 1, 1, 1,
-1.223908, -0.3440388, -2.470513, 1, 1, 1, 1, 1,
-1.221167, 0.01365614, -1.232456, 1, 1, 1, 1, 1,
-1.219669, 1.10955, -1.295671, 1, 1, 1, 1, 1,
-1.214348, -0.9982616, -4.561838, 1, 1, 1, 1, 1,
-1.212888, 0.196431, -1.881346, 1, 1, 1, 1, 1,
-1.212412, 0.4715375, -0.8115032, 0, 0, 1, 1, 1,
-1.211546, 0.7383067, -1.265181, 1, 0, 0, 1, 1,
-1.201324, -1.044668, -2.441639, 1, 0, 0, 1, 1,
-1.200295, 2.545283, -0.3734657, 1, 0, 0, 1, 1,
-1.195422, -0.1965271, -3.249549, 1, 0, 0, 1, 1,
-1.188291, 1.692684, 0.4716842, 1, 0, 0, 1, 1,
-1.186282, 1.580736, -1.380135, 0, 0, 0, 1, 1,
-1.183507, 1.438817, -1.278088, 0, 0, 0, 1, 1,
-1.17916, 0.8764267, -0.8962927, 0, 0, 0, 1, 1,
-1.171162, -0.3983291, -1.654616, 0, 0, 0, 1, 1,
-1.165879, -1.102663, -1.981877, 0, 0, 0, 1, 1,
-1.165096, -0.9143699, -2.13253, 0, 0, 0, 1, 1,
-1.153796, -0.1308249, -1.125314, 0, 0, 0, 1, 1,
-1.148979, -0.09063976, -0.93973, 1, 1, 1, 1, 1,
-1.146305, -0.479583, -2.241966, 1, 1, 1, 1, 1,
-1.144721, 1.930689, -1.297132, 1, 1, 1, 1, 1,
-1.143468, -1.132652, -1.523581, 1, 1, 1, 1, 1,
-1.141166, 0.7503167, -1.506557, 1, 1, 1, 1, 1,
-1.139853, 0.003913024, -1.3073, 1, 1, 1, 1, 1,
-1.135549, -0.4645098, -1.667278, 1, 1, 1, 1, 1,
-1.126915, 1.471436, -1.322464, 1, 1, 1, 1, 1,
-1.122872, -0.280349, -1.554894, 1, 1, 1, 1, 1,
-1.119607, -1.020841, -1.80275, 1, 1, 1, 1, 1,
-1.117855, -0.844811, -2.264615, 1, 1, 1, 1, 1,
-1.114644, 0.5571036, -1.980569, 1, 1, 1, 1, 1,
-1.111531, 2.155007, -0.6214198, 1, 1, 1, 1, 1,
-1.110698, -1.445196, -2.525133, 1, 1, 1, 1, 1,
-1.105144, 0.9908231, -0.4245348, 1, 1, 1, 1, 1,
-1.090706, 0.3473193, 0.385983, 0, 0, 1, 1, 1,
-1.085552, 0.5247299, -2.255974, 1, 0, 0, 1, 1,
-1.065926, -1.152619, -1.401613, 1, 0, 0, 1, 1,
-1.058941, -0.09490905, -2.107662, 1, 0, 0, 1, 1,
-1.051927, 1.359944, 0.3419684, 1, 0, 0, 1, 1,
-1.051246, -1.284857, -4.370853, 1, 0, 0, 1, 1,
-1.039521, -0.1854861, -1.35271, 0, 0, 0, 1, 1,
-1.036551, 0.1512544, -1.573235, 0, 0, 0, 1, 1,
-1.036519, 0.06352193, -1.640079, 0, 0, 0, 1, 1,
-1.036216, -0.5404314, -3.097516, 0, 0, 0, 1, 1,
-1.036139, -0.8237286, -0.5967457, 0, 0, 0, 1, 1,
-1.027614, 1.112575, -2.877365, 0, 0, 0, 1, 1,
-1.026219, -2.242325, -2.317608, 0, 0, 0, 1, 1,
-1.020925, 0.3150854, -1.489623, 1, 1, 1, 1, 1,
-1.020527, -1.784949, -2.301175, 1, 1, 1, 1, 1,
-1.016207, -0.8282922, -2.478042, 1, 1, 1, 1, 1,
-1.011422, -0.03585107, 1.558256, 1, 1, 1, 1, 1,
-1.007856, 1.346644, -0.4553026, 1, 1, 1, 1, 1,
-0.994361, -1.374041, -5.079322, 1, 1, 1, 1, 1,
-0.9884775, 1.017707, -0.4972253, 1, 1, 1, 1, 1,
-0.9837112, -0.09431069, -0.6389832, 1, 1, 1, 1, 1,
-0.9814405, 0.02246758, -0.3799085, 1, 1, 1, 1, 1,
-0.9813331, 1.46425, -1.085976, 1, 1, 1, 1, 1,
-0.976488, -2.093458, -2.796364, 1, 1, 1, 1, 1,
-0.9763864, -0.1414777, -2.440597, 1, 1, 1, 1, 1,
-0.9713234, -0.7904327, -2.9748, 1, 1, 1, 1, 1,
-0.9710682, -1.335113, -1.400006, 1, 1, 1, 1, 1,
-0.9692663, -0.7058665, -2.778229, 1, 1, 1, 1, 1,
-0.9617897, -0.9208605, -0.2956624, 0, 0, 1, 1, 1,
-0.9546804, 1.5539, -1.363656, 1, 0, 0, 1, 1,
-0.9492864, 1.573626, -1.935254, 1, 0, 0, 1, 1,
-0.9466833, -1.238425, -3.237188, 1, 0, 0, 1, 1,
-0.9458384, -0.3350259, -2.151777, 1, 0, 0, 1, 1,
-0.9449487, 0.8007979, -2.179159, 1, 0, 0, 1, 1,
-0.9447224, 1.210998, -1.473391, 0, 0, 0, 1, 1,
-0.941401, -0.9410163, -1.928714, 0, 0, 0, 1, 1,
-0.9324057, 0.4788477, -0.6912099, 0, 0, 0, 1, 1,
-0.9312454, -0.1412744, -1.801952, 0, 0, 0, 1, 1,
-0.9291767, 0.6098011, -2.639326, 0, 0, 0, 1, 1,
-0.9284031, 0.5328182, -0.617101, 0, 0, 0, 1, 1,
-0.9254702, -1.745122, -3.264, 0, 0, 0, 1, 1,
-0.9239531, 1.327059, -0.37961, 1, 1, 1, 1, 1,
-0.923601, -0.4973115, -1.551488, 1, 1, 1, 1, 1,
-0.9121996, 0.009927165, -1.881119, 1, 1, 1, 1, 1,
-0.9058585, 1.46038, -1.182154, 1, 1, 1, 1, 1,
-0.9028176, -0.4343798, -1.930729, 1, 1, 1, 1, 1,
-0.9027984, 1.123523, -0.5477975, 1, 1, 1, 1, 1,
-0.8944452, -0.5143915, -0.5592505, 1, 1, 1, 1, 1,
-0.8913621, 0.04246859, -1.269802, 1, 1, 1, 1, 1,
-0.8879616, -0.03995734, -2.825496, 1, 1, 1, 1, 1,
-0.8856969, -0.9856954, -2.881386, 1, 1, 1, 1, 1,
-0.8841724, -0.3928421, -2.563946, 1, 1, 1, 1, 1,
-0.882063, -0.05482018, -0.9677129, 1, 1, 1, 1, 1,
-0.8812522, 1.507416, -0.1432019, 1, 1, 1, 1, 1,
-0.8803592, -1.284763, -4.704551, 1, 1, 1, 1, 1,
-0.8788491, 0.07977908, -0.6057886, 1, 1, 1, 1, 1,
-0.8638644, -0.1916646, -1.7376, 0, 0, 1, 1, 1,
-0.8624507, -0.8561149, -0.2175203, 1, 0, 0, 1, 1,
-0.8609067, -0.4700627, -1.817381, 1, 0, 0, 1, 1,
-0.8586828, -0.2014263, -1.662466, 1, 0, 0, 1, 1,
-0.8579078, -0.9049166, -1.264075, 1, 0, 0, 1, 1,
-0.8565741, -0.5758806, -1.805111, 1, 0, 0, 1, 1,
-0.8535323, -0.7643934, -2.272047, 0, 0, 0, 1, 1,
-0.8460693, 0.3898598, 1.033799, 0, 0, 0, 1, 1,
-0.8393408, -1.630406, -2.906298, 0, 0, 0, 1, 1,
-0.8306847, -0.6204196, -1.431992, 0, 0, 0, 1, 1,
-0.8243271, 0.8281776, -0.815059, 0, 0, 0, 1, 1,
-0.8217466, 0.2102356, 0.1067345, 0, 0, 0, 1, 1,
-0.8217275, -0.9033207, -0.6372698, 0, 0, 0, 1, 1,
-0.8208196, 0.2126833, -2.751932, 1, 1, 1, 1, 1,
-0.8185413, -0.9866761, -1.572564, 1, 1, 1, 1, 1,
-0.8174711, -2.717525, -3.630395, 1, 1, 1, 1, 1,
-0.8038707, 0.2894729, -1.204875, 1, 1, 1, 1, 1,
-0.7916619, 2.213069, -0.6949446, 1, 1, 1, 1, 1,
-0.7910756, 0.238646, -1.742199, 1, 1, 1, 1, 1,
-0.7883713, -0.3484371, -0.8109614, 1, 1, 1, 1, 1,
-0.78376, 0.4912007, -0.9449577, 1, 1, 1, 1, 1,
-0.7819, 1.73672, -0.9498975, 1, 1, 1, 1, 1,
-0.7812661, -0.1247246, 0.02004124, 1, 1, 1, 1, 1,
-0.7801577, 0.4579731, -1.433293, 1, 1, 1, 1, 1,
-0.7800658, 0.245488, -0.4853018, 1, 1, 1, 1, 1,
-0.7782727, -1.525408, -2.261656, 1, 1, 1, 1, 1,
-0.7764524, 0.5850638, -3.070464, 1, 1, 1, 1, 1,
-0.7763597, -1.566688, -4.405646, 1, 1, 1, 1, 1,
-0.7736946, -0.264791, -0.9360347, 0, 0, 1, 1, 1,
-0.7638388, -0.4392502, -1.42847, 1, 0, 0, 1, 1,
-0.7629811, -0.1710205, -1.08637, 1, 0, 0, 1, 1,
-0.7598132, -0.6993102, -4.719673, 1, 0, 0, 1, 1,
-0.7583545, -0.2836295, -2.003964, 1, 0, 0, 1, 1,
-0.746021, -0.4762095, -2.902172, 1, 0, 0, 1, 1,
-0.7447457, -1.057669, -2.398589, 0, 0, 0, 1, 1,
-0.7377977, -0.2329296, -0.6803428, 0, 0, 0, 1, 1,
-0.7338883, 0.2448223, -0.8921687, 0, 0, 0, 1, 1,
-0.72846, 0.5364133, -1.635052, 0, 0, 0, 1, 1,
-0.7269311, -0.8923108, -1.840201, 0, 0, 0, 1, 1,
-0.7265137, -1.149231, -3.506191, 0, 0, 0, 1, 1,
-0.720848, 1.729702, -1.618378, 0, 0, 0, 1, 1,
-0.7187682, 0.1432696, -1.5925, 1, 1, 1, 1, 1,
-0.714177, 0.5272205, 0.4471544, 1, 1, 1, 1, 1,
-0.7132435, 0.1262445, -1.727573, 1, 1, 1, 1, 1,
-0.7108234, -0.2526372, -2.390212, 1, 1, 1, 1, 1,
-0.6954495, -0.3587809, -1.393004, 1, 1, 1, 1, 1,
-0.6944758, -0.2499814, -1.691636, 1, 1, 1, 1, 1,
-0.6931594, -0.005377911, -1.650824, 1, 1, 1, 1, 1,
-0.6916839, -0.3482478, 0.09866677, 1, 1, 1, 1, 1,
-0.6916608, -0.9668589, -2.60016, 1, 1, 1, 1, 1,
-0.6884093, 0.1212469, -2.486828, 1, 1, 1, 1, 1,
-0.6805339, 0.3643376, -3.344891, 1, 1, 1, 1, 1,
-0.6767305, 1.025848, -1.054173, 1, 1, 1, 1, 1,
-0.6749981, 0.145056, -1.658982, 1, 1, 1, 1, 1,
-0.6701136, -1.390643, -1.557033, 1, 1, 1, 1, 1,
-0.6692117, 0.7241142, -0.5881076, 1, 1, 1, 1, 1,
-0.6651877, 1.257249, -1.828129, 0, 0, 1, 1, 1,
-0.6624296, -0.1652471, -2.515288, 1, 0, 0, 1, 1,
-0.659444, 0.9394034, -0.2384901, 1, 0, 0, 1, 1,
-0.6544, -1.054777, -2.6941, 1, 0, 0, 1, 1,
-0.6472806, 1.051571, -0.3635671, 1, 0, 0, 1, 1,
-0.6467228, 0.03412246, -1.635353, 1, 0, 0, 1, 1,
-0.6446173, -0.601339, -2.604819, 0, 0, 0, 1, 1,
-0.6416295, -1.72762, -4.02705, 0, 0, 0, 1, 1,
-0.6401368, 0.8201518, -1.872049, 0, 0, 0, 1, 1,
-0.6391241, -0.06236984, -1.193049, 0, 0, 0, 1, 1,
-0.6306873, 0.9581316, -1.293028, 0, 0, 0, 1, 1,
-0.6154202, 1.006606, -1.204652, 0, 0, 0, 1, 1,
-0.6107183, -1.592885, -1.457139, 0, 0, 0, 1, 1,
-0.6107133, -0.08442487, -1.334181, 1, 1, 1, 1, 1,
-0.6102169, 1.38503, -0.4979817, 1, 1, 1, 1, 1,
-0.6075819, 1.704084, -0.943922, 1, 1, 1, 1, 1,
-0.6015289, -1.752509, -0.7330366, 1, 1, 1, 1, 1,
-0.5999054, 0.4394702, -0.3679661, 1, 1, 1, 1, 1,
-0.5969797, -0.005397437, -3.007068, 1, 1, 1, 1, 1,
-0.5966003, -0.5258844, -3.482599, 1, 1, 1, 1, 1,
-0.5943063, -1.180211, -2.160723, 1, 1, 1, 1, 1,
-0.5939738, 0.2821308, -2.250379, 1, 1, 1, 1, 1,
-0.5921298, -1.965108, -2.52545, 1, 1, 1, 1, 1,
-0.5911496, -0.4787285, -2.284142, 1, 1, 1, 1, 1,
-0.5830572, 0.08540369, -1.418423, 1, 1, 1, 1, 1,
-0.582707, 1.760666, -0.8406743, 1, 1, 1, 1, 1,
-0.5821015, 0.6058308, -2.382669, 1, 1, 1, 1, 1,
-0.5771687, -0.8681216, -1.727924, 1, 1, 1, 1, 1,
-0.5714395, 0.4746103, 0.3482443, 0, 0, 1, 1, 1,
-0.5693961, 1.390242, -0.008073729, 1, 0, 0, 1, 1,
-0.5636283, -0.05191679, -1.304252, 1, 0, 0, 1, 1,
-0.5628315, 2.072716, -0.3690272, 1, 0, 0, 1, 1,
-0.5609657, 0.240869, -2.765254, 1, 0, 0, 1, 1,
-0.5561934, -0.1995812, -2.100263, 1, 0, 0, 1, 1,
-0.5534586, -0.6747575, -3.293519, 0, 0, 0, 1, 1,
-0.5514698, 0.02039621, -1.447494, 0, 0, 0, 1, 1,
-0.5427296, -1.219127, -3.432188, 0, 0, 0, 1, 1,
-0.542604, -0.4080935, -2.356523, 0, 0, 0, 1, 1,
-0.5413343, 0.1274304, -2.303456, 0, 0, 0, 1, 1,
-0.5384603, -0.8463055, -2.993086, 0, 0, 0, 1, 1,
-0.5330638, -0.3305116, -1.928058, 0, 0, 0, 1, 1,
-0.521377, -0.8281528, -2.124062, 1, 1, 1, 1, 1,
-0.5161008, -0.2943942, -3.070088, 1, 1, 1, 1, 1,
-0.5140615, 0.8252813, -0.4717944, 1, 1, 1, 1, 1,
-0.5139942, 1.481472, 0.4446705, 1, 1, 1, 1, 1,
-0.5125689, -0.8207068, -1.703239, 1, 1, 1, 1, 1,
-0.511262, 1.196295, -1.112891, 1, 1, 1, 1, 1,
-0.5100475, -3.299257, -2.491471, 1, 1, 1, 1, 1,
-0.5037454, 0.409252, -0.675685, 1, 1, 1, 1, 1,
-0.5026274, -0.3150744, -2.090171, 1, 1, 1, 1, 1,
-0.5020964, 1.0032, -0.3329273, 1, 1, 1, 1, 1,
-0.4977583, -2.021042, -1.283231, 1, 1, 1, 1, 1,
-0.4935682, -1.147189, -3.559697, 1, 1, 1, 1, 1,
-0.489297, 0.02295399, -2.001938, 1, 1, 1, 1, 1,
-0.4876982, 0.1820704, -1.293265, 1, 1, 1, 1, 1,
-0.4872661, -1.644181, -3.079678, 1, 1, 1, 1, 1,
-0.4827889, 1.111758, -1.095438, 0, 0, 1, 1, 1,
-0.4805645, 0.2386352, -2.074302, 1, 0, 0, 1, 1,
-0.4780887, 0.8802868, 1.733218, 1, 0, 0, 1, 1,
-0.477457, -0.3081675, -1.561633, 1, 0, 0, 1, 1,
-0.4770179, -1.532829, -1.930074, 1, 0, 0, 1, 1,
-0.4752988, 0.1140935, -3.134613, 1, 0, 0, 1, 1,
-0.4740173, -1.559486, -2.103031, 0, 0, 0, 1, 1,
-0.4712887, -0.8564411, -0.9019881, 0, 0, 0, 1, 1,
-0.469595, 0.2458821, -1.120599, 0, 0, 0, 1, 1,
-0.4685934, 0.5680335, -1.541309, 0, 0, 0, 1, 1,
-0.4654284, -0.7936385, -2.339238, 0, 0, 0, 1, 1,
-0.4611144, -0.3229506, -2.149879, 0, 0, 0, 1, 1,
-0.4543641, 0.7911627, -1.815481, 0, 0, 0, 1, 1,
-0.4488181, -0.4923295, -1.742188, 1, 1, 1, 1, 1,
-0.4476868, 0.1448061, -3.975489, 1, 1, 1, 1, 1,
-0.4473297, -0.8165079, -3.294983, 1, 1, 1, 1, 1,
-0.4465846, 0.6047652, -1.458655, 1, 1, 1, 1, 1,
-0.4462487, 1.387361, -0.758371, 1, 1, 1, 1, 1,
-0.4462183, 0.1643948, -1.916498, 1, 1, 1, 1, 1,
-0.4288711, -0.1609379, -4.932991, 1, 1, 1, 1, 1,
-0.4280784, -0.8521897, -1.927264, 1, 1, 1, 1, 1,
-0.4230382, 0.1867062, -0.5625589, 1, 1, 1, 1, 1,
-0.4212873, 0.1503047, -2.688957, 1, 1, 1, 1, 1,
-0.4211822, -0.8181472, -3.405467, 1, 1, 1, 1, 1,
-0.4199172, -1.17107, -2.749775, 1, 1, 1, 1, 1,
-0.4182061, 1.403595, -0.9019913, 1, 1, 1, 1, 1,
-0.417857, 0.02393773, -2.152641, 1, 1, 1, 1, 1,
-0.4172511, -0.1089958, -2.103607, 1, 1, 1, 1, 1,
-0.415413, -0.9429543, -2.577627, 0, 0, 1, 1, 1,
-0.4148169, 0.7148531, 0.8652116, 1, 0, 0, 1, 1,
-0.4144843, 0.1318299, -0.001103372, 1, 0, 0, 1, 1,
-0.4093093, 0.4156621, -0.4347706, 1, 0, 0, 1, 1,
-0.4066098, 0.4380565, -2.323542, 1, 0, 0, 1, 1,
-0.4032339, -0.7367665, -2.425519, 1, 0, 0, 1, 1,
-0.4010235, -1.46944, -2.749851, 0, 0, 0, 1, 1,
-0.4009994, -0.0651419, -3.191589, 0, 0, 0, 1, 1,
-0.3973584, 0.5035824, 0.3700534, 0, 0, 0, 1, 1,
-0.3942603, -0.1742389, -1.0991, 0, 0, 0, 1, 1,
-0.3920996, 1.692418, -0.7274258, 0, 0, 0, 1, 1,
-0.3920946, -0.1897, -2.035843, 0, 0, 0, 1, 1,
-0.3911361, 0.155894, -1.379255, 0, 0, 0, 1, 1,
-0.3857903, 1.435616, 0.2579991, 1, 1, 1, 1, 1,
-0.3809864, -0.6778948, -2.238501, 1, 1, 1, 1, 1,
-0.3801311, 0.8121426, -0.8586866, 1, 1, 1, 1, 1,
-0.3796562, 0.4092251, -0.6929091, 1, 1, 1, 1, 1,
-0.3764357, -0.04191035, -3.792922, 1, 1, 1, 1, 1,
-0.3763846, -0.544738, -3.893717, 1, 1, 1, 1, 1,
-0.370868, 1.705322, 0.5166156, 1, 1, 1, 1, 1,
-0.3580556, 0.9671683, -0.7376512, 1, 1, 1, 1, 1,
-0.3569717, -0.7338572, -3.429976, 1, 1, 1, 1, 1,
-0.3565252, -0.1851621, -3.024988, 1, 1, 1, 1, 1,
-0.3557797, -1.29979, -3.537269, 1, 1, 1, 1, 1,
-0.3553795, 0.2838057, -2.167339, 1, 1, 1, 1, 1,
-0.3532428, -0.6062799, -3.1323, 1, 1, 1, 1, 1,
-0.3500884, 2.267603, -0.1177595, 1, 1, 1, 1, 1,
-0.3486335, -1.726891, -3.128761, 1, 1, 1, 1, 1,
-0.3454631, 1.06028, 0.210057, 0, 0, 1, 1, 1,
-0.3417393, -0.6646544, -1.334692, 1, 0, 0, 1, 1,
-0.3408326, 0.3361277, -1.430174, 1, 0, 0, 1, 1,
-0.3389236, 0.05795038, -0.9466359, 1, 0, 0, 1, 1,
-0.3335148, -1.037102, -3.072301, 1, 0, 0, 1, 1,
-0.3314418, -0.2393172, -2.444298, 1, 0, 0, 1, 1,
-0.3285799, 1.117569, -0.6081292, 0, 0, 0, 1, 1,
-0.326226, 1.624584, -0.8923692, 0, 0, 0, 1, 1,
-0.3231836, -0.1162917, -1.965018, 0, 0, 0, 1, 1,
-0.3214622, 0.5688663, 1.191252, 0, 0, 0, 1, 1,
-0.316113, -1.501315, -4.289698, 0, 0, 0, 1, 1,
-0.315511, -1.06314, -1.900284, 0, 0, 0, 1, 1,
-0.3137945, -1.911934, -4.442198, 0, 0, 0, 1, 1,
-0.3111723, -1.596093, -3.012966, 1, 1, 1, 1, 1,
-0.3092395, -0.8783135, -3.351497, 1, 1, 1, 1, 1,
-0.306874, -0.7973545, -2.239878, 1, 1, 1, 1, 1,
-0.3053861, -0.321332, -1.327653, 1, 1, 1, 1, 1,
-0.3025976, 0.2713802, 0.5693158, 1, 1, 1, 1, 1,
-0.2959218, 0.3025412, -0.05481466, 1, 1, 1, 1, 1,
-0.2883478, -0.2032235, -2.468024, 1, 1, 1, 1, 1,
-0.2876325, -1.150183, -1.88143, 1, 1, 1, 1, 1,
-0.2869073, -1.154887, -2.921961, 1, 1, 1, 1, 1,
-0.2857016, 0.5333572, -0.3357043, 1, 1, 1, 1, 1,
-0.2821713, 0.5062681, 0.4895394, 1, 1, 1, 1, 1,
-0.2794454, 0.2219761, -1.300255, 1, 1, 1, 1, 1,
-0.2785904, 0.8654891, 1.30275, 1, 1, 1, 1, 1,
-0.2783984, -1.514883, -2.119043, 1, 1, 1, 1, 1,
-0.2778149, -0.3310094, -1.678954, 1, 1, 1, 1, 1,
-0.2742458, -0.04190857, -4.226619, 0, 0, 1, 1, 1,
-0.2742284, 0.4522035, 0.3988085, 1, 0, 0, 1, 1,
-0.2727244, -1.055713, -1.017731, 1, 0, 0, 1, 1,
-0.2696036, 0.3395908, -0.1106577, 1, 0, 0, 1, 1,
-0.2643496, 0.2783665, -1.048118, 1, 0, 0, 1, 1,
-0.2608962, -0.6775051, -2.966906, 1, 0, 0, 1, 1,
-0.2593047, 1.720368, -0.5579696, 0, 0, 0, 1, 1,
-0.2577625, -0.6280457, -2.160417, 0, 0, 0, 1, 1,
-0.2569344, 1.00416, 2.228726, 0, 0, 0, 1, 1,
-0.2567965, 2.432021, -1.241544, 0, 0, 0, 1, 1,
-0.2559186, -0.3223646, -2.011455, 0, 0, 0, 1, 1,
-0.254815, -0.05180085, -0.7435954, 0, 0, 0, 1, 1,
-0.2516499, 0.2287217, -1.51844, 0, 0, 0, 1, 1,
-0.2483925, 0.2732854, -1.987107, 1, 1, 1, 1, 1,
-0.2469181, 0.7717817, -0.6510619, 1, 1, 1, 1, 1,
-0.2456728, -0.2656506, -2.120292, 1, 1, 1, 1, 1,
-0.2444533, 0.5458009, -0.064215, 1, 1, 1, 1, 1,
-0.2423569, 0.8749585, 0.6001772, 1, 1, 1, 1, 1,
-0.2405556, -0.01584071, -3.54915, 1, 1, 1, 1, 1,
-0.2391862, 1.154716, 0.1364596, 1, 1, 1, 1, 1,
-0.2338794, -0.2809193, -3.016257, 1, 1, 1, 1, 1,
-0.2317443, 0.2749397, -0.04508192, 1, 1, 1, 1, 1,
-0.2307982, -0.7755612, -4.697533, 1, 1, 1, 1, 1,
-0.2187302, 1.552354, 1.216014, 1, 1, 1, 1, 1,
-0.2140996, -0.1661806, -2.048524, 1, 1, 1, 1, 1,
-0.2114727, 0.3607571, 1.525576, 1, 1, 1, 1, 1,
-0.2059031, -1.320971, -3.810783, 1, 1, 1, 1, 1,
-0.2016252, -1.315944, -3.861273, 1, 1, 1, 1, 1,
-0.1969485, -1.931143, -4.182746, 0, 0, 1, 1, 1,
-0.1967845, -0.09492835, -1.067152, 1, 0, 0, 1, 1,
-0.1967613, 0.08609228, -2.954595, 1, 0, 0, 1, 1,
-0.1944226, 0.4180869, -0.8393515, 1, 0, 0, 1, 1,
-0.1917134, 0.4591462, -0.03141947, 1, 0, 0, 1, 1,
-0.1913833, -0.4498653, -2.642887, 1, 0, 0, 1, 1,
-0.1897958, -0.240221, -1.311326, 0, 0, 0, 1, 1,
-0.1768525, -0.01502834, -1.516628, 0, 0, 0, 1, 1,
-0.1746677, 0.2193849, 0.2210197, 0, 0, 0, 1, 1,
-0.1724825, -0.2779807, -1.090433, 0, 0, 0, 1, 1,
-0.1705912, 1.412281, -0.5900199, 0, 0, 0, 1, 1,
-0.1682828, 1.516503, 0.2552285, 0, 0, 0, 1, 1,
-0.1660089, 0.1245411, -0.9831586, 0, 0, 0, 1, 1,
-0.1623399, -0.4468653, -2.905823, 1, 1, 1, 1, 1,
-0.1613927, 0.753897, 0.3514214, 1, 1, 1, 1, 1,
-0.1566767, 1.244872, -0.4621146, 1, 1, 1, 1, 1,
-0.1563701, -0.3960606, -2.873628, 1, 1, 1, 1, 1,
-0.1550472, -1.134524, -3.088611, 1, 1, 1, 1, 1,
-0.1514277, -0.9003572, -2.506625, 1, 1, 1, 1, 1,
-0.1509638, 0.1447976, 0.004571062, 1, 1, 1, 1, 1,
-0.1410934, -0.08663858, -0.6111805, 1, 1, 1, 1, 1,
-0.1352996, -0.3322069, -3.993742, 1, 1, 1, 1, 1,
-0.1297669, -0.72392, -3.34757, 1, 1, 1, 1, 1,
-0.1281829, -0.2581424, -3.327012, 1, 1, 1, 1, 1,
-0.1225756, -0.2318152, -3.264647, 1, 1, 1, 1, 1,
-0.1225253, -0.3956488, -2.268551, 1, 1, 1, 1, 1,
-0.1211666, -0.809938, -4.719367, 1, 1, 1, 1, 1,
-0.1185883, -1.025258, -2.990619, 1, 1, 1, 1, 1,
-0.1182934, -2.061247, -4.378666, 0, 0, 1, 1, 1,
-0.1171685, -0.4233372, -3.887408, 1, 0, 0, 1, 1,
-0.1168493, 0.1607053, 0.8315905, 1, 0, 0, 1, 1,
-0.1162788, 0.2454873, -0.8699601, 1, 0, 0, 1, 1,
-0.114196, -1.252786, -1.761116, 1, 0, 0, 1, 1,
-0.1138287, -0.6151658, -3.453543, 1, 0, 0, 1, 1,
-0.1128032, 0.9985492, -0.4447179, 0, 0, 0, 1, 1,
-0.1093532, -0.6494955, -2.01077, 0, 0, 0, 1, 1,
-0.1064918, -1.145681, -3.10342, 0, 0, 0, 1, 1,
-0.1026552, 0.3466662, -1.898304, 0, 0, 0, 1, 1,
-0.1017906, 0.0158258, -1.485607, 0, 0, 0, 1, 1,
-0.09995376, 0.04581631, -0.9697214, 0, 0, 0, 1, 1,
-0.09946724, -0.6365535, -1.654561, 0, 0, 0, 1, 1,
-0.09773788, -0.06687083, -1.330567, 1, 1, 1, 1, 1,
-0.09618001, 1.280423, 0.5692035, 1, 1, 1, 1, 1,
-0.09279152, -0.402246, -4.698075, 1, 1, 1, 1, 1,
-0.0927351, 0.5283089, 1.278921, 1, 1, 1, 1, 1,
-0.08728575, 0.1366545, -0.2942587, 1, 1, 1, 1, 1,
-0.08652578, 1.682028, 0.1977656, 1, 1, 1, 1, 1,
-0.08594403, 0.05202826, -0.9275425, 1, 1, 1, 1, 1,
-0.08551656, -2.082007, -4.677271, 1, 1, 1, 1, 1,
-0.08411264, 0.7661577, -1.084142, 1, 1, 1, 1, 1,
-0.08258338, -1.274175, -3.298365, 1, 1, 1, 1, 1,
-0.08028129, -1.463406, -2.783053, 1, 1, 1, 1, 1,
-0.07074095, -1.253413, -3.104483, 1, 1, 1, 1, 1,
-0.0681268, -0.07727292, -2.734732, 1, 1, 1, 1, 1,
-0.05999191, -1.445664, -2.227013, 1, 1, 1, 1, 1,
-0.05881701, -1.619594, -4.002275, 1, 1, 1, 1, 1,
-0.05810044, 0.6464345, 0.5714983, 0, 0, 1, 1, 1,
-0.05442059, -0.402496, -5.178041, 1, 0, 0, 1, 1,
-0.0534271, -0.6121773, -1.448564, 1, 0, 0, 1, 1,
-0.05075035, 2.273737, -1.107594, 1, 0, 0, 1, 1,
-0.05010194, 1.19276, -0.2769851, 1, 0, 0, 1, 1,
-0.04831358, -0.4443126, -3.190561, 1, 0, 0, 1, 1,
-0.04684813, 1.494819, 0.8588033, 0, 0, 0, 1, 1,
-0.04239371, -0.9806815, -4.107843, 0, 0, 0, 1, 1,
-0.03697069, -1.771088, -2.644679, 0, 0, 0, 1, 1,
-0.03492364, -0.8753334, -5.331734, 0, 0, 0, 1, 1,
-0.03437314, -0.4538314, -4.240232, 0, 0, 0, 1, 1,
-0.03060938, 0.1774584, 1.187382, 0, 0, 0, 1, 1,
-0.02644941, -0.5315551, -2.911667, 0, 0, 0, 1, 1,
-0.02609044, -0.527572, -2.672045, 1, 1, 1, 1, 1,
-0.02563235, 1.220659, 1.33672, 1, 1, 1, 1, 1,
-0.02473876, -0.7147703, -4.87294, 1, 1, 1, 1, 1,
-0.01735027, 0.2253739, 0.07010075, 1, 1, 1, 1, 1,
-0.01632687, 1.119884, -0.06693941, 1, 1, 1, 1, 1,
-0.01474733, 0.8516911, 0.08597799, 1, 1, 1, 1, 1,
-0.01230249, 0.0191368, -0.661679, 1, 1, 1, 1, 1,
-0.006610006, -0.3359745, -3.900512, 1, 1, 1, 1, 1,
0.002319499, 0.1084794, -0.5648661, 1, 1, 1, 1, 1,
0.00425966, -2.158707, 3.883382, 1, 1, 1, 1, 1,
0.00596051, -0.5001088, 1.494414, 1, 1, 1, 1, 1,
0.007503489, 0.5191293, -0.8202584, 1, 1, 1, 1, 1,
0.009610377, -1.084919, 3.509138, 1, 1, 1, 1, 1,
0.01206087, 0.7444736, -0.8697491, 1, 1, 1, 1, 1,
0.01484965, 0.8272021, -0.5003234, 1, 1, 1, 1, 1,
0.01682596, 1.037913, -1.417546, 0, 0, 1, 1, 1,
0.01896501, 2.983849, -1.177333, 1, 0, 0, 1, 1,
0.02164492, 1.803468, -1.788843, 1, 0, 0, 1, 1,
0.02170396, -0.8881643, 2.393246, 1, 0, 0, 1, 1,
0.02206831, 0.3442658, 1.440498, 1, 0, 0, 1, 1,
0.0290817, 0.9758834, 1.170164, 1, 0, 0, 1, 1,
0.02924137, 0.07366858, 0.2199587, 0, 0, 0, 1, 1,
0.03045991, -0.1238738, 2.878621, 0, 0, 0, 1, 1,
0.03063086, -0.6352127, 2.499925, 0, 0, 0, 1, 1,
0.03325124, 0.717429, 0.009724615, 0, 0, 0, 1, 1,
0.0358137, -1.537606, 2.095558, 0, 0, 0, 1, 1,
0.0373799, -0.6244292, 2.617344, 0, 0, 0, 1, 1,
0.03885772, 0.4319884, -1.06719, 0, 0, 0, 1, 1,
0.03933099, 1.21756, -0.4907096, 1, 1, 1, 1, 1,
0.04086091, 0.2409218, 1.419472, 1, 1, 1, 1, 1,
0.0425232, 0.5464258, 1.413383, 1, 1, 1, 1, 1,
0.04285973, 0.3917114, 2.12407, 1, 1, 1, 1, 1,
0.04424087, 0.6691707, -1.272961, 1, 1, 1, 1, 1,
0.04485056, 1.001321, 0.2256966, 1, 1, 1, 1, 1,
0.04754931, 0.9381016, -0.4686108, 1, 1, 1, 1, 1,
0.04997686, 1.481121, 0.7223405, 1, 1, 1, 1, 1,
0.0512583, 0.06105585, -0.05538253, 1, 1, 1, 1, 1,
0.0532141, 2.750844, 0.6892757, 1, 1, 1, 1, 1,
0.05678011, 0.9813988, -1.196606, 1, 1, 1, 1, 1,
0.05729829, -0.3070018, 3.977787, 1, 1, 1, 1, 1,
0.0596083, -0.6360936, 3.485773, 1, 1, 1, 1, 1,
0.06066434, -1.027467, 3.122021, 1, 1, 1, 1, 1,
0.06210921, -0.4848415, 4.316602, 1, 1, 1, 1, 1,
0.07501747, -0.6496603, 4.015253, 0, 0, 1, 1, 1,
0.08106393, 1.165336, 2.231026, 1, 0, 0, 1, 1,
0.08417863, 0.6040657, 0.6676744, 1, 0, 0, 1, 1,
0.08647364, -0.08072697, 1.96302, 1, 0, 0, 1, 1,
0.09366659, -0.114323, 2.687052, 1, 0, 0, 1, 1,
0.09753726, 2.226523, -0.183457, 1, 0, 0, 1, 1,
0.09873929, -0.4232696, 2.395541, 0, 0, 0, 1, 1,
0.1079556, 2.526172, -1.401688, 0, 0, 0, 1, 1,
0.1108204, -0.2795121, 1.771933, 0, 0, 0, 1, 1,
0.1153784, -1.313644, 3.958987, 0, 0, 0, 1, 1,
0.1162349, 0.4839045, 1.032753, 0, 0, 0, 1, 1,
0.1235749, 0.6267939, -0.1401932, 0, 0, 0, 1, 1,
0.1288418, -0.5370603, 4.425295, 0, 0, 0, 1, 1,
0.1313242, -1.102259, 3.26576, 1, 1, 1, 1, 1,
0.1319444, -0.3583629, 2.417247, 1, 1, 1, 1, 1,
0.134458, -0.5788615, 5.803297, 1, 1, 1, 1, 1,
0.1408664, 1.076063, -0.7596558, 1, 1, 1, 1, 1,
0.1433586, -2.143911, 3.111101, 1, 1, 1, 1, 1,
0.1458652, -0.6231363, 0.8985247, 1, 1, 1, 1, 1,
0.1478128, 0.4853822, -0.4565782, 1, 1, 1, 1, 1,
0.1479546, -0.3965827, 3.897028, 1, 1, 1, 1, 1,
0.1547583, -1.014673, 1.855445, 1, 1, 1, 1, 1,
0.1573264, -0.3028443, 5.006366, 1, 1, 1, 1, 1,
0.1619358, 0.3510063, 0.3036163, 1, 1, 1, 1, 1,
0.163612, 0.3143715, -0.05143496, 1, 1, 1, 1, 1,
0.1677318, -0.9148118, 2.957614, 1, 1, 1, 1, 1,
0.1678254, -1.138832, 3.159049, 1, 1, 1, 1, 1,
0.169156, 0.7870045, 0.03552712, 1, 1, 1, 1, 1,
0.1705536, -1.817249, 3.086837, 0, 0, 1, 1, 1,
0.1718075, 0.470133, -1.230428, 1, 0, 0, 1, 1,
0.1718518, -1.814453, 2.980797, 1, 0, 0, 1, 1,
0.1743258, 1.488113, 0.2666452, 1, 0, 0, 1, 1,
0.176935, -0.6303582, 2.292213, 1, 0, 0, 1, 1,
0.1807509, 1.437717, 1.797895, 1, 0, 0, 1, 1,
0.1808596, -0.2052965, 0.9973423, 0, 0, 0, 1, 1,
0.1877987, -1.485297, 2.121351, 0, 0, 0, 1, 1,
0.1888602, 0.7897873, -0.9909662, 0, 0, 0, 1, 1,
0.1889066, -1.019529, 2.782675, 0, 0, 0, 1, 1,
0.1903991, -0.5351089, 3.285632, 0, 0, 0, 1, 1,
0.1965725, -0.09024002, 1.016098, 0, 0, 0, 1, 1,
0.1995436, 2.619158, 1.089727, 0, 0, 0, 1, 1,
0.2002881, -0.504055, 2.848731, 1, 1, 1, 1, 1,
0.2014201, 0.5672281, 0.8113153, 1, 1, 1, 1, 1,
0.2018218, 0.904425, -0.1359043, 1, 1, 1, 1, 1,
0.2045609, -2.240065, 1.787812, 1, 1, 1, 1, 1,
0.2063301, 1.273996, -0.8675458, 1, 1, 1, 1, 1,
0.2068172, 0.4613303, 0.1379496, 1, 1, 1, 1, 1,
0.2116744, -0.2810155, 3.079316, 1, 1, 1, 1, 1,
0.2118322, 0.6712157, -0.3413873, 1, 1, 1, 1, 1,
0.2120946, 0.07677733, 0.911319, 1, 1, 1, 1, 1,
0.2125234, 1.026507, -2.590159, 1, 1, 1, 1, 1,
0.2136248, -0.1496683, 2.516769, 1, 1, 1, 1, 1,
0.2175937, -0.1532274, 2.942376, 1, 1, 1, 1, 1,
0.2219677, 2.480567, 0.3361552, 1, 1, 1, 1, 1,
0.2230246, -0.03997234, 2.398248, 1, 1, 1, 1, 1,
0.2328521, -0.6181087, 3.214632, 1, 1, 1, 1, 1,
0.23491, -1.621197, 2.211637, 0, 0, 1, 1, 1,
0.2361903, -0.6031958, 2.431654, 1, 0, 0, 1, 1,
0.2369817, 0.3230158, 2.483537, 1, 0, 0, 1, 1,
0.2389796, -0.5470941, 2.625275, 1, 0, 0, 1, 1,
0.2432498, 0.2799053, -1.311435, 1, 0, 0, 1, 1,
0.2458595, 0.1399979, 0.2777107, 1, 0, 0, 1, 1,
0.2541001, 0.2702989, 0.4575167, 0, 0, 0, 1, 1,
0.2565066, -1.579185, 4.211387, 0, 0, 0, 1, 1,
0.260054, 0.324017, 0.4513001, 0, 0, 0, 1, 1,
0.2628924, -1.298065, 2.11896, 0, 0, 0, 1, 1,
0.2635078, -0.4227972, 3.348235, 0, 0, 0, 1, 1,
0.2668768, 0.7208068, -1.138968, 0, 0, 0, 1, 1,
0.2719446, -0.9091254, 3.843235, 0, 0, 0, 1, 1,
0.2755816, 0.4447596, 0.5347075, 1, 1, 1, 1, 1,
0.2773457, -0.6889746, 2.976447, 1, 1, 1, 1, 1,
0.2776812, -0.5592826, 3.957661, 1, 1, 1, 1, 1,
0.2806115, -0.1341391, 2.412586, 1, 1, 1, 1, 1,
0.2818845, -0.3191503, 0.4671347, 1, 1, 1, 1, 1,
0.2845018, 0.3494679, -0.01562061, 1, 1, 1, 1, 1,
0.2849693, -0.219206, 3.550398, 1, 1, 1, 1, 1,
0.2889223, -2.727798, 2.595771, 1, 1, 1, 1, 1,
0.2896531, 2.442316, 1.3336, 1, 1, 1, 1, 1,
0.2902248, -1.187485, 2.023614, 1, 1, 1, 1, 1,
0.2914174, 1.015148, 0.4069921, 1, 1, 1, 1, 1,
0.2934803, 0.2001506, -0.1141575, 1, 1, 1, 1, 1,
0.296402, 0.8403056, -0.8777182, 1, 1, 1, 1, 1,
0.2998495, -1.977976, 3.673456, 1, 1, 1, 1, 1,
0.3082312, -0.978353, 1.828676, 1, 1, 1, 1, 1,
0.3093941, -1.185256, 3.516484, 0, 0, 1, 1, 1,
0.3125148, -1.234713, 2.346325, 1, 0, 0, 1, 1,
0.3252775, 1.153046, 2.679575, 1, 0, 0, 1, 1,
0.3267667, 0.5351998, 0.03850783, 1, 0, 0, 1, 1,
0.3296176, -0.04868453, 1.305948, 1, 0, 0, 1, 1,
0.3296757, -1.212479, 1.509804, 1, 0, 0, 1, 1,
0.331856, 0.02130527, 0.8295103, 0, 0, 0, 1, 1,
0.333042, -0.9099418, 1.924782, 0, 0, 0, 1, 1,
0.3345023, 0.4869163, -0.7279516, 0, 0, 0, 1, 1,
0.3352958, 0.4464328, 1.375822, 0, 0, 0, 1, 1,
0.3412754, 0.1357404, 2.010649, 0, 0, 0, 1, 1,
0.3422939, 0.2839823, 1.061399, 0, 0, 0, 1, 1,
0.3448335, 0.05119777, 2.686541, 0, 0, 0, 1, 1,
0.3506288, -0.20017, 0.5326535, 1, 1, 1, 1, 1,
0.3517639, -0.4071878, 0.4380137, 1, 1, 1, 1, 1,
0.3529821, -0.114001, 1.582458, 1, 1, 1, 1, 1,
0.3532721, -0.5421408, 3.768834, 1, 1, 1, 1, 1,
0.3535028, -1.202507, 1.356877, 1, 1, 1, 1, 1,
0.3589301, 0.7216212, -0.9610894, 1, 1, 1, 1, 1,
0.3674444, -0.182608, 1.010314, 1, 1, 1, 1, 1,
0.3712623, -0.3692162, 0.8862997, 1, 1, 1, 1, 1,
0.3723425, -1.00857, 2.277604, 1, 1, 1, 1, 1,
0.3776074, -1.221847, 3.513316, 1, 1, 1, 1, 1,
0.3792738, -1.245823, 3.289214, 1, 1, 1, 1, 1,
0.3837639, -0.157718, 0.9306412, 1, 1, 1, 1, 1,
0.3841238, 0.1313255, -0.3083982, 1, 1, 1, 1, 1,
0.3843133, 0.7016386, 1.960443, 1, 1, 1, 1, 1,
0.3882178, -0.3534795, 1.858302, 1, 1, 1, 1, 1,
0.3884927, 0.8361225, 1.924178, 0, 0, 1, 1, 1,
0.3893574, 1.305133, 0.04146763, 1, 0, 0, 1, 1,
0.3916239, -0.4708467, 3.708265, 1, 0, 0, 1, 1,
0.3929403, -0.1321815, 2.103436, 1, 0, 0, 1, 1,
0.3933279, -0.05185459, 2.866128, 1, 0, 0, 1, 1,
0.396131, -1.100633, 2.569557, 1, 0, 0, 1, 1,
0.3986019, -0.1622121, 1.395597, 0, 0, 0, 1, 1,
0.4002351, 0.05686981, 0.4009477, 0, 0, 0, 1, 1,
0.4003411, 0.8431069, -1.207497, 0, 0, 0, 1, 1,
0.4024148, 0.001788638, 1.847463, 0, 0, 0, 1, 1,
0.4062266, -0.4917475, 2.991183, 0, 0, 0, 1, 1,
0.40727, -0.115354, 3.963614, 0, 0, 0, 1, 1,
0.4074235, 1.714726, -1.329534, 0, 0, 0, 1, 1,
0.4085562, -0.1028977, 1.400005, 1, 1, 1, 1, 1,
0.4109764, 0.6187163, 1.049227, 1, 1, 1, 1, 1,
0.4110979, -0.2093, 3.51736, 1, 1, 1, 1, 1,
0.4147182, 0.03937068, 1.070393, 1, 1, 1, 1, 1,
0.4177731, -0.9882802, 3.147482, 1, 1, 1, 1, 1,
0.4182951, 1.334599, -1.79539, 1, 1, 1, 1, 1,
0.4205252, 0.8325323, 0.1029362, 1, 1, 1, 1, 1,
0.4215425, -1.913369, 2.226515, 1, 1, 1, 1, 1,
0.4215525, 0.9800938, -0.05959413, 1, 1, 1, 1, 1,
0.4279328, 1.174928, 1.319563, 1, 1, 1, 1, 1,
0.4342242, 0.6985055, 2.670214, 1, 1, 1, 1, 1,
0.4347329, 0.02313493, 1.287095, 1, 1, 1, 1, 1,
0.4401005, -0.3771562, 4.810186, 1, 1, 1, 1, 1,
0.4419238, -0.6651432, 1.604497, 1, 1, 1, 1, 1,
0.4420263, -0.07831337, -0.2068266, 1, 1, 1, 1, 1,
0.4423507, -0.8044439, 4.711949, 0, 0, 1, 1, 1,
0.445576, 0.6356966, 1.251363, 1, 0, 0, 1, 1,
0.454328, -0.3244689, 3.587548, 1, 0, 0, 1, 1,
0.4568219, -0.179371, 1.858097, 1, 0, 0, 1, 1,
0.4599018, 1.078513, 0.2190297, 1, 0, 0, 1, 1,
0.4753439, -0.9935695, 0.7326607, 1, 0, 0, 1, 1,
0.4753977, -1.207014, 2.20789, 0, 0, 0, 1, 1,
0.4788442, -0.53415, 2.893826, 0, 0, 0, 1, 1,
0.4814391, 0.06556213, 0.3021735, 0, 0, 0, 1, 1,
0.4828695, 0.2959025, 1.101535, 0, 0, 0, 1, 1,
0.4829232, 0.9098444, 0.07432617, 0, 0, 0, 1, 1,
0.4855777, 0.6897944, -0.8727502, 0, 0, 0, 1, 1,
0.4937519, 0.9792261, 2.244844, 0, 0, 0, 1, 1,
0.4982423, 1.973669, 1.909913, 1, 1, 1, 1, 1,
0.4983667, -0.7888594, 2.849208, 1, 1, 1, 1, 1,
0.5006686, -1.033383, 1.305557, 1, 1, 1, 1, 1,
0.5007219, -0.2898463, 3.685603, 1, 1, 1, 1, 1,
0.5026872, -0.5734084, 3.489946, 1, 1, 1, 1, 1,
0.5041893, 1.5481, 0.6622157, 1, 1, 1, 1, 1,
0.5058562, -0.3845487, 3.377273, 1, 1, 1, 1, 1,
0.5063691, 0.003481678, 2.802061, 1, 1, 1, 1, 1,
0.5068363, 2.105467, 0.609198, 1, 1, 1, 1, 1,
0.5111966, 1.663289, -0.8022232, 1, 1, 1, 1, 1,
0.513842, 1.43783, 0.07368155, 1, 1, 1, 1, 1,
0.5169737, 0.2989109, -0.001734926, 1, 1, 1, 1, 1,
0.519101, -1.997434, 1.416943, 1, 1, 1, 1, 1,
0.5192953, -2.205435, 3.10866, 1, 1, 1, 1, 1,
0.5199839, 0.7491377, 0.9368612, 1, 1, 1, 1, 1,
0.5202431, 0.06862928, 1.81996, 0, 0, 1, 1, 1,
0.5306024, 0.6041457, -0.00193879, 1, 0, 0, 1, 1,
0.5347289, -0.2735801, 2.014852, 1, 0, 0, 1, 1,
0.5355843, -0.8944125, 2.529971, 1, 0, 0, 1, 1,
0.535782, 0.4463988, -0.6809297, 1, 0, 0, 1, 1,
0.5388919, -0.5091585, 2.864676, 1, 0, 0, 1, 1,
0.5391756, -1.077485, 2.339486, 0, 0, 0, 1, 1,
0.5396525, -0.4401516, 1.510455, 0, 0, 0, 1, 1,
0.541557, 0.5055062, 1.519425, 0, 0, 0, 1, 1,
0.5433521, -1.10175, 3.051711, 0, 0, 0, 1, 1,
0.5434664, -1.375635, 1.881344, 0, 0, 0, 1, 1,
0.5438612, -3.117329, 1.044552, 0, 0, 0, 1, 1,
0.5548225, 1.516451, -0.1961337, 0, 0, 0, 1, 1,
0.5567074, 0.7630416, 0.3924662, 1, 1, 1, 1, 1,
0.5645017, -1.034494, 3.354152, 1, 1, 1, 1, 1,
0.5658233, 0.2301825, 1.215979, 1, 1, 1, 1, 1,
0.5666135, 0.72701, 0.2264014, 1, 1, 1, 1, 1,
0.5676306, -0.4923313, 4.260982, 1, 1, 1, 1, 1,
0.5687615, 0.296347, 1.914574, 1, 1, 1, 1, 1,
0.5754431, 0.1458868, 0.4666293, 1, 1, 1, 1, 1,
0.576945, 0.6906151, 0.3913155, 1, 1, 1, 1, 1,
0.5821159, 1.065069, -0.9174349, 1, 1, 1, 1, 1,
0.5824643, -0.5704838, 0.5875892, 1, 1, 1, 1, 1,
0.5877169, -1.190071, 3.975576, 1, 1, 1, 1, 1,
0.5913072, 0.7851222, 0.8613022, 1, 1, 1, 1, 1,
0.593047, 1.637706, -1.105979, 1, 1, 1, 1, 1,
0.601429, -2.366823, 2.56541, 1, 1, 1, 1, 1,
0.6044505, 1.447016, 1.024344, 1, 1, 1, 1, 1,
0.6057774, -0.6336172, 3.931987, 0, 0, 1, 1, 1,
0.6137134, 0.8543941, 0.4521534, 1, 0, 0, 1, 1,
0.6180453, 0.4443242, -0.1032119, 1, 0, 0, 1, 1,
0.6199396, 0.08766939, 1.671614, 1, 0, 0, 1, 1,
0.6227115, 1.111267, 0.7989724, 1, 0, 0, 1, 1,
0.628782, -1.172172, 2.864547, 1, 0, 0, 1, 1,
0.6310449, 1.760821, 1.450543, 0, 0, 0, 1, 1,
0.6327412, -0.4474836, 4.00316, 0, 0, 0, 1, 1,
0.6332662, -2.384079, 4.252446, 0, 0, 0, 1, 1,
0.6363969, 0.8394164, 0.5157771, 0, 0, 0, 1, 1,
0.6366944, 0.1819874, 3.058565, 0, 0, 0, 1, 1,
0.6389333, -0.1535445, 0.8185385, 0, 0, 0, 1, 1,
0.6429412, 0.5754513, 3.022668, 0, 0, 0, 1, 1,
0.6439353, 1.558488, -0.4591954, 1, 1, 1, 1, 1,
0.6440572, -0.8340969, 2.011279, 1, 1, 1, 1, 1,
0.6460471, -1.545496, 1.135864, 1, 1, 1, 1, 1,
0.6475641, 0.3528652, 1.241536, 1, 1, 1, 1, 1,
0.6485631, 0.2511537, -0.1441284, 1, 1, 1, 1, 1,
0.6506703, -0.8727579, 2.035757, 1, 1, 1, 1, 1,
0.6509572, 0.3743382, 0.9932823, 1, 1, 1, 1, 1,
0.654065, 0.4468217, 2.021181, 1, 1, 1, 1, 1,
0.661109, -0.3287928, 3.042849, 1, 1, 1, 1, 1,
0.6623771, 2.143651, 0.1357174, 1, 1, 1, 1, 1,
0.6632093, 0.7455077, 0.08766221, 1, 1, 1, 1, 1,
0.6681305, -0.1155869, 1.584529, 1, 1, 1, 1, 1,
0.6701667, -0.4665127, 2.027781, 1, 1, 1, 1, 1,
0.67142, 0.4209607, 1.85614, 1, 1, 1, 1, 1,
0.6763943, -1.46038, 3.888488, 1, 1, 1, 1, 1,
0.6796924, -0.8918177, 2.443166, 0, 0, 1, 1, 1,
0.6807708, 1.072598, -1.06096, 1, 0, 0, 1, 1,
0.6822413, 0.7991856, 0.8166667, 1, 0, 0, 1, 1,
0.6825797, -2.594818, 4.233575, 1, 0, 0, 1, 1,
0.6834391, 1.071422, 0.004542814, 1, 0, 0, 1, 1,
0.6866404, -0.435669, 2.456789, 1, 0, 0, 1, 1,
0.6875945, -0.1713494, 2.801785, 0, 0, 0, 1, 1,
0.6952376, 0.02858361, 1.019584, 0, 0, 0, 1, 1,
0.6966825, 1.891005, 1.809857, 0, 0, 0, 1, 1,
0.6976091, 1.620351, -0.2329691, 0, 0, 0, 1, 1,
0.6996412, -1.307729, 1.475597, 0, 0, 0, 1, 1,
0.7000903, 2.544391, 0.7952307, 0, 0, 0, 1, 1,
0.7003369, 0.9683986, 1.601307, 0, 0, 0, 1, 1,
0.701703, -0.5888561, 1.632909, 1, 1, 1, 1, 1,
0.7021251, 2.78129, 0.9296976, 1, 1, 1, 1, 1,
0.7044119, 0.3936642, 0.6432512, 1, 1, 1, 1, 1,
0.706943, -0.1778396, 1.809761, 1, 1, 1, 1, 1,
0.7214153, -0.3934571, 3.034333, 1, 1, 1, 1, 1,
0.7254529, 1.003883, -0.2996657, 1, 1, 1, 1, 1,
0.7266884, -0.695685, 3.297845, 1, 1, 1, 1, 1,
0.7290997, -1.47369, 2.363348, 1, 1, 1, 1, 1,
0.7304659, -0.100617, 3.157497, 1, 1, 1, 1, 1,
0.7305984, 0.4507165, -1.74275, 1, 1, 1, 1, 1,
0.741853, 2.280691, 0.3571938, 1, 1, 1, 1, 1,
0.7432157, 2.216973, 1.145902, 1, 1, 1, 1, 1,
0.7505172, -0.5706224, 1.607815, 1, 1, 1, 1, 1,
0.7526429, -0.7395741, 2.553639, 1, 1, 1, 1, 1,
0.7708259, -0.0488809, 3.255443, 1, 1, 1, 1, 1,
0.7712393, 0.4557876, 0.7705474, 0, 0, 1, 1, 1,
0.7713234, -0.007853745, 3.07249, 1, 0, 0, 1, 1,
0.7763498, 1.99653, 0.4343596, 1, 0, 0, 1, 1,
0.778982, -0.9952686, 1.584354, 1, 0, 0, 1, 1,
0.7809879, -0.5255111, 1.401679, 1, 0, 0, 1, 1,
0.7813339, 0.08709338, 1.43284, 1, 0, 0, 1, 1,
0.7838035, 0.02272275, 0.9036541, 0, 0, 0, 1, 1,
0.7907022, 1.139422, 0.9857632, 0, 0, 0, 1, 1,
0.7911704, 0.3023626, 1.757479, 0, 0, 0, 1, 1,
0.7924693, 0.2968126, 1.392926, 0, 0, 0, 1, 1,
0.796338, 1.190726, 0.09259532, 0, 0, 0, 1, 1,
0.7967884, 0.6292216, 2.236282, 0, 0, 0, 1, 1,
0.8015107, -0.8233902, 3.422046, 0, 0, 0, 1, 1,
0.8036746, 0.3572221, 0.6919924, 1, 1, 1, 1, 1,
0.8050757, 0.2777743, 1.548869, 1, 1, 1, 1, 1,
0.8093409, -0.1841559, 2.30788, 1, 1, 1, 1, 1,
0.8098651, -0.8053007, 2.892038, 1, 1, 1, 1, 1,
0.815012, -0.1311675, 2.315724, 1, 1, 1, 1, 1,
0.8191645, -1.367374, 3.639629, 1, 1, 1, 1, 1,
0.821785, 0.4289852, 1.129168, 1, 1, 1, 1, 1,
0.8235435, 0.9978161, 0.5264867, 1, 1, 1, 1, 1,
0.8318545, -0.6448943, 4.1874, 1, 1, 1, 1, 1,
0.8323904, -0.3633314, 2.010697, 1, 1, 1, 1, 1,
0.8396435, -0.4182658, 0.8064005, 1, 1, 1, 1, 1,
0.8468685, -1.048323, 1.791238, 1, 1, 1, 1, 1,
0.8522537, 0.1203082, -0.2174805, 1, 1, 1, 1, 1,
0.8603334, 0.949199, -0.141397, 1, 1, 1, 1, 1,
0.8619884, 0.2471975, 0.8150856, 1, 1, 1, 1, 1,
0.8637776, -0.1131912, 1.994053, 0, 0, 1, 1, 1,
0.8651657, 0.357603, 0.1978409, 1, 0, 0, 1, 1,
0.8694009, -0.9650252, 1.661756, 1, 0, 0, 1, 1,
0.877063, 3.042655, 1.403005, 1, 0, 0, 1, 1,
0.8828315, -0.04273909, 1.788765, 1, 0, 0, 1, 1,
0.8902721, -1.28189, 3.401557, 1, 0, 0, 1, 1,
0.890767, -0.9718575, 2.075194, 0, 0, 0, 1, 1,
0.891339, -0.547481, 1.814303, 0, 0, 0, 1, 1,
0.8953869, -0.5157095, 1.524432, 0, 0, 0, 1, 1,
0.899941, 0.6787226, 1.682361, 0, 0, 0, 1, 1,
0.9009029, -1.898041, 4.449798, 0, 0, 0, 1, 1,
0.903434, 0.5555715, -0.02098859, 0, 0, 0, 1, 1,
0.9079624, -1.427893, 1.550553, 0, 0, 0, 1, 1,
0.9141179, 0.9573457, 1.670327, 1, 1, 1, 1, 1,
0.9148821, -0.2593038, 2.835403, 1, 1, 1, 1, 1,
0.9194203, -0.2702756, 1.319059, 1, 1, 1, 1, 1,
0.9241297, 1.779932, -0.5450601, 1, 1, 1, 1, 1,
0.9403247, -0.9804371, 1.581611, 1, 1, 1, 1, 1,
0.9419239, 0.3987666, 1.160385, 1, 1, 1, 1, 1,
0.9450908, 0.007591475, 2.131406, 1, 1, 1, 1, 1,
0.9514319, -0.9781955, 2.60103, 1, 1, 1, 1, 1,
0.9541451, 0.08446484, 1.520194, 1, 1, 1, 1, 1,
0.9576501, 0.3122259, 0.9972801, 1, 1, 1, 1, 1,
0.9670777, -0.2353409, 2.436105, 1, 1, 1, 1, 1,
0.9688885, 0.1627712, 1.709866, 1, 1, 1, 1, 1,
0.9701208, -0.124917, 1.156164, 1, 1, 1, 1, 1,
0.9817996, -1.029698, 4.389428, 1, 1, 1, 1, 1,
0.9837294, 1.334059, -2.181428, 1, 1, 1, 1, 1,
0.9865586, -1.553935, 1.949563, 0, 0, 1, 1, 1,
0.9889538, 0.5471679, 0.8423754, 1, 0, 0, 1, 1,
0.9900677, -1.256209, 2.44657, 1, 0, 0, 1, 1,
0.9948224, 0.5478375, 0.8326772, 1, 0, 0, 1, 1,
1.012297, 1.405063, 0.4079639, 1, 0, 0, 1, 1,
1.015479, -1.346079, 2.261976, 1, 0, 0, 1, 1,
1.034641, -1.693571, 1.512338, 0, 0, 0, 1, 1,
1.036559, -0.7991809, 2.565997, 0, 0, 0, 1, 1,
1.043367, -0.7328216, 2.758208, 0, 0, 0, 1, 1,
1.050489, -0.2464738, 3.043233, 0, 0, 0, 1, 1,
1.054227, -1.206136, 1.356127, 0, 0, 0, 1, 1,
1.063862, -1.037877, 4.519038, 0, 0, 0, 1, 1,
1.068204, 0.3800253, 2.28804, 0, 0, 0, 1, 1,
1.074745, -0.3336464, 0.09710684, 1, 1, 1, 1, 1,
1.075974, 1.435133, 0.4322136, 1, 1, 1, 1, 1,
1.084292, -0.3846259, 2.384754, 1, 1, 1, 1, 1,
1.0843, 1.090763, 2.072806, 1, 1, 1, 1, 1,
1.09261, 1.04556, 1.15351, 1, 1, 1, 1, 1,
1.096027, 0.191488, 2.636047, 1, 1, 1, 1, 1,
1.109468, -0.2665656, 2.268804, 1, 1, 1, 1, 1,
1.112128, -0.6153345, 2.808108, 1, 1, 1, 1, 1,
1.11481, 0.7387872, 1.125369, 1, 1, 1, 1, 1,
1.116118, -0.3129729, 1.227162, 1, 1, 1, 1, 1,
1.116334, -0.1762571, 2.136413, 1, 1, 1, 1, 1,
1.135329, -0.1625493, 0.9914284, 1, 1, 1, 1, 1,
1.136248, 0.1662737, 3.413844, 1, 1, 1, 1, 1,
1.137215, 0.5956317, 1.13452, 1, 1, 1, 1, 1,
1.139832, -0.9131395, 1.528551, 1, 1, 1, 1, 1,
1.141805, -1.612666, 2.874407, 0, 0, 1, 1, 1,
1.142801, 1.432332, 0.5574371, 1, 0, 0, 1, 1,
1.146377, 1.323158, 0.8175184, 1, 0, 0, 1, 1,
1.152861, -1.395788, 1.512895, 1, 0, 0, 1, 1,
1.167396, 2.478247, 0.01521518, 1, 0, 0, 1, 1,
1.179487, -0.05030992, 1.705663, 1, 0, 0, 1, 1,
1.179957, 0.8826444, 1.810972, 0, 0, 0, 1, 1,
1.180322, 0.7499766, 2.587875, 0, 0, 0, 1, 1,
1.180787, 0.565114, -0.354897, 0, 0, 0, 1, 1,
1.18133, -1.288859, 2.404825, 0, 0, 0, 1, 1,
1.19358, 2.074061, 1.408994, 0, 0, 0, 1, 1,
1.193731, -0.4401402, 0.7335795, 0, 0, 0, 1, 1,
1.19941, 1.805765, 0.3019187, 0, 0, 0, 1, 1,
1.20256, -1.767882, 2.774237, 1, 1, 1, 1, 1,
1.205417, 0.194285, 1.898288, 1, 1, 1, 1, 1,
1.206857, 1.171804, 1.067391, 1, 1, 1, 1, 1,
1.220758, 1.236634, 0.9563023, 1, 1, 1, 1, 1,
1.225994, -0.3965555, 2.434482, 1, 1, 1, 1, 1,
1.228716, -0.1591997, 0.8883944, 1, 1, 1, 1, 1,
1.233167, 0.7142031, -0.0696853, 1, 1, 1, 1, 1,
1.234599, 0.9128368, 1.800181, 1, 1, 1, 1, 1,
1.241017, -0.563267, 0.495654, 1, 1, 1, 1, 1,
1.247437, 0.3607373, -0.1603762, 1, 1, 1, 1, 1,
1.254418, -0.4803356, 2.545538, 1, 1, 1, 1, 1,
1.255472, -0.2754447, 2.959455, 1, 1, 1, 1, 1,
1.268044, -0.7242672, 2.051488, 1, 1, 1, 1, 1,
1.278791, -1.803016, 4.664443, 1, 1, 1, 1, 1,
1.281574, -0.5824761, 1.848783, 1, 1, 1, 1, 1,
1.29009, -0.2066446, 0.472617, 0, 0, 1, 1, 1,
1.294713, -0.04939298, 0.9053044, 1, 0, 0, 1, 1,
1.295426, -2.224979, 4.421304, 1, 0, 0, 1, 1,
1.295605, -0.4459637, 3.758689, 1, 0, 0, 1, 1,
1.297395, -1.830474, 2.967628, 1, 0, 0, 1, 1,
1.320644, 1.81154, 0.467565, 1, 0, 0, 1, 1,
1.322585, 0.224942, 1.524986, 0, 0, 0, 1, 1,
1.339943, -1.757499, 2.861015, 0, 0, 0, 1, 1,
1.35041, 0.494942, 1.213237, 0, 0, 0, 1, 1,
1.351714, 2.118291, -1.427844, 0, 0, 0, 1, 1,
1.368132, -1.074452, 1.132342, 0, 0, 0, 1, 1,
1.390075, 0.4146177, 0.8902458, 0, 0, 0, 1, 1,
1.39259, 0.134472, 2.168856, 0, 0, 0, 1, 1,
1.400488, 1.685183, 1.218235, 1, 1, 1, 1, 1,
1.405689, -0.04233469, 1.397594, 1, 1, 1, 1, 1,
1.412834, 0.8501241, 1.384367, 1, 1, 1, 1, 1,
1.421531, 0.5670852, -0.05371703, 1, 1, 1, 1, 1,
1.428966, -0.6861741, 1.501974, 1, 1, 1, 1, 1,
1.435763, -0.4245889, 1.254891, 1, 1, 1, 1, 1,
1.447766, 1.831284, -0.3953997, 1, 1, 1, 1, 1,
1.447799, 1.04109, -1.088232, 1, 1, 1, 1, 1,
1.457667, 0.05387123, 2.142879, 1, 1, 1, 1, 1,
1.470713, 0.03627755, 0.8820894, 1, 1, 1, 1, 1,
1.474292, 0.9206573, 1.26193, 1, 1, 1, 1, 1,
1.477793, 1.317501, -1.46536, 1, 1, 1, 1, 1,
1.488494, 0.145193, 1.753615, 1, 1, 1, 1, 1,
1.490395, 0.7309475, 0.340682, 1, 1, 1, 1, 1,
1.494989, 0.3647371, 0.9208456, 1, 1, 1, 1, 1,
1.505476, 0.1163454, 1.409844, 0, 0, 1, 1, 1,
1.536173, -1.337977, 2.008367, 1, 0, 0, 1, 1,
1.558637, 0.01606154, 1.881847, 1, 0, 0, 1, 1,
1.560304, 0.7467915, 1.707085, 1, 0, 0, 1, 1,
1.572892, -0.2157334, 2.254003, 1, 0, 0, 1, 1,
1.57808, 0.086725, -0.3523132, 1, 0, 0, 1, 1,
1.585205, 0.9257403, 1.169679, 0, 0, 0, 1, 1,
1.587749, -0.5906113, -0.4813326, 0, 0, 0, 1, 1,
1.602115, 0.1057727, 0.8214824, 0, 0, 0, 1, 1,
1.605287, 0.06741153, 3.848379, 0, 0, 0, 1, 1,
1.60772, 1.538664, 1.225983, 0, 0, 0, 1, 1,
1.61008, 0.1674209, 0.8236417, 0, 0, 0, 1, 1,
1.625219, -0.6935958, 1.265218, 0, 0, 0, 1, 1,
1.626382, 0.5795133, -0.4499831, 1, 1, 1, 1, 1,
1.637348, 1.074978, 1.147715, 1, 1, 1, 1, 1,
1.637595, 0.9810574, 0.9754363, 1, 1, 1, 1, 1,
1.640216, -0.485394, 2.4231, 1, 1, 1, 1, 1,
1.642657, -0.07885875, 2.528311, 1, 1, 1, 1, 1,
1.643365, -0.8167149, 2.148945, 1, 1, 1, 1, 1,
1.649076, -0.4078336, 0.9985458, 1, 1, 1, 1, 1,
1.653647, 0.04766689, 1.730106, 1, 1, 1, 1, 1,
1.653795, 0.4933133, 1.630043, 1, 1, 1, 1, 1,
1.656259, 0.7950451, 0.7482672, 1, 1, 1, 1, 1,
1.666288, -0.6847122, 3.335663, 1, 1, 1, 1, 1,
1.675559, -0.2784146, 1.746976, 1, 1, 1, 1, 1,
1.704583, 0.03946044, 0.1398024, 1, 1, 1, 1, 1,
1.705939, 0.5257931, 1.379325, 1, 1, 1, 1, 1,
1.707608, 1.11069, -0.1742961, 1, 1, 1, 1, 1,
1.707856, 0.8476723, -0.08173402, 0, 0, 1, 1, 1,
1.71235, -0.9747494, 2.805824, 1, 0, 0, 1, 1,
1.720213, 1.771018, 1.017425, 1, 0, 0, 1, 1,
1.729967, -0.1580315, 1.377324, 1, 0, 0, 1, 1,
1.738288, -0.8997622, 1.947827, 1, 0, 0, 1, 1,
1.764493, 0.2308359, 2.71347, 1, 0, 0, 1, 1,
1.764498, 0.810127, 2.033059, 0, 0, 0, 1, 1,
1.76851, -0.7812711, 1.436569, 0, 0, 0, 1, 1,
1.769766, -1.567961, 3.035248, 0, 0, 0, 1, 1,
1.770249, 0.5488276, 0.8467783, 0, 0, 0, 1, 1,
1.779457, -0.08115854, 2.598053, 0, 0, 0, 1, 1,
1.783538, 1.116966, 0.7431641, 0, 0, 0, 1, 1,
1.783852, 0.3578647, 0.7341129, 0, 0, 0, 1, 1,
1.792508, 0.2343745, 0.1906571, 1, 1, 1, 1, 1,
1.828352, -0.04528691, 1.726775, 1, 1, 1, 1, 1,
1.848885, 0.9951717, 0.8190747, 1, 1, 1, 1, 1,
1.860795, -0.3061113, 1.112745, 1, 1, 1, 1, 1,
1.869814, 1.386721, 1.113039, 1, 1, 1, 1, 1,
1.893709, 0.9410548, -0.3625013, 1, 1, 1, 1, 1,
1.899125, 0.1261144, 0.6949481, 1, 1, 1, 1, 1,
1.914939, 0.01526233, 0.7717237, 1, 1, 1, 1, 1,
1.921709, -2.652975, 2.731759, 1, 1, 1, 1, 1,
1.923589, 0.3836887, 2.123141, 1, 1, 1, 1, 1,
1.953634, 0.6469625, 1.30221, 1, 1, 1, 1, 1,
1.967339, -1.529399, 2.924154, 1, 1, 1, 1, 1,
1.977378, -0.140095, 1.98643, 1, 1, 1, 1, 1,
1.980419, 0.03140523, 2.323387, 1, 1, 1, 1, 1,
1.986629, -2.252743, 3.284367, 1, 1, 1, 1, 1,
2.028793, 0.1428187, 2.385215, 0, 0, 1, 1, 1,
2.038357, -1.207255, 1.909962, 1, 0, 0, 1, 1,
2.038529, -0.8189074, 0.3401466, 1, 0, 0, 1, 1,
2.096381, 0.220478, 1.548377, 1, 0, 0, 1, 1,
2.133618, 1.088303, 0.9099077, 1, 0, 0, 1, 1,
2.163922, 0.8824857, -0.4601674, 1, 0, 0, 1, 1,
2.232713, 2.077899, -0.1416985, 0, 0, 0, 1, 1,
2.296753, 0.03742531, 2.486753, 0, 0, 0, 1, 1,
2.381042, 0.1021929, 0.009819504, 0, 0, 0, 1, 1,
2.449243, 2.92628, 0.6686597, 0, 0, 0, 1, 1,
2.478756, -1.117657, 2.558921, 0, 0, 0, 1, 1,
2.609007, 0.2464814, 3.345993, 0, 0, 0, 1, 1,
2.615353, -0.4197176, 1.629335, 0, 0, 0, 1, 1,
2.680754, 0.3839131, 2.84535, 1, 1, 1, 1, 1,
2.746992, -0.7801343, 2.502911, 1, 1, 1, 1, 1,
2.757018, -2.09797, 2.5899, 1, 1, 1, 1, 1,
2.804692, 1.272062, 0.3363214, 1, 1, 1, 1, 1,
2.896678, -0.9524888, 1.142445, 1, 1, 1, 1, 1,
3.247043, -0.3973915, 0.7376763, 1, 1, 1, 1, 1,
3.56379, 0.1070552, 2.393845, 1, 1, 1, 1, 1
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
var radius = 9.961221;
var distance = 34.98837;
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
mvMatrix.translate( 0.07040524, 0.1283011, -0.2357814 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.98837);
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
