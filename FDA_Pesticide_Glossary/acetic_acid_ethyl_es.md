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
-2.910231, 1.80135, 0.1582777, 1, 0, 0, 1,
-2.898445, -0.1452904, -0.4091094, 1, 0.007843138, 0, 1,
-2.663862, -1.227553, -1.518699, 1, 0.01176471, 0, 1,
-2.437896, -0.4716158, -0.1338695, 1, 0.01960784, 0, 1,
-2.374178, -0.01715178, -0.6963265, 1, 0.02352941, 0, 1,
-2.373241, 0.6754209, -1.896354, 1, 0.03137255, 0, 1,
-2.306287, -1.369412, -2.317085, 1, 0.03529412, 0, 1,
-2.289138, 0.05527228, -2.153859, 1, 0.04313726, 0, 1,
-2.260191, -0.6381904, -0.8506935, 1, 0.04705882, 0, 1,
-2.259962, -0.1588497, -0.9816067, 1, 0.05490196, 0, 1,
-2.235572, -1.175608, -2.303348, 1, 0.05882353, 0, 1,
-2.195227, 0.7430188, -1.053913, 1, 0.06666667, 0, 1,
-2.187445, -0.7152995, -1.148465, 1, 0.07058824, 0, 1,
-2.174146, -1.393725, -3.673893, 1, 0.07843138, 0, 1,
-2.144551, 2.117188, -2.007178, 1, 0.08235294, 0, 1,
-2.102136, 0.3280269, -2.654475, 1, 0.09019608, 0, 1,
-2.099117, -1.499008, -2.06461, 1, 0.09411765, 0, 1,
-2.090209, 1.035352, 0.01270345, 1, 0.1019608, 0, 1,
-2.06617, -1.665299, -2.406076, 1, 0.1098039, 0, 1,
-1.959873, 0.9258205, -1.999974, 1, 0.1137255, 0, 1,
-1.93726, -0.4058201, -1.608936, 1, 0.1215686, 0, 1,
-1.924335, -0.6817936, -0.3896011, 1, 0.1254902, 0, 1,
-1.916387, -1.065344, -1.866099, 1, 0.1333333, 0, 1,
-1.915066, -0.8951495, -2.304622, 1, 0.1372549, 0, 1,
-1.861134, 0.9568625, -1.06689, 1, 0.145098, 0, 1,
-1.85899, -0.315121, -2.543998, 1, 0.1490196, 0, 1,
-1.85497, 1.688099, -3.201625, 1, 0.1568628, 0, 1,
-1.828043, 0.7299401, -2.159087, 1, 0.1607843, 0, 1,
-1.785477, -1.352196, -2.319908, 1, 0.1686275, 0, 1,
-1.78109, 0.1791359, -2.668498, 1, 0.172549, 0, 1,
-1.777409, 0.06696046, -0.8113286, 1, 0.1803922, 0, 1,
-1.761835, -0.102278, 0.09550828, 1, 0.1843137, 0, 1,
-1.748415, 1.402476, -0.853735, 1, 0.1921569, 0, 1,
-1.743155, 1.44212, 0.7572812, 1, 0.1960784, 0, 1,
-1.729517, 0.4156426, -0.834583, 1, 0.2039216, 0, 1,
-1.711, -0.9089654, -0.6400952, 1, 0.2117647, 0, 1,
-1.703858, -1.997867, -5.296241, 1, 0.2156863, 0, 1,
-1.69818, -0.8505179, -1.837423, 1, 0.2235294, 0, 1,
-1.697092, 1.521614, -0.2038625, 1, 0.227451, 0, 1,
-1.693467, 0.8812432, -1.708694, 1, 0.2352941, 0, 1,
-1.693377, 0.2105753, -0.07534799, 1, 0.2392157, 0, 1,
-1.691022, 0.4725426, -1.845504, 1, 0.2470588, 0, 1,
-1.68997, 0.5214751, -2.94962, 1, 0.2509804, 0, 1,
-1.683687, 1.023229, -2.07764, 1, 0.2588235, 0, 1,
-1.665157, -1.854938, -1.519306, 1, 0.2627451, 0, 1,
-1.658925, 0.2870851, -0.9915131, 1, 0.2705882, 0, 1,
-1.65729, -1.082634, -2.163935, 1, 0.2745098, 0, 1,
-1.653094, -1.380362, -2.7674, 1, 0.282353, 0, 1,
-1.643197, 0.03388099, -1.62316, 1, 0.2862745, 0, 1,
-1.632788, 0.905037, -1.790241, 1, 0.2941177, 0, 1,
-1.625101, 0.3968526, -2.099451, 1, 0.3019608, 0, 1,
-1.615625, 1.51743, -0.1431743, 1, 0.3058824, 0, 1,
-1.605488, 3.143931, -0.5823593, 1, 0.3137255, 0, 1,
-1.596224, 1.584741, 0.03401935, 1, 0.3176471, 0, 1,
-1.588593, 0.5807586, -0.7768105, 1, 0.3254902, 0, 1,
-1.583084, -1.348796, -3.452713, 1, 0.3294118, 0, 1,
-1.580531, -0.05827818, -1.362525, 1, 0.3372549, 0, 1,
-1.57574, -0.4661146, -1.84388, 1, 0.3411765, 0, 1,
-1.575321, 1.157443, -1.957595, 1, 0.3490196, 0, 1,
-1.572828, 1.240638, -2.499177, 1, 0.3529412, 0, 1,
-1.568825, -0.6881061, -1.692319, 1, 0.3607843, 0, 1,
-1.56795, -1.098784, -2.650211, 1, 0.3647059, 0, 1,
-1.559022, 0.6691843, -0.1506619, 1, 0.372549, 0, 1,
-1.556544, -0.7367512, -0.1914983, 1, 0.3764706, 0, 1,
-1.549268, -0.125482, -2.177132, 1, 0.3843137, 0, 1,
-1.538496, -0.6924844, -0.9987757, 1, 0.3882353, 0, 1,
-1.534134, 0.891273, -1.94666, 1, 0.3960784, 0, 1,
-1.527588, -1.168132, -1.800945, 1, 0.4039216, 0, 1,
-1.525407, 0.3653661, -0.6708655, 1, 0.4078431, 0, 1,
-1.512813, 1.438424, -3.356695, 1, 0.4156863, 0, 1,
-1.509442, 1.104687, -1.210645, 1, 0.4196078, 0, 1,
-1.507462, 1.259688, 0.08532489, 1, 0.427451, 0, 1,
-1.495788, -0.8902826, -1.696007, 1, 0.4313726, 0, 1,
-1.492817, 0.8625092, -2.069705, 1, 0.4392157, 0, 1,
-1.491092, 0.1783414, -1.780305, 1, 0.4431373, 0, 1,
-1.485442, -1.276525, -2.823289, 1, 0.4509804, 0, 1,
-1.481296, 1.085009, -1.645651, 1, 0.454902, 0, 1,
-1.47313, -0.3871839, -1.50899, 1, 0.4627451, 0, 1,
-1.46861, -0.8185626, -3.747815, 1, 0.4666667, 0, 1,
-1.456559, -1.527975, -2.452288, 1, 0.4745098, 0, 1,
-1.455307, 0.5685447, -1.978455, 1, 0.4784314, 0, 1,
-1.455183, -0.7586973, -2.022695, 1, 0.4862745, 0, 1,
-1.449681, 1.030085, -0.559377, 1, 0.4901961, 0, 1,
-1.446572, 0.3598057, -1.307131, 1, 0.4980392, 0, 1,
-1.446169, 0.6266959, 0.003559043, 1, 0.5058824, 0, 1,
-1.435906, -0.2975606, -2.952133, 1, 0.509804, 0, 1,
-1.414418, 0.6040581, -2.970845, 1, 0.5176471, 0, 1,
-1.400469, -0.1535206, -0.8720164, 1, 0.5215687, 0, 1,
-1.400338, 1.201502, -1.29976, 1, 0.5294118, 0, 1,
-1.400003, -0.06603166, -0.8023084, 1, 0.5333334, 0, 1,
-1.398655, -1.464689, -2.829458, 1, 0.5411765, 0, 1,
-1.394434, -0.09154867, -0.4291055, 1, 0.5450981, 0, 1,
-1.388491, -0.2068251, -2.916393, 1, 0.5529412, 0, 1,
-1.372627, -1.20765, -3.573216, 1, 0.5568628, 0, 1,
-1.372182, -0.3172619, -1.830597, 1, 0.5647059, 0, 1,
-1.360593, -0.5923502, -2.40002, 1, 0.5686275, 0, 1,
-1.350204, 1.011892, -0.7061858, 1, 0.5764706, 0, 1,
-1.350194, 0.03355454, -1.1615, 1, 0.5803922, 0, 1,
-1.324333, 2.257398, -1.986123, 1, 0.5882353, 0, 1,
-1.32097, 0.8635607, -0.7744235, 1, 0.5921569, 0, 1,
-1.301456, 0.01339118, -1.649751, 1, 0.6, 0, 1,
-1.299439, 0.2597036, 0.7233531, 1, 0.6078432, 0, 1,
-1.299046, -1.753392, -2.28766, 1, 0.6117647, 0, 1,
-1.289237, -0.4864827, -2.432258, 1, 0.6196079, 0, 1,
-1.282479, 1.40585, 0.4563595, 1, 0.6235294, 0, 1,
-1.279607, 0.1863795, -1.161382, 1, 0.6313726, 0, 1,
-1.274224, -0.6506907, -1.607462, 1, 0.6352941, 0, 1,
-1.271833, 1.1362, -0.5568964, 1, 0.6431373, 0, 1,
-1.270194, 0.2154812, -1.987374, 1, 0.6470588, 0, 1,
-1.26908, 1.383356, -0.8155856, 1, 0.654902, 0, 1,
-1.260143, -0.625228, -1.35675, 1, 0.6588235, 0, 1,
-1.257032, 0.3791616, -1.278545, 1, 0.6666667, 0, 1,
-1.256763, 0.01405757, -2.731704, 1, 0.6705883, 0, 1,
-1.251506, -0.3601764, -1.71664, 1, 0.6784314, 0, 1,
-1.250819, 1.08529, -2.937838, 1, 0.682353, 0, 1,
-1.240515, 1.524454, 0.1833604, 1, 0.6901961, 0, 1,
-1.239308, -1.65259, -2.621927, 1, 0.6941177, 0, 1,
-1.237694, 0.1468281, -1.714382, 1, 0.7019608, 0, 1,
-1.235904, 1.440798, -1.898458, 1, 0.7098039, 0, 1,
-1.233168, 0.9565511, -0.6775808, 1, 0.7137255, 0, 1,
-1.232446, 1.461402, -0.8989226, 1, 0.7215686, 0, 1,
-1.232343, -0.4609865, -2.055627, 1, 0.7254902, 0, 1,
-1.228332, 0.4021423, -3.402209, 1, 0.7333333, 0, 1,
-1.227278, 2.345806, -0.1990245, 1, 0.7372549, 0, 1,
-1.222195, 0.5232509, -1.75528, 1, 0.7450981, 0, 1,
-1.220484, -0.2569394, -0.3020459, 1, 0.7490196, 0, 1,
-1.217341, -1.276421, -1.30149, 1, 0.7568628, 0, 1,
-1.214446, 1.368273, -1.648494, 1, 0.7607843, 0, 1,
-1.212899, -1.870093, -2.701859, 1, 0.7686275, 0, 1,
-1.20921, -3.101494, -2.604673, 1, 0.772549, 0, 1,
-1.207004, -0.7755017, -0.9315378, 1, 0.7803922, 0, 1,
-1.205588, -0.09288798, -0.9682289, 1, 0.7843137, 0, 1,
-1.19984, -1.317446, -4.00344, 1, 0.7921569, 0, 1,
-1.19502, 0.01823469, -2.098289, 1, 0.7960784, 0, 1,
-1.194464, 1.790695, -3.363692, 1, 0.8039216, 0, 1,
-1.192737, 0.8736181, -1.884633, 1, 0.8117647, 0, 1,
-1.175397, -0.7428798, -2.559974, 1, 0.8156863, 0, 1,
-1.174916, 0.9527068, -0.9891526, 1, 0.8235294, 0, 1,
-1.169043, 0.5517892, -0.3173867, 1, 0.827451, 0, 1,
-1.167409, 0.5035776, -1.232655, 1, 0.8352941, 0, 1,
-1.161742, 1.405549, -0.6065359, 1, 0.8392157, 0, 1,
-1.148228, 1.15015, -1.4457, 1, 0.8470588, 0, 1,
-1.145103, -0.2488599, -1.070492, 1, 0.8509804, 0, 1,
-1.14488, -0.162106, -2.408164, 1, 0.8588235, 0, 1,
-1.142735, 0.5811349, 0.03764941, 1, 0.8627451, 0, 1,
-1.134945, -0.01618706, -0.8891453, 1, 0.8705882, 0, 1,
-1.131776, -0.8361268, -1.492951, 1, 0.8745098, 0, 1,
-1.131557, 1.038702, -1.659151, 1, 0.8823529, 0, 1,
-1.120377, 0.3351516, -1.222569, 1, 0.8862745, 0, 1,
-1.117343, 0.8274799, 0.6113454, 1, 0.8941177, 0, 1,
-1.109914, -1.787036, -3.771358, 1, 0.8980392, 0, 1,
-1.101646, -1.706813, -2.818291, 1, 0.9058824, 0, 1,
-1.095103, 0.4171655, -1.101432, 1, 0.9137255, 0, 1,
-1.091037, -2.697889, -0.7368435, 1, 0.9176471, 0, 1,
-1.090602, 0.2868538, -1.336525, 1, 0.9254902, 0, 1,
-1.079106, 0.6614487, -0.532059, 1, 0.9294118, 0, 1,
-1.075599, 0.6594728, 0.1938498, 1, 0.9372549, 0, 1,
-1.068705, -0.3293772, -2.933579, 1, 0.9411765, 0, 1,
-1.067947, -0.3493789, -3.930222, 1, 0.9490196, 0, 1,
-1.06685, -0.5251662, -0.9897401, 1, 0.9529412, 0, 1,
-1.05854, 0.5390476, -0.4586062, 1, 0.9607843, 0, 1,
-1.055953, 0.5621103, -1.025792, 1, 0.9647059, 0, 1,
-1.046712, 0.4526834, -2.064761, 1, 0.972549, 0, 1,
-1.045245, -0.4993868, -1.911945, 1, 0.9764706, 0, 1,
-1.043477, -0.2236921, 0.1242836, 1, 0.9843137, 0, 1,
-1.04083, -1.12265, -2.617105, 1, 0.9882353, 0, 1,
-1.035736, 0.9108939, -0.0429919, 1, 0.9960784, 0, 1,
-1.023524, 0.7597644, 0.09026376, 0.9960784, 1, 0, 1,
-1.023094, -0.8800821, -3.635196, 0.9921569, 1, 0, 1,
-1.021763, -1.258433, -2.784262, 0.9843137, 1, 0, 1,
-1.004418, 1.508761, -0.4064689, 0.9803922, 1, 0, 1,
-1.004317, -1.070817, -3.043778, 0.972549, 1, 0, 1,
-1.003237, -0.5484829, -0.9051763, 0.9686275, 1, 0, 1,
-1.000805, 0.6533373, -2.057232, 0.9607843, 1, 0, 1,
-0.9994686, -0.3530206, -3.051929, 0.9568627, 1, 0, 1,
-0.999283, -0.6761109, -2.880627, 0.9490196, 1, 0, 1,
-0.9958052, -0.4687234, -1.522109, 0.945098, 1, 0, 1,
-0.9911452, -0.6799557, -3.311184, 0.9372549, 1, 0, 1,
-0.9902834, -0.2372468, -1.860647, 0.9333333, 1, 0, 1,
-0.9887266, -0.956177, -1.136975, 0.9254902, 1, 0, 1,
-0.9881207, 0.1858514, -0.4064125, 0.9215686, 1, 0, 1,
-0.9852333, -0.08279353, -2.014467, 0.9137255, 1, 0, 1,
-0.975562, 0.8795997, -1.278353, 0.9098039, 1, 0, 1,
-0.9751826, 0.2438492, -3.209106, 0.9019608, 1, 0, 1,
-0.9749165, -1.722237, -1.183228, 0.8941177, 1, 0, 1,
-0.9743556, -0.9429932, -1.549199, 0.8901961, 1, 0, 1,
-0.9733516, 0.02247399, -0.6695952, 0.8823529, 1, 0, 1,
-0.969704, 1.389183, -1.208816, 0.8784314, 1, 0, 1,
-0.959926, -0.3545509, -0.6039764, 0.8705882, 1, 0, 1,
-0.957366, -0.6701547, -1.457532, 0.8666667, 1, 0, 1,
-0.9484386, -1.383263, -2.067692, 0.8588235, 1, 0, 1,
-0.9471603, 0.1039571, 0.002046118, 0.854902, 1, 0, 1,
-0.9463746, 0.7869597, -2.568517, 0.8470588, 1, 0, 1,
-0.9457576, -0.8136361, -2.537737, 0.8431373, 1, 0, 1,
-0.9429963, 0.383862, -2.130742, 0.8352941, 1, 0, 1,
-0.932152, 0.3982677, 0.1383406, 0.8313726, 1, 0, 1,
-0.9299039, 0.7981906, -0.6940421, 0.8235294, 1, 0, 1,
-0.9269639, 1.090422, -0.7499498, 0.8196079, 1, 0, 1,
-0.9235263, 0.2790251, -2.438374, 0.8117647, 1, 0, 1,
-0.9193384, 0.1957229, -1.2504, 0.8078431, 1, 0, 1,
-0.9175796, -1.259216, -2.995956, 0.8, 1, 0, 1,
-0.9174604, 0.8899111, -0.7901363, 0.7921569, 1, 0, 1,
-0.9164015, -1.258864, -1.67322, 0.7882353, 1, 0, 1,
-0.9144417, -0.6189069, -1.231879, 0.7803922, 1, 0, 1,
-0.9028219, 0.7032715, -2.440037, 0.7764706, 1, 0, 1,
-0.9023001, 2.189888, 0.5120313, 0.7686275, 1, 0, 1,
-0.90015, -0.9666369, -3.147082, 0.7647059, 1, 0, 1,
-0.8973682, 0.2122484, -1.484789, 0.7568628, 1, 0, 1,
-0.8973428, 1.163711, 1.424796, 0.7529412, 1, 0, 1,
-0.8956372, -0.9874749, -1.243573, 0.7450981, 1, 0, 1,
-0.8899573, -0.2596771, 1.050014, 0.7411765, 1, 0, 1,
-0.8786237, -1.178995, -1.687893, 0.7333333, 1, 0, 1,
-0.8725449, 0.1813624, -2.728383, 0.7294118, 1, 0, 1,
-0.8706099, -0.03102859, -1.743682, 0.7215686, 1, 0, 1,
-0.8659456, -2.750856, -2.483656, 0.7176471, 1, 0, 1,
-0.8570396, 0.02420271, -1.764852, 0.7098039, 1, 0, 1,
-0.8515541, -0.3600905, -3.155615, 0.7058824, 1, 0, 1,
-0.8450431, 0.05479337, -0.8010883, 0.6980392, 1, 0, 1,
-0.8444781, -1.795283, -1.785999, 0.6901961, 1, 0, 1,
-0.8420549, 1.158644, -0.5540639, 0.6862745, 1, 0, 1,
-0.8410795, -0.03007552, -2.478868, 0.6784314, 1, 0, 1,
-0.838537, -0.9047179, -3.738842, 0.6745098, 1, 0, 1,
-0.8296896, 0.8754739, -1.604698, 0.6666667, 1, 0, 1,
-0.8293663, -0.2058872, -3.75385, 0.6627451, 1, 0, 1,
-0.822902, 1.409929, -0.8027935, 0.654902, 1, 0, 1,
-0.8117701, 0.9393194, -0.3608692, 0.6509804, 1, 0, 1,
-0.8039365, -1.16889, -2.747011, 0.6431373, 1, 0, 1,
-0.8014066, -0.273924, -1.985001, 0.6392157, 1, 0, 1,
-0.8005019, 0.4543211, -0.1142138, 0.6313726, 1, 0, 1,
-0.799599, 0.08549807, -0.9426898, 0.627451, 1, 0, 1,
-0.7904333, -0.1462284, -1.049474, 0.6196079, 1, 0, 1,
-0.7902812, -0.6631302, -2.207444, 0.6156863, 1, 0, 1,
-0.7822676, -0.06255877, -0.8193018, 0.6078432, 1, 0, 1,
-0.7763162, -0.6521564, -2.803013, 0.6039216, 1, 0, 1,
-0.7692533, 0.431605, -2.227814, 0.5960785, 1, 0, 1,
-0.7624527, 1.548188, -1.278035, 0.5882353, 1, 0, 1,
-0.7602895, -1.327768, -1.357867, 0.5843138, 1, 0, 1,
-0.7580346, -0.1818548, -3.062461, 0.5764706, 1, 0, 1,
-0.7557095, -0.6029819, -2.109719, 0.572549, 1, 0, 1,
-0.7514724, 1.697876, -1.078777, 0.5647059, 1, 0, 1,
-0.7488266, 0.9864767, -0.3950563, 0.5607843, 1, 0, 1,
-0.7426049, -0.4229402, -1.35627, 0.5529412, 1, 0, 1,
-0.740984, 0.690338, 1.389683, 0.5490196, 1, 0, 1,
-0.7352763, -0.1525433, -1.277543, 0.5411765, 1, 0, 1,
-0.7230414, 0.3102441, -0.5002948, 0.5372549, 1, 0, 1,
-0.7190016, 1.894225, -0.8123558, 0.5294118, 1, 0, 1,
-0.7187775, 0.09846587, -0.07889303, 0.5254902, 1, 0, 1,
-0.7151195, 0.2663056, -0.9736251, 0.5176471, 1, 0, 1,
-0.7130882, -0.5623658, -1.872101, 0.5137255, 1, 0, 1,
-0.7099836, -1.25823, -1.481262, 0.5058824, 1, 0, 1,
-0.7098713, -0.5349729, -3.532825, 0.5019608, 1, 0, 1,
-0.7095712, -0.01673234, -4.026507, 0.4941176, 1, 0, 1,
-0.7063358, 0.1948325, -2.611136, 0.4862745, 1, 0, 1,
-0.7043459, 0.3033978, -2.621142, 0.4823529, 1, 0, 1,
-0.7002152, 0.100534, -2.294368, 0.4745098, 1, 0, 1,
-0.6984372, -0.08058016, -1.63066, 0.4705882, 1, 0, 1,
-0.6929917, -0.1992461, -1.538349, 0.4627451, 1, 0, 1,
-0.6928075, -0.07532052, -2.510715, 0.4588235, 1, 0, 1,
-0.6923883, 0.04295102, -1.44373, 0.4509804, 1, 0, 1,
-0.6881261, -0.5451012, -2.956365, 0.4470588, 1, 0, 1,
-0.6875756, -1.74394, -2.512678, 0.4392157, 1, 0, 1,
-0.6859145, 0.8834826, -1.73652, 0.4352941, 1, 0, 1,
-0.685376, -0.4017791, -2.526494, 0.427451, 1, 0, 1,
-0.6826813, 1.014892, -0.5897313, 0.4235294, 1, 0, 1,
-0.6820589, -1.005134, -2.244781, 0.4156863, 1, 0, 1,
-0.6760077, -0.2141165, -1.203897, 0.4117647, 1, 0, 1,
-0.6755728, 0.4102153, -2.309421, 0.4039216, 1, 0, 1,
-0.6714637, -1.789815, -2.989006, 0.3960784, 1, 0, 1,
-0.6667212, -1.675838, -3.503881, 0.3921569, 1, 0, 1,
-0.6634821, 0.04805066, -1.884553, 0.3843137, 1, 0, 1,
-0.6581698, -0.8654133, -1.946425, 0.3803922, 1, 0, 1,
-0.6545852, -0.04666974, 0.05388394, 0.372549, 1, 0, 1,
-0.6504344, 1.792687, 0.4598482, 0.3686275, 1, 0, 1,
-0.6498991, -0.2946822, -0.9038033, 0.3607843, 1, 0, 1,
-0.6487637, 1.349771, 0.2951067, 0.3568628, 1, 0, 1,
-0.6396813, -0.3946146, -3.158253, 0.3490196, 1, 0, 1,
-0.639133, 0.2406301, -2.10467, 0.345098, 1, 0, 1,
-0.6301983, -0.2784796, -0.3214684, 0.3372549, 1, 0, 1,
-0.6289772, -0.7693478, -3.157582, 0.3333333, 1, 0, 1,
-0.6285644, 0.238803, -1.0975, 0.3254902, 1, 0, 1,
-0.6214999, 0.1333067, -3.00801, 0.3215686, 1, 0, 1,
-0.6197948, -1.708764, -3.733671, 0.3137255, 1, 0, 1,
-0.6143093, -0.4522445, -4.008044, 0.3098039, 1, 0, 1,
-0.6113454, -1.271664, -2.44782, 0.3019608, 1, 0, 1,
-0.6112748, -0.01248688, -0.9010847, 0.2941177, 1, 0, 1,
-0.6100041, -1.286582, -2.791584, 0.2901961, 1, 0, 1,
-0.6096177, 0.1555406, -1.607596, 0.282353, 1, 0, 1,
-0.5994197, -0.6430021, -2.77059, 0.2784314, 1, 0, 1,
-0.5974765, 0.4749124, -2.406824, 0.2705882, 1, 0, 1,
-0.5932545, 1.303134, -0.1197182, 0.2666667, 1, 0, 1,
-0.5904192, 1.143669, 0.1391223, 0.2588235, 1, 0, 1,
-0.5894938, 1.13272, -1.158713, 0.254902, 1, 0, 1,
-0.5776924, -0.1623351, -1.364981, 0.2470588, 1, 0, 1,
-0.5759385, -2.201155, -1.685601, 0.2431373, 1, 0, 1,
-0.5744148, 0.3399379, -0.09850268, 0.2352941, 1, 0, 1,
-0.5736575, -1.348995, -3.757085, 0.2313726, 1, 0, 1,
-0.5710919, 1.298557, 0.8840803, 0.2235294, 1, 0, 1,
-0.5681082, -1.019778, -2.603987, 0.2196078, 1, 0, 1,
-0.565366, 0.982805, -2.93071, 0.2117647, 1, 0, 1,
-0.5648177, 0.6934012, -0.3882042, 0.2078431, 1, 0, 1,
-0.5494807, -0.6968749, -2.402501, 0.2, 1, 0, 1,
-0.5484108, 0.86678, -1.016584, 0.1921569, 1, 0, 1,
-0.5208216, 0.9556902, -1.042743, 0.1882353, 1, 0, 1,
-0.5206412, 1.909712, -1.355822, 0.1803922, 1, 0, 1,
-0.5197943, -0.3373758, -2.988683, 0.1764706, 1, 0, 1,
-0.5190178, 0.8654471, -1.167162, 0.1686275, 1, 0, 1,
-0.5183066, -0.1303603, -1.567651, 0.1647059, 1, 0, 1,
-0.5182809, 1.771213, 0.4298737, 0.1568628, 1, 0, 1,
-0.5155407, -0.4970937, -3.375469, 0.1529412, 1, 0, 1,
-0.5151051, 0.8167707, 0.4702612, 0.145098, 1, 0, 1,
-0.5092451, 2.010053, 0.1565738, 0.1411765, 1, 0, 1,
-0.5053998, 0.0130947, -2.31619, 0.1333333, 1, 0, 1,
-0.5049763, -0.2457975, -2.24207, 0.1294118, 1, 0, 1,
-0.5017926, -1.187878, -1.15836, 0.1215686, 1, 0, 1,
-0.500554, 0.1060283, -1.336127, 0.1176471, 1, 0, 1,
-0.4993159, 0.4698921, -0.2299627, 0.1098039, 1, 0, 1,
-0.4983266, 0.8067263, -1.401481, 0.1058824, 1, 0, 1,
-0.4981348, 0.0998452, 0.9716431, 0.09803922, 1, 0, 1,
-0.4973464, -0.04701493, 0.4167581, 0.09019608, 1, 0, 1,
-0.4936404, 1.574049, -0.01804713, 0.08627451, 1, 0, 1,
-0.4921612, -1.06603, -4.475751, 0.07843138, 1, 0, 1,
-0.4910881, -1.84352, -2.65979, 0.07450981, 1, 0, 1,
-0.4900226, 0.5539651, -1.398366, 0.06666667, 1, 0, 1,
-0.4881438, -0.09148679, -2.099252, 0.0627451, 1, 0, 1,
-0.4862612, -0.6256627, -3.638785, 0.05490196, 1, 0, 1,
-0.4850205, 0.9318395, 1.243902, 0.05098039, 1, 0, 1,
-0.4826528, 2.130001, -0.1987157, 0.04313726, 1, 0, 1,
-0.4822327, 2.026323, -1.458539, 0.03921569, 1, 0, 1,
-0.4768215, -0.6215937, -0.9138002, 0.03137255, 1, 0, 1,
-0.4755232, 0.4364728, -1.284622, 0.02745098, 1, 0, 1,
-0.4747624, -1.749664, -3.605641, 0.01960784, 1, 0, 1,
-0.4736581, -0.4519051, -1.199118, 0.01568628, 1, 0, 1,
-0.4723605, -0.7505522, -1.382893, 0.007843138, 1, 0, 1,
-0.4706333, -1.643089, -2.988969, 0.003921569, 1, 0, 1,
-0.4688796, 0.184219, -3.225229, 0, 1, 0.003921569, 1,
-0.4683879, 0.1584439, -0.5851805, 0, 1, 0.01176471, 1,
-0.4673103, -0.1230257, -0.9737926, 0, 1, 0.01568628, 1,
-0.4672021, -2.647046, -1.303237, 0, 1, 0.02352941, 1,
-0.466421, 1.853227, 0.657285, 0, 1, 0.02745098, 1,
-0.4662132, 0.07686039, -2.715749, 0, 1, 0.03529412, 1,
-0.4644837, 1.765592, -1.991524, 0, 1, 0.03921569, 1,
-0.4621236, 0.1684062, 0.2378286, 0, 1, 0.04705882, 1,
-0.4568977, 0.731535, -0.7309773, 0, 1, 0.05098039, 1,
-0.4542182, -1.618377, -2.868335, 0, 1, 0.05882353, 1,
-0.4542044, 0.6804744, -1.533052, 0, 1, 0.0627451, 1,
-0.4512795, 0.7919759, -0.6830565, 0, 1, 0.07058824, 1,
-0.4509535, -1.083022, -3.7042, 0, 1, 0.07450981, 1,
-0.4492839, 0.310808, -3.115652, 0, 1, 0.08235294, 1,
-0.4447629, -1.07269, -2.757437, 0, 1, 0.08627451, 1,
-0.4382602, 1.113753, 0.2057775, 0, 1, 0.09411765, 1,
-0.4337023, 0.09533572, -0.5412179, 0, 1, 0.1019608, 1,
-0.4320875, 0.5420997, -0.6782149, 0, 1, 0.1058824, 1,
-0.4274165, -1.545018, -2.247798, 0, 1, 0.1137255, 1,
-0.4263704, -0.8450018, -1.309344, 0, 1, 0.1176471, 1,
-0.4262276, 0.3852062, -0.4387211, 0, 1, 0.1254902, 1,
-0.4252326, -0.8662199, 0.6590191, 0, 1, 0.1294118, 1,
-0.420977, 0.08479787, -1.744085, 0, 1, 0.1372549, 1,
-0.4186201, 3.288511, 0.1877302, 0, 1, 0.1411765, 1,
-0.417537, -0.6042521, -1.417241, 0, 1, 0.1490196, 1,
-0.4153347, -1.826848, -5.448032, 0, 1, 0.1529412, 1,
-0.4126975, -0.3463392, -0.3920719, 0, 1, 0.1607843, 1,
-0.4109626, -0.6731934, -1.267753, 0, 1, 0.1647059, 1,
-0.4073698, -1.214077, -3.465352, 0, 1, 0.172549, 1,
-0.4066334, -0.9661397, -1.456186, 0, 1, 0.1764706, 1,
-0.4050104, -0.5986534, -1.957077, 0, 1, 0.1843137, 1,
-0.4030971, 0.4697469, 1.536943, 0, 1, 0.1882353, 1,
-0.3993957, -1.520888, -3.843344, 0, 1, 0.1960784, 1,
-0.3875203, 1.539228, -0.8287091, 0, 1, 0.2039216, 1,
-0.3867351, -0.01988366, -0.7435789, 0, 1, 0.2078431, 1,
-0.3854347, -1.72668, -2.809143, 0, 1, 0.2156863, 1,
-0.3851234, 0.07374764, -1.494678, 0, 1, 0.2196078, 1,
-0.3823152, 0.3166503, -0.7300928, 0, 1, 0.227451, 1,
-0.3809478, 0.3171517, -0.651717, 0, 1, 0.2313726, 1,
-0.3791512, -0.06715522, -3.233106, 0, 1, 0.2392157, 1,
-0.3786512, -0.03076684, -0.7087641, 0, 1, 0.2431373, 1,
-0.378268, -0.7562541, -2.58523, 0, 1, 0.2509804, 1,
-0.3752918, 0.549356, -0.03564228, 0, 1, 0.254902, 1,
-0.362479, -0.4237239, -1.973706, 0, 1, 0.2627451, 1,
-0.3597119, 0.07836223, -1.140884, 0, 1, 0.2666667, 1,
-0.35883, -0.9254068, -3.241052, 0, 1, 0.2745098, 1,
-0.3570133, 0.363927, -1.872664, 0, 1, 0.2784314, 1,
-0.3556101, -0.9557899, -3.519404, 0, 1, 0.2862745, 1,
-0.3497888, -0.1055723, -2.344459, 0, 1, 0.2901961, 1,
-0.3493901, 0.8107572, 2.761007, 0, 1, 0.2980392, 1,
-0.3492419, -1.448745, -2.456776, 0, 1, 0.3058824, 1,
-0.3475923, 0.4277653, -2.81874, 0, 1, 0.3098039, 1,
-0.3472327, -1.357059, -2.866549, 0, 1, 0.3176471, 1,
-0.3460687, -0.4579915, -2.339972, 0, 1, 0.3215686, 1,
-0.3437482, -0.8997569, -2.481362, 0, 1, 0.3294118, 1,
-0.3385295, -0.3501767, -2.379415, 0, 1, 0.3333333, 1,
-0.3353515, -0.9494836, -3.723999, 0, 1, 0.3411765, 1,
-0.3351604, -0.2031463, -1.85828, 0, 1, 0.345098, 1,
-0.3350138, -0.9915342, -3.950852, 0, 1, 0.3529412, 1,
-0.3324898, -0.0697775, -1.592256, 0, 1, 0.3568628, 1,
-0.3315674, 3.141232, -0.602156, 0, 1, 0.3647059, 1,
-0.3279547, -0.4148785, -3.166813, 0, 1, 0.3686275, 1,
-0.3249579, -0.4791006, -0.1309272, 0, 1, 0.3764706, 1,
-0.3223792, 0.6299941, 1.099966, 0, 1, 0.3803922, 1,
-0.3144291, 0.1504777, -1.243657, 0, 1, 0.3882353, 1,
-0.3127074, -0.5114104, -3.46903, 0, 1, 0.3921569, 1,
-0.3082919, 0.07911006, -0.1207422, 0, 1, 0.4, 1,
-0.30506, 0.7112029, 0.4345466, 0, 1, 0.4078431, 1,
-0.3050252, 0.6529591, 0.176252, 0, 1, 0.4117647, 1,
-0.2958947, -0.7853163, -4.620349, 0, 1, 0.4196078, 1,
-0.2946161, -0.2778946, -1.342027, 0, 1, 0.4235294, 1,
-0.2910013, 0.7966713, -0.8601343, 0, 1, 0.4313726, 1,
-0.2890224, 1.078771, 0.5990413, 0, 1, 0.4352941, 1,
-0.2860278, -1.449692, -1.461269, 0, 1, 0.4431373, 1,
-0.2780956, -1.267058, -2.835985, 0, 1, 0.4470588, 1,
-0.277381, -0.3157784, -4.083575, 0, 1, 0.454902, 1,
-0.2763273, -1.695671, -4.002645, 0, 1, 0.4588235, 1,
-0.2757756, -1.890405, -3.535414, 0, 1, 0.4666667, 1,
-0.2750504, 1.996339, -1.606554, 0, 1, 0.4705882, 1,
-0.2720994, -1.033592, -2.390939, 0, 1, 0.4784314, 1,
-0.2706017, 0.2422933, 0.4836129, 0, 1, 0.4823529, 1,
-0.2696131, -0.9575642, -1.662568, 0, 1, 0.4901961, 1,
-0.2623934, -0.189741, -3.744625, 0, 1, 0.4941176, 1,
-0.2591927, -1.476979, -4.950467, 0, 1, 0.5019608, 1,
-0.2548151, -0.5283828, -0.3280356, 0, 1, 0.509804, 1,
-0.2542965, 0.7677515, -2.293631, 0, 1, 0.5137255, 1,
-0.2457108, -1.688166, -3.0555, 0, 1, 0.5215687, 1,
-0.2337023, -0.4021316, -3.66462, 0, 1, 0.5254902, 1,
-0.2329119, 0.04118585, -2.060518, 0, 1, 0.5333334, 1,
-0.2309158, 0.4870654, -1.15753, 0, 1, 0.5372549, 1,
-0.2301618, -1.658357, -4.609827, 0, 1, 0.5450981, 1,
-0.2298407, 2.75405, -0.3120311, 0, 1, 0.5490196, 1,
-0.2293567, -2.352051, -3.875815, 0, 1, 0.5568628, 1,
-0.2283345, 0.6223726, -0.3172567, 0, 1, 0.5607843, 1,
-0.225404, -0.09572339, -1.858508, 0, 1, 0.5686275, 1,
-0.2253436, -0.06576385, -0.6724889, 0, 1, 0.572549, 1,
-0.2197281, 2.222612, 0.8707124, 0, 1, 0.5803922, 1,
-0.2191104, 1.208846, -1.085689, 0, 1, 0.5843138, 1,
-0.2177214, 0.6106816, 0.7365499, 0, 1, 0.5921569, 1,
-0.2130907, -1.936084, -0.6929294, 0, 1, 0.5960785, 1,
-0.2116049, 2.252554, 0.266059, 0, 1, 0.6039216, 1,
-0.211004, -0.3632459, -2.506113, 0, 1, 0.6117647, 1,
-0.210356, 0.5884389, 0.857151, 0, 1, 0.6156863, 1,
-0.2076537, 0.8340948, 0.06176843, 0, 1, 0.6235294, 1,
-0.2051768, -0.03019393, -1.941446, 0, 1, 0.627451, 1,
-0.2044814, 1.233095, -0.4131254, 0, 1, 0.6352941, 1,
-0.2024014, -0.1993821, -4.092311, 0, 1, 0.6392157, 1,
-0.2018314, 1.746175, -0.8611425, 0, 1, 0.6470588, 1,
-0.2006687, 0.2357756, 1.030331, 0, 1, 0.6509804, 1,
-0.1993762, -0.1784584, -1.848764, 0, 1, 0.6588235, 1,
-0.1984366, -0.9883924, -2.292063, 0, 1, 0.6627451, 1,
-0.1963975, 0.2729374, 0.258287, 0, 1, 0.6705883, 1,
-0.1943842, 1.311035, -0.3561595, 0, 1, 0.6745098, 1,
-0.1911855, 0.2813646, -0.6043905, 0, 1, 0.682353, 1,
-0.1885235, 1.039881, 0.5558219, 0, 1, 0.6862745, 1,
-0.187482, -0.4270309, -0.3857558, 0, 1, 0.6941177, 1,
-0.1853837, 0.2075919, -0.4909308, 0, 1, 0.7019608, 1,
-0.1781293, -1.53604, 0.2123678, 0, 1, 0.7058824, 1,
-0.1767969, 0.09978183, 0.1035863, 0, 1, 0.7137255, 1,
-0.1754253, 0.1187771, -0.5091264, 0, 1, 0.7176471, 1,
-0.1689879, -1.870143, -3.73307, 0, 1, 0.7254902, 1,
-0.165579, -0.02850526, -2.128005, 0, 1, 0.7294118, 1,
-0.1638893, -0.3230184, -3.709031, 0, 1, 0.7372549, 1,
-0.1596876, -1.481105, -5.23552, 0, 1, 0.7411765, 1,
-0.1553294, 0.4473811, 0.9624465, 0, 1, 0.7490196, 1,
-0.150674, 1.492322, -0.9475787, 0, 1, 0.7529412, 1,
-0.1487653, 1.014626, -0.6336879, 0, 1, 0.7607843, 1,
-0.1451113, 1.095219, -0.7856442, 0, 1, 0.7647059, 1,
-0.1375913, 0.7527895, 0.9234666, 0, 1, 0.772549, 1,
-0.1354655, 0.1206251, -0.09685371, 0, 1, 0.7764706, 1,
-0.1329251, -0.8708203, -3.591856, 0, 1, 0.7843137, 1,
-0.1315213, -0.720897, -3.734401, 0, 1, 0.7882353, 1,
-0.1307893, -2.157231, -2.420044, 0, 1, 0.7960784, 1,
-0.1160302, -0.466976, -4.358982, 0, 1, 0.8039216, 1,
-0.112832, 0.0863252, 0.5522005, 0, 1, 0.8078431, 1,
-0.1126558, -0.926132, -3.468465, 0, 1, 0.8156863, 1,
-0.1112734, 1.198986, -0.196299, 0, 1, 0.8196079, 1,
-0.1110748, -0.4469476, -3.537512, 0, 1, 0.827451, 1,
-0.1091697, -0.7073475, -3.462143, 0, 1, 0.8313726, 1,
-0.1065856, 1.347059, -0.4567822, 0, 1, 0.8392157, 1,
-0.1021607, 0.4887479, 0.02478367, 0, 1, 0.8431373, 1,
-0.09657154, 0.626238, -0.6459832, 0, 1, 0.8509804, 1,
-0.09536603, -0.004232981, 0.5060695, 0, 1, 0.854902, 1,
-0.08883373, 0.9775079, -0.1946186, 0, 1, 0.8627451, 1,
-0.08673758, -1.310542, -4.272108, 0, 1, 0.8666667, 1,
-0.08650313, -1.824409, -2.425927, 0, 1, 0.8745098, 1,
-0.08643993, 0.6564305, 0.5263347, 0, 1, 0.8784314, 1,
-0.08626961, -0.2382238, -0.5611041, 0, 1, 0.8862745, 1,
-0.08542135, 2.716016, 0.866809, 0, 1, 0.8901961, 1,
-0.08468805, 1.255634, 2.690558, 0, 1, 0.8980392, 1,
-0.08417524, -0.2234907, -3.403591, 0, 1, 0.9058824, 1,
-0.08154955, 0.7587466, -0.8785962, 0, 1, 0.9098039, 1,
-0.08099295, 1.411946, -0.3270992, 0, 1, 0.9176471, 1,
-0.07977329, -0.467866, -2.918872, 0, 1, 0.9215686, 1,
-0.07480732, -0.09145395, -2.668745, 0, 1, 0.9294118, 1,
-0.07399788, 0.9322718, 1.574072, 0, 1, 0.9333333, 1,
-0.07334378, 0.5921803, -0.3622929, 0, 1, 0.9411765, 1,
-0.07151655, -1.693811, -3.042611, 0, 1, 0.945098, 1,
-0.06031407, 0.2008632, 0.5721965, 0, 1, 0.9529412, 1,
-0.05866788, -0.2228227, -2.884533, 0, 1, 0.9568627, 1,
-0.0571822, -1.26869, -2.383652, 0, 1, 0.9647059, 1,
-0.05682324, 0.1383645, 0.04958676, 0, 1, 0.9686275, 1,
-0.05405539, -0.5203737, -1.605828, 0, 1, 0.9764706, 1,
-0.05367863, 0.6908914, 0.5591819, 0, 1, 0.9803922, 1,
-0.05132725, -1.138313, -3.690652, 0, 1, 0.9882353, 1,
-0.04940233, -0.310941, -2.302369, 0, 1, 0.9921569, 1,
-0.04687531, -2.139211, -2.631647, 0, 1, 1, 1,
-0.04285892, -1.038123, -3.731314, 0, 0.9921569, 1, 1,
-0.04129274, -0.3604338, -3.02934, 0, 0.9882353, 1, 1,
-0.04119308, -0.6320982, -2.591478, 0, 0.9803922, 1, 1,
-0.03923582, -0.1624069, -1.794843, 0, 0.9764706, 1, 1,
-0.0379438, 0.6136324, -0.7326406, 0, 0.9686275, 1, 1,
-0.03732955, -0.4570699, -4.494401, 0, 0.9647059, 1, 1,
-0.03455711, -0.8309847, -3.875626, 0, 0.9568627, 1, 1,
-0.02676613, -0.7324736, -1.975585, 0, 0.9529412, 1, 1,
-0.02621782, -1.033439, -3.895846, 0, 0.945098, 1, 1,
-0.02495689, -0.8817222, -1.448269, 0, 0.9411765, 1, 1,
-0.02138788, -1.295647, -4.341727, 0, 0.9333333, 1, 1,
-0.02090625, -0.01291449, -1.142392, 0, 0.9294118, 1, 1,
-0.01715032, -0.6330305, -1.592508, 0, 0.9215686, 1, 1,
-0.01292183, 0.2829843, -0.5447215, 0, 0.9176471, 1, 1,
-0.01199543, 0.6960862, -0.4111698, 0, 0.9098039, 1, 1,
-0.01194822, -0.6050496, -2.875097, 0, 0.9058824, 1, 1,
-0.009880336, -1.15858, -3.789382, 0, 0.8980392, 1, 1,
-0.009084727, -1.032436, -3.086956, 0, 0.8901961, 1, 1,
-0.008628245, -0.4114582, -3.572249, 0, 0.8862745, 1, 1,
-0.007948615, -0.2883884, -3.434747, 0, 0.8784314, 1, 1,
-0.006931208, 0.7566845, 0.4224508, 0, 0.8745098, 1, 1,
-0.005035452, -0.4331197, -3.420771, 0, 0.8666667, 1, 1,
-0.001450253, -0.2552884, -3.035918, 0, 0.8627451, 1, 1,
0.00614805, 0.4202518, -1.709927, 0, 0.854902, 1, 1,
0.006581084, 0.8870436, -0.4853523, 0, 0.8509804, 1, 1,
0.009909068, -0.04926843, 2.499693, 0, 0.8431373, 1, 1,
0.01039052, 0.299286, -1.968327, 0, 0.8392157, 1, 1,
0.01074315, -1.809024, 2.61852, 0, 0.8313726, 1, 1,
0.01624173, 1.276212, -0.6381856, 0, 0.827451, 1, 1,
0.02081808, 0.4972557, 0.9414427, 0, 0.8196079, 1, 1,
0.02085946, 0.6030429, 0.8889779, 0, 0.8156863, 1, 1,
0.02247023, 0.5702892, -1.628995, 0, 0.8078431, 1, 1,
0.0235135, -0.6584613, 2.38891, 0, 0.8039216, 1, 1,
0.02620886, 0.7840863, 0.4993684, 0, 0.7960784, 1, 1,
0.02690215, -2.075053, 2.144781, 0, 0.7882353, 1, 1,
0.03103366, -1.446863, 2.857685, 0, 0.7843137, 1, 1,
0.03806689, -0.007339168, 0.3175196, 0, 0.7764706, 1, 1,
0.04182021, 0.4976033, 3.404757, 0, 0.772549, 1, 1,
0.0426138, 0.09755069, -0.9542091, 0, 0.7647059, 1, 1,
0.04360685, 0.3794502, 1.364458, 0, 0.7607843, 1, 1,
0.04699583, -0.8787652, 3.453045, 0, 0.7529412, 1, 1,
0.05518942, -0.9087159, 1.488153, 0, 0.7490196, 1, 1,
0.05554114, -0.7491735, 3.2623, 0, 0.7411765, 1, 1,
0.05660725, 0.7122702, -0.4451412, 0, 0.7372549, 1, 1,
0.05895559, 1.68348, -0.7171076, 0, 0.7294118, 1, 1,
0.06153995, -0.7427697, 1.766199, 0, 0.7254902, 1, 1,
0.06174842, 0.8278455, 1.489637, 0, 0.7176471, 1, 1,
0.06371985, 2.558887, 1.394706, 0, 0.7137255, 1, 1,
0.06692025, -0.2024155, 2.957833, 0, 0.7058824, 1, 1,
0.07597525, -1.232089, 3.549391, 0, 0.6980392, 1, 1,
0.07622498, 0.8767546, 1.636438, 0, 0.6941177, 1, 1,
0.07626996, 0.4012979, 0.8615698, 0, 0.6862745, 1, 1,
0.08041196, -0.03735496, 2.968602, 0, 0.682353, 1, 1,
0.08464897, 0.3751104, -0.681509, 0, 0.6745098, 1, 1,
0.08654041, 0.2753045, -0.9241356, 0, 0.6705883, 1, 1,
0.08720101, -0.2054471, 3.261953, 0, 0.6627451, 1, 1,
0.08773575, 0.350508, -2.280063, 0, 0.6588235, 1, 1,
0.08853643, -1.210378, 3.448756, 0, 0.6509804, 1, 1,
0.09342948, 0.8017955, 0.2416408, 0, 0.6470588, 1, 1,
0.09348673, -0.4458357, 2.519064, 0, 0.6392157, 1, 1,
0.09559, 0.07140708, -0.4514984, 0, 0.6352941, 1, 1,
0.09868771, -1.924542, 2.565474, 0, 0.627451, 1, 1,
0.101867, 0.658297, 0.7687762, 0, 0.6235294, 1, 1,
0.1054932, -0.491327, 1.603207, 0, 0.6156863, 1, 1,
0.1079865, -0.9787154, 2.43576, 0, 0.6117647, 1, 1,
0.1171482, -1.515826, 3.300857, 0, 0.6039216, 1, 1,
0.117577, 0.4215241, 0.3010151, 0, 0.5960785, 1, 1,
0.1199639, -1.360082, 3.807738, 0, 0.5921569, 1, 1,
0.1211937, -0.8517886, 2.898499, 0, 0.5843138, 1, 1,
0.1229552, 0.9217211, 1.412665, 0, 0.5803922, 1, 1,
0.1229638, -0.2566501, 4.061149, 0, 0.572549, 1, 1,
0.1246731, 0.6685237, 0.1307545, 0, 0.5686275, 1, 1,
0.1253341, -1.713666, 2.907089, 0, 0.5607843, 1, 1,
0.131873, -1.025461, 2.989731, 0, 0.5568628, 1, 1,
0.1321901, 2.352808, 0.3870681, 0, 0.5490196, 1, 1,
0.1338732, -0.4844657, 2.465615, 0, 0.5450981, 1, 1,
0.135525, -0.9637913, 4.247833, 0, 0.5372549, 1, 1,
0.1364854, -0.6616418, 0.5125573, 0, 0.5333334, 1, 1,
0.1394514, -0.5202718, 1.795724, 0, 0.5254902, 1, 1,
0.1405202, 0.809698, 0.5852786, 0, 0.5215687, 1, 1,
0.1456321, -0.379423, 3.246871, 0, 0.5137255, 1, 1,
0.1471332, 0.09595995, 0.5462782, 0, 0.509804, 1, 1,
0.1511619, -0.4264857, 3.141939, 0, 0.5019608, 1, 1,
0.1512091, 0.5729198, -0.008922131, 0, 0.4941176, 1, 1,
0.1513848, -0.8074524, 3.612494, 0, 0.4901961, 1, 1,
0.15168, 0.2160676, 0.9292126, 0, 0.4823529, 1, 1,
0.1546801, -0.1109387, 2.328771, 0, 0.4784314, 1, 1,
0.1584758, 0.6358261, 0.1676754, 0, 0.4705882, 1, 1,
0.1627105, 1.244543, -1.405291, 0, 0.4666667, 1, 1,
0.1628801, -0.8845637, 4.442075, 0, 0.4588235, 1, 1,
0.1657905, 1.646929, -0.8016412, 0, 0.454902, 1, 1,
0.1664772, -0.3998821, 2.574682, 0, 0.4470588, 1, 1,
0.169258, -0.3194693, 1.060859, 0, 0.4431373, 1, 1,
0.1761005, 1.391499, 0.6553763, 0, 0.4352941, 1, 1,
0.1788467, 1.645471, -0.8015395, 0, 0.4313726, 1, 1,
0.1821566, -1.175252, 0.7820604, 0, 0.4235294, 1, 1,
0.1875993, -0.3103563, 3.514895, 0, 0.4196078, 1, 1,
0.1884475, 0.9791749, -0.9407979, 0, 0.4117647, 1, 1,
0.1963927, -0.6223634, 2.831336, 0, 0.4078431, 1, 1,
0.2003119, 0.01453256, 3.411475, 0, 0.4, 1, 1,
0.2010542, 0.1055827, -0.3408014, 0, 0.3921569, 1, 1,
0.2026107, 0.6201075, -0.3845949, 0, 0.3882353, 1, 1,
0.2049089, 0.5028988, 1.013757, 0, 0.3803922, 1, 1,
0.2093912, -0.8865897, 2.362776, 0, 0.3764706, 1, 1,
0.2097284, -1.711658, 3.51806, 0, 0.3686275, 1, 1,
0.2118951, -2.605944, 1.8884, 0, 0.3647059, 1, 1,
0.2145264, -0.1331472, 1.133734, 0, 0.3568628, 1, 1,
0.2293954, -1.538554, 0.711517, 0, 0.3529412, 1, 1,
0.2302215, 0.2639113, -0.007613483, 0, 0.345098, 1, 1,
0.2416005, -0.7498927, 2.818403, 0, 0.3411765, 1, 1,
0.2423227, 1.473557, -0.26567, 0, 0.3333333, 1, 1,
0.2438195, 0.2654235, -0.3260565, 0, 0.3294118, 1, 1,
0.2441469, 0.05155494, 0.2330863, 0, 0.3215686, 1, 1,
0.2468112, -0.9534824, 1.454494, 0, 0.3176471, 1, 1,
0.2525281, 1.270883, -0.08953206, 0, 0.3098039, 1, 1,
0.2557645, -1.030315, 1.456735, 0, 0.3058824, 1, 1,
0.257465, -2.651099, 1.972732, 0, 0.2980392, 1, 1,
0.2592794, 0.3700458, -0.7573923, 0, 0.2901961, 1, 1,
0.2621652, 2.313007, -1.661423, 0, 0.2862745, 1, 1,
0.2623022, 0.4787259, 0.7943239, 0, 0.2784314, 1, 1,
0.2633159, 0.08639714, 1.925387, 0, 0.2745098, 1, 1,
0.2687784, -0.8485911, 4.335482, 0, 0.2666667, 1, 1,
0.270739, -0.5856464, 1.985984, 0, 0.2627451, 1, 1,
0.2727596, -0.8820775, 2.227013, 0, 0.254902, 1, 1,
0.27616, -0.9015938, 3.413792, 0, 0.2509804, 1, 1,
0.2775872, -1.156196, 2.73266, 0, 0.2431373, 1, 1,
0.2805046, -1.198512, 1.320866, 0, 0.2392157, 1, 1,
0.2853669, -0.03267375, 3.184649, 0, 0.2313726, 1, 1,
0.2903243, 1.18927, 2.114413, 0, 0.227451, 1, 1,
0.2980698, -0.6882368, 3.476028, 0, 0.2196078, 1, 1,
0.2981539, 1.299343, 1.380005, 0, 0.2156863, 1, 1,
0.2985623, 1.042555, 0.1132146, 0, 0.2078431, 1, 1,
0.2999485, -0.6449992, 3.958454, 0, 0.2039216, 1, 1,
0.3045996, -0.3314296, 2.996662, 0, 0.1960784, 1, 1,
0.3067304, -1.423159, 0.9979503, 0, 0.1882353, 1, 1,
0.3085515, 1.995, 0.4928348, 0, 0.1843137, 1, 1,
0.3096539, 0.5915357, 2.488408, 0, 0.1764706, 1, 1,
0.3098637, -0.6848625, 3.076299, 0, 0.172549, 1, 1,
0.3100081, 0.9238262, -0.2455018, 0, 0.1647059, 1, 1,
0.3120026, -0.1195771, 1.641264, 0, 0.1607843, 1, 1,
0.3127759, 0.942807, 0.4917548, 0, 0.1529412, 1, 1,
0.31847, 0.4308633, -0.8267936, 0, 0.1490196, 1, 1,
0.3204631, 3.26478, -0.6334215, 0, 0.1411765, 1, 1,
0.3228014, -1.474257, 2.250917, 0, 0.1372549, 1, 1,
0.3243436, 0.4659522, 0.1492856, 0, 0.1294118, 1, 1,
0.3272141, 1.739786, 1.328383, 0, 0.1254902, 1, 1,
0.329337, -1.66129, 3.319824, 0, 0.1176471, 1, 1,
0.330893, -1.82503, 3.99165, 0, 0.1137255, 1, 1,
0.3313111, 0.3318687, 0.6286083, 0, 0.1058824, 1, 1,
0.3314842, -0.7672986, 2.538615, 0, 0.09803922, 1, 1,
0.3322877, -0.3870334, 2.438063, 0, 0.09411765, 1, 1,
0.3328281, -0.6825278, 3.423665, 0, 0.08627451, 1, 1,
0.3354058, -0.5478135, 4.131378, 0, 0.08235294, 1, 1,
0.3402424, 0.2441402, -0.5712248, 0, 0.07450981, 1, 1,
0.341763, -0.3044905, 1.817172, 0, 0.07058824, 1, 1,
0.3465404, -0.3242889, 0.942785, 0, 0.0627451, 1, 1,
0.3495447, -0.4746154, 2.03783, 0, 0.05882353, 1, 1,
0.3560683, -0.6274348, 4.038721, 0, 0.05098039, 1, 1,
0.3616417, -0.3292963, 1.102328, 0, 0.04705882, 1, 1,
0.3660033, 1.1832, 1.043726, 0, 0.03921569, 1, 1,
0.3684363, -0.2026278, 1.478701, 0, 0.03529412, 1, 1,
0.376573, -0.1884484, 3.379541, 0, 0.02745098, 1, 1,
0.3788768, -0.4519224, 0.1120209, 0, 0.02352941, 1, 1,
0.3807848, 0.1520634, 1.188213, 0, 0.01568628, 1, 1,
0.383915, 1.433629, 0.4374537, 0, 0.01176471, 1, 1,
0.3879816, 1.140509, -0.3124307, 0, 0.003921569, 1, 1,
0.3885903, -0.822292, 2.024164, 0.003921569, 0, 1, 1,
0.3920907, 1.265607, 1.372077, 0.007843138, 0, 1, 1,
0.3927773, 0.160224, 0.05880651, 0.01568628, 0, 1, 1,
0.3940202, -0.4708408, 3.719076, 0.01960784, 0, 1, 1,
0.3978499, 1.337553, -3.065017, 0.02745098, 0, 1, 1,
0.3981451, -2.427297, 2.208635, 0.03137255, 0, 1, 1,
0.3985741, -0.3906785, 2.9814, 0.03921569, 0, 1, 1,
0.3990946, -1.373693, 3.333111, 0.04313726, 0, 1, 1,
0.3992153, -0.8847801, 2.54019, 0.05098039, 0, 1, 1,
0.3997727, 0.4865591, 0.313454, 0.05490196, 0, 1, 1,
0.4000475, 1.308855, 0.1749905, 0.0627451, 0, 1, 1,
0.4002649, 0.07930066, 0.7878787, 0.06666667, 0, 1, 1,
0.4032557, -1.368952, 3.602538, 0.07450981, 0, 1, 1,
0.4035243, 1.160611, 0.06126548, 0.07843138, 0, 1, 1,
0.4083085, -1.672745, 2.779819, 0.08627451, 0, 1, 1,
0.4095445, -1.082787, 2.3896, 0.09019608, 0, 1, 1,
0.4099297, 1.436354, -1.299748, 0.09803922, 0, 1, 1,
0.4116627, 0.7202095, 1.829257, 0.1058824, 0, 1, 1,
0.4120567, 0.5025963, 0.1605983, 0.1098039, 0, 1, 1,
0.4194714, 0.873925, -0.8719689, 0.1176471, 0, 1, 1,
0.4228465, -0.6465976, 1.546323, 0.1215686, 0, 1, 1,
0.42991, 0.4581521, -0.4072471, 0.1294118, 0, 1, 1,
0.4301288, -0.8330438, 3.937816, 0.1333333, 0, 1, 1,
0.4347569, 0.6721621, 1.00012, 0.1411765, 0, 1, 1,
0.4379655, -0.5760341, 2.17878, 0.145098, 0, 1, 1,
0.4392548, -0.6375166, 1.673357, 0.1529412, 0, 1, 1,
0.4424251, -2.088908, 3.599473, 0.1568628, 0, 1, 1,
0.4433545, 0.4056371, 0.197998, 0.1647059, 0, 1, 1,
0.4435632, 0.1673806, 1.070135, 0.1686275, 0, 1, 1,
0.4439754, 0.4154807, -0.6495836, 0.1764706, 0, 1, 1,
0.445933, 0.2982502, 2.647769, 0.1803922, 0, 1, 1,
0.4491973, 1.980166, 0.6679407, 0.1882353, 0, 1, 1,
0.4504906, -0.7029492, 2.971364, 0.1921569, 0, 1, 1,
0.4534943, -0.09764172, 0.89991, 0.2, 0, 1, 1,
0.4580822, 0.6000675, -1.125605, 0.2078431, 0, 1, 1,
0.4686567, -1.211036, 1.743498, 0.2117647, 0, 1, 1,
0.4707875, 0.319591, 1.845042, 0.2196078, 0, 1, 1,
0.4812446, -1.199757, 2.40601, 0.2235294, 0, 1, 1,
0.4818872, 0.9207078, -0.4612175, 0.2313726, 0, 1, 1,
0.4821275, 1.76631, 0.1711555, 0.2352941, 0, 1, 1,
0.4908703, 0.04923315, 1.527004, 0.2431373, 0, 1, 1,
0.4938588, -0.9895663, 3.38782, 0.2470588, 0, 1, 1,
0.4971473, -0.6181457, 1.952967, 0.254902, 0, 1, 1,
0.5042185, -1.472052, 2.570441, 0.2588235, 0, 1, 1,
0.5078743, -1.587587, 3.50907, 0.2666667, 0, 1, 1,
0.5137972, 0.3859802, 2.763425, 0.2705882, 0, 1, 1,
0.5183897, -1.073228, 1.950557, 0.2784314, 0, 1, 1,
0.5196059, 1.305269, -0.9649247, 0.282353, 0, 1, 1,
0.5236228, -0.7729508, 1.959279, 0.2901961, 0, 1, 1,
0.52578, -0.1876041, 3.324596, 0.2941177, 0, 1, 1,
0.5319042, 1.357733, -0.3452017, 0.3019608, 0, 1, 1,
0.5348579, 1.859855, -1.004101, 0.3098039, 0, 1, 1,
0.5355791, 0.5933751, 1.384924, 0.3137255, 0, 1, 1,
0.5371135, 0.7113528, 0.7005684, 0.3215686, 0, 1, 1,
0.5381747, 0.08535152, 1.575399, 0.3254902, 0, 1, 1,
0.538842, -1.856568, 3.227721, 0.3333333, 0, 1, 1,
0.5495439, -0.6262075, 2.186066, 0.3372549, 0, 1, 1,
0.5517999, 0.358668, 0.9710606, 0.345098, 0, 1, 1,
0.5555604, -0.2049489, 2.464311, 0.3490196, 0, 1, 1,
0.5566066, -0.2807322, 3.999635, 0.3568628, 0, 1, 1,
0.5576937, 1.544608, -1.255386, 0.3607843, 0, 1, 1,
0.5614766, 0.6854459, 0.9153877, 0.3686275, 0, 1, 1,
0.5660385, 0.6822304, 0.5781237, 0.372549, 0, 1, 1,
0.5663965, -0.893658, 2.6316, 0.3803922, 0, 1, 1,
0.5739707, -2.014179, 3.199044, 0.3843137, 0, 1, 1,
0.5756839, 0.7466618, -0.4342822, 0.3921569, 0, 1, 1,
0.5793846, -0.3957556, 1.636336, 0.3960784, 0, 1, 1,
0.5846952, -0.451437, 0.7035637, 0.4039216, 0, 1, 1,
0.585232, -1.216883, 2.617697, 0.4117647, 0, 1, 1,
0.5877129, 0.7781889, 0.8833098, 0.4156863, 0, 1, 1,
0.5883847, 0.9046918, -0.29145, 0.4235294, 0, 1, 1,
0.5928116, 1.369437, -1.265849, 0.427451, 0, 1, 1,
0.5969351, -0.6268142, 3.259842, 0.4352941, 0, 1, 1,
0.5971478, 0.6064986, -0.6407368, 0.4392157, 0, 1, 1,
0.6003833, 0.9646692, -1.073027, 0.4470588, 0, 1, 1,
0.6006742, 1.195796, 0.3872714, 0.4509804, 0, 1, 1,
0.6065759, -1.226271, 2.281795, 0.4588235, 0, 1, 1,
0.6080429, 0.4870879, 1.005388, 0.4627451, 0, 1, 1,
0.61425, -1.161913, 3.644096, 0.4705882, 0, 1, 1,
0.6149949, 1.280142, -0.3941066, 0.4745098, 0, 1, 1,
0.6190237, -0.7427864, 0.6372206, 0.4823529, 0, 1, 1,
0.6271048, -0.8971587, 1.930053, 0.4862745, 0, 1, 1,
0.6328184, 1.57829, 1.911818, 0.4941176, 0, 1, 1,
0.6334272, 0.9551157, -0.8098189, 0.5019608, 0, 1, 1,
0.6361099, -1.12582, 3.621097, 0.5058824, 0, 1, 1,
0.6366968, -1.611218, 2.972253, 0.5137255, 0, 1, 1,
0.6376324, 1.452721, 0.720853, 0.5176471, 0, 1, 1,
0.6505205, 0.2231767, 0.5593948, 0.5254902, 0, 1, 1,
0.6546701, 0.6975432, 1.237659, 0.5294118, 0, 1, 1,
0.6590526, -0.3189913, 2.869131, 0.5372549, 0, 1, 1,
0.66452, 0.7951652, -1.252151, 0.5411765, 0, 1, 1,
0.6718267, -1.422807, 1.301087, 0.5490196, 0, 1, 1,
0.6756642, -0.9208514, 3.314616, 0.5529412, 0, 1, 1,
0.6786405, -0.8335817, 1.41903, 0.5607843, 0, 1, 1,
0.6826437, 1.669698, 1.11686, 0.5647059, 0, 1, 1,
0.6827096, -1.222173, 2.556344, 0.572549, 0, 1, 1,
0.6877372, 0.2095478, 3.328401, 0.5764706, 0, 1, 1,
0.6880906, 0.5661069, 2.202806, 0.5843138, 0, 1, 1,
0.6896447, 1.40916, 0.05561925, 0.5882353, 0, 1, 1,
0.6934624, 0.1538745, 2.379893, 0.5960785, 0, 1, 1,
0.6946672, 0.891587, 1.707714, 0.6039216, 0, 1, 1,
0.695736, 0.0879976, 0.2459764, 0.6078432, 0, 1, 1,
0.6975653, 1.194758, 2.827384, 0.6156863, 0, 1, 1,
0.7050951, 1.233017, -0.7436893, 0.6196079, 0, 1, 1,
0.7097843, -0.5206526, 4.826929, 0.627451, 0, 1, 1,
0.7140179, -0.5515205, 2.884862, 0.6313726, 0, 1, 1,
0.7171254, -0.2875364, 2.567453, 0.6392157, 0, 1, 1,
0.7171906, -1.148627, 4.65599, 0.6431373, 0, 1, 1,
0.7215505, -0.05902273, 2.049284, 0.6509804, 0, 1, 1,
0.7282999, -0.03469331, 2.610598, 0.654902, 0, 1, 1,
0.7300638, -1.66377, 3.844173, 0.6627451, 0, 1, 1,
0.7329832, -2.073704, 2.048367, 0.6666667, 0, 1, 1,
0.7331213, -1.503918, 2.264387, 0.6745098, 0, 1, 1,
0.7411584, -0.2690679, 1.154625, 0.6784314, 0, 1, 1,
0.7441274, 0.7136746, 2.040536, 0.6862745, 0, 1, 1,
0.7449051, 0.3219101, 2.574427, 0.6901961, 0, 1, 1,
0.7451338, -0.1761631, 1.175939, 0.6980392, 0, 1, 1,
0.7487044, -0.1335628, 2.94547, 0.7058824, 0, 1, 1,
0.7534482, -0.5794397, 2.913104, 0.7098039, 0, 1, 1,
0.7543358, -0.2245599, 1.997015, 0.7176471, 0, 1, 1,
0.7586842, 1.241905, 2.498578, 0.7215686, 0, 1, 1,
0.7600615, -0.5094152, 2.558954, 0.7294118, 0, 1, 1,
0.7621215, -0.5411943, 2.137131, 0.7333333, 0, 1, 1,
0.7695139, 0.6129625, 2.097453, 0.7411765, 0, 1, 1,
0.7709411, -0.2800651, 1.298525, 0.7450981, 0, 1, 1,
0.7765678, 0.7791028, 0.7354924, 0.7529412, 0, 1, 1,
0.7834033, -0.1237429, 1.73649, 0.7568628, 0, 1, 1,
0.7839775, -0.385701, -0.02590578, 0.7647059, 0, 1, 1,
0.7852659, 0.9773405, 0.4141412, 0.7686275, 0, 1, 1,
0.7926502, 0.503184, 0.1496413, 0.7764706, 0, 1, 1,
0.7963871, -1.161981, 2.286039, 0.7803922, 0, 1, 1,
0.8035355, 0.4486206, -0.05739455, 0.7882353, 0, 1, 1,
0.815837, 0.4376098, -0.06603295, 0.7921569, 0, 1, 1,
0.8160902, 1.47133, 1.300287, 0.8, 0, 1, 1,
0.8283454, 0.03504554, 1.154818, 0.8078431, 0, 1, 1,
0.8389022, 0.694024, 1.110903, 0.8117647, 0, 1, 1,
0.8396776, -0.08766974, 2.541067, 0.8196079, 0, 1, 1,
0.8435006, 0.08165032, 0.3728652, 0.8235294, 0, 1, 1,
0.8442495, 2.013536, -0.07593644, 0.8313726, 0, 1, 1,
0.8444406, -0.4573303, 2.388497, 0.8352941, 0, 1, 1,
0.8524927, 1.756841, 0.07194886, 0.8431373, 0, 1, 1,
0.8578035, -1.751135, 4.274175, 0.8470588, 0, 1, 1,
0.8639814, -0.161985, 1.172364, 0.854902, 0, 1, 1,
0.8672395, 1.36849, -0.9291186, 0.8588235, 0, 1, 1,
0.873409, 1.045934, 2.461751, 0.8666667, 0, 1, 1,
0.8772959, 1.792487, 0.714178, 0.8705882, 0, 1, 1,
0.8819882, -1.793907, 3.825591, 0.8784314, 0, 1, 1,
0.8889604, 0.4063816, 1.561696, 0.8823529, 0, 1, 1,
0.8933296, -1.061679, 4.341601, 0.8901961, 0, 1, 1,
0.8974782, 3.240759, -0.5890013, 0.8941177, 0, 1, 1,
0.8975953, 1.916349, 1.918674, 0.9019608, 0, 1, 1,
0.9027738, 2.257147, 0.9294504, 0.9098039, 0, 1, 1,
0.9056778, 1.099029, 1.477262, 0.9137255, 0, 1, 1,
0.9135301, 1.755862, 1.386325, 0.9215686, 0, 1, 1,
0.9150282, 1.887794, -0.001694256, 0.9254902, 0, 1, 1,
0.9171892, -0.6415241, 3.467978, 0.9333333, 0, 1, 1,
0.9209346, -1.12415, 1.675889, 0.9372549, 0, 1, 1,
0.9211334, -1.682182, 3.599062, 0.945098, 0, 1, 1,
0.9228502, 0.5645125, 1.104642, 0.9490196, 0, 1, 1,
0.9250432, 0.4969897, 0.5160447, 0.9568627, 0, 1, 1,
0.9292381, 2.284321, -0.3404815, 0.9607843, 0, 1, 1,
0.9372694, -1.023529, 1.821724, 0.9686275, 0, 1, 1,
0.9399863, -0.8139949, 1.134988, 0.972549, 0, 1, 1,
0.9408136, 2.369892, -1.81359, 0.9803922, 0, 1, 1,
0.9417163, -0.3636963, 1.97978, 0.9843137, 0, 1, 1,
0.9440074, -0.2721301, 0.3127945, 0.9921569, 0, 1, 1,
0.9482319, -1.59958, 3.889002, 0.9960784, 0, 1, 1,
0.9632686, 0.8467569, 0.5835955, 1, 0, 0.9960784, 1,
0.9662641, 1.194877, 0.2151629, 1, 0, 0.9882353, 1,
0.9715521, 0.7876816, 0.4428818, 1, 0, 0.9843137, 1,
0.9731075, -0.4737405, 2.291422, 1, 0, 0.9764706, 1,
0.9743475, 0.06705657, 0.1259989, 1, 0, 0.972549, 1,
0.9749186, -1.937413, 2.385904, 1, 0, 0.9647059, 1,
0.9764777, -1.320148, 0.9187688, 1, 0, 0.9607843, 1,
0.9768988, -0.8370374, 2.464025, 1, 0, 0.9529412, 1,
0.9855028, -2.400385, 2.607042, 1, 0, 0.9490196, 1,
0.9874328, -0.8467219, 2.681544, 1, 0, 0.9411765, 1,
0.9878937, 0.8344875, 1.646451, 1, 0, 0.9372549, 1,
0.9918417, -1.250896, 2.944106, 1, 0, 0.9294118, 1,
0.9997115, -0.3876027, 2.069279, 1, 0, 0.9254902, 1,
1.011253, 0.5458046, -0.6176165, 1, 0, 0.9176471, 1,
1.012897, -1.54708, 2.642633, 1, 0, 0.9137255, 1,
1.023743, -0.562855, 2.26105, 1, 0, 0.9058824, 1,
1.034078, 1.384155, -1.168804, 1, 0, 0.9019608, 1,
1.040953, -0.2101927, 2.846116, 1, 0, 0.8941177, 1,
1.042325, -0.09977524, 0.6208487, 1, 0, 0.8862745, 1,
1.042887, -1.214024, 1.723901, 1, 0, 0.8823529, 1,
1.049327, -1.239284, 1.611622, 1, 0, 0.8745098, 1,
1.049973, -0.1628729, -0.1106269, 1, 0, 0.8705882, 1,
1.053579, 1.051148, 1.084324, 1, 0, 0.8627451, 1,
1.057123, -1.145033, 1.818505, 1, 0, 0.8588235, 1,
1.059577, -0.7378157, 1.99552, 1, 0, 0.8509804, 1,
1.063456, -0.7700896, 3.231436, 1, 0, 0.8470588, 1,
1.063549, -0.3821342, 1.032535, 1, 0, 0.8392157, 1,
1.07696, 2.075397, 0.4433092, 1, 0, 0.8352941, 1,
1.078018, 0.9873214, 0.2411763, 1, 0, 0.827451, 1,
1.081721, -0.393219, 1.733057, 1, 0, 0.8235294, 1,
1.086598, -0.04541426, 2.288326, 1, 0, 0.8156863, 1,
1.086601, 0.3135343, 1.823915, 1, 0, 0.8117647, 1,
1.088853, -1.092185, 0.7623505, 1, 0, 0.8039216, 1,
1.088979, -1.296815, 1.449782, 1, 0, 0.7960784, 1,
1.090927, -1.309592, 1.55749, 1, 0, 0.7921569, 1,
1.09414, -0.3375184, 0.644435, 1, 0, 0.7843137, 1,
1.09567, 0.07130848, 1.933098, 1, 0, 0.7803922, 1,
1.095763, 1.381996, 0.5389994, 1, 0, 0.772549, 1,
1.105802, -1.299341, 2.319636, 1, 0, 0.7686275, 1,
1.10748, 0.8438699, -0.06485441, 1, 0, 0.7607843, 1,
1.112885, -0.2853874, 1.586057, 1, 0, 0.7568628, 1,
1.120536, 0.9745294, 1.431952, 1, 0, 0.7490196, 1,
1.124179, 3.229538, -0.2254886, 1, 0, 0.7450981, 1,
1.127398, -0.6985006, 2.231168, 1, 0, 0.7372549, 1,
1.145642, 0.0769567, 0.790579, 1, 0, 0.7333333, 1,
1.157851, -0.4375829, 3.547379, 1, 0, 0.7254902, 1,
1.165252, -0.6134387, 1.476837, 1, 0, 0.7215686, 1,
1.165562, -0.4014045, 3.272498, 1, 0, 0.7137255, 1,
1.165652, -1.273467, 2.414619, 1, 0, 0.7098039, 1,
1.167476, 0.7203297, 0.8638469, 1, 0, 0.7019608, 1,
1.174095, -0.1395804, 2.620309, 1, 0, 0.6941177, 1,
1.174294, 0.3771868, 1.978676, 1, 0, 0.6901961, 1,
1.180132, -0.823397, 1.314902, 1, 0, 0.682353, 1,
1.182122, 0.6035777, -0.5278945, 1, 0, 0.6784314, 1,
1.189961, 0.421501, 1.925756, 1, 0, 0.6705883, 1,
1.204453, 2.05605, 1.336517, 1, 0, 0.6666667, 1,
1.227472, 1.478729, 1.193637, 1, 0, 0.6588235, 1,
1.231288, 1.335147, -0.9990921, 1, 0, 0.654902, 1,
1.232168, 0.952574, 1.837756, 1, 0, 0.6470588, 1,
1.233572, 0.3535559, 0.5719423, 1, 0, 0.6431373, 1,
1.243546, 0.3763915, 1.643658, 1, 0, 0.6352941, 1,
1.252823, -0.2103844, 0.6951212, 1, 0, 0.6313726, 1,
1.25549, 2.815268, -0.6960141, 1, 0, 0.6235294, 1,
1.266769, -0.09727602, 0.7370109, 1, 0, 0.6196079, 1,
1.272005, -0.4396487, 3.269744, 1, 0, 0.6117647, 1,
1.272468, 1.627186, 1.721944, 1, 0, 0.6078432, 1,
1.273801, 0.826082, 0.831943, 1, 0, 0.6, 1,
1.277757, -0.1639101, 0.005455298, 1, 0, 0.5921569, 1,
1.281414, -0.2580384, 0.7250903, 1, 0, 0.5882353, 1,
1.29752, 0.6860881, 2.381956, 1, 0, 0.5803922, 1,
1.29948, 0.8695755, 2.000793, 1, 0, 0.5764706, 1,
1.302531, -0.2620579, 2.368675, 1, 0, 0.5686275, 1,
1.331599, -0.3789945, 1.740244, 1, 0, 0.5647059, 1,
1.337979, -0.03765357, 0.06508026, 1, 0, 0.5568628, 1,
1.344867, 0.7706357, 2.000556, 1, 0, 0.5529412, 1,
1.345714, -1.557576, 0.6688576, 1, 0, 0.5450981, 1,
1.369238, -0.3365676, 2.702424, 1, 0, 0.5411765, 1,
1.372022, -0.4466622, 2.144823, 1, 0, 0.5333334, 1,
1.372809, 0.4217474, 1.609365, 1, 0, 0.5294118, 1,
1.373733, 0.06006084, 0.9446628, 1, 0, 0.5215687, 1,
1.378001, 0.09171766, 1.71732, 1, 0, 0.5176471, 1,
1.379933, -0.3491102, 1.690381, 1, 0, 0.509804, 1,
1.387644, 1.20136, -0.4699061, 1, 0, 0.5058824, 1,
1.390356, -0.557606, 2.037631, 1, 0, 0.4980392, 1,
1.395419, 1.50061, 1.573998, 1, 0, 0.4901961, 1,
1.400835, -0.5187575, 2.335974, 1, 0, 0.4862745, 1,
1.401603, 0.3959086, 1.160671, 1, 0, 0.4784314, 1,
1.402345, -0.3407753, 2.404118, 1, 0, 0.4745098, 1,
1.405859, 0.1998516, -0.8163555, 1, 0, 0.4666667, 1,
1.406805, -0.7257919, 2.425774, 1, 0, 0.4627451, 1,
1.411905, -0.3625709, 1.508867, 1, 0, 0.454902, 1,
1.418644, -0.2376705, 1.870191, 1, 0, 0.4509804, 1,
1.423668, 0.4824027, 3.328824, 1, 0, 0.4431373, 1,
1.429501, 1.693152, 0.06543104, 1, 0, 0.4392157, 1,
1.429791, -0.7693284, 2.048612, 1, 0, 0.4313726, 1,
1.439114, -1.615694, 1.90721, 1, 0, 0.427451, 1,
1.459345, -0.01109142, 1.125329, 1, 0, 0.4196078, 1,
1.463158, -0.8561738, 2.465342, 1, 0, 0.4156863, 1,
1.479694, 0.7510232, 3.241113, 1, 0, 0.4078431, 1,
1.523296, 0.7827249, 3.538188, 1, 0, 0.4039216, 1,
1.525589, 0.2036543, 1.658108, 1, 0, 0.3960784, 1,
1.542897, -1.811848, 3.13967, 1, 0, 0.3882353, 1,
1.550878, 0.3371153, 1.836559, 1, 0, 0.3843137, 1,
1.553629, -0.06029878, 1.590267, 1, 0, 0.3764706, 1,
1.556164, 0.2138955, 0.7907901, 1, 0, 0.372549, 1,
1.560442, -1.467905, 2.015398, 1, 0, 0.3647059, 1,
1.57295, -0.3741373, 3.57623, 1, 0, 0.3607843, 1,
1.574767, 0.986637, -0.7095058, 1, 0, 0.3529412, 1,
1.599758, -0.46796, 1.508388, 1, 0, 0.3490196, 1,
1.616584, 2.32474, -0.5141489, 1, 0, 0.3411765, 1,
1.621078, -0.2244135, 1.549546, 1, 0, 0.3372549, 1,
1.621812, -0.06044339, 1.805454, 1, 0, 0.3294118, 1,
1.62376, -0.343907, 1.048826, 1, 0, 0.3254902, 1,
1.623831, 0.4564969, 1.253061, 1, 0, 0.3176471, 1,
1.624096, -0.646974, 1.877201, 1, 0, 0.3137255, 1,
1.642077, -0.8805277, 1.841873, 1, 0, 0.3058824, 1,
1.646845, -2.249675, 1.481627, 1, 0, 0.2980392, 1,
1.667353, -1.009657, 2.412287, 1, 0, 0.2941177, 1,
1.677299, -1.007904, 1.59165, 1, 0, 0.2862745, 1,
1.702865, 0.1453552, 1.067452, 1, 0, 0.282353, 1,
1.722396, -0.6113934, 2.264754, 1, 0, 0.2745098, 1,
1.727915, -0.284121, 1.499948, 1, 0, 0.2705882, 1,
1.729134, -2.641346, 1.406633, 1, 0, 0.2627451, 1,
1.729807, 0.6114303, 0.3241906, 1, 0, 0.2588235, 1,
1.730989, -0.4720927, 2.977182, 1, 0, 0.2509804, 1,
1.737057, 0.8212537, 1.35251, 1, 0, 0.2470588, 1,
1.738972, 0.7510249, 0.9262208, 1, 0, 0.2392157, 1,
1.753963, 0.1054946, 1.611049, 1, 0, 0.2352941, 1,
1.784873, -0.7468372, 1.340313, 1, 0, 0.227451, 1,
1.81953, -0.03929362, -0.6359869, 1, 0, 0.2235294, 1,
1.823322, 2.044951, -0.26841, 1, 0, 0.2156863, 1,
1.825424, 1.938619, 1.255399, 1, 0, 0.2117647, 1,
1.844111, -0.1618793, 3.006938, 1, 0, 0.2039216, 1,
1.850757, -0.6920575, 2.849003, 1, 0, 0.1960784, 1,
1.860561, 1.296148, 2.298624, 1, 0, 0.1921569, 1,
1.868221, -0.3725247, 0.8168465, 1, 0, 0.1843137, 1,
1.886969, -2.717582, 1.582842, 1, 0, 0.1803922, 1,
1.897515, 0.6721379, 1.746563, 1, 0, 0.172549, 1,
1.917391, 1.841274, 1.210552, 1, 0, 0.1686275, 1,
1.919579, 0.7023696, 3.058562, 1, 0, 0.1607843, 1,
1.9258, 0.6487697, 0.1927199, 1, 0, 0.1568628, 1,
1.941403, 0.4594137, 0.9743547, 1, 0, 0.1490196, 1,
1.946649, -0.7373928, 0.2667389, 1, 0, 0.145098, 1,
1.961418, 0.2390823, 2.052824, 1, 0, 0.1372549, 1,
2.003286, 0.6059437, 0.4246286, 1, 0, 0.1333333, 1,
2.00542, -0.9882815, 2.86305, 1, 0, 0.1254902, 1,
2.005844, -0.2061109, 2.625567, 1, 0, 0.1215686, 1,
2.052659, 0.2400967, 0.2310116, 1, 0, 0.1137255, 1,
2.075148, -1.242236, 1.446769, 1, 0, 0.1098039, 1,
2.07604, 1.051219, 1.374962, 1, 0, 0.1019608, 1,
2.077021, 1.125376, 1.555947, 1, 0, 0.09411765, 1,
2.093411, 0.5972735, 2.227543, 1, 0, 0.09019608, 1,
2.124442, -0.2845564, 1.095492, 1, 0, 0.08235294, 1,
2.231529, -0.1000292, 1.369714, 1, 0, 0.07843138, 1,
2.2994, -0.06043787, 1.491749, 1, 0, 0.07058824, 1,
2.329649, -0.2762909, 1.379441, 1, 0, 0.06666667, 1,
2.33028, -0.01121931, 1.714689, 1, 0, 0.05882353, 1,
2.418417, -1.71789, 0.3378303, 1, 0, 0.05490196, 1,
2.451704, -0.08146816, 1.340949, 1, 0, 0.04705882, 1,
2.471627, 0.7244894, 0.5860715, 1, 0, 0.04313726, 1,
2.474546, -0.3203807, -0.07883766, 1, 0, 0.03529412, 1,
2.498904, -1.0299, 0.6156592, 1, 0, 0.03137255, 1,
2.615613, 0.9792702, 0.3965218, 1, 0, 0.02352941, 1,
2.643914, -0.3532839, 1.700139, 1, 0, 0.01960784, 1,
2.714263, -2.510483, 3.149627, 1, 0, 0.01176471, 1,
3.878598, -0.5180245, 0.7849315, 1, 0, 0.007843138, 1
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
0.4841833, -4.184599, -7.189638, 0, -0.5, 0.5, 0.5,
0.4841833, -4.184599, -7.189638, 1, -0.5, 0.5, 0.5,
0.4841833, -4.184599, -7.189638, 1, 1.5, 0.5, 0.5,
0.4841833, -4.184599, -7.189638, 0, 1.5, 0.5, 0.5
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
-4.060938, 0.09350836, -7.189638, 0, -0.5, 0.5, 0.5,
-4.060938, 0.09350836, -7.189638, 1, -0.5, 0.5, 0.5,
-4.060938, 0.09350836, -7.189638, 1, 1.5, 0.5, 0.5,
-4.060938, 0.09350836, -7.189638, 0, 1.5, 0.5, 0.5
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
-4.060938, -4.184599, -0.3105514, 0, -0.5, 0.5, 0.5,
-4.060938, -4.184599, -0.3105514, 1, -0.5, 0.5, 0.5,
-4.060938, -4.184599, -0.3105514, 1, 1.5, 0.5, 0.5,
-4.060938, -4.184599, -0.3105514, 0, 1.5, 0.5, 0.5
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
-2, -3.197344, -5.602156,
3, -3.197344, -5.602156,
-2, -3.197344, -5.602156,
-2, -3.361887, -5.866736,
-1, -3.197344, -5.602156,
-1, -3.361887, -5.866736,
0, -3.197344, -5.602156,
0, -3.361887, -5.866736,
1, -3.197344, -5.602156,
1, -3.361887, -5.866736,
2, -3.197344, -5.602156,
2, -3.361887, -5.866736,
3, -3.197344, -5.602156,
3, -3.361887, -5.866736
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
-2, -3.690972, -6.395897, 0, -0.5, 0.5, 0.5,
-2, -3.690972, -6.395897, 1, -0.5, 0.5, 0.5,
-2, -3.690972, -6.395897, 1, 1.5, 0.5, 0.5,
-2, -3.690972, -6.395897, 0, 1.5, 0.5, 0.5,
-1, -3.690972, -6.395897, 0, -0.5, 0.5, 0.5,
-1, -3.690972, -6.395897, 1, -0.5, 0.5, 0.5,
-1, -3.690972, -6.395897, 1, 1.5, 0.5, 0.5,
-1, -3.690972, -6.395897, 0, 1.5, 0.5, 0.5,
0, -3.690972, -6.395897, 0, -0.5, 0.5, 0.5,
0, -3.690972, -6.395897, 1, -0.5, 0.5, 0.5,
0, -3.690972, -6.395897, 1, 1.5, 0.5, 0.5,
0, -3.690972, -6.395897, 0, 1.5, 0.5, 0.5,
1, -3.690972, -6.395897, 0, -0.5, 0.5, 0.5,
1, -3.690972, -6.395897, 1, -0.5, 0.5, 0.5,
1, -3.690972, -6.395897, 1, 1.5, 0.5, 0.5,
1, -3.690972, -6.395897, 0, 1.5, 0.5, 0.5,
2, -3.690972, -6.395897, 0, -0.5, 0.5, 0.5,
2, -3.690972, -6.395897, 1, -0.5, 0.5, 0.5,
2, -3.690972, -6.395897, 1, 1.5, 0.5, 0.5,
2, -3.690972, -6.395897, 0, 1.5, 0.5, 0.5,
3, -3.690972, -6.395897, 0, -0.5, 0.5, 0.5,
3, -3.690972, -6.395897, 1, -0.5, 0.5, 0.5,
3, -3.690972, -6.395897, 1, 1.5, 0.5, 0.5,
3, -3.690972, -6.395897, 0, 1.5, 0.5, 0.5
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
-3.012064, -3, -5.602156,
-3.012064, 3, -5.602156,
-3.012064, -3, -5.602156,
-3.186876, -3, -5.866736,
-3.012064, -2, -5.602156,
-3.186876, -2, -5.866736,
-3.012064, -1, -5.602156,
-3.186876, -1, -5.866736,
-3.012064, 0, -5.602156,
-3.186876, 0, -5.866736,
-3.012064, 1, -5.602156,
-3.186876, 1, -5.866736,
-3.012064, 2, -5.602156,
-3.186876, 2, -5.866736,
-3.012064, 3, -5.602156,
-3.186876, 3, -5.866736
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
-3.536501, -3, -6.395897, 0, -0.5, 0.5, 0.5,
-3.536501, -3, -6.395897, 1, -0.5, 0.5, 0.5,
-3.536501, -3, -6.395897, 1, 1.5, 0.5, 0.5,
-3.536501, -3, -6.395897, 0, 1.5, 0.5, 0.5,
-3.536501, -2, -6.395897, 0, -0.5, 0.5, 0.5,
-3.536501, -2, -6.395897, 1, -0.5, 0.5, 0.5,
-3.536501, -2, -6.395897, 1, 1.5, 0.5, 0.5,
-3.536501, -2, -6.395897, 0, 1.5, 0.5, 0.5,
-3.536501, -1, -6.395897, 0, -0.5, 0.5, 0.5,
-3.536501, -1, -6.395897, 1, -0.5, 0.5, 0.5,
-3.536501, -1, -6.395897, 1, 1.5, 0.5, 0.5,
-3.536501, -1, -6.395897, 0, 1.5, 0.5, 0.5,
-3.536501, 0, -6.395897, 0, -0.5, 0.5, 0.5,
-3.536501, 0, -6.395897, 1, -0.5, 0.5, 0.5,
-3.536501, 0, -6.395897, 1, 1.5, 0.5, 0.5,
-3.536501, 0, -6.395897, 0, 1.5, 0.5, 0.5,
-3.536501, 1, -6.395897, 0, -0.5, 0.5, 0.5,
-3.536501, 1, -6.395897, 1, -0.5, 0.5, 0.5,
-3.536501, 1, -6.395897, 1, 1.5, 0.5, 0.5,
-3.536501, 1, -6.395897, 0, 1.5, 0.5, 0.5,
-3.536501, 2, -6.395897, 0, -0.5, 0.5, 0.5,
-3.536501, 2, -6.395897, 1, -0.5, 0.5, 0.5,
-3.536501, 2, -6.395897, 1, 1.5, 0.5, 0.5,
-3.536501, 2, -6.395897, 0, 1.5, 0.5, 0.5,
-3.536501, 3, -6.395897, 0, -0.5, 0.5, 0.5,
-3.536501, 3, -6.395897, 1, -0.5, 0.5, 0.5,
-3.536501, 3, -6.395897, 1, 1.5, 0.5, 0.5,
-3.536501, 3, -6.395897, 0, 1.5, 0.5, 0.5
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
-3.012064, -3.197344, -4,
-3.012064, -3.197344, 4,
-3.012064, -3.197344, -4,
-3.186876, -3.361887, -4,
-3.012064, -3.197344, -2,
-3.186876, -3.361887, -2,
-3.012064, -3.197344, 0,
-3.186876, -3.361887, 0,
-3.012064, -3.197344, 2,
-3.186876, -3.361887, 2,
-3.012064, -3.197344, 4,
-3.186876, -3.361887, 4
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
-3.536501, -3.690972, -4, 0, -0.5, 0.5, 0.5,
-3.536501, -3.690972, -4, 1, -0.5, 0.5, 0.5,
-3.536501, -3.690972, -4, 1, 1.5, 0.5, 0.5,
-3.536501, -3.690972, -4, 0, 1.5, 0.5, 0.5,
-3.536501, -3.690972, -2, 0, -0.5, 0.5, 0.5,
-3.536501, -3.690972, -2, 1, -0.5, 0.5, 0.5,
-3.536501, -3.690972, -2, 1, 1.5, 0.5, 0.5,
-3.536501, -3.690972, -2, 0, 1.5, 0.5, 0.5,
-3.536501, -3.690972, 0, 0, -0.5, 0.5, 0.5,
-3.536501, -3.690972, 0, 1, -0.5, 0.5, 0.5,
-3.536501, -3.690972, 0, 1, 1.5, 0.5, 0.5,
-3.536501, -3.690972, 0, 0, 1.5, 0.5, 0.5,
-3.536501, -3.690972, 2, 0, -0.5, 0.5, 0.5,
-3.536501, -3.690972, 2, 1, -0.5, 0.5, 0.5,
-3.536501, -3.690972, 2, 1, 1.5, 0.5, 0.5,
-3.536501, -3.690972, 2, 0, 1.5, 0.5, 0.5,
-3.536501, -3.690972, 4, 0, -0.5, 0.5, 0.5,
-3.536501, -3.690972, 4, 1, -0.5, 0.5, 0.5,
-3.536501, -3.690972, 4, 1, 1.5, 0.5, 0.5,
-3.536501, -3.690972, 4, 0, 1.5, 0.5, 0.5
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
-3.012064, -3.197344, -5.602156,
-3.012064, 3.384361, -5.602156,
-3.012064, -3.197344, 4.981053,
-3.012064, 3.384361, 4.981053,
-3.012064, -3.197344, -5.602156,
-3.012064, -3.197344, 4.981053,
-3.012064, 3.384361, -5.602156,
-3.012064, 3.384361, 4.981053,
-3.012064, -3.197344, -5.602156,
3.98043, -3.197344, -5.602156,
-3.012064, -3.197344, 4.981053,
3.98043, -3.197344, 4.981053,
-3.012064, 3.384361, -5.602156,
3.98043, 3.384361, -5.602156,
-3.012064, 3.384361, 4.981053,
3.98043, 3.384361, 4.981053,
3.98043, -3.197344, -5.602156,
3.98043, 3.384361, -5.602156,
3.98043, -3.197344, 4.981053,
3.98043, 3.384361, 4.981053,
3.98043, -3.197344, -5.602156,
3.98043, -3.197344, 4.981053,
3.98043, 3.384361, -5.602156,
3.98043, 3.384361, 4.981053
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
var radius = 7.630845;
var distance = 33.95049;
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
mvMatrix.translate( -0.4841833, -0.09350836, 0.3105514 );
mvMatrix.scale( 1.179925, 1.253569, 0.7795951 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95049);
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
acetic_acid_ethyl_es<-read.table("acetic_acid_ethyl_es.xyz")
```

```
## Error in read.table("acetic_acid_ethyl_es.xyz"): no lines available in input
```

```r
x<-acetic_acid_ethyl_es$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
```

```r
y<-acetic_acid_ethyl_es$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
```

```r
z<-acetic_acid_ethyl_es$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
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
-2.910231, 1.80135, 0.1582777, 0, 0, 1, 1, 1,
-2.898445, -0.1452904, -0.4091094, 1, 0, 0, 1, 1,
-2.663862, -1.227553, -1.518699, 1, 0, 0, 1, 1,
-2.437896, -0.4716158, -0.1338695, 1, 0, 0, 1, 1,
-2.374178, -0.01715178, -0.6963265, 1, 0, 0, 1, 1,
-2.373241, 0.6754209, -1.896354, 1, 0, 0, 1, 1,
-2.306287, -1.369412, -2.317085, 0, 0, 0, 1, 1,
-2.289138, 0.05527228, -2.153859, 0, 0, 0, 1, 1,
-2.260191, -0.6381904, -0.8506935, 0, 0, 0, 1, 1,
-2.259962, -0.1588497, -0.9816067, 0, 0, 0, 1, 1,
-2.235572, -1.175608, -2.303348, 0, 0, 0, 1, 1,
-2.195227, 0.7430188, -1.053913, 0, 0, 0, 1, 1,
-2.187445, -0.7152995, -1.148465, 0, 0, 0, 1, 1,
-2.174146, -1.393725, -3.673893, 1, 1, 1, 1, 1,
-2.144551, 2.117188, -2.007178, 1, 1, 1, 1, 1,
-2.102136, 0.3280269, -2.654475, 1, 1, 1, 1, 1,
-2.099117, -1.499008, -2.06461, 1, 1, 1, 1, 1,
-2.090209, 1.035352, 0.01270345, 1, 1, 1, 1, 1,
-2.06617, -1.665299, -2.406076, 1, 1, 1, 1, 1,
-1.959873, 0.9258205, -1.999974, 1, 1, 1, 1, 1,
-1.93726, -0.4058201, -1.608936, 1, 1, 1, 1, 1,
-1.924335, -0.6817936, -0.3896011, 1, 1, 1, 1, 1,
-1.916387, -1.065344, -1.866099, 1, 1, 1, 1, 1,
-1.915066, -0.8951495, -2.304622, 1, 1, 1, 1, 1,
-1.861134, 0.9568625, -1.06689, 1, 1, 1, 1, 1,
-1.85899, -0.315121, -2.543998, 1, 1, 1, 1, 1,
-1.85497, 1.688099, -3.201625, 1, 1, 1, 1, 1,
-1.828043, 0.7299401, -2.159087, 1, 1, 1, 1, 1,
-1.785477, -1.352196, -2.319908, 0, 0, 1, 1, 1,
-1.78109, 0.1791359, -2.668498, 1, 0, 0, 1, 1,
-1.777409, 0.06696046, -0.8113286, 1, 0, 0, 1, 1,
-1.761835, -0.102278, 0.09550828, 1, 0, 0, 1, 1,
-1.748415, 1.402476, -0.853735, 1, 0, 0, 1, 1,
-1.743155, 1.44212, 0.7572812, 1, 0, 0, 1, 1,
-1.729517, 0.4156426, -0.834583, 0, 0, 0, 1, 1,
-1.711, -0.9089654, -0.6400952, 0, 0, 0, 1, 1,
-1.703858, -1.997867, -5.296241, 0, 0, 0, 1, 1,
-1.69818, -0.8505179, -1.837423, 0, 0, 0, 1, 1,
-1.697092, 1.521614, -0.2038625, 0, 0, 0, 1, 1,
-1.693467, 0.8812432, -1.708694, 0, 0, 0, 1, 1,
-1.693377, 0.2105753, -0.07534799, 0, 0, 0, 1, 1,
-1.691022, 0.4725426, -1.845504, 1, 1, 1, 1, 1,
-1.68997, 0.5214751, -2.94962, 1, 1, 1, 1, 1,
-1.683687, 1.023229, -2.07764, 1, 1, 1, 1, 1,
-1.665157, -1.854938, -1.519306, 1, 1, 1, 1, 1,
-1.658925, 0.2870851, -0.9915131, 1, 1, 1, 1, 1,
-1.65729, -1.082634, -2.163935, 1, 1, 1, 1, 1,
-1.653094, -1.380362, -2.7674, 1, 1, 1, 1, 1,
-1.643197, 0.03388099, -1.62316, 1, 1, 1, 1, 1,
-1.632788, 0.905037, -1.790241, 1, 1, 1, 1, 1,
-1.625101, 0.3968526, -2.099451, 1, 1, 1, 1, 1,
-1.615625, 1.51743, -0.1431743, 1, 1, 1, 1, 1,
-1.605488, 3.143931, -0.5823593, 1, 1, 1, 1, 1,
-1.596224, 1.584741, 0.03401935, 1, 1, 1, 1, 1,
-1.588593, 0.5807586, -0.7768105, 1, 1, 1, 1, 1,
-1.583084, -1.348796, -3.452713, 1, 1, 1, 1, 1,
-1.580531, -0.05827818, -1.362525, 0, 0, 1, 1, 1,
-1.57574, -0.4661146, -1.84388, 1, 0, 0, 1, 1,
-1.575321, 1.157443, -1.957595, 1, 0, 0, 1, 1,
-1.572828, 1.240638, -2.499177, 1, 0, 0, 1, 1,
-1.568825, -0.6881061, -1.692319, 1, 0, 0, 1, 1,
-1.56795, -1.098784, -2.650211, 1, 0, 0, 1, 1,
-1.559022, 0.6691843, -0.1506619, 0, 0, 0, 1, 1,
-1.556544, -0.7367512, -0.1914983, 0, 0, 0, 1, 1,
-1.549268, -0.125482, -2.177132, 0, 0, 0, 1, 1,
-1.538496, -0.6924844, -0.9987757, 0, 0, 0, 1, 1,
-1.534134, 0.891273, -1.94666, 0, 0, 0, 1, 1,
-1.527588, -1.168132, -1.800945, 0, 0, 0, 1, 1,
-1.525407, 0.3653661, -0.6708655, 0, 0, 0, 1, 1,
-1.512813, 1.438424, -3.356695, 1, 1, 1, 1, 1,
-1.509442, 1.104687, -1.210645, 1, 1, 1, 1, 1,
-1.507462, 1.259688, 0.08532489, 1, 1, 1, 1, 1,
-1.495788, -0.8902826, -1.696007, 1, 1, 1, 1, 1,
-1.492817, 0.8625092, -2.069705, 1, 1, 1, 1, 1,
-1.491092, 0.1783414, -1.780305, 1, 1, 1, 1, 1,
-1.485442, -1.276525, -2.823289, 1, 1, 1, 1, 1,
-1.481296, 1.085009, -1.645651, 1, 1, 1, 1, 1,
-1.47313, -0.3871839, -1.50899, 1, 1, 1, 1, 1,
-1.46861, -0.8185626, -3.747815, 1, 1, 1, 1, 1,
-1.456559, -1.527975, -2.452288, 1, 1, 1, 1, 1,
-1.455307, 0.5685447, -1.978455, 1, 1, 1, 1, 1,
-1.455183, -0.7586973, -2.022695, 1, 1, 1, 1, 1,
-1.449681, 1.030085, -0.559377, 1, 1, 1, 1, 1,
-1.446572, 0.3598057, -1.307131, 1, 1, 1, 1, 1,
-1.446169, 0.6266959, 0.003559043, 0, 0, 1, 1, 1,
-1.435906, -0.2975606, -2.952133, 1, 0, 0, 1, 1,
-1.414418, 0.6040581, -2.970845, 1, 0, 0, 1, 1,
-1.400469, -0.1535206, -0.8720164, 1, 0, 0, 1, 1,
-1.400338, 1.201502, -1.29976, 1, 0, 0, 1, 1,
-1.400003, -0.06603166, -0.8023084, 1, 0, 0, 1, 1,
-1.398655, -1.464689, -2.829458, 0, 0, 0, 1, 1,
-1.394434, -0.09154867, -0.4291055, 0, 0, 0, 1, 1,
-1.388491, -0.2068251, -2.916393, 0, 0, 0, 1, 1,
-1.372627, -1.20765, -3.573216, 0, 0, 0, 1, 1,
-1.372182, -0.3172619, -1.830597, 0, 0, 0, 1, 1,
-1.360593, -0.5923502, -2.40002, 0, 0, 0, 1, 1,
-1.350204, 1.011892, -0.7061858, 0, 0, 0, 1, 1,
-1.350194, 0.03355454, -1.1615, 1, 1, 1, 1, 1,
-1.324333, 2.257398, -1.986123, 1, 1, 1, 1, 1,
-1.32097, 0.8635607, -0.7744235, 1, 1, 1, 1, 1,
-1.301456, 0.01339118, -1.649751, 1, 1, 1, 1, 1,
-1.299439, 0.2597036, 0.7233531, 1, 1, 1, 1, 1,
-1.299046, -1.753392, -2.28766, 1, 1, 1, 1, 1,
-1.289237, -0.4864827, -2.432258, 1, 1, 1, 1, 1,
-1.282479, 1.40585, 0.4563595, 1, 1, 1, 1, 1,
-1.279607, 0.1863795, -1.161382, 1, 1, 1, 1, 1,
-1.274224, -0.6506907, -1.607462, 1, 1, 1, 1, 1,
-1.271833, 1.1362, -0.5568964, 1, 1, 1, 1, 1,
-1.270194, 0.2154812, -1.987374, 1, 1, 1, 1, 1,
-1.26908, 1.383356, -0.8155856, 1, 1, 1, 1, 1,
-1.260143, -0.625228, -1.35675, 1, 1, 1, 1, 1,
-1.257032, 0.3791616, -1.278545, 1, 1, 1, 1, 1,
-1.256763, 0.01405757, -2.731704, 0, 0, 1, 1, 1,
-1.251506, -0.3601764, -1.71664, 1, 0, 0, 1, 1,
-1.250819, 1.08529, -2.937838, 1, 0, 0, 1, 1,
-1.240515, 1.524454, 0.1833604, 1, 0, 0, 1, 1,
-1.239308, -1.65259, -2.621927, 1, 0, 0, 1, 1,
-1.237694, 0.1468281, -1.714382, 1, 0, 0, 1, 1,
-1.235904, 1.440798, -1.898458, 0, 0, 0, 1, 1,
-1.233168, 0.9565511, -0.6775808, 0, 0, 0, 1, 1,
-1.232446, 1.461402, -0.8989226, 0, 0, 0, 1, 1,
-1.232343, -0.4609865, -2.055627, 0, 0, 0, 1, 1,
-1.228332, 0.4021423, -3.402209, 0, 0, 0, 1, 1,
-1.227278, 2.345806, -0.1990245, 0, 0, 0, 1, 1,
-1.222195, 0.5232509, -1.75528, 0, 0, 0, 1, 1,
-1.220484, -0.2569394, -0.3020459, 1, 1, 1, 1, 1,
-1.217341, -1.276421, -1.30149, 1, 1, 1, 1, 1,
-1.214446, 1.368273, -1.648494, 1, 1, 1, 1, 1,
-1.212899, -1.870093, -2.701859, 1, 1, 1, 1, 1,
-1.20921, -3.101494, -2.604673, 1, 1, 1, 1, 1,
-1.207004, -0.7755017, -0.9315378, 1, 1, 1, 1, 1,
-1.205588, -0.09288798, -0.9682289, 1, 1, 1, 1, 1,
-1.19984, -1.317446, -4.00344, 1, 1, 1, 1, 1,
-1.19502, 0.01823469, -2.098289, 1, 1, 1, 1, 1,
-1.194464, 1.790695, -3.363692, 1, 1, 1, 1, 1,
-1.192737, 0.8736181, -1.884633, 1, 1, 1, 1, 1,
-1.175397, -0.7428798, -2.559974, 1, 1, 1, 1, 1,
-1.174916, 0.9527068, -0.9891526, 1, 1, 1, 1, 1,
-1.169043, 0.5517892, -0.3173867, 1, 1, 1, 1, 1,
-1.167409, 0.5035776, -1.232655, 1, 1, 1, 1, 1,
-1.161742, 1.405549, -0.6065359, 0, 0, 1, 1, 1,
-1.148228, 1.15015, -1.4457, 1, 0, 0, 1, 1,
-1.145103, -0.2488599, -1.070492, 1, 0, 0, 1, 1,
-1.14488, -0.162106, -2.408164, 1, 0, 0, 1, 1,
-1.142735, 0.5811349, 0.03764941, 1, 0, 0, 1, 1,
-1.134945, -0.01618706, -0.8891453, 1, 0, 0, 1, 1,
-1.131776, -0.8361268, -1.492951, 0, 0, 0, 1, 1,
-1.131557, 1.038702, -1.659151, 0, 0, 0, 1, 1,
-1.120377, 0.3351516, -1.222569, 0, 0, 0, 1, 1,
-1.117343, 0.8274799, 0.6113454, 0, 0, 0, 1, 1,
-1.109914, -1.787036, -3.771358, 0, 0, 0, 1, 1,
-1.101646, -1.706813, -2.818291, 0, 0, 0, 1, 1,
-1.095103, 0.4171655, -1.101432, 0, 0, 0, 1, 1,
-1.091037, -2.697889, -0.7368435, 1, 1, 1, 1, 1,
-1.090602, 0.2868538, -1.336525, 1, 1, 1, 1, 1,
-1.079106, 0.6614487, -0.532059, 1, 1, 1, 1, 1,
-1.075599, 0.6594728, 0.1938498, 1, 1, 1, 1, 1,
-1.068705, -0.3293772, -2.933579, 1, 1, 1, 1, 1,
-1.067947, -0.3493789, -3.930222, 1, 1, 1, 1, 1,
-1.06685, -0.5251662, -0.9897401, 1, 1, 1, 1, 1,
-1.05854, 0.5390476, -0.4586062, 1, 1, 1, 1, 1,
-1.055953, 0.5621103, -1.025792, 1, 1, 1, 1, 1,
-1.046712, 0.4526834, -2.064761, 1, 1, 1, 1, 1,
-1.045245, -0.4993868, -1.911945, 1, 1, 1, 1, 1,
-1.043477, -0.2236921, 0.1242836, 1, 1, 1, 1, 1,
-1.04083, -1.12265, -2.617105, 1, 1, 1, 1, 1,
-1.035736, 0.9108939, -0.0429919, 1, 1, 1, 1, 1,
-1.023524, 0.7597644, 0.09026376, 1, 1, 1, 1, 1,
-1.023094, -0.8800821, -3.635196, 0, 0, 1, 1, 1,
-1.021763, -1.258433, -2.784262, 1, 0, 0, 1, 1,
-1.004418, 1.508761, -0.4064689, 1, 0, 0, 1, 1,
-1.004317, -1.070817, -3.043778, 1, 0, 0, 1, 1,
-1.003237, -0.5484829, -0.9051763, 1, 0, 0, 1, 1,
-1.000805, 0.6533373, -2.057232, 1, 0, 0, 1, 1,
-0.9994686, -0.3530206, -3.051929, 0, 0, 0, 1, 1,
-0.999283, -0.6761109, -2.880627, 0, 0, 0, 1, 1,
-0.9958052, -0.4687234, -1.522109, 0, 0, 0, 1, 1,
-0.9911452, -0.6799557, -3.311184, 0, 0, 0, 1, 1,
-0.9902834, -0.2372468, -1.860647, 0, 0, 0, 1, 1,
-0.9887266, -0.956177, -1.136975, 0, 0, 0, 1, 1,
-0.9881207, 0.1858514, -0.4064125, 0, 0, 0, 1, 1,
-0.9852333, -0.08279353, -2.014467, 1, 1, 1, 1, 1,
-0.975562, 0.8795997, -1.278353, 1, 1, 1, 1, 1,
-0.9751826, 0.2438492, -3.209106, 1, 1, 1, 1, 1,
-0.9749165, -1.722237, -1.183228, 1, 1, 1, 1, 1,
-0.9743556, -0.9429932, -1.549199, 1, 1, 1, 1, 1,
-0.9733516, 0.02247399, -0.6695952, 1, 1, 1, 1, 1,
-0.969704, 1.389183, -1.208816, 1, 1, 1, 1, 1,
-0.959926, -0.3545509, -0.6039764, 1, 1, 1, 1, 1,
-0.957366, -0.6701547, -1.457532, 1, 1, 1, 1, 1,
-0.9484386, -1.383263, -2.067692, 1, 1, 1, 1, 1,
-0.9471603, 0.1039571, 0.002046118, 1, 1, 1, 1, 1,
-0.9463746, 0.7869597, -2.568517, 1, 1, 1, 1, 1,
-0.9457576, -0.8136361, -2.537737, 1, 1, 1, 1, 1,
-0.9429963, 0.383862, -2.130742, 1, 1, 1, 1, 1,
-0.932152, 0.3982677, 0.1383406, 1, 1, 1, 1, 1,
-0.9299039, 0.7981906, -0.6940421, 0, 0, 1, 1, 1,
-0.9269639, 1.090422, -0.7499498, 1, 0, 0, 1, 1,
-0.9235263, 0.2790251, -2.438374, 1, 0, 0, 1, 1,
-0.9193384, 0.1957229, -1.2504, 1, 0, 0, 1, 1,
-0.9175796, -1.259216, -2.995956, 1, 0, 0, 1, 1,
-0.9174604, 0.8899111, -0.7901363, 1, 0, 0, 1, 1,
-0.9164015, -1.258864, -1.67322, 0, 0, 0, 1, 1,
-0.9144417, -0.6189069, -1.231879, 0, 0, 0, 1, 1,
-0.9028219, 0.7032715, -2.440037, 0, 0, 0, 1, 1,
-0.9023001, 2.189888, 0.5120313, 0, 0, 0, 1, 1,
-0.90015, -0.9666369, -3.147082, 0, 0, 0, 1, 1,
-0.8973682, 0.2122484, -1.484789, 0, 0, 0, 1, 1,
-0.8973428, 1.163711, 1.424796, 0, 0, 0, 1, 1,
-0.8956372, -0.9874749, -1.243573, 1, 1, 1, 1, 1,
-0.8899573, -0.2596771, 1.050014, 1, 1, 1, 1, 1,
-0.8786237, -1.178995, -1.687893, 1, 1, 1, 1, 1,
-0.8725449, 0.1813624, -2.728383, 1, 1, 1, 1, 1,
-0.8706099, -0.03102859, -1.743682, 1, 1, 1, 1, 1,
-0.8659456, -2.750856, -2.483656, 1, 1, 1, 1, 1,
-0.8570396, 0.02420271, -1.764852, 1, 1, 1, 1, 1,
-0.8515541, -0.3600905, -3.155615, 1, 1, 1, 1, 1,
-0.8450431, 0.05479337, -0.8010883, 1, 1, 1, 1, 1,
-0.8444781, -1.795283, -1.785999, 1, 1, 1, 1, 1,
-0.8420549, 1.158644, -0.5540639, 1, 1, 1, 1, 1,
-0.8410795, -0.03007552, -2.478868, 1, 1, 1, 1, 1,
-0.838537, -0.9047179, -3.738842, 1, 1, 1, 1, 1,
-0.8296896, 0.8754739, -1.604698, 1, 1, 1, 1, 1,
-0.8293663, -0.2058872, -3.75385, 1, 1, 1, 1, 1,
-0.822902, 1.409929, -0.8027935, 0, 0, 1, 1, 1,
-0.8117701, 0.9393194, -0.3608692, 1, 0, 0, 1, 1,
-0.8039365, -1.16889, -2.747011, 1, 0, 0, 1, 1,
-0.8014066, -0.273924, -1.985001, 1, 0, 0, 1, 1,
-0.8005019, 0.4543211, -0.1142138, 1, 0, 0, 1, 1,
-0.799599, 0.08549807, -0.9426898, 1, 0, 0, 1, 1,
-0.7904333, -0.1462284, -1.049474, 0, 0, 0, 1, 1,
-0.7902812, -0.6631302, -2.207444, 0, 0, 0, 1, 1,
-0.7822676, -0.06255877, -0.8193018, 0, 0, 0, 1, 1,
-0.7763162, -0.6521564, -2.803013, 0, 0, 0, 1, 1,
-0.7692533, 0.431605, -2.227814, 0, 0, 0, 1, 1,
-0.7624527, 1.548188, -1.278035, 0, 0, 0, 1, 1,
-0.7602895, -1.327768, -1.357867, 0, 0, 0, 1, 1,
-0.7580346, -0.1818548, -3.062461, 1, 1, 1, 1, 1,
-0.7557095, -0.6029819, -2.109719, 1, 1, 1, 1, 1,
-0.7514724, 1.697876, -1.078777, 1, 1, 1, 1, 1,
-0.7488266, 0.9864767, -0.3950563, 1, 1, 1, 1, 1,
-0.7426049, -0.4229402, -1.35627, 1, 1, 1, 1, 1,
-0.740984, 0.690338, 1.389683, 1, 1, 1, 1, 1,
-0.7352763, -0.1525433, -1.277543, 1, 1, 1, 1, 1,
-0.7230414, 0.3102441, -0.5002948, 1, 1, 1, 1, 1,
-0.7190016, 1.894225, -0.8123558, 1, 1, 1, 1, 1,
-0.7187775, 0.09846587, -0.07889303, 1, 1, 1, 1, 1,
-0.7151195, 0.2663056, -0.9736251, 1, 1, 1, 1, 1,
-0.7130882, -0.5623658, -1.872101, 1, 1, 1, 1, 1,
-0.7099836, -1.25823, -1.481262, 1, 1, 1, 1, 1,
-0.7098713, -0.5349729, -3.532825, 1, 1, 1, 1, 1,
-0.7095712, -0.01673234, -4.026507, 1, 1, 1, 1, 1,
-0.7063358, 0.1948325, -2.611136, 0, 0, 1, 1, 1,
-0.7043459, 0.3033978, -2.621142, 1, 0, 0, 1, 1,
-0.7002152, 0.100534, -2.294368, 1, 0, 0, 1, 1,
-0.6984372, -0.08058016, -1.63066, 1, 0, 0, 1, 1,
-0.6929917, -0.1992461, -1.538349, 1, 0, 0, 1, 1,
-0.6928075, -0.07532052, -2.510715, 1, 0, 0, 1, 1,
-0.6923883, 0.04295102, -1.44373, 0, 0, 0, 1, 1,
-0.6881261, -0.5451012, -2.956365, 0, 0, 0, 1, 1,
-0.6875756, -1.74394, -2.512678, 0, 0, 0, 1, 1,
-0.6859145, 0.8834826, -1.73652, 0, 0, 0, 1, 1,
-0.685376, -0.4017791, -2.526494, 0, 0, 0, 1, 1,
-0.6826813, 1.014892, -0.5897313, 0, 0, 0, 1, 1,
-0.6820589, -1.005134, -2.244781, 0, 0, 0, 1, 1,
-0.6760077, -0.2141165, -1.203897, 1, 1, 1, 1, 1,
-0.6755728, 0.4102153, -2.309421, 1, 1, 1, 1, 1,
-0.6714637, -1.789815, -2.989006, 1, 1, 1, 1, 1,
-0.6667212, -1.675838, -3.503881, 1, 1, 1, 1, 1,
-0.6634821, 0.04805066, -1.884553, 1, 1, 1, 1, 1,
-0.6581698, -0.8654133, -1.946425, 1, 1, 1, 1, 1,
-0.6545852, -0.04666974, 0.05388394, 1, 1, 1, 1, 1,
-0.6504344, 1.792687, 0.4598482, 1, 1, 1, 1, 1,
-0.6498991, -0.2946822, -0.9038033, 1, 1, 1, 1, 1,
-0.6487637, 1.349771, 0.2951067, 1, 1, 1, 1, 1,
-0.6396813, -0.3946146, -3.158253, 1, 1, 1, 1, 1,
-0.639133, 0.2406301, -2.10467, 1, 1, 1, 1, 1,
-0.6301983, -0.2784796, -0.3214684, 1, 1, 1, 1, 1,
-0.6289772, -0.7693478, -3.157582, 1, 1, 1, 1, 1,
-0.6285644, 0.238803, -1.0975, 1, 1, 1, 1, 1,
-0.6214999, 0.1333067, -3.00801, 0, 0, 1, 1, 1,
-0.6197948, -1.708764, -3.733671, 1, 0, 0, 1, 1,
-0.6143093, -0.4522445, -4.008044, 1, 0, 0, 1, 1,
-0.6113454, -1.271664, -2.44782, 1, 0, 0, 1, 1,
-0.6112748, -0.01248688, -0.9010847, 1, 0, 0, 1, 1,
-0.6100041, -1.286582, -2.791584, 1, 0, 0, 1, 1,
-0.6096177, 0.1555406, -1.607596, 0, 0, 0, 1, 1,
-0.5994197, -0.6430021, -2.77059, 0, 0, 0, 1, 1,
-0.5974765, 0.4749124, -2.406824, 0, 0, 0, 1, 1,
-0.5932545, 1.303134, -0.1197182, 0, 0, 0, 1, 1,
-0.5904192, 1.143669, 0.1391223, 0, 0, 0, 1, 1,
-0.5894938, 1.13272, -1.158713, 0, 0, 0, 1, 1,
-0.5776924, -0.1623351, -1.364981, 0, 0, 0, 1, 1,
-0.5759385, -2.201155, -1.685601, 1, 1, 1, 1, 1,
-0.5744148, 0.3399379, -0.09850268, 1, 1, 1, 1, 1,
-0.5736575, -1.348995, -3.757085, 1, 1, 1, 1, 1,
-0.5710919, 1.298557, 0.8840803, 1, 1, 1, 1, 1,
-0.5681082, -1.019778, -2.603987, 1, 1, 1, 1, 1,
-0.565366, 0.982805, -2.93071, 1, 1, 1, 1, 1,
-0.5648177, 0.6934012, -0.3882042, 1, 1, 1, 1, 1,
-0.5494807, -0.6968749, -2.402501, 1, 1, 1, 1, 1,
-0.5484108, 0.86678, -1.016584, 1, 1, 1, 1, 1,
-0.5208216, 0.9556902, -1.042743, 1, 1, 1, 1, 1,
-0.5206412, 1.909712, -1.355822, 1, 1, 1, 1, 1,
-0.5197943, -0.3373758, -2.988683, 1, 1, 1, 1, 1,
-0.5190178, 0.8654471, -1.167162, 1, 1, 1, 1, 1,
-0.5183066, -0.1303603, -1.567651, 1, 1, 1, 1, 1,
-0.5182809, 1.771213, 0.4298737, 1, 1, 1, 1, 1,
-0.5155407, -0.4970937, -3.375469, 0, 0, 1, 1, 1,
-0.5151051, 0.8167707, 0.4702612, 1, 0, 0, 1, 1,
-0.5092451, 2.010053, 0.1565738, 1, 0, 0, 1, 1,
-0.5053998, 0.0130947, -2.31619, 1, 0, 0, 1, 1,
-0.5049763, -0.2457975, -2.24207, 1, 0, 0, 1, 1,
-0.5017926, -1.187878, -1.15836, 1, 0, 0, 1, 1,
-0.500554, 0.1060283, -1.336127, 0, 0, 0, 1, 1,
-0.4993159, 0.4698921, -0.2299627, 0, 0, 0, 1, 1,
-0.4983266, 0.8067263, -1.401481, 0, 0, 0, 1, 1,
-0.4981348, 0.0998452, 0.9716431, 0, 0, 0, 1, 1,
-0.4973464, -0.04701493, 0.4167581, 0, 0, 0, 1, 1,
-0.4936404, 1.574049, -0.01804713, 0, 0, 0, 1, 1,
-0.4921612, -1.06603, -4.475751, 0, 0, 0, 1, 1,
-0.4910881, -1.84352, -2.65979, 1, 1, 1, 1, 1,
-0.4900226, 0.5539651, -1.398366, 1, 1, 1, 1, 1,
-0.4881438, -0.09148679, -2.099252, 1, 1, 1, 1, 1,
-0.4862612, -0.6256627, -3.638785, 1, 1, 1, 1, 1,
-0.4850205, 0.9318395, 1.243902, 1, 1, 1, 1, 1,
-0.4826528, 2.130001, -0.1987157, 1, 1, 1, 1, 1,
-0.4822327, 2.026323, -1.458539, 1, 1, 1, 1, 1,
-0.4768215, -0.6215937, -0.9138002, 1, 1, 1, 1, 1,
-0.4755232, 0.4364728, -1.284622, 1, 1, 1, 1, 1,
-0.4747624, -1.749664, -3.605641, 1, 1, 1, 1, 1,
-0.4736581, -0.4519051, -1.199118, 1, 1, 1, 1, 1,
-0.4723605, -0.7505522, -1.382893, 1, 1, 1, 1, 1,
-0.4706333, -1.643089, -2.988969, 1, 1, 1, 1, 1,
-0.4688796, 0.184219, -3.225229, 1, 1, 1, 1, 1,
-0.4683879, 0.1584439, -0.5851805, 1, 1, 1, 1, 1,
-0.4673103, -0.1230257, -0.9737926, 0, 0, 1, 1, 1,
-0.4672021, -2.647046, -1.303237, 1, 0, 0, 1, 1,
-0.466421, 1.853227, 0.657285, 1, 0, 0, 1, 1,
-0.4662132, 0.07686039, -2.715749, 1, 0, 0, 1, 1,
-0.4644837, 1.765592, -1.991524, 1, 0, 0, 1, 1,
-0.4621236, 0.1684062, 0.2378286, 1, 0, 0, 1, 1,
-0.4568977, 0.731535, -0.7309773, 0, 0, 0, 1, 1,
-0.4542182, -1.618377, -2.868335, 0, 0, 0, 1, 1,
-0.4542044, 0.6804744, -1.533052, 0, 0, 0, 1, 1,
-0.4512795, 0.7919759, -0.6830565, 0, 0, 0, 1, 1,
-0.4509535, -1.083022, -3.7042, 0, 0, 0, 1, 1,
-0.4492839, 0.310808, -3.115652, 0, 0, 0, 1, 1,
-0.4447629, -1.07269, -2.757437, 0, 0, 0, 1, 1,
-0.4382602, 1.113753, 0.2057775, 1, 1, 1, 1, 1,
-0.4337023, 0.09533572, -0.5412179, 1, 1, 1, 1, 1,
-0.4320875, 0.5420997, -0.6782149, 1, 1, 1, 1, 1,
-0.4274165, -1.545018, -2.247798, 1, 1, 1, 1, 1,
-0.4263704, -0.8450018, -1.309344, 1, 1, 1, 1, 1,
-0.4262276, 0.3852062, -0.4387211, 1, 1, 1, 1, 1,
-0.4252326, -0.8662199, 0.6590191, 1, 1, 1, 1, 1,
-0.420977, 0.08479787, -1.744085, 1, 1, 1, 1, 1,
-0.4186201, 3.288511, 0.1877302, 1, 1, 1, 1, 1,
-0.417537, -0.6042521, -1.417241, 1, 1, 1, 1, 1,
-0.4153347, -1.826848, -5.448032, 1, 1, 1, 1, 1,
-0.4126975, -0.3463392, -0.3920719, 1, 1, 1, 1, 1,
-0.4109626, -0.6731934, -1.267753, 1, 1, 1, 1, 1,
-0.4073698, -1.214077, -3.465352, 1, 1, 1, 1, 1,
-0.4066334, -0.9661397, -1.456186, 1, 1, 1, 1, 1,
-0.4050104, -0.5986534, -1.957077, 0, 0, 1, 1, 1,
-0.4030971, 0.4697469, 1.536943, 1, 0, 0, 1, 1,
-0.3993957, -1.520888, -3.843344, 1, 0, 0, 1, 1,
-0.3875203, 1.539228, -0.8287091, 1, 0, 0, 1, 1,
-0.3867351, -0.01988366, -0.7435789, 1, 0, 0, 1, 1,
-0.3854347, -1.72668, -2.809143, 1, 0, 0, 1, 1,
-0.3851234, 0.07374764, -1.494678, 0, 0, 0, 1, 1,
-0.3823152, 0.3166503, -0.7300928, 0, 0, 0, 1, 1,
-0.3809478, 0.3171517, -0.651717, 0, 0, 0, 1, 1,
-0.3791512, -0.06715522, -3.233106, 0, 0, 0, 1, 1,
-0.3786512, -0.03076684, -0.7087641, 0, 0, 0, 1, 1,
-0.378268, -0.7562541, -2.58523, 0, 0, 0, 1, 1,
-0.3752918, 0.549356, -0.03564228, 0, 0, 0, 1, 1,
-0.362479, -0.4237239, -1.973706, 1, 1, 1, 1, 1,
-0.3597119, 0.07836223, -1.140884, 1, 1, 1, 1, 1,
-0.35883, -0.9254068, -3.241052, 1, 1, 1, 1, 1,
-0.3570133, 0.363927, -1.872664, 1, 1, 1, 1, 1,
-0.3556101, -0.9557899, -3.519404, 1, 1, 1, 1, 1,
-0.3497888, -0.1055723, -2.344459, 1, 1, 1, 1, 1,
-0.3493901, 0.8107572, 2.761007, 1, 1, 1, 1, 1,
-0.3492419, -1.448745, -2.456776, 1, 1, 1, 1, 1,
-0.3475923, 0.4277653, -2.81874, 1, 1, 1, 1, 1,
-0.3472327, -1.357059, -2.866549, 1, 1, 1, 1, 1,
-0.3460687, -0.4579915, -2.339972, 1, 1, 1, 1, 1,
-0.3437482, -0.8997569, -2.481362, 1, 1, 1, 1, 1,
-0.3385295, -0.3501767, -2.379415, 1, 1, 1, 1, 1,
-0.3353515, -0.9494836, -3.723999, 1, 1, 1, 1, 1,
-0.3351604, -0.2031463, -1.85828, 1, 1, 1, 1, 1,
-0.3350138, -0.9915342, -3.950852, 0, 0, 1, 1, 1,
-0.3324898, -0.0697775, -1.592256, 1, 0, 0, 1, 1,
-0.3315674, 3.141232, -0.602156, 1, 0, 0, 1, 1,
-0.3279547, -0.4148785, -3.166813, 1, 0, 0, 1, 1,
-0.3249579, -0.4791006, -0.1309272, 1, 0, 0, 1, 1,
-0.3223792, 0.6299941, 1.099966, 1, 0, 0, 1, 1,
-0.3144291, 0.1504777, -1.243657, 0, 0, 0, 1, 1,
-0.3127074, -0.5114104, -3.46903, 0, 0, 0, 1, 1,
-0.3082919, 0.07911006, -0.1207422, 0, 0, 0, 1, 1,
-0.30506, 0.7112029, 0.4345466, 0, 0, 0, 1, 1,
-0.3050252, 0.6529591, 0.176252, 0, 0, 0, 1, 1,
-0.2958947, -0.7853163, -4.620349, 0, 0, 0, 1, 1,
-0.2946161, -0.2778946, -1.342027, 0, 0, 0, 1, 1,
-0.2910013, 0.7966713, -0.8601343, 1, 1, 1, 1, 1,
-0.2890224, 1.078771, 0.5990413, 1, 1, 1, 1, 1,
-0.2860278, -1.449692, -1.461269, 1, 1, 1, 1, 1,
-0.2780956, -1.267058, -2.835985, 1, 1, 1, 1, 1,
-0.277381, -0.3157784, -4.083575, 1, 1, 1, 1, 1,
-0.2763273, -1.695671, -4.002645, 1, 1, 1, 1, 1,
-0.2757756, -1.890405, -3.535414, 1, 1, 1, 1, 1,
-0.2750504, 1.996339, -1.606554, 1, 1, 1, 1, 1,
-0.2720994, -1.033592, -2.390939, 1, 1, 1, 1, 1,
-0.2706017, 0.2422933, 0.4836129, 1, 1, 1, 1, 1,
-0.2696131, -0.9575642, -1.662568, 1, 1, 1, 1, 1,
-0.2623934, -0.189741, -3.744625, 1, 1, 1, 1, 1,
-0.2591927, -1.476979, -4.950467, 1, 1, 1, 1, 1,
-0.2548151, -0.5283828, -0.3280356, 1, 1, 1, 1, 1,
-0.2542965, 0.7677515, -2.293631, 1, 1, 1, 1, 1,
-0.2457108, -1.688166, -3.0555, 0, 0, 1, 1, 1,
-0.2337023, -0.4021316, -3.66462, 1, 0, 0, 1, 1,
-0.2329119, 0.04118585, -2.060518, 1, 0, 0, 1, 1,
-0.2309158, 0.4870654, -1.15753, 1, 0, 0, 1, 1,
-0.2301618, -1.658357, -4.609827, 1, 0, 0, 1, 1,
-0.2298407, 2.75405, -0.3120311, 1, 0, 0, 1, 1,
-0.2293567, -2.352051, -3.875815, 0, 0, 0, 1, 1,
-0.2283345, 0.6223726, -0.3172567, 0, 0, 0, 1, 1,
-0.225404, -0.09572339, -1.858508, 0, 0, 0, 1, 1,
-0.2253436, -0.06576385, -0.6724889, 0, 0, 0, 1, 1,
-0.2197281, 2.222612, 0.8707124, 0, 0, 0, 1, 1,
-0.2191104, 1.208846, -1.085689, 0, 0, 0, 1, 1,
-0.2177214, 0.6106816, 0.7365499, 0, 0, 0, 1, 1,
-0.2130907, -1.936084, -0.6929294, 1, 1, 1, 1, 1,
-0.2116049, 2.252554, 0.266059, 1, 1, 1, 1, 1,
-0.211004, -0.3632459, -2.506113, 1, 1, 1, 1, 1,
-0.210356, 0.5884389, 0.857151, 1, 1, 1, 1, 1,
-0.2076537, 0.8340948, 0.06176843, 1, 1, 1, 1, 1,
-0.2051768, -0.03019393, -1.941446, 1, 1, 1, 1, 1,
-0.2044814, 1.233095, -0.4131254, 1, 1, 1, 1, 1,
-0.2024014, -0.1993821, -4.092311, 1, 1, 1, 1, 1,
-0.2018314, 1.746175, -0.8611425, 1, 1, 1, 1, 1,
-0.2006687, 0.2357756, 1.030331, 1, 1, 1, 1, 1,
-0.1993762, -0.1784584, -1.848764, 1, 1, 1, 1, 1,
-0.1984366, -0.9883924, -2.292063, 1, 1, 1, 1, 1,
-0.1963975, 0.2729374, 0.258287, 1, 1, 1, 1, 1,
-0.1943842, 1.311035, -0.3561595, 1, 1, 1, 1, 1,
-0.1911855, 0.2813646, -0.6043905, 1, 1, 1, 1, 1,
-0.1885235, 1.039881, 0.5558219, 0, 0, 1, 1, 1,
-0.187482, -0.4270309, -0.3857558, 1, 0, 0, 1, 1,
-0.1853837, 0.2075919, -0.4909308, 1, 0, 0, 1, 1,
-0.1781293, -1.53604, 0.2123678, 1, 0, 0, 1, 1,
-0.1767969, 0.09978183, 0.1035863, 1, 0, 0, 1, 1,
-0.1754253, 0.1187771, -0.5091264, 1, 0, 0, 1, 1,
-0.1689879, -1.870143, -3.73307, 0, 0, 0, 1, 1,
-0.165579, -0.02850526, -2.128005, 0, 0, 0, 1, 1,
-0.1638893, -0.3230184, -3.709031, 0, 0, 0, 1, 1,
-0.1596876, -1.481105, -5.23552, 0, 0, 0, 1, 1,
-0.1553294, 0.4473811, 0.9624465, 0, 0, 0, 1, 1,
-0.150674, 1.492322, -0.9475787, 0, 0, 0, 1, 1,
-0.1487653, 1.014626, -0.6336879, 0, 0, 0, 1, 1,
-0.1451113, 1.095219, -0.7856442, 1, 1, 1, 1, 1,
-0.1375913, 0.7527895, 0.9234666, 1, 1, 1, 1, 1,
-0.1354655, 0.1206251, -0.09685371, 1, 1, 1, 1, 1,
-0.1329251, -0.8708203, -3.591856, 1, 1, 1, 1, 1,
-0.1315213, -0.720897, -3.734401, 1, 1, 1, 1, 1,
-0.1307893, -2.157231, -2.420044, 1, 1, 1, 1, 1,
-0.1160302, -0.466976, -4.358982, 1, 1, 1, 1, 1,
-0.112832, 0.0863252, 0.5522005, 1, 1, 1, 1, 1,
-0.1126558, -0.926132, -3.468465, 1, 1, 1, 1, 1,
-0.1112734, 1.198986, -0.196299, 1, 1, 1, 1, 1,
-0.1110748, -0.4469476, -3.537512, 1, 1, 1, 1, 1,
-0.1091697, -0.7073475, -3.462143, 1, 1, 1, 1, 1,
-0.1065856, 1.347059, -0.4567822, 1, 1, 1, 1, 1,
-0.1021607, 0.4887479, 0.02478367, 1, 1, 1, 1, 1,
-0.09657154, 0.626238, -0.6459832, 1, 1, 1, 1, 1,
-0.09536603, -0.004232981, 0.5060695, 0, 0, 1, 1, 1,
-0.08883373, 0.9775079, -0.1946186, 1, 0, 0, 1, 1,
-0.08673758, -1.310542, -4.272108, 1, 0, 0, 1, 1,
-0.08650313, -1.824409, -2.425927, 1, 0, 0, 1, 1,
-0.08643993, 0.6564305, 0.5263347, 1, 0, 0, 1, 1,
-0.08626961, -0.2382238, -0.5611041, 1, 0, 0, 1, 1,
-0.08542135, 2.716016, 0.866809, 0, 0, 0, 1, 1,
-0.08468805, 1.255634, 2.690558, 0, 0, 0, 1, 1,
-0.08417524, -0.2234907, -3.403591, 0, 0, 0, 1, 1,
-0.08154955, 0.7587466, -0.8785962, 0, 0, 0, 1, 1,
-0.08099295, 1.411946, -0.3270992, 0, 0, 0, 1, 1,
-0.07977329, -0.467866, -2.918872, 0, 0, 0, 1, 1,
-0.07480732, -0.09145395, -2.668745, 0, 0, 0, 1, 1,
-0.07399788, 0.9322718, 1.574072, 1, 1, 1, 1, 1,
-0.07334378, 0.5921803, -0.3622929, 1, 1, 1, 1, 1,
-0.07151655, -1.693811, -3.042611, 1, 1, 1, 1, 1,
-0.06031407, 0.2008632, 0.5721965, 1, 1, 1, 1, 1,
-0.05866788, -0.2228227, -2.884533, 1, 1, 1, 1, 1,
-0.0571822, -1.26869, -2.383652, 1, 1, 1, 1, 1,
-0.05682324, 0.1383645, 0.04958676, 1, 1, 1, 1, 1,
-0.05405539, -0.5203737, -1.605828, 1, 1, 1, 1, 1,
-0.05367863, 0.6908914, 0.5591819, 1, 1, 1, 1, 1,
-0.05132725, -1.138313, -3.690652, 1, 1, 1, 1, 1,
-0.04940233, -0.310941, -2.302369, 1, 1, 1, 1, 1,
-0.04687531, -2.139211, -2.631647, 1, 1, 1, 1, 1,
-0.04285892, -1.038123, -3.731314, 1, 1, 1, 1, 1,
-0.04129274, -0.3604338, -3.02934, 1, 1, 1, 1, 1,
-0.04119308, -0.6320982, -2.591478, 1, 1, 1, 1, 1,
-0.03923582, -0.1624069, -1.794843, 0, 0, 1, 1, 1,
-0.0379438, 0.6136324, -0.7326406, 1, 0, 0, 1, 1,
-0.03732955, -0.4570699, -4.494401, 1, 0, 0, 1, 1,
-0.03455711, -0.8309847, -3.875626, 1, 0, 0, 1, 1,
-0.02676613, -0.7324736, -1.975585, 1, 0, 0, 1, 1,
-0.02621782, -1.033439, -3.895846, 1, 0, 0, 1, 1,
-0.02495689, -0.8817222, -1.448269, 0, 0, 0, 1, 1,
-0.02138788, -1.295647, -4.341727, 0, 0, 0, 1, 1,
-0.02090625, -0.01291449, -1.142392, 0, 0, 0, 1, 1,
-0.01715032, -0.6330305, -1.592508, 0, 0, 0, 1, 1,
-0.01292183, 0.2829843, -0.5447215, 0, 0, 0, 1, 1,
-0.01199543, 0.6960862, -0.4111698, 0, 0, 0, 1, 1,
-0.01194822, -0.6050496, -2.875097, 0, 0, 0, 1, 1,
-0.009880336, -1.15858, -3.789382, 1, 1, 1, 1, 1,
-0.009084727, -1.032436, -3.086956, 1, 1, 1, 1, 1,
-0.008628245, -0.4114582, -3.572249, 1, 1, 1, 1, 1,
-0.007948615, -0.2883884, -3.434747, 1, 1, 1, 1, 1,
-0.006931208, 0.7566845, 0.4224508, 1, 1, 1, 1, 1,
-0.005035452, -0.4331197, -3.420771, 1, 1, 1, 1, 1,
-0.001450253, -0.2552884, -3.035918, 1, 1, 1, 1, 1,
0.00614805, 0.4202518, -1.709927, 1, 1, 1, 1, 1,
0.006581084, 0.8870436, -0.4853523, 1, 1, 1, 1, 1,
0.009909068, -0.04926843, 2.499693, 1, 1, 1, 1, 1,
0.01039052, 0.299286, -1.968327, 1, 1, 1, 1, 1,
0.01074315, -1.809024, 2.61852, 1, 1, 1, 1, 1,
0.01624173, 1.276212, -0.6381856, 1, 1, 1, 1, 1,
0.02081808, 0.4972557, 0.9414427, 1, 1, 1, 1, 1,
0.02085946, 0.6030429, 0.8889779, 1, 1, 1, 1, 1,
0.02247023, 0.5702892, -1.628995, 0, 0, 1, 1, 1,
0.0235135, -0.6584613, 2.38891, 1, 0, 0, 1, 1,
0.02620886, 0.7840863, 0.4993684, 1, 0, 0, 1, 1,
0.02690215, -2.075053, 2.144781, 1, 0, 0, 1, 1,
0.03103366, -1.446863, 2.857685, 1, 0, 0, 1, 1,
0.03806689, -0.007339168, 0.3175196, 1, 0, 0, 1, 1,
0.04182021, 0.4976033, 3.404757, 0, 0, 0, 1, 1,
0.0426138, 0.09755069, -0.9542091, 0, 0, 0, 1, 1,
0.04360685, 0.3794502, 1.364458, 0, 0, 0, 1, 1,
0.04699583, -0.8787652, 3.453045, 0, 0, 0, 1, 1,
0.05518942, -0.9087159, 1.488153, 0, 0, 0, 1, 1,
0.05554114, -0.7491735, 3.2623, 0, 0, 0, 1, 1,
0.05660725, 0.7122702, -0.4451412, 0, 0, 0, 1, 1,
0.05895559, 1.68348, -0.7171076, 1, 1, 1, 1, 1,
0.06153995, -0.7427697, 1.766199, 1, 1, 1, 1, 1,
0.06174842, 0.8278455, 1.489637, 1, 1, 1, 1, 1,
0.06371985, 2.558887, 1.394706, 1, 1, 1, 1, 1,
0.06692025, -0.2024155, 2.957833, 1, 1, 1, 1, 1,
0.07597525, -1.232089, 3.549391, 1, 1, 1, 1, 1,
0.07622498, 0.8767546, 1.636438, 1, 1, 1, 1, 1,
0.07626996, 0.4012979, 0.8615698, 1, 1, 1, 1, 1,
0.08041196, -0.03735496, 2.968602, 1, 1, 1, 1, 1,
0.08464897, 0.3751104, -0.681509, 1, 1, 1, 1, 1,
0.08654041, 0.2753045, -0.9241356, 1, 1, 1, 1, 1,
0.08720101, -0.2054471, 3.261953, 1, 1, 1, 1, 1,
0.08773575, 0.350508, -2.280063, 1, 1, 1, 1, 1,
0.08853643, -1.210378, 3.448756, 1, 1, 1, 1, 1,
0.09342948, 0.8017955, 0.2416408, 1, 1, 1, 1, 1,
0.09348673, -0.4458357, 2.519064, 0, 0, 1, 1, 1,
0.09559, 0.07140708, -0.4514984, 1, 0, 0, 1, 1,
0.09868771, -1.924542, 2.565474, 1, 0, 0, 1, 1,
0.101867, 0.658297, 0.7687762, 1, 0, 0, 1, 1,
0.1054932, -0.491327, 1.603207, 1, 0, 0, 1, 1,
0.1079865, -0.9787154, 2.43576, 1, 0, 0, 1, 1,
0.1171482, -1.515826, 3.300857, 0, 0, 0, 1, 1,
0.117577, 0.4215241, 0.3010151, 0, 0, 0, 1, 1,
0.1199639, -1.360082, 3.807738, 0, 0, 0, 1, 1,
0.1211937, -0.8517886, 2.898499, 0, 0, 0, 1, 1,
0.1229552, 0.9217211, 1.412665, 0, 0, 0, 1, 1,
0.1229638, -0.2566501, 4.061149, 0, 0, 0, 1, 1,
0.1246731, 0.6685237, 0.1307545, 0, 0, 0, 1, 1,
0.1253341, -1.713666, 2.907089, 1, 1, 1, 1, 1,
0.131873, -1.025461, 2.989731, 1, 1, 1, 1, 1,
0.1321901, 2.352808, 0.3870681, 1, 1, 1, 1, 1,
0.1338732, -0.4844657, 2.465615, 1, 1, 1, 1, 1,
0.135525, -0.9637913, 4.247833, 1, 1, 1, 1, 1,
0.1364854, -0.6616418, 0.5125573, 1, 1, 1, 1, 1,
0.1394514, -0.5202718, 1.795724, 1, 1, 1, 1, 1,
0.1405202, 0.809698, 0.5852786, 1, 1, 1, 1, 1,
0.1456321, -0.379423, 3.246871, 1, 1, 1, 1, 1,
0.1471332, 0.09595995, 0.5462782, 1, 1, 1, 1, 1,
0.1511619, -0.4264857, 3.141939, 1, 1, 1, 1, 1,
0.1512091, 0.5729198, -0.008922131, 1, 1, 1, 1, 1,
0.1513848, -0.8074524, 3.612494, 1, 1, 1, 1, 1,
0.15168, 0.2160676, 0.9292126, 1, 1, 1, 1, 1,
0.1546801, -0.1109387, 2.328771, 1, 1, 1, 1, 1,
0.1584758, 0.6358261, 0.1676754, 0, 0, 1, 1, 1,
0.1627105, 1.244543, -1.405291, 1, 0, 0, 1, 1,
0.1628801, -0.8845637, 4.442075, 1, 0, 0, 1, 1,
0.1657905, 1.646929, -0.8016412, 1, 0, 0, 1, 1,
0.1664772, -0.3998821, 2.574682, 1, 0, 0, 1, 1,
0.169258, -0.3194693, 1.060859, 1, 0, 0, 1, 1,
0.1761005, 1.391499, 0.6553763, 0, 0, 0, 1, 1,
0.1788467, 1.645471, -0.8015395, 0, 0, 0, 1, 1,
0.1821566, -1.175252, 0.7820604, 0, 0, 0, 1, 1,
0.1875993, -0.3103563, 3.514895, 0, 0, 0, 1, 1,
0.1884475, 0.9791749, -0.9407979, 0, 0, 0, 1, 1,
0.1963927, -0.6223634, 2.831336, 0, 0, 0, 1, 1,
0.2003119, 0.01453256, 3.411475, 0, 0, 0, 1, 1,
0.2010542, 0.1055827, -0.3408014, 1, 1, 1, 1, 1,
0.2026107, 0.6201075, -0.3845949, 1, 1, 1, 1, 1,
0.2049089, 0.5028988, 1.013757, 1, 1, 1, 1, 1,
0.2093912, -0.8865897, 2.362776, 1, 1, 1, 1, 1,
0.2097284, -1.711658, 3.51806, 1, 1, 1, 1, 1,
0.2118951, -2.605944, 1.8884, 1, 1, 1, 1, 1,
0.2145264, -0.1331472, 1.133734, 1, 1, 1, 1, 1,
0.2293954, -1.538554, 0.711517, 1, 1, 1, 1, 1,
0.2302215, 0.2639113, -0.007613483, 1, 1, 1, 1, 1,
0.2416005, -0.7498927, 2.818403, 1, 1, 1, 1, 1,
0.2423227, 1.473557, -0.26567, 1, 1, 1, 1, 1,
0.2438195, 0.2654235, -0.3260565, 1, 1, 1, 1, 1,
0.2441469, 0.05155494, 0.2330863, 1, 1, 1, 1, 1,
0.2468112, -0.9534824, 1.454494, 1, 1, 1, 1, 1,
0.2525281, 1.270883, -0.08953206, 1, 1, 1, 1, 1,
0.2557645, -1.030315, 1.456735, 0, 0, 1, 1, 1,
0.257465, -2.651099, 1.972732, 1, 0, 0, 1, 1,
0.2592794, 0.3700458, -0.7573923, 1, 0, 0, 1, 1,
0.2621652, 2.313007, -1.661423, 1, 0, 0, 1, 1,
0.2623022, 0.4787259, 0.7943239, 1, 0, 0, 1, 1,
0.2633159, 0.08639714, 1.925387, 1, 0, 0, 1, 1,
0.2687784, -0.8485911, 4.335482, 0, 0, 0, 1, 1,
0.270739, -0.5856464, 1.985984, 0, 0, 0, 1, 1,
0.2727596, -0.8820775, 2.227013, 0, 0, 0, 1, 1,
0.27616, -0.9015938, 3.413792, 0, 0, 0, 1, 1,
0.2775872, -1.156196, 2.73266, 0, 0, 0, 1, 1,
0.2805046, -1.198512, 1.320866, 0, 0, 0, 1, 1,
0.2853669, -0.03267375, 3.184649, 0, 0, 0, 1, 1,
0.2903243, 1.18927, 2.114413, 1, 1, 1, 1, 1,
0.2980698, -0.6882368, 3.476028, 1, 1, 1, 1, 1,
0.2981539, 1.299343, 1.380005, 1, 1, 1, 1, 1,
0.2985623, 1.042555, 0.1132146, 1, 1, 1, 1, 1,
0.2999485, -0.6449992, 3.958454, 1, 1, 1, 1, 1,
0.3045996, -0.3314296, 2.996662, 1, 1, 1, 1, 1,
0.3067304, -1.423159, 0.9979503, 1, 1, 1, 1, 1,
0.3085515, 1.995, 0.4928348, 1, 1, 1, 1, 1,
0.3096539, 0.5915357, 2.488408, 1, 1, 1, 1, 1,
0.3098637, -0.6848625, 3.076299, 1, 1, 1, 1, 1,
0.3100081, 0.9238262, -0.2455018, 1, 1, 1, 1, 1,
0.3120026, -0.1195771, 1.641264, 1, 1, 1, 1, 1,
0.3127759, 0.942807, 0.4917548, 1, 1, 1, 1, 1,
0.31847, 0.4308633, -0.8267936, 1, 1, 1, 1, 1,
0.3204631, 3.26478, -0.6334215, 1, 1, 1, 1, 1,
0.3228014, -1.474257, 2.250917, 0, 0, 1, 1, 1,
0.3243436, 0.4659522, 0.1492856, 1, 0, 0, 1, 1,
0.3272141, 1.739786, 1.328383, 1, 0, 0, 1, 1,
0.329337, -1.66129, 3.319824, 1, 0, 0, 1, 1,
0.330893, -1.82503, 3.99165, 1, 0, 0, 1, 1,
0.3313111, 0.3318687, 0.6286083, 1, 0, 0, 1, 1,
0.3314842, -0.7672986, 2.538615, 0, 0, 0, 1, 1,
0.3322877, -0.3870334, 2.438063, 0, 0, 0, 1, 1,
0.3328281, -0.6825278, 3.423665, 0, 0, 0, 1, 1,
0.3354058, -0.5478135, 4.131378, 0, 0, 0, 1, 1,
0.3402424, 0.2441402, -0.5712248, 0, 0, 0, 1, 1,
0.341763, -0.3044905, 1.817172, 0, 0, 0, 1, 1,
0.3465404, -0.3242889, 0.942785, 0, 0, 0, 1, 1,
0.3495447, -0.4746154, 2.03783, 1, 1, 1, 1, 1,
0.3560683, -0.6274348, 4.038721, 1, 1, 1, 1, 1,
0.3616417, -0.3292963, 1.102328, 1, 1, 1, 1, 1,
0.3660033, 1.1832, 1.043726, 1, 1, 1, 1, 1,
0.3684363, -0.2026278, 1.478701, 1, 1, 1, 1, 1,
0.376573, -0.1884484, 3.379541, 1, 1, 1, 1, 1,
0.3788768, -0.4519224, 0.1120209, 1, 1, 1, 1, 1,
0.3807848, 0.1520634, 1.188213, 1, 1, 1, 1, 1,
0.383915, 1.433629, 0.4374537, 1, 1, 1, 1, 1,
0.3879816, 1.140509, -0.3124307, 1, 1, 1, 1, 1,
0.3885903, -0.822292, 2.024164, 1, 1, 1, 1, 1,
0.3920907, 1.265607, 1.372077, 1, 1, 1, 1, 1,
0.3927773, 0.160224, 0.05880651, 1, 1, 1, 1, 1,
0.3940202, -0.4708408, 3.719076, 1, 1, 1, 1, 1,
0.3978499, 1.337553, -3.065017, 1, 1, 1, 1, 1,
0.3981451, -2.427297, 2.208635, 0, 0, 1, 1, 1,
0.3985741, -0.3906785, 2.9814, 1, 0, 0, 1, 1,
0.3990946, -1.373693, 3.333111, 1, 0, 0, 1, 1,
0.3992153, -0.8847801, 2.54019, 1, 0, 0, 1, 1,
0.3997727, 0.4865591, 0.313454, 1, 0, 0, 1, 1,
0.4000475, 1.308855, 0.1749905, 1, 0, 0, 1, 1,
0.4002649, 0.07930066, 0.7878787, 0, 0, 0, 1, 1,
0.4032557, -1.368952, 3.602538, 0, 0, 0, 1, 1,
0.4035243, 1.160611, 0.06126548, 0, 0, 0, 1, 1,
0.4083085, -1.672745, 2.779819, 0, 0, 0, 1, 1,
0.4095445, -1.082787, 2.3896, 0, 0, 0, 1, 1,
0.4099297, 1.436354, -1.299748, 0, 0, 0, 1, 1,
0.4116627, 0.7202095, 1.829257, 0, 0, 0, 1, 1,
0.4120567, 0.5025963, 0.1605983, 1, 1, 1, 1, 1,
0.4194714, 0.873925, -0.8719689, 1, 1, 1, 1, 1,
0.4228465, -0.6465976, 1.546323, 1, 1, 1, 1, 1,
0.42991, 0.4581521, -0.4072471, 1, 1, 1, 1, 1,
0.4301288, -0.8330438, 3.937816, 1, 1, 1, 1, 1,
0.4347569, 0.6721621, 1.00012, 1, 1, 1, 1, 1,
0.4379655, -0.5760341, 2.17878, 1, 1, 1, 1, 1,
0.4392548, -0.6375166, 1.673357, 1, 1, 1, 1, 1,
0.4424251, -2.088908, 3.599473, 1, 1, 1, 1, 1,
0.4433545, 0.4056371, 0.197998, 1, 1, 1, 1, 1,
0.4435632, 0.1673806, 1.070135, 1, 1, 1, 1, 1,
0.4439754, 0.4154807, -0.6495836, 1, 1, 1, 1, 1,
0.445933, 0.2982502, 2.647769, 1, 1, 1, 1, 1,
0.4491973, 1.980166, 0.6679407, 1, 1, 1, 1, 1,
0.4504906, -0.7029492, 2.971364, 1, 1, 1, 1, 1,
0.4534943, -0.09764172, 0.89991, 0, 0, 1, 1, 1,
0.4580822, 0.6000675, -1.125605, 1, 0, 0, 1, 1,
0.4686567, -1.211036, 1.743498, 1, 0, 0, 1, 1,
0.4707875, 0.319591, 1.845042, 1, 0, 0, 1, 1,
0.4812446, -1.199757, 2.40601, 1, 0, 0, 1, 1,
0.4818872, 0.9207078, -0.4612175, 1, 0, 0, 1, 1,
0.4821275, 1.76631, 0.1711555, 0, 0, 0, 1, 1,
0.4908703, 0.04923315, 1.527004, 0, 0, 0, 1, 1,
0.4938588, -0.9895663, 3.38782, 0, 0, 0, 1, 1,
0.4971473, -0.6181457, 1.952967, 0, 0, 0, 1, 1,
0.5042185, -1.472052, 2.570441, 0, 0, 0, 1, 1,
0.5078743, -1.587587, 3.50907, 0, 0, 0, 1, 1,
0.5137972, 0.3859802, 2.763425, 0, 0, 0, 1, 1,
0.5183897, -1.073228, 1.950557, 1, 1, 1, 1, 1,
0.5196059, 1.305269, -0.9649247, 1, 1, 1, 1, 1,
0.5236228, -0.7729508, 1.959279, 1, 1, 1, 1, 1,
0.52578, -0.1876041, 3.324596, 1, 1, 1, 1, 1,
0.5319042, 1.357733, -0.3452017, 1, 1, 1, 1, 1,
0.5348579, 1.859855, -1.004101, 1, 1, 1, 1, 1,
0.5355791, 0.5933751, 1.384924, 1, 1, 1, 1, 1,
0.5371135, 0.7113528, 0.7005684, 1, 1, 1, 1, 1,
0.5381747, 0.08535152, 1.575399, 1, 1, 1, 1, 1,
0.538842, -1.856568, 3.227721, 1, 1, 1, 1, 1,
0.5495439, -0.6262075, 2.186066, 1, 1, 1, 1, 1,
0.5517999, 0.358668, 0.9710606, 1, 1, 1, 1, 1,
0.5555604, -0.2049489, 2.464311, 1, 1, 1, 1, 1,
0.5566066, -0.2807322, 3.999635, 1, 1, 1, 1, 1,
0.5576937, 1.544608, -1.255386, 1, 1, 1, 1, 1,
0.5614766, 0.6854459, 0.9153877, 0, 0, 1, 1, 1,
0.5660385, 0.6822304, 0.5781237, 1, 0, 0, 1, 1,
0.5663965, -0.893658, 2.6316, 1, 0, 0, 1, 1,
0.5739707, -2.014179, 3.199044, 1, 0, 0, 1, 1,
0.5756839, 0.7466618, -0.4342822, 1, 0, 0, 1, 1,
0.5793846, -0.3957556, 1.636336, 1, 0, 0, 1, 1,
0.5846952, -0.451437, 0.7035637, 0, 0, 0, 1, 1,
0.585232, -1.216883, 2.617697, 0, 0, 0, 1, 1,
0.5877129, 0.7781889, 0.8833098, 0, 0, 0, 1, 1,
0.5883847, 0.9046918, -0.29145, 0, 0, 0, 1, 1,
0.5928116, 1.369437, -1.265849, 0, 0, 0, 1, 1,
0.5969351, -0.6268142, 3.259842, 0, 0, 0, 1, 1,
0.5971478, 0.6064986, -0.6407368, 0, 0, 0, 1, 1,
0.6003833, 0.9646692, -1.073027, 1, 1, 1, 1, 1,
0.6006742, 1.195796, 0.3872714, 1, 1, 1, 1, 1,
0.6065759, -1.226271, 2.281795, 1, 1, 1, 1, 1,
0.6080429, 0.4870879, 1.005388, 1, 1, 1, 1, 1,
0.61425, -1.161913, 3.644096, 1, 1, 1, 1, 1,
0.6149949, 1.280142, -0.3941066, 1, 1, 1, 1, 1,
0.6190237, -0.7427864, 0.6372206, 1, 1, 1, 1, 1,
0.6271048, -0.8971587, 1.930053, 1, 1, 1, 1, 1,
0.6328184, 1.57829, 1.911818, 1, 1, 1, 1, 1,
0.6334272, 0.9551157, -0.8098189, 1, 1, 1, 1, 1,
0.6361099, -1.12582, 3.621097, 1, 1, 1, 1, 1,
0.6366968, -1.611218, 2.972253, 1, 1, 1, 1, 1,
0.6376324, 1.452721, 0.720853, 1, 1, 1, 1, 1,
0.6505205, 0.2231767, 0.5593948, 1, 1, 1, 1, 1,
0.6546701, 0.6975432, 1.237659, 1, 1, 1, 1, 1,
0.6590526, -0.3189913, 2.869131, 0, 0, 1, 1, 1,
0.66452, 0.7951652, -1.252151, 1, 0, 0, 1, 1,
0.6718267, -1.422807, 1.301087, 1, 0, 0, 1, 1,
0.6756642, -0.9208514, 3.314616, 1, 0, 0, 1, 1,
0.6786405, -0.8335817, 1.41903, 1, 0, 0, 1, 1,
0.6826437, 1.669698, 1.11686, 1, 0, 0, 1, 1,
0.6827096, -1.222173, 2.556344, 0, 0, 0, 1, 1,
0.6877372, 0.2095478, 3.328401, 0, 0, 0, 1, 1,
0.6880906, 0.5661069, 2.202806, 0, 0, 0, 1, 1,
0.6896447, 1.40916, 0.05561925, 0, 0, 0, 1, 1,
0.6934624, 0.1538745, 2.379893, 0, 0, 0, 1, 1,
0.6946672, 0.891587, 1.707714, 0, 0, 0, 1, 1,
0.695736, 0.0879976, 0.2459764, 0, 0, 0, 1, 1,
0.6975653, 1.194758, 2.827384, 1, 1, 1, 1, 1,
0.7050951, 1.233017, -0.7436893, 1, 1, 1, 1, 1,
0.7097843, -0.5206526, 4.826929, 1, 1, 1, 1, 1,
0.7140179, -0.5515205, 2.884862, 1, 1, 1, 1, 1,
0.7171254, -0.2875364, 2.567453, 1, 1, 1, 1, 1,
0.7171906, -1.148627, 4.65599, 1, 1, 1, 1, 1,
0.7215505, -0.05902273, 2.049284, 1, 1, 1, 1, 1,
0.7282999, -0.03469331, 2.610598, 1, 1, 1, 1, 1,
0.7300638, -1.66377, 3.844173, 1, 1, 1, 1, 1,
0.7329832, -2.073704, 2.048367, 1, 1, 1, 1, 1,
0.7331213, -1.503918, 2.264387, 1, 1, 1, 1, 1,
0.7411584, -0.2690679, 1.154625, 1, 1, 1, 1, 1,
0.7441274, 0.7136746, 2.040536, 1, 1, 1, 1, 1,
0.7449051, 0.3219101, 2.574427, 1, 1, 1, 1, 1,
0.7451338, -0.1761631, 1.175939, 1, 1, 1, 1, 1,
0.7487044, -0.1335628, 2.94547, 0, 0, 1, 1, 1,
0.7534482, -0.5794397, 2.913104, 1, 0, 0, 1, 1,
0.7543358, -0.2245599, 1.997015, 1, 0, 0, 1, 1,
0.7586842, 1.241905, 2.498578, 1, 0, 0, 1, 1,
0.7600615, -0.5094152, 2.558954, 1, 0, 0, 1, 1,
0.7621215, -0.5411943, 2.137131, 1, 0, 0, 1, 1,
0.7695139, 0.6129625, 2.097453, 0, 0, 0, 1, 1,
0.7709411, -0.2800651, 1.298525, 0, 0, 0, 1, 1,
0.7765678, 0.7791028, 0.7354924, 0, 0, 0, 1, 1,
0.7834033, -0.1237429, 1.73649, 0, 0, 0, 1, 1,
0.7839775, -0.385701, -0.02590578, 0, 0, 0, 1, 1,
0.7852659, 0.9773405, 0.4141412, 0, 0, 0, 1, 1,
0.7926502, 0.503184, 0.1496413, 0, 0, 0, 1, 1,
0.7963871, -1.161981, 2.286039, 1, 1, 1, 1, 1,
0.8035355, 0.4486206, -0.05739455, 1, 1, 1, 1, 1,
0.815837, 0.4376098, -0.06603295, 1, 1, 1, 1, 1,
0.8160902, 1.47133, 1.300287, 1, 1, 1, 1, 1,
0.8283454, 0.03504554, 1.154818, 1, 1, 1, 1, 1,
0.8389022, 0.694024, 1.110903, 1, 1, 1, 1, 1,
0.8396776, -0.08766974, 2.541067, 1, 1, 1, 1, 1,
0.8435006, 0.08165032, 0.3728652, 1, 1, 1, 1, 1,
0.8442495, 2.013536, -0.07593644, 1, 1, 1, 1, 1,
0.8444406, -0.4573303, 2.388497, 1, 1, 1, 1, 1,
0.8524927, 1.756841, 0.07194886, 1, 1, 1, 1, 1,
0.8578035, -1.751135, 4.274175, 1, 1, 1, 1, 1,
0.8639814, -0.161985, 1.172364, 1, 1, 1, 1, 1,
0.8672395, 1.36849, -0.9291186, 1, 1, 1, 1, 1,
0.873409, 1.045934, 2.461751, 1, 1, 1, 1, 1,
0.8772959, 1.792487, 0.714178, 0, 0, 1, 1, 1,
0.8819882, -1.793907, 3.825591, 1, 0, 0, 1, 1,
0.8889604, 0.4063816, 1.561696, 1, 0, 0, 1, 1,
0.8933296, -1.061679, 4.341601, 1, 0, 0, 1, 1,
0.8974782, 3.240759, -0.5890013, 1, 0, 0, 1, 1,
0.8975953, 1.916349, 1.918674, 1, 0, 0, 1, 1,
0.9027738, 2.257147, 0.9294504, 0, 0, 0, 1, 1,
0.9056778, 1.099029, 1.477262, 0, 0, 0, 1, 1,
0.9135301, 1.755862, 1.386325, 0, 0, 0, 1, 1,
0.9150282, 1.887794, -0.001694256, 0, 0, 0, 1, 1,
0.9171892, -0.6415241, 3.467978, 0, 0, 0, 1, 1,
0.9209346, -1.12415, 1.675889, 0, 0, 0, 1, 1,
0.9211334, -1.682182, 3.599062, 0, 0, 0, 1, 1,
0.9228502, 0.5645125, 1.104642, 1, 1, 1, 1, 1,
0.9250432, 0.4969897, 0.5160447, 1, 1, 1, 1, 1,
0.9292381, 2.284321, -0.3404815, 1, 1, 1, 1, 1,
0.9372694, -1.023529, 1.821724, 1, 1, 1, 1, 1,
0.9399863, -0.8139949, 1.134988, 1, 1, 1, 1, 1,
0.9408136, 2.369892, -1.81359, 1, 1, 1, 1, 1,
0.9417163, -0.3636963, 1.97978, 1, 1, 1, 1, 1,
0.9440074, -0.2721301, 0.3127945, 1, 1, 1, 1, 1,
0.9482319, -1.59958, 3.889002, 1, 1, 1, 1, 1,
0.9632686, 0.8467569, 0.5835955, 1, 1, 1, 1, 1,
0.9662641, 1.194877, 0.2151629, 1, 1, 1, 1, 1,
0.9715521, 0.7876816, 0.4428818, 1, 1, 1, 1, 1,
0.9731075, -0.4737405, 2.291422, 1, 1, 1, 1, 1,
0.9743475, 0.06705657, 0.1259989, 1, 1, 1, 1, 1,
0.9749186, -1.937413, 2.385904, 1, 1, 1, 1, 1,
0.9764777, -1.320148, 0.9187688, 0, 0, 1, 1, 1,
0.9768988, -0.8370374, 2.464025, 1, 0, 0, 1, 1,
0.9855028, -2.400385, 2.607042, 1, 0, 0, 1, 1,
0.9874328, -0.8467219, 2.681544, 1, 0, 0, 1, 1,
0.9878937, 0.8344875, 1.646451, 1, 0, 0, 1, 1,
0.9918417, -1.250896, 2.944106, 1, 0, 0, 1, 1,
0.9997115, -0.3876027, 2.069279, 0, 0, 0, 1, 1,
1.011253, 0.5458046, -0.6176165, 0, 0, 0, 1, 1,
1.012897, -1.54708, 2.642633, 0, 0, 0, 1, 1,
1.023743, -0.562855, 2.26105, 0, 0, 0, 1, 1,
1.034078, 1.384155, -1.168804, 0, 0, 0, 1, 1,
1.040953, -0.2101927, 2.846116, 0, 0, 0, 1, 1,
1.042325, -0.09977524, 0.6208487, 0, 0, 0, 1, 1,
1.042887, -1.214024, 1.723901, 1, 1, 1, 1, 1,
1.049327, -1.239284, 1.611622, 1, 1, 1, 1, 1,
1.049973, -0.1628729, -0.1106269, 1, 1, 1, 1, 1,
1.053579, 1.051148, 1.084324, 1, 1, 1, 1, 1,
1.057123, -1.145033, 1.818505, 1, 1, 1, 1, 1,
1.059577, -0.7378157, 1.99552, 1, 1, 1, 1, 1,
1.063456, -0.7700896, 3.231436, 1, 1, 1, 1, 1,
1.063549, -0.3821342, 1.032535, 1, 1, 1, 1, 1,
1.07696, 2.075397, 0.4433092, 1, 1, 1, 1, 1,
1.078018, 0.9873214, 0.2411763, 1, 1, 1, 1, 1,
1.081721, -0.393219, 1.733057, 1, 1, 1, 1, 1,
1.086598, -0.04541426, 2.288326, 1, 1, 1, 1, 1,
1.086601, 0.3135343, 1.823915, 1, 1, 1, 1, 1,
1.088853, -1.092185, 0.7623505, 1, 1, 1, 1, 1,
1.088979, -1.296815, 1.449782, 1, 1, 1, 1, 1,
1.090927, -1.309592, 1.55749, 0, 0, 1, 1, 1,
1.09414, -0.3375184, 0.644435, 1, 0, 0, 1, 1,
1.09567, 0.07130848, 1.933098, 1, 0, 0, 1, 1,
1.095763, 1.381996, 0.5389994, 1, 0, 0, 1, 1,
1.105802, -1.299341, 2.319636, 1, 0, 0, 1, 1,
1.10748, 0.8438699, -0.06485441, 1, 0, 0, 1, 1,
1.112885, -0.2853874, 1.586057, 0, 0, 0, 1, 1,
1.120536, 0.9745294, 1.431952, 0, 0, 0, 1, 1,
1.124179, 3.229538, -0.2254886, 0, 0, 0, 1, 1,
1.127398, -0.6985006, 2.231168, 0, 0, 0, 1, 1,
1.145642, 0.0769567, 0.790579, 0, 0, 0, 1, 1,
1.157851, -0.4375829, 3.547379, 0, 0, 0, 1, 1,
1.165252, -0.6134387, 1.476837, 0, 0, 0, 1, 1,
1.165562, -0.4014045, 3.272498, 1, 1, 1, 1, 1,
1.165652, -1.273467, 2.414619, 1, 1, 1, 1, 1,
1.167476, 0.7203297, 0.8638469, 1, 1, 1, 1, 1,
1.174095, -0.1395804, 2.620309, 1, 1, 1, 1, 1,
1.174294, 0.3771868, 1.978676, 1, 1, 1, 1, 1,
1.180132, -0.823397, 1.314902, 1, 1, 1, 1, 1,
1.182122, 0.6035777, -0.5278945, 1, 1, 1, 1, 1,
1.189961, 0.421501, 1.925756, 1, 1, 1, 1, 1,
1.204453, 2.05605, 1.336517, 1, 1, 1, 1, 1,
1.227472, 1.478729, 1.193637, 1, 1, 1, 1, 1,
1.231288, 1.335147, -0.9990921, 1, 1, 1, 1, 1,
1.232168, 0.952574, 1.837756, 1, 1, 1, 1, 1,
1.233572, 0.3535559, 0.5719423, 1, 1, 1, 1, 1,
1.243546, 0.3763915, 1.643658, 1, 1, 1, 1, 1,
1.252823, -0.2103844, 0.6951212, 1, 1, 1, 1, 1,
1.25549, 2.815268, -0.6960141, 0, 0, 1, 1, 1,
1.266769, -0.09727602, 0.7370109, 1, 0, 0, 1, 1,
1.272005, -0.4396487, 3.269744, 1, 0, 0, 1, 1,
1.272468, 1.627186, 1.721944, 1, 0, 0, 1, 1,
1.273801, 0.826082, 0.831943, 1, 0, 0, 1, 1,
1.277757, -0.1639101, 0.005455298, 1, 0, 0, 1, 1,
1.281414, -0.2580384, 0.7250903, 0, 0, 0, 1, 1,
1.29752, 0.6860881, 2.381956, 0, 0, 0, 1, 1,
1.29948, 0.8695755, 2.000793, 0, 0, 0, 1, 1,
1.302531, -0.2620579, 2.368675, 0, 0, 0, 1, 1,
1.331599, -0.3789945, 1.740244, 0, 0, 0, 1, 1,
1.337979, -0.03765357, 0.06508026, 0, 0, 0, 1, 1,
1.344867, 0.7706357, 2.000556, 0, 0, 0, 1, 1,
1.345714, -1.557576, 0.6688576, 1, 1, 1, 1, 1,
1.369238, -0.3365676, 2.702424, 1, 1, 1, 1, 1,
1.372022, -0.4466622, 2.144823, 1, 1, 1, 1, 1,
1.372809, 0.4217474, 1.609365, 1, 1, 1, 1, 1,
1.373733, 0.06006084, 0.9446628, 1, 1, 1, 1, 1,
1.378001, 0.09171766, 1.71732, 1, 1, 1, 1, 1,
1.379933, -0.3491102, 1.690381, 1, 1, 1, 1, 1,
1.387644, 1.20136, -0.4699061, 1, 1, 1, 1, 1,
1.390356, -0.557606, 2.037631, 1, 1, 1, 1, 1,
1.395419, 1.50061, 1.573998, 1, 1, 1, 1, 1,
1.400835, -0.5187575, 2.335974, 1, 1, 1, 1, 1,
1.401603, 0.3959086, 1.160671, 1, 1, 1, 1, 1,
1.402345, -0.3407753, 2.404118, 1, 1, 1, 1, 1,
1.405859, 0.1998516, -0.8163555, 1, 1, 1, 1, 1,
1.406805, -0.7257919, 2.425774, 1, 1, 1, 1, 1,
1.411905, -0.3625709, 1.508867, 0, 0, 1, 1, 1,
1.418644, -0.2376705, 1.870191, 1, 0, 0, 1, 1,
1.423668, 0.4824027, 3.328824, 1, 0, 0, 1, 1,
1.429501, 1.693152, 0.06543104, 1, 0, 0, 1, 1,
1.429791, -0.7693284, 2.048612, 1, 0, 0, 1, 1,
1.439114, -1.615694, 1.90721, 1, 0, 0, 1, 1,
1.459345, -0.01109142, 1.125329, 0, 0, 0, 1, 1,
1.463158, -0.8561738, 2.465342, 0, 0, 0, 1, 1,
1.479694, 0.7510232, 3.241113, 0, 0, 0, 1, 1,
1.523296, 0.7827249, 3.538188, 0, 0, 0, 1, 1,
1.525589, 0.2036543, 1.658108, 0, 0, 0, 1, 1,
1.542897, -1.811848, 3.13967, 0, 0, 0, 1, 1,
1.550878, 0.3371153, 1.836559, 0, 0, 0, 1, 1,
1.553629, -0.06029878, 1.590267, 1, 1, 1, 1, 1,
1.556164, 0.2138955, 0.7907901, 1, 1, 1, 1, 1,
1.560442, -1.467905, 2.015398, 1, 1, 1, 1, 1,
1.57295, -0.3741373, 3.57623, 1, 1, 1, 1, 1,
1.574767, 0.986637, -0.7095058, 1, 1, 1, 1, 1,
1.599758, -0.46796, 1.508388, 1, 1, 1, 1, 1,
1.616584, 2.32474, -0.5141489, 1, 1, 1, 1, 1,
1.621078, -0.2244135, 1.549546, 1, 1, 1, 1, 1,
1.621812, -0.06044339, 1.805454, 1, 1, 1, 1, 1,
1.62376, -0.343907, 1.048826, 1, 1, 1, 1, 1,
1.623831, 0.4564969, 1.253061, 1, 1, 1, 1, 1,
1.624096, -0.646974, 1.877201, 1, 1, 1, 1, 1,
1.642077, -0.8805277, 1.841873, 1, 1, 1, 1, 1,
1.646845, -2.249675, 1.481627, 1, 1, 1, 1, 1,
1.667353, -1.009657, 2.412287, 1, 1, 1, 1, 1,
1.677299, -1.007904, 1.59165, 0, 0, 1, 1, 1,
1.702865, 0.1453552, 1.067452, 1, 0, 0, 1, 1,
1.722396, -0.6113934, 2.264754, 1, 0, 0, 1, 1,
1.727915, -0.284121, 1.499948, 1, 0, 0, 1, 1,
1.729134, -2.641346, 1.406633, 1, 0, 0, 1, 1,
1.729807, 0.6114303, 0.3241906, 1, 0, 0, 1, 1,
1.730989, -0.4720927, 2.977182, 0, 0, 0, 1, 1,
1.737057, 0.8212537, 1.35251, 0, 0, 0, 1, 1,
1.738972, 0.7510249, 0.9262208, 0, 0, 0, 1, 1,
1.753963, 0.1054946, 1.611049, 0, 0, 0, 1, 1,
1.784873, -0.7468372, 1.340313, 0, 0, 0, 1, 1,
1.81953, -0.03929362, -0.6359869, 0, 0, 0, 1, 1,
1.823322, 2.044951, -0.26841, 0, 0, 0, 1, 1,
1.825424, 1.938619, 1.255399, 1, 1, 1, 1, 1,
1.844111, -0.1618793, 3.006938, 1, 1, 1, 1, 1,
1.850757, -0.6920575, 2.849003, 1, 1, 1, 1, 1,
1.860561, 1.296148, 2.298624, 1, 1, 1, 1, 1,
1.868221, -0.3725247, 0.8168465, 1, 1, 1, 1, 1,
1.886969, -2.717582, 1.582842, 1, 1, 1, 1, 1,
1.897515, 0.6721379, 1.746563, 1, 1, 1, 1, 1,
1.917391, 1.841274, 1.210552, 1, 1, 1, 1, 1,
1.919579, 0.7023696, 3.058562, 1, 1, 1, 1, 1,
1.9258, 0.6487697, 0.1927199, 1, 1, 1, 1, 1,
1.941403, 0.4594137, 0.9743547, 1, 1, 1, 1, 1,
1.946649, -0.7373928, 0.2667389, 1, 1, 1, 1, 1,
1.961418, 0.2390823, 2.052824, 1, 1, 1, 1, 1,
2.003286, 0.6059437, 0.4246286, 1, 1, 1, 1, 1,
2.00542, -0.9882815, 2.86305, 1, 1, 1, 1, 1,
2.005844, -0.2061109, 2.625567, 0, 0, 1, 1, 1,
2.052659, 0.2400967, 0.2310116, 1, 0, 0, 1, 1,
2.075148, -1.242236, 1.446769, 1, 0, 0, 1, 1,
2.07604, 1.051219, 1.374962, 1, 0, 0, 1, 1,
2.077021, 1.125376, 1.555947, 1, 0, 0, 1, 1,
2.093411, 0.5972735, 2.227543, 1, 0, 0, 1, 1,
2.124442, -0.2845564, 1.095492, 0, 0, 0, 1, 1,
2.231529, -0.1000292, 1.369714, 0, 0, 0, 1, 1,
2.2994, -0.06043787, 1.491749, 0, 0, 0, 1, 1,
2.329649, -0.2762909, 1.379441, 0, 0, 0, 1, 1,
2.33028, -0.01121931, 1.714689, 0, 0, 0, 1, 1,
2.418417, -1.71789, 0.3378303, 0, 0, 0, 1, 1,
2.451704, -0.08146816, 1.340949, 0, 0, 0, 1, 1,
2.471627, 0.7244894, 0.5860715, 1, 1, 1, 1, 1,
2.474546, -0.3203807, -0.07883766, 1, 1, 1, 1, 1,
2.498904, -1.0299, 0.6156592, 1, 1, 1, 1, 1,
2.615613, 0.9792702, 0.3965218, 1, 1, 1, 1, 1,
2.643914, -0.3532839, 1.700139, 1, 1, 1, 1, 1,
2.714263, -2.510483, 3.149627, 1, 1, 1, 1, 1,
3.878598, -0.5180245, 0.7849315, 1, 1, 1, 1, 1
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
var radius = 9.499415;
var distance = 33.36629;
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
mvMatrix.translate( -0.4841834, -0.09350824, 0.3105514 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36629);
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
