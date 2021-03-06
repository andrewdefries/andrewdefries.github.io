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
-3.073122, 0.2275497, -2.427373, 1, 0, 0, 1,
-2.600968, 1.18399, -1.039331, 1, 0.007843138, 0, 1,
-2.591869, 1.415364, -1.319344, 1, 0.01176471, 0, 1,
-2.424488, -0.4982702, -0.5619376, 1, 0.01960784, 0, 1,
-2.40258, -0.2381184, -3.936824, 1, 0.02352941, 0, 1,
-2.352529, -0.6792524, -2.701491, 1, 0.03137255, 0, 1,
-2.321698, -1.829307, -1.677853, 1, 0.03529412, 0, 1,
-2.311254, 0.320653, 0.2954172, 1, 0.04313726, 0, 1,
-2.305737, 0.2010484, -2.003681, 1, 0.04705882, 0, 1,
-2.239206, -2.160414, -3.50532, 1, 0.05490196, 0, 1,
-2.228859, -0.663107, -1.953969, 1, 0.05882353, 0, 1,
-2.192316, -0.2088921, -1.96466, 1, 0.06666667, 0, 1,
-2.189623, -0.7035738, -3.1824, 1, 0.07058824, 0, 1,
-2.186876, 1.487929, -1.446597, 1, 0.07843138, 0, 1,
-2.180763, -0.9430438, -2.650472, 1, 0.08235294, 0, 1,
-2.148851, 0.3310928, -0.6419904, 1, 0.09019608, 0, 1,
-2.05714, 0.7124062, -0.7783715, 1, 0.09411765, 0, 1,
-1.989129, 0.9133615, -2.643049, 1, 0.1019608, 0, 1,
-1.987164, -0.05219909, -2.265298, 1, 0.1098039, 0, 1,
-1.981478, -0.1466903, -2.145184, 1, 0.1137255, 0, 1,
-1.965628, 0.01072074, -2.77248, 1, 0.1215686, 0, 1,
-1.957882, 0.531182, -2.078426, 1, 0.1254902, 0, 1,
-1.946739, -1.007333, -3.531899, 1, 0.1333333, 0, 1,
-1.940206, -0.4587992, -1.124541, 1, 0.1372549, 0, 1,
-1.939286, 0.8889567, -0.6765698, 1, 0.145098, 0, 1,
-1.93099, -0.4864073, -0.2725228, 1, 0.1490196, 0, 1,
-1.893288, 0.9706286, -2.054736, 1, 0.1568628, 0, 1,
-1.881899, -0.9943873, -2.715025, 1, 0.1607843, 0, 1,
-1.86202, -0.2429801, -0.5556532, 1, 0.1686275, 0, 1,
-1.854255, 0.05455469, -0.4479029, 1, 0.172549, 0, 1,
-1.840994, 0.613595, 0.2814732, 1, 0.1803922, 0, 1,
-1.834684, 1.54085, -2.687457, 1, 0.1843137, 0, 1,
-1.830867, 1.154034, 0.2783276, 1, 0.1921569, 0, 1,
-1.821561, 0.5371085, -2.013007, 1, 0.1960784, 0, 1,
-1.820794, -0.4759038, -1.549142, 1, 0.2039216, 0, 1,
-1.789321, 0.5784244, -2.653996, 1, 0.2117647, 0, 1,
-1.775331, -1.56163, -0.436089, 1, 0.2156863, 0, 1,
-1.768841, -0.8651478, -2.06014, 1, 0.2235294, 0, 1,
-1.764395, 0.1390343, -1.965775, 1, 0.227451, 0, 1,
-1.739851, -1.101092, -0.09214357, 1, 0.2352941, 0, 1,
-1.736351, -1.151443, -2.288983, 1, 0.2392157, 0, 1,
-1.724182, 0.20973, -0.9012085, 1, 0.2470588, 0, 1,
-1.683099, -1.37069, -2.638492, 1, 0.2509804, 0, 1,
-1.628665, -1.646405, -3.530446, 1, 0.2588235, 0, 1,
-1.628424, -1.371325, -1.428498, 1, 0.2627451, 0, 1,
-1.620364, 1.543301, -0.9680544, 1, 0.2705882, 0, 1,
-1.611917, -0.6647229, -1.23471, 1, 0.2745098, 0, 1,
-1.597805, 0.2696261, -0.4761582, 1, 0.282353, 0, 1,
-1.593122, -0.9220045, -1.879709, 1, 0.2862745, 0, 1,
-1.584232, 1.523068, -3.102885, 1, 0.2941177, 0, 1,
-1.581416, 0.0475226, -1.709733, 1, 0.3019608, 0, 1,
-1.577331, -1.825727, -2.872614, 1, 0.3058824, 0, 1,
-1.571151, 0.9800718, 0.7936413, 1, 0.3137255, 0, 1,
-1.563912, -0.7771183, -1.72996, 1, 0.3176471, 0, 1,
-1.551871, -0.6824355, 0.6041885, 1, 0.3254902, 0, 1,
-1.541573, 0.9619837, 0.8639858, 1, 0.3294118, 0, 1,
-1.541476, -0.5776012, -1.906971, 1, 0.3372549, 0, 1,
-1.536547, -1.196909, -4.857893, 1, 0.3411765, 0, 1,
-1.535095, -0.848128, 0.1299851, 1, 0.3490196, 0, 1,
-1.525571, 1.023802, -1.824086, 1, 0.3529412, 0, 1,
-1.513619, 0.5872914, -2.20223, 1, 0.3607843, 0, 1,
-1.512974, -0.9638541, -3.913604, 1, 0.3647059, 0, 1,
-1.506215, 1.202252, -3.487936, 1, 0.372549, 0, 1,
-1.49149, -0.4655034, -1.389115, 1, 0.3764706, 0, 1,
-1.456054, -0.8701281, -2.105431, 1, 0.3843137, 0, 1,
-1.448912, -0.04964707, -1.273495, 1, 0.3882353, 0, 1,
-1.447, -0.04327874, 0.2201061, 1, 0.3960784, 0, 1,
-1.44334, 0.8244233, -0.3669313, 1, 0.4039216, 0, 1,
-1.43892, -1.221247, -0.5647402, 1, 0.4078431, 0, 1,
-1.437626, -0.7281104, -2.766073, 1, 0.4156863, 0, 1,
-1.433071, 0.3199261, -2.183945, 1, 0.4196078, 0, 1,
-1.433036, -0.0004786421, -2.377088, 1, 0.427451, 0, 1,
-1.43225, 1.324865, 0.2465933, 1, 0.4313726, 0, 1,
-1.428417, 0.07995177, -0.9515649, 1, 0.4392157, 0, 1,
-1.418728, 0.6102702, -1.541272, 1, 0.4431373, 0, 1,
-1.408085, -0.5834436, -3.12975, 1, 0.4509804, 0, 1,
-1.399865, -0.7195068, -4.021199, 1, 0.454902, 0, 1,
-1.386131, -1.030563, -2.33001, 1, 0.4627451, 0, 1,
-1.384414, 0.4817826, -3.428992, 1, 0.4666667, 0, 1,
-1.381975, -0.7258042, -1.845296, 1, 0.4745098, 0, 1,
-1.380984, -1.627964, -3.370304, 1, 0.4784314, 0, 1,
-1.380902, -0.108914, -2.345024, 1, 0.4862745, 0, 1,
-1.372987, 0.8751286, -1.860519, 1, 0.4901961, 0, 1,
-1.358263, -0.4385292, -2.040757, 1, 0.4980392, 0, 1,
-1.357489, -0.3051838, -3.298146, 1, 0.5058824, 0, 1,
-1.350653, 0.4154679, -0.6717368, 1, 0.509804, 0, 1,
-1.33393, 1.274955, -1.618992, 1, 0.5176471, 0, 1,
-1.313128, -0.394411, 0.1308135, 1, 0.5215687, 0, 1,
-1.30778, -0.6851227, -1.843405, 1, 0.5294118, 0, 1,
-1.293443, 0.2392913, 0.3846534, 1, 0.5333334, 0, 1,
-1.289033, 1.633042, -0.1970626, 1, 0.5411765, 0, 1,
-1.282111, -0.4730904, -1.365804, 1, 0.5450981, 0, 1,
-1.280594, 2.097843, -2.175105, 1, 0.5529412, 0, 1,
-1.280565, -2.785021, -4.482565, 1, 0.5568628, 0, 1,
-1.264827, -0.8904445, -2.998381, 1, 0.5647059, 0, 1,
-1.258207, -0.3552324, -2.251113, 1, 0.5686275, 0, 1,
-1.253209, 0.9356984, -3.108523, 1, 0.5764706, 0, 1,
-1.248415, -1.539131, -1.59396, 1, 0.5803922, 0, 1,
-1.242299, 0.7915818, -0.157125, 1, 0.5882353, 0, 1,
-1.23895, 1.167666, 0.4976385, 1, 0.5921569, 0, 1,
-1.222094, -0.4340428, -1.078081, 1, 0.6, 0, 1,
-1.204205, -0.5593362, -1.439241, 1, 0.6078432, 0, 1,
-1.20338, 0.374175, -1.63675, 1, 0.6117647, 0, 1,
-1.197958, 0.4819078, -0.1041695, 1, 0.6196079, 0, 1,
-1.196337, 0.9678752, -1.757864, 1, 0.6235294, 0, 1,
-1.191481, -0.134501, -2.491558, 1, 0.6313726, 0, 1,
-1.18975, -0.5623022, -1.816364, 1, 0.6352941, 0, 1,
-1.173535, -0.2068674, -1.52743, 1, 0.6431373, 0, 1,
-1.169402, 0.2895372, -2.3784, 1, 0.6470588, 0, 1,
-1.165045, 0.3168443, 0.8535064, 1, 0.654902, 0, 1,
-1.16405, -1.499973, -1.910495, 1, 0.6588235, 0, 1,
-1.162796, 0.8646881, 0.2254747, 1, 0.6666667, 0, 1,
-1.160535, -0.1724706, -2.438144, 1, 0.6705883, 0, 1,
-1.152801, -0.4130275, -0.9604351, 1, 0.6784314, 0, 1,
-1.142083, 2.059689, -1.708136, 1, 0.682353, 0, 1,
-1.135316, -1.461629, -1.955306, 1, 0.6901961, 0, 1,
-1.133983, -0.5283902, -2.752114, 1, 0.6941177, 0, 1,
-1.132875, -0.9783122, -2.230356, 1, 0.7019608, 0, 1,
-1.125938, -1.472744, -2.74454, 1, 0.7098039, 0, 1,
-1.125066, 0.6230736, -1.198063, 1, 0.7137255, 0, 1,
-1.123059, 0.05165824, -1.429493, 1, 0.7215686, 0, 1,
-1.121444, 1.043659, -2.492084, 1, 0.7254902, 0, 1,
-1.113815, -0.4446907, -2.444394, 1, 0.7333333, 0, 1,
-1.107307, 0.720629, -1.863678, 1, 0.7372549, 0, 1,
-1.105906, -0.2630161, -1.875964, 1, 0.7450981, 0, 1,
-1.10445, 0.06013648, -0.9472252, 1, 0.7490196, 0, 1,
-1.096457, 1.315365, -1.038617, 1, 0.7568628, 0, 1,
-1.070474, -0.3718702, -0.8751994, 1, 0.7607843, 0, 1,
-1.060235, -1.074927, -3.124669, 1, 0.7686275, 0, 1,
-1.059143, 0.09222569, -1.43302, 1, 0.772549, 0, 1,
-1.052263, -0.9350206, -1.288073, 1, 0.7803922, 0, 1,
-1.051592, -3.017454, -2.798425, 1, 0.7843137, 0, 1,
-1.048862, -0.6649552, -1.406045, 1, 0.7921569, 0, 1,
-1.038542, 0.3509471, -1.57889, 1, 0.7960784, 0, 1,
-1.030129, -0.1368799, -1.501836, 1, 0.8039216, 0, 1,
-1.026164, -0.09154484, -2.386975, 1, 0.8117647, 0, 1,
-1.022118, -1.41116, -3.063769, 1, 0.8156863, 0, 1,
-1.021112, -0.2114674, -1.273075, 1, 0.8235294, 0, 1,
-1.014231, -0.2322695, -0.4494, 1, 0.827451, 0, 1,
-1.009388, 0.1228006, -2.406472, 1, 0.8352941, 0, 1,
-1.006676, -1.896615, -3.85751, 1, 0.8392157, 0, 1,
-1.003302, -0.1982348, -3.319975, 1, 0.8470588, 0, 1,
-1.001655, 1.461997, 1.020488, 1, 0.8509804, 0, 1,
-0.9981647, -0.1448797, -2.289332, 1, 0.8588235, 0, 1,
-0.9957263, -0.1117212, -2.855884, 1, 0.8627451, 0, 1,
-0.9865039, -0.1074461, -0.9646099, 1, 0.8705882, 0, 1,
-0.9852616, 0.7890959, -0.7874687, 1, 0.8745098, 0, 1,
-0.976966, -0.2172458, -2.857051, 1, 0.8823529, 0, 1,
-0.975084, -0.8134876, -2.662352, 1, 0.8862745, 0, 1,
-0.9720749, 1.431043, -1.024218, 1, 0.8941177, 0, 1,
-0.9669368, 1.81834, -1.434872, 1, 0.8980392, 0, 1,
-0.9653246, -0.3385306, -2.859814, 1, 0.9058824, 0, 1,
-0.9613739, -1.296017, -3.720205, 1, 0.9137255, 0, 1,
-0.9576722, 0.2980393, -2.862381, 1, 0.9176471, 0, 1,
-0.9485621, -0.8895317, -1.790387, 1, 0.9254902, 0, 1,
-0.947327, -0.02104883, -2.764429, 1, 0.9294118, 0, 1,
-0.9417598, -0.8822207, -3.675821, 1, 0.9372549, 0, 1,
-0.9369516, -0.7518498, -0.8386084, 1, 0.9411765, 0, 1,
-0.9327058, -1.042776, -2.892815, 1, 0.9490196, 0, 1,
-0.9270734, 0.4481839, -1.350526, 1, 0.9529412, 0, 1,
-0.9256641, -0.3584962, -0.8199781, 1, 0.9607843, 0, 1,
-0.924824, -0.364745, -2.255142, 1, 0.9647059, 0, 1,
-0.9220899, 0.1765197, -1.009942, 1, 0.972549, 0, 1,
-0.9216546, 0.3756769, 0.6604782, 1, 0.9764706, 0, 1,
-0.9204394, 0.6784275, -2.208658, 1, 0.9843137, 0, 1,
-0.9186545, -0.6004187, -1.456091, 1, 0.9882353, 0, 1,
-0.9178067, -0.8955744, -1.810755, 1, 0.9960784, 0, 1,
-0.9168794, -0.4659922, -2.219106, 0.9960784, 1, 0, 1,
-0.904044, 0.3364232, -0.07585949, 0.9921569, 1, 0, 1,
-0.8993703, 0.2827528, -1.112217, 0.9843137, 1, 0, 1,
-0.8948668, 0.8143756, -1.611315, 0.9803922, 1, 0, 1,
-0.8826013, 0.03829993, -0.9659758, 0.972549, 1, 0, 1,
-0.8821993, 0.4828223, -1.180766, 0.9686275, 1, 0, 1,
-0.8664758, -0.1323862, -1.429203, 0.9607843, 1, 0, 1,
-0.8607379, -0.246433, -2.153794, 0.9568627, 1, 0, 1,
-0.8600123, 0.2937972, -1.09007, 0.9490196, 1, 0, 1,
-0.8565608, 0.1930787, -1.310628, 0.945098, 1, 0, 1,
-0.8547406, -0.1973527, -1.089451, 0.9372549, 1, 0, 1,
-0.8544149, -0.9999551, -3.125807, 0.9333333, 1, 0, 1,
-0.8520517, -0.9675503, -2.194592, 0.9254902, 1, 0, 1,
-0.8512691, 0.1821386, -1.95061, 0.9215686, 1, 0, 1,
-0.8487054, -0.2604447, -3.859478, 0.9137255, 1, 0, 1,
-0.8432333, -0.6462966, -1.796119, 0.9098039, 1, 0, 1,
-0.84201, 2.283778, -0.8043289, 0.9019608, 1, 0, 1,
-0.8402718, 1.111826, -1.982223, 0.8941177, 1, 0, 1,
-0.8391031, -0.4338459, -2.047646, 0.8901961, 1, 0, 1,
-0.836652, -0.4760564, -1.982131, 0.8823529, 1, 0, 1,
-0.8328285, -0.5008661, -0.2404741, 0.8784314, 1, 0, 1,
-0.8242394, -0.2962341, -2.311198, 0.8705882, 1, 0, 1,
-0.8185771, 1.102795, -1.385745, 0.8666667, 1, 0, 1,
-0.8104056, -1.018465, -2.872194, 0.8588235, 1, 0, 1,
-0.8059577, 1.500906, -0.6542356, 0.854902, 1, 0, 1,
-0.8026871, -0.2621534, -0.2493002, 0.8470588, 1, 0, 1,
-0.8011696, -0.4088434, -0.5131247, 0.8431373, 1, 0, 1,
-0.7958139, 1.363132, -1.790652, 0.8352941, 1, 0, 1,
-0.7884209, 1.039306, -0.04787194, 0.8313726, 1, 0, 1,
-0.781406, -1.020281, -2.69764, 0.8235294, 1, 0, 1,
-0.7790614, -1.113083, -3.010098, 0.8196079, 1, 0, 1,
-0.7761215, 0.7199919, -2.657049, 0.8117647, 1, 0, 1,
-0.7738644, -0.7760361, -2.043102, 0.8078431, 1, 0, 1,
-0.7654634, -0.5651647, -3.035072, 0.8, 1, 0, 1,
-0.7624113, 0.09723005, -0.9644829, 0.7921569, 1, 0, 1,
-0.7590632, 0.02004262, -1.929063, 0.7882353, 1, 0, 1,
-0.7440908, -0.3504045, -1.198115, 0.7803922, 1, 0, 1,
-0.7426464, 1.096579, -1.206709, 0.7764706, 1, 0, 1,
-0.7414921, -0.03796021, -1.274392, 0.7686275, 1, 0, 1,
-0.7370136, 0.755728, -0.9200408, 0.7647059, 1, 0, 1,
-0.7355371, -0.5688457, -2.118446, 0.7568628, 1, 0, 1,
-0.7321623, 1.678869, 0.4577689, 0.7529412, 1, 0, 1,
-0.7317904, -0.8765134, -3.408227, 0.7450981, 1, 0, 1,
-0.7283645, 0.2456678, -1.435277, 0.7411765, 1, 0, 1,
-0.7221407, 2.140253, 0.2531257, 0.7333333, 1, 0, 1,
-0.7212834, 0.9672951, -0.6875729, 0.7294118, 1, 0, 1,
-0.7196147, 1.687679, 1.011044, 0.7215686, 1, 0, 1,
-0.7181737, 0.3097854, -0.4252535, 0.7176471, 1, 0, 1,
-0.7123249, 0.5796297, -0.7052093, 0.7098039, 1, 0, 1,
-0.7115135, 0.1432929, -1.652251, 0.7058824, 1, 0, 1,
-0.7088603, 1.222294, -0.5406811, 0.6980392, 1, 0, 1,
-0.708195, -0.5221393, -1.498209, 0.6901961, 1, 0, 1,
-0.6962565, -0.3997849, -2.803144, 0.6862745, 1, 0, 1,
-0.6950406, -0.2387186, -1.38953, 0.6784314, 1, 0, 1,
-0.6880975, -1.06112, -3.902666, 0.6745098, 1, 0, 1,
-0.6816594, -0.8278418, -4.078535, 0.6666667, 1, 0, 1,
-0.6816279, 0.2239888, -2.068106, 0.6627451, 1, 0, 1,
-0.6784247, 0.3415788, -1.86997, 0.654902, 1, 0, 1,
-0.6781181, 0.1688257, -0.583881, 0.6509804, 1, 0, 1,
-0.6701669, 1.487847, -1.727502, 0.6431373, 1, 0, 1,
-0.6689986, -0.7441165, -3.41, 0.6392157, 1, 0, 1,
-0.6688964, 2.011314, 0.007925038, 0.6313726, 1, 0, 1,
-0.6669412, 0.7500149, -1.309468, 0.627451, 1, 0, 1,
-0.6626574, 1.030055, -1.910722, 0.6196079, 1, 0, 1,
-0.6549646, 1.379423, -0.8355222, 0.6156863, 1, 0, 1,
-0.6545877, 1.410402, -0.9853744, 0.6078432, 1, 0, 1,
-0.6528507, 1.230321, -2.124706, 0.6039216, 1, 0, 1,
-0.6519247, -0.004587261, -1.804838, 0.5960785, 1, 0, 1,
-0.6507952, -0.4850987, -1.748622, 0.5882353, 1, 0, 1,
-0.6427711, 0.705812, -1.066802, 0.5843138, 1, 0, 1,
-0.6418597, -0.03038704, -0.643676, 0.5764706, 1, 0, 1,
-0.6400568, -0.7309605, -1.860738, 0.572549, 1, 0, 1,
-0.6374591, -0.3595273, -1.085189, 0.5647059, 1, 0, 1,
-0.6353914, 0.7472326, 0.7315134, 0.5607843, 1, 0, 1,
-0.6332304, 0.11927, -2.25576, 0.5529412, 1, 0, 1,
-0.6309692, -0.5431241, -2.121232, 0.5490196, 1, 0, 1,
-0.626897, 0.2065961, -1.617441, 0.5411765, 1, 0, 1,
-0.625888, 1.370021, 0.2534322, 0.5372549, 1, 0, 1,
-0.624557, 1.514818, 0.01068524, 0.5294118, 1, 0, 1,
-0.62251, -0.2973832, -2.080476, 0.5254902, 1, 0, 1,
-0.6195185, -1.120842, -1.813877, 0.5176471, 1, 0, 1,
-0.6167609, -0.6552282, -1.252654, 0.5137255, 1, 0, 1,
-0.6148744, 0.5933951, -0.0793475, 0.5058824, 1, 0, 1,
-0.6132005, -1.374207, -3.326975, 0.5019608, 1, 0, 1,
-0.610325, -2.000757, -3.855591, 0.4941176, 1, 0, 1,
-0.6102623, 0.683275, 0.3932685, 0.4862745, 1, 0, 1,
-0.6086879, -0.722079, -2.766196, 0.4823529, 1, 0, 1,
-0.6053734, 1.073036, 0.3374906, 0.4745098, 1, 0, 1,
-0.600683, -0.0636808, -0.8644428, 0.4705882, 1, 0, 1,
-0.5949783, -1.06642, -2.510607, 0.4627451, 1, 0, 1,
-0.5941377, 0.2038692, -1.330172, 0.4588235, 1, 0, 1,
-0.5928547, -0.4477811, -1.981281, 0.4509804, 1, 0, 1,
-0.5923159, 1.325811, -0.2645743, 0.4470588, 1, 0, 1,
-0.5859528, -2.19959, -1.625607, 0.4392157, 1, 0, 1,
-0.5762124, -0.0226828, -1.608991, 0.4352941, 1, 0, 1,
-0.5744944, -1.898263, -2.121472, 0.427451, 1, 0, 1,
-0.5705694, 1.235012, 0.4437094, 0.4235294, 1, 0, 1,
-0.5700649, 0.2446108, -3.252968, 0.4156863, 1, 0, 1,
-0.5679192, 0.2332564, -1.890154, 0.4117647, 1, 0, 1,
-0.5678056, 1.658514, -1.568185, 0.4039216, 1, 0, 1,
-0.5655103, -0.939593, -3.538323, 0.3960784, 1, 0, 1,
-0.5650547, -0.8412316, -2.398437, 0.3921569, 1, 0, 1,
-0.5602986, -1.077756, -3.429609, 0.3843137, 1, 0, 1,
-0.5571362, -1.059201, -2.676569, 0.3803922, 1, 0, 1,
-0.5478852, -2.089289, -5.563867, 0.372549, 1, 0, 1,
-0.5466012, 0.1007743, -3.077953, 0.3686275, 1, 0, 1,
-0.5452383, 0.1197939, -1.576764, 0.3607843, 1, 0, 1,
-0.5449732, -2.469441, -2.837359, 0.3568628, 1, 0, 1,
-0.5378718, -0.4799037, -1.450173, 0.3490196, 1, 0, 1,
-0.5356978, 0.3886998, -1.097481, 0.345098, 1, 0, 1,
-0.5330839, 1.277987, -0.2751849, 0.3372549, 1, 0, 1,
-0.5306989, -2.624356, -2.410589, 0.3333333, 1, 0, 1,
-0.5281211, -0.08472137, -2.233469, 0.3254902, 1, 0, 1,
-0.5198539, -0.3642385, -1.204834, 0.3215686, 1, 0, 1,
-0.5158558, -1.102557, -3.970812, 0.3137255, 1, 0, 1,
-0.5132497, -0.7570382, -0.5575334, 0.3098039, 1, 0, 1,
-0.512652, 0.3846684, -0.3802448, 0.3019608, 1, 0, 1,
-0.50372, 0.5559533, -0.9930223, 0.2941177, 1, 0, 1,
-0.5026827, 0.6109752, -0.3385349, 0.2901961, 1, 0, 1,
-0.501861, -0.9953445, -2.119004, 0.282353, 1, 0, 1,
-0.5017074, -1.640358, -2.686042, 0.2784314, 1, 0, 1,
-0.5010428, -0.7167397, -2.336122, 0.2705882, 1, 0, 1,
-0.5005199, -1.87329, -2.086301, 0.2666667, 1, 0, 1,
-0.4990443, -0.3550969, -1.90658, 0.2588235, 1, 0, 1,
-0.4944071, -1.990157, -3.191414, 0.254902, 1, 0, 1,
-0.4942796, 0.4721724, 1.024372, 0.2470588, 1, 0, 1,
-0.4869851, -1.064676, -2.336694, 0.2431373, 1, 0, 1,
-0.486957, 2.228952, -0.6155041, 0.2352941, 1, 0, 1,
-0.483483, 1.134361, -1.277834, 0.2313726, 1, 0, 1,
-0.4832799, 0.7728803, 0.1079173, 0.2235294, 1, 0, 1,
-0.4810257, -1.420213, -2.869872, 0.2196078, 1, 0, 1,
-0.4797586, 1.332034, -0.01425072, 0.2117647, 1, 0, 1,
-0.4721963, -0.5713981, -0.200143, 0.2078431, 1, 0, 1,
-0.4704233, -1.391804, -4.126521, 0.2, 1, 0, 1,
-0.469953, 0.2399286, -0.1886069, 0.1921569, 1, 0, 1,
-0.4698912, 0.4307793, -1.268208, 0.1882353, 1, 0, 1,
-0.4669824, 0.2933158, -0.4419863, 0.1803922, 1, 0, 1,
-0.4653339, -0.9141982, -2.6641, 0.1764706, 1, 0, 1,
-0.4619524, -0.4598687, -1.67497, 0.1686275, 1, 0, 1,
-0.4405836, 0.5109805, -0.804643, 0.1647059, 1, 0, 1,
-0.4388494, -1.288085, -1.100936, 0.1568628, 1, 0, 1,
-0.4380346, 0.3176149, 1.054594, 0.1529412, 1, 0, 1,
-0.4370575, -1.617735, -1.577731, 0.145098, 1, 0, 1,
-0.4337483, 0.146414, -0.7771227, 0.1411765, 1, 0, 1,
-0.4334017, 1.972843, 0.4797312, 0.1333333, 1, 0, 1,
-0.4236837, 2.275373, 0.7754561, 0.1294118, 1, 0, 1,
-0.4224218, 1.636456, -0.0481493, 0.1215686, 1, 0, 1,
-0.4201088, 0.330688, 0.08966221, 0.1176471, 1, 0, 1,
-0.4191196, 0.5377994, -0.05478772, 0.1098039, 1, 0, 1,
-0.4180715, -0.9872775, -1.999541, 0.1058824, 1, 0, 1,
-0.4109533, -1.127439, -1.724813, 0.09803922, 1, 0, 1,
-0.4093518, -0.01994378, -1.512939, 0.09019608, 1, 0, 1,
-0.4026513, 0.0558847, -1.843917, 0.08627451, 1, 0, 1,
-0.4019034, 0.01927114, -1.643538, 0.07843138, 1, 0, 1,
-0.4015492, 0.9011164, -1.599486, 0.07450981, 1, 0, 1,
-0.3932115, -0.2955374, -2.244133, 0.06666667, 1, 0, 1,
-0.3929057, -1.380806, -2.543583, 0.0627451, 1, 0, 1,
-0.3913781, -2.005623, -2.03242, 0.05490196, 1, 0, 1,
-0.3907199, 0.4715867, 0.5557972, 0.05098039, 1, 0, 1,
-0.3869604, -0.5577774, -3.863895, 0.04313726, 1, 0, 1,
-0.3828164, -1.714193, -2.035634, 0.03921569, 1, 0, 1,
-0.3779822, -1.00178, -2.298088, 0.03137255, 1, 0, 1,
-0.3656861, 1.356655, 0.7358256, 0.02745098, 1, 0, 1,
-0.362926, -0.08464887, -2.972984, 0.01960784, 1, 0, 1,
-0.3581438, 0.574096, -0.4727989, 0.01568628, 1, 0, 1,
-0.358095, 0.6417972, -2.15935, 0.007843138, 1, 0, 1,
-0.3555524, 0.8013377, -1.172532, 0.003921569, 1, 0, 1,
-0.354333, 0.3825425, -0.9637056, 0, 1, 0.003921569, 1,
-0.3522288, 1.381345, 0.1620319, 0, 1, 0.01176471, 1,
-0.3515399, 1.581737, -1.339767, 0, 1, 0.01568628, 1,
-0.3478018, 1.461706, 1.589878, 0, 1, 0.02352941, 1,
-0.3392074, 0.03095615, -2.338377, 0, 1, 0.02745098, 1,
-0.335938, -0.9618971, -3.378173, 0, 1, 0.03529412, 1,
-0.3339982, 0.1012498, -1.542472, 0, 1, 0.03921569, 1,
-0.3238827, 0.8795711, -0.7029038, 0, 1, 0.04705882, 1,
-0.3203118, -0.6129572, -2.81321, 0, 1, 0.05098039, 1,
-0.3155993, 1.78332, -1.351045, 0, 1, 0.05882353, 1,
-0.3143101, 1.669182, -0.782976, 0, 1, 0.0627451, 1,
-0.3118723, 1.227248, 0.06526826, 0, 1, 0.07058824, 1,
-0.311799, 0.7986804, -0.7689524, 0, 1, 0.07450981, 1,
-0.3075707, 0.1707901, -0.794052, 0, 1, 0.08235294, 1,
-0.2994002, -1.934212, -2.550222, 0, 1, 0.08627451, 1,
-0.2974865, -0.6583146, -2.719496, 0, 1, 0.09411765, 1,
-0.2907426, 1.305598, -1.913569, 0, 1, 0.1019608, 1,
-0.290497, -1.158296, -0.7181216, 0, 1, 0.1058824, 1,
-0.2893232, -0.9683757, -2.916981, 0, 1, 0.1137255, 1,
-0.2863247, 0.1842563, -0.5979891, 0, 1, 0.1176471, 1,
-0.2857654, 2.556045, 0.9203691, 0, 1, 0.1254902, 1,
-0.2829473, 1.055727, 0.598132, 0, 1, 0.1294118, 1,
-0.2820799, 0.4819862, -2.123732, 0, 1, 0.1372549, 1,
-0.2809571, -0.1899211, -0.454196, 0, 1, 0.1411765, 1,
-0.2801252, -0.7552486, -2.516763, 0, 1, 0.1490196, 1,
-0.277054, 0.03188332, -2.227126, 0, 1, 0.1529412, 1,
-0.2758513, -1.261264, -1.90846, 0, 1, 0.1607843, 1,
-0.2737033, 1.601365, -1.369961, 0, 1, 0.1647059, 1,
-0.2709938, 0.5178106, -1.887865, 0, 1, 0.172549, 1,
-0.270496, 0.09673861, -1.052833, 0, 1, 0.1764706, 1,
-0.2642011, 1.390402, -0.9246964, 0, 1, 0.1843137, 1,
-0.262147, 0.5438774, -1.411623, 0, 1, 0.1882353, 1,
-0.2618927, -0.9175193, -3.185316, 0, 1, 0.1960784, 1,
-0.2610015, 0.9749283, -1.93449, 0, 1, 0.2039216, 1,
-0.2591577, -0.6139911, -3.697306, 0, 1, 0.2078431, 1,
-0.258565, 0.9852656, 1.498846, 0, 1, 0.2156863, 1,
-0.2578374, -0.04917473, -3.443373, 0, 1, 0.2196078, 1,
-0.2540457, -1.607371, -3.757518, 0, 1, 0.227451, 1,
-0.2444924, 0.7888438, -1.440479, 0, 1, 0.2313726, 1,
-0.24112, 0.4695249, 0.318377, 0, 1, 0.2392157, 1,
-0.2376827, 1.21683, -0.7080718, 0, 1, 0.2431373, 1,
-0.2357029, -0.7632856, -2.905467, 0, 1, 0.2509804, 1,
-0.2355209, -0.2719634, -4.059787, 0, 1, 0.254902, 1,
-0.2316327, -0.1034093, -1.381842, 0, 1, 0.2627451, 1,
-0.229832, 1.17434, 0.1881473, 0, 1, 0.2666667, 1,
-0.2265609, -0.1378763, -2.332841, 0, 1, 0.2745098, 1,
-0.2244674, 1.207281, -1.521913, 0, 1, 0.2784314, 1,
-0.2240507, -0.01954143, -2.19171, 0, 1, 0.2862745, 1,
-0.2212151, -0.8233051, -2.033689, 0, 1, 0.2901961, 1,
-0.218363, -2.06496, -2.5928, 0, 1, 0.2980392, 1,
-0.2154528, 0.4078583, -1.988616, 0, 1, 0.3058824, 1,
-0.2145081, -0.8888004, -2.323896, 0, 1, 0.3098039, 1,
-0.2066866, 0.7009623, 0.326446, 0, 1, 0.3176471, 1,
-0.2061566, -1.324451, -1.38198, 0, 1, 0.3215686, 1,
-0.2045038, -1.190782, -1.018586, 0, 1, 0.3294118, 1,
-0.2027273, 0.5628476, -1.002989, 0, 1, 0.3333333, 1,
-0.2015273, -0.114581, -1.783175, 0, 1, 0.3411765, 1,
-0.2004706, 0.4849846, 1.639646, 0, 1, 0.345098, 1,
-0.1964087, -0.8890771, -4.71106, 0, 1, 0.3529412, 1,
-0.1957625, -0.06337331, -0.8286505, 0, 1, 0.3568628, 1,
-0.1947323, 0.6885152, 0.2041269, 0, 1, 0.3647059, 1,
-0.1941558, -0.4847798, -3.711865, 0, 1, 0.3686275, 1,
-0.1867301, -1.603145, -4.257266, 0, 1, 0.3764706, 1,
-0.1853235, -1.474676, -2.766568, 0, 1, 0.3803922, 1,
-0.1836519, 0.7053553, 1.120981, 0, 1, 0.3882353, 1,
-0.1834409, -1.307144, -4.723774, 0, 1, 0.3921569, 1,
-0.182795, 0.9346181, -1.048119, 0, 1, 0.4, 1,
-0.1816771, 1.05952, 1.142868, 0, 1, 0.4078431, 1,
-0.1770583, -0.2257818, -2.016284, 0, 1, 0.4117647, 1,
-0.1677978, -0.301306, -2.124124, 0, 1, 0.4196078, 1,
-0.1617697, -2.49807, -3.222861, 0, 1, 0.4235294, 1,
-0.1565906, 0.4482311, -2.17659, 0, 1, 0.4313726, 1,
-0.1547894, 1.871262, -1.719434, 0, 1, 0.4352941, 1,
-0.1415186, 0.5914561, -0.1195389, 0, 1, 0.4431373, 1,
-0.1405765, -0.8589451, -3.604204, 0, 1, 0.4470588, 1,
-0.1382341, -0.4517403, -1.87683, 0, 1, 0.454902, 1,
-0.1375046, -0.8882566, -3.505973, 0, 1, 0.4588235, 1,
-0.137203, 1.733583, 0.05799993, 0, 1, 0.4666667, 1,
-0.1367042, -1.502978, -1.977501, 0, 1, 0.4705882, 1,
-0.1337114, 0.1442554, 0.1471767, 0, 1, 0.4784314, 1,
-0.1318828, -0.4550827, -2.429157, 0, 1, 0.4823529, 1,
-0.1305238, -0.2969816, -3.45974, 0, 1, 0.4901961, 1,
-0.1245722, 1.4964, -0.07021649, 0, 1, 0.4941176, 1,
-0.1222122, -0.1958534, -4.14731, 0, 1, 0.5019608, 1,
-0.11646, 0.361749, -1.434063, 0, 1, 0.509804, 1,
-0.1134279, -0.1727612, -3.596472, 0, 1, 0.5137255, 1,
-0.1099784, 0.4659353, -0.6270685, 0, 1, 0.5215687, 1,
-0.1044142, -0.8241006, -4.628309, 0, 1, 0.5254902, 1,
-0.09912658, -1.10647, -1.017606, 0, 1, 0.5333334, 1,
-0.09820691, 0.9769163, 0.004587449, 0, 1, 0.5372549, 1,
-0.09386895, -0.4571256, -1.786029, 0, 1, 0.5450981, 1,
-0.0935759, -1.07855, -1.456205, 0, 1, 0.5490196, 1,
-0.09109294, 2.250456, 1.560329, 0, 1, 0.5568628, 1,
-0.09106771, 1.048594, 1.841491, 0, 1, 0.5607843, 1,
-0.0909657, -0.1831889, -2.354572, 0, 1, 0.5686275, 1,
-0.09036227, 0.6279798, 1.185814, 0, 1, 0.572549, 1,
-0.08973113, -0.4154876, -1.353221, 0, 1, 0.5803922, 1,
-0.0864606, 0.2469149, -1.305343, 0, 1, 0.5843138, 1,
-0.08392754, 0.7729673, -1.33952, 0, 1, 0.5921569, 1,
-0.07993138, -1.149736, -3.916385, 0, 1, 0.5960785, 1,
-0.07893106, 0.1718953, 0.3115918, 0, 1, 0.6039216, 1,
-0.07782287, -0.288785, -2.611239, 0, 1, 0.6117647, 1,
-0.07774642, 0.914483, -0.09810197, 0, 1, 0.6156863, 1,
-0.07471963, -0.2227311, -0.9944062, 0, 1, 0.6235294, 1,
-0.07407563, -1.073881, -3.458123, 0, 1, 0.627451, 1,
-0.07092925, 0.8689013, -0.6737551, 0, 1, 0.6352941, 1,
-0.06433957, -1.082353, -3.04492, 0, 1, 0.6392157, 1,
-0.06298252, -1.729586, -0.09160393, 0, 1, 0.6470588, 1,
-0.0590423, 1.353861, -1.115409, 0, 1, 0.6509804, 1,
-0.05421032, 0.2657259, 0.4450862, 0, 1, 0.6588235, 1,
-0.05084709, -0.2504496, -2.617795, 0, 1, 0.6627451, 1,
-0.05058071, 1.960961, -0.3482438, 0, 1, 0.6705883, 1,
-0.04698715, 0.009689924, -2.275715, 0, 1, 0.6745098, 1,
-0.04624933, 0.08285144, -0.492491, 0, 1, 0.682353, 1,
-0.04519664, 1.164797, -1.070619, 0, 1, 0.6862745, 1,
-0.04283732, -1.3762, -2.874269, 0, 1, 0.6941177, 1,
-0.04180697, -0.5828162, -2.455392, 0, 1, 0.7019608, 1,
-0.04014256, 0.6682683, -0.4316261, 0, 1, 0.7058824, 1,
-0.02956672, 1.127079, 0.5054538, 0, 1, 0.7137255, 1,
-0.02368028, 0.1200836, -1.868964, 0, 1, 0.7176471, 1,
-0.02351873, 1.370983, -0.2605093, 0, 1, 0.7254902, 1,
-0.01652037, 0.1527266, 0.441308, 0, 1, 0.7294118, 1,
-0.01493514, -0.06826425, -2.421604, 0, 1, 0.7372549, 1,
-0.01301358, 1.050473, 1.444299, 0, 1, 0.7411765, 1,
-0.01192705, -2.079563, -1.753168, 0, 1, 0.7490196, 1,
-0.011077, -0.1336804, -1.709982, 0, 1, 0.7529412, 1,
-0.009752244, -1.550018, -3.544433, 0, 1, 0.7607843, 1,
-0.007875917, -0.4407586, -3.165856, 0, 1, 0.7647059, 1,
-0.005261505, -0.3079447, -3.353022, 0, 1, 0.772549, 1,
-0.002893693, -0.7417928, -3.003824, 0, 1, 0.7764706, 1,
-0.002578902, 1.149337, -1.229417, 0, 1, 0.7843137, 1,
-0.002548534, -0.1779021, -2.244902, 0, 1, 0.7882353, 1,
0.001266822, -1.003855, 4.410322, 0, 1, 0.7960784, 1,
0.003578287, -0.4081612, 4.873872, 0, 1, 0.8039216, 1,
0.003776912, -0.8288318, 3.607696, 0, 1, 0.8078431, 1,
0.004728525, -0.6696195, 2.317166, 0, 1, 0.8156863, 1,
0.008949559, 1.284317, 0.6024942, 0, 1, 0.8196079, 1,
0.01046893, 0.4818867, 0.3755209, 0, 1, 0.827451, 1,
0.01278031, 0.7888072, -1.342051, 0, 1, 0.8313726, 1,
0.0168674, 0.5235667, -2.831941, 0, 1, 0.8392157, 1,
0.01923663, -0.7965295, 4.415007, 0, 1, 0.8431373, 1,
0.02010148, 1.048999, 1.957348, 0, 1, 0.8509804, 1,
0.02132756, -0.5571722, 1.198377, 0, 1, 0.854902, 1,
0.02372764, -0.8492485, 3.244606, 0, 1, 0.8627451, 1,
0.02766215, 1.282074, -0.5088967, 0, 1, 0.8666667, 1,
0.03337121, -2.09112, 1.775114, 0, 1, 0.8745098, 1,
0.0334287, 1.479088, -1.443935, 0, 1, 0.8784314, 1,
0.03655548, -1.552053, 2.975507, 0, 1, 0.8862745, 1,
0.03849803, -0.8512549, 2.87043, 0, 1, 0.8901961, 1,
0.03967875, 0.2148571, 0.3714169, 0, 1, 0.8980392, 1,
0.04194758, -0.6512282, 1.084826, 0, 1, 0.9058824, 1,
0.04287222, -1.568944, 3.619588, 0, 1, 0.9098039, 1,
0.04574953, -0.3893045, 3.514103, 0, 1, 0.9176471, 1,
0.04586251, -1.67948, 2.441199, 0, 1, 0.9215686, 1,
0.04649895, 0.06670731, 0.2227671, 0, 1, 0.9294118, 1,
0.04677283, 1.745914, -0.4857501, 0, 1, 0.9333333, 1,
0.05146726, -0.7732127, 3.786657, 0, 1, 0.9411765, 1,
0.05275111, 0.435044, -0.06739422, 0, 1, 0.945098, 1,
0.05410448, 0.1881079, -1.859746, 0, 1, 0.9529412, 1,
0.05778228, -0.176323, 3.131562, 0, 1, 0.9568627, 1,
0.06264195, -1.407062, 4.366717, 0, 1, 0.9647059, 1,
0.06309822, -0.8256001, 2.023807, 0, 1, 0.9686275, 1,
0.0637079, -0.1215082, 2.353076, 0, 1, 0.9764706, 1,
0.0677485, -0.7191762, 4.872855, 0, 1, 0.9803922, 1,
0.07072199, -1.310933, 2.987973, 0, 1, 0.9882353, 1,
0.07298461, -0.6450982, 2.526986, 0, 1, 0.9921569, 1,
0.0770947, -0.4741294, 3.630608, 0, 1, 1, 1,
0.08156263, 1.237246, -1.179147, 0, 0.9921569, 1, 1,
0.08516361, -0.2187243, 2.921411, 0, 0.9882353, 1, 1,
0.08698981, 0.8515269, -0.3104966, 0, 0.9803922, 1, 1,
0.08701017, 1.067822, -1.382335, 0, 0.9764706, 1, 1,
0.08867099, -0.7960036, 3.120061, 0, 0.9686275, 1, 1,
0.08902134, -1.719221, 4.723282, 0, 0.9647059, 1, 1,
0.0923286, 1.37455, 0.6249914, 0, 0.9568627, 1, 1,
0.0939298, 0.1693521, 1.183287, 0, 0.9529412, 1, 1,
0.09670001, 2.60366, -0.3996882, 0, 0.945098, 1, 1,
0.09783223, -0.7226688, 4.007421, 0, 0.9411765, 1, 1,
0.1001298, -0.7248632, 1.888435, 0, 0.9333333, 1, 1,
0.1048499, -0.2463863, 3.37765, 0, 0.9294118, 1, 1,
0.1086675, 0.1789158, 0.1500247, 0, 0.9215686, 1, 1,
0.1101987, -0.803618, 1.843132, 0, 0.9176471, 1, 1,
0.1102652, 1.82507, -0.5115594, 0, 0.9098039, 1, 1,
0.1140465, -1.063305, 3.837194, 0, 0.9058824, 1, 1,
0.1148245, 1.177783, -2.289239, 0, 0.8980392, 1, 1,
0.1176507, -0.6832294, 1.938441, 0, 0.8901961, 1, 1,
0.1191785, 0.2083661, 0.2653075, 0, 0.8862745, 1, 1,
0.119699, 0.4461264, 1.326978, 0, 0.8784314, 1, 1,
0.12037, -0.2420233, 3.692349, 0, 0.8745098, 1, 1,
0.1291424, 3.313943, 0.9726731, 0, 0.8666667, 1, 1,
0.1315457, 0.4567024, 0.2771859, 0, 0.8627451, 1, 1,
0.1315575, -0.9542741, 2.642227, 0, 0.854902, 1, 1,
0.1332701, 1.722689, 1.22195, 0, 0.8509804, 1, 1,
0.1362629, -0.4785264, 0.8041457, 0, 0.8431373, 1, 1,
0.1379577, -1.111902, 3.031421, 0, 0.8392157, 1, 1,
0.1390516, -1.682045, 2.979917, 0, 0.8313726, 1, 1,
0.148053, -0.5077755, 2.422493, 0, 0.827451, 1, 1,
0.1481122, -0.5844884, 2.584735, 0, 0.8196079, 1, 1,
0.1490173, 0.05942677, 1.946261, 0, 0.8156863, 1, 1,
0.1563581, 0.5279558, -1.109384, 0, 0.8078431, 1, 1,
0.1606161, -0.7336596, 0.881617, 0, 0.8039216, 1, 1,
0.1628286, 0.2669465, -0.6935464, 0, 0.7960784, 1, 1,
0.1651613, 0.8714287, 0.187561, 0, 0.7882353, 1, 1,
0.1652268, -1.501184, 3.112566, 0, 0.7843137, 1, 1,
0.1667854, 1.464399, -1.007348, 0, 0.7764706, 1, 1,
0.1680368, -0.1284013, 0.9811704, 0, 0.772549, 1, 1,
0.1710427, 0.6384228, 0.7387705, 0, 0.7647059, 1, 1,
0.1737424, 0.04089479, 0.6115786, 0, 0.7607843, 1, 1,
0.1739148, 0.3684835, 1.635761, 0, 0.7529412, 1, 1,
0.1749035, 0.7064404, 0.409812, 0, 0.7490196, 1, 1,
0.1755604, 1.171353, 0.4862337, 0, 0.7411765, 1, 1,
0.1782186, -1.138214, 3.177691, 0, 0.7372549, 1, 1,
0.1801711, 1.25003, -0.07376406, 0, 0.7294118, 1, 1,
0.1829929, -1.16817, 2.650184, 0, 0.7254902, 1, 1,
0.185343, 1.262658, 2.094463, 0, 0.7176471, 1, 1,
0.1862309, -1.272224, 2.375125, 0, 0.7137255, 1, 1,
0.1891182, -0.4846341, 1.905158, 0, 0.7058824, 1, 1,
0.1925762, -1.31678, 3.916461, 0, 0.6980392, 1, 1,
0.2004557, 0.2965347, -0.9978602, 0, 0.6941177, 1, 1,
0.2012959, -2.929992, 2.541509, 0, 0.6862745, 1, 1,
0.2020792, 0.06273992, 0.01746845, 0, 0.682353, 1, 1,
0.2043077, 0.9395387, 0.2959124, 0, 0.6745098, 1, 1,
0.2053243, -0.7877527, 2.306483, 0, 0.6705883, 1, 1,
0.2086387, 0.6709369, 1.472611, 0, 0.6627451, 1, 1,
0.2122187, 0.3095891, 1.678267, 0, 0.6588235, 1, 1,
0.2137795, 0.5664069, -0.8913333, 0, 0.6509804, 1, 1,
0.2140059, 0.3813542, 1.302157, 0, 0.6470588, 1, 1,
0.2158142, 2.21781, 0.3885981, 0, 0.6392157, 1, 1,
0.2195366, 0.5959617, -0.4700932, 0, 0.6352941, 1, 1,
0.2207181, -0.717472, 4.283737, 0, 0.627451, 1, 1,
0.2212138, -1.32292, 4.624659, 0, 0.6235294, 1, 1,
0.2214562, -0.5497345, 0.6593786, 0, 0.6156863, 1, 1,
0.2229419, -0.2772786, 2.731619, 0, 0.6117647, 1, 1,
0.2240284, 1.371126, 1.718296, 0, 0.6039216, 1, 1,
0.2241922, -1.100029, 3.8438, 0, 0.5960785, 1, 1,
0.2288482, 0.2919998, -0.0602468, 0, 0.5921569, 1, 1,
0.2296322, -0.7456041, 3.77536, 0, 0.5843138, 1, 1,
0.2314534, -1.656563, 3.223119, 0, 0.5803922, 1, 1,
0.2341137, -1.592803, 3.31436, 0, 0.572549, 1, 1,
0.2354733, -0.9342176, 2.144818, 0, 0.5686275, 1, 1,
0.2355129, -0.1172733, 1.905027, 0, 0.5607843, 1, 1,
0.24083, -0.4218324, 2.647817, 0, 0.5568628, 1, 1,
0.2427811, 0.6443101, 0.03186327, 0, 0.5490196, 1, 1,
0.247735, -0.9886123, 3.057921, 0, 0.5450981, 1, 1,
0.2506066, 0.6060295, 1.171384, 0, 0.5372549, 1, 1,
0.2565447, -1.798518, 2.311828, 0, 0.5333334, 1, 1,
0.2612833, 1.052568, 0.98102, 0, 0.5254902, 1, 1,
0.2666984, 0.1942567, 2.614973, 0, 0.5215687, 1, 1,
0.2673442, -2.06856, 3.558937, 0, 0.5137255, 1, 1,
0.2693152, -1.427829, 2.338401, 0, 0.509804, 1, 1,
0.270266, 0.6334217, -0.2435389, 0, 0.5019608, 1, 1,
0.2714394, -0.2442403, 2.329733, 0, 0.4941176, 1, 1,
0.2800834, 0.8554267, -0.1192078, 0, 0.4901961, 1, 1,
0.2829663, -1.330274, 2.724399, 0, 0.4823529, 1, 1,
0.2872819, -0.5399137, 4.830445, 0, 0.4784314, 1, 1,
0.2907654, -0.03072282, 0.8833763, 0, 0.4705882, 1, 1,
0.2942319, -0.7896825, 3.131053, 0, 0.4666667, 1, 1,
0.2978897, -0.6509657, 3.296961, 0, 0.4588235, 1, 1,
0.2994085, 1.025554, -0.17409, 0, 0.454902, 1, 1,
0.300065, 1.034081, 1.048655, 0, 0.4470588, 1, 1,
0.3008422, -0.5055887, 3.342422, 0, 0.4431373, 1, 1,
0.3021145, -0.2569007, 1.576768, 0, 0.4352941, 1, 1,
0.302246, -1.632953, 3.77583, 0, 0.4313726, 1, 1,
0.3025401, -2.163112, 2.934889, 0, 0.4235294, 1, 1,
0.3077312, 0.9818441, -1.434986, 0, 0.4196078, 1, 1,
0.3087903, 0.2536879, 2.842331, 0, 0.4117647, 1, 1,
0.3098718, -0.3596747, 3.689413, 0, 0.4078431, 1, 1,
0.3121232, -2.25448, 4.428175, 0, 0.4, 1, 1,
0.3132869, -0.1579047, 2.6127, 0, 0.3921569, 1, 1,
0.3156555, 0.1405838, 0.506775, 0, 0.3882353, 1, 1,
0.3175063, 0.4306386, -0.6182275, 0, 0.3803922, 1, 1,
0.3180409, 0.1299096, 1.740371, 0, 0.3764706, 1, 1,
0.3195855, -0.8221983, 3.957126, 0, 0.3686275, 1, 1,
0.3224198, -0.1140039, 3.217225, 0, 0.3647059, 1, 1,
0.3224573, 1.074439, 0.5809355, 0, 0.3568628, 1, 1,
0.326177, -0.05977289, 3.60556, 0, 0.3529412, 1, 1,
0.3275779, -1.42051, 3.791664, 0, 0.345098, 1, 1,
0.3281977, -2.023038, 2.111832, 0, 0.3411765, 1, 1,
0.3311289, -1.021948, 3.220265, 0, 0.3333333, 1, 1,
0.333224, 0.1619839, 2.160933, 0, 0.3294118, 1, 1,
0.3344657, 0.6562694, 2.363767, 0, 0.3215686, 1, 1,
0.3361389, -0.5830429, 2.593444, 0, 0.3176471, 1, 1,
0.3377063, 0.4204095, -0.5204942, 0, 0.3098039, 1, 1,
0.3393397, -0.4419133, 3.124074, 0, 0.3058824, 1, 1,
0.3400339, 1.413745, 0.7375729, 0, 0.2980392, 1, 1,
0.3509188, -0.5047475, 3.010255, 0, 0.2901961, 1, 1,
0.3521895, -0.05175538, 1.05957, 0, 0.2862745, 1, 1,
0.3525344, -0.6116336, 3.238566, 0, 0.2784314, 1, 1,
0.3572673, -1.093735, 4.520323, 0, 0.2745098, 1, 1,
0.3580569, 0.4318537, 2.188667, 0, 0.2666667, 1, 1,
0.359574, -0.4356425, 3.599314, 0, 0.2627451, 1, 1,
0.3601817, 0.09301688, 0.5718002, 0, 0.254902, 1, 1,
0.360955, 0.4434245, -1.807646, 0, 0.2509804, 1, 1,
0.36245, 0.3671028, 1.311357, 0, 0.2431373, 1, 1,
0.3652109, -0.04223187, 2.191059, 0, 0.2392157, 1, 1,
0.3667492, 0.06963275, 2.317609, 0, 0.2313726, 1, 1,
0.3728007, -0.1929608, 0.9362891, 0, 0.227451, 1, 1,
0.3735531, -1.54181, 1.879868, 0, 0.2196078, 1, 1,
0.3742867, 1.591343, 0.6582748, 0, 0.2156863, 1, 1,
0.3821287, -0.1592337, 1.285157, 0, 0.2078431, 1, 1,
0.3826413, 0.03047788, 3.248754, 0, 0.2039216, 1, 1,
0.3837857, 1.084084, -0.2374553, 0, 0.1960784, 1, 1,
0.3839119, 0.3870295, 0.5123659, 0, 0.1882353, 1, 1,
0.3893192, 0.7190702, 1.335569, 0, 0.1843137, 1, 1,
0.392513, -0.3656724, 3.205293, 0, 0.1764706, 1, 1,
0.3988261, -0.2208552, 2.065503, 0, 0.172549, 1, 1,
0.3988471, 0.4327942, 1.223177, 0, 0.1647059, 1, 1,
0.399933, 1.504322, 1.607288, 0, 0.1607843, 1, 1,
0.4012062, 1.362208, 0.4519139, 0, 0.1529412, 1, 1,
0.4034496, 0.8744161, 0.004276055, 0, 0.1490196, 1, 1,
0.4065244, 0.1181296, 1.000564, 0, 0.1411765, 1, 1,
0.4113648, -2.077341, 3.35386, 0, 0.1372549, 1, 1,
0.4128058, -0.5134203, 3.788884, 0, 0.1294118, 1, 1,
0.4129577, -0.7600117, 3.141421, 0, 0.1254902, 1, 1,
0.4171661, 0.7290848, -0.5104595, 0, 0.1176471, 1, 1,
0.4173833, -1.091313, 3.8255, 0, 0.1137255, 1, 1,
0.4236106, 1.122623, 0.8097376, 0, 0.1058824, 1, 1,
0.4247325, 0.3393684, 1.852687, 0, 0.09803922, 1, 1,
0.4352205, 0.2869186, -0.2692346, 0, 0.09411765, 1, 1,
0.4378408, 0.3704482, 1.220592, 0, 0.08627451, 1, 1,
0.4402693, -1.861555, 3.548189, 0, 0.08235294, 1, 1,
0.4404671, -1.771966, 3.143971, 0, 0.07450981, 1, 1,
0.441409, -0.6874109, 1.415472, 0, 0.07058824, 1, 1,
0.4432333, 1.248433, 1.262441, 0, 0.0627451, 1, 1,
0.4444344, -1.628722, 1.525249, 0, 0.05882353, 1, 1,
0.4446116, -0.3543662, 2.339314, 0, 0.05098039, 1, 1,
0.4460057, -2.632709, 3.102501, 0, 0.04705882, 1, 1,
0.4481365, -0.4174142, 1.415402, 0, 0.03921569, 1, 1,
0.4502869, 1.731207, 1.646879, 0, 0.03529412, 1, 1,
0.4504656, 0.6879556, 0.1273042, 0, 0.02745098, 1, 1,
0.4532208, 0.5673717, 1.447947, 0, 0.02352941, 1, 1,
0.4532436, -0.7141658, 1.20859, 0, 0.01568628, 1, 1,
0.4547074, 1.210683, 1.28187, 0, 0.01176471, 1, 1,
0.4565354, -1.022106, 3.092836, 0, 0.003921569, 1, 1,
0.4599822, 0.8221264, 0.1909705, 0.003921569, 0, 1, 1,
0.4618254, 0.5821149, 1.6184, 0.007843138, 0, 1, 1,
0.464805, -0.6912154, 2.327728, 0.01568628, 0, 1, 1,
0.4666797, 0.6121147, -0.09739639, 0.01960784, 0, 1, 1,
0.4773251, 0.1678921, 2.655028, 0.02745098, 0, 1, 1,
0.47979, -2.110609, 0.860854, 0.03137255, 0, 1, 1,
0.4817384, -1.429415, 1.607267, 0.03921569, 0, 1, 1,
0.4824236, -2.113287, 3.634532, 0.04313726, 0, 1, 1,
0.483925, -0.8212056, 3.048042, 0.05098039, 0, 1, 1,
0.4842815, -0.8337765, 2.024762, 0.05490196, 0, 1, 1,
0.489694, -0.865803, 2.20888, 0.0627451, 0, 1, 1,
0.4974301, 0.1308826, 1.396833, 0.06666667, 0, 1, 1,
0.5023592, 0.497963, 0.8275009, 0.07450981, 0, 1, 1,
0.5042295, -0.4703467, 2.5544, 0.07843138, 0, 1, 1,
0.5097758, -1.582261, 3.329459, 0.08627451, 0, 1, 1,
0.5113518, -2.421143, 1.205995, 0.09019608, 0, 1, 1,
0.5117357, -0.1761801, 1.381774, 0.09803922, 0, 1, 1,
0.5118488, 0.7294396, 0.7054644, 0.1058824, 0, 1, 1,
0.5167773, 0.7319108, 1.08499, 0.1098039, 0, 1, 1,
0.5262232, -0.6121588, 3.848629, 0.1176471, 0, 1, 1,
0.527236, 0.0294771, 0.6226843, 0.1215686, 0, 1, 1,
0.5305828, -0.1852597, 1.627387, 0.1294118, 0, 1, 1,
0.5308799, 0.5316873, 0.5092012, 0.1333333, 0, 1, 1,
0.5346488, -0.9290672, 2.763177, 0.1411765, 0, 1, 1,
0.5397573, 1.222802, 0.1522828, 0.145098, 0, 1, 1,
0.5427462, 0.4972799, 0.9029056, 0.1529412, 0, 1, 1,
0.5432163, 0.1947802, -0.3517368, 0.1568628, 0, 1, 1,
0.544891, -1.550904, 1.071019, 0.1647059, 0, 1, 1,
0.5461607, -0.886868, 4.013535, 0.1686275, 0, 1, 1,
0.5482497, 0.4272181, 0.3406623, 0.1764706, 0, 1, 1,
0.5488545, -2.098752, 3.240377, 0.1803922, 0, 1, 1,
0.5503867, -0.8074838, 3.513566, 0.1882353, 0, 1, 1,
0.5524275, 0.9808543, 0.008216027, 0.1921569, 0, 1, 1,
0.5540957, 1.635388, -1.452235, 0.2, 0, 1, 1,
0.5559032, 0.2457207, -0.07450496, 0.2078431, 0, 1, 1,
0.5564136, -0.5458657, 3.550612, 0.2117647, 0, 1, 1,
0.5580905, 0.07046742, 1.369778, 0.2196078, 0, 1, 1,
0.5582507, 1.989015, 1.106395, 0.2235294, 0, 1, 1,
0.5612776, 0.9279134, 1.252888, 0.2313726, 0, 1, 1,
0.5622174, -0.4771525, 0.5583174, 0.2352941, 0, 1, 1,
0.569063, 0.5359324, 1.785249, 0.2431373, 0, 1, 1,
0.5770687, -1.120629, 0.7237686, 0.2470588, 0, 1, 1,
0.5811555, 0.05854819, 1.485923, 0.254902, 0, 1, 1,
0.5815892, -0.2162869, 1.852118, 0.2588235, 0, 1, 1,
0.5854748, 1.016527, 0.03099164, 0.2666667, 0, 1, 1,
0.5949916, -1.689464, 3.403664, 0.2705882, 0, 1, 1,
0.5977501, -1.289198, 2.807694, 0.2784314, 0, 1, 1,
0.5997645, -0.4866319, 0.2675248, 0.282353, 0, 1, 1,
0.6017143, -1.67052, 2.574124, 0.2901961, 0, 1, 1,
0.6033729, 0.1664039, 1.951393, 0.2941177, 0, 1, 1,
0.605551, -0.2190841, 2.353188, 0.3019608, 0, 1, 1,
0.6073026, -1.417112, 1.902037, 0.3098039, 0, 1, 1,
0.6133144, -0.2512421, 2.886263, 0.3137255, 0, 1, 1,
0.6135821, 0.7749132, 1.583346, 0.3215686, 0, 1, 1,
0.6136279, 2.261098, -0.7367019, 0.3254902, 0, 1, 1,
0.615171, 1.584629, 0.9297404, 0.3333333, 0, 1, 1,
0.6199614, -0.6688253, 4.20611, 0.3372549, 0, 1, 1,
0.6218293, 0.7514025, 1.515488, 0.345098, 0, 1, 1,
0.6235316, -0.9551261, 2.216149, 0.3490196, 0, 1, 1,
0.6265698, -1.171053, 2.2907, 0.3568628, 0, 1, 1,
0.6278347, 0.8844168, -0.7571783, 0.3607843, 0, 1, 1,
0.6283472, 1.610582, 1.270835, 0.3686275, 0, 1, 1,
0.6325299, 1.542383, 1.03698, 0.372549, 0, 1, 1,
0.6330617, 0.8373988, -1.465019, 0.3803922, 0, 1, 1,
0.6353638, 0.3144779, -0.1589472, 0.3843137, 0, 1, 1,
0.6367123, 1.220744, 1.379933, 0.3921569, 0, 1, 1,
0.6524977, 0.5638582, 1.476885, 0.3960784, 0, 1, 1,
0.6531739, 0.09897196, 1.950557, 0.4039216, 0, 1, 1,
0.6539354, 0.8647832, 1.127537, 0.4117647, 0, 1, 1,
0.6555152, -0.2911713, 2.991074, 0.4156863, 0, 1, 1,
0.6571401, -0.9297671, 1.095404, 0.4235294, 0, 1, 1,
0.6576588, -0.7156063, 2.01147, 0.427451, 0, 1, 1,
0.6608966, 0.7305737, 1.615084, 0.4352941, 0, 1, 1,
0.661301, -0.05249579, 2.578419, 0.4392157, 0, 1, 1,
0.6639547, 0.1942792, 1.663676, 0.4470588, 0, 1, 1,
0.6682671, -1.198561, 2.384485, 0.4509804, 0, 1, 1,
0.668786, 1.086922, 0.673011, 0.4588235, 0, 1, 1,
0.6704632, -0.7912246, 3.555583, 0.4627451, 0, 1, 1,
0.6709712, -0.1415736, 2.080649, 0.4705882, 0, 1, 1,
0.6727313, -0.2312758, 2.727711, 0.4745098, 0, 1, 1,
0.683508, -2.13352, 2.864953, 0.4823529, 0, 1, 1,
0.6913161, 0.8891411, 0.1549714, 0.4862745, 0, 1, 1,
0.6964598, -0.9512967, 1.584914, 0.4941176, 0, 1, 1,
0.7005309, -0.1089406, 3.486047, 0.5019608, 0, 1, 1,
0.7006952, -0.1041678, 4.049977, 0.5058824, 0, 1, 1,
0.7028427, -0.1910745, 2.931361, 0.5137255, 0, 1, 1,
0.7039254, 1.311199, 1.044879, 0.5176471, 0, 1, 1,
0.7076843, -1.603805, 3.365642, 0.5254902, 0, 1, 1,
0.7126657, -0.7474045, 2.054442, 0.5294118, 0, 1, 1,
0.7161372, -0.4814541, 0.7012502, 0.5372549, 0, 1, 1,
0.7176945, -0.6398002, 3.143642, 0.5411765, 0, 1, 1,
0.7258188, -0.394411, 2.278521, 0.5490196, 0, 1, 1,
0.7266698, 0.4930289, 0.7531829, 0.5529412, 0, 1, 1,
0.7268651, 0.3931967, 1.315837, 0.5607843, 0, 1, 1,
0.7282326, 1.669284, -0.6160633, 0.5647059, 0, 1, 1,
0.7306049, 0.7239281, -0.2647334, 0.572549, 0, 1, 1,
0.7325832, 0.5689915, -1.034665, 0.5764706, 0, 1, 1,
0.7330736, 0.9469083, -0.3064507, 0.5843138, 0, 1, 1,
0.7355431, 1.166522, 1.436889, 0.5882353, 0, 1, 1,
0.7462144, 1.289845, 0.4062806, 0.5960785, 0, 1, 1,
0.747875, -0.1866177, 1.644104, 0.6039216, 0, 1, 1,
0.7487496, 0.2094084, 0.3773916, 0.6078432, 0, 1, 1,
0.7514693, 0.9524304, -2.111512, 0.6156863, 0, 1, 1,
0.7520798, -0.04783751, -0.1571949, 0.6196079, 0, 1, 1,
0.7521592, 0.1718156, 2.852593, 0.627451, 0, 1, 1,
0.7548804, -1.072648, 3.2067, 0.6313726, 0, 1, 1,
0.7603331, 0.8751677, 0.8632631, 0.6392157, 0, 1, 1,
0.7609785, 0.8896677, 0.8089589, 0.6431373, 0, 1, 1,
0.7612433, -1.463749, 3.215587, 0.6509804, 0, 1, 1,
0.7626771, -0.6636783, 2.120257, 0.654902, 0, 1, 1,
0.7641544, 0.07929508, 1.677293, 0.6627451, 0, 1, 1,
0.7668767, -2.45064, 1.93814, 0.6666667, 0, 1, 1,
0.771016, 1.031365, 0.2008423, 0.6745098, 0, 1, 1,
0.7786169, -0.8622061, 1.509826, 0.6784314, 0, 1, 1,
0.7787095, -0.02070038, 3.259552, 0.6862745, 0, 1, 1,
0.7816092, 0.7800009, -0.766251, 0.6901961, 0, 1, 1,
0.7883869, -0.9839263, 3.905285, 0.6980392, 0, 1, 1,
0.7931789, 1.58971, 0.7152365, 0.7058824, 0, 1, 1,
0.7960309, 0.9741368, -2.293165, 0.7098039, 0, 1, 1,
0.8064023, -0.2473812, 2.530719, 0.7176471, 0, 1, 1,
0.80658, 1.374308, 2.051542, 0.7215686, 0, 1, 1,
0.8119905, -0.581622, 0.7162902, 0.7294118, 0, 1, 1,
0.8138632, 1.642634, 0.7798338, 0.7333333, 0, 1, 1,
0.8155003, 0.3588467, -0.09424094, 0.7411765, 0, 1, 1,
0.8155487, 1.051413, 0.3167893, 0.7450981, 0, 1, 1,
0.8157672, -0.5027567, 2.960013, 0.7529412, 0, 1, 1,
0.8168014, -1.698557, 2.957835, 0.7568628, 0, 1, 1,
0.8255318, -0.233228, 3.869257, 0.7647059, 0, 1, 1,
0.8267854, 0.4328141, 3.358827, 0.7686275, 0, 1, 1,
0.8275492, 0.4028369, 0.6868396, 0.7764706, 0, 1, 1,
0.8292034, 0.4521163, 0.5887111, 0.7803922, 0, 1, 1,
0.8342775, 2.010794, 1.124357, 0.7882353, 0, 1, 1,
0.8352984, -2.229409, 2.707513, 0.7921569, 0, 1, 1,
0.8435845, -0.1057173, 1.14258, 0.8, 0, 1, 1,
0.8469788, 1.434731, -0.07807377, 0.8078431, 0, 1, 1,
0.8483071, 0.1546128, 1.180015, 0.8117647, 0, 1, 1,
0.8497527, 1.179331, 1.946265, 0.8196079, 0, 1, 1,
0.8507857, 0.7443773, 2.468532, 0.8235294, 0, 1, 1,
0.8530761, 0.6951728, 0.3493383, 0.8313726, 0, 1, 1,
0.8553476, -0.2174562, 1.816896, 0.8352941, 0, 1, 1,
0.8590826, 0.8208641, 0.6715429, 0.8431373, 0, 1, 1,
0.8605997, 0.6046449, 1.069161, 0.8470588, 0, 1, 1,
0.8704527, 1.509805, -0.09839526, 0.854902, 0, 1, 1,
0.8709039, 0.2901782, 0.04525417, 0.8588235, 0, 1, 1,
0.8717011, 0.9652175, -0.1269139, 0.8666667, 0, 1, 1,
0.8720918, 0.03657068, 0.4705279, 0.8705882, 0, 1, 1,
0.8743419, -0.1469043, 3.246835, 0.8784314, 0, 1, 1,
0.8756403, -0.658986, 2.51055, 0.8823529, 0, 1, 1,
0.876236, 0.4438162, 1.685899, 0.8901961, 0, 1, 1,
0.8796768, 0.5936065, 2.564806, 0.8941177, 0, 1, 1,
0.8999333, -0.4629044, 1.527404, 0.9019608, 0, 1, 1,
0.9004689, -0.596299, 3.561502, 0.9098039, 0, 1, 1,
0.9012126, -0.3061019, 4.58449, 0.9137255, 0, 1, 1,
0.9012204, -1.336173, 2.354411, 0.9215686, 0, 1, 1,
0.9052288, -0.2482571, 0.9600993, 0.9254902, 0, 1, 1,
0.90523, -0.7726864, 3.480594, 0.9333333, 0, 1, 1,
0.9099635, -2.509017, 3.151048, 0.9372549, 0, 1, 1,
0.9234753, 0.923863, 0.640447, 0.945098, 0, 1, 1,
0.9258085, -0.8769658, 3.319721, 0.9490196, 0, 1, 1,
0.935803, -0.2332972, 3.372893, 0.9568627, 0, 1, 1,
0.9362196, 1.537557, 0.7742437, 0.9607843, 0, 1, 1,
0.9375253, 0.439884, 1.783874, 0.9686275, 0, 1, 1,
0.9383618, 1.369926, -0.4709631, 0.972549, 0, 1, 1,
0.9402385, 1.945741, 0.4367725, 0.9803922, 0, 1, 1,
0.9498637, 1.102001, 0.3252703, 0.9843137, 0, 1, 1,
0.9513938, -1.296242, 1.756455, 0.9921569, 0, 1, 1,
0.9544697, 0.3450136, 0.2876225, 0.9960784, 0, 1, 1,
0.955932, -0.5272432, 1.112134, 1, 0, 0.9960784, 1,
0.9588236, 1.192977, 1.162351, 1, 0, 0.9882353, 1,
0.9596994, -0.01547603, 3.235415, 1, 0, 0.9843137, 1,
0.9695686, -1.366135, 0.8666606, 1, 0, 0.9764706, 1,
0.9697661, -0.2739025, 0.002261503, 1, 0, 0.972549, 1,
0.9745467, 0.1728328, 2.005316, 1, 0, 0.9647059, 1,
0.979744, -0.7347646, 3.267203, 1, 0, 0.9607843, 1,
0.9816493, 0.5394198, 1.448057, 1, 0, 0.9529412, 1,
0.9924327, -0.5338759, 2.651107, 1, 0, 0.9490196, 1,
0.9926621, -0.2805445, 2.833183, 1, 0, 0.9411765, 1,
0.9952148, -0.7339569, 1.840482, 1, 0, 0.9372549, 1,
1.002097, 1.187778, 1.920953, 1, 0, 0.9294118, 1,
1.010664, -0.8815326, 2.826601, 1, 0, 0.9254902, 1,
1.023845, -1.605923, 4.006078, 1, 0, 0.9176471, 1,
1.025121, 1.32157, 1.862974, 1, 0, 0.9137255, 1,
1.029436, 0.3132012, 1.52937, 1, 0, 0.9058824, 1,
1.034554, 0.3064222, 1.238889, 1, 0, 0.9019608, 1,
1.037467, 1.518431, 0.6561475, 1, 0, 0.8941177, 1,
1.03781, -1.075261, 1.755429, 1, 0, 0.8862745, 1,
1.038818, 0.4140608, 2.631427, 1, 0, 0.8823529, 1,
1.03898, -0.4146679, 2.807769, 1, 0, 0.8745098, 1,
1.050115, 0.856162, 1.290722, 1, 0, 0.8705882, 1,
1.051211, -1.739061, 3.436966, 1, 0, 0.8627451, 1,
1.051694, 0.8166779, 0.7123994, 1, 0, 0.8588235, 1,
1.051949, 2.110099, -0.137766, 1, 0, 0.8509804, 1,
1.059743, 0.5714791, 2.370809, 1, 0, 0.8470588, 1,
1.066641, -0.9825976, 3.45568, 1, 0, 0.8392157, 1,
1.06768, -0.9181708, 4.51822, 1, 0, 0.8352941, 1,
1.073749, -0.1164659, -0.657835, 1, 0, 0.827451, 1,
1.074534, -0.7158287, 3.439649, 1, 0, 0.8235294, 1,
1.098754, 0.1002772, 1.859172, 1, 0, 0.8156863, 1,
1.10387, -0.3940991, 2.123618, 1, 0, 0.8117647, 1,
1.11201, -1.450513, 0.7476486, 1, 0, 0.8039216, 1,
1.11832, 1.065637, 1.149103, 1, 0, 0.7960784, 1,
1.118532, -1.999233, 3.081747, 1, 0, 0.7921569, 1,
1.150301, 0.2401739, 1.627297, 1, 0, 0.7843137, 1,
1.150662, -1.588411, 2.889277, 1, 0, 0.7803922, 1,
1.150784, -3.13013, 2.189535, 1, 0, 0.772549, 1,
1.170628, 0.2916735, 1.508499, 1, 0, 0.7686275, 1,
1.17899, 1.210005, 2.465233, 1, 0, 0.7607843, 1,
1.186124, -1.102831, 3.111284, 1, 0, 0.7568628, 1,
1.191589, -1.800933, 2.705274, 1, 0, 0.7490196, 1,
1.192534, -1.697298, 3.412261, 1, 0, 0.7450981, 1,
1.197072, 0.4801301, 2.513956, 1, 0, 0.7372549, 1,
1.205624, 1.019288, -0.173968, 1, 0, 0.7333333, 1,
1.207856, 2.291687, -1.323899, 1, 0, 0.7254902, 1,
1.211593, 0.8901599, 2.085395, 1, 0, 0.7215686, 1,
1.21212, -0.8861728, 2.222147, 1, 0, 0.7137255, 1,
1.213891, -0.2806406, 0.757117, 1, 0, 0.7098039, 1,
1.224954, 1.533201, -0.3753352, 1, 0, 0.7019608, 1,
1.23248, 1.369514, 0.08733083, 1, 0, 0.6941177, 1,
1.234064, 0.2424313, 1.937277, 1, 0, 0.6901961, 1,
1.234505, 0.5099962, 0.1319523, 1, 0, 0.682353, 1,
1.244878, 0.8956591, 1.459223, 1, 0, 0.6784314, 1,
1.246588, 0.5328041, 2.229031, 1, 0, 0.6705883, 1,
1.247865, -0.1507865, 1.953938, 1, 0, 0.6666667, 1,
1.249421, -0.7330207, 2.993906, 1, 0, 0.6588235, 1,
1.253544, 1.88409, 1.671441, 1, 0, 0.654902, 1,
1.253637, 0.9018208, 1.507428, 1, 0, 0.6470588, 1,
1.254649, 0.1021174, 2.689905, 1, 0, 0.6431373, 1,
1.257366, 0.9544177, -0.0844409, 1, 0, 0.6352941, 1,
1.262476, -0.09613811, 2.033266, 1, 0, 0.6313726, 1,
1.270895, -0.2716115, 2.973633, 1, 0, 0.6235294, 1,
1.27326, 1.625441, 0.110623, 1, 0, 0.6196079, 1,
1.28601, -0.4144539, 2.804123, 1, 0, 0.6117647, 1,
1.287601, -0.9110531, 2.268609, 1, 0, 0.6078432, 1,
1.292628, 1.222807, -0.2634603, 1, 0, 0.6, 1,
1.294773, 0.07113859, 2.482854, 1, 0, 0.5921569, 1,
1.298153, 0.5756708, 0.3858351, 1, 0, 0.5882353, 1,
1.316387, 0.6667021, 1.820843, 1, 0, 0.5803922, 1,
1.31656, 0.298923, 0.0009330479, 1, 0, 0.5764706, 1,
1.321448, 1.471079, 0.5488781, 1, 0, 0.5686275, 1,
1.327071, -0.5947911, 1.606697, 1, 0, 0.5647059, 1,
1.338636, -0.2066216, 1.957575, 1, 0, 0.5568628, 1,
1.340993, 1.412999, -1.789115, 1, 0, 0.5529412, 1,
1.3428, 1.816465, 0.9537836, 1, 0, 0.5450981, 1,
1.352128, -0.08287791, 0.8520911, 1, 0, 0.5411765, 1,
1.359702, -1.640728, 0.9448664, 1, 0, 0.5333334, 1,
1.363281, -1.058848, 1.736997, 1, 0, 0.5294118, 1,
1.390668, -0.1348498, -0.1630333, 1, 0, 0.5215687, 1,
1.39191, 1.337286, 0.4564741, 1, 0, 0.5176471, 1,
1.392933, -1.903028, 2.119234, 1, 0, 0.509804, 1,
1.395871, -0.4217533, 0.9729051, 1, 0, 0.5058824, 1,
1.40432, -0.02973046, 2.088811, 1, 0, 0.4980392, 1,
1.412922, 2.373011, 0.0740983, 1, 0, 0.4901961, 1,
1.427377, 0.2493822, 2.139851, 1, 0, 0.4862745, 1,
1.432011, -2.112284, 1.699824, 1, 0, 0.4784314, 1,
1.434105, 0.3902128, 0.314532, 1, 0, 0.4745098, 1,
1.436928, -0.01752998, 2.533234, 1, 0, 0.4666667, 1,
1.439314, -0.4802787, 0.4063065, 1, 0, 0.4627451, 1,
1.449635, -2.043439, 1.674826, 1, 0, 0.454902, 1,
1.462789, -0.4825573, 1.831785, 1, 0, 0.4509804, 1,
1.463719, -0.3931883, 2.226838, 1, 0, 0.4431373, 1,
1.472692, -2.393468, 2.998225, 1, 0, 0.4392157, 1,
1.477872, 0.5920053, 0.6900059, 1, 0, 0.4313726, 1,
1.479774, -0.5509915, 3.511874, 1, 0, 0.427451, 1,
1.489878, -1.720854, 1.871443, 1, 0, 0.4196078, 1,
1.498796, 0.8068963, 2.493932, 1, 0, 0.4156863, 1,
1.499498, 0.2976959, 1.48924, 1, 0, 0.4078431, 1,
1.508974, 0.7715731, 0.3669845, 1, 0, 0.4039216, 1,
1.518014, -2.332459, 2.778864, 1, 0, 0.3960784, 1,
1.521307, 0.3295709, 2.554498, 1, 0, 0.3882353, 1,
1.53326, -0.7910337, 2.669348, 1, 0, 0.3843137, 1,
1.549653, 0.3235301, 1.585503, 1, 0, 0.3764706, 1,
1.555427, 1.260084, 2.325318, 1, 0, 0.372549, 1,
1.558679, -0.02377243, 0.5555565, 1, 0, 0.3647059, 1,
1.562307, 0.5521112, 1.604403, 1, 0, 0.3607843, 1,
1.568846, -0.8931741, 0.2517451, 1, 0, 0.3529412, 1,
1.580817, 0.520479, 0.4144717, 1, 0, 0.3490196, 1,
1.596764, -0.05782574, 1.247311, 1, 0, 0.3411765, 1,
1.620937, -0.7096802, 2.311722, 1, 0, 0.3372549, 1,
1.621831, -1.639945, 1.710773, 1, 0, 0.3294118, 1,
1.656245, -0.7355267, 3.417628, 1, 0, 0.3254902, 1,
1.661845, -1.490273, 0.9781185, 1, 0, 0.3176471, 1,
1.685101, 0.4712552, 1.637721, 1, 0, 0.3137255, 1,
1.696347, -1.72909, 0.1472335, 1, 0, 0.3058824, 1,
1.706449, 0.07883783, 1.325878, 1, 0, 0.2980392, 1,
1.718382, 1.038322, -0.588056, 1, 0, 0.2941177, 1,
1.730367, 1.156921, 0.6794339, 1, 0, 0.2862745, 1,
1.735383, 1.139825, 0.6547807, 1, 0, 0.282353, 1,
1.743399, 1.163104, 1.650761, 1, 0, 0.2745098, 1,
1.748378, 0.5810608, 2.916226, 1, 0, 0.2705882, 1,
1.751037, -1.06791, 0.6819955, 1, 0, 0.2627451, 1,
1.754184, -0.9870464, 2.753422, 1, 0, 0.2588235, 1,
1.757961, -0.1180702, 0.5942614, 1, 0, 0.2509804, 1,
1.764167, 0.09618703, 1.400159, 1, 0, 0.2470588, 1,
1.764628, -2.06637, 3.123293, 1, 0, 0.2392157, 1,
1.769998, 1.71338, 0.8868217, 1, 0, 0.2352941, 1,
1.775744, 0.2166511, 3.532037, 1, 0, 0.227451, 1,
1.790363, -0.7106525, 1.314925, 1, 0, 0.2235294, 1,
1.792079, 0.9136191, -0.5839376, 1, 0, 0.2156863, 1,
1.796293, -0.2520955, 1.751801, 1, 0, 0.2117647, 1,
1.822364, -0.9688045, 1.171493, 1, 0, 0.2039216, 1,
1.834227, -0.2227003, 2.874517, 1, 0, 0.1960784, 1,
1.83948, 0.3528852, 1.324722, 1, 0, 0.1921569, 1,
1.895171, 0.623768, 1.542674, 1, 0, 0.1843137, 1,
1.896676, 0.8818333, 1.463824, 1, 0, 0.1803922, 1,
1.918545, -0.7199035, 2.13436, 1, 0, 0.172549, 1,
1.930079, -0.317931, 2.375243, 1, 0, 0.1686275, 1,
1.937431, 0.374343, 1.689869, 1, 0, 0.1607843, 1,
1.958123, 0.8122515, 1.391622, 1, 0, 0.1568628, 1,
1.963131, -0.7870889, 2.682785, 1, 0, 0.1490196, 1,
1.968304, -0.8865874, 2.173229, 1, 0, 0.145098, 1,
2.004688, 0.7190045, 2.581088, 1, 0, 0.1372549, 1,
2.01327, -0.6005945, 4.276503, 1, 0, 0.1333333, 1,
2.051826, 0.4169413, 1.957648, 1, 0, 0.1254902, 1,
2.082858, -1.240994, 2.454813, 1, 0, 0.1215686, 1,
2.122684, -0.4273912, 2.826429, 1, 0, 0.1137255, 1,
2.137354, -0.9476449, 2.764764, 1, 0, 0.1098039, 1,
2.188488, 1.407335, 1.901589, 1, 0, 0.1019608, 1,
2.188884, -0.8560833, 1.919672, 1, 0, 0.09411765, 1,
2.199804, 0.3886053, 1.663078, 1, 0, 0.09019608, 1,
2.217725, 0.3269816, 0.4657608, 1, 0, 0.08235294, 1,
2.296094, -2.133034, 0.08183678, 1, 0, 0.07843138, 1,
2.33007, -0.4829202, 4.560431, 1, 0, 0.07058824, 1,
2.339924, 0.5297964, 1.333757, 1, 0, 0.06666667, 1,
2.373443, -0.6339749, 0.4207239, 1, 0, 0.05882353, 1,
2.377256, -1.17298, 3.115205, 1, 0, 0.05490196, 1,
2.403272, 0.8123839, 3.355439, 1, 0, 0.04705882, 1,
2.405488, 0.172946, -0.2731375, 1, 0, 0.04313726, 1,
2.412338, 0.5206501, 2.363535, 1, 0, 0.03529412, 1,
2.425954, 0.8002285, 1.893605, 1, 0, 0.03137255, 1,
2.569897, 1.068774, 0.1973754, 1, 0, 0.02352941, 1,
2.672038, -0.6024625, 1.746751, 1, 0, 0.01960784, 1,
2.691515, 0.09904811, 1.46197, 1, 0, 0.01176471, 1,
2.965481, 1.485477, 0.2548704, 1, 0, 0.007843138, 1
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
-0.05382025, -4.2224, -7.333064, 0, -0.5, 0.5, 0.5,
-0.05382025, -4.2224, -7.333064, 1, -0.5, 0.5, 0.5,
-0.05382025, -4.2224, -7.333064, 1, 1.5, 0.5, 0.5,
-0.05382025, -4.2224, -7.333064, 0, 1.5, 0.5, 0.5
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
-4.096665, 0.09190655, -7.333064, 0, -0.5, 0.5, 0.5,
-4.096665, 0.09190655, -7.333064, 1, -0.5, 0.5, 0.5,
-4.096665, 0.09190655, -7.333064, 1, 1.5, 0.5, 0.5,
-4.096665, 0.09190655, -7.333064, 0, 1.5, 0.5, 0.5
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
-4.096665, -4.2224, -0.3449974, 0, -0.5, 0.5, 0.5,
-4.096665, -4.2224, -0.3449974, 1, -0.5, 0.5, 0.5,
-4.096665, -4.2224, -0.3449974, 1, 1.5, 0.5, 0.5,
-4.096665, -4.2224, -0.3449974, 0, 1.5, 0.5, 0.5
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
-3, -3.226791, -5.720433,
2, -3.226791, -5.720433,
-3, -3.226791, -5.720433,
-3, -3.392725, -5.989205,
-2, -3.226791, -5.720433,
-2, -3.392725, -5.989205,
-1, -3.226791, -5.720433,
-1, -3.392725, -5.989205,
0, -3.226791, -5.720433,
0, -3.392725, -5.989205,
1, -3.226791, -5.720433,
1, -3.392725, -5.989205,
2, -3.226791, -5.720433,
2, -3.392725, -5.989205
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
-3, -3.724595, -6.526749, 0, -0.5, 0.5, 0.5,
-3, -3.724595, -6.526749, 1, -0.5, 0.5, 0.5,
-3, -3.724595, -6.526749, 1, 1.5, 0.5, 0.5,
-3, -3.724595, -6.526749, 0, 1.5, 0.5, 0.5,
-2, -3.724595, -6.526749, 0, -0.5, 0.5, 0.5,
-2, -3.724595, -6.526749, 1, -0.5, 0.5, 0.5,
-2, -3.724595, -6.526749, 1, 1.5, 0.5, 0.5,
-2, -3.724595, -6.526749, 0, 1.5, 0.5, 0.5,
-1, -3.724595, -6.526749, 0, -0.5, 0.5, 0.5,
-1, -3.724595, -6.526749, 1, -0.5, 0.5, 0.5,
-1, -3.724595, -6.526749, 1, 1.5, 0.5, 0.5,
-1, -3.724595, -6.526749, 0, 1.5, 0.5, 0.5,
0, -3.724595, -6.526749, 0, -0.5, 0.5, 0.5,
0, -3.724595, -6.526749, 1, -0.5, 0.5, 0.5,
0, -3.724595, -6.526749, 1, 1.5, 0.5, 0.5,
0, -3.724595, -6.526749, 0, 1.5, 0.5, 0.5,
1, -3.724595, -6.526749, 0, -0.5, 0.5, 0.5,
1, -3.724595, -6.526749, 1, -0.5, 0.5, 0.5,
1, -3.724595, -6.526749, 1, 1.5, 0.5, 0.5,
1, -3.724595, -6.526749, 0, 1.5, 0.5, 0.5,
2, -3.724595, -6.526749, 0, -0.5, 0.5, 0.5,
2, -3.724595, -6.526749, 1, -0.5, 0.5, 0.5,
2, -3.724595, -6.526749, 1, 1.5, 0.5, 0.5,
2, -3.724595, -6.526749, 0, 1.5, 0.5, 0.5
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
-3.163701, -3, -5.720433,
-3.163701, 3, -5.720433,
-3.163701, -3, -5.720433,
-3.319195, -3, -5.989205,
-3.163701, -2, -5.720433,
-3.319195, -2, -5.989205,
-3.163701, -1, -5.720433,
-3.319195, -1, -5.989205,
-3.163701, 0, -5.720433,
-3.319195, 0, -5.989205,
-3.163701, 1, -5.720433,
-3.319195, 1, -5.989205,
-3.163701, 2, -5.720433,
-3.319195, 2, -5.989205,
-3.163701, 3, -5.720433,
-3.319195, 3, -5.989205
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
-3.630183, -3, -6.526749, 0, -0.5, 0.5, 0.5,
-3.630183, -3, -6.526749, 1, -0.5, 0.5, 0.5,
-3.630183, -3, -6.526749, 1, 1.5, 0.5, 0.5,
-3.630183, -3, -6.526749, 0, 1.5, 0.5, 0.5,
-3.630183, -2, -6.526749, 0, -0.5, 0.5, 0.5,
-3.630183, -2, -6.526749, 1, -0.5, 0.5, 0.5,
-3.630183, -2, -6.526749, 1, 1.5, 0.5, 0.5,
-3.630183, -2, -6.526749, 0, 1.5, 0.5, 0.5,
-3.630183, -1, -6.526749, 0, -0.5, 0.5, 0.5,
-3.630183, -1, -6.526749, 1, -0.5, 0.5, 0.5,
-3.630183, -1, -6.526749, 1, 1.5, 0.5, 0.5,
-3.630183, -1, -6.526749, 0, 1.5, 0.5, 0.5,
-3.630183, 0, -6.526749, 0, -0.5, 0.5, 0.5,
-3.630183, 0, -6.526749, 1, -0.5, 0.5, 0.5,
-3.630183, 0, -6.526749, 1, 1.5, 0.5, 0.5,
-3.630183, 0, -6.526749, 0, 1.5, 0.5, 0.5,
-3.630183, 1, -6.526749, 0, -0.5, 0.5, 0.5,
-3.630183, 1, -6.526749, 1, -0.5, 0.5, 0.5,
-3.630183, 1, -6.526749, 1, 1.5, 0.5, 0.5,
-3.630183, 1, -6.526749, 0, 1.5, 0.5, 0.5,
-3.630183, 2, -6.526749, 0, -0.5, 0.5, 0.5,
-3.630183, 2, -6.526749, 1, -0.5, 0.5, 0.5,
-3.630183, 2, -6.526749, 1, 1.5, 0.5, 0.5,
-3.630183, 2, -6.526749, 0, 1.5, 0.5, 0.5,
-3.630183, 3, -6.526749, 0, -0.5, 0.5, 0.5,
-3.630183, 3, -6.526749, 1, -0.5, 0.5, 0.5,
-3.630183, 3, -6.526749, 1, 1.5, 0.5, 0.5,
-3.630183, 3, -6.526749, 0, 1.5, 0.5, 0.5
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
-3.163701, -3.226791, -4,
-3.163701, -3.226791, 4,
-3.163701, -3.226791, -4,
-3.319195, -3.392725, -4,
-3.163701, -3.226791, -2,
-3.319195, -3.392725, -2,
-3.163701, -3.226791, 0,
-3.319195, -3.392725, 0,
-3.163701, -3.226791, 2,
-3.319195, -3.392725, 2,
-3.163701, -3.226791, 4,
-3.319195, -3.392725, 4
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
-3.630183, -3.724595, -4, 0, -0.5, 0.5, 0.5,
-3.630183, -3.724595, -4, 1, -0.5, 0.5, 0.5,
-3.630183, -3.724595, -4, 1, 1.5, 0.5, 0.5,
-3.630183, -3.724595, -4, 0, 1.5, 0.5, 0.5,
-3.630183, -3.724595, -2, 0, -0.5, 0.5, 0.5,
-3.630183, -3.724595, -2, 1, -0.5, 0.5, 0.5,
-3.630183, -3.724595, -2, 1, 1.5, 0.5, 0.5,
-3.630183, -3.724595, -2, 0, 1.5, 0.5, 0.5,
-3.630183, -3.724595, 0, 0, -0.5, 0.5, 0.5,
-3.630183, -3.724595, 0, 1, -0.5, 0.5, 0.5,
-3.630183, -3.724595, 0, 1, 1.5, 0.5, 0.5,
-3.630183, -3.724595, 0, 0, 1.5, 0.5, 0.5,
-3.630183, -3.724595, 2, 0, -0.5, 0.5, 0.5,
-3.630183, -3.724595, 2, 1, -0.5, 0.5, 0.5,
-3.630183, -3.724595, 2, 1, 1.5, 0.5, 0.5,
-3.630183, -3.724595, 2, 0, 1.5, 0.5, 0.5,
-3.630183, -3.724595, 4, 0, -0.5, 0.5, 0.5,
-3.630183, -3.724595, 4, 1, -0.5, 0.5, 0.5,
-3.630183, -3.724595, 4, 1, 1.5, 0.5, 0.5,
-3.630183, -3.724595, 4, 0, 1.5, 0.5, 0.5
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
-3.163701, -3.226791, -5.720433,
-3.163701, 3.410604, -5.720433,
-3.163701, -3.226791, 5.030438,
-3.163701, 3.410604, 5.030438,
-3.163701, -3.226791, -5.720433,
-3.163701, -3.226791, 5.030438,
-3.163701, 3.410604, -5.720433,
-3.163701, 3.410604, 5.030438,
-3.163701, -3.226791, -5.720433,
3.05606, -3.226791, -5.720433,
-3.163701, -3.226791, 5.030438,
3.05606, -3.226791, 5.030438,
-3.163701, 3.410604, -5.720433,
3.05606, 3.410604, -5.720433,
-3.163701, 3.410604, 5.030438,
3.05606, 3.410604, 5.030438,
3.05606, -3.226791, -5.720433,
3.05606, 3.410604, -5.720433,
3.05606, -3.226791, 5.030438,
3.05606, 3.410604, 5.030438,
3.05606, -3.226791, -5.720433,
3.05606, -3.226791, 5.030438,
3.05606, 3.410604, -5.720433,
3.05606, 3.410604, 5.030438
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
var radius = 7.519874;
var distance = 33.45677;
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
mvMatrix.translate( 0.05382025, -0.09190655, 0.3449974 );
mvMatrix.scale( 1.307226, 1.224974, 0.7562768 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.45677);
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
atrazine<-read.table("atrazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-atrazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'atrazine' not found
```

```r
y<-atrazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'atrazine' not found
```

```r
z<-atrazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'atrazine' not found
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
-3.073122, 0.2275497, -2.427373, 0, 0, 1, 1, 1,
-2.600968, 1.18399, -1.039331, 1, 0, 0, 1, 1,
-2.591869, 1.415364, -1.319344, 1, 0, 0, 1, 1,
-2.424488, -0.4982702, -0.5619376, 1, 0, 0, 1, 1,
-2.40258, -0.2381184, -3.936824, 1, 0, 0, 1, 1,
-2.352529, -0.6792524, -2.701491, 1, 0, 0, 1, 1,
-2.321698, -1.829307, -1.677853, 0, 0, 0, 1, 1,
-2.311254, 0.320653, 0.2954172, 0, 0, 0, 1, 1,
-2.305737, 0.2010484, -2.003681, 0, 0, 0, 1, 1,
-2.239206, -2.160414, -3.50532, 0, 0, 0, 1, 1,
-2.228859, -0.663107, -1.953969, 0, 0, 0, 1, 1,
-2.192316, -0.2088921, -1.96466, 0, 0, 0, 1, 1,
-2.189623, -0.7035738, -3.1824, 0, 0, 0, 1, 1,
-2.186876, 1.487929, -1.446597, 1, 1, 1, 1, 1,
-2.180763, -0.9430438, -2.650472, 1, 1, 1, 1, 1,
-2.148851, 0.3310928, -0.6419904, 1, 1, 1, 1, 1,
-2.05714, 0.7124062, -0.7783715, 1, 1, 1, 1, 1,
-1.989129, 0.9133615, -2.643049, 1, 1, 1, 1, 1,
-1.987164, -0.05219909, -2.265298, 1, 1, 1, 1, 1,
-1.981478, -0.1466903, -2.145184, 1, 1, 1, 1, 1,
-1.965628, 0.01072074, -2.77248, 1, 1, 1, 1, 1,
-1.957882, 0.531182, -2.078426, 1, 1, 1, 1, 1,
-1.946739, -1.007333, -3.531899, 1, 1, 1, 1, 1,
-1.940206, -0.4587992, -1.124541, 1, 1, 1, 1, 1,
-1.939286, 0.8889567, -0.6765698, 1, 1, 1, 1, 1,
-1.93099, -0.4864073, -0.2725228, 1, 1, 1, 1, 1,
-1.893288, 0.9706286, -2.054736, 1, 1, 1, 1, 1,
-1.881899, -0.9943873, -2.715025, 1, 1, 1, 1, 1,
-1.86202, -0.2429801, -0.5556532, 0, 0, 1, 1, 1,
-1.854255, 0.05455469, -0.4479029, 1, 0, 0, 1, 1,
-1.840994, 0.613595, 0.2814732, 1, 0, 0, 1, 1,
-1.834684, 1.54085, -2.687457, 1, 0, 0, 1, 1,
-1.830867, 1.154034, 0.2783276, 1, 0, 0, 1, 1,
-1.821561, 0.5371085, -2.013007, 1, 0, 0, 1, 1,
-1.820794, -0.4759038, -1.549142, 0, 0, 0, 1, 1,
-1.789321, 0.5784244, -2.653996, 0, 0, 0, 1, 1,
-1.775331, -1.56163, -0.436089, 0, 0, 0, 1, 1,
-1.768841, -0.8651478, -2.06014, 0, 0, 0, 1, 1,
-1.764395, 0.1390343, -1.965775, 0, 0, 0, 1, 1,
-1.739851, -1.101092, -0.09214357, 0, 0, 0, 1, 1,
-1.736351, -1.151443, -2.288983, 0, 0, 0, 1, 1,
-1.724182, 0.20973, -0.9012085, 1, 1, 1, 1, 1,
-1.683099, -1.37069, -2.638492, 1, 1, 1, 1, 1,
-1.628665, -1.646405, -3.530446, 1, 1, 1, 1, 1,
-1.628424, -1.371325, -1.428498, 1, 1, 1, 1, 1,
-1.620364, 1.543301, -0.9680544, 1, 1, 1, 1, 1,
-1.611917, -0.6647229, -1.23471, 1, 1, 1, 1, 1,
-1.597805, 0.2696261, -0.4761582, 1, 1, 1, 1, 1,
-1.593122, -0.9220045, -1.879709, 1, 1, 1, 1, 1,
-1.584232, 1.523068, -3.102885, 1, 1, 1, 1, 1,
-1.581416, 0.0475226, -1.709733, 1, 1, 1, 1, 1,
-1.577331, -1.825727, -2.872614, 1, 1, 1, 1, 1,
-1.571151, 0.9800718, 0.7936413, 1, 1, 1, 1, 1,
-1.563912, -0.7771183, -1.72996, 1, 1, 1, 1, 1,
-1.551871, -0.6824355, 0.6041885, 1, 1, 1, 1, 1,
-1.541573, 0.9619837, 0.8639858, 1, 1, 1, 1, 1,
-1.541476, -0.5776012, -1.906971, 0, 0, 1, 1, 1,
-1.536547, -1.196909, -4.857893, 1, 0, 0, 1, 1,
-1.535095, -0.848128, 0.1299851, 1, 0, 0, 1, 1,
-1.525571, 1.023802, -1.824086, 1, 0, 0, 1, 1,
-1.513619, 0.5872914, -2.20223, 1, 0, 0, 1, 1,
-1.512974, -0.9638541, -3.913604, 1, 0, 0, 1, 1,
-1.506215, 1.202252, -3.487936, 0, 0, 0, 1, 1,
-1.49149, -0.4655034, -1.389115, 0, 0, 0, 1, 1,
-1.456054, -0.8701281, -2.105431, 0, 0, 0, 1, 1,
-1.448912, -0.04964707, -1.273495, 0, 0, 0, 1, 1,
-1.447, -0.04327874, 0.2201061, 0, 0, 0, 1, 1,
-1.44334, 0.8244233, -0.3669313, 0, 0, 0, 1, 1,
-1.43892, -1.221247, -0.5647402, 0, 0, 0, 1, 1,
-1.437626, -0.7281104, -2.766073, 1, 1, 1, 1, 1,
-1.433071, 0.3199261, -2.183945, 1, 1, 1, 1, 1,
-1.433036, -0.0004786421, -2.377088, 1, 1, 1, 1, 1,
-1.43225, 1.324865, 0.2465933, 1, 1, 1, 1, 1,
-1.428417, 0.07995177, -0.9515649, 1, 1, 1, 1, 1,
-1.418728, 0.6102702, -1.541272, 1, 1, 1, 1, 1,
-1.408085, -0.5834436, -3.12975, 1, 1, 1, 1, 1,
-1.399865, -0.7195068, -4.021199, 1, 1, 1, 1, 1,
-1.386131, -1.030563, -2.33001, 1, 1, 1, 1, 1,
-1.384414, 0.4817826, -3.428992, 1, 1, 1, 1, 1,
-1.381975, -0.7258042, -1.845296, 1, 1, 1, 1, 1,
-1.380984, -1.627964, -3.370304, 1, 1, 1, 1, 1,
-1.380902, -0.108914, -2.345024, 1, 1, 1, 1, 1,
-1.372987, 0.8751286, -1.860519, 1, 1, 1, 1, 1,
-1.358263, -0.4385292, -2.040757, 1, 1, 1, 1, 1,
-1.357489, -0.3051838, -3.298146, 0, 0, 1, 1, 1,
-1.350653, 0.4154679, -0.6717368, 1, 0, 0, 1, 1,
-1.33393, 1.274955, -1.618992, 1, 0, 0, 1, 1,
-1.313128, -0.394411, 0.1308135, 1, 0, 0, 1, 1,
-1.30778, -0.6851227, -1.843405, 1, 0, 0, 1, 1,
-1.293443, 0.2392913, 0.3846534, 1, 0, 0, 1, 1,
-1.289033, 1.633042, -0.1970626, 0, 0, 0, 1, 1,
-1.282111, -0.4730904, -1.365804, 0, 0, 0, 1, 1,
-1.280594, 2.097843, -2.175105, 0, 0, 0, 1, 1,
-1.280565, -2.785021, -4.482565, 0, 0, 0, 1, 1,
-1.264827, -0.8904445, -2.998381, 0, 0, 0, 1, 1,
-1.258207, -0.3552324, -2.251113, 0, 0, 0, 1, 1,
-1.253209, 0.9356984, -3.108523, 0, 0, 0, 1, 1,
-1.248415, -1.539131, -1.59396, 1, 1, 1, 1, 1,
-1.242299, 0.7915818, -0.157125, 1, 1, 1, 1, 1,
-1.23895, 1.167666, 0.4976385, 1, 1, 1, 1, 1,
-1.222094, -0.4340428, -1.078081, 1, 1, 1, 1, 1,
-1.204205, -0.5593362, -1.439241, 1, 1, 1, 1, 1,
-1.20338, 0.374175, -1.63675, 1, 1, 1, 1, 1,
-1.197958, 0.4819078, -0.1041695, 1, 1, 1, 1, 1,
-1.196337, 0.9678752, -1.757864, 1, 1, 1, 1, 1,
-1.191481, -0.134501, -2.491558, 1, 1, 1, 1, 1,
-1.18975, -0.5623022, -1.816364, 1, 1, 1, 1, 1,
-1.173535, -0.2068674, -1.52743, 1, 1, 1, 1, 1,
-1.169402, 0.2895372, -2.3784, 1, 1, 1, 1, 1,
-1.165045, 0.3168443, 0.8535064, 1, 1, 1, 1, 1,
-1.16405, -1.499973, -1.910495, 1, 1, 1, 1, 1,
-1.162796, 0.8646881, 0.2254747, 1, 1, 1, 1, 1,
-1.160535, -0.1724706, -2.438144, 0, 0, 1, 1, 1,
-1.152801, -0.4130275, -0.9604351, 1, 0, 0, 1, 1,
-1.142083, 2.059689, -1.708136, 1, 0, 0, 1, 1,
-1.135316, -1.461629, -1.955306, 1, 0, 0, 1, 1,
-1.133983, -0.5283902, -2.752114, 1, 0, 0, 1, 1,
-1.132875, -0.9783122, -2.230356, 1, 0, 0, 1, 1,
-1.125938, -1.472744, -2.74454, 0, 0, 0, 1, 1,
-1.125066, 0.6230736, -1.198063, 0, 0, 0, 1, 1,
-1.123059, 0.05165824, -1.429493, 0, 0, 0, 1, 1,
-1.121444, 1.043659, -2.492084, 0, 0, 0, 1, 1,
-1.113815, -0.4446907, -2.444394, 0, 0, 0, 1, 1,
-1.107307, 0.720629, -1.863678, 0, 0, 0, 1, 1,
-1.105906, -0.2630161, -1.875964, 0, 0, 0, 1, 1,
-1.10445, 0.06013648, -0.9472252, 1, 1, 1, 1, 1,
-1.096457, 1.315365, -1.038617, 1, 1, 1, 1, 1,
-1.070474, -0.3718702, -0.8751994, 1, 1, 1, 1, 1,
-1.060235, -1.074927, -3.124669, 1, 1, 1, 1, 1,
-1.059143, 0.09222569, -1.43302, 1, 1, 1, 1, 1,
-1.052263, -0.9350206, -1.288073, 1, 1, 1, 1, 1,
-1.051592, -3.017454, -2.798425, 1, 1, 1, 1, 1,
-1.048862, -0.6649552, -1.406045, 1, 1, 1, 1, 1,
-1.038542, 0.3509471, -1.57889, 1, 1, 1, 1, 1,
-1.030129, -0.1368799, -1.501836, 1, 1, 1, 1, 1,
-1.026164, -0.09154484, -2.386975, 1, 1, 1, 1, 1,
-1.022118, -1.41116, -3.063769, 1, 1, 1, 1, 1,
-1.021112, -0.2114674, -1.273075, 1, 1, 1, 1, 1,
-1.014231, -0.2322695, -0.4494, 1, 1, 1, 1, 1,
-1.009388, 0.1228006, -2.406472, 1, 1, 1, 1, 1,
-1.006676, -1.896615, -3.85751, 0, 0, 1, 1, 1,
-1.003302, -0.1982348, -3.319975, 1, 0, 0, 1, 1,
-1.001655, 1.461997, 1.020488, 1, 0, 0, 1, 1,
-0.9981647, -0.1448797, -2.289332, 1, 0, 0, 1, 1,
-0.9957263, -0.1117212, -2.855884, 1, 0, 0, 1, 1,
-0.9865039, -0.1074461, -0.9646099, 1, 0, 0, 1, 1,
-0.9852616, 0.7890959, -0.7874687, 0, 0, 0, 1, 1,
-0.976966, -0.2172458, -2.857051, 0, 0, 0, 1, 1,
-0.975084, -0.8134876, -2.662352, 0, 0, 0, 1, 1,
-0.9720749, 1.431043, -1.024218, 0, 0, 0, 1, 1,
-0.9669368, 1.81834, -1.434872, 0, 0, 0, 1, 1,
-0.9653246, -0.3385306, -2.859814, 0, 0, 0, 1, 1,
-0.9613739, -1.296017, -3.720205, 0, 0, 0, 1, 1,
-0.9576722, 0.2980393, -2.862381, 1, 1, 1, 1, 1,
-0.9485621, -0.8895317, -1.790387, 1, 1, 1, 1, 1,
-0.947327, -0.02104883, -2.764429, 1, 1, 1, 1, 1,
-0.9417598, -0.8822207, -3.675821, 1, 1, 1, 1, 1,
-0.9369516, -0.7518498, -0.8386084, 1, 1, 1, 1, 1,
-0.9327058, -1.042776, -2.892815, 1, 1, 1, 1, 1,
-0.9270734, 0.4481839, -1.350526, 1, 1, 1, 1, 1,
-0.9256641, -0.3584962, -0.8199781, 1, 1, 1, 1, 1,
-0.924824, -0.364745, -2.255142, 1, 1, 1, 1, 1,
-0.9220899, 0.1765197, -1.009942, 1, 1, 1, 1, 1,
-0.9216546, 0.3756769, 0.6604782, 1, 1, 1, 1, 1,
-0.9204394, 0.6784275, -2.208658, 1, 1, 1, 1, 1,
-0.9186545, -0.6004187, -1.456091, 1, 1, 1, 1, 1,
-0.9178067, -0.8955744, -1.810755, 1, 1, 1, 1, 1,
-0.9168794, -0.4659922, -2.219106, 1, 1, 1, 1, 1,
-0.904044, 0.3364232, -0.07585949, 0, 0, 1, 1, 1,
-0.8993703, 0.2827528, -1.112217, 1, 0, 0, 1, 1,
-0.8948668, 0.8143756, -1.611315, 1, 0, 0, 1, 1,
-0.8826013, 0.03829993, -0.9659758, 1, 0, 0, 1, 1,
-0.8821993, 0.4828223, -1.180766, 1, 0, 0, 1, 1,
-0.8664758, -0.1323862, -1.429203, 1, 0, 0, 1, 1,
-0.8607379, -0.246433, -2.153794, 0, 0, 0, 1, 1,
-0.8600123, 0.2937972, -1.09007, 0, 0, 0, 1, 1,
-0.8565608, 0.1930787, -1.310628, 0, 0, 0, 1, 1,
-0.8547406, -0.1973527, -1.089451, 0, 0, 0, 1, 1,
-0.8544149, -0.9999551, -3.125807, 0, 0, 0, 1, 1,
-0.8520517, -0.9675503, -2.194592, 0, 0, 0, 1, 1,
-0.8512691, 0.1821386, -1.95061, 0, 0, 0, 1, 1,
-0.8487054, -0.2604447, -3.859478, 1, 1, 1, 1, 1,
-0.8432333, -0.6462966, -1.796119, 1, 1, 1, 1, 1,
-0.84201, 2.283778, -0.8043289, 1, 1, 1, 1, 1,
-0.8402718, 1.111826, -1.982223, 1, 1, 1, 1, 1,
-0.8391031, -0.4338459, -2.047646, 1, 1, 1, 1, 1,
-0.836652, -0.4760564, -1.982131, 1, 1, 1, 1, 1,
-0.8328285, -0.5008661, -0.2404741, 1, 1, 1, 1, 1,
-0.8242394, -0.2962341, -2.311198, 1, 1, 1, 1, 1,
-0.8185771, 1.102795, -1.385745, 1, 1, 1, 1, 1,
-0.8104056, -1.018465, -2.872194, 1, 1, 1, 1, 1,
-0.8059577, 1.500906, -0.6542356, 1, 1, 1, 1, 1,
-0.8026871, -0.2621534, -0.2493002, 1, 1, 1, 1, 1,
-0.8011696, -0.4088434, -0.5131247, 1, 1, 1, 1, 1,
-0.7958139, 1.363132, -1.790652, 1, 1, 1, 1, 1,
-0.7884209, 1.039306, -0.04787194, 1, 1, 1, 1, 1,
-0.781406, -1.020281, -2.69764, 0, 0, 1, 1, 1,
-0.7790614, -1.113083, -3.010098, 1, 0, 0, 1, 1,
-0.7761215, 0.7199919, -2.657049, 1, 0, 0, 1, 1,
-0.7738644, -0.7760361, -2.043102, 1, 0, 0, 1, 1,
-0.7654634, -0.5651647, -3.035072, 1, 0, 0, 1, 1,
-0.7624113, 0.09723005, -0.9644829, 1, 0, 0, 1, 1,
-0.7590632, 0.02004262, -1.929063, 0, 0, 0, 1, 1,
-0.7440908, -0.3504045, -1.198115, 0, 0, 0, 1, 1,
-0.7426464, 1.096579, -1.206709, 0, 0, 0, 1, 1,
-0.7414921, -0.03796021, -1.274392, 0, 0, 0, 1, 1,
-0.7370136, 0.755728, -0.9200408, 0, 0, 0, 1, 1,
-0.7355371, -0.5688457, -2.118446, 0, 0, 0, 1, 1,
-0.7321623, 1.678869, 0.4577689, 0, 0, 0, 1, 1,
-0.7317904, -0.8765134, -3.408227, 1, 1, 1, 1, 1,
-0.7283645, 0.2456678, -1.435277, 1, 1, 1, 1, 1,
-0.7221407, 2.140253, 0.2531257, 1, 1, 1, 1, 1,
-0.7212834, 0.9672951, -0.6875729, 1, 1, 1, 1, 1,
-0.7196147, 1.687679, 1.011044, 1, 1, 1, 1, 1,
-0.7181737, 0.3097854, -0.4252535, 1, 1, 1, 1, 1,
-0.7123249, 0.5796297, -0.7052093, 1, 1, 1, 1, 1,
-0.7115135, 0.1432929, -1.652251, 1, 1, 1, 1, 1,
-0.7088603, 1.222294, -0.5406811, 1, 1, 1, 1, 1,
-0.708195, -0.5221393, -1.498209, 1, 1, 1, 1, 1,
-0.6962565, -0.3997849, -2.803144, 1, 1, 1, 1, 1,
-0.6950406, -0.2387186, -1.38953, 1, 1, 1, 1, 1,
-0.6880975, -1.06112, -3.902666, 1, 1, 1, 1, 1,
-0.6816594, -0.8278418, -4.078535, 1, 1, 1, 1, 1,
-0.6816279, 0.2239888, -2.068106, 1, 1, 1, 1, 1,
-0.6784247, 0.3415788, -1.86997, 0, 0, 1, 1, 1,
-0.6781181, 0.1688257, -0.583881, 1, 0, 0, 1, 1,
-0.6701669, 1.487847, -1.727502, 1, 0, 0, 1, 1,
-0.6689986, -0.7441165, -3.41, 1, 0, 0, 1, 1,
-0.6688964, 2.011314, 0.007925038, 1, 0, 0, 1, 1,
-0.6669412, 0.7500149, -1.309468, 1, 0, 0, 1, 1,
-0.6626574, 1.030055, -1.910722, 0, 0, 0, 1, 1,
-0.6549646, 1.379423, -0.8355222, 0, 0, 0, 1, 1,
-0.6545877, 1.410402, -0.9853744, 0, 0, 0, 1, 1,
-0.6528507, 1.230321, -2.124706, 0, 0, 0, 1, 1,
-0.6519247, -0.004587261, -1.804838, 0, 0, 0, 1, 1,
-0.6507952, -0.4850987, -1.748622, 0, 0, 0, 1, 1,
-0.6427711, 0.705812, -1.066802, 0, 0, 0, 1, 1,
-0.6418597, -0.03038704, -0.643676, 1, 1, 1, 1, 1,
-0.6400568, -0.7309605, -1.860738, 1, 1, 1, 1, 1,
-0.6374591, -0.3595273, -1.085189, 1, 1, 1, 1, 1,
-0.6353914, 0.7472326, 0.7315134, 1, 1, 1, 1, 1,
-0.6332304, 0.11927, -2.25576, 1, 1, 1, 1, 1,
-0.6309692, -0.5431241, -2.121232, 1, 1, 1, 1, 1,
-0.626897, 0.2065961, -1.617441, 1, 1, 1, 1, 1,
-0.625888, 1.370021, 0.2534322, 1, 1, 1, 1, 1,
-0.624557, 1.514818, 0.01068524, 1, 1, 1, 1, 1,
-0.62251, -0.2973832, -2.080476, 1, 1, 1, 1, 1,
-0.6195185, -1.120842, -1.813877, 1, 1, 1, 1, 1,
-0.6167609, -0.6552282, -1.252654, 1, 1, 1, 1, 1,
-0.6148744, 0.5933951, -0.0793475, 1, 1, 1, 1, 1,
-0.6132005, -1.374207, -3.326975, 1, 1, 1, 1, 1,
-0.610325, -2.000757, -3.855591, 1, 1, 1, 1, 1,
-0.6102623, 0.683275, 0.3932685, 0, 0, 1, 1, 1,
-0.6086879, -0.722079, -2.766196, 1, 0, 0, 1, 1,
-0.6053734, 1.073036, 0.3374906, 1, 0, 0, 1, 1,
-0.600683, -0.0636808, -0.8644428, 1, 0, 0, 1, 1,
-0.5949783, -1.06642, -2.510607, 1, 0, 0, 1, 1,
-0.5941377, 0.2038692, -1.330172, 1, 0, 0, 1, 1,
-0.5928547, -0.4477811, -1.981281, 0, 0, 0, 1, 1,
-0.5923159, 1.325811, -0.2645743, 0, 0, 0, 1, 1,
-0.5859528, -2.19959, -1.625607, 0, 0, 0, 1, 1,
-0.5762124, -0.0226828, -1.608991, 0, 0, 0, 1, 1,
-0.5744944, -1.898263, -2.121472, 0, 0, 0, 1, 1,
-0.5705694, 1.235012, 0.4437094, 0, 0, 0, 1, 1,
-0.5700649, 0.2446108, -3.252968, 0, 0, 0, 1, 1,
-0.5679192, 0.2332564, -1.890154, 1, 1, 1, 1, 1,
-0.5678056, 1.658514, -1.568185, 1, 1, 1, 1, 1,
-0.5655103, -0.939593, -3.538323, 1, 1, 1, 1, 1,
-0.5650547, -0.8412316, -2.398437, 1, 1, 1, 1, 1,
-0.5602986, -1.077756, -3.429609, 1, 1, 1, 1, 1,
-0.5571362, -1.059201, -2.676569, 1, 1, 1, 1, 1,
-0.5478852, -2.089289, -5.563867, 1, 1, 1, 1, 1,
-0.5466012, 0.1007743, -3.077953, 1, 1, 1, 1, 1,
-0.5452383, 0.1197939, -1.576764, 1, 1, 1, 1, 1,
-0.5449732, -2.469441, -2.837359, 1, 1, 1, 1, 1,
-0.5378718, -0.4799037, -1.450173, 1, 1, 1, 1, 1,
-0.5356978, 0.3886998, -1.097481, 1, 1, 1, 1, 1,
-0.5330839, 1.277987, -0.2751849, 1, 1, 1, 1, 1,
-0.5306989, -2.624356, -2.410589, 1, 1, 1, 1, 1,
-0.5281211, -0.08472137, -2.233469, 1, 1, 1, 1, 1,
-0.5198539, -0.3642385, -1.204834, 0, 0, 1, 1, 1,
-0.5158558, -1.102557, -3.970812, 1, 0, 0, 1, 1,
-0.5132497, -0.7570382, -0.5575334, 1, 0, 0, 1, 1,
-0.512652, 0.3846684, -0.3802448, 1, 0, 0, 1, 1,
-0.50372, 0.5559533, -0.9930223, 1, 0, 0, 1, 1,
-0.5026827, 0.6109752, -0.3385349, 1, 0, 0, 1, 1,
-0.501861, -0.9953445, -2.119004, 0, 0, 0, 1, 1,
-0.5017074, -1.640358, -2.686042, 0, 0, 0, 1, 1,
-0.5010428, -0.7167397, -2.336122, 0, 0, 0, 1, 1,
-0.5005199, -1.87329, -2.086301, 0, 0, 0, 1, 1,
-0.4990443, -0.3550969, -1.90658, 0, 0, 0, 1, 1,
-0.4944071, -1.990157, -3.191414, 0, 0, 0, 1, 1,
-0.4942796, 0.4721724, 1.024372, 0, 0, 0, 1, 1,
-0.4869851, -1.064676, -2.336694, 1, 1, 1, 1, 1,
-0.486957, 2.228952, -0.6155041, 1, 1, 1, 1, 1,
-0.483483, 1.134361, -1.277834, 1, 1, 1, 1, 1,
-0.4832799, 0.7728803, 0.1079173, 1, 1, 1, 1, 1,
-0.4810257, -1.420213, -2.869872, 1, 1, 1, 1, 1,
-0.4797586, 1.332034, -0.01425072, 1, 1, 1, 1, 1,
-0.4721963, -0.5713981, -0.200143, 1, 1, 1, 1, 1,
-0.4704233, -1.391804, -4.126521, 1, 1, 1, 1, 1,
-0.469953, 0.2399286, -0.1886069, 1, 1, 1, 1, 1,
-0.4698912, 0.4307793, -1.268208, 1, 1, 1, 1, 1,
-0.4669824, 0.2933158, -0.4419863, 1, 1, 1, 1, 1,
-0.4653339, -0.9141982, -2.6641, 1, 1, 1, 1, 1,
-0.4619524, -0.4598687, -1.67497, 1, 1, 1, 1, 1,
-0.4405836, 0.5109805, -0.804643, 1, 1, 1, 1, 1,
-0.4388494, -1.288085, -1.100936, 1, 1, 1, 1, 1,
-0.4380346, 0.3176149, 1.054594, 0, 0, 1, 1, 1,
-0.4370575, -1.617735, -1.577731, 1, 0, 0, 1, 1,
-0.4337483, 0.146414, -0.7771227, 1, 0, 0, 1, 1,
-0.4334017, 1.972843, 0.4797312, 1, 0, 0, 1, 1,
-0.4236837, 2.275373, 0.7754561, 1, 0, 0, 1, 1,
-0.4224218, 1.636456, -0.0481493, 1, 0, 0, 1, 1,
-0.4201088, 0.330688, 0.08966221, 0, 0, 0, 1, 1,
-0.4191196, 0.5377994, -0.05478772, 0, 0, 0, 1, 1,
-0.4180715, -0.9872775, -1.999541, 0, 0, 0, 1, 1,
-0.4109533, -1.127439, -1.724813, 0, 0, 0, 1, 1,
-0.4093518, -0.01994378, -1.512939, 0, 0, 0, 1, 1,
-0.4026513, 0.0558847, -1.843917, 0, 0, 0, 1, 1,
-0.4019034, 0.01927114, -1.643538, 0, 0, 0, 1, 1,
-0.4015492, 0.9011164, -1.599486, 1, 1, 1, 1, 1,
-0.3932115, -0.2955374, -2.244133, 1, 1, 1, 1, 1,
-0.3929057, -1.380806, -2.543583, 1, 1, 1, 1, 1,
-0.3913781, -2.005623, -2.03242, 1, 1, 1, 1, 1,
-0.3907199, 0.4715867, 0.5557972, 1, 1, 1, 1, 1,
-0.3869604, -0.5577774, -3.863895, 1, 1, 1, 1, 1,
-0.3828164, -1.714193, -2.035634, 1, 1, 1, 1, 1,
-0.3779822, -1.00178, -2.298088, 1, 1, 1, 1, 1,
-0.3656861, 1.356655, 0.7358256, 1, 1, 1, 1, 1,
-0.362926, -0.08464887, -2.972984, 1, 1, 1, 1, 1,
-0.3581438, 0.574096, -0.4727989, 1, 1, 1, 1, 1,
-0.358095, 0.6417972, -2.15935, 1, 1, 1, 1, 1,
-0.3555524, 0.8013377, -1.172532, 1, 1, 1, 1, 1,
-0.354333, 0.3825425, -0.9637056, 1, 1, 1, 1, 1,
-0.3522288, 1.381345, 0.1620319, 1, 1, 1, 1, 1,
-0.3515399, 1.581737, -1.339767, 0, 0, 1, 1, 1,
-0.3478018, 1.461706, 1.589878, 1, 0, 0, 1, 1,
-0.3392074, 0.03095615, -2.338377, 1, 0, 0, 1, 1,
-0.335938, -0.9618971, -3.378173, 1, 0, 0, 1, 1,
-0.3339982, 0.1012498, -1.542472, 1, 0, 0, 1, 1,
-0.3238827, 0.8795711, -0.7029038, 1, 0, 0, 1, 1,
-0.3203118, -0.6129572, -2.81321, 0, 0, 0, 1, 1,
-0.3155993, 1.78332, -1.351045, 0, 0, 0, 1, 1,
-0.3143101, 1.669182, -0.782976, 0, 0, 0, 1, 1,
-0.3118723, 1.227248, 0.06526826, 0, 0, 0, 1, 1,
-0.311799, 0.7986804, -0.7689524, 0, 0, 0, 1, 1,
-0.3075707, 0.1707901, -0.794052, 0, 0, 0, 1, 1,
-0.2994002, -1.934212, -2.550222, 0, 0, 0, 1, 1,
-0.2974865, -0.6583146, -2.719496, 1, 1, 1, 1, 1,
-0.2907426, 1.305598, -1.913569, 1, 1, 1, 1, 1,
-0.290497, -1.158296, -0.7181216, 1, 1, 1, 1, 1,
-0.2893232, -0.9683757, -2.916981, 1, 1, 1, 1, 1,
-0.2863247, 0.1842563, -0.5979891, 1, 1, 1, 1, 1,
-0.2857654, 2.556045, 0.9203691, 1, 1, 1, 1, 1,
-0.2829473, 1.055727, 0.598132, 1, 1, 1, 1, 1,
-0.2820799, 0.4819862, -2.123732, 1, 1, 1, 1, 1,
-0.2809571, -0.1899211, -0.454196, 1, 1, 1, 1, 1,
-0.2801252, -0.7552486, -2.516763, 1, 1, 1, 1, 1,
-0.277054, 0.03188332, -2.227126, 1, 1, 1, 1, 1,
-0.2758513, -1.261264, -1.90846, 1, 1, 1, 1, 1,
-0.2737033, 1.601365, -1.369961, 1, 1, 1, 1, 1,
-0.2709938, 0.5178106, -1.887865, 1, 1, 1, 1, 1,
-0.270496, 0.09673861, -1.052833, 1, 1, 1, 1, 1,
-0.2642011, 1.390402, -0.9246964, 0, 0, 1, 1, 1,
-0.262147, 0.5438774, -1.411623, 1, 0, 0, 1, 1,
-0.2618927, -0.9175193, -3.185316, 1, 0, 0, 1, 1,
-0.2610015, 0.9749283, -1.93449, 1, 0, 0, 1, 1,
-0.2591577, -0.6139911, -3.697306, 1, 0, 0, 1, 1,
-0.258565, 0.9852656, 1.498846, 1, 0, 0, 1, 1,
-0.2578374, -0.04917473, -3.443373, 0, 0, 0, 1, 1,
-0.2540457, -1.607371, -3.757518, 0, 0, 0, 1, 1,
-0.2444924, 0.7888438, -1.440479, 0, 0, 0, 1, 1,
-0.24112, 0.4695249, 0.318377, 0, 0, 0, 1, 1,
-0.2376827, 1.21683, -0.7080718, 0, 0, 0, 1, 1,
-0.2357029, -0.7632856, -2.905467, 0, 0, 0, 1, 1,
-0.2355209, -0.2719634, -4.059787, 0, 0, 0, 1, 1,
-0.2316327, -0.1034093, -1.381842, 1, 1, 1, 1, 1,
-0.229832, 1.17434, 0.1881473, 1, 1, 1, 1, 1,
-0.2265609, -0.1378763, -2.332841, 1, 1, 1, 1, 1,
-0.2244674, 1.207281, -1.521913, 1, 1, 1, 1, 1,
-0.2240507, -0.01954143, -2.19171, 1, 1, 1, 1, 1,
-0.2212151, -0.8233051, -2.033689, 1, 1, 1, 1, 1,
-0.218363, -2.06496, -2.5928, 1, 1, 1, 1, 1,
-0.2154528, 0.4078583, -1.988616, 1, 1, 1, 1, 1,
-0.2145081, -0.8888004, -2.323896, 1, 1, 1, 1, 1,
-0.2066866, 0.7009623, 0.326446, 1, 1, 1, 1, 1,
-0.2061566, -1.324451, -1.38198, 1, 1, 1, 1, 1,
-0.2045038, -1.190782, -1.018586, 1, 1, 1, 1, 1,
-0.2027273, 0.5628476, -1.002989, 1, 1, 1, 1, 1,
-0.2015273, -0.114581, -1.783175, 1, 1, 1, 1, 1,
-0.2004706, 0.4849846, 1.639646, 1, 1, 1, 1, 1,
-0.1964087, -0.8890771, -4.71106, 0, 0, 1, 1, 1,
-0.1957625, -0.06337331, -0.8286505, 1, 0, 0, 1, 1,
-0.1947323, 0.6885152, 0.2041269, 1, 0, 0, 1, 1,
-0.1941558, -0.4847798, -3.711865, 1, 0, 0, 1, 1,
-0.1867301, -1.603145, -4.257266, 1, 0, 0, 1, 1,
-0.1853235, -1.474676, -2.766568, 1, 0, 0, 1, 1,
-0.1836519, 0.7053553, 1.120981, 0, 0, 0, 1, 1,
-0.1834409, -1.307144, -4.723774, 0, 0, 0, 1, 1,
-0.182795, 0.9346181, -1.048119, 0, 0, 0, 1, 1,
-0.1816771, 1.05952, 1.142868, 0, 0, 0, 1, 1,
-0.1770583, -0.2257818, -2.016284, 0, 0, 0, 1, 1,
-0.1677978, -0.301306, -2.124124, 0, 0, 0, 1, 1,
-0.1617697, -2.49807, -3.222861, 0, 0, 0, 1, 1,
-0.1565906, 0.4482311, -2.17659, 1, 1, 1, 1, 1,
-0.1547894, 1.871262, -1.719434, 1, 1, 1, 1, 1,
-0.1415186, 0.5914561, -0.1195389, 1, 1, 1, 1, 1,
-0.1405765, -0.8589451, -3.604204, 1, 1, 1, 1, 1,
-0.1382341, -0.4517403, -1.87683, 1, 1, 1, 1, 1,
-0.1375046, -0.8882566, -3.505973, 1, 1, 1, 1, 1,
-0.137203, 1.733583, 0.05799993, 1, 1, 1, 1, 1,
-0.1367042, -1.502978, -1.977501, 1, 1, 1, 1, 1,
-0.1337114, 0.1442554, 0.1471767, 1, 1, 1, 1, 1,
-0.1318828, -0.4550827, -2.429157, 1, 1, 1, 1, 1,
-0.1305238, -0.2969816, -3.45974, 1, 1, 1, 1, 1,
-0.1245722, 1.4964, -0.07021649, 1, 1, 1, 1, 1,
-0.1222122, -0.1958534, -4.14731, 1, 1, 1, 1, 1,
-0.11646, 0.361749, -1.434063, 1, 1, 1, 1, 1,
-0.1134279, -0.1727612, -3.596472, 1, 1, 1, 1, 1,
-0.1099784, 0.4659353, -0.6270685, 0, 0, 1, 1, 1,
-0.1044142, -0.8241006, -4.628309, 1, 0, 0, 1, 1,
-0.09912658, -1.10647, -1.017606, 1, 0, 0, 1, 1,
-0.09820691, 0.9769163, 0.004587449, 1, 0, 0, 1, 1,
-0.09386895, -0.4571256, -1.786029, 1, 0, 0, 1, 1,
-0.0935759, -1.07855, -1.456205, 1, 0, 0, 1, 1,
-0.09109294, 2.250456, 1.560329, 0, 0, 0, 1, 1,
-0.09106771, 1.048594, 1.841491, 0, 0, 0, 1, 1,
-0.0909657, -0.1831889, -2.354572, 0, 0, 0, 1, 1,
-0.09036227, 0.6279798, 1.185814, 0, 0, 0, 1, 1,
-0.08973113, -0.4154876, -1.353221, 0, 0, 0, 1, 1,
-0.0864606, 0.2469149, -1.305343, 0, 0, 0, 1, 1,
-0.08392754, 0.7729673, -1.33952, 0, 0, 0, 1, 1,
-0.07993138, -1.149736, -3.916385, 1, 1, 1, 1, 1,
-0.07893106, 0.1718953, 0.3115918, 1, 1, 1, 1, 1,
-0.07782287, -0.288785, -2.611239, 1, 1, 1, 1, 1,
-0.07774642, 0.914483, -0.09810197, 1, 1, 1, 1, 1,
-0.07471963, -0.2227311, -0.9944062, 1, 1, 1, 1, 1,
-0.07407563, -1.073881, -3.458123, 1, 1, 1, 1, 1,
-0.07092925, 0.8689013, -0.6737551, 1, 1, 1, 1, 1,
-0.06433957, -1.082353, -3.04492, 1, 1, 1, 1, 1,
-0.06298252, -1.729586, -0.09160393, 1, 1, 1, 1, 1,
-0.0590423, 1.353861, -1.115409, 1, 1, 1, 1, 1,
-0.05421032, 0.2657259, 0.4450862, 1, 1, 1, 1, 1,
-0.05084709, -0.2504496, -2.617795, 1, 1, 1, 1, 1,
-0.05058071, 1.960961, -0.3482438, 1, 1, 1, 1, 1,
-0.04698715, 0.009689924, -2.275715, 1, 1, 1, 1, 1,
-0.04624933, 0.08285144, -0.492491, 1, 1, 1, 1, 1,
-0.04519664, 1.164797, -1.070619, 0, 0, 1, 1, 1,
-0.04283732, -1.3762, -2.874269, 1, 0, 0, 1, 1,
-0.04180697, -0.5828162, -2.455392, 1, 0, 0, 1, 1,
-0.04014256, 0.6682683, -0.4316261, 1, 0, 0, 1, 1,
-0.02956672, 1.127079, 0.5054538, 1, 0, 0, 1, 1,
-0.02368028, 0.1200836, -1.868964, 1, 0, 0, 1, 1,
-0.02351873, 1.370983, -0.2605093, 0, 0, 0, 1, 1,
-0.01652037, 0.1527266, 0.441308, 0, 0, 0, 1, 1,
-0.01493514, -0.06826425, -2.421604, 0, 0, 0, 1, 1,
-0.01301358, 1.050473, 1.444299, 0, 0, 0, 1, 1,
-0.01192705, -2.079563, -1.753168, 0, 0, 0, 1, 1,
-0.011077, -0.1336804, -1.709982, 0, 0, 0, 1, 1,
-0.009752244, -1.550018, -3.544433, 0, 0, 0, 1, 1,
-0.007875917, -0.4407586, -3.165856, 1, 1, 1, 1, 1,
-0.005261505, -0.3079447, -3.353022, 1, 1, 1, 1, 1,
-0.002893693, -0.7417928, -3.003824, 1, 1, 1, 1, 1,
-0.002578902, 1.149337, -1.229417, 1, 1, 1, 1, 1,
-0.002548534, -0.1779021, -2.244902, 1, 1, 1, 1, 1,
0.001266822, -1.003855, 4.410322, 1, 1, 1, 1, 1,
0.003578287, -0.4081612, 4.873872, 1, 1, 1, 1, 1,
0.003776912, -0.8288318, 3.607696, 1, 1, 1, 1, 1,
0.004728525, -0.6696195, 2.317166, 1, 1, 1, 1, 1,
0.008949559, 1.284317, 0.6024942, 1, 1, 1, 1, 1,
0.01046893, 0.4818867, 0.3755209, 1, 1, 1, 1, 1,
0.01278031, 0.7888072, -1.342051, 1, 1, 1, 1, 1,
0.0168674, 0.5235667, -2.831941, 1, 1, 1, 1, 1,
0.01923663, -0.7965295, 4.415007, 1, 1, 1, 1, 1,
0.02010148, 1.048999, 1.957348, 1, 1, 1, 1, 1,
0.02132756, -0.5571722, 1.198377, 0, 0, 1, 1, 1,
0.02372764, -0.8492485, 3.244606, 1, 0, 0, 1, 1,
0.02766215, 1.282074, -0.5088967, 1, 0, 0, 1, 1,
0.03337121, -2.09112, 1.775114, 1, 0, 0, 1, 1,
0.0334287, 1.479088, -1.443935, 1, 0, 0, 1, 1,
0.03655548, -1.552053, 2.975507, 1, 0, 0, 1, 1,
0.03849803, -0.8512549, 2.87043, 0, 0, 0, 1, 1,
0.03967875, 0.2148571, 0.3714169, 0, 0, 0, 1, 1,
0.04194758, -0.6512282, 1.084826, 0, 0, 0, 1, 1,
0.04287222, -1.568944, 3.619588, 0, 0, 0, 1, 1,
0.04574953, -0.3893045, 3.514103, 0, 0, 0, 1, 1,
0.04586251, -1.67948, 2.441199, 0, 0, 0, 1, 1,
0.04649895, 0.06670731, 0.2227671, 0, 0, 0, 1, 1,
0.04677283, 1.745914, -0.4857501, 1, 1, 1, 1, 1,
0.05146726, -0.7732127, 3.786657, 1, 1, 1, 1, 1,
0.05275111, 0.435044, -0.06739422, 1, 1, 1, 1, 1,
0.05410448, 0.1881079, -1.859746, 1, 1, 1, 1, 1,
0.05778228, -0.176323, 3.131562, 1, 1, 1, 1, 1,
0.06264195, -1.407062, 4.366717, 1, 1, 1, 1, 1,
0.06309822, -0.8256001, 2.023807, 1, 1, 1, 1, 1,
0.0637079, -0.1215082, 2.353076, 1, 1, 1, 1, 1,
0.0677485, -0.7191762, 4.872855, 1, 1, 1, 1, 1,
0.07072199, -1.310933, 2.987973, 1, 1, 1, 1, 1,
0.07298461, -0.6450982, 2.526986, 1, 1, 1, 1, 1,
0.0770947, -0.4741294, 3.630608, 1, 1, 1, 1, 1,
0.08156263, 1.237246, -1.179147, 1, 1, 1, 1, 1,
0.08516361, -0.2187243, 2.921411, 1, 1, 1, 1, 1,
0.08698981, 0.8515269, -0.3104966, 1, 1, 1, 1, 1,
0.08701017, 1.067822, -1.382335, 0, 0, 1, 1, 1,
0.08867099, -0.7960036, 3.120061, 1, 0, 0, 1, 1,
0.08902134, -1.719221, 4.723282, 1, 0, 0, 1, 1,
0.0923286, 1.37455, 0.6249914, 1, 0, 0, 1, 1,
0.0939298, 0.1693521, 1.183287, 1, 0, 0, 1, 1,
0.09670001, 2.60366, -0.3996882, 1, 0, 0, 1, 1,
0.09783223, -0.7226688, 4.007421, 0, 0, 0, 1, 1,
0.1001298, -0.7248632, 1.888435, 0, 0, 0, 1, 1,
0.1048499, -0.2463863, 3.37765, 0, 0, 0, 1, 1,
0.1086675, 0.1789158, 0.1500247, 0, 0, 0, 1, 1,
0.1101987, -0.803618, 1.843132, 0, 0, 0, 1, 1,
0.1102652, 1.82507, -0.5115594, 0, 0, 0, 1, 1,
0.1140465, -1.063305, 3.837194, 0, 0, 0, 1, 1,
0.1148245, 1.177783, -2.289239, 1, 1, 1, 1, 1,
0.1176507, -0.6832294, 1.938441, 1, 1, 1, 1, 1,
0.1191785, 0.2083661, 0.2653075, 1, 1, 1, 1, 1,
0.119699, 0.4461264, 1.326978, 1, 1, 1, 1, 1,
0.12037, -0.2420233, 3.692349, 1, 1, 1, 1, 1,
0.1291424, 3.313943, 0.9726731, 1, 1, 1, 1, 1,
0.1315457, 0.4567024, 0.2771859, 1, 1, 1, 1, 1,
0.1315575, -0.9542741, 2.642227, 1, 1, 1, 1, 1,
0.1332701, 1.722689, 1.22195, 1, 1, 1, 1, 1,
0.1362629, -0.4785264, 0.8041457, 1, 1, 1, 1, 1,
0.1379577, -1.111902, 3.031421, 1, 1, 1, 1, 1,
0.1390516, -1.682045, 2.979917, 1, 1, 1, 1, 1,
0.148053, -0.5077755, 2.422493, 1, 1, 1, 1, 1,
0.1481122, -0.5844884, 2.584735, 1, 1, 1, 1, 1,
0.1490173, 0.05942677, 1.946261, 1, 1, 1, 1, 1,
0.1563581, 0.5279558, -1.109384, 0, 0, 1, 1, 1,
0.1606161, -0.7336596, 0.881617, 1, 0, 0, 1, 1,
0.1628286, 0.2669465, -0.6935464, 1, 0, 0, 1, 1,
0.1651613, 0.8714287, 0.187561, 1, 0, 0, 1, 1,
0.1652268, -1.501184, 3.112566, 1, 0, 0, 1, 1,
0.1667854, 1.464399, -1.007348, 1, 0, 0, 1, 1,
0.1680368, -0.1284013, 0.9811704, 0, 0, 0, 1, 1,
0.1710427, 0.6384228, 0.7387705, 0, 0, 0, 1, 1,
0.1737424, 0.04089479, 0.6115786, 0, 0, 0, 1, 1,
0.1739148, 0.3684835, 1.635761, 0, 0, 0, 1, 1,
0.1749035, 0.7064404, 0.409812, 0, 0, 0, 1, 1,
0.1755604, 1.171353, 0.4862337, 0, 0, 0, 1, 1,
0.1782186, -1.138214, 3.177691, 0, 0, 0, 1, 1,
0.1801711, 1.25003, -0.07376406, 1, 1, 1, 1, 1,
0.1829929, -1.16817, 2.650184, 1, 1, 1, 1, 1,
0.185343, 1.262658, 2.094463, 1, 1, 1, 1, 1,
0.1862309, -1.272224, 2.375125, 1, 1, 1, 1, 1,
0.1891182, -0.4846341, 1.905158, 1, 1, 1, 1, 1,
0.1925762, -1.31678, 3.916461, 1, 1, 1, 1, 1,
0.2004557, 0.2965347, -0.9978602, 1, 1, 1, 1, 1,
0.2012959, -2.929992, 2.541509, 1, 1, 1, 1, 1,
0.2020792, 0.06273992, 0.01746845, 1, 1, 1, 1, 1,
0.2043077, 0.9395387, 0.2959124, 1, 1, 1, 1, 1,
0.2053243, -0.7877527, 2.306483, 1, 1, 1, 1, 1,
0.2086387, 0.6709369, 1.472611, 1, 1, 1, 1, 1,
0.2122187, 0.3095891, 1.678267, 1, 1, 1, 1, 1,
0.2137795, 0.5664069, -0.8913333, 1, 1, 1, 1, 1,
0.2140059, 0.3813542, 1.302157, 1, 1, 1, 1, 1,
0.2158142, 2.21781, 0.3885981, 0, 0, 1, 1, 1,
0.2195366, 0.5959617, -0.4700932, 1, 0, 0, 1, 1,
0.2207181, -0.717472, 4.283737, 1, 0, 0, 1, 1,
0.2212138, -1.32292, 4.624659, 1, 0, 0, 1, 1,
0.2214562, -0.5497345, 0.6593786, 1, 0, 0, 1, 1,
0.2229419, -0.2772786, 2.731619, 1, 0, 0, 1, 1,
0.2240284, 1.371126, 1.718296, 0, 0, 0, 1, 1,
0.2241922, -1.100029, 3.8438, 0, 0, 0, 1, 1,
0.2288482, 0.2919998, -0.0602468, 0, 0, 0, 1, 1,
0.2296322, -0.7456041, 3.77536, 0, 0, 0, 1, 1,
0.2314534, -1.656563, 3.223119, 0, 0, 0, 1, 1,
0.2341137, -1.592803, 3.31436, 0, 0, 0, 1, 1,
0.2354733, -0.9342176, 2.144818, 0, 0, 0, 1, 1,
0.2355129, -0.1172733, 1.905027, 1, 1, 1, 1, 1,
0.24083, -0.4218324, 2.647817, 1, 1, 1, 1, 1,
0.2427811, 0.6443101, 0.03186327, 1, 1, 1, 1, 1,
0.247735, -0.9886123, 3.057921, 1, 1, 1, 1, 1,
0.2506066, 0.6060295, 1.171384, 1, 1, 1, 1, 1,
0.2565447, -1.798518, 2.311828, 1, 1, 1, 1, 1,
0.2612833, 1.052568, 0.98102, 1, 1, 1, 1, 1,
0.2666984, 0.1942567, 2.614973, 1, 1, 1, 1, 1,
0.2673442, -2.06856, 3.558937, 1, 1, 1, 1, 1,
0.2693152, -1.427829, 2.338401, 1, 1, 1, 1, 1,
0.270266, 0.6334217, -0.2435389, 1, 1, 1, 1, 1,
0.2714394, -0.2442403, 2.329733, 1, 1, 1, 1, 1,
0.2800834, 0.8554267, -0.1192078, 1, 1, 1, 1, 1,
0.2829663, -1.330274, 2.724399, 1, 1, 1, 1, 1,
0.2872819, -0.5399137, 4.830445, 1, 1, 1, 1, 1,
0.2907654, -0.03072282, 0.8833763, 0, 0, 1, 1, 1,
0.2942319, -0.7896825, 3.131053, 1, 0, 0, 1, 1,
0.2978897, -0.6509657, 3.296961, 1, 0, 0, 1, 1,
0.2994085, 1.025554, -0.17409, 1, 0, 0, 1, 1,
0.300065, 1.034081, 1.048655, 1, 0, 0, 1, 1,
0.3008422, -0.5055887, 3.342422, 1, 0, 0, 1, 1,
0.3021145, -0.2569007, 1.576768, 0, 0, 0, 1, 1,
0.302246, -1.632953, 3.77583, 0, 0, 0, 1, 1,
0.3025401, -2.163112, 2.934889, 0, 0, 0, 1, 1,
0.3077312, 0.9818441, -1.434986, 0, 0, 0, 1, 1,
0.3087903, 0.2536879, 2.842331, 0, 0, 0, 1, 1,
0.3098718, -0.3596747, 3.689413, 0, 0, 0, 1, 1,
0.3121232, -2.25448, 4.428175, 0, 0, 0, 1, 1,
0.3132869, -0.1579047, 2.6127, 1, 1, 1, 1, 1,
0.3156555, 0.1405838, 0.506775, 1, 1, 1, 1, 1,
0.3175063, 0.4306386, -0.6182275, 1, 1, 1, 1, 1,
0.3180409, 0.1299096, 1.740371, 1, 1, 1, 1, 1,
0.3195855, -0.8221983, 3.957126, 1, 1, 1, 1, 1,
0.3224198, -0.1140039, 3.217225, 1, 1, 1, 1, 1,
0.3224573, 1.074439, 0.5809355, 1, 1, 1, 1, 1,
0.326177, -0.05977289, 3.60556, 1, 1, 1, 1, 1,
0.3275779, -1.42051, 3.791664, 1, 1, 1, 1, 1,
0.3281977, -2.023038, 2.111832, 1, 1, 1, 1, 1,
0.3311289, -1.021948, 3.220265, 1, 1, 1, 1, 1,
0.333224, 0.1619839, 2.160933, 1, 1, 1, 1, 1,
0.3344657, 0.6562694, 2.363767, 1, 1, 1, 1, 1,
0.3361389, -0.5830429, 2.593444, 1, 1, 1, 1, 1,
0.3377063, 0.4204095, -0.5204942, 1, 1, 1, 1, 1,
0.3393397, -0.4419133, 3.124074, 0, 0, 1, 1, 1,
0.3400339, 1.413745, 0.7375729, 1, 0, 0, 1, 1,
0.3509188, -0.5047475, 3.010255, 1, 0, 0, 1, 1,
0.3521895, -0.05175538, 1.05957, 1, 0, 0, 1, 1,
0.3525344, -0.6116336, 3.238566, 1, 0, 0, 1, 1,
0.3572673, -1.093735, 4.520323, 1, 0, 0, 1, 1,
0.3580569, 0.4318537, 2.188667, 0, 0, 0, 1, 1,
0.359574, -0.4356425, 3.599314, 0, 0, 0, 1, 1,
0.3601817, 0.09301688, 0.5718002, 0, 0, 0, 1, 1,
0.360955, 0.4434245, -1.807646, 0, 0, 0, 1, 1,
0.36245, 0.3671028, 1.311357, 0, 0, 0, 1, 1,
0.3652109, -0.04223187, 2.191059, 0, 0, 0, 1, 1,
0.3667492, 0.06963275, 2.317609, 0, 0, 0, 1, 1,
0.3728007, -0.1929608, 0.9362891, 1, 1, 1, 1, 1,
0.3735531, -1.54181, 1.879868, 1, 1, 1, 1, 1,
0.3742867, 1.591343, 0.6582748, 1, 1, 1, 1, 1,
0.3821287, -0.1592337, 1.285157, 1, 1, 1, 1, 1,
0.3826413, 0.03047788, 3.248754, 1, 1, 1, 1, 1,
0.3837857, 1.084084, -0.2374553, 1, 1, 1, 1, 1,
0.3839119, 0.3870295, 0.5123659, 1, 1, 1, 1, 1,
0.3893192, 0.7190702, 1.335569, 1, 1, 1, 1, 1,
0.392513, -0.3656724, 3.205293, 1, 1, 1, 1, 1,
0.3988261, -0.2208552, 2.065503, 1, 1, 1, 1, 1,
0.3988471, 0.4327942, 1.223177, 1, 1, 1, 1, 1,
0.399933, 1.504322, 1.607288, 1, 1, 1, 1, 1,
0.4012062, 1.362208, 0.4519139, 1, 1, 1, 1, 1,
0.4034496, 0.8744161, 0.004276055, 1, 1, 1, 1, 1,
0.4065244, 0.1181296, 1.000564, 1, 1, 1, 1, 1,
0.4113648, -2.077341, 3.35386, 0, 0, 1, 1, 1,
0.4128058, -0.5134203, 3.788884, 1, 0, 0, 1, 1,
0.4129577, -0.7600117, 3.141421, 1, 0, 0, 1, 1,
0.4171661, 0.7290848, -0.5104595, 1, 0, 0, 1, 1,
0.4173833, -1.091313, 3.8255, 1, 0, 0, 1, 1,
0.4236106, 1.122623, 0.8097376, 1, 0, 0, 1, 1,
0.4247325, 0.3393684, 1.852687, 0, 0, 0, 1, 1,
0.4352205, 0.2869186, -0.2692346, 0, 0, 0, 1, 1,
0.4378408, 0.3704482, 1.220592, 0, 0, 0, 1, 1,
0.4402693, -1.861555, 3.548189, 0, 0, 0, 1, 1,
0.4404671, -1.771966, 3.143971, 0, 0, 0, 1, 1,
0.441409, -0.6874109, 1.415472, 0, 0, 0, 1, 1,
0.4432333, 1.248433, 1.262441, 0, 0, 0, 1, 1,
0.4444344, -1.628722, 1.525249, 1, 1, 1, 1, 1,
0.4446116, -0.3543662, 2.339314, 1, 1, 1, 1, 1,
0.4460057, -2.632709, 3.102501, 1, 1, 1, 1, 1,
0.4481365, -0.4174142, 1.415402, 1, 1, 1, 1, 1,
0.4502869, 1.731207, 1.646879, 1, 1, 1, 1, 1,
0.4504656, 0.6879556, 0.1273042, 1, 1, 1, 1, 1,
0.4532208, 0.5673717, 1.447947, 1, 1, 1, 1, 1,
0.4532436, -0.7141658, 1.20859, 1, 1, 1, 1, 1,
0.4547074, 1.210683, 1.28187, 1, 1, 1, 1, 1,
0.4565354, -1.022106, 3.092836, 1, 1, 1, 1, 1,
0.4599822, 0.8221264, 0.1909705, 1, 1, 1, 1, 1,
0.4618254, 0.5821149, 1.6184, 1, 1, 1, 1, 1,
0.464805, -0.6912154, 2.327728, 1, 1, 1, 1, 1,
0.4666797, 0.6121147, -0.09739639, 1, 1, 1, 1, 1,
0.4773251, 0.1678921, 2.655028, 1, 1, 1, 1, 1,
0.47979, -2.110609, 0.860854, 0, 0, 1, 1, 1,
0.4817384, -1.429415, 1.607267, 1, 0, 0, 1, 1,
0.4824236, -2.113287, 3.634532, 1, 0, 0, 1, 1,
0.483925, -0.8212056, 3.048042, 1, 0, 0, 1, 1,
0.4842815, -0.8337765, 2.024762, 1, 0, 0, 1, 1,
0.489694, -0.865803, 2.20888, 1, 0, 0, 1, 1,
0.4974301, 0.1308826, 1.396833, 0, 0, 0, 1, 1,
0.5023592, 0.497963, 0.8275009, 0, 0, 0, 1, 1,
0.5042295, -0.4703467, 2.5544, 0, 0, 0, 1, 1,
0.5097758, -1.582261, 3.329459, 0, 0, 0, 1, 1,
0.5113518, -2.421143, 1.205995, 0, 0, 0, 1, 1,
0.5117357, -0.1761801, 1.381774, 0, 0, 0, 1, 1,
0.5118488, 0.7294396, 0.7054644, 0, 0, 0, 1, 1,
0.5167773, 0.7319108, 1.08499, 1, 1, 1, 1, 1,
0.5262232, -0.6121588, 3.848629, 1, 1, 1, 1, 1,
0.527236, 0.0294771, 0.6226843, 1, 1, 1, 1, 1,
0.5305828, -0.1852597, 1.627387, 1, 1, 1, 1, 1,
0.5308799, 0.5316873, 0.5092012, 1, 1, 1, 1, 1,
0.5346488, -0.9290672, 2.763177, 1, 1, 1, 1, 1,
0.5397573, 1.222802, 0.1522828, 1, 1, 1, 1, 1,
0.5427462, 0.4972799, 0.9029056, 1, 1, 1, 1, 1,
0.5432163, 0.1947802, -0.3517368, 1, 1, 1, 1, 1,
0.544891, -1.550904, 1.071019, 1, 1, 1, 1, 1,
0.5461607, -0.886868, 4.013535, 1, 1, 1, 1, 1,
0.5482497, 0.4272181, 0.3406623, 1, 1, 1, 1, 1,
0.5488545, -2.098752, 3.240377, 1, 1, 1, 1, 1,
0.5503867, -0.8074838, 3.513566, 1, 1, 1, 1, 1,
0.5524275, 0.9808543, 0.008216027, 1, 1, 1, 1, 1,
0.5540957, 1.635388, -1.452235, 0, 0, 1, 1, 1,
0.5559032, 0.2457207, -0.07450496, 1, 0, 0, 1, 1,
0.5564136, -0.5458657, 3.550612, 1, 0, 0, 1, 1,
0.5580905, 0.07046742, 1.369778, 1, 0, 0, 1, 1,
0.5582507, 1.989015, 1.106395, 1, 0, 0, 1, 1,
0.5612776, 0.9279134, 1.252888, 1, 0, 0, 1, 1,
0.5622174, -0.4771525, 0.5583174, 0, 0, 0, 1, 1,
0.569063, 0.5359324, 1.785249, 0, 0, 0, 1, 1,
0.5770687, -1.120629, 0.7237686, 0, 0, 0, 1, 1,
0.5811555, 0.05854819, 1.485923, 0, 0, 0, 1, 1,
0.5815892, -0.2162869, 1.852118, 0, 0, 0, 1, 1,
0.5854748, 1.016527, 0.03099164, 0, 0, 0, 1, 1,
0.5949916, -1.689464, 3.403664, 0, 0, 0, 1, 1,
0.5977501, -1.289198, 2.807694, 1, 1, 1, 1, 1,
0.5997645, -0.4866319, 0.2675248, 1, 1, 1, 1, 1,
0.6017143, -1.67052, 2.574124, 1, 1, 1, 1, 1,
0.6033729, 0.1664039, 1.951393, 1, 1, 1, 1, 1,
0.605551, -0.2190841, 2.353188, 1, 1, 1, 1, 1,
0.6073026, -1.417112, 1.902037, 1, 1, 1, 1, 1,
0.6133144, -0.2512421, 2.886263, 1, 1, 1, 1, 1,
0.6135821, 0.7749132, 1.583346, 1, 1, 1, 1, 1,
0.6136279, 2.261098, -0.7367019, 1, 1, 1, 1, 1,
0.615171, 1.584629, 0.9297404, 1, 1, 1, 1, 1,
0.6199614, -0.6688253, 4.20611, 1, 1, 1, 1, 1,
0.6218293, 0.7514025, 1.515488, 1, 1, 1, 1, 1,
0.6235316, -0.9551261, 2.216149, 1, 1, 1, 1, 1,
0.6265698, -1.171053, 2.2907, 1, 1, 1, 1, 1,
0.6278347, 0.8844168, -0.7571783, 1, 1, 1, 1, 1,
0.6283472, 1.610582, 1.270835, 0, 0, 1, 1, 1,
0.6325299, 1.542383, 1.03698, 1, 0, 0, 1, 1,
0.6330617, 0.8373988, -1.465019, 1, 0, 0, 1, 1,
0.6353638, 0.3144779, -0.1589472, 1, 0, 0, 1, 1,
0.6367123, 1.220744, 1.379933, 1, 0, 0, 1, 1,
0.6524977, 0.5638582, 1.476885, 1, 0, 0, 1, 1,
0.6531739, 0.09897196, 1.950557, 0, 0, 0, 1, 1,
0.6539354, 0.8647832, 1.127537, 0, 0, 0, 1, 1,
0.6555152, -0.2911713, 2.991074, 0, 0, 0, 1, 1,
0.6571401, -0.9297671, 1.095404, 0, 0, 0, 1, 1,
0.6576588, -0.7156063, 2.01147, 0, 0, 0, 1, 1,
0.6608966, 0.7305737, 1.615084, 0, 0, 0, 1, 1,
0.661301, -0.05249579, 2.578419, 0, 0, 0, 1, 1,
0.6639547, 0.1942792, 1.663676, 1, 1, 1, 1, 1,
0.6682671, -1.198561, 2.384485, 1, 1, 1, 1, 1,
0.668786, 1.086922, 0.673011, 1, 1, 1, 1, 1,
0.6704632, -0.7912246, 3.555583, 1, 1, 1, 1, 1,
0.6709712, -0.1415736, 2.080649, 1, 1, 1, 1, 1,
0.6727313, -0.2312758, 2.727711, 1, 1, 1, 1, 1,
0.683508, -2.13352, 2.864953, 1, 1, 1, 1, 1,
0.6913161, 0.8891411, 0.1549714, 1, 1, 1, 1, 1,
0.6964598, -0.9512967, 1.584914, 1, 1, 1, 1, 1,
0.7005309, -0.1089406, 3.486047, 1, 1, 1, 1, 1,
0.7006952, -0.1041678, 4.049977, 1, 1, 1, 1, 1,
0.7028427, -0.1910745, 2.931361, 1, 1, 1, 1, 1,
0.7039254, 1.311199, 1.044879, 1, 1, 1, 1, 1,
0.7076843, -1.603805, 3.365642, 1, 1, 1, 1, 1,
0.7126657, -0.7474045, 2.054442, 1, 1, 1, 1, 1,
0.7161372, -0.4814541, 0.7012502, 0, 0, 1, 1, 1,
0.7176945, -0.6398002, 3.143642, 1, 0, 0, 1, 1,
0.7258188, -0.394411, 2.278521, 1, 0, 0, 1, 1,
0.7266698, 0.4930289, 0.7531829, 1, 0, 0, 1, 1,
0.7268651, 0.3931967, 1.315837, 1, 0, 0, 1, 1,
0.7282326, 1.669284, -0.6160633, 1, 0, 0, 1, 1,
0.7306049, 0.7239281, -0.2647334, 0, 0, 0, 1, 1,
0.7325832, 0.5689915, -1.034665, 0, 0, 0, 1, 1,
0.7330736, 0.9469083, -0.3064507, 0, 0, 0, 1, 1,
0.7355431, 1.166522, 1.436889, 0, 0, 0, 1, 1,
0.7462144, 1.289845, 0.4062806, 0, 0, 0, 1, 1,
0.747875, -0.1866177, 1.644104, 0, 0, 0, 1, 1,
0.7487496, 0.2094084, 0.3773916, 0, 0, 0, 1, 1,
0.7514693, 0.9524304, -2.111512, 1, 1, 1, 1, 1,
0.7520798, -0.04783751, -0.1571949, 1, 1, 1, 1, 1,
0.7521592, 0.1718156, 2.852593, 1, 1, 1, 1, 1,
0.7548804, -1.072648, 3.2067, 1, 1, 1, 1, 1,
0.7603331, 0.8751677, 0.8632631, 1, 1, 1, 1, 1,
0.7609785, 0.8896677, 0.8089589, 1, 1, 1, 1, 1,
0.7612433, -1.463749, 3.215587, 1, 1, 1, 1, 1,
0.7626771, -0.6636783, 2.120257, 1, 1, 1, 1, 1,
0.7641544, 0.07929508, 1.677293, 1, 1, 1, 1, 1,
0.7668767, -2.45064, 1.93814, 1, 1, 1, 1, 1,
0.771016, 1.031365, 0.2008423, 1, 1, 1, 1, 1,
0.7786169, -0.8622061, 1.509826, 1, 1, 1, 1, 1,
0.7787095, -0.02070038, 3.259552, 1, 1, 1, 1, 1,
0.7816092, 0.7800009, -0.766251, 1, 1, 1, 1, 1,
0.7883869, -0.9839263, 3.905285, 1, 1, 1, 1, 1,
0.7931789, 1.58971, 0.7152365, 0, 0, 1, 1, 1,
0.7960309, 0.9741368, -2.293165, 1, 0, 0, 1, 1,
0.8064023, -0.2473812, 2.530719, 1, 0, 0, 1, 1,
0.80658, 1.374308, 2.051542, 1, 0, 0, 1, 1,
0.8119905, -0.581622, 0.7162902, 1, 0, 0, 1, 1,
0.8138632, 1.642634, 0.7798338, 1, 0, 0, 1, 1,
0.8155003, 0.3588467, -0.09424094, 0, 0, 0, 1, 1,
0.8155487, 1.051413, 0.3167893, 0, 0, 0, 1, 1,
0.8157672, -0.5027567, 2.960013, 0, 0, 0, 1, 1,
0.8168014, -1.698557, 2.957835, 0, 0, 0, 1, 1,
0.8255318, -0.233228, 3.869257, 0, 0, 0, 1, 1,
0.8267854, 0.4328141, 3.358827, 0, 0, 0, 1, 1,
0.8275492, 0.4028369, 0.6868396, 0, 0, 0, 1, 1,
0.8292034, 0.4521163, 0.5887111, 1, 1, 1, 1, 1,
0.8342775, 2.010794, 1.124357, 1, 1, 1, 1, 1,
0.8352984, -2.229409, 2.707513, 1, 1, 1, 1, 1,
0.8435845, -0.1057173, 1.14258, 1, 1, 1, 1, 1,
0.8469788, 1.434731, -0.07807377, 1, 1, 1, 1, 1,
0.8483071, 0.1546128, 1.180015, 1, 1, 1, 1, 1,
0.8497527, 1.179331, 1.946265, 1, 1, 1, 1, 1,
0.8507857, 0.7443773, 2.468532, 1, 1, 1, 1, 1,
0.8530761, 0.6951728, 0.3493383, 1, 1, 1, 1, 1,
0.8553476, -0.2174562, 1.816896, 1, 1, 1, 1, 1,
0.8590826, 0.8208641, 0.6715429, 1, 1, 1, 1, 1,
0.8605997, 0.6046449, 1.069161, 1, 1, 1, 1, 1,
0.8704527, 1.509805, -0.09839526, 1, 1, 1, 1, 1,
0.8709039, 0.2901782, 0.04525417, 1, 1, 1, 1, 1,
0.8717011, 0.9652175, -0.1269139, 1, 1, 1, 1, 1,
0.8720918, 0.03657068, 0.4705279, 0, 0, 1, 1, 1,
0.8743419, -0.1469043, 3.246835, 1, 0, 0, 1, 1,
0.8756403, -0.658986, 2.51055, 1, 0, 0, 1, 1,
0.876236, 0.4438162, 1.685899, 1, 0, 0, 1, 1,
0.8796768, 0.5936065, 2.564806, 1, 0, 0, 1, 1,
0.8999333, -0.4629044, 1.527404, 1, 0, 0, 1, 1,
0.9004689, -0.596299, 3.561502, 0, 0, 0, 1, 1,
0.9012126, -0.3061019, 4.58449, 0, 0, 0, 1, 1,
0.9012204, -1.336173, 2.354411, 0, 0, 0, 1, 1,
0.9052288, -0.2482571, 0.9600993, 0, 0, 0, 1, 1,
0.90523, -0.7726864, 3.480594, 0, 0, 0, 1, 1,
0.9099635, -2.509017, 3.151048, 0, 0, 0, 1, 1,
0.9234753, 0.923863, 0.640447, 0, 0, 0, 1, 1,
0.9258085, -0.8769658, 3.319721, 1, 1, 1, 1, 1,
0.935803, -0.2332972, 3.372893, 1, 1, 1, 1, 1,
0.9362196, 1.537557, 0.7742437, 1, 1, 1, 1, 1,
0.9375253, 0.439884, 1.783874, 1, 1, 1, 1, 1,
0.9383618, 1.369926, -0.4709631, 1, 1, 1, 1, 1,
0.9402385, 1.945741, 0.4367725, 1, 1, 1, 1, 1,
0.9498637, 1.102001, 0.3252703, 1, 1, 1, 1, 1,
0.9513938, -1.296242, 1.756455, 1, 1, 1, 1, 1,
0.9544697, 0.3450136, 0.2876225, 1, 1, 1, 1, 1,
0.955932, -0.5272432, 1.112134, 1, 1, 1, 1, 1,
0.9588236, 1.192977, 1.162351, 1, 1, 1, 1, 1,
0.9596994, -0.01547603, 3.235415, 1, 1, 1, 1, 1,
0.9695686, -1.366135, 0.8666606, 1, 1, 1, 1, 1,
0.9697661, -0.2739025, 0.002261503, 1, 1, 1, 1, 1,
0.9745467, 0.1728328, 2.005316, 1, 1, 1, 1, 1,
0.979744, -0.7347646, 3.267203, 0, 0, 1, 1, 1,
0.9816493, 0.5394198, 1.448057, 1, 0, 0, 1, 1,
0.9924327, -0.5338759, 2.651107, 1, 0, 0, 1, 1,
0.9926621, -0.2805445, 2.833183, 1, 0, 0, 1, 1,
0.9952148, -0.7339569, 1.840482, 1, 0, 0, 1, 1,
1.002097, 1.187778, 1.920953, 1, 0, 0, 1, 1,
1.010664, -0.8815326, 2.826601, 0, 0, 0, 1, 1,
1.023845, -1.605923, 4.006078, 0, 0, 0, 1, 1,
1.025121, 1.32157, 1.862974, 0, 0, 0, 1, 1,
1.029436, 0.3132012, 1.52937, 0, 0, 0, 1, 1,
1.034554, 0.3064222, 1.238889, 0, 0, 0, 1, 1,
1.037467, 1.518431, 0.6561475, 0, 0, 0, 1, 1,
1.03781, -1.075261, 1.755429, 0, 0, 0, 1, 1,
1.038818, 0.4140608, 2.631427, 1, 1, 1, 1, 1,
1.03898, -0.4146679, 2.807769, 1, 1, 1, 1, 1,
1.050115, 0.856162, 1.290722, 1, 1, 1, 1, 1,
1.051211, -1.739061, 3.436966, 1, 1, 1, 1, 1,
1.051694, 0.8166779, 0.7123994, 1, 1, 1, 1, 1,
1.051949, 2.110099, -0.137766, 1, 1, 1, 1, 1,
1.059743, 0.5714791, 2.370809, 1, 1, 1, 1, 1,
1.066641, -0.9825976, 3.45568, 1, 1, 1, 1, 1,
1.06768, -0.9181708, 4.51822, 1, 1, 1, 1, 1,
1.073749, -0.1164659, -0.657835, 1, 1, 1, 1, 1,
1.074534, -0.7158287, 3.439649, 1, 1, 1, 1, 1,
1.098754, 0.1002772, 1.859172, 1, 1, 1, 1, 1,
1.10387, -0.3940991, 2.123618, 1, 1, 1, 1, 1,
1.11201, -1.450513, 0.7476486, 1, 1, 1, 1, 1,
1.11832, 1.065637, 1.149103, 1, 1, 1, 1, 1,
1.118532, -1.999233, 3.081747, 0, 0, 1, 1, 1,
1.150301, 0.2401739, 1.627297, 1, 0, 0, 1, 1,
1.150662, -1.588411, 2.889277, 1, 0, 0, 1, 1,
1.150784, -3.13013, 2.189535, 1, 0, 0, 1, 1,
1.170628, 0.2916735, 1.508499, 1, 0, 0, 1, 1,
1.17899, 1.210005, 2.465233, 1, 0, 0, 1, 1,
1.186124, -1.102831, 3.111284, 0, 0, 0, 1, 1,
1.191589, -1.800933, 2.705274, 0, 0, 0, 1, 1,
1.192534, -1.697298, 3.412261, 0, 0, 0, 1, 1,
1.197072, 0.4801301, 2.513956, 0, 0, 0, 1, 1,
1.205624, 1.019288, -0.173968, 0, 0, 0, 1, 1,
1.207856, 2.291687, -1.323899, 0, 0, 0, 1, 1,
1.211593, 0.8901599, 2.085395, 0, 0, 0, 1, 1,
1.21212, -0.8861728, 2.222147, 1, 1, 1, 1, 1,
1.213891, -0.2806406, 0.757117, 1, 1, 1, 1, 1,
1.224954, 1.533201, -0.3753352, 1, 1, 1, 1, 1,
1.23248, 1.369514, 0.08733083, 1, 1, 1, 1, 1,
1.234064, 0.2424313, 1.937277, 1, 1, 1, 1, 1,
1.234505, 0.5099962, 0.1319523, 1, 1, 1, 1, 1,
1.244878, 0.8956591, 1.459223, 1, 1, 1, 1, 1,
1.246588, 0.5328041, 2.229031, 1, 1, 1, 1, 1,
1.247865, -0.1507865, 1.953938, 1, 1, 1, 1, 1,
1.249421, -0.7330207, 2.993906, 1, 1, 1, 1, 1,
1.253544, 1.88409, 1.671441, 1, 1, 1, 1, 1,
1.253637, 0.9018208, 1.507428, 1, 1, 1, 1, 1,
1.254649, 0.1021174, 2.689905, 1, 1, 1, 1, 1,
1.257366, 0.9544177, -0.0844409, 1, 1, 1, 1, 1,
1.262476, -0.09613811, 2.033266, 1, 1, 1, 1, 1,
1.270895, -0.2716115, 2.973633, 0, 0, 1, 1, 1,
1.27326, 1.625441, 0.110623, 1, 0, 0, 1, 1,
1.28601, -0.4144539, 2.804123, 1, 0, 0, 1, 1,
1.287601, -0.9110531, 2.268609, 1, 0, 0, 1, 1,
1.292628, 1.222807, -0.2634603, 1, 0, 0, 1, 1,
1.294773, 0.07113859, 2.482854, 1, 0, 0, 1, 1,
1.298153, 0.5756708, 0.3858351, 0, 0, 0, 1, 1,
1.316387, 0.6667021, 1.820843, 0, 0, 0, 1, 1,
1.31656, 0.298923, 0.0009330479, 0, 0, 0, 1, 1,
1.321448, 1.471079, 0.5488781, 0, 0, 0, 1, 1,
1.327071, -0.5947911, 1.606697, 0, 0, 0, 1, 1,
1.338636, -0.2066216, 1.957575, 0, 0, 0, 1, 1,
1.340993, 1.412999, -1.789115, 0, 0, 0, 1, 1,
1.3428, 1.816465, 0.9537836, 1, 1, 1, 1, 1,
1.352128, -0.08287791, 0.8520911, 1, 1, 1, 1, 1,
1.359702, -1.640728, 0.9448664, 1, 1, 1, 1, 1,
1.363281, -1.058848, 1.736997, 1, 1, 1, 1, 1,
1.390668, -0.1348498, -0.1630333, 1, 1, 1, 1, 1,
1.39191, 1.337286, 0.4564741, 1, 1, 1, 1, 1,
1.392933, -1.903028, 2.119234, 1, 1, 1, 1, 1,
1.395871, -0.4217533, 0.9729051, 1, 1, 1, 1, 1,
1.40432, -0.02973046, 2.088811, 1, 1, 1, 1, 1,
1.412922, 2.373011, 0.0740983, 1, 1, 1, 1, 1,
1.427377, 0.2493822, 2.139851, 1, 1, 1, 1, 1,
1.432011, -2.112284, 1.699824, 1, 1, 1, 1, 1,
1.434105, 0.3902128, 0.314532, 1, 1, 1, 1, 1,
1.436928, -0.01752998, 2.533234, 1, 1, 1, 1, 1,
1.439314, -0.4802787, 0.4063065, 1, 1, 1, 1, 1,
1.449635, -2.043439, 1.674826, 0, 0, 1, 1, 1,
1.462789, -0.4825573, 1.831785, 1, 0, 0, 1, 1,
1.463719, -0.3931883, 2.226838, 1, 0, 0, 1, 1,
1.472692, -2.393468, 2.998225, 1, 0, 0, 1, 1,
1.477872, 0.5920053, 0.6900059, 1, 0, 0, 1, 1,
1.479774, -0.5509915, 3.511874, 1, 0, 0, 1, 1,
1.489878, -1.720854, 1.871443, 0, 0, 0, 1, 1,
1.498796, 0.8068963, 2.493932, 0, 0, 0, 1, 1,
1.499498, 0.2976959, 1.48924, 0, 0, 0, 1, 1,
1.508974, 0.7715731, 0.3669845, 0, 0, 0, 1, 1,
1.518014, -2.332459, 2.778864, 0, 0, 0, 1, 1,
1.521307, 0.3295709, 2.554498, 0, 0, 0, 1, 1,
1.53326, -0.7910337, 2.669348, 0, 0, 0, 1, 1,
1.549653, 0.3235301, 1.585503, 1, 1, 1, 1, 1,
1.555427, 1.260084, 2.325318, 1, 1, 1, 1, 1,
1.558679, -0.02377243, 0.5555565, 1, 1, 1, 1, 1,
1.562307, 0.5521112, 1.604403, 1, 1, 1, 1, 1,
1.568846, -0.8931741, 0.2517451, 1, 1, 1, 1, 1,
1.580817, 0.520479, 0.4144717, 1, 1, 1, 1, 1,
1.596764, -0.05782574, 1.247311, 1, 1, 1, 1, 1,
1.620937, -0.7096802, 2.311722, 1, 1, 1, 1, 1,
1.621831, -1.639945, 1.710773, 1, 1, 1, 1, 1,
1.656245, -0.7355267, 3.417628, 1, 1, 1, 1, 1,
1.661845, -1.490273, 0.9781185, 1, 1, 1, 1, 1,
1.685101, 0.4712552, 1.637721, 1, 1, 1, 1, 1,
1.696347, -1.72909, 0.1472335, 1, 1, 1, 1, 1,
1.706449, 0.07883783, 1.325878, 1, 1, 1, 1, 1,
1.718382, 1.038322, -0.588056, 1, 1, 1, 1, 1,
1.730367, 1.156921, 0.6794339, 0, 0, 1, 1, 1,
1.735383, 1.139825, 0.6547807, 1, 0, 0, 1, 1,
1.743399, 1.163104, 1.650761, 1, 0, 0, 1, 1,
1.748378, 0.5810608, 2.916226, 1, 0, 0, 1, 1,
1.751037, -1.06791, 0.6819955, 1, 0, 0, 1, 1,
1.754184, -0.9870464, 2.753422, 1, 0, 0, 1, 1,
1.757961, -0.1180702, 0.5942614, 0, 0, 0, 1, 1,
1.764167, 0.09618703, 1.400159, 0, 0, 0, 1, 1,
1.764628, -2.06637, 3.123293, 0, 0, 0, 1, 1,
1.769998, 1.71338, 0.8868217, 0, 0, 0, 1, 1,
1.775744, 0.2166511, 3.532037, 0, 0, 0, 1, 1,
1.790363, -0.7106525, 1.314925, 0, 0, 0, 1, 1,
1.792079, 0.9136191, -0.5839376, 0, 0, 0, 1, 1,
1.796293, -0.2520955, 1.751801, 1, 1, 1, 1, 1,
1.822364, -0.9688045, 1.171493, 1, 1, 1, 1, 1,
1.834227, -0.2227003, 2.874517, 1, 1, 1, 1, 1,
1.83948, 0.3528852, 1.324722, 1, 1, 1, 1, 1,
1.895171, 0.623768, 1.542674, 1, 1, 1, 1, 1,
1.896676, 0.8818333, 1.463824, 1, 1, 1, 1, 1,
1.918545, -0.7199035, 2.13436, 1, 1, 1, 1, 1,
1.930079, -0.317931, 2.375243, 1, 1, 1, 1, 1,
1.937431, 0.374343, 1.689869, 1, 1, 1, 1, 1,
1.958123, 0.8122515, 1.391622, 1, 1, 1, 1, 1,
1.963131, -0.7870889, 2.682785, 1, 1, 1, 1, 1,
1.968304, -0.8865874, 2.173229, 1, 1, 1, 1, 1,
2.004688, 0.7190045, 2.581088, 1, 1, 1, 1, 1,
2.01327, -0.6005945, 4.276503, 1, 1, 1, 1, 1,
2.051826, 0.4169413, 1.957648, 1, 1, 1, 1, 1,
2.082858, -1.240994, 2.454813, 0, 0, 1, 1, 1,
2.122684, -0.4273912, 2.826429, 1, 0, 0, 1, 1,
2.137354, -0.9476449, 2.764764, 1, 0, 0, 1, 1,
2.188488, 1.407335, 1.901589, 1, 0, 0, 1, 1,
2.188884, -0.8560833, 1.919672, 1, 0, 0, 1, 1,
2.199804, 0.3886053, 1.663078, 1, 0, 0, 1, 1,
2.217725, 0.3269816, 0.4657608, 0, 0, 0, 1, 1,
2.296094, -2.133034, 0.08183678, 0, 0, 0, 1, 1,
2.33007, -0.4829202, 4.560431, 0, 0, 0, 1, 1,
2.339924, 0.5297964, 1.333757, 0, 0, 0, 1, 1,
2.373443, -0.6339749, 0.4207239, 0, 0, 0, 1, 1,
2.377256, -1.17298, 3.115205, 0, 0, 0, 1, 1,
2.403272, 0.8123839, 3.355439, 0, 0, 0, 1, 1,
2.405488, 0.172946, -0.2731375, 1, 1, 1, 1, 1,
2.412338, 0.5206501, 2.363535, 1, 1, 1, 1, 1,
2.425954, 0.8002285, 1.893605, 1, 1, 1, 1, 1,
2.569897, 1.068774, 0.1973754, 1, 1, 1, 1, 1,
2.672038, -0.6024625, 1.746751, 1, 1, 1, 1, 1,
2.691515, 0.09904811, 1.46197, 1, 1, 1, 1, 1,
2.965481, 1.485477, 0.2548704, 1, 1, 1, 1, 1
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
var radius = 9.376151;
var distance = 32.93333;
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
mvMatrix.translate( 0.05382037, -0.09190655, 0.3449974 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.93333);
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
