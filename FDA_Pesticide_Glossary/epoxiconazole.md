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
-2.864976, 0.3873614, -2.233871, 1, 0, 0, 1,
-2.782929, 0.5872576, -2.66808, 1, 0.007843138, 0, 1,
-2.55987, 0.3016646, -2.195797, 1, 0.01176471, 0, 1,
-2.511202, -0.3950748, -2.151536, 1, 0.01960784, 0, 1,
-2.480398, 1.075664, -0.3846397, 1, 0.02352941, 0, 1,
-2.396952, 1.028036, -2.560539, 1, 0.03137255, 0, 1,
-2.254941, 0.9091507, 0.4907773, 1, 0.03529412, 0, 1,
-2.172458, -0.7466475, -0.4672861, 1, 0.04313726, 0, 1,
-2.098679, 1.630576, -0.2504144, 1, 0.04705882, 0, 1,
-2.017091, 0.006372254, -1.93818, 1, 0.05490196, 0, 1,
-2.011014, -0.08926222, -2.475289, 1, 0.05882353, 0, 1,
-1.977095, -2.294528, -2.239628, 1, 0.06666667, 0, 1,
-1.942935, -0.4132057, -2.195765, 1, 0.07058824, 0, 1,
-1.942053, 0.5594317, -0.6720296, 1, 0.07843138, 0, 1,
-1.937659, -0.30276, -3.208787, 1, 0.08235294, 0, 1,
-1.925623, -0.5055031, -3.944696, 1, 0.09019608, 0, 1,
-1.905247, 0.02608477, -4.14869, 1, 0.09411765, 0, 1,
-1.899726, -0.5900308, -1.240792, 1, 0.1019608, 0, 1,
-1.887632, -0.2437151, -1.383436, 1, 0.1098039, 0, 1,
-1.876086, -0.826506, -3.056487, 1, 0.1137255, 0, 1,
-1.868641, 0.1859297, -2.398031, 1, 0.1215686, 0, 1,
-1.868484, 1.452909, 0.8362935, 1, 0.1254902, 0, 1,
-1.862677, -0.7896526, -0.4271151, 1, 0.1333333, 0, 1,
-1.857416, -2.354724, -3.515022, 1, 0.1372549, 0, 1,
-1.832967, -0.9594518, -2.635802, 1, 0.145098, 0, 1,
-1.810523, 0.6347837, 0.1154829, 1, 0.1490196, 0, 1,
-1.804849, -1.925442, -1.383304, 1, 0.1568628, 0, 1,
-1.803323, -1.136939, -1.999538, 1, 0.1607843, 0, 1,
-1.772815, 0.2059453, -0.9784076, 1, 0.1686275, 0, 1,
-1.757205, 0.8907701, -1.56079, 1, 0.172549, 0, 1,
-1.744312, -1.211487, -3.231349, 1, 0.1803922, 0, 1,
-1.735315, -0.4633774, -0.5715653, 1, 0.1843137, 0, 1,
-1.710833, 0.02958939, -1.369961, 1, 0.1921569, 0, 1,
-1.705557, -0.8036447, -1.385598, 1, 0.1960784, 0, 1,
-1.686399, 0.642105, -2.279729, 1, 0.2039216, 0, 1,
-1.685997, 0.7763601, -0.9561071, 1, 0.2117647, 0, 1,
-1.684799, 0.7377766, -1.07013, 1, 0.2156863, 0, 1,
-1.679583, 0.1201195, -2.186891, 1, 0.2235294, 0, 1,
-1.675136, -1.558612, -0.1025411, 1, 0.227451, 0, 1,
-1.646532, -0.3045264, -1.941304, 1, 0.2352941, 0, 1,
-1.645608, -1.124053, -3.75768, 1, 0.2392157, 0, 1,
-1.638204, -0.6587499, -2.410791, 1, 0.2470588, 0, 1,
-1.635683, -0.4745285, -1.18907, 1, 0.2509804, 0, 1,
-1.627973, -0.551668, -3.332333, 1, 0.2588235, 0, 1,
-1.622934, -0.9080592, -0.7713781, 1, 0.2627451, 0, 1,
-1.618994, -0.7954991, -3.086048, 1, 0.2705882, 0, 1,
-1.608234, -0.1693688, -3.375114, 1, 0.2745098, 0, 1,
-1.580231, -0.4853182, -1.534099, 1, 0.282353, 0, 1,
-1.575793, 0.3109022, -2.190117, 1, 0.2862745, 0, 1,
-1.5582, 1.204797, -0.918648, 1, 0.2941177, 0, 1,
-1.553953, 0.0004542593, -2.580663, 1, 0.3019608, 0, 1,
-1.548242, 0.6770704, -3.190942, 1, 0.3058824, 0, 1,
-1.54697, 0.8486249, -1.880117, 1, 0.3137255, 0, 1,
-1.543637, 1.087458, 0.1923978, 1, 0.3176471, 0, 1,
-1.527649, -0.4680316, -0.974533, 1, 0.3254902, 0, 1,
-1.517765, -1.611261, -1.403923, 1, 0.3294118, 0, 1,
-1.512254, 1.519143, 0.7191715, 1, 0.3372549, 0, 1,
-1.488868, -1.125189, -0.5971299, 1, 0.3411765, 0, 1,
-1.478888, 0.3030389, -1.233327, 1, 0.3490196, 0, 1,
-1.469762, 0.9697552, -0.5862322, 1, 0.3529412, 0, 1,
-1.449566, -0.9946576, -3.806959, 1, 0.3607843, 0, 1,
-1.443059, -0.5914453, -1.914215, 1, 0.3647059, 0, 1,
-1.437453, 1.551139, -0.547374, 1, 0.372549, 0, 1,
-1.432708, 1.159026, -0.08696416, 1, 0.3764706, 0, 1,
-1.42855, -0.6391467, -0.9577473, 1, 0.3843137, 0, 1,
-1.404277, 2.357718, 0.4630847, 1, 0.3882353, 0, 1,
-1.397433, -0.346715, -1.822131, 1, 0.3960784, 0, 1,
-1.386353, -0.8177503, -2.707301, 1, 0.4039216, 0, 1,
-1.384903, -0.2607658, -1.330771, 1, 0.4078431, 0, 1,
-1.369352, -2.276281, -2.600423, 1, 0.4156863, 0, 1,
-1.36819, 0.5465637, 0.08787365, 1, 0.4196078, 0, 1,
-1.366637, -0.01448342, -2.824751, 1, 0.427451, 0, 1,
-1.358294, 0.1711901, -2.471262, 1, 0.4313726, 0, 1,
-1.35538, -0.8544638, -2.887549, 1, 0.4392157, 0, 1,
-1.351459, -0.4463, -2.300304, 1, 0.4431373, 0, 1,
-1.344052, -0.4273543, 0.1540589, 1, 0.4509804, 0, 1,
-1.340254, -0.8076813, -1.59802, 1, 0.454902, 0, 1,
-1.335493, 0.4465489, -1.217825, 1, 0.4627451, 0, 1,
-1.332489, 0.1068849, -3.766713, 1, 0.4666667, 0, 1,
-1.328204, 2.056903, -0.8059425, 1, 0.4745098, 0, 1,
-1.322284, 1.138651, -1.065741, 1, 0.4784314, 0, 1,
-1.316153, -0.8459449, -2.381649, 1, 0.4862745, 0, 1,
-1.314254, -2.641927, -2.324376, 1, 0.4901961, 0, 1,
-1.297343, 1.36417, -0.3511429, 1, 0.4980392, 0, 1,
-1.286925, 0.3680468, -2.071108, 1, 0.5058824, 0, 1,
-1.278148, -0.04925215, -1.964073, 1, 0.509804, 0, 1,
-1.276897, -0.5078806, -1.878573, 1, 0.5176471, 0, 1,
-1.27414, 0.3638841, -3.418267, 1, 0.5215687, 0, 1,
-1.266324, -0.04640383, -2.641088, 1, 0.5294118, 0, 1,
-1.266248, 0.3793536, -1.68656, 1, 0.5333334, 0, 1,
-1.26493, -0.7703362, -1.592836, 1, 0.5411765, 0, 1,
-1.263159, 0.1744804, -0.4122227, 1, 0.5450981, 0, 1,
-1.239745, 1.35794, -0.9596864, 1, 0.5529412, 0, 1,
-1.214801, -0.594057, -2.313069, 1, 0.5568628, 0, 1,
-1.207477, -0.3629681, -1.638429, 1, 0.5647059, 0, 1,
-1.203898, -0.5420648, -2.40593, 1, 0.5686275, 0, 1,
-1.196526, 0.171037, -0.925375, 1, 0.5764706, 0, 1,
-1.190502, -0.0107633, -2.507533, 1, 0.5803922, 0, 1,
-1.189025, 0.6098767, -1.538962, 1, 0.5882353, 0, 1,
-1.181839, -0.6024287, -2.239129, 1, 0.5921569, 0, 1,
-1.180234, -0.09064521, -0.8805905, 1, 0.6, 0, 1,
-1.178771, -0.07748288, -3.842221, 1, 0.6078432, 0, 1,
-1.17817, -0.4553396, -2.060275, 1, 0.6117647, 0, 1,
-1.17311, -0.7851237, -3.234151, 1, 0.6196079, 0, 1,
-1.172053, -0.5095133, -2.734021, 1, 0.6235294, 0, 1,
-1.162728, -0.7960711, -0.9211083, 1, 0.6313726, 0, 1,
-1.161065, -1.585545, -4.595167, 1, 0.6352941, 0, 1,
-1.156839, 0.4188626, -0.1462535, 1, 0.6431373, 0, 1,
-1.15638, 1.261645, -0.5271864, 1, 0.6470588, 0, 1,
-1.153383, 0.1092959, -0.9018645, 1, 0.654902, 0, 1,
-1.15289, -1.321806, -2.250113, 1, 0.6588235, 0, 1,
-1.143412, 0.03791398, 0.5234339, 1, 0.6666667, 0, 1,
-1.134839, -0.8912709, -3.25022, 1, 0.6705883, 0, 1,
-1.131741, 0.8097579, -0.8043033, 1, 0.6784314, 0, 1,
-1.129761, 0.430459, -1.711592, 1, 0.682353, 0, 1,
-1.128794, 0.6701872, -0.01148552, 1, 0.6901961, 0, 1,
-1.128112, 0.9987994, -1.42006, 1, 0.6941177, 0, 1,
-1.125502, 0.2218194, -0.6564913, 1, 0.7019608, 0, 1,
-1.120205, -0.3402849, -3.920417, 1, 0.7098039, 0, 1,
-1.115826, -0.4416333, -0.5361396, 1, 0.7137255, 0, 1,
-1.110845, 0.5357708, -0.02206065, 1, 0.7215686, 0, 1,
-1.110341, -0.05682091, -2.987733, 1, 0.7254902, 0, 1,
-1.10267, -0.9116942, -2.41639, 1, 0.7333333, 0, 1,
-1.096666, -0.008666893, -1.677075, 1, 0.7372549, 0, 1,
-1.094855, 0.9346296, -0.4044335, 1, 0.7450981, 0, 1,
-1.08929, -1.367154, 0.3676501, 1, 0.7490196, 0, 1,
-1.082695, -0.2692704, -3.029735, 1, 0.7568628, 0, 1,
-1.081845, 0.2294998, -1.147361, 1, 0.7607843, 0, 1,
-1.079134, 1.623578, 0.3039894, 1, 0.7686275, 0, 1,
-1.076062, 0.8168436, -1.220649, 1, 0.772549, 0, 1,
-1.074823, -0.3012588, -1.926627, 1, 0.7803922, 0, 1,
-1.074562, 0.5410988, -1.787457, 1, 0.7843137, 0, 1,
-1.067758, -0.1538148, -2.435632, 1, 0.7921569, 0, 1,
-1.066094, -0.3809719, -1.984075, 1, 0.7960784, 0, 1,
-1.064978, 0.258257, -1.057373, 1, 0.8039216, 0, 1,
-1.063867, 0.2151098, -1.842057, 1, 0.8117647, 0, 1,
-1.044358, 0.1731919, -3.223246, 1, 0.8156863, 0, 1,
-1.043534, -1.324779, -3.408895, 1, 0.8235294, 0, 1,
-1.038582, -0.2715806, -2.231039, 1, 0.827451, 0, 1,
-1.035618, 1.317146, -1.694571, 1, 0.8352941, 0, 1,
-1.03305, -0.7942379, -3.589175, 1, 0.8392157, 0, 1,
-1.023127, -0.4895188, -0.5488238, 1, 0.8470588, 0, 1,
-1.018267, -0.8068778, -1.310188, 1, 0.8509804, 0, 1,
-1.004887, 1.08012, 0.4223489, 1, 0.8588235, 0, 1,
-0.9995143, -1.679879, -3.761626, 1, 0.8627451, 0, 1,
-0.9978685, -0.02143135, -1.531022, 1, 0.8705882, 0, 1,
-0.9935395, -2.241833, -4.907184, 1, 0.8745098, 0, 1,
-0.9909979, 0.7193164, 0.5797583, 1, 0.8823529, 0, 1,
-0.9904687, 0.5228084, -0.06139301, 1, 0.8862745, 0, 1,
-0.9885688, 0.7185129, 0.7050627, 1, 0.8941177, 0, 1,
-0.9841484, -1.401826, -2.566192, 1, 0.8980392, 0, 1,
-0.9814013, -1.249079, -2.158682, 1, 0.9058824, 0, 1,
-0.9797175, -0.2220045, -2.748905, 1, 0.9137255, 0, 1,
-0.9782828, -1.030117, -3.736743, 1, 0.9176471, 0, 1,
-0.9760633, 0.1765136, -0.9515604, 1, 0.9254902, 0, 1,
-0.9713571, 0.005941548, 0.1661989, 1, 0.9294118, 0, 1,
-0.9710739, -1.591754, 0.258967, 1, 0.9372549, 0, 1,
-0.9615252, -0.7934394, -2.035816, 1, 0.9411765, 0, 1,
-0.951802, -0.5054889, -1.067176, 1, 0.9490196, 0, 1,
-0.9396738, 2.026075, -0.6078548, 1, 0.9529412, 0, 1,
-0.9279739, -0.1487742, -2.840353, 1, 0.9607843, 0, 1,
-0.9261474, -2.438426, -1.911067, 1, 0.9647059, 0, 1,
-0.9222078, -0.1225915, -1.241774, 1, 0.972549, 0, 1,
-0.9082473, -0.1417873, -2.69137, 1, 0.9764706, 0, 1,
-0.9040762, -0.02766536, 0.6497908, 1, 0.9843137, 0, 1,
-0.9012693, -0.3850262, -2.524309, 1, 0.9882353, 0, 1,
-0.8989319, -1.546082, -2.461128, 1, 0.9960784, 0, 1,
-0.8929425, -1.564731, -2.157002, 0.9960784, 1, 0, 1,
-0.8925334, 1.14632, 0.2608424, 0.9921569, 1, 0, 1,
-0.8916728, 1.572313, 0.1134644, 0.9843137, 1, 0, 1,
-0.8888989, -0.5282004, -3.559816, 0.9803922, 1, 0, 1,
-0.8879539, -0.1703524, -1.592336, 0.972549, 1, 0, 1,
-0.8850042, 2.205302, -0.9775924, 0.9686275, 1, 0, 1,
-0.8837638, -0.869171, -2.809985, 0.9607843, 1, 0, 1,
-0.8804714, -0.5378658, -3.047569, 0.9568627, 1, 0, 1,
-0.8798094, -0.2069768, -1.153921, 0.9490196, 1, 0, 1,
-0.8755676, -0.8258998, -3.167974, 0.945098, 1, 0, 1,
-0.8706819, -1.430946, -1.305243, 0.9372549, 1, 0, 1,
-0.8628355, 0.8685862, -2.341443, 0.9333333, 1, 0, 1,
-0.8522232, -0.4780362, -0.282861, 0.9254902, 1, 0, 1,
-0.8495166, -0.2471161, -2.854894, 0.9215686, 1, 0, 1,
-0.8438813, 1.914049, 0.2610582, 0.9137255, 1, 0, 1,
-0.8386955, 0.6157231, 0.2565011, 0.9098039, 1, 0, 1,
-0.8350353, -2.032432, -1.348316, 0.9019608, 1, 0, 1,
-0.8308678, 1.320917, -0.2880158, 0.8941177, 1, 0, 1,
-0.8285841, -0.1682437, -0.4702613, 0.8901961, 1, 0, 1,
-0.8274596, -0.7434579, -4.376673, 0.8823529, 1, 0, 1,
-0.8083742, 1.048662, 0.908203, 0.8784314, 1, 0, 1,
-0.7799838, 1.028304, -0.6120127, 0.8705882, 1, 0, 1,
-0.7785481, 1.840782, -1.583651, 0.8666667, 1, 0, 1,
-0.7784634, -1.003307, -2.096693, 0.8588235, 1, 0, 1,
-0.7666997, 1.448201, 0.3278721, 0.854902, 1, 0, 1,
-0.7652288, -1.395994, -4.091088, 0.8470588, 1, 0, 1,
-0.7644609, -0.4729056, -2.952935, 0.8431373, 1, 0, 1,
-0.7519099, 1.042973, 0.3864974, 0.8352941, 1, 0, 1,
-0.7447623, 0.5033327, -1.797263, 0.8313726, 1, 0, 1,
-0.7432821, -0.6537951, -0.5057146, 0.8235294, 1, 0, 1,
-0.7370748, 2.391216, -0.569096, 0.8196079, 1, 0, 1,
-0.7357532, -0.8991268, -1.338347, 0.8117647, 1, 0, 1,
-0.7344216, -0.8027705, -3.170579, 0.8078431, 1, 0, 1,
-0.7309445, -0.157347, -1.929323, 0.8, 1, 0, 1,
-0.7304218, -1.073979, -3.967004, 0.7921569, 1, 0, 1,
-0.7263634, -0.5723501, -2.625698, 0.7882353, 1, 0, 1,
-0.7259181, 0.3139451, -0.7542853, 0.7803922, 1, 0, 1,
-0.7254239, 0.88696, -3.406722, 0.7764706, 1, 0, 1,
-0.7213959, -2.416591, -3.01662, 0.7686275, 1, 0, 1,
-0.717986, -1.060943, -1.074533, 0.7647059, 1, 0, 1,
-0.7153696, -0.001361386, -3.489107, 0.7568628, 1, 0, 1,
-0.7138373, -0.6155287, -1.897239, 0.7529412, 1, 0, 1,
-0.7121167, 0.9254989, -0.2890885, 0.7450981, 1, 0, 1,
-0.7077424, 0.0268551, -1.447682, 0.7411765, 1, 0, 1,
-0.7072872, 0.4406328, -1.774012, 0.7333333, 1, 0, 1,
-0.7050844, -0.5436732, -2.276053, 0.7294118, 1, 0, 1,
-0.7042819, -0.0466487, -0.8441167, 0.7215686, 1, 0, 1,
-0.7040403, 1.333577, -1.85507, 0.7176471, 1, 0, 1,
-0.700094, -0.4926256, -1.729848, 0.7098039, 1, 0, 1,
-0.69713, -1.559973, -2.454468, 0.7058824, 1, 0, 1,
-0.6953311, -0.7796735, -1.033555, 0.6980392, 1, 0, 1,
-0.6938286, -1.211154, -1.720812, 0.6901961, 1, 0, 1,
-0.6924968, -0.3690566, -3.484238, 0.6862745, 1, 0, 1,
-0.6909096, -0.7007071, -0.2937333, 0.6784314, 1, 0, 1,
-0.689245, -1.237493, -1.945109, 0.6745098, 1, 0, 1,
-0.6887954, 0.2997735, -1.185928, 0.6666667, 1, 0, 1,
-0.6874267, -0.3771751, -0.9576796, 0.6627451, 1, 0, 1,
-0.6808386, 0.8122001, -0.9084271, 0.654902, 1, 0, 1,
-0.6686209, 1.6649, -1.559368, 0.6509804, 1, 0, 1,
-0.6626157, -1.039003, -2.056864, 0.6431373, 1, 0, 1,
-0.6615438, -1.969819, -1.660706, 0.6392157, 1, 0, 1,
-0.6582404, 1.443572, -0.08303988, 0.6313726, 1, 0, 1,
-0.6567205, -0.1034891, -1.026405, 0.627451, 1, 0, 1,
-0.6521649, 0.1503544, -0.3749687, 0.6196079, 1, 0, 1,
-0.6472479, 0.5516565, -0.06983587, 0.6156863, 1, 0, 1,
-0.6462696, -1.733071, -3.219972, 0.6078432, 1, 0, 1,
-0.6448319, -0.3361807, -3.045545, 0.6039216, 1, 0, 1,
-0.6425305, -0.6028569, -2.495758, 0.5960785, 1, 0, 1,
-0.6397042, -1.945563, -1.727795, 0.5882353, 1, 0, 1,
-0.637144, -0.7055421, -2.491079, 0.5843138, 1, 0, 1,
-0.6361135, 1.006749, -2.278103, 0.5764706, 1, 0, 1,
-0.632234, -1.070119, -4.365622, 0.572549, 1, 0, 1,
-0.6318882, -1.500489, -2.265561, 0.5647059, 1, 0, 1,
-0.6316288, -2.165754, -2.871932, 0.5607843, 1, 0, 1,
-0.6296346, 1.382256, -1.40153, 0.5529412, 1, 0, 1,
-0.6281763, 1.32648, -0.3558331, 0.5490196, 1, 0, 1,
-0.6246948, -0.1917931, -2.606479, 0.5411765, 1, 0, 1,
-0.624148, -1.41986, -3.022769, 0.5372549, 1, 0, 1,
-0.6233149, 1.288085, -1.932207, 0.5294118, 1, 0, 1,
-0.6211758, 0.2725511, -0.6795132, 0.5254902, 1, 0, 1,
-0.6198851, -0.6141689, -2.744609, 0.5176471, 1, 0, 1,
-0.6158165, -1.535459, -1.382734, 0.5137255, 1, 0, 1,
-0.6156289, 0.3425906, -0.8983682, 0.5058824, 1, 0, 1,
-0.6153509, 1.083985, 0.2887213, 0.5019608, 1, 0, 1,
-0.6142276, 1.91267, -0.07087784, 0.4941176, 1, 0, 1,
-0.6131563, -1.020005, -1.764972, 0.4862745, 1, 0, 1,
-0.6120068, -2.057842, -4.101193, 0.4823529, 1, 0, 1,
-0.61097, 1.498439, -2.358541, 0.4745098, 1, 0, 1,
-0.6100586, 0.5190616, -1.311208, 0.4705882, 1, 0, 1,
-0.6029347, 0.5653949, -1.758459, 0.4627451, 1, 0, 1,
-0.5978687, -0.5947168, -2.182196, 0.4588235, 1, 0, 1,
-0.5969095, 0.2373332, -1.670312, 0.4509804, 1, 0, 1,
-0.5954843, -0.08992927, -2.047837, 0.4470588, 1, 0, 1,
-0.5953877, 2.237365, -0.6689801, 0.4392157, 1, 0, 1,
-0.5945566, -0.6577529, -1.084565, 0.4352941, 1, 0, 1,
-0.5895123, 0.3856834, -0.2428929, 0.427451, 1, 0, 1,
-0.5855923, -0.3370517, -1.917307, 0.4235294, 1, 0, 1,
-0.5834075, 2.307943, 0.04111274, 0.4156863, 1, 0, 1,
-0.5834069, 0.8549399, 0.7023646, 0.4117647, 1, 0, 1,
-0.5832903, -0.7720946, -3.126755, 0.4039216, 1, 0, 1,
-0.5792122, -0.3949411, -2.817612, 0.3960784, 1, 0, 1,
-0.5776055, 1.269897, -0.3334998, 0.3921569, 1, 0, 1,
-0.5762073, -0.3553551, -2.540639, 0.3843137, 1, 0, 1,
-0.5723796, -1.291723, -3.76958, 0.3803922, 1, 0, 1,
-0.571707, 1.255509, 0.5271043, 0.372549, 1, 0, 1,
-0.5690923, 1.356594, -0.6250297, 0.3686275, 1, 0, 1,
-0.5641023, -1.541092, -3.54248, 0.3607843, 1, 0, 1,
-0.5636242, 0.8021466, -2.741606, 0.3568628, 1, 0, 1,
-0.5468881, 1.528572, -0.1710852, 0.3490196, 1, 0, 1,
-0.5461947, 0.06309266, -1.124762, 0.345098, 1, 0, 1,
-0.5451158, 1.247195, -1.47717, 0.3372549, 1, 0, 1,
-0.5407169, -3.591255, -3.090399, 0.3333333, 1, 0, 1,
-0.5343201, -1.558746, -2.218631, 0.3254902, 1, 0, 1,
-0.5330963, 0.8943148, -1.804335, 0.3215686, 1, 0, 1,
-0.5328999, 0.9864765, -0.08304916, 0.3137255, 1, 0, 1,
-0.5324407, 0.04533551, -2.000684, 0.3098039, 1, 0, 1,
-0.5300471, 0.1874277, -2.463133, 0.3019608, 1, 0, 1,
-0.5262408, -0.02544334, -1.721323, 0.2941177, 1, 0, 1,
-0.5237582, -0.6521311, -4.341505, 0.2901961, 1, 0, 1,
-0.5232642, 0.6268569, -0.9433602, 0.282353, 1, 0, 1,
-0.5220248, 0.7312962, -2.098282, 0.2784314, 1, 0, 1,
-0.517316, -0.6285693, -2.378196, 0.2705882, 1, 0, 1,
-0.5160435, -0.7573413, -3.059405, 0.2666667, 1, 0, 1,
-0.5141451, 0.4484373, -2.406187, 0.2588235, 1, 0, 1,
-0.5115677, 1.631227, 0.4069896, 0.254902, 1, 0, 1,
-0.5076623, -0.3652935, -2.079497, 0.2470588, 1, 0, 1,
-0.5045254, 0.7100031, 0.6212232, 0.2431373, 1, 0, 1,
-0.503406, -0.4367889, -3.135274, 0.2352941, 1, 0, 1,
-0.5032308, -0.2072245, -1.132858, 0.2313726, 1, 0, 1,
-0.4979222, 0.8003278, 1.009257, 0.2235294, 1, 0, 1,
-0.4940597, -1.172148, -1.77153, 0.2196078, 1, 0, 1,
-0.4922695, 2.093603, -1.438404, 0.2117647, 1, 0, 1,
-0.4908432, -0.2155801, -2.130566, 0.2078431, 1, 0, 1,
-0.490184, 0.1276025, 0.3166645, 0.2, 1, 0, 1,
-0.4867286, 1.049737, -0.8893734, 0.1921569, 1, 0, 1,
-0.4858054, 0.6189528, -0.02319366, 0.1882353, 1, 0, 1,
-0.4812769, -1.421029, -3.864933, 0.1803922, 1, 0, 1,
-0.4793624, 0.5296755, -1.457557, 0.1764706, 1, 0, 1,
-0.4761741, 0.1379641, -0.927607, 0.1686275, 1, 0, 1,
-0.4757643, 0.7677612, -1.035534, 0.1647059, 1, 0, 1,
-0.474947, 0.1851556, -0.8908544, 0.1568628, 1, 0, 1,
-0.4725751, 0.9179327, 0.6082475, 0.1529412, 1, 0, 1,
-0.4685251, 0.7996666, -1.066796, 0.145098, 1, 0, 1,
-0.4676593, 2.009409, -0.01257966, 0.1411765, 1, 0, 1,
-0.4644652, -0.726672, -2.218874, 0.1333333, 1, 0, 1,
-0.4624555, -0.5463498, -2.390929, 0.1294118, 1, 0, 1,
-0.4544914, -0.933322, -2.063872, 0.1215686, 1, 0, 1,
-0.4543619, -0.5122605, -2.666456, 0.1176471, 1, 0, 1,
-0.4532219, 0.9197659, 0.1414764, 0.1098039, 1, 0, 1,
-0.4499431, 0.7079144, 0.2363853, 0.1058824, 1, 0, 1,
-0.4395435, -0.4134766, -2.637229, 0.09803922, 1, 0, 1,
-0.4392065, 0.6428992, 0.118287, 0.09019608, 1, 0, 1,
-0.4330192, -0.3411506, -2.403855, 0.08627451, 1, 0, 1,
-0.4317881, -0.6585909, -2.891083, 0.07843138, 1, 0, 1,
-0.4302971, 0.39783, -0.7996076, 0.07450981, 1, 0, 1,
-0.4245172, -0.4001205, -3.73205, 0.06666667, 1, 0, 1,
-0.4150276, 0.6730509, -0.7029053, 0.0627451, 1, 0, 1,
-0.4136611, -0.1916559, -2.892491, 0.05490196, 1, 0, 1,
-0.4097153, 0.4601098, 1.223442, 0.05098039, 1, 0, 1,
-0.4049473, -1.353148, -1.334652, 0.04313726, 1, 0, 1,
-0.4041114, 0.9235007, -0.5056563, 0.03921569, 1, 0, 1,
-0.3977619, -0.5007285, -0.9918606, 0.03137255, 1, 0, 1,
-0.3975729, 0.8463703, -1.287091, 0.02745098, 1, 0, 1,
-0.3965388, 1.348864, 0.2048471, 0.01960784, 1, 0, 1,
-0.3931424, -0.05143048, -1.964802, 0.01568628, 1, 0, 1,
-0.3867687, 0.04969265, -1.663583, 0.007843138, 1, 0, 1,
-0.3828826, 0.7991367, 1.29329, 0.003921569, 1, 0, 1,
-0.3806816, 1.481087, -1.000943, 0, 1, 0.003921569, 1,
-0.3757848, 1.23638, 0.4176981, 0, 1, 0.01176471, 1,
-0.3703114, 0.6400009, -0.9804386, 0, 1, 0.01568628, 1,
-0.3696866, 1.155961, 1.350293, 0, 1, 0.02352941, 1,
-0.3589773, -0.4396344, -4.072635, 0, 1, 0.02745098, 1,
-0.3475772, 0.240806, 0.2853681, 0, 1, 0.03529412, 1,
-0.3446761, -0.1553481, -1.972784, 0, 1, 0.03921569, 1,
-0.3436515, -1.169449, -3.136756, 0, 1, 0.04705882, 1,
-0.3433312, -0.4504459, -2.342752, 0, 1, 0.05098039, 1,
-0.3423056, 0.7873085, -0.877472, 0, 1, 0.05882353, 1,
-0.3417401, -0.5885335, -2.068133, 0, 1, 0.0627451, 1,
-0.3388792, -0.6825677, -2.42064, 0, 1, 0.07058824, 1,
-0.3374903, 0.5264825, -0.5528201, 0, 1, 0.07450981, 1,
-0.3337038, 1.253792, 0.4926677, 0, 1, 0.08235294, 1,
-0.3315564, -0.3318218, -2.449056, 0, 1, 0.08627451, 1,
-0.3270133, -0.09166673, -1.38718, 0, 1, 0.09411765, 1,
-0.3247607, -0.3281602, -4.1533, 0, 1, 0.1019608, 1,
-0.3232243, 0.5617905, -1.472674, 0, 1, 0.1058824, 1,
-0.3190526, -0.4100082, -3.579877, 0, 1, 0.1137255, 1,
-0.3177126, 0.8598444, -0.9343646, 0, 1, 0.1176471, 1,
-0.317672, -0.2348028, -2.776169, 0, 1, 0.1254902, 1,
-0.3166367, 0.8122285, -0.3341442, 0, 1, 0.1294118, 1,
-0.3154255, 1.467221, 0.1916332, 0, 1, 0.1372549, 1,
-0.3146728, -0.6514403, -3.803516, 0, 1, 0.1411765, 1,
-0.314295, -0.4094689, -3.197141, 0, 1, 0.1490196, 1,
-0.3065414, 0.05893787, -1.563052, 0, 1, 0.1529412, 1,
-0.3054493, 1.142703, -1.020467, 0, 1, 0.1607843, 1,
-0.3023715, -0.06041814, -0.733373, 0, 1, 0.1647059, 1,
-0.3020017, 0.4295718, -1.505617, 0, 1, 0.172549, 1,
-0.3016677, 0.3330111, -1.574818, 0, 1, 0.1764706, 1,
-0.3013178, 0.9725074, -0.9835575, 0, 1, 0.1843137, 1,
-0.3008558, -1.28382, -2.746196, 0, 1, 0.1882353, 1,
-0.3008061, 0.2186797, -0.3697176, 0, 1, 0.1960784, 1,
-0.3003902, -1.290961, -3.521754, 0, 1, 0.2039216, 1,
-0.2999445, 0.7382887, -1.071665, 0, 1, 0.2078431, 1,
-0.2952918, 0.3884252, -1.969644, 0, 1, 0.2156863, 1,
-0.291869, -1.219658, -3.417817, 0, 1, 0.2196078, 1,
-0.2915035, -1.21964, -3.741489, 0, 1, 0.227451, 1,
-0.2883509, -0.3482407, -1.116033, 0, 1, 0.2313726, 1,
-0.2881592, -0.7917969, -3.779518, 0, 1, 0.2392157, 1,
-0.2847397, -0.02820627, -2.064495, 0, 1, 0.2431373, 1,
-0.2813392, -0.1777212, -1.261126, 0, 1, 0.2509804, 1,
-0.2812837, -1.822784, -4.509806, 0, 1, 0.254902, 1,
-0.2693093, 0.03547352, -0.574101, 0, 1, 0.2627451, 1,
-0.2667605, -1.121635, -1.89011, 0, 1, 0.2666667, 1,
-0.2667299, -0.8783801, -1.258883, 0, 1, 0.2745098, 1,
-0.2665768, -1.566171, -1.163293, 0, 1, 0.2784314, 1,
-0.265977, 0.8120405, -0.5978483, 0, 1, 0.2862745, 1,
-0.2644936, -0.08316005, -0.8054732, 0, 1, 0.2901961, 1,
-0.2620927, 0.4034722, -2.286141, 0, 1, 0.2980392, 1,
-0.2562745, 0.5477602, -0.9885772, 0, 1, 0.3058824, 1,
-0.2528514, -0.9502162, -3.410043, 0, 1, 0.3098039, 1,
-0.2523816, -0.7615283, -3.387559, 0, 1, 0.3176471, 1,
-0.2521051, 0.2143863, 0.2981378, 0, 1, 0.3215686, 1,
-0.2500194, 0.5852472, -0.3727032, 0, 1, 0.3294118, 1,
-0.2475247, 0.6624107, -1.027851, 0, 1, 0.3333333, 1,
-0.2462431, -0.9854018, -1.286668, 0, 1, 0.3411765, 1,
-0.2460966, -0.4473422, -0.929958, 0, 1, 0.345098, 1,
-0.2448364, -1.940178, -3.443569, 0, 1, 0.3529412, 1,
-0.2434246, -1.043448, -3.153105, 0, 1, 0.3568628, 1,
-0.2429249, 0.9964656, -1.666195, 0, 1, 0.3647059, 1,
-0.2387474, -0.2565989, -0.0009747043, 0, 1, 0.3686275, 1,
-0.2367568, -1.629086, -2.914828, 0, 1, 0.3764706, 1,
-0.2360376, -0.3406042, -4.783529, 0, 1, 0.3803922, 1,
-0.2304894, 0.6242587, 0.5217365, 0, 1, 0.3882353, 1,
-0.2268699, -1.158235, -1.620654, 0, 1, 0.3921569, 1,
-0.2243037, -0.09985404, -2.480817, 0, 1, 0.4, 1,
-0.2216273, -1.524134, -2.352194, 0, 1, 0.4078431, 1,
-0.2185291, -0.4139738, -1.55459, 0, 1, 0.4117647, 1,
-0.2181237, 1.033742, -0.08512345, 0, 1, 0.4196078, 1,
-0.2152359, 1.38737, -0.3697633, 0, 1, 0.4235294, 1,
-0.213797, -0.6644493, -4.038268, 0, 1, 0.4313726, 1,
-0.210213, -0.7694991, -1.11296, 0, 1, 0.4352941, 1,
-0.2084848, 0.6587387, -1.427008, 0, 1, 0.4431373, 1,
-0.2025522, -0.007763783, -0.4908889, 0, 1, 0.4470588, 1,
-0.2015416, 0.7978334, -0.7995059, 0, 1, 0.454902, 1,
-0.1980191, -0.8413787, -2.958887, 0, 1, 0.4588235, 1,
-0.1894824, -0.442295, -3.250755, 0, 1, 0.4666667, 1,
-0.1878606, 2.467051, 1.65989, 0, 1, 0.4705882, 1,
-0.1857018, -0.1480011, -2.741387, 0, 1, 0.4784314, 1,
-0.1846807, 1.617845, -1.484996, 0, 1, 0.4823529, 1,
-0.1841941, -1.237236, -1.461483, 0, 1, 0.4901961, 1,
-0.1836471, 0.8703343, -0.7954753, 0, 1, 0.4941176, 1,
-0.181468, 0.8904558, -1.354313, 0, 1, 0.5019608, 1,
-0.1794352, 1.758498, 0.2439816, 0, 1, 0.509804, 1,
-0.1749863, 1.653597, -1.034169, 0, 1, 0.5137255, 1,
-0.1732923, 0.6086354, -0.9837475, 0, 1, 0.5215687, 1,
-0.1689966, 0.08262312, -3.337641, 0, 1, 0.5254902, 1,
-0.1635316, -0.1970386, -1.421863, 0, 1, 0.5333334, 1,
-0.1597844, -0.6599333, -2.480983, 0, 1, 0.5372549, 1,
-0.15927, 0.5113399, -1.795602, 0, 1, 0.5450981, 1,
-0.1556641, 0.05641583, -0.619096, 0, 1, 0.5490196, 1,
-0.1513347, -0.6153362, -1.269227, 0, 1, 0.5568628, 1,
-0.1464227, -1.718608, -3.324055, 0, 1, 0.5607843, 1,
-0.1450949, -1.535223, -2.27811, 0, 1, 0.5686275, 1,
-0.1405529, 1.112798, -1.113807, 0, 1, 0.572549, 1,
-0.1399619, -0.5571277, -4.149511, 0, 1, 0.5803922, 1,
-0.1384366, -0.4039036, -2.444269, 0, 1, 0.5843138, 1,
-0.1379612, -1.03031, -2.873454, 0, 1, 0.5921569, 1,
-0.1352248, 0.5456749, -0.4703868, 0, 1, 0.5960785, 1,
-0.1351611, -0.3010161, -2.486811, 0, 1, 0.6039216, 1,
-0.1343285, 0.4223342, -1.947921, 0, 1, 0.6117647, 1,
-0.1325499, 0.1030803, -2.995025, 0, 1, 0.6156863, 1,
-0.1316706, 0.667608, 0.7551607, 0, 1, 0.6235294, 1,
-0.1292698, 0.5069432, -0.6962193, 0, 1, 0.627451, 1,
-0.1291823, -1.030164, -2.311453, 0, 1, 0.6352941, 1,
-0.1255222, -0.2683145, -3.437211, 0, 1, 0.6392157, 1,
-0.1253336, 0.2831976, 1.000192, 0, 1, 0.6470588, 1,
-0.1224408, -0.8363192, -3.225436, 0, 1, 0.6509804, 1,
-0.12149, -2.048584, -3.193696, 0, 1, 0.6588235, 1,
-0.1201003, -0.8298634, -2.206536, 0, 1, 0.6627451, 1,
-0.12006, 1.266486, -0.04267462, 0, 1, 0.6705883, 1,
-0.119381, 1.53939, 1.446366, 0, 1, 0.6745098, 1,
-0.1181507, 0.1160723, -0.676608, 0, 1, 0.682353, 1,
-0.1133677, 0.3662755, 0.3314249, 0, 1, 0.6862745, 1,
-0.1084279, -1.193944, -3.303483, 0, 1, 0.6941177, 1,
-0.107288, 1.107374, -2.573686, 0, 1, 0.7019608, 1,
-0.1069438, -1.154967, -2.313373, 0, 1, 0.7058824, 1,
-0.1061791, 0.08669538, -1.544378, 0, 1, 0.7137255, 1,
-0.1037955, 1.320619, -1.746292, 0, 1, 0.7176471, 1,
-0.1032619, -1.379506, -2.310164, 0, 1, 0.7254902, 1,
-0.1011749, 0.4498954, 0.6228679, 0, 1, 0.7294118, 1,
-0.100614, -0.06312281, -2.157771, 0, 1, 0.7372549, 1,
-0.09070565, -1.375751, -4.24417, 0, 1, 0.7411765, 1,
-0.08878519, 0.9827665, 0.134046, 0, 1, 0.7490196, 1,
-0.08704678, 1.062327, -0.5840498, 0, 1, 0.7529412, 1,
-0.08513326, -0.8465056, -3.530356, 0, 1, 0.7607843, 1,
-0.07863303, 0.9499078, 0.04113926, 0, 1, 0.7647059, 1,
-0.07220089, 0.2552544, 1.021935, 0, 1, 0.772549, 1,
-0.06986663, -0.06050819, -1.869229, 0, 1, 0.7764706, 1,
-0.06663623, 0.8900031, 0.5196191, 0, 1, 0.7843137, 1,
-0.06646765, -1.261613, -2.272308, 0, 1, 0.7882353, 1,
-0.06620924, -1.016039, -2.421744, 0, 1, 0.7960784, 1,
-0.06491867, 1.332526, 0.8559853, 0, 1, 0.8039216, 1,
-0.06322851, 1.977648, 0.5813141, 0, 1, 0.8078431, 1,
-0.06293086, 1.622757, -1.50383, 0, 1, 0.8156863, 1,
-0.05327171, 0.2680863, 2.14407, 0, 1, 0.8196079, 1,
-0.04740108, 0.04907511, -0.3728724, 0, 1, 0.827451, 1,
-0.04441445, 0.2434417, -0.02279349, 0, 1, 0.8313726, 1,
-0.04070808, 1.579541, 0.5524354, 0, 1, 0.8392157, 1,
-0.04030793, -0.313699, -2.444187, 0, 1, 0.8431373, 1,
-0.0373578, 0.09912077, 0.1211418, 0, 1, 0.8509804, 1,
-0.03381637, -0.2246359, -3.510048, 0, 1, 0.854902, 1,
-0.03340212, 0.1304636, -0.419382, 0, 1, 0.8627451, 1,
-0.03082905, -0.3010529, -3.499731, 0, 1, 0.8666667, 1,
-0.03065009, -1.252124, -1.901909, 0, 1, 0.8745098, 1,
-0.03031984, 0.06885235, 2.031749, 0, 1, 0.8784314, 1,
-0.02262158, 0.007121837, -2.134866, 0, 1, 0.8862745, 1,
-0.02118113, -0.3642064, -2.836715, 0, 1, 0.8901961, 1,
-0.01937913, 0.8716957, -1.342338, 0, 1, 0.8980392, 1,
-0.0185936, -0.6543425, -3.151201, 0, 1, 0.9058824, 1,
-0.01717383, 0.899283, 0.4640368, 0, 1, 0.9098039, 1,
-0.01372746, 0.8870425, 0.03156055, 0, 1, 0.9176471, 1,
-0.01232948, 0.4313381, -2.799505, 0, 1, 0.9215686, 1,
-0.0120129, -0.4735532, -2.867987, 0, 1, 0.9294118, 1,
-0.01037177, -0.4091468, -3.032006, 0, 1, 0.9333333, 1,
-0.01025565, -0.01940657, -2.492445, 0, 1, 0.9411765, 1,
-0.007305574, 1.898552, 1.626894, 0, 1, 0.945098, 1,
-0.00707744, 1.44947, 0.290731, 0, 1, 0.9529412, 1,
-0.005551191, 2.723331, -0.33175, 0, 1, 0.9568627, 1,
-0.001764675, 1.521526, 0.148364, 0, 1, 0.9647059, 1,
-0.001073287, 0.1210341, -0.01151218, 0, 1, 0.9686275, 1,
0.0008911276, 1.152666, -0.0268381, 0, 1, 0.9764706, 1,
0.00793392, -1.806504, 3.059899, 0, 1, 0.9803922, 1,
0.01345602, 0.03659617, 0.7863814, 0, 1, 0.9882353, 1,
0.01473962, -0.2006134, 2.786588, 0, 1, 0.9921569, 1,
0.01571376, -1.04406, 4.810048, 0, 1, 1, 1,
0.01580536, 1.056355, 1.846912, 0, 0.9921569, 1, 1,
0.0161648, 0.03957574, 0.7647545, 0, 0.9882353, 1, 1,
0.01835577, 0.06279153, 1.70305, 0, 0.9803922, 1, 1,
0.02267942, 0.1475922, 0.6929668, 0, 0.9764706, 1, 1,
0.02404084, -0.7089234, 2.048945, 0, 0.9686275, 1, 1,
0.02442749, -0.3043282, 3.340081, 0, 0.9647059, 1, 1,
0.02523534, 0.2213643, -0.7585256, 0, 0.9568627, 1, 1,
0.02591781, 0.7074948, 1.567237, 0, 0.9529412, 1, 1,
0.03028913, -0.7411335, 1.686825, 0, 0.945098, 1, 1,
0.03207965, -0.2715463, 3.903494, 0, 0.9411765, 1, 1,
0.03239112, -0.94735, 1.054624, 0, 0.9333333, 1, 1,
0.03534939, -0.1990856, 4.636361, 0, 0.9294118, 1, 1,
0.03716113, -0.0001674492, 1.003307, 0, 0.9215686, 1, 1,
0.03804815, -0.9479504, 2.428328, 0, 0.9176471, 1, 1,
0.04952834, -0.8604363, 4.262066, 0, 0.9098039, 1, 1,
0.05314444, 1.144597, -0.03296939, 0, 0.9058824, 1, 1,
0.05783961, 0.1443705, 1.377426, 0, 0.8980392, 1, 1,
0.05799667, -0.4671491, 4.647122, 0, 0.8901961, 1, 1,
0.06603175, -0.005689301, 3.175991, 0, 0.8862745, 1, 1,
0.07040282, -2.815296, 3.910806, 0, 0.8784314, 1, 1,
0.07075226, -1.462119, 1.692278, 0, 0.8745098, 1, 1,
0.07147446, 0.5584093, -2.028017, 0, 0.8666667, 1, 1,
0.07163185, -2.129894, 1.754655, 0, 0.8627451, 1, 1,
0.07491819, 0.08137809, 1.630566, 0, 0.854902, 1, 1,
0.07523808, -1.684859, 1.589575, 0, 0.8509804, 1, 1,
0.07681398, 0.4280206, 0.04513319, 0, 0.8431373, 1, 1,
0.07795858, -0.04449768, 3.487017, 0, 0.8392157, 1, 1,
0.07843843, -0.013329, 0.6741013, 0, 0.8313726, 1, 1,
0.07858635, 0.3289778, -0.7153683, 0, 0.827451, 1, 1,
0.07895385, 1.091093, -1.440828, 0, 0.8196079, 1, 1,
0.07994, -0.9335263, 4.377857, 0, 0.8156863, 1, 1,
0.08428065, -1.240295, 2.868323, 0, 0.8078431, 1, 1,
0.08613992, -1.067027, 3.951773, 0, 0.8039216, 1, 1,
0.08904752, 0.3096629, 0.2815524, 0, 0.7960784, 1, 1,
0.08944669, -0.4382146, 2.114621, 0, 0.7882353, 1, 1,
0.08965281, -0.8716051, 2.264155, 0, 0.7843137, 1, 1,
0.1022519, -0.6217692, 3.058178, 0, 0.7764706, 1, 1,
0.1043571, 0.3450471, -2.4623, 0, 0.772549, 1, 1,
0.1056147, -2.133526, 4.071338, 0, 0.7647059, 1, 1,
0.1076458, 1.141611, 0.8603397, 0, 0.7607843, 1, 1,
0.1081737, -0.121356, 4.0169, 0, 0.7529412, 1, 1,
0.1085386, 0.2171129, 0.2131978, 0, 0.7490196, 1, 1,
0.1120638, 0.4896535, -0.3565756, 0, 0.7411765, 1, 1,
0.1153529, -1.247261, 4.078679, 0, 0.7372549, 1, 1,
0.115715, 1.349544, 0.04894749, 0, 0.7294118, 1, 1,
0.1163346, 0.8853237, -0.06258871, 0, 0.7254902, 1, 1,
0.1172601, 0.05640538, -0.3211868, 0, 0.7176471, 1, 1,
0.1186773, -0.723282, 3.470025, 0, 0.7137255, 1, 1,
0.1188128, 0.7165562, 1.215757, 0, 0.7058824, 1, 1,
0.1188227, -1.631654, 2.050925, 0, 0.6980392, 1, 1,
0.1209565, -0.9647028, 3.903744, 0, 0.6941177, 1, 1,
0.1228892, 0.04031068, 1.002711, 0, 0.6862745, 1, 1,
0.1243593, 1.52837, -0.1941228, 0, 0.682353, 1, 1,
0.1254174, -0.6181837, 4.528304, 0, 0.6745098, 1, 1,
0.1318815, 0.4425825, 0.06285764, 0, 0.6705883, 1, 1,
0.1334596, 1.755713, 1.070579, 0, 0.6627451, 1, 1,
0.1364184, 0.02340081, 1.594587, 0, 0.6588235, 1, 1,
0.1398066, -0.3412084, 1.518403, 0, 0.6509804, 1, 1,
0.1422221, -0.9040583, 2.115911, 0, 0.6470588, 1, 1,
0.1438373, -0.4171227, 3.419122, 0, 0.6392157, 1, 1,
0.1443522, 0.8686391, 0.5714667, 0, 0.6352941, 1, 1,
0.1494152, -0.2447038, 2.830571, 0, 0.627451, 1, 1,
0.1510478, 0.4067589, 0.4246863, 0, 0.6235294, 1, 1,
0.1537944, 0.2103193, 0.8937694, 0, 0.6156863, 1, 1,
0.1551361, 0.9119096, 0.03658169, 0, 0.6117647, 1, 1,
0.1574447, -1.343855, 4.583907, 0, 0.6039216, 1, 1,
0.159888, -2.206475, 3.866396, 0, 0.5960785, 1, 1,
0.1619947, -1.246172, 0.3909748, 0, 0.5921569, 1, 1,
0.1669724, -0.2229763, 2.323905, 0, 0.5843138, 1, 1,
0.1684861, 1.696483, 1.009002, 0, 0.5803922, 1, 1,
0.1711332, -1.199269, 2.22743, 0, 0.572549, 1, 1,
0.1739523, -0.8280608, 5.175838, 0, 0.5686275, 1, 1,
0.1745947, 0.05385881, 2.519037, 0, 0.5607843, 1, 1,
0.1761076, -0.747945, 3.372483, 0, 0.5568628, 1, 1,
0.1769135, 1.246483, 0.3788601, 0, 0.5490196, 1, 1,
0.1770871, 0.6301662, -0.400614, 0, 0.5450981, 1, 1,
0.1801015, 0.6049818, -0.9141576, 0, 0.5372549, 1, 1,
0.181093, -0.6879021, 3.445974, 0, 0.5333334, 1, 1,
0.1817679, 0.3832786, -0.126036, 0, 0.5254902, 1, 1,
0.1846662, 0.8484281, 2.022864, 0, 0.5215687, 1, 1,
0.1888959, 1.154273, 0.3408765, 0, 0.5137255, 1, 1,
0.1916684, -0.3231144, 1.811414, 0, 0.509804, 1, 1,
0.1956179, -1.35503, 2.221319, 0, 0.5019608, 1, 1,
0.198132, 0.6182821, 0.4460374, 0, 0.4941176, 1, 1,
0.1995385, 1.171425, 0.1770492, 0, 0.4901961, 1, 1,
0.202824, 0.6792293, 0.3951493, 0, 0.4823529, 1, 1,
0.2066677, -1.640619, 3.809418, 0, 0.4784314, 1, 1,
0.2068882, 0.1457459, 0.9413749, 0, 0.4705882, 1, 1,
0.207316, 0.2184452, 1.077186, 0, 0.4666667, 1, 1,
0.2117919, 0.2099732, 0.6895925, 0, 0.4588235, 1, 1,
0.2150665, -0.6382946, 3.661423, 0, 0.454902, 1, 1,
0.2176233, 0.7830726, 1.323122, 0, 0.4470588, 1, 1,
0.217806, -1.662346, 0.9918187, 0, 0.4431373, 1, 1,
0.2185366, -0.8336447, 3.003213, 0, 0.4352941, 1, 1,
0.22018, 0.3851454, -0.390651, 0, 0.4313726, 1, 1,
0.2216946, -1.562723, 2.115346, 0, 0.4235294, 1, 1,
0.227604, -0.7098218, 3.402782, 0, 0.4196078, 1, 1,
0.2301521, -1.505423, 3.628219, 0, 0.4117647, 1, 1,
0.2307149, -1.391032, 2.630043, 0, 0.4078431, 1, 1,
0.2354156, -0.6835645, 1.851019, 0, 0.4, 1, 1,
0.2393298, 0.4103288, 1.717097, 0, 0.3921569, 1, 1,
0.2432674, -0.05534863, 0.2321681, 0, 0.3882353, 1, 1,
0.2455714, -0.3213711, 1.534202, 0, 0.3803922, 1, 1,
0.24611, -0.7218829, 3.463734, 0, 0.3764706, 1, 1,
0.2464085, 1.677158, 0.273555, 0, 0.3686275, 1, 1,
0.2477668, -0.1033876, 1.757229, 0, 0.3647059, 1, 1,
0.2491453, -0.972449, 2.261185, 0, 0.3568628, 1, 1,
0.2505679, -1.627533, 3.623775, 0, 0.3529412, 1, 1,
0.2508628, 1.285531, -0.02841602, 0, 0.345098, 1, 1,
0.2513269, -2.269739, 2.101834, 0, 0.3411765, 1, 1,
0.251382, -1.840433, 3.398099, 0, 0.3333333, 1, 1,
0.2533476, -0.4978406, 4.732594, 0, 0.3294118, 1, 1,
0.2533906, -0.2569343, 0.3075842, 0, 0.3215686, 1, 1,
0.2795629, 1.690757, -3.155354, 0, 0.3176471, 1, 1,
0.2808078, 1.586047, -0.6521509, 0, 0.3098039, 1, 1,
0.2840914, -1.484722, 3.775308, 0, 0.3058824, 1, 1,
0.28638, 1.255196, -0.4066653, 0, 0.2980392, 1, 1,
0.2889571, 0.9923312, 1.125587, 0, 0.2901961, 1, 1,
0.2909127, -1.227556, 2.745892, 0, 0.2862745, 1, 1,
0.2916854, 0.50495, 0.450799, 0, 0.2784314, 1, 1,
0.2917104, 1.488488, 0.1647216, 0, 0.2745098, 1, 1,
0.2956987, 0.472296, 0.184666, 0, 0.2666667, 1, 1,
0.2961039, -0.04392571, 2.347907, 0, 0.2627451, 1, 1,
0.297528, 0.2108637, 0.2580778, 0, 0.254902, 1, 1,
0.2975601, 0.08277725, 0.9631392, 0, 0.2509804, 1, 1,
0.3008083, 0.7522801, -0.08839373, 0, 0.2431373, 1, 1,
0.3037295, -1.493174, 1.858344, 0, 0.2392157, 1, 1,
0.3075647, -0.04393541, 1.132198, 0, 0.2313726, 1, 1,
0.3079817, -1.112367, 2.776893, 0, 0.227451, 1, 1,
0.3090378, 2.267307, 1.565874, 0, 0.2196078, 1, 1,
0.3136235, -0.9127047, 1.891374, 0, 0.2156863, 1, 1,
0.3190773, 0.7483721, -0.5751846, 0, 0.2078431, 1, 1,
0.3235129, 1.086233, 0.3269894, 0, 0.2039216, 1, 1,
0.3297484, -1.769254, 1.97416, 0, 0.1960784, 1, 1,
0.3314758, -0.2835258, 3.844774, 0, 0.1882353, 1, 1,
0.3325477, -1.120625, 2.202911, 0, 0.1843137, 1, 1,
0.334128, -1.004189, 3.199676, 0, 0.1764706, 1, 1,
0.3349802, 0.4163274, 1.514758, 0, 0.172549, 1, 1,
0.3377132, 0.7695069, 0.687265, 0, 0.1647059, 1, 1,
0.338946, -0.2376086, 2.7212, 0, 0.1607843, 1, 1,
0.3438652, 0.1172267, 2.839764, 0, 0.1529412, 1, 1,
0.3454833, -1.41298, 3.426702, 0, 0.1490196, 1, 1,
0.3461709, 0.4637232, 0.518429, 0, 0.1411765, 1, 1,
0.3467707, -0.09308662, 1.411886, 0, 0.1372549, 1, 1,
0.3474948, -1.30596, 2.771514, 0, 0.1294118, 1, 1,
0.3501735, -1.165479, 1.97169, 0, 0.1254902, 1, 1,
0.3514909, 1.195318, -0.06329957, 0, 0.1176471, 1, 1,
0.3520027, 1.681651, -0.7544529, 0, 0.1137255, 1, 1,
0.3532412, 0.8843004, 0.9426218, 0, 0.1058824, 1, 1,
0.3536555, 0.03849696, 2.719252, 0, 0.09803922, 1, 1,
0.356695, -1.491043, 3.345105, 0, 0.09411765, 1, 1,
0.3618527, 0.3840835, -1.097257, 0, 0.08627451, 1, 1,
0.362092, -1.355765, 2.984237, 0, 0.08235294, 1, 1,
0.363879, 0.2761837, 1.398443, 0, 0.07450981, 1, 1,
0.3645395, 0.6435179, -0.3972774, 0, 0.07058824, 1, 1,
0.3672714, -0.757838, 2.062543, 0, 0.0627451, 1, 1,
0.3692832, 1.751158, 0.1861085, 0, 0.05882353, 1, 1,
0.3720126, -0.03638894, 1.168278, 0, 0.05098039, 1, 1,
0.3721377, 0.3778133, 0.283476, 0, 0.04705882, 1, 1,
0.372636, 0.3768335, 0.3681847, 0, 0.03921569, 1, 1,
0.3776824, -0.7369962, 2.3369, 0, 0.03529412, 1, 1,
0.3800232, 1.550397, 1.119673, 0, 0.02745098, 1, 1,
0.384991, -0.8426202, 1.370618, 0, 0.02352941, 1, 1,
0.3868973, -0.6859449, 0.8501579, 0, 0.01568628, 1, 1,
0.3925393, 0.1393941, 0.7890539, 0, 0.01176471, 1, 1,
0.4020039, 0.4635912, 0.7096427, 0, 0.003921569, 1, 1,
0.4022816, 1.120091, 0.1195397, 0.003921569, 0, 1, 1,
0.4023967, -1.533136, 1.058197, 0.007843138, 0, 1, 1,
0.404644, -1.792823, 4.338746, 0.01568628, 0, 1, 1,
0.405102, 2.298606, -0.6139209, 0.01960784, 0, 1, 1,
0.4096597, 0.381219, 1.400999, 0.02745098, 0, 1, 1,
0.4111491, -0.3592982, 2.354584, 0.03137255, 0, 1, 1,
0.4137104, -0.3014223, 1.324802, 0.03921569, 0, 1, 1,
0.4196379, 2.081132, -0.4739468, 0.04313726, 0, 1, 1,
0.4199454, 0.7660129, -0.2648444, 0.05098039, 0, 1, 1,
0.4238768, -0.4878116, 2.143241, 0.05490196, 0, 1, 1,
0.4244338, 0.04478208, 1.138219, 0.0627451, 0, 1, 1,
0.4263318, 0.07781649, 1.118141, 0.06666667, 0, 1, 1,
0.4269667, 0.1583727, 0.06261293, 0.07450981, 0, 1, 1,
0.4276278, 0.8728414, 1.210514, 0.07843138, 0, 1, 1,
0.4322986, -0.8623762, 2.298913, 0.08627451, 0, 1, 1,
0.4422046, 0.4114273, 1.124005, 0.09019608, 0, 1, 1,
0.4424653, 1.798583, 1.793543, 0.09803922, 0, 1, 1,
0.4428544, -0.4779394, 1.552536, 0.1058824, 0, 1, 1,
0.443188, 1.132025, -1.272597, 0.1098039, 0, 1, 1,
0.4478996, 1.173635, 1.299296, 0.1176471, 0, 1, 1,
0.4488217, 1.311032, 1.470626, 0.1215686, 0, 1, 1,
0.4517109, -0.01752444, 1.851245, 0.1294118, 0, 1, 1,
0.4528874, 0.3403623, 2.629438, 0.1333333, 0, 1, 1,
0.4542836, 0.5049039, 0.01235384, 0.1411765, 0, 1, 1,
0.4631293, 2.854458, 2.028246, 0.145098, 0, 1, 1,
0.4643427, -0.0182605, 3.008933, 0.1529412, 0, 1, 1,
0.4678335, 2.269824, -0.3943791, 0.1568628, 0, 1, 1,
0.4696041, -2.38117, 4.424196, 0.1647059, 0, 1, 1,
0.4751538, -0.9785248, 3.03173, 0.1686275, 0, 1, 1,
0.4792444, -0.149566, 1.826082, 0.1764706, 0, 1, 1,
0.4806837, 0.3404353, 1.262178, 0.1803922, 0, 1, 1,
0.4812354, 0.3772501, 0.7887455, 0.1882353, 0, 1, 1,
0.4861419, 0.2574863, 0.980343, 0.1921569, 0, 1, 1,
0.4911212, 0.05744218, 1.97664, 0.2, 0, 1, 1,
0.4951796, -0.1009236, 3.122144, 0.2078431, 0, 1, 1,
0.5000136, 0.02187025, 0.3927539, 0.2117647, 0, 1, 1,
0.5003929, 0.8091818, -0.4757198, 0.2196078, 0, 1, 1,
0.5015453, 1.607139, -1.938938, 0.2235294, 0, 1, 1,
0.5073016, -0.2641133, 1.423416, 0.2313726, 0, 1, 1,
0.5088407, -0.391359, 2.40964, 0.2352941, 0, 1, 1,
0.5148447, -0.6803155, 2.161719, 0.2431373, 0, 1, 1,
0.5170465, 0.6952997, 0.7996556, 0.2470588, 0, 1, 1,
0.5205342, -0.3699185, 2.442887, 0.254902, 0, 1, 1,
0.5219409, -0.1578137, 1.102606, 0.2588235, 0, 1, 1,
0.5233573, -0.3389109, 2.355802, 0.2666667, 0, 1, 1,
0.524969, -0.09379436, 2.54377, 0.2705882, 0, 1, 1,
0.5271866, -0.1079278, 1.319338, 0.2784314, 0, 1, 1,
0.5307587, -0.3395854, 2.528605, 0.282353, 0, 1, 1,
0.5325562, 0.1684068, 0.2830535, 0.2901961, 0, 1, 1,
0.5345525, 1.492398, 0.4963252, 0.2941177, 0, 1, 1,
0.5357541, -1.884098, 1.304091, 0.3019608, 0, 1, 1,
0.5420196, -0.08412419, 3.23347, 0.3098039, 0, 1, 1,
0.5442623, 0.3874933, 1.785372, 0.3137255, 0, 1, 1,
0.5446096, 1.182003, 0.6266003, 0.3215686, 0, 1, 1,
0.5449969, -0.3233776, 1.559548, 0.3254902, 0, 1, 1,
0.5450635, -1.19727, 2.92338, 0.3333333, 0, 1, 1,
0.5455065, -0.8195031, 0.7012176, 0.3372549, 0, 1, 1,
0.5493222, 0.3910019, -0.1339828, 0.345098, 0, 1, 1,
0.5541081, -0.05953249, 0.665235, 0.3490196, 0, 1, 1,
0.5566087, -3.050037, 3.530236, 0.3568628, 0, 1, 1,
0.5569782, -1.063283, 4.626307, 0.3607843, 0, 1, 1,
0.557722, 1.27119, 1.059229, 0.3686275, 0, 1, 1,
0.5622599, 0.4391935, 0.7234625, 0.372549, 0, 1, 1,
0.5641558, 0.2781588, 3.202234, 0.3803922, 0, 1, 1,
0.5661658, 0.1535834, 0.3355582, 0.3843137, 0, 1, 1,
0.5717715, 0.8506384, 1.905401, 0.3921569, 0, 1, 1,
0.5790315, -0.6317627, 3.579481, 0.3960784, 0, 1, 1,
0.579071, 0.1222442, 1.183317, 0.4039216, 0, 1, 1,
0.5805586, -0.6089259, 3.265287, 0.4117647, 0, 1, 1,
0.5820361, -0.3827584, 3.372814, 0.4156863, 0, 1, 1,
0.5825107, -0.2150441, 2.154656, 0.4235294, 0, 1, 1,
0.5864835, 0.5674866, 0.2569345, 0.427451, 0, 1, 1,
0.5890596, -1.336646, 4.733497, 0.4352941, 0, 1, 1,
0.5903013, 0.1233265, 0.5756608, 0.4392157, 0, 1, 1,
0.5950679, -1.644891, 2.673741, 0.4470588, 0, 1, 1,
0.5956844, -2.627355, 2.271457, 0.4509804, 0, 1, 1,
0.5980567, -1.866177, 1.769338, 0.4588235, 0, 1, 1,
0.604192, 2.600916, -0.06949438, 0.4627451, 0, 1, 1,
0.608185, -1.197055, 2.303767, 0.4705882, 0, 1, 1,
0.6087824, 1.204347, 2.558743, 0.4745098, 0, 1, 1,
0.6121531, 2.099571, 1.672384, 0.4823529, 0, 1, 1,
0.6218844, -2.003459, 4.781162, 0.4862745, 0, 1, 1,
0.6269425, -1.042324, 2.131278, 0.4941176, 0, 1, 1,
0.6269863, 1.089358, -1.017809, 0.5019608, 0, 1, 1,
0.6271843, 1.513469, 0.06617768, 0.5058824, 0, 1, 1,
0.629903, -0.305001, 3.192473, 0.5137255, 0, 1, 1,
0.6320648, -1.556286, 1.73931, 0.5176471, 0, 1, 1,
0.6357579, -0.4121335, 4.574888, 0.5254902, 0, 1, 1,
0.6364575, 1.062226, 1.648341, 0.5294118, 0, 1, 1,
0.6365198, 0.4762167, 1.225953, 0.5372549, 0, 1, 1,
0.6367627, -0.6206912, 1.047149, 0.5411765, 0, 1, 1,
0.6379088, -0.3156034, 1.254211, 0.5490196, 0, 1, 1,
0.6385769, -0.8608729, 3.619479, 0.5529412, 0, 1, 1,
0.6544816, 0.334116, 1.441041, 0.5607843, 0, 1, 1,
0.6554999, -0.5480933, 1.350462, 0.5647059, 0, 1, 1,
0.6580762, 2.662258, 1.253812, 0.572549, 0, 1, 1,
0.6588852, 1.407073, -0.0314768, 0.5764706, 0, 1, 1,
0.6596271, -0.8568761, 2.118081, 0.5843138, 0, 1, 1,
0.6612256, -0.2817301, 0.6713941, 0.5882353, 0, 1, 1,
0.663395, 1.709274, -1.604661, 0.5960785, 0, 1, 1,
0.6650165, -0.05856141, 0.6507699, 0.6039216, 0, 1, 1,
0.665535, -0.1965778, 1.465061, 0.6078432, 0, 1, 1,
0.671177, -1.053071, 3.747464, 0.6156863, 0, 1, 1,
0.6738448, 1.232309, 0.03606422, 0.6196079, 0, 1, 1,
0.6810841, 0.5003881, 1.72242, 0.627451, 0, 1, 1,
0.6823159, -1.346759, 2.422022, 0.6313726, 0, 1, 1,
0.6872427, 0.7153021, -1.337127, 0.6392157, 0, 1, 1,
0.6923988, -0.9801534, 2.510176, 0.6431373, 0, 1, 1,
0.6980207, 0.5716254, 2.013856, 0.6509804, 0, 1, 1,
0.7015513, 1.875866, -0.6102279, 0.654902, 0, 1, 1,
0.7022268, 1.421996, 0.1931357, 0.6627451, 0, 1, 1,
0.7072548, 0.9203365, 2.61248, 0.6666667, 0, 1, 1,
0.7074287, -1.481883, 2.32388, 0.6745098, 0, 1, 1,
0.7150068, 0.244002, 0.9069, 0.6784314, 0, 1, 1,
0.7164848, 1.564257, -0.7743888, 0.6862745, 0, 1, 1,
0.7176657, -2.031964, 4.289331, 0.6901961, 0, 1, 1,
0.7189913, -1.686896, 1.26125, 0.6980392, 0, 1, 1,
0.721613, -1.898092, 1.171818, 0.7058824, 0, 1, 1,
0.7219807, -1.141527, 1.69133, 0.7098039, 0, 1, 1,
0.7232997, 0.5981832, 0.1999286, 0.7176471, 0, 1, 1,
0.7241287, 0.4012114, 1.570994, 0.7215686, 0, 1, 1,
0.7253594, 0.8721374, 1.659168, 0.7294118, 0, 1, 1,
0.7275888, -0.6364634, 3.216706, 0.7333333, 0, 1, 1,
0.7315828, 1.078205, 0.9509562, 0.7411765, 0, 1, 1,
0.7332999, 2.382751, -0.6057786, 0.7450981, 0, 1, 1,
0.7369908, 0.9668012, -0.8548307, 0.7529412, 0, 1, 1,
0.7371284, -0.9168031, 3.437344, 0.7568628, 0, 1, 1,
0.7403489, -0.3136234, 0.8555929, 0.7647059, 0, 1, 1,
0.7410677, 1.233876, 2.362562, 0.7686275, 0, 1, 1,
0.7482699, 2.298095, 0.3887347, 0.7764706, 0, 1, 1,
0.7551665, 0.4284039, -0.06622895, 0.7803922, 0, 1, 1,
0.7590698, 0.5390009, 0.4734562, 0.7882353, 0, 1, 1,
0.7594989, -1.442025, 3.649152, 0.7921569, 0, 1, 1,
0.7597382, 0.07812313, 0.21662, 0.8, 0, 1, 1,
0.7641722, 0.7518137, -0.238222, 0.8078431, 0, 1, 1,
0.7646434, 0.6091163, -0.4939598, 0.8117647, 0, 1, 1,
0.7683291, 0.6705018, 1.252565, 0.8196079, 0, 1, 1,
0.7701794, 0.3283847, 2.129836, 0.8235294, 0, 1, 1,
0.7706367, 0.1663113, 3.17125, 0.8313726, 0, 1, 1,
0.7742012, 0.5187488, 0.08543719, 0.8352941, 0, 1, 1,
0.7885578, 0.02954834, 0.5231413, 0.8431373, 0, 1, 1,
0.791184, -0.05901859, 1.437271, 0.8470588, 0, 1, 1,
0.793579, 0.312843, -0.3835939, 0.854902, 0, 1, 1,
0.7943171, 0.9812447, 2.749426, 0.8588235, 0, 1, 1,
0.7953106, -0.21267, 2.378313, 0.8666667, 0, 1, 1,
0.8033334, -0.9553228, 1.782799, 0.8705882, 0, 1, 1,
0.8033385, -0.6898041, 3.426971, 0.8784314, 0, 1, 1,
0.8047897, 0.652616, 0.1827697, 0.8823529, 0, 1, 1,
0.8082047, 1.739699, 2.717919, 0.8901961, 0, 1, 1,
0.8192892, -0.3230093, 1.90429, 0.8941177, 0, 1, 1,
0.8202423, -2.884323, 3.442712, 0.9019608, 0, 1, 1,
0.8219348, -0.8335643, 5.917212, 0.9098039, 0, 1, 1,
0.8275301, 0.5457265, 1.120077, 0.9137255, 0, 1, 1,
0.8352644, 2.130011, 0.997519, 0.9215686, 0, 1, 1,
0.8373541, 1.524087, -0.07324215, 0.9254902, 0, 1, 1,
0.8461118, -1.256095, 2.156474, 0.9333333, 0, 1, 1,
0.8486561, 0.4241856, 2.941944, 0.9372549, 0, 1, 1,
0.8493875, 0.8492332, 0.9435003, 0.945098, 0, 1, 1,
0.851235, 1.39142, 0.7418545, 0.9490196, 0, 1, 1,
0.8525446, 0.1456062, 1.973078, 0.9568627, 0, 1, 1,
0.8549805, 0.3995486, 2.50515, 0.9607843, 0, 1, 1,
0.8575824, 0.5516192, 0.6807861, 0.9686275, 0, 1, 1,
0.8588123, 1.39535, -0.3764492, 0.972549, 0, 1, 1,
0.8598374, 1.1002, 1.444576, 0.9803922, 0, 1, 1,
0.8612907, 0.8473541, 0.5061334, 0.9843137, 0, 1, 1,
0.8621271, -0.4368828, 3.036595, 0.9921569, 0, 1, 1,
0.8626038, -0.6113397, 2.600054, 0.9960784, 0, 1, 1,
0.8649007, 0.6801611, 0.9610429, 1, 0, 0.9960784, 1,
0.8663195, -1.83507, 2.742943, 1, 0, 0.9882353, 1,
0.8814788, 0.5013744, 2.145512, 1, 0, 0.9843137, 1,
0.8866724, -0.6167958, 0.4688151, 1, 0, 0.9764706, 1,
0.8980771, 0.216491, 1.293143, 1, 0, 0.972549, 1,
0.9008129, 0.2166328, -0.1026248, 1, 0, 0.9647059, 1,
0.9014531, 0.2181415, 1.077285, 1, 0, 0.9607843, 1,
0.9027363, 0.01798548, 0.7149125, 1, 0, 0.9529412, 1,
0.9038122, -1.324098, 3.305658, 1, 0, 0.9490196, 1,
0.9061984, 0.5765654, -0.03945359, 1, 0, 0.9411765, 1,
0.9063783, -0.4497479, 2.790874, 1, 0, 0.9372549, 1,
0.9135619, -0.7634433, 2.388734, 1, 0, 0.9294118, 1,
0.9212653, -0.3746195, 2.652817, 1, 0, 0.9254902, 1,
0.9219915, -0.7625, 2.7925, 1, 0, 0.9176471, 1,
0.9244327, -0.1901388, 1.71636, 1, 0, 0.9137255, 1,
0.9307889, 1.610036, 1.068446, 1, 0, 0.9058824, 1,
0.9308604, 0.5257206, -0.6187733, 1, 0, 0.9019608, 1,
0.9446961, -0.4173479, 2.546693, 1, 0, 0.8941177, 1,
0.9485934, -1.234836, 3.352999, 1, 0, 0.8862745, 1,
0.9511363, 0.1136082, 2.742929, 1, 0, 0.8823529, 1,
0.9538788, 0.3800716, -0.2243971, 1, 0, 0.8745098, 1,
0.9556696, 0.3021782, 1.515528, 1, 0, 0.8705882, 1,
0.9654393, 1.110644, -0.5147432, 1, 0, 0.8627451, 1,
0.968644, 1.154836, -0.8670957, 1, 0, 0.8588235, 1,
0.9710469, 1.947789, 1.81573, 1, 0, 0.8509804, 1,
0.9748182, -0.2889128, 3.258359, 1, 0, 0.8470588, 1,
0.9751667, -1.103488, 2.947006, 1, 0, 0.8392157, 1,
0.9789066, -1.827701, 2.966412, 1, 0, 0.8352941, 1,
0.9884062, -0.8079693, 2.52975, 1, 0, 0.827451, 1,
0.9942312, 0.4507294, 1.929664, 1, 0, 0.8235294, 1,
1.003686, 1.121077, 0.9248095, 1, 0, 0.8156863, 1,
1.00606, 1.18329, -1.366693, 1, 0, 0.8117647, 1,
1.008218, -0.11133, 2.367541, 1, 0, 0.8039216, 1,
1.026175, -2.08719, 2.426037, 1, 0, 0.7960784, 1,
1.037067, -0.305814, 2.139888, 1, 0, 0.7921569, 1,
1.037115, -0.9111007, 1.994894, 1, 0, 0.7843137, 1,
1.038341, -0.4394191, 1.368283, 1, 0, 0.7803922, 1,
1.038397, 0.7044563, -0.3235443, 1, 0, 0.772549, 1,
1.045926, -0.6824406, 0.9810883, 1, 0, 0.7686275, 1,
1.055278, 0.8182946, 0.6976306, 1, 0, 0.7607843, 1,
1.069657, -1.260538, 1.219445, 1, 0, 0.7568628, 1,
1.071858, -1.049925, 3.010419, 1, 0, 0.7490196, 1,
1.072416, 0.0487573, 1.351233, 1, 0, 0.7450981, 1,
1.085302, -0.6721166, 2.662131, 1, 0, 0.7372549, 1,
1.088768, 0.7240028, -0.8914441, 1, 0, 0.7333333, 1,
1.096542, 0.6489118, 0.4630277, 1, 0, 0.7254902, 1,
1.101818, -0.5518873, 1.867561, 1, 0, 0.7215686, 1,
1.111943, 1.457468, -0.5959957, 1, 0, 0.7137255, 1,
1.112954, -2.39896, 2.287046, 1, 0, 0.7098039, 1,
1.118303, 0.6046864, 1.149553, 1, 0, 0.7019608, 1,
1.119608, -0.6825939, 1.346083, 1, 0, 0.6941177, 1,
1.124048, -0.9651259, 1.733922, 1, 0, 0.6901961, 1,
1.124928, -0.9393136, 2.402612, 1, 0, 0.682353, 1,
1.126997, -0.1381381, 1.151431, 1, 0, 0.6784314, 1,
1.127825, 1.561747, 1.594461, 1, 0, 0.6705883, 1,
1.144296, 0.5912021, 1.607688, 1, 0, 0.6666667, 1,
1.146971, 1.201976, 0.1988467, 1, 0, 0.6588235, 1,
1.148886, -0.3686707, 1.335793, 1, 0, 0.654902, 1,
1.174463, -0.5137985, 2.806751, 1, 0, 0.6470588, 1,
1.186312, 0.4071328, 1.06646, 1, 0, 0.6431373, 1,
1.194043, -0.2051705, 1.361494, 1, 0, 0.6352941, 1,
1.196913, 0.9163219, 1.423419, 1, 0, 0.6313726, 1,
1.202937, 1.283903, 1.615856, 1, 0, 0.6235294, 1,
1.204713, -0.3368688, 2.874188, 1, 0, 0.6196079, 1,
1.216388, 0.3888212, 1.957397, 1, 0, 0.6117647, 1,
1.219069, 1.576164, 1.133303, 1, 0, 0.6078432, 1,
1.228564, 0.6132105, 1.158738, 1, 0, 0.6, 1,
1.229082, -0.0774102, -0.2596075, 1, 0, 0.5921569, 1,
1.233331, -0.1153458, 0.8200901, 1, 0, 0.5882353, 1,
1.247118, 0.2983426, 1.740223, 1, 0, 0.5803922, 1,
1.257062, -1.268705, 3.142149, 1, 0, 0.5764706, 1,
1.25735, 1.086324, 0.1171119, 1, 0, 0.5686275, 1,
1.259631, -0.1692202, 1.542882, 1, 0, 0.5647059, 1,
1.261261, 0.5860658, -0.8933243, 1, 0, 0.5568628, 1,
1.265023, 1.176638, 0.2204944, 1, 0, 0.5529412, 1,
1.27221, 0.8715212, 2.415204, 1, 0, 0.5450981, 1,
1.280418, -1.644369, 3.317532, 1, 0, 0.5411765, 1,
1.281346, -0.4425586, -0.5232617, 1, 0, 0.5333334, 1,
1.286776, 1.479562, 0.7608163, 1, 0, 0.5294118, 1,
1.287054, 0.84574, 1.176351, 1, 0, 0.5215687, 1,
1.289916, 0.9279718, 1.052311, 1, 0, 0.5176471, 1,
1.295379, -0.2085226, 0.07185105, 1, 0, 0.509804, 1,
1.297341, 2.447268, 0.238493, 1, 0, 0.5058824, 1,
1.301864, 2.45293, 0.5477434, 1, 0, 0.4980392, 1,
1.310474, -0.600094, 1.473672, 1, 0, 0.4901961, 1,
1.321072, 0.6668484, 0.3383458, 1, 0, 0.4862745, 1,
1.328642, 0.04132325, 1.328434, 1, 0, 0.4784314, 1,
1.335973, -0.2835487, 0.5072707, 1, 0, 0.4745098, 1,
1.370117, 1.134487, -0.7854853, 1, 0, 0.4666667, 1,
1.382962, -0.3773856, 2.15543, 1, 0, 0.4627451, 1,
1.389023, 1.181192, 1.813898, 1, 0, 0.454902, 1,
1.395991, -0.7084544, 1.951874, 1, 0, 0.4509804, 1,
1.398211, 1.863407, -0.660776, 1, 0, 0.4431373, 1,
1.401856, -1.044433, 2.746963, 1, 0, 0.4392157, 1,
1.406328, -0.3289222, -0.1968209, 1, 0, 0.4313726, 1,
1.416814, 0.5052531, 1.448609, 1, 0, 0.427451, 1,
1.418269, -0.3680913, 3.62385, 1, 0, 0.4196078, 1,
1.419266, 0.784642, -0.3232059, 1, 0, 0.4156863, 1,
1.42354, -2.0093, 1.646114, 1, 0, 0.4078431, 1,
1.431728, -0.1312046, 0.61654, 1, 0, 0.4039216, 1,
1.443766, 0.253116, 0.4644724, 1, 0, 0.3960784, 1,
1.45743, 0.1012407, 0.5639893, 1, 0, 0.3882353, 1,
1.464401, 0.9561483, 0.3134882, 1, 0, 0.3843137, 1,
1.466126, 0.3117756, 1.45208, 1, 0, 0.3764706, 1,
1.479365, 0.363654, 0.07558706, 1, 0, 0.372549, 1,
1.481707, -2.022583, 3.202719, 1, 0, 0.3647059, 1,
1.495897, 1.061136, 0.6608955, 1, 0, 0.3607843, 1,
1.525948, -0.7404248, 0.6492462, 1, 0, 0.3529412, 1,
1.541558, 0.67174, 0.3473166, 1, 0, 0.3490196, 1,
1.541906, 0.3769398, 2.72373, 1, 0, 0.3411765, 1,
1.577551, 0.8368624, 3.277997, 1, 0, 0.3372549, 1,
1.594039, -0.1912742, 2.129042, 1, 0, 0.3294118, 1,
1.598569, 0.6494933, -0.2470697, 1, 0, 0.3254902, 1,
1.655735, -0.9612908, 1.817763, 1, 0, 0.3176471, 1,
1.65913, -0.6635802, 3.24229, 1, 0, 0.3137255, 1,
1.663502, -1.647603, 2.950631, 1, 0, 0.3058824, 1,
1.682859, 1.302095, 0.1148037, 1, 0, 0.2980392, 1,
1.686019, 0.3260356, 2.655083, 1, 0, 0.2941177, 1,
1.689351, -0.2932445, 1.013027, 1, 0, 0.2862745, 1,
1.706279, -0.5430582, 1.995753, 1, 0, 0.282353, 1,
1.714489, 1.490503, 0.4596875, 1, 0, 0.2745098, 1,
1.72126, 0.1220984, 1.777597, 1, 0, 0.2705882, 1,
1.721641, 1.241336, 0.5725328, 1, 0, 0.2627451, 1,
1.726758, -0.1925087, 2.031862, 1, 0, 0.2588235, 1,
1.746411, 1.864913, -0.4295777, 1, 0, 0.2509804, 1,
1.749162, 1.012303, 2.271288, 1, 0, 0.2470588, 1,
1.750733, 0.4574946, 2.433108, 1, 0, 0.2392157, 1,
1.75478, -0.1236325, 2.147778, 1, 0, 0.2352941, 1,
1.756206, -0.6103919, 1.051547, 1, 0, 0.227451, 1,
1.760069, -0.4466709, 2.350587, 1, 0, 0.2235294, 1,
1.794202, 0.2749303, 2.408262, 1, 0, 0.2156863, 1,
1.80118, 1.694762, 1.410592, 1, 0, 0.2117647, 1,
1.834944, 0.4321482, 1.660298, 1, 0, 0.2039216, 1,
1.841791, 0.1531906, 1.897083, 1, 0, 0.1960784, 1,
1.844821, -2.294123, 3.723379, 1, 0, 0.1921569, 1,
1.845878, 1.82962, 1.049895, 1, 0, 0.1843137, 1,
1.865911, -1.433902, 2.981109, 1, 0, 0.1803922, 1,
1.880467, -2.038232, 3.815153, 1, 0, 0.172549, 1,
1.881343, -2.098979, 1.949571, 1, 0, 0.1686275, 1,
1.910941, -0.4219146, 1.569205, 1, 0, 0.1607843, 1,
1.932985, 1.384105, 2.508944, 1, 0, 0.1568628, 1,
1.950084, -1.462151, 3.108707, 1, 0, 0.1490196, 1,
1.956987, 1.509246, 1.003616, 1, 0, 0.145098, 1,
1.996213, -0.7733703, 1.395355, 1, 0, 0.1372549, 1,
2.00047, -0.1711917, 1.294115, 1, 0, 0.1333333, 1,
2.001062, -1.406717, 1.564745, 1, 0, 0.1254902, 1,
2.019978, -0.3922252, 1.831284, 1, 0, 0.1215686, 1,
2.039268, 0.2553877, 0.04569655, 1, 0, 0.1137255, 1,
2.084037, -0.9191158, 2.18054, 1, 0, 0.1098039, 1,
2.085286, 1.505226, 0.9597659, 1, 0, 0.1019608, 1,
2.14815, 0.9898948, 0.344297, 1, 0, 0.09411765, 1,
2.204031, -1.803159, 2.292022, 1, 0, 0.09019608, 1,
2.225539, -1.722833, 3.796354, 1, 0, 0.08235294, 1,
2.234042, -0.4129521, 1.979229, 1, 0, 0.07843138, 1,
2.2368, -0.5708072, 2.545708, 1, 0, 0.07058824, 1,
2.266032, 1.261146, 2.297262, 1, 0, 0.06666667, 1,
2.280934, 0.09802807, 1.906381, 1, 0, 0.05882353, 1,
2.293703, 0.3174149, 0.2704987, 1, 0, 0.05490196, 1,
2.327754, 0.4985405, 1.61864, 1, 0, 0.04705882, 1,
2.336469, 0.6444799, 1.763922, 1, 0, 0.04313726, 1,
2.381098, -0.8749897, 0.8242922, 1, 0, 0.03529412, 1,
2.471809, -0.395448, 1.636566, 1, 0, 0.03137255, 1,
2.504246, -0.6954775, 1.394514, 1, 0, 0.02352941, 1,
2.578228, -0.2433879, 2.040475, 1, 0, 0.01960784, 1,
2.748547, -0.3010839, 1.174581, 1, 0, 0.01176471, 1,
2.828984, -0.5987957, 2.108494, 1, 0, 0.007843138, 1
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
-0.01799607, -4.683803, -6.74192, 0, -0.5, 0.5, 0.5,
-0.01799607, -4.683803, -6.74192, 1, -0.5, 0.5, 0.5,
-0.01799607, -4.683803, -6.74192, 1, 1.5, 0.5, 0.5,
-0.01799607, -4.683803, -6.74192, 0, 1.5, 0.5, 0.5
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
-3.830102, -0.3683985, -6.74192, 0, -0.5, 0.5, 0.5,
-3.830102, -0.3683985, -6.74192, 1, -0.5, 0.5, 0.5,
-3.830102, -0.3683985, -6.74192, 1, 1.5, 0.5, 0.5,
-3.830102, -0.3683985, -6.74192, 0, 1.5, 0.5, 0.5
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
-3.830102, -4.683803, 0.5050142, 0, -0.5, 0.5, 0.5,
-3.830102, -4.683803, 0.5050142, 1, -0.5, 0.5, 0.5,
-3.830102, -4.683803, 0.5050142, 1, 1.5, 0.5, 0.5,
-3.830102, -4.683803, 0.5050142, 0, 1.5, 0.5, 0.5
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
-2, -3.687941, -5.06955,
2, -3.687941, -5.06955,
-2, -3.687941, -5.06955,
-2, -3.853918, -5.348279,
-1, -3.687941, -5.06955,
-1, -3.853918, -5.348279,
0, -3.687941, -5.06955,
0, -3.853918, -5.348279,
1, -3.687941, -5.06955,
1, -3.853918, -5.348279,
2, -3.687941, -5.06955,
2, -3.853918, -5.348279
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
-2, -4.185872, -5.905735, 0, -0.5, 0.5, 0.5,
-2, -4.185872, -5.905735, 1, -0.5, 0.5, 0.5,
-2, -4.185872, -5.905735, 1, 1.5, 0.5, 0.5,
-2, -4.185872, -5.905735, 0, 1.5, 0.5, 0.5,
-1, -4.185872, -5.905735, 0, -0.5, 0.5, 0.5,
-1, -4.185872, -5.905735, 1, -0.5, 0.5, 0.5,
-1, -4.185872, -5.905735, 1, 1.5, 0.5, 0.5,
-1, -4.185872, -5.905735, 0, 1.5, 0.5, 0.5,
0, -4.185872, -5.905735, 0, -0.5, 0.5, 0.5,
0, -4.185872, -5.905735, 1, -0.5, 0.5, 0.5,
0, -4.185872, -5.905735, 1, 1.5, 0.5, 0.5,
0, -4.185872, -5.905735, 0, 1.5, 0.5, 0.5,
1, -4.185872, -5.905735, 0, -0.5, 0.5, 0.5,
1, -4.185872, -5.905735, 1, -0.5, 0.5, 0.5,
1, -4.185872, -5.905735, 1, 1.5, 0.5, 0.5,
1, -4.185872, -5.905735, 0, 1.5, 0.5, 0.5,
2, -4.185872, -5.905735, 0, -0.5, 0.5, 0.5,
2, -4.185872, -5.905735, 1, -0.5, 0.5, 0.5,
2, -4.185872, -5.905735, 1, 1.5, 0.5, 0.5,
2, -4.185872, -5.905735, 0, 1.5, 0.5, 0.5
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
-2.950385, -3, -5.06955,
-2.950385, 2, -5.06955,
-2.950385, -3, -5.06955,
-3.097005, -3, -5.348279,
-2.950385, -2, -5.06955,
-3.097005, -2, -5.348279,
-2.950385, -1, -5.06955,
-3.097005, -1, -5.348279,
-2.950385, 0, -5.06955,
-3.097005, 0, -5.348279,
-2.950385, 1, -5.06955,
-3.097005, 1, -5.348279,
-2.950385, 2, -5.06955,
-3.097005, 2, -5.348279
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
-3.390244, -3, -5.905735, 0, -0.5, 0.5, 0.5,
-3.390244, -3, -5.905735, 1, -0.5, 0.5, 0.5,
-3.390244, -3, -5.905735, 1, 1.5, 0.5, 0.5,
-3.390244, -3, -5.905735, 0, 1.5, 0.5, 0.5,
-3.390244, -2, -5.905735, 0, -0.5, 0.5, 0.5,
-3.390244, -2, -5.905735, 1, -0.5, 0.5, 0.5,
-3.390244, -2, -5.905735, 1, 1.5, 0.5, 0.5,
-3.390244, -2, -5.905735, 0, 1.5, 0.5, 0.5,
-3.390244, -1, -5.905735, 0, -0.5, 0.5, 0.5,
-3.390244, -1, -5.905735, 1, -0.5, 0.5, 0.5,
-3.390244, -1, -5.905735, 1, 1.5, 0.5, 0.5,
-3.390244, -1, -5.905735, 0, 1.5, 0.5, 0.5,
-3.390244, 0, -5.905735, 0, -0.5, 0.5, 0.5,
-3.390244, 0, -5.905735, 1, -0.5, 0.5, 0.5,
-3.390244, 0, -5.905735, 1, 1.5, 0.5, 0.5,
-3.390244, 0, -5.905735, 0, 1.5, 0.5, 0.5,
-3.390244, 1, -5.905735, 0, -0.5, 0.5, 0.5,
-3.390244, 1, -5.905735, 1, -0.5, 0.5, 0.5,
-3.390244, 1, -5.905735, 1, 1.5, 0.5, 0.5,
-3.390244, 1, -5.905735, 0, 1.5, 0.5, 0.5,
-3.390244, 2, -5.905735, 0, -0.5, 0.5, 0.5,
-3.390244, 2, -5.905735, 1, -0.5, 0.5, 0.5,
-3.390244, 2, -5.905735, 1, 1.5, 0.5, 0.5,
-3.390244, 2, -5.905735, 0, 1.5, 0.5, 0.5
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
-2.950385, -3.687941, -4,
-2.950385, -3.687941, 4,
-2.950385, -3.687941, -4,
-3.097005, -3.853918, -4,
-2.950385, -3.687941, -2,
-3.097005, -3.853918, -2,
-2.950385, -3.687941, 0,
-3.097005, -3.853918, 0,
-2.950385, -3.687941, 2,
-3.097005, -3.853918, 2,
-2.950385, -3.687941, 4,
-3.097005, -3.853918, 4
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
-3.390244, -4.185872, -4, 0, -0.5, 0.5, 0.5,
-3.390244, -4.185872, -4, 1, -0.5, 0.5, 0.5,
-3.390244, -4.185872, -4, 1, 1.5, 0.5, 0.5,
-3.390244, -4.185872, -4, 0, 1.5, 0.5, 0.5,
-3.390244, -4.185872, -2, 0, -0.5, 0.5, 0.5,
-3.390244, -4.185872, -2, 1, -0.5, 0.5, 0.5,
-3.390244, -4.185872, -2, 1, 1.5, 0.5, 0.5,
-3.390244, -4.185872, -2, 0, 1.5, 0.5, 0.5,
-3.390244, -4.185872, 0, 0, -0.5, 0.5, 0.5,
-3.390244, -4.185872, 0, 1, -0.5, 0.5, 0.5,
-3.390244, -4.185872, 0, 1, 1.5, 0.5, 0.5,
-3.390244, -4.185872, 0, 0, 1.5, 0.5, 0.5,
-3.390244, -4.185872, 2, 0, -0.5, 0.5, 0.5,
-3.390244, -4.185872, 2, 1, -0.5, 0.5, 0.5,
-3.390244, -4.185872, 2, 1, 1.5, 0.5, 0.5,
-3.390244, -4.185872, 2, 0, 1.5, 0.5, 0.5,
-3.390244, -4.185872, 4, 0, -0.5, 0.5, 0.5,
-3.390244, -4.185872, 4, 1, -0.5, 0.5, 0.5,
-3.390244, -4.185872, 4, 1, 1.5, 0.5, 0.5,
-3.390244, -4.185872, 4, 0, 1.5, 0.5, 0.5
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
-2.950385, -3.687941, -5.06955,
-2.950385, 2.951144, -5.06955,
-2.950385, -3.687941, 6.079578,
-2.950385, 2.951144, 6.079578,
-2.950385, -3.687941, -5.06955,
-2.950385, -3.687941, 6.079578,
-2.950385, 2.951144, -5.06955,
-2.950385, 2.951144, 6.079578,
-2.950385, -3.687941, -5.06955,
2.914393, -3.687941, -5.06955,
-2.950385, -3.687941, 6.079578,
2.914393, -3.687941, 6.079578,
-2.950385, 2.951144, -5.06955,
2.914393, 2.951144, -5.06955,
-2.950385, 2.951144, 6.079578,
2.914393, 2.951144, 6.079578,
2.914393, -3.687941, -5.06955,
2.914393, 2.951144, -5.06955,
2.914393, -3.687941, 6.079578,
2.914393, 2.951144, 6.079578,
2.914393, -3.687941, -5.06955,
2.914393, -3.687941, 6.079578,
2.914393, 2.951144, -5.06955,
2.914393, 2.951144, 6.079578
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
var radius = 7.603856;
var distance = 33.83041;
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
mvMatrix.translate( 0.01799607, 0.3683985, -0.5050142 );
mvMatrix.scale( 1.401833, 1.238339, 0.7374063 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83041);
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
epoxiconazole<-read.table("epoxiconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-epoxiconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'epoxiconazole' not found
```

```r
y<-epoxiconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'epoxiconazole' not found
```

```r
z<-epoxiconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'epoxiconazole' not found
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
-2.864976, 0.3873614, -2.233871, 0, 0, 1, 1, 1,
-2.782929, 0.5872576, -2.66808, 1, 0, 0, 1, 1,
-2.55987, 0.3016646, -2.195797, 1, 0, 0, 1, 1,
-2.511202, -0.3950748, -2.151536, 1, 0, 0, 1, 1,
-2.480398, 1.075664, -0.3846397, 1, 0, 0, 1, 1,
-2.396952, 1.028036, -2.560539, 1, 0, 0, 1, 1,
-2.254941, 0.9091507, 0.4907773, 0, 0, 0, 1, 1,
-2.172458, -0.7466475, -0.4672861, 0, 0, 0, 1, 1,
-2.098679, 1.630576, -0.2504144, 0, 0, 0, 1, 1,
-2.017091, 0.006372254, -1.93818, 0, 0, 0, 1, 1,
-2.011014, -0.08926222, -2.475289, 0, 0, 0, 1, 1,
-1.977095, -2.294528, -2.239628, 0, 0, 0, 1, 1,
-1.942935, -0.4132057, -2.195765, 0, 0, 0, 1, 1,
-1.942053, 0.5594317, -0.6720296, 1, 1, 1, 1, 1,
-1.937659, -0.30276, -3.208787, 1, 1, 1, 1, 1,
-1.925623, -0.5055031, -3.944696, 1, 1, 1, 1, 1,
-1.905247, 0.02608477, -4.14869, 1, 1, 1, 1, 1,
-1.899726, -0.5900308, -1.240792, 1, 1, 1, 1, 1,
-1.887632, -0.2437151, -1.383436, 1, 1, 1, 1, 1,
-1.876086, -0.826506, -3.056487, 1, 1, 1, 1, 1,
-1.868641, 0.1859297, -2.398031, 1, 1, 1, 1, 1,
-1.868484, 1.452909, 0.8362935, 1, 1, 1, 1, 1,
-1.862677, -0.7896526, -0.4271151, 1, 1, 1, 1, 1,
-1.857416, -2.354724, -3.515022, 1, 1, 1, 1, 1,
-1.832967, -0.9594518, -2.635802, 1, 1, 1, 1, 1,
-1.810523, 0.6347837, 0.1154829, 1, 1, 1, 1, 1,
-1.804849, -1.925442, -1.383304, 1, 1, 1, 1, 1,
-1.803323, -1.136939, -1.999538, 1, 1, 1, 1, 1,
-1.772815, 0.2059453, -0.9784076, 0, 0, 1, 1, 1,
-1.757205, 0.8907701, -1.56079, 1, 0, 0, 1, 1,
-1.744312, -1.211487, -3.231349, 1, 0, 0, 1, 1,
-1.735315, -0.4633774, -0.5715653, 1, 0, 0, 1, 1,
-1.710833, 0.02958939, -1.369961, 1, 0, 0, 1, 1,
-1.705557, -0.8036447, -1.385598, 1, 0, 0, 1, 1,
-1.686399, 0.642105, -2.279729, 0, 0, 0, 1, 1,
-1.685997, 0.7763601, -0.9561071, 0, 0, 0, 1, 1,
-1.684799, 0.7377766, -1.07013, 0, 0, 0, 1, 1,
-1.679583, 0.1201195, -2.186891, 0, 0, 0, 1, 1,
-1.675136, -1.558612, -0.1025411, 0, 0, 0, 1, 1,
-1.646532, -0.3045264, -1.941304, 0, 0, 0, 1, 1,
-1.645608, -1.124053, -3.75768, 0, 0, 0, 1, 1,
-1.638204, -0.6587499, -2.410791, 1, 1, 1, 1, 1,
-1.635683, -0.4745285, -1.18907, 1, 1, 1, 1, 1,
-1.627973, -0.551668, -3.332333, 1, 1, 1, 1, 1,
-1.622934, -0.9080592, -0.7713781, 1, 1, 1, 1, 1,
-1.618994, -0.7954991, -3.086048, 1, 1, 1, 1, 1,
-1.608234, -0.1693688, -3.375114, 1, 1, 1, 1, 1,
-1.580231, -0.4853182, -1.534099, 1, 1, 1, 1, 1,
-1.575793, 0.3109022, -2.190117, 1, 1, 1, 1, 1,
-1.5582, 1.204797, -0.918648, 1, 1, 1, 1, 1,
-1.553953, 0.0004542593, -2.580663, 1, 1, 1, 1, 1,
-1.548242, 0.6770704, -3.190942, 1, 1, 1, 1, 1,
-1.54697, 0.8486249, -1.880117, 1, 1, 1, 1, 1,
-1.543637, 1.087458, 0.1923978, 1, 1, 1, 1, 1,
-1.527649, -0.4680316, -0.974533, 1, 1, 1, 1, 1,
-1.517765, -1.611261, -1.403923, 1, 1, 1, 1, 1,
-1.512254, 1.519143, 0.7191715, 0, 0, 1, 1, 1,
-1.488868, -1.125189, -0.5971299, 1, 0, 0, 1, 1,
-1.478888, 0.3030389, -1.233327, 1, 0, 0, 1, 1,
-1.469762, 0.9697552, -0.5862322, 1, 0, 0, 1, 1,
-1.449566, -0.9946576, -3.806959, 1, 0, 0, 1, 1,
-1.443059, -0.5914453, -1.914215, 1, 0, 0, 1, 1,
-1.437453, 1.551139, -0.547374, 0, 0, 0, 1, 1,
-1.432708, 1.159026, -0.08696416, 0, 0, 0, 1, 1,
-1.42855, -0.6391467, -0.9577473, 0, 0, 0, 1, 1,
-1.404277, 2.357718, 0.4630847, 0, 0, 0, 1, 1,
-1.397433, -0.346715, -1.822131, 0, 0, 0, 1, 1,
-1.386353, -0.8177503, -2.707301, 0, 0, 0, 1, 1,
-1.384903, -0.2607658, -1.330771, 0, 0, 0, 1, 1,
-1.369352, -2.276281, -2.600423, 1, 1, 1, 1, 1,
-1.36819, 0.5465637, 0.08787365, 1, 1, 1, 1, 1,
-1.366637, -0.01448342, -2.824751, 1, 1, 1, 1, 1,
-1.358294, 0.1711901, -2.471262, 1, 1, 1, 1, 1,
-1.35538, -0.8544638, -2.887549, 1, 1, 1, 1, 1,
-1.351459, -0.4463, -2.300304, 1, 1, 1, 1, 1,
-1.344052, -0.4273543, 0.1540589, 1, 1, 1, 1, 1,
-1.340254, -0.8076813, -1.59802, 1, 1, 1, 1, 1,
-1.335493, 0.4465489, -1.217825, 1, 1, 1, 1, 1,
-1.332489, 0.1068849, -3.766713, 1, 1, 1, 1, 1,
-1.328204, 2.056903, -0.8059425, 1, 1, 1, 1, 1,
-1.322284, 1.138651, -1.065741, 1, 1, 1, 1, 1,
-1.316153, -0.8459449, -2.381649, 1, 1, 1, 1, 1,
-1.314254, -2.641927, -2.324376, 1, 1, 1, 1, 1,
-1.297343, 1.36417, -0.3511429, 1, 1, 1, 1, 1,
-1.286925, 0.3680468, -2.071108, 0, 0, 1, 1, 1,
-1.278148, -0.04925215, -1.964073, 1, 0, 0, 1, 1,
-1.276897, -0.5078806, -1.878573, 1, 0, 0, 1, 1,
-1.27414, 0.3638841, -3.418267, 1, 0, 0, 1, 1,
-1.266324, -0.04640383, -2.641088, 1, 0, 0, 1, 1,
-1.266248, 0.3793536, -1.68656, 1, 0, 0, 1, 1,
-1.26493, -0.7703362, -1.592836, 0, 0, 0, 1, 1,
-1.263159, 0.1744804, -0.4122227, 0, 0, 0, 1, 1,
-1.239745, 1.35794, -0.9596864, 0, 0, 0, 1, 1,
-1.214801, -0.594057, -2.313069, 0, 0, 0, 1, 1,
-1.207477, -0.3629681, -1.638429, 0, 0, 0, 1, 1,
-1.203898, -0.5420648, -2.40593, 0, 0, 0, 1, 1,
-1.196526, 0.171037, -0.925375, 0, 0, 0, 1, 1,
-1.190502, -0.0107633, -2.507533, 1, 1, 1, 1, 1,
-1.189025, 0.6098767, -1.538962, 1, 1, 1, 1, 1,
-1.181839, -0.6024287, -2.239129, 1, 1, 1, 1, 1,
-1.180234, -0.09064521, -0.8805905, 1, 1, 1, 1, 1,
-1.178771, -0.07748288, -3.842221, 1, 1, 1, 1, 1,
-1.17817, -0.4553396, -2.060275, 1, 1, 1, 1, 1,
-1.17311, -0.7851237, -3.234151, 1, 1, 1, 1, 1,
-1.172053, -0.5095133, -2.734021, 1, 1, 1, 1, 1,
-1.162728, -0.7960711, -0.9211083, 1, 1, 1, 1, 1,
-1.161065, -1.585545, -4.595167, 1, 1, 1, 1, 1,
-1.156839, 0.4188626, -0.1462535, 1, 1, 1, 1, 1,
-1.15638, 1.261645, -0.5271864, 1, 1, 1, 1, 1,
-1.153383, 0.1092959, -0.9018645, 1, 1, 1, 1, 1,
-1.15289, -1.321806, -2.250113, 1, 1, 1, 1, 1,
-1.143412, 0.03791398, 0.5234339, 1, 1, 1, 1, 1,
-1.134839, -0.8912709, -3.25022, 0, 0, 1, 1, 1,
-1.131741, 0.8097579, -0.8043033, 1, 0, 0, 1, 1,
-1.129761, 0.430459, -1.711592, 1, 0, 0, 1, 1,
-1.128794, 0.6701872, -0.01148552, 1, 0, 0, 1, 1,
-1.128112, 0.9987994, -1.42006, 1, 0, 0, 1, 1,
-1.125502, 0.2218194, -0.6564913, 1, 0, 0, 1, 1,
-1.120205, -0.3402849, -3.920417, 0, 0, 0, 1, 1,
-1.115826, -0.4416333, -0.5361396, 0, 0, 0, 1, 1,
-1.110845, 0.5357708, -0.02206065, 0, 0, 0, 1, 1,
-1.110341, -0.05682091, -2.987733, 0, 0, 0, 1, 1,
-1.10267, -0.9116942, -2.41639, 0, 0, 0, 1, 1,
-1.096666, -0.008666893, -1.677075, 0, 0, 0, 1, 1,
-1.094855, 0.9346296, -0.4044335, 0, 0, 0, 1, 1,
-1.08929, -1.367154, 0.3676501, 1, 1, 1, 1, 1,
-1.082695, -0.2692704, -3.029735, 1, 1, 1, 1, 1,
-1.081845, 0.2294998, -1.147361, 1, 1, 1, 1, 1,
-1.079134, 1.623578, 0.3039894, 1, 1, 1, 1, 1,
-1.076062, 0.8168436, -1.220649, 1, 1, 1, 1, 1,
-1.074823, -0.3012588, -1.926627, 1, 1, 1, 1, 1,
-1.074562, 0.5410988, -1.787457, 1, 1, 1, 1, 1,
-1.067758, -0.1538148, -2.435632, 1, 1, 1, 1, 1,
-1.066094, -0.3809719, -1.984075, 1, 1, 1, 1, 1,
-1.064978, 0.258257, -1.057373, 1, 1, 1, 1, 1,
-1.063867, 0.2151098, -1.842057, 1, 1, 1, 1, 1,
-1.044358, 0.1731919, -3.223246, 1, 1, 1, 1, 1,
-1.043534, -1.324779, -3.408895, 1, 1, 1, 1, 1,
-1.038582, -0.2715806, -2.231039, 1, 1, 1, 1, 1,
-1.035618, 1.317146, -1.694571, 1, 1, 1, 1, 1,
-1.03305, -0.7942379, -3.589175, 0, 0, 1, 1, 1,
-1.023127, -0.4895188, -0.5488238, 1, 0, 0, 1, 1,
-1.018267, -0.8068778, -1.310188, 1, 0, 0, 1, 1,
-1.004887, 1.08012, 0.4223489, 1, 0, 0, 1, 1,
-0.9995143, -1.679879, -3.761626, 1, 0, 0, 1, 1,
-0.9978685, -0.02143135, -1.531022, 1, 0, 0, 1, 1,
-0.9935395, -2.241833, -4.907184, 0, 0, 0, 1, 1,
-0.9909979, 0.7193164, 0.5797583, 0, 0, 0, 1, 1,
-0.9904687, 0.5228084, -0.06139301, 0, 0, 0, 1, 1,
-0.9885688, 0.7185129, 0.7050627, 0, 0, 0, 1, 1,
-0.9841484, -1.401826, -2.566192, 0, 0, 0, 1, 1,
-0.9814013, -1.249079, -2.158682, 0, 0, 0, 1, 1,
-0.9797175, -0.2220045, -2.748905, 0, 0, 0, 1, 1,
-0.9782828, -1.030117, -3.736743, 1, 1, 1, 1, 1,
-0.9760633, 0.1765136, -0.9515604, 1, 1, 1, 1, 1,
-0.9713571, 0.005941548, 0.1661989, 1, 1, 1, 1, 1,
-0.9710739, -1.591754, 0.258967, 1, 1, 1, 1, 1,
-0.9615252, -0.7934394, -2.035816, 1, 1, 1, 1, 1,
-0.951802, -0.5054889, -1.067176, 1, 1, 1, 1, 1,
-0.9396738, 2.026075, -0.6078548, 1, 1, 1, 1, 1,
-0.9279739, -0.1487742, -2.840353, 1, 1, 1, 1, 1,
-0.9261474, -2.438426, -1.911067, 1, 1, 1, 1, 1,
-0.9222078, -0.1225915, -1.241774, 1, 1, 1, 1, 1,
-0.9082473, -0.1417873, -2.69137, 1, 1, 1, 1, 1,
-0.9040762, -0.02766536, 0.6497908, 1, 1, 1, 1, 1,
-0.9012693, -0.3850262, -2.524309, 1, 1, 1, 1, 1,
-0.8989319, -1.546082, -2.461128, 1, 1, 1, 1, 1,
-0.8929425, -1.564731, -2.157002, 1, 1, 1, 1, 1,
-0.8925334, 1.14632, 0.2608424, 0, 0, 1, 1, 1,
-0.8916728, 1.572313, 0.1134644, 1, 0, 0, 1, 1,
-0.8888989, -0.5282004, -3.559816, 1, 0, 0, 1, 1,
-0.8879539, -0.1703524, -1.592336, 1, 0, 0, 1, 1,
-0.8850042, 2.205302, -0.9775924, 1, 0, 0, 1, 1,
-0.8837638, -0.869171, -2.809985, 1, 0, 0, 1, 1,
-0.8804714, -0.5378658, -3.047569, 0, 0, 0, 1, 1,
-0.8798094, -0.2069768, -1.153921, 0, 0, 0, 1, 1,
-0.8755676, -0.8258998, -3.167974, 0, 0, 0, 1, 1,
-0.8706819, -1.430946, -1.305243, 0, 0, 0, 1, 1,
-0.8628355, 0.8685862, -2.341443, 0, 0, 0, 1, 1,
-0.8522232, -0.4780362, -0.282861, 0, 0, 0, 1, 1,
-0.8495166, -0.2471161, -2.854894, 0, 0, 0, 1, 1,
-0.8438813, 1.914049, 0.2610582, 1, 1, 1, 1, 1,
-0.8386955, 0.6157231, 0.2565011, 1, 1, 1, 1, 1,
-0.8350353, -2.032432, -1.348316, 1, 1, 1, 1, 1,
-0.8308678, 1.320917, -0.2880158, 1, 1, 1, 1, 1,
-0.8285841, -0.1682437, -0.4702613, 1, 1, 1, 1, 1,
-0.8274596, -0.7434579, -4.376673, 1, 1, 1, 1, 1,
-0.8083742, 1.048662, 0.908203, 1, 1, 1, 1, 1,
-0.7799838, 1.028304, -0.6120127, 1, 1, 1, 1, 1,
-0.7785481, 1.840782, -1.583651, 1, 1, 1, 1, 1,
-0.7784634, -1.003307, -2.096693, 1, 1, 1, 1, 1,
-0.7666997, 1.448201, 0.3278721, 1, 1, 1, 1, 1,
-0.7652288, -1.395994, -4.091088, 1, 1, 1, 1, 1,
-0.7644609, -0.4729056, -2.952935, 1, 1, 1, 1, 1,
-0.7519099, 1.042973, 0.3864974, 1, 1, 1, 1, 1,
-0.7447623, 0.5033327, -1.797263, 1, 1, 1, 1, 1,
-0.7432821, -0.6537951, -0.5057146, 0, 0, 1, 1, 1,
-0.7370748, 2.391216, -0.569096, 1, 0, 0, 1, 1,
-0.7357532, -0.8991268, -1.338347, 1, 0, 0, 1, 1,
-0.7344216, -0.8027705, -3.170579, 1, 0, 0, 1, 1,
-0.7309445, -0.157347, -1.929323, 1, 0, 0, 1, 1,
-0.7304218, -1.073979, -3.967004, 1, 0, 0, 1, 1,
-0.7263634, -0.5723501, -2.625698, 0, 0, 0, 1, 1,
-0.7259181, 0.3139451, -0.7542853, 0, 0, 0, 1, 1,
-0.7254239, 0.88696, -3.406722, 0, 0, 0, 1, 1,
-0.7213959, -2.416591, -3.01662, 0, 0, 0, 1, 1,
-0.717986, -1.060943, -1.074533, 0, 0, 0, 1, 1,
-0.7153696, -0.001361386, -3.489107, 0, 0, 0, 1, 1,
-0.7138373, -0.6155287, -1.897239, 0, 0, 0, 1, 1,
-0.7121167, 0.9254989, -0.2890885, 1, 1, 1, 1, 1,
-0.7077424, 0.0268551, -1.447682, 1, 1, 1, 1, 1,
-0.7072872, 0.4406328, -1.774012, 1, 1, 1, 1, 1,
-0.7050844, -0.5436732, -2.276053, 1, 1, 1, 1, 1,
-0.7042819, -0.0466487, -0.8441167, 1, 1, 1, 1, 1,
-0.7040403, 1.333577, -1.85507, 1, 1, 1, 1, 1,
-0.700094, -0.4926256, -1.729848, 1, 1, 1, 1, 1,
-0.69713, -1.559973, -2.454468, 1, 1, 1, 1, 1,
-0.6953311, -0.7796735, -1.033555, 1, 1, 1, 1, 1,
-0.6938286, -1.211154, -1.720812, 1, 1, 1, 1, 1,
-0.6924968, -0.3690566, -3.484238, 1, 1, 1, 1, 1,
-0.6909096, -0.7007071, -0.2937333, 1, 1, 1, 1, 1,
-0.689245, -1.237493, -1.945109, 1, 1, 1, 1, 1,
-0.6887954, 0.2997735, -1.185928, 1, 1, 1, 1, 1,
-0.6874267, -0.3771751, -0.9576796, 1, 1, 1, 1, 1,
-0.6808386, 0.8122001, -0.9084271, 0, 0, 1, 1, 1,
-0.6686209, 1.6649, -1.559368, 1, 0, 0, 1, 1,
-0.6626157, -1.039003, -2.056864, 1, 0, 0, 1, 1,
-0.6615438, -1.969819, -1.660706, 1, 0, 0, 1, 1,
-0.6582404, 1.443572, -0.08303988, 1, 0, 0, 1, 1,
-0.6567205, -0.1034891, -1.026405, 1, 0, 0, 1, 1,
-0.6521649, 0.1503544, -0.3749687, 0, 0, 0, 1, 1,
-0.6472479, 0.5516565, -0.06983587, 0, 0, 0, 1, 1,
-0.6462696, -1.733071, -3.219972, 0, 0, 0, 1, 1,
-0.6448319, -0.3361807, -3.045545, 0, 0, 0, 1, 1,
-0.6425305, -0.6028569, -2.495758, 0, 0, 0, 1, 1,
-0.6397042, -1.945563, -1.727795, 0, 0, 0, 1, 1,
-0.637144, -0.7055421, -2.491079, 0, 0, 0, 1, 1,
-0.6361135, 1.006749, -2.278103, 1, 1, 1, 1, 1,
-0.632234, -1.070119, -4.365622, 1, 1, 1, 1, 1,
-0.6318882, -1.500489, -2.265561, 1, 1, 1, 1, 1,
-0.6316288, -2.165754, -2.871932, 1, 1, 1, 1, 1,
-0.6296346, 1.382256, -1.40153, 1, 1, 1, 1, 1,
-0.6281763, 1.32648, -0.3558331, 1, 1, 1, 1, 1,
-0.6246948, -0.1917931, -2.606479, 1, 1, 1, 1, 1,
-0.624148, -1.41986, -3.022769, 1, 1, 1, 1, 1,
-0.6233149, 1.288085, -1.932207, 1, 1, 1, 1, 1,
-0.6211758, 0.2725511, -0.6795132, 1, 1, 1, 1, 1,
-0.6198851, -0.6141689, -2.744609, 1, 1, 1, 1, 1,
-0.6158165, -1.535459, -1.382734, 1, 1, 1, 1, 1,
-0.6156289, 0.3425906, -0.8983682, 1, 1, 1, 1, 1,
-0.6153509, 1.083985, 0.2887213, 1, 1, 1, 1, 1,
-0.6142276, 1.91267, -0.07087784, 1, 1, 1, 1, 1,
-0.6131563, -1.020005, -1.764972, 0, 0, 1, 1, 1,
-0.6120068, -2.057842, -4.101193, 1, 0, 0, 1, 1,
-0.61097, 1.498439, -2.358541, 1, 0, 0, 1, 1,
-0.6100586, 0.5190616, -1.311208, 1, 0, 0, 1, 1,
-0.6029347, 0.5653949, -1.758459, 1, 0, 0, 1, 1,
-0.5978687, -0.5947168, -2.182196, 1, 0, 0, 1, 1,
-0.5969095, 0.2373332, -1.670312, 0, 0, 0, 1, 1,
-0.5954843, -0.08992927, -2.047837, 0, 0, 0, 1, 1,
-0.5953877, 2.237365, -0.6689801, 0, 0, 0, 1, 1,
-0.5945566, -0.6577529, -1.084565, 0, 0, 0, 1, 1,
-0.5895123, 0.3856834, -0.2428929, 0, 0, 0, 1, 1,
-0.5855923, -0.3370517, -1.917307, 0, 0, 0, 1, 1,
-0.5834075, 2.307943, 0.04111274, 0, 0, 0, 1, 1,
-0.5834069, 0.8549399, 0.7023646, 1, 1, 1, 1, 1,
-0.5832903, -0.7720946, -3.126755, 1, 1, 1, 1, 1,
-0.5792122, -0.3949411, -2.817612, 1, 1, 1, 1, 1,
-0.5776055, 1.269897, -0.3334998, 1, 1, 1, 1, 1,
-0.5762073, -0.3553551, -2.540639, 1, 1, 1, 1, 1,
-0.5723796, -1.291723, -3.76958, 1, 1, 1, 1, 1,
-0.571707, 1.255509, 0.5271043, 1, 1, 1, 1, 1,
-0.5690923, 1.356594, -0.6250297, 1, 1, 1, 1, 1,
-0.5641023, -1.541092, -3.54248, 1, 1, 1, 1, 1,
-0.5636242, 0.8021466, -2.741606, 1, 1, 1, 1, 1,
-0.5468881, 1.528572, -0.1710852, 1, 1, 1, 1, 1,
-0.5461947, 0.06309266, -1.124762, 1, 1, 1, 1, 1,
-0.5451158, 1.247195, -1.47717, 1, 1, 1, 1, 1,
-0.5407169, -3.591255, -3.090399, 1, 1, 1, 1, 1,
-0.5343201, -1.558746, -2.218631, 1, 1, 1, 1, 1,
-0.5330963, 0.8943148, -1.804335, 0, 0, 1, 1, 1,
-0.5328999, 0.9864765, -0.08304916, 1, 0, 0, 1, 1,
-0.5324407, 0.04533551, -2.000684, 1, 0, 0, 1, 1,
-0.5300471, 0.1874277, -2.463133, 1, 0, 0, 1, 1,
-0.5262408, -0.02544334, -1.721323, 1, 0, 0, 1, 1,
-0.5237582, -0.6521311, -4.341505, 1, 0, 0, 1, 1,
-0.5232642, 0.6268569, -0.9433602, 0, 0, 0, 1, 1,
-0.5220248, 0.7312962, -2.098282, 0, 0, 0, 1, 1,
-0.517316, -0.6285693, -2.378196, 0, 0, 0, 1, 1,
-0.5160435, -0.7573413, -3.059405, 0, 0, 0, 1, 1,
-0.5141451, 0.4484373, -2.406187, 0, 0, 0, 1, 1,
-0.5115677, 1.631227, 0.4069896, 0, 0, 0, 1, 1,
-0.5076623, -0.3652935, -2.079497, 0, 0, 0, 1, 1,
-0.5045254, 0.7100031, 0.6212232, 1, 1, 1, 1, 1,
-0.503406, -0.4367889, -3.135274, 1, 1, 1, 1, 1,
-0.5032308, -0.2072245, -1.132858, 1, 1, 1, 1, 1,
-0.4979222, 0.8003278, 1.009257, 1, 1, 1, 1, 1,
-0.4940597, -1.172148, -1.77153, 1, 1, 1, 1, 1,
-0.4922695, 2.093603, -1.438404, 1, 1, 1, 1, 1,
-0.4908432, -0.2155801, -2.130566, 1, 1, 1, 1, 1,
-0.490184, 0.1276025, 0.3166645, 1, 1, 1, 1, 1,
-0.4867286, 1.049737, -0.8893734, 1, 1, 1, 1, 1,
-0.4858054, 0.6189528, -0.02319366, 1, 1, 1, 1, 1,
-0.4812769, -1.421029, -3.864933, 1, 1, 1, 1, 1,
-0.4793624, 0.5296755, -1.457557, 1, 1, 1, 1, 1,
-0.4761741, 0.1379641, -0.927607, 1, 1, 1, 1, 1,
-0.4757643, 0.7677612, -1.035534, 1, 1, 1, 1, 1,
-0.474947, 0.1851556, -0.8908544, 1, 1, 1, 1, 1,
-0.4725751, 0.9179327, 0.6082475, 0, 0, 1, 1, 1,
-0.4685251, 0.7996666, -1.066796, 1, 0, 0, 1, 1,
-0.4676593, 2.009409, -0.01257966, 1, 0, 0, 1, 1,
-0.4644652, -0.726672, -2.218874, 1, 0, 0, 1, 1,
-0.4624555, -0.5463498, -2.390929, 1, 0, 0, 1, 1,
-0.4544914, -0.933322, -2.063872, 1, 0, 0, 1, 1,
-0.4543619, -0.5122605, -2.666456, 0, 0, 0, 1, 1,
-0.4532219, 0.9197659, 0.1414764, 0, 0, 0, 1, 1,
-0.4499431, 0.7079144, 0.2363853, 0, 0, 0, 1, 1,
-0.4395435, -0.4134766, -2.637229, 0, 0, 0, 1, 1,
-0.4392065, 0.6428992, 0.118287, 0, 0, 0, 1, 1,
-0.4330192, -0.3411506, -2.403855, 0, 0, 0, 1, 1,
-0.4317881, -0.6585909, -2.891083, 0, 0, 0, 1, 1,
-0.4302971, 0.39783, -0.7996076, 1, 1, 1, 1, 1,
-0.4245172, -0.4001205, -3.73205, 1, 1, 1, 1, 1,
-0.4150276, 0.6730509, -0.7029053, 1, 1, 1, 1, 1,
-0.4136611, -0.1916559, -2.892491, 1, 1, 1, 1, 1,
-0.4097153, 0.4601098, 1.223442, 1, 1, 1, 1, 1,
-0.4049473, -1.353148, -1.334652, 1, 1, 1, 1, 1,
-0.4041114, 0.9235007, -0.5056563, 1, 1, 1, 1, 1,
-0.3977619, -0.5007285, -0.9918606, 1, 1, 1, 1, 1,
-0.3975729, 0.8463703, -1.287091, 1, 1, 1, 1, 1,
-0.3965388, 1.348864, 0.2048471, 1, 1, 1, 1, 1,
-0.3931424, -0.05143048, -1.964802, 1, 1, 1, 1, 1,
-0.3867687, 0.04969265, -1.663583, 1, 1, 1, 1, 1,
-0.3828826, 0.7991367, 1.29329, 1, 1, 1, 1, 1,
-0.3806816, 1.481087, -1.000943, 1, 1, 1, 1, 1,
-0.3757848, 1.23638, 0.4176981, 1, 1, 1, 1, 1,
-0.3703114, 0.6400009, -0.9804386, 0, 0, 1, 1, 1,
-0.3696866, 1.155961, 1.350293, 1, 0, 0, 1, 1,
-0.3589773, -0.4396344, -4.072635, 1, 0, 0, 1, 1,
-0.3475772, 0.240806, 0.2853681, 1, 0, 0, 1, 1,
-0.3446761, -0.1553481, -1.972784, 1, 0, 0, 1, 1,
-0.3436515, -1.169449, -3.136756, 1, 0, 0, 1, 1,
-0.3433312, -0.4504459, -2.342752, 0, 0, 0, 1, 1,
-0.3423056, 0.7873085, -0.877472, 0, 0, 0, 1, 1,
-0.3417401, -0.5885335, -2.068133, 0, 0, 0, 1, 1,
-0.3388792, -0.6825677, -2.42064, 0, 0, 0, 1, 1,
-0.3374903, 0.5264825, -0.5528201, 0, 0, 0, 1, 1,
-0.3337038, 1.253792, 0.4926677, 0, 0, 0, 1, 1,
-0.3315564, -0.3318218, -2.449056, 0, 0, 0, 1, 1,
-0.3270133, -0.09166673, -1.38718, 1, 1, 1, 1, 1,
-0.3247607, -0.3281602, -4.1533, 1, 1, 1, 1, 1,
-0.3232243, 0.5617905, -1.472674, 1, 1, 1, 1, 1,
-0.3190526, -0.4100082, -3.579877, 1, 1, 1, 1, 1,
-0.3177126, 0.8598444, -0.9343646, 1, 1, 1, 1, 1,
-0.317672, -0.2348028, -2.776169, 1, 1, 1, 1, 1,
-0.3166367, 0.8122285, -0.3341442, 1, 1, 1, 1, 1,
-0.3154255, 1.467221, 0.1916332, 1, 1, 1, 1, 1,
-0.3146728, -0.6514403, -3.803516, 1, 1, 1, 1, 1,
-0.314295, -0.4094689, -3.197141, 1, 1, 1, 1, 1,
-0.3065414, 0.05893787, -1.563052, 1, 1, 1, 1, 1,
-0.3054493, 1.142703, -1.020467, 1, 1, 1, 1, 1,
-0.3023715, -0.06041814, -0.733373, 1, 1, 1, 1, 1,
-0.3020017, 0.4295718, -1.505617, 1, 1, 1, 1, 1,
-0.3016677, 0.3330111, -1.574818, 1, 1, 1, 1, 1,
-0.3013178, 0.9725074, -0.9835575, 0, 0, 1, 1, 1,
-0.3008558, -1.28382, -2.746196, 1, 0, 0, 1, 1,
-0.3008061, 0.2186797, -0.3697176, 1, 0, 0, 1, 1,
-0.3003902, -1.290961, -3.521754, 1, 0, 0, 1, 1,
-0.2999445, 0.7382887, -1.071665, 1, 0, 0, 1, 1,
-0.2952918, 0.3884252, -1.969644, 1, 0, 0, 1, 1,
-0.291869, -1.219658, -3.417817, 0, 0, 0, 1, 1,
-0.2915035, -1.21964, -3.741489, 0, 0, 0, 1, 1,
-0.2883509, -0.3482407, -1.116033, 0, 0, 0, 1, 1,
-0.2881592, -0.7917969, -3.779518, 0, 0, 0, 1, 1,
-0.2847397, -0.02820627, -2.064495, 0, 0, 0, 1, 1,
-0.2813392, -0.1777212, -1.261126, 0, 0, 0, 1, 1,
-0.2812837, -1.822784, -4.509806, 0, 0, 0, 1, 1,
-0.2693093, 0.03547352, -0.574101, 1, 1, 1, 1, 1,
-0.2667605, -1.121635, -1.89011, 1, 1, 1, 1, 1,
-0.2667299, -0.8783801, -1.258883, 1, 1, 1, 1, 1,
-0.2665768, -1.566171, -1.163293, 1, 1, 1, 1, 1,
-0.265977, 0.8120405, -0.5978483, 1, 1, 1, 1, 1,
-0.2644936, -0.08316005, -0.8054732, 1, 1, 1, 1, 1,
-0.2620927, 0.4034722, -2.286141, 1, 1, 1, 1, 1,
-0.2562745, 0.5477602, -0.9885772, 1, 1, 1, 1, 1,
-0.2528514, -0.9502162, -3.410043, 1, 1, 1, 1, 1,
-0.2523816, -0.7615283, -3.387559, 1, 1, 1, 1, 1,
-0.2521051, 0.2143863, 0.2981378, 1, 1, 1, 1, 1,
-0.2500194, 0.5852472, -0.3727032, 1, 1, 1, 1, 1,
-0.2475247, 0.6624107, -1.027851, 1, 1, 1, 1, 1,
-0.2462431, -0.9854018, -1.286668, 1, 1, 1, 1, 1,
-0.2460966, -0.4473422, -0.929958, 1, 1, 1, 1, 1,
-0.2448364, -1.940178, -3.443569, 0, 0, 1, 1, 1,
-0.2434246, -1.043448, -3.153105, 1, 0, 0, 1, 1,
-0.2429249, 0.9964656, -1.666195, 1, 0, 0, 1, 1,
-0.2387474, -0.2565989, -0.0009747043, 1, 0, 0, 1, 1,
-0.2367568, -1.629086, -2.914828, 1, 0, 0, 1, 1,
-0.2360376, -0.3406042, -4.783529, 1, 0, 0, 1, 1,
-0.2304894, 0.6242587, 0.5217365, 0, 0, 0, 1, 1,
-0.2268699, -1.158235, -1.620654, 0, 0, 0, 1, 1,
-0.2243037, -0.09985404, -2.480817, 0, 0, 0, 1, 1,
-0.2216273, -1.524134, -2.352194, 0, 0, 0, 1, 1,
-0.2185291, -0.4139738, -1.55459, 0, 0, 0, 1, 1,
-0.2181237, 1.033742, -0.08512345, 0, 0, 0, 1, 1,
-0.2152359, 1.38737, -0.3697633, 0, 0, 0, 1, 1,
-0.213797, -0.6644493, -4.038268, 1, 1, 1, 1, 1,
-0.210213, -0.7694991, -1.11296, 1, 1, 1, 1, 1,
-0.2084848, 0.6587387, -1.427008, 1, 1, 1, 1, 1,
-0.2025522, -0.007763783, -0.4908889, 1, 1, 1, 1, 1,
-0.2015416, 0.7978334, -0.7995059, 1, 1, 1, 1, 1,
-0.1980191, -0.8413787, -2.958887, 1, 1, 1, 1, 1,
-0.1894824, -0.442295, -3.250755, 1, 1, 1, 1, 1,
-0.1878606, 2.467051, 1.65989, 1, 1, 1, 1, 1,
-0.1857018, -0.1480011, -2.741387, 1, 1, 1, 1, 1,
-0.1846807, 1.617845, -1.484996, 1, 1, 1, 1, 1,
-0.1841941, -1.237236, -1.461483, 1, 1, 1, 1, 1,
-0.1836471, 0.8703343, -0.7954753, 1, 1, 1, 1, 1,
-0.181468, 0.8904558, -1.354313, 1, 1, 1, 1, 1,
-0.1794352, 1.758498, 0.2439816, 1, 1, 1, 1, 1,
-0.1749863, 1.653597, -1.034169, 1, 1, 1, 1, 1,
-0.1732923, 0.6086354, -0.9837475, 0, 0, 1, 1, 1,
-0.1689966, 0.08262312, -3.337641, 1, 0, 0, 1, 1,
-0.1635316, -0.1970386, -1.421863, 1, 0, 0, 1, 1,
-0.1597844, -0.6599333, -2.480983, 1, 0, 0, 1, 1,
-0.15927, 0.5113399, -1.795602, 1, 0, 0, 1, 1,
-0.1556641, 0.05641583, -0.619096, 1, 0, 0, 1, 1,
-0.1513347, -0.6153362, -1.269227, 0, 0, 0, 1, 1,
-0.1464227, -1.718608, -3.324055, 0, 0, 0, 1, 1,
-0.1450949, -1.535223, -2.27811, 0, 0, 0, 1, 1,
-0.1405529, 1.112798, -1.113807, 0, 0, 0, 1, 1,
-0.1399619, -0.5571277, -4.149511, 0, 0, 0, 1, 1,
-0.1384366, -0.4039036, -2.444269, 0, 0, 0, 1, 1,
-0.1379612, -1.03031, -2.873454, 0, 0, 0, 1, 1,
-0.1352248, 0.5456749, -0.4703868, 1, 1, 1, 1, 1,
-0.1351611, -0.3010161, -2.486811, 1, 1, 1, 1, 1,
-0.1343285, 0.4223342, -1.947921, 1, 1, 1, 1, 1,
-0.1325499, 0.1030803, -2.995025, 1, 1, 1, 1, 1,
-0.1316706, 0.667608, 0.7551607, 1, 1, 1, 1, 1,
-0.1292698, 0.5069432, -0.6962193, 1, 1, 1, 1, 1,
-0.1291823, -1.030164, -2.311453, 1, 1, 1, 1, 1,
-0.1255222, -0.2683145, -3.437211, 1, 1, 1, 1, 1,
-0.1253336, 0.2831976, 1.000192, 1, 1, 1, 1, 1,
-0.1224408, -0.8363192, -3.225436, 1, 1, 1, 1, 1,
-0.12149, -2.048584, -3.193696, 1, 1, 1, 1, 1,
-0.1201003, -0.8298634, -2.206536, 1, 1, 1, 1, 1,
-0.12006, 1.266486, -0.04267462, 1, 1, 1, 1, 1,
-0.119381, 1.53939, 1.446366, 1, 1, 1, 1, 1,
-0.1181507, 0.1160723, -0.676608, 1, 1, 1, 1, 1,
-0.1133677, 0.3662755, 0.3314249, 0, 0, 1, 1, 1,
-0.1084279, -1.193944, -3.303483, 1, 0, 0, 1, 1,
-0.107288, 1.107374, -2.573686, 1, 0, 0, 1, 1,
-0.1069438, -1.154967, -2.313373, 1, 0, 0, 1, 1,
-0.1061791, 0.08669538, -1.544378, 1, 0, 0, 1, 1,
-0.1037955, 1.320619, -1.746292, 1, 0, 0, 1, 1,
-0.1032619, -1.379506, -2.310164, 0, 0, 0, 1, 1,
-0.1011749, 0.4498954, 0.6228679, 0, 0, 0, 1, 1,
-0.100614, -0.06312281, -2.157771, 0, 0, 0, 1, 1,
-0.09070565, -1.375751, -4.24417, 0, 0, 0, 1, 1,
-0.08878519, 0.9827665, 0.134046, 0, 0, 0, 1, 1,
-0.08704678, 1.062327, -0.5840498, 0, 0, 0, 1, 1,
-0.08513326, -0.8465056, -3.530356, 0, 0, 0, 1, 1,
-0.07863303, 0.9499078, 0.04113926, 1, 1, 1, 1, 1,
-0.07220089, 0.2552544, 1.021935, 1, 1, 1, 1, 1,
-0.06986663, -0.06050819, -1.869229, 1, 1, 1, 1, 1,
-0.06663623, 0.8900031, 0.5196191, 1, 1, 1, 1, 1,
-0.06646765, -1.261613, -2.272308, 1, 1, 1, 1, 1,
-0.06620924, -1.016039, -2.421744, 1, 1, 1, 1, 1,
-0.06491867, 1.332526, 0.8559853, 1, 1, 1, 1, 1,
-0.06322851, 1.977648, 0.5813141, 1, 1, 1, 1, 1,
-0.06293086, 1.622757, -1.50383, 1, 1, 1, 1, 1,
-0.05327171, 0.2680863, 2.14407, 1, 1, 1, 1, 1,
-0.04740108, 0.04907511, -0.3728724, 1, 1, 1, 1, 1,
-0.04441445, 0.2434417, -0.02279349, 1, 1, 1, 1, 1,
-0.04070808, 1.579541, 0.5524354, 1, 1, 1, 1, 1,
-0.04030793, -0.313699, -2.444187, 1, 1, 1, 1, 1,
-0.0373578, 0.09912077, 0.1211418, 1, 1, 1, 1, 1,
-0.03381637, -0.2246359, -3.510048, 0, 0, 1, 1, 1,
-0.03340212, 0.1304636, -0.419382, 1, 0, 0, 1, 1,
-0.03082905, -0.3010529, -3.499731, 1, 0, 0, 1, 1,
-0.03065009, -1.252124, -1.901909, 1, 0, 0, 1, 1,
-0.03031984, 0.06885235, 2.031749, 1, 0, 0, 1, 1,
-0.02262158, 0.007121837, -2.134866, 1, 0, 0, 1, 1,
-0.02118113, -0.3642064, -2.836715, 0, 0, 0, 1, 1,
-0.01937913, 0.8716957, -1.342338, 0, 0, 0, 1, 1,
-0.0185936, -0.6543425, -3.151201, 0, 0, 0, 1, 1,
-0.01717383, 0.899283, 0.4640368, 0, 0, 0, 1, 1,
-0.01372746, 0.8870425, 0.03156055, 0, 0, 0, 1, 1,
-0.01232948, 0.4313381, -2.799505, 0, 0, 0, 1, 1,
-0.0120129, -0.4735532, -2.867987, 0, 0, 0, 1, 1,
-0.01037177, -0.4091468, -3.032006, 1, 1, 1, 1, 1,
-0.01025565, -0.01940657, -2.492445, 1, 1, 1, 1, 1,
-0.007305574, 1.898552, 1.626894, 1, 1, 1, 1, 1,
-0.00707744, 1.44947, 0.290731, 1, 1, 1, 1, 1,
-0.005551191, 2.723331, -0.33175, 1, 1, 1, 1, 1,
-0.001764675, 1.521526, 0.148364, 1, 1, 1, 1, 1,
-0.001073287, 0.1210341, -0.01151218, 1, 1, 1, 1, 1,
0.0008911276, 1.152666, -0.0268381, 1, 1, 1, 1, 1,
0.00793392, -1.806504, 3.059899, 1, 1, 1, 1, 1,
0.01345602, 0.03659617, 0.7863814, 1, 1, 1, 1, 1,
0.01473962, -0.2006134, 2.786588, 1, 1, 1, 1, 1,
0.01571376, -1.04406, 4.810048, 1, 1, 1, 1, 1,
0.01580536, 1.056355, 1.846912, 1, 1, 1, 1, 1,
0.0161648, 0.03957574, 0.7647545, 1, 1, 1, 1, 1,
0.01835577, 0.06279153, 1.70305, 1, 1, 1, 1, 1,
0.02267942, 0.1475922, 0.6929668, 0, 0, 1, 1, 1,
0.02404084, -0.7089234, 2.048945, 1, 0, 0, 1, 1,
0.02442749, -0.3043282, 3.340081, 1, 0, 0, 1, 1,
0.02523534, 0.2213643, -0.7585256, 1, 0, 0, 1, 1,
0.02591781, 0.7074948, 1.567237, 1, 0, 0, 1, 1,
0.03028913, -0.7411335, 1.686825, 1, 0, 0, 1, 1,
0.03207965, -0.2715463, 3.903494, 0, 0, 0, 1, 1,
0.03239112, -0.94735, 1.054624, 0, 0, 0, 1, 1,
0.03534939, -0.1990856, 4.636361, 0, 0, 0, 1, 1,
0.03716113, -0.0001674492, 1.003307, 0, 0, 0, 1, 1,
0.03804815, -0.9479504, 2.428328, 0, 0, 0, 1, 1,
0.04952834, -0.8604363, 4.262066, 0, 0, 0, 1, 1,
0.05314444, 1.144597, -0.03296939, 0, 0, 0, 1, 1,
0.05783961, 0.1443705, 1.377426, 1, 1, 1, 1, 1,
0.05799667, -0.4671491, 4.647122, 1, 1, 1, 1, 1,
0.06603175, -0.005689301, 3.175991, 1, 1, 1, 1, 1,
0.07040282, -2.815296, 3.910806, 1, 1, 1, 1, 1,
0.07075226, -1.462119, 1.692278, 1, 1, 1, 1, 1,
0.07147446, 0.5584093, -2.028017, 1, 1, 1, 1, 1,
0.07163185, -2.129894, 1.754655, 1, 1, 1, 1, 1,
0.07491819, 0.08137809, 1.630566, 1, 1, 1, 1, 1,
0.07523808, -1.684859, 1.589575, 1, 1, 1, 1, 1,
0.07681398, 0.4280206, 0.04513319, 1, 1, 1, 1, 1,
0.07795858, -0.04449768, 3.487017, 1, 1, 1, 1, 1,
0.07843843, -0.013329, 0.6741013, 1, 1, 1, 1, 1,
0.07858635, 0.3289778, -0.7153683, 1, 1, 1, 1, 1,
0.07895385, 1.091093, -1.440828, 1, 1, 1, 1, 1,
0.07994, -0.9335263, 4.377857, 1, 1, 1, 1, 1,
0.08428065, -1.240295, 2.868323, 0, 0, 1, 1, 1,
0.08613992, -1.067027, 3.951773, 1, 0, 0, 1, 1,
0.08904752, 0.3096629, 0.2815524, 1, 0, 0, 1, 1,
0.08944669, -0.4382146, 2.114621, 1, 0, 0, 1, 1,
0.08965281, -0.8716051, 2.264155, 1, 0, 0, 1, 1,
0.1022519, -0.6217692, 3.058178, 1, 0, 0, 1, 1,
0.1043571, 0.3450471, -2.4623, 0, 0, 0, 1, 1,
0.1056147, -2.133526, 4.071338, 0, 0, 0, 1, 1,
0.1076458, 1.141611, 0.8603397, 0, 0, 0, 1, 1,
0.1081737, -0.121356, 4.0169, 0, 0, 0, 1, 1,
0.1085386, 0.2171129, 0.2131978, 0, 0, 0, 1, 1,
0.1120638, 0.4896535, -0.3565756, 0, 0, 0, 1, 1,
0.1153529, -1.247261, 4.078679, 0, 0, 0, 1, 1,
0.115715, 1.349544, 0.04894749, 1, 1, 1, 1, 1,
0.1163346, 0.8853237, -0.06258871, 1, 1, 1, 1, 1,
0.1172601, 0.05640538, -0.3211868, 1, 1, 1, 1, 1,
0.1186773, -0.723282, 3.470025, 1, 1, 1, 1, 1,
0.1188128, 0.7165562, 1.215757, 1, 1, 1, 1, 1,
0.1188227, -1.631654, 2.050925, 1, 1, 1, 1, 1,
0.1209565, -0.9647028, 3.903744, 1, 1, 1, 1, 1,
0.1228892, 0.04031068, 1.002711, 1, 1, 1, 1, 1,
0.1243593, 1.52837, -0.1941228, 1, 1, 1, 1, 1,
0.1254174, -0.6181837, 4.528304, 1, 1, 1, 1, 1,
0.1318815, 0.4425825, 0.06285764, 1, 1, 1, 1, 1,
0.1334596, 1.755713, 1.070579, 1, 1, 1, 1, 1,
0.1364184, 0.02340081, 1.594587, 1, 1, 1, 1, 1,
0.1398066, -0.3412084, 1.518403, 1, 1, 1, 1, 1,
0.1422221, -0.9040583, 2.115911, 1, 1, 1, 1, 1,
0.1438373, -0.4171227, 3.419122, 0, 0, 1, 1, 1,
0.1443522, 0.8686391, 0.5714667, 1, 0, 0, 1, 1,
0.1494152, -0.2447038, 2.830571, 1, 0, 0, 1, 1,
0.1510478, 0.4067589, 0.4246863, 1, 0, 0, 1, 1,
0.1537944, 0.2103193, 0.8937694, 1, 0, 0, 1, 1,
0.1551361, 0.9119096, 0.03658169, 1, 0, 0, 1, 1,
0.1574447, -1.343855, 4.583907, 0, 0, 0, 1, 1,
0.159888, -2.206475, 3.866396, 0, 0, 0, 1, 1,
0.1619947, -1.246172, 0.3909748, 0, 0, 0, 1, 1,
0.1669724, -0.2229763, 2.323905, 0, 0, 0, 1, 1,
0.1684861, 1.696483, 1.009002, 0, 0, 0, 1, 1,
0.1711332, -1.199269, 2.22743, 0, 0, 0, 1, 1,
0.1739523, -0.8280608, 5.175838, 0, 0, 0, 1, 1,
0.1745947, 0.05385881, 2.519037, 1, 1, 1, 1, 1,
0.1761076, -0.747945, 3.372483, 1, 1, 1, 1, 1,
0.1769135, 1.246483, 0.3788601, 1, 1, 1, 1, 1,
0.1770871, 0.6301662, -0.400614, 1, 1, 1, 1, 1,
0.1801015, 0.6049818, -0.9141576, 1, 1, 1, 1, 1,
0.181093, -0.6879021, 3.445974, 1, 1, 1, 1, 1,
0.1817679, 0.3832786, -0.126036, 1, 1, 1, 1, 1,
0.1846662, 0.8484281, 2.022864, 1, 1, 1, 1, 1,
0.1888959, 1.154273, 0.3408765, 1, 1, 1, 1, 1,
0.1916684, -0.3231144, 1.811414, 1, 1, 1, 1, 1,
0.1956179, -1.35503, 2.221319, 1, 1, 1, 1, 1,
0.198132, 0.6182821, 0.4460374, 1, 1, 1, 1, 1,
0.1995385, 1.171425, 0.1770492, 1, 1, 1, 1, 1,
0.202824, 0.6792293, 0.3951493, 1, 1, 1, 1, 1,
0.2066677, -1.640619, 3.809418, 1, 1, 1, 1, 1,
0.2068882, 0.1457459, 0.9413749, 0, 0, 1, 1, 1,
0.207316, 0.2184452, 1.077186, 1, 0, 0, 1, 1,
0.2117919, 0.2099732, 0.6895925, 1, 0, 0, 1, 1,
0.2150665, -0.6382946, 3.661423, 1, 0, 0, 1, 1,
0.2176233, 0.7830726, 1.323122, 1, 0, 0, 1, 1,
0.217806, -1.662346, 0.9918187, 1, 0, 0, 1, 1,
0.2185366, -0.8336447, 3.003213, 0, 0, 0, 1, 1,
0.22018, 0.3851454, -0.390651, 0, 0, 0, 1, 1,
0.2216946, -1.562723, 2.115346, 0, 0, 0, 1, 1,
0.227604, -0.7098218, 3.402782, 0, 0, 0, 1, 1,
0.2301521, -1.505423, 3.628219, 0, 0, 0, 1, 1,
0.2307149, -1.391032, 2.630043, 0, 0, 0, 1, 1,
0.2354156, -0.6835645, 1.851019, 0, 0, 0, 1, 1,
0.2393298, 0.4103288, 1.717097, 1, 1, 1, 1, 1,
0.2432674, -0.05534863, 0.2321681, 1, 1, 1, 1, 1,
0.2455714, -0.3213711, 1.534202, 1, 1, 1, 1, 1,
0.24611, -0.7218829, 3.463734, 1, 1, 1, 1, 1,
0.2464085, 1.677158, 0.273555, 1, 1, 1, 1, 1,
0.2477668, -0.1033876, 1.757229, 1, 1, 1, 1, 1,
0.2491453, -0.972449, 2.261185, 1, 1, 1, 1, 1,
0.2505679, -1.627533, 3.623775, 1, 1, 1, 1, 1,
0.2508628, 1.285531, -0.02841602, 1, 1, 1, 1, 1,
0.2513269, -2.269739, 2.101834, 1, 1, 1, 1, 1,
0.251382, -1.840433, 3.398099, 1, 1, 1, 1, 1,
0.2533476, -0.4978406, 4.732594, 1, 1, 1, 1, 1,
0.2533906, -0.2569343, 0.3075842, 1, 1, 1, 1, 1,
0.2795629, 1.690757, -3.155354, 1, 1, 1, 1, 1,
0.2808078, 1.586047, -0.6521509, 1, 1, 1, 1, 1,
0.2840914, -1.484722, 3.775308, 0, 0, 1, 1, 1,
0.28638, 1.255196, -0.4066653, 1, 0, 0, 1, 1,
0.2889571, 0.9923312, 1.125587, 1, 0, 0, 1, 1,
0.2909127, -1.227556, 2.745892, 1, 0, 0, 1, 1,
0.2916854, 0.50495, 0.450799, 1, 0, 0, 1, 1,
0.2917104, 1.488488, 0.1647216, 1, 0, 0, 1, 1,
0.2956987, 0.472296, 0.184666, 0, 0, 0, 1, 1,
0.2961039, -0.04392571, 2.347907, 0, 0, 0, 1, 1,
0.297528, 0.2108637, 0.2580778, 0, 0, 0, 1, 1,
0.2975601, 0.08277725, 0.9631392, 0, 0, 0, 1, 1,
0.3008083, 0.7522801, -0.08839373, 0, 0, 0, 1, 1,
0.3037295, -1.493174, 1.858344, 0, 0, 0, 1, 1,
0.3075647, -0.04393541, 1.132198, 0, 0, 0, 1, 1,
0.3079817, -1.112367, 2.776893, 1, 1, 1, 1, 1,
0.3090378, 2.267307, 1.565874, 1, 1, 1, 1, 1,
0.3136235, -0.9127047, 1.891374, 1, 1, 1, 1, 1,
0.3190773, 0.7483721, -0.5751846, 1, 1, 1, 1, 1,
0.3235129, 1.086233, 0.3269894, 1, 1, 1, 1, 1,
0.3297484, -1.769254, 1.97416, 1, 1, 1, 1, 1,
0.3314758, -0.2835258, 3.844774, 1, 1, 1, 1, 1,
0.3325477, -1.120625, 2.202911, 1, 1, 1, 1, 1,
0.334128, -1.004189, 3.199676, 1, 1, 1, 1, 1,
0.3349802, 0.4163274, 1.514758, 1, 1, 1, 1, 1,
0.3377132, 0.7695069, 0.687265, 1, 1, 1, 1, 1,
0.338946, -0.2376086, 2.7212, 1, 1, 1, 1, 1,
0.3438652, 0.1172267, 2.839764, 1, 1, 1, 1, 1,
0.3454833, -1.41298, 3.426702, 1, 1, 1, 1, 1,
0.3461709, 0.4637232, 0.518429, 1, 1, 1, 1, 1,
0.3467707, -0.09308662, 1.411886, 0, 0, 1, 1, 1,
0.3474948, -1.30596, 2.771514, 1, 0, 0, 1, 1,
0.3501735, -1.165479, 1.97169, 1, 0, 0, 1, 1,
0.3514909, 1.195318, -0.06329957, 1, 0, 0, 1, 1,
0.3520027, 1.681651, -0.7544529, 1, 0, 0, 1, 1,
0.3532412, 0.8843004, 0.9426218, 1, 0, 0, 1, 1,
0.3536555, 0.03849696, 2.719252, 0, 0, 0, 1, 1,
0.356695, -1.491043, 3.345105, 0, 0, 0, 1, 1,
0.3618527, 0.3840835, -1.097257, 0, 0, 0, 1, 1,
0.362092, -1.355765, 2.984237, 0, 0, 0, 1, 1,
0.363879, 0.2761837, 1.398443, 0, 0, 0, 1, 1,
0.3645395, 0.6435179, -0.3972774, 0, 0, 0, 1, 1,
0.3672714, -0.757838, 2.062543, 0, 0, 0, 1, 1,
0.3692832, 1.751158, 0.1861085, 1, 1, 1, 1, 1,
0.3720126, -0.03638894, 1.168278, 1, 1, 1, 1, 1,
0.3721377, 0.3778133, 0.283476, 1, 1, 1, 1, 1,
0.372636, 0.3768335, 0.3681847, 1, 1, 1, 1, 1,
0.3776824, -0.7369962, 2.3369, 1, 1, 1, 1, 1,
0.3800232, 1.550397, 1.119673, 1, 1, 1, 1, 1,
0.384991, -0.8426202, 1.370618, 1, 1, 1, 1, 1,
0.3868973, -0.6859449, 0.8501579, 1, 1, 1, 1, 1,
0.3925393, 0.1393941, 0.7890539, 1, 1, 1, 1, 1,
0.4020039, 0.4635912, 0.7096427, 1, 1, 1, 1, 1,
0.4022816, 1.120091, 0.1195397, 1, 1, 1, 1, 1,
0.4023967, -1.533136, 1.058197, 1, 1, 1, 1, 1,
0.404644, -1.792823, 4.338746, 1, 1, 1, 1, 1,
0.405102, 2.298606, -0.6139209, 1, 1, 1, 1, 1,
0.4096597, 0.381219, 1.400999, 1, 1, 1, 1, 1,
0.4111491, -0.3592982, 2.354584, 0, 0, 1, 1, 1,
0.4137104, -0.3014223, 1.324802, 1, 0, 0, 1, 1,
0.4196379, 2.081132, -0.4739468, 1, 0, 0, 1, 1,
0.4199454, 0.7660129, -0.2648444, 1, 0, 0, 1, 1,
0.4238768, -0.4878116, 2.143241, 1, 0, 0, 1, 1,
0.4244338, 0.04478208, 1.138219, 1, 0, 0, 1, 1,
0.4263318, 0.07781649, 1.118141, 0, 0, 0, 1, 1,
0.4269667, 0.1583727, 0.06261293, 0, 0, 0, 1, 1,
0.4276278, 0.8728414, 1.210514, 0, 0, 0, 1, 1,
0.4322986, -0.8623762, 2.298913, 0, 0, 0, 1, 1,
0.4422046, 0.4114273, 1.124005, 0, 0, 0, 1, 1,
0.4424653, 1.798583, 1.793543, 0, 0, 0, 1, 1,
0.4428544, -0.4779394, 1.552536, 0, 0, 0, 1, 1,
0.443188, 1.132025, -1.272597, 1, 1, 1, 1, 1,
0.4478996, 1.173635, 1.299296, 1, 1, 1, 1, 1,
0.4488217, 1.311032, 1.470626, 1, 1, 1, 1, 1,
0.4517109, -0.01752444, 1.851245, 1, 1, 1, 1, 1,
0.4528874, 0.3403623, 2.629438, 1, 1, 1, 1, 1,
0.4542836, 0.5049039, 0.01235384, 1, 1, 1, 1, 1,
0.4631293, 2.854458, 2.028246, 1, 1, 1, 1, 1,
0.4643427, -0.0182605, 3.008933, 1, 1, 1, 1, 1,
0.4678335, 2.269824, -0.3943791, 1, 1, 1, 1, 1,
0.4696041, -2.38117, 4.424196, 1, 1, 1, 1, 1,
0.4751538, -0.9785248, 3.03173, 1, 1, 1, 1, 1,
0.4792444, -0.149566, 1.826082, 1, 1, 1, 1, 1,
0.4806837, 0.3404353, 1.262178, 1, 1, 1, 1, 1,
0.4812354, 0.3772501, 0.7887455, 1, 1, 1, 1, 1,
0.4861419, 0.2574863, 0.980343, 1, 1, 1, 1, 1,
0.4911212, 0.05744218, 1.97664, 0, 0, 1, 1, 1,
0.4951796, -0.1009236, 3.122144, 1, 0, 0, 1, 1,
0.5000136, 0.02187025, 0.3927539, 1, 0, 0, 1, 1,
0.5003929, 0.8091818, -0.4757198, 1, 0, 0, 1, 1,
0.5015453, 1.607139, -1.938938, 1, 0, 0, 1, 1,
0.5073016, -0.2641133, 1.423416, 1, 0, 0, 1, 1,
0.5088407, -0.391359, 2.40964, 0, 0, 0, 1, 1,
0.5148447, -0.6803155, 2.161719, 0, 0, 0, 1, 1,
0.5170465, 0.6952997, 0.7996556, 0, 0, 0, 1, 1,
0.5205342, -0.3699185, 2.442887, 0, 0, 0, 1, 1,
0.5219409, -0.1578137, 1.102606, 0, 0, 0, 1, 1,
0.5233573, -0.3389109, 2.355802, 0, 0, 0, 1, 1,
0.524969, -0.09379436, 2.54377, 0, 0, 0, 1, 1,
0.5271866, -0.1079278, 1.319338, 1, 1, 1, 1, 1,
0.5307587, -0.3395854, 2.528605, 1, 1, 1, 1, 1,
0.5325562, 0.1684068, 0.2830535, 1, 1, 1, 1, 1,
0.5345525, 1.492398, 0.4963252, 1, 1, 1, 1, 1,
0.5357541, -1.884098, 1.304091, 1, 1, 1, 1, 1,
0.5420196, -0.08412419, 3.23347, 1, 1, 1, 1, 1,
0.5442623, 0.3874933, 1.785372, 1, 1, 1, 1, 1,
0.5446096, 1.182003, 0.6266003, 1, 1, 1, 1, 1,
0.5449969, -0.3233776, 1.559548, 1, 1, 1, 1, 1,
0.5450635, -1.19727, 2.92338, 1, 1, 1, 1, 1,
0.5455065, -0.8195031, 0.7012176, 1, 1, 1, 1, 1,
0.5493222, 0.3910019, -0.1339828, 1, 1, 1, 1, 1,
0.5541081, -0.05953249, 0.665235, 1, 1, 1, 1, 1,
0.5566087, -3.050037, 3.530236, 1, 1, 1, 1, 1,
0.5569782, -1.063283, 4.626307, 1, 1, 1, 1, 1,
0.557722, 1.27119, 1.059229, 0, 0, 1, 1, 1,
0.5622599, 0.4391935, 0.7234625, 1, 0, 0, 1, 1,
0.5641558, 0.2781588, 3.202234, 1, 0, 0, 1, 1,
0.5661658, 0.1535834, 0.3355582, 1, 0, 0, 1, 1,
0.5717715, 0.8506384, 1.905401, 1, 0, 0, 1, 1,
0.5790315, -0.6317627, 3.579481, 1, 0, 0, 1, 1,
0.579071, 0.1222442, 1.183317, 0, 0, 0, 1, 1,
0.5805586, -0.6089259, 3.265287, 0, 0, 0, 1, 1,
0.5820361, -0.3827584, 3.372814, 0, 0, 0, 1, 1,
0.5825107, -0.2150441, 2.154656, 0, 0, 0, 1, 1,
0.5864835, 0.5674866, 0.2569345, 0, 0, 0, 1, 1,
0.5890596, -1.336646, 4.733497, 0, 0, 0, 1, 1,
0.5903013, 0.1233265, 0.5756608, 0, 0, 0, 1, 1,
0.5950679, -1.644891, 2.673741, 1, 1, 1, 1, 1,
0.5956844, -2.627355, 2.271457, 1, 1, 1, 1, 1,
0.5980567, -1.866177, 1.769338, 1, 1, 1, 1, 1,
0.604192, 2.600916, -0.06949438, 1, 1, 1, 1, 1,
0.608185, -1.197055, 2.303767, 1, 1, 1, 1, 1,
0.6087824, 1.204347, 2.558743, 1, 1, 1, 1, 1,
0.6121531, 2.099571, 1.672384, 1, 1, 1, 1, 1,
0.6218844, -2.003459, 4.781162, 1, 1, 1, 1, 1,
0.6269425, -1.042324, 2.131278, 1, 1, 1, 1, 1,
0.6269863, 1.089358, -1.017809, 1, 1, 1, 1, 1,
0.6271843, 1.513469, 0.06617768, 1, 1, 1, 1, 1,
0.629903, -0.305001, 3.192473, 1, 1, 1, 1, 1,
0.6320648, -1.556286, 1.73931, 1, 1, 1, 1, 1,
0.6357579, -0.4121335, 4.574888, 1, 1, 1, 1, 1,
0.6364575, 1.062226, 1.648341, 1, 1, 1, 1, 1,
0.6365198, 0.4762167, 1.225953, 0, 0, 1, 1, 1,
0.6367627, -0.6206912, 1.047149, 1, 0, 0, 1, 1,
0.6379088, -0.3156034, 1.254211, 1, 0, 0, 1, 1,
0.6385769, -0.8608729, 3.619479, 1, 0, 0, 1, 1,
0.6544816, 0.334116, 1.441041, 1, 0, 0, 1, 1,
0.6554999, -0.5480933, 1.350462, 1, 0, 0, 1, 1,
0.6580762, 2.662258, 1.253812, 0, 0, 0, 1, 1,
0.6588852, 1.407073, -0.0314768, 0, 0, 0, 1, 1,
0.6596271, -0.8568761, 2.118081, 0, 0, 0, 1, 1,
0.6612256, -0.2817301, 0.6713941, 0, 0, 0, 1, 1,
0.663395, 1.709274, -1.604661, 0, 0, 0, 1, 1,
0.6650165, -0.05856141, 0.6507699, 0, 0, 0, 1, 1,
0.665535, -0.1965778, 1.465061, 0, 0, 0, 1, 1,
0.671177, -1.053071, 3.747464, 1, 1, 1, 1, 1,
0.6738448, 1.232309, 0.03606422, 1, 1, 1, 1, 1,
0.6810841, 0.5003881, 1.72242, 1, 1, 1, 1, 1,
0.6823159, -1.346759, 2.422022, 1, 1, 1, 1, 1,
0.6872427, 0.7153021, -1.337127, 1, 1, 1, 1, 1,
0.6923988, -0.9801534, 2.510176, 1, 1, 1, 1, 1,
0.6980207, 0.5716254, 2.013856, 1, 1, 1, 1, 1,
0.7015513, 1.875866, -0.6102279, 1, 1, 1, 1, 1,
0.7022268, 1.421996, 0.1931357, 1, 1, 1, 1, 1,
0.7072548, 0.9203365, 2.61248, 1, 1, 1, 1, 1,
0.7074287, -1.481883, 2.32388, 1, 1, 1, 1, 1,
0.7150068, 0.244002, 0.9069, 1, 1, 1, 1, 1,
0.7164848, 1.564257, -0.7743888, 1, 1, 1, 1, 1,
0.7176657, -2.031964, 4.289331, 1, 1, 1, 1, 1,
0.7189913, -1.686896, 1.26125, 1, 1, 1, 1, 1,
0.721613, -1.898092, 1.171818, 0, 0, 1, 1, 1,
0.7219807, -1.141527, 1.69133, 1, 0, 0, 1, 1,
0.7232997, 0.5981832, 0.1999286, 1, 0, 0, 1, 1,
0.7241287, 0.4012114, 1.570994, 1, 0, 0, 1, 1,
0.7253594, 0.8721374, 1.659168, 1, 0, 0, 1, 1,
0.7275888, -0.6364634, 3.216706, 1, 0, 0, 1, 1,
0.7315828, 1.078205, 0.9509562, 0, 0, 0, 1, 1,
0.7332999, 2.382751, -0.6057786, 0, 0, 0, 1, 1,
0.7369908, 0.9668012, -0.8548307, 0, 0, 0, 1, 1,
0.7371284, -0.9168031, 3.437344, 0, 0, 0, 1, 1,
0.7403489, -0.3136234, 0.8555929, 0, 0, 0, 1, 1,
0.7410677, 1.233876, 2.362562, 0, 0, 0, 1, 1,
0.7482699, 2.298095, 0.3887347, 0, 0, 0, 1, 1,
0.7551665, 0.4284039, -0.06622895, 1, 1, 1, 1, 1,
0.7590698, 0.5390009, 0.4734562, 1, 1, 1, 1, 1,
0.7594989, -1.442025, 3.649152, 1, 1, 1, 1, 1,
0.7597382, 0.07812313, 0.21662, 1, 1, 1, 1, 1,
0.7641722, 0.7518137, -0.238222, 1, 1, 1, 1, 1,
0.7646434, 0.6091163, -0.4939598, 1, 1, 1, 1, 1,
0.7683291, 0.6705018, 1.252565, 1, 1, 1, 1, 1,
0.7701794, 0.3283847, 2.129836, 1, 1, 1, 1, 1,
0.7706367, 0.1663113, 3.17125, 1, 1, 1, 1, 1,
0.7742012, 0.5187488, 0.08543719, 1, 1, 1, 1, 1,
0.7885578, 0.02954834, 0.5231413, 1, 1, 1, 1, 1,
0.791184, -0.05901859, 1.437271, 1, 1, 1, 1, 1,
0.793579, 0.312843, -0.3835939, 1, 1, 1, 1, 1,
0.7943171, 0.9812447, 2.749426, 1, 1, 1, 1, 1,
0.7953106, -0.21267, 2.378313, 1, 1, 1, 1, 1,
0.8033334, -0.9553228, 1.782799, 0, 0, 1, 1, 1,
0.8033385, -0.6898041, 3.426971, 1, 0, 0, 1, 1,
0.8047897, 0.652616, 0.1827697, 1, 0, 0, 1, 1,
0.8082047, 1.739699, 2.717919, 1, 0, 0, 1, 1,
0.8192892, -0.3230093, 1.90429, 1, 0, 0, 1, 1,
0.8202423, -2.884323, 3.442712, 1, 0, 0, 1, 1,
0.8219348, -0.8335643, 5.917212, 0, 0, 0, 1, 1,
0.8275301, 0.5457265, 1.120077, 0, 0, 0, 1, 1,
0.8352644, 2.130011, 0.997519, 0, 0, 0, 1, 1,
0.8373541, 1.524087, -0.07324215, 0, 0, 0, 1, 1,
0.8461118, -1.256095, 2.156474, 0, 0, 0, 1, 1,
0.8486561, 0.4241856, 2.941944, 0, 0, 0, 1, 1,
0.8493875, 0.8492332, 0.9435003, 0, 0, 0, 1, 1,
0.851235, 1.39142, 0.7418545, 1, 1, 1, 1, 1,
0.8525446, 0.1456062, 1.973078, 1, 1, 1, 1, 1,
0.8549805, 0.3995486, 2.50515, 1, 1, 1, 1, 1,
0.8575824, 0.5516192, 0.6807861, 1, 1, 1, 1, 1,
0.8588123, 1.39535, -0.3764492, 1, 1, 1, 1, 1,
0.8598374, 1.1002, 1.444576, 1, 1, 1, 1, 1,
0.8612907, 0.8473541, 0.5061334, 1, 1, 1, 1, 1,
0.8621271, -0.4368828, 3.036595, 1, 1, 1, 1, 1,
0.8626038, -0.6113397, 2.600054, 1, 1, 1, 1, 1,
0.8649007, 0.6801611, 0.9610429, 1, 1, 1, 1, 1,
0.8663195, -1.83507, 2.742943, 1, 1, 1, 1, 1,
0.8814788, 0.5013744, 2.145512, 1, 1, 1, 1, 1,
0.8866724, -0.6167958, 0.4688151, 1, 1, 1, 1, 1,
0.8980771, 0.216491, 1.293143, 1, 1, 1, 1, 1,
0.9008129, 0.2166328, -0.1026248, 1, 1, 1, 1, 1,
0.9014531, 0.2181415, 1.077285, 0, 0, 1, 1, 1,
0.9027363, 0.01798548, 0.7149125, 1, 0, 0, 1, 1,
0.9038122, -1.324098, 3.305658, 1, 0, 0, 1, 1,
0.9061984, 0.5765654, -0.03945359, 1, 0, 0, 1, 1,
0.9063783, -0.4497479, 2.790874, 1, 0, 0, 1, 1,
0.9135619, -0.7634433, 2.388734, 1, 0, 0, 1, 1,
0.9212653, -0.3746195, 2.652817, 0, 0, 0, 1, 1,
0.9219915, -0.7625, 2.7925, 0, 0, 0, 1, 1,
0.9244327, -0.1901388, 1.71636, 0, 0, 0, 1, 1,
0.9307889, 1.610036, 1.068446, 0, 0, 0, 1, 1,
0.9308604, 0.5257206, -0.6187733, 0, 0, 0, 1, 1,
0.9446961, -0.4173479, 2.546693, 0, 0, 0, 1, 1,
0.9485934, -1.234836, 3.352999, 0, 0, 0, 1, 1,
0.9511363, 0.1136082, 2.742929, 1, 1, 1, 1, 1,
0.9538788, 0.3800716, -0.2243971, 1, 1, 1, 1, 1,
0.9556696, 0.3021782, 1.515528, 1, 1, 1, 1, 1,
0.9654393, 1.110644, -0.5147432, 1, 1, 1, 1, 1,
0.968644, 1.154836, -0.8670957, 1, 1, 1, 1, 1,
0.9710469, 1.947789, 1.81573, 1, 1, 1, 1, 1,
0.9748182, -0.2889128, 3.258359, 1, 1, 1, 1, 1,
0.9751667, -1.103488, 2.947006, 1, 1, 1, 1, 1,
0.9789066, -1.827701, 2.966412, 1, 1, 1, 1, 1,
0.9884062, -0.8079693, 2.52975, 1, 1, 1, 1, 1,
0.9942312, 0.4507294, 1.929664, 1, 1, 1, 1, 1,
1.003686, 1.121077, 0.9248095, 1, 1, 1, 1, 1,
1.00606, 1.18329, -1.366693, 1, 1, 1, 1, 1,
1.008218, -0.11133, 2.367541, 1, 1, 1, 1, 1,
1.026175, -2.08719, 2.426037, 1, 1, 1, 1, 1,
1.037067, -0.305814, 2.139888, 0, 0, 1, 1, 1,
1.037115, -0.9111007, 1.994894, 1, 0, 0, 1, 1,
1.038341, -0.4394191, 1.368283, 1, 0, 0, 1, 1,
1.038397, 0.7044563, -0.3235443, 1, 0, 0, 1, 1,
1.045926, -0.6824406, 0.9810883, 1, 0, 0, 1, 1,
1.055278, 0.8182946, 0.6976306, 1, 0, 0, 1, 1,
1.069657, -1.260538, 1.219445, 0, 0, 0, 1, 1,
1.071858, -1.049925, 3.010419, 0, 0, 0, 1, 1,
1.072416, 0.0487573, 1.351233, 0, 0, 0, 1, 1,
1.085302, -0.6721166, 2.662131, 0, 0, 0, 1, 1,
1.088768, 0.7240028, -0.8914441, 0, 0, 0, 1, 1,
1.096542, 0.6489118, 0.4630277, 0, 0, 0, 1, 1,
1.101818, -0.5518873, 1.867561, 0, 0, 0, 1, 1,
1.111943, 1.457468, -0.5959957, 1, 1, 1, 1, 1,
1.112954, -2.39896, 2.287046, 1, 1, 1, 1, 1,
1.118303, 0.6046864, 1.149553, 1, 1, 1, 1, 1,
1.119608, -0.6825939, 1.346083, 1, 1, 1, 1, 1,
1.124048, -0.9651259, 1.733922, 1, 1, 1, 1, 1,
1.124928, -0.9393136, 2.402612, 1, 1, 1, 1, 1,
1.126997, -0.1381381, 1.151431, 1, 1, 1, 1, 1,
1.127825, 1.561747, 1.594461, 1, 1, 1, 1, 1,
1.144296, 0.5912021, 1.607688, 1, 1, 1, 1, 1,
1.146971, 1.201976, 0.1988467, 1, 1, 1, 1, 1,
1.148886, -0.3686707, 1.335793, 1, 1, 1, 1, 1,
1.174463, -0.5137985, 2.806751, 1, 1, 1, 1, 1,
1.186312, 0.4071328, 1.06646, 1, 1, 1, 1, 1,
1.194043, -0.2051705, 1.361494, 1, 1, 1, 1, 1,
1.196913, 0.9163219, 1.423419, 1, 1, 1, 1, 1,
1.202937, 1.283903, 1.615856, 0, 0, 1, 1, 1,
1.204713, -0.3368688, 2.874188, 1, 0, 0, 1, 1,
1.216388, 0.3888212, 1.957397, 1, 0, 0, 1, 1,
1.219069, 1.576164, 1.133303, 1, 0, 0, 1, 1,
1.228564, 0.6132105, 1.158738, 1, 0, 0, 1, 1,
1.229082, -0.0774102, -0.2596075, 1, 0, 0, 1, 1,
1.233331, -0.1153458, 0.8200901, 0, 0, 0, 1, 1,
1.247118, 0.2983426, 1.740223, 0, 0, 0, 1, 1,
1.257062, -1.268705, 3.142149, 0, 0, 0, 1, 1,
1.25735, 1.086324, 0.1171119, 0, 0, 0, 1, 1,
1.259631, -0.1692202, 1.542882, 0, 0, 0, 1, 1,
1.261261, 0.5860658, -0.8933243, 0, 0, 0, 1, 1,
1.265023, 1.176638, 0.2204944, 0, 0, 0, 1, 1,
1.27221, 0.8715212, 2.415204, 1, 1, 1, 1, 1,
1.280418, -1.644369, 3.317532, 1, 1, 1, 1, 1,
1.281346, -0.4425586, -0.5232617, 1, 1, 1, 1, 1,
1.286776, 1.479562, 0.7608163, 1, 1, 1, 1, 1,
1.287054, 0.84574, 1.176351, 1, 1, 1, 1, 1,
1.289916, 0.9279718, 1.052311, 1, 1, 1, 1, 1,
1.295379, -0.2085226, 0.07185105, 1, 1, 1, 1, 1,
1.297341, 2.447268, 0.238493, 1, 1, 1, 1, 1,
1.301864, 2.45293, 0.5477434, 1, 1, 1, 1, 1,
1.310474, -0.600094, 1.473672, 1, 1, 1, 1, 1,
1.321072, 0.6668484, 0.3383458, 1, 1, 1, 1, 1,
1.328642, 0.04132325, 1.328434, 1, 1, 1, 1, 1,
1.335973, -0.2835487, 0.5072707, 1, 1, 1, 1, 1,
1.370117, 1.134487, -0.7854853, 1, 1, 1, 1, 1,
1.382962, -0.3773856, 2.15543, 1, 1, 1, 1, 1,
1.389023, 1.181192, 1.813898, 0, 0, 1, 1, 1,
1.395991, -0.7084544, 1.951874, 1, 0, 0, 1, 1,
1.398211, 1.863407, -0.660776, 1, 0, 0, 1, 1,
1.401856, -1.044433, 2.746963, 1, 0, 0, 1, 1,
1.406328, -0.3289222, -0.1968209, 1, 0, 0, 1, 1,
1.416814, 0.5052531, 1.448609, 1, 0, 0, 1, 1,
1.418269, -0.3680913, 3.62385, 0, 0, 0, 1, 1,
1.419266, 0.784642, -0.3232059, 0, 0, 0, 1, 1,
1.42354, -2.0093, 1.646114, 0, 0, 0, 1, 1,
1.431728, -0.1312046, 0.61654, 0, 0, 0, 1, 1,
1.443766, 0.253116, 0.4644724, 0, 0, 0, 1, 1,
1.45743, 0.1012407, 0.5639893, 0, 0, 0, 1, 1,
1.464401, 0.9561483, 0.3134882, 0, 0, 0, 1, 1,
1.466126, 0.3117756, 1.45208, 1, 1, 1, 1, 1,
1.479365, 0.363654, 0.07558706, 1, 1, 1, 1, 1,
1.481707, -2.022583, 3.202719, 1, 1, 1, 1, 1,
1.495897, 1.061136, 0.6608955, 1, 1, 1, 1, 1,
1.525948, -0.7404248, 0.6492462, 1, 1, 1, 1, 1,
1.541558, 0.67174, 0.3473166, 1, 1, 1, 1, 1,
1.541906, 0.3769398, 2.72373, 1, 1, 1, 1, 1,
1.577551, 0.8368624, 3.277997, 1, 1, 1, 1, 1,
1.594039, -0.1912742, 2.129042, 1, 1, 1, 1, 1,
1.598569, 0.6494933, -0.2470697, 1, 1, 1, 1, 1,
1.655735, -0.9612908, 1.817763, 1, 1, 1, 1, 1,
1.65913, -0.6635802, 3.24229, 1, 1, 1, 1, 1,
1.663502, -1.647603, 2.950631, 1, 1, 1, 1, 1,
1.682859, 1.302095, 0.1148037, 1, 1, 1, 1, 1,
1.686019, 0.3260356, 2.655083, 1, 1, 1, 1, 1,
1.689351, -0.2932445, 1.013027, 0, 0, 1, 1, 1,
1.706279, -0.5430582, 1.995753, 1, 0, 0, 1, 1,
1.714489, 1.490503, 0.4596875, 1, 0, 0, 1, 1,
1.72126, 0.1220984, 1.777597, 1, 0, 0, 1, 1,
1.721641, 1.241336, 0.5725328, 1, 0, 0, 1, 1,
1.726758, -0.1925087, 2.031862, 1, 0, 0, 1, 1,
1.746411, 1.864913, -0.4295777, 0, 0, 0, 1, 1,
1.749162, 1.012303, 2.271288, 0, 0, 0, 1, 1,
1.750733, 0.4574946, 2.433108, 0, 0, 0, 1, 1,
1.75478, -0.1236325, 2.147778, 0, 0, 0, 1, 1,
1.756206, -0.6103919, 1.051547, 0, 0, 0, 1, 1,
1.760069, -0.4466709, 2.350587, 0, 0, 0, 1, 1,
1.794202, 0.2749303, 2.408262, 0, 0, 0, 1, 1,
1.80118, 1.694762, 1.410592, 1, 1, 1, 1, 1,
1.834944, 0.4321482, 1.660298, 1, 1, 1, 1, 1,
1.841791, 0.1531906, 1.897083, 1, 1, 1, 1, 1,
1.844821, -2.294123, 3.723379, 1, 1, 1, 1, 1,
1.845878, 1.82962, 1.049895, 1, 1, 1, 1, 1,
1.865911, -1.433902, 2.981109, 1, 1, 1, 1, 1,
1.880467, -2.038232, 3.815153, 1, 1, 1, 1, 1,
1.881343, -2.098979, 1.949571, 1, 1, 1, 1, 1,
1.910941, -0.4219146, 1.569205, 1, 1, 1, 1, 1,
1.932985, 1.384105, 2.508944, 1, 1, 1, 1, 1,
1.950084, -1.462151, 3.108707, 1, 1, 1, 1, 1,
1.956987, 1.509246, 1.003616, 1, 1, 1, 1, 1,
1.996213, -0.7733703, 1.395355, 1, 1, 1, 1, 1,
2.00047, -0.1711917, 1.294115, 1, 1, 1, 1, 1,
2.001062, -1.406717, 1.564745, 1, 1, 1, 1, 1,
2.019978, -0.3922252, 1.831284, 0, 0, 1, 1, 1,
2.039268, 0.2553877, 0.04569655, 1, 0, 0, 1, 1,
2.084037, -0.9191158, 2.18054, 1, 0, 0, 1, 1,
2.085286, 1.505226, 0.9597659, 1, 0, 0, 1, 1,
2.14815, 0.9898948, 0.344297, 1, 0, 0, 1, 1,
2.204031, -1.803159, 2.292022, 1, 0, 0, 1, 1,
2.225539, -1.722833, 3.796354, 0, 0, 0, 1, 1,
2.234042, -0.4129521, 1.979229, 0, 0, 0, 1, 1,
2.2368, -0.5708072, 2.545708, 0, 0, 0, 1, 1,
2.266032, 1.261146, 2.297262, 0, 0, 0, 1, 1,
2.280934, 0.09802807, 1.906381, 0, 0, 0, 1, 1,
2.293703, 0.3174149, 0.2704987, 0, 0, 0, 1, 1,
2.327754, 0.4985405, 1.61864, 0, 0, 0, 1, 1,
2.336469, 0.6444799, 1.763922, 1, 1, 1, 1, 1,
2.381098, -0.8749897, 0.8242922, 1, 1, 1, 1, 1,
2.471809, -0.395448, 1.636566, 1, 1, 1, 1, 1,
2.504246, -0.6954775, 1.394514, 1, 1, 1, 1, 1,
2.578228, -0.2433879, 2.040475, 1, 1, 1, 1, 1,
2.748547, -0.3010839, 1.174581, 1, 1, 1, 1, 1,
2.828984, -0.5987957, 2.108494, 1, 1, 1, 1, 1
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
var radius = 9.446436;
var distance = 33.1802;
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
mvMatrix.translate( 0.01799607, 0.3683987, -0.5050142 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1802);
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
