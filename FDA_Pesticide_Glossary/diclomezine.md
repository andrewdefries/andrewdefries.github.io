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
-3.512836, -1.450313, -2.286866, 1, 0, 0, 1,
-2.759728, -0.4977537, -0.2357328, 1, 0.007843138, 0, 1,
-2.592264, -2.468761, -2.667806, 1, 0.01176471, 0, 1,
-2.571974, -1.096544, -1.273983, 1, 0.01960784, 0, 1,
-2.335755, 0.2872471, -2.345048, 1, 0.02352941, 0, 1,
-2.265431, -0.1472104, -1.51066, 1, 0.03137255, 0, 1,
-2.211218, -0.2558361, -1.050766, 1, 0.03529412, 0, 1,
-2.150795, 0.06798971, -1.751793, 1, 0.04313726, 0, 1,
-2.140149, 1.249494, -0.4710563, 1, 0.04705882, 0, 1,
-2.137022, 0.4930151, -0.7447624, 1, 0.05490196, 0, 1,
-2.1177, -0.4539446, -1.604858, 1, 0.05882353, 0, 1,
-2.104639, -1.328331, -1.258742, 1, 0.06666667, 0, 1,
-2.085382, 1.501823, -1.422, 1, 0.07058824, 0, 1,
-2.085323, -0.4476922, -2.481838, 1, 0.07843138, 0, 1,
-2.07587, 1.552698, -2.282447, 1, 0.08235294, 0, 1,
-2.063955, 2.002039, -1.054625, 1, 0.09019608, 0, 1,
-2.036188, -1.253182, -2.755119, 1, 0.09411765, 0, 1,
-2.014758, -0.4573359, -1.507705, 1, 0.1019608, 0, 1,
-1.97577, -0.08139396, -0.9826252, 1, 0.1098039, 0, 1,
-1.948099, 0.4491202, -1.120203, 1, 0.1137255, 0, 1,
-1.943125, -1.481292, -2.925742, 1, 0.1215686, 0, 1,
-1.939748, 0.2143486, 0.8629905, 1, 0.1254902, 0, 1,
-1.921469, 1.15168, -0.8157477, 1, 0.1333333, 0, 1,
-1.917029, -2.433593, -1.202314, 1, 0.1372549, 0, 1,
-1.897839, -0.2922856, -1.831473, 1, 0.145098, 0, 1,
-1.851534, -0.6602601, -1.8116, 1, 0.1490196, 0, 1,
-1.834469, 0.008559886, -2.037384, 1, 0.1568628, 0, 1,
-1.832054, -0.3108496, -3.064705, 1, 0.1607843, 0, 1,
-1.81983, 1.52169, -0.7540491, 1, 0.1686275, 0, 1,
-1.818261, -0.2362398, -1.771904, 1, 0.172549, 0, 1,
-1.808093, -1.221779, -1.639052, 1, 0.1803922, 0, 1,
-1.777252, -2.209778, -2.262423, 1, 0.1843137, 0, 1,
-1.774858, -1.704839, -0.7216924, 1, 0.1921569, 0, 1,
-1.768131, 0.833148, -0.2389446, 1, 0.1960784, 0, 1,
-1.708676, -0.1830185, -2.559708, 1, 0.2039216, 0, 1,
-1.707766, 1.574733, -0.6041771, 1, 0.2117647, 0, 1,
-1.705838, 1.302894, -1.559968, 1, 0.2156863, 0, 1,
-1.69998, 0.1064117, -1.909237, 1, 0.2235294, 0, 1,
-1.693334, 1.581585, 0.2019161, 1, 0.227451, 0, 1,
-1.688216, 0.1909562, -0.44698, 1, 0.2352941, 0, 1,
-1.687194, -0.7592993, -1.341775, 1, 0.2392157, 0, 1,
-1.648399, 0.8744267, -2.498032, 1, 0.2470588, 0, 1,
-1.636002, -0.3900937, -2.189187, 1, 0.2509804, 0, 1,
-1.633422, -1.252841, -1.496268, 1, 0.2588235, 0, 1,
-1.630641, -0.01322837, -3.0384, 1, 0.2627451, 0, 1,
-1.624328, -0.8402302, -3.350393, 1, 0.2705882, 0, 1,
-1.619879, -0.004639384, -1.836413, 1, 0.2745098, 0, 1,
-1.599338, 0.6530012, -1.511639, 1, 0.282353, 0, 1,
-1.595599, 0.4442643, -1.568566, 1, 0.2862745, 0, 1,
-1.587278, -1.414724, -1.950699, 1, 0.2941177, 0, 1,
-1.57041, 1.422961, -2.280324, 1, 0.3019608, 0, 1,
-1.568533, -1.146888, -1.59128, 1, 0.3058824, 0, 1,
-1.562353, -0.06291921, -2.075179, 1, 0.3137255, 0, 1,
-1.560827, 0.8235289, -0.159146, 1, 0.3176471, 0, 1,
-1.555928, 2.147563, -1.693093, 1, 0.3254902, 0, 1,
-1.554806, -1.907445, -3.121302, 1, 0.3294118, 0, 1,
-1.551321, 0.8821341, -1.493919, 1, 0.3372549, 0, 1,
-1.548344, 0.4501226, -2.575157, 1, 0.3411765, 0, 1,
-1.547217, -0.02570216, -1.95777, 1, 0.3490196, 0, 1,
-1.5401, -1.124879, -3.732998, 1, 0.3529412, 0, 1,
-1.532771, -3.116691, -2.17468, 1, 0.3607843, 0, 1,
-1.526039, 1.624034, -2.028007, 1, 0.3647059, 0, 1,
-1.516595, -1.100133, -3.136041, 1, 0.372549, 0, 1,
-1.505939, -0.1219589, -1.253337, 1, 0.3764706, 0, 1,
-1.495083, -0.1179263, -1.386403, 1, 0.3843137, 0, 1,
-1.493032, -1.69818, -3.119206, 1, 0.3882353, 0, 1,
-1.475909, -0.5617896, -3.376969, 1, 0.3960784, 0, 1,
-1.470085, -0.897029, -1.827473, 1, 0.4039216, 0, 1,
-1.46688, -0.5161224, -1.38392, 1, 0.4078431, 0, 1,
-1.453143, -1.165321, -1.227969, 1, 0.4156863, 0, 1,
-1.423315, 0.660061, -1.071001, 1, 0.4196078, 0, 1,
-1.41556, 0.8498312, -2.267967, 1, 0.427451, 0, 1,
-1.410605, -0.2595217, -1.131337, 1, 0.4313726, 0, 1,
-1.40817, -1.287382, -3.410298, 1, 0.4392157, 0, 1,
-1.399025, 2.060931, -1.916452, 1, 0.4431373, 0, 1,
-1.397895, -0.2096866, -0.7959126, 1, 0.4509804, 0, 1,
-1.390442, -1.05154, -1.674611, 1, 0.454902, 0, 1,
-1.368889, 1.198567, 0.380643, 1, 0.4627451, 0, 1,
-1.367666, 1.009789, -1.737372, 1, 0.4666667, 0, 1,
-1.36481, -1.234187, -2.084976, 1, 0.4745098, 0, 1,
-1.363564, 0.6966161, 1.286559, 1, 0.4784314, 0, 1,
-1.344852, 1.146485, -0.5386807, 1, 0.4862745, 0, 1,
-1.334002, -0.5641358, -2.524715, 1, 0.4901961, 0, 1,
-1.333867, -0.3026617, -1.906338, 1, 0.4980392, 0, 1,
-1.324033, -0.6247692, -0.8104663, 1, 0.5058824, 0, 1,
-1.308775, 2.169578, -1.718995, 1, 0.509804, 0, 1,
-1.298955, 0.9685438, -0.93761, 1, 0.5176471, 0, 1,
-1.298681, -0.3086629, -0.4148835, 1, 0.5215687, 0, 1,
-1.297949, -0.7354504, -2.439373, 1, 0.5294118, 0, 1,
-1.293441, -0.03995589, -2.433392, 1, 0.5333334, 0, 1,
-1.287112, 1.177264, 0.5115217, 1, 0.5411765, 0, 1,
-1.284951, 1.866426, -0.7283261, 1, 0.5450981, 0, 1,
-1.276865, 1.207315, -0.5583715, 1, 0.5529412, 0, 1,
-1.26738, 0.05748574, -1.675628, 1, 0.5568628, 0, 1,
-1.266641, 0.07040871, -2.796554, 1, 0.5647059, 0, 1,
-1.265014, -0.3554071, -2.454203, 1, 0.5686275, 0, 1,
-1.265009, -1.334742, -2.452061, 1, 0.5764706, 0, 1,
-1.262127, 0.4002352, -0.4627318, 1, 0.5803922, 0, 1,
-1.25651, 0.4495986, -1.856732, 1, 0.5882353, 0, 1,
-1.251614, 1.556036, 0.2792515, 1, 0.5921569, 0, 1,
-1.24865, 0.9868524, -2.04977, 1, 0.6, 0, 1,
-1.245775, 0.3680958, -1.053518, 1, 0.6078432, 0, 1,
-1.242799, 0.1562144, -3.084287, 1, 0.6117647, 0, 1,
-1.23999, 0.6093512, -0.8062292, 1, 0.6196079, 0, 1,
-1.232528, 0.04020194, -0.594646, 1, 0.6235294, 0, 1,
-1.222994, -0.9930566, -2.047326, 1, 0.6313726, 0, 1,
-1.216136, -0.359616, -1.336518, 1, 0.6352941, 0, 1,
-1.2141, -2.005854, -1.584146, 1, 0.6431373, 0, 1,
-1.208388, 0.01223667, -0.2861703, 1, 0.6470588, 0, 1,
-1.208109, -0.3991602, -2.235552, 1, 0.654902, 0, 1,
-1.202305, 1.071356, 0.08286051, 1, 0.6588235, 0, 1,
-1.200241, -0.09406669, -1.262451, 1, 0.6666667, 0, 1,
-1.199991, 0.5868759, 0.4066674, 1, 0.6705883, 0, 1,
-1.19015, 0.6913229, -3.392871, 1, 0.6784314, 0, 1,
-1.189341, 1.043569, -1.185588, 1, 0.682353, 0, 1,
-1.186844, -0.4488966, -1.136857, 1, 0.6901961, 0, 1,
-1.183955, 0.1533791, 0.05212466, 1, 0.6941177, 0, 1,
-1.172269, -0.3168003, -1.565989, 1, 0.7019608, 0, 1,
-1.169086, -0.7728899, -3.001713, 1, 0.7098039, 0, 1,
-1.161346, -0.09336951, -1.859894, 1, 0.7137255, 0, 1,
-1.159501, 0.882318, -2.650423, 1, 0.7215686, 0, 1,
-1.155066, 0.6906783, -1.354882, 1, 0.7254902, 0, 1,
-1.145931, -0.203433, -2.148275, 1, 0.7333333, 0, 1,
-1.14497, 0.380448, -1.735262, 1, 0.7372549, 0, 1,
-1.143319, -0.1046757, -3.191609, 1, 0.7450981, 0, 1,
-1.141436, -0.2270974, -1.110048, 1, 0.7490196, 0, 1,
-1.137692, -0.4870174, -1.484555, 1, 0.7568628, 0, 1,
-1.137631, 0.7220122, -1.331856, 1, 0.7607843, 0, 1,
-1.125402, -1.573133, -3.672962, 1, 0.7686275, 0, 1,
-1.119282, -0.7513195, -0.736919, 1, 0.772549, 0, 1,
-1.118334, 0.7507046, -2.132027, 1, 0.7803922, 0, 1,
-1.117875, 0.1721157, -1.204014, 1, 0.7843137, 0, 1,
-1.117826, -0.02893145, -2.12536, 1, 0.7921569, 0, 1,
-1.111318, -0.6700811, -2.133464, 1, 0.7960784, 0, 1,
-1.105972, 1.034202, -1.496704, 1, 0.8039216, 0, 1,
-1.099003, -1.659862, -0.05897287, 1, 0.8117647, 0, 1,
-1.093959, -0.1315206, -2.297881, 1, 0.8156863, 0, 1,
-1.091525, 0.3079216, -1.739986, 1, 0.8235294, 0, 1,
-1.078761, 0.3196847, -3.155008, 1, 0.827451, 0, 1,
-1.07533, -0.474068, -1.360128, 1, 0.8352941, 0, 1,
-1.074633, -0.1458069, -2.793322, 1, 0.8392157, 0, 1,
-1.072106, 0.2846174, -0.3443143, 1, 0.8470588, 0, 1,
-1.071532, 0.6968754, -0.04627706, 1, 0.8509804, 0, 1,
-1.064132, -2.029864, -2.566962, 1, 0.8588235, 0, 1,
-1.064041, 0.1750173, -3.257046, 1, 0.8627451, 0, 1,
-1.05986, -1.092385, -2.01023, 1, 0.8705882, 0, 1,
-1.05848, -0.9072968, -0.725423, 1, 0.8745098, 0, 1,
-1.057177, 1.386125, -0.6038426, 1, 0.8823529, 0, 1,
-1.055096, 0.4474919, -1.29363, 1, 0.8862745, 0, 1,
-1.053916, -1.241749, -3.177625, 1, 0.8941177, 0, 1,
-1.050601, -1.336767, -3.421257, 1, 0.8980392, 0, 1,
-1.037274, 3.043696, -1.323958, 1, 0.9058824, 0, 1,
-1.029407, -0.8776102, -3.481282, 1, 0.9137255, 0, 1,
-1.02853, 0.9362594, 0.0526697, 1, 0.9176471, 0, 1,
-1.019524, 1.063649, -0.9115834, 1, 0.9254902, 0, 1,
-1.006057, 0.2945665, -1.620688, 1, 0.9294118, 0, 1,
-1.00596, 0.04049988, -3.215099, 1, 0.9372549, 0, 1,
-1.003527, -0.3766683, -1.507929, 1, 0.9411765, 0, 1,
-1.001996, -2.262364, -3.289925, 1, 0.9490196, 0, 1,
-0.9933418, -1.173648, -2.263317, 1, 0.9529412, 0, 1,
-0.9882985, -0.5493534, -2.096858, 1, 0.9607843, 0, 1,
-0.9865973, 0.509481, -2.090588, 1, 0.9647059, 0, 1,
-0.9740465, 0.6595246, -0.2083034, 1, 0.972549, 0, 1,
-0.9669152, -0.6562335, -1.882594, 1, 0.9764706, 0, 1,
-0.9510366, -0.7579992, -2.143604, 1, 0.9843137, 0, 1,
-0.9500038, -1.184572, -2.742419, 1, 0.9882353, 0, 1,
-0.9473559, -0.3759778, -1.865456, 1, 0.9960784, 0, 1,
-0.9470527, 1.356499, -0.8729488, 0.9960784, 1, 0, 1,
-0.9459709, 0.5037605, -0.328273, 0.9921569, 1, 0, 1,
-0.9449975, 1.259708, -2.874882, 0.9843137, 1, 0, 1,
-0.9415835, -0.7896144, -0.6495857, 0.9803922, 1, 0, 1,
-0.9312968, -0.5496653, -0.9971228, 0.972549, 1, 0, 1,
-0.9309402, -0.1407275, -3.975064, 0.9686275, 1, 0, 1,
-0.9277785, 1.774224, -1.167318, 0.9607843, 1, 0, 1,
-0.9250262, -0.001270399, -2.690398, 0.9568627, 1, 0, 1,
-0.9245227, 1.863799, -1.085194, 0.9490196, 1, 0, 1,
-0.9188728, -1.887789, -1.173658, 0.945098, 1, 0, 1,
-0.9171066, 0.7627542, -0.8737996, 0.9372549, 1, 0, 1,
-0.9169317, -1.497665, -0.7266314, 0.9333333, 1, 0, 1,
-0.9159498, -0.7102107, -1.154529, 0.9254902, 1, 0, 1,
-0.9112087, -1.362735, -3.571786, 0.9215686, 1, 0, 1,
-0.9097853, 0.1369846, -1.668284, 0.9137255, 1, 0, 1,
-0.9048488, 0.1393645, -0.7539111, 0.9098039, 1, 0, 1,
-0.9043949, -1.355843, -3.78235, 0.9019608, 1, 0, 1,
-0.8995614, 0.4999294, -1.389406, 0.8941177, 1, 0, 1,
-0.8963467, 0.9443842, -2.405471, 0.8901961, 1, 0, 1,
-0.8934368, -0.5982224, -2.982175, 0.8823529, 1, 0, 1,
-0.8925278, 0.003115326, -0.992386, 0.8784314, 1, 0, 1,
-0.8845436, 1.085853, -0.2572718, 0.8705882, 1, 0, 1,
-0.8841564, -0.3741347, -1.791801, 0.8666667, 1, 0, 1,
-0.8831026, -0.5992431, -1.998323, 0.8588235, 1, 0, 1,
-0.8808366, 0.01429853, -1.124198, 0.854902, 1, 0, 1,
-0.8680544, -0.9460667, -3.632676, 0.8470588, 1, 0, 1,
-0.8668399, -0.813472, -3.455985, 0.8431373, 1, 0, 1,
-0.8578152, -0.0518314, -1.645322, 0.8352941, 1, 0, 1,
-0.8494738, 1.714206, -1.428899, 0.8313726, 1, 0, 1,
-0.8477462, -0.5058668, -2.775475, 0.8235294, 1, 0, 1,
-0.8469869, 0.5030418, -2.226791, 0.8196079, 1, 0, 1,
-0.8384245, -0.1877162, 0.3570418, 0.8117647, 1, 0, 1,
-0.8383138, 0.1040844, -2.66118, 0.8078431, 1, 0, 1,
-0.8353938, -0.3087001, -3.343423, 0.8, 1, 0, 1,
-0.8351839, 0.9946972, 0.4930955, 0.7921569, 1, 0, 1,
-0.8323918, -0.4987914, -2.075042, 0.7882353, 1, 0, 1,
-0.831337, 1.165074, -2.184634, 0.7803922, 1, 0, 1,
-0.8297431, -0.9197523, -1.336047, 0.7764706, 1, 0, 1,
-0.8228641, -1.329596, -3.54337, 0.7686275, 1, 0, 1,
-0.8208752, 0.9930415, 1.143124, 0.7647059, 1, 0, 1,
-0.8191402, -0.25951, -0.8134069, 0.7568628, 1, 0, 1,
-0.8182013, 0.88283, 0.06603176, 0.7529412, 1, 0, 1,
-0.8141344, -0.7725484, -2.312981, 0.7450981, 1, 0, 1,
-0.8121581, 1.039522, -1.218405, 0.7411765, 1, 0, 1,
-0.807553, 0.8257529, -1.203966, 0.7333333, 1, 0, 1,
-0.7971435, -0.6048929, -1.148348, 0.7294118, 1, 0, 1,
-0.7948718, 2.086709, -0.6101196, 0.7215686, 1, 0, 1,
-0.7940026, -0.5715925, -3.120835, 0.7176471, 1, 0, 1,
-0.7909819, 1.135405, -0.2546868, 0.7098039, 1, 0, 1,
-0.7863222, 2.503013, -0.5756721, 0.7058824, 1, 0, 1,
-0.783519, -1.803356, -3.424778, 0.6980392, 1, 0, 1,
-0.7820045, -0.1767385, -2.678682, 0.6901961, 1, 0, 1,
-0.7731898, 0.6819838, 0.5164358, 0.6862745, 1, 0, 1,
-0.7709965, 1.353904, -0.4627713, 0.6784314, 1, 0, 1,
-0.7681662, -0.08976088, -3.2597, 0.6745098, 1, 0, 1,
-0.7677976, -1.011653, -2.411731, 0.6666667, 1, 0, 1,
-0.7669755, -0.3267137, -0.9498855, 0.6627451, 1, 0, 1,
-0.7647543, -0.8171567, -1.820476, 0.654902, 1, 0, 1,
-0.7616887, -0.7939605, -1.937466, 0.6509804, 1, 0, 1,
-0.7604111, -0.2363886, -0.5217667, 0.6431373, 1, 0, 1,
-0.7586106, 0.9911698, -1.181031, 0.6392157, 1, 0, 1,
-0.7560413, 1.937675, -0.9047745, 0.6313726, 1, 0, 1,
-0.7544332, -0.4493134, -1.56479, 0.627451, 1, 0, 1,
-0.7539635, 0.6164438, -1.593799, 0.6196079, 1, 0, 1,
-0.7526256, -1.127917, -1.596504, 0.6156863, 1, 0, 1,
-0.7502339, -0.9849005, -3.120303, 0.6078432, 1, 0, 1,
-0.7442497, -1.115981, -3.594855, 0.6039216, 1, 0, 1,
-0.7363572, 0.05199824, -1.963685, 0.5960785, 1, 0, 1,
-0.7319034, -2.084922, -3.031846, 0.5882353, 1, 0, 1,
-0.7299968, 0.5713946, -0.2469049, 0.5843138, 1, 0, 1,
-0.7284932, 1.428513, -0.5941287, 0.5764706, 1, 0, 1,
-0.7123346, 0.2877508, -2.026381, 0.572549, 1, 0, 1,
-0.710166, 0.4202789, -1.120886, 0.5647059, 1, 0, 1,
-0.7101062, 0.08706035, -0.5618315, 0.5607843, 1, 0, 1,
-0.707224, -1.379734, -1.541676, 0.5529412, 1, 0, 1,
-0.7044945, 0.3265746, -3.166624, 0.5490196, 1, 0, 1,
-0.695831, 1.407275, 0.6550159, 0.5411765, 1, 0, 1,
-0.6955624, -3.449521, -3.025472, 0.5372549, 1, 0, 1,
-0.6933163, 1.604184, 0.6571563, 0.5294118, 1, 0, 1,
-0.6893868, 0.2205016, -2.478776, 0.5254902, 1, 0, 1,
-0.6877898, -0.8194553, -1.857923, 0.5176471, 1, 0, 1,
-0.6735018, 0.5432852, -1.729456, 0.5137255, 1, 0, 1,
-0.6722253, -0.721151, -3.696822, 0.5058824, 1, 0, 1,
-0.6708496, 0.1601366, -1.113983, 0.5019608, 1, 0, 1,
-0.6658685, 0.05836654, -1.931492, 0.4941176, 1, 0, 1,
-0.6604362, -0.1347196, -1.501927, 0.4862745, 1, 0, 1,
-0.6598452, 0.5343568, -1.637465, 0.4823529, 1, 0, 1,
-0.6542818, 1.211655, 1.359247, 0.4745098, 1, 0, 1,
-0.6510301, -0.05621605, -2.375058, 0.4705882, 1, 0, 1,
-0.6510109, 0.6426097, -1.908297, 0.4627451, 1, 0, 1,
-0.645425, 1.092906, -1.432362, 0.4588235, 1, 0, 1,
-0.6435593, -1.261834, -2.250299, 0.4509804, 1, 0, 1,
-0.6402969, 0.5173654, -1.086946, 0.4470588, 1, 0, 1,
-0.6297657, -0.4327505, -1.04513, 0.4392157, 1, 0, 1,
-0.6294143, 0.8090463, -0.5597012, 0.4352941, 1, 0, 1,
-0.6264227, 0.06119776, -2.45518, 0.427451, 1, 0, 1,
-0.6256095, -0.2900919, -2.707787, 0.4235294, 1, 0, 1,
-0.6246065, -0.6686641, -2.41384, 0.4156863, 1, 0, 1,
-0.6214569, -1.047633, -3.319859, 0.4117647, 1, 0, 1,
-0.6211787, 2.139117, -0.5611667, 0.4039216, 1, 0, 1,
-0.6207619, 2.153389, 1.688807, 0.3960784, 1, 0, 1,
-0.6174707, 1.132883, -0.4680618, 0.3921569, 1, 0, 1,
-0.6173906, 1.582973, -0.02520124, 0.3843137, 1, 0, 1,
-0.6095058, 0.5480726, 0.3858202, 0.3803922, 1, 0, 1,
-0.6086031, 0.8416321, 0.567169, 0.372549, 1, 0, 1,
-0.6065673, 0.1962197, -1.723491, 0.3686275, 1, 0, 1,
-0.6008513, -0.5641004, -3.48795, 0.3607843, 1, 0, 1,
-0.5989397, 0.9686891, -2.399964, 0.3568628, 1, 0, 1,
-0.5962337, 0.8733111, -1.616437, 0.3490196, 1, 0, 1,
-0.5959162, 0.1715229, -1.63948, 0.345098, 1, 0, 1,
-0.5951391, -0.5799752, -0.8668111, 0.3372549, 1, 0, 1,
-0.5934247, -0.3155804, -1.526803, 0.3333333, 1, 0, 1,
-0.5933465, -1.123929, -3.574743, 0.3254902, 1, 0, 1,
-0.5901103, -0.868398, -1.54963, 0.3215686, 1, 0, 1,
-0.5888515, 1.299042, -1.618071e-05, 0.3137255, 1, 0, 1,
-0.5875139, 1.254166, -0.7431158, 0.3098039, 1, 0, 1,
-0.5859486, -0.5407649, -1.447435, 0.3019608, 1, 0, 1,
-0.5822678, 0.0009183653, -0.7580144, 0.2941177, 1, 0, 1,
-0.5749094, -0.8524387, -2.943296, 0.2901961, 1, 0, 1,
-0.5735831, -0.3103537, -2.375681, 0.282353, 1, 0, 1,
-0.5706281, 1.428451, -1.03061, 0.2784314, 1, 0, 1,
-0.5661149, 0.02261984, -1.60036, 0.2705882, 1, 0, 1,
-0.5647742, 1.792619, -0.4419237, 0.2666667, 1, 0, 1,
-0.5621371, -0.9477468, -2.867496, 0.2588235, 1, 0, 1,
-0.5615313, -0.145992, -2.219589, 0.254902, 1, 0, 1,
-0.5512074, 0.2139133, -0.8135487, 0.2470588, 1, 0, 1,
-0.550013, 0.6214522, -1.11489, 0.2431373, 1, 0, 1,
-0.5494155, -0.8282041, -1.273757, 0.2352941, 1, 0, 1,
-0.5291926, 1.620026, 0.1746981, 0.2313726, 1, 0, 1,
-0.5208274, 0.2415164, -2.097371, 0.2235294, 1, 0, 1,
-0.5197689, -0.5119357, -0.8673835, 0.2196078, 1, 0, 1,
-0.517325, -1.572865, -3.091274, 0.2117647, 1, 0, 1,
-0.5159226, -1.203078, -1.582557, 0.2078431, 1, 0, 1,
-0.515641, -0.0918049, -1.186964, 0.2, 1, 0, 1,
-0.5153699, -0.9883061, -3.421896, 0.1921569, 1, 0, 1,
-0.5132911, 2.32957, 0.3174936, 0.1882353, 1, 0, 1,
-0.5084761, -1.660938, -4.085585, 0.1803922, 1, 0, 1,
-0.500736, -0.2839107, -2.011387, 0.1764706, 1, 0, 1,
-0.500695, 0.558975, -2.210426, 0.1686275, 1, 0, 1,
-0.4960128, 1.526746, -0.4783016, 0.1647059, 1, 0, 1,
-0.4936577, 0.8049963, -0.8413741, 0.1568628, 1, 0, 1,
-0.4898828, 0.169437, 0.3196565, 0.1529412, 1, 0, 1,
-0.4894641, 0.07420553, -0.4984905, 0.145098, 1, 0, 1,
-0.4889237, 1.347676, 1.60367, 0.1411765, 1, 0, 1,
-0.4842303, 0.125891, -0.2800421, 0.1333333, 1, 0, 1,
-0.4822694, -0.4901005, -1.320297, 0.1294118, 1, 0, 1,
-0.4793029, 0.2943323, -1.297231, 0.1215686, 1, 0, 1,
-0.4778729, -0.352322, -3.551874, 0.1176471, 1, 0, 1,
-0.4765181, -0.7526125, -2.357746, 0.1098039, 1, 0, 1,
-0.4725833, -0.383626, -3.498353, 0.1058824, 1, 0, 1,
-0.4693093, -0.1459587, -1.092416, 0.09803922, 1, 0, 1,
-0.4678004, 2.219186, 1.121032, 0.09019608, 1, 0, 1,
-0.4577322, -0.3044386, -2.786961, 0.08627451, 1, 0, 1,
-0.438946, 0.8372254, -0.4818506, 0.07843138, 1, 0, 1,
-0.438921, -2.346133, -2.876513, 0.07450981, 1, 0, 1,
-0.4346783, -1.949051, -3.206895, 0.06666667, 1, 0, 1,
-0.4328482, -1.071662, -2.676504, 0.0627451, 1, 0, 1,
-0.4316888, 0.5044988, -0.1417641, 0.05490196, 1, 0, 1,
-0.4311987, 0.1884235, -0.7919325, 0.05098039, 1, 0, 1,
-0.4296604, -0.7385262, -3.341587, 0.04313726, 1, 0, 1,
-0.426156, 0.4724597, -1.524055, 0.03921569, 1, 0, 1,
-0.4220551, -0.5764416, -3.01287, 0.03137255, 1, 0, 1,
-0.4161841, 0.766436, 0.7618871, 0.02745098, 1, 0, 1,
-0.4157995, 0.7588632, -2.101187, 0.01960784, 1, 0, 1,
-0.4122011, -0.6762193, -3.163376, 0.01568628, 1, 0, 1,
-0.3995929, 0.6399381, -0.8479325, 0.007843138, 1, 0, 1,
-0.398291, 2.467031, -1.153763, 0.003921569, 1, 0, 1,
-0.3975631, 1.148576, -0.4474393, 0, 1, 0.003921569, 1,
-0.3938097, 0.4216873, 0.1708151, 0, 1, 0.01176471, 1,
-0.393611, -0.3962723, -2.86741, 0, 1, 0.01568628, 1,
-0.3873257, 0.003553029, 0.5491092, 0, 1, 0.02352941, 1,
-0.3854887, 0.6772358, 0.01782776, 0, 1, 0.02745098, 1,
-0.3822618, -0.3482852, -2.756166, 0, 1, 0.03529412, 1,
-0.3720734, 1.394953, -1.870017, 0, 1, 0.03921569, 1,
-0.3671047, -0.2763656, -1.331576, 0, 1, 0.04705882, 1,
-0.3666661, 0.6406721, 0.2648253, 0, 1, 0.05098039, 1,
-0.3653156, -0.7356712, -4.920469, 0, 1, 0.05882353, 1,
-0.3612463, -2.476167, -1.103202, 0, 1, 0.0627451, 1,
-0.3578702, 0.05210934, -3.901676, 0, 1, 0.07058824, 1,
-0.3543179, -0.4214269, -0.8637161, 0, 1, 0.07450981, 1,
-0.3523256, -1.319138, -1.389236, 0, 1, 0.08235294, 1,
-0.3508974, 0.6394659, 0.3321768, 0, 1, 0.08627451, 1,
-0.3495035, -0.1857211, -1.45923, 0, 1, 0.09411765, 1,
-0.349478, 0.3679284, -0.1197864, 0, 1, 0.1019608, 1,
-0.3479107, 1.325899, -0.1392481, 0, 1, 0.1058824, 1,
-0.3477728, 1.376775, -1.540063, 0, 1, 0.1137255, 1,
-0.3427049, 0.6641918, -0.9648878, 0, 1, 0.1176471, 1,
-0.3410656, -0.1973705, -0.02593368, 0, 1, 0.1254902, 1,
-0.3362525, 0.3673686, -0.1122498, 0, 1, 0.1294118, 1,
-0.336219, 0.006778161, -2.297368, 0, 1, 0.1372549, 1,
-0.3358428, -1.134421, -3.67231, 0, 1, 0.1411765, 1,
-0.3341614, 1.929181, -0.8895274, 0, 1, 0.1490196, 1,
-0.3312306, 0.2998957, -0.7526755, 0, 1, 0.1529412, 1,
-0.3282804, -0.5680484, -2.108365, 0, 1, 0.1607843, 1,
-0.3275764, 0.3760644, -0.2305882, 0, 1, 0.1647059, 1,
-0.3256589, 0.0722698, -3.361232, 0, 1, 0.172549, 1,
-0.3254738, 1.757473, -1.581563, 0, 1, 0.1764706, 1,
-0.3249361, -0.4673103, -2.253545, 0, 1, 0.1843137, 1,
-0.3238142, 0.8150266, 1.683049, 0, 1, 0.1882353, 1,
-0.3224242, 1.19489, -0.3683361, 0, 1, 0.1960784, 1,
-0.3208876, -1.277905, -4.690031, 0, 1, 0.2039216, 1,
-0.3144762, -0.7794961, -2.668402, 0, 1, 0.2078431, 1,
-0.31205, 0.6688198, 1.026742, 0, 1, 0.2156863, 1,
-0.3112169, 0.653635, -0.4712188, 0, 1, 0.2196078, 1,
-0.307744, 0.6202352, -0.798197, 0, 1, 0.227451, 1,
-0.3024494, 2.228331, 0.5435913, 0, 1, 0.2313726, 1,
-0.296677, 0.8912828, -2.073817, 0, 1, 0.2392157, 1,
-0.2834184, -0.8669379, -0.3704387, 0, 1, 0.2431373, 1,
-0.278838, -0.345086, -3.279203, 0, 1, 0.2509804, 1,
-0.272327, -0.05178457, -2.116889, 0, 1, 0.254902, 1,
-0.2721094, 1.230563, 0.9832994, 0, 1, 0.2627451, 1,
-0.2715979, 1.398531, -0.1285242, 0, 1, 0.2666667, 1,
-0.2709544, 0.2551303, -3.729953, 0, 1, 0.2745098, 1,
-0.2708299, -0.7291476, -3.407532, 0, 1, 0.2784314, 1,
-0.2703979, 0.2259881, -0.3611906, 0, 1, 0.2862745, 1,
-0.2702799, -1.379692, -3.366561, 0, 1, 0.2901961, 1,
-0.2667339, -0.7000771, -3.893047, 0, 1, 0.2980392, 1,
-0.264938, -0.04992998, -0.5706587, 0, 1, 0.3058824, 1,
-0.264548, 0.5993501, -0.0721269, 0, 1, 0.3098039, 1,
-0.2642384, -0.3642711, -2.168298, 0, 1, 0.3176471, 1,
-0.2583503, 0.7220098, 1.019707, 0, 1, 0.3215686, 1,
-0.2574688, -0.2799528, -3.004323, 0, 1, 0.3294118, 1,
-0.2574006, -0.6598293, -2.532436, 0, 1, 0.3333333, 1,
-0.2566769, -1.560403, -3.830899, 0, 1, 0.3411765, 1,
-0.2535915, -0.8692043, -3.750827, 0, 1, 0.345098, 1,
-0.2485673, 1.823288, -0.09674769, 0, 1, 0.3529412, 1,
-0.2461894, -0.6895589, -3.065112, 0, 1, 0.3568628, 1,
-0.2441643, 0.1113656, 0.9564224, 0, 1, 0.3647059, 1,
-0.2439532, -0.6255425, -0.324419, 0, 1, 0.3686275, 1,
-0.2363335, 0.5643248, -1.995542, 0, 1, 0.3764706, 1,
-0.2309238, -0.04723452, -2.504045, 0, 1, 0.3803922, 1,
-0.2304489, 0.07329332, -1.552485, 0, 1, 0.3882353, 1,
-0.2289013, 0.7442648, 0.1586693, 0, 1, 0.3921569, 1,
-0.2286293, 1.705257, 0.07333098, 0, 1, 0.4, 1,
-0.2247487, -0.5699931, -3.504129, 0, 1, 0.4078431, 1,
-0.2235243, 0.1359834, -2.070831, 0, 1, 0.4117647, 1,
-0.2208413, 0.3405017, -0.7232407, 0, 1, 0.4196078, 1,
-0.2204765, -0.6262478, -3.413229, 0, 1, 0.4235294, 1,
-0.2172851, 1.737319, 0.8445562, 0, 1, 0.4313726, 1,
-0.2106729, 0.6639241, -1.330274, 0, 1, 0.4352941, 1,
-0.2094519, -0.5486149, -4.844532, 0, 1, 0.4431373, 1,
-0.2087861, -2.127073, -1.276654, 0, 1, 0.4470588, 1,
-0.2036383, 0.7119971, 0.4617538, 0, 1, 0.454902, 1,
-0.2021492, 0.9696056, 1.345163, 0, 1, 0.4588235, 1,
-0.1981059, -0.9033476, -3.566593, 0, 1, 0.4666667, 1,
-0.1957612, -1.213164, -3.386836, 0, 1, 0.4705882, 1,
-0.1955715, 0.3423681, -0.5754937, 0, 1, 0.4784314, 1,
-0.1937135, -1.270139, -3.058176, 0, 1, 0.4823529, 1,
-0.1930011, -0.06023009, -3.316515, 0, 1, 0.4901961, 1,
-0.1895657, 0.9394848, 0.3463967, 0, 1, 0.4941176, 1,
-0.1892471, -0.134139, -0.8909478, 0, 1, 0.5019608, 1,
-0.1869135, 1.479208, 2.436806, 0, 1, 0.509804, 1,
-0.1856491, 1.126068, 0.4226628, 0, 1, 0.5137255, 1,
-0.1837432, -0.6989501, -5.399762, 0, 1, 0.5215687, 1,
-0.1830845, -0.1016958, -2.583787, 0, 1, 0.5254902, 1,
-0.1795544, -1.005413, -3.138041, 0, 1, 0.5333334, 1,
-0.1772622, 1.471732, -1.189085, 0, 1, 0.5372549, 1,
-0.1753967, -0.5812246, -1.971563, 0, 1, 0.5450981, 1,
-0.1746169, -0.6161718, -1.173764, 0, 1, 0.5490196, 1,
-0.1723992, 2.642518, -0.8583725, 0, 1, 0.5568628, 1,
-0.1702033, -1.698095, -3.235246, 0, 1, 0.5607843, 1,
-0.169193, -0.1083335, -2.944554, 0, 1, 0.5686275, 1,
-0.1688573, -1.039487, -1.36199, 0, 1, 0.572549, 1,
-0.1664074, 1.768514, -0.345518, 0, 1, 0.5803922, 1,
-0.1648463, -0.3904455, -1.048975, 0, 1, 0.5843138, 1,
-0.1637226, -1.496465, -3.406821, 0, 1, 0.5921569, 1,
-0.1633976, -0.5570424, -3.372614, 0, 1, 0.5960785, 1,
-0.1623548, 0.472783, 0.6166424, 0, 1, 0.6039216, 1,
-0.1568363, 0.4156561, -2.214615, 0, 1, 0.6117647, 1,
-0.1562791, 1.033394, 0.8971371, 0, 1, 0.6156863, 1,
-0.1532665, 1.602713, -0.4855104, 0, 1, 0.6235294, 1,
-0.1500141, -1.250151, -3.736298, 0, 1, 0.627451, 1,
-0.1479525, -0.5049101, -2.984848, 0, 1, 0.6352941, 1,
-0.1472575, 0.288572, -0.3581243, 0, 1, 0.6392157, 1,
-0.1406356, -1.057573, -3.456903, 0, 1, 0.6470588, 1,
-0.1403053, 0.0697049, 0.9199044, 0, 1, 0.6509804, 1,
-0.1363842, 0.3893865, -0.4645621, 0, 1, 0.6588235, 1,
-0.1360139, -0.8660452, -2.840322, 0, 1, 0.6627451, 1,
-0.1354863, -0.8165483, -2.786908, 0, 1, 0.6705883, 1,
-0.1304201, 0.007400788, -1.860596, 0, 1, 0.6745098, 1,
-0.1209346, -2.362664, -3.251939, 0, 1, 0.682353, 1,
-0.1181237, -0.09841955, -2.806217, 0, 1, 0.6862745, 1,
-0.1175415, -0.2944548, -3.783299, 0, 1, 0.6941177, 1,
-0.1115223, 1.284306, 0.5816064, 0, 1, 0.7019608, 1,
-0.1080498, -1.39822, -1.266326, 0, 1, 0.7058824, 1,
-0.103756, -2.390222, -4.853653, 0, 1, 0.7137255, 1,
-0.09826551, -1.39459, -4.230994, 0, 1, 0.7176471, 1,
-0.09309885, -0.5566857, -1.423725, 0, 1, 0.7254902, 1,
-0.08762976, -2.59546, -2.014827, 0, 1, 0.7294118, 1,
-0.08716995, 1.662331, 0.4686053, 0, 1, 0.7372549, 1,
-0.08005231, 0.9231184, 1.155204, 0, 1, 0.7411765, 1,
-0.07970624, -0.8827167, -3.079563, 0, 1, 0.7490196, 1,
-0.07969425, -0.9149882, -2.85613, 0, 1, 0.7529412, 1,
-0.07924282, -2.263673, -3.662063, 0, 1, 0.7607843, 1,
-0.07211557, -1.685086, -3.505391, 0, 1, 0.7647059, 1,
-0.07107089, -0.8133439, -2.26582, 0, 1, 0.772549, 1,
-0.06958298, 1.662934, 0.1682813, 0, 1, 0.7764706, 1,
-0.06901664, -1.134364, -3.432091, 0, 1, 0.7843137, 1,
-0.06856229, 0.1828773, -1.458546, 0, 1, 0.7882353, 1,
-0.06667543, 0.9090842, -0.6751164, 0, 1, 0.7960784, 1,
-0.06282131, -0.5523319, -3.30729, 0, 1, 0.8039216, 1,
-0.05790088, -0.8517803, -3.458712, 0, 1, 0.8078431, 1,
-0.05693425, 0.2025646, -0.7160143, 0, 1, 0.8156863, 1,
-0.05321456, 0.5453376, 0.7788231, 0, 1, 0.8196079, 1,
-0.04979141, 0.07236402, -0.1127039, 0, 1, 0.827451, 1,
-0.04822856, 0.719367, -0.8077636, 0, 1, 0.8313726, 1,
-0.04764567, 0.5017096, 0.4062592, 0, 1, 0.8392157, 1,
-0.04723557, -0.7544069, -4.138242, 0, 1, 0.8431373, 1,
-0.04640707, -0.0535277, -1.158506, 0, 1, 0.8509804, 1,
-0.04496016, -0.4696379, -0.8677649, 0, 1, 0.854902, 1,
-0.04444984, 0.03048711, -1.518146, 0, 1, 0.8627451, 1,
-0.04206841, 0.6834815, -1.057229, 0, 1, 0.8666667, 1,
-0.03829508, 1.446163, 1.041894, 0, 1, 0.8745098, 1,
-0.0372571, 0.2287068, 1.808068, 0, 1, 0.8784314, 1,
-0.03717488, -1.39262, -2.802183, 0, 1, 0.8862745, 1,
-0.03360614, -1.160899, -3.894614, 0, 1, 0.8901961, 1,
-0.03133972, -1.585665, -5.024274, 0, 1, 0.8980392, 1,
-0.02820715, 0.2634791, -1.681152, 0, 1, 0.9058824, 1,
-0.02338948, -1.10773, -3.177243, 0, 1, 0.9098039, 1,
-0.0227024, -1.002009, -4.926331, 0, 1, 0.9176471, 1,
-0.01979461, 0.9059541, -0.2321775, 0, 1, 0.9215686, 1,
-0.0182942, 0.5685543, 0.5565736, 0, 1, 0.9294118, 1,
-0.01508812, -2.427951, -1.555278, 0, 1, 0.9333333, 1,
-0.01437835, -0.1796725, -2.83406, 0, 1, 0.9411765, 1,
-0.01041689, -2.397646, -3.123379, 0, 1, 0.945098, 1,
-0.01033236, 0.828676, -0.1138617, 0, 1, 0.9529412, 1,
-0.006695973, -1.212465, -4.272894, 0, 1, 0.9568627, 1,
-0.005763326, 1.779631, -0.6418276, 0, 1, 0.9647059, 1,
-0.002634152, -0.3063402, -2.470802, 0, 1, 0.9686275, 1,
-0.002212392, -1.196936, -3.624374, 0, 1, 0.9764706, 1,
0.003546383, 0.2124583, -0.5443063, 0, 1, 0.9803922, 1,
0.007602713, -1.018186, 3.718696, 0, 1, 0.9882353, 1,
0.007661595, 0.6934565, -0.5971621, 0, 1, 0.9921569, 1,
0.01153215, -0.7816808, 5.297383, 0, 1, 1, 1,
0.01601822, -0.175347, 3.573668, 0, 0.9921569, 1, 1,
0.01616869, 0.9305263, 0.2236049, 0, 0.9882353, 1, 1,
0.01876314, -1.241631, 3.975715, 0, 0.9803922, 1, 1,
0.02243057, -0.08122948, 3.332843, 0, 0.9764706, 1, 1,
0.02372536, 0.2781133, -0.2652907, 0, 0.9686275, 1, 1,
0.02602037, -1.233619, 1.774191, 0, 0.9647059, 1, 1,
0.03099442, 1.737418, 0.1468356, 0, 0.9568627, 1, 1,
0.0314507, 1.35204, 1.028118, 0, 0.9529412, 1, 1,
0.03241671, -0.1637172, 2.464825, 0, 0.945098, 1, 1,
0.03286966, 0.1313529, -0.9307121, 0, 0.9411765, 1, 1,
0.03318043, 1.861905, -0.53403, 0, 0.9333333, 1, 1,
0.03469264, 0.4654379, -1.336217, 0, 0.9294118, 1, 1,
0.03477652, -1.682046, 2.946123, 0, 0.9215686, 1, 1,
0.03927704, 1.148972, 0.09057008, 0, 0.9176471, 1, 1,
0.04689773, -0.284473, 2.818591, 0, 0.9098039, 1, 1,
0.04922996, 0.221813, 1.63455, 0, 0.9058824, 1, 1,
0.05297447, 0.1957511, -0.8278359, 0, 0.8980392, 1, 1,
0.05404016, -1.759994, 1.730057, 0, 0.8901961, 1, 1,
0.0624701, 0.685664, 0.5075392, 0, 0.8862745, 1, 1,
0.06407799, -0.04460132, 1.410025, 0, 0.8784314, 1, 1,
0.06473377, 0.7159931, -1.169602, 0, 0.8745098, 1, 1,
0.06551778, 1.687672, 0.7478356, 0, 0.8666667, 1, 1,
0.06566347, -0.4657665, 2.937364, 0, 0.8627451, 1, 1,
0.06980976, -0.7883223, 3.351699, 0, 0.854902, 1, 1,
0.07006657, 1.40537, 0.7107485, 0, 0.8509804, 1, 1,
0.07032581, -0.1723318, 3.476498, 0, 0.8431373, 1, 1,
0.07085393, 2.144946, 1.091903, 0, 0.8392157, 1, 1,
0.0713992, 0.6019381, 0.2770371, 0, 0.8313726, 1, 1,
0.07282929, -0.4154678, 0.7095632, 0, 0.827451, 1, 1,
0.07436375, 0.8715982, 1.508179, 0, 0.8196079, 1, 1,
0.0753056, 0.1015283, 1.098839, 0, 0.8156863, 1, 1,
0.07733561, 0.7699509, 0.3056965, 0, 0.8078431, 1, 1,
0.08478085, 0.5841793, 0.03023404, 0, 0.8039216, 1, 1,
0.09210683, 1.792777, -0.8768953, 0, 0.7960784, 1, 1,
0.09766761, 1.534025, -1.805749, 0, 0.7882353, 1, 1,
0.1051127, -1.57153, 2.353732, 0, 0.7843137, 1, 1,
0.1055495, 0.6508074, 1.686578, 0, 0.7764706, 1, 1,
0.1070371, -0.4963717, 3.46456, 0, 0.772549, 1, 1,
0.1076928, 0.01969977, 1.168878, 0, 0.7647059, 1, 1,
0.1077095, 1.60925, 2.229507, 0, 0.7607843, 1, 1,
0.109571, -0.1880413, 1.369508, 0, 0.7529412, 1, 1,
0.1108519, -0.969075, 3.244889, 0, 0.7490196, 1, 1,
0.1124231, -0.2961096, 4.117446, 0, 0.7411765, 1, 1,
0.1141239, 0.7811167, 1.162039, 0, 0.7372549, 1, 1,
0.1147114, -0.2158801, 3.104135, 0, 0.7294118, 1, 1,
0.1183149, -0.1049434, 0.9450443, 0, 0.7254902, 1, 1,
0.1229117, -0.2048922, 2.765767, 0, 0.7176471, 1, 1,
0.123353, -0.9637581, 2.247107, 0, 0.7137255, 1, 1,
0.1239014, 0.9069895, 0.9258996, 0, 0.7058824, 1, 1,
0.1247763, 0.6652295, -0.09359697, 0, 0.6980392, 1, 1,
0.1293609, 0.5874893, 0.3532473, 0, 0.6941177, 1, 1,
0.1312617, -1.647715, 2.829405, 0, 0.6862745, 1, 1,
0.1320348, -0.4657226, 4.702806, 0, 0.682353, 1, 1,
0.1326318, -1.381356, 3.387731, 0, 0.6745098, 1, 1,
0.1332209, -1.571102, 3.028424, 0, 0.6705883, 1, 1,
0.1343859, 0.9233438, -0.3342269, 0, 0.6627451, 1, 1,
0.1423314, -0.7053567, 2.642422, 0, 0.6588235, 1, 1,
0.143178, 0.2685543, 1.919096, 0, 0.6509804, 1, 1,
0.1436222, -0.3458093, 3.012222, 0, 0.6470588, 1, 1,
0.1448563, 0.3052782, 0.7063708, 0, 0.6392157, 1, 1,
0.1480692, -1.034327, 3.853552, 0, 0.6352941, 1, 1,
0.1585023, -0.8649337, 1.910605, 0, 0.627451, 1, 1,
0.1606109, 1.603542, 0.9003059, 0, 0.6235294, 1, 1,
0.1692464, -0.5509804, 2.328092, 0, 0.6156863, 1, 1,
0.1701806, -0.089825, 3.461383, 0, 0.6117647, 1, 1,
0.1763848, 0.3690687, 0.6649312, 0, 0.6039216, 1, 1,
0.1902164, 0.4481865, -0.2065905, 0, 0.5960785, 1, 1,
0.1932759, -0.2081497, 2.547516, 0, 0.5921569, 1, 1,
0.1963407, 0.2883523, 1.24762, 0, 0.5843138, 1, 1,
0.198871, -0.02431325, 2.355141, 0, 0.5803922, 1, 1,
0.2021458, -0.4155996, 2.579016, 0, 0.572549, 1, 1,
0.2031601, -0.636188, 4.512591, 0, 0.5686275, 1, 1,
0.2034057, 0.2901453, 1.396502, 0, 0.5607843, 1, 1,
0.2048874, 0.5681368, 0.8256678, 0, 0.5568628, 1, 1,
0.2056713, -0.6338922, 4.03528, 0, 0.5490196, 1, 1,
0.2067279, -0.4979616, 3.539046, 0, 0.5450981, 1, 1,
0.2085741, -0.04772786, 1.903874, 0, 0.5372549, 1, 1,
0.2115678, 0.5834218, 1.61691, 0, 0.5333334, 1, 1,
0.2135318, 1.227442, -2.266717, 0, 0.5254902, 1, 1,
0.21448, 0.2692024, 1.9012, 0, 0.5215687, 1, 1,
0.2166113, -0.3097259, 1.517601, 0, 0.5137255, 1, 1,
0.2174885, -0.8744931, 3.537865, 0, 0.509804, 1, 1,
0.2198135, 1.563626, 0.6563794, 0, 0.5019608, 1, 1,
0.2215784, -0.7885717, 3.722853, 0, 0.4941176, 1, 1,
0.2235685, -0.2965288, 1.828659, 0, 0.4901961, 1, 1,
0.2239083, 0.7807716, 0.7763345, 0, 0.4823529, 1, 1,
0.2243664, -0.3785337, 1.839634, 0, 0.4784314, 1, 1,
0.2253872, -1.25864, 2.549141, 0, 0.4705882, 1, 1,
0.2296432, 1.460548, -2.260368, 0, 0.4666667, 1, 1,
0.230168, 1.684799, -1.086958, 0, 0.4588235, 1, 1,
0.2358541, -0.110906, 2.885573, 0, 0.454902, 1, 1,
0.2364604, -0.06262905, 2.658938, 0, 0.4470588, 1, 1,
0.2374338, 0.6555771, 0.6609908, 0, 0.4431373, 1, 1,
0.2417231, -0.01113786, 2.761838, 0, 0.4352941, 1, 1,
0.2450645, 0.3216511, -1.179873, 0, 0.4313726, 1, 1,
0.2478264, -1.554391, 2.569202, 0, 0.4235294, 1, 1,
0.2479609, 0.3036287, 1.331095, 0, 0.4196078, 1, 1,
0.2499279, 0.1436242, 2.703068, 0, 0.4117647, 1, 1,
0.2519934, -0.8183032, 2.754432, 0, 0.4078431, 1, 1,
0.2560594, -1.972226, 4.152354, 0, 0.4, 1, 1,
0.2582551, -0.3788662, 2.609733, 0, 0.3921569, 1, 1,
0.2585973, -0.7355009, 2.912405, 0, 0.3882353, 1, 1,
0.2614279, -0.9960693, 4.510613, 0, 0.3803922, 1, 1,
0.2649419, 0.7912778, 0.3736281, 0, 0.3764706, 1, 1,
0.270547, -0.7797006, 1.310689, 0, 0.3686275, 1, 1,
0.2729652, -0.684987, 2.014936, 0, 0.3647059, 1, 1,
0.2754607, -0.1764929, 1.533351, 0, 0.3568628, 1, 1,
0.2781159, -0.424483, 3.368771, 0, 0.3529412, 1, 1,
0.2837021, 2.963638, -0.6734236, 0, 0.345098, 1, 1,
0.2856275, -0.3218854, 4.384698, 0, 0.3411765, 1, 1,
0.2893626, -0.3089156, 3.422916, 0, 0.3333333, 1, 1,
0.2942179, -0.4318606, 3.342755, 0, 0.3294118, 1, 1,
0.2992862, 1.871219, -0.2213379, 0, 0.3215686, 1, 1,
0.2997104, 0.3868674, 0.7851989, 0, 0.3176471, 1, 1,
0.3021334, -0.5187457, 2.66227, 0, 0.3098039, 1, 1,
0.3028632, 0.648403, 1.357538, 0, 0.3058824, 1, 1,
0.3048052, -0.3385196, 1.445875, 0, 0.2980392, 1, 1,
0.3050126, -0.5256591, 2.382904, 0, 0.2901961, 1, 1,
0.3073873, -0.2603163, 3.007742, 0, 0.2862745, 1, 1,
0.3107908, 0.1596065, 2.282293, 0, 0.2784314, 1, 1,
0.3165504, -0.66618, 2.908368, 0, 0.2745098, 1, 1,
0.3220121, -0.5568658, 3.648159, 0, 0.2666667, 1, 1,
0.3250658, 0.5162356, 0.9900104, 0, 0.2627451, 1, 1,
0.3272993, -1.463368, 3.796632, 0, 0.254902, 1, 1,
0.3274862, 0.8238394, 0.4890929, 0, 0.2509804, 1, 1,
0.3277239, -0.1566822, 2.333795, 0, 0.2431373, 1, 1,
0.3305867, 0.4896755, 1.417421, 0, 0.2392157, 1, 1,
0.3344204, -1.019744, 2.319488, 0, 0.2313726, 1, 1,
0.3389323, 0.5569342, 0.9572452, 0, 0.227451, 1, 1,
0.3400841, 1.158959, -0.3137454, 0, 0.2196078, 1, 1,
0.3436418, 0.4057024, 1.603583, 0, 0.2156863, 1, 1,
0.3455868, 0.1309699, 3.069444, 0, 0.2078431, 1, 1,
0.3462015, 0.9213012, 0.2547511, 0, 0.2039216, 1, 1,
0.3482766, 1.470539, 0.01557095, 0, 0.1960784, 1, 1,
0.350478, 0.1845384, 1.917364, 0, 0.1882353, 1, 1,
0.3543556, 1.773771, 0.2802914, 0, 0.1843137, 1, 1,
0.355302, -0.3026489, 2.10651, 0, 0.1764706, 1, 1,
0.3642125, 0.5467383, 1.130684, 0, 0.172549, 1, 1,
0.3655484, -0.6088791, 3.659662, 0, 0.1647059, 1, 1,
0.3695067, 1.222486, -0.6054224, 0, 0.1607843, 1, 1,
0.3695405, 0.1514353, 0.6615034, 0, 0.1529412, 1, 1,
0.3730938, -1.481597, 2.951059, 0, 0.1490196, 1, 1,
0.3736491, -0.543333, 2.706912, 0, 0.1411765, 1, 1,
0.3771754, 2.07416, 1.472161, 0, 0.1372549, 1, 1,
0.3790548, 0.5024571, 1.206344, 0, 0.1294118, 1, 1,
0.3814791, -0.7996521, 3.166322, 0, 0.1254902, 1, 1,
0.382019, -1.184584, 3.377046, 0, 0.1176471, 1, 1,
0.3879281, -1.576967, 2.969257, 0, 0.1137255, 1, 1,
0.3898432, 0.6803871, 1.053699, 0, 0.1058824, 1, 1,
0.3918934, -1.041518, 1.895669, 0, 0.09803922, 1, 1,
0.3940063, -1.286599, 2.538213, 0, 0.09411765, 1, 1,
0.4016312, 1.842548, 2.115963, 0, 0.08627451, 1, 1,
0.4047184, 0.4639584, -0.02700853, 0, 0.08235294, 1, 1,
0.4070607, 0.6127176, 0.9443071, 0, 0.07450981, 1, 1,
0.4073447, -0.109596, 2.426198, 0, 0.07058824, 1, 1,
0.4123158, 0.5303179, 0.4517277, 0, 0.0627451, 1, 1,
0.4156833, -0.7531084, 2.170915, 0, 0.05882353, 1, 1,
0.4196864, 2.16707, -0.205924, 0, 0.05098039, 1, 1,
0.4230589, 1.227851, 0.08054194, 0, 0.04705882, 1, 1,
0.4313075, 0.6612468, 1.979835, 0, 0.03921569, 1, 1,
0.4325894, 0.07265293, 1.826262, 0, 0.03529412, 1, 1,
0.4335813, -1.578734, 3.330024, 0, 0.02745098, 1, 1,
0.4352039, -1.270942, 1.714189, 0, 0.02352941, 1, 1,
0.436497, 1.248701, 1.526966, 0, 0.01568628, 1, 1,
0.4374412, 0.5010457, 3.577021, 0, 0.01176471, 1, 1,
0.4393062, -0.2768019, 2.471302, 0, 0.003921569, 1, 1,
0.4402078, -1.159186, 2.77925, 0.003921569, 0, 1, 1,
0.4404285, 0.1141495, 1.304842, 0.007843138, 0, 1, 1,
0.4483796, -1.25664, 3.636427, 0.01568628, 0, 1, 1,
0.4622492, -0.3138192, 3.566078, 0.01960784, 0, 1, 1,
0.4630674, 0.08324081, 3.396034, 0.02745098, 0, 1, 1,
0.4647904, 0.2788312, 1.425272, 0.03137255, 0, 1, 1,
0.4680853, 0.6321439, 0.9521863, 0.03921569, 0, 1, 1,
0.4809542, -0.6301799, 3.14334, 0.04313726, 0, 1, 1,
0.4841715, -1.564055, 4.993541, 0.05098039, 0, 1, 1,
0.4882798, -0.8961509, 3.302765, 0.05490196, 0, 1, 1,
0.492488, -0.7147979, 1.249965, 0.0627451, 0, 1, 1,
0.5014194, 0.5215225, 0.04206191, 0.06666667, 0, 1, 1,
0.5053093, 0.9585162, 1.594536, 0.07450981, 0, 1, 1,
0.5066446, 0.6861448, 1.057477, 0.07843138, 0, 1, 1,
0.5120587, 0.5970749, 0.5744425, 0.08627451, 0, 1, 1,
0.5165612, -0.5151545, 1.734543, 0.09019608, 0, 1, 1,
0.5177911, 0.6229499, -0.005045742, 0.09803922, 0, 1, 1,
0.5195882, 1.040255, 0.598317, 0.1058824, 0, 1, 1,
0.5226752, -0.6089963, 1.524163, 0.1098039, 0, 1, 1,
0.5252718, -0.006869953, 1.585879, 0.1176471, 0, 1, 1,
0.5288005, -1.28524, 2.543011, 0.1215686, 0, 1, 1,
0.5298344, -0.1945425, 0.5092548, 0.1294118, 0, 1, 1,
0.5303974, -0.3733235, 3.217754, 0.1333333, 0, 1, 1,
0.5445577, -1.255867, 1.882784, 0.1411765, 0, 1, 1,
0.5494138, 1.03063, 0.6517702, 0.145098, 0, 1, 1,
0.549581, 0.0769066, 4.103618, 0.1529412, 0, 1, 1,
0.5508574, -0.658722, 2.080845, 0.1568628, 0, 1, 1,
0.5519388, -0.09383001, 2.849358, 0.1647059, 0, 1, 1,
0.5527803, -0.02992103, 2.00224, 0.1686275, 0, 1, 1,
0.5530277, 0.9761993, 0.3679411, 0.1764706, 0, 1, 1,
0.5531082, -1.96401, 3.229141, 0.1803922, 0, 1, 1,
0.5553879, -0.02647712, 2.741598, 0.1882353, 0, 1, 1,
0.5661927, 0.1888211, 0.9833005, 0.1921569, 0, 1, 1,
0.5665887, -0.2017312, 3.199622, 0.2, 0, 1, 1,
0.5698414, -1.005169, 1.456584, 0.2078431, 0, 1, 1,
0.5737337, 1.870497, -0.7034668, 0.2117647, 0, 1, 1,
0.5747826, -0.9817222, 4.229061, 0.2196078, 0, 1, 1,
0.5767041, -0.1514092, 1.962364, 0.2235294, 0, 1, 1,
0.5772747, 0.1118256, 3.415291, 0.2313726, 0, 1, 1,
0.5774565, -1.329545, 3.003376, 0.2352941, 0, 1, 1,
0.5814115, 2.20069, 1.66009, 0.2431373, 0, 1, 1,
0.581581, 0.1612169, 1.53102, 0.2470588, 0, 1, 1,
0.5816795, 0.2050814, 0.7096362, 0.254902, 0, 1, 1,
0.5825226, -1.154623, 3.774784, 0.2588235, 0, 1, 1,
0.5878, -0.8153108, 2.901361, 0.2666667, 0, 1, 1,
0.5903058, -1.512142, 3.361888, 0.2705882, 0, 1, 1,
0.5914441, 0.8383119, 2.439178, 0.2784314, 0, 1, 1,
0.5935443, 0.8173462, 0.1234021, 0.282353, 0, 1, 1,
0.5971636, -0.577693, 1.719764, 0.2901961, 0, 1, 1,
0.6022483, 0.4236446, 1.334459, 0.2941177, 0, 1, 1,
0.6045097, 0.4423907, 1.394349, 0.3019608, 0, 1, 1,
0.6139064, -0.7256544, 3.559238, 0.3098039, 0, 1, 1,
0.6147193, -0.1510787, 0.8159809, 0.3137255, 0, 1, 1,
0.6178922, -0.1945625, 1.811453, 0.3215686, 0, 1, 1,
0.6187565, -0.2389303, 2.179349, 0.3254902, 0, 1, 1,
0.6199216, -1.551333, 4.587079, 0.3333333, 0, 1, 1,
0.620354, 1.535471, 1.199383, 0.3372549, 0, 1, 1,
0.6228526, -0.4968003, 0.9679623, 0.345098, 0, 1, 1,
0.6236696, -0.9716872, 2.700986, 0.3490196, 0, 1, 1,
0.6243261, -1.333569, 2.03762, 0.3568628, 0, 1, 1,
0.6247762, 0.7647231, -0.1304324, 0.3607843, 0, 1, 1,
0.6295385, -0.578342, 1.340337, 0.3686275, 0, 1, 1,
0.6299397, -1.165797, 1.690018, 0.372549, 0, 1, 1,
0.6374573, 0.1521609, 2.43058, 0.3803922, 0, 1, 1,
0.6410406, 0.02809048, 2.542823, 0.3843137, 0, 1, 1,
0.6451903, 0.649188, 0.7906608, 0.3921569, 0, 1, 1,
0.6522568, -1.663589, 4.194469, 0.3960784, 0, 1, 1,
0.6533725, -0.3308792, 1.736796, 0.4039216, 0, 1, 1,
0.6576748, -0.4640228, 2.139132, 0.4117647, 0, 1, 1,
0.6590298, -2.150936, 2.636598, 0.4156863, 0, 1, 1,
0.6612062, 1.366956, 1.725095, 0.4235294, 0, 1, 1,
0.6627771, -0.5908986, 0.8518385, 0.427451, 0, 1, 1,
0.664497, -0.5710091, 3.099223, 0.4352941, 0, 1, 1,
0.6649098, 0.1267687, 1.356313, 0.4392157, 0, 1, 1,
0.6706671, -2.102513, 3.271277, 0.4470588, 0, 1, 1,
0.6709039, 1.744977, 1.817989, 0.4509804, 0, 1, 1,
0.672923, -0.2120761, 1.051339, 0.4588235, 0, 1, 1,
0.6789929, 0.5108432, -0.07058264, 0.4627451, 0, 1, 1,
0.6797657, 1.207147, 0.7092732, 0.4705882, 0, 1, 1,
0.6826623, -1.453277, 2.393265, 0.4745098, 0, 1, 1,
0.6833106, -0.0264128, 2.639206, 0.4823529, 0, 1, 1,
0.6855045, -0.2661658, 2.177068, 0.4862745, 0, 1, 1,
0.6868614, -1.707152, 2.36778, 0.4941176, 0, 1, 1,
0.6936553, 1.819441, 0.4236251, 0.5019608, 0, 1, 1,
0.7013677, -0.1732931, 3.454636, 0.5058824, 0, 1, 1,
0.7102126, 0.8461511, 1.460142, 0.5137255, 0, 1, 1,
0.7102297, -1.243835, 4.731959, 0.5176471, 0, 1, 1,
0.7140427, -1.031626, 4.733754, 0.5254902, 0, 1, 1,
0.7161867, 0.1565938, 0.6097883, 0.5294118, 0, 1, 1,
0.7167579, 0.5069008, -0.2012648, 0.5372549, 0, 1, 1,
0.7227737, -0.4645678, 2.271535, 0.5411765, 0, 1, 1,
0.724024, 1.281178, 0.6169668, 0.5490196, 0, 1, 1,
0.7242594, -0.9479351, 3.484034, 0.5529412, 0, 1, 1,
0.7433153, 0.2970717, 1.324378, 0.5607843, 0, 1, 1,
0.7475269, -1.071646, 3.464927, 0.5647059, 0, 1, 1,
0.7523883, -1.279315, 1.232915, 0.572549, 0, 1, 1,
0.7527406, -0.6578236, 1.78869, 0.5764706, 0, 1, 1,
0.7552844, 1.75387, 0.01086104, 0.5843138, 0, 1, 1,
0.7560166, 0.3117584, 0.4291061, 0.5882353, 0, 1, 1,
0.7596617, 0.3243328, 0.8516895, 0.5960785, 0, 1, 1,
0.7662303, -0.09105118, 1.528737, 0.6039216, 0, 1, 1,
0.767431, 0.08162986, 1.749669, 0.6078432, 0, 1, 1,
0.76848, 0.1752195, 0.8262836, 0.6156863, 0, 1, 1,
0.776325, 1.187396, 0.3717492, 0.6196079, 0, 1, 1,
0.7787642, -0.8116509, 3.115823, 0.627451, 0, 1, 1,
0.7801683, 0.6793576, 1.009061, 0.6313726, 0, 1, 1,
0.7862251, -0.8458555, 3.307657, 0.6392157, 0, 1, 1,
0.7916151, 0.7848452, -0.6513772, 0.6431373, 0, 1, 1,
0.7942125, 0.05065355, 1.622103, 0.6509804, 0, 1, 1,
0.8002609, 0.6594729, -1.065138, 0.654902, 0, 1, 1,
0.8035446, 0.54381, 0.3233439, 0.6627451, 0, 1, 1,
0.8058007, 0.8194907, 1.183542, 0.6666667, 0, 1, 1,
0.8072102, 1.880429, 0.3314675, 0.6745098, 0, 1, 1,
0.8092663, 0.008044786, 0.9237576, 0.6784314, 0, 1, 1,
0.8122181, 0.1174068, 0.8981678, 0.6862745, 0, 1, 1,
0.8172662, 2.062806, 0.9296772, 0.6901961, 0, 1, 1,
0.8174922, -1.434993, 2.84794, 0.6980392, 0, 1, 1,
0.8194764, 0.532115, 1.522434, 0.7058824, 0, 1, 1,
0.8204944, -0.8975852, 2.723279, 0.7098039, 0, 1, 1,
0.8223796, 1.096873, 1.080663, 0.7176471, 0, 1, 1,
0.8254094, -1.031086, 1.864339, 0.7215686, 0, 1, 1,
0.8331453, -0.7979379, 1.325037, 0.7294118, 0, 1, 1,
0.8366526, 1.063505, -0.444708, 0.7333333, 0, 1, 1,
0.8399455, 0.911298, -0.6273701, 0.7411765, 0, 1, 1,
0.8451957, -0.5187417, 1.597313, 0.7450981, 0, 1, 1,
0.8457368, 0.8281452, -0.3832922, 0.7529412, 0, 1, 1,
0.8485739, -1.185197, 3.392418, 0.7568628, 0, 1, 1,
0.8505719, -0.2473737, 2.366626, 0.7647059, 0, 1, 1,
0.8511076, 0.04168995, 3.26701, 0.7686275, 0, 1, 1,
0.859709, -2.020526, 3.484071, 0.7764706, 0, 1, 1,
0.8602169, 1.068515, 1.137192, 0.7803922, 0, 1, 1,
0.8633465, 0.4975631, 0.09691485, 0.7882353, 0, 1, 1,
0.8662141, 0.420762, 1.434053, 0.7921569, 0, 1, 1,
0.8679103, -0.9017853, 2.71161, 0.8, 0, 1, 1,
0.8717314, 1.228271, 0.4309478, 0.8078431, 0, 1, 1,
0.8755126, 0.1077849, 2.106893, 0.8117647, 0, 1, 1,
0.8784834, -0.6490551, 2.164848, 0.8196079, 0, 1, 1,
0.8826912, 0.4105785, 1.038831, 0.8235294, 0, 1, 1,
0.8848516, 0.383052, 0.9700017, 0.8313726, 0, 1, 1,
0.8894699, 0.3708033, 0.4218466, 0.8352941, 0, 1, 1,
0.8925807, 0.09257313, 1.495873, 0.8431373, 0, 1, 1,
0.8970649, 1.683951, 0.08805588, 0.8470588, 0, 1, 1,
0.8991527, -2.022462, 3.620147, 0.854902, 0, 1, 1,
0.9016135, 0.8234784, 0.5678915, 0.8588235, 0, 1, 1,
0.9031364, -0.4575226, 2.739559, 0.8666667, 0, 1, 1,
0.903236, 0.09806571, 1.188223, 0.8705882, 0, 1, 1,
0.9036469, -0.7029445, 0.3458427, 0.8784314, 0, 1, 1,
0.9113808, -0.1361252, 0.03939437, 0.8823529, 0, 1, 1,
0.9221509, 0.9506454, 1.549636, 0.8901961, 0, 1, 1,
0.928693, -0.9610487, 0.5122442, 0.8941177, 0, 1, 1,
0.9288432, 0.4243688, 4.282554, 0.9019608, 0, 1, 1,
0.9288818, 0.8009319, 1.295685, 0.9098039, 0, 1, 1,
0.9413865, -0.4394487, 2.321261, 0.9137255, 0, 1, 1,
0.9486455, -0.1634149, 0.2892739, 0.9215686, 0, 1, 1,
0.9544556, -0.9578001, 1.63218, 0.9254902, 0, 1, 1,
0.9556724, 0.04048929, 0.8414574, 0.9333333, 0, 1, 1,
0.9625642, -1.720129, 3.384562, 0.9372549, 0, 1, 1,
0.9660388, -0.9429131, 1.190178, 0.945098, 0, 1, 1,
0.9715537, -1.952419, 4.269582, 0.9490196, 0, 1, 1,
0.97737, -1.333126, 3.229536, 0.9568627, 0, 1, 1,
0.9783781, 0.7123249, 1.143868, 0.9607843, 0, 1, 1,
0.9797942, -0.06515121, 1.227917, 0.9686275, 0, 1, 1,
0.9813352, -0.05723805, 0.943846, 0.972549, 0, 1, 1,
0.987531, -0.0157183, 2.584921, 0.9803922, 0, 1, 1,
0.9876842, 0.3644016, 2.272356, 0.9843137, 0, 1, 1,
0.9877212, -2.924652, 2.055987, 0.9921569, 0, 1, 1,
0.9880453, 1.511675, 0.2847778, 0.9960784, 0, 1, 1,
0.9898248, -0.3447007, 2.772061, 1, 0, 0.9960784, 1,
0.9928706, 2.052118, 1.428277, 1, 0, 0.9882353, 1,
0.9977596, -0.1705292, 0.4159485, 1, 0, 0.9843137, 1,
1.002631, 1.086658, 2.298398, 1, 0, 0.9764706, 1,
1.00368, -1.18366, 1.529943, 1, 0, 0.972549, 1,
1.004811, 0.7606822, 0.2752178, 1, 0, 0.9647059, 1,
1.006227, -0.8224943, 4.428138, 1, 0, 0.9607843, 1,
1.008376, -0.5929026, 2.523688, 1, 0, 0.9529412, 1,
1.009943, -2.147324, 3.903632, 1, 0, 0.9490196, 1,
1.014345, -0.561352, 0.7377563, 1, 0, 0.9411765, 1,
1.016274, -0.3571413, 3.179751, 1, 0, 0.9372549, 1,
1.01906, -0.1607052, 3.177118, 1, 0, 0.9294118, 1,
1.02643, 0.07874837, 0.5883802, 1, 0, 0.9254902, 1,
1.040741, -1.103714, 3.678772, 1, 0, 0.9176471, 1,
1.041055, -0.06083851, 2.227031, 1, 0, 0.9137255, 1,
1.0421, -0.6842558, 2.761204, 1, 0, 0.9058824, 1,
1.04457, -1.05417, 0.7899076, 1, 0, 0.9019608, 1,
1.047387, -1.12813, 2.759363, 1, 0, 0.8941177, 1,
1.048647, 0.8916951, 0.8822426, 1, 0, 0.8862745, 1,
1.049492, 0.346205, 2.028942, 1, 0, 0.8823529, 1,
1.052275, 1.292877, 0.7687811, 1, 0, 0.8745098, 1,
1.05416, 0.1082625, 1.192856, 1, 0, 0.8705882, 1,
1.056872, 0.4892384, 0.5571173, 1, 0, 0.8627451, 1,
1.058498, -0.6550474, 1.049723, 1, 0, 0.8588235, 1,
1.059503, 0.2098105, 0.9850454, 1, 0, 0.8509804, 1,
1.059583, -0.5173333, 2.966441, 1, 0, 0.8470588, 1,
1.064246, 0.5828986, -0.07041248, 1, 0, 0.8392157, 1,
1.072163, 0.3966873, 1.019168, 1, 0, 0.8352941, 1,
1.080947, -1.07697, 2.805742, 1, 0, 0.827451, 1,
1.084207, 0.8833599, -0.1197242, 1, 0, 0.8235294, 1,
1.092166, 0.001586278, 2.890179, 1, 0, 0.8156863, 1,
1.094077, 0.147618, 2.215275, 1, 0, 0.8117647, 1,
1.097672, -0.1472719, 0.786207, 1, 0, 0.8039216, 1,
1.098518, 0.8471518, 1.559765, 1, 0, 0.7960784, 1,
1.098951, 0.8436142, 1.748793, 1, 0, 0.7921569, 1,
1.11177, 0.7018104, 1.435859, 1, 0, 0.7843137, 1,
1.11494, 0.5219401, 0.7365788, 1, 0, 0.7803922, 1,
1.123623, 0.5577082, 0.5398971, 1, 0, 0.772549, 1,
1.124958, -1.430314, 2.932971, 1, 0, 0.7686275, 1,
1.125023, 1.605438, -0.1290064, 1, 0, 0.7607843, 1,
1.132149, -0.7923441, 3.29256, 1, 0, 0.7568628, 1,
1.133868, 0.6145072, -0.6488025, 1, 0, 0.7490196, 1,
1.136083, 1.661783, -0.598091, 1, 0, 0.7450981, 1,
1.137543, 0.3588246, 0.3049151, 1, 0, 0.7372549, 1,
1.142884, -0.3430008, 0.4525398, 1, 0, 0.7333333, 1,
1.148838, -2.766061, 2.025899, 1, 0, 0.7254902, 1,
1.151142, -1.450691, 1.997965, 1, 0, 0.7215686, 1,
1.156865, -1.147956, 2.554309, 1, 0, 0.7137255, 1,
1.163092, -1.563707, 2.656515, 1, 0, 0.7098039, 1,
1.167174, -1.178208, 1.949335, 1, 0, 0.7019608, 1,
1.167449, -1.215756, 0.3902745, 1, 0, 0.6941177, 1,
1.175426, 1.24802, -0.8107834, 1, 0, 0.6901961, 1,
1.175505, 1.1763, 1.804571, 1, 0, 0.682353, 1,
1.180473, -0.1956113, 1.901528, 1, 0, 0.6784314, 1,
1.185361, -0.5546327, 2.227431, 1, 0, 0.6705883, 1,
1.18928, -0.1362352, 2.777749, 1, 0, 0.6666667, 1,
1.189309, 1.191333, -1.914671, 1, 0, 0.6588235, 1,
1.18975, 0.6632666, 2.955507, 1, 0, 0.654902, 1,
1.190063, -2.87662, 4.71256, 1, 0, 0.6470588, 1,
1.193439, 0.5605955, 2.177426, 1, 0, 0.6431373, 1,
1.194263, -0.1266037, 2.09517, 1, 0, 0.6352941, 1,
1.203774, 0.08868474, 2.281972, 1, 0, 0.6313726, 1,
1.207735, -1.040082, 1.779562, 1, 0, 0.6235294, 1,
1.207891, -1.198628, 3.201104, 1, 0, 0.6196079, 1,
1.218036, -1.163326, 3.832747, 1, 0, 0.6117647, 1,
1.233091, -0.6527209, 2.203226, 1, 0, 0.6078432, 1,
1.236735, -0.5470377, 1.534127, 1, 0, 0.6, 1,
1.24051, -0.4822463, 2.690228, 1, 0, 0.5921569, 1,
1.240849, 1.848547, 0.08869799, 1, 0, 0.5882353, 1,
1.247382, 0.7202786, 0.6750383, 1, 0, 0.5803922, 1,
1.256942, -1.427312, 2.375446, 1, 0, 0.5764706, 1,
1.25968, 1.279012, -0.04613321, 1, 0, 0.5686275, 1,
1.260129, -0.7602497, 1.566462, 1, 0, 0.5647059, 1,
1.267246, -0.429252, 2.534613, 1, 0, 0.5568628, 1,
1.269439, 1.678266, 0.1462206, 1, 0, 0.5529412, 1,
1.276985, 1.964466, 0.5124736, 1, 0, 0.5450981, 1,
1.280715, -0.7969351, 1.787375, 1, 0, 0.5411765, 1,
1.288193, 0.9681946, 0.7664865, 1, 0, 0.5333334, 1,
1.289471, -0.2745639, 2.537297, 1, 0, 0.5294118, 1,
1.291889, 0.7791889, 1.203102, 1, 0, 0.5215687, 1,
1.297411, 0.03320794, 3.757207, 1, 0, 0.5176471, 1,
1.324822, 0.2944551, -0.6045379, 1, 0, 0.509804, 1,
1.328735, 1.737577, 0.3071718, 1, 0, 0.5058824, 1,
1.328838, -1.334457, 2.085229, 1, 0, 0.4980392, 1,
1.33931, 0.119864, 2.306725, 1, 0, 0.4901961, 1,
1.340632, 1.679548, 1.166972, 1, 0, 0.4862745, 1,
1.344249, -1.414159, 2.347724, 1, 0, 0.4784314, 1,
1.346004, 0.8338363, 1.075822, 1, 0, 0.4745098, 1,
1.351576, 0.4932934, 0.3867752, 1, 0, 0.4666667, 1,
1.357077, -0.4105432, 2.028102, 1, 0, 0.4627451, 1,
1.358618, -0.6068472, 0.6012535, 1, 0, 0.454902, 1,
1.366798, 1.658042, 1.278533, 1, 0, 0.4509804, 1,
1.368004, -0.9846531, 1.53687, 1, 0, 0.4431373, 1,
1.386025, -1.723924, 2.559507, 1, 0, 0.4392157, 1,
1.387192, 0.2023125, 1.996248, 1, 0, 0.4313726, 1,
1.395931, -1.427856, 2.07003, 1, 0, 0.427451, 1,
1.405721, -0.2133404, -0.5770814, 1, 0, 0.4196078, 1,
1.407632, 1.106569, 1.436389, 1, 0, 0.4156863, 1,
1.408017, -0.4603735, 1.324058, 1, 0, 0.4078431, 1,
1.411734, -0.3249558, 2.454423, 1, 0, 0.4039216, 1,
1.420797, 0.6438851, 0.3091732, 1, 0, 0.3960784, 1,
1.430288, 1.284271, 1.345352, 1, 0, 0.3882353, 1,
1.449619, -0.5676871, 2.095679, 1, 0, 0.3843137, 1,
1.451695, -0.2319714, 1.981825, 1, 0, 0.3764706, 1,
1.455884, -0.7846358, 2.72336, 1, 0, 0.372549, 1,
1.459741, -1.31106, 3.242789, 1, 0, 0.3647059, 1,
1.464944, 0.09805942, 2.679165, 1, 0, 0.3607843, 1,
1.470331, -0.06500348, 1.415576, 1, 0, 0.3529412, 1,
1.473096, 1.989326, 2.075023, 1, 0, 0.3490196, 1,
1.483145, 0.5007119, 1.799543, 1, 0, 0.3411765, 1,
1.490381, 0.374637, 0.6104633, 1, 0, 0.3372549, 1,
1.499557, -1.210818, 2.810125, 1, 0, 0.3294118, 1,
1.527306, -3.16002, 3.674726, 1, 0, 0.3254902, 1,
1.528515, 0.8285781, 1.254987, 1, 0, 0.3176471, 1,
1.532181, -0.9426414, 2.868088, 1, 0, 0.3137255, 1,
1.544207, 0.9010692, 1.408754, 1, 0, 0.3058824, 1,
1.585702, 0.2241094, 2.071091, 1, 0, 0.2980392, 1,
1.59501, 0.4226408, 1.396162, 1, 0, 0.2941177, 1,
1.601456, -0.09944803, 2.539672, 1, 0, 0.2862745, 1,
1.606468, 0.553069, 0.4315157, 1, 0, 0.282353, 1,
1.621998, -0.4934327, 3.059963, 1, 0, 0.2745098, 1,
1.625926, 1.871552, 2.606292, 1, 0, 0.2705882, 1,
1.629055, -0.4130511, 1.47561, 1, 0, 0.2627451, 1,
1.63866, 0.01271667, -1.00125, 1, 0, 0.2588235, 1,
1.642601, 1.044245, 0.01651541, 1, 0, 0.2509804, 1,
1.650443, -0.1643172, 1.844496, 1, 0, 0.2470588, 1,
1.66099, 0.6155146, 0.5079767, 1, 0, 0.2392157, 1,
1.679569, 0.2723497, 1.103826, 1, 0, 0.2352941, 1,
1.689184, 0.104201, 1.238929, 1, 0, 0.227451, 1,
1.70287, 1.026682, 1.08852, 1, 0, 0.2235294, 1,
1.703205, 1.47324, 1.229397, 1, 0, 0.2156863, 1,
1.74919, -1.267411, 1.75585, 1, 0, 0.2117647, 1,
1.7627, -0.0474963, 0.2726156, 1, 0, 0.2039216, 1,
1.766499, -1.136802, 2.099118, 1, 0, 0.1960784, 1,
1.786428, -0.330624, 0.1840537, 1, 0, 0.1921569, 1,
1.791322, -0.04465671, 2.134131, 1, 0, 0.1843137, 1,
1.792799, 0.2425962, 1.800181, 1, 0, 0.1803922, 1,
1.80319, 1.88366, 1.408593, 1, 0, 0.172549, 1,
1.82948, -0.8802143, 4.605415, 1, 0, 0.1686275, 1,
1.83301, -1.447157, 4.094198, 1, 0, 0.1607843, 1,
1.833308, -0.5678217, 2.90581, 1, 0, 0.1568628, 1,
1.845237, 0.4027028, 0.5248024, 1, 0, 0.1490196, 1,
1.916211, 0.8124381, -0.2041404, 1, 0, 0.145098, 1,
1.919208, 0.08688603, 1.253739, 1, 0, 0.1372549, 1,
1.940988, 1.104072, 0.1477389, 1, 0, 0.1333333, 1,
1.943023, -0.2187922, 2.413348, 1, 0, 0.1254902, 1,
1.945605, 1.690073, 1.303204, 1, 0, 0.1215686, 1,
1.9793, -0.7794462, 2.826982, 1, 0, 0.1137255, 1,
2.054914, -0.5835938, 3.398555, 1, 0, 0.1098039, 1,
2.06549, -1.073003, 2.473166, 1, 0, 0.1019608, 1,
2.144394, -0.1000253, 0.1896077, 1, 0, 0.09411765, 1,
2.240759, 0.9038923, 0.5613263, 1, 0, 0.09019608, 1,
2.250366, -1.087455, 2.504616, 1, 0, 0.08235294, 1,
2.392606, -1.089279, 2.237362, 1, 0, 0.07843138, 1,
2.412413, 1.363883, 1.269187, 1, 0, 0.07058824, 1,
2.414958, -0.3951484, 2.622655, 1, 0, 0.06666667, 1,
2.461554, -0.1252783, 0.1235442, 1, 0, 0.05882353, 1,
2.463774, -0.8212496, 1.627905, 1, 0, 0.05490196, 1,
2.477588, 0.06333307, 0.2118103, 1, 0, 0.04705882, 1,
2.530988, 0.3660818, 2.699758, 1, 0, 0.04313726, 1,
2.577772, 1.033907, 2.198326, 1, 0, 0.03529412, 1,
2.632178, -0.7678635, 1.207656, 1, 0, 0.03137255, 1,
2.849436, -0.7252457, 1.62197, 1, 0, 0.02352941, 1,
2.959517, 0.2190579, 1.977936, 1, 0, 0.01960784, 1,
3.071899, 0.2920387, 2.750844, 1, 0, 0.01176471, 1,
3.334038, -2.495881, 2.083639, 1, 0, 0.007843138, 1
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
-0.08939922, -4.550121, -7.212928, 0, -0.5, 0.5, 0.5,
-0.08939922, -4.550121, -7.212928, 1, -0.5, 0.5, 0.5,
-0.08939922, -4.550121, -7.212928, 1, 1.5, 0.5, 0.5,
-0.08939922, -4.550121, -7.212928, 0, 1.5, 0.5, 0.5
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
-4.673381, -0.2029121, -7.212928, 0, -0.5, 0.5, 0.5,
-4.673381, -0.2029121, -7.212928, 1, -0.5, 0.5, 0.5,
-4.673381, -0.2029121, -7.212928, 1, 1.5, 0.5, 0.5,
-4.673381, -0.2029121, -7.212928, 0, 1.5, 0.5, 0.5
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
-4.673381, -4.550121, -0.05118942, 0, -0.5, 0.5, 0.5,
-4.673381, -4.550121, -0.05118942, 1, -0.5, 0.5, 0.5,
-4.673381, -4.550121, -0.05118942, 1, 1.5, 0.5, 0.5,
-4.673381, -4.550121, -0.05118942, 0, 1.5, 0.5, 0.5
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
-3, -3.546919, -5.560219,
3, -3.546919, -5.560219,
-3, -3.546919, -5.560219,
-3, -3.714119, -5.835671,
-2, -3.546919, -5.560219,
-2, -3.714119, -5.835671,
-1, -3.546919, -5.560219,
-1, -3.714119, -5.835671,
0, -3.546919, -5.560219,
0, -3.714119, -5.835671,
1, -3.546919, -5.560219,
1, -3.714119, -5.835671,
2, -3.546919, -5.560219,
2, -3.714119, -5.835671,
3, -3.546919, -5.560219,
3, -3.714119, -5.835671
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
-3, -4.04852, -6.386574, 0, -0.5, 0.5, 0.5,
-3, -4.04852, -6.386574, 1, -0.5, 0.5, 0.5,
-3, -4.04852, -6.386574, 1, 1.5, 0.5, 0.5,
-3, -4.04852, -6.386574, 0, 1.5, 0.5, 0.5,
-2, -4.04852, -6.386574, 0, -0.5, 0.5, 0.5,
-2, -4.04852, -6.386574, 1, -0.5, 0.5, 0.5,
-2, -4.04852, -6.386574, 1, 1.5, 0.5, 0.5,
-2, -4.04852, -6.386574, 0, 1.5, 0.5, 0.5,
-1, -4.04852, -6.386574, 0, -0.5, 0.5, 0.5,
-1, -4.04852, -6.386574, 1, -0.5, 0.5, 0.5,
-1, -4.04852, -6.386574, 1, 1.5, 0.5, 0.5,
-1, -4.04852, -6.386574, 0, 1.5, 0.5, 0.5,
0, -4.04852, -6.386574, 0, -0.5, 0.5, 0.5,
0, -4.04852, -6.386574, 1, -0.5, 0.5, 0.5,
0, -4.04852, -6.386574, 1, 1.5, 0.5, 0.5,
0, -4.04852, -6.386574, 0, 1.5, 0.5, 0.5,
1, -4.04852, -6.386574, 0, -0.5, 0.5, 0.5,
1, -4.04852, -6.386574, 1, -0.5, 0.5, 0.5,
1, -4.04852, -6.386574, 1, 1.5, 0.5, 0.5,
1, -4.04852, -6.386574, 0, 1.5, 0.5, 0.5,
2, -4.04852, -6.386574, 0, -0.5, 0.5, 0.5,
2, -4.04852, -6.386574, 1, -0.5, 0.5, 0.5,
2, -4.04852, -6.386574, 1, 1.5, 0.5, 0.5,
2, -4.04852, -6.386574, 0, 1.5, 0.5, 0.5,
3, -4.04852, -6.386574, 0, -0.5, 0.5, 0.5,
3, -4.04852, -6.386574, 1, -0.5, 0.5, 0.5,
3, -4.04852, -6.386574, 1, 1.5, 0.5, 0.5,
3, -4.04852, -6.386574, 0, 1.5, 0.5, 0.5
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
-3.615539, -3, -5.560219,
-3.615539, 3, -5.560219,
-3.615539, -3, -5.560219,
-3.791846, -3, -5.835671,
-3.615539, -2, -5.560219,
-3.791846, -2, -5.835671,
-3.615539, -1, -5.560219,
-3.791846, -1, -5.835671,
-3.615539, 0, -5.560219,
-3.791846, 0, -5.835671,
-3.615539, 1, -5.560219,
-3.791846, 1, -5.835671,
-3.615539, 2, -5.560219,
-3.791846, 2, -5.835671,
-3.615539, 3, -5.560219,
-3.791846, 3, -5.835671
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
-4.14446, -3, -6.386574, 0, -0.5, 0.5, 0.5,
-4.14446, -3, -6.386574, 1, -0.5, 0.5, 0.5,
-4.14446, -3, -6.386574, 1, 1.5, 0.5, 0.5,
-4.14446, -3, -6.386574, 0, 1.5, 0.5, 0.5,
-4.14446, -2, -6.386574, 0, -0.5, 0.5, 0.5,
-4.14446, -2, -6.386574, 1, -0.5, 0.5, 0.5,
-4.14446, -2, -6.386574, 1, 1.5, 0.5, 0.5,
-4.14446, -2, -6.386574, 0, 1.5, 0.5, 0.5,
-4.14446, -1, -6.386574, 0, -0.5, 0.5, 0.5,
-4.14446, -1, -6.386574, 1, -0.5, 0.5, 0.5,
-4.14446, -1, -6.386574, 1, 1.5, 0.5, 0.5,
-4.14446, -1, -6.386574, 0, 1.5, 0.5, 0.5,
-4.14446, 0, -6.386574, 0, -0.5, 0.5, 0.5,
-4.14446, 0, -6.386574, 1, -0.5, 0.5, 0.5,
-4.14446, 0, -6.386574, 1, 1.5, 0.5, 0.5,
-4.14446, 0, -6.386574, 0, 1.5, 0.5, 0.5,
-4.14446, 1, -6.386574, 0, -0.5, 0.5, 0.5,
-4.14446, 1, -6.386574, 1, -0.5, 0.5, 0.5,
-4.14446, 1, -6.386574, 1, 1.5, 0.5, 0.5,
-4.14446, 1, -6.386574, 0, 1.5, 0.5, 0.5,
-4.14446, 2, -6.386574, 0, -0.5, 0.5, 0.5,
-4.14446, 2, -6.386574, 1, -0.5, 0.5, 0.5,
-4.14446, 2, -6.386574, 1, 1.5, 0.5, 0.5,
-4.14446, 2, -6.386574, 0, 1.5, 0.5, 0.5,
-4.14446, 3, -6.386574, 0, -0.5, 0.5, 0.5,
-4.14446, 3, -6.386574, 1, -0.5, 0.5, 0.5,
-4.14446, 3, -6.386574, 1, 1.5, 0.5, 0.5,
-4.14446, 3, -6.386574, 0, 1.5, 0.5, 0.5
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
-3.615539, -3.546919, -4,
-3.615539, -3.546919, 4,
-3.615539, -3.546919, -4,
-3.791846, -3.714119, -4,
-3.615539, -3.546919, -2,
-3.791846, -3.714119, -2,
-3.615539, -3.546919, 0,
-3.791846, -3.714119, 0,
-3.615539, -3.546919, 2,
-3.791846, -3.714119, 2,
-3.615539, -3.546919, 4,
-3.791846, -3.714119, 4
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
-4.14446, -4.04852, -4, 0, -0.5, 0.5, 0.5,
-4.14446, -4.04852, -4, 1, -0.5, 0.5, 0.5,
-4.14446, -4.04852, -4, 1, 1.5, 0.5, 0.5,
-4.14446, -4.04852, -4, 0, 1.5, 0.5, 0.5,
-4.14446, -4.04852, -2, 0, -0.5, 0.5, 0.5,
-4.14446, -4.04852, -2, 1, -0.5, 0.5, 0.5,
-4.14446, -4.04852, -2, 1, 1.5, 0.5, 0.5,
-4.14446, -4.04852, -2, 0, 1.5, 0.5, 0.5,
-4.14446, -4.04852, 0, 0, -0.5, 0.5, 0.5,
-4.14446, -4.04852, 0, 1, -0.5, 0.5, 0.5,
-4.14446, -4.04852, 0, 1, 1.5, 0.5, 0.5,
-4.14446, -4.04852, 0, 0, 1.5, 0.5, 0.5,
-4.14446, -4.04852, 2, 0, -0.5, 0.5, 0.5,
-4.14446, -4.04852, 2, 1, -0.5, 0.5, 0.5,
-4.14446, -4.04852, 2, 1, 1.5, 0.5, 0.5,
-4.14446, -4.04852, 2, 0, 1.5, 0.5, 0.5,
-4.14446, -4.04852, 4, 0, -0.5, 0.5, 0.5,
-4.14446, -4.04852, 4, 1, -0.5, 0.5, 0.5,
-4.14446, -4.04852, 4, 1, 1.5, 0.5, 0.5,
-4.14446, -4.04852, 4, 0, 1.5, 0.5, 0.5
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
-3.615539, -3.546919, -5.560219,
-3.615539, 3.141095, -5.560219,
-3.615539, -3.546919, 5.45784,
-3.615539, 3.141095, 5.45784,
-3.615539, -3.546919, -5.560219,
-3.615539, -3.546919, 5.45784,
-3.615539, 3.141095, -5.560219,
-3.615539, 3.141095, 5.45784,
-3.615539, -3.546919, -5.560219,
3.436741, -3.546919, -5.560219,
-3.615539, -3.546919, 5.45784,
3.436741, -3.546919, 5.45784,
-3.615539, 3.141095, -5.560219,
3.436741, 3.141095, -5.560219,
-3.615539, 3.141095, 5.45784,
3.436741, 3.141095, 5.45784,
3.436741, -3.546919, -5.560219,
3.436741, 3.141095, -5.560219,
3.436741, -3.546919, 5.45784,
3.436741, 3.141095, 5.45784,
3.436741, -3.546919, -5.560219,
3.436741, -3.546919, 5.45784,
3.436741, 3.141095, -5.560219,
3.436741, 3.141095, 5.45784
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
var radius = 7.845369;
var distance = 34.90493;
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
mvMatrix.translate( 0.08939922, 0.2029121, 0.05118942 );
mvMatrix.scale( 1.202812, 1.268324, 0.7698784 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.90493);
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
diclomezine<-read.table("diclomezine.xyz")
```

```
## Error in read.table("diclomezine.xyz"): no lines available in input
```

```r
x<-diclomezine$V2
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
```

```r
y<-diclomezine$V3
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
```

```r
z<-diclomezine$V4
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
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
-3.512836, -1.450313, -2.286866, 0, 0, 1, 1, 1,
-2.759728, -0.4977537, -0.2357328, 1, 0, 0, 1, 1,
-2.592264, -2.468761, -2.667806, 1, 0, 0, 1, 1,
-2.571974, -1.096544, -1.273983, 1, 0, 0, 1, 1,
-2.335755, 0.2872471, -2.345048, 1, 0, 0, 1, 1,
-2.265431, -0.1472104, -1.51066, 1, 0, 0, 1, 1,
-2.211218, -0.2558361, -1.050766, 0, 0, 0, 1, 1,
-2.150795, 0.06798971, -1.751793, 0, 0, 0, 1, 1,
-2.140149, 1.249494, -0.4710563, 0, 0, 0, 1, 1,
-2.137022, 0.4930151, -0.7447624, 0, 0, 0, 1, 1,
-2.1177, -0.4539446, -1.604858, 0, 0, 0, 1, 1,
-2.104639, -1.328331, -1.258742, 0, 0, 0, 1, 1,
-2.085382, 1.501823, -1.422, 0, 0, 0, 1, 1,
-2.085323, -0.4476922, -2.481838, 1, 1, 1, 1, 1,
-2.07587, 1.552698, -2.282447, 1, 1, 1, 1, 1,
-2.063955, 2.002039, -1.054625, 1, 1, 1, 1, 1,
-2.036188, -1.253182, -2.755119, 1, 1, 1, 1, 1,
-2.014758, -0.4573359, -1.507705, 1, 1, 1, 1, 1,
-1.97577, -0.08139396, -0.9826252, 1, 1, 1, 1, 1,
-1.948099, 0.4491202, -1.120203, 1, 1, 1, 1, 1,
-1.943125, -1.481292, -2.925742, 1, 1, 1, 1, 1,
-1.939748, 0.2143486, 0.8629905, 1, 1, 1, 1, 1,
-1.921469, 1.15168, -0.8157477, 1, 1, 1, 1, 1,
-1.917029, -2.433593, -1.202314, 1, 1, 1, 1, 1,
-1.897839, -0.2922856, -1.831473, 1, 1, 1, 1, 1,
-1.851534, -0.6602601, -1.8116, 1, 1, 1, 1, 1,
-1.834469, 0.008559886, -2.037384, 1, 1, 1, 1, 1,
-1.832054, -0.3108496, -3.064705, 1, 1, 1, 1, 1,
-1.81983, 1.52169, -0.7540491, 0, 0, 1, 1, 1,
-1.818261, -0.2362398, -1.771904, 1, 0, 0, 1, 1,
-1.808093, -1.221779, -1.639052, 1, 0, 0, 1, 1,
-1.777252, -2.209778, -2.262423, 1, 0, 0, 1, 1,
-1.774858, -1.704839, -0.7216924, 1, 0, 0, 1, 1,
-1.768131, 0.833148, -0.2389446, 1, 0, 0, 1, 1,
-1.708676, -0.1830185, -2.559708, 0, 0, 0, 1, 1,
-1.707766, 1.574733, -0.6041771, 0, 0, 0, 1, 1,
-1.705838, 1.302894, -1.559968, 0, 0, 0, 1, 1,
-1.69998, 0.1064117, -1.909237, 0, 0, 0, 1, 1,
-1.693334, 1.581585, 0.2019161, 0, 0, 0, 1, 1,
-1.688216, 0.1909562, -0.44698, 0, 0, 0, 1, 1,
-1.687194, -0.7592993, -1.341775, 0, 0, 0, 1, 1,
-1.648399, 0.8744267, -2.498032, 1, 1, 1, 1, 1,
-1.636002, -0.3900937, -2.189187, 1, 1, 1, 1, 1,
-1.633422, -1.252841, -1.496268, 1, 1, 1, 1, 1,
-1.630641, -0.01322837, -3.0384, 1, 1, 1, 1, 1,
-1.624328, -0.8402302, -3.350393, 1, 1, 1, 1, 1,
-1.619879, -0.004639384, -1.836413, 1, 1, 1, 1, 1,
-1.599338, 0.6530012, -1.511639, 1, 1, 1, 1, 1,
-1.595599, 0.4442643, -1.568566, 1, 1, 1, 1, 1,
-1.587278, -1.414724, -1.950699, 1, 1, 1, 1, 1,
-1.57041, 1.422961, -2.280324, 1, 1, 1, 1, 1,
-1.568533, -1.146888, -1.59128, 1, 1, 1, 1, 1,
-1.562353, -0.06291921, -2.075179, 1, 1, 1, 1, 1,
-1.560827, 0.8235289, -0.159146, 1, 1, 1, 1, 1,
-1.555928, 2.147563, -1.693093, 1, 1, 1, 1, 1,
-1.554806, -1.907445, -3.121302, 1, 1, 1, 1, 1,
-1.551321, 0.8821341, -1.493919, 0, 0, 1, 1, 1,
-1.548344, 0.4501226, -2.575157, 1, 0, 0, 1, 1,
-1.547217, -0.02570216, -1.95777, 1, 0, 0, 1, 1,
-1.5401, -1.124879, -3.732998, 1, 0, 0, 1, 1,
-1.532771, -3.116691, -2.17468, 1, 0, 0, 1, 1,
-1.526039, 1.624034, -2.028007, 1, 0, 0, 1, 1,
-1.516595, -1.100133, -3.136041, 0, 0, 0, 1, 1,
-1.505939, -0.1219589, -1.253337, 0, 0, 0, 1, 1,
-1.495083, -0.1179263, -1.386403, 0, 0, 0, 1, 1,
-1.493032, -1.69818, -3.119206, 0, 0, 0, 1, 1,
-1.475909, -0.5617896, -3.376969, 0, 0, 0, 1, 1,
-1.470085, -0.897029, -1.827473, 0, 0, 0, 1, 1,
-1.46688, -0.5161224, -1.38392, 0, 0, 0, 1, 1,
-1.453143, -1.165321, -1.227969, 1, 1, 1, 1, 1,
-1.423315, 0.660061, -1.071001, 1, 1, 1, 1, 1,
-1.41556, 0.8498312, -2.267967, 1, 1, 1, 1, 1,
-1.410605, -0.2595217, -1.131337, 1, 1, 1, 1, 1,
-1.40817, -1.287382, -3.410298, 1, 1, 1, 1, 1,
-1.399025, 2.060931, -1.916452, 1, 1, 1, 1, 1,
-1.397895, -0.2096866, -0.7959126, 1, 1, 1, 1, 1,
-1.390442, -1.05154, -1.674611, 1, 1, 1, 1, 1,
-1.368889, 1.198567, 0.380643, 1, 1, 1, 1, 1,
-1.367666, 1.009789, -1.737372, 1, 1, 1, 1, 1,
-1.36481, -1.234187, -2.084976, 1, 1, 1, 1, 1,
-1.363564, 0.6966161, 1.286559, 1, 1, 1, 1, 1,
-1.344852, 1.146485, -0.5386807, 1, 1, 1, 1, 1,
-1.334002, -0.5641358, -2.524715, 1, 1, 1, 1, 1,
-1.333867, -0.3026617, -1.906338, 1, 1, 1, 1, 1,
-1.324033, -0.6247692, -0.8104663, 0, 0, 1, 1, 1,
-1.308775, 2.169578, -1.718995, 1, 0, 0, 1, 1,
-1.298955, 0.9685438, -0.93761, 1, 0, 0, 1, 1,
-1.298681, -0.3086629, -0.4148835, 1, 0, 0, 1, 1,
-1.297949, -0.7354504, -2.439373, 1, 0, 0, 1, 1,
-1.293441, -0.03995589, -2.433392, 1, 0, 0, 1, 1,
-1.287112, 1.177264, 0.5115217, 0, 0, 0, 1, 1,
-1.284951, 1.866426, -0.7283261, 0, 0, 0, 1, 1,
-1.276865, 1.207315, -0.5583715, 0, 0, 0, 1, 1,
-1.26738, 0.05748574, -1.675628, 0, 0, 0, 1, 1,
-1.266641, 0.07040871, -2.796554, 0, 0, 0, 1, 1,
-1.265014, -0.3554071, -2.454203, 0, 0, 0, 1, 1,
-1.265009, -1.334742, -2.452061, 0, 0, 0, 1, 1,
-1.262127, 0.4002352, -0.4627318, 1, 1, 1, 1, 1,
-1.25651, 0.4495986, -1.856732, 1, 1, 1, 1, 1,
-1.251614, 1.556036, 0.2792515, 1, 1, 1, 1, 1,
-1.24865, 0.9868524, -2.04977, 1, 1, 1, 1, 1,
-1.245775, 0.3680958, -1.053518, 1, 1, 1, 1, 1,
-1.242799, 0.1562144, -3.084287, 1, 1, 1, 1, 1,
-1.23999, 0.6093512, -0.8062292, 1, 1, 1, 1, 1,
-1.232528, 0.04020194, -0.594646, 1, 1, 1, 1, 1,
-1.222994, -0.9930566, -2.047326, 1, 1, 1, 1, 1,
-1.216136, -0.359616, -1.336518, 1, 1, 1, 1, 1,
-1.2141, -2.005854, -1.584146, 1, 1, 1, 1, 1,
-1.208388, 0.01223667, -0.2861703, 1, 1, 1, 1, 1,
-1.208109, -0.3991602, -2.235552, 1, 1, 1, 1, 1,
-1.202305, 1.071356, 0.08286051, 1, 1, 1, 1, 1,
-1.200241, -0.09406669, -1.262451, 1, 1, 1, 1, 1,
-1.199991, 0.5868759, 0.4066674, 0, 0, 1, 1, 1,
-1.19015, 0.6913229, -3.392871, 1, 0, 0, 1, 1,
-1.189341, 1.043569, -1.185588, 1, 0, 0, 1, 1,
-1.186844, -0.4488966, -1.136857, 1, 0, 0, 1, 1,
-1.183955, 0.1533791, 0.05212466, 1, 0, 0, 1, 1,
-1.172269, -0.3168003, -1.565989, 1, 0, 0, 1, 1,
-1.169086, -0.7728899, -3.001713, 0, 0, 0, 1, 1,
-1.161346, -0.09336951, -1.859894, 0, 0, 0, 1, 1,
-1.159501, 0.882318, -2.650423, 0, 0, 0, 1, 1,
-1.155066, 0.6906783, -1.354882, 0, 0, 0, 1, 1,
-1.145931, -0.203433, -2.148275, 0, 0, 0, 1, 1,
-1.14497, 0.380448, -1.735262, 0, 0, 0, 1, 1,
-1.143319, -0.1046757, -3.191609, 0, 0, 0, 1, 1,
-1.141436, -0.2270974, -1.110048, 1, 1, 1, 1, 1,
-1.137692, -0.4870174, -1.484555, 1, 1, 1, 1, 1,
-1.137631, 0.7220122, -1.331856, 1, 1, 1, 1, 1,
-1.125402, -1.573133, -3.672962, 1, 1, 1, 1, 1,
-1.119282, -0.7513195, -0.736919, 1, 1, 1, 1, 1,
-1.118334, 0.7507046, -2.132027, 1, 1, 1, 1, 1,
-1.117875, 0.1721157, -1.204014, 1, 1, 1, 1, 1,
-1.117826, -0.02893145, -2.12536, 1, 1, 1, 1, 1,
-1.111318, -0.6700811, -2.133464, 1, 1, 1, 1, 1,
-1.105972, 1.034202, -1.496704, 1, 1, 1, 1, 1,
-1.099003, -1.659862, -0.05897287, 1, 1, 1, 1, 1,
-1.093959, -0.1315206, -2.297881, 1, 1, 1, 1, 1,
-1.091525, 0.3079216, -1.739986, 1, 1, 1, 1, 1,
-1.078761, 0.3196847, -3.155008, 1, 1, 1, 1, 1,
-1.07533, -0.474068, -1.360128, 1, 1, 1, 1, 1,
-1.074633, -0.1458069, -2.793322, 0, 0, 1, 1, 1,
-1.072106, 0.2846174, -0.3443143, 1, 0, 0, 1, 1,
-1.071532, 0.6968754, -0.04627706, 1, 0, 0, 1, 1,
-1.064132, -2.029864, -2.566962, 1, 0, 0, 1, 1,
-1.064041, 0.1750173, -3.257046, 1, 0, 0, 1, 1,
-1.05986, -1.092385, -2.01023, 1, 0, 0, 1, 1,
-1.05848, -0.9072968, -0.725423, 0, 0, 0, 1, 1,
-1.057177, 1.386125, -0.6038426, 0, 0, 0, 1, 1,
-1.055096, 0.4474919, -1.29363, 0, 0, 0, 1, 1,
-1.053916, -1.241749, -3.177625, 0, 0, 0, 1, 1,
-1.050601, -1.336767, -3.421257, 0, 0, 0, 1, 1,
-1.037274, 3.043696, -1.323958, 0, 0, 0, 1, 1,
-1.029407, -0.8776102, -3.481282, 0, 0, 0, 1, 1,
-1.02853, 0.9362594, 0.0526697, 1, 1, 1, 1, 1,
-1.019524, 1.063649, -0.9115834, 1, 1, 1, 1, 1,
-1.006057, 0.2945665, -1.620688, 1, 1, 1, 1, 1,
-1.00596, 0.04049988, -3.215099, 1, 1, 1, 1, 1,
-1.003527, -0.3766683, -1.507929, 1, 1, 1, 1, 1,
-1.001996, -2.262364, -3.289925, 1, 1, 1, 1, 1,
-0.9933418, -1.173648, -2.263317, 1, 1, 1, 1, 1,
-0.9882985, -0.5493534, -2.096858, 1, 1, 1, 1, 1,
-0.9865973, 0.509481, -2.090588, 1, 1, 1, 1, 1,
-0.9740465, 0.6595246, -0.2083034, 1, 1, 1, 1, 1,
-0.9669152, -0.6562335, -1.882594, 1, 1, 1, 1, 1,
-0.9510366, -0.7579992, -2.143604, 1, 1, 1, 1, 1,
-0.9500038, -1.184572, -2.742419, 1, 1, 1, 1, 1,
-0.9473559, -0.3759778, -1.865456, 1, 1, 1, 1, 1,
-0.9470527, 1.356499, -0.8729488, 1, 1, 1, 1, 1,
-0.9459709, 0.5037605, -0.328273, 0, 0, 1, 1, 1,
-0.9449975, 1.259708, -2.874882, 1, 0, 0, 1, 1,
-0.9415835, -0.7896144, -0.6495857, 1, 0, 0, 1, 1,
-0.9312968, -0.5496653, -0.9971228, 1, 0, 0, 1, 1,
-0.9309402, -0.1407275, -3.975064, 1, 0, 0, 1, 1,
-0.9277785, 1.774224, -1.167318, 1, 0, 0, 1, 1,
-0.9250262, -0.001270399, -2.690398, 0, 0, 0, 1, 1,
-0.9245227, 1.863799, -1.085194, 0, 0, 0, 1, 1,
-0.9188728, -1.887789, -1.173658, 0, 0, 0, 1, 1,
-0.9171066, 0.7627542, -0.8737996, 0, 0, 0, 1, 1,
-0.9169317, -1.497665, -0.7266314, 0, 0, 0, 1, 1,
-0.9159498, -0.7102107, -1.154529, 0, 0, 0, 1, 1,
-0.9112087, -1.362735, -3.571786, 0, 0, 0, 1, 1,
-0.9097853, 0.1369846, -1.668284, 1, 1, 1, 1, 1,
-0.9048488, 0.1393645, -0.7539111, 1, 1, 1, 1, 1,
-0.9043949, -1.355843, -3.78235, 1, 1, 1, 1, 1,
-0.8995614, 0.4999294, -1.389406, 1, 1, 1, 1, 1,
-0.8963467, 0.9443842, -2.405471, 1, 1, 1, 1, 1,
-0.8934368, -0.5982224, -2.982175, 1, 1, 1, 1, 1,
-0.8925278, 0.003115326, -0.992386, 1, 1, 1, 1, 1,
-0.8845436, 1.085853, -0.2572718, 1, 1, 1, 1, 1,
-0.8841564, -0.3741347, -1.791801, 1, 1, 1, 1, 1,
-0.8831026, -0.5992431, -1.998323, 1, 1, 1, 1, 1,
-0.8808366, 0.01429853, -1.124198, 1, 1, 1, 1, 1,
-0.8680544, -0.9460667, -3.632676, 1, 1, 1, 1, 1,
-0.8668399, -0.813472, -3.455985, 1, 1, 1, 1, 1,
-0.8578152, -0.0518314, -1.645322, 1, 1, 1, 1, 1,
-0.8494738, 1.714206, -1.428899, 1, 1, 1, 1, 1,
-0.8477462, -0.5058668, -2.775475, 0, 0, 1, 1, 1,
-0.8469869, 0.5030418, -2.226791, 1, 0, 0, 1, 1,
-0.8384245, -0.1877162, 0.3570418, 1, 0, 0, 1, 1,
-0.8383138, 0.1040844, -2.66118, 1, 0, 0, 1, 1,
-0.8353938, -0.3087001, -3.343423, 1, 0, 0, 1, 1,
-0.8351839, 0.9946972, 0.4930955, 1, 0, 0, 1, 1,
-0.8323918, -0.4987914, -2.075042, 0, 0, 0, 1, 1,
-0.831337, 1.165074, -2.184634, 0, 0, 0, 1, 1,
-0.8297431, -0.9197523, -1.336047, 0, 0, 0, 1, 1,
-0.8228641, -1.329596, -3.54337, 0, 0, 0, 1, 1,
-0.8208752, 0.9930415, 1.143124, 0, 0, 0, 1, 1,
-0.8191402, -0.25951, -0.8134069, 0, 0, 0, 1, 1,
-0.8182013, 0.88283, 0.06603176, 0, 0, 0, 1, 1,
-0.8141344, -0.7725484, -2.312981, 1, 1, 1, 1, 1,
-0.8121581, 1.039522, -1.218405, 1, 1, 1, 1, 1,
-0.807553, 0.8257529, -1.203966, 1, 1, 1, 1, 1,
-0.7971435, -0.6048929, -1.148348, 1, 1, 1, 1, 1,
-0.7948718, 2.086709, -0.6101196, 1, 1, 1, 1, 1,
-0.7940026, -0.5715925, -3.120835, 1, 1, 1, 1, 1,
-0.7909819, 1.135405, -0.2546868, 1, 1, 1, 1, 1,
-0.7863222, 2.503013, -0.5756721, 1, 1, 1, 1, 1,
-0.783519, -1.803356, -3.424778, 1, 1, 1, 1, 1,
-0.7820045, -0.1767385, -2.678682, 1, 1, 1, 1, 1,
-0.7731898, 0.6819838, 0.5164358, 1, 1, 1, 1, 1,
-0.7709965, 1.353904, -0.4627713, 1, 1, 1, 1, 1,
-0.7681662, -0.08976088, -3.2597, 1, 1, 1, 1, 1,
-0.7677976, -1.011653, -2.411731, 1, 1, 1, 1, 1,
-0.7669755, -0.3267137, -0.9498855, 1, 1, 1, 1, 1,
-0.7647543, -0.8171567, -1.820476, 0, 0, 1, 1, 1,
-0.7616887, -0.7939605, -1.937466, 1, 0, 0, 1, 1,
-0.7604111, -0.2363886, -0.5217667, 1, 0, 0, 1, 1,
-0.7586106, 0.9911698, -1.181031, 1, 0, 0, 1, 1,
-0.7560413, 1.937675, -0.9047745, 1, 0, 0, 1, 1,
-0.7544332, -0.4493134, -1.56479, 1, 0, 0, 1, 1,
-0.7539635, 0.6164438, -1.593799, 0, 0, 0, 1, 1,
-0.7526256, -1.127917, -1.596504, 0, 0, 0, 1, 1,
-0.7502339, -0.9849005, -3.120303, 0, 0, 0, 1, 1,
-0.7442497, -1.115981, -3.594855, 0, 0, 0, 1, 1,
-0.7363572, 0.05199824, -1.963685, 0, 0, 0, 1, 1,
-0.7319034, -2.084922, -3.031846, 0, 0, 0, 1, 1,
-0.7299968, 0.5713946, -0.2469049, 0, 0, 0, 1, 1,
-0.7284932, 1.428513, -0.5941287, 1, 1, 1, 1, 1,
-0.7123346, 0.2877508, -2.026381, 1, 1, 1, 1, 1,
-0.710166, 0.4202789, -1.120886, 1, 1, 1, 1, 1,
-0.7101062, 0.08706035, -0.5618315, 1, 1, 1, 1, 1,
-0.707224, -1.379734, -1.541676, 1, 1, 1, 1, 1,
-0.7044945, 0.3265746, -3.166624, 1, 1, 1, 1, 1,
-0.695831, 1.407275, 0.6550159, 1, 1, 1, 1, 1,
-0.6955624, -3.449521, -3.025472, 1, 1, 1, 1, 1,
-0.6933163, 1.604184, 0.6571563, 1, 1, 1, 1, 1,
-0.6893868, 0.2205016, -2.478776, 1, 1, 1, 1, 1,
-0.6877898, -0.8194553, -1.857923, 1, 1, 1, 1, 1,
-0.6735018, 0.5432852, -1.729456, 1, 1, 1, 1, 1,
-0.6722253, -0.721151, -3.696822, 1, 1, 1, 1, 1,
-0.6708496, 0.1601366, -1.113983, 1, 1, 1, 1, 1,
-0.6658685, 0.05836654, -1.931492, 1, 1, 1, 1, 1,
-0.6604362, -0.1347196, -1.501927, 0, 0, 1, 1, 1,
-0.6598452, 0.5343568, -1.637465, 1, 0, 0, 1, 1,
-0.6542818, 1.211655, 1.359247, 1, 0, 0, 1, 1,
-0.6510301, -0.05621605, -2.375058, 1, 0, 0, 1, 1,
-0.6510109, 0.6426097, -1.908297, 1, 0, 0, 1, 1,
-0.645425, 1.092906, -1.432362, 1, 0, 0, 1, 1,
-0.6435593, -1.261834, -2.250299, 0, 0, 0, 1, 1,
-0.6402969, 0.5173654, -1.086946, 0, 0, 0, 1, 1,
-0.6297657, -0.4327505, -1.04513, 0, 0, 0, 1, 1,
-0.6294143, 0.8090463, -0.5597012, 0, 0, 0, 1, 1,
-0.6264227, 0.06119776, -2.45518, 0, 0, 0, 1, 1,
-0.6256095, -0.2900919, -2.707787, 0, 0, 0, 1, 1,
-0.6246065, -0.6686641, -2.41384, 0, 0, 0, 1, 1,
-0.6214569, -1.047633, -3.319859, 1, 1, 1, 1, 1,
-0.6211787, 2.139117, -0.5611667, 1, 1, 1, 1, 1,
-0.6207619, 2.153389, 1.688807, 1, 1, 1, 1, 1,
-0.6174707, 1.132883, -0.4680618, 1, 1, 1, 1, 1,
-0.6173906, 1.582973, -0.02520124, 1, 1, 1, 1, 1,
-0.6095058, 0.5480726, 0.3858202, 1, 1, 1, 1, 1,
-0.6086031, 0.8416321, 0.567169, 1, 1, 1, 1, 1,
-0.6065673, 0.1962197, -1.723491, 1, 1, 1, 1, 1,
-0.6008513, -0.5641004, -3.48795, 1, 1, 1, 1, 1,
-0.5989397, 0.9686891, -2.399964, 1, 1, 1, 1, 1,
-0.5962337, 0.8733111, -1.616437, 1, 1, 1, 1, 1,
-0.5959162, 0.1715229, -1.63948, 1, 1, 1, 1, 1,
-0.5951391, -0.5799752, -0.8668111, 1, 1, 1, 1, 1,
-0.5934247, -0.3155804, -1.526803, 1, 1, 1, 1, 1,
-0.5933465, -1.123929, -3.574743, 1, 1, 1, 1, 1,
-0.5901103, -0.868398, -1.54963, 0, 0, 1, 1, 1,
-0.5888515, 1.299042, -1.618071e-05, 1, 0, 0, 1, 1,
-0.5875139, 1.254166, -0.7431158, 1, 0, 0, 1, 1,
-0.5859486, -0.5407649, -1.447435, 1, 0, 0, 1, 1,
-0.5822678, 0.0009183653, -0.7580144, 1, 0, 0, 1, 1,
-0.5749094, -0.8524387, -2.943296, 1, 0, 0, 1, 1,
-0.5735831, -0.3103537, -2.375681, 0, 0, 0, 1, 1,
-0.5706281, 1.428451, -1.03061, 0, 0, 0, 1, 1,
-0.5661149, 0.02261984, -1.60036, 0, 0, 0, 1, 1,
-0.5647742, 1.792619, -0.4419237, 0, 0, 0, 1, 1,
-0.5621371, -0.9477468, -2.867496, 0, 0, 0, 1, 1,
-0.5615313, -0.145992, -2.219589, 0, 0, 0, 1, 1,
-0.5512074, 0.2139133, -0.8135487, 0, 0, 0, 1, 1,
-0.550013, 0.6214522, -1.11489, 1, 1, 1, 1, 1,
-0.5494155, -0.8282041, -1.273757, 1, 1, 1, 1, 1,
-0.5291926, 1.620026, 0.1746981, 1, 1, 1, 1, 1,
-0.5208274, 0.2415164, -2.097371, 1, 1, 1, 1, 1,
-0.5197689, -0.5119357, -0.8673835, 1, 1, 1, 1, 1,
-0.517325, -1.572865, -3.091274, 1, 1, 1, 1, 1,
-0.5159226, -1.203078, -1.582557, 1, 1, 1, 1, 1,
-0.515641, -0.0918049, -1.186964, 1, 1, 1, 1, 1,
-0.5153699, -0.9883061, -3.421896, 1, 1, 1, 1, 1,
-0.5132911, 2.32957, 0.3174936, 1, 1, 1, 1, 1,
-0.5084761, -1.660938, -4.085585, 1, 1, 1, 1, 1,
-0.500736, -0.2839107, -2.011387, 1, 1, 1, 1, 1,
-0.500695, 0.558975, -2.210426, 1, 1, 1, 1, 1,
-0.4960128, 1.526746, -0.4783016, 1, 1, 1, 1, 1,
-0.4936577, 0.8049963, -0.8413741, 1, 1, 1, 1, 1,
-0.4898828, 0.169437, 0.3196565, 0, 0, 1, 1, 1,
-0.4894641, 0.07420553, -0.4984905, 1, 0, 0, 1, 1,
-0.4889237, 1.347676, 1.60367, 1, 0, 0, 1, 1,
-0.4842303, 0.125891, -0.2800421, 1, 0, 0, 1, 1,
-0.4822694, -0.4901005, -1.320297, 1, 0, 0, 1, 1,
-0.4793029, 0.2943323, -1.297231, 1, 0, 0, 1, 1,
-0.4778729, -0.352322, -3.551874, 0, 0, 0, 1, 1,
-0.4765181, -0.7526125, -2.357746, 0, 0, 0, 1, 1,
-0.4725833, -0.383626, -3.498353, 0, 0, 0, 1, 1,
-0.4693093, -0.1459587, -1.092416, 0, 0, 0, 1, 1,
-0.4678004, 2.219186, 1.121032, 0, 0, 0, 1, 1,
-0.4577322, -0.3044386, -2.786961, 0, 0, 0, 1, 1,
-0.438946, 0.8372254, -0.4818506, 0, 0, 0, 1, 1,
-0.438921, -2.346133, -2.876513, 1, 1, 1, 1, 1,
-0.4346783, -1.949051, -3.206895, 1, 1, 1, 1, 1,
-0.4328482, -1.071662, -2.676504, 1, 1, 1, 1, 1,
-0.4316888, 0.5044988, -0.1417641, 1, 1, 1, 1, 1,
-0.4311987, 0.1884235, -0.7919325, 1, 1, 1, 1, 1,
-0.4296604, -0.7385262, -3.341587, 1, 1, 1, 1, 1,
-0.426156, 0.4724597, -1.524055, 1, 1, 1, 1, 1,
-0.4220551, -0.5764416, -3.01287, 1, 1, 1, 1, 1,
-0.4161841, 0.766436, 0.7618871, 1, 1, 1, 1, 1,
-0.4157995, 0.7588632, -2.101187, 1, 1, 1, 1, 1,
-0.4122011, -0.6762193, -3.163376, 1, 1, 1, 1, 1,
-0.3995929, 0.6399381, -0.8479325, 1, 1, 1, 1, 1,
-0.398291, 2.467031, -1.153763, 1, 1, 1, 1, 1,
-0.3975631, 1.148576, -0.4474393, 1, 1, 1, 1, 1,
-0.3938097, 0.4216873, 0.1708151, 1, 1, 1, 1, 1,
-0.393611, -0.3962723, -2.86741, 0, 0, 1, 1, 1,
-0.3873257, 0.003553029, 0.5491092, 1, 0, 0, 1, 1,
-0.3854887, 0.6772358, 0.01782776, 1, 0, 0, 1, 1,
-0.3822618, -0.3482852, -2.756166, 1, 0, 0, 1, 1,
-0.3720734, 1.394953, -1.870017, 1, 0, 0, 1, 1,
-0.3671047, -0.2763656, -1.331576, 1, 0, 0, 1, 1,
-0.3666661, 0.6406721, 0.2648253, 0, 0, 0, 1, 1,
-0.3653156, -0.7356712, -4.920469, 0, 0, 0, 1, 1,
-0.3612463, -2.476167, -1.103202, 0, 0, 0, 1, 1,
-0.3578702, 0.05210934, -3.901676, 0, 0, 0, 1, 1,
-0.3543179, -0.4214269, -0.8637161, 0, 0, 0, 1, 1,
-0.3523256, -1.319138, -1.389236, 0, 0, 0, 1, 1,
-0.3508974, 0.6394659, 0.3321768, 0, 0, 0, 1, 1,
-0.3495035, -0.1857211, -1.45923, 1, 1, 1, 1, 1,
-0.349478, 0.3679284, -0.1197864, 1, 1, 1, 1, 1,
-0.3479107, 1.325899, -0.1392481, 1, 1, 1, 1, 1,
-0.3477728, 1.376775, -1.540063, 1, 1, 1, 1, 1,
-0.3427049, 0.6641918, -0.9648878, 1, 1, 1, 1, 1,
-0.3410656, -0.1973705, -0.02593368, 1, 1, 1, 1, 1,
-0.3362525, 0.3673686, -0.1122498, 1, 1, 1, 1, 1,
-0.336219, 0.006778161, -2.297368, 1, 1, 1, 1, 1,
-0.3358428, -1.134421, -3.67231, 1, 1, 1, 1, 1,
-0.3341614, 1.929181, -0.8895274, 1, 1, 1, 1, 1,
-0.3312306, 0.2998957, -0.7526755, 1, 1, 1, 1, 1,
-0.3282804, -0.5680484, -2.108365, 1, 1, 1, 1, 1,
-0.3275764, 0.3760644, -0.2305882, 1, 1, 1, 1, 1,
-0.3256589, 0.0722698, -3.361232, 1, 1, 1, 1, 1,
-0.3254738, 1.757473, -1.581563, 1, 1, 1, 1, 1,
-0.3249361, -0.4673103, -2.253545, 0, 0, 1, 1, 1,
-0.3238142, 0.8150266, 1.683049, 1, 0, 0, 1, 1,
-0.3224242, 1.19489, -0.3683361, 1, 0, 0, 1, 1,
-0.3208876, -1.277905, -4.690031, 1, 0, 0, 1, 1,
-0.3144762, -0.7794961, -2.668402, 1, 0, 0, 1, 1,
-0.31205, 0.6688198, 1.026742, 1, 0, 0, 1, 1,
-0.3112169, 0.653635, -0.4712188, 0, 0, 0, 1, 1,
-0.307744, 0.6202352, -0.798197, 0, 0, 0, 1, 1,
-0.3024494, 2.228331, 0.5435913, 0, 0, 0, 1, 1,
-0.296677, 0.8912828, -2.073817, 0, 0, 0, 1, 1,
-0.2834184, -0.8669379, -0.3704387, 0, 0, 0, 1, 1,
-0.278838, -0.345086, -3.279203, 0, 0, 0, 1, 1,
-0.272327, -0.05178457, -2.116889, 0, 0, 0, 1, 1,
-0.2721094, 1.230563, 0.9832994, 1, 1, 1, 1, 1,
-0.2715979, 1.398531, -0.1285242, 1, 1, 1, 1, 1,
-0.2709544, 0.2551303, -3.729953, 1, 1, 1, 1, 1,
-0.2708299, -0.7291476, -3.407532, 1, 1, 1, 1, 1,
-0.2703979, 0.2259881, -0.3611906, 1, 1, 1, 1, 1,
-0.2702799, -1.379692, -3.366561, 1, 1, 1, 1, 1,
-0.2667339, -0.7000771, -3.893047, 1, 1, 1, 1, 1,
-0.264938, -0.04992998, -0.5706587, 1, 1, 1, 1, 1,
-0.264548, 0.5993501, -0.0721269, 1, 1, 1, 1, 1,
-0.2642384, -0.3642711, -2.168298, 1, 1, 1, 1, 1,
-0.2583503, 0.7220098, 1.019707, 1, 1, 1, 1, 1,
-0.2574688, -0.2799528, -3.004323, 1, 1, 1, 1, 1,
-0.2574006, -0.6598293, -2.532436, 1, 1, 1, 1, 1,
-0.2566769, -1.560403, -3.830899, 1, 1, 1, 1, 1,
-0.2535915, -0.8692043, -3.750827, 1, 1, 1, 1, 1,
-0.2485673, 1.823288, -0.09674769, 0, 0, 1, 1, 1,
-0.2461894, -0.6895589, -3.065112, 1, 0, 0, 1, 1,
-0.2441643, 0.1113656, 0.9564224, 1, 0, 0, 1, 1,
-0.2439532, -0.6255425, -0.324419, 1, 0, 0, 1, 1,
-0.2363335, 0.5643248, -1.995542, 1, 0, 0, 1, 1,
-0.2309238, -0.04723452, -2.504045, 1, 0, 0, 1, 1,
-0.2304489, 0.07329332, -1.552485, 0, 0, 0, 1, 1,
-0.2289013, 0.7442648, 0.1586693, 0, 0, 0, 1, 1,
-0.2286293, 1.705257, 0.07333098, 0, 0, 0, 1, 1,
-0.2247487, -0.5699931, -3.504129, 0, 0, 0, 1, 1,
-0.2235243, 0.1359834, -2.070831, 0, 0, 0, 1, 1,
-0.2208413, 0.3405017, -0.7232407, 0, 0, 0, 1, 1,
-0.2204765, -0.6262478, -3.413229, 0, 0, 0, 1, 1,
-0.2172851, 1.737319, 0.8445562, 1, 1, 1, 1, 1,
-0.2106729, 0.6639241, -1.330274, 1, 1, 1, 1, 1,
-0.2094519, -0.5486149, -4.844532, 1, 1, 1, 1, 1,
-0.2087861, -2.127073, -1.276654, 1, 1, 1, 1, 1,
-0.2036383, 0.7119971, 0.4617538, 1, 1, 1, 1, 1,
-0.2021492, 0.9696056, 1.345163, 1, 1, 1, 1, 1,
-0.1981059, -0.9033476, -3.566593, 1, 1, 1, 1, 1,
-0.1957612, -1.213164, -3.386836, 1, 1, 1, 1, 1,
-0.1955715, 0.3423681, -0.5754937, 1, 1, 1, 1, 1,
-0.1937135, -1.270139, -3.058176, 1, 1, 1, 1, 1,
-0.1930011, -0.06023009, -3.316515, 1, 1, 1, 1, 1,
-0.1895657, 0.9394848, 0.3463967, 1, 1, 1, 1, 1,
-0.1892471, -0.134139, -0.8909478, 1, 1, 1, 1, 1,
-0.1869135, 1.479208, 2.436806, 1, 1, 1, 1, 1,
-0.1856491, 1.126068, 0.4226628, 1, 1, 1, 1, 1,
-0.1837432, -0.6989501, -5.399762, 0, 0, 1, 1, 1,
-0.1830845, -0.1016958, -2.583787, 1, 0, 0, 1, 1,
-0.1795544, -1.005413, -3.138041, 1, 0, 0, 1, 1,
-0.1772622, 1.471732, -1.189085, 1, 0, 0, 1, 1,
-0.1753967, -0.5812246, -1.971563, 1, 0, 0, 1, 1,
-0.1746169, -0.6161718, -1.173764, 1, 0, 0, 1, 1,
-0.1723992, 2.642518, -0.8583725, 0, 0, 0, 1, 1,
-0.1702033, -1.698095, -3.235246, 0, 0, 0, 1, 1,
-0.169193, -0.1083335, -2.944554, 0, 0, 0, 1, 1,
-0.1688573, -1.039487, -1.36199, 0, 0, 0, 1, 1,
-0.1664074, 1.768514, -0.345518, 0, 0, 0, 1, 1,
-0.1648463, -0.3904455, -1.048975, 0, 0, 0, 1, 1,
-0.1637226, -1.496465, -3.406821, 0, 0, 0, 1, 1,
-0.1633976, -0.5570424, -3.372614, 1, 1, 1, 1, 1,
-0.1623548, 0.472783, 0.6166424, 1, 1, 1, 1, 1,
-0.1568363, 0.4156561, -2.214615, 1, 1, 1, 1, 1,
-0.1562791, 1.033394, 0.8971371, 1, 1, 1, 1, 1,
-0.1532665, 1.602713, -0.4855104, 1, 1, 1, 1, 1,
-0.1500141, -1.250151, -3.736298, 1, 1, 1, 1, 1,
-0.1479525, -0.5049101, -2.984848, 1, 1, 1, 1, 1,
-0.1472575, 0.288572, -0.3581243, 1, 1, 1, 1, 1,
-0.1406356, -1.057573, -3.456903, 1, 1, 1, 1, 1,
-0.1403053, 0.0697049, 0.9199044, 1, 1, 1, 1, 1,
-0.1363842, 0.3893865, -0.4645621, 1, 1, 1, 1, 1,
-0.1360139, -0.8660452, -2.840322, 1, 1, 1, 1, 1,
-0.1354863, -0.8165483, -2.786908, 1, 1, 1, 1, 1,
-0.1304201, 0.007400788, -1.860596, 1, 1, 1, 1, 1,
-0.1209346, -2.362664, -3.251939, 1, 1, 1, 1, 1,
-0.1181237, -0.09841955, -2.806217, 0, 0, 1, 1, 1,
-0.1175415, -0.2944548, -3.783299, 1, 0, 0, 1, 1,
-0.1115223, 1.284306, 0.5816064, 1, 0, 0, 1, 1,
-0.1080498, -1.39822, -1.266326, 1, 0, 0, 1, 1,
-0.103756, -2.390222, -4.853653, 1, 0, 0, 1, 1,
-0.09826551, -1.39459, -4.230994, 1, 0, 0, 1, 1,
-0.09309885, -0.5566857, -1.423725, 0, 0, 0, 1, 1,
-0.08762976, -2.59546, -2.014827, 0, 0, 0, 1, 1,
-0.08716995, 1.662331, 0.4686053, 0, 0, 0, 1, 1,
-0.08005231, 0.9231184, 1.155204, 0, 0, 0, 1, 1,
-0.07970624, -0.8827167, -3.079563, 0, 0, 0, 1, 1,
-0.07969425, -0.9149882, -2.85613, 0, 0, 0, 1, 1,
-0.07924282, -2.263673, -3.662063, 0, 0, 0, 1, 1,
-0.07211557, -1.685086, -3.505391, 1, 1, 1, 1, 1,
-0.07107089, -0.8133439, -2.26582, 1, 1, 1, 1, 1,
-0.06958298, 1.662934, 0.1682813, 1, 1, 1, 1, 1,
-0.06901664, -1.134364, -3.432091, 1, 1, 1, 1, 1,
-0.06856229, 0.1828773, -1.458546, 1, 1, 1, 1, 1,
-0.06667543, 0.9090842, -0.6751164, 1, 1, 1, 1, 1,
-0.06282131, -0.5523319, -3.30729, 1, 1, 1, 1, 1,
-0.05790088, -0.8517803, -3.458712, 1, 1, 1, 1, 1,
-0.05693425, 0.2025646, -0.7160143, 1, 1, 1, 1, 1,
-0.05321456, 0.5453376, 0.7788231, 1, 1, 1, 1, 1,
-0.04979141, 0.07236402, -0.1127039, 1, 1, 1, 1, 1,
-0.04822856, 0.719367, -0.8077636, 1, 1, 1, 1, 1,
-0.04764567, 0.5017096, 0.4062592, 1, 1, 1, 1, 1,
-0.04723557, -0.7544069, -4.138242, 1, 1, 1, 1, 1,
-0.04640707, -0.0535277, -1.158506, 1, 1, 1, 1, 1,
-0.04496016, -0.4696379, -0.8677649, 0, 0, 1, 1, 1,
-0.04444984, 0.03048711, -1.518146, 1, 0, 0, 1, 1,
-0.04206841, 0.6834815, -1.057229, 1, 0, 0, 1, 1,
-0.03829508, 1.446163, 1.041894, 1, 0, 0, 1, 1,
-0.0372571, 0.2287068, 1.808068, 1, 0, 0, 1, 1,
-0.03717488, -1.39262, -2.802183, 1, 0, 0, 1, 1,
-0.03360614, -1.160899, -3.894614, 0, 0, 0, 1, 1,
-0.03133972, -1.585665, -5.024274, 0, 0, 0, 1, 1,
-0.02820715, 0.2634791, -1.681152, 0, 0, 0, 1, 1,
-0.02338948, -1.10773, -3.177243, 0, 0, 0, 1, 1,
-0.0227024, -1.002009, -4.926331, 0, 0, 0, 1, 1,
-0.01979461, 0.9059541, -0.2321775, 0, 0, 0, 1, 1,
-0.0182942, 0.5685543, 0.5565736, 0, 0, 0, 1, 1,
-0.01508812, -2.427951, -1.555278, 1, 1, 1, 1, 1,
-0.01437835, -0.1796725, -2.83406, 1, 1, 1, 1, 1,
-0.01041689, -2.397646, -3.123379, 1, 1, 1, 1, 1,
-0.01033236, 0.828676, -0.1138617, 1, 1, 1, 1, 1,
-0.006695973, -1.212465, -4.272894, 1, 1, 1, 1, 1,
-0.005763326, 1.779631, -0.6418276, 1, 1, 1, 1, 1,
-0.002634152, -0.3063402, -2.470802, 1, 1, 1, 1, 1,
-0.002212392, -1.196936, -3.624374, 1, 1, 1, 1, 1,
0.003546383, 0.2124583, -0.5443063, 1, 1, 1, 1, 1,
0.007602713, -1.018186, 3.718696, 1, 1, 1, 1, 1,
0.007661595, 0.6934565, -0.5971621, 1, 1, 1, 1, 1,
0.01153215, -0.7816808, 5.297383, 1, 1, 1, 1, 1,
0.01601822, -0.175347, 3.573668, 1, 1, 1, 1, 1,
0.01616869, 0.9305263, 0.2236049, 1, 1, 1, 1, 1,
0.01876314, -1.241631, 3.975715, 1, 1, 1, 1, 1,
0.02243057, -0.08122948, 3.332843, 0, 0, 1, 1, 1,
0.02372536, 0.2781133, -0.2652907, 1, 0, 0, 1, 1,
0.02602037, -1.233619, 1.774191, 1, 0, 0, 1, 1,
0.03099442, 1.737418, 0.1468356, 1, 0, 0, 1, 1,
0.0314507, 1.35204, 1.028118, 1, 0, 0, 1, 1,
0.03241671, -0.1637172, 2.464825, 1, 0, 0, 1, 1,
0.03286966, 0.1313529, -0.9307121, 0, 0, 0, 1, 1,
0.03318043, 1.861905, -0.53403, 0, 0, 0, 1, 1,
0.03469264, 0.4654379, -1.336217, 0, 0, 0, 1, 1,
0.03477652, -1.682046, 2.946123, 0, 0, 0, 1, 1,
0.03927704, 1.148972, 0.09057008, 0, 0, 0, 1, 1,
0.04689773, -0.284473, 2.818591, 0, 0, 0, 1, 1,
0.04922996, 0.221813, 1.63455, 0, 0, 0, 1, 1,
0.05297447, 0.1957511, -0.8278359, 1, 1, 1, 1, 1,
0.05404016, -1.759994, 1.730057, 1, 1, 1, 1, 1,
0.0624701, 0.685664, 0.5075392, 1, 1, 1, 1, 1,
0.06407799, -0.04460132, 1.410025, 1, 1, 1, 1, 1,
0.06473377, 0.7159931, -1.169602, 1, 1, 1, 1, 1,
0.06551778, 1.687672, 0.7478356, 1, 1, 1, 1, 1,
0.06566347, -0.4657665, 2.937364, 1, 1, 1, 1, 1,
0.06980976, -0.7883223, 3.351699, 1, 1, 1, 1, 1,
0.07006657, 1.40537, 0.7107485, 1, 1, 1, 1, 1,
0.07032581, -0.1723318, 3.476498, 1, 1, 1, 1, 1,
0.07085393, 2.144946, 1.091903, 1, 1, 1, 1, 1,
0.0713992, 0.6019381, 0.2770371, 1, 1, 1, 1, 1,
0.07282929, -0.4154678, 0.7095632, 1, 1, 1, 1, 1,
0.07436375, 0.8715982, 1.508179, 1, 1, 1, 1, 1,
0.0753056, 0.1015283, 1.098839, 1, 1, 1, 1, 1,
0.07733561, 0.7699509, 0.3056965, 0, 0, 1, 1, 1,
0.08478085, 0.5841793, 0.03023404, 1, 0, 0, 1, 1,
0.09210683, 1.792777, -0.8768953, 1, 0, 0, 1, 1,
0.09766761, 1.534025, -1.805749, 1, 0, 0, 1, 1,
0.1051127, -1.57153, 2.353732, 1, 0, 0, 1, 1,
0.1055495, 0.6508074, 1.686578, 1, 0, 0, 1, 1,
0.1070371, -0.4963717, 3.46456, 0, 0, 0, 1, 1,
0.1076928, 0.01969977, 1.168878, 0, 0, 0, 1, 1,
0.1077095, 1.60925, 2.229507, 0, 0, 0, 1, 1,
0.109571, -0.1880413, 1.369508, 0, 0, 0, 1, 1,
0.1108519, -0.969075, 3.244889, 0, 0, 0, 1, 1,
0.1124231, -0.2961096, 4.117446, 0, 0, 0, 1, 1,
0.1141239, 0.7811167, 1.162039, 0, 0, 0, 1, 1,
0.1147114, -0.2158801, 3.104135, 1, 1, 1, 1, 1,
0.1183149, -0.1049434, 0.9450443, 1, 1, 1, 1, 1,
0.1229117, -0.2048922, 2.765767, 1, 1, 1, 1, 1,
0.123353, -0.9637581, 2.247107, 1, 1, 1, 1, 1,
0.1239014, 0.9069895, 0.9258996, 1, 1, 1, 1, 1,
0.1247763, 0.6652295, -0.09359697, 1, 1, 1, 1, 1,
0.1293609, 0.5874893, 0.3532473, 1, 1, 1, 1, 1,
0.1312617, -1.647715, 2.829405, 1, 1, 1, 1, 1,
0.1320348, -0.4657226, 4.702806, 1, 1, 1, 1, 1,
0.1326318, -1.381356, 3.387731, 1, 1, 1, 1, 1,
0.1332209, -1.571102, 3.028424, 1, 1, 1, 1, 1,
0.1343859, 0.9233438, -0.3342269, 1, 1, 1, 1, 1,
0.1423314, -0.7053567, 2.642422, 1, 1, 1, 1, 1,
0.143178, 0.2685543, 1.919096, 1, 1, 1, 1, 1,
0.1436222, -0.3458093, 3.012222, 1, 1, 1, 1, 1,
0.1448563, 0.3052782, 0.7063708, 0, 0, 1, 1, 1,
0.1480692, -1.034327, 3.853552, 1, 0, 0, 1, 1,
0.1585023, -0.8649337, 1.910605, 1, 0, 0, 1, 1,
0.1606109, 1.603542, 0.9003059, 1, 0, 0, 1, 1,
0.1692464, -0.5509804, 2.328092, 1, 0, 0, 1, 1,
0.1701806, -0.089825, 3.461383, 1, 0, 0, 1, 1,
0.1763848, 0.3690687, 0.6649312, 0, 0, 0, 1, 1,
0.1902164, 0.4481865, -0.2065905, 0, 0, 0, 1, 1,
0.1932759, -0.2081497, 2.547516, 0, 0, 0, 1, 1,
0.1963407, 0.2883523, 1.24762, 0, 0, 0, 1, 1,
0.198871, -0.02431325, 2.355141, 0, 0, 0, 1, 1,
0.2021458, -0.4155996, 2.579016, 0, 0, 0, 1, 1,
0.2031601, -0.636188, 4.512591, 0, 0, 0, 1, 1,
0.2034057, 0.2901453, 1.396502, 1, 1, 1, 1, 1,
0.2048874, 0.5681368, 0.8256678, 1, 1, 1, 1, 1,
0.2056713, -0.6338922, 4.03528, 1, 1, 1, 1, 1,
0.2067279, -0.4979616, 3.539046, 1, 1, 1, 1, 1,
0.2085741, -0.04772786, 1.903874, 1, 1, 1, 1, 1,
0.2115678, 0.5834218, 1.61691, 1, 1, 1, 1, 1,
0.2135318, 1.227442, -2.266717, 1, 1, 1, 1, 1,
0.21448, 0.2692024, 1.9012, 1, 1, 1, 1, 1,
0.2166113, -0.3097259, 1.517601, 1, 1, 1, 1, 1,
0.2174885, -0.8744931, 3.537865, 1, 1, 1, 1, 1,
0.2198135, 1.563626, 0.6563794, 1, 1, 1, 1, 1,
0.2215784, -0.7885717, 3.722853, 1, 1, 1, 1, 1,
0.2235685, -0.2965288, 1.828659, 1, 1, 1, 1, 1,
0.2239083, 0.7807716, 0.7763345, 1, 1, 1, 1, 1,
0.2243664, -0.3785337, 1.839634, 1, 1, 1, 1, 1,
0.2253872, -1.25864, 2.549141, 0, 0, 1, 1, 1,
0.2296432, 1.460548, -2.260368, 1, 0, 0, 1, 1,
0.230168, 1.684799, -1.086958, 1, 0, 0, 1, 1,
0.2358541, -0.110906, 2.885573, 1, 0, 0, 1, 1,
0.2364604, -0.06262905, 2.658938, 1, 0, 0, 1, 1,
0.2374338, 0.6555771, 0.6609908, 1, 0, 0, 1, 1,
0.2417231, -0.01113786, 2.761838, 0, 0, 0, 1, 1,
0.2450645, 0.3216511, -1.179873, 0, 0, 0, 1, 1,
0.2478264, -1.554391, 2.569202, 0, 0, 0, 1, 1,
0.2479609, 0.3036287, 1.331095, 0, 0, 0, 1, 1,
0.2499279, 0.1436242, 2.703068, 0, 0, 0, 1, 1,
0.2519934, -0.8183032, 2.754432, 0, 0, 0, 1, 1,
0.2560594, -1.972226, 4.152354, 0, 0, 0, 1, 1,
0.2582551, -0.3788662, 2.609733, 1, 1, 1, 1, 1,
0.2585973, -0.7355009, 2.912405, 1, 1, 1, 1, 1,
0.2614279, -0.9960693, 4.510613, 1, 1, 1, 1, 1,
0.2649419, 0.7912778, 0.3736281, 1, 1, 1, 1, 1,
0.270547, -0.7797006, 1.310689, 1, 1, 1, 1, 1,
0.2729652, -0.684987, 2.014936, 1, 1, 1, 1, 1,
0.2754607, -0.1764929, 1.533351, 1, 1, 1, 1, 1,
0.2781159, -0.424483, 3.368771, 1, 1, 1, 1, 1,
0.2837021, 2.963638, -0.6734236, 1, 1, 1, 1, 1,
0.2856275, -0.3218854, 4.384698, 1, 1, 1, 1, 1,
0.2893626, -0.3089156, 3.422916, 1, 1, 1, 1, 1,
0.2942179, -0.4318606, 3.342755, 1, 1, 1, 1, 1,
0.2992862, 1.871219, -0.2213379, 1, 1, 1, 1, 1,
0.2997104, 0.3868674, 0.7851989, 1, 1, 1, 1, 1,
0.3021334, -0.5187457, 2.66227, 1, 1, 1, 1, 1,
0.3028632, 0.648403, 1.357538, 0, 0, 1, 1, 1,
0.3048052, -0.3385196, 1.445875, 1, 0, 0, 1, 1,
0.3050126, -0.5256591, 2.382904, 1, 0, 0, 1, 1,
0.3073873, -0.2603163, 3.007742, 1, 0, 0, 1, 1,
0.3107908, 0.1596065, 2.282293, 1, 0, 0, 1, 1,
0.3165504, -0.66618, 2.908368, 1, 0, 0, 1, 1,
0.3220121, -0.5568658, 3.648159, 0, 0, 0, 1, 1,
0.3250658, 0.5162356, 0.9900104, 0, 0, 0, 1, 1,
0.3272993, -1.463368, 3.796632, 0, 0, 0, 1, 1,
0.3274862, 0.8238394, 0.4890929, 0, 0, 0, 1, 1,
0.3277239, -0.1566822, 2.333795, 0, 0, 0, 1, 1,
0.3305867, 0.4896755, 1.417421, 0, 0, 0, 1, 1,
0.3344204, -1.019744, 2.319488, 0, 0, 0, 1, 1,
0.3389323, 0.5569342, 0.9572452, 1, 1, 1, 1, 1,
0.3400841, 1.158959, -0.3137454, 1, 1, 1, 1, 1,
0.3436418, 0.4057024, 1.603583, 1, 1, 1, 1, 1,
0.3455868, 0.1309699, 3.069444, 1, 1, 1, 1, 1,
0.3462015, 0.9213012, 0.2547511, 1, 1, 1, 1, 1,
0.3482766, 1.470539, 0.01557095, 1, 1, 1, 1, 1,
0.350478, 0.1845384, 1.917364, 1, 1, 1, 1, 1,
0.3543556, 1.773771, 0.2802914, 1, 1, 1, 1, 1,
0.355302, -0.3026489, 2.10651, 1, 1, 1, 1, 1,
0.3642125, 0.5467383, 1.130684, 1, 1, 1, 1, 1,
0.3655484, -0.6088791, 3.659662, 1, 1, 1, 1, 1,
0.3695067, 1.222486, -0.6054224, 1, 1, 1, 1, 1,
0.3695405, 0.1514353, 0.6615034, 1, 1, 1, 1, 1,
0.3730938, -1.481597, 2.951059, 1, 1, 1, 1, 1,
0.3736491, -0.543333, 2.706912, 1, 1, 1, 1, 1,
0.3771754, 2.07416, 1.472161, 0, 0, 1, 1, 1,
0.3790548, 0.5024571, 1.206344, 1, 0, 0, 1, 1,
0.3814791, -0.7996521, 3.166322, 1, 0, 0, 1, 1,
0.382019, -1.184584, 3.377046, 1, 0, 0, 1, 1,
0.3879281, -1.576967, 2.969257, 1, 0, 0, 1, 1,
0.3898432, 0.6803871, 1.053699, 1, 0, 0, 1, 1,
0.3918934, -1.041518, 1.895669, 0, 0, 0, 1, 1,
0.3940063, -1.286599, 2.538213, 0, 0, 0, 1, 1,
0.4016312, 1.842548, 2.115963, 0, 0, 0, 1, 1,
0.4047184, 0.4639584, -0.02700853, 0, 0, 0, 1, 1,
0.4070607, 0.6127176, 0.9443071, 0, 0, 0, 1, 1,
0.4073447, -0.109596, 2.426198, 0, 0, 0, 1, 1,
0.4123158, 0.5303179, 0.4517277, 0, 0, 0, 1, 1,
0.4156833, -0.7531084, 2.170915, 1, 1, 1, 1, 1,
0.4196864, 2.16707, -0.205924, 1, 1, 1, 1, 1,
0.4230589, 1.227851, 0.08054194, 1, 1, 1, 1, 1,
0.4313075, 0.6612468, 1.979835, 1, 1, 1, 1, 1,
0.4325894, 0.07265293, 1.826262, 1, 1, 1, 1, 1,
0.4335813, -1.578734, 3.330024, 1, 1, 1, 1, 1,
0.4352039, -1.270942, 1.714189, 1, 1, 1, 1, 1,
0.436497, 1.248701, 1.526966, 1, 1, 1, 1, 1,
0.4374412, 0.5010457, 3.577021, 1, 1, 1, 1, 1,
0.4393062, -0.2768019, 2.471302, 1, 1, 1, 1, 1,
0.4402078, -1.159186, 2.77925, 1, 1, 1, 1, 1,
0.4404285, 0.1141495, 1.304842, 1, 1, 1, 1, 1,
0.4483796, -1.25664, 3.636427, 1, 1, 1, 1, 1,
0.4622492, -0.3138192, 3.566078, 1, 1, 1, 1, 1,
0.4630674, 0.08324081, 3.396034, 1, 1, 1, 1, 1,
0.4647904, 0.2788312, 1.425272, 0, 0, 1, 1, 1,
0.4680853, 0.6321439, 0.9521863, 1, 0, 0, 1, 1,
0.4809542, -0.6301799, 3.14334, 1, 0, 0, 1, 1,
0.4841715, -1.564055, 4.993541, 1, 0, 0, 1, 1,
0.4882798, -0.8961509, 3.302765, 1, 0, 0, 1, 1,
0.492488, -0.7147979, 1.249965, 1, 0, 0, 1, 1,
0.5014194, 0.5215225, 0.04206191, 0, 0, 0, 1, 1,
0.5053093, 0.9585162, 1.594536, 0, 0, 0, 1, 1,
0.5066446, 0.6861448, 1.057477, 0, 0, 0, 1, 1,
0.5120587, 0.5970749, 0.5744425, 0, 0, 0, 1, 1,
0.5165612, -0.5151545, 1.734543, 0, 0, 0, 1, 1,
0.5177911, 0.6229499, -0.005045742, 0, 0, 0, 1, 1,
0.5195882, 1.040255, 0.598317, 0, 0, 0, 1, 1,
0.5226752, -0.6089963, 1.524163, 1, 1, 1, 1, 1,
0.5252718, -0.006869953, 1.585879, 1, 1, 1, 1, 1,
0.5288005, -1.28524, 2.543011, 1, 1, 1, 1, 1,
0.5298344, -0.1945425, 0.5092548, 1, 1, 1, 1, 1,
0.5303974, -0.3733235, 3.217754, 1, 1, 1, 1, 1,
0.5445577, -1.255867, 1.882784, 1, 1, 1, 1, 1,
0.5494138, 1.03063, 0.6517702, 1, 1, 1, 1, 1,
0.549581, 0.0769066, 4.103618, 1, 1, 1, 1, 1,
0.5508574, -0.658722, 2.080845, 1, 1, 1, 1, 1,
0.5519388, -0.09383001, 2.849358, 1, 1, 1, 1, 1,
0.5527803, -0.02992103, 2.00224, 1, 1, 1, 1, 1,
0.5530277, 0.9761993, 0.3679411, 1, 1, 1, 1, 1,
0.5531082, -1.96401, 3.229141, 1, 1, 1, 1, 1,
0.5553879, -0.02647712, 2.741598, 1, 1, 1, 1, 1,
0.5661927, 0.1888211, 0.9833005, 1, 1, 1, 1, 1,
0.5665887, -0.2017312, 3.199622, 0, 0, 1, 1, 1,
0.5698414, -1.005169, 1.456584, 1, 0, 0, 1, 1,
0.5737337, 1.870497, -0.7034668, 1, 0, 0, 1, 1,
0.5747826, -0.9817222, 4.229061, 1, 0, 0, 1, 1,
0.5767041, -0.1514092, 1.962364, 1, 0, 0, 1, 1,
0.5772747, 0.1118256, 3.415291, 1, 0, 0, 1, 1,
0.5774565, -1.329545, 3.003376, 0, 0, 0, 1, 1,
0.5814115, 2.20069, 1.66009, 0, 0, 0, 1, 1,
0.581581, 0.1612169, 1.53102, 0, 0, 0, 1, 1,
0.5816795, 0.2050814, 0.7096362, 0, 0, 0, 1, 1,
0.5825226, -1.154623, 3.774784, 0, 0, 0, 1, 1,
0.5878, -0.8153108, 2.901361, 0, 0, 0, 1, 1,
0.5903058, -1.512142, 3.361888, 0, 0, 0, 1, 1,
0.5914441, 0.8383119, 2.439178, 1, 1, 1, 1, 1,
0.5935443, 0.8173462, 0.1234021, 1, 1, 1, 1, 1,
0.5971636, -0.577693, 1.719764, 1, 1, 1, 1, 1,
0.6022483, 0.4236446, 1.334459, 1, 1, 1, 1, 1,
0.6045097, 0.4423907, 1.394349, 1, 1, 1, 1, 1,
0.6139064, -0.7256544, 3.559238, 1, 1, 1, 1, 1,
0.6147193, -0.1510787, 0.8159809, 1, 1, 1, 1, 1,
0.6178922, -0.1945625, 1.811453, 1, 1, 1, 1, 1,
0.6187565, -0.2389303, 2.179349, 1, 1, 1, 1, 1,
0.6199216, -1.551333, 4.587079, 1, 1, 1, 1, 1,
0.620354, 1.535471, 1.199383, 1, 1, 1, 1, 1,
0.6228526, -0.4968003, 0.9679623, 1, 1, 1, 1, 1,
0.6236696, -0.9716872, 2.700986, 1, 1, 1, 1, 1,
0.6243261, -1.333569, 2.03762, 1, 1, 1, 1, 1,
0.6247762, 0.7647231, -0.1304324, 1, 1, 1, 1, 1,
0.6295385, -0.578342, 1.340337, 0, 0, 1, 1, 1,
0.6299397, -1.165797, 1.690018, 1, 0, 0, 1, 1,
0.6374573, 0.1521609, 2.43058, 1, 0, 0, 1, 1,
0.6410406, 0.02809048, 2.542823, 1, 0, 0, 1, 1,
0.6451903, 0.649188, 0.7906608, 1, 0, 0, 1, 1,
0.6522568, -1.663589, 4.194469, 1, 0, 0, 1, 1,
0.6533725, -0.3308792, 1.736796, 0, 0, 0, 1, 1,
0.6576748, -0.4640228, 2.139132, 0, 0, 0, 1, 1,
0.6590298, -2.150936, 2.636598, 0, 0, 0, 1, 1,
0.6612062, 1.366956, 1.725095, 0, 0, 0, 1, 1,
0.6627771, -0.5908986, 0.8518385, 0, 0, 0, 1, 1,
0.664497, -0.5710091, 3.099223, 0, 0, 0, 1, 1,
0.6649098, 0.1267687, 1.356313, 0, 0, 0, 1, 1,
0.6706671, -2.102513, 3.271277, 1, 1, 1, 1, 1,
0.6709039, 1.744977, 1.817989, 1, 1, 1, 1, 1,
0.672923, -0.2120761, 1.051339, 1, 1, 1, 1, 1,
0.6789929, 0.5108432, -0.07058264, 1, 1, 1, 1, 1,
0.6797657, 1.207147, 0.7092732, 1, 1, 1, 1, 1,
0.6826623, -1.453277, 2.393265, 1, 1, 1, 1, 1,
0.6833106, -0.0264128, 2.639206, 1, 1, 1, 1, 1,
0.6855045, -0.2661658, 2.177068, 1, 1, 1, 1, 1,
0.6868614, -1.707152, 2.36778, 1, 1, 1, 1, 1,
0.6936553, 1.819441, 0.4236251, 1, 1, 1, 1, 1,
0.7013677, -0.1732931, 3.454636, 1, 1, 1, 1, 1,
0.7102126, 0.8461511, 1.460142, 1, 1, 1, 1, 1,
0.7102297, -1.243835, 4.731959, 1, 1, 1, 1, 1,
0.7140427, -1.031626, 4.733754, 1, 1, 1, 1, 1,
0.7161867, 0.1565938, 0.6097883, 1, 1, 1, 1, 1,
0.7167579, 0.5069008, -0.2012648, 0, 0, 1, 1, 1,
0.7227737, -0.4645678, 2.271535, 1, 0, 0, 1, 1,
0.724024, 1.281178, 0.6169668, 1, 0, 0, 1, 1,
0.7242594, -0.9479351, 3.484034, 1, 0, 0, 1, 1,
0.7433153, 0.2970717, 1.324378, 1, 0, 0, 1, 1,
0.7475269, -1.071646, 3.464927, 1, 0, 0, 1, 1,
0.7523883, -1.279315, 1.232915, 0, 0, 0, 1, 1,
0.7527406, -0.6578236, 1.78869, 0, 0, 0, 1, 1,
0.7552844, 1.75387, 0.01086104, 0, 0, 0, 1, 1,
0.7560166, 0.3117584, 0.4291061, 0, 0, 0, 1, 1,
0.7596617, 0.3243328, 0.8516895, 0, 0, 0, 1, 1,
0.7662303, -0.09105118, 1.528737, 0, 0, 0, 1, 1,
0.767431, 0.08162986, 1.749669, 0, 0, 0, 1, 1,
0.76848, 0.1752195, 0.8262836, 1, 1, 1, 1, 1,
0.776325, 1.187396, 0.3717492, 1, 1, 1, 1, 1,
0.7787642, -0.8116509, 3.115823, 1, 1, 1, 1, 1,
0.7801683, 0.6793576, 1.009061, 1, 1, 1, 1, 1,
0.7862251, -0.8458555, 3.307657, 1, 1, 1, 1, 1,
0.7916151, 0.7848452, -0.6513772, 1, 1, 1, 1, 1,
0.7942125, 0.05065355, 1.622103, 1, 1, 1, 1, 1,
0.8002609, 0.6594729, -1.065138, 1, 1, 1, 1, 1,
0.8035446, 0.54381, 0.3233439, 1, 1, 1, 1, 1,
0.8058007, 0.8194907, 1.183542, 1, 1, 1, 1, 1,
0.8072102, 1.880429, 0.3314675, 1, 1, 1, 1, 1,
0.8092663, 0.008044786, 0.9237576, 1, 1, 1, 1, 1,
0.8122181, 0.1174068, 0.8981678, 1, 1, 1, 1, 1,
0.8172662, 2.062806, 0.9296772, 1, 1, 1, 1, 1,
0.8174922, -1.434993, 2.84794, 1, 1, 1, 1, 1,
0.8194764, 0.532115, 1.522434, 0, 0, 1, 1, 1,
0.8204944, -0.8975852, 2.723279, 1, 0, 0, 1, 1,
0.8223796, 1.096873, 1.080663, 1, 0, 0, 1, 1,
0.8254094, -1.031086, 1.864339, 1, 0, 0, 1, 1,
0.8331453, -0.7979379, 1.325037, 1, 0, 0, 1, 1,
0.8366526, 1.063505, -0.444708, 1, 0, 0, 1, 1,
0.8399455, 0.911298, -0.6273701, 0, 0, 0, 1, 1,
0.8451957, -0.5187417, 1.597313, 0, 0, 0, 1, 1,
0.8457368, 0.8281452, -0.3832922, 0, 0, 0, 1, 1,
0.8485739, -1.185197, 3.392418, 0, 0, 0, 1, 1,
0.8505719, -0.2473737, 2.366626, 0, 0, 0, 1, 1,
0.8511076, 0.04168995, 3.26701, 0, 0, 0, 1, 1,
0.859709, -2.020526, 3.484071, 0, 0, 0, 1, 1,
0.8602169, 1.068515, 1.137192, 1, 1, 1, 1, 1,
0.8633465, 0.4975631, 0.09691485, 1, 1, 1, 1, 1,
0.8662141, 0.420762, 1.434053, 1, 1, 1, 1, 1,
0.8679103, -0.9017853, 2.71161, 1, 1, 1, 1, 1,
0.8717314, 1.228271, 0.4309478, 1, 1, 1, 1, 1,
0.8755126, 0.1077849, 2.106893, 1, 1, 1, 1, 1,
0.8784834, -0.6490551, 2.164848, 1, 1, 1, 1, 1,
0.8826912, 0.4105785, 1.038831, 1, 1, 1, 1, 1,
0.8848516, 0.383052, 0.9700017, 1, 1, 1, 1, 1,
0.8894699, 0.3708033, 0.4218466, 1, 1, 1, 1, 1,
0.8925807, 0.09257313, 1.495873, 1, 1, 1, 1, 1,
0.8970649, 1.683951, 0.08805588, 1, 1, 1, 1, 1,
0.8991527, -2.022462, 3.620147, 1, 1, 1, 1, 1,
0.9016135, 0.8234784, 0.5678915, 1, 1, 1, 1, 1,
0.9031364, -0.4575226, 2.739559, 1, 1, 1, 1, 1,
0.903236, 0.09806571, 1.188223, 0, 0, 1, 1, 1,
0.9036469, -0.7029445, 0.3458427, 1, 0, 0, 1, 1,
0.9113808, -0.1361252, 0.03939437, 1, 0, 0, 1, 1,
0.9221509, 0.9506454, 1.549636, 1, 0, 0, 1, 1,
0.928693, -0.9610487, 0.5122442, 1, 0, 0, 1, 1,
0.9288432, 0.4243688, 4.282554, 1, 0, 0, 1, 1,
0.9288818, 0.8009319, 1.295685, 0, 0, 0, 1, 1,
0.9413865, -0.4394487, 2.321261, 0, 0, 0, 1, 1,
0.9486455, -0.1634149, 0.2892739, 0, 0, 0, 1, 1,
0.9544556, -0.9578001, 1.63218, 0, 0, 0, 1, 1,
0.9556724, 0.04048929, 0.8414574, 0, 0, 0, 1, 1,
0.9625642, -1.720129, 3.384562, 0, 0, 0, 1, 1,
0.9660388, -0.9429131, 1.190178, 0, 0, 0, 1, 1,
0.9715537, -1.952419, 4.269582, 1, 1, 1, 1, 1,
0.97737, -1.333126, 3.229536, 1, 1, 1, 1, 1,
0.9783781, 0.7123249, 1.143868, 1, 1, 1, 1, 1,
0.9797942, -0.06515121, 1.227917, 1, 1, 1, 1, 1,
0.9813352, -0.05723805, 0.943846, 1, 1, 1, 1, 1,
0.987531, -0.0157183, 2.584921, 1, 1, 1, 1, 1,
0.9876842, 0.3644016, 2.272356, 1, 1, 1, 1, 1,
0.9877212, -2.924652, 2.055987, 1, 1, 1, 1, 1,
0.9880453, 1.511675, 0.2847778, 1, 1, 1, 1, 1,
0.9898248, -0.3447007, 2.772061, 1, 1, 1, 1, 1,
0.9928706, 2.052118, 1.428277, 1, 1, 1, 1, 1,
0.9977596, -0.1705292, 0.4159485, 1, 1, 1, 1, 1,
1.002631, 1.086658, 2.298398, 1, 1, 1, 1, 1,
1.00368, -1.18366, 1.529943, 1, 1, 1, 1, 1,
1.004811, 0.7606822, 0.2752178, 1, 1, 1, 1, 1,
1.006227, -0.8224943, 4.428138, 0, 0, 1, 1, 1,
1.008376, -0.5929026, 2.523688, 1, 0, 0, 1, 1,
1.009943, -2.147324, 3.903632, 1, 0, 0, 1, 1,
1.014345, -0.561352, 0.7377563, 1, 0, 0, 1, 1,
1.016274, -0.3571413, 3.179751, 1, 0, 0, 1, 1,
1.01906, -0.1607052, 3.177118, 1, 0, 0, 1, 1,
1.02643, 0.07874837, 0.5883802, 0, 0, 0, 1, 1,
1.040741, -1.103714, 3.678772, 0, 0, 0, 1, 1,
1.041055, -0.06083851, 2.227031, 0, 0, 0, 1, 1,
1.0421, -0.6842558, 2.761204, 0, 0, 0, 1, 1,
1.04457, -1.05417, 0.7899076, 0, 0, 0, 1, 1,
1.047387, -1.12813, 2.759363, 0, 0, 0, 1, 1,
1.048647, 0.8916951, 0.8822426, 0, 0, 0, 1, 1,
1.049492, 0.346205, 2.028942, 1, 1, 1, 1, 1,
1.052275, 1.292877, 0.7687811, 1, 1, 1, 1, 1,
1.05416, 0.1082625, 1.192856, 1, 1, 1, 1, 1,
1.056872, 0.4892384, 0.5571173, 1, 1, 1, 1, 1,
1.058498, -0.6550474, 1.049723, 1, 1, 1, 1, 1,
1.059503, 0.2098105, 0.9850454, 1, 1, 1, 1, 1,
1.059583, -0.5173333, 2.966441, 1, 1, 1, 1, 1,
1.064246, 0.5828986, -0.07041248, 1, 1, 1, 1, 1,
1.072163, 0.3966873, 1.019168, 1, 1, 1, 1, 1,
1.080947, -1.07697, 2.805742, 1, 1, 1, 1, 1,
1.084207, 0.8833599, -0.1197242, 1, 1, 1, 1, 1,
1.092166, 0.001586278, 2.890179, 1, 1, 1, 1, 1,
1.094077, 0.147618, 2.215275, 1, 1, 1, 1, 1,
1.097672, -0.1472719, 0.786207, 1, 1, 1, 1, 1,
1.098518, 0.8471518, 1.559765, 1, 1, 1, 1, 1,
1.098951, 0.8436142, 1.748793, 0, 0, 1, 1, 1,
1.11177, 0.7018104, 1.435859, 1, 0, 0, 1, 1,
1.11494, 0.5219401, 0.7365788, 1, 0, 0, 1, 1,
1.123623, 0.5577082, 0.5398971, 1, 0, 0, 1, 1,
1.124958, -1.430314, 2.932971, 1, 0, 0, 1, 1,
1.125023, 1.605438, -0.1290064, 1, 0, 0, 1, 1,
1.132149, -0.7923441, 3.29256, 0, 0, 0, 1, 1,
1.133868, 0.6145072, -0.6488025, 0, 0, 0, 1, 1,
1.136083, 1.661783, -0.598091, 0, 0, 0, 1, 1,
1.137543, 0.3588246, 0.3049151, 0, 0, 0, 1, 1,
1.142884, -0.3430008, 0.4525398, 0, 0, 0, 1, 1,
1.148838, -2.766061, 2.025899, 0, 0, 0, 1, 1,
1.151142, -1.450691, 1.997965, 0, 0, 0, 1, 1,
1.156865, -1.147956, 2.554309, 1, 1, 1, 1, 1,
1.163092, -1.563707, 2.656515, 1, 1, 1, 1, 1,
1.167174, -1.178208, 1.949335, 1, 1, 1, 1, 1,
1.167449, -1.215756, 0.3902745, 1, 1, 1, 1, 1,
1.175426, 1.24802, -0.8107834, 1, 1, 1, 1, 1,
1.175505, 1.1763, 1.804571, 1, 1, 1, 1, 1,
1.180473, -0.1956113, 1.901528, 1, 1, 1, 1, 1,
1.185361, -0.5546327, 2.227431, 1, 1, 1, 1, 1,
1.18928, -0.1362352, 2.777749, 1, 1, 1, 1, 1,
1.189309, 1.191333, -1.914671, 1, 1, 1, 1, 1,
1.18975, 0.6632666, 2.955507, 1, 1, 1, 1, 1,
1.190063, -2.87662, 4.71256, 1, 1, 1, 1, 1,
1.193439, 0.5605955, 2.177426, 1, 1, 1, 1, 1,
1.194263, -0.1266037, 2.09517, 1, 1, 1, 1, 1,
1.203774, 0.08868474, 2.281972, 1, 1, 1, 1, 1,
1.207735, -1.040082, 1.779562, 0, 0, 1, 1, 1,
1.207891, -1.198628, 3.201104, 1, 0, 0, 1, 1,
1.218036, -1.163326, 3.832747, 1, 0, 0, 1, 1,
1.233091, -0.6527209, 2.203226, 1, 0, 0, 1, 1,
1.236735, -0.5470377, 1.534127, 1, 0, 0, 1, 1,
1.24051, -0.4822463, 2.690228, 1, 0, 0, 1, 1,
1.240849, 1.848547, 0.08869799, 0, 0, 0, 1, 1,
1.247382, 0.7202786, 0.6750383, 0, 0, 0, 1, 1,
1.256942, -1.427312, 2.375446, 0, 0, 0, 1, 1,
1.25968, 1.279012, -0.04613321, 0, 0, 0, 1, 1,
1.260129, -0.7602497, 1.566462, 0, 0, 0, 1, 1,
1.267246, -0.429252, 2.534613, 0, 0, 0, 1, 1,
1.269439, 1.678266, 0.1462206, 0, 0, 0, 1, 1,
1.276985, 1.964466, 0.5124736, 1, 1, 1, 1, 1,
1.280715, -0.7969351, 1.787375, 1, 1, 1, 1, 1,
1.288193, 0.9681946, 0.7664865, 1, 1, 1, 1, 1,
1.289471, -0.2745639, 2.537297, 1, 1, 1, 1, 1,
1.291889, 0.7791889, 1.203102, 1, 1, 1, 1, 1,
1.297411, 0.03320794, 3.757207, 1, 1, 1, 1, 1,
1.324822, 0.2944551, -0.6045379, 1, 1, 1, 1, 1,
1.328735, 1.737577, 0.3071718, 1, 1, 1, 1, 1,
1.328838, -1.334457, 2.085229, 1, 1, 1, 1, 1,
1.33931, 0.119864, 2.306725, 1, 1, 1, 1, 1,
1.340632, 1.679548, 1.166972, 1, 1, 1, 1, 1,
1.344249, -1.414159, 2.347724, 1, 1, 1, 1, 1,
1.346004, 0.8338363, 1.075822, 1, 1, 1, 1, 1,
1.351576, 0.4932934, 0.3867752, 1, 1, 1, 1, 1,
1.357077, -0.4105432, 2.028102, 1, 1, 1, 1, 1,
1.358618, -0.6068472, 0.6012535, 0, 0, 1, 1, 1,
1.366798, 1.658042, 1.278533, 1, 0, 0, 1, 1,
1.368004, -0.9846531, 1.53687, 1, 0, 0, 1, 1,
1.386025, -1.723924, 2.559507, 1, 0, 0, 1, 1,
1.387192, 0.2023125, 1.996248, 1, 0, 0, 1, 1,
1.395931, -1.427856, 2.07003, 1, 0, 0, 1, 1,
1.405721, -0.2133404, -0.5770814, 0, 0, 0, 1, 1,
1.407632, 1.106569, 1.436389, 0, 0, 0, 1, 1,
1.408017, -0.4603735, 1.324058, 0, 0, 0, 1, 1,
1.411734, -0.3249558, 2.454423, 0, 0, 0, 1, 1,
1.420797, 0.6438851, 0.3091732, 0, 0, 0, 1, 1,
1.430288, 1.284271, 1.345352, 0, 0, 0, 1, 1,
1.449619, -0.5676871, 2.095679, 0, 0, 0, 1, 1,
1.451695, -0.2319714, 1.981825, 1, 1, 1, 1, 1,
1.455884, -0.7846358, 2.72336, 1, 1, 1, 1, 1,
1.459741, -1.31106, 3.242789, 1, 1, 1, 1, 1,
1.464944, 0.09805942, 2.679165, 1, 1, 1, 1, 1,
1.470331, -0.06500348, 1.415576, 1, 1, 1, 1, 1,
1.473096, 1.989326, 2.075023, 1, 1, 1, 1, 1,
1.483145, 0.5007119, 1.799543, 1, 1, 1, 1, 1,
1.490381, 0.374637, 0.6104633, 1, 1, 1, 1, 1,
1.499557, -1.210818, 2.810125, 1, 1, 1, 1, 1,
1.527306, -3.16002, 3.674726, 1, 1, 1, 1, 1,
1.528515, 0.8285781, 1.254987, 1, 1, 1, 1, 1,
1.532181, -0.9426414, 2.868088, 1, 1, 1, 1, 1,
1.544207, 0.9010692, 1.408754, 1, 1, 1, 1, 1,
1.585702, 0.2241094, 2.071091, 1, 1, 1, 1, 1,
1.59501, 0.4226408, 1.396162, 1, 1, 1, 1, 1,
1.601456, -0.09944803, 2.539672, 0, 0, 1, 1, 1,
1.606468, 0.553069, 0.4315157, 1, 0, 0, 1, 1,
1.621998, -0.4934327, 3.059963, 1, 0, 0, 1, 1,
1.625926, 1.871552, 2.606292, 1, 0, 0, 1, 1,
1.629055, -0.4130511, 1.47561, 1, 0, 0, 1, 1,
1.63866, 0.01271667, -1.00125, 1, 0, 0, 1, 1,
1.642601, 1.044245, 0.01651541, 0, 0, 0, 1, 1,
1.650443, -0.1643172, 1.844496, 0, 0, 0, 1, 1,
1.66099, 0.6155146, 0.5079767, 0, 0, 0, 1, 1,
1.679569, 0.2723497, 1.103826, 0, 0, 0, 1, 1,
1.689184, 0.104201, 1.238929, 0, 0, 0, 1, 1,
1.70287, 1.026682, 1.08852, 0, 0, 0, 1, 1,
1.703205, 1.47324, 1.229397, 0, 0, 0, 1, 1,
1.74919, -1.267411, 1.75585, 1, 1, 1, 1, 1,
1.7627, -0.0474963, 0.2726156, 1, 1, 1, 1, 1,
1.766499, -1.136802, 2.099118, 1, 1, 1, 1, 1,
1.786428, -0.330624, 0.1840537, 1, 1, 1, 1, 1,
1.791322, -0.04465671, 2.134131, 1, 1, 1, 1, 1,
1.792799, 0.2425962, 1.800181, 1, 1, 1, 1, 1,
1.80319, 1.88366, 1.408593, 1, 1, 1, 1, 1,
1.82948, -0.8802143, 4.605415, 1, 1, 1, 1, 1,
1.83301, -1.447157, 4.094198, 1, 1, 1, 1, 1,
1.833308, -0.5678217, 2.90581, 1, 1, 1, 1, 1,
1.845237, 0.4027028, 0.5248024, 1, 1, 1, 1, 1,
1.916211, 0.8124381, -0.2041404, 1, 1, 1, 1, 1,
1.919208, 0.08688603, 1.253739, 1, 1, 1, 1, 1,
1.940988, 1.104072, 0.1477389, 1, 1, 1, 1, 1,
1.943023, -0.2187922, 2.413348, 1, 1, 1, 1, 1,
1.945605, 1.690073, 1.303204, 0, 0, 1, 1, 1,
1.9793, -0.7794462, 2.826982, 1, 0, 0, 1, 1,
2.054914, -0.5835938, 3.398555, 1, 0, 0, 1, 1,
2.06549, -1.073003, 2.473166, 1, 0, 0, 1, 1,
2.144394, -0.1000253, 0.1896077, 1, 0, 0, 1, 1,
2.240759, 0.9038923, 0.5613263, 1, 0, 0, 1, 1,
2.250366, -1.087455, 2.504616, 0, 0, 0, 1, 1,
2.392606, -1.089279, 2.237362, 0, 0, 0, 1, 1,
2.412413, 1.363883, 1.269187, 0, 0, 0, 1, 1,
2.414958, -0.3951484, 2.622655, 0, 0, 0, 1, 1,
2.461554, -0.1252783, 0.1235442, 0, 0, 0, 1, 1,
2.463774, -0.8212496, 1.627905, 0, 0, 0, 1, 1,
2.477588, 0.06333307, 0.2118103, 0, 0, 0, 1, 1,
2.530988, 0.3660818, 2.699758, 1, 1, 1, 1, 1,
2.577772, 1.033907, 2.198326, 1, 1, 1, 1, 1,
2.632178, -0.7678635, 1.207656, 1, 1, 1, 1, 1,
2.849436, -0.7252457, 1.62197, 1, 1, 1, 1, 1,
2.959517, 0.2190579, 1.977936, 1, 1, 1, 1, 1,
3.071899, 0.2920387, 2.750844, 1, 1, 1, 1, 1,
3.334038, -2.495881, 2.083639, 1, 1, 1, 1, 1
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
var radius = 9.70901;
var distance = 34.10249;
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
mvMatrix.translate( 0.08939934, 0.2029121, 0.05118942 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.10249);
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
