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
-2.943866, -1.380762, -3.525463, 1, 0, 0, 1,
-2.824505, 0.5886544, -3.542068, 1, 0.007843138, 0, 1,
-2.752815, 0.877534, 0.03332081, 1, 0.01176471, 0, 1,
-2.751808, -1.582133, -2.294344, 1, 0.01960784, 0, 1,
-2.704069, -0.4663227, -1.616508, 1, 0.02352941, 0, 1,
-2.618365, -1.21981, -0.3575381, 1, 0.03137255, 0, 1,
-2.470345, 0.1677229, -2.566582, 1, 0.03529412, 0, 1,
-2.427711, -1.264263, -2.705748, 1, 0.04313726, 0, 1,
-2.416558, 1.938506, -2.428256, 1, 0.04705882, 0, 1,
-2.380754, -1.130377, -2.701147, 1, 0.05490196, 0, 1,
-2.206651, -0.4877255, -0.9882178, 1, 0.05882353, 0, 1,
-2.18927, 1.379141, -3.041851, 1, 0.06666667, 0, 1,
-2.181509, 0.7386721, -1.834847, 1, 0.07058824, 0, 1,
-2.157487, 0.2741855, 0.2750617, 1, 0.07843138, 0, 1,
-2.14917, 0.05412246, -2.062711, 1, 0.08235294, 0, 1,
-2.14184, 0.6186548, -2.503363, 1, 0.09019608, 0, 1,
-2.131911, -0.0850647, -1.893594, 1, 0.09411765, 0, 1,
-2.108452, 0.6402045, -1.872621, 1, 0.1019608, 0, 1,
-2.095036, 0.7612802, -1.977064, 1, 0.1098039, 0, 1,
-2.094091, -0.5142429, -3.013005, 1, 0.1137255, 0, 1,
-2.062109, -0.5786753, -2.39301, 1, 0.1215686, 0, 1,
-2.041377, 0.2299745, -3.092252, 1, 0.1254902, 0, 1,
-2.038359, 0.9641682, -1.457989, 1, 0.1333333, 0, 1,
-2.038192, 1.412062, -0.4972681, 1, 0.1372549, 0, 1,
-2.029852, -0.987946, -4.007739, 1, 0.145098, 0, 1,
-2.01684, 1.13489, 0.3027327, 1, 0.1490196, 0, 1,
-2.011977, 0.4400516, -1.159315, 1, 0.1568628, 0, 1,
-1.987957, 0.8672124, -2.121326, 1, 0.1607843, 0, 1,
-1.985322, -0.6006116, -3.128907, 1, 0.1686275, 0, 1,
-1.984771, -0.5180646, -2.040443, 1, 0.172549, 0, 1,
-1.969709, -0.8717625, -1.903204, 1, 0.1803922, 0, 1,
-1.963903, 0.8822724, -3.970878, 1, 0.1843137, 0, 1,
-1.9576, 0.1077909, -0.9613509, 1, 0.1921569, 0, 1,
-1.954473, -0.45912, -1.575121, 1, 0.1960784, 0, 1,
-1.902198, -1.011038, -2.006652, 1, 0.2039216, 0, 1,
-1.886379, -1.024827, -0.1519966, 1, 0.2117647, 0, 1,
-1.87901, 1.808789, -1.524674, 1, 0.2156863, 0, 1,
-1.865003, -0.6313384, -1.600164, 1, 0.2235294, 0, 1,
-1.838521, -0.6065792, -1.882542, 1, 0.227451, 0, 1,
-1.830651, -0.7614287, -1.010772, 1, 0.2352941, 0, 1,
-1.827278, -1.511483, -3.427734, 1, 0.2392157, 0, 1,
-1.802968, -0.3508894, -1.750647, 1, 0.2470588, 0, 1,
-1.799797, 2.059993, -0.8912515, 1, 0.2509804, 0, 1,
-1.793844, -0.4604596, -3.605728, 1, 0.2588235, 0, 1,
-1.793708, 0.2851076, -0.3632397, 1, 0.2627451, 0, 1,
-1.792151, 0.5462035, -2.46573, 1, 0.2705882, 0, 1,
-1.785384, 0.3371648, 0.2257953, 1, 0.2745098, 0, 1,
-1.771812, 1.637176, -1.875924, 1, 0.282353, 0, 1,
-1.762396, 0.8571451, -1.530514, 1, 0.2862745, 0, 1,
-1.747415, 0.5173969, 0.1923045, 1, 0.2941177, 0, 1,
-1.725958, 0.2955772, -0.3977076, 1, 0.3019608, 0, 1,
-1.722775, -0.5252938, -2.884993, 1, 0.3058824, 0, 1,
-1.710451, 0.03204751, -2.518417, 1, 0.3137255, 0, 1,
-1.67549, -0.08456796, -0.3884981, 1, 0.3176471, 0, 1,
-1.670509, 0.7386943, 0.7809715, 1, 0.3254902, 0, 1,
-1.666483, 0.6250631, -0.3080498, 1, 0.3294118, 0, 1,
-1.652685, 0.2527412, -1.363855, 1, 0.3372549, 0, 1,
-1.647342, -2.924512, -0.8178981, 1, 0.3411765, 0, 1,
-1.621665, 0.1087824, -0.8960213, 1, 0.3490196, 0, 1,
-1.607072, -1.020732, -3.890518, 1, 0.3529412, 0, 1,
-1.601444, -0.4623235, -1.584843, 1, 0.3607843, 0, 1,
-1.598162, -0.5777391, -1.35538, 1, 0.3647059, 0, 1,
-1.584026, 0.5947777, -0.4258173, 1, 0.372549, 0, 1,
-1.569555, -0.2698905, -3.412498, 1, 0.3764706, 0, 1,
-1.569347, -2.25664, -2.018662, 1, 0.3843137, 0, 1,
-1.563481, 0.01917076, -1.374568, 1, 0.3882353, 0, 1,
-1.561447, -0.637943, -2.721937, 1, 0.3960784, 0, 1,
-1.543495, 0.5331164, 0.2540737, 1, 0.4039216, 0, 1,
-1.535607, 0.5349681, -1.444493, 1, 0.4078431, 0, 1,
-1.5309, 0.3355725, -0.02670781, 1, 0.4156863, 0, 1,
-1.511696, -1.209568, -2.160113, 1, 0.4196078, 0, 1,
-1.511619, 0.4766346, -3.140154, 1, 0.427451, 0, 1,
-1.50017, 2.185464, 1.712583, 1, 0.4313726, 0, 1,
-1.499294, 1.231305, -3.942039, 1, 0.4392157, 0, 1,
-1.492913, 1.185418, -2.367031, 1, 0.4431373, 0, 1,
-1.476436, 0.6285362, -0.3214396, 1, 0.4509804, 0, 1,
-1.471617, -0.5151541, -1.394268, 1, 0.454902, 0, 1,
-1.471127, 0.5317634, -1.656436, 1, 0.4627451, 0, 1,
-1.465789, 0.7644531, -0.3957345, 1, 0.4666667, 0, 1,
-1.463865, -0.3819212, -2.720767, 1, 0.4745098, 0, 1,
-1.460516, -0.02343923, -2.337959, 1, 0.4784314, 0, 1,
-1.450677, -0.3192524, -1.675968, 1, 0.4862745, 0, 1,
-1.442933, -0.1781156, -1.95142, 1, 0.4901961, 0, 1,
-1.44136, 0.2870919, -1.963904, 1, 0.4980392, 0, 1,
-1.43295, -1.258416, -3.174968, 1, 0.5058824, 0, 1,
-1.427837, -0.04236868, -0.5390309, 1, 0.509804, 0, 1,
-1.416159, -0.09244517, -1.101694, 1, 0.5176471, 0, 1,
-1.412174, 0.3362676, 0.7230698, 1, 0.5215687, 0, 1,
-1.407466, -0.5231248, -1.107134, 1, 0.5294118, 0, 1,
-1.389751, -0.9354124, -1.129985, 1, 0.5333334, 0, 1,
-1.376402, -0.8463725, -2.618236, 1, 0.5411765, 0, 1,
-1.375064, -0.8849085, -3.549023, 1, 0.5450981, 0, 1,
-1.369903, -0.9545841, -1.738507, 1, 0.5529412, 0, 1,
-1.369106, 0.2991894, -0.441821, 1, 0.5568628, 0, 1,
-1.358902, -0.3961019, -2.046139, 1, 0.5647059, 0, 1,
-1.353128, 0.05907224, -2.405128, 1, 0.5686275, 0, 1,
-1.323666, -0.4538427, -0.7955588, 1, 0.5764706, 0, 1,
-1.322524, 0.7370697, -1.237238, 1, 0.5803922, 0, 1,
-1.310941, 1.001236, -3.417689, 1, 0.5882353, 0, 1,
-1.307736, 0.5280899, 0.5363292, 1, 0.5921569, 0, 1,
-1.29683, 0.4216585, -1.120917, 1, 0.6, 0, 1,
-1.29304, 2.659107, -1.58298, 1, 0.6078432, 0, 1,
-1.292726, -0.5744836, 1.615198, 1, 0.6117647, 0, 1,
-1.289452, -0.490136, -2.222157, 1, 0.6196079, 0, 1,
-1.288657, 0.8152064, -1.6426, 1, 0.6235294, 0, 1,
-1.288029, 0.1011991, -2.407099, 1, 0.6313726, 0, 1,
-1.284562, 0.2662369, -2.404846, 1, 0.6352941, 0, 1,
-1.281022, 0.3034863, -1.736373, 1, 0.6431373, 0, 1,
-1.278952, 0.5292574, -1.691707, 1, 0.6470588, 0, 1,
-1.269619, -0.02136941, -1.536479, 1, 0.654902, 0, 1,
-1.255989, -0.4865698, -1.46139, 1, 0.6588235, 0, 1,
-1.254763, -1.803713, -2.97983, 1, 0.6666667, 0, 1,
-1.246676, 0.6377718, -1.208646, 1, 0.6705883, 0, 1,
-1.243408, -1.376377, -3.282829, 1, 0.6784314, 0, 1,
-1.238572, -1.046963, -0.4699454, 1, 0.682353, 0, 1,
-1.234853, 0.003033525, -4.462853, 1, 0.6901961, 0, 1,
-1.234443, 1.68375, -0.4427958, 1, 0.6941177, 0, 1,
-1.234128, -1.605115, -1.934987, 1, 0.7019608, 0, 1,
-1.234053, 1.523708, -1.881889, 1, 0.7098039, 0, 1,
-1.227275, -0.4700768, -1.457912, 1, 0.7137255, 0, 1,
-1.219171, -0.4438659, -1.202166, 1, 0.7215686, 0, 1,
-1.214785, -0.6240699, 0.5595834, 1, 0.7254902, 0, 1,
-1.185742, -0.1223538, -2.874076, 1, 0.7333333, 0, 1,
-1.184385, -0.4491697, -1.104975, 1, 0.7372549, 0, 1,
-1.181647, -0.2239641, -1.579725, 1, 0.7450981, 0, 1,
-1.171106, 2.567427, -1.063928, 1, 0.7490196, 0, 1,
-1.159509, -1.297404, -2.851611, 1, 0.7568628, 0, 1,
-1.150619, 2.046495, 0.8704187, 1, 0.7607843, 0, 1,
-1.150133, 1.126723, -0.5924894, 1, 0.7686275, 0, 1,
-1.143848, -0.8139618, -1.258188, 1, 0.772549, 0, 1,
-1.124987, -0.9934506, -2.201565, 1, 0.7803922, 0, 1,
-1.11604, -0.08965649, -0.6625865, 1, 0.7843137, 0, 1,
-1.116008, -0.2690941, -1.079728, 1, 0.7921569, 0, 1,
-1.114768, -0.4791018, -1.785845, 1, 0.7960784, 0, 1,
-1.108265, 0.07720498, 0.124643, 1, 0.8039216, 0, 1,
-1.106344, -0.05841054, -1.279708, 1, 0.8117647, 0, 1,
-1.104286, 0.7163355, -1.524602, 1, 0.8156863, 0, 1,
-1.103833, -1.573622, -4.211637, 1, 0.8235294, 0, 1,
-1.102468, 0.4304057, -0.5935546, 1, 0.827451, 0, 1,
-1.093117, -1.090928, -1.345255, 1, 0.8352941, 0, 1,
-1.091305, -2.254756, -3.404095, 1, 0.8392157, 0, 1,
-1.081622, -0.08289674, -2.121469, 1, 0.8470588, 0, 1,
-1.081604, 0.1033806, -4.14969, 1, 0.8509804, 0, 1,
-1.071931, 0.9437752, 0.0121983, 1, 0.8588235, 0, 1,
-1.065715, 0.57617, -0.9760366, 1, 0.8627451, 0, 1,
-1.062482, -0.161131, -1.63093, 1, 0.8705882, 0, 1,
-1.050954, -2.318079, -3.152496, 1, 0.8745098, 0, 1,
-1.050493, 0.3636234, -0.6135122, 1, 0.8823529, 0, 1,
-1.048975, 1.215133, -1.859805, 1, 0.8862745, 0, 1,
-1.044464, 0.3511941, -0.5318589, 1, 0.8941177, 0, 1,
-1.043725, 2.183475, -1.11367, 1, 0.8980392, 0, 1,
-1.036934, 1.711823, 0.6658762, 1, 0.9058824, 0, 1,
-1.031567, -0.0319845, -1.208786, 1, 0.9137255, 0, 1,
-1.028885, 1.43078, -2.190387, 1, 0.9176471, 0, 1,
-1.025486, -1.1638, -3.197845, 1, 0.9254902, 0, 1,
-1.024245, 0.6043919, -0.2084467, 1, 0.9294118, 0, 1,
-1.02416, 0.07090212, 0.3897998, 1, 0.9372549, 0, 1,
-1.020218, -1.255429, -2.391529, 1, 0.9411765, 0, 1,
-1.017059, 0.1009794, -2.480995, 1, 0.9490196, 0, 1,
-1.004766, -1.213754, -1.952361, 1, 0.9529412, 0, 1,
-1.002619, -0.7401298, -3.886691, 1, 0.9607843, 0, 1,
-1.000097, -1.68921, -2.124123, 1, 0.9647059, 0, 1,
-0.9989303, 0.1719348, -1.159556, 1, 0.972549, 0, 1,
-0.9981958, 0.6167057, -0.7665245, 1, 0.9764706, 0, 1,
-0.9930582, 1.165127, 0.2445969, 1, 0.9843137, 0, 1,
-0.9924316, 0.3292407, -2.026608, 1, 0.9882353, 0, 1,
-0.9884287, 0.3023221, -3.506098, 1, 0.9960784, 0, 1,
-0.9875332, -0.3157096, -2.251362, 0.9960784, 1, 0, 1,
-0.9755656, -0.7801601, -2.827328, 0.9921569, 1, 0, 1,
-0.9740093, -0.2966446, -1.346846, 0.9843137, 1, 0, 1,
-0.9681951, -0.7540958, -3.233803, 0.9803922, 1, 0, 1,
-0.9605367, -0.4820748, -2.769472, 0.972549, 1, 0, 1,
-0.9525045, -0.05732881, -2.074433, 0.9686275, 1, 0, 1,
-0.9498271, 0.7908865, 0.01199641, 0.9607843, 1, 0, 1,
-0.947695, 0.8593288, 0.5769563, 0.9568627, 1, 0, 1,
-0.9470482, 1.071765, 0.09464088, 0.9490196, 1, 0, 1,
-0.944995, -1.466274, -1.551567, 0.945098, 1, 0, 1,
-0.9422706, 0.6291881, -0.6885848, 0.9372549, 1, 0, 1,
-0.9417396, 1.265571, -0.3806556, 0.9333333, 1, 0, 1,
-0.9395936, -0.3919022, -2.367483, 0.9254902, 1, 0, 1,
-0.9358454, 1.20873, 0.4703138, 0.9215686, 1, 0, 1,
-0.9317601, -1.641178, -2.255569, 0.9137255, 1, 0, 1,
-0.9266074, 0.9260687, -1.217857, 0.9098039, 1, 0, 1,
-0.9082206, 1.017436, 1.700993, 0.9019608, 1, 0, 1,
-0.9052384, 0.2024719, -1.102413, 0.8941177, 1, 0, 1,
-0.9030638, 0.9498601, -1.486044, 0.8901961, 1, 0, 1,
-0.8983781, -0.4976111, -1.058262, 0.8823529, 1, 0, 1,
-0.8920929, 0.5760366, 0.2312444, 0.8784314, 1, 0, 1,
-0.8920556, -0.02496814, -1.420788, 0.8705882, 1, 0, 1,
-0.8867303, 0.663362, -0.6197961, 0.8666667, 1, 0, 1,
-0.8840417, -0.6361395, -0.9205916, 0.8588235, 1, 0, 1,
-0.8832591, -0.789081, -2.309149, 0.854902, 1, 0, 1,
-0.8795571, 0.993044, 0.298378, 0.8470588, 1, 0, 1,
-0.8690578, 0.05100216, -1.488024, 0.8431373, 1, 0, 1,
-0.8626723, -0.8701324, -1.876767, 0.8352941, 1, 0, 1,
-0.8608952, 1.111956, -0.8278955, 0.8313726, 1, 0, 1,
-0.857681, -1.190958, -2.945021, 0.8235294, 1, 0, 1,
-0.8477312, 1.113466, -1.464341, 0.8196079, 1, 0, 1,
-0.8476539, -1.708696, -2.20291, 0.8117647, 1, 0, 1,
-0.8426651, 0.1427328, -0.526125, 0.8078431, 1, 0, 1,
-0.8384361, 0.01469459, -2.203902, 0.8, 1, 0, 1,
-0.8370711, -0.2672151, -0.7214916, 0.7921569, 1, 0, 1,
-0.8356081, -0.5354965, -2.770059, 0.7882353, 1, 0, 1,
-0.8200637, 0.3904659, -2.707652, 0.7803922, 1, 0, 1,
-0.819997, 0.4243484, -1.028753, 0.7764706, 1, 0, 1,
-0.8197609, -0.7822906, -1.947441, 0.7686275, 1, 0, 1,
-0.8171616, -1.85572, -3.327014, 0.7647059, 1, 0, 1,
-0.8123326, 0.1051357, -0.7889089, 0.7568628, 1, 0, 1,
-0.8075817, 0.2015189, -0.8910962, 0.7529412, 1, 0, 1,
-0.8051382, 1.291947, -0.335195, 0.7450981, 1, 0, 1,
-0.7942876, 0.3848126, -0.2730568, 0.7411765, 1, 0, 1,
-0.7912558, 0.6417397, -0.6628587, 0.7333333, 1, 0, 1,
-0.7903524, 0.9244106, -2.399875, 0.7294118, 1, 0, 1,
-0.7892179, 0.4871036, -1.825786, 0.7215686, 1, 0, 1,
-0.788076, 0.2078064, -1.459192, 0.7176471, 1, 0, 1,
-0.7866415, -0.3171905, -2.899479, 0.7098039, 1, 0, 1,
-0.7803265, -0.1967433, -1.611018, 0.7058824, 1, 0, 1,
-0.7793704, 0.9357237, -2.394317, 0.6980392, 1, 0, 1,
-0.7740354, 0.01280579, -0.8212435, 0.6901961, 1, 0, 1,
-0.7701283, 0.6805991, 0.003266609, 0.6862745, 1, 0, 1,
-0.7698255, -0.6074887, -1.586405, 0.6784314, 1, 0, 1,
-0.7683286, 0.7591764, 0.1254394, 0.6745098, 1, 0, 1,
-0.7616793, -0.8887008, -1.977834, 0.6666667, 1, 0, 1,
-0.7610663, 1.291604, -0.3107436, 0.6627451, 1, 0, 1,
-0.7608351, 0.6282359, -1.649816, 0.654902, 1, 0, 1,
-0.7592936, 1.072909, -0.5885196, 0.6509804, 1, 0, 1,
-0.7569792, -0.1872972, -2.898919, 0.6431373, 1, 0, 1,
-0.7540677, -1.192372, -2.678549, 0.6392157, 1, 0, 1,
-0.7526088, 1.105276, -1.236655, 0.6313726, 1, 0, 1,
-0.7510846, -0.6456139, -1.721533, 0.627451, 1, 0, 1,
-0.7385609, -1.429409, -0.5085076, 0.6196079, 1, 0, 1,
-0.7384549, -0.03456154, -1.631305, 0.6156863, 1, 0, 1,
-0.7356451, 0.6468919, -1.31882, 0.6078432, 1, 0, 1,
-0.7341067, 2.425204, -0.0120233, 0.6039216, 1, 0, 1,
-0.7335219, -1.734824, -3.566065, 0.5960785, 1, 0, 1,
-0.7318863, -1.380092, -3.636733, 0.5882353, 1, 0, 1,
-0.7251696, -1.277812, -2.890164, 0.5843138, 1, 0, 1,
-0.7230268, -1.573803, -4.280529, 0.5764706, 1, 0, 1,
-0.7218571, 0.7329673, -0.5603864, 0.572549, 1, 0, 1,
-0.7216319, 0.6390169, 0.7718562, 0.5647059, 1, 0, 1,
-0.7215352, -0.3595921, -1.420737, 0.5607843, 1, 0, 1,
-0.7171628, 0.4794717, -0.9130635, 0.5529412, 1, 0, 1,
-0.716546, -1.149812, -3.232287, 0.5490196, 1, 0, 1,
-0.7148443, -0.2552326, -1.636218, 0.5411765, 1, 0, 1,
-0.7103311, -0.1054851, -3.828625, 0.5372549, 1, 0, 1,
-0.7099658, 1.139057, -0.7627071, 0.5294118, 1, 0, 1,
-0.7092256, 1.289616, 0.6994408, 0.5254902, 1, 0, 1,
-0.7058012, -0.3614917, -1.917932, 0.5176471, 1, 0, 1,
-0.6948604, -1.01292, -3.014287, 0.5137255, 1, 0, 1,
-0.6925643, 0.02049269, -2.381394, 0.5058824, 1, 0, 1,
-0.6925367, -2.002086, -0.6788792, 0.5019608, 1, 0, 1,
-0.6913062, 1.599917, -0.2149004, 0.4941176, 1, 0, 1,
-0.689912, 0.6474705, -1.167166, 0.4862745, 1, 0, 1,
-0.6861597, -0.8996292, -3.390519, 0.4823529, 1, 0, 1,
-0.6842945, -0.7724135, -0.8496585, 0.4745098, 1, 0, 1,
-0.6810313, -2.129614, -4.039725, 0.4705882, 1, 0, 1,
-0.6764621, 0.8956435, -0.5882605, 0.4627451, 1, 0, 1,
-0.6742561, -0.8601909, -1.430586, 0.4588235, 1, 0, 1,
-0.6732662, 0.7832924, -0.82387, 0.4509804, 1, 0, 1,
-0.6645077, -0.1629721, -2.65691, 0.4470588, 1, 0, 1,
-0.6571923, 0.3077283, -2.410542, 0.4392157, 1, 0, 1,
-0.6535466, -0.3704687, -3.61571, 0.4352941, 1, 0, 1,
-0.6535055, 0.9841053, 0.1036346, 0.427451, 1, 0, 1,
-0.6534079, 0.4214557, -1.03345, 0.4235294, 1, 0, 1,
-0.653302, -0.05870542, -1.67393, 0.4156863, 1, 0, 1,
-0.6417389, 1.987315, 1.371611, 0.4117647, 1, 0, 1,
-0.6404827, 0.350618, -2.127292, 0.4039216, 1, 0, 1,
-0.6350074, 0.2050471, -0.7249323, 0.3960784, 1, 0, 1,
-0.63269, 0.7652819, -1.73985, 0.3921569, 1, 0, 1,
-0.6321194, 1.430013, 0.6460487, 0.3843137, 1, 0, 1,
-0.6318983, 0.6951507, 0.2781701, 0.3803922, 1, 0, 1,
-0.6307742, 0.5200095, 0.1541214, 0.372549, 1, 0, 1,
-0.6253456, -1.032331, -3.956643, 0.3686275, 1, 0, 1,
-0.6243919, 1.090989, -0.08899233, 0.3607843, 1, 0, 1,
-0.6209731, 0.6996502, -1.827584, 0.3568628, 1, 0, 1,
-0.6209067, 0.6417297, 0.8407961, 0.3490196, 1, 0, 1,
-0.6173799, 1.24149, -1.739627, 0.345098, 1, 0, 1,
-0.6154843, 1.130948, 0.2321395, 0.3372549, 1, 0, 1,
-0.6107268, 0.691552, -1.606057, 0.3333333, 1, 0, 1,
-0.6098537, 0.5443367, -1.749882, 0.3254902, 1, 0, 1,
-0.6013457, -0.6691931, -1.625836, 0.3215686, 1, 0, 1,
-0.6003439, -0.03541566, -1.309651, 0.3137255, 1, 0, 1,
-0.5992032, 1.22788, -1.274324, 0.3098039, 1, 0, 1,
-0.596101, -0.8807673, -1.425843, 0.3019608, 1, 0, 1,
-0.5941462, -0.5316751, -1.491066, 0.2941177, 1, 0, 1,
-0.5918823, 0.1066049, -0.5294015, 0.2901961, 1, 0, 1,
-0.5914542, 2.237822, -1.80793, 0.282353, 1, 0, 1,
-0.5880925, -1.094442, -2.989611, 0.2784314, 1, 0, 1,
-0.5878431, 0.1393248, -0.749597, 0.2705882, 1, 0, 1,
-0.5861044, -0.3632532, -1.884363, 0.2666667, 1, 0, 1,
-0.5860227, 0.154711, -2.202479, 0.2588235, 1, 0, 1,
-0.5857154, 0.5734978, -0.7164505, 0.254902, 1, 0, 1,
-0.5846238, 0.2623127, -0.01864766, 0.2470588, 1, 0, 1,
-0.580301, -0.8038164, -1.324479, 0.2431373, 1, 0, 1,
-0.5772098, -0.5480387, -3.641039, 0.2352941, 1, 0, 1,
-0.5704193, -0.2354869, -3.607492, 0.2313726, 1, 0, 1,
-0.5653298, -0.7609036, -1.27231, 0.2235294, 1, 0, 1,
-0.564377, -0.8376848, -3.172195, 0.2196078, 1, 0, 1,
-0.5567628, 0.4632357, -0.5168689, 0.2117647, 1, 0, 1,
-0.5557796, -0.2314046, -0.2372253, 0.2078431, 1, 0, 1,
-0.5545112, -0.5735286, -3.160842, 0.2, 1, 0, 1,
-0.5516806, -0.865822, -4.069266, 0.1921569, 1, 0, 1,
-0.5508557, 1.774639, -0.5048751, 0.1882353, 1, 0, 1,
-0.5421365, -1.75025, -2.01087, 0.1803922, 1, 0, 1,
-0.53881, -1.218567, -3.999004, 0.1764706, 1, 0, 1,
-0.5382769, -0.4396121, -2.103335, 0.1686275, 1, 0, 1,
-0.5352684, -0.01779654, -0.3663021, 0.1647059, 1, 0, 1,
-0.5261728, 0.8369406, -0.8494475, 0.1568628, 1, 0, 1,
-0.524693, -0.6885064, -3.028286, 0.1529412, 1, 0, 1,
-0.523881, 0.8605477, -0.6370488, 0.145098, 1, 0, 1,
-0.5213063, 1.011788, -0.8746259, 0.1411765, 1, 0, 1,
-0.5179839, 0.147266, -1.62785, 0.1333333, 1, 0, 1,
-0.5177129, -0.4342714, -2.907644, 0.1294118, 1, 0, 1,
-0.5120808, -0.9252538, -0.3386247, 0.1215686, 1, 0, 1,
-0.5120171, -0.3644267, -1.673415, 0.1176471, 1, 0, 1,
-0.5116586, -0.1566931, -2.750529, 0.1098039, 1, 0, 1,
-0.5113581, -0.4310295, -1.839908, 0.1058824, 1, 0, 1,
-0.5085628, -0.4303989, -2.348275, 0.09803922, 1, 0, 1,
-0.506646, 0.0143588, -1.494988, 0.09019608, 1, 0, 1,
-0.5049273, 0.4189574, -1.326512, 0.08627451, 1, 0, 1,
-0.5035384, 0.5057294, -1.508386, 0.07843138, 1, 0, 1,
-0.5024655, 1.593347, -0.2839084, 0.07450981, 1, 0, 1,
-0.501341, 1.400401, -0.7692354, 0.06666667, 1, 0, 1,
-0.5006295, -0.07478755, -1.697953, 0.0627451, 1, 0, 1,
-0.4993921, -0.5831024, -2.026213, 0.05490196, 1, 0, 1,
-0.4990363, 1.290485, -0.2651107, 0.05098039, 1, 0, 1,
-0.4953338, -0.4127406, -4.375832, 0.04313726, 1, 0, 1,
-0.4940941, -0.08550365, -1.14938, 0.03921569, 1, 0, 1,
-0.4921734, -0.8105105, -3.564859, 0.03137255, 1, 0, 1,
-0.4911894, 0.3034993, -1.382248, 0.02745098, 1, 0, 1,
-0.4876875, -0.1303914, -1.168577, 0.01960784, 1, 0, 1,
-0.4862874, -1.269773, -2.904405, 0.01568628, 1, 0, 1,
-0.484361, 0.4322289, -0.01720905, 0.007843138, 1, 0, 1,
-0.4829433, -0.3565657, -1.789362, 0.003921569, 1, 0, 1,
-0.4825471, 1.213275, -2.193157, 0, 1, 0.003921569, 1,
-0.4811498, -0.3763739, -3.438444, 0, 1, 0.01176471, 1,
-0.4794721, -2.06356, -2.289817, 0, 1, 0.01568628, 1,
-0.4766859, 0.2359453, -0.232688, 0, 1, 0.02352941, 1,
-0.4753116, 0.1773619, -2.165709, 0, 1, 0.02745098, 1,
-0.4751526, -0.266689, -1.639905, 0, 1, 0.03529412, 1,
-0.4734773, -0.2727663, -3.60138, 0, 1, 0.03921569, 1,
-0.4692122, 0.311534, -0.2159525, 0, 1, 0.04705882, 1,
-0.466307, -0.8254089, -1.210809, 0, 1, 0.05098039, 1,
-0.4603865, 0.5517752, -2.153804, 0, 1, 0.05882353, 1,
-0.458786, -0.3418791, -3.867107, 0, 1, 0.0627451, 1,
-0.4584056, 0.6396125, 0.0478809, 0, 1, 0.07058824, 1,
-0.4583234, 0.9670269, 0.002766905, 0, 1, 0.07450981, 1,
-0.4563131, 0.07562855, -0.1398323, 0, 1, 0.08235294, 1,
-0.4518359, -0.008945406, -0.6079397, 0, 1, 0.08627451, 1,
-0.449052, 0.03081073, -2.551032, 0, 1, 0.09411765, 1,
-0.4474783, -0.5097069, -0.9111434, 0, 1, 0.1019608, 1,
-0.4422774, 0.6907325, -0.05664924, 0, 1, 0.1058824, 1,
-0.4421783, -0.2846064, -3.231932, 0, 1, 0.1137255, 1,
-0.4359737, 0.5801698, -1.935899, 0, 1, 0.1176471, 1,
-0.4344361, 0.3150132, -0.9902457, 0, 1, 0.1254902, 1,
-0.4333857, 1.445125, 0.3212587, 0, 1, 0.1294118, 1,
-0.4312902, 0.6693922, -1.517342, 0, 1, 0.1372549, 1,
-0.4301592, -2.679133, -3.760033, 0, 1, 0.1411765, 1,
-0.4282233, 0.007282173, -0.9616902, 0, 1, 0.1490196, 1,
-0.422423, -0.3244249, -3.178082, 0, 1, 0.1529412, 1,
-0.4168225, 0.3858741, -0.1108075, 0, 1, 0.1607843, 1,
-0.4142591, -0.7520027, -2.235037, 0, 1, 0.1647059, 1,
-0.4115959, 0.246316, -1.655663, 0, 1, 0.172549, 1,
-0.4041414, -1.183161, -3.681751, 0, 1, 0.1764706, 1,
-0.4036593, 0.6778674, -0.2375033, 0, 1, 0.1843137, 1,
-0.4014321, -0.4043151, -3.855846, 0, 1, 0.1882353, 1,
-0.3991082, 0.6081187, -2.080333, 0, 1, 0.1960784, 1,
-0.3973179, 0.1682257, -0.6098097, 0, 1, 0.2039216, 1,
-0.3967553, -0.1656225, -2.688835, 0, 1, 0.2078431, 1,
-0.3934373, 1.162686, -1.756768, 0, 1, 0.2156863, 1,
-0.3929045, 1.133234, -1.065636, 0, 1, 0.2196078, 1,
-0.3869269, -0.07271226, -2.069228, 0, 1, 0.227451, 1,
-0.3869119, -1.560037, -2.768266, 0, 1, 0.2313726, 1,
-0.3856957, -0.7171052, -3.226378, 0, 1, 0.2392157, 1,
-0.3843973, -0.0012472, -1.497367, 0, 1, 0.2431373, 1,
-0.3834447, -0.5686061, -4.682859, 0, 1, 0.2509804, 1,
-0.3768832, 0.8438368, -0.09956216, 0, 1, 0.254902, 1,
-0.3595909, -0.1449962, -3.249784, 0, 1, 0.2627451, 1,
-0.3588725, -1.799687, -3.416019, 0, 1, 0.2666667, 1,
-0.3549789, -0.1025086, -1.869051, 0, 1, 0.2745098, 1,
-0.3542705, -0.8602085, -3.392233, 0, 1, 0.2784314, 1,
-0.3518654, -0.298248, -2.402549, 0, 1, 0.2862745, 1,
-0.3456421, -0.09646931, -2.332172, 0, 1, 0.2901961, 1,
-0.3440422, 0.211275, -1.871011, 0, 1, 0.2980392, 1,
-0.3429589, -2.315044, -3.437336, 0, 1, 0.3058824, 1,
-0.3406431, -1.362786, -2.024766, 0, 1, 0.3098039, 1,
-0.3263161, 0.6884341, 0.9812493, 0, 1, 0.3176471, 1,
-0.3237817, -0.2861846, -4.704242, 0, 1, 0.3215686, 1,
-0.3222428, -0.1902135, -1.71099, 0, 1, 0.3294118, 1,
-0.3206014, 0.2538383, -0.4243453, 0, 1, 0.3333333, 1,
-0.3193538, -0.1736975, -1.614836, 0, 1, 0.3411765, 1,
-0.3160477, -0.417084, -1.25144, 0, 1, 0.345098, 1,
-0.3151673, 0.08720136, -2.481233, 0, 1, 0.3529412, 1,
-0.3108222, 1.984997, -1.030288, 0, 1, 0.3568628, 1,
-0.3064292, -0.13704, 0.7219463, 0, 1, 0.3647059, 1,
-0.2997763, 1.360619, -1.029737, 0, 1, 0.3686275, 1,
-0.295716, 0.5063733, -0.07054076, 0, 1, 0.3764706, 1,
-0.2924058, 0.1533403, -2.345179, 0, 1, 0.3803922, 1,
-0.2913283, 0.04977076, -1.478891, 0, 1, 0.3882353, 1,
-0.2836788, 1.787794, 0.7164776, 0, 1, 0.3921569, 1,
-0.2814804, -0.5931698, -2.959593, 0, 1, 0.4, 1,
-0.2772174, -0.1474943, -0.8375916, 0, 1, 0.4078431, 1,
-0.2752573, -1.422235, -2.521647, 0, 1, 0.4117647, 1,
-0.2748554, 1.313676, -0.06718495, 0, 1, 0.4196078, 1,
-0.2719677, 0.5279474, 0.5054228, 0, 1, 0.4235294, 1,
-0.2704841, 2.007426, 1.556093, 0, 1, 0.4313726, 1,
-0.2703261, 3.303107, 1.478533, 0, 1, 0.4352941, 1,
-0.2673931, -0.4704363, -3.196654, 0, 1, 0.4431373, 1,
-0.267092, -0.5390031, -1.484347, 0, 1, 0.4470588, 1,
-0.2634843, -0.6512371, -3.236699, 0, 1, 0.454902, 1,
-0.259162, 1.639348, -1.15936, 0, 1, 0.4588235, 1,
-0.2577514, -0.1613977, -2.75144, 0, 1, 0.4666667, 1,
-0.2550249, -0.201121, -3.137681, 0, 1, 0.4705882, 1,
-0.249944, 0.5460507, -0.1900227, 0, 1, 0.4784314, 1,
-0.2494961, 1.65071, -0.202149, 0, 1, 0.4823529, 1,
-0.2476156, -1.572661, -1.168074, 0, 1, 0.4901961, 1,
-0.2455775, 0.04972424, -1.175913, 0, 1, 0.4941176, 1,
-0.2409825, 0.5319749, -0.3175678, 0, 1, 0.5019608, 1,
-0.2376072, 0.04968679, -0.8906596, 0, 1, 0.509804, 1,
-0.2368187, 0.0942436, -1.940653, 0, 1, 0.5137255, 1,
-0.2317619, 0.9222893, 1.653931, 0, 1, 0.5215687, 1,
-0.2274868, 1.606005, 0.2313355, 0, 1, 0.5254902, 1,
-0.2264966, -0.2884977, -1.541604, 0, 1, 0.5333334, 1,
-0.2263455, -0.5226831, -2.860045, 0, 1, 0.5372549, 1,
-0.2237954, 1.108302, -0.2171491, 0, 1, 0.5450981, 1,
-0.2237852, 0.212464, -0.7341437, 0, 1, 0.5490196, 1,
-0.2233749, -1.666852, -3.279904, 0, 1, 0.5568628, 1,
-0.2183668, -1.309599, -3.896349, 0, 1, 0.5607843, 1,
-0.2171003, 1.384212, -0.9630529, 0, 1, 0.5686275, 1,
-0.2128047, 0.02380252, -2.058751, 0, 1, 0.572549, 1,
-0.2118615, -0.723492, -1.746732, 0, 1, 0.5803922, 1,
-0.2111194, 0.2794718, -3.433206, 0, 1, 0.5843138, 1,
-0.2084241, 0.3782486, -1.49093, 0, 1, 0.5921569, 1,
-0.2073514, 2.009316, -1.062482, 0, 1, 0.5960785, 1,
-0.2047737, -0.3520162, -3.169973, 0, 1, 0.6039216, 1,
-0.1998162, -0.5542402, -3.693194, 0, 1, 0.6117647, 1,
-0.1992266, -1.501721, -2.856086, 0, 1, 0.6156863, 1,
-0.1978184, 0.953257, 1.143826, 0, 1, 0.6235294, 1,
-0.1964935, -1.567124, -4.316913, 0, 1, 0.627451, 1,
-0.1948862, -1.470429, -5.443745, 0, 1, 0.6352941, 1,
-0.1929695, 0.8016633, 0.2789136, 0, 1, 0.6392157, 1,
-0.1922489, 0.5276951, -0.7641321, 0, 1, 0.6470588, 1,
-0.1912122, -1.101536, -4.324073, 0, 1, 0.6509804, 1,
-0.189819, 0.6750224, 0.9681245, 0, 1, 0.6588235, 1,
-0.185533, -1.682708, -2.708859, 0, 1, 0.6627451, 1,
-0.1763254, 0.8624848, 0.09757164, 0, 1, 0.6705883, 1,
-0.1752798, -1.136306, -2.998158, 0, 1, 0.6745098, 1,
-0.1731444, 0.3004785, -0.02136242, 0, 1, 0.682353, 1,
-0.1721042, 0.1280057, -2.471327, 0, 1, 0.6862745, 1,
-0.1712676, -0.5636443, -3.030635, 0, 1, 0.6941177, 1,
-0.1700006, 0.753623, -2.141782, 0, 1, 0.7019608, 1,
-0.1664133, -0.9749066, -2.640872, 0, 1, 0.7058824, 1,
-0.16461, 0.8063887, 0.4404228, 0, 1, 0.7137255, 1,
-0.1642531, 0.1919085, 1.716389, 0, 1, 0.7176471, 1,
-0.1610024, -0.2321425, -4.051136, 0, 1, 0.7254902, 1,
-0.1601939, -1.173705, -2.905692, 0, 1, 0.7294118, 1,
-0.159359, -0.8098226, -2.580237, 0, 1, 0.7372549, 1,
-0.1545775, -0.1327361, -1.488158, 0, 1, 0.7411765, 1,
-0.1514621, -0.09053699, -1.411352, 0, 1, 0.7490196, 1,
-0.147121, 1.333426, 0.1874939, 0, 1, 0.7529412, 1,
-0.1463214, -0.1599739, -4.117727, 0, 1, 0.7607843, 1,
-0.1445812, -2.199517, -2.631827, 0, 1, 0.7647059, 1,
-0.1444748, 0.5091289, -0.05595709, 0, 1, 0.772549, 1,
-0.1421503, -0.707494, -2.648846, 0, 1, 0.7764706, 1,
-0.1420086, -0.13288, -2.190704, 0, 1, 0.7843137, 1,
-0.139021, -0.9811689, -3.169183, 0, 1, 0.7882353, 1,
-0.1342122, 0.6569388, -0.6606323, 0, 1, 0.7960784, 1,
-0.1337008, 0.2310652, -0.5098029, 0, 1, 0.8039216, 1,
-0.1323665, -0.7830154, -1.495358, 0, 1, 0.8078431, 1,
-0.132218, 0.1377421, -1.685757, 0, 1, 0.8156863, 1,
-0.1315066, 0.339128, 0.9106817, 0, 1, 0.8196079, 1,
-0.1251812, -1.192103, -3.062754, 0, 1, 0.827451, 1,
-0.1245906, 1.29422, -0.09168933, 0, 1, 0.8313726, 1,
-0.1196218, 2.355497, -1.029196, 0, 1, 0.8392157, 1,
-0.1187189, -0.09707705, -1.591059, 0, 1, 0.8431373, 1,
-0.1129535, -0.713589, -4.155877, 0, 1, 0.8509804, 1,
-0.1087656, 0.4132014, 0.5253626, 0, 1, 0.854902, 1,
-0.1051964, -0.5385687, -3.706631, 0, 1, 0.8627451, 1,
-0.1047035, -0.05939982, -3.675484, 0, 1, 0.8666667, 1,
-0.09991056, 1.392569, 0.2323551, 0, 1, 0.8745098, 1,
-0.09480567, -2.307884, -4.340571, 0, 1, 0.8784314, 1,
-0.09330728, 0.3713818, 2.307091, 0, 1, 0.8862745, 1,
-0.08938102, 1.05194, 2.940436, 0, 1, 0.8901961, 1,
-0.08905772, -1.771773, -3.807058, 0, 1, 0.8980392, 1,
-0.08897074, -0.9947313, -1.225557, 0, 1, 0.9058824, 1,
-0.08473687, 0.4169493, -1.074516, 0, 1, 0.9098039, 1,
-0.08281228, 0.7154573, 2.051262, 0, 1, 0.9176471, 1,
-0.08268427, 0.2820451, 0.08571491, 0, 1, 0.9215686, 1,
-0.07933459, -0.793555, -2.883527, 0, 1, 0.9294118, 1,
-0.07363277, -0.7040039, -1.21259, 0, 1, 0.9333333, 1,
-0.07267273, 1.151096, -0.7916608, 0, 1, 0.9411765, 1,
-0.06831261, 0.4328324, 1.308136, 0, 1, 0.945098, 1,
-0.06768575, 0.6066783, 1.002958, 0, 1, 0.9529412, 1,
-0.0675103, -0.8152763, -3.558467, 0, 1, 0.9568627, 1,
-0.06744538, 0.634358, 0.8868743, 0, 1, 0.9647059, 1,
-0.06722713, 2.010085, 0.5600678, 0, 1, 0.9686275, 1,
-0.0648962, 0.7594161, 0.6783957, 0, 1, 0.9764706, 1,
-0.06137558, -1.880323, -4.305878, 0, 1, 0.9803922, 1,
-0.06067444, 0.3070415, 0.2472944, 0, 1, 0.9882353, 1,
-0.05782481, -1.696111, -2.585111, 0, 1, 0.9921569, 1,
-0.05739462, -0.7878441, -3.157313, 0, 1, 1, 1,
-0.0568307, -0.3538007, -2.703171, 0, 0.9921569, 1, 1,
-0.05388337, -0.8868192, -3.699203, 0, 0.9882353, 1, 1,
-0.05231869, 2.24124, -0.5073107, 0, 0.9803922, 1, 1,
-0.05041789, 0.01162183, -0.6602974, 0, 0.9764706, 1, 1,
-0.04335664, 0.353606, 0.9948926, 0, 0.9686275, 1, 1,
-0.04304844, 1.27595, -0.8796182, 0, 0.9647059, 1, 1,
-0.04159944, 1.465267, 1.158844, 0, 0.9568627, 1, 1,
-0.04144866, 1.353149, 2.21888, 0, 0.9529412, 1, 1,
-0.03868071, -1.003183, -1.674622, 0, 0.945098, 1, 1,
-0.03641653, -0.4765608, -4.480891, 0, 0.9411765, 1, 1,
-0.03351831, -1.593597, -1.888717, 0, 0.9333333, 1, 1,
-0.0297006, -0.7046628, -3.10021, 0, 0.9294118, 1, 1,
-0.02731298, -0.7100714, -5.191219, 0, 0.9215686, 1, 1,
-0.02503742, 0.5022849, 0.4699162, 0, 0.9176471, 1, 1,
-0.01863453, -1.068994, -3.208596, 0, 0.9098039, 1, 1,
-0.01813022, 0.700031, -0.4421577, 0, 0.9058824, 1, 1,
-0.01564361, 1.452777, 0.5550979, 0, 0.8980392, 1, 1,
-0.01504446, 0.6971146, 0.2932087, 0, 0.8901961, 1, 1,
-0.01448442, 0.6909976, -1.503326, 0, 0.8862745, 1, 1,
-0.009039721, 2.050517, -1.159848, 0, 0.8784314, 1, 1,
-0.007466029, -1.087631, -4.695546, 0, 0.8745098, 1, 1,
-0.005976209, 1.848973, 0.6949086, 0, 0.8666667, 1, 1,
-0.003851893, 0.5193528, 0.1653623, 0, 0.8627451, 1, 1,
-0.002462628, -1.018405, -4.015537, 0, 0.854902, 1, 1,
-0.00222082, -0.6563224, -4.44906, 0, 0.8509804, 1, 1,
-0.002167446, 0.5093517, -1.342181, 0, 0.8431373, 1, 1,
0.002724439, -0.4987268, 4.023773, 0, 0.8392157, 1, 1,
0.004667431, -0.6786628, 3.775093, 0, 0.8313726, 1, 1,
0.006393975, 0.112684, 0.03552291, 0, 0.827451, 1, 1,
0.01347763, -0.1190329, 2.125296, 0, 0.8196079, 1, 1,
0.01488345, -1.053687, 2.606562, 0, 0.8156863, 1, 1,
0.01665041, -1.415323, 5.502195, 0, 0.8078431, 1, 1,
0.02035943, 0.7271599, -0.5783769, 0, 0.8039216, 1, 1,
0.02291502, -0.4637715, 4.381999, 0, 0.7960784, 1, 1,
0.02342313, 0.4618584, -0.4249268, 0, 0.7882353, 1, 1,
0.0236308, -1.314065, 2.627618, 0, 0.7843137, 1, 1,
0.0245099, -0.4407347, 1.37473, 0, 0.7764706, 1, 1,
0.02471995, -0.2473509, 2.331104, 0, 0.772549, 1, 1,
0.02537124, 0.811013, 0.7519227, 0, 0.7647059, 1, 1,
0.0265229, -0.8862717, 4.360628, 0, 0.7607843, 1, 1,
0.02923916, -0.7118331, 2.864899, 0, 0.7529412, 1, 1,
0.03500298, -0.3370386, 1.238137, 0, 0.7490196, 1, 1,
0.03688568, -1.822931, 3.984808, 0, 0.7411765, 1, 1,
0.0449754, 0.5459538, 0.1670164, 0, 0.7372549, 1, 1,
0.04876869, 0.2376136, -0.1877369, 0, 0.7294118, 1, 1,
0.04915901, -0.1462861, 2.0987, 0, 0.7254902, 1, 1,
0.05074246, -0.5855374, 2.68418, 0, 0.7176471, 1, 1,
0.05414958, 0.8829161, 1.310984, 0, 0.7137255, 1, 1,
0.05422401, -1.043487, 4.294116, 0, 0.7058824, 1, 1,
0.06059195, 0.9594223, -1.417647, 0, 0.6980392, 1, 1,
0.06221931, 1.141041, -0.7116706, 0, 0.6941177, 1, 1,
0.06276059, 0.4230281, 1.562194, 0, 0.6862745, 1, 1,
0.06354495, -0.2765874, 2.900088, 0, 0.682353, 1, 1,
0.06917926, -2.308753, 3.337744, 0, 0.6745098, 1, 1,
0.07077424, 0.8437408, 2.270784, 0, 0.6705883, 1, 1,
0.07355966, 0.07339812, 0.1997052, 0, 0.6627451, 1, 1,
0.07482721, 0.7533814, -0.07218034, 0, 0.6588235, 1, 1,
0.07880317, 0.7073916, 0.3271477, 0, 0.6509804, 1, 1,
0.08227684, -0.5567012, 2.086468, 0, 0.6470588, 1, 1,
0.08360679, -1.176382, 2.795459, 0, 0.6392157, 1, 1,
0.08691681, -1.284347, 4.79357, 0, 0.6352941, 1, 1,
0.09060374, -1.218068, 2.773858, 0, 0.627451, 1, 1,
0.09347041, 0.3755895, 0.5639642, 0, 0.6235294, 1, 1,
0.09908572, -1.008994, 3.108839, 0, 0.6156863, 1, 1,
0.1048415, -0.1854644, 2.676516, 0, 0.6117647, 1, 1,
0.1076436, -0.283622, 2.401068, 0, 0.6039216, 1, 1,
0.1090932, 0.2441965, 2.151479, 0, 0.5960785, 1, 1,
0.1147455, -0.2340176, 4.750641, 0, 0.5921569, 1, 1,
0.1155776, -0.5537801, 4.763003, 0, 0.5843138, 1, 1,
0.1163005, 1.886633, -0.02764273, 0, 0.5803922, 1, 1,
0.1172772, -1.173797, 4.059888, 0, 0.572549, 1, 1,
0.117358, 1.743578, 0.8587517, 0, 0.5686275, 1, 1,
0.1192566, -0.8259564, 3.943839, 0, 0.5607843, 1, 1,
0.1221284, -0.7112165, 2.38636, 0, 0.5568628, 1, 1,
0.1338061, 1.440795, -0.1808398, 0, 0.5490196, 1, 1,
0.1338754, 1.725499, 0.5226309, 0, 0.5450981, 1, 1,
0.1385058, 1.132475, -0.1601183, 0, 0.5372549, 1, 1,
0.1417657, 1.178968, 1.331261, 0, 0.5333334, 1, 1,
0.1428169, -0.02318715, 1.141141, 0, 0.5254902, 1, 1,
0.1466048, 0.2792236, -0.767593, 0, 0.5215687, 1, 1,
0.1513161, 0.679372, 0.3276673, 0, 0.5137255, 1, 1,
0.1534398, 0.6866726, 0.9904708, 0, 0.509804, 1, 1,
0.1659808, 0.04274504, 2.461079, 0, 0.5019608, 1, 1,
0.1687225, 0.3774008, 0.09923982, 0, 0.4941176, 1, 1,
0.1704429, 1.468718, -0.7592592, 0, 0.4901961, 1, 1,
0.1714056, 1.569372, 1.784992, 0, 0.4823529, 1, 1,
0.175549, 0.08132517, 2.86305, 0, 0.4784314, 1, 1,
0.1774879, 0.09975145, 2.571306, 0, 0.4705882, 1, 1,
0.1777252, -0.2781656, 1.895977, 0, 0.4666667, 1, 1,
0.181899, 1.689532, -2.186591, 0, 0.4588235, 1, 1,
0.183147, -0.5993243, 2.169812, 0, 0.454902, 1, 1,
0.1836915, 0.3510432, 0.5376683, 0, 0.4470588, 1, 1,
0.1858039, -1.881661, 2.299018, 0, 0.4431373, 1, 1,
0.1861808, -0.6121294, 3.06061, 0, 0.4352941, 1, 1,
0.1897774, 0.07222598, 0.1555412, 0, 0.4313726, 1, 1,
0.1931618, -0.675823, 2.393073, 0, 0.4235294, 1, 1,
0.1946111, 0.1632657, 0.9515961, 0, 0.4196078, 1, 1,
0.1993548, -0.50143, 2.322901, 0, 0.4117647, 1, 1,
0.2012653, -0.7267436, 2.840302, 0, 0.4078431, 1, 1,
0.2021844, -0.3560878, 2.944752, 0, 0.4, 1, 1,
0.2022609, 1.985624, 2.064389, 0, 0.3921569, 1, 1,
0.2053964, -0.5048374, 1.847065, 0, 0.3882353, 1, 1,
0.210604, -1.241416, 2.817272, 0, 0.3803922, 1, 1,
0.2132602, 0.2619074, 0.2544619, 0, 0.3764706, 1, 1,
0.2226646, 1.112455, -0.06336517, 0, 0.3686275, 1, 1,
0.2240614, -0.6626516, 3.309083, 0, 0.3647059, 1, 1,
0.2291036, 0.9501248, 1.805432, 0, 0.3568628, 1, 1,
0.2315053, 0.1041486, 0.5226717, 0, 0.3529412, 1, 1,
0.2317031, -0.07838619, 1.99376, 0, 0.345098, 1, 1,
0.2398503, 0.3558218, 0.5400215, 0, 0.3411765, 1, 1,
0.2459897, 0.3397811, -0.1121865, 0, 0.3333333, 1, 1,
0.2479369, 0.9953327, -0.2395827, 0, 0.3294118, 1, 1,
0.2508603, 0.1144752, 0.654368, 0, 0.3215686, 1, 1,
0.2539996, -1.192284, 3.348963, 0, 0.3176471, 1, 1,
0.2546799, 0.1241874, -0.2192367, 0, 0.3098039, 1, 1,
0.2555794, 1.653718, -0.7225189, 0, 0.3058824, 1, 1,
0.2589439, 1.026286, 0.8268137, 0, 0.2980392, 1, 1,
0.2642777, 0.5986645, 2.004791, 0, 0.2901961, 1, 1,
0.2667745, -0.9201538, 3.740769, 0, 0.2862745, 1, 1,
0.2674688, 0.552573, -0.07499566, 0, 0.2784314, 1, 1,
0.2680973, 0.1232358, 0.6505775, 0, 0.2745098, 1, 1,
0.2701104, 0.1697448, 1.840072, 0, 0.2666667, 1, 1,
0.271954, 1.507219, 0.2561079, 0, 0.2627451, 1, 1,
0.2723967, -1.029243, 2.003318, 0, 0.254902, 1, 1,
0.2727604, 0.6143513, 2.304277, 0, 0.2509804, 1, 1,
0.2769987, 0.7892554, 0.2763328, 0, 0.2431373, 1, 1,
0.2805303, 0.4881254, 0.9870761, 0, 0.2392157, 1, 1,
0.2810281, 1.736518, 0.002303119, 0, 0.2313726, 1, 1,
0.2820476, -0.05355204, 2.467923, 0, 0.227451, 1, 1,
0.2831336, 0.04506122, -0.2764801, 0, 0.2196078, 1, 1,
0.2867756, 0.5717751, 0.5829404, 0, 0.2156863, 1, 1,
0.2873139, -0.9468936, 1.681701, 0, 0.2078431, 1, 1,
0.2879198, -0.3455766, 1.879365, 0, 0.2039216, 1, 1,
0.2913294, 2.22195, -0.4891313, 0, 0.1960784, 1, 1,
0.2951595, 0.5599688, 0.4949782, 0, 0.1882353, 1, 1,
0.295901, -0.7331626, 1.690007, 0, 0.1843137, 1, 1,
0.2979308, 0.5322095, 1.853625, 0, 0.1764706, 1, 1,
0.298082, 0.1252319, 1.98281, 0, 0.172549, 1, 1,
0.3007481, -1.471003, 2.654667, 0, 0.1647059, 1, 1,
0.3012869, 1.14483, 1.161813, 0, 0.1607843, 1, 1,
0.303388, 1.772028, -1.465052, 0, 0.1529412, 1, 1,
0.3060513, -0.5536699, 2.805466, 0, 0.1490196, 1, 1,
0.3121285, 0.493895, -1.414009, 0, 0.1411765, 1, 1,
0.3171462, -1.73741, 3.546863, 0, 0.1372549, 1, 1,
0.3199704, -1.820017, 3.309335, 0, 0.1294118, 1, 1,
0.3307649, -0.6806186, 2.263765, 0, 0.1254902, 1, 1,
0.3333037, 0.4910127, 0.3573347, 0, 0.1176471, 1, 1,
0.3347228, -1.779305, 3.066145, 0, 0.1137255, 1, 1,
0.3383296, -0.1210714, 2.23375, 0, 0.1058824, 1, 1,
0.3393508, 1.683205, 1.479153, 0, 0.09803922, 1, 1,
0.3419676, 0.05771663, -0.2321861, 0, 0.09411765, 1, 1,
0.342958, 0.4180785, 2.050906, 0, 0.08627451, 1, 1,
0.3477679, 0.07222338, -0.5908001, 0, 0.08235294, 1, 1,
0.3479435, -0.4296217, 3.913024, 0, 0.07450981, 1, 1,
0.3479669, -1.137803, 1.930284, 0, 0.07058824, 1, 1,
0.3579318, 0.2802215, -0.8556189, 0, 0.0627451, 1, 1,
0.3596154, 0.3403044, 0.3327319, 0, 0.05882353, 1, 1,
0.3646601, 0.6981667, 0.9036013, 0, 0.05098039, 1, 1,
0.3757923, 0.511044, 0.0228799, 0, 0.04705882, 1, 1,
0.3762321, -0.9014302, 1.498086, 0, 0.03921569, 1, 1,
0.3769147, -3.145591, 2.574991, 0, 0.03529412, 1, 1,
0.3790301, 0.1839068, -0.1316553, 0, 0.02745098, 1, 1,
0.3804092, 0.1358421, -0.6198117, 0, 0.02352941, 1, 1,
0.3820237, -0.6259793, 1.916671, 0, 0.01568628, 1, 1,
0.3864486, -0.7054581, 1.359277, 0, 0.01176471, 1, 1,
0.3867064, 0.5616141, -0.4654655, 0, 0.003921569, 1, 1,
0.3894151, -0.5854374, 2.49642, 0.003921569, 0, 1, 1,
0.3906187, -1.547406, 3.389537, 0.007843138, 0, 1, 1,
0.3924068, 1.164496, -0.6454474, 0.01568628, 0, 1, 1,
0.4039506, 0.7814565, 0.1010916, 0.01960784, 0, 1, 1,
0.4060687, 0.2337024, 1.695558, 0.02745098, 0, 1, 1,
0.4095882, 0.3437288, 2.197715, 0.03137255, 0, 1, 1,
0.4096604, -1.821772, 5.191193, 0.03921569, 0, 1, 1,
0.4118149, 2.7009, 0.8138472, 0.04313726, 0, 1, 1,
0.4121932, -0.05455714, 1.867883, 0.05098039, 0, 1, 1,
0.4140442, 1.134315, 0.7168417, 0.05490196, 0, 1, 1,
0.4153187, -2.646933, 2.482308, 0.0627451, 0, 1, 1,
0.4172603, -0.7365193, 2.328497, 0.06666667, 0, 1, 1,
0.419293, -0.3054386, 3.096314, 0.07450981, 0, 1, 1,
0.42208, -0.03612614, 1.51749, 0.07843138, 0, 1, 1,
0.4230137, -1.906179, 2.437689, 0.08627451, 0, 1, 1,
0.4284723, 0.4746798, 1.319975, 0.09019608, 0, 1, 1,
0.4290783, -1.79389, 1.096276, 0.09803922, 0, 1, 1,
0.4322446, 0.1693955, -1.843014, 0.1058824, 0, 1, 1,
0.4342576, -1.171833, 2.05861, 0.1098039, 0, 1, 1,
0.4387798, -0.7346076, 2.816011, 0.1176471, 0, 1, 1,
0.4391248, 0.5365009, -0.4749057, 0.1215686, 0, 1, 1,
0.4399002, 0.1008009, 1.415352, 0.1294118, 0, 1, 1,
0.4457611, -2.089031, 3.178018, 0.1333333, 0, 1, 1,
0.4485478, -1.003439, 2.354397, 0.1411765, 0, 1, 1,
0.4501995, -0.7474879, 2.331561, 0.145098, 0, 1, 1,
0.4560552, -0.8247114, 3.096421, 0.1529412, 0, 1, 1,
0.4574948, -1.023556, 2.128356, 0.1568628, 0, 1, 1,
0.4580613, -0.4983328, 2.557412, 0.1647059, 0, 1, 1,
0.4663345, 1.578074, 0.3465515, 0.1686275, 0, 1, 1,
0.4684034, 2.880184, 0.1982029, 0.1764706, 0, 1, 1,
0.4712447, -0.7879146, 1.694021, 0.1803922, 0, 1, 1,
0.4717067, 0.0898448, 3.475363, 0.1882353, 0, 1, 1,
0.4741174, -0.1621133, 0.8328735, 0.1921569, 0, 1, 1,
0.4742946, 0.2353101, 1.263319, 0.2, 0, 1, 1,
0.4745699, -1.841334, 2.413608, 0.2078431, 0, 1, 1,
0.4752822, 1.486642, 1.659676, 0.2117647, 0, 1, 1,
0.4795692, -0.8145347, 2.564509, 0.2196078, 0, 1, 1,
0.4800884, -1.72559, 2.728406, 0.2235294, 0, 1, 1,
0.4803934, -0.08810212, 3.134737, 0.2313726, 0, 1, 1,
0.4807416, 0.3465616, 1.693867, 0.2352941, 0, 1, 1,
0.489481, -0.009333952, 2.11127, 0.2431373, 0, 1, 1,
0.4924111, -1.276426, 2.499366, 0.2470588, 0, 1, 1,
0.492961, -0.5476496, 2.014351, 0.254902, 0, 1, 1,
0.4940071, -0.3119509, 2.021111, 0.2588235, 0, 1, 1,
0.4976114, -0.5397657, 2.964368, 0.2666667, 0, 1, 1,
0.4976529, 0.2161705, 1.47538, 0.2705882, 0, 1, 1,
0.498244, -1.77748, 2.907153, 0.2784314, 0, 1, 1,
0.4989443, 0.4626746, -0.9700167, 0.282353, 0, 1, 1,
0.5016032, 0.4056309, 0.5093413, 0.2901961, 0, 1, 1,
0.5034053, 0.3643058, 1.252133, 0.2941177, 0, 1, 1,
0.5098689, -0.2049582, 2.695812, 0.3019608, 0, 1, 1,
0.5126907, 0.4298245, 3.008159, 0.3098039, 0, 1, 1,
0.5173223, -0.913133, 3.453645, 0.3137255, 0, 1, 1,
0.5184141, -1.201202, 1.919408, 0.3215686, 0, 1, 1,
0.5188459, 0.2284349, 1.08497, 0.3254902, 0, 1, 1,
0.5213097, -0.8413498, 0.2474908, 0.3333333, 0, 1, 1,
0.5213208, -0.9137612, 1.683798, 0.3372549, 0, 1, 1,
0.522431, 0.9904074, 0.6486989, 0.345098, 0, 1, 1,
0.5228807, 0.7298159, 1.082125, 0.3490196, 0, 1, 1,
0.5260009, -0.08126615, 0.6142988, 0.3568628, 0, 1, 1,
0.5265234, -1.181891, 1.511381, 0.3607843, 0, 1, 1,
0.5272892, 4.229921, 0.1952542, 0.3686275, 0, 1, 1,
0.5279621, -1.04013, 3.408639, 0.372549, 0, 1, 1,
0.5304034, -0.9870237, 2.801517, 0.3803922, 0, 1, 1,
0.533074, 0.4534603, 0.05617952, 0.3843137, 0, 1, 1,
0.5333987, -0.9455829, 2.406543, 0.3921569, 0, 1, 1,
0.5400369, 1.265656, -0.1723627, 0.3960784, 0, 1, 1,
0.5415774, 0.9337698, 0.7605301, 0.4039216, 0, 1, 1,
0.5423917, -2.340335, 3.434423, 0.4117647, 0, 1, 1,
0.5438216, -0.3543142, 2.192537, 0.4156863, 0, 1, 1,
0.5445662, 0.0225289, 2.018857, 0.4235294, 0, 1, 1,
0.5455025, 0.3800149, 2.031368, 0.427451, 0, 1, 1,
0.5474396, -1.947141, 3.681143, 0.4352941, 0, 1, 1,
0.5476067, -0.2500008, 2.75753, 0.4392157, 0, 1, 1,
0.5501187, -0.1152794, 0.5179521, 0.4470588, 0, 1, 1,
0.552242, -0.8955731, 3.656612, 0.4509804, 0, 1, 1,
0.5557601, 0.004161041, 2.417914, 0.4588235, 0, 1, 1,
0.5614536, -0.2094729, 2.741204, 0.4627451, 0, 1, 1,
0.5615128, -0.3811285, 4.184327, 0.4705882, 0, 1, 1,
0.5622416, 1.693916, -1.476403, 0.4745098, 0, 1, 1,
0.5803757, -2.171671, 1.965129, 0.4823529, 0, 1, 1,
0.587585, -0.2374473, 1.615645, 0.4862745, 0, 1, 1,
0.5877668, 1.337045, 1.559781, 0.4941176, 0, 1, 1,
0.5892133, 0.1329009, 1.291766, 0.5019608, 0, 1, 1,
0.5911207, -0.1643899, 1.877247, 0.5058824, 0, 1, 1,
0.5999262, -0.9510115, 2.091096, 0.5137255, 0, 1, 1,
0.6020722, 0.4259936, 1.260763, 0.5176471, 0, 1, 1,
0.6023448, -1.185879, 3.27634, 0.5254902, 0, 1, 1,
0.605589, 0.361903, 0.7941312, 0.5294118, 0, 1, 1,
0.6057939, -0.8545797, 2.988438, 0.5372549, 0, 1, 1,
0.6070627, -0.1106546, 2.809015, 0.5411765, 0, 1, 1,
0.6086829, 0.3962973, 1.217707, 0.5490196, 0, 1, 1,
0.6092277, -0.3123405, 1.266663, 0.5529412, 0, 1, 1,
0.6095181, 1.223547, 0.443602, 0.5607843, 0, 1, 1,
0.6312987, 1.457086, -0.07643388, 0.5647059, 0, 1, 1,
0.6384842, 1.316139, -0.5433689, 0.572549, 0, 1, 1,
0.6407383, 0.7559163, 0.2047754, 0.5764706, 0, 1, 1,
0.6455164, -0.903125, 4.247194, 0.5843138, 0, 1, 1,
0.6507553, -0.354836, 2.101049, 0.5882353, 0, 1, 1,
0.6584907, -0.201134, 1.32168, 0.5960785, 0, 1, 1,
0.6595859, 1.143668, 2.575914, 0.6039216, 0, 1, 1,
0.6601253, 0.1336735, 0.4828933, 0.6078432, 0, 1, 1,
0.662732, -1.135393, 2.535775, 0.6156863, 0, 1, 1,
0.6698052, -0.7162247, 2.210428, 0.6196079, 0, 1, 1,
0.6724312, 1.740787, -0.09397401, 0.627451, 0, 1, 1,
0.6770346, -1.944034, 2.480627, 0.6313726, 0, 1, 1,
0.67725, 0.8599029, 0.9857076, 0.6392157, 0, 1, 1,
0.679345, -0.9904884, 2.986915, 0.6431373, 0, 1, 1,
0.68011, -0.01421097, 1.232823, 0.6509804, 0, 1, 1,
0.6814936, -1.838514, 2.995158, 0.654902, 0, 1, 1,
0.6838403, 0.4963945, 0.1943825, 0.6627451, 0, 1, 1,
0.6847547, 1.42397, 2.295051, 0.6666667, 0, 1, 1,
0.6872101, -1.235699, 2.484228, 0.6745098, 0, 1, 1,
0.6873078, 1.259036, -0.002533579, 0.6784314, 0, 1, 1,
0.6925345, -0.4436259, 3.415962, 0.6862745, 0, 1, 1,
0.6975768, -0.5736145, 1.52406, 0.6901961, 0, 1, 1,
0.6984231, 0.2659424, 0.7143379, 0.6980392, 0, 1, 1,
0.7004835, 0.2243313, 2.23415, 0.7058824, 0, 1, 1,
0.7044073, 0.2418702, 2.019424, 0.7098039, 0, 1, 1,
0.7056527, 1.043413, -0.6034328, 0.7176471, 0, 1, 1,
0.7067914, -2.091447, 3.2489, 0.7215686, 0, 1, 1,
0.7084348, 0.03782565, 0.2449828, 0.7294118, 0, 1, 1,
0.7129145, 0.2162053, 1.410259, 0.7333333, 0, 1, 1,
0.7154625, 0.3462685, 2.671178, 0.7411765, 0, 1, 1,
0.7188594, 0.9782179, 0.1833843, 0.7450981, 0, 1, 1,
0.7275509, -0.9296814, 3.738938, 0.7529412, 0, 1, 1,
0.7369794, -0.7549347, 2.215328, 0.7568628, 0, 1, 1,
0.7392389, -3.574729, 4.244322, 0.7647059, 0, 1, 1,
0.7427273, -0.4838212, 3.400985, 0.7686275, 0, 1, 1,
0.7515708, 1.196791, -0.3817068, 0.7764706, 0, 1, 1,
0.7541651, 0.1852884, 2.516351, 0.7803922, 0, 1, 1,
0.7569665, -0.7112102, -0.2116791, 0.7882353, 0, 1, 1,
0.7573433, -0.7725949, 1.957185, 0.7921569, 0, 1, 1,
0.7690285, 0.986083, -0.09461962, 0.8, 0, 1, 1,
0.7709259, 0.2633962, 0.6589023, 0.8078431, 0, 1, 1,
0.7730727, -0.08698178, 1.473038, 0.8117647, 0, 1, 1,
0.7734518, 0.9513056, 1.598656, 0.8196079, 0, 1, 1,
0.7767159, -1.364558, 2.991108, 0.8235294, 0, 1, 1,
0.7814992, -1.348067, 3.322664, 0.8313726, 0, 1, 1,
0.7869095, -0.7052142, 3.268679, 0.8352941, 0, 1, 1,
0.7944961, 1.004984, 0.5269503, 0.8431373, 0, 1, 1,
0.8061864, -1.112379, 1.84765, 0.8470588, 0, 1, 1,
0.8127, -0.2044928, 0.7420298, 0.854902, 0, 1, 1,
0.8153193, -1.788065, 3.945331, 0.8588235, 0, 1, 1,
0.8161799, -0.7339259, 3.228526, 0.8666667, 0, 1, 1,
0.8171235, 0.4116473, 1.273403, 0.8705882, 0, 1, 1,
0.8185713, 0.8174937, 0.5642344, 0.8784314, 0, 1, 1,
0.8217102, -0.6666914, 2.438639, 0.8823529, 0, 1, 1,
0.8279126, 0.5039618, 0.9595056, 0.8901961, 0, 1, 1,
0.8299263, -1.432749, 0.1207851, 0.8941177, 0, 1, 1,
0.8353146, 1.215026, -0.05895073, 0.9019608, 0, 1, 1,
0.837527, -1.443811, 1.447135, 0.9098039, 0, 1, 1,
0.8379719, -0.8164189, 4.492296, 0.9137255, 0, 1, 1,
0.8414436, 0.04443733, 2.403794, 0.9215686, 0, 1, 1,
0.8428756, 0.3251435, 3.071419, 0.9254902, 0, 1, 1,
0.8464056, -0.3929119, 2.364233, 0.9333333, 0, 1, 1,
0.8590698, -0.6675113, 2.757071, 0.9372549, 0, 1, 1,
0.8630955, -1.443879, 2.830369, 0.945098, 0, 1, 1,
0.864365, -1.284552, 4.239319, 0.9490196, 0, 1, 1,
0.8651108, -0.4756561, 3.311667, 0.9568627, 0, 1, 1,
0.8698016, 0.4380015, 1.762017, 0.9607843, 0, 1, 1,
0.8704884, 0.5999546, 1.417572, 0.9686275, 0, 1, 1,
0.8705297, -0.05957265, 1.206412, 0.972549, 0, 1, 1,
0.8707372, -0.7893805, 1.596568, 0.9803922, 0, 1, 1,
0.8782977, -0.5607331, 0.8936771, 0.9843137, 0, 1, 1,
0.8882747, 0.1476472, 2.636252, 0.9921569, 0, 1, 1,
0.8917565, -2.020007, 3.747131, 0.9960784, 0, 1, 1,
0.9004373, 0.9301269, 2.424636, 1, 0, 0.9960784, 1,
0.907073, 0.6951752, 2.640525, 1, 0, 0.9882353, 1,
0.9192601, 0.5368425, 2.194601, 1, 0, 0.9843137, 1,
0.9236295, 0.8503858, 0.5293458, 1, 0, 0.9764706, 1,
0.925117, -0.02324977, 0.8741755, 1, 0, 0.972549, 1,
0.9350259, -0.2720061, 3.33989, 1, 0, 0.9647059, 1,
0.9362308, 0.3286233, 2.030595, 1, 0, 0.9607843, 1,
0.9365569, 1.447752, -0.5437794, 1, 0, 0.9529412, 1,
0.9391086, 1.95654, 0.2617031, 1, 0, 0.9490196, 1,
0.9501077, 0.2458417, 2.209943, 1, 0, 0.9411765, 1,
0.9535755, -2.004996, 2.220695, 1, 0, 0.9372549, 1,
0.9542127, -0.6439804, 3.214968, 1, 0, 0.9294118, 1,
0.9574486, 0.9663618, -0.5728633, 1, 0, 0.9254902, 1,
0.9661941, -0.2071408, 1.021795, 1, 0, 0.9176471, 1,
0.9681759, -0.9142496, 2.28928, 1, 0, 0.9137255, 1,
0.9700999, 2.320158, 1.177927, 1, 0, 0.9058824, 1,
0.9737868, -1.3006, 1.143571, 1, 0, 0.9019608, 1,
0.9738595, -0.4095504, 2.331896, 1, 0, 0.8941177, 1,
0.9758077, 0.09111853, 1.891787, 1, 0, 0.8862745, 1,
0.9809387, 0.004984093, 2.881267, 1, 0, 0.8823529, 1,
0.9846827, -0.5302191, 1.859014, 1, 0, 0.8745098, 1,
0.9861122, 1.969021, -1.158876, 1, 0, 0.8705882, 1,
0.9900184, 0.1635311, 0.6765069, 1, 0, 0.8627451, 1,
0.9905233, -0.2439793, 1.55122, 1, 0, 0.8588235, 1,
0.9911072, -0.1289746, 0.9379002, 1, 0, 0.8509804, 1,
0.9912663, -0.7410475, 2.122902, 1, 0, 0.8470588, 1,
0.9914605, -0.7111658, 2.669258, 1, 0, 0.8392157, 1,
0.9954752, -0.3288242, 2.163622, 1, 0, 0.8352941, 1,
0.9994279, -0.3214762, 2.759083, 1, 0, 0.827451, 1,
1.001286, -1.068185, 1.70073, 1, 0, 0.8235294, 1,
1.0037, 0.3250697, 3.102603, 1, 0, 0.8156863, 1,
1.009678, -0.9324147, 0.7488548, 1, 0, 0.8117647, 1,
1.01305, -0.01621952, 1.949751, 1, 0, 0.8039216, 1,
1.037444, -0.7580186, 2.786423, 1, 0, 0.7960784, 1,
1.059389, 0.7053232, 1.553382, 1, 0, 0.7921569, 1,
1.073344, 0.9269139, 2.498567, 1, 0, 0.7843137, 1,
1.077637, 1.548948, 1.155689, 1, 0, 0.7803922, 1,
1.078167, -0.6498176, 3.065939, 1, 0, 0.772549, 1,
1.088369, -0.3196676, 2.360701, 1, 0, 0.7686275, 1,
1.091284, 0.2973035, 0.5175778, 1, 0, 0.7607843, 1,
1.096477, -1.844315, 2.607644, 1, 0, 0.7568628, 1,
1.102069, -0.7196825, 2.922341, 1, 0, 0.7490196, 1,
1.120854, 1.067571, 0.5713183, 1, 0, 0.7450981, 1,
1.121235, 0.9308385, 0.9831251, 1, 0, 0.7372549, 1,
1.122745, -0.1660191, 1.921858, 1, 0, 0.7333333, 1,
1.124914, 0.6082126, 0.9357833, 1, 0, 0.7254902, 1,
1.129779, 2.478927, 0.1433694, 1, 0, 0.7215686, 1,
1.141562, -1.094546, 2.024602, 1, 0, 0.7137255, 1,
1.150387, 0.6944315, -0.4781198, 1, 0, 0.7098039, 1,
1.153364, -0.6451702, 2.544566, 1, 0, 0.7019608, 1,
1.154675, 1.239677, 1.381439, 1, 0, 0.6941177, 1,
1.155319, -0.6529839, 2.975576, 1, 0, 0.6901961, 1,
1.156852, 0.2427529, 0.5691138, 1, 0, 0.682353, 1,
1.164321, -0.3334746, 1.451266, 1, 0, 0.6784314, 1,
1.167539, -0.7458324, 2.186808, 1, 0, 0.6705883, 1,
1.170311, 0.3899518, 1.176476, 1, 0, 0.6666667, 1,
1.171594, 1.085858, 0.3650075, 1, 0, 0.6588235, 1,
1.174369, 0.07140718, 1.29765, 1, 0, 0.654902, 1,
1.176593, -1.126717, 1.086074, 1, 0, 0.6470588, 1,
1.177744, -0.8431781, 0.9925396, 1, 0, 0.6431373, 1,
1.179007, -0.1472681, -0.6629899, 1, 0, 0.6352941, 1,
1.182585, 0.5864735, 1.383646, 1, 0, 0.6313726, 1,
1.186147, -1.627452, 2.110908, 1, 0, 0.6235294, 1,
1.191358, 0.2244761, 3.24501, 1, 0, 0.6196079, 1,
1.197031, -1.453027, 0.04963814, 1, 0, 0.6117647, 1,
1.20626, -0.9479252, 2.131006, 1, 0, 0.6078432, 1,
1.209079, 0.119066, 1.25569, 1, 0, 0.6, 1,
1.212466, 0.7590608, 0.7890086, 1, 0, 0.5921569, 1,
1.214139, -0.5950822, 3.496044, 1, 0, 0.5882353, 1,
1.214423, 0.03496064, 2.202523, 1, 0, 0.5803922, 1,
1.221912, -2.469038, 3.822872, 1, 0, 0.5764706, 1,
1.255412, 1.101274, 0.6665359, 1, 0, 0.5686275, 1,
1.257923, -1.462841, 3.295968, 1, 0, 0.5647059, 1,
1.258117, 1.526566, -0.5894174, 1, 0, 0.5568628, 1,
1.266383, 0.2894088, 1.369831, 1, 0, 0.5529412, 1,
1.269237, -1.802856, 1.759432, 1, 0, 0.5450981, 1,
1.290485, 0.1730055, 3.235664, 1, 0, 0.5411765, 1,
1.296105, -0.9934363, 1.535462, 1, 0, 0.5333334, 1,
1.296954, -0.2331208, 2.14431, 1, 0, 0.5294118, 1,
1.302779, 0.9469344, -2.57053, 1, 0, 0.5215687, 1,
1.308674, 0.3522083, 1.753945, 1, 0, 0.5176471, 1,
1.316397, 1.807144, 0.6393257, 1, 0, 0.509804, 1,
1.320664, -0.7721218, 0.5768202, 1, 0, 0.5058824, 1,
1.324689, 0.7969411, 0.9906978, 1, 0, 0.4980392, 1,
1.326619, -1.514719, 2.789979, 1, 0, 0.4901961, 1,
1.328271, -0.892571, 1.021112, 1, 0, 0.4862745, 1,
1.328712, 0.1343842, 1.837775, 1, 0, 0.4784314, 1,
1.331143, 1.465178, 0.2759668, 1, 0, 0.4745098, 1,
1.339414, -0.4191948, -0.1716342, 1, 0, 0.4666667, 1,
1.339645, -0.7326586, 0.8258632, 1, 0, 0.4627451, 1,
1.340836, -0.4797088, 2.724818, 1, 0, 0.454902, 1,
1.344407, 0.6797951, 1.388017, 1, 0, 0.4509804, 1,
1.35304, 0.4269171, 0.8264737, 1, 0, 0.4431373, 1,
1.369378, -0.364419, 2.936519, 1, 0, 0.4392157, 1,
1.379714, 2.223169, 1.504779, 1, 0, 0.4313726, 1,
1.382302, 1.99894, 1.5999, 1, 0, 0.427451, 1,
1.382504, -1.150968, 3.999239, 1, 0, 0.4196078, 1,
1.392995, 0.6395307, -0.1902242, 1, 0, 0.4156863, 1,
1.394372, 0.8852023, 1.537416, 1, 0, 0.4078431, 1,
1.396719, 0.1704479, -0.1651322, 1, 0, 0.4039216, 1,
1.40382, 0.1257674, 1.646733, 1, 0, 0.3960784, 1,
1.415708, 0.08411998, 2.00985, 1, 0, 0.3882353, 1,
1.442734, 1.592207, 1.613185, 1, 0, 0.3843137, 1,
1.450406, 0.2605836, 0.7183393, 1, 0, 0.3764706, 1,
1.455406, 0.5483981, 2.131646, 1, 0, 0.372549, 1,
1.46079, 0.2987758, 1.802317, 1, 0, 0.3647059, 1,
1.463078, -0.2526934, 0.216614, 1, 0, 0.3607843, 1,
1.463427, 0.3565825, -0.4198296, 1, 0, 0.3529412, 1,
1.463928, 1.363577, 3.572247, 1, 0, 0.3490196, 1,
1.468623, 0.1631347, 4.170428, 1, 0, 0.3411765, 1,
1.474016, 0.1143546, 1.230106, 1, 0, 0.3372549, 1,
1.488575, 0.5747918, 1.776935, 1, 0, 0.3294118, 1,
1.51987, -0.9372197, 2.511947, 1, 0, 0.3254902, 1,
1.524909, 0.910493, -0.5508938, 1, 0, 0.3176471, 1,
1.527283, -0.70688, 1.27633, 1, 0, 0.3137255, 1,
1.541781, 1.373179, -1.377838, 1, 0, 0.3058824, 1,
1.544636, -0.876929, 0.9523398, 1, 0, 0.2980392, 1,
1.545931, 0.7050844, 1.052253, 1, 0, 0.2941177, 1,
1.561638, -2.454016, 2.947706, 1, 0, 0.2862745, 1,
1.592273, 0.5738088, 0.7637926, 1, 0, 0.282353, 1,
1.596704, -0.06181313, 3.042961, 1, 0, 0.2745098, 1,
1.613223, 0.582307, 2.196819, 1, 0, 0.2705882, 1,
1.614611, -0.8300884, 2.404833, 1, 0, 0.2627451, 1,
1.618528, 0.3895624, 0.283644, 1, 0, 0.2588235, 1,
1.620521, -0.8186557, 1.638924, 1, 0, 0.2509804, 1,
1.648724, -0.5322679, 3.70422, 1, 0, 0.2470588, 1,
1.664075, -2.233516, 2.330622, 1, 0, 0.2392157, 1,
1.669086, 1.786092, 0.9335275, 1, 0, 0.2352941, 1,
1.674037, 0.5581309, 0.9095391, 1, 0, 0.227451, 1,
1.679805, -0.2698336, -0.5338981, 1, 0, 0.2235294, 1,
1.683056, 0.9174387, 1.66064, 1, 0, 0.2156863, 1,
1.688338, 0.5062758, 0.4735694, 1, 0, 0.2117647, 1,
1.71503, -0.1555712, 1.894159, 1, 0, 0.2039216, 1,
1.731787, 0.4778635, 1.231505, 1, 0, 0.1960784, 1,
1.73271, -1.075659, 3.014473, 1, 0, 0.1921569, 1,
1.743651, -0.7449906, 0.4768302, 1, 0, 0.1843137, 1,
1.776261, 1.739422, 1.496342, 1, 0, 0.1803922, 1,
1.793676, -0.1798187, 0.4707899, 1, 0, 0.172549, 1,
1.805243, 0.4231001, 2.314772, 1, 0, 0.1686275, 1,
1.826432, -1.099724, 3.366754, 1, 0, 0.1607843, 1,
1.841688, 0.03546306, 1.150978, 1, 0, 0.1568628, 1,
1.864891, 0.2886354, 0.4695818, 1, 0, 0.1490196, 1,
1.90822, -0.7103316, 1.561677, 1, 0, 0.145098, 1,
1.911848, -0.8861535, 3.167231, 1, 0, 0.1372549, 1,
1.933417, -1.17029, 2.454913, 1, 0, 0.1333333, 1,
1.969685, -0.9182355, 2.350553, 1, 0, 0.1254902, 1,
1.984381, 0.5185263, 1.048825, 1, 0, 0.1215686, 1,
2.017398, -0.4076726, 1.603071, 1, 0, 0.1137255, 1,
2.068882, -0.03430437, 1.859296, 1, 0, 0.1098039, 1,
2.179934, 0.6491469, 1.542092, 1, 0, 0.1019608, 1,
2.188636, -1.270985, 3.000288, 1, 0, 0.09411765, 1,
2.240201, 0.6896861, 0.4671949, 1, 0, 0.09019608, 1,
2.268464, 0.8414547, 0.4595309, 1, 0, 0.08235294, 1,
2.276316, 0.8275938, 0.6186309, 1, 0, 0.07843138, 1,
2.295145, 0.2742441, 2.021672, 1, 0, 0.07058824, 1,
2.328891, 0.5660838, 0.2502092, 1, 0, 0.06666667, 1,
2.341137, 0.09363045, 1.286106, 1, 0, 0.05882353, 1,
2.346162, -0.1152454, 2.87963, 1, 0, 0.05490196, 1,
2.362589, 1.667386, 2.052645, 1, 0, 0.04705882, 1,
2.428435, -0.8060187, 3.364575, 1, 0, 0.04313726, 1,
2.471859, -1.004158, 2.880093, 1, 0, 0.03529412, 1,
2.587695, 1.959049, -0.2960492, 1, 0, 0.03137255, 1,
2.88203, -0.3844341, 0.9547279, 1, 0, 0.02352941, 1,
2.941907, -1.235898, 1.104393, 1, 0, 0.01960784, 1,
3.076905, -0.2648327, 1.826648, 1, 0, 0.01176471, 1,
3.346493, -1.882054, 2.927228, 1, 0, 0.007843138, 1
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
0.2013135, -4.897617, -7.299082, 0, -0.5, 0.5, 0.5,
0.2013135, -4.897617, -7.299082, 1, -0.5, 0.5, 0.5,
0.2013135, -4.897617, -7.299082, 1, 1.5, 0.5, 0.5,
0.2013135, -4.897617, -7.299082, 0, 1.5, 0.5, 0.5
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
-4.010081, 0.3275959, -7.299082, 0, -0.5, 0.5, 0.5,
-4.010081, 0.3275959, -7.299082, 1, -0.5, 0.5, 0.5,
-4.010081, 0.3275959, -7.299082, 1, 1.5, 0.5, 0.5,
-4.010081, 0.3275959, -7.299082, 0, 1.5, 0.5, 0.5
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
-4.010081, -4.897617, 0.02922511, 0, -0.5, 0.5, 0.5,
-4.010081, -4.897617, 0.02922511, 1, -0.5, 0.5, 0.5,
-4.010081, -4.897617, 0.02922511, 1, 1.5, 0.5, 0.5,
-4.010081, -4.897617, 0.02922511, 0, 1.5, 0.5, 0.5
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
-2, -3.691799, -5.607934,
3, -3.691799, -5.607934,
-2, -3.691799, -5.607934,
-2, -3.892768, -5.889792,
-1, -3.691799, -5.607934,
-1, -3.892768, -5.889792,
0, -3.691799, -5.607934,
0, -3.892768, -5.889792,
1, -3.691799, -5.607934,
1, -3.892768, -5.889792,
2, -3.691799, -5.607934,
2, -3.892768, -5.889792,
3, -3.691799, -5.607934,
3, -3.892768, -5.889792
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
-2, -4.294708, -6.453508, 0, -0.5, 0.5, 0.5,
-2, -4.294708, -6.453508, 1, -0.5, 0.5, 0.5,
-2, -4.294708, -6.453508, 1, 1.5, 0.5, 0.5,
-2, -4.294708, -6.453508, 0, 1.5, 0.5, 0.5,
-1, -4.294708, -6.453508, 0, -0.5, 0.5, 0.5,
-1, -4.294708, -6.453508, 1, -0.5, 0.5, 0.5,
-1, -4.294708, -6.453508, 1, 1.5, 0.5, 0.5,
-1, -4.294708, -6.453508, 0, 1.5, 0.5, 0.5,
0, -4.294708, -6.453508, 0, -0.5, 0.5, 0.5,
0, -4.294708, -6.453508, 1, -0.5, 0.5, 0.5,
0, -4.294708, -6.453508, 1, 1.5, 0.5, 0.5,
0, -4.294708, -6.453508, 0, 1.5, 0.5, 0.5,
1, -4.294708, -6.453508, 0, -0.5, 0.5, 0.5,
1, -4.294708, -6.453508, 1, -0.5, 0.5, 0.5,
1, -4.294708, -6.453508, 1, 1.5, 0.5, 0.5,
1, -4.294708, -6.453508, 0, 1.5, 0.5, 0.5,
2, -4.294708, -6.453508, 0, -0.5, 0.5, 0.5,
2, -4.294708, -6.453508, 1, -0.5, 0.5, 0.5,
2, -4.294708, -6.453508, 1, 1.5, 0.5, 0.5,
2, -4.294708, -6.453508, 0, 1.5, 0.5, 0.5,
3, -4.294708, -6.453508, 0, -0.5, 0.5, 0.5,
3, -4.294708, -6.453508, 1, -0.5, 0.5, 0.5,
3, -4.294708, -6.453508, 1, 1.5, 0.5, 0.5,
3, -4.294708, -6.453508, 0, 1.5, 0.5, 0.5
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
-3.038221, -2, -5.607934,
-3.038221, 4, -5.607934,
-3.038221, -2, -5.607934,
-3.200198, -2, -5.889792,
-3.038221, 0, -5.607934,
-3.200198, 0, -5.889792,
-3.038221, 2, -5.607934,
-3.200198, 2, -5.889792,
-3.038221, 4, -5.607934,
-3.200198, 4, -5.889792
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
"2",
"4"
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
-3.524151, -2, -6.453508, 0, -0.5, 0.5, 0.5,
-3.524151, -2, -6.453508, 1, -0.5, 0.5, 0.5,
-3.524151, -2, -6.453508, 1, 1.5, 0.5, 0.5,
-3.524151, -2, -6.453508, 0, 1.5, 0.5, 0.5,
-3.524151, 0, -6.453508, 0, -0.5, 0.5, 0.5,
-3.524151, 0, -6.453508, 1, -0.5, 0.5, 0.5,
-3.524151, 0, -6.453508, 1, 1.5, 0.5, 0.5,
-3.524151, 0, -6.453508, 0, 1.5, 0.5, 0.5,
-3.524151, 2, -6.453508, 0, -0.5, 0.5, 0.5,
-3.524151, 2, -6.453508, 1, -0.5, 0.5, 0.5,
-3.524151, 2, -6.453508, 1, 1.5, 0.5, 0.5,
-3.524151, 2, -6.453508, 0, 1.5, 0.5, 0.5,
-3.524151, 4, -6.453508, 0, -0.5, 0.5, 0.5,
-3.524151, 4, -6.453508, 1, -0.5, 0.5, 0.5,
-3.524151, 4, -6.453508, 1, 1.5, 0.5, 0.5,
-3.524151, 4, -6.453508, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.038221, -3.691799, -4,
-3.038221, -3.691799, 4,
-3.038221, -3.691799, -4,
-3.200198, -3.892768, -4,
-3.038221, -3.691799, -2,
-3.200198, -3.892768, -2,
-3.038221, -3.691799, 0,
-3.200198, -3.892768, 0,
-3.038221, -3.691799, 2,
-3.200198, -3.892768, 2,
-3.038221, -3.691799, 4,
-3.200198, -3.892768, 4
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
-3.524151, -4.294708, -4, 0, -0.5, 0.5, 0.5,
-3.524151, -4.294708, -4, 1, -0.5, 0.5, 0.5,
-3.524151, -4.294708, -4, 1, 1.5, 0.5, 0.5,
-3.524151, -4.294708, -4, 0, 1.5, 0.5, 0.5,
-3.524151, -4.294708, -2, 0, -0.5, 0.5, 0.5,
-3.524151, -4.294708, -2, 1, -0.5, 0.5, 0.5,
-3.524151, -4.294708, -2, 1, 1.5, 0.5, 0.5,
-3.524151, -4.294708, -2, 0, 1.5, 0.5, 0.5,
-3.524151, -4.294708, 0, 0, -0.5, 0.5, 0.5,
-3.524151, -4.294708, 0, 1, -0.5, 0.5, 0.5,
-3.524151, -4.294708, 0, 1, 1.5, 0.5, 0.5,
-3.524151, -4.294708, 0, 0, 1.5, 0.5, 0.5,
-3.524151, -4.294708, 2, 0, -0.5, 0.5, 0.5,
-3.524151, -4.294708, 2, 1, -0.5, 0.5, 0.5,
-3.524151, -4.294708, 2, 1, 1.5, 0.5, 0.5,
-3.524151, -4.294708, 2, 0, 1.5, 0.5, 0.5,
-3.524151, -4.294708, 4, 0, -0.5, 0.5, 0.5,
-3.524151, -4.294708, 4, 1, -0.5, 0.5, 0.5,
-3.524151, -4.294708, 4, 1, 1.5, 0.5, 0.5,
-3.524151, -4.294708, 4, 0, 1.5, 0.5, 0.5
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
-3.038221, -3.691799, -5.607934,
-3.038221, 4.346991, -5.607934,
-3.038221, -3.691799, 5.666385,
-3.038221, 4.346991, 5.666385,
-3.038221, -3.691799, -5.607934,
-3.038221, -3.691799, 5.666385,
-3.038221, 4.346991, -5.607934,
-3.038221, 4.346991, 5.666385,
-3.038221, -3.691799, -5.607934,
3.440848, -3.691799, -5.607934,
-3.038221, -3.691799, 5.666385,
3.440848, -3.691799, 5.666385,
-3.038221, 4.346991, -5.607934,
3.440848, 4.346991, -5.607934,
-3.038221, 4.346991, 5.666385,
3.440848, 4.346991, 5.666385,
3.440848, -3.691799, -5.607934,
3.440848, 4.346991, -5.607934,
3.440848, -3.691799, 5.666385,
3.440848, 4.346991, 5.666385,
3.440848, -3.691799, -5.607934,
3.440848, -3.691799, 5.666385,
3.440848, 4.346991, -5.607934,
3.440848, 4.346991, 5.666385
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
var radius = 8.163282;
var distance = 36.31937;
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
mvMatrix.translate( -0.2013135, -0.3275959, -0.02922511 );
mvMatrix.scale( 1.362279, 1.097964, 0.7828677 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.31937);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Sulfotep<-read.table("Sulfotep.xyz")
```

```
## Error in read.table("Sulfotep.xyz"): no lines available in input
```

```r
x<-Sulfotep$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sulfotep' not found
```

```r
y<-Sulfotep$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sulfotep' not found
```

```r
z<-Sulfotep$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sulfotep' not found
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
-2.943866, -1.380762, -3.525463, 0, 0, 1, 1, 1,
-2.824505, 0.5886544, -3.542068, 1, 0, 0, 1, 1,
-2.752815, 0.877534, 0.03332081, 1, 0, 0, 1, 1,
-2.751808, -1.582133, -2.294344, 1, 0, 0, 1, 1,
-2.704069, -0.4663227, -1.616508, 1, 0, 0, 1, 1,
-2.618365, -1.21981, -0.3575381, 1, 0, 0, 1, 1,
-2.470345, 0.1677229, -2.566582, 0, 0, 0, 1, 1,
-2.427711, -1.264263, -2.705748, 0, 0, 0, 1, 1,
-2.416558, 1.938506, -2.428256, 0, 0, 0, 1, 1,
-2.380754, -1.130377, -2.701147, 0, 0, 0, 1, 1,
-2.206651, -0.4877255, -0.9882178, 0, 0, 0, 1, 1,
-2.18927, 1.379141, -3.041851, 0, 0, 0, 1, 1,
-2.181509, 0.7386721, -1.834847, 0, 0, 0, 1, 1,
-2.157487, 0.2741855, 0.2750617, 1, 1, 1, 1, 1,
-2.14917, 0.05412246, -2.062711, 1, 1, 1, 1, 1,
-2.14184, 0.6186548, -2.503363, 1, 1, 1, 1, 1,
-2.131911, -0.0850647, -1.893594, 1, 1, 1, 1, 1,
-2.108452, 0.6402045, -1.872621, 1, 1, 1, 1, 1,
-2.095036, 0.7612802, -1.977064, 1, 1, 1, 1, 1,
-2.094091, -0.5142429, -3.013005, 1, 1, 1, 1, 1,
-2.062109, -0.5786753, -2.39301, 1, 1, 1, 1, 1,
-2.041377, 0.2299745, -3.092252, 1, 1, 1, 1, 1,
-2.038359, 0.9641682, -1.457989, 1, 1, 1, 1, 1,
-2.038192, 1.412062, -0.4972681, 1, 1, 1, 1, 1,
-2.029852, -0.987946, -4.007739, 1, 1, 1, 1, 1,
-2.01684, 1.13489, 0.3027327, 1, 1, 1, 1, 1,
-2.011977, 0.4400516, -1.159315, 1, 1, 1, 1, 1,
-1.987957, 0.8672124, -2.121326, 1, 1, 1, 1, 1,
-1.985322, -0.6006116, -3.128907, 0, 0, 1, 1, 1,
-1.984771, -0.5180646, -2.040443, 1, 0, 0, 1, 1,
-1.969709, -0.8717625, -1.903204, 1, 0, 0, 1, 1,
-1.963903, 0.8822724, -3.970878, 1, 0, 0, 1, 1,
-1.9576, 0.1077909, -0.9613509, 1, 0, 0, 1, 1,
-1.954473, -0.45912, -1.575121, 1, 0, 0, 1, 1,
-1.902198, -1.011038, -2.006652, 0, 0, 0, 1, 1,
-1.886379, -1.024827, -0.1519966, 0, 0, 0, 1, 1,
-1.87901, 1.808789, -1.524674, 0, 0, 0, 1, 1,
-1.865003, -0.6313384, -1.600164, 0, 0, 0, 1, 1,
-1.838521, -0.6065792, -1.882542, 0, 0, 0, 1, 1,
-1.830651, -0.7614287, -1.010772, 0, 0, 0, 1, 1,
-1.827278, -1.511483, -3.427734, 0, 0, 0, 1, 1,
-1.802968, -0.3508894, -1.750647, 1, 1, 1, 1, 1,
-1.799797, 2.059993, -0.8912515, 1, 1, 1, 1, 1,
-1.793844, -0.4604596, -3.605728, 1, 1, 1, 1, 1,
-1.793708, 0.2851076, -0.3632397, 1, 1, 1, 1, 1,
-1.792151, 0.5462035, -2.46573, 1, 1, 1, 1, 1,
-1.785384, 0.3371648, 0.2257953, 1, 1, 1, 1, 1,
-1.771812, 1.637176, -1.875924, 1, 1, 1, 1, 1,
-1.762396, 0.8571451, -1.530514, 1, 1, 1, 1, 1,
-1.747415, 0.5173969, 0.1923045, 1, 1, 1, 1, 1,
-1.725958, 0.2955772, -0.3977076, 1, 1, 1, 1, 1,
-1.722775, -0.5252938, -2.884993, 1, 1, 1, 1, 1,
-1.710451, 0.03204751, -2.518417, 1, 1, 1, 1, 1,
-1.67549, -0.08456796, -0.3884981, 1, 1, 1, 1, 1,
-1.670509, 0.7386943, 0.7809715, 1, 1, 1, 1, 1,
-1.666483, 0.6250631, -0.3080498, 1, 1, 1, 1, 1,
-1.652685, 0.2527412, -1.363855, 0, 0, 1, 1, 1,
-1.647342, -2.924512, -0.8178981, 1, 0, 0, 1, 1,
-1.621665, 0.1087824, -0.8960213, 1, 0, 0, 1, 1,
-1.607072, -1.020732, -3.890518, 1, 0, 0, 1, 1,
-1.601444, -0.4623235, -1.584843, 1, 0, 0, 1, 1,
-1.598162, -0.5777391, -1.35538, 1, 0, 0, 1, 1,
-1.584026, 0.5947777, -0.4258173, 0, 0, 0, 1, 1,
-1.569555, -0.2698905, -3.412498, 0, 0, 0, 1, 1,
-1.569347, -2.25664, -2.018662, 0, 0, 0, 1, 1,
-1.563481, 0.01917076, -1.374568, 0, 0, 0, 1, 1,
-1.561447, -0.637943, -2.721937, 0, 0, 0, 1, 1,
-1.543495, 0.5331164, 0.2540737, 0, 0, 0, 1, 1,
-1.535607, 0.5349681, -1.444493, 0, 0, 0, 1, 1,
-1.5309, 0.3355725, -0.02670781, 1, 1, 1, 1, 1,
-1.511696, -1.209568, -2.160113, 1, 1, 1, 1, 1,
-1.511619, 0.4766346, -3.140154, 1, 1, 1, 1, 1,
-1.50017, 2.185464, 1.712583, 1, 1, 1, 1, 1,
-1.499294, 1.231305, -3.942039, 1, 1, 1, 1, 1,
-1.492913, 1.185418, -2.367031, 1, 1, 1, 1, 1,
-1.476436, 0.6285362, -0.3214396, 1, 1, 1, 1, 1,
-1.471617, -0.5151541, -1.394268, 1, 1, 1, 1, 1,
-1.471127, 0.5317634, -1.656436, 1, 1, 1, 1, 1,
-1.465789, 0.7644531, -0.3957345, 1, 1, 1, 1, 1,
-1.463865, -0.3819212, -2.720767, 1, 1, 1, 1, 1,
-1.460516, -0.02343923, -2.337959, 1, 1, 1, 1, 1,
-1.450677, -0.3192524, -1.675968, 1, 1, 1, 1, 1,
-1.442933, -0.1781156, -1.95142, 1, 1, 1, 1, 1,
-1.44136, 0.2870919, -1.963904, 1, 1, 1, 1, 1,
-1.43295, -1.258416, -3.174968, 0, 0, 1, 1, 1,
-1.427837, -0.04236868, -0.5390309, 1, 0, 0, 1, 1,
-1.416159, -0.09244517, -1.101694, 1, 0, 0, 1, 1,
-1.412174, 0.3362676, 0.7230698, 1, 0, 0, 1, 1,
-1.407466, -0.5231248, -1.107134, 1, 0, 0, 1, 1,
-1.389751, -0.9354124, -1.129985, 1, 0, 0, 1, 1,
-1.376402, -0.8463725, -2.618236, 0, 0, 0, 1, 1,
-1.375064, -0.8849085, -3.549023, 0, 0, 0, 1, 1,
-1.369903, -0.9545841, -1.738507, 0, 0, 0, 1, 1,
-1.369106, 0.2991894, -0.441821, 0, 0, 0, 1, 1,
-1.358902, -0.3961019, -2.046139, 0, 0, 0, 1, 1,
-1.353128, 0.05907224, -2.405128, 0, 0, 0, 1, 1,
-1.323666, -0.4538427, -0.7955588, 0, 0, 0, 1, 1,
-1.322524, 0.7370697, -1.237238, 1, 1, 1, 1, 1,
-1.310941, 1.001236, -3.417689, 1, 1, 1, 1, 1,
-1.307736, 0.5280899, 0.5363292, 1, 1, 1, 1, 1,
-1.29683, 0.4216585, -1.120917, 1, 1, 1, 1, 1,
-1.29304, 2.659107, -1.58298, 1, 1, 1, 1, 1,
-1.292726, -0.5744836, 1.615198, 1, 1, 1, 1, 1,
-1.289452, -0.490136, -2.222157, 1, 1, 1, 1, 1,
-1.288657, 0.8152064, -1.6426, 1, 1, 1, 1, 1,
-1.288029, 0.1011991, -2.407099, 1, 1, 1, 1, 1,
-1.284562, 0.2662369, -2.404846, 1, 1, 1, 1, 1,
-1.281022, 0.3034863, -1.736373, 1, 1, 1, 1, 1,
-1.278952, 0.5292574, -1.691707, 1, 1, 1, 1, 1,
-1.269619, -0.02136941, -1.536479, 1, 1, 1, 1, 1,
-1.255989, -0.4865698, -1.46139, 1, 1, 1, 1, 1,
-1.254763, -1.803713, -2.97983, 1, 1, 1, 1, 1,
-1.246676, 0.6377718, -1.208646, 0, 0, 1, 1, 1,
-1.243408, -1.376377, -3.282829, 1, 0, 0, 1, 1,
-1.238572, -1.046963, -0.4699454, 1, 0, 0, 1, 1,
-1.234853, 0.003033525, -4.462853, 1, 0, 0, 1, 1,
-1.234443, 1.68375, -0.4427958, 1, 0, 0, 1, 1,
-1.234128, -1.605115, -1.934987, 1, 0, 0, 1, 1,
-1.234053, 1.523708, -1.881889, 0, 0, 0, 1, 1,
-1.227275, -0.4700768, -1.457912, 0, 0, 0, 1, 1,
-1.219171, -0.4438659, -1.202166, 0, 0, 0, 1, 1,
-1.214785, -0.6240699, 0.5595834, 0, 0, 0, 1, 1,
-1.185742, -0.1223538, -2.874076, 0, 0, 0, 1, 1,
-1.184385, -0.4491697, -1.104975, 0, 0, 0, 1, 1,
-1.181647, -0.2239641, -1.579725, 0, 0, 0, 1, 1,
-1.171106, 2.567427, -1.063928, 1, 1, 1, 1, 1,
-1.159509, -1.297404, -2.851611, 1, 1, 1, 1, 1,
-1.150619, 2.046495, 0.8704187, 1, 1, 1, 1, 1,
-1.150133, 1.126723, -0.5924894, 1, 1, 1, 1, 1,
-1.143848, -0.8139618, -1.258188, 1, 1, 1, 1, 1,
-1.124987, -0.9934506, -2.201565, 1, 1, 1, 1, 1,
-1.11604, -0.08965649, -0.6625865, 1, 1, 1, 1, 1,
-1.116008, -0.2690941, -1.079728, 1, 1, 1, 1, 1,
-1.114768, -0.4791018, -1.785845, 1, 1, 1, 1, 1,
-1.108265, 0.07720498, 0.124643, 1, 1, 1, 1, 1,
-1.106344, -0.05841054, -1.279708, 1, 1, 1, 1, 1,
-1.104286, 0.7163355, -1.524602, 1, 1, 1, 1, 1,
-1.103833, -1.573622, -4.211637, 1, 1, 1, 1, 1,
-1.102468, 0.4304057, -0.5935546, 1, 1, 1, 1, 1,
-1.093117, -1.090928, -1.345255, 1, 1, 1, 1, 1,
-1.091305, -2.254756, -3.404095, 0, 0, 1, 1, 1,
-1.081622, -0.08289674, -2.121469, 1, 0, 0, 1, 1,
-1.081604, 0.1033806, -4.14969, 1, 0, 0, 1, 1,
-1.071931, 0.9437752, 0.0121983, 1, 0, 0, 1, 1,
-1.065715, 0.57617, -0.9760366, 1, 0, 0, 1, 1,
-1.062482, -0.161131, -1.63093, 1, 0, 0, 1, 1,
-1.050954, -2.318079, -3.152496, 0, 0, 0, 1, 1,
-1.050493, 0.3636234, -0.6135122, 0, 0, 0, 1, 1,
-1.048975, 1.215133, -1.859805, 0, 0, 0, 1, 1,
-1.044464, 0.3511941, -0.5318589, 0, 0, 0, 1, 1,
-1.043725, 2.183475, -1.11367, 0, 0, 0, 1, 1,
-1.036934, 1.711823, 0.6658762, 0, 0, 0, 1, 1,
-1.031567, -0.0319845, -1.208786, 0, 0, 0, 1, 1,
-1.028885, 1.43078, -2.190387, 1, 1, 1, 1, 1,
-1.025486, -1.1638, -3.197845, 1, 1, 1, 1, 1,
-1.024245, 0.6043919, -0.2084467, 1, 1, 1, 1, 1,
-1.02416, 0.07090212, 0.3897998, 1, 1, 1, 1, 1,
-1.020218, -1.255429, -2.391529, 1, 1, 1, 1, 1,
-1.017059, 0.1009794, -2.480995, 1, 1, 1, 1, 1,
-1.004766, -1.213754, -1.952361, 1, 1, 1, 1, 1,
-1.002619, -0.7401298, -3.886691, 1, 1, 1, 1, 1,
-1.000097, -1.68921, -2.124123, 1, 1, 1, 1, 1,
-0.9989303, 0.1719348, -1.159556, 1, 1, 1, 1, 1,
-0.9981958, 0.6167057, -0.7665245, 1, 1, 1, 1, 1,
-0.9930582, 1.165127, 0.2445969, 1, 1, 1, 1, 1,
-0.9924316, 0.3292407, -2.026608, 1, 1, 1, 1, 1,
-0.9884287, 0.3023221, -3.506098, 1, 1, 1, 1, 1,
-0.9875332, -0.3157096, -2.251362, 1, 1, 1, 1, 1,
-0.9755656, -0.7801601, -2.827328, 0, 0, 1, 1, 1,
-0.9740093, -0.2966446, -1.346846, 1, 0, 0, 1, 1,
-0.9681951, -0.7540958, -3.233803, 1, 0, 0, 1, 1,
-0.9605367, -0.4820748, -2.769472, 1, 0, 0, 1, 1,
-0.9525045, -0.05732881, -2.074433, 1, 0, 0, 1, 1,
-0.9498271, 0.7908865, 0.01199641, 1, 0, 0, 1, 1,
-0.947695, 0.8593288, 0.5769563, 0, 0, 0, 1, 1,
-0.9470482, 1.071765, 0.09464088, 0, 0, 0, 1, 1,
-0.944995, -1.466274, -1.551567, 0, 0, 0, 1, 1,
-0.9422706, 0.6291881, -0.6885848, 0, 0, 0, 1, 1,
-0.9417396, 1.265571, -0.3806556, 0, 0, 0, 1, 1,
-0.9395936, -0.3919022, -2.367483, 0, 0, 0, 1, 1,
-0.9358454, 1.20873, 0.4703138, 0, 0, 0, 1, 1,
-0.9317601, -1.641178, -2.255569, 1, 1, 1, 1, 1,
-0.9266074, 0.9260687, -1.217857, 1, 1, 1, 1, 1,
-0.9082206, 1.017436, 1.700993, 1, 1, 1, 1, 1,
-0.9052384, 0.2024719, -1.102413, 1, 1, 1, 1, 1,
-0.9030638, 0.9498601, -1.486044, 1, 1, 1, 1, 1,
-0.8983781, -0.4976111, -1.058262, 1, 1, 1, 1, 1,
-0.8920929, 0.5760366, 0.2312444, 1, 1, 1, 1, 1,
-0.8920556, -0.02496814, -1.420788, 1, 1, 1, 1, 1,
-0.8867303, 0.663362, -0.6197961, 1, 1, 1, 1, 1,
-0.8840417, -0.6361395, -0.9205916, 1, 1, 1, 1, 1,
-0.8832591, -0.789081, -2.309149, 1, 1, 1, 1, 1,
-0.8795571, 0.993044, 0.298378, 1, 1, 1, 1, 1,
-0.8690578, 0.05100216, -1.488024, 1, 1, 1, 1, 1,
-0.8626723, -0.8701324, -1.876767, 1, 1, 1, 1, 1,
-0.8608952, 1.111956, -0.8278955, 1, 1, 1, 1, 1,
-0.857681, -1.190958, -2.945021, 0, 0, 1, 1, 1,
-0.8477312, 1.113466, -1.464341, 1, 0, 0, 1, 1,
-0.8476539, -1.708696, -2.20291, 1, 0, 0, 1, 1,
-0.8426651, 0.1427328, -0.526125, 1, 0, 0, 1, 1,
-0.8384361, 0.01469459, -2.203902, 1, 0, 0, 1, 1,
-0.8370711, -0.2672151, -0.7214916, 1, 0, 0, 1, 1,
-0.8356081, -0.5354965, -2.770059, 0, 0, 0, 1, 1,
-0.8200637, 0.3904659, -2.707652, 0, 0, 0, 1, 1,
-0.819997, 0.4243484, -1.028753, 0, 0, 0, 1, 1,
-0.8197609, -0.7822906, -1.947441, 0, 0, 0, 1, 1,
-0.8171616, -1.85572, -3.327014, 0, 0, 0, 1, 1,
-0.8123326, 0.1051357, -0.7889089, 0, 0, 0, 1, 1,
-0.8075817, 0.2015189, -0.8910962, 0, 0, 0, 1, 1,
-0.8051382, 1.291947, -0.335195, 1, 1, 1, 1, 1,
-0.7942876, 0.3848126, -0.2730568, 1, 1, 1, 1, 1,
-0.7912558, 0.6417397, -0.6628587, 1, 1, 1, 1, 1,
-0.7903524, 0.9244106, -2.399875, 1, 1, 1, 1, 1,
-0.7892179, 0.4871036, -1.825786, 1, 1, 1, 1, 1,
-0.788076, 0.2078064, -1.459192, 1, 1, 1, 1, 1,
-0.7866415, -0.3171905, -2.899479, 1, 1, 1, 1, 1,
-0.7803265, -0.1967433, -1.611018, 1, 1, 1, 1, 1,
-0.7793704, 0.9357237, -2.394317, 1, 1, 1, 1, 1,
-0.7740354, 0.01280579, -0.8212435, 1, 1, 1, 1, 1,
-0.7701283, 0.6805991, 0.003266609, 1, 1, 1, 1, 1,
-0.7698255, -0.6074887, -1.586405, 1, 1, 1, 1, 1,
-0.7683286, 0.7591764, 0.1254394, 1, 1, 1, 1, 1,
-0.7616793, -0.8887008, -1.977834, 1, 1, 1, 1, 1,
-0.7610663, 1.291604, -0.3107436, 1, 1, 1, 1, 1,
-0.7608351, 0.6282359, -1.649816, 0, 0, 1, 1, 1,
-0.7592936, 1.072909, -0.5885196, 1, 0, 0, 1, 1,
-0.7569792, -0.1872972, -2.898919, 1, 0, 0, 1, 1,
-0.7540677, -1.192372, -2.678549, 1, 0, 0, 1, 1,
-0.7526088, 1.105276, -1.236655, 1, 0, 0, 1, 1,
-0.7510846, -0.6456139, -1.721533, 1, 0, 0, 1, 1,
-0.7385609, -1.429409, -0.5085076, 0, 0, 0, 1, 1,
-0.7384549, -0.03456154, -1.631305, 0, 0, 0, 1, 1,
-0.7356451, 0.6468919, -1.31882, 0, 0, 0, 1, 1,
-0.7341067, 2.425204, -0.0120233, 0, 0, 0, 1, 1,
-0.7335219, -1.734824, -3.566065, 0, 0, 0, 1, 1,
-0.7318863, -1.380092, -3.636733, 0, 0, 0, 1, 1,
-0.7251696, -1.277812, -2.890164, 0, 0, 0, 1, 1,
-0.7230268, -1.573803, -4.280529, 1, 1, 1, 1, 1,
-0.7218571, 0.7329673, -0.5603864, 1, 1, 1, 1, 1,
-0.7216319, 0.6390169, 0.7718562, 1, 1, 1, 1, 1,
-0.7215352, -0.3595921, -1.420737, 1, 1, 1, 1, 1,
-0.7171628, 0.4794717, -0.9130635, 1, 1, 1, 1, 1,
-0.716546, -1.149812, -3.232287, 1, 1, 1, 1, 1,
-0.7148443, -0.2552326, -1.636218, 1, 1, 1, 1, 1,
-0.7103311, -0.1054851, -3.828625, 1, 1, 1, 1, 1,
-0.7099658, 1.139057, -0.7627071, 1, 1, 1, 1, 1,
-0.7092256, 1.289616, 0.6994408, 1, 1, 1, 1, 1,
-0.7058012, -0.3614917, -1.917932, 1, 1, 1, 1, 1,
-0.6948604, -1.01292, -3.014287, 1, 1, 1, 1, 1,
-0.6925643, 0.02049269, -2.381394, 1, 1, 1, 1, 1,
-0.6925367, -2.002086, -0.6788792, 1, 1, 1, 1, 1,
-0.6913062, 1.599917, -0.2149004, 1, 1, 1, 1, 1,
-0.689912, 0.6474705, -1.167166, 0, 0, 1, 1, 1,
-0.6861597, -0.8996292, -3.390519, 1, 0, 0, 1, 1,
-0.6842945, -0.7724135, -0.8496585, 1, 0, 0, 1, 1,
-0.6810313, -2.129614, -4.039725, 1, 0, 0, 1, 1,
-0.6764621, 0.8956435, -0.5882605, 1, 0, 0, 1, 1,
-0.6742561, -0.8601909, -1.430586, 1, 0, 0, 1, 1,
-0.6732662, 0.7832924, -0.82387, 0, 0, 0, 1, 1,
-0.6645077, -0.1629721, -2.65691, 0, 0, 0, 1, 1,
-0.6571923, 0.3077283, -2.410542, 0, 0, 0, 1, 1,
-0.6535466, -0.3704687, -3.61571, 0, 0, 0, 1, 1,
-0.6535055, 0.9841053, 0.1036346, 0, 0, 0, 1, 1,
-0.6534079, 0.4214557, -1.03345, 0, 0, 0, 1, 1,
-0.653302, -0.05870542, -1.67393, 0, 0, 0, 1, 1,
-0.6417389, 1.987315, 1.371611, 1, 1, 1, 1, 1,
-0.6404827, 0.350618, -2.127292, 1, 1, 1, 1, 1,
-0.6350074, 0.2050471, -0.7249323, 1, 1, 1, 1, 1,
-0.63269, 0.7652819, -1.73985, 1, 1, 1, 1, 1,
-0.6321194, 1.430013, 0.6460487, 1, 1, 1, 1, 1,
-0.6318983, 0.6951507, 0.2781701, 1, 1, 1, 1, 1,
-0.6307742, 0.5200095, 0.1541214, 1, 1, 1, 1, 1,
-0.6253456, -1.032331, -3.956643, 1, 1, 1, 1, 1,
-0.6243919, 1.090989, -0.08899233, 1, 1, 1, 1, 1,
-0.6209731, 0.6996502, -1.827584, 1, 1, 1, 1, 1,
-0.6209067, 0.6417297, 0.8407961, 1, 1, 1, 1, 1,
-0.6173799, 1.24149, -1.739627, 1, 1, 1, 1, 1,
-0.6154843, 1.130948, 0.2321395, 1, 1, 1, 1, 1,
-0.6107268, 0.691552, -1.606057, 1, 1, 1, 1, 1,
-0.6098537, 0.5443367, -1.749882, 1, 1, 1, 1, 1,
-0.6013457, -0.6691931, -1.625836, 0, 0, 1, 1, 1,
-0.6003439, -0.03541566, -1.309651, 1, 0, 0, 1, 1,
-0.5992032, 1.22788, -1.274324, 1, 0, 0, 1, 1,
-0.596101, -0.8807673, -1.425843, 1, 0, 0, 1, 1,
-0.5941462, -0.5316751, -1.491066, 1, 0, 0, 1, 1,
-0.5918823, 0.1066049, -0.5294015, 1, 0, 0, 1, 1,
-0.5914542, 2.237822, -1.80793, 0, 0, 0, 1, 1,
-0.5880925, -1.094442, -2.989611, 0, 0, 0, 1, 1,
-0.5878431, 0.1393248, -0.749597, 0, 0, 0, 1, 1,
-0.5861044, -0.3632532, -1.884363, 0, 0, 0, 1, 1,
-0.5860227, 0.154711, -2.202479, 0, 0, 0, 1, 1,
-0.5857154, 0.5734978, -0.7164505, 0, 0, 0, 1, 1,
-0.5846238, 0.2623127, -0.01864766, 0, 0, 0, 1, 1,
-0.580301, -0.8038164, -1.324479, 1, 1, 1, 1, 1,
-0.5772098, -0.5480387, -3.641039, 1, 1, 1, 1, 1,
-0.5704193, -0.2354869, -3.607492, 1, 1, 1, 1, 1,
-0.5653298, -0.7609036, -1.27231, 1, 1, 1, 1, 1,
-0.564377, -0.8376848, -3.172195, 1, 1, 1, 1, 1,
-0.5567628, 0.4632357, -0.5168689, 1, 1, 1, 1, 1,
-0.5557796, -0.2314046, -0.2372253, 1, 1, 1, 1, 1,
-0.5545112, -0.5735286, -3.160842, 1, 1, 1, 1, 1,
-0.5516806, -0.865822, -4.069266, 1, 1, 1, 1, 1,
-0.5508557, 1.774639, -0.5048751, 1, 1, 1, 1, 1,
-0.5421365, -1.75025, -2.01087, 1, 1, 1, 1, 1,
-0.53881, -1.218567, -3.999004, 1, 1, 1, 1, 1,
-0.5382769, -0.4396121, -2.103335, 1, 1, 1, 1, 1,
-0.5352684, -0.01779654, -0.3663021, 1, 1, 1, 1, 1,
-0.5261728, 0.8369406, -0.8494475, 1, 1, 1, 1, 1,
-0.524693, -0.6885064, -3.028286, 0, 0, 1, 1, 1,
-0.523881, 0.8605477, -0.6370488, 1, 0, 0, 1, 1,
-0.5213063, 1.011788, -0.8746259, 1, 0, 0, 1, 1,
-0.5179839, 0.147266, -1.62785, 1, 0, 0, 1, 1,
-0.5177129, -0.4342714, -2.907644, 1, 0, 0, 1, 1,
-0.5120808, -0.9252538, -0.3386247, 1, 0, 0, 1, 1,
-0.5120171, -0.3644267, -1.673415, 0, 0, 0, 1, 1,
-0.5116586, -0.1566931, -2.750529, 0, 0, 0, 1, 1,
-0.5113581, -0.4310295, -1.839908, 0, 0, 0, 1, 1,
-0.5085628, -0.4303989, -2.348275, 0, 0, 0, 1, 1,
-0.506646, 0.0143588, -1.494988, 0, 0, 0, 1, 1,
-0.5049273, 0.4189574, -1.326512, 0, 0, 0, 1, 1,
-0.5035384, 0.5057294, -1.508386, 0, 0, 0, 1, 1,
-0.5024655, 1.593347, -0.2839084, 1, 1, 1, 1, 1,
-0.501341, 1.400401, -0.7692354, 1, 1, 1, 1, 1,
-0.5006295, -0.07478755, -1.697953, 1, 1, 1, 1, 1,
-0.4993921, -0.5831024, -2.026213, 1, 1, 1, 1, 1,
-0.4990363, 1.290485, -0.2651107, 1, 1, 1, 1, 1,
-0.4953338, -0.4127406, -4.375832, 1, 1, 1, 1, 1,
-0.4940941, -0.08550365, -1.14938, 1, 1, 1, 1, 1,
-0.4921734, -0.8105105, -3.564859, 1, 1, 1, 1, 1,
-0.4911894, 0.3034993, -1.382248, 1, 1, 1, 1, 1,
-0.4876875, -0.1303914, -1.168577, 1, 1, 1, 1, 1,
-0.4862874, -1.269773, -2.904405, 1, 1, 1, 1, 1,
-0.484361, 0.4322289, -0.01720905, 1, 1, 1, 1, 1,
-0.4829433, -0.3565657, -1.789362, 1, 1, 1, 1, 1,
-0.4825471, 1.213275, -2.193157, 1, 1, 1, 1, 1,
-0.4811498, -0.3763739, -3.438444, 1, 1, 1, 1, 1,
-0.4794721, -2.06356, -2.289817, 0, 0, 1, 1, 1,
-0.4766859, 0.2359453, -0.232688, 1, 0, 0, 1, 1,
-0.4753116, 0.1773619, -2.165709, 1, 0, 0, 1, 1,
-0.4751526, -0.266689, -1.639905, 1, 0, 0, 1, 1,
-0.4734773, -0.2727663, -3.60138, 1, 0, 0, 1, 1,
-0.4692122, 0.311534, -0.2159525, 1, 0, 0, 1, 1,
-0.466307, -0.8254089, -1.210809, 0, 0, 0, 1, 1,
-0.4603865, 0.5517752, -2.153804, 0, 0, 0, 1, 1,
-0.458786, -0.3418791, -3.867107, 0, 0, 0, 1, 1,
-0.4584056, 0.6396125, 0.0478809, 0, 0, 0, 1, 1,
-0.4583234, 0.9670269, 0.002766905, 0, 0, 0, 1, 1,
-0.4563131, 0.07562855, -0.1398323, 0, 0, 0, 1, 1,
-0.4518359, -0.008945406, -0.6079397, 0, 0, 0, 1, 1,
-0.449052, 0.03081073, -2.551032, 1, 1, 1, 1, 1,
-0.4474783, -0.5097069, -0.9111434, 1, 1, 1, 1, 1,
-0.4422774, 0.6907325, -0.05664924, 1, 1, 1, 1, 1,
-0.4421783, -0.2846064, -3.231932, 1, 1, 1, 1, 1,
-0.4359737, 0.5801698, -1.935899, 1, 1, 1, 1, 1,
-0.4344361, 0.3150132, -0.9902457, 1, 1, 1, 1, 1,
-0.4333857, 1.445125, 0.3212587, 1, 1, 1, 1, 1,
-0.4312902, 0.6693922, -1.517342, 1, 1, 1, 1, 1,
-0.4301592, -2.679133, -3.760033, 1, 1, 1, 1, 1,
-0.4282233, 0.007282173, -0.9616902, 1, 1, 1, 1, 1,
-0.422423, -0.3244249, -3.178082, 1, 1, 1, 1, 1,
-0.4168225, 0.3858741, -0.1108075, 1, 1, 1, 1, 1,
-0.4142591, -0.7520027, -2.235037, 1, 1, 1, 1, 1,
-0.4115959, 0.246316, -1.655663, 1, 1, 1, 1, 1,
-0.4041414, -1.183161, -3.681751, 1, 1, 1, 1, 1,
-0.4036593, 0.6778674, -0.2375033, 0, 0, 1, 1, 1,
-0.4014321, -0.4043151, -3.855846, 1, 0, 0, 1, 1,
-0.3991082, 0.6081187, -2.080333, 1, 0, 0, 1, 1,
-0.3973179, 0.1682257, -0.6098097, 1, 0, 0, 1, 1,
-0.3967553, -0.1656225, -2.688835, 1, 0, 0, 1, 1,
-0.3934373, 1.162686, -1.756768, 1, 0, 0, 1, 1,
-0.3929045, 1.133234, -1.065636, 0, 0, 0, 1, 1,
-0.3869269, -0.07271226, -2.069228, 0, 0, 0, 1, 1,
-0.3869119, -1.560037, -2.768266, 0, 0, 0, 1, 1,
-0.3856957, -0.7171052, -3.226378, 0, 0, 0, 1, 1,
-0.3843973, -0.0012472, -1.497367, 0, 0, 0, 1, 1,
-0.3834447, -0.5686061, -4.682859, 0, 0, 0, 1, 1,
-0.3768832, 0.8438368, -0.09956216, 0, 0, 0, 1, 1,
-0.3595909, -0.1449962, -3.249784, 1, 1, 1, 1, 1,
-0.3588725, -1.799687, -3.416019, 1, 1, 1, 1, 1,
-0.3549789, -0.1025086, -1.869051, 1, 1, 1, 1, 1,
-0.3542705, -0.8602085, -3.392233, 1, 1, 1, 1, 1,
-0.3518654, -0.298248, -2.402549, 1, 1, 1, 1, 1,
-0.3456421, -0.09646931, -2.332172, 1, 1, 1, 1, 1,
-0.3440422, 0.211275, -1.871011, 1, 1, 1, 1, 1,
-0.3429589, -2.315044, -3.437336, 1, 1, 1, 1, 1,
-0.3406431, -1.362786, -2.024766, 1, 1, 1, 1, 1,
-0.3263161, 0.6884341, 0.9812493, 1, 1, 1, 1, 1,
-0.3237817, -0.2861846, -4.704242, 1, 1, 1, 1, 1,
-0.3222428, -0.1902135, -1.71099, 1, 1, 1, 1, 1,
-0.3206014, 0.2538383, -0.4243453, 1, 1, 1, 1, 1,
-0.3193538, -0.1736975, -1.614836, 1, 1, 1, 1, 1,
-0.3160477, -0.417084, -1.25144, 1, 1, 1, 1, 1,
-0.3151673, 0.08720136, -2.481233, 0, 0, 1, 1, 1,
-0.3108222, 1.984997, -1.030288, 1, 0, 0, 1, 1,
-0.3064292, -0.13704, 0.7219463, 1, 0, 0, 1, 1,
-0.2997763, 1.360619, -1.029737, 1, 0, 0, 1, 1,
-0.295716, 0.5063733, -0.07054076, 1, 0, 0, 1, 1,
-0.2924058, 0.1533403, -2.345179, 1, 0, 0, 1, 1,
-0.2913283, 0.04977076, -1.478891, 0, 0, 0, 1, 1,
-0.2836788, 1.787794, 0.7164776, 0, 0, 0, 1, 1,
-0.2814804, -0.5931698, -2.959593, 0, 0, 0, 1, 1,
-0.2772174, -0.1474943, -0.8375916, 0, 0, 0, 1, 1,
-0.2752573, -1.422235, -2.521647, 0, 0, 0, 1, 1,
-0.2748554, 1.313676, -0.06718495, 0, 0, 0, 1, 1,
-0.2719677, 0.5279474, 0.5054228, 0, 0, 0, 1, 1,
-0.2704841, 2.007426, 1.556093, 1, 1, 1, 1, 1,
-0.2703261, 3.303107, 1.478533, 1, 1, 1, 1, 1,
-0.2673931, -0.4704363, -3.196654, 1, 1, 1, 1, 1,
-0.267092, -0.5390031, -1.484347, 1, 1, 1, 1, 1,
-0.2634843, -0.6512371, -3.236699, 1, 1, 1, 1, 1,
-0.259162, 1.639348, -1.15936, 1, 1, 1, 1, 1,
-0.2577514, -0.1613977, -2.75144, 1, 1, 1, 1, 1,
-0.2550249, -0.201121, -3.137681, 1, 1, 1, 1, 1,
-0.249944, 0.5460507, -0.1900227, 1, 1, 1, 1, 1,
-0.2494961, 1.65071, -0.202149, 1, 1, 1, 1, 1,
-0.2476156, -1.572661, -1.168074, 1, 1, 1, 1, 1,
-0.2455775, 0.04972424, -1.175913, 1, 1, 1, 1, 1,
-0.2409825, 0.5319749, -0.3175678, 1, 1, 1, 1, 1,
-0.2376072, 0.04968679, -0.8906596, 1, 1, 1, 1, 1,
-0.2368187, 0.0942436, -1.940653, 1, 1, 1, 1, 1,
-0.2317619, 0.9222893, 1.653931, 0, 0, 1, 1, 1,
-0.2274868, 1.606005, 0.2313355, 1, 0, 0, 1, 1,
-0.2264966, -0.2884977, -1.541604, 1, 0, 0, 1, 1,
-0.2263455, -0.5226831, -2.860045, 1, 0, 0, 1, 1,
-0.2237954, 1.108302, -0.2171491, 1, 0, 0, 1, 1,
-0.2237852, 0.212464, -0.7341437, 1, 0, 0, 1, 1,
-0.2233749, -1.666852, -3.279904, 0, 0, 0, 1, 1,
-0.2183668, -1.309599, -3.896349, 0, 0, 0, 1, 1,
-0.2171003, 1.384212, -0.9630529, 0, 0, 0, 1, 1,
-0.2128047, 0.02380252, -2.058751, 0, 0, 0, 1, 1,
-0.2118615, -0.723492, -1.746732, 0, 0, 0, 1, 1,
-0.2111194, 0.2794718, -3.433206, 0, 0, 0, 1, 1,
-0.2084241, 0.3782486, -1.49093, 0, 0, 0, 1, 1,
-0.2073514, 2.009316, -1.062482, 1, 1, 1, 1, 1,
-0.2047737, -0.3520162, -3.169973, 1, 1, 1, 1, 1,
-0.1998162, -0.5542402, -3.693194, 1, 1, 1, 1, 1,
-0.1992266, -1.501721, -2.856086, 1, 1, 1, 1, 1,
-0.1978184, 0.953257, 1.143826, 1, 1, 1, 1, 1,
-0.1964935, -1.567124, -4.316913, 1, 1, 1, 1, 1,
-0.1948862, -1.470429, -5.443745, 1, 1, 1, 1, 1,
-0.1929695, 0.8016633, 0.2789136, 1, 1, 1, 1, 1,
-0.1922489, 0.5276951, -0.7641321, 1, 1, 1, 1, 1,
-0.1912122, -1.101536, -4.324073, 1, 1, 1, 1, 1,
-0.189819, 0.6750224, 0.9681245, 1, 1, 1, 1, 1,
-0.185533, -1.682708, -2.708859, 1, 1, 1, 1, 1,
-0.1763254, 0.8624848, 0.09757164, 1, 1, 1, 1, 1,
-0.1752798, -1.136306, -2.998158, 1, 1, 1, 1, 1,
-0.1731444, 0.3004785, -0.02136242, 1, 1, 1, 1, 1,
-0.1721042, 0.1280057, -2.471327, 0, 0, 1, 1, 1,
-0.1712676, -0.5636443, -3.030635, 1, 0, 0, 1, 1,
-0.1700006, 0.753623, -2.141782, 1, 0, 0, 1, 1,
-0.1664133, -0.9749066, -2.640872, 1, 0, 0, 1, 1,
-0.16461, 0.8063887, 0.4404228, 1, 0, 0, 1, 1,
-0.1642531, 0.1919085, 1.716389, 1, 0, 0, 1, 1,
-0.1610024, -0.2321425, -4.051136, 0, 0, 0, 1, 1,
-0.1601939, -1.173705, -2.905692, 0, 0, 0, 1, 1,
-0.159359, -0.8098226, -2.580237, 0, 0, 0, 1, 1,
-0.1545775, -0.1327361, -1.488158, 0, 0, 0, 1, 1,
-0.1514621, -0.09053699, -1.411352, 0, 0, 0, 1, 1,
-0.147121, 1.333426, 0.1874939, 0, 0, 0, 1, 1,
-0.1463214, -0.1599739, -4.117727, 0, 0, 0, 1, 1,
-0.1445812, -2.199517, -2.631827, 1, 1, 1, 1, 1,
-0.1444748, 0.5091289, -0.05595709, 1, 1, 1, 1, 1,
-0.1421503, -0.707494, -2.648846, 1, 1, 1, 1, 1,
-0.1420086, -0.13288, -2.190704, 1, 1, 1, 1, 1,
-0.139021, -0.9811689, -3.169183, 1, 1, 1, 1, 1,
-0.1342122, 0.6569388, -0.6606323, 1, 1, 1, 1, 1,
-0.1337008, 0.2310652, -0.5098029, 1, 1, 1, 1, 1,
-0.1323665, -0.7830154, -1.495358, 1, 1, 1, 1, 1,
-0.132218, 0.1377421, -1.685757, 1, 1, 1, 1, 1,
-0.1315066, 0.339128, 0.9106817, 1, 1, 1, 1, 1,
-0.1251812, -1.192103, -3.062754, 1, 1, 1, 1, 1,
-0.1245906, 1.29422, -0.09168933, 1, 1, 1, 1, 1,
-0.1196218, 2.355497, -1.029196, 1, 1, 1, 1, 1,
-0.1187189, -0.09707705, -1.591059, 1, 1, 1, 1, 1,
-0.1129535, -0.713589, -4.155877, 1, 1, 1, 1, 1,
-0.1087656, 0.4132014, 0.5253626, 0, 0, 1, 1, 1,
-0.1051964, -0.5385687, -3.706631, 1, 0, 0, 1, 1,
-0.1047035, -0.05939982, -3.675484, 1, 0, 0, 1, 1,
-0.09991056, 1.392569, 0.2323551, 1, 0, 0, 1, 1,
-0.09480567, -2.307884, -4.340571, 1, 0, 0, 1, 1,
-0.09330728, 0.3713818, 2.307091, 1, 0, 0, 1, 1,
-0.08938102, 1.05194, 2.940436, 0, 0, 0, 1, 1,
-0.08905772, -1.771773, -3.807058, 0, 0, 0, 1, 1,
-0.08897074, -0.9947313, -1.225557, 0, 0, 0, 1, 1,
-0.08473687, 0.4169493, -1.074516, 0, 0, 0, 1, 1,
-0.08281228, 0.7154573, 2.051262, 0, 0, 0, 1, 1,
-0.08268427, 0.2820451, 0.08571491, 0, 0, 0, 1, 1,
-0.07933459, -0.793555, -2.883527, 0, 0, 0, 1, 1,
-0.07363277, -0.7040039, -1.21259, 1, 1, 1, 1, 1,
-0.07267273, 1.151096, -0.7916608, 1, 1, 1, 1, 1,
-0.06831261, 0.4328324, 1.308136, 1, 1, 1, 1, 1,
-0.06768575, 0.6066783, 1.002958, 1, 1, 1, 1, 1,
-0.0675103, -0.8152763, -3.558467, 1, 1, 1, 1, 1,
-0.06744538, 0.634358, 0.8868743, 1, 1, 1, 1, 1,
-0.06722713, 2.010085, 0.5600678, 1, 1, 1, 1, 1,
-0.0648962, 0.7594161, 0.6783957, 1, 1, 1, 1, 1,
-0.06137558, -1.880323, -4.305878, 1, 1, 1, 1, 1,
-0.06067444, 0.3070415, 0.2472944, 1, 1, 1, 1, 1,
-0.05782481, -1.696111, -2.585111, 1, 1, 1, 1, 1,
-0.05739462, -0.7878441, -3.157313, 1, 1, 1, 1, 1,
-0.0568307, -0.3538007, -2.703171, 1, 1, 1, 1, 1,
-0.05388337, -0.8868192, -3.699203, 1, 1, 1, 1, 1,
-0.05231869, 2.24124, -0.5073107, 1, 1, 1, 1, 1,
-0.05041789, 0.01162183, -0.6602974, 0, 0, 1, 1, 1,
-0.04335664, 0.353606, 0.9948926, 1, 0, 0, 1, 1,
-0.04304844, 1.27595, -0.8796182, 1, 0, 0, 1, 1,
-0.04159944, 1.465267, 1.158844, 1, 0, 0, 1, 1,
-0.04144866, 1.353149, 2.21888, 1, 0, 0, 1, 1,
-0.03868071, -1.003183, -1.674622, 1, 0, 0, 1, 1,
-0.03641653, -0.4765608, -4.480891, 0, 0, 0, 1, 1,
-0.03351831, -1.593597, -1.888717, 0, 0, 0, 1, 1,
-0.0297006, -0.7046628, -3.10021, 0, 0, 0, 1, 1,
-0.02731298, -0.7100714, -5.191219, 0, 0, 0, 1, 1,
-0.02503742, 0.5022849, 0.4699162, 0, 0, 0, 1, 1,
-0.01863453, -1.068994, -3.208596, 0, 0, 0, 1, 1,
-0.01813022, 0.700031, -0.4421577, 0, 0, 0, 1, 1,
-0.01564361, 1.452777, 0.5550979, 1, 1, 1, 1, 1,
-0.01504446, 0.6971146, 0.2932087, 1, 1, 1, 1, 1,
-0.01448442, 0.6909976, -1.503326, 1, 1, 1, 1, 1,
-0.009039721, 2.050517, -1.159848, 1, 1, 1, 1, 1,
-0.007466029, -1.087631, -4.695546, 1, 1, 1, 1, 1,
-0.005976209, 1.848973, 0.6949086, 1, 1, 1, 1, 1,
-0.003851893, 0.5193528, 0.1653623, 1, 1, 1, 1, 1,
-0.002462628, -1.018405, -4.015537, 1, 1, 1, 1, 1,
-0.00222082, -0.6563224, -4.44906, 1, 1, 1, 1, 1,
-0.002167446, 0.5093517, -1.342181, 1, 1, 1, 1, 1,
0.002724439, -0.4987268, 4.023773, 1, 1, 1, 1, 1,
0.004667431, -0.6786628, 3.775093, 1, 1, 1, 1, 1,
0.006393975, 0.112684, 0.03552291, 1, 1, 1, 1, 1,
0.01347763, -0.1190329, 2.125296, 1, 1, 1, 1, 1,
0.01488345, -1.053687, 2.606562, 1, 1, 1, 1, 1,
0.01665041, -1.415323, 5.502195, 0, 0, 1, 1, 1,
0.02035943, 0.7271599, -0.5783769, 1, 0, 0, 1, 1,
0.02291502, -0.4637715, 4.381999, 1, 0, 0, 1, 1,
0.02342313, 0.4618584, -0.4249268, 1, 0, 0, 1, 1,
0.0236308, -1.314065, 2.627618, 1, 0, 0, 1, 1,
0.0245099, -0.4407347, 1.37473, 1, 0, 0, 1, 1,
0.02471995, -0.2473509, 2.331104, 0, 0, 0, 1, 1,
0.02537124, 0.811013, 0.7519227, 0, 0, 0, 1, 1,
0.0265229, -0.8862717, 4.360628, 0, 0, 0, 1, 1,
0.02923916, -0.7118331, 2.864899, 0, 0, 0, 1, 1,
0.03500298, -0.3370386, 1.238137, 0, 0, 0, 1, 1,
0.03688568, -1.822931, 3.984808, 0, 0, 0, 1, 1,
0.0449754, 0.5459538, 0.1670164, 0, 0, 0, 1, 1,
0.04876869, 0.2376136, -0.1877369, 1, 1, 1, 1, 1,
0.04915901, -0.1462861, 2.0987, 1, 1, 1, 1, 1,
0.05074246, -0.5855374, 2.68418, 1, 1, 1, 1, 1,
0.05414958, 0.8829161, 1.310984, 1, 1, 1, 1, 1,
0.05422401, -1.043487, 4.294116, 1, 1, 1, 1, 1,
0.06059195, 0.9594223, -1.417647, 1, 1, 1, 1, 1,
0.06221931, 1.141041, -0.7116706, 1, 1, 1, 1, 1,
0.06276059, 0.4230281, 1.562194, 1, 1, 1, 1, 1,
0.06354495, -0.2765874, 2.900088, 1, 1, 1, 1, 1,
0.06917926, -2.308753, 3.337744, 1, 1, 1, 1, 1,
0.07077424, 0.8437408, 2.270784, 1, 1, 1, 1, 1,
0.07355966, 0.07339812, 0.1997052, 1, 1, 1, 1, 1,
0.07482721, 0.7533814, -0.07218034, 1, 1, 1, 1, 1,
0.07880317, 0.7073916, 0.3271477, 1, 1, 1, 1, 1,
0.08227684, -0.5567012, 2.086468, 1, 1, 1, 1, 1,
0.08360679, -1.176382, 2.795459, 0, 0, 1, 1, 1,
0.08691681, -1.284347, 4.79357, 1, 0, 0, 1, 1,
0.09060374, -1.218068, 2.773858, 1, 0, 0, 1, 1,
0.09347041, 0.3755895, 0.5639642, 1, 0, 0, 1, 1,
0.09908572, -1.008994, 3.108839, 1, 0, 0, 1, 1,
0.1048415, -0.1854644, 2.676516, 1, 0, 0, 1, 1,
0.1076436, -0.283622, 2.401068, 0, 0, 0, 1, 1,
0.1090932, 0.2441965, 2.151479, 0, 0, 0, 1, 1,
0.1147455, -0.2340176, 4.750641, 0, 0, 0, 1, 1,
0.1155776, -0.5537801, 4.763003, 0, 0, 0, 1, 1,
0.1163005, 1.886633, -0.02764273, 0, 0, 0, 1, 1,
0.1172772, -1.173797, 4.059888, 0, 0, 0, 1, 1,
0.117358, 1.743578, 0.8587517, 0, 0, 0, 1, 1,
0.1192566, -0.8259564, 3.943839, 1, 1, 1, 1, 1,
0.1221284, -0.7112165, 2.38636, 1, 1, 1, 1, 1,
0.1338061, 1.440795, -0.1808398, 1, 1, 1, 1, 1,
0.1338754, 1.725499, 0.5226309, 1, 1, 1, 1, 1,
0.1385058, 1.132475, -0.1601183, 1, 1, 1, 1, 1,
0.1417657, 1.178968, 1.331261, 1, 1, 1, 1, 1,
0.1428169, -0.02318715, 1.141141, 1, 1, 1, 1, 1,
0.1466048, 0.2792236, -0.767593, 1, 1, 1, 1, 1,
0.1513161, 0.679372, 0.3276673, 1, 1, 1, 1, 1,
0.1534398, 0.6866726, 0.9904708, 1, 1, 1, 1, 1,
0.1659808, 0.04274504, 2.461079, 1, 1, 1, 1, 1,
0.1687225, 0.3774008, 0.09923982, 1, 1, 1, 1, 1,
0.1704429, 1.468718, -0.7592592, 1, 1, 1, 1, 1,
0.1714056, 1.569372, 1.784992, 1, 1, 1, 1, 1,
0.175549, 0.08132517, 2.86305, 1, 1, 1, 1, 1,
0.1774879, 0.09975145, 2.571306, 0, 0, 1, 1, 1,
0.1777252, -0.2781656, 1.895977, 1, 0, 0, 1, 1,
0.181899, 1.689532, -2.186591, 1, 0, 0, 1, 1,
0.183147, -0.5993243, 2.169812, 1, 0, 0, 1, 1,
0.1836915, 0.3510432, 0.5376683, 1, 0, 0, 1, 1,
0.1858039, -1.881661, 2.299018, 1, 0, 0, 1, 1,
0.1861808, -0.6121294, 3.06061, 0, 0, 0, 1, 1,
0.1897774, 0.07222598, 0.1555412, 0, 0, 0, 1, 1,
0.1931618, -0.675823, 2.393073, 0, 0, 0, 1, 1,
0.1946111, 0.1632657, 0.9515961, 0, 0, 0, 1, 1,
0.1993548, -0.50143, 2.322901, 0, 0, 0, 1, 1,
0.2012653, -0.7267436, 2.840302, 0, 0, 0, 1, 1,
0.2021844, -0.3560878, 2.944752, 0, 0, 0, 1, 1,
0.2022609, 1.985624, 2.064389, 1, 1, 1, 1, 1,
0.2053964, -0.5048374, 1.847065, 1, 1, 1, 1, 1,
0.210604, -1.241416, 2.817272, 1, 1, 1, 1, 1,
0.2132602, 0.2619074, 0.2544619, 1, 1, 1, 1, 1,
0.2226646, 1.112455, -0.06336517, 1, 1, 1, 1, 1,
0.2240614, -0.6626516, 3.309083, 1, 1, 1, 1, 1,
0.2291036, 0.9501248, 1.805432, 1, 1, 1, 1, 1,
0.2315053, 0.1041486, 0.5226717, 1, 1, 1, 1, 1,
0.2317031, -0.07838619, 1.99376, 1, 1, 1, 1, 1,
0.2398503, 0.3558218, 0.5400215, 1, 1, 1, 1, 1,
0.2459897, 0.3397811, -0.1121865, 1, 1, 1, 1, 1,
0.2479369, 0.9953327, -0.2395827, 1, 1, 1, 1, 1,
0.2508603, 0.1144752, 0.654368, 1, 1, 1, 1, 1,
0.2539996, -1.192284, 3.348963, 1, 1, 1, 1, 1,
0.2546799, 0.1241874, -0.2192367, 1, 1, 1, 1, 1,
0.2555794, 1.653718, -0.7225189, 0, 0, 1, 1, 1,
0.2589439, 1.026286, 0.8268137, 1, 0, 0, 1, 1,
0.2642777, 0.5986645, 2.004791, 1, 0, 0, 1, 1,
0.2667745, -0.9201538, 3.740769, 1, 0, 0, 1, 1,
0.2674688, 0.552573, -0.07499566, 1, 0, 0, 1, 1,
0.2680973, 0.1232358, 0.6505775, 1, 0, 0, 1, 1,
0.2701104, 0.1697448, 1.840072, 0, 0, 0, 1, 1,
0.271954, 1.507219, 0.2561079, 0, 0, 0, 1, 1,
0.2723967, -1.029243, 2.003318, 0, 0, 0, 1, 1,
0.2727604, 0.6143513, 2.304277, 0, 0, 0, 1, 1,
0.2769987, 0.7892554, 0.2763328, 0, 0, 0, 1, 1,
0.2805303, 0.4881254, 0.9870761, 0, 0, 0, 1, 1,
0.2810281, 1.736518, 0.002303119, 0, 0, 0, 1, 1,
0.2820476, -0.05355204, 2.467923, 1, 1, 1, 1, 1,
0.2831336, 0.04506122, -0.2764801, 1, 1, 1, 1, 1,
0.2867756, 0.5717751, 0.5829404, 1, 1, 1, 1, 1,
0.2873139, -0.9468936, 1.681701, 1, 1, 1, 1, 1,
0.2879198, -0.3455766, 1.879365, 1, 1, 1, 1, 1,
0.2913294, 2.22195, -0.4891313, 1, 1, 1, 1, 1,
0.2951595, 0.5599688, 0.4949782, 1, 1, 1, 1, 1,
0.295901, -0.7331626, 1.690007, 1, 1, 1, 1, 1,
0.2979308, 0.5322095, 1.853625, 1, 1, 1, 1, 1,
0.298082, 0.1252319, 1.98281, 1, 1, 1, 1, 1,
0.3007481, -1.471003, 2.654667, 1, 1, 1, 1, 1,
0.3012869, 1.14483, 1.161813, 1, 1, 1, 1, 1,
0.303388, 1.772028, -1.465052, 1, 1, 1, 1, 1,
0.3060513, -0.5536699, 2.805466, 1, 1, 1, 1, 1,
0.3121285, 0.493895, -1.414009, 1, 1, 1, 1, 1,
0.3171462, -1.73741, 3.546863, 0, 0, 1, 1, 1,
0.3199704, -1.820017, 3.309335, 1, 0, 0, 1, 1,
0.3307649, -0.6806186, 2.263765, 1, 0, 0, 1, 1,
0.3333037, 0.4910127, 0.3573347, 1, 0, 0, 1, 1,
0.3347228, -1.779305, 3.066145, 1, 0, 0, 1, 1,
0.3383296, -0.1210714, 2.23375, 1, 0, 0, 1, 1,
0.3393508, 1.683205, 1.479153, 0, 0, 0, 1, 1,
0.3419676, 0.05771663, -0.2321861, 0, 0, 0, 1, 1,
0.342958, 0.4180785, 2.050906, 0, 0, 0, 1, 1,
0.3477679, 0.07222338, -0.5908001, 0, 0, 0, 1, 1,
0.3479435, -0.4296217, 3.913024, 0, 0, 0, 1, 1,
0.3479669, -1.137803, 1.930284, 0, 0, 0, 1, 1,
0.3579318, 0.2802215, -0.8556189, 0, 0, 0, 1, 1,
0.3596154, 0.3403044, 0.3327319, 1, 1, 1, 1, 1,
0.3646601, 0.6981667, 0.9036013, 1, 1, 1, 1, 1,
0.3757923, 0.511044, 0.0228799, 1, 1, 1, 1, 1,
0.3762321, -0.9014302, 1.498086, 1, 1, 1, 1, 1,
0.3769147, -3.145591, 2.574991, 1, 1, 1, 1, 1,
0.3790301, 0.1839068, -0.1316553, 1, 1, 1, 1, 1,
0.3804092, 0.1358421, -0.6198117, 1, 1, 1, 1, 1,
0.3820237, -0.6259793, 1.916671, 1, 1, 1, 1, 1,
0.3864486, -0.7054581, 1.359277, 1, 1, 1, 1, 1,
0.3867064, 0.5616141, -0.4654655, 1, 1, 1, 1, 1,
0.3894151, -0.5854374, 2.49642, 1, 1, 1, 1, 1,
0.3906187, -1.547406, 3.389537, 1, 1, 1, 1, 1,
0.3924068, 1.164496, -0.6454474, 1, 1, 1, 1, 1,
0.4039506, 0.7814565, 0.1010916, 1, 1, 1, 1, 1,
0.4060687, 0.2337024, 1.695558, 1, 1, 1, 1, 1,
0.4095882, 0.3437288, 2.197715, 0, 0, 1, 1, 1,
0.4096604, -1.821772, 5.191193, 1, 0, 0, 1, 1,
0.4118149, 2.7009, 0.8138472, 1, 0, 0, 1, 1,
0.4121932, -0.05455714, 1.867883, 1, 0, 0, 1, 1,
0.4140442, 1.134315, 0.7168417, 1, 0, 0, 1, 1,
0.4153187, -2.646933, 2.482308, 1, 0, 0, 1, 1,
0.4172603, -0.7365193, 2.328497, 0, 0, 0, 1, 1,
0.419293, -0.3054386, 3.096314, 0, 0, 0, 1, 1,
0.42208, -0.03612614, 1.51749, 0, 0, 0, 1, 1,
0.4230137, -1.906179, 2.437689, 0, 0, 0, 1, 1,
0.4284723, 0.4746798, 1.319975, 0, 0, 0, 1, 1,
0.4290783, -1.79389, 1.096276, 0, 0, 0, 1, 1,
0.4322446, 0.1693955, -1.843014, 0, 0, 0, 1, 1,
0.4342576, -1.171833, 2.05861, 1, 1, 1, 1, 1,
0.4387798, -0.7346076, 2.816011, 1, 1, 1, 1, 1,
0.4391248, 0.5365009, -0.4749057, 1, 1, 1, 1, 1,
0.4399002, 0.1008009, 1.415352, 1, 1, 1, 1, 1,
0.4457611, -2.089031, 3.178018, 1, 1, 1, 1, 1,
0.4485478, -1.003439, 2.354397, 1, 1, 1, 1, 1,
0.4501995, -0.7474879, 2.331561, 1, 1, 1, 1, 1,
0.4560552, -0.8247114, 3.096421, 1, 1, 1, 1, 1,
0.4574948, -1.023556, 2.128356, 1, 1, 1, 1, 1,
0.4580613, -0.4983328, 2.557412, 1, 1, 1, 1, 1,
0.4663345, 1.578074, 0.3465515, 1, 1, 1, 1, 1,
0.4684034, 2.880184, 0.1982029, 1, 1, 1, 1, 1,
0.4712447, -0.7879146, 1.694021, 1, 1, 1, 1, 1,
0.4717067, 0.0898448, 3.475363, 1, 1, 1, 1, 1,
0.4741174, -0.1621133, 0.8328735, 1, 1, 1, 1, 1,
0.4742946, 0.2353101, 1.263319, 0, 0, 1, 1, 1,
0.4745699, -1.841334, 2.413608, 1, 0, 0, 1, 1,
0.4752822, 1.486642, 1.659676, 1, 0, 0, 1, 1,
0.4795692, -0.8145347, 2.564509, 1, 0, 0, 1, 1,
0.4800884, -1.72559, 2.728406, 1, 0, 0, 1, 1,
0.4803934, -0.08810212, 3.134737, 1, 0, 0, 1, 1,
0.4807416, 0.3465616, 1.693867, 0, 0, 0, 1, 1,
0.489481, -0.009333952, 2.11127, 0, 0, 0, 1, 1,
0.4924111, -1.276426, 2.499366, 0, 0, 0, 1, 1,
0.492961, -0.5476496, 2.014351, 0, 0, 0, 1, 1,
0.4940071, -0.3119509, 2.021111, 0, 0, 0, 1, 1,
0.4976114, -0.5397657, 2.964368, 0, 0, 0, 1, 1,
0.4976529, 0.2161705, 1.47538, 0, 0, 0, 1, 1,
0.498244, -1.77748, 2.907153, 1, 1, 1, 1, 1,
0.4989443, 0.4626746, -0.9700167, 1, 1, 1, 1, 1,
0.5016032, 0.4056309, 0.5093413, 1, 1, 1, 1, 1,
0.5034053, 0.3643058, 1.252133, 1, 1, 1, 1, 1,
0.5098689, -0.2049582, 2.695812, 1, 1, 1, 1, 1,
0.5126907, 0.4298245, 3.008159, 1, 1, 1, 1, 1,
0.5173223, -0.913133, 3.453645, 1, 1, 1, 1, 1,
0.5184141, -1.201202, 1.919408, 1, 1, 1, 1, 1,
0.5188459, 0.2284349, 1.08497, 1, 1, 1, 1, 1,
0.5213097, -0.8413498, 0.2474908, 1, 1, 1, 1, 1,
0.5213208, -0.9137612, 1.683798, 1, 1, 1, 1, 1,
0.522431, 0.9904074, 0.6486989, 1, 1, 1, 1, 1,
0.5228807, 0.7298159, 1.082125, 1, 1, 1, 1, 1,
0.5260009, -0.08126615, 0.6142988, 1, 1, 1, 1, 1,
0.5265234, -1.181891, 1.511381, 1, 1, 1, 1, 1,
0.5272892, 4.229921, 0.1952542, 0, 0, 1, 1, 1,
0.5279621, -1.04013, 3.408639, 1, 0, 0, 1, 1,
0.5304034, -0.9870237, 2.801517, 1, 0, 0, 1, 1,
0.533074, 0.4534603, 0.05617952, 1, 0, 0, 1, 1,
0.5333987, -0.9455829, 2.406543, 1, 0, 0, 1, 1,
0.5400369, 1.265656, -0.1723627, 1, 0, 0, 1, 1,
0.5415774, 0.9337698, 0.7605301, 0, 0, 0, 1, 1,
0.5423917, -2.340335, 3.434423, 0, 0, 0, 1, 1,
0.5438216, -0.3543142, 2.192537, 0, 0, 0, 1, 1,
0.5445662, 0.0225289, 2.018857, 0, 0, 0, 1, 1,
0.5455025, 0.3800149, 2.031368, 0, 0, 0, 1, 1,
0.5474396, -1.947141, 3.681143, 0, 0, 0, 1, 1,
0.5476067, -0.2500008, 2.75753, 0, 0, 0, 1, 1,
0.5501187, -0.1152794, 0.5179521, 1, 1, 1, 1, 1,
0.552242, -0.8955731, 3.656612, 1, 1, 1, 1, 1,
0.5557601, 0.004161041, 2.417914, 1, 1, 1, 1, 1,
0.5614536, -0.2094729, 2.741204, 1, 1, 1, 1, 1,
0.5615128, -0.3811285, 4.184327, 1, 1, 1, 1, 1,
0.5622416, 1.693916, -1.476403, 1, 1, 1, 1, 1,
0.5803757, -2.171671, 1.965129, 1, 1, 1, 1, 1,
0.587585, -0.2374473, 1.615645, 1, 1, 1, 1, 1,
0.5877668, 1.337045, 1.559781, 1, 1, 1, 1, 1,
0.5892133, 0.1329009, 1.291766, 1, 1, 1, 1, 1,
0.5911207, -0.1643899, 1.877247, 1, 1, 1, 1, 1,
0.5999262, -0.9510115, 2.091096, 1, 1, 1, 1, 1,
0.6020722, 0.4259936, 1.260763, 1, 1, 1, 1, 1,
0.6023448, -1.185879, 3.27634, 1, 1, 1, 1, 1,
0.605589, 0.361903, 0.7941312, 1, 1, 1, 1, 1,
0.6057939, -0.8545797, 2.988438, 0, 0, 1, 1, 1,
0.6070627, -0.1106546, 2.809015, 1, 0, 0, 1, 1,
0.6086829, 0.3962973, 1.217707, 1, 0, 0, 1, 1,
0.6092277, -0.3123405, 1.266663, 1, 0, 0, 1, 1,
0.6095181, 1.223547, 0.443602, 1, 0, 0, 1, 1,
0.6312987, 1.457086, -0.07643388, 1, 0, 0, 1, 1,
0.6384842, 1.316139, -0.5433689, 0, 0, 0, 1, 1,
0.6407383, 0.7559163, 0.2047754, 0, 0, 0, 1, 1,
0.6455164, -0.903125, 4.247194, 0, 0, 0, 1, 1,
0.6507553, -0.354836, 2.101049, 0, 0, 0, 1, 1,
0.6584907, -0.201134, 1.32168, 0, 0, 0, 1, 1,
0.6595859, 1.143668, 2.575914, 0, 0, 0, 1, 1,
0.6601253, 0.1336735, 0.4828933, 0, 0, 0, 1, 1,
0.662732, -1.135393, 2.535775, 1, 1, 1, 1, 1,
0.6698052, -0.7162247, 2.210428, 1, 1, 1, 1, 1,
0.6724312, 1.740787, -0.09397401, 1, 1, 1, 1, 1,
0.6770346, -1.944034, 2.480627, 1, 1, 1, 1, 1,
0.67725, 0.8599029, 0.9857076, 1, 1, 1, 1, 1,
0.679345, -0.9904884, 2.986915, 1, 1, 1, 1, 1,
0.68011, -0.01421097, 1.232823, 1, 1, 1, 1, 1,
0.6814936, -1.838514, 2.995158, 1, 1, 1, 1, 1,
0.6838403, 0.4963945, 0.1943825, 1, 1, 1, 1, 1,
0.6847547, 1.42397, 2.295051, 1, 1, 1, 1, 1,
0.6872101, -1.235699, 2.484228, 1, 1, 1, 1, 1,
0.6873078, 1.259036, -0.002533579, 1, 1, 1, 1, 1,
0.6925345, -0.4436259, 3.415962, 1, 1, 1, 1, 1,
0.6975768, -0.5736145, 1.52406, 1, 1, 1, 1, 1,
0.6984231, 0.2659424, 0.7143379, 1, 1, 1, 1, 1,
0.7004835, 0.2243313, 2.23415, 0, 0, 1, 1, 1,
0.7044073, 0.2418702, 2.019424, 1, 0, 0, 1, 1,
0.7056527, 1.043413, -0.6034328, 1, 0, 0, 1, 1,
0.7067914, -2.091447, 3.2489, 1, 0, 0, 1, 1,
0.7084348, 0.03782565, 0.2449828, 1, 0, 0, 1, 1,
0.7129145, 0.2162053, 1.410259, 1, 0, 0, 1, 1,
0.7154625, 0.3462685, 2.671178, 0, 0, 0, 1, 1,
0.7188594, 0.9782179, 0.1833843, 0, 0, 0, 1, 1,
0.7275509, -0.9296814, 3.738938, 0, 0, 0, 1, 1,
0.7369794, -0.7549347, 2.215328, 0, 0, 0, 1, 1,
0.7392389, -3.574729, 4.244322, 0, 0, 0, 1, 1,
0.7427273, -0.4838212, 3.400985, 0, 0, 0, 1, 1,
0.7515708, 1.196791, -0.3817068, 0, 0, 0, 1, 1,
0.7541651, 0.1852884, 2.516351, 1, 1, 1, 1, 1,
0.7569665, -0.7112102, -0.2116791, 1, 1, 1, 1, 1,
0.7573433, -0.7725949, 1.957185, 1, 1, 1, 1, 1,
0.7690285, 0.986083, -0.09461962, 1, 1, 1, 1, 1,
0.7709259, 0.2633962, 0.6589023, 1, 1, 1, 1, 1,
0.7730727, -0.08698178, 1.473038, 1, 1, 1, 1, 1,
0.7734518, 0.9513056, 1.598656, 1, 1, 1, 1, 1,
0.7767159, -1.364558, 2.991108, 1, 1, 1, 1, 1,
0.7814992, -1.348067, 3.322664, 1, 1, 1, 1, 1,
0.7869095, -0.7052142, 3.268679, 1, 1, 1, 1, 1,
0.7944961, 1.004984, 0.5269503, 1, 1, 1, 1, 1,
0.8061864, -1.112379, 1.84765, 1, 1, 1, 1, 1,
0.8127, -0.2044928, 0.7420298, 1, 1, 1, 1, 1,
0.8153193, -1.788065, 3.945331, 1, 1, 1, 1, 1,
0.8161799, -0.7339259, 3.228526, 1, 1, 1, 1, 1,
0.8171235, 0.4116473, 1.273403, 0, 0, 1, 1, 1,
0.8185713, 0.8174937, 0.5642344, 1, 0, 0, 1, 1,
0.8217102, -0.6666914, 2.438639, 1, 0, 0, 1, 1,
0.8279126, 0.5039618, 0.9595056, 1, 0, 0, 1, 1,
0.8299263, -1.432749, 0.1207851, 1, 0, 0, 1, 1,
0.8353146, 1.215026, -0.05895073, 1, 0, 0, 1, 1,
0.837527, -1.443811, 1.447135, 0, 0, 0, 1, 1,
0.8379719, -0.8164189, 4.492296, 0, 0, 0, 1, 1,
0.8414436, 0.04443733, 2.403794, 0, 0, 0, 1, 1,
0.8428756, 0.3251435, 3.071419, 0, 0, 0, 1, 1,
0.8464056, -0.3929119, 2.364233, 0, 0, 0, 1, 1,
0.8590698, -0.6675113, 2.757071, 0, 0, 0, 1, 1,
0.8630955, -1.443879, 2.830369, 0, 0, 0, 1, 1,
0.864365, -1.284552, 4.239319, 1, 1, 1, 1, 1,
0.8651108, -0.4756561, 3.311667, 1, 1, 1, 1, 1,
0.8698016, 0.4380015, 1.762017, 1, 1, 1, 1, 1,
0.8704884, 0.5999546, 1.417572, 1, 1, 1, 1, 1,
0.8705297, -0.05957265, 1.206412, 1, 1, 1, 1, 1,
0.8707372, -0.7893805, 1.596568, 1, 1, 1, 1, 1,
0.8782977, -0.5607331, 0.8936771, 1, 1, 1, 1, 1,
0.8882747, 0.1476472, 2.636252, 1, 1, 1, 1, 1,
0.8917565, -2.020007, 3.747131, 1, 1, 1, 1, 1,
0.9004373, 0.9301269, 2.424636, 1, 1, 1, 1, 1,
0.907073, 0.6951752, 2.640525, 1, 1, 1, 1, 1,
0.9192601, 0.5368425, 2.194601, 1, 1, 1, 1, 1,
0.9236295, 0.8503858, 0.5293458, 1, 1, 1, 1, 1,
0.925117, -0.02324977, 0.8741755, 1, 1, 1, 1, 1,
0.9350259, -0.2720061, 3.33989, 1, 1, 1, 1, 1,
0.9362308, 0.3286233, 2.030595, 0, 0, 1, 1, 1,
0.9365569, 1.447752, -0.5437794, 1, 0, 0, 1, 1,
0.9391086, 1.95654, 0.2617031, 1, 0, 0, 1, 1,
0.9501077, 0.2458417, 2.209943, 1, 0, 0, 1, 1,
0.9535755, -2.004996, 2.220695, 1, 0, 0, 1, 1,
0.9542127, -0.6439804, 3.214968, 1, 0, 0, 1, 1,
0.9574486, 0.9663618, -0.5728633, 0, 0, 0, 1, 1,
0.9661941, -0.2071408, 1.021795, 0, 0, 0, 1, 1,
0.9681759, -0.9142496, 2.28928, 0, 0, 0, 1, 1,
0.9700999, 2.320158, 1.177927, 0, 0, 0, 1, 1,
0.9737868, -1.3006, 1.143571, 0, 0, 0, 1, 1,
0.9738595, -0.4095504, 2.331896, 0, 0, 0, 1, 1,
0.9758077, 0.09111853, 1.891787, 0, 0, 0, 1, 1,
0.9809387, 0.004984093, 2.881267, 1, 1, 1, 1, 1,
0.9846827, -0.5302191, 1.859014, 1, 1, 1, 1, 1,
0.9861122, 1.969021, -1.158876, 1, 1, 1, 1, 1,
0.9900184, 0.1635311, 0.6765069, 1, 1, 1, 1, 1,
0.9905233, -0.2439793, 1.55122, 1, 1, 1, 1, 1,
0.9911072, -0.1289746, 0.9379002, 1, 1, 1, 1, 1,
0.9912663, -0.7410475, 2.122902, 1, 1, 1, 1, 1,
0.9914605, -0.7111658, 2.669258, 1, 1, 1, 1, 1,
0.9954752, -0.3288242, 2.163622, 1, 1, 1, 1, 1,
0.9994279, -0.3214762, 2.759083, 1, 1, 1, 1, 1,
1.001286, -1.068185, 1.70073, 1, 1, 1, 1, 1,
1.0037, 0.3250697, 3.102603, 1, 1, 1, 1, 1,
1.009678, -0.9324147, 0.7488548, 1, 1, 1, 1, 1,
1.01305, -0.01621952, 1.949751, 1, 1, 1, 1, 1,
1.037444, -0.7580186, 2.786423, 1, 1, 1, 1, 1,
1.059389, 0.7053232, 1.553382, 0, 0, 1, 1, 1,
1.073344, 0.9269139, 2.498567, 1, 0, 0, 1, 1,
1.077637, 1.548948, 1.155689, 1, 0, 0, 1, 1,
1.078167, -0.6498176, 3.065939, 1, 0, 0, 1, 1,
1.088369, -0.3196676, 2.360701, 1, 0, 0, 1, 1,
1.091284, 0.2973035, 0.5175778, 1, 0, 0, 1, 1,
1.096477, -1.844315, 2.607644, 0, 0, 0, 1, 1,
1.102069, -0.7196825, 2.922341, 0, 0, 0, 1, 1,
1.120854, 1.067571, 0.5713183, 0, 0, 0, 1, 1,
1.121235, 0.9308385, 0.9831251, 0, 0, 0, 1, 1,
1.122745, -0.1660191, 1.921858, 0, 0, 0, 1, 1,
1.124914, 0.6082126, 0.9357833, 0, 0, 0, 1, 1,
1.129779, 2.478927, 0.1433694, 0, 0, 0, 1, 1,
1.141562, -1.094546, 2.024602, 1, 1, 1, 1, 1,
1.150387, 0.6944315, -0.4781198, 1, 1, 1, 1, 1,
1.153364, -0.6451702, 2.544566, 1, 1, 1, 1, 1,
1.154675, 1.239677, 1.381439, 1, 1, 1, 1, 1,
1.155319, -0.6529839, 2.975576, 1, 1, 1, 1, 1,
1.156852, 0.2427529, 0.5691138, 1, 1, 1, 1, 1,
1.164321, -0.3334746, 1.451266, 1, 1, 1, 1, 1,
1.167539, -0.7458324, 2.186808, 1, 1, 1, 1, 1,
1.170311, 0.3899518, 1.176476, 1, 1, 1, 1, 1,
1.171594, 1.085858, 0.3650075, 1, 1, 1, 1, 1,
1.174369, 0.07140718, 1.29765, 1, 1, 1, 1, 1,
1.176593, -1.126717, 1.086074, 1, 1, 1, 1, 1,
1.177744, -0.8431781, 0.9925396, 1, 1, 1, 1, 1,
1.179007, -0.1472681, -0.6629899, 1, 1, 1, 1, 1,
1.182585, 0.5864735, 1.383646, 1, 1, 1, 1, 1,
1.186147, -1.627452, 2.110908, 0, 0, 1, 1, 1,
1.191358, 0.2244761, 3.24501, 1, 0, 0, 1, 1,
1.197031, -1.453027, 0.04963814, 1, 0, 0, 1, 1,
1.20626, -0.9479252, 2.131006, 1, 0, 0, 1, 1,
1.209079, 0.119066, 1.25569, 1, 0, 0, 1, 1,
1.212466, 0.7590608, 0.7890086, 1, 0, 0, 1, 1,
1.214139, -0.5950822, 3.496044, 0, 0, 0, 1, 1,
1.214423, 0.03496064, 2.202523, 0, 0, 0, 1, 1,
1.221912, -2.469038, 3.822872, 0, 0, 0, 1, 1,
1.255412, 1.101274, 0.6665359, 0, 0, 0, 1, 1,
1.257923, -1.462841, 3.295968, 0, 0, 0, 1, 1,
1.258117, 1.526566, -0.5894174, 0, 0, 0, 1, 1,
1.266383, 0.2894088, 1.369831, 0, 0, 0, 1, 1,
1.269237, -1.802856, 1.759432, 1, 1, 1, 1, 1,
1.290485, 0.1730055, 3.235664, 1, 1, 1, 1, 1,
1.296105, -0.9934363, 1.535462, 1, 1, 1, 1, 1,
1.296954, -0.2331208, 2.14431, 1, 1, 1, 1, 1,
1.302779, 0.9469344, -2.57053, 1, 1, 1, 1, 1,
1.308674, 0.3522083, 1.753945, 1, 1, 1, 1, 1,
1.316397, 1.807144, 0.6393257, 1, 1, 1, 1, 1,
1.320664, -0.7721218, 0.5768202, 1, 1, 1, 1, 1,
1.324689, 0.7969411, 0.9906978, 1, 1, 1, 1, 1,
1.326619, -1.514719, 2.789979, 1, 1, 1, 1, 1,
1.328271, -0.892571, 1.021112, 1, 1, 1, 1, 1,
1.328712, 0.1343842, 1.837775, 1, 1, 1, 1, 1,
1.331143, 1.465178, 0.2759668, 1, 1, 1, 1, 1,
1.339414, -0.4191948, -0.1716342, 1, 1, 1, 1, 1,
1.339645, -0.7326586, 0.8258632, 1, 1, 1, 1, 1,
1.340836, -0.4797088, 2.724818, 0, 0, 1, 1, 1,
1.344407, 0.6797951, 1.388017, 1, 0, 0, 1, 1,
1.35304, 0.4269171, 0.8264737, 1, 0, 0, 1, 1,
1.369378, -0.364419, 2.936519, 1, 0, 0, 1, 1,
1.379714, 2.223169, 1.504779, 1, 0, 0, 1, 1,
1.382302, 1.99894, 1.5999, 1, 0, 0, 1, 1,
1.382504, -1.150968, 3.999239, 0, 0, 0, 1, 1,
1.392995, 0.6395307, -0.1902242, 0, 0, 0, 1, 1,
1.394372, 0.8852023, 1.537416, 0, 0, 0, 1, 1,
1.396719, 0.1704479, -0.1651322, 0, 0, 0, 1, 1,
1.40382, 0.1257674, 1.646733, 0, 0, 0, 1, 1,
1.415708, 0.08411998, 2.00985, 0, 0, 0, 1, 1,
1.442734, 1.592207, 1.613185, 0, 0, 0, 1, 1,
1.450406, 0.2605836, 0.7183393, 1, 1, 1, 1, 1,
1.455406, 0.5483981, 2.131646, 1, 1, 1, 1, 1,
1.46079, 0.2987758, 1.802317, 1, 1, 1, 1, 1,
1.463078, -0.2526934, 0.216614, 1, 1, 1, 1, 1,
1.463427, 0.3565825, -0.4198296, 1, 1, 1, 1, 1,
1.463928, 1.363577, 3.572247, 1, 1, 1, 1, 1,
1.468623, 0.1631347, 4.170428, 1, 1, 1, 1, 1,
1.474016, 0.1143546, 1.230106, 1, 1, 1, 1, 1,
1.488575, 0.5747918, 1.776935, 1, 1, 1, 1, 1,
1.51987, -0.9372197, 2.511947, 1, 1, 1, 1, 1,
1.524909, 0.910493, -0.5508938, 1, 1, 1, 1, 1,
1.527283, -0.70688, 1.27633, 1, 1, 1, 1, 1,
1.541781, 1.373179, -1.377838, 1, 1, 1, 1, 1,
1.544636, -0.876929, 0.9523398, 1, 1, 1, 1, 1,
1.545931, 0.7050844, 1.052253, 1, 1, 1, 1, 1,
1.561638, -2.454016, 2.947706, 0, 0, 1, 1, 1,
1.592273, 0.5738088, 0.7637926, 1, 0, 0, 1, 1,
1.596704, -0.06181313, 3.042961, 1, 0, 0, 1, 1,
1.613223, 0.582307, 2.196819, 1, 0, 0, 1, 1,
1.614611, -0.8300884, 2.404833, 1, 0, 0, 1, 1,
1.618528, 0.3895624, 0.283644, 1, 0, 0, 1, 1,
1.620521, -0.8186557, 1.638924, 0, 0, 0, 1, 1,
1.648724, -0.5322679, 3.70422, 0, 0, 0, 1, 1,
1.664075, -2.233516, 2.330622, 0, 0, 0, 1, 1,
1.669086, 1.786092, 0.9335275, 0, 0, 0, 1, 1,
1.674037, 0.5581309, 0.9095391, 0, 0, 0, 1, 1,
1.679805, -0.2698336, -0.5338981, 0, 0, 0, 1, 1,
1.683056, 0.9174387, 1.66064, 0, 0, 0, 1, 1,
1.688338, 0.5062758, 0.4735694, 1, 1, 1, 1, 1,
1.71503, -0.1555712, 1.894159, 1, 1, 1, 1, 1,
1.731787, 0.4778635, 1.231505, 1, 1, 1, 1, 1,
1.73271, -1.075659, 3.014473, 1, 1, 1, 1, 1,
1.743651, -0.7449906, 0.4768302, 1, 1, 1, 1, 1,
1.776261, 1.739422, 1.496342, 1, 1, 1, 1, 1,
1.793676, -0.1798187, 0.4707899, 1, 1, 1, 1, 1,
1.805243, 0.4231001, 2.314772, 1, 1, 1, 1, 1,
1.826432, -1.099724, 3.366754, 1, 1, 1, 1, 1,
1.841688, 0.03546306, 1.150978, 1, 1, 1, 1, 1,
1.864891, 0.2886354, 0.4695818, 1, 1, 1, 1, 1,
1.90822, -0.7103316, 1.561677, 1, 1, 1, 1, 1,
1.911848, -0.8861535, 3.167231, 1, 1, 1, 1, 1,
1.933417, -1.17029, 2.454913, 1, 1, 1, 1, 1,
1.969685, -0.9182355, 2.350553, 1, 1, 1, 1, 1,
1.984381, 0.5185263, 1.048825, 0, 0, 1, 1, 1,
2.017398, -0.4076726, 1.603071, 1, 0, 0, 1, 1,
2.068882, -0.03430437, 1.859296, 1, 0, 0, 1, 1,
2.179934, 0.6491469, 1.542092, 1, 0, 0, 1, 1,
2.188636, -1.270985, 3.000288, 1, 0, 0, 1, 1,
2.240201, 0.6896861, 0.4671949, 1, 0, 0, 1, 1,
2.268464, 0.8414547, 0.4595309, 0, 0, 0, 1, 1,
2.276316, 0.8275938, 0.6186309, 0, 0, 0, 1, 1,
2.295145, 0.2742441, 2.021672, 0, 0, 0, 1, 1,
2.328891, 0.5660838, 0.2502092, 0, 0, 0, 1, 1,
2.341137, 0.09363045, 1.286106, 0, 0, 0, 1, 1,
2.346162, -0.1152454, 2.87963, 0, 0, 0, 1, 1,
2.362589, 1.667386, 2.052645, 0, 0, 0, 1, 1,
2.428435, -0.8060187, 3.364575, 1, 1, 1, 1, 1,
2.471859, -1.004158, 2.880093, 1, 1, 1, 1, 1,
2.587695, 1.959049, -0.2960492, 1, 1, 1, 1, 1,
2.88203, -0.3844341, 0.9547279, 1, 1, 1, 1, 1,
2.941907, -1.235898, 1.104393, 1, 1, 1, 1, 1,
3.076905, -0.2648327, 1.826648, 1, 1, 1, 1, 1,
3.346493, -1.882054, 2.927228, 1, 1, 1, 1, 1
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
var radius = 10.0284;
var distance = 35.22431;
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
mvMatrix.translate( -0.2013136, -0.3275959, -0.02922511 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.22431);
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
