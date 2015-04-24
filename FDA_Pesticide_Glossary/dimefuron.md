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
-3.043237, -0.647105, -1.675488, 1, 0, 0, 1,
-2.89214, -1.543984, -2.295813, 1, 0.007843138, 0, 1,
-2.606647, 0.8107451, -2.196666, 1, 0.01176471, 0, 1,
-2.576044, 0.8358268, -0.1746664, 1, 0.01960784, 0, 1,
-2.548448, -0.9176476, -1.97324, 1, 0.02352941, 0, 1,
-2.473644, 0.2474479, -0.8610889, 1, 0.03137255, 0, 1,
-2.455553, -0.5603073, -2.158417, 1, 0.03529412, 0, 1,
-2.453336, 2.434615, -0.8291876, 1, 0.04313726, 0, 1,
-2.411887, -0.02450846, -3.573791, 1, 0.04705882, 0, 1,
-2.40565, 1.275838, -1.043523, 1, 0.05490196, 0, 1,
-2.405146, -0.5419807, -0.4274166, 1, 0.05882353, 0, 1,
-2.392501, 0.2231238, -2.567678, 1, 0.06666667, 0, 1,
-2.306635, -0.5652802, -1.68448, 1, 0.07058824, 0, 1,
-2.263798, 2.000865, 1.001214, 1, 0.07843138, 0, 1,
-2.253603, 0.006719975, 0.4031685, 1, 0.08235294, 0, 1,
-2.251498, -0.7945918, -0.6825113, 1, 0.09019608, 0, 1,
-2.238614, 1.290264, -2.509736, 1, 0.09411765, 0, 1,
-2.237942, -0.2976515, -0.9246044, 1, 0.1019608, 0, 1,
-2.201386, -0.3667762, -1.616883, 1, 0.1098039, 0, 1,
-2.144054, -0.6415657, -1.666403, 1, 0.1137255, 0, 1,
-2.1416, 0.1969994, -3.277448, 1, 0.1215686, 0, 1,
-2.092316, 0.8576519, -2.396623, 1, 0.1254902, 0, 1,
-2.079619, 0.5474802, -0.9275128, 1, 0.1333333, 0, 1,
-2.040109, -0.5364528, -3.410678, 1, 0.1372549, 0, 1,
-1.993113, -0.2455984, -4.184206, 1, 0.145098, 0, 1,
-1.9718, 1.830426, -0.933588, 1, 0.1490196, 0, 1,
-1.956657, 1.36243, -0.4537205, 1, 0.1568628, 0, 1,
-1.938078, -0.6722267, -0.5879045, 1, 0.1607843, 0, 1,
-1.922039, 0.9850442, -0.8386927, 1, 0.1686275, 0, 1,
-1.91325, -0.2344922, -2.21863, 1, 0.172549, 0, 1,
-1.910966, -0.5538918, -2.902135, 1, 0.1803922, 0, 1,
-1.903561, -0.2560906, -1.588579, 1, 0.1843137, 0, 1,
-1.876371, -1.182596, -3.952406, 1, 0.1921569, 0, 1,
-1.859699, 0.8098884, -0.6141269, 1, 0.1960784, 0, 1,
-1.84854, 1.165913, -1.186573, 1, 0.2039216, 0, 1,
-1.8322, -1.600054, -2.802599, 1, 0.2117647, 0, 1,
-1.823008, -1.448197, -0.823932, 1, 0.2156863, 0, 1,
-1.819576, 0.5957355, -1.426243, 1, 0.2235294, 0, 1,
-1.808484, -1.093724, -0.6482465, 1, 0.227451, 0, 1,
-1.793451, 0.8260402, -0.9040188, 1, 0.2352941, 0, 1,
-1.769664, -0.7011538, -2.020021, 1, 0.2392157, 0, 1,
-1.764428, 1.971739, -1.735612, 1, 0.2470588, 0, 1,
-1.750362, -0.203567, -0.7096551, 1, 0.2509804, 0, 1,
-1.742238, 2.105136, -0.1695915, 1, 0.2588235, 0, 1,
-1.740188, -0.9412336, -1.34551, 1, 0.2627451, 0, 1,
-1.739146, 1.401278, -1.949882, 1, 0.2705882, 0, 1,
-1.735946, -0.5049549, -2.996834, 1, 0.2745098, 0, 1,
-1.712506, -1.138735, -2.630619, 1, 0.282353, 0, 1,
-1.704102, 0.2651674, -1.548655, 1, 0.2862745, 0, 1,
-1.692702, 0.9236076, -1.48429, 1, 0.2941177, 0, 1,
-1.685969, -0.6577163, -0.6976121, 1, 0.3019608, 0, 1,
-1.665683, 0.343256, -1.974174, 1, 0.3058824, 0, 1,
-1.652038, -1.689471, -3.166768, 1, 0.3137255, 0, 1,
-1.638541, -0.7758043, -2.872389, 1, 0.3176471, 0, 1,
-1.625613, 0.6752391, -0.8179832, 1, 0.3254902, 0, 1,
-1.602427, -0.5739037, -1.193277, 1, 0.3294118, 0, 1,
-1.586375, 0.95133, -0.5029735, 1, 0.3372549, 0, 1,
-1.564477, 0.07021749, -1.525092, 1, 0.3411765, 0, 1,
-1.554784, -0.7274919, -1.788532, 1, 0.3490196, 0, 1,
-1.552526, -0.7264071, -2.762247, 1, 0.3529412, 0, 1,
-1.550255, 0.6366274, -1.134668, 1, 0.3607843, 0, 1,
-1.534455, -0.1713099, -0.6955302, 1, 0.3647059, 0, 1,
-1.532711, 0.5205325, -0.7504358, 1, 0.372549, 0, 1,
-1.521239, 0.6587293, 0.1385894, 1, 0.3764706, 0, 1,
-1.505648, 1.35149, -1.415151, 1, 0.3843137, 0, 1,
-1.497007, 0.4948409, -1.168564, 1, 0.3882353, 0, 1,
-1.487373, -0.01626905, 0.8408002, 1, 0.3960784, 0, 1,
-1.486485, -0.02318011, -2.274208, 1, 0.4039216, 0, 1,
-1.457901, -0.8040172, -2.065164, 1, 0.4078431, 0, 1,
-1.452211, 1.631207, -0.8258563, 1, 0.4156863, 0, 1,
-1.438389, -0.5183989, -0.4946381, 1, 0.4196078, 0, 1,
-1.4363, 0.3940672, -2.190111, 1, 0.427451, 0, 1,
-1.432543, -2.091626, -2.218694, 1, 0.4313726, 0, 1,
-1.423237, -0.702453, -2.663092, 1, 0.4392157, 0, 1,
-1.418735, -0.8084517, -1.902349, 1, 0.4431373, 0, 1,
-1.405356, -1.24895, -0.1137672, 1, 0.4509804, 0, 1,
-1.40077, -0.04951539, -2.731926, 1, 0.454902, 0, 1,
-1.398234, 0.6052079, -0.425554, 1, 0.4627451, 0, 1,
-1.391377, -1.099309, -2.204517, 1, 0.4666667, 0, 1,
-1.378091, -0.670417, -2.04664, 1, 0.4745098, 0, 1,
-1.376962, -0.3831876, -2.060775, 1, 0.4784314, 0, 1,
-1.367465, -0.3476748, -1.366398, 1, 0.4862745, 0, 1,
-1.362096, -0.7567454, -1.018341, 1, 0.4901961, 0, 1,
-1.357555, -0.4374958, -1.258562, 1, 0.4980392, 0, 1,
-1.355789, 0.3170474, -2.090327, 1, 0.5058824, 0, 1,
-1.355341, -1.479211, -3.868714, 1, 0.509804, 0, 1,
-1.354514, -1.375259, -1.981165, 1, 0.5176471, 0, 1,
-1.346142, -1.224443, 0.2940243, 1, 0.5215687, 0, 1,
-1.346075, -0.6921851, -1.761346, 1, 0.5294118, 0, 1,
-1.344912, 0.703371, -1.567031, 1, 0.5333334, 0, 1,
-1.343271, 0.4959643, -1.059331, 1, 0.5411765, 0, 1,
-1.329183, -0.1736352, -2.345051, 1, 0.5450981, 0, 1,
-1.31798, 2.118398, -1.674207, 1, 0.5529412, 0, 1,
-1.317919, 0.212142, -1.359918, 1, 0.5568628, 0, 1,
-1.315721, -0.03568315, -1.416655, 1, 0.5647059, 0, 1,
-1.305526, -0.01256814, -2.214872, 1, 0.5686275, 0, 1,
-1.299827, -1.193937, -3.535343, 1, 0.5764706, 0, 1,
-1.294201, -0.883416, -1.955674, 1, 0.5803922, 0, 1,
-1.28911, -0.01024573, -0.00969342, 1, 0.5882353, 0, 1,
-1.285003, -0.1408048, -0.9424734, 1, 0.5921569, 0, 1,
-1.282408, 0.4567637, -0.8035449, 1, 0.6, 0, 1,
-1.281455, -0.9119864, -2.116267, 1, 0.6078432, 0, 1,
-1.279586, -0.03301119, -1.370265, 1, 0.6117647, 0, 1,
-1.264459, 1.42428, -0.9987525, 1, 0.6196079, 0, 1,
-1.257052, 0.3297144, -0.006822283, 1, 0.6235294, 0, 1,
-1.249787, 0.5932735, -0.7106463, 1, 0.6313726, 0, 1,
-1.246577, -1.010212, -3.044739, 1, 0.6352941, 0, 1,
-1.245912, 0.3856764, -1.611737, 1, 0.6431373, 0, 1,
-1.234939, -1.239845, -2.361851, 1, 0.6470588, 0, 1,
-1.223463, 2.805707, -2.130429, 1, 0.654902, 0, 1,
-1.221763, 1.403274, -0.6508662, 1, 0.6588235, 0, 1,
-1.219525, 0.04664123, -1.998136, 1, 0.6666667, 0, 1,
-1.217924, -0.7494299, -1.89487, 1, 0.6705883, 0, 1,
-1.21471, 0.6680283, 0.4139526, 1, 0.6784314, 0, 1,
-1.211385, -0.6145835, -2.904366, 1, 0.682353, 0, 1,
-1.19977, 1.228569, -1.307852, 1, 0.6901961, 0, 1,
-1.198957, -1.180291, -3.469133, 1, 0.6941177, 0, 1,
-1.188037, 0.08180001, -0.2725572, 1, 0.7019608, 0, 1,
-1.18268, 1.019616, 0.02014394, 1, 0.7098039, 0, 1,
-1.172983, 1.546883, -0.8444625, 1, 0.7137255, 0, 1,
-1.166484, 0.549014, 0.1151342, 1, 0.7215686, 0, 1,
-1.166185, -0.1375031, -2.563686, 1, 0.7254902, 0, 1,
-1.163632, 0.2423772, -1.697093, 1, 0.7333333, 0, 1,
-1.151851, -0.5259491, -1.51883, 1, 0.7372549, 0, 1,
-1.147935, -0.03993592, -3.265486, 1, 0.7450981, 0, 1,
-1.147192, 0.7466595, -2.280663, 1, 0.7490196, 0, 1,
-1.145647, 0.733876, -0.4475777, 1, 0.7568628, 0, 1,
-1.144977, 0.3285533, -0.839228, 1, 0.7607843, 0, 1,
-1.142943, -0.5493065, -2.19205, 1, 0.7686275, 0, 1,
-1.138992, -0.3413185, -2.423837, 1, 0.772549, 0, 1,
-1.135264, -2.040199, -3.566593, 1, 0.7803922, 0, 1,
-1.130073, 0.7123982, -0.5039665, 1, 0.7843137, 0, 1,
-1.129787, -0.9973934, -0.7913822, 1, 0.7921569, 0, 1,
-1.124955, -0.9315767, -1.623345, 1, 0.7960784, 0, 1,
-1.124042, 0.2023256, -2.044129, 1, 0.8039216, 0, 1,
-1.117214, -0.5649102, -1.604597, 1, 0.8117647, 0, 1,
-1.116117, 1.039362, -2.838111, 1, 0.8156863, 0, 1,
-1.116104, -0.07164285, -2.920449, 1, 0.8235294, 0, 1,
-1.115218, 0.717943, -0.9021, 1, 0.827451, 0, 1,
-1.109989, 0.04647911, -1.613961, 1, 0.8352941, 0, 1,
-1.107056, -0.4427634, -1.423682, 1, 0.8392157, 0, 1,
-1.106841, -0.2923491, -2.358596, 1, 0.8470588, 0, 1,
-1.099377, -1.236962, -3.257831, 1, 0.8509804, 0, 1,
-1.09764, -0.2108037, -1.017567, 1, 0.8588235, 0, 1,
-1.085554, 0.7339897, -2.373442, 1, 0.8627451, 0, 1,
-1.075681, 2.149234, 0.1950992, 1, 0.8705882, 0, 1,
-1.075637, 0.3621213, -0.4286405, 1, 0.8745098, 0, 1,
-1.073449, 0.02082947, -1.278398, 1, 0.8823529, 0, 1,
-1.071735, -0.7930572, -3.61659, 1, 0.8862745, 0, 1,
-1.065676, -2.667122, -3.347094, 1, 0.8941177, 0, 1,
-1.06518, 0.3101112, -0.614611, 1, 0.8980392, 0, 1,
-1.063028, 1.210885, -1.635013, 1, 0.9058824, 0, 1,
-1.057955, 0.7443666, -1.68639, 1, 0.9137255, 0, 1,
-1.050151, 0.7052425, -1.432775, 1, 0.9176471, 0, 1,
-1.044434, 0.7428246, -0.6998163, 1, 0.9254902, 0, 1,
-1.043588, 0.5111172, -0.6398139, 1, 0.9294118, 0, 1,
-1.042808, -0.7466687, -1.345652, 1, 0.9372549, 0, 1,
-1.04271, 0.4224835, -1.249035, 1, 0.9411765, 0, 1,
-1.03793, 0.5380526, -0.3125442, 1, 0.9490196, 0, 1,
-1.03736, -0.7157156, -4.198217, 1, 0.9529412, 0, 1,
-1.035361, 0.4711728, -0.9331058, 1, 0.9607843, 0, 1,
-1.032225, 0.9825553, -0.1976434, 1, 0.9647059, 0, 1,
-1.02957, 0.525537, -1.597184, 1, 0.972549, 0, 1,
-1.0191, 1.37413, -0.4461657, 1, 0.9764706, 0, 1,
-1.005693, -1.202287, -1.827806, 1, 0.9843137, 0, 1,
-1.001825, 1.379435, -0.6356825, 1, 0.9882353, 0, 1,
-1.00153, -0.6590343, -2.590823, 1, 0.9960784, 0, 1,
-0.9960783, -1.062024, -2.046182, 0.9960784, 1, 0, 1,
-0.9922752, 0.5753478, -1.84308, 0.9921569, 1, 0, 1,
-0.9884462, 1.732865, -0.547591, 0.9843137, 1, 0, 1,
-0.9867846, -1.089721, -4.432325, 0.9803922, 1, 0, 1,
-0.9862483, 0.3865079, -1.251765, 0.972549, 1, 0, 1,
-0.9816481, -0.4209381, -2.145287, 0.9686275, 1, 0, 1,
-0.9811164, 0.9108141, -2.093149, 0.9607843, 1, 0, 1,
-0.9745303, 0.9429285, -1.066862, 0.9568627, 1, 0, 1,
-0.9699126, 0.01710895, -0.7223336, 0.9490196, 1, 0, 1,
-0.9694718, -1.426227, -3.406183, 0.945098, 1, 0, 1,
-0.9689544, -0.4284317, -3.495821, 0.9372549, 1, 0, 1,
-0.9679176, 0.06201142, -1.842654, 0.9333333, 1, 0, 1,
-0.9673768, -1.739788, -3.617941, 0.9254902, 1, 0, 1,
-0.9671342, 0.9284729, 0.08421285, 0.9215686, 1, 0, 1,
-0.9670227, -0.1609583, -2.126246, 0.9137255, 1, 0, 1,
-0.9645365, 1.509067, -2.317526, 0.9098039, 1, 0, 1,
-0.9637247, 0.7578148, 0.5430057, 0.9019608, 1, 0, 1,
-0.9636258, 0.2294772, -1.717418, 0.8941177, 1, 0, 1,
-0.962944, -0.2368171, -1.633998, 0.8901961, 1, 0, 1,
-0.9626274, -1.815912, -3.501916, 0.8823529, 1, 0, 1,
-0.9603428, -0.7873839, -1.691248, 0.8784314, 1, 0, 1,
-0.9428774, -0.1046018, -0.5731081, 0.8705882, 1, 0, 1,
-0.9427087, 0.2924285, -1.01574, 0.8666667, 1, 0, 1,
-0.9370838, -0.1568591, -1.267406, 0.8588235, 1, 0, 1,
-0.9363896, 0.06346389, -1.620063, 0.854902, 1, 0, 1,
-0.9355159, -0.4478923, -1.625667, 0.8470588, 1, 0, 1,
-0.9353302, 0.3539782, -2.766704, 0.8431373, 1, 0, 1,
-0.9231359, 0.5017616, -0.3373071, 0.8352941, 1, 0, 1,
-0.91774, 0.5817083, -1.235572, 0.8313726, 1, 0, 1,
-0.917357, -2.189839, -3.096967, 0.8235294, 1, 0, 1,
-0.906152, -0.4849539, -1.184023, 0.8196079, 1, 0, 1,
-0.8973834, 0.7087883, 0.3803575, 0.8117647, 1, 0, 1,
-0.8971712, 0.4829252, 1.47782, 0.8078431, 1, 0, 1,
-0.889495, -1.140545, -1.481869, 0.8, 1, 0, 1,
-0.8889881, -0.6851949, -3.699312, 0.7921569, 1, 0, 1,
-0.8872303, -0.422668, -3.741424, 0.7882353, 1, 0, 1,
-0.8782166, 0.5271495, -1.213298, 0.7803922, 1, 0, 1,
-0.8761126, -0.3088081, -2.993187, 0.7764706, 1, 0, 1,
-0.872355, -0.3681285, -3.764721, 0.7686275, 1, 0, 1,
-0.8708076, 1.802815, -0.6115937, 0.7647059, 1, 0, 1,
-0.8646174, -0.4664702, -2.107204, 0.7568628, 1, 0, 1,
-0.8619102, 2.084973, -0.1965481, 0.7529412, 1, 0, 1,
-0.8600984, -0.06008147, -2.379745, 0.7450981, 1, 0, 1,
-0.8600199, 0.2185829, -0.744787, 0.7411765, 1, 0, 1,
-0.8586627, 0.7585922, -1.416953, 0.7333333, 1, 0, 1,
-0.8555997, -0.1171761, 0.05193494, 0.7294118, 1, 0, 1,
-0.855171, 1.130848, -0.6455856, 0.7215686, 1, 0, 1,
-0.8514657, -1.088349, -2.082061, 0.7176471, 1, 0, 1,
-0.8513446, -0.01630033, -0.5520841, 0.7098039, 1, 0, 1,
-0.844527, 0.2202028, -3.295014, 0.7058824, 1, 0, 1,
-0.8416794, -0.2530748, -1.727212, 0.6980392, 1, 0, 1,
-0.8290522, 0.6426117, -0.903193, 0.6901961, 1, 0, 1,
-0.8264906, 1.01729, 1.155663, 0.6862745, 1, 0, 1,
-0.8243279, -0.6264747, -2.647426, 0.6784314, 1, 0, 1,
-0.8237935, 1.229901, -0.8488742, 0.6745098, 1, 0, 1,
-0.8162314, 0.6924109, -1.423078, 0.6666667, 1, 0, 1,
-0.8143303, -2.149512, -2.268632, 0.6627451, 1, 0, 1,
-0.8103809, 0.9317371, -1.407029, 0.654902, 1, 0, 1,
-0.8045951, -0.09477521, -3.39414, 0.6509804, 1, 0, 1,
-0.7936932, -0.0826385, -2.569789, 0.6431373, 1, 0, 1,
-0.7935794, 0.8126432, -1.18109, 0.6392157, 1, 0, 1,
-0.7852329, 0.2583923, -1.27172, 0.6313726, 1, 0, 1,
-0.7839815, 0.561308, -0.3935434, 0.627451, 1, 0, 1,
-0.7769836, -1.791943, -4.830626, 0.6196079, 1, 0, 1,
-0.7753869, -0.9154881, -2.701101, 0.6156863, 1, 0, 1,
-0.7735752, -0.3122838, -1.586795, 0.6078432, 1, 0, 1,
-0.7727479, -0.2722344, -1.810749, 0.6039216, 1, 0, 1,
-0.7709254, 0.4809509, -2.135997, 0.5960785, 1, 0, 1,
-0.7703614, -1.804303, -2.434572, 0.5882353, 1, 0, 1,
-0.768649, -0.8194465, -1.969825, 0.5843138, 1, 0, 1,
-0.768633, -1.345322, -1.100927, 0.5764706, 1, 0, 1,
-0.765213, 1.047876, -2.799155, 0.572549, 1, 0, 1,
-0.7604438, 0.287395, -1.640942, 0.5647059, 1, 0, 1,
-0.7599849, 0.7289094, -0.7816304, 0.5607843, 1, 0, 1,
-0.7594614, 1.053563, -0.9595925, 0.5529412, 1, 0, 1,
-0.758301, 1.966729, 0.9374173, 0.5490196, 1, 0, 1,
-0.7535117, -1.724674, -3.815986, 0.5411765, 1, 0, 1,
-0.7534521, -0.1981857, -2.071942, 0.5372549, 1, 0, 1,
-0.7502872, 0.9950166, -0.5572807, 0.5294118, 1, 0, 1,
-0.749843, 0.2037169, -3.72598, 0.5254902, 1, 0, 1,
-0.7470836, 1.986469, 0.05021487, 0.5176471, 1, 0, 1,
-0.7448817, 0.7122843, 0.201223, 0.5137255, 1, 0, 1,
-0.7438234, -0.7567571, -1.297249, 0.5058824, 1, 0, 1,
-0.7213776, -0.7632232, -1.757906, 0.5019608, 1, 0, 1,
-0.7161903, -1.520594, -1.531994, 0.4941176, 1, 0, 1,
-0.7144894, 1.231123, -0.3977574, 0.4862745, 1, 0, 1,
-0.7128814, -0.8151336, -4.357887, 0.4823529, 1, 0, 1,
-0.7042814, 0.9487482, -1.080107, 0.4745098, 1, 0, 1,
-0.6859125, 0.3840021, -1.486387, 0.4705882, 1, 0, 1,
-0.6857776, 1.161491, 0.1724649, 0.4627451, 1, 0, 1,
-0.6829091, 0.2705527, -0.8319204, 0.4588235, 1, 0, 1,
-0.6827093, 0.9761264, -0.5609857, 0.4509804, 1, 0, 1,
-0.6776477, 1.318753, 1.225278, 0.4470588, 1, 0, 1,
-0.6773432, -0.6803746, -3.048768, 0.4392157, 1, 0, 1,
-0.6753761, -0.6130952, -2.115036, 0.4352941, 1, 0, 1,
-0.6732267, 1.162696, -1.099347, 0.427451, 1, 0, 1,
-0.6728359, -0.1447937, -1.766291, 0.4235294, 1, 0, 1,
-0.6699548, -1.97383, -2.953833, 0.4156863, 1, 0, 1,
-0.6692236, -0.1865263, -2.352801, 0.4117647, 1, 0, 1,
-0.6664933, -0.2049376, -0.3077343, 0.4039216, 1, 0, 1,
-0.6615158, 0.1800401, -1.290239, 0.3960784, 1, 0, 1,
-0.6609254, -0.2718925, -3.000503, 0.3921569, 1, 0, 1,
-0.6578158, -1.595366, 0.01335949, 0.3843137, 1, 0, 1,
-0.6551305, 0.9148386, -1.37678, 0.3803922, 1, 0, 1,
-0.6535328, -0.744719, -2.478166, 0.372549, 1, 0, 1,
-0.6521259, 0.7179422, -2.114234, 0.3686275, 1, 0, 1,
-0.6519552, 1.436967, 2.059342, 0.3607843, 1, 0, 1,
-0.6509545, 0.8798984, -1.292006, 0.3568628, 1, 0, 1,
-0.6481179, 0.01216263, -1.579313, 0.3490196, 1, 0, 1,
-0.6456828, -0.1694857, -3.217471, 0.345098, 1, 0, 1,
-0.6447526, 0.0745048, -1.346653, 0.3372549, 1, 0, 1,
-0.6429129, 1.133353, -1.092432, 0.3333333, 1, 0, 1,
-0.6385278, -0.4532535, -1.871718, 0.3254902, 1, 0, 1,
-0.6371956, -0.4395009, -0.1721936, 0.3215686, 1, 0, 1,
-0.6359798, 2.000217, 0.6847369, 0.3137255, 1, 0, 1,
-0.63473, -2.063811, -2.759703, 0.3098039, 1, 0, 1,
-0.6251415, -0.4432473, -2.004076, 0.3019608, 1, 0, 1,
-0.6208197, -0.8855475, -3.075395, 0.2941177, 1, 0, 1,
-0.6167591, 1.268607, -1.514613, 0.2901961, 1, 0, 1,
-0.6151245, 0.4976792, -0.1041796, 0.282353, 1, 0, 1,
-0.6129513, 0.3587273, -2.293767, 0.2784314, 1, 0, 1,
-0.6115512, -1.170412, -2.60381, 0.2705882, 1, 0, 1,
-0.6090583, -0.5807754, -1.28506, 0.2666667, 1, 0, 1,
-0.6076341, 0.7144387, -0.848007, 0.2588235, 1, 0, 1,
-0.6050691, 0.1905009, -0.3746236, 0.254902, 1, 0, 1,
-0.6022646, -1.604946, -3.701988, 0.2470588, 1, 0, 1,
-0.6019989, -0.1851415, -0.8370426, 0.2431373, 1, 0, 1,
-0.6019021, -0.3549837, -0.9836379, 0.2352941, 1, 0, 1,
-0.5988139, 0.3359069, -0.964819, 0.2313726, 1, 0, 1,
-0.5957025, -0.01120575, -1.249694, 0.2235294, 1, 0, 1,
-0.5928791, 0.06211324, -1.421642, 0.2196078, 1, 0, 1,
-0.5925011, -0.5613846, -3.515701, 0.2117647, 1, 0, 1,
-0.5920011, -1.646784, -3.598139, 0.2078431, 1, 0, 1,
-0.5904387, 0.3073225, -1.351827, 0.2, 1, 0, 1,
-0.5847371, 0.08906281, -1.022837, 0.1921569, 1, 0, 1,
-0.5788604, 0.4880498, -1.475461, 0.1882353, 1, 0, 1,
-0.5759807, -0.8962184, -3.104962, 0.1803922, 1, 0, 1,
-0.5706894, 0.3935622, 0.1814413, 0.1764706, 1, 0, 1,
-0.5673618, -2.700723, -2.030699, 0.1686275, 1, 0, 1,
-0.5586654, -0.4319986, -3.651322, 0.1647059, 1, 0, 1,
-0.5573361, 1.816422, -1.559963, 0.1568628, 1, 0, 1,
-0.5549747, -1.605467, -2.627449, 0.1529412, 1, 0, 1,
-0.5521559, -1.25497, -2.692385, 0.145098, 1, 0, 1,
-0.5477459, 3.2077, 0.0101176, 0.1411765, 1, 0, 1,
-0.5472671, 0.1655176, -2.980841, 0.1333333, 1, 0, 1,
-0.5465124, 0.05203906, -0.7161387, 0.1294118, 1, 0, 1,
-0.5423772, -0.3937583, -2.068602, 0.1215686, 1, 0, 1,
-0.5422202, -0.4043621, -3.278262, 0.1176471, 1, 0, 1,
-0.5412298, -1.023801, -1.594291, 0.1098039, 1, 0, 1,
-0.5378699, 0.3205185, -0.7260008, 0.1058824, 1, 0, 1,
-0.5293854, -0.5594717, -2.908288, 0.09803922, 1, 0, 1,
-0.5196496, 0.2237788, -1.609794, 0.09019608, 1, 0, 1,
-0.5154869, -0.8473935, -1.011551, 0.08627451, 1, 0, 1,
-0.515218, 2.030549, -0.7103867, 0.07843138, 1, 0, 1,
-0.5129673, -0.4145341, -1.415699, 0.07450981, 1, 0, 1,
-0.5125855, 0.2977972, -1.531334, 0.06666667, 1, 0, 1,
-0.5105031, -1.001769, -3.941627, 0.0627451, 1, 0, 1,
-0.50305, 0.2326963, -1.983146, 0.05490196, 1, 0, 1,
-0.5025784, 0.5245661, -2.072702, 0.05098039, 1, 0, 1,
-0.5018929, 0.1136151, -1.145673, 0.04313726, 1, 0, 1,
-0.5010459, -1.280033, -1.706434, 0.03921569, 1, 0, 1,
-0.4989319, -1.00466, -1.731685, 0.03137255, 1, 0, 1,
-0.4948153, -0.7990572, -2.980154, 0.02745098, 1, 0, 1,
-0.4941441, -0.4972771, -3.889601, 0.01960784, 1, 0, 1,
-0.4917574, -1.617722, -4.404067, 0.01568628, 1, 0, 1,
-0.4909815, -0.7640343, -4.771487, 0.007843138, 1, 0, 1,
-0.4896564, 0.05561034, -1.174094, 0.003921569, 1, 0, 1,
-0.4840718, 0.9577881, -0.6025496, 0, 1, 0.003921569, 1,
-0.4816233, -0.4569856, -0.6145875, 0, 1, 0.01176471, 1,
-0.4725829, 0.2986625, -1.215455, 0, 1, 0.01568628, 1,
-0.4712244, -0.06668615, -1.335399, 0, 1, 0.02352941, 1,
-0.4689385, -1.12369, -2.068319, 0, 1, 0.02745098, 1,
-0.4669273, 0.5390136, -1.97686, 0, 1, 0.03529412, 1,
-0.466605, 0.01803848, -1.968512, 0, 1, 0.03921569, 1,
-0.4611761, -1.175875, -1.708839, 0, 1, 0.04705882, 1,
-0.4606018, -0.7107504, -2.268974, 0, 1, 0.05098039, 1,
-0.4596993, 0.1548687, -2.026556, 0, 1, 0.05882353, 1,
-0.45682, 0.3026137, 0.8488204, 0, 1, 0.0627451, 1,
-0.4560434, -1.118652, -2.585823, 0, 1, 0.07058824, 1,
-0.4542436, 3.252335, -1.401305, 0, 1, 0.07450981, 1,
-0.451189, -0.4709228, -4.397328, 0, 1, 0.08235294, 1,
-0.4494546, -0.8212542, -3.281821, 0, 1, 0.08627451, 1,
-0.4489946, -1.141252, -1.860023, 0, 1, 0.09411765, 1,
-0.4473291, 0.9726012, 1.677152, 0, 1, 0.1019608, 1,
-0.4445758, -0.7056759, -3.093286, 0, 1, 0.1058824, 1,
-0.4431755, 0.2344788, -0.7766007, 0, 1, 0.1137255, 1,
-0.4410193, -0.8682907, -2.16233, 0, 1, 0.1176471, 1,
-0.4337246, 0.04084363, -0.827379, 0, 1, 0.1254902, 1,
-0.4313473, -0.7929574, -3.040986, 0, 1, 0.1294118, 1,
-0.4285729, 1.661823, -0.1410394, 0, 1, 0.1372549, 1,
-0.4266026, 0.1287705, -0.5823375, 0, 1, 0.1411765, 1,
-0.4247738, -0.5590006, -3.223388, 0, 1, 0.1490196, 1,
-0.4181752, 0.6939569, -0.3673882, 0, 1, 0.1529412, 1,
-0.4159118, -0.0334085, -1.422432, 0, 1, 0.1607843, 1,
-0.4120522, 1.46987, -2.015822, 0, 1, 0.1647059, 1,
-0.406946, 1.788281, -3.458372, 0, 1, 0.172549, 1,
-0.401245, -0.8487672, -2.848825, 0, 1, 0.1764706, 1,
-0.3979319, -1.510025, -3.694329, 0, 1, 0.1843137, 1,
-0.3960772, 0.6652111, -1.216365, 0, 1, 0.1882353, 1,
-0.3957008, 0.5855683, -1.512001, 0, 1, 0.1960784, 1,
-0.3948672, 1.380839, -0.4775167, 0, 1, 0.2039216, 1,
-0.3907067, -0.8889932, -1.619655, 0, 1, 0.2078431, 1,
-0.3902027, 0.4564625, -0.1380755, 0, 1, 0.2156863, 1,
-0.3896023, -1.775674, -3.215316, 0, 1, 0.2196078, 1,
-0.3816441, 0.1453991, -1.51544, 0, 1, 0.227451, 1,
-0.369532, 0.03904901, -0.2654709, 0, 1, 0.2313726, 1,
-0.3660736, -0.1543559, -2.081936, 0, 1, 0.2392157, 1,
-0.3641546, 0.8183447, -1.423564, 0, 1, 0.2431373, 1,
-0.3625275, 0.8416276, -0.3953578, 0, 1, 0.2509804, 1,
-0.3622543, 0.6182492, 1.115588, 0, 1, 0.254902, 1,
-0.3614418, 0.8631226, -0.2019904, 0, 1, 0.2627451, 1,
-0.3580104, 1.898896, 0.4533511, 0, 1, 0.2666667, 1,
-0.3538606, 1.246278, -0.4539846, 0, 1, 0.2745098, 1,
-0.3526742, -0.2314206, -0.9604901, 0, 1, 0.2784314, 1,
-0.3502985, 1.175096, 0.8545876, 0, 1, 0.2862745, 1,
-0.3491995, 0.7271025, -0.2207815, 0, 1, 0.2901961, 1,
-0.3480011, 1.542673, -0.6045464, 0, 1, 0.2980392, 1,
-0.3468331, -2.562358, -2.934487, 0, 1, 0.3058824, 1,
-0.3458257, -2.161957, -2.9774, 0, 1, 0.3098039, 1,
-0.3420963, -1.048759, -4.622332, 0, 1, 0.3176471, 1,
-0.3417877, 0.4614943, -0.5287223, 0, 1, 0.3215686, 1,
-0.3410237, 0.04882039, -1.42934, 0, 1, 0.3294118, 1,
-0.3400926, -0.7431156, -1.578413, 0, 1, 0.3333333, 1,
-0.3384264, 0.8302013, -0.6647108, 0, 1, 0.3411765, 1,
-0.3344106, 0.597123, -2.811478, 0, 1, 0.345098, 1,
-0.3311313, 1.751244, 0.2977803, 0, 1, 0.3529412, 1,
-0.3234925, -1.468071, -1.990808, 0, 1, 0.3568628, 1,
-0.321772, 1.33579, 0.9685168, 0, 1, 0.3647059, 1,
-0.321581, 1.055981, 0.1946185, 0, 1, 0.3686275, 1,
-0.3210711, 1.544539, 1.106161, 0, 1, 0.3764706, 1,
-0.3209054, -1.984314, -2.150912, 0, 1, 0.3803922, 1,
-0.3197919, -1.403995, -2.386645, 0, 1, 0.3882353, 1,
-0.3185742, -0.8677811, -1.346925, 0, 1, 0.3921569, 1,
-0.3151854, 0.303916, -0.2495806, 0, 1, 0.4, 1,
-0.3150939, -1.471712, -3.526, 0, 1, 0.4078431, 1,
-0.3095057, 0.6607578, 0.1433738, 0, 1, 0.4117647, 1,
-0.3093105, -1.575547, -2.641104, 0, 1, 0.4196078, 1,
-0.2981981, -0.2008833, -1.177609, 0, 1, 0.4235294, 1,
-0.2969764, 0.6555939, -1.749765, 0, 1, 0.4313726, 1,
-0.2930573, -0.1212006, -2.265434, 0, 1, 0.4352941, 1,
-0.2926743, -1.135926, -3.074197, 0, 1, 0.4431373, 1,
-0.2863034, -0.9207107, -1.496471, 0, 1, 0.4470588, 1,
-0.2801765, 0.4115882, -0.9606714, 0, 1, 0.454902, 1,
-0.275515, 0.4633225, -1.31158, 0, 1, 0.4588235, 1,
-0.2722929, -0.3550876, -2.551964, 0, 1, 0.4666667, 1,
-0.2712913, -0.5562313, -2.224274, 0, 1, 0.4705882, 1,
-0.263622, 2.528571, -0.1789184, 0, 1, 0.4784314, 1,
-0.2634261, -0.4654191, -0.3223774, 0, 1, 0.4823529, 1,
-0.2630209, 0.6090063, 1.846879, 0, 1, 0.4901961, 1,
-0.2620774, -1.683884, -1.992838, 0, 1, 0.4941176, 1,
-0.2547411, 0.8040297, 0.3933533, 0, 1, 0.5019608, 1,
-0.2541749, 0.7316207, -1.037774, 0, 1, 0.509804, 1,
-0.2485545, -0.7648137, -1.720428, 0, 1, 0.5137255, 1,
-0.2480366, -2.128599, -3.7824, 0, 1, 0.5215687, 1,
-0.2467875, -0.7933755, -3.041013, 0, 1, 0.5254902, 1,
-0.244596, 0.5249949, 0.4286098, 0, 1, 0.5333334, 1,
-0.2409025, -0.5783884, -2.651104, 0, 1, 0.5372549, 1,
-0.2351592, -0.4031586, -1.821588, 0, 1, 0.5450981, 1,
-0.2323198, 0.1060962, -1.383891, 0, 1, 0.5490196, 1,
-0.2314467, 0.02749303, -1.919625, 0, 1, 0.5568628, 1,
-0.2289634, 0.1384694, -2.814387, 0, 1, 0.5607843, 1,
-0.2270786, -2.186792, -1.271128, 0, 1, 0.5686275, 1,
-0.2222995, 1.155059, -0.962522, 0, 1, 0.572549, 1,
-0.2184968, -0.8684093, -3.314858, 0, 1, 0.5803922, 1,
-0.2184752, 0.04720526, 0.1741876, 0, 1, 0.5843138, 1,
-0.2180167, 0.01535615, 0.2875049, 0, 1, 0.5921569, 1,
-0.2174096, -0.7283871, -2.867376, 0, 1, 0.5960785, 1,
-0.2172436, -2.584515, -3.912779, 0, 1, 0.6039216, 1,
-0.2171391, 0.772254, -1.03704, 0, 1, 0.6117647, 1,
-0.2141137, 0.8847011, 0.3563428, 0, 1, 0.6156863, 1,
-0.2082451, -0.6117285, -2.052144, 0, 1, 0.6235294, 1,
-0.207081, 0.2543445, -0.1239012, 0, 1, 0.627451, 1,
-0.2070015, -0.8806378, -2.988088, 0, 1, 0.6352941, 1,
-0.1961202, 0.6068352, -1.076368, 0, 1, 0.6392157, 1,
-0.1960045, 0.6722441, 0.8765943, 0, 1, 0.6470588, 1,
-0.1929667, -0.6288866, -0.8064603, 0, 1, 0.6509804, 1,
-0.185836, 0.3025523, -0.8464293, 0, 1, 0.6588235, 1,
-0.1853337, -0.2316535, -3.442204, 0, 1, 0.6627451, 1,
-0.1852049, 0.938166, -0.2251936, 0, 1, 0.6705883, 1,
-0.1836987, -1.117605, -2.840966, 0, 1, 0.6745098, 1,
-0.1825736, 1.267295, 0.4220439, 0, 1, 0.682353, 1,
-0.1795995, 1.164948, 1.509038, 0, 1, 0.6862745, 1,
-0.1718505, -0.1937171, -2.183796, 0, 1, 0.6941177, 1,
-0.1717527, -0.2238064, -3.926972, 0, 1, 0.7019608, 1,
-0.167323, 0.2544289, -0.5010075, 0, 1, 0.7058824, 1,
-0.1650084, -0.2210149, -1.279972, 0, 1, 0.7137255, 1,
-0.1636253, 0.2653699, 0.4474363, 0, 1, 0.7176471, 1,
-0.1570463, 0.05182799, -0.4680916, 0, 1, 0.7254902, 1,
-0.1568882, 0.4791064, 1.444084, 0, 1, 0.7294118, 1,
-0.1563508, -1.498, -3.030371, 0, 1, 0.7372549, 1,
-0.1493098, 1.619599, -0.07084963, 0, 1, 0.7411765, 1,
-0.147135, -0.08535658, 0.3843095, 0, 1, 0.7490196, 1,
-0.1444418, 1.754246, 0.6077036, 0, 1, 0.7529412, 1,
-0.1406395, 0.2536003, -2.997459, 0, 1, 0.7607843, 1,
-0.1321392, -1.266213, -1.778968, 0, 1, 0.7647059, 1,
-0.1307851, 0.5590189, -1.809695, 0, 1, 0.772549, 1,
-0.1298986, 0.9405848, -0.09739505, 0, 1, 0.7764706, 1,
-0.1295312, 0.2814516, 0.4726268, 0, 1, 0.7843137, 1,
-0.1283941, 0.3923663, -1.139315, 0, 1, 0.7882353, 1,
-0.1279239, -1.130504, -5.236626, 0, 1, 0.7960784, 1,
-0.1274569, 0.3110155, -0.1804207, 0, 1, 0.8039216, 1,
-0.1269764, 0.677908, -0.8071198, 0, 1, 0.8078431, 1,
-0.122585, 0.8654818, 0.2835014, 0, 1, 0.8156863, 1,
-0.1194867, -0.5238554, -3.125706, 0, 1, 0.8196079, 1,
-0.1167688, -0.1113552, -1.954739, 0, 1, 0.827451, 1,
-0.1158678, 0.1509507, -1.548993, 0, 1, 0.8313726, 1,
-0.1154618, -1.733551, -2.937973, 0, 1, 0.8392157, 1,
-0.115109, -0.9284503, -4.076326, 0, 1, 0.8431373, 1,
-0.114449, 1.796071, -0.6689427, 0, 1, 0.8509804, 1,
-0.1079679, 0.8143698, 1.178567, 0, 1, 0.854902, 1,
-0.08850542, -0.1098708, -3.42479, 0, 1, 0.8627451, 1,
-0.08235329, 0.2268585, 0.7090493, 0, 1, 0.8666667, 1,
-0.07742104, 2.512449, 0.5867171, 0, 1, 0.8745098, 1,
-0.07040054, 0.6032417, 0.08465544, 0, 1, 0.8784314, 1,
-0.07014105, -0.4542643, -2.438014, 0, 1, 0.8862745, 1,
-0.0672446, 0.2264731, -3.246995, 0, 1, 0.8901961, 1,
-0.06591198, 0.1760279, 0.1672483, 0, 1, 0.8980392, 1,
-0.06545726, 0.6948437, 1.00213, 0, 1, 0.9058824, 1,
-0.05575427, 0.3510392, -2.362889, 0, 1, 0.9098039, 1,
-0.05307977, -0.2322361, -3.71848, 0, 1, 0.9176471, 1,
-0.05144238, 0.7735719, -0.04793582, 0, 1, 0.9215686, 1,
-0.04899282, -0.3329188, -2.651818, 0, 1, 0.9294118, 1,
-0.04866692, 0.7437317, -0.5543218, 0, 1, 0.9333333, 1,
-0.04836457, -1.044352, -3.208327, 0, 1, 0.9411765, 1,
-0.03979905, -0.5279182, -5.200031, 0, 1, 0.945098, 1,
-0.02359744, 0.7144994, -0.5369048, 0, 1, 0.9529412, 1,
-0.02240128, 0.03083411, -1.22038, 0, 1, 0.9568627, 1,
-0.01753754, 0.9761364, 1.000529, 0, 1, 0.9647059, 1,
-0.01557299, 1.929831, 0.9536706, 0, 1, 0.9686275, 1,
-0.01491987, -0.3714081, -4.223254, 0, 1, 0.9764706, 1,
-0.008191639, 0.8998531, 0.7741639, 0, 1, 0.9803922, 1,
-0.006754119, -2.506442, -1.082898, 0, 1, 0.9882353, 1,
-0.006127794, -0.8746655, -2.842729, 0, 1, 0.9921569, 1,
-0.006092635, -0.9356107, -5.295642, 0, 1, 1, 1,
-0.005649394, 0.6710954, 0.6909295, 0, 0.9921569, 1, 1,
-0.004892936, 0.5723123, -0.5840035, 0, 0.9882353, 1, 1,
-0.003171379, 2.214659, 0.1621946, 0, 0.9803922, 1, 1,
-0.002123319, -0.7520872, -3.79946, 0, 0.9764706, 1, 1,
-0.00197045, 0.05398037, 0.8945723, 0, 0.9686275, 1, 1,
0.001104909, -1.927494, 1.813831, 0, 0.9647059, 1, 1,
0.005634114, 0.7263837, 0.6845319, 0, 0.9568627, 1, 1,
0.007764397, -1.095974, 1.741055, 0, 0.9529412, 1, 1,
0.008503038, 0.3148034, -0.9503592, 0, 0.945098, 1, 1,
0.009429549, 0.2342376, -0.02480387, 0, 0.9411765, 1, 1,
0.009468528, -1.397958, 3.895131, 0, 0.9333333, 1, 1,
0.01211455, 0.4433411, 1.762343, 0, 0.9294118, 1, 1,
0.01607411, -0.8177536, 4.166016, 0, 0.9215686, 1, 1,
0.01687103, -0.262078, 3.394624, 0, 0.9176471, 1, 1,
0.02071097, -0.6899592, 3.549666, 0, 0.9098039, 1, 1,
0.02386588, -1.723994, 2.842994, 0, 0.9058824, 1, 1,
0.02659375, 0.6110659, 0.6402493, 0, 0.8980392, 1, 1,
0.0268729, -1.947744, 2.277377, 0, 0.8901961, 1, 1,
0.03189465, 0.6446619, -0.1022228, 0, 0.8862745, 1, 1,
0.03190802, 1.630052, 1.286707, 0, 0.8784314, 1, 1,
0.03794948, 0.0853916, -0.7474845, 0, 0.8745098, 1, 1,
0.04004893, -0.3995791, 2.406702, 0, 0.8666667, 1, 1,
0.04144555, -0.3966281, 3.832538, 0, 0.8627451, 1, 1,
0.0453919, -0.9734097, 3.038493, 0, 0.854902, 1, 1,
0.04856929, 0.341309, 0.7792271, 0, 0.8509804, 1, 1,
0.05058318, 0.4577546, -0.3810704, 0, 0.8431373, 1, 1,
0.05225757, 0.3546394, -1.608746, 0, 0.8392157, 1, 1,
0.05435864, -0.3367337, 1.273912, 0, 0.8313726, 1, 1,
0.05539784, 0.08930594, 1.439512, 0, 0.827451, 1, 1,
0.05563202, -1.114394, 3.571428, 0, 0.8196079, 1, 1,
0.05981547, -0.7023523, 2.097029, 0, 0.8156863, 1, 1,
0.0629092, -0.4161634, 3.823002, 0, 0.8078431, 1, 1,
0.06522349, -0.6681685, 4.289961, 0, 0.8039216, 1, 1,
0.06633746, 1.106607, -0.7727813, 0, 0.7960784, 1, 1,
0.06998879, 0.4349654, -2.263127, 0, 0.7882353, 1, 1,
0.07151739, 0.06489682, 0.6510705, 0, 0.7843137, 1, 1,
0.07226084, 0.8906022, 0.4064852, 0, 0.7764706, 1, 1,
0.07399138, -1.881705, 4.873433, 0, 0.772549, 1, 1,
0.07492796, -0.03090346, 3.136635, 0, 0.7647059, 1, 1,
0.0782364, -0.6767256, 4.187357, 0, 0.7607843, 1, 1,
0.07914753, 1.727959, 0.47236, 0, 0.7529412, 1, 1,
0.08061411, 0.9512464, 1.311569, 0, 0.7490196, 1, 1,
0.08583771, -0.09502268, 4.466005, 0, 0.7411765, 1, 1,
0.08732356, -0.3049838, 2.048666, 0, 0.7372549, 1, 1,
0.08804148, -1.062598, 3.344428, 0, 0.7294118, 1, 1,
0.08805472, 0.5331661, 0.6775568, 0, 0.7254902, 1, 1,
0.09123056, 1.736449, 0.2034043, 0, 0.7176471, 1, 1,
0.09866673, 0.5589865, 1.036745, 0, 0.7137255, 1, 1,
0.09927703, 0.1520223, -0.9204552, 0, 0.7058824, 1, 1,
0.102407, 0.05138316, 1.701768, 0, 0.6980392, 1, 1,
0.1116129, 1.758222, 1.180159, 0, 0.6941177, 1, 1,
0.1119205, 2.262459, -1.617527, 0, 0.6862745, 1, 1,
0.1121567, 0.2763353, 1.408431, 0, 0.682353, 1, 1,
0.1134069, 0.4511476, 0.8489221, 0, 0.6745098, 1, 1,
0.1141323, -1.074854, 3.247108, 0, 0.6705883, 1, 1,
0.1191482, 1.781811, 0.3585789, 0, 0.6627451, 1, 1,
0.1232447, -0.01638991, 3.017702, 0, 0.6588235, 1, 1,
0.1287871, -0.8998475, 2.529901, 0, 0.6509804, 1, 1,
0.1295292, -0.8230919, 3.701026, 0, 0.6470588, 1, 1,
0.1387324, -0.7104484, 1.383509, 0, 0.6392157, 1, 1,
0.139444, 3.627836, 0.2236683, 0, 0.6352941, 1, 1,
0.1456872, 0.4581559, -0.3093902, 0, 0.627451, 1, 1,
0.1482198, 1.354081, -0.7759457, 0, 0.6235294, 1, 1,
0.1487107, -1.41989, 3.066273, 0, 0.6156863, 1, 1,
0.1491151, -0.0319264, 0.9891499, 0, 0.6117647, 1, 1,
0.1552643, 2.32046, -1.56719, 0, 0.6039216, 1, 1,
0.1568144, -1.188761, 2.971779, 0, 0.5960785, 1, 1,
0.1621112, 0.9041783, 1.123709, 0, 0.5921569, 1, 1,
0.1650474, 0.3556179, -0.6844176, 0, 0.5843138, 1, 1,
0.1698753, -0.2712601, -0.1353894, 0, 0.5803922, 1, 1,
0.1699395, 0.6280889, -0.39234, 0, 0.572549, 1, 1,
0.1728662, -0.08929797, 2.851351, 0, 0.5686275, 1, 1,
0.175126, -0.6842787, 2.25074, 0, 0.5607843, 1, 1,
0.1757321, -0.4983696, 3.409422, 0, 0.5568628, 1, 1,
0.1768927, -0.8031685, 3.077908, 0, 0.5490196, 1, 1,
0.1818706, -0.06100903, 1.420681, 0, 0.5450981, 1, 1,
0.1836885, -0.5651641, 2.417828, 0, 0.5372549, 1, 1,
0.1877506, -1.249438, 2.863102, 0, 0.5333334, 1, 1,
0.1886222, 1.480312, 0.9479423, 0, 0.5254902, 1, 1,
0.189933, -0.9059992, 1.689167, 0, 0.5215687, 1, 1,
0.1930449, -1.332755, 3.02055, 0, 0.5137255, 1, 1,
0.1931198, -0.8407313, 3.082628, 0, 0.509804, 1, 1,
0.19451, 1.013871, -1.06584, 0, 0.5019608, 1, 1,
0.1989969, 0.4211955, -1.582273, 0, 0.4941176, 1, 1,
0.2008202, 0.8863142, -0.8068092, 0, 0.4901961, 1, 1,
0.2045265, -0.3030962, 3.002113, 0, 0.4823529, 1, 1,
0.2049519, 0.4494075, 0.9876256, 0, 0.4784314, 1, 1,
0.2080371, 0.8543726, -0.08456611, 0, 0.4705882, 1, 1,
0.2092142, -0.7584859, 2.96736, 0, 0.4666667, 1, 1,
0.211684, -0.04847238, 1.762908, 0, 0.4588235, 1, 1,
0.2117034, -0.9343516, 2.072228, 0, 0.454902, 1, 1,
0.2157707, 0.5143011, 0.9547537, 0, 0.4470588, 1, 1,
0.2188792, 0.4075319, 1.362933, 0, 0.4431373, 1, 1,
0.2189249, 1.055553, 0.5987351, 0, 0.4352941, 1, 1,
0.220152, -1.167132, 2.043568, 0, 0.4313726, 1, 1,
0.2213578, 2.48686, 1.821984, 0, 0.4235294, 1, 1,
0.2225371, 0.7415848, 0.8054006, 0, 0.4196078, 1, 1,
0.2270196, -0.2068703, 3.493712, 0, 0.4117647, 1, 1,
0.2275925, -0.1948413, 3.066805, 0, 0.4078431, 1, 1,
0.2285831, 0.4359874, 0.5055253, 0, 0.4, 1, 1,
0.2293567, -0.05645218, 1.359262, 0, 0.3921569, 1, 1,
0.2310068, -0.7614751, 2.510758, 0, 0.3882353, 1, 1,
0.2348816, 0.7174414, 0.315428, 0, 0.3803922, 1, 1,
0.2359914, 0.5671085, 0.8594511, 0, 0.3764706, 1, 1,
0.2400516, -0.1438352, 2.936967, 0, 0.3686275, 1, 1,
0.2406405, -0.3336464, 2.90497, 0, 0.3647059, 1, 1,
0.240854, 0.6901566, 1.214356, 0, 0.3568628, 1, 1,
0.2468344, 0.04074721, 2.51916, 0, 0.3529412, 1, 1,
0.2525356, 0.7998309, -0.00610834, 0, 0.345098, 1, 1,
0.2540384, 0.8587914, 0.2766839, 0, 0.3411765, 1, 1,
0.25635, -1.496572, 3.191468, 0, 0.3333333, 1, 1,
0.2649722, 2.597129, -1.128968, 0, 0.3294118, 1, 1,
0.2698658, -0.291725, 1.95468, 0, 0.3215686, 1, 1,
0.2710391, 0.1162786, 2.583054, 0, 0.3176471, 1, 1,
0.2765138, 0.3601503, 1.896369, 0, 0.3098039, 1, 1,
0.2769285, 1.383807, 1.648168, 0, 0.3058824, 1, 1,
0.2781137, 1.298437, 1.012112, 0, 0.2980392, 1, 1,
0.2792801, -0.5621818, 2.108892, 0, 0.2901961, 1, 1,
0.2817387, -0.07775874, 3.719849, 0, 0.2862745, 1, 1,
0.2828468, -1.295327, 1.302723, 0, 0.2784314, 1, 1,
0.2876291, 0.0109527, 1.107046, 0, 0.2745098, 1, 1,
0.2879991, -0.6157486, 1.944285, 0, 0.2666667, 1, 1,
0.2918276, -0.9125838, 2.911774, 0, 0.2627451, 1, 1,
0.2939282, 0.8667369, -0.6852471, 0, 0.254902, 1, 1,
0.2943213, -0.01969479, 0.5980572, 0, 0.2509804, 1, 1,
0.2987614, -0.3417318, 1.318278, 0, 0.2431373, 1, 1,
0.3002246, -1.537401, 3.81936, 0, 0.2392157, 1, 1,
0.3059718, -0.08047986, 2.094044, 0, 0.2313726, 1, 1,
0.3064205, -0.8572126, 2.133072, 0, 0.227451, 1, 1,
0.3174319, -0.3845054, 3.959428, 0, 0.2196078, 1, 1,
0.3199037, -0.460044, 1.820243, 0, 0.2156863, 1, 1,
0.3213136, 0.1350991, 1.110784, 0, 0.2078431, 1, 1,
0.3239757, 1.950567, -1.050289, 0, 0.2039216, 1, 1,
0.324753, 0.2950839, 0.0482441, 0, 0.1960784, 1, 1,
0.3274509, -0.6211848, 1.385688, 0, 0.1882353, 1, 1,
0.3339972, -0.8475186, 2.460288, 0, 0.1843137, 1, 1,
0.3350829, -0.02187488, 1.266014, 0, 0.1764706, 1, 1,
0.3352339, 0.5770128, -0.3036955, 0, 0.172549, 1, 1,
0.3445027, 0.5837436, -0.4931967, 0, 0.1647059, 1, 1,
0.3446641, 0.3842922, 1.826048, 0, 0.1607843, 1, 1,
0.3465897, 0.4972103, 0.5092727, 0, 0.1529412, 1, 1,
0.3468379, -1.080765, 3.183156, 0, 0.1490196, 1, 1,
0.3483096, -0.7867606, 4.554252, 0, 0.1411765, 1, 1,
0.3485249, 0.6723926, 1.000229, 0, 0.1372549, 1, 1,
0.3493382, 0.6787795, 0.8895054, 0, 0.1294118, 1, 1,
0.3550246, -1.330441, 2.092505, 0, 0.1254902, 1, 1,
0.3557149, -0.09836344, 2.096545, 0, 0.1176471, 1, 1,
0.356381, 0.4283595, 0.6883468, 0, 0.1137255, 1, 1,
0.3588125, -0.2114771, 0.8564696, 0, 0.1058824, 1, 1,
0.3612272, -1.22218, 1.291539, 0, 0.09803922, 1, 1,
0.362105, -0.9825634, 3.258188, 0, 0.09411765, 1, 1,
0.3639714, 0.7888663, 1.190053, 0, 0.08627451, 1, 1,
0.366974, -0.936188, 1.693527, 0, 0.08235294, 1, 1,
0.3670669, 1.169515, -0.1244569, 0, 0.07450981, 1, 1,
0.3721827, -0.4959644, 2.467765, 0, 0.07058824, 1, 1,
0.3746364, 0.4236444, 1.671504, 0, 0.0627451, 1, 1,
0.386565, -0.3284515, 3.371588, 0, 0.05882353, 1, 1,
0.3882846, 0.01821026, 1.76026, 0, 0.05098039, 1, 1,
0.3900702, 1.191097, -2.459362, 0, 0.04705882, 1, 1,
0.3929898, -0.8157579, 2.923612, 0, 0.03921569, 1, 1,
0.3994545, -0.1814104, 1.839535, 0, 0.03529412, 1, 1,
0.4052269, -1.781389, 2.534817, 0, 0.02745098, 1, 1,
0.4115068, -1.989472, 4.125261, 0, 0.02352941, 1, 1,
0.4117035, 0.2201259, 1.387941, 0, 0.01568628, 1, 1,
0.4120184, 1.755357, -1.551028, 0, 0.01176471, 1, 1,
0.414886, -0.3843838, 2.923666, 0, 0.003921569, 1, 1,
0.4149395, 0.8943794, 1.085996, 0.003921569, 0, 1, 1,
0.4197512, -0.04031449, 1.305269, 0.007843138, 0, 1, 1,
0.4203471, 0.3433199, 1.29717, 0.01568628, 0, 1, 1,
0.4229645, 0.5140415, 0.09464146, 0.01960784, 0, 1, 1,
0.4279488, -0.8691542, 2.545342, 0.02745098, 0, 1, 1,
0.4314682, 1.02179, 0.3312028, 0.03137255, 0, 1, 1,
0.4320656, 1.227796, -0.3486828, 0.03921569, 0, 1, 1,
0.4339277, -0.3533123, 2.428155, 0.04313726, 0, 1, 1,
0.435301, -0.2147408, 0.3694435, 0.05098039, 0, 1, 1,
0.4401749, -1.772531, 4.910088, 0.05490196, 0, 1, 1,
0.4402298, 1.393865, 3.011454, 0.0627451, 0, 1, 1,
0.4439415, -0.6999564, 3.944654, 0.06666667, 0, 1, 1,
0.4474688, 1.850971, 0.3834768, 0.07450981, 0, 1, 1,
0.4503843, 3.337847, -0.03731413, 0.07843138, 0, 1, 1,
0.450871, 0.04471509, 2.034136, 0.08627451, 0, 1, 1,
0.452284, -0.09585918, 2.065703, 0.09019608, 0, 1, 1,
0.4569025, 0.06728284, 1.533993, 0.09803922, 0, 1, 1,
0.4574874, 0.9448289, 0.2039761, 0.1058824, 0, 1, 1,
0.4627696, -0.1906335, 1.692352, 0.1098039, 0, 1, 1,
0.464919, 0.7975888, 0.8139237, 0.1176471, 0, 1, 1,
0.4705293, -1.0967, 3.442307, 0.1215686, 0, 1, 1,
0.4900449, 0.1639605, 0.9315625, 0.1294118, 0, 1, 1,
0.4906194, 0.5729332, 0.1340257, 0.1333333, 0, 1, 1,
0.4918924, 1.800076, 1.233324, 0.1411765, 0, 1, 1,
0.4924608, -0.3047477, 2.207787, 0.145098, 0, 1, 1,
0.493961, 0.2196636, 0.4724248, 0.1529412, 0, 1, 1,
0.4941043, 0.09299409, -0.5483943, 0.1568628, 0, 1, 1,
0.496814, 1.15597, 1.624948, 0.1647059, 0, 1, 1,
0.4999482, 0.1308883, 1.586792, 0.1686275, 0, 1, 1,
0.5110651, -0.2245139, 0.9817545, 0.1764706, 0, 1, 1,
0.5143442, 0.7271899, 1.984508, 0.1803922, 0, 1, 1,
0.5147149, -0.3182361, 3.613594, 0.1882353, 0, 1, 1,
0.5222974, -1.754234, 2.230592, 0.1921569, 0, 1, 1,
0.5244027, 0.987665, -0.1210874, 0.2, 0, 1, 1,
0.5283193, 0.3544448, 0.8181704, 0.2078431, 0, 1, 1,
0.5313614, -1.327523, 1.368398, 0.2117647, 0, 1, 1,
0.5360402, -0.5071602, 1.122155, 0.2196078, 0, 1, 1,
0.5370225, -0.9787108, 3.085986, 0.2235294, 0, 1, 1,
0.537207, -0.6795624, 3.410421, 0.2313726, 0, 1, 1,
0.5383068, 0.7391009, 1.397753, 0.2352941, 0, 1, 1,
0.5386741, -0.6023716, 1.690182, 0.2431373, 0, 1, 1,
0.5417811, 1.343258, 0.4271225, 0.2470588, 0, 1, 1,
0.5431969, -0.2396387, 2.064987, 0.254902, 0, 1, 1,
0.5500441, -0.630524, 3.578469, 0.2588235, 0, 1, 1,
0.5517264, 0.7561879, 0.629449, 0.2666667, 0, 1, 1,
0.5549419, -0.1926109, 1.238329, 0.2705882, 0, 1, 1,
0.5565072, 0.3338541, 1.087963, 0.2784314, 0, 1, 1,
0.5600802, 0.2791933, -1.040159, 0.282353, 0, 1, 1,
0.563848, 0.4505638, 0.7417762, 0.2901961, 0, 1, 1,
0.5673357, -0.6369691, 1.856065, 0.2941177, 0, 1, 1,
0.5674936, 0.6568563, 1.09062, 0.3019608, 0, 1, 1,
0.5704096, 0.7495963, 0.4361684, 0.3098039, 0, 1, 1,
0.5727893, -1.102419, 0.2202647, 0.3137255, 0, 1, 1,
0.5739092, 0.4642328, 0.2364268, 0.3215686, 0, 1, 1,
0.5771872, 0.06948145, 2.23219, 0.3254902, 0, 1, 1,
0.5791141, 0.8441336, -0.6596533, 0.3333333, 0, 1, 1,
0.5803196, 1.175106, 1.540764, 0.3372549, 0, 1, 1,
0.581641, -1.943093, 3.709591, 0.345098, 0, 1, 1,
0.5891671, 0.07057459, 2.620862, 0.3490196, 0, 1, 1,
0.5903373, 0.5980482, 1.939382, 0.3568628, 0, 1, 1,
0.5941486, -0.8173456, 2.170408, 0.3607843, 0, 1, 1,
0.5951349, -0.2503297, 0.6827651, 0.3686275, 0, 1, 1,
0.5960948, -0.9734654, 3.593875, 0.372549, 0, 1, 1,
0.5999259, -0.3173837, 2.76494, 0.3803922, 0, 1, 1,
0.5999442, -0.1534251, 2.458267, 0.3843137, 0, 1, 1,
0.6015993, -0.1142721, 1.615531, 0.3921569, 0, 1, 1,
0.6021722, -1.659695, 2.482227, 0.3960784, 0, 1, 1,
0.6031172, 1.450632, 0.955115, 0.4039216, 0, 1, 1,
0.6066869, 0.7653297, -0.5296146, 0.4117647, 0, 1, 1,
0.614119, -0.3947662, 2.368533, 0.4156863, 0, 1, 1,
0.6155413, 0.2208603, 0.2079514, 0.4235294, 0, 1, 1,
0.6180559, -0.9870335, 4.686699, 0.427451, 0, 1, 1,
0.6226079, 0.5476025, 2.030409, 0.4352941, 0, 1, 1,
0.6228914, -0.538331, 0.7623636, 0.4392157, 0, 1, 1,
0.6247272, -1.768571, 3.500202, 0.4470588, 0, 1, 1,
0.6341023, -0.5810226, 2.314738, 0.4509804, 0, 1, 1,
0.6419523, 0.08634757, 2.026839, 0.4588235, 0, 1, 1,
0.6434368, -0.4414665, 0.9973823, 0.4627451, 0, 1, 1,
0.6472968, -0.5344325, 2.541706, 0.4705882, 0, 1, 1,
0.6483876, -0.8922303, 2.268674, 0.4745098, 0, 1, 1,
0.6494815, 0.7149612, -0.1751046, 0.4823529, 0, 1, 1,
0.6548263, -0.7893592, 1.823578, 0.4862745, 0, 1, 1,
0.6555355, 0.8342802, 0.458988, 0.4941176, 0, 1, 1,
0.656531, 0.6886347, -0.8281724, 0.5019608, 0, 1, 1,
0.6585648, -0.2541154, 0.9041501, 0.5058824, 0, 1, 1,
0.6642942, 1.808032, 0.1745716, 0.5137255, 0, 1, 1,
0.6681318, 0.2355979, 0.8098754, 0.5176471, 0, 1, 1,
0.6700151, -0.05864907, 1.578503, 0.5254902, 0, 1, 1,
0.676818, 0.01169915, 2.041485, 0.5294118, 0, 1, 1,
0.6771531, 2.158556, 0.6318029, 0.5372549, 0, 1, 1,
0.6790138, 0.7519082, 1.961196, 0.5411765, 0, 1, 1,
0.6829123, -1.37074, 2.16074, 0.5490196, 0, 1, 1,
0.6836556, -0.4965174, 2.909408, 0.5529412, 0, 1, 1,
0.6874385, -0.8449624, 1.348008, 0.5607843, 0, 1, 1,
0.6878389, 0.6477556, 1.274563, 0.5647059, 0, 1, 1,
0.6898232, 0.9997857, -0.6782964, 0.572549, 0, 1, 1,
0.6979461, -0.9250059, 1.999353, 0.5764706, 0, 1, 1,
0.697989, -0.1559882, 1.471687, 0.5843138, 0, 1, 1,
0.7004756, -0.7015627, 1.417717, 0.5882353, 0, 1, 1,
0.7023878, -1.887439, 2.601721, 0.5960785, 0, 1, 1,
0.702544, -0.05041183, 1.659954, 0.6039216, 0, 1, 1,
0.7064332, 0.8264098, 0.7702031, 0.6078432, 0, 1, 1,
0.7181281, 0.4252332, 2.04613, 0.6156863, 0, 1, 1,
0.7184095, -1.192683, 0.7614103, 0.6196079, 0, 1, 1,
0.7214308, 0.7421535, 0.5024406, 0.627451, 0, 1, 1,
0.7268255, -1.519192, 2.922167, 0.6313726, 0, 1, 1,
0.7289716, -0.3338195, 1.54695, 0.6392157, 0, 1, 1,
0.7296784, 0.4502299, 0.04796194, 0.6431373, 0, 1, 1,
0.7322071, -1.368715, 2.970544, 0.6509804, 0, 1, 1,
0.7327051, 0.07386012, 3.353503, 0.654902, 0, 1, 1,
0.732797, 0.3871449, 1.434742, 0.6627451, 0, 1, 1,
0.7387329, 1.195398, 1.609836, 0.6666667, 0, 1, 1,
0.7390637, 0.5075454, 2.593303, 0.6745098, 0, 1, 1,
0.7449334, -1.481937, 3.394397, 0.6784314, 0, 1, 1,
0.7490236, 1.836457, 0.2718481, 0.6862745, 0, 1, 1,
0.7555385, -0.209483, 1.869949, 0.6901961, 0, 1, 1,
0.7600229, -0.5146706, 3.840255, 0.6980392, 0, 1, 1,
0.7628785, 2.041337, 0.5145522, 0.7058824, 0, 1, 1,
0.7658994, 0.8740033, -0.5540337, 0.7098039, 0, 1, 1,
0.7685164, 0.5773668, 0.3571563, 0.7176471, 0, 1, 1,
0.769173, -1.832061, 3.475588, 0.7215686, 0, 1, 1,
0.7699558, -0.9344186, 1.803686, 0.7294118, 0, 1, 1,
0.7707046, -0.1862002, 0.9874572, 0.7333333, 0, 1, 1,
0.7745399, -0.3996795, 2.169095, 0.7411765, 0, 1, 1,
0.7777399, -0.8997273, 2.981344, 0.7450981, 0, 1, 1,
0.7830099, 0.3222163, 2.340227, 0.7529412, 0, 1, 1,
0.8017043, 0.2735577, 1.081982, 0.7568628, 0, 1, 1,
0.8017548, -0.2383449, 2.943673, 0.7647059, 0, 1, 1,
0.8043835, 0.3013383, 1.154365, 0.7686275, 0, 1, 1,
0.8111846, 0.05509927, 2.13202, 0.7764706, 0, 1, 1,
0.8165691, 0.3538879, 0.9257658, 0.7803922, 0, 1, 1,
0.8200509, -0.007005869, 0.6579423, 0.7882353, 0, 1, 1,
0.8213813, -0.8670144, 2.991075, 0.7921569, 0, 1, 1,
0.8252659, 0.1399516, 4.811111, 0.8, 0, 1, 1,
0.8303121, 0.8504966, 2.455165, 0.8078431, 0, 1, 1,
0.8375695, 0.8126098, 0.5898374, 0.8117647, 0, 1, 1,
0.8383916, 0.8073608, -0.2224093, 0.8196079, 0, 1, 1,
0.8401687, -1.069014, 3.298229, 0.8235294, 0, 1, 1,
0.8418221, 0.5953671, 1.457466, 0.8313726, 0, 1, 1,
0.8550112, 0.08807247, 2.702669, 0.8352941, 0, 1, 1,
0.8572223, 0.8871329, -0.4145439, 0.8431373, 0, 1, 1,
0.8657374, 0.08533453, 0.9392188, 0.8470588, 0, 1, 1,
0.8677822, -0.006226899, 1.461547, 0.854902, 0, 1, 1,
0.8694821, -0.01458966, 1.58356, 0.8588235, 0, 1, 1,
0.8918908, -0.9668213, 3.460095, 0.8666667, 0, 1, 1,
0.8965251, -2.440754, 2.740081, 0.8705882, 0, 1, 1,
0.9005042, -0.02643738, 0.7503883, 0.8784314, 0, 1, 1,
0.9011422, -0.5893693, 0.4978262, 0.8823529, 0, 1, 1,
0.9031508, -0.2993145, 2.552832, 0.8901961, 0, 1, 1,
0.903209, 0.3834488, 0.666904, 0.8941177, 0, 1, 1,
0.9094363, 1.377802, 0.07817625, 0.9019608, 0, 1, 1,
0.9096286, -0.6164089, 0.9612839, 0.9098039, 0, 1, 1,
0.9104582, 0.7589206, -0.8564525, 0.9137255, 0, 1, 1,
0.9108272, -1.779608, 3.591527, 0.9215686, 0, 1, 1,
0.9154101, -0.6857402, 1.217893, 0.9254902, 0, 1, 1,
0.9166133, 0.1068255, 1.485102, 0.9333333, 0, 1, 1,
0.9223213, -0.1592922, 1.924901, 0.9372549, 0, 1, 1,
0.9239731, -0.1774347, 0.8170235, 0.945098, 0, 1, 1,
0.9239845, 0.4509612, 2.150347, 0.9490196, 0, 1, 1,
0.9323239, 0.03894288, 1.852552, 0.9568627, 0, 1, 1,
0.9339657, -0.2432731, 3.260454, 0.9607843, 0, 1, 1,
0.9414991, 1.315725, 2.328677, 0.9686275, 0, 1, 1,
0.9420368, -0.9266203, 2.475112, 0.972549, 0, 1, 1,
0.9479573, -0.5119356, 1.845764, 0.9803922, 0, 1, 1,
0.9492775, -1.20185, 3.469513, 0.9843137, 0, 1, 1,
0.9578441, -0.1110573, 1.29209, 0.9921569, 0, 1, 1,
0.9665578, -2.289602, 2.441406, 0.9960784, 0, 1, 1,
0.9710312, 1.410899, 0.2220691, 1, 0, 0.9960784, 1,
0.9747437, 0.04140894, 1.21239, 1, 0, 0.9882353, 1,
0.9892541, -1.462997, 2.778418, 1, 0, 0.9843137, 1,
0.9898108, -0.6076064, 2.881518, 1, 0, 0.9764706, 1,
0.9913187, -0.52963, 1.576523, 1, 0, 0.972549, 1,
0.9946916, 1.438715, 0.4677131, 1, 0, 0.9647059, 1,
1.000716, 0.2771861, 3.502049, 1, 0, 0.9607843, 1,
1.001245, 0.7592449, -0.278241, 1, 0, 0.9529412, 1,
1.00329, -1.064433, 3.420677, 1, 0, 0.9490196, 1,
1.003522, -0.7893717, 1.90316, 1, 0, 0.9411765, 1,
1.005948, 0.1978493, 0.3661264, 1, 0, 0.9372549, 1,
1.019303, -0.4901784, 1.925806, 1, 0, 0.9294118, 1,
1.023407, 0.1335817, 0.9729438, 1, 0, 0.9254902, 1,
1.024521, -1.793897, 1.081408, 1, 0, 0.9176471, 1,
1.026947, 0.4061595, 1.405032, 1, 0, 0.9137255, 1,
1.039674, -2.049651, 3.20984, 1, 0, 0.9058824, 1,
1.045591, -0.1375954, 2.933103, 1, 0, 0.9019608, 1,
1.048439, -0.7136382, 3.877307, 1, 0, 0.8941177, 1,
1.052566, -0.1855879, 2.167467, 1, 0, 0.8862745, 1,
1.052758, -0.08999549, 0.9903443, 1, 0, 0.8823529, 1,
1.052877, 0.8594308, 1.399382, 1, 0, 0.8745098, 1,
1.057289, -0.2727641, 0.1329144, 1, 0, 0.8705882, 1,
1.057817, -0.3672479, 2.449737, 1, 0, 0.8627451, 1,
1.059662, -0.9802604, 1.961885, 1, 0, 0.8588235, 1,
1.070767, 0.8731025, -0.5747691, 1, 0, 0.8509804, 1,
1.076214, -0.4350063, 1.728879, 1, 0, 0.8470588, 1,
1.079051, 0.02870711, 1.920997, 1, 0, 0.8392157, 1,
1.08382, 0.5594321, 0.7264742, 1, 0, 0.8352941, 1,
1.084938, 1.030068, 1.276785, 1, 0, 0.827451, 1,
1.116163, 0.05444118, 2.035596, 1, 0, 0.8235294, 1,
1.118186, 0.975077, 0.4162058, 1, 0, 0.8156863, 1,
1.119597, -0.1408778, 0.4725057, 1, 0, 0.8117647, 1,
1.125421, 0.4587246, -0.4756148, 1, 0, 0.8039216, 1,
1.133404, -0.8771501, 3.077992, 1, 0, 0.7960784, 1,
1.136322, -0.2533742, 1.138529, 1, 0, 0.7921569, 1,
1.138038, 0.3976933, 0.1820223, 1, 0, 0.7843137, 1,
1.139497, -0.2122163, 3.277644, 1, 0, 0.7803922, 1,
1.139622, -0.8012201, 1.784227, 1, 0, 0.772549, 1,
1.140638, 0.2761457, 1.998498, 1, 0, 0.7686275, 1,
1.144373, 0.5920052, 1.39517, 1, 0, 0.7607843, 1,
1.15705, 1.659853, -0.1659672, 1, 0, 0.7568628, 1,
1.168243, 0.3417639, 0.4720315, 1, 0, 0.7490196, 1,
1.177528, 0.06026923, 1.18491, 1, 0, 0.7450981, 1,
1.182507, 0.141037, 1.300999, 1, 0, 0.7372549, 1,
1.190281, 1.232058, 1.519823, 1, 0, 0.7333333, 1,
1.190291, 0.1984199, 1.135243, 1, 0, 0.7254902, 1,
1.195735, 0.8459952, 1.381437, 1, 0, 0.7215686, 1,
1.200644, -0.4021453, 1.134005, 1, 0, 0.7137255, 1,
1.207821, 0.5150756, 0.8612008, 1, 0, 0.7098039, 1,
1.234052, 0.2723396, 2.953954, 1, 0, 0.7019608, 1,
1.235422, 1.120267, 1.269408, 1, 0, 0.6941177, 1,
1.237775, -0.3190126, 2.149651, 1, 0, 0.6901961, 1,
1.240817, 0.2174343, 2.457665, 1, 0, 0.682353, 1,
1.242463, 0.8904994, 0.7560931, 1, 0, 0.6784314, 1,
1.242558, 0.8608807, 0.1453202, 1, 0, 0.6705883, 1,
1.247917, 0.2304058, 3.205598, 1, 0, 0.6666667, 1,
1.251652, 2.047117, 1.011049, 1, 0, 0.6588235, 1,
1.259174, 0.3980304, -0.096636, 1, 0, 0.654902, 1,
1.261693, -0.9618338, 2.839702, 1, 0, 0.6470588, 1,
1.265807, 0.2466611, 1.802793, 1, 0, 0.6431373, 1,
1.267363, -0.7908691, 2.633648, 1, 0, 0.6352941, 1,
1.279828, -0.01932113, 2.670562, 1, 0, 0.6313726, 1,
1.295416, -0.4880064, 1.63504, 1, 0, 0.6235294, 1,
1.302338, 1.230938, 0.3256319, 1, 0, 0.6196079, 1,
1.304415, -0.5982585, 2.679207, 1, 0, 0.6117647, 1,
1.315103, 1.566072, 0.2635766, 1, 0, 0.6078432, 1,
1.319971, 0.4463185, 0.2407826, 1, 0, 0.6, 1,
1.329698, -0.1227088, 2.066021, 1, 0, 0.5921569, 1,
1.334559, 2.09494, 0.8375355, 1, 0, 0.5882353, 1,
1.336657, 0.8364347, 1.125069, 1, 0, 0.5803922, 1,
1.337109, -0.02674615, 0.4427008, 1, 0, 0.5764706, 1,
1.350899, 1.185189, 0.09704011, 1, 0, 0.5686275, 1,
1.35301, 0.6358346, 2.285836, 1, 0, 0.5647059, 1,
1.362479, 0.9661373, 1.559005, 1, 0, 0.5568628, 1,
1.362944, 0.6935274, 1.977044, 1, 0, 0.5529412, 1,
1.363772, -1.410666, 0.8555745, 1, 0, 0.5450981, 1,
1.371157, -0.138243, 3.245173, 1, 0, 0.5411765, 1,
1.37294, 0.3954582, 1.9042, 1, 0, 0.5333334, 1,
1.373486, 1.336761, 1.97955, 1, 0, 0.5294118, 1,
1.375685, -0.1484682, 1.31562, 1, 0, 0.5215687, 1,
1.382794, -1.067856, 1.083087, 1, 0, 0.5176471, 1,
1.393821, 0.3267386, 2.854929, 1, 0, 0.509804, 1,
1.412187, -1.054901, 2.988427, 1, 0, 0.5058824, 1,
1.414612, 0.4930693, 1.1291, 1, 0, 0.4980392, 1,
1.41713, 0.2271972, 3.115602, 1, 0, 0.4901961, 1,
1.41848, 0.1178209, 2.875647, 1, 0, 0.4862745, 1,
1.431065, 0.3214628, 1.671518, 1, 0, 0.4784314, 1,
1.441753, 0.2674193, 2.339411, 1, 0, 0.4745098, 1,
1.442353, -0.3653744, 2.115934, 1, 0, 0.4666667, 1,
1.443778, -0.2599918, 1.234889, 1, 0, 0.4627451, 1,
1.448317, 0.4161222, 0.3929563, 1, 0, 0.454902, 1,
1.460943, 0.2356378, 1.76954, 1, 0, 0.4509804, 1,
1.4645, 0.09750228, 0.3965441, 1, 0, 0.4431373, 1,
1.464911, 1.371965, 0.9111958, 1, 0, 0.4392157, 1,
1.467192, -1.471647, 0.5166595, 1, 0, 0.4313726, 1,
1.468557, 0.5461366, 2.061095, 1, 0, 0.427451, 1,
1.469474, -0.8941236, 3.206066, 1, 0, 0.4196078, 1,
1.472591, 0.6229993, 0.03928636, 1, 0, 0.4156863, 1,
1.472732, -1.607251, 2.366298, 1, 0, 0.4078431, 1,
1.476911, -0.2613823, 0.9413962, 1, 0, 0.4039216, 1,
1.478823, -0.6141022, 2.427109, 1, 0, 0.3960784, 1,
1.480539, 0.5933021, 2.004902, 1, 0, 0.3882353, 1,
1.483707, -0.4115014, 2.529472, 1, 0, 0.3843137, 1,
1.487826, 1.368806, 2.159447, 1, 0, 0.3764706, 1,
1.496175, -1.350181, 3.712979, 1, 0, 0.372549, 1,
1.520085, 0.05510449, 1.857258, 1, 0, 0.3647059, 1,
1.526376, 2.145554, 0.05803618, 1, 0, 0.3607843, 1,
1.532478, 0.5615607, 1.142127, 1, 0, 0.3529412, 1,
1.541954, -1.638406, 4.489498, 1, 0, 0.3490196, 1,
1.577995, 0.8665365, 1.094399, 1, 0, 0.3411765, 1,
1.58367, 1.25543, 2.200767, 1, 0, 0.3372549, 1,
1.587171, -0.4627453, 0.6784949, 1, 0, 0.3294118, 1,
1.590595, 0.9204968, 2.784832, 1, 0, 0.3254902, 1,
1.595857, -0.9691864, 1.406746, 1, 0, 0.3176471, 1,
1.611345, 0.7277559, 0.3972197, 1, 0, 0.3137255, 1,
1.613292, -0.6855683, 2.561047, 1, 0, 0.3058824, 1,
1.613307, -1.021792, 3.480691, 1, 0, 0.2980392, 1,
1.61989, -1.558264, 2.425409, 1, 0, 0.2941177, 1,
1.622072, 1.016124, 1.215529, 1, 0, 0.2862745, 1,
1.631146, 0.2683481, 1.055128, 1, 0, 0.282353, 1,
1.641579, 0.05631398, 2.15547, 1, 0, 0.2745098, 1,
1.666149, -0.2184013, 1.89664, 1, 0, 0.2705882, 1,
1.69064, 0.4805178, 1.37742, 1, 0, 0.2627451, 1,
1.714055, -0.2266129, 1.745833, 1, 0, 0.2588235, 1,
1.716192, 2.582117, -0.231372, 1, 0, 0.2509804, 1,
1.736601, -0.2628399, 2.094782, 1, 0, 0.2470588, 1,
1.760486, 0.5722093, 0.348866, 1, 0, 0.2392157, 1,
1.764735, 1.141565, 2.281682, 1, 0, 0.2352941, 1,
1.766914, -1.523496, 2.890279, 1, 0, 0.227451, 1,
1.777913, -1.696449, 2.244868, 1, 0, 0.2235294, 1,
1.787576, -0.1486605, 1.434716, 1, 0, 0.2156863, 1,
1.788025, 0.8916417, 0.5419922, 1, 0, 0.2117647, 1,
1.812848, 0.6141886, 1.720357, 1, 0, 0.2039216, 1,
1.819462, 0.3068447, 1.72854, 1, 0, 0.1960784, 1,
1.842244, 0.01302038, 0.155982, 1, 0, 0.1921569, 1,
1.860782, 1.173091, 0.9757557, 1, 0, 0.1843137, 1,
1.862599, 3.411107, -1.342028, 1, 0, 0.1803922, 1,
1.875874, 0.1577348, 1.024843, 1, 0, 0.172549, 1,
1.879821, 0.02842962, 1.867903, 1, 0, 0.1686275, 1,
1.894617, 0.3924125, 0.8887275, 1, 0, 0.1607843, 1,
1.94475, -0.3002014, 1.034266, 1, 0, 0.1568628, 1,
1.947117, 0.8406971, 3.021904, 1, 0, 0.1490196, 1,
1.970067, -1.867394, 2.223327, 1, 0, 0.145098, 1,
1.984908, -0.7279531, 3.189465, 1, 0, 0.1372549, 1,
1.993655, 1.035839, 1.047593, 1, 0, 0.1333333, 1,
2.006441, 1.666679, 1.001284, 1, 0, 0.1254902, 1,
2.014518, 0.1957732, 2.71207, 1, 0, 0.1215686, 1,
2.035645, 1.152146, 0.6305529, 1, 0, 0.1137255, 1,
2.077353, 0.5745785, 1.093938, 1, 0, 0.1098039, 1,
2.07987, 0.98807, 0.03435706, 1, 0, 0.1019608, 1,
2.104776, 0.3083704, 2.770904, 1, 0, 0.09411765, 1,
2.113064, -1.419969, 1.548558, 1, 0, 0.09019608, 1,
2.114412, -6.193856e-05, 0.1816775, 1, 0, 0.08235294, 1,
2.118981, 0.3348032, 2.326789, 1, 0, 0.07843138, 1,
2.124293, -0.0223324, 0.6847283, 1, 0, 0.07058824, 1,
2.150989, 0.3541834, 3.03473, 1, 0, 0.06666667, 1,
2.168454, -0.08200514, 3.617215, 1, 0, 0.05882353, 1,
2.282559, -0.3309474, 1.661962, 1, 0, 0.05490196, 1,
2.36429, 1.211361, 0.6788132, 1, 0, 0.04705882, 1,
2.49392, 2.584852, 0.6688309, 1, 0, 0.04313726, 1,
2.543836, -0.5492805, 0.7896509, 1, 0, 0.03529412, 1,
2.83057, 0.9947948, 2.245296, 1, 0, 0.03137255, 1,
2.950872, 0.02238876, 3.540648, 1, 0, 0.02352941, 1,
3.09246, 0.2584273, 1.720456, 1, 0, 0.01960784, 1,
3.26084, -1.97795, 4.322967, 1, 0, 0.01176471, 1,
3.785082, 0.49868, -0.007273064, 1, 0, 0.007843138, 1
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
0.3709226, -3.773413, -7.025513, 0, -0.5, 0.5, 0.5,
0.3709226, -3.773413, -7.025513, 1, -0.5, 0.5, 0.5,
0.3709226, -3.773413, -7.025513, 1, 1.5, 0.5, 0.5,
0.3709226, -3.773413, -7.025513, 0, 1.5, 0.5, 0.5
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
-4.200637, 0.4635566, -7.025513, 0, -0.5, 0.5, 0.5,
-4.200637, 0.4635566, -7.025513, 1, -0.5, 0.5, 0.5,
-4.200637, 0.4635566, -7.025513, 1, 1.5, 0.5, 0.5,
-4.200637, 0.4635566, -7.025513, 0, 1.5, 0.5, 0.5
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
-4.200637, -3.773413, -0.1927772, 0, -0.5, 0.5, 0.5,
-4.200637, -3.773413, -0.1927772, 1, -0.5, 0.5, 0.5,
-4.200637, -3.773413, -0.1927772, 1, 1.5, 0.5, 0.5,
-4.200637, -3.773413, -0.1927772, 0, 1.5, 0.5, 0.5
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
-3, -2.795651, -5.448728,
3, -2.795651, -5.448728,
-3, -2.795651, -5.448728,
-3, -2.958611, -5.711525,
-2, -2.795651, -5.448728,
-2, -2.958611, -5.711525,
-1, -2.795651, -5.448728,
-1, -2.958611, -5.711525,
0, -2.795651, -5.448728,
0, -2.958611, -5.711525,
1, -2.795651, -5.448728,
1, -2.958611, -5.711525,
2, -2.795651, -5.448728,
2, -2.958611, -5.711525,
3, -2.795651, -5.448728,
3, -2.958611, -5.711525
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
-3, -3.284532, -6.237121, 0, -0.5, 0.5, 0.5,
-3, -3.284532, -6.237121, 1, -0.5, 0.5, 0.5,
-3, -3.284532, -6.237121, 1, 1.5, 0.5, 0.5,
-3, -3.284532, -6.237121, 0, 1.5, 0.5, 0.5,
-2, -3.284532, -6.237121, 0, -0.5, 0.5, 0.5,
-2, -3.284532, -6.237121, 1, -0.5, 0.5, 0.5,
-2, -3.284532, -6.237121, 1, 1.5, 0.5, 0.5,
-2, -3.284532, -6.237121, 0, 1.5, 0.5, 0.5,
-1, -3.284532, -6.237121, 0, -0.5, 0.5, 0.5,
-1, -3.284532, -6.237121, 1, -0.5, 0.5, 0.5,
-1, -3.284532, -6.237121, 1, 1.5, 0.5, 0.5,
-1, -3.284532, -6.237121, 0, 1.5, 0.5, 0.5,
0, -3.284532, -6.237121, 0, -0.5, 0.5, 0.5,
0, -3.284532, -6.237121, 1, -0.5, 0.5, 0.5,
0, -3.284532, -6.237121, 1, 1.5, 0.5, 0.5,
0, -3.284532, -6.237121, 0, 1.5, 0.5, 0.5,
1, -3.284532, -6.237121, 0, -0.5, 0.5, 0.5,
1, -3.284532, -6.237121, 1, -0.5, 0.5, 0.5,
1, -3.284532, -6.237121, 1, 1.5, 0.5, 0.5,
1, -3.284532, -6.237121, 0, 1.5, 0.5, 0.5,
2, -3.284532, -6.237121, 0, -0.5, 0.5, 0.5,
2, -3.284532, -6.237121, 1, -0.5, 0.5, 0.5,
2, -3.284532, -6.237121, 1, 1.5, 0.5, 0.5,
2, -3.284532, -6.237121, 0, 1.5, 0.5, 0.5,
3, -3.284532, -6.237121, 0, -0.5, 0.5, 0.5,
3, -3.284532, -6.237121, 1, -0.5, 0.5, 0.5,
3, -3.284532, -6.237121, 1, 1.5, 0.5, 0.5,
3, -3.284532, -6.237121, 0, 1.5, 0.5, 0.5
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
-3.145662, -2, -5.448728,
-3.145662, 3, -5.448728,
-3.145662, -2, -5.448728,
-3.321491, -2, -5.711525,
-3.145662, -1, -5.448728,
-3.321491, -1, -5.711525,
-3.145662, 0, -5.448728,
-3.321491, 0, -5.711525,
-3.145662, 1, -5.448728,
-3.321491, 1, -5.711525,
-3.145662, 2, -5.448728,
-3.321491, 2, -5.711525,
-3.145662, 3, -5.448728,
-3.321491, 3, -5.711525
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
-3.67315, -2, -6.237121, 0, -0.5, 0.5, 0.5,
-3.67315, -2, -6.237121, 1, -0.5, 0.5, 0.5,
-3.67315, -2, -6.237121, 1, 1.5, 0.5, 0.5,
-3.67315, -2, -6.237121, 0, 1.5, 0.5, 0.5,
-3.67315, -1, -6.237121, 0, -0.5, 0.5, 0.5,
-3.67315, -1, -6.237121, 1, -0.5, 0.5, 0.5,
-3.67315, -1, -6.237121, 1, 1.5, 0.5, 0.5,
-3.67315, -1, -6.237121, 0, 1.5, 0.5, 0.5,
-3.67315, 0, -6.237121, 0, -0.5, 0.5, 0.5,
-3.67315, 0, -6.237121, 1, -0.5, 0.5, 0.5,
-3.67315, 0, -6.237121, 1, 1.5, 0.5, 0.5,
-3.67315, 0, -6.237121, 0, 1.5, 0.5, 0.5,
-3.67315, 1, -6.237121, 0, -0.5, 0.5, 0.5,
-3.67315, 1, -6.237121, 1, -0.5, 0.5, 0.5,
-3.67315, 1, -6.237121, 1, 1.5, 0.5, 0.5,
-3.67315, 1, -6.237121, 0, 1.5, 0.5, 0.5,
-3.67315, 2, -6.237121, 0, -0.5, 0.5, 0.5,
-3.67315, 2, -6.237121, 1, -0.5, 0.5, 0.5,
-3.67315, 2, -6.237121, 1, 1.5, 0.5, 0.5,
-3.67315, 2, -6.237121, 0, 1.5, 0.5, 0.5,
-3.67315, 3, -6.237121, 0, -0.5, 0.5, 0.5,
-3.67315, 3, -6.237121, 1, -0.5, 0.5, 0.5,
-3.67315, 3, -6.237121, 1, 1.5, 0.5, 0.5,
-3.67315, 3, -6.237121, 0, 1.5, 0.5, 0.5
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
-3.145662, -2.795651, -4,
-3.145662, -2.795651, 4,
-3.145662, -2.795651, -4,
-3.321491, -2.958611, -4,
-3.145662, -2.795651, -2,
-3.321491, -2.958611, -2,
-3.145662, -2.795651, 0,
-3.321491, -2.958611, 0,
-3.145662, -2.795651, 2,
-3.321491, -2.958611, 2,
-3.145662, -2.795651, 4,
-3.321491, -2.958611, 4
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
-3.67315, -3.284532, -4, 0, -0.5, 0.5, 0.5,
-3.67315, -3.284532, -4, 1, -0.5, 0.5, 0.5,
-3.67315, -3.284532, -4, 1, 1.5, 0.5, 0.5,
-3.67315, -3.284532, -4, 0, 1.5, 0.5, 0.5,
-3.67315, -3.284532, -2, 0, -0.5, 0.5, 0.5,
-3.67315, -3.284532, -2, 1, -0.5, 0.5, 0.5,
-3.67315, -3.284532, -2, 1, 1.5, 0.5, 0.5,
-3.67315, -3.284532, -2, 0, 1.5, 0.5, 0.5,
-3.67315, -3.284532, 0, 0, -0.5, 0.5, 0.5,
-3.67315, -3.284532, 0, 1, -0.5, 0.5, 0.5,
-3.67315, -3.284532, 0, 1, 1.5, 0.5, 0.5,
-3.67315, -3.284532, 0, 0, 1.5, 0.5, 0.5,
-3.67315, -3.284532, 2, 0, -0.5, 0.5, 0.5,
-3.67315, -3.284532, 2, 1, -0.5, 0.5, 0.5,
-3.67315, -3.284532, 2, 1, 1.5, 0.5, 0.5,
-3.67315, -3.284532, 2, 0, 1.5, 0.5, 0.5,
-3.67315, -3.284532, 4, 0, -0.5, 0.5, 0.5,
-3.67315, -3.284532, 4, 1, -0.5, 0.5, 0.5,
-3.67315, -3.284532, 4, 1, 1.5, 0.5, 0.5,
-3.67315, -3.284532, 4, 0, 1.5, 0.5, 0.5
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
-3.145662, -2.795651, -5.448728,
-3.145662, 3.722764, -5.448728,
-3.145662, -2.795651, 5.063173,
-3.145662, 3.722764, 5.063173,
-3.145662, -2.795651, -5.448728,
-3.145662, -2.795651, 5.063173,
-3.145662, 3.722764, -5.448728,
-3.145662, 3.722764, 5.063173,
-3.145662, -2.795651, -5.448728,
3.887507, -2.795651, -5.448728,
-3.145662, -2.795651, 5.063173,
3.887507, -2.795651, 5.063173,
-3.145662, 3.722764, -5.448728,
3.887507, 3.722764, -5.448728,
-3.145662, 3.722764, 5.063173,
3.887507, 3.722764, 5.063173,
3.887507, -2.795651, -5.448728,
3.887507, 3.722764, -5.448728,
3.887507, -2.795651, 5.063173,
3.887507, 3.722764, 5.063173,
3.887507, -2.795651, -5.448728,
3.887507, -2.795651, 5.063173,
3.887507, 3.722764, -5.448728,
3.887507, 3.722764, 5.063173
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
var radius = 7.597838;
var distance = 33.80364;
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
mvMatrix.translate( -0.3709226, -0.4635566, 0.1927772 );
mvMatrix.scale( 1.168027, 1.260265, 0.7814886 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80364);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
dimefuron<-read.table("dimefuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimefuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimefuron' not found
```

```r
y<-dimefuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimefuron' not found
```

```r
z<-dimefuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimefuron' not found
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
-3.043237, -0.647105, -1.675488, 0, 0, 1, 1, 1,
-2.89214, -1.543984, -2.295813, 1, 0, 0, 1, 1,
-2.606647, 0.8107451, -2.196666, 1, 0, 0, 1, 1,
-2.576044, 0.8358268, -0.1746664, 1, 0, 0, 1, 1,
-2.548448, -0.9176476, -1.97324, 1, 0, 0, 1, 1,
-2.473644, 0.2474479, -0.8610889, 1, 0, 0, 1, 1,
-2.455553, -0.5603073, -2.158417, 0, 0, 0, 1, 1,
-2.453336, 2.434615, -0.8291876, 0, 0, 0, 1, 1,
-2.411887, -0.02450846, -3.573791, 0, 0, 0, 1, 1,
-2.40565, 1.275838, -1.043523, 0, 0, 0, 1, 1,
-2.405146, -0.5419807, -0.4274166, 0, 0, 0, 1, 1,
-2.392501, 0.2231238, -2.567678, 0, 0, 0, 1, 1,
-2.306635, -0.5652802, -1.68448, 0, 0, 0, 1, 1,
-2.263798, 2.000865, 1.001214, 1, 1, 1, 1, 1,
-2.253603, 0.006719975, 0.4031685, 1, 1, 1, 1, 1,
-2.251498, -0.7945918, -0.6825113, 1, 1, 1, 1, 1,
-2.238614, 1.290264, -2.509736, 1, 1, 1, 1, 1,
-2.237942, -0.2976515, -0.9246044, 1, 1, 1, 1, 1,
-2.201386, -0.3667762, -1.616883, 1, 1, 1, 1, 1,
-2.144054, -0.6415657, -1.666403, 1, 1, 1, 1, 1,
-2.1416, 0.1969994, -3.277448, 1, 1, 1, 1, 1,
-2.092316, 0.8576519, -2.396623, 1, 1, 1, 1, 1,
-2.079619, 0.5474802, -0.9275128, 1, 1, 1, 1, 1,
-2.040109, -0.5364528, -3.410678, 1, 1, 1, 1, 1,
-1.993113, -0.2455984, -4.184206, 1, 1, 1, 1, 1,
-1.9718, 1.830426, -0.933588, 1, 1, 1, 1, 1,
-1.956657, 1.36243, -0.4537205, 1, 1, 1, 1, 1,
-1.938078, -0.6722267, -0.5879045, 1, 1, 1, 1, 1,
-1.922039, 0.9850442, -0.8386927, 0, 0, 1, 1, 1,
-1.91325, -0.2344922, -2.21863, 1, 0, 0, 1, 1,
-1.910966, -0.5538918, -2.902135, 1, 0, 0, 1, 1,
-1.903561, -0.2560906, -1.588579, 1, 0, 0, 1, 1,
-1.876371, -1.182596, -3.952406, 1, 0, 0, 1, 1,
-1.859699, 0.8098884, -0.6141269, 1, 0, 0, 1, 1,
-1.84854, 1.165913, -1.186573, 0, 0, 0, 1, 1,
-1.8322, -1.600054, -2.802599, 0, 0, 0, 1, 1,
-1.823008, -1.448197, -0.823932, 0, 0, 0, 1, 1,
-1.819576, 0.5957355, -1.426243, 0, 0, 0, 1, 1,
-1.808484, -1.093724, -0.6482465, 0, 0, 0, 1, 1,
-1.793451, 0.8260402, -0.9040188, 0, 0, 0, 1, 1,
-1.769664, -0.7011538, -2.020021, 0, 0, 0, 1, 1,
-1.764428, 1.971739, -1.735612, 1, 1, 1, 1, 1,
-1.750362, -0.203567, -0.7096551, 1, 1, 1, 1, 1,
-1.742238, 2.105136, -0.1695915, 1, 1, 1, 1, 1,
-1.740188, -0.9412336, -1.34551, 1, 1, 1, 1, 1,
-1.739146, 1.401278, -1.949882, 1, 1, 1, 1, 1,
-1.735946, -0.5049549, -2.996834, 1, 1, 1, 1, 1,
-1.712506, -1.138735, -2.630619, 1, 1, 1, 1, 1,
-1.704102, 0.2651674, -1.548655, 1, 1, 1, 1, 1,
-1.692702, 0.9236076, -1.48429, 1, 1, 1, 1, 1,
-1.685969, -0.6577163, -0.6976121, 1, 1, 1, 1, 1,
-1.665683, 0.343256, -1.974174, 1, 1, 1, 1, 1,
-1.652038, -1.689471, -3.166768, 1, 1, 1, 1, 1,
-1.638541, -0.7758043, -2.872389, 1, 1, 1, 1, 1,
-1.625613, 0.6752391, -0.8179832, 1, 1, 1, 1, 1,
-1.602427, -0.5739037, -1.193277, 1, 1, 1, 1, 1,
-1.586375, 0.95133, -0.5029735, 0, 0, 1, 1, 1,
-1.564477, 0.07021749, -1.525092, 1, 0, 0, 1, 1,
-1.554784, -0.7274919, -1.788532, 1, 0, 0, 1, 1,
-1.552526, -0.7264071, -2.762247, 1, 0, 0, 1, 1,
-1.550255, 0.6366274, -1.134668, 1, 0, 0, 1, 1,
-1.534455, -0.1713099, -0.6955302, 1, 0, 0, 1, 1,
-1.532711, 0.5205325, -0.7504358, 0, 0, 0, 1, 1,
-1.521239, 0.6587293, 0.1385894, 0, 0, 0, 1, 1,
-1.505648, 1.35149, -1.415151, 0, 0, 0, 1, 1,
-1.497007, 0.4948409, -1.168564, 0, 0, 0, 1, 1,
-1.487373, -0.01626905, 0.8408002, 0, 0, 0, 1, 1,
-1.486485, -0.02318011, -2.274208, 0, 0, 0, 1, 1,
-1.457901, -0.8040172, -2.065164, 0, 0, 0, 1, 1,
-1.452211, 1.631207, -0.8258563, 1, 1, 1, 1, 1,
-1.438389, -0.5183989, -0.4946381, 1, 1, 1, 1, 1,
-1.4363, 0.3940672, -2.190111, 1, 1, 1, 1, 1,
-1.432543, -2.091626, -2.218694, 1, 1, 1, 1, 1,
-1.423237, -0.702453, -2.663092, 1, 1, 1, 1, 1,
-1.418735, -0.8084517, -1.902349, 1, 1, 1, 1, 1,
-1.405356, -1.24895, -0.1137672, 1, 1, 1, 1, 1,
-1.40077, -0.04951539, -2.731926, 1, 1, 1, 1, 1,
-1.398234, 0.6052079, -0.425554, 1, 1, 1, 1, 1,
-1.391377, -1.099309, -2.204517, 1, 1, 1, 1, 1,
-1.378091, -0.670417, -2.04664, 1, 1, 1, 1, 1,
-1.376962, -0.3831876, -2.060775, 1, 1, 1, 1, 1,
-1.367465, -0.3476748, -1.366398, 1, 1, 1, 1, 1,
-1.362096, -0.7567454, -1.018341, 1, 1, 1, 1, 1,
-1.357555, -0.4374958, -1.258562, 1, 1, 1, 1, 1,
-1.355789, 0.3170474, -2.090327, 0, 0, 1, 1, 1,
-1.355341, -1.479211, -3.868714, 1, 0, 0, 1, 1,
-1.354514, -1.375259, -1.981165, 1, 0, 0, 1, 1,
-1.346142, -1.224443, 0.2940243, 1, 0, 0, 1, 1,
-1.346075, -0.6921851, -1.761346, 1, 0, 0, 1, 1,
-1.344912, 0.703371, -1.567031, 1, 0, 0, 1, 1,
-1.343271, 0.4959643, -1.059331, 0, 0, 0, 1, 1,
-1.329183, -0.1736352, -2.345051, 0, 0, 0, 1, 1,
-1.31798, 2.118398, -1.674207, 0, 0, 0, 1, 1,
-1.317919, 0.212142, -1.359918, 0, 0, 0, 1, 1,
-1.315721, -0.03568315, -1.416655, 0, 0, 0, 1, 1,
-1.305526, -0.01256814, -2.214872, 0, 0, 0, 1, 1,
-1.299827, -1.193937, -3.535343, 0, 0, 0, 1, 1,
-1.294201, -0.883416, -1.955674, 1, 1, 1, 1, 1,
-1.28911, -0.01024573, -0.00969342, 1, 1, 1, 1, 1,
-1.285003, -0.1408048, -0.9424734, 1, 1, 1, 1, 1,
-1.282408, 0.4567637, -0.8035449, 1, 1, 1, 1, 1,
-1.281455, -0.9119864, -2.116267, 1, 1, 1, 1, 1,
-1.279586, -0.03301119, -1.370265, 1, 1, 1, 1, 1,
-1.264459, 1.42428, -0.9987525, 1, 1, 1, 1, 1,
-1.257052, 0.3297144, -0.006822283, 1, 1, 1, 1, 1,
-1.249787, 0.5932735, -0.7106463, 1, 1, 1, 1, 1,
-1.246577, -1.010212, -3.044739, 1, 1, 1, 1, 1,
-1.245912, 0.3856764, -1.611737, 1, 1, 1, 1, 1,
-1.234939, -1.239845, -2.361851, 1, 1, 1, 1, 1,
-1.223463, 2.805707, -2.130429, 1, 1, 1, 1, 1,
-1.221763, 1.403274, -0.6508662, 1, 1, 1, 1, 1,
-1.219525, 0.04664123, -1.998136, 1, 1, 1, 1, 1,
-1.217924, -0.7494299, -1.89487, 0, 0, 1, 1, 1,
-1.21471, 0.6680283, 0.4139526, 1, 0, 0, 1, 1,
-1.211385, -0.6145835, -2.904366, 1, 0, 0, 1, 1,
-1.19977, 1.228569, -1.307852, 1, 0, 0, 1, 1,
-1.198957, -1.180291, -3.469133, 1, 0, 0, 1, 1,
-1.188037, 0.08180001, -0.2725572, 1, 0, 0, 1, 1,
-1.18268, 1.019616, 0.02014394, 0, 0, 0, 1, 1,
-1.172983, 1.546883, -0.8444625, 0, 0, 0, 1, 1,
-1.166484, 0.549014, 0.1151342, 0, 0, 0, 1, 1,
-1.166185, -0.1375031, -2.563686, 0, 0, 0, 1, 1,
-1.163632, 0.2423772, -1.697093, 0, 0, 0, 1, 1,
-1.151851, -0.5259491, -1.51883, 0, 0, 0, 1, 1,
-1.147935, -0.03993592, -3.265486, 0, 0, 0, 1, 1,
-1.147192, 0.7466595, -2.280663, 1, 1, 1, 1, 1,
-1.145647, 0.733876, -0.4475777, 1, 1, 1, 1, 1,
-1.144977, 0.3285533, -0.839228, 1, 1, 1, 1, 1,
-1.142943, -0.5493065, -2.19205, 1, 1, 1, 1, 1,
-1.138992, -0.3413185, -2.423837, 1, 1, 1, 1, 1,
-1.135264, -2.040199, -3.566593, 1, 1, 1, 1, 1,
-1.130073, 0.7123982, -0.5039665, 1, 1, 1, 1, 1,
-1.129787, -0.9973934, -0.7913822, 1, 1, 1, 1, 1,
-1.124955, -0.9315767, -1.623345, 1, 1, 1, 1, 1,
-1.124042, 0.2023256, -2.044129, 1, 1, 1, 1, 1,
-1.117214, -0.5649102, -1.604597, 1, 1, 1, 1, 1,
-1.116117, 1.039362, -2.838111, 1, 1, 1, 1, 1,
-1.116104, -0.07164285, -2.920449, 1, 1, 1, 1, 1,
-1.115218, 0.717943, -0.9021, 1, 1, 1, 1, 1,
-1.109989, 0.04647911, -1.613961, 1, 1, 1, 1, 1,
-1.107056, -0.4427634, -1.423682, 0, 0, 1, 1, 1,
-1.106841, -0.2923491, -2.358596, 1, 0, 0, 1, 1,
-1.099377, -1.236962, -3.257831, 1, 0, 0, 1, 1,
-1.09764, -0.2108037, -1.017567, 1, 0, 0, 1, 1,
-1.085554, 0.7339897, -2.373442, 1, 0, 0, 1, 1,
-1.075681, 2.149234, 0.1950992, 1, 0, 0, 1, 1,
-1.075637, 0.3621213, -0.4286405, 0, 0, 0, 1, 1,
-1.073449, 0.02082947, -1.278398, 0, 0, 0, 1, 1,
-1.071735, -0.7930572, -3.61659, 0, 0, 0, 1, 1,
-1.065676, -2.667122, -3.347094, 0, 0, 0, 1, 1,
-1.06518, 0.3101112, -0.614611, 0, 0, 0, 1, 1,
-1.063028, 1.210885, -1.635013, 0, 0, 0, 1, 1,
-1.057955, 0.7443666, -1.68639, 0, 0, 0, 1, 1,
-1.050151, 0.7052425, -1.432775, 1, 1, 1, 1, 1,
-1.044434, 0.7428246, -0.6998163, 1, 1, 1, 1, 1,
-1.043588, 0.5111172, -0.6398139, 1, 1, 1, 1, 1,
-1.042808, -0.7466687, -1.345652, 1, 1, 1, 1, 1,
-1.04271, 0.4224835, -1.249035, 1, 1, 1, 1, 1,
-1.03793, 0.5380526, -0.3125442, 1, 1, 1, 1, 1,
-1.03736, -0.7157156, -4.198217, 1, 1, 1, 1, 1,
-1.035361, 0.4711728, -0.9331058, 1, 1, 1, 1, 1,
-1.032225, 0.9825553, -0.1976434, 1, 1, 1, 1, 1,
-1.02957, 0.525537, -1.597184, 1, 1, 1, 1, 1,
-1.0191, 1.37413, -0.4461657, 1, 1, 1, 1, 1,
-1.005693, -1.202287, -1.827806, 1, 1, 1, 1, 1,
-1.001825, 1.379435, -0.6356825, 1, 1, 1, 1, 1,
-1.00153, -0.6590343, -2.590823, 1, 1, 1, 1, 1,
-0.9960783, -1.062024, -2.046182, 1, 1, 1, 1, 1,
-0.9922752, 0.5753478, -1.84308, 0, 0, 1, 1, 1,
-0.9884462, 1.732865, -0.547591, 1, 0, 0, 1, 1,
-0.9867846, -1.089721, -4.432325, 1, 0, 0, 1, 1,
-0.9862483, 0.3865079, -1.251765, 1, 0, 0, 1, 1,
-0.9816481, -0.4209381, -2.145287, 1, 0, 0, 1, 1,
-0.9811164, 0.9108141, -2.093149, 1, 0, 0, 1, 1,
-0.9745303, 0.9429285, -1.066862, 0, 0, 0, 1, 1,
-0.9699126, 0.01710895, -0.7223336, 0, 0, 0, 1, 1,
-0.9694718, -1.426227, -3.406183, 0, 0, 0, 1, 1,
-0.9689544, -0.4284317, -3.495821, 0, 0, 0, 1, 1,
-0.9679176, 0.06201142, -1.842654, 0, 0, 0, 1, 1,
-0.9673768, -1.739788, -3.617941, 0, 0, 0, 1, 1,
-0.9671342, 0.9284729, 0.08421285, 0, 0, 0, 1, 1,
-0.9670227, -0.1609583, -2.126246, 1, 1, 1, 1, 1,
-0.9645365, 1.509067, -2.317526, 1, 1, 1, 1, 1,
-0.9637247, 0.7578148, 0.5430057, 1, 1, 1, 1, 1,
-0.9636258, 0.2294772, -1.717418, 1, 1, 1, 1, 1,
-0.962944, -0.2368171, -1.633998, 1, 1, 1, 1, 1,
-0.9626274, -1.815912, -3.501916, 1, 1, 1, 1, 1,
-0.9603428, -0.7873839, -1.691248, 1, 1, 1, 1, 1,
-0.9428774, -0.1046018, -0.5731081, 1, 1, 1, 1, 1,
-0.9427087, 0.2924285, -1.01574, 1, 1, 1, 1, 1,
-0.9370838, -0.1568591, -1.267406, 1, 1, 1, 1, 1,
-0.9363896, 0.06346389, -1.620063, 1, 1, 1, 1, 1,
-0.9355159, -0.4478923, -1.625667, 1, 1, 1, 1, 1,
-0.9353302, 0.3539782, -2.766704, 1, 1, 1, 1, 1,
-0.9231359, 0.5017616, -0.3373071, 1, 1, 1, 1, 1,
-0.91774, 0.5817083, -1.235572, 1, 1, 1, 1, 1,
-0.917357, -2.189839, -3.096967, 0, 0, 1, 1, 1,
-0.906152, -0.4849539, -1.184023, 1, 0, 0, 1, 1,
-0.8973834, 0.7087883, 0.3803575, 1, 0, 0, 1, 1,
-0.8971712, 0.4829252, 1.47782, 1, 0, 0, 1, 1,
-0.889495, -1.140545, -1.481869, 1, 0, 0, 1, 1,
-0.8889881, -0.6851949, -3.699312, 1, 0, 0, 1, 1,
-0.8872303, -0.422668, -3.741424, 0, 0, 0, 1, 1,
-0.8782166, 0.5271495, -1.213298, 0, 0, 0, 1, 1,
-0.8761126, -0.3088081, -2.993187, 0, 0, 0, 1, 1,
-0.872355, -0.3681285, -3.764721, 0, 0, 0, 1, 1,
-0.8708076, 1.802815, -0.6115937, 0, 0, 0, 1, 1,
-0.8646174, -0.4664702, -2.107204, 0, 0, 0, 1, 1,
-0.8619102, 2.084973, -0.1965481, 0, 0, 0, 1, 1,
-0.8600984, -0.06008147, -2.379745, 1, 1, 1, 1, 1,
-0.8600199, 0.2185829, -0.744787, 1, 1, 1, 1, 1,
-0.8586627, 0.7585922, -1.416953, 1, 1, 1, 1, 1,
-0.8555997, -0.1171761, 0.05193494, 1, 1, 1, 1, 1,
-0.855171, 1.130848, -0.6455856, 1, 1, 1, 1, 1,
-0.8514657, -1.088349, -2.082061, 1, 1, 1, 1, 1,
-0.8513446, -0.01630033, -0.5520841, 1, 1, 1, 1, 1,
-0.844527, 0.2202028, -3.295014, 1, 1, 1, 1, 1,
-0.8416794, -0.2530748, -1.727212, 1, 1, 1, 1, 1,
-0.8290522, 0.6426117, -0.903193, 1, 1, 1, 1, 1,
-0.8264906, 1.01729, 1.155663, 1, 1, 1, 1, 1,
-0.8243279, -0.6264747, -2.647426, 1, 1, 1, 1, 1,
-0.8237935, 1.229901, -0.8488742, 1, 1, 1, 1, 1,
-0.8162314, 0.6924109, -1.423078, 1, 1, 1, 1, 1,
-0.8143303, -2.149512, -2.268632, 1, 1, 1, 1, 1,
-0.8103809, 0.9317371, -1.407029, 0, 0, 1, 1, 1,
-0.8045951, -0.09477521, -3.39414, 1, 0, 0, 1, 1,
-0.7936932, -0.0826385, -2.569789, 1, 0, 0, 1, 1,
-0.7935794, 0.8126432, -1.18109, 1, 0, 0, 1, 1,
-0.7852329, 0.2583923, -1.27172, 1, 0, 0, 1, 1,
-0.7839815, 0.561308, -0.3935434, 1, 0, 0, 1, 1,
-0.7769836, -1.791943, -4.830626, 0, 0, 0, 1, 1,
-0.7753869, -0.9154881, -2.701101, 0, 0, 0, 1, 1,
-0.7735752, -0.3122838, -1.586795, 0, 0, 0, 1, 1,
-0.7727479, -0.2722344, -1.810749, 0, 0, 0, 1, 1,
-0.7709254, 0.4809509, -2.135997, 0, 0, 0, 1, 1,
-0.7703614, -1.804303, -2.434572, 0, 0, 0, 1, 1,
-0.768649, -0.8194465, -1.969825, 0, 0, 0, 1, 1,
-0.768633, -1.345322, -1.100927, 1, 1, 1, 1, 1,
-0.765213, 1.047876, -2.799155, 1, 1, 1, 1, 1,
-0.7604438, 0.287395, -1.640942, 1, 1, 1, 1, 1,
-0.7599849, 0.7289094, -0.7816304, 1, 1, 1, 1, 1,
-0.7594614, 1.053563, -0.9595925, 1, 1, 1, 1, 1,
-0.758301, 1.966729, 0.9374173, 1, 1, 1, 1, 1,
-0.7535117, -1.724674, -3.815986, 1, 1, 1, 1, 1,
-0.7534521, -0.1981857, -2.071942, 1, 1, 1, 1, 1,
-0.7502872, 0.9950166, -0.5572807, 1, 1, 1, 1, 1,
-0.749843, 0.2037169, -3.72598, 1, 1, 1, 1, 1,
-0.7470836, 1.986469, 0.05021487, 1, 1, 1, 1, 1,
-0.7448817, 0.7122843, 0.201223, 1, 1, 1, 1, 1,
-0.7438234, -0.7567571, -1.297249, 1, 1, 1, 1, 1,
-0.7213776, -0.7632232, -1.757906, 1, 1, 1, 1, 1,
-0.7161903, -1.520594, -1.531994, 1, 1, 1, 1, 1,
-0.7144894, 1.231123, -0.3977574, 0, 0, 1, 1, 1,
-0.7128814, -0.8151336, -4.357887, 1, 0, 0, 1, 1,
-0.7042814, 0.9487482, -1.080107, 1, 0, 0, 1, 1,
-0.6859125, 0.3840021, -1.486387, 1, 0, 0, 1, 1,
-0.6857776, 1.161491, 0.1724649, 1, 0, 0, 1, 1,
-0.6829091, 0.2705527, -0.8319204, 1, 0, 0, 1, 1,
-0.6827093, 0.9761264, -0.5609857, 0, 0, 0, 1, 1,
-0.6776477, 1.318753, 1.225278, 0, 0, 0, 1, 1,
-0.6773432, -0.6803746, -3.048768, 0, 0, 0, 1, 1,
-0.6753761, -0.6130952, -2.115036, 0, 0, 0, 1, 1,
-0.6732267, 1.162696, -1.099347, 0, 0, 0, 1, 1,
-0.6728359, -0.1447937, -1.766291, 0, 0, 0, 1, 1,
-0.6699548, -1.97383, -2.953833, 0, 0, 0, 1, 1,
-0.6692236, -0.1865263, -2.352801, 1, 1, 1, 1, 1,
-0.6664933, -0.2049376, -0.3077343, 1, 1, 1, 1, 1,
-0.6615158, 0.1800401, -1.290239, 1, 1, 1, 1, 1,
-0.6609254, -0.2718925, -3.000503, 1, 1, 1, 1, 1,
-0.6578158, -1.595366, 0.01335949, 1, 1, 1, 1, 1,
-0.6551305, 0.9148386, -1.37678, 1, 1, 1, 1, 1,
-0.6535328, -0.744719, -2.478166, 1, 1, 1, 1, 1,
-0.6521259, 0.7179422, -2.114234, 1, 1, 1, 1, 1,
-0.6519552, 1.436967, 2.059342, 1, 1, 1, 1, 1,
-0.6509545, 0.8798984, -1.292006, 1, 1, 1, 1, 1,
-0.6481179, 0.01216263, -1.579313, 1, 1, 1, 1, 1,
-0.6456828, -0.1694857, -3.217471, 1, 1, 1, 1, 1,
-0.6447526, 0.0745048, -1.346653, 1, 1, 1, 1, 1,
-0.6429129, 1.133353, -1.092432, 1, 1, 1, 1, 1,
-0.6385278, -0.4532535, -1.871718, 1, 1, 1, 1, 1,
-0.6371956, -0.4395009, -0.1721936, 0, 0, 1, 1, 1,
-0.6359798, 2.000217, 0.6847369, 1, 0, 0, 1, 1,
-0.63473, -2.063811, -2.759703, 1, 0, 0, 1, 1,
-0.6251415, -0.4432473, -2.004076, 1, 0, 0, 1, 1,
-0.6208197, -0.8855475, -3.075395, 1, 0, 0, 1, 1,
-0.6167591, 1.268607, -1.514613, 1, 0, 0, 1, 1,
-0.6151245, 0.4976792, -0.1041796, 0, 0, 0, 1, 1,
-0.6129513, 0.3587273, -2.293767, 0, 0, 0, 1, 1,
-0.6115512, -1.170412, -2.60381, 0, 0, 0, 1, 1,
-0.6090583, -0.5807754, -1.28506, 0, 0, 0, 1, 1,
-0.6076341, 0.7144387, -0.848007, 0, 0, 0, 1, 1,
-0.6050691, 0.1905009, -0.3746236, 0, 0, 0, 1, 1,
-0.6022646, -1.604946, -3.701988, 0, 0, 0, 1, 1,
-0.6019989, -0.1851415, -0.8370426, 1, 1, 1, 1, 1,
-0.6019021, -0.3549837, -0.9836379, 1, 1, 1, 1, 1,
-0.5988139, 0.3359069, -0.964819, 1, 1, 1, 1, 1,
-0.5957025, -0.01120575, -1.249694, 1, 1, 1, 1, 1,
-0.5928791, 0.06211324, -1.421642, 1, 1, 1, 1, 1,
-0.5925011, -0.5613846, -3.515701, 1, 1, 1, 1, 1,
-0.5920011, -1.646784, -3.598139, 1, 1, 1, 1, 1,
-0.5904387, 0.3073225, -1.351827, 1, 1, 1, 1, 1,
-0.5847371, 0.08906281, -1.022837, 1, 1, 1, 1, 1,
-0.5788604, 0.4880498, -1.475461, 1, 1, 1, 1, 1,
-0.5759807, -0.8962184, -3.104962, 1, 1, 1, 1, 1,
-0.5706894, 0.3935622, 0.1814413, 1, 1, 1, 1, 1,
-0.5673618, -2.700723, -2.030699, 1, 1, 1, 1, 1,
-0.5586654, -0.4319986, -3.651322, 1, 1, 1, 1, 1,
-0.5573361, 1.816422, -1.559963, 1, 1, 1, 1, 1,
-0.5549747, -1.605467, -2.627449, 0, 0, 1, 1, 1,
-0.5521559, -1.25497, -2.692385, 1, 0, 0, 1, 1,
-0.5477459, 3.2077, 0.0101176, 1, 0, 0, 1, 1,
-0.5472671, 0.1655176, -2.980841, 1, 0, 0, 1, 1,
-0.5465124, 0.05203906, -0.7161387, 1, 0, 0, 1, 1,
-0.5423772, -0.3937583, -2.068602, 1, 0, 0, 1, 1,
-0.5422202, -0.4043621, -3.278262, 0, 0, 0, 1, 1,
-0.5412298, -1.023801, -1.594291, 0, 0, 0, 1, 1,
-0.5378699, 0.3205185, -0.7260008, 0, 0, 0, 1, 1,
-0.5293854, -0.5594717, -2.908288, 0, 0, 0, 1, 1,
-0.5196496, 0.2237788, -1.609794, 0, 0, 0, 1, 1,
-0.5154869, -0.8473935, -1.011551, 0, 0, 0, 1, 1,
-0.515218, 2.030549, -0.7103867, 0, 0, 0, 1, 1,
-0.5129673, -0.4145341, -1.415699, 1, 1, 1, 1, 1,
-0.5125855, 0.2977972, -1.531334, 1, 1, 1, 1, 1,
-0.5105031, -1.001769, -3.941627, 1, 1, 1, 1, 1,
-0.50305, 0.2326963, -1.983146, 1, 1, 1, 1, 1,
-0.5025784, 0.5245661, -2.072702, 1, 1, 1, 1, 1,
-0.5018929, 0.1136151, -1.145673, 1, 1, 1, 1, 1,
-0.5010459, -1.280033, -1.706434, 1, 1, 1, 1, 1,
-0.4989319, -1.00466, -1.731685, 1, 1, 1, 1, 1,
-0.4948153, -0.7990572, -2.980154, 1, 1, 1, 1, 1,
-0.4941441, -0.4972771, -3.889601, 1, 1, 1, 1, 1,
-0.4917574, -1.617722, -4.404067, 1, 1, 1, 1, 1,
-0.4909815, -0.7640343, -4.771487, 1, 1, 1, 1, 1,
-0.4896564, 0.05561034, -1.174094, 1, 1, 1, 1, 1,
-0.4840718, 0.9577881, -0.6025496, 1, 1, 1, 1, 1,
-0.4816233, -0.4569856, -0.6145875, 1, 1, 1, 1, 1,
-0.4725829, 0.2986625, -1.215455, 0, 0, 1, 1, 1,
-0.4712244, -0.06668615, -1.335399, 1, 0, 0, 1, 1,
-0.4689385, -1.12369, -2.068319, 1, 0, 0, 1, 1,
-0.4669273, 0.5390136, -1.97686, 1, 0, 0, 1, 1,
-0.466605, 0.01803848, -1.968512, 1, 0, 0, 1, 1,
-0.4611761, -1.175875, -1.708839, 1, 0, 0, 1, 1,
-0.4606018, -0.7107504, -2.268974, 0, 0, 0, 1, 1,
-0.4596993, 0.1548687, -2.026556, 0, 0, 0, 1, 1,
-0.45682, 0.3026137, 0.8488204, 0, 0, 0, 1, 1,
-0.4560434, -1.118652, -2.585823, 0, 0, 0, 1, 1,
-0.4542436, 3.252335, -1.401305, 0, 0, 0, 1, 1,
-0.451189, -0.4709228, -4.397328, 0, 0, 0, 1, 1,
-0.4494546, -0.8212542, -3.281821, 0, 0, 0, 1, 1,
-0.4489946, -1.141252, -1.860023, 1, 1, 1, 1, 1,
-0.4473291, 0.9726012, 1.677152, 1, 1, 1, 1, 1,
-0.4445758, -0.7056759, -3.093286, 1, 1, 1, 1, 1,
-0.4431755, 0.2344788, -0.7766007, 1, 1, 1, 1, 1,
-0.4410193, -0.8682907, -2.16233, 1, 1, 1, 1, 1,
-0.4337246, 0.04084363, -0.827379, 1, 1, 1, 1, 1,
-0.4313473, -0.7929574, -3.040986, 1, 1, 1, 1, 1,
-0.4285729, 1.661823, -0.1410394, 1, 1, 1, 1, 1,
-0.4266026, 0.1287705, -0.5823375, 1, 1, 1, 1, 1,
-0.4247738, -0.5590006, -3.223388, 1, 1, 1, 1, 1,
-0.4181752, 0.6939569, -0.3673882, 1, 1, 1, 1, 1,
-0.4159118, -0.0334085, -1.422432, 1, 1, 1, 1, 1,
-0.4120522, 1.46987, -2.015822, 1, 1, 1, 1, 1,
-0.406946, 1.788281, -3.458372, 1, 1, 1, 1, 1,
-0.401245, -0.8487672, -2.848825, 1, 1, 1, 1, 1,
-0.3979319, -1.510025, -3.694329, 0, 0, 1, 1, 1,
-0.3960772, 0.6652111, -1.216365, 1, 0, 0, 1, 1,
-0.3957008, 0.5855683, -1.512001, 1, 0, 0, 1, 1,
-0.3948672, 1.380839, -0.4775167, 1, 0, 0, 1, 1,
-0.3907067, -0.8889932, -1.619655, 1, 0, 0, 1, 1,
-0.3902027, 0.4564625, -0.1380755, 1, 0, 0, 1, 1,
-0.3896023, -1.775674, -3.215316, 0, 0, 0, 1, 1,
-0.3816441, 0.1453991, -1.51544, 0, 0, 0, 1, 1,
-0.369532, 0.03904901, -0.2654709, 0, 0, 0, 1, 1,
-0.3660736, -0.1543559, -2.081936, 0, 0, 0, 1, 1,
-0.3641546, 0.8183447, -1.423564, 0, 0, 0, 1, 1,
-0.3625275, 0.8416276, -0.3953578, 0, 0, 0, 1, 1,
-0.3622543, 0.6182492, 1.115588, 0, 0, 0, 1, 1,
-0.3614418, 0.8631226, -0.2019904, 1, 1, 1, 1, 1,
-0.3580104, 1.898896, 0.4533511, 1, 1, 1, 1, 1,
-0.3538606, 1.246278, -0.4539846, 1, 1, 1, 1, 1,
-0.3526742, -0.2314206, -0.9604901, 1, 1, 1, 1, 1,
-0.3502985, 1.175096, 0.8545876, 1, 1, 1, 1, 1,
-0.3491995, 0.7271025, -0.2207815, 1, 1, 1, 1, 1,
-0.3480011, 1.542673, -0.6045464, 1, 1, 1, 1, 1,
-0.3468331, -2.562358, -2.934487, 1, 1, 1, 1, 1,
-0.3458257, -2.161957, -2.9774, 1, 1, 1, 1, 1,
-0.3420963, -1.048759, -4.622332, 1, 1, 1, 1, 1,
-0.3417877, 0.4614943, -0.5287223, 1, 1, 1, 1, 1,
-0.3410237, 0.04882039, -1.42934, 1, 1, 1, 1, 1,
-0.3400926, -0.7431156, -1.578413, 1, 1, 1, 1, 1,
-0.3384264, 0.8302013, -0.6647108, 1, 1, 1, 1, 1,
-0.3344106, 0.597123, -2.811478, 1, 1, 1, 1, 1,
-0.3311313, 1.751244, 0.2977803, 0, 0, 1, 1, 1,
-0.3234925, -1.468071, -1.990808, 1, 0, 0, 1, 1,
-0.321772, 1.33579, 0.9685168, 1, 0, 0, 1, 1,
-0.321581, 1.055981, 0.1946185, 1, 0, 0, 1, 1,
-0.3210711, 1.544539, 1.106161, 1, 0, 0, 1, 1,
-0.3209054, -1.984314, -2.150912, 1, 0, 0, 1, 1,
-0.3197919, -1.403995, -2.386645, 0, 0, 0, 1, 1,
-0.3185742, -0.8677811, -1.346925, 0, 0, 0, 1, 1,
-0.3151854, 0.303916, -0.2495806, 0, 0, 0, 1, 1,
-0.3150939, -1.471712, -3.526, 0, 0, 0, 1, 1,
-0.3095057, 0.6607578, 0.1433738, 0, 0, 0, 1, 1,
-0.3093105, -1.575547, -2.641104, 0, 0, 0, 1, 1,
-0.2981981, -0.2008833, -1.177609, 0, 0, 0, 1, 1,
-0.2969764, 0.6555939, -1.749765, 1, 1, 1, 1, 1,
-0.2930573, -0.1212006, -2.265434, 1, 1, 1, 1, 1,
-0.2926743, -1.135926, -3.074197, 1, 1, 1, 1, 1,
-0.2863034, -0.9207107, -1.496471, 1, 1, 1, 1, 1,
-0.2801765, 0.4115882, -0.9606714, 1, 1, 1, 1, 1,
-0.275515, 0.4633225, -1.31158, 1, 1, 1, 1, 1,
-0.2722929, -0.3550876, -2.551964, 1, 1, 1, 1, 1,
-0.2712913, -0.5562313, -2.224274, 1, 1, 1, 1, 1,
-0.263622, 2.528571, -0.1789184, 1, 1, 1, 1, 1,
-0.2634261, -0.4654191, -0.3223774, 1, 1, 1, 1, 1,
-0.2630209, 0.6090063, 1.846879, 1, 1, 1, 1, 1,
-0.2620774, -1.683884, -1.992838, 1, 1, 1, 1, 1,
-0.2547411, 0.8040297, 0.3933533, 1, 1, 1, 1, 1,
-0.2541749, 0.7316207, -1.037774, 1, 1, 1, 1, 1,
-0.2485545, -0.7648137, -1.720428, 1, 1, 1, 1, 1,
-0.2480366, -2.128599, -3.7824, 0, 0, 1, 1, 1,
-0.2467875, -0.7933755, -3.041013, 1, 0, 0, 1, 1,
-0.244596, 0.5249949, 0.4286098, 1, 0, 0, 1, 1,
-0.2409025, -0.5783884, -2.651104, 1, 0, 0, 1, 1,
-0.2351592, -0.4031586, -1.821588, 1, 0, 0, 1, 1,
-0.2323198, 0.1060962, -1.383891, 1, 0, 0, 1, 1,
-0.2314467, 0.02749303, -1.919625, 0, 0, 0, 1, 1,
-0.2289634, 0.1384694, -2.814387, 0, 0, 0, 1, 1,
-0.2270786, -2.186792, -1.271128, 0, 0, 0, 1, 1,
-0.2222995, 1.155059, -0.962522, 0, 0, 0, 1, 1,
-0.2184968, -0.8684093, -3.314858, 0, 0, 0, 1, 1,
-0.2184752, 0.04720526, 0.1741876, 0, 0, 0, 1, 1,
-0.2180167, 0.01535615, 0.2875049, 0, 0, 0, 1, 1,
-0.2174096, -0.7283871, -2.867376, 1, 1, 1, 1, 1,
-0.2172436, -2.584515, -3.912779, 1, 1, 1, 1, 1,
-0.2171391, 0.772254, -1.03704, 1, 1, 1, 1, 1,
-0.2141137, 0.8847011, 0.3563428, 1, 1, 1, 1, 1,
-0.2082451, -0.6117285, -2.052144, 1, 1, 1, 1, 1,
-0.207081, 0.2543445, -0.1239012, 1, 1, 1, 1, 1,
-0.2070015, -0.8806378, -2.988088, 1, 1, 1, 1, 1,
-0.1961202, 0.6068352, -1.076368, 1, 1, 1, 1, 1,
-0.1960045, 0.6722441, 0.8765943, 1, 1, 1, 1, 1,
-0.1929667, -0.6288866, -0.8064603, 1, 1, 1, 1, 1,
-0.185836, 0.3025523, -0.8464293, 1, 1, 1, 1, 1,
-0.1853337, -0.2316535, -3.442204, 1, 1, 1, 1, 1,
-0.1852049, 0.938166, -0.2251936, 1, 1, 1, 1, 1,
-0.1836987, -1.117605, -2.840966, 1, 1, 1, 1, 1,
-0.1825736, 1.267295, 0.4220439, 1, 1, 1, 1, 1,
-0.1795995, 1.164948, 1.509038, 0, 0, 1, 1, 1,
-0.1718505, -0.1937171, -2.183796, 1, 0, 0, 1, 1,
-0.1717527, -0.2238064, -3.926972, 1, 0, 0, 1, 1,
-0.167323, 0.2544289, -0.5010075, 1, 0, 0, 1, 1,
-0.1650084, -0.2210149, -1.279972, 1, 0, 0, 1, 1,
-0.1636253, 0.2653699, 0.4474363, 1, 0, 0, 1, 1,
-0.1570463, 0.05182799, -0.4680916, 0, 0, 0, 1, 1,
-0.1568882, 0.4791064, 1.444084, 0, 0, 0, 1, 1,
-0.1563508, -1.498, -3.030371, 0, 0, 0, 1, 1,
-0.1493098, 1.619599, -0.07084963, 0, 0, 0, 1, 1,
-0.147135, -0.08535658, 0.3843095, 0, 0, 0, 1, 1,
-0.1444418, 1.754246, 0.6077036, 0, 0, 0, 1, 1,
-0.1406395, 0.2536003, -2.997459, 0, 0, 0, 1, 1,
-0.1321392, -1.266213, -1.778968, 1, 1, 1, 1, 1,
-0.1307851, 0.5590189, -1.809695, 1, 1, 1, 1, 1,
-0.1298986, 0.9405848, -0.09739505, 1, 1, 1, 1, 1,
-0.1295312, 0.2814516, 0.4726268, 1, 1, 1, 1, 1,
-0.1283941, 0.3923663, -1.139315, 1, 1, 1, 1, 1,
-0.1279239, -1.130504, -5.236626, 1, 1, 1, 1, 1,
-0.1274569, 0.3110155, -0.1804207, 1, 1, 1, 1, 1,
-0.1269764, 0.677908, -0.8071198, 1, 1, 1, 1, 1,
-0.122585, 0.8654818, 0.2835014, 1, 1, 1, 1, 1,
-0.1194867, -0.5238554, -3.125706, 1, 1, 1, 1, 1,
-0.1167688, -0.1113552, -1.954739, 1, 1, 1, 1, 1,
-0.1158678, 0.1509507, -1.548993, 1, 1, 1, 1, 1,
-0.1154618, -1.733551, -2.937973, 1, 1, 1, 1, 1,
-0.115109, -0.9284503, -4.076326, 1, 1, 1, 1, 1,
-0.114449, 1.796071, -0.6689427, 1, 1, 1, 1, 1,
-0.1079679, 0.8143698, 1.178567, 0, 0, 1, 1, 1,
-0.08850542, -0.1098708, -3.42479, 1, 0, 0, 1, 1,
-0.08235329, 0.2268585, 0.7090493, 1, 0, 0, 1, 1,
-0.07742104, 2.512449, 0.5867171, 1, 0, 0, 1, 1,
-0.07040054, 0.6032417, 0.08465544, 1, 0, 0, 1, 1,
-0.07014105, -0.4542643, -2.438014, 1, 0, 0, 1, 1,
-0.0672446, 0.2264731, -3.246995, 0, 0, 0, 1, 1,
-0.06591198, 0.1760279, 0.1672483, 0, 0, 0, 1, 1,
-0.06545726, 0.6948437, 1.00213, 0, 0, 0, 1, 1,
-0.05575427, 0.3510392, -2.362889, 0, 0, 0, 1, 1,
-0.05307977, -0.2322361, -3.71848, 0, 0, 0, 1, 1,
-0.05144238, 0.7735719, -0.04793582, 0, 0, 0, 1, 1,
-0.04899282, -0.3329188, -2.651818, 0, 0, 0, 1, 1,
-0.04866692, 0.7437317, -0.5543218, 1, 1, 1, 1, 1,
-0.04836457, -1.044352, -3.208327, 1, 1, 1, 1, 1,
-0.03979905, -0.5279182, -5.200031, 1, 1, 1, 1, 1,
-0.02359744, 0.7144994, -0.5369048, 1, 1, 1, 1, 1,
-0.02240128, 0.03083411, -1.22038, 1, 1, 1, 1, 1,
-0.01753754, 0.9761364, 1.000529, 1, 1, 1, 1, 1,
-0.01557299, 1.929831, 0.9536706, 1, 1, 1, 1, 1,
-0.01491987, -0.3714081, -4.223254, 1, 1, 1, 1, 1,
-0.008191639, 0.8998531, 0.7741639, 1, 1, 1, 1, 1,
-0.006754119, -2.506442, -1.082898, 1, 1, 1, 1, 1,
-0.006127794, -0.8746655, -2.842729, 1, 1, 1, 1, 1,
-0.006092635, -0.9356107, -5.295642, 1, 1, 1, 1, 1,
-0.005649394, 0.6710954, 0.6909295, 1, 1, 1, 1, 1,
-0.004892936, 0.5723123, -0.5840035, 1, 1, 1, 1, 1,
-0.003171379, 2.214659, 0.1621946, 1, 1, 1, 1, 1,
-0.002123319, -0.7520872, -3.79946, 0, 0, 1, 1, 1,
-0.00197045, 0.05398037, 0.8945723, 1, 0, 0, 1, 1,
0.001104909, -1.927494, 1.813831, 1, 0, 0, 1, 1,
0.005634114, 0.7263837, 0.6845319, 1, 0, 0, 1, 1,
0.007764397, -1.095974, 1.741055, 1, 0, 0, 1, 1,
0.008503038, 0.3148034, -0.9503592, 1, 0, 0, 1, 1,
0.009429549, 0.2342376, -0.02480387, 0, 0, 0, 1, 1,
0.009468528, -1.397958, 3.895131, 0, 0, 0, 1, 1,
0.01211455, 0.4433411, 1.762343, 0, 0, 0, 1, 1,
0.01607411, -0.8177536, 4.166016, 0, 0, 0, 1, 1,
0.01687103, -0.262078, 3.394624, 0, 0, 0, 1, 1,
0.02071097, -0.6899592, 3.549666, 0, 0, 0, 1, 1,
0.02386588, -1.723994, 2.842994, 0, 0, 0, 1, 1,
0.02659375, 0.6110659, 0.6402493, 1, 1, 1, 1, 1,
0.0268729, -1.947744, 2.277377, 1, 1, 1, 1, 1,
0.03189465, 0.6446619, -0.1022228, 1, 1, 1, 1, 1,
0.03190802, 1.630052, 1.286707, 1, 1, 1, 1, 1,
0.03794948, 0.0853916, -0.7474845, 1, 1, 1, 1, 1,
0.04004893, -0.3995791, 2.406702, 1, 1, 1, 1, 1,
0.04144555, -0.3966281, 3.832538, 1, 1, 1, 1, 1,
0.0453919, -0.9734097, 3.038493, 1, 1, 1, 1, 1,
0.04856929, 0.341309, 0.7792271, 1, 1, 1, 1, 1,
0.05058318, 0.4577546, -0.3810704, 1, 1, 1, 1, 1,
0.05225757, 0.3546394, -1.608746, 1, 1, 1, 1, 1,
0.05435864, -0.3367337, 1.273912, 1, 1, 1, 1, 1,
0.05539784, 0.08930594, 1.439512, 1, 1, 1, 1, 1,
0.05563202, -1.114394, 3.571428, 1, 1, 1, 1, 1,
0.05981547, -0.7023523, 2.097029, 1, 1, 1, 1, 1,
0.0629092, -0.4161634, 3.823002, 0, 0, 1, 1, 1,
0.06522349, -0.6681685, 4.289961, 1, 0, 0, 1, 1,
0.06633746, 1.106607, -0.7727813, 1, 0, 0, 1, 1,
0.06998879, 0.4349654, -2.263127, 1, 0, 0, 1, 1,
0.07151739, 0.06489682, 0.6510705, 1, 0, 0, 1, 1,
0.07226084, 0.8906022, 0.4064852, 1, 0, 0, 1, 1,
0.07399138, -1.881705, 4.873433, 0, 0, 0, 1, 1,
0.07492796, -0.03090346, 3.136635, 0, 0, 0, 1, 1,
0.0782364, -0.6767256, 4.187357, 0, 0, 0, 1, 1,
0.07914753, 1.727959, 0.47236, 0, 0, 0, 1, 1,
0.08061411, 0.9512464, 1.311569, 0, 0, 0, 1, 1,
0.08583771, -0.09502268, 4.466005, 0, 0, 0, 1, 1,
0.08732356, -0.3049838, 2.048666, 0, 0, 0, 1, 1,
0.08804148, -1.062598, 3.344428, 1, 1, 1, 1, 1,
0.08805472, 0.5331661, 0.6775568, 1, 1, 1, 1, 1,
0.09123056, 1.736449, 0.2034043, 1, 1, 1, 1, 1,
0.09866673, 0.5589865, 1.036745, 1, 1, 1, 1, 1,
0.09927703, 0.1520223, -0.9204552, 1, 1, 1, 1, 1,
0.102407, 0.05138316, 1.701768, 1, 1, 1, 1, 1,
0.1116129, 1.758222, 1.180159, 1, 1, 1, 1, 1,
0.1119205, 2.262459, -1.617527, 1, 1, 1, 1, 1,
0.1121567, 0.2763353, 1.408431, 1, 1, 1, 1, 1,
0.1134069, 0.4511476, 0.8489221, 1, 1, 1, 1, 1,
0.1141323, -1.074854, 3.247108, 1, 1, 1, 1, 1,
0.1191482, 1.781811, 0.3585789, 1, 1, 1, 1, 1,
0.1232447, -0.01638991, 3.017702, 1, 1, 1, 1, 1,
0.1287871, -0.8998475, 2.529901, 1, 1, 1, 1, 1,
0.1295292, -0.8230919, 3.701026, 1, 1, 1, 1, 1,
0.1387324, -0.7104484, 1.383509, 0, 0, 1, 1, 1,
0.139444, 3.627836, 0.2236683, 1, 0, 0, 1, 1,
0.1456872, 0.4581559, -0.3093902, 1, 0, 0, 1, 1,
0.1482198, 1.354081, -0.7759457, 1, 0, 0, 1, 1,
0.1487107, -1.41989, 3.066273, 1, 0, 0, 1, 1,
0.1491151, -0.0319264, 0.9891499, 1, 0, 0, 1, 1,
0.1552643, 2.32046, -1.56719, 0, 0, 0, 1, 1,
0.1568144, -1.188761, 2.971779, 0, 0, 0, 1, 1,
0.1621112, 0.9041783, 1.123709, 0, 0, 0, 1, 1,
0.1650474, 0.3556179, -0.6844176, 0, 0, 0, 1, 1,
0.1698753, -0.2712601, -0.1353894, 0, 0, 0, 1, 1,
0.1699395, 0.6280889, -0.39234, 0, 0, 0, 1, 1,
0.1728662, -0.08929797, 2.851351, 0, 0, 0, 1, 1,
0.175126, -0.6842787, 2.25074, 1, 1, 1, 1, 1,
0.1757321, -0.4983696, 3.409422, 1, 1, 1, 1, 1,
0.1768927, -0.8031685, 3.077908, 1, 1, 1, 1, 1,
0.1818706, -0.06100903, 1.420681, 1, 1, 1, 1, 1,
0.1836885, -0.5651641, 2.417828, 1, 1, 1, 1, 1,
0.1877506, -1.249438, 2.863102, 1, 1, 1, 1, 1,
0.1886222, 1.480312, 0.9479423, 1, 1, 1, 1, 1,
0.189933, -0.9059992, 1.689167, 1, 1, 1, 1, 1,
0.1930449, -1.332755, 3.02055, 1, 1, 1, 1, 1,
0.1931198, -0.8407313, 3.082628, 1, 1, 1, 1, 1,
0.19451, 1.013871, -1.06584, 1, 1, 1, 1, 1,
0.1989969, 0.4211955, -1.582273, 1, 1, 1, 1, 1,
0.2008202, 0.8863142, -0.8068092, 1, 1, 1, 1, 1,
0.2045265, -0.3030962, 3.002113, 1, 1, 1, 1, 1,
0.2049519, 0.4494075, 0.9876256, 1, 1, 1, 1, 1,
0.2080371, 0.8543726, -0.08456611, 0, 0, 1, 1, 1,
0.2092142, -0.7584859, 2.96736, 1, 0, 0, 1, 1,
0.211684, -0.04847238, 1.762908, 1, 0, 0, 1, 1,
0.2117034, -0.9343516, 2.072228, 1, 0, 0, 1, 1,
0.2157707, 0.5143011, 0.9547537, 1, 0, 0, 1, 1,
0.2188792, 0.4075319, 1.362933, 1, 0, 0, 1, 1,
0.2189249, 1.055553, 0.5987351, 0, 0, 0, 1, 1,
0.220152, -1.167132, 2.043568, 0, 0, 0, 1, 1,
0.2213578, 2.48686, 1.821984, 0, 0, 0, 1, 1,
0.2225371, 0.7415848, 0.8054006, 0, 0, 0, 1, 1,
0.2270196, -0.2068703, 3.493712, 0, 0, 0, 1, 1,
0.2275925, -0.1948413, 3.066805, 0, 0, 0, 1, 1,
0.2285831, 0.4359874, 0.5055253, 0, 0, 0, 1, 1,
0.2293567, -0.05645218, 1.359262, 1, 1, 1, 1, 1,
0.2310068, -0.7614751, 2.510758, 1, 1, 1, 1, 1,
0.2348816, 0.7174414, 0.315428, 1, 1, 1, 1, 1,
0.2359914, 0.5671085, 0.8594511, 1, 1, 1, 1, 1,
0.2400516, -0.1438352, 2.936967, 1, 1, 1, 1, 1,
0.2406405, -0.3336464, 2.90497, 1, 1, 1, 1, 1,
0.240854, 0.6901566, 1.214356, 1, 1, 1, 1, 1,
0.2468344, 0.04074721, 2.51916, 1, 1, 1, 1, 1,
0.2525356, 0.7998309, -0.00610834, 1, 1, 1, 1, 1,
0.2540384, 0.8587914, 0.2766839, 1, 1, 1, 1, 1,
0.25635, -1.496572, 3.191468, 1, 1, 1, 1, 1,
0.2649722, 2.597129, -1.128968, 1, 1, 1, 1, 1,
0.2698658, -0.291725, 1.95468, 1, 1, 1, 1, 1,
0.2710391, 0.1162786, 2.583054, 1, 1, 1, 1, 1,
0.2765138, 0.3601503, 1.896369, 1, 1, 1, 1, 1,
0.2769285, 1.383807, 1.648168, 0, 0, 1, 1, 1,
0.2781137, 1.298437, 1.012112, 1, 0, 0, 1, 1,
0.2792801, -0.5621818, 2.108892, 1, 0, 0, 1, 1,
0.2817387, -0.07775874, 3.719849, 1, 0, 0, 1, 1,
0.2828468, -1.295327, 1.302723, 1, 0, 0, 1, 1,
0.2876291, 0.0109527, 1.107046, 1, 0, 0, 1, 1,
0.2879991, -0.6157486, 1.944285, 0, 0, 0, 1, 1,
0.2918276, -0.9125838, 2.911774, 0, 0, 0, 1, 1,
0.2939282, 0.8667369, -0.6852471, 0, 0, 0, 1, 1,
0.2943213, -0.01969479, 0.5980572, 0, 0, 0, 1, 1,
0.2987614, -0.3417318, 1.318278, 0, 0, 0, 1, 1,
0.3002246, -1.537401, 3.81936, 0, 0, 0, 1, 1,
0.3059718, -0.08047986, 2.094044, 0, 0, 0, 1, 1,
0.3064205, -0.8572126, 2.133072, 1, 1, 1, 1, 1,
0.3174319, -0.3845054, 3.959428, 1, 1, 1, 1, 1,
0.3199037, -0.460044, 1.820243, 1, 1, 1, 1, 1,
0.3213136, 0.1350991, 1.110784, 1, 1, 1, 1, 1,
0.3239757, 1.950567, -1.050289, 1, 1, 1, 1, 1,
0.324753, 0.2950839, 0.0482441, 1, 1, 1, 1, 1,
0.3274509, -0.6211848, 1.385688, 1, 1, 1, 1, 1,
0.3339972, -0.8475186, 2.460288, 1, 1, 1, 1, 1,
0.3350829, -0.02187488, 1.266014, 1, 1, 1, 1, 1,
0.3352339, 0.5770128, -0.3036955, 1, 1, 1, 1, 1,
0.3445027, 0.5837436, -0.4931967, 1, 1, 1, 1, 1,
0.3446641, 0.3842922, 1.826048, 1, 1, 1, 1, 1,
0.3465897, 0.4972103, 0.5092727, 1, 1, 1, 1, 1,
0.3468379, -1.080765, 3.183156, 1, 1, 1, 1, 1,
0.3483096, -0.7867606, 4.554252, 1, 1, 1, 1, 1,
0.3485249, 0.6723926, 1.000229, 0, 0, 1, 1, 1,
0.3493382, 0.6787795, 0.8895054, 1, 0, 0, 1, 1,
0.3550246, -1.330441, 2.092505, 1, 0, 0, 1, 1,
0.3557149, -0.09836344, 2.096545, 1, 0, 0, 1, 1,
0.356381, 0.4283595, 0.6883468, 1, 0, 0, 1, 1,
0.3588125, -0.2114771, 0.8564696, 1, 0, 0, 1, 1,
0.3612272, -1.22218, 1.291539, 0, 0, 0, 1, 1,
0.362105, -0.9825634, 3.258188, 0, 0, 0, 1, 1,
0.3639714, 0.7888663, 1.190053, 0, 0, 0, 1, 1,
0.366974, -0.936188, 1.693527, 0, 0, 0, 1, 1,
0.3670669, 1.169515, -0.1244569, 0, 0, 0, 1, 1,
0.3721827, -0.4959644, 2.467765, 0, 0, 0, 1, 1,
0.3746364, 0.4236444, 1.671504, 0, 0, 0, 1, 1,
0.386565, -0.3284515, 3.371588, 1, 1, 1, 1, 1,
0.3882846, 0.01821026, 1.76026, 1, 1, 1, 1, 1,
0.3900702, 1.191097, -2.459362, 1, 1, 1, 1, 1,
0.3929898, -0.8157579, 2.923612, 1, 1, 1, 1, 1,
0.3994545, -0.1814104, 1.839535, 1, 1, 1, 1, 1,
0.4052269, -1.781389, 2.534817, 1, 1, 1, 1, 1,
0.4115068, -1.989472, 4.125261, 1, 1, 1, 1, 1,
0.4117035, 0.2201259, 1.387941, 1, 1, 1, 1, 1,
0.4120184, 1.755357, -1.551028, 1, 1, 1, 1, 1,
0.414886, -0.3843838, 2.923666, 1, 1, 1, 1, 1,
0.4149395, 0.8943794, 1.085996, 1, 1, 1, 1, 1,
0.4197512, -0.04031449, 1.305269, 1, 1, 1, 1, 1,
0.4203471, 0.3433199, 1.29717, 1, 1, 1, 1, 1,
0.4229645, 0.5140415, 0.09464146, 1, 1, 1, 1, 1,
0.4279488, -0.8691542, 2.545342, 1, 1, 1, 1, 1,
0.4314682, 1.02179, 0.3312028, 0, 0, 1, 1, 1,
0.4320656, 1.227796, -0.3486828, 1, 0, 0, 1, 1,
0.4339277, -0.3533123, 2.428155, 1, 0, 0, 1, 1,
0.435301, -0.2147408, 0.3694435, 1, 0, 0, 1, 1,
0.4401749, -1.772531, 4.910088, 1, 0, 0, 1, 1,
0.4402298, 1.393865, 3.011454, 1, 0, 0, 1, 1,
0.4439415, -0.6999564, 3.944654, 0, 0, 0, 1, 1,
0.4474688, 1.850971, 0.3834768, 0, 0, 0, 1, 1,
0.4503843, 3.337847, -0.03731413, 0, 0, 0, 1, 1,
0.450871, 0.04471509, 2.034136, 0, 0, 0, 1, 1,
0.452284, -0.09585918, 2.065703, 0, 0, 0, 1, 1,
0.4569025, 0.06728284, 1.533993, 0, 0, 0, 1, 1,
0.4574874, 0.9448289, 0.2039761, 0, 0, 0, 1, 1,
0.4627696, -0.1906335, 1.692352, 1, 1, 1, 1, 1,
0.464919, 0.7975888, 0.8139237, 1, 1, 1, 1, 1,
0.4705293, -1.0967, 3.442307, 1, 1, 1, 1, 1,
0.4900449, 0.1639605, 0.9315625, 1, 1, 1, 1, 1,
0.4906194, 0.5729332, 0.1340257, 1, 1, 1, 1, 1,
0.4918924, 1.800076, 1.233324, 1, 1, 1, 1, 1,
0.4924608, -0.3047477, 2.207787, 1, 1, 1, 1, 1,
0.493961, 0.2196636, 0.4724248, 1, 1, 1, 1, 1,
0.4941043, 0.09299409, -0.5483943, 1, 1, 1, 1, 1,
0.496814, 1.15597, 1.624948, 1, 1, 1, 1, 1,
0.4999482, 0.1308883, 1.586792, 1, 1, 1, 1, 1,
0.5110651, -0.2245139, 0.9817545, 1, 1, 1, 1, 1,
0.5143442, 0.7271899, 1.984508, 1, 1, 1, 1, 1,
0.5147149, -0.3182361, 3.613594, 1, 1, 1, 1, 1,
0.5222974, -1.754234, 2.230592, 1, 1, 1, 1, 1,
0.5244027, 0.987665, -0.1210874, 0, 0, 1, 1, 1,
0.5283193, 0.3544448, 0.8181704, 1, 0, 0, 1, 1,
0.5313614, -1.327523, 1.368398, 1, 0, 0, 1, 1,
0.5360402, -0.5071602, 1.122155, 1, 0, 0, 1, 1,
0.5370225, -0.9787108, 3.085986, 1, 0, 0, 1, 1,
0.537207, -0.6795624, 3.410421, 1, 0, 0, 1, 1,
0.5383068, 0.7391009, 1.397753, 0, 0, 0, 1, 1,
0.5386741, -0.6023716, 1.690182, 0, 0, 0, 1, 1,
0.5417811, 1.343258, 0.4271225, 0, 0, 0, 1, 1,
0.5431969, -0.2396387, 2.064987, 0, 0, 0, 1, 1,
0.5500441, -0.630524, 3.578469, 0, 0, 0, 1, 1,
0.5517264, 0.7561879, 0.629449, 0, 0, 0, 1, 1,
0.5549419, -0.1926109, 1.238329, 0, 0, 0, 1, 1,
0.5565072, 0.3338541, 1.087963, 1, 1, 1, 1, 1,
0.5600802, 0.2791933, -1.040159, 1, 1, 1, 1, 1,
0.563848, 0.4505638, 0.7417762, 1, 1, 1, 1, 1,
0.5673357, -0.6369691, 1.856065, 1, 1, 1, 1, 1,
0.5674936, 0.6568563, 1.09062, 1, 1, 1, 1, 1,
0.5704096, 0.7495963, 0.4361684, 1, 1, 1, 1, 1,
0.5727893, -1.102419, 0.2202647, 1, 1, 1, 1, 1,
0.5739092, 0.4642328, 0.2364268, 1, 1, 1, 1, 1,
0.5771872, 0.06948145, 2.23219, 1, 1, 1, 1, 1,
0.5791141, 0.8441336, -0.6596533, 1, 1, 1, 1, 1,
0.5803196, 1.175106, 1.540764, 1, 1, 1, 1, 1,
0.581641, -1.943093, 3.709591, 1, 1, 1, 1, 1,
0.5891671, 0.07057459, 2.620862, 1, 1, 1, 1, 1,
0.5903373, 0.5980482, 1.939382, 1, 1, 1, 1, 1,
0.5941486, -0.8173456, 2.170408, 1, 1, 1, 1, 1,
0.5951349, -0.2503297, 0.6827651, 0, 0, 1, 1, 1,
0.5960948, -0.9734654, 3.593875, 1, 0, 0, 1, 1,
0.5999259, -0.3173837, 2.76494, 1, 0, 0, 1, 1,
0.5999442, -0.1534251, 2.458267, 1, 0, 0, 1, 1,
0.6015993, -0.1142721, 1.615531, 1, 0, 0, 1, 1,
0.6021722, -1.659695, 2.482227, 1, 0, 0, 1, 1,
0.6031172, 1.450632, 0.955115, 0, 0, 0, 1, 1,
0.6066869, 0.7653297, -0.5296146, 0, 0, 0, 1, 1,
0.614119, -0.3947662, 2.368533, 0, 0, 0, 1, 1,
0.6155413, 0.2208603, 0.2079514, 0, 0, 0, 1, 1,
0.6180559, -0.9870335, 4.686699, 0, 0, 0, 1, 1,
0.6226079, 0.5476025, 2.030409, 0, 0, 0, 1, 1,
0.6228914, -0.538331, 0.7623636, 0, 0, 0, 1, 1,
0.6247272, -1.768571, 3.500202, 1, 1, 1, 1, 1,
0.6341023, -0.5810226, 2.314738, 1, 1, 1, 1, 1,
0.6419523, 0.08634757, 2.026839, 1, 1, 1, 1, 1,
0.6434368, -0.4414665, 0.9973823, 1, 1, 1, 1, 1,
0.6472968, -0.5344325, 2.541706, 1, 1, 1, 1, 1,
0.6483876, -0.8922303, 2.268674, 1, 1, 1, 1, 1,
0.6494815, 0.7149612, -0.1751046, 1, 1, 1, 1, 1,
0.6548263, -0.7893592, 1.823578, 1, 1, 1, 1, 1,
0.6555355, 0.8342802, 0.458988, 1, 1, 1, 1, 1,
0.656531, 0.6886347, -0.8281724, 1, 1, 1, 1, 1,
0.6585648, -0.2541154, 0.9041501, 1, 1, 1, 1, 1,
0.6642942, 1.808032, 0.1745716, 1, 1, 1, 1, 1,
0.6681318, 0.2355979, 0.8098754, 1, 1, 1, 1, 1,
0.6700151, -0.05864907, 1.578503, 1, 1, 1, 1, 1,
0.676818, 0.01169915, 2.041485, 1, 1, 1, 1, 1,
0.6771531, 2.158556, 0.6318029, 0, 0, 1, 1, 1,
0.6790138, 0.7519082, 1.961196, 1, 0, 0, 1, 1,
0.6829123, -1.37074, 2.16074, 1, 0, 0, 1, 1,
0.6836556, -0.4965174, 2.909408, 1, 0, 0, 1, 1,
0.6874385, -0.8449624, 1.348008, 1, 0, 0, 1, 1,
0.6878389, 0.6477556, 1.274563, 1, 0, 0, 1, 1,
0.6898232, 0.9997857, -0.6782964, 0, 0, 0, 1, 1,
0.6979461, -0.9250059, 1.999353, 0, 0, 0, 1, 1,
0.697989, -0.1559882, 1.471687, 0, 0, 0, 1, 1,
0.7004756, -0.7015627, 1.417717, 0, 0, 0, 1, 1,
0.7023878, -1.887439, 2.601721, 0, 0, 0, 1, 1,
0.702544, -0.05041183, 1.659954, 0, 0, 0, 1, 1,
0.7064332, 0.8264098, 0.7702031, 0, 0, 0, 1, 1,
0.7181281, 0.4252332, 2.04613, 1, 1, 1, 1, 1,
0.7184095, -1.192683, 0.7614103, 1, 1, 1, 1, 1,
0.7214308, 0.7421535, 0.5024406, 1, 1, 1, 1, 1,
0.7268255, -1.519192, 2.922167, 1, 1, 1, 1, 1,
0.7289716, -0.3338195, 1.54695, 1, 1, 1, 1, 1,
0.7296784, 0.4502299, 0.04796194, 1, 1, 1, 1, 1,
0.7322071, -1.368715, 2.970544, 1, 1, 1, 1, 1,
0.7327051, 0.07386012, 3.353503, 1, 1, 1, 1, 1,
0.732797, 0.3871449, 1.434742, 1, 1, 1, 1, 1,
0.7387329, 1.195398, 1.609836, 1, 1, 1, 1, 1,
0.7390637, 0.5075454, 2.593303, 1, 1, 1, 1, 1,
0.7449334, -1.481937, 3.394397, 1, 1, 1, 1, 1,
0.7490236, 1.836457, 0.2718481, 1, 1, 1, 1, 1,
0.7555385, -0.209483, 1.869949, 1, 1, 1, 1, 1,
0.7600229, -0.5146706, 3.840255, 1, 1, 1, 1, 1,
0.7628785, 2.041337, 0.5145522, 0, 0, 1, 1, 1,
0.7658994, 0.8740033, -0.5540337, 1, 0, 0, 1, 1,
0.7685164, 0.5773668, 0.3571563, 1, 0, 0, 1, 1,
0.769173, -1.832061, 3.475588, 1, 0, 0, 1, 1,
0.7699558, -0.9344186, 1.803686, 1, 0, 0, 1, 1,
0.7707046, -0.1862002, 0.9874572, 1, 0, 0, 1, 1,
0.7745399, -0.3996795, 2.169095, 0, 0, 0, 1, 1,
0.7777399, -0.8997273, 2.981344, 0, 0, 0, 1, 1,
0.7830099, 0.3222163, 2.340227, 0, 0, 0, 1, 1,
0.8017043, 0.2735577, 1.081982, 0, 0, 0, 1, 1,
0.8017548, -0.2383449, 2.943673, 0, 0, 0, 1, 1,
0.8043835, 0.3013383, 1.154365, 0, 0, 0, 1, 1,
0.8111846, 0.05509927, 2.13202, 0, 0, 0, 1, 1,
0.8165691, 0.3538879, 0.9257658, 1, 1, 1, 1, 1,
0.8200509, -0.007005869, 0.6579423, 1, 1, 1, 1, 1,
0.8213813, -0.8670144, 2.991075, 1, 1, 1, 1, 1,
0.8252659, 0.1399516, 4.811111, 1, 1, 1, 1, 1,
0.8303121, 0.8504966, 2.455165, 1, 1, 1, 1, 1,
0.8375695, 0.8126098, 0.5898374, 1, 1, 1, 1, 1,
0.8383916, 0.8073608, -0.2224093, 1, 1, 1, 1, 1,
0.8401687, -1.069014, 3.298229, 1, 1, 1, 1, 1,
0.8418221, 0.5953671, 1.457466, 1, 1, 1, 1, 1,
0.8550112, 0.08807247, 2.702669, 1, 1, 1, 1, 1,
0.8572223, 0.8871329, -0.4145439, 1, 1, 1, 1, 1,
0.8657374, 0.08533453, 0.9392188, 1, 1, 1, 1, 1,
0.8677822, -0.006226899, 1.461547, 1, 1, 1, 1, 1,
0.8694821, -0.01458966, 1.58356, 1, 1, 1, 1, 1,
0.8918908, -0.9668213, 3.460095, 1, 1, 1, 1, 1,
0.8965251, -2.440754, 2.740081, 0, 0, 1, 1, 1,
0.9005042, -0.02643738, 0.7503883, 1, 0, 0, 1, 1,
0.9011422, -0.5893693, 0.4978262, 1, 0, 0, 1, 1,
0.9031508, -0.2993145, 2.552832, 1, 0, 0, 1, 1,
0.903209, 0.3834488, 0.666904, 1, 0, 0, 1, 1,
0.9094363, 1.377802, 0.07817625, 1, 0, 0, 1, 1,
0.9096286, -0.6164089, 0.9612839, 0, 0, 0, 1, 1,
0.9104582, 0.7589206, -0.8564525, 0, 0, 0, 1, 1,
0.9108272, -1.779608, 3.591527, 0, 0, 0, 1, 1,
0.9154101, -0.6857402, 1.217893, 0, 0, 0, 1, 1,
0.9166133, 0.1068255, 1.485102, 0, 0, 0, 1, 1,
0.9223213, -0.1592922, 1.924901, 0, 0, 0, 1, 1,
0.9239731, -0.1774347, 0.8170235, 0, 0, 0, 1, 1,
0.9239845, 0.4509612, 2.150347, 1, 1, 1, 1, 1,
0.9323239, 0.03894288, 1.852552, 1, 1, 1, 1, 1,
0.9339657, -0.2432731, 3.260454, 1, 1, 1, 1, 1,
0.9414991, 1.315725, 2.328677, 1, 1, 1, 1, 1,
0.9420368, -0.9266203, 2.475112, 1, 1, 1, 1, 1,
0.9479573, -0.5119356, 1.845764, 1, 1, 1, 1, 1,
0.9492775, -1.20185, 3.469513, 1, 1, 1, 1, 1,
0.9578441, -0.1110573, 1.29209, 1, 1, 1, 1, 1,
0.9665578, -2.289602, 2.441406, 1, 1, 1, 1, 1,
0.9710312, 1.410899, 0.2220691, 1, 1, 1, 1, 1,
0.9747437, 0.04140894, 1.21239, 1, 1, 1, 1, 1,
0.9892541, -1.462997, 2.778418, 1, 1, 1, 1, 1,
0.9898108, -0.6076064, 2.881518, 1, 1, 1, 1, 1,
0.9913187, -0.52963, 1.576523, 1, 1, 1, 1, 1,
0.9946916, 1.438715, 0.4677131, 1, 1, 1, 1, 1,
1.000716, 0.2771861, 3.502049, 0, 0, 1, 1, 1,
1.001245, 0.7592449, -0.278241, 1, 0, 0, 1, 1,
1.00329, -1.064433, 3.420677, 1, 0, 0, 1, 1,
1.003522, -0.7893717, 1.90316, 1, 0, 0, 1, 1,
1.005948, 0.1978493, 0.3661264, 1, 0, 0, 1, 1,
1.019303, -0.4901784, 1.925806, 1, 0, 0, 1, 1,
1.023407, 0.1335817, 0.9729438, 0, 0, 0, 1, 1,
1.024521, -1.793897, 1.081408, 0, 0, 0, 1, 1,
1.026947, 0.4061595, 1.405032, 0, 0, 0, 1, 1,
1.039674, -2.049651, 3.20984, 0, 0, 0, 1, 1,
1.045591, -0.1375954, 2.933103, 0, 0, 0, 1, 1,
1.048439, -0.7136382, 3.877307, 0, 0, 0, 1, 1,
1.052566, -0.1855879, 2.167467, 0, 0, 0, 1, 1,
1.052758, -0.08999549, 0.9903443, 1, 1, 1, 1, 1,
1.052877, 0.8594308, 1.399382, 1, 1, 1, 1, 1,
1.057289, -0.2727641, 0.1329144, 1, 1, 1, 1, 1,
1.057817, -0.3672479, 2.449737, 1, 1, 1, 1, 1,
1.059662, -0.9802604, 1.961885, 1, 1, 1, 1, 1,
1.070767, 0.8731025, -0.5747691, 1, 1, 1, 1, 1,
1.076214, -0.4350063, 1.728879, 1, 1, 1, 1, 1,
1.079051, 0.02870711, 1.920997, 1, 1, 1, 1, 1,
1.08382, 0.5594321, 0.7264742, 1, 1, 1, 1, 1,
1.084938, 1.030068, 1.276785, 1, 1, 1, 1, 1,
1.116163, 0.05444118, 2.035596, 1, 1, 1, 1, 1,
1.118186, 0.975077, 0.4162058, 1, 1, 1, 1, 1,
1.119597, -0.1408778, 0.4725057, 1, 1, 1, 1, 1,
1.125421, 0.4587246, -0.4756148, 1, 1, 1, 1, 1,
1.133404, -0.8771501, 3.077992, 1, 1, 1, 1, 1,
1.136322, -0.2533742, 1.138529, 0, 0, 1, 1, 1,
1.138038, 0.3976933, 0.1820223, 1, 0, 0, 1, 1,
1.139497, -0.2122163, 3.277644, 1, 0, 0, 1, 1,
1.139622, -0.8012201, 1.784227, 1, 0, 0, 1, 1,
1.140638, 0.2761457, 1.998498, 1, 0, 0, 1, 1,
1.144373, 0.5920052, 1.39517, 1, 0, 0, 1, 1,
1.15705, 1.659853, -0.1659672, 0, 0, 0, 1, 1,
1.168243, 0.3417639, 0.4720315, 0, 0, 0, 1, 1,
1.177528, 0.06026923, 1.18491, 0, 0, 0, 1, 1,
1.182507, 0.141037, 1.300999, 0, 0, 0, 1, 1,
1.190281, 1.232058, 1.519823, 0, 0, 0, 1, 1,
1.190291, 0.1984199, 1.135243, 0, 0, 0, 1, 1,
1.195735, 0.8459952, 1.381437, 0, 0, 0, 1, 1,
1.200644, -0.4021453, 1.134005, 1, 1, 1, 1, 1,
1.207821, 0.5150756, 0.8612008, 1, 1, 1, 1, 1,
1.234052, 0.2723396, 2.953954, 1, 1, 1, 1, 1,
1.235422, 1.120267, 1.269408, 1, 1, 1, 1, 1,
1.237775, -0.3190126, 2.149651, 1, 1, 1, 1, 1,
1.240817, 0.2174343, 2.457665, 1, 1, 1, 1, 1,
1.242463, 0.8904994, 0.7560931, 1, 1, 1, 1, 1,
1.242558, 0.8608807, 0.1453202, 1, 1, 1, 1, 1,
1.247917, 0.2304058, 3.205598, 1, 1, 1, 1, 1,
1.251652, 2.047117, 1.011049, 1, 1, 1, 1, 1,
1.259174, 0.3980304, -0.096636, 1, 1, 1, 1, 1,
1.261693, -0.9618338, 2.839702, 1, 1, 1, 1, 1,
1.265807, 0.2466611, 1.802793, 1, 1, 1, 1, 1,
1.267363, -0.7908691, 2.633648, 1, 1, 1, 1, 1,
1.279828, -0.01932113, 2.670562, 1, 1, 1, 1, 1,
1.295416, -0.4880064, 1.63504, 0, 0, 1, 1, 1,
1.302338, 1.230938, 0.3256319, 1, 0, 0, 1, 1,
1.304415, -0.5982585, 2.679207, 1, 0, 0, 1, 1,
1.315103, 1.566072, 0.2635766, 1, 0, 0, 1, 1,
1.319971, 0.4463185, 0.2407826, 1, 0, 0, 1, 1,
1.329698, -0.1227088, 2.066021, 1, 0, 0, 1, 1,
1.334559, 2.09494, 0.8375355, 0, 0, 0, 1, 1,
1.336657, 0.8364347, 1.125069, 0, 0, 0, 1, 1,
1.337109, -0.02674615, 0.4427008, 0, 0, 0, 1, 1,
1.350899, 1.185189, 0.09704011, 0, 0, 0, 1, 1,
1.35301, 0.6358346, 2.285836, 0, 0, 0, 1, 1,
1.362479, 0.9661373, 1.559005, 0, 0, 0, 1, 1,
1.362944, 0.6935274, 1.977044, 0, 0, 0, 1, 1,
1.363772, -1.410666, 0.8555745, 1, 1, 1, 1, 1,
1.371157, -0.138243, 3.245173, 1, 1, 1, 1, 1,
1.37294, 0.3954582, 1.9042, 1, 1, 1, 1, 1,
1.373486, 1.336761, 1.97955, 1, 1, 1, 1, 1,
1.375685, -0.1484682, 1.31562, 1, 1, 1, 1, 1,
1.382794, -1.067856, 1.083087, 1, 1, 1, 1, 1,
1.393821, 0.3267386, 2.854929, 1, 1, 1, 1, 1,
1.412187, -1.054901, 2.988427, 1, 1, 1, 1, 1,
1.414612, 0.4930693, 1.1291, 1, 1, 1, 1, 1,
1.41713, 0.2271972, 3.115602, 1, 1, 1, 1, 1,
1.41848, 0.1178209, 2.875647, 1, 1, 1, 1, 1,
1.431065, 0.3214628, 1.671518, 1, 1, 1, 1, 1,
1.441753, 0.2674193, 2.339411, 1, 1, 1, 1, 1,
1.442353, -0.3653744, 2.115934, 1, 1, 1, 1, 1,
1.443778, -0.2599918, 1.234889, 1, 1, 1, 1, 1,
1.448317, 0.4161222, 0.3929563, 0, 0, 1, 1, 1,
1.460943, 0.2356378, 1.76954, 1, 0, 0, 1, 1,
1.4645, 0.09750228, 0.3965441, 1, 0, 0, 1, 1,
1.464911, 1.371965, 0.9111958, 1, 0, 0, 1, 1,
1.467192, -1.471647, 0.5166595, 1, 0, 0, 1, 1,
1.468557, 0.5461366, 2.061095, 1, 0, 0, 1, 1,
1.469474, -0.8941236, 3.206066, 0, 0, 0, 1, 1,
1.472591, 0.6229993, 0.03928636, 0, 0, 0, 1, 1,
1.472732, -1.607251, 2.366298, 0, 0, 0, 1, 1,
1.476911, -0.2613823, 0.9413962, 0, 0, 0, 1, 1,
1.478823, -0.6141022, 2.427109, 0, 0, 0, 1, 1,
1.480539, 0.5933021, 2.004902, 0, 0, 0, 1, 1,
1.483707, -0.4115014, 2.529472, 0, 0, 0, 1, 1,
1.487826, 1.368806, 2.159447, 1, 1, 1, 1, 1,
1.496175, -1.350181, 3.712979, 1, 1, 1, 1, 1,
1.520085, 0.05510449, 1.857258, 1, 1, 1, 1, 1,
1.526376, 2.145554, 0.05803618, 1, 1, 1, 1, 1,
1.532478, 0.5615607, 1.142127, 1, 1, 1, 1, 1,
1.541954, -1.638406, 4.489498, 1, 1, 1, 1, 1,
1.577995, 0.8665365, 1.094399, 1, 1, 1, 1, 1,
1.58367, 1.25543, 2.200767, 1, 1, 1, 1, 1,
1.587171, -0.4627453, 0.6784949, 1, 1, 1, 1, 1,
1.590595, 0.9204968, 2.784832, 1, 1, 1, 1, 1,
1.595857, -0.9691864, 1.406746, 1, 1, 1, 1, 1,
1.611345, 0.7277559, 0.3972197, 1, 1, 1, 1, 1,
1.613292, -0.6855683, 2.561047, 1, 1, 1, 1, 1,
1.613307, -1.021792, 3.480691, 1, 1, 1, 1, 1,
1.61989, -1.558264, 2.425409, 1, 1, 1, 1, 1,
1.622072, 1.016124, 1.215529, 0, 0, 1, 1, 1,
1.631146, 0.2683481, 1.055128, 1, 0, 0, 1, 1,
1.641579, 0.05631398, 2.15547, 1, 0, 0, 1, 1,
1.666149, -0.2184013, 1.89664, 1, 0, 0, 1, 1,
1.69064, 0.4805178, 1.37742, 1, 0, 0, 1, 1,
1.714055, -0.2266129, 1.745833, 1, 0, 0, 1, 1,
1.716192, 2.582117, -0.231372, 0, 0, 0, 1, 1,
1.736601, -0.2628399, 2.094782, 0, 0, 0, 1, 1,
1.760486, 0.5722093, 0.348866, 0, 0, 0, 1, 1,
1.764735, 1.141565, 2.281682, 0, 0, 0, 1, 1,
1.766914, -1.523496, 2.890279, 0, 0, 0, 1, 1,
1.777913, -1.696449, 2.244868, 0, 0, 0, 1, 1,
1.787576, -0.1486605, 1.434716, 0, 0, 0, 1, 1,
1.788025, 0.8916417, 0.5419922, 1, 1, 1, 1, 1,
1.812848, 0.6141886, 1.720357, 1, 1, 1, 1, 1,
1.819462, 0.3068447, 1.72854, 1, 1, 1, 1, 1,
1.842244, 0.01302038, 0.155982, 1, 1, 1, 1, 1,
1.860782, 1.173091, 0.9757557, 1, 1, 1, 1, 1,
1.862599, 3.411107, -1.342028, 1, 1, 1, 1, 1,
1.875874, 0.1577348, 1.024843, 1, 1, 1, 1, 1,
1.879821, 0.02842962, 1.867903, 1, 1, 1, 1, 1,
1.894617, 0.3924125, 0.8887275, 1, 1, 1, 1, 1,
1.94475, -0.3002014, 1.034266, 1, 1, 1, 1, 1,
1.947117, 0.8406971, 3.021904, 1, 1, 1, 1, 1,
1.970067, -1.867394, 2.223327, 1, 1, 1, 1, 1,
1.984908, -0.7279531, 3.189465, 1, 1, 1, 1, 1,
1.993655, 1.035839, 1.047593, 1, 1, 1, 1, 1,
2.006441, 1.666679, 1.001284, 1, 1, 1, 1, 1,
2.014518, 0.1957732, 2.71207, 0, 0, 1, 1, 1,
2.035645, 1.152146, 0.6305529, 1, 0, 0, 1, 1,
2.077353, 0.5745785, 1.093938, 1, 0, 0, 1, 1,
2.07987, 0.98807, 0.03435706, 1, 0, 0, 1, 1,
2.104776, 0.3083704, 2.770904, 1, 0, 0, 1, 1,
2.113064, -1.419969, 1.548558, 1, 0, 0, 1, 1,
2.114412, -6.193856e-05, 0.1816775, 0, 0, 0, 1, 1,
2.118981, 0.3348032, 2.326789, 0, 0, 0, 1, 1,
2.124293, -0.0223324, 0.6847283, 0, 0, 0, 1, 1,
2.150989, 0.3541834, 3.03473, 0, 0, 0, 1, 1,
2.168454, -0.08200514, 3.617215, 0, 0, 0, 1, 1,
2.282559, -0.3309474, 1.661962, 0, 0, 0, 1, 1,
2.36429, 1.211361, 0.6788132, 0, 0, 0, 1, 1,
2.49392, 2.584852, 0.6688309, 1, 1, 1, 1, 1,
2.543836, -0.5492805, 0.7896509, 1, 1, 1, 1, 1,
2.83057, 0.9947948, 2.245296, 1, 1, 1, 1, 1,
2.950872, 0.02238876, 3.540648, 1, 1, 1, 1, 1,
3.09246, 0.2584273, 1.720456, 1, 1, 1, 1, 1,
3.26084, -1.97795, 4.322967, 1, 1, 1, 1, 1,
3.785082, 0.49868, -0.007273064, 1, 1, 1, 1, 1
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
var radius = 9.467095;
var distance = 33.25277;
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
mvMatrix.translate( -0.3709226, -0.4635568, 0.1927772 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.25277);
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