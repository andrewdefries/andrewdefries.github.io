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
-2.666589, 1.533413, -0.3021613, 1, 0, 0, 1,
-2.622316, -0.170548, -3.334965, 1, 0.007843138, 0, 1,
-2.556377, 1.285243, -0.8113965, 1, 0.01176471, 0, 1,
-2.547616, -0.6474539, -0.9975693, 1, 0.01960784, 0, 1,
-2.498099, -1.085291, 0.1273278, 1, 0.02352941, 0, 1,
-2.425392, 0.5011305, -2.223874, 1, 0.03137255, 0, 1,
-2.346348, -0.07585911, -1.764818, 1, 0.03529412, 0, 1,
-2.34295, -0.9802969, -0.7712286, 1, 0.04313726, 0, 1,
-2.296184, 2.136523, -1.577698, 1, 0.04705882, 0, 1,
-2.263067, 0.4691601, 0.6892277, 1, 0.05490196, 0, 1,
-2.250594, -0.882724, -2.033062, 1, 0.05882353, 0, 1,
-2.224284, 1.506383, 0.5059156, 1, 0.06666667, 0, 1,
-2.204853, -0.2689815, -3.030935, 1, 0.07058824, 0, 1,
-2.192868, -0.4596938, -2.15891, 1, 0.07843138, 0, 1,
-2.18846, -0.163897, -1.290939, 1, 0.08235294, 0, 1,
-2.159529, -0.5384957, -2.08109, 1, 0.09019608, 0, 1,
-2.135973, -1.314522, -2.502979, 1, 0.09411765, 0, 1,
-2.094395, 1.856323, -0.7361704, 1, 0.1019608, 0, 1,
-2.045197, 0.04145267, -0.3465833, 1, 0.1098039, 0, 1,
-2.040104, 0.01496576, -0.2182385, 1, 0.1137255, 0, 1,
-2.009181, 1.225013, -0.3135535, 1, 0.1215686, 0, 1,
-1.998499, -0.5054457, -0.8861054, 1, 0.1254902, 0, 1,
-1.98701, 2.656398, -0.5532156, 1, 0.1333333, 0, 1,
-1.985067, -0.4866702, -2.070195, 1, 0.1372549, 0, 1,
-1.98175, -1.40229, -0.9354042, 1, 0.145098, 0, 1,
-1.936074, 0.011422, -2.581777, 1, 0.1490196, 0, 1,
-1.911445, 0.7101873, -1.696681, 1, 0.1568628, 0, 1,
-1.910466, 0.6230698, -1.400865, 1, 0.1607843, 0, 1,
-1.898895, -0.5961585, -1.979427, 1, 0.1686275, 0, 1,
-1.89532, 1.900096, -2.240043, 1, 0.172549, 0, 1,
-1.874969, 0.1767589, 0.08819611, 1, 0.1803922, 0, 1,
-1.864615, -1.885414, -2.408066, 1, 0.1843137, 0, 1,
-1.850604, -0.3287874, -2.28741, 1, 0.1921569, 0, 1,
-1.842332, 0.7102029, -0.5521488, 1, 0.1960784, 0, 1,
-1.828897, 1.011936, 0.2175663, 1, 0.2039216, 0, 1,
-1.820273, -0.1359346, -2.837094, 1, 0.2117647, 0, 1,
-1.809608, -1.427817, 0.2691824, 1, 0.2156863, 0, 1,
-1.77625, -1.876424, -3.411244, 1, 0.2235294, 0, 1,
-1.772043, -1.122106, -2.582559, 1, 0.227451, 0, 1,
-1.768055, -0.6607829, -1.837813, 1, 0.2352941, 0, 1,
-1.723324, -0.8306845, -2.578247, 1, 0.2392157, 0, 1,
-1.710629, 0.09454531, -1.058037, 1, 0.2470588, 0, 1,
-1.703807, -1.312854, -2.789856, 1, 0.2509804, 0, 1,
-1.699745, -1.06663, -0.2343342, 1, 0.2588235, 0, 1,
-1.667158, -0.2086842, -1.46191, 1, 0.2627451, 0, 1,
-1.660105, -0.8924813, -1.335355, 1, 0.2705882, 0, 1,
-1.657816, -0.7647102, -1.322507, 1, 0.2745098, 0, 1,
-1.655841, 0.61255, 0.04462958, 1, 0.282353, 0, 1,
-1.652207, -0.1597281, -1.384359, 1, 0.2862745, 0, 1,
-1.640845, -0.05666174, -0.2608791, 1, 0.2941177, 0, 1,
-1.628261, 0.1630022, 0.281032, 1, 0.3019608, 0, 1,
-1.619574, -0.428609, -3.405229, 1, 0.3058824, 0, 1,
-1.618, -0.382631, -1.081902, 1, 0.3137255, 0, 1,
-1.609788, -0.891212, -2.924409, 1, 0.3176471, 0, 1,
-1.575107, 0.6812108, -1.116301, 1, 0.3254902, 0, 1,
-1.5745, 0.6416574, -0.8819097, 1, 0.3294118, 0, 1,
-1.553718, -1.799588, -2.407521, 1, 0.3372549, 0, 1,
-1.543472, -0.3178352, -1.669025, 1, 0.3411765, 0, 1,
-1.531895, -0.8069346, -1.387002, 1, 0.3490196, 0, 1,
-1.531184, 0.6584566, 0.2436669, 1, 0.3529412, 0, 1,
-1.51223, -0.1789292, -2.182189, 1, 0.3607843, 0, 1,
-1.4794, 1.314735, 0.1742995, 1, 0.3647059, 0, 1,
-1.472337, 0.555947, -1.565092, 1, 0.372549, 0, 1,
-1.470206, -0.7830144, -1.069332, 1, 0.3764706, 0, 1,
-1.460896, 0.0863293, -1.232377, 1, 0.3843137, 0, 1,
-1.460724, -0.9957491, -2.36459, 1, 0.3882353, 0, 1,
-1.458981, 0.6630823, -0.6035744, 1, 0.3960784, 0, 1,
-1.458249, 0.9137837, -2.651862, 1, 0.4039216, 0, 1,
-1.455028, 0.114962, -2.238892, 1, 0.4078431, 0, 1,
-1.441255, -0.9926091, -2.799782, 1, 0.4156863, 0, 1,
-1.434688, 1.884736, -0.4351058, 1, 0.4196078, 0, 1,
-1.430671, -0.5462449, -2.447338, 1, 0.427451, 0, 1,
-1.422877, 0.1417529, -2.081563, 1, 0.4313726, 0, 1,
-1.42029, 1.426535, -1.878616, 1, 0.4392157, 0, 1,
-1.413215, 0.09248532, -0.4881342, 1, 0.4431373, 0, 1,
-1.391217, -0.6305543, -1.835907, 1, 0.4509804, 0, 1,
-1.390555, -0.2668175, -3.213437, 1, 0.454902, 0, 1,
-1.384853, -0.7023884, -2.49298, 1, 0.4627451, 0, 1,
-1.378106, 0.3143728, 0.3971061, 1, 0.4666667, 0, 1,
-1.377321, 0.5935448, -0.4757371, 1, 0.4745098, 0, 1,
-1.374006, -0.2086976, -1.481877, 1, 0.4784314, 0, 1,
-1.373928, -1.616294, -3.903036, 1, 0.4862745, 0, 1,
-1.365196, 0.9180623, -2.064866, 1, 0.4901961, 0, 1,
-1.364873, 1.784678, -0.6997479, 1, 0.4980392, 0, 1,
-1.362011, -1.639193, -3.487927, 1, 0.5058824, 0, 1,
-1.340339, 0.5928605, -1.275957, 1, 0.509804, 0, 1,
-1.340301, -1.776638, -3.611933, 1, 0.5176471, 0, 1,
-1.340013, -0.8115131, -2.759013, 1, 0.5215687, 0, 1,
-1.33376, -0.09958291, -0.8417239, 1, 0.5294118, 0, 1,
-1.328875, 0.8635924, -1.439911, 1, 0.5333334, 0, 1,
-1.32362, -1.7004, -0.8886778, 1, 0.5411765, 0, 1,
-1.317105, -0.4478462, -2.603928, 1, 0.5450981, 0, 1,
-1.314039, -0.0288179, -2.276639, 1, 0.5529412, 0, 1,
-1.308025, -0.7634079, -2.39502, 1, 0.5568628, 0, 1,
-1.306657, -1.891097, -2.61566, 1, 0.5647059, 0, 1,
-1.301124, -0.4746951, -2.434605, 1, 0.5686275, 0, 1,
-1.297553, -0.07084737, -1.275639, 1, 0.5764706, 0, 1,
-1.294512, -0.7889398, -3.05903, 1, 0.5803922, 0, 1,
-1.294033, 1.059014, -0.5711688, 1, 0.5882353, 0, 1,
-1.279593, -0.4153744, -3.307771, 1, 0.5921569, 0, 1,
-1.271974, 1.080702, -1.459627, 1, 0.6, 0, 1,
-1.24894, 2.030913, 0.1183629, 1, 0.6078432, 0, 1,
-1.245015, -0.3269168, 0.525582, 1, 0.6117647, 0, 1,
-1.236857, -0.1724143, -1.544802, 1, 0.6196079, 0, 1,
-1.233793, 0.2075694, -2.034724, 1, 0.6235294, 0, 1,
-1.222112, 0.2552988, -1.201165, 1, 0.6313726, 0, 1,
-1.219535, -0.3098813, -2.437433, 1, 0.6352941, 0, 1,
-1.218432, -0.1936008, -3.248885, 1, 0.6431373, 0, 1,
-1.205824, -0.5786141, -2.942227, 1, 0.6470588, 0, 1,
-1.20328, 0.8058237, -1.060781, 1, 0.654902, 0, 1,
-1.202858, 1.301277, -0.2608574, 1, 0.6588235, 0, 1,
-1.199226, 1.05705, -2.095184, 1, 0.6666667, 0, 1,
-1.181355, -0.2362987, -3.379668, 1, 0.6705883, 0, 1,
-1.173496, -0.3260662, -1.054022, 1, 0.6784314, 0, 1,
-1.161587, -0.05110043, -0.7074996, 1, 0.682353, 0, 1,
-1.158738, 1.594074, -1.815422, 1, 0.6901961, 0, 1,
-1.157536, -0.3801574, -3.119372, 1, 0.6941177, 0, 1,
-1.150426, 0.9484903, -0.6284164, 1, 0.7019608, 0, 1,
-1.146425, 0.863804, -1.149002, 1, 0.7098039, 0, 1,
-1.138782, -0.969635, -2.12532, 1, 0.7137255, 0, 1,
-1.13466, 0.7340957, -1.922542, 1, 0.7215686, 0, 1,
-1.131067, -0.302475, -1.853624, 1, 0.7254902, 0, 1,
-1.129627, -1.884442, -1.294491, 1, 0.7333333, 0, 1,
-1.117695, -0.3625184, -0.424832, 1, 0.7372549, 0, 1,
-1.116245, 0.03933979, -0.7043845, 1, 0.7450981, 0, 1,
-1.114531, -1.583514, -2.435226, 1, 0.7490196, 0, 1,
-1.11069, -0.07019252, -1.313446, 1, 0.7568628, 0, 1,
-1.108599, -1.012238, -3.148494, 1, 0.7607843, 0, 1,
-1.104673, 0.2428074, -0.4550517, 1, 0.7686275, 0, 1,
-1.100315, -0.9576623, -1.595601, 1, 0.772549, 0, 1,
-1.098874, -0.2271144, -1.252469, 1, 0.7803922, 0, 1,
-1.097664, 1.24486, -1.420667, 1, 0.7843137, 0, 1,
-1.094576, -0.7685347, -3.747806, 1, 0.7921569, 0, 1,
-1.091958, 0.6654035, -0.9493324, 1, 0.7960784, 0, 1,
-1.089393, -0.282045, -0.4654098, 1, 0.8039216, 0, 1,
-1.086826, -0.5388623, -1.418999, 1, 0.8117647, 0, 1,
-1.079903, -0.7022074, -1.074208, 1, 0.8156863, 0, 1,
-1.07819, 1.10489, -1.251103, 1, 0.8235294, 0, 1,
-1.074451, 1.841513, 0.03924053, 1, 0.827451, 0, 1,
-1.073651, -1.158716, -2.194163, 1, 0.8352941, 0, 1,
-1.06931, -2.073231, -1.946397, 1, 0.8392157, 0, 1,
-1.057079, -0.10139, -2.868693, 1, 0.8470588, 0, 1,
-1.055691, 1.172183, -1.928792, 1, 0.8509804, 0, 1,
-1.04554, -0.4395343, -1.797649, 1, 0.8588235, 0, 1,
-1.044116, -0.8269971, -2.329031, 1, 0.8627451, 0, 1,
-1.03797, 2.76621, -0.6933298, 1, 0.8705882, 0, 1,
-1.033708, 0.9950374, 0.2310059, 1, 0.8745098, 0, 1,
-1.031019, -0.290855, -3.840157, 1, 0.8823529, 0, 1,
-1.028764, -1.627941, -2.966191, 1, 0.8862745, 0, 1,
-1.021989, 1.552787, -0.929915, 1, 0.8941177, 0, 1,
-1.015511, -1.494315, -2.191312, 1, 0.8980392, 0, 1,
-1.014449, -0.9202816, -2.088542, 1, 0.9058824, 0, 1,
-1.007557, -0.3158001, -2.731712, 1, 0.9137255, 0, 1,
-1.002813, -0.5275753, -2.830139, 1, 0.9176471, 0, 1,
-0.998733, 0.6658368, -0.9606015, 1, 0.9254902, 0, 1,
-0.9843635, -1.903953, -1.518377, 1, 0.9294118, 0, 1,
-0.9692966, 1.705956, -0.04956365, 1, 0.9372549, 0, 1,
-0.9683288, 0.9527557, -1.630492, 1, 0.9411765, 0, 1,
-0.9552935, 0.2948471, -0.112272, 1, 0.9490196, 0, 1,
-0.9550104, -0.2188189, -1.110564, 1, 0.9529412, 0, 1,
-0.9515784, 0.0915104, -0.3860551, 1, 0.9607843, 0, 1,
-0.9483583, -0.009843901, -0.8966603, 1, 0.9647059, 0, 1,
-0.9438632, -0.9897386, -1.963959, 1, 0.972549, 0, 1,
-0.94136, -0.3211271, -2.177304, 1, 0.9764706, 0, 1,
-0.9371433, -0.5241857, -1.757527, 1, 0.9843137, 0, 1,
-0.9338002, -1.780759, -2.081385, 1, 0.9882353, 0, 1,
-0.9333896, -0.2045543, -0.238482, 1, 0.9960784, 0, 1,
-0.9330189, -2.522546, -4.546908, 0.9960784, 1, 0, 1,
-0.9292322, 0.9546405, -0.8106812, 0.9921569, 1, 0, 1,
-0.9272938, -0.3097819, -3.113447, 0.9843137, 1, 0, 1,
-0.9213825, 0.9733436, -1.303979, 0.9803922, 1, 0, 1,
-0.920801, -0.415479, -2.370268, 0.972549, 1, 0, 1,
-0.9198143, -0.3230967, -1.611186, 0.9686275, 1, 0, 1,
-0.9196673, -0.1003194, -1.145165, 0.9607843, 1, 0, 1,
-0.9181255, 0.4401184, 0.5914728, 0.9568627, 1, 0, 1,
-0.9170145, 0.4335535, 0.1591621, 0.9490196, 1, 0, 1,
-0.9139371, -1.387365, -0.8380268, 0.945098, 1, 0, 1,
-0.9126735, -1.367, -1.120873, 0.9372549, 1, 0, 1,
-0.9094055, -0.9610224, -4.338398, 0.9333333, 1, 0, 1,
-0.9075965, 0.8266751, -0.5592044, 0.9254902, 1, 0, 1,
-0.9051784, 2.279104, 0.74555, 0.9215686, 1, 0, 1,
-0.9050255, -0.458727, -2.676626, 0.9137255, 1, 0, 1,
-0.9049171, -0.1460031, 0.8692791, 0.9098039, 1, 0, 1,
-0.9013355, -2.147241, -2.556222, 0.9019608, 1, 0, 1,
-0.8959483, 1.010897, -1.336084, 0.8941177, 1, 0, 1,
-0.8956431, -1.816, -2.757151, 0.8901961, 1, 0, 1,
-0.8953618, 1.021289, -0.644055, 0.8823529, 1, 0, 1,
-0.8852335, 2.255316, -0.7784826, 0.8784314, 1, 0, 1,
-0.8833151, 0.2579544, -2.936571, 0.8705882, 1, 0, 1,
-0.8793529, -1.788922, -2.219941, 0.8666667, 1, 0, 1,
-0.8793455, 1.437563, -1.711985, 0.8588235, 1, 0, 1,
-0.8733008, -0.6273364, -2.854349, 0.854902, 1, 0, 1,
-0.8709748, -1.703049, -2.014446, 0.8470588, 1, 0, 1,
-0.8700431, 0.8242134, -2.561405, 0.8431373, 1, 0, 1,
-0.8672349, 0.07418026, -0.9132103, 0.8352941, 1, 0, 1,
-0.8668521, 1.047938, -1.803149, 0.8313726, 1, 0, 1,
-0.8592902, 0.422729, -2.084082, 0.8235294, 1, 0, 1,
-0.8565399, -0.9215873, -0.6989213, 0.8196079, 1, 0, 1,
-0.8551931, 0.2020115, 0.9883715, 0.8117647, 1, 0, 1,
-0.8516361, 0.7901557, -1.398587, 0.8078431, 1, 0, 1,
-0.8492309, 0.7547253, -1.174278, 0.8, 1, 0, 1,
-0.8487063, 0.07906716, -2.284557, 0.7921569, 1, 0, 1,
-0.8413193, 1.077309, 0.1969297, 0.7882353, 1, 0, 1,
-0.8368391, -0.457776, -2.832963, 0.7803922, 1, 0, 1,
-0.8270791, 0.334776, -1.65297, 0.7764706, 1, 0, 1,
-0.8251385, 0.6986175, -0.6731496, 0.7686275, 1, 0, 1,
-0.8249779, 0.962909, 1.003203, 0.7647059, 1, 0, 1,
-0.8238313, -0.5227674, -5.084363, 0.7568628, 1, 0, 1,
-0.8197113, 0.5426283, -1.209648, 0.7529412, 1, 0, 1,
-0.8164587, -0.05422775, -1.388321, 0.7450981, 1, 0, 1,
-0.8160893, 2.318407, -0.3671265, 0.7411765, 1, 0, 1,
-0.8098871, -0.526444, -3.491022, 0.7333333, 1, 0, 1,
-0.8061762, 0.7182158, -0.9791434, 0.7294118, 1, 0, 1,
-0.7980768, -0.4956832, -2.056499, 0.7215686, 1, 0, 1,
-0.7958832, -0.4613295, -4.335088, 0.7176471, 1, 0, 1,
-0.7831181, -0.4083708, -3.616278, 0.7098039, 1, 0, 1,
-0.7830247, 0.8968707, -0.1414619, 0.7058824, 1, 0, 1,
-0.7823369, 0.3677299, -0.3645732, 0.6980392, 1, 0, 1,
-0.7780557, 1.754139, 0.2474442, 0.6901961, 1, 0, 1,
-0.7776552, 0.4629368, -1.474742, 0.6862745, 1, 0, 1,
-0.7773471, -0.356311, -3.005407, 0.6784314, 1, 0, 1,
-0.7764025, -0.5293033, -1.421787, 0.6745098, 1, 0, 1,
-0.7751479, -1.278766, -1.612159, 0.6666667, 1, 0, 1,
-0.7722796, -0.009226899, -1.069721, 0.6627451, 1, 0, 1,
-0.7721291, -0.04550122, -0.1869269, 0.654902, 1, 0, 1,
-0.7682242, 1.501887, -2.046596, 0.6509804, 1, 0, 1,
-0.759142, -0.6454274, -1.707547, 0.6431373, 1, 0, 1,
-0.7575684, -0.3454614, -2.197356, 0.6392157, 1, 0, 1,
-0.7565215, 0.2571156, -3.026852, 0.6313726, 1, 0, 1,
-0.756295, 1.046052, -1.045151, 0.627451, 1, 0, 1,
-0.7557415, 1.793205, -1.775732, 0.6196079, 1, 0, 1,
-0.7554682, 2.535525, -0.4761665, 0.6156863, 1, 0, 1,
-0.7530597, -0.3743508, -0.954907, 0.6078432, 1, 0, 1,
-0.7513639, -0.6223122, -1.43706, 0.6039216, 1, 0, 1,
-0.7496551, -0.1361034, -2.246954, 0.5960785, 1, 0, 1,
-0.7482584, 0.1996199, -1.347685, 0.5882353, 1, 0, 1,
-0.7317867, -0.08405875, -0.1436008, 0.5843138, 1, 0, 1,
-0.7232557, -0.2915495, -0.6835225, 0.5764706, 1, 0, 1,
-0.7220844, 1.544231, 0.2129624, 0.572549, 1, 0, 1,
-0.7155511, 0.1915564, -1.879398, 0.5647059, 1, 0, 1,
-0.7148306, 0.6782932, -0.2367609, 0.5607843, 1, 0, 1,
-0.713698, 0.629966, -2.516209, 0.5529412, 1, 0, 1,
-0.7120638, -0.860272, -1.253118, 0.5490196, 1, 0, 1,
-0.7112114, 0.5753933, -1.207346, 0.5411765, 1, 0, 1,
-0.7077448, 1.031856, -0.7520663, 0.5372549, 1, 0, 1,
-0.7011992, 0.852163, -1.184859, 0.5294118, 1, 0, 1,
-0.6977923, 0.4288897, -1.107629, 0.5254902, 1, 0, 1,
-0.6943148, 1.006951, -0.101105, 0.5176471, 1, 0, 1,
-0.6900095, -0.8034493, -3.030507, 0.5137255, 1, 0, 1,
-0.6814508, -0.06309189, -2.727418, 0.5058824, 1, 0, 1,
-0.6800901, -0.9572176, -1.966182, 0.5019608, 1, 0, 1,
-0.6777041, 0.6538063, -2.927038, 0.4941176, 1, 0, 1,
-0.6765448, 0.4296829, -1.450343, 0.4862745, 1, 0, 1,
-0.673231, -0.5157781, -1.653816, 0.4823529, 1, 0, 1,
-0.6714088, -0.3674166, -1.871903, 0.4745098, 1, 0, 1,
-0.6611865, 0.3176093, -0.9243147, 0.4705882, 1, 0, 1,
-0.6605892, -0.05518871, -3.425195, 0.4627451, 1, 0, 1,
-0.657887, -0.5690098, -1.560338, 0.4588235, 1, 0, 1,
-0.6556019, -1.76652, -0.9976078, 0.4509804, 1, 0, 1,
-0.655471, -0.04959778, -1.730463, 0.4470588, 1, 0, 1,
-0.6536624, 1.19873, -0.9425449, 0.4392157, 1, 0, 1,
-0.652255, -2.196942, -0.7505524, 0.4352941, 1, 0, 1,
-0.6426621, 0.03543287, -0.8284268, 0.427451, 1, 0, 1,
-0.6395983, 1.849129, -1.839275, 0.4235294, 1, 0, 1,
-0.638097, -0.7532492, -3.955204, 0.4156863, 1, 0, 1,
-0.6358914, -0.7300249, -3.172945, 0.4117647, 1, 0, 1,
-0.6315697, 0.4438031, -1.424449, 0.4039216, 1, 0, 1,
-0.6266297, 0.09405709, -0.5041851, 0.3960784, 1, 0, 1,
-0.6246299, -0.08235721, -1.16367, 0.3921569, 1, 0, 1,
-0.6231742, -0.7324966, -3.329809, 0.3843137, 1, 0, 1,
-0.6226687, -0.07448138, -3.038, 0.3803922, 1, 0, 1,
-0.6143438, -0.04250242, -0.6874991, 0.372549, 1, 0, 1,
-0.6106123, -0.719478, -2.057321, 0.3686275, 1, 0, 1,
-0.610111, 1.205947, -1.212802, 0.3607843, 1, 0, 1,
-0.6101, -1.169808, -4.265533, 0.3568628, 1, 0, 1,
-0.6086673, -1.175932, -3.436936, 0.3490196, 1, 0, 1,
-0.6085225, 0.9269328, -1.082927, 0.345098, 1, 0, 1,
-0.60785, -0.2830192, -2.704912, 0.3372549, 1, 0, 1,
-0.6039423, -0.5677846, -3.26981, 0.3333333, 1, 0, 1,
-0.6022357, -1.027266, -1.850853, 0.3254902, 1, 0, 1,
-0.6018841, 1.172917, 0.604023, 0.3215686, 1, 0, 1,
-0.5949087, -1.68964, -2.149739, 0.3137255, 1, 0, 1,
-0.5943455, -0.7520952, -0.9775753, 0.3098039, 1, 0, 1,
-0.593973, -0.5203438, -2.02473, 0.3019608, 1, 0, 1,
-0.5936059, 0.3689105, 0.4961823, 0.2941177, 1, 0, 1,
-0.5932571, 0.2112322, -3.171628, 0.2901961, 1, 0, 1,
-0.5930478, -1.594661, -0.6655114, 0.282353, 1, 0, 1,
-0.5918825, 0.4531127, -1.693845, 0.2784314, 1, 0, 1,
-0.5886377, -0.01058549, -0.9245967, 0.2705882, 1, 0, 1,
-0.5883634, 0.6111296, -0.5210017, 0.2666667, 1, 0, 1,
-0.5883508, -0.06847645, -2.191461, 0.2588235, 1, 0, 1,
-0.5877036, -0.9668959, -3.044857, 0.254902, 1, 0, 1,
-0.5864722, -1.07647, -2.882553, 0.2470588, 1, 0, 1,
-0.5830861, -0.3023848, 0.2224834, 0.2431373, 1, 0, 1,
-0.5799884, 0.8966547, -1.108063, 0.2352941, 1, 0, 1,
-0.5794799, -1.453449, -4.386329, 0.2313726, 1, 0, 1,
-0.5784755, -0.6987778, -0.83232, 0.2235294, 1, 0, 1,
-0.5779993, -1.449441, -3.585838, 0.2196078, 1, 0, 1,
-0.5703256, -0.3855763, -1.54704, 0.2117647, 1, 0, 1,
-0.5684931, -1.102402, -1.150366, 0.2078431, 1, 0, 1,
-0.567137, -0.3385406, -1.564399, 0.2, 1, 0, 1,
-0.5668636, -1.141903, -3.469712, 0.1921569, 1, 0, 1,
-0.5642242, -0.09815236, -2.260835, 0.1882353, 1, 0, 1,
-0.5640125, 1.17888, -0.6421698, 0.1803922, 1, 0, 1,
-0.5582885, 0.1788429, -1.648545, 0.1764706, 1, 0, 1,
-0.5571763, 0.002050635, -0.994271, 0.1686275, 1, 0, 1,
-0.5556573, -0.9268955, -3.266493, 0.1647059, 1, 0, 1,
-0.5547842, -1.629927, -1.578176, 0.1568628, 1, 0, 1,
-0.5524865, -0.5677012, -4.733273, 0.1529412, 1, 0, 1,
-0.5466483, 0.3181581, -0.315513, 0.145098, 1, 0, 1,
-0.5465847, -1.311507, -4.696355, 0.1411765, 1, 0, 1,
-0.5417392, -0.7837824, -3.044129, 0.1333333, 1, 0, 1,
-0.535112, -0.9149678, -3.292724, 0.1294118, 1, 0, 1,
-0.5340998, 0.1870783, -1.579247, 0.1215686, 1, 0, 1,
-0.5254589, 0.2981108, -1.652425, 0.1176471, 1, 0, 1,
-0.5246256, 0.4884062, -1.449558, 0.1098039, 1, 0, 1,
-0.5179598, -0.342015, -2.302177, 0.1058824, 1, 0, 1,
-0.5154532, -0.3874112, -1.525408, 0.09803922, 1, 0, 1,
-0.5120671, -1.40266, -3.47328, 0.09019608, 1, 0, 1,
-0.5118681, -0.3652461, -1.267254, 0.08627451, 1, 0, 1,
-0.5098822, -0.1984546, -0.3040763, 0.07843138, 1, 0, 1,
-0.5068514, -1.85139, -3.217506, 0.07450981, 1, 0, 1,
-0.5061921, 0.2759855, -1.547371, 0.06666667, 1, 0, 1,
-0.4994559, 1.235608, -0.290805, 0.0627451, 1, 0, 1,
-0.4970382, 0.6129242, -1.061453, 0.05490196, 1, 0, 1,
-0.485814, -0.3145603, -2.672853, 0.05098039, 1, 0, 1,
-0.4826956, -0.1069027, -2.273546, 0.04313726, 1, 0, 1,
-0.4824345, -0.3965939, -1.91688, 0.03921569, 1, 0, 1,
-0.4805341, -1.068883, -3.586554, 0.03137255, 1, 0, 1,
-0.4747436, 0.8603515, -2.130523, 0.02745098, 1, 0, 1,
-0.4705856, -0.9873397, -2.94582, 0.01960784, 1, 0, 1,
-0.4697704, 1.531636, 0.1146595, 0.01568628, 1, 0, 1,
-0.467652, -0.7811202, -3.31259, 0.007843138, 1, 0, 1,
-0.4658547, 0.3723277, -0.8691587, 0.003921569, 1, 0, 1,
-0.462703, 1.041454, 0.2534287, 0, 1, 0.003921569, 1,
-0.4601071, -0.4686695, -1.881645, 0, 1, 0.01176471, 1,
-0.4599783, -1.144697, -3.613742, 0, 1, 0.01568628, 1,
-0.4550158, 0.4354249, -0.7261298, 0, 1, 0.02352941, 1,
-0.4501394, 0.3527196, -1.947529, 0, 1, 0.02745098, 1,
-0.4464423, 0.4960977, -1.580313, 0, 1, 0.03529412, 1,
-0.446144, 0.2025666, -0.3317547, 0, 1, 0.03921569, 1,
-0.4458443, -0.02198721, -2.196701, 0, 1, 0.04705882, 1,
-0.444834, 0.03752151, -1.285599, 0, 1, 0.05098039, 1,
-0.4423549, -0.1866957, -0.7843482, 0, 1, 0.05882353, 1,
-0.4420711, -1.836654, -2.722957, 0, 1, 0.0627451, 1,
-0.4411314, -1.120346, -4.094263, 0, 1, 0.07058824, 1,
-0.4377647, -2.002604, -2.84303, 0, 1, 0.07450981, 1,
-0.4320042, -1.101261, -3.593989, 0, 1, 0.08235294, 1,
-0.4297239, -0.3128276, -1.846487, 0, 1, 0.08627451, 1,
-0.428573, -2.784546, -3.850864, 0, 1, 0.09411765, 1,
-0.4273124, -0.4905637, -3.077779, 0, 1, 0.1019608, 1,
-0.423751, -0.3664871, -0.5459931, 0, 1, 0.1058824, 1,
-0.4209043, 0.2711397, -0.80481, 0, 1, 0.1137255, 1,
-0.4204245, 1.846218, -0.8077869, 0, 1, 0.1176471, 1,
-0.4153913, -1.392438, -2.588062, 0, 1, 0.1254902, 1,
-0.4124929, 1.841659, -0.7314051, 0, 1, 0.1294118, 1,
-0.4123611, -0.2017165, -1.674154, 0, 1, 0.1372549, 1,
-0.4080664, 0.454737, -0.9612797, 0, 1, 0.1411765, 1,
-0.4079405, 0.1169418, -0.5959775, 0, 1, 0.1490196, 1,
-0.4038488, 1.726198, -0.7566487, 0, 1, 0.1529412, 1,
-0.3992231, -1.365306, -2.116029, 0, 1, 0.1607843, 1,
-0.3988573, 0.3748533, 0.4414711, 0, 1, 0.1647059, 1,
-0.3962729, 0.2572562, 0.01267047, 0, 1, 0.172549, 1,
-0.3892187, -0.4706532, -0.9862294, 0, 1, 0.1764706, 1,
-0.3883129, -0.4367559, -2.679668, 0, 1, 0.1843137, 1,
-0.3882993, -0.4819193, -2.307128, 0, 1, 0.1882353, 1,
-0.3800359, 1.528893, -1.032223, 0, 1, 0.1960784, 1,
-0.3743223, 0.4059289, -2.349952, 0, 1, 0.2039216, 1,
-0.3701392, 0.3825239, -1.886273, 0, 1, 0.2078431, 1,
-0.367308, -1.022755, -3.494675, 0, 1, 0.2156863, 1,
-0.3618683, 0.8272483, -0.4775423, 0, 1, 0.2196078, 1,
-0.3612612, -1.250622, -1.568107, 0, 1, 0.227451, 1,
-0.358873, -1.115362, -0.1471882, 0, 1, 0.2313726, 1,
-0.3584074, 0.1141114, -1.052291, 0, 1, 0.2392157, 1,
-0.3574777, 0.5520586, -0.5573747, 0, 1, 0.2431373, 1,
-0.3574572, 0.460638, -2.554436, 0, 1, 0.2509804, 1,
-0.356428, 1.538365, -0.0868181, 0, 1, 0.254902, 1,
-0.3551517, 0.3065972, -2.970224, 0, 1, 0.2627451, 1,
-0.3541295, -1.412746, -3.162352, 0, 1, 0.2666667, 1,
-0.3537422, 0.853099, 0.7972051, 0, 1, 0.2745098, 1,
-0.3525025, 0.8691607, -1.047649, 0, 1, 0.2784314, 1,
-0.3503611, 0.7070587, -1.424963, 0, 1, 0.2862745, 1,
-0.3458041, 1.663684, -1.092386, 0, 1, 0.2901961, 1,
-0.3440944, 0.3981589, -0.7790385, 0, 1, 0.2980392, 1,
-0.342913, -0.3766747, -2.823153, 0, 1, 0.3058824, 1,
-0.3424321, 0.8173912, 0.03795815, 0, 1, 0.3098039, 1,
-0.3423514, -1.360893, -3.29401, 0, 1, 0.3176471, 1,
-0.341502, -0.3077485, -3.264494, 0, 1, 0.3215686, 1,
-0.3396171, -0.832979, -1.174118, 0, 1, 0.3294118, 1,
-0.3393147, 0.8076981, -0.9014442, 0, 1, 0.3333333, 1,
-0.3391058, 0.706878, -1.05522, 0, 1, 0.3411765, 1,
-0.33582, -0.9509541, -1.860982, 0, 1, 0.345098, 1,
-0.3320812, -0.3493529, -0.9989507, 0, 1, 0.3529412, 1,
-0.3287239, -0.3194752, -2.648856, 0, 1, 0.3568628, 1,
-0.3284696, 1.589504, -1.720104, 0, 1, 0.3647059, 1,
-0.3222887, 0.2042595, -1.305429, 0, 1, 0.3686275, 1,
-0.320818, 0.6214123, 0.1230092, 0, 1, 0.3764706, 1,
-0.3199181, 1.359802, 1.526155, 0, 1, 0.3803922, 1,
-0.3172115, 0.3135029, -1.627458, 0, 1, 0.3882353, 1,
-0.3164474, 0.2507552, -1.16778, 0, 1, 0.3921569, 1,
-0.3134721, -0.2308566, -0.1784139, 0, 1, 0.4, 1,
-0.3104121, -0.6906601, -3.219686, 0, 1, 0.4078431, 1,
-0.3068828, -0.03058689, -0.5216987, 0, 1, 0.4117647, 1,
-0.3050124, 0.143408, -1.496449, 0, 1, 0.4196078, 1,
-0.2995757, 0.9498597, -0.4945879, 0, 1, 0.4235294, 1,
-0.2955598, 1.275388, -0.6905802, 0, 1, 0.4313726, 1,
-0.2914051, 0.7202582, -0.4273297, 0, 1, 0.4352941, 1,
-0.2881602, 1.884985, -0.4253688, 0, 1, 0.4431373, 1,
-0.2874063, -1.584511, -4.649275, 0, 1, 0.4470588, 1,
-0.2864118, 1.635107, 0.1760774, 0, 1, 0.454902, 1,
-0.2857001, 1.817616, 0.1248056, 0, 1, 0.4588235, 1,
-0.2793429, 2.254341, 2.565462, 0, 1, 0.4666667, 1,
-0.2788543, -1.554163, -5.135917, 0, 1, 0.4705882, 1,
-0.2757027, 1.251964, 0.7002457, 0, 1, 0.4784314, 1,
-0.2741886, -1.076045, -3.740373, 0, 1, 0.4823529, 1,
-0.2656168, -0.8914928, -2.063133, 0, 1, 0.4901961, 1,
-0.2646988, 1.045033, 0.8180472, 0, 1, 0.4941176, 1,
-0.264236, 0.3453796, -1.739994, 0, 1, 0.5019608, 1,
-0.262116, 0.2880762, -2.563588, 0, 1, 0.509804, 1,
-0.2596225, -0.1133459, -1.507648, 0, 1, 0.5137255, 1,
-0.2593556, 0.3916187, 1.403647, 0, 1, 0.5215687, 1,
-0.2536305, -0.09599123, -2.158057, 0, 1, 0.5254902, 1,
-0.2523173, -0.2961153, -3.715714, 0, 1, 0.5333334, 1,
-0.2521932, -0.08465513, -1.690511, 0, 1, 0.5372549, 1,
-0.2507223, -0.9406764, -3.977504, 0, 1, 0.5450981, 1,
-0.2461654, 0.3600898, 0.3297704, 0, 1, 0.5490196, 1,
-0.24435, 0.503682, -1.394307, 0, 1, 0.5568628, 1,
-0.2426718, -0.7647133, -2.581836, 0, 1, 0.5607843, 1,
-0.2425903, -0.2521303, -2.324763, 0, 1, 0.5686275, 1,
-0.2378915, -0.9499711, -3.618546, 0, 1, 0.572549, 1,
-0.237123, 0.7941244, 0.06464416, 0, 1, 0.5803922, 1,
-0.2370118, 0.2990098, 1.151329, 0, 1, 0.5843138, 1,
-0.2256235, 0.1820074, -0.1935175, 0, 1, 0.5921569, 1,
-0.2249244, -1.816152, -3.188946, 0, 1, 0.5960785, 1,
-0.2245116, 0.7936985, 0.123831, 0, 1, 0.6039216, 1,
-0.2241067, -0.4071609, -1.759445, 0, 1, 0.6117647, 1,
-0.223816, -1.086117, -3.577842, 0, 1, 0.6156863, 1,
-0.221323, 0.1201658, -0.7648095, 0, 1, 0.6235294, 1,
-0.2212932, -0.08798324, -2.505981, 0, 1, 0.627451, 1,
-0.2183613, 0.5421096, 0.6961632, 0, 1, 0.6352941, 1,
-0.2176769, -1.300451, -4.561189, 0, 1, 0.6392157, 1,
-0.2161937, 1.749829, 1.325637, 0, 1, 0.6470588, 1,
-0.2137724, -0.4704196, -2.513505, 0, 1, 0.6509804, 1,
-0.2078402, 0.4890043, 0.692732, 0, 1, 0.6588235, 1,
-0.1981688, 1.17646, 0.0776004, 0, 1, 0.6627451, 1,
-0.1914569, -0.7778808, -2.308902, 0, 1, 0.6705883, 1,
-0.1806071, -0.4562949, -1.53723, 0, 1, 0.6745098, 1,
-0.1725798, -0.7404101, -3.036859, 0, 1, 0.682353, 1,
-0.1690513, 0.1436414, -0.4145997, 0, 1, 0.6862745, 1,
-0.1664036, 0.9941866, 0.2757888, 0, 1, 0.6941177, 1,
-0.1663472, -1.800951, -4.252223, 0, 1, 0.7019608, 1,
-0.1597073, -0.4035004, -3.981348, 0, 1, 0.7058824, 1,
-0.1568623, -1.073384, -3.552738, 0, 1, 0.7137255, 1,
-0.1536855, -0.4183315, -4.536152, 0, 1, 0.7176471, 1,
-0.151872, -0.7863451, -4.133405, 0, 1, 0.7254902, 1,
-0.1501346, 0.1542677, 1.355994, 0, 1, 0.7294118, 1,
-0.1493288, -1.03879, -1.70631, 0, 1, 0.7372549, 1,
-0.1464823, 1.583998, -1.221825, 0, 1, 0.7411765, 1,
-0.1458033, 1.205238, 1.302386, 0, 1, 0.7490196, 1,
-0.144625, 0.6339521, 0.2611487, 0, 1, 0.7529412, 1,
-0.1406908, 0.00502881, 1.394287, 0, 1, 0.7607843, 1,
-0.1388024, -0.008664962, -1.357827, 0, 1, 0.7647059, 1,
-0.1345449, -0.2936455, -4.427711, 0, 1, 0.772549, 1,
-0.1302399, 1.169429, 1.11239, 0, 1, 0.7764706, 1,
-0.127223, -0.4456112, -3.483724, 0, 1, 0.7843137, 1,
-0.125474, 0.2258614, -0.6982124, 0, 1, 0.7882353, 1,
-0.1245518, 0.794865, -0.9264081, 0, 1, 0.7960784, 1,
-0.1142206, 0.08475183, 0.5509412, 0, 1, 0.8039216, 1,
-0.1119886, 2.03854, -1.572847, 0, 1, 0.8078431, 1,
-0.1066388, -1.601989, -4.506921, 0, 1, 0.8156863, 1,
-0.1064912, -0.1911337, -1.870943, 0, 1, 0.8196079, 1,
-0.1059095, 0.9302837, -0.2609659, 0, 1, 0.827451, 1,
-0.1056971, 0.5187356, -0.2726152, 0, 1, 0.8313726, 1,
-0.1029638, 1.451466, 0.9019529, 0, 1, 0.8392157, 1,
-0.1027908, -2.525696, -1.544863, 0, 1, 0.8431373, 1,
-0.09891979, -1.06111, -4.703741, 0, 1, 0.8509804, 1,
-0.09840981, 0.6629437, 0.2094482, 0, 1, 0.854902, 1,
-0.09832247, -0.4568777, -1.863879, 0, 1, 0.8627451, 1,
-0.0962881, 0.145489, 0.668022, 0, 1, 0.8666667, 1,
-0.09531822, 1.128783, -0.1091985, 0, 1, 0.8745098, 1,
-0.08928978, 0.2254051, -0.7347752, 0, 1, 0.8784314, 1,
-0.07977321, -0.8285594, -3.283725, 0, 1, 0.8862745, 1,
-0.07317559, 0.3795525, -0.4306331, 0, 1, 0.8901961, 1,
-0.07129627, -0.3333267, -2.450291, 0, 1, 0.8980392, 1,
-0.07046995, -0.8255126, -1.736923, 0, 1, 0.9058824, 1,
-0.06883109, 0.7787172, 0.2538213, 0, 1, 0.9098039, 1,
-0.06797986, -2.021859, -2.930646, 0, 1, 0.9176471, 1,
-0.06612705, 1.313896, 0.5552744, 0, 1, 0.9215686, 1,
-0.0652495, 0.6903926, 1.899218, 0, 1, 0.9294118, 1,
-0.06492393, -1.048537, -3.78166, 0, 1, 0.9333333, 1,
-0.06184115, 0.8525936, -0.6515486, 0, 1, 0.9411765, 1,
-0.058074, 0.4102118, -0.1357395, 0, 1, 0.945098, 1,
-0.05605656, -0.1752753, -1.219519, 0, 1, 0.9529412, 1,
-0.05570243, 0.8136014, -0.4673137, 0, 1, 0.9568627, 1,
-0.05323166, -0.6000747, -3.835548, 0, 1, 0.9647059, 1,
-0.05175138, 2.66779, -0.7047042, 0, 1, 0.9686275, 1,
-0.0510974, 2.241554, 0.4916423, 0, 1, 0.9764706, 1,
-0.04917033, 1.144811, 0.8123819, 0, 1, 0.9803922, 1,
-0.04636467, 0.25048, -1.331012, 0, 1, 0.9882353, 1,
-0.04275927, 1.506889, 1.20871, 0, 1, 0.9921569, 1,
-0.03482542, -0.2331515, -3.627034, 0, 1, 1, 1,
-0.03404318, 0.3153496, -1.158273, 0, 0.9921569, 1, 1,
-0.03069757, 0.8246841, 1.092355, 0, 0.9882353, 1, 1,
-0.03006937, 0.4429692, 0.5488429, 0, 0.9803922, 1, 1,
-0.02698032, 0.6198209, -1.054737, 0, 0.9764706, 1, 1,
-0.02280152, -1.21173, -4.140983, 0, 0.9686275, 1, 1,
-0.02247495, -2.172193, -1.801161, 0, 0.9647059, 1, 1,
-0.02092372, -1.139635, -3.964347, 0, 0.9568627, 1, 1,
-0.0206609, -1.031006, -3.197296, 0, 0.9529412, 1, 1,
-0.004073946, 0.4713213, 0.1619072, 0, 0.945098, 1, 1,
-0.002253094, 0.1987018, -1.523519, 0, 0.9411765, 1, 1,
-0.000725747, 0.5533548, 0.8905874, 0, 0.9333333, 1, 1,
0.001247928, -0.2210817, 2.407038, 0, 0.9294118, 1, 1,
0.002088223, -0.7636642, 5.102612, 0, 0.9215686, 1, 1,
0.003802247, -0.01009805, 3.32129, 0, 0.9176471, 1, 1,
0.004199557, -0.06962057, 2.82541, 0, 0.9098039, 1, 1,
0.004666585, 0.2664998, -0.7164974, 0, 0.9058824, 1, 1,
0.006564103, -0.604334, 3.8414, 0, 0.8980392, 1, 1,
0.007127719, -0.0531419, 3.822415, 0, 0.8901961, 1, 1,
0.01043047, -0.1458194, 2.122787, 0, 0.8862745, 1, 1,
0.01669749, -0.6682318, 4.117509, 0, 0.8784314, 1, 1,
0.01860766, 0.7459805, -1.199033, 0, 0.8745098, 1, 1,
0.02544369, 1.16204, -0.4656048, 0, 0.8666667, 1, 1,
0.02726055, 0.8285775, 1.666618, 0, 0.8627451, 1, 1,
0.02777244, 0.22161, 1.349798, 0, 0.854902, 1, 1,
0.03554099, -0.7440006, 4.577922, 0, 0.8509804, 1, 1,
0.03562969, 0.2299696, -0.3265331, 0, 0.8431373, 1, 1,
0.03750028, -1.664292, 3.967414, 0, 0.8392157, 1, 1,
0.04097217, -0.6626409, 3.877492, 0, 0.8313726, 1, 1,
0.04427474, -1.799105, 2.215573, 0, 0.827451, 1, 1,
0.04441819, -0.1095233, 3.547145, 0, 0.8196079, 1, 1,
0.04629684, 1.83257, 1.686215, 0, 0.8156863, 1, 1,
0.04676076, 0.1066498, 0.7132967, 0, 0.8078431, 1, 1,
0.04923372, 0.7527008, -0.1510694, 0, 0.8039216, 1, 1,
0.04975176, -0.5295723, 1.418826, 0, 0.7960784, 1, 1,
0.0514209, -1.119061, 4.119672, 0, 0.7882353, 1, 1,
0.05462663, -0.004421018, 3.735766, 0, 0.7843137, 1, 1,
0.0554265, -0.3355511, 4.40367, 0, 0.7764706, 1, 1,
0.05793399, -0.7168515, 2.660468, 0, 0.772549, 1, 1,
0.0583111, -0.8918411, 3.336086, 0, 0.7647059, 1, 1,
0.06491753, 0.7796295, 0.5036623, 0, 0.7607843, 1, 1,
0.06606204, 0.1061043, -0.3700329, 0, 0.7529412, 1, 1,
0.06694126, 0.911194, 1.176359, 0, 0.7490196, 1, 1,
0.07086617, 1.345243, 1.404509, 0, 0.7411765, 1, 1,
0.07110038, 1.326132, -0.1964249, 0, 0.7372549, 1, 1,
0.07311483, -0.6107405, 2.011918, 0, 0.7294118, 1, 1,
0.07344373, 0.5810394, 1.196977, 0, 0.7254902, 1, 1,
0.07725286, 1.708626, -0.5551777, 0, 0.7176471, 1, 1,
0.08072937, -0.9226626, 2.514738, 0, 0.7137255, 1, 1,
0.08355742, -1.000924, 3.117299, 0, 0.7058824, 1, 1,
0.08629838, -1.032228, 3.614805, 0, 0.6980392, 1, 1,
0.09306364, -0.5264325, 3.763427, 0, 0.6941177, 1, 1,
0.09369142, 1.691005, -0.4739546, 0, 0.6862745, 1, 1,
0.09410194, 0.4075753, -0.7961606, 0, 0.682353, 1, 1,
0.1008235, 0.2119793, 2.650037, 0, 0.6745098, 1, 1,
0.1017423, 0.4096124, 1.017323, 0, 0.6705883, 1, 1,
0.1035671, -0.8985369, 3.598879, 0, 0.6627451, 1, 1,
0.107171, -0.5597965, 2.387159, 0, 0.6588235, 1, 1,
0.1087829, 1.157789, 1.05058, 0, 0.6509804, 1, 1,
0.1095018, -0.2404375, 1.913089, 0, 0.6470588, 1, 1,
0.1095907, 1.60995, -1.313256, 0, 0.6392157, 1, 1,
0.1098932, -0.3295561, 3.388594, 0, 0.6352941, 1, 1,
0.1104442, 0.8097985, -0.07964866, 0, 0.627451, 1, 1,
0.1128733, 0.4858674, -0.3113404, 0, 0.6235294, 1, 1,
0.1188975, -0.9849117, 2.633854, 0, 0.6156863, 1, 1,
0.1215306, 0.6205083, -0.008460101, 0, 0.6117647, 1, 1,
0.1243173, 1.597149, -0.2179749, 0, 0.6039216, 1, 1,
0.1257051, -0.8526502, 2.064002, 0, 0.5960785, 1, 1,
0.1299102, -0.3667752, 2.596327, 0, 0.5921569, 1, 1,
0.1326215, 1.583577, 0.09262412, 0, 0.5843138, 1, 1,
0.1335237, -1.279554, 3.064546, 0, 0.5803922, 1, 1,
0.1346162, 0.1767192, 1.927403, 0, 0.572549, 1, 1,
0.1356586, 0.1036625, 0.613244, 0, 0.5686275, 1, 1,
0.13764, -0.4077236, 3.984377, 0, 0.5607843, 1, 1,
0.1415858, -1.071744, 4.346109, 0, 0.5568628, 1, 1,
0.1482883, 1.450072, 0.629438, 0, 0.5490196, 1, 1,
0.150118, -0.03769908, 1.788644, 0, 0.5450981, 1, 1,
0.1506245, -0.7564859, 2.186839, 0, 0.5372549, 1, 1,
0.1577874, 0.379043, -0.1520381, 0, 0.5333334, 1, 1,
0.160929, 0.881435, 0.6601748, 0, 0.5254902, 1, 1,
0.1615249, -0.4933757, 2.773964, 0, 0.5215687, 1, 1,
0.161538, 0.5693477, -0.5636815, 0, 0.5137255, 1, 1,
0.1627098, 0.1502185, 1.493686, 0, 0.509804, 1, 1,
0.1637964, 1.165163, 0.5030165, 0, 0.5019608, 1, 1,
0.1669948, 0.2501014, -1.005238, 0, 0.4941176, 1, 1,
0.1674657, 0.1687659, 2.196698, 0, 0.4901961, 1, 1,
0.1677893, 0.1142386, 1.216444, 0, 0.4823529, 1, 1,
0.1679106, -0.718058, 3.151555, 0, 0.4784314, 1, 1,
0.1744208, -0.977432, 4.719553, 0, 0.4705882, 1, 1,
0.1767008, 0.5121233, 0.1992476, 0, 0.4666667, 1, 1,
0.1801346, -0.1797889, 2.503748, 0, 0.4588235, 1, 1,
0.1830752, 0.7722564, -0.8120453, 0, 0.454902, 1, 1,
0.183512, 0.2805933, -1.054916, 0, 0.4470588, 1, 1,
0.1843314, 0.6104264, 0.4206493, 0, 0.4431373, 1, 1,
0.1863431, 1.126703, 0.690512, 0, 0.4352941, 1, 1,
0.1889935, 0.1608055, 1.01407, 0, 0.4313726, 1, 1,
0.1962432, -0.6233641, 2.738867, 0, 0.4235294, 1, 1,
0.1986025, 2.075735, -0.6117612, 0, 0.4196078, 1, 1,
0.1986109, 1.365515, -0.3997681, 0, 0.4117647, 1, 1,
0.2026728, -1.721341, 0.8514455, 0, 0.4078431, 1, 1,
0.2085365, 0.7845457, 1.135624, 0, 0.4, 1, 1,
0.2103307, -1.678128, 3.262089, 0, 0.3921569, 1, 1,
0.2136306, -1.673855, 2.772766, 0, 0.3882353, 1, 1,
0.2180458, -0.4665639, 1.866603, 0, 0.3803922, 1, 1,
0.2258921, 0.3254451, 3.546169, 0, 0.3764706, 1, 1,
0.2266682, 0.7126913, 0.1016718, 0, 0.3686275, 1, 1,
0.2379383, 2.060732, 1.735613, 0, 0.3647059, 1, 1,
0.2394668, -0.3668944, 2.747526, 0, 0.3568628, 1, 1,
0.2405633, -0.6042461, 3.533048, 0, 0.3529412, 1, 1,
0.2419192, -0.844816, 4.209741, 0, 0.345098, 1, 1,
0.2459127, -0.5637713, 2.801098, 0, 0.3411765, 1, 1,
0.2501759, -0.656813, 3.997693, 0, 0.3333333, 1, 1,
0.2523846, 1.112, -1.704512, 0, 0.3294118, 1, 1,
0.2580186, -0.3311253, 1.704891, 0, 0.3215686, 1, 1,
0.259876, -0.2333542, 2.339879, 0, 0.3176471, 1, 1,
0.2613948, 0.7162397, 1.733853, 0, 0.3098039, 1, 1,
0.2631905, 1.049222, 0.3183661, 0, 0.3058824, 1, 1,
0.2638746, 1.106398, 1.383169, 0, 0.2980392, 1, 1,
0.2648177, -0.4329764, 2.261853, 0, 0.2901961, 1, 1,
0.2698421, 0.01009094, 0.5069149, 0, 0.2862745, 1, 1,
0.2707261, -0.2983454, 2.094701, 0, 0.2784314, 1, 1,
0.2712024, -0.2215421, 3.448188, 0, 0.2745098, 1, 1,
0.276187, 1.382345, 1.469002, 0, 0.2666667, 1, 1,
0.2807844, 1.255815, -0.4109844, 0, 0.2627451, 1, 1,
0.2916878, 0.8768386, 1.636503, 0, 0.254902, 1, 1,
0.2943347, 2.295875, -0.8055211, 0, 0.2509804, 1, 1,
0.2957362, -1.639478, 2.181886, 0, 0.2431373, 1, 1,
0.3021037, 1.24861, 1.333848, 0, 0.2392157, 1, 1,
0.3054265, 1.348532, -1.154172, 0, 0.2313726, 1, 1,
0.3059094, 0.8524413, 1.593664, 0, 0.227451, 1, 1,
0.3069469, -0.6735439, 3.119848, 0, 0.2196078, 1, 1,
0.3071364, -0.09512205, 2.116714, 0, 0.2156863, 1, 1,
0.3166274, 0.54256, 0.3023522, 0, 0.2078431, 1, 1,
0.3182457, -1.198057, 3.574883, 0, 0.2039216, 1, 1,
0.3191627, 0.5324358, 1.369178, 0, 0.1960784, 1, 1,
0.3212493, 0.1741785, 0.2191283, 0, 0.1882353, 1, 1,
0.3243248, -0.6174836, 3.991282, 0, 0.1843137, 1, 1,
0.3268648, -0.3025614, 1.833565, 0, 0.1764706, 1, 1,
0.3269702, -0.7904931, 2.59123, 0, 0.172549, 1, 1,
0.3280425, -1.245308, 3.027743, 0, 0.1647059, 1, 1,
0.3282343, -0.3299075, 2.299713, 0, 0.1607843, 1, 1,
0.3282682, 0.3876078, -0.8271685, 0, 0.1529412, 1, 1,
0.3336908, -0.2636593, 2.197425, 0, 0.1490196, 1, 1,
0.3352033, 0.9273176, 0.7049401, 0, 0.1411765, 1, 1,
0.3435677, -0.3781338, 2.534281, 0, 0.1372549, 1, 1,
0.3490591, 0.4664173, -0.2141538, 0, 0.1294118, 1, 1,
0.3515638, -1.255891, 2.979139, 0, 0.1254902, 1, 1,
0.3522491, -0.1084078, 2.689322, 0, 0.1176471, 1, 1,
0.3570662, 0.07868612, 3.110877, 0, 0.1137255, 1, 1,
0.3598829, -0.4755465, 2.084852, 0, 0.1058824, 1, 1,
0.3637733, -0.9743176, 2.318115, 0, 0.09803922, 1, 1,
0.3656514, -1.297299, 4.52703, 0, 0.09411765, 1, 1,
0.370483, -1.538891, 3.640986, 0, 0.08627451, 1, 1,
0.3754087, 0.5359834, 1.531461, 0, 0.08235294, 1, 1,
0.3801034, 0.1217431, -1.254181, 0, 0.07450981, 1, 1,
0.3816002, -0.03119746, 1.082811, 0, 0.07058824, 1, 1,
0.3837964, 0.4383927, -0.4785898, 0, 0.0627451, 1, 1,
0.3962402, -1.83221, 4.386928, 0, 0.05882353, 1, 1,
0.4024778, 0.7771617, -0.9012769, 0, 0.05098039, 1, 1,
0.404551, -0.4809517, 2.692471, 0, 0.04705882, 1, 1,
0.4060411, -1.488276, 3.676032, 0, 0.03921569, 1, 1,
0.4088993, -0.826449, 2.009991, 0, 0.03529412, 1, 1,
0.4095267, 2.073151, 0.4693294, 0, 0.02745098, 1, 1,
0.4101877, -0.3887843, 2.115587, 0, 0.02352941, 1, 1,
0.4133419, -0.3868768, 2.971429, 0, 0.01568628, 1, 1,
0.4143729, 0.1699766, 0.8988313, 0, 0.01176471, 1, 1,
0.4147623, 0.2180713, 2.755526, 0, 0.003921569, 1, 1,
0.4150698, -1.18773, 2.011202, 0.003921569, 0, 1, 1,
0.4154839, -0.3192488, 2.885327, 0.007843138, 0, 1, 1,
0.4186876, -1.408565, 2.790364, 0.01568628, 0, 1, 1,
0.4188278, -0.9538203, 1.087794, 0.01960784, 0, 1, 1,
0.421241, -0.8282192, 2.833601, 0.02745098, 0, 1, 1,
0.4258198, -1.116536, 3.942122, 0.03137255, 0, 1, 1,
0.4275025, -0.2973396, 1.876384, 0.03921569, 0, 1, 1,
0.4328886, -1.385667, 2.974448, 0.04313726, 0, 1, 1,
0.4333797, 0.394913, 0.7853287, 0.05098039, 0, 1, 1,
0.434472, 0.2305544, 0.5164954, 0.05490196, 0, 1, 1,
0.4394199, -0.4052302, 0.8326188, 0.0627451, 0, 1, 1,
0.4450042, -1.198314, 3.967375, 0.06666667, 0, 1, 1,
0.4612935, -1.261095, 3.904013, 0.07450981, 0, 1, 1,
0.4671761, 1.495353, 0.937734, 0.07843138, 0, 1, 1,
0.4677852, 0.1141893, 0.8794194, 0.08627451, 0, 1, 1,
0.471456, 0.811873, -0.9857418, 0.09019608, 0, 1, 1,
0.4805538, -0.05485332, 1.11083, 0.09803922, 0, 1, 1,
0.4809109, 1.077974, 0.5425081, 0.1058824, 0, 1, 1,
0.482183, 1.772747, 0.2265222, 0.1098039, 0, 1, 1,
0.4828784, -0.6095576, 2.534239, 0.1176471, 0, 1, 1,
0.4841193, -1.598224, 1.960485, 0.1215686, 0, 1, 1,
0.4973748, -0.7712654, 3.804251, 0.1294118, 0, 1, 1,
0.5016361, -1.445274, 4.004184, 0.1333333, 0, 1, 1,
0.502407, 0.4978387, 2.04714, 0.1411765, 0, 1, 1,
0.5085787, -1.833333, 2.579549, 0.145098, 0, 1, 1,
0.5111781, 0.6240799, -0.09142708, 0.1529412, 0, 1, 1,
0.5117257, 0.06413735, 0.5117104, 0.1568628, 0, 1, 1,
0.5130559, 0.1528398, 1.487554, 0.1647059, 0, 1, 1,
0.5145187, 0.287747, -0.1160944, 0.1686275, 0, 1, 1,
0.5148247, -0.6846097, 1.32672, 0.1764706, 0, 1, 1,
0.5161432, -0.9513001, 3.082524, 0.1803922, 0, 1, 1,
0.5170962, -0.6635152, 3.433402, 0.1882353, 0, 1, 1,
0.5214117, 0.2362995, 0.6370831, 0.1921569, 0, 1, 1,
0.5235111, 1.305941, -0.2293337, 0.2, 0, 1, 1,
0.5258933, 0.644775, 1.942439, 0.2078431, 0, 1, 1,
0.5282357, 0.1962847, 2.335449, 0.2117647, 0, 1, 1,
0.5322383, -0.09796395, 1.827766, 0.2196078, 0, 1, 1,
0.53736, -1.200112, 2.083036, 0.2235294, 0, 1, 1,
0.5380938, 0.4647084, -0.2635043, 0.2313726, 0, 1, 1,
0.5408664, 0.5136405, 1.450814, 0.2352941, 0, 1, 1,
0.5434021, 0.7967796, 0.4594821, 0.2431373, 0, 1, 1,
0.551283, -0.1157123, 1.396719, 0.2470588, 0, 1, 1,
0.5520213, 0.9554837, -0.7688223, 0.254902, 0, 1, 1,
0.5546168, -0.2554499, 1.59694, 0.2588235, 0, 1, 1,
0.5554963, -0.9073561, 2.001766, 0.2666667, 0, 1, 1,
0.5595961, -0.6549075, 2.627911, 0.2705882, 0, 1, 1,
0.5619348, -1.004795, 3.608831, 0.2784314, 0, 1, 1,
0.5655497, 0.7385491, -0.00669969, 0.282353, 0, 1, 1,
0.566545, 0.327225, 0.9538174, 0.2901961, 0, 1, 1,
0.5674449, -1.684784, 2.624008, 0.2941177, 0, 1, 1,
0.5689113, 0.8057773, -0.3672126, 0.3019608, 0, 1, 1,
0.5712938, 0.3683397, 1.595578, 0.3098039, 0, 1, 1,
0.5726669, -0.3731157, 1.643755, 0.3137255, 0, 1, 1,
0.5739319, 0.01003672, 1.797812, 0.3215686, 0, 1, 1,
0.5773312, -0.7190304, 1.891177, 0.3254902, 0, 1, 1,
0.5800653, 1.644472, 0.8953828, 0.3333333, 0, 1, 1,
0.5843282, 1.247788, 0.6553522, 0.3372549, 0, 1, 1,
0.5877206, -1.392017, 3.402741, 0.345098, 0, 1, 1,
0.6000457, -0.4152694, 1.080619, 0.3490196, 0, 1, 1,
0.6015925, -0.4362931, 0.6197108, 0.3568628, 0, 1, 1,
0.6031401, -0.9426705, 3.356292, 0.3607843, 0, 1, 1,
0.6033112, -1.531939, 2.379413, 0.3686275, 0, 1, 1,
0.6042627, 0.2066389, 1.308605, 0.372549, 0, 1, 1,
0.6072862, 0.5980402, 1.015566, 0.3803922, 0, 1, 1,
0.611445, 2.094854, 0.2818262, 0.3843137, 0, 1, 1,
0.611972, 1.675523, -0.9726743, 0.3921569, 0, 1, 1,
0.6127347, 2.275394, 0.03335432, 0.3960784, 0, 1, 1,
0.617354, 2.210238, -1.481903, 0.4039216, 0, 1, 1,
0.6233023, -0.7471424, 1.413581, 0.4117647, 0, 1, 1,
0.6246527, -0.05841891, 1.631125, 0.4156863, 0, 1, 1,
0.6294143, -0.97517, 1.246667, 0.4235294, 0, 1, 1,
0.6311524, -0.7836413, 3.21462, 0.427451, 0, 1, 1,
0.6317846, 0.5068616, -0.248965, 0.4352941, 0, 1, 1,
0.6341337, 0.590578, 0.4364838, 0.4392157, 0, 1, 1,
0.6363856, 1.625203, 1.545194, 0.4470588, 0, 1, 1,
0.63655, 0.06888565, 1.698019, 0.4509804, 0, 1, 1,
0.6378375, 1.165966, -0.9499274, 0.4588235, 0, 1, 1,
0.6386584, -1.919213, 3.732977, 0.4627451, 0, 1, 1,
0.639116, 0.1724629, 3.889172, 0.4705882, 0, 1, 1,
0.6427057, 0.5000349, 1.793784, 0.4745098, 0, 1, 1,
0.6427171, -0.3932518, 3.589799, 0.4823529, 0, 1, 1,
0.6541873, 0.3204382, 0.8739151, 0.4862745, 0, 1, 1,
0.6630186, -1.533186, 2.884458, 0.4941176, 0, 1, 1,
0.6640888, 0.3099939, 2.526286, 0.5019608, 0, 1, 1,
0.6713448, 0.27934, 0.2764565, 0.5058824, 0, 1, 1,
0.6758745, 1.302805, 2.181386, 0.5137255, 0, 1, 1,
0.6781767, -0.1326509, -0.1934749, 0.5176471, 0, 1, 1,
0.682622, -1.199703, 3.70155, 0.5254902, 0, 1, 1,
0.6919889, 0.08330847, 0.5564628, 0.5294118, 0, 1, 1,
0.6951255, 0.5864021, 0.0814334, 0.5372549, 0, 1, 1,
0.695221, 3.046594, 2.759211, 0.5411765, 0, 1, 1,
0.6980523, -0.5162953, 1.642471, 0.5490196, 0, 1, 1,
0.6990941, -0.06556642, 2.244885, 0.5529412, 0, 1, 1,
0.7022371, 1.306167, 0.6742104, 0.5607843, 0, 1, 1,
0.7037801, 1.470133, 0.4537522, 0.5647059, 0, 1, 1,
0.7041869, 0.2519974, 1.604898, 0.572549, 0, 1, 1,
0.7052736, 0.8729553, 0.459359, 0.5764706, 0, 1, 1,
0.7081586, -1.485461, 2.136939, 0.5843138, 0, 1, 1,
0.7100168, 0.3978088, 0.9740942, 0.5882353, 0, 1, 1,
0.7160034, -1.82892, 3.342191, 0.5960785, 0, 1, 1,
0.7162435, -1.030973, 4.259761, 0.6039216, 0, 1, 1,
0.7174359, -0.08357266, 1.765491, 0.6078432, 0, 1, 1,
0.7228243, -0.4207934, 3.206481, 0.6156863, 0, 1, 1,
0.722872, -1.358774, 2.075213, 0.6196079, 0, 1, 1,
0.7246951, 0.867136, 0.2110353, 0.627451, 0, 1, 1,
0.736472, 0.2401261, 2.172085, 0.6313726, 0, 1, 1,
0.7368622, -0.08478425, 3.931376, 0.6392157, 0, 1, 1,
0.738562, -0.7211691, 1.638201, 0.6431373, 0, 1, 1,
0.7465745, -0.4017504, 0.3792211, 0.6509804, 0, 1, 1,
0.7478179, -0.04120177, 1.018259, 0.654902, 0, 1, 1,
0.7506003, -0.5275844, 2.651483, 0.6627451, 0, 1, 1,
0.7512284, 1.658537, -0.1465427, 0.6666667, 0, 1, 1,
0.756997, -0.6691722, 1.584436, 0.6745098, 0, 1, 1,
0.7571406, -0.4236741, 3.674016, 0.6784314, 0, 1, 1,
0.7590256, 0.8053266, 0.7355148, 0.6862745, 0, 1, 1,
0.7610578, 0.7434964, 1.41833, 0.6901961, 0, 1, 1,
0.7656373, -0.7685708, 3.140677, 0.6980392, 0, 1, 1,
0.7690007, -0.3243726, 2.793232, 0.7058824, 0, 1, 1,
0.7705077, -0.2401331, 1.208455, 0.7098039, 0, 1, 1,
0.7721511, -0.6728069, 2.830835, 0.7176471, 0, 1, 1,
0.7738125, 0.01226192, 2.571631, 0.7215686, 0, 1, 1,
0.7750932, -0.3228589, 1.754213, 0.7294118, 0, 1, 1,
0.7828994, -0.2566568, 2.880537, 0.7333333, 0, 1, 1,
0.7871155, -1.092664, 4.128686, 0.7411765, 0, 1, 1,
0.7899836, 1.263532, -0.2744899, 0.7450981, 0, 1, 1,
0.7913309, 0.1496248, 1.288105, 0.7529412, 0, 1, 1,
0.7913467, 1.027563, -0.01364766, 0.7568628, 0, 1, 1,
0.7920493, -1.029749, 3.609395, 0.7647059, 0, 1, 1,
0.7922297, -0.5635924, 1.717206, 0.7686275, 0, 1, 1,
0.7960004, 0.8095557, -0.3183478, 0.7764706, 0, 1, 1,
0.7970791, -1.216292, 4.317827, 0.7803922, 0, 1, 1,
0.7979361, -0.838449, 1.146956, 0.7882353, 0, 1, 1,
0.8036365, 0.8543066, 1.059131, 0.7921569, 0, 1, 1,
0.8041703, -0.9462275, 1.342341, 0.8, 0, 1, 1,
0.8095837, -0.9362002, 2.128592, 0.8078431, 0, 1, 1,
0.8108181, -0.1991237, 3.477649, 0.8117647, 0, 1, 1,
0.817115, -2.329093, 3.497661, 0.8196079, 0, 1, 1,
0.819379, -1.531385, 1.389162, 0.8235294, 0, 1, 1,
0.8194672, -0.3050503, 2.268718, 0.8313726, 0, 1, 1,
0.8286209, 1.316002, 1.082205, 0.8352941, 0, 1, 1,
0.8367571, -0.3909773, 0.1301666, 0.8431373, 0, 1, 1,
0.8367645, -0.2890622, 1.680214, 0.8470588, 0, 1, 1,
0.8382102, 0.144055, 0.7816658, 0.854902, 0, 1, 1,
0.8421189, 0.1267305, -0.7927572, 0.8588235, 0, 1, 1,
0.8463264, -0.06102131, 1.465588, 0.8666667, 0, 1, 1,
0.8488453, 0.6287857, 0.3693163, 0.8705882, 0, 1, 1,
0.8534248, 1.751554, 0.6519775, 0.8784314, 0, 1, 1,
0.8610618, -1.095898, 2.106203, 0.8823529, 0, 1, 1,
0.864957, 0.8992511, 2.152952, 0.8901961, 0, 1, 1,
0.8678128, -1.379358, 3.316564, 0.8941177, 0, 1, 1,
0.874083, -1.575575, 3.24231, 0.9019608, 0, 1, 1,
0.8884456, -1.606002, 2.477003, 0.9098039, 0, 1, 1,
0.8902429, -0.6630576, 1.595146, 0.9137255, 0, 1, 1,
0.8966562, -1.362437, 2.837407, 0.9215686, 0, 1, 1,
0.897315, 0.06372779, 0.09717553, 0.9254902, 0, 1, 1,
0.9003986, -0.8188486, 3.032268, 0.9333333, 0, 1, 1,
0.9005193, 1.102991, 0.3642709, 0.9372549, 0, 1, 1,
0.9025089, 0.5137233, 0.02202639, 0.945098, 0, 1, 1,
0.9026166, 0.6545759, 0.9918982, 0.9490196, 0, 1, 1,
0.9053831, -0.07437997, 2.460106, 0.9568627, 0, 1, 1,
0.9059325, -0.5570778, 2.727236, 0.9607843, 0, 1, 1,
0.9111352, 0.1613111, 1.491234, 0.9686275, 0, 1, 1,
0.9126032, -0.9933965, 1.718383, 0.972549, 0, 1, 1,
0.9177378, -0.5180308, 2.77292, 0.9803922, 0, 1, 1,
0.9184886, 0.7726449, 1.756829, 0.9843137, 0, 1, 1,
0.9234173, -0.7879263, 2.702986, 0.9921569, 0, 1, 1,
0.9246786, 0.2119398, 1.353843, 0.9960784, 0, 1, 1,
0.9311637, 0.679484, 0.5454099, 1, 0, 0.9960784, 1,
0.9329847, -0.5290491, 2.812634, 1, 0, 0.9882353, 1,
0.9334449, 0.7100462, -0.8606493, 1, 0, 0.9843137, 1,
0.9350378, 1.533363, 0.7640991, 1, 0, 0.9764706, 1,
0.9389345, -0.4614521, 1.245361, 1, 0, 0.972549, 1,
0.9487402, 0.09119583, -0.006002893, 1, 0, 0.9647059, 1,
0.9526541, 2.001153, 0.8194973, 1, 0, 0.9607843, 1,
0.9553045, 0.663771, 0.4676512, 1, 0, 0.9529412, 1,
0.9657193, 1.214481, 0.4833636, 1, 0, 0.9490196, 1,
0.9764799, -0.602154, 2.028422, 1, 0, 0.9411765, 1,
0.9819311, -0.5441166, 2.059819, 1, 0, 0.9372549, 1,
0.9855411, -0.005615182, 0.9225358, 1, 0, 0.9294118, 1,
0.9930766, -0.1989864, 0.461686, 1, 0, 0.9254902, 1,
0.9932538, 1.135385, 0.8693876, 1, 0, 0.9176471, 1,
0.9998264, 0.3476506, 0.8139605, 1, 0, 0.9137255, 1,
1.004367, -0.6385357, 2.217686, 1, 0, 0.9058824, 1,
1.004449, 0.8083711, 1.179123, 1, 0, 0.9019608, 1,
1.017671, 0.3995656, 2.081352, 1, 0, 0.8941177, 1,
1.024458, 0.1624948, 1.76669, 1, 0, 0.8862745, 1,
1.030315, -0.5656627, 2.530149, 1, 0, 0.8823529, 1,
1.032112, -0.4129906, 2.775628, 1, 0, 0.8745098, 1,
1.032132, -1.609377, 3.190165, 1, 0, 0.8705882, 1,
1.034319, 0.5336184, 0.4833925, 1, 0, 0.8627451, 1,
1.039204, -1.572483, 2.043176, 1, 0, 0.8588235, 1,
1.041137, -1.718745, 4.53661, 1, 0, 0.8509804, 1,
1.042779, 0.6087781, 1.249456, 1, 0, 0.8470588, 1,
1.045185, 0.6992849, 1.224641, 1, 0, 0.8392157, 1,
1.049487, 1.037445, 0.2078253, 1, 0, 0.8352941, 1,
1.052957, 1.282888, 1.725606, 1, 0, 0.827451, 1,
1.055169, -0.3637562, 3.082592, 1, 0, 0.8235294, 1,
1.060095, -0.2251508, 2.181581, 1, 0, 0.8156863, 1,
1.062064, 0.8651418, 1.403824, 1, 0, 0.8117647, 1,
1.063381, -0.02484919, 2.074633, 1, 0, 0.8039216, 1,
1.065909, 1.214211, -0.0556006, 1, 0, 0.7960784, 1,
1.098864, 0.6234692, 0.3172987, 1, 0, 0.7921569, 1,
1.111938, 0.06227683, 1.374349, 1, 0, 0.7843137, 1,
1.114451, -0.150102, 0.8141199, 1, 0, 0.7803922, 1,
1.117816, 0.6034399, 1.424981, 1, 0, 0.772549, 1,
1.126753, 1.039935, 1.10478, 1, 0, 0.7686275, 1,
1.127312, -0.4448333, 1.325656, 1, 0, 0.7607843, 1,
1.138411, 0.01853331, 1.705242, 1, 0, 0.7568628, 1,
1.143359, 1.75105, 1.840577, 1, 0, 0.7490196, 1,
1.144722, 0.7479354, 1.774912, 1, 0, 0.7450981, 1,
1.147717, 1.518146, 1.014328, 1, 0, 0.7372549, 1,
1.148943, 0.3530256, 2.672204, 1, 0, 0.7333333, 1,
1.156395, 1.060816, 1.64599, 1, 0, 0.7254902, 1,
1.156397, -0.0281186, 1.880364, 1, 0, 0.7215686, 1,
1.158483, 0.8731455, 0.9784718, 1, 0, 0.7137255, 1,
1.168803, 0.09462935, 2.196724, 1, 0, 0.7098039, 1,
1.171075, -0.7010899, 1.594688, 1, 0, 0.7019608, 1,
1.177247, 0.02707927, 1.798886, 1, 0, 0.6941177, 1,
1.19004, -0.483831, 0.7998742, 1, 0, 0.6901961, 1,
1.194238, 0.5695182, 0.08194344, 1, 0, 0.682353, 1,
1.194869, -1.293061, 1.968204, 1, 0, 0.6784314, 1,
1.196175, 1.010205, 0.5949739, 1, 0, 0.6705883, 1,
1.207035, 0.4795191, 1.478567, 1, 0, 0.6666667, 1,
1.212254, 0.0350941, 1.91544, 1, 0, 0.6588235, 1,
1.221853, 0.825372, 1.677378, 1, 0, 0.654902, 1,
1.24216, 1.813263, 0.176733, 1, 0, 0.6470588, 1,
1.242283, -1.117172, 1.621476, 1, 0, 0.6431373, 1,
1.245316, 1.759262, 2.733668, 1, 0, 0.6352941, 1,
1.280889, -2.427221, 3.840877, 1, 0, 0.6313726, 1,
1.283012, -0.7298705, 1.364454, 1, 0, 0.6235294, 1,
1.287077, 0.7728037, 1.301787, 1, 0, 0.6196079, 1,
1.28851, -0.1223433, 2.81356, 1, 0, 0.6117647, 1,
1.289179, -0.8901967, 3.602581, 1, 0, 0.6078432, 1,
1.289774, -1.027612, 2.367027, 1, 0, 0.6, 1,
1.292158, 2.048288, 0.3605769, 1, 0, 0.5921569, 1,
1.292508, 0.1280996, 0.7044705, 1, 0, 0.5882353, 1,
1.300365, -0.2758426, 0.0772888, 1, 0, 0.5803922, 1,
1.304062, 0.1020635, 2.645257, 1, 0, 0.5764706, 1,
1.310637, -0.550728, 2.857764, 1, 0, 0.5686275, 1,
1.313786, 0.2829929, 0.5792099, 1, 0, 0.5647059, 1,
1.333724, 1.062775, 0.9712707, 1, 0, 0.5568628, 1,
1.34507, -0.7966275, 1.619088, 1, 0, 0.5529412, 1,
1.345436, -0.7180147, 3.84099, 1, 0, 0.5450981, 1,
1.353441, -1.800221, 3.596673, 1, 0, 0.5411765, 1,
1.354872, 0.08563326, 2.45289, 1, 0, 0.5333334, 1,
1.356714, 0.3342709, 1.234235, 1, 0, 0.5294118, 1,
1.356831, 0.2077546, 2.166423, 1, 0, 0.5215687, 1,
1.357803, -0.1894858, 1.266163, 1, 0, 0.5176471, 1,
1.36824, 2.643781, -0.7489024, 1, 0, 0.509804, 1,
1.38795, -0.303104, 2.91837, 1, 0, 0.5058824, 1,
1.391211, -0.2681349, 1.488894, 1, 0, 0.4980392, 1,
1.395703, 0.3535561, 1.890527, 1, 0, 0.4901961, 1,
1.396717, 0.09933097, 0.358594, 1, 0, 0.4862745, 1,
1.402912, 0.1813591, 1.440995, 1, 0, 0.4784314, 1,
1.412465, 0.07901961, 1.747856, 1, 0, 0.4745098, 1,
1.413204, -1.553009, 2.731659, 1, 0, 0.4666667, 1,
1.415648, 0.7867392, 1.023391, 1, 0, 0.4627451, 1,
1.420206, -0.6504197, 2.181918, 1, 0, 0.454902, 1,
1.420249, 1.154354, 0.5519021, 1, 0, 0.4509804, 1,
1.422835, -0.4507586, 1.538652, 1, 0, 0.4431373, 1,
1.423055, -0.1415316, 2.606075, 1, 0, 0.4392157, 1,
1.428431, 2.67963, 0.8491438, 1, 0, 0.4313726, 1,
1.429289, 0.362625, 0.59524, 1, 0, 0.427451, 1,
1.449041, 0.8081212, -0.1295374, 1, 0, 0.4196078, 1,
1.453384, -0.6138073, 2.714555, 1, 0, 0.4156863, 1,
1.458389, 0.4995731, 2.6842, 1, 0, 0.4078431, 1,
1.459061, 0.5287269, 2.764745, 1, 0, 0.4039216, 1,
1.473152, 0.3870134, 2.209698, 1, 0, 0.3960784, 1,
1.476852, -0.6244612, 2.125443, 1, 0, 0.3882353, 1,
1.478198, 0.2270279, 3.229267, 1, 0, 0.3843137, 1,
1.510896, 0.7850986, 3.06515, 1, 0, 0.3764706, 1,
1.51489, -0.5688299, 1.348154, 1, 0, 0.372549, 1,
1.529372, 0.4161122, 3.770947, 1, 0, 0.3647059, 1,
1.529925, -2.296952, 2.287347, 1, 0, 0.3607843, 1,
1.535976, -1.321621, 1.274237, 1, 0, 0.3529412, 1,
1.536755, 0.8431138, 0.1695971, 1, 0, 0.3490196, 1,
1.558777, 0.5352759, 3.194763, 1, 0, 0.3411765, 1,
1.565419, -0.9448811, 0.71308, 1, 0, 0.3372549, 1,
1.581964, 0.8512109, -0.1665635, 1, 0, 0.3294118, 1,
1.584127, -0.4649881, 3.328293, 1, 0, 0.3254902, 1,
1.597996, 0.8770365, 0.3165977, 1, 0, 0.3176471, 1,
1.604759, 1.092677, 0.8004328, 1, 0, 0.3137255, 1,
1.631346, 1.061492, 2.147637, 1, 0, 0.3058824, 1,
1.653331, 0.03034945, 0.9407295, 1, 0, 0.2980392, 1,
1.679626, -0.06134854, 2.567145, 1, 0, 0.2941177, 1,
1.69034, -0.4708369, 2.219356, 1, 0, 0.2862745, 1,
1.694699, 0.9667667, 1.433899, 1, 0, 0.282353, 1,
1.696994, -0.1003534, 0.7384837, 1, 0, 0.2745098, 1,
1.698168, 0.3997703, 1.958769, 1, 0, 0.2705882, 1,
1.712683, -0.8472405, 1.804332, 1, 0, 0.2627451, 1,
1.715613, -1.648603, 2.632337, 1, 0, 0.2588235, 1,
1.730971, 0.08890561, 0.9459702, 1, 0, 0.2509804, 1,
1.733468, 1.420349, 2.890222, 1, 0, 0.2470588, 1,
1.733796, -2.892848, 2.567308, 1, 0, 0.2392157, 1,
1.748328, -0.6375685, 1.693221, 1, 0, 0.2352941, 1,
1.749007, -0.3717746, 1.628224, 1, 0, 0.227451, 1,
1.757837, -1.741966, 1.995645, 1, 0, 0.2235294, 1,
1.775577, -1.309557, 0.804352, 1, 0, 0.2156863, 1,
1.802088, -1.603326, 2.750195, 1, 0, 0.2117647, 1,
1.805263, 0.1854006, 1.790193, 1, 0, 0.2039216, 1,
1.817694, -0.6948532, 1.239836, 1, 0, 0.1960784, 1,
1.830477, 0.8661966, 1.015336, 1, 0, 0.1921569, 1,
1.869866, -0.7755136, 5.009708, 1, 0, 0.1843137, 1,
1.915446, 1.197214, 1.625404, 1, 0, 0.1803922, 1,
1.917858, 2.076566, 1.739995, 1, 0, 0.172549, 1,
1.928356, -0.3241668, 2.972387, 1, 0, 0.1686275, 1,
1.938686, 0.04563025, 0.6987839, 1, 0, 0.1607843, 1,
1.957257, -0.4260841, 2.594251, 1, 0, 0.1568628, 1,
2.008694, -0.859723, 1.921517, 1, 0, 0.1490196, 1,
2.013145, 0.1405864, 3.358096, 1, 0, 0.145098, 1,
2.083038, -0.2650759, 1.863266, 1, 0, 0.1372549, 1,
2.089738, 1.169847, 0.9218385, 1, 0, 0.1333333, 1,
2.132679, -1.074387, 2.827832, 1, 0, 0.1254902, 1,
2.141595, 0.3921505, 0.3849446, 1, 0, 0.1215686, 1,
2.162261, -0.2213681, 1.683083, 1, 0, 0.1137255, 1,
2.193702, -0.2330442, 0.7045242, 1, 0, 0.1098039, 1,
2.20528, -1.283234, 2.332376, 1, 0, 0.1019608, 1,
2.214032, -0.606895, 0.9591998, 1, 0, 0.09411765, 1,
2.219929, 0.8854693, 1.805234, 1, 0, 0.09019608, 1,
2.227916, -3.297694, 3.401492, 1, 0, 0.08235294, 1,
2.287613, -0.1954874, 2.725552, 1, 0, 0.07843138, 1,
2.334188, 1.431326, 0.2443613, 1, 0, 0.07058824, 1,
2.358272, -0.06975773, 0.07409019, 1, 0, 0.06666667, 1,
2.36841, -0.1960258, 0.3626233, 1, 0, 0.05882353, 1,
2.374031, 0.05149043, 2.088807, 1, 0, 0.05490196, 1,
2.383704, 0.03796845, 1.47324, 1, 0, 0.04705882, 1,
2.474773, -0.09461396, 1.342417, 1, 0, 0.04313726, 1,
2.515702, 0.6105164, 1.834036, 1, 0, 0.03529412, 1,
2.578597, 0.01477744, 1.393498, 1, 0, 0.03137255, 1,
2.60338, -0.4128824, -0.02297593, 1, 0, 0.02352941, 1,
2.750647, 0.646251, 2.687942, 1, 0, 0.01960784, 1,
2.802562, -1.06731, 2.03277, 1, 0, 0.01176471, 1,
2.970857, 0.1077553, 0.04167248, 1, 0, 0.007843138, 1
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
0.1521339, -4.373051, -6.871348, 0, -0.5, 0.5, 0.5,
0.1521339, -4.373051, -6.871348, 1, -0.5, 0.5, 0.5,
0.1521339, -4.373051, -6.871348, 1, 1.5, 0.5, 0.5,
0.1521339, -4.373051, -6.871348, 0, 1.5, 0.5, 0.5
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
-3.622137, -0.1255502, -6.871348, 0, -0.5, 0.5, 0.5,
-3.622137, -0.1255502, -6.871348, 1, -0.5, 0.5, 0.5,
-3.622137, -0.1255502, -6.871348, 1, 1.5, 0.5, 0.5,
-3.622137, -0.1255502, -6.871348, 0, 1.5, 0.5, 0.5
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
-3.622137, -4.373051, -0.01665282, 0, -0.5, 0.5, 0.5,
-3.622137, -4.373051, -0.01665282, 1, -0.5, 0.5, 0.5,
-3.622137, -4.373051, -0.01665282, 1, 1.5, 0.5, 0.5,
-3.622137, -4.373051, -0.01665282, 0, 1.5, 0.5, 0.5
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
-2, -3.392859, -5.289495,
2, -3.392859, -5.289495,
-2, -3.392859, -5.289495,
-2, -3.556224, -5.553137,
-1, -3.392859, -5.289495,
-1, -3.556224, -5.553137,
0, -3.392859, -5.289495,
0, -3.556224, -5.553137,
1, -3.392859, -5.289495,
1, -3.556224, -5.553137,
2, -3.392859, -5.289495,
2, -3.556224, -5.553137
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
-2, -3.882955, -6.080421, 0, -0.5, 0.5, 0.5,
-2, -3.882955, -6.080421, 1, -0.5, 0.5, 0.5,
-2, -3.882955, -6.080421, 1, 1.5, 0.5, 0.5,
-2, -3.882955, -6.080421, 0, 1.5, 0.5, 0.5,
-1, -3.882955, -6.080421, 0, -0.5, 0.5, 0.5,
-1, -3.882955, -6.080421, 1, -0.5, 0.5, 0.5,
-1, -3.882955, -6.080421, 1, 1.5, 0.5, 0.5,
-1, -3.882955, -6.080421, 0, 1.5, 0.5, 0.5,
0, -3.882955, -6.080421, 0, -0.5, 0.5, 0.5,
0, -3.882955, -6.080421, 1, -0.5, 0.5, 0.5,
0, -3.882955, -6.080421, 1, 1.5, 0.5, 0.5,
0, -3.882955, -6.080421, 0, 1.5, 0.5, 0.5,
1, -3.882955, -6.080421, 0, -0.5, 0.5, 0.5,
1, -3.882955, -6.080421, 1, -0.5, 0.5, 0.5,
1, -3.882955, -6.080421, 1, 1.5, 0.5, 0.5,
1, -3.882955, -6.080421, 0, 1.5, 0.5, 0.5,
2, -3.882955, -6.080421, 0, -0.5, 0.5, 0.5,
2, -3.882955, -6.080421, 1, -0.5, 0.5, 0.5,
2, -3.882955, -6.080421, 1, 1.5, 0.5, 0.5,
2, -3.882955, -6.080421, 0, 1.5, 0.5, 0.5
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
-2.751151, -3, -5.289495,
-2.751151, 3, -5.289495,
-2.751151, -3, -5.289495,
-2.896316, -3, -5.553137,
-2.751151, -2, -5.289495,
-2.896316, -2, -5.553137,
-2.751151, -1, -5.289495,
-2.896316, -1, -5.553137,
-2.751151, 0, -5.289495,
-2.896316, 0, -5.553137,
-2.751151, 1, -5.289495,
-2.896316, 1, -5.553137,
-2.751151, 2, -5.289495,
-2.896316, 2, -5.553137,
-2.751151, 3, -5.289495,
-2.896316, 3, -5.553137
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
-3.186644, -3, -6.080421, 0, -0.5, 0.5, 0.5,
-3.186644, -3, -6.080421, 1, -0.5, 0.5, 0.5,
-3.186644, -3, -6.080421, 1, 1.5, 0.5, 0.5,
-3.186644, -3, -6.080421, 0, 1.5, 0.5, 0.5,
-3.186644, -2, -6.080421, 0, -0.5, 0.5, 0.5,
-3.186644, -2, -6.080421, 1, -0.5, 0.5, 0.5,
-3.186644, -2, -6.080421, 1, 1.5, 0.5, 0.5,
-3.186644, -2, -6.080421, 0, 1.5, 0.5, 0.5,
-3.186644, -1, -6.080421, 0, -0.5, 0.5, 0.5,
-3.186644, -1, -6.080421, 1, -0.5, 0.5, 0.5,
-3.186644, -1, -6.080421, 1, 1.5, 0.5, 0.5,
-3.186644, -1, -6.080421, 0, 1.5, 0.5, 0.5,
-3.186644, 0, -6.080421, 0, -0.5, 0.5, 0.5,
-3.186644, 0, -6.080421, 1, -0.5, 0.5, 0.5,
-3.186644, 0, -6.080421, 1, 1.5, 0.5, 0.5,
-3.186644, 0, -6.080421, 0, 1.5, 0.5, 0.5,
-3.186644, 1, -6.080421, 0, -0.5, 0.5, 0.5,
-3.186644, 1, -6.080421, 1, -0.5, 0.5, 0.5,
-3.186644, 1, -6.080421, 1, 1.5, 0.5, 0.5,
-3.186644, 1, -6.080421, 0, 1.5, 0.5, 0.5,
-3.186644, 2, -6.080421, 0, -0.5, 0.5, 0.5,
-3.186644, 2, -6.080421, 1, -0.5, 0.5, 0.5,
-3.186644, 2, -6.080421, 1, 1.5, 0.5, 0.5,
-3.186644, 2, -6.080421, 0, 1.5, 0.5, 0.5,
-3.186644, 3, -6.080421, 0, -0.5, 0.5, 0.5,
-3.186644, 3, -6.080421, 1, -0.5, 0.5, 0.5,
-3.186644, 3, -6.080421, 1, 1.5, 0.5, 0.5,
-3.186644, 3, -6.080421, 0, 1.5, 0.5, 0.5
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
-2.751151, -3.392859, -4,
-2.751151, -3.392859, 4,
-2.751151, -3.392859, -4,
-2.896316, -3.556224, -4,
-2.751151, -3.392859, -2,
-2.896316, -3.556224, -2,
-2.751151, -3.392859, 0,
-2.896316, -3.556224, 0,
-2.751151, -3.392859, 2,
-2.896316, -3.556224, 2,
-2.751151, -3.392859, 4,
-2.896316, -3.556224, 4
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
-3.186644, -3.882955, -4, 0, -0.5, 0.5, 0.5,
-3.186644, -3.882955, -4, 1, -0.5, 0.5, 0.5,
-3.186644, -3.882955, -4, 1, 1.5, 0.5, 0.5,
-3.186644, -3.882955, -4, 0, 1.5, 0.5, 0.5,
-3.186644, -3.882955, -2, 0, -0.5, 0.5, 0.5,
-3.186644, -3.882955, -2, 1, -0.5, 0.5, 0.5,
-3.186644, -3.882955, -2, 1, 1.5, 0.5, 0.5,
-3.186644, -3.882955, -2, 0, 1.5, 0.5, 0.5,
-3.186644, -3.882955, 0, 0, -0.5, 0.5, 0.5,
-3.186644, -3.882955, 0, 1, -0.5, 0.5, 0.5,
-3.186644, -3.882955, 0, 1, 1.5, 0.5, 0.5,
-3.186644, -3.882955, 0, 0, 1.5, 0.5, 0.5,
-3.186644, -3.882955, 2, 0, -0.5, 0.5, 0.5,
-3.186644, -3.882955, 2, 1, -0.5, 0.5, 0.5,
-3.186644, -3.882955, 2, 1, 1.5, 0.5, 0.5,
-3.186644, -3.882955, 2, 0, 1.5, 0.5, 0.5,
-3.186644, -3.882955, 4, 0, -0.5, 0.5, 0.5,
-3.186644, -3.882955, 4, 1, -0.5, 0.5, 0.5,
-3.186644, -3.882955, 4, 1, 1.5, 0.5, 0.5,
-3.186644, -3.882955, 4, 0, 1.5, 0.5, 0.5
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
-2.751151, -3.392859, -5.289495,
-2.751151, 3.141758, -5.289495,
-2.751151, -3.392859, 5.256189,
-2.751151, 3.141758, 5.256189,
-2.751151, -3.392859, -5.289495,
-2.751151, -3.392859, 5.256189,
-2.751151, 3.141758, -5.289495,
-2.751151, 3.141758, 5.256189,
-2.751151, -3.392859, -5.289495,
3.055419, -3.392859, -5.289495,
-2.751151, -3.392859, 5.256189,
3.055419, -3.392859, 5.256189,
-2.751151, 3.141758, -5.289495,
3.055419, 3.141758, -5.289495,
-2.751151, 3.141758, 5.256189,
3.055419, 3.141758, 5.256189,
3.055419, -3.392859, -5.289495,
3.055419, 3.141758, -5.289495,
3.055419, -3.392859, 5.256189,
3.055419, 3.141758, 5.256189,
3.055419, -3.392859, -5.289495,
3.055419, -3.392859, 5.256189,
3.055419, 3.141758, -5.289495,
3.055419, 3.141758, 5.256189
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
var radius = 7.314344;
var distance = 32.54234;
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
mvMatrix.translate( -0.1521339, 0.1255502, 0.01665282 );
mvMatrix.scale( 1.361976, 1.210233, 0.7499192 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.54234);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
bitertanol<-read.table("bitertanol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bitertanol$V2
```

```
## Error in eval(expr, envir, enclos): object 'bitertanol' not found
```

```r
y<-bitertanol$V3
```

```
## Error in eval(expr, envir, enclos): object 'bitertanol' not found
```

```r
z<-bitertanol$V4
```

```
## Error in eval(expr, envir, enclos): object 'bitertanol' not found
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
-2.666589, 1.533413, -0.3021613, 0, 0, 1, 1, 1,
-2.622316, -0.170548, -3.334965, 1, 0, 0, 1, 1,
-2.556377, 1.285243, -0.8113965, 1, 0, 0, 1, 1,
-2.547616, -0.6474539, -0.9975693, 1, 0, 0, 1, 1,
-2.498099, -1.085291, 0.1273278, 1, 0, 0, 1, 1,
-2.425392, 0.5011305, -2.223874, 1, 0, 0, 1, 1,
-2.346348, -0.07585911, -1.764818, 0, 0, 0, 1, 1,
-2.34295, -0.9802969, -0.7712286, 0, 0, 0, 1, 1,
-2.296184, 2.136523, -1.577698, 0, 0, 0, 1, 1,
-2.263067, 0.4691601, 0.6892277, 0, 0, 0, 1, 1,
-2.250594, -0.882724, -2.033062, 0, 0, 0, 1, 1,
-2.224284, 1.506383, 0.5059156, 0, 0, 0, 1, 1,
-2.204853, -0.2689815, -3.030935, 0, 0, 0, 1, 1,
-2.192868, -0.4596938, -2.15891, 1, 1, 1, 1, 1,
-2.18846, -0.163897, -1.290939, 1, 1, 1, 1, 1,
-2.159529, -0.5384957, -2.08109, 1, 1, 1, 1, 1,
-2.135973, -1.314522, -2.502979, 1, 1, 1, 1, 1,
-2.094395, 1.856323, -0.7361704, 1, 1, 1, 1, 1,
-2.045197, 0.04145267, -0.3465833, 1, 1, 1, 1, 1,
-2.040104, 0.01496576, -0.2182385, 1, 1, 1, 1, 1,
-2.009181, 1.225013, -0.3135535, 1, 1, 1, 1, 1,
-1.998499, -0.5054457, -0.8861054, 1, 1, 1, 1, 1,
-1.98701, 2.656398, -0.5532156, 1, 1, 1, 1, 1,
-1.985067, -0.4866702, -2.070195, 1, 1, 1, 1, 1,
-1.98175, -1.40229, -0.9354042, 1, 1, 1, 1, 1,
-1.936074, 0.011422, -2.581777, 1, 1, 1, 1, 1,
-1.911445, 0.7101873, -1.696681, 1, 1, 1, 1, 1,
-1.910466, 0.6230698, -1.400865, 1, 1, 1, 1, 1,
-1.898895, -0.5961585, -1.979427, 0, 0, 1, 1, 1,
-1.89532, 1.900096, -2.240043, 1, 0, 0, 1, 1,
-1.874969, 0.1767589, 0.08819611, 1, 0, 0, 1, 1,
-1.864615, -1.885414, -2.408066, 1, 0, 0, 1, 1,
-1.850604, -0.3287874, -2.28741, 1, 0, 0, 1, 1,
-1.842332, 0.7102029, -0.5521488, 1, 0, 0, 1, 1,
-1.828897, 1.011936, 0.2175663, 0, 0, 0, 1, 1,
-1.820273, -0.1359346, -2.837094, 0, 0, 0, 1, 1,
-1.809608, -1.427817, 0.2691824, 0, 0, 0, 1, 1,
-1.77625, -1.876424, -3.411244, 0, 0, 0, 1, 1,
-1.772043, -1.122106, -2.582559, 0, 0, 0, 1, 1,
-1.768055, -0.6607829, -1.837813, 0, 0, 0, 1, 1,
-1.723324, -0.8306845, -2.578247, 0, 0, 0, 1, 1,
-1.710629, 0.09454531, -1.058037, 1, 1, 1, 1, 1,
-1.703807, -1.312854, -2.789856, 1, 1, 1, 1, 1,
-1.699745, -1.06663, -0.2343342, 1, 1, 1, 1, 1,
-1.667158, -0.2086842, -1.46191, 1, 1, 1, 1, 1,
-1.660105, -0.8924813, -1.335355, 1, 1, 1, 1, 1,
-1.657816, -0.7647102, -1.322507, 1, 1, 1, 1, 1,
-1.655841, 0.61255, 0.04462958, 1, 1, 1, 1, 1,
-1.652207, -0.1597281, -1.384359, 1, 1, 1, 1, 1,
-1.640845, -0.05666174, -0.2608791, 1, 1, 1, 1, 1,
-1.628261, 0.1630022, 0.281032, 1, 1, 1, 1, 1,
-1.619574, -0.428609, -3.405229, 1, 1, 1, 1, 1,
-1.618, -0.382631, -1.081902, 1, 1, 1, 1, 1,
-1.609788, -0.891212, -2.924409, 1, 1, 1, 1, 1,
-1.575107, 0.6812108, -1.116301, 1, 1, 1, 1, 1,
-1.5745, 0.6416574, -0.8819097, 1, 1, 1, 1, 1,
-1.553718, -1.799588, -2.407521, 0, 0, 1, 1, 1,
-1.543472, -0.3178352, -1.669025, 1, 0, 0, 1, 1,
-1.531895, -0.8069346, -1.387002, 1, 0, 0, 1, 1,
-1.531184, 0.6584566, 0.2436669, 1, 0, 0, 1, 1,
-1.51223, -0.1789292, -2.182189, 1, 0, 0, 1, 1,
-1.4794, 1.314735, 0.1742995, 1, 0, 0, 1, 1,
-1.472337, 0.555947, -1.565092, 0, 0, 0, 1, 1,
-1.470206, -0.7830144, -1.069332, 0, 0, 0, 1, 1,
-1.460896, 0.0863293, -1.232377, 0, 0, 0, 1, 1,
-1.460724, -0.9957491, -2.36459, 0, 0, 0, 1, 1,
-1.458981, 0.6630823, -0.6035744, 0, 0, 0, 1, 1,
-1.458249, 0.9137837, -2.651862, 0, 0, 0, 1, 1,
-1.455028, 0.114962, -2.238892, 0, 0, 0, 1, 1,
-1.441255, -0.9926091, -2.799782, 1, 1, 1, 1, 1,
-1.434688, 1.884736, -0.4351058, 1, 1, 1, 1, 1,
-1.430671, -0.5462449, -2.447338, 1, 1, 1, 1, 1,
-1.422877, 0.1417529, -2.081563, 1, 1, 1, 1, 1,
-1.42029, 1.426535, -1.878616, 1, 1, 1, 1, 1,
-1.413215, 0.09248532, -0.4881342, 1, 1, 1, 1, 1,
-1.391217, -0.6305543, -1.835907, 1, 1, 1, 1, 1,
-1.390555, -0.2668175, -3.213437, 1, 1, 1, 1, 1,
-1.384853, -0.7023884, -2.49298, 1, 1, 1, 1, 1,
-1.378106, 0.3143728, 0.3971061, 1, 1, 1, 1, 1,
-1.377321, 0.5935448, -0.4757371, 1, 1, 1, 1, 1,
-1.374006, -0.2086976, -1.481877, 1, 1, 1, 1, 1,
-1.373928, -1.616294, -3.903036, 1, 1, 1, 1, 1,
-1.365196, 0.9180623, -2.064866, 1, 1, 1, 1, 1,
-1.364873, 1.784678, -0.6997479, 1, 1, 1, 1, 1,
-1.362011, -1.639193, -3.487927, 0, 0, 1, 1, 1,
-1.340339, 0.5928605, -1.275957, 1, 0, 0, 1, 1,
-1.340301, -1.776638, -3.611933, 1, 0, 0, 1, 1,
-1.340013, -0.8115131, -2.759013, 1, 0, 0, 1, 1,
-1.33376, -0.09958291, -0.8417239, 1, 0, 0, 1, 1,
-1.328875, 0.8635924, -1.439911, 1, 0, 0, 1, 1,
-1.32362, -1.7004, -0.8886778, 0, 0, 0, 1, 1,
-1.317105, -0.4478462, -2.603928, 0, 0, 0, 1, 1,
-1.314039, -0.0288179, -2.276639, 0, 0, 0, 1, 1,
-1.308025, -0.7634079, -2.39502, 0, 0, 0, 1, 1,
-1.306657, -1.891097, -2.61566, 0, 0, 0, 1, 1,
-1.301124, -0.4746951, -2.434605, 0, 0, 0, 1, 1,
-1.297553, -0.07084737, -1.275639, 0, 0, 0, 1, 1,
-1.294512, -0.7889398, -3.05903, 1, 1, 1, 1, 1,
-1.294033, 1.059014, -0.5711688, 1, 1, 1, 1, 1,
-1.279593, -0.4153744, -3.307771, 1, 1, 1, 1, 1,
-1.271974, 1.080702, -1.459627, 1, 1, 1, 1, 1,
-1.24894, 2.030913, 0.1183629, 1, 1, 1, 1, 1,
-1.245015, -0.3269168, 0.525582, 1, 1, 1, 1, 1,
-1.236857, -0.1724143, -1.544802, 1, 1, 1, 1, 1,
-1.233793, 0.2075694, -2.034724, 1, 1, 1, 1, 1,
-1.222112, 0.2552988, -1.201165, 1, 1, 1, 1, 1,
-1.219535, -0.3098813, -2.437433, 1, 1, 1, 1, 1,
-1.218432, -0.1936008, -3.248885, 1, 1, 1, 1, 1,
-1.205824, -0.5786141, -2.942227, 1, 1, 1, 1, 1,
-1.20328, 0.8058237, -1.060781, 1, 1, 1, 1, 1,
-1.202858, 1.301277, -0.2608574, 1, 1, 1, 1, 1,
-1.199226, 1.05705, -2.095184, 1, 1, 1, 1, 1,
-1.181355, -0.2362987, -3.379668, 0, 0, 1, 1, 1,
-1.173496, -0.3260662, -1.054022, 1, 0, 0, 1, 1,
-1.161587, -0.05110043, -0.7074996, 1, 0, 0, 1, 1,
-1.158738, 1.594074, -1.815422, 1, 0, 0, 1, 1,
-1.157536, -0.3801574, -3.119372, 1, 0, 0, 1, 1,
-1.150426, 0.9484903, -0.6284164, 1, 0, 0, 1, 1,
-1.146425, 0.863804, -1.149002, 0, 0, 0, 1, 1,
-1.138782, -0.969635, -2.12532, 0, 0, 0, 1, 1,
-1.13466, 0.7340957, -1.922542, 0, 0, 0, 1, 1,
-1.131067, -0.302475, -1.853624, 0, 0, 0, 1, 1,
-1.129627, -1.884442, -1.294491, 0, 0, 0, 1, 1,
-1.117695, -0.3625184, -0.424832, 0, 0, 0, 1, 1,
-1.116245, 0.03933979, -0.7043845, 0, 0, 0, 1, 1,
-1.114531, -1.583514, -2.435226, 1, 1, 1, 1, 1,
-1.11069, -0.07019252, -1.313446, 1, 1, 1, 1, 1,
-1.108599, -1.012238, -3.148494, 1, 1, 1, 1, 1,
-1.104673, 0.2428074, -0.4550517, 1, 1, 1, 1, 1,
-1.100315, -0.9576623, -1.595601, 1, 1, 1, 1, 1,
-1.098874, -0.2271144, -1.252469, 1, 1, 1, 1, 1,
-1.097664, 1.24486, -1.420667, 1, 1, 1, 1, 1,
-1.094576, -0.7685347, -3.747806, 1, 1, 1, 1, 1,
-1.091958, 0.6654035, -0.9493324, 1, 1, 1, 1, 1,
-1.089393, -0.282045, -0.4654098, 1, 1, 1, 1, 1,
-1.086826, -0.5388623, -1.418999, 1, 1, 1, 1, 1,
-1.079903, -0.7022074, -1.074208, 1, 1, 1, 1, 1,
-1.07819, 1.10489, -1.251103, 1, 1, 1, 1, 1,
-1.074451, 1.841513, 0.03924053, 1, 1, 1, 1, 1,
-1.073651, -1.158716, -2.194163, 1, 1, 1, 1, 1,
-1.06931, -2.073231, -1.946397, 0, 0, 1, 1, 1,
-1.057079, -0.10139, -2.868693, 1, 0, 0, 1, 1,
-1.055691, 1.172183, -1.928792, 1, 0, 0, 1, 1,
-1.04554, -0.4395343, -1.797649, 1, 0, 0, 1, 1,
-1.044116, -0.8269971, -2.329031, 1, 0, 0, 1, 1,
-1.03797, 2.76621, -0.6933298, 1, 0, 0, 1, 1,
-1.033708, 0.9950374, 0.2310059, 0, 0, 0, 1, 1,
-1.031019, -0.290855, -3.840157, 0, 0, 0, 1, 1,
-1.028764, -1.627941, -2.966191, 0, 0, 0, 1, 1,
-1.021989, 1.552787, -0.929915, 0, 0, 0, 1, 1,
-1.015511, -1.494315, -2.191312, 0, 0, 0, 1, 1,
-1.014449, -0.9202816, -2.088542, 0, 0, 0, 1, 1,
-1.007557, -0.3158001, -2.731712, 0, 0, 0, 1, 1,
-1.002813, -0.5275753, -2.830139, 1, 1, 1, 1, 1,
-0.998733, 0.6658368, -0.9606015, 1, 1, 1, 1, 1,
-0.9843635, -1.903953, -1.518377, 1, 1, 1, 1, 1,
-0.9692966, 1.705956, -0.04956365, 1, 1, 1, 1, 1,
-0.9683288, 0.9527557, -1.630492, 1, 1, 1, 1, 1,
-0.9552935, 0.2948471, -0.112272, 1, 1, 1, 1, 1,
-0.9550104, -0.2188189, -1.110564, 1, 1, 1, 1, 1,
-0.9515784, 0.0915104, -0.3860551, 1, 1, 1, 1, 1,
-0.9483583, -0.009843901, -0.8966603, 1, 1, 1, 1, 1,
-0.9438632, -0.9897386, -1.963959, 1, 1, 1, 1, 1,
-0.94136, -0.3211271, -2.177304, 1, 1, 1, 1, 1,
-0.9371433, -0.5241857, -1.757527, 1, 1, 1, 1, 1,
-0.9338002, -1.780759, -2.081385, 1, 1, 1, 1, 1,
-0.9333896, -0.2045543, -0.238482, 1, 1, 1, 1, 1,
-0.9330189, -2.522546, -4.546908, 1, 1, 1, 1, 1,
-0.9292322, 0.9546405, -0.8106812, 0, 0, 1, 1, 1,
-0.9272938, -0.3097819, -3.113447, 1, 0, 0, 1, 1,
-0.9213825, 0.9733436, -1.303979, 1, 0, 0, 1, 1,
-0.920801, -0.415479, -2.370268, 1, 0, 0, 1, 1,
-0.9198143, -0.3230967, -1.611186, 1, 0, 0, 1, 1,
-0.9196673, -0.1003194, -1.145165, 1, 0, 0, 1, 1,
-0.9181255, 0.4401184, 0.5914728, 0, 0, 0, 1, 1,
-0.9170145, 0.4335535, 0.1591621, 0, 0, 0, 1, 1,
-0.9139371, -1.387365, -0.8380268, 0, 0, 0, 1, 1,
-0.9126735, -1.367, -1.120873, 0, 0, 0, 1, 1,
-0.9094055, -0.9610224, -4.338398, 0, 0, 0, 1, 1,
-0.9075965, 0.8266751, -0.5592044, 0, 0, 0, 1, 1,
-0.9051784, 2.279104, 0.74555, 0, 0, 0, 1, 1,
-0.9050255, -0.458727, -2.676626, 1, 1, 1, 1, 1,
-0.9049171, -0.1460031, 0.8692791, 1, 1, 1, 1, 1,
-0.9013355, -2.147241, -2.556222, 1, 1, 1, 1, 1,
-0.8959483, 1.010897, -1.336084, 1, 1, 1, 1, 1,
-0.8956431, -1.816, -2.757151, 1, 1, 1, 1, 1,
-0.8953618, 1.021289, -0.644055, 1, 1, 1, 1, 1,
-0.8852335, 2.255316, -0.7784826, 1, 1, 1, 1, 1,
-0.8833151, 0.2579544, -2.936571, 1, 1, 1, 1, 1,
-0.8793529, -1.788922, -2.219941, 1, 1, 1, 1, 1,
-0.8793455, 1.437563, -1.711985, 1, 1, 1, 1, 1,
-0.8733008, -0.6273364, -2.854349, 1, 1, 1, 1, 1,
-0.8709748, -1.703049, -2.014446, 1, 1, 1, 1, 1,
-0.8700431, 0.8242134, -2.561405, 1, 1, 1, 1, 1,
-0.8672349, 0.07418026, -0.9132103, 1, 1, 1, 1, 1,
-0.8668521, 1.047938, -1.803149, 1, 1, 1, 1, 1,
-0.8592902, 0.422729, -2.084082, 0, 0, 1, 1, 1,
-0.8565399, -0.9215873, -0.6989213, 1, 0, 0, 1, 1,
-0.8551931, 0.2020115, 0.9883715, 1, 0, 0, 1, 1,
-0.8516361, 0.7901557, -1.398587, 1, 0, 0, 1, 1,
-0.8492309, 0.7547253, -1.174278, 1, 0, 0, 1, 1,
-0.8487063, 0.07906716, -2.284557, 1, 0, 0, 1, 1,
-0.8413193, 1.077309, 0.1969297, 0, 0, 0, 1, 1,
-0.8368391, -0.457776, -2.832963, 0, 0, 0, 1, 1,
-0.8270791, 0.334776, -1.65297, 0, 0, 0, 1, 1,
-0.8251385, 0.6986175, -0.6731496, 0, 0, 0, 1, 1,
-0.8249779, 0.962909, 1.003203, 0, 0, 0, 1, 1,
-0.8238313, -0.5227674, -5.084363, 0, 0, 0, 1, 1,
-0.8197113, 0.5426283, -1.209648, 0, 0, 0, 1, 1,
-0.8164587, -0.05422775, -1.388321, 1, 1, 1, 1, 1,
-0.8160893, 2.318407, -0.3671265, 1, 1, 1, 1, 1,
-0.8098871, -0.526444, -3.491022, 1, 1, 1, 1, 1,
-0.8061762, 0.7182158, -0.9791434, 1, 1, 1, 1, 1,
-0.7980768, -0.4956832, -2.056499, 1, 1, 1, 1, 1,
-0.7958832, -0.4613295, -4.335088, 1, 1, 1, 1, 1,
-0.7831181, -0.4083708, -3.616278, 1, 1, 1, 1, 1,
-0.7830247, 0.8968707, -0.1414619, 1, 1, 1, 1, 1,
-0.7823369, 0.3677299, -0.3645732, 1, 1, 1, 1, 1,
-0.7780557, 1.754139, 0.2474442, 1, 1, 1, 1, 1,
-0.7776552, 0.4629368, -1.474742, 1, 1, 1, 1, 1,
-0.7773471, -0.356311, -3.005407, 1, 1, 1, 1, 1,
-0.7764025, -0.5293033, -1.421787, 1, 1, 1, 1, 1,
-0.7751479, -1.278766, -1.612159, 1, 1, 1, 1, 1,
-0.7722796, -0.009226899, -1.069721, 1, 1, 1, 1, 1,
-0.7721291, -0.04550122, -0.1869269, 0, 0, 1, 1, 1,
-0.7682242, 1.501887, -2.046596, 1, 0, 0, 1, 1,
-0.759142, -0.6454274, -1.707547, 1, 0, 0, 1, 1,
-0.7575684, -0.3454614, -2.197356, 1, 0, 0, 1, 1,
-0.7565215, 0.2571156, -3.026852, 1, 0, 0, 1, 1,
-0.756295, 1.046052, -1.045151, 1, 0, 0, 1, 1,
-0.7557415, 1.793205, -1.775732, 0, 0, 0, 1, 1,
-0.7554682, 2.535525, -0.4761665, 0, 0, 0, 1, 1,
-0.7530597, -0.3743508, -0.954907, 0, 0, 0, 1, 1,
-0.7513639, -0.6223122, -1.43706, 0, 0, 0, 1, 1,
-0.7496551, -0.1361034, -2.246954, 0, 0, 0, 1, 1,
-0.7482584, 0.1996199, -1.347685, 0, 0, 0, 1, 1,
-0.7317867, -0.08405875, -0.1436008, 0, 0, 0, 1, 1,
-0.7232557, -0.2915495, -0.6835225, 1, 1, 1, 1, 1,
-0.7220844, 1.544231, 0.2129624, 1, 1, 1, 1, 1,
-0.7155511, 0.1915564, -1.879398, 1, 1, 1, 1, 1,
-0.7148306, 0.6782932, -0.2367609, 1, 1, 1, 1, 1,
-0.713698, 0.629966, -2.516209, 1, 1, 1, 1, 1,
-0.7120638, -0.860272, -1.253118, 1, 1, 1, 1, 1,
-0.7112114, 0.5753933, -1.207346, 1, 1, 1, 1, 1,
-0.7077448, 1.031856, -0.7520663, 1, 1, 1, 1, 1,
-0.7011992, 0.852163, -1.184859, 1, 1, 1, 1, 1,
-0.6977923, 0.4288897, -1.107629, 1, 1, 1, 1, 1,
-0.6943148, 1.006951, -0.101105, 1, 1, 1, 1, 1,
-0.6900095, -0.8034493, -3.030507, 1, 1, 1, 1, 1,
-0.6814508, -0.06309189, -2.727418, 1, 1, 1, 1, 1,
-0.6800901, -0.9572176, -1.966182, 1, 1, 1, 1, 1,
-0.6777041, 0.6538063, -2.927038, 1, 1, 1, 1, 1,
-0.6765448, 0.4296829, -1.450343, 0, 0, 1, 1, 1,
-0.673231, -0.5157781, -1.653816, 1, 0, 0, 1, 1,
-0.6714088, -0.3674166, -1.871903, 1, 0, 0, 1, 1,
-0.6611865, 0.3176093, -0.9243147, 1, 0, 0, 1, 1,
-0.6605892, -0.05518871, -3.425195, 1, 0, 0, 1, 1,
-0.657887, -0.5690098, -1.560338, 1, 0, 0, 1, 1,
-0.6556019, -1.76652, -0.9976078, 0, 0, 0, 1, 1,
-0.655471, -0.04959778, -1.730463, 0, 0, 0, 1, 1,
-0.6536624, 1.19873, -0.9425449, 0, 0, 0, 1, 1,
-0.652255, -2.196942, -0.7505524, 0, 0, 0, 1, 1,
-0.6426621, 0.03543287, -0.8284268, 0, 0, 0, 1, 1,
-0.6395983, 1.849129, -1.839275, 0, 0, 0, 1, 1,
-0.638097, -0.7532492, -3.955204, 0, 0, 0, 1, 1,
-0.6358914, -0.7300249, -3.172945, 1, 1, 1, 1, 1,
-0.6315697, 0.4438031, -1.424449, 1, 1, 1, 1, 1,
-0.6266297, 0.09405709, -0.5041851, 1, 1, 1, 1, 1,
-0.6246299, -0.08235721, -1.16367, 1, 1, 1, 1, 1,
-0.6231742, -0.7324966, -3.329809, 1, 1, 1, 1, 1,
-0.6226687, -0.07448138, -3.038, 1, 1, 1, 1, 1,
-0.6143438, -0.04250242, -0.6874991, 1, 1, 1, 1, 1,
-0.6106123, -0.719478, -2.057321, 1, 1, 1, 1, 1,
-0.610111, 1.205947, -1.212802, 1, 1, 1, 1, 1,
-0.6101, -1.169808, -4.265533, 1, 1, 1, 1, 1,
-0.6086673, -1.175932, -3.436936, 1, 1, 1, 1, 1,
-0.6085225, 0.9269328, -1.082927, 1, 1, 1, 1, 1,
-0.60785, -0.2830192, -2.704912, 1, 1, 1, 1, 1,
-0.6039423, -0.5677846, -3.26981, 1, 1, 1, 1, 1,
-0.6022357, -1.027266, -1.850853, 1, 1, 1, 1, 1,
-0.6018841, 1.172917, 0.604023, 0, 0, 1, 1, 1,
-0.5949087, -1.68964, -2.149739, 1, 0, 0, 1, 1,
-0.5943455, -0.7520952, -0.9775753, 1, 0, 0, 1, 1,
-0.593973, -0.5203438, -2.02473, 1, 0, 0, 1, 1,
-0.5936059, 0.3689105, 0.4961823, 1, 0, 0, 1, 1,
-0.5932571, 0.2112322, -3.171628, 1, 0, 0, 1, 1,
-0.5930478, -1.594661, -0.6655114, 0, 0, 0, 1, 1,
-0.5918825, 0.4531127, -1.693845, 0, 0, 0, 1, 1,
-0.5886377, -0.01058549, -0.9245967, 0, 0, 0, 1, 1,
-0.5883634, 0.6111296, -0.5210017, 0, 0, 0, 1, 1,
-0.5883508, -0.06847645, -2.191461, 0, 0, 0, 1, 1,
-0.5877036, -0.9668959, -3.044857, 0, 0, 0, 1, 1,
-0.5864722, -1.07647, -2.882553, 0, 0, 0, 1, 1,
-0.5830861, -0.3023848, 0.2224834, 1, 1, 1, 1, 1,
-0.5799884, 0.8966547, -1.108063, 1, 1, 1, 1, 1,
-0.5794799, -1.453449, -4.386329, 1, 1, 1, 1, 1,
-0.5784755, -0.6987778, -0.83232, 1, 1, 1, 1, 1,
-0.5779993, -1.449441, -3.585838, 1, 1, 1, 1, 1,
-0.5703256, -0.3855763, -1.54704, 1, 1, 1, 1, 1,
-0.5684931, -1.102402, -1.150366, 1, 1, 1, 1, 1,
-0.567137, -0.3385406, -1.564399, 1, 1, 1, 1, 1,
-0.5668636, -1.141903, -3.469712, 1, 1, 1, 1, 1,
-0.5642242, -0.09815236, -2.260835, 1, 1, 1, 1, 1,
-0.5640125, 1.17888, -0.6421698, 1, 1, 1, 1, 1,
-0.5582885, 0.1788429, -1.648545, 1, 1, 1, 1, 1,
-0.5571763, 0.002050635, -0.994271, 1, 1, 1, 1, 1,
-0.5556573, -0.9268955, -3.266493, 1, 1, 1, 1, 1,
-0.5547842, -1.629927, -1.578176, 1, 1, 1, 1, 1,
-0.5524865, -0.5677012, -4.733273, 0, 0, 1, 1, 1,
-0.5466483, 0.3181581, -0.315513, 1, 0, 0, 1, 1,
-0.5465847, -1.311507, -4.696355, 1, 0, 0, 1, 1,
-0.5417392, -0.7837824, -3.044129, 1, 0, 0, 1, 1,
-0.535112, -0.9149678, -3.292724, 1, 0, 0, 1, 1,
-0.5340998, 0.1870783, -1.579247, 1, 0, 0, 1, 1,
-0.5254589, 0.2981108, -1.652425, 0, 0, 0, 1, 1,
-0.5246256, 0.4884062, -1.449558, 0, 0, 0, 1, 1,
-0.5179598, -0.342015, -2.302177, 0, 0, 0, 1, 1,
-0.5154532, -0.3874112, -1.525408, 0, 0, 0, 1, 1,
-0.5120671, -1.40266, -3.47328, 0, 0, 0, 1, 1,
-0.5118681, -0.3652461, -1.267254, 0, 0, 0, 1, 1,
-0.5098822, -0.1984546, -0.3040763, 0, 0, 0, 1, 1,
-0.5068514, -1.85139, -3.217506, 1, 1, 1, 1, 1,
-0.5061921, 0.2759855, -1.547371, 1, 1, 1, 1, 1,
-0.4994559, 1.235608, -0.290805, 1, 1, 1, 1, 1,
-0.4970382, 0.6129242, -1.061453, 1, 1, 1, 1, 1,
-0.485814, -0.3145603, -2.672853, 1, 1, 1, 1, 1,
-0.4826956, -0.1069027, -2.273546, 1, 1, 1, 1, 1,
-0.4824345, -0.3965939, -1.91688, 1, 1, 1, 1, 1,
-0.4805341, -1.068883, -3.586554, 1, 1, 1, 1, 1,
-0.4747436, 0.8603515, -2.130523, 1, 1, 1, 1, 1,
-0.4705856, -0.9873397, -2.94582, 1, 1, 1, 1, 1,
-0.4697704, 1.531636, 0.1146595, 1, 1, 1, 1, 1,
-0.467652, -0.7811202, -3.31259, 1, 1, 1, 1, 1,
-0.4658547, 0.3723277, -0.8691587, 1, 1, 1, 1, 1,
-0.462703, 1.041454, 0.2534287, 1, 1, 1, 1, 1,
-0.4601071, -0.4686695, -1.881645, 1, 1, 1, 1, 1,
-0.4599783, -1.144697, -3.613742, 0, 0, 1, 1, 1,
-0.4550158, 0.4354249, -0.7261298, 1, 0, 0, 1, 1,
-0.4501394, 0.3527196, -1.947529, 1, 0, 0, 1, 1,
-0.4464423, 0.4960977, -1.580313, 1, 0, 0, 1, 1,
-0.446144, 0.2025666, -0.3317547, 1, 0, 0, 1, 1,
-0.4458443, -0.02198721, -2.196701, 1, 0, 0, 1, 1,
-0.444834, 0.03752151, -1.285599, 0, 0, 0, 1, 1,
-0.4423549, -0.1866957, -0.7843482, 0, 0, 0, 1, 1,
-0.4420711, -1.836654, -2.722957, 0, 0, 0, 1, 1,
-0.4411314, -1.120346, -4.094263, 0, 0, 0, 1, 1,
-0.4377647, -2.002604, -2.84303, 0, 0, 0, 1, 1,
-0.4320042, -1.101261, -3.593989, 0, 0, 0, 1, 1,
-0.4297239, -0.3128276, -1.846487, 0, 0, 0, 1, 1,
-0.428573, -2.784546, -3.850864, 1, 1, 1, 1, 1,
-0.4273124, -0.4905637, -3.077779, 1, 1, 1, 1, 1,
-0.423751, -0.3664871, -0.5459931, 1, 1, 1, 1, 1,
-0.4209043, 0.2711397, -0.80481, 1, 1, 1, 1, 1,
-0.4204245, 1.846218, -0.8077869, 1, 1, 1, 1, 1,
-0.4153913, -1.392438, -2.588062, 1, 1, 1, 1, 1,
-0.4124929, 1.841659, -0.7314051, 1, 1, 1, 1, 1,
-0.4123611, -0.2017165, -1.674154, 1, 1, 1, 1, 1,
-0.4080664, 0.454737, -0.9612797, 1, 1, 1, 1, 1,
-0.4079405, 0.1169418, -0.5959775, 1, 1, 1, 1, 1,
-0.4038488, 1.726198, -0.7566487, 1, 1, 1, 1, 1,
-0.3992231, -1.365306, -2.116029, 1, 1, 1, 1, 1,
-0.3988573, 0.3748533, 0.4414711, 1, 1, 1, 1, 1,
-0.3962729, 0.2572562, 0.01267047, 1, 1, 1, 1, 1,
-0.3892187, -0.4706532, -0.9862294, 1, 1, 1, 1, 1,
-0.3883129, -0.4367559, -2.679668, 0, 0, 1, 1, 1,
-0.3882993, -0.4819193, -2.307128, 1, 0, 0, 1, 1,
-0.3800359, 1.528893, -1.032223, 1, 0, 0, 1, 1,
-0.3743223, 0.4059289, -2.349952, 1, 0, 0, 1, 1,
-0.3701392, 0.3825239, -1.886273, 1, 0, 0, 1, 1,
-0.367308, -1.022755, -3.494675, 1, 0, 0, 1, 1,
-0.3618683, 0.8272483, -0.4775423, 0, 0, 0, 1, 1,
-0.3612612, -1.250622, -1.568107, 0, 0, 0, 1, 1,
-0.358873, -1.115362, -0.1471882, 0, 0, 0, 1, 1,
-0.3584074, 0.1141114, -1.052291, 0, 0, 0, 1, 1,
-0.3574777, 0.5520586, -0.5573747, 0, 0, 0, 1, 1,
-0.3574572, 0.460638, -2.554436, 0, 0, 0, 1, 1,
-0.356428, 1.538365, -0.0868181, 0, 0, 0, 1, 1,
-0.3551517, 0.3065972, -2.970224, 1, 1, 1, 1, 1,
-0.3541295, -1.412746, -3.162352, 1, 1, 1, 1, 1,
-0.3537422, 0.853099, 0.7972051, 1, 1, 1, 1, 1,
-0.3525025, 0.8691607, -1.047649, 1, 1, 1, 1, 1,
-0.3503611, 0.7070587, -1.424963, 1, 1, 1, 1, 1,
-0.3458041, 1.663684, -1.092386, 1, 1, 1, 1, 1,
-0.3440944, 0.3981589, -0.7790385, 1, 1, 1, 1, 1,
-0.342913, -0.3766747, -2.823153, 1, 1, 1, 1, 1,
-0.3424321, 0.8173912, 0.03795815, 1, 1, 1, 1, 1,
-0.3423514, -1.360893, -3.29401, 1, 1, 1, 1, 1,
-0.341502, -0.3077485, -3.264494, 1, 1, 1, 1, 1,
-0.3396171, -0.832979, -1.174118, 1, 1, 1, 1, 1,
-0.3393147, 0.8076981, -0.9014442, 1, 1, 1, 1, 1,
-0.3391058, 0.706878, -1.05522, 1, 1, 1, 1, 1,
-0.33582, -0.9509541, -1.860982, 1, 1, 1, 1, 1,
-0.3320812, -0.3493529, -0.9989507, 0, 0, 1, 1, 1,
-0.3287239, -0.3194752, -2.648856, 1, 0, 0, 1, 1,
-0.3284696, 1.589504, -1.720104, 1, 0, 0, 1, 1,
-0.3222887, 0.2042595, -1.305429, 1, 0, 0, 1, 1,
-0.320818, 0.6214123, 0.1230092, 1, 0, 0, 1, 1,
-0.3199181, 1.359802, 1.526155, 1, 0, 0, 1, 1,
-0.3172115, 0.3135029, -1.627458, 0, 0, 0, 1, 1,
-0.3164474, 0.2507552, -1.16778, 0, 0, 0, 1, 1,
-0.3134721, -0.2308566, -0.1784139, 0, 0, 0, 1, 1,
-0.3104121, -0.6906601, -3.219686, 0, 0, 0, 1, 1,
-0.3068828, -0.03058689, -0.5216987, 0, 0, 0, 1, 1,
-0.3050124, 0.143408, -1.496449, 0, 0, 0, 1, 1,
-0.2995757, 0.9498597, -0.4945879, 0, 0, 0, 1, 1,
-0.2955598, 1.275388, -0.6905802, 1, 1, 1, 1, 1,
-0.2914051, 0.7202582, -0.4273297, 1, 1, 1, 1, 1,
-0.2881602, 1.884985, -0.4253688, 1, 1, 1, 1, 1,
-0.2874063, -1.584511, -4.649275, 1, 1, 1, 1, 1,
-0.2864118, 1.635107, 0.1760774, 1, 1, 1, 1, 1,
-0.2857001, 1.817616, 0.1248056, 1, 1, 1, 1, 1,
-0.2793429, 2.254341, 2.565462, 1, 1, 1, 1, 1,
-0.2788543, -1.554163, -5.135917, 1, 1, 1, 1, 1,
-0.2757027, 1.251964, 0.7002457, 1, 1, 1, 1, 1,
-0.2741886, -1.076045, -3.740373, 1, 1, 1, 1, 1,
-0.2656168, -0.8914928, -2.063133, 1, 1, 1, 1, 1,
-0.2646988, 1.045033, 0.8180472, 1, 1, 1, 1, 1,
-0.264236, 0.3453796, -1.739994, 1, 1, 1, 1, 1,
-0.262116, 0.2880762, -2.563588, 1, 1, 1, 1, 1,
-0.2596225, -0.1133459, -1.507648, 1, 1, 1, 1, 1,
-0.2593556, 0.3916187, 1.403647, 0, 0, 1, 1, 1,
-0.2536305, -0.09599123, -2.158057, 1, 0, 0, 1, 1,
-0.2523173, -0.2961153, -3.715714, 1, 0, 0, 1, 1,
-0.2521932, -0.08465513, -1.690511, 1, 0, 0, 1, 1,
-0.2507223, -0.9406764, -3.977504, 1, 0, 0, 1, 1,
-0.2461654, 0.3600898, 0.3297704, 1, 0, 0, 1, 1,
-0.24435, 0.503682, -1.394307, 0, 0, 0, 1, 1,
-0.2426718, -0.7647133, -2.581836, 0, 0, 0, 1, 1,
-0.2425903, -0.2521303, -2.324763, 0, 0, 0, 1, 1,
-0.2378915, -0.9499711, -3.618546, 0, 0, 0, 1, 1,
-0.237123, 0.7941244, 0.06464416, 0, 0, 0, 1, 1,
-0.2370118, 0.2990098, 1.151329, 0, 0, 0, 1, 1,
-0.2256235, 0.1820074, -0.1935175, 0, 0, 0, 1, 1,
-0.2249244, -1.816152, -3.188946, 1, 1, 1, 1, 1,
-0.2245116, 0.7936985, 0.123831, 1, 1, 1, 1, 1,
-0.2241067, -0.4071609, -1.759445, 1, 1, 1, 1, 1,
-0.223816, -1.086117, -3.577842, 1, 1, 1, 1, 1,
-0.221323, 0.1201658, -0.7648095, 1, 1, 1, 1, 1,
-0.2212932, -0.08798324, -2.505981, 1, 1, 1, 1, 1,
-0.2183613, 0.5421096, 0.6961632, 1, 1, 1, 1, 1,
-0.2176769, -1.300451, -4.561189, 1, 1, 1, 1, 1,
-0.2161937, 1.749829, 1.325637, 1, 1, 1, 1, 1,
-0.2137724, -0.4704196, -2.513505, 1, 1, 1, 1, 1,
-0.2078402, 0.4890043, 0.692732, 1, 1, 1, 1, 1,
-0.1981688, 1.17646, 0.0776004, 1, 1, 1, 1, 1,
-0.1914569, -0.7778808, -2.308902, 1, 1, 1, 1, 1,
-0.1806071, -0.4562949, -1.53723, 1, 1, 1, 1, 1,
-0.1725798, -0.7404101, -3.036859, 1, 1, 1, 1, 1,
-0.1690513, 0.1436414, -0.4145997, 0, 0, 1, 1, 1,
-0.1664036, 0.9941866, 0.2757888, 1, 0, 0, 1, 1,
-0.1663472, -1.800951, -4.252223, 1, 0, 0, 1, 1,
-0.1597073, -0.4035004, -3.981348, 1, 0, 0, 1, 1,
-0.1568623, -1.073384, -3.552738, 1, 0, 0, 1, 1,
-0.1536855, -0.4183315, -4.536152, 1, 0, 0, 1, 1,
-0.151872, -0.7863451, -4.133405, 0, 0, 0, 1, 1,
-0.1501346, 0.1542677, 1.355994, 0, 0, 0, 1, 1,
-0.1493288, -1.03879, -1.70631, 0, 0, 0, 1, 1,
-0.1464823, 1.583998, -1.221825, 0, 0, 0, 1, 1,
-0.1458033, 1.205238, 1.302386, 0, 0, 0, 1, 1,
-0.144625, 0.6339521, 0.2611487, 0, 0, 0, 1, 1,
-0.1406908, 0.00502881, 1.394287, 0, 0, 0, 1, 1,
-0.1388024, -0.008664962, -1.357827, 1, 1, 1, 1, 1,
-0.1345449, -0.2936455, -4.427711, 1, 1, 1, 1, 1,
-0.1302399, 1.169429, 1.11239, 1, 1, 1, 1, 1,
-0.127223, -0.4456112, -3.483724, 1, 1, 1, 1, 1,
-0.125474, 0.2258614, -0.6982124, 1, 1, 1, 1, 1,
-0.1245518, 0.794865, -0.9264081, 1, 1, 1, 1, 1,
-0.1142206, 0.08475183, 0.5509412, 1, 1, 1, 1, 1,
-0.1119886, 2.03854, -1.572847, 1, 1, 1, 1, 1,
-0.1066388, -1.601989, -4.506921, 1, 1, 1, 1, 1,
-0.1064912, -0.1911337, -1.870943, 1, 1, 1, 1, 1,
-0.1059095, 0.9302837, -0.2609659, 1, 1, 1, 1, 1,
-0.1056971, 0.5187356, -0.2726152, 1, 1, 1, 1, 1,
-0.1029638, 1.451466, 0.9019529, 1, 1, 1, 1, 1,
-0.1027908, -2.525696, -1.544863, 1, 1, 1, 1, 1,
-0.09891979, -1.06111, -4.703741, 1, 1, 1, 1, 1,
-0.09840981, 0.6629437, 0.2094482, 0, 0, 1, 1, 1,
-0.09832247, -0.4568777, -1.863879, 1, 0, 0, 1, 1,
-0.0962881, 0.145489, 0.668022, 1, 0, 0, 1, 1,
-0.09531822, 1.128783, -0.1091985, 1, 0, 0, 1, 1,
-0.08928978, 0.2254051, -0.7347752, 1, 0, 0, 1, 1,
-0.07977321, -0.8285594, -3.283725, 1, 0, 0, 1, 1,
-0.07317559, 0.3795525, -0.4306331, 0, 0, 0, 1, 1,
-0.07129627, -0.3333267, -2.450291, 0, 0, 0, 1, 1,
-0.07046995, -0.8255126, -1.736923, 0, 0, 0, 1, 1,
-0.06883109, 0.7787172, 0.2538213, 0, 0, 0, 1, 1,
-0.06797986, -2.021859, -2.930646, 0, 0, 0, 1, 1,
-0.06612705, 1.313896, 0.5552744, 0, 0, 0, 1, 1,
-0.0652495, 0.6903926, 1.899218, 0, 0, 0, 1, 1,
-0.06492393, -1.048537, -3.78166, 1, 1, 1, 1, 1,
-0.06184115, 0.8525936, -0.6515486, 1, 1, 1, 1, 1,
-0.058074, 0.4102118, -0.1357395, 1, 1, 1, 1, 1,
-0.05605656, -0.1752753, -1.219519, 1, 1, 1, 1, 1,
-0.05570243, 0.8136014, -0.4673137, 1, 1, 1, 1, 1,
-0.05323166, -0.6000747, -3.835548, 1, 1, 1, 1, 1,
-0.05175138, 2.66779, -0.7047042, 1, 1, 1, 1, 1,
-0.0510974, 2.241554, 0.4916423, 1, 1, 1, 1, 1,
-0.04917033, 1.144811, 0.8123819, 1, 1, 1, 1, 1,
-0.04636467, 0.25048, -1.331012, 1, 1, 1, 1, 1,
-0.04275927, 1.506889, 1.20871, 1, 1, 1, 1, 1,
-0.03482542, -0.2331515, -3.627034, 1, 1, 1, 1, 1,
-0.03404318, 0.3153496, -1.158273, 1, 1, 1, 1, 1,
-0.03069757, 0.8246841, 1.092355, 1, 1, 1, 1, 1,
-0.03006937, 0.4429692, 0.5488429, 1, 1, 1, 1, 1,
-0.02698032, 0.6198209, -1.054737, 0, 0, 1, 1, 1,
-0.02280152, -1.21173, -4.140983, 1, 0, 0, 1, 1,
-0.02247495, -2.172193, -1.801161, 1, 0, 0, 1, 1,
-0.02092372, -1.139635, -3.964347, 1, 0, 0, 1, 1,
-0.0206609, -1.031006, -3.197296, 1, 0, 0, 1, 1,
-0.004073946, 0.4713213, 0.1619072, 1, 0, 0, 1, 1,
-0.002253094, 0.1987018, -1.523519, 0, 0, 0, 1, 1,
-0.000725747, 0.5533548, 0.8905874, 0, 0, 0, 1, 1,
0.001247928, -0.2210817, 2.407038, 0, 0, 0, 1, 1,
0.002088223, -0.7636642, 5.102612, 0, 0, 0, 1, 1,
0.003802247, -0.01009805, 3.32129, 0, 0, 0, 1, 1,
0.004199557, -0.06962057, 2.82541, 0, 0, 0, 1, 1,
0.004666585, 0.2664998, -0.7164974, 0, 0, 0, 1, 1,
0.006564103, -0.604334, 3.8414, 1, 1, 1, 1, 1,
0.007127719, -0.0531419, 3.822415, 1, 1, 1, 1, 1,
0.01043047, -0.1458194, 2.122787, 1, 1, 1, 1, 1,
0.01669749, -0.6682318, 4.117509, 1, 1, 1, 1, 1,
0.01860766, 0.7459805, -1.199033, 1, 1, 1, 1, 1,
0.02544369, 1.16204, -0.4656048, 1, 1, 1, 1, 1,
0.02726055, 0.8285775, 1.666618, 1, 1, 1, 1, 1,
0.02777244, 0.22161, 1.349798, 1, 1, 1, 1, 1,
0.03554099, -0.7440006, 4.577922, 1, 1, 1, 1, 1,
0.03562969, 0.2299696, -0.3265331, 1, 1, 1, 1, 1,
0.03750028, -1.664292, 3.967414, 1, 1, 1, 1, 1,
0.04097217, -0.6626409, 3.877492, 1, 1, 1, 1, 1,
0.04427474, -1.799105, 2.215573, 1, 1, 1, 1, 1,
0.04441819, -0.1095233, 3.547145, 1, 1, 1, 1, 1,
0.04629684, 1.83257, 1.686215, 1, 1, 1, 1, 1,
0.04676076, 0.1066498, 0.7132967, 0, 0, 1, 1, 1,
0.04923372, 0.7527008, -0.1510694, 1, 0, 0, 1, 1,
0.04975176, -0.5295723, 1.418826, 1, 0, 0, 1, 1,
0.0514209, -1.119061, 4.119672, 1, 0, 0, 1, 1,
0.05462663, -0.004421018, 3.735766, 1, 0, 0, 1, 1,
0.0554265, -0.3355511, 4.40367, 1, 0, 0, 1, 1,
0.05793399, -0.7168515, 2.660468, 0, 0, 0, 1, 1,
0.0583111, -0.8918411, 3.336086, 0, 0, 0, 1, 1,
0.06491753, 0.7796295, 0.5036623, 0, 0, 0, 1, 1,
0.06606204, 0.1061043, -0.3700329, 0, 0, 0, 1, 1,
0.06694126, 0.911194, 1.176359, 0, 0, 0, 1, 1,
0.07086617, 1.345243, 1.404509, 0, 0, 0, 1, 1,
0.07110038, 1.326132, -0.1964249, 0, 0, 0, 1, 1,
0.07311483, -0.6107405, 2.011918, 1, 1, 1, 1, 1,
0.07344373, 0.5810394, 1.196977, 1, 1, 1, 1, 1,
0.07725286, 1.708626, -0.5551777, 1, 1, 1, 1, 1,
0.08072937, -0.9226626, 2.514738, 1, 1, 1, 1, 1,
0.08355742, -1.000924, 3.117299, 1, 1, 1, 1, 1,
0.08629838, -1.032228, 3.614805, 1, 1, 1, 1, 1,
0.09306364, -0.5264325, 3.763427, 1, 1, 1, 1, 1,
0.09369142, 1.691005, -0.4739546, 1, 1, 1, 1, 1,
0.09410194, 0.4075753, -0.7961606, 1, 1, 1, 1, 1,
0.1008235, 0.2119793, 2.650037, 1, 1, 1, 1, 1,
0.1017423, 0.4096124, 1.017323, 1, 1, 1, 1, 1,
0.1035671, -0.8985369, 3.598879, 1, 1, 1, 1, 1,
0.107171, -0.5597965, 2.387159, 1, 1, 1, 1, 1,
0.1087829, 1.157789, 1.05058, 1, 1, 1, 1, 1,
0.1095018, -0.2404375, 1.913089, 1, 1, 1, 1, 1,
0.1095907, 1.60995, -1.313256, 0, 0, 1, 1, 1,
0.1098932, -0.3295561, 3.388594, 1, 0, 0, 1, 1,
0.1104442, 0.8097985, -0.07964866, 1, 0, 0, 1, 1,
0.1128733, 0.4858674, -0.3113404, 1, 0, 0, 1, 1,
0.1188975, -0.9849117, 2.633854, 1, 0, 0, 1, 1,
0.1215306, 0.6205083, -0.008460101, 1, 0, 0, 1, 1,
0.1243173, 1.597149, -0.2179749, 0, 0, 0, 1, 1,
0.1257051, -0.8526502, 2.064002, 0, 0, 0, 1, 1,
0.1299102, -0.3667752, 2.596327, 0, 0, 0, 1, 1,
0.1326215, 1.583577, 0.09262412, 0, 0, 0, 1, 1,
0.1335237, -1.279554, 3.064546, 0, 0, 0, 1, 1,
0.1346162, 0.1767192, 1.927403, 0, 0, 0, 1, 1,
0.1356586, 0.1036625, 0.613244, 0, 0, 0, 1, 1,
0.13764, -0.4077236, 3.984377, 1, 1, 1, 1, 1,
0.1415858, -1.071744, 4.346109, 1, 1, 1, 1, 1,
0.1482883, 1.450072, 0.629438, 1, 1, 1, 1, 1,
0.150118, -0.03769908, 1.788644, 1, 1, 1, 1, 1,
0.1506245, -0.7564859, 2.186839, 1, 1, 1, 1, 1,
0.1577874, 0.379043, -0.1520381, 1, 1, 1, 1, 1,
0.160929, 0.881435, 0.6601748, 1, 1, 1, 1, 1,
0.1615249, -0.4933757, 2.773964, 1, 1, 1, 1, 1,
0.161538, 0.5693477, -0.5636815, 1, 1, 1, 1, 1,
0.1627098, 0.1502185, 1.493686, 1, 1, 1, 1, 1,
0.1637964, 1.165163, 0.5030165, 1, 1, 1, 1, 1,
0.1669948, 0.2501014, -1.005238, 1, 1, 1, 1, 1,
0.1674657, 0.1687659, 2.196698, 1, 1, 1, 1, 1,
0.1677893, 0.1142386, 1.216444, 1, 1, 1, 1, 1,
0.1679106, -0.718058, 3.151555, 1, 1, 1, 1, 1,
0.1744208, -0.977432, 4.719553, 0, 0, 1, 1, 1,
0.1767008, 0.5121233, 0.1992476, 1, 0, 0, 1, 1,
0.1801346, -0.1797889, 2.503748, 1, 0, 0, 1, 1,
0.1830752, 0.7722564, -0.8120453, 1, 0, 0, 1, 1,
0.183512, 0.2805933, -1.054916, 1, 0, 0, 1, 1,
0.1843314, 0.6104264, 0.4206493, 1, 0, 0, 1, 1,
0.1863431, 1.126703, 0.690512, 0, 0, 0, 1, 1,
0.1889935, 0.1608055, 1.01407, 0, 0, 0, 1, 1,
0.1962432, -0.6233641, 2.738867, 0, 0, 0, 1, 1,
0.1986025, 2.075735, -0.6117612, 0, 0, 0, 1, 1,
0.1986109, 1.365515, -0.3997681, 0, 0, 0, 1, 1,
0.2026728, -1.721341, 0.8514455, 0, 0, 0, 1, 1,
0.2085365, 0.7845457, 1.135624, 0, 0, 0, 1, 1,
0.2103307, -1.678128, 3.262089, 1, 1, 1, 1, 1,
0.2136306, -1.673855, 2.772766, 1, 1, 1, 1, 1,
0.2180458, -0.4665639, 1.866603, 1, 1, 1, 1, 1,
0.2258921, 0.3254451, 3.546169, 1, 1, 1, 1, 1,
0.2266682, 0.7126913, 0.1016718, 1, 1, 1, 1, 1,
0.2379383, 2.060732, 1.735613, 1, 1, 1, 1, 1,
0.2394668, -0.3668944, 2.747526, 1, 1, 1, 1, 1,
0.2405633, -0.6042461, 3.533048, 1, 1, 1, 1, 1,
0.2419192, -0.844816, 4.209741, 1, 1, 1, 1, 1,
0.2459127, -0.5637713, 2.801098, 1, 1, 1, 1, 1,
0.2501759, -0.656813, 3.997693, 1, 1, 1, 1, 1,
0.2523846, 1.112, -1.704512, 1, 1, 1, 1, 1,
0.2580186, -0.3311253, 1.704891, 1, 1, 1, 1, 1,
0.259876, -0.2333542, 2.339879, 1, 1, 1, 1, 1,
0.2613948, 0.7162397, 1.733853, 1, 1, 1, 1, 1,
0.2631905, 1.049222, 0.3183661, 0, 0, 1, 1, 1,
0.2638746, 1.106398, 1.383169, 1, 0, 0, 1, 1,
0.2648177, -0.4329764, 2.261853, 1, 0, 0, 1, 1,
0.2698421, 0.01009094, 0.5069149, 1, 0, 0, 1, 1,
0.2707261, -0.2983454, 2.094701, 1, 0, 0, 1, 1,
0.2712024, -0.2215421, 3.448188, 1, 0, 0, 1, 1,
0.276187, 1.382345, 1.469002, 0, 0, 0, 1, 1,
0.2807844, 1.255815, -0.4109844, 0, 0, 0, 1, 1,
0.2916878, 0.8768386, 1.636503, 0, 0, 0, 1, 1,
0.2943347, 2.295875, -0.8055211, 0, 0, 0, 1, 1,
0.2957362, -1.639478, 2.181886, 0, 0, 0, 1, 1,
0.3021037, 1.24861, 1.333848, 0, 0, 0, 1, 1,
0.3054265, 1.348532, -1.154172, 0, 0, 0, 1, 1,
0.3059094, 0.8524413, 1.593664, 1, 1, 1, 1, 1,
0.3069469, -0.6735439, 3.119848, 1, 1, 1, 1, 1,
0.3071364, -0.09512205, 2.116714, 1, 1, 1, 1, 1,
0.3166274, 0.54256, 0.3023522, 1, 1, 1, 1, 1,
0.3182457, -1.198057, 3.574883, 1, 1, 1, 1, 1,
0.3191627, 0.5324358, 1.369178, 1, 1, 1, 1, 1,
0.3212493, 0.1741785, 0.2191283, 1, 1, 1, 1, 1,
0.3243248, -0.6174836, 3.991282, 1, 1, 1, 1, 1,
0.3268648, -0.3025614, 1.833565, 1, 1, 1, 1, 1,
0.3269702, -0.7904931, 2.59123, 1, 1, 1, 1, 1,
0.3280425, -1.245308, 3.027743, 1, 1, 1, 1, 1,
0.3282343, -0.3299075, 2.299713, 1, 1, 1, 1, 1,
0.3282682, 0.3876078, -0.8271685, 1, 1, 1, 1, 1,
0.3336908, -0.2636593, 2.197425, 1, 1, 1, 1, 1,
0.3352033, 0.9273176, 0.7049401, 1, 1, 1, 1, 1,
0.3435677, -0.3781338, 2.534281, 0, 0, 1, 1, 1,
0.3490591, 0.4664173, -0.2141538, 1, 0, 0, 1, 1,
0.3515638, -1.255891, 2.979139, 1, 0, 0, 1, 1,
0.3522491, -0.1084078, 2.689322, 1, 0, 0, 1, 1,
0.3570662, 0.07868612, 3.110877, 1, 0, 0, 1, 1,
0.3598829, -0.4755465, 2.084852, 1, 0, 0, 1, 1,
0.3637733, -0.9743176, 2.318115, 0, 0, 0, 1, 1,
0.3656514, -1.297299, 4.52703, 0, 0, 0, 1, 1,
0.370483, -1.538891, 3.640986, 0, 0, 0, 1, 1,
0.3754087, 0.5359834, 1.531461, 0, 0, 0, 1, 1,
0.3801034, 0.1217431, -1.254181, 0, 0, 0, 1, 1,
0.3816002, -0.03119746, 1.082811, 0, 0, 0, 1, 1,
0.3837964, 0.4383927, -0.4785898, 0, 0, 0, 1, 1,
0.3962402, -1.83221, 4.386928, 1, 1, 1, 1, 1,
0.4024778, 0.7771617, -0.9012769, 1, 1, 1, 1, 1,
0.404551, -0.4809517, 2.692471, 1, 1, 1, 1, 1,
0.4060411, -1.488276, 3.676032, 1, 1, 1, 1, 1,
0.4088993, -0.826449, 2.009991, 1, 1, 1, 1, 1,
0.4095267, 2.073151, 0.4693294, 1, 1, 1, 1, 1,
0.4101877, -0.3887843, 2.115587, 1, 1, 1, 1, 1,
0.4133419, -0.3868768, 2.971429, 1, 1, 1, 1, 1,
0.4143729, 0.1699766, 0.8988313, 1, 1, 1, 1, 1,
0.4147623, 0.2180713, 2.755526, 1, 1, 1, 1, 1,
0.4150698, -1.18773, 2.011202, 1, 1, 1, 1, 1,
0.4154839, -0.3192488, 2.885327, 1, 1, 1, 1, 1,
0.4186876, -1.408565, 2.790364, 1, 1, 1, 1, 1,
0.4188278, -0.9538203, 1.087794, 1, 1, 1, 1, 1,
0.421241, -0.8282192, 2.833601, 1, 1, 1, 1, 1,
0.4258198, -1.116536, 3.942122, 0, 0, 1, 1, 1,
0.4275025, -0.2973396, 1.876384, 1, 0, 0, 1, 1,
0.4328886, -1.385667, 2.974448, 1, 0, 0, 1, 1,
0.4333797, 0.394913, 0.7853287, 1, 0, 0, 1, 1,
0.434472, 0.2305544, 0.5164954, 1, 0, 0, 1, 1,
0.4394199, -0.4052302, 0.8326188, 1, 0, 0, 1, 1,
0.4450042, -1.198314, 3.967375, 0, 0, 0, 1, 1,
0.4612935, -1.261095, 3.904013, 0, 0, 0, 1, 1,
0.4671761, 1.495353, 0.937734, 0, 0, 0, 1, 1,
0.4677852, 0.1141893, 0.8794194, 0, 0, 0, 1, 1,
0.471456, 0.811873, -0.9857418, 0, 0, 0, 1, 1,
0.4805538, -0.05485332, 1.11083, 0, 0, 0, 1, 1,
0.4809109, 1.077974, 0.5425081, 0, 0, 0, 1, 1,
0.482183, 1.772747, 0.2265222, 1, 1, 1, 1, 1,
0.4828784, -0.6095576, 2.534239, 1, 1, 1, 1, 1,
0.4841193, -1.598224, 1.960485, 1, 1, 1, 1, 1,
0.4973748, -0.7712654, 3.804251, 1, 1, 1, 1, 1,
0.5016361, -1.445274, 4.004184, 1, 1, 1, 1, 1,
0.502407, 0.4978387, 2.04714, 1, 1, 1, 1, 1,
0.5085787, -1.833333, 2.579549, 1, 1, 1, 1, 1,
0.5111781, 0.6240799, -0.09142708, 1, 1, 1, 1, 1,
0.5117257, 0.06413735, 0.5117104, 1, 1, 1, 1, 1,
0.5130559, 0.1528398, 1.487554, 1, 1, 1, 1, 1,
0.5145187, 0.287747, -0.1160944, 1, 1, 1, 1, 1,
0.5148247, -0.6846097, 1.32672, 1, 1, 1, 1, 1,
0.5161432, -0.9513001, 3.082524, 1, 1, 1, 1, 1,
0.5170962, -0.6635152, 3.433402, 1, 1, 1, 1, 1,
0.5214117, 0.2362995, 0.6370831, 1, 1, 1, 1, 1,
0.5235111, 1.305941, -0.2293337, 0, 0, 1, 1, 1,
0.5258933, 0.644775, 1.942439, 1, 0, 0, 1, 1,
0.5282357, 0.1962847, 2.335449, 1, 0, 0, 1, 1,
0.5322383, -0.09796395, 1.827766, 1, 0, 0, 1, 1,
0.53736, -1.200112, 2.083036, 1, 0, 0, 1, 1,
0.5380938, 0.4647084, -0.2635043, 1, 0, 0, 1, 1,
0.5408664, 0.5136405, 1.450814, 0, 0, 0, 1, 1,
0.5434021, 0.7967796, 0.4594821, 0, 0, 0, 1, 1,
0.551283, -0.1157123, 1.396719, 0, 0, 0, 1, 1,
0.5520213, 0.9554837, -0.7688223, 0, 0, 0, 1, 1,
0.5546168, -0.2554499, 1.59694, 0, 0, 0, 1, 1,
0.5554963, -0.9073561, 2.001766, 0, 0, 0, 1, 1,
0.5595961, -0.6549075, 2.627911, 0, 0, 0, 1, 1,
0.5619348, -1.004795, 3.608831, 1, 1, 1, 1, 1,
0.5655497, 0.7385491, -0.00669969, 1, 1, 1, 1, 1,
0.566545, 0.327225, 0.9538174, 1, 1, 1, 1, 1,
0.5674449, -1.684784, 2.624008, 1, 1, 1, 1, 1,
0.5689113, 0.8057773, -0.3672126, 1, 1, 1, 1, 1,
0.5712938, 0.3683397, 1.595578, 1, 1, 1, 1, 1,
0.5726669, -0.3731157, 1.643755, 1, 1, 1, 1, 1,
0.5739319, 0.01003672, 1.797812, 1, 1, 1, 1, 1,
0.5773312, -0.7190304, 1.891177, 1, 1, 1, 1, 1,
0.5800653, 1.644472, 0.8953828, 1, 1, 1, 1, 1,
0.5843282, 1.247788, 0.6553522, 1, 1, 1, 1, 1,
0.5877206, -1.392017, 3.402741, 1, 1, 1, 1, 1,
0.6000457, -0.4152694, 1.080619, 1, 1, 1, 1, 1,
0.6015925, -0.4362931, 0.6197108, 1, 1, 1, 1, 1,
0.6031401, -0.9426705, 3.356292, 1, 1, 1, 1, 1,
0.6033112, -1.531939, 2.379413, 0, 0, 1, 1, 1,
0.6042627, 0.2066389, 1.308605, 1, 0, 0, 1, 1,
0.6072862, 0.5980402, 1.015566, 1, 0, 0, 1, 1,
0.611445, 2.094854, 0.2818262, 1, 0, 0, 1, 1,
0.611972, 1.675523, -0.9726743, 1, 0, 0, 1, 1,
0.6127347, 2.275394, 0.03335432, 1, 0, 0, 1, 1,
0.617354, 2.210238, -1.481903, 0, 0, 0, 1, 1,
0.6233023, -0.7471424, 1.413581, 0, 0, 0, 1, 1,
0.6246527, -0.05841891, 1.631125, 0, 0, 0, 1, 1,
0.6294143, -0.97517, 1.246667, 0, 0, 0, 1, 1,
0.6311524, -0.7836413, 3.21462, 0, 0, 0, 1, 1,
0.6317846, 0.5068616, -0.248965, 0, 0, 0, 1, 1,
0.6341337, 0.590578, 0.4364838, 0, 0, 0, 1, 1,
0.6363856, 1.625203, 1.545194, 1, 1, 1, 1, 1,
0.63655, 0.06888565, 1.698019, 1, 1, 1, 1, 1,
0.6378375, 1.165966, -0.9499274, 1, 1, 1, 1, 1,
0.6386584, -1.919213, 3.732977, 1, 1, 1, 1, 1,
0.639116, 0.1724629, 3.889172, 1, 1, 1, 1, 1,
0.6427057, 0.5000349, 1.793784, 1, 1, 1, 1, 1,
0.6427171, -0.3932518, 3.589799, 1, 1, 1, 1, 1,
0.6541873, 0.3204382, 0.8739151, 1, 1, 1, 1, 1,
0.6630186, -1.533186, 2.884458, 1, 1, 1, 1, 1,
0.6640888, 0.3099939, 2.526286, 1, 1, 1, 1, 1,
0.6713448, 0.27934, 0.2764565, 1, 1, 1, 1, 1,
0.6758745, 1.302805, 2.181386, 1, 1, 1, 1, 1,
0.6781767, -0.1326509, -0.1934749, 1, 1, 1, 1, 1,
0.682622, -1.199703, 3.70155, 1, 1, 1, 1, 1,
0.6919889, 0.08330847, 0.5564628, 1, 1, 1, 1, 1,
0.6951255, 0.5864021, 0.0814334, 0, 0, 1, 1, 1,
0.695221, 3.046594, 2.759211, 1, 0, 0, 1, 1,
0.6980523, -0.5162953, 1.642471, 1, 0, 0, 1, 1,
0.6990941, -0.06556642, 2.244885, 1, 0, 0, 1, 1,
0.7022371, 1.306167, 0.6742104, 1, 0, 0, 1, 1,
0.7037801, 1.470133, 0.4537522, 1, 0, 0, 1, 1,
0.7041869, 0.2519974, 1.604898, 0, 0, 0, 1, 1,
0.7052736, 0.8729553, 0.459359, 0, 0, 0, 1, 1,
0.7081586, -1.485461, 2.136939, 0, 0, 0, 1, 1,
0.7100168, 0.3978088, 0.9740942, 0, 0, 0, 1, 1,
0.7160034, -1.82892, 3.342191, 0, 0, 0, 1, 1,
0.7162435, -1.030973, 4.259761, 0, 0, 0, 1, 1,
0.7174359, -0.08357266, 1.765491, 0, 0, 0, 1, 1,
0.7228243, -0.4207934, 3.206481, 1, 1, 1, 1, 1,
0.722872, -1.358774, 2.075213, 1, 1, 1, 1, 1,
0.7246951, 0.867136, 0.2110353, 1, 1, 1, 1, 1,
0.736472, 0.2401261, 2.172085, 1, 1, 1, 1, 1,
0.7368622, -0.08478425, 3.931376, 1, 1, 1, 1, 1,
0.738562, -0.7211691, 1.638201, 1, 1, 1, 1, 1,
0.7465745, -0.4017504, 0.3792211, 1, 1, 1, 1, 1,
0.7478179, -0.04120177, 1.018259, 1, 1, 1, 1, 1,
0.7506003, -0.5275844, 2.651483, 1, 1, 1, 1, 1,
0.7512284, 1.658537, -0.1465427, 1, 1, 1, 1, 1,
0.756997, -0.6691722, 1.584436, 1, 1, 1, 1, 1,
0.7571406, -0.4236741, 3.674016, 1, 1, 1, 1, 1,
0.7590256, 0.8053266, 0.7355148, 1, 1, 1, 1, 1,
0.7610578, 0.7434964, 1.41833, 1, 1, 1, 1, 1,
0.7656373, -0.7685708, 3.140677, 1, 1, 1, 1, 1,
0.7690007, -0.3243726, 2.793232, 0, 0, 1, 1, 1,
0.7705077, -0.2401331, 1.208455, 1, 0, 0, 1, 1,
0.7721511, -0.6728069, 2.830835, 1, 0, 0, 1, 1,
0.7738125, 0.01226192, 2.571631, 1, 0, 0, 1, 1,
0.7750932, -0.3228589, 1.754213, 1, 0, 0, 1, 1,
0.7828994, -0.2566568, 2.880537, 1, 0, 0, 1, 1,
0.7871155, -1.092664, 4.128686, 0, 0, 0, 1, 1,
0.7899836, 1.263532, -0.2744899, 0, 0, 0, 1, 1,
0.7913309, 0.1496248, 1.288105, 0, 0, 0, 1, 1,
0.7913467, 1.027563, -0.01364766, 0, 0, 0, 1, 1,
0.7920493, -1.029749, 3.609395, 0, 0, 0, 1, 1,
0.7922297, -0.5635924, 1.717206, 0, 0, 0, 1, 1,
0.7960004, 0.8095557, -0.3183478, 0, 0, 0, 1, 1,
0.7970791, -1.216292, 4.317827, 1, 1, 1, 1, 1,
0.7979361, -0.838449, 1.146956, 1, 1, 1, 1, 1,
0.8036365, 0.8543066, 1.059131, 1, 1, 1, 1, 1,
0.8041703, -0.9462275, 1.342341, 1, 1, 1, 1, 1,
0.8095837, -0.9362002, 2.128592, 1, 1, 1, 1, 1,
0.8108181, -0.1991237, 3.477649, 1, 1, 1, 1, 1,
0.817115, -2.329093, 3.497661, 1, 1, 1, 1, 1,
0.819379, -1.531385, 1.389162, 1, 1, 1, 1, 1,
0.8194672, -0.3050503, 2.268718, 1, 1, 1, 1, 1,
0.8286209, 1.316002, 1.082205, 1, 1, 1, 1, 1,
0.8367571, -0.3909773, 0.1301666, 1, 1, 1, 1, 1,
0.8367645, -0.2890622, 1.680214, 1, 1, 1, 1, 1,
0.8382102, 0.144055, 0.7816658, 1, 1, 1, 1, 1,
0.8421189, 0.1267305, -0.7927572, 1, 1, 1, 1, 1,
0.8463264, -0.06102131, 1.465588, 1, 1, 1, 1, 1,
0.8488453, 0.6287857, 0.3693163, 0, 0, 1, 1, 1,
0.8534248, 1.751554, 0.6519775, 1, 0, 0, 1, 1,
0.8610618, -1.095898, 2.106203, 1, 0, 0, 1, 1,
0.864957, 0.8992511, 2.152952, 1, 0, 0, 1, 1,
0.8678128, -1.379358, 3.316564, 1, 0, 0, 1, 1,
0.874083, -1.575575, 3.24231, 1, 0, 0, 1, 1,
0.8884456, -1.606002, 2.477003, 0, 0, 0, 1, 1,
0.8902429, -0.6630576, 1.595146, 0, 0, 0, 1, 1,
0.8966562, -1.362437, 2.837407, 0, 0, 0, 1, 1,
0.897315, 0.06372779, 0.09717553, 0, 0, 0, 1, 1,
0.9003986, -0.8188486, 3.032268, 0, 0, 0, 1, 1,
0.9005193, 1.102991, 0.3642709, 0, 0, 0, 1, 1,
0.9025089, 0.5137233, 0.02202639, 0, 0, 0, 1, 1,
0.9026166, 0.6545759, 0.9918982, 1, 1, 1, 1, 1,
0.9053831, -0.07437997, 2.460106, 1, 1, 1, 1, 1,
0.9059325, -0.5570778, 2.727236, 1, 1, 1, 1, 1,
0.9111352, 0.1613111, 1.491234, 1, 1, 1, 1, 1,
0.9126032, -0.9933965, 1.718383, 1, 1, 1, 1, 1,
0.9177378, -0.5180308, 2.77292, 1, 1, 1, 1, 1,
0.9184886, 0.7726449, 1.756829, 1, 1, 1, 1, 1,
0.9234173, -0.7879263, 2.702986, 1, 1, 1, 1, 1,
0.9246786, 0.2119398, 1.353843, 1, 1, 1, 1, 1,
0.9311637, 0.679484, 0.5454099, 1, 1, 1, 1, 1,
0.9329847, -0.5290491, 2.812634, 1, 1, 1, 1, 1,
0.9334449, 0.7100462, -0.8606493, 1, 1, 1, 1, 1,
0.9350378, 1.533363, 0.7640991, 1, 1, 1, 1, 1,
0.9389345, -0.4614521, 1.245361, 1, 1, 1, 1, 1,
0.9487402, 0.09119583, -0.006002893, 1, 1, 1, 1, 1,
0.9526541, 2.001153, 0.8194973, 0, 0, 1, 1, 1,
0.9553045, 0.663771, 0.4676512, 1, 0, 0, 1, 1,
0.9657193, 1.214481, 0.4833636, 1, 0, 0, 1, 1,
0.9764799, -0.602154, 2.028422, 1, 0, 0, 1, 1,
0.9819311, -0.5441166, 2.059819, 1, 0, 0, 1, 1,
0.9855411, -0.005615182, 0.9225358, 1, 0, 0, 1, 1,
0.9930766, -0.1989864, 0.461686, 0, 0, 0, 1, 1,
0.9932538, 1.135385, 0.8693876, 0, 0, 0, 1, 1,
0.9998264, 0.3476506, 0.8139605, 0, 0, 0, 1, 1,
1.004367, -0.6385357, 2.217686, 0, 0, 0, 1, 1,
1.004449, 0.8083711, 1.179123, 0, 0, 0, 1, 1,
1.017671, 0.3995656, 2.081352, 0, 0, 0, 1, 1,
1.024458, 0.1624948, 1.76669, 0, 0, 0, 1, 1,
1.030315, -0.5656627, 2.530149, 1, 1, 1, 1, 1,
1.032112, -0.4129906, 2.775628, 1, 1, 1, 1, 1,
1.032132, -1.609377, 3.190165, 1, 1, 1, 1, 1,
1.034319, 0.5336184, 0.4833925, 1, 1, 1, 1, 1,
1.039204, -1.572483, 2.043176, 1, 1, 1, 1, 1,
1.041137, -1.718745, 4.53661, 1, 1, 1, 1, 1,
1.042779, 0.6087781, 1.249456, 1, 1, 1, 1, 1,
1.045185, 0.6992849, 1.224641, 1, 1, 1, 1, 1,
1.049487, 1.037445, 0.2078253, 1, 1, 1, 1, 1,
1.052957, 1.282888, 1.725606, 1, 1, 1, 1, 1,
1.055169, -0.3637562, 3.082592, 1, 1, 1, 1, 1,
1.060095, -0.2251508, 2.181581, 1, 1, 1, 1, 1,
1.062064, 0.8651418, 1.403824, 1, 1, 1, 1, 1,
1.063381, -0.02484919, 2.074633, 1, 1, 1, 1, 1,
1.065909, 1.214211, -0.0556006, 1, 1, 1, 1, 1,
1.098864, 0.6234692, 0.3172987, 0, 0, 1, 1, 1,
1.111938, 0.06227683, 1.374349, 1, 0, 0, 1, 1,
1.114451, -0.150102, 0.8141199, 1, 0, 0, 1, 1,
1.117816, 0.6034399, 1.424981, 1, 0, 0, 1, 1,
1.126753, 1.039935, 1.10478, 1, 0, 0, 1, 1,
1.127312, -0.4448333, 1.325656, 1, 0, 0, 1, 1,
1.138411, 0.01853331, 1.705242, 0, 0, 0, 1, 1,
1.143359, 1.75105, 1.840577, 0, 0, 0, 1, 1,
1.144722, 0.7479354, 1.774912, 0, 0, 0, 1, 1,
1.147717, 1.518146, 1.014328, 0, 0, 0, 1, 1,
1.148943, 0.3530256, 2.672204, 0, 0, 0, 1, 1,
1.156395, 1.060816, 1.64599, 0, 0, 0, 1, 1,
1.156397, -0.0281186, 1.880364, 0, 0, 0, 1, 1,
1.158483, 0.8731455, 0.9784718, 1, 1, 1, 1, 1,
1.168803, 0.09462935, 2.196724, 1, 1, 1, 1, 1,
1.171075, -0.7010899, 1.594688, 1, 1, 1, 1, 1,
1.177247, 0.02707927, 1.798886, 1, 1, 1, 1, 1,
1.19004, -0.483831, 0.7998742, 1, 1, 1, 1, 1,
1.194238, 0.5695182, 0.08194344, 1, 1, 1, 1, 1,
1.194869, -1.293061, 1.968204, 1, 1, 1, 1, 1,
1.196175, 1.010205, 0.5949739, 1, 1, 1, 1, 1,
1.207035, 0.4795191, 1.478567, 1, 1, 1, 1, 1,
1.212254, 0.0350941, 1.91544, 1, 1, 1, 1, 1,
1.221853, 0.825372, 1.677378, 1, 1, 1, 1, 1,
1.24216, 1.813263, 0.176733, 1, 1, 1, 1, 1,
1.242283, -1.117172, 1.621476, 1, 1, 1, 1, 1,
1.245316, 1.759262, 2.733668, 1, 1, 1, 1, 1,
1.280889, -2.427221, 3.840877, 1, 1, 1, 1, 1,
1.283012, -0.7298705, 1.364454, 0, 0, 1, 1, 1,
1.287077, 0.7728037, 1.301787, 1, 0, 0, 1, 1,
1.28851, -0.1223433, 2.81356, 1, 0, 0, 1, 1,
1.289179, -0.8901967, 3.602581, 1, 0, 0, 1, 1,
1.289774, -1.027612, 2.367027, 1, 0, 0, 1, 1,
1.292158, 2.048288, 0.3605769, 1, 0, 0, 1, 1,
1.292508, 0.1280996, 0.7044705, 0, 0, 0, 1, 1,
1.300365, -0.2758426, 0.0772888, 0, 0, 0, 1, 1,
1.304062, 0.1020635, 2.645257, 0, 0, 0, 1, 1,
1.310637, -0.550728, 2.857764, 0, 0, 0, 1, 1,
1.313786, 0.2829929, 0.5792099, 0, 0, 0, 1, 1,
1.333724, 1.062775, 0.9712707, 0, 0, 0, 1, 1,
1.34507, -0.7966275, 1.619088, 0, 0, 0, 1, 1,
1.345436, -0.7180147, 3.84099, 1, 1, 1, 1, 1,
1.353441, -1.800221, 3.596673, 1, 1, 1, 1, 1,
1.354872, 0.08563326, 2.45289, 1, 1, 1, 1, 1,
1.356714, 0.3342709, 1.234235, 1, 1, 1, 1, 1,
1.356831, 0.2077546, 2.166423, 1, 1, 1, 1, 1,
1.357803, -0.1894858, 1.266163, 1, 1, 1, 1, 1,
1.36824, 2.643781, -0.7489024, 1, 1, 1, 1, 1,
1.38795, -0.303104, 2.91837, 1, 1, 1, 1, 1,
1.391211, -0.2681349, 1.488894, 1, 1, 1, 1, 1,
1.395703, 0.3535561, 1.890527, 1, 1, 1, 1, 1,
1.396717, 0.09933097, 0.358594, 1, 1, 1, 1, 1,
1.402912, 0.1813591, 1.440995, 1, 1, 1, 1, 1,
1.412465, 0.07901961, 1.747856, 1, 1, 1, 1, 1,
1.413204, -1.553009, 2.731659, 1, 1, 1, 1, 1,
1.415648, 0.7867392, 1.023391, 1, 1, 1, 1, 1,
1.420206, -0.6504197, 2.181918, 0, 0, 1, 1, 1,
1.420249, 1.154354, 0.5519021, 1, 0, 0, 1, 1,
1.422835, -0.4507586, 1.538652, 1, 0, 0, 1, 1,
1.423055, -0.1415316, 2.606075, 1, 0, 0, 1, 1,
1.428431, 2.67963, 0.8491438, 1, 0, 0, 1, 1,
1.429289, 0.362625, 0.59524, 1, 0, 0, 1, 1,
1.449041, 0.8081212, -0.1295374, 0, 0, 0, 1, 1,
1.453384, -0.6138073, 2.714555, 0, 0, 0, 1, 1,
1.458389, 0.4995731, 2.6842, 0, 0, 0, 1, 1,
1.459061, 0.5287269, 2.764745, 0, 0, 0, 1, 1,
1.473152, 0.3870134, 2.209698, 0, 0, 0, 1, 1,
1.476852, -0.6244612, 2.125443, 0, 0, 0, 1, 1,
1.478198, 0.2270279, 3.229267, 0, 0, 0, 1, 1,
1.510896, 0.7850986, 3.06515, 1, 1, 1, 1, 1,
1.51489, -0.5688299, 1.348154, 1, 1, 1, 1, 1,
1.529372, 0.4161122, 3.770947, 1, 1, 1, 1, 1,
1.529925, -2.296952, 2.287347, 1, 1, 1, 1, 1,
1.535976, -1.321621, 1.274237, 1, 1, 1, 1, 1,
1.536755, 0.8431138, 0.1695971, 1, 1, 1, 1, 1,
1.558777, 0.5352759, 3.194763, 1, 1, 1, 1, 1,
1.565419, -0.9448811, 0.71308, 1, 1, 1, 1, 1,
1.581964, 0.8512109, -0.1665635, 1, 1, 1, 1, 1,
1.584127, -0.4649881, 3.328293, 1, 1, 1, 1, 1,
1.597996, 0.8770365, 0.3165977, 1, 1, 1, 1, 1,
1.604759, 1.092677, 0.8004328, 1, 1, 1, 1, 1,
1.631346, 1.061492, 2.147637, 1, 1, 1, 1, 1,
1.653331, 0.03034945, 0.9407295, 1, 1, 1, 1, 1,
1.679626, -0.06134854, 2.567145, 1, 1, 1, 1, 1,
1.69034, -0.4708369, 2.219356, 0, 0, 1, 1, 1,
1.694699, 0.9667667, 1.433899, 1, 0, 0, 1, 1,
1.696994, -0.1003534, 0.7384837, 1, 0, 0, 1, 1,
1.698168, 0.3997703, 1.958769, 1, 0, 0, 1, 1,
1.712683, -0.8472405, 1.804332, 1, 0, 0, 1, 1,
1.715613, -1.648603, 2.632337, 1, 0, 0, 1, 1,
1.730971, 0.08890561, 0.9459702, 0, 0, 0, 1, 1,
1.733468, 1.420349, 2.890222, 0, 0, 0, 1, 1,
1.733796, -2.892848, 2.567308, 0, 0, 0, 1, 1,
1.748328, -0.6375685, 1.693221, 0, 0, 0, 1, 1,
1.749007, -0.3717746, 1.628224, 0, 0, 0, 1, 1,
1.757837, -1.741966, 1.995645, 0, 0, 0, 1, 1,
1.775577, -1.309557, 0.804352, 0, 0, 0, 1, 1,
1.802088, -1.603326, 2.750195, 1, 1, 1, 1, 1,
1.805263, 0.1854006, 1.790193, 1, 1, 1, 1, 1,
1.817694, -0.6948532, 1.239836, 1, 1, 1, 1, 1,
1.830477, 0.8661966, 1.015336, 1, 1, 1, 1, 1,
1.869866, -0.7755136, 5.009708, 1, 1, 1, 1, 1,
1.915446, 1.197214, 1.625404, 1, 1, 1, 1, 1,
1.917858, 2.076566, 1.739995, 1, 1, 1, 1, 1,
1.928356, -0.3241668, 2.972387, 1, 1, 1, 1, 1,
1.938686, 0.04563025, 0.6987839, 1, 1, 1, 1, 1,
1.957257, -0.4260841, 2.594251, 1, 1, 1, 1, 1,
2.008694, -0.859723, 1.921517, 1, 1, 1, 1, 1,
2.013145, 0.1405864, 3.358096, 1, 1, 1, 1, 1,
2.083038, -0.2650759, 1.863266, 1, 1, 1, 1, 1,
2.089738, 1.169847, 0.9218385, 1, 1, 1, 1, 1,
2.132679, -1.074387, 2.827832, 1, 1, 1, 1, 1,
2.141595, 0.3921505, 0.3849446, 0, 0, 1, 1, 1,
2.162261, -0.2213681, 1.683083, 1, 0, 0, 1, 1,
2.193702, -0.2330442, 0.7045242, 1, 0, 0, 1, 1,
2.20528, -1.283234, 2.332376, 1, 0, 0, 1, 1,
2.214032, -0.606895, 0.9591998, 1, 0, 0, 1, 1,
2.219929, 0.8854693, 1.805234, 1, 0, 0, 1, 1,
2.227916, -3.297694, 3.401492, 0, 0, 0, 1, 1,
2.287613, -0.1954874, 2.725552, 0, 0, 0, 1, 1,
2.334188, 1.431326, 0.2443613, 0, 0, 0, 1, 1,
2.358272, -0.06975773, 0.07409019, 0, 0, 0, 1, 1,
2.36841, -0.1960258, 0.3626233, 0, 0, 0, 1, 1,
2.374031, 0.05149043, 2.088807, 0, 0, 0, 1, 1,
2.383704, 0.03796845, 1.47324, 0, 0, 0, 1, 1,
2.474773, -0.09461396, 1.342417, 1, 1, 1, 1, 1,
2.515702, 0.6105164, 1.834036, 1, 1, 1, 1, 1,
2.578597, 0.01477744, 1.393498, 1, 1, 1, 1, 1,
2.60338, -0.4128824, -0.02297593, 1, 1, 1, 1, 1,
2.750647, 0.646251, 2.687942, 1, 1, 1, 1, 1,
2.802562, -1.06731, 2.03277, 1, 1, 1, 1, 1,
2.970857, 0.1077553, 0.04167248, 1, 1, 1, 1, 1
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
var radius = 9.166032;
var distance = 32.1953;
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
mvMatrix.translate( -0.1521339, 0.1255503, 0.01665282 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.1953);
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
