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
-3.00791, -0.839099, -1.123339, 1, 0, 0, 1,
-2.878143, -0.05753262, -0.1901932, 1, 0.007843138, 0, 1,
-2.85473, 1.449305, -1.429764, 1, 0.01176471, 0, 1,
-2.815994, 1.686315, -1.066895, 1, 0.01960784, 0, 1,
-2.694586, 1.587015, 0.04393702, 1, 0.02352941, 0, 1,
-2.668949, 1.707151, -1.065567, 1, 0.03137255, 0, 1,
-2.625317, 0.1978318, -0.8257964, 1, 0.03529412, 0, 1,
-2.531767, -0.3506882, -0.5364649, 1, 0.04313726, 0, 1,
-2.468875, -0.9861791, -0.2755701, 1, 0.04705882, 0, 1,
-2.384766, -0.4588952, -1.716399, 1, 0.05490196, 0, 1,
-2.359698, 1.601426, 0.01899962, 1, 0.05882353, 0, 1,
-2.253371, 0.7440027, -1.989966, 1, 0.06666667, 0, 1,
-2.243058, 0.04263956, -2.783212, 1, 0.07058824, 0, 1,
-2.229347, 0.8493204, -1.422193, 1, 0.07843138, 0, 1,
-2.223442, -1.355335, -1.504474, 1, 0.08235294, 0, 1,
-2.177094, -0.3439165, -1.908285, 1, 0.09019608, 0, 1,
-2.164687, 0.5986592, -1.032345, 1, 0.09411765, 0, 1,
-2.156053, 0.9047019, 0.284752, 1, 0.1019608, 0, 1,
-2.143008, -0.3256733, -1.497581, 1, 0.1098039, 0, 1,
-2.107377, 1.882934, -1.136534, 1, 0.1137255, 0, 1,
-2.073371, 1.383986, -1.16453, 1, 0.1215686, 0, 1,
-2.067785, -1.062228, 0.06494182, 1, 0.1254902, 0, 1,
-2.042166, 0.4913329, -0.7114318, 1, 0.1333333, 0, 1,
-2.039547, -1.487132, -1.660127, 1, 0.1372549, 0, 1,
-1.970912, 1.531522, -0.03870916, 1, 0.145098, 0, 1,
-1.92983, -0.4707033, -0.23774, 1, 0.1490196, 0, 1,
-1.912056, -0.5177639, -2.51713, 1, 0.1568628, 0, 1,
-1.883782, -0.7990226, -1.040931, 1, 0.1607843, 0, 1,
-1.875722, -0.2078015, -2.03037, 1, 0.1686275, 0, 1,
-1.872833, -0.6254993, -4.175232, 1, 0.172549, 0, 1,
-1.871313, -0.986038, -3.355786, 1, 0.1803922, 0, 1,
-1.86689, 0.7697194, -0.7680128, 1, 0.1843137, 0, 1,
-1.863289, -0.4890285, -1.925468, 1, 0.1921569, 0, 1,
-1.861189, -0.880906, -0.930668, 1, 0.1960784, 0, 1,
-1.834318, -0.7728121, -0.6362594, 1, 0.2039216, 0, 1,
-1.831533, 0.335045, -2.542609, 1, 0.2117647, 0, 1,
-1.81825, -0.7946235, -2.183606, 1, 0.2156863, 0, 1,
-1.813907, -0.7385107, -0.8304667, 1, 0.2235294, 0, 1,
-1.807391, 1.007979, 0.6518119, 1, 0.227451, 0, 1,
-1.801069, 1.63348, 0.7431484, 1, 0.2352941, 0, 1,
-1.796006, -1.103024, -2.95204, 1, 0.2392157, 0, 1,
-1.789707, -1.238156, -2.80184, 1, 0.2470588, 0, 1,
-1.773332, 0.4726166, -0.3148222, 1, 0.2509804, 0, 1,
-1.747679, 2.332204, 0.2859529, 1, 0.2588235, 0, 1,
-1.741704, -1.54425, -3.526664, 1, 0.2627451, 0, 1,
-1.738594, 0.8190883, -0.9500129, 1, 0.2705882, 0, 1,
-1.725393, -0.515648, -3.226761, 1, 0.2745098, 0, 1,
-1.718796, 0.7586437, 0.4077507, 1, 0.282353, 0, 1,
-1.712296, -0.9137365, -0.4829333, 1, 0.2862745, 0, 1,
-1.705653, -0.0680199, -1.26179, 1, 0.2941177, 0, 1,
-1.683605, 0.9725039, -0.9951509, 1, 0.3019608, 0, 1,
-1.68087, -0.1840475, -1.204633, 1, 0.3058824, 0, 1,
-1.670256, 0.5039415, -1.81654, 1, 0.3137255, 0, 1,
-1.646529, -1.400439, -2.523582, 1, 0.3176471, 0, 1,
-1.64503, 0.7968457, -0.636512, 1, 0.3254902, 0, 1,
-1.643932, 0.4521899, -2.073426, 1, 0.3294118, 0, 1,
-1.630485, -0.5335637, -1.688956, 1, 0.3372549, 0, 1,
-1.622502, -1.559408, -3.264289, 1, 0.3411765, 0, 1,
-1.619838, 0.09007324, -1.628206, 1, 0.3490196, 0, 1,
-1.616617, 0.9803851, -3.110563, 1, 0.3529412, 0, 1,
-1.605692, 1.010446, -2.923243, 1, 0.3607843, 0, 1,
-1.600761, 1.296954, 0.6193525, 1, 0.3647059, 0, 1,
-1.590573, 0.2199602, -1.466768, 1, 0.372549, 0, 1,
-1.559219, -0.3492424, -1.701599, 1, 0.3764706, 0, 1,
-1.557238, 0.8662327, -1.284385, 1, 0.3843137, 0, 1,
-1.540471, 1.618896, -0.7990042, 1, 0.3882353, 0, 1,
-1.524879, -0.1787852, -0.4233948, 1, 0.3960784, 0, 1,
-1.493304, 0.7052321, -2.899318, 1, 0.4039216, 0, 1,
-1.477654, -0.9714081, -0.7821721, 1, 0.4078431, 0, 1,
-1.447163, -0.855302, -1.887888, 1, 0.4156863, 0, 1,
-1.437662, 0.06785794, 0.8923252, 1, 0.4196078, 0, 1,
-1.43546, -0.09654109, -0.236665, 1, 0.427451, 0, 1,
-1.430357, -0.4311727, -0.4687539, 1, 0.4313726, 0, 1,
-1.421752, 1.04882, 0.2334714, 1, 0.4392157, 0, 1,
-1.410946, 0.3170146, -0.3304996, 1, 0.4431373, 0, 1,
-1.402902, 0.1550577, -1.882405, 1, 0.4509804, 0, 1,
-1.400805, 1.416289, -0.09055052, 1, 0.454902, 0, 1,
-1.39429, -0.7571918, -1.828015, 1, 0.4627451, 0, 1,
-1.392017, -0.1298409, -0.2070391, 1, 0.4666667, 0, 1,
-1.388, -0.9760028, -1.347772, 1, 0.4745098, 0, 1,
-1.387858, -0.2210782, -2.217726, 1, 0.4784314, 0, 1,
-1.383546, -0.336907, -1.783649, 1, 0.4862745, 0, 1,
-1.380741, 0.5822268, -2.123249, 1, 0.4901961, 0, 1,
-1.364779, 0.2580225, -2.412056, 1, 0.4980392, 0, 1,
-1.359388, 0.0219021, -4.93051, 1, 0.5058824, 0, 1,
-1.35313, -1.250553, -1.507979, 1, 0.509804, 0, 1,
-1.349274, 0.4088747, -3.823835, 1, 0.5176471, 0, 1,
-1.322398, 1.555975, -1.326682, 1, 0.5215687, 0, 1,
-1.300491, 1.249715, -0.9635148, 1, 0.5294118, 0, 1,
-1.291424, -0.1520868, -2.16702, 1, 0.5333334, 0, 1,
-1.277495, -0.2928311, -1.531189, 1, 0.5411765, 0, 1,
-1.264262, 1.290296, -1.205371, 1, 0.5450981, 0, 1,
-1.261595, 1.214741, 0.1970253, 1, 0.5529412, 0, 1,
-1.26153, 1.177771, -0.9777534, 1, 0.5568628, 0, 1,
-1.254549, 2.014837, 0.3577583, 1, 0.5647059, 0, 1,
-1.249155, 0.4596916, -3.023395, 1, 0.5686275, 0, 1,
-1.249083, -1.66016, -2.066669, 1, 0.5764706, 0, 1,
-1.248095, -0.5614102, -1.799222, 1, 0.5803922, 0, 1,
-1.246365, -1.518652, -1.74987, 1, 0.5882353, 0, 1,
-1.244042, 0.7095944, -1.093595, 1, 0.5921569, 0, 1,
-1.235266, 1.398612, -1.8284, 1, 0.6, 0, 1,
-1.232002, -0.3583019, -1.274251, 1, 0.6078432, 0, 1,
-1.230355, -2.047493, -3.27093, 1, 0.6117647, 0, 1,
-1.223956, 1.387117, -1.846358, 1, 0.6196079, 0, 1,
-1.214065, 2.164397, -0.0936907, 1, 0.6235294, 0, 1,
-1.209111, -0.9562823, -1.177581, 1, 0.6313726, 0, 1,
-1.197422, 0.07216818, -0.6875271, 1, 0.6352941, 0, 1,
-1.194961, 0.7055294, -1.42695, 1, 0.6431373, 0, 1,
-1.193603, 1.630317, -0.7627324, 1, 0.6470588, 0, 1,
-1.191509, 0.6785217, -0.4941367, 1, 0.654902, 0, 1,
-1.178999, 1.109164, -0.2811441, 1, 0.6588235, 0, 1,
-1.168597, -0.4002953, -1.446764, 1, 0.6666667, 0, 1,
-1.166624, -1.66156, -2.246616, 1, 0.6705883, 0, 1,
-1.150413, -0.6836857, -3.649681, 1, 0.6784314, 0, 1,
-1.143693, -1.178517, -0.9692559, 1, 0.682353, 0, 1,
-1.142744, -1.7042, -2.335738, 1, 0.6901961, 0, 1,
-1.142459, -1.983204, -3.654107, 1, 0.6941177, 0, 1,
-1.137562, -0.1482995, -0.7750782, 1, 0.7019608, 0, 1,
-1.134766, -1.29886, -2.914242, 1, 0.7098039, 0, 1,
-1.11836, -0.3493679, -2.874865, 1, 0.7137255, 0, 1,
-1.116119, -0.07055248, -2.126337, 1, 0.7215686, 0, 1,
-1.113403, 0.4698681, -1.105982, 1, 0.7254902, 0, 1,
-1.111261, -0.02280473, -2.089138, 1, 0.7333333, 0, 1,
-1.110877, -0.1794463, -0.9264703, 1, 0.7372549, 0, 1,
-1.10176, 1.014138, -1.921012, 1, 0.7450981, 0, 1,
-1.095348, 0.1786601, -3.474707, 1, 0.7490196, 0, 1,
-1.083985, -0.6323108, -0.8227729, 1, 0.7568628, 0, 1,
-1.082692, -0.09573106, -1.524882, 1, 0.7607843, 0, 1,
-1.082163, 0.02209253, -2.142754, 1, 0.7686275, 0, 1,
-1.081143, -0.8978419, -2.975237, 1, 0.772549, 0, 1,
-1.075711, 2.377055, -0.4273328, 1, 0.7803922, 0, 1,
-1.075097, -1.477409, -2.593674, 1, 0.7843137, 0, 1,
-1.072582, -1.051465, -1.656849, 1, 0.7921569, 0, 1,
-1.072134, 0.71885, -1.886992, 1, 0.7960784, 0, 1,
-1.065284, -0.3503409, -1.262676, 1, 0.8039216, 0, 1,
-1.054728, -0.4469733, -1.396725, 1, 0.8117647, 0, 1,
-1.053619, 0.794729, -2.816459, 1, 0.8156863, 0, 1,
-1.045951, 0.1487142, -2.310574, 1, 0.8235294, 0, 1,
-1.045285, -0.1893703, -1.341835, 1, 0.827451, 0, 1,
-1.042689, -1.090259, -2.942521, 1, 0.8352941, 0, 1,
-1.040839, 1.23461, -1.522859, 1, 0.8392157, 0, 1,
-1.039545, 0.2922576, -1.573504, 1, 0.8470588, 0, 1,
-1.031573, 1.020507, -0.8877962, 1, 0.8509804, 0, 1,
-1.027226, 1.104551, 0.5349078, 1, 0.8588235, 0, 1,
-1.024948, -0.5764572, -4.088364, 1, 0.8627451, 0, 1,
-1.022507, -0.2472484, -2.771942, 1, 0.8705882, 0, 1,
-1.008455, -1.788275, -1.973021, 1, 0.8745098, 0, 1,
-0.9894599, 0.1255938, -1.591671, 1, 0.8823529, 0, 1,
-0.9810519, -1.494231, -2.516114, 1, 0.8862745, 0, 1,
-0.9791849, -0.7632513, -2.664313, 1, 0.8941177, 0, 1,
-0.9782434, 1.393673, 0.3210092, 1, 0.8980392, 0, 1,
-0.9739752, 0.8041266, -0.8633631, 1, 0.9058824, 0, 1,
-0.9716577, -1.779106, -2.684483, 1, 0.9137255, 0, 1,
-0.9680647, 2.122352, -1.199557, 1, 0.9176471, 0, 1,
-0.9656699, -0.9289685, -0.9873659, 1, 0.9254902, 0, 1,
-0.9589626, -0.1811022, -1.451431, 1, 0.9294118, 0, 1,
-0.9537547, -1.222935, -3.596948, 1, 0.9372549, 0, 1,
-0.9482959, -0.4236551, -1.996433, 1, 0.9411765, 0, 1,
-0.9474674, 0.2250586, -1.783249, 1, 0.9490196, 0, 1,
-0.9309718, 0.2746443, -0.1275198, 1, 0.9529412, 0, 1,
-0.9297701, -0.1550194, -0.7662013, 1, 0.9607843, 0, 1,
-0.928427, 0.9070824, 0.834841, 1, 0.9647059, 0, 1,
-0.9259205, -0.7938275, -2.82983, 1, 0.972549, 0, 1,
-0.9210669, 0.4739033, -0.9850961, 1, 0.9764706, 0, 1,
-0.9192211, -0.7186975, -1.357276, 1, 0.9843137, 0, 1,
-0.918157, -1.703792, -3.769802, 1, 0.9882353, 0, 1,
-0.914742, 0.5390275, -0.6311814, 1, 0.9960784, 0, 1,
-0.9121245, -1.864801, -3.396406, 0.9960784, 1, 0, 1,
-0.9020482, 0.9075609, -0.3293787, 0.9921569, 1, 0, 1,
-0.8929761, 0.5421898, -1.697876, 0.9843137, 1, 0, 1,
-0.8875976, 2.251168, -0.3261758, 0.9803922, 1, 0, 1,
-0.882359, 0.5640047, -0.4550587, 0.972549, 1, 0, 1,
-0.8751646, 1.818281, -0.2235071, 0.9686275, 1, 0, 1,
-0.863635, -0.4455821, -2.485702, 0.9607843, 1, 0, 1,
-0.860038, 0.4770005, -1.801577, 0.9568627, 1, 0, 1,
-0.8586403, 1.24967, -0.03693295, 0.9490196, 1, 0, 1,
-0.8584344, 1.375788, -1.363985, 0.945098, 1, 0, 1,
-0.8562763, 0.9557766, -0.5297412, 0.9372549, 1, 0, 1,
-0.8548791, 0.6046904, -0.279344, 0.9333333, 1, 0, 1,
-0.8495884, 1.193012, -0.5004127, 0.9254902, 1, 0, 1,
-0.8430883, -0.9431894, -3.648658, 0.9215686, 1, 0, 1,
-0.8359763, -0.5178558, -2.518455, 0.9137255, 1, 0, 1,
-0.8338593, -1.144045, -0.335604, 0.9098039, 1, 0, 1,
-0.828006, 0.1233307, -1.466974, 0.9019608, 1, 0, 1,
-0.826238, 0.7561467, 0.3164736, 0.8941177, 1, 0, 1,
-0.825896, -0.1578422, -2.972753, 0.8901961, 1, 0, 1,
-0.8247694, 0.296145, 2.105803, 0.8823529, 1, 0, 1,
-0.8241071, 0.06824552, -3.208447, 0.8784314, 1, 0, 1,
-0.8235408, 0.05312842, -1.508216, 0.8705882, 1, 0, 1,
-0.8205099, 0.8739698, 0.2311275, 0.8666667, 1, 0, 1,
-0.8203541, -1.059635, -3.499712, 0.8588235, 1, 0, 1,
-0.8201807, -1.242025, -0.5966978, 0.854902, 1, 0, 1,
-0.8096569, 0.2744131, -2.187855, 0.8470588, 1, 0, 1,
-0.8083518, -0.09597898, -1.740182, 0.8431373, 1, 0, 1,
-0.8021699, -1.663408, -3.73145, 0.8352941, 1, 0, 1,
-0.7976744, 0.05510407, -0.4955127, 0.8313726, 1, 0, 1,
-0.796795, 1.19893, -1.486502, 0.8235294, 1, 0, 1,
-0.7936212, 0.9416267, -1.758136, 0.8196079, 1, 0, 1,
-0.7918313, -1.244838, -2.894357, 0.8117647, 1, 0, 1,
-0.7916419, -1.901917, -1.916882, 0.8078431, 1, 0, 1,
-0.787118, 0.3119821, -1.644234, 0.8, 1, 0, 1,
-0.7857837, 1.007894, 0.3026559, 0.7921569, 1, 0, 1,
-0.7761017, 0.1337116, -3.190005, 0.7882353, 1, 0, 1,
-0.7681988, -0.04435278, -2.412541, 0.7803922, 1, 0, 1,
-0.7675347, -0.584642, -2.610768, 0.7764706, 1, 0, 1,
-0.7655895, -0.06978565, -3.011633, 0.7686275, 1, 0, 1,
-0.7647715, -0.4478617, -0.3559352, 0.7647059, 1, 0, 1,
-0.76469, 0.7524264, 1.163146, 0.7568628, 1, 0, 1,
-0.7634665, 0.2931502, -1.236602, 0.7529412, 1, 0, 1,
-0.7614058, 0.9265156, -1.05522, 0.7450981, 1, 0, 1,
-0.7589524, 0.04357773, -2.611606, 0.7411765, 1, 0, 1,
-0.758736, 1.261098, -0.04761543, 0.7333333, 1, 0, 1,
-0.7467894, 0.6548066, -0.7456586, 0.7294118, 1, 0, 1,
-0.7349353, -1.334305, -3.655702, 0.7215686, 1, 0, 1,
-0.7328135, 0.8881178, -0.2356883, 0.7176471, 1, 0, 1,
-0.7300839, -0.360055, -1.36903, 0.7098039, 1, 0, 1,
-0.7261115, 0.4102053, -1.673526, 0.7058824, 1, 0, 1,
-0.7201458, 0.2799395, -0.6867245, 0.6980392, 1, 0, 1,
-0.7194026, 0.8337309, -1.435568, 0.6901961, 1, 0, 1,
-0.717249, -1.190578, -3.463802, 0.6862745, 1, 0, 1,
-0.7159995, -2.850286, -2.301053, 0.6784314, 1, 0, 1,
-0.7123554, 0.8179454, 0.2909671, 0.6745098, 1, 0, 1,
-0.7050561, -0.2668548, -2.354724, 0.6666667, 1, 0, 1,
-0.7047098, 0.07411583, -2.198161, 0.6627451, 1, 0, 1,
-0.704468, 1.505718, -0.8611235, 0.654902, 1, 0, 1,
-0.7024519, -1.230152, -3.723987, 0.6509804, 1, 0, 1,
-0.7006607, -0.7105933, -3.321898, 0.6431373, 1, 0, 1,
-0.6974703, 0.03294384, -2.331449, 0.6392157, 1, 0, 1,
-0.6937963, 0.3934053, -0.7615312, 0.6313726, 1, 0, 1,
-0.6916656, 0.3213796, -1.327831, 0.627451, 1, 0, 1,
-0.6911634, -0.4681729, -0.9628236, 0.6196079, 1, 0, 1,
-0.6877237, 0.2732604, -1.405314, 0.6156863, 1, 0, 1,
-0.6836594, -1.191022, -3.610075, 0.6078432, 1, 0, 1,
-0.6808649, -0.05060428, -0.9560683, 0.6039216, 1, 0, 1,
-0.6795086, 0.5574748, 0.783694, 0.5960785, 1, 0, 1,
-0.676927, 1.029856, -0.4167464, 0.5882353, 1, 0, 1,
-0.6765089, -1.098101, -0.9316288, 0.5843138, 1, 0, 1,
-0.674885, -0.6435587, -1.593542, 0.5764706, 1, 0, 1,
-0.6740662, 0.575798, -0.2100245, 0.572549, 1, 0, 1,
-0.6690371, 0.0874169, -3.170224, 0.5647059, 1, 0, 1,
-0.6643691, -1.647313, -3.140342, 0.5607843, 1, 0, 1,
-0.6630777, 1.62561, -0.6564294, 0.5529412, 1, 0, 1,
-0.6629594, -1.000896, -4.929101, 0.5490196, 1, 0, 1,
-0.6626898, -3.917427, -1.305898, 0.5411765, 1, 0, 1,
-0.6610644, -0.278272, -1.444574, 0.5372549, 1, 0, 1,
-0.6579506, 0.4469008, -2.81106, 0.5294118, 1, 0, 1,
-0.6562492, -0.342363, -2.264569, 0.5254902, 1, 0, 1,
-0.6543154, -0.4994358, -1.902545, 0.5176471, 1, 0, 1,
-0.6510925, -0.4296091, -2.167985, 0.5137255, 1, 0, 1,
-0.6499013, -0.2966745, -1.719081, 0.5058824, 1, 0, 1,
-0.6391949, 0.004706577, -1.080672, 0.5019608, 1, 0, 1,
-0.6343168, 1.17181, -1.004778, 0.4941176, 1, 0, 1,
-0.6318661, 0.6012575, -0.1881155, 0.4862745, 1, 0, 1,
-0.6292472, -1.227834, -2.624036, 0.4823529, 1, 0, 1,
-0.62924, -2.018773, -1.99262, 0.4745098, 1, 0, 1,
-0.622103, 1.186364, -0.09552702, 0.4705882, 1, 0, 1,
-0.6206248, -1.568082, -2.359243, 0.4627451, 1, 0, 1,
-0.6182272, 0.3432, -1.513669, 0.4588235, 1, 0, 1,
-0.6161271, -1.346228, -2.915153, 0.4509804, 1, 0, 1,
-0.6097414, -0.06014561, -0.9457216, 0.4470588, 1, 0, 1,
-0.6011974, 0.4295504, 0.6378378, 0.4392157, 1, 0, 1,
-0.5997948, 0.2652824, -1.891791, 0.4352941, 1, 0, 1,
-0.5913094, 0.2956418, -0.1193024, 0.427451, 1, 0, 1,
-0.5860365, -0.8363041, -2.165217, 0.4235294, 1, 0, 1,
-0.5853146, 0.5482056, -0.5015547, 0.4156863, 1, 0, 1,
-0.5850512, 0.5754479, 0.2547507, 0.4117647, 1, 0, 1,
-0.5836679, 0.8819107, -0.8655568, 0.4039216, 1, 0, 1,
-0.5734726, 0.138232, -2.135201, 0.3960784, 1, 0, 1,
-0.5723868, 0.2674037, -1.829864, 0.3921569, 1, 0, 1,
-0.5703529, 1.134441, -1.073049, 0.3843137, 1, 0, 1,
-0.5672104, 0.4421753, -0.8687947, 0.3803922, 1, 0, 1,
-0.5639295, -0.2362316, -2.293763, 0.372549, 1, 0, 1,
-0.5557517, 1.550032, -1.505111, 0.3686275, 1, 0, 1,
-0.5531478, 0.9972287, -0.725062, 0.3607843, 1, 0, 1,
-0.5484846, -0.5631537, -3.62217, 0.3568628, 1, 0, 1,
-0.548417, -0.3323664, -2.386886, 0.3490196, 1, 0, 1,
-0.545515, -0.5487445, -2.134789, 0.345098, 1, 0, 1,
-0.5451054, 0.1646209, -1.191969, 0.3372549, 1, 0, 1,
-0.5448342, -0.3046544, -1.946184, 0.3333333, 1, 0, 1,
-0.5392059, 0.9595588, -1.208711, 0.3254902, 1, 0, 1,
-0.5390258, -0.7591111, -3.164547, 0.3215686, 1, 0, 1,
-0.5342937, -0.8691559, -3.378538, 0.3137255, 1, 0, 1,
-0.5339603, -1.778685, -3.670603, 0.3098039, 1, 0, 1,
-0.5300984, -0.686134, -1.208185, 0.3019608, 1, 0, 1,
-0.5291459, 0.0598463, -0.7436802, 0.2941177, 1, 0, 1,
-0.5277992, -1.194047, -2.210348, 0.2901961, 1, 0, 1,
-0.5244314, 0.2077387, -1.950986, 0.282353, 1, 0, 1,
-0.5229399, 0.02191025, -1.317407, 0.2784314, 1, 0, 1,
-0.5165861, 2.179725, 0.918684, 0.2705882, 1, 0, 1,
-0.5152803, 0.5913032, -0.7550464, 0.2666667, 1, 0, 1,
-0.5135372, -2.236516, -2.889561, 0.2588235, 1, 0, 1,
-0.506609, -0.5518425, -1.386298, 0.254902, 1, 0, 1,
-0.5043116, -1.228677, -2.20437, 0.2470588, 1, 0, 1,
-0.5042489, -0.09613354, -1.856013, 0.2431373, 1, 0, 1,
-0.5008023, -1.675101, -2.987446, 0.2352941, 1, 0, 1,
-0.4970038, -0.8978482, -3.032295, 0.2313726, 1, 0, 1,
-0.4957327, 0.8888697, -0.4623621, 0.2235294, 1, 0, 1,
-0.4919479, -0.1736687, -0.6968446, 0.2196078, 1, 0, 1,
-0.4864381, -0.7620246, -2.149299, 0.2117647, 1, 0, 1,
-0.4853607, -0.516446, -2.920519, 0.2078431, 1, 0, 1,
-0.4834048, -0.03765862, -2.057345, 0.2, 1, 0, 1,
-0.4824892, -0.860806, -2.749396, 0.1921569, 1, 0, 1,
-0.4667643, -0.2479467, -1.833436, 0.1882353, 1, 0, 1,
-0.4562466, -0.3015829, -1.443626, 0.1803922, 1, 0, 1,
-0.4496744, 0.5182268, -0.3122323, 0.1764706, 1, 0, 1,
-0.4495147, 0.5766737, 0.5639805, 0.1686275, 1, 0, 1,
-0.4471581, -1.924172, -2.621084, 0.1647059, 1, 0, 1,
-0.44059, -1.898657, -2.83774, 0.1568628, 1, 0, 1,
-0.4388864, 0.2069073, -2.273292, 0.1529412, 1, 0, 1,
-0.4388221, 0.6338859, 0.09287119, 0.145098, 1, 0, 1,
-0.4366872, 0.6921885, -0.8541178, 0.1411765, 1, 0, 1,
-0.4346653, 1.029742, 0.134144, 0.1333333, 1, 0, 1,
-0.4334567, 0.9067981, -0.9354542, 0.1294118, 1, 0, 1,
-0.4292891, 1.665031, -1.13786, 0.1215686, 1, 0, 1,
-0.4278332, -0.70212, -2.499769, 0.1176471, 1, 0, 1,
-0.4227449, -0.8479822, -4.754104, 0.1098039, 1, 0, 1,
-0.4206506, -0.3199767, -2.225914, 0.1058824, 1, 0, 1,
-0.4204358, -1.355348, -1.712518, 0.09803922, 1, 0, 1,
-0.4166857, 1.009982, 0.178784, 0.09019608, 1, 0, 1,
-0.4157015, -0.9326897, -2.513497, 0.08627451, 1, 0, 1,
-0.4123699, 1.35077, -0.7045015, 0.07843138, 1, 0, 1,
-0.4069932, 1.193457, -0.4076501, 0.07450981, 1, 0, 1,
-0.4047799, 1.467851, -0.4789509, 0.06666667, 1, 0, 1,
-0.403178, -1.119408, -3.606734, 0.0627451, 1, 0, 1,
-0.4022947, -0.2282286, -1.757236, 0.05490196, 1, 0, 1,
-0.4017892, 0.2714529, 1.381855, 0.05098039, 1, 0, 1,
-0.4004218, 1.259121, -0.8310176, 0.04313726, 1, 0, 1,
-0.3945587, -1.313331, -4.785451, 0.03921569, 1, 0, 1,
-0.3887041, -0.1552226, -2.792585, 0.03137255, 1, 0, 1,
-0.3867826, 1.264431, 0.01998018, 0.02745098, 1, 0, 1,
-0.3845436, 0.9606909, -0.5749862, 0.01960784, 1, 0, 1,
-0.375735, 0.6327916, -0.02810207, 0.01568628, 1, 0, 1,
-0.3708636, 0.4867748, 0.2041319, 0.007843138, 1, 0, 1,
-0.3656515, 0.4787127, -0.1741378, 0.003921569, 1, 0, 1,
-0.3565861, 1.564637, -1.146629, 0, 1, 0.003921569, 1,
-0.3535494, 0.1545156, -0.9514004, 0, 1, 0.01176471, 1,
-0.350384, 0.2864709, -1.650422, 0, 1, 0.01568628, 1,
-0.3499881, 1.018939, 0.9392669, 0, 1, 0.02352941, 1,
-0.347506, 0.3844363, -0.03876477, 0, 1, 0.02745098, 1,
-0.3461486, 0.0618276, -2.044492, 0, 1, 0.03529412, 1,
-0.3448305, 0.9588643, 0.2146203, 0, 1, 0.03921569, 1,
-0.3407575, 0.3171845, -0.4059297, 0, 1, 0.04705882, 1,
-0.340694, 0.4596042, -0.8909174, 0, 1, 0.05098039, 1,
-0.3380535, -1.458775, -3.095682, 0, 1, 0.05882353, 1,
-0.3363439, 1.191739, -2.195784, 0, 1, 0.0627451, 1,
-0.3361879, 0.83231, 0.02105646, 0, 1, 0.07058824, 1,
-0.3323879, 0.2491097, -0.7026764, 0, 1, 0.07450981, 1,
-0.3311269, -0.3542741, -4.112444, 0, 1, 0.08235294, 1,
-0.3294514, -0.05474236, -0.8689572, 0, 1, 0.08627451, 1,
-0.3292223, 0.9796783, 0.268704, 0, 1, 0.09411765, 1,
-0.3269304, -2.748114, -3.851214, 0, 1, 0.1019608, 1,
-0.3243379, 1.513473, -2.697926, 0, 1, 0.1058824, 1,
-0.3241458, 2.198012, 2.637819, 0, 1, 0.1137255, 1,
-0.3219136, -0.07754786, -1.995918, 0, 1, 0.1176471, 1,
-0.3201308, -0.3458507, -3.071616, 0, 1, 0.1254902, 1,
-0.3189477, 0.8696474, -0.7056676, 0, 1, 0.1294118, 1,
-0.3172139, 0.4929573, 0.7197869, 0, 1, 0.1372549, 1,
-0.3168639, -0.08300675, -0.02566376, 0, 1, 0.1411765, 1,
-0.3154777, -0.3094845, -2.950358, 0, 1, 0.1490196, 1,
-0.3121282, -0.123098, 0.1328286, 0, 1, 0.1529412, 1,
-0.3055521, 0.3095565, -1.133852, 0, 1, 0.1607843, 1,
-0.2947616, -1.16294, -4.343052, 0, 1, 0.1647059, 1,
-0.2924312, -0.7334917, -1.11245, 0, 1, 0.172549, 1,
-0.2896563, -0.493469, -4.136059, 0, 1, 0.1764706, 1,
-0.2890643, -1.971567, -2.646312, 0, 1, 0.1843137, 1,
-0.2889499, 1.199818, -2.15953, 0, 1, 0.1882353, 1,
-0.281237, 1.682293, -0.637795, 0, 1, 0.1960784, 1,
-0.2761127, 0.7083092, -0.5323174, 0, 1, 0.2039216, 1,
-0.2753963, 0.4114221, -2.442725, 0, 1, 0.2078431, 1,
-0.2727617, -0.7815594, -3.422444, 0, 1, 0.2156863, 1,
-0.2724712, 0.7720569, -0.9261093, 0, 1, 0.2196078, 1,
-0.2723791, 1.707262, 0.4514521, 0, 1, 0.227451, 1,
-0.2723088, -0.005962981, -1.140117, 0, 1, 0.2313726, 1,
-0.2688308, -0.9599527, -4.394549, 0, 1, 0.2392157, 1,
-0.2640654, -0.8451465, -3.712918, 0, 1, 0.2431373, 1,
-0.2632684, -0.06963719, -1.261946, 0, 1, 0.2509804, 1,
-0.2626525, 0.3687693, -0.6731313, 0, 1, 0.254902, 1,
-0.2591551, 1.351045, 0.469533, 0, 1, 0.2627451, 1,
-0.2501535, -0.8190449, -3.438489, 0, 1, 0.2666667, 1,
-0.249182, 1.182377, -0.8377575, 0, 1, 0.2745098, 1,
-0.2471656, -0.3035334, -1.166381, 0, 1, 0.2784314, 1,
-0.2469584, -0.6139252, -1.753914, 0, 1, 0.2862745, 1,
-0.2425147, 1.383765, 1.434195, 0, 1, 0.2901961, 1,
-0.2389801, 0.3736385, -0.09917889, 0, 1, 0.2980392, 1,
-0.2375778, -0.4507954, -4.305635, 0, 1, 0.3058824, 1,
-0.2372664, -1.312588, -4.084151, 0, 1, 0.3098039, 1,
-0.2305412, -0.07091752, -3.063567, 0, 1, 0.3176471, 1,
-0.2244133, -1.606262, -2.377004, 0, 1, 0.3215686, 1,
-0.2175882, 1.10462, 0.3944487, 0, 1, 0.3294118, 1,
-0.2172723, -0.5643633, -1.245902, 0, 1, 0.3333333, 1,
-0.214788, 2.322579, -0.7788115, 0, 1, 0.3411765, 1,
-0.2135871, -1.707227, -3.069876, 0, 1, 0.345098, 1,
-0.2135565, 1.258104, -1.353378, 0, 1, 0.3529412, 1,
-0.2111913, -2.459537, -3.608435, 0, 1, 0.3568628, 1,
-0.2094214, 0.2592605, 0.2276383, 0, 1, 0.3647059, 1,
-0.2029098, -1.455129, -2.161026, 0, 1, 0.3686275, 1,
-0.2027121, -0.386682, -2.258114, 0, 1, 0.3764706, 1,
-0.201945, 0.2377923, -0.5727798, 0, 1, 0.3803922, 1,
-0.2012752, 0.3663722, -1.981261, 0, 1, 0.3882353, 1,
-0.1994958, 0.1161229, -0.8340328, 0, 1, 0.3921569, 1,
-0.1988484, -0.01480308, -1.257702, 0, 1, 0.4, 1,
-0.1941401, -0.6578023, -3.334769, 0, 1, 0.4078431, 1,
-0.1935614, -0.6326601, -2.705132, 0, 1, 0.4117647, 1,
-0.1929054, -0.3384601, -1.695309, 0, 1, 0.4196078, 1,
-0.1926355, -1.170971, -3.222095, 0, 1, 0.4235294, 1,
-0.1919789, 0.4083493, -1.644921, 0, 1, 0.4313726, 1,
-0.1911493, 1.232134, -0.7758331, 0, 1, 0.4352941, 1,
-0.1897719, -0.102968, -0.5525084, 0, 1, 0.4431373, 1,
-0.1890942, -1.582073, -3.416152, 0, 1, 0.4470588, 1,
-0.1888101, -0.5077463, -3.002858, 0, 1, 0.454902, 1,
-0.1874242, 1.332219, -0.6734282, 0, 1, 0.4588235, 1,
-0.1871408, 0.3178256, -2.016301, 0, 1, 0.4666667, 1,
-0.1832473, -0.1705142, -3.926974, 0, 1, 0.4705882, 1,
-0.1794162, -1.568207, -2.745885, 0, 1, 0.4784314, 1,
-0.175519, 1.414647, 0.05093835, 0, 1, 0.4823529, 1,
-0.1752798, 0.5369068, -0.5639446, 0, 1, 0.4901961, 1,
-0.1727186, -0.1525442, -0.8260272, 0, 1, 0.4941176, 1,
-0.1721705, 0.3489884, 0.08464061, 0, 1, 0.5019608, 1,
-0.1684472, 1.352608, 0.7930812, 0, 1, 0.509804, 1,
-0.1530672, 2.750774, -0.4597071, 0, 1, 0.5137255, 1,
-0.1512869, 1.235042, 1.431604, 0, 1, 0.5215687, 1,
-0.1499367, -0.5261881, -2.017345, 0, 1, 0.5254902, 1,
-0.1497236, 0.3759964, -0.4941014, 0, 1, 0.5333334, 1,
-0.1482837, 0.5687695, -1.647668, 0, 1, 0.5372549, 1,
-0.1479264, -0.4079547, -2.044431, 0, 1, 0.5450981, 1,
-0.1469719, -1.19137, -2.839159, 0, 1, 0.5490196, 1,
-0.1441756, 0.3089892, 1.672911, 0, 1, 0.5568628, 1,
-0.1401985, 1.011034, -1.313876, 0, 1, 0.5607843, 1,
-0.1378845, 1.23095, 0.6069388, 0, 1, 0.5686275, 1,
-0.1340006, -1.122835, -3.386603, 0, 1, 0.572549, 1,
-0.1338205, 0.03967609, -1.621997, 0, 1, 0.5803922, 1,
-0.1315262, -0.06611487, -1.401031, 0, 1, 0.5843138, 1,
-0.1297463, 0.725647, 0.8711661, 0, 1, 0.5921569, 1,
-0.1293619, 0.7004175, -1.989842, 0, 1, 0.5960785, 1,
-0.1195199, -0.4234689, -2.003544, 0, 1, 0.6039216, 1,
-0.1176238, 0.4777787, -0.1727559, 0, 1, 0.6117647, 1,
-0.1147745, 1.161988, -0.7091855, 0, 1, 0.6156863, 1,
-0.1147207, -0.8196941, -3.15962, 0, 1, 0.6235294, 1,
-0.1138311, 0.2500268, -1.093668, 0, 1, 0.627451, 1,
-0.1101526, -0.174986, -3.568853, 0, 1, 0.6352941, 1,
-0.1096161, 0.2402018, -0.9872243, 0, 1, 0.6392157, 1,
-0.1089084, -0.06267496, -2.113775, 0, 1, 0.6470588, 1,
-0.1080075, 0.8295646, 3.106682, 0, 1, 0.6509804, 1,
-0.1076882, 0.1020522, 0.2998318, 0, 1, 0.6588235, 1,
-0.1031124, 1.2162, 0.5494416, 0, 1, 0.6627451, 1,
-0.1014747, -0.2342817, -3.041613, 0, 1, 0.6705883, 1,
-0.1001444, -0.8712348, -1.716125, 0, 1, 0.6745098, 1,
-0.09939023, 0.05582379, -1.925868, 0, 1, 0.682353, 1,
-0.09717132, 0.529786, 0.5328044, 0, 1, 0.6862745, 1,
-0.09572412, -1.295831, -3.532407, 0, 1, 0.6941177, 1,
-0.09206154, -0.2956358, -4.338106, 0, 1, 0.7019608, 1,
-0.08854454, -1.052045, -3.154734, 0, 1, 0.7058824, 1,
-0.08832554, -1.476613, -3.62382, 0, 1, 0.7137255, 1,
-0.08831175, 0.5314555, 0.8367808, 0, 1, 0.7176471, 1,
-0.08796321, 0.969246, 0.7974927, 0, 1, 0.7254902, 1,
-0.08293179, -1.315707, -2.911185, 0, 1, 0.7294118, 1,
-0.08239545, 0.09604143, -1.442207, 0, 1, 0.7372549, 1,
-0.07317047, 2.33983, 0.002825073, 0, 1, 0.7411765, 1,
-0.07177974, -1.063422, -3.885722, 0, 1, 0.7490196, 1,
-0.06612707, 0.926551, -0.874321, 0, 1, 0.7529412, 1,
-0.06184852, -1.897895, -3.105341, 0, 1, 0.7607843, 1,
-0.06153316, 0.890709, -0.895317, 0, 1, 0.7647059, 1,
-0.05155324, 1.4238, -0.8423169, 0, 1, 0.772549, 1,
-0.04866791, 1.310705, -0.1150714, 0, 1, 0.7764706, 1,
-0.04810891, -1.035403, -3.674275, 0, 1, 0.7843137, 1,
-0.0479057, 0.04268391, -1.696829, 0, 1, 0.7882353, 1,
-0.04569123, 0.6391559, 0.6206747, 0, 1, 0.7960784, 1,
-0.04562973, 1.755647, -0.554821, 0, 1, 0.8039216, 1,
-0.04464928, -0.7762873, -3.794428, 0, 1, 0.8078431, 1,
-0.03753072, 1.647283, -0.2864119, 0, 1, 0.8156863, 1,
-0.03564502, -0.8452051, -2.890481, 0, 1, 0.8196079, 1,
-0.03487596, 0.02819906, 0.4205117, 0, 1, 0.827451, 1,
-0.03481218, 0.9758795, -0.7057676, 0, 1, 0.8313726, 1,
-0.03215658, 0.5922151, -0.4046793, 0, 1, 0.8392157, 1,
-0.03153604, -0.001355965, -1.539177, 0, 1, 0.8431373, 1,
-0.02896083, 0.6612362, 0.9643612, 0, 1, 0.8509804, 1,
-0.01770258, -0.9350719, -3.194763, 0, 1, 0.854902, 1,
-0.0165371, 1.151424, -0.5388495, 0, 1, 0.8627451, 1,
-0.0153148, -2.267156, -2.820855, 0, 1, 0.8666667, 1,
-0.01483554, -0.242996, -4.850944, 0, 1, 0.8745098, 1,
-0.01141902, 1.388731, 0.1762394, 0, 1, 0.8784314, 1,
-0.009754262, 0.6043376, 0.7425015, 0, 1, 0.8862745, 1,
-0.006864504, -1.560979, -4.203498, 0, 1, 0.8901961, 1,
-0.004255521, 1.257392, 0.3920175, 0, 1, 0.8980392, 1,
-0.002849542, -0.7997286, -2.532738, 0, 1, 0.9058824, 1,
0.002234014, -0.4375755, 3.697569, 0, 1, 0.9098039, 1,
0.003112096, -1.022938, 4.618515, 0, 1, 0.9176471, 1,
0.004845198, -0.3281552, 2.961138, 0, 1, 0.9215686, 1,
0.006404128, 1.189904, -0.7850778, 0, 1, 0.9294118, 1,
0.008446423, 0.6683944, 1.010407, 0, 1, 0.9333333, 1,
0.01084444, -0.9368699, 4.330406, 0, 1, 0.9411765, 1,
0.01336041, -0.533594, 2.034051, 0, 1, 0.945098, 1,
0.01799046, 0.6513228, 0.5410535, 0, 1, 0.9529412, 1,
0.01828963, -0.8951143, 4.543768, 0, 1, 0.9568627, 1,
0.02420059, -0.8545572, 3.187943, 0, 1, 0.9647059, 1,
0.02831171, 0.0493646, 2.222212, 0, 1, 0.9686275, 1,
0.02845854, -0.1172329, 2.341683, 0, 1, 0.9764706, 1,
0.03408622, 1.244772, -1.229752, 0, 1, 0.9803922, 1,
0.03456645, 0.02020104, 0.2856403, 0, 1, 0.9882353, 1,
0.03833036, -2.774021, 4.263083, 0, 1, 0.9921569, 1,
0.04194203, -0.1809116, 3.403263, 0, 1, 1, 1,
0.04284212, 0.6682218, -1.541865, 0, 0.9921569, 1, 1,
0.04285322, 1.641025, -1.072655, 0, 0.9882353, 1, 1,
0.04531204, -1.197307, 3.683962, 0, 0.9803922, 1, 1,
0.04724241, -0.6597225, 2.568677, 0, 0.9764706, 1, 1,
0.04968477, 0.03084394, 0.08639906, 0, 0.9686275, 1, 1,
0.0515861, 1.132478, 0.1471882, 0, 0.9647059, 1, 1,
0.05697811, -1.445575, 2.761792, 0, 0.9568627, 1, 1,
0.06016549, 1.192726, -0.3662904, 0, 0.9529412, 1, 1,
0.06162008, 1.933367, -0.020203, 0, 0.945098, 1, 1,
0.06162373, -1.328187, 4.017051, 0, 0.9411765, 1, 1,
0.06237241, -0.7054365, 3.086494, 0, 0.9333333, 1, 1,
0.06671786, -0.2552834, 2.840721, 0, 0.9294118, 1, 1,
0.06764408, -0.009835432, 3.353397, 0, 0.9215686, 1, 1,
0.08154774, 0.4241481, 0.1451525, 0, 0.9176471, 1, 1,
0.08546101, -0.4797028, 3.059042, 0, 0.9098039, 1, 1,
0.08570646, 0.9062138, 0.7960335, 0, 0.9058824, 1, 1,
0.08945941, 1.510867, -0.4333815, 0, 0.8980392, 1, 1,
0.09025676, -0.1886512, 2.384358, 0, 0.8901961, 1, 1,
0.09668302, 3.062502, 1.973837, 0, 0.8862745, 1, 1,
0.09727683, -2.172959, 3.813656, 0, 0.8784314, 1, 1,
0.09764937, 0.2031677, 1.458461, 0, 0.8745098, 1, 1,
0.1003531, -0.5240402, 3.902219, 0, 0.8666667, 1, 1,
0.1031661, 0.380257, 0.5532957, 0, 0.8627451, 1, 1,
0.1039784, -0.112461, 0.3709926, 0, 0.854902, 1, 1,
0.1043086, 0.5996805, 0.4487692, 0, 0.8509804, 1, 1,
0.1049248, 0.4876262, 0.1946288, 0, 0.8431373, 1, 1,
0.1051453, -1.829149, 2.66207, 0, 0.8392157, 1, 1,
0.1055531, -0.6038477, 1.996748, 0, 0.8313726, 1, 1,
0.1145719, 0.8382913, -1.222779, 0, 0.827451, 1, 1,
0.114868, 0.3992018, -0.7422575, 0, 0.8196079, 1, 1,
0.1187702, 1.156973, 1.119649, 0, 0.8156863, 1, 1,
0.1206305, -0.2471329, 2.320216, 0, 0.8078431, 1, 1,
0.1228155, 0.06645891, 2.314834, 0, 0.8039216, 1, 1,
0.1232166, 0.7110397, 0.6602316, 0, 0.7960784, 1, 1,
0.1255034, 1.859175, -1.076671, 0, 0.7882353, 1, 1,
0.1345435, -1.29676, 2.242292, 0, 0.7843137, 1, 1,
0.1355164, 1.542116, 1.710301, 0, 0.7764706, 1, 1,
0.1384438, -1.274905, 3.840118, 0, 0.772549, 1, 1,
0.1395793, 0.976082, -1.512435, 0, 0.7647059, 1, 1,
0.1440929, -0.4163615, 1.675427, 0, 0.7607843, 1, 1,
0.152612, 1.639801, -0.1304556, 0, 0.7529412, 1, 1,
0.1528716, 1.195152, 1.935336, 0, 0.7490196, 1, 1,
0.1542179, 1.107428, 1.530146, 0, 0.7411765, 1, 1,
0.154406, 0.4809755, -1.010885, 0, 0.7372549, 1, 1,
0.1544511, 1.368948, -0.1492899, 0, 0.7294118, 1, 1,
0.1563946, -1.495682, 2.436564, 0, 0.7254902, 1, 1,
0.1580841, -1.001129, 2.614946, 0, 0.7176471, 1, 1,
0.1598283, -1.912074, 3.430168, 0, 0.7137255, 1, 1,
0.1620811, -1.588288, 2.795599, 0, 0.7058824, 1, 1,
0.1774321, 0.2633578, -0.2987919, 0, 0.6980392, 1, 1,
0.1796144, 0.1612885, 1.718742, 0, 0.6941177, 1, 1,
0.1811787, 0.9852461, -0.1679025, 0, 0.6862745, 1, 1,
0.1840393, 0.369361, 1.714049, 0, 0.682353, 1, 1,
0.1973085, 0.8345744, -0.1249482, 0, 0.6745098, 1, 1,
0.1974703, 1.765202, 1.04425, 0, 0.6705883, 1, 1,
0.2035179, 0.09895727, 1.809922, 0, 0.6627451, 1, 1,
0.2077841, 1.356783, -1.11904, 0, 0.6588235, 1, 1,
0.211303, 0.1349047, 2.726444, 0, 0.6509804, 1, 1,
0.2206117, -1.334144, 2.965137, 0, 0.6470588, 1, 1,
0.2256047, 1.973087, 0.3114485, 0, 0.6392157, 1, 1,
0.2275724, -1.237763, 4.82005, 0, 0.6352941, 1, 1,
0.2330739, 0.3196559, -1.299291, 0, 0.627451, 1, 1,
0.2338903, -0.7295532, 2.505021, 0, 0.6235294, 1, 1,
0.2345561, 0.8625709, -0.09037391, 0, 0.6156863, 1, 1,
0.2358507, -0.8210217, 3.295847, 0, 0.6117647, 1, 1,
0.236145, -0.7226211, 3.356996, 0, 0.6039216, 1, 1,
0.2386255, -2.501637, 4.081803, 0, 0.5960785, 1, 1,
0.2423696, -0.05639454, 0.543501, 0, 0.5921569, 1, 1,
0.2428818, -0.3361547, 5.339026, 0, 0.5843138, 1, 1,
0.244955, 0.2598341, 0.9529543, 0, 0.5803922, 1, 1,
0.2565944, 0.5971053, 0.917918, 0, 0.572549, 1, 1,
0.2582093, 0.3760761, -0.04168364, 0, 0.5686275, 1, 1,
0.2644255, 0.3728512, 0.4783451, 0, 0.5607843, 1, 1,
0.2651679, 0.340072, 1.684138, 0, 0.5568628, 1, 1,
0.2672068, 0.7140837, -0.2908146, 0, 0.5490196, 1, 1,
0.2729478, 1.847981, -0.6707624, 0, 0.5450981, 1, 1,
0.2770893, 0.02312439, 0.4742605, 0, 0.5372549, 1, 1,
0.2793212, -0.03161474, 0.6841773, 0, 0.5333334, 1, 1,
0.2793326, -0.09183516, 1.709007, 0, 0.5254902, 1, 1,
0.2829302, 0.4121644, -1.424502, 0, 0.5215687, 1, 1,
0.2857695, 1.287724, -0.9537476, 0, 0.5137255, 1, 1,
0.2875341, 0.3032646, -0.1070581, 0, 0.509804, 1, 1,
0.2892094, -1.00237, 2.162973, 0, 0.5019608, 1, 1,
0.2892419, -0.4534547, 1.995867, 0, 0.4941176, 1, 1,
0.2952862, -0.1921162, 2.353977, 0, 0.4901961, 1, 1,
0.2954541, 1.897014, 0.1995711, 0, 0.4823529, 1, 1,
0.2963746, -0.4863483, 3.473422, 0, 0.4784314, 1, 1,
0.2963867, -2.457395, 4.219639, 0, 0.4705882, 1, 1,
0.2976144, 0.03613761, 1.09517, 0, 0.4666667, 1, 1,
0.297744, -2.103462, 3.526422, 0, 0.4588235, 1, 1,
0.3022174, -0.3908644, 3.062478, 0, 0.454902, 1, 1,
0.3047956, -0.765434, 2.775992, 0, 0.4470588, 1, 1,
0.3052813, 0.0003742466, 1.486425, 0, 0.4431373, 1, 1,
0.3060956, 1.822447, -0.9762011, 0, 0.4352941, 1, 1,
0.3065972, -0.8649653, 1.737799, 0, 0.4313726, 1, 1,
0.3071676, 0.5679237, -0.04439341, 0, 0.4235294, 1, 1,
0.3073681, -1.546969, 2.597394, 0, 0.4196078, 1, 1,
0.3107871, 0.9862019, 0.2046284, 0, 0.4117647, 1, 1,
0.313211, 1.185487, -0.3803189, 0, 0.4078431, 1, 1,
0.314646, -0.3757132, 4.859652, 0, 0.4, 1, 1,
0.3279929, 1.126332, 0.4644935, 0, 0.3921569, 1, 1,
0.3290203, 0.152455, -0.5040967, 0, 0.3882353, 1, 1,
0.3297224, -1.653086, 2.923668, 0, 0.3803922, 1, 1,
0.3359846, 0.5900472, 0.209968, 0, 0.3764706, 1, 1,
0.3381073, 2.507418, -0.02812464, 0, 0.3686275, 1, 1,
0.3404417, -0.4870467, 1.762474, 0, 0.3647059, 1, 1,
0.3406737, -1.148065, 1.925181, 0, 0.3568628, 1, 1,
0.342038, 0.7267449, -0.5666136, 0, 0.3529412, 1, 1,
0.342723, -0.2283618, 1.958071, 0, 0.345098, 1, 1,
0.3442769, -1.842031, 1.734956, 0, 0.3411765, 1, 1,
0.3462358, 0.8743357, 1.145587, 0, 0.3333333, 1, 1,
0.347226, -0.3710803, 1.913161, 0, 0.3294118, 1, 1,
0.3472758, -1.871608, 2.144835, 0, 0.3215686, 1, 1,
0.3485965, 0.2250104, 0.4293233, 0, 0.3176471, 1, 1,
0.3497242, -0.9058592, 1.004297, 0, 0.3098039, 1, 1,
0.3547252, -0.9664319, 2.398539, 0, 0.3058824, 1, 1,
0.3599128, -0.6239512, 3.38424, 0, 0.2980392, 1, 1,
0.3669246, -0.240598, 2.999355, 0, 0.2901961, 1, 1,
0.3693054, -0.0087233, 2.140261, 0, 0.2862745, 1, 1,
0.3694435, -0.4230642, 2.900095, 0, 0.2784314, 1, 1,
0.3709892, 1.730294, -0.4261347, 0, 0.2745098, 1, 1,
0.3728066, -0.2630624, 3.561298, 0, 0.2666667, 1, 1,
0.3794828, 0.4644089, 2.083385, 0, 0.2627451, 1, 1,
0.3840722, 0.0514759, 0.7436454, 0, 0.254902, 1, 1,
0.3845831, 0.6529991, -0.7570271, 0, 0.2509804, 1, 1,
0.3847573, 0.5528327, -0.00788884, 0, 0.2431373, 1, 1,
0.3930888, 0.8089207, 0.946095, 0, 0.2392157, 1, 1,
0.3974786, 0.5522349, 1.402312, 0, 0.2313726, 1, 1,
0.3987324, 0.3859166, 0.7430745, 0, 0.227451, 1, 1,
0.3993157, -1.896937, 1.273251, 0, 0.2196078, 1, 1,
0.4047608, -1.341215, 4.055298, 0, 0.2156863, 1, 1,
0.4049996, 0.2408601, 2.318484, 0, 0.2078431, 1, 1,
0.4117408, 1.84276, 1.612803, 0, 0.2039216, 1, 1,
0.412301, -2.062115, 4.803354, 0, 0.1960784, 1, 1,
0.4127839, 0.1655329, 0.861567, 0, 0.1882353, 1, 1,
0.4144267, 0.1243673, 0.856689, 0, 0.1843137, 1, 1,
0.4153647, 1.520778, -1.196583, 0, 0.1764706, 1, 1,
0.4179059, -0.2066942, 2.940592, 0, 0.172549, 1, 1,
0.4194831, 0.1334036, 1.713398, 0, 0.1647059, 1, 1,
0.4213082, 0.1962528, 1.920485, 0, 0.1607843, 1, 1,
0.4234551, 0.8357908, -0.690603, 0, 0.1529412, 1, 1,
0.4292691, -0.7177905, 2.340933, 0, 0.1490196, 1, 1,
0.4330424, -0.852881, 1.746619, 0, 0.1411765, 1, 1,
0.4356045, 0.8553714, 1.315196, 0, 0.1372549, 1, 1,
0.4357691, 1.474091, 0.1411877, 0, 0.1294118, 1, 1,
0.4391876, -1.302009, 4.592371, 0, 0.1254902, 1, 1,
0.4440677, 0.8453699, 0.5383022, 0, 0.1176471, 1, 1,
0.444318, 0.4682089, -0.03486414, 0, 0.1137255, 1, 1,
0.4486233, 1.353514, 1.139241, 0, 0.1058824, 1, 1,
0.4508446, 0.3159571, 0.8673285, 0, 0.09803922, 1, 1,
0.4517743, 0.6244769, 0.01947794, 0, 0.09411765, 1, 1,
0.4530447, -0.1780683, 1.84245, 0, 0.08627451, 1, 1,
0.4538102, -0.6827826, 3.596567, 0, 0.08235294, 1, 1,
0.455954, -1.207492, 2.361553, 0, 0.07450981, 1, 1,
0.4575973, -1.083047, 4.146888, 0, 0.07058824, 1, 1,
0.4616022, -0.1923777, 2.37491, 0, 0.0627451, 1, 1,
0.4625564, 0.2041137, 0.5298873, 0, 0.05882353, 1, 1,
0.4637344, -0.01274623, 2.030486, 0, 0.05098039, 1, 1,
0.4638703, 0.9227781, 0.5980366, 0, 0.04705882, 1, 1,
0.4661062, -0.1275702, 3.424928, 0, 0.03921569, 1, 1,
0.4661385, 1.648783, 0.3861707, 0, 0.03529412, 1, 1,
0.467059, -0.3302502, 2.820248, 0, 0.02745098, 1, 1,
0.4734031, -1.044515, 1.790361, 0, 0.02352941, 1, 1,
0.4765498, 0.2851792, 0.3532649, 0, 0.01568628, 1, 1,
0.4769509, -1.572696, 2.961205, 0, 0.01176471, 1, 1,
0.4799773, -1.418498, 3.534832, 0, 0.003921569, 1, 1,
0.480246, 1.082948, 1.418106, 0.003921569, 0, 1, 1,
0.4829006, 1.362474, -0.1712615, 0.007843138, 0, 1, 1,
0.4834365, 0.3075369, 1.479248, 0.01568628, 0, 1, 1,
0.4913978, 2.267719, 0.687308, 0.01960784, 0, 1, 1,
0.4915185, -0.05523192, 3.263674, 0.02745098, 0, 1, 1,
0.4938764, -0.03552405, 0.3850344, 0.03137255, 0, 1, 1,
0.4961241, -1.493242, 3.873098, 0.03921569, 0, 1, 1,
0.4965957, -0.7472053, 3.558438, 0.04313726, 0, 1, 1,
0.4968949, 0.8497697, 0.1321247, 0.05098039, 0, 1, 1,
0.4976487, -0.3501991, 2.100999, 0.05490196, 0, 1, 1,
0.5135769, -1.010163, 3.092635, 0.0627451, 0, 1, 1,
0.5198291, -0.550689, 2.835091, 0.06666667, 0, 1, 1,
0.5205364, -1.083897, 2.312181, 0.07450981, 0, 1, 1,
0.5213239, -1.55783, 1.892633, 0.07843138, 0, 1, 1,
0.5229422, -1.595866, 1.878263, 0.08627451, 0, 1, 1,
0.5230535, -1.89805, 4.390897, 0.09019608, 0, 1, 1,
0.5233976, 0.9817278, 1.215031, 0.09803922, 0, 1, 1,
0.5268711, 1.951878, -1.73093, 0.1058824, 0, 1, 1,
0.5311227, 0.2698086, -0.2790454, 0.1098039, 0, 1, 1,
0.5333817, -0.3394911, 2.838748, 0.1176471, 0, 1, 1,
0.5371418, 0.1725315, -0.297733, 0.1215686, 0, 1, 1,
0.5372599, -0.008925613, 1.630041, 0.1294118, 0, 1, 1,
0.5378595, -0.3977638, 2.400859, 0.1333333, 0, 1, 1,
0.5410256, 1.571183, 0.6703098, 0.1411765, 0, 1, 1,
0.54277, -0.6268616, 2.610365, 0.145098, 0, 1, 1,
0.5448143, 1.033784, 0.6267345, 0.1529412, 0, 1, 1,
0.5453714, -0.1799921, 3.115631, 0.1568628, 0, 1, 1,
0.5472848, -0.4338612, 2.326824, 0.1647059, 0, 1, 1,
0.5501541, 1.604816, -1.584242, 0.1686275, 0, 1, 1,
0.5507664, -0.678047, 2.217913, 0.1764706, 0, 1, 1,
0.5684021, 0.2258221, -0.1506038, 0.1803922, 0, 1, 1,
0.5692431, 0.3157639, 1.17248, 0.1882353, 0, 1, 1,
0.5700575, 0.03727047, 1.658184, 0.1921569, 0, 1, 1,
0.57009, -1.682567, 3.875604, 0.2, 0, 1, 1,
0.5711832, -0.7744083, 1.721975, 0.2078431, 0, 1, 1,
0.5766066, -0.7263651, 0.7528043, 0.2117647, 0, 1, 1,
0.5778416, -0.4935501, 1.622296, 0.2196078, 0, 1, 1,
0.5844361, 0.556299, 1.137474, 0.2235294, 0, 1, 1,
0.5863567, -0.9000247, 4.268088, 0.2313726, 0, 1, 1,
0.5880745, -0.03349643, 1.86081, 0.2352941, 0, 1, 1,
0.5893626, 0.1072503, -0.2741243, 0.2431373, 0, 1, 1,
0.5918221, 1.021259, 0.884307, 0.2470588, 0, 1, 1,
0.591925, -0.4734954, 3.098548, 0.254902, 0, 1, 1,
0.5945251, -0.82544, 1.940178, 0.2588235, 0, 1, 1,
0.5967844, 0.7165697, 1.276587, 0.2666667, 0, 1, 1,
0.5992396, 0.1271231, 1.278639, 0.2705882, 0, 1, 1,
0.5997533, 0.678293, 0.09374324, 0.2784314, 0, 1, 1,
0.5997796, -0.3035977, 2.391407, 0.282353, 0, 1, 1,
0.6011565, 0.8139215, 0.7712483, 0.2901961, 0, 1, 1,
0.6015275, 0.08774344, 3.079474, 0.2941177, 0, 1, 1,
0.6025625, -1.135196, 2.636431, 0.3019608, 0, 1, 1,
0.6048648, -0.08515542, 0.6056969, 0.3098039, 0, 1, 1,
0.6052736, 0.07253335, 1.362567, 0.3137255, 0, 1, 1,
0.6115436, 0.2709781, 0.9419184, 0.3215686, 0, 1, 1,
0.6145775, -0.1637549, 1.087708, 0.3254902, 0, 1, 1,
0.6255945, -0.1603515, 2.9887, 0.3333333, 0, 1, 1,
0.6283717, 1.500501, 0.4953746, 0.3372549, 0, 1, 1,
0.6293494, 0.2228845, 1.743897, 0.345098, 0, 1, 1,
0.6344559, 0.1845229, 1.569741, 0.3490196, 0, 1, 1,
0.6464192, -1.859035, 1.670174, 0.3568628, 0, 1, 1,
0.6488669, 0.1067604, 2.009522, 0.3607843, 0, 1, 1,
0.6611717, 0.9750448, 0.9629259, 0.3686275, 0, 1, 1,
0.6640861, -0.222788, 0.2176038, 0.372549, 0, 1, 1,
0.6753734, -1.235506, 1.498933, 0.3803922, 0, 1, 1,
0.6794658, -0.4312575, 1.864413, 0.3843137, 0, 1, 1,
0.6823454, 1.256692, 1.948084, 0.3921569, 0, 1, 1,
0.6837084, -0.3428854, 0.9664026, 0.3960784, 0, 1, 1,
0.6887801, 0.1475989, 3.151646, 0.4039216, 0, 1, 1,
0.6921641, -1.035993, 2.577112, 0.4117647, 0, 1, 1,
0.6927221, -0.1093535, 2.324464, 0.4156863, 0, 1, 1,
0.6943638, 2.771465, 0.8146511, 0.4235294, 0, 1, 1,
0.701649, -0.1657992, 0.9379452, 0.427451, 0, 1, 1,
0.7158217, -0.1046397, 2.276788, 0.4352941, 0, 1, 1,
0.7321394, -0.02436683, 2.466086, 0.4392157, 0, 1, 1,
0.7324419, 2.045946, 0.5825873, 0.4470588, 0, 1, 1,
0.7353079, -0.3348905, 3.518845, 0.4509804, 0, 1, 1,
0.7361154, -0.3088505, 1.808461, 0.4588235, 0, 1, 1,
0.7380989, 0.3028201, -0.08777075, 0.4627451, 0, 1, 1,
0.7383912, 0.04975505, 1.747571, 0.4705882, 0, 1, 1,
0.7479346, -1.109334, 2.61096, 0.4745098, 0, 1, 1,
0.7493934, 2.023777, 1.227646, 0.4823529, 0, 1, 1,
0.7503493, 0.07093563, 0.7447504, 0.4862745, 0, 1, 1,
0.7517358, 1.67622, 0.7741566, 0.4941176, 0, 1, 1,
0.7537914, -0.1527134, 0.5126937, 0.5019608, 0, 1, 1,
0.7551051, -0.3631383, 1.409072, 0.5058824, 0, 1, 1,
0.759046, -0.04170379, 1.292438, 0.5137255, 0, 1, 1,
0.7625717, 0.2532491, 0.6367813, 0.5176471, 0, 1, 1,
0.7639489, 0.3203659, 0.7468578, 0.5254902, 0, 1, 1,
0.766149, 0.09357027, 2.077576, 0.5294118, 0, 1, 1,
0.7671192, 0.530003, 1.97358, 0.5372549, 0, 1, 1,
0.7671222, -0.7367846, 3.136729, 0.5411765, 0, 1, 1,
0.7856945, 0.5715927, 1.006633, 0.5490196, 0, 1, 1,
0.7952103, -1.856267, 3.365439, 0.5529412, 0, 1, 1,
0.7999231, 0.4190826, 0.1486182, 0.5607843, 0, 1, 1,
0.8042546, -2.322648, 1.814894, 0.5647059, 0, 1, 1,
0.810644, 0.6719199, 0.7222059, 0.572549, 0, 1, 1,
0.8111027, -0.7824372, 2.810804, 0.5764706, 0, 1, 1,
0.8205794, 1.952163, -0.4616187, 0.5843138, 0, 1, 1,
0.8206242, 2.223558, 2.129555, 0.5882353, 0, 1, 1,
0.8216369, -0.2325788, 0.9499934, 0.5960785, 0, 1, 1,
0.8256006, 0.1861635, 0.8974802, 0.6039216, 0, 1, 1,
0.8377398, -0.221312, 1.476451, 0.6078432, 0, 1, 1,
0.8404673, 0.3231364, 1.957216, 0.6156863, 0, 1, 1,
0.8510672, 0.1194757, -0.4062457, 0.6196079, 0, 1, 1,
0.854207, 0.06962558, 3.91526, 0.627451, 0, 1, 1,
0.8578393, -0.5790188, 1.15959, 0.6313726, 0, 1, 1,
0.8599173, -0.1573583, 1.226765, 0.6392157, 0, 1, 1,
0.8617864, -1.242097, 4.220952, 0.6431373, 0, 1, 1,
0.86297, -1.836339, 3.820375, 0.6509804, 0, 1, 1,
0.8667823, -1.322188, 3.415311, 0.654902, 0, 1, 1,
0.8701974, -1.618863, 3.609798, 0.6627451, 0, 1, 1,
0.8780211, -0.8168637, 1.766557, 0.6666667, 0, 1, 1,
0.8801368, 0.1351384, 1.744409, 0.6745098, 0, 1, 1,
0.8816916, 0.8549162, 0.9228104, 0.6784314, 0, 1, 1,
0.8837281, -0.3587095, 4.297252, 0.6862745, 0, 1, 1,
0.8856261, -0.880357, 2.93774, 0.6901961, 0, 1, 1,
0.8884465, -0.7915986, 2.292071, 0.6980392, 0, 1, 1,
0.8949446, 0.7377892, 1.401564, 0.7058824, 0, 1, 1,
0.8971864, 0.1656147, 0.2276855, 0.7098039, 0, 1, 1,
0.9006343, -1.278972, 3.066249, 0.7176471, 0, 1, 1,
0.9013286, -0.6890233, 0.7405472, 0.7215686, 0, 1, 1,
0.9081999, 0.3489025, 1.32265, 0.7294118, 0, 1, 1,
0.908505, -1.089901, 1.916002, 0.7333333, 0, 1, 1,
0.9098218, 1.057045, 0.7057269, 0.7411765, 0, 1, 1,
0.9109285, 1.058922, 0.03127888, 0.7450981, 0, 1, 1,
0.9111642, 0.3409989, 0.07435211, 0.7529412, 0, 1, 1,
0.914929, 1.503063, 0.787521, 0.7568628, 0, 1, 1,
0.9246412, -0.480256, 0.8325527, 0.7647059, 0, 1, 1,
0.9321174, -1.442595, 1.129673, 0.7686275, 0, 1, 1,
0.932981, 0.3665325, 1.895313, 0.7764706, 0, 1, 1,
0.9403551, -1.680702, 2.631808, 0.7803922, 0, 1, 1,
0.9415274, -0.6408718, 2.718133, 0.7882353, 0, 1, 1,
0.9436703, 0.7066128, 0.9535812, 0.7921569, 0, 1, 1,
0.9473901, -0.2369205, 0.8935585, 0.8, 0, 1, 1,
0.9494771, -1.729118, 3.072139, 0.8078431, 0, 1, 1,
0.9518578, -0.6866973, 2.457361, 0.8117647, 0, 1, 1,
0.9548005, -1.028448, 1.724251, 0.8196079, 0, 1, 1,
0.9561965, 1.035597, -0.3166389, 0.8235294, 0, 1, 1,
0.9569998, -0.4152716, 1.044056, 0.8313726, 0, 1, 1,
0.9609461, -1.479609, 3.906379, 0.8352941, 0, 1, 1,
0.9623269, -0.4562496, 2.341074, 0.8431373, 0, 1, 1,
0.9627182, 0.3625101, 1.443346, 0.8470588, 0, 1, 1,
0.9632505, 0.506519, 0.7301486, 0.854902, 0, 1, 1,
0.9700751, 1.471862, 0.2129268, 0.8588235, 0, 1, 1,
0.9739261, 1.218778, 0.1354171, 0.8666667, 0, 1, 1,
0.97934, 0.03604648, 1.003147, 0.8705882, 0, 1, 1,
0.9833156, 1.710653, 1.059454, 0.8784314, 0, 1, 1,
0.989571, 1.776367, 0.225336, 0.8823529, 0, 1, 1,
0.991089, 1.403636, 0.9175137, 0.8901961, 0, 1, 1,
0.9946603, 0.622672, 1.503554, 0.8941177, 0, 1, 1,
0.9980308, -1.671152, 3.689751, 0.9019608, 0, 1, 1,
1.000084, -0.07358859, 0.3247854, 0.9098039, 0, 1, 1,
1.001633, 0.5953391, 1.133443, 0.9137255, 0, 1, 1,
1.007919, 0.6780897, -0.7110407, 0.9215686, 0, 1, 1,
1.014387, -1.716381, 1.945762, 0.9254902, 0, 1, 1,
1.019533, -0.2088421, 1.986056, 0.9333333, 0, 1, 1,
1.028866, -0.5071203, -0.09101311, 0.9372549, 0, 1, 1,
1.02938, -1.170678, 3.62909, 0.945098, 0, 1, 1,
1.036454, -0.9093418, 2.020572, 0.9490196, 0, 1, 1,
1.04275, -0.1715534, 2.094358, 0.9568627, 0, 1, 1,
1.047055, -0.1264421, 0.1579338, 0.9607843, 0, 1, 1,
1.048182, 0.5022206, 0.8937741, 0.9686275, 0, 1, 1,
1.056917, 0.8789679, -0.5334744, 0.972549, 0, 1, 1,
1.058006, 0.4486181, 2.329261, 0.9803922, 0, 1, 1,
1.062712, 0.7719187, -0.2182371, 0.9843137, 0, 1, 1,
1.064611, 1.170405, 1.969943, 0.9921569, 0, 1, 1,
1.064646, 1.313163, -0.1076396, 0.9960784, 0, 1, 1,
1.064846, -0.469375, 2.109156, 1, 0, 0.9960784, 1,
1.065222, -0.3059292, 2.068989, 1, 0, 0.9882353, 1,
1.070565, -0.2271146, 0.160165, 1, 0, 0.9843137, 1,
1.070586, 1.134027, 1.305839, 1, 0, 0.9764706, 1,
1.071742, 0.3044696, 1.567039, 1, 0, 0.972549, 1,
1.076666, -0.8379165, 2.300901, 1, 0, 0.9647059, 1,
1.083024, -0.9428632, 0.5266284, 1, 0, 0.9607843, 1,
1.084131, -1.424443, 3.392036, 1, 0, 0.9529412, 1,
1.085818, 0.9265543, 0.6126736, 1, 0, 0.9490196, 1,
1.088634, -1.400515, 2.625201, 1, 0, 0.9411765, 1,
1.089175, 0.1259118, 1.746531, 1, 0, 0.9372549, 1,
1.092126, 0.5243775, -0.09528146, 1, 0, 0.9294118, 1,
1.094092, 0.6749167, 1.816032, 1, 0, 0.9254902, 1,
1.100891, -0.5761169, 0.9515427, 1, 0, 0.9176471, 1,
1.112311, -1.181809, 1.327888, 1, 0, 0.9137255, 1,
1.116811, 0.5510216, 1.689211, 1, 0, 0.9058824, 1,
1.118679, 1.009136, 2.101439, 1, 0, 0.9019608, 1,
1.120687, 0.3741497, 1.22339, 1, 0, 0.8941177, 1,
1.126505, 0.8993569, 0.9994794, 1, 0, 0.8862745, 1,
1.126812, 1.839278, 0.1877647, 1, 0, 0.8823529, 1,
1.129769, 0.5984655, 1.340446, 1, 0, 0.8745098, 1,
1.132485, -0.00513652, 0.7637223, 1, 0, 0.8705882, 1,
1.138884, 1.356436, 0.9574693, 1, 0, 0.8627451, 1,
1.139959, -0.3351554, 2.126662, 1, 0, 0.8588235, 1,
1.140124, 0.6300359, 1.93291, 1, 0, 0.8509804, 1,
1.150533, -0.0872682, 1.812071, 1, 0, 0.8470588, 1,
1.150912, -1.335654, 1.686666, 1, 0, 0.8392157, 1,
1.153926, 1.332769, -0.1983143, 1, 0, 0.8352941, 1,
1.163533, 1.507916, 1.350747, 1, 0, 0.827451, 1,
1.163711, -1.33116, 2.918534, 1, 0, 0.8235294, 1,
1.163912, -0.1010035, 1.508951, 1, 0, 0.8156863, 1,
1.165311, 1.437539, 1.822979, 1, 0, 0.8117647, 1,
1.169009, -0.1752648, 2.025879, 1, 0, 0.8039216, 1,
1.185086, -0.803188, 1.272629, 1, 0, 0.7960784, 1,
1.188607, -1.843976, 3.843318, 1, 0, 0.7921569, 1,
1.194928, 0.9239193, 0.7602635, 1, 0, 0.7843137, 1,
1.199112, -1.055078, 2.088575, 1, 0, 0.7803922, 1,
1.207104, -0.1190979, 1.677135, 1, 0, 0.772549, 1,
1.207656, 0.4625993, 1.425689, 1, 0, 0.7686275, 1,
1.208628, -0.5480855, 3.723608, 1, 0, 0.7607843, 1,
1.2112, -1.075508, 3.294735, 1, 0, 0.7568628, 1,
1.227747, -0.5069619, 1.012376, 1, 0, 0.7490196, 1,
1.230284, -0.5619203, 1.9521, 1, 0, 0.7450981, 1,
1.243676, 1.741433, 1.594082, 1, 0, 0.7372549, 1,
1.246134, -0.7177495, 0.4489031, 1, 0, 0.7333333, 1,
1.246574, -0.3652385, 2.09592, 1, 0, 0.7254902, 1,
1.247805, 1.742155, -0.1636942, 1, 0, 0.7215686, 1,
1.260924, 0.03707031, 1.248058, 1, 0, 0.7137255, 1,
1.261389, -0.04236845, 1.962822, 1, 0, 0.7098039, 1,
1.262413, 0.9888681, 0.7363318, 1, 0, 0.7019608, 1,
1.272523, -0.2389623, 0.2877859, 1, 0, 0.6941177, 1,
1.272593, -0.7134879, 2.269923, 1, 0, 0.6901961, 1,
1.279555, 0.03989872, 1.537415, 1, 0, 0.682353, 1,
1.294164, -0.3024679, 3.045732, 1, 0, 0.6784314, 1,
1.30151, -1.109168, 1.870204, 1, 0, 0.6705883, 1,
1.303645, -1.200399, 2.88998, 1, 0, 0.6666667, 1,
1.304053, -1.340555, 1.220177, 1, 0, 0.6588235, 1,
1.308522, -2.062742, 3.456427, 1, 0, 0.654902, 1,
1.311276, 0.3695236, 0.4767724, 1, 0, 0.6470588, 1,
1.320429, 0.5268849, 1.317876, 1, 0, 0.6431373, 1,
1.321224, 0.01978246, 1.982873, 1, 0, 0.6352941, 1,
1.327911, 1.034887, -0.6485398, 1, 0, 0.6313726, 1,
1.328432, -0.6296163, 1.193142, 1, 0, 0.6235294, 1,
1.328672, -0.3392138, 2.044768, 1, 0, 0.6196079, 1,
1.337643, 0.2114676, 2.395186, 1, 0, 0.6117647, 1,
1.358792, -0.9513698, 2.687495, 1, 0, 0.6078432, 1,
1.361374, 1.003397, 2.22996, 1, 0, 0.6, 1,
1.376535, -0.4253556, 2.770062, 1, 0, 0.5921569, 1,
1.379281, 1.061212, 0.5071121, 1, 0, 0.5882353, 1,
1.390365, -0.2905524, 2.162518, 1, 0, 0.5803922, 1,
1.394356, 0.212305, 2.445287, 1, 0, 0.5764706, 1,
1.395421, 0.3192641, 0.5170335, 1, 0, 0.5686275, 1,
1.396259, -0.8943132, 2.572655, 1, 0, 0.5647059, 1,
1.419312, 0.7768136, 4.029593, 1, 0, 0.5568628, 1,
1.42269, 2.221452, 0.8673111, 1, 0, 0.5529412, 1,
1.426701, 0.3772433, 0.6557257, 1, 0, 0.5450981, 1,
1.429438, 0.04026709, -0.2367913, 1, 0, 0.5411765, 1,
1.455356, 0.4484275, 2.275636, 1, 0, 0.5333334, 1,
1.462357, -0.04964864, 0.4764713, 1, 0, 0.5294118, 1,
1.464002, -0.5032709, 2.793084, 1, 0, 0.5215687, 1,
1.468841, -0.1300085, 2.108788, 1, 0, 0.5176471, 1,
1.487965, 0.5576991, 1.349194, 1, 0, 0.509804, 1,
1.502479, 0.2684271, 1.933675, 1, 0, 0.5058824, 1,
1.50272, -0.009058485, 1.21901, 1, 0, 0.4980392, 1,
1.502958, -1.168476, 3.396955, 1, 0, 0.4901961, 1,
1.503166, -1.153154, 3.50003, 1, 0, 0.4862745, 1,
1.509596, 0.06080419, 2.740421, 1, 0, 0.4784314, 1,
1.511626, -0.7305506, 1.62602, 1, 0, 0.4745098, 1,
1.516356, -1.23417, 2.038494, 1, 0, 0.4666667, 1,
1.516885, 0.1058515, 0.5138324, 1, 0, 0.4627451, 1,
1.522143, -0.6333542, -0.1210943, 1, 0, 0.454902, 1,
1.542043, -1.091444, 1.311784, 1, 0, 0.4509804, 1,
1.545799, -2.321813, 0.3281327, 1, 0, 0.4431373, 1,
1.547559, 0.2895867, 1.462265, 1, 0, 0.4392157, 1,
1.550842, -0.6105615, 2.83599, 1, 0, 0.4313726, 1,
1.552203, -0.2788014, 0.8073847, 1, 0, 0.427451, 1,
1.561282, 0.4472431, 1.880324, 1, 0, 0.4196078, 1,
1.571909, -0.737676, 3.077503, 1, 0, 0.4156863, 1,
1.579594, -0.2997177, 2.976167, 1, 0, 0.4078431, 1,
1.585274, 0.1126435, 0.6934827, 1, 0, 0.4039216, 1,
1.59319, 1.550194, 0.6653001, 1, 0, 0.3960784, 1,
1.597277, 0.6592789, 2.111799, 1, 0, 0.3882353, 1,
1.608731, -1.080092, 3.182455, 1, 0, 0.3843137, 1,
1.611045, -0.9493613, 1.372643, 1, 0, 0.3764706, 1,
1.644853, -0.7094263, 4.042315, 1, 0, 0.372549, 1,
1.650424, 0.4314558, 2.936468, 1, 0, 0.3647059, 1,
1.652371, 0.5666524, 0.8034868, 1, 0, 0.3607843, 1,
1.660601, 0.5475491, 1.265965, 1, 0, 0.3529412, 1,
1.666904, -1.328297, 2.327309, 1, 0, 0.3490196, 1,
1.682452, -0.9936701, 1.101582, 1, 0, 0.3411765, 1,
1.720746, -1.245454, 3.98633, 1, 0, 0.3372549, 1,
1.726436, 0.5125773, 1.378707, 1, 0, 0.3294118, 1,
1.73537, 2.475721, 2.536495, 1, 0, 0.3254902, 1,
1.737002, 0.1978482, 2.755665, 1, 0, 0.3176471, 1,
1.741844, 0.5902594, 0.4819779, 1, 0, 0.3137255, 1,
1.754255, -0.2304288, 1.013661, 1, 0, 0.3058824, 1,
1.766311, -0.6487201, 0.4679521, 1, 0, 0.2980392, 1,
1.767533, 0.3984622, 0.023699, 1, 0, 0.2941177, 1,
1.771857, 1.215376, 0.7927545, 1, 0, 0.2862745, 1,
1.773372, 0.7167801, 1.98752, 1, 0, 0.282353, 1,
1.777113, 0.1430963, 0.8583352, 1, 0, 0.2745098, 1,
1.782779, -0.7639583, 2.542434, 1, 0, 0.2705882, 1,
1.787499, 0.4432529, 0.4762003, 1, 0, 0.2627451, 1,
1.793949, -0.9404398, 2.614036, 1, 0, 0.2588235, 1,
1.806707, 1.73547, -0.05489897, 1, 0, 0.2509804, 1,
1.823524, 0.4694646, 1.233814, 1, 0, 0.2470588, 1,
1.840385, -0.7477883, 1.64068, 1, 0, 0.2392157, 1,
1.841893, 0.5309072, 1.344593, 1, 0, 0.2352941, 1,
1.842623, -0.6409564, 2.04284, 1, 0, 0.227451, 1,
1.852957, 1.582777, 2.187365, 1, 0, 0.2235294, 1,
1.863308, -0.3586251, 1.792427, 1, 0, 0.2156863, 1,
1.868961, 1.146987, 0.9864808, 1, 0, 0.2117647, 1,
1.870146, -1.29684, 3.807498, 1, 0, 0.2039216, 1,
1.879031, -0.5193641, 2.427649, 1, 0, 0.1960784, 1,
1.882532, -0.4550679, 2.058773, 1, 0, 0.1921569, 1,
1.883676, -0.5755666, 1.830503, 1, 0, 0.1843137, 1,
1.886746, 0.0899902, 3.951479, 1, 0, 0.1803922, 1,
1.910936, 1.351255, 0.8362922, 1, 0, 0.172549, 1,
1.926173, 0.3137926, -0.2104548, 1, 0, 0.1686275, 1,
1.942559, 1.333464, 3.024822, 1, 0, 0.1607843, 1,
1.942984, 0.7610309, 0.8413475, 1, 0, 0.1568628, 1,
1.951846, 0.420399, 1.852051, 1, 0, 0.1490196, 1,
1.964849, 1.409215, 0.7120351, 1, 0, 0.145098, 1,
1.97245, -1.716369, 1.343399, 1, 0, 0.1372549, 1,
2.053258, 1.085997, -0.130059, 1, 0, 0.1333333, 1,
2.059767, 0.2680728, 0.853237, 1, 0, 0.1254902, 1,
2.072758, -2.384619, 1.482317, 1, 0, 0.1215686, 1,
2.094062, 0.4874195, 2.453848, 1, 0, 0.1137255, 1,
2.143732, 0.3576795, 2.405431, 1, 0, 0.1098039, 1,
2.158217, 0.5008615, 1.060903, 1, 0, 0.1019608, 1,
2.172402, -0.1920965, 1.419359, 1, 0, 0.09411765, 1,
2.246013, 0.5550284, 1.528746, 1, 0, 0.09019608, 1,
2.247172, -1.520531, 2.789738, 1, 0, 0.08235294, 1,
2.247539, -1.340393, 2.609189, 1, 0, 0.07843138, 1,
2.317075, -1.38457, 1.502217, 1, 0, 0.07058824, 1,
2.319167, -0.3420916, 2.898594, 1, 0, 0.06666667, 1,
2.334489, -0.3838741, 2.918149, 1, 0, 0.05882353, 1,
2.359719, 0.2769267, 1.24767, 1, 0, 0.05490196, 1,
2.362064, -0.4800182, 2.033119, 1, 0, 0.04705882, 1,
2.362429, -1.133024, -1.173093, 1, 0, 0.04313726, 1,
2.682124, -0.565524, 3.347726, 1, 0, 0.03529412, 1,
2.80725, 0.4576145, 3.339966, 1, 0, 0.03137255, 1,
2.866922, -0.7335801, 4.098233, 1, 0, 0.02352941, 1,
2.873408, -0.3265725, 1.498639, 1, 0, 0.01960784, 1,
3.090185, -0.6994545, 1.590885, 1, 0, 0.01176471, 1,
3.353847, 0.4597012, 1.90779, 1, 0, 0.007843138, 1
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
0.1729689, -5.100525, -6.671196, 0, -0.5, 0.5, 0.5,
0.1729689, -5.100525, -6.671196, 1, -0.5, 0.5, 0.5,
0.1729689, -5.100525, -6.671196, 1, 1.5, 0.5, 0.5,
0.1729689, -5.100525, -6.671196, 0, 1.5, 0.5, 0.5
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
-4.086227, -0.4274623, -6.671196, 0, -0.5, 0.5, 0.5,
-4.086227, -0.4274623, -6.671196, 1, -0.5, 0.5, 0.5,
-4.086227, -0.4274623, -6.671196, 1, 1.5, 0.5, 0.5,
-4.086227, -0.4274623, -6.671196, 0, 1.5, 0.5, 0.5
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
-4.086227, -5.100525, 0.2042582, 0, -0.5, 0.5, 0.5,
-4.086227, -5.100525, 0.2042582, 1, -0.5, 0.5, 0.5,
-4.086227, -5.100525, 0.2042582, 1, 1.5, 0.5, 0.5,
-4.086227, -5.100525, 0.2042582, 0, 1.5, 0.5, 0.5
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
-3, -4.022126, -5.084553,
3, -4.022126, -5.084553,
-3, -4.022126, -5.084553,
-3, -4.201859, -5.348994,
-2, -4.022126, -5.084553,
-2, -4.201859, -5.348994,
-1, -4.022126, -5.084553,
-1, -4.201859, -5.348994,
0, -4.022126, -5.084553,
0, -4.201859, -5.348994,
1, -4.022126, -5.084553,
1, -4.201859, -5.348994,
2, -4.022126, -5.084553,
2, -4.201859, -5.348994,
3, -4.022126, -5.084553,
3, -4.201859, -5.348994
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
-3, -4.561325, -5.877875, 0, -0.5, 0.5, 0.5,
-3, -4.561325, -5.877875, 1, -0.5, 0.5, 0.5,
-3, -4.561325, -5.877875, 1, 1.5, 0.5, 0.5,
-3, -4.561325, -5.877875, 0, 1.5, 0.5, 0.5,
-2, -4.561325, -5.877875, 0, -0.5, 0.5, 0.5,
-2, -4.561325, -5.877875, 1, -0.5, 0.5, 0.5,
-2, -4.561325, -5.877875, 1, 1.5, 0.5, 0.5,
-2, -4.561325, -5.877875, 0, 1.5, 0.5, 0.5,
-1, -4.561325, -5.877875, 0, -0.5, 0.5, 0.5,
-1, -4.561325, -5.877875, 1, -0.5, 0.5, 0.5,
-1, -4.561325, -5.877875, 1, 1.5, 0.5, 0.5,
-1, -4.561325, -5.877875, 0, 1.5, 0.5, 0.5,
0, -4.561325, -5.877875, 0, -0.5, 0.5, 0.5,
0, -4.561325, -5.877875, 1, -0.5, 0.5, 0.5,
0, -4.561325, -5.877875, 1, 1.5, 0.5, 0.5,
0, -4.561325, -5.877875, 0, 1.5, 0.5, 0.5,
1, -4.561325, -5.877875, 0, -0.5, 0.5, 0.5,
1, -4.561325, -5.877875, 1, -0.5, 0.5, 0.5,
1, -4.561325, -5.877875, 1, 1.5, 0.5, 0.5,
1, -4.561325, -5.877875, 0, 1.5, 0.5, 0.5,
2, -4.561325, -5.877875, 0, -0.5, 0.5, 0.5,
2, -4.561325, -5.877875, 1, -0.5, 0.5, 0.5,
2, -4.561325, -5.877875, 1, 1.5, 0.5, 0.5,
2, -4.561325, -5.877875, 0, 1.5, 0.5, 0.5,
3, -4.561325, -5.877875, 0, -0.5, 0.5, 0.5,
3, -4.561325, -5.877875, 1, -0.5, 0.5, 0.5,
3, -4.561325, -5.877875, 1, 1.5, 0.5, 0.5,
3, -4.561325, -5.877875, 0, 1.5, 0.5, 0.5
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
-3.103336, -3, -5.084553,
-3.103336, 3, -5.084553,
-3.103336, -3, -5.084553,
-3.267151, -3, -5.348994,
-3.103336, -2, -5.084553,
-3.267151, -2, -5.348994,
-3.103336, -1, -5.084553,
-3.267151, -1, -5.348994,
-3.103336, 0, -5.084553,
-3.267151, 0, -5.348994,
-3.103336, 1, -5.084553,
-3.267151, 1, -5.348994,
-3.103336, 2, -5.084553,
-3.267151, 2, -5.348994,
-3.103336, 3, -5.084553,
-3.267151, 3, -5.348994
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
-3.594782, -3, -5.877875, 0, -0.5, 0.5, 0.5,
-3.594782, -3, -5.877875, 1, -0.5, 0.5, 0.5,
-3.594782, -3, -5.877875, 1, 1.5, 0.5, 0.5,
-3.594782, -3, -5.877875, 0, 1.5, 0.5, 0.5,
-3.594782, -2, -5.877875, 0, -0.5, 0.5, 0.5,
-3.594782, -2, -5.877875, 1, -0.5, 0.5, 0.5,
-3.594782, -2, -5.877875, 1, 1.5, 0.5, 0.5,
-3.594782, -2, -5.877875, 0, 1.5, 0.5, 0.5,
-3.594782, -1, -5.877875, 0, -0.5, 0.5, 0.5,
-3.594782, -1, -5.877875, 1, -0.5, 0.5, 0.5,
-3.594782, -1, -5.877875, 1, 1.5, 0.5, 0.5,
-3.594782, -1, -5.877875, 0, 1.5, 0.5, 0.5,
-3.594782, 0, -5.877875, 0, -0.5, 0.5, 0.5,
-3.594782, 0, -5.877875, 1, -0.5, 0.5, 0.5,
-3.594782, 0, -5.877875, 1, 1.5, 0.5, 0.5,
-3.594782, 0, -5.877875, 0, 1.5, 0.5, 0.5,
-3.594782, 1, -5.877875, 0, -0.5, 0.5, 0.5,
-3.594782, 1, -5.877875, 1, -0.5, 0.5, 0.5,
-3.594782, 1, -5.877875, 1, 1.5, 0.5, 0.5,
-3.594782, 1, -5.877875, 0, 1.5, 0.5, 0.5,
-3.594782, 2, -5.877875, 0, -0.5, 0.5, 0.5,
-3.594782, 2, -5.877875, 1, -0.5, 0.5, 0.5,
-3.594782, 2, -5.877875, 1, 1.5, 0.5, 0.5,
-3.594782, 2, -5.877875, 0, 1.5, 0.5, 0.5,
-3.594782, 3, -5.877875, 0, -0.5, 0.5, 0.5,
-3.594782, 3, -5.877875, 1, -0.5, 0.5, 0.5,
-3.594782, 3, -5.877875, 1, 1.5, 0.5, 0.5,
-3.594782, 3, -5.877875, 0, 1.5, 0.5, 0.5
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
-3.103336, -4.022126, -4,
-3.103336, -4.022126, 4,
-3.103336, -4.022126, -4,
-3.267151, -4.201859, -4,
-3.103336, -4.022126, -2,
-3.267151, -4.201859, -2,
-3.103336, -4.022126, 0,
-3.267151, -4.201859, 0,
-3.103336, -4.022126, 2,
-3.267151, -4.201859, 2,
-3.103336, -4.022126, 4,
-3.267151, -4.201859, 4
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
-3.594782, -4.561325, -4, 0, -0.5, 0.5, 0.5,
-3.594782, -4.561325, -4, 1, -0.5, 0.5, 0.5,
-3.594782, -4.561325, -4, 1, 1.5, 0.5, 0.5,
-3.594782, -4.561325, -4, 0, 1.5, 0.5, 0.5,
-3.594782, -4.561325, -2, 0, -0.5, 0.5, 0.5,
-3.594782, -4.561325, -2, 1, -0.5, 0.5, 0.5,
-3.594782, -4.561325, -2, 1, 1.5, 0.5, 0.5,
-3.594782, -4.561325, -2, 0, 1.5, 0.5, 0.5,
-3.594782, -4.561325, 0, 0, -0.5, 0.5, 0.5,
-3.594782, -4.561325, 0, 1, -0.5, 0.5, 0.5,
-3.594782, -4.561325, 0, 1, 1.5, 0.5, 0.5,
-3.594782, -4.561325, 0, 0, 1.5, 0.5, 0.5,
-3.594782, -4.561325, 2, 0, -0.5, 0.5, 0.5,
-3.594782, -4.561325, 2, 1, -0.5, 0.5, 0.5,
-3.594782, -4.561325, 2, 1, 1.5, 0.5, 0.5,
-3.594782, -4.561325, 2, 0, 1.5, 0.5, 0.5,
-3.594782, -4.561325, 4, 0, -0.5, 0.5, 0.5,
-3.594782, -4.561325, 4, 1, -0.5, 0.5, 0.5,
-3.594782, -4.561325, 4, 1, 1.5, 0.5, 0.5,
-3.594782, -4.561325, 4, 0, 1.5, 0.5, 0.5
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
-3.103336, -4.022126, -5.084553,
-3.103336, 3.167201, -5.084553,
-3.103336, -4.022126, 5.49307,
-3.103336, 3.167201, 5.49307,
-3.103336, -4.022126, -5.084553,
-3.103336, -4.022126, 5.49307,
-3.103336, 3.167201, -5.084553,
-3.103336, 3.167201, 5.49307,
-3.103336, -4.022126, -5.084553,
3.449274, -4.022126, -5.084553,
-3.103336, -4.022126, 5.49307,
3.449274, -4.022126, 5.49307,
-3.103336, 3.167201, -5.084553,
3.449274, 3.167201, -5.084553,
-3.103336, 3.167201, 5.49307,
3.449274, 3.167201, 5.49307,
3.449274, -4.022126, -5.084553,
3.449274, 3.167201, -5.084553,
3.449274, -4.022126, 5.49307,
3.449274, 3.167201, 5.49307,
3.449274, -4.022126, -5.084553,
3.449274, -4.022126, 5.49307,
3.449274, 3.167201, -5.084553,
3.449274, 3.167201, 5.49307
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
var radius = 7.67353;
var distance = 34.1404;
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
mvMatrix.translate( -0.1729689, 0.4274623, -0.2042582 );
mvMatrix.scale( 1.266178, 1.15404, 0.7843701 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.1404);
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
cyclophosphamide<-read.table("cyclophosphamide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclophosphamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
```

```r
y<-cyclophosphamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
```

```r
z<-cyclophosphamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
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
-3.00791, -0.839099, -1.123339, 0, 0, 1, 1, 1,
-2.878143, -0.05753262, -0.1901932, 1, 0, 0, 1, 1,
-2.85473, 1.449305, -1.429764, 1, 0, 0, 1, 1,
-2.815994, 1.686315, -1.066895, 1, 0, 0, 1, 1,
-2.694586, 1.587015, 0.04393702, 1, 0, 0, 1, 1,
-2.668949, 1.707151, -1.065567, 1, 0, 0, 1, 1,
-2.625317, 0.1978318, -0.8257964, 0, 0, 0, 1, 1,
-2.531767, -0.3506882, -0.5364649, 0, 0, 0, 1, 1,
-2.468875, -0.9861791, -0.2755701, 0, 0, 0, 1, 1,
-2.384766, -0.4588952, -1.716399, 0, 0, 0, 1, 1,
-2.359698, 1.601426, 0.01899962, 0, 0, 0, 1, 1,
-2.253371, 0.7440027, -1.989966, 0, 0, 0, 1, 1,
-2.243058, 0.04263956, -2.783212, 0, 0, 0, 1, 1,
-2.229347, 0.8493204, -1.422193, 1, 1, 1, 1, 1,
-2.223442, -1.355335, -1.504474, 1, 1, 1, 1, 1,
-2.177094, -0.3439165, -1.908285, 1, 1, 1, 1, 1,
-2.164687, 0.5986592, -1.032345, 1, 1, 1, 1, 1,
-2.156053, 0.9047019, 0.284752, 1, 1, 1, 1, 1,
-2.143008, -0.3256733, -1.497581, 1, 1, 1, 1, 1,
-2.107377, 1.882934, -1.136534, 1, 1, 1, 1, 1,
-2.073371, 1.383986, -1.16453, 1, 1, 1, 1, 1,
-2.067785, -1.062228, 0.06494182, 1, 1, 1, 1, 1,
-2.042166, 0.4913329, -0.7114318, 1, 1, 1, 1, 1,
-2.039547, -1.487132, -1.660127, 1, 1, 1, 1, 1,
-1.970912, 1.531522, -0.03870916, 1, 1, 1, 1, 1,
-1.92983, -0.4707033, -0.23774, 1, 1, 1, 1, 1,
-1.912056, -0.5177639, -2.51713, 1, 1, 1, 1, 1,
-1.883782, -0.7990226, -1.040931, 1, 1, 1, 1, 1,
-1.875722, -0.2078015, -2.03037, 0, 0, 1, 1, 1,
-1.872833, -0.6254993, -4.175232, 1, 0, 0, 1, 1,
-1.871313, -0.986038, -3.355786, 1, 0, 0, 1, 1,
-1.86689, 0.7697194, -0.7680128, 1, 0, 0, 1, 1,
-1.863289, -0.4890285, -1.925468, 1, 0, 0, 1, 1,
-1.861189, -0.880906, -0.930668, 1, 0, 0, 1, 1,
-1.834318, -0.7728121, -0.6362594, 0, 0, 0, 1, 1,
-1.831533, 0.335045, -2.542609, 0, 0, 0, 1, 1,
-1.81825, -0.7946235, -2.183606, 0, 0, 0, 1, 1,
-1.813907, -0.7385107, -0.8304667, 0, 0, 0, 1, 1,
-1.807391, 1.007979, 0.6518119, 0, 0, 0, 1, 1,
-1.801069, 1.63348, 0.7431484, 0, 0, 0, 1, 1,
-1.796006, -1.103024, -2.95204, 0, 0, 0, 1, 1,
-1.789707, -1.238156, -2.80184, 1, 1, 1, 1, 1,
-1.773332, 0.4726166, -0.3148222, 1, 1, 1, 1, 1,
-1.747679, 2.332204, 0.2859529, 1, 1, 1, 1, 1,
-1.741704, -1.54425, -3.526664, 1, 1, 1, 1, 1,
-1.738594, 0.8190883, -0.9500129, 1, 1, 1, 1, 1,
-1.725393, -0.515648, -3.226761, 1, 1, 1, 1, 1,
-1.718796, 0.7586437, 0.4077507, 1, 1, 1, 1, 1,
-1.712296, -0.9137365, -0.4829333, 1, 1, 1, 1, 1,
-1.705653, -0.0680199, -1.26179, 1, 1, 1, 1, 1,
-1.683605, 0.9725039, -0.9951509, 1, 1, 1, 1, 1,
-1.68087, -0.1840475, -1.204633, 1, 1, 1, 1, 1,
-1.670256, 0.5039415, -1.81654, 1, 1, 1, 1, 1,
-1.646529, -1.400439, -2.523582, 1, 1, 1, 1, 1,
-1.64503, 0.7968457, -0.636512, 1, 1, 1, 1, 1,
-1.643932, 0.4521899, -2.073426, 1, 1, 1, 1, 1,
-1.630485, -0.5335637, -1.688956, 0, 0, 1, 1, 1,
-1.622502, -1.559408, -3.264289, 1, 0, 0, 1, 1,
-1.619838, 0.09007324, -1.628206, 1, 0, 0, 1, 1,
-1.616617, 0.9803851, -3.110563, 1, 0, 0, 1, 1,
-1.605692, 1.010446, -2.923243, 1, 0, 0, 1, 1,
-1.600761, 1.296954, 0.6193525, 1, 0, 0, 1, 1,
-1.590573, 0.2199602, -1.466768, 0, 0, 0, 1, 1,
-1.559219, -0.3492424, -1.701599, 0, 0, 0, 1, 1,
-1.557238, 0.8662327, -1.284385, 0, 0, 0, 1, 1,
-1.540471, 1.618896, -0.7990042, 0, 0, 0, 1, 1,
-1.524879, -0.1787852, -0.4233948, 0, 0, 0, 1, 1,
-1.493304, 0.7052321, -2.899318, 0, 0, 0, 1, 1,
-1.477654, -0.9714081, -0.7821721, 0, 0, 0, 1, 1,
-1.447163, -0.855302, -1.887888, 1, 1, 1, 1, 1,
-1.437662, 0.06785794, 0.8923252, 1, 1, 1, 1, 1,
-1.43546, -0.09654109, -0.236665, 1, 1, 1, 1, 1,
-1.430357, -0.4311727, -0.4687539, 1, 1, 1, 1, 1,
-1.421752, 1.04882, 0.2334714, 1, 1, 1, 1, 1,
-1.410946, 0.3170146, -0.3304996, 1, 1, 1, 1, 1,
-1.402902, 0.1550577, -1.882405, 1, 1, 1, 1, 1,
-1.400805, 1.416289, -0.09055052, 1, 1, 1, 1, 1,
-1.39429, -0.7571918, -1.828015, 1, 1, 1, 1, 1,
-1.392017, -0.1298409, -0.2070391, 1, 1, 1, 1, 1,
-1.388, -0.9760028, -1.347772, 1, 1, 1, 1, 1,
-1.387858, -0.2210782, -2.217726, 1, 1, 1, 1, 1,
-1.383546, -0.336907, -1.783649, 1, 1, 1, 1, 1,
-1.380741, 0.5822268, -2.123249, 1, 1, 1, 1, 1,
-1.364779, 0.2580225, -2.412056, 1, 1, 1, 1, 1,
-1.359388, 0.0219021, -4.93051, 0, 0, 1, 1, 1,
-1.35313, -1.250553, -1.507979, 1, 0, 0, 1, 1,
-1.349274, 0.4088747, -3.823835, 1, 0, 0, 1, 1,
-1.322398, 1.555975, -1.326682, 1, 0, 0, 1, 1,
-1.300491, 1.249715, -0.9635148, 1, 0, 0, 1, 1,
-1.291424, -0.1520868, -2.16702, 1, 0, 0, 1, 1,
-1.277495, -0.2928311, -1.531189, 0, 0, 0, 1, 1,
-1.264262, 1.290296, -1.205371, 0, 0, 0, 1, 1,
-1.261595, 1.214741, 0.1970253, 0, 0, 0, 1, 1,
-1.26153, 1.177771, -0.9777534, 0, 0, 0, 1, 1,
-1.254549, 2.014837, 0.3577583, 0, 0, 0, 1, 1,
-1.249155, 0.4596916, -3.023395, 0, 0, 0, 1, 1,
-1.249083, -1.66016, -2.066669, 0, 0, 0, 1, 1,
-1.248095, -0.5614102, -1.799222, 1, 1, 1, 1, 1,
-1.246365, -1.518652, -1.74987, 1, 1, 1, 1, 1,
-1.244042, 0.7095944, -1.093595, 1, 1, 1, 1, 1,
-1.235266, 1.398612, -1.8284, 1, 1, 1, 1, 1,
-1.232002, -0.3583019, -1.274251, 1, 1, 1, 1, 1,
-1.230355, -2.047493, -3.27093, 1, 1, 1, 1, 1,
-1.223956, 1.387117, -1.846358, 1, 1, 1, 1, 1,
-1.214065, 2.164397, -0.0936907, 1, 1, 1, 1, 1,
-1.209111, -0.9562823, -1.177581, 1, 1, 1, 1, 1,
-1.197422, 0.07216818, -0.6875271, 1, 1, 1, 1, 1,
-1.194961, 0.7055294, -1.42695, 1, 1, 1, 1, 1,
-1.193603, 1.630317, -0.7627324, 1, 1, 1, 1, 1,
-1.191509, 0.6785217, -0.4941367, 1, 1, 1, 1, 1,
-1.178999, 1.109164, -0.2811441, 1, 1, 1, 1, 1,
-1.168597, -0.4002953, -1.446764, 1, 1, 1, 1, 1,
-1.166624, -1.66156, -2.246616, 0, 0, 1, 1, 1,
-1.150413, -0.6836857, -3.649681, 1, 0, 0, 1, 1,
-1.143693, -1.178517, -0.9692559, 1, 0, 0, 1, 1,
-1.142744, -1.7042, -2.335738, 1, 0, 0, 1, 1,
-1.142459, -1.983204, -3.654107, 1, 0, 0, 1, 1,
-1.137562, -0.1482995, -0.7750782, 1, 0, 0, 1, 1,
-1.134766, -1.29886, -2.914242, 0, 0, 0, 1, 1,
-1.11836, -0.3493679, -2.874865, 0, 0, 0, 1, 1,
-1.116119, -0.07055248, -2.126337, 0, 0, 0, 1, 1,
-1.113403, 0.4698681, -1.105982, 0, 0, 0, 1, 1,
-1.111261, -0.02280473, -2.089138, 0, 0, 0, 1, 1,
-1.110877, -0.1794463, -0.9264703, 0, 0, 0, 1, 1,
-1.10176, 1.014138, -1.921012, 0, 0, 0, 1, 1,
-1.095348, 0.1786601, -3.474707, 1, 1, 1, 1, 1,
-1.083985, -0.6323108, -0.8227729, 1, 1, 1, 1, 1,
-1.082692, -0.09573106, -1.524882, 1, 1, 1, 1, 1,
-1.082163, 0.02209253, -2.142754, 1, 1, 1, 1, 1,
-1.081143, -0.8978419, -2.975237, 1, 1, 1, 1, 1,
-1.075711, 2.377055, -0.4273328, 1, 1, 1, 1, 1,
-1.075097, -1.477409, -2.593674, 1, 1, 1, 1, 1,
-1.072582, -1.051465, -1.656849, 1, 1, 1, 1, 1,
-1.072134, 0.71885, -1.886992, 1, 1, 1, 1, 1,
-1.065284, -0.3503409, -1.262676, 1, 1, 1, 1, 1,
-1.054728, -0.4469733, -1.396725, 1, 1, 1, 1, 1,
-1.053619, 0.794729, -2.816459, 1, 1, 1, 1, 1,
-1.045951, 0.1487142, -2.310574, 1, 1, 1, 1, 1,
-1.045285, -0.1893703, -1.341835, 1, 1, 1, 1, 1,
-1.042689, -1.090259, -2.942521, 1, 1, 1, 1, 1,
-1.040839, 1.23461, -1.522859, 0, 0, 1, 1, 1,
-1.039545, 0.2922576, -1.573504, 1, 0, 0, 1, 1,
-1.031573, 1.020507, -0.8877962, 1, 0, 0, 1, 1,
-1.027226, 1.104551, 0.5349078, 1, 0, 0, 1, 1,
-1.024948, -0.5764572, -4.088364, 1, 0, 0, 1, 1,
-1.022507, -0.2472484, -2.771942, 1, 0, 0, 1, 1,
-1.008455, -1.788275, -1.973021, 0, 0, 0, 1, 1,
-0.9894599, 0.1255938, -1.591671, 0, 0, 0, 1, 1,
-0.9810519, -1.494231, -2.516114, 0, 0, 0, 1, 1,
-0.9791849, -0.7632513, -2.664313, 0, 0, 0, 1, 1,
-0.9782434, 1.393673, 0.3210092, 0, 0, 0, 1, 1,
-0.9739752, 0.8041266, -0.8633631, 0, 0, 0, 1, 1,
-0.9716577, -1.779106, -2.684483, 0, 0, 0, 1, 1,
-0.9680647, 2.122352, -1.199557, 1, 1, 1, 1, 1,
-0.9656699, -0.9289685, -0.9873659, 1, 1, 1, 1, 1,
-0.9589626, -0.1811022, -1.451431, 1, 1, 1, 1, 1,
-0.9537547, -1.222935, -3.596948, 1, 1, 1, 1, 1,
-0.9482959, -0.4236551, -1.996433, 1, 1, 1, 1, 1,
-0.9474674, 0.2250586, -1.783249, 1, 1, 1, 1, 1,
-0.9309718, 0.2746443, -0.1275198, 1, 1, 1, 1, 1,
-0.9297701, -0.1550194, -0.7662013, 1, 1, 1, 1, 1,
-0.928427, 0.9070824, 0.834841, 1, 1, 1, 1, 1,
-0.9259205, -0.7938275, -2.82983, 1, 1, 1, 1, 1,
-0.9210669, 0.4739033, -0.9850961, 1, 1, 1, 1, 1,
-0.9192211, -0.7186975, -1.357276, 1, 1, 1, 1, 1,
-0.918157, -1.703792, -3.769802, 1, 1, 1, 1, 1,
-0.914742, 0.5390275, -0.6311814, 1, 1, 1, 1, 1,
-0.9121245, -1.864801, -3.396406, 1, 1, 1, 1, 1,
-0.9020482, 0.9075609, -0.3293787, 0, 0, 1, 1, 1,
-0.8929761, 0.5421898, -1.697876, 1, 0, 0, 1, 1,
-0.8875976, 2.251168, -0.3261758, 1, 0, 0, 1, 1,
-0.882359, 0.5640047, -0.4550587, 1, 0, 0, 1, 1,
-0.8751646, 1.818281, -0.2235071, 1, 0, 0, 1, 1,
-0.863635, -0.4455821, -2.485702, 1, 0, 0, 1, 1,
-0.860038, 0.4770005, -1.801577, 0, 0, 0, 1, 1,
-0.8586403, 1.24967, -0.03693295, 0, 0, 0, 1, 1,
-0.8584344, 1.375788, -1.363985, 0, 0, 0, 1, 1,
-0.8562763, 0.9557766, -0.5297412, 0, 0, 0, 1, 1,
-0.8548791, 0.6046904, -0.279344, 0, 0, 0, 1, 1,
-0.8495884, 1.193012, -0.5004127, 0, 0, 0, 1, 1,
-0.8430883, -0.9431894, -3.648658, 0, 0, 0, 1, 1,
-0.8359763, -0.5178558, -2.518455, 1, 1, 1, 1, 1,
-0.8338593, -1.144045, -0.335604, 1, 1, 1, 1, 1,
-0.828006, 0.1233307, -1.466974, 1, 1, 1, 1, 1,
-0.826238, 0.7561467, 0.3164736, 1, 1, 1, 1, 1,
-0.825896, -0.1578422, -2.972753, 1, 1, 1, 1, 1,
-0.8247694, 0.296145, 2.105803, 1, 1, 1, 1, 1,
-0.8241071, 0.06824552, -3.208447, 1, 1, 1, 1, 1,
-0.8235408, 0.05312842, -1.508216, 1, 1, 1, 1, 1,
-0.8205099, 0.8739698, 0.2311275, 1, 1, 1, 1, 1,
-0.8203541, -1.059635, -3.499712, 1, 1, 1, 1, 1,
-0.8201807, -1.242025, -0.5966978, 1, 1, 1, 1, 1,
-0.8096569, 0.2744131, -2.187855, 1, 1, 1, 1, 1,
-0.8083518, -0.09597898, -1.740182, 1, 1, 1, 1, 1,
-0.8021699, -1.663408, -3.73145, 1, 1, 1, 1, 1,
-0.7976744, 0.05510407, -0.4955127, 1, 1, 1, 1, 1,
-0.796795, 1.19893, -1.486502, 0, 0, 1, 1, 1,
-0.7936212, 0.9416267, -1.758136, 1, 0, 0, 1, 1,
-0.7918313, -1.244838, -2.894357, 1, 0, 0, 1, 1,
-0.7916419, -1.901917, -1.916882, 1, 0, 0, 1, 1,
-0.787118, 0.3119821, -1.644234, 1, 0, 0, 1, 1,
-0.7857837, 1.007894, 0.3026559, 1, 0, 0, 1, 1,
-0.7761017, 0.1337116, -3.190005, 0, 0, 0, 1, 1,
-0.7681988, -0.04435278, -2.412541, 0, 0, 0, 1, 1,
-0.7675347, -0.584642, -2.610768, 0, 0, 0, 1, 1,
-0.7655895, -0.06978565, -3.011633, 0, 0, 0, 1, 1,
-0.7647715, -0.4478617, -0.3559352, 0, 0, 0, 1, 1,
-0.76469, 0.7524264, 1.163146, 0, 0, 0, 1, 1,
-0.7634665, 0.2931502, -1.236602, 0, 0, 0, 1, 1,
-0.7614058, 0.9265156, -1.05522, 1, 1, 1, 1, 1,
-0.7589524, 0.04357773, -2.611606, 1, 1, 1, 1, 1,
-0.758736, 1.261098, -0.04761543, 1, 1, 1, 1, 1,
-0.7467894, 0.6548066, -0.7456586, 1, 1, 1, 1, 1,
-0.7349353, -1.334305, -3.655702, 1, 1, 1, 1, 1,
-0.7328135, 0.8881178, -0.2356883, 1, 1, 1, 1, 1,
-0.7300839, -0.360055, -1.36903, 1, 1, 1, 1, 1,
-0.7261115, 0.4102053, -1.673526, 1, 1, 1, 1, 1,
-0.7201458, 0.2799395, -0.6867245, 1, 1, 1, 1, 1,
-0.7194026, 0.8337309, -1.435568, 1, 1, 1, 1, 1,
-0.717249, -1.190578, -3.463802, 1, 1, 1, 1, 1,
-0.7159995, -2.850286, -2.301053, 1, 1, 1, 1, 1,
-0.7123554, 0.8179454, 0.2909671, 1, 1, 1, 1, 1,
-0.7050561, -0.2668548, -2.354724, 1, 1, 1, 1, 1,
-0.7047098, 0.07411583, -2.198161, 1, 1, 1, 1, 1,
-0.704468, 1.505718, -0.8611235, 0, 0, 1, 1, 1,
-0.7024519, -1.230152, -3.723987, 1, 0, 0, 1, 1,
-0.7006607, -0.7105933, -3.321898, 1, 0, 0, 1, 1,
-0.6974703, 0.03294384, -2.331449, 1, 0, 0, 1, 1,
-0.6937963, 0.3934053, -0.7615312, 1, 0, 0, 1, 1,
-0.6916656, 0.3213796, -1.327831, 1, 0, 0, 1, 1,
-0.6911634, -0.4681729, -0.9628236, 0, 0, 0, 1, 1,
-0.6877237, 0.2732604, -1.405314, 0, 0, 0, 1, 1,
-0.6836594, -1.191022, -3.610075, 0, 0, 0, 1, 1,
-0.6808649, -0.05060428, -0.9560683, 0, 0, 0, 1, 1,
-0.6795086, 0.5574748, 0.783694, 0, 0, 0, 1, 1,
-0.676927, 1.029856, -0.4167464, 0, 0, 0, 1, 1,
-0.6765089, -1.098101, -0.9316288, 0, 0, 0, 1, 1,
-0.674885, -0.6435587, -1.593542, 1, 1, 1, 1, 1,
-0.6740662, 0.575798, -0.2100245, 1, 1, 1, 1, 1,
-0.6690371, 0.0874169, -3.170224, 1, 1, 1, 1, 1,
-0.6643691, -1.647313, -3.140342, 1, 1, 1, 1, 1,
-0.6630777, 1.62561, -0.6564294, 1, 1, 1, 1, 1,
-0.6629594, -1.000896, -4.929101, 1, 1, 1, 1, 1,
-0.6626898, -3.917427, -1.305898, 1, 1, 1, 1, 1,
-0.6610644, -0.278272, -1.444574, 1, 1, 1, 1, 1,
-0.6579506, 0.4469008, -2.81106, 1, 1, 1, 1, 1,
-0.6562492, -0.342363, -2.264569, 1, 1, 1, 1, 1,
-0.6543154, -0.4994358, -1.902545, 1, 1, 1, 1, 1,
-0.6510925, -0.4296091, -2.167985, 1, 1, 1, 1, 1,
-0.6499013, -0.2966745, -1.719081, 1, 1, 1, 1, 1,
-0.6391949, 0.004706577, -1.080672, 1, 1, 1, 1, 1,
-0.6343168, 1.17181, -1.004778, 1, 1, 1, 1, 1,
-0.6318661, 0.6012575, -0.1881155, 0, 0, 1, 1, 1,
-0.6292472, -1.227834, -2.624036, 1, 0, 0, 1, 1,
-0.62924, -2.018773, -1.99262, 1, 0, 0, 1, 1,
-0.622103, 1.186364, -0.09552702, 1, 0, 0, 1, 1,
-0.6206248, -1.568082, -2.359243, 1, 0, 0, 1, 1,
-0.6182272, 0.3432, -1.513669, 1, 0, 0, 1, 1,
-0.6161271, -1.346228, -2.915153, 0, 0, 0, 1, 1,
-0.6097414, -0.06014561, -0.9457216, 0, 0, 0, 1, 1,
-0.6011974, 0.4295504, 0.6378378, 0, 0, 0, 1, 1,
-0.5997948, 0.2652824, -1.891791, 0, 0, 0, 1, 1,
-0.5913094, 0.2956418, -0.1193024, 0, 0, 0, 1, 1,
-0.5860365, -0.8363041, -2.165217, 0, 0, 0, 1, 1,
-0.5853146, 0.5482056, -0.5015547, 0, 0, 0, 1, 1,
-0.5850512, 0.5754479, 0.2547507, 1, 1, 1, 1, 1,
-0.5836679, 0.8819107, -0.8655568, 1, 1, 1, 1, 1,
-0.5734726, 0.138232, -2.135201, 1, 1, 1, 1, 1,
-0.5723868, 0.2674037, -1.829864, 1, 1, 1, 1, 1,
-0.5703529, 1.134441, -1.073049, 1, 1, 1, 1, 1,
-0.5672104, 0.4421753, -0.8687947, 1, 1, 1, 1, 1,
-0.5639295, -0.2362316, -2.293763, 1, 1, 1, 1, 1,
-0.5557517, 1.550032, -1.505111, 1, 1, 1, 1, 1,
-0.5531478, 0.9972287, -0.725062, 1, 1, 1, 1, 1,
-0.5484846, -0.5631537, -3.62217, 1, 1, 1, 1, 1,
-0.548417, -0.3323664, -2.386886, 1, 1, 1, 1, 1,
-0.545515, -0.5487445, -2.134789, 1, 1, 1, 1, 1,
-0.5451054, 0.1646209, -1.191969, 1, 1, 1, 1, 1,
-0.5448342, -0.3046544, -1.946184, 1, 1, 1, 1, 1,
-0.5392059, 0.9595588, -1.208711, 1, 1, 1, 1, 1,
-0.5390258, -0.7591111, -3.164547, 0, 0, 1, 1, 1,
-0.5342937, -0.8691559, -3.378538, 1, 0, 0, 1, 1,
-0.5339603, -1.778685, -3.670603, 1, 0, 0, 1, 1,
-0.5300984, -0.686134, -1.208185, 1, 0, 0, 1, 1,
-0.5291459, 0.0598463, -0.7436802, 1, 0, 0, 1, 1,
-0.5277992, -1.194047, -2.210348, 1, 0, 0, 1, 1,
-0.5244314, 0.2077387, -1.950986, 0, 0, 0, 1, 1,
-0.5229399, 0.02191025, -1.317407, 0, 0, 0, 1, 1,
-0.5165861, 2.179725, 0.918684, 0, 0, 0, 1, 1,
-0.5152803, 0.5913032, -0.7550464, 0, 0, 0, 1, 1,
-0.5135372, -2.236516, -2.889561, 0, 0, 0, 1, 1,
-0.506609, -0.5518425, -1.386298, 0, 0, 0, 1, 1,
-0.5043116, -1.228677, -2.20437, 0, 0, 0, 1, 1,
-0.5042489, -0.09613354, -1.856013, 1, 1, 1, 1, 1,
-0.5008023, -1.675101, -2.987446, 1, 1, 1, 1, 1,
-0.4970038, -0.8978482, -3.032295, 1, 1, 1, 1, 1,
-0.4957327, 0.8888697, -0.4623621, 1, 1, 1, 1, 1,
-0.4919479, -0.1736687, -0.6968446, 1, 1, 1, 1, 1,
-0.4864381, -0.7620246, -2.149299, 1, 1, 1, 1, 1,
-0.4853607, -0.516446, -2.920519, 1, 1, 1, 1, 1,
-0.4834048, -0.03765862, -2.057345, 1, 1, 1, 1, 1,
-0.4824892, -0.860806, -2.749396, 1, 1, 1, 1, 1,
-0.4667643, -0.2479467, -1.833436, 1, 1, 1, 1, 1,
-0.4562466, -0.3015829, -1.443626, 1, 1, 1, 1, 1,
-0.4496744, 0.5182268, -0.3122323, 1, 1, 1, 1, 1,
-0.4495147, 0.5766737, 0.5639805, 1, 1, 1, 1, 1,
-0.4471581, -1.924172, -2.621084, 1, 1, 1, 1, 1,
-0.44059, -1.898657, -2.83774, 1, 1, 1, 1, 1,
-0.4388864, 0.2069073, -2.273292, 0, 0, 1, 1, 1,
-0.4388221, 0.6338859, 0.09287119, 1, 0, 0, 1, 1,
-0.4366872, 0.6921885, -0.8541178, 1, 0, 0, 1, 1,
-0.4346653, 1.029742, 0.134144, 1, 0, 0, 1, 1,
-0.4334567, 0.9067981, -0.9354542, 1, 0, 0, 1, 1,
-0.4292891, 1.665031, -1.13786, 1, 0, 0, 1, 1,
-0.4278332, -0.70212, -2.499769, 0, 0, 0, 1, 1,
-0.4227449, -0.8479822, -4.754104, 0, 0, 0, 1, 1,
-0.4206506, -0.3199767, -2.225914, 0, 0, 0, 1, 1,
-0.4204358, -1.355348, -1.712518, 0, 0, 0, 1, 1,
-0.4166857, 1.009982, 0.178784, 0, 0, 0, 1, 1,
-0.4157015, -0.9326897, -2.513497, 0, 0, 0, 1, 1,
-0.4123699, 1.35077, -0.7045015, 0, 0, 0, 1, 1,
-0.4069932, 1.193457, -0.4076501, 1, 1, 1, 1, 1,
-0.4047799, 1.467851, -0.4789509, 1, 1, 1, 1, 1,
-0.403178, -1.119408, -3.606734, 1, 1, 1, 1, 1,
-0.4022947, -0.2282286, -1.757236, 1, 1, 1, 1, 1,
-0.4017892, 0.2714529, 1.381855, 1, 1, 1, 1, 1,
-0.4004218, 1.259121, -0.8310176, 1, 1, 1, 1, 1,
-0.3945587, -1.313331, -4.785451, 1, 1, 1, 1, 1,
-0.3887041, -0.1552226, -2.792585, 1, 1, 1, 1, 1,
-0.3867826, 1.264431, 0.01998018, 1, 1, 1, 1, 1,
-0.3845436, 0.9606909, -0.5749862, 1, 1, 1, 1, 1,
-0.375735, 0.6327916, -0.02810207, 1, 1, 1, 1, 1,
-0.3708636, 0.4867748, 0.2041319, 1, 1, 1, 1, 1,
-0.3656515, 0.4787127, -0.1741378, 1, 1, 1, 1, 1,
-0.3565861, 1.564637, -1.146629, 1, 1, 1, 1, 1,
-0.3535494, 0.1545156, -0.9514004, 1, 1, 1, 1, 1,
-0.350384, 0.2864709, -1.650422, 0, 0, 1, 1, 1,
-0.3499881, 1.018939, 0.9392669, 1, 0, 0, 1, 1,
-0.347506, 0.3844363, -0.03876477, 1, 0, 0, 1, 1,
-0.3461486, 0.0618276, -2.044492, 1, 0, 0, 1, 1,
-0.3448305, 0.9588643, 0.2146203, 1, 0, 0, 1, 1,
-0.3407575, 0.3171845, -0.4059297, 1, 0, 0, 1, 1,
-0.340694, 0.4596042, -0.8909174, 0, 0, 0, 1, 1,
-0.3380535, -1.458775, -3.095682, 0, 0, 0, 1, 1,
-0.3363439, 1.191739, -2.195784, 0, 0, 0, 1, 1,
-0.3361879, 0.83231, 0.02105646, 0, 0, 0, 1, 1,
-0.3323879, 0.2491097, -0.7026764, 0, 0, 0, 1, 1,
-0.3311269, -0.3542741, -4.112444, 0, 0, 0, 1, 1,
-0.3294514, -0.05474236, -0.8689572, 0, 0, 0, 1, 1,
-0.3292223, 0.9796783, 0.268704, 1, 1, 1, 1, 1,
-0.3269304, -2.748114, -3.851214, 1, 1, 1, 1, 1,
-0.3243379, 1.513473, -2.697926, 1, 1, 1, 1, 1,
-0.3241458, 2.198012, 2.637819, 1, 1, 1, 1, 1,
-0.3219136, -0.07754786, -1.995918, 1, 1, 1, 1, 1,
-0.3201308, -0.3458507, -3.071616, 1, 1, 1, 1, 1,
-0.3189477, 0.8696474, -0.7056676, 1, 1, 1, 1, 1,
-0.3172139, 0.4929573, 0.7197869, 1, 1, 1, 1, 1,
-0.3168639, -0.08300675, -0.02566376, 1, 1, 1, 1, 1,
-0.3154777, -0.3094845, -2.950358, 1, 1, 1, 1, 1,
-0.3121282, -0.123098, 0.1328286, 1, 1, 1, 1, 1,
-0.3055521, 0.3095565, -1.133852, 1, 1, 1, 1, 1,
-0.2947616, -1.16294, -4.343052, 1, 1, 1, 1, 1,
-0.2924312, -0.7334917, -1.11245, 1, 1, 1, 1, 1,
-0.2896563, -0.493469, -4.136059, 1, 1, 1, 1, 1,
-0.2890643, -1.971567, -2.646312, 0, 0, 1, 1, 1,
-0.2889499, 1.199818, -2.15953, 1, 0, 0, 1, 1,
-0.281237, 1.682293, -0.637795, 1, 0, 0, 1, 1,
-0.2761127, 0.7083092, -0.5323174, 1, 0, 0, 1, 1,
-0.2753963, 0.4114221, -2.442725, 1, 0, 0, 1, 1,
-0.2727617, -0.7815594, -3.422444, 1, 0, 0, 1, 1,
-0.2724712, 0.7720569, -0.9261093, 0, 0, 0, 1, 1,
-0.2723791, 1.707262, 0.4514521, 0, 0, 0, 1, 1,
-0.2723088, -0.005962981, -1.140117, 0, 0, 0, 1, 1,
-0.2688308, -0.9599527, -4.394549, 0, 0, 0, 1, 1,
-0.2640654, -0.8451465, -3.712918, 0, 0, 0, 1, 1,
-0.2632684, -0.06963719, -1.261946, 0, 0, 0, 1, 1,
-0.2626525, 0.3687693, -0.6731313, 0, 0, 0, 1, 1,
-0.2591551, 1.351045, 0.469533, 1, 1, 1, 1, 1,
-0.2501535, -0.8190449, -3.438489, 1, 1, 1, 1, 1,
-0.249182, 1.182377, -0.8377575, 1, 1, 1, 1, 1,
-0.2471656, -0.3035334, -1.166381, 1, 1, 1, 1, 1,
-0.2469584, -0.6139252, -1.753914, 1, 1, 1, 1, 1,
-0.2425147, 1.383765, 1.434195, 1, 1, 1, 1, 1,
-0.2389801, 0.3736385, -0.09917889, 1, 1, 1, 1, 1,
-0.2375778, -0.4507954, -4.305635, 1, 1, 1, 1, 1,
-0.2372664, -1.312588, -4.084151, 1, 1, 1, 1, 1,
-0.2305412, -0.07091752, -3.063567, 1, 1, 1, 1, 1,
-0.2244133, -1.606262, -2.377004, 1, 1, 1, 1, 1,
-0.2175882, 1.10462, 0.3944487, 1, 1, 1, 1, 1,
-0.2172723, -0.5643633, -1.245902, 1, 1, 1, 1, 1,
-0.214788, 2.322579, -0.7788115, 1, 1, 1, 1, 1,
-0.2135871, -1.707227, -3.069876, 1, 1, 1, 1, 1,
-0.2135565, 1.258104, -1.353378, 0, 0, 1, 1, 1,
-0.2111913, -2.459537, -3.608435, 1, 0, 0, 1, 1,
-0.2094214, 0.2592605, 0.2276383, 1, 0, 0, 1, 1,
-0.2029098, -1.455129, -2.161026, 1, 0, 0, 1, 1,
-0.2027121, -0.386682, -2.258114, 1, 0, 0, 1, 1,
-0.201945, 0.2377923, -0.5727798, 1, 0, 0, 1, 1,
-0.2012752, 0.3663722, -1.981261, 0, 0, 0, 1, 1,
-0.1994958, 0.1161229, -0.8340328, 0, 0, 0, 1, 1,
-0.1988484, -0.01480308, -1.257702, 0, 0, 0, 1, 1,
-0.1941401, -0.6578023, -3.334769, 0, 0, 0, 1, 1,
-0.1935614, -0.6326601, -2.705132, 0, 0, 0, 1, 1,
-0.1929054, -0.3384601, -1.695309, 0, 0, 0, 1, 1,
-0.1926355, -1.170971, -3.222095, 0, 0, 0, 1, 1,
-0.1919789, 0.4083493, -1.644921, 1, 1, 1, 1, 1,
-0.1911493, 1.232134, -0.7758331, 1, 1, 1, 1, 1,
-0.1897719, -0.102968, -0.5525084, 1, 1, 1, 1, 1,
-0.1890942, -1.582073, -3.416152, 1, 1, 1, 1, 1,
-0.1888101, -0.5077463, -3.002858, 1, 1, 1, 1, 1,
-0.1874242, 1.332219, -0.6734282, 1, 1, 1, 1, 1,
-0.1871408, 0.3178256, -2.016301, 1, 1, 1, 1, 1,
-0.1832473, -0.1705142, -3.926974, 1, 1, 1, 1, 1,
-0.1794162, -1.568207, -2.745885, 1, 1, 1, 1, 1,
-0.175519, 1.414647, 0.05093835, 1, 1, 1, 1, 1,
-0.1752798, 0.5369068, -0.5639446, 1, 1, 1, 1, 1,
-0.1727186, -0.1525442, -0.8260272, 1, 1, 1, 1, 1,
-0.1721705, 0.3489884, 0.08464061, 1, 1, 1, 1, 1,
-0.1684472, 1.352608, 0.7930812, 1, 1, 1, 1, 1,
-0.1530672, 2.750774, -0.4597071, 1, 1, 1, 1, 1,
-0.1512869, 1.235042, 1.431604, 0, 0, 1, 1, 1,
-0.1499367, -0.5261881, -2.017345, 1, 0, 0, 1, 1,
-0.1497236, 0.3759964, -0.4941014, 1, 0, 0, 1, 1,
-0.1482837, 0.5687695, -1.647668, 1, 0, 0, 1, 1,
-0.1479264, -0.4079547, -2.044431, 1, 0, 0, 1, 1,
-0.1469719, -1.19137, -2.839159, 1, 0, 0, 1, 1,
-0.1441756, 0.3089892, 1.672911, 0, 0, 0, 1, 1,
-0.1401985, 1.011034, -1.313876, 0, 0, 0, 1, 1,
-0.1378845, 1.23095, 0.6069388, 0, 0, 0, 1, 1,
-0.1340006, -1.122835, -3.386603, 0, 0, 0, 1, 1,
-0.1338205, 0.03967609, -1.621997, 0, 0, 0, 1, 1,
-0.1315262, -0.06611487, -1.401031, 0, 0, 0, 1, 1,
-0.1297463, 0.725647, 0.8711661, 0, 0, 0, 1, 1,
-0.1293619, 0.7004175, -1.989842, 1, 1, 1, 1, 1,
-0.1195199, -0.4234689, -2.003544, 1, 1, 1, 1, 1,
-0.1176238, 0.4777787, -0.1727559, 1, 1, 1, 1, 1,
-0.1147745, 1.161988, -0.7091855, 1, 1, 1, 1, 1,
-0.1147207, -0.8196941, -3.15962, 1, 1, 1, 1, 1,
-0.1138311, 0.2500268, -1.093668, 1, 1, 1, 1, 1,
-0.1101526, -0.174986, -3.568853, 1, 1, 1, 1, 1,
-0.1096161, 0.2402018, -0.9872243, 1, 1, 1, 1, 1,
-0.1089084, -0.06267496, -2.113775, 1, 1, 1, 1, 1,
-0.1080075, 0.8295646, 3.106682, 1, 1, 1, 1, 1,
-0.1076882, 0.1020522, 0.2998318, 1, 1, 1, 1, 1,
-0.1031124, 1.2162, 0.5494416, 1, 1, 1, 1, 1,
-0.1014747, -0.2342817, -3.041613, 1, 1, 1, 1, 1,
-0.1001444, -0.8712348, -1.716125, 1, 1, 1, 1, 1,
-0.09939023, 0.05582379, -1.925868, 1, 1, 1, 1, 1,
-0.09717132, 0.529786, 0.5328044, 0, 0, 1, 1, 1,
-0.09572412, -1.295831, -3.532407, 1, 0, 0, 1, 1,
-0.09206154, -0.2956358, -4.338106, 1, 0, 0, 1, 1,
-0.08854454, -1.052045, -3.154734, 1, 0, 0, 1, 1,
-0.08832554, -1.476613, -3.62382, 1, 0, 0, 1, 1,
-0.08831175, 0.5314555, 0.8367808, 1, 0, 0, 1, 1,
-0.08796321, 0.969246, 0.7974927, 0, 0, 0, 1, 1,
-0.08293179, -1.315707, -2.911185, 0, 0, 0, 1, 1,
-0.08239545, 0.09604143, -1.442207, 0, 0, 0, 1, 1,
-0.07317047, 2.33983, 0.002825073, 0, 0, 0, 1, 1,
-0.07177974, -1.063422, -3.885722, 0, 0, 0, 1, 1,
-0.06612707, 0.926551, -0.874321, 0, 0, 0, 1, 1,
-0.06184852, -1.897895, -3.105341, 0, 0, 0, 1, 1,
-0.06153316, 0.890709, -0.895317, 1, 1, 1, 1, 1,
-0.05155324, 1.4238, -0.8423169, 1, 1, 1, 1, 1,
-0.04866791, 1.310705, -0.1150714, 1, 1, 1, 1, 1,
-0.04810891, -1.035403, -3.674275, 1, 1, 1, 1, 1,
-0.0479057, 0.04268391, -1.696829, 1, 1, 1, 1, 1,
-0.04569123, 0.6391559, 0.6206747, 1, 1, 1, 1, 1,
-0.04562973, 1.755647, -0.554821, 1, 1, 1, 1, 1,
-0.04464928, -0.7762873, -3.794428, 1, 1, 1, 1, 1,
-0.03753072, 1.647283, -0.2864119, 1, 1, 1, 1, 1,
-0.03564502, -0.8452051, -2.890481, 1, 1, 1, 1, 1,
-0.03487596, 0.02819906, 0.4205117, 1, 1, 1, 1, 1,
-0.03481218, 0.9758795, -0.7057676, 1, 1, 1, 1, 1,
-0.03215658, 0.5922151, -0.4046793, 1, 1, 1, 1, 1,
-0.03153604, -0.001355965, -1.539177, 1, 1, 1, 1, 1,
-0.02896083, 0.6612362, 0.9643612, 1, 1, 1, 1, 1,
-0.01770258, -0.9350719, -3.194763, 0, 0, 1, 1, 1,
-0.0165371, 1.151424, -0.5388495, 1, 0, 0, 1, 1,
-0.0153148, -2.267156, -2.820855, 1, 0, 0, 1, 1,
-0.01483554, -0.242996, -4.850944, 1, 0, 0, 1, 1,
-0.01141902, 1.388731, 0.1762394, 1, 0, 0, 1, 1,
-0.009754262, 0.6043376, 0.7425015, 1, 0, 0, 1, 1,
-0.006864504, -1.560979, -4.203498, 0, 0, 0, 1, 1,
-0.004255521, 1.257392, 0.3920175, 0, 0, 0, 1, 1,
-0.002849542, -0.7997286, -2.532738, 0, 0, 0, 1, 1,
0.002234014, -0.4375755, 3.697569, 0, 0, 0, 1, 1,
0.003112096, -1.022938, 4.618515, 0, 0, 0, 1, 1,
0.004845198, -0.3281552, 2.961138, 0, 0, 0, 1, 1,
0.006404128, 1.189904, -0.7850778, 0, 0, 0, 1, 1,
0.008446423, 0.6683944, 1.010407, 1, 1, 1, 1, 1,
0.01084444, -0.9368699, 4.330406, 1, 1, 1, 1, 1,
0.01336041, -0.533594, 2.034051, 1, 1, 1, 1, 1,
0.01799046, 0.6513228, 0.5410535, 1, 1, 1, 1, 1,
0.01828963, -0.8951143, 4.543768, 1, 1, 1, 1, 1,
0.02420059, -0.8545572, 3.187943, 1, 1, 1, 1, 1,
0.02831171, 0.0493646, 2.222212, 1, 1, 1, 1, 1,
0.02845854, -0.1172329, 2.341683, 1, 1, 1, 1, 1,
0.03408622, 1.244772, -1.229752, 1, 1, 1, 1, 1,
0.03456645, 0.02020104, 0.2856403, 1, 1, 1, 1, 1,
0.03833036, -2.774021, 4.263083, 1, 1, 1, 1, 1,
0.04194203, -0.1809116, 3.403263, 1, 1, 1, 1, 1,
0.04284212, 0.6682218, -1.541865, 1, 1, 1, 1, 1,
0.04285322, 1.641025, -1.072655, 1, 1, 1, 1, 1,
0.04531204, -1.197307, 3.683962, 1, 1, 1, 1, 1,
0.04724241, -0.6597225, 2.568677, 0, 0, 1, 1, 1,
0.04968477, 0.03084394, 0.08639906, 1, 0, 0, 1, 1,
0.0515861, 1.132478, 0.1471882, 1, 0, 0, 1, 1,
0.05697811, -1.445575, 2.761792, 1, 0, 0, 1, 1,
0.06016549, 1.192726, -0.3662904, 1, 0, 0, 1, 1,
0.06162008, 1.933367, -0.020203, 1, 0, 0, 1, 1,
0.06162373, -1.328187, 4.017051, 0, 0, 0, 1, 1,
0.06237241, -0.7054365, 3.086494, 0, 0, 0, 1, 1,
0.06671786, -0.2552834, 2.840721, 0, 0, 0, 1, 1,
0.06764408, -0.009835432, 3.353397, 0, 0, 0, 1, 1,
0.08154774, 0.4241481, 0.1451525, 0, 0, 0, 1, 1,
0.08546101, -0.4797028, 3.059042, 0, 0, 0, 1, 1,
0.08570646, 0.9062138, 0.7960335, 0, 0, 0, 1, 1,
0.08945941, 1.510867, -0.4333815, 1, 1, 1, 1, 1,
0.09025676, -0.1886512, 2.384358, 1, 1, 1, 1, 1,
0.09668302, 3.062502, 1.973837, 1, 1, 1, 1, 1,
0.09727683, -2.172959, 3.813656, 1, 1, 1, 1, 1,
0.09764937, 0.2031677, 1.458461, 1, 1, 1, 1, 1,
0.1003531, -0.5240402, 3.902219, 1, 1, 1, 1, 1,
0.1031661, 0.380257, 0.5532957, 1, 1, 1, 1, 1,
0.1039784, -0.112461, 0.3709926, 1, 1, 1, 1, 1,
0.1043086, 0.5996805, 0.4487692, 1, 1, 1, 1, 1,
0.1049248, 0.4876262, 0.1946288, 1, 1, 1, 1, 1,
0.1051453, -1.829149, 2.66207, 1, 1, 1, 1, 1,
0.1055531, -0.6038477, 1.996748, 1, 1, 1, 1, 1,
0.1145719, 0.8382913, -1.222779, 1, 1, 1, 1, 1,
0.114868, 0.3992018, -0.7422575, 1, 1, 1, 1, 1,
0.1187702, 1.156973, 1.119649, 1, 1, 1, 1, 1,
0.1206305, -0.2471329, 2.320216, 0, 0, 1, 1, 1,
0.1228155, 0.06645891, 2.314834, 1, 0, 0, 1, 1,
0.1232166, 0.7110397, 0.6602316, 1, 0, 0, 1, 1,
0.1255034, 1.859175, -1.076671, 1, 0, 0, 1, 1,
0.1345435, -1.29676, 2.242292, 1, 0, 0, 1, 1,
0.1355164, 1.542116, 1.710301, 1, 0, 0, 1, 1,
0.1384438, -1.274905, 3.840118, 0, 0, 0, 1, 1,
0.1395793, 0.976082, -1.512435, 0, 0, 0, 1, 1,
0.1440929, -0.4163615, 1.675427, 0, 0, 0, 1, 1,
0.152612, 1.639801, -0.1304556, 0, 0, 0, 1, 1,
0.1528716, 1.195152, 1.935336, 0, 0, 0, 1, 1,
0.1542179, 1.107428, 1.530146, 0, 0, 0, 1, 1,
0.154406, 0.4809755, -1.010885, 0, 0, 0, 1, 1,
0.1544511, 1.368948, -0.1492899, 1, 1, 1, 1, 1,
0.1563946, -1.495682, 2.436564, 1, 1, 1, 1, 1,
0.1580841, -1.001129, 2.614946, 1, 1, 1, 1, 1,
0.1598283, -1.912074, 3.430168, 1, 1, 1, 1, 1,
0.1620811, -1.588288, 2.795599, 1, 1, 1, 1, 1,
0.1774321, 0.2633578, -0.2987919, 1, 1, 1, 1, 1,
0.1796144, 0.1612885, 1.718742, 1, 1, 1, 1, 1,
0.1811787, 0.9852461, -0.1679025, 1, 1, 1, 1, 1,
0.1840393, 0.369361, 1.714049, 1, 1, 1, 1, 1,
0.1973085, 0.8345744, -0.1249482, 1, 1, 1, 1, 1,
0.1974703, 1.765202, 1.04425, 1, 1, 1, 1, 1,
0.2035179, 0.09895727, 1.809922, 1, 1, 1, 1, 1,
0.2077841, 1.356783, -1.11904, 1, 1, 1, 1, 1,
0.211303, 0.1349047, 2.726444, 1, 1, 1, 1, 1,
0.2206117, -1.334144, 2.965137, 1, 1, 1, 1, 1,
0.2256047, 1.973087, 0.3114485, 0, 0, 1, 1, 1,
0.2275724, -1.237763, 4.82005, 1, 0, 0, 1, 1,
0.2330739, 0.3196559, -1.299291, 1, 0, 0, 1, 1,
0.2338903, -0.7295532, 2.505021, 1, 0, 0, 1, 1,
0.2345561, 0.8625709, -0.09037391, 1, 0, 0, 1, 1,
0.2358507, -0.8210217, 3.295847, 1, 0, 0, 1, 1,
0.236145, -0.7226211, 3.356996, 0, 0, 0, 1, 1,
0.2386255, -2.501637, 4.081803, 0, 0, 0, 1, 1,
0.2423696, -0.05639454, 0.543501, 0, 0, 0, 1, 1,
0.2428818, -0.3361547, 5.339026, 0, 0, 0, 1, 1,
0.244955, 0.2598341, 0.9529543, 0, 0, 0, 1, 1,
0.2565944, 0.5971053, 0.917918, 0, 0, 0, 1, 1,
0.2582093, 0.3760761, -0.04168364, 0, 0, 0, 1, 1,
0.2644255, 0.3728512, 0.4783451, 1, 1, 1, 1, 1,
0.2651679, 0.340072, 1.684138, 1, 1, 1, 1, 1,
0.2672068, 0.7140837, -0.2908146, 1, 1, 1, 1, 1,
0.2729478, 1.847981, -0.6707624, 1, 1, 1, 1, 1,
0.2770893, 0.02312439, 0.4742605, 1, 1, 1, 1, 1,
0.2793212, -0.03161474, 0.6841773, 1, 1, 1, 1, 1,
0.2793326, -0.09183516, 1.709007, 1, 1, 1, 1, 1,
0.2829302, 0.4121644, -1.424502, 1, 1, 1, 1, 1,
0.2857695, 1.287724, -0.9537476, 1, 1, 1, 1, 1,
0.2875341, 0.3032646, -0.1070581, 1, 1, 1, 1, 1,
0.2892094, -1.00237, 2.162973, 1, 1, 1, 1, 1,
0.2892419, -0.4534547, 1.995867, 1, 1, 1, 1, 1,
0.2952862, -0.1921162, 2.353977, 1, 1, 1, 1, 1,
0.2954541, 1.897014, 0.1995711, 1, 1, 1, 1, 1,
0.2963746, -0.4863483, 3.473422, 1, 1, 1, 1, 1,
0.2963867, -2.457395, 4.219639, 0, 0, 1, 1, 1,
0.2976144, 0.03613761, 1.09517, 1, 0, 0, 1, 1,
0.297744, -2.103462, 3.526422, 1, 0, 0, 1, 1,
0.3022174, -0.3908644, 3.062478, 1, 0, 0, 1, 1,
0.3047956, -0.765434, 2.775992, 1, 0, 0, 1, 1,
0.3052813, 0.0003742466, 1.486425, 1, 0, 0, 1, 1,
0.3060956, 1.822447, -0.9762011, 0, 0, 0, 1, 1,
0.3065972, -0.8649653, 1.737799, 0, 0, 0, 1, 1,
0.3071676, 0.5679237, -0.04439341, 0, 0, 0, 1, 1,
0.3073681, -1.546969, 2.597394, 0, 0, 0, 1, 1,
0.3107871, 0.9862019, 0.2046284, 0, 0, 0, 1, 1,
0.313211, 1.185487, -0.3803189, 0, 0, 0, 1, 1,
0.314646, -0.3757132, 4.859652, 0, 0, 0, 1, 1,
0.3279929, 1.126332, 0.4644935, 1, 1, 1, 1, 1,
0.3290203, 0.152455, -0.5040967, 1, 1, 1, 1, 1,
0.3297224, -1.653086, 2.923668, 1, 1, 1, 1, 1,
0.3359846, 0.5900472, 0.209968, 1, 1, 1, 1, 1,
0.3381073, 2.507418, -0.02812464, 1, 1, 1, 1, 1,
0.3404417, -0.4870467, 1.762474, 1, 1, 1, 1, 1,
0.3406737, -1.148065, 1.925181, 1, 1, 1, 1, 1,
0.342038, 0.7267449, -0.5666136, 1, 1, 1, 1, 1,
0.342723, -0.2283618, 1.958071, 1, 1, 1, 1, 1,
0.3442769, -1.842031, 1.734956, 1, 1, 1, 1, 1,
0.3462358, 0.8743357, 1.145587, 1, 1, 1, 1, 1,
0.347226, -0.3710803, 1.913161, 1, 1, 1, 1, 1,
0.3472758, -1.871608, 2.144835, 1, 1, 1, 1, 1,
0.3485965, 0.2250104, 0.4293233, 1, 1, 1, 1, 1,
0.3497242, -0.9058592, 1.004297, 1, 1, 1, 1, 1,
0.3547252, -0.9664319, 2.398539, 0, 0, 1, 1, 1,
0.3599128, -0.6239512, 3.38424, 1, 0, 0, 1, 1,
0.3669246, -0.240598, 2.999355, 1, 0, 0, 1, 1,
0.3693054, -0.0087233, 2.140261, 1, 0, 0, 1, 1,
0.3694435, -0.4230642, 2.900095, 1, 0, 0, 1, 1,
0.3709892, 1.730294, -0.4261347, 1, 0, 0, 1, 1,
0.3728066, -0.2630624, 3.561298, 0, 0, 0, 1, 1,
0.3794828, 0.4644089, 2.083385, 0, 0, 0, 1, 1,
0.3840722, 0.0514759, 0.7436454, 0, 0, 0, 1, 1,
0.3845831, 0.6529991, -0.7570271, 0, 0, 0, 1, 1,
0.3847573, 0.5528327, -0.00788884, 0, 0, 0, 1, 1,
0.3930888, 0.8089207, 0.946095, 0, 0, 0, 1, 1,
0.3974786, 0.5522349, 1.402312, 0, 0, 0, 1, 1,
0.3987324, 0.3859166, 0.7430745, 1, 1, 1, 1, 1,
0.3993157, -1.896937, 1.273251, 1, 1, 1, 1, 1,
0.4047608, -1.341215, 4.055298, 1, 1, 1, 1, 1,
0.4049996, 0.2408601, 2.318484, 1, 1, 1, 1, 1,
0.4117408, 1.84276, 1.612803, 1, 1, 1, 1, 1,
0.412301, -2.062115, 4.803354, 1, 1, 1, 1, 1,
0.4127839, 0.1655329, 0.861567, 1, 1, 1, 1, 1,
0.4144267, 0.1243673, 0.856689, 1, 1, 1, 1, 1,
0.4153647, 1.520778, -1.196583, 1, 1, 1, 1, 1,
0.4179059, -0.2066942, 2.940592, 1, 1, 1, 1, 1,
0.4194831, 0.1334036, 1.713398, 1, 1, 1, 1, 1,
0.4213082, 0.1962528, 1.920485, 1, 1, 1, 1, 1,
0.4234551, 0.8357908, -0.690603, 1, 1, 1, 1, 1,
0.4292691, -0.7177905, 2.340933, 1, 1, 1, 1, 1,
0.4330424, -0.852881, 1.746619, 1, 1, 1, 1, 1,
0.4356045, 0.8553714, 1.315196, 0, 0, 1, 1, 1,
0.4357691, 1.474091, 0.1411877, 1, 0, 0, 1, 1,
0.4391876, -1.302009, 4.592371, 1, 0, 0, 1, 1,
0.4440677, 0.8453699, 0.5383022, 1, 0, 0, 1, 1,
0.444318, 0.4682089, -0.03486414, 1, 0, 0, 1, 1,
0.4486233, 1.353514, 1.139241, 1, 0, 0, 1, 1,
0.4508446, 0.3159571, 0.8673285, 0, 0, 0, 1, 1,
0.4517743, 0.6244769, 0.01947794, 0, 0, 0, 1, 1,
0.4530447, -0.1780683, 1.84245, 0, 0, 0, 1, 1,
0.4538102, -0.6827826, 3.596567, 0, 0, 0, 1, 1,
0.455954, -1.207492, 2.361553, 0, 0, 0, 1, 1,
0.4575973, -1.083047, 4.146888, 0, 0, 0, 1, 1,
0.4616022, -0.1923777, 2.37491, 0, 0, 0, 1, 1,
0.4625564, 0.2041137, 0.5298873, 1, 1, 1, 1, 1,
0.4637344, -0.01274623, 2.030486, 1, 1, 1, 1, 1,
0.4638703, 0.9227781, 0.5980366, 1, 1, 1, 1, 1,
0.4661062, -0.1275702, 3.424928, 1, 1, 1, 1, 1,
0.4661385, 1.648783, 0.3861707, 1, 1, 1, 1, 1,
0.467059, -0.3302502, 2.820248, 1, 1, 1, 1, 1,
0.4734031, -1.044515, 1.790361, 1, 1, 1, 1, 1,
0.4765498, 0.2851792, 0.3532649, 1, 1, 1, 1, 1,
0.4769509, -1.572696, 2.961205, 1, 1, 1, 1, 1,
0.4799773, -1.418498, 3.534832, 1, 1, 1, 1, 1,
0.480246, 1.082948, 1.418106, 1, 1, 1, 1, 1,
0.4829006, 1.362474, -0.1712615, 1, 1, 1, 1, 1,
0.4834365, 0.3075369, 1.479248, 1, 1, 1, 1, 1,
0.4913978, 2.267719, 0.687308, 1, 1, 1, 1, 1,
0.4915185, -0.05523192, 3.263674, 1, 1, 1, 1, 1,
0.4938764, -0.03552405, 0.3850344, 0, 0, 1, 1, 1,
0.4961241, -1.493242, 3.873098, 1, 0, 0, 1, 1,
0.4965957, -0.7472053, 3.558438, 1, 0, 0, 1, 1,
0.4968949, 0.8497697, 0.1321247, 1, 0, 0, 1, 1,
0.4976487, -0.3501991, 2.100999, 1, 0, 0, 1, 1,
0.5135769, -1.010163, 3.092635, 1, 0, 0, 1, 1,
0.5198291, -0.550689, 2.835091, 0, 0, 0, 1, 1,
0.5205364, -1.083897, 2.312181, 0, 0, 0, 1, 1,
0.5213239, -1.55783, 1.892633, 0, 0, 0, 1, 1,
0.5229422, -1.595866, 1.878263, 0, 0, 0, 1, 1,
0.5230535, -1.89805, 4.390897, 0, 0, 0, 1, 1,
0.5233976, 0.9817278, 1.215031, 0, 0, 0, 1, 1,
0.5268711, 1.951878, -1.73093, 0, 0, 0, 1, 1,
0.5311227, 0.2698086, -0.2790454, 1, 1, 1, 1, 1,
0.5333817, -0.3394911, 2.838748, 1, 1, 1, 1, 1,
0.5371418, 0.1725315, -0.297733, 1, 1, 1, 1, 1,
0.5372599, -0.008925613, 1.630041, 1, 1, 1, 1, 1,
0.5378595, -0.3977638, 2.400859, 1, 1, 1, 1, 1,
0.5410256, 1.571183, 0.6703098, 1, 1, 1, 1, 1,
0.54277, -0.6268616, 2.610365, 1, 1, 1, 1, 1,
0.5448143, 1.033784, 0.6267345, 1, 1, 1, 1, 1,
0.5453714, -0.1799921, 3.115631, 1, 1, 1, 1, 1,
0.5472848, -0.4338612, 2.326824, 1, 1, 1, 1, 1,
0.5501541, 1.604816, -1.584242, 1, 1, 1, 1, 1,
0.5507664, -0.678047, 2.217913, 1, 1, 1, 1, 1,
0.5684021, 0.2258221, -0.1506038, 1, 1, 1, 1, 1,
0.5692431, 0.3157639, 1.17248, 1, 1, 1, 1, 1,
0.5700575, 0.03727047, 1.658184, 1, 1, 1, 1, 1,
0.57009, -1.682567, 3.875604, 0, 0, 1, 1, 1,
0.5711832, -0.7744083, 1.721975, 1, 0, 0, 1, 1,
0.5766066, -0.7263651, 0.7528043, 1, 0, 0, 1, 1,
0.5778416, -0.4935501, 1.622296, 1, 0, 0, 1, 1,
0.5844361, 0.556299, 1.137474, 1, 0, 0, 1, 1,
0.5863567, -0.9000247, 4.268088, 1, 0, 0, 1, 1,
0.5880745, -0.03349643, 1.86081, 0, 0, 0, 1, 1,
0.5893626, 0.1072503, -0.2741243, 0, 0, 0, 1, 1,
0.5918221, 1.021259, 0.884307, 0, 0, 0, 1, 1,
0.591925, -0.4734954, 3.098548, 0, 0, 0, 1, 1,
0.5945251, -0.82544, 1.940178, 0, 0, 0, 1, 1,
0.5967844, 0.7165697, 1.276587, 0, 0, 0, 1, 1,
0.5992396, 0.1271231, 1.278639, 0, 0, 0, 1, 1,
0.5997533, 0.678293, 0.09374324, 1, 1, 1, 1, 1,
0.5997796, -0.3035977, 2.391407, 1, 1, 1, 1, 1,
0.6011565, 0.8139215, 0.7712483, 1, 1, 1, 1, 1,
0.6015275, 0.08774344, 3.079474, 1, 1, 1, 1, 1,
0.6025625, -1.135196, 2.636431, 1, 1, 1, 1, 1,
0.6048648, -0.08515542, 0.6056969, 1, 1, 1, 1, 1,
0.6052736, 0.07253335, 1.362567, 1, 1, 1, 1, 1,
0.6115436, 0.2709781, 0.9419184, 1, 1, 1, 1, 1,
0.6145775, -0.1637549, 1.087708, 1, 1, 1, 1, 1,
0.6255945, -0.1603515, 2.9887, 1, 1, 1, 1, 1,
0.6283717, 1.500501, 0.4953746, 1, 1, 1, 1, 1,
0.6293494, 0.2228845, 1.743897, 1, 1, 1, 1, 1,
0.6344559, 0.1845229, 1.569741, 1, 1, 1, 1, 1,
0.6464192, -1.859035, 1.670174, 1, 1, 1, 1, 1,
0.6488669, 0.1067604, 2.009522, 1, 1, 1, 1, 1,
0.6611717, 0.9750448, 0.9629259, 0, 0, 1, 1, 1,
0.6640861, -0.222788, 0.2176038, 1, 0, 0, 1, 1,
0.6753734, -1.235506, 1.498933, 1, 0, 0, 1, 1,
0.6794658, -0.4312575, 1.864413, 1, 0, 0, 1, 1,
0.6823454, 1.256692, 1.948084, 1, 0, 0, 1, 1,
0.6837084, -0.3428854, 0.9664026, 1, 0, 0, 1, 1,
0.6887801, 0.1475989, 3.151646, 0, 0, 0, 1, 1,
0.6921641, -1.035993, 2.577112, 0, 0, 0, 1, 1,
0.6927221, -0.1093535, 2.324464, 0, 0, 0, 1, 1,
0.6943638, 2.771465, 0.8146511, 0, 0, 0, 1, 1,
0.701649, -0.1657992, 0.9379452, 0, 0, 0, 1, 1,
0.7158217, -0.1046397, 2.276788, 0, 0, 0, 1, 1,
0.7321394, -0.02436683, 2.466086, 0, 0, 0, 1, 1,
0.7324419, 2.045946, 0.5825873, 1, 1, 1, 1, 1,
0.7353079, -0.3348905, 3.518845, 1, 1, 1, 1, 1,
0.7361154, -0.3088505, 1.808461, 1, 1, 1, 1, 1,
0.7380989, 0.3028201, -0.08777075, 1, 1, 1, 1, 1,
0.7383912, 0.04975505, 1.747571, 1, 1, 1, 1, 1,
0.7479346, -1.109334, 2.61096, 1, 1, 1, 1, 1,
0.7493934, 2.023777, 1.227646, 1, 1, 1, 1, 1,
0.7503493, 0.07093563, 0.7447504, 1, 1, 1, 1, 1,
0.7517358, 1.67622, 0.7741566, 1, 1, 1, 1, 1,
0.7537914, -0.1527134, 0.5126937, 1, 1, 1, 1, 1,
0.7551051, -0.3631383, 1.409072, 1, 1, 1, 1, 1,
0.759046, -0.04170379, 1.292438, 1, 1, 1, 1, 1,
0.7625717, 0.2532491, 0.6367813, 1, 1, 1, 1, 1,
0.7639489, 0.3203659, 0.7468578, 1, 1, 1, 1, 1,
0.766149, 0.09357027, 2.077576, 1, 1, 1, 1, 1,
0.7671192, 0.530003, 1.97358, 0, 0, 1, 1, 1,
0.7671222, -0.7367846, 3.136729, 1, 0, 0, 1, 1,
0.7856945, 0.5715927, 1.006633, 1, 0, 0, 1, 1,
0.7952103, -1.856267, 3.365439, 1, 0, 0, 1, 1,
0.7999231, 0.4190826, 0.1486182, 1, 0, 0, 1, 1,
0.8042546, -2.322648, 1.814894, 1, 0, 0, 1, 1,
0.810644, 0.6719199, 0.7222059, 0, 0, 0, 1, 1,
0.8111027, -0.7824372, 2.810804, 0, 0, 0, 1, 1,
0.8205794, 1.952163, -0.4616187, 0, 0, 0, 1, 1,
0.8206242, 2.223558, 2.129555, 0, 0, 0, 1, 1,
0.8216369, -0.2325788, 0.9499934, 0, 0, 0, 1, 1,
0.8256006, 0.1861635, 0.8974802, 0, 0, 0, 1, 1,
0.8377398, -0.221312, 1.476451, 0, 0, 0, 1, 1,
0.8404673, 0.3231364, 1.957216, 1, 1, 1, 1, 1,
0.8510672, 0.1194757, -0.4062457, 1, 1, 1, 1, 1,
0.854207, 0.06962558, 3.91526, 1, 1, 1, 1, 1,
0.8578393, -0.5790188, 1.15959, 1, 1, 1, 1, 1,
0.8599173, -0.1573583, 1.226765, 1, 1, 1, 1, 1,
0.8617864, -1.242097, 4.220952, 1, 1, 1, 1, 1,
0.86297, -1.836339, 3.820375, 1, 1, 1, 1, 1,
0.8667823, -1.322188, 3.415311, 1, 1, 1, 1, 1,
0.8701974, -1.618863, 3.609798, 1, 1, 1, 1, 1,
0.8780211, -0.8168637, 1.766557, 1, 1, 1, 1, 1,
0.8801368, 0.1351384, 1.744409, 1, 1, 1, 1, 1,
0.8816916, 0.8549162, 0.9228104, 1, 1, 1, 1, 1,
0.8837281, -0.3587095, 4.297252, 1, 1, 1, 1, 1,
0.8856261, -0.880357, 2.93774, 1, 1, 1, 1, 1,
0.8884465, -0.7915986, 2.292071, 1, 1, 1, 1, 1,
0.8949446, 0.7377892, 1.401564, 0, 0, 1, 1, 1,
0.8971864, 0.1656147, 0.2276855, 1, 0, 0, 1, 1,
0.9006343, -1.278972, 3.066249, 1, 0, 0, 1, 1,
0.9013286, -0.6890233, 0.7405472, 1, 0, 0, 1, 1,
0.9081999, 0.3489025, 1.32265, 1, 0, 0, 1, 1,
0.908505, -1.089901, 1.916002, 1, 0, 0, 1, 1,
0.9098218, 1.057045, 0.7057269, 0, 0, 0, 1, 1,
0.9109285, 1.058922, 0.03127888, 0, 0, 0, 1, 1,
0.9111642, 0.3409989, 0.07435211, 0, 0, 0, 1, 1,
0.914929, 1.503063, 0.787521, 0, 0, 0, 1, 1,
0.9246412, -0.480256, 0.8325527, 0, 0, 0, 1, 1,
0.9321174, -1.442595, 1.129673, 0, 0, 0, 1, 1,
0.932981, 0.3665325, 1.895313, 0, 0, 0, 1, 1,
0.9403551, -1.680702, 2.631808, 1, 1, 1, 1, 1,
0.9415274, -0.6408718, 2.718133, 1, 1, 1, 1, 1,
0.9436703, 0.7066128, 0.9535812, 1, 1, 1, 1, 1,
0.9473901, -0.2369205, 0.8935585, 1, 1, 1, 1, 1,
0.9494771, -1.729118, 3.072139, 1, 1, 1, 1, 1,
0.9518578, -0.6866973, 2.457361, 1, 1, 1, 1, 1,
0.9548005, -1.028448, 1.724251, 1, 1, 1, 1, 1,
0.9561965, 1.035597, -0.3166389, 1, 1, 1, 1, 1,
0.9569998, -0.4152716, 1.044056, 1, 1, 1, 1, 1,
0.9609461, -1.479609, 3.906379, 1, 1, 1, 1, 1,
0.9623269, -0.4562496, 2.341074, 1, 1, 1, 1, 1,
0.9627182, 0.3625101, 1.443346, 1, 1, 1, 1, 1,
0.9632505, 0.506519, 0.7301486, 1, 1, 1, 1, 1,
0.9700751, 1.471862, 0.2129268, 1, 1, 1, 1, 1,
0.9739261, 1.218778, 0.1354171, 1, 1, 1, 1, 1,
0.97934, 0.03604648, 1.003147, 0, 0, 1, 1, 1,
0.9833156, 1.710653, 1.059454, 1, 0, 0, 1, 1,
0.989571, 1.776367, 0.225336, 1, 0, 0, 1, 1,
0.991089, 1.403636, 0.9175137, 1, 0, 0, 1, 1,
0.9946603, 0.622672, 1.503554, 1, 0, 0, 1, 1,
0.9980308, -1.671152, 3.689751, 1, 0, 0, 1, 1,
1.000084, -0.07358859, 0.3247854, 0, 0, 0, 1, 1,
1.001633, 0.5953391, 1.133443, 0, 0, 0, 1, 1,
1.007919, 0.6780897, -0.7110407, 0, 0, 0, 1, 1,
1.014387, -1.716381, 1.945762, 0, 0, 0, 1, 1,
1.019533, -0.2088421, 1.986056, 0, 0, 0, 1, 1,
1.028866, -0.5071203, -0.09101311, 0, 0, 0, 1, 1,
1.02938, -1.170678, 3.62909, 0, 0, 0, 1, 1,
1.036454, -0.9093418, 2.020572, 1, 1, 1, 1, 1,
1.04275, -0.1715534, 2.094358, 1, 1, 1, 1, 1,
1.047055, -0.1264421, 0.1579338, 1, 1, 1, 1, 1,
1.048182, 0.5022206, 0.8937741, 1, 1, 1, 1, 1,
1.056917, 0.8789679, -0.5334744, 1, 1, 1, 1, 1,
1.058006, 0.4486181, 2.329261, 1, 1, 1, 1, 1,
1.062712, 0.7719187, -0.2182371, 1, 1, 1, 1, 1,
1.064611, 1.170405, 1.969943, 1, 1, 1, 1, 1,
1.064646, 1.313163, -0.1076396, 1, 1, 1, 1, 1,
1.064846, -0.469375, 2.109156, 1, 1, 1, 1, 1,
1.065222, -0.3059292, 2.068989, 1, 1, 1, 1, 1,
1.070565, -0.2271146, 0.160165, 1, 1, 1, 1, 1,
1.070586, 1.134027, 1.305839, 1, 1, 1, 1, 1,
1.071742, 0.3044696, 1.567039, 1, 1, 1, 1, 1,
1.076666, -0.8379165, 2.300901, 1, 1, 1, 1, 1,
1.083024, -0.9428632, 0.5266284, 0, 0, 1, 1, 1,
1.084131, -1.424443, 3.392036, 1, 0, 0, 1, 1,
1.085818, 0.9265543, 0.6126736, 1, 0, 0, 1, 1,
1.088634, -1.400515, 2.625201, 1, 0, 0, 1, 1,
1.089175, 0.1259118, 1.746531, 1, 0, 0, 1, 1,
1.092126, 0.5243775, -0.09528146, 1, 0, 0, 1, 1,
1.094092, 0.6749167, 1.816032, 0, 0, 0, 1, 1,
1.100891, -0.5761169, 0.9515427, 0, 0, 0, 1, 1,
1.112311, -1.181809, 1.327888, 0, 0, 0, 1, 1,
1.116811, 0.5510216, 1.689211, 0, 0, 0, 1, 1,
1.118679, 1.009136, 2.101439, 0, 0, 0, 1, 1,
1.120687, 0.3741497, 1.22339, 0, 0, 0, 1, 1,
1.126505, 0.8993569, 0.9994794, 0, 0, 0, 1, 1,
1.126812, 1.839278, 0.1877647, 1, 1, 1, 1, 1,
1.129769, 0.5984655, 1.340446, 1, 1, 1, 1, 1,
1.132485, -0.00513652, 0.7637223, 1, 1, 1, 1, 1,
1.138884, 1.356436, 0.9574693, 1, 1, 1, 1, 1,
1.139959, -0.3351554, 2.126662, 1, 1, 1, 1, 1,
1.140124, 0.6300359, 1.93291, 1, 1, 1, 1, 1,
1.150533, -0.0872682, 1.812071, 1, 1, 1, 1, 1,
1.150912, -1.335654, 1.686666, 1, 1, 1, 1, 1,
1.153926, 1.332769, -0.1983143, 1, 1, 1, 1, 1,
1.163533, 1.507916, 1.350747, 1, 1, 1, 1, 1,
1.163711, -1.33116, 2.918534, 1, 1, 1, 1, 1,
1.163912, -0.1010035, 1.508951, 1, 1, 1, 1, 1,
1.165311, 1.437539, 1.822979, 1, 1, 1, 1, 1,
1.169009, -0.1752648, 2.025879, 1, 1, 1, 1, 1,
1.185086, -0.803188, 1.272629, 1, 1, 1, 1, 1,
1.188607, -1.843976, 3.843318, 0, 0, 1, 1, 1,
1.194928, 0.9239193, 0.7602635, 1, 0, 0, 1, 1,
1.199112, -1.055078, 2.088575, 1, 0, 0, 1, 1,
1.207104, -0.1190979, 1.677135, 1, 0, 0, 1, 1,
1.207656, 0.4625993, 1.425689, 1, 0, 0, 1, 1,
1.208628, -0.5480855, 3.723608, 1, 0, 0, 1, 1,
1.2112, -1.075508, 3.294735, 0, 0, 0, 1, 1,
1.227747, -0.5069619, 1.012376, 0, 0, 0, 1, 1,
1.230284, -0.5619203, 1.9521, 0, 0, 0, 1, 1,
1.243676, 1.741433, 1.594082, 0, 0, 0, 1, 1,
1.246134, -0.7177495, 0.4489031, 0, 0, 0, 1, 1,
1.246574, -0.3652385, 2.09592, 0, 0, 0, 1, 1,
1.247805, 1.742155, -0.1636942, 0, 0, 0, 1, 1,
1.260924, 0.03707031, 1.248058, 1, 1, 1, 1, 1,
1.261389, -0.04236845, 1.962822, 1, 1, 1, 1, 1,
1.262413, 0.9888681, 0.7363318, 1, 1, 1, 1, 1,
1.272523, -0.2389623, 0.2877859, 1, 1, 1, 1, 1,
1.272593, -0.7134879, 2.269923, 1, 1, 1, 1, 1,
1.279555, 0.03989872, 1.537415, 1, 1, 1, 1, 1,
1.294164, -0.3024679, 3.045732, 1, 1, 1, 1, 1,
1.30151, -1.109168, 1.870204, 1, 1, 1, 1, 1,
1.303645, -1.200399, 2.88998, 1, 1, 1, 1, 1,
1.304053, -1.340555, 1.220177, 1, 1, 1, 1, 1,
1.308522, -2.062742, 3.456427, 1, 1, 1, 1, 1,
1.311276, 0.3695236, 0.4767724, 1, 1, 1, 1, 1,
1.320429, 0.5268849, 1.317876, 1, 1, 1, 1, 1,
1.321224, 0.01978246, 1.982873, 1, 1, 1, 1, 1,
1.327911, 1.034887, -0.6485398, 1, 1, 1, 1, 1,
1.328432, -0.6296163, 1.193142, 0, 0, 1, 1, 1,
1.328672, -0.3392138, 2.044768, 1, 0, 0, 1, 1,
1.337643, 0.2114676, 2.395186, 1, 0, 0, 1, 1,
1.358792, -0.9513698, 2.687495, 1, 0, 0, 1, 1,
1.361374, 1.003397, 2.22996, 1, 0, 0, 1, 1,
1.376535, -0.4253556, 2.770062, 1, 0, 0, 1, 1,
1.379281, 1.061212, 0.5071121, 0, 0, 0, 1, 1,
1.390365, -0.2905524, 2.162518, 0, 0, 0, 1, 1,
1.394356, 0.212305, 2.445287, 0, 0, 0, 1, 1,
1.395421, 0.3192641, 0.5170335, 0, 0, 0, 1, 1,
1.396259, -0.8943132, 2.572655, 0, 0, 0, 1, 1,
1.419312, 0.7768136, 4.029593, 0, 0, 0, 1, 1,
1.42269, 2.221452, 0.8673111, 0, 0, 0, 1, 1,
1.426701, 0.3772433, 0.6557257, 1, 1, 1, 1, 1,
1.429438, 0.04026709, -0.2367913, 1, 1, 1, 1, 1,
1.455356, 0.4484275, 2.275636, 1, 1, 1, 1, 1,
1.462357, -0.04964864, 0.4764713, 1, 1, 1, 1, 1,
1.464002, -0.5032709, 2.793084, 1, 1, 1, 1, 1,
1.468841, -0.1300085, 2.108788, 1, 1, 1, 1, 1,
1.487965, 0.5576991, 1.349194, 1, 1, 1, 1, 1,
1.502479, 0.2684271, 1.933675, 1, 1, 1, 1, 1,
1.50272, -0.009058485, 1.21901, 1, 1, 1, 1, 1,
1.502958, -1.168476, 3.396955, 1, 1, 1, 1, 1,
1.503166, -1.153154, 3.50003, 1, 1, 1, 1, 1,
1.509596, 0.06080419, 2.740421, 1, 1, 1, 1, 1,
1.511626, -0.7305506, 1.62602, 1, 1, 1, 1, 1,
1.516356, -1.23417, 2.038494, 1, 1, 1, 1, 1,
1.516885, 0.1058515, 0.5138324, 1, 1, 1, 1, 1,
1.522143, -0.6333542, -0.1210943, 0, 0, 1, 1, 1,
1.542043, -1.091444, 1.311784, 1, 0, 0, 1, 1,
1.545799, -2.321813, 0.3281327, 1, 0, 0, 1, 1,
1.547559, 0.2895867, 1.462265, 1, 0, 0, 1, 1,
1.550842, -0.6105615, 2.83599, 1, 0, 0, 1, 1,
1.552203, -0.2788014, 0.8073847, 1, 0, 0, 1, 1,
1.561282, 0.4472431, 1.880324, 0, 0, 0, 1, 1,
1.571909, -0.737676, 3.077503, 0, 0, 0, 1, 1,
1.579594, -0.2997177, 2.976167, 0, 0, 0, 1, 1,
1.585274, 0.1126435, 0.6934827, 0, 0, 0, 1, 1,
1.59319, 1.550194, 0.6653001, 0, 0, 0, 1, 1,
1.597277, 0.6592789, 2.111799, 0, 0, 0, 1, 1,
1.608731, -1.080092, 3.182455, 0, 0, 0, 1, 1,
1.611045, -0.9493613, 1.372643, 1, 1, 1, 1, 1,
1.644853, -0.7094263, 4.042315, 1, 1, 1, 1, 1,
1.650424, 0.4314558, 2.936468, 1, 1, 1, 1, 1,
1.652371, 0.5666524, 0.8034868, 1, 1, 1, 1, 1,
1.660601, 0.5475491, 1.265965, 1, 1, 1, 1, 1,
1.666904, -1.328297, 2.327309, 1, 1, 1, 1, 1,
1.682452, -0.9936701, 1.101582, 1, 1, 1, 1, 1,
1.720746, -1.245454, 3.98633, 1, 1, 1, 1, 1,
1.726436, 0.5125773, 1.378707, 1, 1, 1, 1, 1,
1.73537, 2.475721, 2.536495, 1, 1, 1, 1, 1,
1.737002, 0.1978482, 2.755665, 1, 1, 1, 1, 1,
1.741844, 0.5902594, 0.4819779, 1, 1, 1, 1, 1,
1.754255, -0.2304288, 1.013661, 1, 1, 1, 1, 1,
1.766311, -0.6487201, 0.4679521, 1, 1, 1, 1, 1,
1.767533, 0.3984622, 0.023699, 1, 1, 1, 1, 1,
1.771857, 1.215376, 0.7927545, 0, 0, 1, 1, 1,
1.773372, 0.7167801, 1.98752, 1, 0, 0, 1, 1,
1.777113, 0.1430963, 0.8583352, 1, 0, 0, 1, 1,
1.782779, -0.7639583, 2.542434, 1, 0, 0, 1, 1,
1.787499, 0.4432529, 0.4762003, 1, 0, 0, 1, 1,
1.793949, -0.9404398, 2.614036, 1, 0, 0, 1, 1,
1.806707, 1.73547, -0.05489897, 0, 0, 0, 1, 1,
1.823524, 0.4694646, 1.233814, 0, 0, 0, 1, 1,
1.840385, -0.7477883, 1.64068, 0, 0, 0, 1, 1,
1.841893, 0.5309072, 1.344593, 0, 0, 0, 1, 1,
1.842623, -0.6409564, 2.04284, 0, 0, 0, 1, 1,
1.852957, 1.582777, 2.187365, 0, 0, 0, 1, 1,
1.863308, -0.3586251, 1.792427, 0, 0, 0, 1, 1,
1.868961, 1.146987, 0.9864808, 1, 1, 1, 1, 1,
1.870146, -1.29684, 3.807498, 1, 1, 1, 1, 1,
1.879031, -0.5193641, 2.427649, 1, 1, 1, 1, 1,
1.882532, -0.4550679, 2.058773, 1, 1, 1, 1, 1,
1.883676, -0.5755666, 1.830503, 1, 1, 1, 1, 1,
1.886746, 0.0899902, 3.951479, 1, 1, 1, 1, 1,
1.910936, 1.351255, 0.8362922, 1, 1, 1, 1, 1,
1.926173, 0.3137926, -0.2104548, 1, 1, 1, 1, 1,
1.942559, 1.333464, 3.024822, 1, 1, 1, 1, 1,
1.942984, 0.7610309, 0.8413475, 1, 1, 1, 1, 1,
1.951846, 0.420399, 1.852051, 1, 1, 1, 1, 1,
1.964849, 1.409215, 0.7120351, 1, 1, 1, 1, 1,
1.97245, -1.716369, 1.343399, 1, 1, 1, 1, 1,
2.053258, 1.085997, -0.130059, 1, 1, 1, 1, 1,
2.059767, 0.2680728, 0.853237, 1, 1, 1, 1, 1,
2.072758, -2.384619, 1.482317, 0, 0, 1, 1, 1,
2.094062, 0.4874195, 2.453848, 1, 0, 0, 1, 1,
2.143732, 0.3576795, 2.405431, 1, 0, 0, 1, 1,
2.158217, 0.5008615, 1.060903, 1, 0, 0, 1, 1,
2.172402, -0.1920965, 1.419359, 1, 0, 0, 1, 1,
2.246013, 0.5550284, 1.528746, 1, 0, 0, 1, 1,
2.247172, -1.520531, 2.789738, 0, 0, 0, 1, 1,
2.247539, -1.340393, 2.609189, 0, 0, 0, 1, 1,
2.317075, -1.38457, 1.502217, 0, 0, 0, 1, 1,
2.319167, -0.3420916, 2.898594, 0, 0, 0, 1, 1,
2.334489, -0.3838741, 2.918149, 0, 0, 0, 1, 1,
2.359719, 0.2769267, 1.24767, 0, 0, 0, 1, 1,
2.362064, -0.4800182, 2.033119, 0, 0, 0, 1, 1,
2.362429, -1.133024, -1.173093, 1, 1, 1, 1, 1,
2.682124, -0.565524, 3.347726, 1, 1, 1, 1, 1,
2.80725, 0.4576145, 3.339966, 1, 1, 1, 1, 1,
2.866922, -0.7335801, 4.098233, 1, 1, 1, 1, 1,
2.873408, -0.3265725, 1.498639, 1, 1, 1, 1, 1,
3.090185, -0.6994545, 1.590885, 1, 1, 1, 1, 1,
3.353847, 0.4597012, 1.90779, 1, 1, 1, 1, 1
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
var radius = 9.543723;
var distance = 33.52192;
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
mvMatrix.translate( -0.1729689, 0.4274626, -0.2042582 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.52192);
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
