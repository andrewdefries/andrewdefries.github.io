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
-3.755856, -0.793223, -2.014734, 1, 0, 0, 1,
-3.27786, 0.4137412, -0.5085763, 1, 0.007843138, 0, 1,
-3.06446, -0.9066923, -2.081886, 1, 0.01176471, 0, 1,
-2.568848, -0.0903588, -2.096773, 1, 0.01960784, 0, 1,
-2.495531, 0.8165774, -1.505957, 1, 0.02352941, 0, 1,
-2.432701, -1.883349, -3.730697, 1, 0.03137255, 0, 1,
-2.385171, -1.743616, -0.7736266, 1, 0.03529412, 0, 1,
-2.345793, 0.6923178, 0.4372178, 1, 0.04313726, 0, 1,
-2.341275, 1.200323, -0.8439569, 1, 0.04705882, 0, 1,
-2.339585, -0.1054804, -2.734361, 1, 0.05490196, 0, 1,
-2.338953, -1.13126, -3.657405, 1, 0.05882353, 0, 1,
-2.328307, 0.6861573, -2.565211, 1, 0.06666667, 0, 1,
-2.322226, -1.772091, -3.76146, 1, 0.07058824, 0, 1,
-2.280836, -1.06737, -1.928887, 1, 0.07843138, 0, 1,
-2.163137, -0.7590899, -1.55369, 1, 0.08235294, 0, 1,
-2.147949, 0.3797036, -1.739903, 1, 0.09019608, 0, 1,
-2.132855, -0.04983177, -2.234624, 1, 0.09411765, 0, 1,
-2.112175, -1.02046, -3.606158, 1, 0.1019608, 0, 1,
-2.10473, 0.6752765, 0.4877156, 1, 0.1098039, 0, 1,
-2.046586, -0.1019247, -0.7400331, 1, 0.1137255, 0, 1,
-2.014853, -2.198286, -1.791349, 1, 0.1215686, 0, 1,
-1.994478, 0.2806788, -0.9866811, 1, 0.1254902, 0, 1,
-1.98813, -0.9884018, -2.561776, 1, 0.1333333, 0, 1,
-1.984907, 0.1118376, -2.068748, 1, 0.1372549, 0, 1,
-1.957037, 0.1836205, -2.378199, 1, 0.145098, 0, 1,
-1.951365, 0.07779332, -2.078515, 1, 0.1490196, 0, 1,
-1.945487, 1.287481, -1.398895, 1, 0.1568628, 0, 1,
-1.896855, -0.1936077, -4.485628, 1, 0.1607843, 0, 1,
-1.884321, -0.5158436, -1.741884, 1, 0.1686275, 0, 1,
-1.879921, -0.5669366, -1.36043, 1, 0.172549, 0, 1,
-1.861819, -1.552234, -0.4750428, 1, 0.1803922, 0, 1,
-1.839294, -1.940161, -4.101907, 1, 0.1843137, 0, 1,
-1.838159, 0.6239598, -1.685958, 1, 0.1921569, 0, 1,
-1.786681, 0.3595189, -0.2540226, 1, 0.1960784, 0, 1,
-1.780509, -0.2373989, -1.567115, 1, 0.2039216, 0, 1,
-1.766327, -1.036667, -0.7419742, 1, 0.2117647, 0, 1,
-1.765049, 0.7834166, -1.405618, 1, 0.2156863, 0, 1,
-1.758349, -0.3130615, -1.428102, 1, 0.2235294, 0, 1,
-1.744489, -1.015156, -4.518616, 1, 0.227451, 0, 1,
-1.732208, -0.2177101, -1.897497, 1, 0.2352941, 0, 1,
-1.729285, -0.8786528, -2.338676, 1, 0.2392157, 0, 1,
-1.714831, -0.531331, -2.048503, 1, 0.2470588, 0, 1,
-1.703661, 0.8190292, -0.3046087, 1, 0.2509804, 0, 1,
-1.70101, -0.5382673, -1.710243, 1, 0.2588235, 0, 1,
-1.693897, 1.335469, -2.804337, 1, 0.2627451, 0, 1,
-1.692964, -0.4092817, -1.709485, 1, 0.2705882, 0, 1,
-1.688035, -0.05879762, -1.755985, 1, 0.2745098, 0, 1,
-1.661045, -0.2511332, -3.676451, 1, 0.282353, 0, 1,
-1.659717, -0.7397132, -3.296638, 1, 0.2862745, 0, 1,
-1.646187, 0.8775037, 0.5591602, 1, 0.2941177, 0, 1,
-1.645161, -2.881966, -2.6325, 1, 0.3019608, 0, 1,
-1.632372, -0.0357174, -2.598434, 1, 0.3058824, 0, 1,
-1.627932, -0.9286591, -2.131737, 1, 0.3137255, 0, 1,
-1.614361, 0.8058097, -0.2812183, 1, 0.3176471, 0, 1,
-1.60734, -0.6531948, -1.92489, 1, 0.3254902, 0, 1,
-1.598619, 0.2021883, -1.159355, 1, 0.3294118, 0, 1,
-1.579899, -0.6643139, -0.6165224, 1, 0.3372549, 0, 1,
-1.559431, -0.1701019, -3.019005, 1, 0.3411765, 0, 1,
-1.528306, -2.160966, -3.360282, 1, 0.3490196, 0, 1,
-1.505945, 0.1779823, 1.417221, 1, 0.3529412, 0, 1,
-1.503398, 0.2897981, 1.236864, 1, 0.3607843, 0, 1,
-1.487958, -0.659439, -2.108879, 1, 0.3647059, 0, 1,
-1.444432, -0.539908, -1.597198, 1, 0.372549, 0, 1,
-1.422425, -2.190503, -3.578174, 1, 0.3764706, 0, 1,
-1.418388, 0.7061127, 0.2738976, 1, 0.3843137, 0, 1,
-1.417735, 1.425691, -0.608725, 1, 0.3882353, 0, 1,
-1.409632, 2.063154, -1.384947, 1, 0.3960784, 0, 1,
-1.399392, 1.627158, -0.9765679, 1, 0.4039216, 0, 1,
-1.393944, 1.886243, 0.2176715, 1, 0.4078431, 0, 1,
-1.393419, -1.712676, -4.216634, 1, 0.4156863, 0, 1,
-1.37631, 0.4179814, -1.326834, 1, 0.4196078, 0, 1,
-1.355651, -0.8525489, -2.957461, 1, 0.427451, 0, 1,
-1.355425, 1.630823, -2.03467, 1, 0.4313726, 0, 1,
-1.350205, -0.4953739, -2.68678, 1, 0.4392157, 0, 1,
-1.340991, -0.6962535, -2.461793, 1, 0.4431373, 0, 1,
-1.339614, -0.2112904, -2.045835, 1, 0.4509804, 0, 1,
-1.336597, 1.046391, 1.056159, 1, 0.454902, 0, 1,
-1.335605, 0.1071143, -2.18106, 1, 0.4627451, 0, 1,
-1.323466, -0.7433169, -0.2478082, 1, 0.4666667, 0, 1,
-1.322021, 0.2616609, -2.597946, 1, 0.4745098, 0, 1,
-1.317521, -0.8225895, -1.455672, 1, 0.4784314, 0, 1,
-1.316925, -0.1056905, -1.93106, 1, 0.4862745, 0, 1,
-1.313654, 0.334401, -3.21665, 1, 0.4901961, 0, 1,
-1.307072, -0.3671692, -0.6868253, 1, 0.4980392, 0, 1,
-1.295215, 1.31633, 0.9870729, 1, 0.5058824, 0, 1,
-1.295205, 0.2975062, -1.690398, 1, 0.509804, 0, 1,
-1.290872, 1.019372, -2.233152, 1, 0.5176471, 0, 1,
-1.285622, 1.075339, -0.04879145, 1, 0.5215687, 0, 1,
-1.284771, -0.2309004, -0.9984553, 1, 0.5294118, 0, 1,
-1.281391, -1.483476, -1.533132, 1, 0.5333334, 0, 1,
-1.279773, 0.2468589, -0.4754903, 1, 0.5411765, 0, 1,
-1.277413, 0.3585749, -1.209234, 1, 0.5450981, 0, 1,
-1.275271, -0.2369653, -2.599566, 1, 0.5529412, 0, 1,
-1.243897, -0.8420551, -2.660699, 1, 0.5568628, 0, 1,
-1.240883, -0.7647592, -2.210648, 1, 0.5647059, 0, 1,
-1.230686, -1.962022, -2.679836, 1, 0.5686275, 0, 1,
-1.226633, 0.187454, -0.9918648, 1, 0.5764706, 0, 1,
-1.222906, -1.032829, -2.468699, 1, 0.5803922, 0, 1,
-1.221421, 1.399049, 0.7607224, 1, 0.5882353, 0, 1,
-1.216307, 2.652, -1.190958, 1, 0.5921569, 0, 1,
-1.20829, 0.4999486, -0.5909732, 1, 0.6, 0, 1,
-1.20822, 0.8481737, -1.394285, 1, 0.6078432, 0, 1,
-1.199892, -1.281215, -2.240489, 1, 0.6117647, 0, 1,
-1.190577, 0.3976587, -0.9782977, 1, 0.6196079, 0, 1,
-1.188568, -0.6593591, -1.338377, 1, 0.6235294, 0, 1,
-1.185744, -0.2206018, -0.669701, 1, 0.6313726, 0, 1,
-1.180569, -0.6838457, -1.961586, 1, 0.6352941, 0, 1,
-1.180005, -0.5808599, -3.198927, 1, 0.6431373, 0, 1,
-1.179236, 1.316278, -1.966474, 1, 0.6470588, 0, 1,
-1.176846, -0.6536179, -2.496132, 1, 0.654902, 0, 1,
-1.171519, -0.7525895, -0.9423215, 1, 0.6588235, 0, 1,
-1.169723, -0.8855444, -1.380181, 1, 0.6666667, 0, 1,
-1.168231, 0.0742863, -1.383921, 1, 0.6705883, 0, 1,
-1.161969, -0.1979109, -1.710865, 1, 0.6784314, 0, 1,
-1.158711, -0.3501377, -2.632295, 1, 0.682353, 0, 1,
-1.155159, 1.318509, -1.459824, 1, 0.6901961, 0, 1,
-1.142229, -0.1387679, -3.024313, 1, 0.6941177, 0, 1,
-1.134, -0.04550443, -0.407162, 1, 0.7019608, 0, 1,
-1.126686, 1.63893, 0.6550574, 1, 0.7098039, 0, 1,
-1.123648, -0.8017876, -2.400868, 1, 0.7137255, 0, 1,
-1.116148, -1.118311, -3.245541, 1, 0.7215686, 0, 1,
-1.113832, 0.4507738, -0.2399247, 1, 0.7254902, 0, 1,
-1.112867, -1.224484, -5.573203, 1, 0.7333333, 0, 1,
-1.106799, 0.1285349, -1.101026, 1, 0.7372549, 0, 1,
-1.094844, 0.6263788, -0.7132429, 1, 0.7450981, 0, 1,
-1.092489, 2.310122, -1.267013, 1, 0.7490196, 0, 1,
-1.091628, -1.564834, -2.713347, 1, 0.7568628, 0, 1,
-1.088969, -0.5263678, -2.766107, 1, 0.7607843, 0, 1,
-1.072905, -1.112798, -2.596863, 1, 0.7686275, 0, 1,
-1.069557, 0.9150646, -0.6564887, 1, 0.772549, 0, 1,
-1.068508, 0.9526034, 1.234289, 1, 0.7803922, 0, 1,
-1.066215, 0.1183052, -2.166036, 1, 0.7843137, 0, 1,
-1.060036, 0.08498675, -1.704648, 1, 0.7921569, 0, 1,
-1.057702, 0.6154829, -0.8265176, 1, 0.7960784, 0, 1,
-1.053234, -0.5019679, -1.277377, 1, 0.8039216, 0, 1,
-1.05283, 0.6834352, -0.7570145, 1, 0.8117647, 0, 1,
-1.046423, -0.7524524, -1.196561, 1, 0.8156863, 0, 1,
-1.039166, 0.007576723, -2.088008, 1, 0.8235294, 0, 1,
-1.038227, -1.116832, -2.779082, 1, 0.827451, 0, 1,
-1.034002, 0.09428191, -1.269776, 1, 0.8352941, 0, 1,
-1.025707, -0.4333897, -2.672223, 1, 0.8392157, 0, 1,
-1.019976, -1.415426, -3.879129, 1, 0.8470588, 0, 1,
-1.017095, 0.07024417, -0.9222558, 1, 0.8509804, 0, 1,
-1.016259, 0.01893973, -2.130426, 1, 0.8588235, 0, 1,
-1.013904, 1.165275, 0.24374, 1, 0.8627451, 0, 1,
-1.00886, 0.4588151, 0.9793567, 1, 0.8705882, 0, 1,
-1.0041, 1.020642, -0.6157143, 1, 0.8745098, 0, 1,
-1.003802, 0.3612906, 0.4456075, 1, 0.8823529, 0, 1,
-1.002295, -0.9668434, -3.774599, 1, 0.8862745, 0, 1,
-0.9853928, -0.8055966, -1.79956, 1, 0.8941177, 0, 1,
-0.9836689, -1.147411, -3.453303, 1, 0.8980392, 0, 1,
-0.9829722, 2.277954, -1.936043, 1, 0.9058824, 0, 1,
-0.9817874, -1.078688, -1.914092, 1, 0.9137255, 0, 1,
-0.9743159, 1.620056, -1.061284, 1, 0.9176471, 0, 1,
-0.972096, -1.325963, 0.2515946, 1, 0.9254902, 0, 1,
-0.968407, 0.09300737, -1.412918, 1, 0.9294118, 0, 1,
-0.9670854, -0.8413994, -2.484263, 1, 0.9372549, 0, 1,
-0.9651209, -0.3624973, -1.328447, 1, 0.9411765, 0, 1,
-0.9620807, -0.4297428, -1.597049, 1, 0.9490196, 0, 1,
-0.9604006, 2.739422, -0.4513358, 1, 0.9529412, 0, 1,
-0.9601882, 0.9895077, -1.197449, 1, 0.9607843, 0, 1,
-0.9597474, -0.140636, -2.062656, 1, 0.9647059, 0, 1,
-0.9543784, -0.6856822, -2.789608, 1, 0.972549, 0, 1,
-0.9538305, -0.9392012, -2.22424, 1, 0.9764706, 0, 1,
-0.953629, -1.675329, -1.852317, 1, 0.9843137, 0, 1,
-0.9530324, 1.146144, -1.288418, 1, 0.9882353, 0, 1,
-0.9436836, -0.1226641, -2.875321, 1, 0.9960784, 0, 1,
-0.9398066, 1.362056, -0.9939671, 0.9960784, 1, 0, 1,
-0.9335343, -0.7417806, -1.778885, 0.9921569, 1, 0, 1,
-0.932099, -0.05960888, -0.2997706, 0.9843137, 1, 0, 1,
-0.930914, 1.744462, 0.3569445, 0.9803922, 1, 0, 1,
-0.9283155, -0.6257836, -3.295235, 0.972549, 1, 0, 1,
-0.9230083, -2.147799, -2.977973, 0.9686275, 1, 0, 1,
-0.9165538, -0.3513617, -1.353782, 0.9607843, 1, 0, 1,
-0.9164729, -2.229344, -3.849738, 0.9568627, 1, 0, 1,
-0.9158731, -0.7053591, -4.522676, 0.9490196, 1, 0, 1,
-0.914217, 0.2585704, -0.7205253, 0.945098, 1, 0, 1,
-0.9111959, 1.702913, 0.2320761, 0.9372549, 1, 0, 1,
-0.9046611, -0.5261638, -3.97189, 0.9333333, 1, 0, 1,
-0.9034647, -2.407111, -2.891046, 0.9254902, 1, 0, 1,
-0.8992795, -0.1802304, -1.447047, 0.9215686, 1, 0, 1,
-0.898541, 0.1698161, -0.2936276, 0.9137255, 1, 0, 1,
-0.8979213, -0.2560248, -3.704334, 0.9098039, 1, 0, 1,
-0.8960134, -1.370465, -3.557918, 0.9019608, 1, 0, 1,
-0.8914043, 0.9255601, 0.7480619, 0.8941177, 1, 0, 1,
-0.8889537, 0.1146455, -2.357538, 0.8901961, 1, 0, 1,
-0.8856292, 1.975409, 0.1325048, 0.8823529, 1, 0, 1,
-0.8837343, -1.011197, -3.614824, 0.8784314, 1, 0, 1,
-0.88152, 0.09563329, -1.484299, 0.8705882, 1, 0, 1,
-0.8685316, 1.397522, -1.2285, 0.8666667, 1, 0, 1,
-0.8670998, -0.7494223, -1.325177, 0.8588235, 1, 0, 1,
-0.8586291, -0.1373428, -2.335346, 0.854902, 1, 0, 1,
-0.8519336, -0.6563642, -0.7782432, 0.8470588, 1, 0, 1,
-0.8496033, -1.151938, -2.497553, 0.8431373, 1, 0, 1,
-0.8372858, -0.5068249, -4.000865, 0.8352941, 1, 0, 1,
-0.8308495, -1.590859, -3.410033, 0.8313726, 1, 0, 1,
-0.8290321, -0.439186, -2.9615, 0.8235294, 1, 0, 1,
-0.82617, 0.566449, 0.1728916, 0.8196079, 1, 0, 1,
-0.823473, 2.278624, -0.3150418, 0.8117647, 1, 0, 1,
-0.8174111, -1.03204, -1.790986, 0.8078431, 1, 0, 1,
-0.8114634, -0.2876495, -1.065681, 0.8, 1, 0, 1,
-0.8114478, 0.8576948, -2.095428, 0.7921569, 1, 0, 1,
-0.8054829, 0.3187416, -1.224315, 0.7882353, 1, 0, 1,
-0.8022528, 0.6643152, -0.6421312, 0.7803922, 1, 0, 1,
-0.79572, -0.4007232, -2.220254, 0.7764706, 1, 0, 1,
-0.7878956, 1.514948, -0.388066, 0.7686275, 1, 0, 1,
-0.7827506, 0.1901798, -0.3003114, 0.7647059, 1, 0, 1,
-0.7780856, -0.2073939, -1.905004, 0.7568628, 1, 0, 1,
-0.7744923, -1.976231, -2.351745, 0.7529412, 1, 0, 1,
-0.7719936, -1.126581, -3.090693, 0.7450981, 1, 0, 1,
-0.769529, -2.217591, -2.794225, 0.7411765, 1, 0, 1,
-0.7685648, 0.3080862, -1.184212, 0.7333333, 1, 0, 1,
-0.7673584, 0.5362199, -1.700779, 0.7294118, 1, 0, 1,
-0.7669109, 1.437557, -3.01436, 0.7215686, 1, 0, 1,
-0.7650425, -0.8379271, -3.814183, 0.7176471, 1, 0, 1,
-0.7558165, -1.271823, -2.742627, 0.7098039, 1, 0, 1,
-0.7522703, -0.2761856, -4.431301, 0.7058824, 1, 0, 1,
-0.7475007, 0.6645041, 1.118942, 0.6980392, 1, 0, 1,
-0.7383726, 0.3468495, -1.521438, 0.6901961, 1, 0, 1,
-0.738106, -1.603974, -2.650337, 0.6862745, 1, 0, 1,
-0.7358195, -0.4586386, -1.013072, 0.6784314, 1, 0, 1,
-0.7355078, 1.47603, 0.2137497, 0.6745098, 1, 0, 1,
-0.7338866, -1.273712, -2.98857, 0.6666667, 1, 0, 1,
-0.7319611, -0.639187, -2.341789, 0.6627451, 1, 0, 1,
-0.7289172, 0.8825492, 0.1337604, 0.654902, 1, 0, 1,
-0.7209712, -0.8269033, -2.567844, 0.6509804, 1, 0, 1,
-0.7198031, 0.06871834, 0.5936357, 0.6431373, 1, 0, 1,
-0.7159973, 1.441326, -0.4462694, 0.6392157, 1, 0, 1,
-0.704873, -0.2084769, -1.721742, 0.6313726, 1, 0, 1,
-0.7044683, 1.727998, 0.656714, 0.627451, 1, 0, 1,
-0.6999733, 0.4438822, -0.4765661, 0.6196079, 1, 0, 1,
-0.6980501, 0.4680484, -1.693427, 0.6156863, 1, 0, 1,
-0.6976134, 0.5591955, -1.082563, 0.6078432, 1, 0, 1,
-0.6968918, 0.6943952, -0.3063137, 0.6039216, 1, 0, 1,
-0.69627, 0.6304465, -0.5040138, 0.5960785, 1, 0, 1,
-0.6948453, 1.013166, -2.982739, 0.5882353, 1, 0, 1,
-0.6808971, 0.01382689, -1.510771, 0.5843138, 1, 0, 1,
-0.6803828, -0.9409377, -3.053196, 0.5764706, 1, 0, 1,
-0.6764864, 2.53189, -0.8807499, 0.572549, 1, 0, 1,
-0.6762112, 1.044069, -2.293251, 0.5647059, 1, 0, 1,
-0.673423, 0.6199419, -0.1522754, 0.5607843, 1, 0, 1,
-0.6712472, -1.103521, -2.908335, 0.5529412, 1, 0, 1,
-0.6684979, -0.2966692, -2.989681, 0.5490196, 1, 0, 1,
-0.6671147, 2.323769, -1.130122, 0.5411765, 1, 0, 1,
-0.6653621, 1.015482, -0.7100512, 0.5372549, 1, 0, 1,
-0.6621551, -2.02328, -2.945633, 0.5294118, 1, 0, 1,
-0.6596444, 0.6282367, -1.149089, 0.5254902, 1, 0, 1,
-0.6562747, 0.07565826, -2.801284, 0.5176471, 1, 0, 1,
-0.6561913, 1.201367, -0.7709423, 0.5137255, 1, 0, 1,
-0.6559238, -1.546904, -2.791519, 0.5058824, 1, 0, 1,
-0.6547381, 0.9641275, -1.779943, 0.5019608, 1, 0, 1,
-0.6543632, 1.007599, -2.235396, 0.4941176, 1, 0, 1,
-0.652351, -1.882049, -1.08291, 0.4862745, 1, 0, 1,
-0.6477439, 0.2805501, 0.9764836, 0.4823529, 1, 0, 1,
-0.6443558, 1.008131, -0.7657179, 0.4745098, 1, 0, 1,
-0.6442989, 0.5502246, -0.9690666, 0.4705882, 1, 0, 1,
-0.6439596, 0.9960292, -1.098018, 0.4627451, 1, 0, 1,
-0.6428455, -0.5153345, -2.629847, 0.4588235, 1, 0, 1,
-0.6406447, -0.1403508, -2.038013, 0.4509804, 1, 0, 1,
-0.6400356, 0.2643708, -2.70804, 0.4470588, 1, 0, 1,
-0.6398895, 1.462175, -1.75236, 0.4392157, 1, 0, 1,
-0.6369465, 0.7800187, 0.6567988, 0.4352941, 1, 0, 1,
-0.6328384, -2.063224, -2.1297, 0.427451, 1, 0, 1,
-0.6317076, 0.1696377, -2.282125, 0.4235294, 1, 0, 1,
-0.6296361, -0.6651829, -2.5293, 0.4156863, 1, 0, 1,
-0.6255844, 0.9653212, -1.209677, 0.4117647, 1, 0, 1,
-0.6185057, 2.361675, 0.1247445, 0.4039216, 1, 0, 1,
-0.6165068, 0.8690175, -1.637689, 0.3960784, 1, 0, 1,
-0.6157517, -0.05675789, -2.764438, 0.3921569, 1, 0, 1,
-0.6089349, -1.409389, -2.609676, 0.3843137, 1, 0, 1,
-0.6054172, -1.346635, -3.345921, 0.3803922, 1, 0, 1,
-0.6043172, -0.07932914, -1.268171, 0.372549, 1, 0, 1,
-0.6028383, -2.407876, -2.574152, 0.3686275, 1, 0, 1,
-0.5998152, -1.179899, -2.92086, 0.3607843, 1, 0, 1,
-0.5975625, 0.06236817, -2.555267, 0.3568628, 1, 0, 1,
-0.5944461, 0.4305393, -1.456918, 0.3490196, 1, 0, 1,
-0.5907055, -1.272939, -2.331554, 0.345098, 1, 0, 1,
-0.5904445, -1.071828, -2.500201, 0.3372549, 1, 0, 1,
-0.5846279, -0.7607158, -2.717922, 0.3333333, 1, 0, 1,
-0.58025, -0.6341364, -2.90867, 0.3254902, 1, 0, 1,
-0.5768171, -0.646646, -3.005193, 0.3215686, 1, 0, 1,
-0.5761725, -0.0466326, -3.4616, 0.3137255, 1, 0, 1,
-0.5692455, 0.06916402, -0.5357205, 0.3098039, 1, 0, 1,
-0.5616838, 0.6777799, -0.4198075, 0.3019608, 1, 0, 1,
-0.5534572, -0.1478913, -1.323265, 0.2941177, 1, 0, 1,
-0.5512401, 0.4733013, -2.073161, 0.2901961, 1, 0, 1,
-0.5506729, -2.253814, -1.956379, 0.282353, 1, 0, 1,
-0.5484527, 0.7797303, 1.187112, 0.2784314, 1, 0, 1,
-0.5482037, -0.8987719, -2.502394, 0.2705882, 1, 0, 1,
-0.5463932, -0.8644781, -4.421214, 0.2666667, 1, 0, 1,
-0.5405279, -1.344148, -2.3201, 0.2588235, 1, 0, 1,
-0.5386328, 0.18166, 0.642213, 0.254902, 1, 0, 1,
-0.5346299, 1.507633, -1.641228, 0.2470588, 1, 0, 1,
-0.5307368, -0.3025788, -1.382804, 0.2431373, 1, 0, 1,
-0.527052, -0.6717824, -4.267517, 0.2352941, 1, 0, 1,
-0.5264938, -0.5033397, -2.320861, 0.2313726, 1, 0, 1,
-0.5250502, -1.095009, -3.03423, 0.2235294, 1, 0, 1,
-0.5220854, 1.056326, 0.6361565, 0.2196078, 1, 0, 1,
-0.5218269, 1.592544, -0.07331354, 0.2117647, 1, 0, 1,
-0.5171767, 0.2798916, -1.184945, 0.2078431, 1, 0, 1,
-0.515385, 0.1044346, -2.262033, 0.2, 1, 0, 1,
-0.512126, -1.191792, -1.590827, 0.1921569, 1, 0, 1,
-0.510106, 0.3255209, -0.6481259, 0.1882353, 1, 0, 1,
-0.5056385, 1.451522, 2.539562, 0.1803922, 1, 0, 1,
-0.5051644, 0.944588, -1.833668, 0.1764706, 1, 0, 1,
-0.5050492, 1.432608, -0.5513013, 0.1686275, 1, 0, 1,
-0.5043315, -0.3164292, -2.044623, 0.1647059, 1, 0, 1,
-0.5027913, 0.8301256, -1.195612, 0.1568628, 1, 0, 1,
-0.4982193, -1.427319, -1.347945, 0.1529412, 1, 0, 1,
-0.4954107, -0.470605, -0.5873069, 0.145098, 1, 0, 1,
-0.4900287, -0.6476488, -3.070842, 0.1411765, 1, 0, 1,
-0.4890404, 0.08068171, -2.933203, 0.1333333, 1, 0, 1,
-0.4876628, 0.002879574, -1.987857, 0.1294118, 1, 0, 1,
-0.4870159, -0.09030302, -3.238698, 0.1215686, 1, 0, 1,
-0.4869562, -0.3243444, -1.255996, 0.1176471, 1, 0, 1,
-0.4863842, 1.560519, -1.134801, 0.1098039, 1, 0, 1,
-0.4838325, 0.6187372, -0.08309439, 0.1058824, 1, 0, 1,
-0.4808421, -0.45074, -3.181217, 0.09803922, 1, 0, 1,
-0.4756604, -0.7652982, -3.46438, 0.09019608, 1, 0, 1,
-0.4751583, -0.2089409, -2.753054, 0.08627451, 1, 0, 1,
-0.4751129, 0.8973601, -0.5486858, 0.07843138, 1, 0, 1,
-0.4715081, 0.7344496, -0.3238658, 0.07450981, 1, 0, 1,
-0.4705067, -0.2406556, -2.168066, 0.06666667, 1, 0, 1,
-0.4667458, -0.6530942, -2.581489, 0.0627451, 1, 0, 1,
-0.4601666, 1.235046, 0.9530521, 0.05490196, 1, 0, 1,
-0.4594662, 0.5570433, -0.7666252, 0.05098039, 1, 0, 1,
-0.4582194, -0.5442415, -3.476037, 0.04313726, 1, 0, 1,
-0.4580863, 0.8645865, -0.8829226, 0.03921569, 1, 0, 1,
-0.458015, 0.4181887, -1.986442, 0.03137255, 1, 0, 1,
-0.4479623, -0.6900483, -3.284581, 0.02745098, 1, 0, 1,
-0.4432301, 1.90571, -0.1342672, 0.01960784, 1, 0, 1,
-0.442587, 0.8815492, -0.9620353, 0.01568628, 1, 0, 1,
-0.4397638, 1.004281, -1.647688, 0.007843138, 1, 0, 1,
-0.4395743, 0.1476515, -0.7982477, 0.003921569, 1, 0, 1,
-0.4301123, -0.1410456, -3.46213, 0, 1, 0.003921569, 1,
-0.4289941, -0.3855651, -4.045691, 0, 1, 0.01176471, 1,
-0.4282512, -0.9721582, -2.174315, 0, 1, 0.01568628, 1,
-0.4280662, -0.8661778, -0.9592749, 0, 1, 0.02352941, 1,
-0.4186441, -0.2490265, -1.96794, 0, 1, 0.02745098, 1,
-0.4164542, -0.6699711, -1.843044, 0, 1, 0.03529412, 1,
-0.413949, -0.8755702, -3.915936, 0, 1, 0.03921569, 1,
-0.4137052, -0.8646672, -2.778991, 0, 1, 0.04705882, 1,
-0.4093866, -0.2616028, -1.475088, 0, 1, 0.05098039, 1,
-0.4003587, 1.035373, -1.651628, 0, 1, 0.05882353, 1,
-0.3952545, 0.5156308, -0.1549193, 0, 1, 0.0627451, 1,
-0.3858531, 0.2935368, -0.3349322, 0, 1, 0.07058824, 1,
-0.384178, -1.638587, -1.995517, 0, 1, 0.07450981, 1,
-0.381908, -0.9875249, -1.180057, 0, 1, 0.08235294, 1,
-0.3785501, 0.3451139, -0.1387608, 0, 1, 0.08627451, 1,
-0.3774872, -0.2373304, -0.8271046, 0, 1, 0.09411765, 1,
-0.3767897, -0.1169978, -0.06398299, 0, 1, 0.1019608, 1,
-0.3758727, 1.145372, -1.502163, 0, 1, 0.1058824, 1,
-0.3720639, 0.9827515, -0.741105, 0, 1, 0.1137255, 1,
-0.3683351, -0.2911274, -2.117962, 0, 1, 0.1176471, 1,
-0.3636456, 1.410123, 0.08211714, 0, 1, 0.1254902, 1,
-0.3635266, -1.595621, -2.674905, 0, 1, 0.1294118, 1,
-0.3630683, -0.3707723, -2.978751, 0, 1, 0.1372549, 1,
-0.3536038, -0.1268753, -1.491998, 0, 1, 0.1411765, 1,
-0.3530316, -1.677989, -0.8282933, 0, 1, 0.1490196, 1,
-0.352819, -1.090816, -4.23291, 0, 1, 0.1529412, 1,
-0.351091, 0.8756697, -0.6985341, 0, 1, 0.1607843, 1,
-0.3500606, -1.284451, -3.853945, 0, 1, 0.1647059, 1,
-0.3488844, -0.898914, -2.379966, 0, 1, 0.172549, 1,
-0.3469791, 0.1755336, -2.788647, 0, 1, 0.1764706, 1,
-0.3463192, 0.2355566, -0.007199034, 0, 1, 0.1843137, 1,
-0.3463187, -1.833405, -2.197794, 0, 1, 0.1882353, 1,
-0.3426327, 0.1019588, -2.946627, 0, 1, 0.1960784, 1,
-0.3414336, 0.5937873, -1.279113, 0, 1, 0.2039216, 1,
-0.3384305, -0.9848425, -2.654503, 0, 1, 0.2078431, 1,
-0.3373362, -0.4835461, -2.236285, 0, 1, 0.2156863, 1,
-0.3362819, -0.4566521, -2.535505, 0, 1, 0.2196078, 1,
-0.3360516, -0.8788333, -4.485239, 0, 1, 0.227451, 1,
-0.3353644, -0.6451647, -3.50509, 0, 1, 0.2313726, 1,
-0.3311548, -1.007957, -3.197583, 0, 1, 0.2392157, 1,
-0.323787, 0.6659485, -0.5550035, 0, 1, 0.2431373, 1,
-0.3219683, 1.418613, -0.5812367, 0, 1, 0.2509804, 1,
-0.3162317, -0.5932893, -2.440873, 0, 1, 0.254902, 1,
-0.3144996, 0.4423456, -2.109071, 0, 1, 0.2627451, 1,
-0.3143821, 2.286777, -0.8418028, 0, 1, 0.2666667, 1,
-0.3134169, -0.2889591, -2.818258, 0, 1, 0.2745098, 1,
-0.3133262, 0.8192564, 0.3482102, 0, 1, 0.2784314, 1,
-0.3119791, -0.1586565, -1.576347, 0, 1, 0.2862745, 1,
-0.3097905, -2.023021, -2.532019, 0, 1, 0.2901961, 1,
-0.3080738, 0.6592959, -1.62371, 0, 1, 0.2980392, 1,
-0.3068288, -0.5479928, -1.596472, 0, 1, 0.3058824, 1,
-0.3046786, -0.4494243, -1.840566, 0, 1, 0.3098039, 1,
-0.3043776, 1.718786, -1.014791, 0, 1, 0.3176471, 1,
-0.3033137, 0.286376, -0.361768, 0, 1, 0.3215686, 1,
-0.3027465, -0.9440777, -3.986442, 0, 1, 0.3294118, 1,
-0.3022346, -0.3805229, -2.82989, 0, 1, 0.3333333, 1,
-0.3011442, 0.3245172, -0.7893345, 0, 1, 0.3411765, 1,
-0.2887062, -1.021506, -1.081554, 0, 1, 0.345098, 1,
-0.28569, -0.5970679, -2.859605, 0, 1, 0.3529412, 1,
-0.2855407, -0.359825, -2.680099, 0, 1, 0.3568628, 1,
-0.2855289, -0.8664348, -2.492204, 0, 1, 0.3647059, 1,
-0.2854444, 0.9048448, -0.7415934, 0, 1, 0.3686275, 1,
-0.2818539, -1.208452, -2.110359, 0, 1, 0.3764706, 1,
-0.2801916, -1.589253, -2.113133, 0, 1, 0.3803922, 1,
-0.2708144, -2.032031, -3.345832, 0, 1, 0.3882353, 1,
-0.2708082, -0.8107613, -1.94022, 0, 1, 0.3921569, 1,
-0.2698428, 0.4558112, 0.08861048, 0, 1, 0.4, 1,
-0.2638257, 0.3098741, -0.4192904, 0, 1, 0.4078431, 1,
-0.2579755, -0.4960268, -1.614801, 0, 1, 0.4117647, 1,
-0.2570181, -0.1026323, -1.787462, 0, 1, 0.4196078, 1,
-0.2551223, 0.01949381, -2.453372, 0, 1, 0.4235294, 1,
-0.2527426, 2.095735, -0.9045075, 0, 1, 0.4313726, 1,
-0.2434327, -1.277044, -2.933707, 0, 1, 0.4352941, 1,
-0.2430501, 0.4795071, -1.711624, 0, 1, 0.4431373, 1,
-0.2368625, -1.214327, -3.714979, 0, 1, 0.4470588, 1,
-0.2284988, 0.2410761, -1.724354, 0, 1, 0.454902, 1,
-0.2245474, 0.07096515, -0.3299079, 0, 1, 0.4588235, 1,
-0.2223325, -1.067622, -2.313767, 0, 1, 0.4666667, 1,
-0.2220885, 0.5393232, -0.5258678, 0, 1, 0.4705882, 1,
-0.2196464, -0.9078044, -1.650192, 0, 1, 0.4784314, 1,
-0.2194598, 1.696427, -1.981965, 0, 1, 0.4823529, 1,
-0.2193735, -0.631345, -3.104415, 0, 1, 0.4901961, 1,
-0.2187016, 0.2331171, -0.8621855, 0, 1, 0.4941176, 1,
-0.2174925, 1.381554, -1.139061, 0, 1, 0.5019608, 1,
-0.215997, 0.06596091, -0.4958642, 0, 1, 0.509804, 1,
-0.2096173, -0.7888857, -3.771128, 0, 1, 0.5137255, 1,
-0.2094708, -1.653786, -2.666016, 0, 1, 0.5215687, 1,
-0.2053025, 0.5227695, -0.3620996, 0, 1, 0.5254902, 1,
-0.2048747, 0.04343155, 0.03520283, 0, 1, 0.5333334, 1,
-0.2037899, 0.4964492, 0.7193639, 0, 1, 0.5372549, 1,
-0.2014765, 1.095885, -3.473163, 0, 1, 0.5450981, 1,
-0.2009989, 0.8469136, 0.78792, 0, 1, 0.5490196, 1,
-0.2001181, -0.7534919, -2.258434, 0, 1, 0.5568628, 1,
-0.1994852, -1.031558, -3.60991, 0, 1, 0.5607843, 1,
-0.1975971, -0.04466558, -1.440922, 0, 1, 0.5686275, 1,
-0.1975783, 0.2487341, -0.06304251, 0, 1, 0.572549, 1,
-0.194648, -0.1954467, -0.856462, 0, 1, 0.5803922, 1,
-0.1939147, 1.927867, -0.05044538, 0, 1, 0.5843138, 1,
-0.191046, 0.09096347, -0.3519888, 0, 1, 0.5921569, 1,
-0.189937, 0.3057443, -2.321156, 0, 1, 0.5960785, 1,
-0.1890132, -0.4898744, -4.49208, 0, 1, 0.6039216, 1,
-0.1850846, -0.8409994, -2.957622, 0, 1, 0.6117647, 1,
-0.1828488, 1.327134, -0.5926803, 0, 1, 0.6156863, 1,
-0.1797998, -1.842066, -2.561901, 0, 1, 0.6235294, 1,
-0.1788219, -1.689763, -2.573828, 0, 1, 0.627451, 1,
-0.1730127, 0.8336065, 1.102448, 0, 1, 0.6352941, 1,
-0.1704197, -1.096799, -3.24497, 0, 1, 0.6392157, 1,
-0.1698232, 0.7924212, 0.357017, 0, 1, 0.6470588, 1,
-0.1690822, -0.2058658, -2.101435, 0, 1, 0.6509804, 1,
-0.1629078, -0.6717667, -3.32131, 0, 1, 0.6588235, 1,
-0.156855, 0.3894259, 1.600288, 0, 1, 0.6627451, 1,
-0.1546542, -0.3815953, -3.250491, 0, 1, 0.6705883, 1,
-0.1517501, 0.7821845, 0.1876206, 0, 1, 0.6745098, 1,
-0.1509234, -0.6651608, -2.437469, 0, 1, 0.682353, 1,
-0.1454499, 0.6383806, -0.2617936, 0, 1, 0.6862745, 1,
-0.1452939, 0.08878487, -1.101372, 0, 1, 0.6941177, 1,
-0.1450995, -0.08657298, -2.556384, 0, 1, 0.7019608, 1,
-0.144171, 1.357843, -0.3472327, 0, 1, 0.7058824, 1,
-0.1394221, -0.1060151, -0.8837981, 0, 1, 0.7137255, 1,
-0.1364602, 0.6427568, -0.282754, 0, 1, 0.7176471, 1,
-0.1357496, -0.7789949, -3.259457, 0, 1, 0.7254902, 1,
-0.134989, 1.978469, -0.2546247, 0, 1, 0.7294118, 1,
-0.1334467, 1.11285, -0.2776465, 0, 1, 0.7372549, 1,
-0.1314207, 0.02239538, -1.578486, 0, 1, 0.7411765, 1,
-0.1257629, 0.58107, -0.326685, 0, 1, 0.7490196, 1,
-0.1253105, -0.3448852, -2.210776, 0, 1, 0.7529412, 1,
-0.1229554, -0.6366782, -3.270201, 0, 1, 0.7607843, 1,
-0.1215244, -1.087917, -1.905287, 0, 1, 0.7647059, 1,
-0.1198241, 2.496782, 0.1420335, 0, 1, 0.772549, 1,
-0.1130344, 0.3655952, 0.03769412, 0, 1, 0.7764706, 1,
-0.1019392, -1.174683, -1.767886, 0, 1, 0.7843137, 1,
-0.1004199, -0.7029828, -2.413172, 0, 1, 0.7882353, 1,
-0.1004168, -0.5647642, -3.611841, 0, 1, 0.7960784, 1,
-0.09858735, -1.214329, -1.561158, 0, 1, 0.8039216, 1,
-0.09707914, -1.120611, -2.609726, 0, 1, 0.8078431, 1,
-0.09156279, 1.006224, 0.1850923, 0, 1, 0.8156863, 1,
-0.08812146, -0.4887541, -2.948323, 0, 1, 0.8196079, 1,
-0.08791551, 0.7667665, 0.2562507, 0, 1, 0.827451, 1,
-0.08559434, -0.03222768, -2.27613, 0, 1, 0.8313726, 1,
-0.08017976, -0.3214406, -2.350986, 0, 1, 0.8392157, 1,
-0.07816311, -1.575122, -2.323187, 0, 1, 0.8431373, 1,
-0.07207182, -1.754487, -3.734205, 0, 1, 0.8509804, 1,
-0.06750321, -0.03881517, -2.991525, 0, 1, 0.854902, 1,
-0.06303568, 1.781316, 0.4530442, 0, 1, 0.8627451, 1,
-0.0622201, -0.4195413, -1.211804, 0, 1, 0.8666667, 1,
-0.05837806, 0.1542777, -0.8021203, 0, 1, 0.8745098, 1,
-0.05666657, -2.012069, -2.782459, 0, 1, 0.8784314, 1,
-0.05472681, -0.267849, -5.689565, 0, 1, 0.8862745, 1,
-0.04972233, 0.5917072, 0.4045078, 0, 1, 0.8901961, 1,
-0.04715801, 0.1695343, 0.1383786, 0, 1, 0.8980392, 1,
-0.04664499, 0.3131276, -0.7097874, 0, 1, 0.9058824, 1,
-0.04649319, 0.2115472, -1.158071, 0, 1, 0.9098039, 1,
-0.04382293, -1.340874, -2.340008, 0, 1, 0.9176471, 1,
-0.03689703, 1.163621, 0.08169668, 0, 1, 0.9215686, 1,
-0.03620262, -0.4923707, -4.229011, 0, 1, 0.9294118, 1,
-0.03569857, 1.319668, -0.3736611, 0, 1, 0.9333333, 1,
-0.03458125, -0.2042406, -3.410998, 0, 1, 0.9411765, 1,
-0.0344786, 0.1124437, -0.2490762, 0, 1, 0.945098, 1,
-0.03001837, -0.02675144, -1.97718, 0, 1, 0.9529412, 1,
-0.02901563, -0.9488711, -4.476298, 0, 1, 0.9568627, 1,
-0.02810798, 0.6393272, -0.04871891, 0, 1, 0.9647059, 1,
-0.02810533, 0.8695365, 0.5716796, 0, 1, 0.9686275, 1,
-0.0240232, 0.8926409, 1.258778, 0, 1, 0.9764706, 1,
-0.01964881, -0.7964847, -2.200562, 0, 1, 0.9803922, 1,
-0.01761964, 0.4680701, -1.497728, 0, 1, 0.9882353, 1,
-0.01514452, 1.355924, 2.383595, 0, 1, 0.9921569, 1,
-0.01371541, -1.127226, -2.962354, 0, 1, 1, 1,
-0.0114724, -0.7508082, -4.094096, 0, 0.9921569, 1, 1,
-0.008342496, -0.3423852, -2.618918, 0, 0.9882353, 1, 1,
-0.008081521, 1.296826, 0.1942804, 0, 0.9803922, 1, 1,
-0.00757434, -0.86004, -2.52951, 0, 0.9764706, 1, 1,
-0.006062503, 0.8826062, 0.1807505, 0, 0.9686275, 1, 1,
-0.005500352, 1.553014, -0.06444766, 0, 0.9647059, 1, 1,
-0.003181915, 0.9562075, 0.261919, 0, 0.9568627, 1, 1,
0.0008079815, 0.4490326, -1.738717, 0, 0.9529412, 1, 1,
0.00505952, -0.9965577, 2.652394, 0, 0.945098, 1, 1,
0.005468364, -0.05187304, 3.758233, 0, 0.9411765, 1, 1,
0.008213106, 1.032909, -0.4376653, 0, 0.9333333, 1, 1,
0.009569237, 0.3942452, 1.464215, 0, 0.9294118, 1, 1,
0.01304576, 1.513531, 0.307541, 0, 0.9215686, 1, 1,
0.01377936, 0.5704823, 1.233114, 0, 0.9176471, 1, 1,
0.01513956, -0.2009056, 1.324439, 0, 0.9098039, 1, 1,
0.01778937, 0.1734653, -0.9366273, 0, 0.9058824, 1, 1,
0.02181454, -0.004162984, 2.481507, 0, 0.8980392, 1, 1,
0.02183604, 1.556178, 0.6595211, 0, 0.8901961, 1, 1,
0.02194482, 0.4343289, 1.119107, 0, 0.8862745, 1, 1,
0.02476999, 1.449277, -0.3753538, 0, 0.8784314, 1, 1,
0.02863851, -0.6511977, 3.503176, 0, 0.8745098, 1, 1,
0.03269966, -0.4821519, 2.393716, 0, 0.8666667, 1, 1,
0.03321584, 0.6626081, 1.186272, 0, 0.8627451, 1, 1,
0.03750841, 0.6765307, -0.206724, 0, 0.854902, 1, 1,
0.04498477, 0.1092708, -0.3866053, 0, 0.8509804, 1, 1,
0.04622348, -0.7934792, 1.828534, 0, 0.8431373, 1, 1,
0.04634576, 0.3994192, -0.6146632, 0, 0.8392157, 1, 1,
0.04673547, -0.8544238, 1.885924, 0, 0.8313726, 1, 1,
0.04692853, 0.7170076, -2.405212, 0, 0.827451, 1, 1,
0.04834193, -1.01468, 1.801389, 0, 0.8196079, 1, 1,
0.05288444, 0.3358537, -0.423759, 0, 0.8156863, 1, 1,
0.06930692, -0.2843394, 3.524459, 0, 0.8078431, 1, 1,
0.07371906, 0.7622159, -0.9077774, 0, 0.8039216, 1, 1,
0.07763276, 0.3759897, -0.8081687, 0, 0.7960784, 1, 1,
0.08263385, -0.5046482, 3.252046, 0, 0.7882353, 1, 1,
0.0833535, -2.008045, 3.380724, 0, 0.7843137, 1, 1,
0.09405632, 0.7744719, -0.6235557, 0, 0.7764706, 1, 1,
0.09408329, -1.08381, 4.505467, 0, 0.772549, 1, 1,
0.09737778, -1.746135, 3.867013, 0, 0.7647059, 1, 1,
0.1046492, -2.129447, 2.756373, 0, 0.7607843, 1, 1,
0.1054981, 1.337639, 1.017709, 0, 0.7529412, 1, 1,
0.1057164, 0.7646168, 0.1970159, 0, 0.7490196, 1, 1,
0.105754, 0.08630007, 0.3508544, 0, 0.7411765, 1, 1,
0.1111806, -1.130046, 2.770376, 0, 0.7372549, 1, 1,
0.111663, -1.433268, 3.896836, 0, 0.7294118, 1, 1,
0.1150799, 1.789755, -0.421562, 0, 0.7254902, 1, 1,
0.1152303, -0.1684516, 2.439642, 0, 0.7176471, 1, 1,
0.1155618, -0.6463993, 3.235152, 0, 0.7137255, 1, 1,
0.122977, 0.02544629, 0.598559, 0, 0.7058824, 1, 1,
0.1235107, -1.047332, 3.259593, 0, 0.6980392, 1, 1,
0.1253162, -0.166867, 1.428474, 0, 0.6941177, 1, 1,
0.1354787, -1.258044, 3.54617, 0, 0.6862745, 1, 1,
0.1386617, -0.9327938, 2.180002, 0, 0.682353, 1, 1,
0.1468671, 1.479644, -0.1398798, 0, 0.6745098, 1, 1,
0.1532923, -1.370814, 4.250226, 0, 0.6705883, 1, 1,
0.1540258, 0.2587847, -0.6293542, 0, 0.6627451, 1, 1,
0.1545269, 0.2434052, 1.552873, 0, 0.6588235, 1, 1,
0.1552723, 1.583473, 0.09520563, 0, 0.6509804, 1, 1,
0.1583004, 0.7246562, 0.5140417, 0, 0.6470588, 1, 1,
0.1613375, 0.2222712, 0.6135458, 0, 0.6392157, 1, 1,
0.1621882, 2.478255, 0.6521196, 0, 0.6352941, 1, 1,
0.1713301, -0.307312, 2.568465, 0, 0.627451, 1, 1,
0.1746934, 0.0248716, 1.364786, 0, 0.6235294, 1, 1,
0.1777427, -1.572186, 4.661659, 0, 0.6156863, 1, 1,
0.1784981, 0.2260452, 0.8621095, 0, 0.6117647, 1, 1,
0.1882097, 0.3142407, 1.318431, 0, 0.6039216, 1, 1,
0.1898424, 0.3084522, 1.000163, 0, 0.5960785, 1, 1,
0.1925684, -2.339501, 4.113245, 0, 0.5921569, 1, 1,
0.1948306, 0.1374435, -0.6760503, 0, 0.5843138, 1, 1,
0.1963046, 0.5094168, 1.226737, 0, 0.5803922, 1, 1,
0.1977307, -0.2916693, 3.07552, 0, 0.572549, 1, 1,
0.1999326, -0.5820302, 2.821474, 0, 0.5686275, 1, 1,
0.2037421, 0.1967393, 0.9204488, 0, 0.5607843, 1, 1,
0.2051648, -1.320176, 1.251718, 0, 0.5568628, 1, 1,
0.2134344, -0.8245075, 0.6220113, 0, 0.5490196, 1, 1,
0.2167166, 1.621785, 1.352165, 0, 0.5450981, 1, 1,
0.219455, -1.170294, 2.394224, 0, 0.5372549, 1, 1,
0.223873, 0.972073, -0.4435042, 0, 0.5333334, 1, 1,
0.2261965, 0.7416245, -1.355128, 0, 0.5254902, 1, 1,
0.2286261, -0.1526848, 0.6125084, 0, 0.5215687, 1, 1,
0.2290643, -0.7132877, 3.902578, 0, 0.5137255, 1, 1,
0.2296105, 1.646702, 0.972048, 0, 0.509804, 1, 1,
0.2302131, 2.188792, -1.376257, 0, 0.5019608, 1, 1,
0.230909, 0.6939443, 0.5562055, 0, 0.4941176, 1, 1,
0.2310379, -0.09557971, 1.649381, 0, 0.4901961, 1, 1,
0.2322452, 0.2422229, 0.2517326, 0, 0.4823529, 1, 1,
0.2377376, -1.98993, 3.089608, 0, 0.4784314, 1, 1,
0.2395947, 0.3455756, 0.4885339, 0, 0.4705882, 1, 1,
0.2467045, 0.7850431, 0.1458369, 0, 0.4666667, 1, 1,
0.2603537, 1.805001, 0.2463088, 0, 0.4588235, 1, 1,
0.2685126, -0.2702382, 2.204344, 0, 0.454902, 1, 1,
0.2693239, -1.083659, 3.016836, 0, 0.4470588, 1, 1,
0.2725312, 0.1347502, 1.818028, 0, 0.4431373, 1, 1,
0.2764016, 1.236563, 0.7380219, 0, 0.4352941, 1, 1,
0.2801672, 1.33019, 2.569359, 0, 0.4313726, 1, 1,
0.2811493, 0.4171364, 1.43562, 0, 0.4235294, 1, 1,
0.2816364, 0.8541914, 0.420191, 0, 0.4196078, 1, 1,
0.2858818, -0.573748, 2.08313, 0, 0.4117647, 1, 1,
0.2873714, -1.110422, 1.892454, 0, 0.4078431, 1, 1,
0.2877499, 0.09816518, 0.4846255, 0, 0.4, 1, 1,
0.2910449, -0.4581838, 3.824278, 0, 0.3921569, 1, 1,
0.2918057, -1.134751, 2.853937, 0, 0.3882353, 1, 1,
0.2956186, -0.2038759, 2.447992, 0, 0.3803922, 1, 1,
0.2991426, -0.1896507, 3.075815, 0, 0.3764706, 1, 1,
0.2991838, 0.7828603, 0.8294666, 0, 0.3686275, 1, 1,
0.2993553, -0.8146383, 0.7945896, 0, 0.3647059, 1, 1,
0.304248, -0.7300712, 2.744639, 0, 0.3568628, 1, 1,
0.3067327, -1.585562, 1.952914, 0, 0.3529412, 1, 1,
0.3080041, 1.742245, 0.1931417, 0, 0.345098, 1, 1,
0.3113221, 0.1861892, 1.204786, 0, 0.3411765, 1, 1,
0.3132767, 0.2741143, 1.673575, 0, 0.3333333, 1, 1,
0.3146802, 0.4361972, -0.1835719, 0, 0.3294118, 1, 1,
0.3148877, -0.2624667, 1.410605, 0, 0.3215686, 1, 1,
0.3149885, -0.04349041, 2.136591, 0, 0.3176471, 1, 1,
0.3270556, -0.4599425, 3.157597, 0, 0.3098039, 1, 1,
0.3285362, 0.8799682, 0.01430298, 0, 0.3058824, 1, 1,
0.3301505, 0.2987956, 0.3189054, 0, 0.2980392, 1, 1,
0.3310576, -0.8916383, 4.722349, 0, 0.2901961, 1, 1,
0.3338654, 0.1950197, 1.083446, 0, 0.2862745, 1, 1,
0.3364049, 0.1172332, 1.042139, 0, 0.2784314, 1, 1,
0.3399755, -0.6390032, 2.649093, 0, 0.2745098, 1, 1,
0.3418775, 0.792498, 0.8801199, 0, 0.2666667, 1, 1,
0.3434764, 0.7973568, 0.4240412, 0, 0.2627451, 1, 1,
0.3457284, 0.8486862, 1.233766, 0, 0.254902, 1, 1,
0.3462859, 0.5102912, 0.7780447, 0, 0.2509804, 1, 1,
0.3486262, -0.7390441, 3.590711, 0, 0.2431373, 1, 1,
0.3488247, 0.678099, -0.3704093, 0, 0.2392157, 1, 1,
0.3548007, -1.309307, 2.435211, 0, 0.2313726, 1, 1,
0.3553838, -0.02981924, 3.426509, 0, 0.227451, 1, 1,
0.3556279, -0.5453377, 3.180526, 0, 0.2196078, 1, 1,
0.3570247, 1.267287, 2.401085, 0, 0.2156863, 1, 1,
0.3572327, 0.5227447, 1.426545, 0, 0.2078431, 1, 1,
0.3595191, -1.381403, 3.843066, 0, 0.2039216, 1, 1,
0.3622455, 0.2158514, 2.526443, 0, 0.1960784, 1, 1,
0.3699183, -1.024925, 2.845149, 0, 0.1882353, 1, 1,
0.3735516, -0.9631304, 2.60737, 0, 0.1843137, 1, 1,
0.3760589, -0.4855391, 3.0478, 0, 0.1764706, 1, 1,
0.3797163, -0.5407142, 2.043705, 0, 0.172549, 1, 1,
0.3811821, 0.5840141, 0.8679116, 0, 0.1647059, 1, 1,
0.3825821, -2.01683, 3.072551, 0, 0.1607843, 1, 1,
0.3826299, 0.0001825911, 2.380103, 0, 0.1529412, 1, 1,
0.3828711, -0.01568747, 1.739508, 0, 0.1490196, 1, 1,
0.3837949, -1.156731, 3.858886, 0, 0.1411765, 1, 1,
0.3838817, -1.128725, 3.154866, 0, 0.1372549, 1, 1,
0.3857397, 0.3069296, 2.165417, 0, 0.1294118, 1, 1,
0.3880326, -0.2028765, 3.269976, 0, 0.1254902, 1, 1,
0.3927265, 0.04787958, 1.754779, 0, 0.1176471, 1, 1,
0.399428, -1.552098, 2.826373, 0, 0.1137255, 1, 1,
0.4046945, -2.534227, 4.390336, 0, 0.1058824, 1, 1,
0.4066581, 0.466614, 0.04963646, 0, 0.09803922, 1, 1,
0.4127775, -0.2551728, 0.9690143, 0, 0.09411765, 1, 1,
0.4133662, -2.227728, 2.53637, 0, 0.08627451, 1, 1,
0.4145984, -0.4708825, 2.367762, 0, 0.08235294, 1, 1,
0.4192412, -1.826025, 4.478426, 0, 0.07450981, 1, 1,
0.427594, -1.803407, 2.517707, 0, 0.07058824, 1, 1,
0.4311908, -0.4275293, 1.685727, 0, 0.0627451, 1, 1,
0.4313797, -1.444689, 3.000063, 0, 0.05882353, 1, 1,
0.4317536, -0.4912052, 2.117633, 0, 0.05098039, 1, 1,
0.4317626, 0.6958578, 0.8598316, 0, 0.04705882, 1, 1,
0.4379326, -0.9695023, 3.336773, 0, 0.03921569, 1, 1,
0.4392573, -0.2556595, 1.119105, 0, 0.03529412, 1, 1,
0.4394411, 1.800062, -1.151356, 0, 0.02745098, 1, 1,
0.44003, 0.9205914, -0.2465466, 0, 0.02352941, 1, 1,
0.4434036, 0.07689127, 2.456086, 0, 0.01568628, 1, 1,
0.4435857, 0.09943288, 0.6957872, 0, 0.01176471, 1, 1,
0.4444743, 0.3785622, 2.334223, 0, 0.003921569, 1, 1,
0.4485275, -0.1657484, 1.798353, 0.003921569, 0, 1, 1,
0.4493022, -0.1165157, 1.52057, 0.007843138, 0, 1, 1,
0.4496386, 1.221568, 1.98893, 0.01568628, 0, 1, 1,
0.4508491, -1.472921, 2.713586, 0.01960784, 0, 1, 1,
0.4551674, 0.07551279, 1.782857, 0.02745098, 0, 1, 1,
0.4551988, 0.5198439, 1.196871, 0.03137255, 0, 1, 1,
0.4552609, -2.533294, 2.93028, 0.03921569, 0, 1, 1,
0.4615239, -0.5430594, 1.890789, 0.04313726, 0, 1, 1,
0.465634, -1.642525, 4.41678, 0.05098039, 0, 1, 1,
0.4691639, 0.1783261, 0.8846747, 0.05490196, 0, 1, 1,
0.4701412, -0.2657477, 2.832495, 0.0627451, 0, 1, 1,
0.4729049, 0.5612944, 0.3283707, 0.06666667, 0, 1, 1,
0.4732637, -0.3110194, 2.767798, 0.07450981, 0, 1, 1,
0.4790613, -0.1810189, 2.871726, 0.07843138, 0, 1, 1,
0.4810537, -0.06375653, 2.054806, 0.08627451, 0, 1, 1,
0.4821168, -0.9650107, 4.357295, 0.09019608, 0, 1, 1,
0.4823101, -1.257219, 4.185764, 0.09803922, 0, 1, 1,
0.4841964, -0.7296571, 1.810644, 0.1058824, 0, 1, 1,
0.4847359, -0.4439665, 3.088701, 0.1098039, 0, 1, 1,
0.4857116, 1.3235, 1.019884, 0.1176471, 0, 1, 1,
0.4860404, -0.8083056, 3.000102, 0.1215686, 0, 1, 1,
0.4896233, 0.0266819, 0.146457, 0.1294118, 0, 1, 1,
0.4910111, 1.172611, 1.574897, 0.1333333, 0, 1, 1,
0.500555, -1.599014, 3.033222, 0.1411765, 0, 1, 1,
0.5019135, 3.170859, 0.5613548, 0.145098, 0, 1, 1,
0.5050592, 0.731227, 1.397928, 0.1529412, 0, 1, 1,
0.5066834, -0.3124024, 1.050848, 0.1568628, 0, 1, 1,
0.5158495, 0.6980364, 0.1956397, 0.1647059, 0, 1, 1,
0.5161769, 0.3944626, -0.4484132, 0.1686275, 0, 1, 1,
0.5168999, -0.3187307, 1.468509, 0.1764706, 0, 1, 1,
0.5191687, -1.753409, 2.643766, 0.1803922, 0, 1, 1,
0.5206239, -0.1858069, 2.952323, 0.1882353, 0, 1, 1,
0.5271086, -0.3905543, 2.85989, 0.1921569, 0, 1, 1,
0.5277566, 1.143025, 2.688289, 0.2, 0, 1, 1,
0.528555, 1.641009, 2.348866, 0.2078431, 0, 1, 1,
0.5341096, -1.9717, 2.395146, 0.2117647, 0, 1, 1,
0.5351837, -1.103689, 2.832995, 0.2196078, 0, 1, 1,
0.5358242, -1.982373, 5.100728, 0.2235294, 0, 1, 1,
0.5431448, 0.82778, 0.6341234, 0.2313726, 0, 1, 1,
0.54627, -0.3231018, 0.6550959, 0.2352941, 0, 1, 1,
0.5490894, 2.324737, 0.6262901, 0.2431373, 0, 1, 1,
0.5552227, 0.04765102, 0.6025352, 0.2470588, 0, 1, 1,
0.5620171, -0.5905117, 1.864202, 0.254902, 0, 1, 1,
0.5626217, 0.4279049, 0.8029452, 0.2588235, 0, 1, 1,
0.5649344, 1.938814, 0.8400435, 0.2666667, 0, 1, 1,
0.5666795, -0.8838891, 2.45766, 0.2705882, 0, 1, 1,
0.5731748, 0.4350604, 0.1887029, 0.2784314, 0, 1, 1,
0.5741746, 1.142772, 1.259361, 0.282353, 0, 1, 1,
0.5745906, 0.297957, 0.1329181, 0.2901961, 0, 1, 1,
0.576819, -1.586629, 1.774328, 0.2941177, 0, 1, 1,
0.5792994, -0.01618239, 0.2583428, 0.3019608, 0, 1, 1,
0.58113, -0.3695765, 2.971033, 0.3098039, 0, 1, 1,
0.5831175, 1.084879, -1.290133, 0.3137255, 0, 1, 1,
0.5833327, 1.319444, 0.06561117, 0.3215686, 0, 1, 1,
0.5834014, -0.03904302, 3.400081, 0.3254902, 0, 1, 1,
0.5848767, 0.4515146, 0.3082043, 0.3333333, 0, 1, 1,
0.5856824, -2.027562, 2.867841, 0.3372549, 0, 1, 1,
0.5890248, -0.04725355, 2.256534, 0.345098, 0, 1, 1,
0.5890677, -1.323123, 2.131594, 0.3490196, 0, 1, 1,
0.5897603, 0.4093441, 1.462688, 0.3568628, 0, 1, 1,
0.5930747, -0.01829413, 1.949605, 0.3607843, 0, 1, 1,
0.5941211, 0.3756937, -0.0960801, 0.3686275, 0, 1, 1,
0.5953593, -0.1281908, 1.312892, 0.372549, 0, 1, 1,
0.6025359, -2.897326, 4.122314, 0.3803922, 0, 1, 1,
0.603493, 0.4956371, 0.5575776, 0.3843137, 0, 1, 1,
0.6093801, 0.5190353, 0.3155887, 0.3921569, 0, 1, 1,
0.6099474, -0.2670233, 0.3112807, 0.3960784, 0, 1, 1,
0.6151775, 0.3226243, 0.9255465, 0.4039216, 0, 1, 1,
0.6154016, -0.3354686, 1.131897, 0.4117647, 0, 1, 1,
0.6245388, -0.414399, 3.288125, 0.4156863, 0, 1, 1,
0.6251837, 0.7653537, -0.1440051, 0.4235294, 0, 1, 1,
0.6262127, -0.1800147, 2.092896, 0.427451, 0, 1, 1,
0.6379931, -0.7701854, 3.235921, 0.4352941, 0, 1, 1,
0.6425834, 0.6031401, -0.1450809, 0.4392157, 0, 1, 1,
0.6456577, -0.1426748, 3.421165, 0.4470588, 0, 1, 1,
0.648192, -0.585272, 1.05152, 0.4509804, 0, 1, 1,
0.6493756, 0.5853764, 0.1134586, 0.4588235, 0, 1, 1,
0.650759, 1.426081, 2.528409, 0.4627451, 0, 1, 1,
0.6509357, -0.8145124, 2.275064, 0.4705882, 0, 1, 1,
0.6558883, -0.4264083, 1.295264, 0.4745098, 0, 1, 1,
0.6572249, 1.034156, 1.840086, 0.4823529, 0, 1, 1,
0.6575379, -0.1693406, 2.027449, 0.4862745, 0, 1, 1,
0.6608845, 0.0399272, 1.072308, 0.4941176, 0, 1, 1,
0.6631006, -0.5755241, 2.733662, 0.5019608, 0, 1, 1,
0.6635601, -0.1132391, 2.268681, 0.5058824, 0, 1, 1,
0.6702045, 1.862984, -0.1343236, 0.5137255, 0, 1, 1,
0.6735521, 0.3648382, 0.4759571, 0.5176471, 0, 1, 1,
0.6736651, -0.267679, 0.8825375, 0.5254902, 0, 1, 1,
0.6755888, -0.04957787, 1.25599, 0.5294118, 0, 1, 1,
0.6776537, -0.5079039, 2.423357, 0.5372549, 0, 1, 1,
0.69297, -1.330982, 1.527789, 0.5411765, 0, 1, 1,
0.6987339, -0.8793904, 1.773909, 0.5490196, 0, 1, 1,
0.7078429, -1.764463, 2.624558, 0.5529412, 0, 1, 1,
0.7110435, 0.5801227, 0.5533621, 0.5607843, 0, 1, 1,
0.7136856, 0.6459799, 1.542319, 0.5647059, 0, 1, 1,
0.7138014, -2.116977, 2.29067, 0.572549, 0, 1, 1,
0.7205929, -1.382619, 3.828839, 0.5764706, 0, 1, 1,
0.7252989, 1.261381, 0.7454115, 0.5843138, 0, 1, 1,
0.7265295, 1.087502, 1.925273, 0.5882353, 0, 1, 1,
0.7274934, 1.123581, -0.9476443, 0.5960785, 0, 1, 1,
0.7276576, 1.016925, 2.42846, 0.6039216, 0, 1, 1,
0.7277458, -0.03273411, 1.265811, 0.6078432, 0, 1, 1,
0.7305423, -0.1980792, 1.285328, 0.6156863, 0, 1, 1,
0.7324623, -0.2111515, 0.9071759, 0.6196079, 0, 1, 1,
0.7344052, -0.6299263, 0.8437265, 0.627451, 0, 1, 1,
0.7359612, 0.1941053, 1.580052, 0.6313726, 0, 1, 1,
0.7440993, 1.551109, 0.3327439, 0.6392157, 0, 1, 1,
0.7499613, -0.1674623, 2.864099, 0.6431373, 0, 1, 1,
0.7510019, 0.2452966, 1.063627, 0.6509804, 0, 1, 1,
0.7531118, 0.2085358, 2.784081, 0.654902, 0, 1, 1,
0.7552401, -0.00644126, 1.678521, 0.6627451, 0, 1, 1,
0.7558694, 1.330329, -0.3225841, 0.6666667, 0, 1, 1,
0.7609913, 0.229997, 2.106939, 0.6745098, 0, 1, 1,
0.7615815, 0.9387031, -0.2336371, 0.6784314, 0, 1, 1,
0.7651796, -0.5506834, 2.105685, 0.6862745, 0, 1, 1,
0.7661335, 0.1611077, 0.06104326, 0.6901961, 0, 1, 1,
0.7864446, -1.429087, 2.59734, 0.6980392, 0, 1, 1,
0.7951018, -0.05722351, 1.147004, 0.7058824, 0, 1, 1,
0.7962168, 1.746312, 1.957325, 0.7098039, 0, 1, 1,
0.8040984, -0.4742918, 1.041618, 0.7176471, 0, 1, 1,
0.8043277, 1.03185, 2.730358, 0.7215686, 0, 1, 1,
0.8133786, -0.9035257, 4.340638, 0.7294118, 0, 1, 1,
0.8171179, 1.329377, 0.3316665, 0.7333333, 0, 1, 1,
0.818343, -0.4699395, 1.645375, 0.7411765, 0, 1, 1,
0.8221385, 0.8523004, -0.2190481, 0.7450981, 0, 1, 1,
0.8235831, -1.364, 3.124657, 0.7529412, 0, 1, 1,
0.8238144, -0.4901389, 1.975804, 0.7568628, 0, 1, 1,
0.8240184, -0.6789063, 0.4219035, 0.7647059, 0, 1, 1,
0.8304695, 0.07345265, 0.8466045, 0.7686275, 0, 1, 1,
0.835506, 1.817264, -0.0192917, 0.7764706, 0, 1, 1,
0.8362028, 1.041952, 1.268343, 0.7803922, 0, 1, 1,
0.8464304, 0.2943301, 1.383007, 0.7882353, 0, 1, 1,
0.8509411, -0.920198, 1.549934, 0.7921569, 0, 1, 1,
0.8537942, -1.285159, 2.021394, 0.8, 0, 1, 1,
0.8571846, -1.62848, 2.901215, 0.8078431, 0, 1, 1,
0.8591896, 0.05034207, 0.7045196, 0.8117647, 0, 1, 1,
0.8591997, 1.347317, -0.987652, 0.8196079, 0, 1, 1,
0.8658158, 0.6708148, 1.113968, 0.8235294, 0, 1, 1,
0.8718828, 0.3714224, 0.2782408, 0.8313726, 0, 1, 1,
0.8729879, 0.6246678, 0.5315391, 0.8352941, 0, 1, 1,
0.8768224, 1.916343, 2.146036, 0.8431373, 0, 1, 1,
0.8774078, 0.7259314, 2.029081, 0.8470588, 0, 1, 1,
0.8806326, -0.7672156, 0.5430168, 0.854902, 0, 1, 1,
0.8816363, 2.445287, -1.267301, 0.8588235, 0, 1, 1,
0.8827044, 0.02304105, 0.3180656, 0.8666667, 0, 1, 1,
0.8827335, 1.255138, 2.19049, 0.8705882, 0, 1, 1,
0.8860017, -0.001009289, 2.23262, 0.8784314, 0, 1, 1,
0.8886069, -0.6244642, 2.543457, 0.8823529, 0, 1, 1,
0.8924147, 0.9351724, 1.019889, 0.8901961, 0, 1, 1,
0.8989015, 1.16192, 2.477309, 0.8941177, 0, 1, 1,
0.8992859, 0.2036579, 1.192908, 0.9019608, 0, 1, 1,
0.899904, 1.616816, 1.531896, 0.9098039, 0, 1, 1,
0.9070298, -1.621106, 3.890328, 0.9137255, 0, 1, 1,
0.9099441, 0.3050492, 2.215053, 0.9215686, 0, 1, 1,
0.913124, -1.006257, 2.793749, 0.9254902, 0, 1, 1,
0.9138947, -2.040805, 1.636018, 0.9333333, 0, 1, 1,
0.921436, -2.262233, 2.129347, 0.9372549, 0, 1, 1,
0.925622, -0.05294378, 1.445609, 0.945098, 0, 1, 1,
0.9283394, 0.4940061, 1.463745, 0.9490196, 0, 1, 1,
0.9296812, -0.3289059, 1.877336, 0.9568627, 0, 1, 1,
0.9310331, -0.5300651, 2.333742, 0.9607843, 0, 1, 1,
0.9429483, -0.4899388, 1.799415, 0.9686275, 0, 1, 1,
0.9459691, -0.04404626, 1.972557, 0.972549, 0, 1, 1,
0.9467473, 0.8225129, 1.100592, 0.9803922, 0, 1, 1,
0.948904, -1.355635, 2.206223, 0.9843137, 0, 1, 1,
0.9517866, 0.6458652, 2.041808, 0.9921569, 0, 1, 1,
0.9559014, -1.53581, 1.981504, 0.9960784, 0, 1, 1,
0.9577219, -0.0504838, 0.9351807, 1, 0, 0.9960784, 1,
0.9584477, -0.7817253, 2.109196, 1, 0, 0.9882353, 1,
0.9613088, -0.8178647, 1.985262, 1, 0, 0.9843137, 1,
0.9704429, 0.2178696, 1.361655, 1, 0, 0.9764706, 1,
0.9780133, -3.172299, 1.536314, 1, 0, 0.972549, 1,
0.9811856, 0.3513265, 2.264561, 1, 0, 0.9647059, 1,
0.9831134, -0.2573597, 1.119224, 1, 0, 0.9607843, 1,
0.9920598, 0.1675436, 2.098329, 1, 0, 0.9529412, 1,
0.9992532, 1.844559, 1.974399, 1, 0, 0.9490196, 1,
1.000238, -0.2821111, 1.14364, 1, 0, 0.9411765, 1,
1.001647, -0.6879091, 1.720586, 1, 0, 0.9372549, 1,
1.00374, -0.1800848, 1.077379, 1, 0, 0.9294118, 1,
1.004979, 1.16318, 0.175859, 1, 0, 0.9254902, 1,
1.005212, -0.5522861, 1.448281, 1, 0, 0.9176471, 1,
1.01, 1.907793, -0.3798227, 1, 0, 0.9137255, 1,
1.017555, -0.5322478, 1.288837, 1, 0, 0.9058824, 1,
1.02706, -0.9365972, 1.588153, 1, 0, 0.9019608, 1,
1.031125, -0.2595192, 2.837846, 1, 0, 0.8941177, 1,
1.035062, -0.7343573, 2.541309, 1, 0, 0.8862745, 1,
1.035979, -0.9250012, 1.673565, 1, 0, 0.8823529, 1,
1.047095, 0.6160555, 0.2728449, 1, 0, 0.8745098, 1,
1.047187, 0.0999667, 0.1366659, 1, 0, 0.8705882, 1,
1.055761, -0.4166702, 2.461035, 1, 0, 0.8627451, 1,
1.067006, -0.9348987, 1.280459, 1, 0, 0.8588235, 1,
1.071247, -0.6984134, 1.672632, 1, 0, 0.8509804, 1,
1.078932, -0.6616723, 1.315358, 1, 0, 0.8470588, 1,
1.081118, -0.5995317, 2.825558, 1, 0, 0.8392157, 1,
1.081974, -0.3183728, 1.961321, 1, 0, 0.8352941, 1,
1.088835, 0.485229, 1.460423, 1, 0, 0.827451, 1,
1.097333, -0.3363343, 1.689174, 1, 0, 0.8235294, 1,
1.11632, 0.3010518, 3.090854, 1, 0, 0.8156863, 1,
1.12112, 0.9655055, 1.997072, 1, 0, 0.8117647, 1,
1.127258, -0.4987715, 1.227099, 1, 0, 0.8039216, 1,
1.128161, -2.256603, 3.315138, 1, 0, 0.7960784, 1,
1.128379, 0.5057451, -0.6924317, 1, 0, 0.7921569, 1,
1.133324, -2.116988, 4.139264, 1, 0, 0.7843137, 1,
1.138929, -0.7023424, 3.049119, 1, 0, 0.7803922, 1,
1.139453, -1.279707, 3.220975, 1, 0, 0.772549, 1,
1.144991, -0.1603142, 2.211683, 1, 0, 0.7686275, 1,
1.155992, 0.1067177, 1.278806, 1, 0, 0.7607843, 1,
1.15659, -1.410913, 1.047856, 1, 0, 0.7568628, 1,
1.156609, 0.6778154, 1.196422, 1, 0, 0.7490196, 1,
1.161066, -0.0373698, 3.190341, 1, 0, 0.7450981, 1,
1.162524, -0.02614469, -1.219047, 1, 0, 0.7372549, 1,
1.16328, 0.4379559, 0.1877718, 1, 0, 0.7333333, 1,
1.167776, -0.7191677, 1.026292, 1, 0, 0.7254902, 1,
1.168339, 0.6853762, 1.604236, 1, 0, 0.7215686, 1,
1.170302, -0.7118518, 1.28528, 1, 0, 0.7137255, 1,
1.172258, 2.086592, 1.097502, 1, 0, 0.7098039, 1,
1.173473, 0.7902165, 0.00184861, 1, 0, 0.7019608, 1,
1.175905, 2.280252, 0.2504423, 1, 0, 0.6941177, 1,
1.176149, 0.1068055, 2.89307, 1, 0, 0.6901961, 1,
1.186263, -0.7984291, 4.086212, 1, 0, 0.682353, 1,
1.190825, 1.062505, -0.3786772, 1, 0, 0.6784314, 1,
1.195484, -0.8367531, 3.42273, 1, 0, 0.6705883, 1,
1.198603, 0.08873506, 2.446561, 1, 0, 0.6666667, 1,
1.199161, 0.8407115, -0.4672876, 1, 0, 0.6588235, 1,
1.22106, 0.4635209, 2.382126, 1, 0, 0.654902, 1,
1.232524, 1.22661, 1.318951, 1, 0, 0.6470588, 1,
1.24141, -0.5750148, 1.61801, 1, 0, 0.6431373, 1,
1.247786, 1.306868, -0.4306161, 1, 0, 0.6352941, 1,
1.251646, -2.07183, 3.408312, 1, 0, 0.6313726, 1,
1.267502, 1.255894, 0.7809473, 1, 0, 0.6235294, 1,
1.27828, 1.58952, 1.925453, 1, 0, 0.6196079, 1,
1.280917, -1.423647, 1.486098, 1, 0, 0.6117647, 1,
1.290282, -0.6633742, 1.674176, 1, 0, 0.6078432, 1,
1.291533, 1.126199, 3.087078, 1, 0, 0.6, 1,
1.291973, 2.113714, 0.02811601, 1, 0, 0.5921569, 1,
1.295168, 0.3997336, 1.498727, 1, 0, 0.5882353, 1,
1.306327, 0.98918, 2.015368, 1, 0, 0.5803922, 1,
1.309028, -0.7053798, 1.304831, 1, 0, 0.5764706, 1,
1.309044, 1.940843, 1.942571, 1, 0, 0.5686275, 1,
1.309747, -1.771802, 1.641603, 1, 0, 0.5647059, 1,
1.319938, 0.7323968, 0.644598, 1, 0, 0.5568628, 1,
1.327826, -0.8734512, 1.825264, 1, 0, 0.5529412, 1,
1.332519, 0.6136798, 0.6046118, 1, 0, 0.5450981, 1,
1.340536, -1.256365, 0.4152814, 1, 0, 0.5411765, 1,
1.346696, 0.7658288, -0.4058954, 1, 0, 0.5333334, 1,
1.358104, -0.7267601, 0.7814173, 1, 0, 0.5294118, 1,
1.3587, 0.00736092, 1.253815, 1, 0, 0.5215687, 1,
1.366033, 1.661153, 1.022022, 1, 0, 0.5176471, 1,
1.369432, -2.148699, 2.294835, 1, 0, 0.509804, 1,
1.382425, -0.4709967, 1.657743, 1, 0, 0.5058824, 1,
1.3948, -0.5146825, 2.882982, 1, 0, 0.4980392, 1,
1.402026, -0.1355413, 2.161572, 1, 0, 0.4901961, 1,
1.413529, 0.06807481, 0.5821745, 1, 0, 0.4862745, 1,
1.413726, -0.3374831, 1.26592, 1, 0, 0.4784314, 1,
1.425046, -2.184495, 1.579146, 1, 0, 0.4745098, 1,
1.439259, -0.3475129, 2.224277, 1, 0, 0.4666667, 1,
1.446313, -0.9783332, 2.597145, 1, 0, 0.4627451, 1,
1.447544, 0.4170046, 2.525762, 1, 0, 0.454902, 1,
1.468419, 1.347252, -0.08987058, 1, 0, 0.4509804, 1,
1.472105, -0.2871641, 2.306415, 1, 0, 0.4431373, 1,
1.477469, 1.410919, 1.20755, 1, 0, 0.4392157, 1,
1.478999, -0.3108985, 2.088672, 1, 0, 0.4313726, 1,
1.48108, -1.517879, 1.391214, 1, 0, 0.427451, 1,
1.481492, -1.137537, 3.236398, 1, 0, 0.4196078, 1,
1.490784, 1.414465, -0.6647446, 1, 0, 0.4156863, 1,
1.501567, 0.8168338, 1.879112, 1, 0, 0.4078431, 1,
1.516667, 0.5974716, -0.4937934, 1, 0, 0.4039216, 1,
1.544144, 1.395563, -0.2788012, 1, 0, 0.3960784, 1,
1.548947, -0.06320025, 1.990414, 1, 0, 0.3882353, 1,
1.562396, -0.03389594, 1.753568, 1, 0, 0.3843137, 1,
1.564356, 0.3981088, 1.675415, 1, 0, 0.3764706, 1,
1.567766, 1.070783, -1.264996, 1, 0, 0.372549, 1,
1.609909, -1.55213, 0.7467473, 1, 0, 0.3647059, 1,
1.659358, -0.01397674, 0.2452404, 1, 0, 0.3607843, 1,
1.669201, 1.690937, 0.322117, 1, 0, 0.3529412, 1,
1.673728, 1.043517, 0.7318308, 1, 0, 0.3490196, 1,
1.676301, -0.1243929, 1.417709, 1, 0, 0.3411765, 1,
1.676917, -1.568161, 2.893682, 1, 0, 0.3372549, 1,
1.682118, 0.9181352, 1.988791, 1, 0, 0.3294118, 1,
1.682489, 0.7274715, 2.001742, 1, 0, 0.3254902, 1,
1.693329, -1.493753, 2.264932, 1, 0, 0.3176471, 1,
1.693415, -0.5140827, 2.896494, 1, 0, 0.3137255, 1,
1.704793, 0.07249881, 1.214354, 1, 0, 0.3058824, 1,
1.711692, 0.5207158, 0.5135764, 1, 0, 0.2980392, 1,
1.725836, -1.158329, 1.600443, 1, 0, 0.2941177, 1,
1.736239, -1.239638, 2.671207, 1, 0, 0.2862745, 1,
1.748855, 1.245994, 1.235268, 1, 0, 0.282353, 1,
1.768043, -0.2328219, 0.6966625, 1, 0, 0.2745098, 1,
1.772607, -1.156383, 1.970778, 1, 0, 0.2705882, 1,
1.801387, -0.3847476, 1.341522, 1, 0, 0.2627451, 1,
1.803385, 0.6007928, 0.4929167, 1, 0, 0.2588235, 1,
1.810794, -0.1412528, 3.08964, 1, 0, 0.2509804, 1,
1.81297, 1.542807, 1.14782, 1, 0, 0.2470588, 1,
1.849107, 1.401352, 2.167255, 1, 0, 0.2392157, 1,
1.868134, 1.100022, -1.299922, 1, 0, 0.2352941, 1,
1.879045, -0.884642, 2.478753, 1, 0, 0.227451, 1,
1.886625, -1.243872, 2.396797, 1, 0, 0.2235294, 1,
1.926331, -0.7871578, 3.284216, 1, 0, 0.2156863, 1,
1.930141, -1.168975, 0.7661588, 1, 0, 0.2117647, 1,
1.953052, -0.02628013, 1.794443, 1, 0, 0.2039216, 1,
1.969772, 1.323018, -0.560603, 1, 0, 0.1960784, 1,
2.001365, 2.054482, 1.575616, 1, 0, 0.1921569, 1,
2.078071, -1.673729, 2.843786, 1, 0, 0.1843137, 1,
2.080267, -0.6530799, 1.539249, 1, 0, 0.1803922, 1,
2.137623, 0.9080806, 2.024788, 1, 0, 0.172549, 1,
2.158566, 0.8646074, 2.092914, 1, 0, 0.1686275, 1,
2.176351, -0.01503943, 0.2246629, 1, 0, 0.1607843, 1,
2.183944, 0.7959313, 0.5972208, 1, 0, 0.1568628, 1,
2.190673, 1.024366, -0.186314, 1, 0, 0.1490196, 1,
2.191799, 0.480148, -0.5195649, 1, 0, 0.145098, 1,
2.200557, 0.2335155, 1.599576, 1, 0, 0.1372549, 1,
2.253562, -0.5063639, 2.265544, 1, 0, 0.1333333, 1,
2.261899, 0.3152843, 1.45065, 1, 0, 0.1254902, 1,
2.35489, 0.7603372, 0.6418504, 1, 0, 0.1215686, 1,
2.368511, -0.4334992, 2.001986, 1, 0, 0.1137255, 1,
2.381226, -0.3457321, 3.055212, 1, 0, 0.1098039, 1,
2.392195, -1.566141, 2.407573, 1, 0, 0.1019608, 1,
2.420588, 0.4646871, 2.760912, 1, 0, 0.09411765, 1,
2.42664, 0.3441978, 1.817302, 1, 0, 0.09019608, 1,
2.537222, 0.7493855, 0.423156, 1, 0, 0.08235294, 1,
2.562446, 0.02992193, 1.920841, 1, 0, 0.07843138, 1,
2.57186, 1.082162, 1.795581, 1, 0, 0.07058824, 1,
2.62299, -0.3409125, 0.6524151, 1, 0, 0.06666667, 1,
2.655192, -0.5536615, 1.458888, 1, 0, 0.05882353, 1,
2.674617, -1.055816, 3.390894, 1, 0, 0.05490196, 1,
2.677368, -0.04295571, 2.44385, 1, 0, 0.04705882, 1,
2.69486, -1.461692, 2.309319, 1, 0, 0.04313726, 1,
2.701396, 0.970979, -0.8029456, 1, 0, 0.03529412, 1,
2.763817, -0.7448471, 2.786114, 1, 0, 0.03137255, 1,
2.788765, -1.353645, 3.347422, 1, 0, 0.02352941, 1,
2.818589, 0.05818469, 1.439999, 1, 0, 0.01960784, 1,
2.85456, -1.694256, 2.215762, 1, 0, 0.01176471, 1,
2.932234, 0.06356928, 0.9379628, 1, 0, 0.007843138, 1
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
-0.411811, -4.247465, -7.51852, 0, -0.5, 0.5, 0.5,
-0.411811, -4.247465, -7.51852, 1, -0.5, 0.5, 0.5,
-0.411811, -4.247465, -7.51852, 1, 1.5, 0.5, 0.5,
-0.411811, -4.247465, -7.51852, 0, 1.5, 0.5, 0.5
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
-4.889487, -0.0007201433, -7.51852, 0, -0.5, 0.5, 0.5,
-4.889487, -0.0007201433, -7.51852, 1, -0.5, 0.5, 0.5,
-4.889487, -0.0007201433, -7.51852, 1, 1.5, 0.5, 0.5,
-4.889487, -0.0007201433, -7.51852, 0, 1.5, 0.5, 0.5
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
-4.889487, -4.247465, -0.2944188, 0, -0.5, 0.5, 0.5,
-4.889487, -4.247465, -0.2944188, 1, -0.5, 0.5, 0.5,
-4.889487, -4.247465, -0.2944188, 1, 1.5, 0.5, 0.5,
-4.889487, -4.247465, -0.2944188, 0, 1.5, 0.5, 0.5
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
-3, -3.267447, -5.851419,
2, -3.267447, -5.851419,
-3, -3.267447, -5.851419,
-3, -3.430783, -6.12927,
-2, -3.267447, -5.851419,
-2, -3.430783, -6.12927,
-1, -3.267447, -5.851419,
-1, -3.430783, -6.12927,
0, -3.267447, -5.851419,
0, -3.430783, -6.12927,
1, -3.267447, -5.851419,
1, -3.430783, -6.12927,
2, -3.267447, -5.851419,
2, -3.430783, -6.12927
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
-3, -3.757456, -6.68497, 0, -0.5, 0.5, 0.5,
-3, -3.757456, -6.68497, 1, -0.5, 0.5, 0.5,
-3, -3.757456, -6.68497, 1, 1.5, 0.5, 0.5,
-3, -3.757456, -6.68497, 0, 1.5, 0.5, 0.5,
-2, -3.757456, -6.68497, 0, -0.5, 0.5, 0.5,
-2, -3.757456, -6.68497, 1, -0.5, 0.5, 0.5,
-2, -3.757456, -6.68497, 1, 1.5, 0.5, 0.5,
-2, -3.757456, -6.68497, 0, 1.5, 0.5, 0.5,
-1, -3.757456, -6.68497, 0, -0.5, 0.5, 0.5,
-1, -3.757456, -6.68497, 1, -0.5, 0.5, 0.5,
-1, -3.757456, -6.68497, 1, 1.5, 0.5, 0.5,
-1, -3.757456, -6.68497, 0, 1.5, 0.5, 0.5,
0, -3.757456, -6.68497, 0, -0.5, 0.5, 0.5,
0, -3.757456, -6.68497, 1, -0.5, 0.5, 0.5,
0, -3.757456, -6.68497, 1, 1.5, 0.5, 0.5,
0, -3.757456, -6.68497, 0, 1.5, 0.5, 0.5,
1, -3.757456, -6.68497, 0, -0.5, 0.5, 0.5,
1, -3.757456, -6.68497, 1, -0.5, 0.5, 0.5,
1, -3.757456, -6.68497, 1, 1.5, 0.5, 0.5,
1, -3.757456, -6.68497, 0, 1.5, 0.5, 0.5,
2, -3.757456, -6.68497, 0, -0.5, 0.5, 0.5,
2, -3.757456, -6.68497, 1, -0.5, 0.5, 0.5,
2, -3.757456, -6.68497, 1, 1.5, 0.5, 0.5,
2, -3.757456, -6.68497, 0, 1.5, 0.5, 0.5
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
-3.856177, -3, -5.851419,
-3.856177, 3, -5.851419,
-3.856177, -3, -5.851419,
-4.028396, -3, -6.12927,
-3.856177, -2, -5.851419,
-4.028396, -2, -6.12927,
-3.856177, -1, -5.851419,
-4.028396, -1, -6.12927,
-3.856177, 0, -5.851419,
-4.028396, 0, -6.12927,
-3.856177, 1, -5.851419,
-4.028396, 1, -6.12927,
-3.856177, 2, -5.851419,
-4.028396, 2, -6.12927,
-3.856177, 3, -5.851419,
-4.028396, 3, -6.12927
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
-4.372832, -3, -6.68497, 0, -0.5, 0.5, 0.5,
-4.372832, -3, -6.68497, 1, -0.5, 0.5, 0.5,
-4.372832, -3, -6.68497, 1, 1.5, 0.5, 0.5,
-4.372832, -3, -6.68497, 0, 1.5, 0.5, 0.5,
-4.372832, -2, -6.68497, 0, -0.5, 0.5, 0.5,
-4.372832, -2, -6.68497, 1, -0.5, 0.5, 0.5,
-4.372832, -2, -6.68497, 1, 1.5, 0.5, 0.5,
-4.372832, -2, -6.68497, 0, 1.5, 0.5, 0.5,
-4.372832, -1, -6.68497, 0, -0.5, 0.5, 0.5,
-4.372832, -1, -6.68497, 1, -0.5, 0.5, 0.5,
-4.372832, -1, -6.68497, 1, 1.5, 0.5, 0.5,
-4.372832, -1, -6.68497, 0, 1.5, 0.5, 0.5,
-4.372832, 0, -6.68497, 0, -0.5, 0.5, 0.5,
-4.372832, 0, -6.68497, 1, -0.5, 0.5, 0.5,
-4.372832, 0, -6.68497, 1, 1.5, 0.5, 0.5,
-4.372832, 0, -6.68497, 0, 1.5, 0.5, 0.5,
-4.372832, 1, -6.68497, 0, -0.5, 0.5, 0.5,
-4.372832, 1, -6.68497, 1, -0.5, 0.5, 0.5,
-4.372832, 1, -6.68497, 1, 1.5, 0.5, 0.5,
-4.372832, 1, -6.68497, 0, 1.5, 0.5, 0.5,
-4.372832, 2, -6.68497, 0, -0.5, 0.5, 0.5,
-4.372832, 2, -6.68497, 1, -0.5, 0.5, 0.5,
-4.372832, 2, -6.68497, 1, 1.5, 0.5, 0.5,
-4.372832, 2, -6.68497, 0, 1.5, 0.5, 0.5,
-4.372832, 3, -6.68497, 0, -0.5, 0.5, 0.5,
-4.372832, 3, -6.68497, 1, -0.5, 0.5, 0.5,
-4.372832, 3, -6.68497, 1, 1.5, 0.5, 0.5,
-4.372832, 3, -6.68497, 0, 1.5, 0.5, 0.5
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
-3.856177, -3.267447, -4,
-3.856177, -3.267447, 4,
-3.856177, -3.267447, -4,
-4.028396, -3.430783, -4,
-3.856177, -3.267447, -2,
-4.028396, -3.430783, -2,
-3.856177, -3.267447, 0,
-4.028396, -3.430783, 0,
-3.856177, -3.267447, 2,
-4.028396, -3.430783, 2,
-3.856177, -3.267447, 4,
-4.028396, -3.430783, 4
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
-4.372832, -3.757456, -4, 0, -0.5, 0.5, 0.5,
-4.372832, -3.757456, -4, 1, -0.5, 0.5, 0.5,
-4.372832, -3.757456, -4, 1, 1.5, 0.5, 0.5,
-4.372832, -3.757456, -4, 0, 1.5, 0.5, 0.5,
-4.372832, -3.757456, -2, 0, -0.5, 0.5, 0.5,
-4.372832, -3.757456, -2, 1, -0.5, 0.5, 0.5,
-4.372832, -3.757456, -2, 1, 1.5, 0.5, 0.5,
-4.372832, -3.757456, -2, 0, 1.5, 0.5, 0.5,
-4.372832, -3.757456, 0, 0, -0.5, 0.5, 0.5,
-4.372832, -3.757456, 0, 1, -0.5, 0.5, 0.5,
-4.372832, -3.757456, 0, 1, 1.5, 0.5, 0.5,
-4.372832, -3.757456, 0, 0, 1.5, 0.5, 0.5,
-4.372832, -3.757456, 2, 0, -0.5, 0.5, 0.5,
-4.372832, -3.757456, 2, 1, -0.5, 0.5, 0.5,
-4.372832, -3.757456, 2, 1, 1.5, 0.5, 0.5,
-4.372832, -3.757456, 2, 0, 1.5, 0.5, 0.5,
-4.372832, -3.757456, 4, 0, -0.5, 0.5, 0.5,
-4.372832, -3.757456, 4, 1, -0.5, 0.5, 0.5,
-4.372832, -3.757456, 4, 1, 1.5, 0.5, 0.5,
-4.372832, -3.757456, 4, 0, 1.5, 0.5, 0.5
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
-3.856177, -3.267447, -5.851419,
-3.856177, 3.266006, -5.851419,
-3.856177, -3.267447, 5.262582,
-3.856177, 3.266006, 5.262582,
-3.856177, -3.267447, -5.851419,
-3.856177, -3.267447, 5.262582,
-3.856177, 3.266006, -5.851419,
-3.856177, 3.266006, 5.262582,
-3.856177, -3.267447, -5.851419,
3.032555, -3.267447, -5.851419,
-3.856177, -3.267447, 5.262582,
3.032555, -3.267447, 5.262582,
-3.856177, 3.266006, -5.851419,
3.032555, 3.266006, -5.851419,
-3.856177, 3.266006, 5.262582,
3.032555, 3.266006, 5.262582,
3.032555, -3.267447, -5.851419,
3.032555, 3.266006, -5.851419,
3.032555, -3.267447, 5.262582,
3.032555, 3.266006, 5.262582,
3.032555, -3.267447, -5.851419,
3.032555, -3.267447, 5.262582,
3.032555, 3.266006, -5.851419,
3.032555, 3.266006, 5.262582
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
var radius = 7.805285;
var distance = 34.7266;
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
mvMatrix.translate( 0.411811, 0.0007201433, 0.2944188 );
mvMatrix.scale( 1.225077, 1.291695, 0.759333 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.7266);
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
chlorpropham<-read.table("chlorpropham.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorpropham$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
```

```r
y<-chlorpropham$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
```

```r
z<-chlorpropham$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorpropham' not found
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
-3.755856, -0.793223, -2.014734, 0, 0, 1, 1, 1,
-3.27786, 0.4137412, -0.5085763, 1, 0, 0, 1, 1,
-3.06446, -0.9066923, -2.081886, 1, 0, 0, 1, 1,
-2.568848, -0.0903588, -2.096773, 1, 0, 0, 1, 1,
-2.495531, 0.8165774, -1.505957, 1, 0, 0, 1, 1,
-2.432701, -1.883349, -3.730697, 1, 0, 0, 1, 1,
-2.385171, -1.743616, -0.7736266, 0, 0, 0, 1, 1,
-2.345793, 0.6923178, 0.4372178, 0, 0, 0, 1, 1,
-2.341275, 1.200323, -0.8439569, 0, 0, 0, 1, 1,
-2.339585, -0.1054804, -2.734361, 0, 0, 0, 1, 1,
-2.338953, -1.13126, -3.657405, 0, 0, 0, 1, 1,
-2.328307, 0.6861573, -2.565211, 0, 0, 0, 1, 1,
-2.322226, -1.772091, -3.76146, 0, 0, 0, 1, 1,
-2.280836, -1.06737, -1.928887, 1, 1, 1, 1, 1,
-2.163137, -0.7590899, -1.55369, 1, 1, 1, 1, 1,
-2.147949, 0.3797036, -1.739903, 1, 1, 1, 1, 1,
-2.132855, -0.04983177, -2.234624, 1, 1, 1, 1, 1,
-2.112175, -1.02046, -3.606158, 1, 1, 1, 1, 1,
-2.10473, 0.6752765, 0.4877156, 1, 1, 1, 1, 1,
-2.046586, -0.1019247, -0.7400331, 1, 1, 1, 1, 1,
-2.014853, -2.198286, -1.791349, 1, 1, 1, 1, 1,
-1.994478, 0.2806788, -0.9866811, 1, 1, 1, 1, 1,
-1.98813, -0.9884018, -2.561776, 1, 1, 1, 1, 1,
-1.984907, 0.1118376, -2.068748, 1, 1, 1, 1, 1,
-1.957037, 0.1836205, -2.378199, 1, 1, 1, 1, 1,
-1.951365, 0.07779332, -2.078515, 1, 1, 1, 1, 1,
-1.945487, 1.287481, -1.398895, 1, 1, 1, 1, 1,
-1.896855, -0.1936077, -4.485628, 1, 1, 1, 1, 1,
-1.884321, -0.5158436, -1.741884, 0, 0, 1, 1, 1,
-1.879921, -0.5669366, -1.36043, 1, 0, 0, 1, 1,
-1.861819, -1.552234, -0.4750428, 1, 0, 0, 1, 1,
-1.839294, -1.940161, -4.101907, 1, 0, 0, 1, 1,
-1.838159, 0.6239598, -1.685958, 1, 0, 0, 1, 1,
-1.786681, 0.3595189, -0.2540226, 1, 0, 0, 1, 1,
-1.780509, -0.2373989, -1.567115, 0, 0, 0, 1, 1,
-1.766327, -1.036667, -0.7419742, 0, 0, 0, 1, 1,
-1.765049, 0.7834166, -1.405618, 0, 0, 0, 1, 1,
-1.758349, -0.3130615, -1.428102, 0, 0, 0, 1, 1,
-1.744489, -1.015156, -4.518616, 0, 0, 0, 1, 1,
-1.732208, -0.2177101, -1.897497, 0, 0, 0, 1, 1,
-1.729285, -0.8786528, -2.338676, 0, 0, 0, 1, 1,
-1.714831, -0.531331, -2.048503, 1, 1, 1, 1, 1,
-1.703661, 0.8190292, -0.3046087, 1, 1, 1, 1, 1,
-1.70101, -0.5382673, -1.710243, 1, 1, 1, 1, 1,
-1.693897, 1.335469, -2.804337, 1, 1, 1, 1, 1,
-1.692964, -0.4092817, -1.709485, 1, 1, 1, 1, 1,
-1.688035, -0.05879762, -1.755985, 1, 1, 1, 1, 1,
-1.661045, -0.2511332, -3.676451, 1, 1, 1, 1, 1,
-1.659717, -0.7397132, -3.296638, 1, 1, 1, 1, 1,
-1.646187, 0.8775037, 0.5591602, 1, 1, 1, 1, 1,
-1.645161, -2.881966, -2.6325, 1, 1, 1, 1, 1,
-1.632372, -0.0357174, -2.598434, 1, 1, 1, 1, 1,
-1.627932, -0.9286591, -2.131737, 1, 1, 1, 1, 1,
-1.614361, 0.8058097, -0.2812183, 1, 1, 1, 1, 1,
-1.60734, -0.6531948, -1.92489, 1, 1, 1, 1, 1,
-1.598619, 0.2021883, -1.159355, 1, 1, 1, 1, 1,
-1.579899, -0.6643139, -0.6165224, 0, 0, 1, 1, 1,
-1.559431, -0.1701019, -3.019005, 1, 0, 0, 1, 1,
-1.528306, -2.160966, -3.360282, 1, 0, 0, 1, 1,
-1.505945, 0.1779823, 1.417221, 1, 0, 0, 1, 1,
-1.503398, 0.2897981, 1.236864, 1, 0, 0, 1, 1,
-1.487958, -0.659439, -2.108879, 1, 0, 0, 1, 1,
-1.444432, -0.539908, -1.597198, 0, 0, 0, 1, 1,
-1.422425, -2.190503, -3.578174, 0, 0, 0, 1, 1,
-1.418388, 0.7061127, 0.2738976, 0, 0, 0, 1, 1,
-1.417735, 1.425691, -0.608725, 0, 0, 0, 1, 1,
-1.409632, 2.063154, -1.384947, 0, 0, 0, 1, 1,
-1.399392, 1.627158, -0.9765679, 0, 0, 0, 1, 1,
-1.393944, 1.886243, 0.2176715, 0, 0, 0, 1, 1,
-1.393419, -1.712676, -4.216634, 1, 1, 1, 1, 1,
-1.37631, 0.4179814, -1.326834, 1, 1, 1, 1, 1,
-1.355651, -0.8525489, -2.957461, 1, 1, 1, 1, 1,
-1.355425, 1.630823, -2.03467, 1, 1, 1, 1, 1,
-1.350205, -0.4953739, -2.68678, 1, 1, 1, 1, 1,
-1.340991, -0.6962535, -2.461793, 1, 1, 1, 1, 1,
-1.339614, -0.2112904, -2.045835, 1, 1, 1, 1, 1,
-1.336597, 1.046391, 1.056159, 1, 1, 1, 1, 1,
-1.335605, 0.1071143, -2.18106, 1, 1, 1, 1, 1,
-1.323466, -0.7433169, -0.2478082, 1, 1, 1, 1, 1,
-1.322021, 0.2616609, -2.597946, 1, 1, 1, 1, 1,
-1.317521, -0.8225895, -1.455672, 1, 1, 1, 1, 1,
-1.316925, -0.1056905, -1.93106, 1, 1, 1, 1, 1,
-1.313654, 0.334401, -3.21665, 1, 1, 1, 1, 1,
-1.307072, -0.3671692, -0.6868253, 1, 1, 1, 1, 1,
-1.295215, 1.31633, 0.9870729, 0, 0, 1, 1, 1,
-1.295205, 0.2975062, -1.690398, 1, 0, 0, 1, 1,
-1.290872, 1.019372, -2.233152, 1, 0, 0, 1, 1,
-1.285622, 1.075339, -0.04879145, 1, 0, 0, 1, 1,
-1.284771, -0.2309004, -0.9984553, 1, 0, 0, 1, 1,
-1.281391, -1.483476, -1.533132, 1, 0, 0, 1, 1,
-1.279773, 0.2468589, -0.4754903, 0, 0, 0, 1, 1,
-1.277413, 0.3585749, -1.209234, 0, 0, 0, 1, 1,
-1.275271, -0.2369653, -2.599566, 0, 0, 0, 1, 1,
-1.243897, -0.8420551, -2.660699, 0, 0, 0, 1, 1,
-1.240883, -0.7647592, -2.210648, 0, 0, 0, 1, 1,
-1.230686, -1.962022, -2.679836, 0, 0, 0, 1, 1,
-1.226633, 0.187454, -0.9918648, 0, 0, 0, 1, 1,
-1.222906, -1.032829, -2.468699, 1, 1, 1, 1, 1,
-1.221421, 1.399049, 0.7607224, 1, 1, 1, 1, 1,
-1.216307, 2.652, -1.190958, 1, 1, 1, 1, 1,
-1.20829, 0.4999486, -0.5909732, 1, 1, 1, 1, 1,
-1.20822, 0.8481737, -1.394285, 1, 1, 1, 1, 1,
-1.199892, -1.281215, -2.240489, 1, 1, 1, 1, 1,
-1.190577, 0.3976587, -0.9782977, 1, 1, 1, 1, 1,
-1.188568, -0.6593591, -1.338377, 1, 1, 1, 1, 1,
-1.185744, -0.2206018, -0.669701, 1, 1, 1, 1, 1,
-1.180569, -0.6838457, -1.961586, 1, 1, 1, 1, 1,
-1.180005, -0.5808599, -3.198927, 1, 1, 1, 1, 1,
-1.179236, 1.316278, -1.966474, 1, 1, 1, 1, 1,
-1.176846, -0.6536179, -2.496132, 1, 1, 1, 1, 1,
-1.171519, -0.7525895, -0.9423215, 1, 1, 1, 1, 1,
-1.169723, -0.8855444, -1.380181, 1, 1, 1, 1, 1,
-1.168231, 0.0742863, -1.383921, 0, 0, 1, 1, 1,
-1.161969, -0.1979109, -1.710865, 1, 0, 0, 1, 1,
-1.158711, -0.3501377, -2.632295, 1, 0, 0, 1, 1,
-1.155159, 1.318509, -1.459824, 1, 0, 0, 1, 1,
-1.142229, -0.1387679, -3.024313, 1, 0, 0, 1, 1,
-1.134, -0.04550443, -0.407162, 1, 0, 0, 1, 1,
-1.126686, 1.63893, 0.6550574, 0, 0, 0, 1, 1,
-1.123648, -0.8017876, -2.400868, 0, 0, 0, 1, 1,
-1.116148, -1.118311, -3.245541, 0, 0, 0, 1, 1,
-1.113832, 0.4507738, -0.2399247, 0, 0, 0, 1, 1,
-1.112867, -1.224484, -5.573203, 0, 0, 0, 1, 1,
-1.106799, 0.1285349, -1.101026, 0, 0, 0, 1, 1,
-1.094844, 0.6263788, -0.7132429, 0, 0, 0, 1, 1,
-1.092489, 2.310122, -1.267013, 1, 1, 1, 1, 1,
-1.091628, -1.564834, -2.713347, 1, 1, 1, 1, 1,
-1.088969, -0.5263678, -2.766107, 1, 1, 1, 1, 1,
-1.072905, -1.112798, -2.596863, 1, 1, 1, 1, 1,
-1.069557, 0.9150646, -0.6564887, 1, 1, 1, 1, 1,
-1.068508, 0.9526034, 1.234289, 1, 1, 1, 1, 1,
-1.066215, 0.1183052, -2.166036, 1, 1, 1, 1, 1,
-1.060036, 0.08498675, -1.704648, 1, 1, 1, 1, 1,
-1.057702, 0.6154829, -0.8265176, 1, 1, 1, 1, 1,
-1.053234, -0.5019679, -1.277377, 1, 1, 1, 1, 1,
-1.05283, 0.6834352, -0.7570145, 1, 1, 1, 1, 1,
-1.046423, -0.7524524, -1.196561, 1, 1, 1, 1, 1,
-1.039166, 0.007576723, -2.088008, 1, 1, 1, 1, 1,
-1.038227, -1.116832, -2.779082, 1, 1, 1, 1, 1,
-1.034002, 0.09428191, -1.269776, 1, 1, 1, 1, 1,
-1.025707, -0.4333897, -2.672223, 0, 0, 1, 1, 1,
-1.019976, -1.415426, -3.879129, 1, 0, 0, 1, 1,
-1.017095, 0.07024417, -0.9222558, 1, 0, 0, 1, 1,
-1.016259, 0.01893973, -2.130426, 1, 0, 0, 1, 1,
-1.013904, 1.165275, 0.24374, 1, 0, 0, 1, 1,
-1.00886, 0.4588151, 0.9793567, 1, 0, 0, 1, 1,
-1.0041, 1.020642, -0.6157143, 0, 0, 0, 1, 1,
-1.003802, 0.3612906, 0.4456075, 0, 0, 0, 1, 1,
-1.002295, -0.9668434, -3.774599, 0, 0, 0, 1, 1,
-0.9853928, -0.8055966, -1.79956, 0, 0, 0, 1, 1,
-0.9836689, -1.147411, -3.453303, 0, 0, 0, 1, 1,
-0.9829722, 2.277954, -1.936043, 0, 0, 0, 1, 1,
-0.9817874, -1.078688, -1.914092, 0, 0, 0, 1, 1,
-0.9743159, 1.620056, -1.061284, 1, 1, 1, 1, 1,
-0.972096, -1.325963, 0.2515946, 1, 1, 1, 1, 1,
-0.968407, 0.09300737, -1.412918, 1, 1, 1, 1, 1,
-0.9670854, -0.8413994, -2.484263, 1, 1, 1, 1, 1,
-0.9651209, -0.3624973, -1.328447, 1, 1, 1, 1, 1,
-0.9620807, -0.4297428, -1.597049, 1, 1, 1, 1, 1,
-0.9604006, 2.739422, -0.4513358, 1, 1, 1, 1, 1,
-0.9601882, 0.9895077, -1.197449, 1, 1, 1, 1, 1,
-0.9597474, -0.140636, -2.062656, 1, 1, 1, 1, 1,
-0.9543784, -0.6856822, -2.789608, 1, 1, 1, 1, 1,
-0.9538305, -0.9392012, -2.22424, 1, 1, 1, 1, 1,
-0.953629, -1.675329, -1.852317, 1, 1, 1, 1, 1,
-0.9530324, 1.146144, -1.288418, 1, 1, 1, 1, 1,
-0.9436836, -0.1226641, -2.875321, 1, 1, 1, 1, 1,
-0.9398066, 1.362056, -0.9939671, 1, 1, 1, 1, 1,
-0.9335343, -0.7417806, -1.778885, 0, 0, 1, 1, 1,
-0.932099, -0.05960888, -0.2997706, 1, 0, 0, 1, 1,
-0.930914, 1.744462, 0.3569445, 1, 0, 0, 1, 1,
-0.9283155, -0.6257836, -3.295235, 1, 0, 0, 1, 1,
-0.9230083, -2.147799, -2.977973, 1, 0, 0, 1, 1,
-0.9165538, -0.3513617, -1.353782, 1, 0, 0, 1, 1,
-0.9164729, -2.229344, -3.849738, 0, 0, 0, 1, 1,
-0.9158731, -0.7053591, -4.522676, 0, 0, 0, 1, 1,
-0.914217, 0.2585704, -0.7205253, 0, 0, 0, 1, 1,
-0.9111959, 1.702913, 0.2320761, 0, 0, 0, 1, 1,
-0.9046611, -0.5261638, -3.97189, 0, 0, 0, 1, 1,
-0.9034647, -2.407111, -2.891046, 0, 0, 0, 1, 1,
-0.8992795, -0.1802304, -1.447047, 0, 0, 0, 1, 1,
-0.898541, 0.1698161, -0.2936276, 1, 1, 1, 1, 1,
-0.8979213, -0.2560248, -3.704334, 1, 1, 1, 1, 1,
-0.8960134, -1.370465, -3.557918, 1, 1, 1, 1, 1,
-0.8914043, 0.9255601, 0.7480619, 1, 1, 1, 1, 1,
-0.8889537, 0.1146455, -2.357538, 1, 1, 1, 1, 1,
-0.8856292, 1.975409, 0.1325048, 1, 1, 1, 1, 1,
-0.8837343, -1.011197, -3.614824, 1, 1, 1, 1, 1,
-0.88152, 0.09563329, -1.484299, 1, 1, 1, 1, 1,
-0.8685316, 1.397522, -1.2285, 1, 1, 1, 1, 1,
-0.8670998, -0.7494223, -1.325177, 1, 1, 1, 1, 1,
-0.8586291, -0.1373428, -2.335346, 1, 1, 1, 1, 1,
-0.8519336, -0.6563642, -0.7782432, 1, 1, 1, 1, 1,
-0.8496033, -1.151938, -2.497553, 1, 1, 1, 1, 1,
-0.8372858, -0.5068249, -4.000865, 1, 1, 1, 1, 1,
-0.8308495, -1.590859, -3.410033, 1, 1, 1, 1, 1,
-0.8290321, -0.439186, -2.9615, 0, 0, 1, 1, 1,
-0.82617, 0.566449, 0.1728916, 1, 0, 0, 1, 1,
-0.823473, 2.278624, -0.3150418, 1, 0, 0, 1, 1,
-0.8174111, -1.03204, -1.790986, 1, 0, 0, 1, 1,
-0.8114634, -0.2876495, -1.065681, 1, 0, 0, 1, 1,
-0.8114478, 0.8576948, -2.095428, 1, 0, 0, 1, 1,
-0.8054829, 0.3187416, -1.224315, 0, 0, 0, 1, 1,
-0.8022528, 0.6643152, -0.6421312, 0, 0, 0, 1, 1,
-0.79572, -0.4007232, -2.220254, 0, 0, 0, 1, 1,
-0.7878956, 1.514948, -0.388066, 0, 0, 0, 1, 1,
-0.7827506, 0.1901798, -0.3003114, 0, 0, 0, 1, 1,
-0.7780856, -0.2073939, -1.905004, 0, 0, 0, 1, 1,
-0.7744923, -1.976231, -2.351745, 0, 0, 0, 1, 1,
-0.7719936, -1.126581, -3.090693, 1, 1, 1, 1, 1,
-0.769529, -2.217591, -2.794225, 1, 1, 1, 1, 1,
-0.7685648, 0.3080862, -1.184212, 1, 1, 1, 1, 1,
-0.7673584, 0.5362199, -1.700779, 1, 1, 1, 1, 1,
-0.7669109, 1.437557, -3.01436, 1, 1, 1, 1, 1,
-0.7650425, -0.8379271, -3.814183, 1, 1, 1, 1, 1,
-0.7558165, -1.271823, -2.742627, 1, 1, 1, 1, 1,
-0.7522703, -0.2761856, -4.431301, 1, 1, 1, 1, 1,
-0.7475007, 0.6645041, 1.118942, 1, 1, 1, 1, 1,
-0.7383726, 0.3468495, -1.521438, 1, 1, 1, 1, 1,
-0.738106, -1.603974, -2.650337, 1, 1, 1, 1, 1,
-0.7358195, -0.4586386, -1.013072, 1, 1, 1, 1, 1,
-0.7355078, 1.47603, 0.2137497, 1, 1, 1, 1, 1,
-0.7338866, -1.273712, -2.98857, 1, 1, 1, 1, 1,
-0.7319611, -0.639187, -2.341789, 1, 1, 1, 1, 1,
-0.7289172, 0.8825492, 0.1337604, 0, 0, 1, 1, 1,
-0.7209712, -0.8269033, -2.567844, 1, 0, 0, 1, 1,
-0.7198031, 0.06871834, 0.5936357, 1, 0, 0, 1, 1,
-0.7159973, 1.441326, -0.4462694, 1, 0, 0, 1, 1,
-0.704873, -0.2084769, -1.721742, 1, 0, 0, 1, 1,
-0.7044683, 1.727998, 0.656714, 1, 0, 0, 1, 1,
-0.6999733, 0.4438822, -0.4765661, 0, 0, 0, 1, 1,
-0.6980501, 0.4680484, -1.693427, 0, 0, 0, 1, 1,
-0.6976134, 0.5591955, -1.082563, 0, 0, 0, 1, 1,
-0.6968918, 0.6943952, -0.3063137, 0, 0, 0, 1, 1,
-0.69627, 0.6304465, -0.5040138, 0, 0, 0, 1, 1,
-0.6948453, 1.013166, -2.982739, 0, 0, 0, 1, 1,
-0.6808971, 0.01382689, -1.510771, 0, 0, 0, 1, 1,
-0.6803828, -0.9409377, -3.053196, 1, 1, 1, 1, 1,
-0.6764864, 2.53189, -0.8807499, 1, 1, 1, 1, 1,
-0.6762112, 1.044069, -2.293251, 1, 1, 1, 1, 1,
-0.673423, 0.6199419, -0.1522754, 1, 1, 1, 1, 1,
-0.6712472, -1.103521, -2.908335, 1, 1, 1, 1, 1,
-0.6684979, -0.2966692, -2.989681, 1, 1, 1, 1, 1,
-0.6671147, 2.323769, -1.130122, 1, 1, 1, 1, 1,
-0.6653621, 1.015482, -0.7100512, 1, 1, 1, 1, 1,
-0.6621551, -2.02328, -2.945633, 1, 1, 1, 1, 1,
-0.6596444, 0.6282367, -1.149089, 1, 1, 1, 1, 1,
-0.6562747, 0.07565826, -2.801284, 1, 1, 1, 1, 1,
-0.6561913, 1.201367, -0.7709423, 1, 1, 1, 1, 1,
-0.6559238, -1.546904, -2.791519, 1, 1, 1, 1, 1,
-0.6547381, 0.9641275, -1.779943, 1, 1, 1, 1, 1,
-0.6543632, 1.007599, -2.235396, 1, 1, 1, 1, 1,
-0.652351, -1.882049, -1.08291, 0, 0, 1, 1, 1,
-0.6477439, 0.2805501, 0.9764836, 1, 0, 0, 1, 1,
-0.6443558, 1.008131, -0.7657179, 1, 0, 0, 1, 1,
-0.6442989, 0.5502246, -0.9690666, 1, 0, 0, 1, 1,
-0.6439596, 0.9960292, -1.098018, 1, 0, 0, 1, 1,
-0.6428455, -0.5153345, -2.629847, 1, 0, 0, 1, 1,
-0.6406447, -0.1403508, -2.038013, 0, 0, 0, 1, 1,
-0.6400356, 0.2643708, -2.70804, 0, 0, 0, 1, 1,
-0.6398895, 1.462175, -1.75236, 0, 0, 0, 1, 1,
-0.6369465, 0.7800187, 0.6567988, 0, 0, 0, 1, 1,
-0.6328384, -2.063224, -2.1297, 0, 0, 0, 1, 1,
-0.6317076, 0.1696377, -2.282125, 0, 0, 0, 1, 1,
-0.6296361, -0.6651829, -2.5293, 0, 0, 0, 1, 1,
-0.6255844, 0.9653212, -1.209677, 1, 1, 1, 1, 1,
-0.6185057, 2.361675, 0.1247445, 1, 1, 1, 1, 1,
-0.6165068, 0.8690175, -1.637689, 1, 1, 1, 1, 1,
-0.6157517, -0.05675789, -2.764438, 1, 1, 1, 1, 1,
-0.6089349, -1.409389, -2.609676, 1, 1, 1, 1, 1,
-0.6054172, -1.346635, -3.345921, 1, 1, 1, 1, 1,
-0.6043172, -0.07932914, -1.268171, 1, 1, 1, 1, 1,
-0.6028383, -2.407876, -2.574152, 1, 1, 1, 1, 1,
-0.5998152, -1.179899, -2.92086, 1, 1, 1, 1, 1,
-0.5975625, 0.06236817, -2.555267, 1, 1, 1, 1, 1,
-0.5944461, 0.4305393, -1.456918, 1, 1, 1, 1, 1,
-0.5907055, -1.272939, -2.331554, 1, 1, 1, 1, 1,
-0.5904445, -1.071828, -2.500201, 1, 1, 1, 1, 1,
-0.5846279, -0.7607158, -2.717922, 1, 1, 1, 1, 1,
-0.58025, -0.6341364, -2.90867, 1, 1, 1, 1, 1,
-0.5768171, -0.646646, -3.005193, 0, 0, 1, 1, 1,
-0.5761725, -0.0466326, -3.4616, 1, 0, 0, 1, 1,
-0.5692455, 0.06916402, -0.5357205, 1, 0, 0, 1, 1,
-0.5616838, 0.6777799, -0.4198075, 1, 0, 0, 1, 1,
-0.5534572, -0.1478913, -1.323265, 1, 0, 0, 1, 1,
-0.5512401, 0.4733013, -2.073161, 1, 0, 0, 1, 1,
-0.5506729, -2.253814, -1.956379, 0, 0, 0, 1, 1,
-0.5484527, 0.7797303, 1.187112, 0, 0, 0, 1, 1,
-0.5482037, -0.8987719, -2.502394, 0, 0, 0, 1, 1,
-0.5463932, -0.8644781, -4.421214, 0, 0, 0, 1, 1,
-0.5405279, -1.344148, -2.3201, 0, 0, 0, 1, 1,
-0.5386328, 0.18166, 0.642213, 0, 0, 0, 1, 1,
-0.5346299, 1.507633, -1.641228, 0, 0, 0, 1, 1,
-0.5307368, -0.3025788, -1.382804, 1, 1, 1, 1, 1,
-0.527052, -0.6717824, -4.267517, 1, 1, 1, 1, 1,
-0.5264938, -0.5033397, -2.320861, 1, 1, 1, 1, 1,
-0.5250502, -1.095009, -3.03423, 1, 1, 1, 1, 1,
-0.5220854, 1.056326, 0.6361565, 1, 1, 1, 1, 1,
-0.5218269, 1.592544, -0.07331354, 1, 1, 1, 1, 1,
-0.5171767, 0.2798916, -1.184945, 1, 1, 1, 1, 1,
-0.515385, 0.1044346, -2.262033, 1, 1, 1, 1, 1,
-0.512126, -1.191792, -1.590827, 1, 1, 1, 1, 1,
-0.510106, 0.3255209, -0.6481259, 1, 1, 1, 1, 1,
-0.5056385, 1.451522, 2.539562, 1, 1, 1, 1, 1,
-0.5051644, 0.944588, -1.833668, 1, 1, 1, 1, 1,
-0.5050492, 1.432608, -0.5513013, 1, 1, 1, 1, 1,
-0.5043315, -0.3164292, -2.044623, 1, 1, 1, 1, 1,
-0.5027913, 0.8301256, -1.195612, 1, 1, 1, 1, 1,
-0.4982193, -1.427319, -1.347945, 0, 0, 1, 1, 1,
-0.4954107, -0.470605, -0.5873069, 1, 0, 0, 1, 1,
-0.4900287, -0.6476488, -3.070842, 1, 0, 0, 1, 1,
-0.4890404, 0.08068171, -2.933203, 1, 0, 0, 1, 1,
-0.4876628, 0.002879574, -1.987857, 1, 0, 0, 1, 1,
-0.4870159, -0.09030302, -3.238698, 1, 0, 0, 1, 1,
-0.4869562, -0.3243444, -1.255996, 0, 0, 0, 1, 1,
-0.4863842, 1.560519, -1.134801, 0, 0, 0, 1, 1,
-0.4838325, 0.6187372, -0.08309439, 0, 0, 0, 1, 1,
-0.4808421, -0.45074, -3.181217, 0, 0, 0, 1, 1,
-0.4756604, -0.7652982, -3.46438, 0, 0, 0, 1, 1,
-0.4751583, -0.2089409, -2.753054, 0, 0, 0, 1, 1,
-0.4751129, 0.8973601, -0.5486858, 0, 0, 0, 1, 1,
-0.4715081, 0.7344496, -0.3238658, 1, 1, 1, 1, 1,
-0.4705067, -0.2406556, -2.168066, 1, 1, 1, 1, 1,
-0.4667458, -0.6530942, -2.581489, 1, 1, 1, 1, 1,
-0.4601666, 1.235046, 0.9530521, 1, 1, 1, 1, 1,
-0.4594662, 0.5570433, -0.7666252, 1, 1, 1, 1, 1,
-0.4582194, -0.5442415, -3.476037, 1, 1, 1, 1, 1,
-0.4580863, 0.8645865, -0.8829226, 1, 1, 1, 1, 1,
-0.458015, 0.4181887, -1.986442, 1, 1, 1, 1, 1,
-0.4479623, -0.6900483, -3.284581, 1, 1, 1, 1, 1,
-0.4432301, 1.90571, -0.1342672, 1, 1, 1, 1, 1,
-0.442587, 0.8815492, -0.9620353, 1, 1, 1, 1, 1,
-0.4397638, 1.004281, -1.647688, 1, 1, 1, 1, 1,
-0.4395743, 0.1476515, -0.7982477, 1, 1, 1, 1, 1,
-0.4301123, -0.1410456, -3.46213, 1, 1, 1, 1, 1,
-0.4289941, -0.3855651, -4.045691, 1, 1, 1, 1, 1,
-0.4282512, -0.9721582, -2.174315, 0, 0, 1, 1, 1,
-0.4280662, -0.8661778, -0.9592749, 1, 0, 0, 1, 1,
-0.4186441, -0.2490265, -1.96794, 1, 0, 0, 1, 1,
-0.4164542, -0.6699711, -1.843044, 1, 0, 0, 1, 1,
-0.413949, -0.8755702, -3.915936, 1, 0, 0, 1, 1,
-0.4137052, -0.8646672, -2.778991, 1, 0, 0, 1, 1,
-0.4093866, -0.2616028, -1.475088, 0, 0, 0, 1, 1,
-0.4003587, 1.035373, -1.651628, 0, 0, 0, 1, 1,
-0.3952545, 0.5156308, -0.1549193, 0, 0, 0, 1, 1,
-0.3858531, 0.2935368, -0.3349322, 0, 0, 0, 1, 1,
-0.384178, -1.638587, -1.995517, 0, 0, 0, 1, 1,
-0.381908, -0.9875249, -1.180057, 0, 0, 0, 1, 1,
-0.3785501, 0.3451139, -0.1387608, 0, 0, 0, 1, 1,
-0.3774872, -0.2373304, -0.8271046, 1, 1, 1, 1, 1,
-0.3767897, -0.1169978, -0.06398299, 1, 1, 1, 1, 1,
-0.3758727, 1.145372, -1.502163, 1, 1, 1, 1, 1,
-0.3720639, 0.9827515, -0.741105, 1, 1, 1, 1, 1,
-0.3683351, -0.2911274, -2.117962, 1, 1, 1, 1, 1,
-0.3636456, 1.410123, 0.08211714, 1, 1, 1, 1, 1,
-0.3635266, -1.595621, -2.674905, 1, 1, 1, 1, 1,
-0.3630683, -0.3707723, -2.978751, 1, 1, 1, 1, 1,
-0.3536038, -0.1268753, -1.491998, 1, 1, 1, 1, 1,
-0.3530316, -1.677989, -0.8282933, 1, 1, 1, 1, 1,
-0.352819, -1.090816, -4.23291, 1, 1, 1, 1, 1,
-0.351091, 0.8756697, -0.6985341, 1, 1, 1, 1, 1,
-0.3500606, -1.284451, -3.853945, 1, 1, 1, 1, 1,
-0.3488844, -0.898914, -2.379966, 1, 1, 1, 1, 1,
-0.3469791, 0.1755336, -2.788647, 1, 1, 1, 1, 1,
-0.3463192, 0.2355566, -0.007199034, 0, 0, 1, 1, 1,
-0.3463187, -1.833405, -2.197794, 1, 0, 0, 1, 1,
-0.3426327, 0.1019588, -2.946627, 1, 0, 0, 1, 1,
-0.3414336, 0.5937873, -1.279113, 1, 0, 0, 1, 1,
-0.3384305, -0.9848425, -2.654503, 1, 0, 0, 1, 1,
-0.3373362, -0.4835461, -2.236285, 1, 0, 0, 1, 1,
-0.3362819, -0.4566521, -2.535505, 0, 0, 0, 1, 1,
-0.3360516, -0.8788333, -4.485239, 0, 0, 0, 1, 1,
-0.3353644, -0.6451647, -3.50509, 0, 0, 0, 1, 1,
-0.3311548, -1.007957, -3.197583, 0, 0, 0, 1, 1,
-0.323787, 0.6659485, -0.5550035, 0, 0, 0, 1, 1,
-0.3219683, 1.418613, -0.5812367, 0, 0, 0, 1, 1,
-0.3162317, -0.5932893, -2.440873, 0, 0, 0, 1, 1,
-0.3144996, 0.4423456, -2.109071, 1, 1, 1, 1, 1,
-0.3143821, 2.286777, -0.8418028, 1, 1, 1, 1, 1,
-0.3134169, -0.2889591, -2.818258, 1, 1, 1, 1, 1,
-0.3133262, 0.8192564, 0.3482102, 1, 1, 1, 1, 1,
-0.3119791, -0.1586565, -1.576347, 1, 1, 1, 1, 1,
-0.3097905, -2.023021, -2.532019, 1, 1, 1, 1, 1,
-0.3080738, 0.6592959, -1.62371, 1, 1, 1, 1, 1,
-0.3068288, -0.5479928, -1.596472, 1, 1, 1, 1, 1,
-0.3046786, -0.4494243, -1.840566, 1, 1, 1, 1, 1,
-0.3043776, 1.718786, -1.014791, 1, 1, 1, 1, 1,
-0.3033137, 0.286376, -0.361768, 1, 1, 1, 1, 1,
-0.3027465, -0.9440777, -3.986442, 1, 1, 1, 1, 1,
-0.3022346, -0.3805229, -2.82989, 1, 1, 1, 1, 1,
-0.3011442, 0.3245172, -0.7893345, 1, 1, 1, 1, 1,
-0.2887062, -1.021506, -1.081554, 1, 1, 1, 1, 1,
-0.28569, -0.5970679, -2.859605, 0, 0, 1, 1, 1,
-0.2855407, -0.359825, -2.680099, 1, 0, 0, 1, 1,
-0.2855289, -0.8664348, -2.492204, 1, 0, 0, 1, 1,
-0.2854444, 0.9048448, -0.7415934, 1, 0, 0, 1, 1,
-0.2818539, -1.208452, -2.110359, 1, 0, 0, 1, 1,
-0.2801916, -1.589253, -2.113133, 1, 0, 0, 1, 1,
-0.2708144, -2.032031, -3.345832, 0, 0, 0, 1, 1,
-0.2708082, -0.8107613, -1.94022, 0, 0, 0, 1, 1,
-0.2698428, 0.4558112, 0.08861048, 0, 0, 0, 1, 1,
-0.2638257, 0.3098741, -0.4192904, 0, 0, 0, 1, 1,
-0.2579755, -0.4960268, -1.614801, 0, 0, 0, 1, 1,
-0.2570181, -0.1026323, -1.787462, 0, 0, 0, 1, 1,
-0.2551223, 0.01949381, -2.453372, 0, 0, 0, 1, 1,
-0.2527426, 2.095735, -0.9045075, 1, 1, 1, 1, 1,
-0.2434327, -1.277044, -2.933707, 1, 1, 1, 1, 1,
-0.2430501, 0.4795071, -1.711624, 1, 1, 1, 1, 1,
-0.2368625, -1.214327, -3.714979, 1, 1, 1, 1, 1,
-0.2284988, 0.2410761, -1.724354, 1, 1, 1, 1, 1,
-0.2245474, 0.07096515, -0.3299079, 1, 1, 1, 1, 1,
-0.2223325, -1.067622, -2.313767, 1, 1, 1, 1, 1,
-0.2220885, 0.5393232, -0.5258678, 1, 1, 1, 1, 1,
-0.2196464, -0.9078044, -1.650192, 1, 1, 1, 1, 1,
-0.2194598, 1.696427, -1.981965, 1, 1, 1, 1, 1,
-0.2193735, -0.631345, -3.104415, 1, 1, 1, 1, 1,
-0.2187016, 0.2331171, -0.8621855, 1, 1, 1, 1, 1,
-0.2174925, 1.381554, -1.139061, 1, 1, 1, 1, 1,
-0.215997, 0.06596091, -0.4958642, 1, 1, 1, 1, 1,
-0.2096173, -0.7888857, -3.771128, 1, 1, 1, 1, 1,
-0.2094708, -1.653786, -2.666016, 0, 0, 1, 1, 1,
-0.2053025, 0.5227695, -0.3620996, 1, 0, 0, 1, 1,
-0.2048747, 0.04343155, 0.03520283, 1, 0, 0, 1, 1,
-0.2037899, 0.4964492, 0.7193639, 1, 0, 0, 1, 1,
-0.2014765, 1.095885, -3.473163, 1, 0, 0, 1, 1,
-0.2009989, 0.8469136, 0.78792, 1, 0, 0, 1, 1,
-0.2001181, -0.7534919, -2.258434, 0, 0, 0, 1, 1,
-0.1994852, -1.031558, -3.60991, 0, 0, 0, 1, 1,
-0.1975971, -0.04466558, -1.440922, 0, 0, 0, 1, 1,
-0.1975783, 0.2487341, -0.06304251, 0, 0, 0, 1, 1,
-0.194648, -0.1954467, -0.856462, 0, 0, 0, 1, 1,
-0.1939147, 1.927867, -0.05044538, 0, 0, 0, 1, 1,
-0.191046, 0.09096347, -0.3519888, 0, 0, 0, 1, 1,
-0.189937, 0.3057443, -2.321156, 1, 1, 1, 1, 1,
-0.1890132, -0.4898744, -4.49208, 1, 1, 1, 1, 1,
-0.1850846, -0.8409994, -2.957622, 1, 1, 1, 1, 1,
-0.1828488, 1.327134, -0.5926803, 1, 1, 1, 1, 1,
-0.1797998, -1.842066, -2.561901, 1, 1, 1, 1, 1,
-0.1788219, -1.689763, -2.573828, 1, 1, 1, 1, 1,
-0.1730127, 0.8336065, 1.102448, 1, 1, 1, 1, 1,
-0.1704197, -1.096799, -3.24497, 1, 1, 1, 1, 1,
-0.1698232, 0.7924212, 0.357017, 1, 1, 1, 1, 1,
-0.1690822, -0.2058658, -2.101435, 1, 1, 1, 1, 1,
-0.1629078, -0.6717667, -3.32131, 1, 1, 1, 1, 1,
-0.156855, 0.3894259, 1.600288, 1, 1, 1, 1, 1,
-0.1546542, -0.3815953, -3.250491, 1, 1, 1, 1, 1,
-0.1517501, 0.7821845, 0.1876206, 1, 1, 1, 1, 1,
-0.1509234, -0.6651608, -2.437469, 1, 1, 1, 1, 1,
-0.1454499, 0.6383806, -0.2617936, 0, 0, 1, 1, 1,
-0.1452939, 0.08878487, -1.101372, 1, 0, 0, 1, 1,
-0.1450995, -0.08657298, -2.556384, 1, 0, 0, 1, 1,
-0.144171, 1.357843, -0.3472327, 1, 0, 0, 1, 1,
-0.1394221, -0.1060151, -0.8837981, 1, 0, 0, 1, 1,
-0.1364602, 0.6427568, -0.282754, 1, 0, 0, 1, 1,
-0.1357496, -0.7789949, -3.259457, 0, 0, 0, 1, 1,
-0.134989, 1.978469, -0.2546247, 0, 0, 0, 1, 1,
-0.1334467, 1.11285, -0.2776465, 0, 0, 0, 1, 1,
-0.1314207, 0.02239538, -1.578486, 0, 0, 0, 1, 1,
-0.1257629, 0.58107, -0.326685, 0, 0, 0, 1, 1,
-0.1253105, -0.3448852, -2.210776, 0, 0, 0, 1, 1,
-0.1229554, -0.6366782, -3.270201, 0, 0, 0, 1, 1,
-0.1215244, -1.087917, -1.905287, 1, 1, 1, 1, 1,
-0.1198241, 2.496782, 0.1420335, 1, 1, 1, 1, 1,
-0.1130344, 0.3655952, 0.03769412, 1, 1, 1, 1, 1,
-0.1019392, -1.174683, -1.767886, 1, 1, 1, 1, 1,
-0.1004199, -0.7029828, -2.413172, 1, 1, 1, 1, 1,
-0.1004168, -0.5647642, -3.611841, 1, 1, 1, 1, 1,
-0.09858735, -1.214329, -1.561158, 1, 1, 1, 1, 1,
-0.09707914, -1.120611, -2.609726, 1, 1, 1, 1, 1,
-0.09156279, 1.006224, 0.1850923, 1, 1, 1, 1, 1,
-0.08812146, -0.4887541, -2.948323, 1, 1, 1, 1, 1,
-0.08791551, 0.7667665, 0.2562507, 1, 1, 1, 1, 1,
-0.08559434, -0.03222768, -2.27613, 1, 1, 1, 1, 1,
-0.08017976, -0.3214406, -2.350986, 1, 1, 1, 1, 1,
-0.07816311, -1.575122, -2.323187, 1, 1, 1, 1, 1,
-0.07207182, -1.754487, -3.734205, 1, 1, 1, 1, 1,
-0.06750321, -0.03881517, -2.991525, 0, 0, 1, 1, 1,
-0.06303568, 1.781316, 0.4530442, 1, 0, 0, 1, 1,
-0.0622201, -0.4195413, -1.211804, 1, 0, 0, 1, 1,
-0.05837806, 0.1542777, -0.8021203, 1, 0, 0, 1, 1,
-0.05666657, -2.012069, -2.782459, 1, 0, 0, 1, 1,
-0.05472681, -0.267849, -5.689565, 1, 0, 0, 1, 1,
-0.04972233, 0.5917072, 0.4045078, 0, 0, 0, 1, 1,
-0.04715801, 0.1695343, 0.1383786, 0, 0, 0, 1, 1,
-0.04664499, 0.3131276, -0.7097874, 0, 0, 0, 1, 1,
-0.04649319, 0.2115472, -1.158071, 0, 0, 0, 1, 1,
-0.04382293, -1.340874, -2.340008, 0, 0, 0, 1, 1,
-0.03689703, 1.163621, 0.08169668, 0, 0, 0, 1, 1,
-0.03620262, -0.4923707, -4.229011, 0, 0, 0, 1, 1,
-0.03569857, 1.319668, -0.3736611, 1, 1, 1, 1, 1,
-0.03458125, -0.2042406, -3.410998, 1, 1, 1, 1, 1,
-0.0344786, 0.1124437, -0.2490762, 1, 1, 1, 1, 1,
-0.03001837, -0.02675144, -1.97718, 1, 1, 1, 1, 1,
-0.02901563, -0.9488711, -4.476298, 1, 1, 1, 1, 1,
-0.02810798, 0.6393272, -0.04871891, 1, 1, 1, 1, 1,
-0.02810533, 0.8695365, 0.5716796, 1, 1, 1, 1, 1,
-0.0240232, 0.8926409, 1.258778, 1, 1, 1, 1, 1,
-0.01964881, -0.7964847, -2.200562, 1, 1, 1, 1, 1,
-0.01761964, 0.4680701, -1.497728, 1, 1, 1, 1, 1,
-0.01514452, 1.355924, 2.383595, 1, 1, 1, 1, 1,
-0.01371541, -1.127226, -2.962354, 1, 1, 1, 1, 1,
-0.0114724, -0.7508082, -4.094096, 1, 1, 1, 1, 1,
-0.008342496, -0.3423852, -2.618918, 1, 1, 1, 1, 1,
-0.008081521, 1.296826, 0.1942804, 1, 1, 1, 1, 1,
-0.00757434, -0.86004, -2.52951, 0, 0, 1, 1, 1,
-0.006062503, 0.8826062, 0.1807505, 1, 0, 0, 1, 1,
-0.005500352, 1.553014, -0.06444766, 1, 0, 0, 1, 1,
-0.003181915, 0.9562075, 0.261919, 1, 0, 0, 1, 1,
0.0008079815, 0.4490326, -1.738717, 1, 0, 0, 1, 1,
0.00505952, -0.9965577, 2.652394, 1, 0, 0, 1, 1,
0.005468364, -0.05187304, 3.758233, 0, 0, 0, 1, 1,
0.008213106, 1.032909, -0.4376653, 0, 0, 0, 1, 1,
0.009569237, 0.3942452, 1.464215, 0, 0, 0, 1, 1,
0.01304576, 1.513531, 0.307541, 0, 0, 0, 1, 1,
0.01377936, 0.5704823, 1.233114, 0, 0, 0, 1, 1,
0.01513956, -0.2009056, 1.324439, 0, 0, 0, 1, 1,
0.01778937, 0.1734653, -0.9366273, 0, 0, 0, 1, 1,
0.02181454, -0.004162984, 2.481507, 1, 1, 1, 1, 1,
0.02183604, 1.556178, 0.6595211, 1, 1, 1, 1, 1,
0.02194482, 0.4343289, 1.119107, 1, 1, 1, 1, 1,
0.02476999, 1.449277, -0.3753538, 1, 1, 1, 1, 1,
0.02863851, -0.6511977, 3.503176, 1, 1, 1, 1, 1,
0.03269966, -0.4821519, 2.393716, 1, 1, 1, 1, 1,
0.03321584, 0.6626081, 1.186272, 1, 1, 1, 1, 1,
0.03750841, 0.6765307, -0.206724, 1, 1, 1, 1, 1,
0.04498477, 0.1092708, -0.3866053, 1, 1, 1, 1, 1,
0.04622348, -0.7934792, 1.828534, 1, 1, 1, 1, 1,
0.04634576, 0.3994192, -0.6146632, 1, 1, 1, 1, 1,
0.04673547, -0.8544238, 1.885924, 1, 1, 1, 1, 1,
0.04692853, 0.7170076, -2.405212, 1, 1, 1, 1, 1,
0.04834193, -1.01468, 1.801389, 1, 1, 1, 1, 1,
0.05288444, 0.3358537, -0.423759, 1, 1, 1, 1, 1,
0.06930692, -0.2843394, 3.524459, 0, 0, 1, 1, 1,
0.07371906, 0.7622159, -0.9077774, 1, 0, 0, 1, 1,
0.07763276, 0.3759897, -0.8081687, 1, 0, 0, 1, 1,
0.08263385, -0.5046482, 3.252046, 1, 0, 0, 1, 1,
0.0833535, -2.008045, 3.380724, 1, 0, 0, 1, 1,
0.09405632, 0.7744719, -0.6235557, 1, 0, 0, 1, 1,
0.09408329, -1.08381, 4.505467, 0, 0, 0, 1, 1,
0.09737778, -1.746135, 3.867013, 0, 0, 0, 1, 1,
0.1046492, -2.129447, 2.756373, 0, 0, 0, 1, 1,
0.1054981, 1.337639, 1.017709, 0, 0, 0, 1, 1,
0.1057164, 0.7646168, 0.1970159, 0, 0, 0, 1, 1,
0.105754, 0.08630007, 0.3508544, 0, 0, 0, 1, 1,
0.1111806, -1.130046, 2.770376, 0, 0, 0, 1, 1,
0.111663, -1.433268, 3.896836, 1, 1, 1, 1, 1,
0.1150799, 1.789755, -0.421562, 1, 1, 1, 1, 1,
0.1152303, -0.1684516, 2.439642, 1, 1, 1, 1, 1,
0.1155618, -0.6463993, 3.235152, 1, 1, 1, 1, 1,
0.122977, 0.02544629, 0.598559, 1, 1, 1, 1, 1,
0.1235107, -1.047332, 3.259593, 1, 1, 1, 1, 1,
0.1253162, -0.166867, 1.428474, 1, 1, 1, 1, 1,
0.1354787, -1.258044, 3.54617, 1, 1, 1, 1, 1,
0.1386617, -0.9327938, 2.180002, 1, 1, 1, 1, 1,
0.1468671, 1.479644, -0.1398798, 1, 1, 1, 1, 1,
0.1532923, -1.370814, 4.250226, 1, 1, 1, 1, 1,
0.1540258, 0.2587847, -0.6293542, 1, 1, 1, 1, 1,
0.1545269, 0.2434052, 1.552873, 1, 1, 1, 1, 1,
0.1552723, 1.583473, 0.09520563, 1, 1, 1, 1, 1,
0.1583004, 0.7246562, 0.5140417, 1, 1, 1, 1, 1,
0.1613375, 0.2222712, 0.6135458, 0, 0, 1, 1, 1,
0.1621882, 2.478255, 0.6521196, 1, 0, 0, 1, 1,
0.1713301, -0.307312, 2.568465, 1, 0, 0, 1, 1,
0.1746934, 0.0248716, 1.364786, 1, 0, 0, 1, 1,
0.1777427, -1.572186, 4.661659, 1, 0, 0, 1, 1,
0.1784981, 0.2260452, 0.8621095, 1, 0, 0, 1, 1,
0.1882097, 0.3142407, 1.318431, 0, 0, 0, 1, 1,
0.1898424, 0.3084522, 1.000163, 0, 0, 0, 1, 1,
0.1925684, -2.339501, 4.113245, 0, 0, 0, 1, 1,
0.1948306, 0.1374435, -0.6760503, 0, 0, 0, 1, 1,
0.1963046, 0.5094168, 1.226737, 0, 0, 0, 1, 1,
0.1977307, -0.2916693, 3.07552, 0, 0, 0, 1, 1,
0.1999326, -0.5820302, 2.821474, 0, 0, 0, 1, 1,
0.2037421, 0.1967393, 0.9204488, 1, 1, 1, 1, 1,
0.2051648, -1.320176, 1.251718, 1, 1, 1, 1, 1,
0.2134344, -0.8245075, 0.6220113, 1, 1, 1, 1, 1,
0.2167166, 1.621785, 1.352165, 1, 1, 1, 1, 1,
0.219455, -1.170294, 2.394224, 1, 1, 1, 1, 1,
0.223873, 0.972073, -0.4435042, 1, 1, 1, 1, 1,
0.2261965, 0.7416245, -1.355128, 1, 1, 1, 1, 1,
0.2286261, -0.1526848, 0.6125084, 1, 1, 1, 1, 1,
0.2290643, -0.7132877, 3.902578, 1, 1, 1, 1, 1,
0.2296105, 1.646702, 0.972048, 1, 1, 1, 1, 1,
0.2302131, 2.188792, -1.376257, 1, 1, 1, 1, 1,
0.230909, 0.6939443, 0.5562055, 1, 1, 1, 1, 1,
0.2310379, -0.09557971, 1.649381, 1, 1, 1, 1, 1,
0.2322452, 0.2422229, 0.2517326, 1, 1, 1, 1, 1,
0.2377376, -1.98993, 3.089608, 1, 1, 1, 1, 1,
0.2395947, 0.3455756, 0.4885339, 0, 0, 1, 1, 1,
0.2467045, 0.7850431, 0.1458369, 1, 0, 0, 1, 1,
0.2603537, 1.805001, 0.2463088, 1, 0, 0, 1, 1,
0.2685126, -0.2702382, 2.204344, 1, 0, 0, 1, 1,
0.2693239, -1.083659, 3.016836, 1, 0, 0, 1, 1,
0.2725312, 0.1347502, 1.818028, 1, 0, 0, 1, 1,
0.2764016, 1.236563, 0.7380219, 0, 0, 0, 1, 1,
0.2801672, 1.33019, 2.569359, 0, 0, 0, 1, 1,
0.2811493, 0.4171364, 1.43562, 0, 0, 0, 1, 1,
0.2816364, 0.8541914, 0.420191, 0, 0, 0, 1, 1,
0.2858818, -0.573748, 2.08313, 0, 0, 0, 1, 1,
0.2873714, -1.110422, 1.892454, 0, 0, 0, 1, 1,
0.2877499, 0.09816518, 0.4846255, 0, 0, 0, 1, 1,
0.2910449, -0.4581838, 3.824278, 1, 1, 1, 1, 1,
0.2918057, -1.134751, 2.853937, 1, 1, 1, 1, 1,
0.2956186, -0.2038759, 2.447992, 1, 1, 1, 1, 1,
0.2991426, -0.1896507, 3.075815, 1, 1, 1, 1, 1,
0.2991838, 0.7828603, 0.8294666, 1, 1, 1, 1, 1,
0.2993553, -0.8146383, 0.7945896, 1, 1, 1, 1, 1,
0.304248, -0.7300712, 2.744639, 1, 1, 1, 1, 1,
0.3067327, -1.585562, 1.952914, 1, 1, 1, 1, 1,
0.3080041, 1.742245, 0.1931417, 1, 1, 1, 1, 1,
0.3113221, 0.1861892, 1.204786, 1, 1, 1, 1, 1,
0.3132767, 0.2741143, 1.673575, 1, 1, 1, 1, 1,
0.3146802, 0.4361972, -0.1835719, 1, 1, 1, 1, 1,
0.3148877, -0.2624667, 1.410605, 1, 1, 1, 1, 1,
0.3149885, -0.04349041, 2.136591, 1, 1, 1, 1, 1,
0.3270556, -0.4599425, 3.157597, 1, 1, 1, 1, 1,
0.3285362, 0.8799682, 0.01430298, 0, 0, 1, 1, 1,
0.3301505, 0.2987956, 0.3189054, 1, 0, 0, 1, 1,
0.3310576, -0.8916383, 4.722349, 1, 0, 0, 1, 1,
0.3338654, 0.1950197, 1.083446, 1, 0, 0, 1, 1,
0.3364049, 0.1172332, 1.042139, 1, 0, 0, 1, 1,
0.3399755, -0.6390032, 2.649093, 1, 0, 0, 1, 1,
0.3418775, 0.792498, 0.8801199, 0, 0, 0, 1, 1,
0.3434764, 0.7973568, 0.4240412, 0, 0, 0, 1, 1,
0.3457284, 0.8486862, 1.233766, 0, 0, 0, 1, 1,
0.3462859, 0.5102912, 0.7780447, 0, 0, 0, 1, 1,
0.3486262, -0.7390441, 3.590711, 0, 0, 0, 1, 1,
0.3488247, 0.678099, -0.3704093, 0, 0, 0, 1, 1,
0.3548007, -1.309307, 2.435211, 0, 0, 0, 1, 1,
0.3553838, -0.02981924, 3.426509, 1, 1, 1, 1, 1,
0.3556279, -0.5453377, 3.180526, 1, 1, 1, 1, 1,
0.3570247, 1.267287, 2.401085, 1, 1, 1, 1, 1,
0.3572327, 0.5227447, 1.426545, 1, 1, 1, 1, 1,
0.3595191, -1.381403, 3.843066, 1, 1, 1, 1, 1,
0.3622455, 0.2158514, 2.526443, 1, 1, 1, 1, 1,
0.3699183, -1.024925, 2.845149, 1, 1, 1, 1, 1,
0.3735516, -0.9631304, 2.60737, 1, 1, 1, 1, 1,
0.3760589, -0.4855391, 3.0478, 1, 1, 1, 1, 1,
0.3797163, -0.5407142, 2.043705, 1, 1, 1, 1, 1,
0.3811821, 0.5840141, 0.8679116, 1, 1, 1, 1, 1,
0.3825821, -2.01683, 3.072551, 1, 1, 1, 1, 1,
0.3826299, 0.0001825911, 2.380103, 1, 1, 1, 1, 1,
0.3828711, -0.01568747, 1.739508, 1, 1, 1, 1, 1,
0.3837949, -1.156731, 3.858886, 1, 1, 1, 1, 1,
0.3838817, -1.128725, 3.154866, 0, 0, 1, 1, 1,
0.3857397, 0.3069296, 2.165417, 1, 0, 0, 1, 1,
0.3880326, -0.2028765, 3.269976, 1, 0, 0, 1, 1,
0.3927265, 0.04787958, 1.754779, 1, 0, 0, 1, 1,
0.399428, -1.552098, 2.826373, 1, 0, 0, 1, 1,
0.4046945, -2.534227, 4.390336, 1, 0, 0, 1, 1,
0.4066581, 0.466614, 0.04963646, 0, 0, 0, 1, 1,
0.4127775, -0.2551728, 0.9690143, 0, 0, 0, 1, 1,
0.4133662, -2.227728, 2.53637, 0, 0, 0, 1, 1,
0.4145984, -0.4708825, 2.367762, 0, 0, 0, 1, 1,
0.4192412, -1.826025, 4.478426, 0, 0, 0, 1, 1,
0.427594, -1.803407, 2.517707, 0, 0, 0, 1, 1,
0.4311908, -0.4275293, 1.685727, 0, 0, 0, 1, 1,
0.4313797, -1.444689, 3.000063, 1, 1, 1, 1, 1,
0.4317536, -0.4912052, 2.117633, 1, 1, 1, 1, 1,
0.4317626, 0.6958578, 0.8598316, 1, 1, 1, 1, 1,
0.4379326, -0.9695023, 3.336773, 1, 1, 1, 1, 1,
0.4392573, -0.2556595, 1.119105, 1, 1, 1, 1, 1,
0.4394411, 1.800062, -1.151356, 1, 1, 1, 1, 1,
0.44003, 0.9205914, -0.2465466, 1, 1, 1, 1, 1,
0.4434036, 0.07689127, 2.456086, 1, 1, 1, 1, 1,
0.4435857, 0.09943288, 0.6957872, 1, 1, 1, 1, 1,
0.4444743, 0.3785622, 2.334223, 1, 1, 1, 1, 1,
0.4485275, -0.1657484, 1.798353, 1, 1, 1, 1, 1,
0.4493022, -0.1165157, 1.52057, 1, 1, 1, 1, 1,
0.4496386, 1.221568, 1.98893, 1, 1, 1, 1, 1,
0.4508491, -1.472921, 2.713586, 1, 1, 1, 1, 1,
0.4551674, 0.07551279, 1.782857, 1, 1, 1, 1, 1,
0.4551988, 0.5198439, 1.196871, 0, 0, 1, 1, 1,
0.4552609, -2.533294, 2.93028, 1, 0, 0, 1, 1,
0.4615239, -0.5430594, 1.890789, 1, 0, 0, 1, 1,
0.465634, -1.642525, 4.41678, 1, 0, 0, 1, 1,
0.4691639, 0.1783261, 0.8846747, 1, 0, 0, 1, 1,
0.4701412, -0.2657477, 2.832495, 1, 0, 0, 1, 1,
0.4729049, 0.5612944, 0.3283707, 0, 0, 0, 1, 1,
0.4732637, -0.3110194, 2.767798, 0, 0, 0, 1, 1,
0.4790613, -0.1810189, 2.871726, 0, 0, 0, 1, 1,
0.4810537, -0.06375653, 2.054806, 0, 0, 0, 1, 1,
0.4821168, -0.9650107, 4.357295, 0, 0, 0, 1, 1,
0.4823101, -1.257219, 4.185764, 0, 0, 0, 1, 1,
0.4841964, -0.7296571, 1.810644, 0, 0, 0, 1, 1,
0.4847359, -0.4439665, 3.088701, 1, 1, 1, 1, 1,
0.4857116, 1.3235, 1.019884, 1, 1, 1, 1, 1,
0.4860404, -0.8083056, 3.000102, 1, 1, 1, 1, 1,
0.4896233, 0.0266819, 0.146457, 1, 1, 1, 1, 1,
0.4910111, 1.172611, 1.574897, 1, 1, 1, 1, 1,
0.500555, -1.599014, 3.033222, 1, 1, 1, 1, 1,
0.5019135, 3.170859, 0.5613548, 1, 1, 1, 1, 1,
0.5050592, 0.731227, 1.397928, 1, 1, 1, 1, 1,
0.5066834, -0.3124024, 1.050848, 1, 1, 1, 1, 1,
0.5158495, 0.6980364, 0.1956397, 1, 1, 1, 1, 1,
0.5161769, 0.3944626, -0.4484132, 1, 1, 1, 1, 1,
0.5168999, -0.3187307, 1.468509, 1, 1, 1, 1, 1,
0.5191687, -1.753409, 2.643766, 1, 1, 1, 1, 1,
0.5206239, -0.1858069, 2.952323, 1, 1, 1, 1, 1,
0.5271086, -0.3905543, 2.85989, 1, 1, 1, 1, 1,
0.5277566, 1.143025, 2.688289, 0, 0, 1, 1, 1,
0.528555, 1.641009, 2.348866, 1, 0, 0, 1, 1,
0.5341096, -1.9717, 2.395146, 1, 0, 0, 1, 1,
0.5351837, -1.103689, 2.832995, 1, 0, 0, 1, 1,
0.5358242, -1.982373, 5.100728, 1, 0, 0, 1, 1,
0.5431448, 0.82778, 0.6341234, 1, 0, 0, 1, 1,
0.54627, -0.3231018, 0.6550959, 0, 0, 0, 1, 1,
0.5490894, 2.324737, 0.6262901, 0, 0, 0, 1, 1,
0.5552227, 0.04765102, 0.6025352, 0, 0, 0, 1, 1,
0.5620171, -0.5905117, 1.864202, 0, 0, 0, 1, 1,
0.5626217, 0.4279049, 0.8029452, 0, 0, 0, 1, 1,
0.5649344, 1.938814, 0.8400435, 0, 0, 0, 1, 1,
0.5666795, -0.8838891, 2.45766, 0, 0, 0, 1, 1,
0.5731748, 0.4350604, 0.1887029, 1, 1, 1, 1, 1,
0.5741746, 1.142772, 1.259361, 1, 1, 1, 1, 1,
0.5745906, 0.297957, 0.1329181, 1, 1, 1, 1, 1,
0.576819, -1.586629, 1.774328, 1, 1, 1, 1, 1,
0.5792994, -0.01618239, 0.2583428, 1, 1, 1, 1, 1,
0.58113, -0.3695765, 2.971033, 1, 1, 1, 1, 1,
0.5831175, 1.084879, -1.290133, 1, 1, 1, 1, 1,
0.5833327, 1.319444, 0.06561117, 1, 1, 1, 1, 1,
0.5834014, -0.03904302, 3.400081, 1, 1, 1, 1, 1,
0.5848767, 0.4515146, 0.3082043, 1, 1, 1, 1, 1,
0.5856824, -2.027562, 2.867841, 1, 1, 1, 1, 1,
0.5890248, -0.04725355, 2.256534, 1, 1, 1, 1, 1,
0.5890677, -1.323123, 2.131594, 1, 1, 1, 1, 1,
0.5897603, 0.4093441, 1.462688, 1, 1, 1, 1, 1,
0.5930747, -0.01829413, 1.949605, 1, 1, 1, 1, 1,
0.5941211, 0.3756937, -0.0960801, 0, 0, 1, 1, 1,
0.5953593, -0.1281908, 1.312892, 1, 0, 0, 1, 1,
0.6025359, -2.897326, 4.122314, 1, 0, 0, 1, 1,
0.603493, 0.4956371, 0.5575776, 1, 0, 0, 1, 1,
0.6093801, 0.5190353, 0.3155887, 1, 0, 0, 1, 1,
0.6099474, -0.2670233, 0.3112807, 1, 0, 0, 1, 1,
0.6151775, 0.3226243, 0.9255465, 0, 0, 0, 1, 1,
0.6154016, -0.3354686, 1.131897, 0, 0, 0, 1, 1,
0.6245388, -0.414399, 3.288125, 0, 0, 0, 1, 1,
0.6251837, 0.7653537, -0.1440051, 0, 0, 0, 1, 1,
0.6262127, -0.1800147, 2.092896, 0, 0, 0, 1, 1,
0.6379931, -0.7701854, 3.235921, 0, 0, 0, 1, 1,
0.6425834, 0.6031401, -0.1450809, 0, 0, 0, 1, 1,
0.6456577, -0.1426748, 3.421165, 1, 1, 1, 1, 1,
0.648192, -0.585272, 1.05152, 1, 1, 1, 1, 1,
0.6493756, 0.5853764, 0.1134586, 1, 1, 1, 1, 1,
0.650759, 1.426081, 2.528409, 1, 1, 1, 1, 1,
0.6509357, -0.8145124, 2.275064, 1, 1, 1, 1, 1,
0.6558883, -0.4264083, 1.295264, 1, 1, 1, 1, 1,
0.6572249, 1.034156, 1.840086, 1, 1, 1, 1, 1,
0.6575379, -0.1693406, 2.027449, 1, 1, 1, 1, 1,
0.6608845, 0.0399272, 1.072308, 1, 1, 1, 1, 1,
0.6631006, -0.5755241, 2.733662, 1, 1, 1, 1, 1,
0.6635601, -0.1132391, 2.268681, 1, 1, 1, 1, 1,
0.6702045, 1.862984, -0.1343236, 1, 1, 1, 1, 1,
0.6735521, 0.3648382, 0.4759571, 1, 1, 1, 1, 1,
0.6736651, -0.267679, 0.8825375, 1, 1, 1, 1, 1,
0.6755888, -0.04957787, 1.25599, 1, 1, 1, 1, 1,
0.6776537, -0.5079039, 2.423357, 0, 0, 1, 1, 1,
0.69297, -1.330982, 1.527789, 1, 0, 0, 1, 1,
0.6987339, -0.8793904, 1.773909, 1, 0, 0, 1, 1,
0.7078429, -1.764463, 2.624558, 1, 0, 0, 1, 1,
0.7110435, 0.5801227, 0.5533621, 1, 0, 0, 1, 1,
0.7136856, 0.6459799, 1.542319, 1, 0, 0, 1, 1,
0.7138014, -2.116977, 2.29067, 0, 0, 0, 1, 1,
0.7205929, -1.382619, 3.828839, 0, 0, 0, 1, 1,
0.7252989, 1.261381, 0.7454115, 0, 0, 0, 1, 1,
0.7265295, 1.087502, 1.925273, 0, 0, 0, 1, 1,
0.7274934, 1.123581, -0.9476443, 0, 0, 0, 1, 1,
0.7276576, 1.016925, 2.42846, 0, 0, 0, 1, 1,
0.7277458, -0.03273411, 1.265811, 0, 0, 0, 1, 1,
0.7305423, -0.1980792, 1.285328, 1, 1, 1, 1, 1,
0.7324623, -0.2111515, 0.9071759, 1, 1, 1, 1, 1,
0.7344052, -0.6299263, 0.8437265, 1, 1, 1, 1, 1,
0.7359612, 0.1941053, 1.580052, 1, 1, 1, 1, 1,
0.7440993, 1.551109, 0.3327439, 1, 1, 1, 1, 1,
0.7499613, -0.1674623, 2.864099, 1, 1, 1, 1, 1,
0.7510019, 0.2452966, 1.063627, 1, 1, 1, 1, 1,
0.7531118, 0.2085358, 2.784081, 1, 1, 1, 1, 1,
0.7552401, -0.00644126, 1.678521, 1, 1, 1, 1, 1,
0.7558694, 1.330329, -0.3225841, 1, 1, 1, 1, 1,
0.7609913, 0.229997, 2.106939, 1, 1, 1, 1, 1,
0.7615815, 0.9387031, -0.2336371, 1, 1, 1, 1, 1,
0.7651796, -0.5506834, 2.105685, 1, 1, 1, 1, 1,
0.7661335, 0.1611077, 0.06104326, 1, 1, 1, 1, 1,
0.7864446, -1.429087, 2.59734, 1, 1, 1, 1, 1,
0.7951018, -0.05722351, 1.147004, 0, 0, 1, 1, 1,
0.7962168, 1.746312, 1.957325, 1, 0, 0, 1, 1,
0.8040984, -0.4742918, 1.041618, 1, 0, 0, 1, 1,
0.8043277, 1.03185, 2.730358, 1, 0, 0, 1, 1,
0.8133786, -0.9035257, 4.340638, 1, 0, 0, 1, 1,
0.8171179, 1.329377, 0.3316665, 1, 0, 0, 1, 1,
0.818343, -0.4699395, 1.645375, 0, 0, 0, 1, 1,
0.8221385, 0.8523004, -0.2190481, 0, 0, 0, 1, 1,
0.8235831, -1.364, 3.124657, 0, 0, 0, 1, 1,
0.8238144, -0.4901389, 1.975804, 0, 0, 0, 1, 1,
0.8240184, -0.6789063, 0.4219035, 0, 0, 0, 1, 1,
0.8304695, 0.07345265, 0.8466045, 0, 0, 0, 1, 1,
0.835506, 1.817264, -0.0192917, 0, 0, 0, 1, 1,
0.8362028, 1.041952, 1.268343, 1, 1, 1, 1, 1,
0.8464304, 0.2943301, 1.383007, 1, 1, 1, 1, 1,
0.8509411, -0.920198, 1.549934, 1, 1, 1, 1, 1,
0.8537942, -1.285159, 2.021394, 1, 1, 1, 1, 1,
0.8571846, -1.62848, 2.901215, 1, 1, 1, 1, 1,
0.8591896, 0.05034207, 0.7045196, 1, 1, 1, 1, 1,
0.8591997, 1.347317, -0.987652, 1, 1, 1, 1, 1,
0.8658158, 0.6708148, 1.113968, 1, 1, 1, 1, 1,
0.8718828, 0.3714224, 0.2782408, 1, 1, 1, 1, 1,
0.8729879, 0.6246678, 0.5315391, 1, 1, 1, 1, 1,
0.8768224, 1.916343, 2.146036, 1, 1, 1, 1, 1,
0.8774078, 0.7259314, 2.029081, 1, 1, 1, 1, 1,
0.8806326, -0.7672156, 0.5430168, 1, 1, 1, 1, 1,
0.8816363, 2.445287, -1.267301, 1, 1, 1, 1, 1,
0.8827044, 0.02304105, 0.3180656, 1, 1, 1, 1, 1,
0.8827335, 1.255138, 2.19049, 0, 0, 1, 1, 1,
0.8860017, -0.001009289, 2.23262, 1, 0, 0, 1, 1,
0.8886069, -0.6244642, 2.543457, 1, 0, 0, 1, 1,
0.8924147, 0.9351724, 1.019889, 1, 0, 0, 1, 1,
0.8989015, 1.16192, 2.477309, 1, 0, 0, 1, 1,
0.8992859, 0.2036579, 1.192908, 1, 0, 0, 1, 1,
0.899904, 1.616816, 1.531896, 0, 0, 0, 1, 1,
0.9070298, -1.621106, 3.890328, 0, 0, 0, 1, 1,
0.9099441, 0.3050492, 2.215053, 0, 0, 0, 1, 1,
0.913124, -1.006257, 2.793749, 0, 0, 0, 1, 1,
0.9138947, -2.040805, 1.636018, 0, 0, 0, 1, 1,
0.921436, -2.262233, 2.129347, 0, 0, 0, 1, 1,
0.925622, -0.05294378, 1.445609, 0, 0, 0, 1, 1,
0.9283394, 0.4940061, 1.463745, 1, 1, 1, 1, 1,
0.9296812, -0.3289059, 1.877336, 1, 1, 1, 1, 1,
0.9310331, -0.5300651, 2.333742, 1, 1, 1, 1, 1,
0.9429483, -0.4899388, 1.799415, 1, 1, 1, 1, 1,
0.9459691, -0.04404626, 1.972557, 1, 1, 1, 1, 1,
0.9467473, 0.8225129, 1.100592, 1, 1, 1, 1, 1,
0.948904, -1.355635, 2.206223, 1, 1, 1, 1, 1,
0.9517866, 0.6458652, 2.041808, 1, 1, 1, 1, 1,
0.9559014, -1.53581, 1.981504, 1, 1, 1, 1, 1,
0.9577219, -0.0504838, 0.9351807, 1, 1, 1, 1, 1,
0.9584477, -0.7817253, 2.109196, 1, 1, 1, 1, 1,
0.9613088, -0.8178647, 1.985262, 1, 1, 1, 1, 1,
0.9704429, 0.2178696, 1.361655, 1, 1, 1, 1, 1,
0.9780133, -3.172299, 1.536314, 1, 1, 1, 1, 1,
0.9811856, 0.3513265, 2.264561, 1, 1, 1, 1, 1,
0.9831134, -0.2573597, 1.119224, 0, 0, 1, 1, 1,
0.9920598, 0.1675436, 2.098329, 1, 0, 0, 1, 1,
0.9992532, 1.844559, 1.974399, 1, 0, 0, 1, 1,
1.000238, -0.2821111, 1.14364, 1, 0, 0, 1, 1,
1.001647, -0.6879091, 1.720586, 1, 0, 0, 1, 1,
1.00374, -0.1800848, 1.077379, 1, 0, 0, 1, 1,
1.004979, 1.16318, 0.175859, 0, 0, 0, 1, 1,
1.005212, -0.5522861, 1.448281, 0, 0, 0, 1, 1,
1.01, 1.907793, -0.3798227, 0, 0, 0, 1, 1,
1.017555, -0.5322478, 1.288837, 0, 0, 0, 1, 1,
1.02706, -0.9365972, 1.588153, 0, 0, 0, 1, 1,
1.031125, -0.2595192, 2.837846, 0, 0, 0, 1, 1,
1.035062, -0.7343573, 2.541309, 0, 0, 0, 1, 1,
1.035979, -0.9250012, 1.673565, 1, 1, 1, 1, 1,
1.047095, 0.6160555, 0.2728449, 1, 1, 1, 1, 1,
1.047187, 0.0999667, 0.1366659, 1, 1, 1, 1, 1,
1.055761, -0.4166702, 2.461035, 1, 1, 1, 1, 1,
1.067006, -0.9348987, 1.280459, 1, 1, 1, 1, 1,
1.071247, -0.6984134, 1.672632, 1, 1, 1, 1, 1,
1.078932, -0.6616723, 1.315358, 1, 1, 1, 1, 1,
1.081118, -0.5995317, 2.825558, 1, 1, 1, 1, 1,
1.081974, -0.3183728, 1.961321, 1, 1, 1, 1, 1,
1.088835, 0.485229, 1.460423, 1, 1, 1, 1, 1,
1.097333, -0.3363343, 1.689174, 1, 1, 1, 1, 1,
1.11632, 0.3010518, 3.090854, 1, 1, 1, 1, 1,
1.12112, 0.9655055, 1.997072, 1, 1, 1, 1, 1,
1.127258, -0.4987715, 1.227099, 1, 1, 1, 1, 1,
1.128161, -2.256603, 3.315138, 1, 1, 1, 1, 1,
1.128379, 0.5057451, -0.6924317, 0, 0, 1, 1, 1,
1.133324, -2.116988, 4.139264, 1, 0, 0, 1, 1,
1.138929, -0.7023424, 3.049119, 1, 0, 0, 1, 1,
1.139453, -1.279707, 3.220975, 1, 0, 0, 1, 1,
1.144991, -0.1603142, 2.211683, 1, 0, 0, 1, 1,
1.155992, 0.1067177, 1.278806, 1, 0, 0, 1, 1,
1.15659, -1.410913, 1.047856, 0, 0, 0, 1, 1,
1.156609, 0.6778154, 1.196422, 0, 0, 0, 1, 1,
1.161066, -0.0373698, 3.190341, 0, 0, 0, 1, 1,
1.162524, -0.02614469, -1.219047, 0, 0, 0, 1, 1,
1.16328, 0.4379559, 0.1877718, 0, 0, 0, 1, 1,
1.167776, -0.7191677, 1.026292, 0, 0, 0, 1, 1,
1.168339, 0.6853762, 1.604236, 0, 0, 0, 1, 1,
1.170302, -0.7118518, 1.28528, 1, 1, 1, 1, 1,
1.172258, 2.086592, 1.097502, 1, 1, 1, 1, 1,
1.173473, 0.7902165, 0.00184861, 1, 1, 1, 1, 1,
1.175905, 2.280252, 0.2504423, 1, 1, 1, 1, 1,
1.176149, 0.1068055, 2.89307, 1, 1, 1, 1, 1,
1.186263, -0.7984291, 4.086212, 1, 1, 1, 1, 1,
1.190825, 1.062505, -0.3786772, 1, 1, 1, 1, 1,
1.195484, -0.8367531, 3.42273, 1, 1, 1, 1, 1,
1.198603, 0.08873506, 2.446561, 1, 1, 1, 1, 1,
1.199161, 0.8407115, -0.4672876, 1, 1, 1, 1, 1,
1.22106, 0.4635209, 2.382126, 1, 1, 1, 1, 1,
1.232524, 1.22661, 1.318951, 1, 1, 1, 1, 1,
1.24141, -0.5750148, 1.61801, 1, 1, 1, 1, 1,
1.247786, 1.306868, -0.4306161, 1, 1, 1, 1, 1,
1.251646, -2.07183, 3.408312, 1, 1, 1, 1, 1,
1.267502, 1.255894, 0.7809473, 0, 0, 1, 1, 1,
1.27828, 1.58952, 1.925453, 1, 0, 0, 1, 1,
1.280917, -1.423647, 1.486098, 1, 0, 0, 1, 1,
1.290282, -0.6633742, 1.674176, 1, 0, 0, 1, 1,
1.291533, 1.126199, 3.087078, 1, 0, 0, 1, 1,
1.291973, 2.113714, 0.02811601, 1, 0, 0, 1, 1,
1.295168, 0.3997336, 1.498727, 0, 0, 0, 1, 1,
1.306327, 0.98918, 2.015368, 0, 0, 0, 1, 1,
1.309028, -0.7053798, 1.304831, 0, 0, 0, 1, 1,
1.309044, 1.940843, 1.942571, 0, 0, 0, 1, 1,
1.309747, -1.771802, 1.641603, 0, 0, 0, 1, 1,
1.319938, 0.7323968, 0.644598, 0, 0, 0, 1, 1,
1.327826, -0.8734512, 1.825264, 0, 0, 0, 1, 1,
1.332519, 0.6136798, 0.6046118, 1, 1, 1, 1, 1,
1.340536, -1.256365, 0.4152814, 1, 1, 1, 1, 1,
1.346696, 0.7658288, -0.4058954, 1, 1, 1, 1, 1,
1.358104, -0.7267601, 0.7814173, 1, 1, 1, 1, 1,
1.3587, 0.00736092, 1.253815, 1, 1, 1, 1, 1,
1.366033, 1.661153, 1.022022, 1, 1, 1, 1, 1,
1.369432, -2.148699, 2.294835, 1, 1, 1, 1, 1,
1.382425, -0.4709967, 1.657743, 1, 1, 1, 1, 1,
1.3948, -0.5146825, 2.882982, 1, 1, 1, 1, 1,
1.402026, -0.1355413, 2.161572, 1, 1, 1, 1, 1,
1.413529, 0.06807481, 0.5821745, 1, 1, 1, 1, 1,
1.413726, -0.3374831, 1.26592, 1, 1, 1, 1, 1,
1.425046, -2.184495, 1.579146, 1, 1, 1, 1, 1,
1.439259, -0.3475129, 2.224277, 1, 1, 1, 1, 1,
1.446313, -0.9783332, 2.597145, 1, 1, 1, 1, 1,
1.447544, 0.4170046, 2.525762, 0, 0, 1, 1, 1,
1.468419, 1.347252, -0.08987058, 1, 0, 0, 1, 1,
1.472105, -0.2871641, 2.306415, 1, 0, 0, 1, 1,
1.477469, 1.410919, 1.20755, 1, 0, 0, 1, 1,
1.478999, -0.3108985, 2.088672, 1, 0, 0, 1, 1,
1.48108, -1.517879, 1.391214, 1, 0, 0, 1, 1,
1.481492, -1.137537, 3.236398, 0, 0, 0, 1, 1,
1.490784, 1.414465, -0.6647446, 0, 0, 0, 1, 1,
1.501567, 0.8168338, 1.879112, 0, 0, 0, 1, 1,
1.516667, 0.5974716, -0.4937934, 0, 0, 0, 1, 1,
1.544144, 1.395563, -0.2788012, 0, 0, 0, 1, 1,
1.548947, -0.06320025, 1.990414, 0, 0, 0, 1, 1,
1.562396, -0.03389594, 1.753568, 0, 0, 0, 1, 1,
1.564356, 0.3981088, 1.675415, 1, 1, 1, 1, 1,
1.567766, 1.070783, -1.264996, 1, 1, 1, 1, 1,
1.609909, -1.55213, 0.7467473, 1, 1, 1, 1, 1,
1.659358, -0.01397674, 0.2452404, 1, 1, 1, 1, 1,
1.669201, 1.690937, 0.322117, 1, 1, 1, 1, 1,
1.673728, 1.043517, 0.7318308, 1, 1, 1, 1, 1,
1.676301, -0.1243929, 1.417709, 1, 1, 1, 1, 1,
1.676917, -1.568161, 2.893682, 1, 1, 1, 1, 1,
1.682118, 0.9181352, 1.988791, 1, 1, 1, 1, 1,
1.682489, 0.7274715, 2.001742, 1, 1, 1, 1, 1,
1.693329, -1.493753, 2.264932, 1, 1, 1, 1, 1,
1.693415, -0.5140827, 2.896494, 1, 1, 1, 1, 1,
1.704793, 0.07249881, 1.214354, 1, 1, 1, 1, 1,
1.711692, 0.5207158, 0.5135764, 1, 1, 1, 1, 1,
1.725836, -1.158329, 1.600443, 1, 1, 1, 1, 1,
1.736239, -1.239638, 2.671207, 0, 0, 1, 1, 1,
1.748855, 1.245994, 1.235268, 1, 0, 0, 1, 1,
1.768043, -0.2328219, 0.6966625, 1, 0, 0, 1, 1,
1.772607, -1.156383, 1.970778, 1, 0, 0, 1, 1,
1.801387, -0.3847476, 1.341522, 1, 0, 0, 1, 1,
1.803385, 0.6007928, 0.4929167, 1, 0, 0, 1, 1,
1.810794, -0.1412528, 3.08964, 0, 0, 0, 1, 1,
1.81297, 1.542807, 1.14782, 0, 0, 0, 1, 1,
1.849107, 1.401352, 2.167255, 0, 0, 0, 1, 1,
1.868134, 1.100022, -1.299922, 0, 0, 0, 1, 1,
1.879045, -0.884642, 2.478753, 0, 0, 0, 1, 1,
1.886625, -1.243872, 2.396797, 0, 0, 0, 1, 1,
1.926331, -0.7871578, 3.284216, 0, 0, 0, 1, 1,
1.930141, -1.168975, 0.7661588, 1, 1, 1, 1, 1,
1.953052, -0.02628013, 1.794443, 1, 1, 1, 1, 1,
1.969772, 1.323018, -0.560603, 1, 1, 1, 1, 1,
2.001365, 2.054482, 1.575616, 1, 1, 1, 1, 1,
2.078071, -1.673729, 2.843786, 1, 1, 1, 1, 1,
2.080267, -0.6530799, 1.539249, 1, 1, 1, 1, 1,
2.137623, 0.9080806, 2.024788, 1, 1, 1, 1, 1,
2.158566, 0.8646074, 2.092914, 1, 1, 1, 1, 1,
2.176351, -0.01503943, 0.2246629, 1, 1, 1, 1, 1,
2.183944, 0.7959313, 0.5972208, 1, 1, 1, 1, 1,
2.190673, 1.024366, -0.186314, 1, 1, 1, 1, 1,
2.191799, 0.480148, -0.5195649, 1, 1, 1, 1, 1,
2.200557, 0.2335155, 1.599576, 1, 1, 1, 1, 1,
2.253562, -0.5063639, 2.265544, 1, 1, 1, 1, 1,
2.261899, 0.3152843, 1.45065, 1, 1, 1, 1, 1,
2.35489, 0.7603372, 0.6418504, 0, 0, 1, 1, 1,
2.368511, -0.4334992, 2.001986, 1, 0, 0, 1, 1,
2.381226, -0.3457321, 3.055212, 1, 0, 0, 1, 1,
2.392195, -1.566141, 2.407573, 1, 0, 0, 1, 1,
2.420588, 0.4646871, 2.760912, 1, 0, 0, 1, 1,
2.42664, 0.3441978, 1.817302, 1, 0, 0, 1, 1,
2.537222, 0.7493855, 0.423156, 0, 0, 0, 1, 1,
2.562446, 0.02992193, 1.920841, 0, 0, 0, 1, 1,
2.57186, 1.082162, 1.795581, 0, 0, 0, 1, 1,
2.62299, -0.3409125, 0.6524151, 0, 0, 0, 1, 1,
2.655192, -0.5536615, 1.458888, 0, 0, 0, 1, 1,
2.674617, -1.055816, 3.390894, 0, 0, 0, 1, 1,
2.677368, -0.04295571, 2.44385, 0, 0, 0, 1, 1,
2.69486, -1.461692, 2.309319, 1, 1, 1, 1, 1,
2.701396, 0.970979, -0.8029456, 1, 1, 1, 1, 1,
2.763817, -0.7448471, 2.786114, 1, 1, 1, 1, 1,
2.788765, -1.353645, 3.347422, 1, 1, 1, 1, 1,
2.818589, 0.05818469, 1.439999, 1, 1, 1, 1, 1,
2.85456, -1.694256, 2.215762, 1, 1, 1, 1, 1,
2.932234, 0.06356928, 0.9379628, 1, 1, 1, 1, 1
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
var radius = 9.663154;
var distance = 33.94142;
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
mvMatrix.translate( 0.411811, 0.0007200241, 0.2944188 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94142);
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
