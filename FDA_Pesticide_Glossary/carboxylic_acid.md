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
-3.26391, -2.23573, -0.5216806, 1, 0, 0, 1,
-3.119664, 0.4139973, -0.1360482, 1, 0.007843138, 0, 1,
-3.109337, 0.3753997, -1.685495, 1, 0.01176471, 0, 1,
-2.934506, -0.06852015, -0.9212245, 1, 0.01960784, 0, 1,
-2.725894, -1.233024, 0.05580869, 1, 0.02352941, 0, 1,
-2.708164, -0.1850633, -3.017966, 1, 0.03137255, 0, 1,
-2.627666, -0.4657473, -2.387162, 1, 0.03529412, 0, 1,
-2.602224, -0.1542077, -1.212927, 1, 0.04313726, 0, 1,
-2.589776, 0.4394185, -1.72185, 1, 0.04705882, 0, 1,
-2.573349, 0.6706018, -0.9111564, 1, 0.05490196, 0, 1,
-2.528872, -0.04188383, -2.920803, 1, 0.05882353, 0, 1,
-2.423291, 1.133597, -2.067675, 1, 0.06666667, 0, 1,
-2.403113, 1.313891, -0.8605715, 1, 0.07058824, 0, 1,
-2.380194, 0.3577158, -0.792039, 1, 0.07843138, 0, 1,
-2.376613, 0.4868332, -0.5040826, 1, 0.08235294, 0, 1,
-2.358793, -1.165229, -1.946279, 1, 0.09019608, 0, 1,
-2.285318, 0.1580845, -0.9446231, 1, 0.09411765, 0, 1,
-2.236476, 0.4462759, -2.201196, 1, 0.1019608, 0, 1,
-2.225274, -0.6849161, -1.072549, 1, 0.1098039, 0, 1,
-2.200117, -0.8741993, -3.663755, 1, 0.1137255, 0, 1,
-2.113013, -0.2999732, -1.505441, 1, 0.1215686, 0, 1,
-2.10212, 2.02692, -0.8949988, 1, 0.1254902, 0, 1,
-2.080325, -0.545967, -2.541642, 1, 0.1333333, 0, 1,
-2.076269, 0.6238339, -0.6348961, 1, 0.1372549, 0, 1,
-2.068125, 0.5036457, -2.387766, 1, 0.145098, 0, 1,
-2.013106, 1.8275, -2.122828, 1, 0.1490196, 0, 1,
-2.000709, -0.6519809, -2.317628, 1, 0.1568628, 0, 1,
-1.993271, 0.7995819, -1.131474, 1, 0.1607843, 0, 1,
-1.968669, -0.3479064, -2.494831, 1, 0.1686275, 0, 1,
-1.966357, -0.1673369, -2.987414, 1, 0.172549, 0, 1,
-1.936819, -1.426726, -1.982493, 1, 0.1803922, 0, 1,
-1.912732, 0.7192888, -1.410365, 1, 0.1843137, 0, 1,
-1.907863, 0.1136253, -2.366317, 1, 0.1921569, 0, 1,
-1.906149, 0.4094949, -0.6092536, 1, 0.1960784, 0, 1,
-1.8924, -0.1725691, -1.035885, 1, 0.2039216, 0, 1,
-1.881081, 1.010764, -1.808333, 1, 0.2117647, 0, 1,
-1.825764, -0.2673918, -1.320802, 1, 0.2156863, 0, 1,
-1.816701, 0.4764825, -0.975373, 1, 0.2235294, 0, 1,
-1.784874, 0.1280657, 1.181611, 1, 0.227451, 0, 1,
-1.771643, -1.515699, -3.481808, 1, 0.2352941, 0, 1,
-1.746139, 1.761735, -1.656502, 1, 0.2392157, 0, 1,
-1.745107, 1.200286, -0.7263964, 1, 0.2470588, 0, 1,
-1.743843, -0.009275068, -2.205616, 1, 0.2509804, 0, 1,
-1.74296, 0.8468734, -2.019051, 1, 0.2588235, 0, 1,
-1.733659, 1.381822, 0.3973398, 1, 0.2627451, 0, 1,
-1.690196, 0.7267438, -2.553159, 1, 0.2705882, 0, 1,
-1.687469, -1.244881, -1.511252, 1, 0.2745098, 0, 1,
-1.663597, -0.496923, -2.801145, 1, 0.282353, 0, 1,
-1.644518, -0.3286471, -2.378476, 1, 0.2862745, 0, 1,
-1.596454, -0.4072703, -2.520751, 1, 0.2941177, 0, 1,
-1.594508, -1.265854, -2.989476, 1, 0.3019608, 0, 1,
-1.589719, -0.5499629, -2.15364, 1, 0.3058824, 0, 1,
-1.581794, -0.26911, -1.823797, 1, 0.3137255, 0, 1,
-1.567646, 0.6851494, -1.813157, 1, 0.3176471, 0, 1,
-1.556172, -1.978271, -0.9488689, 1, 0.3254902, 0, 1,
-1.553749, -1.454829, -0.9086264, 1, 0.3294118, 0, 1,
-1.553722, -1.599719, -1.886552, 1, 0.3372549, 0, 1,
-1.552415, -0.4787667, -1.098338, 1, 0.3411765, 0, 1,
-1.551556, -0.9356334, -3.130743, 1, 0.3490196, 0, 1,
-1.548177, -0.144286, 0.7563462, 1, 0.3529412, 0, 1,
-1.541226, -1.583452, -2.535055, 1, 0.3607843, 0, 1,
-1.538669, 0.3656721, -1.442775, 1, 0.3647059, 0, 1,
-1.536125, 0.5475548, 0.007991461, 1, 0.372549, 0, 1,
-1.527752, -0.05132889, -1.227455, 1, 0.3764706, 0, 1,
-1.525024, -0.8455354, -1.579746, 1, 0.3843137, 0, 1,
-1.515057, -0.1204299, -1.811024, 1, 0.3882353, 0, 1,
-1.50546, 1.216209, -1.142726, 1, 0.3960784, 0, 1,
-1.504834, -1.281914, -0.8340337, 1, 0.4039216, 0, 1,
-1.494906, -0.292375, 0.2847956, 1, 0.4078431, 0, 1,
-1.478134, -2.443738, -1.127313, 1, 0.4156863, 0, 1,
-1.467907, 1.527678, -1.277766, 1, 0.4196078, 0, 1,
-1.448545, 1.121487, -0.6478568, 1, 0.427451, 0, 1,
-1.438671, 0.6319116, -0.5275249, 1, 0.4313726, 0, 1,
-1.434375, 0.6019356, -0.7495456, 1, 0.4392157, 0, 1,
-1.40282, -1.091348, -2.871247, 1, 0.4431373, 0, 1,
-1.390674, -0.7441936, -3.583123, 1, 0.4509804, 0, 1,
-1.390626, -0.3857473, -1.406724, 1, 0.454902, 0, 1,
-1.378842, -0.7086327, -2.61693, 1, 0.4627451, 0, 1,
-1.376666, 0.4951736, -1.488255, 1, 0.4666667, 0, 1,
-1.367262, 1.214339, -0.7448883, 1, 0.4745098, 0, 1,
-1.360568, 1.701624, -0.8639999, 1, 0.4784314, 0, 1,
-1.353529, 0.07192382, -0.4022599, 1, 0.4862745, 0, 1,
-1.343667, 0.7725278, -1.137592, 1, 0.4901961, 0, 1,
-1.342883, 0.6225875, -2.636277, 1, 0.4980392, 0, 1,
-1.336484, 0.9731678, -1.431425, 1, 0.5058824, 0, 1,
-1.332474, -0.3512651, -1.006024, 1, 0.509804, 0, 1,
-1.327723, -1.07365, -3.754127, 1, 0.5176471, 0, 1,
-1.324616, -0.4896111, -2.066753, 1, 0.5215687, 0, 1,
-1.323788, -0.7820308, -2.518075, 1, 0.5294118, 0, 1,
-1.321451, 1.422486, -2.179461, 1, 0.5333334, 0, 1,
-1.31287, -0.2285475, -3.69422, 1, 0.5411765, 0, 1,
-1.300997, 0.3347438, 0.1454966, 1, 0.5450981, 0, 1,
-1.280644, -1.870658, -4.120521, 1, 0.5529412, 0, 1,
-1.279435, 0.3243932, -2.089992, 1, 0.5568628, 0, 1,
-1.276651, -0.6826867, -2.894937, 1, 0.5647059, 0, 1,
-1.270474, -0.11695, -1.60256, 1, 0.5686275, 0, 1,
-1.258811, 0.9261976, -3.435183, 1, 0.5764706, 0, 1,
-1.243902, 0.9171126, 0.9389783, 1, 0.5803922, 0, 1,
-1.235073, 0.6472196, -2.417715, 1, 0.5882353, 0, 1,
-1.234634, -0.2058422, -1.676745, 1, 0.5921569, 0, 1,
-1.227875, 1.28097, -1.328438, 1, 0.6, 0, 1,
-1.221889, -1.664657, -2.013141, 1, 0.6078432, 0, 1,
-1.220755, 0.8305976, -1.495073, 1, 0.6117647, 0, 1,
-1.217949, 1.04723, -0.8509753, 1, 0.6196079, 0, 1,
-1.206252, 0.3062066, -1.202662, 1, 0.6235294, 0, 1,
-1.193983, 1.078562, -0.5997822, 1, 0.6313726, 0, 1,
-1.193938, -0.07199301, -2.816328, 1, 0.6352941, 0, 1,
-1.192878, 0.2618466, -3.885702, 1, 0.6431373, 0, 1,
-1.189361, -1.027042, -3.221681, 1, 0.6470588, 0, 1,
-1.187144, 0.07009932, -0.9307534, 1, 0.654902, 0, 1,
-1.176226, -0.2447178, -1.583918, 1, 0.6588235, 0, 1,
-1.168928, -0.6513654, -2.79117, 1, 0.6666667, 0, 1,
-1.159195, -0.9995073, -1.080782, 1, 0.6705883, 0, 1,
-1.152342, -1.605345, -1.965746, 1, 0.6784314, 0, 1,
-1.152192, 0.7028347, -1.798628, 1, 0.682353, 0, 1,
-1.144109, 0.6277086, -2.745304, 1, 0.6901961, 0, 1,
-1.138509, 1.421045, -1.288632, 1, 0.6941177, 0, 1,
-1.13543, -0.3377198, -1.366132, 1, 0.7019608, 0, 1,
-1.134559, -0.3074272, -1.448884, 1, 0.7098039, 0, 1,
-1.134329, 1.232048, -1.797959, 1, 0.7137255, 0, 1,
-1.129088, 1.51395, -0.7703602, 1, 0.7215686, 0, 1,
-1.12333, 0.4170323, -1.83771, 1, 0.7254902, 0, 1,
-1.123276, 1.520383, 0.5400707, 1, 0.7333333, 0, 1,
-1.1231, 1.48944, -0.1944642, 1, 0.7372549, 0, 1,
-1.121183, 0.1531333, -1.240727, 1, 0.7450981, 0, 1,
-1.11674, 1.824186, 0.1632621, 1, 0.7490196, 0, 1,
-1.109205, 0.8022838, -0.9912429, 1, 0.7568628, 0, 1,
-1.103697, 0.1164026, -1.793597, 1, 0.7607843, 0, 1,
-1.099579, -0.9968693, -1.858636, 1, 0.7686275, 0, 1,
-1.089312, -1.227046, -1.451461, 1, 0.772549, 0, 1,
-1.087819, 0.32418, -1.867692, 1, 0.7803922, 0, 1,
-1.084191, -1.005427, -2.036372, 1, 0.7843137, 0, 1,
-1.081016, 1.446406, -0.693895, 1, 0.7921569, 0, 1,
-1.078286, 1.816316, -0.3379571, 1, 0.7960784, 0, 1,
-1.063978, -0.6483822, 0.02490493, 1, 0.8039216, 0, 1,
-1.052663, 1.91315, -1.401506, 1, 0.8117647, 0, 1,
-1.047668, -0.9940731, -2.858973, 1, 0.8156863, 0, 1,
-1.044231, -0.6294722, -1.65459, 1, 0.8235294, 0, 1,
-1.044075, 0.1611857, -2.434343, 1, 0.827451, 0, 1,
-1.041504, 1.08333, -2.283079, 1, 0.8352941, 0, 1,
-1.040151, -0.2320654, -1.205516, 1, 0.8392157, 0, 1,
-1.034106, -0.5745129, -1.119009, 1, 0.8470588, 0, 1,
-1.032739, -1.781924, -3.002395, 1, 0.8509804, 0, 1,
-1.031786, 0.7737164, -0.2236859, 1, 0.8588235, 0, 1,
-1.027634, -0.1838426, -0.7839578, 1, 0.8627451, 0, 1,
-1.02065, 1.265072, 0.6511878, 1, 0.8705882, 0, 1,
-1.020637, -0.3725424, -2.985284, 1, 0.8745098, 0, 1,
-1.017321, -1.264822, -3.602392, 1, 0.8823529, 0, 1,
-1.016792, -0.151875, -0.7161768, 1, 0.8862745, 0, 1,
-1.016349, -0.04514663, -3.576004, 1, 0.8941177, 0, 1,
-1.012596, -0.8979268, -2.217484, 1, 0.8980392, 0, 1,
-1.005937, 1.742672, 0.6820489, 1, 0.9058824, 0, 1,
-1.003379, -0.1052487, -2.177262, 1, 0.9137255, 0, 1,
-1.001816, 0.7472199, -0.2943788, 1, 0.9176471, 0, 1,
-1.001306, -2.337696, -4.201864, 1, 0.9254902, 0, 1,
-1.001207, 1.651143, -2.392144, 1, 0.9294118, 0, 1,
-0.9927067, -1.023639, -2.572336, 1, 0.9372549, 0, 1,
-0.9926776, -0.04342552, -1.797228, 1, 0.9411765, 0, 1,
-0.9919943, -0.08496557, -3.346192, 1, 0.9490196, 0, 1,
-0.9879884, -1.52967, -3.759144, 1, 0.9529412, 0, 1,
-0.9788408, -1.047339, -1.626994, 1, 0.9607843, 0, 1,
-0.9686908, -0.2035857, -1.998428, 1, 0.9647059, 0, 1,
-0.9564688, 0.09728985, 0.1710437, 1, 0.972549, 0, 1,
-0.9552762, 1.140816, -1.742215, 1, 0.9764706, 0, 1,
-0.9414859, 0.6915277, 0.6419515, 1, 0.9843137, 0, 1,
-0.9391351, -0.4725954, -0.343062, 1, 0.9882353, 0, 1,
-0.9376742, 0.791415, -0.7923657, 1, 0.9960784, 0, 1,
-0.9346678, -0.7026348, -1.222684, 0.9960784, 1, 0, 1,
-0.9343181, 0.2159877, -2.872959, 0.9921569, 1, 0, 1,
-0.9285104, 0.9084384, 0.6088502, 0.9843137, 1, 0, 1,
-0.9264842, -0.2037863, -2.117409, 0.9803922, 1, 0, 1,
-0.9260299, -0.7710724, -1.775815, 0.972549, 1, 0, 1,
-0.9230034, 0.3537574, -2.917884, 0.9686275, 1, 0, 1,
-0.9171079, -1.214537, -1.806636, 0.9607843, 1, 0, 1,
-0.9113308, 0.05477367, -2.32463, 0.9568627, 1, 0, 1,
-0.909966, 0.8131757, -0.2395104, 0.9490196, 1, 0, 1,
-0.90491, 1.329895, -1.725257, 0.945098, 1, 0, 1,
-0.8981316, 0.5819746, -2.784167, 0.9372549, 1, 0, 1,
-0.8979004, -0.6505957, -1.995781, 0.9333333, 1, 0, 1,
-0.894834, 1.725557, -0.5207641, 0.9254902, 1, 0, 1,
-0.8945189, 0.4858242, -0.727479, 0.9215686, 1, 0, 1,
-0.894325, 1.44807, 0.6316203, 0.9137255, 1, 0, 1,
-0.8939509, 1.368082, 0.09523803, 0.9098039, 1, 0, 1,
-0.8918988, 0.182823, -2.901651, 0.9019608, 1, 0, 1,
-0.8885917, -3.00468, -5.318502, 0.8941177, 1, 0, 1,
-0.888384, 1.514951, 0.3903856, 0.8901961, 1, 0, 1,
-0.882404, 0.5431279, -0.8541082, 0.8823529, 1, 0, 1,
-0.8788387, 0.0500388, -0.8919608, 0.8784314, 1, 0, 1,
-0.8668766, -0.825496, -0.1366994, 0.8705882, 1, 0, 1,
-0.8528461, -1.387011, -4.177945, 0.8666667, 1, 0, 1,
-0.8498572, 0.3392007, -0.3280071, 0.8588235, 1, 0, 1,
-0.8480747, 1.185417, 0.2918102, 0.854902, 1, 0, 1,
-0.8441429, 0.09517832, -0.9749752, 0.8470588, 1, 0, 1,
-0.8410969, -0.5735781, -2.132513, 0.8431373, 1, 0, 1,
-0.8407888, -0.189402, -0.2338627, 0.8352941, 1, 0, 1,
-0.8395654, 0.181683, -2.534933, 0.8313726, 1, 0, 1,
-0.8339404, -1.650008, -0.8240418, 0.8235294, 1, 0, 1,
-0.8312492, -1.068555, -2.011673, 0.8196079, 1, 0, 1,
-0.8297042, -1.786944, -2.534663, 0.8117647, 1, 0, 1,
-0.8288947, 0.6860567, -1.09611, 0.8078431, 1, 0, 1,
-0.8228728, 0.2221968, -1.699409, 0.8, 1, 0, 1,
-0.8166071, 0.5680042, -0.816188, 0.7921569, 1, 0, 1,
-0.8131171, 0.3751736, -0.3234896, 0.7882353, 1, 0, 1,
-0.8130578, -1.279599, -3.315104, 0.7803922, 1, 0, 1,
-0.8130293, -0.2449884, -2.931982, 0.7764706, 1, 0, 1,
-0.8124961, 0.880586, 0.9392135, 0.7686275, 1, 0, 1,
-0.8036529, 1.424021, -0.2966115, 0.7647059, 1, 0, 1,
-0.8033014, 1.061225, -1.520698, 0.7568628, 1, 0, 1,
-0.7996916, -0.8615777, -2.473879, 0.7529412, 1, 0, 1,
-0.7959407, -0.1615585, -2.16731, 0.7450981, 1, 0, 1,
-0.7899194, 0.2168613, -1.790644, 0.7411765, 1, 0, 1,
-0.779637, 2.482724, 0.09845924, 0.7333333, 1, 0, 1,
-0.7791973, -0.6337111, -1.575894, 0.7294118, 1, 0, 1,
-0.7785286, 0.5593675, 0.1161646, 0.7215686, 1, 0, 1,
-0.7777174, -0.668636, -4.003477, 0.7176471, 1, 0, 1,
-0.7696197, -0.6490988, -2.784144, 0.7098039, 1, 0, 1,
-0.7647742, 0.3967214, -0.2879485, 0.7058824, 1, 0, 1,
-0.7647128, 0.1786397, -0.321288, 0.6980392, 1, 0, 1,
-0.7637828, 0.07405571, -0.7727717, 0.6901961, 1, 0, 1,
-0.7560798, 2.085677, 1.528581, 0.6862745, 1, 0, 1,
-0.7549664, 0.5711231, -0.9262455, 0.6784314, 1, 0, 1,
-0.7493794, 1.147539, -0.5088538, 0.6745098, 1, 0, 1,
-0.7412247, -0.5562606, -1.111945, 0.6666667, 1, 0, 1,
-0.7385399, 0.8292738, -0.6750214, 0.6627451, 1, 0, 1,
-0.7382827, -0.9514103, -1.502659, 0.654902, 1, 0, 1,
-0.7363733, -0.3351454, -0.9324182, 0.6509804, 1, 0, 1,
-0.7349931, 0.6699708, -0.48885, 0.6431373, 1, 0, 1,
-0.7340197, 1.797899, 0.5685698, 0.6392157, 1, 0, 1,
-0.7279034, 0.4375991, -0.0157849, 0.6313726, 1, 0, 1,
-0.7277125, 0.9682817, -1.8982, 0.627451, 1, 0, 1,
-0.7239804, -0.4011026, -1.992136, 0.6196079, 1, 0, 1,
-0.7182541, 0.3715851, -0.7043825, 0.6156863, 1, 0, 1,
-0.7152228, -1.099205, -1.641461, 0.6078432, 1, 0, 1,
-0.7148011, -0.3861365, -1.504306, 0.6039216, 1, 0, 1,
-0.7113337, 0.1497737, -3.348806, 0.5960785, 1, 0, 1,
-0.71026, -0.00386988, -0.9100043, 0.5882353, 1, 0, 1,
-0.7088934, 0.2899582, -0.004959479, 0.5843138, 1, 0, 1,
-0.7047089, 0.4581946, -2.9739, 0.5764706, 1, 0, 1,
-0.7029791, -0.4615969, -3.141346, 0.572549, 1, 0, 1,
-0.6967536, -0.3591935, -2.012227, 0.5647059, 1, 0, 1,
-0.694232, 0.5165875, -1.541664, 0.5607843, 1, 0, 1,
-0.6922033, 1.088062, -0.8662369, 0.5529412, 1, 0, 1,
-0.6918609, 0.5892998, -0.228539, 0.5490196, 1, 0, 1,
-0.6899291, -0.7995467, -3.770507, 0.5411765, 1, 0, 1,
-0.6876259, 0.5718427, -0.7765902, 0.5372549, 1, 0, 1,
-0.6834499, -0.6024992, -3.373359, 0.5294118, 1, 0, 1,
-0.6826988, -0.2889063, -1.984655, 0.5254902, 1, 0, 1,
-0.6826061, 0.5002876, -1.940918, 0.5176471, 1, 0, 1,
-0.6818872, 1.049309, 0.7092599, 0.5137255, 1, 0, 1,
-0.6807883, -2.001364, -2.248207, 0.5058824, 1, 0, 1,
-0.6730233, 0.5780258, -2.316021, 0.5019608, 1, 0, 1,
-0.6721246, -0.2071532, -2.026234, 0.4941176, 1, 0, 1,
-0.6700274, 0.3460253, -1.87366, 0.4862745, 1, 0, 1,
-0.6640651, 0.8508697, -1.150639, 0.4823529, 1, 0, 1,
-0.6618524, -0.576726, -3.195393, 0.4745098, 1, 0, 1,
-0.6599424, 0.5594882, -1.684046, 0.4705882, 1, 0, 1,
-0.6557994, -0.2465671, -1.395377, 0.4627451, 1, 0, 1,
-0.6557198, -0.1413409, -0.8026268, 0.4588235, 1, 0, 1,
-0.6422104, -1.245271, -2.391311, 0.4509804, 1, 0, 1,
-0.635802, 1.416185, -1.049809, 0.4470588, 1, 0, 1,
-0.6339591, -1.670867, -2.53046, 0.4392157, 1, 0, 1,
-0.6267993, 0.2453086, -2.872939, 0.4352941, 1, 0, 1,
-0.6265023, -0.6767255, -1.290191, 0.427451, 1, 0, 1,
-0.6257238, -0.3508479, -2.461496, 0.4235294, 1, 0, 1,
-0.6145991, -0.4946729, -1.012386, 0.4156863, 1, 0, 1,
-0.6122966, -0.3880339, -2.009714, 0.4117647, 1, 0, 1,
-0.6070662, -0.6513473, -2.463536, 0.4039216, 1, 0, 1,
-0.6054758, 0.8500195, -2.037027, 0.3960784, 1, 0, 1,
-0.6034392, 1.117651, -0.1392973, 0.3921569, 1, 0, 1,
-0.6004512, 0.4055494, -1.135081, 0.3843137, 1, 0, 1,
-0.600137, 0.3587385, -0.02542641, 0.3803922, 1, 0, 1,
-0.5970484, -0.8606979, -3.054484, 0.372549, 1, 0, 1,
-0.5963341, -0.06344758, -1.085588, 0.3686275, 1, 0, 1,
-0.5957707, 0.3550852, -2.21724, 0.3607843, 1, 0, 1,
-0.5929979, -0.5857492, -2.794601, 0.3568628, 1, 0, 1,
-0.591598, -1.216921, -5.204323, 0.3490196, 1, 0, 1,
-0.5910035, 0.2408839, -0.3947204, 0.345098, 1, 0, 1,
-0.5880518, 1.008484, -0.4557371, 0.3372549, 1, 0, 1,
-0.5876449, 0.2930533, -2.487078, 0.3333333, 1, 0, 1,
-0.5795677, 0.4640821, -2.606909, 0.3254902, 1, 0, 1,
-0.5761721, 0.1466925, -1.972293, 0.3215686, 1, 0, 1,
-0.5730361, -0.2952033, -1.981826, 0.3137255, 1, 0, 1,
-0.5696341, 0.2062577, -1.112597, 0.3098039, 1, 0, 1,
-0.5692784, -0.4233956, -4.158845, 0.3019608, 1, 0, 1,
-0.5617799, 0.4486289, -0.351045, 0.2941177, 1, 0, 1,
-0.56162, 0.2547733, -0.8979068, 0.2901961, 1, 0, 1,
-0.5615781, 0.235063, -1.352175, 0.282353, 1, 0, 1,
-0.5603051, -1.314344, -1.354281, 0.2784314, 1, 0, 1,
-0.5462233, 0.7479438, -1.913566, 0.2705882, 1, 0, 1,
-0.5457034, -0.4480108, -3.88734, 0.2666667, 1, 0, 1,
-0.5446694, 1.224624, 2.961353, 0.2588235, 1, 0, 1,
-0.5446459, 1.132001, -0.329258, 0.254902, 1, 0, 1,
-0.5446095, 0.08871476, -2.222729, 0.2470588, 1, 0, 1,
-0.5409091, 1.317711, -0.7458101, 0.2431373, 1, 0, 1,
-0.5345638, -1.059379, -0.4977256, 0.2352941, 1, 0, 1,
-0.5339986, 0.2750352, -1.197115, 0.2313726, 1, 0, 1,
-0.5309657, -0.882356, -2.57543, 0.2235294, 1, 0, 1,
-0.5305169, -1.478429, -2.552406, 0.2196078, 1, 0, 1,
-0.5302713, -1.974029, -2.067525, 0.2117647, 1, 0, 1,
-0.529523, -0.9695133, -0.8552926, 0.2078431, 1, 0, 1,
-0.5292222, 0.05959959, 0.4046285, 0.2, 1, 0, 1,
-0.520299, 0.4628444, 0.2224109, 0.1921569, 1, 0, 1,
-0.5176923, 0.7736943, -0.7543133, 0.1882353, 1, 0, 1,
-0.5157055, 0.1291245, 0.6032154, 0.1803922, 1, 0, 1,
-0.5143592, 0.8612211, -0.1353802, 0.1764706, 1, 0, 1,
-0.5114493, 0.5534419, 0.4126892, 0.1686275, 1, 0, 1,
-0.5064981, 2.533097, -0.2685653, 0.1647059, 1, 0, 1,
-0.5006697, -0.5320815, -1.52427, 0.1568628, 1, 0, 1,
-0.497197, -0.217887, -3.952461, 0.1529412, 1, 0, 1,
-0.4898687, 1.172464, 0.4236078, 0.145098, 1, 0, 1,
-0.4868298, -0.3057478, -2.972376, 0.1411765, 1, 0, 1,
-0.4834894, -0.9881197, -0.7995418, 0.1333333, 1, 0, 1,
-0.4794774, -0.2973013, -2.300109, 0.1294118, 1, 0, 1,
-0.4726299, -1.786489, -3.084077, 0.1215686, 1, 0, 1,
-0.466989, 0.827376, 0.6758145, 0.1176471, 1, 0, 1,
-0.4653598, 0.6944039, 0.1993433, 0.1098039, 1, 0, 1,
-0.4519421, -1.062045, -2.306201, 0.1058824, 1, 0, 1,
-0.4477268, 0.4146394, 1.608577, 0.09803922, 1, 0, 1,
-0.4468006, -1.64541, -3.011681, 0.09019608, 1, 0, 1,
-0.4446112, -0.1794913, -0.9583314, 0.08627451, 1, 0, 1,
-0.4439454, 1.665916, -0.4437003, 0.07843138, 1, 0, 1,
-0.4390713, -0.1735295, -0.753485, 0.07450981, 1, 0, 1,
-0.43437, -2.116294, -1.785182, 0.06666667, 1, 0, 1,
-0.4335988, -0.5429126, -1.307472, 0.0627451, 1, 0, 1,
-0.4320582, -0.7644815, -1.852155, 0.05490196, 1, 0, 1,
-0.428316, -0.5381942, -3.543519, 0.05098039, 1, 0, 1,
-0.4282123, 0.4865778, -1.775528, 0.04313726, 1, 0, 1,
-0.4259838, -0.8939061, -3.246014, 0.03921569, 1, 0, 1,
-0.4235471, -1.254746, -5.356689, 0.03137255, 1, 0, 1,
-0.4211026, 1.014105, -0.5962291, 0.02745098, 1, 0, 1,
-0.4181046, -0.2868192, -1.263707, 0.01960784, 1, 0, 1,
-0.4120751, 0.6074304, 0.2870203, 0.01568628, 1, 0, 1,
-0.4116666, 0.8379501, -1.251612, 0.007843138, 1, 0, 1,
-0.4110982, 1.91686, -0.3715808, 0.003921569, 1, 0, 1,
-0.410258, 0.3525068, -1.301133, 0, 1, 0.003921569, 1,
-0.4094837, 0.3678501, -0.1771263, 0, 1, 0.01176471, 1,
-0.4079442, -0.862002, -2.069327, 0, 1, 0.01568628, 1,
-0.4075451, -1.725691, -4.009117, 0, 1, 0.02352941, 1,
-0.4009794, 0.6674786, -1.297718, 0, 1, 0.02745098, 1,
-0.3993773, 0.6790679, -0.909286, 0, 1, 0.03529412, 1,
-0.3969472, 0.1059019, -1.258406, 0, 1, 0.03921569, 1,
-0.3968416, 0.9601322, -1.165337, 0, 1, 0.04705882, 1,
-0.39643, 0.5682979, -1.136875, 0, 1, 0.05098039, 1,
-0.3956029, 1.761088, 1.608012, 0, 1, 0.05882353, 1,
-0.3927092, 0.3548785, -0.1556548, 0, 1, 0.0627451, 1,
-0.3925974, -1.58086, -3.845835, 0, 1, 0.07058824, 1,
-0.392549, -1.073046, -3.654766, 0, 1, 0.07450981, 1,
-0.3916164, -0.4420974, -3.185463, 0, 1, 0.08235294, 1,
-0.3901221, -0.3724881, -2.481604, 0, 1, 0.08627451, 1,
-0.3891668, 0.4921605, -1.728218, 0, 1, 0.09411765, 1,
-0.3876082, 2.145096, 1.304715, 0, 1, 0.1019608, 1,
-0.3855729, -0.1590172, -1.810817, 0, 1, 0.1058824, 1,
-0.3805507, -0.07325296, -2.202687, 0, 1, 0.1137255, 1,
-0.3764342, 0.2353772, -0.7285487, 0, 1, 0.1176471, 1,
-0.3762168, 0.670871, 0.3627646, 0, 1, 0.1254902, 1,
-0.3686155, 0.5077825, 0.9546787, 0, 1, 0.1294118, 1,
-0.3678509, 0.4156372, 1.311714, 0, 1, 0.1372549, 1,
-0.3642325, -0.4488906, -1.788579, 0, 1, 0.1411765, 1,
-0.3577566, -1.421711, -3.004579, 0, 1, 0.1490196, 1,
-0.3572141, -1.837536, -1.993338, 0, 1, 0.1529412, 1,
-0.3538405, -1.370265, -4.271283, 0, 1, 0.1607843, 1,
-0.3529115, -1.248463, -3.78802, 0, 1, 0.1647059, 1,
-0.3495741, 1.226178, 0.05303074, 0, 1, 0.172549, 1,
-0.348239, -0.1401765, -1.830058, 0, 1, 0.1764706, 1,
-0.3423662, -0.8176264, -2.151258, 0, 1, 0.1843137, 1,
-0.3423451, -0.2139016, -2.612475, 0, 1, 0.1882353, 1,
-0.3422153, 1.215107, -0.4641517, 0, 1, 0.1960784, 1,
-0.3276624, 1.327184, -0.09624995, 0, 1, 0.2039216, 1,
-0.3210733, -1.260632, -1.993621, 0, 1, 0.2078431, 1,
-0.3189384, -0.025527, -1.828062, 0, 1, 0.2156863, 1,
-0.3186175, -0.1714883, -3.688052, 0, 1, 0.2196078, 1,
-0.3182267, 1.141619, -2.020532, 0, 1, 0.227451, 1,
-0.314684, 1.044283, -0.9769615, 0, 1, 0.2313726, 1,
-0.3136171, -0.3703651, -3.33209, 0, 1, 0.2392157, 1,
-0.3115924, 0.4782184, 0.354536, 0, 1, 0.2431373, 1,
-0.2995111, -1.386512, -2.673026, 0, 1, 0.2509804, 1,
-0.2948202, -1.085299, -2.605685, 0, 1, 0.254902, 1,
-0.2903116, 0.4746616, -2.66517, 0, 1, 0.2627451, 1,
-0.2843395, -0.1967665, -2.006104, 0, 1, 0.2666667, 1,
-0.283258, -0.5664073, -2.31419, 0, 1, 0.2745098, 1,
-0.2787803, 0.7546099, 0.1628813, 0, 1, 0.2784314, 1,
-0.2725148, -1.134582, -2.775331, 0, 1, 0.2862745, 1,
-0.2723171, -1.214756, -1.852849, 0, 1, 0.2901961, 1,
-0.271112, 0.8622055, 0.9436841, 0, 1, 0.2980392, 1,
-0.2648933, -1.410617, -4.40843, 0, 1, 0.3058824, 1,
-0.2633585, -0.7959076, -2.706982, 0, 1, 0.3098039, 1,
-0.2623479, -0.4401828, -2.657124, 0, 1, 0.3176471, 1,
-0.2615473, 1.337746, 0.8290125, 0, 1, 0.3215686, 1,
-0.2598882, 0.5346637, -0.4821328, 0, 1, 0.3294118, 1,
-0.2594828, -1.860665, -4.596386, 0, 1, 0.3333333, 1,
-0.2562282, 1.629998, 1.357697, 0, 1, 0.3411765, 1,
-0.2560916, -2.44242, -2.949969, 0, 1, 0.345098, 1,
-0.2512577, 0.7332968, -1.248869, 0, 1, 0.3529412, 1,
-0.2512279, 0.5819962, -1.828439, 0, 1, 0.3568628, 1,
-0.2510417, 1.348684, -1.304215, 0, 1, 0.3647059, 1,
-0.2474942, 1.242095, -1.007478, 0, 1, 0.3686275, 1,
-0.2456289, 1.032965, -0.2510665, 0, 1, 0.3764706, 1,
-0.2453131, -2.208528, -1.82839, 0, 1, 0.3803922, 1,
-0.2419079, 0.5754221, -2.249967, 0, 1, 0.3882353, 1,
-0.2414504, -1.174458, -1.701836, 0, 1, 0.3921569, 1,
-0.2386516, -0.7396017, -2.967506, 0, 1, 0.4, 1,
-0.2384553, -0.512997, -2.575953, 0, 1, 0.4078431, 1,
-0.2365823, -0.6944014, -3.246562, 0, 1, 0.4117647, 1,
-0.2355602, -2.439568, -4.497107, 0, 1, 0.4196078, 1,
-0.232126, 0.3933196, 0.07491402, 0, 1, 0.4235294, 1,
-0.2267036, -0.9900948, -1.103957, 0, 1, 0.4313726, 1,
-0.2250339, 0.7024002, -0.5281268, 0, 1, 0.4352941, 1,
-0.2218336, -0.06256261, -1.372833, 0, 1, 0.4431373, 1,
-0.2198318, 0.1947812, -0.957477, 0, 1, 0.4470588, 1,
-0.21806, 0.946731, 0.7224343, 0, 1, 0.454902, 1,
-0.2161926, 0.4575401, 1.098284, 0, 1, 0.4588235, 1,
-0.2161565, -0.0497546, -2.031366, 0, 1, 0.4666667, 1,
-0.2158331, 0.1890621, -0.1535283, 0, 1, 0.4705882, 1,
-0.2104268, 1.289276, -0.9981965, 0, 1, 0.4784314, 1,
-0.2058587, 0.5332325, 0.9081221, 0, 1, 0.4823529, 1,
-0.2045292, 1.073087, -1.102746, 0, 1, 0.4901961, 1,
-0.1942102, 0.8145057, -0.6469876, 0, 1, 0.4941176, 1,
-0.1942101, -1.553681, -2.103703, 0, 1, 0.5019608, 1,
-0.1921114, -0.04215715, -3.245806, 0, 1, 0.509804, 1,
-0.1913793, -0.01101238, -1.438478, 0, 1, 0.5137255, 1,
-0.1881073, 0.7721351, -2.16535, 0, 1, 0.5215687, 1,
-0.1829418, -0.2805762, -5.061179, 0, 1, 0.5254902, 1,
-0.1804354, -1.792332, -3.461744, 0, 1, 0.5333334, 1,
-0.1783811, 0.6333037, -0.9181404, 0, 1, 0.5372549, 1,
-0.1755514, -0.4082897, -1.71536, 0, 1, 0.5450981, 1,
-0.1745095, 0.4822682, -0.8817353, 0, 1, 0.5490196, 1,
-0.1701337, -0.4289484, -0.5537773, 0, 1, 0.5568628, 1,
-0.1600234, 1.5207, 2.393048, 0, 1, 0.5607843, 1,
-0.159515, -0.4533798, -2.209575, 0, 1, 0.5686275, 1,
-0.1580618, 1.179059, -0.06159162, 0, 1, 0.572549, 1,
-0.1574386, 2.014146, -0.700736, 0, 1, 0.5803922, 1,
-0.1547714, 0.3248102, -1.695412, 0, 1, 0.5843138, 1,
-0.1497683, 1.08788, 0.4602419, 0, 1, 0.5921569, 1,
-0.1477414, -0.4875318, -1.250348, 0, 1, 0.5960785, 1,
-0.1475403, 1.031215, -1.284883, 0, 1, 0.6039216, 1,
-0.1461982, -1.062684, -2.552706, 0, 1, 0.6117647, 1,
-0.1435936, -0.04940737, -2.48022, 0, 1, 0.6156863, 1,
-0.1404522, -0.540005, -2.949891, 0, 1, 0.6235294, 1,
-0.1374316, -0.3759433, -2.601239, 0, 1, 0.627451, 1,
-0.130045, 0.2063497, -0.7254248, 0, 1, 0.6352941, 1,
-0.1293181, 0.3415389, 0.2266808, 0, 1, 0.6392157, 1,
-0.1251662, 0.8016324, 0.1870074, 0, 1, 0.6470588, 1,
-0.1208618, 0.389127, -2.673919, 0, 1, 0.6509804, 1,
-0.1152762, -0.9501791, -3.166309, 0, 1, 0.6588235, 1,
-0.1140469, 0.5400079, -0.03414677, 0, 1, 0.6627451, 1,
-0.1057853, -0.2689034, -3.267807, 0, 1, 0.6705883, 1,
-0.1054368, -0.1840345, -2.186532, 0, 1, 0.6745098, 1,
-0.1052735, 0.9316205, -1.786393, 0, 1, 0.682353, 1,
-0.09933235, 0.7365925, 1.061318, 0, 1, 0.6862745, 1,
-0.09528743, -1.224775, -3.117566, 0, 1, 0.6941177, 1,
-0.09203277, 1.633872, 0.1011072, 0, 1, 0.7019608, 1,
-0.08308104, -0.9002857, -2.963677, 0, 1, 0.7058824, 1,
-0.07823908, 0.5083459, 0.6465275, 0, 1, 0.7137255, 1,
-0.07433301, 0.1204258, -2.793089, 0, 1, 0.7176471, 1,
-0.073452, 0.5328169, 0.4721833, 0, 1, 0.7254902, 1,
-0.07095546, 0.8408576, -1.005945, 0, 1, 0.7294118, 1,
-0.06965786, -0.5185175, -5.391718, 0, 1, 0.7372549, 1,
-0.06772562, 0.02715034, -0.4937645, 0, 1, 0.7411765, 1,
-0.06702871, -0.9949876, -2.780271, 0, 1, 0.7490196, 1,
-0.06630195, -0.08993952, -2.185729, 0, 1, 0.7529412, 1,
-0.05489318, 0.7678416, 1.233193, 0, 1, 0.7607843, 1,
-0.05216377, -0.5272855, -3.083395, 0, 1, 0.7647059, 1,
-0.05097887, -0.9178736, -2.762222, 0, 1, 0.772549, 1,
-0.0494414, -0.6177996, -5.586105, 0, 1, 0.7764706, 1,
-0.04943163, -1.142994, -3.521924, 0, 1, 0.7843137, 1,
-0.04824887, -1.683288, -3.39733, 0, 1, 0.7882353, 1,
-0.04731456, 2.363473, -1.225664, 0, 1, 0.7960784, 1,
-0.0463388, -0.03618824, -1.861552, 0, 1, 0.8039216, 1,
-0.04370758, -0.206337, -4.515277, 0, 1, 0.8078431, 1,
-0.04021586, -0.9227991, -3.53062, 0, 1, 0.8156863, 1,
-0.03850488, -1.139551, -0.4367435, 0, 1, 0.8196079, 1,
-0.03611058, 0.7793285, -1.142314, 0, 1, 0.827451, 1,
-0.03517289, 0.2462881, -0.4236683, 0, 1, 0.8313726, 1,
-0.0339564, -0.7157974, -1.371695, 0, 1, 0.8392157, 1,
-0.03058705, -1.206997, -2.820434, 0, 1, 0.8431373, 1,
-0.0296025, -1.22756, -3.656595, 0, 1, 0.8509804, 1,
-0.0279955, -0.6058544, -1.228539, 0, 1, 0.854902, 1,
-0.02525874, -0.5594534, -3.506993, 0, 1, 0.8627451, 1,
-0.02521322, 0.4560926, -2.359943, 0, 1, 0.8666667, 1,
-0.02299849, 1.097506, -1.161332, 0, 1, 0.8745098, 1,
-0.01711509, 0.6386228, 0.5046885, 0, 1, 0.8784314, 1,
-0.009583409, 0.5554178, 0.005352341, 0, 1, 0.8862745, 1,
-0.009090584, 1.1657, 0.5833598, 0, 1, 0.8901961, 1,
-0.007646322, -0.2145729, -1.589711, 0, 1, 0.8980392, 1,
-0.007044714, 0.5722492, -0.7839552, 0, 1, 0.9058824, 1,
-0.003006714, -1.1054, -1.556947, 0, 1, 0.9098039, 1,
0.00160287, -0.1358427, 1.907071, 0, 1, 0.9176471, 1,
0.003149511, 0.6602052, -0.0609648, 0, 1, 0.9215686, 1,
0.003422604, 1.724506, 1.247992, 0, 1, 0.9294118, 1,
0.01471443, 0.3584452, 0.2154143, 0, 1, 0.9333333, 1,
0.01498846, 0.1029016, 0.9416771, 0, 1, 0.9411765, 1,
0.01709115, 0.1793832, 0.7725797, 0, 1, 0.945098, 1,
0.02208417, 1.7489, -1.320132, 0, 1, 0.9529412, 1,
0.02353525, -0.6360377, 1.836894, 0, 1, 0.9568627, 1,
0.02406537, -0.3230897, 2.602413, 0, 1, 0.9647059, 1,
0.02505009, 0.01883423, -1.434421, 0, 1, 0.9686275, 1,
0.025355, -0.7406036, 4.613001, 0, 1, 0.9764706, 1,
0.03046473, -0.02512922, 1.526681, 0, 1, 0.9803922, 1,
0.03714591, -0.1570454, 3.220479, 0, 1, 0.9882353, 1,
0.04082729, 0.6174152, -0.676214, 0, 1, 0.9921569, 1,
0.04287546, 0.4155771, -0.6621643, 0, 1, 1, 1,
0.05130346, -0.44896, 4.070918, 0, 0.9921569, 1, 1,
0.05345517, -0.678612, 2.68226, 0, 0.9882353, 1, 1,
0.05390208, 0.402817, -0.864387, 0, 0.9803922, 1, 1,
0.05577172, 2.180101, 0.2122833, 0, 0.9764706, 1, 1,
0.05717153, 0.9104096, 0.4556527, 0, 0.9686275, 1, 1,
0.05743923, 0.04796985, 2.175113, 0, 0.9647059, 1, 1,
0.05967829, 1.866746, -0.4766922, 0, 0.9568627, 1, 1,
0.06205184, 0.6278818, -0.2072877, 0, 0.9529412, 1, 1,
0.06420708, 0.3457181, 0.503185, 0, 0.945098, 1, 1,
0.06426905, -0.06605699, 2.230401, 0, 0.9411765, 1, 1,
0.06785485, 2.137973, 0.495739, 0, 0.9333333, 1, 1,
0.06922671, 0.9734556, -2.706982, 0, 0.9294118, 1, 1,
0.07342511, 0.234394, 0.711143, 0, 0.9215686, 1, 1,
0.07986081, -0.04427866, 0.1930872, 0, 0.9176471, 1, 1,
0.08224316, 0.291303, -0.6826245, 0, 0.9098039, 1, 1,
0.08239725, 0.1743297, 0.1666062, 0, 0.9058824, 1, 1,
0.08357012, 0.348872, -0.3692445, 0, 0.8980392, 1, 1,
0.09017465, 0.7273491, -0.2052453, 0, 0.8901961, 1, 1,
0.09262192, -0.0932646, 1.659832, 0, 0.8862745, 1, 1,
0.09269214, 0.2691544, 2.685428, 0, 0.8784314, 1, 1,
0.09438122, 1.218501, 0.5997099, 0, 0.8745098, 1, 1,
0.09647384, -1.289885, 3.841229, 0, 0.8666667, 1, 1,
0.09950537, -0.4204253, 1.896534, 0, 0.8627451, 1, 1,
0.1069209, 0.2310387, 0.8229458, 0, 0.854902, 1, 1,
0.1092619, 0.2088285, 2.235008, 0, 0.8509804, 1, 1,
0.1102711, -1.685936, 2.224221, 0, 0.8431373, 1, 1,
0.1115204, -1.581385, 2.948511, 0, 0.8392157, 1, 1,
0.1117301, 0.02077091, 3.321875, 0, 0.8313726, 1, 1,
0.1119531, -0.6573753, 4.759768, 0, 0.827451, 1, 1,
0.1151441, 0.07452123, 1.851036, 0, 0.8196079, 1, 1,
0.1185451, -0.3293892, 3.667627, 0, 0.8156863, 1, 1,
0.1198305, -0.9744447, 2.337605, 0, 0.8078431, 1, 1,
0.1198905, -0.9353791, 3.051175, 0, 0.8039216, 1, 1,
0.119936, -0.3962381, 2.780374, 0, 0.7960784, 1, 1,
0.1210931, -1.513603, 1.906793, 0, 0.7882353, 1, 1,
0.1212724, -0.04792436, 0.9535599, 0, 0.7843137, 1, 1,
0.1216, 0.8476328, 1.467604, 0, 0.7764706, 1, 1,
0.1244424, 1.563314, -1.715339, 0, 0.772549, 1, 1,
0.1283262, -0.1211293, 2.49668, 0, 0.7647059, 1, 1,
0.1288291, -0.2503052, 0.6771123, 0, 0.7607843, 1, 1,
0.1301954, 0.04330657, -0.4650005, 0, 0.7529412, 1, 1,
0.1304744, 0.3048537, 1.959887, 0, 0.7490196, 1, 1,
0.1307347, 0.2087321, -0.5903004, 0, 0.7411765, 1, 1,
0.132785, 0.8486199, -1.096704, 0, 0.7372549, 1, 1,
0.1351981, -0.01337754, 3.418481, 0, 0.7294118, 1, 1,
0.1353786, -1.813182, 1.967214, 0, 0.7254902, 1, 1,
0.1375212, 0.6944221, -0.7104349, 0, 0.7176471, 1, 1,
0.1424123, -2.120715, 3.048366, 0, 0.7137255, 1, 1,
0.1449576, -0.6360003, 1.043719, 0, 0.7058824, 1, 1,
0.1450128, 0.2499026, 1.012504, 0, 0.6980392, 1, 1,
0.1477976, -0.6481947, 3.77782, 0, 0.6941177, 1, 1,
0.1506056, 2.058314, 0.3027013, 0, 0.6862745, 1, 1,
0.1574138, -1.059755, 3.204289, 0, 0.682353, 1, 1,
0.1586707, 0.5668215, 3.466376, 0, 0.6745098, 1, 1,
0.1622285, 0.7806726, 0.5560298, 0, 0.6705883, 1, 1,
0.1651828, -0.7415675, 1.805184, 0, 0.6627451, 1, 1,
0.167233, 0.436236, -0.3333149, 0, 0.6588235, 1, 1,
0.1693288, -0.5433675, 2.888388, 0, 0.6509804, 1, 1,
0.1702135, 0.1624554, 1.867976, 0, 0.6470588, 1, 1,
0.1746065, 1.582289, -1.941444, 0, 0.6392157, 1, 1,
0.1773756, 0.8804526, 1.137797, 0, 0.6352941, 1, 1,
0.1793346, -0.8402881, 2.164548, 0, 0.627451, 1, 1,
0.1836745, -1.630515, 3.470414, 0, 0.6235294, 1, 1,
0.1850268, -0.6255128, 3.861264, 0, 0.6156863, 1, 1,
0.1867843, -1.694034, 1.852898, 0, 0.6117647, 1, 1,
0.1922573, -0.7098799, 4.580246, 0, 0.6039216, 1, 1,
0.1990256, 0.5980119, -1.796919, 0, 0.5960785, 1, 1,
0.1993681, 0.8072127, -1.166445, 0, 0.5921569, 1, 1,
0.202404, -0.01908662, 0.1724106, 0, 0.5843138, 1, 1,
0.2051457, 1.195046, -1.623169, 0, 0.5803922, 1, 1,
0.2056929, -2.201366, 4.995872, 0, 0.572549, 1, 1,
0.2058335, 0.4153728, -0.5351603, 0, 0.5686275, 1, 1,
0.2070396, -0.4620779, 3.087906, 0, 0.5607843, 1, 1,
0.2075676, -0.03661017, 1.418736, 0, 0.5568628, 1, 1,
0.2095551, 1.446287, -1.006571, 0, 0.5490196, 1, 1,
0.2158029, 1.116401, -1.798206, 0, 0.5450981, 1, 1,
0.2217703, 1.022226, -0.7970741, 0, 0.5372549, 1, 1,
0.2274423, 0.2953821, 0.6756719, 0, 0.5333334, 1, 1,
0.2282006, 2.346092, 1.37594, 0, 0.5254902, 1, 1,
0.2306763, -1.277336, 2.330498, 0, 0.5215687, 1, 1,
0.2315695, -0.7976281, 4.277385, 0, 0.5137255, 1, 1,
0.2356087, 0.4672287, 0.5943885, 0, 0.509804, 1, 1,
0.2393055, -0.2085454, 3.153005, 0, 0.5019608, 1, 1,
0.2398264, 0.6095895, -0.5310523, 0, 0.4941176, 1, 1,
0.2403527, -0.8715954, 1.919871, 0, 0.4901961, 1, 1,
0.2445543, -1.565035, 3.293002, 0, 0.4823529, 1, 1,
0.2454489, -1.52127, 1.665213, 0, 0.4784314, 1, 1,
0.2541669, 0.843964, -0.2168058, 0, 0.4705882, 1, 1,
0.2557923, 0.3056165, 0.2686858, 0, 0.4666667, 1, 1,
0.2586398, -1.619591, 2.870731, 0, 0.4588235, 1, 1,
0.259415, 1.071182, -0.2228035, 0, 0.454902, 1, 1,
0.259938, -0.310275, 2.186656, 0, 0.4470588, 1, 1,
0.262798, 0.3547137, 2.849393, 0, 0.4431373, 1, 1,
0.2665538, 0.9468488, -1.417433, 0, 0.4352941, 1, 1,
0.2676694, -1.175727, 2.754429, 0, 0.4313726, 1, 1,
0.2680292, -0.204082, 0.292601, 0, 0.4235294, 1, 1,
0.2742561, -0.3431857, 2.145005, 0, 0.4196078, 1, 1,
0.2814592, -0.2326507, 1.183274, 0, 0.4117647, 1, 1,
0.2856457, 0.1405094, 2.130065, 0, 0.4078431, 1, 1,
0.2859966, 1.119021, -0.8144085, 0, 0.4, 1, 1,
0.2869646, 0.02796644, 2.01868, 0, 0.3921569, 1, 1,
0.2946184, -0.8241089, 3.639986, 0, 0.3882353, 1, 1,
0.3002727, 0.3107978, 1.339952, 0, 0.3803922, 1, 1,
0.3023389, -2.176946, 2.631373, 0, 0.3764706, 1, 1,
0.3035928, -0.8033248, 1.43105, 0, 0.3686275, 1, 1,
0.3037199, 0.08529823, 0.7942811, 0, 0.3647059, 1, 1,
0.3090447, 0.4322612, 3.24909, 0, 0.3568628, 1, 1,
0.3095471, 0.6330685, 0.518849, 0, 0.3529412, 1, 1,
0.3126533, 0.2604627, 2.07145, 0, 0.345098, 1, 1,
0.3163171, 1.746598, 1.168846, 0, 0.3411765, 1, 1,
0.3163903, -0.7602732, 4.004699, 0, 0.3333333, 1, 1,
0.3166155, -0.5429438, 1.379502, 0, 0.3294118, 1, 1,
0.3200232, -0.5069271, 1.743743, 0, 0.3215686, 1, 1,
0.3228875, -0.3635308, 1.926192, 0, 0.3176471, 1, 1,
0.3229432, -1.553634, 3.726645, 0, 0.3098039, 1, 1,
0.3319412, 0.2050436, 1.013779, 0, 0.3058824, 1, 1,
0.3321122, 1.726548, -0.04538536, 0, 0.2980392, 1, 1,
0.3384281, 1.001748, 1.345236, 0, 0.2901961, 1, 1,
0.3390219, -0.4692437, 3.490829, 0, 0.2862745, 1, 1,
0.3455143, -0.856096, 3.541639, 0, 0.2784314, 1, 1,
0.3483287, -0.2603785, 1.7301, 0, 0.2745098, 1, 1,
0.3507455, 0.1152986, 1.48811, 0, 0.2666667, 1, 1,
0.3508734, 0.5570095, 2.800141, 0, 0.2627451, 1, 1,
0.352983, -0.6663906, 1.696752, 0, 0.254902, 1, 1,
0.3580134, -0.859116, 3.122057, 0, 0.2509804, 1, 1,
0.3592374, 1.632021, -0.9261916, 0, 0.2431373, 1, 1,
0.3666222, -0.3488985, 2.83268, 0, 0.2392157, 1, 1,
0.3706757, 0.6129449, 0.5999646, 0, 0.2313726, 1, 1,
0.3759287, 0.4224242, 1.052288, 0, 0.227451, 1, 1,
0.381925, -1.632448, 3.259917, 0, 0.2196078, 1, 1,
0.3868194, 0.680003, 1.380144, 0, 0.2156863, 1, 1,
0.3908446, -1.470545, 4.067355, 0, 0.2078431, 1, 1,
0.3953681, -0.6561225, 2.7183, 0, 0.2039216, 1, 1,
0.3962702, 0.5710884, 0.1288414, 0, 0.1960784, 1, 1,
0.3978075, 0.7036826, 1.572783, 0, 0.1882353, 1, 1,
0.3985096, -1.304221, 4.530775, 0, 0.1843137, 1, 1,
0.3996018, -0.7683631, 1.897074, 0, 0.1764706, 1, 1,
0.4000123, -0.0006375657, 2.290391, 0, 0.172549, 1, 1,
0.4003744, 0.9753864, 0.2407415, 0, 0.1647059, 1, 1,
0.4024599, 0.01014334, 2.451892, 0, 0.1607843, 1, 1,
0.4043948, 0.6305275, -1.341956, 0, 0.1529412, 1, 1,
0.4107321, 1.29502, 1.736187, 0, 0.1490196, 1, 1,
0.4122806, -0.4981026, 1.712966, 0, 0.1411765, 1, 1,
0.4154008, 1.329302, 0.9250028, 0, 0.1372549, 1, 1,
0.4209008, 1.352613, 0.7308677, 0, 0.1294118, 1, 1,
0.4213652, -0.5679278, 2.401253, 0, 0.1254902, 1, 1,
0.4225495, -2.471283, 2.545809, 0, 0.1176471, 1, 1,
0.42402, -0.4977515, 2.537004, 0, 0.1137255, 1, 1,
0.4307916, -1.858537, 3.236629, 0, 0.1058824, 1, 1,
0.4371693, -0.1187822, 1.326479, 0, 0.09803922, 1, 1,
0.4414162, -0.6633313, 1.108006, 0, 0.09411765, 1, 1,
0.4429528, 1.490571, 0.7358362, 0, 0.08627451, 1, 1,
0.4455981, 1.870108, 0.09502693, 0, 0.08235294, 1, 1,
0.4462103, -0.3014555, 2.053529, 0, 0.07450981, 1, 1,
0.446479, 0.3821585, -1.648105, 0, 0.07058824, 1, 1,
0.4484001, 0.3360579, 1.86292, 0, 0.0627451, 1, 1,
0.4539175, 0.562598, 0.4110897, 0, 0.05882353, 1, 1,
0.45693, -0.2424959, 1.502474, 0, 0.05098039, 1, 1,
0.4589118, 0.7117116, -2.003253, 0, 0.04705882, 1, 1,
0.4703303, -0.8597779, 1.536827, 0, 0.03921569, 1, 1,
0.4706422, 0.5344753, 2.267552, 0, 0.03529412, 1, 1,
0.4728844, -2.267441, 3.30331, 0, 0.02745098, 1, 1,
0.474543, -2.18557, 1.942347, 0, 0.02352941, 1, 1,
0.4786825, -0.4692378, 2.555135, 0, 0.01568628, 1, 1,
0.4841016, -0.9516382, 1.094598, 0, 0.01176471, 1, 1,
0.4841465, 0.3040089, 0.4154724, 0, 0.003921569, 1, 1,
0.4853006, 0.9808343, 0.4713653, 0.003921569, 0, 1, 1,
0.4862023, -0.7517096, 3.689955, 0.007843138, 0, 1, 1,
0.4878052, -1.26738, 1.498451, 0.01568628, 0, 1, 1,
0.4901541, -0.1659596, 1.896001, 0.01960784, 0, 1, 1,
0.4939906, 2.227644, -0.9062764, 0.02745098, 0, 1, 1,
0.4953604, 1.247628, 0.3152551, 0.03137255, 0, 1, 1,
0.4956131, -0.3194295, 0.7400455, 0.03921569, 0, 1, 1,
0.5017285, 0.6348106, -0.3610939, 0.04313726, 0, 1, 1,
0.504036, 1.292351, 1.971052, 0.05098039, 0, 1, 1,
0.5044199, -0.2348675, 2.183517, 0.05490196, 0, 1, 1,
0.5086359, -1.469111, 4.123216, 0.0627451, 0, 1, 1,
0.5133429, 0.1086781, 1.685025, 0.06666667, 0, 1, 1,
0.5144525, -1.081374, 2.939002, 0.07450981, 0, 1, 1,
0.514556, -0.9444219, 1.444231, 0.07843138, 0, 1, 1,
0.5197836, 1.20457, 0.8635315, 0.08627451, 0, 1, 1,
0.5228168, -0.1592146, 1.917031, 0.09019608, 0, 1, 1,
0.5228313, -1.045148, 2.551849, 0.09803922, 0, 1, 1,
0.5235215, -0.578505, 2.869781, 0.1058824, 0, 1, 1,
0.5252656, -1.52885, 2.632683, 0.1098039, 0, 1, 1,
0.5259956, 0.5915768, 1.884492, 0.1176471, 0, 1, 1,
0.526046, 0.6418856, 0.4275082, 0.1215686, 0, 1, 1,
0.526448, -2.294304, 3.071368, 0.1294118, 0, 1, 1,
0.5286184, -0.3653723, 2.653666, 0.1333333, 0, 1, 1,
0.5293917, 0.4054748, 0.9433095, 0.1411765, 0, 1, 1,
0.532836, 1.093967, 0.8933214, 0.145098, 0, 1, 1,
0.5328645, 0.3463275, 1.820954, 0.1529412, 0, 1, 1,
0.5345691, -0.7862983, 2.20283, 0.1568628, 0, 1, 1,
0.5388508, 0.2019451, 0.3626583, 0.1647059, 0, 1, 1,
0.5429128, 0.8377037, -0.1107605, 0.1686275, 0, 1, 1,
0.5468238, 1.20647, -0.5019853, 0.1764706, 0, 1, 1,
0.5492205, 0.1163307, -0.2745754, 0.1803922, 0, 1, 1,
0.5525056, -0.5105513, 2.260499, 0.1882353, 0, 1, 1,
0.5549136, 0.4769323, -1.301838, 0.1921569, 0, 1, 1,
0.5626396, 0.5861447, 2.238455, 0.2, 0, 1, 1,
0.5630172, 0.2106453, 0.8032007, 0.2078431, 0, 1, 1,
0.5631103, -0.8568304, 1.946512, 0.2117647, 0, 1, 1,
0.5669885, 1.509575, 1.273365, 0.2196078, 0, 1, 1,
0.5692902, 1.643802, -0.9667017, 0.2235294, 0, 1, 1,
0.5771816, 2.380906, 0.2384103, 0.2313726, 0, 1, 1,
0.5779769, -0.7476733, 2.487789, 0.2352941, 0, 1, 1,
0.5790101, 0.08246538, 0.4364017, 0.2431373, 0, 1, 1,
0.5808477, 0.617783, -1.104108, 0.2470588, 0, 1, 1,
0.5877122, 1.60473, 0.3280166, 0.254902, 0, 1, 1,
0.5926688, 0.2423173, 2.290246, 0.2588235, 0, 1, 1,
0.5928909, 1.037635, 0.7301773, 0.2666667, 0, 1, 1,
0.5930364, -1.114259, 3.727974, 0.2705882, 0, 1, 1,
0.5968821, 1.166756, -0.3245, 0.2784314, 0, 1, 1,
0.5982239, -0.9558072, 1.244555, 0.282353, 0, 1, 1,
0.6006415, 0.09032791, 0.8609991, 0.2901961, 0, 1, 1,
0.6077281, 0.4544646, 1.664899, 0.2941177, 0, 1, 1,
0.6080488, -0.001867115, 3.515219, 0.3019608, 0, 1, 1,
0.6086655, -2.959047, 4.031494, 0.3098039, 0, 1, 1,
0.613727, -0.3301635, 3.298679, 0.3137255, 0, 1, 1,
0.6176638, 0.169768, 2.717442, 0.3215686, 0, 1, 1,
0.6194681, -2.505562, 1.911219, 0.3254902, 0, 1, 1,
0.6213527, -0.3220181, 2.379992, 0.3333333, 0, 1, 1,
0.6241382, 0.3011474, 2.75952, 0.3372549, 0, 1, 1,
0.6260295, -0.6476092, 1.262723, 0.345098, 0, 1, 1,
0.6278158, 0.789128, 1.077586, 0.3490196, 0, 1, 1,
0.6360466, 0.4135434, 2.100322, 0.3568628, 0, 1, 1,
0.6370757, 0.8602931, 1.537598, 0.3607843, 0, 1, 1,
0.6410024, 0.9339945, 0.1905819, 0.3686275, 0, 1, 1,
0.6458476, 0.2928678, 1.105075, 0.372549, 0, 1, 1,
0.6494932, 0.7949679, 0.7918258, 0.3803922, 0, 1, 1,
0.6534858, 0.9097492, -0.1358954, 0.3843137, 0, 1, 1,
0.6545904, -1.058037, 1.683153, 0.3921569, 0, 1, 1,
0.6574019, 0.1539906, 1.611076, 0.3960784, 0, 1, 1,
0.6629547, 0.5993646, 0.5703651, 0.4039216, 0, 1, 1,
0.6683129, -0.0652815, 2.180683, 0.4117647, 0, 1, 1,
0.6685974, 0.7583269, 1.341022, 0.4156863, 0, 1, 1,
0.6705087, -1.705554, 2.490185, 0.4235294, 0, 1, 1,
0.6709805, 0.7254491, 0.7411421, 0.427451, 0, 1, 1,
0.6745131, -0.3693528, 1.777488, 0.4352941, 0, 1, 1,
0.6752816, 1.685494, 3.251228, 0.4392157, 0, 1, 1,
0.6796099, 1.099879, -0.2613513, 0.4470588, 0, 1, 1,
0.6822562, 0.5037539, 0.6525852, 0.4509804, 0, 1, 1,
0.6847487, -1.521347, 3.797217, 0.4588235, 0, 1, 1,
0.6866223, -0.3622152, 2.502787, 0.4627451, 0, 1, 1,
0.6921209, -0.5886657, 2.874816, 0.4705882, 0, 1, 1,
0.6953245, 1.498019, -0.8244913, 0.4745098, 0, 1, 1,
0.695327, -0.7484983, 2.637664, 0.4823529, 0, 1, 1,
0.6954011, -0.5448462, 2.234083, 0.4862745, 0, 1, 1,
0.697992, -0.1937923, 3.08852, 0.4941176, 0, 1, 1,
0.6988777, 1.598184, 1.031373, 0.5019608, 0, 1, 1,
0.7024817, -1.783456, 3.342043, 0.5058824, 0, 1, 1,
0.7066585, -0.310385, 1.19224, 0.5137255, 0, 1, 1,
0.7071312, 0.522704, 0.5938203, 0.5176471, 0, 1, 1,
0.7150721, 1.828849, 1.078754, 0.5254902, 0, 1, 1,
0.7154464, 0.548256, 3.747855, 0.5294118, 0, 1, 1,
0.7167794, -1.161806, 2.729454, 0.5372549, 0, 1, 1,
0.719171, 0.4148611, 0.228375, 0.5411765, 0, 1, 1,
0.7230753, 1.747647, 0.8724914, 0.5490196, 0, 1, 1,
0.7322966, -0.2319853, 1.17701, 0.5529412, 0, 1, 1,
0.7336866, -1.149897, 1.384905, 0.5607843, 0, 1, 1,
0.7424717, 0.3419064, 0.293787, 0.5647059, 0, 1, 1,
0.742509, 0.6725579, 1.677853, 0.572549, 0, 1, 1,
0.7438502, 1.548504, -1.4643, 0.5764706, 0, 1, 1,
0.7542244, 1.880726, -0.02888496, 0.5843138, 0, 1, 1,
0.7578272, 1.445045, 1.328205, 0.5882353, 0, 1, 1,
0.7590276, -1.11687, 1.9105, 0.5960785, 0, 1, 1,
0.7623323, 0.6822102, -0.7631375, 0.6039216, 0, 1, 1,
0.762525, -0.545625, 1.813196, 0.6078432, 0, 1, 1,
0.7637646, 1.235011, 0.9791208, 0.6156863, 0, 1, 1,
0.7645362, -0.3539897, 2.509338, 0.6196079, 0, 1, 1,
0.7741709, -0.1472056, 2.166029, 0.627451, 0, 1, 1,
0.7769637, -1.03583, 2.021259, 0.6313726, 0, 1, 1,
0.777076, -0.7056397, 2.598603, 0.6392157, 0, 1, 1,
0.7775851, 0.6194187, 0.1009405, 0.6431373, 0, 1, 1,
0.7882379, 1.074745, -0.5715733, 0.6509804, 0, 1, 1,
0.7890881, -0.7806098, 3.541322, 0.654902, 0, 1, 1,
0.7929634, -1.504807, 3.838999, 0.6627451, 0, 1, 1,
0.799695, -0.4491773, 2.26843, 0.6666667, 0, 1, 1,
0.8022926, -0.1601829, 2.48255, 0.6745098, 0, 1, 1,
0.8052608, 0.4250555, 1.737437, 0.6784314, 0, 1, 1,
0.8070913, 1.409315, 0.1226169, 0.6862745, 0, 1, 1,
0.8075261, 0.5535464, 0.1771686, 0.6901961, 0, 1, 1,
0.8188754, -0.5353463, 2.163538, 0.6980392, 0, 1, 1,
0.8218421, -0.4829832, 2.687507, 0.7058824, 0, 1, 1,
0.8231207, 0.465274, 2.490929, 0.7098039, 0, 1, 1,
0.8245324, 1.133244, -0.2373595, 0.7176471, 0, 1, 1,
0.8264999, 0.03668356, 1.113274, 0.7215686, 0, 1, 1,
0.8289124, 1.343074, 0.1325259, 0.7294118, 0, 1, 1,
0.8334013, -1.1749, 2.615228, 0.7333333, 0, 1, 1,
0.8353895, -1.119448, 0.3631634, 0.7411765, 0, 1, 1,
0.8376586, -1.000463, 2.251478, 0.7450981, 0, 1, 1,
0.8387776, -0.6488842, 2.61477, 0.7529412, 0, 1, 1,
0.8393915, 0.1189291, 1.082642, 0.7568628, 0, 1, 1,
0.8452942, -0.456578, 1.9143, 0.7647059, 0, 1, 1,
0.84533, 1.429745, 1.616432, 0.7686275, 0, 1, 1,
0.8459459, 0.4228246, 1.208012, 0.7764706, 0, 1, 1,
0.8464355, 0.2347981, -0.6246095, 0.7803922, 0, 1, 1,
0.85099, 1.350264, 1.55071, 0.7882353, 0, 1, 1,
0.8579149, -0.4184602, 2.209585, 0.7921569, 0, 1, 1,
0.8588953, -1.499763, 3.169829, 0.8, 0, 1, 1,
0.8618198, -0.1619429, 2.842551, 0.8078431, 0, 1, 1,
0.8668285, -0.1201574, 1.583051, 0.8117647, 0, 1, 1,
0.868722, 0.2273611, 1.93587, 0.8196079, 0, 1, 1,
0.870079, 0.2882837, 0.9467375, 0.8235294, 0, 1, 1,
0.8706847, 0.3365977, 0.8032315, 0.8313726, 0, 1, 1,
0.8711923, 2.486749, -0.4558012, 0.8352941, 0, 1, 1,
0.8790939, 0.8503061, -0.9806236, 0.8431373, 0, 1, 1,
0.8814588, 0.5527402, 1.600126, 0.8470588, 0, 1, 1,
0.8876781, -1.403599, 2.683962, 0.854902, 0, 1, 1,
0.8892143, 1.110304, 0.5622365, 0.8588235, 0, 1, 1,
0.8907934, 0.5207115, 1.187022, 0.8666667, 0, 1, 1,
0.896396, -0.07467669, 3.174853, 0.8705882, 0, 1, 1,
0.8970376, 0.8567035, 1.74663, 0.8784314, 0, 1, 1,
0.8971187, -0.2575844, 3.67439, 0.8823529, 0, 1, 1,
0.9015193, -1.036331, 2.321693, 0.8901961, 0, 1, 1,
0.9055589, 0.368173, 1.065526, 0.8941177, 0, 1, 1,
0.9102497, -0.5050111, 2.552559, 0.9019608, 0, 1, 1,
0.9140688, 0.2128113, 1.429398, 0.9098039, 0, 1, 1,
0.9156416, -1.89481, 2.033904, 0.9137255, 0, 1, 1,
0.9209968, 0.4405643, 0.7247357, 0.9215686, 0, 1, 1,
0.9246543, 0.2940993, 1.763045, 0.9254902, 0, 1, 1,
0.9329425, 0.493731, 0.5725914, 0.9333333, 0, 1, 1,
0.9380354, -0.2961544, 0.8629246, 0.9372549, 0, 1, 1,
0.9455817, 0.9725921, 1.39955, 0.945098, 0, 1, 1,
0.9478024, 1.168404, 1.750591, 0.9490196, 0, 1, 1,
0.9599879, 0.09493099, 0.09175117, 0.9568627, 0, 1, 1,
0.9690213, -0.2930043, 3.041901, 0.9607843, 0, 1, 1,
0.9718693, -0.5206066, 2.03705, 0.9686275, 0, 1, 1,
0.9742558, 0.3708494, 3.318511, 0.972549, 0, 1, 1,
0.9751013, -1.960749, 1.479805, 0.9803922, 0, 1, 1,
0.9795191, 2.156517, 1.922618, 0.9843137, 0, 1, 1,
0.9800434, -0.2925268, 3.483596, 0.9921569, 0, 1, 1,
0.9829141, -0.1384063, -0.07469932, 0.9960784, 0, 1, 1,
0.9921601, -0.5532859, 1.886873, 1, 0, 0.9960784, 1,
1.000677, 0.581354, 0.5983909, 1, 0, 0.9882353, 1,
1.009945, 0.6760603, 0.5657855, 1, 0, 0.9843137, 1,
1.016453, 0.5907243, 1.580267, 1, 0, 0.9764706, 1,
1.016668, 0.8811609, 2.700141, 1, 0, 0.972549, 1,
1.023438, 0.03798385, 3.143134, 1, 0, 0.9647059, 1,
1.023886, -0.9702296, 1.084634, 1, 0, 0.9607843, 1,
1.026464, -0.009697414, 2.445562, 1, 0, 0.9529412, 1,
1.030818, 0.05518792, 3.050829, 1, 0, 0.9490196, 1,
1.03636, 0.3770333, 1.095122, 1, 0, 0.9411765, 1,
1.044934, 0.1622054, 2.72269, 1, 0, 0.9372549, 1,
1.051594, 0.1340283, 0.8062068, 1, 0, 0.9294118, 1,
1.052036, 0.4722871, -0.0656173, 1, 0, 0.9254902, 1,
1.05204, 1.455909, 2.22626, 1, 0, 0.9176471, 1,
1.052856, 0.5064496, 1.433121, 1, 0, 0.9137255, 1,
1.057581, -1.732318, 2.800056, 1, 0, 0.9058824, 1,
1.061454, -1.01315, 1.594656, 1, 0, 0.9019608, 1,
1.065001, 1.669942, -0.7176438, 1, 0, 0.8941177, 1,
1.065417, -0.9956282, 1.596692, 1, 0, 0.8862745, 1,
1.075686, 1.255855, 1.803408, 1, 0, 0.8823529, 1,
1.083514, -0.04145303, 3.362244, 1, 0, 0.8745098, 1,
1.083987, -0.4367989, 1.745612, 1, 0, 0.8705882, 1,
1.086504, -0.5812606, 3.319429, 1, 0, 0.8627451, 1,
1.087003, 0.02292077, 1.206815, 1, 0, 0.8588235, 1,
1.097511, -0.3657326, 2.588242, 1, 0, 0.8509804, 1,
1.09832, 0.3391268, -0.4568855, 1, 0, 0.8470588, 1,
1.099137, -0.708666, 1.769341, 1, 0, 0.8392157, 1,
1.109058, 1.089791, 2.133958, 1, 0, 0.8352941, 1,
1.111601, 0.2628181, 2.446062, 1, 0, 0.827451, 1,
1.119748, 1.286526, 1.524858, 1, 0, 0.8235294, 1,
1.119876, -0.1460022, 2.566074, 1, 0, 0.8156863, 1,
1.12474, -0.2290248, 2.27605, 1, 0, 0.8117647, 1,
1.124876, -1.172827, 2.584856, 1, 0, 0.8039216, 1,
1.13069, -0.3504449, 2.725877, 1, 0, 0.7960784, 1,
1.136828, 0.9887185, 0.4193094, 1, 0, 0.7921569, 1,
1.139142, -0.7878428, 1.384889, 1, 0, 0.7843137, 1,
1.161237, -0.6961719, 2.188317, 1, 0, 0.7803922, 1,
1.179225, 1.204366, -0.07636086, 1, 0, 0.772549, 1,
1.181612, 1.059302, 1.154566, 1, 0, 0.7686275, 1,
1.192441, 0.4454574, 1.746352, 1, 0, 0.7607843, 1,
1.194209, -0.8984487, 2.815144, 1, 0, 0.7568628, 1,
1.194456, -0.8393152, 2.145253, 1, 0, 0.7490196, 1,
1.196242, -0.843741, 2.189124, 1, 0, 0.7450981, 1,
1.196661, 1.290753, 2.670011, 1, 0, 0.7372549, 1,
1.201056, 1.063099, 0.9812611, 1, 0, 0.7333333, 1,
1.204593, -0.8410208, 2.171287, 1, 0, 0.7254902, 1,
1.210552, -1.130594, 1.549728, 1, 0, 0.7215686, 1,
1.210923, 0.2260628, 0.3707753, 1, 0, 0.7137255, 1,
1.213523, -0.6603151, 2.581629, 1, 0, 0.7098039, 1,
1.215644, -0.6033829, 3.326251, 1, 0, 0.7019608, 1,
1.217641, -1.050371, 1.980596, 1, 0, 0.6941177, 1,
1.219401, 1.1357, -0.3263668, 1, 0, 0.6901961, 1,
1.22108, 0.8185953, 0.4884906, 1, 0, 0.682353, 1,
1.230014, 1.396706, 1.557541, 1, 0, 0.6784314, 1,
1.230744, -0.8936163, 2.373463, 1, 0, 0.6705883, 1,
1.23125, -1.064727, 2.927836, 1, 0, 0.6666667, 1,
1.249053, 0.15634, 3.345827, 1, 0, 0.6588235, 1,
1.254478, -0.7857723, 2.299836, 1, 0, 0.654902, 1,
1.255865, 0.8702276, 0.5706583, 1, 0, 0.6470588, 1,
1.260658, -1.380159, 2.88973, 1, 0, 0.6431373, 1,
1.263949, -0.4779589, 1.018227, 1, 0, 0.6352941, 1,
1.265401, -0.3947833, 2.68802, 1, 0, 0.6313726, 1,
1.279192, 0.3505002, 1.450746, 1, 0, 0.6235294, 1,
1.281105, 0.07855641, 0.6387056, 1, 0, 0.6196079, 1,
1.281774, 0.8032466, 1.0691, 1, 0, 0.6117647, 1,
1.286783, 0.9127991, 0.3845711, 1, 0, 0.6078432, 1,
1.288265, 0.151377, 1.575999, 1, 0, 0.6, 1,
1.29305, 0.9899899, -0.958241, 1, 0, 0.5921569, 1,
1.293871, -1.755458, 3.143068, 1, 0, 0.5882353, 1,
1.294393, -0.2900882, 1.007938, 1, 0, 0.5803922, 1,
1.297584, -0.8572748, 2.955078, 1, 0, 0.5764706, 1,
1.307608, -1.401041, 2.884135, 1, 0, 0.5686275, 1,
1.310862, -0.1013882, 2.243232, 1, 0, 0.5647059, 1,
1.312036, 0.8910454, 0.04602731, 1, 0, 0.5568628, 1,
1.319637, -0.0554858, -0.519323, 1, 0, 0.5529412, 1,
1.321036, -0.1329782, 1.396879, 1, 0, 0.5450981, 1,
1.321528, -0.591851, 1.332509, 1, 0, 0.5411765, 1,
1.32698, -2.376265, 1.803854, 1, 0, 0.5333334, 1,
1.346213, -0.9584498, 1.554393, 1, 0, 0.5294118, 1,
1.355572, 1.277918, 0.5532193, 1, 0, 0.5215687, 1,
1.36708, 0.5842341, 2.975351, 1, 0, 0.5176471, 1,
1.374007, -1.249261, 0.3668979, 1, 0, 0.509804, 1,
1.380968, 0.1476541, 0.2832968, 1, 0, 0.5058824, 1,
1.388544, -0.09995004, 3.729558, 1, 0, 0.4980392, 1,
1.391596, -0.02144085, 3.497921, 1, 0, 0.4901961, 1,
1.399283, 2.155754, 1.020468, 1, 0, 0.4862745, 1,
1.405279, 1.580012, 0.9109848, 1, 0, 0.4784314, 1,
1.409791, 0.697179, 1.770305, 1, 0, 0.4745098, 1,
1.416482, -1.719827, 1.054058, 1, 0, 0.4666667, 1,
1.419215, 0.3926302, 0.7615346, 1, 0, 0.4627451, 1,
1.430738, -0.2579682, 1.295826, 1, 0, 0.454902, 1,
1.43377, -0.9389175, 1.197297, 1, 0, 0.4509804, 1,
1.435374, -0.7367161, 2.165642, 1, 0, 0.4431373, 1,
1.448316, 0.9229726, -0.5060609, 1, 0, 0.4392157, 1,
1.454656, 3.20364, 1.055664, 1, 0, 0.4313726, 1,
1.458428, -1.019684, 1.666073, 1, 0, 0.427451, 1,
1.472734, 1.642222, 0.3710828, 1, 0, 0.4196078, 1,
1.475501, -0.5899119, 2.364575, 1, 0, 0.4156863, 1,
1.490993, -0.5125437, 0.4710345, 1, 0, 0.4078431, 1,
1.496964, 1.099764, 0.1081122, 1, 0, 0.4039216, 1,
1.500021, -0.7229922, 3.870018, 1, 0, 0.3960784, 1,
1.52847, 1.393815, 0.4507456, 1, 0, 0.3882353, 1,
1.541948, 1.272043, -0.2007614, 1, 0, 0.3843137, 1,
1.542381, 0.7053417, 1.241303, 1, 0, 0.3764706, 1,
1.543602, -0.5314844, 2.214303, 1, 0, 0.372549, 1,
1.545825, 0.1421455, 0.3711282, 1, 0, 0.3647059, 1,
1.549818, -0.4202732, 1.700508, 1, 0, 0.3607843, 1,
1.553521, -0.1580299, 2.762985, 1, 0, 0.3529412, 1,
1.556679, 1.591867, -0.1126026, 1, 0, 0.3490196, 1,
1.562443, -1.463474, 1.780193, 1, 0, 0.3411765, 1,
1.565083, -0.2327655, 2.403023, 1, 0, 0.3372549, 1,
1.59357, 0.6346645, -0.002156185, 1, 0, 0.3294118, 1,
1.59526, -0.01442985, 1.488301, 1, 0, 0.3254902, 1,
1.604186, 0.6354252, 0.6869267, 1, 0, 0.3176471, 1,
1.608935, 1.079713, 1.051646, 1, 0, 0.3137255, 1,
1.613737, -1.0573, 3.766689, 1, 0, 0.3058824, 1,
1.614119, 0.7363424, 2.573067, 1, 0, 0.2980392, 1,
1.624188, -0.3692632, 2.011676, 1, 0, 0.2941177, 1,
1.627428, -0.4405636, 2.143046, 1, 0, 0.2862745, 1,
1.632192, 0.4776339, 1.403862, 1, 0, 0.282353, 1,
1.632546, 2.200151, -0.996352, 1, 0, 0.2745098, 1,
1.645542, 0.8475407, 1.651003, 1, 0, 0.2705882, 1,
1.664945, 0.1007214, 1.264497, 1, 0, 0.2627451, 1,
1.674776, -0.8913053, 2.199875, 1, 0, 0.2588235, 1,
1.690809, -0.8745365, 2.125965, 1, 0, 0.2509804, 1,
1.739114, 1.702761, 0.2400972, 1, 0, 0.2470588, 1,
1.740644, 0.4359864, 0.8750777, 1, 0, 0.2392157, 1,
1.754056, 0.9811307, 1.688272, 1, 0, 0.2352941, 1,
1.755746, 0.6494809, 2.090828, 1, 0, 0.227451, 1,
1.779906, 0.7511021, 1.47065, 1, 0, 0.2235294, 1,
1.783589, 1.302139, 0.706163, 1, 0, 0.2156863, 1,
1.795119, -1.347664, 2.241038, 1, 0, 0.2117647, 1,
1.825769, 0.6417241, 2.380663, 1, 0, 0.2039216, 1,
1.835562, -0.5991557, 1.11092, 1, 0, 0.1960784, 1,
1.840626, 0.2516428, 0.8221478, 1, 0, 0.1921569, 1,
1.864117, 1.518012, -0.2957334, 1, 0, 0.1843137, 1,
1.870519, 1.697083, 0.451086, 1, 0, 0.1803922, 1,
1.909539, -1.971337, 3.169538, 1, 0, 0.172549, 1,
1.913553, 0.5584374, 0.3075312, 1, 0, 0.1686275, 1,
1.926841, 0.09720311, -0.02734423, 1, 0, 0.1607843, 1,
2.008807, 1.817662, 0.6777858, 1, 0, 0.1568628, 1,
2.056175, 0.08598218, 4.182146, 1, 0, 0.1490196, 1,
2.064743, 1.286907, 1.108945, 1, 0, 0.145098, 1,
2.076055, -0.8734007, 3.808556, 1, 0, 0.1372549, 1,
2.097158, -0.6062282, 1.456508, 1, 0, 0.1333333, 1,
2.099329, -0.9733097, 1.501299, 1, 0, 0.1254902, 1,
2.100227, -1.241355, 1.310323, 1, 0, 0.1215686, 1,
2.125482, -0.4928147, 2.021706, 1, 0, 0.1137255, 1,
2.175649, 0.5944527, 1.86545, 1, 0, 0.1098039, 1,
2.23328, -0.2041836, 1.338857, 1, 0, 0.1019608, 1,
2.242821, -0.2501853, 1.516739, 1, 0, 0.09411765, 1,
2.24549, -0.1626173, 2.070855, 1, 0, 0.09019608, 1,
2.247741, 0.8898479, -0.5725878, 1, 0, 0.08235294, 1,
2.255739, 1.241766, 0.9512252, 1, 0, 0.07843138, 1,
2.257588, 0.381011, 0.09575004, 1, 0, 0.07058824, 1,
2.261914, 1.218488, 0.5966429, 1, 0, 0.06666667, 1,
2.288087, 1.691438, 0.5219747, 1, 0, 0.05882353, 1,
2.304471, -2.263496, 1.944368, 1, 0, 0.05490196, 1,
2.309789, 1.618767, 2.275696, 1, 0, 0.04705882, 1,
2.310427, 0.3139383, 2.899993, 1, 0, 0.04313726, 1,
2.568973, 0.3658978, 2.10283, 1, 0, 0.03529412, 1,
2.746408, -0.07455872, 1.844011, 1, 0, 0.03137255, 1,
2.823577, 0.7144553, 1.148275, 1, 0, 0.02352941, 1,
2.906846, 0.5318982, -0.3107669, 1, 0, 0.01960784, 1,
3.069033, 1.4304, -0.4801234, 1, 0, 0.01176471, 1,
3.096402, 0.4573481, -0.4623297, 1, 0, 0.007843138, 1
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
-0.08375382, -4.05699, -7.37975, 0, -0.5, 0.5, 0.5,
-0.08375382, -4.05699, -7.37975, 1, -0.5, 0.5, 0.5,
-0.08375382, -4.05699, -7.37975, 1, 1.5, 0.5, 0.5,
-0.08375382, -4.05699, -7.37975, 0, 1.5, 0.5, 0.5
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
-4.341982, 0.09947991, -7.37975, 0, -0.5, 0.5, 0.5,
-4.341982, 0.09947991, -7.37975, 1, -0.5, 0.5, 0.5,
-4.341982, 0.09947991, -7.37975, 1, 1.5, 0.5, 0.5,
-4.341982, 0.09947991, -7.37975, 0, 1.5, 0.5, 0.5
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
-4.341982, -4.05699, -0.2951162, 0, -0.5, 0.5, 0.5,
-4.341982, -4.05699, -0.2951162, 1, -0.5, 0.5, 0.5,
-4.341982, -4.05699, -0.2951162, 1, 1.5, 0.5, 0.5,
-4.341982, -4.05699, -0.2951162, 0, 1.5, 0.5, 0.5
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
-3, -3.097805, -5.744834,
3, -3.097805, -5.744834,
-3, -3.097805, -5.744834,
-3, -3.257669, -6.017321,
-2, -3.097805, -5.744834,
-2, -3.257669, -6.017321,
-1, -3.097805, -5.744834,
-1, -3.257669, -6.017321,
0, -3.097805, -5.744834,
0, -3.257669, -6.017321,
1, -3.097805, -5.744834,
1, -3.257669, -6.017321,
2, -3.097805, -5.744834,
2, -3.257669, -6.017321,
3, -3.097805, -5.744834,
3, -3.257669, -6.017321
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
-3, -3.577397, -6.562292, 0, -0.5, 0.5, 0.5,
-3, -3.577397, -6.562292, 1, -0.5, 0.5, 0.5,
-3, -3.577397, -6.562292, 1, 1.5, 0.5, 0.5,
-3, -3.577397, -6.562292, 0, 1.5, 0.5, 0.5,
-2, -3.577397, -6.562292, 0, -0.5, 0.5, 0.5,
-2, -3.577397, -6.562292, 1, -0.5, 0.5, 0.5,
-2, -3.577397, -6.562292, 1, 1.5, 0.5, 0.5,
-2, -3.577397, -6.562292, 0, 1.5, 0.5, 0.5,
-1, -3.577397, -6.562292, 0, -0.5, 0.5, 0.5,
-1, -3.577397, -6.562292, 1, -0.5, 0.5, 0.5,
-1, -3.577397, -6.562292, 1, 1.5, 0.5, 0.5,
-1, -3.577397, -6.562292, 0, 1.5, 0.5, 0.5,
0, -3.577397, -6.562292, 0, -0.5, 0.5, 0.5,
0, -3.577397, -6.562292, 1, -0.5, 0.5, 0.5,
0, -3.577397, -6.562292, 1, 1.5, 0.5, 0.5,
0, -3.577397, -6.562292, 0, 1.5, 0.5, 0.5,
1, -3.577397, -6.562292, 0, -0.5, 0.5, 0.5,
1, -3.577397, -6.562292, 1, -0.5, 0.5, 0.5,
1, -3.577397, -6.562292, 1, 1.5, 0.5, 0.5,
1, -3.577397, -6.562292, 0, 1.5, 0.5, 0.5,
2, -3.577397, -6.562292, 0, -0.5, 0.5, 0.5,
2, -3.577397, -6.562292, 1, -0.5, 0.5, 0.5,
2, -3.577397, -6.562292, 1, 1.5, 0.5, 0.5,
2, -3.577397, -6.562292, 0, 1.5, 0.5, 0.5,
3, -3.577397, -6.562292, 0, -0.5, 0.5, 0.5,
3, -3.577397, -6.562292, 1, -0.5, 0.5, 0.5,
3, -3.577397, -6.562292, 1, 1.5, 0.5, 0.5,
3, -3.577397, -6.562292, 0, 1.5, 0.5, 0.5
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
-3.359314, -3, -5.744834,
-3.359314, 3, -5.744834,
-3.359314, -3, -5.744834,
-3.523092, -3, -6.017321,
-3.359314, -2, -5.744834,
-3.523092, -2, -6.017321,
-3.359314, -1, -5.744834,
-3.523092, -1, -6.017321,
-3.359314, 0, -5.744834,
-3.523092, 0, -6.017321,
-3.359314, 1, -5.744834,
-3.523092, 1, -6.017321,
-3.359314, 2, -5.744834,
-3.523092, 2, -6.017321,
-3.359314, 3, -5.744834,
-3.523092, 3, -6.017321
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
-3.850648, -3, -6.562292, 0, -0.5, 0.5, 0.5,
-3.850648, -3, -6.562292, 1, -0.5, 0.5, 0.5,
-3.850648, -3, -6.562292, 1, 1.5, 0.5, 0.5,
-3.850648, -3, -6.562292, 0, 1.5, 0.5, 0.5,
-3.850648, -2, -6.562292, 0, -0.5, 0.5, 0.5,
-3.850648, -2, -6.562292, 1, -0.5, 0.5, 0.5,
-3.850648, -2, -6.562292, 1, 1.5, 0.5, 0.5,
-3.850648, -2, -6.562292, 0, 1.5, 0.5, 0.5,
-3.850648, -1, -6.562292, 0, -0.5, 0.5, 0.5,
-3.850648, -1, -6.562292, 1, -0.5, 0.5, 0.5,
-3.850648, -1, -6.562292, 1, 1.5, 0.5, 0.5,
-3.850648, -1, -6.562292, 0, 1.5, 0.5, 0.5,
-3.850648, 0, -6.562292, 0, -0.5, 0.5, 0.5,
-3.850648, 0, -6.562292, 1, -0.5, 0.5, 0.5,
-3.850648, 0, -6.562292, 1, 1.5, 0.5, 0.5,
-3.850648, 0, -6.562292, 0, 1.5, 0.5, 0.5,
-3.850648, 1, -6.562292, 0, -0.5, 0.5, 0.5,
-3.850648, 1, -6.562292, 1, -0.5, 0.5, 0.5,
-3.850648, 1, -6.562292, 1, 1.5, 0.5, 0.5,
-3.850648, 1, -6.562292, 0, 1.5, 0.5, 0.5,
-3.850648, 2, -6.562292, 0, -0.5, 0.5, 0.5,
-3.850648, 2, -6.562292, 1, -0.5, 0.5, 0.5,
-3.850648, 2, -6.562292, 1, 1.5, 0.5, 0.5,
-3.850648, 2, -6.562292, 0, 1.5, 0.5, 0.5,
-3.850648, 3, -6.562292, 0, -0.5, 0.5, 0.5,
-3.850648, 3, -6.562292, 1, -0.5, 0.5, 0.5,
-3.850648, 3, -6.562292, 1, 1.5, 0.5, 0.5,
-3.850648, 3, -6.562292, 0, 1.5, 0.5, 0.5
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
-3.359314, -3.097805, -4,
-3.359314, -3.097805, 4,
-3.359314, -3.097805, -4,
-3.523092, -3.257669, -4,
-3.359314, -3.097805, -2,
-3.523092, -3.257669, -2,
-3.359314, -3.097805, 0,
-3.523092, -3.257669, 0,
-3.359314, -3.097805, 2,
-3.523092, -3.257669, 2,
-3.359314, -3.097805, 4,
-3.523092, -3.257669, 4
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
-3.850648, -3.577397, -4, 0, -0.5, 0.5, 0.5,
-3.850648, -3.577397, -4, 1, -0.5, 0.5, 0.5,
-3.850648, -3.577397, -4, 1, 1.5, 0.5, 0.5,
-3.850648, -3.577397, -4, 0, 1.5, 0.5, 0.5,
-3.850648, -3.577397, -2, 0, -0.5, 0.5, 0.5,
-3.850648, -3.577397, -2, 1, -0.5, 0.5, 0.5,
-3.850648, -3.577397, -2, 1, 1.5, 0.5, 0.5,
-3.850648, -3.577397, -2, 0, 1.5, 0.5, 0.5,
-3.850648, -3.577397, 0, 0, -0.5, 0.5, 0.5,
-3.850648, -3.577397, 0, 1, -0.5, 0.5, 0.5,
-3.850648, -3.577397, 0, 1, 1.5, 0.5, 0.5,
-3.850648, -3.577397, 0, 0, 1.5, 0.5, 0.5,
-3.850648, -3.577397, 2, 0, -0.5, 0.5, 0.5,
-3.850648, -3.577397, 2, 1, -0.5, 0.5, 0.5,
-3.850648, -3.577397, 2, 1, 1.5, 0.5, 0.5,
-3.850648, -3.577397, 2, 0, 1.5, 0.5, 0.5,
-3.850648, -3.577397, 4, 0, -0.5, 0.5, 0.5,
-3.850648, -3.577397, 4, 1, -0.5, 0.5, 0.5,
-3.850648, -3.577397, 4, 1, 1.5, 0.5, 0.5,
-3.850648, -3.577397, 4, 0, 1.5, 0.5, 0.5
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
-3.359314, -3.097805, -5.744834,
-3.359314, 3.296764, -5.744834,
-3.359314, -3.097805, 5.154602,
-3.359314, 3.296764, 5.154602,
-3.359314, -3.097805, -5.744834,
-3.359314, -3.097805, 5.154602,
-3.359314, 3.296764, -5.744834,
-3.359314, 3.296764, 5.154602,
-3.359314, -3.097805, -5.744834,
3.191807, -3.097805, -5.744834,
-3.359314, -3.097805, 5.154602,
3.191807, -3.097805, 5.154602,
-3.359314, 3.296764, -5.744834,
3.191807, 3.296764, -5.744834,
-3.359314, 3.296764, 5.154602,
3.191807, 3.296764, 5.154602,
3.191807, -3.097805, -5.744834,
3.191807, 3.296764, -5.744834,
3.191807, -3.097805, 5.154602,
3.191807, 3.296764, 5.154602,
3.191807, -3.097805, -5.744834,
3.191807, -3.097805, 5.154602,
3.191807, 3.296764, -5.744834,
3.191807, 3.296764, 5.154602
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
var radius = 7.600655;
var distance = 33.81617;
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
mvMatrix.translate( 0.08375382, -0.09947991, 0.2951162 );
mvMatrix.scale( 1.254438, 1.285149, 0.7539818 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81617);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
carboxylic_acid<-read.table("carboxylic_acid.xyz")
```

```
## Error in read.table("carboxylic_acid.xyz"): no lines available in input
```

```r
x<-carboxylic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
```

```r
y<-carboxylic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
```

```r
z<-carboxylic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
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
-3.26391, -2.23573, -0.5216806, 0, 0, 1, 1, 1,
-3.119664, 0.4139973, -0.1360482, 1, 0, 0, 1, 1,
-3.109337, 0.3753997, -1.685495, 1, 0, 0, 1, 1,
-2.934506, -0.06852015, -0.9212245, 1, 0, 0, 1, 1,
-2.725894, -1.233024, 0.05580869, 1, 0, 0, 1, 1,
-2.708164, -0.1850633, -3.017966, 1, 0, 0, 1, 1,
-2.627666, -0.4657473, -2.387162, 0, 0, 0, 1, 1,
-2.602224, -0.1542077, -1.212927, 0, 0, 0, 1, 1,
-2.589776, 0.4394185, -1.72185, 0, 0, 0, 1, 1,
-2.573349, 0.6706018, -0.9111564, 0, 0, 0, 1, 1,
-2.528872, -0.04188383, -2.920803, 0, 0, 0, 1, 1,
-2.423291, 1.133597, -2.067675, 0, 0, 0, 1, 1,
-2.403113, 1.313891, -0.8605715, 0, 0, 0, 1, 1,
-2.380194, 0.3577158, -0.792039, 1, 1, 1, 1, 1,
-2.376613, 0.4868332, -0.5040826, 1, 1, 1, 1, 1,
-2.358793, -1.165229, -1.946279, 1, 1, 1, 1, 1,
-2.285318, 0.1580845, -0.9446231, 1, 1, 1, 1, 1,
-2.236476, 0.4462759, -2.201196, 1, 1, 1, 1, 1,
-2.225274, -0.6849161, -1.072549, 1, 1, 1, 1, 1,
-2.200117, -0.8741993, -3.663755, 1, 1, 1, 1, 1,
-2.113013, -0.2999732, -1.505441, 1, 1, 1, 1, 1,
-2.10212, 2.02692, -0.8949988, 1, 1, 1, 1, 1,
-2.080325, -0.545967, -2.541642, 1, 1, 1, 1, 1,
-2.076269, 0.6238339, -0.6348961, 1, 1, 1, 1, 1,
-2.068125, 0.5036457, -2.387766, 1, 1, 1, 1, 1,
-2.013106, 1.8275, -2.122828, 1, 1, 1, 1, 1,
-2.000709, -0.6519809, -2.317628, 1, 1, 1, 1, 1,
-1.993271, 0.7995819, -1.131474, 1, 1, 1, 1, 1,
-1.968669, -0.3479064, -2.494831, 0, 0, 1, 1, 1,
-1.966357, -0.1673369, -2.987414, 1, 0, 0, 1, 1,
-1.936819, -1.426726, -1.982493, 1, 0, 0, 1, 1,
-1.912732, 0.7192888, -1.410365, 1, 0, 0, 1, 1,
-1.907863, 0.1136253, -2.366317, 1, 0, 0, 1, 1,
-1.906149, 0.4094949, -0.6092536, 1, 0, 0, 1, 1,
-1.8924, -0.1725691, -1.035885, 0, 0, 0, 1, 1,
-1.881081, 1.010764, -1.808333, 0, 0, 0, 1, 1,
-1.825764, -0.2673918, -1.320802, 0, 0, 0, 1, 1,
-1.816701, 0.4764825, -0.975373, 0, 0, 0, 1, 1,
-1.784874, 0.1280657, 1.181611, 0, 0, 0, 1, 1,
-1.771643, -1.515699, -3.481808, 0, 0, 0, 1, 1,
-1.746139, 1.761735, -1.656502, 0, 0, 0, 1, 1,
-1.745107, 1.200286, -0.7263964, 1, 1, 1, 1, 1,
-1.743843, -0.009275068, -2.205616, 1, 1, 1, 1, 1,
-1.74296, 0.8468734, -2.019051, 1, 1, 1, 1, 1,
-1.733659, 1.381822, 0.3973398, 1, 1, 1, 1, 1,
-1.690196, 0.7267438, -2.553159, 1, 1, 1, 1, 1,
-1.687469, -1.244881, -1.511252, 1, 1, 1, 1, 1,
-1.663597, -0.496923, -2.801145, 1, 1, 1, 1, 1,
-1.644518, -0.3286471, -2.378476, 1, 1, 1, 1, 1,
-1.596454, -0.4072703, -2.520751, 1, 1, 1, 1, 1,
-1.594508, -1.265854, -2.989476, 1, 1, 1, 1, 1,
-1.589719, -0.5499629, -2.15364, 1, 1, 1, 1, 1,
-1.581794, -0.26911, -1.823797, 1, 1, 1, 1, 1,
-1.567646, 0.6851494, -1.813157, 1, 1, 1, 1, 1,
-1.556172, -1.978271, -0.9488689, 1, 1, 1, 1, 1,
-1.553749, -1.454829, -0.9086264, 1, 1, 1, 1, 1,
-1.553722, -1.599719, -1.886552, 0, 0, 1, 1, 1,
-1.552415, -0.4787667, -1.098338, 1, 0, 0, 1, 1,
-1.551556, -0.9356334, -3.130743, 1, 0, 0, 1, 1,
-1.548177, -0.144286, 0.7563462, 1, 0, 0, 1, 1,
-1.541226, -1.583452, -2.535055, 1, 0, 0, 1, 1,
-1.538669, 0.3656721, -1.442775, 1, 0, 0, 1, 1,
-1.536125, 0.5475548, 0.007991461, 0, 0, 0, 1, 1,
-1.527752, -0.05132889, -1.227455, 0, 0, 0, 1, 1,
-1.525024, -0.8455354, -1.579746, 0, 0, 0, 1, 1,
-1.515057, -0.1204299, -1.811024, 0, 0, 0, 1, 1,
-1.50546, 1.216209, -1.142726, 0, 0, 0, 1, 1,
-1.504834, -1.281914, -0.8340337, 0, 0, 0, 1, 1,
-1.494906, -0.292375, 0.2847956, 0, 0, 0, 1, 1,
-1.478134, -2.443738, -1.127313, 1, 1, 1, 1, 1,
-1.467907, 1.527678, -1.277766, 1, 1, 1, 1, 1,
-1.448545, 1.121487, -0.6478568, 1, 1, 1, 1, 1,
-1.438671, 0.6319116, -0.5275249, 1, 1, 1, 1, 1,
-1.434375, 0.6019356, -0.7495456, 1, 1, 1, 1, 1,
-1.40282, -1.091348, -2.871247, 1, 1, 1, 1, 1,
-1.390674, -0.7441936, -3.583123, 1, 1, 1, 1, 1,
-1.390626, -0.3857473, -1.406724, 1, 1, 1, 1, 1,
-1.378842, -0.7086327, -2.61693, 1, 1, 1, 1, 1,
-1.376666, 0.4951736, -1.488255, 1, 1, 1, 1, 1,
-1.367262, 1.214339, -0.7448883, 1, 1, 1, 1, 1,
-1.360568, 1.701624, -0.8639999, 1, 1, 1, 1, 1,
-1.353529, 0.07192382, -0.4022599, 1, 1, 1, 1, 1,
-1.343667, 0.7725278, -1.137592, 1, 1, 1, 1, 1,
-1.342883, 0.6225875, -2.636277, 1, 1, 1, 1, 1,
-1.336484, 0.9731678, -1.431425, 0, 0, 1, 1, 1,
-1.332474, -0.3512651, -1.006024, 1, 0, 0, 1, 1,
-1.327723, -1.07365, -3.754127, 1, 0, 0, 1, 1,
-1.324616, -0.4896111, -2.066753, 1, 0, 0, 1, 1,
-1.323788, -0.7820308, -2.518075, 1, 0, 0, 1, 1,
-1.321451, 1.422486, -2.179461, 1, 0, 0, 1, 1,
-1.31287, -0.2285475, -3.69422, 0, 0, 0, 1, 1,
-1.300997, 0.3347438, 0.1454966, 0, 0, 0, 1, 1,
-1.280644, -1.870658, -4.120521, 0, 0, 0, 1, 1,
-1.279435, 0.3243932, -2.089992, 0, 0, 0, 1, 1,
-1.276651, -0.6826867, -2.894937, 0, 0, 0, 1, 1,
-1.270474, -0.11695, -1.60256, 0, 0, 0, 1, 1,
-1.258811, 0.9261976, -3.435183, 0, 0, 0, 1, 1,
-1.243902, 0.9171126, 0.9389783, 1, 1, 1, 1, 1,
-1.235073, 0.6472196, -2.417715, 1, 1, 1, 1, 1,
-1.234634, -0.2058422, -1.676745, 1, 1, 1, 1, 1,
-1.227875, 1.28097, -1.328438, 1, 1, 1, 1, 1,
-1.221889, -1.664657, -2.013141, 1, 1, 1, 1, 1,
-1.220755, 0.8305976, -1.495073, 1, 1, 1, 1, 1,
-1.217949, 1.04723, -0.8509753, 1, 1, 1, 1, 1,
-1.206252, 0.3062066, -1.202662, 1, 1, 1, 1, 1,
-1.193983, 1.078562, -0.5997822, 1, 1, 1, 1, 1,
-1.193938, -0.07199301, -2.816328, 1, 1, 1, 1, 1,
-1.192878, 0.2618466, -3.885702, 1, 1, 1, 1, 1,
-1.189361, -1.027042, -3.221681, 1, 1, 1, 1, 1,
-1.187144, 0.07009932, -0.9307534, 1, 1, 1, 1, 1,
-1.176226, -0.2447178, -1.583918, 1, 1, 1, 1, 1,
-1.168928, -0.6513654, -2.79117, 1, 1, 1, 1, 1,
-1.159195, -0.9995073, -1.080782, 0, 0, 1, 1, 1,
-1.152342, -1.605345, -1.965746, 1, 0, 0, 1, 1,
-1.152192, 0.7028347, -1.798628, 1, 0, 0, 1, 1,
-1.144109, 0.6277086, -2.745304, 1, 0, 0, 1, 1,
-1.138509, 1.421045, -1.288632, 1, 0, 0, 1, 1,
-1.13543, -0.3377198, -1.366132, 1, 0, 0, 1, 1,
-1.134559, -0.3074272, -1.448884, 0, 0, 0, 1, 1,
-1.134329, 1.232048, -1.797959, 0, 0, 0, 1, 1,
-1.129088, 1.51395, -0.7703602, 0, 0, 0, 1, 1,
-1.12333, 0.4170323, -1.83771, 0, 0, 0, 1, 1,
-1.123276, 1.520383, 0.5400707, 0, 0, 0, 1, 1,
-1.1231, 1.48944, -0.1944642, 0, 0, 0, 1, 1,
-1.121183, 0.1531333, -1.240727, 0, 0, 0, 1, 1,
-1.11674, 1.824186, 0.1632621, 1, 1, 1, 1, 1,
-1.109205, 0.8022838, -0.9912429, 1, 1, 1, 1, 1,
-1.103697, 0.1164026, -1.793597, 1, 1, 1, 1, 1,
-1.099579, -0.9968693, -1.858636, 1, 1, 1, 1, 1,
-1.089312, -1.227046, -1.451461, 1, 1, 1, 1, 1,
-1.087819, 0.32418, -1.867692, 1, 1, 1, 1, 1,
-1.084191, -1.005427, -2.036372, 1, 1, 1, 1, 1,
-1.081016, 1.446406, -0.693895, 1, 1, 1, 1, 1,
-1.078286, 1.816316, -0.3379571, 1, 1, 1, 1, 1,
-1.063978, -0.6483822, 0.02490493, 1, 1, 1, 1, 1,
-1.052663, 1.91315, -1.401506, 1, 1, 1, 1, 1,
-1.047668, -0.9940731, -2.858973, 1, 1, 1, 1, 1,
-1.044231, -0.6294722, -1.65459, 1, 1, 1, 1, 1,
-1.044075, 0.1611857, -2.434343, 1, 1, 1, 1, 1,
-1.041504, 1.08333, -2.283079, 1, 1, 1, 1, 1,
-1.040151, -0.2320654, -1.205516, 0, 0, 1, 1, 1,
-1.034106, -0.5745129, -1.119009, 1, 0, 0, 1, 1,
-1.032739, -1.781924, -3.002395, 1, 0, 0, 1, 1,
-1.031786, 0.7737164, -0.2236859, 1, 0, 0, 1, 1,
-1.027634, -0.1838426, -0.7839578, 1, 0, 0, 1, 1,
-1.02065, 1.265072, 0.6511878, 1, 0, 0, 1, 1,
-1.020637, -0.3725424, -2.985284, 0, 0, 0, 1, 1,
-1.017321, -1.264822, -3.602392, 0, 0, 0, 1, 1,
-1.016792, -0.151875, -0.7161768, 0, 0, 0, 1, 1,
-1.016349, -0.04514663, -3.576004, 0, 0, 0, 1, 1,
-1.012596, -0.8979268, -2.217484, 0, 0, 0, 1, 1,
-1.005937, 1.742672, 0.6820489, 0, 0, 0, 1, 1,
-1.003379, -0.1052487, -2.177262, 0, 0, 0, 1, 1,
-1.001816, 0.7472199, -0.2943788, 1, 1, 1, 1, 1,
-1.001306, -2.337696, -4.201864, 1, 1, 1, 1, 1,
-1.001207, 1.651143, -2.392144, 1, 1, 1, 1, 1,
-0.9927067, -1.023639, -2.572336, 1, 1, 1, 1, 1,
-0.9926776, -0.04342552, -1.797228, 1, 1, 1, 1, 1,
-0.9919943, -0.08496557, -3.346192, 1, 1, 1, 1, 1,
-0.9879884, -1.52967, -3.759144, 1, 1, 1, 1, 1,
-0.9788408, -1.047339, -1.626994, 1, 1, 1, 1, 1,
-0.9686908, -0.2035857, -1.998428, 1, 1, 1, 1, 1,
-0.9564688, 0.09728985, 0.1710437, 1, 1, 1, 1, 1,
-0.9552762, 1.140816, -1.742215, 1, 1, 1, 1, 1,
-0.9414859, 0.6915277, 0.6419515, 1, 1, 1, 1, 1,
-0.9391351, -0.4725954, -0.343062, 1, 1, 1, 1, 1,
-0.9376742, 0.791415, -0.7923657, 1, 1, 1, 1, 1,
-0.9346678, -0.7026348, -1.222684, 1, 1, 1, 1, 1,
-0.9343181, 0.2159877, -2.872959, 0, 0, 1, 1, 1,
-0.9285104, 0.9084384, 0.6088502, 1, 0, 0, 1, 1,
-0.9264842, -0.2037863, -2.117409, 1, 0, 0, 1, 1,
-0.9260299, -0.7710724, -1.775815, 1, 0, 0, 1, 1,
-0.9230034, 0.3537574, -2.917884, 1, 0, 0, 1, 1,
-0.9171079, -1.214537, -1.806636, 1, 0, 0, 1, 1,
-0.9113308, 0.05477367, -2.32463, 0, 0, 0, 1, 1,
-0.909966, 0.8131757, -0.2395104, 0, 0, 0, 1, 1,
-0.90491, 1.329895, -1.725257, 0, 0, 0, 1, 1,
-0.8981316, 0.5819746, -2.784167, 0, 0, 0, 1, 1,
-0.8979004, -0.6505957, -1.995781, 0, 0, 0, 1, 1,
-0.894834, 1.725557, -0.5207641, 0, 0, 0, 1, 1,
-0.8945189, 0.4858242, -0.727479, 0, 0, 0, 1, 1,
-0.894325, 1.44807, 0.6316203, 1, 1, 1, 1, 1,
-0.8939509, 1.368082, 0.09523803, 1, 1, 1, 1, 1,
-0.8918988, 0.182823, -2.901651, 1, 1, 1, 1, 1,
-0.8885917, -3.00468, -5.318502, 1, 1, 1, 1, 1,
-0.888384, 1.514951, 0.3903856, 1, 1, 1, 1, 1,
-0.882404, 0.5431279, -0.8541082, 1, 1, 1, 1, 1,
-0.8788387, 0.0500388, -0.8919608, 1, 1, 1, 1, 1,
-0.8668766, -0.825496, -0.1366994, 1, 1, 1, 1, 1,
-0.8528461, -1.387011, -4.177945, 1, 1, 1, 1, 1,
-0.8498572, 0.3392007, -0.3280071, 1, 1, 1, 1, 1,
-0.8480747, 1.185417, 0.2918102, 1, 1, 1, 1, 1,
-0.8441429, 0.09517832, -0.9749752, 1, 1, 1, 1, 1,
-0.8410969, -0.5735781, -2.132513, 1, 1, 1, 1, 1,
-0.8407888, -0.189402, -0.2338627, 1, 1, 1, 1, 1,
-0.8395654, 0.181683, -2.534933, 1, 1, 1, 1, 1,
-0.8339404, -1.650008, -0.8240418, 0, 0, 1, 1, 1,
-0.8312492, -1.068555, -2.011673, 1, 0, 0, 1, 1,
-0.8297042, -1.786944, -2.534663, 1, 0, 0, 1, 1,
-0.8288947, 0.6860567, -1.09611, 1, 0, 0, 1, 1,
-0.8228728, 0.2221968, -1.699409, 1, 0, 0, 1, 1,
-0.8166071, 0.5680042, -0.816188, 1, 0, 0, 1, 1,
-0.8131171, 0.3751736, -0.3234896, 0, 0, 0, 1, 1,
-0.8130578, -1.279599, -3.315104, 0, 0, 0, 1, 1,
-0.8130293, -0.2449884, -2.931982, 0, 0, 0, 1, 1,
-0.8124961, 0.880586, 0.9392135, 0, 0, 0, 1, 1,
-0.8036529, 1.424021, -0.2966115, 0, 0, 0, 1, 1,
-0.8033014, 1.061225, -1.520698, 0, 0, 0, 1, 1,
-0.7996916, -0.8615777, -2.473879, 0, 0, 0, 1, 1,
-0.7959407, -0.1615585, -2.16731, 1, 1, 1, 1, 1,
-0.7899194, 0.2168613, -1.790644, 1, 1, 1, 1, 1,
-0.779637, 2.482724, 0.09845924, 1, 1, 1, 1, 1,
-0.7791973, -0.6337111, -1.575894, 1, 1, 1, 1, 1,
-0.7785286, 0.5593675, 0.1161646, 1, 1, 1, 1, 1,
-0.7777174, -0.668636, -4.003477, 1, 1, 1, 1, 1,
-0.7696197, -0.6490988, -2.784144, 1, 1, 1, 1, 1,
-0.7647742, 0.3967214, -0.2879485, 1, 1, 1, 1, 1,
-0.7647128, 0.1786397, -0.321288, 1, 1, 1, 1, 1,
-0.7637828, 0.07405571, -0.7727717, 1, 1, 1, 1, 1,
-0.7560798, 2.085677, 1.528581, 1, 1, 1, 1, 1,
-0.7549664, 0.5711231, -0.9262455, 1, 1, 1, 1, 1,
-0.7493794, 1.147539, -0.5088538, 1, 1, 1, 1, 1,
-0.7412247, -0.5562606, -1.111945, 1, 1, 1, 1, 1,
-0.7385399, 0.8292738, -0.6750214, 1, 1, 1, 1, 1,
-0.7382827, -0.9514103, -1.502659, 0, 0, 1, 1, 1,
-0.7363733, -0.3351454, -0.9324182, 1, 0, 0, 1, 1,
-0.7349931, 0.6699708, -0.48885, 1, 0, 0, 1, 1,
-0.7340197, 1.797899, 0.5685698, 1, 0, 0, 1, 1,
-0.7279034, 0.4375991, -0.0157849, 1, 0, 0, 1, 1,
-0.7277125, 0.9682817, -1.8982, 1, 0, 0, 1, 1,
-0.7239804, -0.4011026, -1.992136, 0, 0, 0, 1, 1,
-0.7182541, 0.3715851, -0.7043825, 0, 0, 0, 1, 1,
-0.7152228, -1.099205, -1.641461, 0, 0, 0, 1, 1,
-0.7148011, -0.3861365, -1.504306, 0, 0, 0, 1, 1,
-0.7113337, 0.1497737, -3.348806, 0, 0, 0, 1, 1,
-0.71026, -0.00386988, -0.9100043, 0, 0, 0, 1, 1,
-0.7088934, 0.2899582, -0.004959479, 0, 0, 0, 1, 1,
-0.7047089, 0.4581946, -2.9739, 1, 1, 1, 1, 1,
-0.7029791, -0.4615969, -3.141346, 1, 1, 1, 1, 1,
-0.6967536, -0.3591935, -2.012227, 1, 1, 1, 1, 1,
-0.694232, 0.5165875, -1.541664, 1, 1, 1, 1, 1,
-0.6922033, 1.088062, -0.8662369, 1, 1, 1, 1, 1,
-0.6918609, 0.5892998, -0.228539, 1, 1, 1, 1, 1,
-0.6899291, -0.7995467, -3.770507, 1, 1, 1, 1, 1,
-0.6876259, 0.5718427, -0.7765902, 1, 1, 1, 1, 1,
-0.6834499, -0.6024992, -3.373359, 1, 1, 1, 1, 1,
-0.6826988, -0.2889063, -1.984655, 1, 1, 1, 1, 1,
-0.6826061, 0.5002876, -1.940918, 1, 1, 1, 1, 1,
-0.6818872, 1.049309, 0.7092599, 1, 1, 1, 1, 1,
-0.6807883, -2.001364, -2.248207, 1, 1, 1, 1, 1,
-0.6730233, 0.5780258, -2.316021, 1, 1, 1, 1, 1,
-0.6721246, -0.2071532, -2.026234, 1, 1, 1, 1, 1,
-0.6700274, 0.3460253, -1.87366, 0, 0, 1, 1, 1,
-0.6640651, 0.8508697, -1.150639, 1, 0, 0, 1, 1,
-0.6618524, -0.576726, -3.195393, 1, 0, 0, 1, 1,
-0.6599424, 0.5594882, -1.684046, 1, 0, 0, 1, 1,
-0.6557994, -0.2465671, -1.395377, 1, 0, 0, 1, 1,
-0.6557198, -0.1413409, -0.8026268, 1, 0, 0, 1, 1,
-0.6422104, -1.245271, -2.391311, 0, 0, 0, 1, 1,
-0.635802, 1.416185, -1.049809, 0, 0, 0, 1, 1,
-0.6339591, -1.670867, -2.53046, 0, 0, 0, 1, 1,
-0.6267993, 0.2453086, -2.872939, 0, 0, 0, 1, 1,
-0.6265023, -0.6767255, -1.290191, 0, 0, 0, 1, 1,
-0.6257238, -0.3508479, -2.461496, 0, 0, 0, 1, 1,
-0.6145991, -0.4946729, -1.012386, 0, 0, 0, 1, 1,
-0.6122966, -0.3880339, -2.009714, 1, 1, 1, 1, 1,
-0.6070662, -0.6513473, -2.463536, 1, 1, 1, 1, 1,
-0.6054758, 0.8500195, -2.037027, 1, 1, 1, 1, 1,
-0.6034392, 1.117651, -0.1392973, 1, 1, 1, 1, 1,
-0.6004512, 0.4055494, -1.135081, 1, 1, 1, 1, 1,
-0.600137, 0.3587385, -0.02542641, 1, 1, 1, 1, 1,
-0.5970484, -0.8606979, -3.054484, 1, 1, 1, 1, 1,
-0.5963341, -0.06344758, -1.085588, 1, 1, 1, 1, 1,
-0.5957707, 0.3550852, -2.21724, 1, 1, 1, 1, 1,
-0.5929979, -0.5857492, -2.794601, 1, 1, 1, 1, 1,
-0.591598, -1.216921, -5.204323, 1, 1, 1, 1, 1,
-0.5910035, 0.2408839, -0.3947204, 1, 1, 1, 1, 1,
-0.5880518, 1.008484, -0.4557371, 1, 1, 1, 1, 1,
-0.5876449, 0.2930533, -2.487078, 1, 1, 1, 1, 1,
-0.5795677, 0.4640821, -2.606909, 1, 1, 1, 1, 1,
-0.5761721, 0.1466925, -1.972293, 0, 0, 1, 1, 1,
-0.5730361, -0.2952033, -1.981826, 1, 0, 0, 1, 1,
-0.5696341, 0.2062577, -1.112597, 1, 0, 0, 1, 1,
-0.5692784, -0.4233956, -4.158845, 1, 0, 0, 1, 1,
-0.5617799, 0.4486289, -0.351045, 1, 0, 0, 1, 1,
-0.56162, 0.2547733, -0.8979068, 1, 0, 0, 1, 1,
-0.5615781, 0.235063, -1.352175, 0, 0, 0, 1, 1,
-0.5603051, -1.314344, -1.354281, 0, 0, 0, 1, 1,
-0.5462233, 0.7479438, -1.913566, 0, 0, 0, 1, 1,
-0.5457034, -0.4480108, -3.88734, 0, 0, 0, 1, 1,
-0.5446694, 1.224624, 2.961353, 0, 0, 0, 1, 1,
-0.5446459, 1.132001, -0.329258, 0, 0, 0, 1, 1,
-0.5446095, 0.08871476, -2.222729, 0, 0, 0, 1, 1,
-0.5409091, 1.317711, -0.7458101, 1, 1, 1, 1, 1,
-0.5345638, -1.059379, -0.4977256, 1, 1, 1, 1, 1,
-0.5339986, 0.2750352, -1.197115, 1, 1, 1, 1, 1,
-0.5309657, -0.882356, -2.57543, 1, 1, 1, 1, 1,
-0.5305169, -1.478429, -2.552406, 1, 1, 1, 1, 1,
-0.5302713, -1.974029, -2.067525, 1, 1, 1, 1, 1,
-0.529523, -0.9695133, -0.8552926, 1, 1, 1, 1, 1,
-0.5292222, 0.05959959, 0.4046285, 1, 1, 1, 1, 1,
-0.520299, 0.4628444, 0.2224109, 1, 1, 1, 1, 1,
-0.5176923, 0.7736943, -0.7543133, 1, 1, 1, 1, 1,
-0.5157055, 0.1291245, 0.6032154, 1, 1, 1, 1, 1,
-0.5143592, 0.8612211, -0.1353802, 1, 1, 1, 1, 1,
-0.5114493, 0.5534419, 0.4126892, 1, 1, 1, 1, 1,
-0.5064981, 2.533097, -0.2685653, 1, 1, 1, 1, 1,
-0.5006697, -0.5320815, -1.52427, 1, 1, 1, 1, 1,
-0.497197, -0.217887, -3.952461, 0, 0, 1, 1, 1,
-0.4898687, 1.172464, 0.4236078, 1, 0, 0, 1, 1,
-0.4868298, -0.3057478, -2.972376, 1, 0, 0, 1, 1,
-0.4834894, -0.9881197, -0.7995418, 1, 0, 0, 1, 1,
-0.4794774, -0.2973013, -2.300109, 1, 0, 0, 1, 1,
-0.4726299, -1.786489, -3.084077, 1, 0, 0, 1, 1,
-0.466989, 0.827376, 0.6758145, 0, 0, 0, 1, 1,
-0.4653598, 0.6944039, 0.1993433, 0, 0, 0, 1, 1,
-0.4519421, -1.062045, -2.306201, 0, 0, 0, 1, 1,
-0.4477268, 0.4146394, 1.608577, 0, 0, 0, 1, 1,
-0.4468006, -1.64541, -3.011681, 0, 0, 0, 1, 1,
-0.4446112, -0.1794913, -0.9583314, 0, 0, 0, 1, 1,
-0.4439454, 1.665916, -0.4437003, 0, 0, 0, 1, 1,
-0.4390713, -0.1735295, -0.753485, 1, 1, 1, 1, 1,
-0.43437, -2.116294, -1.785182, 1, 1, 1, 1, 1,
-0.4335988, -0.5429126, -1.307472, 1, 1, 1, 1, 1,
-0.4320582, -0.7644815, -1.852155, 1, 1, 1, 1, 1,
-0.428316, -0.5381942, -3.543519, 1, 1, 1, 1, 1,
-0.4282123, 0.4865778, -1.775528, 1, 1, 1, 1, 1,
-0.4259838, -0.8939061, -3.246014, 1, 1, 1, 1, 1,
-0.4235471, -1.254746, -5.356689, 1, 1, 1, 1, 1,
-0.4211026, 1.014105, -0.5962291, 1, 1, 1, 1, 1,
-0.4181046, -0.2868192, -1.263707, 1, 1, 1, 1, 1,
-0.4120751, 0.6074304, 0.2870203, 1, 1, 1, 1, 1,
-0.4116666, 0.8379501, -1.251612, 1, 1, 1, 1, 1,
-0.4110982, 1.91686, -0.3715808, 1, 1, 1, 1, 1,
-0.410258, 0.3525068, -1.301133, 1, 1, 1, 1, 1,
-0.4094837, 0.3678501, -0.1771263, 1, 1, 1, 1, 1,
-0.4079442, -0.862002, -2.069327, 0, 0, 1, 1, 1,
-0.4075451, -1.725691, -4.009117, 1, 0, 0, 1, 1,
-0.4009794, 0.6674786, -1.297718, 1, 0, 0, 1, 1,
-0.3993773, 0.6790679, -0.909286, 1, 0, 0, 1, 1,
-0.3969472, 0.1059019, -1.258406, 1, 0, 0, 1, 1,
-0.3968416, 0.9601322, -1.165337, 1, 0, 0, 1, 1,
-0.39643, 0.5682979, -1.136875, 0, 0, 0, 1, 1,
-0.3956029, 1.761088, 1.608012, 0, 0, 0, 1, 1,
-0.3927092, 0.3548785, -0.1556548, 0, 0, 0, 1, 1,
-0.3925974, -1.58086, -3.845835, 0, 0, 0, 1, 1,
-0.392549, -1.073046, -3.654766, 0, 0, 0, 1, 1,
-0.3916164, -0.4420974, -3.185463, 0, 0, 0, 1, 1,
-0.3901221, -0.3724881, -2.481604, 0, 0, 0, 1, 1,
-0.3891668, 0.4921605, -1.728218, 1, 1, 1, 1, 1,
-0.3876082, 2.145096, 1.304715, 1, 1, 1, 1, 1,
-0.3855729, -0.1590172, -1.810817, 1, 1, 1, 1, 1,
-0.3805507, -0.07325296, -2.202687, 1, 1, 1, 1, 1,
-0.3764342, 0.2353772, -0.7285487, 1, 1, 1, 1, 1,
-0.3762168, 0.670871, 0.3627646, 1, 1, 1, 1, 1,
-0.3686155, 0.5077825, 0.9546787, 1, 1, 1, 1, 1,
-0.3678509, 0.4156372, 1.311714, 1, 1, 1, 1, 1,
-0.3642325, -0.4488906, -1.788579, 1, 1, 1, 1, 1,
-0.3577566, -1.421711, -3.004579, 1, 1, 1, 1, 1,
-0.3572141, -1.837536, -1.993338, 1, 1, 1, 1, 1,
-0.3538405, -1.370265, -4.271283, 1, 1, 1, 1, 1,
-0.3529115, -1.248463, -3.78802, 1, 1, 1, 1, 1,
-0.3495741, 1.226178, 0.05303074, 1, 1, 1, 1, 1,
-0.348239, -0.1401765, -1.830058, 1, 1, 1, 1, 1,
-0.3423662, -0.8176264, -2.151258, 0, 0, 1, 1, 1,
-0.3423451, -0.2139016, -2.612475, 1, 0, 0, 1, 1,
-0.3422153, 1.215107, -0.4641517, 1, 0, 0, 1, 1,
-0.3276624, 1.327184, -0.09624995, 1, 0, 0, 1, 1,
-0.3210733, -1.260632, -1.993621, 1, 0, 0, 1, 1,
-0.3189384, -0.025527, -1.828062, 1, 0, 0, 1, 1,
-0.3186175, -0.1714883, -3.688052, 0, 0, 0, 1, 1,
-0.3182267, 1.141619, -2.020532, 0, 0, 0, 1, 1,
-0.314684, 1.044283, -0.9769615, 0, 0, 0, 1, 1,
-0.3136171, -0.3703651, -3.33209, 0, 0, 0, 1, 1,
-0.3115924, 0.4782184, 0.354536, 0, 0, 0, 1, 1,
-0.2995111, -1.386512, -2.673026, 0, 0, 0, 1, 1,
-0.2948202, -1.085299, -2.605685, 0, 0, 0, 1, 1,
-0.2903116, 0.4746616, -2.66517, 1, 1, 1, 1, 1,
-0.2843395, -0.1967665, -2.006104, 1, 1, 1, 1, 1,
-0.283258, -0.5664073, -2.31419, 1, 1, 1, 1, 1,
-0.2787803, 0.7546099, 0.1628813, 1, 1, 1, 1, 1,
-0.2725148, -1.134582, -2.775331, 1, 1, 1, 1, 1,
-0.2723171, -1.214756, -1.852849, 1, 1, 1, 1, 1,
-0.271112, 0.8622055, 0.9436841, 1, 1, 1, 1, 1,
-0.2648933, -1.410617, -4.40843, 1, 1, 1, 1, 1,
-0.2633585, -0.7959076, -2.706982, 1, 1, 1, 1, 1,
-0.2623479, -0.4401828, -2.657124, 1, 1, 1, 1, 1,
-0.2615473, 1.337746, 0.8290125, 1, 1, 1, 1, 1,
-0.2598882, 0.5346637, -0.4821328, 1, 1, 1, 1, 1,
-0.2594828, -1.860665, -4.596386, 1, 1, 1, 1, 1,
-0.2562282, 1.629998, 1.357697, 1, 1, 1, 1, 1,
-0.2560916, -2.44242, -2.949969, 1, 1, 1, 1, 1,
-0.2512577, 0.7332968, -1.248869, 0, 0, 1, 1, 1,
-0.2512279, 0.5819962, -1.828439, 1, 0, 0, 1, 1,
-0.2510417, 1.348684, -1.304215, 1, 0, 0, 1, 1,
-0.2474942, 1.242095, -1.007478, 1, 0, 0, 1, 1,
-0.2456289, 1.032965, -0.2510665, 1, 0, 0, 1, 1,
-0.2453131, -2.208528, -1.82839, 1, 0, 0, 1, 1,
-0.2419079, 0.5754221, -2.249967, 0, 0, 0, 1, 1,
-0.2414504, -1.174458, -1.701836, 0, 0, 0, 1, 1,
-0.2386516, -0.7396017, -2.967506, 0, 0, 0, 1, 1,
-0.2384553, -0.512997, -2.575953, 0, 0, 0, 1, 1,
-0.2365823, -0.6944014, -3.246562, 0, 0, 0, 1, 1,
-0.2355602, -2.439568, -4.497107, 0, 0, 0, 1, 1,
-0.232126, 0.3933196, 0.07491402, 0, 0, 0, 1, 1,
-0.2267036, -0.9900948, -1.103957, 1, 1, 1, 1, 1,
-0.2250339, 0.7024002, -0.5281268, 1, 1, 1, 1, 1,
-0.2218336, -0.06256261, -1.372833, 1, 1, 1, 1, 1,
-0.2198318, 0.1947812, -0.957477, 1, 1, 1, 1, 1,
-0.21806, 0.946731, 0.7224343, 1, 1, 1, 1, 1,
-0.2161926, 0.4575401, 1.098284, 1, 1, 1, 1, 1,
-0.2161565, -0.0497546, -2.031366, 1, 1, 1, 1, 1,
-0.2158331, 0.1890621, -0.1535283, 1, 1, 1, 1, 1,
-0.2104268, 1.289276, -0.9981965, 1, 1, 1, 1, 1,
-0.2058587, 0.5332325, 0.9081221, 1, 1, 1, 1, 1,
-0.2045292, 1.073087, -1.102746, 1, 1, 1, 1, 1,
-0.1942102, 0.8145057, -0.6469876, 1, 1, 1, 1, 1,
-0.1942101, -1.553681, -2.103703, 1, 1, 1, 1, 1,
-0.1921114, -0.04215715, -3.245806, 1, 1, 1, 1, 1,
-0.1913793, -0.01101238, -1.438478, 1, 1, 1, 1, 1,
-0.1881073, 0.7721351, -2.16535, 0, 0, 1, 1, 1,
-0.1829418, -0.2805762, -5.061179, 1, 0, 0, 1, 1,
-0.1804354, -1.792332, -3.461744, 1, 0, 0, 1, 1,
-0.1783811, 0.6333037, -0.9181404, 1, 0, 0, 1, 1,
-0.1755514, -0.4082897, -1.71536, 1, 0, 0, 1, 1,
-0.1745095, 0.4822682, -0.8817353, 1, 0, 0, 1, 1,
-0.1701337, -0.4289484, -0.5537773, 0, 0, 0, 1, 1,
-0.1600234, 1.5207, 2.393048, 0, 0, 0, 1, 1,
-0.159515, -0.4533798, -2.209575, 0, 0, 0, 1, 1,
-0.1580618, 1.179059, -0.06159162, 0, 0, 0, 1, 1,
-0.1574386, 2.014146, -0.700736, 0, 0, 0, 1, 1,
-0.1547714, 0.3248102, -1.695412, 0, 0, 0, 1, 1,
-0.1497683, 1.08788, 0.4602419, 0, 0, 0, 1, 1,
-0.1477414, -0.4875318, -1.250348, 1, 1, 1, 1, 1,
-0.1475403, 1.031215, -1.284883, 1, 1, 1, 1, 1,
-0.1461982, -1.062684, -2.552706, 1, 1, 1, 1, 1,
-0.1435936, -0.04940737, -2.48022, 1, 1, 1, 1, 1,
-0.1404522, -0.540005, -2.949891, 1, 1, 1, 1, 1,
-0.1374316, -0.3759433, -2.601239, 1, 1, 1, 1, 1,
-0.130045, 0.2063497, -0.7254248, 1, 1, 1, 1, 1,
-0.1293181, 0.3415389, 0.2266808, 1, 1, 1, 1, 1,
-0.1251662, 0.8016324, 0.1870074, 1, 1, 1, 1, 1,
-0.1208618, 0.389127, -2.673919, 1, 1, 1, 1, 1,
-0.1152762, -0.9501791, -3.166309, 1, 1, 1, 1, 1,
-0.1140469, 0.5400079, -0.03414677, 1, 1, 1, 1, 1,
-0.1057853, -0.2689034, -3.267807, 1, 1, 1, 1, 1,
-0.1054368, -0.1840345, -2.186532, 1, 1, 1, 1, 1,
-0.1052735, 0.9316205, -1.786393, 1, 1, 1, 1, 1,
-0.09933235, 0.7365925, 1.061318, 0, 0, 1, 1, 1,
-0.09528743, -1.224775, -3.117566, 1, 0, 0, 1, 1,
-0.09203277, 1.633872, 0.1011072, 1, 0, 0, 1, 1,
-0.08308104, -0.9002857, -2.963677, 1, 0, 0, 1, 1,
-0.07823908, 0.5083459, 0.6465275, 1, 0, 0, 1, 1,
-0.07433301, 0.1204258, -2.793089, 1, 0, 0, 1, 1,
-0.073452, 0.5328169, 0.4721833, 0, 0, 0, 1, 1,
-0.07095546, 0.8408576, -1.005945, 0, 0, 0, 1, 1,
-0.06965786, -0.5185175, -5.391718, 0, 0, 0, 1, 1,
-0.06772562, 0.02715034, -0.4937645, 0, 0, 0, 1, 1,
-0.06702871, -0.9949876, -2.780271, 0, 0, 0, 1, 1,
-0.06630195, -0.08993952, -2.185729, 0, 0, 0, 1, 1,
-0.05489318, 0.7678416, 1.233193, 0, 0, 0, 1, 1,
-0.05216377, -0.5272855, -3.083395, 1, 1, 1, 1, 1,
-0.05097887, -0.9178736, -2.762222, 1, 1, 1, 1, 1,
-0.0494414, -0.6177996, -5.586105, 1, 1, 1, 1, 1,
-0.04943163, -1.142994, -3.521924, 1, 1, 1, 1, 1,
-0.04824887, -1.683288, -3.39733, 1, 1, 1, 1, 1,
-0.04731456, 2.363473, -1.225664, 1, 1, 1, 1, 1,
-0.0463388, -0.03618824, -1.861552, 1, 1, 1, 1, 1,
-0.04370758, -0.206337, -4.515277, 1, 1, 1, 1, 1,
-0.04021586, -0.9227991, -3.53062, 1, 1, 1, 1, 1,
-0.03850488, -1.139551, -0.4367435, 1, 1, 1, 1, 1,
-0.03611058, 0.7793285, -1.142314, 1, 1, 1, 1, 1,
-0.03517289, 0.2462881, -0.4236683, 1, 1, 1, 1, 1,
-0.0339564, -0.7157974, -1.371695, 1, 1, 1, 1, 1,
-0.03058705, -1.206997, -2.820434, 1, 1, 1, 1, 1,
-0.0296025, -1.22756, -3.656595, 1, 1, 1, 1, 1,
-0.0279955, -0.6058544, -1.228539, 0, 0, 1, 1, 1,
-0.02525874, -0.5594534, -3.506993, 1, 0, 0, 1, 1,
-0.02521322, 0.4560926, -2.359943, 1, 0, 0, 1, 1,
-0.02299849, 1.097506, -1.161332, 1, 0, 0, 1, 1,
-0.01711509, 0.6386228, 0.5046885, 1, 0, 0, 1, 1,
-0.009583409, 0.5554178, 0.005352341, 1, 0, 0, 1, 1,
-0.009090584, 1.1657, 0.5833598, 0, 0, 0, 1, 1,
-0.007646322, -0.2145729, -1.589711, 0, 0, 0, 1, 1,
-0.007044714, 0.5722492, -0.7839552, 0, 0, 0, 1, 1,
-0.003006714, -1.1054, -1.556947, 0, 0, 0, 1, 1,
0.00160287, -0.1358427, 1.907071, 0, 0, 0, 1, 1,
0.003149511, 0.6602052, -0.0609648, 0, 0, 0, 1, 1,
0.003422604, 1.724506, 1.247992, 0, 0, 0, 1, 1,
0.01471443, 0.3584452, 0.2154143, 1, 1, 1, 1, 1,
0.01498846, 0.1029016, 0.9416771, 1, 1, 1, 1, 1,
0.01709115, 0.1793832, 0.7725797, 1, 1, 1, 1, 1,
0.02208417, 1.7489, -1.320132, 1, 1, 1, 1, 1,
0.02353525, -0.6360377, 1.836894, 1, 1, 1, 1, 1,
0.02406537, -0.3230897, 2.602413, 1, 1, 1, 1, 1,
0.02505009, 0.01883423, -1.434421, 1, 1, 1, 1, 1,
0.025355, -0.7406036, 4.613001, 1, 1, 1, 1, 1,
0.03046473, -0.02512922, 1.526681, 1, 1, 1, 1, 1,
0.03714591, -0.1570454, 3.220479, 1, 1, 1, 1, 1,
0.04082729, 0.6174152, -0.676214, 1, 1, 1, 1, 1,
0.04287546, 0.4155771, -0.6621643, 1, 1, 1, 1, 1,
0.05130346, -0.44896, 4.070918, 1, 1, 1, 1, 1,
0.05345517, -0.678612, 2.68226, 1, 1, 1, 1, 1,
0.05390208, 0.402817, -0.864387, 1, 1, 1, 1, 1,
0.05577172, 2.180101, 0.2122833, 0, 0, 1, 1, 1,
0.05717153, 0.9104096, 0.4556527, 1, 0, 0, 1, 1,
0.05743923, 0.04796985, 2.175113, 1, 0, 0, 1, 1,
0.05967829, 1.866746, -0.4766922, 1, 0, 0, 1, 1,
0.06205184, 0.6278818, -0.2072877, 1, 0, 0, 1, 1,
0.06420708, 0.3457181, 0.503185, 1, 0, 0, 1, 1,
0.06426905, -0.06605699, 2.230401, 0, 0, 0, 1, 1,
0.06785485, 2.137973, 0.495739, 0, 0, 0, 1, 1,
0.06922671, 0.9734556, -2.706982, 0, 0, 0, 1, 1,
0.07342511, 0.234394, 0.711143, 0, 0, 0, 1, 1,
0.07986081, -0.04427866, 0.1930872, 0, 0, 0, 1, 1,
0.08224316, 0.291303, -0.6826245, 0, 0, 0, 1, 1,
0.08239725, 0.1743297, 0.1666062, 0, 0, 0, 1, 1,
0.08357012, 0.348872, -0.3692445, 1, 1, 1, 1, 1,
0.09017465, 0.7273491, -0.2052453, 1, 1, 1, 1, 1,
0.09262192, -0.0932646, 1.659832, 1, 1, 1, 1, 1,
0.09269214, 0.2691544, 2.685428, 1, 1, 1, 1, 1,
0.09438122, 1.218501, 0.5997099, 1, 1, 1, 1, 1,
0.09647384, -1.289885, 3.841229, 1, 1, 1, 1, 1,
0.09950537, -0.4204253, 1.896534, 1, 1, 1, 1, 1,
0.1069209, 0.2310387, 0.8229458, 1, 1, 1, 1, 1,
0.1092619, 0.2088285, 2.235008, 1, 1, 1, 1, 1,
0.1102711, -1.685936, 2.224221, 1, 1, 1, 1, 1,
0.1115204, -1.581385, 2.948511, 1, 1, 1, 1, 1,
0.1117301, 0.02077091, 3.321875, 1, 1, 1, 1, 1,
0.1119531, -0.6573753, 4.759768, 1, 1, 1, 1, 1,
0.1151441, 0.07452123, 1.851036, 1, 1, 1, 1, 1,
0.1185451, -0.3293892, 3.667627, 1, 1, 1, 1, 1,
0.1198305, -0.9744447, 2.337605, 0, 0, 1, 1, 1,
0.1198905, -0.9353791, 3.051175, 1, 0, 0, 1, 1,
0.119936, -0.3962381, 2.780374, 1, 0, 0, 1, 1,
0.1210931, -1.513603, 1.906793, 1, 0, 0, 1, 1,
0.1212724, -0.04792436, 0.9535599, 1, 0, 0, 1, 1,
0.1216, 0.8476328, 1.467604, 1, 0, 0, 1, 1,
0.1244424, 1.563314, -1.715339, 0, 0, 0, 1, 1,
0.1283262, -0.1211293, 2.49668, 0, 0, 0, 1, 1,
0.1288291, -0.2503052, 0.6771123, 0, 0, 0, 1, 1,
0.1301954, 0.04330657, -0.4650005, 0, 0, 0, 1, 1,
0.1304744, 0.3048537, 1.959887, 0, 0, 0, 1, 1,
0.1307347, 0.2087321, -0.5903004, 0, 0, 0, 1, 1,
0.132785, 0.8486199, -1.096704, 0, 0, 0, 1, 1,
0.1351981, -0.01337754, 3.418481, 1, 1, 1, 1, 1,
0.1353786, -1.813182, 1.967214, 1, 1, 1, 1, 1,
0.1375212, 0.6944221, -0.7104349, 1, 1, 1, 1, 1,
0.1424123, -2.120715, 3.048366, 1, 1, 1, 1, 1,
0.1449576, -0.6360003, 1.043719, 1, 1, 1, 1, 1,
0.1450128, 0.2499026, 1.012504, 1, 1, 1, 1, 1,
0.1477976, -0.6481947, 3.77782, 1, 1, 1, 1, 1,
0.1506056, 2.058314, 0.3027013, 1, 1, 1, 1, 1,
0.1574138, -1.059755, 3.204289, 1, 1, 1, 1, 1,
0.1586707, 0.5668215, 3.466376, 1, 1, 1, 1, 1,
0.1622285, 0.7806726, 0.5560298, 1, 1, 1, 1, 1,
0.1651828, -0.7415675, 1.805184, 1, 1, 1, 1, 1,
0.167233, 0.436236, -0.3333149, 1, 1, 1, 1, 1,
0.1693288, -0.5433675, 2.888388, 1, 1, 1, 1, 1,
0.1702135, 0.1624554, 1.867976, 1, 1, 1, 1, 1,
0.1746065, 1.582289, -1.941444, 0, 0, 1, 1, 1,
0.1773756, 0.8804526, 1.137797, 1, 0, 0, 1, 1,
0.1793346, -0.8402881, 2.164548, 1, 0, 0, 1, 1,
0.1836745, -1.630515, 3.470414, 1, 0, 0, 1, 1,
0.1850268, -0.6255128, 3.861264, 1, 0, 0, 1, 1,
0.1867843, -1.694034, 1.852898, 1, 0, 0, 1, 1,
0.1922573, -0.7098799, 4.580246, 0, 0, 0, 1, 1,
0.1990256, 0.5980119, -1.796919, 0, 0, 0, 1, 1,
0.1993681, 0.8072127, -1.166445, 0, 0, 0, 1, 1,
0.202404, -0.01908662, 0.1724106, 0, 0, 0, 1, 1,
0.2051457, 1.195046, -1.623169, 0, 0, 0, 1, 1,
0.2056929, -2.201366, 4.995872, 0, 0, 0, 1, 1,
0.2058335, 0.4153728, -0.5351603, 0, 0, 0, 1, 1,
0.2070396, -0.4620779, 3.087906, 1, 1, 1, 1, 1,
0.2075676, -0.03661017, 1.418736, 1, 1, 1, 1, 1,
0.2095551, 1.446287, -1.006571, 1, 1, 1, 1, 1,
0.2158029, 1.116401, -1.798206, 1, 1, 1, 1, 1,
0.2217703, 1.022226, -0.7970741, 1, 1, 1, 1, 1,
0.2274423, 0.2953821, 0.6756719, 1, 1, 1, 1, 1,
0.2282006, 2.346092, 1.37594, 1, 1, 1, 1, 1,
0.2306763, -1.277336, 2.330498, 1, 1, 1, 1, 1,
0.2315695, -0.7976281, 4.277385, 1, 1, 1, 1, 1,
0.2356087, 0.4672287, 0.5943885, 1, 1, 1, 1, 1,
0.2393055, -0.2085454, 3.153005, 1, 1, 1, 1, 1,
0.2398264, 0.6095895, -0.5310523, 1, 1, 1, 1, 1,
0.2403527, -0.8715954, 1.919871, 1, 1, 1, 1, 1,
0.2445543, -1.565035, 3.293002, 1, 1, 1, 1, 1,
0.2454489, -1.52127, 1.665213, 1, 1, 1, 1, 1,
0.2541669, 0.843964, -0.2168058, 0, 0, 1, 1, 1,
0.2557923, 0.3056165, 0.2686858, 1, 0, 0, 1, 1,
0.2586398, -1.619591, 2.870731, 1, 0, 0, 1, 1,
0.259415, 1.071182, -0.2228035, 1, 0, 0, 1, 1,
0.259938, -0.310275, 2.186656, 1, 0, 0, 1, 1,
0.262798, 0.3547137, 2.849393, 1, 0, 0, 1, 1,
0.2665538, 0.9468488, -1.417433, 0, 0, 0, 1, 1,
0.2676694, -1.175727, 2.754429, 0, 0, 0, 1, 1,
0.2680292, -0.204082, 0.292601, 0, 0, 0, 1, 1,
0.2742561, -0.3431857, 2.145005, 0, 0, 0, 1, 1,
0.2814592, -0.2326507, 1.183274, 0, 0, 0, 1, 1,
0.2856457, 0.1405094, 2.130065, 0, 0, 0, 1, 1,
0.2859966, 1.119021, -0.8144085, 0, 0, 0, 1, 1,
0.2869646, 0.02796644, 2.01868, 1, 1, 1, 1, 1,
0.2946184, -0.8241089, 3.639986, 1, 1, 1, 1, 1,
0.3002727, 0.3107978, 1.339952, 1, 1, 1, 1, 1,
0.3023389, -2.176946, 2.631373, 1, 1, 1, 1, 1,
0.3035928, -0.8033248, 1.43105, 1, 1, 1, 1, 1,
0.3037199, 0.08529823, 0.7942811, 1, 1, 1, 1, 1,
0.3090447, 0.4322612, 3.24909, 1, 1, 1, 1, 1,
0.3095471, 0.6330685, 0.518849, 1, 1, 1, 1, 1,
0.3126533, 0.2604627, 2.07145, 1, 1, 1, 1, 1,
0.3163171, 1.746598, 1.168846, 1, 1, 1, 1, 1,
0.3163903, -0.7602732, 4.004699, 1, 1, 1, 1, 1,
0.3166155, -0.5429438, 1.379502, 1, 1, 1, 1, 1,
0.3200232, -0.5069271, 1.743743, 1, 1, 1, 1, 1,
0.3228875, -0.3635308, 1.926192, 1, 1, 1, 1, 1,
0.3229432, -1.553634, 3.726645, 1, 1, 1, 1, 1,
0.3319412, 0.2050436, 1.013779, 0, 0, 1, 1, 1,
0.3321122, 1.726548, -0.04538536, 1, 0, 0, 1, 1,
0.3384281, 1.001748, 1.345236, 1, 0, 0, 1, 1,
0.3390219, -0.4692437, 3.490829, 1, 0, 0, 1, 1,
0.3455143, -0.856096, 3.541639, 1, 0, 0, 1, 1,
0.3483287, -0.2603785, 1.7301, 1, 0, 0, 1, 1,
0.3507455, 0.1152986, 1.48811, 0, 0, 0, 1, 1,
0.3508734, 0.5570095, 2.800141, 0, 0, 0, 1, 1,
0.352983, -0.6663906, 1.696752, 0, 0, 0, 1, 1,
0.3580134, -0.859116, 3.122057, 0, 0, 0, 1, 1,
0.3592374, 1.632021, -0.9261916, 0, 0, 0, 1, 1,
0.3666222, -0.3488985, 2.83268, 0, 0, 0, 1, 1,
0.3706757, 0.6129449, 0.5999646, 0, 0, 0, 1, 1,
0.3759287, 0.4224242, 1.052288, 1, 1, 1, 1, 1,
0.381925, -1.632448, 3.259917, 1, 1, 1, 1, 1,
0.3868194, 0.680003, 1.380144, 1, 1, 1, 1, 1,
0.3908446, -1.470545, 4.067355, 1, 1, 1, 1, 1,
0.3953681, -0.6561225, 2.7183, 1, 1, 1, 1, 1,
0.3962702, 0.5710884, 0.1288414, 1, 1, 1, 1, 1,
0.3978075, 0.7036826, 1.572783, 1, 1, 1, 1, 1,
0.3985096, -1.304221, 4.530775, 1, 1, 1, 1, 1,
0.3996018, -0.7683631, 1.897074, 1, 1, 1, 1, 1,
0.4000123, -0.0006375657, 2.290391, 1, 1, 1, 1, 1,
0.4003744, 0.9753864, 0.2407415, 1, 1, 1, 1, 1,
0.4024599, 0.01014334, 2.451892, 1, 1, 1, 1, 1,
0.4043948, 0.6305275, -1.341956, 1, 1, 1, 1, 1,
0.4107321, 1.29502, 1.736187, 1, 1, 1, 1, 1,
0.4122806, -0.4981026, 1.712966, 1, 1, 1, 1, 1,
0.4154008, 1.329302, 0.9250028, 0, 0, 1, 1, 1,
0.4209008, 1.352613, 0.7308677, 1, 0, 0, 1, 1,
0.4213652, -0.5679278, 2.401253, 1, 0, 0, 1, 1,
0.4225495, -2.471283, 2.545809, 1, 0, 0, 1, 1,
0.42402, -0.4977515, 2.537004, 1, 0, 0, 1, 1,
0.4307916, -1.858537, 3.236629, 1, 0, 0, 1, 1,
0.4371693, -0.1187822, 1.326479, 0, 0, 0, 1, 1,
0.4414162, -0.6633313, 1.108006, 0, 0, 0, 1, 1,
0.4429528, 1.490571, 0.7358362, 0, 0, 0, 1, 1,
0.4455981, 1.870108, 0.09502693, 0, 0, 0, 1, 1,
0.4462103, -0.3014555, 2.053529, 0, 0, 0, 1, 1,
0.446479, 0.3821585, -1.648105, 0, 0, 0, 1, 1,
0.4484001, 0.3360579, 1.86292, 0, 0, 0, 1, 1,
0.4539175, 0.562598, 0.4110897, 1, 1, 1, 1, 1,
0.45693, -0.2424959, 1.502474, 1, 1, 1, 1, 1,
0.4589118, 0.7117116, -2.003253, 1, 1, 1, 1, 1,
0.4703303, -0.8597779, 1.536827, 1, 1, 1, 1, 1,
0.4706422, 0.5344753, 2.267552, 1, 1, 1, 1, 1,
0.4728844, -2.267441, 3.30331, 1, 1, 1, 1, 1,
0.474543, -2.18557, 1.942347, 1, 1, 1, 1, 1,
0.4786825, -0.4692378, 2.555135, 1, 1, 1, 1, 1,
0.4841016, -0.9516382, 1.094598, 1, 1, 1, 1, 1,
0.4841465, 0.3040089, 0.4154724, 1, 1, 1, 1, 1,
0.4853006, 0.9808343, 0.4713653, 1, 1, 1, 1, 1,
0.4862023, -0.7517096, 3.689955, 1, 1, 1, 1, 1,
0.4878052, -1.26738, 1.498451, 1, 1, 1, 1, 1,
0.4901541, -0.1659596, 1.896001, 1, 1, 1, 1, 1,
0.4939906, 2.227644, -0.9062764, 1, 1, 1, 1, 1,
0.4953604, 1.247628, 0.3152551, 0, 0, 1, 1, 1,
0.4956131, -0.3194295, 0.7400455, 1, 0, 0, 1, 1,
0.5017285, 0.6348106, -0.3610939, 1, 0, 0, 1, 1,
0.504036, 1.292351, 1.971052, 1, 0, 0, 1, 1,
0.5044199, -0.2348675, 2.183517, 1, 0, 0, 1, 1,
0.5086359, -1.469111, 4.123216, 1, 0, 0, 1, 1,
0.5133429, 0.1086781, 1.685025, 0, 0, 0, 1, 1,
0.5144525, -1.081374, 2.939002, 0, 0, 0, 1, 1,
0.514556, -0.9444219, 1.444231, 0, 0, 0, 1, 1,
0.5197836, 1.20457, 0.8635315, 0, 0, 0, 1, 1,
0.5228168, -0.1592146, 1.917031, 0, 0, 0, 1, 1,
0.5228313, -1.045148, 2.551849, 0, 0, 0, 1, 1,
0.5235215, -0.578505, 2.869781, 0, 0, 0, 1, 1,
0.5252656, -1.52885, 2.632683, 1, 1, 1, 1, 1,
0.5259956, 0.5915768, 1.884492, 1, 1, 1, 1, 1,
0.526046, 0.6418856, 0.4275082, 1, 1, 1, 1, 1,
0.526448, -2.294304, 3.071368, 1, 1, 1, 1, 1,
0.5286184, -0.3653723, 2.653666, 1, 1, 1, 1, 1,
0.5293917, 0.4054748, 0.9433095, 1, 1, 1, 1, 1,
0.532836, 1.093967, 0.8933214, 1, 1, 1, 1, 1,
0.5328645, 0.3463275, 1.820954, 1, 1, 1, 1, 1,
0.5345691, -0.7862983, 2.20283, 1, 1, 1, 1, 1,
0.5388508, 0.2019451, 0.3626583, 1, 1, 1, 1, 1,
0.5429128, 0.8377037, -0.1107605, 1, 1, 1, 1, 1,
0.5468238, 1.20647, -0.5019853, 1, 1, 1, 1, 1,
0.5492205, 0.1163307, -0.2745754, 1, 1, 1, 1, 1,
0.5525056, -0.5105513, 2.260499, 1, 1, 1, 1, 1,
0.5549136, 0.4769323, -1.301838, 1, 1, 1, 1, 1,
0.5626396, 0.5861447, 2.238455, 0, 0, 1, 1, 1,
0.5630172, 0.2106453, 0.8032007, 1, 0, 0, 1, 1,
0.5631103, -0.8568304, 1.946512, 1, 0, 0, 1, 1,
0.5669885, 1.509575, 1.273365, 1, 0, 0, 1, 1,
0.5692902, 1.643802, -0.9667017, 1, 0, 0, 1, 1,
0.5771816, 2.380906, 0.2384103, 1, 0, 0, 1, 1,
0.5779769, -0.7476733, 2.487789, 0, 0, 0, 1, 1,
0.5790101, 0.08246538, 0.4364017, 0, 0, 0, 1, 1,
0.5808477, 0.617783, -1.104108, 0, 0, 0, 1, 1,
0.5877122, 1.60473, 0.3280166, 0, 0, 0, 1, 1,
0.5926688, 0.2423173, 2.290246, 0, 0, 0, 1, 1,
0.5928909, 1.037635, 0.7301773, 0, 0, 0, 1, 1,
0.5930364, -1.114259, 3.727974, 0, 0, 0, 1, 1,
0.5968821, 1.166756, -0.3245, 1, 1, 1, 1, 1,
0.5982239, -0.9558072, 1.244555, 1, 1, 1, 1, 1,
0.6006415, 0.09032791, 0.8609991, 1, 1, 1, 1, 1,
0.6077281, 0.4544646, 1.664899, 1, 1, 1, 1, 1,
0.6080488, -0.001867115, 3.515219, 1, 1, 1, 1, 1,
0.6086655, -2.959047, 4.031494, 1, 1, 1, 1, 1,
0.613727, -0.3301635, 3.298679, 1, 1, 1, 1, 1,
0.6176638, 0.169768, 2.717442, 1, 1, 1, 1, 1,
0.6194681, -2.505562, 1.911219, 1, 1, 1, 1, 1,
0.6213527, -0.3220181, 2.379992, 1, 1, 1, 1, 1,
0.6241382, 0.3011474, 2.75952, 1, 1, 1, 1, 1,
0.6260295, -0.6476092, 1.262723, 1, 1, 1, 1, 1,
0.6278158, 0.789128, 1.077586, 1, 1, 1, 1, 1,
0.6360466, 0.4135434, 2.100322, 1, 1, 1, 1, 1,
0.6370757, 0.8602931, 1.537598, 1, 1, 1, 1, 1,
0.6410024, 0.9339945, 0.1905819, 0, 0, 1, 1, 1,
0.6458476, 0.2928678, 1.105075, 1, 0, 0, 1, 1,
0.6494932, 0.7949679, 0.7918258, 1, 0, 0, 1, 1,
0.6534858, 0.9097492, -0.1358954, 1, 0, 0, 1, 1,
0.6545904, -1.058037, 1.683153, 1, 0, 0, 1, 1,
0.6574019, 0.1539906, 1.611076, 1, 0, 0, 1, 1,
0.6629547, 0.5993646, 0.5703651, 0, 0, 0, 1, 1,
0.6683129, -0.0652815, 2.180683, 0, 0, 0, 1, 1,
0.6685974, 0.7583269, 1.341022, 0, 0, 0, 1, 1,
0.6705087, -1.705554, 2.490185, 0, 0, 0, 1, 1,
0.6709805, 0.7254491, 0.7411421, 0, 0, 0, 1, 1,
0.6745131, -0.3693528, 1.777488, 0, 0, 0, 1, 1,
0.6752816, 1.685494, 3.251228, 0, 0, 0, 1, 1,
0.6796099, 1.099879, -0.2613513, 1, 1, 1, 1, 1,
0.6822562, 0.5037539, 0.6525852, 1, 1, 1, 1, 1,
0.6847487, -1.521347, 3.797217, 1, 1, 1, 1, 1,
0.6866223, -0.3622152, 2.502787, 1, 1, 1, 1, 1,
0.6921209, -0.5886657, 2.874816, 1, 1, 1, 1, 1,
0.6953245, 1.498019, -0.8244913, 1, 1, 1, 1, 1,
0.695327, -0.7484983, 2.637664, 1, 1, 1, 1, 1,
0.6954011, -0.5448462, 2.234083, 1, 1, 1, 1, 1,
0.697992, -0.1937923, 3.08852, 1, 1, 1, 1, 1,
0.6988777, 1.598184, 1.031373, 1, 1, 1, 1, 1,
0.7024817, -1.783456, 3.342043, 1, 1, 1, 1, 1,
0.7066585, -0.310385, 1.19224, 1, 1, 1, 1, 1,
0.7071312, 0.522704, 0.5938203, 1, 1, 1, 1, 1,
0.7150721, 1.828849, 1.078754, 1, 1, 1, 1, 1,
0.7154464, 0.548256, 3.747855, 1, 1, 1, 1, 1,
0.7167794, -1.161806, 2.729454, 0, 0, 1, 1, 1,
0.719171, 0.4148611, 0.228375, 1, 0, 0, 1, 1,
0.7230753, 1.747647, 0.8724914, 1, 0, 0, 1, 1,
0.7322966, -0.2319853, 1.17701, 1, 0, 0, 1, 1,
0.7336866, -1.149897, 1.384905, 1, 0, 0, 1, 1,
0.7424717, 0.3419064, 0.293787, 1, 0, 0, 1, 1,
0.742509, 0.6725579, 1.677853, 0, 0, 0, 1, 1,
0.7438502, 1.548504, -1.4643, 0, 0, 0, 1, 1,
0.7542244, 1.880726, -0.02888496, 0, 0, 0, 1, 1,
0.7578272, 1.445045, 1.328205, 0, 0, 0, 1, 1,
0.7590276, -1.11687, 1.9105, 0, 0, 0, 1, 1,
0.7623323, 0.6822102, -0.7631375, 0, 0, 0, 1, 1,
0.762525, -0.545625, 1.813196, 0, 0, 0, 1, 1,
0.7637646, 1.235011, 0.9791208, 1, 1, 1, 1, 1,
0.7645362, -0.3539897, 2.509338, 1, 1, 1, 1, 1,
0.7741709, -0.1472056, 2.166029, 1, 1, 1, 1, 1,
0.7769637, -1.03583, 2.021259, 1, 1, 1, 1, 1,
0.777076, -0.7056397, 2.598603, 1, 1, 1, 1, 1,
0.7775851, 0.6194187, 0.1009405, 1, 1, 1, 1, 1,
0.7882379, 1.074745, -0.5715733, 1, 1, 1, 1, 1,
0.7890881, -0.7806098, 3.541322, 1, 1, 1, 1, 1,
0.7929634, -1.504807, 3.838999, 1, 1, 1, 1, 1,
0.799695, -0.4491773, 2.26843, 1, 1, 1, 1, 1,
0.8022926, -0.1601829, 2.48255, 1, 1, 1, 1, 1,
0.8052608, 0.4250555, 1.737437, 1, 1, 1, 1, 1,
0.8070913, 1.409315, 0.1226169, 1, 1, 1, 1, 1,
0.8075261, 0.5535464, 0.1771686, 1, 1, 1, 1, 1,
0.8188754, -0.5353463, 2.163538, 1, 1, 1, 1, 1,
0.8218421, -0.4829832, 2.687507, 0, 0, 1, 1, 1,
0.8231207, 0.465274, 2.490929, 1, 0, 0, 1, 1,
0.8245324, 1.133244, -0.2373595, 1, 0, 0, 1, 1,
0.8264999, 0.03668356, 1.113274, 1, 0, 0, 1, 1,
0.8289124, 1.343074, 0.1325259, 1, 0, 0, 1, 1,
0.8334013, -1.1749, 2.615228, 1, 0, 0, 1, 1,
0.8353895, -1.119448, 0.3631634, 0, 0, 0, 1, 1,
0.8376586, -1.000463, 2.251478, 0, 0, 0, 1, 1,
0.8387776, -0.6488842, 2.61477, 0, 0, 0, 1, 1,
0.8393915, 0.1189291, 1.082642, 0, 0, 0, 1, 1,
0.8452942, -0.456578, 1.9143, 0, 0, 0, 1, 1,
0.84533, 1.429745, 1.616432, 0, 0, 0, 1, 1,
0.8459459, 0.4228246, 1.208012, 0, 0, 0, 1, 1,
0.8464355, 0.2347981, -0.6246095, 1, 1, 1, 1, 1,
0.85099, 1.350264, 1.55071, 1, 1, 1, 1, 1,
0.8579149, -0.4184602, 2.209585, 1, 1, 1, 1, 1,
0.8588953, -1.499763, 3.169829, 1, 1, 1, 1, 1,
0.8618198, -0.1619429, 2.842551, 1, 1, 1, 1, 1,
0.8668285, -0.1201574, 1.583051, 1, 1, 1, 1, 1,
0.868722, 0.2273611, 1.93587, 1, 1, 1, 1, 1,
0.870079, 0.2882837, 0.9467375, 1, 1, 1, 1, 1,
0.8706847, 0.3365977, 0.8032315, 1, 1, 1, 1, 1,
0.8711923, 2.486749, -0.4558012, 1, 1, 1, 1, 1,
0.8790939, 0.8503061, -0.9806236, 1, 1, 1, 1, 1,
0.8814588, 0.5527402, 1.600126, 1, 1, 1, 1, 1,
0.8876781, -1.403599, 2.683962, 1, 1, 1, 1, 1,
0.8892143, 1.110304, 0.5622365, 1, 1, 1, 1, 1,
0.8907934, 0.5207115, 1.187022, 1, 1, 1, 1, 1,
0.896396, -0.07467669, 3.174853, 0, 0, 1, 1, 1,
0.8970376, 0.8567035, 1.74663, 1, 0, 0, 1, 1,
0.8971187, -0.2575844, 3.67439, 1, 0, 0, 1, 1,
0.9015193, -1.036331, 2.321693, 1, 0, 0, 1, 1,
0.9055589, 0.368173, 1.065526, 1, 0, 0, 1, 1,
0.9102497, -0.5050111, 2.552559, 1, 0, 0, 1, 1,
0.9140688, 0.2128113, 1.429398, 0, 0, 0, 1, 1,
0.9156416, -1.89481, 2.033904, 0, 0, 0, 1, 1,
0.9209968, 0.4405643, 0.7247357, 0, 0, 0, 1, 1,
0.9246543, 0.2940993, 1.763045, 0, 0, 0, 1, 1,
0.9329425, 0.493731, 0.5725914, 0, 0, 0, 1, 1,
0.9380354, -0.2961544, 0.8629246, 0, 0, 0, 1, 1,
0.9455817, 0.9725921, 1.39955, 0, 0, 0, 1, 1,
0.9478024, 1.168404, 1.750591, 1, 1, 1, 1, 1,
0.9599879, 0.09493099, 0.09175117, 1, 1, 1, 1, 1,
0.9690213, -0.2930043, 3.041901, 1, 1, 1, 1, 1,
0.9718693, -0.5206066, 2.03705, 1, 1, 1, 1, 1,
0.9742558, 0.3708494, 3.318511, 1, 1, 1, 1, 1,
0.9751013, -1.960749, 1.479805, 1, 1, 1, 1, 1,
0.9795191, 2.156517, 1.922618, 1, 1, 1, 1, 1,
0.9800434, -0.2925268, 3.483596, 1, 1, 1, 1, 1,
0.9829141, -0.1384063, -0.07469932, 1, 1, 1, 1, 1,
0.9921601, -0.5532859, 1.886873, 1, 1, 1, 1, 1,
1.000677, 0.581354, 0.5983909, 1, 1, 1, 1, 1,
1.009945, 0.6760603, 0.5657855, 1, 1, 1, 1, 1,
1.016453, 0.5907243, 1.580267, 1, 1, 1, 1, 1,
1.016668, 0.8811609, 2.700141, 1, 1, 1, 1, 1,
1.023438, 0.03798385, 3.143134, 1, 1, 1, 1, 1,
1.023886, -0.9702296, 1.084634, 0, 0, 1, 1, 1,
1.026464, -0.009697414, 2.445562, 1, 0, 0, 1, 1,
1.030818, 0.05518792, 3.050829, 1, 0, 0, 1, 1,
1.03636, 0.3770333, 1.095122, 1, 0, 0, 1, 1,
1.044934, 0.1622054, 2.72269, 1, 0, 0, 1, 1,
1.051594, 0.1340283, 0.8062068, 1, 0, 0, 1, 1,
1.052036, 0.4722871, -0.0656173, 0, 0, 0, 1, 1,
1.05204, 1.455909, 2.22626, 0, 0, 0, 1, 1,
1.052856, 0.5064496, 1.433121, 0, 0, 0, 1, 1,
1.057581, -1.732318, 2.800056, 0, 0, 0, 1, 1,
1.061454, -1.01315, 1.594656, 0, 0, 0, 1, 1,
1.065001, 1.669942, -0.7176438, 0, 0, 0, 1, 1,
1.065417, -0.9956282, 1.596692, 0, 0, 0, 1, 1,
1.075686, 1.255855, 1.803408, 1, 1, 1, 1, 1,
1.083514, -0.04145303, 3.362244, 1, 1, 1, 1, 1,
1.083987, -0.4367989, 1.745612, 1, 1, 1, 1, 1,
1.086504, -0.5812606, 3.319429, 1, 1, 1, 1, 1,
1.087003, 0.02292077, 1.206815, 1, 1, 1, 1, 1,
1.097511, -0.3657326, 2.588242, 1, 1, 1, 1, 1,
1.09832, 0.3391268, -0.4568855, 1, 1, 1, 1, 1,
1.099137, -0.708666, 1.769341, 1, 1, 1, 1, 1,
1.109058, 1.089791, 2.133958, 1, 1, 1, 1, 1,
1.111601, 0.2628181, 2.446062, 1, 1, 1, 1, 1,
1.119748, 1.286526, 1.524858, 1, 1, 1, 1, 1,
1.119876, -0.1460022, 2.566074, 1, 1, 1, 1, 1,
1.12474, -0.2290248, 2.27605, 1, 1, 1, 1, 1,
1.124876, -1.172827, 2.584856, 1, 1, 1, 1, 1,
1.13069, -0.3504449, 2.725877, 1, 1, 1, 1, 1,
1.136828, 0.9887185, 0.4193094, 0, 0, 1, 1, 1,
1.139142, -0.7878428, 1.384889, 1, 0, 0, 1, 1,
1.161237, -0.6961719, 2.188317, 1, 0, 0, 1, 1,
1.179225, 1.204366, -0.07636086, 1, 0, 0, 1, 1,
1.181612, 1.059302, 1.154566, 1, 0, 0, 1, 1,
1.192441, 0.4454574, 1.746352, 1, 0, 0, 1, 1,
1.194209, -0.8984487, 2.815144, 0, 0, 0, 1, 1,
1.194456, -0.8393152, 2.145253, 0, 0, 0, 1, 1,
1.196242, -0.843741, 2.189124, 0, 0, 0, 1, 1,
1.196661, 1.290753, 2.670011, 0, 0, 0, 1, 1,
1.201056, 1.063099, 0.9812611, 0, 0, 0, 1, 1,
1.204593, -0.8410208, 2.171287, 0, 0, 0, 1, 1,
1.210552, -1.130594, 1.549728, 0, 0, 0, 1, 1,
1.210923, 0.2260628, 0.3707753, 1, 1, 1, 1, 1,
1.213523, -0.6603151, 2.581629, 1, 1, 1, 1, 1,
1.215644, -0.6033829, 3.326251, 1, 1, 1, 1, 1,
1.217641, -1.050371, 1.980596, 1, 1, 1, 1, 1,
1.219401, 1.1357, -0.3263668, 1, 1, 1, 1, 1,
1.22108, 0.8185953, 0.4884906, 1, 1, 1, 1, 1,
1.230014, 1.396706, 1.557541, 1, 1, 1, 1, 1,
1.230744, -0.8936163, 2.373463, 1, 1, 1, 1, 1,
1.23125, -1.064727, 2.927836, 1, 1, 1, 1, 1,
1.249053, 0.15634, 3.345827, 1, 1, 1, 1, 1,
1.254478, -0.7857723, 2.299836, 1, 1, 1, 1, 1,
1.255865, 0.8702276, 0.5706583, 1, 1, 1, 1, 1,
1.260658, -1.380159, 2.88973, 1, 1, 1, 1, 1,
1.263949, -0.4779589, 1.018227, 1, 1, 1, 1, 1,
1.265401, -0.3947833, 2.68802, 1, 1, 1, 1, 1,
1.279192, 0.3505002, 1.450746, 0, 0, 1, 1, 1,
1.281105, 0.07855641, 0.6387056, 1, 0, 0, 1, 1,
1.281774, 0.8032466, 1.0691, 1, 0, 0, 1, 1,
1.286783, 0.9127991, 0.3845711, 1, 0, 0, 1, 1,
1.288265, 0.151377, 1.575999, 1, 0, 0, 1, 1,
1.29305, 0.9899899, -0.958241, 1, 0, 0, 1, 1,
1.293871, -1.755458, 3.143068, 0, 0, 0, 1, 1,
1.294393, -0.2900882, 1.007938, 0, 0, 0, 1, 1,
1.297584, -0.8572748, 2.955078, 0, 0, 0, 1, 1,
1.307608, -1.401041, 2.884135, 0, 0, 0, 1, 1,
1.310862, -0.1013882, 2.243232, 0, 0, 0, 1, 1,
1.312036, 0.8910454, 0.04602731, 0, 0, 0, 1, 1,
1.319637, -0.0554858, -0.519323, 0, 0, 0, 1, 1,
1.321036, -0.1329782, 1.396879, 1, 1, 1, 1, 1,
1.321528, -0.591851, 1.332509, 1, 1, 1, 1, 1,
1.32698, -2.376265, 1.803854, 1, 1, 1, 1, 1,
1.346213, -0.9584498, 1.554393, 1, 1, 1, 1, 1,
1.355572, 1.277918, 0.5532193, 1, 1, 1, 1, 1,
1.36708, 0.5842341, 2.975351, 1, 1, 1, 1, 1,
1.374007, -1.249261, 0.3668979, 1, 1, 1, 1, 1,
1.380968, 0.1476541, 0.2832968, 1, 1, 1, 1, 1,
1.388544, -0.09995004, 3.729558, 1, 1, 1, 1, 1,
1.391596, -0.02144085, 3.497921, 1, 1, 1, 1, 1,
1.399283, 2.155754, 1.020468, 1, 1, 1, 1, 1,
1.405279, 1.580012, 0.9109848, 1, 1, 1, 1, 1,
1.409791, 0.697179, 1.770305, 1, 1, 1, 1, 1,
1.416482, -1.719827, 1.054058, 1, 1, 1, 1, 1,
1.419215, 0.3926302, 0.7615346, 1, 1, 1, 1, 1,
1.430738, -0.2579682, 1.295826, 0, 0, 1, 1, 1,
1.43377, -0.9389175, 1.197297, 1, 0, 0, 1, 1,
1.435374, -0.7367161, 2.165642, 1, 0, 0, 1, 1,
1.448316, 0.9229726, -0.5060609, 1, 0, 0, 1, 1,
1.454656, 3.20364, 1.055664, 1, 0, 0, 1, 1,
1.458428, -1.019684, 1.666073, 1, 0, 0, 1, 1,
1.472734, 1.642222, 0.3710828, 0, 0, 0, 1, 1,
1.475501, -0.5899119, 2.364575, 0, 0, 0, 1, 1,
1.490993, -0.5125437, 0.4710345, 0, 0, 0, 1, 1,
1.496964, 1.099764, 0.1081122, 0, 0, 0, 1, 1,
1.500021, -0.7229922, 3.870018, 0, 0, 0, 1, 1,
1.52847, 1.393815, 0.4507456, 0, 0, 0, 1, 1,
1.541948, 1.272043, -0.2007614, 0, 0, 0, 1, 1,
1.542381, 0.7053417, 1.241303, 1, 1, 1, 1, 1,
1.543602, -0.5314844, 2.214303, 1, 1, 1, 1, 1,
1.545825, 0.1421455, 0.3711282, 1, 1, 1, 1, 1,
1.549818, -0.4202732, 1.700508, 1, 1, 1, 1, 1,
1.553521, -0.1580299, 2.762985, 1, 1, 1, 1, 1,
1.556679, 1.591867, -0.1126026, 1, 1, 1, 1, 1,
1.562443, -1.463474, 1.780193, 1, 1, 1, 1, 1,
1.565083, -0.2327655, 2.403023, 1, 1, 1, 1, 1,
1.59357, 0.6346645, -0.002156185, 1, 1, 1, 1, 1,
1.59526, -0.01442985, 1.488301, 1, 1, 1, 1, 1,
1.604186, 0.6354252, 0.6869267, 1, 1, 1, 1, 1,
1.608935, 1.079713, 1.051646, 1, 1, 1, 1, 1,
1.613737, -1.0573, 3.766689, 1, 1, 1, 1, 1,
1.614119, 0.7363424, 2.573067, 1, 1, 1, 1, 1,
1.624188, -0.3692632, 2.011676, 1, 1, 1, 1, 1,
1.627428, -0.4405636, 2.143046, 0, 0, 1, 1, 1,
1.632192, 0.4776339, 1.403862, 1, 0, 0, 1, 1,
1.632546, 2.200151, -0.996352, 1, 0, 0, 1, 1,
1.645542, 0.8475407, 1.651003, 1, 0, 0, 1, 1,
1.664945, 0.1007214, 1.264497, 1, 0, 0, 1, 1,
1.674776, -0.8913053, 2.199875, 1, 0, 0, 1, 1,
1.690809, -0.8745365, 2.125965, 0, 0, 0, 1, 1,
1.739114, 1.702761, 0.2400972, 0, 0, 0, 1, 1,
1.740644, 0.4359864, 0.8750777, 0, 0, 0, 1, 1,
1.754056, 0.9811307, 1.688272, 0, 0, 0, 1, 1,
1.755746, 0.6494809, 2.090828, 0, 0, 0, 1, 1,
1.779906, 0.7511021, 1.47065, 0, 0, 0, 1, 1,
1.783589, 1.302139, 0.706163, 0, 0, 0, 1, 1,
1.795119, -1.347664, 2.241038, 1, 1, 1, 1, 1,
1.825769, 0.6417241, 2.380663, 1, 1, 1, 1, 1,
1.835562, -0.5991557, 1.11092, 1, 1, 1, 1, 1,
1.840626, 0.2516428, 0.8221478, 1, 1, 1, 1, 1,
1.864117, 1.518012, -0.2957334, 1, 1, 1, 1, 1,
1.870519, 1.697083, 0.451086, 1, 1, 1, 1, 1,
1.909539, -1.971337, 3.169538, 1, 1, 1, 1, 1,
1.913553, 0.5584374, 0.3075312, 1, 1, 1, 1, 1,
1.926841, 0.09720311, -0.02734423, 1, 1, 1, 1, 1,
2.008807, 1.817662, 0.6777858, 1, 1, 1, 1, 1,
2.056175, 0.08598218, 4.182146, 1, 1, 1, 1, 1,
2.064743, 1.286907, 1.108945, 1, 1, 1, 1, 1,
2.076055, -0.8734007, 3.808556, 1, 1, 1, 1, 1,
2.097158, -0.6062282, 1.456508, 1, 1, 1, 1, 1,
2.099329, -0.9733097, 1.501299, 1, 1, 1, 1, 1,
2.100227, -1.241355, 1.310323, 0, 0, 1, 1, 1,
2.125482, -0.4928147, 2.021706, 1, 0, 0, 1, 1,
2.175649, 0.5944527, 1.86545, 1, 0, 0, 1, 1,
2.23328, -0.2041836, 1.338857, 1, 0, 0, 1, 1,
2.242821, -0.2501853, 1.516739, 1, 0, 0, 1, 1,
2.24549, -0.1626173, 2.070855, 1, 0, 0, 1, 1,
2.247741, 0.8898479, -0.5725878, 0, 0, 0, 1, 1,
2.255739, 1.241766, 0.9512252, 0, 0, 0, 1, 1,
2.257588, 0.381011, 0.09575004, 0, 0, 0, 1, 1,
2.261914, 1.218488, 0.5966429, 0, 0, 0, 1, 1,
2.288087, 1.691438, 0.5219747, 0, 0, 0, 1, 1,
2.304471, -2.263496, 1.944368, 0, 0, 0, 1, 1,
2.309789, 1.618767, 2.275696, 0, 0, 0, 1, 1,
2.310427, 0.3139383, 2.899993, 1, 1, 1, 1, 1,
2.568973, 0.3658978, 2.10283, 1, 1, 1, 1, 1,
2.746408, -0.07455872, 1.844011, 1, 1, 1, 1, 1,
2.823577, 0.7144553, 1.148275, 1, 1, 1, 1, 1,
2.906846, 0.5318982, -0.3107669, 1, 1, 1, 1, 1,
3.069033, 1.4304, -0.4801234, 1, 1, 1, 1, 1,
3.096402, 0.4573481, -0.4623297, 1, 1, 1, 1, 1
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
var radius = 9.455802;
var distance = 33.2131;
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
mvMatrix.translate( 0.08375359, -0.09947991, 0.2951162 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.2131);
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
