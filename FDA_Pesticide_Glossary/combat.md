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
-3.224795, 0.1939862, -1.834367, 1, 0, 0, 1,
-3.015391, 0.3031992, -0.5339265, 1, 0.007843138, 0, 1,
-2.899442, -0.8314971, -1.705409, 1, 0.01176471, 0, 1,
-2.762961, 0.1615096, -0.7552388, 1, 0.01960784, 0, 1,
-2.754158, -0.4583916, -1.26909, 1, 0.02352941, 0, 1,
-2.676312, 0.9359453, -1.469956, 1, 0.03137255, 0, 1,
-2.607368, -0.3461046, -2.056457, 1, 0.03529412, 0, 1,
-2.502438, 0.1044294, -0.5971399, 1, 0.04313726, 0, 1,
-2.451032, -1.263987, -2.679259, 1, 0.04705882, 0, 1,
-2.431119, 0.2377389, -0.5639881, 1, 0.05490196, 0, 1,
-2.418854, 1.078062, -1.747988, 1, 0.05882353, 0, 1,
-2.382858, -0.2745151, -2.314098, 1, 0.06666667, 0, 1,
-2.347309, -1.485531, -0.7986348, 1, 0.07058824, 0, 1,
-2.344199, 0.08008689, -3.729799, 1, 0.07843138, 0, 1,
-2.234946, 1.629457, -0.7661953, 1, 0.08235294, 0, 1,
-2.20617, -1.658543, -2.483366, 1, 0.09019608, 0, 1,
-2.16082, -0.1344195, -1.497627, 1, 0.09411765, 0, 1,
-2.104066, -0.5862487, -2.655185, 1, 0.1019608, 0, 1,
-2.094753, 0.2783992, -0.6678788, 1, 0.1098039, 0, 1,
-2.055915, -0.1787974, -0.4576979, 1, 0.1137255, 0, 1,
-2.055042, -0.2476401, -1.680999, 1, 0.1215686, 0, 1,
-2.049392, -2.365448, -1.782815, 1, 0.1254902, 0, 1,
-2.048291, 0.6228618, -3.540365, 1, 0.1333333, 0, 1,
-2.032202, -1.404201, -0.885165, 1, 0.1372549, 0, 1,
-2.012578, 0.371905, 1.221756, 1, 0.145098, 0, 1,
-2.00408, -1.393337, -2.799446, 1, 0.1490196, 0, 1,
-1.996184, -0.6684988, -1.890686, 1, 0.1568628, 0, 1,
-1.978276, 0.3175173, -1.474846, 1, 0.1607843, 0, 1,
-1.939447, 0.9583662, -0.8139849, 1, 0.1686275, 0, 1,
-1.922605, -0.2650261, -2.694031, 1, 0.172549, 0, 1,
-1.907792, -1.265395, -2.90979, 1, 0.1803922, 0, 1,
-1.902475, 0.5788285, -2.184407, 1, 0.1843137, 0, 1,
-1.890768, 0.4417829, -1.583588, 1, 0.1921569, 0, 1,
-1.848761, -0.5768091, -0.6953251, 1, 0.1960784, 0, 1,
-1.8281, -0.04384373, -2.787027, 1, 0.2039216, 0, 1,
-1.795517, 2.009873, -1.119578, 1, 0.2117647, 0, 1,
-1.791311, 1.467637, -1.619559, 1, 0.2156863, 0, 1,
-1.789151, -1.467315, -3.706551, 1, 0.2235294, 0, 1,
-1.784639, -1.807736, -3.384908, 1, 0.227451, 0, 1,
-1.773798, 0.4504265, -0.286891, 1, 0.2352941, 0, 1,
-1.770169, 0.1907571, -1.342005, 1, 0.2392157, 0, 1,
-1.768392, 0.4034377, -0.8165158, 1, 0.2470588, 0, 1,
-1.754562, 0.7057322, -2.293278, 1, 0.2509804, 0, 1,
-1.747846, -1.537033, -3.69216, 1, 0.2588235, 0, 1,
-1.747285, 0.9070767, -1.345898, 1, 0.2627451, 0, 1,
-1.710191, -0.02850147, -1.274126, 1, 0.2705882, 0, 1,
-1.708624, 0.3559584, -1.76746, 1, 0.2745098, 0, 1,
-1.703676, 0.05780459, -2.676902, 1, 0.282353, 0, 1,
-1.682242, -0.6793431, -1.598735, 1, 0.2862745, 0, 1,
-1.668297, 1.651638, -0.4253463, 1, 0.2941177, 0, 1,
-1.667283, -1.125706, -2.093426, 1, 0.3019608, 0, 1,
-1.662288, 0.5985872, -0.1490903, 1, 0.3058824, 0, 1,
-1.654542, 0.5977746, -1.622739, 1, 0.3137255, 0, 1,
-1.653564, -0.2384347, -1.537233, 1, 0.3176471, 0, 1,
-1.606195, 0.180043, -1.050278, 1, 0.3254902, 0, 1,
-1.598544, -2.152494, -4.335546, 1, 0.3294118, 0, 1,
-1.580837, -0.1668019, -1.94056, 1, 0.3372549, 0, 1,
-1.580067, -0.8915318, -2.183212, 1, 0.3411765, 0, 1,
-1.576785, -0.1192245, -3.503826, 1, 0.3490196, 0, 1,
-1.571846, -0.4594136, -0.2380754, 1, 0.3529412, 0, 1,
-1.566369, -0.02803085, -2.341948, 1, 0.3607843, 0, 1,
-1.565846, -1.501842, -1.14477, 1, 0.3647059, 0, 1,
-1.549389, -2.457197, -1.843369, 1, 0.372549, 0, 1,
-1.548748, -0.1650157, -1.108153, 1, 0.3764706, 0, 1,
-1.546585, 0.3719543, -0.6790177, 1, 0.3843137, 0, 1,
-1.53183, 0.5863843, -0.3725065, 1, 0.3882353, 0, 1,
-1.528215, 1.896174, 0.1709549, 1, 0.3960784, 0, 1,
-1.522501, -0.3265265, -0.9785774, 1, 0.4039216, 0, 1,
-1.502444, -0.0272684, 1.264848, 1, 0.4078431, 0, 1,
-1.501577, 1.108596, -1.925755, 1, 0.4156863, 0, 1,
-1.50097, 2.997642, -1.077996, 1, 0.4196078, 0, 1,
-1.497951, 0.4507038, -3.639316, 1, 0.427451, 0, 1,
-1.485508, -0.07762004, -1.5493, 1, 0.4313726, 0, 1,
-1.481626, 0.1955323, -1.294433, 1, 0.4392157, 0, 1,
-1.475915, -1.207133, -1.777864, 1, 0.4431373, 0, 1,
-1.472762, -0.1182127, 0.2933569, 1, 0.4509804, 0, 1,
-1.465903, 0.639921, -1.493693, 1, 0.454902, 0, 1,
-1.465142, 0.8244455, -0.9100794, 1, 0.4627451, 0, 1,
-1.464293, -0.1155864, -0.4347956, 1, 0.4666667, 0, 1,
-1.456052, -0.5715776, 0.2974705, 1, 0.4745098, 0, 1,
-1.453598, -0.28107, -1.892265, 1, 0.4784314, 0, 1,
-1.451637, -0.7257773, -1.888743, 1, 0.4862745, 0, 1,
-1.442875, -0.1200324, -1.155372, 1, 0.4901961, 0, 1,
-1.438351, -0.1192567, -2.483148, 1, 0.4980392, 0, 1,
-1.428787, 0.3573268, -0.7612977, 1, 0.5058824, 0, 1,
-1.426366, -0.3161008, -1.256436, 1, 0.509804, 0, 1,
-1.426276, 1.605945, 0.3839907, 1, 0.5176471, 0, 1,
-1.424922, -0.8625959, -2.389992, 1, 0.5215687, 0, 1,
-1.42438, -0.09881057, -0.2885919, 1, 0.5294118, 0, 1,
-1.41719, -1.19384, -1.845081, 1, 0.5333334, 0, 1,
-1.415952, -0.2823071, -2.960513, 1, 0.5411765, 0, 1,
-1.413913, 1.161972, -0.2668263, 1, 0.5450981, 0, 1,
-1.407362, -2.137601, -2.877554, 1, 0.5529412, 0, 1,
-1.403686, 0.1959841, -1.423874, 1, 0.5568628, 0, 1,
-1.385436, 0.7866188, 0.3870774, 1, 0.5647059, 0, 1,
-1.385154, -1.037338, -2.283543, 1, 0.5686275, 0, 1,
-1.364855, -0.6445008, -1.692865, 1, 0.5764706, 0, 1,
-1.363131, 0.00450438, -2.275584, 1, 0.5803922, 0, 1,
-1.361913, -1.817562, -4.211522, 1, 0.5882353, 0, 1,
-1.35411, 0.009872214, -1.507847, 1, 0.5921569, 0, 1,
-1.350053, -1.478177, -2.976251, 1, 0.6, 0, 1,
-1.33573, -0.9122243, -0.9250941, 1, 0.6078432, 0, 1,
-1.324602, -0.5316455, -1.910845, 1, 0.6117647, 0, 1,
-1.3239, 0.6680124, -0.8923444, 1, 0.6196079, 0, 1,
-1.322243, -1.083207, -1.49697, 1, 0.6235294, 0, 1,
-1.315675, -1.287599, -1.19351, 1, 0.6313726, 0, 1,
-1.310125, 1.867091, 2.140661, 1, 0.6352941, 0, 1,
-1.306362, -0.5060809, -0.7129276, 1, 0.6431373, 0, 1,
-1.305397, -1.169367, -2.314258, 1, 0.6470588, 0, 1,
-1.295277, 1.687165, -2.292305, 1, 0.654902, 0, 1,
-1.291805, 0.4612995, -1.123963, 1, 0.6588235, 0, 1,
-1.276252, -0.04274556, -2.286638, 1, 0.6666667, 0, 1,
-1.262455, -0.8705764, -2.328466, 1, 0.6705883, 0, 1,
-1.261998, -0.5860355, -2.029286, 1, 0.6784314, 0, 1,
-1.259963, -0.4151951, -3.273917, 1, 0.682353, 0, 1,
-1.252713, 0.9681733, -2.420862, 1, 0.6901961, 0, 1,
-1.246471, 0.6978942, 0.4760801, 1, 0.6941177, 0, 1,
-1.245911, 0.649475, -1.215099, 1, 0.7019608, 0, 1,
-1.240333, -0.9379252, -2.512286, 1, 0.7098039, 0, 1,
-1.232335, -0.9948929, -2.394895, 1, 0.7137255, 0, 1,
-1.225717, 0.6513777, -2.116759, 1, 0.7215686, 0, 1,
-1.219879, 0.9733261, -0.6565933, 1, 0.7254902, 0, 1,
-1.21703, -0.06614762, -1.650483, 1, 0.7333333, 0, 1,
-1.199729, 0.04210333, -2.149392, 1, 0.7372549, 0, 1,
-1.188633, 1.508194, -1.798854, 1, 0.7450981, 0, 1,
-1.180129, 0.3821461, -1.444592, 1, 0.7490196, 0, 1,
-1.17939, 0.871928, -1.559196, 1, 0.7568628, 0, 1,
-1.178436, -0.6059289, -0.9066756, 1, 0.7607843, 0, 1,
-1.173991, 0.1183349, -1.475901, 1, 0.7686275, 0, 1,
-1.171476, -0.2783983, -1.99386, 1, 0.772549, 0, 1,
-1.166134, -0.1451007, -2.993314, 1, 0.7803922, 0, 1,
-1.159057, 0.7999454, -0.7041618, 1, 0.7843137, 0, 1,
-1.147777, -0.00708255, -3.428135, 1, 0.7921569, 0, 1,
-1.147429, -0.3169602, -0.5508705, 1, 0.7960784, 0, 1,
-1.143772, -2.279326, -3.332581, 1, 0.8039216, 0, 1,
-1.143249, -0.9018208, -1.971405, 1, 0.8117647, 0, 1,
-1.14122, 0.3629403, -3.819478, 1, 0.8156863, 0, 1,
-1.137878, -0.7607799, -0.4170457, 1, 0.8235294, 0, 1,
-1.134842, -0.09127844, -0.7389229, 1, 0.827451, 0, 1,
-1.119496, -0.5562494, -2.016637, 1, 0.8352941, 0, 1,
-1.112335, -0.2826771, -2.581011, 1, 0.8392157, 0, 1,
-1.093314, -0.3907304, -2.412925, 1, 0.8470588, 0, 1,
-1.090567, -1.326507, -4.185308, 1, 0.8509804, 0, 1,
-1.086872, 0.8200119, 0.1839646, 1, 0.8588235, 0, 1,
-1.067754, -1.851193, 0.1197484, 1, 0.8627451, 0, 1,
-1.067331, 0.7921941, -2.356925, 1, 0.8705882, 0, 1,
-1.058825, 0.363321, -1.450045, 1, 0.8745098, 0, 1,
-1.047033, -0.4981787, -1.752568, 1, 0.8823529, 0, 1,
-1.043799, -0.3137124, -1.470582, 1, 0.8862745, 0, 1,
-1.042135, 0.5432627, -2.218322, 1, 0.8941177, 0, 1,
-1.041572, 0.5454478, -1.351047, 1, 0.8980392, 0, 1,
-1.037461, -1.081704, -2.297764, 1, 0.9058824, 0, 1,
-1.03514, -1.285411, -3.257703, 1, 0.9137255, 0, 1,
-1.033123, 0.1843197, -0.3884288, 1, 0.9176471, 0, 1,
-1.020333, -0.07102319, -2.086642, 1, 0.9254902, 0, 1,
-1.019931, -0.2374136, -1.311958, 1, 0.9294118, 0, 1,
-1.016057, 0.2931078, -0.1245037, 1, 0.9372549, 0, 1,
-1.011209, -1.499419, -2.695289, 1, 0.9411765, 0, 1,
-0.9949605, 0.8726273, -0.2264067, 1, 0.9490196, 0, 1,
-0.9843752, 2.146563, 1.062632, 1, 0.9529412, 0, 1,
-0.9831175, 0.4075728, 0.5656268, 1, 0.9607843, 0, 1,
-0.9790654, -0.2287052, -0.7583314, 1, 0.9647059, 0, 1,
-0.9734151, -1.516207, -1.358753, 1, 0.972549, 0, 1,
-0.9705789, 0.1816187, -0.2270666, 1, 0.9764706, 0, 1,
-0.9701384, 1.370144, 1.800431, 1, 0.9843137, 0, 1,
-0.9679684, -0.4661331, -0.9224762, 1, 0.9882353, 0, 1,
-0.9611329, 0.02942825, -3.183391, 1, 0.9960784, 0, 1,
-0.959206, -1.093857, -3.353566, 0.9960784, 1, 0, 1,
-0.9564233, 1.036608, -1.425793, 0.9921569, 1, 0, 1,
-0.9489752, 1.43859, -1.746463, 0.9843137, 1, 0, 1,
-0.9409996, -0.2097984, -0.9460991, 0.9803922, 1, 0, 1,
-0.9385965, 0.3062983, -2.090302, 0.972549, 1, 0, 1,
-0.937211, -0.3122862, -2.818567, 0.9686275, 1, 0, 1,
-0.9369086, -0.7746548, -3.567271, 0.9607843, 1, 0, 1,
-0.9287257, -0.5711585, -1.98503, 0.9568627, 1, 0, 1,
-0.9276155, 1.360578, -1.977385, 0.9490196, 1, 0, 1,
-0.9269826, -0.1848909, -1.120639, 0.945098, 1, 0, 1,
-0.9249878, 0.4056473, -0.8643082, 0.9372549, 1, 0, 1,
-0.9228451, -0.5403132, -1.163892, 0.9333333, 1, 0, 1,
-0.91754, 0.107162, -1.232581, 0.9254902, 1, 0, 1,
-0.9152674, 0.6336784, 0.5868431, 0.9215686, 1, 0, 1,
-0.9139736, -0.663638, -3.788234, 0.9137255, 1, 0, 1,
-0.9104329, -0.1104355, -3.504665, 0.9098039, 1, 0, 1,
-0.9019508, -1.554789, -2.060221, 0.9019608, 1, 0, 1,
-0.9012076, -0.6241527, -1.017336, 0.8941177, 1, 0, 1,
-0.8963506, 0.6200909, -1.330408, 0.8901961, 1, 0, 1,
-0.8950878, -2.158111, -2.601963, 0.8823529, 1, 0, 1,
-0.8925762, 1.27416, -1.31497, 0.8784314, 1, 0, 1,
-0.8914212, -0.3902636, -1.178821, 0.8705882, 1, 0, 1,
-0.8863629, 0.9271668, -0.2229581, 0.8666667, 1, 0, 1,
-0.8858095, -0.3790428, -1.767763, 0.8588235, 1, 0, 1,
-0.8790481, 0.2075352, -0.6235665, 0.854902, 1, 0, 1,
-0.8697821, 2.143552, 0.8467419, 0.8470588, 1, 0, 1,
-0.8667102, 1.18503, -1.089532, 0.8431373, 1, 0, 1,
-0.8649212, -0.9146323, -2.340632, 0.8352941, 1, 0, 1,
-0.8646011, 0.08792926, -1.237518, 0.8313726, 1, 0, 1,
-0.864178, 0.6361653, 0.09642432, 0.8235294, 1, 0, 1,
-0.8519276, 1.655382, -0.03338729, 0.8196079, 1, 0, 1,
-0.8506221, 2.079292, -0.4817082, 0.8117647, 1, 0, 1,
-0.8504388, 0.9151753, -0.3059795, 0.8078431, 1, 0, 1,
-0.846072, 2.62851, -1.884088, 0.8, 1, 0, 1,
-0.8450971, 0.2566765, -0.8196566, 0.7921569, 1, 0, 1,
-0.8447275, -0.2732854, -1.185794, 0.7882353, 1, 0, 1,
-0.8378671, -0.8177518, -2.911619, 0.7803922, 1, 0, 1,
-0.8360282, -0.4805656, -2.698831, 0.7764706, 1, 0, 1,
-0.8315229, 0.319994, -1.013715, 0.7686275, 1, 0, 1,
-0.8314938, -1.319761, -3.377121, 0.7647059, 1, 0, 1,
-0.8305176, -0.3618858, -2.171289, 0.7568628, 1, 0, 1,
-0.8299313, -1.045615, -3.6241, 0.7529412, 1, 0, 1,
-0.8295011, 1.403518, 0.4424558, 0.7450981, 1, 0, 1,
-0.8260748, 0.1134384, -1.525801, 0.7411765, 1, 0, 1,
-0.8257678, 1.128169, -2.692344, 0.7333333, 1, 0, 1,
-0.8182006, 1.379416, -0.1636425, 0.7294118, 1, 0, 1,
-0.8158175, -2.203382, -3.586557, 0.7215686, 1, 0, 1,
-0.811295, 1.704592, -1.643447, 0.7176471, 1, 0, 1,
-0.8080159, -0.4845171, -2.668793, 0.7098039, 1, 0, 1,
-0.8051624, -1.113777, -2.030202, 0.7058824, 1, 0, 1,
-0.7992616, -0.9578266, -1.118872, 0.6980392, 1, 0, 1,
-0.7819009, -0.06417492, -0.9564348, 0.6901961, 1, 0, 1,
-0.7801923, 1.839611, -1.038015, 0.6862745, 1, 0, 1,
-0.7787593, -0.7329659, -3.383126, 0.6784314, 1, 0, 1,
-0.778627, -0.3668137, -2.732897, 0.6745098, 1, 0, 1,
-0.7781039, -2.203891, -4.35462, 0.6666667, 1, 0, 1,
-0.7775404, 0.6953192, 0.2901122, 0.6627451, 1, 0, 1,
-0.7771792, -0.3082953, -1.332687, 0.654902, 1, 0, 1,
-0.776854, 0.9325942, -0.036821, 0.6509804, 1, 0, 1,
-0.7727449, 0.1691485, -4.236565, 0.6431373, 1, 0, 1,
-0.7673415, 0.7584414, -0.5448564, 0.6392157, 1, 0, 1,
-0.7630404, -0.2776059, -0.982469, 0.6313726, 1, 0, 1,
-0.7627057, 1.274947, -0.6129753, 0.627451, 1, 0, 1,
-0.7622431, -0.4772136, -1.486788, 0.6196079, 1, 0, 1,
-0.7611374, 1.003086, 0.06940729, 0.6156863, 1, 0, 1,
-0.7591686, -1.25251, -2.556392, 0.6078432, 1, 0, 1,
-0.7537344, 0.2942472, -3.383231, 0.6039216, 1, 0, 1,
-0.7499869, 0.02060137, -2.378583, 0.5960785, 1, 0, 1,
-0.745428, -0.1115017, -0.4632737, 0.5882353, 1, 0, 1,
-0.744803, 0.6278208, -1.284551, 0.5843138, 1, 0, 1,
-0.741045, 0.6279539, -1.540525, 0.5764706, 1, 0, 1,
-0.7403221, 0.1133794, -1.948228, 0.572549, 1, 0, 1,
-0.7391476, -0.6403762, -5.638133, 0.5647059, 1, 0, 1,
-0.7348416, -0.1411747, -2.323943, 0.5607843, 1, 0, 1,
-0.7240958, -0.330036, -2.417608, 0.5529412, 1, 0, 1,
-0.7231493, -0.7515675, -2.193911, 0.5490196, 1, 0, 1,
-0.7216221, -2.116177, -1.864834, 0.5411765, 1, 0, 1,
-0.7207977, 0.5705283, -1.870212, 0.5372549, 1, 0, 1,
-0.719741, 0.7914714, -2.141825, 0.5294118, 1, 0, 1,
-0.718571, -2.002541, -2.146518, 0.5254902, 1, 0, 1,
-0.7183838, 0.01793766, -1.419575, 0.5176471, 1, 0, 1,
-0.7170727, 0.8681539, -1.059488, 0.5137255, 1, 0, 1,
-0.7084289, -0.5119537, -2.916345, 0.5058824, 1, 0, 1,
-0.7070628, -0.456573, -0.3018996, 0.5019608, 1, 0, 1,
-0.7067284, -0.1009199, -0.9965749, 0.4941176, 1, 0, 1,
-0.7016275, 1.464098, 1.695765, 0.4862745, 1, 0, 1,
-0.700392, 0.05973575, -1.267939, 0.4823529, 1, 0, 1,
-0.6933097, -0.3242415, -1.482823, 0.4745098, 1, 0, 1,
-0.6878825, -0.5962678, -1.330095, 0.4705882, 1, 0, 1,
-0.6732451, 0.2286614, -2.629155, 0.4627451, 1, 0, 1,
-0.6678331, 0.4019056, -1.314631, 0.4588235, 1, 0, 1,
-0.6641887, -0.2325408, -1.307991, 0.4509804, 1, 0, 1,
-0.6629318, 0.3235081, -0.01890541, 0.4470588, 1, 0, 1,
-0.6625762, -0.08168869, -2.084396, 0.4392157, 1, 0, 1,
-0.6596389, 0.6333645, -1.599733, 0.4352941, 1, 0, 1,
-0.6591716, -0.6906316, -2.853119, 0.427451, 1, 0, 1,
-0.658901, 1.476704, -0.7274703, 0.4235294, 1, 0, 1,
-0.6578655, -0.6112304, -2.004358, 0.4156863, 1, 0, 1,
-0.646648, -1.296755, 0.1953617, 0.4117647, 1, 0, 1,
-0.641598, 0.1937648, -1.373591, 0.4039216, 1, 0, 1,
-0.6389404, 1.047541, -1.570254, 0.3960784, 1, 0, 1,
-0.6381813, 1.107804, 0.2357517, 0.3921569, 1, 0, 1,
-0.6366109, 0.06798008, -3.444507, 0.3843137, 1, 0, 1,
-0.6333996, 0.3821467, -0.9106652, 0.3803922, 1, 0, 1,
-0.631483, 1.754266, 1.390277, 0.372549, 1, 0, 1,
-0.6297479, -0.6488324, -0.5687873, 0.3686275, 1, 0, 1,
-0.6296254, 0.2886034, 0.6246612, 0.3607843, 1, 0, 1,
-0.6294827, -0.3348967, -2.709441, 0.3568628, 1, 0, 1,
-0.6290007, -0.1801355, -2.04206, 0.3490196, 1, 0, 1,
-0.6273753, -0.5852688, -3.228429, 0.345098, 1, 0, 1,
-0.6214418, 0.3653459, -1.691743, 0.3372549, 1, 0, 1,
-0.6210969, -0.5991857, -2.232355, 0.3333333, 1, 0, 1,
-0.6128675, 0.9688141, -2.203891, 0.3254902, 1, 0, 1,
-0.6127978, 0.1295442, -1.903234, 0.3215686, 1, 0, 1,
-0.6079081, 0.7189149, -0.8395333, 0.3137255, 1, 0, 1,
-0.6053742, -0.5683909, -1.878278, 0.3098039, 1, 0, 1,
-0.604331, 0.04408439, -1.449475, 0.3019608, 1, 0, 1,
-0.6030533, 1.725632, 0.7675318, 0.2941177, 1, 0, 1,
-0.6011947, 1.340581, 0.8027092, 0.2901961, 1, 0, 1,
-0.6006143, -0.2220539, -3.059012, 0.282353, 1, 0, 1,
-0.5993412, -0.8514737, -3.012284, 0.2784314, 1, 0, 1,
-0.5972137, -0.8340689, -2.36099, 0.2705882, 1, 0, 1,
-0.5904704, 0.3284619, -1.369934, 0.2666667, 1, 0, 1,
-0.5837747, 1.488787, -2.022534, 0.2588235, 1, 0, 1,
-0.5827145, -0.5911177, -3.444288, 0.254902, 1, 0, 1,
-0.5742257, -0.7589775, -1.738027, 0.2470588, 1, 0, 1,
-0.5720733, 2.507108, -3.314973, 0.2431373, 1, 0, 1,
-0.5684869, 0.5645, -1.655126, 0.2352941, 1, 0, 1,
-0.5615627, -0.5545391, -2.087994, 0.2313726, 1, 0, 1,
-0.5568252, -0.04366117, -1.282198, 0.2235294, 1, 0, 1,
-0.5564114, -0.5315783, -2.189874, 0.2196078, 1, 0, 1,
-0.5540405, 1.524579, -0.19796, 0.2117647, 1, 0, 1,
-0.5536731, -1.645666, -2.822259, 0.2078431, 1, 0, 1,
-0.5530432, -0.002953614, -1.738889, 0.2, 1, 0, 1,
-0.5525446, -0.8024309, -3.071999, 0.1921569, 1, 0, 1,
-0.5523254, 0.7319351, -0.9415799, 0.1882353, 1, 0, 1,
-0.5506541, 0.0897067, -2.653883, 0.1803922, 1, 0, 1,
-0.544117, -1.269891, -4.548918, 0.1764706, 1, 0, 1,
-0.5392288, 0.7348643, 1.59608, 0.1686275, 1, 0, 1,
-0.5387787, 1.308563, 0.6856862, 0.1647059, 1, 0, 1,
-0.5326248, -0.3029975, -2.797127, 0.1568628, 1, 0, 1,
-0.5293359, 0.3612658, -3.524292, 0.1529412, 1, 0, 1,
-0.5291404, 0.1847244, -1.59746, 0.145098, 1, 0, 1,
-0.5249914, -0.1404503, -1.42611, 0.1411765, 1, 0, 1,
-0.5200134, 0.06464202, -1.515022, 0.1333333, 1, 0, 1,
-0.5184795, 0.7569579, -2.947182, 0.1294118, 1, 0, 1,
-0.514985, 0.654605, -1.522872, 0.1215686, 1, 0, 1,
-0.5140231, -0.06512014, -3.466694, 0.1176471, 1, 0, 1,
-0.5137798, -0.6246717, -4.549043, 0.1098039, 1, 0, 1,
-0.512409, 0.9045429, -0.6966065, 0.1058824, 1, 0, 1,
-0.5095162, 0.1408172, 0.3909587, 0.09803922, 1, 0, 1,
-0.5030932, -0.855618, -2.800819, 0.09019608, 1, 0, 1,
-0.50265, -0.4327106, -2.236152, 0.08627451, 1, 0, 1,
-0.4983229, -0.1410031, -1.270354, 0.07843138, 1, 0, 1,
-0.4901802, -0.6396877, -1.976689, 0.07450981, 1, 0, 1,
-0.4761121, 1.106343, -1.524056, 0.06666667, 1, 0, 1,
-0.4758096, 1.000733, -1.149585, 0.0627451, 1, 0, 1,
-0.4750422, 0.3651304, -2.032183, 0.05490196, 1, 0, 1,
-0.4729362, -0.3475198, -1.64183, 0.05098039, 1, 0, 1,
-0.465091, -0.2809428, -2.703174, 0.04313726, 1, 0, 1,
-0.4606495, -2.25482, -3.550286, 0.03921569, 1, 0, 1,
-0.4558718, -0.5135989, 0.1089892, 0.03137255, 1, 0, 1,
-0.4524643, 0.05042048, -1.27988, 0.02745098, 1, 0, 1,
-0.4511401, 0.4210092, -1.822436, 0.01960784, 1, 0, 1,
-0.4475985, -1.583235, -2.139158, 0.01568628, 1, 0, 1,
-0.4443354, -0.754452, -3.510401, 0.007843138, 1, 0, 1,
-0.4418018, -1.096931, -1.642227, 0.003921569, 1, 0, 1,
-0.4380605, -1.265067, -2.174275, 0, 1, 0.003921569, 1,
-0.436767, 0.2537962, -1.902025, 0, 1, 0.01176471, 1,
-0.4361307, -0.8083627, -2.408869, 0, 1, 0.01568628, 1,
-0.4321879, 1.011131, 0.4466451, 0, 1, 0.02352941, 1,
-0.4256488, 0.03132347, -1.114648, 0, 1, 0.02745098, 1,
-0.4252803, 1.492263, -0.5383936, 0, 1, 0.03529412, 1,
-0.4207262, -0.2640128, -1.28936, 0, 1, 0.03921569, 1,
-0.420593, 0.3085711, -1.614667, 0, 1, 0.04705882, 1,
-0.415148, 0.5779497, 0.2870266, 0, 1, 0.05098039, 1,
-0.4136874, -1.132529, -2.85458, 0, 1, 0.05882353, 1,
-0.4123918, -2.213965, -2.799173, 0, 1, 0.0627451, 1,
-0.410345, 0.5684931, -1.839005, 0, 1, 0.07058824, 1,
-0.4090701, -2.254514, -2.578125, 0, 1, 0.07450981, 1,
-0.4079534, -1.778658, -2.457598, 0, 1, 0.08235294, 1,
-0.4056884, -1.440826, -2.850201, 0, 1, 0.08627451, 1,
-0.4050188, -0.07184792, -3.848268, 0, 1, 0.09411765, 1,
-0.4045723, -0.9477402, -3.229871, 0, 1, 0.1019608, 1,
-0.4021724, 0.6496713, 0.2080427, 0, 1, 0.1058824, 1,
-0.3954941, 1.4688, 2.086816, 0, 1, 0.1137255, 1,
-0.395166, -0.6340049, -2.798873, 0, 1, 0.1176471, 1,
-0.395059, -1.36507, -2.73462, 0, 1, 0.1254902, 1,
-0.391566, 0.6854481, -1.42543, 0, 1, 0.1294118, 1,
-0.38475, 1.084855, 0.6970614, 0, 1, 0.1372549, 1,
-0.383522, 0.6764928, 0.9584536, 0, 1, 0.1411765, 1,
-0.3812058, 0.1214581, -0.2631032, 0, 1, 0.1490196, 1,
-0.377477, -0.1459627, -2.391775, 0, 1, 0.1529412, 1,
-0.3691887, 0.1916951, -1.718853, 0, 1, 0.1607843, 1,
-0.3685792, 0.3254082, 0.3681415, 0, 1, 0.1647059, 1,
-0.3669049, -0.5160767, -0.8063261, 0, 1, 0.172549, 1,
-0.366474, -1.978404, -2.844809, 0, 1, 0.1764706, 1,
-0.3617496, 1.383048, -0.7607878, 0, 1, 0.1843137, 1,
-0.359918, 1.027764, -0.7430241, 0, 1, 0.1882353, 1,
-0.3590589, 1.374274, -1.116773, 0, 1, 0.1960784, 1,
-0.3572858, 1.845238, 0.2519636, 0, 1, 0.2039216, 1,
-0.356484, -3.111084, -3.068146, 0, 1, 0.2078431, 1,
-0.3506378, -0.729736, -2.702532, 0, 1, 0.2156863, 1,
-0.3442217, -0.2602595, -2.683007, 0, 1, 0.2196078, 1,
-0.3403488, -0.845566, -5.005569, 0, 1, 0.227451, 1,
-0.339975, -0.4896558, -2.245306, 0, 1, 0.2313726, 1,
-0.3347708, -1.327275, -3.11494, 0, 1, 0.2392157, 1,
-0.3342433, 0.3640772, -1.751108, 0, 1, 0.2431373, 1,
-0.3328822, -0.08061977, -1.732296, 0, 1, 0.2509804, 1,
-0.330594, 0.3145199, -1.833207, 0, 1, 0.254902, 1,
-0.325637, -1.309818, -3.491671, 0, 1, 0.2627451, 1,
-0.3240412, 1.349385, -0.7770265, 0, 1, 0.2666667, 1,
-0.3226559, 0.8292102, -2.915969, 0, 1, 0.2745098, 1,
-0.3226018, -0.3661794, -2.09793, 0, 1, 0.2784314, 1,
-0.3156923, 2.749311, -0.2661489, 0, 1, 0.2862745, 1,
-0.3142947, -2.477806, -1.619619, 0, 1, 0.2901961, 1,
-0.3127357, -0.06120032, -2.543899, 0, 1, 0.2980392, 1,
-0.3101005, -1.557754, -2.315321, 0, 1, 0.3058824, 1,
-0.3093003, -0.08249034, -1.855002, 0, 1, 0.3098039, 1,
-0.3079358, -1.353369, -2.919346, 0, 1, 0.3176471, 1,
-0.3065864, 0.2366312, 0.4009337, 0, 1, 0.3215686, 1,
-0.304275, -0.3805376, -3.533783, 0, 1, 0.3294118, 1,
-0.3024517, -1.099165, -3.231598, 0, 1, 0.3333333, 1,
-0.3009854, 0.0888019, -2.224351, 0, 1, 0.3411765, 1,
-0.2987064, -0.5016593, -3.34326, 0, 1, 0.345098, 1,
-0.2933123, 0.05840021, -0.3639877, 0, 1, 0.3529412, 1,
-0.292824, 0.5868431, -0.2729875, 0, 1, 0.3568628, 1,
-0.2918648, -0.2084202, -3.135001, 0, 1, 0.3647059, 1,
-0.2905047, -0.8464992, -2.974173, 0, 1, 0.3686275, 1,
-0.2790877, 0.8926412, -1.35005, 0, 1, 0.3764706, 1,
-0.2711769, -0.5200685, -3.74031, 0, 1, 0.3803922, 1,
-0.2655444, -0.7261452, -3.413303, 0, 1, 0.3882353, 1,
-0.2639582, -0.9780396, -2.757183, 0, 1, 0.3921569, 1,
-0.2627937, -1.184948, -3.229037, 0, 1, 0.4, 1,
-0.258571, 1.138033, 0.8443915, 0, 1, 0.4078431, 1,
-0.2545819, 1.111774, 0.1528223, 0, 1, 0.4117647, 1,
-0.2523832, -0.0555396, -0.2574065, 0, 1, 0.4196078, 1,
-0.2499134, 0.5218987, -2.234634, 0, 1, 0.4235294, 1,
-0.2451883, 1.179774, 0.9094793, 0, 1, 0.4313726, 1,
-0.2450623, 0.07693474, -1.019198, 0, 1, 0.4352941, 1,
-0.2450437, 0.8723199, -0.792407, 0, 1, 0.4431373, 1,
-0.2417097, 1.915371, -0.5570133, 0, 1, 0.4470588, 1,
-0.2372382, -0.9810746, -3.091213, 0, 1, 0.454902, 1,
-0.2342479, 0.5748312, -1.024358, 0, 1, 0.4588235, 1,
-0.2309694, 1.914721, -0.6891787, 0, 1, 0.4666667, 1,
-0.2304595, 0.04022147, -1.247234, 0, 1, 0.4705882, 1,
-0.2296862, -0.669407, -0.2915769, 0, 1, 0.4784314, 1,
-0.2285474, -1.578529, -2.508884, 0, 1, 0.4823529, 1,
-0.2245094, -1.669452, -4.001023, 0, 1, 0.4901961, 1,
-0.2139382, 0.188755, 0.1569734, 0, 1, 0.4941176, 1,
-0.2077342, 0.3524924, 1.073282, 0, 1, 0.5019608, 1,
-0.2077056, -0.1789238, -2.88681, 0, 1, 0.509804, 1,
-0.2076613, -0.2860161, -2.247422, 0, 1, 0.5137255, 1,
-0.2072918, 1.396333, -0.1095488, 0, 1, 0.5215687, 1,
-0.2068097, 0.1100541, -1.495892, 0, 1, 0.5254902, 1,
-0.2040094, 0.1544986, -1.721789, 0, 1, 0.5333334, 1,
-0.2008196, 1.539711, -1.273249, 0, 1, 0.5372549, 1,
-0.1970698, -0.5861949, -2.381668, 0, 1, 0.5450981, 1,
-0.1956176, 0.1135132, -1.85313, 0, 1, 0.5490196, 1,
-0.1899056, 0.08199153, 0.68294, 0, 1, 0.5568628, 1,
-0.1891069, 0.4581257, -0.8386448, 0, 1, 0.5607843, 1,
-0.1860533, -0.3270237, -0.9386486, 0, 1, 0.5686275, 1,
-0.1832388, -0.09758999, -2.459541, 0, 1, 0.572549, 1,
-0.1831661, -1.752073, -1.424235, 0, 1, 0.5803922, 1,
-0.1822569, -1.166156, -2.994442, 0, 1, 0.5843138, 1,
-0.1804053, -0.6482201, -2.799938, 0, 1, 0.5921569, 1,
-0.1779463, -0.3619886, -2.048153, 0, 1, 0.5960785, 1,
-0.177369, 0.9986148, 0.9984704, 0, 1, 0.6039216, 1,
-0.170909, -0.1799547, -2.561186, 0, 1, 0.6117647, 1,
-0.1626716, 2.084331, -0.495931, 0, 1, 0.6156863, 1,
-0.1621073, 1.11323, 0.1009607, 0, 1, 0.6235294, 1,
-0.1570889, -1.836861, -2.710719, 0, 1, 0.627451, 1,
-0.1522289, 1.077793, -0.003971931, 0, 1, 0.6352941, 1,
-0.1499798, 1.460359, -0.3239959, 0, 1, 0.6392157, 1,
-0.1464801, -1.046589, -3.116332, 0, 1, 0.6470588, 1,
-0.1460298, 0.4290763, -2.095292, 0, 1, 0.6509804, 1,
-0.1447648, -1.180508, -1.104316, 0, 1, 0.6588235, 1,
-0.1446453, -1.022637, -2.689098, 0, 1, 0.6627451, 1,
-0.1441757, -0.6683363, -2.34986, 0, 1, 0.6705883, 1,
-0.1427383, -1.271358, -3.094853, 0, 1, 0.6745098, 1,
-0.1420257, -0.06415269, -2.965492, 0, 1, 0.682353, 1,
-0.131354, -0.2419788, -2.085982, 0, 1, 0.6862745, 1,
-0.1285922, 0.6585669, -1.199479, 0, 1, 0.6941177, 1,
-0.1268008, -0.8305031, -0.9061809, 0, 1, 0.7019608, 1,
-0.1245568, 0.631184, -0.3643977, 0, 1, 0.7058824, 1,
-0.1245019, -0.02586145, -3.570998, 0, 1, 0.7137255, 1,
-0.1188124, 1.733352, -0.5545211, 0, 1, 0.7176471, 1,
-0.1164576, 1.021787, -0.1053029, 0, 1, 0.7254902, 1,
-0.115244, -1.542817, -2.702306, 0, 1, 0.7294118, 1,
-0.1102956, 0.5729352, -1.026491, 0, 1, 0.7372549, 1,
-0.09607477, -0.9101604, -5.394353, 0, 1, 0.7411765, 1,
-0.0949462, 0.7410914, 0.1549821, 0, 1, 0.7490196, 1,
-0.08957004, 0.4411743, -0.6528931, 0, 1, 0.7529412, 1,
-0.08325779, 0.8437757, -0.8904318, 0, 1, 0.7607843, 1,
-0.07999405, 0.6645514, -0.1755659, 0, 1, 0.7647059, 1,
-0.07802342, 0.06680657, -1.00664, 0, 1, 0.772549, 1,
-0.07000275, -0.02653521, -2.10079, 0, 1, 0.7764706, 1,
-0.06420455, -0.5584941, -4.310215, 0, 1, 0.7843137, 1,
-0.06316842, 0.2750721, -1.401399, 0, 1, 0.7882353, 1,
-0.06194797, 1.638904, -1.058068, 0, 1, 0.7960784, 1,
-0.06003486, -1.108283, -2.884602, 0, 1, 0.8039216, 1,
-0.05830675, -1.320402, -3.686453, 0, 1, 0.8078431, 1,
-0.05773666, 1.096005, -1.187868, 0, 1, 0.8156863, 1,
-0.05702612, -0.733609, -3.019263, 0, 1, 0.8196079, 1,
-0.0535629, 2.595596, 1.352463, 0, 1, 0.827451, 1,
-0.05055514, 0.5535651, -0.9406344, 0, 1, 0.8313726, 1,
-0.05017062, -1.194143, -4.134812, 0, 1, 0.8392157, 1,
-0.0434651, -0.3287291, -2.382571, 0, 1, 0.8431373, 1,
-0.04239298, -1.190369, -2.872871, 0, 1, 0.8509804, 1,
-0.04086098, -0.7381347, -2.854582, 0, 1, 0.854902, 1,
-0.0402756, -0.1925376, -3.165461, 0, 1, 0.8627451, 1,
-0.03773408, 0.2320232, 0.2079246, 0, 1, 0.8666667, 1,
-0.03281736, 0.6467698, 0.02420905, 0, 1, 0.8745098, 1,
-0.03168889, 0.8998811, 0.7000805, 0, 1, 0.8784314, 1,
-0.02996155, 1.080585, 1.190041, 0, 1, 0.8862745, 1,
-0.02568695, 0.4391029, -1.855533, 0, 1, 0.8901961, 1,
-0.02516652, 0.6694874, -1.60436, 0, 1, 0.8980392, 1,
-0.02409019, 1.61111, -3.489817, 0, 1, 0.9058824, 1,
-0.01522291, -0.1614847, -3.510383, 0, 1, 0.9098039, 1,
-0.01161981, -0.1945291, -2.745698, 0, 1, 0.9176471, 1,
-0.008171019, -0.7100126, -2.90316, 0, 1, 0.9215686, 1,
-0.00775603, -1.775566, -2.785072, 0, 1, 0.9294118, 1,
-0.007497638, -0.5994582, -3.510782, 0, 1, 0.9333333, 1,
-0.006090803, 0.2647848, 0.8048581, 0, 1, 0.9411765, 1,
-0.005439962, 0.7151279, -1.875402, 0, 1, 0.945098, 1,
-0.005344209, 1.456392, -1.53113, 0, 1, 0.9529412, 1,
-0.002733028, 0.1154318, -1.297021, 0, 1, 0.9568627, 1,
0.002049486, 1.038701, -0.06522989, 0, 1, 0.9647059, 1,
0.003951279, 1.031674, -0.1060538, 0, 1, 0.9686275, 1,
0.006632654, -0.5439526, 4.454639, 0, 1, 0.9764706, 1,
0.01136524, -0.3475116, 5.964311, 0, 1, 0.9803922, 1,
0.01420192, 0.04153315, -1.092772, 0, 1, 0.9882353, 1,
0.01714309, 0.1290427, -0.2459226, 0, 1, 0.9921569, 1,
0.01797334, 0.2786083, -0.3941284, 0, 1, 1, 1,
0.02294676, 0.8112382, -0.3951519, 0, 0.9921569, 1, 1,
0.02570552, -1.204098, 4.414993, 0, 0.9882353, 1, 1,
0.03025425, 0.9593799, -0.6096082, 0, 0.9803922, 1, 1,
0.03031235, 0.07550635, 2.893772, 0, 0.9764706, 1, 1,
0.03080848, -0.4691477, 3.498778, 0, 0.9686275, 1, 1,
0.03557798, 2.943912, -0.4999444, 0, 0.9647059, 1, 1,
0.03665315, -0.8146641, 2.038776, 0, 0.9568627, 1, 1,
0.04006754, -0.03095704, 1.98465, 0, 0.9529412, 1, 1,
0.04008928, -0.9592762, 3.183555, 0, 0.945098, 1, 1,
0.04383541, -0.1277562, 4.179825, 0, 0.9411765, 1, 1,
0.04431268, -0.7071463, 5.234333, 0, 0.9333333, 1, 1,
0.04434278, -0.492212, 3.279628, 0, 0.9294118, 1, 1,
0.04531991, -0.6423891, 2.679841, 0, 0.9215686, 1, 1,
0.04717856, 0.01346361, 0.3151936, 0, 0.9176471, 1, 1,
0.04861548, 0.545611, 2.643871, 0, 0.9098039, 1, 1,
0.05920982, -0.3769343, 3.281954, 0, 0.9058824, 1, 1,
0.05959249, 0.1219653, 1.594809, 0, 0.8980392, 1, 1,
0.06157193, 1.842771, -0.5228827, 0, 0.8901961, 1, 1,
0.06370889, 0.4588954, 0.2050956, 0, 0.8862745, 1, 1,
0.06754232, 1.78155, -0.7212378, 0, 0.8784314, 1, 1,
0.06948979, -1.286779, 2.557162, 0, 0.8745098, 1, 1,
0.07157213, 0.4016135, 1.773032, 0, 0.8666667, 1, 1,
0.07341325, 0.5877133, -0.3498358, 0, 0.8627451, 1, 1,
0.07486453, -0.1535809, 1.686235, 0, 0.854902, 1, 1,
0.0757523, -0.5949577, 4.869636, 0, 0.8509804, 1, 1,
0.07660017, -0.481315, 2.171856, 0, 0.8431373, 1, 1,
0.08202752, 1.430308, -0.9779229, 0, 0.8392157, 1, 1,
0.08893516, 0.8556468, -1.409166, 0, 0.8313726, 1, 1,
0.09658635, 0.2430865, 0.3932135, 0, 0.827451, 1, 1,
0.09865878, 0.07733026, 0.2317748, 0, 0.8196079, 1, 1,
0.1035869, -0.2748415, 3.28694, 0, 0.8156863, 1, 1,
0.1039656, 0.4394318, 0.3677991, 0, 0.8078431, 1, 1,
0.1052795, -1.038308, 2.298017, 0, 0.8039216, 1, 1,
0.1108029, -0.7480376, 3.197808, 0, 0.7960784, 1, 1,
0.1114383, -1.567547, 5.490111, 0, 0.7882353, 1, 1,
0.1143781, -0.007684093, 2.153372, 0, 0.7843137, 1, 1,
0.1150942, 1.386976, -0.1758002, 0, 0.7764706, 1, 1,
0.1208196, -0.2495111, 2.274289, 0, 0.772549, 1, 1,
0.1227979, -0.5554036, 3.172308, 0, 0.7647059, 1, 1,
0.1371378, -0.03914914, 1.573721, 0, 0.7607843, 1, 1,
0.1376344, -0.5772946, 3.716055, 0, 0.7529412, 1, 1,
0.1395788, 1.681216, -0.4877256, 0, 0.7490196, 1, 1,
0.1415957, -2.050975, 4.487426, 0, 0.7411765, 1, 1,
0.1427121, 0.2987164, 0.362747, 0, 0.7372549, 1, 1,
0.1444909, 0.1501175, -1.104295, 0, 0.7294118, 1, 1,
0.1447543, 0.04832274, 1.853975, 0, 0.7254902, 1, 1,
0.1456568, -0.9574894, 1.145585, 0, 0.7176471, 1, 1,
0.1457084, 0.07721903, 0.0604586, 0, 0.7137255, 1, 1,
0.1470056, 0.495722, 0.2655267, 0, 0.7058824, 1, 1,
0.152124, -0.3854392, 2.388817, 0, 0.6980392, 1, 1,
0.1554403, -1.423955, 2.54163, 0, 0.6941177, 1, 1,
0.1652229, 0.4939996, 0.4687218, 0, 0.6862745, 1, 1,
0.1652565, 0.3801465, 0.6120993, 0, 0.682353, 1, 1,
0.1667666, -1.098805, 3.280258, 0, 0.6745098, 1, 1,
0.1682739, -1.183904, 2.522596, 0, 0.6705883, 1, 1,
0.1690841, -1.872425, 1.903345, 0, 0.6627451, 1, 1,
0.1721674, -0.9201652, 1.595191, 0, 0.6588235, 1, 1,
0.1762782, -0.0676955, 1.039303, 0, 0.6509804, 1, 1,
0.1785911, -1.834418, 4.03889, 0, 0.6470588, 1, 1,
0.1832079, -0.5157833, 2.987094, 0, 0.6392157, 1, 1,
0.1852576, -0.5924477, 2.451876, 0, 0.6352941, 1, 1,
0.1853542, 0.06745471, -0.8468012, 0, 0.627451, 1, 1,
0.1855251, -0.8930454, 5.02528, 0, 0.6235294, 1, 1,
0.1865571, 0.8040569, -1.45758, 0, 0.6156863, 1, 1,
0.1952223, -0.005832289, 1.679467, 0, 0.6117647, 1, 1,
0.1993362, -0.1971473, 2.174972, 0, 0.6039216, 1, 1,
0.2005954, -0.1782437, 3.041793, 0, 0.5960785, 1, 1,
0.2056349, -0.1948632, 1.959607, 0, 0.5921569, 1, 1,
0.2109074, 0.8243834, 2.622401, 0, 0.5843138, 1, 1,
0.2114359, 0.3563449, -0.3792875, 0, 0.5803922, 1, 1,
0.2205776, -0.4726579, 3.34033, 0, 0.572549, 1, 1,
0.2221765, -0.4147993, 1.356273, 0, 0.5686275, 1, 1,
0.2312484, -2.157684, 3.214977, 0, 0.5607843, 1, 1,
0.235195, -1.532024, 0.4307479, 0, 0.5568628, 1, 1,
0.2354371, 0.302746, -0.1430382, 0, 0.5490196, 1, 1,
0.2392326, -0.9939583, 3.06101, 0, 0.5450981, 1, 1,
0.2400493, -0.5638195, 4.48625, 0, 0.5372549, 1, 1,
0.2411405, 0.3543875, 0.6501121, 0, 0.5333334, 1, 1,
0.242033, -0.6520492, 4.104469, 0, 0.5254902, 1, 1,
0.2497945, -1.360898, 3.884822, 0, 0.5215687, 1, 1,
0.2501608, 1.031476, 1.692894, 0, 0.5137255, 1, 1,
0.2510867, 0.7883658, 0.298783, 0, 0.509804, 1, 1,
0.2573759, 0.6329768, 0.05926989, 0, 0.5019608, 1, 1,
0.2597766, -1.610174, 2.92786, 0, 0.4941176, 1, 1,
0.2600565, -1.954489, 2.458829, 0, 0.4901961, 1, 1,
0.2602325, 0.6730728, 0.02900342, 0, 0.4823529, 1, 1,
0.2626249, -0.03241549, 0.2861767, 0, 0.4784314, 1, 1,
0.262789, -0.2290916, 1.518334, 0, 0.4705882, 1, 1,
0.2646849, 0.9645482, 0.24789, 0, 0.4666667, 1, 1,
0.265237, -0.02464991, 1.796635, 0, 0.4588235, 1, 1,
0.2704203, -0.5679795, 0.6554052, 0, 0.454902, 1, 1,
0.2746578, 0.1795534, 0.5245878, 0, 0.4470588, 1, 1,
0.276751, -0.2930873, 1.813598, 0, 0.4431373, 1, 1,
0.2781524, -0.06247107, 1.146617, 0, 0.4352941, 1, 1,
0.2802569, 0.1594795, 1.372707, 0, 0.4313726, 1, 1,
0.2847884, -0.6617433, 0.6330893, 0, 0.4235294, 1, 1,
0.2912819, -0.04118241, 1.26768, 0, 0.4196078, 1, 1,
0.2946955, 1.025942, -0.2880228, 0, 0.4117647, 1, 1,
0.2951781, 1.081242, -0.3137179, 0, 0.4078431, 1, 1,
0.2980639, 1.293533, 0.8744839, 0, 0.4, 1, 1,
0.3009974, 1.062308, -0.0654776, 0, 0.3921569, 1, 1,
0.3065175, 0.7958505, 1.051083, 0, 0.3882353, 1, 1,
0.3089283, -0.5886073, 2.959373, 0, 0.3803922, 1, 1,
0.3111496, -0.4581269, 2.32484, 0, 0.3764706, 1, 1,
0.3119349, 0.3791543, 0.7860844, 0, 0.3686275, 1, 1,
0.3132117, -3.139734, 2.587077, 0, 0.3647059, 1, 1,
0.3149932, 0.04142346, 0.9383771, 0, 0.3568628, 1, 1,
0.3176849, -1.353687, 2.634706, 0, 0.3529412, 1, 1,
0.3191563, 0.6825172, 0.3326064, 0, 0.345098, 1, 1,
0.3247479, -0.287455, 3.265139, 0, 0.3411765, 1, 1,
0.3267366, -1.27275, 3.893049, 0, 0.3333333, 1, 1,
0.3268648, -0.4427906, 3.319767, 0, 0.3294118, 1, 1,
0.3307019, 1.003751, 1.300472, 0, 0.3215686, 1, 1,
0.3324395, -1.690123, 2.932805, 0, 0.3176471, 1, 1,
0.3333753, -1.876394, 3.886137, 0, 0.3098039, 1, 1,
0.335898, -0.6081474, 1.353847, 0, 0.3058824, 1, 1,
0.3395092, 0.465125, 0.9802049, 0, 0.2980392, 1, 1,
0.3427822, 1.481448, 2.576685, 0, 0.2901961, 1, 1,
0.3446324, 0.1296815, -0.2011403, 0, 0.2862745, 1, 1,
0.3468582, -0.5779063, 1.912942, 0, 0.2784314, 1, 1,
0.3479516, -1.679927, 2.672332, 0, 0.2745098, 1, 1,
0.3488002, -0.2959647, 4.052548, 0, 0.2666667, 1, 1,
0.3513041, -0.1900811, 1.659779, 0, 0.2627451, 1, 1,
0.3520609, -1.046254, 3.061187, 0, 0.254902, 1, 1,
0.3544404, -0.7780855, 1.347124, 0, 0.2509804, 1, 1,
0.3576505, -0.5353319, 1.897721, 0, 0.2431373, 1, 1,
0.3636228, -1.006049, 4.759537, 0, 0.2392157, 1, 1,
0.3650523, 0.4893879, -0.3168524, 0, 0.2313726, 1, 1,
0.36601, -0.7884622, 3.365288, 0, 0.227451, 1, 1,
0.3679206, -0.3748338, 2.195777, 0, 0.2196078, 1, 1,
0.3688073, -1.077999, 4.347144, 0, 0.2156863, 1, 1,
0.369086, 1.031659, -0.7400888, 0, 0.2078431, 1, 1,
0.3725062, -0.03655569, 2.084513, 0, 0.2039216, 1, 1,
0.3731317, -0.3326285, 2.924738, 0, 0.1960784, 1, 1,
0.3752485, 0.06101353, 1.044728, 0, 0.1882353, 1, 1,
0.3760618, 1.139578, 0.6654415, 0, 0.1843137, 1, 1,
0.3773642, -1.348544, 3.459419, 0, 0.1764706, 1, 1,
0.3786303, 0.8004004, -0.4085054, 0, 0.172549, 1, 1,
0.3796446, 0.1436206, 0.5440199, 0, 0.1647059, 1, 1,
0.3797417, -1.063949, 4.171245, 0, 0.1607843, 1, 1,
0.3821378, 0.9830667, -0.6656181, 0, 0.1529412, 1, 1,
0.3842634, -1.359614, 2.155509, 0, 0.1490196, 1, 1,
0.3891782, 0.9969712, -0.4530606, 0, 0.1411765, 1, 1,
0.3899275, 0.6022812, 1.240477, 0, 0.1372549, 1, 1,
0.3910407, 0.4537897, -0.4148476, 0, 0.1294118, 1, 1,
0.3972133, -2.333769, 3.785424, 0, 0.1254902, 1, 1,
0.3995244, -0.5903638, 2.539204, 0, 0.1176471, 1, 1,
0.4020259, 1.364824, 0.7220274, 0, 0.1137255, 1, 1,
0.4028003, 1.28163, 0.2066109, 0, 0.1058824, 1, 1,
0.4030426, -0.5676623, 0.8461618, 0, 0.09803922, 1, 1,
0.4038122, -1.427167, 1.737167, 0, 0.09411765, 1, 1,
0.4041866, -0.1105415, 0.8231786, 0, 0.08627451, 1, 1,
0.4098087, -1.751563, 3.260475, 0, 0.08235294, 1, 1,
0.4152912, 0.2206548, 1.280705, 0, 0.07450981, 1, 1,
0.4196095, 0.9668559, -0.1559558, 0, 0.07058824, 1, 1,
0.4288228, 0.5520762, 1.219661, 0, 0.0627451, 1, 1,
0.4320744, 0.4359356, 1.492597, 0, 0.05882353, 1, 1,
0.4351428, 0.5781695, 0.4665845, 0, 0.05098039, 1, 1,
0.4426575, -0.04392729, 1.198295, 0, 0.04705882, 1, 1,
0.4469598, 0.5828221, -0.2570027, 0, 0.03921569, 1, 1,
0.4536526, -1.50944, 3.076901, 0, 0.03529412, 1, 1,
0.454439, -1.047448, 1.726456, 0, 0.02745098, 1, 1,
0.455255, -0.4475925, 1.979219, 0, 0.02352941, 1, 1,
0.4588402, 0.4031025, 1.580382, 0, 0.01568628, 1, 1,
0.4594468, -1.298279, 3.386232, 0, 0.01176471, 1, 1,
0.4616831, 1.828599, -0.9434142, 0, 0.003921569, 1, 1,
0.4632259, -0.932815, 3.468566, 0.003921569, 0, 1, 1,
0.4663103, 1.00113, 0.3479299, 0.007843138, 0, 1, 1,
0.4695749, 1.89528, -1.737226, 0.01568628, 0, 1, 1,
0.4753903, 1.11987, 0.7122004, 0.01960784, 0, 1, 1,
0.4764001, 0.9265725, 0.9083828, 0.02745098, 0, 1, 1,
0.4792494, -1.291271, 1.716224, 0.03137255, 0, 1, 1,
0.481669, 0.6111379, 2.024043, 0.03921569, 0, 1, 1,
0.4844686, -2.068386, 3.110062, 0.04313726, 0, 1, 1,
0.4854283, 0.3956192, 1.277219, 0.05098039, 0, 1, 1,
0.4888837, 0.9101712, 0.9136264, 0.05490196, 0, 1, 1,
0.4924085, 0.5663847, 0.3454982, 0.0627451, 0, 1, 1,
0.4950751, -1.893401, 3.733902, 0.06666667, 0, 1, 1,
0.4953711, -1.395707, 2.4097, 0.07450981, 0, 1, 1,
0.4982631, -0.0554814, -0.2867981, 0.07843138, 0, 1, 1,
0.4995039, 0.1354896, 3.979192, 0.08627451, 0, 1, 1,
0.5028427, 0.04175814, 1.74892, 0.09019608, 0, 1, 1,
0.5028982, 0.03217053, 0.7990888, 0.09803922, 0, 1, 1,
0.503727, 0.5940973, 0.7003363, 0.1058824, 0, 1, 1,
0.5042261, -0.8506116, 2.549641, 0.1098039, 0, 1, 1,
0.5067806, 0.7041939, 2.112427, 0.1176471, 0, 1, 1,
0.5074151, -0.1796208, 2.187419, 0.1215686, 0, 1, 1,
0.5093749, -0.05969818, 2.034263, 0.1294118, 0, 1, 1,
0.510624, -0.4513507, 1.096007, 0.1333333, 0, 1, 1,
0.5190088, -2.027625, 3.994222, 0.1411765, 0, 1, 1,
0.5259198, -0.4873137, 1.873334, 0.145098, 0, 1, 1,
0.5283656, 0.7331625, 0.5998739, 0.1529412, 0, 1, 1,
0.5344814, 0.2170167, 0.4303419, 0.1568628, 0, 1, 1,
0.5369509, -1.026455, 3.731567, 0.1647059, 0, 1, 1,
0.5382521, -0.4998333, 0.3986362, 0.1686275, 0, 1, 1,
0.5402197, 0.175866, 0.7952519, 0.1764706, 0, 1, 1,
0.5422929, -1.58247, 2.352901, 0.1803922, 0, 1, 1,
0.5435383, -0.5654085, 3.099301, 0.1882353, 0, 1, 1,
0.5466576, 0.284076, 2.286903, 0.1921569, 0, 1, 1,
0.5538242, -0.6489186, 2.057104, 0.2, 0, 1, 1,
0.5588785, 0.4368535, 1.307843, 0.2078431, 0, 1, 1,
0.5642081, -1.002836, 2.967253, 0.2117647, 0, 1, 1,
0.5661297, 0.06781877, 2.191183, 0.2196078, 0, 1, 1,
0.5662357, -0.4042121, 1.914544, 0.2235294, 0, 1, 1,
0.5673719, 0.8217686, -1.709612, 0.2313726, 0, 1, 1,
0.5695828, 0.1254677, 0.6107965, 0.2352941, 0, 1, 1,
0.5697047, 0.0001767065, 0.5087047, 0.2431373, 0, 1, 1,
0.5707606, 0.6499389, 2.448601, 0.2470588, 0, 1, 1,
0.5719084, -0.4978749, 1.159557, 0.254902, 0, 1, 1,
0.5746251, 1.181239, 0.3807117, 0.2588235, 0, 1, 1,
0.5783433, -0.1442374, 2.293972, 0.2666667, 0, 1, 1,
0.5849853, -0.3169554, 2.043652, 0.2705882, 0, 1, 1,
0.5867189, -1.28506, 1.918392, 0.2784314, 0, 1, 1,
0.5892712, 1.050882, 1.720374, 0.282353, 0, 1, 1,
0.5920889, 0.09552296, 2.51436, 0.2901961, 0, 1, 1,
0.5946769, 0.4462671, 1.304611, 0.2941177, 0, 1, 1,
0.5982074, 0.001781281, 1.560057, 0.3019608, 0, 1, 1,
0.6001107, -0.250378, 1.863043, 0.3098039, 0, 1, 1,
0.6013763, 0.5955229, 0.9250084, 0.3137255, 0, 1, 1,
0.6075687, -1.366389, 1.064064, 0.3215686, 0, 1, 1,
0.6082404, 0.4336999, 0.6266318, 0.3254902, 0, 1, 1,
0.6145059, -0.9416981, 3.379534, 0.3333333, 0, 1, 1,
0.6147153, -1.629466, 3.030906, 0.3372549, 0, 1, 1,
0.6173207, 0.9068003, 0.6355703, 0.345098, 0, 1, 1,
0.6174818, 1.859338, 0.6827538, 0.3490196, 0, 1, 1,
0.6185483, 1.298329, 0.934117, 0.3568628, 0, 1, 1,
0.6199956, -1.581975, 2.15876, 0.3607843, 0, 1, 1,
0.6213258, -1.309982, 3.296011, 0.3686275, 0, 1, 1,
0.6220366, -1.013124, 1.65475, 0.372549, 0, 1, 1,
0.6252574, 0.413335, 1.385192, 0.3803922, 0, 1, 1,
0.6303168, 0.01077334, 2.320229, 0.3843137, 0, 1, 1,
0.6314722, 1.007139, -0.7450926, 0.3921569, 0, 1, 1,
0.6349195, -0.0459635, 1.358972, 0.3960784, 0, 1, 1,
0.6371883, -0.9216766, 2.653711, 0.4039216, 0, 1, 1,
0.6386542, 0.923735, 1.173197, 0.4117647, 0, 1, 1,
0.6461414, -0.7989748, 2.231636, 0.4156863, 0, 1, 1,
0.6498076, 0.07862381, 1.310657, 0.4235294, 0, 1, 1,
0.6557657, -0.9509505, 1.910083, 0.427451, 0, 1, 1,
0.6604943, 0.2929303, 1.210159, 0.4352941, 0, 1, 1,
0.6622932, -0.3059169, 3.815403, 0.4392157, 0, 1, 1,
0.6640409, -0.630391, 1.213215, 0.4470588, 0, 1, 1,
0.664626, -0.721779, 2.617408, 0.4509804, 0, 1, 1,
0.666255, -0.07280985, 1.183624, 0.4588235, 0, 1, 1,
0.6670518, -0.2704863, 1.208567, 0.4627451, 0, 1, 1,
0.6680447, 0.9008856, 0.1542468, 0.4705882, 0, 1, 1,
0.6680701, -0.171778, 1.841909, 0.4745098, 0, 1, 1,
0.6687829, -1.417956, 3.265464, 0.4823529, 0, 1, 1,
0.6693201, 0.8939865, 2.201835, 0.4862745, 0, 1, 1,
0.6711571, 0.08511278, 3.439505, 0.4941176, 0, 1, 1,
0.6735389, -1.100994, 2.355037, 0.5019608, 0, 1, 1,
0.6746676, -1.571215, 3.987345, 0.5058824, 0, 1, 1,
0.6760407, -1.441659, 2.500606, 0.5137255, 0, 1, 1,
0.6808464, -0.5856447, 1.757832, 0.5176471, 0, 1, 1,
0.6834848, 0.3158465, 2.152018, 0.5254902, 0, 1, 1,
0.6847673, 1.381923, 2.950922, 0.5294118, 0, 1, 1,
0.6848895, 0.260242, 0.7646076, 0.5372549, 0, 1, 1,
0.6849949, 3.08947, 0.7408357, 0.5411765, 0, 1, 1,
0.6860685, -0.4825345, 1.36741, 0.5490196, 0, 1, 1,
0.7039207, -1.96173, 1.875326, 0.5529412, 0, 1, 1,
0.7058411, -0.9598233, 2.166951, 0.5607843, 0, 1, 1,
0.7062562, -0.04212608, 0.753355, 0.5647059, 0, 1, 1,
0.707443, 0.2546207, 1.292315, 0.572549, 0, 1, 1,
0.7114164, -0.871191, 3.2014, 0.5764706, 0, 1, 1,
0.7150429, -2.298179, 2.559988, 0.5843138, 0, 1, 1,
0.7165639, -0.420773, 2.537009, 0.5882353, 0, 1, 1,
0.7178641, 1.615983, -0.1231141, 0.5960785, 0, 1, 1,
0.7192476, -0.5745115, 1.684291, 0.6039216, 0, 1, 1,
0.7228163, 1.545385, 0.4921757, 0.6078432, 0, 1, 1,
0.7267236, 0.5798441, 1.849698, 0.6156863, 0, 1, 1,
0.7308018, -0.5575879, 2.495729, 0.6196079, 0, 1, 1,
0.7371526, -0.8217784, 1.853021, 0.627451, 0, 1, 1,
0.7375072, 0.7375833, -0.527676, 0.6313726, 0, 1, 1,
0.7431754, -1.655974, 3.545547, 0.6392157, 0, 1, 1,
0.7492006, 0.1588441, 0.2888562, 0.6431373, 0, 1, 1,
0.7527404, -0.2455361, 1.77205, 0.6509804, 0, 1, 1,
0.7574679, -0.7092323, 3.527216, 0.654902, 0, 1, 1,
0.7606447, -0.00565947, 1.720018, 0.6627451, 0, 1, 1,
0.7620025, -0.4008223, 3.301099, 0.6666667, 0, 1, 1,
0.7630838, 1.130412, 1.612344, 0.6745098, 0, 1, 1,
0.7787899, 0.7295299, 1.207646, 0.6784314, 0, 1, 1,
0.7819301, -0.7330908, 3.114775, 0.6862745, 0, 1, 1,
0.7856069, 1.959402, 1.443176, 0.6901961, 0, 1, 1,
0.792537, 0.2645414, -0.17492, 0.6980392, 0, 1, 1,
0.7942843, -0.6741612, 2.764252, 0.7058824, 0, 1, 1,
0.7956886, 0.04433499, 0.3311476, 0.7098039, 0, 1, 1,
0.7957976, -1.256206, 0.9305605, 0.7176471, 0, 1, 1,
0.7981701, -0.0744006, 2.095102, 0.7215686, 0, 1, 1,
0.8074034, 2.323696, 1.32706, 0.7294118, 0, 1, 1,
0.8075222, -0.04097597, 1.594988, 0.7333333, 0, 1, 1,
0.8087171, 0.5006905, 1.326811, 0.7411765, 0, 1, 1,
0.8098416, -0.2610912, 2.033316, 0.7450981, 0, 1, 1,
0.8182599, 1.629359, 0.1924547, 0.7529412, 0, 1, 1,
0.819056, -0.1718035, 1.78565, 0.7568628, 0, 1, 1,
0.8247548, 0.206733, -0.509153, 0.7647059, 0, 1, 1,
0.8295243, 0.8735358, 0.04993301, 0.7686275, 0, 1, 1,
0.837993, 1.692806, -0.7448758, 0.7764706, 0, 1, 1,
0.8384083, -0.06246587, 0.5069883, 0.7803922, 0, 1, 1,
0.8388668, 0.6063353, 0.473971, 0.7882353, 0, 1, 1,
0.8415717, 0.3380166, 0.7757162, 0.7921569, 0, 1, 1,
0.84575, -0.3054755, 1.541017, 0.8, 0, 1, 1,
0.8493999, -1.963011, 2.137545, 0.8078431, 0, 1, 1,
0.8511188, 1.451606, 1.097854, 0.8117647, 0, 1, 1,
0.8512737, 0.8255634, 0.4041184, 0.8196079, 0, 1, 1,
0.85629, 0.1997645, 0.7863002, 0.8235294, 0, 1, 1,
0.859044, 1.099477, 0.8813977, 0.8313726, 0, 1, 1,
0.8651691, 0.3286036, 0.4389285, 0.8352941, 0, 1, 1,
0.8733972, -1.446804, 1.64599, 0.8431373, 0, 1, 1,
0.8774883, 0.3016534, 1.483087, 0.8470588, 0, 1, 1,
0.8782262, -1.370241, 3.42154, 0.854902, 0, 1, 1,
0.8824924, -1.915696, 2.881647, 0.8588235, 0, 1, 1,
0.8830256, -1.290648, 1.863214, 0.8666667, 0, 1, 1,
0.883389, -0.06460229, 1.535792, 0.8705882, 0, 1, 1,
0.8859012, 0.6974772, 0.9175373, 0.8784314, 0, 1, 1,
0.8868946, -0.3633601, 1.204114, 0.8823529, 0, 1, 1,
0.9013249, -0.926071, 4.452641, 0.8901961, 0, 1, 1,
0.9036511, 0.7340334, 0.05191533, 0.8941177, 0, 1, 1,
0.9134784, 0.5417607, 1.783944, 0.9019608, 0, 1, 1,
0.9194, 0.807609, 2.708129, 0.9098039, 0, 1, 1,
0.9234534, -0.306686, 3.085071, 0.9137255, 0, 1, 1,
0.92595, -1.147174, 2.628971, 0.9215686, 0, 1, 1,
0.9320781, 1.759308, -0.1903524, 0.9254902, 0, 1, 1,
0.9347191, -0.3163416, 1.915138, 0.9333333, 0, 1, 1,
0.9389755, 1.168617, -0.05597834, 0.9372549, 0, 1, 1,
0.9404497, -2.224087, 3.215505, 0.945098, 0, 1, 1,
0.9424478, -0.948641, 2.536718, 0.9490196, 0, 1, 1,
0.954666, -0.2255149, 2.318558, 0.9568627, 0, 1, 1,
0.9640061, 0.9187282, 0.7428347, 0.9607843, 0, 1, 1,
0.9685469, -1.938847, 2.874039, 0.9686275, 0, 1, 1,
0.9717779, -0.3372787, 1.990577, 0.972549, 0, 1, 1,
0.9731913, -0.3131115, 3.945449, 0.9803922, 0, 1, 1,
0.9789632, -2.04704, 2.643579, 0.9843137, 0, 1, 1,
0.9853392, 1.498148, -0.0230576, 0.9921569, 0, 1, 1,
0.9882538, -0.8696316, 2.275136, 0.9960784, 0, 1, 1,
0.9897786, 0.4041501, 1.477055, 1, 0, 0.9960784, 1,
0.9925342, 0.8410473, 0.08939905, 1, 0, 0.9882353, 1,
0.995845, -1.122188, 3.521891, 1, 0, 0.9843137, 1,
0.9962413, 0.2342706, 1.940935, 1, 0, 0.9764706, 1,
1.002714, 1.199813, 1.931831, 1, 0, 0.972549, 1,
1.005985, 0.67649, 2.392573, 1, 0, 0.9647059, 1,
1.013836, -0.5422087, 2.093405, 1, 0, 0.9607843, 1,
1.01405, -0.09746468, 1.838293, 1, 0, 0.9529412, 1,
1.014252, 0.5472152, 0.8138051, 1, 0, 0.9490196, 1,
1.019296, 0.1729808, 1.901731, 1, 0, 0.9411765, 1,
1.023702, 0.3617629, 2.261578, 1, 0, 0.9372549, 1,
1.024171, -2.343706, 1.890851, 1, 0, 0.9294118, 1,
1.027246, -0.04424746, 1.492172, 1, 0, 0.9254902, 1,
1.028607, -1.401625, 1.833828, 1, 0, 0.9176471, 1,
1.037116, -1.050485, 1.270295, 1, 0, 0.9137255, 1,
1.049667, -0.4702124, 3.35039, 1, 0, 0.9058824, 1,
1.04983, 0.7862375, 1.226994, 1, 0, 0.9019608, 1,
1.052732, 0.8563971, 0.3846678, 1, 0, 0.8941177, 1,
1.060975, -0.6438418, 2.739052, 1, 0, 0.8862745, 1,
1.062216, 0.461044, 1.114398, 1, 0, 0.8823529, 1,
1.070068, -1.140113, 2.658345, 1, 0, 0.8745098, 1,
1.071242, -0.4141093, 3.058103, 1, 0, 0.8705882, 1,
1.07155, -0.774237, 2.068347, 1, 0, 0.8627451, 1,
1.071661, -0.3669714, -0.4346724, 1, 0, 0.8588235, 1,
1.090522, -0.6078309, 1.668772, 1, 0, 0.8509804, 1,
1.097537, 1.322316, 1.049573, 1, 0, 0.8470588, 1,
1.104999, -0.7172194, 0.6656144, 1, 0, 0.8392157, 1,
1.106786, -0.4660993, 2.290624, 1, 0, 0.8352941, 1,
1.107578, -1.488888, 3.173617, 1, 0, 0.827451, 1,
1.114517, 1.017442, -0.06525513, 1, 0, 0.8235294, 1,
1.122967, 0.6307231, 0.2908688, 1, 0, 0.8156863, 1,
1.128878, 1.558538, 0.1355456, 1, 0, 0.8117647, 1,
1.129784, -0.5098748, 4.287959, 1, 0, 0.8039216, 1,
1.132863, -0.2156403, 0.5439953, 1, 0, 0.7960784, 1,
1.138456, -0.0207521, 2.220983, 1, 0, 0.7921569, 1,
1.14204, 1.580855, -0.02216068, 1, 0, 0.7843137, 1,
1.144985, -0.8276081, 1.399123, 1, 0, 0.7803922, 1,
1.153408, -0.4354994, 3.161433, 1, 0, 0.772549, 1,
1.160418, 0.01917256, 2.561878, 1, 0, 0.7686275, 1,
1.160874, -0.6693991, 1.647451, 1, 0, 0.7607843, 1,
1.167234, -1.386364, 0.0754513, 1, 0, 0.7568628, 1,
1.169088, -0.005878144, 2.138477, 1, 0, 0.7490196, 1,
1.17116, -0.5138223, 1.93367, 1, 0, 0.7450981, 1,
1.172285, -0.7262046, 2.828721, 1, 0, 0.7372549, 1,
1.180484, -0.5028915, 1.799834, 1, 0, 0.7333333, 1,
1.18885, 0.6594931, 1.566678, 1, 0, 0.7254902, 1,
1.191279, -1.669494, 1.812149, 1, 0, 0.7215686, 1,
1.19516, -1.776186, 3.281973, 1, 0, 0.7137255, 1,
1.198907, -2.098068, 3.023671, 1, 0, 0.7098039, 1,
1.200769, 0.9403569, 0.3611044, 1, 0, 0.7019608, 1,
1.209933, 0.9451736, 2.405685, 1, 0, 0.6941177, 1,
1.213188, -1.239413, 3.339198, 1, 0, 0.6901961, 1,
1.222199, 1.265715, 1.01392, 1, 0, 0.682353, 1,
1.250727, 0.4202521, 1.621553, 1, 0, 0.6784314, 1,
1.251714, -1.034223, 1.80907, 1, 0, 0.6705883, 1,
1.261478, -1.815565, 2.48378, 1, 0, 0.6666667, 1,
1.265151, -0.5335686, 3.574575, 1, 0, 0.6588235, 1,
1.267397, -0.7278606, 1.596528, 1, 0, 0.654902, 1,
1.267798, -0.4608447, 2.030938, 1, 0, 0.6470588, 1,
1.270395, 0.5876428, -0.01498065, 1, 0, 0.6431373, 1,
1.27195, 0.893045, -0.7015678, 1, 0, 0.6352941, 1,
1.276587, 0.1593604, 0.661829, 1, 0, 0.6313726, 1,
1.277796, 0.5438737, 2.898198, 1, 0, 0.6235294, 1,
1.280891, 0.09519985, 0.5472523, 1, 0, 0.6196079, 1,
1.289102, 0.08596928, 2.300142, 1, 0, 0.6117647, 1,
1.291827, -1.670096, 1.232901, 1, 0, 0.6078432, 1,
1.29365, 0.6474738, 0.21359, 1, 0, 0.6, 1,
1.294898, 0.5034326, 0.6021997, 1, 0, 0.5921569, 1,
1.295101, -0.2389325, 2.394473, 1, 0, 0.5882353, 1,
1.295339, -0.3034703, 2.504085, 1, 0, 0.5803922, 1,
1.303352, -0.8914579, 1.436549, 1, 0, 0.5764706, 1,
1.322829, -1.386191, 3.556559, 1, 0, 0.5686275, 1,
1.328389, -1.991586, 2.968668, 1, 0, 0.5647059, 1,
1.329592, -1.035799, 0.7783751, 1, 0, 0.5568628, 1,
1.331837, 0.8029593, 0.09442306, 1, 0, 0.5529412, 1,
1.334697, -0.6892104, 3.324863, 1, 0, 0.5450981, 1,
1.338072, 0.6684516, 2.022645, 1, 0, 0.5411765, 1,
1.338817, 0.3855049, 1.024704, 1, 0, 0.5333334, 1,
1.345892, -1.193407, 4.692744, 1, 0, 0.5294118, 1,
1.34737, 1.506917, 2.593313, 1, 0, 0.5215687, 1,
1.350563, -0.3889593, 2.014353, 1, 0, 0.5176471, 1,
1.358374, 0.04408703, 0.891127, 1, 0, 0.509804, 1,
1.367401, 0.2240697, -0.9700881, 1, 0, 0.5058824, 1,
1.37685, -0.06768084, 2.437357, 1, 0, 0.4980392, 1,
1.379495, 0.4853596, 1.769387, 1, 0, 0.4901961, 1,
1.391164, -0.7838739, 2.907552, 1, 0, 0.4862745, 1,
1.394752, -0.1338199, 1.254241, 1, 0, 0.4784314, 1,
1.395734, 0.1359679, 2.007945, 1, 0, 0.4745098, 1,
1.402465, 0.2440269, 2.029313, 1, 0, 0.4666667, 1,
1.410019, -0.3683088, -0.02716224, 1, 0, 0.4627451, 1,
1.431717, 0.4503367, 1.519408, 1, 0, 0.454902, 1,
1.438157, -0.6812571, 2.33672, 1, 0, 0.4509804, 1,
1.450884, 1.523383, 1.045949, 1, 0, 0.4431373, 1,
1.455086, -1.086642, 1.294178, 1, 0, 0.4392157, 1,
1.458184, -0.1724086, 1.938974, 1, 0, 0.4313726, 1,
1.461548, -0.3046359, 1.700309, 1, 0, 0.427451, 1,
1.470147, 0.4765926, 1.01358, 1, 0, 0.4196078, 1,
1.470298, -1.161085, 1.898531, 1, 0, 0.4156863, 1,
1.473727, -0.558082, 1.200291, 1, 0, 0.4078431, 1,
1.485246, 1.540036, 0.1907569, 1, 0, 0.4039216, 1,
1.489773, 0.5018983, 1.68701, 1, 0, 0.3960784, 1,
1.501055, 0.6616848, 0.6038378, 1, 0, 0.3882353, 1,
1.50476, -0.3142382, 2.887464, 1, 0, 0.3843137, 1,
1.505663, 0.2447096, 1.824132, 1, 0, 0.3764706, 1,
1.507017, -0.281624, 2.756049, 1, 0, 0.372549, 1,
1.50871, -0.1223518, 4.174922, 1, 0, 0.3647059, 1,
1.515878, 1.253891, 1.604512, 1, 0, 0.3607843, 1,
1.516459, 0.3794041, 1.541453, 1, 0, 0.3529412, 1,
1.54405, 1.787503, 0.2282554, 1, 0, 0.3490196, 1,
1.565584, 1.705047, 0.3026783, 1, 0, 0.3411765, 1,
1.582388, 0.9682474, 2.144035, 1, 0, 0.3372549, 1,
1.606402, -1.018512, 2.061773, 1, 0, 0.3294118, 1,
1.61302, 0.8117718, 0.9988649, 1, 0, 0.3254902, 1,
1.627679, -0.2339939, 2.465955, 1, 0, 0.3176471, 1,
1.64135, 0.8303818, 0.9122778, 1, 0, 0.3137255, 1,
1.642532, -0.9351819, 2.006728, 1, 0, 0.3058824, 1,
1.667474, -2.095259, 4.636182, 1, 0, 0.2980392, 1,
1.69282, 2.236145, 0.1937266, 1, 0, 0.2941177, 1,
1.697374, -1.443087, 3.447265, 1, 0, 0.2862745, 1,
1.707274, -0.4926441, 2.00601, 1, 0, 0.282353, 1,
1.726772, 0.7916101, 0.5742931, 1, 0, 0.2745098, 1,
1.735424, 0.344395, -0.188704, 1, 0, 0.2705882, 1,
1.739104, -0.01171189, 1.427902, 1, 0, 0.2627451, 1,
1.747651, 0.8681545, 1.549533, 1, 0, 0.2588235, 1,
1.764722, -0.7564765, 1.39281, 1, 0, 0.2509804, 1,
1.7679, 0.8077753, 0.7443098, 1, 0, 0.2470588, 1,
1.768904, -0.9315129, 3.537941, 1, 0, 0.2392157, 1,
1.769356, -0.5289745, 1.485383, 1, 0, 0.2352941, 1,
1.782565, 0.4999858, 1.919563, 1, 0, 0.227451, 1,
1.811355, 1.795988, 1.26322, 1, 0, 0.2235294, 1,
1.819256, 0.03164868, 1.927844, 1, 0, 0.2156863, 1,
1.82809, 0.03874902, 0.4294802, 1, 0, 0.2117647, 1,
1.883206, -1.765998, 0.4233944, 1, 0, 0.2039216, 1,
1.89382, -0.697302, 1.67137, 1, 0, 0.1960784, 1,
1.941373, 0.5389537, 1.294797, 1, 0, 0.1921569, 1,
1.949046, -0.990675, 1.692658, 1, 0, 0.1843137, 1,
1.968336, -1.008573, 1.978217, 1, 0, 0.1803922, 1,
2.023309, 0.1755095, 2.819594, 1, 0, 0.172549, 1,
2.024949, 0.828546, 2.196699, 1, 0, 0.1686275, 1,
2.05199, -1.353852, 1.986967, 1, 0, 0.1607843, 1,
2.076852, 0.2202371, 0.2204575, 1, 0, 0.1568628, 1,
2.11486, 0.9664224, 2.335892, 1, 0, 0.1490196, 1,
2.166485, 3.305928, 1.288304, 1, 0, 0.145098, 1,
2.183221, -0.2324881, 1.645226, 1, 0, 0.1372549, 1,
2.192208, 0.6390435, 0.712806, 1, 0, 0.1333333, 1,
2.196326, 0.4614675, 0.9876465, 1, 0, 0.1254902, 1,
2.214207, 1.13704, 0.5725923, 1, 0, 0.1215686, 1,
2.268951, 1.706791, 1.243405, 1, 0, 0.1137255, 1,
2.279965, 1.272046, 0.648176, 1, 0, 0.1098039, 1,
2.305175, -0.7986845, 1.866441, 1, 0, 0.1019608, 1,
2.343337, -1.36037, 2.388969, 1, 0, 0.09411765, 1,
2.363101, 0.02812945, 0.512952, 1, 0, 0.09019608, 1,
2.388692, -0.462822, 0.9085747, 1, 0, 0.08235294, 1,
2.43649, 0.0210926, 2.304145, 1, 0, 0.07843138, 1,
2.543445, -1.110617, 2.309965, 1, 0, 0.07058824, 1,
2.551358, -0.02516974, 2.149929, 1, 0, 0.06666667, 1,
2.566278, 0.9704369, 1.121052, 1, 0, 0.05882353, 1,
2.64731, 1.140369, 2.089118, 1, 0, 0.05490196, 1,
2.652191, -0.01827208, 2.758923, 1, 0, 0.04705882, 1,
2.702423, 0.3032972, 0.5154095, 1, 0, 0.04313726, 1,
2.779588, 1.096613, 1.930792, 1, 0, 0.03529412, 1,
2.914717, -0.9482318, 2.253242, 1, 0, 0.03137255, 1,
2.99887, 0.8190647, -0.6374945, 1, 0, 0.02352941, 1,
3.017199, 0.3417168, 0.935384, 1, 0, 0.01960784, 1,
3.023489, 0.692907, 3.43182, 1, 0, 0.01176471, 1,
3.468947, -2.740865, 2.648745, 1, 0, 0.007843138, 1
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
0.1220759, -4.232274, -7.604747, 0, -0.5, 0.5, 0.5,
0.1220759, -4.232274, -7.604747, 1, -0.5, 0.5, 0.5,
0.1220759, -4.232274, -7.604747, 1, 1.5, 0.5, 0.5,
0.1220759, -4.232274, -7.604747, 0, 1.5, 0.5, 0.5
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
-4.359384, 0.0830971, -7.604747, 0, -0.5, 0.5, 0.5,
-4.359384, 0.0830971, -7.604747, 1, -0.5, 0.5, 0.5,
-4.359384, 0.0830971, -7.604747, 1, 1.5, 0.5, 0.5,
-4.359384, 0.0830971, -7.604747, 0, 1.5, 0.5, 0.5
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
-4.359384, -4.232274, 0.1630888, 0, -0.5, 0.5, 0.5,
-4.359384, -4.232274, 0.1630888, 1, -0.5, 0.5, 0.5,
-4.359384, -4.232274, 0.1630888, 1, 1.5, 0.5, 0.5,
-4.359384, -4.232274, 0.1630888, 0, 1.5, 0.5, 0.5
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
-3, -3.236419, -5.81217,
3, -3.236419, -5.81217,
-3, -3.236419, -5.81217,
-3, -3.402395, -6.110933,
-2, -3.236419, -5.81217,
-2, -3.402395, -6.110933,
-1, -3.236419, -5.81217,
-1, -3.402395, -6.110933,
0, -3.236419, -5.81217,
0, -3.402395, -6.110933,
1, -3.236419, -5.81217,
1, -3.402395, -6.110933,
2, -3.236419, -5.81217,
2, -3.402395, -6.110933,
3, -3.236419, -5.81217,
3, -3.402395, -6.110933
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
-3, -3.734347, -6.708458, 0, -0.5, 0.5, 0.5,
-3, -3.734347, -6.708458, 1, -0.5, 0.5, 0.5,
-3, -3.734347, -6.708458, 1, 1.5, 0.5, 0.5,
-3, -3.734347, -6.708458, 0, 1.5, 0.5, 0.5,
-2, -3.734347, -6.708458, 0, -0.5, 0.5, 0.5,
-2, -3.734347, -6.708458, 1, -0.5, 0.5, 0.5,
-2, -3.734347, -6.708458, 1, 1.5, 0.5, 0.5,
-2, -3.734347, -6.708458, 0, 1.5, 0.5, 0.5,
-1, -3.734347, -6.708458, 0, -0.5, 0.5, 0.5,
-1, -3.734347, -6.708458, 1, -0.5, 0.5, 0.5,
-1, -3.734347, -6.708458, 1, 1.5, 0.5, 0.5,
-1, -3.734347, -6.708458, 0, 1.5, 0.5, 0.5,
0, -3.734347, -6.708458, 0, -0.5, 0.5, 0.5,
0, -3.734347, -6.708458, 1, -0.5, 0.5, 0.5,
0, -3.734347, -6.708458, 1, 1.5, 0.5, 0.5,
0, -3.734347, -6.708458, 0, 1.5, 0.5, 0.5,
1, -3.734347, -6.708458, 0, -0.5, 0.5, 0.5,
1, -3.734347, -6.708458, 1, -0.5, 0.5, 0.5,
1, -3.734347, -6.708458, 1, 1.5, 0.5, 0.5,
1, -3.734347, -6.708458, 0, 1.5, 0.5, 0.5,
2, -3.734347, -6.708458, 0, -0.5, 0.5, 0.5,
2, -3.734347, -6.708458, 1, -0.5, 0.5, 0.5,
2, -3.734347, -6.708458, 1, 1.5, 0.5, 0.5,
2, -3.734347, -6.708458, 0, 1.5, 0.5, 0.5,
3, -3.734347, -6.708458, 0, -0.5, 0.5, 0.5,
3, -3.734347, -6.708458, 1, -0.5, 0.5, 0.5,
3, -3.734347, -6.708458, 1, 1.5, 0.5, 0.5,
3, -3.734347, -6.708458, 0, 1.5, 0.5, 0.5
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
-3.325201, -3, -5.81217,
-3.325201, 3, -5.81217,
-3.325201, -3, -5.81217,
-3.497565, -3, -6.110933,
-3.325201, -2, -5.81217,
-3.497565, -2, -6.110933,
-3.325201, -1, -5.81217,
-3.497565, -1, -6.110933,
-3.325201, 0, -5.81217,
-3.497565, 0, -6.110933,
-3.325201, 1, -5.81217,
-3.497565, 1, -6.110933,
-3.325201, 2, -5.81217,
-3.497565, 2, -6.110933,
-3.325201, 3, -5.81217,
-3.497565, 3, -6.110933
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
-3.842293, -3, -6.708458, 0, -0.5, 0.5, 0.5,
-3.842293, -3, -6.708458, 1, -0.5, 0.5, 0.5,
-3.842293, -3, -6.708458, 1, 1.5, 0.5, 0.5,
-3.842293, -3, -6.708458, 0, 1.5, 0.5, 0.5,
-3.842293, -2, -6.708458, 0, -0.5, 0.5, 0.5,
-3.842293, -2, -6.708458, 1, -0.5, 0.5, 0.5,
-3.842293, -2, -6.708458, 1, 1.5, 0.5, 0.5,
-3.842293, -2, -6.708458, 0, 1.5, 0.5, 0.5,
-3.842293, -1, -6.708458, 0, -0.5, 0.5, 0.5,
-3.842293, -1, -6.708458, 1, -0.5, 0.5, 0.5,
-3.842293, -1, -6.708458, 1, 1.5, 0.5, 0.5,
-3.842293, -1, -6.708458, 0, 1.5, 0.5, 0.5,
-3.842293, 0, -6.708458, 0, -0.5, 0.5, 0.5,
-3.842293, 0, -6.708458, 1, -0.5, 0.5, 0.5,
-3.842293, 0, -6.708458, 1, 1.5, 0.5, 0.5,
-3.842293, 0, -6.708458, 0, 1.5, 0.5, 0.5,
-3.842293, 1, -6.708458, 0, -0.5, 0.5, 0.5,
-3.842293, 1, -6.708458, 1, -0.5, 0.5, 0.5,
-3.842293, 1, -6.708458, 1, 1.5, 0.5, 0.5,
-3.842293, 1, -6.708458, 0, 1.5, 0.5, 0.5,
-3.842293, 2, -6.708458, 0, -0.5, 0.5, 0.5,
-3.842293, 2, -6.708458, 1, -0.5, 0.5, 0.5,
-3.842293, 2, -6.708458, 1, 1.5, 0.5, 0.5,
-3.842293, 2, -6.708458, 0, 1.5, 0.5, 0.5,
-3.842293, 3, -6.708458, 0, -0.5, 0.5, 0.5,
-3.842293, 3, -6.708458, 1, -0.5, 0.5, 0.5,
-3.842293, 3, -6.708458, 1, 1.5, 0.5, 0.5,
-3.842293, 3, -6.708458, 0, 1.5, 0.5, 0.5
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
-3.325201, -3.236419, -4,
-3.325201, -3.236419, 4,
-3.325201, -3.236419, -4,
-3.497565, -3.402395, -4,
-3.325201, -3.236419, -2,
-3.497565, -3.402395, -2,
-3.325201, -3.236419, 0,
-3.497565, -3.402395, 0,
-3.325201, -3.236419, 2,
-3.497565, -3.402395, 2,
-3.325201, -3.236419, 4,
-3.497565, -3.402395, 4
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
-3.842293, -3.734347, -4, 0, -0.5, 0.5, 0.5,
-3.842293, -3.734347, -4, 1, -0.5, 0.5, 0.5,
-3.842293, -3.734347, -4, 1, 1.5, 0.5, 0.5,
-3.842293, -3.734347, -4, 0, 1.5, 0.5, 0.5,
-3.842293, -3.734347, -2, 0, -0.5, 0.5, 0.5,
-3.842293, -3.734347, -2, 1, -0.5, 0.5, 0.5,
-3.842293, -3.734347, -2, 1, 1.5, 0.5, 0.5,
-3.842293, -3.734347, -2, 0, 1.5, 0.5, 0.5,
-3.842293, -3.734347, 0, 0, -0.5, 0.5, 0.5,
-3.842293, -3.734347, 0, 1, -0.5, 0.5, 0.5,
-3.842293, -3.734347, 0, 1, 1.5, 0.5, 0.5,
-3.842293, -3.734347, 0, 0, 1.5, 0.5, 0.5,
-3.842293, -3.734347, 2, 0, -0.5, 0.5, 0.5,
-3.842293, -3.734347, 2, 1, -0.5, 0.5, 0.5,
-3.842293, -3.734347, 2, 1, 1.5, 0.5, 0.5,
-3.842293, -3.734347, 2, 0, 1.5, 0.5, 0.5,
-3.842293, -3.734347, 4, 0, -0.5, 0.5, 0.5,
-3.842293, -3.734347, 4, 1, -0.5, 0.5, 0.5,
-3.842293, -3.734347, 4, 1, 1.5, 0.5, 0.5,
-3.842293, -3.734347, 4, 0, 1.5, 0.5, 0.5
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
-3.325201, -3.236419, -5.81217,
-3.325201, 3.402613, -5.81217,
-3.325201, -3.236419, 6.138347,
-3.325201, 3.402613, 6.138347,
-3.325201, -3.236419, -5.81217,
-3.325201, -3.236419, 6.138347,
-3.325201, 3.402613, -5.81217,
-3.325201, 3.402613, 6.138347,
-3.325201, -3.236419, -5.81217,
3.569353, -3.236419, -5.81217,
-3.325201, -3.236419, 6.138347,
3.569353, -3.236419, 6.138347,
-3.325201, 3.402613, -5.81217,
3.569353, 3.402613, -5.81217,
-3.325201, 3.402613, 6.138347,
3.569353, 3.402613, 6.138347,
3.569353, -3.236419, -5.81217,
3.569353, 3.402613, -5.81217,
3.569353, -3.236419, 6.138347,
3.569353, 3.402613, 6.138347,
3.569353, -3.236419, -5.81217,
3.569353, -3.236419, 6.138347,
3.569353, 3.402613, -5.81217,
3.569353, 3.402613, 6.138347
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
var radius = 8.175773;
var distance = 36.37494;
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
mvMatrix.translate( -0.1220759, -0.0830971, -0.1630888 );
mvMatrix.scale( 1.282143, 1.33149, 0.7397007 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.37494);
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
combat<-read.table("combat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-combat$V2
```

```
## Error in eval(expr, envir, enclos): object 'combat' not found
```

```r
y<-combat$V3
```

```
## Error in eval(expr, envir, enclos): object 'combat' not found
```

```r
z<-combat$V4
```

```
## Error in eval(expr, envir, enclos): object 'combat' not found
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
-3.224795, 0.1939862, -1.834367, 0, 0, 1, 1, 1,
-3.015391, 0.3031992, -0.5339265, 1, 0, 0, 1, 1,
-2.899442, -0.8314971, -1.705409, 1, 0, 0, 1, 1,
-2.762961, 0.1615096, -0.7552388, 1, 0, 0, 1, 1,
-2.754158, -0.4583916, -1.26909, 1, 0, 0, 1, 1,
-2.676312, 0.9359453, -1.469956, 1, 0, 0, 1, 1,
-2.607368, -0.3461046, -2.056457, 0, 0, 0, 1, 1,
-2.502438, 0.1044294, -0.5971399, 0, 0, 0, 1, 1,
-2.451032, -1.263987, -2.679259, 0, 0, 0, 1, 1,
-2.431119, 0.2377389, -0.5639881, 0, 0, 0, 1, 1,
-2.418854, 1.078062, -1.747988, 0, 0, 0, 1, 1,
-2.382858, -0.2745151, -2.314098, 0, 0, 0, 1, 1,
-2.347309, -1.485531, -0.7986348, 0, 0, 0, 1, 1,
-2.344199, 0.08008689, -3.729799, 1, 1, 1, 1, 1,
-2.234946, 1.629457, -0.7661953, 1, 1, 1, 1, 1,
-2.20617, -1.658543, -2.483366, 1, 1, 1, 1, 1,
-2.16082, -0.1344195, -1.497627, 1, 1, 1, 1, 1,
-2.104066, -0.5862487, -2.655185, 1, 1, 1, 1, 1,
-2.094753, 0.2783992, -0.6678788, 1, 1, 1, 1, 1,
-2.055915, -0.1787974, -0.4576979, 1, 1, 1, 1, 1,
-2.055042, -0.2476401, -1.680999, 1, 1, 1, 1, 1,
-2.049392, -2.365448, -1.782815, 1, 1, 1, 1, 1,
-2.048291, 0.6228618, -3.540365, 1, 1, 1, 1, 1,
-2.032202, -1.404201, -0.885165, 1, 1, 1, 1, 1,
-2.012578, 0.371905, 1.221756, 1, 1, 1, 1, 1,
-2.00408, -1.393337, -2.799446, 1, 1, 1, 1, 1,
-1.996184, -0.6684988, -1.890686, 1, 1, 1, 1, 1,
-1.978276, 0.3175173, -1.474846, 1, 1, 1, 1, 1,
-1.939447, 0.9583662, -0.8139849, 0, 0, 1, 1, 1,
-1.922605, -0.2650261, -2.694031, 1, 0, 0, 1, 1,
-1.907792, -1.265395, -2.90979, 1, 0, 0, 1, 1,
-1.902475, 0.5788285, -2.184407, 1, 0, 0, 1, 1,
-1.890768, 0.4417829, -1.583588, 1, 0, 0, 1, 1,
-1.848761, -0.5768091, -0.6953251, 1, 0, 0, 1, 1,
-1.8281, -0.04384373, -2.787027, 0, 0, 0, 1, 1,
-1.795517, 2.009873, -1.119578, 0, 0, 0, 1, 1,
-1.791311, 1.467637, -1.619559, 0, 0, 0, 1, 1,
-1.789151, -1.467315, -3.706551, 0, 0, 0, 1, 1,
-1.784639, -1.807736, -3.384908, 0, 0, 0, 1, 1,
-1.773798, 0.4504265, -0.286891, 0, 0, 0, 1, 1,
-1.770169, 0.1907571, -1.342005, 0, 0, 0, 1, 1,
-1.768392, 0.4034377, -0.8165158, 1, 1, 1, 1, 1,
-1.754562, 0.7057322, -2.293278, 1, 1, 1, 1, 1,
-1.747846, -1.537033, -3.69216, 1, 1, 1, 1, 1,
-1.747285, 0.9070767, -1.345898, 1, 1, 1, 1, 1,
-1.710191, -0.02850147, -1.274126, 1, 1, 1, 1, 1,
-1.708624, 0.3559584, -1.76746, 1, 1, 1, 1, 1,
-1.703676, 0.05780459, -2.676902, 1, 1, 1, 1, 1,
-1.682242, -0.6793431, -1.598735, 1, 1, 1, 1, 1,
-1.668297, 1.651638, -0.4253463, 1, 1, 1, 1, 1,
-1.667283, -1.125706, -2.093426, 1, 1, 1, 1, 1,
-1.662288, 0.5985872, -0.1490903, 1, 1, 1, 1, 1,
-1.654542, 0.5977746, -1.622739, 1, 1, 1, 1, 1,
-1.653564, -0.2384347, -1.537233, 1, 1, 1, 1, 1,
-1.606195, 0.180043, -1.050278, 1, 1, 1, 1, 1,
-1.598544, -2.152494, -4.335546, 1, 1, 1, 1, 1,
-1.580837, -0.1668019, -1.94056, 0, 0, 1, 1, 1,
-1.580067, -0.8915318, -2.183212, 1, 0, 0, 1, 1,
-1.576785, -0.1192245, -3.503826, 1, 0, 0, 1, 1,
-1.571846, -0.4594136, -0.2380754, 1, 0, 0, 1, 1,
-1.566369, -0.02803085, -2.341948, 1, 0, 0, 1, 1,
-1.565846, -1.501842, -1.14477, 1, 0, 0, 1, 1,
-1.549389, -2.457197, -1.843369, 0, 0, 0, 1, 1,
-1.548748, -0.1650157, -1.108153, 0, 0, 0, 1, 1,
-1.546585, 0.3719543, -0.6790177, 0, 0, 0, 1, 1,
-1.53183, 0.5863843, -0.3725065, 0, 0, 0, 1, 1,
-1.528215, 1.896174, 0.1709549, 0, 0, 0, 1, 1,
-1.522501, -0.3265265, -0.9785774, 0, 0, 0, 1, 1,
-1.502444, -0.0272684, 1.264848, 0, 0, 0, 1, 1,
-1.501577, 1.108596, -1.925755, 1, 1, 1, 1, 1,
-1.50097, 2.997642, -1.077996, 1, 1, 1, 1, 1,
-1.497951, 0.4507038, -3.639316, 1, 1, 1, 1, 1,
-1.485508, -0.07762004, -1.5493, 1, 1, 1, 1, 1,
-1.481626, 0.1955323, -1.294433, 1, 1, 1, 1, 1,
-1.475915, -1.207133, -1.777864, 1, 1, 1, 1, 1,
-1.472762, -0.1182127, 0.2933569, 1, 1, 1, 1, 1,
-1.465903, 0.639921, -1.493693, 1, 1, 1, 1, 1,
-1.465142, 0.8244455, -0.9100794, 1, 1, 1, 1, 1,
-1.464293, -0.1155864, -0.4347956, 1, 1, 1, 1, 1,
-1.456052, -0.5715776, 0.2974705, 1, 1, 1, 1, 1,
-1.453598, -0.28107, -1.892265, 1, 1, 1, 1, 1,
-1.451637, -0.7257773, -1.888743, 1, 1, 1, 1, 1,
-1.442875, -0.1200324, -1.155372, 1, 1, 1, 1, 1,
-1.438351, -0.1192567, -2.483148, 1, 1, 1, 1, 1,
-1.428787, 0.3573268, -0.7612977, 0, 0, 1, 1, 1,
-1.426366, -0.3161008, -1.256436, 1, 0, 0, 1, 1,
-1.426276, 1.605945, 0.3839907, 1, 0, 0, 1, 1,
-1.424922, -0.8625959, -2.389992, 1, 0, 0, 1, 1,
-1.42438, -0.09881057, -0.2885919, 1, 0, 0, 1, 1,
-1.41719, -1.19384, -1.845081, 1, 0, 0, 1, 1,
-1.415952, -0.2823071, -2.960513, 0, 0, 0, 1, 1,
-1.413913, 1.161972, -0.2668263, 0, 0, 0, 1, 1,
-1.407362, -2.137601, -2.877554, 0, 0, 0, 1, 1,
-1.403686, 0.1959841, -1.423874, 0, 0, 0, 1, 1,
-1.385436, 0.7866188, 0.3870774, 0, 0, 0, 1, 1,
-1.385154, -1.037338, -2.283543, 0, 0, 0, 1, 1,
-1.364855, -0.6445008, -1.692865, 0, 0, 0, 1, 1,
-1.363131, 0.00450438, -2.275584, 1, 1, 1, 1, 1,
-1.361913, -1.817562, -4.211522, 1, 1, 1, 1, 1,
-1.35411, 0.009872214, -1.507847, 1, 1, 1, 1, 1,
-1.350053, -1.478177, -2.976251, 1, 1, 1, 1, 1,
-1.33573, -0.9122243, -0.9250941, 1, 1, 1, 1, 1,
-1.324602, -0.5316455, -1.910845, 1, 1, 1, 1, 1,
-1.3239, 0.6680124, -0.8923444, 1, 1, 1, 1, 1,
-1.322243, -1.083207, -1.49697, 1, 1, 1, 1, 1,
-1.315675, -1.287599, -1.19351, 1, 1, 1, 1, 1,
-1.310125, 1.867091, 2.140661, 1, 1, 1, 1, 1,
-1.306362, -0.5060809, -0.7129276, 1, 1, 1, 1, 1,
-1.305397, -1.169367, -2.314258, 1, 1, 1, 1, 1,
-1.295277, 1.687165, -2.292305, 1, 1, 1, 1, 1,
-1.291805, 0.4612995, -1.123963, 1, 1, 1, 1, 1,
-1.276252, -0.04274556, -2.286638, 1, 1, 1, 1, 1,
-1.262455, -0.8705764, -2.328466, 0, 0, 1, 1, 1,
-1.261998, -0.5860355, -2.029286, 1, 0, 0, 1, 1,
-1.259963, -0.4151951, -3.273917, 1, 0, 0, 1, 1,
-1.252713, 0.9681733, -2.420862, 1, 0, 0, 1, 1,
-1.246471, 0.6978942, 0.4760801, 1, 0, 0, 1, 1,
-1.245911, 0.649475, -1.215099, 1, 0, 0, 1, 1,
-1.240333, -0.9379252, -2.512286, 0, 0, 0, 1, 1,
-1.232335, -0.9948929, -2.394895, 0, 0, 0, 1, 1,
-1.225717, 0.6513777, -2.116759, 0, 0, 0, 1, 1,
-1.219879, 0.9733261, -0.6565933, 0, 0, 0, 1, 1,
-1.21703, -0.06614762, -1.650483, 0, 0, 0, 1, 1,
-1.199729, 0.04210333, -2.149392, 0, 0, 0, 1, 1,
-1.188633, 1.508194, -1.798854, 0, 0, 0, 1, 1,
-1.180129, 0.3821461, -1.444592, 1, 1, 1, 1, 1,
-1.17939, 0.871928, -1.559196, 1, 1, 1, 1, 1,
-1.178436, -0.6059289, -0.9066756, 1, 1, 1, 1, 1,
-1.173991, 0.1183349, -1.475901, 1, 1, 1, 1, 1,
-1.171476, -0.2783983, -1.99386, 1, 1, 1, 1, 1,
-1.166134, -0.1451007, -2.993314, 1, 1, 1, 1, 1,
-1.159057, 0.7999454, -0.7041618, 1, 1, 1, 1, 1,
-1.147777, -0.00708255, -3.428135, 1, 1, 1, 1, 1,
-1.147429, -0.3169602, -0.5508705, 1, 1, 1, 1, 1,
-1.143772, -2.279326, -3.332581, 1, 1, 1, 1, 1,
-1.143249, -0.9018208, -1.971405, 1, 1, 1, 1, 1,
-1.14122, 0.3629403, -3.819478, 1, 1, 1, 1, 1,
-1.137878, -0.7607799, -0.4170457, 1, 1, 1, 1, 1,
-1.134842, -0.09127844, -0.7389229, 1, 1, 1, 1, 1,
-1.119496, -0.5562494, -2.016637, 1, 1, 1, 1, 1,
-1.112335, -0.2826771, -2.581011, 0, 0, 1, 1, 1,
-1.093314, -0.3907304, -2.412925, 1, 0, 0, 1, 1,
-1.090567, -1.326507, -4.185308, 1, 0, 0, 1, 1,
-1.086872, 0.8200119, 0.1839646, 1, 0, 0, 1, 1,
-1.067754, -1.851193, 0.1197484, 1, 0, 0, 1, 1,
-1.067331, 0.7921941, -2.356925, 1, 0, 0, 1, 1,
-1.058825, 0.363321, -1.450045, 0, 0, 0, 1, 1,
-1.047033, -0.4981787, -1.752568, 0, 0, 0, 1, 1,
-1.043799, -0.3137124, -1.470582, 0, 0, 0, 1, 1,
-1.042135, 0.5432627, -2.218322, 0, 0, 0, 1, 1,
-1.041572, 0.5454478, -1.351047, 0, 0, 0, 1, 1,
-1.037461, -1.081704, -2.297764, 0, 0, 0, 1, 1,
-1.03514, -1.285411, -3.257703, 0, 0, 0, 1, 1,
-1.033123, 0.1843197, -0.3884288, 1, 1, 1, 1, 1,
-1.020333, -0.07102319, -2.086642, 1, 1, 1, 1, 1,
-1.019931, -0.2374136, -1.311958, 1, 1, 1, 1, 1,
-1.016057, 0.2931078, -0.1245037, 1, 1, 1, 1, 1,
-1.011209, -1.499419, -2.695289, 1, 1, 1, 1, 1,
-0.9949605, 0.8726273, -0.2264067, 1, 1, 1, 1, 1,
-0.9843752, 2.146563, 1.062632, 1, 1, 1, 1, 1,
-0.9831175, 0.4075728, 0.5656268, 1, 1, 1, 1, 1,
-0.9790654, -0.2287052, -0.7583314, 1, 1, 1, 1, 1,
-0.9734151, -1.516207, -1.358753, 1, 1, 1, 1, 1,
-0.9705789, 0.1816187, -0.2270666, 1, 1, 1, 1, 1,
-0.9701384, 1.370144, 1.800431, 1, 1, 1, 1, 1,
-0.9679684, -0.4661331, -0.9224762, 1, 1, 1, 1, 1,
-0.9611329, 0.02942825, -3.183391, 1, 1, 1, 1, 1,
-0.959206, -1.093857, -3.353566, 1, 1, 1, 1, 1,
-0.9564233, 1.036608, -1.425793, 0, 0, 1, 1, 1,
-0.9489752, 1.43859, -1.746463, 1, 0, 0, 1, 1,
-0.9409996, -0.2097984, -0.9460991, 1, 0, 0, 1, 1,
-0.9385965, 0.3062983, -2.090302, 1, 0, 0, 1, 1,
-0.937211, -0.3122862, -2.818567, 1, 0, 0, 1, 1,
-0.9369086, -0.7746548, -3.567271, 1, 0, 0, 1, 1,
-0.9287257, -0.5711585, -1.98503, 0, 0, 0, 1, 1,
-0.9276155, 1.360578, -1.977385, 0, 0, 0, 1, 1,
-0.9269826, -0.1848909, -1.120639, 0, 0, 0, 1, 1,
-0.9249878, 0.4056473, -0.8643082, 0, 0, 0, 1, 1,
-0.9228451, -0.5403132, -1.163892, 0, 0, 0, 1, 1,
-0.91754, 0.107162, -1.232581, 0, 0, 0, 1, 1,
-0.9152674, 0.6336784, 0.5868431, 0, 0, 0, 1, 1,
-0.9139736, -0.663638, -3.788234, 1, 1, 1, 1, 1,
-0.9104329, -0.1104355, -3.504665, 1, 1, 1, 1, 1,
-0.9019508, -1.554789, -2.060221, 1, 1, 1, 1, 1,
-0.9012076, -0.6241527, -1.017336, 1, 1, 1, 1, 1,
-0.8963506, 0.6200909, -1.330408, 1, 1, 1, 1, 1,
-0.8950878, -2.158111, -2.601963, 1, 1, 1, 1, 1,
-0.8925762, 1.27416, -1.31497, 1, 1, 1, 1, 1,
-0.8914212, -0.3902636, -1.178821, 1, 1, 1, 1, 1,
-0.8863629, 0.9271668, -0.2229581, 1, 1, 1, 1, 1,
-0.8858095, -0.3790428, -1.767763, 1, 1, 1, 1, 1,
-0.8790481, 0.2075352, -0.6235665, 1, 1, 1, 1, 1,
-0.8697821, 2.143552, 0.8467419, 1, 1, 1, 1, 1,
-0.8667102, 1.18503, -1.089532, 1, 1, 1, 1, 1,
-0.8649212, -0.9146323, -2.340632, 1, 1, 1, 1, 1,
-0.8646011, 0.08792926, -1.237518, 1, 1, 1, 1, 1,
-0.864178, 0.6361653, 0.09642432, 0, 0, 1, 1, 1,
-0.8519276, 1.655382, -0.03338729, 1, 0, 0, 1, 1,
-0.8506221, 2.079292, -0.4817082, 1, 0, 0, 1, 1,
-0.8504388, 0.9151753, -0.3059795, 1, 0, 0, 1, 1,
-0.846072, 2.62851, -1.884088, 1, 0, 0, 1, 1,
-0.8450971, 0.2566765, -0.8196566, 1, 0, 0, 1, 1,
-0.8447275, -0.2732854, -1.185794, 0, 0, 0, 1, 1,
-0.8378671, -0.8177518, -2.911619, 0, 0, 0, 1, 1,
-0.8360282, -0.4805656, -2.698831, 0, 0, 0, 1, 1,
-0.8315229, 0.319994, -1.013715, 0, 0, 0, 1, 1,
-0.8314938, -1.319761, -3.377121, 0, 0, 0, 1, 1,
-0.8305176, -0.3618858, -2.171289, 0, 0, 0, 1, 1,
-0.8299313, -1.045615, -3.6241, 0, 0, 0, 1, 1,
-0.8295011, 1.403518, 0.4424558, 1, 1, 1, 1, 1,
-0.8260748, 0.1134384, -1.525801, 1, 1, 1, 1, 1,
-0.8257678, 1.128169, -2.692344, 1, 1, 1, 1, 1,
-0.8182006, 1.379416, -0.1636425, 1, 1, 1, 1, 1,
-0.8158175, -2.203382, -3.586557, 1, 1, 1, 1, 1,
-0.811295, 1.704592, -1.643447, 1, 1, 1, 1, 1,
-0.8080159, -0.4845171, -2.668793, 1, 1, 1, 1, 1,
-0.8051624, -1.113777, -2.030202, 1, 1, 1, 1, 1,
-0.7992616, -0.9578266, -1.118872, 1, 1, 1, 1, 1,
-0.7819009, -0.06417492, -0.9564348, 1, 1, 1, 1, 1,
-0.7801923, 1.839611, -1.038015, 1, 1, 1, 1, 1,
-0.7787593, -0.7329659, -3.383126, 1, 1, 1, 1, 1,
-0.778627, -0.3668137, -2.732897, 1, 1, 1, 1, 1,
-0.7781039, -2.203891, -4.35462, 1, 1, 1, 1, 1,
-0.7775404, 0.6953192, 0.2901122, 1, 1, 1, 1, 1,
-0.7771792, -0.3082953, -1.332687, 0, 0, 1, 1, 1,
-0.776854, 0.9325942, -0.036821, 1, 0, 0, 1, 1,
-0.7727449, 0.1691485, -4.236565, 1, 0, 0, 1, 1,
-0.7673415, 0.7584414, -0.5448564, 1, 0, 0, 1, 1,
-0.7630404, -0.2776059, -0.982469, 1, 0, 0, 1, 1,
-0.7627057, 1.274947, -0.6129753, 1, 0, 0, 1, 1,
-0.7622431, -0.4772136, -1.486788, 0, 0, 0, 1, 1,
-0.7611374, 1.003086, 0.06940729, 0, 0, 0, 1, 1,
-0.7591686, -1.25251, -2.556392, 0, 0, 0, 1, 1,
-0.7537344, 0.2942472, -3.383231, 0, 0, 0, 1, 1,
-0.7499869, 0.02060137, -2.378583, 0, 0, 0, 1, 1,
-0.745428, -0.1115017, -0.4632737, 0, 0, 0, 1, 1,
-0.744803, 0.6278208, -1.284551, 0, 0, 0, 1, 1,
-0.741045, 0.6279539, -1.540525, 1, 1, 1, 1, 1,
-0.7403221, 0.1133794, -1.948228, 1, 1, 1, 1, 1,
-0.7391476, -0.6403762, -5.638133, 1, 1, 1, 1, 1,
-0.7348416, -0.1411747, -2.323943, 1, 1, 1, 1, 1,
-0.7240958, -0.330036, -2.417608, 1, 1, 1, 1, 1,
-0.7231493, -0.7515675, -2.193911, 1, 1, 1, 1, 1,
-0.7216221, -2.116177, -1.864834, 1, 1, 1, 1, 1,
-0.7207977, 0.5705283, -1.870212, 1, 1, 1, 1, 1,
-0.719741, 0.7914714, -2.141825, 1, 1, 1, 1, 1,
-0.718571, -2.002541, -2.146518, 1, 1, 1, 1, 1,
-0.7183838, 0.01793766, -1.419575, 1, 1, 1, 1, 1,
-0.7170727, 0.8681539, -1.059488, 1, 1, 1, 1, 1,
-0.7084289, -0.5119537, -2.916345, 1, 1, 1, 1, 1,
-0.7070628, -0.456573, -0.3018996, 1, 1, 1, 1, 1,
-0.7067284, -0.1009199, -0.9965749, 1, 1, 1, 1, 1,
-0.7016275, 1.464098, 1.695765, 0, 0, 1, 1, 1,
-0.700392, 0.05973575, -1.267939, 1, 0, 0, 1, 1,
-0.6933097, -0.3242415, -1.482823, 1, 0, 0, 1, 1,
-0.6878825, -0.5962678, -1.330095, 1, 0, 0, 1, 1,
-0.6732451, 0.2286614, -2.629155, 1, 0, 0, 1, 1,
-0.6678331, 0.4019056, -1.314631, 1, 0, 0, 1, 1,
-0.6641887, -0.2325408, -1.307991, 0, 0, 0, 1, 1,
-0.6629318, 0.3235081, -0.01890541, 0, 0, 0, 1, 1,
-0.6625762, -0.08168869, -2.084396, 0, 0, 0, 1, 1,
-0.6596389, 0.6333645, -1.599733, 0, 0, 0, 1, 1,
-0.6591716, -0.6906316, -2.853119, 0, 0, 0, 1, 1,
-0.658901, 1.476704, -0.7274703, 0, 0, 0, 1, 1,
-0.6578655, -0.6112304, -2.004358, 0, 0, 0, 1, 1,
-0.646648, -1.296755, 0.1953617, 1, 1, 1, 1, 1,
-0.641598, 0.1937648, -1.373591, 1, 1, 1, 1, 1,
-0.6389404, 1.047541, -1.570254, 1, 1, 1, 1, 1,
-0.6381813, 1.107804, 0.2357517, 1, 1, 1, 1, 1,
-0.6366109, 0.06798008, -3.444507, 1, 1, 1, 1, 1,
-0.6333996, 0.3821467, -0.9106652, 1, 1, 1, 1, 1,
-0.631483, 1.754266, 1.390277, 1, 1, 1, 1, 1,
-0.6297479, -0.6488324, -0.5687873, 1, 1, 1, 1, 1,
-0.6296254, 0.2886034, 0.6246612, 1, 1, 1, 1, 1,
-0.6294827, -0.3348967, -2.709441, 1, 1, 1, 1, 1,
-0.6290007, -0.1801355, -2.04206, 1, 1, 1, 1, 1,
-0.6273753, -0.5852688, -3.228429, 1, 1, 1, 1, 1,
-0.6214418, 0.3653459, -1.691743, 1, 1, 1, 1, 1,
-0.6210969, -0.5991857, -2.232355, 1, 1, 1, 1, 1,
-0.6128675, 0.9688141, -2.203891, 1, 1, 1, 1, 1,
-0.6127978, 0.1295442, -1.903234, 0, 0, 1, 1, 1,
-0.6079081, 0.7189149, -0.8395333, 1, 0, 0, 1, 1,
-0.6053742, -0.5683909, -1.878278, 1, 0, 0, 1, 1,
-0.604331, 0.04408439, -1.449475, 1, 0, 0, 1, 1,
-0.6030533, 1.725632, 0.7675318, 1, 0, 0, 1, 1,
-0.6011947, 1.340581, 0.8027092, 1, 0, 0, 1, 1,
-0.6006143, -0.2220539, -3.059012, 0, 0, 0, 1, 1,
-0.5993412, -0.8514737, -3.012284, 0, 0, 0, 1, 1,
-0.5972137, -0.8340689, -2.36099, 0, 0, 0, 1, 1,
-0.5904704, 0.3284619, -1.369934, 0, 0, 0, 1, 1,
-0.5837747, 1.488787, -2.022534, 0, 0, 0, 1, 1,
-0.5827145, -0.5911177, -3.444288, 0, 0, 0, 1, 1,
-0.5742257, -0.7589775, -1.738027, 0, 0, 0, 1, 1,
-0.5720733, 2.507108, -3.314973, 1, 1, 1, 1, 1,
-0.5684869, 0.5645, -1.655126, 1, 1, 1, 1, 1,
-0.5615627, -0.5545391, -2.087994, 1, 1, 1, 1, 1,
-0.5568252, -0.04366117, -1.282198, 1, 1, 1, 1, 1,
-0.5564114, -0.5315783, -2.189874, 1, 1, 1, 1, 1,
-0.5540405, 1.524579, -0.19796, 1, 1, 1, 1, 1,
-0.5536731, -1.645666, -2.822259, 1, 1, 1, 1, 1,
-0.5530432, -0.002953614, -1.738889, 1, 1, 1, 1, 1,
-0.5525446, -0.8024309, -3.071999, 1, 1, 1, 1, 1,
-0.5523254, 0.7319351, -0.9415799, 1, 1, 1, 1, 1,
-0.5506541, 0.0897067, -2.653883, 1, 1, 1, 1, 1,
-0.544117, -1.269891, -4.548918, 1, 1, 1, 1, 1,
-0.5392288, 0.7348643, 1.59608, 1, 1, 1, 1, 1,
-0.5387787, 1.308563, 0.6856862, 1, 1, 1, 1, 1,
-0.5326248, -0.3029975, -2.797127, 1, 1, 1, 1, 1,
-0.5293359, 0.3612658, -3.524292, 0, 0, 1, 1, 1,
-0.5291404, 0.1847244, -1.59746, 1, 0, 0, 1, 1,
-0.5249914, -0.1404503, -1.42611, 1, 0, 0, 1, 1,
-0.5200134, 0.06464202, -1.515022, 1, 0, 0, 1, 1,
-0.5184795, 0.7569579, -2.947182, 1, 0, 0, 1, 1,
-0.514985, 0.654605, -1.522872, 1, 0, 0, 1, 1,
-0.5140231, -0.06512014, -3.466694, 0, 0, 0, 1, 1,
-0.5137798, -0.6246717, -4.549043, 0, 0, 0, 1, 1,
-0.512409, 0.9045429, -0.6966065, 0, 0, 0, 1, 1,
-0.5095162, 0.1408172, 0.3909587, 0, 0, 0, 1, 1,
-0.5030932, -0.855618, -2.800819, 0, 0, 0, 1, 1,
-0.50265, -0.4327106, -2.236152, 0, 0, 0, 1, 1,
-0.4983229, -0.1410031, -1.270354, 0, 0, 0, 1, 1,
-0.4901802, -0.6396877, -1.976689, 1, 1, 1, 1, 1,
-0.4761121, 1.106343, -1.524056, 1, 1, 1, 1, 1,
-0.4758096, 1.000733, -1.149585, 1, 1, 1, 1, 1,
-0.4750422, 0.3651304, -2.032183, 1, 1, 1, 1, 1,
-0.4729362, -0.3475198, -1.64183, 1, 1, 1, 1, 1,
-0.465091, -0.2809428, -2.703174, 1, 1, 1, 1, 1,
-0.4606495, -2.25482, -3.550286, 1, 1, 1, 1, 1,
-0.4558718, -0.5135989, 0.1089892, 1, 1, 1, 1, 1,
-0.4524643, 0.05042048, -1.27988, 1, 1, 1, 1, 1,
-0.4511401, 0.4210092, -1.822436, 1, 1, 1, 1, 1,
-0.4475985, -1.583235, -2.139158, 1, 1, 1, 1, 1,
-0.4443354, -0.754452, -3.510401, 1, 1, 1, 1, 1,
-0.4418018, -1.096931, -1.642227, 1, 1, 1, 1, 1,
-0.4380605, -1.265067, -2.174275, 1, 1, 1, 1, 1,
-0.436767, 0.2537962, -1.902025, 1, 1, 1, 1, 1,
-0.4361307, -0.8083627, -2.408869, 0, 0, 1, 1, 1,
-0.4321879, 1.011131, 0.4466451, 1, 0, 0, 1, 1,
-0.4256488, 0.03132347, -1.114648, 1, 0, 0, 1, 1,
-0.4252803, 1.492263, -0.5383936, 1, 0, 0, 1, 1,
-0.4207262, -0.2640128, -1.28936, 1, 0, 0, 1, 1,
-0.420593, 0.3085711, -1.614667, 1, 0, 0, 1, 1,
-0.415148, 0.5779497, 0.2870266, 0, 0, 0, 1, 1,
-0.4136874, -1.132529, -2.85458, 0, 0, 0, 1, 1,
-0.4123918, -2.213965, -2.799173, 0, 0, 0, 1, 1,
-0.410345, 0.5684931, -1.839005, 0, 0, 0, 1, 1,
-0.4090701, -2.254514, -2.578125, 0, 0, 0, 1, 1,
-0.4079534, -1.778658, -2.457598, 0, 0, 0, 1, 1,
-0.4056884, -1.440826, -2.850201, 0, 0, 0, 1, 1,
-0.4050188, -0.07184792, -3.848268, 1, 1, 1, 1, 1,
-0.4045723, -0.9477402, -3.229871, 1, 1, 1, 1, 1,
-0.4021724, 0.6496713, 0.2080427, 1, 1, 1, 1, 1,
-0.3954941, 1.4688, 2.086816, 1, 1, 1, 1, 1,
-0.395166, -0.6340049, -2.798873, 1, 1, 1, 1, 1,
-0.395059, -1.36507, -2.73462, 1, 1, 1, 1, 1,
-0.391566, 0.6854481, -1.42543, 1, 1, 1, 1, 1,
-0.38475, 1.084855, 0.6970614, 1, 1, 1, 1, 1,
-0.383522, 0.6764928, 0.9584536, 1, 1, 1, 1, 1,
-0.3812058, 0.1214581, -0.2631032, 1, 1, 1, 1, 1,
-0.377477, -0.1459627, -2.391775, 1, 1, 1, 1, 1,
-0.3691887, 0.1916951, -1.718853, 1, 1, 1, 1, 1,
-0.3685792, 0.3254082, 0.3681415, 1, 1, 1, 1, 1,
-0.3669049, -0.5160767, -0.8063261, 1, 1, 1, 1, 1,
-0.366474, -1.978404, -2.844809, 1, 1, 1, 1, 1,
-0.3617496, 1.383048, -0.7607878, 0, 0, 1, 1, 1,
-0.359918, 1.027764, -0.7430241, 1, 0, 0, 1, 1,
-0.3590589, 1.374274, -1.116773, 1, 0, 0, 1, 1,
-0.3572858, 1.845238, 0.2519636, 1, 0, 0, 1, 1,
-0.356484, -3.111084, -3.068146, 1, 0, 0, 1, 1,
-0.3506378, -0.729736, -2.702532, 1, 0, 0, 1, 1,
-0.3442217, -0.2602595, -2.683007, 0, 0, 0, 1, 1,
-0.3403488, -0.845566, -5.005569, 0, 0, 0, 1, 1,
-0.339975, -0.4896558, -2.245306, 0, 0, 0, 1, 1,
-0.3347708, -1.327275, -3.11494, 0, 0, 0, 1, 1,
-0.3342433, 0.3640772, -1.751108, 0, 0, 0, 1, 1,
-0.3328822, -0.08061977, -1.732296, 0, 0, 0, 1, 1,
-0.330594, 0.3145199, -1.833207, 0, 0, 0, 1, 1,
-0.325637, -1.309818, -3.491671, 1, 1, 1, 1, 1,
-0.3240412, 1.349385, -0.7770265, 1, 1, 1, 1, 1,
-0.3226559, 0.8292102, -2.915969, 1, 1, 1, 1, 1,
-0.3226018, -0.3661794, -2.09793, 1, 1, 1, 1, 1,
-0.3156923, 2.749311, -0.2661489, 1, 1, 1, 1, 1,
-0.3142947, -2.477806, -1.619619, 1, 1, 1, 1, 1,
-0.3127357, -0.06120032, -2.543899, 1, 1, 1, 1, 1,
-0.3101005, -1.557754, -2.315321, 1, 1, 1, 1, 1,
-0.3093003, -0.08249034, -1.855002, 1, 1, 1, 1, 1,
-0.3079358, -1.353369, -2.919346, 1, 1, 1, 1, 1,
-0.3065864, 0.2366312, 0.4009337, 1, 1, 1, 1, 1,
-0.304275, -0.3805376, -3.533783, 1, 1, 1, 1, 1,
-0.3024517, -1.099165, -3.231598, 1, 1, 1, 1, 1,
-0.3009854, 0.0888019, -2.224351, 1, 1, 1, 1, 1,
-0.2987064, -0.5016593, -3.34326, 1, 1, 1, 1, 1,
-0.2933123, 0.05840021, -0.3639877, 0, 0, 1, 1, 1,
-0.292824, 0.5868431, -0.2729875, 1, 0, 0, 1, 1,
-0.2918648, -0.2084202, -3.135001, 1, 0, 0, 1, 1,
-0.2905047, -0.8464992, -2.974173, 1, 0, 0, 1, 1,
-0.2790877, 0.8926412, -1.35005, 1, 0, 0, 1, 1,
-0.2711769, -0.5200685, -3.74031, 1, 0, 0, 1, 1,
-0.2655444, -0.7261452, -3.413303, 0, 0, 0, 1, 1,
-0.2639582, -0.9780396, -2.757183, 0, 0, 0, 1, 1,
-0.2627937, -1.184948, -3.229037, 0, 0, 0, 1, 1,
-0.258571, 1.138033, 0.8443915, 0, 0, 0, 1, 1,
-0.2545819, 1.111774, 0.1528223, 0, 0, 0, 1, 1,
-0.2523832, -0.0555396, -0.2574065, 0, 0, 0, 1, 1,
-0.2499134, 0.5218987, -2.234634, 0, 0, 0, 1, 1,
-0.2451883, 1.179774, 0.9094793, 1, 1, 1, 1, 1,
-0.2450623, 0.07693474, -1.019198, 1, 1, 1, 1, 1,
-0.2450437, 0.8723199, -0.792407, 1, 1, 1, 1, 1,
-0.2417097, 1.915371, -0.5570133, 1, 1, 1, 1, 1,
-0.2372382, -0.9810746, -3.091213, 1, 1, 1, 1, 1,
-0.2342479, 0.5748312, -1.024358, 1, 1, 1, 1, 1,
-0.2309694, 1.914721, -0.6891787, 1, 1, 1, 1, 1,
-0.2304595, 0.04022147, -1.247234, 1, 1, 1, 1, 1,
-0.2296862, -0.669407, -0.2915769, 1, 1, 1, 1, 1,
-0.2285474, -1.578529, -2.508884, 1, 1, 1, 1, 1,
-0.2245094, -1.669452, -4.001023, 1, 1, 1, 1, 1,
-0.2139382, 0.188755, 0.1569734, 1, 1, 1, 1, 1,
-0.2077342, 0.3524924, 1.073282, 1, 1, 1, 1, 1,
-0.2077056, -0.1789238, -2.88681, 1, 1, 1, 1, 1,
-0.2076613, -0.2860161, -2.247422, 1, 1, 1, 1, 1,
-0.2072918, 1.396333, -0.1095488, 0, 0, 1, 1, 1,
-0.2068097, 0.1100541, -1.495892, 1, 0, 0, 1, 1,
-0.2040094, 0.1544986, -1.721789, 1, 0, 0, 1, 1,
-0.2008196, 1.539711, -1.273249, 1, 0, 0, 1, 1,
-0.1970698, -0.5861949, -2.381668, 1, 0, 0, 1, 1,
-0.1956176, 0.1135132, -1.85313, 1, 0, 0, 1, 1,
-0.1899056, 0.08199153, 0.68294, 0, 0, 0, 1, 1,
-0.1891069, 0.4581257, -0.8386448, 0, 0, 0, 1, 1,
-0.1860533, -0.3270237, -0.9386486, 0, 0, 0, 1, 1,
-0.1832388, -0.09758999, -2.459541, 0, 0, 0, 1, 1,
-0.1831661, -1.752073, -1.424235, 0, 0, 0, 1, 1,
-0.1822569, -1.166156, -2.994442, 0, 0, 0, 1, 1,
-0.1804053, -0.6482201, -2.799938, 0, 0, 0, 1, 1,
-0.1779463, -0.3619886, -2.048153, 1, 1, 1, 1, 1,
-0.177369, 0.9986148, 0.9984704, 1, 1, 1, 1, 1,
-0.170909, -0.1799547, -2.561186, 1, 1, 1, 1, 1,
-0.1626716, 2.084331, -0.495931, 1, 1, 1, 1, 1,
-0.1621073, 1.11323, 0.1009607, 1, 1, 1, 1, 1,
-0.1570889, -1.836861, -2.710719, 1, 1, 1, 1, 1,
-0.1522289, 1.077793, -0.003971931, 1, 1, 1, 1, 1,
-0.1499798, 1.460359, -0.3239959, 1, 1, 1, 1, 1,
-0.1464801, -1.046589, -3.116332, 1, 1, 1, 1, 1,
-0.1460298, 0.4290763, -2.095292, 1, 1, 1, 1, 1,
-0.1447648, -1.180508, -1.104316, 1, 1, 1, 1, 1,
-0.1446453, -1.022637, -2.689098, 1, 1, 1, 1, 1,
-0.1441757, -0.6683363, -2.34986, 1, 1, 1, 1, 1,
-0.1427383, -1.271358, -3.094853, 1, 1, 1, 1, 1,
-0.1420257, -0.06415269, -2.965492, 1, 1, 1, 1, 1,
-0.131354, -0.2419788, -2.085982, 0, 0, 1, 1, 1,
-0.1285922, 0.6585669, -1.199479, 1, 0, 0, 1, 1,
-0.1268008, -0.8305031, -0.9061809, 1, 0, 0, 1, 1,
-0.1245568, 0.631184, -0.3643977, 1, 0, 0, 1, 1,
-0.1245019, -0.02586145, -3.570998, 1, 0, 0, 1, 1,
-0.1188124, 1.733352, -0.5545211, 1, 0, 0, 1, 1,
-0.1164576, 1.021787, -0.1053029, 0, 0, 0, 1, 1,
-0.115244, -1.542817, -2.702306, 0, 0, 0, 1, 1,
-0.1102956, 0.5729352, -1.026491, 0, 0, 0, 1, 1,
-0.09607477, -0.9101604, -5.394353, 0, 0, 0, 1, 1,
-0.0949462, 0.7410914, 0.1549821, 0, 0, 0, 1, 1,
-0.08957004, 0.4411743, -0.6528931, 0, 0, 0, 1, 1,
-0.08325779, 0.8437757, -0.8904318, 0, 0, 0, 1, 1,
-0.07999405, 0.6645514, -0.1755659, 1, 1, 1, 1, 1,
-0.07802342, 0.06680657, -1.00664, 1, 1, 1, 1, 1,
-0.07000275, -0.02653521, -2.10079, 1, 1, 1, 1, 1,
-0.06420455, -0.5584941, -4.310215, 1, 1, 1, 1, 1,
-0.06316842, 0.2750721, -1.401399, 1, 1, 1, 1, 1,
-0.06194797, 1.638904, -1.058068, 1, 1, 1, 1, 1,
-0.06003486, -1.108283, -2.884602, 1, 1, 1, 1, 1,
-0.05830675, -1.320402, -3.686453, 1, 1, 1, 1, 1,
-0.05773666, 1.096005, -1.187868, 1, 1, 1, 1, 1,
-0.05702612, -0.733609, -3.019263, 1, 1, 1, 1, 1,
-0.0535629, 2.595596, 1.352463, 1, 1, 1, 1, 1,
-0.05055514, 0.5535651, -0.9406344, 1, 1, 1, 1, 1,
-0.05017062, -1.194143, -4.134812, 1, 1, 1, 1, 1,
-0.0434651, -0.3287291, -2.382571, 1, 1, 1, 1, 1,
-0.04239298, -1.190369, -2.872871, 1, 1, 1, 1, 1,
-0.04086098, -0.7381347, -2.854582, 0, 0, 1, 1, 1,
-0.0402756, -0.1925376, -3.165461, 1, 0, 0, 1, 1,
-0.03773408, 0.2320232, 0.2079246, 1, 0, 0, 1, 1,
-0.03281736, 0.6467698, 0.02420905, 1, 0, 0, 1, 1,
-0.03168889, 0.8998811, 0.7000805, 1, 0, 0, 1, 1,
-0.02996155, 1.080585, 1.190041, 1, 0, 0, 1, 1,
-0.02568695, 0.4391029, -1.855533, 0, 0, 0, 1, 1,
-0.02516652, 0.6694874, -1.60436, 0, 0, 0, 1, 1,
-0.02409019, 1.61111, -3.489817, 0, 0, 0, 1, 1,
-0.01522291, -0.1614847, -3.510383, 0, 0, 0, 1, 1,
-0.01161981, -0.1945291, -2.745698, 0, 0, 0, 1, 1,
-0.008171019, -0.7100126, -2.90316, 0, 0, 0, 1, 1,
-0.00775603, -1.775566, -2.785072, 0, 0, 0, 1, 1,
-0.007497638, -0.5994582, -3.510782, 1, 1, 1, 1, 1,
-0.006090803, 0.2647848, 0.8048581, 1, 1, 1, 1, 1,
-0.005439962, 0.7151279, -1.875402, 1, 1, 1, 1, 1,
-0.005344209, 1.456392, -1.53113, 1, 1, 1, 1, 1,
-0.002733028, 0.1154318, -1.297021, 1, 1, 1, 1, 1,
0.002049486, 1.038701, -0.06522989, 1, 1, 1, 1, 1,
0.003951279, 1.031674, -0.1060538, 1, 1, 1, 1, 1,
0.006632654, -0.5439526, 4.454639, 1, 1, 1, 1, 1,
0.01136524, -0.3475116, 5.964311, 1, 1, 1, 1, 1,
0.01420192, 0.04153315, -1.092772, 1, 1, 1, 1, 1,
0.01714309, 0.1290427, -0.2459226, 1, 1, 1, 1, 1,
0.01797334, 0.2786083, -0.3941284, 1, 1, 1, 1, 1,
0.02294676, 0.8112382, -0.3951519, 1, 1, 1, 1, 1,
0.02570552, -1.204098, 4.414993, 1, 1, 1, 1, 1,
0.03025425, 0.9593799, -0.6096082, 1, 1, 1, 1, 1,
0.03031235, 0.07550635, 2.893772, 0, 0, 1, 1, 1,
0.03080848, -0.4691477, 3.498778, 1, 0, 0, 1, 1,
0.03557798, 2.943912, -0.4999444, 1, 0, 0, 1, 1,
0.03665315, -0.8146641, 2.038776, 1, 0, 0, 1, 1,
0.04006754, -0.03095704, 1.98465, 1, 0, 0, 1, 1,
0.04008928, -0.9592762, 3.183555, 1, 0, 0, 1, 1,
0.04383541, -0.1277562, 4.179825, 0, 0, 0, 1, 1,
0.04431268, -0.7071463, 5.234333, 0, 0, 0, 1, 1,
0.04434278, -0.492212, 3.279628, 0, 0, 0, 1, 1,
0.04531991, -0.6423891, 2.679841, 0, 0, 0, 1, 1,
0.04717856, 0.01346361, 0.3151936, 0, 0, 0, 1, 1,
0.04861548, 0.545611, 2.643871, 0, 0, 0, 1, 1,
0.05920982, -0.3769343, 3.281954, 0, 0, 0, 1, 1,
0.05959249, 0.1219653, 1.594809, 1, 1, 1, 1, 1,
0.06157193, 1.842771, -0.5228827, 1, 1, 1, 1, 1,
0.06370889, 0.4588954, 0.2050956, 1, 1, 1, 1, 1,
0.06754232, 1.78155, -0.7212378, 1, 1, 1, 1, 1,
0.06948979, -1.286779, 2.557162, 1, 1, 1, 1, 1,
0.07157213, 0.4016135, 1.773032, 1, 1, 1, 1, 1,
0.07341325, 0.5877133, -0.3498358, 1, 1, 1, 1, 1,
0.07486453, -0.1535809, 1.686235, 1, 1, 1, 1, 1,
0.0757523, -0.5949577, 4.869636, 1, 1, 1, 1, 1,
0.07660017, -0.481315, 2.171856, 1, 1, 1, 1, 1,
0.08202752, 1.430308, -0.9779229, 1, 1, 1, 1, 1,
0.08893516, 0.8556468, -1.409166, 1, 1, 1, 1, 1,
0.09658635, 0.2430865, 0.3932135, 1, 1, 1, 1, 1,
0.09865878, 0.07733026, 0.2317748, 1, 1, 1, 1, 1,
0.1035869, -0.2748415, 3.28694, 1, 1, 1, 1, 1,
0.1039656, 0.4394318, 0.3677991, 0, 0, 1, 1, 1,
0.1052795, -1.038308, 2.298017, 1, 0, 0, 1, 1,
0.1108029, -0.7480376, 3.197808, 1, 0, 0, 1, 1,
0.1114383, -1.567547, 5.490111, 1, 0, 0, 1, 1,
0.1143781, -0.007684093, 2.153372, 1, 0, 0, 1, 1,
0.1150942, 1.386976, -0.1758002, 1, 0, 0, 1, 1,
0.1208196, -0.2495111, 2.274289, 0, 0, 0, 1, 1,
0.1227979, -0.5554036, 3.172308, 0, 0, 0, 1, 1,
0.1371378, -0.03914914, 1.573721, 0, 0, 0, 1, 1,
0.1376344, -0.5772946, 3.716055, 0, 0, 0, 1, 1,
0.1395788, 1.681216, -0.4877256, 0, 0, 0, 1, 1,
0.1415957, -2.050975, 4.487426, 0, 0, 0, 1, 1,
0.1427121, 0.2987164, 0.362747, 0, 0, 0, 1, 1,
0.1444909, 0.1501175, -1.104295, 1, 1, 1, 1, 1,
0.1447543, 0.04832274, 1.853975, 1, 1, 1, 1, 1,
0.1456568, -0.9574894, 1.145585, 1, 1, 1, 1, 1,
0.1457084, 0.07721903, 0.0604586, 1, 1, 1, 1, 1,
0.1470056, 0.495722, 0.2655267, 1, 1, 1, 1, 1,
0.152124, -0.3854392, 2.388817, 1, 1, 1, 1, 1,
0.1554403, -1.423955, 2.54163, 1, 1, 1, 1, 1,
0.1652229, 0.4939996, 0.4687218, 1, 1, 1, 1, 1,
0.1652565, 0.3801465, 0.6120993, 1, 1, 1, 1, 1,
0.1667666, -1.098805, 3.280258, 1, 1, 1, 1, 1,
0.1682739, -1.183904, 2.522596, 1, 1, 1, 1, 1,
0.1690841, -1.872425, 1.903345, 1, 1, 1, 1, 1,
0.1721674, -0.9201652, 1.595191, 1, 1, 1, 1, 1,
0.1762782, -0.0676955, 1.039303, 1, 1, 1, 1, 1,
0.1785911, -1.834418, 4.03889, 1, 1, 1, 1, 1,
0.1832079, -0.5157833, 2.987094, 0, 0, 1, 1, 1,
0.1852576, -0.5924477, 2.451876, 1, 0, 0, 1, 1,
0.1853542, 0.06745471, -0.8468012, 1, 0, 0, 1, 1,
0.1855251, -0.8930454, 5.02528, 1, 0, 0, 1, 1,
0.1865571, 0.8040569, -1.45758, 1, 0, 0, 1, 1,
0.1952223, -0.005832289, 1.679467, 1, 0, 0, 1, 1,
0.1993362, -0.1971473, 2.174972, 0, 0, 0, 1, 1,
0.2005954, -0.1782437, 3.041793, 0, 0, 0, 1, 1,
0.2056349, -0.1948632, 1.959607, 0, 0, 0, 1, 1,
0.2109074, 0.8243834, 2.622401, 0, 0, 0, 1, 1,
0.2114359, 0.3563449, -0.3792875, 0, 0, 0, 1, 1,
0.2205776, -0.4726579, 3.34033, 0, 0, 0, 1, 1,
0.2221765, -0.4147993, 1.356273, 0, 0, 0, 1, 1,
0.2312484, -2.157684, 3.214977, 1, 1, 1, 1, 1,
0.235195, -1.532024, 0.4307479, 1, 1, 1, 1, 1,
0.2354371, 0.302746, -0.1430382, 1, 1, 1, 1, 1,
0.2392326, -0.9939583, 3.06101, 1, 1, 1, 1, 1,
0.2400493, -0.5638195, 4.48625, 1, 1, 1, 1, 1,
0.2411405, 0.3543875, 0.6501121, 1, 1, 1, 1, 1,
0.242033, -0.6520492, 4.104469, 1, 1, 1, 1, 1,
0.2497945, -1.360898, 3.884822, 1, 1, 1, 1, 1,
0.2501608, 1.031476, 1.692894, 1, 1, 1, 1, 1,
0.2510867, 0.7883658, 0.298783, 1, 1, 1, 1, 1,
0.2573759, 0.6329768, 0.05926989, 1, 1, 1, 1, 1,
0.2597766, -1.610174, 2.92786, 1, 1, 1, 1, 1,
0.2600565, -1.954489, 2.458829, 1, 1, 1, 1, 1,
0.2602325, 0.6730728, 0.02900342, 1, 1, 1, 1, 1,
0.2626249, -0.03241549, 0.2861767, 1, 1, 1, 1, 1,
0.262789, -0.2290916, 1.518334, 0, 0, 1, 1, 1,
0.2646849, 0.9645482, 0.24789, 1, 0, 0, 1, 1,
0.265237, -0.02464991, 1.796635, 1, 0, 0, 1, 1,
0.2704203, -0.5679795, 0.6554052, 1, 0, 0, 1, 1,
0.2746578, 0.1795534, 0.5245878, 1, 0, 0, 1, 1,
0.276751, -0.2930873, 1.813598, 1, 0, 0, 1, 1,
0.2781524, -0.06247107, 1.146617, 0, 0, 0, 1, 1,
0.2802569, 0.1594795, 1.372707, 0, 0, 0, 1, 1,
0.2847884, -0.6617433, 0.6330893, 0, 0, 0, 1, 1,
0.2912819, -0.04118241, 1.26768, 0, 0, 0, 1, 1,
0.2946955, 1.025942, -0.2880228, 0, 0, 0, 1, 1,
0.2951781, 1.081242, -0.3137179, 0, 0, 0, 1, 1,
0.2980639, 1.293533, 0.8744839, 0, 0, 0, 1, 1,
0.3009974, 1.062308, -0.0654776, 1, 1, 1, 1, 1,
0.3065175, 0.7958505, 1.051083, 1, 1, 1, 1, 1,
0.3089283, -0.5886073, 2.959373, 1, 1, 1, 1, 1,
0.3111496, -0.4581269, 2.32484, 1, 1, 1, 1, 1,
0.3119349, 0.3791543, 0.7860844, 1, 1, 1, 1, 1,
0.3132117, -3.139734, 2.587077, 1, 1, 1, 1, 1,
0.3149932, 0.04142346, 0.9383771, 1, 1, 1, 1, 1,
0.3176849, -1.353687, 2.634706, 1, 1, 1, 1, 1,
0.3191563, 0.6825172, 0.3326064, 1, 1, 1, 1, 1,
0.3247479, -0.287455, 3.265139, 1, 1, 1, 1, 1,
0.3267366, -1.27275, 3.893049, 1, 1, 1, 1, 1,
0.3268648, -0.4427906, 3.319767, 1, 1, 1, 1, 1,
0.3307019, 1.003751, 1.300472, 1, 1, 1, 1, 1,
0.3324395, -1.690123, 2.932805, 1, 1, 1, 1, 1,
0.3333753, -1.876394, 3.886137, 1, 1, 1, 1, 1,
0.335898, -0.6081474, 1.353847, 0, 0, 1, 1, 1,
0.3395092, 0.465125, 0.9802049, 1, 0, 0, 1, 1,
0.3427822, 1.481448, 2.576685, 1, 0, 0, 1, 1,
0.3446324, 0.1296815, -0.2011403, 1, 0, 0, 1, 1,
0.3468582, -0.5779063, 1.912942, 1, 0, 0, 1, 1,
0.3479516, -1.679927, 2.672332, 1, 0, 0, 1, 1,
0.3488002, -0.2959647, 4.052548, 0, 0, 0, 1, 1,
0.3513041, -0.1900811, 1.659779, 0, 0, 0, 1, 1,
0.3520609, -1.046254, 3.061187, 0, 0, 0, 1, 1,
0.3544404, -0.7780855, 1.347124, 0, 0, 0, 1, 1,
0.3576505, -0.5353319, 1.897721, 0, 0, 0, 1, 1,
0.3636228, -1.006049, 4.759537, 0, 0, 0, 1, 1,
0.3650523, 0.4893879, -0.3168524, 0, 0, 0, 1, 1,
0.36601, -0.7884622, 3.365288, 1, 1, 1, 1, 1,
0.3679206, -0.3748338, 2.195777, 1, 1, 1, 1, 1,
0.3688073, -1.077999, 4.347144, 1, 1, 1, 1, 1,
0.369086, 1.031659, -0.7400888, 1, 1, 1, 1, 1,
0.3725062, -0.03655569, 2.084513, 1, 1, 1, 1, 1,
0.3731317, -0.3326285, 2.924738, 1, 1, 1, 1, 1,
0.3752485, 0.06101353, 1.044728, 1, 1, 1, 1, 1,
0.3760618, 1.139578, 0.6654415, 1, 1, 1, 1, 1,
0.3773642, -1.348544, 3.459419, 1, 1, 1, 1, 1,
0.3786303, 0.8004004, -0.4085054, 1, 1, 1, 1, 1,
0.3796446, 0.1436206, 0.5440199, 1, 1, 1, 1, 1,
0.3797417, -1.063949, 4.171245, 1, 1, 1, 1, 1,
0.3821378, 0.9830667, -0.6656181, 1, 1, 1, 1, 1,
0.3842634, -1.359614, 2.155509, 1, 1, 1, 1, 1,
0.3891782, 0.9969712, -0.4530606, 1, 1, 1, 1, 1,
0.3899275, 0.6022812, 1.240477, 0, 0, 1, 1, 1,
0.3910407, 0.4537897, -0.4148476, 1, 0, 0, 1, 1,
0.3972133, -2.333769, 3.785424, 1, 0, 0, 1, 1,
0.3995244, -0.5903638, 2.539204, 1, 0, 0, 1, 1,
0.4020259, 1.364824, 0.7220274, 1, 0, 0, 1, 1,
0.4028003, 1.28163, 0.2066109, 1, 0, 0, 1, 1,
0.4030426, -0.5676623, 0.8461618, 0, 0, 0, 1, 1,
0.4038122, -1.427167, 1.737167, 0, 0, 0, 1, 1,
0.4041866, -0.1105415, 0.8231786, 0, 0, 0, 1, 1,
0.4098087, -1.751563, 3.260475, 0, 0, 0, 1, 1,
0.4152912, 0.2206548, 1.280705, 0, 0, 0, 1, 1,
0.4196095, 0.9668559, -0.1559558, 0, 0, 0, 1, 1,
0.4288228, 0.5520762, 1.219661, 0, 0, 0, 1, 1,
0.4320744, 0.4359356, 1.492597, 1, 1, 1, 1, 1,
0.4351428, 0.5781695, 0.4665845, 1, 1, 1, 1, 1,
0.4426575, -0.04392729, 1.198295, 1, 1, 1, 1, 1,
0.4469598, 0.5828221, -0.2570027, 1, 1, 1, 1, 1,
0.4536526, -1.50944, 3.076901, 1, 1, 1, 1, 1,
0.454439, -1.047448, 1.726456, 1, 1, 1, 1, 1,
0.455255, -0.4475925, 1.979219, 1, 1, 1, 1, 1,
0.4588402, 0.4031025, 1.580382, 1, 1, 1, 1, 1,
0.4594468, -1.298279, 3.386232, 1, 1, 1, 1, 1,
0.4616831, 1.828599, -0.9434142, 1, 1, 1, 1, 1,
0.4632259, -0.932815, 3.468566, 1, 1, 1, 1, 1,
0.4663103, 1.00113, 0.3479299, 1, 1, 1, 1, 1,
0.4695749, 1.89528, -1.737226, 1, 1, 1, 1, 1,
0.4753903, 1.11987, 0.7122004, 1, 1, 1, 1, 1,
0.4764001, 0.9265725, 0.9083828, 1, 1, 1, 1, 1,
0.4792494, -1.291271, 1.716224, 0, 0, 1, 1, 1,
0.481669, 0.6111379, 2.024043, 1, 0, 0, 1, 1,
0.4844686, -2.068386, 3.110062, 1, 0, 0, 1, 1,
0.4854283, 0.3956192, 1.277219, 1, 0, 0, 1, 1,
0.4888837, 0.9101712, 0.9136264, 1, 0, 0, 1, 1,
0.4924085, 0.5663847, 0.3454982, 1, 0, 0, 1, 1,
0.4950751, -1.893401, 3.733902, 0, 0, 0, 1, 1,
0.4953711, -1.395707, 2.4097, 0, 0, 0, 1, 1,
0.4982631, -0.0554814, -0.2867981, 0, 0, 0, 1, 1,
0.4995039, 0.1354896, 3.979192, 0, 0, 0, 1, 1,
0.5028427, 0.04175814, 1.74892, 0, 0, 0, 1, 1,
0.5028982, 0.03217053, 0.7990888, 0, 0, 0, 1, 1,
0.503727, 0.5940973, 0.7003363, 0, 0, 0, 1, 1,
0.5042261, -0.8506116, 2.549641, 1, 1, 1, 1, 1,
0.5067806, 0.7041939, 2.112427, 1, 1, 1, 1, 1,
0.5074151, -0.1796208, 2.187419, 1, 1, 1, 1, 1,
0.5093749, -0.05969818, 2.034263, 1, 1, 1, 1, 1,
0.510624, -0.4513507, 1.096007, 1, 1, 1, 1, 1,
0.5190088, -2.027625, 3.994222, 1, 1, 1, 1, 1,
0.5259198, -0.4873137, 1.873334, 1, 1, 1, 1, 1,
0.5283656, 0.7331625, 0.5998739, 1, 1, 1, 1, 1,
0.5344814, 0.2170167, 0.4303419, 1, 1, 1, 1, 1,
0.5369509, -1.026455, 3.731567, 1, 1, 1, 1, 1,
0.5382521, -0.4998333, 0.3986362, 1, 1, 1, 1, 1,
0.5402197, 0.175866, 0.7952519, 1, 1, 1, 1, 1,
0.5422929, -1.58247, 2.352901, 1, 1, 1, 1, 1,
0.5435383, -0.5654085, 3.099301, 1, 1, 1, 1, 1,
0.5466576, 0.284076, 2.286903, 1, 1, 1, 1, 1,
0.5538242, -0.6489186, 2.057104, 0, 0, 1, 1, 1,
0.5588785, 0.4368535, 1.307843, 1, 0, 0, 1, 1,
0.5642081, -1.002836, 2.967253, 1, 0, 0, 1, 1,
0.5661297, 0.06781877, 2.191183, 1, 0, 0, 1, 1,
0.5662357, -0.4042121, 1.914544, 1, 0, 0, 1, 1,
0.5673719, 0.8217686, -1.709612, 1, 0, 0, 1, 1,
0.5695828, 0.1254677, 0.6107965, 0, 0, 0, 1, 1,
0.5697047, 0.0001767065, 0.5087047, 0, 0, 0, 1, 1,
0.5707606, 0.6499389, 2.448601, 0, 0, 0, 1, 1,
0.5719084, -0.4978749, 1.159557, 0, 0, 0, 1, 1,
0.5746251, 1.181239, 0.3807117, 0, 0, 0, 1, 1,
0.5783433, -0.1442374, 2.293972, 0, 0, 0, 1, 1,
0.5849853, -0.3169554, 2.043652, 0, 0, 0, 1, 1,
0.5867189, -1.28506, 1.918392, 1, 1, 1, 1, 1,
0.5892712, 1.050882, 1.720374, 1, 1, 1, 1, 1,
0.5920889, 0.09552296, 2.51436, 1, 1, 1, 1, 1,
0.5946769, 0.4462671, 1.304611, 1, 1, 1, 1, 1,
0.5982074, 0.001781281, 1.560057, 1, 1, 1, 1, 1,
0.6001107, -0.250378, 1.863043, 1, 1, 1, 1, 1,
0.6013763, 0.5955229, 0.9250084, 1, 1, 1, 1, 1,
0.6075687, -1.366389, 1.064064, 1, 1, 1, 1, 1,
0.6082404, 0.4336999, 0.6266318, 1, 1, 1, 1, 1,
0.6145059, -0.9416981, 3.379534, 1, 1, 1, 1, 1,
0.6147153, -1.629466, 3.030906, 1, 1, 1, 1, 1,
0.6173207, 0.9068003, 0.6355703, 1, 1, 1, 1, 1,
0.6174818, 1.859338, 0.6827538, 1, 1, 1, 1, 1,
0.6185483, 1.298329, 0.934117, 1, 1, 1, 1, 1,
0.6199956, -1.581975, 2.15876, 1, 1, 1, 1, 1,
0.6213258, -1.309982, 3.296011, 0, 0, 1, 1, 1,
0.6220366, -1.013124, 1.65475, 1, 0, 0, 1, 1,
0.6252574, 0.413335, 1.385192, 1, 0, 0, 1, 1,
0.6303168, 0.01077334, 2.320229, 1, 0, 0, 1, 1,
0.6314722, 1.007139, -0.7450926, 1, 0, 0, 1, 1,
0.6349195, -0.0459635, 1.358972, 1, 0, 0, 1, 1,
0.6371883, -0.9216766, 2.653711, 0, 0, 0, 1, 1,
0.6386542, 0.923735, 1.173197, 0, 0, 0, 1, 1,
0.6461414, -0.7989748, 2.231636, 0, 0, 0, 1, 1,
0.6498076, 0.07862381, 1.310657, 0, 0, 0, 1, 1,
0.6557657, -0.9509505, 1.910083, 0, 0, 0, 1, 1,
0.6604943, 0.2929303, 1.210159, 0, 0, 0, 1, 1,
0.6622932, -0.3059169, 3.815403, 0, 0, 0, 1, 1,
0.6640409, -0.630391, 1.213215, 1, 1, 1, 1, 1,
0.664626, -0.721779, 2.617408, 1, 1, 1, 1, 1,
0.666255, -0.07280985, 1.183624, 1, 1, 1, 1, 1,
0.6670518, -0.2704863, 1.208567, 1, 1, 1, 1, 1,
0.6680447, 0.9008856, 0.1542468, 1, 1, 1, 1, 1,
0.6680701, -0.171778, 1.841909, 1, 1, 1, 1, 1,
0.6687829, -1.417956, 3.265464, 1, 1, 1, 1, 1,
0.6693201, 0.8939865, 2.201835, 1, 1, 1, 1, 1,
0.6711571, 0.08511278, 3.439505, 1, 1, 1, 1, 1,
0.6735389, -1.100994, 2.355037, 1, 1, 1, 1, 1,
0.6746676, -1.571215, 3.987345, 1, 1, 1, 1, 1,
0.6760407, -1.441659, 2.500606, 1, 1, 1, 1, 1,
0.6808464, -0.5856447, 1.757832, 1, 1, 1, 1, 1,
0.6834848, 0.3158465, 2.152018, 1, 1, 1, 1, 1,
0.6847673, 1.381923, 2.950922, 1, 1, 1, 1, 1,
0.6848895, 0.260242, 0.7646076, 0, 0, 1, 1, 1,
0.6849949, 3.08947, 0.7408357, 1, 0, 0, 1, 1,
0.6860685, -0.4825345, 1.36741, 1, 0, 0, 1, 1,
0.7039207, -1.96173, 1.875326, 1, 0, 0, 1, 1,
0.7058411, -0.9598233, 2.166951, 1, 0, 0, 1, 1,
0.7062562, -0.04212608, 0.753355, 1, 0, 0, 1, 1,
0.707443, 0.2546207, 1.292315, 0, 0, 0, 1, 1,
0.7114164, -0.871191, 3.2014, 0, 0, 0, 1, 1,
0.7150429, -2.298179, 2.559988, 0, 0, 0, 1, 1,
0.7165639, -0.420773, 2.537009, 0, 0, 0, 1, 1,
0.7178641, 1.615983, -0.1231141, 0, 0, 0, 1, 1,
0.7192476, -0.5745115, 1.684291, 0, 0, 0, 1, 1,
0.7228163, 1.545385, 0.4921757, 0, 0, 0, 1, 1,
0.7267236, 0.5798441, 1.849698, 1, 1, 1, 1, 1,
0.7308018, -0.5575879, 2.495729, 1, 1, 1, 1, 1,
0.7371526, -0.8217784, 1.853021, 1, 1, 1, 1, 1,
0.7375072, 0.7375833, -0.527676, 1, 1, 1, 1, 1,
0.7431754, -1.655974, 3.545547, 1, 1, 1, 1, 1,
0.7492006, 0.1588441, 0.2888562, 1, 1, 1, 1, 1,
0.7527404, -0.2455361, 1.77205, 1, 1, 1, 1, 1,
0.7574679, -0.7092323, 3.527216, 1, 1, 1, 1, 1,
0.7606447, -0.00565947, 1.720018, 1, 1, 1, 1, 1,
0.7620025, -0.4008223, 3.301099, 1, 1, 1, 1, 1,
0.7630838, 1.130412, 1.612344, 1, 1, 1, 1, 1,
0.7787899, 0.7295299, 1.207646, 1, 1, 1, 1, 1,
0.7819301, -0.7330908, 3.114775, 1, 1, 1, 1, 1,
0.7856069, 1.959402, 1.443176, 1, 1, 1, 1, 1,
0.792537, 0.2645414, -0.17492, 1, 1, 1, 1, 1,
0.7942843, -0.6741612, 2.764252, 0, 0, 1, 1, 1,
0.7956886, 0.04433499, 0.3311476, 1, 0, 0, 1, 1,
0.7957976, -1.256206, 0.9305605, 1, 0, 0, 1, 1,
0.7981701, -0.0744006, 2.095102, 1, 0, 0, 1, 1,
0.8074034, 2.323696, 1.32706, 1, 0, 0, 1, 1,
0.8075222, -0.04097597, 1.594988, 1, 0, 0, 1, 1,
0.8087171, 0.5006905, 1.326811, 0, 0, 0, 1, 1,
0.8098416, -0.2610912, 2.033316, 0, 0, 0, 1, 1,
0.8182599, 1.629359, 0.1924547, 0, 0, 0, 1, 1,
0.819056, -0.1718035, 1.78565, 0, 0, 0, 1, 1,
0.8247548, 0.206733, -0.509153, 0, 0, 0, 1, 1,
0.8295243, 0.8735358, 0.04993301, 0, 0, 0, 1, 1,
0.837993, 1.692806, -0.7448758, 0, 0, 0, 1, 1,
0.8384083, -0.06246587, 0.5069883, 1, 1, 1, 1, 1,
0.8388668, 0.6063353, 0.473971, 1, 1, 1, 1, 1,
0.8415717, 0.3380166, 0.7757162, 1, 1, 1, 1, 1,
0.84575, -0.3054755, 1.541017, 1, 1, 1, 1, 1,
0.8493999, -1.963011, 2.137545, 1, 1, 1, 1, 1,
0.8511188, 1.451606, 1.097854, 1, 1, 1, 1, 1,
0.8512737, 0.8255634, 0.4041184, 1, 1, 1, 1, 1,
0.85629, 0.1997645, 0.7863002, 1, 1, 1, 1, 1,
0.859044, 1.099477, 0.8813977, 1, 1, 1, 1, 1,
0.8651691, 0.3286036, 0.4389285, 1, 1, 1, 1, 1,
0.8733972, -1.446804, 1.64599, 1, 1, 1, 1, 1,
0.8774883, 0.3016534, 1.483087, 1, 1, 1, 1, 1,
0.8782262, -1.370241, 3.42154, 1, 1, 1, 1, 1,
0.8824924, -1.915696, 2.881647, 1, 1, 1, 1, 1,
0.8830256, -1.290648, 1.863214, 1, 1, 1, 1, 1,
0.883389, -0.06460229, 1.535792, 0, 0, 1, 1, 1,
0.8859012, 0.6974772, 0.9175373, 1, 0, 0, 1, 1,
0.8868946, -0.3633601, 1.204114, 1, 0, 0, 1, 1,
0.9013249, -0.926071, 4.452641, 1, 0, 0, 1, 1,
0.9036511, 0.7340334, 0.05191533, 1, 0, 0, 1, 1,
0.9134784, 0.5417607, 1.783944, 1, 0, 0, 1, 1,
0.9194, 0.807609, 2.708129, 0, 0, 0, 1, 1,
0.9234534, -0.306686, 3.085071, 0, 0, 0, 1, 1,
0.92595, -1.147174, 2.628971, 0, 0, 0, 1, 1,
0.9320781, 1.759308, -0.1903524, 0, 0, 0, 1, 1,
0.9347191, -0.3163416, 1.915138, 0, 0, 0, 1, 1,
0.9389755, 1.168617, -0.05597834, 0, 0, 0, 1, 1,
0.9404497, -2.224087, 3.215505, 0, 0, 0, 1, 1,
0.9424478, -0.948641, 2.536718, 1, 1, 1, 1, 1,
0.954666, -0.2255149, 2.318558, 1, 1, 1, 1, 1,
0.9640061, 0.9187282, 0.7428347, 1, 1, 1, 1, 1,
0.9685469, -1.938847, 2.874039, 1, 1, 1, 1, 1,
0.9717779, -0.3372787, 1.990577, 1, 1, 1, 1, 1,
0.9731913, -0.3131115, 3.945449, 1, 1, 1, 1, 1,
0.9789632, -2.04704, 2.643579, 1, 1, 1, 1, 1,
0.9853392, 1.498148, -0.0230576, 1, 1, 1, 1, 1,
0.9882538, -0.8696316, 2.275136, 1, 1, 1, 1, 1,
0.9897786, 0.4041501, 1.477055, 1, 1, 1, 1, 1,
0.9925342, 0.8410473, 0.08939905, 1, 1, 1, 1, 1,
0.995845, -1.122188, 3.521891, 1, 1, 1, 1, 1,
0.9962413, 0.2342706, 1.940935, 1, 1, 1, 1, 1,
1.002714, 1.199813, 1.931831, 1, 1, 1, 1, 1,
1.005985, 0.67649, 2.392573, 1, 1, 1, 1, 1,
1.013836, -0.5422087, 2.093405, 0, 0, 1, 1, 1,
1.01405, -0.09746468, 1.838293, 1, 0, 0, 1, 1,
1.014252, 0.5472152, 0.8138051, 1, 0, 0, 1, 1,
1.019296, 0.1729808, 1.901731, 1, 0, 0, 1, 1,
1.023702, 0.3617629, 2.261578, 1, 0, 0, 1, 1,
1.024171, -2.343706, 1.890851, 1, 0, 0, 1, 1,
1.027246, -0.04424746, 1.492172, 0, 0, 0, 1, 1,
1.028607, -1.401625, 1.833828, 0, 0, 0, 1, 1,
1.037116, -1.050485, 1.270295, 0, 0, 0, 1, 1,
1.049667, -0.4702124, 3.35039, 0, 0, 0, 1, 1,
1.04983, 0.7862375, 1.226994, 0, 0, 0, 1, 1,
1.052732, 0.8563971, 0.3846678, 0, 0, 0, 1, 1,
1.060975, -0.6438418, 2.739052, 0, 0, 0, 1, 1,
1.062216, 0.461044, 1.114398, 1, 1, 1, 1, 1,
1.070068, -1.140113, 2.658345, 1, 1, 1, 1, 1,
1.071242, -0.4141093, 3.058103, 1, 1, 1, 1, 1,
1.07155, -0.774237, 2.068347, 1, 1, 1, 1, 1,
1.071661, -0.3669714, -0.4346724, 1, 1, 1, 1, 1,
1.090522, -0.6078309, 1.668772, 1, 1, 1, 1, 1,
1.097537, 1.322316, 1.049573, 1, 1, 1, 1, 1,
1.104999, -0.7172194, 0.6656144, 1, 1, 1, 1, 1,
1.106786, -0.4660993, 2.290624, 1, 1, 1, 1, 1,
1.107578, -1.488888, 3.173617, 1, 1, 1, 1, 1,
1.114517, 1.017442, -0.06525513, 1, 1, 1, 1, 1,
1.122967, 0.6307231, 0.2908688, 1, 1, 1, 1, 1,
1.128878, 1.558538, 0.1355456, 1, 1, 1, 1, 1,
1.129784, -0.5098748, 4.287959, 1, 1, 1, 1, 1,
1.132863, -0.2156403, 0.5439953, 1, 1, 1, 1, 1,
1.138456, -0.0207521, 2.220983, 0, 0, 1, 1, 1,
1.14204, 1.580855, -0.02216068, 1, 0, 0, 1, 1,
1.144985, -0.8276081, 1.399123, 1, 0, 0, 1, 1,
1.153408, -0.4354994, 3.161433, 1, 0, 0, 1, 1,
1.160418, 0.01917256, 2.561878, 1, 0, 0, 1, 1,
1.160874, -0.6693991, 1.647451, 1, 0, 0, 1, 1,
1.167234, -1.386364, 0.0754513, 0, 0, 0, 1, 1,
1.169088, -0.005878144, 2.138477, 0, 0, 0, 1, 1,
1.17116, -0.5138223, 1.93367, 0, 0, 0, 1, 1,
1.172285, -0.7262046, 2.828721, 0, 0, 0, 1, 1,
1.180484, -0.5028915, 1.799834, 0, 0, 0, 1, 1,
1.18885, 0.6594931, 1.566678, 0, 0, 0, 1, 1,
1.191279, -1.669494, 1.812149, 0, 0, 0, 1, 1,
1.19516, -1.776186, 3.281973, 1, 1, 1, 1, 1,
1.198907, -2.098068, 3.023671, 1, 1, 1, 1, 1,
1.200769, 0.9403569, 0.3611044, 1, 1, 1, 1, 1,
1.209933, 0.9451736, 2.405685, 1, 1, 1, 1, 1,
1.213188, -1.239413, 3.339198, 1, 1, 1, 1, 1,
1.222199, 1.265715, 1.01392, 1, 1, 1, 1, 1,
1.250727, 0.4202521, 1.621553, 1, 1, 1, 1, 1,
1.251714, -1.034223, 1.80907, 1, 1, 1, 1, 1,
1.261478, -1.815565, 2.48378, 1, 1, 1, 1, 1,
1.265151, -0.5335686, 3.574575, 1, 1, 1, 1, 1,
1.267397, -0.7278606, 1.596528, 1, 1, 1, 1, 1,
1.267798, -0.4608447, 2.030938, 1, 1, 1, 1, 1,
1.270395, 0.5876428, -0.01498065, 1, 1, 1, 1, 1,
1.27195, 0.893045, -0.7015678, 1, 1, 1, 1, 1,
1.276587, 0.1593604, 0.661829, 1, 1, 1, 1, 1,
1.277796, 0.5438737, 2.898198, 0, 0, 1, 1, 1,
1.280891, 0.09519985, 0.5472523, 1, 0, 0, 1, 1,
1.289102, 0.08596928, 2.300142, 1, 0, 0, 1, 1,
1.291827, -1.670096, 1.232901, 1, 0, 0, 1, 1,
1.29365, 0.6474738, 0.21359, 1, 0, 0, 1, 1,
1.294898, 0.5034326, 0.6021997, 1, 0, 0, 1, 1,
1.295101, -0.2389325, 2.394473, 0, 0, 0, 1, 1,
1.295339, -0.3034703, 2.504085, 0, 0, 0, 1, 1,
1.303352, -0.8914579, 1.436549, 0, 0, 0, 1, 1,
1.322829, -1.386191, 3.556559, 0, 0, 0, 1, 1,
1.328389, -1.991586, 2.968668, 0, 0, 0, 1, 1,
1.329592, -1.035799, 0.7783751, 0, 0, 0, 1, 1,
1.331837, 0.8029593, 0.09442306, 0, 0, 0, 1, 1,
1.334697, -0.6892104, 3.324863, 1, 1, 1, 1, 1,
1.338072, 0.6684516, 2.022645, 1, 1, 1, 1, 1,
1.338817, 0.3855049, 1.024704, 1, 1, 1, 1, 1,
1.345892, -1.193407, 4.692744, 1, 1, 1, 1, 1,
1.34737, 1.506917, 2.593313, 1, 1, 1, 1, 1,
1.350563, -0.3889593, 2.014353, 1, 1, 1, 1, 1,
1.358374, 0.04408703, 0.891127, 1, 1, 1, 1, 1,
1.367401, 0.2240697, -0.9700881, 1, 1, 1, 1, 1,
1.37685, -0.06768084, 2.437357, 1, 1, 1, 1, 1,
1.379495, 0.4853596, 1.769387, 1, 1, 1, 1, 1,
1.391164, -0.7838739, 2.907552, 1, 1, 1, 1, 1,
1.394752, -0.1338199, 1.254241, 1, 1, 1, 1, 1,
1.395734, 0.1359679, 2.007945, 1, 1, 1, 1, 1,
1.402465, 0.2440269, 2.029313, 1, 1, 1, 1, 1,
1.410019, -0.3683088, -0.02716224, 1, 1, 1, 1, 1,
1.431717, 0.4503367, 1.519408, 0, 0, 1, 1, 1,
1.438157, -0.6812571, 2.33672, 1, 0, 0, 1, 1,
1.450884, 1.523383, 1.045949, 1, 0, 0, 1, 1,
1.455086, -1.086642, 1.294178, 1, 0, 0, 1, 1,
1.458184, -0.1724086, 1.938974, 1, 0, 0, 1, 1,
1.461548, -0.3046359, 1.700309, 1, 0, 0, 1, 1,
1.470147, 0.4765926, 1.01358, 0, 0, 0, 1, 1,
1.470298, -1.161085, 1.898531, 0, 0, 0, 1, 1,
1.473727, -0.558082, 1.200291, 0, 0, 0, 1, 1,
1.485246, 1.540036, 0.1907569, 0, 0, 0, 1, 1,
1.489773, 0.5018983, 1.68701, 0, 0, 0, 1, 1,
1.501055, 0.6616848, 0.6038378, 0, 0, 0, 1, 1,
1.50476, -0.3142382, 2.887464, 0, 0, 0, 1, 1,
1.505663, 0.2447096, 1.824132, 1, 1, 1, 1, 1,
1.507017, -0.281624, 2.756049, 1, 1, 1, 1, 1,
1.50871, -0.1223518, 4.174922, 1, 1, 1, 1, 1,
1.515878, 1.253891, 1.604512, 1, 1, 1, 1, 1,
1.516459, 0.3794041, 1.541453, 1, 1, 1, 1, 1,
1.54405, 1.787503, 0.2282554, 1, 1, 1, 1, 1,
1.565584, 1.705047, 0.3026783, 1, 1, 1, 1, 1,
1.582388, 0.9682474, 2.144035, 1, 1, 1, 1, 1,
1.606402, -1.018512, 2.061773, 1, 1, 1, 1, 1,
1.61302, 0.8117718, 0.9988649, 1, 1, 1, 1, 1,
1.627679, -0.2339939, 2.465955, 1, 1, 1, 1, 1,
1.64135, 0.8303818, 0.9122778, 1, 1, 1, 1, 1,
1.642532, -0.9351819, 2.006728, 1, 1, 1, 1, 1,
1.667474, -2.095259, 4.636182, 1, 1, 1, 1, 1,
1.69282, 2.236145, 0.1937266, 1, 1, 1, 1, 1,
1.697374, -1.443087, 3.447265, 0, 0, 1, 1, 1,
1.707274, -0.4926441, 2.00601, 1, 0, 0, 1, 1,
1.726772, 0.7916101, 0.5742931, 1, 0, 0, 1, 1,
1.735424, 0.344395, -0.188704, 1, 0, 0, 1, 1,
1.739104, -0.01171189, 1.427902, 1, 0, 0, 1, 1,
1.747651, 0.8681545, 1.549533, 1, 0, 0, 1, 1,
1.764722, -0.7564765, 1.39281, 0, 0, 0, 1, 1,
1.7679, 0.8077753, 0.7443098, 0, 0, 0, 1, 1,
1.768904, -0.9315129, 3.537941, 0, 0, 0, 1, 1,
1.769356, -0.5289745, 1.485383, 0, 0, 0, 1, 1,
1.782565, 0.4999858, 1.919563, 0, 0, 0, 1, 1,
1.811355, 1.795988, 1.26322, 0, 0, 0, 1, 1,
1.819256, 0.03164868, 1.927844, 0, 0, 0, 1, 1,
1.82809, 0.03874902, 0.4294802, 1, 1, 1, 1, 1,
1.883206, -1.765998, 0.4233944, 1, 1, 1, 1, 1,
1.89382, -0.697302, 1.67137, 1, 1, 1, 1, 1,
1.941373, 0.5389537, 1.294797, 1, 1, 1, 1, 1,
1.949046, -0.990675, 1.692658, 1, 1, 1, 1, 1,
1.968336, -1.008573, 1.978217, 1, 1, 1, 1, 1,
2.023309, 0.1755095, 2.819594, 1, 1, 1, 1, 1,
2.024949, 0.828546, 2.196699, 1, 1, 1, 1, 1,
2.05199, -1.353852, 1.986967, 1, 1, 1, 1, 1,
2.076852, 0.2202371, 0.2204575, 1, 1, 1, 1, 1,
2.11486, 0.9664224, 2.335892, 1, 1, 1, 1, 1,
2.166485, 3.305928, 1.288304, 1, 1, 1, 1, 1,
2.183221, -0.2324881, 1.645226, 1, 1, 1, 1, 1,
2.192208, 0.6390435, 0.712806, 1, 1, 1, 1, 1,
2.196326, 0.4614675, 0.9876465, 1, 1, 1, 1, 1,
2.214207, 1.13704, 0.5725923, 0, 0, 1, 1, 1,
2.268951, 1.706791, 1.243405, 1, 0, 0, 1, 1,
2.279965, 1.272046, 0.648176, 1, 0, 0, 1, 1,
2.305175, -0.7986845, 1.866441, 1, 0, 0, 1, 1,
2.343337, -1.36037, 2.388969, 1, 0, 0, 1, 1,
2.363101, 0.02812945, 0.512952, 1, 0, 0, 1, 1,
2.388692, -0.462822, 0.9085747, 0, 0, 0, 1, 1,
2.43649, 0.0210926, 2.304145, 0, 0, 0, 1, 1,
2.543445, -1.110617, 2.309965, 0, 0, 0, 1, 1,
2.551358, -0.02516974, 2.149929, 0, 0, 0, 1, 1,
2.566278, 0.9704369, 1.121052, 0, 0, 0, 1, 1,
2.64731, 1.140369, 2.089118, 0, 0, 0, 1, 1,
2.652191, -0.01827208, 2.758923, 0, 0, 0, 1, 1,
2.702423, 0.3032972, 0.5154095, 1, 1, 1, 1, 1,
2.779588, 1.096613, 1.930792, 1, 1, 1, 1, 1,
2.914717, -0.9482318, 2.253242, 1, 1, 1, 1, 1,
2.99887, 0.8190647, -0.6374945, 1, 1, 1, 1, 1,
3.017199, 0.3417168, 0.935384, 1, 1, 1, 1, 1,
3.023489, 0.692907, 3.43182, 1, 1, 1, 1, 1,
3.468947, -2.740865, 2.648745, 1, 1, 1, 1, 1
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
var radius = 10.02052;
var distance = 35.19666;
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
mvMatrix.translate( -0.1220758, -0.08309698, -0.1630888 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.19666);
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
