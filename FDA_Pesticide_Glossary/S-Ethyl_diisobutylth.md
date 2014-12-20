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
-3.977183, 1.832257, -1.029186, 1, 0, 0, 1,
-2.967863, 0.854553, -0.4491453, 1, 0.007843138, 0, 1,
-2.718004, -0.670393, -0.62677, 1, 0.01176471, 0, 1,
-2.715459, -0.3917595, -2.366763, 1, 0.01960784, 0, 1,
-2.700351, -0.2862902, -2.461351, 1, 0.02352941, 0, 1,
-2.698136, 1.291212, -2.170936, 1, 0.03137255, 0, 1,
-2.681988, 1.333857, 0.1541145, 1, 0.03529412, 0, 1,
-2.570527, -0.7855544, -1.671489, 1, 0.04313726, 0, 1,
-2.568588, 0.5095356, -2.14693, 1, 0.04705882, 0, 1,
-2.495577, 0.6461294, -1.54158, 1, 0.05490196, 0, 1,
-2.465577, 1.094822, -0.4687929, 1, 0.05882353, 0, 1,
-2.450187, 0.4310848, -2.102704, 1, 0.06666667, 0, 1,
-2.447202, 0.5633685, -0.3384771, 1, 0.07058824, 0, 1,
-2.396842, 1.31592, -1.263273, 1, 0.07843138, 0, 1,
-2.385983, -1.19504, -2.864966, 1, 0.08235294, 0, 1,
-2.324782, -1.837452, -2.185512, 1, 0.09019608, 0, 1,
-2.321132, -1.264495, -1.018097, 1, 0.09411765, 0, 1,
-2.30478, 1.063934, -0.2157959, 1, 0.1019608, 0, 1,
-2.261995, -0.4285575, -1.66285, 1, 0.1098039, 0, 1,
-2.255183, 0.6364474, -1.188227, 1, 0.1137255, 0, 1,
-2.211717, 1.484715, -1.368854, 1, 0.1215686, 0, 1,
-2.161552, 1.191599, -1.357927, 1, 0.1254902, 0, 1,
-2.149825, 0.117933, -2.845479, 1, 0.1333333, 0, 1,
-2.131904, -0.5624819, -0.09612942, 1, 0.1372549, 0, 1,
-2.081152, 0.8866319, -0.03372563, 1, 0.145098, 0, 1,
-2.072339, -1.117585, -1.131383, 1, 0.1490196, 0, 1,
-2.070635, -0.3303023, -0.1594001, 1, 0.1568628, 0, 1,
-2.042998, -0.5243278, -3.933824, 1, 0.1607843, 0, 1,
-2.038255, 0.1263409, -0.8767847, 1, 0.1686275, 0, 1,
-2.033473, -1.256659, -1.322844, 1, 0.172549, 0, 1,
-2.03347, -0.09383485, -2.306395, 1, 0.1803922, 0, 1,
-2.024862, 0.01412056, -3.79056, 1, 0.1843137, 0, 1,
-2.024823, 1.734086, -2.199377, 1, 0.1921569, 0, 1,
-2.005342, 0.4199345, -2.359103, 1, 0.1960784, 0, 1,
-1.97075, -0.6430921, -1.127245, 1, 0.2039216, 0, 1,
-1.968578, 2.099033, -0.6446201, 1, 0.2117647, 0, 1,
-1.957087, 0.6769827, -1.748411, 1, 0.2156863, 0, 1,
-1.909129, 0.06834888, -1.244438, 1, 0.2235294, 0, 1,
-1.903509, 0.3117484, -1.7019, 1, 0.227451, 0, 1,
-1.883851, 1.331983, -0.146285, 1, 0.2352941, 0, 1,
-1.872951, 1.21523, -1.599007, 1, 0.2392157, 0, 1,
-1.863047, 0.6855244, -0.3348591, 1, 0.2470588, 0, 1,
-1.845749, -1.209645, -0.9206001, 1, 0.2509804, 0, 1,
-1.829458, -0.04295322, -1.685892, 1, 0.2588235, 0, 1,
-1.809752, 0.2016363, -2.269965, 1, 0.2627451, 0, 1,
-1.809172, 0.9317928, -1.381249, 1, 0.2705882, 0, 1,
-1.800425, 1.008179, -0.4384428, 1, 0.2745098, 0, 1,
-1.799439, 0.03630381, -3.61748, 1, 0.282353, 0, 1,
-1.792093, -0.5807265, -1.368167, 1, 0.2862745, 0, 1,
-1.790793, -0.6170968, -1.942146, 1, 0.2941177, 0, 1,
-1.77894, 0.2611461, -0.1499495, 1, 0.3019608, 0, 1,
-1.777446, -0.4606924, -2.519752, 1, 0.3058824, 0, 1,
-1.766576, -0.3449896, -1.993106, 1, 0.3137255, 0, 1,
-1.76386, -0.7896026, -2.43211, 1, 0.3176471, 0, 1,
-1.742244, 0.9635359, -2.467494, 1, 0.3254902, 0, 1,
-1.736679, -1.151594, -2.017633, 1, 0.3294118, 0, 1,
-1.731517, 0.4027801, -2.231466, 1, 0.3372549, 0, 1,
-1.71958, 1.049342, -2.383072, 1, 0.3411765, 0, 1,
-1.717678, -0.8687623, 0.01894473, 1, 0.3490196, 0, 1,
-1.716018, -0.1447195, -0.7647645, 1, 0.3529412, 0, 1,
-1.706248, -0.3983474, -1.465585, 1, 0.3607843, 0, 1,
-1.690247, -0.5233264, -1.133885, 1, 0.3647059, 0, 1,
-1.684375, 1.587236, -0.4504671, 1, 0.372549, 0, 1,
-1.676729, -0.2445112, -0.7390393, 1, 0.3764706, 0, 1,
-1.676521, -0.7605171, -0.9355501, 1, 0.3843137, 0, 1,
-1.670538, -0.720748, -1.58328, 1, 0.3882353, 0, 1,
-1.661044, -0.6565907, -1.280172, 1, 0.3960784, 0, 1,
-1.64271, 0.4626924, -1.292715, 1, 0.4039216, 0, 1,
-1.64174, 0.8850728, -1.307501, 1, 0.4078431, 0, 1,
-1.618876, 0.4182183, -0.9493786, 1, 0.4156863, 0, 1,
-1.615395, 0.6461593, -1.997154, 1, 0.4196078, 0, 1,
-1.613738, 0.3636165, 0.07981316, 1, 0.427451, 0, 1,
-1.60324, 0.9242204, -0.9253206, 1, 0.4313726, 0, 1,
-1.60103, 1.475626, -0.7325048, 1, 0.4392157, 0, 1,
-1.588167, 1.526948, -1.529659, 1, 0.4431373, 0, 1,
-1.564631, 1.581774, 0.5718557, 1, 0.4509804, 0, 1,
-1.552065, -0.1896031, -3.261053, 1, 0.454902, 0, 1,
-1.545704, 0.4183663, -1.832289, 1, 0.4627451, 0, 1,
-1.532963, -0.6242917, -1.424854, 1, 0.4666667, 0, 1,
-1.529754, 0.5513004, -1.038181, 1, 0.4745098, 0, 1,
-1.527873, 1.144097, -1.983366, 1, 0.4784314, 0, 1,
-1.525909, -0.7166491, -1.225875, 1, 0.4862745, 0, 1,
-1.525245, 0.8599806, -0.8591368, 1, 0.4901961, 0, 1,
-1.519133, -0.1682246, -1.490504, 1, 0.4980392, 0, 1,
-1.517642, 0.9201872, -1.840923, 1, 0.5058824, 0, 1,
-1.514479, -0.2917724, -0.7136076, 1, 0.509804, 0, 1,
-1.504967, -0.05275051, -3.026109, 1, 0.5176471, 0, 1,
-1.503482, 1.750326, 0.7680783, 1, 0.5215687, 0, 1,
-1.489176, -0.4454139, -1.505998, 1, 0.5294118, 0, 1,
-1.475221, -0.765339, -1.989089, 1, 0.5333334, 0, 1,
-1.467724, -0.16878, -2.388625, 1, 0.5411765, 0, 1,
-1.458429, 1.8284, 0.08816147, 1, 0.5450981, 0, 1,
-1.456378, -1.951643, -3.162106, 1, 0.5529412, 0, 1,
-1.453736, -1.881449, -1.660081, 1, 0.5568628, 0, 1,
-1.44841, 1.691314, -0.4194963, 1, 0.5647059, 0, 1,
-1.434556, 0.6654506, -1.551898, 1, 0.5686275, 0, 1,
-1.431978, 1.121052, -1.429485, 1, 0.5764706, 0, 1,
-1.419937, 3.009131, -0.8289893, 1, 0.5803922, 0, 1,
-1.401019, 0.1097104, -2.884279, 1, 0.5882353, 0, 1,
-1.391659, -0.3320931, -1.104496, 1, 0.5921569, 0, 1,
-1.391254, 0.06870474, -1.133458, 1, 0.6, 0, 1,
-1.380345, -0.580963, -1.878632, 1, 0.6078432, 0, 1,
-1.380094, 0.4095429, -1.930478, 1, 0.6117647, 0, 1,
-1.373937, 0.5992126, -1.205972, 1, 0.6196079, 0, 1,
-1.357772, -1.436677, -4.137074, 1, 0.6235294, 0, 1,
-1.316705, 2.730645, -0.8372028, 1, 0.6313726, 0, 1,
-1.307872, 0.3968282, -1.799075, 1, 0.6352941, 0, 1,
-1.304944, -0.72102, -3.797314, 1, 0.6431373, 0, 1,
-1.300932, -0.5608428, 0.2346606, 1, 0.6470588, 0, 1,
-1.298554, 1.232497, -1.570857, 1, 0.654902, 0, 1,
-1.297241, 0.9634142, -0.1482493, 1, 0.6588235, 0, 1,
-1.294156, 0.1167636, -1.398872, 1, 0.6666667, 0, 1,
-1.270926, -2.105859, -1.736514, 1, 0.6705883, 0, 1,
-1.268728, 0.3831942, -1.299019, 1, 0.6784314, 0, 1,
-1.264892, -0.2134482, -1.289729, 1, 0.682353, 0, 1,
-1.263018, -3.076497, -2.876181, 1, 0.6901961, 0, 1,
-1.262037, -2.296727, -2.715954, 1, 0.6941177, 0, 1,
-1.260233, -1.864284, -3.499301, 1, 0.7019608, 0, 1,
-1.258924, 0.01623258, 0.8883135, 1, 0.7098039, 0, 1,
-1.256252, -1.682838, -1.692784, 1, 0.7137255, 0, 1,
-1.249967, 0.4551951, -1.860525, 1, 0.7215686, 0, 1,
-1.236631, 0.5480204, 0.4978257, 1, 0.7254902, 0, 1,
-1.229705, -0.2764732, -1.907472, 1, 0.7333333, 0, 1,
-1.228455, 0.5670053, -0.9558939, 1, 0.7372549, 0, 1,
-1.216222, -1.762023, -2.759049, 1, 0.7450981, 0, 1,
-1.194943, -0.4620379, -0.6911445, 1, 0.7490196, 0, 1,
-1.192719, 0.9164162, -1.944667, 1, 0.7568628, 0, 1,
-1.185717, 0.0626369, -2.150975, 1, 0.7607843, 0, 1,
-1.185094, 0.9306231, -0.6175861, 1, 0.7686275, 0, 1,
-1.180891, -0.8146878, -0.1079539, 1, 0.772549, 0, 1,
-1.171069, 0.5865268, -1.959033, 1, 0.7803922, 0, 1,
-1.16613, -1.267299, -2.429342, 1, 0.7843137, 0, 1,
-1.163178, -0.04920756, 0.2175624, 1, 0.7921569, 0, 1,
-1.161686, -1.876602, -2.842976, 1, 0.7960784, 0, 1,
-1.154135, -1.225461, 0.1597082, 1, 0.8039216, 0, 1,
-1.144691, -1.312659, -3.314556, 1, 0.8117647, 0, 1,
-1.144282, 0.9558483, -2.282559, 1, 0.8156863, 0, 1,
-1.143924, -2.995104, -4.414774, 1, 0.8235294, 0, 1,
-1.139123, -0.320311, -2.40364, 1, 0.827451, 0, 1,
-1.128297, 0.3559321, -1.034482, 1, 0.8352941, 0, 1,
-1.117589, 0.008716592, -0.9728485, 1, 0.8392157, 0, 1,
-1.113259, 0.8823621, 0.1833371, 1, 0.8470588, 0, 1,
-1.112798, 0.3525344, -1.105465, 1, 0.8509804, 0, 1,
-1.101172, 0.9904486, -0.8575212, 1, 0.8588235, 0, 1,
-1.088789, -1.046128, -1.572346, 1, 0.8627451, 0, 1,
-1.079971, -0.03481665, -2.397871, 1, 0.8705882, 0, 1,
-1.072554, -0.508567, -3.290222, 1, 0.8745098, 0, 1,
-1.066965, -0.2259906, -3.389171, 1, 0.8823529, 0, 1,
-1.06661, -0.2186573, -2.001511, 1, 0.8862745, 0, 1,
-1.064668, 0.5462821, 0.7652463, 1, 0.8941177, 0, 1,
-1.060798, -1.415123, -1.57937, 1, 0.8980392, 0, 1,
-1.059945, -1.034232, -1.25357, 1, 0.9058824, 0, 1,
-1.059455, 0.1169639, 0.09992225, 1, 0.9137255, 0, 1,
-1.052916, -1.080436, -2.404607, 1, 0.9176471, 0, 1,
-1.049788, 0.9794108, -0.02220964, 1, 0.9254902, 0, 1,
-1.041278, -0.605935, -3.608198, 1, 0.9294118, 0, 1,
-1.04074, -0.7087678, -2.54713, 1, 0.9372549, 0, 1,
-1.037042, 1.053394, 0.5908425, 1, 0.9411765, 0, 1,
-1.03273, 1.484527, -2.173971, 1, 0.9490196, 0, 1,
-1.031688, 0.2682944, -1.317798, 1, 0.9529412, 0, 1,
-1.028796, 1.313107, -1.941819, 1, 0.9607843, 0, 1,
-1.02433, 1.010258, -1.8132, 1, 0.9647059, 0, 1,
-1.02081, -1.595368, -1.281254, 1, 0.972549, 0, 1,
-1.019619, 0.1996608, -2.598207, 1, 0.9764706, 0, 1,
-1.014198, -0.9440397, -1.541558, 1, 0.9843137, 0, 1,
-1.012206, 0.1949503, 0.2686113, 1, 0.9882353, 0, 1,
-1.011241, -0.327886, -3.750824, 1, 0.9960784, 0, 1,
-1.007745, 0.6368997, -0.7506651, 0.9960784, 1, 0, 1,
-1.005169, 0.2788713, -2.006262, 0.9921569, 1, 0, 1,
-0.9953305, -1.222293, -2.823503, 0.9843137, 1, 0, 1,
-0.9926225, 1.43515, -1.709646, 0.9803922, 1, 0, 1,
-0.9885071, 1.552894, -1.233808, 0.972549, 1, 0, 1,
-0.9869562, 0.3406003, -1.713677, 0.9686275, 1, 0, 1,
-0.979771, -1.129581, -2.066424, 0.9607843, 1, 0, 1,
-0.9763253, 0.8090549, 0.4248524, 0.9568627, 1, 0, 1,
-0.9732523, 0.3060973, -0.4387999, 0.9490196, 1, 0, 1,
-0.9729549, 0.4333049, -1.236922, 0.945098, 1, 0, 1,
-0.967099, 1.583147, -0.9838053, 0.9372549, 1, 0, 1,
-0.9652027, 1.324307, -0.9708543, 0.9333333, 1, 0, 1,
-0.9605826, -0.857493, -0.4835845, 0.9254902, 1, 0, 1,
-0.9565663, 0.6643434, -0.922705, 0.9215686, 1, 0, 1,
-0.9543443, -0.2359879, -0.3856152, 0.9137255, 1, 0, 1,
-0.9540083, 1.061082, 0.09995109, 0.9098039, 1, 0, 1,
-0.95357, -0.3244605, -0.7880324, 0.9019608, 1, 0, 1,
-0.9406425, 0.7917448, -0.4359479, 0.8941177, 1, 0, 1,
-0.9375643, 0.6003073, -1.327478, 0.8901961, 1, 0, 1,
-0.9310488, -0.1004921, -2.010721, 0.8823529, 1, 0, 1,
-0.9163136, 1.459734, 0.296288, 0.8784314, 1, 0, 1,
-0.915128, 0.03585457, -1.371832, 0.8705882, 1, 0, 1,
-0.9112266, 0.1166067, -0.7410376, 0.8666667, 1, 0, 1,
-0.9099377, 1.235942, 0.6291425, 0.8588235, 1, 0, 1,
-0.9087187, -1.26517, -4.023363, 0.854902, 1, 0, 1,
-0.9053938, 1.621892, -2.906399, 0.8470588, 1, 0, 1,
-0.8984388, 0.05102061, -3.138931, 0.8431373, 1, 0, 1,
-0.8943232, -2.193818, -3.56687, 0.8352941, 1, 0, 1,
-0.8940957, 0.06657879, 0.3675754, 0.8313726, 1, 0, 1,
-0.8875165, -0.05233491, -2.067961, 0.8235294, 1, 0, 1,
-0.8844506, 0.9051222, -1.282709, 0.8196079, 1, 0, 1,
-0.8737751, -1.81022, -2.37687, 0.8117647, 1, 0, 1,
-0.8726597, -0.325743, -2.82311, 0.8078431, 1, 0, 1,
-0.8702826, -0.9546117, -3.331967, 0.8, 1, 0, 1,
-0.8687152, -0.6456814, -2.379275, 0.7921569, 1, 0, 1,
-0.8669668, 0.8928971, -1.211936, 0.7882353, 1, 0, 1,
-0.8606511, -1.921583, -2.426033, 0.7803922, 1, 0, 1,
-0.8507543, -1.559542, -2.781466, 0.7764706, 1, 0, 1,
-0.8460261, -1.347255, -3.277717, 0.7686275, 1, 0, 1,
-0.8378854, -0.8938788, -4.129071, 0.7647059, 1, 0, 1,
-0.83323, 1.1898, -2.617558, 0.7568628, 1, 0, 1,
-0.8270294, -0.1310289, -1.998031, 0.7529412, 1, 0, 1,
-0.8269417, 0.1417565, -1.625547, 0.7450981, 1, 0, 1,
-0.8264548, -0.09473176, -1.360182, 0.7411765, 1, 0, 1,
-0.8172824, 0.4644571, -0.8214867, 0.7333333, 1, 0, 1,
-0.8070006, 0.7400281, -0.9983369, 0.7294118, 1, 0, 1,
-0.806481, -0.1281071, -1.505894, 0.7215686, 1, 0, 1,
-0.805976, 1.939016, -1.122389, 0.7176471, 1, 0, 1,
-0.8014559, -0.9314714, -3.119895, 0.7098039, 1, 0, 1,
-0.7952863, 0.7520925, -0.7264101, 0.7058824, 1, 0, 1,
-0.7934248, -0.4372268, -2.049166, 0.6980392, 1, 0, 1,
-0.7877018, 1.216788, -0.5474275, 0.6901961, 1, 0, 1,
-0.7855529, 1.945673, 0.7719517, 0.6862745, 1, 0, 1,
-0.7827994, -1.87437, -2.983945, 0.6784314, 1, 0, 1,
-0.780934, 1.080793, -1.111534, 0.6745098, 1, 0, 1,
-0.7787932, -0.8908709, -1.589019, 0.6666667, 1, 0, 1,
-0.7723593, 0.9728575, 0.3370694, 0.6627451, 1, 0, 1,
-0.7683573, -0.3864252, -0.06112758, 0.654902, 1, 0, 1,
-0.7639287, -0.1972349, -1.774019, 0.6509804, 1, 0, 1,
-0.7610639, -0.5908441, -1.263886, 0.6431373, 1, 0, 1,
-0.7607356, 2.663859, -0.09274636, 0.6392157, 1, 0, 1,
-0.7606097, 1.357601, -0.6621651, 0.6313726, 1, 0, 1,
-0.7587941, 0.4725117, 0.3516698, 0.627451, 1, 0, 1,
-0.7569362, -0.6404483, -3.012249, 0.6196079, 1, 0, 1,
-0.749125, 1.051306, -1.126286, 0.6156863, 1, 0, 1,
-0.7453952, 0.2722676, -1.12133, 0.6078432, 1, 0, 1,
-0.7449743, 2.312687, -0.1459391, 0.6039216, 1, 0, 1,
-0.7431616, -3.64974, -1.875358, 0.5960785, 1, 0, 1,
-0.7431341, -0.2778335, -1.746893, 0.5882353, 1, 0, 1,
-0.7373477, -2.312594, -1.722769, 0.5843138, 1, 0, 1,
-0.7355325, -0.1814789, -1.736142, 0.5764706, 1, 0, 1,
-0.7353794, -1.526116, -1.923167, 0.572549, 1, 0, 1,
-0.7285857, -0.6159626, -1.370572, 0.5647059, 1, 0, 1,
-0.7267148, 1.464017, 0.1110774, 0.5607843, 1, 0, 1,
-0.7249609, 0.7204903, -0.2803682, 0.5529412, 1, 0, 1,
-0.7247754, 2.124769, -1.726073, 0.5490196, 1, 0, 1,
-0.7218052, -0.198199, -1.276505, 0.5411765, 1, 0, 1,
-0.7142038, -1.75316, -2.411837, 0.5372549, 1, 0, 1,
-0.7098814, 0.8197243, 0.9716033, 0.5294118, 1, 0, 1,
-0.7066545, -0.1537704, -1.973544, 0.5254902, 1, 0, 1,
-0.7043365, 0.8752776, -2.491331, 0.5176471, 1, 0, 1,
-0.7000116, 1.053826, 0.3617213, 0.5137255, 1, 0, 1,
-0.6915619, -0.3948449, -0.4826531, 0.5058824, 1, 0, 1,
-0.6894837, -1.08674, -3.429812, 0.5019608, 1, 0, 1,
-0.6864087, -1.367866, -2.686246, 0.4941176, 1, 0, 1,
-0.685961, 0.3328271, -0.9902316, 0.4862745, 1, 0, 1,
-0.6809207, 0.4708972, -0.9258004, 0.4823529, 1, 0, 1,
-0.6805447, 1.27774, -1.413814, 0.4745098, 1, 0, 1,
-0.6759722, -1.261985, -2.290738, 0.4705882, 1, 0, 1,
-0.6686227, 0.4599438, -0.1719263, 0.4627451, 1, 0, 1,
-0.6684111, -0.06464349, -1.654493, 0.4588235, 1, 0, 1,
-0.6667473, -1.051969, -1.986561, 0.4509804, 1, 0, 1,
-0.6604508, -0.4873681, -3.359777, 0.4470588, 1, 0, 1,
-0.6568279, -0.6424274, -1.73163, 0.4392157, 1, 0, 1,
-0.647316, 0.7870529, -1.374395, 0.4352941, 1, 0, 1,
-0.6427317, -0.8658963, -3.478339, 0.427451, 1, 0, 1,
-0.6392077, -1.376678, -1.909165, 0.4235294, 1, 0, 1,
-0.6380823, 0.5122455, -1.714347, 0.4156863, 1, 0, 1,
-0.6376325, 0.9105831, 0.2194365, 0.4117647, 1, 0, 1,
-0.6353468, 0.4060676, 0.5987377, 0.4039216, 1, 0, 1,
-0.6352486, -0.1526884, -1.529128, 0.3960784, 1, 0, 1,
-0.6346167, 1.169562, -0.1659242, 0.3921569, 1, 0, 1,
-0.6311193, -0.3039728, -0.8647934, 0.3843137, 1, 0, 1,
-0.6302668, -1.181765, -2.714707, 0.3803922, 1, 0, 1,
-0.6282212, -2.371847, -3.030836, 0.372549, 1, 0, 1,
-0.6206598, 1.814678, 0.002277039, 0.3686275, 1, 0, 1,
-0.6112606, 0.02948388, -1.799622, 0.3607843, 1, 0, 1,
-0.6068672, 0.8361897, 0.1289704, 0.3568628, 1, 0, 1,
-0.6046957, -0.7815148, -1.279979, 0.3490196, 1, 0, 1,
-0.6045152, -0.7806165, -3.071689, 0.345098, 1, 0, 1,
-0.6025534, -1.308307, -3.028069, 0.3372549, 1, 0, 1,
-0.5985171, -0.04686633, -2.682293, 0.3333333, 1, 0, 1,
-0.5951798, -0.7260721, -3.502771, 0.3254902, 1, 0, 1,
-0.5913566, -0.108733, -0.9470578, 0.3215686, 1, 0, 1,
-0.5896419, 1.344977, 0.7096627, 0.3137255, 1, 0, 1,
-0.5803627, 0.5300794, -2.039074, 0.3098039, 1, 0, 1,
-0.5777559, 0.2742495, -1.605966, 0.3019608, 1, 0, 1,
-0.5768142, -1.103782, -2.283106, 0.2941177, 1, 0, 1,
-0.569478, 0.4136602, -1.090521, 0.2901961, 1, 0, 1,
-0.5652512, 1.011526, 0.7766636, 0.282353, 1, 0, 1,
-0.5583761, 0.5643623, 0.4424282, 0.2784314, 1, 0, 1,
-0.5578752, -0.1087414, -1.564484, 0.2705882, 1, 0, 1,
-0.5566086, -0.4144092, -1.257493, 0.2666667, 1, 0, 1,
-0.5531549, 0.9650983, -0.3008184, 0.2588235, 1, 0, 1,
-0.5454439, -0.2007956, -1.668673, 0.254902, 1, 0, 1,
-0.5451373, 1.513367, -0.6285414, 0.2470588, 1, 0, 1,
-0.5444682, -0.1050351, -1.515409, 0.2431373, 1, 0, 1,
-0.5436869, 1.057723, -1.50268, 0.2352941, 1, 0, 1,
-0.54297, -0.4750824, -2.604094, 0.2313726, 1, 0, 1,
-0.5426551, -0.4516455, -2.402788, 0.2235294, 1, 0, 1,
-0.5416747, 1.278748, -1.371715, 0.2196078, 1, 0, 1,
-0.5408441, 0.9338551, -1.826053, 0.2117647, 1, 0, 1,
-0.539506, -0.09023806, -1.312004, 0.2078431, 1, 0, 1,
-0.5352044, 0.06589808, -1.970043, 0.2, 1, 0, 1,
-0.5263599, 1.11031, -1.807738, 0.1921569, 1, 0, 1,
-0.5227413, -1.153663, -2.013831, 0.1882353, 1, 0, 1,
-0.5218457, 2.407088, -1.029135, 0.1803922, 1, 0, 1,
-0.5180241, 1.091998, 0.5112354, 0.1764706, 1, 0, 1,
-0.5153034, -1.266241, -3.267893, 0.1686275, 1, 0, 1,
-0.5131165, 1.675428, -0.5146105, 0.1647059, 1, 0, 1,
-0.507934, -1.341726, -2.517096, 0.1568628, 1, 0, 1,
-0.489979, -0.1460267, -1.119561, 0.1529412, 1, 0, 1,
-0.4855593, 1.016963, -0.05778147, 0.145098, 1, 0, 1,
-0.4832076, -0.04714999, -0.5122268, 0.1411765, 1, 0, 1,
-0.4810009, -0.03872096, 0.2579734, 0.1333333, 1, 0, 1,
-0.4726003, -1.187868, -4.950358, 0.1294118, 1, 0, 1,
-0.4685346, -0.8139627, -1.461813, 0.1215686, 1, 0, 1,
-0.4682765, 0.8509206, 1.642328, 0.1176471, 1, 0, 1,
-0.4660924, 0.1299125, -1.516799, 0.1098039, 1, 0, 1,
-0.4659082, -1.10793, -2.625691, 0.1058824, 1, 0, 1,
-0.4642218, 0.4770773, 0.001943373, 0.09803922, 1, 0, 1,
-0.4623085, 1.713635, -0.3015133, 0.09019608, 1, 0, 1,
-0.4598383, 0.7281742, 0.4065669, 0.08627451, 1, 0, 1,
-0.4578853, 2.697555, -0.1690833, 0.07843138, 1, 0, 1,
-0.4528668, -0.3179313, -3.064196, 0.07450981, 1, 0, 1,
-0.4519972, 0.4343292, -1.059576, 0.06666667, 1, 0, 1,
-0.4513443, -0.193567, -2.33258, 0.0627451, 1, 0, 1,
-0.4502167, -0.3163694, -1.21082, 0.05490196, 1, 0, 1,
-0.4406219, -1.835547, -3.759053, 0.05098039, 1, 0, 1,
-0.437597, 0.5317798, -0.5289933, 0.04313726, 1, 0, 1,
-0.432452, 0.3096325, 0.240415, 0.03921569, 1, 0, 1,
-0.4307568, -0.1587298, -3.045136, 0.03137255, 1, 0, 1,
-0.4277215, 0.7139007, 0.1198295, 0.02745098, 1, 0, 1,
-0.4265244, -0.6368276, -3.556007, 0.01960784, 1, 0, 1,
-0.4257113, 1.20348, -0.119259, 0.01568628, 1, 0, 1,
-0.4255055, 0.301377, -2.773671, 0.007843138, 1, 0, 1,
-0.425254, -1.217285, -2.768646, 0.003921569, 1, 0, 1,
-0.423008, 0.04374623, -0.3744908, 0, 1, 0.003921569, 1,
-0.4163349, -0.4912042, -1.226611, 0, 1, 0.01176471, 1,
-0.4152623, -1.216256, -2.269271, 0, 1, 0.01568628, 1,
-0.4054338, -1.518671, -3.016742, 0, 1, 0.02352941, 1,
-0.4039211, 0.3837569, -1.75592, 0, 1, 0.02745098, 1,
-0.4034606, -0.5967272, -2.578962, 0, 1, 0.03529412, 1,
-0.4012575, -0.321257, -2.394717, 0, 1, 0.03921569, 1,
-0.399373, -0.1023239, -1.869293, 0, 1, 0.04705882, 1,
-0.3930133, 0.9692497, -0.4306829, 0, 1, 0.05098039, 1,
-0.3916005, 0.7607334, 0.3222915, 0, 1, 0.05882353, 1,
-0.3907412, 0.8496839, -0.1741077, 0, 1, 0.0627451, 1,
-0.3886356, 0.4750209, -0.5736087, 0, 1, 0.07058824, 1,
-0.3859616, -0.5547829, -2.999931, 0, 1, 0.07450981, 1,
-0.3858715, -0.1510634, -2.393255, 0, 1, 0.08235294, 1,
-0.3853243, 0.06850592, -1.666106, 0, 1, 0.08627451, 1,
-0.3851259, 2.203762, 0.03989593, 0, 1, 0.09411765, 1,
-0.3810311, -0.4687292, -2.493915, 0, 1, 0.1019608, 1,
-0.3806546, 1.499244, -0.474743, 0, 1, 0.1058824, 1,
-0.3791404, 0.6323789, -0.7160795, 0, 1, 0.1137255, 1,
-0.3774439, 0.3344812, -2.178346, 0, 1, 0.1176471, 1,
-0.3766009, -0.7293846, -1.727766, 0, 1, 0.1254902, 1,
-0.3760458, -0.5071498, -5.06933, 0, 1, 0.1294118, 1,
-0.3749821, 0.4588524, 1.01022, 0, 1, 0.1372549, 1,
-0.3712542, 0.5113772, -0.5883969, 0, 1, 0.1411765, 1,
-0.3701271, 1.699622, 0.6757571, 0, 1, 0.1490196, 1,
-0.3699881, 1.073649, -0.6519871, 0, 1, 0.1529412, 1,
-0.3669252, 0.4344694, -0.269253, 0, 1, 0.1607843, 1,
-0.3650238, 0.5449861, 0.07267312, 0, 1, 0.1647059, 1,
-0.3600839, -0.1282672, -0.5851906, 0, 1, 0.172549, 1,
-0.3569127, 0.6819639, 0.2971965, 0, 1, 0.1764706, 1,
-0.352911, -0.5874088, -3.256805, 0, 1, 0.1843137, 1,
-0.3472885, 0.2955441, 1.100822, 0, 1, 0.1882353, 1,
-0.3467318, -1.086261, -5.018702, 0, 1, 0.1960784, 1,
-0.3432319, 0.4135062, 0.5950239, 0, 1, 0.2039216, 1,
-0.3403718, 0.03646026, -2.654152, 0, 1, 0.2078431, 1,
-0.3384725, -0.2186736, -2.756073, 0, 1, 0.2156863, 1,
-0.3342001, -0.5736303, -2.917901, 0, 1, 0.2196078, 1,
-0.3333179, -2.356289, -1.794048, 0, 1, 0.227451, 1,
-0.3318851, 0.8730468, -1.63859, 0, 1, 0.2313726, 1,
-0.3314937, 1.85915, -0.02585892, 0, 1, 0.2392157, 1,
-0.3309355, -1.035641, -2.734984, 0, 1, 0.2431373, 1,
-0.329424, -2.617849, -1.322888, 0, 1, 0.2509804, 1,
-0.3279498, -0.06256191, -2.03762, 0, 1, 0.254902, 1,
-0.3264246, -0.5077224, -1.498051, 0, 1, 0.2627451, 1,
-0.3261292, 0.9649342, -0.2998987, 0, 1, 0.2666667, 1,
-0.3212079, 0.5735083, 0.1360886, 0, 1, 0.2745098, 1,
-0.3178931, -1.140023, -2.430106, 0, 1, 0.2784314, 1,
-0.3097127, -0.1761556, -2.499561, 0, 1, 0.2862745, 1,
-0.3057435, -2.93749, -2.831797, 0, 1, 0.2901961, 1,
-0.3051904, -2.992915, -4.263339, 0, 1, 0.2980392, 1,
-0.3051679, -1.420903, -2.726599, 0, 1, 0.3058824, 1,
-0.3017109, -0.2710009, -2.005472, 0, 1, 0.3098039, 1,
-0.2991629, -1.139909, -4.286049, 0, 1, 0.3176471, 1,
-0.2980051, 0.2045953, -0.6765101, 0, 1, 0.3215686, 1,
-0.2973392, -0.4141575, -3.043969, 0, 1, 0.3294118, 1,
-0.2971717, -0.6341866, -3.924288, 0, 1, 0.3333333, 1,
-0.293115, -1.57131, -3.793895, 0, 1, 0.3411765, 1,
-0.2852496, -0.1789028, -3.196376, 0, 1, 0.345098, 1,
-0.2789229, -1.556039, -2.334266, 0, 1, 0.3529412, 1,
-0.2743662, 2.576326, -1.139128, 0, 1, 0.3568628, 1,
-0.2699911, -0.01831099, -2.164557, 0, 1, 0.3647059, 1,
-0.269272, -0.158804, -2.864453, 0, 1, 0.3686275, 1,
-0.2606348, 1.589879, -2.668128, 0, 1, 0.3764706, 1,
-0.2567818, -0.9745466, -2.051483, 0, 1, 0.3803922, 1,
-0.2484103, 0.1553833, -2.031924, 0, 1, 0.3882353, 1,
-0.2481989, 0.1956144, 0.06850018, 0, 1, 0.3921569, 1,
-0.243496, 0.5771102, -0.1348799, 0, 1, 0.4, 1,
-0.243035, -0.9975151, -3.003617, 0, 1, 0.4078431, 1,
-0.2407498, -0.559357, -2.018154, 0, 1, 0.4117647, 1,
-0.2398423, 1.348614, -0.9000694, 0, 1, 0.4196078, 1,
-0.2392636, 1.415731, -0.7462681, 0, 1, 0.4235294, 1,
-0.237141, -0.3356749, -3.628102, 0, 1, 0.4313726, 1,
-0.2358551, 1.196756, 0.6434898, 0, 1, 0.4352941, 1,
-0.2318898, 1.031514, -0.9420884, 0, 1, 0.4431373, 1,
-0.2314662, 0.2080123, -0.6242885, 0, 1, 0.4470588, 1,
-0.2307047, -0.9569833, -3.735151, 0, 1, 0.454902, 1,
-0.2249763, 0.885364, 0.6805624, 0, 1, 0.4588235, 1,
-0.2230527, -1.087071, -3.973744, 0, 1, 0.4666667, 1,
-0.2086345, 1.110156, -0.7228574, 0, 1, 0.4705882, 1,
-0.2006013, -0.8237673, -4.835337, 0, 1, 0.4784314, 1,
-0.1987581, -0.9882091, -0.7710676, 0, 1, 0.4823529, 1,
-0.1951417, -0.6500037, -1.775467, 0, 1, 0.4901961, 1,
-0.1933494, -2.152292, -4.171044, 0, 1, 0.4941176, 1,
-0.1902458, 1.856429, -0.6536176, 0, 1, 0.5019608, 1,
-0.1897366, 0.8433208, -0.2042752, 0, 1, 0.509804, 1,
-0.1880993, -0.9340643, -1.914552, 0, 1, 0.5137255, 1,
-0.1867802, -0.3397578, -2.132795, 0, 1, 0.5215687, 1,
-0.183363, 0.8831002, -0.5071879, 0, 1, 0.5254902, 1,
-0.1791476, -0.7045017, -1.349677, 0, 1, 0.5333334, 1,
-0.1747952, 1.329717, -0.5020783, 0, 1, 0.5372549, 1,
-0.1715676, -0.08272301, -1.582623, 0, 1, 0.5450981, 1,
-0.1683715, -0.9478636, -2.634501, 0, 1, 0.5490196, 1,
-0.1605484, 0.6971177, -0.3071174, 0, 1, 0.5568628, 1,
-0.156308, -0.8021805, -3.960758, 0, 1, 0.5607843, 1,
-0.1558028, -1.988508, -3.937803, 0, 1, 0.5686275, 1,
-0.1538118, -0.9701154, -2.847037, 0, 1, 0.572549, 1,
-0.1522942, 1.400333, 1.239391, 0, 1, 0.5803922, 1,
-0.1483735, 0.2245197, -0.8270784, 0, 1, 0.5843138, 1,
-0.147479, 1.357248, -0.4055541, 0, 1, 0.5921569, 1,
-0.1467802, -0.07787789, -2.068317, 0, 1, 0.5960785, 1,
-0.1436033, 0.1290229, 0.5264508, 0, 1, 0.6039216, 1,
-0.1417293, 0.7952898, 0.5667124, 0, 1, 0.6117647, 1,
-0.1395318, -1.46238, -2.393811, 0, 1, 0.6156863, 1,
-0.1393273, -1.000823, -4.325204, 0, 1, 0.6235294, 1,
-0.1381981, 0.3173178, -1.22047, 0, 1, 0.627451, 1,
-0.1363375, -0.2772159, -0.5868346, 0, 1, 0.6352941, 1,
-0.133204, 0.6742066, 1.184631, 0, 1, 0.6392157, 1,
-0.1315034, -0.3677481, -2.560757, 0, 1, 0.6470588, 1,
-0.1300225, 0.5169795, 0.01071011, 0, 1, 0.6509804, 1,
-0.1253143, -0.715784, -4.541597, 0, 1, 0.6588235, 1,
-0.121755, -1.084758, -3.064717, 0, 1, 0.6627451, 1,
-0.1180155, -0.4154034, -2.875048, 0, 1, 0.6705883, 1,
-0.1174808, -0.4673431, -2.624669, 0, 1, 0.6745098, 1,
-0.1150605, -0.005891757, -1.391335, 0, 1, 0.682353, 1,
-0.1142776, 0.6254363, 0.3050646, 0, 1, 0.6862745, 1,
-0.1112459, 0.1783379, 0.55933, 0, 1, 0.6941177, 1,
-0.1097304, -0.1047856, -2.039138, 0, 1, 0.7019608, 1,
-0.1080125, -0.864861, -2.811461, 0, 1, 0.7058824, 1,
-0.1033199, 0.8067656, -0.6238433, 0, 1, 0.7137255, 1,
-0.101881, 0.9308714, 1.132645, 0, 1, 0.7176471, 1,
-0.1010571, 1.641972, -0.7883839, 0, 1, 0.7254902, 1,
-0.09497772, 0.3338161, -0.9965552, 0, 1, 0.7294118, 1,
-0.09040256, -0.1488357, -3.017519, 0, 1, 0.7372549, 1,
-0.08876093, -1.011533, -1.988816, 0, 1, 0.7411765, 1,
-0.08656424, 0.2614249, 0.8468512, 0, 1, 0.7490196, 1,
-0.08257455, 1.530827, -0.06267099, 0, 1, 0.7529412, 1,
-0.07973853, 0.4229061, -0.4411523, 0, 1, 0.7607843, 1,
-0.07917654, 1.665514, 0.3148193, 0, 1, 0.7647059, 1,
-0.07571154, -1.883919, -4.52387, 0, 1, 0.772549, 1,
-0.07106058, -0.9162426, -3.194768, 0, 1, 0.7764706, 1,
-0.06927237, 0.1509735, -1.578704, 0, 1, 0.7843137, 1,
-0.06923428, -1.956797, -3.146627, 0, 1, 0.7882353, 1,
-0.06906316, 0.1204804, -0.1280833, 0, 1, 0.7960784, 1,
-0.06155017, -0.03545959, -2.048173, 0, 1, 0.8039216, 1,
-0.06028404, 0.7612863, -0.3203625, 0, 1, 0.8078431, 1,
-0.05930671, -1.675652, -2.693355, 0, 1, 0.8156863, 1,
-0.05748446, 0.8280675, -0.634474, 0, 1, 0.8196079, 1,
-0.05685699, 1.178064, -0.2832067, 0, 1, 0.827451, 1,
-0.05309946, 0.1754979, -0.4611895, 0, 1, 0.8313726, 1,
-0.04466445, -1.031566, -4.263567, 0, 1, 0.8392157, 1,
-0.04282841, 0.4021953, 1.013341, 0, 1, 0.8431373, 1,
-0.04080046, -1.716878, -4.005167, 0, 1, 0.8509804, 1,
-0.03882325, -1.367887, -1.846536, 0, 1, 0.854902, 1,
-0.03791453, -0.7864664, -2.686584, 0, 1, 0.8627451, 1,
-0.03790589, -0.6239406, -2.525464, 0, 1, 0.8666667, 1,
-0.0367868, 0.113866, -0.7803254, 0, 1, 0.8745098, 1,
-0.03574163, -2.112852, -3.100964, 0, 1, 0.8784314, 1,
-0.03494284, 0.5185382, 0.4584717, 0, 1, 0.8862745, 1,
-0.02077498, -0.3407057, -3.713173, 0, 1, 0.8901961, 1,
-0.01937625, 1.897372, 0.100141, 0, 1, 0.8980392, 1,
-0.01787324, 0.7778017, -1.108235, 0, 1, 0.9058824, 1,
-0.01447004, 1.255651, 1.60641, 0, 1, 0.9098039, 1,
-0.01436722, 1.431491, -1.335667, 0, 1, 0.9176471, 1,
-0.01136868, -0.4411546, -2.370015, 0, 1, 0.9215686, 1,
-0.008964905, 0.1983527, -1.800283, 0, 1, 0.9294118, 1,
-0.007247326, -0.431671, -3.685983, 0, 1, 0.9333333, 1,
-0.007106537, 0.8754266, 0.05855104, 0, 1, 0.9411765, 1,
-0.004213129, -0.103489, -4.183664, 0, 1, 0.945098, 1,
0.0005617531, -0.47713, 2.563579, 0, 1, 0.9529412, 1,
0.0009238236, 0.7432208, 1.334513, 0, 1, 0.9568627, 1,
0.001936344, -0.9819729, 4.207855, 0, 1, 0.9647059, 1,
0.002454947, -0.4151126, 4.009964, 0, 1, 0.9686275, 1,
0.00459003, -0.2232853, 4.766674, 0, 1, 0.9764706, 1,
0.01974263, 1.307171, -1.307062, 0, 1, 0.9803922, 1,
0.02066089, -0.90197, 2.140999, 0, 1, 0.9882353, 1,
0.02151339, 1.603047, -0.1054775, 0, 1, 0.9921569, 1,
0.02271132, -1.15198, 4.059617, 0, 1, 1, 1,
0.02493099, 2.787762, -0.7922868, 0, 0.9921569, 1, 1,
0.02524178, 1.14854, -0.4347242, 0, 0.9882353, 1, 1,
0.02535812, 1.052913, -0.3140238, 0, 0.9803922, 1, 1,
0.02961955, -0.282025, 2.084992, 0, 0.9764706, 1, 1,
0.03349719, 0.7780657, 1.749367, 0, 0.9686275, 1, 1,
0.03746667, 0.7568153, -1.712002, 0, 0.9647059, 1, 1,
0.03846097, 0.3229362, -0.4402219, 0, 0.9568627, 1, 1,
0.04033614, -0.7323615, 4.026261, 0, 0.9529412, 1, 1,
0.04721452, 1.966553, 1.073865, 0, 0.945098, 1, 1,
0.04892006, -1.66103, 0.9026356, 0, 0.9411765, 1, 1,
0.05478798, 0.3069065, 1.10726, 0, 0.9333333, 1, 1,
0.06353687, -0.4210557, 4.103379, 0, 0.9294118, 1, 1,
0.06711542, 1.128904, 0.426417, 0, 0.9215686, 1, 1,
0.07184317, 0.1744474, -1.289768, 0, 0.9176471, 1, 1,
0.08324993, 0.7403803, 2.540932, 0, 0.9098039, 1, 1,
0.08609243, -0.8425299, 2.969474, 0, 0.9058824, 1, 1,
0.08702748, 0.7623605, 0.6282651, 0, 0.8980392, 1, 1,
0.08889759, -1.004667, 2.517101, 0, 0.8901961, 1, 1,
0.08934031, -0.5553667, 3.63172, 0, 0.8862745, 1, 1,
0.08984189, -0.5457014, 4.128513, 0, 0.8784314, 1, 1,
0.09034234, 0.2939866, 1.207524, 0, 0.8745098, 1, 1,
0.09325447, -1.086446, 4.390038, 0, 0.8666667, 1, 1,
0.09498239, -1.69951, 2.869287, 0, 0.8627451, 1, 1,
0.09597338, 0.1807259, 1.197846, 0, 0.854902, 1, 1,
0.09923431, -0.4181548, 1.776281, 0, 0.8509804, 1, 1,
0.1004268, 2.452785, -1.080627, 0, 0.8431373, 1, 1,
0.1013263, -1.431203, 1.972502, 0, 0.8392157, 1, 1,
0.1021469, -0.1646789, 3.566052, 0, 0.8313726, 1, 1,
0.1031944, 0.8538708, 0.9298564, 0, 0.827451, 1, 1,
0.1052872, 0.6589637, 0.5766803, 0, 0.8196079, 1, 1,
0.1058753, -0.506084, 3.128523, 0, 0.8156863, 1, 1,
0.1062439, 1.338227, -0.5503789, 0, 0.8078431, 1, 1,
0.1074379, -0.4498856, 3.950648, 0, 0.8039216, 1, 1,
0.1092079, 0.8593354, 1.057078, 0, 0.7960784, 1, 1,
0.1119182, -0.4017115, 2.343832, 0, 0.7882353, 1, 1,
0.1129522, 0.6777408, 0.3415481, 0, 0.7843137, 1, 1,
0.11494, -1.006891, 3.275847, 0, 0.7764706, 1, 1,
0.1151798, 0.8537257, 0.5063313, 0, 0.772549, 1, 1,
0.115832, -1.594933, 3.810572, 0, 0.7647059, 1, 1,
0.118198, 0.7065099, 0.847491, 0, 0.7607843, 1, 1,
0.1204139, -0.6049713, 3.366283, 0, 0.7529412, 1, 1,
0.1208971, 1.155456, 2.091622, 0, 0.7490196, 1, 1,
0.1246496, -1.13587, 0.7091665, 0, 0.7411765, 1, 1,
0.1247662, -1.174977, 2.929483, 0, 0.7372549, 1, 1,
0.1260942, -0.07054, 2.282963, 0, 0.7294118, 1, 1,
0.1261321, 1.150457, -1.217296, 0, 0.7254902, 1, 1,
0.1298445, 1.525044, -1.665442, 0, 0.7176471, 1, 1,
0.1318918, -0.08694831, 2.350472, 0, 0.7137255, 1, 1,
0.1345173, 0.2548078, -0.1269746, 0, 0.7058824, 1, 1,
0.1347359, -0.2508823, 1.419271, 0, 0.6980392, 1, 1,
0.1362011, 0.4423505, 0.4662022, 0, 0.6941177, 1, 1,
0.1383483, -0.02479003, 3.657967, 0, 0.6862745, 1, 1,
0.1388556, -0.6463289, 2.903105, 0, 0.682353, 1, 1,
0.1437945, 0.3817063, 1.863895, 0, 0.6745098, 1, 1,
0.1447186, 1.596619, -0.06007835, 0, 0.6705883, 1, 1,
0.1490136, -0.6075613, 1.813852, 0, 0.6627451, 1, 1,
0.1500157, -0.4929714, 3.87993, 0, 0.6588235, 1, 1,
0.1510672, -0.320345, 4.116389, 0, 0.6509804, 1, 1,
0.1516354, -0.4402984, 1.799374, 0, 0.6470588, 1, 1,
0.153616, 0.67673, -0.3200789, 0, 0.6392157, 1, 1,
0.1541962, -0.8705685, 2.715828, 0, 0.6352941, 1, 1,
0.1563095, 0.7934434, -1.754608, 0, 0.627451, 1, 1,
0.1595178, -1.299211, 3.075768, 0, 0.6235294, 1, 1,
0.1597327, 0.5317826, -4.213134e-05, 0, 0.6156863, 1, 1,
0.1652391, -0.1501252, 3.00229, 0, 0.6117647, 1, 1,
0.1669541, -0.1510181, 3.774782, 0, 0.6039216, 1, 1,
0.1705894, -0.3564659, 3.364053, 0, 0.5960785, 1, 1,
0.1709142, -2.503192, 1.281446, 0, 0.5921569, 1, 1,
0.1758223, -0.1044267, 2.573329, 0, 0.5843138, 1, 1,
0.1785293, -0.2335194, 2.613983, 0, 0.5803922, 1, 1,
0.1788571, -0.7120247, 2.829497, 0, 0.572549, 1, 1,
0.180567, 1.409195, 1.849235, 0, 0.5686275, 1, 1,
0.1837591, -1.034966, 1.827608, 0, 0.5607843, 1, 1,
0.1849565, 0.7062253, 0.5918773, 0, 0.5568628, 1, 1,
0.1853097, -1.828451, 2.310741, 0, 0.5490196, 1, 1,
0.1887735, -1.39328, 2.236836, 0, 0.5450981, 1, 1,
0.1901482, 0.7315302, 0.6928245, 0, 0.5372549, 1, 1,
0.1922605, 0.5138826, 0.890575, 0, 0.5333334, 1, 1,
0.1928365, 0.06794024, 1.460091, 0, 0.5254902, 1, 1,
0.2004583, -0.8856766, 1.832426, 0, 0.5215687, 1, 1,
0.2027274, -0.8133958, 3.469438, 0, 0.5137255, 1, 1,
0.2036299, -0.903019, 3.567038, 0, 0.509804, 1, 1,
0.2053678, 0.2436277, 0.6474845, 0, 0.5019608, 1, 1,
0.2067199, -0.6202129, 3.376534, 0, 0.4941176, 1, 1,
0.2135202, -1.777584, 3.572177, 0, 0.4901961, 1, 1,
0.2151545, -0.2636202, 1.97124, 0, 0.4823529, 1, 1,
0.215457, 0.6005839, -0.4218751, 0, 0.4784314, 1, 1,
0.2169489, -0.05296933, 3.181446, 0, 0.4705882, 1, 1,
0.2258306, -1.254212, 2.612588, 0, 0.4666667, 1, 1,
0.2270392, -1.339267, 1.741372, 0, 0.4588235, 1, 1,
0.2310526, -0.4908605, 4.472101, 0, 0.454902, 1, 1,
0.2322674, 0.5355803, -0.2152427, 0, 0.4470588, 1, 1,
0.2386612, -0.1813295, 2.913043, 0, 0.4431373, 1, 1,
0.2508972, 0.748837, 0.1498283, 0, 0.4352941, 1, 1,
0.2541878, 0.1690142, 1.591064, 0, 0.4313726, 1, 1,
0.2566594, -0.8277494, 3.646345, 0, 0.4235294, 1, 1,
0.2572418, 0.5439311, 1.945588, 0, 0.4196078, 1, 1,
0.257853, 0.04536448, 0.8439031, 0, 0.4117647, 1, 1,
0.2620135, 0.3087596, 1.990404, 0, 0.4078431, 1, 1,
0.2673024, 1.999633, 0.3670532, 0, 0.4, 1, 1,
0.2711169, 0.03028893, 1.47236, 0, 0.3921569, 1, 1,
0.2724632, 1.212288, 0.3581795, 0, 0.3882353, 1, 1,
0.272821, -0.9321467, 1.650002, 0, 0.3803922, 1, 1,
0.2747242, -0.05682861, 3.481578, 0, 0.3764706, 1, 1,
0.2755508, -0.5273858, 1.667177, 0, 0.3686275, 1, 1,
0.2828662, -1.122113, 3.986915, 0, 0.3647059, 1, 1,
0.2831609, -0.5962834, 1.080135, 0, 0.3568628, 1, 1,
0.2839801, -0.01786833, 2.667492, 0, 0.3529412, 1, 1,
0.2883539, 0.8630679, -0.005311827, 0, 0.345098, 1, 1,
0.2943455, 0.7733346, 1.800945, 0, 0.3411765, 1, 1,
0.2958871, -0.2434, 2.466058, 0, 0.3333333, 1, 1,
0.2972014, 1.741435, -0.8977453, 0, 0.3294118, 1, 1,
0.2997177, 0.352488, 0.6110183, 0, 0.3215686, 1, 1,
0.3000261, 0.9914399, 1.727166, 0, 0.3176471, 1, 1,
0.3007754, 0.5258639, 1.378636, 0, 0.3098039, 1, 1,
0.3011621, 0.3017778, -0.313913, 0, 0.3058824, 1, 1,
0.3071776, 0.1588948, 0.5152836, 0, 0.2980392, 1, 1,
0.3131468, -0.2795569, 2.475182, 0, 0.2901961, 1, 1,
0.3171333, 0.07655754, 1.140764, 0, 0.2862745, 1, 1,
0.3178503, -0.5159711, 2.418899, 0, 0.2784314, 1, 1,
0.3219019, 0.3589829, 2.308908, 0, 0.2745098, 1, 1,
0.3226154, -0.2980217, 2.009259, 0, 0.2666667, 1, 1,
0.3266692, 0.185378, -0.2057851, 0, 0.2627451, 1, 1,
0.3266923, -0.9999106, 3.234803, 0, 0.254902, 1, 1,
0.3288801, -1.351368, 3.042215, 0, 0.2509804, 1, 1,
0.3328027, 0.1392974, 2.694082, 0, 0.2431373, 1, 1,
0.335071, 0.1939583, 0.8532882, 0, 0.2392157, 1, 1,
0.3374077, -1.53583, 4.894125, 0, 0.2313726, 1, 1,
0.3394291, 0.8202007, -0.4897037, 0, 0.227451, 1, 1,
0.3394496, -0.4870145, 0.4659248, 0, 0.2196078, 1, 1,
0.3396947, -1.028437, 1.129342, 0, 0.2156863, 1, 1,
0.3398413, -0.9202195, 1.711975, 0, 0.2078431, 1, 1,
0.3447732, 0.3344162, -0.5477352, 0, 0.2039216, 1, 1,
0.345722, -0.2470735, 2.725175, 0, 0.1960784, 1, 1,
0.3511487, 1.167806, 1.200444, 0, 0.1882353, 1, 1,
0.3529448, 1.485907, 1.64451, 0, 0.1843137, 1, 1,
0.3585662, -0.08493189, 1.5922, 0, 0.1764706, 1, 1,
0.3648157, 1.166967, 0.9433767, 0, 0.172549, 1, 1,
0.3664802, 1.256953, 1.267191, 0, 0.1647059, 1, 1,
0.3679894, 0.4614788, -2.053599, 0, 0.1607843, 1, 1,
0.3680731, 0.3725145, -0.04302062, 0, 0.1529412, 1, 1,
0.3751583, -0.925357, 2.712283, 0, 0.1490196, 1, 1,
0.378123, -0.4242348, 1.742848, 0, 0.1411765, 1, 1,
0.3799852, -0.5631179, 3.925289, 0, 0.1372549, 1, 1,
0.380044, 0.6626496, 0.9158463, 0, 0.1294118, 1, 1,
0.381603, -0.6868565, 1.908422, 0, 0.1254902, 1, 1,
0.3830903, 0.988013, 2.69446, 0, 0.1176471, 1, 1,
0.3850349, 0.472758, -0.4487978, 0, 0.1137255, 1, 1,
0.387787, 0.1296548, 4.031116, 0, 0.1058824, 1, 1,
0.391984, -0.6741013, 2.849517, 0, 0.09803922, 1, 1,
0.3980702, 0.4192851, 0.1425276, 0, 0.09411765, 1, 1,
0.3983707, 0.8904268, 0.9465482, 0, 0.08627451, 1, 1,
0.3990341, -0.3640967, -0.06405621, 0, 0.08235294, 1, 1,
0.4013052, -0.6959111, 1.342839, 0, 0.07450981, 1, 1,
0.4052055, -1.054922, 4.06537, 0, 0.07058824, 1, 1,
0.4142228, 0.000679542, 2.095275, 0, 0.0627451, 1, 1,
0.4143621, 0.5965765, 1.948698, 0, 0.05882353, 1, 1,
0.4168667, -0.4139068, 3.087157, 0, 0.05098039, 1, 1,
0.419122, 1.431588, 0.1131642, 0, 0.04705882, 1, 1,
0.4237946, 0.3455952, -0.4444208, 0, 0.03921569, 1, 1,
0.4281244, -0.5823601, 1.311505, 0, 0.03529412, 1, 1,
0.4304681, -0.5017116, 2.752078, 0, 0.02745098, 1, 1,
0.4317477, -0.3353803, 0.7862993, 0, 0.02352941, 1, 1,
0.4327251, 0.7042145, -0.3955609, 0, 0.01568628, 1, 1,
0.4379921, 0.6676463, -1.343812, 0, 0.01176471, 1, 1,
0.4408791, 0.04242095, 1.585065, 0, 0.003921569, 1, 1,
0.4448855, -0.4476033, 2.693401, 0.003921569, 0, 1, 1,
0.4482777, -1.035534, 2.640145, 0.007843138, 0, 1, 1,
0.4532465, -0.9705914, 4.771995, 0.01568628, 0, 1, 1,
0.4563452, 1.285048, -2.376557, 0.01960784, 0, 1, 1,
0.4563701, 0.4170268, 0.1672299, 0.02745098, 0, 1, 1,
0.4574171, -0.4541348, 4.160398, 0.03137255, 0, 1, 1,
0.4607378, -0.05474227, 3.106548, 0.03921569, 0, 1, 1,
0.4671755, -1.972674, 2.281586, 0.04313726, 0, 1, 1,
0.4711583, -0.1344527, 1.916058, 0.05098039, 0, 1, 1,
0.4740811, -0.4165289, 1.14643, 0.05490196, 0, 1, 1,
0.4799218, 0.9159272, -1.776819, 0.0627451, 0, 1, 1,
0.4822555, -0.4356399, 3.239512, 0.06666667, 0, 1, 1,
0.4850995, -2.106421, 4.650626, 0.07450981, 0, 1, 1,
0.4855697, -0.7133809, 1.867512, 0.07843138, 0, 1, 1,
0.4955079, 0.2151238, -1.169974, 0.08627451, 0, 1, 1,
0.4957901, 0.2097086, 0.6791784, 0.09019608, 0, 1, 1,
0.4976021, -0.2082597, 0.9565668, 0.09803922, 0, 1, 1,
0.5004585, -1.101221, 2.616391, 0.1058824, 0, 1, 1,
0.5013282, 0.7672268, 1.255467, 0.1098039, 0, 1, 1,
0.5020359, 0.06249752, 1.539632, 0.1176471, 0, 1, 1,
0.504557, 1.96845, 0.09368312, 0.1215686, 0, 1, 1,
0.5060418, -0.4114352, 1.760219, 0.1294118, 0, 1, 1,
0.5062345, -0.2421952, 1.324914, 0.1333333, 0, 1, 1,
0.5096428, -0.9076882, 1.704082, 0.1411765, 0, 1, 1,
0.5148253, 0.9241583, 0.5710564, 0.145098, 0, 1, 1,
0.5178099, -0.1160992, 0.9025055, 0.1529412, 0, 1, 1,
0.5199266, -0.8248983, 2.66829, 0.1568628, 0, 1, 1,
0.5202742, -1.133405, 2.65969, 0.1647059, 0, 1, 1,
0.5208824, -1.06907, 2.846534, 0.1686275, 0, 1, 1,
0.5238335, 1.836133, 0.189907, 0.1764706, 0, 1, 1,
0.5238436, 0.8288119, -1.772271, 0.1803922, 0, 1, 1,
0.5241953, -0.5106347, 3.279408, 0.1882353, 0, 1, 1,
0.5293928, -0.3851903, 3.815058, 0.1921569, 0, 1, 1,
0.5321723, 0.4381928, 1.151821, 0.2, 0, 1, 1,
0.5348989, 0.7227557, 1.441101, 0.2078431, 0, 1, 1,
0.5362011, 0.5465772, 0.3581644, 0.2117647, 0, 1, 1,
0.5400662, 1.06407, 0.3948964, 0.2196078, 0, 1, 1,
0.5428433, -1.38084, 4.156381, 0.2235294, 0, 1, 1,
0.5431672, 0.01895608, 2.568715, 0.2313726, 0, 1, 1,
0.5473701, 2.776283, 1.330542, 0.2352941, 0, 1, 1,
0.5538018, 1.325948, -0.5059733, 0.2431373, 0, 1, 1,
0.5588896, -0.06832575, 2.60114, 0.2470588, 0, 1, 1,
0.561065, -0.5133267, 2.373971, 0.254902, 0, 1, 1,
0.5614423, -0.9181916, 2.8591, 0.2588235, 0, 1, 1,
0.5640821, -0.4055993, 1.46725, 0.2666667, 0, 1, 1,
0.5661253, 1.967597, -0.9282851, 0.2705882, 0, 1, 1,
0.5663621, -1.483178, 3.520298, 0.2784314, 0, 1, 1,
0.5732051, 0.593425, 0.03831058, 0.282353, 0, 1, 1,
0.5742394, -0.4190035, 1.642359, 0.2901961, 0, 1, 1,
0.5745857, -0.8787287, 1.546183, 0.2941177, 0, 1, 1,
0.5794653, 0.687933, -0.977883, 0.3019608, 0, 1, 1,
0.5809421, -0.5366269, 1.77804, 0.3098039, 0, 1, 1,
0.5826199, 2.616924, 0.0191751, 0.3137255, 0, 1, 1,
0.5855333, -0.7944953, 2.950476, 0.3215686, 0, 1, 1,
0.5867425, 2.124031, -0.1725124, 0.3254902, 0, 1, 1,
0.587444, -0.369435, 3.097207, 0.3333333, 0, 1, 1,
0.5894349, -1.421551, 2.763279, 0.3372549, 0, 1, 1,
0.592855, -0.2912634, 0.191993, 0.345098, 0, 1, 1,
0.594045, -0.7253348, 2.728388, 0.3490196, 0, 1, 1,
0.5962642, -0.6684458, 2.88701, 0.3568628, 0, 1, 1,
0.5968062, -0.6148129, 1.835681, 0.3607843, 0, 1, 1,
0.5993922, 0.3702065, 1.475775, 0.3686275, 0, 1, 1,
0.6005715, -1.810008, 2.61276, 0.372549, 0, 1, 1,
0.6020225, -0.8258808, 2.35388, 0.3803922, 0, 1, 1,
0.6031228, 1.499501, 0.3771717, 0.3843137, 0, 1, 1,
0.6043476, -1.13624, 2.319425, 0.3921569, 0, 1, 1,
0.6161906, -0.3956485, 1.66749, 0.3960784, 0, 1, 1,
0.6167782, -1.416605, 3.263832, 0.4039216, 0, 1, 1,
0.6268431, -1.736537, 2.721276, 0.4117647, 0, 1, 1,
0.6296467, -0.6116714, 2.714975, 0.4156863, 0, 1, 1,
0.6310226, -0.07939147, 3.726357, 0.4235294, 0, 1, 1,
0.6329815, -0.6798548, 1.416577, 0.427451, 0, 1, 1,
0.6330736, -1.504468, 2.270291, 0.4352941, 0, 1, 1,
0.6353954, -1.904116, 0.712765, 0.4392157, 0, 1, 1,
0.6421787, 0.32205, -0.1730744, 0.4470588, 0, 1, 1,
0.6430396, 1.195674, 2.636701, 0.4509804, 0, 1, 1,
0.6454061, -0.6614559, 3.091414, 0.4588235, 0, 1, 1,
0.6534637, 0.02656992, 3.066042, 0.4627451, 0, 1, 1,
0.6564196, 0.9951337, -0.06872794, 0.4705882, 0, 1, 1,
0.6657273, -0.3927748, 2.161528, 0.4745098, 0, 1, 1,
0.6726074, 0.2780013, 0.5962166, 0.4823529, 0, 1, 1,
0.6741248, 0.2250063, 1.681829, 0.4862745, 0, 1, 1,
0.6794957, 0.7038162, 0.8805257, 0.4941176, 0, 1, 1,
0.6806341, -1.455765, 3.150032, 0.5019608, 0, 1, 1,
0.6875852, -0.3519243, 1.314984, 0.5058824, 0, 1, 1,
0.6890091, 0.01324328, 3.303361, 0.5137255, 0, 1, 1,
0.6909847, 0.2468807, -0.4322231, 0.5176471, 0, 1, 1,
0.6918853, -1.251814, 1.515011, 0.5254902, 0, 1, 1,
0.6957926, 0.8265902, 1.028979, 0.5294118, 0, 1, 1,
0.7049935, 1.193932, 3.097069, 0.5372549, 0, 1, 1,
0.7131382, 0.1258903, 2.057711, 0.5411765, 0, 1, 1,
0.7153386, -0.1588466, 4.158652, 0.5490196, 0, 1, 1,
0.7163234, -1.992035, 1.53494, 0.5529412, 0, 1, 1,
0.7170933, -0.1234883, 1.78633, 0.5607843, 0, 1, 1,
0.7174991, -1.208843, 3.731519, 0.5647059, 0, 1, 1,
0.718087, -1.836248, 3.30483, 0.572549, 0, 1, 1,
0.7218356, 1.048529, 2.47366, 0.5764706, 0, 1, 1,
0.7219819, 0.3618653, 3.133542, 0.5843138, 0, 1, 1,
0.7231903, -0.005226342, 3.382508, 0.5882353, 0, 1, 1,
0.7234734, -0.4627867, 1.593331, 0.5960785, 0, 1, 1,
0.7239146, 1.017522, 0.391603, 0.6039216, 0, 1, 1,
0.724488, 0.1105163, 3.316635, 0.6078432, 0, 1, 1,
0.7285889, 0.3841586, 1.11661, 0.6156863, 0, 1, 1,
0.7306698, 0.5982153, 2.113911, 0.6196079, 0, 1, 1,
0.734396, 0.2719343, 1.428178, 0.627451, 0, 1, 1,
0.7412888, -1.118934, 1.798207, 0.6313726, 0, 1, 1,
0.7414763, -0.4703689, 4.59483, 0.6392157, 0, 1, 1,
0.7503812, -1.203313, 2.931585, 0.6431373, 0, 1, 1,
0.7530427, 1.177513, 0.5600718, 0.6509804, 0, 1, 1,
0.7535455, 0.2082867, 2.66534, 0.654902, 0, 1, 1,
0.755672, 0.7508365, 0.6521727, 0.6627451, 0, 1, 1,
0.7578866, -0.2201226, 2.540794, 0.6666667, 0, 1, 1,
0.7625719, -1.018694, 1.379634, 0.6745098, 0, 1, 1,
0.7673026, -0.6097507, 1.581996, 0.6784314, 0, 1, 1,
0.7731797, -1.001585, 1.009855, 0.6862745, 0, 1, 1,
0.7769674, 0.9324262, 1.512678, 0.6901961, 0, 1, 1,
0.7799662, 0.1505029, 2.272057, 0.6980392, 0, 1, 1,
0.7807427, -0.3736679, 0.7963316, 0.7058824, 0, 1, 1,
0.787792, 1.482873, 0.3797494, 0.7098039, 0, 1, 1,
0.790006, -0.2650696, 2.758341, 0.7176471, 0, 1, 1,
0.7926427, -0.07310788, -0.5490182, 0.7215686, 0, 1, 1,
0.7934064, -1.856811, 1.158738, 0.7294118, 0, 1, 1,
0.797286, -1.250506, 3.032897, 0.7333333, 0, 1, 1,
0.7973859, 0.2562959, 0.7133774, 0.7411765, 0, 1, 1,
0.7993601, 0.07703709, 0.01303564, 0.7450981, 0, 1, 1,
0.8051007, -0.600148, 1.647305, 0.7529412, 0, 1, 1,
0.8055804, 0.09936478, 3.404543, 0.7568628, 0, 1, 1,
0.8060318, -0.3675849, 2.462039, 0.7647059, 0, 1, 1,
0.811741, 0.02737344, 2.761925, 0.7686275, 0, 1, 1,
0.8156325, 1.525701, 0.4482417, 0.7764706, 0, 1, 1,
0.8156823, 0.4816262, 1.839525, 0.7803922, 0, 1, 1,
0.8164488, -0.578172, 0.5837393, 0.7882353, 0, 1, 1,
0.8203245, 0.4139383, 0.8858538, 0.7921569, 0, 1, 1,
0.8333435, -0.05176481, 0.06108834, 0.8, 0, 1, 1,
0.8340552, -0.2777786, 0.1281981, 0.8078431, 0, 1, 1,
0.835465, 0.7389609, 1.418458, 0.8117647, 0, 1, 1,
0.8410821, -2.026743, 2.908462, 0.8196079, 0, 1, 1,
0.8452052, 0.3704044, 1.927829, 0.8235294, 0, 1, 1,
0.8455072, -0.1925382, 2.568177, 0.8313726, 0, 1, 1,
0.8482603, -0.8809211, 1.699273, 0.8352941, 0, 1, 1,
0.8515184, 0.5063825, 1.134789, 0.8431373, 0, 1, 1,
0.8542836, 1.985025, -0.2727554, 0.8470588, 0, 1, 1,
0.858414, -0.7979876, 1.203522, 0.854902, 0, 1, 1,
0.8677442, -0.8351682, 1.311292, 0.8588235, 0, 1, 1,
0.8691239, -0.02318257, 2.471438, 0.8666667, 0, 1, 1,
0.8694535, 0.1048307, 2.92818, 0.8705882, 0, 1, 1,
0.8715044, -0.02759954, 2.725043, 0.8784314, 0, 1, 1,
0.8719475, 0.2809119, 0.7219954, 0.8823529, 0, 1, 1,
0.8769144, 0.8433852, 1.439839, 0.8901961, 0, 1, 1,
0.8773206, -0.5649635, 1.840649, 0.8941177, 0, 1, 1,
0.8881872, -0.05730831, 1.769825, 0.9019608, 0, 1, 1,
0.8949283, -0.9562464, 1.29426, 0.9098039, 0, 1, 1,
0.8961617, -0.3719555, 0.1527853, 0.9137255, 0, 1, 1,
0.8973383, -1.116966, 0.6013244, 0.9215686, 0, 1, 1,
0.8999965, -0.4484806, 1.126962, 0.9254902, 0, 1, 1,
0.902054, -1.794336, 2.795643, 0.9333333, 0, 1, 1,
0.9025161, 0.4846087, 1.104184, 0.9372549, 0, 1, 1,
0.9054031, -0.9623059, 0.6567404, 0.945098, 0, 1, 1,
0.9057572, 0.05775367, 0.8671499, 0.9490196, 0, 1, 1,
0.9069893, 0.5745484, 0.3488717, 0.9568627, 0, 1, 1,
0.9074158, -1.733104, 4.593733, 0.9607843, 0, 1, 1,
0.9164095, -0.4146639, 2.586903, 0.9686275, 0, 1, 1,
0.922619, -0.2344748, 2.333579, 0.972549, 0, 1, 1,
0.9262636, -0.5880627, 1.148246, 0.9803922, 0, 1, 1,
0.9313291, 0.7318437, -0.4904502, 0.9843137, 0, 1, 1,
0.9315568, -0.5487435, 2.728948, 0.9921569, 0, 1, 1,
0.9433789, -0.6177538, 2.90046, 0.9960784, 0, 1, 1,
0.9513005, -0.2315638, 2.00017, 1, 0, 0.9960784, 1,
0.951537, 0.6521838, 2.648563, 1, 0, 0.9882353, 1,
0.9557763, -1.316691, 2.293507, 1, 0, 0.9843137, 1,
0.9608546, -0.237576, 3.107441, 1, 0, 0.9764706, 1,
0.9609448, 1.132307, 0.5077972, 1, 0, 0.972549, 1,
0.9624407, -1.155926, 2.031564, 1, 0, 0.9647059, 1,
0.9643329, -0.9285172, 4.215035, 1, 0, 0.9607843, 1,
0.9670499, -0.8233923, 2.830828, 1, 0, 0.9529412, 1,
0.9674456, 0.3856261, 0.5043421, 1, 0, 0.9490196, 1,
0.9677904, 0.4543179, 1.400421, 1, 0, 0.9411765, 1,
0.9722988, -0.4327787, 2.337075, 1, 0, 0.9372549, 1,
0.9864818, 0.1872979, 0.6969317, 1, 0, 0.9294118, 1,
0.9911798, 0.1530506, 1.152325, 1, 0, 0.9254902, 1,
0.9952205, -2.600883, 2.04319, 1, 0, 0.9176471, 1,
0.9973269, -0.6960935, 1.306861, 1, 0, 0.9137255, 1,
0.9995293, 0.5241225, 0.1923376, 1, 0, 0.9058824, 1,
1.000868, 0.3167154, 0.5206382, 1, 0, 0.9019608, 1,
1.002509, 2.145187, 0.2829123, 1, 0, 0.8941177, 1,
1.016126, -0.8672192, 1.413912, 1, 0, 0.8862745, 1,
1.020673, 0.5885304, 2.069135, 1, 0, 0.8823529, 1,
1.021818, 1.105832, 0.2016802, 1, 0, 0.8745098, 1,
1.029403, -1.905858, 3.763044, 1, 0, 0.8705882, 1,
1.030357, -1.857565, 1.32959, 1, 0, 0.8627451, 1,
1.039482, -0.048172, -0.2163058, 1, 0, 0.8588235, 1,
1.056161, -0.687705, 1.552068, 1, 0, 0.8509804, 1,
1.05873, -0.8785897, 4.382612, 1, 0, 0.8470588, 1,
1.062608, -1.530419, 2.006113, 1, 0, 0.8392157, 1,
1.074886, 0.8150491, 0.5092704, 1, 0, 0.8352941, 1,
1.081896, 0.6661261, 2.043859, 1, 0, 0.827451, 1,
1.085813, 0.7152408, 0.9795272, 1, 0, 0.8235294, 1,
1.086709, -0.1230496, 0.4087794, 1, 0, 0.8156863, 1,
1.110518, -0.378533, 0.8375401, 1, 0, 0.8117647, 1,
1.112035, -0.6518399, 2.957026, 1, 0, 0.8039216, 1,
1.117989, 0.8017583, 1.847157, 1, 0, 0.7960784, 1,
1.118426, 1.315673, 1.469652, 1, 0, 0.7921569, 1,
1.133828, -1.73043, 4.068767, 1, 0, 0.7843137, 1,
1.155782, 0.6833404, 0.5838717, 1, 0, 0.7803922, 1,
1.162959, -0.6044096, 2.790873, 1, 0, 0.772549, 1,
1.172632, -1.12948, 2.370987, 1, 0, 0.7686275, 1,
1.181321, -0.656713, 1.986839, 1, 0, 0.7607843, 1,
1.188376, -0.02127816, 2.504009, 1, 0, 0.7568628, 1,
1.202636, -0.09038103, 1.284745, 1, 0, 0.7490196, 1,
1.204543, -1.377159, 2.267521, 1, 0, 0.7450981, 1,
1.20591, 0.3609022, 2.431352, 1, 0, 0.7372549, 1,
1.209326, 0.2738278, 1.800306, 1, 0, 0.7333333, 1,
1.223556, -0.2136932, 2.694217, 1, 0, 0.7254902, 1,
1.224825, 0.251466, 2.343996, 1, 0, 0.7215686, 1,
1.233459, 0.6681311, 0.1788994, 1, 0, 0.7137255, 1,
1.237212, 0.1471736, 2.372768, 1, 0, 0.7098039, 1,
1.238043, 0.9541377, 1.079023, 1, 0, 0.7019608, 1,
1.247629, -0.3618584, 1.40508, 1, 0, 0.6941177, 1,
1.247704, 2.596894, 0.08547527, 1, 0, 0.6901961, 1,
1.257421, -0.3533813, 4.264862, 1, 0, 0.682353, 1,
1.275937, -0.5635825, 0.08835972, 1, 0, 0.6784314, 1,
1.283696, -0.1030341, 1.102029, 1, 0, 0.6705883, 1,
1.287963, -0.5078354, -0.189945, 1, 0, 0.6666667, 1,
1.288128, -0.8760884, 2.64681, 1, 0, 0.6588235, 1,
1.290376, 0.4911598, 2.854265, 1, 0, 0.654902, 1,
1.305489, -1.115748, 1.608203, 1, 0, 0.6470588, 1,
1.320063, -1.463098, 2.077507, 1, 0, 0.6431373, 1,
1.323239, -0.01160455, 1.717081, 1, 0, 0.6352941, 1,
1.324399, 0.2699678, 3.218066, 1, 0, 0.6313726, 1,
1.326633, 0.3498977, 0.6916295, 1, 0, 0.6235294, 1,
1.328172, 0.1210217, -0.2810032, 1, 0, 0.6196079, 1,
1.328243, 1.145109, -0.08889332, 1, 0, 0.6117647, 1,
1.328658, 2.44924, 0.3077542, 1, 0, 0.6078432, 1,
1.330085, -1.141176, 1.380657, 1, 0, 0.6, 1,
1.332838, 0.1648269, 2.52406, 1, 0, 0.5921569, 1,
1.339442, -0.9956565, 2.279037, 1, 0, 0.5882353, 1,
1.343158, 0.2282002, -0.2184449, 1, 0, 0.5803922, 1,
1.353453, 0.2313773, 2.338779, 1, 0, 0.5764706, 1,
1.359169, -1.033688, 1.857939, 1, 0, 0.5686275, 1,
1.362926, -0.04794613, 2.541778, 1, 0, 0.5647059, 1,
1.37228, -0.420729, 1.56095, 1, 0, 0.5568628, 1,
1.37368, 0.008092398, 1.758896, 1, 0, 0.5529412, 1,
1.374727, -0.8115676, 2.447463, 1, 0, 0.5450981, 1,
1.378341, 1.326546, 1.046564, 1, 0, 0.5411765, 1,
1.396227, -0.4866884, 2.078068, 1, 0, 0.5333334, 1,
1.396562, 1.399665, 0.4067523, 1, 0, 0.5294118, 1,
1.400659, -1.063571, 2.206694, 1, 0, 0.5215687, 1,
1.411424, 0.6342517, 0.07163958, 1, 0, 0.5176471, 1,
1.419374, -0.9428272, 2.571575, 1, 0, 0.509804, 1,
1.419379, -0.1128581, 0.02193532, 1, 0, 0.5058824, 1,
1.424901, -1.653142, 2.823774, 1, 0, 0.4980392, 1,
1.427934, 0.1530201, 1.01213, 1, 0, 0.4901961, 1,
1.428872, -0.09508553, 1.067904, 1, 0, 0.4862745, 1,
1.435146, 1.009834, 2.026733, 1, 0, 0.4784314, 1,
1.436699, -2.129438, 1.398093, 1, 0, 0.4745098, 1,
1.441538, 0.3064559, 1.951437, 1, 0, 0.4666667, 1,
1.441677, 0.4150166, 0.2881564, 1, 0, 0.4627451, 1,
1.442765, 1.378813, -0.4833494, 1, 0, 0.454902, 1,
1.44697, 0.3284516, 0.3795857, 1, 0, 0.4509804, 1,
1.447832, 1.122887, 1.127846, 1, 0, 0.4431373, 1,
1.450251, 0.4365618, 3.51159, 1, 0, 0.4392157, 1,
1.455661, 0.2867968, 1.403942, 1, 0, 0.4313726, 1,
1.46972, 1.053842, 1.273602, 1, 0, 0.427451, 1,
1.474561, -1.793929, 2.353305, 1, 0, 0.4196078, 1,
1.476781, -0.2692863, 3.031426, 1, 0, 0.4156863, 1,
1.477939, 0.4271685, -0.706639, 1, 0, 0.4078431, 1,
1.50013, 0.9807698, 3.020272, 1, 0, 0.4039216, 1,
1.502112, 0.2004229, 1.264412, 1, 0, 0.3960784, 1,
1.508855, 0.2032763, 0.8149056, 1, 0, 0.3882353, 1,
1.509701, -0.00637972, 2.240071, 1, 0, 0.3843137, 1,
1.510767, 1.289243, 2.541102, 1, 0, 0.3764706, 1,
1.511001, 1.682123, 2.156165, 1, 0, 0.372549, 1,
1.516323, 0.3938169, 0.3149257, 1, 0, 0.3647059, 1,
1.519765, 1.16142, -0.02049384, 1, 0, 0.3607843, 1,
1.521993, -0.9739082, 2.613939, 1, 0, 0.3529412, 1,
1.531006, -0.2381019, 1.159276, 1, 0, 0.3490196, 1,
1.536076, 0.7683784, 2.820407, 1, 0, 0.3411765, 1,
1.540231, -0.3697384, -0.1475955, 1, 0, 0.3372549, 1,
1.5403, -0.8118988, 1.974304, 1, 0, 0.3294118, 1,
1.559329, -0.4767319, 2.869914, 1, 0, 0.3254902, 1,
1.567454, 0.01085535, 1.667214, 1, 0, 0.3176471, 1,
1.57077, 1.30079, 0.5481714, 1, 0, 0.3137255, 1,
1.581993, -0.5105244, 2.634977, 1, 0, 0.3058824, 1,
1.592322, 0.3009403, 2.01177, 1, 0, 0.2980392, 1,
1.620246, 0.501966, 1.329344, 1, 0, 0.2941177, 1,
1.627177, -1.342169, 0.9172051, 1, 0, 0.2862745, 1,
1.635457, -0.06934512, 2.392126, 1, 0, 0.282353, 1,
1.66472, -0.1457033, 1.469145, 1, 0, 0.2745098, 1,
1.669746, -0.6058946, 1.318136, 1, 0, 0.2705882, 1,
1.693477, 0.4422762, 0.5549886, 1, 0, 0.2627451, 1,
1.705045, 0.5555489, 1.22627, 1, 0, 0.2588235, 1,
1.748519, 0.3769558, 0.140186, 1, 0, 0.2509804, 1,
1.758192, 1.136528, 1.117384, 1, 0, 0.2470588, 1,
1.764087, -0.2835023, 3.344834, 1, 0, 0.2392157, 1,
1.784696, 1.018501, 2.239369, 1, 0, 0.2352941, 1,
1.794449, 0.8627123, -0.04088528, 1, 0, 0.227451, 1,
1.802371, 0.9848927, -0.2324309, 1, 0, 0.2235294, 1,
1.806268, 0.2589189, 1.82629, 1, 0, 0.2156863, 1,
1.830515, 0.4635696, 1.475008, 1, 0, 0.2117647, 1,
1.834364, -0.6353337, 3.927703, 1, 0, 0.2039216, 1,
1.85969, 0.5752776, 0.8809308, 1, 0, 0.1960784, 1,
1.864184, 0.8458408, 1.231247, 1, 0, 0.1921569, 1,
1.865447, -0.3676512, 2.177142, 1, 0, 0.1843137, 1,
1.909098, 1.085572, 1.762457, 1, 0, 0.1803922, 1,
1.945746, -0.338935, 1.894812, 1, 0, 0.172549, 1,
1.953856, -1.094688, 1.766511, 1, 0, 0.1686275, 1,
1.980666, -0.4550143, -0.2686209, 1, 0, 0.1607843, 1,
1.998289, 0.09524914, 1.144685, 1, 0, 0.1568628, 1,
2.008425, -0.732379, 0.1348203, 1, 0, 0.1490196, 1,
2.042771, 1.292484, 3.711274, 1, 0, 0.145098, 1,
2.071324, -0.7702562, 1.475514, 1, 0, 0.1372549, 1,
2.096274, -0.1995296, 2.373896, 1, 0, 0.1333333, 1,
2.096869, 0.7091132, 0.5010207, 1, 0, 0.1254902, 1,
2.105561, -0.2793996, 2.050611, 1, 0, 0.1215686, 1,
2.16687, 0.03774202, 2.188326, 1, 0, 0.1137255, 1,
2.205714, -0.03202156, 2.335855, 1, 0, 0.1098039, 1,
2.232623, 0.1961915, 2.589111, 1, 0, 0.1019608, 1,
2.235603, 0.5429612, -1.011274, 1, 0, 0.09411765, 1,
2.253503, 1.508044, 0.7654358, 1, 0, 0.09019608, 1,
2.263321, -1.433824, 1.249606, 1, 0, 0.08235294, 1,
2.285617, -0.6198164, 1.52835, 1, 0, 0.07843138, 1,
2.329017, -0.04893369, 0.5273553, 1, 0, 0.07058824, 1,
2.333679, 0.01436861, 0.6470188, 1, 0, 0.06666667, 1,
2.342206, 0.4532897, 0.8914887, 1, 0, 0.05882353, 1,
2.361082, 0.2834818, 1.193733, 1, 0, 0.05490196, 1,
2.419322, 0.6733239, 1.574458, 1, 0, 0.04705882, 1,
2.545842, 0.9364474, 3.317607, 1, 0, 0.04313726, 1,
2.649184, -0.4165043, 1.117411, 1, 0, 0.03529412, 1,
2.651078, 1.143499, 0.7270662, 1, 0, 0.03137255, 1,
3.023346, 0.6536385, 0.4375415, 1, 0, 0.02352941, 1,
3.155415, 0.8010566, -0.7859957, 1, 0, 0.01960784, 1,
3.325548, 0.04517223, 1.590585, 1, 0, 0.01176471, 1,
3.642481, 0.2513921, 2.556719, 1, 0, 0.007843138, 1
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
-0.1673509, -4.778419, -6.758135, 0, -0.5, 0.5, 0.5,
-0.1673509, -4.778419, -6.758135, 1, -0.5, 0.5, 0.5,
-0.1673509, -4.778419, -6.758135, 1, 1.5, 0.5, 0.5,
-0.1673509, -4.778419, -6.758135, 0, 1.5, 0.5, 0.5
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
-5.268715, -0.3203043, -6.758135, 0, -0.5, 0.5, 0.5,
-5.268715, -0.3203043, -6.758135, 1, -0.5, 0.5, 0.5,
-5.268715, -0.3203043, -6.758135, 1, 1.5, 0.5, 0.5,
-5.268715, -0.3203043, -6.758135, 0, 1.5, 0.5, 0.5
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
-5.268715, -4.778419, -0.08760262, 0, -0.5, 0.5, 0.5,
-5.268715, -4.778419, -0.08760262, 1, -0.5, 0.5, 0.5,
-5.268715, -4.778419, -0.08760262, 1, 1.5, 0.5, 0.5,
-5.268715, -4.778419, -0.08760262, 0, 1.5, 0.5, 0.5
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
-2, -3.749623, -5.218781,
2, -3.749623, -5.218781,
-2, -3.749623, -5.218781,
-2, -3.921089, -5.47534,
0, -3.749623, -5.218781,
0, -3.921089, -5.47534,
2, -3.749623, -5.218781,
2, -3.921089, -5.47534
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
-2, -4.26402, -5.988458, 0, -0.5, 0.5, 0.5,
-2, -4.26402, -5.988458, 1, -0.5, 0.5, 0.5,
-2, -4.26402, -5.988458, 1, 1.5, 0.5, 0.5,
-2, -4.26402, -5.988458, 0, 1.5, 0.5, 0.5,
0, -4.26402, -5.988458, 0, -0.5, 0.5, 0.5,
0, -4.26402, -5.988458, 1, -0.5, 0.5, 0.5,
0, -4.26402, -5.988458, 1, 1.5, 0.5, 0.5,
0, -4.26402, -5.988458, 0, 1.5, 0.5, 0.5,
2, -4.26402, -5.988458, 0, -0.5, 0.5, 0.5,
2, -4.26402, -5.988458, 1, -0.5, 0.5, 0.5,
2, -4.26402, -5.988458, 1, 1.5, 0.5, 0.5,
2, -4.26402, -5.988458, 0, 1.5, 0.5, 0.5
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
-4.091477, -3, -5.218781,
-4.091477, 3, -5.218781,
-4.091477, -3, -5.218781,
-4.287684, -3, -5.47534,
-4.091477, -2, -5.218781,
-4.287684, -2, -5.47534,
-4.091477, -1, -5.218781,
-4.287684, -1, -5.47534,
-4.091477, 0, -5.218781,
-4.287684, 0, -5.47534,
-4.091477, 1, -5.218781,
-4.287684, 1, -5.47534,
-4.091477, 2, -5.218781,
-4.287684, 2, -5.47534,
-4.091477, 3, -5.218781,
-4.287684, 3, -5.47534
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
-4.680097, -3, -5.988458, 0, -0.5, 0.5, 0.5,
-4.680097, -3, -5.988458, 1, -0.5, 0.5, 0.5,
-4.680097, -3, -5.988458, 1, 1.5, 0.5, 0.5,
-4.680097, -3, -5.988458, 0, 1.5, 0.5, 0.5,
-4.680097, -2, -5.988458, 0, -0.5, 0.5, 0.5,
-4.680097, -2, -5.988458, 1, -0.5, 0.5, 0.5,
-4.680097, -2, -5.988458, 1, 1.5, 0.5, 0.5,
-4.680097, -2, -5.988458, 0, 1.5, 0.5, 0.5,
-4.680097, -1, -5.988458, 0, -0.5, 0.5, 0.5,
-4.680097, -1, -5.988458, 1, -0.5, 0.5, 0.5,
-4.680097, -1, -5.988458, 1, 1.5, 0.5, 0.5,
-4.680097, -1, -5.988458, 0, 1.5, 0.5, 0.5,
-4.680097, 0, -5.988458, 0, -0.5, 0.5, 0.5,
-4.680097, 0, -5.988458, 1, -0.5, 0.5, 0.5,
-4.680097, 0, -5.988458, 1, 1.5, 0.5, 0.5,
-4.680097, 0, -5.988458, 0, 1.5, 0.5, 0.5,
-4.680097, 1, -5.988458, 0, -0.5, 0.5, 0.5,
-4.680097, 1, -5.988458, 1, -0.5, 0.5, 0.5,
-4.680097, 1, -5.988458, 1, 1.5, 0.5, 0.5,
-4.680097, 1, -5.988458, 0, 1.5, 0.5, 0.5,
-4.680097, 2, -5.988458, 0, -0.5, 0.5, 0.5,
-4.680097, 2, -5.988458, 1, -0.5, 0.5, 0.5,
-4.680097, 2, -5.988458, 1, 1.5, 0.5, 0.5,
-4.680097, 2, -5.988458, 0, 1.5, 0.5, 0.5,
-4.680097, 3, -5.988458, 0, -0.5, 0.5, 0.5,
-4.680097, 3, -5.988458, 1, -0.5, 0.5, 0.5,
-4.680097, 3, -5.988458, 1, 1.5, 0.5, 0.5,
-4.680097, 3, -5.988458, 0, 1.5, 0.5, 0.5
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
-4.091477, -3.749623, -4,
-4.091477, -3.749623, 4,
-4.091477, -3.749623, -4,
-4.287684, -3.921089, -4,
-4.091477, -3.749623, -2,
-4.287684, -3.921089, -2,
-4.091477, -3.749623, 0,
-4.287684, -3.921089, 0,
-4.091477, -3.749623, 2,
-4.287684, -3.921089, 2,
-4.091477, -3.749623, 4,
-4.287684, -3.921089, 4
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
-4.680097, -4.26402, -4, 0, -0.5, 0.5, 0.5,
-4.680097, -4.26402, -4, 1, -0.5, 0.5, 0.5,
-4.680097, -4.26402, -4, 1, 1.5, 0.5, 0.5,
-4.680097, -4.26402, -4, 0, 1.5, 0.5, 0.5,
-4.680097, -4.26402, -2, 0, -0.5, 0.5, 0.5,
-4.680097, -4.26402, -2, 1, -0.5, 0.5, 0.5,
-4.680097, -4.26402, -2, 1, 1.5, 0.5, 0.5,
-4.680097, -4.26402, -2, 0, 1.5, 0.5, 0.5,
-4.680097, -4.26402, 0, 0, -0.5, 0.5, 0.5,
-4.680097, -4.26402, 0, 1, -0.5, 0.5, 0.5,
-4.680097, -4.26402, 0, 1, 1.5, 0.5, 0.5,
-4.680097, -4.26402, 0, 0, 1.5, 0.5, 0.5,
-4.680097, -4.26402, 2, 0, -0.5, 0.5, 0.5,
-4.680097, -4.26402, 2, 1, -0.5, 0.5, 0.5,
-4.680097, -4.26402, 2, 1, 1.5, 0.5, 0.5,
-4.680097, -4.26402, 2, 0, 1.5, 0.5, 0.5,
-4.680097, -4.26402, 4, 0, -0.5, 0.5, 0.5,
-4.680097, -4.26402, 4, 1, -0.5, 0.5, 0.5,
-4.680097, -4.26402, 4, 1, 1.5, 0.5, 0.5,
-4.680097, -4.26402, 4, 0, 1.5, 0.5, 0.5
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
-4.091477, -3.749623, -5.218781,
-4.091477, 3.109014, -5.218781,
-4.091477, -3.749623, 5.043576,
-4.091477, 3.109014, 5.043576,
-4.091477, -3.749623, -5.218781,
-4.091477, -3.749623, 5.043576,
-4.091477, 3.109014, -5.218781,
-4.091477, 3.109014, 5.043576,
-4.091477, -3.749623, -5.218781,
3.756776, -3.749623, -5.218781,
-4.091477, -3.749623, 5.043576,
3.756776, -3.749623, 5.043576,
-4.091477, 3.109014, -5.218781,
3.756776, 3.109014, -5.218781,
-4.091477, 3.109014, 5.043576,
3.756776, 3.109014, 5.043576,
3.756776, -3.749623, -5.218781,
3.756776, 3.109014, -5.218781,
3.756776, -3.749623, 5.043576,
3.756776, 3.109014, 5.043576,
3.756776, -3.749623, -5.218781,
3.756776, -3.749623, 5.043576,
3.756776, 3.109014, -5.218781,
3.756776, 3.109014, 5.043576
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
var radius = 7.810586;
var distance = 34.75018;
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
mvMatrix.translate( 0.1673509, 0.3203043, 0.08760262 );
mvMatrix.scale( 1.07603, 1.231288, 0.8229063 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.75018);
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
S-Ethyl_diisobutylth<-read.table("S-Ethyl_diisobutylth.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-S-Ethyl_diisobutylth$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-Ethyl_diisobutylth$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-Ethyl_diisobutylth$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-3.977183, 1.832257, -1.029186, 0, 0, 1, 1, 1,
-2.967863, 0.854553, -0.4491453, 1, 0, 0, 1, 1,
-2.718004, -0.670393, -0.62677, 1, 0, 0, 1, 1,
-2.715459, -0.3917595, -2.366763, 1, 0, 0, 1, 1,
-2.700351, -0.2862902, -2.461351, 1, 0, 0, 1, 1,
-2.698136, 1.291212, -2.170936, 1, 0, 0, 1, 1,
-2.681988, 1.333857, 0.1541145, 0, 0, 0, 1, 1,
-2.570527, -0.7855544, -1.671489, 0, 0, 0, 1, 1,
-2.568588, 0.5095356, -2.14693, 0, 0, 0, 1, 1,
-2.495577, 0.6461294, -1.54158, 0, 0, 0, 1, 1,
-2.465577, 1.094822, -0.4687929, 0, 0, 0, 1, 1,
-2.450187, 0.4310848, -2.102704, 0, 0, 0, 1, 1,
-2.447202, 0.5633685, -0.3384771, 0, 0, 0, 1, 1,
-2.396842, 1.31592, -1.263273, 1, 1, 1, 1, 1,
-2.385983, -1.19504, -2.864966, 1, 1, 1, 1, 1,
-2.324782, -1.837452, -2.185512, 1, 1, 1, 1, 1,
-2.321132, -1.264495, -1.018097, 1, 1, 1, 1, 1,
-2.30478, 1.063934, -0.2157959, 1, 1, 1, 1, 1,
-2.261995, -0.4285575, -1.66285, 1, 1, 1, 1, 1,
-2.255183, 0.6364474, -1.188227, 1, 1, 1, 1, 1,
-2.211717, 1.484715, -1.368854, 1, 1, 1, 1, 1,
-2.161552, 1.191599, -1.357927, 1, 1, 1, 1, 1,
-2.149825, 0.117933, -2.845479, 1, 1, 1, 1, 1,
-2.131904, -0.5624819, -0.09612942, 1, 1, 1, 1, 1,
-2.081152, 0.8866319, -0.03372563, 1, 1, 1, 1, 1,
-2.072339, -1.117585, -1.131383, 1, 1, 1, 1, 1,
-2.070635, -0.3303023, -0.1594001, 1, 1, 1, 1, 1,
-2.042998, -0.5243278, -3.933824, 1, 1, 1, 1, 1,
-2.038255, 0.1263409, -0.8767847, 0, 0, 1, 1, 1,
-2.033473, -1.256659, -1.322844, 1, 0, 0, 1, 1,
-2.03347, -0.09383485, -2.306395, 1, 0, 0, 1, 1,
-2.024862, 0.01412056, -3.79056, 1, 0, 0, 1, 1,
-2.024823, 1.734086, -2.199377, 1, 0, 0, 1, 1,
-2.005342, 0.4199345, -2.359103, 1, 0, 0, 1, 1,
-1.97075, -0.6430921, -1.127245, 0, 0, 0, 1, 1,
-1.968578, 2.099033, -0.6446201, 0, 0, 0, 1, 1,
-1.957087, 0.6769827, -1.748411, 0, 0, 0, 1, 1,
-1.909129, 0.06834888, -1.244438, 0, 0, 0, 1, 1,
-1.903509, 0.3117484, -1.7019, 0, 0, 0, 1, 1,
-1.883851, 1.331983, -0.146285, 0, 0, 0, 1, 1,
-1.872951, 1.21523, -1.599007, 0, 0, 0, 1, 1,
-1.863047, 0.6855244, -0.3348591, 1, 1, 1, 1, 1,
-1.845749, -1.209645, -0.9206001, 1, 1, 1, 1, 1,
-1.829458, -0.04295322, -1.685892, 1, 1, 1, 1, 1,
-1.809752, 0.2016363, -2.269965, 1, 1, 1, 1, 1,
-1.809172, 0.9317928, -1.381249, 1, 1, 1, 1, 1,
-1.800425, 1.008179, -0.4384428, 1, 1, 1, 1, 1,
-1.799439, 0.03630381, -3.61748, 1, 1, 1, 1, 1,
-1.792093, -0.5807265, -1.368167, 1, 1, 1, 1, 1,
-1.790793, -0.6170968, -1.942146, 1, 1, 1, 1, 1,
-1.77894, 0.2611461, -0.1499495, 1, 1, 1, 1, 1,
-1.777446, -0.4606924, -2.519752, 1, 1, 1, 1, 1,
-1.766576, -0.3449896, -1.993106, 1, 1, 1, 1, 1,
-1.76386, -0.7896026, -2.43211, 1, 1, 1, 1, 1,
-1.742244, 0.9635359, -2.467494, 1, 1, 1, 1, 1,
-1.736679, -1.151594, -2.017633, 1, 1, 1, 1, 1,
-1.731517, 0.4027801, -2.231466, 0, 0, 1, 1, 1,
-1.71958, 1.049342, -2.383072, 1, 0, 0, 1, 1,
-1.717678, -0.8687623, 0.01894473, 1, 0, 0, 1, 1,
-1.716018, -0.1447195, -0.7647645, 1, 0, 0, 1, 1,
-1.706248, -0.3983474, -1.465585, 1, 0, 0, 1, 1,
-1.690247, -0.5233264, -1.133885, 1, 0, 0, 1, 1,
-1.684375, 1.587236, -0.4504671, 0, 0, 0, 1, 1,
-1.676729, -0.2445112, -0.7390393, 0, 0, 0, 1, 1,
-1.676521, -0.7605171, -0.9355501, 0, 0, 0, 1, 1,
-1.670538, -0.720748, -1.58328, 0, 0, 0, 1, 1,
-1.661044, -0.6565907, -1.280172, 0, 0, 0, 1, 1,
-1.64271, 0.4626924, -1.292715, 0, 0, 0, 1, 1,
-1.64174, 0.8850728, -1.307501, 0, 0, 0, 1, 1,
-1.618876, 0.4182183, -0.9493786, 1, 1, 1, 1, 1,
-1.615395, 0.6461593, -1.997154, 1, 1, 1, 1, 1,
-1.613738, 0.3636165, 0.07981316, 1, 1, 1, 1, 1,
-1.60324, 0.9242204, -0.9253206, 1, 1, 1, 1, 1,
-1.60103, 1.475626, -0.7325048, 1, 1, 1, 1, 1,
-1.588167, 1.526948, -1.529659, 1, 1, 1, 1, 1,
-1.564631, 1.581774, 0.5718557, 1, 1, 1, 1, 1,
-1.552065, -0.1896031, -3.261053, 1, 1, 1, 1, 1,
-1.545704, 0.4183663, -1.832289, 1, 1, 1, 1, 1,
-1.532963, -0.6242917, -1.424854, 1, 1, 1, 1, 1,
-1.529754, 0.5513004, -1.038181, 1, 1, 1, 1, 1,
-1.527873, 1.144097, -1.983366, 1, 1, 1, 1, 1,
-1.525909, -0.7166491, -1.225875, 1, 1, 1, 1, 1,
-1.525245, 0.8599806, -0.8591368, 1, 1, 1, 1, 1,
-1.519133, -0.1682246, -1.490504, 1, 1, 1, 1, 1,
-1.517642, 0.9201872, -1.840923, 0, 0, 1, 1, 1,
-1.514479, -0.2917724, -0.7136076, 1, 0, 0, 1, 1,
-1.504967, -0.05275051, -3.026109, 1, 0, 0, 1, 1,
-1.503482, 1.750326, 0.7680783, 1, 0, 0, 1, 1,
-1.489176, -0.4454139, -1.505998, 1, 0, 0, 1, 1,
-1.475221, -0.765339, -1.989089, 1, 0, 0, 1, 1,
-1.467724, -0.16878, -2.388625, 0, 0, 0, 1, 1,
-1.458429, 1.8284, 0.08816147, 0, 0, 0, 1, 1,
-1.456378, -1.951643, -3.162106, 0, 0, 0, 1, 1,
-1.453736, -1.881449, -1.660081, 0, 0, 0, 1, 1,
-1.44841, 1.691314, -0.4194963, 0, 0, 0, 1, 1,
-1.434556, 0.6654506, -1.551898, 0, 0, 0, 1, 1,
-1.431978, 1.121052, -1.429485, 0, 0, 0, 1, 1,
-1.419937, 3.009131, -0.8289893, 1, 1, 1, 1, 1,
-1.401019, 0.1097104, -2.884279, 1, 1, 1, 1, 1,
-1.391659, -0.3320931, -1.104496, 1, 1, 1, 1, 1,
-1.391254, 0.06870474, -1.133458, 1, 1, 1, 1, 1,
-1.380345, -0.580963, -1.878632, 1, 1, 1, 1, 1,
-1.380094, 0.4095429, -1.930478, 1, 1, 1, 1, 1,
-1.373937, 0.5992126, -1.205972, 1, 1, 1, 1, 1,
-1.357772, -1.436677, -4.137074, 1, 1, 1, 1, 1,
-1.316705, 2.730645, -0.8372028, 1, 1, 1, 1, 1,
-1.307872, 0.3968282, -1.799075, 1, 1, 1, 1, 1,
-1.304944, -0.72102, -3.797314, 1, 1, 1, 1, 1,
-1.300932, -0.5608428, 0.2346606, 1, 1, 1, 1, 1,
-1.298554, 1.232497, -1.570857, 1, 1, 1, 1, 1,
-1.297241, 0.9634142, -0.1482493, 1, 1, 1, 1, 1,
-1.294156, 0.1167636, -1.398872, 1, 1, 1, 1, 1,
-1.270926, -2.105859, -1.736514, 0, 0, 1, 1, 1,
-1.268728, 0.3831942, -1.299019, 1, 0, 0, 1, 1,
-1.264892, -0.2134482, -1.289729, 1, 0, 0, 1, 1,
-1.263018, -3.076497, -2.876181, 1, 0, 0, 1, 1,
-1.262037, -2.296727, -2.715954, 1, 0, 0, 1, 1,
-1.260233, -1.864284, -3.499301, 1, 0, 0, 1, 1,
-1.258924, 0.01623258, 0.8883135, 0, 0, 0, 1, 1,
-1.256252, -1.682838, -1.692784, 0, 0, 0, 1, 1,
-1.249967, 0.4551951, -1.860525, 0, 0, 0, 1, 1,
-1.236631, 0.5480204, 0.4978257, 0, 0, 0, 1, 1,
-1.229705, -0.2764732, -1.907472, 0, 0, 0, 1, 1,
-1.228455, 0.5670053, -0.9558939, 0, 0, 0, 1, 1,
-1.216222, -1.762023, -2.759049, 0, 0, 0, 1, 1,
-1.194943, -0.4620379, -0.6911445, 1, 1, 1, 1, 1,
-1.192719, 0.9164162, -1.944667, 1, 1, 1, 1, 1,
-1.185717, 0.0626369, -2.150975, 1, 1, 1, 1, 1,
-1.185094, 0.9306231, -0.6175861, 1, 1, 1, 1, 1,
-1.180891, -0.8146878, -0.1079539, 1, 1, 1, 1, 1,
-1.171069, 0.5865268, -1.959033, 1, 1, 1, 1, 1,
-1.16613, -1.267299, -2.429342, 1, 1, 1, 1, 1,
-1.163178, -0.04920756, 0.2175624, 1, 1, 1, 1, 1,
-1.161686, -1.876602, -2.842976, 1, 1, 1, 1, 1,
-1.154135, -1.225461, 0.1597082, 1, 1, 1, 1, 1,
-1.144691, -1.312659, -3.314556, 1, 1, 1, 1, 1,
-1.144282, 0.9558483, -2.282559, 1, 1, 1, 1, 1,
-1.143924, -2.995104, -4.414774, 1, 1, 1, 1, 1,
-1.139123, -0.320311, -2.40364, 1, 1, 1, 1, 1,
-1.128297, 0.3559321, -1.034482, 1, 1, 1, 1, 1,
-1.117589, 0.008716592, -0.9728485, 0, 0, 1, 1, 1,
-1.113259, 0.8823621, 0.1833371, 1, 0, 0, 1, 1,
-1.112798, 0.3525344, -1.105465, 1, 0, 0, 1, 1,
-1.101172, 0.9904486, -0.8575212, 1, 0, 0, 1, 1,
-1.088789, -1.046128, -1.572346, 1, 0, 0, 1, 1,
-1.079971, -0.03481665, -2.397871, 1, 0, 0, 1, 1,
-1.072554, -0.508567, -3.290222, 0, 0, 0, 1, 1,
-1.066965, -0.2259906, -3.389171, 0, 0, 0, 1, 1,
-1.06661, -0.2186573, -2.001511, 0, 0, 0, 1, 1,
-1.064668, 0.5462821, 0.7652463, 0, 0, 0, 1, 1,
-1.060798, -1.415123, -1.57937, 0, 0, 0, 1, 1,
-1.059945, -1.034232, -1.25357, 0, 0, 0, 1, 1,
-1.059455, 0.1169639, 0.09992225, 0, 0, 0, 1, 1,
-1.052916, -1.080436, -2.404607, 1, 1, 1, 1, 1,
-1.049788, 0.9794108, -0.02220964, 1, 1, 1, 1, 1,
-1.041278, -0.605935, -3.608198, 1, 1, 1, 1, 1,
-1.04074, -0.7087678, -2.54713, 1, 1, 1, 1, 1,
-1.037042, 1.053394, 0.5908425, 1, 1, 1, 1, 1,
-1.03273, 1.484527, -2.173971, 1, 1, 1, 1, 1,
-1.031688, 0.2682944, -1.317798, 1, 1, 1, 1, 1,
-1.028796, 1.313107, -1.941819, 1, 1, 1, 1, 1,
-1.02433, 1.010258, -1.8132, 1, 1, 1, 1, 1,
-1.02081, -1.595368, -1.281254, 1, 1, 1, 1, 1,
-1.019619, 0.1996608, -2.598207, 1, 1, 1, 1, 1,
-1.014198, -0.9440397, -1.541558, 1, 1, 1, 1, 1,
-1.012206, 0.1949503, 0.2686113, 1, 1, 1, 1, 1,
-1.011241, -0.327886, -3.750824, 1, 1, 1, 1, 1,
-1.007745, 0.6368997, -0.7506651, 1, 1, 1, 1, 1,
-1.005169, 0.2788713, -2.006262, 0, 0, 1, 1, 1,
-0.9953305, -1.222293, -2.823503, 1, 0, 0, 1, 1,
-0.9926225, 1.43515, -1.709646, 1, 0, 0, 1, 1,
-0.9885071, 1.552894, -1.233808, 1, 0, 0, 1, 1,
-0.9869562, 0.3406003, -1.713677, 1, 0, 0, 1, 1,
-0.979771, -1.129581, -2.066424, 1, 0, 0, 1, 1,
-0.9763253, 0.8090549, 0.4248524, 0, 0, 0, 1, 1,
-0.9732523, 0.3060973, -0.4387999, 0, 0, 0, 1, 1,
-0.9729549, 0.4333049, -1.236922, 0, 0, 0, 1, 1,
-0.967099, 1.583147, -0.9838053, 0, 0, 0, 1, 1,
-0.9652027, 1.324307, -0.9708543, 0, 0, 0, 1, 1,
-0.9605826, -0.857493, -0.4835845, 0, 0, 0, 1, 1,
-0.9565663, 0.6643434, -0.922705, 0, 0, 0, 1, 1,
-0.9543443, -0.2359879, -0.3856152, 1, 1, 1, 1, 1,
-0.9540083, 1.061082, 0.09995109, 1, 1, 1, 1, 1,
-0.95357, -0.3244605, -0.7880324, 1, 1, 1, 1, 1,
-0.9406425, 0.7917448, -0.4359479, 1, 1, 1, 1, 1,
-0.9375643, 0.6003073, -1.327478, 1, 1, 1, 1, 1,
-0.9310488, -0.1004921, -2.010721, 1, 1, 1, 1, 1,
-0.9163136, 1.459734, 0.296288, 1, 1, 1, 1, 1,
-0.915128, 0.03585457, -1.371832, 1, 1, 1, 1, 1,
-0.9112266, 0.1166067, -0.7410376, 1, 1, 1, 1, 1,
-0.9099377, 1.235942, 0.6291425, 1, 1, 1, 1, 1,
-0.9087187, -1.26517, -4.023363, 1, 1, 1, 1, 1,
-0.9053938, 1.621892, -2.906399, 1, 1, 1, 1, 1,
-0.8984388, 0.05102061, -3.138931, 1, 1, 1, 1, 1,
-0.8943232, -2.193818, -3.56687, 1, 1, 1, 1, 1,
-0.8940957, 0.06657879, 0.3675754, 1, 1, 1, 1, 1,
-0.8875165, -0.05233491, -2.067961, 0, 0, 1, 1, 1,
-0.8844506, 0.9051222, -1.282709, 1, 0, 0, 1, 1,
-0.8737751, -1.81022, -2.37687, 1, 0, 0, 1, 1,
-0.8726597, -0.325743, -2.82311, 1, 0, 0, 1, 1,
-0.8702826, -0.9546117, -3.331967, 1, 0, 0, 1, 1,
-0.8687152, -0.6456814, -2.379275, 1, 0, 0, 1, 1,
-0.8669668, 0.8928971, -1.211936, 0, 0, 0, 1, 1,
-0.8606511, -1.921583, -2.426033, 0, 0, 0, 1, 1,
-0.8507543, -1.559542, -2.781466, 0, 0, 0, 1, 1,
-0.8460261, -1.347255, -3.277717, 0, 0, 0, 1, 1,
-0.8378854, -0.8938788, -4.129071, 0, 0, 0, 1, 1,
-0.83323, 1.1898, -2.617558, 0, 0, 0, 1, 1,
-0.8270294, -0.1310289, -1.998031, 0, 0, 0, 1, 1,
-0.8269417, 0.1417565, -1.625547, 1, 1, 1, 1, 1,
-0.8264548, -0.09473176, -1.360182, 1, 1, 1, 1, 1,
-0.8172824, 0.4644571, -0.8214867, 1, 1, 1, 1, 1,
-0.8070006, 0.7400281, -0.9983369, 1, 1, 1, 1, 1,
-0.806481, -0.1281071, -1.505894, 1, 1, 1, 1, 1,
-0.805976, 1.939016, -1.122389, 1, 1, 1, 1, 1,
-0.8014559, -0.9314714, -3.119895, 1, 1, 1, 1, 1,
-0.7952863, 0.7520925, -0.7264101, 1, 1, 1, 1, 1,
-0.7934248, -0.4372268, -2.049166, 1, 1, 1, 1, 1,
-0.7877018, 1.216788, -0.5474275, 1, 1, 1, 1, 1,
-0.7855529, 1.945673, 0.7719517, 1, 1, 1, 1, 1,
-0.7827994, -1.87437, -2.983945, 1, 1, 1, 1, 1,
-0.780934, 1.080793, -1.111534, 1, 1, 1, 1, 1,
-0.7787932, -0.8908709, -1.589019, 1, 1, 1, 1, 1,
-0.7723593, 0.9728575, 0.3370694, 1, 1, 1, 1, 1,
-0.7683573, -0.3864252, -0.06112758, 0, 0, 1, 1, 1,
-0.7639287, -0.1972349, -1.774019, 1, 0, 0, 1, 1,
-0.7610639, -0.5908441, -1.263886, 1, 0, 0, 1, 1,
-0.7607356, 2.663859, -0.09274636, 1, 0, 0, 1, 1,
-0.7606097, 1.357601, -0.6621651, 1, 0, 0, 1, 1,
-0.7587941, 0.4725117, 0.3516698, 1, 0, 0, 1, 1,
-0.7569362, -0.6404483, -3.012249, 0, 0, 0, 1, 1,
-0.749125, 1.051306, -1.126286, 0, 0, 0, 1, 1,
-0.7453952, 0.2722676, -1.12133, 0, 0, 0, 1, 1,
-0.7449743, 2.312687, -0.1459391, 0, 0, 0, 1, 1,
-0.7431616, -3.64974, -1.875358, 0, 0, 0, 1, 1,
-0.7431341, -0.2778335, -1.746893, 0, 0, 0, 1, 1,
-0.7373477, -2.312594, -1.722769, 0, 0, 0, 1, 1,
-0.7355325, -0.1814789, -1.736142, 1, 1, 1, 1, 1,
-0.7353794, -1.526116, -1.923167, 1, 1, 1, 1, 1,
-0.7285857, -0.6159626, -1.370572, 1, 1, 1, 1, 1,
-0.7267148, 1.464017, 0.1110774, 1, 1, 1, 1, 1,
-0.7249609, 0.7204903, -0.2803682, 1, 1, 1, 1, 1,
-0.7247754, 2.124769, -1.726073, 1, 1, 1, 1, 1,
-0.7218052, -0.198199, -1.276505, 1, 1, 1, 1, 1,
-0.7142038, -1.75316, -2.411837, 1, 1, 1, 1, 1,
-0.7098814, 0.8197243, 0.9716033, 1, 1, 1, 1, 1,
-0.7066545, -0.1537704, -1.973544, 1, 1, 1, 1, 1,
-0.7043365, 0.8752776, -2.491331, 1, 1, 1, 1, 1,
-0.7000116, 1.053826, 0.3617213, 1, 1, 1, 1, 1,
-0.6915619, -0.3948449, -0.4826531, 1, 1, 1, 1, 1,
-0.6894837, -1.08674, -3.429812, 1, 1, 1, 1, 1,
-0.6864087, -1.367866, -2.686246, 1, 1, 1, 1, 1,
-0.685961, 0.3328271, -0.9902316, 0, 0, 1, 1, 1,
-0.6809207, 0.4708972, -0.9258004, 1, 0, 0, 1, 1,
-0.6805447, 1.27774, -1.413814, 1, 0, 0, 1, 1,
-0.6759722, -1.261985, -2.290738, 1, 0, 0, 1, 1,
-0.6686227, 0.4599438, -0.1719263, 1, 0, 0, 1, 1,
-0.6684111, -0.06464349, -1.654493, 1, 0, 0, 1, 1,
-0.6667473, -1.051969, -1.986561, 0, 0, 0, 1, 1,
-0.6604508, -0.4873681, -3.359777, 0, 0, 0, 1, 1,
-0.6568279, -0.6424274, -1.73163, 0, 0, 0, 1, 1,
-0.647316, 0.7870529, -1.374395, 0, 0, 0, 1, 1,
-0.6427317, -0.8658963, -3.478339, 0, 0, 0, 1, 1,
-0.6392077, -1.376678, -1.909165, 0, 0, 0, 1, 1,
-0.6380823, 0.5122455, -1.714347, 0, 0, 0, 1, 1,
-0.6376325, 0.9105831, 0.2194365, 1, 1, 1, 1, 1,
-0.6353468, 0.4060676, 0.5987377, 1, 1, 1, 1, 1,
-0.6352486, -0.1526884, -1.529128, 1, 1, 1, 1, 1,
-0.6346167, 1.169562, -0.1659242, 1, 1, 1, 1, 1,
-0.6311193, -0.3039728, -0.8647934, 1, 1, 1, 1, 1,
-0.6302668, -1.181765, -2.714707, 1, 1, 1, 1, 1,
-0.6282212, -2.371847, -3.030836, 1, 1, 1, 1, 1,
-0.6206598, 1.814678, 0.002277039, 1, 1, 1, 1, 1,
-0.6112606, 0.02948388, -1.799622, 1, 1, 1, 1, 1,
-0.6068672, 0.8361897, 0.1289704, 1, 1, 1, 1, 1,
-0.6046957, -0.7815148, -1.279979, 1, 1, 1, 1, 1,
-0.6045152, -0.7806165, -3.071689, 1, 1, 1, 1, 1,
-0.6025534, -1.308307, -3.028069, 1, 1, 1, 1, 1,
-0.5985171, -0.04686633, -2.682293, 1, 1, 1, 1, 1,
-0.5951798, -0.7260721, -3.502771, 1, 1, 1, 1, 1,
-0.5913566, -0.108733, -0.9470578, 0, 0, 1, 1, 1,
-0.5896419, 1.344977, 0.7096627, 1, 0, 0, 1, 1,
-0.5803627, 0.5300794, -2.039074, 1, 0, 0, 1, 1,
-0.5777559, 0.2742495, -1.605966, 1, 0, 0, 1, 1,
-0.5768142, -1.103782, -2.283106, 1, 0, 0, 1, 1,
-0.569478, 0.4136602, -1.090521, 1, 0, 0, 1, 1,
-0.5652512, 1.011526, 0.7766636, 0, 0, 0, 1, 1,
-0.5583761, 0.5643623, 0.4424282, 0, 0, 0, 1, 1,
-0.5578752, -0.1087414, -1.564484, 0, 0, 0, 1, 1,
-0.5566086, -0.4144092, -1.257493, 0, 0, 0, 1, 1,
-0.5531549, 0.9650983, -0.3008184, 0, 0, 0, 1, 1,
-0.5454439, -0.2007956, -1.668673, 0, 0, 0, 1, 1,
-0.5451373, 1.513367, -0.6285414, 0, 0, 0, 1, 1,
-0.5444682, -0.1050351, -1.515409, 1, 1, 1, 1, 1,
-0.5436869, 1.057723, -1.50268, 1, 1, 1, 1, 1,
-0.54297, -0.4750824, -2.604094, 1, 1, 1, 1, 1,
-0.5426551, -0.4516455, -2.402788, 1, 1, 1, 1, 1,
-0.5416747, 1.278748, -1.371715, 1, 1, 1, 1, 1,
-0.5408441, 0.9338551, -1.826053, 1, 1, 1, 1, 1,
-0.539506, -0.09023806, -1.312004, 1, 1, 1, 1, 1,
-0.5352044, 0.06589808, -1.970043, 1, 1, 1, 1, 1,
-0.5263599, 1.11031, -1.807738, 1, 1, 1, 1, 1,
-0.5227413, -1.153663, -2.013831, 1, 1, 1, 1, 1,
-0.5218457, 2.407088, -1.029135, 1, 1, 1, 1, 1,
-0.5180241, 1.091998, 0.5112354, 1, 1, 1, 1, 1,
-0.5153034, -1.266241, -3.267893, 1, 1, 1, 1, 1,
-0.5131165, 1.675428, -0.5146105, 1, 1, 1, 1, 1,
-0.507934, -1.341726, -2.517096, 1, 1, 1, 1, 1,
-0.489979, -0.1460267, -1.119561, 0, 0, 1, 1, 1,
-0.4855593, 1.016963, -0.05778147, 1, 0, 0, 1, 1,
-0.4832076, -0.04714999, -0.5122268, 1, 0, 0, 1, 1,
-0.4810009, -0.03872096, 0.2579734, 1, 0, 0, 1, 1,
-0.4726003, -1.187868, -4.950358, 1, 0, 0, 1, 1,
-0.4685346, -0.8139627, -1.461813, 1, 0, 0, 1, 1,
-0.4682765, 0.8509206, 1.642328, 0, 0, 0, 1, 1,
-0.4660924, 0.1299125, -1.516799, 0, 0, 0, 1, 1,
-0.4659082, -1.10793, -2.625691, 0, 0, 0, 1, 1,
-0.4642218, 0.4770773, 0.001943373, 0, 0, 0, 1, 1,
-0.4623085, 1.713635, -0.3015133, 0, 0, 0, 1, 1,
-0.4598383, 0.7281742, 0.4065669, 0, 0, 0, 1, 1,
-0.4578853, 2.697555, -0.1690833, 0, 0, 0, 1, 1,
-0.4528668, -0.3179313, -3.064196, 1, 1, 1, 1, 1,
-0.4519972, 0.4343292, -1.059576, 1, 1, 1, 1, 1,
-0.4513443, -0.193567, -2.33258, 1, 1, 1, 1, 1,
-0.4502167, -0.3163694, -1.21082, 1, 1, 1, 1, 1,
-0.4406219, -1.835547, -3.759053, 1, 1, 1, 1, 1,
-0.437597, 0.5317798, -0.5289933, 1, 1, 1, 1, 1,
-0.432452, 0.3096325, 0.240415, 1, 1, 1, 1, 1,
-0.4307568, -0.1587298, -3.045136, 1, 1, 1, 1, 1,
-0.4277215, 0.7139007, 0.1198295, 1, 1, 1, 1, 1,
-0.4265244, -0.6368276, -3.556007, 1, 1, 1, 1, 1,
-0.4257113, 1.20348, -0.119259, 1, 1, 1, 1, 1,
-0.4255055, 0.301377, -2.773671, 1, 1, 1, 1, 1,
-0.425254, -1.217285, -2.768646, 1, 1, 1, 1, 1,
-0.423008, 0.04374623, -0.3744908, 1, 1, 1, 1, 1,
-0.4163349, -0.4912042, -1.226611, 1, 1, 1, 1, 1,
-0.4152623, -1.216256, -2.269271, 0, 0, 1, 1, 1,
-0.4054338, -1.518671, -3.016742, 1, 0, 0, 1, 1,
-0.4039211, 0.3837569, -1.75592, 1, 0, 0, 1, 1,
-0.4034606, -0.5967272, -2.578962, 1, 0, 0, 1, 1,
-0.4012575, -0.321257, -2.394717, 1, 0, 0, 1, 1,
-0.399373, -0.1023239, -1.869293, 1, 0, 0, 1, 1,
-0.3930133, 0.9692497, -0.4306829, 0, 0, 0, 1, 1,
-0.3916005, 0.7607334, 0.3222915, 0, 0, 0, 1, 1,
-0.3907412, 0.8496839, -0.1741077, 0, 0, 0, 1, 1,
-0.3886356, 0.4750209, -0.5736087, 0, 0, 0, 1, 1,
-0.3859616, -0.5547829, -2.999931, 0, 0, 0, 1, 1,
-0.3858715, -0.1510634, -2.393255, 0, 0, 0, 1, 1,
-0.3853243, 0.06850592, -1.666106, 0, 0, 0, 1, 1,
-0.3851259, 2.203762, 0.03989593, 1, 1, 1, 1, 1,
-0.3810311, -0.4687292, -2.493915, 1, 1, 1, 1, 1,
-0.3806546, 1.499244, -0.474743, 1, 1, 1, 1, 1,
-0.3791404, 0.6323789, -0.7160795, 1, 1, 1, 1, 1,
-0.3774439, 0.3344812, -2.178346, 1, 1, 1, 1, 1,
-0.3766009, -0.7293846, -1.727766, 1, 1, 1, 1, 1,
-0.3760458, -0.5071498, -5.06933, 1, 1, 1, 1, 1,
-0.3749821, 0.4588524, 1.01022, 1, 1, 1, 1, 1,
-0.3712542, 0.5113772, -0.5883969, 1, 1, 1, 1, 1,
-0.3701271, 1.699622, 0.6757571, 1, 1, 1, 1, 1,
-0.3699881, 1.073649, -0.6519871, 1, 1, 1, 1, 1,
-0.3669252, 0.4344694, -0.269253, 1, 1, 1, 1, 1,
-0.3650238, 0.5449861, 0.07267312, 1, 1, 1, 1, 1,
-0.3600839, -0.1282672, -0.5851906, 1, 1, 1, 1, 1,
-0.3569127, 0.6819639, 0.2971965, 1, 1, 1, 1, 1,
-0.352911, -0.5874088, -3.256805, 0, 0, 1, 1, 1,
-0.3472885, 0.2955441, 1.100822, 1, 0, 0, 1, 1,
-0.3467318, -1.086261, -5.018702, 1, 0, 0, 1, 1,
-0.3432319, 0.4135062, 0.5950239, 1, 0, 0, 1, 1,
-0.3403718, 0.03646026, -2.654152, 1, 0, 0, 1, 1,
-0.3384725, -0.2186736, -2.756073, 1, 0, 0, 1, 1,
-0.3342001, -0.5736303, -2.917901, 0, 0, 0, 1, 1,
-0.3333179, -2.356289, -1.794048, 0, 0, 0, 1, 1,
-0.3318851, 0.8730468, -1.63859, 0, 0, 0, 1, 1,
-0.3314937, 1.85915, -0.02585892, 0, 0, 0, 1, 1,
-0.3309355, -1.035641, -2.734984, 0, 0, 0, 1, 1,
-0.329424, -2.617849, -1.322888, 0, 0, 0, 1, 1,
-0.3279498, -0.06256191, -2.03762, 0, 0, 0, 1, 1,
-0.3264246, -0.5077224, -1.498051, 1, 1, 1, 1, 1,
-0.3261292, 0.9649342, -0.2998987, 1, 1, 1, 1, 1,
-0.3212079, 0.5735083, 0.1360886, 1, 1, 1, 1, 1,
-0.3178931, -1.140023, -2.430106, 1, 1, 1, 1, 1,
-0.3097127, -0.1761556, -2.499561, 1, 1, 1, 1, 1,
-0.3057435, -2.93749, -2.831797, 1, 1, 1, 1, 1,
-0.3051904, -2.992915, -4.263339, 1, 1, 1, 1, 1,
-0.3051679, -1.420903, -2.726599, 1, 1, 1, 1, 1,
-0.3017109, -0.2710009, -2.005472, 1, 1, 1, 1, 1,
-0.2991629, -1.139909, -4.286049, 1, 1, 1, 1, 1,
-0.2980051, 0.2045953, -0.6765101, 1, 1, 1, 1, 1,
-0.2973392, -0.4141575, -3.043969, 1, 1, 1, 1, 1,
-0.2971717, -0.6341866, -3.924288, 1, 1, 1, 1, 1,
-0.293115, -1.57131, -3.793895, 1, 1, 1, 1, 1,
-0.2852496, -0.1789028, -3.196376, 1, 1, 1, 1, 1,
-0.2789229, -1.556039, -2.334266, 0, 0, 1, 1, 1,
-0.2743662, 2.576326, -1.139128, 1, 0, 0, 1, 1,
-0.2699911, -0.01831099, -2.164557, 1, 0, 0, 1, 1,
-0.269272, -0.158804, -2.864453, 1, 0, 0, 1, 1,
-0.2606348, 1.589879, -2.668128, 1, 0, 0, 1, 1,
-0.2567818, -0.9745466, -2.051483, 1, 0, 0, 1, 1,
-0.2484103, 0.1553833, -2.031924, 0, 0, 0, 1, 1,
-0.2481989, 0.1956144, 0.06850018, 0, 0, 0, 1, 1,
-0.243496, 0.5771102, -0.1348799, 0, 0, 0, 1, 1,
-0.243035, -0.9975151, -3.003617, 0, 0, 0, 1, 1,
-0.2407498, -0.559357, -2.018154, 0, 0, 0, 1, 1,
-0.2398423, 1.348614, -0.9000694, 0, 0, 0, 1, 1,
-0.2392636, 1.415731, -0.7462681, 0, 0, 0, 1, 1,
-0.237141, -0.3356749, -3.628102, 1, 1, 1, 1, 1,
-0.2358551, 1.196756, 0.6434898, 1, 1, 1, 1, 1,
-0.2318898, 1.031514, -0.9420884, 1, 1, 1, 1, 1,
-0.2314662, 0.2080123, -0.6242885, 1, 1, 1, 1, 1,
-0.2307047, -0.9569833, -3.735151, 1, 1, 1, 1, 1,
-0.2249763, 0.885364, 0.6805624, 1, 1, 1, 1, 1,
-0.2230527, -1.087071, -3.973744, 1, 1, 1, 1, 1,
-0.2086345, 1.110156, -0.7228574, 1, 1, 1, 1, 1,
-0.2006013, -0.8237673, -4.835337, 1, 1, 1, 1, 1,
-0.1987581, -0.9882091, -0.7710676, 1, 1, 1, 1, 1,
-0.1951417, -0.6500037, -1.775467, 1, 1, 1, 1, 1,
-0.1933494, -2.152292, -4.171044, 1, 1, 1, 1, 1,
-0.1902458, 1.856429, -0.6536176, 1, 1, 1, 1, 1,
-0.1897366, 0.8433208, -0.2042752, 1, 1, 1, 1, 1,
-0.1880993, -0.9340643, -1.914552, 1, 1, 1, 1, 1,
-0.1867802, -0.3397578, -2.132795, 0, 0, 1, 1, 1,
-0.183363, 0.8831002, -0.5071879, 1, 0, 0, 1, 1,
-0.1791476, -0.7045017, -1.349677, 1, 0, 0, 1, 1,
-0.1747952, 1.329717, -0.5020783, 1, 0, 0, 1, 1,
-0.1715676, -0.08272301, -1.582623, 1, 0, 0, 1, 1,
-0.1683715, -0.9478636, -2.634501, 1, 0, 0, 1, 1,
-0.1605484, 0.6971177, -0.3071174, 0, 0, 0, 1, 1,
-0.156308, -0.8021805, -3.960758, 0, 0, 0, 1, 1,
-0.1558028, -1.988508, -3.937803, 0, 0, 0, 1, 1,
-0.1538118, -0.9701154, -2.847037, 0, 0, 0, 1, 1,
-0.1522942, 1.400333, 1.239391, 0, 0, 0, 1, 1,
-0.1483735, 0.2245197, -0.8270784, 0, 0, 0, 1, 1,
-0.147479, 1.357248, -0.4055541, 0, 0, 0, 1, 1,
-0.1467802, -0.07787789, -2.068317, 1, 1, 1, 1, 1,
-0.1436033, 0.1290229, 0.5264508, 1, 1, 1, 1, 1,
-0.1417293, 0.7952898, 0.5667124, 1, 1, 1, 1, 1,
-0.1395318, -1.46238, -2.393811, 1, 1, 1, 1, 1,
-0.1393273, -1.000823, -4.325204, 1, 1, 1, 1, 1,
-0.1381981, 0.3173178, -1.22047, 1, 1, 1, 1, 1,
-0.1363375, -0.2772159, -0.5868346, 1, 1, 1, 1, 1,
-0.133204, 0.6742066, 1.184631, 1, 1, 1, 1, 1,
-0.1315034, -0.3677481, -2.560757, 1, 1, 1, 1, 1,
-0.1300225, 0.5169795, 0.01071011, 1, 1, 1, 1, 1,
-0.1253143, -0.715784, -4.541597, 1, 1, 1, 1, 1,
-0.121755, -1.084758, -3.064717, 1, 1, 1, 1, 1,
-0.1180155, -0.4154034, -2.875048, 1, 1, 1, 1, 1,
-0.1174808, -0.4673431, -2.624669, 1, 1, 1, 1, 1,
-0.1150605, -0.005891757, -1.391335, 1, 1, 1, 1, 1,
-0.1142776, 0.6254363, 0.3050646, 0, 0, 1, 1, 1,
-0.1112459, 0.1783379, 0.55933, 1, 0, 0, 1, 1,
-0.1097304, -0.1047856, -2.039138, 1, 0, 0, 1, 1,
-0.1080125, -0.864861, -2.811461, 1, 0, 0, 1, 1,
-0.1033199, 0.8067656, -0.6238433, 1, 0, 0, 1, 1,
-0.101881, 0.9308714, 1.132645, 1, 0, 0, 1, 1,
-0.1010571, 1.641972, -0.7883839, 0, 0, 0, 1, 1,
-0.09497772, 0.3338161, -0.9965552, 0, 0, 0, 1, 1,
-0.09040256, -0.1488357, -3.017519, 0, 0, 0, 1, 1,
-0.08876093, -1.011533, -1.988816, 0, 0, 0, 1, 1,
-0.08656424, 0.2614249, 0.8468512, 0, 0, 0, 1, 1,
-0.08257455, 1.530827, -0.06267099, 0, 0, 0, 1, 1,
-0.07973853, 0.4229061, -0.4411523, 0, 0, 0, 1, 1,
-0.07917654, 1.665514, 0.3148193, 1, 1, 1, 1, 1,
-0.07571154, -1.883919, -4.52387, 1, 1, 1, 1, 1,
-0.07106058, -0.9162426, -3.194768, 1, 1, 1, 1, 1,
-0.06927237, 0.1509735, -1.578704, 1, 1, 1, 1, 1,
-0.06923428, -1.956797, -3.146627, 1, 1, 1, 1, 1,
-0.06906316, 0.1204804, -0.1280833, 1, 1, 1, 1, 1,
-0.06155017, -0.03545959, -2.048173, 1, 1, 1, 1, 1,
-0.06028404, 0.7612863, -0.3203625, 1, 1, 1, 1, 1,
-0.05930671, -1.675652, -2.693355, 1, 1, 1, 1, 1,
-0.05748446, 0.8280675, -0.634474, 1, 1, 1, 1, 1,
-0.05685699, 1.178064, -0.2832067, 1, 1, 1, 1, 1,
-0.05309946, 0.1754979, -0.4611895, 1, 1, 1, 1, 1,
-0.04466445, -1.031566, -4.263567, 1, 1, 1, 1, 1,
-0.04282841, 0.4021953, 1.013341, 1, 1, 1, 1, 1,
-0.04080046, -1.716878, -4.005167, 1, 1, 1, 1, 1,
-0.03882325, -1.367887, -1.846536, 0, 0, 1, 1, 1,
-0.03791453, -0.7864664, -2.686584, 1, 0, 0, 1, 1,
-0.03790589, -0.6239406, -2.525464, 1, 0, 0, 1, 1,
-0.0367868, 0.113866, -0.7803254, 1, 0, 0, 1, 1,
-0.03574163, -2.112852, -3.100964, 1, 0, 0, 1, 1,
-0.03494284, 0.5185382, 0.4584717, 1, 0, 0, 1, 1,
-0.02077498, -0.3407057, -3.713173, 0, 0, 0, 1, 1,
-0.01937625, 1.897372, 0.100141, 0, 0, 0, 1, 1,
-0.01787324, 0.7778017, -1.108235, 0, 0, 0, 1, 1,
-0.01447004, 1.255651, 1.60641, 0, 0, 0, 1, 1,
-0.01436722, 1.431491, -1.335667, 0, 0, 0, 1, 1,
-0.01136868, -0.4411546, -2.370015, 0, 0, 0, 1, 1,
-0.008964905, 0.1983527, -1.800283, 0, 0, 0, 1, 1,
-0.007247326, -0.431671, -3.685983, 1, 1, 1, 1, 1,
-0.007106537, 0.8754266, 0.05855104, 1, 1, 1, 1, 1,
-0.004213129, -0.103489, -4.183664, 1, 1, 1, 1, 1,
0.0005617531, -0.47713, 2.563579, 1, 1, 1, 1, 1,
0.0009238236, 0.7432208, 1.334513, 1, 1, 1, 1, 1,
0.001936344, -0.9819729, 4.207855, 1, 1, 1, 1, 1,
0.002454947, -0.4151126, 4.009964, 1, 1, 1, 1, 1,
0.00459003, -0.2232853, 4.766674, 1, 1, 1, 1, 1,
0.01974263, 1.307171, -1.307062, 1, 1, 1, 1, 1,
0.02066089, -0.90197, 2.140999, 1, 1, 1, 1, 1,
0.02151339, 1.603047, -0.1054775, 1, 1, 1, 1, 1,
0.02271132, -1.15198, 4.059617, 1, 1, 1, 1, 1,
0.02493099, 2.787762, -0.7922868, 1, 1, 1, 1, 1,
0.02524178, 1.14854, -0.4347242, 1, 1, 1, 1, 1,
0.02535812, 1.052913, -0.3140238, 1, 1, 1, 1, 1,
0.02961955, -0.282025, 2.084992, 0, 0, 1, 1, 1,
0.03349719, 0.7780657, 1.749367, 1, 0, 0, 1, 1,
0.03746667, 0.7568153, -1.712002, 1, 0, 0, 1, 1,
0.03846097, 0.3229362, -0.4402219, 1, 0, 0, 1, 1,
0.04033614, -0.7323615, 4.026261, 1, 0, 0, 1, 1,
0.04721452, 1.966553, 1.073865, 1, 0, 0, 1, 1,
0.04892006, -1.66103, 0.9026356, 0, 0, 0, 1, 1,
0.05478798, 0.3069065, 1.10726, 0, 0, 0, 1, 1,
0.06353687, -0.4210557, 4.103379, 0, 0, 0, 1, 1,
0.06711542, 1.128904, 0.426417, 0, 0, 0, 1, 1,
0.07184317, 0.1744474, -1.289768, 0, 0, 0, 1, 1,
0.08324993, 0.7403803, 2.540932, 0, 0, 0, 1, 1,
0.08609243, -0.8425299, 2.969474, 0, 0, 0, 1, 1,
0.08702748, 0.7623605, 0.6282651, 1, 1, 1, 1, 1,
0.08889759, -1.004667, 2.517101, 1, 1, 1, 1, 1,
0.08934031, -0.5553667, 3.63172, 1, 1, 1, 1, 1,
0.08984189, -0.5457014, 4.128513, 1, 1, 1, 1, 1,
0.09034234, 0.2939866, 1.207524, 1, 1, 1, 1, 1,
0.09325447, -1.086446, 4.390038, 1, 1, 1, 1, 1,
0.09498239, -1.69951, 2.869287, 1, 1, 1, 1, 1,
0.09597338, 0.1807259, 1.197846, 1, 1, 1, 1, 1,
0.09923431, -0.4181548, 1.776281, 1, 1, 1, 1, 1,
0.1004268, 2.452785, -1.080627, 1, 1, 1, 1, 1,
0.1013263, -1.431203, 1.972502, 1, 1, 1, 1, 1,
0.1021469, -0.1646789, 3.566052, 1, 1, 1, 1, 1,
0.1031944, 0.8538708, 0.9298564, 1, 1, 1, 1, 1,
0.1052872, 0.6589637, 0.5766803, 1, 1, 1, 1, 1,
0.1058753, -0.506084, 3.128523, 1, 1, 1, 1, 1,
0.1062439, 1.338227, -0.5503789, 0, 0, 1, 1, 1,
0.1074379, -0.4498856, 3.950648, 1, 0, 0, 1, 1,
0.1092079, 0.8593354, 1.057078, 1, 0, 0, 1, 1,
0.1119182, -0.4017115, 2.343832, 1, 0, 0, 1, 1,
0.1129522, 0.6777408, 0.3415481, 1, 0, 0, 1, 1,
0.11494, -1.006891, 3.275847, 1, 0, 0, 1, 1,
0.1151798, 0.8537257, 0.5063313, 0, 0, 0, 1, 1,
0.115832, -1.594933, 3.810572, 0, 0, 0, 1, 1,
0.118198, 0.7065099, 0.847491, 0, 0, 0, 1, 1,
0.1204139, -0.6049713, 3.366283, 0, 0, 0, 1, 1,
0.1208971, 1.155456, 2.091622, 0, 0, 0, 1, 1,
0.1246496, -1.13587, 0.7091665, 0, 0, 0, 1, 1,
0.1247662, -1.174977, 2.929483, 0, 0, 0, 1, 1,
0.1260942, -0.07054, 2.282963, 1, 1, 1, 1, 1,
0.1261321, 1.150457, -1.217296, 1, 1, 1, 1, 1,
0.1298445, 1.525044, -1.665442, 1, 1, 1, 1, 1,
0.1318918, -0.08694831, 2.350472, 1, 1, 1, 1, 1,
0.1345173, 0.2548078, -0.1269746, 1, 1, 1, 1, 1,
0.1347359, -0.2508823, 1.419271, 1, 1, 1, 1, 1,
0.1362011, 0.4423505, 0.4662022, 1, 1, 1, 1, 1,
0.1383483, -0.02479003, 3.657967, 1, 1, 1, 1, 1,
0.1388556, -0.6463289, 2.903105, 1, 1, 1, 1, 1,
0.1437945, 0.3817063, 1.863895, 1, 1, 1, 1, 1,
0.1447186, 1.596619, -0.06007835, 1, 1, 1, 1, 1,
0.1490136, -0.6075613, 1.813852, 1, 1, 1, 1, 1,
0.1500157, -0.4929714, 3.87993, 1, 1, 1, 1, 1,
0.1510672, -0.320345, 4.116389, 1, 1, 1, 1, 1,
0.1516354, -0.4402984, 1.799374, 1, 1, 1, 1, 1,
0.153616, 0.67673, -0.3200789, 0, 0, 1, 1, 1,
0.1541962, -0.8705685, 2.715828, 1, 0, 0, 1, 1,
0.1563095, 0.7934434, -1.754608, 1, 0, 0, 1, 1,
0.1595178, -1.299211, 3.075768, 1, 0, 0, 1, 1,
0.1597327, 0.5317826, -4.213134e-05, 1, 0, 0, 1, 1,
0.1652391, -0.1501252, 3.00229, 1, 0, 0, 1, 1,
0.1669541, -0.1510181, 3.774782, 0, 0, 0, 1, 1,
0.1705894, -0.3564659, 3.364053, 0, 0, 0, 1, 1,
0.1709142, -2.503192, 1.281446, 0, 0, 0, 1, 1,
0.1758223, -0.1044267, 2.573329, 0, 0, 0, 1, 1,
0.1785293, -0.2335194, 2.613983, 0, 0, 0, 1, 1,
0.1788571, -0.7120247, 2.829497, 0, 0, 0, 1, 1,
0.180567, 1.409195, 1.849235, 0, 0, 0, 1, 1,
0.1837591, -1.034966, 1.827608, 1, 1, 1, 1, 1,
0.1849565, 0.7062253, 0.5918773, 1, 1, 1, 1, 1,
0.1853097, -1.828451, 2.310741, 1, 1, 1, 1, 1,
0.1887735, -1.39328, 2.236836, 1, 1, 1, 1, 1,
0.1901482, 0.7315302, 0.6928245, 1, 1, 1, 1, 1,
0.1922605, 0.5138826, 0.890575, 1, 1, 1, 1, 1,
0.1928365, 0.06794024, 1.460091, 1, 1, 1, 1, 1,
0.2004583, -0.8856766, 1.832426, 1, 1, 1, 1, 1,
0.2027274, -0.8133958, 3.469438, 1, 1, 1, 1, 1,
0.2036299, -0.903019, 3.567038, 1, 1, 1, 1, 1,
0.2053678, 0.2436277, 0.6474845, 1, 1, 1, 1, 1,
0.2067199, -0.6202129, 3.376534, 1, 1, 1, 1, 1,
0.2135202, -1.777584, 3.572177, 1, 1, 1, 1, 1,
0.2151545, -0.2636202, 1.97124, 1, 1, 1, 1, 1,
0.215457, 0.6005839, -0.4218751, 1, 1, 1, 1, 1,
0.2169489, -0.05296933, 3.181446, 0, 0, 1, 1, 1,
0.2258306, -1.254212, 2.612588, 1, 0, 0, 1, 1,
0.2270392, -1.339267, 1.741372, 1, 0, 0, 1, 1,
0.2310526, -0.4908605, 4.472101, 1, 0, 0, 1, 1,
0.2322674, 0.5355803, -0.2152427, 1, 0, 0, 1, 1,
0.2386612, -0.1813295, 2.913043, 1, 0, 0, 1, 1,
0.2508972, 0.748837, 0.1498283, 0, 0, 0, 1, 1,
0.2541878, 0.1690142, 1.591064, 0, 0, 0, 1, 1,
0.2566594, -0.8277494, 3.646345, 0, 0, 0, 1, 1,
0.2572418, 0.5439311, 1.945588, 0, 0, 0, 1, 1,
0.257853, 0.04536448, 0.8439031, 0, 0, 0, 1, 1,
0.2620135, 0.3087596, 1.990404, 0, 0, 0, 1, 1,
0.2673024, 1.999633, 0.3670532, 0, 0, 0, 1, 1,
0.2711169, 0.03028893, 1.47236, 1, 1, 1, 1, 1,
0.2724632, 1.212288, 0.3581795, 1, 1, 1, 1, 1,
0.272821, -0.9321467, 1.650002, 1, 1, 1, 1, 1,
0.2747242, -0.05682861, 3.481578, 1, 1, 1, 1, 1,
0.2755508, -0.5273858, 1.667177, 1, 1, 1, 1, 1,
0.2828662, -1.122113, 3.986915, 1, 1, 1, 1, 1,
0.2831609, -0.5962834, 1.080135, 1, 1, 1, 1, 1,
0.2839801, -0.01786833, 2.667492, 1, 1, 1, 1, 1,
0.2883539, 0.8630679, -0.005311827, 1, 1, 1, 1, 1,
0.2943455, 0.7733346, 1.800945, 1, 1, 1, 1, 1,
0.2958871, -0.2434, 2.466058, 1, 1, 1, 1, 1,
0.2972014, 1.741435, -0.8977453, 1, 1, 1, 1, 1,
0.2997177, 0.352488, 0.6110183, 1, 1, 1, 1, 1,
0.3000261, 0.9914399, 1.727166, 1, 1, 1, 1, 1,
0.3007754, 0.5258639, 1.378636, 1, 1, 1, 1, 1,
0.3011621, 0.3017778, -0.313913, 0, 0, 1, 1, 1,
0.3071776, 0.1588948, 0.5152836, 1, 0, 0, 1, 1,
0.3131468, -0.2795569, 2.475182, 1, 0, 0, 1, 1,
0.3171333, 0.07655754, 1.140764, 1, 0, 0, 1, 1,
0.3178503, -0.5159711, 2.418899, 1, 0, 0, 1, 1,
0.3219019, 0.3589829, 2.308908, 1, 0, 0, 1, 1,
0.3226154, -0.2980217, 2.009259, 0, 0, 0, 1, 1,
0.3266692, 0.185378, -0.2057851, 0, 0, 0, 1, 1,
0.3266923, -0.9999106, 3.234803, 0, 0, 0, 1, 1,
0.3288801, -1.351368, 3.042215, 0, 0, 0, 1, 1,
0.3328027, 0.1392974, 2.694082, 0, 0, 0, 1, 1,
0.335071, 0.1939583, 0.8532882, 0, 0, 0, 1, 1,
0.3374077, -1.53583, 4.894125, 0, 0, 0, 1, 1,
0.3394291, 0.8202007, -0.4897037, 1, 1, 1, 1, 1,
0.3394496, -0.4870145, 0.4659248, 1, 1, 1, 1, 1,
0.3396947, -1.028437, 1.129342, 1, 1, 1, 1, 1,
0.3398413, -0.9202195, 1.711975, 1, 1, 1, 1, 1,
0.3447732, 0.3344162, -0.5477352, 1, 1, 1, 1, 1,
0.345722, -0.2470735, 2.725175, 1, 1, 1, 1, 1,
0.3511487, 1.167806, 1.200444, 1, 1, 1, 1, 1,
0.3529448, 1.485907, 1.64451, 1, 1, 1, 1, 1,
0.3585662, -0.08493189, 1.5922, 1, 1, 1, 1, 1,
0.3648157, 1.166967, 0.9433767, 1, 1, 1, 1, 1,
0.3664802, 1.256953, 1.267191, 1, 1, 1, 1, 1,
0.3679894, 0.4614788, -2.053599, 1, 1, 1, 1, 1,
0.3680731, 0.3725145, -0.04302062, 1, 1, 1, 1, 1,
0.3751583, -0.925357, 2.712283, 1, 1, 1, 1, 1,
0.378123, -0.4242348, 1.742848, 1, 1, 1, 1, 1,
0.3799852, -0.5631179, 3.925289, 0, 0, 1, 1, 1,
0.380044, 0.6626496, 0.9158463, 1, 0, 0, 1, 1,
0.381603, -0.6868565, 1.908422, 1, 0, 0, 1, 1,
0.3830903, 0.988013, 2.69446, 1, 0, 0, 1, 1,
0.3850349, 0.472758, -0.4487978, 1, 0, 0, 1, 1,
0.387787, 0.1296548, 4.031116, 1, 0, 0, 1, 1,
0.391984, -0.6741013, 2.849517, 0, 0, 0, 1, 1,
0.3980702, 0.4192851, 0.1425276, 0, 0, 0, 1, 1,
0.3983707, 0.8904268, 0.9465482, 0, 0, 0, 1, 1,
0.3990341, -0.3640967, -0.06405621, 0, 0, 0, 1, 1,
0.4013052, -0.6959111, 1.342839, 0, 0, 0, 1, 1,
0.4052055, -1.054922, 4.06537, 0, 0, 0, 1, 1,
0.4142228, 0.000679542, 2.095275, 0, 0, 0, 1, 1,
0.4143621, 0.5965765, 1.948698, 1, 1, 1, 1, 1,
0.4168667, -0.4139068, 3.087157, 1, 1, 1, 1, 1,
0.419122, 1.431588, 0.1131642, 1, 1, 1, 1, 1,
0.4237946, 0.3455952, -0.4444208, 1, 1, 1, 1, 1,
0.4281244, -0.5823601, 1.311505, 1, 1, 1, 1, 1,
0.4304681, -0.5017116, 2.752078, 1, 1, 1, 1, 1,
0.4317477, -0.3353803, 0.7862993, 1, 1, 1, 1, 1,
0.4327251, 0.7042145, -0.3955609, 1, 1, 1, 1, 1,
0.4379921, 0.6676463, -1.343812, 1, 1, 1, 1, 1,
0.4408791, 0.04242095, 1.585065, 1, 1, 1, 1, 1,
0.4448855, -0.4476033, 2.693401, 1, 1, 1, 1, 1,
0.4482777, -1.035534, 2.640145, 1, 1, 1, 1, 1,
0.4532465, -0.9705914, 4.771995, 1, 1, 1, 1, 1,
0.4563452, 1.285048, -2.376557, 1, 1, 1, 1, 1,
0.4563701, 0.4170268, 0.1672299, 1, 1, 1, 1, 1,
0.4574171, -0.4541348, 4.160398, 0, 0, 1, 1, 1,
0.4607378, -0.05474227, 3.106548, 1, 0, 0, 1, 1,
0.4671755, -1.972674, 2.281586, 1, 0, 0, 1, 1,
0.4711583, -0.1344527, 1.916058, 1, 0, 0, 1, 1,
0.4740811, -0.4165289, 1.14643, 1, 0, 0, 1, 1,
0.4799218, 0.9159272, -1.776819, 1, 0, 0, 1, 1,
0.4822555, -0.4356399, 3.239512, 0, 0, 0, 1, 1,
0.4850995, -2.106421, 4.650626, 0, 0, 0, 1, 1,
0.4855697, -0.7133809, 1.867512, 0, 0, 0, 1, 1,
0.4955079, 0.2151238, -1.169974, 0, 0, 0, 1, 1,
0.4957901, 0.2097086, 0.6791784, 0, 0, 0, 1, 1,
0.4976021, -0.2082597, 0.9565668, 0, 0, 0, 1, 1,
0.5004585, -1.101221, 2.616391, 0, 0, 0, 1, 1,
0.5013282, 0.7672268, 1.255467, 1, 1, 1, 1, 1,
0.5020359, 0.06249752, 1.539632, 1, 1, 1, 1, 1,
0.504557, 1.96845, 0.09368312, 1, 1, 1, 1, 1,
0.5060418, -0.4114352, 1.760219, 1, 1, 1, 1, 1,
0.5062345, -0.2421952, 1.324914, 1, 1, 1, 1, 1,
0.5096428, -0.9076882, 1.704082, 1, 1, 1, 1, 1,
0.5148253, 0.9241583, 0.5710564, 1, 1, 1, 1, 1,
0.5178099, -0.1160992, 0.9025055, 1, 1, 1, 1, 1,
0.5199266, -0.8248983, 2.66829, 1, 1, 1, 1, 1,
0.5202742, -1.133405, 2.65969, 1, 1, 1, 1, 1,
0.5208824, -1.06907, 2.846534, 1, 1, 1, 1, 1,
0.5238335, 1.836133, 0.189907, 1, 1, 1, 1, 1,
0.5238436, 0.8288119, -1.772271, 1, 1, 1, 1, 1,
0.5241953, -0.5106347, 3.279408, 1, 1, 1, 1, 1,
0.5293928, -0.3851903, 3.815058, 1, 1, 1, 1, 1,
0.5321723, 0.4381928, 1.151821, 0, 0, 1, 1, 1,
0.5348989, 0.7227557, 1.441101, 1, 0, 0, 1, 1,
0.5362011, 0.5465772, 0.3581644, 1, 0, 0, 1, 1,
0.5400662, 1.06407, 0.3948964, 1, 0, 0, 1, 1,
0.5428433, -1.38084, 4.156381, 1, 0, 0, 1, 1,
0.5431672, 0.01895608, 2.568715, 1, 0, 0, 1, 1,
0.5473701, 2.776283, 1.330542, 0, 0, 0, 1, 1,
0.5538018, 1.325948, -0.5059733, 0, 0, 0, 1, 1,
0.5588896, -0.06832575, 2.60114, 0, 0, 0, 1, 1,
0.561065, -0.5133267, 2.373971, 0, 0, 0, 1, 1,
0.5614423, -0.9181916, 2.8591, 0, 0, 0, 1, 1,
0.5640821, -0.4055993, 1.46725, 0, 0, 0, 1, 1,
0.5661253, 1.967597, -0.9282851, 0, 0, 0, 1, 1,
0.5663621, -1.483178, 3.520298, 1, 1, 1, 1, 1,
0.5732051, 0.593425, 0.03831058, 1, 1, 1, 1, 1,
0.5742394, -0.4190035, 1.642359, 1, 1, 1, 1, 1,
0.5745857, -0.8787287, 1.546183, 1, 1, 1, 1, 1,
0.5794653, 0.687933, -0.977883, 1, 1, 1, 1, 1,
0.5809421, -0.5366269, 1.77804, 1, 1, 1, 1, 1,
0.5826199, 2.616924, 0.0191751, 1, 1, 1, 1, 1,
0.5855333, -0.7944953, 2.950476, 1, 1, 1, 1, 1,
0.5867425, 2.124031, -0.1725124, 1, 1, 1, 1, 1,
0.587444, -0.369435, 3.097207, 1, 1, 1, 1, 1,
0.5894349, -1.421551, 2.763279, 1, 1, 1, 1, 1,
0.592855, -0.2912634, 0.191993, 1, 1, 1, 1, 1,
0.594045, -0.7253348, 2.728388, 1, 1, 1, 1, 1,
0.5962642, -0.6684458, 2.88701, 1, 1, 1, 1, 1,
0.5968062, -0.6148129, 1.835681, 1, 1, 1, 1, 1,
0.5993922, 0.3702065, 1.475775, 0, 0, 1, 1, 1,
0.6005715, -1.810008, 2.61276, 1, 0, 0, 1, 1,
0.6020225, -0.8258808, 2.35388, 1, 0, 0, 1, 1,
0.6031228, 1.499501, 0.3771717, 1, 0, 0, 1, 1,
0.6043476, -1.13624, 2.319425, 1, 0, 0, 1, 1,
0.6161906, -0.3956485, 1.66749, 1, 0, 0, 1, 1,
0.6167782, -1.416605, 3.263832, 0, 0, 0, 1, 1,
0.6268431, -1.736537, 2.721276, 0, 0, 0, 1, 1,
0.6296467, -0.6116714, 2.714975, 0, 0, 0, 1, 1,
0.6310226, -0.07939147, 3.726357, 0, 0, 0, 1, 1,
0.6329815, -0.6798548, 1.416577, 0, 0, 0, 1, 1,
0.6330736, -1.504468, 2.270291, 0, 0, 0, 1, 1,
0.6353954, -1.904116, 0.712765, 0, 0, 0, 1, 1,
0.6421787, 0.32205, -0.1730744, 1, 1, 1, 1, 1,
0.6430396, 1.195674, 2.636701, 1, 1, 1, 1, 1,
0.6454061, -0.6614559, 3.091414, 1, 1, 1, 1, 1,
0.6534637, 0.02656992, 3.066042, 1, 1, 1, 1, 1,
0.6564196, 0.9951337, -0.06872794, 1, 1, 1, 1, 1,
0.6657273, -0.3927748, 2.161528, 1, 1, 1, 1, 1,
0.6726074, 0.2780013, 0.5962166, 1, 1, 1, 1, 1,
0.6741248, 0.2250063, 1.681829, 1, 1, 1, 1, 1,
0.6794957, 0.7038162, 0.8805257, 1, 1, 1, 1, 1,
0.6806341, -1.455765, 3.150032, 1, 1, 1, 1, 1,
0.6875852, -0.3519243, 1.314984, 1, 1, 1, 1, 1,
0.6890091, 0.01324328, 3.303361, 1, 1, 1, 1, 1,
0.6909847, 0.2468807, -0.4322231, 1, 1, 1, 1, 1,
0.6918853, -1.251814, 1.515011, 1, 1, 1, 1, 1,
0.6957926, 0.8265902, 1.028979, 1, 1, 1, 1, 1,
0.7049935, 1.193932, 3.097069, 0, 0, 1, 1, 1,
0.7131382, 0.1258903, 2.057711, 1, 0, 0, 1, 1,
0.7153386, -0.1588466, 4.158652, 1, 0, 0, 1, 1,
0.7163234, -1.992035, 1.53494, 1, 0, 0, 1, 1,
0.7170933, -0.1234883, 1.78633, 1, 0, 0, 1, 1,
0.7174991, -1.208843, 3.731519, 1, 0, 0, 1, 1,
0.718087, -1.836248, 3.30483, 0, 0, 0, 1, 1,
0.7218356, 1.048529, 2.47366, 0, 0, 0, 1, 1,
0.7219819, 0.3618653, 3.133542, 0, 0, 0, 1, 1,
0.7231903, -0.005226342, 3.382508, 0, 0, 0, 1, 1,
0.7234734, -0.4627867, 1.593331, 0, 0, 0, 1, 1,
0.7239146, 1.017522, 0.391603, 0, 0, 0, 1, 1,
0.724488, 0.1105163, 3.316635, 0, 0, 0, 1, 1,
0.7285889, 0.3841586, 1.11661, 1, 1, 1, 1, 1,
0.7306698, 0.5982153, 2.113911, 1, 1, 1, 1, 1,
0.734396, 0.2719343, 1.428178, 1, 1, 1, 1, 1,
0.7412888, -1.118934, 1.798207, 1, 1, 1, 1, 1,
0.7414763, -0.4703689, 4.59483, 1, 1, 1, 1, 1,
0.7503812, -1.203313, 2.931585, 1, 1, 1, 1, 1,
0.7530427, 1.177513, 0.5600718, 1, 1, 1, 1, 1,
0.7535455, 0.2082867, 2.66534, 1, 1, 1, 1, 1,
0.755672, 0.7508365, 0.6521727, 1, 1, 1, 1, 1,
0.7578866, -0.2201226, 2.540794, 1, 1, 1, 1, 1,
0.7625719, -1.018694, 1.379634, 1, 1, 1, 1, 1,
0.7673026, -0.6097507, 1.581996, 1, 1, 1, 1, 1,
0.7731797, -1.001585, 1.009855, 1, 1, 1, 1, 1,
0.7769674, 0.9324262, 1.512678, 1, 1, 1, 1, 1,
0.7799662, 0.1505029, 2.272057, 1, 1, 1, 1, 1,
0.7807427, -0.3736679, 0.7963316, 0, 0, 1, 1, 1,
0.787792, 1.482873, 0.3797494, 1, 0, 0, 1, 1,
0.790006, -0.2650696, 2.758341, 1, 0, 0, 1, 1,
0.7926427, -0.07310788, -0.5490182, 1, 0, 0, 1, 1,
0.7934064, -1.856811, 1.158738, 1, 0, 0, 1, 1,
0.797286, -1.250506, 3.032897, 1, 0, 0, 1, 1,
0.7973859, 0.2562959, 0.7133774, 0, 0, 0, 1, 1,
0.7993601, 0.07703709, 0.01303564, 0, 0, 0, 1, 1,
0.8051007, -0.600148, 1.647305, 0, 0, 0, 1, 1,
0.8055804, 0.09936478, 3.404543, 0, 0, 0, 1, 1,
0.8060318, -0.3675849, 2.462039, 0, 0, 0, 1, 1,
0.811741, 0.02737344, 2.761925, 0, 0, 0, 1, 1,
0.8156325, 1.525701, 0.4482417, 0, 0, 0, 1, 1,
0.8156823, 0.4816262, 1.839525, 1, 1, 1, 1, 1,
0.8164488, -0.578172, 0.5837393, 1, 1, 1, 1, 1,
0.8203245, 0.4139383, 0.8858538, 1, 1, 1, 1, 1,
0.8333435, -0.05176481, 0.06108834, 1, 1, 1, 1, 1,
0.8340552, -0.2777786, 0.1281981, 1, 1, 1, 1, 1,
0.835465, 0.7389609, 1.418458, 1, 1, 1, 1, 1,
0.8410821, -2.026743, 2.908462, 1, 1, 1, 1, 1,
0.8452052, 0.3704044, 1.927829, 1, 1, 1, 1, 1,
0.8455072, -0.1925382, 2.568177, 1, 1, 1, 1, 1,
0.8482603, -0.8809211, 1.699273, 1, 1, 1, 1, 1,
0.8515184, 0.5063825, 1.134789, 1, 1, 1, 1, 1,
0.8542836, 1.985025, -0.2727554, 1, 1, 1, 1, 1,
0.858414, -0.7979876, 1.203522, 1, 1, 1, 1, 1,
0.8677442, -0.8351682, 1.311292, 1, 1, 1, 1, 1,
0.8691239, -0.02318257, 2.471438, 1, 1, 1, 1, 1,
0.8694535, 0.1048307, 2.92818, 0, 0, 1, 1, 1,
0.8715044, -0.02759954, 2.725043, 1, 0, 0, 1, 1,
0.8719475, 0.2809119, 0.7219954, 1, 0, 0, 1, 1,
0.8769144, 0.8433852, 1.439839, 1, 0, 0, 1, 1,
0.8773206, -0.5649635, 1.840649, 1, 0, 0, 1, 1,
0.8881872, -0.05730831, 1.769825, 1, 0, 0, 1, 1,
0.8949283, -0.9562464, 1.29426, 0, 0, 0, 1, 1,
0.8961617, -0.3719555, 0.1527853, 0, 0, 0, 1, 1,
0.8973383, -1.116966, 0.6013244, 0, 0, 0, 1, 1,
0.8999965, -0.4484806, 1.126962, 0, 0, 0, 1, 1,
0.902054, -1.794336, 2.795643, 0, 0, 0, 1, 1,
0.9025161, 0.4846087, 1.104184, 0, 0, 0, 1, 1,
0.9054031, -0.9623059, 0.6567404, 0, 0, 0, 1, 1,
0.9057572, 0.05775367, 0.8671499, 1, 1, 1, 1, 1,
0.9069893, 0.5745484, 0.3488717, 1, 1, 1, 1, 1,
0.9074158, -1.733104, 4.593733, 1, 1, 1, 1, 1,
0.9164095, -0.4146639, 2.586903, 1, 1, 1, 1, 1,
0.922619, -0.2344748, 2.333579, 1, 1, 1, 1, 1,
0.9262636, -0.5880627, 1.148246, 1, 1, 1, 1, 1,
0.9313291, 0.7318437, -0.4904502, 1, 1, 1, 1, 1,
0.9315568, -0.5487435, 2.728948, 1, 1, 1, 1, 1,
0.9433789, -0.6177538, 2.90046, 1, 1, 1, 1, 1,
0.9513005, -0.2315638, 2.00017, 1, 1, 1, 1, 1,
0.951537, 0.6521838, 2.648563, 1, 1, 1, 1, 1,
0.9557763, -1.316691, 2.293507, 1, 1, 1, 1, 1,
0.9608546, -0.237576, 3.107441, 1, 1, 1, 1, 1,
0.9609448, 1.132307, 0.5077972, 1, 1, 1, 1, 1,
0.9624407, -1.155926, 2.031564, 1, 1, 1, 1, 1,
0.9643329, -0.9285172, 4.215035, 0, 0, 1, 1, 1,
0.9670499, -0.8233923, 2.830828, 1, 0, 0, 1, 1,
0.9674456, 0.3856261, 0.5043421, 1, 0, 0, 1, 1,
0.9677904, 0.4543179, 1.400421, 1, 0, 0, 1, 1,
0.9722988, -0.4327787, 2.337075, 1, 0, 0, 1, 1,
0.9864818, 0.1872979, 0.6969317, 1, 0, 0, 1, 1,
0.9911798, 0.1530506, 1.152325, 0, 0, 0, 1, 1,
0.9952205, -2.600883, 2.04319, 0, 0, 0, 1, 1,
0.9973269, -0.6960935, 1.306861, 0, 0, 0, 1, 1,
0.9995293, 0.5241225, 0.1923376, 0, 0, 0, 1, 1,
1.000868, 0.3167154, 0.5206382, 0, 0, 0, 1, 1,
1.002509, 2.145187, 0.2829123, 0, 0, 0, 1, 1,
1.016126, -0.8672192, 1.413912, 0, 0, 0, 1, 1,
1.020673, 0.5885304, 2.069135, 1, 1, 1, 1, 1,
1.021818, 1.105832, 0.2016802, 1, 1, 1, 1, 1,
1.029403, -1.905858, 3.763044, 1, 1, 1, 1, 1,
1.030357, -1.857565, 1.32959, 1, 1, 1, 1, 1,
1.039482, -0.048172, -0.2163058, 1, 1, 1, 1, 1,
1.056161, -0.687705, 1.552068, 1, 1, 1, 1, 1,
1.05873, -0.8785897, 4.382612, 1, 1, 1, 1, 1,
1.062608, -1.530419, 2.006113, 1, 1, 1, 1, 1,
1.074886, 0.8150491, 0.5092704, 1, 1, 1, 1, 1,
1.081896, 0.6661261, 2.043859, 1, 1, 1, 1, 1,
1.085813, 0.7152408, 0.9795272, 1, 1, 1, 1, 1,
1.086709, -0.1230496, 0.4087794, 1, 1, 1, 1, 1,
1.110518, -0.378533, 0.8375401, 1, 1, 1, 1, 1,
1.112035, -0.6518399, 2.957026, 1, 1, 1, 1, 1,
1.117989, 0.8017583, 1.847157, 1, 1, 1, 1, 1,
1.118426, 1.315673, 1.469652, 0, 0, 1, 1, 1,
1.133828, -1.73043, 4.068767, 1, 0, 0, 1, 1,
1.155782, 0.6833404, 0.5838717, 1, 0, 0, 1, 1,
1.162959, -0.6044096, 2.790873, 1, 0, 0, 1, 1,
1.172632, -1.12948, 2.370987, 1, 0, 0, 1, 1,
1.181321, -0.656713, 1.986839, 1, 0, 0, 1, 1,
1.188376, -0.02127816, 2.504009, 0, 0, 0, 1, 1,
1.202636, -0.09038103, 1.284745, 0, 0, 0, 1, 1,
1.204543, -1.377159, 2.267521, 0, 0, 0, 1, 1,
1.20591, 0.3609022, 2.431352, 0, 0, 0, 1, 1,
1.209326, 0.2738278, 1.800306, 0, 0, 0, 1, 1,
1.223556, -0.2136932, 2.694217, 0, 0, 0, 1, 1,
1.224825, 0.251466, 2.343996, 0, 0, 0, 1, 1,
1.233459, 0.6681311, 0.1788994, 1, 1, 1, 1, 1,
1.237212, 0.1471736, 2.372768, 1, 1, 1, 1, 1,
1.238043, 0.9541377, 1.079023, 1, 1, 1, 1, 1,
1.247629, -0.3618584, 1.40508, 1, 1, 1, 1, 1,
1.247704, 2.596894, 0.08547527, 1, 1, 1, 1, 1,
1.257421, -0.3533813, 4.264862, 1, 1, 1, 1, 1,
1.275937, -0.5635825, 0.08835972, 1, 1, 1, 1, 1,
1.283696, -0.1030341, 1.102029, 1, 1, 1, 1, 1,
1.287963, -0.5078354, -0.189945, 1, 1, 1, 1, 1,
1.288128, -0.8760884, 2.64681, 1, 1, 1, 1, 1,
1.290376, 0.4911598, 2.854265, 1, 1, 1, 1, 1,
1.305489, -1.115748, 1.608203, 1, 1, 1, 1, 1,
1.320063, -1.463098, 2.077507, 1, 1, 1, 1, 1,
1.323239, -0.01160455, 1.717081, 1, 1, 1, 1, 1,
1.324399, 0.2699678, 3.218066, 1, 1, 1, 1, 1,
1.326633, 0.3498977, 0.6916295, 0, 0, 1, 1, 1,
1.328172, 0.1210217, -0.2810032, 1, 0, 0, 1, 1,
1.328243, 1.145109, -0.08889332, 1, 0, 0, 1, 1,
1.328658, 2.44924, 0.3077542, 1, 0, 0, 1, 1,
1.330085, -1.141176, 1.380657, 1, 0, 0, 1, 1,
1.332838, 0.1648269, 2.52406, 1, 0, 0, 1, 1,
1.339442, -0.9956565, 2.279037, 0, 0, 0, 1, 1,
1.343158, 0.2282002, -0.2184449, 0, 0, 0, 1, 1,
1.353453, 0.2313773, 2.338779, 0, 0, 0, 1, 1,
1.359169, -1.033688, 1.857939, 0, 0, 0, 1, 1,
1.362926, -0.04794613, 2.541778, 0, 0, 0, 1, 1,
1.37228, -0.420729, 1.56095, 0, 0, 0, 1, 1,
1.37368, 0.008092398, 1.758896, 0, 0, 0, 1, 1,
1.374727, -0.8115676, 2.447463, 1, 1, 1, 1, 1,
1.378341, 1.326546, 1.046564, 1, 1, 1, 1, 1,
1.396227, -0.4866884, 2.078068, 1, 1, 1, 1, 1,
1.396562, 1.399665, 0.4067523, 1, 1, 1, 1, 1,
1.400659, -1.063571, 2.206694, 1, 1, 1, 1, 1,
1.411424, 0.6342517, 0.07163958, 1, 1, 1, 1, 1,
1.419374, -0.9428272, 2.571575, 1, 1, 1, 1, 1,
1.419379, -0.1128581, 0.02193532, 1, 1, 1, 1, 1,
1.424901, -1.653142, 2.823774, 1, 1, 1, 1, 1,
1.427934, 0.1530201, 1.01213, 1, 1, 1, 1, 1,
1.428872, -0.09508553, 1.067904, 1, 1, 1, 1, 1,
1.435146, 1.009834, 2.026733, 1, 1, 1, 1, 1,
1.436699, -2.129438, 1.398093, 1, 1, 1, 1, 1,
1.441538, 0.3064559, 1.951437, 1, 1, 1, 1, 1,
1.441677, 0.4150166, 0.2881564, 1, 1, 1, 1, 1,
1.442765, 1.378813, -0.4833494, 0, 0, 1, 1, 1,
1.44697, 0.3284516, 0.3795857, 1, 0, 0, 1, 1,
1.447832, 1.122887, 1.127846, 1, 0, 0, 1, 1,
1.450251, 0.4365618, 3.51159, 1, 0, 0, 1, 1,
1.455661, 0.2867968, 1.403942, 1, 0, 0, 1, 1,
1.46972, 1.053842, 1.273602, 1, 0, 0, 1, 1,
1.474561, -1.793929, 2.353305, 0, 0, 0, 1, 1,
1.476781, -0.2692863, 3.031426, 0, 0, 0, 1, 1,
1.477939, 0.4271685, -0.706639, 0, 0, 0, 1, 1,
1.50013, 0.9807698, 3.020272, 0, 0, 0, 1, 1,
1.502112, 0.2004229, 1.264412, 0, 0, 0, 1, 1,
1.508855, 0.2032763, 0.8149056, 0, 0, 0, 1, 1,
1.509701, -0.00637972, 2.240071, 0, 0, 0, 1, 1,
1.510767, 1.289243, 2.541102, 1, 1, 1, 1, 1,
1.511001, 1.682123, 2.156165, 1, 1, 1, 1, 1,
1.516323, 0.3938169, 0.3149257, 1, 1, 1, 1, 1,
1.519765, 1.16142, -0.02049384, 1, 1, 1, 1, 1,
1.521993, -0.9739082, 2.613939, 1, 1, 1, 1, 1,
1.531006, -0.2381019, 1.159276, 1, 1, 1, 1, 1,
1.536076, 0.7683784, 2.820407, 1, 1, 1, 1, 1,
1.540231, -0.3697384, -0.1475955, 1, 1, 1, 1, 1,
1.5403, -0.8118988, 1.974304, 1, 1, 1, 1, 1,
1.559329, -0.4767319, 2.869914, 1, 1, 1, 1, 1,
1.567454, 0.01085535, 1.667214, 1, 1, 1, 1, 1,
1.57077, 1.30079, 0.5481714, 1, 1, 1, 1, 1,
1.581993, -0.5105244, 2.634977, 1, 1, 1, 1, 1,
1.592322, 0.3009403, 2.01177, 1, 1, 1, 1, 1,
1.620246, 0.501966, 1.329344, 1, 1, 1, 1, 1,
1.627177, -1.342169, 0.9172051, 0, 0, 1, 1, 1,
1.635457, -0.06934512, 2.392126, 1, 0, 0, 1, 1,
1.66472, -0.1457033, 1.469145, 1, 0, 0, 1, 1,
1.669746, -0.6058946, 1.318136, 1, 0, 0, 1, 1,
1.693477, 0.4422762, 0.5549886, 1, 0, 0, 1, 1,
1.705045, 0.5555489, 1.22627, 1, 0, 0, 1, 1,
1.748519, 0.3769558, 0.140186, 0, 0, 0, 1, 1,
1.758192, 1.136528, 1.117384, 0, 0, 0, 1, 1,
1.764087, -0.2835023, 3.344834, 0, 0, 0, 1, 1,
1.784696, 1.018501, 2.239369, 0, 0, 0, 1, 1,
1.794449, 0.8627123, -0.04088528, 0, 0, 0, 1, 1,
1.802371, 0.9848927, -0.2324309, 0, 0, 0, 1, 1,
1.806268, 0.2589189, 1.82629, 0, 0, 0, 1, 1,
1.830515, 0.4635696, 1.475008, 1, 1, 1, 1, 1,
1.834364, -0.6353337, 3.927703, 1, 1, 1, 1, 1,
1.85969, 0.5752776, 0.8809308, 1, 1, 1, 1, 1,
1.864184, 0.8458408, 1.231247, 1, 1, 1, 1, 1,
1.865447, -0.3676512, 2.177142, 1, 1, 1, 1, 1,
1.909098, 1.085572, 1.762457, 1, 1, 1, 1, 1,
1.945746, -0.338935, 1.894812, 1, 1, 1, 1, 1,
1.953856, -1.094688, 1.766511, 1, 1, 1, 1, 1,
1.980666, -0.4550143, -0.2686209, 1, 1, 1, 1, 1,
1.998289, 0.09524914, 1.144685, 1, 1, 1, 1, 1,
2.008425, -0.732379, 0.1348203, 1, 1, 1, 1, 1,
2.042771, 1.292484, 3.711274, 1, 1, 1, 1, 1,
2.071324, -0.7702562, 1.475514, 1, 1, 1, 1, 1,
2.096274, -0.1995296, 2.373896, 1, 1, 1, 1, 1,
2.096869, 0.7091132, 0.5010207, 1, 1, 1, 1, 1,
2.105561, -0.2793996, 2.050611, 0, 0, 1, 1, 1,
2.16687, 0.03774202, 2.188326, 1, 0, 0, 1, 1,
2.205714, -0.03202156, 2.335855, 1, 0, 0, 1, 1,
2.232623, 0.1961915, 2.589111, 1, 0, 0, 1, 1,
2.235603, 0.5429612, -1.011274, 1, 0, 0, 1, 1,
2.253503, 1.508044, 0.7654358, 1, 0, 0, 1, 1,
2.263321, -1.433824, 1.249606, 0, 0, 0, 1, 1,
2.285617, -0.6198164, 1.52835, 0, 0, 0, 1, 1,
2.329017, -0.04893369, 0.5273553, 0, 0, 0, 1, 1,
2.333679, 0.01436861, 0.6470188, 0, 0, 0, 1, 1,
2.342206, 0.4532897, 0.8914887, 0, 0, 0, 1, 1,
2.361082, 0.2834818, 1.193733, 0, 0, 0, 1, 1,
2.419322, 0.6733239, 1.574458, 0, 0, 0, 1, 1,
2.545842, 0.9364474, 3.317607, 1, 1, 1, 1, 1,
2.649184, -0.4165043, 1.117411, 1, 1, 1, 1, 1,
2.651078, 1.143499, 0.7270662, 1, 1, 1, 1, 1,
3.023346, 0.6536385, 0.4375415, 1, 1, 1, 1, 1,
3.155415, 0.8010566, -0.7859957, 1, 1, 1, 1, 1,
3.325548, 0.04517223, 1.590585, 1, 1, 1, 1, 1,
3.642481, 0.2513921, 2.556719, 1, 1, 1, 1, 1
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
var radius = 9.693712;
var distance = 34.04875;
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
mvMatrix.translate( 0.1673508, 0.3203042, 0.08760262 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04875);
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
