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
-3.416867, -1.504401, -2.298233, 1, 0, 0, 1,
-2.823123, 1.02319, -2.278145, 1, 0.007843138, 0, 1,
-2.733295, -0.3157119, -1.27431, 1, 0.01176471, 0, 1,
-2.686583, -0.4894794, -2.21726, 1, 0.01960784, 0, 1,
-2.684135, -1.374785, -1.883732, 1, 0.02352941, 0, 1,
-2.628858, 0.7253066, -0.4031405, 1, 0.03137255, 0, 1,
-2.609832, -1.140579, -2.253532, 1, 0.03529412, 0, 1,
-2.598473, 0.7968055, -1.184397, 1, 0.04313726, 0, 1,
-2.459228, -0.4008009, -0.7560692, 1, 0.04705882, 0, 1,
-2.391694, -0.6377277, 0.3574691, 1, 0.05490196, 0, 1,
-2.386978, -1.791652, -2.354869, 1, 0.05882353, 0, 1,
-2.365904, -0.5850288, -2.103512, 1, 0.06666667, 0, 1,
-2.355237, -1.088641, -1.535517, 1, 0.07058824, 0, 1,
-2.317451, -1.512668, -2.713759, 1, 0.07843138, 0, 1,
-2.298276, -2.409159, -2.811911, 1, 0.08235294, 0, 1,
-2.251478, -0.9363702, -1.933922, 1, 0.09019608, 0, 1,
-2.184242, -0.3523311, -1.039715, 1, 0.09411765, 0, 1,
-2.150384, 1.425573, -0.2388051, 1, 0.1019608, 0, 1,
-2.144601, -1.497635, -3.489151, 1, 0.1098039, 0, 1,
-2.120786, 0.1054398, -1.622463, 1, 0.1137255, 0, 1,
-2.085256, -0.7907981, -1.430703, 1, 0.1215686, 0, 1,
-2.072278, 1.188477, -0.292811, 1, 0.1254902, 0, 1,
-2.038898, 0.1120259, -1.766916, 1, 0.1333333, 0, 1,
-2.018016, 0.2379557, -2.545115, 1, 0.1372549, 0, 1,
-1.998972, -0.05687876, -1.15566, 1, 0.145098, 0, 1,
-1.997668, -0.4430721, -2.030755, 1, 0.1490196, 0, 1,
-1.960376, 0.3964558, -0.7584339, 1, 0.1568628, 0, 1,
-1.934067, 0.95236, 0.5145006, 1, 0.1607843, 0, 1,
-1.916866, -0.2533545, -1.595419, 1, 0.1686275, 0, 1,
-1.913246, 0.9900787, 0.4559676, 1, 0.172549, 0, 1,
-1.911696, -0.6857787, -2.386297, 1, 0.1803922, 0, 1,
-1.877411, -0.7512448, -2.281686, 1, 0.1843137, 0, 1,
-1.857908, 0.5663752, -2.211145, 1, 0.1921569, 0, 1,
-1.848074, -0.5513107, -2.215696, 1, 0.1960784, 0, 1,
-1.832412, -0.5540004, -2.637957, 1, 0.2039216, 0, 1,
-1.80446, -1.118492, -1.628267, 1, 0.2117647, 0, 1,
-1.785164, -0.5148139, -1.677721, 1, 0.2156863, 0, 1,
-1.771373, 0.7527723, -0.3124837, 1, 0.2235294, 0, 1,
-1.768657, -0.5332684, -1.660507, 1, 0.227451, 0, 1,
-1.76263, 0.5132685, -1.479487, 1, 0.2352941, 0, 1,
-1.751164, -1.09073, -3.067917, 1, 0.2392157, 0, 1,
-1.728989, -0.4707709, -3.210361, 1, 0.2470588, 0, 1,
-1.724084, 0.1187005, -2.359634, 1, 0.2509804, 0, 1,
-1.721627, -1.650571, -0.8895889, 1, 0.2588235, 0, 1,
-1.702891, -0.2983919, -0.9971108, 1, 0.2627451, 0, 1,
-1.694541, -0.2457453, 0.03413951, 1, 0.2705882, 0, 1,
-1.689093, 1.195162, -0.7827209, 1, 0.2745098, 0, 1,
-1.681784, 1.458222, -0.3067431, 1, 0.282353, 0, 1,
-1.667539, -0.08100668, -0.8986142, 1, 0.2862745, 0, 1,
-1.64717, -1.693219, -1.63543, 1, 0.2941177, 0, 1,
-1.635237, -0.9257053, -2.349509, 1, 0.3019608, 0, 1,
-1.633355, 0.5925654, -1.37885, 1, 0.3058824, 0, 1,
-1.630916, 0.0402006, -3.527914, 1, 0.3137255, 0, 1,
-1.605893, -0.2498335, 0.2497898, 1, 0.3176471, 0, 1,
-1.602449, -0.2040274, -3.368364, 1, 0.3254902, 0, 1,
-1.595992, 1.023944, -0.6758676, 1, 0.3294118, 0, 1,
-1.576854, -0.3139573, -3.487602, 1, 0.3372549, 0, 1,
-1.568554, 1.474955, -1.020769, 1, 0.3411765, 0, 1,
-1.561185, -0.5407354, -1.864093, 1, 0.3490196, 0, 1,
-1.549635, -0.05263015, -1.312525, 1, 0.3529412, 0, 1,
-1.54553, -0.8698467, -1.124962, 1, 0.3607843, 0, 1,
-1.540132, -0.7491387, -3.111348, 1, 0.3647059, 0, 1,
-1.529846, 0.4617767, -1.289995, 1, 0.372549, 0, 1,
-1.519268, 0.16592, -2.718574, 1, 0.3764706, 0, 1,
-1.504089, -0.233627, -2.232468, 1, 0.3843137, 0, 1,
-1.499153, 0.3525212, 0.2371754, 1, 0.3882353, 0, 1,
-1.498518, -2.245028, -2.287429, 1, 0.3960784, 0, 1,
-1.496037, -1.514772, -1.812976, 1, 0.4039216, 0, 1,
-1.478564, 0.6638475, -2.479774, 1, 0.4078431, 0, 1,
-1.472353, 2.634353, -1.486799, 1, 0.4156863, 0, 1,
-1.456716, -0.4799115, -1.994318, 1, 0.4196078, 0, 1,
-1.448579, 0.6591488, -1.451626, 1, 0.427451, 0, 1,
-1.443057, 1.102603, -1.250701, 1, 0.4313726, 0, 1,
-1.440369, -0.3169761, -1.26262, 1, 0.4392157, 0, 1,
-1.433379, -0.9625223, -3.527166, 1, 0.4431373, 0, 1,
-1.42915, -3.268366, -2.998647, 1, 0.4509804, 0, 1,
-1.424879, 0.9591533, -0.2856765, 1, 0.454902, 0, 1,
-1.424493, 0.2827002, 0.9929508, 1, 0.4627451, 0, 1,
-1.419572, 0.6866842, -1.648896, 1, 0.4666667, 0, 1,
-1.41808, -0.040526, -0.9912912, 1, 0.4745098, 0, 1,
-1.415615, -0.9215941, -1.04152, 1, 0.4784314, 0, 1,
-1.413951, 0.6418994, -1.601505, 1, 0.4862745, 0, 1,
-1.410449, 0.00308171, -3.003948, 1, 0.4901961, 0, 1,
-1.409193, 1.005649, 0.3508623, 1, 0.4980392, 0, 1,
-1.399043, 0.01048698, -3.095648, 1, 0.5058824, 0, 1,
-1.398794, -0.7108009, -0.521365, 1, 0.509804, 0, 1,
-1.391912, -0.512632, -0.6403497, 1, 0.5176471, 0, 1,
-1.386322, -0.02109515, -3.438794, 1, 0.5215687, 0, 1,
-1.382331, 0.9913821, -1.022378, 1, 0.5294118, 0, 1,
-1.381025, 0.6535459, 0.2534305, 1, 0.5333334, 0, 1,
-1.366341, 2.053687, -2.32369, 1, 0.5411765, 0, 1,
-1.357138, 0.1242512, -1.183409, 1, 0.5450981, 0, 1,
-1.348962, 0.2467896, -1.111352, 1, 0.5529412, 0, 1,
-1.344563, 0.254936, -1.499775, 1, 0.5568628, 0, 1,
-1.33725, 1.663862, -1.767524, 1, 0.5647059, 0, 1,
-1.317381, 0.2320485, -2.795455, 1, 0.5686275, 0, 1,
-1.31056, -0.5904256, -2.431751, 1, 0.5764706, 0, 1,
-1.309152, 0.6671005, -0.8452002, 1, 0.5803922, 0, 1,
-1.308556, 0.9789636, 0.4556645, 1, 0.5882353, 0, 1,
-1.30778, 1.374176, 0.3589714, 1, 0.5921569, 0, 1,
-1.302412, -0.3635762, -1.962871, 1, 0.6, 0, 1,
-1.294728, 0.7246891, 0.04144309, 1, 0.6078432, 0, 1,
-1.293568, 0.6927085, -0.7875915, 1, 0.6117647, 0, 1,
-1.282824, -0.1148864, 0.2407213, 1, 0.6196079, 0, 1,
-1.279103, -2.40202, -2.523359, 1, 0.6235294, 0, 1,
-1.273547, -0.8969476, -3.372156, 1, 0.6313726, 0, 1,
-1.267192, 1.203925, -2.150037, 1, 0.6352941, 0, 1,
-1.235627, 0.1456103, -0.8524668, 1, 0.6431373, 0, 1,
-1.234496, 1.845254, -0.4579414, 1, 0.6470588, 0, 1,
-1.221933, 0.3558193, -1.623498, 1, 0.654902, 0, 1,
-1.22154, -1.030357, -2.623416, 1, 0.6588235, 0, 1,
-1.214573, -0.1026335, -1.515988, 1, 0.6666667, 0, 1,
-1.169798, 0.7591326, -0.02298241, 1, 0.6705883, 0, 1,
-1.169287, 0.819868, -0.805871, 1, 0.6784314, 0, 1,
-1.161366, -0.8480101, -0.4645322, 1, 0.682353, 0, 1,
-1.154589, 1.346745, -1.098011, 1, 0.6901961, 0, 1,
-1.150849, -2.337686, -2.697421, 1, 0.6941177, 0, 1,
-1.150412, -0.810648, -1.699529, 1, 0.7019608, 0, 1,
-1.145432, -0.4866979, -2.084083, 1, 0.7098039, 0, 1,
-1.144383, -0.2713793, -0.1672979, 1, 0.7137255, 0, 1,
-1.129766, -0.4152278, -2.666478, 1, 0.7215686, 0, 1,
-1.128069, -2.499504, -3.657034, 1, 0.7254902, 0, 1,
-1.115795, 0.1842367, 0.8021716, 1, 0.7333333, 0, 1,
-1.109773, -0.3265542, -2.795951, 1, 0.7372549, 0, 1,
-1.102958, 0.4837909, -2.934532, 1, 0.7450981, 0, 1,
-1.101037, -1.191822, -3.070504, 1, 0.7490196, 0, 1,
-1.091937, -1.680408, -2.557686, 1, 0.7568628, 0, 1,
-1.088454, 1.005059, -0.0175554, 1, 0.7607843, 0, 1,
-1.086939, 0.06988961, -3.735246, 1, 0.7686275, 0, 1,
-1.086402, -0.2435426, -2.410708, 1, 0.772549, 0, 1,
-1.079716, -1.589544, -1.035144, 1, 0.7803922, 0, 1,
-1.076913, 0.1364074, -3.170339, 1, 0.7843137, 0, 1,
-1.076422, -0.7431413, -2.002849, 1, 0.7921569, 0, 1,
-1.062695, -0.0690282, -1.830801, 1, 0.7960784, 0, 1,
-1.057275, 1.531218, -0.3783655, 1, 0.8039216, 0, 1,
-1.04856, 1.845927, -0.2848824, 1, 0.8117647, 0, 1,
-1.040715, 0.9319044, -0.9016628, 1, 0.8156863, 0, 1,
-1.039305, -2.258821, -0.9792138, 1, 0.8235294, 0, 1,
-1.037782, 0.6606191, -1.238383, 1, 0.827451, 0, 1,
-1.034611, 2.415792, 0.8931729, 1, 0.8352941, 0, 1,
-1.032476, 1.038445, -1.184682, 1, 0.8392157, 0, 1,
-1.023334, 0.7123824, -1.378365, 1, 0.8470588, 0, 1,
-1.021603, 2.030588, -1.125731, 1, 0.8509804, 0, 1,
-1.020447, -0.06389094, -2.22568, 1, 0.8588235, 0, 1,
-1.013299, -0.02865717, -2.466799, 1, 0.8627451, 0, 1,
-1.011994, -0.8856124, -2.5099, 1, 0.8705882, 0, 1,
-1.00923, 1.469818, -0.7115425, 1, 0.8745098, 0, 1,
-1.008593, 0.5466861, -1.747671, 1, 0.8823529, 0, 1,
-1.008158, 0.6296601, -1.734249, 1, 0.8862745, 0, 1,
-1.007406, 0.9807979, -1.603525, 1, 0.8941177, 0, 1,
-0.999948, -0.8297147, -2.649552, 1, 0.8980392, 0, 1,
-0.9997104, -0.7975644, -3.853082, 1, 0.9058824, 0, 1,
-0.9990005, 2.369716, -1.860483, 1, 0.9137255, 0, 1,
-0.9955554, 0.9420873, -0.7701433, 1, 0.9176471, 0, 1,
-0.9921377, -1.682657, -1.196054, 1, 0.9254902, 0, 1,
-0.9893562, -0.956661, -2.057663, 1, 0.9294118, 0, 1,
-0.985764, -0.4494882, -1.941438, 1, 0.9372549, 0, 1,
-0.9846306, 0.7302019, -0.8598837, 1, 0.9411765, 0, 1,
-0.9805793, -1.156053, -1.951532, 1, 0.9490196, 0, 1,
-0.9717816, -1.405688, -1.943317, 1, 0.9529412, 0, 1,
-0.9683923, -0.5620061, -1.218471, 1, 0.9607843, 0, 1,
-0.966902, 1.621861, 1.025423, 1, 0.9647059, 0, 1,
-0.9659665, -0.5790244, -2.848647, 1, 0.972549, 0, 1,
-0.9645329, 2.94157, -0.621996, 1, 0.9764706, 0, 1,
-0.9601185, -0.1782027, -3.111302, 1, 0.9843137, 0, 1,
-0.9466826, 0.1002006, -0.9144861, 1, 0.9882353, 0, 1,
-0.9306716, 2.644201, -0.8187481, 1, 0.9960784, 0, 1,
-0.9226217, 0.8954872, -0.4266829, 0.9960784, 1, 0, 1,
-0.9163764, -0.03629033, -2.405066, 0.9921569, 1, 0, 1,
-0.9147849, -0.1620951, -3.582907, 0.9843137, 1, 0, 1,
-0.9114745, 0.7140138, -2.996527, 0.9803922, 1, 0, 1,
-0.9094186, -0.08328353, -1.991284, 0.972549, 1, 0, 1,
-0.9084094, 1.530669, -0.7493912, 0.9686275, 1, 0, 1,
-0.9074322, 0.5033938, -1.926375, 0.9607843, 1, 0, 1,
-0.9065547, 0.403063, -2.485173, 0.9568627, 1, 0, 1,
-0.9038195, -0.3122672, -1.915766, 0.9490196, 1, 0, 1,
-0.8992696, 0.3288049, 0.2778537, 0.945098, 1, 0, 1,
-0.8980718, 0.06623309, -2.694036, 0.9372549, 1, 0, 1,
-0.8938307, 0.4726034, -1.646108, 0.9333333, 1, 0, 1,
-0.8926001, 1.598013, 2.592361, 0.9254902, 1, 0, 1,
-0.8899858, -0.4497463, -2.283828, 0.9215686, 1, 0, 1,
-0.8835893, -0.2342957, -3.107811, 0.9137255, 1, 0, 1,
-0.8753173, -1.587312, -1.123712, 0.9098039, 1, 0, 1,
-0.8752823, -1.239322, -3.647674, 0.9019608, 1, 0, 1,
-0.8749734, 2.004504, 1.394252, 0.8941177, 1, 0, 1,
-0.868653, -1.268156, -2.989353, 0.8901961, 1, 0, 1,
-0.8666679, 0.1148649, -2.216221, 0.8823529, 1, 0, 1,
-0.8657295, -1.381546, -2.669896, 0.8784314, 1, 0, 1,
-0.8619752, 1.441268, -0.1573613, 0.8705882, 1, 0, 1,
-0.8618389, -1.390079, -1.673739, 0.8666667, 1, 0, 1,
-0.858659, 1.801337, 0.5310531, 0.8588235, 1, 0, 1,
-0.85616, -0.9546964, -1.465743, 0.854902, 1, 0, 1,
-0.8543835, -1.231927, -3.547011, 0.8470588, 1, 0, 1,
-0.8389689, 0.1096696, -3.192393, 0.8431373, 1, 0, 1,
-0.8299799, 0.9388173, -1.9102, 0.8352941, 1, 0, 1,
-0.8259168, -1.419164, -1.184016, 0.8313726, 1, 0, 1,
-0.825661, 0.287181, -2.132577, 0.8235294, 1, 0, 1,
-0.8180801, -0.5163683, -0.9549055, 0.8196079, 1, 0, 1,
-0.8046086, -1.463444, -2.162736, 0.8117647, 1, 0, 1,
-0.8031627, -0.1237966, -2.115808, 0.8078431, 1, 0, 1,
-0.80206, -2.249675, -2.947418, 0.8, 1, 0, 1,
-0.8016926, -1.192728, -1.188901, 0.7921569, 1, 0, 1,
-0.8008938, 1.143273, 0.724916, 0.7882353, 1, 0, 1,
-0.7974181, 0.7983388, 1.222641, 0.7803922, 1, 0, 1,
-0.7951543, -1.155817, -2.497545, 0.7764706, 1, 0, 1,
-0.7946753, -0.4402907, -2.23067, 0.7686275, 1, 0, 1,
-0.7891521, -1.003047, -2.184789, 0.7647059, 1, 0, 1,
-0.7872162, 0.5529698, -0.955975, 0.7568628, 1, 0, 1,
-0.7858257, -1.315711, -1.58246, 0.7529412, 1, 0, 1,
-0.785442, -0.4162776, -4.203755, 0.7450981, 1, 0, 1,
-0.779682, -0.8084088, -4.660644, 0.7411765, 1, 0, 1,
-0.7785771, -0.7149373, -1.02752, 0.7333333, 1, 0, 1,
-0.7758073, 1.21293, -0.1215429, 0.7294118, 1, 0, 1,
-0.7683803, -0.6326176, -4.836653, 0.7215686, 1, 0, 1,
-0.7655467, 0.2540842, -2.19184, 0.7176471, 1, 0, 1,
-0.7651374, -2.993445, -2.045129, 0.7098039, 1, 0, 1,
-0.7650961, 0.3683878, -1.043592, 0.7058824, 1, 0, 1,
-0.7625725, -2.185115, -1.622689, 0.6980392, 1, 0, 1,
-0.7620205, -1.267694, -1.431772, 0.6901961, 1, 0, 1,
-0.7589979, 0.28828, -1.416964, 0.6862745, 1, 0, 1,
-0.7500011, 0.2966681, -1.279591, 0.6784314, 1, 0, 1,
-0.7499588, 2.174274, 0.911972, 0.6745098, 1, 0, 1,
-0.7488658, -0.6491878, -2.648181, 0.6666667, 1, 0, 1,
-0.7482594, -0.7189047, -3.464366, 0.6627451, 1, 0, 1,
-0.7464912, 0.1167745, 0.4118401, 0.654902, 1, 0, 1,
-0.7440804, -0.5772028, -0.9470316, 0.6509804, 1, 0, 1,
-0.7427013, -0.1277401, -2.459181, 0.6431373, 1, 0, 1,
-0.7410657, 0.3745177, -0.8279631, 0.6392157, 1, 0, 1,
-0.7374211, 0.477449, 0.4629626, 0.6313726, 1, 0, 1,
-0.7351859, 0.5246336, -2.634569, 0.627451, 1, 0, 1,
-0.7344462, -0.008781235, -1.259964, 0.6196079, 1, 0, 1,
-0.7331584, -0.3464464, -2.023512, 0.6156863, 1, 0, 1,
-0.7301336, 0.5885981, -1.461466, 0.6078432, 1, 0, 1,
-0.7293404, -0.2387218, -2.732782, 0.6039216, 1, 0, 1,
-0.7197351, -0.4560913, -2.769935, 0.5960785, 1, 0, 1,
-0.7191622, 0.6482756, -3.649719, 0.5882353, 1, 0, 1,
-0.714116, 0.1259173, -1.156629, 0.5843138, 1, 0, 1,
-0.708997, -1.301613, -3.237199, 0.5764706, 1, 0, 1,
-0.7075199, -0.9319046, -1.405221, 0.572549, 1, 0, 1,
-0.7003154, 0.1672863, -0.9475111, 0.5647059, 1, 0, 1,
-0.699588, 0.5522546, -1.118685, 0.5607843, 1, 0, 1,
-0.6983911, 0.8222973, 0.195125, 0.5529412, 1, 0, 1,
-0.6874802, 0.002884154, -0.3861499, 0.5490196, 1, 0, 1,
-0.6869552, 0.4560977, -0.07766828, 0.5411765, 1, 0, 1,
-0.6867294, -1.13746, -2.855224, 0.5372549, 1, 0, 1,
-0.6850294, 0.4622427, -0.3966496, 0.5294118, 1, 0, 1,
-0.6820464, -1.272097, -3.282081, 0.5254902, 1, 0, 1,
-0.6767412, -0.01085349, -1.313039, 0.5176471, 1, 0, 1,
-0.6766068, 2.92907, -1.54142, 0.5137255, 1, 0, 1,
-0.6758579, -1.457407, -1.835974, 0.5058824, 1, 0, 1,
-0.666198, -1.289116, -2.317967, 0.5019608, 1, 0, 1,
-0.6616563, 0.6599688, 0.7744135, 0.4941176, 1, 0, 1,
-0.6579423, -0.7067824, -3.712265, 0.4862745, 1, 0, 1,
-0.655799, -0.6277597, -3.309163, 0.4823529, 1, 0, 1,
-0.6502693, -1.503389, -3.37362, 0.4745098, 1, 0, 1,
-0.6455957, -0.0596498, -1.696335, 0.4705882, 1, 0, 1,
-0.6403964, -0.8093653, -2.207191, 0.4627451, 1, 0, 1,
-0.6312962, -0.3528357, -2.205721, 0.4588235, 1, 0, 1,
-0.628529, 0.1230582, -0.397948, 0.4509804, 1, 0, 1,
-0.6274856, 0.5425963, -0.729681, 0.4470588, 1, 0, 1,
-0.6207595, 1.396446, 0.8321405, 0.4392157, 1, 0, 1,
-0.6183393, -0.1473764, -1.324927, 0.4352941, 1, 0, 1,
-0.6177361, 1.098388, -1.554456, 0.427451, 1, 0, 1,
-0.6139442, 0.7116698, -0.01114879, 0.4235294, 1, 0, 1,
-0.6136495, 0.8908297, -1.561509, 0.4156863, 1, 0, 1,
-0.6133329, 0.1722126, -3.305953, 0.4117647, 1, 0, 1,
-0.6081511, 0.9463683, -0.4105401, 0.4039216, 1, 0, 1,
-0.6062995, -0.4230651, -3.356878, 0.3960784, 1, 0, 1,
-0.6004518, 0.6661502, -2.118634, 0.3921569, 1, 0, 1,
-0.5998921, 0.2718697, -2.094147, 0.3843137, 1, 0, 1,
-0.5968974, 0.1320687, -1.85393, 0.3803922, 1, 0, 1,
-0.591301, -2.054352, -2.15733, 0.372549, 1, 0, 1,
-0.5869126, -0.8836806, -3.729176, 0.3686275, 1, 0, 1,
-0.5868732, 2.012954, 0.5208511, 0.3607843, 1, 0, 1,
-0.5848678, 0.8696221, -0.372704, 0.3568628, 1, 0, 1,
-0.574654, 0.2874841, -1.833331, 0.3490196, 1, 0, 1,
-0.5723534, -0.1948237, -1.370229, 0.345098, 1, 0, 1,
-0.5721888, 0.02323505, -1.756864, 0.3372549, 1, 0, 1,
-0.5691894, -0.01572529, -3.138468, 0.3333333, 1, 0, 1,
-0.5662526, -1.601311, -3.208082, 0.3254902, 1, 0, 1,
-0.5649726, -0.6348888, -1.208786, 0.3215686, 1, 0, 1,
-0.5636269, 0.4278109, -0.03672076, 0.3137255, 1, 0, 1,
-0.5625225, -0.1818192, -0.8156617, 0.3098039, 1, 0, 1,
-0.5568039, -0.5306542, -1.459581, 0.3019608, 1, 0, 1,
-0.5543762, 1.063499, -3.445961, 0.2941177, 1, 0, 1,
-0.5525565, -1.714509, -2.075858, 0.2901961, 1, 0, 1,
-0.5511132, -1.417705, -3.699064, 0.282353, 1, 0, 1,
-0.5499413, -0.4517343, -1.45452, 0.2784314, 1, 0, 1,
-0.5484332, -1.724548, -1.805794, 0.2705882, 1, 0, 1,
-0.544822, -0.4070551, -2.596126, 0.2666667, 1, 0, 1,
-0.5372069, 0.6941111, -2.44995, 0.2588235, 1, 0, 1,
-0.5362182, -0.2141692, -2.291603, 0.254902, 1, 0, 1,
-0.5342169, 0.2666336, -1.493828, 0.2470588, 1, 0, 1,
-0.5291466, -0.3940991, -1.99272, 0.2431373, 1, 0, 1,
-0.5286471, -0.1869264, -1.074108, 0.2352941, 1, 0, 1,
-0.5262555, 0.8912262, -0.8933229, 0.2313726, 1, 0, 1,
-0.5251818, -0.537564, -3.076936, 0.2235294, 1, 0, 1,
-0.5245555, 0.4209239, 0.8178907, 0.2196078, 1, 0, 1,
-0.5230091, -1.100507, -3.006477, 0.2117647, 1, 0, 1,
-0.5182574, 1.037968, -0.1603339, 0.2078431, 1, 0, 1,
-0.5176812, 0.1727262, -0.07765735, 0.2, 1, 0, 1,
-0.5125272, -1.046395, -1.820667, 0.1921569, 1, 0, 1,
-0.5067959, -0.4393675, -2.174028, 0.1882353, 1, 0, 1,
-0.5067899, -0.003503599, -1.069038, 0.1803922, 1, 0, 1,
-0.5046516, 1.738563, -0.4680325, 0.1764706, 1, 0, 1,
-0.5041335, 0.8991814, 0.03234103, 0.1686275, 1, 0, 1,
-0.5027418, -1.332973, -3.343497, 0.1647059, 1, 0, 1,
-0.4975959, 0.359295, -0.5713948, 0.1568628, 1, 0, 1,
-0.4937324, 0.4495499, -2.386185, 0.1529412, 1, 0, 1,
-0.4929831, 1.818274, -0.2358401, 0.145098, 1, 0, 1,
-0.4926271, -1.006552, -2.824039, 0.1411765, 1, 0, 1,
-0.491308, -1.050048, -4.269726, 0.1333333, 1, 0, 1,
-0.4877017, -0.117863, -0.9735235, 0.1294118, 1, 0, 1,
-0.4843751, -0.02827601, -1.591842, 0.1215686, 1, 0, 1,
-0.4841144, 1.766649, -1.963626, 0.1176471, 1, 0, 1,
-0.4779636, 1.597354, 0.5106874, 0.1098039, 1, 0, 1,
-0.4690436, -0.5604707, -3.477092, 0.1058824, 1, 0, 1,
-0.46544, -1.927086, -2.218061, 0.09803922, 1, 0, 1,
-0.463891, 0.5850642, -0.4849412, 0.09019608, 1, 0, 1,
-0.4632849, 1.081552, -0.5870569, 0.08627451, 1, 0, 1,
-0.461362, 1.136338, -0.1877628, 0.07843138, 1, 0, 1,
-0.4546452, -1.879758, -3.448623, 0.07450981, 1, 0, 1,
-0.4474207, 0.8772535, 0.2582813, 0.06666667, 1, 0, 1,
-0.4433425, -0.3388495, -1.763331, 0.0627451, 1, 0, 1,
-0.44196, -0.3063059, -2.216448, 0.05490196, 1, 0, 1,
-0.440341, 0.6765497, -0.5205345, 0.05098039, 1, 0, 1,
-0.4398663, 0.02957223, -1.660795, 0.04313726, 1, 0, 1,
-0.4394631, -1.91394, -2.640422, 0.03921569, 1, 0, 1,
-0.4253775, 0.09643184, -3.730977, 0.03137255, 1, 0, 1,
-0.4232835, -0.6601745, -2.718805, 0.02745098, 1, 0, 1,
-0.4136898, 0.2787929, -1.185304, 0.01960784, 1, 0, 1,
-0.4119019, -0.702504, -2.019012, 0.01568628, 1, 0, 1,
-0.4116209, -0.7655226, -3.128657, 0.007843138, 1, 0, 1,
-0.4025934, -0.8289702, -3.091519, 0.003921569, 1, 0, 1,
-0.3995763, -1.125722, -1.969624, 0, 1, 0.003921569, 1,
-0.3984274, 0.4679186, -0.672074, 0, 1, 0.01176471, 1,
-0.3957053, 0.8279015, -1.317931, 0, 1, 0.01568628, 1,
-0.395458, 0.872642, 0.5174153, 0, 1, 0.02352941, 1,
-0.394456, -1.084539, -1.02479, 0, 1, 0.02745098, 1,
-0.3939054, -0.1027584, -1.541928, 0, 1, 0.03529412, 1,
-0.3866792, -0.3726684, -1.586487, 0, 1, 0.03921569, 1,
-0.3852273, 0.3072152, 0.2389199, 0, 1, 0.04705882, 1,
-0.3842793, 1.862997, -0.8598048, 0, 1, 0.05098039, 1,
-0.3792444, 0.3391749, -1.126857, 0, 1, 0.05882353, 1,
-0.3783168, 0.2795894, -1.091075, 0, 1, 0.0627451, 1,
-0.3782694, -1.596366, -3.127599, 0, 1, 0.07058824, 1,
-0.3760266, -0.7413884, -4.35304, 0, 1, 0.07450981, 1,
-0.375629, -0.8468142, -3.147483, 0, 1, 0.08235294, 1,
-0.373924, -1.587377, -2.771151, 0, 1, 0.08627451, 1,
-0.3699037, 0.2538236, -1.058208, 0, 1, 0.09411765, 1,
-0.3675256, 0.6025583, -1.039364, 0, 1, 0.1019608, 1,
-0.3648195, -0.110093, -1.766972, 0, 1, 0.1058824, 1,
-0.3583449, 0.1306686, -0.426867, 0, 1, 0.1137255, 1,
-0.3565036, -0.6005654, -2.126748, 0, 1, 0.1176471, 1,
-0.3548901, 1.893893, -1.652263, 0, 1, 0.1254902, 1,
-0.353389, 0.8563094, -1.479779, 0, 1, 0.1294118, 1,
-0.3530716, 1.395854, -1.307149, 0, 1, 0.1372549, 1,
-0.3521131, -0.2795573, -2.0987, 0, 1, 0.1411765, 1,
-0.3509265, 1.081036, -1.626759, 0, 1, 0.1490196, 1,
-0.3484532, 0.2443582, -1.758852, 0, 1, 0.1529412, 1,
-0.3433301, 1.124411, -1.241354, 0, 1, 0.1607843, 1,
-0.3423488, 0.03475035, -0.4444033, 0, 1, 0.1647059, 1,
-0.3393061, -0.5447699, -2.745118, 0, 1, 0.172549, 1,
-0.336731, 1.570675, 0.2116996, 0, 1, 0.1764706, 1,
-0.3357175, 0.8017572, -0.1800455, 0, 1, 0.1843137, 1,
-0.3350856, -0.5831388, -4.159136, 0, 1, 0.1882353, 1,
-0.3343928, 0.2928259, -0.2357495, 0, 1, 0.1960784, 1,
-0.332433, 0.7945973, -0.7874225, 0, 1, 0.2039216, 1,
-0.3163479, 0.7497314, 0.1606038, 0, 1, 0.2078431, 1,
-0.3153495, -0.6515644, -2.153102, 0, 1, 0.2156863, 1,
-0.3113434, 0.6723647, -0.7664891, 0, 1, 0.2196078, 1,
-0.3101638, -0.6274887, -3.204267, 0, 1, 0.227451, 1,
-0.3052686, -0.9742153, -1.807463, 0, 1, 0.2313726, 1,
-0.304979, 1.19135, -0.2424034, 0, 1, 0.2392157, 1,
-0.3049545, -0.4882388, -1.938485, 0, 1, 0.2431373, 1,
-0.2981825, -0.3706953, -2.968626, 0, 1, 0.2509804, 1,
-0.2904344, 0.3603966, -2.795597, 0, 1, 0.254902, 1,
-0.2897735, -0.1289771, -1.378305, 0, 1, 0.2627451, 1,
-0.2892311, -1.2492, -4.16906, 0, 1, 0.2666667, 1,
-0.2867923, -0.3031339, -2.047074, 0, 1, 0.2745098, 1,
-0.2862325, -1.046154, -2.793833, 0, 1, 0.2784314, 1,
-0.2831206, -1.384091, -3.815545, 0, 1, 0.2862745, 1,
-0.2819138, 0.4725724, -1.216364, 0, 1, 0.2901961, 1,
-0.2765117, -0.739942, -4.171916, 0, 1, 0.2980392, 1,
-0.2756228, -2.458766, -2.745483, 0, 1, 0.3058824, 1,
-0.2725578, -2.287501, -3.347174, 0, 1, 0.3098039, 1,
-0.2720375, -0.6361595, -2.327259, 0, 1, 0.3176471, 1,
-0.2688141, -0.8225737, -3.314974, 0, 1, 0.3215686, 1,
-0.2678663, 0.1919758, -1.400508, 0, 1, 0.3294118, 1,
-0.2660358, 1.861382, 0.6065938, 0, 1, 0.3333333, 1,
-0.2618637, 0.3776861, -2.329043, 0, 1, 0.3411765, 1,
-0.2600913, 1.683107, 0.8958544, 0, 1, 0.345098, 1,
-0.2596525, -1.469309, -1.861597, 0, 1, 0.3529412, 1,
-0.2587578, -0.1644213, -1.462646, 0, 1, 0.3568628, 1,
-0.2583938, 0.4508981, -0.04741714, 0, 1, 0.3647059, 1,
-0.2583015, 0.2458595, -1.851158, 0, 1, 0.3686275, 1,
-0.256925, 0.6687645, -1.140993, 0, 1, 0.3764706, 1,
-0.2555691, -0.4665998, -2.431746, 0, 1, 0.3803922, 1,
-0.2491375, 0.1565906, -0.6712503, 0, 1, 0.3882353, 1,
-0.2483238, 1.215114, 2.533557, 0, 1, 0.3921569, 1,
-0.2474857, -0.750398, -4.420479, 0, 1, 0.4, 1,
-0.2471397, -1.384317, -3.177773, 0, 1, 0.4078431, 1,
-0.2441257, -1.264658, -3.825556, 0, 1, 0.4117647, 1,
-0.2438943, -1.39172, -3.197854, 0, 1, 0.4196078, 1,
-0.2368121, -0.8567593, -2.446732, 0, 1, 0.4235294, 1,
-0.2361099, -0.3173292, -2.613472, 0, 1, 0.4313726, 1,
-0.2348673, -0.7676476, -3.267731, 0, 1, 0.4352941, 1,
-0.2337677, 0.5967613, -0.9636742, 0, 1, 0.4431373, 1,
-0.2328569, 0.1860438, -2.377592, 0, 1, 0.4470588, 1,
-0.2314022, -0.5141385, -3.951001, 0, 1, 0.454902, 1,
-0.2305391, -0.7089055, -1.515882, 0, 1, 0.4588235, 1,
-0.2305256, 3.568005, 0.3144303, 0, 1, 0.4666667, 1,
-0.223521, 0.9203299, -0.03788085, 0, 1, 0.4705882, 1,
-0.2231614, 0.4058824, -0.3604797, 0, 1, 0.4784314, 1,
-0.2190341, -0.7399408, -0.7393284, 0, 1, 0.4823529, 1,
-0.2180962, 0.1636557, -1.623839, 0, 1, 0.4901961, 1,
-0.2178589, -0.9747328, -2.620433, 0, 1, 0.4941176, 1,
-0.2177834, -0.1388107, -1.200219, 0, 1, 0.5019608, 1,
-0.2150386, 1.664981, -0.7806004, 0, 1, 0.509804, 1,
-0.214395, 0.4659275, -0.8600321, 0, 1, 0.5137255, 1,
-0.2137554, 0.2537335, -0.1885114, 0, 1, 0.5215687, 1,
-0.2127005, 0.04026495, -2.951263, 0, 1, 0.5254902, 1,
-0.2112597, 0.545332, -0.2406373, 0, 1, 0.5333334, 1,
-0.2098367, 0.3892923, -0.8085079, 0, 1, 0.5372549, 1,
-0.2097961, 0.6711371, -1.021672, 0, 1, 0.5450981, 1,
-0.2094596, 0.3406978, 0.1858824, 0, 1, 0.5490196, 1,
-0.2086433, 0.6213329, 1.529162, 0, 1, 0.5568628, 1,
-0.206985, -0.4017368, -2.411458, 0, 1, 0.5607843, 1,
-0.2023554, 0.1790433, -0.5424364, 0, 1, 0.5686275, 1,
-0.2001061, -1.492494, -3.523989, 0, 1, 0.572549, 1,
-0.1989513, 0.9753633, -1.295332, 0, 1, 0.5803922, 1,
-0.1971124, 1.485049, -2.123933, 0, 1, 0.5843138, 1,
-0.1937524, 1.478482, 1.528873, 0, 1, 0.5921569, 1,
-0.1892229, -1.943491, -4.533593, 0, 1, 0.5960785, 1,
-0.1887126, 0.1226991, -1.637668, 0, 1, 0.6039216, 1,
-0.1874247, -0.02806337, -0.719725, 0, 1, 0.6117647, 1,
-0.1849946, -0.3885629, -3.437169, 0, 1, 0.6156863, 1,
-0.1840665, -0.8487799, -3.550967, 0, 1, 0.6235294, 1,
-0.1792746, 0.2476718, -0.68404, 0, 1, 0.627451, 1,
-0.1755887, -0.340431, -0.9760224, 0, 1, 0.6352941, 1,
-0.1732292, -0.788865, -4.402102, 0, 1, 0.6392157, 1,
-0.1710121, 0.2833796, 0.01808084, 0, 1, 0.6470588, 1,
-0.1700751, 0.2408603, -1.312392, 0, 1, 0.6509804, 1,
-0.1604147, 1.272726, 0.03070375, 0, 1, 0.6588235, 1,
-0.1532059, 1.872748, 1.776063, 0, 1, 0.6627451, 1,
-0.1494549, 0.3267756, 0.1328207, 0, 1, 0.6705883, 1,
-0.1432652, -0.9472861, -2.272623, 0, 1, 0.6745098, 1,
-0.1395975, 1.690571, 0.1364173, 0, 1, 0.682353, 1,
-0.1355942, -1.640284, -3.500333, 0, 1, 0.6862745, 1,
-0.1313819, -0.604006, -3.081552, 0, 1, 0.6941177, 1,
-0.1310737, -0.6784558, -4.107706, 0, 1, 0.7019608, 1,
-0.1280478, -0.6063707, -4.66446, 0, 1, 0.7058824, 1,
-0.1257687, 0.2867427, -0.09861275, 0, 1, 0.7137255, 1,
-0.1241902, 0.09474631, -1.234353, 0, 1, 0.7176471, 1,
-0.1228074, -1.891847, -2.333278, 0, 1, 0.7254902, 1,
-0.1216393, -1.450282, -2.589757, 0, 1, 0.7294118, 1,
-0.118778, -0.8776958, -3.3075, 0, 1, 0.7372549, 1,
-0.1185923, -0.9762661, -1.997621, 0, 1, 0.7411765, 1,
-0.1180146, -1.329686, -3.220645, 0, 1, 0.7490196, 1,
-0.1179903, 0.6757714, 0.03446988, 0, 1, 0.7529412, 1,
-0.1179247, -1.982354, -2.731435, 0, 1, 0.7607843, 1,
-0.1166842, -0.8852987, -3.776094, 0, 1, 0.7647059, 1,
-0.1164953, 1.360922, 0.9050832, 0, 1, 0.772549, 1,
-0.1142652, -0.7195802, -3.273315, 0, 1, 0.7764706, 1,
-0.1138493, 0.08715442, -0.37153, 0, 1, 0.7843137, 1,
-0.1103516, -0.664509, -4.212562, 0, 1, 0.7882353, 1,
-0.1034623, 0.150667, -1.138529, 0, 1, 0.7960784, 1,
-0.1025611, -2.757689, -3.354457, 0, 1, 0.8039216, 1,
-0.09921087, 1.321722, -0.8812562, 0, 1, 0.8078431, 1,
-0.09778952, -0.743378, -3.441791, 0, 1, 0.8156863, 1,
-0.09723423, 1.5544, -0.6985822, 0, 1, 0.8196079, 1,
-0.0962337, -1.291489, -3.390962, 0, 1, 0.827451, 1,
-0.08854844, -0.7742529, -2.036191, 0, 1, 0.8313726, 1,
-0.0850863, 1.66447, 0.6389144, 0, 1, 0.8392157, 1,
-0.08203365, -2.126536, -3.875765, 0, 1, 0.8431373, 1,
-0.0806215, -0.1116439, -2.865191, 0, 1, 0.8509804, 1,
-0.08045188, -0.6942641, -3.563548, 0, 1, 0.854902, 1,
-0.06952051, -0.7370325, -1.693806, 0, 1, 0.8627451, 1,
-0.06771766, -1.514099, -3.080632, 0, 1, 0.8666667, 1,
-0.06326335, -0.4259123, -1.961653, 0, 1, 0.8745098, 1,
-0.0613877, 0.143292, -0.7700621, 0, 1, 0.8784314, 1,
-0.05955228, -0.2624171, -2.932501, 0, 1, 0.8862745, 1,
-0.05856009, 0.8335657, 0.156073, 0, 1, 0.8901961, 1,
-0.05492045, 0.981292, -0.5426829, 0, 1, 0.8980392, 1,
-0.05270252, -0.5426442, -4.206775, 0, 1, 0.9058824, 1,
-0.05209611, 1.223317, -1.95259, 0, 1, 0.9098039, 1,
-0.04681619, -0.006538616, -1.541382, 0, 1, 0.9176471, 1,
-0.04276577, -0.8336778, -4.479138, 0, 1, 0.9215686, 1,
-0.03994869, 0.6210562, -0.4537082, 0, 1, 0.9294118, 1,
-0.03931268, 0.2105166, -1.873005, 0, 1, 0.9333333, 1,
-0.0369531, -1.079429, -3.875429, 0, 1, 0.9411765, 1,
-0.03673629, 1.424146, -0.6953666, 0, 1, 0.945098, 1,
-0.03287791, 0.8840308, 0.3887097, 0, 1, 0.9529412, 1,
-0.03281304, -1.00807, -3.462475, 0, 1, 0.9568627, 1,
-0.02868144, 1.608009, -1.942661, 0, 1, 0.9647059, 1,
-0.02865027, 0.9884204, -0.7923203, 0, 1, 0.9686275, 1,
-0.02330846, -2.214525, -3.491988, 0, 1, 0.9764706, 1,
-0.02309226, 0.7500899, 1.080053, 0, 1, 0.9803922, 1,
-0.02284409, -0.5542971, -3.692133, 0, 1, 0.9882353, 1,
-0.02281801, 0.2475292, -0.8211632, 0, 1, 0.9921569, 1,
-0.02115658, -0.1598244, -4.086066, 0, 1, 1, 1,
-0.01911294, -1.19309, -2.487266, 0, 0.9921569, 1, 1,
-0.01775955, 1.090687, 0.5367952, 0, 0.9882353, 1, 1,
-0.01587676, -0.2456524, -2.099023, 0, 0.9803922, 1, 1,
-0.01118697, -0.0652196, -3.291399, 0, 0.9764706, 1, 1,
-0.01000663, -0.1088836, -3.343979, 0, 0.9686275, 1, 1,
-0.007269646, 0.01894657, -0.9277505, 0, 0.9647059, 1, 1,
-0.005672904, -1.925619, -3.731122, 0, 0.9568627, 1, 1,
0.003584431, -0.3293753, 4.561854, 0, 0.9529412, 1, 1,
0.00411458, 0.8972637, 1.050338, 0, 0.945098, 1, 1,
0.004146065, 0.1766867, 0.2073512, 0, 0.9411765, 1, 1,
0.004515687, -0.4548601, 3.120194, 0, 0.9333333, 1, 1,
0.007791154, -1.87894, 3.475688, 0, 0.9294118, 1, 1,
0.01146098, 0.4423548, 0.801593, 0, 0.9215686, 1, 1,
0.01884888, -0.508717, 1.157364, 0, 0.9176471, 1, 1,
0.01975865, 0.9815041, -2.271109, 0, 0.9098039, 1, 1,
0.02021672, 0.300219, -0.1453543, 0, 0.9058824, 1, 1,
0.0240089, 0.8080265, -1.432628, 0, 0.8980392, 1, 1,
0.02663541, -0.4772758, 3.257442, 0, 0.8901961, 1, 1,
0.02784852, 1.083713, -0.99902, 0, 0.8862745, 1, 1,
0.02970813, 0.2353637, -0.5773685, 0, 0.8784314, 1, 1,
0.03119597, 0.359007, -0.2537182, 0, 0.8745098, 1, 1,
0.03213917, 0.2150526, 0.09871852, 0, 0.8666667, 1, 1,
0.03420963, 0.7486935, 2.144673, 0, 0.8627451, 1, 1,
0.03494513, -0.5173732, 2.366507, 0, 0.854902, 1, 1,
0.03688541, -0.1997604, 4.762522, 0, 0.8509804, 1, 1,
0.03843258, 0.5323637, 0.5916005, 0, 0.8431373, 1, 1,
0.03944391, -0.760693, 2.665975, 0, 0.8392157, 1, 1,
0.04141736, 1.541409, -0.03803612, 0, 0.8313726, 1, 1,
0.0443687, 1.760055, -0.06776119, 0, 0.827451, 1, 1,
0.04442631, 0.5414222, 0.3460697, 0, 0.8196079, 1, 1,
0.04452957, -0.2636415, 2.661012, 0, 0.8156863, 1, 1,
0.04890901, 1.533807, -0.9948118, 0, 0.8078431, 1, 1,
0.05175827, 0.504426, 1.408697, 0, 0.8039216, 1, 1,
0.05548914, 2.169955, 0.5118895, 0, 0.7960784, 1, 1,
0.06305903, 0.9973007, -1.925252, 0, 0.7882353, 1, 1,
0.06435092, 0.3236023, 0.662244, 0, 0.7843137, 1, 1,
0.06529993, 1.103631, -0.1028586, 0, 0.7764706, 1, 1,
0.0689099, -0.04480755, 3.446473, 0, 0.772549, 1, 1,
0.06973399, 0.1748357, -0.8128868, 0, 0.7647059, 1, 1,
0.07138959, -0.4730849, 2.040229, 0, 0.7607843, 1, 1,
0.07723158, 1.029065, -0.1535912, 0, 0.7529412, 1, 1,
0.07736719, 0.3152983, -0.1475846, 0, 0.7490196, 1, 1,
0.07741603, -0.1942109, 3.388594, 0, 0.7411765, 1, 1,
0.08274789, 1.602704, 0.2815541, 0, 0.7372549, 1, 1,
0.09190968, 3.687685, -0.4212734, 0, 0.7294118, 1, 1,
0.09370828, -0.4175259, 2.937923, 0, 0.7254902, 1, 1,
0.09524798, 1.957368, -0.4038054, 0, 0.7176471, 1, 1,
0.0971356, -0.2787254, 2.123517, 0, 0.7137255, 1, 1,
0.1018092, -1.319247, 4.844786, 0, 0.7058824, 1, 1,
0.1023975, -0.4200402, 4.513164, 0, 0.6980392, 1, 1,
0.1024335, 1.116787, 0.3944697, 0, 0.6941177, 1, 1,
0.1067713, -0.7608439, 4.026553, 0, 0.6862745, 1, 1,
0.1110581, 2.041384, 1.162049, 0, 0.682353, 1, 1,
0.1183531, -1.329685, 2.932409, 0, 0.6745098, 1, 1,
0.1209441, -1.406234, 2.15447, 0, 0.6705883, 1, 1,
0.1242076, 0.08771101, 1.931022, 0, 0.6627451, 1, 1,
0.125432, -1.049584, 1.93457, 0, 0.6588235, 1, 1,
0.1270927, 0.8494272, 1.903695, 0, 0.6509804, 1, 1,
0.1280755, -0.08592087, 2.119533, 0, 0.6470588, 1, 1,
0.1295348, 1.48156, -0.1539323, 0, 0.6392157, 1, 1,
0.1328777, 0.4220287, 0.4982224, 0, 0.6352941, 1, 1,
0.1330094, 0.4051741, 0.07020184, 0, 0.627451, 1, 1,
0.133303, 0.6778011, 1.666353, 0, 0.6235294, 1, 1,
0.1354318, -0.2101889, 2.166764, 0, 0.6156863, 1, 1,
0.1388856, 1.063554, -1.475518, 0, 0.6117647, 1, 1,
0.1391397, 0.3871062, 1.744557, 0, 0.6039216, 1, 1,
0.1451836, -1.699944, 4.013692, 0, 0.5960785, 1, 1,
0.145537, -0.2480114, 1.866953, 0, 0.5921569, 1, 1,
0.1487923, -0.1265999, 1.384979, 0, 0.5843138, 1, 1,
0.1495151, 0.923848, -0.5524455, 0, 0.5803922, 1, 1,
0.1507893, 0.2754454, -0.6354631, 0, 0.572549, 1, 1,
0.1585998, -0.3342475, 5.210763, 0, 0.5686275, 1, 1,
0.1589779, -0.2063428, 1.642492, 0, 0.5607843, 1, 1,
0.1604251, 1.098411, 0.7304464, 0, 0.5568628, 1, 1,
0.1715658, -0.4081578, 1.232135, 0, 0.5490196, 1, 1,
0.172414, 0.7585546, 1.640545, 0, 0.5450981, 1, 1,
0.1727615, -0.0586384, 2.266335, 0, 0.5372549, 1, 1,
0.1731969, -1.430319, 3.369391, 0, 0.5333334, 1, 1,
0.1773085, 1.231749, -0.2828906, 0, 0.5254902, 1, 1,
0.177406, -0.1087853, -0.4962598, 0, 0.5215687, 1, 1,
0.1799573, 0.852351, 0.160973, 0, 0.5137255, 1, 1,
0.181016, 0.3137885, 1.308607, 0, 0.509804, 1, 1,
0.1826806, -2.09986, 4.180584, 0, 0.5019608, 1, 1,
0.183287, -0.237884, 3.498572, 0, 0.4941176, 1, 1,
0.1873147, -0.1079142, 1.483847, 0, 0.4901961, 1, 1,
0.1883903, 1.747036, 1.02643, 0, 0.4823529, 1, 1,
0.1909496, 1.569302, -0.4299002, 0, 0.4784314, 1, 1,
0.1970572, 1.287649, 0.6151111, 0, 0.4705882, 1, 1,
0.2017759, -0.1426596, 1.642201, 0, 0.4666667, 1, 1,
0.2039597, -0.2863833, 0.7781336, 0, 0.4588235, 1, 1,
0.2042827, -0.3590913, 2.164228, 0, 0.454902, 1, 1,
0.2055553, 0.4505345, -1.143708, 0, 0.4470588, 1, 1,
0.2079332, -0.02477965, 3.808167, 0, 0.4431373, 1, 1,
0.2098004, 0.1650756, 1.128121, 0, 0.4352941, 1, 1,
0.2099134, -0.852773, 1.625071, 0, 0.4313726, 1, 1,
0.2172466, -0.3154534, 2.782327, 0, 0.4235294, 1, 1,
0.2179619, 0.05003909, 0.2698975, 0, 0.4196078, 1, 1,
0.2211134, 0.5358042, -0.2993762, 0, 0.4117647, 1, 1,
0.2220558, 1.535107, 0.8564521, 0, 0.4078431, 1, 1,
0.2230714, -0.1197623, 4.230674, 0, 0.4, 1, 1,
0.229742, -0.2584867, 3.944728, 0, 0.3921569, 1, 1,
0.2305804, -0.4789885, 4.013478, 0, 0.3882353, 1, 1,
0.2316487, -0.435931, 2.420091, 0, 0.3803922, 1, 1,
0.2318828, -0.006266672, 1.767085, 0, 0.3764706, 1, 1,
0.2348428, -0.2377731, 3.479706, 0, 0.3686275, 1, 1,
0.2372749, 1.448381, 0.6969349, 0, 0.3647059, 1, 1,
0.2389532, -0.4402915, 3.349769, 0, 0.3568628, 1, 1,
0.2430706, 1.988755, 1.051093, 0, 0.3529412, 1, 1,
0.2434403, -2.156946, 4.18581, 0, 0.345098, 1, 1,
0.245149, -1.271874, 3.076825, 0, 0.3411765, 1, 1,
0.2464393, -0.4269777, 2.74053, 0, 0.3333333, 1, 1,
0.2587377, 0.7195497, -0.136134, 0, 0.3294118, 1, 1,
0.2611807, -1.448635, 4.413559, 0, 0.3215686, 1, 1,
0.2650011, -1.260406, 2.804304, 0, 0.3176471, 1, 1,
0.2666682, -0.1140367, 2.233726, 0, 0.3098039, 1, 1,
0.2671794, -0.5328756, 3.727247, 0, 0.3058824, 1, 1,
0.2719234, -0.2540746, 2.521533, 0, 0.2980392, 1, 1,
0.2731133, -0.5342066, 2.217017, 0, 0.2901961, 1, 1,
0.2777087, -1.398941, 2.026945, 0, 0.2862745, 1, 1,
0.2780541, -0.6419706, 2.692978, 0, 0.2784314, 1, 1,
0.2809095, 1.864861, -0.2898763, 0, 0.2745098, 1, 1,
0.282198, 1.953081, -1.374767, 0, 0.2666667, 1, 1,
0.282422, 0.3757263, 2.178291, 0, 0.2627451, 1, 1,
0.2883067, 0.3579784, -0.1007057, 0, 0.254902, 1, 1,
0.2980302, -1.021772, 0.8014358, 0, 0.2509804, 1, 1,
0.3102675, 0.3894281, -0.8172489, 0, 0.2431373, 1, 1,
0.3111206, -1.880433, 1.356781, 0, 0.2392157, 1, 1,
0.3123238, 1.32851, 0.5531732, 0, 0.2313726, 1, 1,
0.3138092, -0.4600686, 4.201248, 0, 0.227451, 1, 1,
0.3149368, -0.9423914, 2.98301, 0, 0.2196078, 1, 1,
0.3160845, 0.2217887, 2.180791, 0, 0.2156863, 1, 1,
0.3243768, -0.936149, 5.231813, 0, 0.2078431, 1, 1,
0.3282256, -2.59542, 4.33804, 0, 0.2039216, 1, 1,
0.328341, -0.3198958, 0.3892415, 0, 0.1960784, 1, 1,
0.3300496, -1.087409, 5.390881, 0, 0.1882353, 1, 1,
0.330271, 0.3321014, 0.9883403, 0, 0.1843137, 1, 1,
0.3306672, -1.149271, 2.950109, 0, 0.1764706, 1, 1,
0.3312489, -0.5531419, 3.229089, 0, 0.172549, 1, 1,
0.3312543, -1.84356, 1.09364, 0, 0.1647059, 1, 1,
0.3325472, 1.389285, 1.260548, 0, 0.1607843, 1, 1,
0.3361193, -0.2562936, 2.015942, 0, 0.1529412, 1, 1,
0.3379045, -0.6244814, 2.458582, 0, 0.1490196, 1, 1,
0.3386143, 0.08485031, 3.349059, 0, 0.1411765, 1, 1,
0.3404112, -0.5000711, 2.692507, 0, 0.1372549, 1, 1,
0.3413694, -1.022812, 2.154827, 0, 0.1294118, 1, 1,
0.3425528, -0.880035, 1.881467, 0, 0.1254902, 1, 1,
0.3489313, -1.150851, 3.409798, 0, 0.1176471, 1, 1,
0.350037, -1.156693, 2.738248, 0, 0.1137255, 1, 1,
0.3507406, -0.3559244, 1.485696, 0, 0.1058824, 1, 1,
0.3524253, 0.8064391, 0.3930576, 0, 0.09803922, 1, 1,
0.3531625, 0.2740056, 1.330318, 0, 0.09411765, 1, 1,
0.3533485, -0.3142037, 2.290969, 0, 0.08627451, 1, 1,
0.3535817, 2.085326, 1.470216, 0, 0.08235294, 1, 1,
0.3541112, 0.3842089, 1.205696, 0, 0.07450981, 1, 1,
0.3583698, 0.6465103, 0.1593133, 0, 0.07058824, 1, 1,
0.3602689, 0.8330116, -0.2640238, 0, 0.0627451, 1, 1,
0.3619295, -0.105691, 2.058016, 0, 0.05882353, 1, 1,
0.3637726, 0.4431145, 0.4579181, 0, 0.05098039, 1, 1,
0.3639082, -0.3123766, 2.866652, 0, 0.04705882, 1, 1,
0.3646168, 0.5084025, 0.8635572, 0, 0.03921569, 1, 1,
0.3650488, 0.06384655, 1.82482, 0, 0.03529412, 1, 1,
0.3732581, 0.5535116, 2.307317, 0, 0.02745098, 1, 1,
0.3734283, -0.8339363, 2.072222, 0, 0.02352941, 1, 1,
0.3755857, -0.8854795, 3.237601, 0, 0.01568628, 1, 1,
0.3757071, 0.7224055, 2.405502, 0, 0.01176471, 1, 1,
0.3778078, -0.1318917, 3.442472, 0, 0.003921569, 1, 1,
0.385802, 1.448521, 0.9773118, 0.003921569, 0, 1, 1,
0.3919953, 0.3948219, 1.749258, 0.007843138, 0, 1, 1,
0.3928677, 0.5656816, -0.6020666, 0.01568628, 0, 1, 1,
0.3935945, 0.2315871, 0.9019288, 0.01960784, 0, 1, 1,
0.3969016, -0.008855189, -0.2107455, 0.02745098, 0, 1, 1,
0.3988157, 0.2234305, 0.1865543, 0.03137255, 0, 1, 1,
0.399516, 0.6412029, 1.909024, 0.03921569, 0, 1, 1,
0.4012868, -0.4271234, 2.377995, 0.04313726, 0, 1, 1,
0.4061085, 1.646163, -0.09718395, 0.05098039, 0, 1, 1,
0.4072383, 1.16815, 1.517412, 0.05490196, 0, 1, 1,
0.4073677, -1.413911, 3.229015, 0.0627451, 0, 1, 1,
0.4074489, 0.2246648, -0.3077455, 0.06666667, 0, 1, 1,
0.4115207, -1.0986, 3.302656, 0.07450981, 0, 1, 1,
0.412268, -0.2634747, 2.950481, 0.07843138, 0, 1, 1,
0.4156685, -1.111468, 4.013402, 0.08627451, 0, 1, 1,
0.4160273, 0.5799788, 0.7115529, 0.09019608, 0, 1, 1,
0.4259773, 1.520211, -0.9466653, 0.09803922, 0, 1, 1,
0.4281082, 0.6568399, 1.479515, 0.1058824, 0, 1, 1,
0.4287698, -0.8901981, 3.813779, 0.1098039, 0, 1, 1,
0.4290605, 1.097703, -1.646944, 0.1176471, 0, 1, 1,
0.4365839, -0.8062441, 1.575684, 0.1215686, 0, 1, 1,
0.4368333, -0.1157651, 1.711941, 0.1294118, 0, 1, 1,
0.437513, -3.012524, 4.420233, 0.1333333, 0, 1, 1,
0.4444123, 0.6113381, -0.6125797, 0.1411765, 0, 1, 1,
0.4483243, 0.2978513, 0.4097143, 0.145098, 0, 1, 1,
0.4489432, 0.2199187, 1.399818, 0.1529412, 0, 1, 1,
0.449188, 0.4621928, 2.711976, 0.1568628, 0, 1, 1,
0.4522109, 0.9360369, 2.08852, 0.1647059, 0, 1, 1,
0.4531925, -0.5516829, 2.663683, 0.1686275, 0, 1, 1,
0.4592212, -2.389981, 2.812539, 0.1764706, 0, 1, 1,
0.464318, -0.2204542, 0.5334176, 0.1803922, 0, 1, 1,
0.4646378, 0.3428153, 1.961303, 0.1882353, 0, 1, 1,
0.4655255, -0.7176838, 2.476258, 0.1921569, 0, 1, 1,
0.4737798, 0.3025546, -0.2186392, 0.2, 0, 1, 1,
0.4739453, 0.9002512, -0.569887, 0.2078431, 0, 1, 1,
0.4741666, 0.7790409, 1.281657, 0.2117647, 0, 1, 1,
0.4777358, 0.2098354, 1.84836, 0.2196078, 0, 1, 1,
0.4793531, 1.682556, 0.2428312, 0.2235294, 0, 1, 1,
0.4845387, 0.8721259, 0.5147658, 0.2313726, 0, 1, 1,
0.4846675, 0.07386298, 2.957064, 0.2352941, 0, 1, 1,
0.4849562, -0.813157, 3.540839, 0.2431373, 0, 1, 1,
0.4860809, 0.05471935, 3.168132, 0.2470588, 0, 1, 1,
0.4875705, 0.8065234, 0.9416052, 0.254902, 0, 1, 1,
0.488801, 0.1137023, 1.856332, 0.2588235, 0, 1, 1,
0.4907174, 0.07469016, 0.429793, 0.2666667, 0, 1, 1,
0.4920783, -0.09961339, 0.08958926, 0.2705882, 0, 1, 1,
0.4939423, -0.4185668, 2.467134, 0.2784314, 0, 1, 1,
0.4995598, -0.5115994, 3.323786, 0.282353, 0, 1, 1,
0.5063419, 1.517693, -0.06753761, 0.2901961, 0, 1, 1,
0.5067159, 1.046171, 0.4971623, 0.2941177, 0, 1, 1,
0.5068442, -0.2528036, 3.277091, 0.3019608, 0, 1, 1,
0.5076677, -1.312789, 2.698774, 0.3098039, 0, 1, 1,
0.5119478, 1.605145, 0.7562904, 0.3137255, 0, 1, 1,
0.5121638, -1.391559, 2.992052, 0.3215686, 0, 1, 1,
0.5152417, 1.392476, 0.2528245, 0.3254902, 0, 1, 1,
0.5167185, -0.6307592, 1.750662, 0.3333333, 0, 1, 1,
0.5190554, 0.1295507, 1.398865, 0.3372549, 0, 1, 1,
0.5218285, -0.7831428, 1.850786, 0.345098, 0, 1, 1,
0.5219604, -0.1933184, 1.555938, 0.3490196, 0, 1, 1,
0.5281375, 0.808004, 0.5273724, 0.3568628, 0, 1, 1,
0.5323681, -0.7981117, 2.955951, 0.3607843, 0, 1, 1,
0.5344306, -1.419798, 3.188178, 0.3686275, 0, 1, 1,
0.5392122, 0.1206651, 1.862617, 0.372549, 0, 1, 1,
0.5392711, -1.986322, 3.250386, 0.3803922, 0, 1, 1,
0.539768, -0.8068172, 3.111765, 0.3843137, 0, 1, 1,
0.5559763, 0.9347503, -0.229018, 0.3921569, 0, 1, 1,
0.5642248, -0.2068055, 3.002281, 0.3960784, 0, 1, 1,
0.5659929, 1.105119, -0.4670617, 0.4039216, 0, 1, 1,
0.5704246, -1.038692, 1.418714, 0.4117647, 0, 1, 1,
0.5817822, 0.3979274, 1.265742, 0.4156863, 0, 1, 1,
0.5836629, 0.3131919, -0.9662392, 0.4235294, 0, 1, 1,
0.584006, -0.06778586, 0.6566565, 0.427451, 0, 1, 1,
0.5848126, -2.208262, 1.788931, 0.4352941, 0, 1, 1,
0.5849804, 0.7645925, 1.951501, 0.4392157, 0, 1, 1,
0.5873586, -1.237952, 2.618027, 0.4470588, 0, 1, 1,
0.5885577, 1.444198, 2.036349, 0.4509804, 0, 1, 1,
0.5900033, -0.40158, 1.784974, 0.4588235, 0, 1, 1,
0.5926903, -1.252026, 2.542814, 0.4627451, 0, 1, 1,
0.5933312, 0.1983882, 2.595674, 0.4705882, 0, 1, 1,
0.595704, -0.9471816, 3.03178, 0.4745098, 0, 1, 1,
0.5965382, 0.06417989, 0.4291126, 0.4823529, 0, 1, 1,
0.5965552, 0.2087958, 0.2517142, 0.4862745, 0, 1, 1,
0.5987831, -0.5156172, 1.062578, 0.4941176, 0, 1, 1,
0.5989516, 1.441051, -0.3225015, 0.5019608, 0, 1, 1,
0.6015462, -0.3209727, 3.000314, 0.5058824, 0, 1, 1,
0.6082188, -0.6411186, 3.918825, 0.5137255, 0, 1, 1,
0.6091504, 0.2976525, 0.8992668, 0.5176471, 0, 1, 1,
0.6146811, -0.9922432, 3.117419, 0.5254902, 0, 1, 1,
0.6235833, 3.191042, 1.116487, 0.5294118, 0, 1, 1,
0.6269203, 0.9764288, -0.6098954, 0.5372549, 0, 1, 1,
0.6270653, 0.3276937, 1.384009, 0.5411765, 0, 1, 1,
0.6325516, 1.683932, 0.2007371, 0.5490196, 0, 1, 1,
0.6370085, -1.658567, 2.900023, 0.5529412, 0, 1, 1,
0.6396485, -0.1422258, 2.18766, 0.5607843, 0, 1, 1,
0.6469274, -0.7754499, 1.518326, 0.5647059, 0, 1, 1,
0.6478103, -0.09028167, 0.5013494, 0.572549, 0, 1, 1,
0.653765, -0.06968378, 0.7682871, 0.5764706, 0, 1, 1,
0.6548932, 1.629895, 0.4563896, 0.5843138, 0, 1, 1,
0.6551414, 0.1839456, 0.1018348, 0.5882353, 0, 1, 1,
0.6552121, -0.0970265, 1.3245, 0.5960785, 0, 1, 1,
0.6893299, 1.415526, 0.6858068, 0.6039216, 0, 1, 1,
0.6918855, -1.121299, 2.366865, 0.6078432, 0, 1, 1,
0.6950787, 1.593525, 0.5794473, 0.6156863, 0, 1, 1,
0.6951731, 0.7106299, 0.4493193, 0.6196079, 0, 1, 1,
0.7047409, 0.3206634, -0.9863383, 0.627451, 0, 1, 1,
0.7070375, 0.3692929, 0.3845281, 0.6313726, 0, 1, 1,
0.707393, 1.163063, 1.865033, 0.6392157, 0, 1, 1,
0.7081092, -0.5723814, 2.355009, 0.6431373, 0, 1, 1,
0.7133953, -1.569398, 3.496135, 0.6509804, 0, 1, 1,
0.7146468, -0.4443605, 1.29199, 0.654902, 0, 1, 1,
0.7162534, 0.3940105, 1.507873, 0.6627451, 0, 1, 1,
0.7177662, 1.808184, 0.9943432, 0.6666667, 0, 1, 1,
0.7179695, 1.612296, 1.904489, 0.6745098, 0, 1, 1,
0.7199389, -1.25119, 3.031898, 0.6784314, 0, 1, 1,
0.7200785, -0.9645991, 0.3509273, 0.6862745, 0, 1, 1,
0.7216522, -0.7570632, 3.286238, 0.6901961, 0, 1, 1,
0.7225577, 1.85585, 0.1273788, 0.6980392, 0, 1, 1,
0.7229275, 1.513885, 1.649508, 0.7058824, 0, 1, 1,
0.7377566, -1.246198, 4.17035, 0.7098039, 0, 1, 1,
0.739363, 0.6538887, 0.7126369, 0.7176471, 0, 1, 1,
0.7427323, -0.5424866, 2.494811, 0.7215686, 0, 1, 1,
0.7471455, 0.7345495, -0.6227742, 0.7294118, 0, 1, 1,
0.7492085, -0.5737396, 2.50142, 0.7333333, 0, 1, 1,
0.7555787, 0.3787669, 0.5912809, 0.7411765, 0, 1, 1,
0.758982, 0.7743382, 0.6976632, 0.7450981, 0, 1, 1,
0.772199, 0.003534175, 1.834191, 0.7529412, 0, 1, 1,
0.7765196, -0.2369043, 0.6248037, 0.7568628, 0, 1, 1,
0.7776527, -0.1052363, 2.233307, 0.7647059, 0, 1, 1,
0.7798889, -0.3862297, 1.699273, 0.7686275, 0, 1, 1,
0.7824777, 1.013459, 1.531039, 0.7764706, 0, 1, 1,
0.7840996, 0.002835335, 2.483101, 0.7803922, 0, 1, 1,
0.790955, -0.1570641, 2.330559, 0.7882353, 0, 1, 1,
0.791271, 1.591839, -0.3713349, 0.7921569, 0, 1, 1,
0.7994874, -0.9227599, 3.879162, 0.8, 0, 1, 1,
0.8046172, -0.1148349, 3.161628, 0.8078431, 0, 1, 1,
0.8047958, 1.570883, 0.1023281, 0.8117647, 0, 1, 1,
0.8095863, -1.138447, 1.997135, 0.8196079, 0, 1, 1,
0.8146028, 0.05166857, 1.960189, 0.8235294, 0, 1, 1,
0.8187314, -0.1972816, 1.093809, 0.8313726, 0, 1, 1,
0.8204615, -0.1981352, 0.8915271, 0.8352941, 0, 1, 1,
0.8210058, 1.433004, 0.2872535, 0.8431373, 0, 1, 1,
0.8214336, 0.5381997, 1.410313, 0.8470588, 0, 1, 1,
0.8216674, -0.3555705, 1.391425, 0.854902, 0, 1, 1,
0.829872, -0.1902467, 2.776034, 0.8588235, 0, 1, 1,
0.8303543, 0.1019125, 2.728744, 0.8666667, 0, 1, 1,
0.8306164, 0.7860735, -0.8387255, 0.8705882, 0, 1, 1,
0.8338861, -2.144611, 1.80214, 0.8784314, 0, 1, 1,
0.8365862, 1.287792, -0.271241, 0.8823529, 0, 1, 1,
0.8426878, 0.877869, 1.35522, 0.8901961, 0, 1, 1,
0.8446934, 0.3362761, 1.365706, 0.8941177, 0, 1, 1,
0.8489397, -0.5723472, 2.880349, 0.9019608, 0, 1, 1,
0.8504723, 0.9748623, 1.588225, 0.9098039, 0, 1, 1,
0.8516527, -0.344009, 1.322605, 0.9137255, 0, 1, 1,
0.8585901, 0.8582686, 1.101019, 0.9215686, 0, 1, 1,
0.8696015, -0.1678122, 1.421074, 0.9254902, 0, 1, 1,
0.8731393, 0.8961599, 0.05171756, 0.9333333, 0, 1, 1,
0.8767666, -1.059489, 2.068599, 0.9372549, 0, 1, 1,
0.8781323, -3.169497, 1.191021, 0.945098, 0, 1, 1,
0.8793628, -0.0983453, 0.614414, 0.9490196, 0, 1, 1,
0.8835597, -0.7716076, 1.544534, 0.9568627, 0, 1, 1,
0.8848783, 0.5568029, -0.9219555, 0.9607843, 0, 1, 1,
0.8898179, 0.9743022, 2.573904, 0.9686275, 0, 1, 1,
0.8915433, 0.4838413, 1.171631, 0.972549, 0, 1, 1,
0.892131, 0.7538999, 0.3559942, 0.9803922, 0, 1, 1,
0.906, 0.3409664, 2.254337, 0.9843137, 0, 1, 1,
0.9109736, -0.6924853, 1.036124, 0.9921569, 0, 1, 1,
0.9119658, -0.2140768, 0.3410431, 0.9960784, 0, 1, 1,
0.9211162, 1.338273, 1.346704, 1, 0, 0.9960784, 1,
0.9230009, -1.184563, 3.126599, 1, 0, 0.9882353, 1,
0.9242588, 0.003664037, 1.616938, 1, 0, 0.9843137, 1,
0.9328181, 0.3547532, 1.118454, 1, 0, 0.9764706, 1,
0.9353574, -1.214501, 3.485576, 1, 0, 0.972549, 1,
0.9420166, -0.5619937, 4.210896, 1, 0, 0.9647059, 1,
0.9462167, -0.1229197, 2.588572, 1, 0, 0.9607843, 1,
0.951644, -1.780844, 5.565351, 1, 0, 0.9529412, 1,
0.9584842, -1.034069, 3.5415, 1, 0, 0.9490196, 1,
0.9591742, 0.4333863, 0.7206496, 1, 0, 0.9411765, 1,
0.9656363, 1.643054, -0.2500147, 1, 0, 0.9372549, 1,
0.9689738, 1.777658, -0.4822357, 1, 0, 0.9294118, 1,
0.9700271, -2.314502, 1.848738, 1, 0, 0.9254902, 1,
0.9729392, 1.451973, 1.050248, 1, 0, 0.9176471, 1,
0.9752325, -0.7003695, 4.378042, 1, 0, 0.9137255, 1,
0.9763984, -0.678978, 1.495354, 1, 0, 0.9058824, 1,
0.978485, -0.9058924, 1.359081, 1, 0, 0.9019608, 1,
0.9825512, 2.844521, 0.9159325, 1, 0, 0.8941177, 1,
0.982681, -0.005802794, 0.8353626, 1, 0, 0.8862745, 1,
0.9939888, 0.1989932, 1.849999, 1, 0, 0.8823529, 1,
0.997285, 1.550297, 0.5167578, 1, 0, 0.8745098, 1,
1.005658, 0.5704416, 0.3273484, 1, 0, 0.8705882, 1,
1.016063, 0.1863492, 1.263768, 1, 0, 0.8627451, 1,
1.024913, 0.6396558, -0.4176005, 1, 0, 0.8588235, 1,
1.027435, -0.2963396, 0.7534756, 1, 0, 0.8509804, 1,
1.029199, 0.05534923, 2.522151, 1, 0, 0.8470588, 1,
1.033161, -0.08877859, 2.158677, 1, 0, 0.8392157, 1,
1.036043, -0.3575785, 2.669026, 1, 0, 0.8352941, 1,
1.036414, 0.4847035, 1.892939, 1, 0, 0.827451, 1,
1.039914, -0.6477251, 3.067144, 1, 0, 0.8235294, 1,
1.041202, -0.3186454, 1.277949, 1, 0, 0.8156863, 1,
1.041897, 0.7646504, 3.17753, 1, 0, 0.8117647, 1,
1.051409, 0.008312904, -0.7599831, 1, 0, 0.8039216, 1,
1.053901, -1.276816, 3.303726, 1, 0, 0.7960784, 1,
1.054331, -0.8233623, 0.1349782, 1, 0, 0.7921569, 1,
1.057057, -0.1701458, 2.511976, 1, 0, 0.7843137, 1,
1.059395, 0.292699, 2.781796, 1, 0, 0.7803922, 1,
1.06454, -0.7743523, 0.546157, 1, 0, 0.772549, 1,
1.067488, 0.2233052, 2.461332, 1, 0, 0.7686275, 1,
1.087992, 0.588508, 1.59759, 1, 0, 0.7607843, 1,
1.097104, -0.07435025, 3.804033, 1, 0, 0.7568628, 1,
1.100352, 0.04944408, 0.7578724, 1, 0, 0.7490196, 1,
1.116318, 0.2808341, 2.321798, 1, 0, 0.7450981, 1,
1.120682, -0.7362971, 2.978842, 1, 0, 0.7372549, 1,
1.123011, 0.2834498, 1.662416, 1, 0, 0.7333333, 1,
1.131475, 0.3858569, 0.6473057, 1, 0, 0.7254902, 1,
1.13257, -0.1008006, 2.351086, 1, 0, 0.7215686, 1,
1.139371, -1.167638, 1.784231, 1, 0, 0.7137255, 1,
1.145306, 0.1179497, 2.06983, 1, 0, 0.7098039, 1,
1.162062, 0.6900547, 1.614197, 1, 0, 0.7019608, 1,
1.163737, 1.101582, 1.638093, 1, 0, 0.6941177, 1,
1.168635, 0.2334524, 1.448806, 1, 0, 0.6901961, 1,
1.178898, -0.2294334, 1.151147, 1, 0, 0.682353, 1,
1.179703, 0.7840241, 0.1137201, 1, 0, 0.6784314, 1,
1.179953, -1.151436, 1.568979, 1, 0, 0.6705883, 1,
1.180744, -1.340776, 4.296334, 1, 0, 0.6666667, 1,
1.183241, -0.8548568, 2.671186, 1, 0, 0.6588235, 1,
1.192535, 0.7277606, 2.061385, 1, 0, 0.654902, 1,
1.196489, 1.115635, 1.925413, 1, 0, 0.6470588, 1,
1.198593, 1.582206, -0.1005556, 1, 0, 0.6431373, 1,
1.198776, -0.2393791, 0.9276569, 1, 0, 0.6352941, 1,
1.199597, -0.2843963, 0.8137731, 1, 0, 0.6313726, 1,
1.203337, 0.2699047, 1.316225, 1, 0, 0.6235294, 1,
1.209109, -0.02423161, 0.4229801, 1, 0, 0.6196079, 1,
1.209112, -2.002118, 3.028981, 1, 0, 0.6117647, 1,
1.211578, 0.7144119, 1.258159, 1, 0, 0.6078432, 1,
1.214979, -0.1708918, 1.891996, 1, 0, 0.6, 1,
1.220261, -1.280592, 2.510886, 1, 0, 0.5921569, 1,
1.236856, -0.6328109, 2.278319, 1, 0, 0.5882353, 1,
1.238493, -0.5495656, 1.83032, 1, 0, 0.5803922, 1,
1.244407, -1.422249, 2.414459, 1, 0, 0.5764706, 1,
1.250144, 0.5714974, 0.3829418, 1, 0, 0.5686275, 1,
1.252175, -1.283898, 1.684205, 1, 0, 0.5647059, 1,
1.257138, 0.3515182, 2.990588, 1, 0, 0.5568628, 1,
1.265088, 0.5347845, 1.52913, 1, 0, 0.5529412, 1,
1.267168, 1.524919, -1.010751, 1, 0, 0.5450981, 1,
1.27175, -0.289772, 2.162036, 1, 0, 0.5411765, 1,
1.273668, 0.03164843, 1.187045, 1, 0, 0.5333334, 1,
1.278518, 0.2040285, 4.571667, 1, 0, 0.5294118, 1,
1.283299, -0.5230327, 0.9293056, 1, 0, 0.5215687, 1,
1.287326, -1.303294, 0.6183067, 1, 0, 0.5176471, 1,
1.307027, 1.211659, 0.8631486, 1, 0, 0.509804, 1,
1.314594, 0.5792532, -1.416216, 1, 0, 0.5058824, 1,
1.317046, 0.3698926, 2.748591, 1, 0, 0.4980392, 1,
1.324524, -0.695033, 3.232887, 1, 0, 0.4901961, 1,
1.332986, 0.04788219, 1.766363, 1, 0, 0.4862745, 1,
1.340163, -0.14519, 2.174546, 1, 0, 0.4784314, 1,
1.34251, 1.178211, 0.6138684, 1, 0, 0.4745098, 1,
1.344537, -1.097663, 2.846059, 1, 0, 0.4666667, 1,
1.345761, -0.313393, 1.134319, 1, 0, 0.4627451, 1,
1.349151, 0.6761354, -0.4698008, 1, 0, 0.454902, 1,
1.351445, 0.4696001, 1.047657, 1, 0, 0.4509804, 1,
1.360611, -0.5138926, 3.204968, 1, 0, 0.4431373, 1,
1.363423, 1.897468, 1.35131, 1, 0, 0.4392157, 1,
1.37285, 1.083568, 0.8313277, 1, 0, 0.4313726, 1,
1.376144, 0.6374155, 1.043396, 1, 0, 0.427451, 1,
1.393353, 0.04376107, 3.103686, 1, 0, 0.4196078, 1,
1.39821, -1.669961, 2.173442, 1, 0, 0.4156863, 1,
1.401845, 0.002241707, 1.838923, 1, 0, 0.4078431, 1,
1.422791, 1.20147, 2.260174, 1, 0, 0.4039216, 1,
1.428697, -1.56177, 3.805461, 1, 0, 0.3960784, 1,
1.430213, -1.576627, 2.011161, 1, 0, 0.3882353, 1,
1.438296, -0.4807704, 0.9773473, 1, 0, 0.3843137, 1,
1.441723, 0.2128826, -0.01020826, 1, 0, 0.3764706, 1,
1.449326, -0.5282458, 2.724628, 1, 0, 0.372549, 1,
1.462014, 0.9897773, 1.104325, 1, 0, 0.3647059, 1,
1.46943, -0.5203658, 2.035267, 1, 0, 0.3607843, 1,
1.4708, -0.6461273, 0.9043196, 1, 0, 0.3529412, 1,
1.47838, 0.4194633, 1.535611, 1, 0, 0.3490196, 1,
1.493593, -1.086575, 1.937097, 1, 0, 0.3411765, 1,
1.495809, 1.283733, 0.6763146, 1, 0, 0.3372549, 1,
1.539367, 0.4272495, 1.160579, 1, 0, 0.3294118, 1,
1.549228, 0.6567059, 0.05141043, 1, 0, 0.3254902, 1,
1.560797, -0.4206907, 1.247991, 1, 0, 0.3176471, 1,
1.566203, 1.876896, 0.6086134, 1, 0, 0.3137255, 1,
1.569265, -0.4765827, 2.434416, 1, 0, 0.3058824, 1,
1.595465, 2.092984, 1.855779, 1, 0, 0.2980392, 1,
1.596553, 0.61623, 0.475775, 1, 0, 0.2941177, 1,
1.598812, -0.3942161, -0.4149598, 1, 0, 0.2862745, 1,
1.609353, 1.179999, 0.4052912, 1, 0, 0.282353, 1,
1.65528, 0.3102167, 1.132523, 1, 0, 0.2745098, 1,
1.673084, -0.5716488, 0.8694316, 1, 0, 0.2705882, 1,
1.708952, 0.8061786, 1.28923, 1, 0, 0.2627451, 1,
1.71191, -2.26975, 3.669277, 1, 0, 0.2588235, 1,
1.720763, 0.6257899, 0.9716388, 1, 0, 0.2509804, 1,
1.743014, -0.01821852, 0.1248793, 1, 0, 0.2470588, 1,
1.759673, 1.492773, 0.9099921, 1, 0, 0.2392157, 1,
1.767257, -0.3397146, 1.745541, 1, 0, 0.2352941, 1,
1.770297, -0.6699529, 1.822553, 1, 0, 0.227451, 1,
1.77498, 0.9177357, 1.173315, 1, 0, 0.2235294, 1,
1.794689, 0.7962151, 1.407156, 1, 0, 0.2156863, 1,
1.802817, -0.4783705, 0.6222148, 1, 0, 0.2117647, 1,
1.828215, 0.3289653, 1.380036, 1, 0, 0.2039216, 1,
1.82938, -0.6519501, 0.6940328, 1, 0, 0.1960784, 1,
1.832419, 0.1101459, 2.697173, 1, 0, 0.1921569, 1,
1.845155, 0.8210329, 1.838312, 1, 0, 0.1843137, 1,
1.851446, -0.4023856, 2.765817, 1, 0, 0.1803922, 1,
1.854328, -0.2198732, 1.684316, 1, 0, 0.172549, 1,
1.883946, 0.1163128, 2.673556, 1, 0, 0.1686275, 1,
1.918233, 1.75311, 1.750874, 1, 0, 0.1607843, 1,
1.928069, -0.9446008, 1.715742, 1, 0, 0.1568628, 1,
1.960843, -1.358794, 1.97429, 1, 0, 0.1490196, 1,
1.965236, 0.4422072, 1.324716, 1, 0, 0.145098, 1,
1.974614, 0.08748414, 3.220701, 1, 0, 0.1372549, 1,
1.975657, -0.2807453, 1.038894, 1, 0, 0.1333333, 1,
2.011359, 0.1323767, 0.5787851, 1, 0, 0.1254902, 1,
2.067241, 1.154227, 1.076239, 1, 0, 0.1215686, 1,
2.111451, -0.0614128, 1.062703, 1, 0, 0.1137255, 1,
2.132848, -0.3342201, 1.416997, 1, 0, 0.1098039, 1,
2.151477, 1.86742, 0.06808964, 1, 0, 0.1019608, 1,
2.171233, 1.202253, 1.873775, 1, 0, 0.09411765, 1,
2.177456, 1.557455, 1.269767, 1, 0, 0.09019608, 1,
2.183492, 0.04374145, 2.763925, 1, 0, 0.08235294, 1,
2.183522, -0.2340401, 1.699161, 1, 0, 0.07843138, 1,
2.244954, -1.002204, 1.865828, 1, 0, 0.07058824, 1,
2.30892, -0.5814235, 2.359193, 1, 0, 0.06666667, 1,
2.357985, -0.1107786, 2.113259, 1, 0, 0.05882353, 1,
2.367245, 0.03966795, 2.05538, 1, 0, 0.05490196, 1,
2.553672, 0.4391124, 1.737177, 1, 0, 0.04705882, 1,
2.608615, -0.3577209, 0.3359385, 1, 0, 0.04313726, 1,
2.624081, -1.139462, 2.30959, 1, 0, 0.03529412, 1,
2.723844, -0.1069147, 2.32479, 1, 0, 0.03137255, 1,
2.730402, -0.9195511, 0.9046332, 1, 0, 0.02352941, 1,
2.730954, -0.1028672, 0.2183447, 1, 0, 0.01960784, 1,
2.742018, 1.272581, 0.907102, 1, 0, 0.01176471, 1,
3.671038, -1.064892, 1.992225, 1, 0, 0.007843138, 1
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
0.1270853, -4.447416, -6.599792, 0, -0.5, 0.5, 0.5,
0.1270853, -4.447416, -6.599792, 1, -0.5, 0.5, 0.5,
0.1270853, -4.447416, -6.599792, 1, 1.5, 0.5, 0.5,
0.1270853, -4.447416, -6.599792, 0, 1.5, 0.5, 0.5
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
-4.618267, 0.2096599, -6.599792, 0, -0.5, 0.5, 0.5,
-4.618267, 0.2096599, -6.599792, 1, -0.5, 0.5, 0.5,
-4.618267, 0.2096599, -6.599792, 1, 1.5, 0.5, 0.5,
-4.618267, 0.2096599, -6.599792, 0, 1.5, 0.5, 0.5
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
-4.618267, -4.447416, 0.3643489, 0, -0.5, 0.5, 0.5,
-4.618267, -4.447416, 0.3643489, 1, -0.5, 0.5, 0.5,
-4.618267, -4.447416, 0.3643489, 1, 1.5, 0.5, 0.5,
-4.618267, -4.447416, 0.3643489, 0, 1.5, 0.5, 0.5
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
-2, -3.372706, -4.992683,
2, -3.372706, -4.992683,
-2, -3.372706, -4.992683,
-2, -3.551825, -5.260534,
0, -3.372706, -4.992683,
0, -3.551825, -5.260534,
2, -3.372706, -4.992683,
2, -3.551825, -5.260534
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
-2, -3.910061, -5.796237, 0, -0.5, 0.5, 0.5,
-2, -3.910061, -5.796237, 1, -0.5, 0.5, 0.5,
-2, -3.910061, -5.796237, 1, 1.5, 0.5, 0.5,
-2, -3.910061, -5.796237, 0, 1.5, 0.5, 0.5,
0, -3.910061, -5.796237, 0, -0.5, 0.5, 0.5,
0, -3.910061, -5.796237, 1, -0.5, 0.5, 0.5,
0, -3.910061, -5.796237, 1, 1.5, 0.5, 0.5,
0, -3.910061, -5.796237, 0, 1.5, 0.5, 0.5,
2, -3.910061, -5.796237, 0, -0.5, 0.5, 0.5,
2, -3.910061, -5.796237, 1, -0.5, 0.5, 0.5,
2, -3.910061, -5.796237, 1, 1.5, 0.5, 0.5,
2, -3.910061, -5.796237, 0, 1.5, 0.5, 0.5
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
-3.523185, -3, -4.992683,
-3.523185, 3, -4.992683,
-3.523185, -3, -4.992683,
-3.705699, -3, -5.260534,
-3.523185, -2, -4.992683,
-3.705699, -2, -5.260534,
-3.523185, -1, -4.992683,
-3.705699, -1, -5.260534,
-3.523185, 0, -4.992683,
-3.705699, 0, -5.260534,
-3.523185, 1, -4.992683,
-3.705699, 1, -5.260534,
-3.523185, 2, -4.992683,
-3.705699, 2, -5.260534,
-3.523185, 3, -4.992683,
-3.705699, 3, -5.260534
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
-4.070726, -3, -5.796237, 0, -0.5, 0.5, 0.5,
-4.070726, -3, -5.796237, 1, -0.5, 0.5, 0.5,
-4.070726, -3, -5.796237, 1, 1.5, 0.5, 0.5,
-4.070726, -3, -5.796237, 0, 1.5, 0.5, 0.5,
-4.070726, -2, -5.796237, 0, -0.5, 0.5, 0.5,
-4.070726, -2, -5.796237, 1, -0.5, 0.5, 0.5,
-4.070726, -2, -5.796237, 1, 1.5, 0.5, 0.5,
-4.070726, -2, -5.796237, 0, 1.5, 0.5, 0.5,
-4.070726, -1, -5.796237, 0, -0.5, 0.5, 0.5,
-4.070726, -1, -5.796237, 1, -0.5, 0.5, 0.5,
-4.070726, -1, -5.796237, 1, 1.5, 0.5, 0.5,
-4.070726, -1, -5.796237, 0, 1.5, 0.5, 0.5,
-4.070726, 0, -5.796237, 0, -0.5, 0.5, 0.5,
-4.070726, 0, -5.796237, 1, -0.5, 0.5, 0.5,
-4.070726, 0, -5.796237, 1, 1.5, 0.5, 0.5,
-4.070726, 0, -5.796237, 0, 1.5, 0.5, 0.5,
-4.070726, 1, -5.796237, 0, -0.5, 0.5, 0.5,
-4.070726, 1, -5.796237, 1, -0.5, 0.5, 0.5,
-4.070726, 1, -5.796237, 1, 1.5, 0.5, 0.5,
-4.070726, 1, -5.796237, 0, 1.5, 0.5, 0.5,
-4.070726, 2, -5.796237, 0, -0.5, 0.5, 0.5,
-4.070726, 2, -5.796237, 1, -0.5, 0.5, 0.5,
-4.070726, 2, -5.796237, 1, 1.5, 0.5, 0.5,
-4.070726, 2, -5.796237, 0, 1.5, 0.5, 0.5,
-4.070726, 3, -5.796237, 0, -0.5, 0.5, 0.5,
-4.070726, 3, -5.796237, 1, -0.5, 0.5, 0.5,
-4.070726, 3, -5.796237, 1, 1.5, 0.5, 0.5,
-4.070726, 3, -5.796237, 0, 1.5, 0.5, 0.5
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
-3.523185, -3.372706, -4,
-3.523185, -3.372706, 4,
-3.523185, -3.372706, -4,
-3.705699, -3.551825, -4,
-3.523185, -3.372706, -2,
-3.705699, -3.551825, -2,
-3.523185, -3.372706, 0,
-3.705699, -3.551825, 0,
-3.523185, -3.372706, 2,
-3.705699, -3.551825, 2,
-3.523185, -3.372706, 4,
-3.705699, -3.551825, 4
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
-4.070726, -3.910061, -4, 0, -0.5, 0.5, 0.5,
-4.070726, -3.910061, -4, 1, -0.5, 0.5, 0.5,
-4.070726, -3.910061, -4, 1, 1.5, 0.5, 0.5,
-4.070726, -3.910061, -4, 0, 1.5, 0.5, 0.5,
-4.070726, -3.910061, -2, 0, -0.5, 0.5, 0.5,
-4.070726, -3.910061, -2, 1, -0.5, 0.5, 0.5,
-4.070726, -3.910061, -2, 1, 1.5, 0.5, 0.5,
-4.070726, -3.910061, -2, 0, 1.5, 0.5, 0.5,
-4.070726, -3.910061, 0, 0, -0.5, 0.5, 0.5,
-4.070726, -3.910061, 0, 1, -0.5, 0.5, 0.5,
-4.070726, -3.910061, 0, 1, 1.5, 0.5, 0.5,
-4.070726, -3.910061, 0, 0, 1.5, 0.5, 0.5,
-4.070726, -3.910061, 2, 0, -0.5, 0.5, 0.5,
-4.070726, -3.910061, 2, 1, -0.5, 0.5, 0.5,
-4.070726, -3.910061, 2, 1, 1.5, 0.5, 0.5,
-4.070726, -3.910061, 2, 0, 1.5, 0.5, 0.5,
-4.070726, -3.910061, 4, 0, -0.5, 0.5, 0.5,
-4.070726, -3.910061, 4, 1, -0.5, 0.5, 0.5,
-4.070726, -3.910061, 4, 1, 1.5, 0.5, 0.5,
-4.070726, -3.910061, 4, 0, 1.5, 0.5, 0.5
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
-3.523185, -3.372706, -4.992683,
-3.523185, 3.792026, -4.992683,
-3.523185, -3.372706, 5.721381,
-3.523185, 3.792026, 5.721381,
-3.523185, -3.372706, -4.992683,
-3.523185, -3.372706, 5.721381,
-3.523185, 3.792026, -4.992683,
-3.523185, 3.792026, 5.721381,
-3.523185, -3.372706, -4.992683,
3.777356, -3.372706, -4.992683,
-3.523185, -3.372706, 5.721381,
3.777356, -3.372706, 5.721381,
-3.523185, 3.792026, -4.992683,
3.777356, 3.792026, -4.992683,
-3.523185, 3.792026, 5.721381,
3.777356, 3.792026, 5.721381,
3.777356, -3.372706, -4.992683,
3.777356, 3.792026, -4.992683,
3.777356, -3.372706, 5.721381,
3.777356, 3.792026, 5.721381,
3.777356, -3.372706, -4.992683,
3.777356, -3.372706, 5.721381,
3.777356, 3.792026, -4.992683,
3.777356, 3.792026, 5.721381
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
var radius = 7.909809;
var distance = 35.19164;
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
mvMatrix.translate( -0.1270853, -0.2096599, -0.3643489 );
mvMatrix.scale( 1.171453, 1.193658, 0.7982257 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.19164);
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
XMC<-read.table("XMC.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-XMC$V2
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
```

```r
y<-XMC$V3
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
```

```r
z<-XMC$V4
```

```
## Error in eval(expr, envir, enclos): object 'XMC' not found
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
-3.416867, -1.504401, -2.298233, 0, 0, 1, 1, 1,
-2.823123, 1.02319, -2.278145, 1, 0, 0, 1, 1,
-2.733295, -0.3157119, -1.27431, 1, 0, 0, 1, 1,
-2.686583, -0.4894794, -2.21726, 1, 0, 0, 1, 1,
-2.684135, -1.374785, -1.883732, 1, 0, 0, 1, 1,
-2.628858, 0.7253066, -0.4031405, 1, 0, 0, 1, 1,
-2.609832, -1.140579, -2.253532, 0, 0, 0, 1, 1,
-2.598473, 0.7968055, -1.184397, 0, 0, 0, 1, 1,
-2.459228, -0.4008009, -0.7560692, 0, 0, 0, 1, 1,
-2.391694, -0.6377277, 0.3574691, 0, 0, 0, 1, 1,
-2.386978, -1.791652, -2.354869, 0, 0, 0, 1, 1,
-2.365904, -0.5850288, -2.103512, 0, 0, 0, 1, 1,
-2.355237, -1.088641, -1.535517, 0, 0, 0, 1, 1,
-2.317451, -1.512668, -2.713759, 1, 1, 1, 1, 1,
-2.298276, -2.409159, -2.811911, 1, 1, 1, 1, 1,
-2.251478, -0.9363702, -1.933922, 1, 1, 1, 1, 1,
-2.184242, -0.3523311, -1.039715, 1, 1, 1, 1, 1,
-2.150384, 1.425573, -0.2388051, 1, 1, 1, 1, 1,
-2.144601, -1.497635, -3.489151, 1, 1, 1, 1, 1,
-2.120786, 0.1054398, -1.622463, 1, 1, 1, 1, 1,
-2.085256, -0.7907981, -1.430703, 1, 1, 1, 1, 1,
-2.072278, 1.188477, -0.292811, 1, 1, 1, 1, 1,
-2.038898, 0.1120259, -1.766916, 1, 1, 1, 1, 1,
-2.018016, 0.2379557, -2.545115, 1, 1, 1, 1, 1,
-1.998972, -0.05687876, -1.15566, 1, 1, 1, 1, 1,
-1.997668, -0.4430721, -2.030755, 1, 1, 1, 1, 1,
-1.960376, 0.3964558, -0.7584339, 1, 1, 1, 1, 1,
-1.934067, 0.95236, 0.5145006, 1, 1, 1, 1, 1,
-1.916866, -0.2533545, -1.595419, 0, 0, 1, 1, 1,
-1.913246, 0.9900787, 0.4559676, 1, 0, 0, 1, 1,
-1.911696, -0.6857787, -2.386297, 1, 0, 0, 1, 1,
-1.877411, -0.7512448, -2.281686, 1, 0, 0, 1, 1,
-1.857908, 0.5663752, -2.211145, 1, 0, 0, 1, 1,
-1.848074, -0.5513107, -2.215696, 1, 0, 0, 1, 1,
-1.832412, -0.5540004, -2.637957, 0, 0, 0, 1, 1,
-1.80446, -1.118492, -1.628267, 0, 0, 0, 1, 1,
-1.785164, -0.5148139, -1.677721, 0, 0, 0, 1, 1,
-1.771373, 0.7527723, -0.3124837, 0, 0, 0, 1, 1,
-1.768657, -0.5332684, -1.660507, 0, 0, 0, 1, 1,
-1.76263, 0.5132685, -1.479487, 0, 0, 0, 1, 1,
-1.751164, -1.09073, -3.067917, 0, 0, 0, 1, 1,
-1.728989, -0.4707709, -3.210361, 1, 1, 1, 1, 1,
-1.724084, 0.1187005, -2.359634, 1, 1, 1, 1, 1,
-1.721627, -1.650571, -0.8895889, 1, 1, 1, 1, 1,
-1.702891, -0.2983919, -0.9971108, 1, 1, 1, 1, 1,
-1.694541, -0.2457453, 0.03413951, 1, 1, 1, 1, 1,
-1.689093, 1.195162, -0.7827209, 1, 1, 1, 1, 1,
-1.681784, 1.458222, -0.3067431, 1, 1, 1, 1, 1,
-1.667539, -0.08100668, -0.8986142, 1, 1, 1, 1, 1,
-1.64717, -1.693219, -1.63543, 1, 1, 1, 1, 1,
-1.635237, -0.9257053, -2.349509, 1, 1, 1, 1, 1,
-1.633355, 0.5925654, -1.37885, 1, 1, 1, 1, 1,
-1.630916, 0.0402006, -3.527914, 1, 1, 1, 1, 1,
-1.605893, -0.2498335, 0.2497898, 1, 1, 1, 1, 1,
-1.602449, -0.2040274, -3.368364, 1, 1, 1, 1, 1,
-1.595992, 1.023944, -0.6758676, 1, 1, 1, 1, 1,
-1.576854, -0.3139573, -3.487602, 0, 0, 1, 1, 1,
-1.568554, 1.474955, -1.020769, 1, 0, 0, 1, 1,
-1.561185, -0.5407354, -1.864093, 1, 0, 0, 1, 1,
-1.549635, -0.05263015, -1.312525, 1, 0, 0, 1, 1,
-1.54553, -0.8698467, -1.124962, 1, 0, 0, 1, 1,
-1.540132, -0.7491387, -3.111348, 1, 0, 0, 1, 1,
-1.529846, 0.4617767, -1.289995, 0, 0, 0, 1, 1,
-1.519268, 0.16592, -2.718574, 0, 0, 0, 1, 1,
-1.504089, -0.233627, -2.232468, 0, 0, 0, 1, 1,
-1.499153, 0.3525212, 0.2371754, 0, 0, 0, 1, 1,
-1.498518, -2.245028, -2.287429, 0, 0, 0, 1, 1,
-1.496037, -1.514772, -1.812976, 0, 0, 0, 1, 1,
-1.478564, 0.6638475, -2.479774, 0, 0, 0, 1, 1,
-1.472353, 2.634353, -1.486799, 1, 1, 1, 1, 1,
-1.456716, -0.4799115, -1.994318, 1, 1, 1, 1, 1,
-1.448579, 0.6591488, -1.451626, 1, 1, 1, 1, 1,
-1.443057, 1.102603, -1.250701, 1, 1, 1, 1, 1,
-1.440369, -0.3169761, -1.26262, 1, 1, 1, 1, 1,
-1.433379, -0.9625223, -3.527166, 1, 1, 1, 1, 1,
-1.42915, -3.268366, -2.998647, 1, 1, 1, 1, 1,
-1.424879, 0.9591533, -0.2856765, 1, 1, 1, 1, 1,
-1.424493, 0.2827002, 0.9929508, 1, 1, 1, 1, 1,
-1.419572, 0.6866842, -1.648896, 1, 1, 1, 1, 1,
-1.41808, -0.040526, -0.9912912, 1, 1, 1, 1, 1,
-1.415615, -0.9215941, -1.04152, 1, 1, 1, 1, 1,
-1.413951, 0.6418994, -1.601505, 1, 1, 1, 1, 1,
-1.410449, 0.00308171, -3.003948, 1, 1, 1, 1, 1,
-1.409193, 1.005649, 0.3508623, 1, 1, 1, 1, 1,
-1.399043, 0.01048698, -3.095648, 0, 0, 1, 1, 1,
-1.398794, -0.7108009, -0.521365, 1, 0, 0, 1, 1,
-1.391912, -0.512632, -0.6403497, 1, 0, 0, 1, 1,
-1.386322, -0.02109515, -3.438794, 1, 0, 0, 1, 1,
-1.382331, 0.9913821, -1.022378, 1, 0, 0, 1, 1,
-1.381025, 0.6535459, 0.2534305, 1, 0, 0, 1, 1,
-1.366341, 2.053687, -2.32369, 0, 0, 0, 1, 1,
-1.357138, 0.1242512, -1.183409, 0, 0, 0, 1, 1,
-1.348962, 0.2467896, -1.111352, 0, 0, 0, 1, 1,
-1.344563, 0.254936, -1.499775, 0, 0, 0, 1, 1,
-1.33725, 1.663862, -1.767524, 0, 0, 0, 1, 1,
-1.317381, 0.2320485, -2.795455, 0, 0, 0, 1, 1,
-1.31056, -0.5904256, -2.431751, 0, 0, 0, 1, 1,
-1.309152, 0.6671005, -0.8452002, 1, 1, 1, 1, 1,
-1.308556, 0.9789636, 0.4556645, 1, 1, 1, 1, 1,
-1.30778, 1.374176, 0.3589714, 1, 1, 1, 1, 1,
-1.302412, -0.3635762, -1.962871, 1, 1, 1, 1, 1,
-1.294728, 0.7246891, 0.04144309, 1, 1, 1, 1, 1,
-1.293568, 0.6927085, -0.7875915, 1, 1, 1, 1, 1,
-1.282824, -0.1148864, 0.2407213, 1, 1, 1, 1, 1,
-1.279103, -2.40202, -2.523359, 1, 1, 1, 1, 1,
-1.273547, -0.8969476, -3.372156, 1, 1, 1, 1, 1,
-1.267192, 1.203925, -2.150037, 1, 1, 1, 1, 1,
-1.235627, 0.1456103, -0.8524668, 1, 1, 1, 1, 1,
-1.234496, 1.845254, -0.4579414, 1, 1, 1, 1, 1,
-1.221933, 0.3558193, -1.623498, 1, 1, 1, 1, 1,
-1.22154, -1.030357, -2.623416, 1, 1, 1, 1, 1,
-1.214573, -0.1026335, -1.515988, 1, 1, 1, 1, 1,
-1.169798, 0.7591326, -0.02298241, 0, 0, 1, 1, 1,
-1.169287, 0.819868, -0.805871, 1, 0, 0, 1, 1,
-1.161366, -0.8480101, -0.4645322, 1, 0, 0, 1, 1,
-1.154589, 1.346745, -1.098011, 1, 0, 0, 1, 1,
-1.150849, -2.337686, -2.697421, 1, 0, 0, 1, 1,
-1.150412, -0.810648, -1.699529, 1, 0, 0, 1, 1,
-1.145432, -0.4866979, -2.084083, 0, 0, 0, 1, 1,
-1.144383, -0.2713793, -0.1672979, 0, 0, 0, 1, 1,
-1.129766, -0.4152278, -2.666478, 0, 0, 0, 1, 1,
-1.128069, -2.499504, -3.657034, 0, 0, 0, 1, 1,
-1.115795, 0.1842367, 0.8021716, 0, 0, 0, 1, 1,
-1.109773, -0.3265542, -2.795951, 0, 0, 0, 1, 1,
-1.102958, 0.4837909, -2.934532, 0, 0, 0, 1, 1,
-1.101037, -1.191822, -3.070504, 1, 1, 1, 1, 1,
-1.091937, -1.680408, -2.557686, 1, 1, 1, 1, 1,
-1.088454, 1.005059, -0.0175554, 1, 1, 1, 1, 1,
-1.086939, 0.06988961, -3.735246, 1, 1, 1, 1, 1,
-1.086402, -0.2435426, -2.410708, 1, 1, 1, 1, 1,
-1.079716, -1.589544, -1.035144, 1, 1, 1, 1, 1,
-1.076913, 0.1364074, -3.170339, 1, 1, 1, 1, 1,
-1.076422, -0.7431413, -2.002849, 1, 1, 1, 1, 1,
-1.062695, -0.0690282, -1.830801, 1, 1, 1, 1, 1,
-1.057275, 1.531218, -0.3783655, 1, 1, 1, 1, 1,
-1.04856, 1.845927, -0.2848824, 1, 1, 1, 1, 1,
-1.040715, 0.9319044, -0.9016628, 1, 1, 1, 1, 1,
-1.039305, -2.258821, -0.9792138, 1, 1, 1, 1, 1,
-1.037782, 0.6606191, -1.238383, 1, 1, 1, 1, 1,
-1.034611, 2.415792, 0.8931729, 1, 1, 1, 1, 1,
-1.032476, 1.038445, -1.184682, 0, 0, 1, 1, 1,
-1.023334, 0.7123824, -1.378365, 1, 0, 0, 1, 1,
-1.021603, 2.030588, -1.125731, 1, 0, 0, 1, 1,
-1.020447, -0.06389094, -2.22568, 1, 0, 0, 1, 1,
-1.013299, -0.02865717, -2.466799, 1, 0, 0, 1, 1,
-1.011994, -0.8856124, -2.5099, 1, 0, 0, 1, 1,
-1.00923, 1.469818, -0.7115425, 0, 0, 0, 1, 1,
-1.008593, 0.5466861, -1.747671, 0, 0, 0, 1, 1,
-1.008158, 0.6296601, -1.734249, 0, 0, 0, 1, 1,
-1.007406, 0.9807979, -1.603525, 0, 0, 0, 1, 1,
-0.999948, -0.8297147, -2.649552, 0, 0, 0, 1, 1,
-0.9997104, -0.7975644, -3.853082, 0, 0, 0, 1, 1,
-0.9990005, 2.369716, -1.860483, 0, 0, 0, 1, 1,
-0.9955554, 0.9420873, -0.7701433, 1, 1, 1, 1, 1,
-0.9921377, -1.682657, -1.196054, 1, 1, 1, 1, 1,
-0.9893562, -0.956661, -2.057663, 1, 1, 1, 1, 1,
-0.985764, -0.4494882, -1.941438, 1, 1, 1, 1, 1,
-0.9846306, 0.7302019, -0.8598837, 1, 1, 1, 1, 1,
-0.9805793, -1.156053, -1.951532, 1, 1, 1, 1, 1,
-0.9717816, -1.405688, -1.943317, 1, 1, 1, 1, 1,
-0.9683923, -0.5620061, -1.218471, 1, 1, 1, 1, 1,
-0.966902, 1.621861, 1.025423, 1, 1, 1, 1, 1,
-0.9659665, -0.5790244, -2.848647, 1, 1, 1, 1, 1,
-0.9645329, 2.94157, -0.621996, 1, 1, 1, 1, 1,
-0.9601185, -0.1782027, -3.111302, 1, 1, 1, 1, 1,
-0.9466826, 0.1002006, -0.9144861, 1, 1, 1, 1, 1,
-0.9306716, 2.644201, -0.8187481, 1, 1, 1, 1, 1,
-0.9226217, 0.8954872, -0.4266829, 1, 1, 1, 1, 1,
-0.9163764, -0.03629033, -2.405066, 0, 0, 1, 1, 1,
-0.9147849, -0.1620951, -3.582907, 1, 0, 0, 1, 1,
-0.9114745, 0.7140138, -2.996527, 1, 0, 0, 1, 1,
-0.9094186, -0.08328353, -1.991284, 1, 0, 0, 1, 1,
-0.9084094, 1.530669, -0.7493912, 1, 0, 0, 1, 1,
-0.9074322, 0.5033938, -1.926375, 1, 0, 0, 1, 1,
-0.9065547, 0.403063, -2.485173, 0, 0, 0, 1, 1,
-0.9038195, -0.3122672, -1.915766, 0, 0, 0, 1, 1,
-0.8992696, 0.3288049, 0.2778537, 0, 0, 0, 1, 1,
-0.8980718, 0.06623309, -2.694036, 0, 0, 0, 1, 1,
-0.8938307, 0.4726034, -1.646108, 0, 0, 0, 1, 1,
-0.8926001, 1.598013, 2.592361, 0, 0, 0, 1, 1,
-0.8899858, -0.4497463, -2.283828, 0, 0, 0, 1, 1,
-0.8835893, -0.2342957, -3.107811, 1, 1, 1, 1, 1,
-0.8753173, -1.587312, -1.123712, 1, 1, 1, 1, 1,
-0.8752823, -1.239322, -3.647674, 1, 1, 1, 1, 1,
-0.8749734, 2.004504, 1.394252, 1, 1, 1, 1, 1,
-0.868653, -1.268156, -2.989353, 1, 1, 1, 1, 1,
-0.8666679, 0.1148649, -2.216221, 1, 1, 1, 1, 1,
-0.8657295, -1.381546, -2.669896, 1, 1, 1, 1, 1,
-0.8619752, 1.441268, -0.1573613, 1, 1, 1, 1, 1,
-0.8618389, -1.390079, -1.673739, 1, 1, 1, 1, 1,
-0.858659, 1.801337, 0.5310531, 1, 1, 1, 1, 1,
-0.85616, -0.9546964, -1.465743, 1, 1, 1, 1, 1,
-0.8543835, -1.231927, -3.547011, 1, 1, 1, 1, 1,
-0.8389689, 0.1096696, -3.192393, 1, 1, 1, 1, 1,
-0.8299799, 0.9388173, -1.9102, 1, 1, 1, 1, 1,
-0.8259168, -1.419164, -1.184016, 1, 1, 1, 1, 1,
-0.825661, 0.287181, -2.132577, 0, 0, 1, 1, 1,
-0.8180801, -0.5163683, -0.9549055, 1, 0, 0, 1, 1,
-0.8046086, -1.463444, -2.162736, 1, 0, 0, 1, 1,
-0.8031627, -0.1237966, -2.115808, 1, 0, 0, 1, 1,
-0.80206, -2.249675, -2.947418, 1, 0, 0, 1, 1,
-0.8016926, -1.192728, -1.188901, 1, 0, 0, 1, 1,
-0.8008938, 1.143273, 0.724916, 0, 0, 0, 1, 1,
-0.7974181, 0.7983388, 1.222641, 0, 0, 0, 1, 1,
-0.7951543, -1.155817, -2.497545, 0, 0, 0, 1, 1,
-0.7946753, -0.4402907, -2.23067, 0, 0, 0, 1, 1,
-0.7891521, -1.003047, -2.184789, 0, 0, 0, 1, 1,
-0.7872162, 0.5529698, -0.955975, 0, 0, 0, 1, 1,
-0.7858257, -1.315711, -1.58246, 0, 0, 0, 1, 1,
-0.785442, -0.4162776, -4.203755, 1, 1, 1, 1, 1,
-0.779682, -0.8084088, -4.660644, 1, 1, 1, 1, 1,
-0.7785771, -0.7149373, -1.02752, 1, 1, 1, 1, 1,
-0.7758073, 1.21293, -0.1215429, 1, 1, 1, 1, 1,
-0.7683803, -0.6326176, -4.836653, 1, 1, 1, 1, 1,
-0.7655467, 0.2540842, -2.19184, 1, 1, 1, 1, 1,
-0.7651374, -2.993445, -2.045129, 1, 1, 1, 1, 1,
-0.7650961, 0.3683878, -1.043592, 1, 1, 1, 1, 1,
-0.7625725, -2.185115, -1.622689, 1, 1, 1, 1, 1,
-0.7620205, -1.267694, -1.431772, 1, 1, 1, 1, 1,
-0.7589979, 0.28828, -1.416964, 1, 1, 1, 1, 1,
-0.7500011, 0.2966681, -1.279591, 1, 1, 1, 1, 1,
-0.7499588, 2.174274, 0.911972, 1, 1, 1, 1, 1,
-0.7488658, -0.6491878, -2.648181, 1, 1, 1, 1, 1,
-0.7482594, -0.7189047, -3.464366, 1, 1, 1, 1, 1,
-0.7464912, 0.1167745, 0.4118401, 0, 0, 1, 1, 1,
-0.7440804, -0.5772028, -0.9470316, 1, 0, 0, 1, 1,
-0.7427013, -0.1277401, -2.459181, 1, 0, 0, 1, 1,
-0.7410657, 0.3745177, -0.8279631, 1, 0, 0, 1, 1,
-0.7374211, 0.477449, 0.4629626, 1, 0, 0, 1, 1,
-0.7351859, 0.5246336, -2.634569, 1, 0, 0, 1, 1,
-0.7344462, -0.008781235, -1.259964, 0, 0, 0, 1, 1,
-0.7331584, -0.3464464, -2.023512, 0, 0, 0, 1, 1,
-0.7301336, 0.5885981, -1.461466, 0, 0, 0, 1, 1,
-0.7293404, -0.2387218, -2.732782, 0, 0, 0, 1, 1,
-0.7197351, -0.4560913, -2.769935, 0, 0, 0, 1, 1,
-0.7191622, 0.6482756, -3.649719, 0, 0, 0, 1, 1,
-0.714116, 0.1259173, -1.156629, 0, 0, 0, 1, 1,
-0.708997, -1.301613, -3.237199, 1, 1, 1, 1, 1,
-0.7075199, -0.9319046, -1.405221, 1, 1, 1, 1, 1,
-0.7003154, 0.1672863, -0.9475111, 1, 1, 1, 1, 1,
-0.699588, 0.5522546, -1.118685, 1, 1, 1, 1, 1,
-0.6983911, 0.8222973, 0.195125, 1, 1, 1, 1, 1,
-0.6874802, 0.002884154, -0.3861499, 1, 1, 1, 1, 1,
-0.6869552, 0.4560977, -0.07766828, 1, 1, 1, 1, 1,
-0.6867294, -1.13746, -2.855224, 1, 1, 1, 1, 1,
-0.6850294, 0.4622427, -0.3966496, 1, 1, 1, 1, 1,
-0.6820464, -1.272097, -3.282081, 1, 1, 1, 1, 1,
-0.6767412, -0.01085349, -1.313039, 1, 1, 1, 1, 1,
-0.6766068, 2.92907, -1.54142, 1, 1, 1, 1, 1,
-0.6758579, -1.457407, -1.835974, 1, 1, 1, 1, 1,
-0.666198, -1.289116, -2.317967, 1, 1, 1, 1, 1,
-0.6616563, 0.6599688, 0.7744135, 1, 1, 1, 1, 1,
-0.6579423, -0.7067824, -3.712265, 0, 0, 1, 1, 1,
-0.655799, -0.6277597, -3.309163, 1, 0, 0, 1, 1,
-0.6502693, -1.503389, -3.37362, 1, 0, 0, 1, 1,
-0.6455957, -0.0596498, -1.696335, 1, 0, 0, 1, 1,
-0.6403964, -0.8093653, -2.207191, 1, 0, 0, 1, 1,
-0.6312962, -0.3528357, -2.205721, 1, 0, 0, 1, 1,
-0.628529, 0.1230582, -0.397948, 0, 0, 0, 1, 1,
-0.6274856, 0.5425963, -0.729681, 0, 0, 0, 1, 1,
-0.6207595, 1.396446, 0.8321405, 0, 0, 0, 1, 1,
-0.6183393, -0.1473764, -1.324927, 0, 0, 0, 1, 1,
-0.6177361, 1.098388, -1.554456, 0, 0, 0, 1, 1,
-0.6139442, 0.7116698, -0.01114879, 0, 0, 0, 1, 1,
-0.6136495, 0.8908297, -1.561509, 0, 0, 0, 1, 1,
-0.6133329, 0.1722126, -3.305953, 1, 1, 1, 1, 1,
-0.6081511, 0.9463683, -0.4105401, 1, 1, 1, 1, 1,
-0.6062995, -0.4230651, -3.356878, 1, 1, 1, 1, 1,
-0.6004518, 0.6661502, -2.118634, 1, 1, 1, 1, 1,
-0.5998921, 0.2718697, -2.094147, 1, 1, 1, 1, 1,
-0.5968974, 0.1320687, -1.85393, 1, 1, 1, 1, 1,
-0.591301, -2.054352, -2.15733, 1, 1, 1, 1, 1,
-0.5869126, -0.8836806, -3.729176, 1, 1, 1, 1, 1,
-0.5868732, 2.012954, 0.5208511, 1, 1, 1, 1, 1,
-0.5848678, 0.8696221, -0.372704, 1, 1, 1, 1, 1,
-0.574654, 0.2874841, -1.833331, 1, 1, 1, 1, 1,
-0.5723534, -0.1948237, -1.370229, 1, 1, 1, 1, 1,
-0.5721888, 0.02323505, -1.756864, 1, 1, 1, 1, 1,
-0.5691894, -0.01572529, -3.138468, 1, 1, 1, 1, 1,
-0.5662526, -1.601311, -3.208082, 1, 1, 1, 1, 1,
-0.5649726, -0.6348888, -1.208786, 0, 0, 1, 1, 1,
-0.5636269, 0.4278109, -0.03672076, 1, 0, 0, 1, 1,
-0.5625225, -0.1818192, -0.8156617, 1, 0, 0, 1, 1,
-0.5568039, -0.5306542, -1.459581, 1, 0, 0, 1, 1,
-0.5543762, 1.063499, -3.445961, 1, 0, 0, 1, 1,
-0.5525565, -1.714509, -2.075858, 1, 0, 0, 1, 1,
-0.5511132, -1.417705, -3.699064, 0, 0, 0, 1, 1,
-0.5499413, -0.4517343, -1.45452, 0, 0, 0, 1, 1,
-0.5484332, -1.724548, -1.805794, 0, 0, 0, 1, 1,
-0.544822, -0.4070551, -2.596126, 0, 0, 0, 1, 1,
-0.5372069, 0.6941111, -2.44995, 0, 0, 0, 1, 1,
-0.5362182, -0.2141692, -2.291603, 0, 0, 0, 1, 1,
-0.5342169, 0.2666336, -1.493828, 0, 0, 0, 1, 1,
-0.5291466, -0.3940991, -1.99272, 1, 1, 1, 1, 1,
-0.5286471, -0.1869264, -1.074108, 1, 1, 1, 1, 1,
-0.5262555, 0.8912262, -0.8933229, 1, 1, 1, 1, 1,
-0.5251818, -0.537564, -3.076936, 1, 1, 1, 1, 1,
-0.5245555, 0.4209239, 0.8178907, 1, 1, 1, 1, 1,
-0.5230091, -1.100507, -3.006477, 1, 1, 1, 1, 1,
-0.5182574, 1.037968, -0.1603339, 1, 1, 1, 1, 1,
-0.5176812, 0.1727262, -0.07765735, 1, 1, 1, 1, 1,
-0.5125272, -1.046395, -1.820667, 1, 1, 1, 1, 1,
-0.5067959, -0.4393675, -2.174028, 1, 1, 1, 1, 1,
-0.5067899, -0.003503599, -1.069038, 1, 1, 1, 1, 1,
-0.5046516, 1.738563, -0.4680325, 1, 1, 1, 1, 1,
-0.5041335, 0.8991814, 0.03234103, 1, 1, 1, 1, 1,
-0.5027418, -1.332973, -3.343497, 1, 1, 1, 1, 1,
-0.4975959, 0.359295, -0.5713948, 1, 1, 1, 1, 1,
-0.4937324, 0.4495499, -2.386185, 0, 0, 1, 1, 1,
-0.4929831, 1.818274, -0.2358401, 1, 0, 0, 1, 1,
-0.4926271, -1.006552, -2.824039, 1, 0, 0, 1, 1,
-0.491308, -1.050048, -4.269726, 1, 0, 0, 1, 1,
-0.4877017, -0.117863, -0.9735235, 1, 0, 0, 1, 1,
-0.4843751, -0.02827601, -1.591842, 1, 0, 0, 1, 1,
-0.4841144, 1.766649, -1.963626, 0, 0, 0, 1, 1,
-0.4779636, 1.597354, 0.5106874, 0, 0, 0, 1, 1,
-0.4690436, -0.5604707, -3.477092, 0, 0, 0, 1, 1,
-0.46544, -1.927086, -2.218061, 0, 0, 0, 1, 1,
-0.463891, 0.5850642, -0.4849412, 0, 0, 0, 1, 1,
-0.4632849, 1.081552, -0.5870569, 0, 0, 0, 1, 1,
-0.461362, 1.136338, -0.1877628, 0, 0, 0, 1, 1,
-0.4546452, -1.879758, -3.448623, 1, 1, 1, 1, 1,
-0.4474207, 0.8772535, 0.2582813, 1, 1, 1, 1, 1,
-0.4433425, -0.3388495, -1.763331, 1, 1, 1, 1, 1,
-0.44196, -0.3063059, -2.216448, 1, 1, 1, 1, 1,
-0.440341, 0.6765497, -0.5205345, 1, 1, 1, 1, 1,
-0.4398663, 0.02957223, -1.660795, 1, 1, 1, 1, 1,
-0.4394631, -1.91394, -2.640422, 1, 1, 1, 1, 1,
-0.4253775, 0.09643184, -3.730977, 1, 1, 1, 1, 1,
-0.4232835, -0.6601745, -2.718805, 1, 1, 1, 1, 1,
-0.4136898, 0.2787929, -1.185304, 1, 1, 1, 1, 1,
-0.4119019, -0.702504, -2.019012, 1, 1, 1, 1, 1,
-0.4116209, -0.7655226, -3.128657, 1, 1, 1, 1, 1,
-0.4025934, -0.8289702, -3.091519, 1, 1, 1, 1, 1,
-0.3995763, -1.125722, -1.969624, 1, 1, 1, 1, 1,
-0.3984274, 0.4679186, -0.672074, 1, 1, 1, 1, 1,
-0.3957053, 0.8279015, -1.317931, 0, 0, 1, 1, 1,
-0.395458, 0.872642, 0.5174153, 1, 0, 0, 1, 1,
-0.394456, -1.084539, -1.02479, 1, 0, 0, 1, 1,
-0.3939054, -0.1027584, -1.541928, 1, 0, 0, 1, 1,
-0.3866792, -0.3726684, -1.586487, 1, 0, 0, 1, 1,
-0.3852273, 0.3072152, 0.2389199, 1, 0, 0, 1, 1,
-0.3842793, 1.862997, -0.8598048, 0, 0, 0, 1, 1,
-0.3792444, 0.3391749, -1.126857, 0, 0, 0, 1, 1,
-0.3783168, 0.2795894, -1.091075, 0, 0, 0, 1, 1,
-0.3782694, -1.596366, -3.127599, 0, 0, 0, 1, 1,
-0.3760266, -0.7413884, -4.35304, 0, 0, 0, 1, 1,
-0.375629, -0.8468142, -3.147483, 0, 0, 0, 1, 1,
-0.373924, -1.587377, -2.771151, 0, 0, 0, 1, 1,
-0.3699037, 0.2538236, -1.058208, 1, 1, 1, 1, 1,
-0.3675256, 0.6025583, -1.039364, 1, 1, 1, 1, 1,
-0.3648195, -0.110093, -1.766972, 1, 1, 1, 1, 1,
-0.3583449, 0.1306686, -0.426867, 1, 1, 1, 1, 1,
-0.3565036, -0.6005654, -2.126748, 1, 1, 1, 1, 1,
-0.3548901, 1.893893, -1.652263, 1, 1, 1, 1, 1,
-0.353389, 0.8563094, -1.479779, 1, 1, 1, 1, 1,
-0.3530716, 1.395854, -1.307149, 1, 1, 1, 1, 1,
-0.3521131, -0.2795573, -2.0987, 1, 1, 1, 1, 1,
-0.3509265, 1.081036, -1.626759, 1, 1, 1, 1, 1,
-0.3484532, 0.2443582, -1.758852, 1, 1, 1, 1, 1,
-0.3433301, 1.124411, -1.241354, 1, 1, 1, 1, 1,
-0.3423488, 0.03475035, -0.4444033, 1, 1, 1, 1, 1,
-0.3393061, -0.5447699, -2.745118, 1, 1, 1, 1, 1,
-0.336731, 1.570675, 0.2116996, 1, 1, 1, 1, 1,
-0.3357175, 0.8017572, -0.1800455, 0, 0, 1, 1, 1,
-0.3350856, -0.5831388, -4.159136, 1, 0, 0, 1, 1,
-0.3343928, 0.2928259, -0.2357495, 1, 0, 0, 1, 1,
-0.332433, 0.7945973, -0.7874225, 1, 0, 0, 1, 1,
-0.3163479, 0.7497314, 0.1606038, 1, 0, 0, 1, 1,
-0.3153495, -0.6515644, -2.153102, 1, 0, 0, 1, 1,
-0.3113434, 0.6723647, -0.7664891, 0, 0, 0, 1, 1,
-0.3101638, -0.6274887, -3.204267, 0, 0, 0, 1, 1,
-0.3052686, -0.9742153, -1.807463, 0, 0, 0, 1, 1,
-0.304979, 1.19135, -0.2424034, 0, 0, 0, 1, 1,
-0.3049545, -0.4882388, -1.938485, 0, 0, 0, 1, 1,
-0.2981825, -0.3706953, -2.968626, 0, 0, 0, 1, 1,
-0.2904344, 0.3603966, -2.795597, 0, 0, 0, 1, 1,
-0.2897735, -0.1289771, -1.378305, 1, 1, 1, 1, 1,
-0.2892311, -1.2492, -4.16906, 1, 1, 1, 1, 1,
-0.2867923, -0.3031339, -2.047074, 1, 1, 1, 1, 1,
-0.2862325, -1.046154, -2.793833, 1, 1, 1, 1, 1,
-0.2831206, -1.384091, -3.815545, 1, 1, 1, 1, 1,
-0.2819138, 0.4725724, -1.216364, 1, 1, 1, 1, 1,
-0.2765117, -0.739942, -4.171916, 1, 1, 1, 1, 1,
-0.2756228, -2.458766, -2.745483, 1, 1, 1, 1, 1,
-0.2725578, -2.287501, -3.347174, 1, 1, 1, 1, 1,
-0.2720375, -0.6361595, -2.327259, 1, 1, 1, 1, 1,
-0.2688141, -0.8225737, -3.314974, 1, 1, 1, 1, 1,
-0.2678663, 0.1919758, -1.400508, 1, 1, 1, 1, 1,
-0.2660358, 1.861382, 0.6065938, 1, 1, 1, 1, 1,
-0.2618637, 0.3776861, -2.329043, 1, 1, 1, 1, 1,
-0.2600913, 1.683107, 0.8958544, 1, 1, 1, 1, 1,
-0.2596525, -1.469309, -1.861597, 0, 0, 1, 1, 1,
-0.2587578, -0.1644213, -1.462646, 1, 0, 0, 1, 1,
-0.2583938, 0.4508981, -0.04741714, 1, 0, 0, 1, 1,
-0.2583015, 0.2458595, -1.851158, 1, 0, 0, 1, 1,
-0.256925, 0.6687645, -1.140993, 1, 0, 0, 1, 1,
-0.2555691, -0.4665998, -2.431746, 1, 0, 0, 1, 1,
-0.2491375, 0.1565906, -0.6712503, 0, 0, 0, 1, 1,
-0.2483238, 1.215114, 2.533557, 0, 0, 0, 1, 1,
-0.2474857, -0.750398, -4.420479, 0, 0, 0, 1, 1,
-0.2471397, -1.384317, -3.177773, 0, 0, 0, 1, 1,
-0.2441257, -1.264658, -3.825556, 0, 0, 0, 1, 1,
-0.2438943, -1.39172, -3.197854, 0, 0, 0, 1, 1,
-0.2368121, -0.8567593, -2.446732, 0, 0, 0, 1, 1,
-0.2361099, -0.3173292, -2.613472, 1, 1, 1, 1, 1,
-0.2348673, -0.7676476, -3.267731, 1, 1, 1, 1, 1,
-0.2337677, 0.5967613, -0.9636742, 1, 1, 1, 1, 1,
-0.2328569, 0.1860438, -2.377592, 1, 1, 1, 1, 1,
-0.2314022, -0.5141385, -3.951001, 1, 1, 1, 1, 1,
-0.2305391, -0.7089055, -1.515882, 1, 1, 1, 1, 1,
-0.2305256, 3.568005, 0.3144303, 1, 1, 1, 1, 1,
-0.223521, 0.9203299, -0.03788085, 1, 1, 1, 1, 1,
-0.2231614, 0.4058824, -0.3604797, 1, 1, 1, 1, 1,
-0.2190341, -0.7399408, -0.7393284, 1, 1, 1, 1, 1,
-0.2180962, 0.1636557, -1.623839, 1, 1, 1, 1, 1,
-0.2178589, -0.9747328, -2.620433, 1, 1, 1, 1, 1,
-0.2177834, -0.1388107, -1.200219, 1, 1, 1, 1, 1,
-0.2150386, 1.664981, -0.7806004, 1, 1, 1, 1, 1,
-0.214395, 0.4659275, -0.8600321, 1, 1, 1, 1, 1,
-0.2137554, 0.2537335, -0.1885114, 0, 0, 1, 1, 1,
-0.2127005, 0.04026495, -2.951263, 1, 0, 0, 1, 1,
-0.2112597, 0.545332, -0.2406373, 1, 0, 0, 1, 1,
-0.2098367, 0.3892923, -0.8085079, 1, 0, 0, 1, 1,
-0.2097961, 0.6711371, -1.021672, 1, 0, 0, 1, 1,
-0.2094596, 0.3406978, 0.1858824, 1, 0, 0, 1, 1,
-0.2086433, 0.6213329, 1.529162, 0, 0, 0, 1, 1,
-0.206985, -0.4017368, -2.411458, 0, 0, 0, 1, 1,
-0.2023554, 0.1790433, -0.5424364, 0, 0, 0, 1, 1,
-0.2001061, -1.492494, -3.523989, 0, 0, 0, 1, 1,
-0.1989513, 0.9753633, -1.295332, 0, 0, 0, 1, 1,
-0.1971124, 1.485049, -2.123933, 0, 0, 0, 1, 1,
-0.1937524, 1.478482, 1.528873, 0, 0, 0, 1, 1,
-0.1892229, -1.943491, -4.533593, 1, 1, 1, 1, 1,
-0.1887126, 0.1226991, -1.637668, 1, 1, 1, 1, 1,
-0.1874247, -0.02806337, -0.719725, 1, 1, 1, 1, 1,
-0.1849946, -0.3885629, -3.437169, 1, 1, 1, 1, 1,
-0.1840665, -0.8487799, -3.550967, 1, 1, 1, 1, 1,
-0.1792746, 0.2476718, -0.68404, 1, 1, 1, 1, 1,
-0.1755887, -0.340431, -0.9760224, 1, 1, 1, 1, 1,
-0.1732292, -0.788865, -4.402102, 1, 1, 1, 1, 1,
-0.1710121, 0.2833796, 0.01808084, 1, 1, 1, 1, 1,
-0.1700751, 0.2408603, -1.312392, 1, 1, 1, 1, 1,
-0.1604147, 1.272726, 0.03070375, 1, 1, 1, 1, 1,
-0.1532059, 1.872748, 1.776063, 1, 1, 1, 1, 1,
-0.1494549, 0.3267756, 0.1328207, 1, 1, 1, 1, 1,
-0.1432652, -0.9472861, -2.272623, 1, 1, 1, 1, 1,
-0.1395975, 1.690571, 0.1364173, 1, 1, 1, 1, 1,
-0.1355942, -1.640284, -3.500333, 0, 0, 1, 1, 1,
-0.1313819, -0.604006, -3.081552, 1, 0, 0, 1, 1,
-0.1310737, -0.6784558, -4.107706, 1, 0, 0, 1, 1,
-0.1280478, -0.6063707, -4.66446, 1, 0, 0, 1, 1,
-0.1257687, 0.2867427, -0.09861275, 1, 0, 0, 1, 1,
-0.1241902, 0.09474631, -1.234353, 1, 0, 0, 1, 1,
-0.1228074, -1.891847, -2.333278, 0, 0, 0, 1, 1,
-0.1216393, -1.450282, -2.589757, 0, 0, 0, 1, 1,
-0.118778, -0.8776958, -3.3075, 0, 0, 0, 1, 1,
-0.1185923, -0.9762661, -1.997621, 0, 0, 0, 1, 1,
-0.1180146, -1.329686, -3.220645, 0, 0, 0, 1, 1,
-0.1179903, 0.6757714, 0.03446988, 0, 0, 0, 1, 1,
-0.1179247, -1.982354, -2.731435, 0, 0, 0, 1, 1,
-0.1166842, -0.8852987, -3.776094, 1, 1, 1, 1, 1,
-0.1164953, 1.360922, 0.9050832, 1, 1, 1, 1, 1,
-0.1142652, -0.7195802, -3.273315, 1, 1, 1, 1, 1,
-0.1138493, 0.08715442, -0.37153, 1, 1, 1, 1, 1,
-0.1103516, -0.664509, -4.212562, 1, 1, 1, 1, 1,
-0.1034623, 0.150667, -1.138529, 1, 1, 1, 1, 1,
-0.1025611, -2.757689, -3.354457, 1, 1, 1, 1, 1,
-0.09921087, 1.321722, -0.8812562, 1, 1, 1, 1, 1,
-0.09778952, -0.743378, -3.441791, 1, 1, 1, 1, 1,
-0.09723423, 1.5544, -0.6985822, 1, 1, 1, 1, 1,
-0.0962337, -1.291489, -3.390962, 1, 1, 1, 1, 1,
-0.08854844, -0.7742529, -2.036191, 1, 1, 1, 1, 1,
-0.0850863, 1.66447, 0.6389144, 1, 1, 1, 1, 1,
-0.08203365, -2.126536, -3.875765, 1, 1, 1, 1, 1,
-0.0806215, -0.1116439, -2.865191, 1, 1, 1, 1, 1,
-0.08045188, -0.6942641, -3.563548, 0, 0, 1, 1, 1,
-0.06952051, -0.7370325, -1.693806, 1, 0, 0, 1, 1,
-0.06771766, -1.514099, -3.080632, 1, 0, 0, 1, 1,
-0.06326335, -0.4259123, -1.961653, 1, 0, 0, 1, 1,
-0.0613877, 0.143292, -0.7700621, 1, 0, 0, 1, 1,
-0.05955228, -0.2624171, -2.932501, 1, 0, 0, 1, 1,
-0.05856009, 0.8335657, 0.156073, 0, 0, 0, 1, 1,
-0.05492045, 0.981292, -0.5426829, 0, 0, 0, 1, 1,
-0.05270252, -0.5426442, -4.206775, 0, 0, 0, 1, 1,
-0.05209611, 1.223317, -1.95259, 0, 0, 0, 1, 1,
-0.04681619, -0.006538616, -1.541382, 0, 0, 0, 1, 1,
-0.04276577, -0.8336778, -4.479138, 0, 0, 0, 1, 1,
-0.03994869, 0.6210562, -0.4537082, 0, 0, 0, 1, 1,
-0.03931268, 0.2105166, -1.873005, 1, 1, 1, 1, 1,
-0.0369531, -1.079429, -3.875429, 1, 1, 1, 1, 1,
-0.03673629, 1.424146, -0.6953666, 1, 1, 1, 1, 1,
-0.03287791, 0.8840308, 0.3887097, 1, 1, 1, 1, 1,
-0.03281304, -1.00807, -3.462475, 1, 1, 1, 1, 1,
-0.02868144, 1.608009, -1.942661, 1, 1, 1, 1, 1,
-0.02865027, 0.9884204, -0.7923203, 1, 1, 1, 1, 1,
-0.02330846, -2.214525, -3.491988, 1, 1, 1, 1, 1,
-0.02309226, 0.7500899, 1.080053, 1, 1, 1, 1, 1,
-0.02284409, -0.5542971, -3.692133, 1, 1, 1, 1, 1,
-0.02281801, 0.2475292, -0.8211632, 1, 1, 1, 1, 1,
-0.02115658, -0.1598244, -4.086066, 1, 1, 1, 1, 1,
-0.01911294, -1.19309, -2.487266, 1, 1, 1, 1, 1,
-0.01775955, 1.090687, 0.5367952, 1, 1, 1, 1, 1,
-0.01587676, -0.2456524, -2.099023, 1, 1, 1, 1, 1,
-0.01118697, -0.0652196, -3.291399, 0, 0, 1, 1, 1,
-0.01000663, -0.1088836, -3.343979, 1, 0, 0, 1, 1,
-0.007269646, 0.01894657, -0.9277505, 1, 0, 0, 1, 1,
-0.005672904, -1.925619, -3.731122, 1, 0, 0, 1, 1,
0.003584431, -0.3293753, 4.561854, 1, 0, 0, 1, 1,
0.00411458, 0.8972637, 1.050338, 1, 0, 0, 1, 1,
0.004146065, 0.1766867, 0.2073512, 0, 0, 0, 1, 1,
0.004515687, -0.4548601, 3.120194, 0, 0, 0, 1, 1,
0.007791154, -1.87894, 3.475688, 0, 0, 0, 1, 1,
0.01146098, 0.4423548, 0.801593, 0, 0, 0, 1, 1,
0.01884888, -0.508717, 1.157364, 0, 0, 0, 1, 1,
0.01975865, 0.9815041, -2.271109, 0, 0, 0, 1, 1,
0.02021672, 0.300219, -0.1453543, 0, 0, 0, 1, 1,
0.0240089, 0.8080265, -1.432628, 1, 1, 1, 1, 1,
0.02663541, -0.4772758, 3.257442, 1, 1, 1, 1, 1,
0.02784852, 1.083713, -0.99902, 1, 1, 1, 1, 1,
0.02970813, 0.2353637, -0.5773685, 1, 1, 1, 1, 1,
0.03119597, 0.359007, -0.2537182, 1, 1, 1, 1, 1,
0.03213917, 0.2150526, 0.09871852, 1, 1, 1, 1, 1,
0.03420963, 0.7486935, 2.144673, 1, 1, 1, 1, 1,
0.03494513, -0.5173732, 2.366507, 1, 1, 1, 1, 1,
0.03688541, -0.1997604, 4.762522, 1, 1, 1, 1, 1,
0.03843258, 0.5323637, 0.5916005, 1, 1, 1, 1, 1,
0.03944391, -0.760693, 2.665975, 1, 1, 1, 1, 1,
0.04141736, 1.541409, -0.03803612, 1, 1, 1, 1, 1,
0.0443687, 1.760055, -0.06776119, 1, 1, 1, 1, 1,
0.04442631, 0.5414222, 0.3460697, 1, 1, 1, 1, 1,
0.04452957, -0.2636415, 2.661012, 1, 1, 1, 1, 1,
0.04890901, 1.533807, -0.9948118, 0, 0, 1, 1, 1,
0.05175827, 0.504426, 1.408697, 1, 0, 0, 1, 1,
0.05548914, 2.169955, 0.5118895, 1, 0, 0, 1, 1,
0.06305903, 0.9973007, -1.925252, 1, 0, 0, 1, 1,
0.06435092, 0.3236023, 0.662244, 1, 0, 0, 1, 1,
0.06529993, 1.103631, -0.1028586, 1, 0, 0, 1, 1,
0.0689099, -0.04480755, 3.446473, 0, 0, 0, 1, 1,
0.06973399, 0.1748357, -0.8128868, 0, 0, 0, 1, 1,
0.07138959, -0.4730849, 2.040229, 0, 0, 0, 1, 1,
0.07723158, 1.029065, -0.1535912, 0, 0, 0, 1, 1,
0.07736719, 0.3152983, -0.1475846, 0, 0, 0, 1, 1,
0.07741603, -0.1942109, 3.388594, 0, 0, 0, 1, 1,
0.08274789, 1.602704, 0.2815541, 0, 0, 0, 1, 1,
0.09190968, 3.687685, -0.4212734, 1, 1, 1, 1, 1,
0.09370828, -0.4175259, 2.937923, 1, 1, 1, 1, 1,
0.09524798, 1.957368, -0.4038054, 1, 1, 1, 1, 1,
0.0971356, -0.2787254, 2.123517, 1, 1, 1, 1, 1,
0.1018092, -1.319247, 4.844786, 1, 1, 1, 1, 1,
0.1023975, -0.4200402, 4.513164, 1, 1, 1, 1, 1,
0.1024335, 1.116787, 0.3944697, 1, 1, 1, 1, 1,
0.1067713, -0.7608439, 4.026553, 1, 1, 1, 1, 1,
0.1110581, 2.041384, 1.162049, 1, 1, 1, 1, 1,
0.1183531, -1.329685, 2.932409, 1, 1, 1, 1, 1,
0.1209441, -1.406234, 2.15447, 1, 1, 1, 1, 1,
0.1242076, 0.08771101, 1.931022, 1, 1, 1, 1, 1,
0.125432, -1.049584, 1.93457, 1, 1, 1, 1, 1,
0.1270927, 0.8494272, 1.903695, 1, 1, 1, 1, 1,
0.1280755, -0.08592087, 2.119533, 1, 1, 1, 1, 1,
0.1295348, 1.48156, -0.1539323, 0, 0, 1, 1, 1,
0.1328777, 0.4220287, 0.4982224, 1, 0, 0, 1, 1,
0.1330094, 0.4051741, 0.07020184, 1, 0, 0, 1, 1,
0.133303, 0.6778011, 1.666353, 1, 0, 0, 1, 1,
0.1354318, -0.2101889, 2.166764, 1, 0, 0, 1, 1,
0.1388856, 1.063554, -1.475518, 1, 0, 0, 1, 1,
0.1391397, 0.3871062, 1.744557, 0, 0, 0, 1, 1,
0.1451836, -1.699944, 4.013692, 0, 0, 0, 1, 1,
0.145537, -0.2480114, 1.866953, 0, 0, 0, 1, 1,
0.1487923, -0.1265999, 1.384979, 0, 0, 0, 1, 1,
0.1495151, 0.923848, -0.5524455, 0, 0, 0, 1, 1,
0.1507893, 0.2754454, -0.6354631, 0, 0, 0, 1, 1,
0.1585998, -0.3342475, 5.210763, 0, 0, 0, 1, 1,
0.1589779, -0.2063428, 1.642492, 1, 1, 1, 1, 1,
0.1604251, 1.098411, 0.7304464, 1, 1, 1, 1, 1,
0.1715658, -0.4081578, 1.232135, 1, 1, 1, 1, 1,
0.172414, 0.7585546, 1.640545, 1, 1, 1, 1, 1,
0.1727615, -0.0586384, 2.266335, 1, 1, 1, 1, 1,
0.1731969, -1.430319, 3.369391, 1, 1, 1, 1, 1,
0.1773085, 1.231749, -0.2828906, 1, 1, 1, 1, 1,
0.177406, -0.1087853, -0.4962598, 1, 1, 1, 1, 1,
0.1799573, 0.852351, 0.160973, 1, 1, 1, 1, 1,
0.181016, 0.3137885, 1.308607, 1, 1, 1, 1, 1,
0.1826806, -2.09986, 4.180584, 1, 1, 1, 1, 1,
0.183287, -0.237884, 3.498572, 1, 1, 1, 1, 1,
0.1873147, -0.1079142, 1.483847, 1, 1, 1, 1, 1,
0.1883903, 1.747036, 1.02643, 1, 1, 1, 1, 1,
0.1909496, 1.569302, -0.4299002, 1, 1, 1, 1, 1,
0.1970572, 1.287649, 0.6151111, 0, 0, 1, 1, 1,
0.2017759, -0.1426596, 1.642201, 1, 0, 0, 1, 1,
0.2039597, -0.2863833, 0.7781336, 1, 0, 0, 1, 1,
0.2042827, -0.3590913, 2.164228, 1, 0, 0, 1, 1,
0.2055553, 0.4505345, -1.143708, 1, 0, 0, 1, 1,
0.2079332, -0.02477965, 3.808167, 1, 0, 0, 1, 1,
0.2098004, 0.1650756, 1.128121, 0, 0, 0, 1, 1,
0.2099134, -0.852773, 1.625071, 0, 0, 0, 1, 1,
0.2172466, -0.3154534, 2.782327, 0, 0, 0, 1, 1,
0.2179619, 0.05003909, 0.2698975, 0, 0, 0, 1, 1,
0.2211134, 0.5358042, -0.2993762, 0, 0, 0, 1, 1,
0.2220558, 1.535107, 0.8564521, 0, 0, 0, 1, 1,
0.2230714, -0.1197623, 4.230674, 0, 0, 0, 1, 1,
0.229742, -0.2584867, 3.944728, 1, 1, 1, 1, 1,
0.2305804, -0.4789885, 4.013478, 1, 1, 1, 1, 1,
0.2316487, -0.435931, 2.420091, 1, 1, 1, 1, 1,
0.2318828, -0.006266672, 1.767085, 1, 1, 1, 1, 1,
0.2348428, -0.2377731, 3.479706, 1, 1, 1, 1, 1,
0.2372749, 1.448381, 0.6969349, 1, 1, 1, 1, 1,
0.2389532, -0.4402915, 3.349769, 1, 1, 1, 1, 1,
0.2430706, 1.988755, 1.051093, 1, 1, 1, 1, 1,
0.2434403, -2.156946, 4.18581, 1, 1, 1, 1, 1,
0.245149, -1.271874, 3.076825, 1, 1, 1, 1, 1,
0.2464393, -0.4269777, 2.74053, 1, 1, 1, 1, 1,
0.2587377, 0.7195497, -0.136134, 1, 1, 1, 1, 1,
0.2611807, -1.448635, 4.413559, 1, 1, 1, 1, 1,
0.2650011, -1.260406, 2.804304, 1, 1, 1, 1, 1,
0.2666682, -0.1140367, 2.233726, 1, 1, 1, 1, 1,
0.2671794, -0.5328756, 3.727247, 0, 0, 1, 1, 1,
0.2719234, -0.2540746, 2.521533, 1, 0, 0, 1, 1,
0.2731133, -0.5342066, 2.217017, 1, 0, 0, 1, 1,
0.2777087, -1.398941, 2.026945, 1, 0, 0, 1, 1,
0.2780541, -0.6419706, 2.692978, 1, 0, 0, 1, 1,
0.2809095, 1.864861, -0.2898763, 1, 0, 0, 1, 1,
0.282198, 1.953081, -1.374767, 0, 0, 0, 1, 1,
0.282422, 0.3757263, 2.178291, 0, 0, 0, 1, 1,
0.2883067, 0.3579784, -0.1007057, 0, 0, 0, 1, 1,
0.2980302, -1.021772, 0.8014358, 0, 0, 0, 1, 1,
0.3102675, 0.3894281, -0.8172489, 0, 0, 0, 1, 1,
0.3111206, -1.880433, 1.356781, 0, 0, 0, 1, 1,
0.3123238, 1.32851, 0.5531732, 0, 0, 0, 1, 1,
0.3138092, -0.4600686, 4.201248, 1, 1, 1, 1, 1,
0.3149368, -0.9423914, 2.98301, 1, 1, 1, 1, 1,
0.3160845, 0.2217887, 2.180791, 1, 1, 1, 1, 1,
0.3243768, -0.936149, 5.231813, 1, 1, 1, 1, 1,
0.3282256, -2.59542, 4.33804, 1, 1, 1, 1, 1,
0.328341, -0.3198958, 0.3892415, 1, 1, 1, 1, 1,
0.3300496, -1.087409, 5.390881, 1, 1, 1, 1, 1,
0.330271, 0.3321014, 0.9883403, 1, 1, 1, 1, 1,
0.3306672, -1.149271, 2.950109, 1, 1, 1, 1, 1,
0.3312489, -0.5531419, 3.229089, 1, 1, 1, 1, 1,
0.3312543, -1.84356, 1.09364, 1, 1, 1, 1, 1,
0.3325472, 1.389285, 1.260548, 1, 1, 1, 1, 1,
0.3361193, -0.2562936, 2.015942, 1, 1, 1, 1, 1,
0.3379045, -0.6244814, 2.458582, 1, 1, 1, 1, 1,
0.3386143, 0.08485031, 3.349059, 1, 1, 1, 1, 1,
0.3404112, -0.5000711, 2.692507, 0, 0, 1, 1, 1,
0.3413694, -1.022812, 2.154827, 1, 0, 0, 1, 1,
0.3425528, -0.880035, 1.881467, 1, 0, 0, 1, 1,
0.3489313, -1.150851, 3.409798, 1, 0, 0, 1, 1,
0.350037, -1.156693, 2.738248, 1, 0, 0, 1, 1,
0.3507406, -0.3559244, 1.485696, 1, 0, 0, 1, 1,
0.3524253, 0.8064391, 0.3930576, 0, 0, 0, 1, 1,
0.3531625, 0.2740056, 1.330318, 0, 0, 0, 1, 1,
0.3533485, -0.3142037, 2.290969, 0, 0, 0, 1, 1,
0.3535817, 2.085326, 1.470216, 0, 0, 0, 1, 1,
0.3541112, 0.3842089, 1.205696, 0, 0, 0, 1, 1,
0.3583698, 0.6465103, 0.1593133, 0, 0, 0, 1, 1,
0.3602689, 0.8330116, -0.2640238, 0, 0, 0, 1, 1,
0.3619295, -0.105691, 2.058016, 1, 1, 1, 1, 1,
0.3637726, 0.4431145, 0.4579181, 1, 1, 1, 1, 1,
0.3639082, -0.3123766, 2.866652, 1, 1, 1, 1, 1,
0.3646168, 0.5084025, 0.8635572, 1, 1, 1, 1, 1,
0.3650488, 0.06384655, 1.82482, 1, 1, 1, 1, 1,
0.3732581, 0.5535116, 2.307317, 1, 1, 1, 1, 1,
0.3734283, -0.8339363, 2.072222, 1, 1, 1, 1, 1,
0.3755857, -0.8854795, 3.237601, 1, 1, 1, 1, 1,
0.3757071, 0.7224055, 2.405502, 1, 1, 1, 1, 1,
0.3778078, -0.1318917, 3.442472, 1, 1, 1, 1, 1,
0.385802, 1.448521, 0.9773118, 1, 1, 1, 1, 1,
0.3919953, 0.3948219, 1.749258, 1, 1, 1, 1, 1,
0.3928677, 0.5656816, -0.6020666, 1, 1, 1, 1, 1,
0.3935945, 0.2315871, 0.9019288, 1, 1, 1, 1, 1,
0.3969016, -0.008855189, -0.2107455, 1, 1, 1, 1, 1,
0.3988157, 0.2234305, 0.1865543, 0, 0, 1, 1, 1,
0.399516, 0.6412029, 1.909024, 1, 0, 0, 1, 1,
0.4012868, -0.4271234, 2.377995, 1, 0, 0, 1, 1,
0.4061085, 1.646163, -0.09718395, 1, 0, 0, 1, 1,
0.4072383, 1.16815, 1.517412, 1, 0, 0, 1, 1,
0.4073677, -1.413911, 3.229015, 1, 0, 0, 1, 1,
0.4074489, 0.2246648, -0.3077455, 0, 0, 0, 1, 1,
0.4115207, -1.0986, 3.302656, 0, 0, 0, 1, 1,
0.412268, -0.2634747, 2.950481, 0, 0, 0, 1, 1,
0.4156685, -1.111468, 4.013402, 0, 0, 0, 1, 1,
0.4160273, 0.5799788, 0.7115529, 0, 0, 0, 1, 1,
0.4259773, 1.520211, -0.9466653, 0, 0, 0, 1, 1,
0.4281082, 0.6568399, 1.479515, 0, 0, 0, 1, 1,
0.4287698, -0.8901981, 3.813779, 1, 1, 1, 1, 1,
0.4290605, 1.097703, -1.646944, 1, 1, 1, 1, 1,
0.4365839, -0.8062441, 1.575684, 1, 1, 1, 1, 1,
0.4368333, -0.1157651, 1.711941, 1, 1, 1, 1, 1,
0.437513, -3.012524, 4.420233, 1, 1, 1, 1, 1,
0.4444123, 0.6113381, -0.6125797, 1, 1, 1, 1, 1,
0.4483243, 0.2978513, 0.4097143, 1, 1, 1, 1, 1,
0.4489432, 0.2199187, 1.399818, 1, 1, 1, 1, 1,
0.449188, 0.4621928, 2.711976, 1, 1, 1, 1, 1,
0.4522109, 0.9360369, 2.08852, 1, 1, 1, 1, 1,
0.4531925, -0.5516829, 2.663683, 1, 1, 1, 1, 1,
0.4592212, -2.389981, 2.812539, 1, 1, 1, 1, 1,
0.464318, -0.2204542, 0.5334176, 1, 1, 1, 1, 1,
0.4646378, 0.3428153, 1.961303, 1, 1, 1, 1, 1,
0.4655255, -0.7176838, 2.476258, 1, 1, 1, 1, 1,
0.4737798, 0.3025546, -0.2186392, 0, 0, 1, 1, 1,
0.4739453, 0.9002512, -0.569887, 1, 0, 0, 1, 1,
0.4741666, 0.7790409, 1.281657, 1, 0, 0, 1, 1,
0.4777358, 0.2098354, 1.84836, 1, 0, 0, 1, 1,
0.4793531, 1.682556, 0.2428312, 1, 0, 0, 1, 1,
0.4845387, 0.8721259, 0.5147658, 1, 0, 0, 1, 1,
0.4846675, 0.07386298, 2.957064, 0, 0, 0, 1, 1,
0.4849562, -0.813157, 3.540839, 0, 0, 0, 1, 1,
0.4860809, 0.05471935, 3.168132, 0, 0, 0, 1, 1,
0.4875705, 0.8065234, 0.9416052, 0, 0, 0, 1, 1,
0.488801, 0.1137023, 1.856332, 0, 0, 0, 1, 1,
0.4907174, 0.07469016, 0.429793, 0, 0, 0, 1, 1,
0.4920783, -0.09961339, 0.08958926, 0, 0, 0, 1, 1,
0.4939423, -0.4185668, 2.467134, 1, 1, 1, 1, 1,
0.4995598, -0.5115994, 3.323786, 1, 1, 1, 1, 1,
0.5063419, 1.517693, -0.06753761, 1, 1, 1, 1, 1,
0.5067159, 1.046171, 0.4971623, 1, 1, 1, 1, 1,
0.5068442, -0.2528036, 3.277091, 1, 1, 1, 1, 1,
0.5076677, -1.312789, 2.698774, 1, 1, 1, 1, 1,
0.5119478, 1.605145, 0.7562904, 1, 1, 1, 1, 1,
0.5121638, -1.391559, 2.992052, 1, 1, 1, 1, 1,
0.5152417, 1.392476, 0.2528245, 1, 1, 1, 1, 1,
0.5167185, -0.6307592, 1.750662, 1, 1, 1, 1, 1,
0.5190554, 0.1295507, 1.398865, 1, 1, 1, 1, 1,
0.5218285, -0.7831428, 1.850786, 1, 1, 1, 1, 1,
0.5219604, -0.1933184, 1.555938, 1, 1, 1, 1, 1,
0.5281375, 0.808004, 0.5273724, 1, 1, 1, 1, 1,
0.5323681, -0.7981117, 2.955951, 1, 1, 1, 1, 1,
0.5344306, -1.419798, 3.188178, 0, 0, 1, 1, 1,
0.5392122, 0.1206651, 1.862617, 1, 0, 0, 1, 1,
0.5392711, -1.986322, 3.250386, 1, 0, 0, 1, 1,
0.539768, -0.8068172, 3.111765, 1, 0, 0, 1, 1,
0.5559763, 0.9347503, -0.229018, 1, 0, 0, 1, 1,
0.5642248, -0.2068055, 3.002281, 1, 0, 0, 1, 1,
0.5659929, 1.105119, -0.4670617, 0, 0, 0, 1, 1,
0.5704246, -1.038692, 1.418714, 0, 0, 0, 1, 1,
0.5817822, 0.3979274, 1.265742, 0, 0, 0, 1, 1,
0.5836629, 0.3131919, -0.9662392, 0, 0, 0, 1, 1,
0.584006, -0.06778586, 0.6566565, 0, 0, 0, 1, 1,
0.5848126, -2.208262, 1.788931, 0, 0, 0, 1, 1,
0.5849804, 0.7645925, 1.951501, 0, 0, 0, 1, 1,
0.5873586, -1.237952, 2.618027, 1, 1, 1, 1, 1,
0.5885577, 1.444198, 2.036349, 1, 1, 1, 1, 1,
0.5900033, -0.40158, 1.784974, 1, 1, 1, 1, 1,
0.5926903, -1.252026, 2.542814, 1, 1, 1, 1, 1,
0.5933312, 0.1983882, 2.595674, 1, 1, 1, 1, 1,
0.595704, -0.9471816, 3.03178, 1, 1, 1, 1, 1,
0.5965382, 0.06417989, 0.4291126, 1, 1, 1, 1, 1,
0.5965552, 0.2087958, 0.2517142, 1, 1, 1, 1, 1,
0.5987831, -0.5156172, 1.062578, 1, 1, 1, 1, 1,
0.5989516, 1.441051, -0.3225015, 1, 1, 1, 1, 1,
0.6015462, -0.3209727, 3.000314, 1, 1, 1, 1, 1,
0.6082188, -0.6411186, 3.918825, 1, 1, 1, 1, 1,
0.6091504, 0.2976525, 0.8992668, 1, 1, 1, 1, 1,
0.6146811, -0.9922432, 3.117419, 1, 1, 1, 1, 1,
0.6235833, 3.191042, 1.116487, 1, 1, 1, 1, 1,
0.6269203, 0.9764288, -0.6098954, 0, 0, 1, 1, 1,
0.6270653, 0.3276937, 1.384009, 1, 0, 0, 1, 1,
0.6325516, 1.683932, 0.2007371, 1, 0, 0, 1, 1,
0.6370085, -1.658567, 2.900023, 1, 0, 0, 1, 1,
0.6396485, -0.1422258, 2.18766, 1, 0, 0, 1, 1,
0.6469274, -0.7754499, 1.518326, 1, 0, 0, 1, 1,
0.6478103, -0.09028167, 0.5013494, 0, 0, 0, 1, 1,
0.653765, -0.06968378, 0.7682871, 0, 0, 0, 1, 1,
0.6548932, 1.629895, 0.4563896, 0, 0, 0, 1, 1,
0.6551414, 0.1839456, 0.1018348, 0, 0, 0, 1, 1,
0.6552121, -0.0970265, 1.3245, 0, 0, 0, 1, 1,
0.6893299, 1.415526, 0.6858068, 0, 0, 0, 1, 1,
0.6918855, -1.121299, 2.366865, 0, 0, 0, 1, 1,
0.6950787, 1.593525, 0.5794473, 1, 1, 1, 1, 1,
0.6951731, 0.7106299, 0.4493193, 1, 1, 1, 1, 1,
0.7047409, 0.3206634, -0.9863383, 1, 1, 1, 1, 1,
0.7070375, 0.3692929, 0.3845281, 1, 1, 1, 1, 1,
0.707393, 1.163063, 1.865033, 1, 1, 1, 1, 1,
0.7081092, -0.5723814, 2.355009, 1, 1, 1, 1, 1,
0.7133953, -1.569398, 3.496135, 1, 1, 1, 1, 1,
0.7146468, -0.4443605, 1.29199, 1, 1, 1, 1, 1,
0.7162534, 0.3940105, 1.507873, 1, 1, 1, 1, 1,
0.7177662, 1.808184, 0.9943432, 1, 1, 1, 1, 1,
0.7179695, 1.612296, 1.904489, 1, 1, 1, 1, 1,
0.7199389, -1.25119, 3.031898, 1, 1, 1, 1, 1,
0.7200785, -0.9645991, 0.3509273, 1, 1, 1, 1, 1,
0.7216522, -0.7570632, 3.286238, 1, 1, 1, 1, 1,
0.7225577, 1.85585, 0.1273788, 1, 1, 1, 1, 1,
0.7229275, 1.513885, 1.649508, 0, 0, 1, 1, 1,
0.7377566, -1.246198, 4.17035, 1, 0, 0, 1, 1,
0.739363, 0.6538887, 0.7126369, 1, 0, 0, 1, 1,
0.7427323, -0.5424866, 2.494811, 1, 0, 0, 1, 1,
0.7471455, 0.7345495, -0.6227742, 1, 0, 0, 1, 1,
0.7492085, -0.5737396, 2.50142, 1, 0, 0, 1, 1,
0.7555787, 0.3787669, 0.5912809, 0, 0, 0, 1, 1,
0.758982, 0.7743382, 0.6976632, 0, 0, 0, 1, 1,
0.772199, 0.003534175, 1.834191, 0, 0, 0, 1, 1,
0.7765196, -0.2369043, 0.6248037, 0, 0, 0, 1, 1,
0.7776527, -0.1052363, 2.233307, 0, 0, 0, 1, 1,
0.7798889, -0.3862297, 1.699273, 0, 0, 0, 1, 1,
0.7824777, 1.013459, 1.531039, 0, 0, 0, 1, 1,
0.7840996, 0.002835335, 2.483101, 1, 1, 1, 1, 1,
0.790955, -0.1570641, 2.330559, 1, 1, 1, 1, 1,
0.791271, 1.591839, -0.3713349, 1, 1, 1, 1, 1,
0.7994874, -0.9227599, 3.879162, 1, 1, 1, 1, 1,
0.8046172, -0.1148349, 3.161628, 1, 1, 1, 1, 1,
0.8047958, 1.570883, 0.1023281, 1, 1, 1, 1, 1,
0.8095863, -1.138447, 1.997135, 1, 1, 1, 1, 1,
0.8146028, 0.05166857, 1.960189, 1, 1, 1, 1, 1,
0.8187314, -0.1972816, 1.093809, 1, 1, 1, 1, 1,
0.8204615, -0.1981352, 0.8915271, 1, 1, 1, 1, 1,
0.8210058, 1.433004, 0.2872535, 1, 1, 1, 1, 1,
0.8214336, 0.5381997, 1.410313, 1, 1, 1, 1, 1,
0.8216674, -0.3555705, 1.391425, 1, 1, 1, 1, 1,
0.829872, -0.1902467, 2.776034, 1, 1, 1, 1, 1,
0.8303543, 0.1019125, 2.728744, 1, 1, 1, 1, 1,
0.8306164, 0.7860735, -0.8387255, 0, 0, 1, 1, 1,
0.8338861, -2.144611, 1.80214, 1, 0, 0, 1, 1,
0.8365862, 1.287792, -0.271241, 1, 0, 0, 1, 1,
0.8426878, 0.877869, 1.35522, 1, 0, 0, 1, 1,
0.8446934, 0.3362761, 1.365706, 1, 0, 0, 1, 1,
0.8489397, -0.5723472, 2.880349, 1, 0, 0, 1, 1,
0.8504723, 0.9748623, 1.588225, 0, 0, 0, 1, 1,
0.8516527, -0.344009, 1.322605, 0, 0, 0, 1, 1,
0.8585901, 0.8582686, 1.101019, 0, 0, 0, 1, 1,
0.8696015, -0.1678122, 1.421074, 0, 0, 0, 1, 1,
0.8731393, 0.8961599, 0.05171756, 0, 0, 0, 1, 1,
0.8767666, -1.059489, 2.068599, 0, 0, 0, 1, 1,
0.8781323, -3.169497, 1.191021, 0, 0, 0, 1, 1,
0.8793628, -0.0983453, 0.614414, 1, 1, 1, 1, 1,
0.8835597, -0.7716076, 1.544534, 1, 1, 1, 1, 1,
0.8848783, 0.5568029, -0.9219555, 1, 1, 1, 1, 1,
0.8898179, 0.9743022, 2.573904, 1, 1, 1, 1, 1,
0.8915433, 0.4838413, 1.171631, 1, 1, 1, 1, 1,
0.892131, 0.7538999, 0.3559942, 1, 1, 1, 1, 1,
0.906, 0.3409664, 2.254337, 1, 1, 1, 1, 1,
0.9109736, -0.6924853, 1.036124, 1, 1, 1, 1, 1,
0.9119658, -0.2140768, 0.3410431, 1, 1, 1, 1, 1,
0.9211162, 1.338273, 1.346704, 1, 1, 1, 1, 1,
0.9230009, -1.184563, 3.126599, 1, 1, 1, 1, 1,
0.9242588, 0.003664037, 1.616938, 1, 1, 1, 1, 1,
0.9328181, 0.3547532, 1.118454, 1, 1, 1, 1, 1,
0.9353574, -1.214501, 3.485576, 1, 1, 1, 1, 1,
0.9420166, -0.5619937, 4.210896, 1, 1, 1, 1, 1,
0.9462167, -0.1229197, 2.588572, 0, 0, 1, 1, 1,
0.951644, -1.780844, 5.565351, 1, 0, 0, 1, 1,
0.9584842, -1.034069, 3.5415, 1, 0, 0, 1, 1,
0.9591742, 0.4333863, 0.7206496, 1, 0, 0, 1, 1,
0.9656363, 1.643054, -0.2500147, 1, 0, 0, 1, 1,
0.9689738, 1.777658, -0.4822357, 1, 0, 0, 1, 1,
0.9700271, -2.314502, 1.848738, 0, 0, 0, 1, 1,
0.9729392, 1.451973, 1.050248, 0, 0, 0, 1, 1,
0.9752325, -0.7003695, 4.378042, 0, 0, 0, 1, 1,
0.9763984, -0.678978, 1.495354, 0, 0, 0, 1, 1,
0.978485, -0.9058924, 1.359081, 0, 0, 0, 1, 1,
0.9825512, 2.844521, 0.9159325, 0, 0, 0, 1, 1,
0.982681, -0.005802794, 0.8353626, 0, 0, 0, 1, 1,
0.9939888, 0.1989932, 1.849999, 1, 1, 1, 1, 1,
0.997285, 1.550297, 0.5167578, 1, 1, 1, 1, 1,
1.005658, 0.5704416, 0.3273484, 1, 1, 1, 1, 1,
1.016063, 0.1863492, 1.263768, 1, 1, 1, 1, 1,
1.024913, 0.6396558, -0.4176005, 1, 1, 1, 1, 1,
1.027435, -0.2963396, 0.7534756, 1, 1, 1, 1, 1,
1.029199, 0.05534923, 2.522151, 1, 1, 1, 1, 1,
1.033161, -0.08877859, 2.158677, 1, 1, 1, 1, 1,
1.036043, -0.3575785, 2.669026, 1, 1, 1, 1, 1,
1.036414, 0.4847035, 1.892939, 1, 1, 1, 1, 1,
1.039914, -0.6477251, 3.067144, 1, 1, 1, 1, 1,
1.041202, -0.3186454, 1.277949, 1, 1, 1, 1, 1,
1.041897, 0.7646504, 3.17753, 1, 1, 1, 1, 1,
1.051409, 0.008312904, -0.7599831, 1, 1, 1, 1, 1,
1.053901, -1.276816, 3.303726, 1, 1, 1, 1, 1,
1.054331, -0.8233623, 0.1349782, 0, 0, 1, 1, 1,
1.057057, -0.1701458, 2.511976, 1, 0, 0, 1, 1,
1.059395, 0.292699, 2.781796, 1, 0, 0, 1, 1,
1.06454, -0.7743523, 0.546157, 1, 0, 0, 1, 1,
1.067488, 0.2233052, 2.461332, 1, 0, 0, 1, 1,
1.087992, 0.588508, 1.59759, 1, 0, 0, 1, 1,
1.097104, -0.07435025, 3.804033, 0, 0, 0, 1, 1,
1.100352, 0.04944408, 0.7578724, 0, 0, 0, 1, 1,
1.116318, 0.2808341, 2.321798, 0, 0, 0, 1, 1,
1.120682, -0.7362971, 2.978842, 0, 0, 0, 1, 1,
1.123011, 0.2834498, 1.662416, 0, 0, 0, 1, 1,
1.131475, 0.3858569, 0.6473057, 0, 0, 0, 1, 1,
1.13257, -0.1008006, 2.351086, 0, 0, 0, 1, 1,
1.139371, -1.167638, 1.784231, 1, 1, 1, 1, 1,
1.145306, 0.1179497, 2.06983, 1, 1, 1, 1, 1,
1.162062, 0.6900547, 1.614197, 1, 1, 1, 1, 1,
1.163737, 1.101582, 1.638093, 1, 1, 1, 1, 1,
1.168635, 0.2334524, 1.448806, 1, 1, 1, 1, 1,
1.178898, -0.2294334, 1.151147, 1, 1, 1, 1, 1,
1.179703, 0.7840241, 0.1137201, 1, 1, 1, 1, 1,
1.179953, -1.151436, 1.568979, 1, 1, 1, 1, 1,
1.180744, -1.340776, 4.296334, 1, 1, 1, 1, 1,
1.183241, -0.8548568, 2.671186, 1, 1, 1, 1, 1,
1.192535, 0.7277606, 2.061385, 1, 1, 1, 1, 1,
1.196489, 1.115635, 1.925413, 1, 1, 1, 1, 1,
1.198593, 1.582206, -0.1005556, 1, 1, 1, 1, 1,
1.198776, -0.2393791, 0.9276569, 1, 1, 1, 1, 1,
1.199597, -0.2843963, 0.8137731, 1, 1, 1, 1, 1,
1.203337, 0.2699047, 1.316225, 0, 0, 1, 1, 1,
1.209109, -0.02423161, 0.4229801, 1, 0, 0, 1, 1,
1.209112, -2.002118, 3.028981, 1, 0, 0, 1, 1,
1.211578, 0.7144119, 1.258159, 1, 0, 0, 1, 1,
1.214979, -0.1708918, 1.891996, 1, 0, 0, 1, 1,
1.220261, -1.280592, 2.510886, 1, 0, 0, 1, 1,
1.236856, -0.6328109, 2.278319, 0, 0, 0, 1, 1,
1.238493, -0.5495656, 1.83032, 0, 0, 0, 1, 1,
1.244407, -1.422249, 2.414459, 0, 0, 0, 1, 1,
1.250144, 0.5714974, 0.3829418, 0, 0, 0, 1, 1,
1.252175, -1.283898, 1.684205, 0, 0, 0, 1, 1,
1.257138, 0.3515182, 2.990588, 0, 0, 0, 1, 1,
1.265088, 0.5347845, 1.52913, 0, 0, 0, 1, 1,
1.267168, 1.524919, -1.010751, 1, 1, 1, 1, 1,
1.27175, -0.289772, 2.162036, 1, 1, 1, 1, 1,
1.273668, 0.03164843, 1.187045, 1, 1, 1, 1, 1,
1.278518, 0.2040285, 4.571667, 1, 1, 1, 1, 1,
1.283299, -0.5230327, 0.9293056, 1, 1, 1, 1, 1,
1.287326, -1.303294, 0.6183067, 1, 1, 1, 1, 1,
1.307027, 1.211659, 0.8631486, 1, 1, 1, 1, 1,
1.314594, 0.5792532, -1.416216, 1, 1, 1, 1, 1,
1.317046, 0.3698926, 2.748591, 1, 1, 1, 1, 1,
1.324524, -0.695033, 3.232887, 1, 1, 1, 1, 1,
1.332986, 0.04788219, 1.766363, 1, 1, 1, 1, 1,
1.340163, -0.14519, 2.174546, 1, 1, 1, 1, 1,
1.34251, 1.178211, 0.6138684, 1, 1, 1, 1, 1,
1.344537, -1.097663, 2.846059, 1, 1, 1, 1, 1,
1.345761, -0.313393, 1.134319, 1, 1, 1, 1, 1,
1.349151, 0.6761354, -0.4698008, 0, 0, 1, 1, 1,
1.351445, 0.4696001, 1.047657, 1, 0, 0, 1, 1,
1.360611, -0.5138926, 3.204968, 1, 0, 0, 1, 1,
1.363423, 1.897468, 1.35131, 1, 0, 0, 1, 1,
1.37285, 1.083568, 0.8313277, 1, 0, 0, 1, 1,
1.376144, 0.6374155, 1.043396, 1, 0, 0, 1, 1,
1.393353, 0.04376107, 3.103686, 0, 0, 0, 1, 1,
1.39821, -1.669961, 2.173442, 0, 0, 0, 1, 1,
1.401845, 0.002241707, 1.838923, 0, 0, 0, 1, 1,
1.422791, 1.20147, 2.260174, 0, 0, 0, 1, 1,
1.428697, -1.56177, 3.805461, 0, 0, 0, 1, 1,
1.430213, -1.576627, 2.011161, 0, 0, 0, 1, 1,
1.438296, -0.4807704, 0.9773473, 0, 0, 0, 1, 1,
1.441723, 0.2128826, -0.01020826, 1, 1, 1, 1, 1,
1.449326, -0.5282458, 2.724628, 1, 1, 1, 1, 1,
1.462014, 0.9897773, 1.104325, 1, 1, 1, 1, 1,
1.46943, -0.5203658, 2.035267, 1, 1, 1, 1, 1,
1.4708, -0.6461273, 0.9043196, 1, 1, 1, 1, 1,
1.47838, 0.4194633, 1.535611, 1, 1, 1, 1, 1,
1.493593, -1.086575, 1.937097, 1, 1, 1, 1, 1,
1.495809, 1.283733, 0.6763146, 1, 1, 1, 1, 1,
1.539367, 0.4272495, 1.160579, 1, 1, 1, 1, 1,
1.549228, 0.6567059, 0.05141043, 1, 1, 1, 1, 1,
1.560797, -0.4206907, 1.247991, 1, 1, 1, 1, 1,
1.566203, 1.876896, 0.6086134, 1, 1, 1, 1, 1,
1.569265, -0.4765827, 2.434416, 1, 1, 1, 1, 1,
1.595465, 2.092984, 1.855779, 1, 1, 1, 1, 1,
1.596553, 0.61623, 0.475775, 1, 1, 1, 1, 1,
1.598812, -0.3942161, -0.4149598, 0, 0, 1, 1, 1,
1.609353, 1.179999, 0.4052912, 1, 0, 0, 1, 1,
1.65528, 0.3102167, 1.132523, 1, 0, 0, 1, 1,
1.673084, -0.5716488, 0.8694316, 1, 0, 0, 1, 1,
1.708952, 0.8061786, 1.28923, 1, 0, 0, 1, 1,
1.71191, -2.26975, 3.669277, 1, 0, 0, 1, 1,
1.720763, 0.6257899, 0.9716388, 0, 0, 0, 1, 1,
1.743014, -0.01821852, 0.1248793, 0, 0, 0, 1, 1,
1.759673, 1.492773, 0.9099921, 0, 0, 0, 1, 1,
1.767257, -0.3397146, 1.745541, 0, 0, 0, 1, 1,
1.770297, -0.6699529, 1.822553, 0, 0, 0, 1, 1,
1.77498, 0.9177357, 1.173315, 0, 0, 0, 1, 1,
1.794689, 0.7962151, 1.407156, 0, 0, 0, 1, 1,
1.802817, -0.4783705, 0.6222148, 1, 1, 1, 1, 1,
1.828215, 0.3289653, 1.380036, 1, 1, 1, 1, 1,
1.82938, -0.6519501, 0.6940328, 1, 1, 1, 1, 1,
1.832419, 0.1101459, 2.697173, 1, 1, 1, 1, 1,
1.845155, 0.8210329, 1.838312, 1, 1, 1, 1, 1,
1.851446, -0.4023856, 2.765817, 1, 1, 1, 1, 1,
1.854328, -0.2198732, 1.684316, 1, 1, 1, 1, 1,
1.883946, 0.1163128, 2.673556, 1, 1, 1, 1, 1,
1.918233, 1.75311, 1.750874, 1, 1, 1, 1, 1,
1.928069, -0.9446008, 1.715742, 1, 1, 1, 1, 1,
1.960843, -1.358794, 1.97429, 1, 1, 1, 1, 1,
1.965236, 0.4422072, 1.324716, 1, 1, 1, 1, 1,
1.974614, 0.08748414, 3.220701, 1, 1, 1, 1, 1,
1.975657, -0.2807453, 1.038894, 1, 1, 1, 1, 1,
2.011359, 0.1323767, 0.5787851, 1, 1, 1, 1, 1,
2.067241, 1.154227, 1.076239, 0, 0, 1, 1, 1,
2.111451, -0.0614128, 1.062703, 1, 0, 0, 1, 1,
2.132848, -0.3342201, 1.416997, 1, 0, 0, 1, 1,
2.151477, 1.86742, 0.06808964, 1, 0, 0, 1, 1,
2.171233, 1.202253, 1.873775, 1, 0, 0, 1, 1,
2.177456, 1.557455, 1.269767, 1, 0, 0, 1, 1,
2.183492, 0.04374145, 2.763925, 0, 0, 0, 1, 1,
2.183522, -0.2340401, 1.699161, 0, 0, 0, 1, 1,
2.244954, -1.002204, 1.865828, 0, 0, 0, 1, 1,
2.30892, -0.5814235, 2.359193, 0, 0, 0, 1, 1,
2.357985, -0.1107786, 2.113259, 0, 0, 0, 1, 1,
2.367245, 0.03966795, 2.05538, 0, 0, 0, 1, 1,
2.553672, 0.4391124, 1.737177, 0, 0, 0, 1, 1,
2.608615, -0.3577209, 0.3359385, 1, 1, 1, 1, 1,
2.624081, -1.139462, 2.30959, 1, 1, 1, 1, 1,
2.723844, -0.1069147, 2.32479, 1, 1, 1, 1, 1,
2.730402, -0.9195511, 0.9046332, 1, 1, 1, 1, 1,
2.730954, -0.1028672, 0.2183447, 1, 1, 1, 1, 1,
2.742018, 1.272581, 0.907102, 1, 1, 1, 1, 1,
3.671038, -1.064892, 1.992225, 1, 1, 1, 1, 1
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
var radius = 9.786455;
var distance = 34.37451;
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
mvMatrix.translate( -0.1270852, -0.2096598, -0.3643489 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37451);
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