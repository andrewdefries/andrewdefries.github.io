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
-2.923618, 1.213543, -0.7565821, 1, 0, 0, 1,
-2.766414, 0.2472109, -1.423457, 1, 0.007843138, 0, 1,
-2.760826, 0.06669786, 1.021229, 1, 0.01176471, 0, 1,
-2.668204, 0.433479, -0.2106153, 1, 0.01960784, 0, 1,
-2.655418, 1.05804, -1.067422, 1, 0.02352941, 0, 1,
-2.623998, -1.198205, -1.993635, 1, 0.03137255, 0, 1,
-2.591751, -0.4739618, -3.597551, 1, 0.03529412, 0, 1,
-2.449756, -0.4512689, -1.493782, 1, 0.04313726, 0, 1,
-2.289366, 0.5011351, -1.71571, 1, 0.04705882, 0, 1,
-2.283221, 0.5085242, -0.533202, 1, 0.05490196, 0, 1,
-2.277978, 0.9117659, -1.922329, 1, 0.05882353, 0, 1,
-2.259881, -0.3866507, -0.6028542, 1, 0.06666667, 0, 1,
-2.253858, -0.1380273, -0.9374444, 1, 0.07058824, 0, 1,
-2.174527, 0.6476493, -0.7178633, 1, 0.07843138, 0, 1,
-2.129431, 0.6604034, -2.566163, 1, 0.08235294, 0, 1,
-2.11885, 2.020547, -1.310508, 1, 0.09019608, 0, 1,
-2.082207, 0.5176697, -0.4859042, 1, 0.09411765, 0, 1,
-2.070913, -0.01483768, -2.820921, 1, 0.1019608, 0, 1,
-2.051731, 0.2029022, -0.7291042, 1, 0.1098039, 0, 1,
-2.031525, 0.8172548, -0.8972358, 1, 0.1137255, 0, 1,
-2.022456, 0.8496015, -0.01116787, 1, 0.1215686, 0, 1,
-2.014916, -0.1969612, -1.237723, 1, 0.1254902, 0, 1,
-2.014699, -0.5202334, -0.8893661, 1, 0.1333333, 0, 1,
-2.006204, 0.375398, -2.099418, 1, 0.1372549, 0, 1,
-1.976825, -0.7712866, -0.8402435, 1, 0.145098, 0, 1,
-1.964175, -0.1278641, 0.3493564, 1, 0.1490196, 0, 1,
-1.915586, -1.677259, -1.511908, 1, 0.1568628, 0, 1,
-1.906503, -0.4850446, -0.8438888, 1, 0.1607843, 0, 1,
-1.896825, -0.4279258, -1.113331, 1, 0.1686275, 0, 1,
-1.867512, 2.693213, -1.175703, 1, 0.172549, 0, 1,
-1.825974, 1.423452, -0.2395853, 1, 0.1803922, 0, 1,
-1.792018, -1.033417, -1.824156, 1, 0.1843137, 0, 1,
-1.791248, 0.06027569, 0.8919665, 1, 0.1921569, 0, 1,
-1.730609, 0.4502671, -0.3895956, 1, 0.1960784, 0, 1,
-1.719474, 0.9698772, -1.021366, 1, 0.2039216, 0, 1,
-1.69388, -1.248061, -3.17062, 1, 0.2117647, 0, 1,
-1.690472, -0.9106162, -3.35985, 1, 0.2156863, 0, 1,
-1.68922, 0.6778699, -1.971379, 1, 0.2235294, 0, 1,
-1.683486, -0.5929513, -2.890297, 1, 0.227451, 0, 1,
-1.678277, 0.8382013, -1.79418, 1, 0.2352941, 0, 1,
-1.675497, -1.211312, -2.236265, 1, 0.2392157, 0, 1,
-1.673821, 0.3043571, -2.086255, 1, 0.2470588, 0, 1,
-1.657755, -0.01917281, -2.079977, 1, 0.2509804, 0, 1,
-1.65214, 0.9544442, -0.8046183, 1, 0.2588235, 0, 1,
-1.646356, -0.7981073, 0.1882555, 1, 0.2627451, 0, 1,
-1.642794, 0.1951883, -1.410574, 1, 0.2705882, 0, 1,
-1.635659, -1.538566, -1.970919, 1, 0.2745098, 0, 1,
-1.634108, 0.8792387, -1.178075, 1, 0.282353, 0, 1,
-1.631756, -1.164379, -1.906045, 1, 0.2862745, 0, 1,
-1.597747, -1.689122, -1.505763, 1, 0.2941177, 0, 1,
-1.594906, 1.053671, -2.082663, 1, 0.3019608, 0, 1,
-1.584758, 0.4089631, -0.1441691, 1, 0.3058824, 0, 1,
-1.580366, 0.1226631, -0.7048709, 1, 0.3137255, 0, 1,
-1.570022, 0.736736, -0.1761106, 1, 0.3176471, 0, 1,
-1.560739, 0.6688117, -1.909396, 1, 0.3254902, 0, 1,
-1.552907, -1.23612, -1.587591, 1, 0.3294118, 0, 1,
-1.551979, -0.4709004, -2.433618, 1, 0.3372549, 0, 1,
-1.54073, 1.333698, -1.491157, 1, 0.3411765, 0, 1,
-1.538344, 0.2081991, -2.48787, 1, 0.3490196, 0, 1,
-1.525739, -0.09108873, -2.095214, 1, 0.3529412, 0, 1,
-1.524726, 0.1362022, -2.170848, 1, 0.3607843, 0, 1,
-1.522412, 2.172545, -2.443839, 1, 0.3647059, 0, 1,
-1.501394, -2.41862, -2.307035, 1, 0.372549, 0, 1,
-1.49111, -1.621831, -2.385819, 1, 0.3764706, 0, 1,
-1.475727, 0.2379431, -2.124045, 1, 0.3843137, 0, 1,
-1.474131, -0.6629739, -2.960086, 1, 0.3882353, 0, 1,
-1.464993, 1.227611, -0.2428551, 1, 0.3960784, 0, 1,
-1.45723, 0.2639869, -1.129071, 1, 0.4039216, 0, 1,
-1.453912, -0.8152309, -2.444718, 1, 0.4078431, 0, 1,
-1.447509, 2.511322, 0.1922055, 1, 0.4156863, 0, 1,
-1.44004, -0.6665848, -3.441212, 1, 0.4196078, 0, 1,
-1.414978, 0.9510115, -2.028449, 1, 0.427451, 0, 1,
-1.401991, 0.6717278, -1.754851, 1, 0.4313726, 0, 1,
-1.385034, 0.01763194, -2.341445, 1, 0.4392157, 0, 1,
-1.354479, 0.02232535, -0.8487115, 1, 0.4431373, 0, 1,
-1.3431, 0.2384365, -2.827612, 1, 0.4509804, 0, 1,
-1.327176, 1.056325, -0.8012754, 1, 0.454902, 0, 1,
-1.323831, 0.05210761, -1.750978, 1, 0.4627451, 0, 1,
-1.321512, -1.435736, -2.974766, 1, 0.4666667, 0, 1,
-1.31777, 0.3700897, -1.677551, 1, 0.4745098, 0, 1,
-1.309615, -0.2658571, -4.395015, 1, 0.4784314, 0, 1,
-1.30875, 0.9053463, -1.118147, 1, 0.4862745, 0, 1,
-1.304145, 0.8339769, -0.914813, 1, 0.4901961, 0, 1,
-1.294917, 0.3401921, -1.304498, 1, 0.4980392, 0, 1,
-1.293669, 0.08045939, -0.03036088, 1, 0.5058824, 0, 1,
-1.292353, -0.6521408, -1.418075, 1, 0.509804, 0, 1,
-1.288159, 0.8846732, -2.328836, 1, 0.5176471, 0, 1,
-1.279523, -0.9397935, -1.960847, 1, 0.5215687, 0, 1,
-1.276362, -0.3611917, -2.845146, 1, 0.5294118, 0, 1,
-1.276206, 1.252798, 0.1682574, 1, 0.5333334, 0, 1,
-1.26697, 0.2914009, -0.9292277, 1, 0.5411765, 0, 1,
-1.260373, 0.3473282, -0.3369071, 1, 0.5450981, 0, 1,
-1.259042, 1.0094, -1.810476, 1, 0.5529412, 0, 1,
-1.255656, 0.7703769, 0.9397939, 1, 0.5568628, 0, 1,
-1.245978, 0.7859789, -1.628361, 1, 0.5647059, 0, 1,
-1.244627, 0.8459663, -1.455961, 1, 0.5686275, 0, 1,
-1.243134, 1.499452, -0.4627245, 1, 0.5764706, 0, 1,
-1.23683, -0.9553697, -1.209165, 1, 0.5803922, 0, 1,
-1.229821, 0.02337979, -3.347825, 1, 0.5882353, 0, 1,
-1.219886, 1.803999, -1.841883, 1, 0.5921569, 0, 1,
-1.211078, -0.9177893, -1.251776, 1, 0.6, 0, 1,
-1.196165, -0.2885765, -2.670537, 1, 0.6078432, 0, 1,
-1.19607, 0.878201, -1.300969, 1, 0.6117647, 0, 1,
-1.191951, -1.836027, -1.942805, 1, 0.6196079, 0, 1,
-1.1919, -0.1904446, -1.567272, 1, 0.6235294, 0, 1,
-1.188807, -0.3852062, -2.077885, 1, 0.6313726, 0, 1,
-1.188569, -2.865349, -0.0598044, 1, 0.6352941, 0, 1,
-1.173073, -0.2403344, -3.373379, 1, 0.6431373, 0, 1,
-1.141963, 0.2269762, -0.9306297, 1, 0.6470588, 0, 1,
-1.125836, -0.9390021, -2.957029, 1, 0.654902, 0, 1,
-1.122162, -0.978772, -0.8596184, 1, 0.6588235, 0, 1,
-1.113669, 1.241904, -2.562431, 1, 0.6666667, 0, 1,
-1.112994, -0.03830972, -3.656672, 1, 0.6705883, 0, 1,
-1.112575, -0.6648166, -1.983481, 1, 0.6784314, 0, 1,
-1.107713, 1.187921, -0.1820731, 1, 0.682353, 0, 1,
-1.106305, -0.2496043, -0.2528916, 1, 0.6901961, 0, 1,
-1.09054, -1.140373, -1.022507, 1, 0.6941177, 0, 1,
-1.086925, -0.9233035, -2.99596, 1, 0.7019608, 0, 1,
-1.081557, -2.483634, -1.902573, 1, 0.7098039, 0, 1,
-1.068708, -1.436395, -3.287415, 1, 0.7137255, 0, 1,
-1.06308, 1.043643, 0.4296114, 1, 0.7215686, 0, 1,
-1.056305, 0.8093926, -1.193792, 1, 0.7254902, 0, 1,
-1.054855, 0.7773688, 0.06767216, 1, 0.7333333, 0, 1,
-1.05476, -0.4733351, -2.560463, 1, 0.7372549, 0, 1,
-1.045932, -0.5987307, -0.5856215, 1, 0.7450981, 0, 1,
-1.045771, 0.53133, 2.851251, 1, 0.7490196, 0, 1,
-1.041049, -0.7853528, -2.429157, 1, 0.7568628, 0, 1,
-1.039347, -1.40747, -1.747872, 1, 0.7607843, 0, 1,
-1.037886, -0.6996421, -2.366699, 1, 0.7686275, 0, 1,
-1.034597, 0.4185, -1.750373, 1, 0.772549, 0, 1,
-1.033638, -0.7764167, -2.591766, 1, 0.7803922, 0, 1,
-1.029674, 1.126075, -1.738211, 1, 0.7843137, 0, 1,
-1.02637, -0.8194022, -0.874356, 1, 0.7921569, 0, 1,
-1.02421, -1.059598, -3.080811, 1, 0.7960784, 0, 1,
-1.015346, -2.016618, -3.931716, 1, 0.8039216, 0, 1,
-1.006412, 0.7562122, -1.123052, 1, 0.8117647, 0, 1,
-1.003178, -2.054342, -1.684741, 1, 0.8156863, 0, 1,
-1.002591, -0.4827117, -2.81903, 1, 0.8235294, 0, 1,
-0.9992349, 1.612335, -1.88201, 1, 0.827451, 0, 1,
-0.9979689, 0.9006987, -2.495713, 1, 0.8352941, 0, 1,
-0.9947053, 1.530216, -1.304452, 1, 0.8392157, 0, 1,
-0.9936758, 1.379717, -1.628505, 1, 0.8470588, 0, 1,
-0.9811164, -2.562378, -1.590441, 1, 0.8509804, 0, 1,
-0.9762428, 1.252803, -0.0277444, 1, 0.8588235, 0, 1,
-0.9756427, 0.3627087, -1.488491, 1, 0.8627451, 0, 1,
-0.9656982, 0.8784465, -0.6084554, 1, 0.8705882, 0, 1,
-0.9654723, -0.7215346, -3.417956, 1, 0.8745098, 0, 1,
-0.964635, 0.6107412, -2.766652, 1, 0.8823529, 0, 1,
-0.9636822, 1.321269, -0.9095521, 1, 0.8862745, 0, 1,
-0.9629625, 2.025623, -1.459186, 1, 0.8941177, 0, 1,
-0.9623723, 0.4442883, -0.5971026, 1, 0.8980392, 0, 1,
-0.9572234, 1.495751, 0.8765262, 1, 0.9058824, 0, 1,
-0.946725, 0.5387303, -2.264982, 1, 0.9137255, 0, 1,
-0.9437311, -0.4748262, -4.163295, 1, 0.9176471, 0, 1,
-0.9419654, 0.02146938, -1.798364, 1, 0.9254902, 0, 1,
-0.9412285, -0.5007606, -2.871857, 1, 0.9294118, 0, 1,
-0.9407713, -0.373388, -2.530338, 1, 0.9372549, 0, 1,
-0.931835, -1.086212, -2.52064, 1, 0.9411765, 0, 1,
-0.9303431, 1.539792, -1.172951, 1, 0.9490196, 0, 1,
-0.9268466, -0.4780135, -2.346297, 1, 0.9529412, 0, 1,
-0.9228754, 0.9773266, 0.6261695, 1, 0.9607843, 0, 1,
-0.9179792, 1.042589, -0.8187861, 1, 0.9647059, 0, 1,
-0.9129293, -0.1038082, -2.424066, 1, 0.972549, 0, 1,
-0.9098478, 0.4362547, -1.149618, 1, 0.9764706, 0, 1,
-0.9028207, -0.5647296, -2.06403, 1, 0.9843137, 0, 1,
-0.8997266, -0.5639113, -2.62493, 1, 0.9882353, 0, 1,
-0.8985488, 0.5417008, -0.6778677, 1, 0.9960784, 0, 1,
-0.8968815, 0.3699643, -2.180687, 0.9960784, 1, 0, 1,
-0.8950118, -0.9898217, -3.434496, 0.9921569, 1, 0, 1,
-0.8888976, -0.02012565, -1.970059, 0.9843137, 1, 0, 1,
-0.885743, 2.461393, 0.3394258, 0.9803922, 1, 0, 1,
-0.8831153, 1.388752, -1.89349, 0.972549, 1, 0, 1,
-0.8794246, 0.6642511, -1.632501, 0.9686275, 1, 0, 1,
-0.8727099, -0.6418093, -3.580005, 0.9607843, 1, 0, 1,
-0.8694778, 0.04198396, -1.958276, 0.9568627, 1, 0, 1,
-0.8690014, -0.1137128, -1.632834, 0.9490196, 1, 0, 1,
-0.8644268, -0.3607028, -3.886351, 0.945098, 1, 0, 1,
-0.8562514, -0.1523223, -2.167059, 0.9372549, 1, 0, 1,
-0.8536792, -1.333998, -3.152262, 0.9333333, 1, 0, 1,
-0.8533124, 2.041396, -0.3424641, 0.9254902, 1, 0, 1,
-0.852099, 0.2571864, -1.730568, 0.9215686, 1, 0, 1,
-0.8514547, 0.5014982, 1.822683, 0.9137255, 1, 0, 1,
-0.8502463, 0.8805401, -1.133634, 0.9098039, 1, 0, 1,
-0.8396698, 2.001565, -0.7647527, 0.9019608, 1, 0, 1,
-0.8393509, 0.5884188, -0.4615198, 0.8941177, 1, 0, 1,
-0.8359579, 0.567092, 0.6071738, 0.8901961, 1, 0, 1,
-0.8306081, 0.05412102, -1.152364, 0.8823529, 1, 0, 1,
-0.8274175, 0.6853115, -2.436608, 0.8784314, 1, 0, 1,
-0.8221776, 0.1189978, -1.58823, 0.8705882, 1, 0, 1,
-0.8200669, -1.143011, -3.310154, 0.8666667, 1, 0, 1,
-0.8199749, -1.696661, -3.312655, 0.8588235, 1, 0, 1,
-0.8199511, -1.343751, -1.313356, 0.854902, 1, 0, 1,
-0.8149706, -0.1054856, -1.662015, 0.8470588, 1, 0, 1,
-0.8112274, -0.9168893, -1.861817, 0.8431373, 1, 0, 1,
-0.8047542, -0.100555, -2.249899, 0.8352941, 1, 0, 1,
-0.8042679, -1.015022, -4.456282, 0.8313726, 1, 0, 1,
-0.8015454, 1.832429, -1.379159, 0.8235294, 1, 0, 1,
-0.7992513, 0.8446363, 0.4680146, 0.8196079, 1, 0, 1,
-0.7972592, -1.165927, -2.211458, 0.8117647, 1, 0, 1,
-0.7880368, 1.202082, -1.112552, 0.8078431, 1, 0, 1,
-0.7804488, -0.4795402, -2.368579, 0.8, 1, 0, 1,
-0.7791156, -0.3175732, -2.099483, 0.7921569, 1, 0, 1,
-0.7708035, -0.730798, -2.518039, 0.7882353, 1, 0, 1,
-0.7705049, 1.326288, -2.23401, 0.7803922, 1, 0, 1,
-0.7704289, -0.2275121, -2.442155, 0.7764706, 1, 0, 1,
-0.769926, 1.117646, -0.6876032, 0.7686275, 1, 0, 1,
-0.7655762, 0.4099478, -0.3293961, 0.7647059, 1, 0, 1,
-0.762093, -0.6388153, -0.8558807, 0.7568628, 1, 0, 1,
-0.7605703, 1.519302, -0.6867424, 0.7529412, 1, 0, 1,
-0.7559577, -1.209886, -2.168645, 0.7450981, 1, 0, 1,
-0.7525676, 0.7074103, -0.6947374, 0.7411765, 1, 0, 1,
-0.7471237, 0.2988775, -1.56491, 0.7333333, 1, 0, 1,
-0.7460745, 2.323371, 0.1923642, 0.7294118, 1, 0, 1,
-0.741384, -0.2712011, -3.206465, 0.7215686, 1, 0, 1,
-0.7382751, -1.271285, 0.535069, 0.7176471, 1, 0, 1,
-0.732703, -0.1549986, -1.193113, 0.7098039, 1, 0, 1,
-0.7321607, 0.42483, -1.502641, 0.7058824, 1, 0, 1,
-0.7301303, -0.613106, -0.6958284, 0.6980392, 1, 0, 1,
-0.7300327, -1.128932, -2.895755, 0.6901961, 1, 0, 1,
-0.7179713, 0.05182268, -1.528054, 0.6862745, 1, 0, 1,
-0.7177002, 0.7425494, -0.9709193, 0.6784314, 1, 0, 1,
-0.7164636, -0.5045048, -2.828031, 0.6745098, 1, 0, 1,
-0.7112795, -1.625986, -3.936996, 0.6666667, 1, 0, 1,
-0.7109351, 0.2728063, -2.473869, 0.6627451, 1, 0, 1,
-0.7109042, -0.3850602, -1.709761, 0.654902, 1, 0, 1,
-0.710835, -0.8137818, -1.657295, 0.6509804, 1, 0, 1,
-0.7097126, -0.5438386, -1.395024, 0.6431373, 1, 0, 1,
-0.7041801, -1.403421, -1.047755, 0.6392157, 1, 0, 1,
-0.7041234, -0.1028633, -3.359111, 0.6313726, 1, 0, 1,
-0.6968139, 2.52318, 0.3706802, 0.627451, 1, 0, 1,
-0.6944367, -0.2109134, -2.77678, 0.6196079, 1, 0, 1,
-0.6900171, -0.3674171, -2.059909, 0.6156863, 1, 0, 1,
-0.6875142, 0.00107206, -1.095391, 0.6078432, 1, 0, 1,
-0.6850149, -0.3380675, -3.134941, 0.6039216, 1, 0, 1,
-0.6758304, -0.8203664, -1.447565, 0.5960785, 1, 0, 1,
-0.6753945, -0.09255774, -1.976181, 0.5882353, 1, 0, 1,
-0.674842, 0.2710023, 0.05282085, 0.5843138, 1, 0, 1,
-0.6674247, -0.6495822, -0.9309179, 0.5764706, 1, 0, 1,
-0.6622322, -2.247056, -2.907238, 0.572549, 1, 0, 1,
-0.6614674, -0.1528585, -0.9833764, 0.5647059, 1, 0, 1,
-0.6582451, -0.1932319, -2.082115, 0.5607843, 1, 0, 1,
-0.6551861, 1.127155, -0.675515, 0.5529412, 1, 0, 1,
-0.6528268, 0.006444712, -1.8205, 0.5490196, 1, 0, 1,
-0.6512796, -1.42994, -2.795191, 0.5411765, 1, 0, 1,
-0.6468085, 0.2108523, -2.261637, 0.5372549, 1, 0, 1,
-0.6434404, 1.370058, -1.564627, 0.5294118, 1, 0, 1,
-0.6429453, 0.5575793, -2.881574, 0.5254902, 1, 0, 1,
-0.6406884, 1.337721, -1.140531, 0.5176471, 1, 0, 1,
-0.6390555, -1.101898, -2.702369, 0.5137255, 1, 0, 1,
-0.6377505, -0.4089869, -3.481247, 0.5058824, 1, 0, 1,
-0.6318846, -0.957127, -2.451408, 0.5019608, 1, 0, 1,
-0.6271941, -0.590843, -2.521169, 0.4941176, 1, 0, 1,
-0.6244174, 1.608221, 1.027475, 0.4862745, 1, 0, 1,
-0.6213645, 0.0169213, -1.130326, 0.4823529, 1, 0, 1,
-0.6191324, -2.174973, -1.806132, 0.4745098, 1, 0, 1,
-0.6185921, -1.181758, -2.730096, 0.4705882, 1, 0, 1,
-0.6183885, -2.120833, -0.3784346, 0.4627451, 1, 0, 1,
-0.6175051, 0.451408, -1.672768, 0.4588235, 1, 0, 1,
-0.6170782, -0.5084768, -1.08072, 0.4509804, 1, 0, 1,
-0.613036, -1.064523, -2.761079, 0.4470588, 1, 0, 1,
-0.6111649, 0.6243677, -1.674407, 0.4392157, 1, 0, 1,
-0.6107641, -1.087706, -2.313151, 0.4352941, 1, 0, 1,
-0.6095528, -0.002329904, -2.761361, 0.427451, 1, 0, 1,
-0.6015975, 1.568069, 0.08890779, 0.4235294, 1, 0, 1,
-0.6003448, 1.257635, -1.411866, 0.4156863, 1, 0, 1,
-0.5884261, -1.31534, -2.642055, 0.4117647, 1, 0, 1,
-0.5875214, 0.07648624, -1.43419, 0.4039216, 1, 0, 1,
-0.5858493, -1.291606, -3.304278, 0.3960784, 1, 0, 1,
-0.5838732, -1.034363, -3.127029, 0.3921569, 1, 0, 1,
-0.5791085, 1.66358, -0.59658, 0.3843137, 1, 0, 1,
-0.5768284, 0.9845257, -1.22622, 0.3803922, 1, 0, 1,
-0.5744025, 0.0960582, -0.6576135, 0.372549, 1, 0, 1,
-0.5737221, 1.008731, 0.07921585, 0.3686275, 1, 0, 1,
-0.5676585, -0.1284113, -2.124734, 0.3607843, 1, 0, 1,
-0.5569593, 0.6403877, 0.8638429, 0.3568628, 1, 0, 1,
-0.5556507, -1.91478, -3.261362, 0.3490196, 1, 0, 1,
-0.5554495, 1.247923, -0.6342741, 0.345098, 1, 0, 1,
-0.5540743, -1.726868, -4.07133, 0.3372549, 1, 0, 1,
-0.5508795, 0.624763, -0.5188973, 0.3333333, 1, 0, 1,
-0.5471769, -0.3451766, -1.33614, 0.3254902, 1, 0, 1,
-0.5427905, -1.154959, -1.955301, 0.3215686, 1, 0, 1,
-0.5408495, 0.2983355, -2.192084, 0.3137255, 1, 0, 1,
-0.5400417, 0.6052839, -3.362261, 0.3098039, 1, 0, 1,
-0.5387618, -0.627382, -1.297019, 0.3019608, 1, 0, 1,
-0.532698, 2.532562, -0.9517433, 0.2941177, 1, 0, 1,
-0.531504, 0.6042499, -1.357779, 0.2901961, 1, 0, 1,
-0.5312575, -2.128194, -0.824674, 0.282353, 1, 0, 1,
-0.5260638, 0.5737361, 0.659547, 0.2784314, 1, 0, 1,
-0.524116, 0.3229305, -2.38923, 0.2705882, 1, 0, 1,
-0.5181046, -2.374654, -4.544164, 0.2666667, 1, 0, 1,
-0.5115891, -1.011336, -4.162082, 0.2588235, 1, 0, 1,
-0.510012, 1.376457, -0.6965879, 0.254902, 1, 0, 1,
-0.5087511, -0.6549794, -1.56087, 0.2470588, 1, 0, 1,
-0.508576, 0.7677457, -0.8666046, 0.2431373, 1, 0, 1,
-0.5073461, 0.2144678, -1.559902, 0.2352941, 1, 0, 1,
-0.5068588, -0.3306607, -1.580692, 0.2313726, 1, 0, 1,
-0.5053203, 0.6591645, -2.214817, 0.2235294, 1, 0, 1,
-0.5028037, -0.02047318, -0.6808287, 0.2196078, 1, 0, 1,
-0.4967031, -1.435527, -1.284191, 0.2117647, 1, 0, 1,
-0.4952838, -1.90552, -2.366073, 0.2078431, 1, 0, 1,
-0.4952585, 0.2047484, -1.020808, 0.2, 1, 0, 1,
-0.4944319, 1.07829, -2.126362, 0.1921569, 1, 0, 1,
-0.4903037, 0.306726, -1.561116, 0.1882353, 1, 0, 1,
-0.487955, 0.275641, -0.8586765, 0.1803922, 1, 0, 1,
-0.4750283, 0.3183291, -2.138147, 0.1764706, 1, 0, 1,
-0.4732841, 1.49816, 0.1540665, 0.1686275, 1, 0, 1,
-0.4704338, 0.7056577, -0.9916423, 0.1647059, 1, 0, 1,
-0.4700981, -0.5635653, -2.012305, 0.1568628, 1, 0, 1,
-0.4698448, -1.199815, -1.757347, 0.1529412, 1, 0, 1,
-0.4676834, 0.1168874, -1.114873, 0.145098, 1, 0, 1,
-0.4648313, 1.010905, -2.640731, 0.1411765, 1, 0, 1,
-0.4590428, 0.9395306, -0.2109641, 0.1333333, 1, 0, 1,
-0.4575021, 0.667497, -1.580753, 0.1294118, 1, 0, 1,
-0.4560893, -0.343919, -2.337441, 0.1215686, 1, 0, 1,
-0.455261, 0.2145144, -2.648779, 0.1176471, 1, 0, 1,
-0.4533205, 2.136094, -1.338001, 0.1098039, 1, 0, 1,
-0.4517792, -1.238829, -2.948348, 0.1058824, 1, 0, 1,
-0.4505987, 0.116406, -1.311779, 0.09803922, 1, 0, 1,
-0.45002, -0.2506069, -1.648384, 0.09019608, 1, 0, 1,
-0.4489502, -0.1723258, -1.087829, 0.08627451, 1, 0, 1,
-0.4467005, 0.659771, 0.03683803, 0.07843138, 1, 0, 1,
-0.4444201, -0.3976865, -1.528, 0.07450981, 1, 0, 1,
-0.4434774, -0.8324505, -2.108963, 0.06666667, 1, 0, 1,
-0.4403428, 0.03022795, -1.972526, 0.0627451, 1, 0, 1,
-0.4390682, -1.145156, -3.490787, 0.05490196, 1, 0, 1,
-0.4388904, -0.2981076, -3.512362, 0.05098039, 1, 0, 1,
-0.436042, 1.271659, 0.4881136, 0.04313726, 1, 0, 1,
-0.4357279, -1.053144, -2.574124, 0.03921569, 1, 0, 1,
-0.4324616, -0.09258129, -1.646399, 0.03137255, 1, 0, 1,
-0.4286036, 0.01233472, 0.36083, 0.02745098, 1, 0, 1,
-0.4260614, 0.6621038, -2.554735, 0.01960784, 1, 0, 1,
-0.4201425, -0.8965475, -1.519996, 0.01568628, 1, 0, 1,
-0.4198609, 0.2532713, -1.285028, 0.007843138, 1, 0, 1,
-0.416673, 1.978009, -0.4825486, 0.003921569, 1, 0, 1,
-0.4125461, 1.239135, -1.588598, 0, 1, 0.003921569, 1,
-0.4121906, -1.662617, -3.277675, 0, 1, 0.01176471, 1,
-0.4095628, -1.445059, -3.176276, 0, 1, 0.01568628, 1,
-0.4065703, -1.368349, -2.295521, 0, 1, 0.02352941, 1,
-0.4039852, -0.6806884, -1.675578, 0, 1, 0.02745098, 1,
-0.4038114, -0.5975162, -2.687452, 0, 1, 0.03529412, 1,
-0.4026577, 0.1817477, -2.142645, 0, 1, 0.03921569, 1,
-0.3997875, -0.8229995, -1.805852, 0, 1, 0.04705882, 1,
-0.396598, -1.131866, -3.189539, 0, 1, 0.05098039, 1,
-0.3947018, -0.3911237, -4.021826, 0, 1, 0.05882353, 1,
-0.3936262, 0.8539277, -1.826944, 0, 1, 0.0627451, 1,
-0.3924493, 0.9493401, 0.3694836, 0, 1, 0.07058824, 1,
-0.3917453, 0.5624875, 1.089398, 0, 1, 0.07450981, 1,
-0.3895165, 1.008242, 0.1417954, 0, 1, 0.08235294, 1,
-0.3884031, -0.3973016, -2.807493, 0, 1, 0.08627451, 1,
-0.3866922, -0.2855378, -1.203724, 0, 1, 0.09411765, 1,
-0.3866224, 1.279298, -0.5077785, 0, 1, 0.1019608, 1,
-0.3794124, 0.237918, -0.7576141, 0, 1, 0.1058824, 1,
-0.3765644, 1.078969, -1.6268, 0, 1, 0.1137255, 1,
-0.3763829, -0.2284141, -1.541433, 0, 1, 0.1176471, 1,
-0.371178, 0.777609, -1.716258, 0, 1, 0.1254902, 1,
-0.371133, -0.04539446, -1.365433, 0, 1, 0.1294118, 1,
-0.3619379, 2.185006, 0.8367587, 0, 1, 0.1372549, 1,
-0.3600601, -2.025019, -1.633072, 0, 1, 0.1411765, 1,
-0.3582829, -1.034775, -2.069946, 0, 1, 0.1490196, 1,
-0.3581114, 0.3960066, -2.302127, 0, 1, 0.1529412, 1,
-0.3568103, -0.9455863, -3.494361, 0, 1, 0.1607843, 1,
-0.3496006, -1.030473, -2.87935, 0, 1, 0.1647059, 1,
-0.3495589, 0.8677551, -0.8706052, 0, 1, 0.172549, 1,
-0.3486585, -1.350437, -3.128023, 0, 1, 0.1764706, 1,
-0.3484472, -0.4414124, -2.545582, 0, 1, 0.1843137, 1,
-0.3405941, 1.14225, 0.02134197, 0, 1, 0.1882353, 1,
-0.3400599, 0.5689619, 0.4362708, 0, 1, 0.1960784, 1,
-0.3385258, -1.426826, -2.770431, 0, 1, 0.2039216, 1,
-0.3349687, -0.5842267, -3.243211, 0, 1, 0.2078431, 1,
-0.3334191, 0.7306828, -1.047457, 0, 1, 0.2156863, 1,
-0.3290818, 0.9940237, -0.5674814, 0, 1, 0.2196078, 1,
-0.3289886, 1.18237, 0.5249861, 0, 1, 0.227451, 1,
-0.3285101, 0.6468493, -1.670974, 0, 1, 0.2313726, 1,
-0.3222855, 1.426617, -0.1234409, 0, 1, 0.2392157, 1,
-0.322049, -0.8531378, -2.14956, 0, 1, 0.2431373, 1,
-0.3215201, -0.4813229, -3.343479, 0, 1, 0.2509804, 1,
-0.3173561, -1.507889, -2.367326, 0, 1, 0.254902, 1,
-0.3169864, 0.5435144, 0.6010541, 0, 1, 0.2627451, 1,
-0.3159246, 0.4050828, -0.4276207, 0, 1, 0.2666667, 1,
-0.3148419, -1.3827, -3.080862, 0, 1, 0.2745098, 1,
-0.313974, 0.4970757, -0.9101155, 0, 1, 0.2784314, 1,
-0.31196, -0.7158439, -1.928964, 0, 1, 0.2862745, 1,
-0.3075628, -0.5253704, -1.160595, 0, 1, 0.2901961, 1,
-0.3060742, -1.042082, -1.432585, 0, 1, 0.2980392, 1,
-0.3015921, 0.2829297, 0.5027337, 0, 1, 0.3058824, 1,
-0.2992483, -1.203703, -3.327554, 0, 1, 0.3098039, 1,
-0.2978194, -1.433763, -1.309261, 0, 1, 0.3176471, 1,
-0.2973458, 0.9800249, -0.3207397, 0, 1, 0.3215686, 1,
-0.2957124, -2.199564, -2.762144, 0, 1, 0.3294118, 1,
-0.2940599, 0.3722415, 0.1112218, 0, 1, 0.3333333, 1,
-0.28927, 0.7254444, -0.3927629, 0, 1, 0.3411765, 1,
-0.2858349, -0.07121436, -1.398276, 0, 1, 0.345098, 1,
-0.2856377, 0.8208904, -1.77669, 0, 1, 0.3529412, 1,
-0.2841384, 0.3679217, -0.5641636, 0, 1, 0.3568628, 1,
-0.2807184, 0.3221408, 1.848406, 0, 1, 0.3647059, 1,
-0.2780431, 0.1227041, -1.232221, 0, 1, 0.3686275, 1,
-0.2752926, -0.007316275, -2.478933, 0, 1, 0.3764706, 1,
-0.2636879, 1.40242, -0.8448088, 0, 1, 0.3803922, 1,
-0.2616713, 1.515659, 2.138767, 0, 1, 0.3882353, 1,
-0.2603204, 0.8495066, 1.022088, 0, 1, 0.3921569, 1,
-0.2589537, 2.255634, 0.2258093, 0, 1, 0.4, 1,
-0.2565901, -2.759238, -1.714152, 0, 1, 0.4078431, 1,
-0.2533075, -0.6938093, -3.088899, 0, 1, 0.4117647, 1,
-0.2533034, 0.5785176, -0.3331263, 0, 1, 0.4196078, 1,
-0.2505907, 0.239999, -2.006057, 0, 1, 0.4235294, 1,
-0.2502135, 0.01973649, -2.108549, 0, 1, 0.4313726, 1,
-0.249625, -1.772119, -2.768919, 0, 1, 0.4352941, 1,
-0.2476062, 1.026181, -1.442177, 0, 1, 0.4431373, 1,
-0.2473322, 1.97973, -0.45322, 0, 1, 0.4470588, 1,
-0.2470858, 0.5191934, 0.09957684, 0, 1, 0.454902, 1,
-0.2452119, -0.2339233, -3.194127, 0, 1, 0.4588235, 1,
-0.2446666, 1.10733, 0.07957821, 0, 1, 0.4666667, 1,
-0.2388072, -0.1067788, -1.417418, 0, 1, 0.4705882, 1,
-0.2344007, 0.7797786, -1.77076, 0, 1, 0.4784314, 1,
-0.2337901, -0.03521226, -0.1148765, 0, 1, 0.4823529, 1,
-0.233458, -0.4395843, -2.586916, 0, 1, 0.4901961, 1,
-0.230175, -1.176904, -1.563487, 0, 1, 0.4941176, 1,
-0.2298447, -0.2883699, -4.586997, 0, 1, 0.5019608, 1,
-0.2291496, -2.43984, -3.397051, 0, 1, 0.509804, 1,
-0.227718, 0.3931833, -0.6707938, 0, 1, 0.5137255, 1,
-0.2263894, 0.7263708, -0.2853262, 0, 1, 0.5215687, 1,
-0.2251791, -1.311542, -4.908224, 0, 1, 0.5254902, 1,
-0.2224521, -0.3858327, -1.833438, 0, 1, 0.5333334, 1,
-0.2210004, 0.2537237, -0.9396288, 0, 1, 0.5372549, 1,
-0.2193749, -1.682102, -2.947744, 0, 1, 0.5450981, 1,
-0.2171403, 0.667062, -0.7252765, 0, 1, 0.5490196, 1,
-0.216721, 1.242787, 0.4368484, 0, 1, 0.5568628, 1,
-0.2160814, -0.1352092, -2.620914, 0, 1, 0.5607843, 1,
-0.2108246, -0.1474492, -1.389009, 0, 1, 0.5686275, 1,
-0.2070952, -0.9497119, -1.671588, 0, 1, 0.572549, 1,
-0.2062683, -1.232025, -3.546668, 0, 1, 0.5803922, 1,
-0.2034944, -0.3765814, -3.905722, 0, 1, 0.5843138, 1,
-0.199519, -1.261059, -3.495088, 0, 1, 0.5921569, 1,
-0.1931472, -0.03931007, -1.031129, 0, 1, 0.5960785, 1,
-0.1868253, -0.8110202, -2.458238, 0, 1, 0.6039216, 1,
-0.1842761, -0.293642, -2.533953, 0, 1, 0.6117647, 1,
-0.1790894, 0.1739924, -1.446367, 0, 1, 0.6156863, 1,
-0.1724465, 2.496528, -1.109696, 0, 1, 0.6235294, 1,
-0.1708102, -0.3192142, -1.224004, 0, 1, 0.627451, 1,
-0.1705971, -1.561237, -2.606223, 0, 1, 0.6352941, 1,
-0.1703374, -2.457445, -4.013891, 0, 1, 0.6392157, 1,
-0.1648555, -0.6585951, -1.072937, 0, 1, 0.6470588, 1,
-0.1578477, -0.1001839, -3.3138, 0, 1, 0.6509804, 1,
-0.1578033, -0.987361, -3.849422, 0, 1, 0.6588235, 1,
-0.1549307, -0.02725837, -1.521287, 0, 1, 0.6627451, 1,
-0.153901, 1.71445, -0.3718642, 0, 1, 0.6705883, 1,
-0.1532656, 1.270003, 1.548487, 0, 1, 0.6745098, 1,
-0.1525898, 0.9756784, -1.244269, 0, 1, 0.682353, 1,
-0.150267, 0.5347226, 0.2706008, 0, 1, 0.6862745, 1,
-0.1496522, -0.1822913, -1.751611, 0, 1, 0.6941177, 1,
-0.1417029, -0.8843485, -4.875251, 0, 1, 0.7019608, 1,
-0.1357642, -0.4162251, -2.46761, 0, 1, 0.7058824, 1,
-0.1319326, 0.7166287, -0.5457535, 0, 1, 0.7137255, 1,
-0.1302292, 0.7054121, -0.5267243, 0, 1, 0.7176471, 1,
-0.1273533, 2.76233, 1.335841, 0, 1, 0.7254902, 1,
-0.1241582, 1.696014, 1.275485, 0, 1, 0.7294118, 1,
-0.1205698, -1.131737, -3.90299, 0, 1, 0.7372549, 1,
-0.1188633, -0.8907613, -1.517648, 0, 1, 0.7411765, 1,
-0.1185009, -0.5092662, -3.161509, 0, 1, 0.7490196, 1,
-0.1156298, 1.05064, -1.465383, 0, 1, 0.7529412, 1,
-0.1123625, -0.1805918, -3.497705, 0, 1, 0.7607843, 1,
-0.1058852, 1.530512, -1.984347, 0, 1, 0.7647059, 1,
-0.1020395, -1.030046, -2.327616, 0, 1, 0.772549, 1,
-0.1011092, -0.00672556, -1.826189, 0, 1, 0.7764706, 1,
-0.09847319, -1.038685, -4.446434, 0, 1, 0.7843137, 1,
-0.08981925, 0.8039147, 1.614726, 0, 1, 0.7882353, 1,
-0.086928, -0.03661282, -1.922134, 0, 1, 0.7960784, 1,
-0.08543912, 1.313218, 0.5879086, 0, 1, 0.8039216, 1,
-0.08531181, -0.1876141, -2.114839, 0, 1, 0.8078431, 1,
-0.07998489, -2.180802, -1.372146, 0, 1, 0.8156863, 1,
-0.07684559, 1.108716, -1.877638, 0, 1, 0.8196079, 1,
-0.07670176, -0.05326162, -2.697178, 0, 1, 0.827451, 1,
-0.07612091, 2.1449, -2.078689, 0, 1, 0.8313726, 1,
-0.07368349, -1.503669, -3.87743, 0, 1, 0.8392157, 1,
-0.07336213, 0.4731725, -1.25945, 0, 1, 0.8431373, 1,
-0.07211821, -1.934471, -3.581485, 0, 1, 0.8509804, 1,
-0.07089182, -0.2721557, -3.675514, 0, 1, 0.854902, 1,
-0.06456156, -0.801861, -2.151742, 0, 1, 0.8627451, 1,
-0.05475489, 0.6576608, -0.1689738, 0, 1, 0.8666667, 1,
-0.05431061, -1.19409, -1.888926, 0, 1, 0.8745098, 1,
-0.05162771, -0.1769467, -1.857681, 0, 1, 0.8784314, 1,
-0.05065887, -0.6175867, -4.373361, 0, 1, 0.8862745, 1,
-0.04649185, 1.148963, 0.128685, 0, 1, 0.8901961, 1,
-0.04345458, 0.01360648, -2.067559, 0, 1, 0.8980392, 1,
-0.0425084, -0.3749301, -3.946048, 0, 1, 0.9058824, 1,
-0.04078474, 0.5797312, -1.358717, 0, 1, 0.9098039, 1,
-0.03703243, -0.9109466, -3.020414, 0, 1, 0.9176471, 1,
-0.03317524, 0.01022302, -3.052606, 0, 1, 0.9215686, 1,
-0.03311834, -1.286519, -4.604994, 0, 1, 0.9294118, 1,
-0.03150093, -0.4440181, -3.451931, 0, 1, 0.9333333, 1,
-0.02771758, 0.5963542, 0.4739161, 0, 1, 0.9411765, 1,
-0.02720601, 0.3109097, 0.5784836, 0, 1, 0.945098, 1,
-0.02701744, 0.7199947, 0.4377699, 0, 1, 0.9529412, 1,
-0.0254762, -0.4751697, -2.137844, 0, 1, 0.9568627, 1,
-0.02329073, -1.106362, -2.496343, 0, 1, 0.9647059, 1,
-0.02065786, -0.3589622, -5.424965, 0, 1, 0.9686275, 1,
-0.01993264, -0.9246486, -4.390529, 0, 1, 0.9764706, 1,
-0.01874016, 0.1520402, 1.613898, 0, 1, 0.9803922, 1,
-0.01820825, 0.8708074, 1.502695, 0, 1, 0.9882353, 1,
-0.01768236, 1.226774, 0.1602151, 0, 1, 0.9921569, 1,
-0.01230141, -0.8445021, -1.60447, 0, 1, 1, 1,
-0.006254471, -0.6162698, -3.686075, 0, 0.9921569, 1, 1,
-0.0005654864, 1.026341, -0.3053209, 0, 0.9882353, 1, 1,
-1.380308e-05, 0.1942248, -0.4309283, 0, 0.9803922, 1, 1,
0.0001681214, -0.1310529, 3.392674, 0, 0.9764706, 1, 1,
0.001989641, 0.8236362, 0.7675011, 0, 0.9686275, 1, 1,
0.002498326, 0.6508573, 0.8989213, 0, 0.9647059, 1, 1,
0.004983551, -0.1654414, 3.407524, 0, 0.9568627, 1, 1,
0.005381605, 1.732078, 0.6264025, 0, 0.9529412, 1, 1,
0.007728199, -0.6673834, 3.58819, 0, 0.945098, 1, 1,
0.007886427, -0.6709348, 2.184794, 0, 0.9411765, 1, 1,
0.008972782, 1.464357, -0.8414207, 0, 0.9333333, 1, 1,
0.01313092, -0.2442751, 3.264836, 0, 0.9294118, 1, 1,
0.01750398, 1.044565, -0.6986453, 0, 0.9215686, 1, 1,
0.01803214, 0.9364265, 0.8589949, 0, 0.9176471, 1, 1,
0.02097129, -1.530943, 4.097648, 0, 0.9098039, 1, 1,
0.02815753, 0.7769794, 0.265751, 0, 0.9058824, 1, 1,
0.03305493, 2.768043, 0.7176805, 0, 0.8980392, 1, 1,
0.03401471, 0.8292105, -0.1752414, 0, 0.8901961, 1, 1,
0.03568786, -0.4719212, 2.432017, 0, 0.8862745, 1, 1,
0.03765044, -1.376798, 1.733106, 0, 0.8784314, 1, 1,
0.04010708, 0.3015386, -1.828853, 0, 0.8745098, 1, 1,
0.04013384, 0.9526523, 1.151084, 0, 0.8666667, 1, 1,
0.04065974, -0.7358531, 3.096829, 0, 0.8627451, 1, 1,
0.04135001, 0.6736137, 2.037032, 0, 0.854902, 1, 1,
0.04280638, -0.2733801, 3.792642, 0, 0.8509804, 1, 1,
0.04525479, 0.3848715, 0.6309131, 0, 0.8431373, 1, 1,
0.04690693, -0.1845048, 2.171662, 0, 0.8392157, 1, 1,
0.0477, 0.7643272, 1.593947, 0, 0.8313726, 1, 1,
0.04884369, 1.244197, -0.01410354, 0, 0.827451, 1, 1,
0.05054082, 1.40897, 2.302164, 0, 0.8196079, 1, 1,
0.05463658, 1.121093, -0.6191483, 0, 0.8156863, 1, 1,
0.05911136, 0.2517731, -0.09518076, 0, 0.8078431, 1, 1,
0.06208387, -0.2473919, 2.34731, 0, 0.8039216, 1, 1,
0.06276619, -0.9669563, 5.793821, 0, 0.7960784, 1, 1,
0.06686868, -2.220764, 4.808311, 0, 0.7882353, 1, 1,
0.07433063, 0.1407437, 0.1004899, 0, 0.7843137, 1, 1,
0.07578661, -0.2902686, 1.613105, 0, 0.7764706, 1, 1,
0.08175839, -1.887857, 4.303345, 0, 0.772549, 1, 1,
0.08393554, 0.357143, -0.2315802, 0, 0.7647059, 1, 1,
0.08587676, 1.55943, -0.3364075, 0, 0.7607843, 1, 1,
0.08676168, 0.141822, 1.41526, 0, 0.7529412, 1, 1,
0.08787483, -0.4303489, 2.449297, 0, 0.7490196, 1, 1,
0.09597886, -0.1206388, 1.258786, 0, 0.7411765, 1, 1,
0.09658043, -0.6290919, 4.780542, 0, 0.7372549, 1, 1,
0.09771986, -0.4308897, 3.717578, 0, 0.7294118, 1, 1,
0.1003796, -0.2711149, 3.044675, 0, 0.7254902, 1, 1,
0.112222, 0.5971639, 1.260444, 0, 0.7176471, 1, 1,
0.1170523, 0.6187132, -1.123435, 0, 0.7137255, 1, 1,
0.126845, 0.768282, 1.471587, 0, 0.7058824, 1, 1,
0.1286587, -0.8706958, 1.478624, 0, 0.6980392, 1, 1,
0.1288072, -1.255111, 4.173102, 0, 0.6941177, 1, 1,
0.133756, 1.030197, -0.5553921, 0, 0.6862745, 1, 1,
0.1338345, 1.031651, 0.2377992, 0, 0.682353, 1, 1,
0.1361018, 0.6640859, -1.340697, 0, 0.6745098, 1, 1,
0.139126, -1.61535, 3.717719, 0, 0.6705883, 1, 1,
0.1423877, -0.2716331, 2.345322, 0, 0.6627451, 1, 1,
0.1445109, 0.7948961, 1.640946, 0, 0.6588235, 1, 1,
0.1505587, -0.1319275, 0.8568526, 0, 0.6509804, 1, 1,
0.1516323, 1.561868, 0.3524463, 0, 0.6470588, 1, 1,
0.1516435, 0.8169839, 1.1523, 0, 0.6392157, 1, 1,
0.1527787, 1.065587, -0.7361259, 0, 0.6352941, 1, 1,
0.1563324, 0.474175, -1.761721, 0, 0.627451, 1, 1,
0.1568017, 0.447991, -0.2083545, 0, 0.6235294, 1, 1,
0.1585826, -0.3070709, 2.407385, 0, 0.6156863, 1, 1,
0.164305, -0.9626341, 1.019416, 0, 0.6117647, 1, 1,
0.1704651, -1.389696, 4.077768, 0, 0.6039216, 1, 1,
0.1705687, -1.050176, 4.130556, 0, 0.5960785, 1, 1,
0.1729891, -0.2116292, 3.782167, 0, 0.5921569, 1, 1,
0.1739264, -0.4615569, 1.361139, 0, 0.5843138, 1, 1,
0.1752891, 0.2919083, 1.086551, 0, 0.5803922, 1, 1,
0.1762284, -0.916625, 1.374554, 0, 0.572549, 1, 1,
0.1804553, 0.5188308, -1.261887, 0, 0.5686275, 1, 1,
0.182634, -1.526282, 2.115653, 0, 0.5607843, 1, 1,
0.1842252, 0.6007141, 1.201991, 0, 0.5568628, 1, 1,
0.1858728, -0.1487634, 1.598552, 0, 0.5490196, 1, 1,
0.1899619, 0.6911521, -1.955755, 0, 0.5450981, 1, 1,
0.1900768, 0.3667415, 1.579599, 0, 0.5372549, 1, 1,
0.1915262, -1.548552, 4.168499, 0, 0.5333334, 1, 1,
0.192457, 2.177181, -0.4476327, 0, 0.5254902, 1, 1,
0.2009841, -0.6232523, 3.352158, 0, 0.5215687, 1, 1,
0.2045558, 1.079495, -0.4508364, 0, 0.5137255, 1, 1,
0.2061215, -0.9485831, 2.268972, 0, 0.509804, 1, 1,
0.2076195, -0.6837885, 3.102495, 0, 0.5019608, 1, 1,
0.209693, 0.3710719, 0.6175395, 0, 0.4941176, 1, 1,
0.210689, 0.1789187, 0.9956864, 0, 0.4901961, 1, 1,
0.2144547, 0.1597415, 0.8901698, 0, 0.4823529, 1, 1,
0.2180103, 0.3747141, 0.2148992, 0, 0.4784314, 1, 1,
0.2219044, -1.246737, 4.71241, 0, 0.4705882, 1, 1,
0.222899, 1.672084, 0.1609443, 0, 0.4666667, 1, 1,
0.2229294, -2.201397, 3.633722, 0, 0.4588235, 1, 1,
0.2253197, -0.3847518, 2.992064, 0, 0.454902, 1, 1,
0.225645, 1.708998, 0.6394511, 0, 0.4470588, 1, 1,
0.2332797, 2.898895, 0.4105614, 0, 0.4431373, 1, 1,
0.235944, 0.03064969, 2.156654, 0, 0.4352941, 1, 1,
0.2492977, -0.8785039, 2.966902, 0, 0.4313726, 1, 1,
0.26326, 0.5814637, -0.3838246, 0, 0.4235294, 1, 1,
0.2668166, 0.8854206, -0.8445832, 0, 0.4196078, 1, 1,
0.269935, 0.714541, 0.1347755, 0, 0.4117647, 1, 1,
0.2718106, 0.1572398, 2.21973, 0, 0.4078431, 1, 1,
0.2740596, 0.3144692, 0.8392157, 0, 0.4, 1, 1,
0.2758087, -1.241456, 1.761768, 0, 0.3921569, 1, 1,
0.2820244, -1.121583, 2.728375, 0, 0.3882353, 1, 1,
0.2827829, 1.298814, 0.395967, 0, 0.3803922, 1, 1,
0.2830924, -0.5621852, 3.213011, 0, 0.3764706, 1, 1,
0.2841899, -0.7028121, 2.794622, 0, 0.3686275, 1, 1,
0.2872162, 0.6219637, -0.4831081, 0, 0.3647059, 1, 1,
0.2886071, -0.0643099, 2.404944, 0, 0.3568628, 1, 1,
0.2888356, 1.589454, 1.259658, 0, 0.3529412, 1, 1,
0.2895661, 0.8414825, -0.4258519, 0, 0.345098, 1, 1,
0.2908811, 0.5201877, 1.61973, 0, 0.3411765, 1, 1,
0.291885, -0.423277, 2.874565, 0, 0.3333333, 1, 1,
0.2946379, -0.06157342, 1.691281, 0, 0.3294118, 1, 1,
0.2955075, 0.4662168, 1.061077, 0, 0.3215686, 1, 1,
0.2960448, -2.94171, 1.733896, 0, 0.3176471, 1, 1,
0.2982399, -0.6456773, 2.938607, 0, 0.3098039, 1, 1,
0.2992328, -1.081211, 2.02287, 0, 0.3058824, 1, 1,
0.302837, 0.5065529, -0.1936907, 0, 0.2980392, 1, 1,
0.3045616, -0.8889844, 2.688859, 0, 0.2901961, 1, 1,
0.3066799, 0.2940718, -0.3447317, 0, 0.2862745, 1, 1,
0.3154857, 0.6855174, -1.092905, 0, 0.2784314, 1, 1,
0.3168658, 0.5454029, 1.315168, 0, 0.2745098, 1, 1,
0.323776, -2.727147, 2.722893, 0, 0.2666667, 1, 1,
0.3248559, 0.4717231, -1.722751, 0, 0.2627451, 1, 1,
0.328177, 0.2002839, 1.02538, 0, 0.254902, 1, 1,
0.329881, -0.4264913, 2.030759, 0, 0.2509804, 1, 1,
0.3341449, -1.65504, 2.656085, 0, 0.2431373, 1, 1,
0.3344262, -1.324841, 3.255505, 0, 0.2392157, 1, 1,
0.3371418, 0.351866, 1.357274, 0, 0.2313726, 1, 1,
0.3455334, -0.4718985, 2.381327, 0, 0.227451, 1, 1,
0.3492865, 0.5655109, 0.6598554, 0, 0.2196078, 1, 1,
0.3582087, -0.04936749, 1.800066, 0, 0.2156863, 1, 1,
0.3619691, 1.36368, 1.193041, 0, 0.2078431, 1, 1,
0.3642339, 1.077976, 0.7902141, 0, 0.2039216, 1, 1,
0.3652955, -0.8874795, 3.117974, 0, 0.1960784, 1, 1,
0.366094, 1.289421, 0.5049816, 0, 0.1882353, 1, 1,
0.3672903, -0.6602701, 3.081793, 0, 0.1843137, 1, 1,
0.3673854, 0.3744127, 2.096051, 0, 0.1764706, 1, 1,
0.3677362, 0.2160452, -0.3567601, 0, 0.172549, 1, 1,
0.3717182, -0.6332614, 3.040424, 0, 0.1647059, 1, 1,
0.3733782, 0.09747735, 3.188522, 0, 0.1607843, 1, 1,
0.3733815, -1.009292, 2.702404, 0, 0.1529412, 1, 1,
0.3735819, 1.643657, 0.7974975, 0, 0.1490196, 1, 1,
0.3756177, -1.222974, 3.525718, 0, 0.1411765, 1, 1,
0.3776708, 1.340368, 0.8593126, 0, 0.1372549, 1, 1,
0.3865383, 1.479746, 0.4285366, 0, 0.1294118, 1, 1,
0.3878584, -0.8587297, 1.58021, 0, 0.1254902, 1, 1,
0.3900287, 0.3717809, 0.4052917, 0, 0.1176471, 1, 1,
0.3904034, -0.1286243, 3.590164, 0, 0.1137255, 1, 1,
0.3922517, 0.8208283, -0.3852937, 0, 0.1058824, 1, 1,
0.3978669, -2.198178, 4.493072, 0, 0.09803922, 1, 1,
0.4022896, 1.615154, 3.324388, 0, 0.09411765, 1, 1,
0.4052916, 0.3154607, -0.2185279, 0, 0.08627451, 1, 1,
0.40991, 0.1320632, -0.7746747, 0, 0.08235294, 1, 1,
0.4112327, 0.8509015, 0.2345553, 0, 0.07450981, 1, 1,
0.4166276, -0.7987872, 1.695874, 0, 0.07058824, 1, 1,
0.4182968, -0.9742712, 2.029371, 0, 0.0627451, 1, 1,
0.4223909, -0.4809706, 1.988139, 0, 0.05882353, 1, 1,
0.4257412, 0.05206922, 1.33359, 0, 0.05098039, 1, 1,
0.4257989, -0.1798441, 1.899953, 0, 0.04705882, 1, 1,
0.4275958, 1.529343, 0.9316949, 0, 0.03921569, 1, 1,
0.4294133, 2.883406, 0.4564152, 0, 0.03529412, 1, 1,
0.4297109, 0.01634447, 1.990043, 0, 0.02745098, 1, 1,
0.4333787, 0.1738565, 2.367403, 0, 0.02352941, 1, 1,
0.4364668, 1.357503, -0.2632798, 0, 0.01568628, 1, 1,
0.4370957, 0.09986448, 0.8011656, 0, 0.01176471, 1, 1,
0.439632, 0.6759751, 0.3148218, 0, 0.003921569, 1, 1,
0.4397021, -0.2718378, 1.560415, 0.003921569, 0, 1, 1,
0.4441307, 0.9435886, 0.5499139, 0.007843138, 0, 1, 1,
0.4476369, 0.04222791, -0.2325844, 0.01568628, 0, 1, 1,
0.4497876, 2.184305, -0.4271354, 0.01960784, 0, 1, 1,
0.4532105, 1.97775, 0.9236516, 0.02745098, 0, 1, 1,
0.4551576, 0.2598202, 1.370856, 0.03137255, 0, 1, 1,
0.4565809, 0.435392, 1.847205, 0.03921569, 0, 1, 1,
0.4644645, 0.4678105, 1.386716, 0.04313726, 0, 1, 1,
0.4785839, 0.7116331, 1.274162, 0.05098039, 0, 1, 1,
0.4791668, 0.5961661, 0.8017725, 0.05490196, 0, 1, 1,
0.4814534, -0.5918314, 1.108644, 0.0627451, 0, 1, 1,
0.4815562, 0.2466647, 0.5042925, 0.06666667, 0, 1, 1,
0.4867295, -0.01228185, -0.5640489, 0.07450981, 0, 1, 1,
0.4881674, 0.08694104, 0.1835945, 0.07843138, 0, 1, 1,
0.4922026, -0.1107315, 0.8170266, 0.08627451, 0, 1, 1,
0.4950547, 1.002505, -1.247, 0.09019608, 0, 1, 1,
0.4963097, -1.373085, 3.289278, 0.09803922, 0, 1, 1,
0.4980262, 0.4421918, 2.216163, 0.1058824, 0, 1, 1,
0.5013756, -0.6220035, 2.292031, 0.1098039, 0, 1, 1,
0.5075901, 0.6230662, 0.7206434, 0.1176471, 0, 1, 1,
0.5099258, 0.8324963, 0.5247378, 0.1215686, 0, 1, 1,
0.5115364, 0.9427763, 0.5886107, 0.1294118, 0, 1, 1,
0.5148132, -2.121893, 3.700211, 0.1333333, 0, 1, 1,
0.5156853, 0.4178581, 0.5755957, 0.1411765, 0, 1, 1,
0.516337, -0.5630729, 0.9028946, 0.145098, 0, 1, 1,
0.5227494, 0.8419803, -0.4983389, 0.1529412, 0, 1, 1,
0.5289291, 0.5531869, 0.9009427, 0.1568628, 0, 1, 1,
0.531396, 0.1310531, 1.435723, 0.1647059, 0, 1, 1,
0.5319106, -0.1629428, 3.231771, 0.1686275, 0, 1, 1,
0.5420744, -1.308927, 3.194908, 0.1764706, 0, 1, 1,
0.5470611, 0.1865205, 1.557418, 0.1803922, 0, 1, 1,
0.549588, -1.195185, 3.873408, 0.1882353, 0, 1, 1,
0.5511015, 1.129366, 1.941697, 0.1921569, 0, 1, 1,
0.557345, 0.6415936, 0.4018412, 0.2, 0, 1, 1,
0.5625486, 0.968684, 0.4432935, 0.2078431, 0, 1, 1,
0.564717, -0.5718018, 2.393083, 0.2117647, 0, 1, 1,
0.5659225, -0.1853117, 1.908963, 0.2196078, 0, 1, 1,
0.5665497, 0.5317566, 1.646199, 0.2235294, 0, 1, 1,
0.5669672, 0.5651481, 0.5628961, 0.2313726, 0, 1, 1,
0.5723964, 1.950087, -0.6297445, 0.2352941, 0, 1, 1,
0.5729958, 0.4102469, -0.4994258, 0.2431373, 0, 1, 1,
0.5741501, -1.290958, 3.145945, 0.2470588, 0, 1, 1,
0.5804431, 1.028802, 1.737315, 0.254902, 0, 1, 1,
0.5835492, -1.216656, 1.594249, 0.2588235, 0, 1, 1,
0.5860323, 1.05936, 1.708787, 0.2666667, 0, 1, 1,
0.586552, 0.4893482, 0.1938972, 0.2705882, 0, 1, 1,
0.5882018, 2.452947, 0.4955162, 0.2784314, 0, 1, 1,
0.5890692, 0.702409, 1.455206, 0.282353, 0, 1, 1,
0.5907268, -0.6417853, 1.586014, 0.2901961, 0, 1, 1,
0.5975857, 0.6551845, 0.005694418, 0.2941177, 0, 1, 1,
0.602219, 0.779181, 2.076998, 0.3019608, 0, 1, 1,
0.6103992, 0.7312931, 1.495677, 0.3098039, 0, 1, 1,
0.6115465, -0.177043, 0.7500699, 0.3137255, 0, 1, 1,
0.6117242, 0.3923006, 1.113802, 0.3215686, 0, 1, 1,
0.6145343, 0.01231098, -0.5619518, 0.3254902, 0, 1, 1,
0.6172215, 1.930763, 0.5260672, 0.3333333, 0, 1, 1,
0.6204408, 0.4561189, 0.5631432, 0.3372549, 0, 1, 1,
0.6254956, -2.755807, 3.744714, 0.345098, 0, 1, 1,
0.6276091, -0.3841137, 2.462608, 0.3490196, 0, 1, 1,
0.6297687, -1.695621, 2.957122, 0.3568628, 0, 1, 1,
0.6309595, -0.9687895, 1.830357, 0.3607843, 0, 1, 1,
0.6407871, -0.6366438, 3.453818, 0.3686275, 0, 1, 1,
0.6435793, -1.142772, 3.395902, 0.372549, 0, 1, 1,
0.6445561, 0.3342031, 1.43923, 0.3803922, 0, 1, 1,
0.646481, 0.5538799, -0.4335098, 0.3843137, 0, 1, 1,
0.6512672, -1.926417, 4.437074, 0.3921569, 0, 1, 1,
0.6516947, -0.8653793, 2.72949, 0.3960784, 0, 1, 1,
0.6543368, 2.219484, -0.4390526, 0.4039216, 0, 1, 1,
0.6594703, -0.4490302, 2.648192, 0.4117647, 0, 1, 1,
0.6610121, 1.314318, 0.07396504, 0.4156863, 0, 1, 1,
0.668218, -1.311771, 1.674857, 0.4235294, 0, 1, 1,
0.6682265, 0.3332253, -0.1972526, 0.427451, 0, 1, 1,
0.6766366, 0.01330655, 2.257114, 0.4352941, 0, 1, 1,
0.6792856, -1.386329, 4.871528, 0.4392157, 0, 1, 1,
0.6908169, 1.351973, 1.566127, 0.4470588, 0, 1, 1,
0.6933314, -0.4468432, 0.6365346, 0.4509804, 0, 1, 1,
0.694693, -0.5286686, 2.262181, 0.4588235, 0, 1, 1,
0.6951371, -0.6296608, 2.226846, 0.4627451, 0, 1, 1,
0.7022058, -0.7533453, 2.069657, 0.4705882, 0, 1, 1,
0.7030514, 0.8437032, -0.009186978, 0.4745098, 0, 1, 1,
0.7070678, 0.9365416, 1.23071, 0.4823529, 0, 1, 1,
0.7075782, -1.675204, 1.729311, 0.4862745, 0, 1, 1,
0.7089495, 0.8480663, 0.3685509, 0.4941176, 0, 1, 1,
0.7109722, -0.4963208, 2.357043, 0.5019608, 0, 1, 1,
0.71249, 0.08285093, 1.666706, 0.5058824, 0, 1, 1,
0.7140943, -0.06350476, 1.837191, 0.5137255, 0, 1, 1,
0.7141982, 1.100877, 0.7943133, 0.5176471, 0, 1, 1,
0.7143017, -1.514808, 1.769259, 0.5254902, 0, 1, 1,
0.7149194, 2.061689, -0.5965779, 0.5294118, 0, 1, 1,
0.7167026, 0.1030058, 1.693033, 0.5372549, 0, 1, 1,
0.7176315, -0.959985, 3.196927, 0.5411765, 0, 1, 1,
0.7222408, -0.3836645, 2.876384, 0.5490196, 0, 1, 1,
0.7228264, -0.09139965, 2.123222, 0.5529412, 0, 1, 1,
0.7309663, -0.3703118, 3.450569, 0.5607843, 0, 1, 1,
0.7314551, 0.8861365, 1.58987, 0.5647059, 0, 1, 1,
0.7322124, -0.2909003, 1.666522, 0.572549, 0, 1, 1,
0.739744, 0.479378, -0.2024008, 0.5764706, 0, 1, 1,
0.7445382, 1.285479, 0.7389856, 0.5843138, 0, 1, 1,
0.7448598, -1.032027, 3.707305, 0.5882353, 0, 1, 1,
0.7456008, 0.991825, 0.3869366, 0.5960785, 0, 1, 1,
0.7459446, 0.6160274, 0.9496697, 0.6039216, 0, 1, 1,
0.7469749, 0.5327477, 2.694074, 0.6078432, 0, 1, 1,
0.7503955, 0.2174338, 0.2534551, 0.6156863, 0, 1, 1,
0.752171, -0.6726538, 2.632823, 0.6196079, 0, 1, 1,
0.7560056, 0.7772866, 2.691846, 0.627451, 0, 1, 1,
0.7603012, 1.16806, 0.3578995, 0.6313726, 0, 1, 1,
0.7610596, 0.5727484, 1.139146, 0.6392157, 0, 1, 1,
0.7614147, 1.279451, 0.7757874, 0.6431373, 0, 1, 1,
0.7634389, 0.3683841, 1.63553, 0.6509804, 0, 1, 1,
0.7650781, -0.5438844, 0.9569435, 0.654902, 0, 1, 1,
0.7667334, -0.8460112, 2.146925, 0.6627451, 0, 1, 1,
0.7670195, -0.9364672, 0.9312453, 0.6666667, 0, 1, 1,
0.7704636, -0.6167971, 1.734291, 0.6745098, 0, 1, 1,
0.7808911, 0.940728, 1.913862, 0.6784314, 0, 1, 1,
0.7846391, -1.378057, 1.824757, 0.6862745, 0, 1, 1,
0.7925979, 0.7043708, -0.5076001, 0.6901961, 0, 1, 1,
0.7929514, 0.502436, 0.7840218, 0.6980392, 0, 1, 1,
0.7954168, 0.2029501, 2.089121, 0.7058824, 0, 1, 1,
0.7955695, 0.4568543, 0.5783588, 0.7098039, 0, 1, 1,
0.8080533, -0.6725077, 0.6248889, 0.7176471, 0, 1, 1,
0.8090308, 0.5647169, -0.1442843, 0.7215686, 0, 1, 1,
0.8123353, -0.4179723, 3.894837, 0.7294118, 0, 1, 1,
0.8158481, 1.359474, 0.8363913, 0.7333333, 0, 1, 1,
0.8170799, 0.2404521, 0.8622484, 0.7411765, 0, 1, 1,
0.8181843, -1.859766, 4.273587, 0.7450981, 0, 1, 1,
0.8211277, -1.23414, 3.524838, 0.7529412, 0, 1, 1,
0.8229675, 0.7168398, 0.755545, 0.7568628, 0, 1, 1,
0.831171, -0.7072822, 2.373735, 0.7647059, 0, 1, 1,
0.8319067, -0.6197734, 2.815577, 0.7686275, 0, 1, 1,
0.832647, -0.6881353, 1.306975, 0.7764706, 0, 1, 1,
0.834825, 1.071854, 1.676372, 0.7803922, 0, 1, 1,
0.8628762, -0.3519543, 1.969434, 0.7882353, 0, 1, 1,
0.8659326, -0.1417963, 1.385211, 0.7921569, 0, 1, 1,
0.8682322, 0.4178636, 1.359077, 0.8, 0, 1, 1,
0.8746116, -1.686299, 4.463191, 0.8078431, 0, 1, 1,
0.8795975, -0.9584644, 1.847782, 0.8117647, 0, 1, 1,
0.8815525, 1.145931, -2.18505, 0.8196079, 0, 1, 1,
0.8831733, 1.280589, -0.1283301, 0.8235294, 0, 1, 1,
0.8857417, -0.6088035, 1.616483, 0.8313726, 0, 1, 1,
0.8886559, -0.2278599, 1.009798, 0.8352941, 0, 1, 1,
0.8902856, 0.1086542, 1.628416, 0.8431373, 0, 1, 1,
0.8922181, -1.50753, 1.85337, 0.8470588, 0, 1, 1,
0.9008408, 1.294235, 2.204082, 0.854902, 0, 1, 1,
0.9073016, -1.172419, 2.949245, 0.8588235, 0, 1, 1,
0.9150217, 0.4973055, 1.929039, 0.8666667, 0, 1, 1,
0.9173185, 0.3784274, 0.6271615, 0.8705882, 0, 1, 1,
0.9194946, 1.715987, 0.9937224, 0.8784314, 0, 1, 1,
0.9222546, 1.911607, 0.3532873, 0.8823529, 0, 1, 1,
0.9231476, -1.178152, 2.921612, 0.8901961, 0, 1, 1,
0.9237894, 1.293754, 1.597496, 0.8941177, 0, 1, 1,
0.9259313, -1.418295, 2.185956, 0.9019608, 0, 1, 1,
0.9286469, 1.713205, 1.270387, 0.9098039, 0, 1, 1,
0.9350802, -1.518632, 3.787013, 0.9137255, 0, 1, 1,
0.9397445, -0.645827, 1.725041, 0.9215686, 0, 1, 1,
0.9536499, -0.01611597, 1.700688, 0.9254902, 0, 1, 1,
0.9546383, -0.399625, 0.7066448, 0.9333333, 0, 1, 1,
0.9588395, -2.367806, 3.768241, 0.9372549, 0, 1, 1,
0.9618583, 0.5225323, 0.5009223, 0.945098, 0, 1, 1,
0.9649885, -0.8707591, 1.87807, 0.9490196, 0, 1, 1,
0.9650751, -0.4953762, 3.998989, 0.9568627, 0, 1, 1,
0.9674321, 1.109591, 1.35756, 0.9607843, 0, 1, 1,
0.9690843, 0.1422875, 1.093431, 0.9686275, 0, 1, 1,
0.9739858, 0.03763071, 1.189527, 0.972549, 0, 1, 1,
0.9768352, 0.04701007, 0.9637102, 0.9803922, 0, 1, 1,
0.9785388, -1.388734, 2.439171, 0.9843137, 0, 1, 1,
0.9813688, -0.8145986, 2.878396, 0.9921569, 0, 1, 1,
0.9828523, -1.319058, 4.109966, 0.9960784, 0, 1, 1,
0.9850926, 0.2882974, 1.219135, 1, 0, 0.9960784, 1,
0.9868225, -1.654896, 2.288052, 1, 0, 0.9882353, 1,
0.9897101, 0.5930523, -0.4243428, 1, 0, 0.9843137, 1,
0.9915776, -0.02564333, 2.211494, 1, 0, 0.9764706, 1,
1.018234, 0.1355724, 1.890153, 1, 0, 0.972549, 1,
1.022111, 1.470856, 0.2856818, 1, 0, 0.9647059, 1,
1.022868, 0.3711458, 3.130002, 1, 0, 0.9607843, 1,
1.023521, -1.196256, 3.699373, 1, 0, 0.9529412, 1,
1.029192, -1.556544, 1.230425, 1, 0, 0.9490196, 1,
1.029784, -1.034674, 1.598551, 1, 0, 0.9411765, 1,
1.037664, -0.2689831, 3.113903, 1, 0, 0.9372549, 1,
1.051305, -1.510441, 2.562175, 1, 0, 0.9294118, 1,
1.053375, -0.9768015, 2.36277, 1, 0, 0.9254902, 1,
1.053587, -1.243348, 2.267283, 1, 0, 0.9176471, 1,
1.06188, -1.497286, 3.211133, 1, 0, 0.9137255, 1,
1.061904, -0.05236398, -0.7924828, 1, 0, 0.9058824, 1,
1.06701, 0.07620683, 3.120015, 1, 0, 0.9019608, 1,
1.069174, -0.8798796, 2.700022, 1, 0, 0.8941177, 1,
1.076145, 1.289866, -0.3410251, 1, 0, 0.8862745, 1,
1.083464, 1.281574, 0.2633523, 1, 0, 0.8823529, 1,
1.084009, 0.2478233, 3.015302, 1, 0, 0.8745098, 1,
1.089448, 0.4318497, 1.061635, 1, 0, 0.8705882, 1,
1.091584, -2.052619, 2.130178, 1, 0, 0.8627451, 1,
1.097663, 0.345052, 0.9595018, 1, 0, 0.8588235, 1,
1.098188, 1.515505, 1.221774, 1, 0, 0.8509804, 1,
1.102853, -0.4756254, 1.804573, 1, 0, 0.8470588, 1,
1.103632, 0.6426789, 1.154833, 1, 0, 0.8392157, 1,
1.106167, -0.6150053, 1.481357, 1, 0, 0.8352941, 1,
1.1074, -0.3729832, 2.302361, 1, 0, 0.827451, 1,
1.108104, 0.3019497, 0.9035746, 1, 0, 0.8235294, 1,
1.117466, -1.049968, 0.6657642, 1, 0, 0.8156863, 1,
1.117616, -0.1986191, 2.079949, 1, 0, 0.8117647, 1,
1.119858, 0.1088938, 1.433901, 1, 0, 0.8039216, 1,
1.123172, 0.08667822, 2.26892, 1, 0, 0.7960784, 1,
1.126348, 2.115405, 0.4982822, 1, 0, 0.7921569, 1,
1.130856, 0.08133704, 0.6098173, 1, 0, 0.7843137, 1,
1.132862, 0.254092, 0.664732, 1, 0, 0.7803922, 1,
1.137297, -0.2358367, 2.19531, 1, 0, 0.772549, 1,
1.14154, 0.1468961, -0.05041077, 1, 0, 0.7686275, 1,
1.143381, -0.06008144, 0.1528161, 1, 0, 0.7607843, 1,
1.144624, -0.1475315, 0.7308347, 1, 0, 0.7568628, 1,
1.151228, -0.1526147, 2.614137, 1, 0, 0.7490196, 1,
1.154516, 0.5206162, -0.4156775, 1, 0, 0.7450981, 1,
1.158074, 1.087371, 0.7159833, 1, 0, 0.7372549, 1,
1.160239, 0.4418984, 0.1615469, 1, 0, 0.7333333, 1,
1.161394, 0.8578333, 2.30964, 1, 0, 0.7254902, 1,
1.164701, -1.31715, 0.9588286, 1, 0, 0.7215686, 1,
1.172539, -1.292583, 1.670144, 1, 0, 0.7137255, 1,
1.19429, -1.667742, 1.503389, 1, 0, 0.7098039, 1,
1.198786, 0.3098074, 1.353548, 1, 0, 0.7019608, 1,
1.199538, 1.008014, 2.003227, 1, 0, 0.6941177, 1,
1.209934, -1.192755, 3.666669, 1, 0, 0.6901961, 1,
1.211063, -1.125715, 3.198906, 1, 0, 0.682353, 1,
1.215327, -0.1928054, 0.6217062, 1, 0, 0.6784314, 1,
1.217925, 0.09516397, 1.843548, 1, 0, 0.6705883, 1,
1.229797, 1.596916, 0.7813325, 1, 0, 0.6666667, 1,
1.231702, -1.400873, 2.860302, 1, 0, 0.6588235, 1,
1.242459, -1.175474, 1.35719, 1, 0, 0.654902, 1,
1.242612, -0.3398735, 3.894588, 1, 0, 0.6470588, 1,
1.244237, 0.7767262, 0.3858544, 1, 0, 0.6431373, 1,
1.264197, -0.1281196, 1.755261, 1, 0, 0.6352941, 1,
1.269469, -0.2785895, 1.758789, 1, 0, 0.6313726, 1,
1.276442, -0.9198818, 1.497794, 1, 0, 0.6235294, 1,
1.286341, -0.04164977, 1.723837, 1, 0, 0.6196079, 1,
1.301028, 0.007441253, 2.197056, 1, 0, 0.6117647, 1,
1.313619, 0.6611218, 1.092789, 1, 0, 0.6078432, 1,
1.318603, 0.2364787, 0.320513, 1, 0, 0.6, 1,
1.318856, -0.9520383, 2.344527, 1, 0, 0.5921569, 1,
1.327647, 0.9777742, 0.7452046, 1, 0, 0.5882353, 1,
1.345956, 1.081081, -0.8804871, 1, 0, 0.5803922, 1,
1.346562, -0.4648891, 1.917813, 1, 0, 0.5764706, 1,
1.351018, 2.400422, -0.1296315, 1, 0, 0.5686275, 1,
1.35317, 1.913439, 2.331742, 1, 0, 0.5647059, 1,
1.354491, -1.860969, 4.433684, 1, 0, 0.5568628, 1,
1.365189, -1.194273, 3.079885, 1, 0, 0.5529412, 1,
1.365757, -0.4164213, 1.680295, 1, 0, 0.5450981, 1,
1.379916, -2.258847, 1.732099, 1, 0, 0.5411765, 1,
1.386313, 1.428884, 1.05888, 1, 0, 0.5333334, 1,
1.39416, -0.9555439, 3.482149, 1, 0, 0.5294118, 1,
1.397695, 0.7450915, 2.396202, 1, 0, 0.5215687, 1,
1.40165, -0.03224277, 2.185598, 1, 0, 0.5176471, 1,
1.425314, 0.6577694, -1.037107, 1, 0, 0.509804, 1,
1.430546, 0.7610337, 0.7893115, 1, 0, 0.5058824, 1,
1.435734, 0.7444417, 0.3027509, 1, 0, 0.4980392, 1,
1.437946, 0.4107208, 1.086428, 1, 0, 0.4901961, 1,
1.450268, 0.4587854, 1.889481, 1, 0, 0.4862745, 1,
1.461011, -1.682673, 3.245302, 1, 0, 0.4784314, 1,
1.479671, 1.805603, 1.391152, 1, 0, 0.4745098, 1,
1.482243, -0.1905814, 1.77524, 1, 0, 0.4666667, 1,
1.483501, 1.361015, 1.490622, 1, 0, 0.4627451, 1,
1.487943, -2.726043, 2.553715, 1, 0, 0.454902, 1,
1.490105, -0.9763331, 2.821746, 1, 0, 0.4509804, 1,
1.491744, 0.9104302, 0.5312253, 1, 0, 0.4431373, 1,
1.506847, -0.030342, 1.207854, 1, 0, 0.4392157, 1,
1.513566, -0.5834904, 1.350387, 1, 0, 0.4313726, 1,
1.522011, 0.323211, 0.4144633, 1, 0, 0.427451, 1,
1.527868, -2.066127, 3.010526, 1, 0, 0.4196078, 1,
1.529866, 0.9541177, 0.8863918, 1, 0, 0.4156863, 1,
1.532035, -1.129139, 0.5368604, 1, 0, 0.4078431, 1,
1.541221, -1.190207, 3.303221, 1, 0, 0.4039216, 1,
1.544624, -0.104593, 2.066455, 1, 0, 0.3960784, 1,
1.558, -0.9456384, 2.745039, 1, 0, 0.3882353, 1,
1.560595, 0.175588, 0.3712023, 1, 0, 0.3843137, 1,
1.562326, 0.05826859, 1.478869, 1, 0, 0.3764706, 1,
1.577133, 0.7037395, -0.6602672, 1, 0, 0.372549, 1,
1.578411, 0.7955996, 1.070655, 1, 0, 0.3647059, 1,
1.58094, 0.2385334, 1.567561, 1, 0, 0.3607843, 1,
1.597163, -1.184298, 2.488203, 1, 0, 0.3529412, 1,
1.597213, -3.198683, 3.148896, 1, 0, 0.3490196, 1,
1.600687, -0.6554613, -0.2700054, 1, 0, 0.3411765, 1,
1.613316, -2.049378, 2.670266, 1, 0, 0.3372549, 1,
1.629843, -0.6892762, 1.85443, 1, 0, 0.3294118, 1,
1.633884, -0.1414294, 2.487824, 1, 0, 0.3254902, 1,
1.636884, 0.8239723, 0.7494638, 1, 0, 0.3176471, 1,
1.638268, -0.2829284, 3.450599, 1, 0, 0.3137255, 1,
1.652463, -1.488063, 1.986368, 1, 0, 0.3058824, 1,
1.667086, 0.3409742, 2.357818, 1, 0, 0.2980392, 1,
1.682542, 0.3346088, 0.1975979, 1, 0, 0.2941177, 1,
1.697496, 0.7959352, 1.722439, 1, 0, 0.2862745, 1,
1.699536, 0.09179885, 0.5147757, 1, 0, 0.282353, 1,
1.718653, 0.5094777, 1.469785, 1, 0, 0.2745098, 1,
1.749377, -1.308534, 1.585321, 1, 0, 0.2705882, 1,
1.754664, 0.06188207, 1.20164, 1, 0, 0.2627451, 1,
1.772631, 0.174142, 2.351868, 1, 0, 0.2588235, 1,
1.774872, 0.5948066, 0.9953414, 1, 0, 0.2509804, 1,
1.801471, 3.875276, 0.6189285, 1, 0, 0.2470588, 1,
1.802256, -0.000140958, 1.252375, 1, 0, 0.2392157, 1,
1.820915, 0.3940682, 1.770913, 1, 0, 0.2352941, 1,
1.832806, 1.117754, 1.023506, 1, 0, 0.227451, 1,
1.839515, -0.3967855, 1.342961, 1, 0, 0.2235294, 1,
1.856417, 0.9564784, 0.7599148, 1, 0, 0.2156863, 1,
1.860398, -0.1134093, 0.3707877, 1, 0, 0.2117647, 1,
1.865133, -0.9538736, 3.138589, 1, 0, 0.2039216, 1,
1.866037, 1.039611, 2.461716, 1, 0, 0.1960784, 1,
1.87528, -0.2168162, 1.207571, 1, 0, 0.1921569, 1,
1.887429, -0.4907193, 1.327368, 1, 0, 0.1843137, 1,
1.891186, 1.398491, -0.3658721, 1, 0, 0.1803922, 1,
1.903278, -0.4915242, 2.536583, 1, 0, 0.172549, 1,
1.913126, -0.463725, 3.72756, 1, 0, 0.1686275, 1,
1.918564, 0.7496957, 0.5457152, 1, 0, 0.1607843, 1,
1.989541, -0.5116726, 2.664026, 1, 0, 0.1568628, 1,
1.999876, -0.3440265, 2.342467, 1, 0, 0.1490196, 1,
2.003777, 0.9117948, -0.4094931, 1, 0, 0.145098, 1,
2.006625, 0.2173647, 1.393668, 1, 0, 0.1372549, 1,
2.009644, -0.5656655, 0.9243629, 1, 0, 0.1333333, 1,
2.023667, 2.104856, -0.8812677, 1, 0, 0.1254902, 1,
2.034171, 0.3785964, 0.919476, 1, 0, 0.1215686, 1,
2.035851, -0.4842212, 1.605685, 1, 0, 0.1137255, 1,
2.039423, 0.2368428, 1.625002, 1, 0, 0.1098039, 1,
2.052014, 0.2776479, 0.7440283, 1, 0, 0.1019608, 1,
2.057074, -1.486339, 1.075252, 1, 0, 0.09411765, 1,
2.088748, 1.009734, 0.5158592, 1, 0, 0.09019608, 1,
2.104276, -1.225448, 2.451862, 1, 0, 0.08235294, 1,
2.11109, 1.075577, 1.103906, 1, 0, 0.07843138, 1,
2.159102, 0.493933, 0.1888856, 1, 0, 0.07058824, 1,
2.210431, -1.165072, 1.749059, 1, 0, 0.06666667, 1,
2.247617, -0.1994659, 4.383723, 1, 0, 0.05882353, 1,
2.289246, -0.6291391, 0.7522353, 1, 0, 0.05490196, 1,
2.350887, 0.8305088, 2.447096, 1, 0, 0.04705882, 1,
2.375431, -0.4528563, 1.522676, 1, 0, 0.04313726, 1,
2.405265, -0.04573666, 1.013315, 1, 0, 0.03529412, 1,
2.40566, 0.1889804, 1.739989, 1, 0, 0.03137255, 1,
2.432958, -0.9951903, 2.769293, 1, 0, 0.02352941, 1,
2.51639, 0.9127422, -1.633015, 1, 0, 0.01960784, 1,
2.550598, -2.730443, 2.326901, 1, 0, 0.01176471, 1,
2.966956, -0.9607493, -0.3619794, 1, 0, 0.007843138, 1
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
0.02166891, -4.397719, -7.326549, 0, -0.5, 0.5, 0.5,
0.02166891, -4.397719, -7.326549, 1, -0.5, 0.5, 0.5,
0.02166891, -4.397719, -7.326549, 1, 1.5, 0.5, 0.5,
0.02166891, -4.397719, -7.326549, 0, 1.5, 0.5, 0.5
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
-3.922071, 0.3382964, -7.326549, 0, -0.5, 0.5, 0.5,
-3.922071, 0.3382964, -7.326549, 1, -0.5, 0.5, 0.5,
-3.922071, 0.3382964, -7.326549, 1, 1.5, 0.5, 0.5,
-3.922071, 0.3382964, -7.326549, 0, 1.5, 0.5, 0.5
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
-3.922071, -4.397719, 0.184428, 0, -0.5, 0.5, 0.5,
-3.922071, -4.397719, 0.184428, 1, -0.5, 0.5, 0.5,
-3.922071, -4.397719, 0.184428, 1, 1.5, 0.5, 0.5,
-3.922071, -4.397719, 0.184428, 0, 1.5, 0.5, 0.5
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
-2, -3.304792, -5.593246,
2, -3.304792, -5.593246,
-2, -3.304792, -5.593246,
-2, -3.486947, -5.882131,
-1, -3.304792, -5.593246,
-1, -3.486947, -5.882131,
0, -3.304792, -5.593246,
0, -3.486947, -5.882131,
1, -3.304792, -5.593246,
1, -3.486947, -5.882131,
2, -3.304792, -5.593246,
2, -3.486947, -5.882131
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
-2, -3.851255, -6.459898, 0, -0.5, 0.5, 0.5,
-2, -3.851255, -6.459898, 1, -0.5, 0.5, 0.5,
-2, -3.851255, -6.459898, 1, 1.5, 0.5, 0.5,
-2, -3.851255, -6.459898, 0, 1.5, 0.5, 0.5,
-1, -3.851255, -6.459898, 0, -0.5, 0.5, 0.5,
-1, -3.851255, -6.459898, 1, -0.5, 0.5, 0.5,
-1, -3.851255, -6.459898, 1, 1.5, 0.5, 0.5,
-1, -3.851255, -6.459898, 0, 1.5, 0.5, 0.5,
0, -3.851255, -6.459898, 0, -0.5, 0.5, 0.5,
0, -3.851255, -6.459898, 1, -0.5, 0.5, 0.5,
0, -3.851255, -6.459898, 1, 1.5, 0.5, 0.5,
0, -3.851255, -6.459898, 0, 1.5, 0.5, 0.5,
1, -3.851255, -6.459898, 0, -0.5, 0.5, 0.5,
1, -3.851255, -6.459898, 1, -0.5, 0.5, 0.5,
1, -3.851255, -6.459898, 1, 1.5, 0.5, 0.5,
1, -3.851255, -6.459898, 0, 1.5, 0.5, 0.5,
2, -3.851255, -6.459898, 0, -0.5, 0.5, 0.5,
2, -3.851255, -6.459898, 1, -0.5, 0.5, 0.5,
2, -3.851255, -6.459898, 1, 1.5, 0.5, 0.5,
2, -3.851255, -6.459898, 0, 1.5, 0.5, 0.5
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
-3.011977, -2, -5.593246,
-3.011977, 2, -5.593246,
-3.011977, -2, -5.593246,
-3.163659, -2, -5.882131,
-3.011977, 0, -5.593246,
-3.163659, 0, -5.882131,
-3.011977, 2, -5.593246,
-3.163659, 2, -5.882131
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
"2"
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
-3.467024, -2, -6.459898, 0, -0.5, 0.5, 0.5,
-3.467024, -2, -6.459898, 1, -0.5, 0.5, 0.5,
-3.467024, -2, -6.459898, 1, 1.5, 0.5, 0.5,
-3.467024, -2, -6.459898, 0, 1.5, 0.5, 0.5,
-3.467024, 0, -6.459898, 0, -0.5, 0.5, 0.5,
-3.467024, 0, -6.459898, 1, -0.5, 0.5, 0.5,
-3.467024, 0, -6.459898, 1, 1.5, 0.5, 0.5,
-3.467024, 0, -6.459898, 0, 1.5, 0.5, 0.5,
-3.467024, 2, -6.459898, 0, -0.5, 0.5, 0.5,
-3.467024, 2, -6.459898, 1, -0.5, 0.5, 0.5,
-3.467024, 2, -6.459898, 1, 1.5, 0.5, 0.5,
-3.467024, 2, -6.459898, 0, 1.5, 0.5, 0.5
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
-3.011977, -3.304792, -4,
-3.011977, -3.304792, 4,
-3.011977, -3.304792, -4,
-3.163659, -3.486947, -4,
-3.011977, -3.304792, -2,
-3.163659, -3.486947, -2,
-3.011977, -3.304792, 0,
-3.163659, -3.486947, 0,
-3.011977, -3.304792, 2,
-3.163659, -3.486947, 2,
-3.011977, -3.304792, 4,
-3.163659, -3.486947, 4
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
-3.467024, -3.851255, -4, 0, -0.5, 0.5, 0.5,
-3.467024, -3.851255, -4, 1, -0.5, 0.5, 0.5,
-3.467024, -3.851255, -4, 1, 1.5, 0.5, 0.5,
-3.467024, -3.851255, -4, 0, 1.5, 0.5, 0.5,
-3.467024, -3.851255, -2, 0, -0.5, 0.5, 0.5,
-3.467024, -3.851255, -2, 1, -0.5, 0.5, 0.5,
-3.467024, -3.851255, -2, 1, 1.5, 0.5, 0.5,
-3.467024, -3.851255, -2, 0, 1.5, 0.5, 0.5,
-3.467024, -3.851255, 0, 0, -0.5, 0.5, 0.5,
-3.467024, -3.851255, 0, 1, -0.5, 0.5, 0.5,
-3.467024, -3.851255, 0, 1, 1.5, 0.5, 0.5,
-3.467024, -3.851255, 0, 0, 1.5, 0.5, 0.5,
-3.467024, -3.851255, 2, 0, -0.5, 0.5, 0.5,
-3.467024, -3.851255, 2, 1, -0.5, 0.5, 0.5,
-3.467024, -3.851255, 2, 1, 1.5, 0.5, 0.5,
-3.467024, -3.851255, 2, 0, 1.5, 0.5, 0.5,
-3.467024, -3.851255, 4, 0, -0.5, 0.5, 0.5,
-3.467024, -3.851255, 4, 1, -0.5, 0.5, 0.5,
-3.467024, -3.851255, 4, 1, 1.5, 0.5, 0.5,
-3.467024, -3.851255, 4, 0, 1.5, 0.5, 0.5
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
-3.011977, -3.304792, -5.593246,
-3.011977, 3.981385, -5.593246,
-3.011977, -3.304792, 5.962102,
-3.011977, 3.981385, 5.962102,
-3.011977, -3.304792, -5.593246,
-3.011977, -3.304792, 5.962102,
-3.011977, 3.981385, -5.593246,
-3.011977, 3.981385, 5.962102,
-3.011977, -3.304792, -5.593246,
3.055315, -3.304792, -5.593246,
-3.011977, -3.304792, 5.962102,
3.055315, -3.304792, 5.962102,
-3.011977, 3.981385, -5.593246,
3.055315, 3.981385, -5.593246,
-3.011977, 3.981385, 5.962102,
3.055315, 3.981385, 5.962102,
3.055315, -3.304792, -5.593246,
3.055315, 3.981385, -5.593246,
3.055315, -3.304792, 5.962102,
3.055315, 3.981385, 5.962102,
3.055315, -3.304792, -5.593246,
3.055315, -3.304792, 5.962102,
3.055315, 3.981385, -5.593246,
3.055315, 3.981385, 5.962102
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
var radius = 7.981653;
var distance = 35.51127;
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
mvMatrix.translate( -0.02166891, -0.3382964, -0.184428 );
mvMatrix.scale( 1.422368, 1.184423, 0.7468333 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.51127);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


