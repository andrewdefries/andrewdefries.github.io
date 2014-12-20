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
-2.886562, 0.1730507, -0.3281562, 1, 0, 0, 1,
-2.787004, 0.1613525, -2.436796, 1, 0.007843138, 0, 1,
-2.688658, 0.8575521, -0.8103604, 1, 0.01176471, 0, 1,
-2.566001, 1.808074, -0.04258255, 1, 0.01960784, 0, 1,
-2.556734, -0.5250096, -1.264564, 1, 0.02352941, 0, 1,
-2.542548, -1.235787, -1.616569, 1, 0.03137255, 0, 1,
-2.455543, -0.5369257, -2.915159, 1, 0.03529412, 0, 1,
-2.416935, -1.27285, -3.152875, 1, 0.04313726, 0, 1,
-2.415151, 1.089127, -1.732649, 1, 0.04705882, 0, 1,
-2.400688, 0.1732049, -1.79457, 1, 0.05490196, 0, 1,
-2.394666, -2.285785, -3.20735, 1, 0.05882353, 0, 1,
-2.352913, 0.3595354, -2.393308, 1, 0.06666667, 0, 1,
-2.341421, -0.1551267, -1.977437, 1, 0.07058824, 0, 1,
-2.311534, 2.062299, -0.9044859, 1, 0.07843138, 0, 1,
-2.276106, -0.3073944, -2.55584, 1, 0.08235294, 0, 1,
-2.212568, -0.6141776, -4.509725, 1, 0.09019608, 0, 1,
-2.212334, -0.3665528, -1.208965, 1, 0.09411765, 0, 1,
-2.130059, -0.07394559, -0.9636676, 1, 0.1019608, 0, 1,
-2.126707, 0.3910933, -1.334248, 1, 0.1098039, 0, 1,
-2.121549, -0.003700603, -1.14989, 1, 0.1137255, 0, 1,
-2.074592, 0.009970339, -0.6741695, 1, 0.1215686, 0, 1,
-2.071771, 0.397657, -2.263508, 1, 0.1254902, 0, 1,
-2.071231, 0.7542923, -1.973575, 1, 0.1333333, 0, 1,
-2.049831, 0.9261411, -0.9261425, 1, 0.1372549, 0, 1,
-2.004577, -0.2749526, -0.864931, 1, 0.145098, 0, 1,
-1.988764, 1.792443, -2.131518, 1, 0.1490196, 0, 1,
-1.977366, -1.092621, -2.710899, 1, 0.1568628, 0, 1,
-1.962295, -1.11387, -4.238963, 1, 0.1607843, 0, 1,
-1.947617, -0.7452203, -0.1857236, 1, 0.1686275, 0, 1,
-1.928059, 0.4400902, -2.234456, 1, 0.172549, 0, 1,
-1.899003, 0.007644232, -2.983612, 1, 0.1803922, 0, 1,
-1.885832, 0.5621312, 0.3865432, 1, 0.1843137, 0, 1,
-1.877581, -1.207741, -0.9348161, 1, 0.1921569, 0, 1,
-1.870729, -0.4105997, -2.214637, 1, 0.1960784, 0, 1,
-1.86546, 0.9102585, -0.318545, 1, 0.2039216, 0, 1,
-1.865232, -1.089994, -3.316448, 1, 0.2117647, 0, 1,
-1.857996, 1.129862, -3.649755, 1, 0.2156863, 0, 1,
-1.846624, -0.6809913, -1.151065, 1, 0.2235294, 0, 1,
-1.840836, -0.9390577, -2.100302, 1, 0.227451, 0, 1,
-1.840192, 0.3091164, -1.691922, 1, 0.2352941, 0, 1,
-1.825112, 0.6946492, -2.150689, 1, 0.2392157, 0, 1,
-1.816861, -0.8185146, -3.39852, 1, 0.2470588, 0, 1,
-1.794786, -1.194155, -4.187129, 1, 0.2509804, 0, 1,
-1.788185, 3.059678, 1.610586, 1, 0.2588235, 0, 1,
-1.784975, 0.1453247, -3.014799, 1, 0.2627451, 0, 1,
-1.780406, 0.7832133, -0.1073198, 1, 0.2705882, 0, 1,
-1.776911, 0.3161041, -0.4135004, 1, 0.2745098, 0, 1,
-1.763036, -0.9356086, -2.286868, 1, 0.282353, 0, 1,
-1.760879, -1.266564, -2.182453, 1, 0.2862745, 0, 1,
-1.750883, 0.7025626, -0.6625293, 1, 0.2941177, 0, 1,
-1.749464, 0.1557689, -1.925056, 1, 0.3019608, 0, 1,
-1.738663, -0.006055775, -0.3705462, 1, 0.3058824, 0, 1,
-1.737689, -0.6643161, -1.960963, 1, 0.3137255, 0, 1,
-1.713996, 0.7414836, -0.6869438, 1, 0.3176471, 0, 1,
-1.693509, -0.1278854, 0.52696, 1, 0.3254902, 0, 1,
-1.670431, 0.7821285, -2.729695, 1, 0.3294118, 0, 1,
-1.656739, -1.951522, -2.928628, 1, 0.3372549, 0, 1,
-1.652806, -0.8028808, -2.536344, 1, 0.3411765, 0, 1,
-1.641937, 0.5707566, -0.3721581, 1, 0.3490196, 0, 1,
-1.629156, 0.2577158, -1.246721, 1, 0.3529412, 0, 1,
-1.628884, 0.4400568, -1.017637, 1, 0.3607843, 0, 1,
-1.611371, 2.025699, -2.039184, 1, 0.3647059, 0, 1,
-1.595127, 0.2397477, -0.7681014, 1, 0.372549, 0, 1,
-1.594781, 1.825638, -1.151159, 1, 0.3764706, 0, 1,
-1.594708, 0.3759706, -1.332698, 1, 0.3843137, 0, 1,
-1.577542, 0.5000685, -1.280484, 1, 0.3882353, 0, 1,
-1.572463, 1.09416, 0.08950657, 1, 0.3960784, 0, 1,
-1.557264, 0.03306672, -1.40777, 1, 0.4039216, 0, 1,
-1.551243, -1.157531, -1.381023, 1, 0.4078431, 0, 1,
-1.54885, -0.08174346, -0.679367, 1, 0.4156863, 0, 1,
-1.540436, 0.690407, -3.003802, 1, 0.4196078, 0, 1,
-1.53962, -0.9860779, -1.400819, 1, 0.427451, 0, 1,
-1.521164, -2.156369, -3.243879, 1, 0.4313726, 0, 1,
-1.519519, 0.2328541, -2.458728, 1, 0.4392157, 0, 1,
-1.506898, -1.478401, -3.554657, 1, 0.4431373, 0, 1,
-1.493067, -0.1505926, -0.9433354, 1, 0.4509804, 0, 1,
-1.466518, -1.162404, -1.684572, 1, 0.454902, 0, 1,
-1.461011, -0.1609512, 0.04909789, 1, 0.4627451, 0, 1,
-1.449571, -0.2712765, -1.430957, 1, 0.4666667, 0, 1,
-1.430864, -1.270423, -3.098601, 1, 0.4745098, 0, 1,
-1.43027, 0.3361313, -0.2686365, 1, 0.4784314, 0, 1,
-1.413942, -1.607775, -2.005871, 1, 0.4862745, 0, 1,
-1.410141, -0.3371862, -1.4186, 1, 0.4901961, 0, 1,
-1.408192, 3.658383, -1.365258, 1, 0.4980392, 0, 1,
-1.388525, 0.4366788, -1.28864, 1, 0.5058824, 0, 1,
-1.386331, -0.7891286, -4.457168, 1, 0.509804, 0, 1,
-1.378621, 2.360078, -1.788092, 1, 0.5176471, 0, 1,
-1.37421, -0.2141801, -3.275505, 1, 0.5215687, 0, 1,
-1.37356, -1.182566, -2.429777, 1, 0.5294118, 0, 1,
-1.365658, -0.4725388, -2.369923, 1, 0.5333334, 0, 1,
-1.353914, 0.7482595, -1.469786, 1, 0.5411765, 0, 1,
-1.352471, 0.405515, -0.1283168, 1, 0.5450981, 0, 1,
-1.351232, -0.2878548, -2.275325, 1, 0.5529412, 0, 1,
-1.343023, 0.246851, -0.5172684, 1, 0.5568628, 0, 1,
-1.332832, 0.5878156, -1.631746, 1, 0.5647059, 0, 1,
-1.319386, 1.324683, 0.9966221, 1, 0.5686275, 0, 1,
-1.316659, 0.6515059, -0.920101, 1, 0.5764706, 0, 1,
-1.315995, 1.293149, -1.095442, 1, 0.5803922, 0, 1,
-1.287951, -0.32104, -1.958367, 1, 0.5882353, 0, 1,
-1.28506, -1.799301, -3.830513, 1, 0.5921569, 0, 1,
-1.280499, 0.1602179, -1.057508, 1, 0.6, 0, 1,
-1.272518, -0.4690445, -3.301389, 1, 0.6078432, 0, 1,
-1.266408, 0.7255961, -1.297549, 1, 0.6117647, 0, 1,
-1.26531, -2.345666, -2.055664, 1, 0.6196079, 0, 1,
-1.255008, 1.315581, 0.09424336, 1, 0.6235294, 0, 1,
-1.254594, -0.315062, -1.043149, 1, 0.6313726, 0, 1,
-1.246867, 0.8012059, -1.45193, 1, 0.6352941, 0, 1,
-1.246614, -0.9898043, -2.379972, 1, 0.6431373, 0, 1,
-1.234516, 1.440481, -2.139504, 1, 0.6470588, 0, 1,
-1.229609, -1.415104, -2.50525, 1, 0.654902, 0, 1,
-1.22717, 0.8958045, -0.888274, 1, 0.6588235, 0, 1,
-1.221628, -1.196236, -1.676453, 1, 0.6666667, 0, 1,
-1.214159, -0.6910021, -1.388827, 1, 0.6705883, 0, 1,
-1.202514, -0.2882009, -0.6700009, 1, 0.6784314, 0, 1,
-1.199088, -1.929079, -2.334921, 1, 0.682353, 0, 1,
-1.194457, 0.3751248, -1.946202, 1, 0.6901961, 0, 1,
-1.188375, 1.448783, -1.767416, 1, 0.6941177, 0, 1,
-1.187017, 0.7353242, -0.5323147, 1, 0.7019608, 0, 1,
-1.174022, 0.925894, -0.7531174, 1, 0.7098039, 0, 1,
-1.168705, -0.3595613, -1.329281, 1, 0.7137255, 0, 1,
-1.167564, 1.656291, -0.08500624, 1, 0.7215686, 0, 1,
-1.164289, 0.6972821, -1.436898, 1, 0.7254902, 0, 1,
-1.162798, -0.7937245, -0.151013, 1, 0.7333333, 0, 1,
-1.162744, 0.9408485, -0.8936047, 1, 0.7372549, 0, 1,
-1.152215, -0.1548201, -3.33319, 1, 0.7450981, 0, 1,
-1.151756, -0.9766296, -3.056934, 1, 0.7490196, 0, 1,
-1.151744, -0.3060763, -2.952008, 1, 0.7568628, 0, 1,
-1.144789, -0.5054176, -2.294771, 1, 0.7607843, 0, 1,
-1.140625, 2.005617, -1.203604, 1, 0.7686275, 0, 1,
-1.138327, 0.08222166, -1.32287, 1, 0.772549, 0, 1,
-1.132067, 1.753612, -0.1143217, 1, 0.7803922, 0, 1,
-1.131622, 0.1449256, -2.814889, 1, 0.7843137, 0, 1,
-1.127792, -0.3260093, 0.7459008, 1, 0.7921569, 0, 1,
-1.123935, -1.281606, -2.893276, 1, 0.7960784, 0, 1,
-1.123374, 2.100374, -1.375425, 1, 0.8039216, 0, 1,
-1.121561, -0.9216731, -1.913694, 1, 0.8117647, 0, 1,
-1.115822, 0.233129, -0.01521027, 1, 0.8156863, 0, 1,
-1.112235, -0.4907279, -3.42159, 1, 0.8235294, 0, 1,
-1.108286, -0.1687195, -3.366726, 1, 0.827451, 0, 1,
-1.10612, -1.354075, -1.446586, 1, 0.8352941, 0, 1,
-1.102489, -1.036737, -2.967216, 1, 0.8392157, 0, 1,
-1.09859, -0.6033949, -1.585655, 1, 0.8470588, 0, 1,
-1.090204, 0.1081662, -2.154571, 1, 0.8509804, 0, 1,
-1.086787, 0.4637619, -1.177566, 1, 0.8588235, 0, 1,
-1.083407, -1.020638, -2.515436, 1, 0.8627451, 0, 1,
-1.083261, 1.874979, 0.002306154, 1, 0.8705882, 0, 1,
-1.076675, -0.9615308, -1.613365, 1, 0.8745098, 0, 1,
-1.076039, -0.4719947, -4.003788, 1, 0.8823529, 0, 1,
-1.065396, 1.784759, -1.642157, 1, 0.8862745, 0, 1,
-1.064589, 1.359581, -0.3373327, 1, 0.8941177, 0, 1,
-1.062856, 0.5640863, -1.290665, 1, 0.8980392, 0, 1,
-1.060254, 0.07617348, -2.60221, 1, 0.9058824, 0, 1,
-1.051284, -0.08777066, 0.3659627, 1, 0.9137255, 0, 1,
-1.050691, -0.2810099, -0.9839796, 1, 0.9176471, 0, 1,
-1.048238, 0.1197196, -0.4624812, 1, 0.9254902, 0, 1,
-1.047563, 2.291113, -1.539017, 1, 0.9294118, 0, 1,
-1.043039, -0.3661218, -1.034203, 1, 0.9372549, 0, 1,
-1.040942, -0.01402277, -2.042628, 1, 0.9411765, 0, 1,
-1.038009, -0.6901736, -2.997763, 1, 0.9490196, 0, 1,
-1.031776, 1.693375, -0.05245786, 1, 0.9529412, 0, 1,
-1.030583, 0.4233329, -1.2694, 1, 0.9607843, 0, 1,
-1.020875, 0.9452811, -0.8488871, 1, 0.9647059, 0, 1,
-1.016869, 0.2139813, -0.984421, 1, 0.972549, 0, 1,
-1.010572, 1.700709, -0.650925, 1, 0.9764706, 0, 1,
-1.000554, -1.063459, -1.596843, 1, 0.9843137, 0, 1,
-0.995544, -0.7653584, -0.8086545, 1, 0.9882353, 0, 1,
-0.9939343, 1.506997, 0.1613905, 1, 0.9960784, 0, 1,
-0.983259, 0.2175066, -0.5082953, 0.9960784, 1, 0, 1,
-0.9786854, 0.1859931, -1.279946, 0.9921569, 1, 0, 1,
-0.9713225, 0.3791167, 0.6847733, 0.9843137, 1, 0, 1,
-0.958681, 0.2938637, -1.475927, 0.9803922, 1, 0, 1,
-0.9542428, -0.09062593, -1.542714, 0.972549, 1, 0, 1,
-0.9540441, 1.085851, -0.1598718, 0.9686275, 1, 0, 1,
-0.9434585, 1.04988, -0.7764075, 0.9607843, 1, 0, 1,
-0.9410599, 0.3717777, -3.231995, 0.9568627, 1, 0, 1,
-0.9324024, -1.678939, -3.525519, 0.9490196, 1, 0, 1,
-0.9295197, -1.169327, -3.115802, 0.945098, 1, 0, 1,
-0.9291677, -0.9560903, -0.1324643, 0.9372549, 1, 0, 1,
-0.9290146, 0.4030361, -0.3653717, 0.9333333, 1, 0, 1,
-0.9243385, -0.5887117, -2.116343, 0.9254902, 1, 0, 1,
-0.9221147, -1.508053, -2.878212, 0.9215686, 1, 0, 1,
-0.9139227, 1.700009, -0.3316565, 0.9137255, 1, 0, 1,
-0.9100897, 0.2341963, 0.4540937, 0.9098039, 1, 0, 1,
-0.9059125, 0.8773181, -0.6992081, 0.9019608, 1, 0, 1,
-0.9049684, -0.4030211, -2.33138, 0.8941177, 1, 0, 1,
-0.9021979, 0.5635462, -1.663811, 0.8901961, 1, 0, 1,
-0.9011489, -0.1365642, -1.403065, 0.8823529, 1, 0, 1,
-0.8992182, -0.4249973, -0.6550319, 0.8784314, 1, 0, 1,
-0.8962098, -0.07288482, -0.4729199, 0.8705882, 1, 0, 1,
-0.8886652, -0.6090178, -3.322596, 0.8666667, 1, 0, 1,
-0.8861651, 1.576059, -0.522391, 0.8588235, 1, 0, 1,
-0.886032, -0.7443351, -1.528887, 0.854902, 1, 0, 1,
-0.8848646, 0.5240342, -1.278285, 0.8470588, 1, 0, 1,
-0.882813, 0.04698204, -1.30392, 0.8431373, 1, 0, 1,
-0.8793406, 1.201664, 0.009886703, 0.8352941, 1, 0, 1,
-0.8651868, -1.360266, -2.799477, 0.8313726, 1, 0, 1,
-0.8603773, 1.019426, -1.203038, 0.8235294, 1, 0, 1,
-0.8528937, -0.1925134, -1.281984, 0.8196079, 1, 0, 1,
-0.8477191, -0.6460971, -2.150661, 0.8117647, 1, 0, 1,
-0.84646, 1.279782, -0.5466104, 0.8078431, 1, 0, 1,
-0.8417791, -0.618384, -1.553984, 0.8, 1, 0, 1,
-0.8404211, 1.092056, 0.4737397, 0.7921569, 1, 0, 1,
-0.8381864, -0.2484671, -2.061759, 0.7882353, 1, 0, 1,
-0.83683, 0.1378327, -1.046949, 0.7803922, 1, 0, 1,
-0.8298922, 0.4371381, -1.237779, 0.7764706, 1, 0, 1,
-0.8265491, 1.312946, 0.08481594, 0.7686275, 1, 0, 1,
-0.8256314, 0.01538657, -0.525122, 0.7647059, 1, 0, 1,
-0.8139479, 0.5037, -0.6350796, 0.7568628, 1, 0, 1,
-0.8131683, 1.929408, 0.3652199, 0.7529412, 1, 0, 1,
-0.8005853, -0.162738, -0.1462667, 0.7450981, 1, 0, 1,
-0.7954773, -0.3794939, -0.9512745, 0.7411765, 1, 0, 1,
-0.7945608, 0.5426882, -0.1582927, 0.7333333, 1, 0, 1,
-0.7865471, -0.6526519, -3.801563, 0.7294118, 1, 0, 1,
-0.7858908, 0.2992759, -1.910441, 0.7215686, 1, 0, 1,
-0.7849417, 1.064576, 1.030188, 0.7176471, 1, 0, 1,
-0.782476, 0.7697954, -0.4680751, 0.7098039, 1, 0, 1,
-0.7809861, 0.8805144, -2.298171, 0.7058824, 1, 0, 1,
-0.775192, 1.211068, -2.213392, 0.6980392, 1, 0, 1,
-0.7616295, 0.08498382, -1.251831, 0.6901961, 1, 0, 1,
-0.7580932, 0.7643099, -1.832379, 0.6862745, 1, 0, 1,
-0.7579011, 1.066698, -1.438283, 0.6784314, 1, 0, 1,
-0.7570444, -0.6600991, -1.612204, 0.6745098, 1, 0, 1,
-0.7546297, -1.095537, -0.9341898, 0.6666667, 1, 0, 1,
-0.7533454, -2.039977, -2.60424, 0.6627451, 1, 0, 1,
-0.7475232, 0.7048524, -2.57553, 0.654902, 1, 0, 1,
-0.7446897, 0.9902157, -0.00655303, 0.6509804, 1, 0, 1,
-0.7440751, 0.1425479, -2.074911, 0.6431373, 1, 0, 1,
-0.7404571, -2.821209, -4.38167, 0.6392157, 1, 0, 1,
-0.7358998, -1.341184, -3.074044, 0.6313726, 1, 0, 1,
-0.7284751, -0.2481222, -0.8396228, 0.627451, 1, 0, 1,
-0.7237527, 1.063168, -0.3463305, 0.6196079, 1, 0, 1,
-0.7207972, 0.6792244, 0.3490858, 0.6156863, 1, 0, 1,
-0.7163907, -0.8874272, -2.414952, 0.6078432, 1, 0, 1,
-0.7139383, -0.4944423, -4.269753, 0.6039216, 1, 0, 1,
-0.7115659, 0.7359217, -0.0664808, 0.5960785, 1, 0, 1,
-0.706989, -0.225441, -1.083382, 0.5882353, 1, 0, 1,
-0.7007796, -0.376789, -0.7362711, 0.5843138, 1, 0, 1,
-0.7000888, -0.8974904, -2.152783, 0.5764706, 1, 0, 1,
-0.6997956, 0.5625926, -2.621313, 0.572549, 1, 0, 1,
-0.6997017, 0.450341, -2.148282, 0.5647059, 1, 0, 1,
-0.687431, 0.264347, -1.834384, 0.5607843, 1, 0, 1,
-0.6836697, 0.6445511, -1.067046, 0.5529412, 1, 0, 1,
-0.6801097, 0.2281412, -2.679412, 0.5490196, 1, 0, 1,
-0.6747749, 0.6899081, -1.411023, 0.5411765, 1, 0, 1,
-0.6655572, -0.5204431, -4.459719, 0.5372549, 1, 0, 1,
-0.6637105, 1.323428, 0.855793, 0.5294118, 1, 0, 1,
-0.6631058, 2.061396, -1.792301, 0.5254902, 1, 0, 1,
-0.6609796, 2.107404, -0.2059952, 0.5176471, 1, 0, 1,
-0.6586363, 0.548887, -1.301878, 0.5137255, 1, 0, 1,
-0.652789, -1.04979, -4.092322, 0.5058824, 1, 0, 1,
-0.647707, -0.6881062, -2.053696, 0.5019608, 1, 0, 1,
-0.6398226, -1.516217, -4.591998, 0.4941176, 1, 0, 1,
-0.6368292, 0.2244529, -1.820729, 0.4862745, 1, 0, 1,
-0.6347613, -0.7994961, -2.427184, 0.4823529, 1, 0, 1,
-0.6342604, -0.03123252, -0.644267, 0.4745098, 1, 0, 1,
-0.6325256, -1.345634, -1.376371, 0.4705882, 1, 0, 1,
-0.6192036, 1.809328, 0.7786477, 0.4627451, 1, 0, 1,
-0.6173921, -0.887935, -1.343047, 0.4588235, 1, 0, 1,
-0.6040086, 0.4771176, -1.71276, 0.4509804, 1, 0, 1,
-0.6032387, 0.4497158, -0.1188905, 0.4470588, 1, 0, 1,
-0.5994554, -0.405108, -1.512025, 0.4392157, 1, 0, 1,
-0.5883145, -0.3389853, -3.115164, 0.4352941, 1, 0, 1,
-0.5876589, 0.3413799, 0.7624421, 0.427451, 1, 0, 1,
-0.5863824, 0.8876797, 0.1351284, 0.4235294, 1, 0, 1,
-0.5826916, -1.390168, -3.452761, 0.4156863, 1, 0, 1,
-0.5806354, 0.7042362, -0.8523774, 0.4117647, 1, 0, 1,
-0.5778161, -1.024732, -4.395592, 0.4039216, 1, 0, 1,
-0.5726723, -0.3519155, -3.00088, 0.3960784, 1, 0, 1,
-0.5712714, 1.87012, -1.267264, 0.3921569, 1, 0, 1,
-0.5644553, 0.2844758, -2.973684, 0.3843137, 1, 0, 1,
-0.5612407, -0.1949811, -1.836045, 0.3803922, 1, 0, 1,
-0.5554224, -0.4299741, -0.5105657, 0.372549, 1, 0, 1,
-0.5546992, 0.7159606, -0.3245404, 0.3686275, 1, 0, 1,
-0.5534995, -1.023258, -3.32554, 0.3607843, 1, 0, 1,
-0.5510634, 0.4507315, -1.233227, 0.3568628, 1, 0, 1,
-0.5464171, 0.623893, -1.114776, 0.3490196, 1, 0, 1,
-0.5404453, -2.065077, -1.742959, 0.345098, 1, 0, 1,
-0.5338261, -0.3554355, -2.359867, 0.3372549, 1, 0, 1,
-0.5335539, -0.6604605, -2.864906, 0.3333333, 1, 0, 1,
-0.5317085, 1.347318, -1.056629, 0.3254902, 1, 0, 1,
-0.5288448, -1.31003, -2.023721, 0.3215686, 1, 0, 1,
-0.5275704, -0.7144128, -2.720056, 0.3137255, 1, 0, 1,
-0.5138059, 0.1779571, -1.599419, 0.3098039, 1, 0, 1,
-0.5134875, 0.3830509, -1.153997, 0.3019608, 1, 0, 1,
-0.5114331, -1.097002, -3.30533, 0.2941177, 1, 0, 1,
-0.5114261, -0.1227799, -0.5803136, 0.2901961, 1, 0, 1,
-0.5017305, -0.6257948, -3.458782, 0.282353, 1, 0, 1,
-0.4982376, -1.013727, -2.741022, 0.2784314, 1, 0, 1,
-0.4975661, 0.7641492, -1.020052, 0.2705882, 1, 0, 1,
-0.4953669, 1.315836, -0.3493444, 0.2666667, 1, 0, 1,
-0.4929666, 0.4015859, -1.875437, 0.2588235, 1, 0, 1,
-0.489482, 0.861691, -1.671552, 0.254902, 1, 0, 1,
-0.4864517, -1.602332, -0.05285366, 0.2470588, 1, 0, 1,
-0.481255, -0.8685576, -3.428068, 0.2431373, 1, 0, 1,
-0.4707662, -1.048295, -1.295816, 0.2352941, 1, 0, 1,
-0.469629, 0.4988423, -1.056723, 0.2313726, 1, 0, 1,
-0.4661115, -0.08997349, -1.710403, 0.2235294, 1, 0, 1,
-0.4657947, -3.175434, -2.474764, 0.2196078, 1, 0, 1,
-0.4643698, -1.394964, -2.882146, 0.2117647, 1, 0, 1,
-0.4633248, 0.1316198, -0.8113118, 0.2078431, 1, 0, 1,
-0.4605332, -0.971724, -2.55367, 0.2, 1, 0, 1,
-0.4603467, -0.4684468, -1.245078, 0.1921569, 1, 0, 1,
-0.4591749, -1.082354, -2.591999, 0.1882353, 1, 0, 1,
-0.4589899, -0.9873582, -2.710607, 0.1803922, 1, 0, 1,
-0.4583753, 0.8182954, -0.6868033, 0.1764706, 1, 0, 1,
-0.4579463, -0.607905, -1.397589, 0.1686275, 1, 0, 1,
-0.4566344, 0.865243, -2.415671, 0.1647059, 1, 0, 1,
-0.4481928, -1.172856, -3.004636, 0.1568628, 1, 0, 1,
-0.4347011, -0.7329823, -0.8622847, 0.1529412, 1, 0, 1,
-0.4295743, -3.266637, -2.065104, 0.145098, 1, 0, 1,
-0.4285591, -0.2949168, -2.123274, 0.1411765, 1, 0, 1,
-0.4282819, 0.7309953, -1.121043, 0.1333333, 1, 0, 1,
-0.4242643, -0.07372363, -1.507452, 0.1294118, 1, 0, 1,
-0.4199463, -0.2480443, -2.775883, 0.1215686, 1, 0, 1,
-0.419849, -0.6137544, -3.008552, 0.1176471, 1, 0, 1,
-0.4168068, 0.3984652, -0.222763, 0.1098039, 1, 0, 1,
-0.4146783, 0.9087265, 1.464144, 0.1058824, 1, 0, 1,
-0.4127094, 0.6470826, 0.9020471, 0.09803922, 1, 0, 1,
-0.411297, -1.231058, -3.634592, 0.09019608, 1, 0, 1,
-0.4054662, -1.139596, -3.262351, 0.08627451, 1, 0, 1,
-0.4016695, 0.2291366, -0.6435929, 0.07843138, 1, 0, 1,
-0.3975347, -1.097155, -2.702298, 0.07450981, 1, 0, 1,
-0.3940185, 1.08191, 1.20159, 0.06666667, 1, 0, 1,
-0.3936159, -1.373513, -3.125025, 0.0627451, 1, 0, 1,
-0.3929735, -0.419678, -1.691696, 0.05490196, 1, 0, 1,
-0.3908707, 0.03709876, -2.097389, 0.05098039, 1, 0, 1,
-0.3857903, -0.5601948, -3.045967, 0.04313726, 1, 0, 1,
-0.3803561, -0.4411605, -3.87398, 0.03921569, 1, 0, 1,
-0.3754065, 0.0519604, -0.4830304, 0.03137255, 1, 0, 1,
-0.3732117, 0.3446769, -2.274584, 0.02745098, 1, 0, 1,
-0.3688447, -0.1135869, -3.187391, 0.01960784, 1, 0, 1,
-0.3669813, 1.126728, -0.2272635, 0.01568628, 1, 0, 1,
-0.366028, -0.7511398, -3.28635, 0.007843138, 1, 0, 1,
-0.3648809, 0.2743991, 0.8412737, 0.003921569, 1, 0, 1,
-0.3638731, -1.093071, -4.602822, 0, 1, 0.003921569, 1,
-0.361506, -0.05584648, -1.489594, 0, 1, 0.01176471, 1,
-0.3603853, -1.426065, -1.93621, 0, 1, 0.01568628, 1,
-0.3594366, -0.06288384, -2.910082, 0, 1, 0.02352941, 1,
-0.3585571, -0.02327728, -1.767027, 0, 1, 0.02745098, 1,
-0.3579197, 0.2105794, -0.5692093, 0, 1, 0.03529412, 1,
-0.356209, -0.4906573, -1.558602, 0, 1, 0.03921569, 1,
-0.355224, 0.1029528, -1.176116, 0, 1, 0.04705882, 1,
-0.3532719, -0.005986741, -3.4061, 0, 1, 0.05098039, 1,
-0.3516349, 0.1829209, -2.579605, 0, 1, 0.05882353, 1,
-0.3467975, 1.300217, 0.08314399, 0, 1, 0.0627451, 1,
-0.3445456, 0.760411, -0.596523, 0, 1, 0.07058824, 1,
-0.3355221, 0.4570084, -0.2635922, 0, 1, 0.07450981, 1,
-0.3309082, 1.451992, 0.9867361, 0, 1, 0.08235294, 1,
-0.3305363, -0.5652879, -3.58489, 0, 1, 0.08627451, 1,
-0.3268686, 2.032763, -0.1796479, 0, 1, 0.09411765, 1,
-0.3245034, -1.050932, -1.262034, 0, 1, 0.1019608, 1,
-0.3234794, -0.6754869, -2.873873, 0, 1, 0.1058824, 1,
-0.3191654, -1.251947, -2.19047, 0, 1, 0.1137255, 1,
-0.3185208, -0.06863795, -3.18089, 0, 1, 0.1176471, 1,
-0.3172818, -1.062725, -2.337843, 0, 1, 0.1254902, 1,
-0.3165653, -0.3802315, -3.954024, 0, 1, 0.1294118, 1,
-0.3018276, 0.4699825, -1.3655, 0, 1, 0.1372549, 1,
-0.3008851, -0.08410551, -2.252678, 0, 1, 0.1411765, 1,
-0.2949813, -1.425752, -3.874369, 0, 1, 0.1490196, 1,
-0.2896062, 0.8758116, -0.5954049, 0, 1, 0.1529412, 1,
-0.2883243, -0.7821851, -2.830492, 0, 1, 0.1607843, 1,
-0.2823319, -0.1161117, -1.816712, 0, 1, 0.1647059, 1,
-0.2798823, -0.6022824, -3.338314, 0, 1, 0.172549, 1,
-0.2798388, 1.222401, 0.9012566, 0, 1, 0.1764706, 1,
-0.2797984, 0.9810479, -0.4553475, 0, 1, 0.1843137, 1,
-0.2791668, 0.8185824, 0.2834412, 0, 1, 0.1882353, 1,
-0.2789076, -0.8531137, -1.582591, 0, 1, 0.1960784, 1,
-0.2755383, -0.5354931, -2.738626, 0, 1, 0.2039216, 1,
-0.2739854, 0.09224527, 0.460894, 0, 1, 0.2078431, 1,
-0.2739588, -0.2867877, -3.285925, 0, 1, 0.2156863, 1,
-0.273684, 1.480559, -0.8786429, 0, 1, 0.2196078, 1,
-0.2707829, 0.4700677, -0.7338376, 0, 1, 0.227451, 1,
-0.2703433, 0.1565822, -1.527497, 0, 1, 0.2313726, 1,
-0.2687903, -0.3861205, -1.557901, 0, 1, 0.2392157, 1,
-0.2682466, -0.8719648, -2.01815, 0, 1, 0.2431373, 1,
-0.2678809, -1.250811, -1.26276, 0, 1, 0.2509804, 1,
-0.2652782, 1.184467, -0.1739437, 0, 1, 0.254902, 1,
-0.2627559, 0.5447084, -2.174151, 0, 1, 0.2627451, 1,
-0.2587372, -0.656947, -1.66584, 0, 1, 0.2666667, 1,
-0.2583914, 1.395479, -0.1381365, 0, 1, 0.2745098, 1,
-0.2560378, -1.077412, -3.947127, 0, 1, 0.2784314, 1,
-0.2552364, -0.8598402, -1.304519, 0, 1, 0.2862745, 1,
-0.2521048, -1.232523, -2.8663, 0, 1, 0.2901961, 1,
-0.2492714, 0.8827809, 0.1477241, 0, 1, 0.2980392, 1,
-0.2474028, 1.174609, -0.1406048, 0, 1, 0.3058824, 1,
-0.2369254, -0.2156478, -2.527464, 0, 1, 0.3098039, 1,
-0.2310151, -0.9178312, -4.109089, 0, 1, 0.3176471, 1,
-0.2262958, 0.2094335, -0.2532946, 0, 1, 0.3215686, 1,
-0.2241717, 0.1610537, 0.4766679, 0, 1, 0.3294118, 1,
-0.2235392, 0.1266592, 0.1737161, 0, 1, 0.3333333, 1,
-0.2223428, 1.006815, 0.5075729, 0, 1, 0.3411765, 1,
-0.2200541, 0.2627339, 0.09764116, 0, 1, 0.345098, 1,
-0.2171212, -0.6170787, -1.765427, 0, 1, 0.3529412, 1,
-0.2135144, 1.351447, 1.46383, 0, 1, 0.3568628, 1,
-0.2119099, 0.8811404, 0.471632, 0, 1, 0.3647059, 1,
-0.2109272, 0.4109504, -0.4992959, 0, 1, 0.3686275, 1,
-0.2106208, 2.910801, 1.154696, 0, 1, 0.3764706, 1,
-0.2092522, -1.22751, -2.199343, 0, 1, 0.3803922, 1,
-0.2030104, 0.1069624, -1.663189, 0, 1, 0.3882353, 1,
-0.2023905, -1.869496, -2.278368, 0, 1, 0.3921569, 1,
-0.1992682, -1.257171, -3.5253, 0, 1, 0.4, 1,
-0.1952255, -0.208113, -1.717841, 0, 1, 0.4078431, 1,
-0.1950277, 0.7939119, -0.8639953, 0, 1, 0.4117647, 1,
-0.1918726, 0.3140624, -1.859333, 0, 1, 0.4196078, 1,
-0.190109, -1.106153, -2.697951, 0, 1, 0.4235294, 1,
-0.1869987, 0.100423, -2.190943, 0, 1, 0.4313726, 1,
-0.183179, 0.8005943, -0.07512185, 0, 1, 0.4352941, 1,
-0.1774287, 2.233463, -1.581022, 0, 1, 0.4431373, 1,
-0.1764666, -0.8034639, -1.498108, 0, 1, 0.4470588, 1,
-0.1729725, -1.184083, -2.159573, 0, 1, 0.454902, 1,
-0.1717513, -0.7614649, -4.724273, 0, 1, 0.4588235, 1,
-0.1684896, -0.9966087, -4.515053, 0, 1, 0.4666667, 1,
-0.1664494, 0.8639265, 1.231982, 0, 1, 0.4705882, 1,
-0.1654391, 0.4830147, 2.003133, 0, 1, 0.4784314, 1,
-0.1625045, -2.87029, -3.170237, 0, 1, 0.4823529, 1,
-0.1579859, 0.2344205, 0.09273142, 0, 1, 0.4901961, 1,
-0.1502319, 1.323789, 0.8630235, 0, 1, 0.4941176, 1,
-0.1470728, -1.783311, -3.103091, 0, 1, 0.5019608, 1,
-0.1466471, 0.9126221, -1.189978, 0, 1, 0.509804, 1,
-0.1452563, 0.2835255, -0.5408326, 0, 1, 0.5137255, 1,
-0.1409894, 0.4087625, 0.2349588, 0, 1, 0.5215687, 1,
-0.1401892, 1.227772, -1.593343, 0, 1, 0.5254902, 1,
-0.1395319, 1.332879, -1.328719, 0, 1, 0.5333334, 1,
-0.1354623, -0.8705438, -3.641515, 0, 1, 0.5372549, 1,
-0.1350257, 0.6756191, 0.4933348, 0, 1, 0.5450981, 1,
-0.1327749, 0.3313363, 0.5980247, 0, 1, 0.5490196, 1,
-0.1307619, -1.173177, -4.286251, 0, 1, 0.5568628, 1,
-0.130312, -0.2075781, -2.874023, 0, 1, 0.5607843, 1,
-0.1262295, 0.3791785, -1.068386, 0, 1, 0.5686275, 1,
-0.1246971, 1.023101, 0.9480349, 0, 1, 0.572549, 1,
-0.1235751, -0.05973845, -2.316445, 0, 1, 0.5803922, 1,
-0.1216075, -0.3185122, -2.001752, 0, 1, 0.5843138, 1,
-0.1174978, 0.1802138, -1.375476, 0, 1, 0.5921569, 1,
-0.115554, -0.626324, -3.218084, 0, 1, 0.5960785, 1,
-0.1143479, 0.187331, -3.448061, 0, 1, 0.6039216, 1,
-0.1140788, 0.8642017, -0.09993422, 0, 1, 0.6117647, 1,
-0.1119226, 2.291463, -0.8492872, 0, 1, 0.6156863, 1,
-0.1114799, 0.1219912, -0.4507076, 0, 1, 0.6235294, 1,
-0.106138, 1.071954, -0.5384843, 0, 1, 0.627451, 1,
-0.1041362, -0.564898, -2.779676, 0, 1, 0.6352941, 1,
-0.09757409, 1.5717, 1.822667, 0, 1, 0.6392157, 1,
-0.09337193, -0.984401, -3.396871, 0, 1, 0.6470588, 1,
-0.09270833, -0.02875228, 0.6766164, 0, 1, 0.6509804, 1,
-0.08769496, -0.000754647, -3.45585, 0, 1, 0.6588235, 1,
-0.0855387, -1.236713, -3.704585, 0, 1, 0.6627451, 1,
-0.08521363, 0.6847084, -0.4455501, 0, 1, 0.6705883, 1,
-0.08417795, 0.09547795, 1.053249, 0, 1, 0.6745098, 1,
-0.08213648, -0.3102587, -2.308208, 0, 1, 0.682353, 1,
-0.07840822, -1.993447, -1.604305, 0, 1, 0.6862745, 1,
-0.07639936, -0.1527554, -2.903009, 0, 1, 0.6941177, 1,
-0.07469729, -0.5340018, -4.623886, 0, 1, 0.7019608, 1,
-0.06355996, -1.3602, -1.802922, 0, 1, 0.7058824, 1,
-0.06193279, 0.8328624, -0.1002759, 0, 1, 0.7137255, 1,
-0.0611841, 1.559356, 0.05594787, 0, 1, 0.7176471, 1,
-0.06115326, -0.9667777, -2.532945, 0, 1, 0.7254902, 1,
-0.06063883, 0.346895, 0.3577864, 0, 1, 0.7294118, 1,
-0.0574219, 0.5098581, 1.109706, 0, 1, 0.7372549, 1,
-0.05319992, -1.531894, -3.329712, 0, 1, 0.7411765, 1,
-0.05268012, 0.3484213, 0.02196379, 0, 1, 0.7490196, 1,
-0.05129834, -0.5983903, -5.046189, 0, 1, 0.7529412, 1,
-0.04959177, 0.2903108, 1.096078, 0, 1, 0.7607843, 1,
-0.04930751, -0.8352818, -3.234419, 0, 1, 0.7647059, 1,
-0.04296156, -1.099389, -2.565282, 0, 1, 0.772549, 1,
-0.04223766, 0.112983, -0.1178028, 0, 1, 0.7764706, 1,
-0.04079202, 1.430253, 0.5339844, 0, 1, 0.7843137, 1,
-0.03682281, 0.1425483, -1.999135, 0, 1, 0.7882353, 1,
-0.03356413, -1.44897, -3.656582, 0, 1, 0.7960784, 1,
-0.03340613, -0.8617855, -2.736932, 0, 1, 0.8039216, 1,
-0.02929547, 1.234557, -0.2619089, 0, 1, 0.8078431, 1,
-0.0267478, -0.6627109, -1.513856, 0, 1, 0.8156863, 1,
-0.02265776, -1.664219, -3.414907, 0, 1, 0.8196079, 1,
-0.01776669, 1.857323, 0.00755092, 0, 1, 0.827451, 1,
-0.009115334, 0.775512, 0.05524243, 0, 1, 0.8313726, 1,
-0.005750774, 2.79468, -1.668431, 0, 1, 0.8392157, 1,
-0.005296402, -0.5483415, -4.405194, 0, 1, 0.8431373, 1,
-0.002562246, -0.8301654, -3.08542, 0, 1, 0.8509804, 1,
-0.002359411, -0.9453507, -3.217684, 0, 1, 0.854902, 1,
-0.001413614, 0.8566698, -0.094586, 0, 1, 0.8627451, 1,
0.002006039, 0.6427544, 0.5267161, 0, 1, 0.8666667, 1,
0.002179391, -0.1904409, 2.19524, 0, 1, 0.8745098, 1,
0.002408731, -0.5971379, 4.249779, 0, 1, 0.8784314, 1,
0.003228308, 0.2977761, 1.968499, 0, 1, 0.8862745, 1,
0.003484582, 0.7853814, -0.8201394, 0, 1, 0.8901961, 1,
0.005163656, 0.7478482, 1.334072, 0, 1, 0.8980392, 1,
0.005472418, 0.1103709, 2.518546, 0, 1, 0.9058824, 1,
0.006172679, -1.554071, 1.885256, 0, 1, 0.9098039, 1,
0.00929913, 0.3016728, -1.49549, 0, 1, 0.9176471, 1,
0.009311265, -1.03756, 5.445077, 0, 1, 0.9215686, 1,
0.0101636, -0.9633004, 3.29102, 0, 1, 0.9294118, 1,
0.01064528, 0.219926, 1.538712, 0, 1, 0.9333333, 1,
0.01104784, -0.5898987, 3.929689, 0, 1, 0.9411765, 1,
0.0119886, -1.314877, 2.955289, 0, 1, 0.945098, 1,
0.013447, 1.49052, 1.424169, 0, 1, 0.9529412, 1,
0.01405282, -0.2025973, 2.898613, 0, 1, 0.9568627, 1,
0.0183602, 0.3606757, 0.433373, 0, 1, 0.9647059, 1,
0.02081902, 0.8892568, 0.1529256, 0, 1, 0.9686275, 1,
0.02270457, -1.247187, 4.751204, 0, 1, 0.9764706, 1,
0.02272485, -0.7895975, 3.17004, 0, 1, 0.9803922, 1,
0.02729051, 0.001522589, 1.726437, 0, 1, 0.9882353, 1,
0.02751955, 1.42425, -0.8800958, 0, 1, 0.9921569, 1,
0.02901462, 0.7795945, -0.4934848, 0, 1, 1, 1,
0.0305153, 0.6376777, 0.7802587, 0, 0.9921569, 1, 1,
0.03105672, -1.280496, 1.321286, 0, 0.9882353, 1, 1,
0.03557366, -0.1450057, 3.476644, 0, 0.9803922, 1, 1,
0.03599377, -0.4805297, 3.09657, 0, 0.9764706, 1, 1,
0.03646984, -1.02707, 3.081981, 0, 0.9686275, 1, 1,
0.03745221, 0.7241263, -1.343036, 0, 0.9647059, 1, 1,
0.03783935, -0.3275853, 2.964199, 0, 0.9568627, 1, 1,
0.03926597, 0.1237537, 0.2966481, 0, 0.9529412, 1, 1,
0.04149625, -1.94817, 2.41173, 0, 0.945098, 1, 1,
0.04305642, -1.600005, 3.498069, 0, 0.9411765, 1, 1,
0.04666877, 0.6326972, 0.2920471, 0, 0.9333333, 1, 1,
0.05054189, 1.071492, -0.2360465, 0, 0.9294118, 1, 1,
0.05551568, -0.3082606, 3.40263, 0, 0.9215686, 1, 1,
0.05680425, 1.153631, -0.261975, 0, 0.9176471, 1, 1,
0.06726044, -0.7580603, 2.722718, 0, 0.9098039, 1, 1,
0.0690596, 0.7924325, 0.9934654, 0, 0.9058824, 1, 1,
0.06936518, 0.8571678, -0.2592108, 0, 0.8980392, 1, 1,
0.06983715, -0.4376831, 2.953224, 0, 0.8901961, 1, 1,
0.07234862, 1.46011, 0.5240467, 0, 0.8862745, 1, 1,
0.07343524, -0.7110389, 2.65618, 0, 0.8784314, 1, 1,
0.07436123, 1.539949, -0.4171341, 0, 0.8745098, 1, 1,
0.07975578, -0.5251207, 3.484686, 0, 0.8666667, 1, 1,
0.08431884, 0.2108893, -0.2872342, 0, 0.8627451, 1, 1,
0.08490905, -0.8782102, 3.268941, 0, 0.854902, 1, 1,
0.08919593, 1.44985, 0.8395702, 0, 0.8509804, 1, 1,
0.08925664, -0.168586, -0.1585543, 0, 0.8431373, 1, 1,
0.08931668, -0.7853966, 2.315038, 0, 0.8392157, 1, 1,
0.09258214, 1.900839, 1.076949, 0, 0.8313726, 1, 1,
0.09342669, -2.732434, 4.584442, 0, 0.827451, 1, 1,
0.09349097, -2.29747, 3.770193, 0, 0.8196079, 1, 1,
0.09367466, 1.618224, 0.06073156, 0, 0.8156863, 1, 1,
0.100645, 0.6815265, -1.118932, 0, 0.8078431, 1, 1,
0.1014495, 0.8707918, -0.6265048, 0, 0.8039216, 1, 1,
0.1043109, -0.2616717, 2.651925, 0, 0.7960784, 1, 1,
0.1066375, -0.7916944, 2.484703, 0, 0.7882353, 1, 1,
0.1121316, 0.4618047, -0.5899345, 0, 0.7843137, 1, 1,
0.1187982, 1.149478, 1.453851, 0, 0.7764706, 1, 1,
0.1202935, 1.128042, 1.286363, 0, 0.772549, 1, 1,
0.1273399, 0.8063643, 0.2786044, 0, 0.7647059, 1, 1,
0.1295405, -1.149001, 2.815455, 0, 0.7607843, 1, 1,
0.1355522, 1.167592, -0.495269, 0, 0.7529412, 1, 1,
0.1355845, 1.484114, -2.215925, 0, 0.7490196, 1, 1,
0.1373459, 1.348127, 1.10097, 0, 0.7411765, 1, 1,
0.1381712, -2.103842, 2.399292, 0, 0.7372549, 1, 1,
0.1400839, -0.7229128, 2.852887, 0, 0.7294118, 1, 1,
0.1401638, -0.1568661, 3.087746, 0, 0.7254902, 1, 1,
0.1431202, 0.9385622, -0.8769389, 0, 0.7176471, 1, 1,
0.1506763, -0.3863789, 5.127438, 0, 0.7137255, 1, 1,
0.1532188, 0.2719302, 1.873829, 0, 0.7058824, 1, 1,
0.1564356, 1.777052, -0.1474667, 0, 0.6980392, 1, 1,
0.1572277, 0.04678, 1.082473, 0, 0.6941177, 1, 1,
0.158247, 0.06655589, 1.635788, 0, 0.6862745, 1, 1,
0.1583002, -0.8422434, 1.510567, 0, 0.682353, 1, 1,
0.1588592, 0.2425085, -0.02184983, 0, 0.6745098, 1, 1,
0.1590683, -1.660149, 3.790128, 0, 0.6705883, 1, 1,
0.1593053, 0.1678843, -0.1229225, 0, 0.6627451, 1, 1,
0.1624903, 0.7297484, 0.4914621, 0, 0.6588235, 1, 1,
0.1645613, -0.1454569, -0.5305584, 0, 0.6509804, 1, 1,
0.1660909, 0.5396695, 1.324715, 0, 0.6470588, 1, 1,
0.1664183, -1.161145, 3.090321, 0, 0.6392157, 1, 1,
0.1689295, -0.6120448, 4.444598, 0, 0.6352941, 1, 1,
0.1693113, 0.6157535, 0.003741303, 0, 0.627451, 1, 1,
0.1740006, 2.409643, 3.333364, 0, 0.6235294, 1, 1,
0.1772309, -0.2186111, 4.122145, 0, 0.6156863, 1, 1,
0.1838958, -0.05835544, 2.116942, 0, 0.6117647, 1, 1,
0.1845237, -0.109157, 2.74106, 0, 0.6039216, 1, 1,
0.1846822, 0.0627884, 2.077971, 0, 0.5960785, 1, 1,
0.1858202, 1.413016, 0.1812824, 0, 0.5921569, 1, 1,
0.1866725, -0.3075192, 3.154277, 0, 0.5843138, 1, 1,
0.1916134, 0.03458893, 1.838725, 0, 0.5803922, 1, 1,
0.1937661, -2.321239, 2.2704, 0, 0.572549, 1, 1,
0.1953515, -0.1031929, 1.946067, 0, 0.5686275, 1, 1,
0.1962696, 0.560478, -0.1593039, 0, 0.5607843, 1, 1,
0.1963299, -0.1302638, 0.5239136, 0, 0.5568628, 1, 1,
0.1993963, 0.4158052, 0.2874017, 0, 0.5490196, 1, 1,
0.2001965, -0.1488729, 2.973983, 0, 0.5450981, 1, 1,
0.2075381, 0.5240133, 0.5747119, 0, 0.5372549, 1, 1,
0.2154597, -1.099362, 1.790413, 0, 0.5333334, 1, 1,
0.217506, 1.066117, 1.139847, 0, 0.5254902, 1, 1,
0.222775, 0.8527439, -0.6043518, 0, 0.5215687, 1, 1,
0.2248903, -0.02085993, 1.290502, 0, 0.5137255, 1, 1,
0.2258604, -2.064697, 3.533115, 0, 0.509804, 1, 1,
0.2296316, -0.9733076, 3.128015, 0, 0.5019608, 1, 1,
0.2305643, 0.04967043, 2.29845, 0, 0.4941176, 1, 1,
0.2366053, 0.7819813, 0.1721447, 0, 0.4901961, 1, 1,
0.2413497, -0.1537242, 1.475746, 0, 0.4823529, 1, 1,
0.2440875, 1.021171, 0.3661825, 0, 0.4784314, 1, 1,
0.2483723, -0.4795736, 2.60273, 0, 0.4705882, 1, 1,
0.2512432, 0.1191246, 0.9629159, 0, 0.4666667, 1, 1,
0.2519426, 0.5888443, -0.04884071, 0, 0.4588235, 1, 1,
0.2538992, 0.4400739, -0.6559002, 0, 0.454902, 1, 1,
0.2589394, 0.2708339, -0.5739049, 0, 0.4470588, 1, 1,
0.2598563, 0.204913, 1.754449, 0, 0.4431373, 1, 1,
0.272026, 0.8597555, -0.5865814, 0, 0.4352941, 1, 1,
0.2742776, 1.163977, 1.453651, 0, 0.4313726, 1, 1,
0.2769169, -0.4309581, 2.223594, 0, 0.4235294, 1, 1,
0.2775434, -0.1699067, 1.759928, 0, 0.4196078, 1, 1,
0.2791631, -1.603389, 2.899135, 0, 0.4117647, 1, 1,
0.282702, 1.083619, -0.7390358, 0, 0.4078431, 1, 1,
0.2847562, 1.739931, -0.4526917, 0, 0.4, 1, 1,
0.2868541, 0.4320356, 1.505226, 0, 0.3921569, 1, 1,
0.2892719, 0.6938323, 1.68225, 0, 0.3882353, 1, 1,
0.2905784, 1.580387, 0.2890638, 0, 0.3803922, 1, 1,
0.2930269, -0.8950677, 2.276324, 0, 0.3764706, 1, 1,
0.2947183, -1.087405, 1.8791, 0, 0.3686275, 1, 1,
0.2989142, -1.34305, 3.522294, 0, 0.3647059, 1, 1,
0.3026418, 0.2773946, -0.4729568, 0, 0.3568628, 1, 1,
0.3053548, -0.08469605, 0.9081119, 0, 0.3529412, 1, 1,
0.3054699, 0.8509735, -0.09946142, 0, 0.345098, 1, 1,
0.3062791, -1.491869, 4.417536, 0, 0.3411765, 1, 1,
0.3101286, -0.2349787, 2.489345, 0, 0.3333333, 1, 1,
0.3106898, 0.5169078, 1.217048, 0, 0.3294118, 1, 1,
0.3118826, -0.5565251, 1.113949, 0, 0.3215686, 1, 1,
0.3140311, 0.6171908, 0.536786, 0, 0.3176471, 1, 1,
0.3197331, -0.3045425, 2.747417, 0, 0.3098039, 1, 1,
0.3199043, 0.5250627, 0.1174064, 0, 0.3058824, 1, 1,
0.3238418, 0.7059233, 1.745162, 0, 0.2980392, 1, 1,
0.3277953, -0.3594413, 2.62332, 0, 0.2901961, 1, 1,
0.3278105, 0.8429501, 0.3302119, 0, 0.2862745, 1, 1,
0.3313199, -0.4281198, 2.504965, 0, 0.2784314, 1, 1,
0.3351878, -0.1003733, 1.030899, 0, 0.2745098, 1, 1,
0.3465452, 1.783962, 1.219478, 0, 0.2666667, 1, 1,
0.3500143, -0.611865, 1.370071, 0, 0.2627451, 1, 1,
0.3637884, -0.07229085, 2.139954, 0, 0.254902, 1, 1,
0.3642495, 2.67604, -0.5036978, 0, 0.2509804, 1, 1,
0.3713365, -1.065152, 3.104974, 0, 0.2431373, 1, 1,
0.3741307, -0.6542398, 4.964236, 0, 0.2392157, 1, 1,
0.3782119, 1.114094, 1.317896, 0, 0.2313726, 1, 1,
0.3782788, -0.6868166, 2.881713, 0, 0.227451, 1, 1,
0.3807374, -0.01465552, 1.41411, 0, 0.2196078, 1, 1,
0.3819779, -0.2151759, 2.579517, 0, 0.2156863, 1, 1,
0.382532, 0.2311009, 0.942336, 0, 0.2078431, 1, 1,
0.3840787, 1.330553, -2.189648, 0, 0.2039216, 1, 1,
0.3849796, -0.7729371, 2.030261, 0, 0.1960784, 1, 1,
0.3853276, -0.1663823, 1.935147, 0, 0.1882353, 1, 1,
0.3864, -0.5223208, 0.9516565, 0, 0.1843137, 1, 1,
0.3874264, -1.019926, 4.056423, 0, 0.1764706, 1, 1,
0.3876363, -0.8302097, 3.32398, 0, 0.172549, 1, 1,
0.3877294, -1.178394, 4.065069, 0, 0.1647059, 1, 1,
0.3937161, -0.01316513, 0.8989357, 0, 0.1607843, 1, 1,
0.3965457, -1.408132, 4.160469, 0, 0.1529412, 1, 1,
0.3966382, -0.464006, 3.429164, 0, 0.1490196, 1, 1,
0.3977632, -0.05549995, 1.323739, 0, 0.1411765, 1, 1,
0.406563, -0.3909341, 2.854828, 0, 0.1372549, 1, 1,
0.4118771, 0.01567546, 2.420094, 0, 0.1294118, 1, 1,
0.4129649, -0.09624984, 0.9254716, 0, 0.1254902, 1, 1,
0.4150009, -0.6367848, 3.071637, 0, 0.1176471, 1, 1,
0.4201141, 0.824029, -1.140161, 0, 0.1137255, 1, 1,
0.4224682, 0.8689077, -0.6661358, 0, 0.1058824, 1, 1,
0.4246359, -0.27397, 0.2483743, 0, 0.09803922, 1, 1,
0.4279352, -0.3447103, 1.019148, 0, 0.09411765, 1, 1,
0.4283761, 0.08942764, 1.29146, 0, 0.08627451, 1, 1,
0.433905, 1.030541, 0.6780548, 0, 0.08235294, 1, 1,
0.4339999, -0.4620163, 1.294999, 0, 0.07450981, 1, 1,
0.4347285, -0.647809, 1.465375, 0, 0.07058824, 1, 1,
0.4355164, 0.7405185, 1.5426, 0, 0.0627451, 1, 1,
0.4371934, -0.888575, 3.680381, 0, 0.05882353, 1, 1,
0.4400139, -1.031035, 2.992909, 0, 0.05098039, 1, 1,
0.4444956, 0.06008965, 1.897713, 0, 0.04705882, 1, 1,
0.4509311, -1.448174, 4.778443, 0, 0.03921569, 1, 1,
0.4531792, -1.978686, 2.695485, 0, 0.03529412, 1, 1,
0.4575748, 0.8428879, 1.621144, 0, 0.02745098, 1, 1,
0.4585082, 0.8650007, 0.5220989, 0, 0.02352941, 1, 1,
0.4620447, 0.2556568, 0.08584777, 0, 0.01568628, 1, 1,
0.4623251, -0.395366, 2.872054, 0, 0.01176471, 1, 1,
0.4626773, -1.706561, 1.595278, 0, 0.003921569, 1, 1,
0.4645218, 1.498445, 0.2207691, 0.003921569, 0, 1, 1,
0.4655601, -0.113699, 0.3870738, 0.007843138, 0, 1, 1,
0.4705887, 0.631346, 0.1928209, 0.01568628, 0, 1, 1,
0.4711498, -0.9644456, -0.708221, 0.01960784, 0, 1, 1,
0.4763765, -0.9699807, 2.439659, 0.02745098, 0, 1, 1,
0.4822997, -0.9656513, 2.880306, 0.03137255, 0, 1, 1,
0.4897422, 0.7472902, -0.4435142, 0.03921569, 0, 1, 1,
0.4915054, 1.162519, 1.883741, 0.04313726, 0, 1, 1,
0.4933876, 0.507148, 0.03831223, 0.05098039, 0, 1, 1,
0.4944941, -1.242716, 2.734035, 0.05490196, 0, 1, 1,
0.4953347, -0.3415544, 1.790269, 0.0627451, 0, 1, 1,
0.4961789, -0.724169, 2.496003, 0.06666667, 0, 1, 1,
0.5040039, 0.697246, 0.4312336, 0.07450981, 0, 1, 1,
0.5053777, -1.274572, 3.21546, 0.07843138, 0, 1, 1,
0.5065309, 0.2908236, 0.6459107, 0.08627451, 0, 1, 1,
0.5137979, 0.2768145, 2.129554, 0.09019608, 0, 1, 1,
0.5145718, -0.4878688, 3.665949, 0.09803922, 0, 1, 1,
0.517214, 0.6871799, 0.3506619, 0.1058824, 0, 1, 1,
0.5197795, 0.7574666, 1.0356, 0.1098039, 0, 1, 1,
0.5205204, 1.037918, 1.216351, 0.1176471, 0, 1, 1,
0.5208994, -0.9658083, 1.680117, 0.1215686, 0, 1, 1,
0.5217867, 1.893913, 0.5354556, 0.1294118, 0, 1, 1,
0.5229539, 2.313594, 0.7611241, 0.1333333, 0, 1, 1,
0.5303112, -0.7898379, 2.629293, 0.1411765, 0, 1, 1,
0.5309421, -0.6164519, 1.789759, 0.145098, 0, 1, 1,
0.5322335, 0.3735316, 2.265543, 0.1529412, 0, 1, 1,
0.5360258, -1.932899, 3.816653, 0.1568628, 0, 1, 1,
0.5381821, 1.439198, 0.8078744, 0.1647059, 0, 1, 1,
0.5396228, -0.8290464, 0.9471319, 0.1686275, 0, 1, 1,
0.5401149, 0.01677978, 0.6498976, 0.1764706, 0, 1, 1,
0.541675, 1.70115, 1.261879, 0.1803922, 0, 1, 1,
0.5419295, -1.260736, 2.146321, 0.1882353, 0, 1, 1,
0.5454696, -1.734989, 2.697023, 0.1921569, 0, 1, 1,
0.5520589, -0.2039709, 1.546706, 0.2, 0, 1, 1,
0.5545027, 1.004075, 0.982541, 0.2078431, 0, 1, 1,
0.5562673, 1.023387, 0.412839, 0.2117647, 0, 1, 1,
0.5611359, -0.1994409, 2.856344, 0.2196078, 0, 1, 1,
0.5623099, 0.3983324, 2.516855, 0.2235294, 0, 1, 1,
0.5623784, -0.7004339, 0.7225928, 0.2313726, 0, 1, 1,
0.5650662, 1.816941, 1.192346, 0.2352941, 0, 1, 1,
0.5692782, -1.837941, 2.57473, 0.2431373, 0, 1, 1,
0.5706823, -1.124909, 2.071606, 0.2470588, 0, 1, 1,
0.5720645, 2.751262, 0.178816, 0.254902, 0, 1, 1,
0.5746124, 0.9822308, -1.151266, 0.2588235, 0, 1, 1,
0.5755794, -1.313149, 1.893474, 0.2666667, 0, 1, 1,
0.5782764, -0.2740566, 1.563726, 0.2705882, 0, 1, 1,
0.5840217, 0.5211234, 1.011773, 0.2784314, 0, 1, 1,
0.5895752, 2.54842, -0.4398098, 0.282353, 0, 1, 1,
0.5916236, 2.243561, 0.1402779, 0.2901961, 0, 1, 1,
0.5920326, -0.9151932, 3.413474, 0.2941177, 0, 1, 1,
0.5928149, -0.5125045, 1.537484, 0.3019608, 0, 1, 1,
0.5979249, 0.3156292, 2.154356, 0.3098039, 0, 1, 1,
0.5999359, -1.446031, 1.638714, 0.3137255, 0, 1, 1,
0.6002488, -1.915349, 3.053402, 0.3215686, 0, 1, 1,
0.6008471, 0.4434645, 0.2812059, 0.3254902, 0, 1, 1,
0.6036445, -1.110706, 4.183539, 0.3333333, 0, 1, 1,
0.6058912, 0.4183592, 2.289176, 0.3372549, 0, 1, 1,
0.6080141, -1.471905, 2.648026, 0.345098, 0, 1, 1,
0.610678, 0.2582511, 0.6969791, 0.3490196, 0, 1, 1,
0.6215371, -0.4841874, 2.06754, 0.3568628, 0, 1, 1,
0.6287473, 0.5200749, 0.05961283, 0.3607843, 0, 1, 1,
0.6316625, -1.219277, 2.911257, 0.3686275, 0, 1, 1,
0.6328151, -0.6553834, 3.400589, 0.372549, 0, 1, 1,
0.6375003, 0.002972438, 2.009225, 0.3803922, 0, 1, 1,
0.638894, -0.8247292, 4.327503, 0.3843137, 0, 1, 1,
0.6397503, -0.788822, 0.5850185, 0.3921569, 0, 1, 1,
0.647126, 0.4511301, 1.123576, 0.3960784, 0, 1, 1,
0.647609, -0.46421, 3.41502, 0.4039216, 0, 1, 1,
0.649092, -0.1389753, 2.008534, 0.4117647, 0, 1, 1,
0.6525923, -0.02240005, 2.702588, 0.4156863, 0, 1, 1,
0.6532261, -1.168778, 3.240855, 0.4235294, 0, 1, 1,
0.656085, -1.643694, 2.200646, 0.427451, 0, 1, 1,
0.6577438, 1.103616, 1.603353, 0.4352941, 0, 1, 1,
0.6579504, 0.05805799, 1.604842, 0.4392157, 0, 1, 1,
0.659561, 0.4818383, 0.7153983, 0.4470588, 0, 1, 1,
0.6608269, 1.303359, -0.2839268, 0.4509804, 0, 1, 1,
0.6700911, -0.06121725, 0.8316988, 0.4588235, 0, 1, 1,
0.6759883, -1.710717, 2.204511, 0.4627451, 0, 1, 1,
0.6782101, 2.302498, -0.3696982, 0.4705882, 0, 1, 1,
0.6890787, 0.4696346, 1.923104, 0.4745098, 0, 1, 1,
0.6937918, -0.7919077, 1.148652, 0.4823529, 0, 1, 1,
0.6987825, -1.076301, 2.761432, 0.4862745, 0, 1, 1,
0.7000059, -0.9713749, 2.980694, 0.4941176, 0, 1, 1,
0.7027394, -0.4260382, 2.476163, 0.5019608, 0, 1, 1,
0.7046033, 0.8755429, 1.824268, 0.5058824, 0, 1, 1,
0.7172695, 0.0195278, 0.3397262, 0.5137255, 0, 1, 1,
0.7177051, 1.675822, 0.328809, 0.5176471, 0, 1, 1,
0.7179563, 1.484665, 1.14138, 0.5254902, 0, 1, 1,
0.7180663, 1.709339, 0.997442, 0.5294118, 0, 1, 1,
0.7189763, 0.4553221, 0.5652896, 0.5372549, 0, 1, 1,
0.720789, 0.400784, 2.017716, 0.5411765, 0, 1, 1,
0.7306724, 1.753064, -1.314813, 0.5490196, 0, 1, 1,
0.733595, 0.05139536, 2.190254, 0.5529412, 0, 1, 1,
0.7349343, -1.985725, 1.393438, 0.5607843, 0, 1, 1,
0.7414704, 0.3527355, 3.084476, 0.5647059, 0, 1, 1,
0.7424641, -0.2343512, 0.7425811, 0.572549, 0, 1, 1,
0.7425865, 1.259727, 0.2502759, 0.5764706, 0, 1, 1,
0.7453126, -0.6920728, 1.759695, 0.5843138, 0, 1, 1,
0.7479416, 0.004619834, 2.731494, 0.5882353, 0, 1, 1,
0.7485757, 1.401996, 0.5089462, 0.5960785, 0, 1, 1,
0.7494098, 0.2647032, 1.855922, 0.6039216, 0, 1, 1,
0.7501289, -0.5402661, 2.236405, 0.6078432, 0, 1, 1,
0.7525691, 1.369477, 0.5226828, 0.6156863, 0, 1, 1,
0.7537379, 0.8192487, 0.3265729, 0.6196079, 0, 1, 1,
0.7573406, 0.427892, 1.565847, 0.627451, 0, 1, 1,
0.7641487, -0.1140693, 2.448591, 0.6313726, 0, 1, 1,
0.7675373, 0.448326, 1.309394, 0.6392157, 0, 1, 1,
0.7704284, -0.409033, 1.425291, 0.6431373, 0, 1, 1,
0.7717001, -1.296579, 1.933574, 0.6509804, 0, 1, 1,
0.7729931, 0.9641851, 0.2387577, 0.654902, 0, 1, 1,
0.7742787, -0.5703454, 0.6849846, 0.6627451, 0, 1, 1,
0.7763531, 1.018674, 0.1148554, 0.6666667, 0, 1, 1,
0.7873573, -0.4445928, 0.9598807, 0.6745098, 0, 1, 1,
0.7953243, 0.9498483, -0.4489, 0.6784314, 0, 1, 1,
0.8006896, 0.5083246, -0.2420698, 0.6862745, 0, 1, 1,
0.8014345, -2.616392, 3.277913, 0.6901961, 0, 1, 1,
0.8022638, -0.7584134, 1.4912, 0.6980392, 0, 1, 1,
0.8027442, 2.484149, -0.5164182, 0.7058824, 0, 1, 1,
0.8047885, 0.8785812, -0.496659, 0.7098039, 0, 1, 1,
0.8078774, 1.599051, -1.486746, 0.7176471, 0, 1, 1,
0.8081548, 0.5143312, 1.245441, 0.7215686, 0, 1, 1,
0.8094356, 0.7037368, -1.180308, 0.7294118, 0, 1, 1,
0.8106804, 1.88076, -0.3727488, 0.7333333, 0, 1, 1,
0.8137888, 0.1924812, 0.6997327, 0.7411765, 0, 1, 1,
0.8138365, -0.1637327, 0.5917039, 0.7450981, 0, 1, 1,
0.8157423, 0.5987933, 2.032745, 0.7529412, 0, 1, 1,
0.8182878, -0.6310698, 2.246717, 0.7568628, 0, 1, 1,
0.8211713, 0.3220395, 0.9982035, 0.7647059, 0, 1, 1,
0.8236669, -0.2634979, 1.936226, 0.7686275, 0, 1, 1,
0.8374412, -1.921976, 3.494869, 0.7764706, 0, 1, 1,
0.8396317, -0.04496763, 0.4499442, 0.7803922, 0, 1, 1,
0.8422101, -0.04356088, 0.005246048, 0.7882353, 0, 1, 1,
0.8475649, 0.6892132, 2.987277, 0.7921569, 0, 1, 1,
0.8507128, -0.7914914, 0.8163692, 0.8, 0, 1, 1,
0.8514938, 0.4531384, 1.049401, 0.8078431, 0, 1, 1,
0.854278, -0.7213108, 1.416236, 0.8117647, 0, 1, 1,
0.8711902, -0.6415491, 0.6177517, 0.8196079, 0, 1, 1,
0.8723226, 0.217965, 0.9976699, 0.8235294, 0, 1, 1,
0.872957, 1.717957, -1.3504, 0.8313726, 0, 1, 1,
0.8785199, -0.5547361, 1.753438, 0.8352941, 0, 1, 1,
0.8861877, -1.365855, 3.393089, 0.8431373, 0, 1, 1,
0.8867256, 0.3153698, 2.117715, 0.8470588, 0, 1, 1,
0.8899637, -0.3395145, 0.8779078, 0.854902, 0, 1, 1,
0.9022194, -0.5986694, 1.86778, 0.8588235, 0, 1, 1,
0.9022913, 0.6302382, 0.3783585, 0.8666667, 0, 1, 1,
0.9122074, 1.0819, 0.3754963, 0.8705882, 0, 1, 1,
0.9137651, -0.2585602, 1.992728, 0.8784314, 0, 1, 1,
0.9159588, 0.7877492, 1.24626, 0.8823529, 0, 1, 1,
0.9167016, -0.2751053, 2.23459, 0.8901961, 0, 1, 1,
0.9204219, 1.357888, 0.6019068, 0.8941177, 0, 1, 1,
0.921702, 0.05098629, 0.5081664, 0.9019608, 0, 1, 1,
0.9259914, 1.239072, 1.487181, 0.9098039, 0, 1, 1,
0.9279315, 0.8829505, -0.1035769, 0.9137255, 0, 1, 1,
0.9285191, -2.169322, 4.008615, 0.9215686, 0, 1, 1,
0.9288224, -2.136341, 3.111516, 0.9254902, 0, 1, 1,
0.9301255, 1.417274, 0.5016825, 0.9333333, 0, 1, 1,
0.9306756, -1.487764, 3.187261, 0.9372549, 0, 1, 1,
0.9320207, 0.9060208, 2.115964, 0.945098, 0, 1, 1,
0.9370546, -1.062073, 2.860085, 0.9490196, 0, 1, 1,
0.9390791, -0.1986131, 1.448281, 0.9568627, 0, 1, 1,
0.941446, -0.8664448, 1.105001, 0.9607843, 0, 1, 1,
0.9442428, 0.7357798, 0.5038623, 0.9686275, 0, 1, 1,
0.9444958, -0.08512776, 1.343939, 0.972549, 0, 1, 1,
0.9447219, 0.0008852665, 2.410083, 0.9803922, 0, 1, 1,
0.9450285, -0.6101114, 2.561549, 0.9843137, 0, 1, 1,
0.9464612, -1.243997, 2.723727, 0.9921569, 0, 1, 1,
0.95247, -0.1528767, 0.912698, 0.9960784, 0, 1, 1,
0.9694402, 0.2872432, 1.204987, 1, 0, 0.9960784, 1,
0.9707269, -0.4116794, 1.856335, 1, 0, 0.9882353, 1,
0.9722927, 0.8368835, 1.604396, 1, 0, 0.9843137, 1,
0.9760216, -0.3287261, 0.8933528, 1, 0, 0.9764706, 1,
0.9828017, -0.07645857, 2.219361, 1, 0, 0.972549, 1,
0.9846616, -0.8981311, 1.157727, 1, 0, 0.9647059, 1,
0.9877287, -0.6208436, 3.542541, 1, 0, 0.9607843, 1,
0.9905794, -1.134309, 1.756611, 1, 0, 0.9529412, 1,
0.9938365, 1.180565, 2.152089, 1, 0, 0.9490196, 1,
0.9948378, 0.1784486, 0.4992218, 1, 0, 0.9411765, 1,
0.9948766, 0.3815664, 0.5177618, 1, 0, 0.9372549, 1,
0.9963919, 0.185858, 2.321403, 1, 0, 0.9294118, 1,
1.001451, -2.110173, 3.67726, 1, 0, 0.9254902, 1,
1.006783, 0.695433, 2.174833, 1, 0, 0.9176471, 1,
1.022602, 0.0260918, 2.213541, 1, 0, 0.9137255, 1,
1.030987, -0.3085466, 2.113046, 1, 0, 0.9058824, 1,
1.034814, -1.060215, 2.073031, 1, 0, 0.9019608, 1,
1.038898, 0.1822534, 1.054384, 1, 0, 0.8941177, 1,
1.042833, -0.3485046, 3.012225, 1, 0, 0.8862745, 1,
1.046616, -1.339879, 3.274438, 1, 0, 0.8823529, 1,
1.052982, -1.057265, 2.917346, 1, 0, 0.8745098, 1,
1.062509, 1.072754, 1.581817, 1, 0, 0.8705882, 1,
1.062832, 1.453142, 1.400759, 1, 0, 0.8627451, 1,
1.063331, 0.8807949, 0.04199177, 1, 0, 0.8588235, 1,
1.06389, 1.435216, 1.223796, 1, 0, 0.8509804, 1,
1.069969, 0.2226653, -1.432013, 1, 0, 0.8470588, 1,
1.071406, -0.2309901, 3.14622, 1, 0, 0.8392157, 1,
1.072214, -1.42449, 1.182407, 1, 0, 0.8352941, 1,
1.073199, 1.069593, 0.5242391, 1, 0, 0.827451, 1,
1.0829, 1.253796, 0.7672531, 1, 0, 0.8235294, 1,
1.0837, -0.3259009, 2.107541, 1, 0, 0.8156863, 1,
1.085308, -0.4150352, 2.02566, 1, 0, 0.8117647, 1,
1.088926, -1.063273, 1.686859, 1, 0, 0.8039216, 1,
1.09265, 0.4209305, 1.148437, 1, 0, 0.7960784, 1,
1.09285, 1.167804, 1.579977, 1, 0, 0.7921569, 1,
1.101173, -0.2077785, 1.019107, 1, 0, 0.7843137, 1,
1.101528, 0.3968137, 0.9448379, 1, 0, 0.7803922, 1,
1.104186, -0.4780392, 0.8019698, 1, 0, 0.772549, 1,
1.111256, -0.6467267, -0.1463649, 1, 0, 0.7686275, 1,
1.118188, 0.1079815, 3.92596, 1, 0, 0.7607843, 1,
1.120415, -0.7986252, 2.155118, 1, 0, 0.7568628, 1,
1.130179, -2.376773, 3.536724, 1, 0, 0.7490196, 1,
1.13922, -0.04011564, 0.457545, 1, 0, 0.7450981, 1,
1.145088, 0.02976628, 2.631069, 1, 0, 0.7372549, 1,
1.147041, 0.8707627, 2.03357, 1, 0, 0.7333333, 1,
1.149885, 0.7559654, 1.69548, 1, 0, 0.7254902, 1,
1.156869, 0.3402891, 2.901176, 1, 0, 0.7215686, 1,
1.159862, 1.328971, 0.2477799, 1, 0, 0.7137255, 1,
1.161632, 0.07626328, 0.8534881, 1, 0, 0.7098039, 1,
1.168399, 0.04636011, 0.4067861, 1, 0, 0.7019608, 1,
1.171797, -1.066773, 2.527354, 1, 0, 0.6941177, 1,
1.174541, -0.4219233, 1.233934, 1, 0, 0.6901961, 1,
1.178829, -0.05066453, 0.824172, 1, 0, 0.682353, 1,
1.182492, -0.4763044, 3.291123, 1, 0, 0.6784314, 1,
1.183597, -1.134795, 0.7397613, 1, 0, 0.6705883, 1,
1.18532, 0.947433, 1.205757, 1, 0, 0.6666667, 1,
1.198488, -0.89675, 2.438512, 1, 0, 0.6588235, 1,
1.203804, -1.265908, 2.02461, 1, 0, 0.654902, 1,
1.208142, 1.408996, -0.1131761, 1, 0, 0.6470588, 1,
1.209028, 0.7732891, 0.5418056, 1, 0, 0.6431373, 1,
1.211353, 0.1603943, 1.539292, 1, 0, 0.6352941, 1,
1.212518, -0.5027028, 1.615926, 1, 0, 0.6313726, 1,
1.217604, -1.412028, 1.728279, 1, 0, 0.6235294, 1,
1.225881, 0.0353132, 2.153989, 1, 0, 0.6196079, 1,
1.234684, 0.7058115, 3.417644, 1, 0, 0.6117647, 1,
1.258783, 0.4897363, 1.671219, 1, 0, 0.6078432, 1,
1.267198, 0.9983172, 0.8437906, 1, 0, 0.6, 1,
1.2705, 0.7524571, -0.6215971, 1, 0, 0.5921569, 1,
1.274158, 0.1141538, 2.030716, 1, 0, 0.5882353, 1,
1.283549, -0.5217422, 1.328952, 1, 0, 0.5803922, 1,
1.291593, -2.740421, 3.204896, 1, 0, 0.5764706, 1,
1.292123, 1.020574, 1.074087, 1, 0, 0.5686275, 1,
1.296332, -0.3908406, 1.306419, 1, 0, 0.5647059, 1,
1.296786, 1.126456, 2.995231, 1, 0, 0.5568628, 1,
1.298661, -0.3786161, 2.980318, 1, 0, 0.5529412, 1,
1.305544, 1.826028, 1.694486, 1, 0, 0.5450981, 1,
1.307226, -0.9628555, 1.45627, 1, 0, 0.5411765, 1,
1.307654, -0.9433001, 2.102433, 1, 0, 0.5333334, 1,
1.308169, 0.2206594, 0.6775478, 1, 0, 0.5294118, 1,
1.322615, -0.3599846, 2.729582, 1, 0, 0.5215687, 1,
1.362933, 1.853139, 1.679059, 1, 0, 0.5176471, 1,
1.365265, -0.1881065, 0.6759666, 1, 0, 0.509804, 1,
1.367674, 0.106739, 1.922893, 1, 0, 0.5058824, 1,
1.386052, 2.259415, -0.5811151, 1, 0, 0.4980392, 1,
1.388999, 0.5444178, 0.03993455, 1, 0, 0.4901961, 1,
1.408424, -0.4695644, -0.1392034, 1, 0, 0.4862745, 1,
1.410239, 0.04754616, 1.00967, 1, 0, 0.4784314, 1,
1.411705, -1.173956, 1.813757, 1, 0, 0.4745098, 1,
1.419866, -1.206307, 1.751463, 1, 0, 0.4666667, 1,
1.422098, 0.3303866, 1.587101, 1, 0, 0.4627451, 1,
1.428535, 0.1804473, 1.71146, 1, 0, 0.454902, 1,
1.430582, -0.2710611, 2.17959, 1, 0, 0.4509804, 1,
1.430643, -0.740381, 3.353759, 1, 0, 0.4431373, 1,
1.457606, -0.9955225, 2.657021, 1, 0, 0.4392157, 1,
1.460677, -1.356072, 4.084823, 1, 0, 0.4313726, 1,
1.462806, -0.1600252, 1.453203, 1, 0, 0.427451, 1,
1.470065, 1.899657, 0.526371, 1, 0, 0.4196078, 1,
1.485324, -0.4728661, 2.105381, 1, 0, 0.4156863, 1,
1.489038, 1.737706, -1.00766, 1, 0, 0.4078431, 1,
1.493681, 1.007794, 2.08078, 1, 0, 0.4039216, 1,
1.503225, 0.3732773, 1.564708, 1, 0, 0.3960784, 1,
1.503608, -1.436975, 2.451226, 1, 0, 0.3882353, 1,
1.514267, -0.2764627, 1.423264, 1, 0, 0.3843137, 1,
1.526449, -1.502998, 2.043893, 1, 0, 0.3764706, 1,
1.526528, 1.603413, 2.777354, 1, 0, 0.372549, 1,
1.528501, 1.765478, 0.9832185, 1, 0, 0.3647059, 1,
1.532433, -0.04743803, 0.3313847, 1, 0, 0.3607843, 1,
1.535459, 0.5238507, 0.8775911, 1, 0, 0.3529412, 1,
1.556032, 0.9014519, 2.024067, 1, 0, 0.3490196, 1,
1.564044, 1.43739, -0.4089392, 1, 0, 0.3411765, 1,
1.571017, 1.080269, 2.03971, 1, 0, 0.3372549, 1,
1.575979, -0.6650239, 0.70443, 1, 0, 0.3294118, 1,
1.592825, -1.183583, 1.441005, 1, 0, 0.3254902, 1,
1.596685, -0.4344705, 1.807274, 1, 0, 0.3176471, 1,
1.6148, -0.4736598, 2.853304, 1, 0, 0.3137255, 1,
1.617058, 1.542394, -1.007438, 1, 0, 0.3058824, 1,
1.627241, 0.9598843, 2.571911, 1, 0, 0.2980392, 1,
1.636921, 0.5843128, 2.508667, 1, 0, 0.2941177, 1,
1.643766, -0.02633231, 3.542554, 1, 0, 0.2862745, 1,
1.650726, -1.007923, 1.736397, 1, 0, 0.282353, 1,
1.677254, 1.077558, 0.5221801, 1, 0, 0.2745098, 1,
1.688054, 0.007361494, -0.4803808, 1, 0, 0.2705882, 1,
1.690361, 2.76961, 0.1888672, 1, 0, 0.2627451, 1,
1.698033, -0.4941359, 3.39689, 1, 0, 0.2588235, 1,
1.707216, 0.2866699, 2.021554, 1, 0, 0.2509804, 1,
1.722253, -0.4004005, 1.818014, 1, 0, 0.2470588, 1,
1.735477, 0.5873531, 2.123791, 1, 0, 0.2392157, 1,
1.755159, -0.08199889, 1.685922, 1, 0, 0.2352941, 1,
1.757417, 0.1828453, 0.3333594, 1, 0, 0.227451, 1,
1.763292, -1.961202, 3.019199, 1, 0, 0.2235294, 1,
1.768627, -0.8306194, 1.206541, 1, 0, 0.2156863, 1,
1.804303, -1.970916, 2.744163, 1, 0, 0.2117647, 1,
1.818918, -0.4234378, 1.070089, 1, 0, 0.2039216, 1,
1.82717, 0.7035365, 1.199516, 1, 0, 0.1960784, 1,
1.841228, -0.8893213, 2.598785, 1, 0, 0.1921569, 1,
1.844727, -0.296433, 1.036408, 1, 0, 0.1843137, 1,
1.876174, 1.144724, -0.0042111, 1, 0, 0.1803922, 1,
1.882743, -0.01712047, -0.15092, 1, 0, 0.172549, 1,
1.909039, -0.4859381, 2.179694, 1, 0, 0.1686275, 1,
1.910069, 1.06224, 1.93183, 1, 0, 0.1607843, 1,
1.928725, -0.2696766, 2.605673, 1, 0, 0.1568628, 1,
1.941052, -0.5050308, 1.091569, 1, 0, 0.1490196, 1,
1.961854, -1.356407, 0.9932775, 1, 0, 0.145098, 1,
1.990466, -1.605019, 3.521308, 1, 0, 0.1372549, 1,
2.005228, 0.9165754, 1.283775, 1, 0, 0.1333333, 1,
2.017224, 0.3154695, 2.056009, 1, 0, 0.1254902, 1,
2.023887, -1.217916, 2.195036, 1, 0, 0.1215686, 1,
2.024835, -0.2820393, 1.157159, 1, 0, 0.1137255, 1,
2.045341, -1.577542, 1.717755, 1, 0, 0.1098039, 1,
2.073906, 0.1455171, 0.1215264, 1, 0, 0.1019608, 1,
2.084959, -1.273018, 1.038803, 1, 0, 0.09411765, 1,
2.092723, -2.511306, 2.046105, 1, 0, 0.09019608, 1,
2.102568, 0.3540133, 4.184291, 1, 0, 0.08235294, 1,
2.174831, -0.01840637, 1.919802, 1, 0, 0.07843138, 1,
2.184963, -0.6230664, 0.8450086, 1, 0, 0.07058824, 1,
2.264148, 0.08183856, 0.8477339, 1, 0, 0.06666667, 1,
2.27237, 0.4035206, 2.325745, 1, 0, 0.05882353, 1,
2.333517, -0.1103284, 1.528128, 1, 0, 0.05490196, 1,
2.348891, 0.9844814, 3.265835, 1, 0, 0.04705882, 1,
2.350981, 1.320502, 2.547468, 1, 0, 0.04313726, 1,
2.504293, -1.00694, 2.426544, 1, 0, 0.03529412, 1,
2.555851, -0.9141569, 2.231756, 1, 0, 0.03137255, 1,
2.568434, -0.3140694, 0.5627018, 1, 0, 0.02352941, 1,
2.721539, 1.585269, 1.898579, 1, 0, 0.01960784, 1,
2.769762, 0.5444895, 1.459572, 1, 0, 0.01176471, 1,
3.043924, -0.6673027, 0.7581932, 1, 0, 0.007843138, 1
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
0.07868135, -4.440427, -6.824459, 0, -0.5, 0.5, 0.5,
0.07868135, -4.440427, -6.824459, 1, -0.5, 0.5, 0.5,
0.07868135, -4.440427, -6.824459, 1, 1.5, 0.5, 0.5,
0.07868135, -4.440427, -6.824459, 0, 1.5, 0.5, 0.5
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
-3.891779, 0.1958733, -6.824459, 0, -0.5, 0.5, 0.5,
-3.891779, 0.1958733, -6.824459, 1, -0.5, 0.5, 0.5,
-3.891779, 0.1958733, -6.824459, 1, 1.5, 0.5, 0.5,
-3.891779, 0.1958733, -6.824459, 0, 1.5, 0.5, 0.5
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
-3.891779, -4.440427, 0.1994441, 0, -0.5, 0.5, 0.5,
-3.891779, -4.440427, 0.1994441, 1, -0.5, 0.5, 0.5,
-3.891779, -4.440427, 0.1994441, 1, 1.5, 0.5, 0.5,
-3.891779, -4.440427, 0.1994441, 0, 1.5, 0.5, 0.5
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
-2, -3.370512, -5.203558,
3, -3.370512, -5.203558,
-2, -3.370512, -5.203558,
-2, -3.548831, -5.473708,
-1, -3.370512, -5.203558,
-1, -3.548831, -5.473708,
0, -3.370512, -5.203558,
0, -3.548831, -5.473708,
1, -3.370512, -5.203558,
1, -3.548831, -5.473708,
2, -3.370512, -5.203558,
2, -3.548831, -5.473708,
3, -3.370512, -5.203558,
3, -3.548831, -5.473708
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
-2, -3.90547, -6.014008, 0, -0.5, 0.5, 0.5,
-2, -3.90547, -6.014008, 1, -0.5, 0.5, 0.5,
-2, -3.90547, -6.014008, 1, 1.5, 0.5, 0.5,
-2, -3.90547, -6.014008, 0, 1.5, 0.5, 0.5,
-1, -3.90547, -6.014008, 0, -0.5, 0.5, 0.5,
-1, -3.90547, -6.014008, 1, -0.5, 0.5, 0.5,
-1, -3.90547, -6.014008, 1, 1.5, 0.5, 0.5,
-1, -3.90547, -6.014008, 0, 1.5, 0.5, 0.5,
0, -3.90547, -6.014008, 0, -0.5, 0.5, 0.5,
0, -3.90547, -6.014008, 1, -0.5, 0.5, 0.5,
0, -3.90547, -6.014008, 1, 1.5, 0.5, 0.5,
0, -3.90547, -6.014008, 0, 1.5, 0.5, 0.5,
1, -3.90547, -6.014008, 0, -0.5, 0.5, 0.5,
1, -3.90547, -6.014008, 1, -0.5, 0.5, 0.5,
1, -3.90547, -6.014008, 1, 1.5, 0.5, 0.5,
1, -3.90547, -6.014008, 0, 1.5, 0.5, 0.5,
2, -3.90547, -6.014008, 0, -0.5, 0.5, 0.5,
2, -3.90547, -6.014008, 1, -0.5, 0.5, 0.5,
2, -3.90547, -6.014008, 1, 1.5, 0.5, 0.5,
2, -3.90547, -6.014008, 0, 1.5, 0.5, 0.5,
3, -3.90547, -6.014008, 0, -0.5, 0.5, 0.5,
3, -3.90547, -6.014008, 1, -0.5, 0.5, 0.5,
3, -3.90547, -6.014008, 1, 1.5, 0.5, 0.5,
3, -3.90547, -6.014008, 0, 1.5, 0.5, 0.5
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
-2.975519, -3, -5.203558,
-2.975519, 3, -5.203558,
-2.975519, -3, -5.203558,
-3.128229, -3, -5.473708,
-2.975519, -2, -5.203558,
-3.128229, -2, -5.473708,
-2.975519, -1, -5.203558,
-3.128229, -1, -5.473708,
-2.975519, 0, -5.203558,
-3.128229, 0, -5.473708,
-2.975519, 1, -5.203558,
-3.128229, 1, -5.473708,
-2.975519, 2, -5.203558,
-3.128229, 2, -5.473708,
-2.975519, 3, -5.203558,
-3.128229, 3, -5.473708
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
-3.433649, -3, -6.014008, 0, -0.5, 0.5, 0.5,
-3.433649, -3, -6.014008, 1, -0.5, 0.5, 0.5,
-3.433649, -3, -6.014008, 1, 1.5, 0.5, 0.5,
-3.433649, -3, -6.014008, 0, 1.5, 0.5, 0.5,
-3.433649, -2, -6.014008, 0, -0.5, 0.5, 0.5,
-3.433649, -2, -6.014008, 1, -0.5, 0.5, 0.5,
-3.433649, -2, -6.014008, 1, 1.5, 0.5, 0.5,
-3.433649, -2, -6.014008, 0, 1.5, 0.5, 0.5,
-3.433649, -1, -6.014008, 0, -0.5, 0.5, 0.5,
-3.433649, -1, -6.014008, 1, -0.5, 0.5, 0.5,
-3.433649, -1, -6.014008, 1, 1.5, 0.5, 0.5,
-3.433649, -1, -6.014008, 0, 1.5, 0.5, 0.5,
-3.433649, 0, -6.014008, 0, -0.5, 0.5, 0.5,
-3.433649, 0, -6.014008, 1, -0.5, 0.5, 0.5,
-3.433649, 0, -6.014008, 1, 1.5, 0.5, 0.5,
-3.433649, 0, -6.014008, 0, 1.5, 0.5, 0.5,
-3.433649, 1, -6.014008, 0, -0.5, 0.5, 0.5,
-3.433649, 1, -6.014008, 1, -0.5, 0.5, 0.5,
-3.433649, 1, -6.014008, 1, 1.5, 0.5, 0.5,
-3.433649, 1, -6.014008, 0, 1.5, 0.5, 0.5,
-3.433649, 2, -6.014008, 0, -0.5, 0.5, 0.5,
-3.433649, 2, -6.014008, 1, -0.5, 0.5, 0.5,
-3.433649, 2, -6.014008, 1, 1.5, 0.5, 0.5,
-3.433649, 2, -6.014008, 0, 1.5, 0.5, 0.5,
-3.433649, 3, -6.014008, 0, -0.5, 0.5, 0.5,
-3.433649, 3, -6.014008, 1, -0.5, 0.5, 0.5,
-3.433649, 3, -6.014008, 1, 1.5, 0.5, 0.5,
-3.433649, 3, -6.014008, 0, 1.5, 0.5, 0.5
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
-2.975519, -3.370512, -4,
-2.975519, -3.370512, 4,
-2.975519, -3.370512, -4,
-3.128229, -3.548831, -4,
-2.975519, -3.370512, -2,
-3.128229, -3.548831, -2,
-2.975519, -3.370512, 0,
-3.128229, -3.548831, 0,
-2.975519, -3.370512, 2,
-3.128229, -3.548831, 2,
-2.975519, -3.370512, 4,
-3.128229, -3.548831, 4
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
-3.433649, -3.90547, -4, 0, -0.5, 0.5, 0.5,
-3.433649, -3.90547, -4, 1, -0.5, 0.5, 0.5,
-3.433649, -3.90547, -4, 1, 1.5, 0.5, 0.5,
-3.433649, -3.90547, -4, 0, 1.5, 0.5, 0.5,
-3.433649, -3.90547, -2, 0, -0.5, 0.5, 0.5,
-3.433649, -3.90547, -2, 1, -0.5, 0.5, 0.5,
-3.433649, -3.90547, -2, 1, 1.5, 0.5, 0.5,
-3.433649, -3.90547, -2, 0, 1.5, 0.5, 0.5,
-3.433649, -3.90547, 0, 0, -0.5, 0.5, 0.5,
-3.433649, -3.90547, 0, 1, -0.5, 0.5, 0.5,
-3.433649, -3.90547, 0, 1, 1.5, 0.5, 0.5,
-3.433649, -3.90547, 0, 0, 1.5, 0.5, 0.5,
-3.433649, -3.90547, 2, 0, -0.5, 0.5, 0.5,
-3.433649, -3.90547, 2, 1, -0.5, 0.5, 0.5,
-3.433649, -3.90547, 2, 1, 1.5, 0.5, 0.5,
-3.433649, -3.90547, 2, 0, 1.5, 0.5, 0.5,
-3.433649, -3.90547, 4, 0, -0.5, 0.5, 0.5,
-3.433649, -3.90547, 4, 1, -0.5, 0.5, 0.5,
-3.433649, -3.90547, 4, 1, 1.5, 0.5, 0.5,
-3.433649, -3.90547, 4, 0, 1.5, 0.5, 0.5
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
-2.975519, -3.370512, -5.203558,
-2.975519, 3.762259, -5.203558,
-2.975519, -3.370512, 5.602446,
-2.975519, 3.762259, 5.602446,
-2.975519, -3.370512, -5.203558,
-2.975519, -3.370512, 5.602446,
-2.975519, 3.762259, -5.203558,
-2.975519, 3.762259, 5.602446,
-2.975519, -3.370512, -5.203558,
3.132882, -3.370512, -5.203558,
-2.975519, -3.370512, 5.602446,
3.132882, -3.370512, 5.602446,
-2.975519, 3.762259, -5.203558,
3.132882, 3.762259, -5.203558,
-2.975519, 3.762259, 5.602446,
3.132882, 3.762259, 5.602446,
3.132882, -3.370512, -5.203558,
3.132882, 3.762259, -5.203558,
3.132882, -3.370512, 5.602446,
3.132882, 3.762259, 5.602446,
3.132882, -3.370512, -5.203558,
3.132882, -3.370512, 5.602446,
3.132882, 3.762259, -5.203558,
3.132882, 3.762259, 5.602446
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
var radius = 7.644668;
var distance = 34.01199;
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
mvMatrix.translate( -0.07868135, -0.1958733, -0.1994441 );
mvMatrix.scale( 1.353147, 1.158816, 0.7649049 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.01199);
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
diofenolan<-read.table("diofenolan.xyz")
```

```
## Error in read.table("diofenolan.xyz"): no lines available in input
```

```r
x<-diofenolan$V2
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
```

```r
y<-diofenolan$V3
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
```

```r
z<-diofenolan$V4
```

```
## Error in eval(expr, envir, enclos): object 'diofenolan' not found
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
-2.886562, 0.1730507, -0.3281562, 0, 0, 1, 1, 1,
-2.787004, 0.1613525, -2.436796, 1, 0, 0, 1, 1,
-2.688658, 0.8575521, -0.8103604, 1, 0, 0, 1, 1,
-2.566001, 1.808074, -0.04258255, 1, 0, 0, 1, 1,
-2.556734, -0.5250096, -1.264564, 1, 0, 0, 1, 1,
-2.542548, -1.235787, -1.616569, 1, 0, 0, 1, 1,
-2.455543, -0.5369257, -2.915159, 0, 0, 0, 1, 1,
-2.416935, -1.27285, -3.152875, 0, 0, 0, 1, 1,
-2.415151, 1.089127, -1.732649, 0, 0, 0, 1, 1,
-2.400688, 0.1732049, -1.79457, 0, 0, 0, 1, 1,
-2.394666, -2.285785, -3.20735, 0, 0, 0, 1, 1,
-2.352913, 0.3595354, -2.393308, 0, 0, 0, 1, 1,
-2.341421, -0.1551267, -1.977437, 0, 0, 0, 1, 1,
-2.311534, 2.062299, -0.9044859, 1, 1, 1, 1, 1,
-2.276106, -0.3073944, -2.55584, 1, 1, 1, 1, 1,
-2.212568, -0.6141776, -4.509725, 1, 1, 1, 1, 1,
-2.212334, -0.3665528, -1.208965, 1, 1, 1, 1, 1,
-2.130059, -0.07394559, -0.9636676, 1, 1, 1, 1, 1,
-2.126707, 0.3910933, -1.334248, 1, 1, 1, 1, 1,
-2.121549, -0.003700603, -1.14989, 1, 1, 1, 1, 1,
-2.074592, 0.009970339, -0.6741695, 1, 1, 1, 1, 1,
-2.071771, 0.397657, -2.263508, 1, 1, 1, 1, 1,
-2.071231, 0.7542923, -1.973575, 1, 1, 1, 1, 1,
-2.049831, 0.9261411, -0.9261425, 1, 1, 1, 1, 1,
-2.004577, -0.2749526, -0.864931, 1, 1, 1, 1, 1,
-1.988764, 1.792443, -2.131518, 1, 1, 1, 1, 1,
-1.977366, -1.092621, -2.710899, 1, 1, 1, 1, 1,
-1.962295, -1.11387, -4.238963, 1, 1, 1, 1, 1,
-1.947617, -0.7452203, -0.1857236, 0, 0, 1, 1, 1,
-1.928059, 0.4400902, -2.234456, 1, 0, 0, 1, 1,
-1.899003, 0.007644232, -2.983612, 1, 0, 0, 1, 1,
-1.885832, 0.5621312, 0.3865432, 1, 0, 0, 1, 1,
-1.877581, -1.207741, -0.9348161, 1, 0, 0, 1, 1,
-1.870729, -0.4105997, -2.214637, 1, 0, 0, 1, 1,
-1.86546, 0.9102585, -0.318545, 0, 0, 0, 1, 1,
-1.865232, -1.089994, -3.316448, 0, 0, 0, 1, 1,
-1.857996, 1.129862, -3.649755, 0, 0, 0, 1, 1,
-1.846624, -0.6809913, -1.151065, 0, 0, 0, 1, 1,
-1.840836, -0.9390577, -2.100302, 0, 0, 0, 1, 1,
-1.840192, 0.3091164, -1.691922, 0, 0, 0, 1, 1,
-1.825112, 0.6946492, -2.150689, 0, 0, 0, 1, 1,
-1.816861, -0.8185146, -3.39852, 1, 1, 1, 1, 1,
-1.794786, -1.194155, -4.187129, 1, 1, 1, 1, 1,
-1.788185, 3.059678, 1.610586, 1, 1, 1, 1, 1,
-1.784975, 0.1453247, -3.014799, 1, 1, 1, 1, 1,
-1.780406, 0.7832133, -0.1073198, 1, 1, 1, 1, 1,
-1.776911, 0.3161041, -0.4135004, 1, 1, 1, 1, 1,
-1.763036, -0.9356086, -2.286868, 1, 1, 1, 1, 1,
-1.760879, -1.266564, -2.182453, 1, 1, 1, 1, 1,
-1.750883, 0.7025626, -0.6625293, 1, 1, 1, 1, 1,
-1.749464, 0.1557689, -1.925056, 1, 1, 1, 1, 1,
-1.738663, -0.006055775, -0.3705462, 1, 1, 1, 1, 1,
-1.737689, -0.6643161, -1.960963, 1, 1, 1, 1, 1,
-1.713996, 0.7414836, -0.6869438, 1, 1, 1, 1, 1,
-1.693509, -0.1278854, 0.52696, 1, 1, 1, 1, 1,
-1.670431, 0.7821285, -2.729695, 1, 1, 1, 1, 1,
-1.656739, -1.951522, -2.928628, 0, 0, 1, 1, 1,
-1.652806, -0.8028808, -2.536344, 1, 0, 0, 1, 1,
-1.641937, 0.5707566, -0.3721581, 1, 0, 0, 1, 1,
-1.629156, 0.2577158, -1.246721, 1, 0, 0, 1, 1,
-1.628884, 0.4400568, -1.017637, 1, 0, 0, 1, 1,
-1.611371, 2.025699, -2.039184, 1, 0, 0, 1, 1,
-1.595127, 0.2397477, -0.7681014, 0, 0, 0, 1, 1,
-1.594781, 1.825638, -1.151159, 0, 0, 0, 1, 1,
-1.594708, 0.3759706, -1.332698, 0, 0, 0, 1, 1,
-1.577542, 0.5000685, -1.280484, 0, 0, 0, 1, 1,
-1.572463, 1.09416, 0.08950657, 0, 0, 0, 1, 1,
-1.557264, 0.03306672, -1.40777, 0, 0, 0, 1, 1,
-1.551243, -1.157531, -1.381023, 0, 0, 0, 1, 1,
-1.54885, -0.08174346, -0.679367, 1, 1, 1, 1, 1,
-1.540436, 0.690407, -3.003802, 1, 1, 1, 1, 1,
-1.53962, -0.9860779, -1.400819, 1, 1, 1, 1, 1,
-1.521164, -2.156369, -3.243879, 1, 1, 1, 1, 1,
-1.519519, 0.2328541, -2.458728, 1, 1, 1, 1, 1,
-1.506898, -1.478401, -3.554657, 1, 1, 1, 1, 1,
-1.493067, -0.1505926, -0.9433354, 1, 1, 1, 1, 1,
-1.466518, -1.162404, -1.684572, 1, 1, 1, 1, 1,
-1.461011, -0.1609512, 0.04909789, 1, 1, 1, 1, 1,
-1.449571, -0.2712765, -1.430957, 1, 1, 1, 1, 1,
-1.430864, -1.270423, -3.098601, 1, 1, 1, 1, 1,
-1.43027, 0.3361313, -0.2686365, 1, 1, 1, 1, 1,
-1.413942, -1.607775, -2.005871, 1, 1, 1, 1, 1,
-1.410141, -0.3371862, -1.4186, 1, 1, 1, 1, 1,
-1.408192, 3.658383, -1.365258, 1, 1, 1, 1, 1,
-1.388525, 0.4366788, -1.28864, 0, 0, 1, 1, 1,
-1.386331, -0.7891286, -4.457168, 1, 0, 0, 1, 1,
-1.378621, 2.360078, -1.788092, 1, 0, 0, 1, 1,
-1.37421, -0.2141801, -3.275505, 1, 0, 0, 1, 1,
-1.37356, -1.182566, -2.429777, 1, 0, 0, 1, 1,
-1.365658, -0.4725388, -2.369923, 1, 0, 0, 1, 1,
-1.353914, 0.7482595, -1.469786, 0, 0, 0, 1, 1,
-1.352471, 0.405515, -0.1283168, 0, 0, 0, 1, 1,
-1.351232, -0.2878548, -2.275325, 0, 0, 0, 1, 1,
-1.343023, 0.246851, -0.5172684, 0, 0, 0, 1, 1,
-1.332832, 0.5878156, -1.631746, 0, 0, 0, 1, 1,
-1.319386, 1.324683, 0.9966221, 0, 0, 0, 1, 1,
-1.316659, 0.6515059, -0.920101, 0, 0, 0, 1, 1,
-1.315995, 1.293149, -1.095442, 1, 1, 1, 1, 1,
-1.287951, -0.32104, -1.958367, 1, 1, 1, 1, 1,
-1.28506, -1.799301, -3.830513, 1, 1, 1, 1, 1,
-1.280499, 0.1602179, -1.057508, 1, 1, 1, 1, 1,
-1.272518, -0.4690445, -3.301389, 1, 1, 1, 1, 1,
-1.266408, 0.7255961, -1.297549, 1, 1, 1, 1, 1,
-1.26531, -2.345666, -2.055664, 1, 1, 1, 1, 1,
-1.255008, 1.315581, 0.09424336, 1, 1, 1, 1, 1,
-1.254594, -0.315062, -1.043149, 1, 1, 1, 1, 1,
-1.246867, 0.8012059, -1.45193, 1, 1, 1, 1, 1,
-1.246614, -0.9898043, -2.379972, 1, 1, 1, 1, 1,
-1.234516, 1.440481, -2.139504, 1, 1, 1, 1, 1,
-1.229609, -1.415104, -2.50525, 1, 1, 1, 1, 1,
-1.22717, 0.8958045, -0.888274, 1, 1, 1, 1, 1,
-1.221628, -1.196236, -1.676453, 1, 1, 1, 1, 1,
-1.214159, -0.6910021, -1.388827, 0, 0, 1, 1, 1,
-1.202514, -0.2882009, -0.6700009, 1, 0, 0, 1, 1,
-1.199088, -1.929079, -2.334921, 1, 0, 0, 1, 1,
-1.194457, 0.3751248, -1.946202, 1, 0, 0, 1, 1,
-1.188375, 1.448783, -1.767416, 1, 0, 0, 1, 1,
-1.187017, 0.7353242, -0.5323147, 1, 0, 0, 1, 1,
-1.174022, 0.925894, -0.7531174, 0, 0, 0, 1, 1,
-1.168705, -0.3595613, -1.329281, 0, 0, 0, 1, 1,
-1.167564, 1.656291, -0.08500624, 0, 0, 0, 1, 1,
-1.164289, 0.6972821, -1.436898, 0, 0, 0, 1, 1,
-1.162798, -0.7937245, -0.151013, 0, 0, 0, 1, 1,
-1.162744, 0.9408485, -0.8936047, 0, 0, 0, 1, 1,
-1.152215, -0.1548201, -3.33319, 0, 0, 0, 1, 1,
-1.151756, -0.9766296, -3.056934, 1, 1, 1, 1, 1,
-1.151744, -0.3060763, -2.952008, 1, 1, 1, 1, 1,
-1.144789, -0.5054176, -2.294771, 1, 1, 1, 1, 1,
-1.140625, 2.005617, -1.203604, 1, 1, 1, 1, 1,
-1.138327, 0.08222166, -1.32287, 1, 1, 1, 1, 1,
-1.132067, 1.753612, -0.1143217, 1, 1, 1, 1, 1,
-1.131622, 0.1449256, -2.814889, 1, 1, 1, 1, 1,
-1.127792, -0.3260093, 0.7459008, 1, 1, 1, 1, 1,
-1.123935, -1.281606, -2.893276, 1, 1, 1, 1, 1,
-1.123374, 2.100374, -1.375425, 1, 1, 1, 1, 1,
-1.121561, -0.9216731, -1.913694, 1, 1, 1, 1, 1,
-1.115822, 0.233129, -0.01521027, 1, 1, 1, 1, 1,
-1.112235, -0.4907279, -3.42159, 1, 1, 1, 1, 1,
-1.108286, -0.1687195, -3.366726, 1, 1, 1, 1, 1,
-1.10612, -1.354075, -1.446586, 1, 1, 1, 1, 1,
-1.102489, -1.036737, -2.967216, 0, 0, 1, 1, 1,
-1.09859, -0.6033949, -1.585655, 1, 0, 0, 1, 1,
-1.090204, 0.1081662, -2.154571, 1, 0, 0, 1, 1,
-1.086787, 0.4637619, -1.177566, 1, 0, 0, 1, 1,
-1.083407, -1.020638, -2.515436, 1, 0, 0, 1, 1,
-1.083261, 1.874979, 0.002306154, 1, 0, 0, 1, 1,
-1.076675, -0.9615308, -1.613365, 0, 0, 0, 1, 1,
-1.076039, -0.4719947, -4.003788, 0, 0, 0, 1, 1,
-1.065396, 1.784759, -1.642157, 0, 0, 0, 1, 1,
-1.064589, 1.359581, -0.3373327, 0, 0, 0, 1, 1,
-1.062856, 0.5640863, -1.290665, 0, 0, 0, 1, 1,
-1.060254, 0.07617348, -2.60221, 0, 0, 0, 1, 1,
-1.051284, -0.08777066, 0.3659627, 0, 0, 0, 1, 1,
-1.050691, -0.2810099, -0.9839796, 1, 1, 1, 1, 1,
-1.048238, 0.1197196, -0.4624812, 1, 1, 1, 1, 1,
-1.047563, 2.291113, -1.539017, 1, 1, 1, 1, 1,
-1.043039, -0.3661218, -1.034203, 1, 1, 1, 1, 1,
-1.040942, -0.01402277, -2.042628, 1, 1, 1, 1, 1,
-1.038009, -0.6901736, -2.997763, 1, 1, 1, 1, 1,
-1.031776, 1.693375, -0.05245786, 1, 1, 1, 1, 1,
-1.030583, 0.4233329, -1.2694, 1, 1, 1, 1, 1,
-1.020875, 0.9452811, -0.8488871, 1, 1, 1, 1, 1,
-1.016869, 0.2139813, -0.984421, 1, 1, 1, 1, 1,
-1.010572, 1.700709, -0.650925, 1, 1, 1, 1, 1,
-1.000554, -1.063459, -1.596843, 1, 1, 1, 1, 1,
-0.995544, -0.7653584, -0.8086545, 1, 1, 1, 1, 1,
-0.9939343, 1.506997, 0.1613905, 1, 1, 1, 1, 1,
-0.983259, 0.2175066, -0.5082953, 1, 1, 1, 1, 1,
-0.9786854, 0.1859931, -1.279946, 0, 0, 1, 1, 1,
-0.9713225, 0.3791167, 0.6847733, 1, 0, 0, 1, 1,
-0.958681, 0.2938637, -1.475927, 1, 0, 0, 1, 1,
-0.9542428, -0.09062593, -1.542714, 1, 0, 0, 1, 1,
-0.9540441, 1.085851, -0.1598718, 1, 0, 0, 1, 1,
-0.9434585, 1.04988, -0.7764075, 1, 0, 0, 1, 1,
-0.9410599, 0.3717777, -3.231995, 0, 0, 0, 1, 1,
-0.9324024, -1.678939, -3.525519, 0, 0, 0, 1, 1,
-0.9295197, -1.169327, -3.115802, 0, 0, 0, 1, 1,
-0.9291677, -0.9560903, -0.1324643, 0, 0, 0, 1, 1,
-0.9290146, 0.4030361, -0.3653717, 0, 0, 0, 1, 1,
-0.9243385, -0.5887117, -2.116343, 0, 0, 0, 1, 1,
-0.9221147, -1.508053, -2.878212, 0, 0, 0, 1, 1,
-0.9139227, 1.700009, -0.3316565, 1, 1, 1, 1, 1,
-0.9100897, 0.2341963, 0.4540937, 1, 1, 1, 1, 1,
-0.9059125, 0.8773181, -0.6992081, 1, 1, 1, 1, 1,
-0.9049684, -0.4030211, -2.33138, 1, 1, 1, 1, 1,
-0.9021979, 0.5635462, -1.663811, 1, 1, 1, 1, 1,
-0.9011489, -0.1365642, -1.403065, 1, 1, 1, 1, 1,
-0.8992182, -0.4249973, -0.6550319, 1, 1, 1, 1, 1,
-0.8962098, -0.07288482, -0.4729199, 1, 1, 1, 1, 1,
-0.8886652, -0.6090178, -3.322596, 1, 1, 1, 1, 1,
-0.8861651, 1.576059, -0.522391, 1, 1, 1, 1, 1,
-0.886032, -0.7443351, -1.528887, 1, 1, 1, 1, 1,
-0.8848646, 0.5240342, -1.278285, 1, 1, 1, 1, 1,
-0.882813, 0.04698204, -1.30392, 1, 1, 1, 1, 1,
-0.8793406, 1.201664, 0.009886703, 1, 1, 1, 1, 1,
-0.8651868, -1.360266, -2.799477, 1, 1, 1, 1, 1,
-0.8603773, 1.019426, -1.203038, 0, 0, 1, 1, 1,
-0.8528937, -0.1925134, -1.281984, 1, 0, 0, 1, 1,
-0.8477191, -0.6460971, -2.150661, 1, 0, 0, 1, 1,
-0.84646, 1.279782, -0.5466104, 1, 0, 0, 1, 1,
-0.8417791, -0.618384, -1.553984, 1, 0, 0, 1, 1,
-0.8404211, 1.092056, 0.4737397, 1, 0, 0, 1, 1,
-0.8381864, -0.2484671, -2.061759, 0, 0, 0, 1, 1,
-0.83683, 0.1378327, -1.046949, 0, 0, 0, 1, 1,
-0.8298922, 0.4371381, -1.237779, 0, 0, 0, 1, 1,
-0.8265491, 1.312946, 0.08481594, 0, 0, 0, 1, 1,
-0.8256314, 0.01538657, -0.525122, 0, 0, 0, 1, 1,
-0.8139479, 0.5037, -0.6350796, 0, 0, 0, 1, 1,
-0.8131683, 1.929408, 0.3652199, 0, 0, 0, 1, 1,
-0.8005853, -0.162738, -0.1462667, 1, 1, 1, 1, 1,
-0.7954773, -0.3794939, -0.9512745, 1, 1, 1, 1, 1,
-0.7945608, 0.5426882, -0.1582927, 1, 1, 1, 1, 1,
-0.7865471, -0.6526519, -3.801563, 1, 1, 1, 1, 1,
-0.7858908, 0.2992759, -1.910441, 1, 1, 1, 1, 1,
-0.7849417, 1.064576, 1.030188, 1, 1, 1, 1, 1,
-0.782476, 0.7697954, -0.4680751, 1, 1, 1, 1, 1,
-0.7809861, 0.8805144, -2.298171, 1, 1, 1, 1, 1,
-0.775192, 1.211068, -2.213392, 1, 1, 1, 1, 1,
-0.7616295, 0.08498382, -1.251831, 1, 1, 1, 1, 1,
-0.7580932, 0.7643099, -1.832379, 1, 1, 1, 1, 1,
-0.7579011, 1.066698, -1.438283, 1, 1, 1, 1, 1,
-0.7570444, -0.6600991, -1.612204, 1, 1, 1, 1, 1,
-0.7546297, -1.095537, -0.9341898, 1, 1, 1, 1, 1,
-0.7533454, -2.039977, -2.60424, 1, 1, 1, 1, 1,
-0.7475232, 0.7048524, -2.57553, 0, 0, 1, 1, 1,
-0.7446897, 0.9902157, -0.00655303, 1, 0, 0, 1, 1,
-0.7440751, 0.1425479, -2.074911, 1, 0, 0, 1, 1,
-0.7404571, -2.821209, -4.38167, 1, 0, 0, 1, 1,
-0.7358998, -1.341184, -3.074044, 1, 0, 0, 1, 1,
-0.7284751, -0.2481222, -0.8396228, 1, 0, 0, 1, 1,
-0.7237527, 1.063168, -0.3463305, 0, 0, 0, 1, 1,
-0.7207972, 0.6792244, 0.3490858, 0, 0, 0, 1, 1,
-0.7163907, -0.8874272, -2.414952, 0, 0, 0, 1, 1,
-0.7139383, -0.4944423, -4.269753, 0, 0, 0, 1, 1,
-0.7115659, 0.7359217, -0.0664808, 0, 0, 0, 1, 1,
-0.706989, -0.225441, -1.083382, 0, 0, 0, 1, 1,
-0.7007796, -0.376789, -0.7362711, 0, 0, 0, 1, 1,
-0.7000888, -0.8974904, -2.152783, 1, 1, 1, 1, 1,
-0.6997956, 0.5625926, -2.621313, 1, 1, 1, 1, 1,
-0.6997017, 0.450341, -2.148282, 1, 1, 1, 1, 1,
-0.687431, 0.264347, -1.834384, 1, 1, 1, 1, 1,
-0.6836697, 0.6445511, -1.067046, 1, 1, 1, 1, 1,
-0.6801097, 0.2281412, -2.679412, 1, 1, 1, 1, 1,
-0.6747749, 0.6899081, -1.411023, 1, 1, 1, 1, 1,
-0.6655572, -0.5204431, -4.459719, 1, 1, 1, 1, 1,
-0.6637105, 1.323428, 0.855793, 1, 1, 1, 1, 1,
-0.6631058, 2.061396, -1.792301, 1, 1, 1, 1, 1,
-0.6609796, 2.107404, -0.2059952, 1, 1, 1, 1, 1,
-0.6586363, 0.548887, -1.301878, 1, 1, 1, 1, 1,
-0.652789, -1.04979, -4.092322, 1, 1, 1, 1, 1,
-0.647707, -0.6881062, -2.053696, 1, 1, 1, 1, 1,
-0.6398226, -1.516217, -4.591998, 1, 1, 1, 1, 1,
-0.6368292, 0.2244529, -1.820729, 0, 0, 1, 1, 1,
-0.6347613, -0.7994961, -2.427184, 1, 0, 0, 1, 1,
-0.6342604, -0.03123252, -0.644267, 1, 0, 0, 1, 1,
-0.6325256, -1.345634, -1.376371, 1, 0, 0, 1, 1,
-0.6192036, 1.809328, 0.7786477, 1, 0, 0, 1, 1,
-0.6173921, -0.887935, -1.343047, 1, 0, 0, 1, 1,
-0.6040086, 0.4771176, -1.71276, 0, 0, 0, 1, 1,
-0.6032387, 0.4497158, -0.1188905, 0, 0, 0, 1, 1,
-0.5994554, -0.405108, -1.512025, 0, 0, 0, 1, 1,
-0.5883145, -0.3389853, -3.115164, 0, 0, 0, 1, 1,
-0.5876589, 0.3413799, 0.7624421, 0, 0, 0, 1, 1,
-0.5863824, 0.8876797, 0.1351284, 0, 0, 0, 1, 1,
-0.5826916, -1.390168, -3.452761, 0, 0, 0, 1, 1,
-0.5806354, 0.7042362, -0.8523774, 1, 1, 1, 1, 1,
-0.5778161, -1.024732, -4.395592, 1, 1, 1, 1, 1,
-0.5726723, -0.3519155, -3.00088, 1, 1, 1, 1, 1,
-0.5712714, 1.87012, -1.267264, 1, 1, 1, 1, 1,
-0.5644553, 0.2844758, -2.973684, 1, 1, 1, 1, 1,
-0.5612407, -0.1949811, -1.836045, 1, 1, 1, 1, 1,
-0.5554224, -0.4299741, -0.5105657, 1, 1, 1, 1, 1,
-0.5546992, 0.7159606, -0.3245404, 1, 1, 1, 1, 1,
-0.5534995, -1.023258, -3.32554, 1, 1, 1, 1, 1,
-0.5510634, 0.4507315, -1.233227, 1, 1, 1, 1, 1,
-0.5464171, 0.623893, -1.114776, 1, 1, 1, 1, 1,
-0.5404453, -2.065077, -1.742959, 1, 1, 1, 1, 1,
-0.5338261, -0.3554355, -2.359867, 1, 1, 1, 1, 1,
-0.5335539, -0.6604605, -2.864906, 1, 1, 1, 1, 1,
-0.5317085, 1.347318, -1.056629, 1, 1, 1, 1, 1,
-0.5288448, -1.31003, -2.023721, 0, 0, 1, 1, 1,
-0.5275704, -0.7144128, -2.720056, 1, 0, 0, 1, 1,
-0.5138059, 0.1779571, -1.599419, 1, 0, 0, 1, 1,
-0.5134875, 0.3830509, -1.153997, 1, 0, 0, 1, 1,
-0.5114331, -1.097002, -3.30533, 1, 0, 0, 1, 1,
-0.5114261, -0.1227799, -0.5803136, 1, 0, 0, 1, 1,
-0.5017305, -0.6257948, -3.458782, 0, 0, 0, 1, 1,
-0.4982376, -1.013727, -2.741022, 0, 0, 0, 1, 1,
-0.4975661, 0.7641492, -1.020052, 0, 0, 0, 1, 1,
-0.4953669, 1.315836, -0.3493444, 0, 0, 0, 1, 1,
-0.4929666, 0.4015859, -1.875437, 0, 0, 0, 1, 1,
-0.489482, 0.861691, -1.671552, 0, 0, 0, 1, 1,
-0.4864517, -1.602332, -0.05285366, 0, 0, 0, 1, 1,
-0.481255, -0.8685576, -3.428068, 1, 1, 1, 1, 1,
-0.4707662, -1.048295, -1.295816, 1, 1, 1, 1, 1,
-0.469629, 0.4988423, -1.056723, 1, 1, 1, 1, 1,
-0.4661115, -0.08997349, -1.710403, 1, 1, 1, 1, 1,
-0.4657947, -3.175434, -2.474764, 1, 1, 1, 1, 1,
-0.4643698, -1.394964, -2.882146, 1, 1, 1, 1, 1,
-0.4633248, 0.1316198, -0.8113118, 1, 1, 1, 1, 1,
-0.4605332, -0.971724, -2.55367, 1, 1, 1, 1, 1,
-0.4603467, -0.4684468, -1.245078, 1, 1, 1, 1, 1,
-0.4591749, -1.082354, -2.591999, 1, 1, 1, 1, 1,
-0.4589899, -0.9873582, -2.710607, 1, 1, 1, 1, 1,
-0.4583753, 0.8182954, -0.6868033, 1, 1, 1, 1, 1,
-0.4579463, -0.607905, -1.397589, 1, 1, 1, 1, 1,
-0.4566344, 0.865243, -2.415671, 1, 1, 1, 1, 1,
-0.4481928, -1.172856, -3.004636, 1, 1, 1, 1, 1,
-0.4347011, -0.7329823, -0.8622847, 0, 0, 1, 1, 1,
-0.4295743, -3.266637, -2.065104, 1, 0, 0, 1, 1,
-0.4285591, -0.2949168, -2.123274, 1, 0, 0, 1, 1,
-0.4282819, 0.7309953, -1.121043, 1, 0, 0, 1, 1,
-0.4242643, -0.07372363, -1.507452, 1, 0, 0, 1, 1,
-0.4199463, -0.2480443, -2.775883, 1, 0, 0, 1, 1,
-0.419849, -0.6137544, -3.008552, 0, 0, 0, 1, 1,
-0.4168068, 0.3984652, -0.222763, 0, 0, 0, 1, 1,
-0.4146783, 0.9087265, 1.464144, 0, 0, 0, 1, 1,
-0.4127094, 0.6470826, 0.9020471, 0, 0, 0, 1, 1,
-0.411297, -1.231058, -3.634592, 0, 0, 0, 1, 1,
-0.4054662, -1.139596, -3.262351, 0, 0, 0, 1, 1,
-0.4016695, 0.2291366, -0.6435929, 0, 0, 0, 1, 1,
-0.3975347, -1.097155, -2.702298, 1, 1, 1, 1, 1,
-0.3940185, 1.08191, 1.20159, 1, 1, 1, 1, 1,
-0.3936159, -1.373513, -3.125025, 1, 1, 1, 1, 1,
-0.3929735, -0.419678, -1.691696, 1, 1, 1, 1, 1,
-0.3908707, 0.03709876, -2.097389, 1, 1, 1, 1, 1,
-0.3857903, -0.5601948, -3.045967, 1, 1, 1, 1, 1,
-0.3803561, -0.4411605, -3.87398, 1, 1, 1, 1, 1,
-0.3754065, 0.0519604, -0.4830304, 1, 1, 1, 1, 1,
-0.3732117, 0.3446769, -2.274584, 1, 1, 1, 1, 1,
-0.3688447, -0.1135869, -3.187391, 1, 1, 1, 1, 1,
-0.3669813, 1.126728, -0.2272635, 1, 1, 1, 1, 1,
-0.366028, -0.7511398, -3.28635, 1, 1, 1, 1, 1,
-0.3648809, 0.2743991, 0.8412737, 1, 1, 1, 1, 1,
-0.3638731, -1.093071, -4.602822, 1, 1, 1, 1, 1,
-0.361506, -0.05584648, -1.489594, 1, 1, 1, 1, 1,
-0.3603853, -1.426065, -1.93621, 0, 0, 1, 1, 1,
-0.3594366, -0.06288384, -2.910082, 1, 0, 0, 1, 1,
-0.3585571, -0.02327728, -1.767027, 1, 0, 0, 1, 1,
-0.3579197, 0.2105794, -0.5692093, 1, 0, 0, 1, 1,
-0.356209, -0.4906573, -1.558602, 1, 0, 0, 1, 1,
-0.355224, 0.1029528, -1.176116, 1, 0, 0, 1, 1,
-0.3532719, -0.005986741, -3.4061, 0, 0, 0, 1, 1,
-0.3516349, 0.1829209, -2.579605, 0, 0, 0, 1, 1,
-0.3467975, 1.300217, 0.08314399, 0, 0, 0, 1, 1,
-0.3445456, 0.760411, -0.596523, 0, 0, 0, 1, 1,
-0.3355221, 0.4570084, -0.2635922, 0, 0, 0, 1, 1,
-0.3309082, 1.451992, 0.9867361, 0, 0, 0, 1, 1,
-0.3305363, -0.5652879, -3.58489, 0, 0, 0, 1, 1,
-0.3268686, 2.032763, -0.1796479, 1, 1, 1, 1, 1,
-0.3245034, -1.050932, -1.262034, 1, 1, 1, 1, 1,
-0.3234794, -0.6754869, -2.873873, 1, 1, 1, 1, 1,
-0.3191654, -1.251947, -2.19047, 1, 1, 1, 1, 1,
-0.3185208, -0.06863795, -3.18089, 1, 1, 1, 1, 1,
-0.3172818, -1.062725, -2.337843, 1, 1, 1, 1, 1,
-0.3165653, -0.3802315, -3.954024, 1, 1, 1, 1, 1,
-0.3018276, 0.4699825, -1.3655, 1, 1, 1, 1, 1,
-0.3008851, -0.08410551, -2.252678, 1, 1, 1, 1, 1,
-0.2949813, -1.425752, -3.874369, 1, 1, 1, 1, 1,
-0.2896062, 0.8758116, -0.5954049, 1, 1, 1, 1, 1,
-0.2883243, -0.7821851, -2.830492, 1, 1, 1, 1, 1,
-0.2823319, -0.1161117, -1.816712, 1, 1, 1, 1, 1,
-0.2798823, -0.6022824, -3.338314, 1, 1, 1, 1, 1,
-0.2798388, 1.222401, 0.9012566, 1, 1, 1, 1, 1,
-0.2797984, 0.9810479, -0.4553475, 0, 0, 1, 1, 1,
-0.2791668, 0.8185824, 0.2834412, 1, 0, 0, 1, 1,
-0.2789076, -0.8531137, -1.582591, 1, 0, 0, 1, 1,
-0.2755383, -0.5354931, -2.738626, 1, 0, 0, 1, 1,
-0.2739854, 0.09224527, 0.460894, 1, 0, 0, 1, 1,
-0.2739588, -0.2867877, -3.285925, 1, 0, 0, 1, 1,
-0.273684, 1.480559, -0.8786429, 0, 0, 0, 1, 1,
-0.2707829, 0.4700677, -0.7338376, 0, 0, 0, 1, 1,
-0.2703433, 0.1565822, -1.527497, 0, 0, 0, 1, 1,
-0.2687903, -0.3861205, -1.557901, 0, 0, 0, 1, 1,
-0.2682466, -0.8719648, -2.01815, 0, 0, 0, 1, 1,
-0.2678809, -1.250811, -1.26276, 0, 0, 0, 1, 1,
-0.2652782, 1.184467, -0.1739437, 0, 0, 0, 1, 1,
-0.2627559, 0.5447084, -2.174151, 1, 1, 1, 1, 1,
-0.2587372, -0.656947, -1.66584, 1, 1, 1, 1, 1,
-0.2583914, 1.395479, -0.1381365, 1, 1, 1, 1, 1,
-0.2560378, -1.077412, -3.947127, 1, 1, 1, 1, 1,
-0.2552364, -0.8598402, -1.304519, 1, 1, 1, 1, 1,
-0.2521048, -1.232523, -2.8663, 1, 1, 1, 1, 1,
-0.2492714, 0.8827809, 0.1477241, 1, 1, 1, 1, 1,
-0.2474028, 1.174609, -0.1406048, 1, 1, 1, 1, 1,
-0.2369254, -0.2156478, -2.527464, 1, 1, 1, 1, 1,
-0.2310151, -0.9178312, -4.109089, 1, 1, 1, 1, 1,
-0.2262958, 0.2094335, -0.2532946, 1, 1, 1, 1, 1,
-0.2241717, 0.1610537, 0.4766679, 1, 1, 1, 1, 1,
-0.2235392, 0.1266592, 0.1737161, 1, 1, 1, 1, 1,
-0.2223428, 1.006815, 0.5075729, 1, 1, 1, 1, 1,
-0.2200541, 0.2627339, 0.09764116, 1, 1, 1, 1, 1,
-0.2171212, -0.6170787, -1.765427, 0, 0, 1, 1, 1,
-0.2135144, 1.351447, 1.46383, 1, 0, 0, 1, 1,
-0.2119099, 0.8811404, 0.471632, 1, 0, 0, 1, 1,
-0.2109272, 0.4109504, -0.4992959, 1, 0, 0, 1, 1,
-0.2106208, 2.910801, 1.154696, 1, 0, 0, 1, 1,
-0.2092522, -1.22751, -2.199343, 1, 0, 0, 1, 1,
-0.2030104, 0.1069624, -1.663189, 0, 0, 0, 1, 1,
-0.2023905, -1.869496, -2.278368, 0, 0, 0, 1, 1,
-0.1992682, -1.257171, -3.5253, 0, 0, 0, 1, 1,
-0.1952255, -0.208113, -1.717841, 0, 0, 0, 1, 1,
-0.1950277, 0.7939119, -0.8639953, 0, 0, 0, 1, 1,
-0.1918726, 0.3140624, -1.859333, 0, 0, 0, 1, 1,
-0.190109, -1.106153, -2.697951, 0, 0, 0, 1, 1,
-0.1869987, 0.100423, -2.190943, 1, 1, 1, 1, 1,
-0.183179, 0.8005943, -0.07512185, 1, 1, 1, 1, 1,
-0.1774287, 2.233463, -1.581022, 1, 1, 1, 1, 1,
-0.1764666, -0.8034639, -1.498108, 1, 1, 1, 1, 1,
-0.1729725, -1.184083, -2.159573, 1, 1, 1, 1, 1,
-0.1717513, -0.7614649, -4.724273, 1, 1, 1, 1, 1,
-0.1684896, -0.9966087, -4.515053, 1, 1, 1, 1, 1,
-0.1664494, 0.8639265, 1.231982, 1, 1, 1, 1, 1,
-0.1654391, 0.4830147, 2.003133, 1, 1, 1, 1, 1,
-0.1625045, -2.87029, -3.170237, 1, 1, 1, 1, 1,
-0.1579859, 0.2344205, 0.09273142, 1, 1, 1, 1, 1,
-0.1502319, 1.323789, 0.8630235, 1, 1, 1, 1, 1,
-0.1470728, -1.783311, -3.103091, 1, 1, 1, 1, 1,
-0.1466471, 0.9126221, -1.189978, 1, 1, 1, 1, 1,
-0.1452563, 0.2835255, -0.5408326, 1, 1, 1, 1, 1,
-0.1409894, 0.4087625, 0.2349588, 0, 0, 1, 1, 1,
-0.1401892, 1.227772, -1.593343, 1, 0, 0, 1, 1,
-0.1395319, 1.332879, -1.328719, 1, 0, 0, 1, 1,
-0.1354623, -0.8705438, -3.641515, 1, 0, 0, 1, 1,
-0.1350257, 0.6756191, 0.4933348, 1, 0, 0, 1, 1,
-0.1327749, 0.3313363, 0.5980247, 1, 0, 0, 1, 1,
-0.1307619, -1.173177, -4.286251, 0, 0, 0, 1, 1,
-0.130312, -0.2075781, -2.874023, 0, 0, 0, 1, 1,
-0.1262295, 0.3791785, -1.068386, 0, 0, 0, 1, 1,
-0.1246971, 1.023101, 0.9480349, 0, 0, 0, 1, 1,
-0.1235751, -0.05973845, -2.316445, 0, 0, 0, 1, 1,
-0.1216075, -0.3185122, -2.001752, 0, 0, 0, 1, 1,
-0.1174978, 0.1802138, -1.375476, 0, 0, 0, 1, 1,
-0.115554, -0.626324, -3.218084, 1, 1, 1, 1, 1,
-0.1143479, 0.187331, -3.448061, 1, 1, 1, 1, 1,
-0.1140788, 0.8642017, -0.09993422, 1, 1, 1, 1, 1,
-0.1119226, 2.291463, -0.8492872, 1, 1, 1, 1, 1,
-0.1114799, 0.1219912, -0.4507076, 1, 1, 1, 1, 1,
-0.106138, 1.071954, -0.5384843, 1, 1, 1, 1, 1,
-0.1041362, -0.564898, -2.779676, 1, 1, 1, 1, 1,
-0.09757409, 1.5717, 1.822667, 1, 1, 1, 1, 1,
-0.09337193, -0.984401, -3.396871, 1, 1, 1, 1, 1,
-0.09270833, -0.02875228, 0.6766164, 1, 1, 1, 1, 1,
-0.08769496, -0.000754647, -3.45585, 1, 1, 1, 1, 1,
-0.0855387, -1.236713, -3.704585, 1, 1, 1, 1, 1,
-0.08521363, 0.6847084, -0.4455501, 1, 1, 1, 1, 1,
-0.08417795, 0.09547795, 1.053249, 1, 1, 1, 1, 1,
-0.08213648, -0.3102587, -2.308208, 1, 1, 1, 1, 1,
-0.07840822, -1.993447, -1.604305, 0, 0, 1, 1, 1,
-0.07639936, -0.1527554, -2.903009, 1, 0, 0, 1, 1,
-0.07469729, -0.5340018, -4.623886, 1, 0, 0, 1, 1,
-0.06355996, -1.3602, -1.802922, 1, 0, 0, 1, 1,
-0.06193279, 0.8328624, -0.1002759, 1, 0, 0, 1, 1,
-0.0611841, 1.559356, 0.05594787, 1, 0, 0, 1, 1,
-0.06115326, -0.9667777, -2.532945, 0, 0, 0, 1, 1,
-0.06063883, 0.346895, 0.3577864, 0, 0, 0, 1, 1,
-0.0574219, 0.5098581, 1.109706, 0, 0, 0, 1, 1,
-0.05319992, -1.531894, -3.329712, 0, 0, 0, 1, 1,
-0.05268012, 0.3484213, 0.02196379, 0, 0, 0, 1, 1,
-0.05129834, -0.5983903, -5.046189, 0, 0, 0, 1, 1,
-0.04959177, 0.2903108, 1.096078, 0, 0, 0, 1, 1,
-0.04930751, -0.8352818, -3.234419, 1, 1, 1, 1, 1,
-0.04296156, -1.099389, -2.565282, 1, 1, 1, 1, 1,
-0.04223766, 0.112983, -0.1178028, 1, 1, 1, 1, 1,
-0.04079202, 1.430253, 0.5339844, 1, 1, 1, 1, 1,
-0.03682281, 0.1425483, -1.999135, 1, 1, 1, 1, 1,
-0.03356413, -1.44897, -3.656582, 1, 1, 1, 1, 1,
-0.03340613, -0.8617855, -2.736932, 1, 1, 1, 1, 1,
-0.02929547, 1.234557, -0.2619089, 1, 1, 1, 1, 1,
-0.0267478, -0.6627109, -1.513856, 1, 1, 1, 1, 1,
-0.02265776, -1.664219, -3.414907, 1, 1, 1, 1, 1,
-0.01776669, 1.857323, 0.00755092, 1, 1, 1, 1, 1,
-0.009115334, 0.775512, 0.05524243, 1, 1, 1, 1, 1,
-0.005750774, 2.79468, -1.668431, 1, 1, 1, 1, 1,
-0.005296402, -0.5483415, -4.405194, 1, 1, 1, 1, 1,
-0.002562246, -0.8301654, -3.08542, 1, 1, 1, 1, 1,
-0.002359411, -0.9453507, -3.217684, 0, 0, 1, 1, 1,
-0.001413614, 0.8566698, -0.094586, 1, 0, 0, 1, 1,
0.002006039, 0.6427544, 0.5267161, 1, 0, 0, 1, 1,
0.002179391, -0.1904409, 2.19524, 1, 0, 0, 1, 1,
0.002408731, -0.5971379, 4.249779, 1, 0, 0, 1, 1,
0.003228308, 0.2977761, 1.968499, 1, 0, 0, 1, 1,
0.003484582, 0.7853814, -0.8201394, 0, 0, 0, 1, 1,
0.005163656, 0.7478482, 1.334072, 0, 0, 0, 1, 1,
0.005472418, 0.1103709, 2.518546, 0, 0, 0, 1, 1,
0.006172679, -1.554071, 1.885256, 0, 0, 0, 1, 1,
0.00929913, 0.3016728, -1.49549, 0, 0, 0, 1, 1,
0.009311265, -1.03756, 5.445077, 0, 0, 0, 1, 1,
0.0101636, -0.9633004, 3.29102, 0, 0, 0, 1, 1,
0.01064528, 0.219926, 1.538712, 1, 1, 1, 1, 1,
0.01104784, -0.5898987, 3.929689, 1, 1, 1, 1, 1,
0.0119886, -1.314877, 2.955289, 1, 1, 1, 1, 1,
0.013447, 1.49052, 1.424169, 1, 1, 1, 1, 1,
0.01405282, -0.2025973, 2.898613, 1, 1, 1, 1, 1,
0.0183602, 0.3606757, 0.433373, 1, 1, 1, 1, 1,
0.02081902, 0.8892568, 0.1529256, 1, 1, 1, 1, 1,
0.02270457, -1.247187, 4.751204, 1, 1, 1, 1, 1,
0.02272485, -0.7895975, 3.17004, 1, 1, 1, 1, 1,
0.02729051, 0.001522589, 1.726437, 1, 1, 1, 1, 1,
0.02751955, 1.42425, -0.8800958, 1, 1, 1, 1, 1,
0.02901462, 0.7795945, -0.4934848, 1, 1, 1, 1, 1,
0.0305153, 0.6376777, 0.7802587, 1, 1, 1, 1, 1,
0.03105672, -1.280496, 1.321286, 1, 1, 1, 1, 1,
0.03557366, -0.1450057, 3.476644, 1, 1, 1, 1, 1,
0.03599377, -0.4805297, 3.09657, 0, 0, 1, 1, 1,
0.03646984, -1.02707, 3.081981, 1, 0, 0, 1, 1,
0.03745221, 0.7241263, -1.343036, 1, 0, 0, 1, 1,
0.03783935, -0.3275853, 2.964199, 1, 0, 0, 1, 1,
0.03926597, 0.1237537, 0.2966481, 1, 0, 0, 1, 1,
0.04149625, -1.94817, 2.41173, 1, 0, 0, 1, 1,
0.04305642, -1.600005, 3.498069, 0, 0, 0, 1, 1,
0.04666877, 0.6326972, 0.2920471, 0, 0, 0, 1, 1,
0.05054189, 1.071492, -0.2360465, 0, 0, 0, 1, 1,
0.05551568, -0.3082606, 3.40263, 0, 0, 0, 1, 1,
0.05680425, 1.153631, -0.261975, 0, 0, 0, 1, 1,
0.06726044, -0.7580603, 2.722718, 0, 0, 0, 1, 1,
0.0690596, 0.7924325, 0.9934654, 0, 0, 0, 1, 1,
0.06936518, 0.8571678, -0.2592108, 1, 1, 1, 1, 1,
0.06983715, -0.4376831, 2.953224, 1, 1, 1, 1, 1,
0.07234862, 1.46011, 0.5240467, 1, 1, 1, 1, 1,
0.07343524, -0.7110389, 2.65618, 1, 1, 1, 1, 1,
0.07436123, 1.539949, -0.4171341, 1, 1, 1, 1, 1,
0.07975578, -0.5251207, 3.484686, 1, 1, 1, 1, 1,
0.08431884, 0.2108893, -0.2872342, 1, 1, 1, 1, 1,
0.08490905, -0.8782102, 3.268941, 1, 1, 1, 1, 1,
0.08919593, 1.44985, 0.8395702, 1, 1, 1, 1, 1,
0.08925664, -0.168586, -0.1585543, 1, 1, 1, 1, 1,
0.08931668, -0.7853966, 2.315038, 1, 1, 1, 1, 1,
0.09258214, 1.900839, 1.076949, 1, 1, 1, 1, 1,
0.09342669, -2.732434, 4.584442, 1, 1, 1, 1, 1,
0.09349097, -2.29747, 3.770193, 1, 1, 1, 1, 1,
0.09367466, 1.618224, 0.06073156, 1, 1, 1, 1, 1,
0.100645, 0.6815265, -1.118932, 0, 0, 1, 1, 1,
0.1014495, 0.8707918, -0.6265048, 1, 0, 0, 1, 1,
0.1043109, -0.2616717, 2.651925, 1, 0, 0, 1, 1,
0.1066375, -0.7916944, 2.484703, 1, 0, 0, 1, 1,
0.1121316, 0.4618047, -0.5899345, 1, 0, 0, 1, 1,
0.1187982, 1.149478, 1.453851, 1, 0, 0, 1, 1,
0.1202935, 1.128042, 1.286363, 0, 0, 0, 1, 1,
0.1273399, 0.8063643, 0.2786044, 0, 0, 0, 1, 1,
0.1295405, -1.149001, 2.815455, 0, 0, 0, 1, 1,
0.1355522, 1.167592, -0.495269, 0, 0, 0, 1, 1,
0.1355845, 1.484114, -2.215925, 0, 0, 0, 1, 1,
0.1373459, 1.348127, 1.10097, 0, 0, 0, 1, 1,
0.1381712, -2.103842, 2.399292, 0, 0, 0, 1, 1,
0.1400839, -0.7229128, 2.852887, 1, 1, 1, 1, 1,
0.1401638, -0.1568661, 3.087746, 1, 1, 1, 1, 1,
0.1431202, 0.9385622, -0.8769389, 1, 1, 1, 1, 1,
0.1506763, -0.3863789, 5.127438, 1, 1, 1, 1, 1,
0.1532188, 0.2719302, 1.873829, 1, 1, 1, 1, 1,
0.1564356, 1.777052, -0.1474667, 1, 1, 1, 1, 1,
0.1572277, 0.04678, 1.082473, 1, 1, 1, 1, 1,
0.158247, 0.06655589, 1.635788, 1, 1, 1, 1, 1,
0.1583002, -0.8422434, 1.510567, 1, 1, 1, 1, 1,
0.1588592, 0.2425085, -0.02184983, 1, 1, 1, 1, 1,
0.1590683, -1.660149, 3.790128, 1, 1, 1, 1, 1,
0.1593053, 0.1678843, -0.1229225, 1, 1, 1, 1, 1,
0.1624903, 0.7297484, 0.4914621, 1, 1, 1, 1, 1,
0.1645613, -0.1454569, -0.5305584, 1, 1, 1, 1, 1,
0.1660909, 0.5396695, 1.324715, 1, 1, 1, 1, 1,
0.1664183, -1.161145, 3.090321, 0, 0, 1, 1, 1,
0.1689295, -0.6120448, 4.444598, 1, 0, 0, 1, 1,
0.1693113, 0.6157535, 0.003741303, 1, 0, 0, 1, 1,
0.1740006, 2.409643, 3.333364, 1, 0, 0, 1, 1,
0.1772309, -0.2186111, 4.122145, 1, 0, 0, 1, 1,
0.1838958, -0.05835544, 2.116942, 1, 0, 0, 1, 1,
0.1845237, -0.109157, 2.74106, 0, 0, 0, 1, 1,
0.1846822, 0.0627884, 2.077971, 0, 0, 0, 1, 1,
0.1858202, 1.413016, 0.1812824, 0, 0, 0, 1, 1,
0.1866725, -0.3075192, 3.154277, 0, 0, 0, 1, 1,
0.1916134, 0.03458893, 1.838725, 0, 0, 0, 1, 1,
0.1937661, -2.321239, 2.2704, 0, 0, 0, 1, 1,
0.1953515, -0.1031929, 1.946067, 0, 0, 0, 1, 1,
0.1962696, 0.560478, -0.1593039, 1, 1, 1, 1, 1,
0.1963299, -0.1302638, 0.5239136, 1, 1, 1, 1, 1,
0.1993963, 0.4158052, 0.2874017, 1, 1, 1, 1, 1,
0.2001965, -0.1488729, 2.973983, 1, 1, 1, 1, 1,
0.2075381, 0.5240133, 0.5747119, 1, 1, 1, 1, 1,
0.2154597, -1.099362, 1.790413, 1, 1, 1, 1, 1,
0.217506, 1.066117, 1.139847, 1, 1, 1, 1, 1,
0.222775, 0.8527439, -0.6043518, 1, 1, 1, 1, 1,
0.2248903, -0.02085993, 1.290502, 1, 1, 1, 1, 1,
0.2258604, -2.064697, 3.533115, 1, 1, 1, 1, 1,
0.2296316, -0.9733076, 3.128015, 1, 1, 1, 1, 1,
0.2305643, 0.04967043, 2.29845, 1, 1, 1, 1, 1,
0.2366053, 0.7819813, 0.1721447, 1, 1, 1, 1, 1,
0.2413497, -0.1537242, 1.475746, 1, 1, 1, 1, 1,
0.2440875, 1.021171, 0.3661825, 1, 1, 1, 1, 1,
0.2483723, -0.4795736, 2.60273, 0, 0, 1, 1, 1,
0.2512432, 0.1191246, 0.9629159, 1, 0, 0, 1, 1,
0.2519426, 0.5888443, -0.04884071, 1, 0, 0, 1, 1,
0.2538992, 0.4400739, -0.6559002, 1, 0, 0, 1, 1,
0.2589394, 0.2708339, -0.5739049, 1, 0, 0, 1, 1,
0.2598563, 0.204913, 1.754449, 1, 0, 0, 1, 1,
0.272026, 0.8597555, -0.5865814, 0, 0, 0, 1, 1,
0.2742776, 1.163977, 1.453651, 0, 0, 0, 1, 1,
0.2769169, -0.4309581, 2.223594, 0, 0, 0, 1, 1,
0.2775434, -0.1699067, 1.759928, 0, 0, 0, 1, 1,
0.2791631, -1.603389, 2.899135, 0, 0, 0, 1, 1,
0.282702, 1.083619, -0.7390358, 0, 0, 0, 1, 1,
0.2847562, 1.739931, -0.4526917, 0, 0, 0, 1, 1,
0.2868541, 0.4320356, 1.505226, 1, 1, 1, 1, 1,
0.2892719, 0.6938323, 1.68225, 1, 1, 1, 1, 1,
0.2905784, 1.580387, 0.2890638, 1, 1, 1, 1, 1,
0.2930269, -0.8950677, 2.276324, 1, 1, 1, 1, 1,
0.2947183, -1.087405, 1.8791, 1, 1, 1, 1, 1,
0.2989142, -1.34305, 3.522294, 1, 1, 1, 1, 1,
0.3026418, 0.2773946, -0.4729568, 1, 1, 1, 1, 1,
0.3053548, -0.08469605, 0.9081119, 1, 1, 1, 1, 1,
0.3054699, 0.8509735, -0.09946142, 1, 1, 1, 1, 1,
0.3062791, -1.491869, 4.417536, 1, 1, 1, 1, 1,
0.3101286, -0.2349787, 2.489345, 1, 1, 1, 1, 1,
0.3106898, 0.5169078, 1.217048, 1, 1, 1, 1, 1,
0.3118826, -0.5565251, 1.113949, 1, 1, 1, 1, 1,
0.3140311, 0.6171908, 0.536786, 1, 1, 1, 1, 1,
0.3197331, -0.3045425, 2.747417, 1, 1, 1, 1, 1,
0.3199043, 0.5250627, 0.1174064, 0, 0, 1, 1, 1,
0.3238418, 0.7059233, 1.745162, 1, 0, 0, 1, 1,
0.3277953, -0.3594413, 2.62332, 1, 0, 0, 1, 1,
0.3278105, 0.8429501, 0.3302119, 1, 0, 0, 1, 1,
0.3313199, -0.4281198, 2.504965, 1, 0, 0, 1, 1,
0.3351878, -0.1003733, 1.030899, 1, 0, 0, 1, 1,
0.3465452, 1.783962, 1.219478, 0, 0, 0, 1, 1,
0.3500143, -0.611865, 1.370071, 0, 0, 0, 1, 1,
0.3637884, -0.07229085, 2.139954, 0, 0, 0, 1, 1,
0.3642495, 2.67604, -0.5036978, 0, 0, 0, 1, 1,
0.3713365, -1.065152, 3.104974, 0, 0, 0, 1, 1,
0.3741307, -0.6542398, 4.964236, 0, 0, 0, 1, 1,
0.3782119, 1.114094, 1.317896, 0, 0, 0, 1, 1,
0.3782788, -0.6868166, 2.881713, 1, 1, 1, 1, 1,
0.3807374, -0.01465552, 1.41411, 1, 1, 1, 1, 1,
0.3819779, -0.2151759, 2.579517, 1, 1, 1, 1, 1,
0.382532, 0.2311009, 0.942336, 1, 1, 1, 1, 1,
0.3840787, 1.330553, -2.189648, 1, 1, 1, 1, 1,
0.3849796, -0.7729371, 2.030261, 1, 1, 1, 1, 1,
0.3853276, -0.1663823, 1.935147, 1, 1, 1, 1, 1,
0.3864, -0.5223208, 0.9516565, 1, 1, 1, 1, 1,
0.3874264, -1.019926, 4.056423, 1, 1, 1, 1, 1,
0.3876363, -0.8302097, 3.32398, 1, 1, 1, 1, 1,
0.3877294, -1.178394, 4.065069, 1, 1, 1, 1, 1,
0.3937161, -0.01316513, 0.8989357, 1, 1, 1, 1, 1,
0.3965457, -1.408132, 4.160469, 1, 1, 1, 1, 1,
0.3966382, -0.464006, 3.429164, 1, 1, 1, 1, 1,
0.3977632, -0.05549995, 1.323739, 1, 1, 1, 1, 1,
0.406563, -0.3909341, 2.854828, 0, 0, 1, 1, 1,
0.4118771, 0.01567546, 2.420094, 1, 0, 0, 1, 1,
0.4129649, -0.09624984, 0.9254716, 1, 0, 0, 1, 1,
0.4150009, -0.6367848, 3.071637, 1, 0, 0, 1, 1,
0.4201141, 0.824029, -1.140161, 1, 0, 0, 1, 1,
0.4224682, 0.8689077, -0.6661358, 1, 0, 0, 1, 1,
0.4246359, -0.27397, 0.2483743, 0, 0, 0, 1, 1,
0.4279352, -0.3447103, 1.019148, 0, 0, 0, 1, 1,
0.4283761, 0.08942764, 1.29146, 0, 0, 0, 1, 1,
0.433905, 1.030541, 0.6780548, 0, 0, 0, 1, 1,
0.4339999, -0.4620163, 1.294999, 0, 0, 0, 1, 1,
0.4347285, -0.647809, 1.465375, 0, 0, 0, 1, 1,
0.4355164, 0.7405185, 1.5426, 0, 0, 0, 1, 1,
0.4371934, -0.888575, 3.680381, 1, 1, 1, 1, 1,
0.4400139, -1.031035, 2.992909, 1, 1, 1, 1, 1,
0.4444956, 0.06008965, 1.897713, 1, 1, 1, 1, 1,
0.4509311, -1.448174, 4.778443, 1, 1, 1, 1, 1,
0.4531792, -1.978686, 2.695485, 1, 1, 1, 1, 1,
0.4575748, 0.8428879, 1.621144, 1, 1, 1, 1, 1,
0.4585082, 0.8650007, 0.5220989, 1, 1, 1, 1, 1,
0.4620447, 0.2556568, 0.08584777, 1, 1, 1, 1, 1,
0.4623251, -0.395366, 2.872054, 1, 1, 1, 1, 1,
0.4626773, -1.706561, 1.595278, 1, 1, 1, 1, 1,
0.4645218, 1.498445, 0.2207691, 1, 1, 1, 1, 1,
0.4655601, -0.113699, 0.3870738, 1, 1, 1, 1, 1,
0.4705887, 0.631346, 0.1928209, 1, 1, 1, 1, 1,
0.4711498, -0.9644456, -0.708221, 1, 1, 1, 1, 1,
0.4763765, -0.9699807, 2.439659, 1, 1, 1, 1, 1,
0.4822997, -0.9656513, 2.880306, 0, 0, 1, 1, 1,
0.4897422, 0.7472902, -0.4435142, 1, 0, 0, 1, 1,
0.4915054, 1.162519, 1.883741, 1, 0, 0, 1, 1,
0.4933876, 0.507148, 0.03831223, 1, 0, 0, 1, 1,
0.4944941, -1.242716, 2.734035, 1, 0, 0, 1, 1,
0.4953347, -0.3415544, 1.790269, 1, 0, 0, 1, 1,
0.4961789, -0.724169, 2.496003, 0, 0, 0, 1, 1,
0.5040039, 0.697246, 0.4312336, 0, 0, 0, 1, 1,
0.5053777, -1.274572, 3.21546, 0, 0, 0, 1, 1,
0.5065309, 0.2908236, 0.6459107, 0, 0, 0, 1, 1,
0.5137979, 0.2768145, 2.129554, 0, 0, 0, 1, 1,
0.5145718, -0.4878688, 3.665949, 0, 0, 0, 1, 1,
0.517214, 0.6871799, 0.3506619, 0, 0, 0, 1, 1,
0.5197795, 0.7574666, 1.0356, 1, 1, 1, 1, 1,
0.5205204, 1.037918, 1.216351, 1, 1, 1, 1, 1,
0.5208994, -0.9658083, 1.680117, 1, 1, 1, 1, 1,
0.5217867, 1.893913, 0.5354556, 1, 1, 1, 1, 1,
0.5229539, 2.313594, 0.7611241, 1, 1, 1, 1, 1,
0.5303112, -0.7898379, 2.629293, 1, 1, 1, 1, 1,
0.5309421, -0.6164519, 1.789759, 1, 1, 1, 1, 1,
0.5322335, 0.3735316, 2.265543, 1, 1, 1, 1, 1,
0.5360258, -1.932899, 3.816653, 1, 1, 1, 1, 1,
0.5381821, 1.439198, 0.8078744, 1, 1, 1, 1, 1,
0.5396228, -0.8290464, 0.9471319, 1, 1, 1, 1, 1,
0.5401149, 0.01677978, 0.6498976, 1, 1, 1, 1, 1,
0.541675, 1.70115, 1.261879, 1, 1, 1, 1, 1,
0.5419295, -1.260736, 2.146321, 1, 1, 1, 1, 1,
0.5454696, -1.734989, 2.697023, 1, 1, 1, 1, 1,
0.5520589, -0.2039709, 1.546706, 0, 0, 1, 1, 1,
0.5545027, 1.004075, 0.982541, 1, 0, 0, 1, 1,
0.5562673, 1.023387, 0.412839, 1, 0, 0, 1, 1,
0.5611359, -0.1994409, 2.856344, 1, 0, 0, 1, 1,
0.5623099, 0.3983324, 2.516855, 1, 0, 0, 1, 1,
0.5623784, -0.7004339, 0.7225928, 1, 0, 0, 1, 1,
0.5650662, 1.816941, 1.192346, 0, 0, 0, 1, 1,
0.5692782, -1.837941, 2.57473, 0, 0, 0, 1, 1,
0.5706823, -1.124909, 2.071606, 0, 0, 0, 1, 1,
0.5720645, 2.751262, 0.178816, 0, 0, 0, 1, 1,
0.5746124, 0.9822308, -1.151266, 0, 0, 0, 1, 1,
0.5755794, -1.313149, 1.893474, 0, 0, 0, 1, 1,
0.5782764, -0.2740566, 1.563726, 0, 0, 0, 1, 1,
0.5840217, 0.5211234, 1.011773, 1, 1, 1, 1, 1,
0.5895752, 2.54842, -0.4398098, 1, 1, 1, 1, 1,
0.5916236, 2.243561, 0.1402779, 1, 1, 1, 1, 1,
0.5920326, -0.9151932, 3.413474, 1, 1, 1, 1, 1,
0.5928149, -0.5125045, 1.537484, 1, 1, 1, 1, 1,
0.5979249, 0.3156292, 2.154356, 1, 1, 1, 1, 1,
0.5999359, -1.446031, 1.638714, 1, 1, 1, 1, 1,
0.6002488, -1.915349, 3.053402, 1, 1, 1, 1, 1,
0.6008471, 0.4434645, 0.2812059, 1, 1, 1, 1, 1,
0.6036445, -1.110706, 4.183539, 1, 1, 1, 1, 1,
0.6058912, 0.4183592, 2.289176, 1, 1, 1, 1, 1,
0.6080141, -1.471905, 2.648026, 1, 1, 1, 1, 1,
0.610678, 0.2582511, 0.6969791, 1, 1, 1, 1, 1,
0.6215371, -0.4841874, 2.06754, 1, 1, 1, 1, 1,
0.6287473, 0.5200749, 0.05961283, 1, 1, 1, 1, 1,
0.6316625, -1.219277, 2.911257, 0, 0, 1, 1, 1,
0.6328151, -0.6553834, 3.400589, 1, 0, 0, 1, 1,
0.6375003, 0.002972438, 2.009225, 1, 0, 0, 1, 1,
0.638894, -0.8247292, 4.327503, 1, 0, 0, 1, 1,
0.6397503, -0.788822, 0.5850185, 1, 0, 0, 1, 1,
0.647126, 0.4511301, 1.123576, 1, 0, 0, 1, 1,
0.647609, -0.46421, 3.41502, 0, 0, 0, 1, 1,
0.649092, -0.1389753, 2.008534, 0, 0, 0, 1, 1,
0.6525923, -0.02240005, 2.702588, 0, 0, 0, 1, 1,
0.6532261, -1.168778, 3.240855, 0, 0, 0, 1, 1,
0.656085, -1.643694, 2.200646, 0, 0, 0, 1, 1,
0.6577438, 1.103616, 1.603353, 0, 0, 0, 1, 1,
0.6579504, 0.05805799, 1.604842, 0, 0, 0, 1, 1,
0.659561, 0.4818383, 0.7153983, 1, 1, 1, 1, 1,
0.6608269, 1.303359, -0.2839268, 1, 1, 1, 1, 1,
0.6700911, -0.06121725, 0.8316988, 1, 1, 1, 1, 1,
0.6759883, -1.710717, 2.204511, 1, 1, 1, 1, 1,
0.6782101, 2.302498, -0.3696982, 1, 1, 1, 1, 1,
0.6890787, 0.4696346, 1.923104, 1, 1, 1, 1, 1,
0.6937918, -0.7919077, 1.148652, 1, 1, 1, 1, 1,
0.6987825, -1.076301, 2.761432, 1, 1, 1, 1, 1,
0.7000059, -0.9713749, 2.980694, 1, 1, 1, 1, 1,
0.7027394, -0.4260382, 2.476163, 1, 1, 1, 1, 1,
0.7046033, 0.8755429, 1.824268, 1, 1, 1, 1, 1,
0.7172695, 0.0195278, 0.3397262, 1, 1, 1, 1, 1,
0.7177051, 1.675822, 0.328809, 1, 1, 1, 1, 1,
0.7179563, 1.484665, 1.14138, 1, 1, 1, 1, 1,
0.7180663, 1.709339, 0.997442, 1, 1, 1, 1, 1,
0.7189763, 0.4553221, 0.5652896, 0, 0, 1, 1, 1,
0.720789, 0.400784, 2.017716, 1, 0, 0, 1, 1,
0.7306724, 1.753064, -1.314813, 1, 0, 0, 1, 1,
0.733595, 0.05139536, 2.190254, 1, 0, 0, 1, 1,
0.7349343, -1.985725, 1.393438, 1, 0, 0, 1, 1,
0.7414704, 0.3527355, 3.084476, 1, 0, 0, 1, 1,
0.7424641, -0.2343512, 0.7425811, 0, 0, 0, 1, 1,
0.7425865, 1.259727, 0.2502759, 0, 0, 0, 1, 1,
0.7453126, -0.6920728, 1.759695, 0, 0, 0, 1, 1,
0.7479416, 0.004619834, 2.731494, 0, 0, 0, 1, 1,
0.7485757, 1.401996, 0.5089462, 0, 0, 0, 1, 1,
0.7494098, 0.2647032, 1.855922, 0, 0, 0, 1, 1,
0.7501289, -0.5402661, 2.236405, 0, 0, 0, 1, 1,
0.7525691, 1.369477, 0.5226828, 1, 1, 1, 1, 1,
0.7537379, 0.8192487, 0.3265729, 1, 1, 1, 1, 1,
0.7573406, 0.427892, 1.565847, 1, 1, 1, 1, 1,
0.7641487, -0.1140693, 2.448591, 1, 1, 1, 1, 1,
0.7675373, 0.448326, 1.309394, 1, 1, 1, 1, 1,
0.7704284, -0.409033, 1.425291, 1, 1, 1, 1, 1,
0.7717001, -1.296579, 1.933574, 1, 1, 1, 1, 1,
0.7729931, 0.9641851, 0.2387577, 1, 1, 1, 1, 1,
0.7742787, -0.5703454, 0.6849846, 1, 1, 1, 1, 1,
0.7763531, 1.018674, 0.1148554, 1, 1, 1, 1, 1,
0.7873573, -0.4445928, 0.9598807, 1, 1, 1, 1, 1,
0.7953243, 0.9498483, -0.4489, 1, 1, 1, 1, 1,
0.8006896, 0.5083246, -0.2420698, 1, 1, 1, 1, 1,
0.8014345, -2.616392, 3.277913, 1, 1, 1, 1, 1,
0.8022638, -0.7584134, 1.4912, 1, 1, 1, 1, 1,
0.8027442, 2.484149, -0.5164182, 0, 0, 1, 1, 1,
0.8047885, 0.8785812, -0.496659, 1, 0, 0, 1, 1,
0.8078774, 1.599051, -1.486746, 1, 0, 0, 1, 1,
0.8081548, 0.5143312, 1.245441, 1, 0, 0, 1, 1,
0.8094356, 0.7037368, -1.180308, 1, 0, 0, 1, 1,
0.8106804, 1.88076, -0.3727488, 1, 0, 0, 1, 1,
0.8137888, 0.1924812, 0.6997327, 0, 0, 0, 1, 1,
0.8138365, -0.1637327, 0.5917039, 0, 0, 0, 1, 1,
0.8157423, 0.5987933, 2.032745, 0, 0, 0, 1, 1,
0.8182878, -0.6310698, 2.246717, 0, 0, 0, 1, 1,
0.8211713, 0.3220395, 0.9982035, 0, 0, 0, 1, 1,
0.8236669, -0.2634979, 1.936226, 0, 0, 0, 1, 1,
0.8374412, -1.921976, 3.494869, 0, 0, 0, 1, 1,
0.8396317, -0.04496763, 0.4499442, 1, 1, 1, 1, 1,
0.8422101, -0.04356088, 0.005246048, 1, 1, 1, 1, 1,
0.8475649, 0.6892132, 2.987277, 1, 1, 1, 1, 1,
0.8507128, -0.7914914, 0.8163692, 1, 1, 1, 1, 1,
0.8514938, 0.4531384, 1.049401, 1, 1, 1, 1, 1,
0.854278, -0.7213108, 1.416236, 1, 1, 1, 1, 1,
0.8711902, -0.6415491, 0.6177517, 1, 1, 1, 1, 1,
0.8723226, 0.217965, 0.9976699, 1, 1, 1, 1, 1,
0.872957, 1.717957, -1.3504, 1, 1, 1, 1, 1,
0.8785199, -0.5547361, 1.753438, 1, 1, 1, 1, 1,
0.8861877, -1.365855, 3.393089, 1, 1, 1, 1, 1,
0.8867256, 0.3153698, 2.117715, 1, 1, 1, 1, 1,
0.8899637, -0.3395145, 0.8779078, 1, 1, 1, 1, 1,
0.9022194, -0.5986694, 1.86778, 1, 1, 1, 1, 1,
0.9022913, 0.6302382, 0.3783585, 1, 1, 1, 1, 1,
0.9122074, 1.0819, 0.3754963, 0, 0, 1, 1, 1,
0.9137651, -0.2585602, 1.992728, 1, 0, 0, 1, 1,
0.9159588, 0.7877492, 1.24626, 1, 0, 0, 1, 1,
0.9167016, -0.2751053, 2.23459, 1, 0, 0, 1, 1,
0.9204219, 1.357888, 0.6019068, 1, 0, 0, 1, 1,
0.921702, 0.05098629, 0.5081664, 1, 0, 0, 1, 1,
0.9259914, 1.239072, 1.487181, 0, 0, 0, 1, 1,
0.9279315, 0.8829505, -0.1035769, 0, 0, 0, 1, 1,
0.9285191, -2.169322, 4.008615, 0, 0, 0, 1, 1,
0.9288224, -2.136341, 3.111516, 0, 0, 0, 1, 1,
0.9301255, 1.417274, 0.5016825, 0, 0, 0, 1, 1,
0.9306756, -1.487764, 3.187261, 0, 0, 0, 1, 1,
0.9320207, 0.9060208, 2.115964, 0, 0, 0, 1, 1,
0.9370546, -1.062073, 2.860085, 1, 1, 1, 1, 1,
0.9390791, -0.1986131, 1.448281, 1, 1, 1, 1, 1,
0.941446, -0.8664448, 1.105001, 1, 1, 1, 1, 1,
0.9442428, 0.7357798, 0.5038623, 1, 1, 1, 1, 1,
0.9444958, -0.08512776, 1.343939, 1, 1, 1, 1, 1,
0.9447219, 0.0008852665, 2.410083, 1, 1, 1, 1, 1,
0.9450285, -0.6101114, 2.561549, 1, 1, 1, 1, 1,
0.9464612, -1.243997, 2.723727, 1, 1, 1, 1, 1,
0.95247, -0.1528767, 0.912698, 1, 1, 1, 1, 1,
0.9694402, 0.2872432, 1.204987, 1, 1, 1, 1, 1,
0.9707269, -0.4116794, 1.856335, 1, 1, 1, 1, 1,
0.9722927, 0.8368835, 1.604396, 1, 1, 1, 1, 1,
0.9760216, -0.3287261, 0.8933528, 1, 1, 1, 1, 1,
0.9828017, -0.07645857, 2.219361, 1, 1, 1, 1, 1,
0.9846616, -0.8981311, 1.157727, 1, 1, 1, 1, 1,
0.9877287, -0.6208436, 3.542541, 0, 0, 1, 1, 1,
0.9905794, -1.134309, 1.756611, 1, 0, 0, 1, 1,
0.9938365, 1.180565, 2.152089, 1, 0, 0, 1, 1,
0.9948378, 0.1784486, 0.4992218, 1, 0, 0, 1, 1,
0.9948766, 0.3815664, 0.5177618, 1, 0, 0, 1, 1,
0.9963919, 0.185858, 2.321403, 1, 0, 0, 1, 1,
1.001451, -2.110173, 3.67726, 0, 0, 0, 1, 1,
1.006783, 0.695433, 2.174833, 0, 0, 0, 1, 1,
1.022602, 0.0260918, 2.213541, 0, 0, 0, 1, 1,
1.030987, -0.3085466, 2.113046, 0, 0, 0, 1, 1,
1.034814, -1.060215, 2.073031, 0, 0, 0, 1, 1,
1.038898, 0.1822534, 1.054384, 0, 0, 0, 1, 1,
1.042833, -0.3485046, 3.012225, 0, 0, 0, 1, 1,
1.046616, -1.339879, 3.274438, 1, 1, 1, 1, 1,
1.052982, -1.057265, 2.917346, 1, 1, 1, 1, 1,
1.062509, 1.072754, 1.581817, 1, 1, 1, 1, 1,
1.062832, 1.453142, 1.400759, 1, 1, 1, 1, 1,
1.063331, 0.8807949, 0.04199177, 1, 1, 1, 1, 1,
1.06389, 1.435216, 1.223796, 1, 1, 1, 1, 1,
1.069969, 0.2226653, -1.432013, 1, 1, 1, 1, 1,
1.071406, -0.2309901, 3.14622, 1, 1, 1, 1, 1,
1.072214, -1.42449, 1.182407, 1, 1, 1, 1, 1,
1.073199, 1.069593, 0.5242391, 1, 1, 1, 1, 1,
1.0829, 1.253796, 0.7672531, 1, 1, 1, 1, 1,
1.0837, -0.3259009, 2.107541, 1, 1, 1, 1, 1,
1.085308, -0.4150352, 2.02566, 1, 1, 1, 1, 1,
1.088926, -1.063273, 1.686859, 1, 1, 1, 1, 1,
1.09265, 0.4209305, 1.148437, 1, 1, 1, 1, 1,
1.09285, 1.167804, 1.579977, 0, 0, 1, 1, 1,
1.101173, -0.2077785, 1.019107, 1, 0, 0, 1, 1,
1.101528, 0.3968137, 0.9448379, 1, 0, 0, 1, 1,
1.104186, -0.4780392, 0.8019698, 1, 0, 0, 1, 1,
1.111256, -0.6467267, -0.1463649, 1, 0, 0, 1, 1,
1.118188, 0.1079815, 3.92596, 1, 0, 0, 1, 1,
1.120415, -0.7986252, 2.155118, 0, 0, 0, 1, 1,
1.130179, -2.376773, 3.536724, 0, 0, 0, 1, 1,
1.13922, -0.04011564, 0.457545, 0, 0, 0, 1, 1,
1.145088, 0.02976628, 2.631069, 0, 0, 0, 1, 1,
1.147041, 0.8707627, 2.03357, 0, 0, 0, 1, 1,
1.149885, 0.7559654, 1.69548, 0, 0, 0, 1, 1,
1.156869, 0.3402891, 2.901176, 0, 0, 0, 1, 1,
1.159862, 1.328971, 0.2477799, 1, 1, 1, 1, 1,
1.161632, 0.07626328, 0.8534881, 1, 1, 1, 1, 1,
1.168399, 0.04636011, 0.4067861, 1, 1, 1, 1, 1,
1.171797, -1.066773, 2.527354, 1, 1, 1, 1, 1,
1.174541, -0.4219233, 1.233934, 1, 1, 1, 1, 1,
1.178829, -0.05066453, 0.824172, 1, 1, 1, 1, 1,
1.182492, -0.4763044, 3.291123, 1, 1, 1, 1, 1,
1.183597, -1.134795, 0.7397613, 1, 1, 1, 1, 1,
1.18532, 0.947433, 1.205757, 1, 1, 1, 1, 1,
1.198488, -0.89675, 2.438512, 1, 1, 1, 1, 1,
1.203804, -1.265908, 2.02461, 1, 1, 1, 1, 1,
1.208142, 1.408996, -0.1131761, 1, 1, 1, 1, 1,
1.209028, 0.7732891, 0.5418056, 1, 1, 1, 1, 1,
1.211353, 0.1603943, 1.539292, 1, 1, 1, 1, 1,
1.212518, -0.5027028, 1.615926, 1, 1, 1, 1, 1,
1.217604, -1.412028, 1.728279, 0, 0, 1, 1, 1,
1.225881, 0.0353132, 2.153989, 1, 0, 0, 1, 1,
1.234684, 0.7058115, 3.417644, 1, 0, 0, 1, 1,
1.258783, 0.4897363, 1.671219, 1, 0, 0, 1, 1,
1.267198, 0.9983172, 0.8437906, 1, 0, 0, 1, 1,
1.2705, 0.7524571, -0.6215971, 1, 0, 0, 1, 1,
1.274158, 0.1141538, 2.030716, 0, 0, 0, 1, 1,
1.283549, -0.5217422, 1.328952, 0, 0, 0, 1, 1,
1.291593, -2.740421, 3.204896, 0, 0, 0, 1, 1,
1.292123, 1.020574, 1.074087, 0, 0, 0, 1, 1,
1.296332, -0.3908406, 1.306419, 0, 0, 0, 1, 1,
1.296786, 1.126456, 2.995231, 0, 0, 0, 1, 1,
1.298661, -0.3786161, 2.980318, 0, 0, 0, 1, 1,
1.305544, 1.826028, 1.694486, 1, 1, 1, 1, 1,
1.307226, -0.9628555, 1.45627, 1, 1, 1, 1, 1,
1.307654, -0.9433001, 2.102433, 1, 1, 1, 1, 1,
1.308169, 0.2206594, 0.6775478, 1, 1, 1, 1, 1,
1.322615, -0.3599846, 2.729582, 1, 1, 1, 1, 1,
1.362933, 1.853139, 1.679059, 1, 1, 1, 1, 1,
1.365265, -0.1881065, 0.6759666, 1, 1, 1, 1, 1,
1.367674, 0.106739, 1.922893, 1, 1, 1, 1, 1,
1.386052, 2.259415, -0.5811151, 1, 1, 1, 1, 1,
1.388999, 0.5444178, 0.03993455, 1, 1, 1, 1, 1,
1.408424, -0.4695644, -0.1392034, 1, 1, 1, 1, 1,
1.410239, 0.04754616, 1.00967, 1, 1, 1, 1, 1,
1.411705, -1.173956, 1.813757, 1, 1, 1, 1, 1,
1.419866, -1.206307, 1.751463, 1, 1, 1, 1, 1,
1.422098, 0.3303866, 1.587101, 1, 1, 1, 1, 1,
1.428535, 0.1804473, 1.71146, 0, 0, 1, 1, 1,
1.430582, -0.2710611, 2.17959, 1, 0, 0, 1, 1,
1.430643, -0.740381, 3.353759, 1, 0, 0, 1, 1,
1.457606, -0.9955225, 2.657021, 1, 0, 0, 1, 1,
1.460677, -1.356072, 4.084823, 1, 0, 0, 1, 1,
1.462806, -0.1600252, 1.453203, 1, 0, 0, 1, 1,
1.470065, 1.899657, 0.526371, 0, 0, 0, 1, 1,
1.485324, -0.4728661, 2.105381, 0, 0, 0, 1, 1,
1.489038, 1.737706, -1.00766, 0, 0, 0, 1, 1,
1.493681, 1.007794, 2.08078, 0, 0, 0, 1, 1,
1.503225, 0.3732773, 1.564708, 0, 0, 0, 1, 1,
1.503608, -1.436975, 2.451226, 0, 0, 0, 1, 1,
1.514267, -0.2764627, 1.423264, 0, 0, 0, 1, 1,
1.526449, -1.502998, 2.043893, 1, 1, 1, 1, 1,
1.526528, 1.603413, 2.777354, 1, 1, 1, 1, 1,
1.528501, 1.765478, 0.9832185, 1, 1, 1, 1, 1,
1.532433, -0.04743803, 0.3313847, 1, 1, 1, 1, 1,
1.535459, 0.5238507, 0.8775911, 1, 1, 1, 1, 1,
1.556032, 0.9014519, 2.024067, 1, 1, 1, 1, 1,
1.564044, 1.43739, -0.4089392, 1, 1, 1, 1, 1,
1.571017, 1.080269, 2.03971, 1, 1, 1, 1, 1,
1.575979, -0.6650239, 0.70443, 1, 1, 1, 1, 1,
1.592825, -1.183583, 1.441005, 1, 1, 1, 1, 1,
1.596685, -0.4344705, 1.807274, 1, 1, 1, 1, 1,
1.6148, -0.4736598, 2.853304, 1, 1, 1, 1, 1,
1.617058, 1.542394, -1.007438, 1, 1, 1, 1, 1,
1.627241, 0.9598843, 2.571911, 1, 1, 1, 1, 1,
1.636921, 0.5843128, 2.508667, 1, 1, 1, 1, 1,
1.643766, -0.02633231, 3.542554, 0, 0, 1, 1, 1,
1.650726, -1.007923, 1.736397, 1, 0, 0, 1, 1,
1.677254, 1.077558, 0.5221801, 1, 0, 0, 1, 1,
1.688054, 0.007361494, -0.4803808, 1, 0, 0, 1, 1,
1.690361, 2.76961, 0.1888672, 1, 0, 0, 1, 1,
1.698033, -0.4941359, 3.39689, 1, 0, 0, 1, 1,
1.707216, 0.2866699, 2.021554, 0, 0, 0, 1, 1,
1.722253, -0.4004005, 1.818014, 0, 0, 0, 1, 1,
1.735477, 0.5873531, 2.123791, 0, 0, 0, 1, 1,
1.755159, -0.08199889, 1.685922, 0, 0, 0, 1, 1,
1.757417, 0.1828453, 0.3333594, 0, 0, 0, 1, 1,
1.763292, -1.961202, 3.019199, 0, 0, 0, 1, 1,
1.768627, -0.8306194, 1.206541, 0, 0, 0, 1, 1,
1.804303, -1.970916, 2.744163, 1, 1, 1, 1, 1,
1.818918, -0.4234378, 1.070089, 1, 1, 1, 1, 1,
1.82717, 0.7035365, 1.199516, 1, 1, 1, 1, 1,
1.841228, -0.8893213, 2.598785, 1, 1, 1, 1, 1,
1.844727, -0.296433, 1.036408, 1, 1, 1, 1, 1,
1.876174, 1.144724, -0.0042111, 1, 1, 1, 1, 1,
1.882743, -0.01712047, -0.15092, 1, 1, 1, 1, 1,
1.909039, -0.4859381, 2.179694, 1, 1, 1, 1, 1,
1.910069, 1.06224, 1.93183, 1, 1, 1, 1, 1,
1.928725, -0.2696766, 2.605673, 1, 1, 1, 1, 1,
1.941052, -0.5050308, 1.091569, 1, 1, 1, 1, 1,
1.961854, -1.356407, 0.9932775, 1, 1, 1, 1, 1,
1.990466, -1.605019, 3.521308, 1, 1, 1, 1, 1,
2.005228, 0.9165754, 1.283775, 1, 1, 1, 1, 1,
2.017224, 0.3154695, 2.056009, 1, 1, 1, 1, 1,
2.023887, -1.217916, 2.195036, 0, 0, 1, 1, 1,
2.024835, -0.2820393, 1.157159, 1, 0, 0, 1, 1,
2.045341, -1.577542, 1.717755, 1, 0, 0, 1, 1,
2.073906, 0.1455171, 0.1215264, 1, 0, 0, 1, 1,
2.084959, -1.273018, 1.038803, 1, 0, 0, 1, 1,
2.092723, -2.511306, 2.046105, 1, 0, 0, 1, 1,
2.102568, 0.3540133, 4.184291, 0, 0, 0, 1, 1,
2.174831, -0.01840637, 1.919802, 0, 0, 0, 1, 1,
2.184963, -0.6230664, 0.8450086, 0, 0, 0, 1, 1,
2.264148, 0.08183856, 0.8477339, 0, 0, 0, 1, 1,
2.27237, 0.4035206, 2.325745, 0, 0, 0, 1, 1,
2.333517, -0.1103284, 1.528128, 0, 0, 0, 1, 1,
2.348891, 0.9844814, 3.265835, 0, 0, 0, 1, 1,
2.350981, 1.320502, 2.547468, 1, 1, 1, 1, 1,
2.504293, -1.00694, 2.426544, 1, 1, 1, 1, 1,
2.555851, -0.9141569, 2.231756, 1, 1, 1, 1, 1,
2.568434, -0.3140694, 0.5627018, 1, 1, 1, 1, 1,
2.721539, 1.585269, 1.898579, 1, 1, 1, 1, 1,
2.769762, 0.5444895, 1.459572, 1, 1, 1, 1, 1,
3.043924, -0.6673027, 0.7581932, 1, 1, 1, 1, 1
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
var radius = 9.503712;
var distance = 33.38139;
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
mvMatrix.translate( -0.07868135, -0.1958733, -0.1994441 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38139);
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
