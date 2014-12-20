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
-2.938542, 0.1334441, -2.449093, 1, 0, 0, 1,
-2.725834, 0.3461252, -2.118989, 1, 0.007843138, 0, 1,
-2.670868, 1.432295, -0.8457272, 1, 0.01176471, 0, 1,
-2.667297, 0.9463835, -0.5429705, 1, 0.01960784, 0, 1,
-2.497617, -1.333428, -2.325841, 1, 0.02352941, 0, 1,
-2.478677, -0.5913861, -1.073354, 1, 0.03137255, 0, 1,
-2.432287, -0.3132181, 0.7579715, 1, 0.03529412, 0, 1,
-2.427353, -0.5214756, -2.154617, 1, 0.04313726, 0, 1,
-2.41626, -1.184714, -2.574619, 1, 0.04705882, 0, 1,
-2.415789, -0.8303608, -1.787413, 1, 0.05490196, 0, 1,
-2.380504, 0.3249722, -1.43257, 1, 0.05882353, 0, 1,
-2.358958, 0.6972844, -1.300857, 1, 0.06666667, 0, 1,
-2.234658, 0.9693357, -1.453566, 1, 0.07058824, 0, 1,
-2.132008, -0.2134397, -1.042235, 1, 0.07843138, 0, 1,
-2.114938, -0.395603, -1.362284, 1, 0.08235294, 0, 1,
-2.10209, -2.028401, -2.603676, 1, 0.09019608, 0, 1,
-2.095505, 0.6588349, -3.001353, 1, 0.09411765, 0, 1,
-2.095063, 0.451983, -2.905227, 1, 0.1019608, 0, 1,
-2.080949, 2.434082, -0.703318, 1, 0.1098039, 0, 1,
-2.078985, 0.5281481, -1.495958, 1, 0.1137255, 0, 1,
-2.073706, 1.315192, -1.463099, 1, 0.1215686, 0, 1,
-2.072757, 0.5239525, -1.658402, 1, 0.1254902, 0, 1,
-2.061368, -0.6409, -0.7487261, 1, 0.1333333, 0, 1,
-2.014372, 0.1461408, -1.000109, 1, 0.1372549, 0, 1,
-1.984255, -0.2557653, -0.06503318, 1, 0.145098, 0, 1,
-1.868947, -0.01754767, -0.6837096, 1, 0.1490196, 0, 1,
-1.818763, -1.733641, -1.810028, 1, 0.1568628, 0, 1,
-1.815447, -0.06785206, -1.17441, 1, 0.1607843, 0, 1,
-1.777289, -0.1903409, -2.109727, 1, 0.1686275, 0, 1,
-1.727679, -2.241234, -2.080118, 1, 0.172549, 0, 1,
-1.703702, -0.2474365, -3.456886, 1, 0.1803922, 0, 1,
-1.650721, -0.2216728, -1.575821, 1, 0.1843137, 0, 1,
-1.636138, -1.26765, -3.847013, 1, 0.1921569, 0, 1,
-1.613724, -0.8065477, -1.777428, 1, 0.1960784, 0, 1,
-1.590786, 0.3208838, -1.448495, 1, 0.2039216, 0, 1,
-1.567765, -0.07815128, -2.197693, 1, 0.2117647, 0, 1,
-1.557259, -1.567462, -0.6989909, 1, 0.2156863, 0, 1,
-1.55519, -0.3122759, -1.677289, 1, 0.2235294, 0, 1,
-1.53938, -0.4568423, -1.821895, 1, 0.227451, 0, 1,
-1.53385, 0.6303301, -2.16927, 1, 0.2352941, 0, 1,
-1.533682, -1.851828, -5.564512, 1, 0.2392157, 0, 1,
-1.533432, -0.3356456, -0.7508702, 1, 0.2470588, 0, 1,
-1.519144, 0.1740954, -0.4563985, 1, 0.2509804, 0, 1,
-1.498934, -0.2602885, -0.5295182, 1, 0.2588235, 0, 1,
-1.486786, -0.1693758, -1.755642, 1, 0.2627451, 0, 1,
-1.485322, 1.379876, -0.7394809, 1, 0.2705882, 0, 1,
-1.478629, -0.5688738, -2.181173, 1, 0.2745098, 0, 1,
-1.471218, 0.5399754, -1.992175, 1, 0.282353, 0, 1,
-1.464366, -1.425627, -0.9608625, 1, 0.2862745, 0, 1,
-1.460346, 0.5029984, 0.1216894, 1, 0.2941177, 0, 1,
-1.449903, 0.6295201, -0.01560423, 1, 0.3019608, 0, 1,
-1.446167, -0.1722492, -1.901074, 1, 0.3058824, 0, 1,
-1.446045, 0.2232267, -0.5611474, 1, 0.3137255, 0, 1,
-1.438516, 0.07041165, -2.311729, 1, 0.3176471, 0, 1,
-1.437636, 0.5676461, -1.2512, 1, 0.3254902, 0, 1,
-1.425159, 0.8339833, -1.60078, 1, 0.3294118, 0, 1,
-1.404157, -0.9502145, -3.139762, 1, 0.3372549, 0, 1,
-1.401119, -1.523302, -2.691129, 1, 0.3411765, 0, 1,
-1.394914, 0.2432919, -2.097929, 1, 0.3490196, 0, 1,
-1.382095, 0.04764395, -0.0956747, 1, 0.3529412, 0, 1,
-1.379056, -0.02983882, -2.658796, 1, 0.3607843, 0, 1,
-1.364405, 0.5601507, -1.876027, 1, 0.3647059, 0, 1,
-1.362605, 1.883211, -0.008545072, 1, 0.372549, 0, 1,
-1.359668, -0.6843635, -2.855808, 1, 0.3764706, 0, 1,
-1.354516, -0.7139306, -0.8895069, 1, 0.3843137, 0, 1,
-1.34899, 0.1490225, -0.9668977, 1, 0.3882353, 0, 1,
-1.346425, 1.07206, -0.9872836, 1, 0.3960784, 0, 1,
-1.343291, 0.9159945, -0.09210607, 1, 0.4039216, 0, 1,
-1.338019, -1.417299, -1.931828, 1, 0.4078431, 0, 1,
-1.314164, 0.5455005, -1.561339, 1, 0.4156863, 0, 1,
-1.304312, 0.4583007, -0.1680971, 1, 0.4196078, 0, 1,
-1.299441, 0.6415077, 0.4345396, 1, 0.427451, 0, 1,
-1.276876, -1.030112, -2.510661, 1, 0.4313726, 0, 1,
-1.261316, 0.4248702, -0.03453759, 1, 0.4392157, 0, 1,
-1.260788, 0.2304102, -1.387071, 1, 0.4431373, 0, 1,
-1.259677, 1.010663, -1.973241, 1, 0.4509804, 0, 1,
-1.254628, -1.422296, -2.370199, 1, 0.454902, 0, 1,
-1.243331, 0.3576443, -1.065354, 1, 0.4627451, 0, 1,
-1.237232, 0.8896044, 0.1436004, 1, 0.4666667, 0, 1,
-1.236562, -1.054291, -2.967261, 1, 0.4745098, 0, 1,
-1.222178, -0.8245022, -2.691895, 1, 0.4784314, 0, 1,
-1.217921, -1.426362, -1.98448, 1, 0.4862745, 0, 1,
-1.215467, -0.8638884, -1.430739, 1, 0.4901961, 0, 1,
-1.210371, 1.840741, 0.8341088, 1, 0.4980392, 0, 1,
-1.209587, -0.008205536, -1.722502, 1, 0.5058824, 0, 1,
-1.198129, 0.5224267, -2.291232, 1, 0.509804, 0, 1,
-1.193488, -0.244218, -1.887813, 1, 0.5176471, 0, 1,
-1.191683, 1.183953, 1.318311, 1, 0.5215687, 0, 1,
-1.190479, 1.442161, -0.1367214, 1, 0.5294118, 0, 1,
-1.187529, 0.01499937, -0.8135543, 1, 0.5333334, 0, 1,
-1.176719, 0.005488593, -0.6526279, 1, 0.5411765, 0, 1,
-1.171061, -0.06615833, -1.415835, 1, 0.5450981, 0, 1,
-1.169947, 0.1989336, -1.432786, 1, 0.5529412, 0, 1,
-1.169624, -0.9103382, -2.256222, 1, 0.5568628, 0, 1,
-1.160385, -1.006781, -1.103529, 1, 0.5647059, 0, 1,
-1.160251, 0.9117981, -2.192817, 1, 0.5686275, 0, 1,
-1.159624, -0.190666, -1.915979, 1, 0.5764706, 0, 1,
-1.159339, 0.992528, -1.30977, 1, 0.5803922, 0, 1,
-1.151015, -3.143298, -3.932658, 1, 0.5882353, 0, 1,
-1.144569, -0.2676502, -1.576049, 1, 0.5921569, 0, 1,
-1.142469, -1.013278, -1.797236, 1, 0.6, 0, 1,
-1.142442, -0.7654641, -2.443321, 1, 0.6078432, 0, 1,
-1.141838, 0.936869, 0.4566114, 1, 0.6117647, 0, 1,
-1.128135, -1.282408, -1.75102, 1, 0.6196079, 0, 1,
-1.127347, 0.7149397, 1.610952, 1, 0.6235294, 0, 1,
-1.123347, 1.059397, -1.499588, 1, 0.6313726, 0, 1,
-1.11591, -0.6024387, -2.266734, 1, 0.6352941, 0, 1,
-1.115562, 0.1318268, -1.137489, 1, 0.6431373, 0, 1,
-1.106862, -1.433558, -1.505365, 1, 0.6470588, 0, 1,
-1.106785, 0.2306806, -0.1410702, 1, 0.654902, 0, 1,
-1.105945, 0.06374179, -1.689214, 1, 0.6588235, 0, 1,
-1.104267, 0.1388879, -2.48232, 1, 0.6666667, 0, 1,
-1.097344, -0.2514057, -1.4857, 1, 0.6705883, 0, 1,
-1.089432, 0.1793119, -1.362845, 1, 0.6784314, 0, 1,
-1.08392, 1.277699, -0.2359878, 1, 0.682353, 0, 1,
-1.076652, -3.05229, -4.066473, 1, 0.6901961, 0, 1,
-1.067706, -0.9627441, -2.715865, 1, 0.6941177, 0, 1,
-1.065723, 0.3342853, -0.9710133, 1, 0.7019608, 0, 1,
-1.06024, -0.4977956, -2.30533, 1, 0.7098039, 0, 1,
-1.058152, 0.2064303, -1.800587, 1, 0.7137255, 0, 1,
-1.055784, 0.1821256, -0.7890587, 1, 0.7215686, 0, 1,
-1.042743, 0.4885648, -1.584974, 1, 0.7254902, 0, 1,
-1.038536, -1.450878, -2.338636, 1, 0.7333333, 0, 1,
-1.035405, -0.2210086, -2.082031, 1, 0.7372549, 0, 1,
-1.032086, 0.1647035, -1.422109, 1, 0.7450981, 0, 1,
-1.03, -0.02866246, -0.2083746, 1, 0.7490196, 0, 1,
-1.023998, 1.097946, -0.5835338, 1, 0.7568628, 0, 1,
-1.008464, 0.03224584, -1.599219, 1, 0.7607843, 0, 1,
-1.00649, 0.3585235, -0.1360933, 1, 0.7686275, 0, 1,
-1.004915, 0.3529916, -1.683619, 1, 0.772549, 0, 1,
-1.003206, -0.8747419, -2.668896, 1, 0.7803922, 0, 1,
-1.002114, -0.07591554, -2.164499, 1, 0.7843137, 0, 1,
-1.001556, 0.8686549, -1.24013, 1, 0.7921569, 0, 1,
-0.9999791, 1.145169, -0.02204059, 1, 0.7960784, 0, 1,
-0.9991083, -0.801286, -2.395192, 1, 0.8039216, 0, 1,
-0.9759551, 1.497544, -1.663561, 1, 0.8117647, 0, 1,
-0.9705174, -0.1211867, -2.652842, 1, 0.8156863, 0, 1,
-0.9572692, -0.3269093, -1.935671, 1, 0.8235294, 0, 1,
-0.9523281, 0.1915109, -2.724213, 1, 0.827451, 0, 1,
-0.9445309, -0.3089829, -2.13766, 1, 0.8352941, 0, 1,
-0.9425846, 0.003427822, -0.8017913, 1, 0.8392157, 0, 1,
-0.9420047, -0.2713315, -0.5117804, 1, 0.8470588, 0, 1,
-0.9384778, -0.3351893, -1.345063, 1, 0.8509804, 0, 1,
-0.9351434, 0.6220919, -0.8885894, 1, 0.8588235, 0, 1,
-0.9307743, -1.654922, -1.641854, 1, 0.8627451, 0, 1,
-0.9293854, -0.3542302, -1.587846, 1, 0.8705882, 0, 1,
-0.9257399, -0.3770573, -1.670628, 1, 0.8745098, 0, 1,
-0.9128582, -0.3879561, -1.497243, 1, 0.8823529, 0, 1,
-0.9116208, 0.6395834, -1.769813, 1, 0.8862745, 0, 1,
-0.9109349, -1.061462, -2.811642, 1, 0.8941177, 0, 1,
-0.9073791, -0.2466002, -1.808778, 1, 0.8980392, 0, 1,
-0.8958759, 0.4703985, -0.03005085, 1, 0.9058824, 0, 1,
-0.8908218, -1.61131, -0.5556912, 1, 0.9137255, 0, 1,
-0.8842219, 0.1725818, -0.6837146, 1, 0.9176471, 0, 1,
-0.8833666, -0.6112371, -2.911807, 1, 0.9254902, 0, 1,
-0.8779953, -0.487328, -3.216316, 1, 0.9294118, 0, 1,
-0.8773465, -1.099025, -1.948715, 1, 0.9372549, 0, 1,
-0.876932, -0.8590288, -1.963332, 1, 0.9411765, 0, 1,
-0.8759544, 0.8781819, -0.3333642, 1, 0.9490196, 0, 1,
-0.8675681, -0.1964828, -1.376178, 1, 0.9529412, 0, 1,
-0.8617377, -0.4192215, -2.381814, 1, 0.9607843, 0, 1,
-0.8587433, -0.1472556, -2.937968, 1, 0.9647059, 0, 1,
-0.8582853, 0.3181444, -0.2818524, 1, 0.972549, 0, 1,
-0.8552753, 0.3656535, -1.503846, 1, 0.9764706, 0, 1,
-0.8533428, -1.503902, -0.6157363, 1, 0.9843137, 0, 1,
-0.8453323, 1.913984, -1.22677, 1, 0.9882353, 0, 1,
-0.8330929, -1.171278, -2.599485, 1, 0.9960784, 0, 1,
-0.8260983, 0.2334761, -1.659693, 0.9960784, 1, 0, 1,
-0.8234414, 0.1434476, -3.496423, 0.9921569, 1, 0, 1,
-0.8231582, -0.2671942, -2.767759, 0.9843137, 1, 0, 1,
-0.8186811, -0.526165, -2.81027, 0.9803922, 1, 0, 1,
-0.8172445, 0.846857, -1.400042, 0.972549, 1, 0, 1,
-0.8075625, -0.4261527, -0.8468019, 0.9686275, 1, 0, 1,
-0.8037419, -1.414286, -4.731496, 0.9607843, 1, 0, 1,
-0.8033981, -0.1807975, -2.814403, 0.9568627, 1, 0, 1,
-0.8013115, -0.1367745, -3.033651, 0.9490196, 1, 0, 1,
-0.7987871, 0.5316319, -0.4280812, 0.945098, 1, 0, 1,
-0.7983552, -0.001488364, -1.468889, 0.9372549, 1, 0, 1,
-0.7922719, 0.7061988, -1.06895, 0.9333333, 1, 0, 1,
-0.7915712, -1.066246, -2.189642, 0.9254902, 1, 0, 1,
-0.7914249, -1.503381, -3.489976, 0.9215686, 1, 0, 1,
-0.7833713, 1.608672, -1.685017, 0.9137255, 1, 0, 1,
-0.7780356, 0.3382555, -1.292704, 0.9098039, 1, 0, 1,
-0.7764146, 0.8425037, -0.8194864, 0.9019608, 1, 0, 1,
-0.7729652, -1.812468, -2.713434, 0.8941177, 1, 0, 1,
-0.7674662, -0.04038784, -1.721075, 0.8901961, 1, 0, 1,
-0.766024, -0.4695289, -2.071639, 0.8823529, 1, 0, 1,
-0.7654298, 1.952437, -0.1975257, 0.8784314, 1, 0, 1,
-0.7604388, -1.608358, -1.876155, 0.8705882, 1, 0, 1,
-0.7583199, -1.612557, -3.731638, 0.8666667, 1, 0, 1,
-0.7564243, 0.4209819, -0.7949476, 0.8588235, 1, 0, 1,
-0.7477084, 1.67447, 1.366921, 0.854902, 1, 0, 1,
-0.7424815, -1.622254, -2.511536, 0.8470588, 1, 0, 1,
-0.7413423, 0.2121058, -1.442862, 0.8431373, 1, 0, 1,
-0.741117, -1.762881, -1.042776, 0.8352941, 1, 0, 1,
-0.7378568, -0.1574678, -1.800667, 0.8313726, 1, 0, 1,
-0.7359663, 1.148168, -0.609641, 0.8235294, 1, 0, 1,
-0.7351232, 0.03193169, -2.799227, 0.8196079, 1, 0, 1,
-0.731437, 1.124371, -0.07875125, 0.8117647, 1, 0, 1,
-0.7312769, 0.6414415, -0.3172695, 0.8078431, 1, 0, 1,
-0.7297479, 1.93277, -2.356486, 0.8, 1, 0, 1,
-0.7253609, -1.626671, -2.047933, 0.7921569, 1, 0, 1,
-0.7245295, 2.508109, 1.092314, 0.7882353, 1, 0, 1,
-0.7233812, -0.5836056, -1.689442, 0.7803922, 1, 0, 1,
-0.7189129, 0.4759304, 2.727489, 0.7764706, 1, 0, 1,
-0.7174397, -1.475936, -2.252971, 0.7686275, 1, 0, 1,
-0.7148651, 1.273223, -0.2082026, 0.7647059, 1, 0, 1,
-0.7130315, 0.6885802, -0.9169651, 0.7568628, 1, 0, 1,
-0.7115681, 0.7405183, -0.9337804, 0.7529412, 1, 0, 1,
-0.7106794, -1.004341, -3.32287, 0.7450981, 1, 0, 1,
-0.7054112, -0.6507887, -1.792817, 0.7411765, 1, 0, 1,
-0.7046175, -0.2290761, -1.694945, 0.7333333, 1, 0, 1,
-0.6950086, 1.319431, -0.07504652, 0.7294118, 1, 0, 1,
-0.6929184, 0.3904379, 0.1889559, 0.7215686, 1, 0, 1,
-0.6926158, 0.4800182, -1.554626, 0.7176471, 1, 0, 1,
-0.6921521, -0.4080374, -0.9157715, 0.7098039, 1, 0, 1,
-0.6914144, 2.168487, -0.1219482, 0.7058824, 1, 0, 1,
-0.6913586, 0.6355101, -1.122669, 0.6980392, 1, 0, 1,
-0.6871834, -0.2539178, -2.734079, 0.6901961, 1, 0, 1,
-0.6859692, 0.1566493, -1.127131, 0.6862745, 1, 0, 1,
-0.6824402, -0.290154, -1.251063, 0.6784314, 1, 0, 1,
-0.6737826, 1.087903, -1.478103, 0.6745098, 1, 0, 1,
-0.671905, 0.6760421, 0.3809945, 0.6666667, 1, 0, 1,
-0.6714684, -1.561076, -3.262703, 0.6627451, 1, 0, 1,
-0.6707543, 2.030018, -0.9729906, 0.654902, 1, 0, 1,
-0.6681192, -0.1690848, -0.9950339, 0.6509804, 1, 0, 1,
-0.6636843, -0.02433788, -2.461152, 0.6431373, 1, 0, 1,
-0.6621627, -0.6446184, -3.750426, 0.6392157, 1, 0, 1,
-0.6605505, 1.676086, -0.828625, 0.6313726, 1, 0, 1,
-0.6601071, -0.4463806, -2.045472, 0.627451, 1, 0, 1,
-0.647067, 1.181029, -1.05182, 0.6196079, 1, 0, 1,
-0.6450964, 0.01713634, -1.491683, 0.6156863, 1, 0, 1,
-0.6411421, 0.4885302, -2.293768, 0.6078432, 1, 0, 1,
-0.6410949, 2.474641, -0.8851769, 0.6039216, 1, 0, 1,
-0.6399116, 0.1801084, -1.476756, 0.5960785, 1, 0, 1,
-0.6381649, -0.9947349, -3.596696, 0.5882353, 1, 0, 1,
-0.6375431, 0.967854, -1.529207, 0.5843138, 1, 0, 1,
-0.6335475, 0.2872505, -0.9253376, 0.5764706, 1, 0, 1,
-0.6333721, 0.590619, -1.381331, 0.572549, 1, 0, 1,
-0.6214379, -0.2724727, -3.278512, 0.5647059, 1, 0, 1,
-0.6207279, 1.380039, -0.7583835, 0.5607843, 1, 0, 1,
-0.6197589, -0.02797622, -3.655717, 0.5529412, 1, 0, 1,
-0.6143379, -0.1137189, -0.768291, 0.5490196, 1, 0, 1,
-0.6138301, 0.3786311, -0.575232, 0.5411765, 1, 0, 1,
-0.6072531, 0.345161, 0.523645, 0.5372549, 1, 0, 1,
-0.6067725, -1.540819, -3.431202, 0.5294118, 1, 0, 1,
-0.6010514, 0.9262246, 0.6708751, 0.5254902, 1, 0, 1,
-0.59778, -0.9253199, -3.248564, 0.5176471, 1, 0, 1,
-0.597437, 0.0672901, -2.684814, 0.5137255, 1, 0, 1,
-0.5926248, 0.5502889, 0.8321611, 0.5058824, 1, 0, 1,
-0.5885901, -0.4192969, -2.442486, 0.5019608, 1, 0, 1,
-0.5881868, -0.8260586, -2.321421, 0.4941176, 1, 0, 1,
-0.5865893, 0.6932149, 0.4698481, 0.4862745, 1, 0, 1,
-0.5845585, -1.810103, -1.228566, 0.4823529, 1, 0, 1,
-0.5845378, 0.1529749, -0.2663318, 0.4745098, 1, 0, 1,
-0.5820096, 0.2664962, -2.146523, 0.4705882, 1, 0, 1,
-0.5767291, 1.172766, -1.839561, 0.4627451, 1, 0, 1,
-0.5728313, 0.9067884, -1.255117, 0.4588235, 1, 0, 1,
-0.56774, 0.9430796, -1.320814, 0.4509804, 1, 0, 1,
-0.5672792, -0.479815, -2.803708, 0.4470588, 1, 0, 1,
-0.5607989, -1.087024, -3.288904, 0.4392157, 1, 0, 1,
-0.5602524, -1.128344, -1.160739, 0.4352941, 1, 0, 1,
-0.5600356, 0.8538377, -0.6403927, 0.427451, 1, 0, 1,
-0.5594878, 0.3759796, 0.1173456, 0.4235294, 1, 0, 1,
-0.5565808, -0.3372332, -3.219412, 0.4156863, 1, 0, 1,
-0.5557451, 0.2358939, -1.78073, 0.4117647, 1, 0, 1,
-0.5462931, 1.127747, -0.6978665, 0.4039216, 1, 0, 1,
-0.5460782, -0.8696293, -2.245975, 0.3960784, 1, 0, 1,
-0.5448247, -1.266722, -3.141575, 0.3921569, 1, 0, 1,
-0.5435019, -1.208901, -3.302047, 0.3843137, 1, 0, 1,
-0.5417863, -0.6518409, -2.133044, 0.3803922, 1, 0, 1,
-0.541684, -0.4949663, -2.834841, 0.372549, 1, 0, 1,
-0.53174, -1.274478, -3.569302, 0.3686275, 1, 0, 1,
-0.5316472, -0.4049367, -1.864704, 0.3607843, 1, 0, 1,
-0.5313735, 1.140709, -0.9593963, 0.3568628, 1, 0, 1,
-0.5282274, -0.04345206, -0.8293733, 0.3490196, 1, 0, 1,
-0.5270479, 0.8140163, 0.2068987, 0.345098, 1, 0, 1,
-0.5268942, -1.225666, -3.236959, 0.3372549, 1, 0, 1,
-0.5247321, -0.9354359, -3.052199, 0.3333333, 1, 0, 1,
-0.5149116, -0.1325726, -2.692345, 0.3254902, 1, 0, 1,
-0.5148641, 0.2005507, -1.990578, 0.3215686, 1, 0, 1,
-0.5125503, -0.7078912, -1.102451, 0.3137255, 1, 0, 1,
-0.5082356, 0.02836851, -1.493559, 0.3098039, 1, 0, 1,
-0.5082331, -1.916502, -2.948846, 0.3019608, 1, 0, 1,
-0.5007038, -0.1343356, -1.184638, 0.2941177, 1, 0, 1,
-0.4995741, -0.2142052, -2.532164, 0.2901961, 1, 0, 1,
-0.4995152, 0.9182187, 0.03556476, 0.282353, 1, 0, 1,
-0.4993834, -1.109099, -2.25966, 0.2784314, 1, 0, 1,
-0.4973896, 0.672155, 0.5440387, 0.2705882, 1, 0, 1,
-0.4876345, -0.3567173, -2.671985, 0.2666667, 1, 0, 1,
-0.4838591, 0.3638374, -1.116534, 0.2588235, 1, 0, 1,
-0.4812775, -0.4991457, -1.896092, 0.254902, 1, 0, 1,
-0.4760851, -0.1355107, 0.08689896, 0.2470588, 1, 0, 1,
-0.4740077, 0.08461735, -0.7108151, 0.2431373, 1, 0, 1,
-0.4658698, 0.2667315, -1.334312, 0.2352941, 1, 0, 1,
-0.4654121, -0.191069, -2.212569, 0.2313726, 1, 0, 1,
-0.4645185, 1.145989, -1.351086, 0.2235294, 1, 0, 1,
-0.4561304, 1.647108, -1.142462, 0.2196078, 1, 0, 1,
-0.4536157, 2.204207, -1.391598, 0.2117647, 1, 0, 1,
-0.4532852, -0.9213804, -4.499763, 0.2078431, 1, 0, 1,
-0.4469666, -0.8971624, -4.45612, 0.2, 1, 0, 1,
-0.4453085, -0.1120409, -3.181925, 0.1921569, 1, 0, 1,
-0.4450011, 0.9080099, -0.5286349, 0.1882353, 1, 0, 1,
-0.441094, -0.4699459, -1.968188, 0.1803922, 1, 0, 1,
-0.4400455, -0.7281007, -3.169417, 0.1764706, 1, 0, 1,
-0.4381961, -0.9843845, -3.413139, 0.1686275, 1, 0, 1,
-0.4379773, -0.7914549, -3.867359, 0.1647059, 1, 0, 1,
-0.4369211, 1.692038, -2.291668, 0.1568628, 1, 0, 1,
-0.436327, -0.1249697, -1.931667, 0.1529412, 1, 0, 1,
-0.4255705, -0.4582659, -3.314988, 0.145098, 1, 0, 1,
-0.4247412, 0.02610778, -0.8588292, 0.1411765, 1, 0, 1,
-0.4233602, -0.7832649, -2.73498, 0.1333333, 1, 0, 1,
-0.4112965, -1.013688, -1.557267, 0.1294118, 1, 0, 1,
-0.4064875, -0.8180972, -3.304121, 0.1215686, 1, 0, 1,
-0.405356, -0.3594805, -4.234535, 0.1176471, 1, 0, 1,
-0.4034306, -0.8697034, -2.013648, 0.1098039, 1, 0, 1,
-0.4018257, -0.5246767, -1.492374, 0.1058824, 1, 0, 1,
-0.3931904, -0.9189211, -2.841587, 0.09803922, 1, 0, 1,
-0.3847554, 0.4613959, -1.784842, 0.09019608, 1, 0, 1,
-0.3760321, -0.9042261, -1.702028, 0.08627451, 1, 0, 1,
-0.3738272, 1.140519, 0.94888, 0.07843138, 1, 0, 1,
-0.369154, 1.195567, 0.1322218, 0.07450981, 1, 0, 1,
-0.3688208, 0.06033867, -1.765182, 0.06666667, 1, 0, 1,
-0.3631102, -0.248582, -1.942217, 0.0627451, 1, 0, 1,
-0.3551638, -0.7980564, -4.118784, 0.05490196, 1, 0, 1,
-0.3516886, 1.25918, 1.496193, 0.05098039, 1, 0, 1,
-0.3478084, -0.6875967, -2.484258, 0.04313726, 1, 0, 1,
-0.3467873, -2.089737, -3.3351, 0.03921569, 1, 0, 1,
-0.3464978, -0.6348731, -2.258231, 0.03137255, 1, 0, 1,
-0.34521, -0.7499638, -1.647681, 0.02745098, 1, 0, 1,
-0.34141, 0.5452464, 0.9827963, 0.01960784, 1, 0, 1,
-0.3404121, -0.006185206, -1.316672, 0.01568628, 1, 0, 1,
-0.3371822, -1.030451, -5.393688, 0.007843138, 1, 0, 1,
-0.3363701, 1.801658, -0.833583, 0.003921569, 1, 0, 1,
-0.3347602, -0.8023841, -2.29361, 0, 1, 0.003921569, 1,
-0.3346717, -2.675188, -1.7998, 0, 1, 0.01176471, 1,
-0.3288, 0.8609031, -0.3849319, 0, 1, 0.01568628, 1,
-0.3266924, 0.4675377, -1.285837, 0, 1, 0.02352941, 1,
-0.3235782, -0.2705803, -0.4041972, 0, 1, 0.02745098, 1,
-0.3227116, -0.1973193, -1.959748, 0, 1, 0.03529412, 1,
-0.3195247, -0.1839002, -2.417027, 0, 1, 0.03921569, 1,
-0.3162206, 0.7538456, -1.500494, 0, 1, 0.04705882, 1,
-0.3108296, -0.0635751, -0.6510793, 0, 1, 0.05098039, 1,
-0.3099249, -1.501283, -3.498212, 0, 1, 0.05882353, 1,
-0.3061399, -0.0593316, -2.564873, 0, 1, 0.0627451, 1,
-0.2948181, -1.710179, -0.9070925, 0, 1, 0.07058824, 1,
-0.2947899, 1.572762, 0.6279843, 0, 1, 0.07450981, 1,
-0.2925716, -0.1653237, -0.3792782, 0, 1, 0.08235294, 1,
-0.2907854, 0.8991997, 0.1586457, 0, 1, 0.08627451, 1,
-0.2897792, 0.3357238, -0.1689112, 0, 1, 0.09411765, 1,
-0.2872739, 0.9372587, 1.928936, 0, 1, 0.1019608, 1,
-0.2855801, 0.3624086, 1.254715, 0, 1, 0.1058824, 1,
-0.2843555, 0.2080827, 0.175526, 0, 1, 0.1137255, 1,
-0.27855, 0.2501445, -0.118119, 0, 1, 0.1176471, 1,
-0.2745208, -0.06275215, -2.046515, 0, 1, 0.1254902, 1,
-0.2681348, 1.124099, -1.251148, 0, 1, 0.1294118, 1,
-0.2668209, 1.287766, 0.9881011, 0, 1, 0.1372549, 1,
-0.2668061, 0.09707852, -1.547587, 0, 1, 0.1411765, 1,
-0.2651938, -1.344378, -4.182688, 0, 1, 0.1490196, 1,
-0.2645113, -0.2067365, -3.466189, 0, 1, 0.1529412, 1,
-0.2607186, 0.4954634, 1.091837, 0, 1, 0.1607843, 1,
-0.2558575, -1.562695, -2.844851, 0, 1, 0.1647059, 1,
-0.2471239, 0.183609, -0.3919731, 0, 1, 0.172549, 1,
-0.2444495, -1.351311, -1.41483, 0, 1, 0.1764706, 1,
-0.2432895, -1.061448, -2.843923, 0, 1, 0.1843137, 1,
-0.233532, 0.02764919, -1.22582, 0, 1, 0.1882353, 1,
-0.2313087, -0.01673616, -2.52424, 0, 1, 0.1960784, 1,
-0.2264534, -0.1454268, -0.4416057, 0, 1, 0.2039216, 1,
-0.2257186, 0.3435766, -1.470694, 0, 1, 0.2078431, 1,
-0.2215372, -0.303737, -4.667423, 0, 1, 0.2156863, 1,
-0.2173576, -0.1586636, -0.3048989, 0, 1, 0.2196078, 1,
-0.2155896, -0.8951633, -2.309231, 0, 1, 0.227451, 1,
-0.2144742, 0.150537, -0.7245482, 0, 1, 0.2313726, 1,
-0.214409, -0.7719615, -0.9204212, 0, 1, 0.2392157, 1,
-0.2111651, 1.68101, -1.657121, 0, 1, 0.2431373, 1,
-0.2067017, -0.5171092, -3.584177, 0, 1, 0.2509804, 1,
-0.2062635, -0.5250412, -0.83846, 0, 1, 0.254902, 1,
-0.205339, 0.04281051, 0.008683292, 0, 1, 0.2627451, 1,
-0.1978807, 0.6409469, -1.080671, 0, 1, 0.2666667, 1,
-0.1975728, -0.04439346, -1.068563, 0, 1, 0.2745098, 1,
-0.1909157, 0.2835055, -0.3737316, 0, 1, 0.2784314, 1,
-0.1868208, -2.122636, -2.488574, 0, 1, 0.2862745, 1,
-0.1768598, -0.7300125, -1.474314, 0, 1, 0.2901961, 1,
-0.1725727, 2.016002, -1.681936, 0, 1, 0.2980392, 1,
-0.1664702, -0.590268, -2.965394, 0, 1, 0.3058824, 1,
-0.1643286, -0.777806, -1.360996, 0, 1, 0.3098039, 1,
-0.163154, -2.581177, -2.288136, 0, 1, 0.3176471, 1,
-0.1622713, 0.9506595, 1.225369, 0, 1, 0.3215686, 1,
-0.1570991, 1.258866, 0.3832282, 0, 1, 0.3294118, 1,
-0.1528299, -1.110829, -2.096456, 0, 1, 0.3333333, 1,
-0.1521385, -0.09331268, -4.303331, 0, 1, 0.3411765, 1,
-0.149962, 0.3811013, -0.4112576, 0, 1, 0.345098, 1,
-0.1483293, 0.6140032, -0.7453897, 0, 1, 0.3529412, 1,
-0.1471688, 0.04702285, -0.8128216, 0, 1, 0.3568628, 1,
-0.1467905, -0.6522021, -4.547658, 0, 1, 0.3647059, 1,
-0.1455198, -1.52589, -2.18304, 0, 1, 0.3686275, 1,
-0.1374533, 1.069122, 1.879991, 0, 1, 0.3764706, 1,
-0.1371581, -0.348055, -3.324876, 0, 1, 0.3803922, 1,
-0.136321, 0.2211183, -0.284171, 0, 1, 0.3882353, 1,
-0.1330861, 0.3786463, 0.3646629, 0, 1, 0.3921569, 1,
-0.1329351, 2.021554, 0.1560994, 0, 1, 0.4, 1,
-0.1290535, 0.1568302, 0.5792127, 0, 1, 0.4078431, 1,
-0.127886, -0.3295703, -1.397643, 0, 1, 0.4117647, 1,
-0.1277544, 0.3884017, 1.536048, 0, 1, 0.4196078, 1,
-0.1264668, 1.286598, -1.327497, 0, 1, 0.4235294, 1,
-0.1264468, 0.4442489, -1.125061, 0, 1, 0.4313726, 1,
-0.1248553, 0.7765687, -0.09479142, 0, 1, 0.4352941, 1,
-0.1213361, -1.53644, -5.153349, 0, 1, 0.4431373, 1,
-0.1212734, 0.5288327, 0.5311124, 0, 1, 0.4470588, 1,
-0.1200994, 0.6932528, -0.5735842, 0, 1, 0.454902, 1,
-0.114526, 0.8145704, 0.2659841, 0, 1, 0.4588235, 1,
-0.1096383, 2.296872, 0.2401375, 0, 1, 0.4666667, 1,
-0.1055262, 0.7603459, 0.9740515, 0, 1, 0.4705882, 1,
-0.1044282, 1.181477, 0.7709212, 0, 1, 0.4784314, 1,
-0.1024177, -1.539874, -1.418853, 0, 1, 0.4823529, 1,
-0.09326433, -0.4504164, -2.535854, 0, 1, 0.4901961, 1,
-0.0926626, -1.138645, -4.829171, 0, 1, 0.4941176, 1,
-0.09197916, 1.859425, 0.5373213, 0, 1, 0.5019608, 1,
-0.09156603, -1.123756, -2.1387, 0, 1, 0.509804, 1,
-0.0902345, 0.9547321, -0.4674686, 0, 1, 0.5137255, 1,
-0.08971714, -0.5545668, -2.592921, 0, 1, 0.5215687, 1,
-0.08695044, 0.3649504, 0.7244509, 0, 1, 0.5254902, 1,
-0.08370417, -0.04142545, -1.436121, 0, 1, 0.5333334, 1,
-0.08269312, -1.887196, -2.211036, 0, 1, 0.5372549, 1,
-0.0818675, -0.1429298, -3.272927, 0, 1, 0.5450981, 1,
-0.07927831, 1.008451, 1.12961, 0, 1, 0.5490196, 1,
-0.07795633, -1.221091, -3.938054, 0, 1, 0.5568628, 1,
-0.07553069, -0.3320545, -4.138639, 0, 1, 0.5607843, 1,
-0.07508509, 0.9215307, 0.7338677, 0, 1, 0.5686275, 1,
-0.0687563, -3.128139, -1.358673, 0, 1, 0.572549, 1,
-0.06686988, -1.27393, -2.924981, 0, 1, 0.5803922, 1,
-0.05830048, 1.052651, 0.3188587, 0, 1, 0.5843138, 1,
-0.05795972, 0.453863, -1.88653, 0, 1, 0.5921569, 1,
-0.05667797, 1.047211, -1.618767, 0, 1, 0.5960785, 1,
-0.05621761, -0.1286938, -2.958258, 0, 1, 0.6039216, 1,
-0.05621601, -0.6872236, -4.060704, 0, 1, 0.6117647, 1,
-0.05576082, -2.049726, -4.470516, 0, 1, 0.6156863, 1,
-0.05284391, -0.1091257, -2.180489, 0, 1, 0.6235294, 1,
-0.05077073, -1.004155, -3.005284, 0, 1, 0.627451, 1,
-0.04998082, 1.171825, -0.3872861, 0, 1, 0.6352941, 1,
-0.0452576, -1.045484, -1.891066, 0, 1, 0.6392157, 1,
-0.04429173, 0.005285431, -2.087065, 0, 1, 0.6470588, 1,
-0.0360655, -1.349405, -2.206789, 0, 1, 0.6509804, 1,
-0.03348848, -1.17753, -3.179552, 0, 1, 0.6588235, 1,
-0.03156516, 0.1002682, -0.5128303, 0, 1, 0.6627451, 1,
-0.0276766, -0.1028634, -3.145413, 0, 1, 0.6705883, 1,
-0.02696109, -0.1825684, -2.854767, 0, 1, 0.6745098, 1,
-0.0230407, 0.1709862, -0.1422059, 0, 1, 0.682353, 1,
-0.02263785, 0.6083351, -0.7008041, 0, 1, 0.6862745, 1,
-0.02061165, 1.003155, -1.315957, 0, 1, 0.6941177, 1,
-0.02022397, 0.1711904, -1.345104, 0, 1, 0.7019608, 1,
-0.01894369, 2.262885, -0.9333907, 0, 1, 0.7058824, 1,
-0.01839501, 1.123339, -2.315407, 0, 1, 0.7137255, 1,
-0.017942, -0.7126251, -2.341215, 0, 1, 0.7176471, 1,
-0.01306564, -0.6185837, -1.347171, 0, 1, 0.7254902, 1,
-0.008905588, -0.4950357, -1.954391, 0, 1, 0.7294118, 1,
-0.008748749, -0.1081601, -3.327726, 0, 1, 0.7372549, 1,
-0.008576428, 0.9918421, -1.255285, 0, 1, 0.7411765, 1,
-0.005252466, -1.327481, -2.896657, 0, 1, 0.7490196, 1,
0.003971498, 0.8688384, 0.80588, 0, 1, 0.7529412, 1,
0.005717315, -0.8598896, 3.889846, 0, 1, 0.7607843, 1,
0.00641328, -0.218358, 5.431002, 0, 1, 0.7647059, 1,
0.007279255, -0.4467086, 2.966291, 0, 1, 0.772549, 1,
0.01075353, -0.4437108, 1.92014, 0, 1, 0.7764706, 1,
0.01315892, 1.179514, 0.9669282, 0, 1, 0.7843137, 1,
0.01333704, 0.05400723, 0.5083073, 0, 1, 0.7882353, 1,
0.01490037, -0.2957022, 3.287597, 0, 1, 0.7960784, 1,
0.01964086, 0.1718763, 1.408792, 0, 1, 0.8039216, 1,
0.02111309, -0.7346507, 2.30138, 0, 1, 0.8078431, 1,
0.0226668, -0.5932106, 4.405988, 0, 1, 0.8156863, 1,
0.02514544, 0.382219, 0.738193, 0, 1, 0.8196079, 1,
0.02626453, 0.4184836, -1.451342, 0, 1, 0.827451, 1,
0.02713844, 0.7274861, 0.4709657, 0, 1, 0.8313726, 1,
0.02795158, 0.445446, 1.183325, 0, 1, 0.8392157, 1,
0.03030704, 0.9987668, 0.4703496, 0, 1, 0.8431373, 1,
0.03035026, -0.04039713, 2.107159, 0, 1, 0.8509804, 1,
0.03311887, -1.873428, 1.898602, 0, 1, 0.854902, 1,
0.03534895, -1.451777, 2.902798, 0, 1, 0.8627451, 1,
0.03616404, -0.7078561, 3.703299, 0, 1, 0.8666667, 1,
0.03725446, 0.3100541, -0.7442338, 0, 1, 0.8745098, 1,
0.03859969, 0.7716571, -0.2741497, 0, 1, 0.8784314, 1,
0.04050889, -2.194484, 5.024106, 0, 1, 0.8862745, 1,
0.04399279, 0.4262265, 1.268038, 0, 1, 0.8901961, 1,
0.0443134, 1.18475, 0.2052452, 0, 1, 0.8980392, 1,
0.04611593, 1.086757, 2.570212, 0, 1, 0.9058824, 1,
0.04959099, 2.555364, 0.417774, 0, 1, 0.9098039, 1,
0.05294221, 0.04385331, -0.1950244, 0, 1, 0.9176471, 1,
0.05343203, -0.8143762, 3.056363, 0, 1, 0.9215686, 1,
0.06580102, -1.576905, 3.118562, 0, 1, 0.9294118, 1,
0.06874994, -0.5645226, 4.249365, 0, 1, 0.9333333, 1,
0.07396913, -0.2496759, 2.782616, 0, 1, 0.9411765, 1,
0.07416514, -0.7138958, 1.340868, 0, 1, 0.945098, 1,
0.07444394, 1.720475, 0.3419313, 0, 1, 0.9529412, 1,
0.07553269, -0.2148061, 2.512791, 0, 1, 0.9568627, 1,
0.07590621, 0.007752954, 1.161535, 0, 1, 0.9647059, 1,
0.07688376, 0.3269972, -0.3562003, 0, 1, 0.9686275, 1,
0.07816558, 1.619977, 0.9604032, 0, 1, 0.9764706, 1,
0.08085042, 0.7102093, -1.907411, 0, 1, 0.9803922, 1,
0.081173, -0.6809699, 3.349561, 0, 1, 0.9882353, 1,
0.08284863, 0.2417399, -0.7856594, 0, 1, 0.9921569, 1,
0.08551035, 1.469624, 1.113833, 0, 1, 1, 1,
0.08736891, -0.5614945, 3.358414, 0, 0.9921569, 1, 1,
0.08834276, 0.5274687, 2.401876, 0, 0.9882353, 1, 1,
0.1025691, -0.4318188, 3.317896, 0, 0.9803922, 1, 1,
0.1039856, 2.104204, 1.450319, 0, 0.9764706, 1, 1,
0.1044666, -0.5753284, 2.872475, 0, 0.9686275, 1, 1,
0.106839, -0.1518658, 2.128036, 0, 0.9647059, 1, 1,
0.1079634, 0.2509484, 2.125618, 0, 0.9568627, 1, 1,
0.109342, -1.452948, 1.538243, 0, 0.9529412, 1, 1,
0.1126622, -0.3199998, 2.460017, 0, 0.945098, 1, 1,
0.1139532, 2.177801, -1.547911, 0, 0.9411765, 1, 1,
0.1203137, -0.6789631, 4.02904, 0, 0.9333333, 1, 1,
0.1221716, -1.082978, 4.21496, 0, 0.9294118, 1, 1,
0.1229189, 0.2674104, -0.296139, 0, 0.9215686, 1, 1,
0.1261062, -0.273349, 0.967611, 0, 0.9176471, 1, 1,
0.1295269, 2.59323, -0.04325758, 0, 0.9098039, 1, 1,
0.1307173, -1.965298, 0.1550629, 0, 0.9058824, 1, 1,
0.1339321, 0.7243264, 0.1869594, 0, 0.8980392, 1, 1,
0.1361273, -0.3450045, 3.765903, 0, 0.8901961, 1, 1,
0.1373603, -0.1001156, 2.521261, 0, 0.8862745, 1, 1,
0.1374043, 1.184026, 0.3213081, 0, 0.8784314, 1, 1,
0.1386334, 1.237323, 0.5928514, 0, 0.8745098, 1, 1,
0.144449, 0.1924246, 1.156975, 0, 0.8666667, 1, 1,
0.1445591, 0.860104, 0.2220825, 0, 0.8627451, 1, 1,
0.146198, 0.8214231, -0.2157818, 0, 0.854902, 1, 1,
0.1465569, -0.9232447, 2.921688, 0, 0.8509804, 1, 1,
0.1531022, -0.08814839, 2.448496, 0, 0.8431373, 1, 1,
0.1565073, 0.7839538, -1.200698, 0, 0.8392157, 1, 1,
0.1585729, 1.027433, -1.300038, 0, 0.8313726, 1, 1,
0.1596834, -0.707019, 2.623995, 0, 0.827451, 1, 1,
0.1609179, -1.523873, 2.945522, 0, 0.8196079, 1, 1,
0.1634058, -0.137101, 2.931564, 0, 0.8156863, 1, 1,
0.1660188, 1.091251, -0.2416517, 0, 0.8078431, 1, 1,
0.1727461, 0.08424753, 2.604844, 0, 0.8039216, 1, 1,
0.1729912, -1.246031, 3.284137, 0, 0.7960784, 1, 1,
0.1732324, 0.7737438, 1.234829, 0, 0.7882353, 1, 1,
0.1733736, -1.173308, 3.355465, 0, 0.7843137, 1, 1,
0.1770806, 2.241073, 0.3287148, 0, 0.7764706, 1, 1,
0.1776102, 0.6779926, -0.7586466, 0, 0.772549, 1, 1,
0.1847462, 0.4025384, 0.2452668, 0, 0.7647059, 1, 1,
0.1898946, -0.4178977, 2.436643, 0, 0.7607843, 1, 1,
0.1907164, 0.7022408, 0.189757, 0, 0.7529412, 1, 1,
0.1911885, -0.2410414, 2.785932, 0, 0.7490196, 1, 1,
0.1929711, -0.1132464, 2.5769, 0, 0.7411765, 1, 1,
0.1935177, -0.6168811, 1.652106, 0, 0.7372549, 1, 1,
0.1980391, 0.5517536, 0.7803173, 0, 0.7294118, 1, 1,
0.2007888, 0.3786405, 2.784997, 0, 0.7254902, 1, 1,
0.2013569, 0.1531681, 1.28474, 0, 0.7176471, 1, 1,
0.2021152, -0.9006832, 2.773439, 0, 0.7137255, 1, 1,
0.2021714, -0.356844, 4.64145, 0, 0.7058824, 1, 1,
0.2031555, -1.187657, 3.563943, 0, 0.6980392, 1, 1,
0.2035989, 0.5794783, -0.9422821, 0, 0.6941177, 1, 1,
0.2067996, -2.23327, 2.842643, 0, 0.6862745, 1, 1,
0.2069554, -0.9272825, 0.9772205, 0, 0.682353, 1, 1,
0.2078888, -1.003478, 1.349959, 0, 0.6745098, 1, 1,
0.2078914, 0.94346, -1.300228, 0, 0.6705883, 1, 1,
0.2084556, -0.2239652, 3.863846, 0, 0.6627451, 1, 1,
0.2138134, 0.233653, 3.187415, 0, 0.6588235, 1, 1,
0.215478, 0.1815082, 0.8421693, 0, 0.6509804, 1, 1,
0.2181941, -1.556079, 1.813555, 0, 0.6470588, 1, 1,
0.2227447, 0.05948055, 2.206834, 0, 0.6392157, 1, 1,
0.2236088, 0.1692631, 1.407724, 0, 0.6352941, 1, 1,
0.2257198, 0.2801622, -1.436423, 0, 0.627451, 1, 1,
0.2268623, 0.2084569, 1.729999, 0, 0.6235294, 1, 1,
0.227924, 0.637732, -0.2674659, 0, 0.6156863, 1, 1,
0.2291617, -1.226617, 3.042322, 0, 0.6117647, 1, 1,
0.229994, -0.934949, 1.883404, 0, 0.6039216, 1, 1,
0.2343601, -1.418017, 1.006583, 0, 0.5960785, 1, 1,
0.2434412, -0.1380736, 3.063191, 0, 0.5921569, 1, 1,
0.2440119, -0.6874504, 5.090184, 0, 0.5843138, 1, 1,
0.2545161, -2.122697, 4.899182, 0, 0.5803922, 1, 1,
0.2554078, 2.167837, -0.221619, 0, 0.572549, 1, 1,
0.2559184, -0.4450458, 2.536035, 0, 0.5686275, 1, 1,
0.2584549, 0.09011983, 0.3349655, 0, 0.5607843, 1, 1,
0.2605299, 1.380428, -3.719867, 0, 0.5568628, 1, 1,
0.2673815, -0.9759241, 2.647398, 0, 0.5490196, 1, 1,
0.2679999, 0.6654985, 0.8075975, 0, 0.5450981, 1, 1,
0.2712609, -0.7860534, 3.73085, 0, 0.5372549, 1, 1,
0.278592, -1.806331, 4.078938, 0, 0.5333334, 1, 1,
0.2799956, -0.06395812, 3.589965, 0, 0.5254902, 1, 1,
0.2804013, 0.4584544, 0.6173002, 0, 0.5215687, 1, 1,
0.2813866, 0.5946516, 1.369572, 0, 0.5137255, 1, 1,
0.2857214, -0.63774, 1.992461, 0, 0.509804, 1, 1,
0.287785, 0.1426902, 0.6379891, 0, 0.5019608, 1, 1,
0.2909598, 1.066897, 0.4058606, 0, 0.4941176, 1, 1,
0.2922607, 0.2818015, 1.864255, 0, 0.4901961, 1, 1,
0.292968, -0.1206676, 4.058394, 0, 0.4823529, 1, 1,
0.2940108, -0.8589444, 4.394472, 0, 0.4784314, 1, 1,
0.2942445, -0.6497262, 4.374445, 0, 0.4705882, 1, 1,
0.2957414, 0.3300252, 2.158892, 0, 0.4666667, 1, 1,
0.2969493, 0.2412464, 2.648426, 0, 0.4588235, 1, 1,
0.2992784, 0.8449614, 0.8931177, 0, 0.454902, 1, 1,
0.3022349, -1.202795, 1.928089, 0, 0.4470588, 1, 1,
0.3051189, -0.7515035, 3.667051, 0, 0.4431373, 1, 1,
0.3077179, -2.00499, 2.223636, 0, 0.4352941, 1, 1,
0.3083431, -1.150144, 2.154937, 0, 0.4313726, 1, 1,
0.309085, -1.275424, 2.165424, 0, 0.4235294, 1, 1,
0.3110059, -0.007024777, 3.130263, 0, 0.4196078, 1, 1,
0.3120581, 0.7577096, 0.6526483, 0, 0.4117647, 1, 1,
0.3163269, -0.9367598, 2.695655, 0, 0.4078431, 1, 1,
0.3167985, 1.581647, -1.504424, 0, 0.4, 1, 1,
0.3192143, 2.099125, -1.642027, 0, 0.3921569, 1, 1,
0.3229782, -0.5369973, 2.255121, 0, 0.3882353, 1, 1,
0.3235148, -0.9137032, 4.619514, 0, 0.3803922, 1, 1,
0.3240606, 2.828211, 0.03328552, 0, 0.3764706, 1, 1,
0.332622, -0.3797512, 3.212531, 0, 0.3686275, 1, 1,
0.3338819, 0.4107546, 1.582092, 0, 0.3647059, 1, 1,
0.334188, -0.3736286, 2.462918, 0, 0.3568628, 1, 1,
0.3349781, 1.174054, -0.4601208, 0, 0.3529412, 1, 1,
0.3365502, 0.01218155, 2.072104, 0, 0.345098, 1, 1,
0.3397159, 0.1874585, 1.586164, 0, 0.3411765, 1, 1,
0.347859, 0.5262212, -1.220739, 0, 0.3333333, 1, 1,
0.3489815, -0.3208185, 1.615435, 0, 0.3294118, 1, 1,
0.3490443, 0.8577628, -0.7835953, 0, 0.3215686, 1, 1,
0.3512505, 0.06785931, 1.1384, 0, 0.3176471, 1, 1,
0.3524013, 1.139032, 1.035413, 0, 0.3098039, 1, 1,
0.3527603, 0.1964108, 1.226845, 0, 0.3058824, 1, 1,
0.3533272, 0.7485613, 0.8668078, 0, 0.2980392, 1, 1,
0.3596315, -0.5753511, 3.463552, 0, 0.2901961, 1, 1,
0.3600574, 0.2056725, 2.13249, 0, 0.2862745, 1, 1,
0.366228, -0.7721449, 4.381818, 0, 0.2784314, 1, 1,
0.3665965, -0.0576699, 3.119865, 0, 0.2745098, 1, 1,
0.3681956, -0.5825368, 1.879608, 0, 0.2666667, 1, 1,
0.3682165, 0.9539931, 0.3386475, 0, 0.2627451, 1, 1,
0.3721351, 0.8404627, 0.9224539, 0, 0.254902, 1, 1,
0.3733555, -0.5287708, 3.74736, 0, 0.2509804, 1, 1,
0.3800936, -0.1420485, 1.869074, 0, 0.2431373, 1, 1,
0.3833318, 0.7439899, 0.1077821, 0, 0.2392157, 1, 1,
0.3835661, 0.072276, 0.7229034, 0, 0.2313726, 1, 1,
0.3845504, -1.225979, 1.711165, 0, 0.227451, 1, 1,
0.3902873, -0.02145714, 0.5815794, 0, 0.2196078, 1, 1,
0.3942414, -0.3499012, 2.027829, 0, 0.2156863, 1, 1,
0.3955793, -0.6691604, 2.164123, 0, 0.2078431, 1, 1,
0.3983931, 0.437774, 0.8812712, 0, 0.2039216, 1, 1,
0.3991432, 1.275365, -1.283646, 0, 0.1960784, 1, 1,
0.4004491, -2.184709, 2.349605, 0, 0.1882353, 1, 1,
0.4083832, 0.3968433, 1.1955, 0, 0.1843137, 1, 1,
0.4107554, 0.6744438, 1.457111, 0, 0.1764706, 1, 1,
0.4107773, 1.110838, 1.843473, 0, 0.172549, 1, 1,
0.4179673, -1.460449, 3.214784, 0, 0.1647059, 1, 1,
0.418155, 1.597075, 1.16431, 0, 0.1607843, 1, 1,
0.4204981, 0.103494, 0.2673087, 0, 0.1529412, 1, 1,
0.4208339, -1.608931, 3.662515, 0, 0.1490196, 1, 1,
0.4222851, 0.3185632, 0.9179534, 0, 0.1411765, 1, 1,
0.4224857, -0.3293126, 1.358089, 0, 0.1372549, 1, 1,
0.4241472, 1.176932, 0.4664195, 0, 0.1294118, 1, 1,
0.4247903, 0.2086676, 0.9471554, 0, 0.1254902, 1, 1,
0.4256975, -0.3709565, 2.145894, 0, 0.1176471, 1, 1,
0.4270633, 0.7958061, 2.163614, 0, 0.1137255, 1, 1,
0.4288479, -0.2803282, 2.870242, 0, 0.1058824, 1, 1,
0.4307911, -0.9361769, 2.809727, 0, 0.09803922, 1, 1,
0.4315732, 0.4990344, 0.3537456, 0, 0.09411765, 1, 1,
0.4341708, -0.6136498, 3.712695, 0, 0.08627451, 1, 1,
0.4389738, -1.298041, 2.467969, 0, 0.08235294, 1, 1,
0.4417344, -0.6321775, 1.174955, 0, 0.07450981, 1, 1,
0.4417553, 2.892661, 0.4233307, 0, 0.07058824, 1, 1,
0.4421259, -0.00514812, 1.060402, 0, 0.0627451, 1, 1,
0.4444422, 0.4478922, -0.981031, 0, 0.05882353, 1, 1,
0.4478374, 1.505473, 0.2156976, 0, 0.05098039, 1, 1,
0.4591926, 1.361379, 0.2611681, 0, 0.04705882, 1, 1,
0.4592598, -0.4293279, 4.906722, 0, 0.03921569, 1, 1,
0.4634072, -1.123691, 2.139733, 0, 0.03529412, 1, 1,
0.4643021, 1.073897, 0.3256856, 0, 0.02745098, 1, 1,
0.4654494, 0.2620051, 0.9085829, 0, 0.02352941, 1, 1,
0.4660078, -0.2073964, 0.3408671, 0, 0.01568628, 1, 1,
0.4740302, -0.924587, 2.359313, 0, 0.01176471, 1, 1,
0.4748152, -0.4216653, 2.02276, 0, 0.003921569, 1, 1,
0.4814025, -0.580403, 1.907785, 0.003921569, 0, 1, 1,
0.4836816, -0.4184973, 3.140465, 0.007843138, 0, 1, 1,
0.4837163, 0.6539652, 1.964903, 0.01568628, 0, 1, 1,
0.4851432, -0.1290464, 0.463159, 0.01960784, 0, 1, 1,
0.485245, -1.004776, 2.526332, 0.02745098, 0, 1, 1,
0.4857011, -0.3689941, 2.344253, 0.03137255, 0, 1, 1,
0.4881961, 1.289355, 0.8932941, 0.03921569, 0, 1, 1,
0.4957498, -0.1008272, 0.3958682, 0.04313726, 0, 1, 1,
0.4984593, -0.1205539, 1.950441, 0.05098039, 0, 1, 1,
0.4992357, -0.1882649, 0.5234948, 0.05490196, 0, 1, 1,
0.5016887, -0.3652363, 2.391711, 0.0627451, 0, 1, 1,
0.5020806, -0.2261829, 0.6171852, 0.06666667, 0, 1, 1,
0.502682, -0.3748337, 0.4109381, 0.07450981, 0, 1, 1,
0.5176104, -0.4844842, 2.370757, 0.07843138, 0, 1, 1,
0.5182047, -0.374571, 3.343886, 0.08627451, 0, 1, 1,
0.5188201, 0.4849795, 0.02269815, 0.09019608, 0, 1, 1,
0.5189154, 1.499025, -0.2015978, 0.09803922, 0, 1, 1,
0.5335305, 3.426535, 0.2514234, 0.1058824, 0, 1, 1,
0.5351149, 0.6979091, -0.1219578, 0.1098039, 0, 1, 1,
0.5355532, -1.604942, 1.383618, 0.1176471, 0, 1, 1,
0.5366453, -0.4093417, 2.781805, 0.1215686, 0, 1, 1,
0.5392648, 0.126605, 1.502547, 0.1294118, 0, 1, 1,
0.5412087, 0.2104266, 1.77616, 0.1333333, 0, 1, 1,
0.5432561, -0.2013762, 2.934156, 0.1411765, 0, 1, 1,
0.5477442, -1.410502, 3.015424, 0.145098, 0, 1, 1,
0.5530195, 0.9386701, -0.2957258, 0.1529412, 0, 1, 1,
0.5595313, 0.09043147, 0.5414693, 0.1568628, 0, 1, 1,
0.5611256, -0.05890068, 0.958647, 0.1647059, 0, 1, 1,
0.5655255, -1.425371, 4.325743, 0.1686275, 0, 1, 1,
0.5657684, 0.0961052, -0.6814494, 0.1764706, 0, 1, 1,
0.56581, -0.9581817, 2.579824, 0.1803922, 0, 1, 1,
0.5661874, 2.007325, 0.3012924, 0.1882353, 0, 1, 1,
0.5688584, -0.7365474, 2.140675, 0.1921569, 0, 1, 1,
0.5737159, -0.3500605, 1.779818, 0.2, 0, 1, 1,
0.577068, -0.565078, 0.4844771, 0.2078431, 0, 1, 1,
0.5814573, 0.4435931, 2.482439, 0.2117647, 0, 1, 1,
0.5815977, -1.632511, 3.253323, 0.2196078, 0, 1, 1,
0.5834829, 0.1197743, 2.82037, 0.2235294, 0, 1, 1,
0.5842814, 0.9255233, -0.05064997, 0.2313726, 0, 1, 1,
0.5966778, 0.4271273, 2.000717, 0.2352941, 0, 1, 1,
0.5993097, -0.03008659, 1.317117, 0.2431373, 0, 1, 1,
0.6013193, -1.430713, 3.921124, 0.2470588, 0, 1, 1,
0.606592, 0.664041, 0.7679391, 0.254902, 0, 1, 1,
0.6077558, -1.082729, 2.341426, 0.2588235, 0, 1, 1,
0.6083848, 0.01515844, 1.129499, 0.2666667, 0, 1, 1,
0.6127102, -0.6660471, 1.352908, 0.2705882, 0, 1, 1,
0.6172029, -0.234439, 2.758223, 0.2784314, 0, 1, 1,
0.6185026, 1.26125, 1.160292, 0.282353, 0, 1, 1,
0.6311869, 2.653064, 2.190281, 0.2901961, 0, 1, 1,
0.633482, -1.380978, 2.60653, 0.2941177, 0, 1, 1,
0.6349307, 0.3507504, 0.2395174, 0.3019608, 0, 1, 1,
0.6353403, 0.1663, 1.528764, 0.3098039, 0, 1, 1,
0.6392081, -0.2323933, -0.6975749, 0.3137255, 0, 1, 1,
0.6427845, -1.085351, 1.462591, 0.3215686, 0, 1, 1,
0.6438136, 0.5001706, 0.078674, 0.3254902, 0, 1, 1,
0.6475087, -1.223715, 2.967819, 0.3333333, 0, 1, 1,
0.6488412, -0.2154455, 1.366361, 0.3372549, 0, 1, 1,
0.6528858, 4.160759, 0.04884972, 0.345098, 0, 1, 1,
0.6563215, -0.6274773, 2.010088, 0.3490196, 0, 1, 1,
0.6615269, -0.5887006, 1.604499, 0.3568628, 0, 1, 1,
0.6624951, 0.7058827, 1.104275, 0.3607843, 0, 1, 1,
0.6657056, -0.5021107, 2.839252, 0.3686275, 0, 1, 1,
0.6679155, 0.7239354, 0.695633, 0.372549, 0, 1, 1,
0.6693066, 0.2655572, 1.049269, 0.3803922, 0, 1, 1,
0.6696557, 0.0001415224, 2.9268, 0.3843137, 0, 1, 1,
0.6699067, 0.4179063, 1.308272, 0.3921569, 0, 1, 1,
0.6754432, -0.2965367, 2.302595, 0.3960784, 0, 1, 1,
0.6788875, -1.830842, 1.374939, 0.4039216, 0, 1, 1,
0.6802241, -1.173144, 3.897581, 0.4117647, 0, 1, 1,
0.681367, -0.01102953, 1.603591, 0.4156863, 0, 1, 1,
0.6845286, -0.1429611, 3.499519, 0.4235294, 0, 1, 1,
0.6883737, -1.154254, 2.945687, 0.427451, 0, 1, 1,
0.6916075, -0.7444731, 2.402514, 0.4352941, 0, 1, 1,
0.7023011, 1.528057, -0.8138406, 0.4392157, 0, 1, 1,
0.7073042, 0.01266566, 2.554693, 0.4470588, 0, 1, 1,
0.709256, 0.2615622, 1.86493, 0.4509804, 0, 1, 1,
0.7147146, -1.450001, 2.437808, 0.4588235, 0, 1, 1,
0.7168735, 1.230649, 1.241158, 0.4627451, 0, 1, 1,
0.7188335, -1.044299, 3.260362, 0.4705882, 0, 1, 1,
0.7204366, -0.4696627, 2.283552, 0.4745098, 0, 1, 1,
0.7242667, 0.3036227, 1.498984, 0.4823529, 0, 1, 1,
0.7257264, 0.5988793, 0.9802216, 0.4862745, 0, 1, 1,
0.7263399, -1.804639, 1.502275, 0.4941176, 0, 1, 1,
0.7329646, 1.831846, 0.8942503, 0.5019608, 0, 1, 1,
0.7339512, 1.240354, 0.5106755, 0.5058824, 0, 1, 1,
0.7344697, -1.296212, 2.968503, 0.5137255, 0, 1, 1,
0.7346911, -0.7256427, 2.298274, 0.5176471, 0, 1, 1,
0.738108, -0.3102646, 1.651852, 0.5254902, 0, 1, 1,
0.74116, 0.9930788, 0.4791967, 0.5294118, 0, 1, 1,
0.7425397, -0.5532617, 1.797449, 0.5372549, 0, 1, 1,
0.7432311, -0.02216478, 2.713209, 0.5411765, 0, 1, 1,
0.7447163, -1.2016, 2.228726, 0.5490196, 0, 1, 1,
0.745889, 0.01402698, 1.2555, 0.5529412, 0, 1, 1,
0.757421, -0.5214189, 1.447962, 0.5607843, 0, 1, 1,
0.7606474, -1.146904, 3.616258, 0.5647059, 0, 1, 1,
0.7684283, -0.002071568, 1.928672, 0.572549, 0, 1, 1,
0.7718282, -0.4131522, 2.257481, 0.5764706, 0, 1, 1,
0.775728, 1.371406, 2.031527, 0.5843138, 0, 1, 1,
0.7760564, -0.5376769, 2.586637, 0.5882353, 0, 1, 1,
0.7819139, 0.4746476, 1.160925, 0.5960785, 0, 1, 1,
0.7858154, 1.912704, 2.202096, 0.6039216, 0, 1, 1,
0.7927759, 0.8345271, -0.2072176, 0.6078432, 0, 1, 1,
0.7959189, -0.4082253, 2.242981, 0.6156863, 0, 1, 1,
0.7988877, -0.5204415, 2.611801, 0.6196079, 0, 1, 1,
0.802875, -0.03284751, 0.9201907, 0.627451, 0, 1, 1,
0.8034869, -0.01747229, 2.026998, 0.6313726, 0, 1, 1,
0.8038461, -0.9977427, 2.194634, 0.6392157, 0, 1, 1,
0.8076278, -0.2489368, 0.9763838, 0.6431373, 0, 1, 1,
0.809826, -0.06026468, 2.918479, 0.6509804, 0, 1, 1,
0.814307, 1.142996, 0.6959565, 0.654902, 0, 1, 1,
0.8148315, -1.284141, 3.412387, 0.6627451, 0, 1, 1,
0.8148344, -0.3465259, 1.835647, 0.6666667, 0, 1, 1,
0.819027, -0.5825642, 2.576946, 0.6745098, 0, 1, 1,
0.8240573, 0.3105134, 1.417456, 0.6784314, 0, 1, 1,
0.8317879, -0.05586164, 1.100036, 0.6862745, 0, 1, 1,
0.8339247, 0.1502866, 0.915998, 0.6901961, 0, 1, 1,
0.8441192, -0.7015366, 1.233825, 0.6980392, 0, 1, 1,
0.8498082, 0.6114407, -0.204551, 0.7058824, 0, 1, 1,
0.8506446, -0.4708799, 2.560515, 0.7098039, 0, 1, 1,
0.8549094, -0.7745801, 1.342909, 0.7176471, 0, 1, 1,
0.8577099, 0.894136, 1.065723, 0.7215686, 0, 1, 1,
0.8595644, 1.057604, -1.184313, 0.7294118, 0, 1, 1,
0.8597655, 0.6092218, 1.785252, 0.7333333, 0, 1, 1,
0.8624388, 0.4377698, 1.181945, 0.7411765, 0, 1, 1,
0.8692945, 0.001441026, 2.993155, 0.7450981, 0, 1, 1,
0.8760827, -0.2872519, 2.054556, 0.7529412, 0, 1, 1,
0.878733, -0.3547964, 1.66381, 0.7568628, 0, 1, 1,
0.8797746, 0.08465746, 0.9176922, 0.7647059, 0, 1, 1,
0.8887959, -1.125293, 2.904001, 0.7686275, 0, 1, 1,
0.8906512, -0.3090805, 1.561953, 0.7764706, 0, 1, 1,
0.8924176, 0.04704867, 1.19554, 0.7803922, 0, 1, 1,
0.8945112, 0.3683166, 2.074529, 0.7882353, 0, 1, 1,
0.8960015, -0.02317832, -0.3225381, 0.7921569, 0, 1, 1,
0.8982633, -1.496273, 1.918163, 0.8, 0, 1, 1,
0.9002635, 0.4392076, 1.175121, 0.8078431, 0, 1, 1,
0.901268, -1.816398, 5.04381, 0.8117647, 0, 1, 1,
0.9063483, 0.9870743, 1.254853, 0.8196079, 0, 1, 1,
0.9072062, 0.2386, 1.804667, 0.8235294, 0, 1, 1,
0.9111514, 2.374541, -0.6228374, 0.8313726, 0, 1, 1,
0.9124034, -0.515632, 2.399775, 0.8352941, 0, 1, 1,
0.915066, -2.069737, 2.50624, 0.8431373, 0, 1, 1,
0.918067, -0.8140351, 2.591511, 0.8470588, 0, 1, 1,
0.9194419, 1.145264, 0.7608784, 0.854902, 0, 1, 1,
0.9217177, 0.8619527, -0.3521625, 0.8588235, 0, 1, 1,
0.9232643, 0.6611861, 0.4587086, 0.8666667, 0, 1, 1,
0.9275997, -0.2231291, 1.160305, 0.8705882, 0, 1, 1,
0.9277002, -0.1285033, 2.415201, 0.8784314, 0, 1, 1,
0.9317587, 0.3737401, -0.8219573, 0.8823529, 0, 1, 1,
0.9347801, 1.47277, 1.597379, 0.8901961, 0, 1, 1,
0.9386988, 0.2205422, 0.9992666, 0.8941177, 0, 1, 1,
0.9405855, -1.5858, 4.050973, 0.9019608, 0, 1, 1,
0.9410909, 1.400594, 0.09709415, 0.9098039, 0, 1, 1,
0.9443653, 1.063538, 1.349099, 0.9137255, 0, 1, 1,
0.9492527, 1.185999, 1.016932, 0.9215686, 0, 1, 1,
0.9575223, 1.416314, 0.2553434, 0.9254902, 0, 1, 1,
0.9645952, 0.3298427, 2.772064, 0.9333333, 0, 1, 1,
0.9665643, 0.6765859, 1.064551, 0.9372549, 0, 1, 1,
0.9683097, 2.420125, 0.02001168, 0.945098, 0, 1, 1,
0.9698754, -0.09776402, 2.606185, 0.9490196, 0, 1, 1,
0.9737827, 0.2044887, 2.639382, 0.9568627, 0, 1, 1,
0.9799869, -0.1004886, 2.950578, 0.9607843, 0, 1, 1,
0.9813775, 0.2599734, 3.11427, 0.9686275, 0, 1, 1,
0.9912763, 1.543593, 1.510838, 0.972549, 0, 1, 1,
0.9988531, 0.5959474, 1.618101, 0.9803922, 0, 1, 1,
1.000761, -0.1393555, -0.1119081, 0.9843137, 0, 1, 1,
1.000841, -0.1714702, 1.181291, 0.9921569, 0, 1, 1,
1.010087, -0.2511133, 2.718473, 0.9960784, 0, 1, 1,
1.013804, -0.560142, 2.245999, 1, 0, 0.9960784, 1,
1.018956, -0.7345756, 2.676468, 1, 0, 0.9882353, 1,
1.028907, -0.5988567, 3.263151, 1, 0, 0.9843137, 1,
1.028993, 1.765671, -0.2682467, 1, 0, 0.9764706, 1,
1.029176, 0.233115, 2.315736, 1, 0, 0.972549, 1,
1.032187, 0.1507043, 0.9610756, 1, 0, 0.9647059, 1,
1.032863, -0.2031874, -0.1142685, 1, 0, 0.9607843, 1,
1.038184, 0.3610438, 1.896672, 1, 0, 0.9529412, 1,
1.045004, -0.4687559, 0.3692556, 1, 0, 0.9490196, 1,
1.049426, 2.40189, 1.212747, 1, 0, 0.9411765, 1,
1.0501, 1.773218, 0.8024351, 1, 0, 0.9372549, 1,
1.053608, 0.7125083, -0.5230508, 1, 0, 0.9294118, 1,
1.066014, -1.237675, 2.151199, 1, 0, 0.9254902, 1,
1.067428, -0.2004611, 2.080778, 1, 0, 0.9176471, 1,
1.069168, 0.4713047, 2.08127, 1, 0, 0.9137255, 1,
1.069696, 0.02823093, 1.322912, 1, 0, 0.9058824, 1,
1.086489, -0.3063017, 2.829768, 1, 0, 0.9019608, 1,
1.090869, -0.4132312, 2.071198, 1, 0, 0.8941177, 1,
1.09447, -0.3557382, 1.737994, 1, 0, 0.8862745, 1,
1.095188, -1.075945, 2.868674, 1, 0, 0.8823529, 1,
1.099917, -2.326608, 1.938178, 1, 0, 0.8745098, 1,
1.100329, -0.5327932, 3.182299, 1, 0, 0.8705882, 1,
1.111771, -0.95841, 2.750377, 1, 0, 0.8627451, 1,
1.118943, -0.7336586, 2.829004, 1, 0, 0.8588235, 1,
1.123496, 0.5398017, 1.395021, 1, 0, 0.8509804, 1,
1.136971, -0.08178248, 0.7205217, 1, 0, 0.8470588, 1,
1.140698, 0.07765475, 0.5789449, 1, 0, 0.8392157, 1,
1.144532, -0.879575, 2.215038, 1, 0, 0.8352941, 1,
1.144908, 0.1771749, 1.100188, 1, 0, 0.827451, 1,
1.149671, -0.7342342, 0.7866724, 1, 0, 0.8235294, 1,
1.150018, -0.07177367, 1.329316, 1, 0, 0.8156863, 1,
1.156906, -0.2168428, 1.164945, 1, 0, 0.8117647, 1,
1.162541, 0.267274, -0.9334933, 1, 0, 0.8039216, 1,
1.163581, 0.6027048, 0.7726616, 1, 0, 0.7960784, 1,
1.166439, -1.577324, 3.268876, 1, 0, 0.7921569, 1,
1.166735, -1.626639, 1.733459, 1, 0, 0.7843137, 1,
1.168109, 1.333959, 1.747821, 1, 0, 0.7803922, 1,
1.169421, 0.7980554, 1.056695, 1, 0, 0.772549, 1,
1.172325, -1.226215, 1.394273, 1, 0, 0.7686275, 1,
1.182011, 1.23109, 1.234557, 1, 0, 0.7607843, 1,
1.203913, 1.36937, -1.258848, 1, 0, 0.7568628, 1,
1.206321, 0.1126623, 0.7579545, 1, 0, 0.7490196, 1,
1.207443, 0.6162027, 0.2189737, 1, 0, 0.7450981, 1,
1.208672, -0.2835046, 0.2443669, 1, 0, 0.7372549, 1,
1.212691, -1.055047, 2.587669, 1, 0, 0.7333333, 1,
1.215356, -0.08253247, 1.159457, 1, 0, 0.7254902, 1,
1.215362, 0.1283804, 1.904569, 1, 0, 0.7215686, 1,
1.230306, -2.451002, 3.391258, 1, 0, 0.7137255, 1,
1.23724, -0.2539581, 1.460978, 1, 0, 0.7098039, 1,
1.239189, -1.55287, 2.607004, 1, 0, 0.7019608, 1,
1.242983, 0.7963579, -0.1848815, 1, 0, 0.6941177, 1,
1.243539, 0.518028, 1.522495, 1, 0, 0.6901961, 1,
1.249321, 0.005101529, -0.2995149, 1, 0, 0.682353, 1,
1.25936, -0.3047494, 4.391744, 1, 0, 0.6784314, 1,
1.27389, -0.07229325, 1.392587, 1, 0, 0.6705883, 1,
1.274176, 1.982197, -1.389159, 1, 0, 0.6666667, 1,
1.282679, 0.6041164, 0.6663333, 1, 0, 0.6588235, 1,
1.290075, 1.714472, 0.7281004, 1, 0, 0.654902, 1,
1.29457, 0.9300473, 0.3195688, 1, 0, 0.6470588, 1,
1.299644, -1.547314, 3.476519, 1, 0, 0.6431373, 1,
1.300013, -1.044767, 2.681005, 1, 0, 0.6352941, 1,
1.308951, -0.1452491, 1.269723, 1, 0, 0.6313726, 1,
1.318411, 0.364104, 2.171927, 1, 0, 0.6235294, 1,
1.324634, 1.041386, 1.370229, 1, 0, 0.6196079, 1,
1.351125, 1.146518, -0.8453002, 1, 0, 0.6117647, 1,
1.353231, 1.045914, 1.229872, 1, 0, 0.6078432, 1,
1.354075, 1.515809, -0.9025409, 1, 0, 0.6, 1,
1.358555, -0.6585422, 3.740428, 1, 0, 0.5921569, 1,
1.373077, -1.022155, 1.619715, 1, 0, 0.5882353, 1,
1.373505, 0.4701873, 3.846664, 1, 0, 0.5803922, 1,
1.374352, 1.315531, -0.2294707, 1, 0, 0.5764706, 1,
1.375608, 0.05294975, -1.022351, 1, 0, 0.5686275, 1,
1.394268, 2.277347, -0.3138145, 1, 0, 0.5647059, 1,
1.403363, 0.791585, -0.08561485, 1, 0, 0.5568628, 1,
1.40672, -0.5544516, 3.791592, 1, 0, 0.5529412, 1,
1.409735, -0.1644164, 2.482327, 1, 0, 0.5450981, 1,
1.414234, 0.5629747, 1.362632, 1, 0, 0.5411765, 1,
1.427942, 0.4999257, 0.9137718, 1, 0, 0.5333334, 1,
1.432278, 2.150954, 2.292, 1, 0, 0.5294118, 1,
1.433266, -0.05184241, 0.8997236, 1, 0, 0.5215687, 1,
1.441855, 0.05848997, 2.238624, 1, 0, 0.5176471, 1,
1.445424, 1.444745, -1.577043, 1, 0, 0.509804, 1,
1.453145, -1.14803, 2.855519, 1, 0, 0.5058824, 1,
1.454302, 0.6050577, 1.609891, 1, 0, 0.4980392, 1,
1.454854, -1.351755, 2.483674, 1, 0, 0.4901961, 1,
1.457755, -0.3009637, 1.527946, 1, 0, 0.4862745, 1,
1.461827, -1.996492, 2.814514, 1, 0, 0.4784314, 1,
1.463795, -2.318709, 2.423677, 1, 0, 0.4745098, 1,
1.484593, 1.199434, 0.6683933, 1, 0, 0.4666667, 1,
1.496039, -0.9039423, 1.628634, 1, 0, 0.4627451, 1,
1.498693, 0.7827432, 1.933718, 1, 0, 0.454902, 1,
1.501818, 0.2179281, 0.95621, 1, 0, 0.4509804, 1,
1.509178, 0.5697538, 0.3704339, 1, 0, 0.4431373, 1,
1.518307, -0.4161461, 1.21458, 1, 0, 0.4392157, 1,
1.530279, -0.3348892, 1.581473, 1, 0, 0.4313726, 1,
1.532311, 0.3821768, 0.8937329, 1, 0, 0.427451, 1,
1.543357, 1.844102, 2.594435, 1, 0, 0.4196078, 1,
1.54589, -0.8882312, 0.9142204, 1, 0, 0.4156863, 1,
1.547212, 0.169623, 2.961672, 1, 0, 0.4078431, 1,
1.560003, -0.7776363, 2.419493, 1, 0, 0.4039216, 1,
1.570908, 0.3515553, -0.1477048, 1, 0, 0.3960784, 1,
1.571567, -1.412088, 2.730405, 1, 0, 0.3882353, 1,
1.575689, -0.309373, 0.5322108, 1, 0, 0.3843137, 1,
1.588576, 1.595437, 0.2566468, 1, 0, 0.3764706, 1,
1.609112, 0.6532907, 1.823951, 1, 0, 0.372549, 1,
1.616279, 0.9252839, 0.5423825, 1, 0, 0.3647059, 1,
1.618096, 0.1738485, 0.6055541, 1, 0, 0.3607843, 1,
1.622972, -0.7640449, 3.250289, 1, 0, 0.3529412, 1,
1.624486, 1.62162, 0.9492768, 1, 0, 0.3490196, 1,
1.624834, 0.4367612, 0.4224764, 1, 0, 0.3411765, 1,
1.625172, -0.688584, 2.018751, 1, 0, 0.3372549, 1,
1.63076, -0.6449071, 2.719581, 1, 0, 0.3294118, 1,
1.636326, 0.3522641, 1.709064, 1, 0, 0.3254902, 1,
1.648112, -1.524163, 2.68847, 1, 0, 0.3176471, 1,
1.657842, 0.4107077, 1.056535, 1, 0, 0.3137255, 1,
1.667637, -0.3367747, 1.057468, 1, 0, 0.3058824, 1,
1.673583, -1.761387, 1.996358, 1, 0, 0.2980392, 1,
1.67875, -0.1099211, 2.458035, 1, 0, 0.2941177, 1,
1.681757, -0.5826961, 0.6103166, 1, 0, 0.2862745, 1,
1.682886, -0.7708019, 1.887019, 1, 0, 0.282353, 1,
1.689833, -1.449332, 0.6790726, 1, 0, 0.2745098, 1,
1.696469, 2.386316, 1.482028, 1, 0, 0.2705882, 1,
1.72987, 1.817048, 0.09294026, 1, 0, 0.2627451, 1,
1.730471, 0.8864774, -0.4321396, 1, 0, 0.2588235, 1,
1.734259, -0.8165921, 3.948578, 1, 0, 0.2509804, 1,
1.744012, 1.209869, 1.044468, 1, 0, 0.2470588, 1,
1.756202, 0.3582835, -1.123038, 1, 0, 0.2392157, 1,
1.76274, 1.655155, 0.4849131, 1, 0, 0.2352941, 1,
1.76759, -0.3059451, 1.420799, 1, 0, 0.227451, 1,
1.775502, 1.018578, 0.9230103, 1, 0, 0.2235294, 1,
1.776636, -0.781679, 0.726805, 1, 0, 0.2156863, 1,
1.776704, -0.4777142, 2.161811, 1, 0, 0.2117647, 1,
1.798154, -1.498116, 1.480552, 1, 0, 0.2039216, 1,
1.823027, 1.167627, 2.022535, 1, 0, 0.1960784, 1,
1.823654, -0.09040406, 1.918352, 1, 0, 0.1921569, 1,
1.826917, -0.5082957, 2.574462, 1, 0, 0.1843137, 1,
1.835892, 0.2559175, 1.511964, 1, 0, 0.1803922, 1,
1.85205, 1.358797, 1.020397, 1, 0, 0.172549, 1,
1.855549, -1.206114, 0.8616412, 1, 0, 0.1686275, 1,
1.872748, -1.492235, 1.767971, 1, 0, 0.1607843, 1,
1.921173, 0.4421976, 2.404837, 1, 0, 0.1568628, 1,
1.925045, 0.05389223, 0.4381629, 1, 0, 0.1490196, 1,
1.959673, -1.381805, 1.885941, 1, 0, 0.145098, 1,
1.97028, 0.1362849, 0.3981192, 1, 0, 0.1372549, 1,
1.979443, 0.8002654, 0.498751, 1, 0, 0.1333333, 1,
1.9888, -1.395276, 2.716767, 1, 0, 0.1254902, 1,
2.017909, 0.892029, -0.3799443, 1, 0, 0.1215686, 1,
2.019218, 0.5348201, 2.369739, 1, 0, 0.1137255, 1,
2.025424, -0.7792648, 3.380255, 1, 0, 0.1098039, 1,
2.049963, 0.6195827, 0.9055579, 1, 0, 0.1019608, 1,
2.061935, 0.4014351, 0.7516146, 1, 0, 0.09411765, 1,
2.064857, -0.3898327, 3.246226, 1, 0, 0.09019608, 1,
2.075181, -1.287526, 1.745304, 1, 0, 0.08235294, 1,
2.17021, -1.005161, 0.9391006, 1, 0, 0.07843138, 1,
2.184176, 1.293013, 0.6699964, 1, 0, 0.07058824, 1,
2.203555, -0.1259869, 4.184553, 1, 0, 0.06666667, 1,
2.245233, 1.594028, 2.74265, 1, 0, 0.05882353, 1,
2.296873, -0.2319878, 1.71258, 1, 0, 0.05490196, 1,
2.321916, 1.221286, 0.2127145, 1, 0, 0.04705882, 1,
2.370173, -0.05111614, 2.084723, 1, 0, 0.04313726, 1,
2.382633, -0.109426, 1.59132, 1, 0, 0.03529412, 1,
2.566427, -2.034622, 3.520172, 1, 0, 0.03137255, 1,
2.587478, -0.3121943, -0.2682421, 1, 0, 0.02352941, 1,
2.711761, 0.9741225, 3.521571, 1, 0, 0.01960784, 1,
2.741375, 0.166746, 0.4618914, 1, 0, 0.01176471, 1,
2.950614, 0.8892322, 0.005300498, 1, 0, 0.007843138, 1
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
0.006035805, -4.381336, -7.428251, 0, -0.5, 0.5, 0.5,
0.006035805, -4.381336, -7.428251, 1, -0.5, 0.5, 0.5,
0.006035805, -4.381336, -7.428251, 1, 1.5, 0.5, 0.5,
0.006035805, -4.381336, -7.428251, 0, 1.5, 0.5, 0.5
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
-3.936754, 0.5087304, -7.428251, 0, -0.5, 0.5, 0.5,
-3.936754, 0.5087304, -7.428251, 1, -0.5, 0.5, 0.5,
-3.936754, 0.5087304, -7.428251, 1, 1.5, 0.5, 0.5,
-3.936754, 0.5087304, -7.428251, 0, 1.5, 0.5, 0.5
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
-3.936754, -4.381336, -0.06675506, 0, -0.5, 0.5, 0.5,
-3.936754, -4.381336, -0.06675506, 1, -0.5, 0.5, 0.5,
-3.936754, -4.381336, -0.06675506, 1, 1.5, 0.5, 0.5,
-3.936754, -4.381336, -0.06675506, 0, 1.5, 0.5, 0.5
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
-2, -3.252859, -5.729445,
2, -3.252859, -5.729445,
-2, -3.252859, -5.729445,
-2, -3.440938, -6.012579,
-1, -3.252859, -5.729445,
-1, -3.440938, -6.012579,
0, -3.252859, -5.729445,
0, -3.440938, -6.012579,
1, -3.252859, -5.729445,
1, -3.440938, -6.012579,
2, -3.252859, -5.729445,
2, -3.440938, -6.012579
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
-2, -3.817097, -6.578848, 0, -0.5, 0.5, 0.5,
-2, -3.817097, -6.578848, 1, -0.5, 0.5, 0.5,
-2, -3.817097, -6.578848, 1, 1.5, 0.5, 0.5,
-2, -3.817097, -6.578848, 0, 1.5, 0.5, 0.5,
-1, -3.817097, -6.578848, 0, -0.5, 0.5, 0.5,
-1, -3.817097, -6.578848, 1, -0.5, 0.5, 0.5,
-1, -3.817097, -6.578848, 1, 1.5, 0.5, 0.5,
-1, -3.817097, -6.578848, 0, 1.5, 0.5, 0.5,
0, -3.817097, -6.578848, 0, -0.5, 0.5, 0.5,
0, -3.817097, -6.578848, 1, -0.5, 0.5, 0.5,
0, -3.817097, -6.578848, 1, 1.5, 0.5, 0.5,
0, -3.817097, -6.578848, 0, 1.5, 0.5, 0.5,
1, -3.817097, -6.578848, 0, -0.5, 0.5, 0.5,
1, -3.817097, -6.578848, 1, -0.5, 0.5, 0.5,
1, -3.817097, -6.578848, 1, 1.5, 0.5, 0.5,
1, -3.817097, -6.578848, 0, 1.5, 0.5, 0.5,
2, -3.817097, -6.578848, 0, -0.5, 0.5, 0.5,
2, -3.817097, -6.578848, 1, -0.5, 0.5, 0.5,
2, -3.817097, -6.578848, 1, 1.5, 0.5, 0.5,
2, -3.817097, -6.578848, 0, 1.5, 0.5, 0.5
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
-3.02688, -2, -5.729445,
-3.02688, 4, -5.729445,
-3.02688, -2, -5.729445,
-3.178525, -2, -6.012579,
-3.02688, 0, -5.729445,
-3.178525, 0, -6.012579,
-3.02688, 2, -5.729445,
-3.178525, 2, -6.012579,
-3.02688, 4, -5.729445,
-3.178525, 4, -6.012579
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
"2",
"4"
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
-3.481817, -2, -6.578848, 0, -0.5, 0.5, 0.5,
-3.481817, -2, -6.578848, 1, -0.5, 0.5, 0.5,
-3.481817, -2, -6.578848, 1, 1.5, 0.5, 0.5,
-3.481817, -2, -6.578848, 0, 1.5, 0.5, 0.5,
-3.481817, 0, -6.578848, 0, -0.5, 0.5, 0.5,
-3.481817, 0, -6.578848, 1, -0.5, 0.5, 0.5,
-3.481817, 0, -6.578848, 1, 1.5, 0.5, 0.5,
-3.481817, 0, -6.578848, 0, 1.5, 0.5, 0.5,
-3.481817, 2, -6.578848, 0, -0.5, 0.5, 0.5,
-3.481817, 2, -6.578848, 1, -0.5, 0.5, 0.5,
-3.481817, 2, -6.578848, 1, 1.5, 0.5, 0.5,
-3.481817, 2, -6.578848, 0, 1.5, 0.5, 0.5,
-3.481817, 4, -6.578848, 0, -0.5, 0.5, 0.5,
-3.481817, 4, -6.578848, 1, -0.5, 0.5, 0.5,
-3.481817, 4, -6.578848, 1, 1.5, 0.5, 0.5,
-3.481817, 4, -6.578848, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.02688, -3.252859, -4,
-3.02688, -3.252859, 4,
-3.02688, -3.252859, -4,
-3.178525, -3.440938, -4,
-3.02688, -3.252859, -2,
-3.178525, -3.440938, -2,
-3.02688, -3.252859, 0,
-3.178525, -3.440938, 0,
-3.02688, -3.252859, 2,
-3.178525, -3.440938, 2,
-3.02688, -3.252859, 4,
-3.178525, -3.440938, 4
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
-3.481817, -3.817097, -4, 0, -0.5, 0.5, 0.5,
-3.481817, -3.817097, -4, 1, -0.5, 0.5, 0.5,
-3.481817, -3.817097, -4, 1, 1.5, 0.5, 0.5,
-3.481817, -3.817097, -4, 0, 1.5, 0.5, 0.5,
-3.481817, -3.817097, -2, 0, -0.5, 0.5, 0.5,
-3.481817, -3.817097, -2, 1, -0.5, 0.5, 0.5,
-3.481817, -3.817097, -2, 1, 1.5, 0.5, 0.5,
-3.481817, -3.817097, -2, 0, 1.5, 0.5, 0.5,
-3.481817, -3.817097, 0, 0, -0.5, 0.5, 0.5,
-3.481817, -3.817097, 0, 1, -0.5, 0.5, 0.5,
-3.481817, -3.817097, 0, 1, 1.5, 0.5, 0.5,
-3.481817, -3.817097, 0, 0, 1.5, 0.5, 0.5,
-3.481817, -3.817097, 2, 0, -0.5, 0.5, 0.5,
-3.481817, -3.817097, 2, 1, -0.5, 0.5, 0.5,
-3.481817, -3.817097, 2, 1, 1.5, 0.5, 0.5,
-3.481817, -3.817097, 2, 0, 1.5, 0.5, 0.5,
-3.481817, -3.817097, 4, 0, -0.5, 0.5, 0.5,
-3.481817, -3.817097, 4, 1, -0.5, 0.5, 0.5,
-3.481817, -3.817097, 4, 1, 1.5, 0.5, 0.5,
-3.481817, -3.817097, 4, 0, 1.5, 0.5, 0.5
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
-3.02688, -3.252859, -5.729445,
-3.02688, 4.27032, -5.729445,
-3.02688, -3.252859, 5.595934,
-3.02688, 4.27032, 5.595934,
-3.02688, -3.252859, -5.729445,
-3.02688, -3.252859, 5.595934,
-3.02688, 4.27032, -5.729445,
-3.02688, 4.27032, 5.595934,
-3.02688, -3.252859, -5.729445,
3.038951, -3.252859, -5.729445,
-3.02688, -3.252859, 5.595934,
3.038951, -3.252859, 5.595934,
-3.02688, 4.27032, -5.729445,
3.038951, 4.27032, -5.729445,
-3.02688, 4.27032, 5.595934,
3.038951, 4.27032, 5.595934,
3.038951, -3.252859, -5.729445,
3.038951, 4.27032, -5.729445,
3.038951, -3.252859, 5.595934,
3.038951, 4.27032, 5.595934,
3.038951, -3.252859, -5.729445,
3.038951, -3.252859, 5.595934,
3.038951, 4.27032, -5.729445,
3.038951, 4.27032, 5.595934
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
var radius = 7.949978;
var distance = 35.37035;
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
mvMatrix.translate( -0.006035805, -0.5087304, 0.06675506 );
mvMatrix.scale( 1.417064, 1.142558, 0.7589744 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.37035);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
demeton-O<-read.table("demeton-O.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-demeton-O$V2
```

```
## Error in eval(expr, envir, enclos): object 'demeton' not found
```

```r
y<-demeton-O$V3
```

```
## Error in eval(expr, envir, enclos): object 'demeton' not found
```

```r
z<-demeton-O$V4
```

```
## Error in eval(expr, envir, enclos): object 'demeton' not found
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
-2.938542, 0.1334441, -2.449093, 0, 0, 1, 1, 1,
-2.725834, 0.3461252, -2.118989, 1, 0, 0, 1, 1,
-2.670868, 1.432295, -0.8457272, 1, 0, 0, 1, 1,
-2.667297, 0.9463835, -0.5429705, 1, 0, 0, 1, 1,
-2.497617, -1.333428, -2.325841, 1, 0, 0, 1, 1,
-2.478677, -0.5913861, -1.073354, 1, 0, 0, 1, 1,
-2.432287, -0.3132181, 0.7579715, 0, 0, 0, 1, 1,
-2.427353, -0.5214756, -2.154617, 0, 0, 0, 1, 1,
-2.41626, -1.184714, -2.574619, 0, 0, 0, 1, 1,
-2.415789, -0.8303608, -1.787413, 0, 0, 0, 1, 1,
-2.380504, 0.3249722, -1.43257, 0, 0, 0, 1, 1,
-2.358958, 0.6972844, -1.300857, 0, 0, 0, 1, 1,
-2.234658, 0.9693357, -1.453566, 0, 0, 0, 1, 1,
-2.132008, -0.2134397, -1.042235, 1, 1, 1, 1, 1,
-2.114938, -0.395603, -1.362284, 1, 1, 1, 1, 1,
-2.10209, -2.028401, -2.603676, 1, 1, 1, 1, 1,
-2.095505, 0.6588349, -3.001353, 1, 1, 1, 1, 1,
-2.095063, 0.451983, -2.905227, 1, 1, 1, 1, 1,
-2.080949, 2.434082, -0.703318, 1, 1, 1, 1, 1,
-2.078985, 0.5281481, -1.495958, 1, 1, 1, 1, 1,
-2.073706, 1.315192, -1.463099, 1, 1, 1, 1, 1,
-2.072757, 0.5239525, -1.658402, 1, 1, 1, 1, 1,
-2.061368, -0.6409, -0.7487261, 1, 1, 1, 1, 1,
-2.014372, 0.1461408, -1.000109, 1, 1, 1, 1, 1,
-1.984255, -0.2557653, -0.06503318, 1, 1, 1, 1, 1,
-1.868947, -0.01754767, -0.6837096, 1, 1, 1, 1, 1,
-1.818763, -1.733641, -1.810028, 1, 1, 1, 1, 1,
-1.815447, -0.06785206, -1.17441, 1, 1, 1, 1, 1,
-1.777289, -0.1903409, -2.109727, 0, 0, 1, 1, 1,
-1.727679, -2.241234, -2.080118, 1, 0, 0, 1, 1,
-1.703702, -0.2474365, -3.456886, 1, 0, 0, 1, 1,
-1.650721, -0.2216728, -1.575821, 1, 0, 0, 1, 1,
-1.636138, -1.26765, -3.847013, 1, 0, 0, 1, 1,
-1.613724, -0.8065477, -1.777428, 1, 0, 0, 1, 1,
-1.590786, 0.3208838, -1.448495, 0, 0, 0, 1, 1,
-1.567765, -0.07815128, -2.197693, 0, 0, 0, 1, 1,
-1.557259, -1.567462, -0.6989909, 0, 0, 0, 1, 1,
-1.55519, -0.3122759, -1.677289, 0, 0, 0, 1, 1,
-1.53938, -0.4568423, -1.821895, 0, 0, 0, 1, 1,
-1.53385, 0.6303301, -2.16927, 0, 0, 0, 1, 1,
-1.533682, -1.851828, -5.564512, 0, 0, 0, 1, 1,
-1.533432, -0.3356456, -0.7508702, 1, 1, 1, 1, 1,
-1.519144, 0.1740954, -0.4563985, 1, 1, 1, 1, 1,
-1.498934, -0.2602885, -0.5295182, 1, 1, 1, 1, 1,
-1.486786, -0.1693758, -1.755642, 1, 1, 1, 1, 1,
-1.485322, 1.379876, -0.7394809, 1, 1, 1, 1, 1,
-1.478629, -0.5688738, -2.181173, 1, 1, 1, 1, 1,
-1.471218, 0.5399754, -1.992175, 1, 1, 1, 1, 1,
-1.464366, -1.425627, -0.9608625, 1, 1, 1, 1, 1,
-1.460346, 0.5029984, 0.1216894, 1, 1, 1, 1, 1,
-1.449903, 0.6295201, -0.01560423, 1, 1, 1, 1, 1,
-1.446167, -0.1722492, -1.901074, 1, 1, 1, 1, 1,
-1.446045, 0.2232267, -0.5611474, 1, 1, 1, 1, 1,
-1.438516, 0.07041165, -2.311729, 1, 1, 1, 1, 1,
-1.437636, 0.5676461, -1.2512, 1, 1, 1, 1, 1,
-1.425159, 0.8339833, -1.60078, 1, 1, 1, 1, 1,
-1.404157, -0.9502145, -3.139762, 0, 0, 1, 1, 1,
-1.401119, -1.523302, -2.691129, 1, 0, 0, 1, 1,
-1.394914, 0.2432919, -2.097929, 1, 0, 0, 1, 1,
-1.382095, 0.04764395, -0.0956747, 1, 0, 0, 1, 1,
-1.379056, -0.02983882, -2.658796, 1, 0, 0, 1, 1,
-1.364405, 0.5601507, -1.876027, 1, 0, 0, 1, 1,
-1.362605, 1.883211, -0.008545072, 0, 0, 0, 1, 1,
-1.359668, -0.6843635, -2.855808, 0, 0, 0, 1, 1,
-1.354516, -0.7139306, -0.8895069, 0, 0, 0, 1, 1,
-1.34899, 0.1490225, -0.9668977, 0, 0, 0, 1, 1,
-1.346425, 1.07206, -0.9872836, 0, 0, 0, 1, 1,
-1.343291, 0.9159945, -0.09210607, 0, 0, 0, 1, 1,
-1.338019, -1.417299, -1.931828, 0, 0, 0, 1, 1,
-1.314164, 0.5455005, -1.561339, 1, 1, 1, 1, 1,
-1.304312, 0.4583007, -0.1680971, 1, 1, 1, 1, 1,
-1.299441, 0.6415077, 0.4345396, 1, 1, 1, 1, 1,
-1.276876, -1.030112, -2.510661, 1, 1, 1, 1, 1,
-1.261316, 0.4248702, -0.03453759, 1, 1, 1, 1, 1,
-1.260788, 0.2304102, -1.387071, 1, 1, 1, 1, 1,
-1.259677, 1.010663, -1.973241, 1, 1, 1, 1, 1,
-1.254628, -1.422296, -2.370199, 1, 1, 1, 1, 1,
-1.243331, 0.3576443, -1.065354, 1, 1, 1, 1, 1,
-1.237232, 0.8896044, 0.1436004, 1, 1, 1, 1, 1,
-1.236562, -1.054291, -2.967261, 1, 1, 1, 1, 1,
-1.222178, -0.8245022, -2.691895, 1, 1, 1, 1, 1,
-1.217921, -1.426362, -1.98448, 1, 1, 1, 1, 1,
-1.215467, -0.8638884, -1.430739, 1, 1, 1, 1, 1,
-1.210371, 1.840741, 0.8341088, 1, 1, 1, 1, 1,
-1.209587, -0.008205536, -1.722502, 0, 0, 1, 1, 1,
-1.198129, 0.5224267, -2.291232, 1, 0, 0, 1, 1,
-1.193488, -0.244218, -1.887813, 1, 0, 0, 1, 1,
-1.191683, 1.183953, 1.318311, 1, 0, 0, 1, 1,
-1.190479, 1.442161, -0.1367214, 1, 0, 0, 1, 1,
-1.187529, 0.01499937, -0.8135543, 1, 0, 0, 1, 1,
-1.176719, 0.005488593, -0.6526279, 0, 0, 0, 1, 1,
-1.171061, -0.06615833, -1.415835, 0, 0, 0, 1, 1,
-1.169947, 0.1989336, -1.432786, 0, 0, 0, 1, 1,
-1.169624, -0.9103382, -2.256222, 0, 0, 0, 1, 1,
-1.160385, -1.006781, -1.103529, 0, 0, 0, 1, 1,
-1.160251, 0.9117981, -2.192817, 0, 0, 0, 1, 1,
-1.159624, -0.190666, -1.915979, 0, 0, 0, 1, 1,
-1.159339, 0.992528, -1.30977, 1, 1, 1, 1, 1,
-1.151015, -3.143298, -3.932658, 1, 1, 1, 1, 1,
-1.144569, -0.2676502, -1.576049, 1, 1, 1, 1, 1,
-1.142469, -1.013278, -1.797236, 1, 1, 1, 1, 1,
-1.142442, -0.7654641, -2.443321, 1, 1, 1, 1, 1,
-1.141838, 0.936869, 0.4566114, 1, 1, 1, 1, 1,
-1.128135, -1.282408, -1.75102, 1, 1, 1, 1, 1,
-1.127347, 0.7149397, 1.610952, 1, 1, 1, 1, 1,
-1.123347, 1.059397, -1.499588, 1, 1, 1, 1, 1,
-1.11591, -0.6024387, -2.266734, 1, 1, 1, 1, 1,
-1.115562, 0.1318268, -1.137489, 1, 1, 1, 1, 1,
-1.106862, -1.433558, -1.505365, 1, 1, 1, 1, 1,
-1.106785, 0.2306806, -0.1410702, 1, 1, 1, 1, 1,
-1.105945, 0.06374179, -1.689214, 1, 1, 1, 1, 1,
-1.104267, 0.1388879, -2.48232, 1, 1, 1, 1, 1,
-1.097344, -0.2514057, -1.4857, 0, 0, 1, 1, 1,
-1.089432, 0.1793119, -1.362845, 1, 0, 0, 1, 1,
-1.08392, 1.277699, -0.2359878, 1, 0, 0, 1, 1,
-1.076652, -3.05229, -4.066473, 1, 0, 0, 1, 1,
-1.067706, -0.9627441, -2.715865, 1, 0, 0, 1, 1,
-1.065723, 0.3342853, -0.9710133, 1, 0, 0, 1, 1,
-1.06024, -0.4977956, -2.30533, 0, 0, 0, 1, 1,
-1.058152, 0.2064303, -1.800587, 0, 0, 0, 1, 1,
-1.055784, 0.1821256, -0.7890587, 0, 0, 0, 1, 1,
-1.042743, 0.4885648, -1.584974, 0, 0, 0, 1, 1,
-1.038536, -1.450878, -2.338636, 0, 0, 0, 1, 1,
-1.035405, -0.2210086, -2.082031, 0, 0, 0, 1, 1,
-1.032086, 0.1647035, -1.422109, 0, 0, 0, 1, 1,
-1.03, -0.02866246, -0.2083746, 1, 1, 1, 1, 1,
-1.023998, 1.097946, -0.5835338, 1, 1, 1, 1, 1,
-1.008464, 0.03224584, -1.599219, 1, 1, 1, 1, 1,
-1.00649, 0.3585235, -0.1360933, 1, 1, 1, 1, 1,
-1.004915, 0.3529916, -1.683619, 1, 1, 1, 1, 1,
-1.003206, -0.8747419, -2.668896, 1, 1, 1, 1, 1,
-1.002114, -0.07591554, -2.164499, 1, 1, 1, 1, 1,
-1.001556, 0.8686549, -1.24013, 1, 1, 1, 1, 1,
-0.9999791, 1.145169, -0.02204059, 1, 1, 1, 1, 1,
-0.9991083, -0.801286, -2.395192, 1, 1, 1, 1, 1,
-0.9759551, 1.497544, -1.663561, 1, 1, 1, 1, 1,
-0.9705174, -0.1211867, -2.652842, 1, 1, 1, 1, 1,
-0.9572692, -0.3269093, -1.935671, 1, 1, 1, 1, 1,
-0.9523281, 0.1915109, -2.724213, 1, 1, 1, 1, 1,
-0.9445309, -0.3089829, -2.13766, 1, 1, 1, 1, 1,
-0.9425846, 0.003427822, -0.8017913, 0, 0, 1, 1, 1,
-0.9420047, -0.2713315, -0.5117804, 1, 0, 0, 1, 1,
-0.9384778, -0.3351893, -1.345063, 1, 0, 0, 1, 1,
-0.9351434, 0.6220919, -0.8885894, 1, 0, 0, 1, 1,
-0.9307743, -1.654922, -1.641854, 1, 0, 0, 1, 1,
-0.9293854, -0.3542302, -1.587846, 1, 0, 0, 1, 1,
-0.9257399, -0.3770573, -1.670628, 0, 0, 0, 1, 1,
-0.9128582, -0.3879561, -1.497243, 0, 0, 0, 1, 1,
-0.9116208, 0.6395834, -1.769813, 0, 0, 0, 1, 1,
-0.9109349, -1.061462, -2.811642, 0, 0, 0, 1, 1,
-0.9073791, -0.2466002, -1.808778, 0, 0, 0, 1, 1,
-0.8958759, 0.4703985, -0.03005085, 0, 0, 0, 1, 1,
-0.8908218, -1.61131, -0.5556912, 0, 0, 0, 1, 1,
-0.8842219, 0.1725818, -0.6837146, 1, 1, 1, 1, 1,
-0.8833666, -0.6112371, -2.911807, 1, 1, 1, 1, 1,
-0.8779953, -0.487328, -3.216316, 1, 1, 1, 1, 1,
-0.8773465, -1.099025, -1.948715, 1, 1, 1, 1, 1,
-0.876932, -0.8590288, -1.963332, 1, 1, 1, 1, 1,
-0.8759544, 0.8781819, -0.3333642, 1, 1, 1, 1, 1,
-0.8675681, -0.1964828, -1.376178, 1, 1, 1, 1, 1,
-0.8617377, -0.4192215, -2.381814, 1, 1, 1, 1, 1,
-0.8587433, -0.1472556, -2.937968, 1, 1, 1, 1, 1,
-0.8582853, 0.3181444, -0.2818524, 1, 1, 1, 1, 1,
-0.8552753, 0.3656535, -1.503846, 1, 1, 1, 1, 1,
-0.8533428, -1.503902, -0.6157363, 1, 1, 1, 1, 1,
-0.8453323, 1.913984, -1.22677, 1, 1, 1, 1, 1,
-0.8330929, -1.171278, -2.599485, 1, 1, 1, 1, 1,
-0.8260983, 0.2334761, -1.659693, 1, 1, 1, 1, 1,
-0.8234414, 0.1434476, -3.496423, 0, 0, 1, 1, 1,
-0.8231582, -0.2671942, -2.767759, 1, 0, 0, 1, 1,
-0.8186811, -0.526165, -2.81027, 1, 0, 0, 1, 1,
-0.8172445, 0.846857, -1.400042, 1, 0, 0, 1, 1,
-0.8075625, -0.4261527, -0.8468019, 1, 0, 0, 1, 1,
-0.8037419, -1.414286, -4.731496, 1, 0, 0, 1, 1,
-0.8033981, -0.1807975, -2.814403, 0, 0, 0, 1, 1,
-0.8013115, -0.1367745, -3.033651, 0, 0, 0, 1, 1,
-0.7987871, 0.5316319, -0.4280812, 0, 0, 0, 1, 1,
-0.7983552, -0.001488364, -1.468889, 0, 0, 0, 1, 1,
-0.7922719, 0.7061988, -1.06895, 0, 0, 0, 1, 1,
-0.7915712, -1.066246, -2.189642, 0, 0, 0, 1, 1,
-0.7914249, -1.503381, -3.489976, 0, 0, 0, 1, 1,
-0.7833713, 1.608672, -1.685017, 1, 1, 1, 1, 1,
-0.7780356, 0.3382555, -1.292704, 1, 1, 1, 1, 1,
-0.7764146, 0.8425037, -0.8194864, 1, 1, 1, 1, 1,
-0.7729652, -1.812468, -2.713434, 1, 1, 1, 1, 1,
-0.7674662, -0.04038784, -1.721075, 1, 1, 1, 1, 1,
-0.766024, -0.4695289, -2.071639, 1, 1, 1, 1, 1,
-0.7654298, 1.952437, -0.1975257, 1, 1, 1, 1, 1,
-0.7604388, -1.608358, -1.876155, 1, 1, 1, 1, 1,
-0.7583199, -1.612557, -3.731638, 1, 1, 1, 1, 1,
-0.7564243, 0.4209819, -0.7949476, 1, 1, 1, 1, 1,
-0.7477084, 1.67447, 1.366921, 1, 1, 1, 1, 1,
-0.7424815, -1.622254, -2.511536, 1, 1, 1, 1, 1,
-0.7413423, 0.2121058, -1.442862, 1, 1, 1, 1, 1,
-0.741117, -1.762881, -1.042776, 1, 1, 1, 1, 1,
-0.7378568, -0.1574678, -1.800667, 1, 1, 1, 1, 1,
-0.7359663, 1.148168, -0.609641, 0, 0, 1, 1, 1,
-0.7351232, 0.03193169, -2.799227, 1, 0, 0, 1, 1,
-0.731437, 1.124371, -0.07875125, 1, 0, 0, 1, 1,
-0.7312769, 0.6414415, -0.3172695, 1, 0, 0, 1, 1,
-0.7297479, 1.93277, -2.356486, 1, 0, 0, 1, 1,
-0.7253609, -1.626671, -2.047933, 1, 0, 0, 1, 1,
-0.7245295, 2.508109, 1.092314, 0, 0, 0, 1, 1,
-0.7233812, -0.5836056, -1.689442, 0, 0, 0, 1, 1,
-0.7189129, 0.4759304, 2.727489, 0, 0, 0, 1, 1,
-0.7174397, -1.475936, -2.252971, 0, 0, 0, 1, 1,
-0.7148651, 1.273223, -0.2082026, 0, 0, 0, 1, 1,
-0.7130315, 0.6885802, -0.9169651, 0, 0, 0, 1, 1,
-0.7115681, 0.7405183, -0.9337804, 0, 0, 0, 1, 1,
-0.7106794, -1.004341, -3.32287, 1, 1, 1, 1, 1,
-0.7054112, -0.6507887, -1.792817, 1, 1, 1, 1, 1,
-0.7046175, -0.2290761, -1.694945, 1, 1, 1, 1, 1,
-0.6950086, 1.319431, -0.07504652, 1, 1, 1, 1, 1,
-0.6929184, 0.3904379, 0.1889559, 1, 1, 1, 1, 1,
-0.6926158, 0.4800182, -1.554626, 1, 1, 1, 1, 1,
-0.6921521, -0.4080374, -0.9157715, 1, 1, 1, 1, 1,
-0.6914144, 2.168487, -0.1219482, 1, 1, 1, 1, 1,
-0.6913586, 0.6355101, -1.122669, 1, 1, 1, 1, 1,
-0.6871834, -0.2539178, -2.734079, 1, 1, 1, 1, 1,
-0.6859692, 0.1566493, -1.127131, 1, 1, 1, 1, 1,
-0.6824402, -0.290154, -1.251063, 1, 1, 1, 1, 1,
-0.6737826, 1.087903, -1.478103, 1, 1, 1, 1, 1,
-0.671905, 0.6760421, 0.3809945, 1, 1, 1, 1, 1,
-0.6714684, -1.561076, -3.262703, 1, 1, 1, 1, 1,
-0.6707543, 2.030018, -0.9729906, 0, 0, 1, 1, 1,
-0.6681192, -0.1690848, -0.9950339, 1, 0, 0, 1, 1,
-0.6636843, -0.02433788, -2.461152, 1, 0, 0, 1, 1,
-0.6621627, -0.6446184, -3.750426, 1, 0, 0, 1, 1,
-0.6605505, 1.676086, -0.828625, 1, 0, 0, 1, 1,
-0.6601071, -0.4463806, -2.045472, 1, 0, 0, 1, 1,
-0.647067, 1.181029, -1.05182, 0, 0, 0, 1, 1,
-0.6450964, 0.01713634, -1.491683, 0, 0, 0, 1, 1,
-0.6411421, 0.4885302, -2.293768, 0, 0, 0, 1, 1,
-0.6410949, 2.474641, -0.8851769, 0, 0, 0, 1, 1,
-0.6399116, 0.1801084, -1.476756, 0, 0, 0, 1, 1,
-0.6381649, -0.9947349, -3.596696, 0, 0, 0, 1, 1,
-0.6375431, 0.967854, -1.529207, 0, 0, 0, 1, 1,
-0.6335475, 0.2872505, -0.9253376, 1, 1, 1, 1, 1,
-0.6333721, 0.590619, -1.381331, 1, 1, 1, 1, 1,
-0.6214379, -0.2724727, -3.278512, 1, 1, 1, 1, 1,
-0.6207279, 1.380039, -0.7583835, 1, 1, 1, 1, 1,
-0.6197589, -0.02797622, -3.655717, 1, 1, 1, 1, 1,
-0.6143379, -0.1137189, -0.768291, 1, 1, 1, 1, 1,
-0.6138301, 0.3786311, -0.575232, 1, 1, 1, 1, 1,
-0.6072531, 0.345161, 0.523645, 1, 1, 1, 1, 1,
-0.6067725, -1.540819, -3.431202, 1, 1, 1, 1, 1,
-0.6010514, 0.9262246, 0.6708751, 1, 1, 1, 1, 1,
-0.59778, -0.9253199, -3.248564, 1, 1, 1, 1, 1,
-0.597437, 0.0672901, -2.684814, 1, 1, 1, 1, 1,
-0.5926248, 0.5502889, 0.8321611, 1, 1, 1, 1, 1,
-0.5885901, -0.4192969, -2.442486, 1, 1, 1, 1, 1,
-0.5881868, -0.8260586, -2.321421, 1, 1, 1, 1, 1,
-0.5865893, 0.6932149, 0.4698481, 0, 0, 1, 1, 1,
-0.5845585, -1.810103, -1.228566, 1, 0, 0, 1, 1,
-0.5845378, 0.1529749, -0.2663318, 1, 0, 0, 1, 1,
-0.5820096, 0.2664962, -2.146523, 1, 0, 0, 1, 1,
-0.5767291, 1.172766, -1.839561, 1, 0, 0, 1, 1,
-0.5728313, 0.9067884, -1.255117, 1, 0, 0, 1, 1,
-0.56774, 0.9430796, -1.320814, 0, 0, 0, 1, 1,
-0.5672792, -0.479815, -2.803708, 0, 0, 0, 1, 1,
-0.5607989, -1.087024, -3.288904, 0, 0, 0, 1, 1,
-0.5602524, -1.128344, -1.160739, 0, 0, 0, 1, 1,
-0.5600356, 0.8538377, -0.6403927, 0, 0, 0, 1, 1,
-0.5594878, 0.3759796, 0.1173456, 0, 0, 0, 1, 1,
-0.5565808, -0.3372332, -3.219412, 0, 0, 0, 1, 1,
-0.5557451, 0.2358939, -1.78073, 1, 1, 1, 1, 1,
-0.5462931, 1.127747, -0.6978665, 1, 1, 1, 1, 1,
-0.5460782, -0.8696293, -2.245975, 1, 1, 1, 1, 1,
-0.5448247, -1.266722, -3.141575, 1, 1, 1, 1, 1,
-0.5435019, -1.208901, -3.302047, 1, 1, 1, 1, 1,
-0.5417863, -0.6518409, -2.133044, 1, 1, 1, 1, 1,
-0.541684, -0.4949663, -2.834841, 1, 1, 1, 1, 1,
-0.53174, -1.274478, -3.569302, 1, 1, 1, 1, 1,
-0.5316472, -0.4049367, -1.864704, 1, 1, 1, 1, 1,
-0.5313735, 1.140709, -0.9593963, 1, 1, 1, 1, 1,
-0.5282274, -0.04345206, -0.8293733, 1, 1, 1, 1, 1,
-0.5270479, 0.8140163, 0.2068987, 1, 1, 1, 1, 1,
-0.5268942, -1.225666, -3.236959, 1, 1, 1, 1, 1,
-0.5247321, -0.9354359, -3.052199, 1, 1, 1, 1, 1,
-0.5149116, -0.1325726, -2.692345, 1, 1, 1, 1, 1,
-0.5148641, 0.2005507, -1.990578, 0, 0, 1, 1, 1,
-0.5125503, -0.7078912, -1.102451, 1, 0, 0, 1, 1,
-0.5082356, 0.02836851, -1.493559, 1, 0, 0, 1, 1,
-0.5082331, -1.916502, -2.948846, 1, 0, 0, 1, 1,
-0.5007038, -0.1343356, -1.184638, 1, 0, 0, 1, 1,
-0.4995741, -0.2142052, -2.532164, 1, 0, 0, 1, 1,
-0.4995152, 0.9182187, 0.03556476, 0, 0, 0, 1, 1,
-0.4993834, -1.109099, -2.25966, 0, 0, 0, 1, 1,
-0.4973896, 0.672155, 0.5440387, 0, 0, 0, 1, 1,
-0.4876345, -0.3567173, -2.671985, 0, 0, 0, 1, 1,
-0.4838591, 0.3638374, -1.116534, 0, 0, 0, 1, 1,
-0.4812775, -0.4991457, -1.896092, 0, 0, 0, 1, 1,
-0.4760851, -0.1355107, 0.08689896, 0, 0, 0, 1, 1,
-0.4740077, 0.08461735, -0.7108151, 1, 1, 1, 1, 1,
-0.4658698, 0.2667315, -1.334312, 1, 1, 1, 1, 1,
-0.4654121, -0.191069, -2.212569, 1, 1, 1, 1, 1,
-0.4645185, 1.145989, -1.351086, 1, 1, 1, 1, 1,
-0.4561304, 1.647108, -1.142462, 1, 1, 1, 1, 1,
-0.4536157, 2.204207, -1.391598, 1, 1, 1, 1, 1,
-0.4532852, -0.9213804, -4.499763, 1, 1, 1, 1, 1,
-0.4469666, -0.8971624, -4.45612, 1, 1, 1, 1, 1,
-0.4453085, -0.1120409, -3.181925, 1, 1, 1, 1, 1,
-0.4450011, 0.9080099, -0.5286349, 1, 1, 1, 1, 1,
-0.441094, -0.4699459, -1.968188, 1, 1, 1, 1, 1,
-0.4400455, -0.7281007, -3.169417, 1, 1, 1, 1, 1,
-0.4381961, -0.9843845, -3.413139, 1, 1, 1, 1, 1,
-0.4379773, -0.7914549, -3.867359, 1, 1, 1, 1, 1,
-0.4369211, 1.692038, -2.291668, 1, 1, 1, 1, 1,
-0.436327, -0.1249697, -1.931667, 0, 0, 1, 1, 1,
-0.4255705, -0.4582659, -3.314988, 1, 0, 0, 1, 1,
-0.4247412, 0.02610778, -0.8588292, 1, 0, 0, 1, 1,
-0.4233602, -0.7832649, -2.73498, 1, 0, 0, 1, 1,
-0.4112965, -1.013688, -1.557267, 1, 0, 0, 1, 1,
-0.4064875, -0.8180972, -3.304121, 1, 0, 0, 1, 1,
-0.405356, -0.3594805, -4.234535, 0, 0, 0, 1, 1,
-0.4034306, -0.8697034, -2.013648, 0, 0, 0, 1, 1,
-0.4018257, -0.5246767, -1.492374, 0, 0, 0, 1, 1,
-0.3931904, -0.9189211, -2.841587, 0, 0, 0, 1, 1,
-0.3847554, 0.4613959, -1.784842, 0, 0, 0, 1, 1,
-0.3760321, -0.9042261, -1.702028, 0, 0, 0, 1, 1,
-0.3738272, 1.140519, 0.94888, 0, 0, 0, 1, 1,
-0.369154, 1.195567, 0.1322218, 1, 1, 1, 1, 1,
-0.3688208, 0.06033867, -1.765182, 1, 1, 1, 1, 1,
-0.3631102, -0.248582, -1.942217, 1, 1, 1, 1, 1,
-0.3551638, -0.7980564, -4.118784, 1, 1, 1, 1, 1,
-0.3516886, 1.25918, 1.496193, 1, 1, 1, 1, 1,
-0.3478084, -0.6875967, -2.484258, 1, 1, 1, 1, 1,
-0.3467873, -2.089737, -3.3351, 1, 1, 1, 1, 1,
-0.3464978, -0.6348731, -2.258231, 1, 1, 1, 1, 1,
-0.34521, -0.7499638, -1.647681, 1, 1, 1, 1, 1,
-0.34141, 0.5452464, 0.9827963, 1, 1, 1, 1, 1,
-0.3404121, -0.006185206, -1.316672, 1, 1, 1, 1, 1,
-0.3371822, -1.030451, -5.393688, 1, 1, 1, 1, 1,
-0.3363701, 1.801658, -0.833583, 1, 1, 1, 1, 1,
-0.3347602, -0.8023841, -2.29361, 1, 1, 1, 1, 1,
-0.3346717, -2.675188, -1.7998, 1, 1, 1, 1, 1,
-0.3288, 0.8609031, -0.3849319, 0, 0, 1, 1, 1,
-0.3266924, 0.4675377, -1.285837, 1, 0, 0, 1, 1,
-0.3235782, -0.2705803, -0.4041972, 1, 0, 0, 1, 1,
-0.3227116, -0.1973193, -1.959748, 1, 0, 0, 1, 1,
-0.3195247, -0.1839002, -2.417027, 1, 0, 0, 1, 1,
-0.3162206, 0.7538456, -1.500494, 1, 0, 0, 1, 1,
-0.3108296, -0.0635751, -0.6510793, 0, 0, 0, 1, 1,
-0.3099249, -1.501283, -3.498212, 0, 0, 0, 1, 1,
-0.3061399, -0.0593316, -2.564873, 0, 0, 0, 1, 1,
-0.2948181, -1.710179, -0.9070925, 0, 0, 0, 1, 1,
-0.2947899, 1.572762, 0.6279843, 0, 0, 0, 1, 1,
-0.2925716, -0.1653237, -0.3792782, 0, 0, 0, 1, 1,
-0.2907854, 0.8991997, 0.1586457, 0, 0, 0, 1, 1,
-0.2897792, 0.3357238, -0.1689112, 1, 1, 1, 1, 1,
-0.2872739, 0.9372587, 1.928936, 1, 1, 1, 1, 1,
-0.2855801, 0.3624086, 1.254715, 1, 1, 1, 1, 1,
-0.2843555, 0.2080827, 0.175526, 1, 1, 1, 1, 1,
-0.27855, 0.2501445, -0.118119, 1, 1, 1, 1, 1,
-0.2745208, -0.06275215, -2.046515, 1, 1, 1, 1, 1,
-0.2681348, 1.124099, -1.251148, 1, 1, 1, 1, 1,
-0.2668209, 1.287766, 0.9881011, 1, 1, 1, 1, 1,
-0.2668061, 0.09707852, -1.547587, 1, 1, 1, 1, 1,
-0.2651938, -1.344378, -4.182688, 1, 1, 1, 1, 1,
-0.2645113, -0.2067365, -3.466189, 1, 1, 1, 1, 1,
-0.2607186, 0.4954634, 1.091837, 1, 1, 1, 1, 1,
-0.2558575, -1.562695, -2.844851, 1, 1, 1, 1, 1,
-0.2471239, 0.183609, -0.3919731, 1, 1, 1, 1, 1,
-0.2444495, -1.351311, -1.41483, 1, 1, 1, 1, 1,
-0.2432895, -1.061448, -2.843923, 0, 0, 1, 1, 1,
-0.233532, 0.02764919, -1.22582, 1, 0, 0, 1, 1,
-0.2313087, -0.01673616, -2.52424, 1, 0, 0, 1, 1,
-0.2264534, -0.1454268, -0.4416057, 1, 0, 0, 1, 1,
-0.2257186, 0.3435766, -1.470694, 1, 0, 0, 1, 1,
-0.2215372, -0.303737, -4.667423, 1, 0, 0, 1, 1,
-0.2173576, -0.1586636, -0.3048989, 0, 0, 0, 1, 1,
-0.2155896, -0.8951633, -2.309231, 0, 0, 0, 1, 1,
-0.2144742, 0.150537, -0.7245482, 0, 0, 0, 1, 1,
-0.214409, -0.7719615, -0.9204212, 0, 0, 0, 1, 1,
-0.2111651, 1.68101, -1.657121, 0, 0, 0, 1, 1,
-0.2067017, -0.5171092, -3.584177, 0, 0, 0, 1, 1,
-0.2062635, -0.5250412, -0.83846, 0, 0, 0, 1, 1,
-0.205339, 0.04281051, 0.008683292, 1, 1, 1, 1, 1,
-0.1978807, 0.6409469, -1.080671, 1, 1, 1, 1, 1,
-0.1975728, -0.04439346, -1.068563, 1, 1, 1, 1, 1,
-0.1909157, 0.2835055, -0.3737316, 1, 1, 1, 1, 1,
-0.1868208, -2.122636, -2.488574, 1, 1, 1, 1, 1,
-0.1768598, -0.7300125, -1.474314, 1, 1, 1, 1, 1,
-0.1725727, 2.016002, -1.681936, 1, 1, 1, 1, 1,
-0.1664702, -0.590268, -2.965394, 1, 1, 1, 1, 1,
-0.1643286, -0.777806, -1.360996, 1, 1, 1, 1, 1,
-0.163154, -2.581177, -2.288136, 1, 1, 1, 1, 1,
-0.1622713, 0.9506595, 1.225369, 1, 1, 1, 1, 1,
-0.1570991, 1.258866, 0.3832282, 1, 1, 1, 1, 1,
-0.1528299, -1.110829, -2.096456, 1, 1, 1, 1, 1,
-0.1521385, -0.09331268, -4.303331, 1, 1, 1, 1, 1,
-0.149962, 0.3811013, -0.4112576, 1, 1, 1, 1, 1,
-0.1483293, 0.6140032, -0.7453897, 0, 0, 1, 1, 1,
-0.1471688, 0.04702285, -0.8128216, 1, 0, 0, 1, 1,
-0.1467905, -0.6522021, -4.547658, 1, 0, 0, 1, 1,
-0.1455198, -1.52589, -2.18304, 1, 0, 0, 1, 1,
-0.1374533, 1.069122, 1.879991, 1, 0, 0, 1, 1,
-0.1371581, -0.348055, -3.324876, 1, 0, 0, 1, 1,
-0.136321, 0.2211183, -0.284171, 0, 0, 0, 1, 1,
-0.1330861, 0.3786463, 0.3646629, 0, 0, 0, 1, 1,
-0.1329351, 2.021554, 0.1560994, 0, 0, 0, 1, 1,
-0.1290535, 0.1568302, 0.5792127, 0, 0, 0, 1, 1,
-0.127886, -0.3295703, -1.397643, 0, 0, 0, 1, 1,
-0.1277544, 0.3884017, 1.536048, 0, 0, 0, 1, 1,
-0.1264668, 1.286598, -1.327497, 0, 0, 0, 1, 1,
-0.1264468, 0.4442489, -1.125061, 1, 1, 1, 1, 1,
-0.1248553, 0.7765687, -0.09479142, 1, 1, 1, 1, 1,
-0.1213361, -1.53644, -5.153349, 1, 1, 1, 1, 1,
-0.1212734, 0.5288327, 0.5311124, 1, 1, 1, 1, 1,
-0.1200994, 0.6932528, -0.5735842, 1, 1, 1, 1, 1,
-0.114526, 0.8145704, 0.2659841, 1, 1, 1, 1, 1,
-0.1096383, 2.296872, 0.2401375, 1, 1, 1, 1, 1,
-0.1055262, 0.7603459, 0.9740515, 1, 1, 1, 1, 1,
-0.1044282, 1.181477, 0.7709212, 1, 1, 1, 1, 1,
-0.1024177, -1.539874, -1.418853, 1, 1, 1, 1, 1,
-0.09326433, -0.4504164, -2.535854, 1, 1, 1, 1, 1,
-0.0926626, -1.138645, -4.829171, 1, 1, 1, 1, 1,
-0.09197916, 1.859425, 0.5373213, 1, 1, 1, 1, 1,
-0.09156603, -1.123756, -2.1387, 1, 1, 1, 1, 1,
-0.0902345, 0.9547321, -0.4674686, 1, 1, 1, 1, 1,
-0.08971714, -0.5545668, -2.592921, 0, 0, 1, 1, 1,
-0.08695044, 0.3649504, 0.7244509, 1, 0, 0, 1, 1,
-0.08370417, -0.04142545, -1.436121, 1, 0, 0, 1, 1,
-0.08269312, -1.887196, -2.211036, 1, 0, 0, 1, 1,
-0.0818675, -0.1429298, -3.272927, 1, 0, 0, 1, 1,
-0.07927831, 1.008451, 1.12961, 1, 0, 0, 1, 1,
-0.07795633, -1.221091, -3.938054, 0, 0, 0, 1, 1,
-0.07553069, -0.3320545, -4.138639, 0, 0, 0, 1, 1,
-0.07508509, 0.9215307, 0.7338677, 0, 0, 0, 1, 1,
-0.0687563, -3.128139, -1.358673, 0, 0, 0, 1, 1,
-0.06686988, -1.27393, -2.924981, 0, 0, 0, 1, 1,
-0.05830048, 1.052651, 0.3188587, 0, 0, 0, 1, 1,
-0.05795972, 0.453863, -1.88653, 0, 0, 0, 1, 1,
-0.05667797, 1.047211, -1.618767, 1, 1, 1, 1, 1,
-0.05621761, -0.1286938, -2.958258, 1, 1, 1, 1, 1,
-0.05621601, -0.6872236, -4.060704, 1, 1, 1, 1, 1,
-0.05576082, -2.049726, -4.470516, 1, 1, 1, 1, 1,
-0.05284391, -0.1091257, -2.180489, 1, 1, 1, 1, 1,
-0.05077073, -1.004155, -3.005284, 1, 1, 1, 1, 1,
-0.04998082, 1.171825, -0.3872861, 1, 1, 1, 1, 1,
-0.0452576, -1.045484, -1.891066, 1, 1, 1, 1, 1,
-0.04429173, 0.005285431, -2.087065, 1, 1, 1, 1, 1,
-0.0360655, -1.349405, -2.206789, 1, 1, 1, 1, 1,
-0.03348848, -1.17753, -3.179552, 1, 1, 1, 1, 1,
-0.03156516, 0.1002682, -0.5128303, 1, 1, 1, 1, 1,
-0.0276766, -0.1028634, -3.145413, 1, 1, 1, 1, 1,
-0.02696109, -0.1825684, -2.854767, 1, 1, 1, 1, 1,
-0.0230407, 0.1709862, -0.1422059, 1, 1, 1, 1, 1,
-0.02263785, 0.6083351, -0.7008041, 0, 0, 1, 1, 1,
-0.02061165, 1.003155, -1.315957, 1, 0, 0, 1, 1,
-0.02022397, 0.1711904, -1.345104, 1, 0, 0, 1, 1,
-0.01894369, 2.262885, -0.9333907, 1, 0, 0, 1, 1,
-0.01839501, 1.123339, -2.315407, 1, 0, 0, 1, 1,
-0.017942, -0.7126251, -2.341215, 1, 0, 0, 1, 1,
-0.01306564, -0.6185837, -1.347171, 0, 0, 0, 1, 1,
-0.008905588, -0.4950357, -1.954391, 0, 0, 0, 1, 1,
-0.008748749, -0.1081601, -3.327726, 0, 0, 0, 1, 1,
-0.008576428, 0.9918421, -1.255285, 0, 0, 0, 1, 1,
-0.005252466, -1.327481, -2.896657, 0, 0, 0, 1, 1,
0.003971498, 0.8688384, 0.80588, 0, 0, 0, 1, 1,
0.005717315, -0.8598896, 3.889846, 0, 0, 0, 1, 1,
0.00641328, -0.218358, 5.431002, 1, 1, 1, 1, 1,
0.007279255, -0.4467086, 2.966291, 1, 1, 1, 1, 1,
0.01075353, -0.4437108, 1.92014, 1, 1, 1, 1, 1,
0.01315892, 1.179514, 0.9669282, 1, 1, 1, 1, 1,
0.01333704, 0.05400723, 0.5083073, 1, 1, 1, 1, 1,
0.01490037, -0.2957022, 3.287597, 1, 1, 1, 1, 1,
0.01964086, 0.1718763, 1.408792, 1, 1, 1, 1, 1,
0.02111309, -0.7346507, 2.30138, 1, 1, 1, 1, 1,
0.0226668, -0.5932106, 4.405988, 1, 1, 1, 1, 1,
0.02514544, 0.382219, 0.738193, 1, 1, 1, 1, 1,
0.02626453, 0.4184836, -1.451342, 1, 1, 1, 1, 1,
0.02713844, 0.7274861, 0.4709657, 1, 1, 1, 1, 1,
0.02795158, 0.445446, 1.183325, 1, 1, 1, 1, 1,
0.03030704, 0.9987668, 0.4703496, 1, 1, 1, 1, 1,
0.03035026, -0.04039713, 2.107159, 1, 1, 1, 1, 1,
0.03311887, -1.873428, 1.898602, 0, 0, 1, 1, 1,
0.03534895, -1.451777, 2.902798, 1, 0, 0, 1, 1,
0.03616404, -0.7078561, 3.703299, 1, 0, 0, 1, 1,
0.03725446, 0.3100541, -0.7442338, 1, 0, 0, 1, 1,
0.03859969, 0.7716571, -0.2741497, 1, 0, 0, 1, 1,
0.04050889, -2.194484, 5.024106, 1, 0, 0, 1, 1,
0.04399279, 0.4262265, 1.268038, 0, 0, 0, 1, 1,
0.0443134, 1.18475, 0.2052452, 0, 0, 0, 1, 1,
0.04611593, 1.086757, 2.570212, 0, 0, 0, 1, 1,
0.04959099, 2.555364, 0.417774, 0, 0, 0, 1, 1,
0.05294221, 0.04385331, -0.1950244, 0, 0, 0, 1, 1,
0.05343203, -0.8143762, 3.056363, 0, 0, 0, 1, 1,
0.06580102, -1.576905, 3.118562, 0, 0, 0, 1, 1,
0.06874994, -0.5645226, 4.249365, 1, 1, 1, 1, 1,
0.07396913, -0.2496759, 2.782616, 1, 1, 1, 1, 1,
0.07416514, -0.7138958, 1.340868, 1, 1, 1, 1, 1,
0.07444394, 1.720475, 0.3419313, 1, 1, 1, 1, 1,
0.07553269, -0.2148061, 2.512791, 1, 1, 1, 1, 1,
0.07590621, 0.007752954, 1.161535, 1, 1, 1, 1, 1,
0.07688376, 0.3269972, -0.3562003, 1, 1, 1, 1, 1,
0.07816558, 1.619977, 0.9604032, 1, 1, 1, 1, 1,
0.08085042, 0.7102093, -1.907411, 1, 1, 1, 1, 1,
0.081173, -0.6809699, 3.349561, 1, 1, 1, 1, 1,
0.08284863, 0.2417399, -0.7856594, 1, 1, 1, 1, 1,
0.08551035, 1.469624, 1.113833, 1, 1, 1, 1, 1,
0.08736891, -0.5614945, 3.358414, 1, 1, 1, 1, 1,
0.08834276, 0.5274687, 2.401876, 1, 1, 1, 1, 1,
0.1025691, -0.4318188, 3.317896, 1, 1, 1, 1, 1,
0.1039856, 2.104204, 1.450319, 0, 0, 1, 1, 1,
0.1044666, -0.5753284, 2.872475, 1, 0, 0, 1, 1,
0.106839, -0.1518658, 2.128036, 1, 0, 0, 1, 1,
0.1079634, 0.2509484, 2.125618, 1, 0, 0, 1, 1,
0.109342, -1.452948, 1.538243, 1, 0, 0, 1, 1,
0.1126622, -0.3199998, 2.460017, 1, 0, 0, 1, 1,
0.1139532, 2.177801, -1.547911, 0, 0, 0, 1, 1,
0.1203137, -0.6789631, 4.02904, 0, 0, 0, 1, 1,
0.1221716, -1.082978, 4.21496, 0, 0, 0, 1, 1,
0.1229189, 0.2674104, -0.296139, 0, 0, 0, 1, 1,
0.1261062, -0.273349, 0.967611, 0, 0, 0, 1, 1,
0.1295269, 2.59323, -0.04325758, 0, 0, 0, 1, 1,
0.1307173, -1.965298, 0.1550629, 0, 0, 0, 1, 1,
0.1339321, 0.7243264, 0.1869594, 1, 1, 1, 1, 1,
0.1361273, -0.3450045, 3.765903, 1, 1, 1, 1, 1,
0.1373603, -0.1001156, 2.521261, 1, 1, 1, 1, 1,
0.1374043, 1.184026, 0.3213081, 1, 1, 1, 1, 1,
0.1386334, 1.237323, 0.5928514, 1, 1, 1, 1, 1,
0.144449, 0.1924246, 1.156975, 1, 1, 1, 1, 1,
0.1445591, 0.860104, 0.2220825, 1, 1, 1, 1, 1,
0.146198, 0.8214231, -0.2157818, 1, 1, 1, 1, 1,
0.1465569, -0.9232447, 2.921688, 1, 1, 1, 1, 1,
0.1531022, -0.08814839, 2.448496, 1, 1, 1, 1, 1,
0.1565073, 0.7839538, -1.200698, 1, 1, 1, 1, 1,
0.1585729, 1.027433, -1.300038, 1, 1, 1, 1, 1,
0.1596834, -0.707019, 2.623995, 1, 1, 1, 1, 1,
0.1609179, -1.523873, 2.945522, 1, 1, 1, 1, 1,
0.1634058, -0.137101, 2.931564, 1, 1, 1, 1, 1,
0.1660188, 1.091251, -0.2416517, 0, 0, 1, 1, 1,
0.1727461, 0.08424753, 2.604844, 1, 0, 0, 1, 1,
0.1729912, -1.246031, 3.284137, 1, 0, 0, 1, 1,
0.1732324, 0.7737438, 1.234829, 1, 0, 0, 1, 1,
0.1733736, -1.173308, 3.355465, 1, 0, 0, 1, 1,
0.1770806, 2.241073, 0.3287148, 1, 0, 0, 1, 1,
0.1776102, 0.6779926, -0.7586466, 0, 0, 0, 1, 1,
0.1847462, 0.4025384, 0.2452668, 0, 0, 0, 1, 1,
0.1898946, -0.4178977, 2.436643, 0, 0, 0, 1, 1,
0.1907164, 0.7022408, 0.189757, 0, 0, 0, 1, 1,
0.1911885, -0.2410414, 2.785932, 0, 0, 0, 1, 1,
0.1929711, -0.1132464, 2.5769, 0, 0, 0, 1, 1,
0.1935177, -0.6168811, 1.652106, 0, 0, 0, 1, 1,
0.1980391, 0.5517536, 0.7803173, 1, 1, 1, 1, 1,
0.2007888, 0.3786405, 2.784997, 1, 1, 1, 1, 1,
0.2013569, 0.1531681, 1.28474, 1, 1, 1, 1, 1,
0.2021152, -0.9006832, 2.773439, 1, 1, 1, 1, 1,
0.2021714, -0.356844, 4.64145, 1, 1, 1, 1, 1,
0.2031555, -1.187657, 3.563943, 1, 1, 1, 1, 1,
0.2035989, 0.5794783, -0.9422821, 1, 1, 1, 1, 1,
0.2067996, -2.23327, 2.842643, 1, 1, 1, 1, 1,
0.2069554, -0.9272825, 0.9772205, 1, 1, 1, 1, 1,
0.2078888, -1.003478, 1.349959, 1, 1, 1, 1, 1,
0.2078914, 0.94346, -1.300228, 1, 1, 1, 1, 1,
0.2084556, -0.2239652, 3.863846, 1, 1, 1, 1, 1,
0.2138134, 0.233653, 3.187415, 1, 1, 1, 1, 1,
0.215478, 0.1815082, 0.8421693, 1, 1, 1, 1, 1,
0.2181941, -1.556079, 1.813555, 1, 1, 1, 1, 1,
0.2227447, 0.05948055, 2.206834, 0, 0, 1, 1, 1,
0.2236088, 0.1692631, 1.407724, 1, 0, 0, 1, 1,
0.2257198, 0.2801622, -1.436423, 1, 0, 0, 1, 1,
0.2268623, 0.2084569, 1.729999, 1, 0, 0, 1, 1,
0.227924, 0.637732, -0.2674659, 1, 0, 0, 1, 1,
0.2291617, -1.226617, 3.042322, 1, 0, 0, 1, 1,
0.229994, -0.934949, 1.883404, 0, 0, 0, 1, 1,
0.2343601, -1.418017, 1.006583, 0, 0, 0, 1, 1,
0.2434412, -0.1380736, 3.063191, 0, 0, 0, 1, 1,
0.2440119, -0.6874504, 5.090184, 0, 0, 0, 1, 1,
0.2545161, -2.122697, 4.899182, 0, 0, 0, 1, 1,
0.2554078, 2.167837, -0.221619, 0, 0, 0, 1, 1,
0.2559184, -0.4450458, 2.536035, 0, 0, 0, 1, 1,
0.2584549, 0.09011983, 0.3349655, 1, 1, 1, 1, 1,
0.2605299, 1.380428, -3.719867, 1, 1, 1, 1, 1,
0.2673815, -0.9759241, 2.647398, 1, 1, 1, 1, 1,
0.2679999, 0.6654985, 0.8075975, 1, 1, 1, 1, 1,
0.2712609, -0.7860534, 3.73085, 1, 1, 1, 1, 1,
0.278592, -1.806331, 4.078938, 1, 1, 1, 1, 1,
0.2799956, -0.06395812, 3.589965, 1, 1, 1, 1, 1,
0.2804013, 0.4584544, 0.6173002, 1, 1, 1, 1, 1,
0.2813866, 0.5946516, 1.369572, 1, 1, 1, 1, 1,
0.2857214, -0.63774, 1.992461, 1, 1, 1, 1, 1,
0.287785, 0.1426902, 0.6379891, 1, 1, 1, 1, 1,
0.2909598, 1.066897, 0.4058606, 1, 1, 1, 1, 1,
0.2922607, 0.2818015, 1.864255, 1, 1, 1, 1, 1,
0.292968, -0.1206676, 4.058394, 1, 1, 1, 1, 1,
0.2940108, -0.8589444, 4.394472, 1, 1, 1, 1, 1,
0.2942445, -0.6497262, 4.374445, 0, 0, 1, 1, 1,
0.2957414, 0.3300252, 2.158892, 1, 0, 0, 1, 1,
0.2969493, 0.2412464, 2.648426, 1, 0, 0, 1, 1,
0.2992784, 0.8449614, 0.8931177, 1, 0, 0, 1, 1,
0.3022349, -1.202795, 1.928089, 1, 0, 0, 1, 1,
0.3051189, -0.7515035, 3.667051, 1, 0, 0, 1, 1,
0.3077179, -2.00499, 2.223636, 0, 0, 0, 1, 1,
0.3083431, -1.150144, 2.154937, 0, 0, 0, 1, 1,
0.309085, -1.275424, 2.165424, 0, 0, 0, 1, 1,
0.3110059, -0.007024777, 3.130263, 0, 0, 0, 1, 1,
0.3120581, 0.7577096, 0.6526483, 0, 0, 0, 1, 1,
0.3163269, -0.9367598, 2.695655, 0, 0, 0, 1, 1,
0.3167985, 1.581647, -1.504424, 0, 0, 0, 1, 1,
0.3192143, 2.099125, -1.642027, 1, 1, 1, 1, 1,
0.3229782, -0.5369973, 2.255121, 1, 1, 1, 1, 1,
0.3235148, -0.9137032, 4.619514, 1, 1, 1, 1, 1,
0.3240606, 2.828211, 0.03328552, 1, 1, 1, 1, 1,
0.332622, -0.3797512, 3.212531, 1, 1, 1, 1, 1,
0.3338819, 0.4107546, 1.582092, 1, 1, 1, 1, 1,
0.334188, -0.3736286, 2.462918, 1, 1, 1, 1, 1,
0.3349781, 1.174054, -0.4601208, 1, 1, 1, 1, 1,
0.3365502, 0.01218155, 2.072104, 1, 1, 1, 1, 1,
0.3397159, 0.1874585, 1.586164, 1, 1, 1, 1, 1,
0.347859, 0.5262212, -1.220739, 1, 1, 1, 1, 1,
0.3489815, -0.3208185, 1.615435, 1, 1, 1, 1, 1,
0.3490443, 0.8577628, -0.7835953, 1, 1, 1, 1, 1,
0.3512505, 0.06785931, 1.1384, 1, 1, 1, 1, 1,
0.3524013, 1.139032, 1.035413, 1, 1, 1, 1, 1,
0.3527603, 0.1964108, 1.226845, 0, 0, 1, 1, 1,
0.3533272, 0.7485613, 0.8668078, 1, 0, 0, 1, 1,
0.3596315, -0.5753511, 3.463552, 1, 0, 0, 1, 1,
0.3600574, 0.2056725, 2.13249, 1, 0, 0, 1, 1,
0.366228, -0.7721449, 4.381818, 1, 0, 0, 1, 1,
0.3665965, -0.0576699, 3.119865, 1, 0, 0, 1, 1,
0.3681956, -0.5825368, 1.879608, 0, 0, 0, 1, 1,
0.3682165, 0.9539931, 0.3386475, 0, 0, 0, 1, 1,
0.3721351, 0.8404627, 0.9224539, 0, 0, 0, 1, 1,
0.3733555, -0.5287708, 3.74736, 0, 0, 0, 1, 1,
0.3800936, -0.1420485, 1.869074, 0, 0, 0, 1, 1,
0.3833318, 0.7439899, 0.1077821, 0, 0, 0, 1, 1,
0.3835661, 0.072276, 0.7229034, 0, 0, 0, 1, 1,
0.3845504, -1.225979, 1.711165, 1, 1, 1, 1, 1,
0.3902873, -0.02145714, 0.5815794, 1, 1, 1, 1, 1,
0.3942414, -0.3499012, 2.027829, 1, 1, 1, 1, 1,
0.3955793, -0.6691604, 2.164123, 1, 1, 1, 1, 1,
0.3983931, 0.437774, 0.8812712, 1, 1, 1, 1, 1,
0.3991432, 1.275365, -1.283646, 1, 1, 1, 1, 1,
0.4004491, -2.184709, 2.349605, 1, 1, 1, 1, 1,
0.4083832, 0.3968433, 1.1955, 1, 1, 1, 1, 1,
0.4107554, 0.6744438, 1.457111, 1, 1, 1, 1, 1,
0.4107773, 1.110838, 1.843473, 1, 1, 1, 1, 1,
0.4179673, -1.460449, 3.214784, 1, 1, 1, 1, 1,
0.418155, 1.597075, 1.16431, 1, 1, 1, 1, 1,
0.4204981, 0.103494, 0.2673087, 1, 1, 1, 1, 1,
0.4208339, -1.608931, 3.662515, 1, 1, 1, 1, 1,
0.4222851, 0.3185632, 0.9179534, 1, 1, 1, 1, 1,
0.4224857, -0.3293126, 1.358089, 0, 0, 1, 1, 1,
0.4241472, 1.176932, 0.4664195, 1, 0, 0, 1, 1,
0.4247903, 0.2086676, 0.9471554, 1, 0, 0, 1, 1,
0.4256975, -0.3709565, 2.145894, 1, 0, 0, 1, 1,
0.4270633, 0.7958061, 2.163614, 1, 0, 0, 1, 1,
0.4288479, -0.2803282, 2.870242, 1, 0, 0, 1, 1,
0.4307911, -0.9361769, 2.809727, 0, 0, 0, 1, 1,
0.4315732, 0.4990344, 0.3537456, 0, 0, 0, 1, 1,
0.4341708, -0.6136498, 3.712695, 0, 0, 0, 1, 1,
0.4389738, -1.298041, 2.467969, 0, 0, 0, 1, 1,
0.4417344, -0.6321775, 1.174955, 0, 0, 0, 1, 1,
0.4417553, 2.892661, 0.4233307, 0, 0, 0, 1, 1,
0.4421259, -0.00514812, 1.060402, 0, 0, 0, 1, 1,
0.4444422, 0.4478922, -0.981031, 1, 1, 1, 1, 1,
0.4478374, 1.505473, 0.2156976, 1, 1, 1, 1, 1,
0.4591926, 1.361379, 0.2611681, 1, 1, 1, 1, 1,
0.4592598, -0.4293279, 4.906722, 1, 1, 1, 1, 1,
0.4634072, -1.123691, 2.139733, 1, 1, 1, 1, 1,
0.4643021, 1.073897, 0.3256856, 1, 1, 1, 1, 1,
0.4654494, 0.2620051, 0.9085829, 1, 1, 1, 1, 1,
0.4660078, -0.2073964, 0.3408671, 1, 1, 1, 1, 1,
0.4740302, -0.924587, 2.359313, 1, 1, 1, 1, 1,
0.4748152, -0.4216653, 2.02276, 1, 1, 1, 1, 1,
0.4814025, -0.580403, 1.907785, 1, 1, 1, 1, 1,
0.4836816, -0.4184973, 3.140465, 1, 1, 1, 1, 1,
0.4837163, 0.6539652, 1.964903, 1, 1, 1, 1, 1,
0.4851432, -0.1290464, 0.463159, 1, 1, 1, 1, 1,
0.485245, -1.004776, 2.526332, 1, 1, 1, 1, 1,
0.4857011, -0.3689941, 2.344253, 0, 0, 1, 1, 1,
0.4881961, 1.289355, 0.8932941, 1, 0, 0, 1, 1,
0.4957498, -0.1008272, 0.3958682, 1, 0, 0, 1, 1,
0.4984593, -0.1205539, 1.950441, 1, 0, 0, 1, 1,
0.4992357, -0.1882649, 0.5234948, 1, 0, 0, 1, 1,
0.5016887, -0.3652363, 2.391711, 1, 0, 0, 1, 1,
0.5020806, -0.2261829, 0.6171852, 0, 0, 0, 1, 1,
0.502682, -0.3748337, 0.4109381, 0, 0, 0, 1, 1,
0.5176104, -0.4844842, 2.370757, 0, 0, 0, 1, 1,
0.5182047, -0.374571, 3.343886, 0, 0, 0, 1, 1,
0.5188201, 0.4849795, 0.02269815, 0, 0, 0, 1, 1,
0.5189154, 1.499025, -0.2015978, 0, 0, 0, 1, 1,
0.5335305, 3.426535, 0.2514234, 0, 0, 0, 1, 1,
0.5351149, 0.6979091, -0.1219578, 1, 1, 1, 1, 1,
0.5355532, -1.604942, 1.383618, 1, 1, 1, 1, 1,
0.5366453, -0.4093417, 2.781805, 1, 1, 1, 1, 1,
0.5392648, 0.126605, 1.502547, 1, 1, 1, 1, 1,
0.5412087, 0.2104266, 1.77616, 1, 1, 1, 1, 1,
0.5432561, -0.2013762, 2.934156, 1, 1, 1, 1, 1,
0.5477442, -1.410502, 3.015424, 1, 1, 1, 1, 1,
0.5530195, 0.9386701, -0.2957258, 1, 1, 1, 1, 1,
0.5595313, 0.09043147, 0.5414693, 1, 1, 1, 1, 1,
0.5611256, -0.05890068, 0.958647, 1, 1, 1, 1, 1,
0.5655255, -1.425371, 4.325743, 1, 1, 1, 1, 1,
0.5657684, 0.0961052, -0.6814494, 1, 1, 1, 1, 1,
0.56581, -0.9581817, 2.579824, 1, 1, 1, 1, 1,
0.5661874, 2.007325, 0.3012924, 1, 1, 1, 1, 1,
0.5688584, -0.7365474, 2.140675, 1, 1, 1, 1, 1,
0.5737159, -0.3500605, 1.779818, 0, 0, 1, 1, 1,
0.577068, -0.565078, 0.4844771, 1, 0, 0, 1, 1,
0.5814573, 0.4435931, 2.482439, 1, 0, 0, 1, 1,
0.5815977, -1.632511, 3.253323, 1, 0, 0, 1, 1,
0.5834829, 0.1197743, 2.82037, 1, 0, 0, 1, 1,
0.5842814, 0.9255233, -0.05064997, 1, 0, 0, 1, 1,
0.5966778, 0.4271273, 2.000717, 0, 0, 0, 1, 1,
0.5993097, -0.03008659, 1.317117, 0, 0, 0, 1, 1,
0.6013193, -1.430713, 3.921124, 0, 0, 0, 1, 1,
0.606592, 0.664041, 0.7679391, 0, 0, 0, 1, 1,
0.6077558, -1.082729, 2.341426, 0, 0, 0, 1, 1,
0.6083848, 0.01515844, 1.129499, 0, 0, 0, 1, 1,
0.6127102, -0.6660471, 1.352908, 0, 0, 0, 1, 1,
0.6172029, -0.234439, 2.758223, 1, 1, 1, 1, 1,
0.6185026, 1.26125, 1.160292, 1, 1, 1, 1, 1,
0.6311869, 2.653064, 2.190281, 1, 1, 1, 1, 1,
0.633482, -1.380978, 2.60653, 1, 1, 1, 1, 1,
0.6349307, 0.3507504, 0.2395174, 1, 1, 1, 1, 1,
0.6353403, 0.1663, 1.528764, 1, 1, 1, 1, 1,
0.6392081, -0.2323933, -0.6975749, 1, 1, 1, 1, 1,
0.6427845, -1.085351, 1.462591, 1, 1, 1, 1, 1,
0.6438136, 0.5001706, 0.078674, 1, 1, 1, 1, 1,
0.6475087, -1.223715, 2.967819, 1, 1, 1, 1, 1,
0.6488412, -0.2154455, 1.366361, 1, 1, 1, 1, 1,
0.6528858, 4.160759, 0.04884972, 1, 1, 1, 1, 1,
0.6563215, -0.6274773, 2.010088, 1, 1, 1, 1, 1,
0.6615269, -0.5887006, 1.604499, 1, 1, 1, 1, 1,
0.6624951, 0.7058827, 1.104275, 1, 1, 1, 1, 1,
0.6657056, -0.5021107, 2.839252, 0, 0, 1, 1, 1,
0.6679155, 0.7239354, 0.695633, 1, 0, 0, 1, 1,
0.6693066, 0.2655572, 1.049269, 1, 0, 0, 1, 1,
0.6696557, 0.0001415224, 2.9268, 1, 0, 0, 1, 1,
0.6699067, 0.4179063, 1.308272, 1, 0, 0, 1, 1,
0.6754432, -0.2965367, 2.302595, 1, 0, 0, 1, 1,
0.6788875, -1.830842, 1.374939, 0, 0, 0, 1, 1,
0.6802241, -1.173144, 3.897581, 0, 0, 0, 1, 1,
0.681367, -0.01102953, 1.603591, 0, 0, 0, 1, 1,
0.6845286, -0.1429611, 3.499519, 0, 0, 0, 1, 1,
0.6883737, -1.154254, 2.945687, 0, 0, 0, 1, 1,
0.6916075, -0.7444731, 2.402514, 0, 0, 0, 1, 1,
0.7023011, 1.528057, -0.8138406, 0, 0, 0, 1, 1,
0.7073042, 0.01266566, 2.554693, 1, 1, 1, 1, 1,
0.709256, 0.2615622, 1.86493, 1, 1, 1, 1, 1,
0.7147146, -1.450001, 2.437808, 1, 1, 1, 1, 1,
0.7168735, 1.230649, 1.241158, 1, 1, 1, 1, 1,
0.7188335, -1.044299, 3.260362, 1, 1, 1, 1, 1,
0.7204366, -0.4696627, 2.283552, 1, 1, 1, 1, 1,
0.7242667, 0.3036227, 1.498984, 1, 1, 1, 1, 1,
0.7257264, 0.5988793, 0.9802216, 1, 1, 1, 1, 1,
0.7263399, -1.804639, 1.502275, 1, 1, 1, 1, 1,
0.7329646, 1.831846, 0.8942503, 1, 1, 1, 1, 1,
0.7339512, 1.240354, 0.5106755, 1, 1, 1, 1, 1,
0.7344697, -1.296212, 2.968503, 1, 1, 1, 1, 1,
0.7346911, -0.7256427, 2.298274, 1, 1, 1, 1, 1,
0.738108, -0.3102646, 1.651852, 1, 1, 1, 1, 1,
0.74116, 0.9930788, 0.4791967, 1, 1, 1, 1, 1,
0.7425397, -0.5532617, 1.797449, 0, 0, 1, 1, 1,
0.7432311, -0.02216478, 2.713209, 1, 0, 0, 1, 1,
0.7447163, -1.2016, 2.228726, 1, 0, 0, 1, 1,
0.745889, 0.01402698, 1.2555, 1, 0, 0, 1, 1,
0.757421, -0.5214189, 1.447962, 1, 0, 0, 1, 1,
0.7606474, -1.146904, 3.616258, 1, 0, 0, 1, 1,
0.7684283, -0.002071568, 1.928672, 0, 0, 0, 1, 1,
0.7718282, -0.4131522, 2.257481, 0, 0, 0, 1, 1,
0.775728, 1.371406, 2.031527, 0, 0, 0, 1, 1,
0.7760564, -0.5376769, 2.586637, 0, 0, 0, 1, 1,
0.7819139, 0.4746476, 1.160925, 0, 0, 0, 1, 1,
0.7858154, 1.912704, 2.202096, 0, 0, 0, 1, 1,
0.7927759, 0.8345271, -0.2072176, 0, 0, 0, 1, 1,
0.7959189, -0.4082253, 2.242981, 1, 1, 1, 1, 1,
0.7988877, -0.5204415, 2.611801, 1, 1, 1, 1, 1,
0.802875, -0.03284751, 0.9201907, 1, 1, 1, 1, 1,
0.8034869, -0.01747229, 2.026998, 1, 1, 1, 1, 1,
0.8038461, -0.9977427, 2.194634, 1, 1, 1, 1, 1,
0.8076278, -0.2489368, 0.9763838, 1, 1, 1, 1, 1,
0.809826, -0.06026468, 2.918479, 1, 1, 1, 1, 1,
0.814307, 1.142996, 0.6959565, 1, 1, 1, 1, 1,
0.8148315, -1.284141, 3.412387, 1, 1, 1, 1, 1,
0.8148344, -0.3465259, 1.835647, 1, 1, 1, 1, 1,
0.819027, -0.5825642, 2.576946, 1, 1, 1, 1, 1,
0.8240573, 0.3105134, 1.417456, 1, 1, 1, 1, 1,
0.8317879, -0.05586164, 1.100036, 1, 1, 1, 1, 1,
0.8339247, 0.1502866, 0.915998, 1, 1, 1, 1, 1,
0.8441192, -0.7015366, 1.233825, 1, 1, 1, 1, 1,
0.8498082, 0.6114407, -0.204551, 0, 0, 1, 1, 1,
0.8506446, -0.4708799, 2.560515, 1, 0, 0, 1, 1,
0.8549094, -0.7745801, 1.342909, 1, 0, 0, 1, 1,
0.8577099, 0.894136, 1.065723, 1, 0, 0, 1, 1,
0.8595644, 1.057604, -1.184313, 1, 0, 0, 1, 1,
0.8597655, 0.6092218, 1.785252, 1, 0, 0, 1, 1,
0.8624388, 0.4377698, 1.181945, 0, 0, 0, 1, 1,
0.8692945, 0.001441026, 2.993155, 0, 0, 0, 1, 1,
0.8760827, -0.2872519, 2.054556, 0, 0, 0, 1, 1,
0.878733, -0.3547964, 1.66381, 0, 0, 0, 1, 1,
0.8797746, 0.08465746, 0.9176922, 0, 0, 0, 1, 1,
0.8887959, -1.125293, 2.904001, 0, 0, 0, 1, 1,
0.8906512, -0.3090805, 1.561953, 0, 0, 0, 1, 1,
0.8924176, 0.04704867, 1.19554, 1, 1, 1, 1, 1,
0.8945112, 0.3683166, 2.074529, 1, 1, 1, 1, 1,
0.8960015, -0.02317832, -0.3225381, 1, 1, 1, 1, 1,
0.8982633, -1.496273, 1.918163, 1, 1, 1, 1, 1,
0.9002635, 0.4392076, 1.175121, 1, 1, 1, 1, 1,
0.901268, -1.816398, 5.04381, 1, 1, 1, 1, 1,
0.9063483, 0.9870743, 1.254853, 1, 1, 1, 1, 1,
0.9072062, 0.2386, 1.804667, 1, 1, 1, 1, 1,
0.9111514, 2.374541, -0.6228374, 1, 1, 1, 1, 1,
0.9124034, -0.515632, 2.399775, 1, 1, 1, 1, 1,
0.915066, -2.069737, 2.50624, 1, 1, 1, 1, 1,
0.918067, -0.8140351, 2.591511, 1, 1, 1, 1, 1,
0.9194419, 1.145264, 0.7608784, 1, 1, 1, 1, 1,
0.9217177, 0.8619527, -0.3521625, 1, 1, 1, 1, 1,
0.9232643, 0.6611861, 0.4587086, 1, 1, 1, 1, 1,
0.9275997, -0.2231291, 1.160305, 0, 0, 1, 1, 1,
0.9277002, -0.1285033, 2.415201, 1, 0, 0, 1, 1,
0.9317587, 0.3737401, -0.8219573, 1, 0, 0, 1, 1,
0.9347801, 1.47277, 1.597379, 1, 0, 0, 1, 1,
0.9386988, 0.2205422, 0.9992666, 1, 0, 0, 1, 1,
0.9405855, -1.5858, 4.050973, 1, 0, 0, 1, 1,
0.9410909, 1.400594, 0.09709415, 0, 0, 0, 1, 1,
0.9443653, 1.063538, 1.349099, 0, 0, 0, 1, 1,
0.9492527, 1.185999, 1.016932, 0, 0, 0, 1, 1,
0.9575223, 1.416314, 0.2553434, 0, 0, 0, 1, 1,
0.9645952, 0.3298427, 2.772064, 0, 0, 0, 1, 1,
0.9665643, 0.6765859, 1.064551, 0, 0, 0, 1, 1,
0.9683097, 2.420125, 0.02001168, 0, 0, 0, 1, 1,
0.9698754, -0.09776402, 2.606185, 1, 1, 1, 1, 1,
0.9737827, 0.2044887, 2.639382, 1, 1, 1, 1, 1,
0.9799869, -0.1004886, 2.950578, 1, 1, 1, 1, 1,
0.9813775, 0.2599734, 3.11427, 1, 1, 1, 1, 1,
0.9912763, 1.543593, 1.510838, 1, 1, 1, 1, 1,
0.9988531, 0.5959474, 1.618101, 1, 1, 1, 1, 1,
1.000761, -0.1393555, -0.1119081, 1, 1, 1, 1, 1,
1.000841, -0.1714702, 1.181291, 1, 1, 1, 1, 1,
1.010087, -0.2511133, 2.718473, 1, 1, 1, 1, 1,
1.013804, -0.560142, 2.245999, 1, 1, 1, 1, 1,
1.018956, -0.7345756, 2.676468, 1, 1, 1, 1, 1,
1.028907, -0.5988567, 3.263151, 1, 1, 1, 1, 1,
1.028993, 1.765671, -0.2682467, 1, 1, 1, 1, 1,
1.029176, 0.233115, 2.315736, 1, 1, 1, 1, 1,
1.032187, 0.1507043, 0.9610756, 1, 1, 1, 1, 1,
1.032863, -0.2031874, -0.1142685, 0, 0, 1, 1, 1,
1.038184, 0.3610438, 1.896672, 1, 0, 0, 1, 1,
1.045004, -0.4687559, 0.3692556, 1, 0, 0, 1, 1,
1.049426, 2.40189, 1.212747, 1, 0, 0, 1, 1,
1.0501, 1.773218, 0.8024351, 1, 0, 0, 1, 1,
1.053608, 0.7125083, -0.5230508, 1, 0, 0, 1, 1,
1.066014, -1.237675, 2.151199, 0, 0, 0, 1, 1,
1.067428, -0.2004611, 2.080778, 0, 0, 0, 1, 1,
1.069168, 0.4713047, 2.08127, 0, 0, 0, 1, 1,
1.069696, 0.02823093, 1.322912, 0, 0, 0, 1, 1,
1.086489, -0.3063017, 2.829768, 0, 0, 0, 1, 1,
1.090869, -0.4132312, 2.071198, 0, 0, 0, 1, 1,
1.09447, -0.3557382, 1.737994, 0, 0, 0, 1, 1,
1.095188, -1.075945, 2.868674, 1, 1, 1, 1, 1,
1.099917, -2.326608, 1.938178, 1, 1, 1, 1, 1,
1.100329, -0.5327932, 3.182299, 1, 1, 1, 1, 1,
1.111771, -0.95841, 2.750377, 1, 1, 1, 1, 1,
1.118943, -0.7336586, 2.829004, 1, 1, 1, 1, 1,
1.123496, 0.5398017, 1.395021, 1, 1, 1, 1, 1,
1.136971, -0.08178248, 0.7205217, 1, 1, 1, 1, 1,
1.140698, 0.07765475, 0.5789449, 1, 1, 1, 1, 1,
1.144532, -0.879575, 2.215038, 1, 1, 1, 1, 1,
1.144908, 0.1771749, 1.100188, 1, 1, 1, 1, 1,
1.149671, -0.7342342, 0.7866724, 1, 1, 1, 1, 1,
1.150018, -0.07177367, 1.329316, 1, 1, 1, 1, 1,
1.156906, -0.2168428, 1.164945, 1, 1, 1, 1, 1,
1.162541, 0.267274, -0.9334933, 1, 1, 1, 1, 1,
1.163581, 0.6027048, 0.7726616, 1, 1, 1, 1, 1,
1.166439, -1.577324, 3.268876, 0, 0, 1, 1, 1,
1.166735, -1.626639, 1.733459, 1, 0, 0, 1, 1,
1.168109, 1.333959, 1.747821, 1, 0, 0, 1, 1,
1.169421, 0.7980554, 1.056695, 1, 0, 0, 1, 1,
1.172325, -1.226215, 1.394273, 1, 0, 0, 1, 1,
1.182011, 1.23109, 1.234557, 1, 0, 0, 1, 1,
1.203913, 1.36937, -1.258848, 0, 0, 0, 1, 1,
1.206321, 0.1126623, 0.7579545, 0, 0, 0, 1, 1,
1.207443, 0.6162027, 0.2189737, 0, 0, 0, 1, 1,
1.208672, -0.2835046, 0.2443669, 0, 0, 0, 1, 1,
1.212691, -1.055047, 2.587669, 0, 0, 0, 1, 1,
1.215356, -0.08253247, 1.159457, 0, 0, 0, 1, 1,
1.215362, 0.1283804, 1.904569, 0, 0, 0, 1, 1,
1.230306, -2.451002, 3.391258, 1, 1, 1, 1, 1,
1.23724, -0.2539581, 1.460978, 1, 1, 1, 1, 1,
1.239189, -1.55287, 2.607004, 1, 1, 1, 1, 1,
1.242983, 0.7963579, -0.1848815, 1, 1, 1, 1, 1,
1.243539, 0.518028, 1.522495, 1, 1, 1, 1, 1,
1.249321, 0.005101529, -0.2995149, 1, 1, 1, 1, 1,
1.25936, -0.3047494, 4.391744, 1, 1, 1, 1, 1,
1.27389, -0.07229325, 1.392587, 1, 1, 1, 1, 1,
1.274176, 1.982197, -1.389159, 1, 1, 1, 1, 1,
1.282679, 0.6041164, 0.6663333, 1, 1, 1, 1, 1,
1.290075, 1.714472, 0.7281004, 1, 1, 1, 1, 1,
1.29457, 0.9300473, 0.3195688, 1, 1, 1, 1, 1,
1.299644, -1.547314, 3.476519, 1, 1, 1, 1, 1,
1.300013, -1.044767, 2.681005, 1, 1, 1, 1, 1,
1.308951, -0.1452491, 1.269723, 1, 1, 1, 1, 1,
1.318411, 0.364104, 2.171927, 0, 0, 1, 1, 1,
1.324634, 1.041386, 1.370229, 1, 0, 0, 1, 1,
1.351125, 1.146518, -0.8453002, 1, 0, 0, 1, 1,
1.353231, 1.045914, 1.229872, 1, 0, 0, 1, 1,
1.354075, 1.515809, -0.9025409, 1, 0, 0, 1, 1,
1.358555, -0.6585422, 3.740428, 1, 0, 0, 1, 1,
1.373077, -1.022155, 1.619715, 0, 0, 0, 1, 1,
1.373505, 0.4701873, 3.846664, 0, 0, 0, 1, 1,
1.374352, 1.315531, -0.2294707, 0, 0, 0, 1, 1,
1.375608, 0.05294975, -1.022351, 0, 0, 0, 1, 1,
1.394268, 2.277347, -0.3138145, 0, 0, 0, 1, 1,
1.403363, 0.791585, -0.08561485, 0, 0, 0, 1, 1,
1.40672, -0.5544516, 3.791592, 0, 0, 0, 1, 1,
1.409735, -0.1644164, 2.482327, 1, 1, 1, 1, 1,
1.414234, 0.5629747, 1.362632, 1, 1, 1, 1, 1,
1.427942, 0.4999257, 0.9137718, 1, 1, 1, 1, 1,
1.432278, 2.150954, 2.292, 1, 1, 1, 1, 1,
1.433266, -0.05184241, 0.8997236, 1, 1, 1, 1, 1,
1.441855, 0.05848997, 2.238624, 1, 1, 1, 1, 1,
1.445424, 1.444745, -1.577043, 1, 1, 1, 1, 1,
1.453145, -1.14803, 2.855519, 1, 1, 1, 1, 1,
1.454302, 0.6050577, 1.609891, 1, 1, 1, 1, 1,
1.454854, -1.351755, 2.483674, 1, 1, 1, 1, 1,
1.457755, -0.3009637, 1.527946, 1, 1, 1, 1, 1,
1.461827, -1.996492, 2.814514, 1, 1, 1, 1, 1,
1.463795, -2.318709, 2.423677, 1, 1, 1, 1, 1,
1.484593, 1.199434, 0.6683933, 1, 1, 1, 1, 1,
1.496039, -0.9039423, 1.628634, 1, 1, 1, 1, 1,
1.498693, 0.7827432, 1.933718, 0, 0, 1, 1, 1,
1.501818, 0.2179281, 0.95621, 1, 0, 0, 1, 1,
1.509178, 0.5697538, 0.3704339, 1, 0, 0, 1, 1,
1.518307, -0.4161461, 1.21458, 1, 0, 0, 1, 1,
1.530279, -0.3348892, 1.581473, 1, 0, 0, 1, 1,
1.532311, 0.3821768, 0.8937329, 1, 0, 0, 1, 1,
1.543357, 1.844102, 2.594435, 0, 0, 0, 1, 1,
1.54589, -0.8882312, 0.9142204, 0, 0, 0, 1, 1,
1.547212, 0.169623, 2.961672, 0, 0, 0, 1, 1,
1.560003, -0.7776363, 2.419493, 0, 0, 0, 1, 1,
1.570908, 0.3515553, -0.1477048, 0, 0, 0, 1, 1,
1.571567, -1.412088, 2.730405, 0, 0, 0, 1, 1,
1.575689, -0.309373, 0.5322108, 0, 0, 0, 1, 1,
1.588576, 1.595437, 0.2566468, 1, 1, 1, 1, 1,
1.609112, 0.6532907, 1.823951, 1, 1, 1, 1, 1,
1.616279, 0.9252839, 0.5423825, 1, 1, 1, 1, 1,
1.618096, 0.1738485, 0.6055541, 1, 1, 1, 1, 1,
1.622972, -0.7640449, 3.250289, 1, 1, 1, 1, 1,
1.624486, 1.62162, 0.9492768, 1, 1, 1, 1, 1,
1.624834, 0.4367612, 0.4224764, 1, 1, 1, 1, 1,
1.625172, -0.688584, 2.018751, 1, 1, 1, 1, 1,
1.63076, -0.6449071, 2.719581, 1, 1, 1, 1, 1,
1.636326, 0.3522641, 1.709064, 1, 1, 1, 1, 1,
1.648112, -1.524163, 2.68847, 1, 1, 1, 1, 1,
1.657842, 0.4107077, 1.056535, 1, 1, 1, 1, 1,
1.667637, -0.3367747, 1.057468, 1, 1, 1, 1, 1,
1.673583, -1.761387, 1.996358, 1, 1, 1, 1, 1,
1.67875, -0.1099211, 2.458035, 1, 1, 1, 1, 1,
1.681757, -0.5826961, 0.6103166, 0, 0, 1, 1, 1,
1.682886, -0.7708019, 1.887019, 1, 0, 0, 1, 1,
1.689833, -1.449332, 0.6790726, 1, 0, 0, 1, 1,
1.696469, 2.386316, 1.482028, 1, 0, 0, 1, 1,
1.72987, 1.817048, 0.09294026, 1, 0, 0, 1, 1,
1.730471, 0.8864774, -0.4321396, 1, 0, 0, 1, 1,
1.734259, -0.8165921, 3.948578, 0, 0, 0, 1, 1,
1.744012, 1.209869, 1.044468, 0, 0, 0, 1, 1,
1.756202, 0.3582835, -1.123038, 0, 0, 0, 1, 1,
1.76274, 1.655155, 0.4849131, 0, 0, 0, 1, 1,
1.76759, -0.3059451, 1.420799, 0, 0, 0, 1, 1,
1.775502, 1.018578, 0.9230103, 0, 0, 0, 1, 1,
1.776636, -0.781679, 0.726805, 0, 0, 0, 1, 1,
1.776704, -0.4777142, 2.161811, 1, 1, 1, 1, 1,
1.798154, -1.498116, 1.480552, 1, 1, 1, 1, 1,
1.823027, 1.167627, 2.022535, 1, 1, 1, 1, 1,
1.823654, -0.09040406, 1.918352, 1, 1, 1, 1, 1,
1.826917, -0.5082957, 2.574462, 1, 1, 1, 1, 1,
1.835892, 0.2559175, 1.511964, 1, 1, 1, 1, 1,
1.85205, 1.358797, 1.020397, 1, 1, 1, 1, 1,
1.855549, -1.206114, 0.8616412, 1, 1, 1, 1, 1,
1.872748, -1.492235, 1.767971, 1, 1, 1, 1, 1,
1.921173, 0.4421976, 2.404837, 1, 1, 1, 1, 1,
1.925045, 0.05389223, 0.4381629, 1, 1, 1, 1, 1,
1.959673, -1.381805, 1.885941, 1, 1, 1, 1, 1,
1.97028, 0.1362849, 0.3981192, 1, 1, 1, 1, 1,
1.979443, 0.8002654, 0.498751, 1, 1, 1, 1, 1,
1.9888, -1.395276, 2.716767, 1, 1, 1, 1, 1,
2.017909, 0.892029, -0.3799443, 0, 0, 1, 1, 1,
2.019218, 0.5348201, 2.369739, 1, 0, 0, 1, 1,
2.025424, -0.7792648, 3.380255, 1, 0, 0, 1, 1,
2.049963, 0.6195827, 0.9055579, 1, 0, 0, 1, 1,
2.061935, 0.4014351, 0.7516146, 1, 0, 0, 1, 1,
2.064857, -0.3898327, 3.246226, 1, 0, 0, 1, 1,
2.075181, -1.287526, 1.745304, 0, 0, 0, 1, 1,
2.17021, -1.005161, 0.9391006, 0, 0, 0, 1, 1,
2.184176, 1.293013, 0.6699964, 0, 0, 0, 1, 1,
2.203555, -0.1259869, 4.184553, 0, 0, 0, 1, 1,
2.245233, 1.594028, 2.74265, 0, 0, 0, 1, 1,
2.296873, -0.2319878, 1.71258, 0, 0, 0, 1, 1,
2.321916, 1.221286, 0.2127145, 0, 0, 0, 1, 1,
2.370173, -0.05111614, 2.084723, 1, 1, 1, 1, 1,
2.382633, -0.109426, 1.59132, 1, 1, 1, 1, 1,
2.566427, -2.034622, 3.520172, 1, 1, 1, 1, 1,
2.587478, -0.3121943, -0.2682421, 1, 1, 1, 1, 1,
2.711761, 0.9741225, 3.521571, 1, 1, 1, 1, 1,
2.741375, 0.166746, 0.4618914, 1, 1, 1, 1, 1,
2.950614, 0.8892322, 0.005300498, 1, 1, 1, 1, 1
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
var radius = 9.803087;
var distance = 34.43293;
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
mvMatrix.translate( -0.006035805, -0.5087304, 0.06675506 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.43293);
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
