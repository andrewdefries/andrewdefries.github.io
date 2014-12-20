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
-3.712872, -1.361338, -3.429883, 1, 0, 0, 1,
-3.288849, -0.2120494, -1.3201, 1, 0.007843138, 0, 1,
-3.091451, 1.433353, -0.8635403, 1, 0.01176471, 0, 1,
-3.036392, -0.8945083, -1.073472, 1, 0.01960784, 0, 1,
-2.931893, 0.5169021, -0.8015461, 1, 0.02352941, 0, 1,
-2.849617, -1.20075, -2.434498, 1, 0.03137255, 0, 1,
-2.675045, 1.293335, -1.309923, 1, 0.03529412, 0, 1,
-2.55056, -1.100284, -2.678822, 1, 0.04313726, 0, 1,
-2.497834, -0.2229167, -3.51944, 1, 0.04705882, 0, 1,
-2.491636, 0.7724733, 0.2349482, 1, 0.05490196, 0, 1,
-2.429425, 0.06970238, -0.6030846, 1, 0.05882353, 0, 1,
-2.428514, -0.2082711, -2.266794, 1, 0.06666667, 0, 1,
-2.398062, -0.9047865, -1.738228, 1, 0.07058824, 0, 1,
-2.30865, -0.5363699, -3.10641, 1, 0.07843138, 0, 1,
-2.289289, -0.7350497, -3.216546, 1, 0.08235294, 0, 1,
-2.284309, 0.7584171, -2.143835, 1, 0.09019608, 0, 1,
-2.20996, 1.587453, -1.203901, 1, 0.09411765, 0, 1,
-2.200634, 0.3426436, -1.56574, 1, 0.1019608, 0, 1,
-2.186371, -1.618705, -2.34964, 1, 0.1098039, 0, 1,
-2.178114, -0.5294811, -2.778846, 1, 0.1137255, 0, 1,
-2.175884, -0.4980575, -1.637838, 1, 0.1215686, 0, 1,
-2.140342, 0.01174366, -3.742142, 1, 0.1254902, 0, 1,
-2.102777, 1.667206, -0.03255032, 1, 0.1333333, 0, 1,
-2.096535, 1.29447, -1.710708, 1, 0.1372549, 0, 1,
-2.061239, 1.367819, -0.8056967, 1, 0.145098, 0, 1,
-2.054133, 0.7271252, -1.3334, 1, 0.1490196, 0, 1,
-2.03491, 1.038706, -1.947031, 1, 0.1568628, 0, 1,
-1.996857, -0.5459942, -2.99462, 1, 0.1607843, 0, 1,
-1.963517, -0.3179934, -1.870114, 1, 0.1686275, 0, 1,
-1.929374, -0.4676121, -0.1866501, 1, 0.172549, 0, 1,
-1.921, -0.415266, -0.9436093, 1, 0.1803922, 0, 1,
-1.896334, -0.3875906, -2.72564, 1, 0.1843137, 0, 1,
-1.86742, 0.4714399, -2.288109, 1, 0.1921569, 0, 1,
-1.805035, 1.448235, 0.177425, 1, 0.1960784, 0, 1,
-1.804524, 0.9184103, 0.4728883, 1, 0.2039216, 0, 1,
-1.791349, 1.309998, -1.82042, 1, 0.2117647, 0, 1,
-1.79064, -0.199927, -0.4152803, 1, 0.2156863, 0, 1,
-1.786461, 1.611245, -1.317014, 1, 0.2235294, 0, 1,
-1.748211, -0.3997086, -2.083119, 1, 0.227451, 0, 1,
-1.744464, -0.1106094, -1.569699, 1, 0.2352941, 0, 1,
-1.743605, 0.3577354, -2.166536, 1, 0.2392157, 0, 1,
-1.71381, 0.7222968, -1.372367, 1, 0.2470588, 0, 1,
-1.700395, 1.111965, -2.064501, 1, 0.2509804, 0, 1,
-1.68233, 1.148839, -0.7515277, 1, 0.2588235, 0, 1,
-1.650658, -0.264953, -3.41123, 1, 0.2627451, 0, 1,
-1.640519, -0.3350546, -0.5919509, 1, 0.2705882, 0, 1,
-1.634698, -1.162456, -3.849361, 1, 0.2745098, 0, 1,
-1.633195, -0.4847846, -1.320942, 1, 0.282353, 0, 1,
-1.631621, -0.2248531, -0.4649728, 1, 0.2862745, 0, 1,
-1.623539, 0.6493008, -0.5241766, 1, 0.2941177, 0, 1,
-1.611864, -0.2238559, -0.5134507, 1, 0.3019608, 0, 1,
-1.611197, -2.789096, -5.835354, 1, 0.3058824, 0, 1,
-1.600137, 1.929893, -0.5420477, 1, 0.3137255, 0, 1,
-1.575319, -0.1839152, -1.441254, 1, 0.3176471, 0, 1,
-1.566569, 0.2366166, -0.658488, 1, 0.3254902, 0, 1,
-1.547727, 2.498567, -0.8011199, 1, 0.3294118, 0, 1,
-1.543178, 0.3551168, -2.113502, 1, 0.3372549, 0, 1,
-1.533219, -0.3707273, -2.578065, 1, 0.3411765, 0, 1,
-1.525706, -0.3949014, -2.485527, 1, 0.3490196, 0, 1,
-1.525508, 0.2417735, -1.913116, 1, 0.3529412, 0, 1,
-1.525086, 0.9785037, -0.654804, 1, 0.3607843, 0, 1,
-1.524721, 0.4034767, -1.372357, 1, 0.3647059, 0, 1,
-1.515155, -0.9808434, -1.710523, 1, 0.372549, 0, 1,
-1.514675, 0.5222617, -0.8314453, 1, 0.3764706, 0, 1,
-1.495553, -0.5123689, -2.627512, 1, 0.3843137, 0, 1,
-1.492096, 1.695757, -0.954906, 1, 0.3882353, 0, 1,
-1.487134, 0.5989015, -0.7784526, 1, 0.3960784, 0, 1,
-1.481921, 0.1796212, -1.849131, 1, 0.4039216, 0, 1,
-1.477369, 0.7792846, 0.345393, 1, 0.4078431, 0, 1,
-1.477103, -1.163124, -3.366975, 1, 0.4156863, 0, 1,
-1.474999, 1.000188, -2.229543, 1, 0.4196078, 0, 1,
-1.474668, -1.65922, -0.9879284, 1, 0.427451, 0, 1,
-1.452613, -0.7772035, -4.251601, 1, 0.4313726, 0, 1,
-1.451239, 1.489346, 0.2135573, 1, 0.4392157, 0, 1,
-1.440189, 2.278296, -1.270303, 1, 0.4431373, 0, 1,
-1.439761, 1.530194, -1.943773, 1, 0.4509804, 0, 1,
-1.432385, -0.1818788, -2.405787, 1, 0.454902, 0, 1,
-1.427103, -0.5586618, -1.983336, 1, 0.4627451, 0, 1,
-1.42383, 1.402111, 0.5918034, 1, 0.4666667, 0, 1,
-1.406722, -0.8218392, -1.807373, 1, 0.4745098, 0, 1,
-1.399969, 0.8808452, -0.4588037, 1, 0.4784314, 0, 1,
-1.39706, -0.08766505, -1.873867, 1, 0.4862745, 0, 1,
-1.396297, -0.1104797, 0.2634609, 1, 0.4901961, 0, 1,
-1.390991, -0.3610415, 0.1004824, 1, 0.4980392, 0, 1,
-1.387651, 1.147591, -0.7180187, 1, 0.5058824, 0, 1,
-1.387647, 0.1311471, -1.989397, 1, 0.509804, 0, 1,
-1.3794, -1.004416, -1.742773, 1, 0.5176471, 0, 1,
-1.377144, -0.1744438, -0.5597821, 1, 0.5215687, 0, 1,
-1.37268, -0.8050448, -0.6102731, 1, 0.5294118, 0, 1,
-1.364125, 0.08280393, -1.094426, 1, 0.5333334, 0, 1,
-1.355852, 0.4639875, 0.3288527, 1, 0.5411765, 0, 1,
-1.347774, -1.534005, -1.730761, 1, 0.5450981, 0, 1,
-1.345413, 0.1204403, -1.56589, 1, 0.5529412, 0, 1,
-1.343276, 0.04400637, -2.679651, 1, 0.5568628, 0, 1,
-1.340946, 0.8616226, -1.425203, 1, 0.5647059, 0, 1,
-1.331652, 0.9110562, 0.2270024, 1, 0.5686275, 0, 1,
-1.330597, 0.2794988, -2.314757, 1, 0.5764706, 0, 1,
-1.322414, 0.08116452, 0.1044487, 1, 0.5803922, 0, 1,
-1.3184, -0.2393241, -1.366308, 1, 0.5882353, 0, 1,
-1.317055, -2.5328, -1.069392, 1, 0.5921569, 0, 1,
-1.307838, -0.8702415, -0.8511834, 1, 0.6, 0, 1,
-1.282353, -0.3416411, -0.8850791, 1, 0.6078432, 0, 1,
-1.279688, 0.1211346, -1.618902, 1, 0.6117647, 0, 1,
-1.274015, -0.8044329, -3.408376, 1, 0.6196079, 0, 1,
-1.269875, -1.155976, -2.56592, 1, 0.6235294, 0, 1,
-1.268909, 1.134007, 0.3211793, 1, 0.6313726, 0, 1,
-1.266192, -0.6128455, -0.9909258, 1, 0.6352941, 0, 1,
-1.263861, -1.651126, -1.405816, 1, 0.6431373, 0, 1,
-1.254854, -1.961868, -1.876271, 1, 0.6470588, 0, 1,
-1.238134, 0.2952325, -1.153425, 1, 0.654902, 0, 1,
-1.23696, -1.010314, -3.74299, 1, 0.6588235, 0, 1,
-1.226842, 0.2828366, -1.663015, 1, 0.6666667, 0, 1,
-1.225889, 0.5459196, -0.4909822, 1, 0.6705883, 0, 1,
-1.221128, 1.022207, -2.039701, 1, 0.6784314, 0, 1,
-1.220374, 1.149287, -1.448719, 1, 0.682353, 0, 1,
-1.211903, -0.1825951, -1.303931, 1, 0.6901961, 0, 1,
-1.207946, -0.7930934, -2.41308, 1, 0.6941177, 0, 1,
-1.202299, 1.496586, 0.3018869, 1, 0.7019608, 0, 1,
-1.19647, -0.9161673, -1.877529, 1, 0.7098039, 0, 1,
-1.179578, 1.627282, 0.6348791, 1, 0.7137255, 0, 1,
-1.172052, 1.504954, -0.6331778, 1, 0.7215686, 0, 1,
-1.167208, -2.349501, -2.562666, 1, 0.7254902, 0, 1,
-1.163989, -0.6640984, -2.891197, 1, 0.7333333, 0, 1,
-1.15529, -0.1907423, -1.683704, 1, 0.7372549, 0, 1,
-1.147027, -0.3869395, -2.641117, 1, 0.7450981, 0, 1,
-1.140585, 0.634304, -1.043989, 1, 0.7490196, 0, 1,
-1.138604, -0.3543711, -1.404543, 1, 0.7568628, 0, 1,
-1.132174, -0.3231102, -2.032446, 1, 0.7607843, 0, 1,
-1.127892, 0.3781522, -1.37498, 1, 0.7686275, 0, 1,
-1.125474, 0.6139168, 1.795795, 1, 0.772549, 0, 1,
-1.11268, -0.6179627, -0.8286132, 1, 0.7803922, 0, 1,
-1.098107, 1.089283, -0.6933274, 1, 0.7843137, 0, 1,
-1.097799, -1.160285, -1.55387, 1, 0.7921569, 0, 1,
-1.096487, 0.1095453, 0.09969793, 1, 0.7960784, 0, 1,
-1.084944, 1.080641, -0.7112724, 1, 0.8039216, 0, 1,
-1.083439, 0.764309, -1.202467, 1, 0.8117647, 0, 1,
-1.073759, -1.635511, -3.752199, 1, 0.8156863, 0, 1,
-1.071801, 0.3907466, -2.020039, 1, 0.8235294, 0, 1,
-1.066778, -0.6459672, -2.116873, 1, 0.827451, 0, 1,
-1.06461, -1.077882, -1.925281, 1, 0.8352941, 0, 1,
-1.062465, -1.105443, -3.267622, 1, 0.8392157, 0, 1,
-1.058602, 0.5186612, -1.893347, 1, 0.8470588, 0, 1,
-1.057965, -0.4237226, -1.285106, 1, 0.8509804, 0, 1,
-1.043583, 1.793468, -0.8744522, 1, 0.8588235, 0, 1,
-1.042871, -1.869221, -2.762357, 1, 0.8627451, 0, 1,
-1.038194, 1.351047, -0.8805976, 1, 0.8705882, 0, 1,
-1.03607, -1.772667, -3.396749, 1, 0.8745098, 0, 1,
-1.035183, 1.5497, 1.883471, 1, 0.8823529, 0, 1,
-1.031892, -1.203468, -2.579923, 1, 0.8862745, 0, 1,
-1.029521, 0.734044, -0.7010872, 1, 0.8941177, 0, 1,
-1.025355, -1.525434, -3.279507, 1, 0.8980392, 0, 1,
-1.02207, 1.383855, -2.28299, 1, 0.9058824, 0, 1,
-1.012862, 1.369267, -0.009799809, 1, 0.9137255, 0, 1,
-1.001706, 0.7126248, -1.949973, 1, 0.9176471, 0, 1,
-0.9971358, -1.382828, -2.405584, 1, 0.9254902, 0, 1,
-0.9954199, 0.3035501, -2.042201, 1, 0.9294118, 0, 1,
-0.9929893, 0.737178, -0.7241017, 1, 0.9372549, 0, 1,
-0.98966, -2.153146, -2.982683, 1, 0.9411765, 0, 1,
-0.9818681, 0.7832725, -0.04979001, 1, 0.9490196, 0, 1,
-0.9781745, -1.061358, -3.23694, 1, 0.9529412, 0, 1,
-0.9745854, -0.07318456, -0.2835093, 1, 0.9607843, 0, 1,
-0.9736446, 0.2560301, -0.525014, 1, 0.9647059, 0, 1,
-0.9621785, -1.31869, -2.795566, 1, 0.972549, 0, 1,
-0.9515506, 0.2091901, -1.539412, 1, 0.9764706, 0, 1,
-0.9436898, 0.9916218, -1.362371, 1, 0.9843137, 0, 1,
-0.9418864, -1.393339, -2.045126, 1, 0.9882353, 0, 1,
-0.9244024, 1.029734, -1.474678, 1, 0.9960784, 0, 1,
-0.9238498, 0.4422403, -0.08265916, 0.9960784, 1, 0, 1,
-0.9231553, 0.6486053, -2.115032, 0.9921569, 1, 0, 1,
-0.9155906, 0.2109623, -1.006877, 0.9843137, 1, 0, 1,
-0.9100931, -1.945149, -1.655436, 0.9803922, 1, 0, 1,
-0.905166, -0.9491775, -3.097336, 0.972549, 1, 0, 1,
-0.9037194, 0.06391149, -0.1576122, 0.9686275, 1, 0, 1,
-0.899804, 0.3560553, -1.308214, 0.9607843, 1, 0, 1,
-0.8981053, -0.4273848, -1.985482, 0.9568627, 1, 0, 1,
-0.8970889, -0.1620171, -2.299001, 0.9490196, 1, 0, 1,
-0.8923498, 0.02093572, -1.963919, 0.945098, 1, 0, 1,
-0.8906084, 0.7659844, -0.8894824, 0.9372549, 1, 0, 1,
-0.886726, -0.1232638, -1.067103, 0.9333333, 1, 0, 1,
-0.8776095, 1.252598, -0.9700308, 0.9254902, 1, 0, 1,
-0.8765637, -1.006699, -1.18794, 0.9215686, 1, 0, 1,
-0.8752024, 0.573817, 0.7827883, 0.9137255, 1, 0, 1,
-0.8701874, 0.334254, -0.9253132, 0.9098039, 1, 0, 1,
-0.8682726, -0.0659565, -2.978065, 0.9019608, 1, 0, 1,
-0.8625733, 0.2557381, -1.442138, 0.8941177, 1, 0, 1,
-0.8566672, -0.4167916, -2.120941, 0.8901961, 1, 0, 1,
-0.8547068, -0.1920085, -1.852796, 0.8823529, 1, 0, 1,
-0.8464753, -1.661405, -4.266114, 0.8784314, 1, 0, 1,
-0.8385329, -1.743432, -1.853248, 0.8705882, 1, 0, 1,
-0.8381772, 1.973264, 0.4797731, 0.8666667, 1, 0, 1,
-0.8345855, 1.202565, -2.125421, 0.8588235, 1, 0, 1,
-0.8324758, -1.860195, -3.165844, 0.854902, 1, 0, 1,
-0.8307856, 1.279739, -0.9113688, 0.8470588, 1, 0, 1,
-0.8205435, -0.6073339, -0.9908651, 0.8431373, 1, 0, 1,
-0.8105019, 0.8716673, -0.1999792, 0.8352941, 1, 0, 1,
-0.807061, -1.022681, -2.392291, 0.8313726, 1, 0, 1,
-0.8062682, -1.280385, -1.717335, 0.8235294, 1, 0, 1,
-0.8014718, -2.020519, -1.25869, 0.8196079, 1, 0, 1,
-0.7993899, 1.722725, -0.9028451, 0.8117647, 1, 0, 1,
-0.7933941, -0.5973573, -5.085369, 0.8078431, 1, 0, 1,
-0.7912293, -0.01960514, -0.30255, 0.8, 1, 0, 1,
-0.7889155, -0.683287, -1.560433, 0.7921569, 1, 0, 1,
-0.7849386, -0.7802391, -3.437634, 0.7882353, 1, 0, 1,
-0.7826888, -0.1359575, 0.07424618, 0.7803922, 1, 0, 1,
-0.7798474, -0.8511031, -2.629919, 0.7764706, 1, 0, 1,
-0.7790245, -0.1920218, -1.843878, 0.7686275, 1, 0, 1,
-0.7748498, 0.4332685, -2.058755, 0.7647059, 1, 0, 1,
-0.7734762, -1.144467, -3.200176, 0.7568628, 1, 0, 1,
-0.7715694, -0.5128844, -2.033734, 0.7529412, 1, 0, 1,
-0.7675428, 0.1021325, -2.605108, 0.7450981, 1, 0, 1,
-0.764861, -0.5944871, -2.667658, 0.7411765, 1, 0, 1,
-0.7642447, 1.214702, -1.819787, 0.7333333, 1, 0, 1,
-0.7634627, -0.4132321, -2.406912, 0.7294118, 1, 0, 1,
-0.7601092, -1.493602, -1.16385, 0.7215686, 1, 0, 1,
-0.7551209, 0.7546014, -0.9637659, 0.7176471, 1, 0, 1,
-0.7502184, 0.6860494, -0.3875357, 0.7098039, 1, 0, 1,
-0.7482598, -0.3583702, -3.400703, 0.7058824, 1, 0, 1,
-0.7479886, -0.9273914, -3.060529, 0.6980392, 1, 0, 1,
-0.7424883, 0.7538393, 0.04985926, 0.6901961, 1, 0, 1,
-0.7416013, 2.749948, -0.5673501, 0.6862745, 1, 0, 1,
-0.7404499, 1.627864, -0.328151, 0.6784314, 1, 0, 1,
-0.7385438, -0.8156287, -1.387491, 0.6745098, 1, 0, 1,
-0.7335566, -0.5584702, -2.684641, 0.6666667, 1, 0, 1,
-0.7309572, -1.062885, -1.651356, 0.6627451, 1, 0, 1,
-0.7290229, -0.335667, -1.050661, 0.654902, 1, 0, 1,
-0.7264524, -0.08782997, -2.287259, 0.6509804, 1, 0, 1,
-0.7260791, -0.629099, -3.422335, 0.6431373, 1, 0, 1,
-0.7242373, -0.2571023, -1.264558, 0.6392157, 1, 0, 1,
-0.7214461, -1.527887, -4.083267, 0.6313726, 1, 0, 1,
-0.7202224, 0.4741289, -1.172317, 0.627451, 1, 0, 1,
-0.7179368, 0.04188875, -1.587228, 0.6196079, 1, 0, 1,
-0.7055272, 0.6463509, 0.3264804, 0.6156863, 1, 0, 1,
-0.6949385, 1.083091, 0.5206985, 0.6078432, 1, 0, 1,
-0.6919484, -0.04452274, -0.6747991, 0.6039216, 1, 0, 1,
-0.6867859, -1.665363, -2.813685, 0.5960785, 1, 0, 1,
-0.6809292, -0.3505206, -3.396681, 0.5882353, 1, 0, 1,
-0.6790715, -0.4228575, -1.849668, 0.5843138, 1, 0, 1,
-0.6752216, 0.09974819, -0.4889365, 0.5764706, 1, 0, 1,
-0.6695645, 1.651746, -1.427951, 0.572549, 1, 0, 1,
-0.6645345, 0.1647184, 0.2653261, 0.5647059, 1, 0, 1,
-0.6590781, -1.497943, -2.708198, 0.5607843, 1, 0, 1,
-0.6572455, -0.5332962, -1.909621, 0.5529412, 1, 0, 1,
-0.657077, 0.8865567, -0.9620752, 0.5490196, 1, 0, 1,
-0.6552839, 0.6657296, 1.274894, 0.5411765, 1, 0, 1,
-0.6520112, -1.335654, -2.704851, 0.5372549, 1, 0, 1,
-0.6486989, 0.2885746, 0.4256423, 0.5294118, 1, 0, 1,
-0.6483369, 1.380514, -0.9555148, 0.5254902, 1, 0, 1,
-0.6476505, -0.8495976, -2.118233, 0.5176471, 1, 0, 1,
-0.6451322, 0.9603001, -1.615799, 0.5137255, 1, 0, 1,
-0.6373103, 0.1073536, 0.0597474, 0.5058824, 1, 0, 1,
-0.6361268, -0.1884756, 0.001745356, 0.5019608, 1, 0, 1,
-0.6336614, -0.2740266, -4.78132, 0.4941176, 1, 0, 1,
-0.6332413, 0.9496362, 0.8710999, 0.4862745, 1, 0, 1,
-0.6299455, -0.2934317, -2.011836, 0.4823529, 1, 0, 1,
-0.6265712, -0.08441774, -1.653358, 0.4745098, 1, 0, 1,
-0.6253081, -1.073124, -1.008285, 0.4705882, 1, 0, 1,
-0.6251392, -1.585204, -1.242997, 0.4627451, 1, 0, 1,
-0.6249539, -1.443521, -1.277357, 0.4588235, 1, 0, 1,
-0.6221864, 0.2344505, -0.4178543, 0.4509804, 1, 0, 1,
-0.6212861, 0.5477516, -1.949331, 0.4470588, 1, 0, 1,
-0.6163424, -1.081267, -1.996103, 0.4392157, 1, 0, 1,
-0.6160864, -0.2170645, -1.451746, 0.4352941, 1, 0, 1,
-0.6128621, -1.096376, -0.9622834, 0.427451, 1, 0, 1,
-0.6127738, -0.7163553, -2.594284, 0.4235294, 1, 0, 1,
-0.6125988, -0.128817, -1.076398, 0.4156863, 1, 0, 1,
-0.610792, -0.3694851, -1.683883, 0.4117647, 1, 0, 1,
-0.6053488, -0.1564541, -1.522646, 0.4039216, 1, 0, 1,
-0.6050049, -1.072263, -5.283778, 0.3960784, 1, 0, 1,
-0.6042107, -0.1307802, -2.165158, 0.3921569, 1, 0, 1,
-0.6038682, -0.3917369, -1.640885, 0.3843137, 1, 0, 1,
-0.5979086, -1.314359, -4.0563, 0.3803922, 1, 0, 1,
-0.5967737, 0.3395976, -0.9096426, 0.372549, 1, 0, 1,
-0.5944104, 0.5360734, -1.190606, 0.3686275, 1, 0, 1,
-0.591677, 0.8307869, -1.895717, 0.3607843, 1, 0, 1,
-0.5893346, 0.6233133, -1.500922, 0.3568628, 1, 0, 1,
-0.587555, 0.08412999, -1.424827, 0.3490196, 1, 0, 1,
-0.5852316, 0.4231001, 0.0999931, 0.345098, 1, 0, 1,
-0.5849285, -0.7320656, -2.380988, 0.3372549, 1, 0, 1,
-0.5802661, 0.6877562, 1.192084, 0.3333333, 1, 0, 1,
-0.5799884, -0.002572082, -0.7807808, 0.3254902, 1, 0, 1,
-0.5740877, 0.001208898, -1.913226, 0.3215686, 1, 0, 1,
-0.5661055, -0.3590503, -2.185074, 0.3137255, 1, 0, 1,
-0.5659022, 2.013361, -1.233388, 0.3098039, 1, 0, 1,
-0.5588312, -0.4461843, -2.249975, 0.3019608, 1, 0, 1,
-0.5492851, 1.474651, -0.4925211, 0.2941177, 1, 0, 1,
-0.5483326, 0.4098371, 0.7302204, 0.2901961, 1, 0, 1,
-0.5445954, -1.569123, -1.348884, 0.282353, 1, 0, 1,
-0.541992, 0.5314428, -0.2555226, 0.2784314, 1, 0, 1,
-0.5413415, -0.1641142, -1.910487, 0.2705882, 1, 0, 1,
-0.538399, -0.7388653, -4.424819, 0.2666667, 1, 0, 1,
-0.5383659, 1.161259, -0.6947138, 0.2588235, 1, 0, 1,
-0.5370128, 0.8351113, -1.077856, 0.254902, 1, 0, 1,
-0.5362425, -0.07519756, -1.374763, 0.2470588, 1, 0, 1,
-0.5335242, -1.574301, -2.72321, 0.2431373, 1, 0, 1,
-0.5252159, -1.18169, -3.544584, 0.2352941, 1, 0, 1,
-0.523695, -0.7316152, -2.60725, 0.2313726, 1, 0, 1,
-0.5213314, 0.336287, -0.8620057, 0.2235294, 1, 0, 1,
-0.5103046, 0.1595739, -1.496744, 0.2196078, 1, 0, 1,
-0.5010663, 0.09965948, -0.7411905, 0.2117647, 1, 0, 1,
-0.4953574, -1.152143, -3.944158, 0.2078431, 1, 0, 1,
-0.4889111, -0.706266, -2.094268, 0.2, 1, 0, 1,
-0.4886084, 0.6230074, -0.8417885, 0.1921569, 1, 0, 1,
-0.4871559, 1.47685, -0.582958, 0.1882353, 1, 0, 1,
-0.4820585, 0.6633915, -1.011816, 0.1803922, 1, 0, 1,
-0.4778708, 0.9208791, -0.05339853, 0.1764706, 1, 0, 1,
-0.4773483, -0.008557487, -2.833453, 0.1686275, 1, 0, 1,
-0.47596, 0.1587354, -0.7119825, 0.1647059, 1, 0, 1,
-0.4754631, 1.637663, -1.248337, 0.1568628, 1, 0, 1,
-0.4746821, -0.6671073, -3.184278, 0.1529412, 1, 0, 1,
-0.4736822, -1.708387, -3.73847, 0.145098, 1, 0, 1,
-0.4730933, 0.8473035, -0.4967614, 0.1411765, 1, 0, 1,
-0.4704202, -0.2704644, -0.8479898, 0.1333333, 1, 0, 1,
-0.4691618, -0.3641411, 0.1608125, 0.1294118, 1, 0, 1,
-0.4662595, -0.2316354, -1.823592, 0.1215686, 1, 0, 1,
-0.4650268, -0.5214285, -1.782296, 0.1176471, 1, 0, 1,
-0.464267, -0.9820002, -4.059493, 0.1098039, 1, 0, 1,
-0.4568126, 0.7525912, 0.2451023, 0.1058824, 1, 0, 1,
-0.4536158, 0.4002096, 1.479302, 0.09803922, 1, 0, 1,
-0.4481452, 0.6242511, -3.093393, 0.09019608, 1, 0, 1,
-0.4440695, -1.476822, -2.003404, 0.08627451, 1, 0, 1,
-0.4437965, 0.134628, -2.515952, 0.07843138, 1, 0, 1,
-0.442771, 0.4054787, -2.210968, 0.07450981, 1, 0, 1,
-0.4427107, 0.01914059, -1.779606, 0.06666667, 1, 0, 1,
-0.4425933, -0.9594722, -0.718179, 0.0627451, 1, 0, 1,
-0.4421877, -0.6101184, -2.117447, 0.05490196, 1, 0, 1,
-0.4416196, 0.1902216, -1.714049, 0.05098039, 1, 0, 1,
-0.4412884, 1.116371, 1.208839, 0.04313726, 1, 0, 1,
-0.439633, -0.2932858, -1.632842, 0.03921569, 1, 0, 1,
-0.4384884, -0.1957006, -4.329873, 0.03137255, 1, 0, 1,
-0.4294554, -0.1284325, -1.748844, 0.02745098, 1, 0, 1,
-0.4288563, 1.119081, 0.1650477, 0.01960784, 1, 0, 1,
-0.427871, 0.8556703, -0.4598973, 0.01568628, 1, 0, 1,
-0.4273785, 0.4887662, 0.7765691, 0.007843138, 1, 0, 1,
-0.4225331, 0.9709695, -1.822991, 0.003921569, 1, 0, 1,
-0.4197937, -0.1217789, -1.519545, 0, 1, 0.003921569, 1,
-0.4150968, -1.458961, -1.878639, 0, 1, 0.01176471, 1,
-0.4145699, 0.3563374, -0.6939918, 0, 1, 0.01568628, 1,
-0.4120103, -1.54792, -2.830872, 0, 1, 0.02352941, 1,
-0.4098078, 0.9285555, -0.1976408, 0, 1, 0.02745098, 1,
-0.4065986, -0.1617724, -2.28839, 0, 1, 0.03529412, 1,
-0.4048242, 1.371068, 0.3823497, 0, 1, 0.03921569, 1,
-0.4037111, -1.490569, -4.253447, 0, 1, 0.04705882, 1,
-0.4016847, -0.7791399, -2.116286, 0, 1, 0.05098039, 1,
-0.4016832, 0.4885336, -0.6266692, 0, 1, 0.05882353, 1,
-0.3921496, 0.4426611, -1.694603, 0, 1, 0.0627451, 1,
-0.3891726, -0.9172569, -3.221081, 0, 1, 0.07058824, 1,
-0.3872555, 0.4467205, -1.315415, 0, 1, 0.07450981, 1,
-0.387221, -0.3227153, -2.511151, 0, 1, 0.08235294, 1,
-0.3868836, -0.9750922, -3.28845, 0, 1, 0.08627451, 1,
-0.3837838, 0.681986, 0.539336, 0, 1, 0.09411765, 1,
-0.3832802, -1.548561, -2.907344, 0, 1, 0.1019608, 1,
-0.3758133, -1.282203, -3.90363, 0, 1, 0.1058824, 1,
-0.3729805, -2.489243, -4.030457, 0, 1, 0.1137255, 1,
-0.369998, -0.04447718, -2.283979, 0, 1, 0.1176471, 1,
-0.3660409, -0.8050756, -2.892869, 0, 1, 0.1254902, 1,
-0.3642076, -1.670192, -2.215953, 0, 1, 0.1294118, 1,
-0.3612269, -0.4771941, -3.261501, 0, 1, 0.1372549, 1,
-0.3603061, -0.7182156, -3.604797, 0, 1, 0.1411765, 1,
-0.3602769, -0.2887691, -1.493498, 0, 1, 0.1490196, 1,
-0.3577105, -0.6250297, -3.539158, 0, 1, 0.1529412, 1,
-0.3559271, 2.028373, 0.3225132, 0, 1, 0.1607843, 1,
-0.3552341, 0.4280638, -1.227759, 0, 1, 0.1647059, 1,
-0.3549475, -0.3687721, -3.123221, 0, 1, 0.172549, 1,
-0.3517284, 0.3048701, 0.8911664, 0, 1, 0.1764706, 1,
-0.3470633, 0.2848839, -2.432258, 0, 1, 0.1843137, 1,
-0.3456009, 0.01091282, -0.1772249, 0, 1, 0.1882353, 1,
-0.3439191, 1.801194, -0.5663807, 0, 1, 0.1960784, 1,
-0.3431097, 0.2616336, -1.350802, 0, 1, 0.2039216, 1,
-0.3430582, 0.4052643, -0.7208663, 0, 1, 0.2078431, 1,
-0.3364837, -0.8501385, -2.792439, 0, 1, 0.2156863, 1,
-0.3296121, 0.2255829, -1.5217, 0, 1, 0.2196078, 1,
-0.3289111, -0.06329527, 0.3766382, 0, 1, 0.227451, 1,
-0.3258107, 0.7043668, -2.154823, 0, 1, 0.2313726, 1,
-0.3225521, 0.2171973, 0.3716665, 0, 1, 0.2392157, 1,
-0.3194075, -0.5288697, -1.439445, 0, 1, 0.2431373, 1,
-0.3146265, -0.4691508, -2.934273, 0, 1, 0.2509804, 1,
-0.3133586, -0.8143708, -3.50874, 0, 1, 0.254902, 1,
-0.3131622, -0.2053565, -2.911605, 0, 1, 0.2627451, 1,
-0.3061999, -0.9028704, -3.126462, 0, 1, 0.2666667, 1,
-0.29862, 0.9803135, -0.4560729, 0, 1, 0.2745098, 1,
-0.2967379, -0.3943273, -3.687757, 0, 1, 0.2784314, 1,
-0.2898548, 0.391314, -1.311231, 0, 1, 0.2862745, 1,
-0.2897783, 0.6974535, 0.5669836, 0, 1, 0.2901961, 1,
-0.2877427, 0.01231716, -2.652216, 0, 1, 0.2980392, 1,
-0.2875096, 1.280334, 0.1676617, 0, 1, 0.3058824, 1,
-0.2859817, 1.355476, -1.690953, 0, 1, 0.3098039, 1,
-0.2795088, -0.2344828, -1.891404, 0, 1, 0.3176471, 1,
-0.2791669, -1.301549, -2.197815, 0, 1, 0.3215686, 1,
-0.2763459, 1.486319, 0.2331852, 0, 1, 0.3294118, 1,
-0.2751521, 0.6892744, 0.5106862, 0, 1, 0.3333333, 1,
-0.2740122, 1.106848, 0.1293172, 0, 1, 0.3411765, 1,
-0.273609, 0.5597311, -1.083499, 0, 1, 0.345098, 1,
-0.2721472, 0.592645, -0.4947439, 0, 1, 0.3529412, 1,
-0.270691, 0.8853024, 0.6826587, 0, 1, 0.3568628, 1,
-0.2699822, -0.191943, -2.774478, 0, 1, 0.3647059, 1,
-0.2699648, 0.5879549, -0.02948027, 0, 1, 0.3686275, 1,
-0.268788, 0.4285611, -1.313457, 0, 1, 0.3764706, 1,
-0.2661672, -1.34803, -1.847215, 0, 1, 0.3803922, 1,
-0.2649145, -1.09939, -2.178891, 0, 1, 0.3882353, 1,
-0.2629714, 0.9759171, 1.510118, 0, 1, 0.3921569, 1,
-0.262026, 2.278605, -0.1046459, 0, 1, 0.4, 1,
-0.2552162, 0.8847992, -0.2508886, 0, 1, 0.4078431, 1,
-0.2545348, -0.7298617, -1.306378, 0, 1, 0.4117647, 1,
-0.2461819, 1.11235, -0.2821676, 0, 1, 0.4196078, 1,
-0.2461081, -1.311499, -3.716453, 0, 1, 0.4235294, 1,
-0.2415731, -0.6512071, -0.4999025, 0, 1, 0.4313726, 1,
-0.237333, 1.02026, -1.0932, 0, 1, 0.4352941, 1,
-0.2341294, 1.252484, -0.3082477, 0, 1, 0.4431373, 1,
-0.2245967, -0.2656298, -3.54658, 0, 1, 0.4470588, 1,
-0.2244853, -0.9375499, -2.850109, 0, 1, 0.454902, 1,
-0.2240379, 0.7913511, -1.202558, 0, 1, 0.4588235, 1,
-0.2220073, -1.472243, -1.768148, 0, 1, 0.4666667, 1,
-0.2198355, 2.505952, -0.0712835, 0, 1, 0.4705882, 1,
-0.2183141, 0.3152898, 1.272027, 0, 1, 0.4784314, 1,
-0.2105756, 0.8634854, 1.27448, 0, 1, 0.4823529, 1,
-0.2104304, -2.291004, 0.3955434, 0, 1, 0.4901961, 1,
-0.2052707, 1.713831, 1.129776, 0, 1, 0.4941176, 1,
-0.2011664, 1.133847, 0.8058055, 0, 1, 0.5019608, 1,
-0.1947144, 0.669504, -0.5798394, 0, 1, 0.509804, 1,
-0.1883084, 0.2735423, -1.837177, 0, 1, 0.5137255, 1,
-0.1879135, 0.665174, -2.436119, 0, 1, 0.5215687, 1,
-0.1830414, 0.03756131, -0.4457646, 0, 1, 0.5254902, 1,
-0.1825507, -1.27095, -1.920524, 0, 1, 0.5333334, 1,
-0.1812059, 0.7251207, 1.424975, 0, 1, 0.5372549, 1,
-0.177853, -1.385266, -3.32519, 0, 1, 0.5450981, 1,
-0.173512, 2.502226, -1.594833, 0, 1, 0.5490196, 1,
-0.1728138, -2.026031, -3.040746, 0, 1, 0.5568628, 1,
-0.1689302, 1.674096, -0.4283094, 0, 1, 0.5607843, 1,
-0.1668492, -0.7631317, -3.250451, 0, 1, 0.5686275, 1,
-0.166395, 1.105934, 0.4177276, 0, 1, 0.572549, 1,
-0.1618151, -2.510242, -4.289099, 0, 1, 0.5803922, 1,
-0.1569684, -1.19464, -1.590907, 0, 1, 0.5843138, 1,
-0.1551875, 0.5537851, -0.2712279, 0, 1, 0.5921569, 1,
-0.1548006, 0.6150262, 0.8782622, 0, 1, 0.5960785, 1,
-0.153246, 1.506828, 0.8492786, 0, 1, 0.6039216, 1,
-0.1518916, -0.5547751, -2.608781, 0, 1, 0.6117647, 1,
-0.1514261, -0.1441442, -3.530024, 0, 1, 0.6156863, 1,
-0.1510106, 0.2229044, -0.4390588, 0, 1, 0.6235294, 1,
-0.1432977, 0.04810604, -2.535656, 0, 1, 0.627451, 1,
-0.141377, 0.7660833, 1.731532, 0, 1, 0.6352941, 1,
-0.141206, -0.8399569, -2.870423, 0, 1, 0.6392157, 1,
-0.1350569, -1.207152, -3.781757, 0, 1, 0.6470588, 1,
-0.1312352, 0.06361257, -0.57774, 0, 1, 0.6509804, 1,
-0.127515, -0.5805622, -2.259231, 0, 1, 0.6588235, 1,
-0.1270336, -0.6601272, -3.018188, 0, 1, 0.6627451, 1,
-0.1252663, 0.3693399, -1.671751, 0, 1, 0.6705883, 1,
-0.1241964, 0.7749284, -1.800179, 0, 1, 0.6745098, 1,
-0.1207398, -0.3626312, -1.27823, 0, 1, 0.682353, 1,
-0.1200529, 0.5779309, -1.019904, 0, 1, 0.6862745, 1,
-0.1140575, -0.7457693, -2.493598, 0, 1, 0.6941177, 1,
-0.1138218, 2.63347, -0.1508169, 0, 1, 0.7019608, 1,
-0.105725, -0.2166816, -1.722528, 0, 1, 0.7058824, 1,
-0.1028019, -1.178361, -3.178533, 0, 1, 0.7137255, 1,
-0.1009031, -0.713451, -2.813563, 0, 1, 0.7176471, 1,
-0.1005821, 1.331426, -0.1876747, 0, 1, 0.7254902, 1,
-0.09999825, -0.5170839, -2.9098, 0, 1, 0.7294118, 1,
-0.09558148, -0.9753909, -2.424018, 0, 1, 0.7372549, 1,
-0.09451673, -0.1585203, -2.636657, 0, 1, 0.7411765, 1,
-0.09285364, 0.06724828, -0.465896, 0, 1, 0.7490196, 1,
-0.09221742, 0.8407273, -0.8541471, 0, 1, 0.7529412, 1,
-0.0917119, -1.135617, -4.158765, 0, 1, 0.7607843, 1,
-0.08886623, -0.5139754, -2.318164, 0, 1, 0.7647059, 1,
-0.08746134, -2.083054, -3.053055, 0, 1, 0.772549, 1,
-0.08727197, 0.5708414, 1.240685, 0, 1, 0.7764706, 1,
-0.08585716, -0.4405206, -3.987885, 0, 1, 0.7843137, 1,
-0.08198803, -0.1128, -1.94361, 0, 1, 0.7882353, 1,
-0.08136754, -1.616686, -2.840409, 0, 1, 0.7960784, 1,
-0.07492027, -0.8660407, -2.654016, 0, 1, 0.8039216, 1,
-0.07029682, 1.294817, -1.130055, 0, 1, 0.8078431, 1,
-0.07000956, -0.6075857, -3.319407, 0, 1, 0.8156863, 1,
-0.06790803, -1.224081, -1.962132, 0, 1, 0.8196079, 1,
-0.06754489, 1.626666, -0.1849532, 0, 1, 0.827451, 1,
-0.06628046, -0.3549477, -4.497066, 0, 1, 0.8313726, 1,
-0.06036391, 0.4840457, -1.495658, 0, 1, 0.8392157, 1,
-0.05853133, 0.2274143, 0.2162502, 0, 1, 0.8431373, 1,
-0.05751221, 0.9301096, -1.443141, 0, 1, 0.8509804, 1,
-0.05183467, 0.6431575, -2.77491, 0, 1, 0.854902, 1,
-0.04787567, 1.106965, -0.7018961, 0, 1, 0.8627451, 1,
-0.04495481, 0.4809311, -1.249693, 0, 1, 0.8666667, 1,
-0.03872702, -1.155523, -3.41084, 0, 1, 0.8745098, 1,
-0.03719442, 0.2472624, 2.045474, 0, 1, 0.8784314, 1,
-0.0343066, -1.635328, -3.946889, 0, 1, 0.8862745, 1,
-0.03415492, 0.4728075, 0.07174013, 0, 1, 0.8901961, 1,
-0.03279709, -1.545764, -4.82337, 0, 1, 0.8980392, 1,
-0.03162995, 0.9620827, 0.01108973, 0, 1, 0.9058824, 1,
-0.03109774, 1.431705, -1.003221, 0, 1, 0.9098039, 1,
-0.0263223, -0.5120527, -2.302904, 0, 1, 0.9176471, 1,
-0.02425524, -0.3568479, -2.258391, 0, 1, 0.9215686, 1,
-0.02002534, -0.7703933, -2.98636, 0, 1, 0.9294118, 1,
-0.01969587, -1.019865, -3.972168, 0, 1, 0.9333333, 1,
-0.008133594, -2.116635, -2.470404, 0, 1, 0.9411765, 1,
-0.007724458, -1.400644, -2.51162, 0, 1, 0.945098, 1,
-0.005429815, -0.5286332, -0.8494941, 0, 1, 0.9529412, 1,
-0.00148539, -0.05208109, -2.462281, 0, 1, 0.9568627, 1,
0.0003111134, -0.2638474, 2.835203, 0, 1, 0.9647059, 1,
0.004632366, -0.8779153, 5.282822, 0, 1, 0.9686275, 1,
0.006991265, -1.802988, 2.673211, 0, 1, 0.9764706, 1,
0.007074068, 1.687268, -1.086691, 0, 1, 0.9803922, 1,
0.01255221, -0.4699673, 1.203153, 0, 1, 0.9882353, 1,
0.01530228, 1.049507, -0.4010243, 0, 1, 0.9921569, 1,
0.01777448, 1.332591, 0.3638467, 0, 1, 1, 1,
0.02034524, 0.2835068, -0.9282773, 0, 0.9921569, 1, 1,
0.02059253, -0.3426391, 3.56092, 0, 0.9882353, 1, 1,
0.02199288, -0.4030486, 2.525094, 0, 0.9803922, 1, 1,
0.02303354, -1.983944, 4.825636, 0, 0.9764706, 1, 1,
0.02419128, 0.06617168, 1.437214, 0, 0.9686275, 1, 1,
0.02632569, -1.614995, 4.053829, 0, 0.9647059, 1, 1,
0.02646416, -0.779521, 3.151529, 0, 0.9568627, 1, 1,
0.0279313, -1.232027, 3.906065, 0, 0.9529412, 1, 1,
0.02959024, 1.652915, -0.9855118, 0, 0.945098, 1, 1,
0.03176911, -0.5890967, 2.971978, 0, 0.9411765, 1, 1,
0.03277336, -0.8678568, 3.24175, 0, 0.9333333, 1, 1,
0.03320161, -1.264401, 3.660616, 0, 0.9294118, 1, 1,
0.03771139, -0.2926718, 2.813506, 0, 0.9215686, 1, 1,
0.04022017, -0.1244105, 2.607675, 0, 0.9176471, 1, 1,
0.04178458, -0.7182629, 2.574138, 0, 0.9098039, 1, 1,
0.04346775, 0.6830006, -0.5580366, 0, 0.9058824, 1, 1,
0.04406559, -0.611904, 3.504218, 0, 0.8980392, 1, 1,
0.04644633, -0.9117841, 2.687903, 0, 0.8901961, 1, 1,
0.05090947, -0.6395802, 2.302432, 0, 0.8862745, 1, 1,
0.051027, -0.04566589, 2.510691, 0, 0.8784314, 1, 1,
0.05126708, 0.040673, 1.089308, 0, 0.8745098, 1, 1,
0.05243336, -0.5239536, 3.518336, 0, 0.8666667, 1, 1,
0.05322875, -0.1501198, 3.807041, 0, 0.8627451, 1, 1,
0.05413015, 0.237777, 1.139623, 0, 0.854902, 1, 1,
0.05592517, 0.360273, -1.055796, 0, 0.8509804, 1, 1,
0.06321999, -0.7027584, 2.266864, 0, 0.8431373, 1, 1,
0.0639485, -0.2558777, 2.137482, 0, 0.8392157, 1, 1,
0.06466672, -0.04322939, 0.7796819, 0, 0.8313726, 1, 1,
0.06939927, -1.041645, 0.3862172, 0, 0.827451, 1, 1,
0.07595943, -0.3142842, 3.995808, 0, 0.8196079, 1, 1,
0.07921435, 1.051734, -1.709692, 0, 0.8156863, 1, 1,
0.08222438, -0.2066353, 1.103693, 0, 0.8078431, 1, 1,
0.08269843, 0.9209399, 0.05142457, 0, 0.8039216, 1, 1,
0.08271935, 1.153805, -1.950781, 0, 0.7960784, 1, 1,
0.08738931, -1.187693, 5.237569, 0, 0.7882353, 1, 1,
0.08930589, 0.3664268, -0.07893626, 0, 0.7843137, 1, 1,
0.08945439, 1.082011, 1.707788, 0, 0.7764706, 1, 1,
0.08957524, 0.06977679, 1.164772, 0, 0.772549, 1, 1,
0.0910191, 0.6753097, 0.09840374, 0, 0.7647059, 1, 1,
0.09662438, -0.8975109, 2.365252, 0, 0.7607843, 1, 1,
0.096705, 0.2908762, -0.3229249, 0, 0.7529412, 1, 1,
0.0967063, -0.6152389, 1.830063, 0, 0.7490196, 1, 1,
0.0987, -0.3193236, 1.614849, 0, 0.7411765, 1, 1,
0.1051709, 0.1147677, 1.616266, 0, 0.7372549, 1, 1,
0.1110322, -1.877161, 2.826063, 0, 0.7294118, 1, 1,
0.1123959, 0.478667, -0.3158261, 0, 0.7254902, 1, 1,
0.1161652, 0.04756667, 2.178404, 0, 0.7176471, 1, 1,
0.1195902, -0.4328691, 3.855365, 0, 0.7137255, 1, 1,
0.1272198, 0.4107557, 0.6807321, 0, 0.7058824, 1, 1,
0.1279083, 0.5853288, -0.3166371, 0, 0.6980392, 1, 1,
0.1299349, -1.021938, 1.878739, 0, 0.6941177, 1, 1,
0.1299477, 0.2032264, 1.079662, 0, 0.6862745, 1, 1,
0.1308101, 0.1674491, 0.1739765, 0, 0.682353, 1, 1,
0.1309621, -1.387476, 1.41893, 0, 0.6745098, 1, 1,
0.132573, -0.1848359, 2.671086, 0, 0.6705883, 1, 1,
0.1330525, 0.1569232, 2.343488, 0, 0.6627451, 1, 1,
0.1403131, -0.7686684, 3.631524, 0, 0.6588235, 1, 1,
0.1405349, -1.06242, 2.7657, 0, 0.6509804, 1, 1,
0.1421806, 0.5691646, 0.1569299, 0, 0.6470588, 1, 1,
0.1475691, 0.3858963, 1.697323, 0, 0.6392157, 1, 1,
0.1536178, -0.515493, 1.206274, 0, 0.6352941, 1, 1,
0.1561211, 1.486307, -0.9678835, 0, 0.627451, 1, 1,
0.1581237, 1.108228, -1.012858, 0, 0.6235294, 1, 1,
0.1597584, 0.7821078, 1.96472, 0, 0.6156863, 1, 1,
0.1622321, -0.9056856, 1.232721, 0, 0.6117647, 1, 1,
0.1695693, -0.2116359, 3.893847, 0, 0.6039216, 1, 1,
0.1740287, -0.599342, 1.949318, 0, 0.5960785, 1, 1,
0.1741047, 0.1780297, 1.049755, 0, 0.5921569, 1, 1,
0.1756833, -0.2836439, 1.761839, 0, 0.5843138, 1, 1,
0.1762105, -0.185549, 1.02257, 0, 0.5803922, 1, 1,
0.1764634, 0.297823, -0.5215656, 0, 0.572549, 1, 1,
0.1801021, -0.6625773, 3.704565, 0, 0.5686275, 1, 1,
0.18399, -0.1252028, 2.053491, 0, 0.5607843, 1, 1,
0.1841567, 0.1124423, 1.249046, 0, 0.5568628, 1, 1,
0.187336, 1.202123, 1.008185, 0, 0.5490196, 1, 1,
0.1928807, -1.189611, 3.607207, 0, 0.5450981, 1, 1,
0.2010127, 0.9682454, -1.54161, 0, 0.5372549, 1, 1,
0.210673, 1.427018, 1.242617, 0, 0.5333334, 1, 1,
0.2122372, 0.09285705, 1.211779, 0, 0.5254902, 1, 1,
0.2145067, 0.3526559, 0.7888333, 0, 0.5215687, 1, 1,
0.2153945, -2.12969, 3.406112, 0, 0.5137255, 1, 1,
0.2179137, 1.56305, 0.03525624, 0, 0.509804, 1, 1,
0.2208922, 0.1558925, 1.83294, 0, 0.5019608, 1, 1,
0.222757, 1.210369, 1.953445, 0, 0.4941176, 1, 1,
0.2239018, 0.4426711, 0.8806039, 0, 0.4901961, 1, 1,
0.2274816, 0.589902, -0.1767927, 0, 0.4823529, 1, 1,
0.233551, 1.329059, 1.97493, 0, 0.4784314, 1, 1,
0.2345632, 1.135016, -0.3959768, 0, 0.4705882, 1, 1,
0.2430371, 0.03009996, 1.971556, 0, 0.4666667, 1, 1,
0.2442973, 0.01018302, 1.225419, 0, 0.4588235, 1, 1,
0.2472896, -1.748747, 2.393844, 0, 0.454902, 1, 1,
0.2528828, 1.24292, -0.07359236, 0, 0.4470588, 1, 1,
0.2536077, -0.7159653, 2.243217, 0, 0.4431373, 1, 1,
0.2559955, -0.6278077, 1.882383, 0, 0.4352941, 1, 1,
0.2560237, -0.465433, 1.7809, 0, 0.4313726, 1, 1,
0.2575733, 0.2234178, 0.8423374, 0, 0.4235294, 1, 1,
0.2595624, -0.6408112, 2.955738, 0, 0.4196078, 1, 1,
0.2630228, -0.7842612, 2.854008, 0, 0.4117647, 1, 1,
0.266781, -1.067429, 1.99816, 0, 0.4078431, 1, 1,
0.2668384, -1.689257, 3.572222, 0, 0.4, 1, 1,
0.2668614, 2.193793, 1.035046, 0, 0.3921569, 1, 1,
0.2673488, -0.525557, 4.080197, 0, 0.3882353, 1, 1,
0.2704864, -0.3529084, 2.074047, 0, 0.3803922, 1, 1,
0.2756659, -0.3195857, 2.118512, 0, 0.3764706, 1, 1,
0.2764245, -1.320875, 2.337218, 0, 0.3686275, 1, 1,
0.2785815, -1.089428, 2.926975, 0, 0.3647059, 1, 1,
0.2801704, -0.4936484, 1.764164, 0, 0.3568628, 1, 1,
0.2829596, -0.5879807, 0.9845421, 0, 0.3529412, 1, 1,
0.2882563, 0.6324326, 0.726733, 0, 0.345098, 1, 1,
0.2887718, -1.46244, 2.32404, 0, 0.3411765, 1, 1,
0.2896981, 0.8136373, 1.443112, 0, 0.3333333, 1, 1,
0.2923926, -0.7899838, 2.978405, 0, 0.3294118, 1, 1,
0.2967119, -1.130795, 2.885311, 0, 0.3215686, 1, 1,
0.2997819, -0.5526165, 1.144357, 0, 0.3176471, 1, 1,
0.300249, 0.4658977, 0.1613513, 0, 0.3098039, 1, 1,
0.3023494, -0.2998671, 3.17073, 0, 0.3058824, 1, 1,
0.3033519, 0.04940864, -0.7116898, 0, 0.2980392, 1, 1,
0.3100032, 0.5218229, 1.847855, 0, 0.2901961, 1, 1,
0.3104498, 1.480377, -0.3087507, 0, 0.2862745, 1, 1,
0.3179217, 0.7203066, 0.3227331, 0, 0.2784314, 1, 1,
0.3183036, 0.2809425, -0.4453915, 0, 0.2745098, 1, 1,
0.3185142, 0.9359273, 0.023766, 0, 0.2666667, 1, 1,
0.3199475, -1.558593, 2.563518, 0, 0.2627451, 1, 1,
0.3257505, 1.387349, 0.1627179, 0, 0.254902, 1, 1,
0.3288837, 0.8859912, 1.176799, 0, 0.2509804, 1, 1,
0.3347377, -0.5507852, 3.69566, 0, 0.2431373, 1, 1,
0.3378255, 1.884166, 0.1338011, 0, 0.2392157, 1, 1,
0.3415039, -0.08807018, -0.1030288, 0, 0.2313726, 1, 1,
0.3423082, 0.4711907, 0.3395572, 0, 0.227451, 1, 1,
0.3434113, 1.44643, 0.5209626, 0, 0.2196078, 1, 1,
0.3452939, -0.529641, 3.954625, 0, 0.2156863, 1, 1,
0.3460134, 1.792064, -0.02913839, 0, 0.2078431, 1, 1,
0.3477873, -0.4522358, 3.362377, 0, 0.2039216, 1, 1,
0.3502888, -0.2235797, 3.233397, 0, 0.1960784, 1, 1,
0.3580189, -0.5997163, 2.025757, 0, 0.1882353, 1, 1,
0.3605936, -0.5279214, 3.079004, 0, 0.1843137, 1, 1,
0.3638098, 0.5229857, 0.09908255, 0, 0.1764706, 1, 1,
0.3685439, -0.06298378, 0.2527268, 0, 0.172549, 1, 1,
0.3731578, 2.572819, -0.4691868, 0, 0.1647059, 1, 1,
0.3734626, 1.735115, 1.411196, 0, 0.1607843, 1, 1,
0.3756516, -0.9436496, 4.270269, 0, 0.1529412, 1, 1,
0.3770594, 1.812526, -0.03313405, 0, 0.1490196, 1, 1,
0.3781082, 1.063447, -0.4529254, 0, 0.1411765, 1, 1,
0.3783856, 1.023785, -0.3892993, 0, 0.1372549, 1, 1,
0.3828788, -0.2554473, 2.463375, 0, 0.1294118, 1, 1,
0.3884027, -0.0948144, 1.937686, 0, 0.1254902, 1, 1,
0.3898504, 0.06314618, 1.606641, 0, 0.1176471, 1, 1,
0.38987, 0.5896963, 0.1185822, 0, 0.1137255, 1, 1,
0.4003272, -0.5594768, 2.959577, 0, 0.1058824, 1, 1,
0.4015135, -0.5251051, 3.809877, 0, 0.09803922, 1, 1,
0.4022614, -1.842599, 2.481582, 0, 0.09411765, 1, 1,
0.4052695, 0.5572818, 1.889854, 0, 0.08627451, 1, 1,
0.4130898, 0.2203543, 0.5558988, 0, 0.08235294, 1, 1,
0.4148509, 1.032918, 1.009508, 0, 0.07450981, 1, 1,
0.4158646, -0.8235855, 3.519245, 0, 0.07058824, 1, 1,
0.4160105, 0.3413055, 0.4845325, 0, 0.0627451, 1, 1,
0.4164124, -0.3578175, 1.873989, 0, 0.05882353, 1, 1,
0.4336055, 0.9500909, 0.1948365, 0, 0.05098039, 1, 1,
0.440909, -1.939068, 2.344324, 0, 0.04705882, 1, 1,
0.4413132, -1.725644, 4.268123, 0, 0.03921569, 1, 1,
0.4415076, 0.08318984, 0.114907, 0, 0.03529412, 1, 1,
0.4439388, -0.460184, 1.150221, 0, 0.02745098, 1, 1,
0.4473521, -0.04931026, 0.6032586, 0, 0.02352941, 1, 1,
0.4485191, -1.014856, 1.44588, 0, 0.01568628, 1, 1,
0.4513001, -2.393223, 2.330955, 0, 0.01176471, 1, 1,
0.4564701, 0.3819697, 0.3196303, 0, 0.003921569, 1, 1,
0.4668071, -0.6165102, 1.456613, 0.003921569, 0, 1, 1,
0.4706763, 0.3264109, 1.225104, 0.007843138, 0, 1, 1,
0.4722982, 0.8074017, -0.0165323, 0.01568628, 0, 1, 1,
0.4725595, -0.979932, 2.930803, 0.01960784, 0, 1, 1,
0.4758985, -0.8769176, 3.089549, 0.02745098, 0, 1, 1,
0.4782441, 0.9220279, 1.404604, 0.03137255, 0, 1, 1,
0.4844379, 0.9156924, -0.60089, 0.03921569, 0, 1, 1,
0.4882648, -1.477618, 3.337332, 0.04313726, 0, 1, 1,
0.4922653, 0.7382209, 0.7576772, 0.05098039, 0, 1, 1,
0.4923734, 0.6445413, 1.865285, 0.05490196, 0, 1, 1,
0.4973075, -0.4577532, 0.6368088, 0.0627451, 0, 1, 1,
0.5007061, -1.639663, 3.09559, 0.06666667, 0, 1, 1,
0.5007355, -0.3344763, 2.248636, 0.07450981, 0, 1, 1,
0.5012311, -0.4961753, 1.814054, 0.07843138, 0, 1, 1,
0.5051808, -0.2052093, 3.238902, 0.08627451, 0, 1, 1,
0.5064799, 0.3681388, 1.250437, 0.09019608, 0, 1, 1,
0.5092097, 1.670394, 0.404357, 0.09803922, 0, 1, 1,
0.5113475, 0.831785, -0.07306483, 0.1058824, 0, 1, 1,
0.513499, -0.1776419, 1.649289, 0.1098039, 0, 1, 1,
0.5183721, -0.5361673, 3.701405, 0.1176471, 0, 1, 1,
0.5199409, 1.287945, -0.4170929, 0.1215686, 0, 1, 1,
0.5210559, -1.36972, 4.246262, 0.1294118, 0, 1, 1,
0.5258273, -1.231794, 1.852593, 0.1333333, 0, 1, 1,
0.5280455, 0.2872946, 1.37346, 0.1411765, 0, 1, 1,
0.5314242, 0.8594808, 0.8570854, 0.145098, 0, 1, 1,
0.5321051, -1.174536, 3.217088, 0.1529412, 0, 1, 1,
0.5338237, -0.9544137, 1.922339, 0.1568628, 0, 1, 1,
0.539234, 0.4834951, 2.535168, 0.1647059, 0, 1, 1,
0.5421128, 1.506466, 0.2076835, 0.1686275, 0, 1, 1,
0.5421237, -0.3996989, 2.128529, 0.1764706, 0, 1, 1,
0.5445675, -2.176454, 1.970559, 0.1803922, 0, 1, 1,
0.5447342, 2.647935, -1.171595, 0.1882353, 0, 1, 1,
0.5456361, 0.08987137, 0.7947176, 0.1921569, 0, 1, 1,
0.5463245, -0.187262, 0.5581366, 0.2, 0, 1, 1,
0.5509098, -1.010814, 2.785205, 0.2078431, 0, 1, 1,
0.5528396, -0.8413076, 3.397013, 0.2117647, 0, 1, 1,
0.5533271, -0.6686229, 2.615968, 0.2196078, 0, 1, 1,
0.5545226, 0.5634692, 1.114052, 0.2235294, 0, 1, 1,
0.5551718, -0.3360682, 1.218231, 0.2313726, 0, 1, 1,
0.5558137, -0.1849517, 2.002429, 0.2352941, 0, 1, 1,
0.5568393, 0.3315642, 2.475357, 0.2431373, 0, 1, 1,
0.5573068, -0.120786, 2.16984, 0.2470588, 0, 1, 1,
0.5591416, -0.6039035, 2.835589, 0.254902, 0, 1, 1,
0.5682706, -0.596479, 1.146666, 0.2588235, 0, 1, 1,
0.5682825, -0.6359496, 2.557203, 0.2666667, 0, 1, 1,
0.57011, 1.970426, 0.01424862, 0.2705882, 0, 1, 1,
0.5701493, 0.2014675, 2.056533, 0.2784314, 0, 1, 1,
0.5706979, 0.09677345, -0.8838186, 0.282353, 0, 1, 1,
0.5715222, 1.811358, -0.4240755, 0.2901961, 0, 1, 1,
0.5740503, -2.516459, 3.845933, 0.2941177, 0, 1, 1,
0.5771705, -0.6465517, 3.506783, 0.3019608, 0, 1, 1,
0.5805413, 0.5493999, 2.468497, 0.3098039, 0, 1, 1,
0.5851272, -1.661032, 1.894274, 0.3137255, 0, 1, 1,
0.5870286, -0.7117501, 1.413683, 0.3215686, 0, 1, 1,
0.5875108, 1.524427, 0.805349, 0.3254902, 0, 1, 1,
0.5935521, -1.436437, 2.75496, 0.3333333, 0, 1, 1,
0.6000271, -0.2700131, 2.343388, 0.3372549, 0, 1, 1,
0.6039484, 0.1851295, 0.9836462, 0.345098, 0, 1, 1,
0.6055562, 0.1314074, 1.385057, 0.3490196, 0, 1, 1,
0.6059941, -0.5379052, 2.67912, 0.3568628, 0, 1, 1,
0.6072742, -0.7636615, 4.672097, 0.3607843, 0, 1, 1,
0.6080638, 0.3763992, 2.505126, 0.3686275, 0, 1, 1,
0.6198896, -2.359507, 2.351289, 0.372549, 0, 1, 1,
0.6259623, -2.070487, 2.933353, 0.3803922, 0, 1, 1,
0.6301059, -0.2860684, 2.244355, 0.3843137, 0, 1, 1,
0.6316397, 2.163707, -1.232148, 0.3921569, 0, 1, 1,
0.6335918, 0.6382322, 0.9603554, 0.3960784, 0, 1, 1,
0.6339314, 0.2580262, 1.316056, 0.4039216, 0, 1, 1,
0.6398584, 0.01379525, 2.827664, 0.4117647, 0, 1, 1,
0.6408025, 0.06653978, 1.743013, 0.4156863, 0, 1, 1,
0.6417974, -0.5266976, 1.64019, 0.4235294, 0, 1, 1,
0.6450927, -1.525903, 3.96629, 0.427451, 0, 1, 1,
0.6455522, -1.616367, 4.150172, 0.4352941, 0, 1, 1,
0.6458909, 0.06553265, 2.01604, 0.4392157, 0, 1, 1,
0.6483521, 0.03815738, 2.910768, 0.4470588, 0, 1, 1,
0.6488306, -0.4240795, 3.651084, 0.4509804, 0, 1, 1,
0.6501812, -0.1001414, -0.404572, 0.4588235, 0, 1, 1,
0.6515641, 0.7769993, 1.229322, 0.4627451, 0, 1, 1,
0.6565729, 2.247693, -1.255856, 0.4705882, 0, 1, 1,
0.6624862, -1.021979, 3.487948, 0.4745098, 0, 1, 1,
0.6696427, -1.271202, 2.150234, 0.4823529, 0, 1, 1,
0.6711934, 0.3175415, 0.6482207, 0.4862745, 0, 1, 1,
0.672377, 1.087539, 1.237721, 0.4941176, 0, 1, 1,
0.6742089, -2.026706, 2.041678, 0.5019608, 0, 1, 1,
0.6744712, 0.6994458, 0.1697885, 0.5058824, 0, 1, 1,
0.6843242, -0.776592, 3.283761, 0.5137255, 0, 1, 1,
0.6891131, 0.3654656, 1.265664, 0.5176471, 0, 1, 1,
0.6898579, -1.282121, 2.84708, 0.5254902, 0, 1, 1,
0.6906944, -0.4167676, 2.573442, 0.5294118, 0, 1, 1,
0.6953682, 0.9994919, 0.6863977, 0.5372549, 0, 1, 1,
0.698895, 0.8425488, 0.7571771, 0.5411765, 0, 1, 1,
0.7001704, 1.29169, 0.8388053, 0.5490196, 0, 1, 1,
0.7005391, 0.6010684, 2.099181, 0.5529412, 0, 1, 1,
0.7140862, -0.1157604, 0.5795041, 0.5607843, 0, 1, 1,
0.7166763, 0.9468715, 0.5455584, 0.5647059, 0, 1, 1,
0.721301, 0.2944039, 4.036324, 0.572549, 0, 1, 1,
0.7256132, 0.3601397, 0.4851604, 0.5764706, 0, 1, 1,
0.732345, -0.8580205, 2.351281, 0.5843138, 0, 1, 1,
0.7340066, 0.0437144, 2.977619, 0.5882353, 0, 1, 1,
0.7420356, 0.9115781, 0.8226524, 0.5960785, 0, 1, 1,
0.7425831, 0.8462133, 1.27212, 0.6039216, 0, 1, 1,
0.7438251, 0.02457325, 1.124509, 0.6078432, 0, 1, 1,
0.7451319, 0.4055786, 2.311777, 0.6156863, 0, 1, 1,
0.7467898, 0.242078, 1.692383, 0.6196079, 0, 1, 1,
0.7490726, 0.1432034, 1.783783, 0.627451, 0, 1, 1,
0.7578614, -0.9641463, 1.258665, 0.6313726, 0, 1, 1,
0.7596615, -0.33085, 3.309307, 0.6392157, 0, 1, 1,
0.7597145, 0.9092879, 0.9978859, 0.6431373, 0, 1, 1,
0.7608141, 2.054332, -0.2458373, 0.6509804, 0, 1, 1,
0.7635914, 1.005685, 0.6723748, 0.654902, 0, 1, 1,
0.7649503, 1.711282, 0.5128059, 0.6627451, 0, 1, 1,
0.7679328, 0.02372328, 2.48492, 0.6666667, 0, 1, 1,
0.7716504, 1.183581, 0.9612947, 0.6745098, 0, 1, 1,
0.7739601, -0.939368, 3.445867, 0.6784314, 0, 1, 1,
0.7766421, 0.6530846, 0.8840744, 0.6862745, 0, 1, 1,
0.7792721, -0.0435772, -0.308148, 0.6901961, 0, 1, 1,
0.7793733, -0.04354938, 1.496616, 0.6980392, 0, 1, 1,
0.7820043, 0.5901804, -0.1277647, 0.7058824, 0, 1, 1,
0.7834901, 0.01091898, 2.273172, 0.7098039, 0, 1, 1,
0.7874898, -1.653398, 2.754233, 0.7176471, 0, 1, 1,
0.790473, 0.7673982, -0.0908979, 0.7215686, 0, 1, 1,
0.7906741, -1.179874, 3.016484, 0.7294118, 0, 1, 1,
0.7917983, 1.48315, -0.4352567, 0.7333333, 0, 1, 1,
0.7922307, -0.3288058, -0.2568418, 0.7411765, 0, 1, 1,
0.793227, -1.142319, 1.829015, 0.7450981, 0, 1, 1,
0.7984933, 0.07018298, 3.587957, 0.7529412, 0, 1, 1,
0.8086367, 0.1208154, 0.9737537, 0.7568628, 0, 1, 1,
0.808637, -0.514487, 1.693029, 0.7647059, 0, 1, 1,
0.8172539, 0.08590753, 0.7599766, 0.7686275, 0, 1, 1,
0.8178143, -0.9126596, 2.910608, 0.7764706, 0, 1, 1,
0.8187067, -2.631837, 2.119699, 0.7803922, 0, 1, 1,
0.819735, 0.2764444, -0.3320313, 0.7882353, 0, 1, 1,
0.8224868, 0.7189635, 1.82295, 0.7921569, 0, 1, 1,
0.8229884, -0.5121287, 2.45249, 0.8, 0, 1, 1,
0.8252009, 1.523557, 1.05079, 0.8078431, 0, 1, 1,
0.8284644, -0.1020161, 0.9221875, 0.8117647, 0, 1, 1,
0.8302432, 3.013843, 1.304809, 0.8196079, 0, 1, 1,
0.8307421, -0.6638595, 1.601974, 0.8235294, 0, 1, 1,
0.833415, 0.3718126, 1.391511, 0.8313726, 0, 1, 1,
0.8390798, -0.5772421, 1.661469, 0.8352941, 0, 1, 1,
0.8414611, 0.2051311, 0.1837947, 0.8431373, 0, 1, 1,
0.8420824, 0.1992332, 0.554455, 0.8470588, 0, 1, 1,
0.8422862, 0.8752891, 1.584325, 0.854902, 0, 1, 1,
0.8542989, 0.2711418, 1.613987, 0.8588235, 0, 1, 1,
0.8570704, 0.2548547, 0.9858434, 0.8666667, 0, 1, 1,
0.8577719, 1.936328, 0.8362196, 0.8705882, 0, 1, 1,
0.8750011, -0.5365373, 3.23337, 0.8784314, 0, 1, 1,
0.8865965, 0.01276325, 0.968412, 0.8823529, 0, 1, 1,
0.8903969, 0.1860054, 1.655479, 0.8901961, 0, 1, 1,
0.8933944, -2.240154, 3.208685, 0.8941177, 0, 1, 1,
0.9054865, 0.19129, 1.43502, 0.9019608, 0, 1, 1,
0.9117609, -0.4391754, 1.583485, 0.9098039, 0, 1, 1,
0.915219, -2.586766, 2.086623, 0.9137255, 0, 1, 1,
0.9270403, 1.156389, 1.318406, 0.9215686, 0, 1, 1,
0.9275075, -1.875069, 1.713235, 0.9254902, 0, 1, 1,
0.9306149, 0.09412709, 0.3869192, 0.9333333, 0, 1, 1,
0.9345396, 0.3955557, 1.20325, 0.9372549, 0, 1, 1,
0.9347408, -0.2603463, 3.098122, 0.945098, 0, 1, 1,
0.937226, 0.2960422, 2.248472, 0.9490196, 0, 1, 1,
0.9394748, 1.951499, -0.06731621, 0.9568627, 0, 1, 1,
0.9424386, -0.3319772, 0.5480968, 0.9607843, 0, 1, 1,
0.9430573, -0.0004533447, 0.5437894, 0.9686275, 0, 1, 1,
0.9442014, -0.1605584, 0.8514305, 0.972549, 0, 1, 1,
0.9540489, -1.161308, 2.472336, 0.9803922, 0, 1, 1,
0.9560903, -0.9731725, 0.2670695, 0.9843137, 0, 1, 1,
0.964932, -0.1847897, 2.361034, 0.9921569, 0, 1, 1,
0.9712231, -0.4481254, 2.292915, 0.9960784, 0, 1, 1,
0.9721022, 0.8109936, 0.8320863, 1, 0, 0.9960784, 1,
0.9740606, -0.9165426, 4.466609, 1, 0, 0.9882353, 1,
0.9747957, -0.5785506, 2.120523, 1, 0, 0.9843137, 1,
0.9793023, 1.128499, 1.109979, 1, 0, 0.9764706, 1,
0.9817256, -0.5233924, 0.6904984, 1, 0, 0.972549, 1,
0.9853602, -1.783465, 3.683934, 1, 0, 0.9647059, 1,
0.9865589, 0.7675505, 0.1609327, 1, 0, 0.9607843, 1,
0.9961852, 0.6164164, 0.8512545, 1, 0, 0.9529412, 1,
1.000536, 1.075073, 1.380227, 1, 0, 0.9490196, 1,
1.002172, -0.3385403, 2.327191, 1, 0, 0.9411765, 1,
1.006496, 0.9349092, 1.463965, 1, 0, 0.9372549, 1,
1.011041, -0.6061122, 2.462946, 1, 0, 0.9294118, 1,
1.02261, -0.437173, 0.7122989, 1, 0, 0.9254902, 1,
1.02712, -1.602647, 2.879924, 1, 0, 0.9176471, 1,
1.029088, -1.156422, 1.461663, 1, 0, 0.9137255, 1,
1.036626, 0.4327452, 0.2650791, 1, 0, 0.9058824, 1,
1.037576, -0.9873053, 3.319426, 1, 0, 0.9019608, 1,
1.046611, -1.621109, 2.164924, 1, 0, 0.8941177, 1,
1.051607, 0.1846808, 0.5324925, 1, 0, 0.8862745, 1,
1.053588, 1.322908, 0.07373108, 1, 0, 0.8823529, 1,
1.058361, -1.044324, 1.948008, 1, 0, 0.8745098, 1,
1.067147, 0.4667928, -0.06997304, 1, 0, 0.8705882, 1,
1.067669, 2.233065, -0.1605027, 1, 0, 0.8627451, 1,
1.06934, -0.7048852, 3.478137, 1, 0, 0.8588235, 1,
1.069516, -0.1898612, 0.8383241, 1, 0, 0.8509804, 1,
1.071304, -0.08288963, 1.628368, 1, 0, 0.8470588, 1,
1.072103, 1.899216, 0.7334068, 1, 0, 0.8392157, 1,
1.074621, 0.9101474, 2.69595, 1, 0, 0.8352941, 1,
1.075083, -0.1131043, 0.05160731, 1, 0, 0.827451, 1,
1.082253, -1.672117, 1.438477, 1, 0, 0.8235294, 1,
1.083728, 1.744162, 0.5278795, 1, 0, 0.8156863, 1,
1.086422, 0.2988665, 0.8140099, 1, 0, 0.8117647, 1,
1.096132, 0.04483147, -0.3832378, 1, 0, 0.8039216, 1,
1.097724, -0.6872511, 0.8520923, 1, 0, 0.7960784, 1,
1.098144, 1.343297, -0.165281, 1, 0, 0.7921569, 1,
1.099115, 1.159527, -1.324847, 1, 0, 0.7843137, 1,
1.114274, -1.495667, 3.054531, 1, 0, 0.7803922, 1,
1.118167, 0.1357129, 0.5905911, 1, 0, 0.772549, 1,
1.120383, 0.585547, 1.636476, 1, 0, 0.7686275, 1,
1.12297, -1.230281, 2.333459, 1, 0, 0.7607843, 1,
1.127302, 0.407056, 0.8626317, 1, 0, 0.7568628, 1,
1.132159, 0.3480932, 0.2155126, 1, 0, 0.7490196, 1,
1.133062, 0.5854103, 2.101364, 1, 0, 0.7450981, 1,
1.136469, -0.5883021, 3.254952, 1, 0, 0.7372549, 1,
1.142585, 1.578128, 1.476665, 1, 0, 0.7333333, 1,
1.15873, 0.3414571, 2.258839, 1, 0, 0.7254902, 1,
1.161578, -0.4156141, 2.216296, 1, 0, 0.7215686, 1,
1.169139, 0.6075636, 0.7993948, 1, 0, 0.7137255, 1,
1.170658, 0.9102919, 1.681851, 1, 0, 0.7098039, 1,
1.173226, 0.7108809, 1.85607, 1, 0, 0.7019608, 1,
1.177489, -1.062868, 2.030326, 1, 0, 0.6941177, 1,
1.182921, 1.889354, 0.6523052, 1, 0, 0.6901961, 1,
1.187143, -0.6181395, 2.755952, 1, 0, 0.682353, 1,
1.1883, -0.2573359, 2.709451, 1, 0, 0.6784314, 1,
1.195365, -1.070868, 1.654511, 1, 0, 0.6705883, 1,
1.197674, -0.7182055, 1.872143, 1, 0, 0.6666667, 1,
1.20534, -1.760489, 2.835389, 1, 0, 0.6588235, 1,
1.207075, -0.4705707, 3.180686, 1, 0, 0.654902, 1,
1.213032, 0.6196749, 2.778977, 1, 0, 0.6470588, 1,
1.22167, 0.8856751, -0.6615951, 1, 0, 0.6431373, 1,
1.222411, -0.8573974, 2.527751, 1, 0, 0.6352941, 1,
1.242312, 0.1376763, -0.04898562, 1, 0, 0.6313726, 1,
1.246293, -2.055541, 2.970575, 1, 0, 0.6235294, 1,
1.246902, 0.7948269, -0.1648483, 1, 0, 0.6196079, 1,
1.252926, -0.2129508, 1.76444, 1, 0, 0.6117647, 1,
1.25438, -0.2607394, 0.4406194, 1, 0, 0.6078432, 1,
1.260978, 0.972089, -0.01392929, 1, 0, 0.6, 1,
1.261182, -0.7932624, 1.797888, 1, 0, 0.5921569, 1,
1.271524, 0.9297192, 2.25387, 1, 0, 0.5882353, 1,
1.287144, 0.01062269, 1.58724, 1, 0, 0.5803922, 1,
1.287281, 2.356409, 0.5141179, 1, 0, 0.5764706, 1,
1.294874, 0.3547313, 1.698314, 1, 0, 0.5686275, 1,
1.298396, -0.7749269, 1.815844, 1, 0, 0.5647059, 1,
1.306651, 0.02281007, 1.525026, 1, 0, 0.5568628, 1,
1.315303, 0.1704714, 1.341176, 1, 0, 0.5529412, 1,
1.322923, -0.4963523, 1.944011, 1, 0, 0.5450981, 1,
1.329781, -0.3890842, 2.697361, 1, 0, 0.5411765, 1,
1.330549, 1.503291, -0.2272922, 1, 0, 0.5333334, 1,
1.331025, -2.088377, 4.332387, 1, 0, 0.5294118, 1,
1.33753, 0.1245679, 0.3439098, 1, 0, 0.5215687, 1,
1.338446, -1.326396, 3.986262, 1, 0, 0.5176471, 1,
1.33873, 0.4977466, 1.376958, 1, 0, 0.509804, 1,
1.345347, -1.277517, 3.129008, 1, 0, 0.5058824, 1,
1.358468, 0.9920147, 0.7673576, 1, 0, 0.4980392, 1,
1.369589, 2.056952, 0.8726876, 1, 0, 0.4901961, 1,
1.372307, 0.9988798, 1.284493, 1, 0, 0.4862745, 1,
1.376965, -0.242677, 1.361818, 1, 0, 0.4784314, 1,
1.380781, 1.134965, 1.255102, 1, 0, 0.4745098, 1,
1.389812, 1.096905, 0.9194884, 1, 0, 0.4666667, 1,
1.392968, -0.5258815, 1.381891, 1, 0, 0.4627451, 1,
1.398812, 1.485893, 0.6733162, 1, 0, 0.454902, 1,
1.403552, -0.009275872, 1.619935, 1, 0, 0.4509804, 1,
1.407029, 1.122052, 1.050463, 1, 0, 0.4431373, 1,
1.407261, -0.3895208, 2.185896, 1, 0, 0.4392157, 1,
1.409741, 2.435464, 0.3541948, 1, 0, 0.4313726, 1,
1.41495, -0.3612196, 3.573981, 1, 0, 0.427451, 1,
1.420346, -0.3789685, 0.9126281, 1, 0, 0.4196078, 1,
1.437959, -0.06415708, 1.619957, 1, 0, 0.4156863, 1,
1.455409, -0.4395031, 2.570786, 1, 0, 0.4078431, 1,
1.466516, 2.175112, 0.462881, 1, 0, 0.4039216, 1,
1.470767, 0.4534387, 1.108043, 1, 0, 0.3960784, 1,
1.481845, -1.74851, 3.057374, 1, 0, 0.3882353, 1,
1.502356, 0.09591305, -0.5723931, 1, 0, 0.3843137, 1,
1.504479, 1.966953, 1.561469, 1, 0, 0.3764706, 1,
1.518369, 1.046204, 2.013926, 1, 0, 0.372549, 1,
1.52536, 0.3322791, 1.239024, 1, 0, 0.3647059, 1,
1.535172, -0.3818706, 2.707649, 1, 0, 0.3607843, 1,
1.546026, 0.258803, 3.073544, 1, 0, 0.3529412, 1,
1.549212, 0.1534652, 1.143083, 1, 0, 0.3490196, 1,
1.576468, -0.2085105, 2.020467, 1, 0, 0.3411765, 1,
1.602907, -3.028922, 2.264571, 1, 0, 0.3372549, 1,
1.613291, -2.160158, 2.904548, 1, 0, 0.3294118, 1,
1.616585, -0.6541627, 2.06512, 1, 0, 0.3254902, 1,
1.617597, -1.839799, 2.563209, 1, 0, 0.3176471, 1,
1.628424, 0.9534479, 1.617072, 1, 0, 0.3137255, 1,
1.62967, -0.1149668, 0.4380651, 1, 0, 0.3058824, 1,
1.640625, 0.3835582, -0.843393, 1, 0, 0.2980392, 1,
1.648278, -1.886985, 2.158171, 1, 0, 0.2941177, 1,
1.715573, -0.5240539, 1.03459, 1, 0, 0.2862745, 1,
1.716689, 0.9342459, 2.353551, 1, 0, 0.282353, 1,
1.723361, 2.244062, 1.970073, 1, 0, 0.2745098, 1,
1.726221, 0.4222421, 0.44368, 1, 0, 0.2705882, 1,
1.727946, -0.4225318, 2.397497, 1, 0, 0.2627451, 1,
1.728742, 0.3662728, 3.558857, 1, 0, 0.2588235, 1,
1.752158, -0.5477879, 1.679411, 1, 0, 0.2509804, 1,
1.792328, 0.4751401, 1.019379, 1, 0, 0.2470588, 1,
1.80661, -0.6353955, 2.521725, 1, 0, 0.2392157, 1,
1.807888, -0.05651967, 2.304262, 1, 0, 0.2352941, 1,
1.841162, 1.473905, 1.252524, 1, 0, 0.227451, 1,
1.857861, 0.1166674, -0.4099334, 1, 0, 0.2235294, 1,
1.897452, -0.8828825, 2.205791, 1, 0, 0.2156863, 1,
1.921857, 1.178479, -1.264594, 1, 0, 0.2117647, 1,
1.933271, 0.5899695, 1.529741, 1, 0, 0.2039216, 1,
1.955471, 0.8064192, 0.6096132, 1, 0, 0.1960784, 1,
1.9557, 0.8700188, 0.6765336, 1, 0, 0.1921569, 1,
1.97623, -0.7568986, 1.735253, 1, 0, 0.1843137, 1,
1.980888, 0.7008957, 1.8202, 1, 0, 0.1803922, 1,
1.989383, 1.14758, -1.037878, 1, 0, 0.172549, 1,
1.998094, -1.719689, 1.412695, 1, 0, 0.1686275, 1,
1.998594, 0.5552856, 1.61288, 1, 0, 0.1607843, 1,
2.028633, -0.6826569, 2.087844, 1, 0, 0.1568628, 1,
2.02922, -3.425701, 2.795313, 1, 0, 0.1490196, 1,
2.033531, -0.2081764, 4.474792, 1, 0, 0.145098, 1,
2.065476, -2.291191, 2.75672, 1, 0, 0.1372549, 1,
2.06582, -1.217797, 2.056908, 1, 0, 0.1333333, 1,
2.072352, -1.748927, 2.473048, 1, 0, 0.1254902, 1,
2.131231, 0.2617339, 3.3042, 1, 0, 0.1215686, 1,
2.135649, 0.5332336, 2.01583, 1, 0, 0.1137255, 1,
2.141229, 0.4111615, 1.830869, 1, 0, 0.1098039, 1,
2.171038, -0.5946711, 2.380356, 1, 0, 0.1019608, 1,
2.181553, -0.7802448, 2.495286, 1, 0, 0.09411765, 1,
2.193803, 1.733453, 1.541951, 1, 0, 0.09019608, 1,
2.201777, -0.3351941, 2.197917, 1, 0, 0.08235294, 1,
2.208477, 0.9065891, 1.784044, 1, 0, 0.07843138, 1,
2.264244, -0.8062104, 2.19137, 1, 0, 0.07058824, 1,
2.273566, -0.4800345, 0.8676803, 1, 0, 0.06666667, 1,
2.306905, -2.513461, 2.061583, 1, 0, 0.05882353, 1,
2.409128, 1.042022, 1.604487, 1, 0, 0.05490196, 1,
2.440172, 0.3892453, 2.335064, 1, 0, 0.04705882, 1,
2.516055, -1.410994, 2.899757, 1, 0, 0.04313726, 1,
2.540379, 0.4382111, 1.545253, 1, 0, 0.03529412, 1,
2.542941, -0.1296144, 2.846158, 1, 0, 0.03137255, 1,
2.6982, 0.10148, 0.9838734, 1, 0, 0.02352941, 1,
2.725563, 2.260793, 1.115445, 1, 0, 0.01960784, 1,
2.952451, 2.002162, -0.7006727, 1, 0, 0.01176471, 1,
3.248277, 0.8319116, 3.44458, 1, 0, 0.007843138, 1
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
-0.2322974, -4.517203, -7.719885, 0, -0.5, 0.5, 0.5,
-0.2322974, -4.517203, -7.719885, 1, -0.5, 0.5, 0.5,
-0.2322974, -4.517203, -7.719885, 1, 1.5, 0.5, 0.5,
-0.2322974, -4.517203, -7.719885, 0, 1.5, 0.5, 0.5
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
-4.892787, -0.2059288, -7.719885, 0, -0.5, 0.5, 0.5,
-4.892787, -0.2059288, -7.719885, 1, -0.5, 0.5, 0.5,
-4.892787, -0.2059288, -7.719885, 1, 1.5, 0.5, 0.5,
-4.892787, -0.2059288, -7.719885, 0, 1.5, 0.5, 0.5
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
-4.892787, -4.517203, -0.2762659, 0, -0.5, 0.5, 0.5,
-4.892787, -4.517203, -0.2762659, 1, -0.5, 0.5, 0.5,
-4.892787, -4.517203, -0.2762659, 1, 1.5, 0.5, 0.5,
-4.892787, -4.517203, -0.2762659, 0, 1.5, 0.5, 0.5
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
-3, -3.522294, -6.002127,
3, -3.522294, -6.002127,
-3, -3.522294, -6.002127,
-3, -3.688112, -6.28842,
-2, -3.522294, -6.002127,
-2, -3.688112, -6.28842,
-1, -3.522294, -6.002127,
-1, -3.688112, -6.28842,
0, -3.522294, -6.002127,
0, -3.688112, -6.28842,
1, -3.522294, -6.002127,
1, -3.688112, -6.28842,
2, -3.522294, -6.002127,
2, -3.688112, -6.28842,
3, -3.522294, -6.002127,
3, -3.688112, -6.28842
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
-3, -4.019749, -6.861006, 0, -0.5, 0.5, 0.5,
-3, -4.019749, -6.861006, 1, -0.5, 0.5, 0.5,
-3, -4.019749, -6.861006, 1, 1.5, 0.5, 0.5,
-3, -4.019749, -6.861006, 0, 1.5, 0.5, 0.5,
-2, -4.019749, -6.861006, 0, -0.5, 0.5, 0.5,
-2, -4.019749, -6.861006, 1, -0.5, 0.5, 0.5,
-2, -4.019749, -6.861006, 1, 1.5, 0.5, 0.5,
-2, -4.019749, -6.861006, 0, 1.5, 0.5, 0.5,
-1, -4.019749, -6.861006, 0, -0.5, 0.5, 0.5,
-1, -4.019749, -6.861006, 1, -0.5, 0.5, 0.5,
-1, -4.019749, -6.861006, 1, 1.5, 0.5, 0.5,
-1, -4.019749, -6.861006, 0, 1.5, 0.5, 0.5,
0, -4.019749, -6.861006, 0, -0.5, 0.5, 0.5,
0, -4.019749, -6.861006, 1, -0.5, 0.5, 0.5,
0, -4.019749, -6.861006, 1, 1.5, 0.5, 0.5,
0, -4.019749, -6.861006, 0, 1.5, 0.5, 0.5,
1, -4.019749, -6.861006, 0, -0.5, 0.5, 0.5,
1, -4.019749, -6.861006, 1, -0.5, 0.5, 0.5,
1, -4.019749, -6.861006, 1, 1.5, 0.5, 0.5,
1, -4.019749, -6.861006, 0, 1.5, 0.5, 0.5,
2, -4.019749, -6.861006, 0, -0.5, 0.5, 0.5,
2, -4.019749, -6.861006, 1, -0.5, 0.5, 0.5,
2, -4.019749, -6.861006, 1, 1.5, 0.5, 0.5,
2, -4.019749, -6.861006, 0, 1.5, 0.5, 0.5,
3, -4.019749, -6.861006, 0, -0.5, 0.5, 0.5,
3, -4.019749, -6.861006, 1, -0.5, 0.5, 0.5,
3, -4.019749, -6.861006, 1, 1.5, 0.5, 0.5,
3, -4.019749, -6.861006, 0, 1.5, 0.5, 0.5
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
-3.817289, -3, -6.002127,
-3.817289, 3, -6.002127,
-3.817289, -3, -6.002127,
-3.996539, -3, -6.28842,
-3.817289, -2, -6.002127,
-3.996539, -2, -6.28842,
-3.817289, -1, -6.002127,
-3.996539, -1, -6.28842,
-3.817289, 0, -6.002127,
-3.996539, 0, -6.28842,
-3.817289, 1, -6.002127,
-3.996539, 1, -6.28842,
-3.817289, 2, -6.002127,
-3.996539, 2, -6.28842,
-3.817289, 3, -6.002127,
-3.996539, 3, -6.28842
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
-4.355038, -3, -6.861006, 0, -0.5, 0.5, 0.5,
-4.355038, -3, -6.861006, 1, -0.5, 0.5, 0.5,
-4.355038, -3, -6.861006, 1, 1.5, 0.5, 0.5,
-4.355038, -3, -6.861006, 0, 1.5, 0.5, 0.5,
-4.355038, -2, -6.861006, 0, -0.5, 0.5, 0.5,
-4.355038, -2, -6.861006, 1, -0.5, 0.5, 0.5,
-4.355038, -2, -6.861006, 1, 1.5, 0.5, 0.5,
-4.355038, -2, -6.861006, 0, 1.5, 0.5, 0.5,
-4.355038, -1, -6.861006, 0, -0.5, 0.5, 0.5,
-4.355038, -1, -6.861006, 1, -0.5, 0.5, 0.5,
-4.355038, -1, -6.861006, 1, 1.5, 0.5, 0.5,
-4.355038, -1, -6.861006, 0, 1.5, 0.5, 0.5,
-4.355038, 0, -6.861006, 0, -0.5, 0.5, 0.5,
-4.355038, 0, -6.861006, 1, -0.5, 0.5, 0.5,
-4.355038, 0, -6.861006, 1, 1.5, 0.5, 0.5,
-4.355038, 0, -6.861006, 0, 1.5, 0.5, 0.5,
-4.355038, 1, -6.861006, 0, -0.5, 0.5, 0.5,
-4.355038, 1, -6.861006, 1, -0.5, 0.5, 0.5,
-4.355038, 1, -6.861006, 1, 1.5, 0.5, 0.5,
-4.355038, 1, -6.861006, 0, 1.5, 0.5, 0.5,
-4.355038, 2, -6.861006, 0, -0.5, 0.5, 0.5,
-4.355038, 2, -6.861006, 1, -0.5, 0.5, 0.5,
-4.355038, 2, -6.861006, 1, 1.5, 0.5, 0.5,
-4.355038, 2, -6.861006, 0, 1.5, 0.5, 0.5,
-4.355038, 3, -6.861006, 0, -0.5, 0.5, 0.5,
-4.355038, 3, -6.861006, 1, -0.5, 0.5, 0.5,
-4.355038, 3, -6.861006, 1, 1.5, 0.5, 0.5,
-4.355038, 3, -6.861006, 0, 1.5, 0.5, 0.5
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
-3.817289, -3.522294, -4,
-3.817289, -3.522294, 4,
-3.817289, -3.522294, -4,
-3.996539, -3.688112, -4,
-3.817289, -3.522294, -2,
-3.996539, -3.688112, -2,
-3.817289, -3.522294, 0,
-3.996539, -3.688112, 0,
-3.817289, -3.522294, 2,
-3.996539, -3.688112, 2,
-3.817289, -3.522294, 4,
-3.996539, -3.688112, 4
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
-4.355038, -4.019749, -4, 0, -0.5, 0.5, 0.5,
-4.355038, -4.019749, -4, 1, -0.5, 0.5, 0.5,
-4.355038, -4.019749, -4, 1, 1.5, 0.5, 0.5,
-4.355038, -4.019749, -4, 0, 1.5, 0.5, 0.5,
-4.355038, -4.019749, -2, 0, -0.5, 0.5, 0.5,
-4.355038, -4.019749, -2, 1, -0.5, 0.5, 0.5,
-4.355038, -4.019749, -2, 1, 1.5, 0.5, 0.5,
-4.355038, -4.019749, -2, 0, 1.5, 0.5, 0.5,
-4.355038, -4.019749, 0, 0, -0.5, 0.5, 0.5,
-4.355038, -4.019749, 0, 1, -0.5, 0.5, 0.5,
-4.355038, -4.019749, 0, 1, 1.5, 0.5, 0.5,
-4.355038, -4.019749, 0, 0, 1.5, 0.5, 0.5,
-4.355038, -4.019749, 2, 0, -0.5, 0.5, 0.5,
-4.355038, -4.019749, 2, 1, -0.5, 0.5, 0.5,
-4.355038, -4.019749, 2, 1, 1.5, 0.5, 0.5,
-4.355038, -4.019749, 2, 0, 1.5, 0.5, 0.5,
-4.355038, -4.019749, 4, 0, -0.5, 0.5, 0.5,
-4.355038, -4.019749, 4, 1, -0.5, 0.5, 0.5,
-4.355038, -4.019749, 4, 1, 1.5, 0.5, 0.5,
-4.355038, -4.019749, 4, 0, 1.5, 0.5, 0.5
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
-3.817289, -3.522294, -6.002127,
-3.817289, 3.110436, -6.002127,
-3.817289, -3.522294, 5.449595,
-3.817289, 3.110436, 5.449595,
-3.817289, -3.522294, -6.002127,
-3.817289, -3.522294, 5.449595,
-3.817289, 3.110436, -6.002127,
-3.817289, 3.110436, 5.449595,
-3.817289, -3.522294, -6.002127,
3.352695, -3.522294, -6.002127,
-3.817289, -3.522294, 5.449595,
3.352695, -3.522294, 5.449595,
-3.817289, 3.110436, -6.002127,
3.352695, 3.110436, -6.002127,
-3.817289, 3.110436, 5.449595,
3.352695, 3.110436, 5.449595,
3.352695, -3.522294, -6.002127,
3.352695, 3.110436, -6.002127,
3.352695, -3.522294, 5.449595,
3.352695, 3.110436, 5.449595,
3.352695, -3.522294, -6.002127,
3.352695, -3.522294, 5.449595,
3.352695, 3.110436, -6.002127,
3.352695, 3.110436, 5.449595
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
var radius = 8.037139;
var distance = 35.75814;
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
mvMatrix.translate( 0.2322974, 0.2059288, 0.2762659 );
mvMatrix.scale( 1.211985, 1.310156, 0.7588302 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75814);
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


