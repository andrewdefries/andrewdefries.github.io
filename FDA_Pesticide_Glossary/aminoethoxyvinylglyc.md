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
-3.61963, 0.2597624, -0.7062483, 1, 0, 0, 1,
-3.346947, 0.4387739, -1.347895, 1, 0.007843138, 0, 1,
-3.052065, -0.3109285, -2.101909, 1, 0.01176471, 0, 1,
-2.957642, -2.668768, -1.564598, 1, 0.01960784, 0, 1,
-2.648831, -1.742349, -3.19414, 1, 0.02352941, 0, 1,
-2.637781, 0.3917785, -3.117287, 1, 0.03137255, 0, 1,
-2.550587, -2.031347, -2.788341, 1, 0.03529412, 0, 1,
-2.402507, 0.4991588, -2.324569, 1, 0.04313726, 0, 1,
-2.345644, -1.456865, -1.019519, 1, 0.04705882, 0, 1,
-2.299681, -0.8384223, -2.141265, 1, 0.05490196, 0, 1,
-2.272691, 0.5981571, -1.448675, 1, 0.05882353, 0, 1,
-2.208069, 1.151374, 0.3236358, 1, 0.06666667, 0, 1,
-2.20298, 0.9527989, 0.6977849, 1, 0.07058824, 0, 1,
-2.147171, -0.07379515, -2.524502, 1, 0.07843138, 0, 1,
-2.071197, -2.063968, -1.948081, 1, 0.08235294, 0, 1,
-2.060805, 0.9469701, 0.8701479, 1, 0.09019608, 0, 1,
-2.05197, -1.233804, -2.115638, 1, 0.09411765, 0, 1,
-2.043697, -0.1062059, -2.982312, 1, 0.1019608, 0, 1,
-2.011855, 0.7004965, -1.767659, 1, 0.1098039, 0, 1,
-1.975076, 0.9642569, -1.916224, 1, 0.1137255, 0, 1,
-1.973576, -0.280556, -1.073638, 1, 0.1215686, 0, 1,
-1.968472, 0.2629526, -2.152888, 1, 0.1254902, 0, 1,
-1.965681, 0.347997, -3.57454, 1, 0.1333333, 0, 1,
-1.949132, 0.6653615, -1.427047, 1, 0.1372549, 0, 1,
-1.942795, 0.5077166, -0.3813626, 1, 0.145098, 0, 1,
-1.899851, 1.028152, -2.002407, 1, 0.1490196, 0, 1,
-1.893889, 1.221166, -0.5689259, 1, 0.1568628, 0, 1,
-1.89335, -0.1601132, -1.308008, 1, 0.1607843, 0, 1,
-1.880396, -0.1619355, -1.417657, 1, 0.1686275, 0, 1,
-1.858873, -0.6875249, -2.160154, 1, 0.172549, 0, 1,
-1.841674, 0.5991681, -2.021013, 1, 0.1803922, 0, 1,
-1.818669, -1.616099, -3.105226, 1, 0.1843137, 0, 1,
-1.816259, -0.3232277, -2.927778, 1, 0.1921569, 0, 1,
-1.790944, -0.2066222, -1.272482, 1, 0.1960784, 0, 1,
-1.790425, 1.290638, -0.7946047, 1, 0.2039216, 0, 1,
-1.785076, -0.08857118, -1.635459, 1, 0.2117647, 0, 1,
-1.737854, -1.011037, -1.258909, 1, 0.2156863, 0, 1,
-1.735752, -1.192825, -3.873879, 1, 0.2235294, 0, 1,
-1.734005, -0.8080683, -1.053285, 1, 0.227451, 0, 1,
-1.731448, -0.1063291, -2.341013, 1, 0.2352941, 0, 1,
-1.722671, -0.887493, -1.964949, 1, 0.2392157, 0, 1,
-1.717229, -0.06427287, -0.6479508, 1, 0.2470588, 0, 1,
-1.697476, -0.5236135, -2.881235, 1, 0.2509804, 0, 1,
-1.66448, 1.069869, -0.209499, 1, 0.2588235, 0, 1,
-1.658984, 0.2471579, -1.938605, 1, 0.2627451, 0, 1,
-1.649654, 0.4862835, -1.250391, 1, 0.2705882, 0, 1,
-1.641786, -0.6537485, -2.898552, 1, 0.2745098, 0, 1,
-1.634118, 1.737459, -0.9707189, 1, 0.282353, 0, 1,
-1.631879, 2.599654, 0.5536585, 1, 0.2862745, 0, 1,
-1.630504, 0.02395196, -1.648979, 1, 0.2941177, 0, 1,
-1.62797, 2.463266, -2.967727, 1, 0.3019608, 0, 1,
-1.612603, -1.433157, -3.233449, 1, 0.3058824, 0, 1,
-1.606292, 0.2565335, -0.2218764, 1, 0.3137255, 0, 1,
-1.595426, -1.879191, -0.4502695, 1, 0.3176471, 0, 1,
-1.593393, -0.5666605, 0.6141021, 1, 0.3254902, 0, 1,
-1.558058, 0.1196776, -0.8617857, 1, 0.3294118, 0, 1,
-1.557047, 0.06329942, -0.3553113, 1, 0.3372549, 0, 1,
-1.551919, 0.5086761, -2.376526, 1, 0.3411765, 0, 1,
-1.551709, 0.3459659, -0.3797685, 1, 0.3490196, 0, 1,
-1.536428, -0.7811158, -3.705604, 1, 0.3529412, 0, 1,
-1.530401, -0.2748836, -1.87429, 1, 0.3607843, 0, 1,
-1.513814, 0.6836507, 1.1257, 1, 0.3647059, 0, 1,
-1.503139, 1.530483, 0.3167691, 1, 0.372549, 0, 1,
-1.497842, -0.2409056, -3.349531, 1, 0.3764706, 0, 1,
-1.497124, -1.318542, -2.932378, 1, 0.3843137, 0, 1,
-1.488659, 1.320701, -1.655253, 1, 0.3882353, 0, 1,
-1.480637, 1.969098, -0.7572393, 1, 0.3960784, 0, 1,
-1.457691, -1.098345, -2.59127, 1, 0.4039216, 0, 1,
-1.454619, 0.8613879, -1.247087, 1, 0.4078431, 0, 1,
-1.451598, -1.364686, -2.792421, 1, 0.4156863, 0, 1,
-1.449526, -1.126742, -0.2887072, 1, 0.4196078, 0, 1,
-1.448083, 0.1702728, -0.7103679, 1, 0.427451, 0, 1,
-1.439783, 2.826388, -0.2188562, 1, 0.4313726, 0, 1,
-1.437409, 1.064015, -0.5092019, 1, 0.4392157, 0, 1,
-1.424832, 0.4734862, -2.490529, 1, 0.4431373, 0, 1,
-1.406965, 0.2040035, -1.157579, 1, 0.4509804, 0, 1,
-1.404379, 0.3801546, 1.990016, 1, 0.454902, 0, 1,
-1.392908, -0.2755902, -0.6416846, 1, 0.4627451, 0, 1,
-1.382928, 0.508338, -1.74341, 1, 0.4666667, 0, 1,
-1.380688, -1.235834, -2.41138, 1, 0.4745098, 0, 1,
-1.374631, 0.2774899, -2.749184, 1, 0.4784314, 0, 1,
-1.373527, -0.7366318, -2.186812, 1, 0.4862745, 0, 1,
-1.370802, -0.2861399, -2.460164, 1, 0.4901961, 0, 1,
-1.370483, -0.5092832, -1.062626, 1, 0.4980392, 0, 1,
-1.369993, -0.2450757, -2.489274, 1, 0.5058824, 0, 1,
-1.367852, 0.07614728, -1.749724, 1, 0.509804, 0, 1,
-1.362043, -0.0005344261, -2.329429, 1, 0.5176471, 0, 1,
-1.354601, 0.3024573, -1.105927, 1, 0.5215687, 0, 1,
-1.354195, 0.2490984, -1.709119, 1, 0.5294118, 0, 1,
-1.347753, 0.12901, -0.7719791, 1, 0.5333334, 0, 1,
-1.344572, 0.1991404, -0.7634601, 1, 0.5411765, 0, 1,
-1.337575, -0.08431081, -0.6799014, 1, 0.5450981, 0, 1,
-1.335145, 0.4993559, -2.112503, 1, 0.5529412, 0, 1,
-1.33165, 1.14469, -0.5630121, 1, 0.5568628, 0, 1,
-1.316937, 0.5919897, -1.239721, 1, 0.5647059, 0, 1,
-1.303247, 0.2480056, -1.762719, 1, 0.5686275, 0, 1,
-1.301922, 0.6090536, -1.599808, 1, 0.5764706, 0, 1,
-1.300993, -0.8332669, -2.303376, 1, 0.5803922, 0, 1,
-1.291674, 0.4733119, -1.753772, 1, 0.5882353, 0, 1,
-1.287598, 1.310146, -2.064808, 1, 0.5921569, 0, 1,
-1.284885, -0.2845073, -2.163736, 1, 0.6, 0, 1,
-1.283053, 2.436879, -0.2314061, 1, 0.6078432, 0, 1,
-1.281867, 0.008311947, -2.641473, 1, 0.6117647, 0, 1,
-1.277808, -1.475903, -2.910544, 1, 0.6196079, 0, 1,
-1.272714, -0.6018029, -2.38295, 1, 0.6235294, 0, 1,
-1.26978, 0.1081171, -2.050051, 1, 0.6313726, 0, 1,
-1.267065, -1.231445, -3.73388, 1, 0.6352941, 0, 1,
-1.256384, -1.252845, -1.345996, 1, 0.6431373, 0, 1,
-1.255038, 0.1309632, -0.8302816, 1, 0.6470588, 0, 1,
-1.244641, 0.7457065, 0.0992893, 1, 0.654902, 0, 1,
-1.242936, 0.07518472, -1.92222, 1, 0.6588235, 0, 1,
-1.236707, 0.4898033, -1.026517, 1, 0.6666667, 0, 1,
-1.228611, -0.2440806, -1.374743, 1, 0.6705883, 0, 1,
-1.224136, -0.313947, -1.460206, 1, 0.6784314, 0, 1,
-1.220553, -0.5696523, -1.58041, 1, 0.682353, 0, 1,
-1.217012, 0.7400403, -0.5307493, 1, 0.6901961, 0, 1,
-1.215299, 0.2366071, -2.3493, 1, 0.6941177, 0, 1,
-1.211289, -1.157954, -0.9597852, 1, 0.7019608, 0, 1,
-1.196609, 0.01727295, -2.066163, 1, 0.7098039, 0, 1,
-1.195359, -1.347565, -3.188032, 1, 0.7137255, 0, 1,
-1.187877, 0.6866742, -1.52387, 1, 0.7215686, 0, 1,
-1.178593, 1.412378, 1.501179, 1, 0.7254902, 0, 1,
-1.164779, -1.041371, -0.6392375, 1, 0.7333333, 0, 1,
-1.162165, 0.2537268, -1.779254, 1, 0.7372549, 0, 1,
-1.154533, -0.18921, -3.348433, 1, 0.7450981, 0, 1,
-1.154108, 1.556688, -0.4117587, 1, 0.7490196, 0, 1,
-1.153325, 0.480038, -0.3918825, 1, 0.7568628, 0, 1,
-1.153175, -0.2849738, -2.525273, 1, 0.7607843, 0, 1,
-1.147766, -0.6460539, -2.294348, 1, 0.7686275, 0, 1,
-1.140165, 0.8323513, -1.422013, 1, 0.772549, 0, 1,
-1.138643, 0.0202406, -1.701473, 1, 0.7803922, 0, 1,
-1.117117, 1.439992, -0.5136068, 1, 0.7843137, 0, 1,
-1.115338, 0.5657476, -0.4379371, 1, 0.7921569, 0, 1,
-1.103269, -1.046417, -3.461584, 1, 0.7960784, 0, 1,
-1.100951, -0.1877921, -1.823293, 1, 0.8039216, 0, 1,
-1.100363, 0.008811167, -1.449327, 1, 0.8117647, 0, 1,
-1.100255, 0.1804984, -0.3318447, 1, 0.8156863, 0, 1,
-1.097636, -1.696425, -3.523201, 1, 0.8235294, 0, 1,
-1.092985, -1.365718, -2.252136, 1, 0.827451, 0, 1,
-1.084049, -1.043801, -3.022939, 1, 0.8352941, 0, 1,
-1.07337, -1.276259, -2.426162, 1, 0.8392157, 0, 1,
-1.072736, -1.017963, -1.637083, 1, 0.8470588, 0, 1,
-1.071808, -0.206629, -2.814908, 1, 0.8509804, 0, 1,
-1.068904, 0.5814854, -1.746217, 1, 0.8588235, 0, 1,
-1.064188, -0.1787468, -2.361757, 1, 0.8627451, 0, 1,
-1.063444, 0.1760354, -3.603232, 1, 0.8705882, 0, 1,
-1.061307, -0.5449981, -3.920415, 1, 0.8745098, 0, 1,
-1.054259, -1.043397, -3.220581, 1, 0.8823529, 0, 1,
-1.047288, 1.133112, -2.054104, 1, 0.8862745, 0, 1,
-1.046742, 0.04996693, -2.995417, 1, 0.8941177, 0, 1,
-1.044687, -0.1079083, -2.381612, 1, 0.8980392, 0, 1,
-1.04099, 0.03982985, -0.9571415, 1, 0.9058824, 0, 1,
-1.033453, -1.637723, -1.756436, 1, 0.9137255, 0, 1,
-1.029905, 2.311654, 0.2943937, 1, 0.9176471, 0, 1,
-1.027354, 0.001615236, -4.588094, 1, 0.9254902, 0, 1,
-1.017811, 1.988395, -0.5383373, 1, 0.9294118, 0, 1,
-1.014755, 0.4150782, -1.028018, 1, 0.9372549, 0, 1,
-1.013381, -0.6324064, -3.386623, 1, 0.9411765, 0, 1,
-1.012969, 0.5463036, -2.155696, 1, 0.9490196, 0, 1,
-1.011152, -1.093583, -2.301088, 1, 0.9529412, 0, 1,
-1.009003, -0.889954, -1.44015, 1, 0.9607843, 0, 1,
-0.9973502, -0.9608566, -4.584552, 1, 0.9647059, 0, 1,
-0.9957721, 1.066763, -1.452557, 1, 0.972549, 0, 1,
-0.9938228, -0.5275211, -2.306359, 1, 0.9764706, 0, 1,
-0.9883869, 2.118596, -1.32564, 1, 0.9843137, 0, 1,
-0.9756953, 1.545087, 0.3756898, 1, 0.9882353, 0, 1,
-0.973087, 0.03514744, -0.6862637, 1, 0.9960784, 0, 1,
-0.971917, 1.722142, -1.258656, 0.9960784, 1, 0, 1,
-0.9541389, 0.7995043, 0.5104685, 0.9921569, 1, 0, 1,
-0.9512825, -0.3316042, -2.526264, 0.9843137, 1, 0, 1,
-0.9443477, 0.5387936, -1.654731, 0.9803922, 1, 0, 1,
-0.9371614, 1.50866, -0.7135429, 0.972549, 1, 0, 1,
-0.9366648, 1.39761, -1.006188, 0.9686275, 1, 0, 1,
-0.9335055, -1.054945, -3.178981, 0.9607843, 1, 0, 1,
-0.9261856, -1.588669, -4.000754, 0.9568627, 1, 0, 1,
-0.9247472, -0.4373823, -2.172865, 0.9490196, 1, 0, 1,
-0.919832, -0.5668756, -0.957001, 0.945098, 1, 0, 1,
-0.9181567, -2.176089, -0.4595244, 0.9372549, 1, 0, 1,
-0.9172941, -0.139534, 0.251949, 0.9333333, 1, 0, 1,
-0.9160531, 1.969047, -1.093326, 0.9254902, 1, 0, 1,
-0.912171, -0.307085, -2.043855, 0.9215686, 1, 0, 1,
-0.9117746, -0.05131864, -2.20993, 0.9137255, 1, 0, 1,
-0.9116158, -0.1680988, -0.5251358, 0.9098039, 1, 0, 1,
-0.9116036, 1.025712, -0.4250555, 0.9019608, 1, 0, 1,
-0.9113119, 1.593008, 0.02568241, 0.8941177, 1, 0, 1,
-0.9081659, 2.204705, 0.6208471, 0.8901961, 1, 0, 1,
-0.9038255, 1.661687, -0.9992993, 0.8823529, 1, 0, 1,
-0.9022985, -0.07458173, -2.863081, 0.8784314, 1, 0, 1,
-0.8997715, 1.965378, 0.6039506, 0.8705882, 1, 0, 1,
-0.8901227, 0.6723496, -0.1795208, 0.8666667, 1, 0, 1,
-0.8868043, 0.645521, -1.620794, 0.8588235, 1, 0, 1,
-0.8804675, 0.2722146, -0.2043816, 0.854902, 1, 0, 1,
-0.8778754, -0.5820804, -2.227157, 0.8470588, 1, 0, 1,
-0.8755382, -0.7915866, -2.127507, 0.8431373, 1, 0, 1,
-0.8753949, 0.09050092, 0.5699987, 0.8352941, 1, 0, 1,
-0.8570845, 0.1691781, -0.2560726, 0.8313726, 1, 0, 1,
-0.8550258, 0.9263362, -2.114956, 0.8235294, 1, 0, 1,
-0.8526583, 1.323654, -0.6132305, 0.8196079, 1, 0, 1,
-0.8524482, 0.8909614, -0.4007565, 0.8117647, 1, 0, 1,
-0.8515227, -1.922124, -1.57729, 0.8078431, 1, 0, 1,
-0.8498917, 1.334955, -0.7963101, 0.8, 1, 0, 1,
-0.8489343, -0.284959, -2.000923, 0.7921569, 1, 0, 1,
-0.8463727, -0.5443434, -2.434741, 0.7882353, 1, 0, 1,
-0.8433472, 0.2840109, -1.804465, 0.7803922, 1, 0, 1,
-0.8429983, 0.2252318, -0.3135071, 0.7764706, 1, 0, 1,
-0.838009, -0.3131533, -1.905065, 0.7686275, 1, 0, 1,
-0.8345832, -0.002915592, -0.6270593, 0.7647059, 1, 0, 1,
-0.8313298, -1.831447, -1.716221, 0.7568628, 1, 0, 1,
-0.8286153, 1.451217, -2.931303, 0.7529412, 1, 0, 1,
-0.8239328, -0.8929783, -3.155719, 0.7450981, 1, 0, 1,
-0.8187505, 0.2786256, -2.12598, 0.7411765, 1, 0, 1,
-0.8080027, -0.297505, -3.237459, 0.7333333, 1, 0, 1,
-0.8021111, 0.7284048, -2.273722, 0.7294118, 1, 0, 1,
-0.8010221, 0.305419, 0.6565355, 0.7215686, 1, 0, 1,
-0.7990137, 0.1394445, -1.960334, 0.7176471, 1, 0, 1,
-0.7983453, 0.7797056, 1.012508, 0.7098039, 1, 0, 1,
-0.7955402, -2.749901, -3.538346, 0.7058824, 1, 0, 1,
-0.7930169, -0.1981143, -2.80734, 0.6980392, 1, 0, 1,
-0.7926297, 0.5376136, -0.8150262, 0.6901961, 1, 0, 1,
-0.7889753, -0.6747336, -0.9447163, 0.6862745, 1, 0, 1,
-0.781951, -1.288422, -2.68295, 0.6784314, 1, 0, 1,
-0.7784557, -2.92251, -3.182601, 0.6745098, 1, 0, 1,
-0.7747102, -0.9452835, -1.603672, 0.6666667, 1, 0, 1,
-0.7657386, 0.1262028, -2.187146, 0.6627451, 1, 0, 1,
-0.7611219, -0.9550833, -0.8577346, 0.654902, 1, 0, 1,
-0.7587788, 0.8177984, -1.79059, 0.6509804, 1, 0, 1,
-0.7578471, -0.7404187, -1.850496, 0.6431373, 1, 0, 1,
-0.7538254, 0.5862215, 1.30261, 0.6392157, 1, 0, 1,
-0.7475021, 0.38811, -0.5027269, 0.6313726, 1, 0, 1,
-0.7459841, -0.5278919, 0.4136941, 0.627451, 1, 0, 1,
-0.7455028, -0.9588261, -2.967574, 0.6196079, 1, 0, 1,
-0.7451521, -0.4939653, -2.478008, 0.6156863, 1, 0, 1,
-0.7431896, 0.5110435, -1.493052, 0.6078432, 1, 0, 1,
-0.7428329, -0.01287898, 0.3806317, 0.6039216, 1, 0, 1,
-0.7417348, -0.6347533, -2.95834, 0.5960785, 1, 0, 1,
-0.7413721, 0.06962974, -2.200737, 0.5882353, 1, 0, 1,
-0.7404793, -0.8254707, -2.872795, 0.5843138, 1, 0, 1,
-0.7397363, -1.165983, -3.102387, 0.5764706, 1, 0, 1,
-0.7346463, 2.004038, -1.2577, 0.572549, 1, 0, 1,
-0.7332094, -0.4172237, -1.284995, 0.5647059, 1, 0, 1,
-0.7295553, -0.8391139, -3.827503, 0.5607843, 1, 0, 1,
-0.7138579, 1.503029, -0.5076864, 0.5529412, 1, 0, 1,
-0.7137322, -1.343735, -1.195104, 0.5490196, 1, 0, 1,
-0.7133101, -0.3397685, -1.396708, 0.5411765, 1, 0, 1,
-0.709637, 0.6494671, 1.177267, 0.5372549, 1, 0, 1,
-0.7038149, 0.2168911, -0.1316577, 0.5294118, 1, 0, 1,
-0.7023906, -0.5231837, -2.716565, 0.5254902, 1, 0, 1,
-0.7021474, 0.03238946, -0.3222254, 0.5176471, 1, 0, 1,
-0.7020913, -1.27897, -3.77359, 0.5137255, 1, 0, 1,
-0.7016923, 1.405974, -0.8058903, 0.5058824, 1, 0, 1,
-0.6997891, 1.195505, -1.132631, 0.5019608, 1, 0, 1,
-0.6963767, -0.4931065, -2.511314, 0.4941176, 1, 0, 1,
-0.6963696, 1.586927, 0.1589786, 0.4862745, 1, 0, 1,
-0.6938219, -0.693716, -2.793986, 0.4823529, 1, 0, 1,
-0.6936864, 0.3292105, -1.117349, 0.4745098, 1, 0, 1,
-0.6898867, 0.6186058, -1.281908, 0.4705882, 1, 0, 1,
-0.6876807, -0.8715987, -2.72144, 0.4627451, 1, 0, 1,
-0.6837986, -0.476565, -2.733455, 0.4588235, 1, 0, 1,
-0.6792029, 1.004989, -0.7771493, 0.4509804, 1, 0, 1,
-0.6723304, 0.175222, -1.173732, 0.4470588, 1, 0, 1,
-0.6656566, 0.4259697, -0.5350444, 0.4392157, 1, 0, 1,
-0.6537706, 0.2806015, 0.02310058, 0.4352941, 1, 0, 1,
-0.6472182, -0.791155, -2.590027, 0.427451, 1, 0, 1,
-0.6436693, 0.3397798, -2.72884, 0.4235294, 1, 0, 1,
-0.6387563, 0.07308446, -1.466153, 0.4156863, 1, 0, 1,
-0.6379484, -1.027435, -3.608276, 0.4117647, 1, 0, 1,
-0.6346363, -0.07922465, -1.752106, 0.4039216, 1, 0, 1,
-0.6231138, -0.8970475, -1.188811, 0.3960784, 1, 0, 1,
-0.6228549, -0.3634064, -1.827267, 0.3921569, 1, 0, 1,
-0.6205627, -1.269159, -3.001902, 0.3843137, 1, 0, 1,
-0.6159829, -2.052068, -4.695815, 0.3803922, 1, 0, 1,
-0.6159171, 0.1917823, -1.343574, 0.372549, 1, 0, 1,
-0.6097971, 0.6984786, -1.898267, 0.3686275, 1, 0, 1,
-0.6097749, 1.141429, -2.610795, 0.3607843, 1, 0, 1,
-0.604287, 1.258695, -1.364717, 0.3568628, 1, 0, 1,
-0.6028359, 1.768745, 0.2286117, 0.3490196, 1, 0, 1,
-0.6018546, 0.4672158, -0.4812278, 0.345098, 1, 0, 1,
-0.5970236, 0.01620403, -1.24968, 0.3372549, 1, 0, 1,
-0.5880145, 0.9138901, -0.01590266, 0.3333333, 1, 0, 1,
-0.5862566, 0.3823822, -1.76271, 0.3254902, 1, 0, 1,
-0.5808699, 0.1598282, -0.101516, 0.3215686, 1, 0, 1,
-0.5803762, -0.5213813, -3.966654, 0.3137255, 1, 0, 1,
-0.5746606, -0.8472072, -2.474116, 0.3098039, 1, 0, 1,
-0.5733225, 0.7422929, -1.85056, 0.3019608, 1, 0, 1,
-0.5706145, 1.222057, -2.058214, 0.2941177, 1, 0, 1,
-0.5694305, 0.7727351, -0.5715111, 0.2901961, 1, 0, 1,
-0.5677907, 1.128858, -0.5147725, 0.282353, 1, 0, 1,
-0.5671848, 0.3515663, -0.1465345, 0.2784314, 1, 0, 1,
-0.5621192, 0.02989183, 0.8022699, 0.2705882, 1, 0, 1,
-0.5572838, 0.312171, -1.777776, 0.2666667, 1, 0, 1,
-0.554612, -0.06708879, -1.323759, 0.2588235, 1, 0, 1,
-0.5347789, 0.04346975, -0.6640199, 0.254902, 1, 0, 1,
-0.533964, -1.298366, -4.444806, 0.2470588, 1, 0, 1,
-0.5290226, -0.1082248, -2.473699, 0.2431373, 1, 0, 1,
-0.5278288, -1.130488, -0.7655687, 0.2352941, 1, 0, 1,
-0.5240098, -0.6688561, -2.607792, 0.2313726, 1, 0, 1,
-0.5197013, -0.430433, -1.5175, 0.2235294, 1, 0, 1,
-0.5099205, 0.9649863, -0.3043437, 0.2196078, 1, 0, 1,
-0.5071062, -0.9462992, -1.363149, 0.2117647, 1, 0, 1,
-0.5038365, 1.251925, 0.1373567, 0.2078431, 1, 0, 1,
-0.5005773, -0.7730124, -2.178399, 0.2, 1, 0, 1,
-0.4964633, 0.5577733, -1.623998, 0.1921569, 1, 0, 1,
-0.4940135, 0.7858163, -1.42952, 0.1882353, 1, 0, 1,
-0.4929679, 1.254084, 0.9192166, 0.1803922, 1, 0, 1,
-0.4909231, 0.1421721, -0.4314261, 0.1764706, 1, 0, 1,
-0.4817587, -0.1379905, -0.4270742, 0.1686275, 1, 0, 1,
-0.4806664, -0.1574809, -5.084583, 0.1647059, 1, 0, 1,
-0.4787379, -0.7570491, -2.631964, 0.1568628, 1, 0, 1,
-0.4725058, 0.7387138, -1.441132, 0.1529412, 1, 0, 1,
-0.4709005, 1.6996, 0.4585303, 0.145098, 1, 0, 1,
-0.4695632, 0.04327721, -2.004001, 0.1411765, 1, 0, 1,
-0.4673096, -0.2383216, -1.280783, 0.1333333, 1, 0, 1,
-0.4634555, -0.2712466, -3.391436, 0.1294118, 1, 0, 1,
-0.4623093, 1.090918, -0.5084956, 0.1215686, 1, 0, 1,
-0.4601527, -2.184719, -3.583384, 0.1176471, 1, 0, 1,
-0.452052, -0.7075154, -3.719224, 0.1098039, 1, 0, 1,
-0.4491155, 0.9148952, -0.3017254, 0.1058824, 1, 0, 1,
-0.4454401, -0.2092583, -2.852478, 0.09803922, 1, 0, 1,
-0.4440779, 1.409385, -0.9048012, 0.09019608, 1, 0, 1,
-0.4407806, 1.586682, 0.6242952, 0.08627451, 1, 0, 1,
-0.4402421, -1.170281, -3.17177, 0.07843138, 1, 0, 1,
-0.4396397, -2.137737, -1.974244, 0.07450981, 1, 0, 1,
-0.4374246, -0.3072435, -1.395992, 0.06666667, 1, 0, 1,
-0.4366302, 0.2930733, -1.466792, 0.0627451, 1, 0, 1,
-0.4341545, 1.560373, 0.009979058, 0.05490196, 1, 0, 1,
-0.4340219, -0.08574999, -2.872239, 0.05098039, 1, 0, 1,
-0.4328249, 0.2061277, -0.8856134, 0.04313726, 1, 0, 1,
-0.4250009, 0.7187495, -0.7567937, 0.03921569, 1, 0, 1,
-0.4230499, 0.3864881, -0.6317117, 0.03137255, 1, 0, 1,
-0.4165382, -1.184406, -2.166827, 0.02745098, 1, 0, 1,
-0.416366, -1.112546, -2.724586, 0.01960784, 1, 0, 1,
-0.4119383, 2.330751, -0.6653104, 0.01568628, 1, 0, 1,
-0.4114946, 0.4806009, -1.46157, 0.007843138, 1, 0, 1,
-0.4089668, 0.9324152, 0.4712464, 0.003921569, 1, 0, 1,
-0.4076748, -0.06962272, -4.246901, 0, 1, 0.003921569, 1,
-0.4075394, 0.5777854, -0.5043751, 0, 1, 0.01176471, 1,
-0.4046518, -2.812725, -4.785756, 0, 1, 0.01568628, 1,
-0.4044908, -0.2768435, -2.232556, 0, 1, 0.02352941, 1,
-0.4020122, -2.432006, -3.031609, 0, 1, 0.02745098, 1,
-0.399885, 1.493299, -1.203029, 0, 1, 0.03529412, 1,
-0.399694, 1.431258, -0.4121879, 0, 1, 0.03921569, 1,
-0.3993309, -0.01249454, -1.682304, 0, 1, 0.04705882, 1,
-0.3982921, 1.406294, 0.8907176, 0, 1, 0.05098039, 1,
-0.3963481, -0.269264, -1.161943, 0, 1, 0.05882353, 1,
-0.3914716, -0.07981797, -2.956965, 0, 1, 0.0627451, 1,
-0.3863578, 1.753111, 0.2488208, 0, 1, 0.07058824, 1,
-0.3847628, 0.9873016, 0.3777103, 0, 1, 0.07450981, 1,
-0.3802105, -0.7213706, -1.622103, 0, 1, 0.08235294, 1,
-0.3760827, -0.2195396, -2.14496, 0, 1, 0.08627451, 1,
-0.3709848, 0.3959058, -0.2226167, 0, 1, 0.09411765, 1,
-0.3642068, -0.3730471, -3.113101, 0, 1, 0.1019608, 1,
-0.3618761, -0.5475134, -2.564806, 0, 1, 0.1058824, 1,
-0.3615454, -0.5686797, -3.204586, 0, 1, 0.1137255, 1,
-0.3572299, 0.751767, -0.4772345, 0, 1, 0.1176471, 1,
-0.3505445, 0.2811535, -0.5194521, 0, 1, 0.1254902, 1,
-0.3477765, 0.1789242, -0.4861066, 0, 1, 0.1294118, 1,
-0.3472786, 0.04539427, -1.874577, 0, 1, 0.1372549, 1,
-0.3460642, 0.9988483, -0.0001631463, 0, 1, 0.1411765, 1,
-0.344241, -1.437578, -2.779642, 0, 1, 0.1490196, 1,
-0.3429829, -1.159642, -2.816385, 0, 1, 0.1529412, 1,
-0.3422131, 0.02495039, -1.865101, 0, 1, 0.1607843, 1,
-0.3348233, 0.2941753, -0.233815, 0, 1, 0.1647059, 1,
-0.3344103, -0.8476007, -0.927785, 0, 1, 0.172549, 1,
-0.3322486, -0.007649873, -2.766633, 0, 1, 0.1764706, 1,
-0.3284344, 0.9481372, 1.748563, 0, 1, 0.1843137, 1,
-0.3170319, -0.8837469, -2.32378, 0, 1, 0.1882353, 1,
-0.3152412, 0.02500513, -1.124958, 0, 1, 0.1960784, 1,
-0.3147819, -0.5376914, -1.181282, 0, 1, 0.2039216, 1,
-0.3104487, -0.01245873, -2.474192, 0, 1, 0.2078431, 1,
-0.3080446, -0.5892192, -3.79686, 0, 1, 0.2156863, 1,
-0.3071162, -1.295053, -2.990578, 0, 1, 0.2196078, 1,
-0.3049839, -0.3621823, -3.068799, 0, 1, 0.227451, 1,
-0.3038957, 0.6824784, -1.74269, 0, 1, 0.2313726, 1,
-0.3038843, -2.179829, -2.28806, 0, 1, 0.2392157, 1,
-0.3023821, 0.7696958, -1.524935, 0, 1, 0.2431373, 1,
-0.3017614, 0.1965076, -1.184937, 0, 1, 0.2509804, 1,
-0.3005092, 0.9930741, 0.7308441, 0, 1, 0.254902, 1,
-0.2967067, -0.174371, -1.308666, 0, 1, 0.2627451, 1,
-0.2926775, -0.5351221, -3.515286, 0, 1, 0.2666667, 1,
-0.2902165, -0.09008373, 0.07993443, 0, 1, 0.2745098, 1,
-0.2902041, 0.2953827, -1.284057, 0, 1, 0.2784314, 1,
-0.2899764, 0.9857357, -0.4155475, 0, 1, 0.2862745, 1,
-0.288914, 0.1053161, -0.1217205, 0, 1, 0.2901961, 1,
-0.2875589, 0.652748, 0.2811689, 0, 1, 0.2980392, 1,
-0.2846981, 0.1563918, -1.79562, 0, 1, 0.3058824, 1,
-0.2823805, 1.582679, -0.3582625, 0, 1, 0.3098039, 1,
-0.2794892, 1.041444, -0.05259678, 0, 1, 0.3176471, 1,
-0.2794212, -0.3599289, -2.570593, 0, 1, 0.3215686, 1,
-0.2744085, -0.6337405, -1.729469, 0, 1, 0.3294118, 1,
-0.2736222, 0.4402918, 0.7645956, 0, 1, 0.3333333, 1,
-0.2730018, -0.8639205, -2.274653, 0, 1, 0.3411765, 1,
-0.2719505, 1.245336, -0.4474301, 0, 1, 0.345098, 1,
-0.27068, -0.0808659, -1.68847, 0, 1, 0.3529412, 1,
-0.2695548, -0.1687465, -3.553149, 0, 1, 0.3568628, 1,
-0.266364, 0.7694708, 1.368497, 0, 1, 0.3647059, 1,
-0.2605161, -0.7453079, -2.492497, 0, 1, 0.3686275, 1,
-0.2595312, 1.34216, 0.0363223, 0, 1, 0.3764706, 1,
-0.2579064, -1.698185, -2.903247, 0, 1, 0.3803922, 1,
-0.2556864, 0.5457661, -0.8585517, 0, 1, 0.3882353, 1,
-0.2531132, -0.3037378, -0.755649, 0, 1, 0.3921569, 1,
-0.2487294, 1.021035, -0.7727627, 0, 1, 0.4, 1,
-0.2464335, 0.7613369, 0.1772983, 0, 1, 0.4078431, 1,
-0.2430384, 1.519806, -0.3666215, 0, 1, 0.4117647, 1,
-0.2428266, -1.279306, -0.9947105, 0, 1, 0.4196078, 1,
-0.2419023, 0.2522031, -0.5239724, 0, 1, 0.4235294, 1,
-0.2338964, -0.270694, -4.072761, 0, 1, 0.4313726, 1,
-0.2297006, 2.235193, -1.320533, 0, 1, 0.4352941, 1,
-0.2263912, 1.161054, -0.6657843, 0, 1, 0.4431373, 1,
-0.2192498, -0.1955765, -2.517197, 0, 1, 0.4470588, 1,
-0.2155326, -1.218032, -3.185225, 0, 1, 0.454902, 1,
-0.2137639, 0.2706769, -1.558314, 0, 1, 0.4588235, 1,
-0.2128855, -0.2814074, -1.868168, 0, 1, 0.4666667, 1,
-0.2103212, -0.5818628, -3.374724, 0, 1, 0.4705882, 1,
-0.2057589, -0.9744791, -2.042752, 0, 1, 0.4784314, 1,
-0.2031223, 1.273815, -2.604891, 0, 1, 0.4823529, 1,
-0.2008951, 0.1216971, -0.8522549, 0, 1, 0.4901961, 1,
-0.1939173, 1.216785, 2.551572, 0, 1, 0.4941176, 1,
-0.1935684, -0.3826256, -5.701941, 0, 1, 0.5019608, 1,
-0.1897011, -0.5477155, -2.992794, 0, 1, 0.509804, 1,
-0.1870032, 0.5530925, 0.2994842, 0, 1, 0.5137255, 1,
-0.1847767, 0.09107748, -1.995328, 0, 1, 0.5215687, 1,
-0.1843414, 0.383973, 1.148394, 0, 1, 0.5254902, 1,
-0.1814543, -2.106014, -2.444538, 0, 1, 0.5333334, 1,
-0.1783545, 1.744869, -0.4553688, 0, 1, 0.5372549, 1,
-0.1735817, -0.602701, -2.048634, 0, 1, 0.5450981, 1,
-0.173422, 0.413132, -0.2766332, 0, 1, 0.5490196, 1,
-0.1700269, 0.4501742, 0.3780684, 0, 1, 0.5568628, 1,
-0.1695793, 1.78053, 0.6039405, 0, 1, 0.5607843, 1,
-0.1654807, 0.6298228, -0.2701635, 0, 1, 0.5686275, 1,
-0.1606747, 0.3559752, 0.0897092, 0, 1, 0.572549, 1,
-0.1591575, -0.8806117, -4.309342, 0, 1, 0.5803922, 1,
-0.1569102, -0.4076465, -2.102792, 0, 1, 0.5843138, 1,
-0.1567845, 1.767283, 1.259383, 0, 1, 0.5921569, 1,
-0.1545048, 0.2594414, -0.7599217, 0, 1, 0.5960785, 1,
-0.1500383, 0.4094009, -0.1841718, 0, 1, 0.6039216, 1,
-0.146112, 1.247208, -1.056869, 0, 1, 0.6117647, 1,
-0.1438865, -0.7031274, -2.798004, 0, 1, 0.6156863, 1,
-0.1409584, -0.1410202, -3.24753, 0, 1, 0.6235294, 1,
-0.1383211, 0.4495175, 0.8586904, 0, 1, 0.627451, 1,
-0.1382365, -0.8373154, -4.46663, 0, 1, 0.6352941, 1,
-0.1382038, 0.2524915, -0.8467003, 0, 1, 0.6392157, 1,
-0.1367166, 0.3691229, 0.8376693, 0, 1, 0.6470588, 1,
-0.1218426, 0.8661262, 1.14893, 0, 1, 0.6509804, 1,
-0.1207853, -0.5798499, -3.131664, 0, 1, 0.6588235, 1,
-0.1173865, 0.4303119, 0.5103298, 0, 1, 0.6627451, 1,
-0.1112632, -1.138266, -3.399479, 0, 1, 0.6705883, 1,
-0.101243, 1.826036, -0.4995313, 0, 1, 0.6745098, 1,
-0.1004577, 0.7133116, 0.653098, 0, 1, 0.682353, 1,
-0.1003149, 0.5162566, 0.2603177, 0, 1, 0.6862745, 1,
-0.09771117, 0.9491017, -0.02921574, 0, 1, 0.6941177, 1,
-0.09635201, -1.253282, -3.103182, 0, 1, 0.7019608, 1,
-0.09015614, -0.2585514, -2.442849, 0, 1, 0.7058824, 1,
-0.08960585, -1.315183, -2.115802, 0, 1, 0.7137255, 1,
-0.08929622, -0.9642476, -2.960628, 0, 1, 0.7176471, 1,
-0.08647847, 0.782595, -1.050889, 0, 1, 0.7254902, 1,
-0.08599874, 0.4425511, -0.1515009, 0, 1, 0.7294118, 1,
-0.08589512, -0.3052958, -2.433322, 0, 1, 0.7372549, 1,
-0.08051846, 0.2487797, -1.14361, 0, 1, 0.7411765, 1,
-0.07706632, -0.2401979, -4.01841, 0, 1, 0.7490196, 1,
-0.07360277, 0.8255669, -0.3928953, 0, 1, 0.7529412, 1,
-0.07196242, -1.049541, -4.404654, 0, 1, 0.7607843, 1,
-0.06609689, -0.5929173, -4.242824, 0, 1, 0.7647059, 1,
-0.06571595, -0.2713895, -3.456269, 0, 1, 0.772549, 1,
-0.06439304, 0.7831224, -0.5994069, 0, 1, 0.7764706, 1,
-0.06236956, 0.7390863, 0.3249261, 0, 1, 0.7843137, 1,
-0.05838671, 0.8529398, 0.9213098, 0, 1, 0.7882353, 1,
-0.05744629, 0.2221543, -0.1509824, 0, 1, 0.7960784, 1,
-0.05382635, -1.792004, -4.907879, 0, 1, 0.8039216, 1,
-0.05320783, -0.7478132, -4.993182, 0, 1, 0.8078431, 1,
-0.05276288, 2.496563, 0.4023179, 0, 1, 0.8156863, 1,
-0.0510587, 0.09610802, -1.155832, 0, 1, 0.8196079, 1,
-0.05094603, 0.8318613, -0.312116, 0, 1, 0.827451, 1,
-0.04954859, 0.7566537, 0.2745296, 0, 1, 0.8313726, 1,
-0.04231092, 1.233744, -0.467455, 0, 1, 0.8392157, 1,
-0.03879904, 1.315742, -0.6603641, 0, 1, 0.8431373, 1,
-0.03730708, -0.05789417, -2.474366, 0, 1, 0.8509804, 1,
-0.0314386, 2.08369, -1.087462, 0, 1, 0.854902, 1,
-0.02656567, 1.818874, 1.345008, 0, 1, 0.8627451, 1,
-0.02290981, 0.796496, 1.669125, 0, 1, 0.8666667, 1,
-0.02190151, 0.6527805, -0.547398, 0, 1, 0.8745098, 1,
-0.01537999, -0.7971229, -3.094194, 0, 1, 0.8784314, 1,
-0.01280364, -0.7997312, -1.790296, 0, 1, 0.8862745, 1,
-0.01115536, -1.351107, -4.097315, 0, 1, 0.8901961, 1,
-0.01060991, 0.08581254, -1.423761, 0, 1, 0.8980392, 1,
-0.008029869, 0.5715214, 1.505479, 0, 1, 0.9058824, 1,
-0.007834236, -0.4051391, -0.6942183, 0, 1, 0.9098039, 1,
-0.006780633, 0.8067128, -1.768184, 0, 1, 0.9176471, 1,
-0.005962434, -0.6195422, -5.324641, 0, 1, 0.9215686, 1,
-0.003597426, 0.5189164, -0.05035782, 0, 1, 0.9294118, 1,
-0.002384565, 1.633864, 1.085311, 0, 1, 0.9333333, 1,
-0.001706456, -0.710329, -3.398037, 0, 1, 0.9411765, 1,
0.0003779944, -2.041613, 3.027085, 0, 1, 0.945098, 1,
0.009970781, -0.5969384, 3.109117, 0, 1, 0.9529412, 1,
0.01142682, 1.80688, 0.01303696, 0, 1, 0.9568627, 1,
0.011547, 1.851189, -0.8925292, 0, 1, 0.9647059, 1,
0.01475936, -0.9883502, 4.193119, 0, 1, 0.9686275, 1,
0.01495275, 1.823997, -0.7339346, 0, 1, 0.9764706, 1,
0.01776094, -0.4950815, 3.754223, 0, 1, 0.9803922, 1,
0.02282495, 0.2736351, -0.03686292, 0, 1, 0.9882353, 1,
0.02763805, 1.76891, 0.7435563, 0, 1, 0.9921569, 1,
0.03349535, 2.55219, -0.1362546, 0, 1, 1, 1,
0.04475031, -0.7797741, 3.757396, 0, 0.9921569, 1, 1,
0.04530609, -0.9515146, 4.468838, 0, 0.9882353, 1, 1,
0.04616265, 0.6152958, 1.782254, 0, 0.9803922, 1, 1,
0.04617054, 0.1014928, 0.1531275, 0, 0.9764706, 1, 1,
0.05267406, -0.2815715, 2.786548, 0, 0.9686275, 1, 1,
0.05882533, -1.870319, 3.543319, 0, 0.9647059, 1, 1,
0.06049351, 0.8545191, 0.9354292, 0, 0.9568627, 1, 1,
0.06227542, -0.4524465, 3.249637, 0, 0.9529412, 1, 1,
0.06697897, -0.136102, 3.837203, 0, 0.945098, 1, 1,
0.06722411, 0.5677314, 0.5068126, 0, 0.9411765, 1, 1,
0.0711332, 0.4838269, 0.0009952923, 0, 0.9333333, 1, 1,
0.07125445, 0.5126641, -0.8992308, 0, 0.9294118, 1, 1,
0.07189112, 1.22745, 0.889477, 0, 0.9215686, 1, 1,
0.07216998, -0.9326047, 4.505134, 0, 0.9176471, 1, 1,
0.07262323, 0.2066253, 0.7136578, 0, 0.9098039, 1, 1,
0.07275151, 0.1527531, 0.7163376, 0, 0.9058824, 1, 1,
0.07309651, 0.3819427, -0.2338415, 0, 0.8980392, 1, 1,
0.07463376, 0.8402101, -0.6675795, 0, 0.8901961, 1, 1,
0.08067864, -0.6298994, 1.196018, 0, 0.8862745, 1, 1,
0.086996, 1.102612, 0.008856677, 0, 0.8784314, 1, 1,
0.09307454, 0.4808364, 1.594507, 0, 0.8745098, 1, 1,
0.09315003, 0.5302129, -0.4969776, 0, 0.8666667, 1, 1,
0.09322832, 0.164905, 1.228583, 0, 0.8627451, 1, 1,
0.09654166, 0.2762266, 0.6941118, 0, 0.854902, 1, 1,
0.09907079, 0.005303706, 2.325465, 0, 0.8509804, 1, 1,
0.1021455, 0.5070704, -0.3972663, 0, 0.8431373, 1, 1,
0.1030071, -0.6047506, 1.287634, 0, 0.8392157, 1, 1,
0.1071169, 1.408059, 1.521721, 0, 0.8313726, 1, 1,
0.1078785, -0.2745192, 3.523898, 0, 0.827451, 1, 1,
0.108744, 0.612227, 0.03625718, 0, 0.8196079, 1, 1,
0.1088527, 0.7458323, 0.1168208, 0, 0.8156863, 1, 1,
0.109112, -0.4069381, 2.839538, 0, 0.8078431, 1, 1,
0.1106736, 1.501887, -1.154806, 0, 0.8039216, 1, 1,
0.1113243, 1.070408, 0.3649196, 0, 0.7960784, 1, 1,
0.1148249, 0.5145667, -0.3205687, 0, 0.7882353, 1, 1,
0.1172204, -0.001767635, 2.134816, 0, 0.7843137, 1, 1,
0.1178839, 1.176857, 1.935716, 0, 0.7764706, 1, 1,
0.1191469, -0.2157637, 1.949241, 0, 0.772549, 1, 1,
0.1192279, 1.444059, 0.7990606, 0, 0.7647059, 1, 1,
0.1215762, -1.085855, 2.480103, 0, 0.7607843, 1, 1,
0.1221491, 0.3290118, -0.1874482, 0, 0.7529412, 1, 1,
0.1240289, -1.141671, 2.339405, 0, 0.7490196, 1, 1,
0.1263712, -1.363906, 1.428086, 0, 0.7411765, 1, 1,
0.1295, -0.8965085, 3.355383, 0, 0.7372549, 1, 1,
0.1317766, -0.6493024, 3.426802, 0, 0.7294118, 1, 1,
0.1339678, 1.475748, 0.1655345, 0, 0.7254902, 1, 1,
0.1339943, 0.9625258, -0.04843816, 0, 0.7176471, 1, 1,
0.13474, 0.6510611, 1.596331, 0, 0.7137255, 1, 1,
0.1403089, 0.7076131, 1.697098, 0, 0.7058824, 1, 1,
0.144132, 0.2883886, 0.006300038, 0, 0.6980392, 1, 1,
0.1451732, 0.4097843, 2.299191, 0, 0.6941177, 1, 1,
0.1543254, 0.262372, 0.3734439, 0, 0.6862745, 1, 1,
0.1544802, -0.5102188, 1.650327, 0, 0.682353, 1, 1,
0.1563671, -1.189008, 2.323665, 0, 0.6745098, 1, 1,
0.1589189, -0.4716768, 3.312548, 0, 0.6705883, 1, 1,
0.1646614, -0.2035481, 0.2357311, 0, 0.6627451, 1, 1,
0.166991, 0.438891, -1.090576, 0, 0.6588235, 1, 1,
0.1693321, -1.35642, 4.496951, 0, 0.6509804, 1, 1,
0.1724805, 1.093022, -0.3987174, 0, 0.6470588, 1, 1,
0.1779274, -0.5201331, 2.88202, 0, 0.6392157, 1, 1,
0.178791, -0.7089992, 2.784226, 0, 0.6352941, 1, 1,
0.1803185, -0.2174313, 3.25858, 0, 0.627451, 1, 1,
0.1829782, -0.3221184, 1.632506, 0, 0.6235294, 1, 1,
0.1843482, -1.150677, 3.786783, 0, 0.6156863, 1, 1,
0.193129, -0.3741499, 0.9845967, 0, 0.6117647, 1, 1,
0.1977861, -0.8338737, 2.30493, 0, 0.6039216, 1, 1,
0.1991729, 0.2828945, -1.144722, 0, 0.5960785, 1, 1,
0.2007987, -0.2111014, 1.922084, 0, 0.5921569, 1, 1,
0.201289, -1.124732, 2.21378, 0, 0.5843138, 1, 1,
0.2016735, 0.1532384, 1.770009, 0, 0.5803922, 1, 1,
0.2031483, 1.105699, 1.659629, 0, 0.572549, 1, 1,
0.2056313, 0.2511723, 0.7912561, 0, 0.5686275, 1, 1,
0.206114, 1.103837, -1.809118, 0, 0.5607843, 1, 1,
0.206128, 0.1933345, 0.3845787, 0, 0.5568628, 1, 1,
0.208029, 0.739552, -0.1450284, 0, 0.5490196, 1, 1,
0.21361, -1.224038, 2.90071, 0, 0.5450981, 1, 1,
0.2141919, -0.825334, 2.675198, 0, 0.5372549, 1, 1,
0.214468, -0.414049, 3.350151, 0, 0.5333334, 1, 1,
0.2146978, -1.495956, 2.043851, 0, 0.5254902, 1, 1,
0.2155019, -1.139689, 3.230257, 0, 0.5215687, 1, 1,
0.2212852, -0.9276444, 2.99756, 0, 0.5137255, 1, 1,
0.2239461, -0.6106964, 1.144233, 0, 0.509804, 1, 1,
0.2259086, 0.8468307, -0.9678218, 0, 0.5019608, 1, 1,
0.2268026, 0.5326596, 0.7697445, 0, 0.4941176, 1, 1,
0.2297235, 0.3667857, 1.59185, 0, 0.4901961, 1, 1,
0.237602, 0.3518265, -0.2935044, 0, 0.4823529, 1, 1,
0.2424091, 0.5343333, 0.3981644, 0, 0.4784314, 1, 1,
0.2454235, -0.4937918, 1.953421, 0, 0.4705882, 1, 1,
0.2461873, -0.1485375, 1.823038, 0, 0.4666667, 1, 1,
0.2467478, -0.3249348, 2.111127, 0, 0.4588235, 1, 1,
0.2490515, -0.4188799, 1.376354, 0, 0.454902, 1, 1,
0.2514822, 0.2040416, 0.1786696, 0, 0.4470588, 1, 1,
0.2524287, 1.401739, 1.004604, 0, 0.4431373, 1, 1,
0.2558452, -0.001808059, 0.7254701, 0, 0.4352941, 1, 1,
0.2586564, -0.1141508, 2.016008, 0, 0.4313726, 1, 1,
0.2613027, 0.4781041, -1.349233, 0, 0.4235294, 1, 1,
0.2626304, -0.8596568, 2.380413, 0, 0.4196078, 1, 1,
0.2646662, 1.984936, -0.09146904, 0, 0.4117647, 1, 1,
0.2655923, -0.6719692, 3.497645, 0, 0.4078431, 1, 1,
0.2667931, 0.5427635, -1.458375, 0, 0.4, 1, 1,
0.2719268, -0.3742002, 2.944191, 0, 0.3921569, 1, 1,
0.2738907, 0.8309259, 0.8315037, 0, 0.3882353, 1, 1,
0.277027, 0.01402504, 0.2313181, 0, 0.3803922, 1, 1,
0.2775184, -0.1523822, 2.85172, 0, 0.3764706, 1, 1,
0.2803462, -1.195639, 2.774756, 0, 0.3686275, 1, 1,
0.2855529, 0.1575819, 0.8324309, 0, 0.3647059, 1, 1,
0.2915682, -0.2501475, 3.081699, 0, 0.3568628, 1, 1,
0.2933598, -1.019282, 1.415315, 0, 0.3529412, 1, 1,
0.2946138, -0.569233, 1.448992, 0, 0.345098, 1, 1,
0.2947759, -0.4968795, 1.632693, 0, 0.3411765, 1, 1,
0.304979, 0.01939038, 1.995072, 0, 0.3333333, 1, 1,
0.3056781, -0.1016114, 0.5347551, 0, 0.3294118, 1, 1,
0.3070137, -0.7736562, 2.374387, 0, 0.3215686, 1, 1,
0.308167, 0.7775496, -0.3440018, 0, 0.3176471, 1, 1,
0.314303, -0.6327516, 3.355626, 0, 0.3098039, 1, 1,
0.3152873, -1.12402, 2.022727, 0, 0.3058824, 1, 1,
0.31565, 0.6090994, 1.669808, 0, 0.2980392, 1, 1,
0.3171141, -0.2229231, 0.06944228, 0, 0.2901961, 1, 1,
0.3234767, -1.276343, 2.587082, 0, 0.2862745, 1, 1,
0.3277547, 0.3917896, 3.534469, 0, 0.2784314, 1, 1,
0.3296672, -0.3012274, 2.272139, 0, 0.2745098, 1, 1,
0.3311029, -0.0667005, 1.63644, 0, 0.2666667, 1, 1,
0.332039, 0.8090804, 0.6021019, 0, 0.2627451, 1, 1,
0.3353176, -0.1032592, 2.670787, 0, 0.254902, 1, 1,
0.3379605, 0.2671296, 2.845776, 0, 0.2509804, 1, 1,
0.3406206, 1.247205, -0.04535048, 0, 0.2431373, 1, 1,
0.343253, -0.7036023, 3.840395, 0, 0.2392157, 1, 1,
0.345078, 0.7042861, 1.56392, 0, 0.2313726, 1, 1,
0.3470142, 1.398735, -0.3435316, 0, 0.227451, 1, 1,
0.3548287, 0.6595291, 0.2104338, 0, 0.2196078, 1, 1,
0.3564461, -1.307658, 4.477112, 0, 0.2156863, 1, 1,
0.3569549, -0.8279292, 2.941521, 0, 0.2078431, 1, 1,
0.3645487, 1.170872, 0.054348, 0, 0.2039216, 1, 1,
0.3684959, 1.096086, 1.471052, 0, 0.1960784, 1, 1,
0.3691824, 0.532769, -0.3822772, 0, 0.1882353, 1, 1,
0.3805044, -0.6893432, 2.696682, 0, 0.1843137, 1, 1,
0.3824638, 1.297358, 1.289649, 0, 0.1764706, 1, 1,
0.3826773, -1.824629, 3.318091, 0, 0.172549, 1, 1,
0.383599, -0.8564917, 3.401104, 0, 0.1647059, 1, 1,
0.3848658, 0.1170894, 1.415502, 0, 0.1607843, 1, 1,
0.3858021, 0.7797126, 1.44295, 0, 0.1529412, 1, 1,
0.3867684, 0.7111391, -1.12452, 0, 0.1490196, 1, 1,
0.388529, -0.007514508, 1.258, 0, 0.1411765, 1, 1,
0.3909025, 0.6318241, -1.690911, 0, 0.1372549, 1, 1,
0.3969364, -0.3288238, 2.21914, 0, 0.1294118, 1, 1,
0.4039398, 0.4829704, -0.9597282, 0, 0.1254902, 1, 1,
0.4072873, 0.8442369, 0.2392605, 0, 0.1176471, 1, 1,
0.407853, -1.051071, 3.050124, 0, 0.1137255, 1, 1,
0.4090504, -0.6186852, 2.704124, 0, 0.1058824, 1, 1,
0.4118475, 0.3315105, 1.187053, 0, 0.09803922, 1, 1,
0.4118775, 0.6779915, 1.292953, 0, 0.09411765, 1, 1,
0.4126157, -0.633441, 1.376691, 0, 0.08627451, 1, 1,
0.4127989, -0.226655, 2.308633, 0, 0.08235294, 1, 1,
0.4131553, -0.1972531, 1.697799, 0, 0.07450981, 1, 1,
0.4178004, 0.519249, 2.929496, 0, 0.07058824, 1, 1,
0.417861, -0.2001266, 1.456816, 0, 0.0627451, 1, 1,
0.4187744, -0.06872627, 1.842463, 0, 0.05882353, 1, 1,
0.4221934, 0.6837596, 0.07528346, 0, 0.05098039, 1, 1,
0.422543, 2.392962, 0.03684842, 0, 0.04705882, 1, 1,
0.4236331, -0.9379099, 2.572226, 0, 0.03921569, 1, 1,
0.4278047, 0.1298582, 1.233241, 0, 0.03529412, 1, 1,
0.4285312, 0.02618136, 2.131404, 0, 0.02745098, 1, 1,
0.4334429, 0.7191259, -0.05621564, 0, 0.02352941, 1, 1,
0.4344245, 0.7034394, -0.7570014, 0, 0.01568628, 1, 1,
0.448956, 0.9935317, 0.7796372, 0, 0.01176471, 1, 1,
0.4509947, -0.5634452, 2.033569, 0, 0.003921569, 1, 1,
0.4528761, 0.4493659, 0.4000225, 0.003921569, 0, 1, 1,
0.4530858, -0.8737009, 1.238943, 0.007843138, 0, 1, 1,
0.4542083, -0.1966188, 2.06477, 0.01568628, 0, 1, 1,
0.4587055, -0.3683652, 0.5991243, 0.01960784, 0, 1, 1,
0.4609289, 0.6710873, -0.2866906, 0.02745098, 0, 1, 1,
0.4669331, 0.2051497, 2.922436, 0.03137255, 0, 1, 1,
0.4670252, -1.340391, 3.012889, 0.03921569, 0, 1, 1,
0.4670428, 2.257928, -0.2885502, 0.04313726, 0, 1, 1,
0.468149, -1.175937, 3.211816, 0.05098039, 0, 1, 1,
0.4691621, 0.8408534, 0.2237689, 0.05490196, 0, 1, 1,
0.470934, -0.9307809, 1.176163, 0.0627451, 0, 1, 1,
0.4754137, -1.53458, 3.299998, 0.06666667, 0, 1, 1,
0.4755913, -0.8077378, 3.112465, 0.07450981, 0, 1, 1,
0.4802526, -1.087175, 1.267837, 0.07843138, 0, 1, 1,
0.4803333, 0.4682331, -0.7809574, 0.08627451, 0, 1, 1,
0.4805773, -0.3590138, 2.877313, 0.09019608, 0, 1, 1,
0.4850896, 1.305585, -0.472037, 0.09803922, 0, 1, 1,
0.490589, -0.4372014, 1.461703, 0.1058824, 0, 1, 1,
0.4943082, 0.12582, 1.288311, 0.1098039, 0, 1, 1,
0.5032455, -0.4945162, 2.667828, 0.1176471, 0, 1, 1,
0.5036628, -0.8697921, 3.363988, 0.1215686, 0, 1, 1,
0.510977, -0.7522981, 3.196819, 0.1294118, 0, 1, 1,
0.5221118, -0.4869053, 3.141716, 0.1333333, 0, 1, 1,
0.5257116, 1.542507, -0.3469996, 0.1411765, 0, 1, 1,
0.5303019, -0.7797207, 1.318789, 0.145098, 0, 1, 1,
0.5312387, 0.4527264, 1.15706, 0.1529412, 0, 1, 1,
0.5325835, 0.4017397, -0.01865413, 0.1568628, 0, 1, 1,
0.5398875, 0.01246279, 1.406241, 0.1647059, 0, 1, 1,
0.5465835, 0.7150849, -1.067927, 0.1686275, 0, 1, 1,
0.5468445, -0.1807878, 1.027191, 0.1764706, 0, 1, 1,
0.5485836, -0.2967038, 1.651904, 0.1803922, 0, 1, 1,
0.5523446, -1.265576, 2.657244, 0.1882353, 0, 1, 1,
0.5525545, -0.08207137, 1.6026, 0.1921569, 0, 1, 1,
0.553036, -0.5955929, 1.931657, 0.2, 0, 1, 1,
0.5586054, -0.05754608, 2.662451, 0.2078431, 0, 1, 1,
0.5610351, 1.451237, 1.195608, 0.2117647, 0, 1, 1,
0.5612031, 0.5141193, 0.5743034, 0.2196078, 0, 1, 1,
0.5612273, 0.6701437, 0.773752, 0.2235294, 0, 1, 1,
0.5648329, 0.1749568, 1.212926, 0.2313726, 0, 1, 1,
0.5691623, 1.539342, 1.909609, 0.2352941, 0, 1, 1,
0.5694946, -1.145541, 4.729899, 0.2431373, 0, 1, 1,
0.5698329, -0.07270873, 2.896049, 0.2470588, 0, 1, 1,
0.5707473, 0.6194925, 2.168072, 0.254902, 0, 1, 1,
0.5762572, 0.6504409, 0.505361, 0.2588235, 0, 1, 1,
0.5829374, 0.6990252, -0.2587836, 0.2666667, 0, 1, 1,
0.5833094, -2.289472, 2.372774, 0.2705882, 0, 1, 1,
0.5834601, 0.5788831, 0.315952, 0.2784314, 0, 1, 1,
0.5848064, -0.175756, 0.6602832, 0.282353, 0, 1, 1,
0.5900901, 0.2161236, 0.5725838, 0.2901961, 0, 1, 1,
0.5964624, -1.410181, 0.6645409, 0.2941177, 0, 1, 1,
0.597478, 0.06593116, 0.9495119, 0.3019608, 0, 1, 1,
0.6079702, 0.3975391, 2.246999, 0.3098039, 0, 1, 1,
0.6135756, -0.4273593, 3.061357, 0.3137255, 0, 1, 1,
0.6136945, 0.3321449, 0.4906093, 0.3215686, 0, 1, 1,
0.6149848, 1.846194, -1.031316, 0.3254902, 0, 1, 1,
0.6186308, 0.4938163, 0.704702, 0.3333333, 0, 1, 1,
0.6196463, -1.668687, 3.247152, 0.3372549, 0, 1, 1,
0.6241483, 1.013623, 1.872098, 0.345098, 0, 1, 1,
0.6259351, -0.3070376, 2.53593, 0.3490196, 0, 1, 1,
0.6320612, -0.4623604, 2.68967, 0.3568628, 0, 1, 1,
0.6392721, -0.9251329, 4.084191, 0.3607843, 0, 1, 1,
0.6546118, -0.04979141, 2.076293, 0.3686275, 0, 1, 1,
0.65534, -0.184643, 1.935813, 0.372549, 0, 1, 1,
0.6564051, -0.4406299, 1.929218, 0.3803922, 0, 1, 1,
0.6578168, 0.5087335, -0.4211422, 0.3843137, 0, 1, 1,
0.6584817, -0.457832, 2.473491, 0.3921569, 0, 1, 1,
0.6588207, -0.6190472, 3.330132, 0.3960784, 0, 1, 1,
0.6611103, -0.4335656, 1.880053, 0.4039216, 0, 1, 1,
0.6627656, -0.4154566, 1.636275, 0.4117647, 0, 1, 1,
0.6638953, -0.03252044, 1.545096, 0.4156863, 0, 1, 1,
0.6660157, 1.243484, 2.107671, 0.4235294, 0, 1, 1,
0.6672108, -0.3443128, 1.097555, 0.427451, 0, 1, 1,
0.6725807, 1.011796, 0.6542919, 0.4352941, 0, 1, 1,
0.6765649, 1.785656, 0.9172253, 0.4392157, 0, 1, 1,
0.6781849, -0.1821359, 2.931957, 0.4470588, 0, 1, 1,
0.6839934, 1.605157, 1.210716, 0.4509804, 0, 1, 1,
0.6847487, 0.7629154, 2.089521, 0.4588235, 0, 1, 1,
0.6866859, -1.312866, 2.939987, 0.4627451, 0, 1, 1,
0.6872259, 0.3439818, 0.9405914, 0.4705882, 0, 1, 1,
0.7044804, -0.7636396, 2.42226, 0.4745098, 0, 1, 1,
0.7226986, 1.184425, -1.057988, 0.4823529, 0, 1, 1,
0.7228556, 0.7156304, 1.248499, 0.4862745, 0, 1, 1,
0.7245747, 1.295885, 0.4679535, 0.4941176, 0, 1, 1,
0.7271177, 0.7987218, 0.4057978, 0.5019608, 0, 1, 1,
0.7373578, 2.489296, 1.471252, 0.5058824, 0, 1, 1,
0.7406513, -0.2061343, 2.2353, 0.5137255, 0, 1, 1,
0.7407364, -0.7751727, 3.251788, 0.5176471, 0, 1, 1,
0.743906, -0.1057859, 2.422195, 0.5254902, 0, 1, 1,
0.7446162, 0.8213847, 1.469565, 0.5294118, 0, 1, 1,
0.7450312, -0.2640715, 2.045444, 0.5372549, 0, 1, 1,
0.7453579, -0.04400547, 2.838747, 0.5411765, 0, 1, 1,
0.7471136, -1.15601, 3.27307, 0.5490196, 0, 1, 1,
0.7483152, 0.1602744, 1.773213, 0.5529412, 0, 1, 1,
0.7494962, 0.3369028, 2.001838, 0.5607843, 0, 1, 1,
0.7511389, 1.046849, 0.6773999, 0.5647059, 0, 1, 1,
0.7529116, 1.497505, -1.951664, 0.572549, 0, 1, 1,
0.7531071, -0.2340203, 0.9059905, 0.5764706, 0, 1, 1,
0.7585052, 0.5150882, -0.9708585, 0.5843138, 0, 1, 1,
0.7611976, 0.4881234, 1.955257, 0.5882353, 0, 1, 1,
0.7619733, 0.9976952, 0.5654564, 0.5960785, 0, 1, 1,
0.7649717, 2.047697, -0.7584745, 0.6039216, 0, 1, 1,
0.7699909, -1.165297, 2.556512, 0.6078432, 0, 1, 1,
0.7709016, -1.014205, 2.145883, 0.6156863, 0, 1, 1,
0.7733104, -1.057802, 3.169706, 0.6196079, 0, 1, 1,
0.7759499, -0.7752138, 1.66465, 0.627451, 0, 1, 1,
0.7776636, -0.9219247, 3.600856, 0.6313726, 0, 1, 1,
0.778535, 1.136751, 1.652525, 0.6392157, 0, 1, 1,
0.7820964, -0.5816075, 1.447887, 0.6431373, 0, 1, 1,
0.7826172, -1.648856, 2.881415, 0.6509804, 0, 1, 1,
0.7838138, 1.561345, 0.6554857, 0.654902, 0, 1, 1,
0.7839978, 0.9106738, -1.744905, 0.6627451, 0, 1, 1,
0.7951543, -1.151841, 4.119125, 0.6666667, 0, 1, 1,
0.7963055, 0.6640555, 1.068482, 0.6745098, 0, 1, 1,
0.7970677, -0.01743999, -0.245031, 0.6784314, 0, 1, 1,
0.7992339, 0.3777419, 1.848995, 0.6862745, 0, 1, 1,
0.8010236, 0.4331128, 1.97389, 0.6901961, 0, 1, 1,
0.8014129, 1.395421, 1.807425, 0.6980392, 0, 1, 1,
0.8131608, -0.5521561, 2.121738, 0.7058824, 0, 1, 1,
0.8146052, -0.8831322, 2.31047, 0.7098039, 0, 1, 1,
0.8163105, 0.05509797, 1.426772, 0.7176471, 0, 1, 1,
0.818453, 0.7060872, 0.3862322, 0.7215686, 0, 1, 1,
0.8212354, 0.0766598, 2.096116, 0.7294118, 0, 1, 1,
0.8231382, 0.6995627, 1.947221, 0.7333333, 0, 1, 1,
0.8254461, 0.1028068, 3.249876, 0.7411765, 0, 1, 1,
0.8369938, 1.79787, -0.4711252, 0.7450981, 0, 1, 1,
0.8387412, 0.3675157, 0.7798351, 0.7529412, 0, 1, 1,
0.8421586, -0.6943024, 1.357696, 0.7568628, 0, 1, 1,
0.8433654, 0.6691765, 0.6166438, 0.7647059, 0, 1, 1,
0.843679, 1.660805, 0.7571821, 0.7686275, 0, 1, 1,
0.8438048, -0.07946226, 1.906255, 0.7764706, 0, 1, 1,
0.8465999, -1.292714, 1.428656, 0.7803922, 0, 1, 1,
0.8506189, -1.773969, 2.21549, 0.7882353, 0, 1, 1,
0.8519965, 1.054691, 1.662736, 0.7921569, 0, 1, 1,
0.8522324, -1.49425, 3.787047, 0.8, 0, 1, 1,
0.8543332, 0.8650303, 0.359079, 0.8078431, 0, 1, 1,
0.8559996, 0.7761698, 0.07411315, 0.8117647, 0, 1, 1,
0.8560545, 0.01156734, -0.7170549, 0.8196079, 0, 1, 1,
0.8577877, 0.1854934, 1.426542, 0.8235294, 0, 1, 1,
0.8598167, -0.1193586, 3.695074, 0.8313726, 0, 1, 1,
0.8609163, -0.2600121, 1.187599, 0.8352941, 0, 1, 1,
0.8631012, -0.103624, 2.386596, 0.8431373, 0, 1, 1,
0.8727155, 0.1714842, 0.2547253, 0.8470588, 0, 1, 1,
0.8830791, -0.150401, 2.205005, 0.854902, 0, 1, 1,
0.900381, -0.8829333, 0.8075874, 0.8588235, 0, 1, 1,
0.9092239, -0.5924097, 1.101588, 0.8666667, 0, 1, 1,
0.9110523, 1.573694, 0.6970635, 0.8705882, 0, 1, 1,
0.9120751, 0.8126485, 2.380566, 0.8784314, 0, 1, 1,
0.9144982, 0.7547958, 0.4800741, 0.8823529, 0, 1, 1,
0.919671, 0.03264222, 2.935978, 0.8901961, 0, 1, 1,
0.9307094, -0.313513, 1.195464, 0.8941177, 0, 1, 1,
0.9350119, -0.1906677, 0.3679238, 0.9019608, 0, 1, 1,
0.936546, 1.0187, 0.6610848, 0.9098039, 0, 1, 1,
0.9441562, -0.4849307, 1.143075, 0.9137255, 0, 1, 1,
0.9473769, -0.3536669, 1.504298, 0.9215686, 0, 1, 1,
0.9481217, 0.001560608, 1.532853, 0.9254902, 0, 1, 1,
0.9517024, -0.8535868, 1.728145, 0.9333333, 0, 1, 1,
0.9519198, -1.430245, 0.8839222, 0.9372549, 0, 1, 1,
0.9542249, 0.1301499, 0.2606031, 0.945098, 0, 1, 1,
0.95952, -0.2826334, -0.3723741, 0.9490196, 0, 1, 1,
0.9595901, 1.429204, -0.122979, 0.9568627, 0, 1, 1,
0.9627304, -1.213987, 3.383837, 0.9607843, 0, 1, 1,
0.9659063, -1.384511, 3.080604, 0.9686275, 0, 1, 1,
0.9724286, -0.1029075, 1.586267, 0.972549, 0, 1, 1,
0.9836421, 0.3146522, 0.8911225, 0.9803922, 0, 1, 1,
0.9857388, -0.5733744, 2.920216, 0.9843137, 0, 1, 1,
0.9861078, 0.7779444, 1.557241, 0.9921569, 0, 1, 1,
0.9873323, -1.006539, 1.527158, 0.9960784, 0, 1, 1,
0.9908497, 0.4072922, 0.9863714, 1, 0, 0.9960784, 1,
0.9917076, 0.9821411, 1.297938, 1, 0, 0.9882353, 1,
0.9955264, 2.453347, -0.7809937, 1, 0, 0.9843137, 1,
0.9972641, 0.8538566, 2.128816, 1, 0, 0.9764706, 1,
0.997758, 0.7757186, -0.05671986, 1, 0, 0.972549, 1,
1.015553, -2.395303, 3.25056, 1, 0, 0.9647059, 1,
1.02611, 1.195695, 1.049556, 1, 0, 0.9607843, 1,
1.032422, -1.603776, 2.527754, 1, 0, 0.9529412, 1,
1.039056, 0.5961493, 2.246186, 1, 0, 0.9490196, 1,
1.04343, 0.4314069, 0.9929412, 1, 0, 0.9411765, 1,
1.046428, 0.1523471, 2.301018, 1, 0, 0.9372549, 1,
1.04852, 1.495442, 0.3583546, 1, 0, 0.9294118, 1,
1.048637, -0.6467853, 0.7611622, 1, 0, 0.9254902, 1,
1.055639, -0.8202314, 4.215085, 1, 0, 0.9176471, 1,
1.05724, 0.5202384, 0.9898235, 1, 0, 0.9137255, 1,
1.075859, -0.5526616, 1.511378, 1, 0, 0.9058824, 1,
1.078188, -0.9076616, 4.74369, 1, 0, 0.9019608, 1,
1.078735, -0.2338557, -0.145006, 1, 0, 0.8941177, 1,
1.092849, -1.184908, 3.474898, 1, 0, 0.8862745, 1,
1.096048, -1.0748, 2.479641, 1, 0, 0.8823529, 1,
1.099537, 0.4254342, 1.179852, 1, 0, 0.8745098, 1,
1.102596, 0.04237282, 0.7246072, 1, 0, 0.8705882, 1,
1.110204, 0.2622932, 2.246185, 1, 0, 0.8627451, 1,
1.110624, 0.5204996, 1.438309, 1, 0, 0.8588235, 1,
1.115617, 0.9193088, 2.22446, 1, 0, 0.8509804, 1,
1.122839, 0.5135222, 1.823647, 1, 0, 0.8470588, 1,
1.124257, -0.7129622, 0.4798063, 1, 0, 0.8392157, 1,
1.125166, 0.07778829, 1.127148, 1, 0, 0.8352941, 1,
1.129242, -1.222073, 0.401628, 1, 0, 0.827451, 1,
1.129925, 1.451134, 0.5481938, 1, 0, 0.8235294, 1,
1.131571, -1.307129, 2.3849, 1, 0, 0.8156863, 1,
1.135126, 3.548499, 0.6658688, 1, 0, 0.8117647, 1,
1.136591, 0.8890789, 1.159022, 1, 0, 0.8039216, 1,
1.142995, 2.215371, -0.1197542, 1, 0, 0.7960784, 1,
1.15058, -0.4707546, 2.296896, 1, 0, 0.7921569, 1,
1.154284, -1.891829, 3.07427, 1, 0, 0.7843137, 1,
1.157069, 1.235427, 2.525894, 1, 0, 0.7803922, 1,
1.165875, -0.8488929, 3.916599, 1, 0, 0.772549, 1,
1.168546, 1.202228, -0.01551401, 1, 0, 0.7686275, 1,
1.168791, -0.07582318, -0.2281579, 1, 0, 0.7607843, 1,
1.175923, -0.6776921, -0.1757505, 1, 0, 0.7568628, 1,
1.179038, -0.07882013, 2.12111, 1, 0, 0.7490196, 1,
1.181797, -0.813127, 3.498038, 1, 0, 0.7450981, 1,
1.195297, 0.3409794, 1.607579, 1, 0, 0.7372549, 1,
1.197474, 0.510813, 0.4492502, 1, 0, 0.7333333, 1,
1.198301, -0.2004884, 2.3049, 1, 0, 0.7254902, 1,
1.201928, 0.5006252, -0.4648543, 1, 0, 0.7215686, 1,
1.20713, 0.2891245, 0.5060775, 1, 0, 0.7137255, 1,
1.215379, 0.5835751, 1.421567, 1, 0, 0.7098039, 1,
1.224091, -1.017072, 1.375406, 1, 0, 0.7019608, 1,
1.238493, -0.9939212, 1.383201, 1, 0, 0.6941177, 1,
1.240287, -1.27987, 2.240647, 1, 0, 0.6901961, 1,
1.245879, 0.8733087, 1.161372, 1, 0, 0.682353, 1,
1.261232, 0.1649498, 1.797569, 1, 0, 0.6784314, 1,
1.26186, -1.596207, 4.087302, 1, 0, 0.6705883, 1,
1.267128, 0.8210087, 1.131242, 1, 0, 0.6666667, 1,
1.275827, 0.1773892, 0.2232168, 1, 0, 0.6588235, 1,
1.282655, -0.1479667, 2.474631, 1, 0, 0.654902, 1,
1.284949, 0.2217159, 1.449709, 1, 0, 0.6470588, 1,
1.296606, -0.5364681, 0.9154549, 1, 0, 0.6431373, 1,
1.301997, -0.01170958, 1.09224, 1, 0, 0.6352941, 1,
1.302035, 0.6827492, 1.404833, 1, 0, 0.6313726, 1,
1.312993, 1.02091, 0.06448959, 1, 0, 0.6235294, 1,
1.323247, 1.022346, 0.8253808, 1, 0, 0.6196079, 1,
1.333969, -0.02907825, 3.765579, 1, 0, 0.6117647, 1,
1.343699, 0.8608524, 2.080033, 1, 0, 0.6078432, 1,
1.3511, 2.350727, -0.6525334, 1, 0, 0.6, 1,
1.35353, -0.06726214, 2.370881, 1, 0, 0.5921569, 1,
1.358024, -0.6825516, 2.139585, 1, 0, 0.5882353, 1,
1.361842, -3.037398, 2.924384, 1, 0, 0.5803922, 1,
1.362757, 0.1490016, 0.8266886, 1, 0, 0.5764706, 1,
1.369785, -0.1279763, 1.890638, 1, 0, 0.5686275, 1,
1.376929, -0.5267445, 1.432875, 1, 0, 0.5647059, 1,
1.37785, -0.2429843, 0.1513642, 1, 0, 0.5568628, 1,
1.385785, 0.03254407, 2.233931, 1, 0, 0.5529412, 1,
1.386505, -1.434602, 4.233875, 1, 0, 0.5450981, 1,
1.386967, 0.1613248, 0.7542023, 1, 0, 0.5411765, 1,
1.390986, -0.03144056, 1.571397, 1, 0, 0.5333334, 1,
1.391026, -0.7890334, 2.336702, 1, 0, 0.5294118, 1,
1.399589, 0.98529, 1.776573, 1, 0, 0.5215687, 1,
1.402235, -1.608742, 3.450904, 1, 0, 0.5176471, 1,
1.407435, -0.8046705, 1.719851, 1, 0, 0.509804, 1,
1.407591, -0.7815344, 0.2721066, 1, 0, 0.5058824, 1,
1.428116, -0.08877467, 0.6737658, 1, 0, 0.4980392, 1,
1.429503, 1.298303, -0.1127699, 1, 0, 0.4901961, 1,
1.435928, 0.8195346, -1.17456, 1, 0, 0.4862745, 1,
1.435938, 0.8018901, 3.236666, 1, 0, 0.4784314, 1,
1.441951, -1.086882, 3.406644, 1, 0, 0.4745098, 1,
1.458653, -0.7709242, 1.675795, 1, 0, 0.4666667, 1,
1.463549, 1.055353, 0.9411523, 1, 0, 0.4627451, 1,
1.480388, -2.198428, 0.6969681, 1, 0, 0.454902, 1,
1.482687, -1.101404, 2.745544, 1, 0, 0.4509804, 1,
1.482892, -0.1499234, 3.441786, 1, 0, 0.4431373, 1,
1.486442, 0.2499098, 1.293357, 1, 0, 0.4392157, 1,
1.487166, 0.04776507, -1.521774, 1, 0, 0.4313726, 1,
1.489673, 0.5202535, 1.111409, 1, 0, 0.427451, 1,
1.50202, -0.3850358, 0.3031342, 1, 0, 0.4196078, 1,
1.505104, 1.313722, 0.6580313, 1, 0, 0.4156863, 1,
1.512611, 0.9219331, 0.7097369, 1, 0, 0.4078431, 1,
1.512807, -1.446975, 2.331379, 1, 0, 0.4039216, 1,
1.521575, -0.5472456, 1.377821, 1, 0, 0.3960784, 1,
1.523672, 1.096282, 2.982882, 1, 0, 0.3882353, 1,
1.567563, -1.567061, 1.94297, 1, 0, 0.3843137, 1,
1.568064, 1.065141, -0.4302865, 1, 0, 0.3764706, 1,
1.568482, -1.648984, 1.680178, 1, 0, 0.372549, 1,
1.572947, -0.4549791, 0.70587, 1, 0, 0.3647059, 1,
1.591174, -0.5032032, 0.9881514, 1, 0, 0.3607843, 1,
1.595908, -1.394118, 3.466369, 1, 0, 0.3529412, 1,
1.597876, 0.05504066, 2.11736, 1, 0, 0.3490196, 1,
1.603027, 0.3018083, 2.823156, 1, 0, 0.3411765, 1,
1.603308, 0.03629755, 1.947985, 1, 0, 0.3372549, 1,
1.606034, -1.242621, 2.978982, 1, 0, 0.3294118, 1,
1.610638, -0.08646475, 2.335957, 1, 0, 0.3254902, 1,
1.61314, -0.8293634, 3.627432, 1, 0, 0.3176471, 1,
1.616393, -0.128653, -0.3034453, 1, 0, 0.3137255, 1,
1.629889, 0.339305, 3.22445, 1, 0, 0.3058824, 1,
1.630243, 0.1916044, 2.597785, 1, 0, 0.2980392, 1,
1.63185, 0.03272863, 0.4822624, 1, 0, 0.2941177, 1,
1.632805, 0.145611, 2.285009, 1, 0, 0.2862745, 1,
1.64425, -0.5897803, 1.750229, 1, 0, 0.282353, 1,
1.654429, 0.3722017, 0.3376529, 1, 0, 0.2745098, 1,
1.657216, 0.7686737, 2.213632, 1, 0, 0.2705882, 1,
1.662042, 2.703157, 1.001378, 1, 0, 0.2627451, 1,
1.679693, 1.540945, 1.691519, 1, 0, 0.2588235, 1,
1.691456, 1.48187, -0.4663074, 1, 0, 0.2509804, 1,
1.717613, -0.9562578, 2.337161, 1, 0, 0.2470588, 1,
1.72003, 0.06621833, 1.945107, 1, 0, 0.2392157, 1,
1.724943, -0.6083773, 3.615387, 1, 0, 0.2352941, 1,
1.730752, -0.1059688, 2.2615, 1, 0, 0.227451, 1,
1.735585, 0.3527502, 0.4998141, 1, 0, 0.2235294, 1,
1.749562, -0.1581656, 2.90015, 1, 0, 0.2156863, 1,
1.761598, -0.3281537, 0.9544488, 1, 0, 0.2117647, 1,
1.763832, -0.2500402, 1.380801, 1, 0, 0.2039216, 1,
1.783897, 0.4307569, 0.4022761, 1, 0, 0.1960784, 1,
1.807614, 1.560273, -0.2086419, 1, 0, 0.1921569, 1,
1.836074, -0.5273323, 2.192695, 1, 0, 0.1843137, 1,
1.887964, 1.004699, 1.496203, 1, 0, 0.1803922, 1,
1.909062, -1.258875, 0.3023718, 1, 0, 0.172549, 1,
1.932577, 0.3042365, 1.453393, 1, 0, 0.1686275, 1,
1.942503, -0.9300045, 0.2448127, 1, 0, 0.1607843, 1,
1.978935, -1.019366, 2.420692, 1, 0, 0.1568628, 1,
1.981331, 0.4097019, 3.241374, 1, 0, 0.1490196, 1,
2.015198, 0.3216379, 2.665161, 1, 0, 0.145098, 1,
2.085651, 1.247181, 1.619462, 1, 0, 0.1372549, 1,
2.105379, 0.157731, 0.6913309, 1, 0, 0.1333333, 1,
2.123749, 0.4060543, 2.75686, 1, 0, 0.1254902, 1,
2.143814, 1.06196, 2.079087, 1, 0, 0.1215686, 1,
2.164955, -1.784217, 3.450993, 1, 0, 0.1137255, 1,
2.186526, 1.366181, 0.7896476, 1, 0, 0.1098039, 1,
2.190439, -0.2244983, 0.2547806, 1, 0, 0.1019608, 1,
2.198857, -1.208078, 1.688919, 1, 0, 0.09411765, 1,
2.230073, -0.5151404, 0.9505112, 1, 0, 0.09019608, 1,
2.251625, 0.1367854, 1.714453, 1, 0, 0.08235294, 1,
2.266105, 0.1446308, 1.6025, 1, 0, 0.07843138, 1,
2.271085, -0.3582319, 2.027436, 1, 0, 0.07058824, 1,
2.292174, 0.195018, 1.781801, 1, 0, 0.06666667, 1,
2.413209, 2.610635, 0.5498211, 1, 0, 0.05882353, 1,
2.42464, 0.7518723, 2.167331, 1, 0, 0.05490196, 1,
2.465281, 1.307117, 1.287847, 1, 0, 0.04705882, 1,
2.497966, 0.6847841, 1.543495, 1, 0, 0.04313726, 1,
2.515733, 0.7770203, 1.7696, 1, 0, 0.03529412, 1,
2.543326, 0.7476335, 0.80827, 1, 0, 0.03137255, 1,
2.545195, 0.6143955, 0.7427153, 1, 0, 0.02352941, 1,
2.55092, 1.37243, 0.1852635, 1, 0, 0.01960784, 1,
2.637375, -0.7962228, 1.710631, 1, 0, 0.01176471, 1,
2.659972, -0.451926, -1.22215, 1, 0, 0.007843138, 1
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
-0.4798288, -4.153708, -7.472476, 0, -0.5, 0.5, 0.5,
-0.4798288, -4.153708, -7.472476, 1, -0.5, 0.5, 0.5,
-0.4798288, -4.153708, -7.472476, 1, 1.5, 0.5, 0.5,
-0.4798288, -4.153708, -7.472476, 0, 1.5, 0.5, 0.5
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
-4.684022, 0.2555504, -7.472476, 0, -0.5, 0.5, 0.5,
-4.684022, 0.2555504, -7.472476, 1, -0.5, 0.5, 0.5,
-4.684022, 0.2555504, -7.472476, 1, 1.5, 0.5, 0.5,
-4.684022, 0.2555504, -7.472476, 0, 1.5, 0.5, 0.5
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
-4.684022, -4.153708, -0.4791253, 0, -0.5, 0.5, 0.5,
-4.684022, -4.153708, -0.4791253, 1, -0.5, 0.5, 0.5,
-4.684022, -4.153708, -0.4791253, 1, 1.5, 0.5, 0.5,
-4.684022, -4.153708, -0.4791253, 0, 1.5, 0.5, 0.5
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
-3, -3.136186, -5.858625,
2, -3.136186, -5.858625,
-3, -3.136186, -5.858625,
-3, -3.305773, -6.127601,
-2, -3.136186, -5.858625,
-2, -3.305773, -6.127601,
-1, -3.136186, -5.858625,
-1, -3.305773, -6.127601,
0, -3.136186, -5.858625,
0, -3.305773, -6.127601,
1, -3.136186, -5.858625,
1, -3.305773, -6.127601,
2, -3.136186, -5.858625,
2, -3.305773, -6.127601
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
-3, -3.644947, -6.665551, 0, -0.5, 0.5, 0.5,
-3, -3.644947, -6.665551, 1, -0.5, 0.5, 0.5,
-3, -3.644947, -6.665551, 1, 1.5, 0.5, 0.5,
-3, -3.644947, -6.665551, 0, 1.5, 0.5, 0.5,
-2, -3.644947, -6.665551, 0, -0.5, 0.5, 0.5,
-2, -3.644947, -6.665551, 1, -0.5, 0.5, 0.5,
-2, -3.644947, -6.665551, 1, 1.5, 0.5, 0.5,
-2, -3.644947, -6.665551, 0, 1.5, 0.5, 0.5,
-1, -3.644947, -6.665551, 0, -0.5, 0.5, 0.5,
-1, -3.644947, -6.665551, 1, -0.5, 0.5, 0.5,
-1, -3.644947, -6.665551, 1, 1.5, 0.5, 0.5,
-1, -3.644947, -6.665551, 0, 1.5, 0.5, 0.5,
0, -3.644947, -6.665551, 0, -0.5, 0.5, 0.5,
0, -3.644947, -6.665551, 1, -0.5, 0.5, 0.5,
0, -3.644947, -6.665551, 1, 1.5, 0.5, 0.5,
0, -3.644947, -6.665551, 0, 1.5, 0.5, 0.5,
1, -3.644947, -6.665551, 0, -0.5, 0.5, 0.5,
1, -3.644947, -6.665551, 1, -0.5, 0.5, 0.5,
1, -3.644947, -6.665551, 1, 1.5, 0.5, 0.5,
1, -3.644947, -6.665551, 0, 1.5, 0.5, 0.5,
2, -3.644947, -6.665551, 0, -0.5, 0.5, 0.5,
2, -3.644947, -6.665551, 1, -0.5, 0.5, 0.5,
2, -3.644947, -6.665551, 1, 1.5, 0.5, 0.5,
2, -3.644947, -6.665551, 0, 1.5, 0.5, 0.5
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
-3.713824, -3, -5.858625,
-3.713824, 3, -5.858625,
-3.713824, -3, -5.858625,
-3.875524, -3, -6.127601,
-3.713824, -2, -5.858625,
-3.875524, -2, -6.127601,
-3.713824, -1, -5.858625,
-3.875524, -1, -6.127601,
-3.713824, 0, -5.858625,
-3.875524, 0, -6.127601,
-3.713824, 1, -5.858625,
-3.875524, 1, -6.127601,
-3.713824, 2, -5.858625,
-3.875524, 2, -6.127601,
-3.713824, 3, -5.858625,
-3.875524, 3, -6.127601
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
-4.198923, -3, -6.665551, 0, -0.5, 0.5, 0.5,
-4.198923, -3, -6.665551, 1, -0.5, 0.5, 0.5,
-4.198923, -3, -6.665551, 1, 1.5, 0.5, 0.5,
-4.198923, -3, -6.665551, 0, 1.5, 0.5, 0.5,
-4.198923, -2, -6.665551, 0, -0.5, 0.5, 0.5,
-4.198923, -2, -6.665551, 1, -0.5, 0.5, 0.5,
-4.198923, -2, -6.665551, 1, 1.5, 0.5, 0.5,
-4.198923, -2, -6.665551, 0, 1.5, 0.5, 0.5,
-4.198923, -1, -6.665551, 0, -0.5, 0.5, 0.5,
-4.198923, -1, -6.665551, 1, -0.5, 0.5, 0.5,
-4.198923, -1, -6.665551, 1, 1.5, 0.5, 0.5,
-4.198923, -1, -6.665551, 0, 1.5, 0.5, 0.5,
-4.198923, 0, -6.665551, 0, -0.5, 0.5, 0.5,
-4.198923, 0, -6.665551, 1, -0.5, 0.5, 0.5,
-4.198923, 0, -6.665551, 1, 1.5, 0.5, 0.5,
-4.198923, 0, -6.665551, 0, 1.5, 0.5, 0.5,
-4.198923, 1, -6.665551, 0, -0.5, 0.5, 0.5,
-4.198923, 1, -6.665551, 1, -0.5, 0.5, 0.5,
-4.198923, 1, -6.665551, 1, 1.5, 0.5, 0.5,
-4.198923, 1, -6.665551, 0, 1.5, 0.5, 0.5,
-4.198923, 2, -6.665551, 0, -0.5, 0.5, 0.5,
-4.198923, 2, -6.665551, 1, -0.5, 0.5, 0.5,
-4.198923, 2, -6.665551, 1, 1.5, 0.5, 0.5,
-4.198923, 2, -6.665551, 0, 1.5, 0.5, 0.5,
-4.198923, 3, -6.665551, 0, -0.5, 0.5, 0.5,
-4.198923, 3, -6.665551, 1, -0.5, 0.5, 0.5,
-4.198923, 3, -6.665551, 1, 1.5, 0.5, 0.5,
-4.198923, 3, -6.665551, 0, 1.5, 0.5, 0.5
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
-3.713824, -3.136186, -4,
-3.713824, -3.136186, 4,
-3.713824, -3.136186, -4,
-3.875524, -3.305773, -4,
-3.713824, -3.136186, -2,
-3.875524, -3.305773, -2,
-3.713824, -3.136186, 0,
-3.875524, -3.305773, 0,
-3.713824, -3.136186, 2,
-3.875524, -3.305773, 2,
-3.713824, -3.136186, 4,
-3.875524, -3.305773, 4
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
-4.198923, -3.644947, -4, 0, -0.5, 0.5, 0.5,
-4.198923, -3.644947, -4, 1, -0.5, 0.5, 0.5,
-4.198923, -3.644947, -4, 1, 1.5, 0.5, 0.5,
-4.198923, -3.644947, -4, 0, 1.5, 0.5, 0.5,
-4.198923, -3.644947, -2, 0, -0.5, 0.5, 0.5,
-4.198923, -3.644947, -2, 1, -0.5, 0.5, 0.5,
-4.198923, -3.644947, -2, 1, 1.5, 0.5, 0.5,
-4.198923, -3.644947, -2, 0, 1.5, 0.5, 0.5,
-4.198923, -3.644947, 0, 0, -0.5, 0.5, 0.5,
-4.198923, -3.644947, 0, 1, -0.5, 0.5, 0.5,
-4.198923, -3.644947, 0, 1, 1.5, 0.5, 0.5,
-4.198923, -3.644947, 0, 0, 1.5, 0.5, 0.5,
-4.198923, -3.644947, 2, 0, -0.5, 0.5, 0.5,
-4.198923, -3.644947, 2, 1, -0.5, 0.5, 0.5,
-4.198923, -3.644947, 2, 1, 1.5, 0.5, 0.5,
-4.198923, -3.644947, 2, 0, 1.5, 0.5, 0.5,
-4.198923, -3.644947, 4, 0, -0.5, 0.5, 0.5,
-4.198923, -3.644947, 4, 1, -0.5, 0.5, 0.5,
-4.198923, -3.644947, 4, 1, 1.5, 0.5, 0.5,
-4.198923, -3.644947, 4, 0, 1.5, 0.5, 0.5
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
-3.713824, -3.136186, -5.858625,
-3.713824, 3.647287, -5.858625,
-3.713824, -3.136186, 4.900375,
-3.713824, 3.647287, 4.900375,
-3.713824, -3.136186, -5.858625,
-3.713824, -3.136186, 4.900375,
-3.713824, 3.647287, -5.858625,
-3.713824, 3.647287, 4.900375,
-3.713824, -3.136186, -5.858625,
2.754166, -3.136186, -5.858625,
-3.713824, -3.136186, 4.900375,
2.754166, -3.136186, 4.900375,
-3.713824, 3.647287, -5.858625,
2.754166, 3.647287, -5.858625,
-3.713824, 3.647287, 4.900375,
2.754166, 3.647287, 4.900375,
2.754166, -3.136186, -5.858625,
2.754166, 3.647287, -5.858625,
2.754166, -3.136186, 4.900375,
2.754166, 3.647287, 4.900375,
2.754166, -3.136186, -5.858625,
2.754166, -3.136186, 4.900375,
2.754166, 3.647287, -5.858625,
2.754166, 3.647287, 4.900375
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
var radius = 7.619409;
var distance = 33.89961;
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
mvMatrix.translate( 0.4798288, -0.2555504, 0.4791253 );
mvMatrix.scale( 1.273696, 1.21446, 0.7657081 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.89961);
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
aminoethoxyvinylglyc<-read.table("aminoethoxyvinylglyc.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-aminoethoxyvinylglyc$V2
```

```
## Error in eval(expr, envir, enclos): object 'aminoethoxyvinylglyc' not found
```

```r
y<-aminoethoxyvinylglyc$V3
```

```
## Error in eval(expr, envir, enclos): object 'aminoethoxyvinylglyc' not found
```

```r
z<-aminoethoxyvinylglyc$V4
```

```
## Error in eval(expr, envir, enclos): object 'aminoethoxyvinylglyc' not found
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
-3.61963, 0.2597624, -0.7062483, 0, 0, 1, 1, 1,
-3.346947, 0.4387739, -1.347895, 1, 0, 0, 1, 1,
-3.052065, -0.3109285, -2.101909, 1, 0, 0, 1, 1,
-2.957642, -2.668768, -1.564598, 1, 0, 0, 1, 1,
-2.648831, -1.742349, -3.19414, 1, 0, 0, 1, 1,
-2.637781, 0.3917785, -3.117287, 1, 0, 0, 1, 1,
-2.550587, -2.031347, -2.788341, 0, 0, 0, 1, 1,
-2.402507, 0.4991588, -2.324569, 0, 0, 0, 1, 1,
-2.345644, -1.456865, -1.019519, 0, 0, 0, 1, 1,
-2.299681, -0.8384223, -2.141265, 0, 0, 0, 1, 1,
-2.272691, 0.5981571, -1.448675, 0, 0, 0, 1, 1,
-2.208069, 1.151374, 0.3236358, 0, 0, 0, 1, 1,
-2.20298, 0.9527989, 0.6977849, 0, 0, 0, 1, 1,
-2.147171, -0.07379515, -2.524502, 1, 1, 1, 1, 1,
-2.071197, -2.063968, -1.948081, 1, 1, 1, 1, 1,
-2.060805, 0.9469701, 0.8701479, 1, 1, 1, 1, 1,
-2.05197, -1.233804, -2.115638, 1, 1, 1, 1, 1,
-2.043697, -0.1062059, -2.982312, 1, 1, 1, 1, 1,
-2.011855, 0.7004965, -1.767659, 1, 1, 1, 1, 1,
-1.975076, 0.9642569, -1.916224, 1, 1, 1, 1, 1,
-1.973576, -0.280556, -1.073638, 1, 1, 1, 1, 1,
-1.968472, 0.2629526, -2.152888, 1, 1, 1, 1, 1,
-1.965681, 0.347997, -3.57454, 1, 1, 1, 1, 1,
-1.949132, 0.6653615, -1.427047, 1, 1, 1, 1, 1,
-1.942795, 0.5077166, -0.3813626, 1, 1, 1, 1, 1,
-1.899851, 1.028152, -2.002407, 1, 1, 1, 1, 1,
-1.893889, 1.221166, -0.5689259, 1, 1, 1, 1, 1,
-1.89335, -0.1601132, -1.308008, 1, 1, 1, 1, 1,
-1.880396, -0.1619355, -1.417657, 0, 0, 1, 1, 1,
-1.858873, -0.6875249, -2.160154, 1, 0, 0, 1, 1,
-1.841674, 0.5991681, -2.021013, 1, 0, 0, 1, 1,
-1.818669, -1.616099, -3.105226, 1, 0, 0, 1, 1,
-1.816259, -0.3232277, -2.927778, 1, 0, 0, 1, 1,
-1.790944, -0.2066222, -1.272482, 1, 0, 0, 1, 1,
-1.790425, 1.290638, -0.7946047, 0, 0, 0, 1, 1,
-1.785076, -0.08857118, -1.635459, 0, 0, 0, 1, 1,
-1.737854, -1.011037, -1.258909, 0, 0, 0, 1, 1,
-1.735752, -1.192825, -3.873879, 0, 0, 0, 1, 1,
-1.734005, -0.8080683, -1.053285, 0, 0, 0, 1, 1,
-1.731448, -0.1063291, -2.341013, 0, 0, 0, 1, 1,
-1.722671, -0.887493, -1.964949, 0, 0, 0, 1, 1,
-1.717229, -0.06427287, -0.6479508, 1, 1, 1, 1, 1,
-1.697476, -0.5236135, -2.881235, 1, 1, 1, 1, 1,
-1.66448, 1.069869, -0.209499, 1, 1, 1, 1, 1,
-1.658984, 0.2471579, -1.938605, 1, 1, 1, 1, 1,
-1.649654, 0.4862835, -1.250391, 1, 1, 1, 1, 1,
-1.641786, -0.6537485, -2.898552, 1, 1, 1, 1, 1,
-1.634118, 1.737459, -0.9707189, 1, 1, 1, 1, 1,
-1.631879, 2.599654, 0.5536585, 1, 1, 1, 1, 1,
-1.630504, 0.02395196, -1.648979, 1, 1, 1, 1, 1,
-1.62797, 2.463266, -2.967727, 1, 1, 1, 1, 1,
-1.612603, -1.433157, -3.233449, 1, 1, 1, 1, 1,
-1.606292, 0.2565335, -0.2218764, 1, 1, 1, 1, 1,
-1.595426, -1.879191, -0.4502695, 1, 1, 1, 1, 1,
-1.593393, -0.5666605, 0.6141021, 1, 1, 1, 1, 1,
-1.558058, 0.1196776, -0.8617857, 1, 1, 1, 1, 1,
-1.557047, 0.06329942, -0.3553113, 0, 0, 1, 1, 1,
-1.551919, 0.5086761, -2.376526, 1, 0, 0, 1, 1,
-1.551709, 0.3459659, -0.3797685, 1, 0, 0, 1, 1,
-1.536428, -0.7811158, -3.705604, 1, 0, 0, 1, 1,
-1.530401, -0.2748836, -1.87429, 1, 0, 0, 1, 1,
-1.513814, 0.6836507, 1.1257, 1, 0, 0, 1, 1,
-1.503139, 1.530483, 0.3167691, 0, 0, 0, 1, 1,
-1.497842, -0.2409056, -3.349531, 0, 0, 0, 1, 1,
-1.497124, -1.318542, -2.932378, 0, 0, 0, 1, 1,
-1.488659, 1.320701, -1.655253, 0, 0, 0, 1, 1,
-1.480637, 1.969098, -0.7572393, 0, 0, 0, 1, 1,
-1.457691, -1.098345, -2.59127, 0, 0, 0, 1, 1,
-1.454619, 0.8613879, -1.247087, 0, 0, 0, 1, 1,
-1.451598, -1.364686, -2.792421, 1, 1, 1, 1, 1,
-1.449526, -1.126742, -0.2887072, 1, 1, 1, 1, 1,
-1.448083, 0.1702728, -0.7103679, 1, 1, 1, 1, 1,
-1.439783, 2.826388, -0.2188562, 1, 1, 1, 1, 1,
-1.437409, 1.064015, -0.5092019, 1, 1, 1, 1, 1,
-1.424832, 0.4734862, -2.490529, 1, 1, 1, 1, 1,
-1.406965, 0.2040035, -1.157579, 1, 1, 1, 1, 1,
-1.404379, 0.3801546, 1.990016, 1, 1, 1, 1, 1,
-1.392908, -0.2755902, -0.6416846, 1, 1, 1, 1, 1,
-1.382928, 0.508338, -1.74341, 1, 1, 1, 1, 1,
-1.380688, -1.235834, -2.41138, 1, 1, 1, 1, 1,
-1.374631, 0.2774899, -2.749184, 1, 1, 1, 1, 1,
-1.373527, -0.7366318, -2.186812, 1, 1, 1, 1, 1,
-1.370802, -0.2861399, -2.460164, 1, 1, 1, 1, 1,
-1.370483, -0.5092832, -1.062626, 1, 1, 1, 1, 1,
-1.369993, -0.2450757, -2.489274, 0, 0, 1, 1, 1,
-1.367852, 0.07614728, -1.749724, 1, 0, 0, 1, 1,
-1.362043, -0.0005344261, -2.329429, 1, 0, 0, 1, 1,
-1.354601, 0.3024573, -1.105927, 1, 0, 0, 1, 1,
-1.354195, 0.2490984, -1.709119, 1, 0, 0, 1, 1,
-1.347753, 0.12901, -0.7719791, 1, 0, 0, 1, 1,
-1.344572, 0.1991404, -0.7634601, 0, 0, 0, 1, 1,
-1.337575, -0.08431081, -0.6799014, 0, 0, 0, 1, 1,
-1.335145, 0.4993559, -2.112503, 0, 0, 0, 1, 1,
-1.33165, 1.14469, -0.5630121, 0, 0, 0, 1, 1,
-1.316937, 0.5919897, -1.239721, 0, 0, 0, 1, 1,
-1.303247, 0.2480056, -1.762719, 0, 0, 0, 1, 1,
-1.301922, 0.6090536, -1.599808, 0, 0, 0, 1, 1,
-1.300993, -0.8332669, -2.303376, 1, 1, 1, 1, 1,
-1.291674, 0.4733119, -1.753772, 1, 1, 1, 1, 1,
-1.287598, 1.310146, -2.064808, 1, 1, 1, 1, 1,
-1.284885, -0.2845073, -2.163736, 1, 1, 1, 1, 1,
-1.283053, 2.436879, -0.2314061, 1, 1, 1, 1, 1,
-1.281867, 0.008311947, -2.641473, 1, 1, 1, 1, 1,
-1.277808, -1.475903, -2.910544, 1, 1, 1, 1, 1,
-1.272714, -0.6018029, -2.38295, 1, 1, 1, 1, 1,
-1.26978, 0.1081171, -2.050051, 1, 1, 1, 1, 1,
-1.267065, -1.231445, -3.73388, 1, 1, 1, 1, 1,
-1.256384, -1.252845, -1.345996, 1, 1, 1, 1, 1,
-1.255038, 0.1309632, -0.8302816, 1, 1, 1, 1, 1,
-1.244641, 0.7457065, 0.0992893, 1, 1, 1, 1, 1,
-1.242936, 0.07518472, -1.92222, 1, 1, 1, 1, 1,
-1.236707, 0.4898033, -1.026517, 1, 1, 1, 1, 1,
-1.228611, -0.2440806, -1.374743, 0, 0, 1, 1, 1,
-1.224136, -0.313947, -1.460206, 1, 0, 0, 1, 1,
-1.220553, -0.5696523, -1.58041, 1, 0, 0, 1, 1,
-1.217012, 0.7400403, -0.5307493, 1, 0, 0, 1, 1,
-1.215299, 0.2366071, -2.3493, 1, 0, 0, 1, 1,
-1.211289, -1.157954, -0.9597852, 1, 0, 0, 1, 1,
-1.196609, 0.01727295, -2.066163, 0, 0, 0, 1, 1,
-1.195359, -1.347565, -3.188032, 0, 0, 0, 1, 1,
-1.187877, 0.6866742, -1.52387, 0, 0, 0, 1, 1,
-1.178593, 1.412378, 1.501179, 0, 0, 0, 1, 1,
-1.164779, -1.041371, -0.6392375, 0, 0, 0, 1, 1,
-1.162165, 0.2537268, -1.779254, 0, 0, 0, 1, 1,
-1.154533, -0.18921, -3.348433, 0, 0, 0, 1, 1,
-1.154108, 1.556688, -0.4117587, 1, 1, 1, 1, 1,
-1.153325, 0.480038, -0.3918825, 1, 1, 1, 1, 1,
-1.153175, -0.2849738, -2.525273, 1, 1, 1, 1, 1,
-1.147766, -0.6460539, -2.294348, 1, 1, 1, 1, 1,
-1.140165, 0.8323513, -1.422013, 1, 1, 1, 1, 1,
-1.138643, 0.0202406, -1.701473, 1, 1, 1, 1, 1,
-1.117117, 1.439992, -0.5136068, 1, 1, 1, 1, 1,
-1.115338, 0.5657476, -0.4379371, 1, 1, 1, 1, 1,
-1.103269, -1.046417, -3.461584, 1, 1, 1, 1, 1,
-1.100951, -0.1877921, -1.823293, 1, 1, 1, 1, 1,
-1.100363, 0.008811167, -1.449327, 1, 1, 1, 1, 1,
-1.100255, 0.1804984, -0.3318447, 1, 1, 1, 1, 1,
-1.097636, -1.696425, -3.523201, 1, 1, 1, 1, 1,
-1.092985, -1.365718, -2.252136, 1, 1, 1, 1, 1,
-1.084049, -1.043801, -3.022939, 1, 1, 1, 1, 1,
-1.07337, -1.276259, -2.426162, 0, 0, 1, 1, 1,
-1.072736, -1.017963, -1.637083, 1, 0, 0, 1, 1,
-1.071808, -0.206629, -2.814908, 1, 0, 0, 1, 1,
-1.068904, 0.5814854, -1.746217, 1, 0, 0, 1, 1,
-1.064188, -0.1787468, -2.361757, 1, 0, 0, 1, 1,
-1.063444, 0.1760354, -3.603232, 1, 0, 0, 1, 1,
-1.061307, -0.5449981, -3.920415, 0, 0, 0, 1, 1,
-1.054259, -1.043397, -3.220581, 0, 0, 0, 1, 1,
-1.047288, 1.133112, -2.054104, 0, 0, 0, 1, 1,
-1.046742, 0.04996693, -2.995417, 0, 0, 0, 1, 1,
-1.044687, -0.1079083, -2.381612, 0, 0, 0, 1, 1,
-1.04099, 0.03982985, -0.9571415, 0, 0, 0, 1, 1,
-1.033453, -1.637723, -1.756436, 0, 0, 0, 1, 1,
-1.029905, 2.311654, 0.2943937, 1, 1, 1, 1, 1,
-1.027354, 0.001615236, -4.588094, 1, 1, 1, 1, 1,
-1.017811, 1.988395, -0.5383373, 1, 1, 1, 1, 1,
-1.014755, 0.4150782, -1.028018, 1, 1, 1, 1, 1,
-1.013381, -0.6324064, -3.386623, 1, 1, 1, 1, 1,
-1.012969, 0.5463036, -2.155696, 1, 1, 1, 1, 1,
-1.011152, -1.093583, -2.301088, 1, 1, 1, 1, 1,
-1.009003, -0.889954, -1.44015, 1, 1, 1, 1, 1,
-0.9973502, -0.9608566, -4.584552, 1, 1, 1, 1, 1,
-0.9957721, 1.066763, -1.452557, 1, 1, 1, 1, 1,
-0.9938228, -0.5275211, -2.306359, 1, 1, 1, 1, 1,
-0.9883869, 2.118596, -1.32564, 1, 1, 1, 1, 1,
-0.9756953, 1.545087, 0.3756898, 1, 1, 1, 1, 1,
-0.973087, 0.03514744, -0.6862637, 1, 1, 1, 1, 1,
-0.971917, 1.722142, -1.258656, 1, 1, 1, 1, 1,
-0.9541389, 0.7995043, 0.5104685, 0, 0, 1, 1, 1,
-0.9512825, -0.3316042, -2.526264, 1, 0, 0, 1, 1,
-0.9443477, 0.5387936, -1.654731, 1, 0, 0, 1, 1,
-0.9371614, 1.50866, -0.7135429, 1, 0, 0, 1, 1,
-0.9366648, 1.39761, -1.006188, 1, 0, 0, 1, 1,
-0.9335055, -1.054945, -3.178981, 1, 0, 0, 1, 1,
-0.9261856, -1.588669, -4.000754, 0, 0, 0, 1, 1,
-0.9247472, -0.4373823, -2.172865, 0, 0, 0, 1, 1,
-0.919832, -0.5668756, -0.957001, 0, 0, 0, 1, 1,
-0.9181567, -2.176089, -0.4595244, 0, 0, 0, 1, 1,
-0.9172941, -0.139534, 0.251949, 0, 0, 0, 1, 1,
-0.9160531, 1.969047, -1.093326, 0, 0, 0, 1, 1,
-0.912171, -0.307085, -2.043855, 0, 0, 0, 1, 1,
-0.9117746, -0.05131864, -2.20993, 1, 1, 1, 1, 1,
-0.9116158, -0.1680988, -0.5251358, 1, 1, 1, 1, 1,
-0.9116036, 1.025712, -0.4250555, 1, 1, 1, 1, 1,
-0.9113119, 1.593008, 0.02568241, 1, 1, 1, 1, 1,
-0.9081659, 2.204705, 0.6208471, 1, 1, 1, 1, 1,
-0.9038255, 1.661687, -0.9992993, 1, 1, 1, 1, 1,
-0.9022985, -0.07458173, -2.863081, 1, 1, 1, 1, 1,
-0.8997715, 1.965378, 0.6039506, 1, 1, 1, 1, 1,
-0.8901227, 0.6723496, -0.1795208, 1, 1, 1, 1, 1,
-0.8868043, 0.645521, -1.620794, 1, 1, 1, 1, 1,
-0.8804675, 0.2722146, -0.2043816, 1, 1, 1, 1, 1,
-0.8778754, -0.5820804, -2.227157, 1, 1, 1, 1, 1,
-0.8755382, -0.7915866, -2.127507, 1, 1, 1, 1, 1,
-0.8753949, 0.09050092, 0.5699987, 1, 1, 1, 1, 1,
-0.8570845, 0.1691781, -0.2560726, 1, 1, 1, 1, 1,
-0.8550258, 0.9263362, -2.114956, 0, 0, 1, 1, 1,
-0.8526583, 1.323654, -0.6132305, 1, 0, 0, 1, 1,
-0.8524482, 0.8909614, -0.4007565, 1, 0, 0, 1, 1,
-0.8515227, -1.922124, -1.57729, 1, 0, 0, 1, 1,
-0.8498917, 1.334955, -0.7963101, 1, 0, 0, 1, 1,
-0.8489343, -0.284959, -2.000923, 1, 0, 0, 1, 1,
-0.8463727, -0.5443434, -2.434741, 0, 0, 0, 1, 1,
-0.8433472, 0.2840109, -1.804465, 0, 0, 0, 1, 1,
-0.8429983, 0.2252318, -0.3135071, 0, 0, 0, 1, 1,
-0.838009, -0.3131533, -1.905065, 0, 0, 0, 1, 1,
-0.8345832, -0.002915592, -0.6270593, 0, 0, 0, 1, 1,
-0.8313298, -1.831447, -1.716221, 0, 0, 0, 1, 1,
-0.8286153, 1.451217, -2.931303, 0, 0, 0, 1, 1,
-0.8239328, -0.8929783, -3.155719, 1, 1, 1, 1, 1,
-0.8187505, 0.2786256, -2.12598, 1, 1, 1, 1, 1,
-0.8080027, -0.297505, -3.237459, 1, 1, 1, 1, 1,
-0.8021111, 0.7284048, -2.273722, 1, 1, 1, 1, 1,
-0.8010221, 0.305419, 0.6565355, 1, 1, 1, 1, 1,
-0.7990137, 0.1394445, -1.960334, 1, 1, 1, 1, 1,
-0.7983453, 0.7797056, 1.012508, 1, 1, 1, 1, 1,
-0.7955402, -2.749901, -3.538346, 1, 1, 1, 1, 1,
-0.7930169, -0.1981143, -2.80734, 1, 1, 1, 1, 1,
-0.7926297, 0.5376136, -0.8150262, 1, 1, 1, 1, 1,
-0.7889753, -0.6747336, -0.9447163, 1, 1, 1, 1, 1,
-0.781951, -1.288422, -2.68295, 1, 1, 1, 1, 1,
-0.7784557, -2.92251, -3.182601, 1, 1, 1, 1, 1,
-0.7747102, -0.9452835, -1.603672, 1, 1, 1, 1, 1,
-0.7657386, 0.1262028, -2.187146, 1, 1, 1, 1, 1,
-0.7611219, -0.9550833, -0.8577346, 0, 0, 1, 1, 1,
-0.7587788, 0.8177984, -1.79059, 1, 0, 0, 1, 1,
-0.7578471, -0.7404187, -1.850496, 1, 0, 0, 1, 1,
-0.7538254, 0.5862215, 1.30261, 1, 0, 0, 1, 1,
-0.7475021, 0.38811, -0.5027269, 1, 0, 0, 1, 1,
-0.7459841, -0.5278919, 0.4136941, 1, 0, 0, 1, 1,
-0.7455028, -0.9588261, -2.967574, 0, 0, 0, 1, 1,
-0.7451521, -0.4939653, -2.478008, 0, 0, 0, 1, 1,
-0.7431896, 0.5110435, -1.493052, 0, 0, 0, 1, 1,
-0.7428329, -0.01287898, 0.3806317, 0, 0, 0, 1, 1,
-0.7417348, -0.6347533, -2.95834, 0, 0, 0, 1, 1,
-0.7413721, 0.06962974, -2.200737, 0, 0, 0, 1, 1,
-0.7404793, -0.8254707, -2.872795, 0, 0, 0, 1, 1,
-0.7397363, -1.165983, -3.102387, 1, 1, 1, 1, 1,
-0.7346463, 2.004038, -1.2577, 1, 1, 1, 1, 1,
-0.7332094, -0.4172237, -1.284995, 1, 1, 1, 1, 1,
-0.7295553, -0.8391139, -3.827503, 1, 1, 1, 1, 1,
-0.7138579, 1.503029, -0.5076864, 1, 1, 1, 1, 1,
-0.7137322, -1.343735, -1.195104, 1, 1, 1, 1, 1,
-0.7133101, -0.3397685, -1.396708, 1, 1, 1, 1, 1,
-0.709637, 0.6494671, 1.177267, 1, 1, 1, 1, 1,
-0.7038149, 0.2168911, -0.1316577, 1, 1, 1, 1, 1,
-0.7023906, -0.5231837, -2.716565, 1, 1, 1, 1, 1,
-0.7021474, 0.03238946, -0.3222254, 1, 1, 1, 1, 1,
-0.7020913, -1.27897, -3.77359, 1, 1, 1, 1, 1,
-0.7016923, 1.405974, -0.8058903, 1, 1, 1, 1, 1,
-0.6997891, 1.195505, -1.132631, 1, 1, 1, 1, 1,
-0.6963767, -0.4931065, -2.511314, 1, 1, 1, 1, 1,
-0.6963696, 1.586927, 0.1589786, 0, 0, 1, 1, 1,
-0.6938219, -0.693716, -2.793986, 1, 0, 0, 1, 1,
-0.6936864, 0.3292105, -1.117349, 1, 0, 0, 1, 1,
-0.6898867, 0.6186058, -1.281908, 1, 0, 0, 1, 1,
-0.6876807, -0.8715987, -2.72144, 1, 0, 0, 1, 1,
-0.6837986, -0.476565, -2.733455, 1, 0, 0, 1, 1,
-0.6792029, 1.004989, -0.7771493, 0, 0, 0, 1, 1,
-0.6723304, 0.175222, -1.173732, 0, 0, 0, 1, 1,
-0.6656566, 0.4259697, -0.5350444, 0, 0, 0, 1, 1,
-0.6537706, 0.2806015, 0.02310058, 0, 0, 0, 1, 1,
-0.6472182, -0.791155, -2.590027, 0, 0, 0, 1, 1,
-0.6436693, 0.3397798, -2.72884, 0, 0, 0, 1, 1,
-0.6387563, 0.07308446, -1.466153, 0, 0, 0, 1, 1,
-0.6379484, -1.027435, -3.608276, 1, 1, 1, 1, 1,
-0.6346363, -0.07922465, -1.752106, 1, 1, 1, 1, 1,
-0.6231138, -0.8970475, -1.188811, 1, 1, 1, 1, 1,
-0.6228549, -0.3634064, -1.827267, 1, 1, 1, 1, 1,
-0.6205627, -1.269159, -3.001902, 1, 1, 1, 1, 1,
-0.6159829, -2.052068, -4.695815, 1, 1, 1, 1, 1,
-0.6159171, 0.1917823, -1.343574, 1, 1, 1, 1, 1,
-0.6097971, 0.6984786, -1.898267, 1, 1, 1, 1, 1,
-0.6097749, 1.141429, -2.610795, 1, 1, 1, 1, 1,
-0.604287, 1.258695, -1.364717, 1, 1, 1, 1, 1,
-0.6028359, 1.768745, 0.2286117, 1, 1, 1, 1, 1,
-0.6018546, 0.4672158, -0.4812278, 1, 1, 1, 1, 1,
-0.5970236, 0.01620403, -1.24968, 1, 1, 1, 1, 1,
-0.5880145, 0.9138901, -0.01590266, 1, 1, 1, 1, 1,
-0.5862566, 0.3823822, -1.76271, 1, 1, 1, 1, 1,
-0.5808699, 0.1598282, -0.101516, 0, 0, 1, 1, 1,
-0.5803762, -0.5213813, -3.966654, 1, 0, 0, 1, 1,
-0.5746606, -0.8472072, -2.474116, 1, 0, 0, 1, 1,
-0.5733225, 0.7422929, -1.85056, 1, 0, 0, 1, 1,
-0.5706145, 1.222057, -2.058214, 1, 0, 0, 1, 1,
-0.5694305, 0.7727351, -0.5715111, 1, 0, 0, 1, 1,
-0.5677907, 1.128858, -0.5147725, 0, 0, 0, 1, 1,
-0.5671848, 0.3515663, -0.1465345, 0, 0, 0, 1, 1,
-0.5621192, 0.02989183, 0.8022699, 0, 0, 0, 1, 1,
-0.5572838, 0.312171, -1.777776, 0, 0, 0, 1, 1,
-0.554612, -0.06708879, -1.323759, 0, 0, 0, 1, 1,
-0.5347789, 0.04346975, -0.6640199, 0, 0, 0, 1, 1,
-0.533964, -1.298366, -4.444806, 0, 0, 0, 1, 1,
-0.5290226, -0.1082248, -2.473699, 1, 1, 1, 1, 1,
-0.5278288, -1.130488, -0.7655687, 1, 1, 1, 1, 1,
-0.5240098, -0.6688561, -2.607792, 1, 1, 1, 1, 1,
-0.5197013, -0.430433, -1.5175, 1, 1, 1, 1, 1,
-0.5099205, 0.9649863, -0.3043437, 1, 1, 1, 1, 1,
-0.5071062, -0.9462992, -1.363149, 1, 1, 1, 1, 1,
-0.5038365, 1.251925, 0.1373567, 1, 1, 1, 1, 1,
-0.5005773, -0.7730124, -2.178399, 1, 1, 1, 1, 1,
-0.4964633, 0.5577733, -1.623998, 1, 1, 1, 1, 1,
-0.4940135, 0.7858163, -1.42952, 1, 1, 1, 1, 1,
-0.4929679, 1.254084, 0.9192166, 1, 1, 1, 1, 1,
-0.4909231, 0.1421721, -0.4314261, 1, 1, 1, 1, 1,
-0.4817587, -0.1379905, -0.4270742, 1, 1, 1, 1, 1,
-0.4806664, -0.1574809, -5.084583, 1, 1, 1, 1, 1,
-0.4787379, -0.7570491, -2.631964, 1, 1, 1, 1, 1,
-0.4725058, 0.7387138, -1.441132, 0, 0, 1, 1, 1,
-0.4709005, 1.6996, 0.4585303, 1, 0, 0, 1, 1,
-0.4695632, 0.04327721, -2.004001, 1, 0, 0, 1, 1,
-0.4673096, -0.2383216, -1.280783, 1, 0, 0, 1, 1,
-0.4634555, -0.2712466, -3.391436, 1, 0, 0, 1, 1,
-0.4623093, 1.090918, -0.5084956, 1, 0, 0, 1, 1,
-0.4601527, -2.184719, -3.583384, 0, 0, 0, 1, 1,
-0.452052, -0.7075154, -3.719224, 0, 0, 0, 1, 1,
-0.4491155, 0.9148952, -0.3017254, 0, 0, 0, 1, 1,
-0.4454401, -0.2092583, -2.852478, 0, 0, 0, 1, 1,
-0.4440779, 1.409385, -0.9048012, 0, 0, 0, 1, 1,
-0.4407806, 1.586682, 0.6242952, 0, 0, 0, 1, 1,
-0.4402421, -1.170281, -3.17177, 0, 0, 0, 1, 1,
-0.4396397, -2.137737, -1.974244, 1, 1, 1, 1, 1,
-0.4374246, -0.3072435, -1.395992, 1, 1, 1, 1, 1,
-0.4366302, 0.2930733, -1.466792, 1, 1, 1, 1, 1,
-0.4341545, 1.560373, 0.009979058, 1, 1, 1, 1, 1,
-0.4340219, -0.08574999, -2.872239, 1, 1, 1, 1, 1,
-0.4328249, 0.2061277, -0.8856134, 1, 1, 1, 1, 1,
-0.4250009, 0.7187495, -0.7567937, 1, 1, 1, 1, 1,
-0.4230499, 0.3864881, -0.6317117, 1, 1, 1, 1, 1,
-0.4165382, -1.184406, -2.166827, 1, 1, 1, 1, 1,
-0.416366, -1.112546, -2.724586, 1, 1, 1, 1, 1,
-0.4119383, 2.330751, -0.6653104, 1, 1, 1, 1, 1,
-0.4114946, 0.4806009, -1.46157, 1, 1, 1, 1, 1,
-0.4089668, 0.9324152, 0.4712464, 1, 1, 1, 1, 1,
-0.4076748, -0.06962272, -4.246901, 1, 1, 1, 1, 1,
-0.4075394, 0.5777854, -0.5043751, 1, 1, 1, 1, 1,
-0.4046518, -2.812725, -4.785756, 0, 0, 1, 1, 1,
-0.4044908, -0.2768435, -2.232556, 1, 0, 0, 1, 1,
-0.4020122, -2.432006, -3.031609, 1, 0, 0, 1, 1,
-0.399885, 1.493299, -1.203029, 1, 0, 0, 1, 1,
-0.399694, 1.431258, -0.4121879, 1, 0, 0, 1, 1,
-0.3993309, -0.01249454, -1.682304, 1, 0, 0, 1, 1,
-0.3982921, 1.406294, 0.8907176, 0, 0, 0, 1, 1,
-0.3963481, -0.269264, -1.161943, 0, 0, 0, 1, 1,
-0.3914716, -0.07981797, -2.956965, 0, 0, 0, 1, 1,
-0.3863578, 1.753111, 0.2488208, 0, 0, 0, 1, 1,
-0.3847628, 0.9873016, 0.3777103, 0, 0, 0, 1, 1,
-0.3802105, -0.7213706, -1.622103, 0, 0, 0, 1, 1,
-0.3760827, -0.2195396, -2.14496, 0, 0, 0, 1, 1,
-0.3709848, 0.3959058, -0.2226167, 1, 1, 1, 1, 1,
-0.3642068, -0.3730471, -3.113101, 1, 1, 1, 1, 1,
-0.3618761, -0.5475134, -2.564806, 1, 1, 1, 1, 1,
-0.3615454, -0.5686797, -3.204586, 1, 1, 1, 1, 1,
-0.3572299, 0.751767, -0.4772345, 1, 1, 1, 1, 1,
-0.3505445, 0.2811535, -0.5194521, 1, 1, 1, 1, 1,
-0.3477765, 0.1789242, -0.4861066, 1, 1, 1, 1, 1,
-0.3472786, 0.04539427, -1.874577, 1, 1, 1, 1, 1,
-0.3460642, 0.9988483, -0.0001631463, 1, 1, 1, 1, 1,
-0.344241, -1.437578, -2.779642, 1, 1, 1, 1, 1,
-0.3429829, -1.159642, -2.816385, 1, 1, 1, 1, 1,
-0.3422131, 0.02495039, -1.865101, 1, 1, 1, 1, 1,
-0.3348233, 0.2941753, -0.233815, 1, 1, 1, 1, 1,
-0.3344103, -0.8476007, -0.927785, 1, 1, 1, 1, 1,
-0.3322486, -0.007649873, -2.766633, 1, 1, 1, 1, 1,
-0.3284344, 0.9481372, 1.748563, 0, 0, 1, 1, 1,
-0.3170319, -0.8837469, -2.32378, 1, 0, 0, 1, 1,
-0.3152412, 0.02500513, -1.124958, 1, 0, 0, 1, 1,
-0.3147819, -0.5376914, -1.181282, 1, 0, 0, 1, 1,
-0.3104487, -0.01245873, -2.474192, 1, 0, 0, 1, 1,
-0.3080446, -0.5892192, -3.79686, 1, 0, 0, 1, 1,
-0.3071162, -1.295053, -2.990578, 0, 0, 0, 1, 1,
-0.3049839, -0.3621823, -3.068799, 0, 0, 0, 1, 1,
-0.3038957, 0.6824784, -1.74269, 0, 0, 0, 1, 1,
-0.3038843, -2.179829, -2.28806, 0, 0, 0, 1, 1,
-0.3023821, 0.7696958, -1.524935, 0, 0, 0, 1, 1,
-0.3017614, 0.1965076, -1.184937, 0, 0, 0, 1, 1,
-0.3005092, 0.9930741, 0.7308441, 0, 0, 0, 1, 1,
-0.2967067, -0.174371, -1.308666, 1, 1, 1, 1, 1,
-0.2926775, -0.5351221, -3.515286, 1, 1, 1, 1, 1,
-0.2902165, -0.09008373, 0.07993443, 1, 1, 1, 1, 1,
-0.2902041, 0.2953827, -1.284057, 1, 1, 1, 1, 1,
-0.2899764, 0.9857357, -0.4155475, 1, 1, 1, 1, 1,
-0.288914, 0.1053161, -0.1217205, 1, 1, 1, 1, 1,
-0.2875589, 0.652748, 0.2811689, 1, 1, 1, 1, 1,
-0.2846981, 0.1563918, -1.79562, 1, 1, 1, 1, 1,
-0.2823805, 1.582679, -0.3582625, 1, 1, 1, 1, 1,
-0.2794892, 1.041444, -0.05259678, 1, 1, 1, 1, 1,
-0.2794212, -0.3599289, -2.570593, 1, 1, 1, 1, 1,
-0.2744085, -0.6337405, -1.729469, 1, 1, 1, 1, 1,
-0.2736222, 0.4402918, 0.7645956, 1, 1, 1, 1, 1,
-0.2730018, -0.8639205, -2.274653, 1, 1, 1, 1, 1,
-0.2719505, 1.245336, -0.4474301, 1, 1, 1, 1, 1,
-0.27068, -0.0808659, -1.68847, 0, 0, 1, 1, 1,
-0.2695548, -0.1687465, -3.553149, 1, 0, 0, 1, 1,
-0.266364, 0.7694708, 1.368497, 1, 0, 0, 1, 1,
-0.2605161, -0.7453079, -2.492497, 1, 0, 0, 1, 1,
-0.2595312, 1.34216, 0.0363223, 1, 0, 0, 1, 1,
-0.2579064, -1.698185, -2.903247, 1, 0, 0, 1, 1,
-0.2556864, 0.5457661, -0.8585517, 0, 0, 0, 1, 1,
-0.2531132, -0.3037378, -0.755649, 0, 0, 0, 1, 1,
-0.2487294, 1.021035, -0.7727627, 0, 0, 0, 1, 1,
-0.2464335, 0.7613369, 0.1772983, 0, 0, 0, 1, 1,
-0.2430384, 1.519806, -0.3666215, 0, 0, 0, 1, 1,
-0.2428266, -1.279306, -0.9947105, 0, 0, 0, 1, 1,
-0.2419023, 0.2522031, -0.5239724, 0, 0, 0, 1, 1,
-0.2338964, -0.270694, -4.072761, 1, 1, 1, 1, 1,
-0.2297006, 2.235193, -1.320533, 1, 1, 1, 1, 1,
-0.2263912, 1.161054, -0.6657843, 1, 1, 1, 1, 1,
-0.2192498, -0.1955765, -2.517197, 1, 1, 1, 1, 1,
-0.2155326, -1.218032, -3.185225, 1, 1, 1, 1, 1,
-0.2137639, 0.2706769, -1.558314, 1, 1, 1, 1, 1,
-0.2128855, -0.2814074, -1.868168, 1, 1, 1, 1, 1,
-0.2103212, -0.5818628, -3.374724, 1, 1, 1, 1, 1,
-0.2057589, -0.9744791, -2.042752, 1, 1, 1, 1, 1,
-0.2031223, 1.273815, -2.604891, 1, 1, 1, 1, 1,
-0.2008951, 0.1216971, -0.8522549, 1, 1, 1, 1, 1,
-0.1939173, 1.216785, 2.551572, 1, 1, 1, 1, 1,
-0.1935684, -0.3826256, -5.701941, 1, 1, 1, 1, 1,
-0.1897011, -0.5477155, -2.992794, 1, 1, 1, 1, 1,
-0.1870032, 0.5530925, 0.2994842, 1, 1, 1, 1, 1,
-0.1847767, 0.09107748, -1.995328, 0, 0, 1, 1, 1,
-0.1843414, 0.383973, 1.148394, 1, 0, 0, 1, 1,
-0.1814543, -2.106014, -2.444538, 1, 0, 0, 1, 1,
-0.1783545, 1.744869, -0.4553688, 1, 0, 0, 1, 1,
-0.1735817, -0.602701, -2.048634, 1, 0, 0, 1, 1,
-0.173422, 0.413132, -0.2766332, 1, 0, 0, 1, 1,
-0.1700269, 0.4501742, 0.3780684, 0, 0, 0, 1, 1,
-0.1695793, 1.78053, 0.6039405, 0, 0, 0, 1, 1,
-0.1654807, 0.6298228, -0.2701635, 0, 0, 0, 1, 1,
-0.1606747, 0.3559752, 0.0897092, 0, 0, 0, 1, 1,
-0.1591575, -0.8806117, -4.309342, 0, 0, 0, 1, 1,
-0.1569102, -0.4076465, -2.102792, 0, 0, 0, 1, 1,
-0.1567845, 1.767283, 1.259383, 0, 0, 0, 1, 1,
-0.1545048, 0.2594414, -0.7599217, 1, 1, 1, 1, 1,
-0.1500383, 0.4094009, -0.1841718, 1, 1, 1, 1, 1,
-0.146112, 1.247208, -1.056869, 1, 1, 1, 1, 1,
-0.1438865, -0.7031274, -2.798004, 1, 1, 1, 1, 1,
-0.1409584, -0.1410202, -3.24753, 1, 1, 1, 1, 1,
-0.1383211, 0.4495175, 0.8586904, 1, 1, 1, 1, 1,
-0.1382365, -0.8373154, -4.46663, 1, 1, 1, 1, 1,
-0.1382038, 0.2524915, -0.8467003, 1, 1, 1, 1, 1,
-0.1367166, 0.3691229, 0.8376693, 1, 1, 1, 1, 1,
-0.1218426, 0.8661262, 1.14893, 1, 1, 1, 1, 1,
-0.1207853, -0.5798499, -3.131664, 1, 1, 1, 1, 1,
-0.1173865, 0.4303119, 0.5103298, 1, 1, 1, 1, 1,
-0.1112632, -1.138266, -3.399479, 1, 1, 1, 1, 1,
-0.101243, 1.826036, -0.4995313, 1, 1, 1, 1, 1,
-0.1004577, 0.7133116, 0.653098, 1, 1, 1, 1, 1,
-0.1003149, 0.5162566, 0.2603177, 0, 0, 1, 1, 1,
-0.09771117, 0.9491017, -0.02921574, 1, 0, 0, 1, 1,
-0.09635201, -1.253282, -3.103182, 1, 0, 0, 1, 1,
-0.09015614, -0.2585514, -2.442849, 1, 0, 0, 1, 1,
-0.08960585, -1.315183, -2.115802, 1, 0, 0, 1, 1,
-0.08929622, -0.9642476, -2.960628, 1, 0, 0, 1, 1,
-0.08647847, 0.782595, -1.050889, 0, 0, 0, 1, 1,
-0.08599874, 0.4425511, -0.1515009, 0, 0, 0, 1, 1,
-0.08589512, -0.3052958, -2.433322, 0, 0, 0, 1, 1,
-0.08051846, 0.2487797, -1.14361, 0, 0, 0, 1, 1,
-0.07706632, -0.2401979, -4.01841, 0, 0, 0, 1, 1,
-0.07360277, 0.8255669, -0.3928953, 0, 0, 0, 1, 1,
-0.07196242, -1.049541, -4.404654, 0, 0, 0, 1, 1,
-0.06609689, -0.5929173, -4.242824, 1, 1, 1, 1, 1,
-0.06571595, -0.2713895, -3.456269, 1, 1, 1, 1, 1,
-0.06439304, 0.7831224, -0.5994069, 1, 1, 1, 1, 1,
-0.06236956, 0.7390863, 0.3249261, 1, 1, 1, 1, 1,
-0.05838671, 0.8529398, 0.9213098, 1, 1, 1, 1, 1,
-0.05744629, 0.2221543, -0.1509824, 1, 1, 1, 1, 1,
-0.05382635, -1.792004, -4.907879, 1, 1, 1, 1, 1,
-0.05320783, -0.7478132, -4.993182, 1, 1, 1, 1, 1,
-0.05276288, 2.496563, 0.4023179, 1, 1, 1, 1, 1,
-0.0510587, 0.09610802, -1.155832, 1, 1, 1, 1, 1,
-0.05094603, 0.8318613, -0.312116, 1, 1, 1, 1, 1,
-0.04954859, 0.7566537, 0.2745296, 1, 1, 1, 1, 1,
-0.04231092, 1.233744, -0.467455, 1, 1, 1, 1, 1,
-0.03879904, 1.315742, -0.6603641, 1, 1, 1, 1, 1,
-0.03730708, -0.05789417, -2.474366, 1, 1, 1, 1, 1,
-0.0314386, 2.08369, -1.087462, 0, 0, 1, 1, 1,
-0.02656567, 1.818874, 1.345008, 1, 0, 0, 1, 1,
-0.02290981, 0.796496, 1.669125, 1, 0, 0, 1, 1,
-0.02190151, 0.6527805, -0.547398, 1, 0, 0, 1, 1,
-0.01537999, -0.7971229, -3.094194, 1, 0, 0, 1, 1,
-0.01280364, -0.7997312, -1.790296, 1, 0, 0, 1, 1,
-0.01115536, -1.351107, -4.097315, 0, 0, 0, 1, 1,
-0.01060991, 0.08581254, -1.423761, 0, 0, 0, 1, 1,
-0.008029869, 0.5715214, 1.505479, 0, 0, 0, 1, 1,
-0.007834236, -0.4051391, -0.6942183, 0, 0, 0, 1, 1,
-0.006780633, 0.8067128, -1.768184, 0, 0, 0, 1, 1,
-0.005962434, -0.6195422, -5.324641, 0, 0, 0, 1, 1,
-0.003597426, 0.5189164, -0.05035782, 0, 0, 0, 1, 1,
-0.002384565, 1.633864, 1.085311, 1, 1, 1, 1, 1,
-0.001706456, -0.710329, -3.398037, 1, 1, 1, 1, 1,
0.0003779944, -2.041613, 3.027085, 1, 1, 1, 1, 1,
0.009970781, -0.5969384, 3.109117, 1, 1, 1, 1, 1,
0.01142682, 1.80688, 0.01303696, 1, 1, 1, 1, 1,
0.011547, 1.851189, -0.8925292, 1, 1, 1, 1, 1,
0.01475936, -0.9883502, 4.193119, 1, 1, 1, 1, 1,
0.01495275, 1.823997, -0.7339346, 1, 1, 1, 1, 1,
0.01776094, -0.4950815, 3.754223, 1, 1, 1, 1, 1,
0.02282495, 0.2736351, -0.03686292, 1, 1, 1, 1, 1,
0.02763805, 1.76891, 0.7435563, 1, 1, 1, 1, 1,
0.03349535, 2.55219, -0.1362546, 1, 1, 1, 1, 1,
0.04475031, -0.7797741, 3.757396, 1, 1, 1, 1, 1,
0.04530609, -0.9515146, 4.468838, 1, 1, 1, 1, 1,
0.04616265, 0.6152958, 1.782254, 1, 1, 1, 1, 1,
0.04617054, 0.1014928, 0.1531275, 0, 0, 1, 1, 1,
0.05267406, -0.2815715, 2.786548, 1, 0, 0, 1, 1,
0.05882533, -1.870319, 3.543319, 1, 0, 0, 1, 1,
0.06049351, 0.8545191, 0.9354292, 1, 0, 0, 1, 1,
0.06227542, -0.4524465, 3.249637, 1, 0, 0, 1, 1,
0.06697897, -0.136102, 3.837203, 1, 0, 0, 1, 1,
0.06722411, 0.5677314, 0.5068126, 0, 0, 0, 1, 1,
0.0711332, 0.4838269, 0.0009952923, 0, 0, 0, 1, 1,
0.07125445, 0.5126641, -0.8992308, 0, 0, 0, 1, 1,
0.07189112, 1.22745, 0.889477, 0, 0, 0, 1, 1,
0.07216998, -0.9326047, 4.505134, 0, 0, 0, 1, 1,
0.07262323, 0.2066253, 0.7136578, 0, 0, 0, 1, 1,
0.07275151, 0.1527531, 0.7163376, 0, 0, 0, 1, 1,
0.07309651, 0.3819427, -0.2338415, 1, 1, 1, 1, 1,
0.07463376, 0.8402101, -0.6675795, 1, 1, 1, 1, 1,
0.08067864, -0.6298994, 1.196018, 1, 1, 1, 1, 1,
0.086996, 1.102612, 0.008856677, 1, 1, 1, 1, 1,
0.09307454, 0.4808364, 1.594507, 1, 1, 1, 1, 1,
0.09315003, 0.5302129, -0.4969776, 1, 1, 1, 1, 1,
0.09322832, 0.164905, 1.228583, 1, 1, 1, 1, 1,
0.09654166, 0.2762266, 0.6941118, 1, 1, 1, 1, 1,
0.09907079, 0.005303706, 2.325465, 1, 1, 1, 1, 1,
0.1021455, 0.5070704, -0.3972663, 1, 1, 1, 1, 1,
0.1030071, -0.6047506, 1.287634, 1, 1, 1, 1, 1,
0.1071169, 1.408059, 1.521721, 1, 1, 1, 1, 1,
0.1078785, -0.2745192, 3.523898, 1, 1, 1, 1, 1,
0.108744, 0.612227, 0.03625718, 1, 1, 1, 1, 1,
0.1088527, 0.7458323, 0.1168208, 1, 1, 1, 1, 1,
0.109112, -0.4069381, 2.839538, 0, 0, 1, 1, 1,
0.1106736, 1.501887, -1.154806, 1, 0, 0, 1, 1,
0.1113243, 1.070408, 0.3649196, 1, 0, 0, 1, 1,
0.1148249, 0.5145667, -0.3205687, 1, 0, 0, 1, 1,
0.1172204, -0.001767635, 2.134816, 1, 0, 0, 1, 1,
0.1178839, 1.176857, 1.935716, 1, 0, 0, 1, 1,
0.1191469, -0.2157637, 1.949241, 0, 0, 0, 1, 1,
0.1192279, 1.444059, 0.7990606, 0, 0, 0, 1, 1,
0.1215762, -1.085855, 2.480103, 0, 0, 0, 1, 1,
0.1221491, 0.3290118, -0.1874482, 0, 0, 0, 1, 1,
0.1240289, -1.141671, 2.339405, 0, 0, 0, 1, 1,
0.1263712, -1.363906, 1.428086, 0, 0, 0, 1, 1,
0.1295, -0.8965085, 3.355383, 0, 0, 0, 1, 1,
0.1317766, -0.6493024, 3.426802, 1, 1, 1, 1, 1,
0.1339678, 1.475748, 0.1655345, 1, 1, 1, 1, 1,
0.1339943, 0.9625258, -0.04843816, 1, 1, 1, 1, 1,
0.13474, 0.6510611, 1.596331, 1, 1, 1, 1, 1,
0.1403089, 0.7076131, 1.697098, 1, 1, 1, 1, 1,
0.144132, 0.2883886, 0.006300038, 1, 1, 1, 1, 1,
0.1451732, 0.4097843, 2.299191, 1, 1, 1, 1, 1,
0.1543254, 0.262372, 0.3734439, 1, 1, 1, 1, 1,
0.1544802, -0.5102188, 1.650327, 1, 1, 1, 1, 1,
0.1563671, -1.189008, 2.323665, 1, 1, 1, 1, 1,
0.1589189, -0.4716768, 3.312548, 1, 1, 1, 1, 1,
0.1646614, -0.2035481, 0.2357311, 1, 1, 1, 1, 1,
0.166991, 0.438891, -1.090576, 1, 1, 1, 1, 1,
0.1693321, -1.35642, 4.496951, 1, 1, 1, 1, 1,
0.1724805, 1.093022, -0.3987174, 1, 1, 1, 1, 1,
0.1779274, -0.5201331, 2.88202, 0, 0, 1, 1, 1,
0.178791, -0.7089992, 2.784226, 1, 0, 0, 1, 1,
0.1803185, -0.2174313, 3.25858, 1, 0, 0, 1, 1,
0.1829782, -0.3221184, 1.632506, 1, 0, 0, 1, 1,
0.1843482, -1.150677, 3.786783, 1, 0, 0, 1, 1,
0.193129, -0.3741499, 0.9845967, 1, 0, 0, 1, 1,
0.1977861, -0.8338737, 2.30493, 0, 0, 0, 1, 1,
0.1991729, 0.2828945, -1.144722, 0, 0, 0, 1, 1,
0.2007987, -0.2111014, 1.922084, 0, 0, 0, 1, 1,
0.201289, -1.124732, 2.21378, 0, 0, 0, 1, 1,
0.2016735, 0.1532384, 1.770009, 0, 0, 0, 1, 1,
0.2031483, 1.105699, 1.659629, 0, 0, 0, 1, 1,
0.2056313, 0.2511723, 0.7912561, 0, 0, 0, 1, 1,
0.206114, 1.103837, -1.809118, 1, 1, 1, 1, 1,
0.206128, 0.1933345, 0.3845787, 1, 1, 1, 1, 1,
0.208029, 0.739552, -0.1450284, 1, 1, 1, 1, 1,
0.21361, -1.224038, 2.90071, 1, 1, 1, 1, 1,
0.2141919, -0.825334, 2.675198, 1, 1, 1, 1, 1,
0.214468, -0.414049, 3.350151, 1, 1, 1, 1, 1,
0.2146978, -1.495956, 2.043851, 1, 1, 1, 1, 1,
0.2155019, -1.139689, 3.230257, 1, 1, 1, 1, 1,
0.2212852, -0.9276444, 2.99756, 1, 1, 1, 1, 1,
0.2239461, -0.6106964, 1.144233, 1, 1, 1, 1, 1,
0.2259086, 0.8468307, -0.9678218, 1, 1, 1, 1, 1,
0.2268026, 0.5326596, 0.7697445, 1, 1, 1, 1, 1,
0.2297235, 0.3667857, 1.59185, 1, 1, 1, 1, 1,
0.237602, 0.3518265, -0.2935044, 1, 1, 1, 1, 1,
0.2424091, 0.5343333, 0.3981644, 1, 1, 1, 1, 1,
0.2454235, -0.4937918, 1.953421, 0, 0, 1, 1, 1,
0.2461873, -0.1485375, 1.823038, 1, 0, 0, 1, 1,
0.2467478, -0.3249348, 2.111127, 1, 0, 0, 1, 1,
0.2490515, -0.4188799, 1.376354, 1, 0, 0, 1, 1,
0.2514822, 0.2040416, 0.1786696, 1, 0, 0, 1, 1,
0.2524287, 1.401739, 1.004604, 1, 0, 0, 1, 1,
0.2558452, -0.001808059, 0.7254701, 0, 0, 0, 1, 1,
0.2586564, -0.1141508, 2.016008, 0, 0, 0, 1, 1,
0.2613027, 0.4781041, -1.349233, 0, 0, 0, 1, 1,
0.2626304, -0.8596568, 2.380413, 0, 0, 0, 1, 1,
0.2646662, 1.984936, -0.09146904, 0, 0, 0, 1, 1,
0.2655923, -0.6719692, 3.497645, 0, 0, 0, 1, 1,
0.2667931, 0.5427635, -1.458375, 0, 0, 0, 1, 1,
0.2719268, -0.3742002, 2.944191, 1, 1, 1, 1, 1,
0.2738907, 0.8309259, 0.8315037, 1, 1, 1, 1, 1,
0.277027, 0.01402504, 0.2313181, 1, 1, 1, 1, 1,
0.2775184, -0.1523822, 2.85172, 1, 1, 1, 1, 1,
0.2803462, -1.195639, 2.774756, 1, 1, 1, 1, 1,
0.2855529, 0.1575819, 0.8324309, 1, 1, 1, 1, 1,
0.2915682, -0.2501475, 3.081699, 1, 1, 1, 1, 1,
0.2933598, -1.019282, 1.415315, 1, 1, 1, 1, 1,
0.2946138, -0.569233, 1.448992, 1, 1, 1, 1, 1,
0.2947759, -0.4968795, 1.632693, 1, 1, 1, 1, 1,
0.304979, 0.01939038, 1.995072, 1, 1, 1, 1, 1,
0.3056781, -0.1016114, 0.5347551, 1, 1, 1, 1, 1,
0.3070137, -0.7736562, 2.374387, 1, 1, 1, 1, 1,
0.308167, 0.7775496, -0.3440018, 1, 1, 1, 1, 1,
0.314303, -0.6327516, 3.355626, 1, 1, 1, 1, 1,
0.3152873, -1.12402, 2.022727, 0, 0, 1, 1, 1,
0.31565, 0.6090994, 1.669808, 1, 0, 0, 1, 1,
0.3171141, -0.2229231, 0.06944228, 1, 0, 0, 1, 1,
0.3234767, -1.276343, 2.587082, 1, 0, 0, 1, 1,
0.3277547, 0.3917896, 3.534469, 1, 0, 0, 1, 1,
0.3296672, -0.3012274, 2.272139, 1, 0, 0, 1, 1,
0.3311029, -0.0667005, 1.63644, 0, 0, 0, 1, 1,
0.332039, 0.8090804, 0.6021019, 0, 0, 0, 1, 1,
0.3353176, -0.1032592, 2.670787, 0, 0, 0, 1, 1,
0.3379605, 0.2671296, 2.845776, 0, 0, 0, 1, 1,
0.3406206, 1.247205, -0.04535048, 0, 0, 0, 1, 1,
0.343253, -0.7036023, 3.840395, 0, 0, 0, 1, 1,
0.345078, 0.7042861, 1.56392, 0, 0, 0, 1, 1,
0.3470142, 1.398735, -0.3435316, 1, 1, 1, 1, 1,
0.3548287, 0.6595291, 0.2104338, 1, 1, 1, 1, 1,
0.3564461, -1.307658, 4.477112, 1, 1, 1, 1, 1,
0.3569549, -0.8279292, 2.941521, 1, 1, 1, 1, 1,
0.3645487, 1.170872, 0.054348, 1, 1, 1, 1, 1,
0.3684959, 1.096086, 1.471052, 1, 1, 1, 1, 1,
0.3691824, 0.532769, -0.3822772, 1, 1, 1, 1, 1,
0.3805044, -0.6893432, 2.696682, 1, 1, 1, 1, 1,
0.3824638, 1.297358, 1.289649, 1, 1, 1, 1, 1,
0.3826773, -1.824629, 3.318091, 1, 1, 1, 1, 1,
0.383599, -0.8564917, 3.401104, 1, 1, 1, 1, 1,
0.3848658, 0.1170894, 1.415502, 1, 1, 1, 1, 1,
0.3858021, 0.7797126, 1.44295, 1, 1, 1, 1, 1,
0.3867684, 0.7111391, -1.12452, 1, 1, 1, 1, 1,
0.388529, -0.007514508, 1.258, 1, 1, 1, 1, 1,
0.3909025, 0.6318241, -1.690911, 0, 0, 1, 1, 1,
0.3969364, -0.3288238, 2.21914, 1, 0, 0, 1, 1,
0.4039398, 0.4829704, -0.9597282, 1, 0, 0, 1, 1,
0.4072873, 0.8442369, 0.2392605, 1, 0, 0, 1, 1,
0.407853, -1.051071, 3.050124, 1, 0, 0, 1, 1,
0.4090504, -0.6186852, 2.704124, 1, 0, 0, 1, 1,
0.4118475, 0.3315105, 1.187053, 0, 0, 0, 1, 1,
0.4118775, 0.6779915, 1.292953, 0, 0, 0, 1, 1,
0.4126157, -0.633441, 1.376691, 0, 0, 0, 1, 1,
0.4127989, -0.226655, 2.308633, 0, 0, 0, 1, 1,
0.4131553, -0.1972531, 1.697799, 0, 0, 0, 1, 1,
0.4178004, 0.519249, 2.929496, 0, 0, 0, 1, 1,
0.417861, -0.2001266, 1.456816, 0, 0, 0, 1, 1,
0.4187744, -0.06872627, 1.842463, 1, 1, 1, 1, 1,
0.4221934, 0.6837596, 0.07528346, 1, 1, 1, 1, 1,
0.422543, 2.392962, 0.03684842, 1, 1, 1, 1, 1,
0.4236331, -0.9379099, 2.572226, 1, 1, 1, 1, 1,
0.4278047, 0.1298582, 1.233241, 1, 1, 1, 1, 1,
0.4285312, 0.02618136, 2.131404, 1, 1, 1, 1, 1,
0.4334429, 0.7191259, -0.05621564, 1, 1, 1, 1, 1,
0.4344245, 0.7034394, -0.7570014, 1, 1, 1, 1, 1,
0.448956, 0.9935317, 0.7796372, 1, 1, 1, 1, 1,
0.4509947, -0.5634452, 2.033569, 1, 1, 1, 1, 1,
0.4528761, 0.4493659, 0.4000225, 1, 1, 1, 1, 1,
0.4530858, -0.8737009, 1.238943, 1, 1, 1, 1, 1,
0.4542083, -0.1966188, 2.06477, 1, 1, 1, 1, 1,
0.4587055, -0.3683652, 0.5991243, 1, 1, 1, 1, 1,
0.4609289, 0.6710873, -0.2866906, 1, 1, 1, 1, 1,
0.4669331, 0.2051497, 2.922436, 0, 0, 1, 1, 1,
0.4670252, -1.340391, 3.012889, 1, 0, 0, 1, 1,
0.4670428, 2.257928, -0.2885502, 1, 0, 0, 1, 1,
0.468149, -1.175937, 3.211816, 1, 0, 0, 1, 1,
0.4691621, 0.8408534, 0.2237689, 1, 0, 0, 1, 1,
0.470934, -0.9307809, 1.176163, 1, 0, 0, 1, 1,
0.4754137, -1.53458, 3.299998, 0, 0, 0, 1, 1,
0.4755913, -0.8077378, 3.112465, 0, 0, 0, 1, 1,
0.4802526, -1.087175, 1.267837, 0, 0, 0, 1, 1,
0.4803333, 0.4682331, -0.7809574, 0, 0, 0, 1, 1,
0.4805773, -0.3590138, 2.877313, 0, 0, 0, 1, 1,
0.4850896, 1.305585, -0.472037, 0, 0, 0, 1, 1,
0.490589, -0.4372014, 1.461703, 0, 0, 0, 1, 1,
0.4943082, 0.12582, 1.288311, 1, 1, 1, 1, 1,
0.5032455, -0.4945162, 2.667828, 1, 1, 1, 1, 1,
0.5036628, -0.8697921, 3.363988, 1, 1, 1, 1, 1,
0.510977, -0.7522981, 3.196819, 1, 1, 1, 1, 1,
0.5221118, -0.4869053, 3.141716, 1, 1, 1, 1, 1,
0.5257116, 1.542507, -0.3469996, 1, 1, 1, 1, 1,
0.5303019, -0.7797207, 1.318789, 1, 1, 1, 1, 1,
0.5312387, 0.4527264, 1.15706, 1, 1, 1, 1, 1,
0.5325835, 0.4017397, -0.01865413, 1, 1, 1, 1, 1,
0.5398875, 0.01246279, 1.406241, 1, 1, 1, 1, 1,
0.5465835, 0.7150849, -1.067927, 1, 1, 1, 1, 1,
0.5468445, -0.1807878, 1.027191, 1, 1, 1, 1, 1,
0.5485836, -0.2967038, 1.651904, 1, 1, 1, 1, 1,
0.5523446, -1.265576, 2.657244, 1, 1, 1, 1, 1,
0.5525545, -0.08207137, 1.6026, 1, 1, 1, 1, 1,
0.553036, -0.5955929, 1.931657, 0, 0, 1, 1, 1,
0.5586054, -0.05754608, 2.662451, 1, 0, 0, 1, 1,
0.5610351, 1.451237, 1.195608, 1, 0, 0, 1, 1,
0.5612031, 0.5141193, 0.5743034, 1, 0, 0, 1, 1,
0.5612273, 0.6701437, 0.773752, 1, 0, 0, 1, 1,
0.5648329, 0.1749568, 1.212926, 1, 0, 0, 1, 1,
0.5691623, 1.539342, 1.909609, 0, 0, 0, 1, 1,
0.5694946, -1.145541, 4.729899, 0, 0, 0, 1, 1,
0.5698329, -0.07270873, 2.896049, 0, 0, 0, 1, 1,
0.5707473, 0.6194925, 2.168072, 0, 0, 0, 1, 1,
0.5762572, 0.6504409, 0.505361, 0, 0, 0, 1, 1,
0.5829374, 0.6990252, -0.2587836, 0, 0, 0, 1, 1,
0.5833094, -2.289472, 2.372774, 0, 0, 0, 1, 1,
0.5834601, 0.5788831, 0.315952, 1, 1, 1, 1, 1,
0.5848064, -0.175756, 0.6602832, 1, 1, 1, 1, 1,
0.5900901, 0.2161236, 0.5725838, 1, 1, 1, 1, 1,
0.5964624, -1.410181, 0.6645409, 1, 1, 1, 1, 1,
0.597478, 0.06593116, 0.9495119, 1, 1, 1, 1, 1,
0.6079702, 0.3975391, 2.246999, 1, 1, 1, 1, 1,
0.6135756, -0.4273593, 3.061357, 1, 1, 1, 1, 1,
0.6136945, 0.3321449, 0.4906093, 1, 1, 1, 1, 1,
0.6149848, 1.846194, -1.031316, 1, 1, 1, 1, 1,
0.6186308, 0.4938163, 0.704702, 1, 1, 1, 1, 1,
0.6196463, -1.668687, 3.247152, 1, 1, 1, 1, 1,
0.6241483, 1.013623, 1.872098, 1, 1, 1, 1, 1,
0.6259351, -0.3070376, 2.53593, 1, 1, 1, 1, 1,
0.6320612, -0.4623604, 2.68967, 1, 1, 1, 1, 1,
0.6392721, -0.9251329, 4.084191, 1, 1, 1, 1, 1,
0.6546118, -0.04979141, 2.076293, 0, 0, 1, 1, 1,
0.65534, -0.184643, 1.935813, 1, 0, 0, 1, 1,
0.6564051, -0.4406299, 1.929218, 1, 0, 0, 1, 1,
0.6578168, 0.5087335, -0.4211422, 1, 0, 0, 1, 1,
0.6584817, -0.457832, 2.473491, 1, 0, 0, 1, 1,
0.6588207, -0.6190472, 3.330132, 1, 0, 0, 1, 1,
0.6611103, -0.4335656, 1.880053, 0, 0, 0, 1, 1,
0.6627656, -0.4154566, 1.636275, 0, 0, 0, 1, 1,
0.6638953, -0.03252044, 1.545096, 0, 0, 0, 1, 1,
0.6660157, 1.243484, 2.107671, 0, 0, 0, 1, 1,
0.6672108, -0.3443128, 1.097555, 0, 0, 0, 1, 1,
0.6725807, 1.011796, 0.6542919, 0, 0, 0, 1, 1,
0.6765649, 1.785656, 0.9172253, 0, 0, 0, 1, 1,
0.6781849, -0.1821359, 2.931957, 1, 1, 1, 1, 1,
0.6839934, 1.605157, 1.210716, 1, 1, 1, 1, 1,
0.6847487, 0.7629154, 2.089521, 1, 1, 1, 1, 1,
0.6866859, -1.312866, 2.939987, 1, 1, 1, 1, 1,
0.6872259, 0.3439818, 0.9405914, 1, 1, 1, 1, 1,
0.7044804, -0.7636396, 2.42226, 1, 1, 1, 1, 1,
0.7226986, 1.184425, -1.057988, 1, 1, 1, 1, 1,
0.7228556, 0.7156304, 1.248499, 1, 1, 1, 1, 1,
0.7245747, 1.295885, 0.4679535, 1, 1, 1, 1, 1,
0.7271177, 0.7987218, 0.4057978, 1, 1, 1, 1, 1,
0.7373578, 2.489296, 1.471252, 1, 1, 1, 1, 1,
0.7406513, -0.2061343, 2.2353, 1, 1, 1, 1, 1,
0.7407364, -0.7751727, 3.251788, 1, 1, 1, 1, 1,
0.743906, -0.1057859, 2.422195, 1, 1, 1, 1, 1,
0.7446162, 0.8213847, 1.469565, 1, 1, 1, 1, 1,
0.7450312, -0.2640715, 2.045444, 0, 0, 1, 1, 1,
0.7453579, -0.04400547, 2.838747, 1, 0, 0, 1, 1,
0.7471136, -1.15601, 3.27307, 1, 0, 0, 1, 1,
0.7483152, 0.1602744, 1.773213, 1, 0, 0, 1, 1,
0.7494962, 0.3369028, 2.001838, 1, 0, 0, 1, 1,
0.7511389, 1.046849, 0.6773999, 1, 0, 0, 1, 1,
0.7529116, 1.497505, -1.951664, 0, 0, 0, 1, 1,
0.7531071, -0.2340203, 0.9059905, 0, 0, 0, 1, 1,
0.7585052, 0.5150882, -0.9708585, 0, 0, 0, 1, 1,
0.7611976, 0.4881234, 1.955257, 0, 0, 0, 1, 1,
0.7619733, 0.9976952, 0.5654564, 0, 0, 0, 1, 1,
0.7649717, 2.047697, -0.7584745, 0, 0, 0, 1, 1,
0.7699909, -1.165297, 2.556512, 0, 0, 0, 1, 1,
0.7709016, -1.014205, 2.145883, 1, 1, 1, 1, 1,
0.7733104, -1.057802, 3.169706, 1, 1, 1, 1, 1,
0.7759499, -0.7752138, 1.66465, 1, 1, 1, 1, 1,
0.7776636, -0.9219247, 3.600856, 1, 1, 1, 1, 1,
0.778535, 1.136751, 1.652525, 1, 1, 1, 1, 1,
0.7820964, -0.5816075, 1.447887, 1, 1, 1, 1, 1,
0.7826172, -1.648856, 2.881415, 1, 1, 1, 1, 1,
0.7838138, 1.561345, 0.6554857, 1, 1, 1, 1, 1,
0.7839978, 0.9106738, -1.744905, 1, 1, 1, 1, 1,
0.7951543, -1.151841, 4.119125, 1, 1, 1, 1, 1,
0.7963055, 0.6640555, 1.068482, 1, 1, 1, 1, 1,
0.7970677, -0.01743999, -0.245031, 1, 1, 1, 1, 1,
0.7992339, 0.3777419, 1.848995, 1, 1, 1, 1, 1,
0.8010236, 0.4331128, 1.97389, 1, 1, 1, 1, 1,
0.8014129, 1.395421, 1.807425, 1, 1, 1, 1, 1,
0.8131608, -0.5521561, 2.121738, 0, 0, 1, 1, 1,
0.8146052, -0.8831322, 2.31047, 1, 0, 0, 1, 1,
0.8163105, 0.05509797, 1.426772, 1, 0, 0, 1, 1,
0.818453, 0.7060872, 0.3862322, 1, 0, 0, 1, 1,
0.8212354, 0.0766598, 2.096116, 1, 0, 0, 1, 1,
0.8231382, 0.6995627, 1.947221, 1, 0, 0, 1, 1,
0.8254461, 0.1028068, 3.249876, 0, 0, 0, 1, 1,
0.8369938, 1.79787, -0.4711252, 0, 0, 0, 1, 1,
0.8387412, 0.3675157, 0.7798351, 0, 0, 0, 1, 1,
0.8421586, -0.6943024, 1.357696, 0, 0, 0, 1, 1,
0.8433654, 0.6691765, 0.6166438, 0, 0, 0, 1, 1,
0.843679, 1.660805, 0.7571821, 0, 0, 0, 1, 1,
0.8438048, -0.07946226, 1.906255, 0, 0, 0, 1, 1,
0.8465999, -1.292714, 1.428656, 1, 1, 1, 1, 1,
0.8506189, -1.773969, 2.21549, 1, 1, 1, 1, 1,
0.8519965, 1.054691, 1.662736, 1, 1, 1, 1, 1,
0.8522324, -1.49425, 3.787047, 1, 1, 1, 1, 1,
0.8543332, 0.8650303, 0.359079, 1, 1, 1, 1, 1,
0.8559996, 0.7761698, 0.07411315, 1, 1, 1, 1, 1,
0.8560545, 0.01156734, -0.7170549, 1, 1, 1, 1, 1,
0.8577877, 0.1854934, 1.426542, 1, 1, 1, 1, 1,
0.8598167, -0.1193586, 3.695074, 1, 1, 1, 1, 1,
0.8609163, -0.2600121, 1.187599, 1, 1, 1, 1, 1,
0.8631012, -0.103624, 2.386596, 1, 1, 1, 1, 1,
0.8727155, 0.1714842, 0.2547253, 1, 1, 1, 1, 1,
0.8830791, -0.150401, 2.205005, 1, 1, 1, 1, 1,
0.900381, -0.8829333, 0.8075874, 1, 1, 1, 1, 1,
0.9092239, -0.5924097, 1.101588, 1, 1, 1, 1, 1,
0.9110523, 1.573694, 0.6970635, 0, 0, 1, 1, 1,
0.9120751, 0.8126485, 2.380566, 1, 0, 0, 1, 1,
0.9144982, 0.7547958, 0.4800741, 1, 0, 0, 1, 1,
0.919671, 0.03264222, 2.935978, 1, 0, 0, 1, 1,
0.9307094, -0.313513, 1.195464, 1, 0, 0, 1, 1,
0.9350119, -0.1906677, 0.3679238, 1, 0, 0, 1, 1,
0.936546, 1.0187, 0.6610848, 0, 0, 0, 1, 1,
0.9441562, -0.4849307, 1.143075, 0, 0, 0, 1, 1,
0.9473769, -0.3536669, 1.504298, 0, 0, 0, 1, 1,
0.9481217, 0.001560608, 1.532853, 0, 0, 0, 1, 1,
0.9517024, -0.8535868, 1.728145, 0, 0, 0, 1, 1,
0.9519198, -1.430245, 0.8839222, 0, 0, 0, 1, 1,
0.9542249, 0.1301499, 0.2606031, 0, 0, 0, 1, 1,
0.95952, -0.2826334, -0.3723741, 1, 1, 1, 1, 1,
0.9595901, 1.429204, -0.122979, 1, 1, 1, 1, 1,
0.9627304, -1.213987, 3.383837, 1, 1, 1, 1, 1,
0.9659063, -1.384511, 3.080604, 1, 1, 1, 1, 1,
0.9724286, -0.1029075, 1.586267, 1, 1, 1, 1, 1,
0.9836421, 0.3146522, 0.8911225, 1, 1, 1, 1, 1,
0.9857388, -0.5733744, 2.920216, 1, 1, 1, 1, 1,
0.9861078, 0.7779444, 1.557241, 1, 1, 1, 1, 1,
0.9873323, -1.006539, 1.527158, 1, 1, 1, 1, 1,
0.9908497, 0.4072922, 0.9863714, 1, 1, 1, 1, 1,
0.9917076, 0.9821411, 1.297938, 1, 1, 1, 1, 1,
0.9955264, 2.453347, -0.7809937, 1, 1, 1, 1, 1,
0.9972641, 0.8538566, 2.128816, 1, 1, 1, 1, 1,
0.997758, 0.7757186, -0.05671986, 1, 1, 1, 1, 1,
1.015553, -2.395303, 3.25056, 1, 1, 1, 1, 1,
1.02611, 1.195695, 1.049556, 0, 0, 1, 1, 1,
1.032422, -1.603776, 2.527754, 1, 0, 0, 1, 1,
1.039056, 0.5961493, 2.246186, 1, 0, 0, 1, 1,
1.04343, 0.4314069, 0.9929412, 1, 0, 0, 1, 1,
1.046428, 0.1523471, 2.301018, 1, 0, 0, 1, 1,
1.04852, 1.495442, 0.3583546, 1, 0, 0, 1, 1,
1.048637, -0.6467853, 0.7611622, 0, 0, 0, 1, 1,
1.055639, -0.8202314, 4.215085, 0, 0, 0, 1, 1,
1.05724, 0.5202384, 0.9898235, 0, 0, 0, 1, 1,
1.075859, -0.5526616, 1.511378, 0, 0, 0, 1, 1,
1.078188, -0.9076616, 4.74369, 0, 0, 0, 1, 1,
1.078735, -0.2338557, -0.145006, 0, 0, 0, 1, 1,
1.092849, -1.184908, 3.474898, 0, 0, 0, 1, 1,
1.096048, -1.0748, 2.479641, 1, 1, 1, 1, 1,
1.099537, 0.4254342, 1.179852, 1, 1, 1, 1, 1,
1.102596, 0.04237282, 0.7246072, 1, 1, 1, 1, 1,
1.110204, 0.2622932, 2.246185, 1, 1, 1, 1, 1,
1.110624, 0.5204996, 1.438309, 1, 1, 1, 1, 1,
1.115617, 0.9193088, 2.22446, 1, 1, 1, 1, 1,
1.122839, 0.5135222, 1.823647, 1, 1, 1, 1, 1,
1.124257, -0.7129622, 0.4798063, 1, 1, 1, 1, 1,
1.125166, 0.07778829, 1.127148, 1, 1, 1, 1, 1,
1.129242, -1.222073, 0.401628, 1, 1, 1, 1, 1,
1.129925, 1.451134, 0.5481938, 1, 1, 1, 1, 1,
1.131571, -1.307129, 2.3849, 1, 1, 1, 1, 1,
1.135126, 3.548499, 0.6658688, 1, 1, 1, 1, 1,
1.136591, 0.8890789, 1.159022, 1, 1, 1, 1, 1,
1.142995, 2.215371, -0.1197542, 1, 1, 1, 1, 1,
1.15058, -0.4707546, 2.296896, 0, 0, 1, 1, 1,
1.154284, -1.891829, 3.07427, 1, 0, 0, 1, 1,
1.157069, 1.235427, 2.525894, 1, 0, 0, 1, 1,
1.165875, -0.8488929, 3.916599, 1, 0, 0, 1, 1,
1.168546, 1.202228, -0.01551401, 1, 0, 0, 1, 1,
1.168791, -0.07582318, -0.2281579, 1, 0, 0, 1, 1,
1.175923, -0.6776921, -0.1757505, 0, 0, 0, 1, 1,
1.179038, -0.07882013, 2.12111, 0, 0, 0, 1, 1,
1.181797, -0.813127, 3.498038, 0, 0, 0, 1, 1,
1.195297, 0.3409794, 1.607579, 0, 0, 0, 1, 1,
1.197474, 0.510813, 0.4492502, 0, 0, 0, 1, 1,
1.198301, -0.2004884, 2.3049, 0, 0, 0, 1, 1,
1.201928, 0.5006252, -0.4648543, 0, 0, 0, 1, 1,
1.20713, 0.2891245, 0.5060775, 1, 1, 1, 1, 1,
1.215379, 0.5835751, 1.421567, 1, 1, 1, 1, 1,
1.224091, -1.017072, 1.375406, 1, 1, 1, 1, 1,
1.238493, -0.9939212, 1.383201, 1, 1, 1, 1, 1,
1.240287, -1.27987, 2.240647, 1, 1, 1, 1, 1,
1.245879, 0.8733087, 1.161372, 1, 1, 1, 1, 1,
1.261232, 0.1649498, 1.797569, 1, 1, 1, 1, 1,
1.26186, -1.596207, 4.087302, 1, 1, 1, 1, 1,
1.267128, 0.8210087, 1.131242, 1, 1, 1, 1, 1,
1.275827, 0.1773892, 0.2232168, 1, 1, 1, 1, 1,
1.282655, -0.1479667, 2.474631, 1, 1, 1, 1, 1,
1.284949, 0.2217159, 1.449709, 1, 1, 1, 1, 1,
1.296606, -0.5364681, 0.9154549, 1, 1, 1, 1, 1,
1.301997, -0.01170958, 1.09224, 1, 1, 1, 1, 1,
1.302035, 0.6827492, 1.404833, 1, 1, 1, 1, 1,
1.312993, 1.02091, 0.06448959, 0, 0, 1, 1, 1,
1.323247, 1.022346, 0.8253808, 1, 0, 0, 1, 1,
1.333969, -0.02907825, 3.765579, 1, 0, 0, 1, 1,
1.343699, 0.8608524, 2.080033, 1, 0, 0, 1, 1,
1.3511, 2.350727, -0.6525334, 1, 0, 0, 1, 1,
1.35353, -0.06726214, 2.370881, 1, 0, 0, 1, 1,
1.358024, -0.6825516, 2.139585, 0, 0, 0, 1, 1,
1.361842, -3.037398, 2.924384, 0, 0, 0, 1, 1,
1.362757, 0.1490016, 0.8266886, 0, 0, 0, 1, 1,
1.369785, -0.1279763, 1.890638, 0, 0, 0, 1, 1,
1.376929, -0.5267445, 1.432875, 0, 0, 0, 1, 1,
1.37785, -0.2429843, 0.1513642, 0, 0, 0, 1, 1,
1.385785, 0.03254407, 2.233931, 0, 0, 0, 1, 1,
1.386505, -1.434602, 4.233875, 1, 1, 1, 1, 1,
1.386967, 0.1613248, 0.7542023, 1, 1, 1, 1, 1,
1.390986, -0.03144056, 1.571397, 1, 1, 1, 1, 1,
1.391026, -0.7890334, 2.336702, 1, 1, 1, 1, 1,
1.399589, 0.98529, 1.776573, 1, 1, 1, 1, 1,
1.402235, -1.608742, 3.450904, 1, 1, 1, 1, 1,
1.407435, -0.8046705, 1.719851, 1, 1, 1, 1, 1,
1.407591, -0.7815344, 0.2721066, 1, 1, 1, 1, 1,
1.428116, -0.08877467, 0.6737658, 1, 1, 1, 1, 1,
1.429503, 1.298303, -0.1127699, 1, 1, 1, 1, 1,
1.435928, 0.8195346, -1.17456, 1, 1, 1, 1, 1,
1.435938, 0.8018901, 3.236666, 1, 1, 1, 1, 1,
1.441951, -1.086882, 3.406644, 1, 1, 1, 1, 1,
1.458653, -0.7709242, 1.675795, 1, 1, 1, 1, 1,
1.463549, 1.055353, 0.9411523, 1, 1, 1, 1, 1,
1.480388, -2.198428, 0.6969681, 0, 0, 1, 1, 1,
1.482687, -1.101404, 2.745544, 1, 0, 0, 1, 1,
1.482892, -0.1499234, 3.441786, 1, 0, 0, 1, 1,
1.486442, 0.2499098, 1.293357, 1, 0, 0, 1, 1,
1.487166, 0.04776507, -1.521774, 1, 0, 0, 1, 1,
1.489673, 0.5202535, 1.111409, 1, 0, 0, 1, 1,
1.50202, -0.3850358, 0.3031342, 0, 0, 0, 1, 1,
1.505104, 1.313722, 0.6580313, 0, 0, 0, 1, 1,
1.512611, 0.9219331, 0.7097369, 0, 0, 0, 1, 1,
1.512807, -1.446975, 2.331379, 0, 0, 0, 1, 1,
1.521575, -0.5472456, 1.377821, 0, 0, 0, 1, 1,
1.523672, 1.096282, 2.982882, 0, 0, 0, 1, 1,
1.567563, -1.567061, 1.94297, 0, 0, 0, 1, 1,
1.568064, 1.065141, -0.4302865, 1, 1, 1, 1, 1,
1.568482, -1.648984, 1.680178, 1, 1, 1, 1, 1,
1.572947, -0.4549791, 0.70587, 1, 1, 1, 1, 1,
1.591174, -0.5032032, 0.9881514, 1, 1, 1, 1, 1,
1.595908, -1.394118, 3.466369, 1, 1, 1, 1, 1,
1.597876, 0.05504066, 2.11736, 1, 1, 1, 1, 1,
1.603027, 0.3018083, 2.823156, 1, 1, 1, 1, 1,
1.603308, 0.03629755, 1.947985, 1, 1, 1, 1, 1,
1.606034, -1.242621, 2.978982, 1, 1, 1, 1, 1,
1.610638, -0.08646475, 2.335957, 1, 1, 1, 1, 1,
1.61314, -0.8293634, 3.627432, 1, 1, 1, 1, 1,
1.616393, -0.128653, -0.3034453, 1, 1, 1, 1, 1,
1.629889, 0.339305, 3.22445, 1, 1, 1, 1, 1,
1.630243, 0.1916044, 2.597785, 1, 1, 1, 1, 1,
1.63185, 0.03272863, 0.4822624, 1, 1, 1, 1, 1,
1.632805, 0.145611, 2.285009, 0, 0, 1, 1, 1,
1.64425, -0.5897803, 1.750229, 1, 0, 0, 1, 1,
1.654429, 0.3722017, 0.3376529, 1, 0, 0, 1, 1,
1.657216, 0.7686737, 2.213632, 1, 0, 0, 1, 1,
1.662042, 2.703157, 1.001378, 1, 0, 0, 1, 1,
1.679693, 1.540945, 1.691519, 1, 0, 0, 1, 1,
1.691456, 1.48187, -0.4663074, 0, 0, 0, 1, 1,
1.717613, -0.9562578, 2.337161, 0, 0, 0, 1, 1,
1.72003, 0.06621833, 1.945107, 0, 0, 0, 1, 1,
1.724943, -0.6083773, 3.615387, 0, 0, 0, 1, 1,
1.730752, -0.1059688, 2.2615, 0, 0, 0, 1, 1,
1.735585, 0.3527502, 0.4998141, 0, 0, 0, 1, 1,
1.749562, -0.1581656, 2.90015, 0, 0, 0, 1, 1,
1.761598, -0.3281537, 0.9544488, 1, 1, 1, 1, 1,
1.763832, -0.2500402, 1.380801, 1, 1, 1, 1, 1,
1.783897, 0.4307569, 0.4022761, 1, 1, 1, 1, 1,
1.807614, 1.560273, -0.2086419, 1, 1, 1, 1, 1,
1.836074, -0.5273323, 2.192695, 1, 1, 1, 1, 1,
1.887964, 1.004699, 1.496203, 1, 1, 1, 1, 1,
1.909062, -1.258875, 0.3023718, 1, 1, 1, 1, 1,
1.932577, 0.3042365, 1.453393, 1, 1, 1, 1, 1,
1.942503, -0.9300045, 0.2448127, 1, 1, 1, 1, 1,
1.978935, -1.019366, 2.420692, 1, 1, 1, 1, 1,
1.981331, 0.4097019, 3.241374, 1, 1, 1, 1, 1,
2.015198, 0.3216379, 2.665161, 1, 1, 1, 1, 1,
2.085651, 1.247181, 1.619462, 1, 1, 1, 1, 1,
2.105379, 0.157731, 0.6913309, 1, 1, 1, 1, 1,
2.123749, 0.4060543, 2.75686, 1, 1, 1, 1, 1,
2.143814, 1.06196, 2.079087, 0, 0, 1, 1, 1,
2.164955, -1.784217, 3.450993, 1, 0, 0, 1, 1,
2.186526, 1.366181, 0.7896476, 1, 0, 0, 1, 1,
2.190439, -0.2244983, 0.2547806, 1, 0, 0, 1, 1,
2.198857, -1.208078, 1.688919, 1, 0, 0, 1, 1,
2.230073, -0.5151404, 0.9505112, 1, 0, 0, 1, 1,
2.251625, 0.1367854, 1.714453, 0, 0, 0, 1, 1,
2.266105, 0.1446308, 1.6025, 0, 0, 0, 1, 1,
2.271085, -0.3582319, 2.027436, 0, 0, 0, 1, 1,
2.292174, 0.195018, 1.781801, 0, 0, 0, 1, 1,
2.413209, 2.610635, 0.5498211, 0, 0, 0, 1, 1,
2.42464, 0.7518723, 2.167331, 0, 0, 0, 1, 1,
2.465281, 1.307117, 1.287847, 0, 0, 0, 1, 1,
2.497966, 0.6847841, 1.543495, 1, 1, 1, 1, 1,
2.515733, 0.7770203, 1.7696, 1, 1, 1, 1, 1,
2.543326, 0.7476335, 0.80827, 1, 1, 1, 1, 1,
2.545195, 0.6143955, 0.7427153, 1, 1, 1, 1, 1,
2.55092, 1.37243, 0.1852635, 1, 1, 1, 1, 1,
2.637375, -0.7962228, 1.710631, 1, 1, 1, 1, 1,
2.659972, -0.451926, -1.22215, 1, 1, 1, 1, 1
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
var radius = 9.481132;
var distance = 33.30207;
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
mvMatrix.translate( 0.4798288, -0.2555504, 0.4791253 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30207);
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
