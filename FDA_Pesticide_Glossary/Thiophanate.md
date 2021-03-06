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
-2.86864, 0.3085144, -1.144598, 1, 0, 0, 1,
-2.759572, 1.427694, 0.4213808, 1, 0.007843138, 0, 1,
-2.707056, -0.01853273, -1.988676, 1, 0.01176471, 0, 1,
-2.705512, -1.341259, -2.017328, 1, 0.01960784, 0, 1,
-2.621511, -0.1991768, -1.403143, 1, 0.02352941, 0, 1,
-2.530587, -1.057365, -2.235979, 1, 0.03137255, 0, 1,
-2.443955, -1.085029, -0.1695169, 1, 0.03529412, 0, 1,
-2.436459, 0.6233343, -1.600728, 1, 0.04313726, 0, 1,
-2.36412, 0.5604411, -3.830059, 1, 0.04705882, 0, 1,
-2.31313, 0.0578302, -0.0951893, 1, 0.05490196, 0, 1,
-2.303775, 0.8281916, -0.04867283, 1, 0.05882353, 0, 1,
-2.283752, 1.774966, -2.171963, 1, 0.06666667, 0, 1,
-2.218158, -1.407799, -2.602178, 1, 0.07058824, 0, 1,
-2.193287, 0.4614475, -1.059817, 1, 0.07843138, 0, 1,
-2.1619, -0.4846748, -2.949381, 1, 0.08235294, 0, 1,
-2.126609, 0.2029933, -1.461201, 1, 0.09019608, 0, 1,
-2.078011, -0.3716718, -2.038594, 1, 0.09411765, 0, 1,
-2.070362, -0.0319479, -0.6239305, 1, 0.1019608, 0, 1,
-2.049131, 1.244254, -1.365721, 1, 0.1098039, 0, 1,
-2.03038, -0.02540938, -0.6279408, 1, 0.1137255, 0, 1,
-2.023478, -1.20214, -1.829505, 1, 0.1215686, 0, 1,
-2.020082, 2.154993, -1.881503, 1, 0.1254902, 0, 1,
-2.018905, 0.6273257, -2.610273, 1, 0.1333333, 0, 1,
-2.008248, -0.5131047, -0.7579446, 1, 0.1372549, 0, 1,
-2.007625, -0.5266312, -0.199033, 1, 0.145098, 0, 1,
-2.006241, 0.2342515, -2.761999, 1, 0.1490196, 0, 1,
-2.004949, -0.0797864, -0.593065, 1, 0.1568628, 0, 1,
-1.992745, 1.092863, -0.4108367, 1, 0.1607843, 0, 1,
-1.974151, -0.4071572, -2.907976, 1, 0.1686275, 0, 1,
-1.965996, 2.411636, -0.2056463, 1, 0.172549, 0, 1,
-1.927632, 0.9727131, -2.0476, 1, 0.1803922, 0, 1,
-1.911955, 3.289411, 0.867291, 1, 0.1843137, 0, 1,
-1.898859, 0.07354417, -1.790533, 1, 0.1921569, 0, 1,
-1.877463, -1.070555, -1.264396, 1, 0.1960784, 0, 1,
-1.83186, 1.064564, -2.111281, 1, 0.2039216, 0, 1,
-1.812884, 0.06640934, -0.2524101, 1, 0.2117647, 0, 1,
-1.801849, -1.709606, -1.915689, 1, 0.2156863, 0, 1,
-1.777692, -0.881513, -2.333461, 1, 0.2235294, 0, 1,
-1.76682, -1.464877, 0.4676215, 1, 0.227451, 0, 1,
-1.758855, -1.411655, -0.7061552, 1, 0.2352941, 0, 1,
-1.740933, -0.9643527, -2.713276, 1, 0.2392157, 0, 1,
-1.727065, -1.918681, -1.508829, 1, 0.2470588, 0, 1,
-1.694538, 0.6711335, -0.5836266, 1, 0.2509804, 0, 1,
-1.683609, 0.8319311, -1.762581, 1, 0.2588235, 0, 1,
-1.66319, 1.238145, -0.6762238, 1, 0.2627451, 0, 1,
-1.658044, -0.9135786, -1.795092, 1, 0.2705882, 0, 1,
-1.647891, -3.376739, -3.523141, 1, 0.2745098, 0, 1,
-1.642298, 0.7492753, -2.893957, 1, 0.282353, 0, 1,
-1.624752, 2.556328, -0.4857075, 1, 0.2862745, 0, 1,
-1.621471, 0.7805317, -1.359794, 1, 0.2941177, 0, 1,
-1.61491, -0.133472, -1.043517, 1, 0.3019608, 0, 1,
-1.61435, 0.5563547, -0.08594647, 1, 0.3058824, 0, 1,
-1.595223, 0.3326282, -1.917748, 1, 0.3137255, 0, 1,
-1.587872, 0.2659244, -1.099228, 1, 0.3176471, 0, 1,
-1.583944, 0.6639807, -0.6025658, 1, 0.3254902, 0, 1,
-1.580252, -0.4596645, -2.303758, 1, 0.3294118, 0, 1,
-1.55913, -2.111046, -3.617004, 1, 0.3372549, 0, 1,
-1.553074, -0.8918114, -1.663426, 1, 0.3411765, 0, 1,
-1.546664, 1.560259, -0.1157285, 1, 0.3490196, 0, 1,
-1.54461, 0.4854757, 0.5154148, 1, 0.3529412, 0, 1,
-1.543717, 0.007376074, -2.831084, 1, 0.3607843, 0, 1,
-1.54324, -0.03304617, -1.454914, 1, 0.3647059, 0, 1,
-1.526865, -3.226922, -2.364517, 1, 0.372549, 0, 1,
-1.524404, 1.377565, -0.940999, 1, 0.3764706, 0, 1,
-1.493465, 0.3888296, -0.9188138, 1, 0.3843137, 0, 1,
-1.482184, -1.877445, -1.424881, 1, 0.3882353, 0, 1,
-1.475704, -0.1638782, -3.018071, 1, 0.3960784, 0, 1,
-1.469632, 0.9298036, 0.03455042, 1, 0.4039216, 0, 1,
-1.463932, 0.9874554, -1.364324, 1, 0.4078431, 0, 1,
-1.455616, -0.6344724, -0.8858658, 1, 0.4156863, 0, 1,
-1.437807, 0.9615824, 0.03343844, 1, 0.4196078, 0, 1,
-1.422435, -1.488768, -1.845997, 1, 0.427451, 0, 1,
-1.412082, 0.9118916, -0.6475381, 1, 0.4313726, 0, 1,
-1.410652, -0.2753559, -2.310273, 1, 0.4392157, 0, 1,
-1.404549, -0.07685664, -1.721981, 1, 0.4431373, 0, 1,
-1.393505, 0.9239481, -0.4176081, 1, 0.4509804, 0, 1,
-1.389652, -1.877501, -2.818877, 1, 0.454902, 0, 1,
-1.386241, 0.03744756, -3.71366, 1, 0.4627451, 0, 1,
-1.384436, -0.9661509, -3.028365, 1, 0.4666667, 0, 1,
-1.383325, 0.5105443, -1.518684, 1, 0.4745098, 0, 1,
-1.365603, 1.665806, -0.7669646, 1, 0.4784314, 0, 1,
-1.365563, -0.2206614, -0.4163603, 1, 0.4862745, 0, 1,
-1.362071, 2.682141, -0.06498101, 1, 0.4901961, 0, 1,
-1.35785, -0.6911119, -0.2841086, 1, 0.4980392, 0, 1,
-1.349087, 0.05607332, -2.141686, 1, 0.5058824, 0, 1,
-1.348623, 1.044166, 0.3693608, 1, 0.509804, 0, 1,
-1.345759, 1.134122, -0.9675585, 1, 0.5176471, 0, 1,
-1.344995, 0.3303698, -1.664642, 1, 0.5215687, 0, 1,
-1.329206, 0.1144641, -4.012757, 1, 0.5294118, 0, 1,
-1.323404, -1.451012, -1.301494, 1, 0.5333334, 0, 1,
-1.320185, 0.770499, -0.7464595, 1, 0.5411765, 0, 1,
-1.319882, -1.970939, -2.097095, 1, 0.5450981, 0, 1,
-1.312809, 0.8150966, -1.90167, 1, 0.5529412, 0, 1,
-1.305608, 0.2500386, -1.089033, 1, 0.5568628, 0, 1,
-1.298869, 0.3115769, -0.7041176, 1, 0.5647059, 0, 1,
-1.296818, -0.1801327, 0.3073313, 1, 0.5686275, 0, 1,
-1.285519, 0.8461264, -0.8840541, 1, 0.5764706, 0, 1,
-1.276588, -1.238159, -3.549811, 1, 0.5803922, 0, 1,
-1.26772, 2.554134, -2.511832, 1, 0.5882353, 0, 1,
-1.261611, 0.02512632, -3.212869, 1, 0.5921569, 0, 1,
-1.249491, -1.241689, -1.174765, 1, 0.6, 0, 1,
-1.24837, -1.754402, -2.864783, 1, 0.6078432, 0, 1,
-1.237299, -0.4339487, -1.786351, 1, 0.6117647, 0, 1,
-1.235334, 0.4839623, 0.04257811, 1, 0.6196079, 0, 1,
-1.227589, 0.9440638, -2.382118, 1, 0.6235294, 0, 1,
-1.222116, 1.057292, -1.30799, 1, 0.6313726, 0, 1,
-1.218252, 0.7584069, -0.5307971, 1, 0.6352941, 0, 1,
-1.216828, 0.0166535, -1.68152, 1, 0.6431373, 0, 1,
-1.215272, -0.2819404, -3.499859, 1, 0.6470588, 0, 1,
-1.204514, 0.424362, 0.1373138, 1, 0.654902, 0, 1,
-1.199174, -0.7929264, -2.278329, 1, 0.6588235, 0, 1,
-1.198154, -0.8059018, -1.372809, 1, 0.6666667, 0, 1,
-1.196226, -0.9630026, -2.282607, 1, 0.6705883, 0, 1,
-1.193995, 0.484978, -0.3009646, 1, 0.6784314, 0, 1,
-1.183156, 0.4889822, -0.707719, 1, 0.682353, 0, 1,
-1.181934, 0.4234725, -2.034259, 1, 0.6901961, 0, 1,
-1.173943, 0.2049027, -3.176205, 1, 0.6941177, 0, 1,
-1.173792, -1.241758, -1.477171, 1, 0.7019608, 0, 1,
-1.169884, 1.708192, 0.7909494, 1, 0.7098039, 0, 1,
-1.156945, -0.7819881, -1.596742, 1, 0.7137255, 0, 1,
-1.155365, 0.4721994, -0.4384163, 1, 0.7215686, 0, 1,
-1.144548, 0.08731554, -0.2376868, 1, 0.7254902, 0, 1,
-1.14443, -0.4244359, -0.2895482, 1, 0.7333333, 0, 1,
-1.144278, 1.249171, -1.964228, 1, 0.7372549, 0, 1,
-1.143162, 0.1933313, -1.161272, 1, 0.7450981, 0, 1,
-1.139194, -1.717467, -3.002298, 1, 0.7490196, 0, 1,
-1.135589, 0.78979, -1.491154, 1, 0.7568628, 0, 1,
-1.132999, -2.077402, -1.594484, 1, 0.7607843, 0, 1,
-1.132738, 1.204993, -1.911597, 1, 0.7686275, 0, 1,
-1.131253, 0.2547928, -0.8300269, 1, 0.772549, 0, 1,
-1.125787, 0.4334726, -0.1642203, 1, 0.7803922, 0, 1,
-1.115689, 1.793983, 0.4348926, 1, 0.7843137, 0, 1,
-1.112119, -1.625085, -2.516157, 1, 0.7921569, 0, 1,
-1.111308, 0.1458053, -0.9010643, 1, 0.7960784, 0, 1,
-1.096669, -0.376348, -2.697272, 1, 0.8039216, 0, 1,
-1.096082, 0.8448552, 0.6562495, 1, 0.8117647, 0, 1,
-1.091218, 1.45488, 0.2702761, 1, 0.8156863, 0, 1,
-1.083942, 0.8262823, -0.8654699, 1, 0.8235294, 0, 1,
-1.061864, -0.8143468, -3.443179, 1, 0.827451, 0, 1,
-1.057364, 0.6124249, -0.6297917, 1, 0.8352941, 0, 1,
-1.056139, 0.829304, -3.343311, 1, 0.8392157, 0, 1,
-1.056118, 0.1801259, -0.4540204, 1, 0.8470588, 0, 1,
-1.040903, 0.3368891, -1.159634, 1, 0.8509804, 0, 1,
-1.040755, -1.417799, -2.453613, 1, 0.8588235, 0, 1,
-1.039666, -0.1480424, -3.484753, 1, 0.8627451, 0, 1,
-1.033499, -1.652347, -3.075267, 1, 0.8705882, 0, 1,
-1.02879, 0.7351506, -0.9275353, 1, 0.8745098, 0, 1,
-1.026891, -1.910711, -1.419994, 1, 0.8823529, 0, 1,
-1.021807, -0.04462784, -2.093631, 1, 0.8862745, 0, 1,
-1.019017, -0.9894691, -2.787791, 1, 0.8941177, 0, 1,
-1.01255, 1.070376, -0.7472762, 1, 0.8980392, 0, 1,
-1.009799, 0.2049425, -0.5573407, 1, 0.9058824, 0, 1,
-1.006182, -1.511955, -4.136646, 1, 0.9137255, 0, 1,
-0.9965772, -1.13735, -3.514123, 1, 0.9176471, 0, 1,
-0.9956107, 0.8144328, -0.2267583, 1, 0.9254902, 0, 1,
-0.9907377, 0.1007293, -1.677014, 1, 0.9294118, 0, 1,
-0.9869516, 0.007688905, -2.161536, 1, 0.9372549, 0, 1,
-0.9833354, -0.2723581, -3.401285, 1, 0.9411765, 0, 1,
-0.9771703, 0.4750827, 0.2113616, 1, 0.9490196, 0, 1,
-0.9746128, 0.1198239, -2.384559, 1, 0.9529412, 0, 1,
-0.9707081, 1.14754, -0.2651756, 1, 0.9607843, 0, 1,
-0.9705698, -1.536652, -1.132936, 1, 0.9647059, 0, 1,
-0.9678385, 0.9662197, -1.80687, 1, 0.972549, 0, 1,
-0.9660251, -0.07693689, -0.8106143, 1, 0.9764706, 0, 1,
-0.9650827, 0.885245, 0.1368309, 1, 0.9843137, 0, 1,
-0.9648714, 1.747806, -2.302436, 1, 0.9882353, 0, 1,
-0.9627097, 1.15193, 1.429728, 1, 0.9960784, 0, 1,
-0.9610801, 0.05003221, -1.868721, 0.9960784, 1, 0, 1,
-0.9580883, 0.03366717, -2.676866, 0.9921569, 1, 0, 1,
-0.957002, 2.979334, 0.3334277, 0.9843137, 1, 0, 1,
-0.9537594, 0.7378788, -2.092825, 0.9803922, 1, 0, 1,
-0.947668, -0.5527729, -2.83654, 0.972549, 1, 0, 1,
-0.9341347, 0.2240414, -2.79411, 0.9686275, 1, 0, 1,
-0.9290835, -0.318764, -2.837612, 0.9607843, 1, 0, 1,
-0.9242703, 1.019983, 0.01887047, 0.9568627, 1, 0, 1,
-0.9234769, -1.115418, -2.054532, 0.9490196, 1, 0, 1,
-0.9218414, -0.548695, -1.489456, 0.945098, 1, 0, 1,
-0.9194627, -0.530547, -1.996092, 0.9372549, 1, 0, 1,
-0.9096899, 0.4618912, -0.3688633, 0.9333333, 1, 0, 1,
-0.8958573, 3.08612, 0.2051759, 0.9254902, 1, 0, 1,
-0.895215, 0.6312008, -1.183604, 0.9215686, 1, 0, 1,
-0.8923144, 0.4466024, -1.463622, 0.9137255, 1, 0, 1,
-0.8913909, -1.39661, -2.743125, 0.9098039, 1, 0, 1,
-0.8898712, 0.1457085, -0.5185243, 0.9019608, 1, 0, 1,
-0.889184, -0.5397549, -3.357121, 0.8941177, 1, 0, 1,
-0.8866941, -0.304658, -0.992039, 0.8901961, 1, 0, 1,
-0.8856487, 0.989944, -1.781872, 0.8823529, 1, 0, 1,
-0.8795528, -0.03550159, 0.2202393, 0.8784314, 1, 0, 1,
-0.8745958, -0.02657622, -1.78371, 0.8705882, 1, 0, 1,
-0.8724275, 0.8288155, 1.827491, 0.8666667, 1, 0, 1,
-0.8721701, 1.838375, -0.6000673, 0.8588235, 1, 0, 1,
-0.8661594, 1.120219, 0.6070367, 0.854902, 1, 0, 1,
-0.8642442, 1.005717, -1.438888, 0.8470588, 1, 0, 1,
-0.8637114, -0.4347288, -1.518853, 0.8431373, 1, 0, 1,
-0.8628368, 0.08688845, -1.266279, 0.8352941, 1, 0, 1,
-0.8621426, -0.8525141, -2.448928, 0.8313726, 1, 0, 1,
-0.857292, -0.9048225, -2.804968, 0.8235294, 1, 0, 1,
-0.8564556, -0.419653, -2.35866, 0.8196079, 1, 0, 1,
-0.8544523, 0.02104149, -2.184597, 0.8117647, 1, 0, 1,
-0.8531936, -1.782602, -3.836535, 0.8078431, 1, 0, 1,
-0.8519765, 0.5379276, -0.1844099, 0.8, 1, 0, 1,
-0.8300439, -0.4990117, -1.479329, 0.7921569, 1, 0, 1,
-0.827828, -1.214571, -2.598908, 0.7882353, 1, 0, 1,
-0.8267826, 0.4777675, 0.02016257, 0.7803922, 1, 0, 1,
-0.8165787, -0.4299115, -2.313012, 0.7764706, 1, 0, 1,
-0.8148472, 0.4772181, -0.9404759, 0.7686275, 1, 0, 1,
-0.8115109, 0.04433966, -1.161244, 0.7647059, 1, 0, 1,
-0.8076113, -0.9905416, -2.031553, 0.7568628, 1, 0, 1,
-0.7974504, -0.1766177, -1.726801, 0.7529412, 1, 0, 1,
-0.7959314, 0.6757088, -2.490843, 0.7450981, 1, 0, 1,
-0.7951668, -0.07156717, -2.046692, 0.7411765, 1, 0, 1,
-0.7929432, -1.195554, -4.416359, 0.7333333, 1, 0, 1,
-0.7905417, -0.7749249, -0.462658, 0.7294118, 1, 0, 1,
-0.785492, -0.08305853, -2.518096, 0.7215686, 1, 0, 1,
-0.7823539, 0.7567631, -1.687952, 0.7176471, 1, 0, 1,
-0.7758256, -0.3224275, -0.6095247, 0.7098039, 1, 0, 1,
-0.7730858, -0.771327, -2.86657, 0.7058824, 1, 0, 1,
-0.7712148, 0.7228808, -0.1776388, 0.6980392, 1, 0, 1,
-0.7706639, -0.6628368, -4.94769, 0.6901961, 1, 0, 1,
-0.7690023, 0.1513893, -2.872401, 0.6862745, 1, 0, 1,
-0.7640938, 0.2001505, -1.387036, 0.6784314, 1, 0, 1,
-0.7606183, -0.8908724, -2.148162, 0.6745098, 1, 0, 1,
-0.7600747, -0.3742606, -1.170873, 0.6666667, 1, 0, 1,
-0.7593907, 0.6217456, -0.9795011, 0.6627451, 1, 0, 1,
-0.7583074, 0.211479, -0.1653404, 0.654902, 1, 0, 1,
-0.7579639, -2.166727, -4.045556, 0.6509804, 1, 0, 1,
-0.7575833, 0.874341, 0.04213985, 0.6431373, 1, 0, 1,
-0.7569494, 0.07052099, -2.507935, 0.6392157, 1, 0, 1,
-0.7567548, -0.1263306, -1.305636, 0.6313726, 1, 0, 1,
-0.7547485, -1.159526, -2.717477, 0.627451, 1, 0, 1,
-0.7418919, -1.184203, -3.17387, 0.6196079, 1, 0, 1,
-0.7417827, 0.07867995, -3.982798, 0.6156863, 1, 0, 1,
-0.7325383, 0.3477248, -0.05997357, 0.6078432, 1, 0, 1,
-0.7292932, 0.2010355, -2.035529, 0.6039216, 1, 0, 1,
-0.7289173, -0.5321459, -2.163911, 0.5960785, 1, 0, 1,
-0.7275285, -1.833225, -0.539327, 0.5882353, 1, 0, 1,
-0.7241283, -0.2896894, -3.586718, 0.5843138, 1, 0, 1,
-0.7211596, 0.20441, -1.34438, 0.5764706, 1, 0, 1,
-0.7144094, -0.6964461, -0.7064483, 0.572549, 1, 0, 1,
-0.7059244, -0.04768283, -1.613834, 0.5647059, 1, 0, 1,
-0.7055036, 0.9763791, -1.457521, 0.5607843, 1, 0, 1,
-0.7045491, -0.3851459, -3.662341, 0.5529412, 1, 0, 1,
-0.7026095, -0.1072371, -0.2417765, 0.5490196, 1, 0, 1,
-0.6996979, 0.7583837, -0.09947155, 0.5411765, 1, 0, 1,
-0.6994525, -0.8378431, -1.721805, 0.5372549, 1, 0, 1,
-0.6976776, 1.335385, 1.670556, 0.5294118, 1, 0, 1,
-0.6959784, -0.1828195, -0.869689, 0.5254902, 1, 0, 1,
-0.6958284, 0.2275083, 0.589976, 0.5176471, 1, 0, 1,
-0.6919294, 0.5025495, -0.5811163, 0.5137255, 1, 0, 1,
-0.6710985, -0.3757615, -3.727893, 0.5058824, 1, 0, 1,
-0.6706939, -1.266647, -3.633009, 0.5019608, 1, 0, 1,
-0.668631, 1.65706, 1.166019, 0.4941176, 1, 0, 1,
-0.6676739, -0.7338542, -3.272971, 0.4862745, 1, 0, 1,
-0.6626968, -2.37439, -2.778296, 0.4823529, 1, 0, 1,
-0.658938, 0.4764546, -2.305257, 0.4745098, 1, 0, 1,
-0.6511528, -0.9682876, -1.291744, 0.4705882, 1, 0, 1,
-0.650997, 0.1235518, -2.395616, 0.4627451, 1, 0, 1,
-0.6500145, 2.055977, 2.141721, 0.4588235, 1, 0, 1,
-0.6388494, -1.501783, -4.177074, 0.4509804, 1, 0, 1,
-0.6317378, -1.014371, -1.556508, 0.4470588, 1, 0, 1,
-0.6246216, 0.2807774, -2.906921, 0.4392157, 1, 0, 1,
-0.6230945, -0.5671455, -2.92206, 0.4352941, 1, 0, 1,
-0.6162138, 1.846506, -1.405348, 0.427451, 1, 0, 1,
-0.6158201, 1.542257, 0.2794098, 0.4235294, 1, 0, 1,
-0.6155269, -0.6641279, -2.234989, 0.4156863, 1, 0, 1,
-0.6109797, -1.187428, -1.197518, 0.4117647, 1, 0, 1,
-0.6037909, 0.556654, 0.3905064, 0.4039216, 1, 0, 1,
-0.6008387, -0.04661832, -1.332575, 0.3960784, 1, 0, 1,
-0.6002374, 0.2161073, -1.361788, 0.3921569, 1, 0, 1,
-0.5980952, -0.629908, -1.595814, 0.3843137, 1, 0, 1,
-0.5973072, 0.296129, -1.484967, 0.3803922, 1, 0, 1,
-0.5954352, -0.5544676, -2.696295, 0.372549, 1, 0, 1,
-0.5946761, 0.8367004, 0.4250309, 0.3686275, 1, 0, 1,
-0.592814, -1.10332, -2.23128, 0.3607843, 1, 0, 1,
-0.5915102, -1.680069, -2.349253, 0.3568628, 1, 0, 1,
-0.5869414, 2.939618, 0.1717581, 0.3490196, 1, 0, 1,
-0.58406, -1.401565, -3.154033, 0.345098, 1, 0, 1,
-0.5792458, 1.489127, -1.068062, 0.3372549, 1, 0, 1,
-0.5776193, -0.1931931, -1.640002, 0.3333333, 1, 0, 1,
-0.5774374, -0.9417315, -2.47683, 0.3254902, 1, 0, 1,
-0.5722667, -0.9413828, -2.894667, 0.3215686, 1, 0, 1,
-0.5690981, 0.8436441, -0.6311824, 0.3137255, 1, 0, 1,
-0.5676671, 0.738013, -0.3178218, 0.3098039, 1, 0, 1,
-0.5676402, -0.5640967, -2.238343, 0.3019608, 1, 0, 1,
-0.5676137, 0.1290869, -2.916336, 0.2941177, 1, 0, 1,
-0.5668638, 0.3173586, -1.393562, 0.2901961, 1, 0, 1,
-0.5666523, 0.6590026, 0.2004286, 0.282353, 1, 0, 1,
-0.5636133, -0.1609727, -1.451615, 0.2784314, 1, 0, 1,
-0.5629008, 0.9638888, 1.059198, 0.2705882, 1, 0, 1,
-0.5624018, -1.484272, -3.482222, 0.2666667, 1, 0, 1,
-0.5622301, 0.6823681, -0.7304186, 0.2588235, 1, 0, 1,
-0.5621973, -1.427076, -4.863665, 0.254902, 1, 0, 1,
-0.5606202, 0.6224999, -3.227668, 0.2470588, 1, 0, 1,
-0.5599552, -1.758159, -2.177534, 0.2431373, 1, 0, 1,
-0.557991, -1.387142, -3.95322, 0.2352941, 1, 0, 1,
-0.556138, -0.4803194, -0.8011134, 0.2313726, 1, 0, 1,
-0.5512762, -0.4754945, -2.08089, 0.2235294, 1, 0, 1,
-0.5502113, 1.053148, -1.228061, 0.2196078, 1, 0, 1,
-0.5340105, 1.423715, -0.2415173, 0.2117647, 1, 0, 1,
-0.5329947, 0.1365488, -2.051069, 0.2078431, 1, 0, 1,
-0.5321673, -0.8094314, -2.169555, 0.2, 1, 0, 1,
-0.531782, -0.04187047, -2.48704, 0.1921569, 1, 0, 1,
-0.528599, 1.003365, 0.5462037, 0.1882353, 1, 0, 1,
-0.5226265, -0.9856757, -3.342769, 0.1803922, 1, 0, 1,
-0.5219417, 0.4615271, -0.9324381, 0.1764706, 1, 0, 1,
-0.5216354, 1.620607, -0.6004243, 0.1686275, 1, 0, 1,
-0.5182748, -0.9093575, -2.615874, 0.1647059, 1, 0, 1,
-0.516412, -0.2725906, -2.933645, 0.1568628, 1, 0, 1,
-0.5116692, -0.9672192, -3.877606, 0.1529412, 1, 0, 1,
-0.5048122, 1.393323, 0.695731, 0.145098, 1, 0, 1,
-0.5014584, -0.9262654, -3.525737, 0.1411765, 1, 0, 1,
-0.4925793, 1.183064, 0.4001129, 0.1333333, 1, 0, 1,
-0.4925229, -1.314835, -3.949484, 0.1294118, 1, 0, 1,
-0.4886683, 0.8085448, 0.4856847, 0.1215686, 1, 0, 1,
-0.4827212, 1.536455, -0.7744426, 0.1176471, 1, 0, 1,
-0.480523, -0.1995654, -2.761623, 0.1098039, 1, 0, 1,
-0.4774894, -2.349792, -3.412861, 0.1058824, 1, 0, 1,
-0.4753206, -0.4760014, -2.262751, 0.09803922, 1, 0, 1,
-0.4735202, -0.2496992, -1.196347, 0.09019608, 1, 0, 1,
-0.4719386, -0.8031595, -1.966933, 0.08627451, 1, 0, 1,
-0.4649171, -0.5026474, -3.486793, 0.07843138, 1, 0, 1,
-0.4574381, -0.5946298, -3.724893, 0.07450981, 1, 0, 1,
-0.4573259, 0.7857358, -0.03701475, 0.06666667, 1, 0, 1,
-0.4533409, 0.2053186, -1.000886, 0.0627451, 1, 0, 1,
-0.4526403, -0.8855429, -2.873168, 0.05490196, 1, 0, 1,
-0.4526129, -0.06182761, -1.24959, 0.05098039, 1, 0, 1,
-0.4428126, -0.3741673, -1.357238, 0.04313726, 1, 0, 1,
-0.4408019, 1.990075, -1.084603, 0.03921569, 1, 0, 1,
-0.4401195, -1.05333, -5.220867, 0.03137255, 1, 0, 1,
-0.4394614, -2.392434, -1.385576, 0.02745098, 1, 0, 1,
-0.435309, 0.8262118, 1.014508, 0.01960784, 1, 0, 1,
-0.4282075, 0.7388044, -0.9064756, 0.01568628, 1, 0, 1,
-0.4281872, -0.6087028, -1.082733, 0.007843138, 1, 0, 1,
-0.4274666, -0.00061449, -1.773414, 0.003921569, 1, 0, 1,
-0.4231868, -2.490871, -2.704896, 0, 1, 0.003921569, 1,
-0.4224551, -0.7797764, -3.640477, 0, 1, 0.01176471, 1,
-0.4218011, -0.1406244, -2.88713, 0, 1, 0.01568628, 1,
-0.4178004, -1.103397, -2.443122, 0, 1, 0.02352941, 1,
-0.416029, -0.9478005, -2.711367, 0, 1, 0.02745098, 1,
-0.4149312, 0.4214153, -0.6228111, 0, 1, 0.03529412, 1,
-0.4140279, -1.311178, -2.567338, 0, 1, 0.03921569, 1,
-0.4100222, 0.09336044, -2.836831, 0, 1, 0.04705882, 1,
-0.409817, -0.5968916, -2.858378, 0, 1, 0.05098039, 1,
-0.4072753, -1.105278, -3.275597, 0, 1, 0.05882353, 1,
-0.4059957, 0.7259513, -1.084247, 0, 1, 0.0627451, 1,
-0.4020518, 0.4095744, -0.7567018, 0, 1, 0.07058824, 1,
-0.3980166, 0.2514549, -1.169671, 0, 1, 0.07450981, 1,
-0.3974073, -0.3786795, -1.475443, 0, 1, 0.08235294, 1,
-0.3962427, 1.088394, 0.04853886, 0, 1, 0.08627451, 1,
-0.3956753, 0.06038987, -1.84094, 0, 1, 0.09411765, 1,
-0.395142, -0.05160487, -1.992889, 0, 1, 0.1019608, 1,
-0.3949209, 0.3261442, -0.7182707, 0, 1, 0.1058824, 1,
-0.3931825, 0.569998, -1.931176, 0, 1, 0.1137255, 1,
-0.390918, -1.030398, -3.811205, 0, 1, 0.1176471, 1,
-0.3906629, -0.02277537, -2.188856, 0, 1, 0.1254902, 1,
-0.3897822, 0.3096697, -1.550744, 0, 1, 0.1294118, 1,
-0.3882836, -1.553471, -1.482807, 0, 1, 0.1372549, 1,
-0.3857533, 0.9476247, 0.1320482, 0, 1, 0.1411765, 1,
-0.3840825, -1.704928, -2.087055, 0, 1, 0.1490196, 1,
-0.3837758, -0.9699646, -1.746389, 0, 1, 0.1529412, 1,
-0.3809364, -0.2563471, -0.7239265, 0, 1, 0.1607843, 1,
-0.3693188, 0.9191998, -1.736721, 0, 1, 0.1647059, 1,
-0.3692528, -0.7714775, -3.199291, 0, 1, 0.172549, 1,
-0.3683891, 2.312803, -1.290999, 0, 1, 0.1764706, 1,
-0.3604611, 0.1962492, -0.7610999, 0, 1, 0.1843137, 1,
-0.3592506, -0.3413831, -2.505734, 0, 1, 0.1882353, 1,
-0.35514, -0.7308817, -3.341296, 0, 1, 0.1960784, 1,
-0.353768, 0.006013136, -3.225297, 0, 1, 0.2039216, 1,
-0.3501022, -0.8471729, -4.145043, 0, 1, 0.2078431, 1,
-0.3482425, 0.4850505, 0.3665897, 0, 1, 0.2156863, 1,
-0.34636, -0.07180279, -2.400407, 0, 1, 0.2196078, 1,
-0.3434919, -0.2286409, -1.8982, 0, 1, 0.227451, 1,
-0.3393539, 1.56117, -1.170336, 0, 1, 0.2313726, 1,
-0.3376986, 1.491554, -0.2533666, 0, 1, 0.2392157, 1,
-0.3325129, -0.4843931, -2.617138, 0, 1, 0.2431373, 1,
-0.3299458, -0.2117347, -3.590167, 0, 1, 0.2509804, 1,
-0.3297358, -0.7574787, -4.690548, 0, 1, 0.254902, 1,
-0.3284813, -0.5656393, -4.386368, 0, 1, 0.2627451, 1,
-0.3249227, 0.2452477, -1.82611, 0, 1, 0.2666667, 1,
-0.3230906, 0.3038463, 0.7985708, 0, 1, 0.2745098, 1,
-0.3226893, 2.641915, -0.8975098, 0, 1, 0.2784314, 1,
-0.3207419, 0.6192032, -0.2105739, 0, 1, 0.2862745, 1,
-0.3167635, -0.8790786, -4.350714, 0, 1, 0.2901961, 1,
-0.3147302, 2.370991, 0.4732274, 0, 1, 0.2980392, 1,
-0.3136716, 0.3283444, -1.202198, 0, 1, 0.3058824, 1,
-0.3124808, 0.547946, 2.762381, 0, 1, 0.3098039, 1,
-0.3108612, 1.468448, 0.3400968, 0, 1, 0.3176471, 1,
-0.3079898, -0.1300886, -1.153705, 0, 1, 0.3215686, 1,
-0.305643, 0.5199973, -0.2243986, 0, 1, 0.3294118, 1,
-0.304568, 1.015916, -0.4391309, 0, 1, 0.3333333, 1,
-0.3024604, -2.80426, -4.095132, 0, 1, 0.3411765, 1,
-0.3023453, 0.4658614, -2.511961, 0, 1, 0.345098, 1,
-0.3011096, 1.981574, 1.425877, 0, 1, 0.3529412, 1,
-0.3000228, 0.02614025, -1.439851, 0, 1, 0.3568628, 1,
-0.2987306, 2.651964, -0.4894018, 0, 1, 0.3647059, 1,
-0.2986668, 0.4474307, -1.59464, 0, 1, 0.3686275, 1,
-0.2950822, -0.02817144, -2.187688, 0, 1, 0.3764706, 1,
-0.290721, -0.869503, -2.629024, 0, 1, 0.3803922, 1,
-0.2895867, -0.05798543, -1.744639, 0, 1, 0.3882353, 1,
-0.288012, -2.365818, -4.037924, 0, 1, 0.3921569, 1,
-0.2868843, -1.848705, -3.073783, 0, 1, 0.4, 1,
-0.2819385, -0.4185725, -2.876534, 0, 1, 0.4078431, 1,
-0.278371, 0.9845578, 0.1138937, 0, 1, 0.4117647, 1,
-0.2768091, -0.1209855, -2.73033, 0, 1, 0.4196078, 1,
-0.2727765, 0.3774222, 0.6769402, 0, 1, 0.4235294, 1,
-0.2724413, -1.872792, -3.623968, 0, 1, 0.4313726, 1,
-0.2690604, 1.772889, 1.075337, 0, 1, 0.4352941, 1,
-0.2669556, 0.4315836, 0.2813479, 0, 1, 0.4431373, 1,
-0.2623925, 0.473967, -0.6972764, 0, 1, 0.4470588, 1,
-0.2593769, 0.1769307, -1.603855, 0, 1, 0.454902, 1,
-0.2551294, 0.5298238, 0.1308982, 0, 1, 0.4588235, 1,
-0.2520406, -0.4726672, -2.48937, 0, 1, 0.4666667, 1,
-0.2439307, 2.403056, -0.237249, 0, 1, 0.4705882, 1,
-0.24155, 0.3741255, -0.3327652, 0, 1, 0.4784314, 1,
-0.2340192, -1.514394, -3.34899, 0, 1, 0.4823529, 1,
-0.2255916, 0.3788733, -0.2961186, 0, 1, 0.4901961, 1,
-0.2213309, -0.8132851, -3.327806, 0, 1, 0.4941176, 1,
-0.2212849, 0.2214229, -0.7640538, 0, 1, 0.5019608, 1,
-0.2184388, -1.001219, -4.198011, 0, 1, 0.509804, 1,
-0.2161949, -0.6754926, -3.345351, 0, 1, 0.5137255, 1,
-0.2122576, -1.420048, -4.130918, 0, 1, 0.5215687, 1,
-0.2119945, -1.214969, -5.871284, 0, 1, 0.5254902, 1,
-0.2118544, -1.435544, -3.058531, 0, 1, 0.5333334, 1,
-0.2109183, 1.331479, -0.3334413, 0, 1, 0.5372549, 1,
-0.20547, -0.8500986, -1.896863, 0, 1, 0.5450981, 1,
-0.2028543, 1.00906, -0.770954, 0, 1, 0.5490196, 1,
-0.2016268, 0.8771842, 0.3545164, 0, 1, 0.5568628, 1,
-0.1982261, -0.5339964, -2.762358, 0, 1, 0.5607843, 1,
-0.1973762, -0.07756295, -4.600977, 0, 1, 0.5686275, 1,
-0.1884132, -0.1636562, -3.105862, 0, 1, 0.572549, 1,
-0.1856943, 1.162686, -1.026209, 0, 1, 0.5803922, 1,
-0.1823315, 2.837395, 1.175331, 0, 1, 0.5843138, 1,
-0.177913, -0.4433864, -1.499103, 0, 1, 0.5921569, 1,
-0.1748237, -0.3845648, -3.309642, 0, 1, 0.5960785, 1,
-0.1727634, 0.2236785, -1.457365, 0, 1, 0.6039216, 1,
-0.1720617, 0.488427, 1.405705, 0, 1, 0.6117647, 1,
-0.171343, 0.3693931, -0.09129053, 0, 1, 0.6156863, 1,
-0.1700992, 0.3278931, -1.578841, 0, 1, 0.6235294, 1,
-0.1679842, 0.7748571, 0.1645543, 0, 1, 0.627451, 1,
-0.1616231, 0.03031608, -0.9037701, 0, 1, 0.6352941, 1,
-0.1614687, -0.2482897, -3.226021, 0, 1, 0.6392157, 1,
-0.1592869, 0.7568654, 1.371527, 0, 1, 0.6470588, 1,
-0.1583431, 0.1591532, -1.2815, 0, 1, 0.6509804, 1,
-0.1564315, 0.1309894, -1.706616, 0, 1, 0.6588235, 1,
-0.1544356, 1.005249, -0.008861309, 0, 1, 0.6627451, 1,
-0.1542183, -0.3458587, -3.777776, 0, 1, 0.6705883, 1,
-0.1536884, 0.7874058, 0.003067728, 0, 1, 0.6745098, 1,
-0.1533379, 0.5375071, -0.8300982, 0, 1, 0.682353, 1,
-0.1507705, 2.016158, -0.1006578, 0, 1, 0.6862745, 1,
-0.146872, -1.788525, -1.699484, 0, 1, 0.6941177, 1,
-0.1465413, -0.7180019, -1.718162, 0, 1, 0.7019608, 1,
-0.1440188, -0.4378357, -2.08628, 0, 1, 0.7058824, 1,
-0.1417518, 1.228407, -0.3761274, 0, 1, 0.7137255, 1,
-0.1412551, 0.0139675, -2.322791, 0, 1, 0.7176471, 1,
-0.1296824, -1.006207, -3.680613, 0, 1, 0.7254902, 1,
-0.1296438, -1.351138, -4.427339, 0, 1, 0.7294118, 1,
-0.1295552, 0.3604019, -0.7933956, 0, 1, 0.7372549, 1,
-0.1284062, 0.9515924, -0.1170876, 0, 1, 0.7411765, 1,
-0.1270052, 0.6330957, 0.4165281, 0, 1, 0.7490196, 1,
-0.1266188, 0.8124023, 0.03070235, 0, 1, 0.7529412, 1,
-0.1221149, -1.015905, -4.328741, 0, 1, 0.7607843, 1,
-0.1220903, 0.6381195, -1.51273, 0, 1, 0.7647059, 1,
-0.1203573, 1.323782, 0.2183437, 0, 1, 0.772549, 1,
-0.1200185, -0.9957424, -2.862083, 0, 1, 0.7764706, 1,
-0.1158571, -0.2563408, -2.62349, 0, 1, 0.7843137, 1,
-0.1109249, -0.8773655, -2.415952, 0, 1, 0.7882353, 1,
-0.1020465, 1.528067, 0.04485893, 0, 1, 0.7960784, 1,
-0.09747852, -0.2066941, -2.18459, 0, 1, 0.8039216, 1,
-0.09526664, -0.4762317, -3.505075, 0, 1, 0.8078431, 1,
-0.08839763, -1.159875, -4.373237, 0, 1, 0.8156863, 1,
-0.08689795, 2.233023, 2.130829, 0, 1, 0.8196079, 1,
-0.08567982, 0.7662031, 1.262302, 0, 1, 0.827451, 1,
-0.08510786, 0.5559037, -1.668101, 0, 1, 0.8313726, 1,
-0.07959169, 1.829578, -1.392451, 0, 1, 0.8392157, 1,
-0.07923373, 1.820497, 0.3278124, 0, 1, 0.8431373, 1,
-0.07701229, 0.111184, -0.7332602, 0, 1, 0.8509804, 1,
-0.07416049, -0.6509888, -2.445856, 0, 1, 0.854902, 1,
-0.07119324, 0.3108979, -0.3978315, 0, 1, 0.8627451, 1,
-0.0704485, 0.1069186, -0.2548724, 0, 1, 0.8666667, 1,
-0.06716517, -0.5791886, -2.869082, 0, 1, 0.8745098, 1,
-0.06474013, -0.9440846, -3.60543, 0, 1, 0.8784314, 1,
-0.06042317, 0.7464191, 0.6462559, 0, 1, 0.8862745, 1,
-0.05082471, 0.8809721, -1.336682, 0, 1, 0.8901961, 1,
-0.04991055, 0.233324, -0.3830639, 0, 1, 0.8980392, 1,
-0.04645555, -0.1859131, -4.073138, 0, 1, 0.9058824, 1,
-0.04330629, 1.051515, 1.040704, 0, 1, 0.9098039, 1,
-0.03955412, -1.904365, -2.038656, 0, 1, 0.9176471, 1,
-0.03549714, 0.7349045, 0.6913779, 0, 1, 0.9215686, 1,
-0.03517722, 0.5258273, -0.1681099, 0, 1, 0.9294118, 1,
-0.03506028, -0.8112558, -3.833724, 0, 1, 0.9333333, 1,
-0.03435314, 0.03180249, -2.437023, 0, 1, 0.9411765, 1,
-0.03413703, -0.2047421, -3.074198, 0, 1, 0.945098, 1,
-0.03054764, -1.67273, -4.356694, 0, 1, 0.9529412, 1,
-0.02757623, 0.201485, -1.212683, 0, 1, 0.9568627, 1,
-0.02580873, 0.526734, 0.4940975, 0, 1, 0.9647059, 1,
-0.02433188, -0.3233874, -2.253685, 0, 1, 0.9686275, 1,
-0.02388983, 1.093091, 0.4499376, 0, 1, 0.9764706, 1,
-0.02320121, 1.854311, -0.9230426, 0, 1, 0.9803922, 1,
-0.02241447, 0.3305812, -1.466371, 0, 1, 0.9882353, 1,
-0.02157428, -1.722456, -3.682307, 0, 1, 0.9921569, 1,
-0.02146669, 0.5673075, 1.926261, 0, 1, 1, 1,
-0.01805382, -1.405612, -3.760477, 0, 0.9921569, 1, 1,
-0.01801344, -0.05035247, -4.181719, 0, 0.9882353, 1, 1,
-0.01509849, 1.068845, 0.5978804, 0, 0.9803922, 1, 1,
-0.01488124, -1.138965, -4.65599, 0, 0.9764706, 1, 1,
-0.01340786, -0.5376107, -3.516475, 0, 0.9686275, 1, 1,
-0.009833695, -1.748993, -2.959393, 0, 0.9647059, 1, 1,
-0.008567684, -0.9632847, -3.760959, 0, 0.9568627, 1, 1,
-0.008029313, 1.364236, 0.06307959, 0, 0.9529412, 1, 1,
-0.003963429, 0.5846853, 0.6362541, 0, 0.945098, 1, 1,
-0.003854115, -0.3911492, -2.931406, 0, 0.9411765, 1, 1,
-0.003508991, -0.1296194, -3.491662, 0, 0.9333333, 1, 1,
0.000222816, -1.15594, 2.93102, 0, 0.9294118, 1, 1,
0.0002826533, -0.5209008, 3.582892, 0, 0.9215686, 1, 1,
0.00187609, 0.6242197, -0.5162501, 0, 0.9176471, 1, 1,
0.002628048, 0.2978213, 0.3523827, 0, 0.9098039, 1, 1,
0.002879302, -0.852504, 4.653299, 0, 0.9058824, 1, 1,
0.00330424, -1.491767, 4.514449, 0, 0.8980392, 1, 1,
0.004371361, -0.468745, 4.733259, 0, 0.8901961, 1, 1,
0.005165622, -0.01649481, 2.444947, 0, 0.8862745, 1, 1,
0.006337668, 0.3052275, 1.087546, 0, 0.8784314, 1, 1,
0.007493922, 1.028821, -1.425269, 0, 0.8745098, 1, 1,
0.01079908, 0.05247603, -0.9474496, 0, 0.8666667, 1, 1,
0.01394808, 1.605598, -0.9064499, 0, 0.8627451, 1, 1,
0.01692143, -0.1475254, 2.501504, 0, 0.854902, 1, 1,
0.01700104, 1.439982, -0.267523, 0, 0.8509804, 1, 1,
0.0187697, -0.4813299, 2.875543, 0, 0.8431373, 1, 1,
0.02212501, -1.131107, 4.449154, 0, 0.8392157, 1, 1,
0.02628374, -1.316874, 2.915389, 0, 0.8313726, 1, 1,
0.02750761, -1.214718, 4.197258, 0, 0.827451, 1, 1,
0.02904123, 1.062165, 0.2610736, 0, 0.8196079, 1, 1,
0.0316787, 0.2535427, -0.3117931, 0, 0.8156863, 1, 1,
0.03912255, -0.2698119, 2.905843, 0, 0.8078431, 1, 1,
0.03942668, 0.5667031, -1.0044, 0, 0.8039216, 1, 1,
0.04297702, 0.9695559, -0.9038275, 0, 0.7960784, 1, 1,
0.04584929, -1.518971, 3.292653, 0, 0.7882353, 1, 1,
0.04650371, -1.008282, 3.019712, 0, 0.7843137, 1, 1,
0.04806119, -1.005978, 1.73592, 0, 0.7764706, 1, 1,
0.05017462, -0.1464289, 2.088005, 0, 0.772549, 1, 1,
0.05167392, -1.312232, 3.060335, 0, 0.7647059, 1, 1,
0.05526222, -1.105896, 3.926476, 0, 0.7607843, 1, 1,
0.05577696, 0.06318601, 0.3236032, 0, 0.7529412, 1, 1,
0.05825327, 0.4252385, 0.4058813, 0, 0.7490196, 1, 1,
0.05882258, 0.8690368, -0.7302684, 0, 0.7411765, 1, 1,
0.06036275, 0.1963154, 1.526466, 0, 0.7372549, 1, 1,
0.068512, 0.5417963, 0.8983181, 0, 0.7294118, 1, 1,
0.06897388, -0.01863881, 3.682002, 0, 0.7254902, 1, 1,
0.0717776, -2.065708, 3.528033, 0, 0.7176471, 1, 1,
0.07315397, 1.792269, -0.06931827, 0, 0.7137255, 1, 1,
0.08783682, 0.4044647, 1.245654, 0, 0.7058824, 1, 1,
0.09845971, -0.257774, 1.887209, 0, 0.6980392, 1, 1,
0.09919494, -0.2272912, 2.634024, 0, 0.6941177, 1, 1,
0.1027358, -0.7158319, 3.94637, 0, 0.6862745, 1, 1,
0.1030026, 0.5460528, 0.8655338, 0, 0.682353, 1, 1,
0.1034373, 0.1496707, 0.3218392, 0, 0.6745098, 1, 1,
0.1038919, 1.716213, 1.427084, 0, 0.6705883, 1, 1,
0.1062897, 2.323023, -0.6831745, 0, 0.6627451, 1, 1,
0.1078274, -0.1551075, 2.787617, 0, 0.6588235, 1, 1,
0.1089082, -0.6413323, 3.771895, 0, 0.6509804, 1, 1,
0.1142268, 0.2321777, 0.7151555, 0, 0.6470588, 1, 1,
0.1145432, 0.1656825, -0.301972, 0, 0.6392157, 1, 1,
0.1166616, 1.636534, -0.3029993, 0, 0.6352941, 1, 1,
0.1189566, -0.8389212, 2.685374, 0, 0.627451, 1, 1,
0.1191102, -0.5589043, 4.19781, 0, 0.6235294, 1, 1,
0.1222654, 1.586778, -0.4102834, 0, 0.6156863, 1, 1,
0.1226057, 0.4525898, 2.517384, 0, 0.6117647, 1, 1,
0.1249555, -0.5671234, 3.151665, 0, 0.6039216, 1, 1,
0.1270769, -0.08635856, 1.877197, 0, 0.5960785, 1, 1,
0.1283146, -1.189257, 2.167522, 0, 0.5921569, 1, 1,
0.1293778, -1.174322, 3.520339, 0, 0.5843138, 1, 1,
0.1349019, 0.5376779, 0.6965337, 0, 0.5803922, 1, 1,
0.1367987, 0.6520974, 0.5462286, 0, 0.572549, 1, 1,
0.1370538, -0.09112015, 1.195976, 0, 0.5686275, 1, 1,
0.1393852, -0.08442599, 3.769702, 0, 0.5607843, 1, 1,
0.1420795, 0.9852288, -0.1668598, 0, 0.5568628, 1, 1,
0.145709, 0.5120141, -0.1516865, 0, 0.5490196, 1, 1,
0.1520528, -1.188045, 2.46639, 0, 0.5450981, 1, 1,
0.164848, 0.2708502, 1.171702, 0, 0.5372549, 1, 1,
0.1661566, 0.3154415, 1.625501, 0, 0.5333334, 1, 1,
0.1701471, 1.007951, 0.1843946, 0, 0.5254902, 1, 1,
0.1728902, 1.515649, 2.017272, 0, 0.5215687, 1, 1,
0.1821463, 0.1988427, 1.048095, 0, 0.5137255, 1, 1,
0.1827675, 1.114524, -0.5332316, 0, 0.509804, 1, 1,
0.1881385, -1.936028, 2.89617, 0, 0.5019608, 1, 1,
0.1989066, 1.264707, -0.73149, 0, 0.4941176, 1, 1,
0.2022292, -0.5378321, 0.52711, 0, 0.4901961, 1, 1,
0.2041027, -0.4001555, 1.626915, 0, 0.4823529, 1, 1,
0.204828, -1.378667, 3.824718, 0, 0.4784314, 1, 1,
0.2055802, 0.4585257, 0.9465554, 0, 0.4705882, 1, 1,
0.207463, -0.9854954, 2.165806, 0, 0.4666667, 1, 1,
0.2090274, -0.6739966, 3.140716, 0, 0.4588235, 1, 1,
0.2119811, 1.56335, 1.490072, 0, 0.454902, 1, 1,
0.2128986, -0.8459182, 1.713174, 0, 0.4470588, 1, 1,
0.2154502, 0.5216419, 1.112512, 0, 0.4431373, 1, 1,
0.2185391, -0.06141622, 1.483645, 0, 0.4352941, 1, 1,
0.2193857, -2.078296, 1.713341, 0, 0.4313726, 1, 1,
0.2297473, -2.402095, 2.5833, 0, 0.4235294, 1, 1,
0.2356628, 0.4590394, -0.6663994, 0, 0.4196078, 1, 1,
0.2517305, -1.026887, 4.998088, 0, 0.4117647, 1, 1,
0.2520363, 0.5335692, 2.198808, 0, 0.4078431, 1, 1,
0.2536741, -0.7474629, 3.844944, 0, 0.4, 1, 1,
0.2575535, 0.03894995, 1.41905, 0, 0.3921569, 1, 1,
0.2581266, 0.05585518, 2.221493, 0, 0.3882353, 1, 1,
0.2595709, 0.2332336, 2.029747, 0, 0.3803922, 1, 1,
0.260433, -0.5803912, 2.341032, 0, 0.3764706, 1, 1,
0.2633811, -0.446556, 3.577888, 0, 0.3686275, 1, 1,
0.2653274, 1.341027, 1.430169, 0, 0.3647059, 1, 1,
0.2664816, 1.124178, -0.2467825, 0, 0.3568628, 1, 1,
0.2682726, -0.3908498, 3.855563, 0, 0.3529412, 1, 1,
0.2732443, -1.150724, 2.069421, 0, 0.345098, 1, 1,
0.2758945, -1.074944, 3.913293, 0, 0.3411765, 1, 1,
0.2794994, -0.3455462, 2.637455, 0, 0.3333333, 1, 1,
0.2795963, -1.103186, 1.827431, 0, 0.3294118, 1, 1,
0.28104, 0.5362105, 0.3909632, 0, 0.3215686, 1, 1,
0.2811538, 1.427411, -0.0875869, 0, 0.3176471, 1, 1,
0.2822339, 1.962504, 0.2965364, 0, 0.3098039, 1, 1,
0.2822689, -0.5226216, 1.363427, 0, 0.3058824, 1, 1,
0.2870045, 1.574621, -0.453162, 0, 0.2980392, 1, 1,
0.2923339, 0.4300002, -0.8983545, 0, 0.2901961, 1, 1,
0.2950226, -0.2186133, 2.969524, 0, 0.2862745, 1, 1,
0.2972099, 0.1322294, 0.1945344, 0, 0.2784314, 1, 1,
0.2974353, 0.5243359, 2.114234, 0, 0.2745098, 1, 1,
0.298129, -1.547302, 2.656196, 0, 0.2666667, 1, 1,
0.2989728, 0.4422394, -0.8294092, 0, 0.2627451, 1, 1,
0.3067934, -0.3694323, 2.306102, 0, 0.254902, 1, 1,
0.31032, 0.9251261, 1.083932, 0, 0.2509804, 1, 1,
0.3127798, 2.140937, 0.4148189, 0, 0.2431373, 1, 1,
0.3203492, 0.4571231, 2.629381, 0, 0.2392157, 1, 1,
0.3290376, 1.450774, 0.01521712, 0, 0.2313726, 1, 1,
0.3294789, 1.185463, 0.1106109, 0, 0.227451, 1, 1,
0.3327399, 0.3861006, 0.6453471, 0, 0.2196078, 1, 1,
0.335186, -1.636102, 3.184283, 0, 0.2156863, 1, 1,
0.3361171, 1.379269, -1.247292, 0, 0.2078431, 1, 1,
0.3395299, 0.2318503, 0.04631873, 0, 0.2039216, 1, 1,
0.3411984, 0.1593907, 0.1956953, 0, 0.1960784, 1, 1,
0.3435131, -0.6627105, 3.038696, 0, 0.1882353, 1, 1,
0.3462431, 0.9115756, -0.1934822, 0, 0.1843137, 1, 1,
0.3490422, 0.2324476, 1.144225, 0, 0.1764706, 1, 1,
0.3503624, -0.6251139, 2.334281, 0, 0.172549, 1, 1,
0.3510681, 1.104217, -0.4873393, 0, 0.1647059, 1, 1,
0.351855, 0.6750526, 0.6614847, 0, 0.1607843, 1, 1,
0.3531128, 1.827342, 1.237531, 0, 0.1529412, 1, 1,
0.3543521, -0.500961, 1.704069, 0, 0.1490196, 1, 1,
0.354594, -0.3974537, 1.141536, 0, 0.1411765, 1, 1,
0.3548459, -0.2614412, 2.215155, 0, 0.1372549, 1, 1,
0.3559566, -1.517186, 0.10925, 0, 0.1294118, 1, 1,
0.3582488, -0.294616, 5.377699, 0, 0.1254902, 1, 1,
0.3608396, -1.708478, 1.906739, 0, 0.1176471, 1, 1,
0.3611913, -0.2826288, 1.324596, 0, 0.1137255, 1, 1,
0.3654385, -0.9902447, 1.837531, 0, 0.1058824, 1, 1,
0.3698883, 0.5224534, 0.4205775, 0, 0.09803922, 1, 1,
0.3700174, 1.339733, 0.05352198, 0, 0.09411765, 1, 1,
0.3726625, -0.06873026, 0.9153115, 0, 0.08627451, 1, 1,
0.3767452, -0.11781, 1.46443, 0, 0.08235294, 1, 1,
0.3786638, 1.659436, 1.443478, 0, 0.07450981, 1, 1,
0.3851234, -0.501372, 1.067173, 0, 0.07058824, 1, 1,
0.3889345, 0.2014901, 0.9582117, 0, 0.0627451, 1, 1,
0.3916466, 0.8793609, 0.9991117, 0, 0.05882353, 1, 1,
0.3917621, 0.7800536, -0.2142758, 0, 0.05098039, 1, 1,
0.3943945, -0.0493237, 2.039955, 0, 0.04705882, 1, 1,
0.3978767, 1.985638, 0.7676796, 0, 0.03921569, 1, 1,
0.4011922, 0.6358879, -0.990753, 0, 0.03529412, 1, 1,
0.4028636, 0.8180309, 2.399865, 0, 0.02745098, 1, 1,
0.4042152, -0.1044715, 1.524188, 0, 0.02352941, 1, 1,
0.404991, 0.8926169, 0.2393118, 0, 0.01568628, 1, 1,
0.4087046, -1.012457, 4.699203, 0, 0.01176471, 1, 1,
0.4097134, -0.8921303, 2.42968, 0, 0.003921569, 1, 1,
0.4109078, 0.6321586, 1.292784, 0.003921569, 0, 1, 1,
0.4138461, -0.2369628, 2.349592, 0.007843138, 0, 1, 1,
0.4145238, -1.905494, 3.999244, 0.01568628, 0, 1, 1,
0.4158913, -0.3030397, 1.826453, 0.01960784, 0, 1, 1,
0.4211302, -1.851931, 2.451791, 0.02745098, 0, 1, 1,
0.4215603, 1.365371, 0.2889304, 0.03137255, 0, 1, 1,
0.4259491, -0.5332327, 3.115494, 0.03921569, 0, 1, 1,
0.4260967, -1.974997, 1.391373, 0.04313726, 0, 1, 1,
0.4267951, 0.470718, 0.5741565, 0.05098039, 0, 1, 1,
0.4388426, 0.05473738, 1.646161, 0.05490196, 0, 1, 1,
0.4442645, 0.2299778, 1.34858, 0.0627451, 0, 1, 1,
0.4489563, -0.9764369, 2.252395, 0.06666667, 0, 1, 1,
0.4501094, -1.121922, 2.252711, 0.07450981, 0, 1, 1,
0.4502865, -0.6599188, 2.338285, 0.07843138, 0, 1, 1,
0.4505207, -0.2489499, 2.027348, 0.08627451, 0, 1, 1,
0.4519946, 1.751196, 0.1591972, 0.09019608, 0, 1, 1,
0.4526237, 0.01601207, 0.8623754, 0.09803922, 0, 1, 1,
0.45559, -0.18251, 2.554447, 0.1058824, 0, 1, 1,
0.4556078, 0.4730084, 2.190011, 0.1098039, 0, 1, 1,
0.456138, -1.546471, 3.775498, 0.1176471, 0, 1, 1,
0.4612615, -1.028697, 3.623152, 0.1215686, 0, 1, 1,
0.4645461, -2.49285, 2.289348, 0.1294118, 0, 1, 1,
0.4655415, 0.5880363, 1.41039, 0.1333333, 0, 1, 1,
0.4684407, -0.4629569, 4.03055, 0.1411765, 0, 1, 1,
0.4806449, -0.9313465, 2.984837, 0.145098, 0, 1, 1,
0.4849657, -1.57945, 4.044878, 0.1529412, 0, 1, 1,
0.4877186, 0.5787456, -0.08067031, 0.1568628, 0, 1, 1,
0.4922903, 0.5178655, -0.195315, 0.1647059, 0, 1, 1,
0.4944491, 0.8630344, 1.171063, 0.1686275, 0, 1, 1,
0.4987044, -0.5524191, 3.040547, 0.1764706, 0, 1, 1,
0.4987411, -0.9639212, 2.836859, 0.1803922, 0, 1, 1,
0.5042515, 2.726732, 0.4376297, 0.1882353, 0, 1, 1,
0.5072919, 1.035079, 1.625428, 0.1921569, 0, 1, 1,
0.5096357, -1.048693, 3.137293, 0.2, 0, 1, 1,
0.5137838, 1.011375, -1.03506, 0.2078431, 0, 1, 1,
0.5159294, 0.312555, 1.362197, 0.2117647, 0, 1, 1,
0.5196624, 0.7881677, 1.808539, 0.2196078, 0, 1, 1,
0.5198777, -0.06927296, 1.934121, 0.2235294, 0, 1, 1,
0.5230659, 0.31847, 0.5731627, 0.2313726, 0, 1, 1,
0.524615, 0.08040784, 2.658734, 0.2352941, 0, 1, 1,
0.5302979, 0.864659, 1.209033, 0.2431373, 0, 1, 1,
0.5352157, 0.384455, -0.2035366, 0.2470588, 0, 1, 1,
0.5361142, -0.9136693, 2.732586, 0.254902, 0, 1, 1,
0.5404073, 0.9571443, -0.2476521, 0.2588235, 0, 1, 1,
0.5407832, 1.620583, 0.2942741, 0.2666667, 0, 1, 1,
0.5434723, -0.378804, 2.723439, 0.2705882, 0, 1, 1,
0.5436062, 1.334944, -0.3406304, 0.2784314, 0, 1, 1,
0.5459337, 0.89061, 0.07328826, 0.282353, 0, 1, 1,
0.551127, 0.9125077, 0.9871874, 0.2901961, 0, 1, 1,
0.5521218, -0.576878, 2.140985, 0.2941177, 0, 1, 1,
0.5620142, -0.2540276, 1.338107, 0.3019608, 0, 1, 1,
0.5639765, -0.4222569, 2.452009, 0.3098039, 0, 1, 1,
0.5651827, 0.1175776, 0.1705155, 0.3137255, 0, 1, 1,
0.5663044, -1.039236, 2.637341, 0.3215686, 0, 1, 1,
0.5674887, -0.4781079, 2.499315, 0.3254902, 0, 1, 1,
0.5692719, -0.8673844, 3.633038, 0.3333333, 0, 1, 1,
0.5731071, -0.05824713, 2.098941, 0.3372549, 0, 1, 1,
0.5731192, -1.560899, 2.111087, 0.345098, 0, 1, 1,
0.5737294, -0.1810186, 2.213862, 0.3490196, 0, 1, 1,
0.5749592, -0.3141837, 3.642458, 0.3568628, 0, 1, 1,
0.5784222, -0.1880036, 1.184958, 0.3607843, 0, 1, 1,
0.5902991, -0.2589473, 2.219431, 0.3686275, 0, 1, 1,
0.5928221, 0.6106197, -0.2920704, 0.372549, 0, 1, 1,
0.6064041, -0.6281271, 0.7530582, 0.3803922, 0, 1, 1,
0.6105368, 0.1590529, 0.9886082, 0.3843137, 0, 1, 1,
0.6191239, 2.279044, 0.9023724, 0.3921569, 0, 1, 1,
0.6221227, 1.364722, 0.6933956, 0.3960784, 0, 1, 1,
0.625552, 0.5695078, 0.5158543, 0.4039216, 0, 1, 1,
0.6272549, 0.9186377, -0.114065, 0.4117647, 0, 1, 1,
0.6285704, -1.216199, 3.563663, 0.4156863, 0, 1, 1,
0.6310192, -0.2598478, 3.173976, 0.4235294, 0, 1, 1,
0.6336881, -1.007732, 1.82927, 0.427451, 0, 1, 1,
0.6380216, -0.2764117, 1.450603, 0.4352941, 0, 1, 1,
0.641995, -0.1543156, 2.978814, 0.4392157, 0, 1, 1,
0.6423526, 0.6147982, 0.8089504, 0.4470588, 0, 1, 1,
0.6475707, 0.7053665, 2.16092, 0.4509804, 0, 1, 1,
0.6497136, -0.376818, 0.9964333, 0.4588235, 0, 1, 1,
0.6503869, 0.8864415, 0.236184, 0.4627451, 0, 1, 1,
0.6513864, -0.475372, 1.514237, 0.4705882, 0, 1, 1,
0.6533465, 0.2091139, 0.2688669, 0.4745098, 0, 1, 1,
0.6611526, -1.384696, 0.7584356, 0.4823529, 0, 1, 1,
0.6613159, 1.537447, -1.880597, 0.4862745, 0, 1, 1,
0.663513, 0.3088062, 0.8958871, 0.4941176, 0, 1, 1,
0.6750942, 0.4048289, 0.8329965, 0.5019608, 0, 1, 1,
0.6831433, 0.3694843, -0.8799608, 0.5058824, 0, 1, 1,
0.6862605, -2.16427, 2.240083, 0.5137255, 0, 1, 1,
0.6892483, 0.1932579, 3.245995, 0.5176471, 0, 1, 1,
0.7101083, 1.990941, 0.3317197, 0.5254902, 0, 1, 1,
0.7130579, 0.2195438, -0.02705542, 0.5294118, 0, 1, 1,
0.7136496, -1.133365, 1.628555, 0.5372549, 0, 1, 1,
0.7178134, -0.7861729, 4.48049, 0.5411765, 0, 1, 1,
0.7215801, 0.6560947, 2.752057, 0.5490196, 0, 1, 1,
0.7312549, 0.28825, 0.3446578, 0.5529412, 0, 1, 1,
0.7324272, 1.576291, 0.4208027, 0.5607843, 0, 1, 1,
0.7349678, 0.1175943, 2.691969, 0.5647059, 0, 1, 1,
0.7366514, 0.250938, 2.054836, 0.572549, 0, 1, 1,
0.7390912, 1.199474, 1.082727, 0.5764706, 0, 1, 1,
0.7451189, 0.1258865, 2.728356, 0.5843138, 0, 1, 1,
0.7494345, 1.450374, 2.429693, 0.5882353, 0, 1, 1,
0.7541393, -2.139774, 1.79469, 0.5960785, 0, 1, 1,
0.7624683, 0.7461835, 0.4573172, 0.6039216, 0, 1, 1,
0.7630917, 0.6247817, 0.113633, 0.6078432, 0, 1, 1,
0.7680751, -2.344341, 2.098358, 0.6156863, 0, 1, 1,
0.7691051, -0.1571639, 3.041351, 0.6196079, 0, 1, 1,
0.769683, 0.08599509, 1.979448, 0.627451, 0, 1, 1,
0.7698303, -0.01720973, 2.836058, 0.6313726, 0, 1, 1,
0.7830096, 0.06148745, 1.951091, 0.6392157, 0, 1, 1,
0.7859694, 0.7902877, 2.801111, 0.6431373, 0, 1, 1,
0.7863296, -1.800343, 1.915366, 0.6509804, 0, 1, 1,
0.7890106, -0.3846971, 1.30527, 0.654902, 0, 1, 1,
0.7934962, -0.57046, 1.405808, 0.6627451, 0, 1, 1,
0.7939569, -0.0454008, 0.7032049, 0.6666667, 0, 1, 1,
0.7991304, 2.566937, 0.2793456, 0.6745098, 0, 1, 1,
0.7999822, 0.1085492, 0.4877473, 0.6784314, 0, 1, 1,
0.8013047, -0.2054813, 1.7401, 0.6862745, 0, 1, 1,
0.8017327, 0.1692187, 0.2003159, 0.6901961, 0, 1, 1,
0.8024084, 0.4591745, 2.004489, 0.6980392, 0, 1, 1,
0.8042494, 0.4471217, 0.3914274, 0.7058824, 0, 1, 1,
0.8097382, 0.01452274, 1.632453, 0.7098039, 0, 1, 1,
0.8116269, -1.005826, 1.116739, 0.7176471, 0, 1, 1,
0.8182475, -1.282961, 3.458159, 0.7215686, 0, 1, 1,
0.820875, -0.3853915, 3.748623, 0.7294118, 0, 1, 1,
0.8223008, 0.3165539, 0.954011, 0.7333333, 0, 1, 1,
0.8323931, 1.285597, -0.009330963, 0.7411765, 0, 1, 1,
0.8351563, -0.6223114, 0.9282278, 0.7450981, 0, 1, 1,
0.8352848, 0.9712049, 0.9611652, 0.7529412, 0, 1, 1,
0.8355788, -2.067582, 2.178893, 0.7568628, 0, 1, 1,
0.8419144, -0.5228823, 0.7645884, 0.7647059, 0, 1, 1,
0.8493006, 1.1314, -0.6380255, 0.7686275, 0, 1, 1,
0.8500563, 0.9690557, 1.122231, 0.7764706, 0, 1, 1,
0.8506207, 0.3184977, 2.235849, 0.7803922, 0, 1, 1,
0.8508466, 0.1601289, 0.6578616, 0.7882353, 0, 1, 1,
0.8518957, 0.08484562, 0.2285025, 0.7921569, 0, 1, 1,
0.855919, 0.9226621, 0.4431362, 0.8, 0, 1, 1,
0.8599506, -0.6526333, 3.522702, 0.8078431, 0, 1, 1,
0.8613192, -0.07107254, 0.9560229, 0.8117647, 0, 1, 1,
0.8676288, 0.5764326, 0.7154024, 0.8196079, 0, 1, 1,
0.8793291, -0.3755234, 0.4474449, 0.8235294, 0, 1, 1,
0.8800943, -0.1027375, 2.649214, 0.8313726, 0, 1, 1,
0.8823185, -1.569986, 1.791142, 0.8352941, 0, 1, 1,
0.8937693, 0.1219059, 1.316251, 0.8431373, 0, 1, 1,
0.8954833, -1.489505, 2.509733, 0.8470588, 0, 1, 1,
0.9052584, 1.559117, -0.6617609, 0.854902, 0, 1, 1,
0.9072156, -1.81364, 2.366705, 0.8588235, 0, 1, 1,
0.9081864, -0.4397342, 4.553287, 0.8666667, 0, 1, 1,
0.9090234, 0.1652479, 1.930615, 0.8705882, 0, 1, 1,
0.9112055, -0.7696118, 0.5732709, 0.8784314, 0, 1, 1,
0.9156935, -1.498598, 2.704568, 0.8823529, 0, 1, 1,
0.9170629, 1.117161, -0.4583567, 0.8901961, 0, 1, 1,
0.9205036, 0.8358949, 0.7590424, 0.8941177, 0, 1, 1,
0.9234738, 0.4246154, 1.902705, 0.9019608, 0, 1, 1,
0.9262362, -1.311619, 4.775211, 0.9098039, 0, 1, 1,
0.9305565, -0.2513528, 1.279202, 0.9137255, 0, 1, 1,
0.9350274, 0.4093098, 0.4277525, 0.9215686, 0, 1, 1,
0.9373427, -0.736172, 2.860248, 0.9254902, 0, 1, 1,
0.937753, -1.018363, 2.791307, 0.9333333, 0, 1, 1,
0.9382498, 0.06635519, 0.3605788, 0.9372549, 0, 1, 1,
0.9394901, 0.239788, 0.4087187, 0.945098, 0, 1, 1,
0.9454302, -0.7429994, 2.059453, 0.9490196, 0, 1, 1,
0.9499959, 0.0705279, 1.172594, 0.9568627, 0, 1, 1,
0.9503504, -0.884632, 2.858878, 0.9607843, 0, 1, 1,
0.9540657, 0.1151803, 3.153941, 0.9686275, 0, 1, 1,
0.9548215, 0.4384221, 1.795582, 0.972549, 0, 1, 1,
0.9571202, 0.3698508, 1.379265, 0.9803922, 0, 1, 1,
0.9577501, -0.02287753, 2.685116, 0.9843137, 0, 1, 1,
0.960808, -0.09568094, -0.5995588, 0.9921569, 0, 1, 1,
0.9668839, -1.405289, 2.235136, 0.9960784, 0, 1, 1,
0.9732341, -0.8478036, 1.729124, 1, 0, 0.9960784, 1,
0.9834952, 0.6325726, 0.9170366, 1, 0, 0.9882353, 1,
0.9845669, -2.057449, 2.742804, 1, 0, 0.9843137, 1,
0.9857457, -0.2113396, -0.08626989, 1, 0, 0.9764706, 1,
0.9918737, 0.3467364, 0.6776263, 1, 0, 0.972549, 1,
0.9923647, -0.9771338, 2.75546, 1, 0, 0.9647059, 1,
0.9933718, -1.22144, 1.097487, 1, 0, 0.9607843, 1,
0.9938574, 0.8523126, 1.058517, 1, 0, 0.9529412, 1,
0.9953969, 0.05995191, 2.297163, 1, 0, 0.9490196, 1,
1.001765, 0.3837777, 4.405654, 1, 0, 0.9411765, 1,
1.018847, -0.7092938, 1.656591, 1, 0, 0.9372549, 1,
1.019056, -0.2189171, 1.695472, 1, 0, 0.9294118, 1,
1.020002, 0.06966455, 3.532031, 1, 0, 0.9254902, 1,
1.023912, -0.445986, 2.482159, 1, 0, 0.9176471, 1,
1.030516, -1.499557, 3.38658, 1, 0, 0.9137255, 1,
1.039553, 0.3934368, 1.704932, 1, 0, 0.9058824, 1,
1.041558, -1.341232, 2.632428, 1, 0, 0.9019608, 1,
1.042823, 1.39608, 1.124681, 1, 0, 0.8941177, 1,
1.045317, -1.348152, 3.330526, 1, 0, 0.8862745, 1,
1.046214, 0.9373524, -0.8418436, 1, 0, 0.8823529, 1,
1.055233, -0.5537139, 1.186194, 1, 0, 0.8745098, 1,
1.058906, 0.5092156, 2.763599, 1, 0, 0.8705882, 1,
1.060844, -0.8514982, 2.935914, 1, 0, 0.8627451, 1,
1.061531, -0.8735918, 0.944764, 1, 0, 0.8588235, 1,
1.064633, 0.8993005, -0.001095127, 1, 0, 0.8509804, 1,
1.065354, -0.04456872, -0.991599, 1, 0, 0.8470588, 1,
1.069116, 1.978822, -1.465772, 1, 0, 0.8392157, 1,
1.075914, -1.866526, 3.263104, 1, 0, 0.8352941, 1,
1.077304, -0.5096371, 1.272813, 1, 0, 0.827451, 1,
1.079284, 0.3631304, 0.03224435, 1, 0, 0.8235294, 1,
1.08152, -2.350032, 3.805857, 1, 0, 0.8156863, 1,
1.093241, 0.6197903, 2.473741, 1, 0, 0.8117647, 1,
1.109195, -1.029466, 0.500609, 1, 0, 0.8039216, 1,
1.112796, -0.4669794, 1.632293, 1, 0, 0.7960784, 1,
1.1166, 0.6934999, -1.144833, 1, 0, 0.7921569, 1,
1.116954, 0.2719773, 0.722284, 1, 0, 0.7843137, 1,
1.117153, -1.05106, 2.776207, 1, 0, 0.7803922, 1,
1.119766, 1.718196, 1.483041, 1, 0, 0.772549, 1,
1.138428, -0.02141864, 2.436812, 1, 0, 0.7686275, 1,
1.142054, 1.058701, -0.5878556, 1, 0, 0.7607843, 1,
1.142823, 0.2305913, -0.2358696, 1, 0, 0.7568628, 1,
1.143427, 0.1166187, -0.500165, 1, 0, 0.7490196, 1,
1.146055, 1.259745, 1.036765, 1, 0, 0.7450981, 1,
1.146805, 0.8900159, -0.2193907, 1, 0, 0.7372549, 1,
1.147617, -0.7654666, 2.543975, 1, 0, 0.7333333, 1,
1.15267, -1.089857, 0.5920794, 1, 0, 0.7254902, 1,
1.159623, 0.5707878, 2.711909, 1, 0, 0.7215686, 1,
1.167391, -0.5937969, 0.6612241, 1, 0, 0.7137255, 1,
1.172716, -0.6639916, 2.67983, 1, 0, 0.7098039, 1,
1.174167, 1.296814, 0.429076, 1, 0, 0.7019608, 1,
1.174168, 1.169765, 1.602005, 1, 0, 0.6941177, 1,
1.190505, 0.3368877, 0.5880257, 1, 0, 0.6901961, 1,
1.190832, 0.9989385, 0.9524814, 1, 0, 0.682353, 1,
1.195346, 1.786488, 0.4139872, 1, 0, 0.6784314, 1,
1.197024, 0.3133115, 0.7496196, 1, 0, 0.6705883, 1,
1.205183, -0.2354932, 1.590755, 1, 0, 0.6666667, 1,
1.206583, -0.8093854, 0.994602, 1, 0, 0.6588235, 1,
1.211194, -1.020219, 2.726409, 1, 0, 0.654902, 1,
1.215721, -0.1425693, 2.078366, 1, 0, 0.6470588, 1,
1.219278, -0.1144428, 2.036518, 1, 0, 0.6431373, 1,
1.220034, -0.8429631, 2.591267, 1, 0, 0.6352941, 1,
1.223551, 0.03032154, 0.7390765, 1, 0, 0.6313726, 1,
1.2303, 1.570411, 0.1310261, 1, 0, 0.6235294, 1,
1.236616, 1.349957, 1.236192, 1, 0, 0.6196079, 1,
1.239816, -0.608456, 1.55195, 1, 0, 0.6117647, 1,
1.244616, -0.1480797, 2.846326, 1, 0, 0.6078432, 1,
1.261528, -0.1898224, 1.800236, 1, 0, 0.6, 1,
1.264996, 0.7275901, 2.363029, 1, 0, 0.5921569, 1,
1.274923, -1.000914, 2.893783, 1, 0, 0.5882353, 1,
1.293657, -0.08194998, 1.552442, 1, 0, 0.5803922, 1,
1.303575, -1.053179, 0.9296048, 1, 0, 0.5764706, 1,
1.314096, -0.2848552, 0.8647982, 1, 0, 0.5686275, 1,
1.319951, 0.8507859, 1.020746, 1, 0, 0.5647059, 1,
1.320844, 0.873018, 0.8919904, 1, 0, 0.5568628, 1,
1.327153, 0.5327798, 1.033466, 1, 0, 0.5529412, 1,
1.334008, 1.052566, 0.7971692, 1, 0, 0.5450981, 1,
1.335229, -0.1868174, 1.385468, 1, 0, 0.5411765, 1,
1.34505, 1.131395, 1.29306, 1, 0, 0.5333334, 1,
1.349095, -0.6480179, 1.946601, 1, 0, 0.5294118, 1,
1.351215, -0.5652287, 2.268092, 1, 0, 0.5215687, 1,
1.361881, -1.283018, 3.97773, 1, 0, 0.5176471, 1,
1.381733, 0.04930881, 2.382395, 1, 0, 0.509804, 1,
1.390015, 0.5756722, -0.4716315, 1, 0, 0.5058824, 1,
1.40547, 0.7723731, 0.3476747, 1, 0, 0.4980392, 1,
1.407994, 0.8293716, 2.547494, 1, 0, 0.4901961, 1,
1.413061, -0.896503, 1.490056, 1, 0, 0.4862745, 1,
1.415523, -0.4118931, 1.705316, 1, 0, 0.4784314, 1,
1.420962, 0.2592954, 1.764038, 1, 0, 0.4745098, 1,
1.441544, -0.7502888, 1.575713, 1, 0, 0.4666667, 1,
1.447486, 1.363397, 0.8189211, 1, 0, 0.4627451, 1,
1.451958, 0.9334554, 1.42358, 1, 0, 0.454902, 1,
1.459195, 0.7253394, 0.5618382, 1, 0, 0.4509804, 1,
1.464478, 0.4689227, 1.784039, 1, 0, 0.4431373, 1,
1.466885, -1.484961, 3.502947, 1, 0, 0.4392157, 1,
1.477734, -1.421405, 3.188516, 1, 0, 0.4313726, 1,
1.478187, -1.454453, 1.661976, 1, 0, 0.427451, 1,
1.489878, 0.568139, 3.138274, 1, 0, 0.4196078, 1,
1.492567, -0.8318005, 3.90172, 1, 0, 0.4156863, 1,
1.521899, 0.7190503, 0.6971695, 1, 0, 0.4078431, 1,
1.539788, -1.863422, 2.636175, 1, 0, 0.4039216, 1,
1.540594, -0.8761129, 2.569723, 1, 0, 0.3960784, 1,
1.590423, 1.198742, -0.6460996, 1, 0, 0.3882353, 1,
1.601724, 0.906208, -0.4560398, 1, 0, 0.3843137, 1,
1.605826, 1.524192, 0.8155778, 1, 0, 0.3764706, 1,
1.606525, 0.5130989, 1.265836, 1, 0, 0.372549, 1,
1.636698, 0.03241838, 1.118274, 1, 0, 0.3647059, 1,
1.637931, 0.4639767, 1.521703, 1, 0, 0.3607843, 1,
1.639919, -0.03108081, 2.162552, 1, 0, 0.3529412, 1,
1.648112, -0.5929628, 1.901206, 1, 0, 0.3490196, 1,
1.654976, -1.34049, 2.842208, 1, 0, 0.3411765, 1,
1.65671, -1.012924, 2.448601, 1, 0, 0.3372549, 1,
1.689671, -0.08133642, 0.7182249, 1, 0, 0.3294118, 1,
1.692139, -0.5171523, 0.5287004, 1, 0, 0.3254902, 1,
1.707915, -0.2611165, 1.073584, 1, 0, 0.3176471, 1,
1.711216, -0.2726054, 1.87692, 1, 0, 0.3137255, 1,
1.717849, -0.5192174, 2.044194, 1, 0, 0.3058824, 1,
1.73751, -0.07596335, 1.684405, 1, 0, 0.2980392, 1,
1.741597, 0.3321669, 2.841898, 1, 0, 0.2941177, 1,
1.747831, 1.331326, 0.3027965, 1, 0, 0.2862745, 1,
1.756433, 0.1801582, 1.24439, 1, 0, 0.282353, 1,
1.797893, 0.04860244, 1.347026, 1, 0, 0.2745098, 1,
1.819704, 1.369779, 1.107647, 1, 0, 0.2705882, 1,
1.826851, -0.7402603, 0.4582064, 1, 0, 0.2627451, 1,
1.829293, 0.7023848, 0.9434735, 1, 0, 0.2588235, 1,
1.854322, -0.8802912, 1.931151, 1, 0, 0.2509804, 1,
1.857585, 0.5161825, 2.278432, 1, 0, 0.2470588, 1,
1.865475, 0.6800201, 2.096356, 1, 0, 0.2392157, 1,
1.86736, 0.9521111, 1.825377, 1, 0, 0.2352941, 1,
1.885985, -0.6729994, 1.552345, 1, 0, 0.227451, 1,
1.902727, -0.2701235, 2.344306, 1, 0, 0.2235294, 1,
1.917049, 0.231041, 0.6427013, 1, 0, 0.2156863, 1,
1.924751, -0.1881572, 1.136523, 1, 0, 0.2117647, 1,
1.925531, -0.6415958, 2.44245, 1, 0, 0.2039216, 1,
1.931693, 0.5590011, 0.687364, 1, 0, 0.1960784, 1,
1.971975, 0.04467937, 1.843076, 1, 0, 0.1921569, 1,
1.982817, -0.5953625, 2.234742, 1, 0, 0.1843137, 1,
1.992148, 0.1157829, 1.080616, 1, 0, 0.1803922, 1,
1.995744, 0.3628394, 2.975542, 1, 0, 0.172549, 1,
2.016641, -1.014668, 1.66724, 1, 0, 0.1686275, 1,
2.017426, 0.2901811, -0.3862106, 1, 0, 0.1607843, 1,
2.028809, 2.028442, 1.283774, 1, 0, 0.1568628, 1,
2.046201, 0.3784884, 2.234692, 1, 0, 0.1490196, 1,
2.053571, 0.5482142, 0.09840664, 1, 0, 0.145098, 1,
2.06998, 1.022657, 0.4229842, 1, 0, 0.1372549, 1,
2.079234, -0.1886982, 3.067175, 1, 0, 0.1333333, 1,
2.101932, 0.5980492, 0.4187628, 1, 0, 0.1254902, 1,
2.111784, 0.6592465, 0.3243549, 1, 0, 0.1215686, 1,
2.124548, 0.3483363, 2.449951, 1, 0, 0.1137255, 1,
2.129261, 0.5903811, -0.1435957, 1, 0, 0.1098039, 1,
2.158194, 0.4822037, 0.6440483, 1, 0, 0.1019608, 1,
2.175888, 0.3172081, 2.436129, 1, 0, 0.09411765, 1,
2.179804, 0.1244216, 2.280992, 1, 0, 0.09019608, 1,
2.184508, -2.808799, 1.552855, 1, 0, 0.08235294, 1,
2.230465, -0.687056, 0.9813444, 1, 0, 0.07843138, 1,
2.236246, 0.1737544, 1.494505, 1, 0, 0.07058824, 1,
2.249909, 0.8188401, 0.8751955, 1, 0, 0.06666667, 1,
2.268171, 0.398419, 1.495396, 1, 0, 0.05882353, 1,
2.283077, -0.6805527, 2.901819, 1, 0, 0.05490196, 1,
2.413963, -0.1931431, 1.35431, 1, 0, 0.04705882, 1,
2.439542, 0.8141615, 3.091051, 1, 0, 0.04313726, 1,
2.459487, -0.1236935, 0.2989471, 1, 0, 0.03529412, 1,
2.609263, -1.207323, 0.9652796, 1, 0, 0.03137255, 1,
2.619293, 0.4083373, 2.086474, 1, 0, 0.02352941, 1,
2.706669, -0.5033038, 1.670583, 1, 0, 0.01960784, 1,
2.71014, 0.1810863, 0.7033595, 1, 0, 0.01176471, 1,
3.159363, -0.6640319, 1.898435, 1, 0, 0.007843138, 1
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
0.1453611, -4.506651, -7.777987, 0, -0.5, 0.5, 0.5,
0.1453611, -4.506651, -7.777987, 1, -0.5, 0.5, 0.5,
0.1453611, -4.506651, -7.777987, 1, 1.5, 0.5, 0.5,
0.1453611, -4.506651, -7.777987, 0, 1.5, 0.5, 0.5
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
-3.890387, -0.04366374, -7.777987, 0, -0.5, 0.5, 0.5,
-3.890387, -0.04366374, -7.777987, 1, -0.5, 0.5, 0.5,
-3.890387, -0.04366374, -7.777987, 1, 1.5, 0.5, 0.5,
-3.890387, -0.04366374, -7.777987, 0, 1.5, 0.5, 0.5
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
-3.890387, -4.506651, -0.2467928, 0, -0.5, 0.5, 0.5,
-3.890387, -4.506651, -0.2467928, 1, -0.5, 0.5, 0.5,
-3.890387, -4.506651, -0.2467928, 1, 1.5, 0.5, 0.5,
-3.890387, -4.506651, -0.2467928, 0, 1.5, 0.5, 0.5
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
-2, -3.476731, -6.040019,
3, -3.476731, -6.040019,
-2, -3.476731, -6.040019,
-2, -3.648384, -6.32968,
-1, -3.476731, -6.040019,
-1, -3.648384, -6.32968,
0, -3.476731, -6.040019,
0, -3.648384, -6.32968,
1, -3.476731, -6.040019,
1, -3.648384, -6.32968,
2, -3.476731, -6.040019,
2, -3.648384, -6.32968,
3, -3.476731, -6.040019,
3, -3.648384, -6.32968
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
-2, -3.991691, -6.909003, 0, -0.5, 0.5, 0.5,
-2, -3.991691, -6.909003, 1, -0.5, 0.5, 0.5,
-2, -3.991691, -6.909003, 1, 1.5, 0.5, 0.5,
-2, -3.991691, -6.909003, 0, 1.5, 0.5, 0.5,
-1, -3.991691, -6.909003, 0, -0.5, 0.5, 0.5,
-1, -3.991691, -6.909003, 1, -0.5, 0.5, 0.5,
-1, -3.991691, -6.909003, 1, 1.5, 0.5, 0.5,
-1, -3.991691, -6.909003, 0, 1.5, 0.5, 0.5,
0, -3.991691, -6.909003, 0, -0.5, 0.5, 0.5,
0, -3.991691, -6.909003, 1, -0.5, 0.5, 0.5,
0, -3.991691, -6.909003, 1, 1.5, 0.5, 0.5,
0, -3.991691, -6.909003, 0, 1.5, 0.5, 0.5,
1, -3.991691, -6.909003, 0, -0.5, 0.5, 0.5,
1, -3.991691, -6.909003, 1, -0.5, 0.5, 0.5,
1, -3.991691, -6.909003, 1, 1.5, 0.5, 0.5,
1, -3.991691, -6.909003, 0, 1.5, 0.5, 0.5,
2, -3.991691, -6.909003, 0, -0.5, 0.5, 0.5,
2, -3.991691, -6.909003, 1, -0.5, 0.5, 0.5,
2, -3.991691, -6.909003, 1, 1.5, 0.5, 0.5,
2, -3.991691, -6.909003, 0, 1.5, 0.5, 0.5,
3, -3.991691, -6.909003, 0, -0.5, 0.5, 0.5,
3, -3.991691, -6.909003, 1, -0.5, 0.5, 0.5,
3, -3.991691, -6.909003, 1, 1.5, 0.5, 0.5,
3, -3.991691, -6.909003, 0, 1.5, 0.5, 0.5
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
-2.95906, -3, -6.040019,
-2.95906, 3, -6.040019,
-2.95906, -3, -6.040019,
-3.114282, -3, -6.32968,
-2.95906, -2, -6.040019,
-3.114282, -2, -6.32968,
-2.95906, -1, -6.040019,
-3.114282, -1, -6.32968,
-2.95906, 0, -6.040019,
-3.114282, 0, -6.32968,
-2.95906, 1, -6.040019,
-3.114282, 1, -6.32968,
-2.95906, 2, -6.040019,
-3.114282, 2, -6.32968,
-2.95906, 3, -6.040019,
-3.114282, 3, -6.32968
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
-3.424724, -3, -6.909003, 0, -0.5, 0.5, 0.5,
-3.424724, -3, -6.909003, 1, -0.5, 0.5, 0.5,
-3.424724, -3, -6.909003, 1, 1.5, 0.5, 0.5,
-3.424724, -3, -6.909003, 0, 1.5, 0.5, 0.5,
-3.424724, -2, -6.909003, 0, -0.5, 0.5, 0.5,
-3.424724, -2, -6.909003, 1, -0.5, 0.5, 0.5,
-3.424724, -2, -6.909003, 1, 1.5, 0.5, 0.5,
-3.424724, -2, -6.909003, 0, 1.5, 0.5, 0.5,
-3.424724, -1, -6.909003, 0, -0.5, 0.5, 0.5,
-3.424724, -1, -6.909003, 1, -0.5, 0.5, 0.5,
-3.424724, -1, -6.909003, 1, 1.5, 0.5, 0.5,
-3.424724, -1, -6.909003, 0, 1.5, 0.5, 0.5,
-3.424724, 0, -6.909003, 0, -0.5, 0.5, 0.5,
-3.424724, 0, -6.909003, 1, -0.5, 0.5, 0.5,
-3.424724, 0, -6.909003, 1, 1.5, 0.5, 0.5,
-3.424724, 0, -6.909003, 0, 1.5, 0.5, 0.5,
-3.424724, 1, -6.909003, 0, -0.5, 0.5, 0.5,
-3.424724, 1, -6.909003, 1, -0.5, 0.5, 0.5,
-3.424724, 1, -6.909003, 1, 1.5, 0.5, 0.5,
-3.424724, 1, -6.909003, 0, 1.5, 0.5, 0.5,
-3.424724, 2, -6.909003, 0, -0.5, 0.5, 0.5,
-3.424724, 2, -6.909003, 1, -0.5, 0.5, 0.5,
-3.424724, 2, -6.909003, 1, 1.5, 0.5, 0.5,
-3.424724, 2, -6.909003, 0, 1.5, 0.5, 0.5,
-3.424724, 3, -6.909003, 0, -0.5, 0.5, 0.5,
-3.424724, 3, -6.909003, 1, -0.5, 0.5, 0.5,
-3.424724, 3, -6.909003, 1, 1.5, 0.5, 0.5,
-3.424724, 3, -6.909003, 0, 1.5, 0.5, 0.5
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
-2.95906, -3.476731, -4,
-2.95906, -3.476731, 4,
-2.95906, -3.476731, -4,
-3.114282, -3.648384, -4,
-2.95906, -3.476731, -2,
-3.114282, -3.648384, -2,
-2.95906, -3.476731, 0,
-3.114282, -3.648384, 0,
-2.95906, -3.476731, 2,
-3.114282, -3.648384, 2,
-2.95906, -3.476731, 4,
-3.114282, -3.648384, 4
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
-3.424724, -3.991691, -4, 0, -0.5, 0.5, 0.5,
-3.424724, -3.991691, -4, 1, -0.5, 0.5, 0.5,
-3.424724, -3.991691, -4, 1, 1.5, 0.5, 0.5,
-3.424724, -3.991691, -4, 0, 1.5, 0.5, 0.5,
-3.424724, -3.991691, -2, 0, -0.5, 0.5, 0.5,
-3.424724, -3.991691, -2, 1, -0.5, 0.5, 0.5,
-3.424724, -3.991691, -2, 1, 1.5, 0.5, 0.5,
-3.424724, -3.991691, -2, 0, 1.5, 0.5, 0.5,
-3.424724, -3.991691, 0, 0, -0.5, 0.5, 0.5,
-3.424724, -3.991691, 0, 1, -0.5, 0.5, 0.5,
-3.424724, -3.991691, 0, 1, 1.5, 0.5, 0.5,
-3.424724, -3.991691, 0, 0, 1.5, 0.5, 0.5,
-3.424724, -3.991691, 2, 0, -0.5, 0.5, 0.5,
-3.424724, -3.991691, 2, 1, -0.5, 0.5, 0.5,
-3.424724, -3.991691, 2, 1, 1.5, 0.5, 0.5,
-3.424724, -3.991691, 2, 0, 1.5, 0.5, 0.5,
-3.424724, -3.991691, 4, 0, -0.5, 0.5, 0.5,
-3.424724, -3.991691, 4, 1, -0.5, 0.5, 0.5,
-3.424724, -3.991691, 4, 1, 1.5, 0.5, 0.5,
-3.424724, -3.991691, 4, 0, 1.5, 0.5, 0.5
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
-2.95906, -3.476731, -6.040019,
-2.95906, 3.389403, -6.040019,
-2.95906, -3.476731, 5.546433,
-2.95906, 3.389403, 5.546433,
-2.95906, -3.476731, -6.040019,
-2.95906, -3.476731, 5.546433,
-2.95906, 3.389403, -6.040019,
-2.95906, 3.389403, 5.546433,
-2.95906, -3.476731, -6.040019,
3.249783, -3.476731, -6.040019,
-2.95906, -3.476731, 5.546433,
3.249783, -3.476731, 5.546433,
-2.95906, 3.389403, -6.040019,
3.249783, 3.389403, -6.040019,
-2.95906, 3.389403, 5.546433,
3.249783, 3.389403, 5.546433,
3.249783, -3.476731, -6.040019,
3.249783, 3.389403, -6.040019,
3.249783, -3.476731, 5.546433,
3.249783, 3.389403, 5.546433,
3.249783, -3.476731, -6.040019,
3.249783, -3.476731, 5.546433,
3.249783, 3.389403, -6.040019,
3.249783, 3.389403, 5.546433
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
var radius = 7.919121;
var distance = 35.23307;
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
mvMatrix.translate( -0.1453611, 0.04366374, 0.2467928 );
mvMatrix.scale( 1.379051, 1.247035, 0.7389932 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.23307);
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
Thiophanate<-read.table("Thiophanate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Thiophanate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Thiophanate' not found
```

```r
y<-Thiophanate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Thiophanate' not found
```

```r
z<-Thiophanate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Thiophanate' not found
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
-2.86864, 0.3085144, -1.144598, 0, 0, 1, 1, 1,
-2.759572, 1.427694, 0.4213808, 1, 0, 0, 1, 1,
-2.707056, -0.01853273, -1.988676, 1, 0, 0, 1, 1,
-2.705512, -1.341259, -2.017328, 1, 0, 0, 1, 1,
-2.621511, -0.1991768, -1.403143, 1, 0, 0, 1, 1,
-2.530587, -1.057365, -2.235979, 1, 0, 0, 1, 1,
-2.443955, -1.085029, -0.1695169, 0, 0, 0, 1, 1,
-2.436459, 0.6233343, -1.600728, 0, 0, 0, 1, 1,
-2.36412, 0.5604411, -3.830059, 0, 0, 0, 1, 1,
-2.31313, 0.0578302, -0.0951893, 0, 0, 0, 1, 1,
-2.303775, 0.8281916, -0.04867283, 0, 0, 0, 1, 1,
-2.283752, 1.774966, -2.171963, 0, 0, 0, 1, 1,
-2.218158, -1.407799, -2.602178, 0, 0, 0, 1, 1,
-2.193287, 0.4614475, -1.059817, 1, 1, 1, 1, 1,
-2.1619, -0.4846748, -2.949381, 1, 1, 1, 1, 1,
-2.126609, 0.2029933, -1.461201, 1, 1, 1, 1, 1,
-2.078011, -0.3716718, -2.038594, 1, 1, 1, 1, 1,
-2.070362, -0.0319479, -0.6239305, 1, 1, 1, 1, 1,
-2.049131, 1.244254, -1.365721, 1, 1, 1, 1, 1,
-2.03038, -0.02540938, -0.6279408, 1, 1, 1, 1, 1,
-2.023478, -1.20214, -1.829505, 1, 1, 1, 1, 1,
-2.020082, 2.154993, -1.881503, 1, 1, 1, 1, 1,
-2.018905, 0.6273257, -2.610273, 1, 1, 1, 1, 1,
-2.008248, -0.5131047, -0.7579446, 1, 1, 1, 1, 1,
-2.007625, -0.5266312, -0.199033, 1, 1, 1, 1, 1,
-2.006241, 0.2342515, -2.761999, 1, 1, 1, 1, 1,
-2.004949, -0.0797864, -0.593065, 1, 1, 1, 1, 1,
-1.992745, 1.092863, -0.4108367, 1, 1, 1, 1, 1,
-1.974151, -0.4071572, -2.907976, 0, 0, 1, 1, 1,
-1.965996, 2.411636, -0.2056463, 1, 0, 0, 1, 1,
-1.927632, 0.9727131, -2.0476, 1, 0, 0, 1, 1,
-1.911955, 3.289411, 0.867291, 1, 0, 0, 1, 1,
-1.898859, 0.07354417, -1.790533, 1, 0, 0, 1, 1,
-1.877463, -1.070555, -1.264396, 1, 0, 0, 1, 1,
-1.83186, 1.064564, -2.111281, 0, 0, 0, 1, 1,
-1.812884, 0.06640934, -0.2524101, 0, 0, 0, 1, 1,
-1.801849, -1.709606, -1.915689, 0, 0, 0, 1, 1,
-1.777692, -0.881513, -2.333461, 0, 0, 0, 1, 1,
-1.76682, -1.464877, 0.4676215, 0, 0, 0, 1, 1,
-1.758855, -1.411655, -0.7061552, 0, 0, 0, 1, 1,
-1.740933, -0.9643527, -2.713276, 0, 0, 0, 1, 1,
-1.727065, -1.918681, -1.508829, 1, 1, 1, 1, 1,
-1.694538, 0.6711335, -0.5836266, 1, 1, 1, 1, 1,
-1.683609, 0.8319311, -1.762581, 1, 1, 1, 1, 1,
-1.66319, 1.238145, -0.6762238, 1, 1, 1, 1, 1,
-1.658044, -0.9135786, -1.795092, 1, 1, 1, 1, 1,
-1.647891, -3.376739, -3.523141, 1, 1, 1, 1, 1,
-1.642298, 0.7492753, -2.893957, 1, 1, 1, 1, 1,
-1.624752, 2.556328, -0.4857075, 1, 1, 1, 1, 1,
-1.621471, 0.7805317, -1.359794, 1, 1, 1, 1, 1,
-1.61491, -0.133472, -1.043517, 1, 1, 1, 1, 1,
-1.61435, 0.5563547, -0.08594647, 1, 1, 1, 1, 1,
-1.595223, 0.3326282, -1.917748, 1, 1, 1, 1, 1,
-1.587872, 0.2659244, -1.099228, 1, 1, 1, 1, 1,
-1.583944, 0.6639807, -0.6025658, 1, 1, 1, 1, 1,
-1.580252, -0.4596645, -2.303758, 1, 1, 1, 1, 1,
-1.55913, -2.111046, -3.617004, 0, 0, 1, 1, 1,
-1.553074, -0.8918114, -1.663426, 1, 0, 0, 1, 1,
-1.546664, 1.560259, -0.1157285, 1, 0, 0, 1, 1,
-1.54461, 0.4854757, 0.5154148, 1, 0, 0, 1, 1,
-1.543717, 0.007376074, -2.831084, 1, 0, 0, 1, 1,
-1.54324, -0.03304617, -1.454914, 1, 0, 0, 1, 1,
-1.526865, -3.226922, -2.364517, 0, 0, 0, 1, 1,
-1.524404, 1.377565, -0.940999, 0, 0, 0, 1, 1,
-1.493465, 0.3888296, -0.9188138, 0, 0, 0, 1, 1,
-1.482184, -1.877445, -1.424881, 0, 0, 0, 1, 1,
-1.475704, -0.1638782, -3.018071, 0, 0, 0, 1, 1,
-1.469632, 0.9298036, 0.03455042, 0, 0, 0, 1, 1,
-1.463932, 0.9874554, -1.364324, 0, 0, 0, 1, 1,
-1.455616, -0.6344724, -0.8858658, 1, 1, 1, 1, 1,
-1.437807, 0.9615824, 0.03343844, 1, 1, 1, 1, 1,
-1.422435, -1.488768, -1.845997, 1, 1, 1, 1, 1,
-1.412082, 0.9118916, -0.6475381, 1, 1, 1, 1, 1,
-1.410652, -0.2753559, -2.310273, 1, 1, 1, 1, 1,
-1.404549, -0.07685664, -1.721981, 1, 1, 1, 1, 1,
-1.393505, 0.9239481, -0.4176081, 1, 1, 1, 1, 1,
-1.389652, -1.877501, -2.818877, 1, 1, 1, 1, 1,
-1.386241, 0.03744756, -3.71366, 1, 1, 1, 1, 1,
-1.384436, -0.9661509, -3.028365, 1, 1, 1, 1, 1,
-1.383325, 0.5105443, -1.518684, 1, 1, 1, 1, 1,
-1.365603, 1.665806, -0.7669646, 1, 1, 1, 1, 1,
-1.365563, -0.2206614, -0.4163603, 1, 1, 1, 1, 1,
-1.362071, 2.682141, -0.06498101, 1, 1, 1, 1, 1,
-1.35785, -0.6911119, -0.2841086, 1, 1, 1, 1, 1,
-1.349087, 0.05607332, -2.141686, 0, 0, 1, 1, 1,
-1.348623, 1.044166, 0.3693608, 1, 0, 0, 1, 1,
-1.345759, 1.134122, -0.9675585, 1, 0, 0, 1, 1,
-1.344995, 0.3303698, -1.664642, 1, 0, 0, 1, 1,
-1.329206, 0.1144641, -4.012757, 1, 0, 0, 1, 1,
-1.323404, -1.451012, -1.301494, 1, 0, 0, 1, 1,
-1.320185, 0.770499, -0.7464595, 0, 0, 0, 1, 1,
-1.319882, -1.970939, -2.097095, 0, 0, 0, 1, 1,
-1.312809, 0.8150966, -1.90167, 0, 0, 0, 1, 1,
-1.305608, 0.2500386, -1.089033, 0, 0, 0, 1, 1,
-1.298869, 0.3115769, -0.7041176, 0, 0, 0, 1, 1,
-1.296818, -0.1801327, 0.3073313, 0, 0, 0, 1, 1,
-1.285519, 0.8461264, -0.8840541, 0, 0, 0, 1, 1,
-1.276588, -1.238159, -3.549811, 1, 1, 1, 1, 1,
-1.26772, 2.554134, -2.511832, 1, 1, 1, 1, 1,
-1.261611, 0.02512632, -3.212869, 1, 1, 1, 1, 1,
-1.249491, -1.241689, -1.174765, 1, 1, 1, 1, 1,
-1.24837, -1.754402, -2.864783, 1, 1, 1, 1, 1,
-1.237299, -0.4339487, -1.786351, 1, 1, 1, 1, 1,
-1.235334, 0.4839623, 0.04257811, 1, 1, 1, 1, 1,
-1.227589, 0.9440638, -2.382118, 1, 1, 1, 1, 1,
-1.222116, 1.057292, -1.30799, 1, 1, 1, 1, 1,
-1.218252, 0.7584069, -0.5307971, 1, 1, 1, 1, 1,
-1.216828, 0.0166535, -1.68152, 1, 1, 1, 1, 1,
-1.215272, -0.2819404, -3.499859, 1, 1, 1, 1, 1,
-1.204514, 0.424362, 0.1373138, 1, 1, 1, 1, 1,
-1.199174, -0.7929264, -2.278329, 1, 1, 1, 1, 1,
-1.198154, -0.8059018, -1.372809, 1, 1, 1, 1, 1,
-1.196226, -0.9630026, -2.282607, 0, 0, 1, 1, 1,
-1.193995, 0.484978, -0.3009646, 1, 0, 0, 1, 1,
-1.183156, 0.4889822, -0.707719, 1, 0, 0, 1, 1,
-1.181934, 0.4234725, -2.034259, 1, 0, 0, 1, 1,
-1.173943, 0.2049027, -3.176205, 1, 0, 0, 1, 1,
-1.173792, -1.241758, -1.477171, 1, 0, 0, 1, 1,
-1.169884, 1.708192, 0.7909494, 0, 0, 0, 1, 1,
-1.156945, -0.7819881, -1.596742, 0, 0, 0, 1, 1,
-1.155365, 0.4721994, -0.4384163, 0, 0, 0, 1, 1,
-1.144548, 0.08731554, -0.2376868, 0, 0, 0, 1, 1,
-1.14443, -0.4244359, -0.2895482, 0, 0, 0, 1, 1,
-1.144278, 1.249171, -1.964228, 0, 0, 0, 1, 1,
-1.143162, 0.1933313, -1.161272, 0, 0, 0, 1, 1,
-1.139194, -1.717467, -3.002298, 1, 1, 1, 1, 1,
-1.135589, 0.78979, -1.491154, 1, 1, 1, 1, 1,
-1.132999, -2.077402, -1.594484, 1, 1, 1, 1, 1,
-1.132738, 1.204993, -1.911597, 1, 1, 1, 1, 1,
-1.131253, 0.2547928, -0.8300269, 1, 1, 1, 1, 1,
-1.125787, 0.4334726, -0.1642203, 1, 1, 1, 1, 1,
-1.115689, 1.793983, 0.4348926, 1, 1, 1, 1, 1,
-1.112119, -1.625085, -2.516157, 1, 1, 1, 1, 1,
-1.111308, 0.1458053, -0.9010643, 1, 1, 1, 1, 1,
-1.096669, -0.376348, -2.697272, 1, 1, 1, 1, 1,
-1.096082, 0.8448552, 0.6562495, 1, 1, 1, 1, 1,
-1.091218, 1.45488, 0.2702761, 1, 1, 1, 1, 1,
-1.083942, 0.8262823, -0.8654699, 1, 1, 1, 1, 1,
-1.061864, -0.8143468, -3.443179, 1, 1, 1, 1, 1,
-1.057364, 0.6124249, -0.6297917, 1, 1, 1, 1, 1,
-1.056139, 0.829304, -3.343311, 0, 0, 1, 1, 1,
-1.056118, 0.1801259, -0.4540204, 1, 0, 0, 1, 1,
-1.040903, 0.3368891, -1.159634, 1, 0, 0, 1, 1,
-1.040755, -1.417799, -2.453613, 1, 0, 0, 1, 1,
-1.039666, -0.1480424, -3.484753, 1, 0, 0, 1, 1,
-1.033499, -1.652347, -3.075267, 1, 0, 0, 1, 1,
-1.02879, 0.7351506, -0.9275353, 0, 0, 0, 1, 1,
-1.026891, -1.910711, -1.419994, 0, 0, 0, 1, 1,
-1.021807, -0.04462784, -2.093631, 0, 0, 0, 1, 1,
-1.019017, -0.9894691, -2.787791, 0, 0, 0, 1, 1,
-1.01255, 1.070376, -0.7472762, 0, 0, 0, 1, 1,
-1.009799, 0.2049425, -0.5573407, 0, 0, 0, 1, 1,
-1.006182, -1.511955, -4.136646, 0, 0, 0, 1, 1,
-0.9965772, -1.13735, -3.514123, 1, 1, 1, 1, 1,
-0.9956107, 0.8144328, -0.2267583, 1, 1, 1, 1, 1,
-0.9907377, 0.1007293, -1.677014, 1, 1, 1, 1, 1,
-0.9869516, 0.007688905, -2.161536, 1, 1, 1, 1, 1,
-0.9833354, -0.2723581, -3.401285, 1, 1, 1, 1, 1,
-0.9771703, 0.4750827, 0.2113616, 1, 1, 1, 1, 1,
-0.9746128, 0.1198239, -2.384559, 1, 1, 1, 1, 1,
-0.9707081, 1.14754, -0.2651756, 1, 1, 1, 1, 1,
-0.9705698, -1.536652, -1.132936, 1, 1, 1, 1, 1,
-0.9678385, 0.9662197, -1.80687, 1, 1, 1, 1, 1,
-0.9660251, -0.07693689, -0.8106143, 1, 1, 1, 1, 1,
-0.9650827, 0.885245, 0.1368309, 1, 1, 1, 1, 1,
-0.9648714, 1.747806, -2.302436, 1, 1, 1, 1, 1,
-0.9627097, 1.15193, 1.429728, 1, 1, 1, 1, 1,
-0.9610801, 0.05003221, -1.868721, 1, 1, 1, 1, 1,
-0.9580883, 0.03366717, -2.676866, 0, 0, 1, 1, 1,
-0.957002, 2.979334, 0.3334277, 1, 0, 0, 1, 1,
-0.9537594, 0.7378788, -2.092825, 1, 0, 0, 1, 1,
-0.947668, -0.5527729, -2.83654, 1, 0, 0, 1, 1,
-0.9341347, 0.2240414, -2.79411, 1, 0, 0, 1, 1,
-0.9290835, -0.318764, -2.837612, 1, 0, 0, 1, 1,
-0.9242703, 1.019983, 0.01887047, 0, 0, 0, 1, 1,
-0.9234769, -1.115418, -2.054532, 0, 0, 0, 1, 1,
-0.9218414, -0.548695, -1.489456, 0, 0, 0, 1, 1,
-0.9194627, -0.530547, -1.996092, 0, 0, 0, 1, 1,
-0.9096899, 0.4618912, -0.3688633, 0, 0, 0, 1, 1,
-0.8958573, 3.08612, 0.2051759, 0, 0, 0, 1, 1,
-0.895215, 0.6312008, -1.183604, 0, 0, 0, 1, 1,
-0.8923144, 0.4466024, -1.463622, 1, 1, 1, 1, 1,
-0.8913909, -1.39661, -2.743125, 1, 1, 1, 1, 1,
-0.8898712, 0.1457085, -0.5185243, 1, 1, 1, 1, 1,
-0.889184, -0.5397549, -3.357121, 1, 1, 1, 1, 1,
-0.8866941, -0.304658, -0.992039, 1, 1, 1, 1, 1,
-0.8856487, 0.989944, -1.781872, 1, 1, 1, 1, 1,
-0.8795528, -0.03550159, 0.2202393, 1, 1, 1, 1, 1,
-0.8745958, -0.02657622, -1.78371, 1, 1, 1, 1, 1,
-0.8724275, 0.8288155, 1.827491, 1, 1, 1, 1, 1,
-0.8721701, 1.838375, -0.6000673, 1, 1, 1, 1, 1,
-0.8661594, 1.120219, 0.6070367, 1, 1, 1, 1, 1,
-0.8642442, 1.005717, -1.438888, 1, 1, 1, 1, 1,
-0.8637114, -0.4347288, -1.518853, 1, 1, 1, 1, 1,
-0.8628368, 0.08688845, -1.266279, 1, 1, 1, 1, 1,
-0.8621426, -0.8525141, -2.448928, 1, 1, 1, 1, 1,
-0.857292, -0.9048225, -2.804968, 0, 0, 1, 1, 1,
-0.8564556, -0.419653, -2.35866, 1, 0, 0, 1, 1,
-0.8544523, 0.02104149, -2.184597, 1, 0, 0, 1, 1,
-0.8531936, -1.782602, -3.836535, 1, 0, 0, 1, 1,
-0.8519765, 0.5379276, -0.1844099, 1, 0, 0, 1, 1,
-0.8300439, -0.4990117, -1.479329, 1, 0, 0, 1, 1,
-0.827828, -1.214571, -2.598908, 0, 0, 0, 1, 1,
-0.8267826, 0.4777675, 0.02016257, 0, 0, 0, 1, 1,
-0.8165787, -0.4299115, -2.313012, 0, 0, 0, 1, 1,
-0.8148472, 0.4772181, -0.9404759, 0, 0, 0, 1, 1,
-0.8115109, 0.04433966, -1.161244, 0, 0, 0, 1, 1,
-0.8076113, -0.9905416, -2.031553, 0, 0, 0, 1, 1,
-0.7974504, -0.1766177, -1.726801, 0, 0, 0, 1, 1,
-0.7959314, 0.6757088, -2.490843, 1, 1, 1, 1, 1,
-0.7951668, -0.07156717, -2.046692, 1, 1, 1, 1, 1,
-0.7929432, -1.195554, -4.416359, 1, 1, 1, 1, 1,
-0.7905417, -0.7749249, -0.462658, 1, 1, 1, 1, 1,
-0.785492, -0.08305853, -2.518096, 1, 1, 1, 1, 1,
-0.7823539, 0.7567631, -1.687952, 1, 1, 1, 1, 1,
-0.7758256, -0.3224275, -0.6095247, 1, 1, 1, 1, 1,
-0.7730858, -0.771327, -2.86657, 1, 1, 1, 1, 1,
-0.7712148, 0.7228808, -0.1776388, 1, 1, 1, 1, 1,
-0.7706639, -0.6628368, -4.94769, 1, 1, 1, 1, 1,
-0.7690023, 0.1513893, -2.872401, 1, 1, 1, 1, 1,
-0.7640938, 0.2001505, -1.387036, 1, 1, 1, 1, 1,
-0.7606183, -0.8908724, -2.148162, 1, 1, 1, 1, 1,
-0.7600747, -0.3742606, -1.170873, 1, 1, 1, 1, 1,
-0.7593907, 0.6217456, -0.9795011, 1, 1, 1, 1, 1,
-0.7583074, 0.211479, -0.1653404, 0, 0, 1, 1, 1,
-0.7579639, -2.166727, -4.045556, 1, 0, 0, 1, 1,
-0.7575833, 0.874341, 0.04213985, 1, 0, 0, 1, 1,
-0.7569494, 0.07052099, -2.507935, 1, 0, 0, 1, 1,
-0.7567548, -0.1263306, -1.305636, 1, 0, 0, 1, 1,
-0.7547485, -1.159526, -2.717477, 1, 0, 0, 1, 1,
-0.7418919, -1.184203, -3.17387, 0, 0, 0, 1, 1,
-0.7417827, 0.07867995, -3.982798, 0, 0, 0, 1, 1,
-0.7325383, 0.3477248, -0.05997357, 0, 0, 0, 1, 1,
-0.7292932, 0.2010355, -2.035529, 0, 0, 0, 1, 1,
-0.7289173, -0.5321459, -2.163911, 0, 0, 0, 1, 1,
-0.7275285, -1.833225, -0.539327, 0, 0, 0, 1, 1,
-0.7241283, -0.2896894, -3.586718, 0, 0, 0, 1, 1,
-0.7211596, 0.20441, -1.34438, 1, 1, 1, 1, 1,
-0.7144094, -0.6964461, -0.7064483, 1, 1, 1, 1, 1,
-0.7059244, -0.04768283, -1.613834, 1, 1, 1, 1, 1,
-0.7055036, 0.9763791, -1.457521, 1, 1, 1, 1, 1,
-0.7045491, -0.3851459, -3.662341, 1, 1, 1, 1, 1,
-0.7026095, -0.1072371, -0.2417765, 1, 1, 1, 1, 1,
-0.6996979, 0.7583837, -0.09947155, 1, 1, 1, 1, 1,
-0.6994525, -0.8378431, -1.721805, 1, 1, 1, 1, 1,
-0.6976776, 1.335385, 1.670556, 1, 1, 1, 1, 1,
-0.6959784, -0.1828195, -0.869689, 1, 1, 1, 1, 1,
-0.6958284, 0.2275083, 0.589976, 1, 1, 1, 1, 1,
-0.6919294, 0.5025495, -0.5811163, 1, 1, 1, 1, 1,
-0.6710985, -0.3757615, -3.727893, 1, 1, 1, 1, 1,
-0.6706939, -1.266647, -3.633009, 1, 1, 1, 1, 1,
-0.668631, 1.65706, 1.166019, 1, 1, 1, 1, 1,
-0.6676739, -0.7338542, -3.272971, 0, 0, 1, 1, 1,
-0.6626968, -2.37439, -2.778296, 1, 0, 0, 1, 1,
-0.658938, 0.4764546, -2.305257, 1, 0, 0, 1, 1,
-0.6511528, -0.9682876, -1.291744, 1, 0, 0, 1, 1,
-0.650997, 0.1235518, -2.395616, 1, 0, 0, 1, 1,
-0.6500145, 2.055977, 2.141721, 1, 0, 0, 1, 1,
-0.6388494, -1.501783, -4.177074, 0, 0, 0, 1, 1,
-0.6317378, -1.014371, -1.556508, 0, 0, 0, 1, 1,
-0.6246216, 0.2807774, -2.906921, 0, 0, 0, 1, 1,
-0.6230945, -0.5671455, -2.92206, 0, 0, 0, 1, 1,
-0.6162138, 1.846506, -1.405348, 0, 0, 0, 1, 1,
-0.6158201, 1.542257, 0.2794098, 0, 0, 0, 1, 1,
-0.6155269, -0.6641279, -2.234989, 0, 0, 0, 1, 1,
-0.6109797, -1.187428, -1.197518, 1, 1, 1, 1, 1,
-0.6037909, 0.556654, 0.3905064, 1, 1, 1, 1, 1,
-0.6008387, -0.04661832, -1.332575, 1, 1, 1, 1, 1,
-0.6002374, 0.2161073, -1.361788, 1, 1, 1, 1, 1,
-0.5980952, -0.629908, -1.595814, 1, 1, 1, 1, 1,
-0.5973072, 0.296129, -1.484967, 1, 1, 1, 1, 1,
-0.5954352, -0.5544676, -2.696295, 1, 1, 1, 1, 1,
-0.5946761, 0.8367004, 0.4250309, 1, 1, 1, 1, 1,
-0.592814, -1.10332, -2.23128, 1, 1, 1, 1, 1,
-0.5915102, -1.680069, -2.349253, 1, 1, 1, 1, 1,
-0.5869414, 2.939618, 0.1717581, 1, 1, 1, 1, 1,
-0.58406, -1.401565, -3.154033, 1, 1, 1, 1, 1,
-0.5792458, 1.489127, -1.068062, 1, 1, 1, 1, 1,
-0.5776193, -0.1931931, -1.640002, 1, 1, 1, 1, 1,
-0.5774374, -0.9417315, -2.47683, 1, 1, 1, 1, 1,
-0.5722667, -0.9413828, -2.894667, 0, 0, 1, 1, 1,
-0.5690981, 0.8436441, -0.6311824, 1, 0, 0, 1, 1,
-0.5676671, 0.738013, -0.3178218, 1, 0, 0, 1, 1,
-0.5676402, -0.5640967, -2.238343, 1, 0, 0, 1, 1,
-0.5676137, 0.1290869, -2.916336, 1, 0, 0, 1, 1,
-0.5668638, 0.3173586, -1.393562, 1, 0, 0, 1, 1,
-0.5666523, 0.6590026, 0.2004286, 0, 0, 0, 1, 1,
-0.5636133, -0.1609727, -1.451615, 0, 0, 0, 1, 1,
-0.5629008, 0.9638888, 1.059198, 0, 0, 0, 1, 1,
-0.5624018, -1.484272, -3.482222, 0, 0, 0, 1, 1,
-0.5622301, 0.6823681, -0.7304186, 0, 0, 0, 1, 1,
-0.5621973, -1.427076, -4.863665, 0, 0, 0, 1, 1,
-0.5606202, 0.6224999, -3.227668, 0, 0, 0, 1, 1,
-0.5599552, -1.758159, -2.177534, 1, 1, 1, 1, 1,
-0.557991, -1.387142, -3.95322, 1, 1, 1, 1, 1,
-0.556138, -0.4803194, -0.8011134, 1, 1, 1, 1, 1,
-0.5512762, -0.4754945, -2.08089, 1, 1, 1, 1, 1,
-0.5502113, 1.053148, -1.228061, 1, 1, 1, 1, 1,
-0.5340105, 1.423715, -0.2415173, 1, 1, 1, 1, 1,
-0.5329947, 0.1365488, -2.051069, 1, 1, 1, 1, 1,
-0.5321673, -0.8094314, -2.169555, 1, 1, 1, 1, 1,
-0.531782, -0.04187047, -2.48704, 1, 1, 1, 1, 1,
-0.528599, 1.003365, 0.5462037, 1, 1, 1, 1, 1,
-0.5226265, -0.9856757, -3.342769, 1, 1, 1, 1, 1,
-0.5219417, 0.4615271, -0.9324381, 1, 1, 1, 1, 1,
-0.5216354, 1.620607, -0.6004243, 1, 1, 1, 1, 1,
-0.5182748, -0.9093575, -2.615874, 1, 1, 1, 1, 1,
-0.516412, -0.2725906, -2.933645, 1, 1, 1, 1, 1,
-0.5116692, -0.9672192, -3.877606, 0, 0, 1, 1, 1,
-0.5048122, 1.393323, 0.695731, 1, 0, 0, 1, 1,
-0.5014584, -0.9262654, -3.525737, 1, 0, 0, 1, 1,
-0.4925793, 1.183064, 0.4001129, 1, 0, 0, 1, 1,
-0.4925229, -1.314835, -3.949484, 1, 0, 0, 1, 1,
-0.4886683, 0.8085448, 0.4856847, 1, 0, 0, 1, 1,
-0.4827212, 1.536455, -0.7744426, 0, 0, 0, 1, 1,
-0.480523, -0.1995654, -2.761623, 0, 0, 0, 1, 1,
-0.4774894, -2.349792, -3.412861, 0, 0, 0, 1, 1,
-0.4753206, -0.4760014, -2.262751, 0, 0, 0, 1, 1,
-0.4735202, -0.2496992, -1.196347, 0, 0, 0, 1, 1,
-0.4719386, -0.8031595, -1.966933, 0, 0, 0, 1, 1,
-0.4649171, -0.5026474, -3.486793, 0, 0, 0, 1, 1,
-0.4574381, -0.5946298, -3.724893, 1, 1, 1, 1, 1,
-0.4573259, 0.7857358, -0.03701475, 1, 1, 1, 1, 1,
-0.4533409, 0.2053186, -1.000886, 1, 1, 1, 1, 1,
-0.4526403, -0.8855429, -2.873168, 1, 1, 1, 1, 1,
-0.4526129, -0.06182761, -1.24959, 1, 1, 1, 1, 1,
-0.4428126, -0.3741673, -1.357238, 1, 1, 1, 1, 1,
-0.4408019, 1.990075, -1.084603, 1, 1, 1, 1, 1,
-0.4401195, -1.05333, -5.220867, 1, 1, 1, 1, 1,
-0.4394614, -2.392434, -1.385576, 1, 1, 1, 1, 1,
-0.435309, 0.8262118, 1.014508, 1, 1, 1, 1, 1,
-0.4282075, 0.7388044, -0.9064756, 1, 1, 1, 1, 1,
-0.4281872, -0.6087028, -1.082733, 1, 1, 1, 1, 1,
-0.4274666, -0.00061449, -1.773414, 1, 1, 1, 1, 1,
-0.4231868, -2.490871, -2.704896, 1, 1, 1, 1, 1,
-0.4224551, -0.7797764, -3.640477, 1, 1, 1, 1, 1,
-0.4218011, -0.1406244, -2.88713, 0, 0, 1, 1, 1,
-0.4178004, -1.103397, -2.443122, 1, 0, 0, 1, 1,
-0.416029, -0.9478005, -2.711367, 1, 0, 0, 1, 1,
-0.4149312, 0.4214153, -0.6228111, 1, 0, 0, 1, 1,
-0.4140279, -1.311178, -2.567338, 1, 0, 0, 1, 1,
-0.4100222, 0.09336044, -2.836831, 1, 0, 0, 1, 1,
-0.409817, -0.5968916, -2.858378, 0, 0, 0, 1, 1,
-0.4072753, -1.105278, -3.275597, 0, 0, 0, 1, 1,
-0.4059957, 0.7259513, -1.084247, 0, 0, 0, 1, 1,
-0.4020518, 0.4095744, -0.7567018, 0, 0, 0, 1, 1,
-0.3980166, 0.2514549, -1.169671, 0, 0, 0, 1, 1,
-0.3974073, -0.3786795, -1.475443, 0, 0, 0, 1, 1,
-0.3962427, 1.088394, 0.04853886, 0, 0, 0, 1, 1,
-0.3956753, 0.06038987, -1.84094, 1, 1, 1, 1, 1,
-0.395142, -0.05160487, -1.992889, 1, 1, 1, 1, 1,
-0.3949209, 0.3261442, -0.7182707, 1, 1, 1, 1, 1,
-0.3931825, 0.569998, -1.931176, 1, 1, 1, 1, 1,
-0.390918, -1.030398, -3.811205, 1, 1, 1, 1, 1,
-0.3906629, -0.02277537, -2.188856, 1, 1, 1, 1, 1,
-0.3897822, 0.3096697, -1.550744, 1, 1, 1, 1, 1,
-0.3882836, -1.553471, -1.482807, 1, 1, 1, 1, 1,
-0.3857533, 0.9476247, 0.1320482, 1, 1, 1, 1, 1,
-0.3840825, -1.704928, -2.087055, 1, 1, 1, 1, 1,
-0.3837758, -0.9699646, -1.746389, 1, 1, 1, 1, 1,
-0.3809364, -0.2563471, -0.7239265, 1, 1, 1, 1, 1,
-0.3693188, 0.9191998, -1.736721, 1, 1, 1, 1, 1,
-0.3692528, -0.7714775, -3.199291, 1, 1, 1, 1, 1,
-0.3683891, 2.312803, -1.290999, 1, 1, 1, 1, 1,
-0.3604611, 0.1962492, -0.7610999, 0, 0, 1, 1, 1,
-0.3592506, -0.3413831, -2.505734, 1, 0, 0, 1, 1,
-0.35514, -0.7308817, -3.341296, 1, 0, 0, 1, 1,
-0.353768, 0.006013136, -3.225297, 1, 0, 0, 1, 1,
-0.3501022, -0.8471729, -4.145043, 1, 0, 0, 1, 1,
-0.3482425, 0.4850505, 0.3665897, 1, 0, 0, 1, 1,
-0.34636, -0.07180279, -2.400407, 0, 0, 0, 1, 1,
-0.3434919, -0.2286409, -1.8982, 0, 0, 0, 1, 1,
-0.3393539, 1.56117, -1.170336, 0, 0, 0, 1, 1,
-0.3376986, 1.491554, -0.2533666, 0, 0, 0, 1, 1,
-0.3325129, -0.4843931, -2.617138, 0, 0, 0, 1, 1,
-0.3299458, -0.2117347, -3.590167, 0, 0, 0, 1, 1,
-0.3297358, -0.7574787, -4.690548, 0, 0, 0, 1, 1,
-0.3284813, -0.5656393, -4.386368, 1, 1, 1, 1, 1,
-0.3249227, 0.2452477, -1.82611, 1, 1, 1, 1, 1,
-0.3230906, 0.3038463, 0.7985708, 1, 1, 1, 1, 1,
-0.3226893, 2.641915, -0.8975098, 1, 1, 1, 1, 1,
-0.3207419, 0.6192032, -0.2105739, 1, 1, 1, 1, 1,
-0.3167635, -0.8790786, -4.350714, 1, 1, 1, 1, 1,
-0.3147302, 2.370991, 0.4732274, 1, 1, 1, 1, 1,
-0.3136716, 0.3283444, -1.202198, 1, 1, 1, 1, 1,
-0.3124808, 0.547946, 2.762381, 1, 1, 1, 1, 1,
-0.3108612, 1.468448, 0.3400968, 1, 1, 1, 1, 1,
-0.3079898, -0.1300886, -1.153705, 1, 1, 1, 1, 1,
-0.305643, 0.5199973, -0.2243986, 1, 1, 1, 1, 1,
-0.304568, 1.015916, -0.4391309, 1, 1, 1, 1, 1,
-0.3024604, -2.80426, -4.095132, 1, 1, 1, 1, 1,
-0.3023453, 0.4658614, -2.511961, 1, 1, 1, 1, 1,
-0.3011096, 1.981574, 1.425877, 0, 0, 1, 1, 1,
-0.3000228, 0.02614025, -1.439851, 1, 0, 0, 1, 1,
-0.2987306, 2.651964, -0.4894018, 1, 0, 0, 1, 1,
-0.2986668, 0.4474307, -1.59464, 1, 0, 0, 1, 1,
-0.2950822, -0.02817144, -2.187688, 1, 0, 0, 1, 1,
-0.290721, -0.869503, -2.629024, 1, 0, 0, 1, 1,
-0.2895867, -0.05798543, -1.744639, 0, 0, 0, 1, 1,
-0.288012, -2.365818, -4.037924, 0, 0, 0, 1, 1,
-0.2868843, -1.848705, -3.073783, 0, 0, 0, 1, 1,
-0.2819385, -0.4185725, -2.876534, 0, 0, 0, 1, 1,
-0.278371, 0.9845578, 0.1138937, 0, 0, 0, 1, 1,
-0.2768091, -0.1209855, -2.73033, 0, 0, 0, 1, 1,
-0.2727765, 0.3774222, 0.6769402, 0, 0, 0, 1, 1,
-0.2724413, -1.872792, -3.623968, 1, 1, 1, 1, 1,
-0.2690604, 1.772889, 1.075337, 1, 1, 1, 1, 1,
-0.2669556, 0.4315836, 0.2813479, 1, 1, 1, 1, 1,
-0.2623925, 0.473967, -0.6972764, 1, 1, 1, 1, 1,
-0.2593769, 0.1769307, -1.603855, 1, 1, 1, 1, 1,
-0.2551294, 0.5298238, 0.1308982, 1, 1, 1, 1, 1,
-0.2520406, -0.4726672, -2.48937, 1, 1, 1, 1, 1,
-0.2439307, 2.403056, -0.237249, 1, 1, 1, 1, 1,
-0.24155, 0.3741255, -0.3327652, 1, 1, 1, 1, 1,
-0.2340192, -1.514394, -3.34899, 1, 1, 1, 1, 1,
-0.2255916, 0.3788733, -0.2961186, 1, 1, 1, 1, 1,
-0.2213309, -0.8132851, -3.327806, 1, 1, 1, 1, 1,
-0.2212849, 0.2214229, -0.7640538, 1, 1, 1, 1, 1,
-0.2184388, -1.001219, -4.198011, 1, 1, 1, 1, 1,
-0.2161949, -0.6754926, -3.345351, 1, 1, 1, 1, 1,
-0.2122576, -1.420048, -4.130918, 0, 0, 1, 1, 1,
-0.2119945, -1.214969, -5.871284, 1, 0, 0, 1, 1,
-0.2118544, -1.435544, -3.058531, 1, 0, 0, 1, 1,
-0.2109183, 1.331479, -0.3334413, 1, 0, 0, 1, 1,
-0.20547, -0.8500986, -1.896863, 1, 0, 0, 1, 1,
-0.2028543, 1.00906, -0.770954, 1, 0, 0, 1, 1,
-0.2016268, 0.8771842, 0.3545164, 0, 0, 0, 1, 1,
-0.1982261, -0.5339964, -2.762358, 0, 0, 0, 1, 1,
-0.1973762, -0.07756295, -4.600977, 0, 0, 0, 1, 1,
-0.1884132, -0.1636562, -3.105862, 0, 0, 0, 1, 1,
-0.1856943, 1.162686, -1.026209, 0, 0, 0, 1, 1,
-0.1823315, 2.837395, 1.175331, 0, 0, 0, 1, 1,
-0.177913, -0.4433864, -1.499103, 0, 0, 0, 1, 1,
-0.1748237, -0.3845648, -3.309642, 1, 1, 1, 1, 1,
-0.1727634, 0.2236785, -1.457365, 1, 1, 1, 1, 1,
-0.1720617, 0.488427, 1.405705, 1, 1, 1, 1, 1,
-0.171343, 0.3693931, -0.09129053, 1, 1, 1, 1, 1,
-0.1700992, 0.3278931, -1.578841, 1, 1, 1, 1, 1,
-0.1679842, 0.7748571, 0.1645543, 1, 1, 1, 1, 1,
-0.1616231, 0.03031608, -0.9037701, 1, 1, 1, 1, 1,
-0.1614687, -0.2482897, -3.226021, 1, 1, 1, 1, 1,
-0.1592869, 0.7568654, 1.371527, 1, 1, 1, 1, 1,
-0.1583431, 0.1591532, -1.2815, 1, 1, 1, 1, 1,
-0.1564315, 0.1309894, -1.706616, 1, 1, 1, 1, 1,
-0.1544356, 1.005249, -0.008861309, 1, 1, 1, 1, 1,
-0.1542183, -0.3458587, -3.777776, 1, 1, 1, 1, 1,
-0.1536884, 0.7874058, 0.003067728, 1, 1, 1, 1, 1,
-0.1533379, 0.5375071, -0.8300982, 1, 1, 1, 1, 1,
-0.1507705, 2.016158, -0.1006578, 0, 0, 1, 1, 1,
-0.146872, -1.788525, -1.699484, 1, 0, 0, 1, 1,
-0.1465413, -0.7180019, -1.718162, 1, 0, 0, 1, 1,
-0.1440188, -0.4378357, -2.08628, 1, 0, 0, 1, 1,
-0.1417518, 1.228407, -0.3761274, 1, 0, 0, 1, 1,
-0.1412551, 0.0139675, -2.322791, 1, 0, 0, 1, 1,
-0.1296824, -1.006207, -3.680613, 0, 0, 0, 1, 1,
-0.1296438, -1.351138, -4.427339, 0, 0, 0, 1, 1,
-0.1295552, 0.3604019, -0.7933956, 0, 0, 0, 1, 1,
-0.1284062, 0.9515924, -0.1170876, 0, 0, 0, 1, 1,
-0.1270052, 0.6330957, 0.4165281, 0, 0, 0, 1, 1,
-0.1266188, 0.8124023, 0.03070235, 0, 0, 0, 1, 1,
-0.1221149, -1.015905, -4.328741, 0, 0, 0, 1, 1,
-0.1220903, 0.6381195, -1.51273, 1, 1, 1, 1, 1,
-0.1203573, 1.323782, 0.2183437, 1, 1, 1, 1, 1,
-0.1200185, -0.9957424, -2.862083, 1, 1, 1, 1, 1,
-0.1158571, -0.2563408, -2.62349, 1, 1, 1, 1, 1,
-0.1109249, -0.8773655, -2.415952, 1, 1, 1, 1, 1,
-0.1020465, 1.528067, 0.04485893, 1, 1, 1, 1, 1,
-0.09747852, -0.2066941, -2.18459, 1, 1, 1, 1, 1,
-0.09526664, -0.4762317, -3.505075, 1, 1, 1, 1, 1,
-0.08839763, -1.159875, -4.373237, 1, 1, 1, 1, 1,
-0.08689795, 2.233023, 2.130829, 1, 1, 1, 1, 1,
-0.08567982, 0.7662031, 1.262302, 1, 1, 1, 1, 1,
-0.08510786, 0.5559037, -1.668101, 1, 1, 1, 1, 1,
-0.07959169, 1.829578, -1.392451, 1, 1, 1, 1, 1,
-0.07923373, 1.820497, 0.3278124, 1, 1, 1, 1, 1,
-0.07701229, 0.111184, -0.7332602, 1, 1, 1, 1, 1,
-0.07416049, -0.6509888, -2.445856, 0, 0, 1, 1, 1,
-0.07119324, 0.3108979, -0.3978315, 1, 0, 0, 1, 1,
-0.0704485, 0.1069186, -0.2548724, 1, 0, 0, 1, 1,
-0.06716517, -0.5791886, -2.869082, 1, 0, 0, 1, 1,
-0.06474013, -0.9440846, -3.60543, 1, 0, 0, 1, 1,
-0.06042317, 0.7464191, 0.6462559, 1, 0, 0, 1, 1,
-0.05082471, 0.8809721, -1.336682, 0, 0, 0, 1, 1,
-0.04991055, 0.233324, -0.3830639, 0, 0, 0, 1, 1,
-0.04645555, -0.1859131, -4.073138, 0, 0, 0, 1, 1,
-0.04330629, 1.051515, 1.040704, 0, 0, 0, 1, 1,
-0.03955412, -1.904365, -2.038656, 0, 0, 0, 1, 1,
-0.03549714, 0.7349045, 0.6913779, 0, 0, 0, 1, 1,
-0.03517722, 0.5258273, -0.1681099, 0, 0, 0, 1, 1,
-0.03506028, -0.8112558, -3.833724, 1, 1, 1, 1, 1,
-0.03435314, 0.03180249, -2.437023, 1, 1, 1, 1, 1,
-0.03413703, -0.2047421, -3.074198, 1, 1, 1, 1, 1,
-0.03054764, -1.67273, -4.356694, 1, 1, 1, 1, 1,
-0.02757623, 0.201485, -1.212683, 1, 1, 1, 1, 1,
-0.02580873, 0.526734, 0.4940975, 1, 1, 1, 1, 1,
-0.02433188, -0.3233874, -2.253685, 1, 1, 1, 1, 1,
-0.02388983, 1.093091, 0.4499376, 1, 1, 1, 1, 1,
-0.02320121, 1.854311, -0.9230426, 1, 1, 1, 1, 1,
-0.02241447, 0.3305812, -1.466371, 1, 1, 1, 1, 1,
-0.02157428, -1.722456, -3.682307, 1, 1, 1, 1, 1,
-0.02146669, 0.5673075, 1.926261, 1, 1, 1, 1, 1,
-0.01805382, -1.405612, -3.760477, 1, 1, 1, 1, 1,
-0.01801344, -0.05035247, -4.181719, 1, 1, 1, 1, 1,
-0.01509849, 1.068845, 0.5978804, 1, 1, 1, 1, 1,
-0.01488124, -1.138965, -4.65599, 0, 0, 1, 1, 1,
-0.01340786, -0.5376107, -3.516475, 1, 0, 0, 1, 1,
-0.009833695, -1.748993, -2.959393, 1, 0, 0, 1, 1,
-0.008567684, -0.9632847, -3.760959, 1, 0, 0, 1, 1,
-0.008029313, 1.364236, 0.06307959, 1, 0, 0, 1, 1,
-0.003963429, 0.5846853, 0.6362541, 1, 0, 0, 1, 1,
-0.003854115, -0.3911492, -2.931406, 0, 0, 0, 1, 1,
-0.003508991, -0.1296194, -3.491662, 0, 0, 0, 1, 1,
0.000222816, -1.15594, 2.93102, 0, 0, 0, 1, 1,
0.0002826533, -0.5209008, 3.582892, 0, 0, 0, 1, 1,
0.00187609, 0.6242197, -0.5162501, 0, 0, 0, 1, 1,
0.002628048, 0.2978213, 0.3523827, 0, 0, 0, 1, 1,
0.002879302, -0.852504, 4.653299, 0, 0, 0, 1, 1,
0.00330424, -1.491767, 4.514449, 1, 1, 1, 1, 1,
0.004371361, -0.468745, 4.733259, 1, 1, 1, 1, 1,
0.005165622, -0.01649481, 2.444947, 1, 1, 1, 1, 1,
0.006337668, 0.3052275, 1.087546, 1, 1, 1, 1, 1,
0.007493922, 1.028821, -1.425269, 1, 1, 1, 1, 1,
0.01079908, 0.05247603, -0.9474496, 1, 1, 1, 1, 1,
0.01394808, 1.605598, -0.9064499, 1, 1, 1, 1, 1,
0.01692143, -0.1475254, 2.501504, 1, 1, 1, 1, 1,
0.01700104, 1.439982, -0.267523, 1, 1, 1, 1, 1,
0.0187697, -0.4813299, 2.875543, 1, 1, 1, 1, 1,
0.02212501, -1.131107, 4.449154, 1, 1, 1, 1, 1,
0.02628374, -1.316874, 2.915389, 1, 1, 1, 1, 1,
0.02750761, -1.214718, 4.197258, 1, 1, 1, 1, 1,
0.02904123, 1.062165, 0.2610736, 1, 1, 1, 1, 1,
0.0316787, 0.2535427, -0.3117931, 1, 1, 1, 1, 1,
0.03912255, -0.2698119, 2.905843, 0, 0, 1, 1, 1,
0.03942668, 0.5667031, -1.0044, 1, 0, 0, 1, 1,
0.04297702, 0.9695559, -0.9038275, 1, 0, 0, 1, 1,
0.04584929, -1.518971, 3.292653, 1, 0, 0, 1, 1,
0.04650371, -1.008282, 3.019712, 1, 0, 0, 1, 1,
0.04806119, -1.005978, 1.73592, 1, 0, 0, 1, 1,
0.05017462, -0.1464289, 2.088005, 0, 0, 0, 1, 1,
0.05167392, -1.312232, 3.060335, 0, 0, 0, 1, 1,
0.05526222, -1.105896, 3.926476, 0, 0, 0, 1, 1,
0.05577696, 0.06318601, 0.3236032, 0, 0, 0, 1, 1,
0.05825327, 0.4252385, 0.4058813, 0, 0, 0, 1, 1,
0.05882258, 0.8690368, -0.7302684, 0, 0, 0, 1, 1,
0.06036275, 0.1963154, 1.526466, 0, 0, 0, 1, 1,
0.068512, 0.5417963, 0.8983181, 1, 1, 1, 1, 1,
0.06897388, -0.01863881, 3.682002, 1, 1, 1, 1, 1,
0.0717776, -2.065708, 3.528033, 1, 1, 1, 1, 1,
0.07315397, 1.792269, -0.06931827, 1, 1, 1, 1, 1,
0.08783682, 0.4044647, 1.245654, 1, 1, 1, 1, 1,
0.09845971, -0.257774, 1.887209, 1, 1, 1, 1, 1,
0.09919494, -0.2272912, 2.634024, 1, 1, 1, 1, 1,
0.1027358, -0.7158319, 3.94637, 1, 1, 1, 1, 1,
0.1030026, 0.5460528, 0.8655338, 1, 1, 1, 1, 1,
0.1034373, 0.1496707, 0.3218392, 1, 1, 1, 1, 1,
0.1038919, 1.716213, 1.427084, 1, 1, 1, 1, 1,
0.1062897, 2.323023, -0.6831745, 1, 1, 1, 1, 1,
0.1078274, -0.1551075, 2.787617, 1, 1, 1, 1, 1,
0.1089082, -0.6413323, 3.771895, 1, 1, 1, 1, 1,
0.1142268, 0.2321777, 0.7151555, 1, 1, 1, 1, 1,
0.1145432, 0.1656825, -0.301972, 0, 0, 1, 1, 1,
0.1166616, 1.636534, -0.3029993, 1, 0, 0, 1, 1,
0.1189566, -0.8389212, 2.685374, 1, 0, 0, 1, 1,
0.1191102, -0.5589043, 4.19781, 1, 0, 0, 1, 1,
0.1222654, 1.586778, -0.4102834, 1, 0, 0, 1, 1,
0.1226057, 0.4525898, 2.517384, 1, 0, 0, 1, 1,
0.1249555, -0.5671234, 3.151665, 0, 0, 0, 1, 1,
0.1270769, -0.08635856, 1.877197, 0, 0, 0, 1, 1,
0.1283146, -1.189257, 2.167522, 0, 0, 0, 1, 1,
0.1293778, -1.174322, 3.520339, 0, 0, 0, 1, 1,
0.1349019, 0.5376779, 0.6965337, 0, 0, 0, 1, 1,
0.1367987, 0.6520974, 0.5462286, 0, 0, 0, 1, 1,
0.1370538, -0.09112015, 1.195976, 0, 0, 0, 1, 1,
0.1393852, -0.08442599, 3.769702, 1, 1, 1, 1, 1,
0.1420795, 0.9852288, -0.1668598, 1, 1, 1, 1, 1,
0.145709, 0.5120141, -0.1516865, 1, 1, 1, 1, 1,
0.1520528, -1.188045, 2.46639, 1, 1, 1, 1, 1,
0.164848, 0.2708502, 1.171702, 1, 1, 1, 1, 1,
0.1661566, 0.3154415, 1.625501, 1, 1, 1, 1, 1,
0.1701471, 1.007951, 0.1843946, 1, 1, 1, 1, 1,
0.1728902, 1.515649, 2.017272, 1, 1, 1, 1, 1,
0.1821463, 0.1988427, 1.048095, 1, 1, 1, 1, 1,
0.1827675, 1.114524, -0.5332316, 1, 1, 1, 1, 1,
0.1881385, -1.936028, 2.89617, 1, 1, 1, 1, 1,
0.1989066, 1.264707, -0.73149, 1, 1, 1, 1, 1,
0.2022292, -0.5378321, 0.52711, 1, 1, 1, 1, 1,
0.2041027, -0.4001555, 1.626915, 1, 1, 1, 1, 1,
0.204828, -1.378667, 3.824718, 1, 1, 1, 1, 1,
0.2055802, 0.4585257, 0.9465554, 0, 0, 1, 1, 1,
0.207463, -0.9854954, 2.165806, 1, 0, 0, 1, 1,
0.2090274, -0.6739966, 3.140716, 1, 0, 0, 1, 1,
0.2119811, 1.56335, 1.490072, 1, 0, 0, 1, 1,
0.2128986, -0.8459182, 1.713174, 1, 0, 0, 1, 1,
0.2154502, 0.5216419, 1.112512, 1, 0, 0, 1, 1,
0.2185391, -0.06141622, 1.483645, 0, 0, 0, 1, 1,
0.2193857, -2.078296, 1.713341, 0, 0, 0, 1, 1,
0.2297473, -2.402095, 2.5833, 0, 0, 0, 1, 1,
0.2356628, 0.4590394, -0.6663994, 0, 0, 0, 1, 1,
0.2517305, -1.026887, 4.998088, 0, 0, 0, 1, 1,
0.2520363, 0.5335692, 2.198808, 0, 0, 0, 1, 1,
0.2536741, -0.7474629, 3.844944, 0, 0, 0, 1, 1,
0.2575535, 0.03894995, 1.41905, 1, 1, 1, 1, 1,
0.2581266, 0.05585518, 2.221493, 1, 1, 1, 1, 1,
0.2595709, 0.2332336, 2.029747, 1, 1, 1, 1, 1,
0.260433, -0.5803912, 2.341032, 1, 1, 1, 1, 1,
0.2633811, -0.446556, 3.577888, 1, 1, 1, 1, 1,
0.2653274, 1.341027, 1.430169, 1, 1, 1, 1, 1,
0.2664816, 1.124178, -0.2467825, 1, 1, 1, 1, 1,
0.2682726, -0.3908498, 3.855563, 1, 1, 1, 1, 1,
0.2732443, -1.150724, 2.069421, 1, 1, 1, 1, 1,
0.2758945, -1.074944, 3.913293, 1, 1, 1, 1, 1,
0.2794994, -0.3455462, 2.637455, 1, 1, 1, 1, 1,
0.2795963, -1.103186, 1.827431, 1, 1, 1, 1, 1,
0.28104, 0.5362105, 0.3909632, 1, 1, 1, 1, 1,
0.2811538, 1.427411, -0.0875869, 1, 1, 1, 1, 1,
0.2822339, 1.962504, 0.2965364, 1, 1, 1, 1, 1,
0.2822689, -0.5226216, 1.363427, 0, 0, 1, 1, 1,
0.2870045, 1.574621, -0.453162, 1, 0, 0, 1, 1,
0.2923339, 0.4300002, -0.8983545, 1, 0, 0, 1, 1,
0.2950226, -0.2186133, 2.969524, 1, 0, 0, 1, 1,
0.2972099, 0.1322294, 0.1945344, 1, 0, 0, 1, 1,
0.2974353, 0.5243359, 2.114234, 1, 0, 0, 1, 1,
0.298129, -1.547302, 2.656196, 0, 0, 0, 1, 1,
0.2989728, 0.4422394, -0.8294092, 0, 0, 0, 1, 1,
0.3067934, -0.3694323, 2.306102, 0, 0, 0, 1, 1,
0.31032, 0.9251261, 1.083932, 0, 0, 0, 1, 1,
0.3127798, 2.140937, 0.4148189, 0, 0, 0, 1, 1,
0.3203492, 0.4571231, 2.629381, 0, 0, 0, 1, 1,
0.3290376, 1.450774, 0.01521712, 0, 0, 0, 1, 1,
0.3294789, 1.185463, 0.1106109, 1, 1, 1, 1, 1,
0.3327399, 0.3861006, 0.6453471, 1, 1, 1, 1, 1,
0.335186, -1.636102, 3.184283, 1, 1, 1, 1, 1,
0.3361171, 1.379269, -1.247292, 1, 1, 1, 1, 1,
0.3395299, 0.2318503, 0.04631873, 1, 1, 1, 1, 1,
0.3411984, 0.1593907, 0.1956953, 1, 1, 1, 1, 1,
0.3435131, -0.6627105, 3.038696, 1, 1, 1, 1, 1,
0.3462431, 0.9115756, -0.1934822, 1, 1, 1, 1, 1,
0.3490422, 0.2324476, 1.144225, 1, 1, 1, 1, 1,
0.3503624, -0.6251139, 2.334281, 1, 1, 1, 1, 1,
0.3510681, 1.104217, -0.4873393, 1, 1, 1, 1, 1,
0.351855, 0.6750526, 0.6614847, 1, 1, 1, 1, 1,
0.3531128, 1.827342, 1.237531, 1, 1, 1, 1, 1,
0.3543521, -0.500961, 1.704069, 1, 1, 1, 1, 1,
0.354594, -0.3974537, 1.141536, 1, 1, 1, 1, 1,
0.3548459, -0.2614412, 2.215155, 0, 0, 1, 1, 1,
0.3559566, -1.517186, 0.10925, 1, 0, 0, 1, 1,
0.3582488, -0.294616, 5.377699, 1, 0, 0, 1, 1,
0.3608396, -1.708478, 1.906739, 1, 0, 0, 1, 1,
0.3611913, -0.2826288, 1.324596, 1, 0, 0, 1, 1,
0.3654385, -0.9902447, 1.837531, 1, 0, 0, 1, 1,
0.3698883, 0.5224534, 0.4205775, 0, 0, 0, 1, 1,
0.3700174, 1.339733, 0.05352198, 0, 0, 0, 1, 1,
0.3726625, -0.06873026, 0.9153115, 0, 0, 0, 1, 1,
0.3767452, -0.11781, 1.46443, 0, 0, 0, 1, 1,
0.3786638, 1.659436, 1.443478, 0, 0, 0, 1, 1,
0.3851234, -0.501372, 1.067173, 0, 0, 0, 1, 1,
0.3889345, 0.2014901, 0.9582117, 0, 0, 0, 1, 1,
0.3916466, 0.8793609, 0.9991117, 1, 1, 1, 1, 1,
0.3917621, 0.7800536, -0.2142758, 1, 1, 1, 1, 1,
0.3943945, -0.0493237, 2.039955, 1, 1, 1, 1, 1,
0.3978767, 1.985638, 0.7676796, 1, 1, 1, 1, 1,
0.4011922, 0.6358879, -0.990753, 1, 1, 1, 1, 1,
0.4028636, 0.8180309, 2.399865, 1, 1, 1, 1, 1,
0.4042152, -0.1044715, 1.524188, 1, 1, 1, 1, 1,
0.404991, 0.8926169, 0.2393118, 1, 1, 1, 1, 1,
0.4087046, -1.012457, 4.699203, 1, 1, 1, 1, 1,
0.4097134, -0.8921303, 2.42968, 1, 1, 1, 1, 1,
0.4109078, 0.6321586, 1.292784, 1, 1, 1, 1, 1,
0.4138461, -0.2369628, 2.349592, 1, 1, 1, 1, 1,
0.4145238, -1.905494, 3.999244, 1, 1, 1, 1, 1,
0.4158913, -0.3030397, 1.826453, 1, 1, 1, 1, 1,
0.4211302, -1.851931, 2.451791, 1, 1, 1, 1, 1,
0.4215603, 1.365371, 0.2889304, 0, 0, 1, 1, 1,
0.4259491, -0.5332327, 3.115494, 1, 0, 0, 1, 1,
0.4260967, -1.974997, 1.391373, 1, 0, 0, 1, 1,
0.4267951, 0.470718, 0.5741565, 1, 0, 0, 1, 1,
0.4388426, 0.05473738, 1.646161, 1, 0, 0, 1, 1,
0.4442645, 0.2299778, 1.34858, 1, 0, 0, 1, 1,
0.4489563, -0.9764369, 2.252395, 0, 0, 0, 1, 1,
0.4501094, -1.121922, 2.252711, 0, 0, 0, 1, 1,
0.4502865, -0.6599188, 2.338285, 0, 0, 0, 1, 1,
0.4505207, -0.2489499, 2.027348, 0, 0, 0, 1, 1,
0.4519946, 1.751196, 0.1591972, 0, 0, 0, 1, 1,
0.4526237, 0.01601207, 0.8623754, 0, 0, 0, 1, 1,
0.45559, -0.18251, 2.554447, 0, 0, 0, 1, 1,
0.4556078, 0.4730084, 2.190011, 1, 1, 1, 1, 1,
0.456138, -1.546471, 3.775498, 1, 1, 1, 1, 1,
0.4612615, -1.028697, 3.623152, 1, 1, 1, 1, 1,
0.4645461, -2.49285, 2.289348, 1, 1, 1, 1, 1,
0.4655415, 0.5880363, 1.41039, 1, 1, 1, 1, 1,
0.4684407, -0.4629569, 4.03055, 1, 1, 1, 1, 1,
0.4806449, -0.9313465, 2.984837, 1, 1, 1, 1, 1,
0.4849657, -1.57945, 4.044878, 1, 1, 1, 1, 1,
0.4877186, 0.5787456, -0.08067031, 1, 1, 1, 1, 1,
0.4922903, 0.5178655, -0.195315, 1, 1, 1, 1, 1,
0.4944491, 0.8630344, 1.171063, 1, 1, 1, 1, 1,
0.4987044, -0.5524191, 3.040547, 1, 1, 1, 1, 1,
0.4987411, -0.9639212, 2.836859, 1, 1, 1, 1, 1,
0.5042515, 2.726732, 0.4376297, 1, 1, 1, 1, 1,
0.5072919, 1.035079, 1.625428, 1, 1, 1, 1, 1,
0.5096357, -1.048693, 3.137293, 0, 0, 1, 1, 1,
0.5137838, 1.011375, -1.03506, 1, 0, 0, 1, 1,
0.5159294, 0.312555, 1.362197, 1, 0, 0, 1, 1,
0.5196624, 0.7881677, 1.808539, 1, 0, 0, 1, 1,
0.5198777, -0.06927296, 1.934121, 1, 0, 0, 1, 1,
0.5230659, 0.31847, 0.5731627, 1, 0, 0, 1, 1,
0.524615, 0.08040784, 2.658734, 0, 0, 0, 1, 1,
0.5302979, 0.864659, 1.209033, 0, 0, 0, 1, 1,
0.5352157, 0.384455, -0.2035366, 0, 0, 0, 1, 1,
0.5361142, -0.9136693, 2.732586, 0, 0, 0, 1, 1,
0.5404073, 0.9571443, -0.2476521, 0, 0, 0, 1, 1,
0.5407832, 1.620583, 0.2942741, 0, 0, 0, 1, 1,
0.5434723, -0.378804, 2.723439, 0, 0, 0, 1, 1,
0.5436062, 1.334944, -0.3406304, 1, 1, 1, 1, 1,
0.5459337, 0.89061, 0.07328826, 1, 1, 1, 1, 1,
0.551127, 0.9125077, 0.9871874, 1, 1, 1, 1, 1,
0.5521218, -0.576878, 2.140985, 1, 1, 1, 1, 1,
0.5620142, -0.2540276, 1.338107, 1, 1, 1, 1, 1,
0.5639765, -0.4222569, 2.452009, 1, 1, 1, 1, 1,
0.5651827, 0.1175776, 0.1705155, 1, 1, 1, 1, 1,
0.5663044, -1.039236, 2.637341, 1, 1, 1, 1, 1,
0.5674887, -0.4781079, 2.499315, 1, 1, 1, 1, 1,
0.5692719, -0.8673844, 3.633038, 1, 1, 1, 1, 1,
0.5731071, -0.05824713, 2.098941, 1, 1, 1, 1, 1,
0.5731192, -1.560899, 2.111087, 1, 1, 1, 1, 1,
0.5737294, -0.1810186, 2.213862, 1, 1, 1, 1, 1,
0.5749592, -0.3141837, 3.642458, 1, 1, 1, 1, 1,
0.5784222, -0.1880036, 1.184958, 1, 1, 1, 1, 1,
0.5902991, -0.2589473, 2.219431, 0, 0, 1, 1, 1,
0.5928221, 0.6106197, -0.2920704, 1, 0, 0, 1, 1,
0.6064041, -0.6281271, 0.7530582, 1, 0, 0, 1, 1,
0.6105368, 0.1590529, 0.9886082, 1, 0, 0, 1, 1,
0.6191239, 2.279044, 0.9023724, 1, 0, 0, 1, 1,
0.6221227, 1.364722, 0.6933956, 1, 0, 0, 1, 1,
0.625552, 0.5695078, 0.5158543, 0, 0, 0, 1, 1,
0.6272549, 0.9186377, -0.114065, 0, 0, 0, 1, 1,
0.6285704, -1.216199, 3.563663, 0, 0, 0, 1, 1,
0.6310192, -0.2598478, 3.173976, 0, 0, 0, 1, 1,
0.6336881, -1.007732, 1.82927, 0, 0, 0, 1, 1,
0.6380216, -0.2764117, 1.450603, 0, 0, 0, 1, 1,
0.641995, -0.1543156, 2.978814, 0, 0, 0, 1, 1,
0.6423526, 0.6147982, 0.8089504, 1, 1, 1, 1, 1,
0.6475707, 0.7053665, 2.16092, 1, 1, 1, 1, 1,
0.6497136, -0.376818, 0.9964333, 1, 1, 1, 1, 1,
0.6503869, 0.8864415, 0.236184, 1, 1, 1, 1, 1,
0.6513864, -0.475372, 1.514237, 1, 1, 1, 1, 1,
0.6533465, 0.2091139, 0.2688669, 1, 1, 1, 1, 1,
0.6611526, -1.384696, 0.7584356, 1, 1, 1, 1, 1,
0.6613159, 1.537447, -1.880597, 1, 1, 1, 1, 1,
0.663513, 0.3088062, 0.8958871, 1, 1, 1, 1, 1,
0.6750942, 0.4048289, 0.8329965, 1, 1, 1, 1, 1,
0.6831433, 0.3694843, -0.8799608, 1, 1, 1, 1, 1,
0.6862605, -2.16427, 2.240083, 1, 1, 1, 1, 1,
0.6892483, 0.1932579, 3.245995, 1, 1, 1, 1, 1,
0.7101083, 1.990941, 0.3317197, 1, 1, 1, 1, 1,
0.7130579, 0.2195438, -0.02705542, 1, 1, 1, 1, 1,
0.7136496, -1.133365, 1.628555, 0, 0, 1, 1, 1,
0.7178134, -0.7861729, 4.48049, 1, 0, 0, 1, 1,
0.7215801, 0.6560947, 2.752057, 1, 0, 0, 1, 1,
0.7312549, 0.28825, 0.3446578, 1, 0, 0, 1, 1,
0.7324272, 1.576291, 0.4208027, 1, 0, 0, 1, 1,
0.7349678, 0.1175943, 2.691969, 1, 0, 0, 1, 1,
0.7366514, 0.250938, 2.054836, 0, 0, 0, 1, 1,
0.7390912, 1.199474, 1.082727, 0, 0, 0, 1, 1,
0.7451189, 0.1258865, 2.728356, 0, 0, 0, 1, 1,
0.7494345, 1.450374, 2.429693, 0, 0, 0, 1, 1,
0.7541393, -2.139774, 1.79469, 0, 0, 0, 1, 1,
0.7624683, 0.7461835, 0.4573172, 0, 0, 0, 1, 1,
0.7630917, 0.6247817, 0.113633, 0, 0, 0, 1, 1,
0.7680751, -2.344341, 2.098358, 1, 1, 1, 1, 1,
0.7691051, -0.1571639, 3.041351, 1, 1, 1, 1, 1,
0.769683, 0.08599509, 1.979448, 1, 1, 1, 1, 1,
0.7698303, -0.01720973, 2.836058, 1, 1, 1, 1, 1,
0.7830096, 0.06148745, 1.951091, 1, 1, 1, 1, 1,
0.7859694, 0.7902877, 2.801111, 1, 1, 1, 1, 1,
0.7863296, -1.800343, 1.915366, 1, 1, 1, 1, 1,
0.7890106, -0.3846971, 1.30527, 1, 1, 1, 1, 1,
0.7934962, -0.57046, 1.405808, 1, 1, 1, 1, 1,
0.7939569, -0.0454008, 0.7032049, 1, 1, 1, 1, 1,
0.7991304, 2.566937, 0.2793456, 1, 1, 1, 1, 1,
0.7999822, 0.1085492, 0.4877473, 1, 1, 1, 1, 1,
0.8013047, -0.2054813, 1.7401, 1, 1, 1, 1, 1,
0.8017327, 0.1692187, 0.2003159, 1, 1, 1, 1, 1,
0.8024084, 0.4591745, 2.004489, 1, 1, 1, 1, 1,
0.8042494, 0.4471217, 0.3914274, 0, 0, 1, 1, 1,
0.8097382, 0.01452274, 1.632453, 1, 0, 0, 1, 1,
0.8116269, -1.005826, 1.116739, 1, 0, 0, 1, 1,
0.8182475, -1.282961, 3.458159, 1, 0, 0, 1, 1,
0.820875, -0.3853915, 3.748623, 1, 0, 0, 1, 1,
0.8223008, 0.3165539, 0.954011, 1, 0, 0, 1, 1,
0.8323931, 1.285597, -0.009330963, 0, 0, 0, 1, 1,
0.8351563, -0.6223114, 0.9282278, 0, 0, 0, 1, 1,
0.8352848, 0.9712049, 0.9611652, 0, 0, 0, 1, 1,
0.8355788, -2.067582, 2.178893, 0, 0, 0, 1, 1,
0.8419144, -0.5228823, 0.7645884, 0, 0, 0, 1, 1,
0.8493006, 1.1314, -0.6380255, 0, 0, 0, 1, 1,
0.8500563, 0.9690557, 1.122231, 0, 0, 0, 1, 1,
0.8506207, 0.3184977, 2.235849, 1, 1, 1, 1, 1,
0.8508466, 0.1601289, 0.6578616, 1, 1, 1, 1, 1,
0.8518957, 0.08484562, 0.2285025, 1, 1, 1, 1, 1,
0.855919, 0.9226621, 0.4431362, 1, 1, 1, 1, 1,
0.8599506, -0.6526333, 3.522702, 1, 1, 1, 1, 1,
0.8613192, -0.07107254, 0.9560229, 1, 1, 1, 1, 1,
0.8676288, 0.5764326, 0.7154024, 1, 1, 1, 1, 1,
0.8793291, -0.3755234, 0.4474449, 1, 1, 1, 1, 1,
0.8800943, -0.1027375, 2.649214, 1, 1, 1, 1, 1,
0.8823185, -1.569986, 1.791142, 1, 1, 1, 1, 1,
0.8937693, 0.1219059, 1.316251, 1, 1, 1, 1, 1,
0.8954833, -1.489505, 2.509733, 1, 1, 1, 1, 1,
0.9052584, 1.559117, -0.6617609, 1, 1, 1, 1, 1,
0.9072156, -1.81364, 2.366705, 1, 1, 1, 1, 1,
0.9081864, -0.4397342, 4.553287, 1, 1, 1, 1, 1,
0.9090234, 0.1652479, 1.930615, 0, 0, 1, 1, 1,
0.9112055, -0.7696118, 0.5732709, 1, 0, 0, 1, 1,
0.9156935, -1.498598, 2.704568, 1, 0, 0, 1, 1,
0.9170629, 1.117161, -0.4583567, 1, 0, 0, 1, 1,
0.9205036, 0.8358949, 0.7590424, 1, 0, 0, 1, 1,
0.9234738, 0.4246154, 1.902705, 1, 0, 0, 1, 1,
0.9262362, -1.311619, 4.775211, 0, 0, 0, 1, 1,
0.9305565, -0.2513528, 1.279202, 0, 0, 0, 1, 1,
0.9350274, 0.4093098, 0.4277525, 0, 0, 0, 1, 1,
0.9373427, -0.736172, 2.860248, 0, 0, 0, 1, 1,
0.937753, -1.018363, 2.791307, 0, 0, 0, 1, 1,
0.9382498, 0.06635519, 0.3605788, 0, 0, 0, 1, 1,
0.9394901, 0.239788, 0.4087187, 0, 0, 0, 1, 1,
0.9454302, -0.7429994, 2.059453, 1, 1, 1, 1, 1,
0.9499959, 0.0705279, 1.172594, 1, 1, 1, 1, 1,
0.9503504, -0.884632, 2.858878, 1, 1, 1, 1, 1,
0.9540657, 0.1151803, 3.153941, 1, 1, 1, 1, 1,
0.9548215, 0.4384221, 1.795582, 1, 1, 1, 1, 1,
0.9571202, 0.3698508, 1.379265, 1, 1, 1, 1, 1,
0.9577501, -0.02287753, 2.685116, 1, 1, 1, 1, 1,
0.960808, -0.09568094, -0.5995588, 1, 1, 1, 1, 1,
0.9668839, -1.405289, 2.235136, 1, 1, 1, 1, 1,
0.9732341, -0.8478036, 1.729124, 1, 1, 1, 1, 1,
0.9834952, 0.6325726, 0.9170366, 1, 1, 1, 1, 1,
0.9845669, -2.057449, 2.742804, 1, 1, 1, 1, 1,
0.9857457, -0.2113396, -0.08626989, 1, 1, 1, 1, 1,
0.9918737, 0.3467364, 0.6776263, 1, 1, 1, 1, 1,
0.9923647, -0.9771338, 2.75546, 1, 1, 1, 1, 1,
0.9933718, -1.22144, 1.097487, 0, 0, 1, 1, 1,
0.9938574, 0.8523126, 1.058517, 1, 0, 0, 1, 1,
0.9953969, 0.05995191, 2.297163, 1, 0, 0, 1, 1,
1.001765, 0.3837777, 4.405654, 1, 0, 0, 1, 1,
1.018847, -0.7092938, 1.656591, 1, 0, 0, 1, 1,
1.019056, -0.2189171, 1.695472, 1, 0, 0, 1, 1,
1.020002, 0.06966455, 3.532031, 0, 0, 0, 1, 1,
1.023912, -0.445986, 2.482159, 0, 0, 0, 1, 1,
1.030516, -1.499557, 3.38658, 0, 0, 0, 1, 1,
1.039553, 0.3934368, 1.704932, 0, 0, 0, 1, 1,
1.041558, -1.341232, 2.632428, 0, 0, 0, 1, 1,
1.042823, 1.39608, 1.124681, 0, 0, 0, 1, 1,
1.045317, -1.348152, 3.330526, 0, 0, 0, 1, 1,
1.046214, 0.9373524, -0.8418436, 1, 1, 1, 1, 1,
1.055233, -0.5537139, 1.186194, 1, 1, 1, 1, 1,
1.058906, 0.5092156, 2.763599, 1, 1, 1, 1, 1,
1.060844, -0.8514982, 2.935914, 1, 1, 1, 1, 1,
1.061531, -0.8735918, 0.944764, 1, 1, 1, 1, 1,
1.064633, 0.8993005, -0.001095127, 1, 1, 1, 1, 1,
1.065354, -0.04456872, -0.991599, 1, 1, 1, 1, 1,
1.069116, 1.978822, -1.465772, 1, 1, 1, 1, 1,
1.075914, -1.866526, 3.263104, 1, 1, 1, 1, 1,
1.077304, -0.5096371, 1.272813, 1, 1, 1, 1, 1,
1.079284, 0.3631304, 0.03224435, 1, 1, 1, 1, 1,
1.08152, -2.350032, 3.805857, 1, 1, 1, 1, 1,
1.093241, 0.6197903, 2.473741, 1, 1, 1, 1, 1,
1.109195, -1.029466, 0.500609, 1, 1, 1, 1, 1,
1.112796, -0.4669794, 1.632293, 1, 1, 1, 1, 1,
1.1166, 0.6934999, -1.144833, 0, 0, 1, 1, 1,
1.116954, 0.2719773, 0.722284, 1, 0, 0, 1, 1,
1.117153, -1.05106, 2.776207, 1, 0, 0, 1, 1,
1.119766, 1.718196, 1.483041, 1, 0, 0, 1, 1,
1.138428, -0.02141864, 2.436812, 1, 0, 0, 1, 1,
1.142054, 1.058701, -0.5878556, 1, 0, 0, 1, 1,
1.142823, 0.2305913, -0.2358696, 0, 0, 0, 1, 1,
1.143427, 0.1166187, -0.500165, 0, 0, 0, 1, 1,
1.146055, 1.259745, 1.036765, 0, 0, 0, 1, 1,
1.146805, 0.8900159, -0.2193907, 0, 0, 0, 1, 1,
1.147617, -0.7654666, 2.543975, 0, 0, 0, 1, 1,
1.15267, -1.089857, 0.5920794, 0, 0, 0, 1, 1,
1.159623, 0.5707878, 2.711909, 0, 0, 0, 1, 1,
1.167391, -0.5937969, 0.6612241, 1, 1, 1, 1, 1,
1.172716, -0.6639916, 2.67983, 1, 1, 1, 1, 1,
1.174167, 1.296814, 0.429076, 1, 1, 1, 1, 1,
1.174168, 1.169765, 1.602005, 1, 1, 1, 1, 1,
1.190505, 0.3368877, 0.5880257, 1, 1, 1, 1, 1,
1.190832, 0.9989385, 0.9524814, 1, 1, 1, 1, 1,
1.195346, 1.786488, 0.4139872, 1, 1, 1, 1, 1,
1.197024, 0.3133115, 0.7496196, 1, 1, 1, 1, 1,
1.205183, -0.2354932, 1.590755, 1, 1, 1, 1, 1,
1.206583, -0.8093854, 0.994602, 1, 1, 1, 1, 1,
1.211194, -1.020219, 2.726409, 1, 1, 1, 1, 1,
1.215721, -0.1425693, 2.078366, 1, 1, 1, 1, 1,
1.219278, -0.1144428, 2.036518, 1, 1, 1, 1, 1,
1.220034, -0.8429631, 2.591267, 1, 1, 1, 1, 1,
1.223551, 0.03032154, 0.7390765, 1, 1, 1, 1, 1,
1.2303, 1.570411, 0.1310261, 0, 0, 1, 1, 1,
1.236616, 1.349957, 1.236192, 1, 0, 0, 1, 1,
1.239816, -0.608456, 1.55195, 1, 0, 0, 1, 1,
1.244616, -0.1480797, 2.846326, 1, 0, 0, 1, 1,
1.261528, -0.1898224, 1.800236, 1, 0, 0, 1, 1,
1.264996, 0.7275901, 2.363029, 1, 0, 0, 1, 1,
1.274923, -1.000914, 2.893783, 0, 0, 0, 1, 1,
1.293657, -0.08194998, 1.552442, 0, 0, 0, 1, 1,
1.303575, -1.053179, 0.9296048, 0, 0, 0, 1, 1,
1.314096, -0.2848552, 0.8647982, 0, 0, 0, 1, 1,
1.319951, 0.8507859, 1.020746, 0, 0, 0, 1, 1,
1.320844, 0.873018, 0.8919904, 0, 0, 0, 1, 1,
1.327153, 0.5327798, 1.033466, 0, 0, 0, 1, 1,
1.334008, 1.052566, 0.7971692, 1, 1, 1, 1, 1,
1.335229, -0.1868174, 1.385468, 1, 1, 1, 1, 1,
1.34505, 1.131395, 1.29306, 1, 1, 1, 1, 1,
1.349095, -0.6480179, 1.946601, 1, 1, 1, 1, 1,
1.351215, -0.5652287, 2.268092, 1, 1, 1, 1, 1,
1.361881, -1.283018, 3.97773, 1, 1, 1, 1, 1,
1.381733, 0.04930881, 2.382395, 1, 1, 1, 1, 1,
1.390015, 0.5756722, -0.4716315, 1, 1, 1, 1, 1,
1.40547, 0.7723731, 0.3476747, 1, 1, 1, 1, 1,
1.407994, 0.8293716, 2.547494, 1, 1, 1, 1, 1,
1.413061, -0.896503, 1.490056, 1, 1, 1, 1, 1,
1.415523, -0.4118931, 1.705316, 1, 1, 1, 1, 1,
1.420962, 0.2592954, 1.764038, 1, 1, 1, 1, 1,
1.441544, -0.7502888, 1.575713, 1, 1, 1, 1, 1,
1.447486, 1.363397, 0.8189211, 1, 1, 1, 1, 1,
1.451958, 0.9334554, 1.42358, 0, 0, 1, 1, 1,
1.459195, 0.7253394, 0.5618382, 1, 0, 0, 1, 1,
1.464478, 0.4689227, 1.784039, 1, 0, 0, 1, 1,
1.466885, -1.484961, 3.502947, 1, 0, 0, 1, 1,
1.477734, -1.421405, 3.188516, 1, 0, 0, 1, 1,
1.478187, -1.454453, 1.661976, 1, 0, 0, 1, 1,
1.489878, 0.568139, 3.138274, 0, 0, 0, 1, 1,
1.492567, -0.8318005, 3.90172, 0, 0, 0, 1, 1,
1.521899, 0.7190503, 0.6971695, 0, 0, 0, 1, 1,
1.539788, -1.863422, 2.636175, 0, 0, 0, 1, 1,
1.540594, -0.8761129, 2.569723, 0, 0, 0, 1, 1,
1.590423, 1.198742, -0.6460996, 0, 0, 0, 1, 1,
1.601724, 0.906208, -0.4560398, 0, 0, 0, 1, 1,
1.605826, 1.524192, 0.8155778, 1, 1, 1, 1, 1,
1.606525, 0.5130989, 1.265836, 1, 1, 1, 1, 1,
1.636698, 0.03241838, 1.118274, 1, 1, 1, 1, 1,
1.637931, 0.4639767, 1.521703, 1, 1, 1, 1, 1,
1.639919, -0.03108081, 2.162552, 1, 1, 1, 1, 1,
1.648112, -0.5929628, 1.901206, 1, 1, 1, 1, 1,
1.654976, -1.34049, 2.842208, 1, 1, 1, 1, 1,
1.65671, -1.012924, 2.448601, 1, 1, 1, 1, 1,
1.689671, -0.08133642, 0.7182249, 1, 1, 1, 1, 1,
1.692139, -0.5171523, 0.5287004, 1, 1, 1, 1, 1,
1.707915, -0.2611165, 1.073584, 1, 1, 1, 1, 1,
1.711216, -0.2726054, 1.87692, 1, 1, 1, 1, 1,
1.717849, -0.5192174, 2.044194, 1, 1, 1, 1, 1,
1.73751, -0.07596335, 1.684405, 1, 1, 1, 1, 1,
1.741597, 0.3321669, 2.841898, 1, 1, 1, 1, 1,
1.747831, 1.331326, 0.3027965, 0, 0, 1, 1, 1,
1.756433, 0.1801582, 1.24439, 1, 0, 0, 1, 1,
1.797893, 0.04860244, 1.347026, 1, 0, 0, 1, 1,
1.819704, 1.369779, 1.107647, 1, 0, 0, 1, 1,
1.826851, -0.7402603, 0.4582064, 1, 0, 0, 1, 1,
1.829293, 0.7023848, 0.9434735, 1, 0, 0, 1, 1,
1.854322, -0.8802912, 1.931151, 0, 0, 0, 1, 1,
1.857585, 0.5161825, 2.278432, 0, 0, 0, 1, 1,
1.865475, 0.6800201, 2.096356, 0, 0, 0, 1, 1,
1.86736, 0.9521111, 1.825377, 0, 0, 0, 1, 1,
1.885985, -0.6729994, 1.552345, 0, 0, 0, 1, 1,
1.902727, -0.2701235, 2.344306, 0, 0, 0, 1, 1,
1.917049, 0.231041, 0.6427013, 0, 0, 0, 1, 1,
1.924751, -0.1881572, 1.136523, 1, 1, 1, 1, 1,
1.925531, -0.6415958, 2.44245, 1, 1, 1, 1, 1,
1.931693, 0.5590011, 0.687364, 1, 1, 1, 1, 1,
1.971975, 0.04467937, 1.843076, 1, 1, 1, 1, 1,
1.982817, -0.5953625, 2.234742, 1, 1, 1, 1, 1,
1.992148, 0.1157829, 1.080616, 1, 1, 1, 1, 1,
1.995744, 0.3628394, 2.975542, 1, 1, 1, 1, 1,
2.016641, -1.014668, 1.66724, 1, 1, 1, 1, 1,
2.017426, 0.2901811, -0.3862106, 1, 1, 1, 1, 1,
2.028809, 2.028442, 1.283774, 1, 1, 1, 1, 1,
2.046201, 0.3784884, 2.234692, 1, 1, 1, 1, 1,
2.053571, 0.5482142, 0.09840664, 1, 1, 1, 1, 1,
2.06998, 1.022657, 0.4229842, 1, 1, 1, 1, 1,
2.079234, -0.1886982, 3.067175, 1, 1, 1, 1, 1,
2.101932, 0.5980492, 0.4187628, 1, 1, 1, 1, 1,
2.111784, 0.6592465, 0.3243549, 0, 0, 1, 1, 1,
2.124548, 0.3483363, 2.449951, 1, 0, 0, 1, 1,
2.129261, 0.5903811, -0.1435957, 1, 0, 0, 1, 1,
2.158194, 0.4822037, 0.6440483, 1, 0, 0, 1, 1,
2.175888, 0.3172081, 2.436129, 1, 0, 0, 1, 1,
2.179804, 0.1244216, 2.280992, 1, 0, 0, 1, 1,
2.184508, -2.808799, 1.552855, 0, 0, 0, 1, 1,
2.230465, -0.687056, 0.9813444, 0, 0, 0, 1, 1,
2.236246, 0.1737544, 1.494505, 0, 0, 0, 1, 1,
2.249909, 0.8188401, 0.8751955, 0, 0, 0, 1, 1,
2.268171, 0.398419, 1.495396, 0, 0, 0, 1, 1,
2.283077, -0.6805527, 2.901819, 0, 0, 0, 1, 1,
2.413963, -0.1931431, 1.35431, 0, 0, 0, 1, 1,
2.439542, 0.8141615, 3.091051, 1, 1, 1, 1, 1,
2.459487, -0.1236935, 0.2989471, 1, 1, 1, 1, 1,
2.609263, -1.207323, 0.9652796, 1, 1, 1, 1, 1,
2.619293, 0.4083373, 2.086474, 1, 1, 1, 1, 1,
2.706669, -0.5033038, 1.670583, 1, 1, 1, 1, 1,
2.71014, 0.1810863, 0.7033595, 1, 1, 1, 1, 1,
3.159363, -0.6640319, 1.898435, 1, 1, 1, 1, 1
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
var radius = 9.762873;
var distance = 34.29168;
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
mvMatrix.translate( -0.1453612, 0.04366374, 0.2467928 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.29168);
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
