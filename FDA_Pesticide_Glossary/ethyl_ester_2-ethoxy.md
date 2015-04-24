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
-2.903554, 1.519866, -0.06473777, 1, 0, 0, 1,
-2.782364, -2.266919, -3.114573, 1, 0.007843138, 0, 1,
-2.778632, 0.9679523, -3.494339, 1, 0.01176471, 0, 1,
-2.766248, -1.661663, -0.7670388, 1, 0.01960784, 0, 1,
-2.749454, 0.6149785, -1.104242, 1, 0.02352941, 0, 1,
-2.705904, 0.1764388, -2.346449, 1, 0.03137255, 0, 1,
-2.583447, 3.420756, -0.7769251, 1, 0.03529412, 0, 1,
-2.583051, -0.7335157, -0.6800029, 1, 0.04313726, 0, 1,
-2.567901, -1.995493, -2.691334, 1, 0.04705882, 0, 1,
-2.546835, -0.2484393, -3.455072, 1, 0.05490196, 0, 1,
-2.511818, -0.6154411, -2.14395, 1, 0.05882353, 0, 1,
-2.487401, -1.307037, -1.978612, 1, 0.06666667, 0, 1,
-2.480118, 0.6243504, 0.9545035, 1, 0.07058824, 0, 1,
-2.455712, 0.008000161, -0.5300289, 1, 0.07843138, 0, 1,
-2.43501, -1.747546, -3.187948, 1, 0.08235294, 0, 1,
-2.421064, -0.3079279, -2.700127, 1, 0.09019608, 0, 1,
-2.372285, 0.6007349, -0.5998402, 1, 0.09411765, 0, 1,
-2.361156, -1.395566, -1.762549, 1, 0.1019608, 0, 1,
-2.321365, -0.2579073, -1.494287, 1, 0.1098039, 0, 1,
-2.299527, 0.1854466, -0.2218401, 1, 0.1137255, 0, 1,
-2.280149, 0.7884555, -0.1151764, 1, 0.1215686, 0, 1,
-2.262047, 0.8785543, -1.632168, 1, 0.1254902, 0, 1,
-2.241122, -0.915738, -1.54335, 1, 0.1333333, 0, 1,
-2.230947, 0.7652707, 0.2857337, 1, 0.1372549, 0, 1,
-2.219029, 0.4100588, -2.670401, 1, 0.145098, 0, 1,
-2.188372, -1.60087, -1.361609, 1, 0.1490196, 0, 1,
-2.167017, 0.6020069, -0.4193449, 1, 0.1568628, 0, 1,
-2.138287, 0.7329359, 0.4891321, 1, 0.1607843, 0, 1,
-2.110465, 1.028964, -0.9084666, 1, 0.1686275, 0, 1,
-2.108561, -1.648424, -2.142992, 1, 0.172549, 0, 1,
-2.071649, 0.9413206, -0.9160519, 1, 0.1803922, 0, 1,
-2.054664, 1.024566, -0.6542224, 1, 0.1843137, 0, 1,
-2.046373, 0.1848963, -2.074807, 1, 0.1921569, 0, 1,
-2.024771, 0.4156449, -1.155514, 1, 0.1960784, 0, 1,
-1.995333, -1.380645, -0.2958491, 1, 0.2039216, 0, 1,
-1.957431, -0.8501431, -1.138824, 1, 0.2117647, 0, 1,
-1.954908, 0.985446, -1.486869, 1, 0.2156863, 0, 1,
-1.93231, -0.519825, -1.412184, 1, 0.2235294, 0, 1,
-1.917562, -1.455535, -1.877418, 1, 0.227451, 0, 1,
-1.917059, 0.1452191, 0.4202411, 1, 0.2352941, 0, 1,
-1.90772, -0.1101391, 0.4582257, 1, 0.2392157, 0, 1,
-1.892428, -0.6015228, -4.34908, 1, 0.2470588, 0, 1,
-1.879163, 0.6490422, -1.95585, 1, 0.2509804, 0, 1,
-1.868791, 1.546516, -0.1671604, 1, 0.2588235, 0, 1,
-1.828662, -0.4608068, -1.778771, 1, 0.2627451, 0, 1,
-1.818715, 1.627578, 0.4706925, 1, 0.2705882, 0, 1,
-1.807348, 0.4980543, -3.188825, 1, 0.2745098, 0, 1,
-1.785692, -0.8421524, -1.979429, 1, 0.282353, 0, 1,
-1.783096, 1.249979, -1.416849, 1, 0.2862745, 0, 1,
-1.772015, -1.372528, -2.768064, 1, 0.2941177, 0, 1,
-1.765872, -1.1136, -2.415021, 1, 0.3019608, 0, 1,
-1.75326, 0.8666636, 0.1961558, 1, 0.3058824, 0, 1,
-1.749968, 1.26391, 0.5448654, 1, 0.3137255, 0, 1,
-1.744852, 0.7835998, -0.3090787, 1, 0.3176471, 0, 1,
-1.741798, -0.609336, -1.948442, 1, 0.3254902, 0, 1,
-1.741302, 0.451107, 0.1550205, 1, 0.3294118, 0, 1,
-1.733118, -1.858484, -2.123324, 1, 0.3372549, 0, 1,
-1.720749, 1.040466, -1.182054, 1, 0.3411765, 0, 1,
-1.719664, -0.4102974, -3.170444, 1, 0.3490196, 0, 1,
-1.700842, -1.301209, -0.09811389, 1, 0.3529412, 0, 1,
-1.682322, -0.1411766, -3.941879, 1, 0.3607843, 0, 1,
-1.652999, 0.8569857, -1.546692, 1, 0.3647059, 0, 1,
-1.628608, -2.068758, -2.046332, 1, 0.372549, 0, 1,
-1.613117, -0.8459209, -2.218888, 1, 0.3764706, 0, 1,
-1.60124, 1.7647, -1.100862, 1, 0.3843137, 0, 1,
-1.600885, 0.7318683, -0.4874893, 1, 0.3882353, 0, 1,
-1.584932, 1.353462, -2.028359, 1, 0.3960784, 0, 1,
-1.577971, -0.3682517, -1.854824, 1, 0.4039216, 0, 1,
-1.577835, 0.1238032, -0.3440301, 1, 0.4078431, 0, 1,
-1.565795, -0.1287657, -2.120778, 1, 0.4156863, 0, 1,
-1.562026, -1.267495, -1.122968, 1, 0.4196078, 0, 1,
-1.549156, 0.3955585, -1.556476, 1, 0.427451, 0, 1,
-1.545396, 1.524082, -0.5699239, 1, 0.4313726, 0, 1,
-1.537141, 0.5108876, -1.590829, 1, 0.4392157, 0, 1,
-1.524499, -0.3890191, -1.596842, 1, 0.4431373, 0, 1,
-1.515773, 0.1656166, -1.50639, 1, 0.4509804, 0, 1,
-1.512225, 0.3726431, 0.04901966, 1, 0.454902, 0, 1,
-1.503519, -0.6927286, -2.966361, 1, 0.4627451, 0, 1,
-1.496884, -1.100387, -2.363595, 1, 0.4666667, 0, 1,
-1.477386, 0.456689, -2.376642, 1, 0.4745098, 0, 1,
-1.476217, 0.668288, -2.063397, 1, 0.4784314, 0, 1,
-1.460072, 0.2269127, -1.927873, 1, 0.4862745, 0, 1,
-1.446188, 0.1737056, -2.268737, 1, 0.4901961, 0, 1,
-1.429393, -1.159135, -2.327444, 1, 0.4980392, 0, 1,
-1.41875, -0.3967741, -2.179427, 1, 0.5058824, 0, 1,
-1.41113, 0.9389053, -0.9197161, 1, 0.509804, 0, 1,
-1.409704, -0.5319393, -0.6274776, 1, 0.5176471, 0, 1,
-1.405678, 0.3670947, -1.002118, 1, 0.5215687, 0, 1,
-1.40394, 0.7768826, -0.610657, 1, 0.5294118, 0, 1,
-1.403471, 0.8623883, -0.07644041, 1, 0.5333334, 0, 1,
-1.399855, 0.1142566, 0.2971831, 1, 0.5411765, 0, 1,
-1.395258, 0.2736053, -1.408644, 1, 0.5450981, 0, 1,
-1.386732, -0.09535159, -2.729542, 1, 0.5529412, 0, 1,
-1.384232, 0.214918, -1.383018, 1, 0.5568628, 0, 1,
-1.381778, 0.08332734, -0.479021, 1, 0.5647059, 0, 1,
-1.371915, 0.5624133, 0.7158403, 1, 0.5686275, 0, 1,
-1.359041, 0.2994594, 0.5343792, 1, 0.5764706, 0, 1,
-1.356973, 0.3506895, -2.708613, 1, 0.5803922, 0, 1,
-1.356325, -0.6286572, -1.193618, 1, 0.5882353, 0, 1,
-1.349732, -0.5850143, -1.76687, 1, 0.5921569, 0, 1,
-1.345912, -0.8834075, -2.635895, 1, 0.6, 0, 1,
-1.342656, 0.09861966, -2.127567, 1, 0.6078432, 0, 1,
-1.331023, -1.761712, -3.367898, 1, 0.6117647, 0, 1,
-1.328822, 0.9088951, -0.1851244, 1, 0.6196079, 0, 1,
-1.319009, -0.896406, -1.931061, 1, 0.6235294, 0, 1,
-1.317596, 0.1851277, -1.424182, 1, 0.6313726, 0, 1,
-1.307358, 1.025577, 0.2519099, 1, 0.6352941, 0, 1,
-1.297314, -0.3509611, -0.290241, 1, 0.6431373, 0, 1,
-1.293833, -1.015682, -1.947696, 1, 0.6470588, 0, 1,
-1.285293, 2.873124, 0.2085603, 1, 0.654902, 0, 1,
-1.283334, 0.4208285, -1.242131, 1, 0.6588235, 0, 1,
-1.274724, 0.1459862, -2.29984, 1, 0.6666667, 0, 1,
-1.272877, -0.4419433, -1.822316, 1, 0.6705883, 0, 1,
-1.271783, 0.4233837, 0.07206733, 1, 0.6784314, 0, 1,
-1.26283, -0.849898, -3.732043, 1, 0.682353, 0, 1,
-1.261217, -0.03947467, -0.8900388, 1, 0.6901961, 0, 1,
-1.2451, -2.048509, -2.867715, 1, 0.6941177, 0, 1,
-1.239283, 0.04871912, -0.9300916, 1, 0.7019608, 0, 1,
-1.234465, -1.071004, -2.229409, 1, 0.7098039, 0, 1,
-1.232092, 0.4756421, -0.3460742, 1, 0.7137255, 0, 1,
-1.223933, 0.844528, -0.151078, 1, 0.7215686, 0, 1,
-1.221378, 0.241856, -1.141015, 1, 0.7254902, 0, 1,
-1.221242, -0.1837197, -1.721552, 1, 0.7333333, 0, 1,
-1.214314, -0.684705, -2.422279, 1, 0.7372549, 0, 1,
-1.207428, 1.042276, -0.6515613, 1, 0.7450981, 0, 1,
-1.20451, -0.8699513, -1.187827, 1, 0.7490196, 0, 1,
-1.203722, -0.6423644, -2.22292, 1, 0.7568628, 0, 1,
-1.192006, 0.1482798, -3.083992, 1, 0.7607843, 0, 1,
-1.185825, -0.2216626, -2.38471, 1, 0.7686275, 0, 1,
-1.170239, 0.4157074, -0.3806751, 1, 0.772549, 0, 1,
-1.167032, 1.545322, -1.369431, 1, 0.7803922, 0, 1,
-1.15923, -0.7157642, -2.202047, 1, 0.7843137, 0, 1,
-1.152071, -0.9515611, -0.9988463, 1, 0.7921569, 0, 1,
-1.14273, 0.5992789, -0.8994041, 1, 0.7960784, 0, 1,
-1.133719, -0.1966173, -1.226376, 1, 0.8039216, 0, 1,
-1.12406, -0.8802959, -1.505164, 1, 0.8117647, 0, 1,
-1.118752, 1.294211, -0.570199, 1, 0.8156863, 0, 1,
-1.117727, -0.07760474, -2.292799, 1, 0.8235294, 0, 1,
-1.113638, 0.5042936, -1.384767, 1, 0.827451, 0, 1,
-1.110007, -0.6525987, 0.1921844, 1, 0.8352941, 0, 1,
-1.103237, -0.1209982, -1.636528, 1, 0.8392157, 0, 1,
-1.101073, 0.9636683, -1.056363, 1, 0.8470588, 0, 1,
-1.09962, 0.04431363, -1.55412, 1, 0.8509804, 0, 1,
-1.098419, 0.1990991, 0.4490183, 1, 0.8588235, 0, 1,
-1.097985, -1.318466, -2.792116, 1, 0.8627451, 0, 1,
-1.091946, -0.8606168, -2.681218, 1, 0.8705882, 0, 1,
-1.088685, -0.4153019, -3.093541, 1, 0.8745098, 0, 1,
-1.082425, 1.106215, -2.712049, 1, 0.8823529, 0, 1,
-1.082319, 1.166212, -1.292496, 1, 0.8862745, 0, 1,
-1.079806, -0.2392646, -2.502244, 1, 0.8941177, 0, 1,
-1.079317, 0.8280647, -1.20776, 1, 0.8980392, 0, 1,
-1.075507, 0.4104856, 0.5745586, 1, 0.9058824, 0, 1,
-1.068491, 1.991918, 0.5252505, 1, 0.9137255, 0, 1,
-1.06383, -0.4953073, -2.100719, 1, 0.9176471, 0, 1,
-1.063271, 1.583492, 1.66632, 1, 0.9254902, 0, 1,
-1.062094, 0.4827412, -1.296133, 1, 0.9294118, 0, 1,
-1.057933, 0.2058312, -0.4194719, 1, 0.9372549, 0, 1,
-1.043961, -2.360226, -1.917924, 1, 0.9411765, 0, 1,
-1.04331, -1.753699, -1.337169, 1, 0.9490196, 0, 1,
-1.041028, -0.7508398, -3.077706, 1, 0.9529412, 0, 1,
-1.036892, 0.106562, -0.7458599, 1, 0.9607843, 0, 1,
-1.031821, 1.08351, -1.913352, 1, 0.9647059, 0, 1,
-0.9877182, -0.8700958, -1.224543, 1, 0.972549, 0, 1,
-0.9874811, 0.4050963, -1.488092, 1, 0.9764706, 0, 1,
-0.9865522, 1.242746, -0.08434934, 1, 0.9843137, 0, 1,
-0.9860678, -0.1044001, -3.080025, 1, 0.9882353, 0, 1,
-0.9855664, -0.6276791, -3.502721, 1, 0.9960784, 0, 1,
-0.9849477, -0.3858981, -2.166709, 0.9960784, 1, 0, 1,
-0.9848599, 3.209862, -0.1384471, 0.9921569, 1, 0, 1,
-0.9805326, -1.531015, -2.107723, 0.9843137, 1, 0, 1,
-0.9762005, -0.2697102, -0.06372076, 0.9803922, 1, 0, 1,
-0.9746242, 0.9336998, -1.162733, 0.972549, 1, 0, 1,
-0.9729734, -2.431735, -1.462926, 0.9686275, 1, 0, 1,
-0.9673845, 0.03797085, -1.650445, 0.9607843, 1, 0, 1,
-0.9623338, -0.6173936, -2.620562, 0.9568627, 1, 0, 1,
-0.9589112, 2.469742, -1.595978, 0.9490196, 1, 0, 1,
-0.9570804, 0.3271945, -0.6798627, 0.945098, 1, 0, 1,
-0.9556338, -1.669601, -4.673157, 0.9372549, 1, 0, 1,
-0.9542473, -0.366476, -0.1391483, 0.9333333, 1, 0, 1,
-0.9522557, 1.029617, 1.525319, 0.9254902, 1, 0, 1,
-0.9473194, 0.03924052, -0.5753437, 0.9215686, 1, 0, 1,
-0.9443989, 0.537851, -0.5389751, 0.9137255, 1, 0, 1,
-0.9422102, 1.334008, -1.385563, 0.9098039, 1, 0, 1,
-0.9406894, -0.6904502, -1.116271, 0.9019608, 1, 0, 1,
-0.9390423, -0.05007121, -1.822618, 0.8941177, 1, 0, 1,
-0.9383496, 0.3860485, -2.473664, 0.8901961, 1, 0, 1,
-0.9371517, 1.312648, -1.453537, 0.8823529, 1, 0, 1,
-0.9268654, -0.3696697, -2.581015, 0.8784314, 1, 0, 1,
-0.9213241, -1.667465, -2.879743, 0.8705882, 1, 0, 1,
-0.9130373, -0.2108128, -1.416368, 0.8666667, 1, 0, 1,
-0.9125746, -0.1261318, 0.4275709, 0.8588235, 1, 0, 1,
-0.907567, 0.8439033, -2.267682, 0.854902, 1, 0, 1,
-0.90482, 0.1703712, -0.9727645, 0.8470588, 1, 0, 1,
-0.8922747, 0.04128586, -0.4526269, 0.8431373, 1, 0, 1,
-0.8913739, -0.08103386, -1.268471, 0.8352941, 1, 0, 1,
-0.8863919, -0.1230072, -2.934339, 0.8313726, 1, 0, 1,
-0.8850393, -0.1328426, -3.206727, 0.8235294, 1, 0, 1,
-0.8781333, 0.129428, -2.28212, 0.8196079, 1, 0, 1,
-0.8736625, 1.464964, 0.6448975, 0.8117647, 1, 0, 1,
-0.8713169, -0.2612411, -2.117989, 0.8078431, 1, 0, 1,
-0.8707907, 0.3490105, -0.3601494, 0.8, 1, 0, 1,
-0.8705928, 0.1974604, -1.193276, 0.7921569, 1, 0, 1,
-0.8669432, -0.4230004, -1.929525, 0.7882353, 1, 0, 1,
-0.8617232, 0.4412562, 0.9089973, 0.7803922, 1, 0, 1,
-0.8575695, -0.5353566, -4.014473, 0.7764706, 1, 0, 1,
-0.8542777, 1.370345, -0.9299922, 0.7686275, 1, 0, 1,
-0.8519827, -0.1108602, -3.078318, 0.7647059, 1, 0, 1,
-0.84871, 0.2425066, -2.497518, 0.7568628, 1, 0, 1,
-0.8483963, 0.1277829, -0.7541267, 0.7529412, 1, 0, 1,
-0.8436798, -0.1326836, -1.268434, 0.7450981, 1, 0, 1,
-0.8432561, 1.565353, 1.003857, 0.7411765, 1, 0, 1,
-0.8381924, 0.1070806, 0.6286291, 0.7333333, 1, 0, 1,
-0.8353841, 0.4838085, -0.4896059, 0.7294118, 1, 0, 1,
-0.8308268, -0.1655401, -1.139503, 0.7215686, 1, 0, 1,
-0.827381, -0.4370537, -2.066565, 0.7176471, 1, 0, 1,
-0.8218278, -2.102901, -2.519424, 0.7098039, 1, 0, 1,
-0.8203856, 1.250114, 0.1934089, 0.7058824, 1, 0, 1,
-0.8175959, 0.06587831, 0.4465074, 0.6980392, 1, 0, 1,
-0.816034, 0.4948585, -0.3530897, 0.6901961, 1, 0, 1,
-0.8134596, -3.272304, -2.142838, 0.6862745, 1, 0, 1,
-0.8133245, 0.3598966, -0.04309482, 0.6784314, 1, 0, 1,
-0.8118642, -0.007992469, -2.445751, 0.6745098, 1, 0, 1,
-0.8112363, -0.7387971, -1.10499, 0.6666667, 1, 0, 1,
-0.8054858, -1.233603, -2.060003, 0.6627451, 1, 0, 1,
-0.8034976, 0.8239678, -1.282286, 0.654902, 1, 0, 1,
-0.8031172, 0.7899258, -0.9068145, 0.6509804, 1, 0, 1,
-0.8014997, -0.3119633, -1.237834, 0.6431373, 1, 0, 1,
-0.8004842, 0.4678257, -1.937907, 0.6392157, 1, 0, 1,
-0.7911958, -1.393806, -3.35742, 0.6313726, 1, 0, 1,
-0.7863451, 0.6168559, -0.5767148, 0.627451, 1, 0, 1,
-0.7843156, 0.2253089, -1.62478, 0.6196079, 1, 0, 1,
-0.7790173, 0.7300342, -1.041103, 0.6156863, 1, 0, 1,
-0.7749292, 0.7693778, -2.15748, 0.6078432, 1, 0, 1,
-0.7697313, 0.4490754, -2.339411, 0.6039216, 1, 0, 1,
-0.7667915, 1.967563, 0.4089357, 0.5960785, 1, 0, 1,
-0.7633838, -0.3542422, -1.87697, 0.5882353, 1, 0, 1,
-0.7574602, -1.516683, -3.745157, 0.5843138, 1, 0, 1,
-0.755792, -0.4798989, -3.555364, 0.5764706, 1, 0, 1,
-0.7457449, -0.8738604, -3.015893, 0.572549, 1, 0, 1,
-0.7431615, 1.116854, 0.6474189, 0.5647059, 1, 0, 1,
-0.7396567, 1.473053, 0.09169433, 0.5607843, 1, 0, 1,
-0.739277, 1.043692, 0.4155419, 0.5529412, 1, 0, 1,
-0.7381846, -2.283071, -3.927153, 0.5490196, 1, 0, 1,
-0.7380935, 0.8291165, -0.2551428, 0.5411765, 1, 0, 1,
-0.7374793, -1.037606, -3.631252, 0.5372549, 1, 0, 1,
-0.7357089, -0.9604604, -1.884996, 0.5294118, 1, 0, 1,
-0.7294172, 1.16914, 0.3226961, 0.5254902, 1, 0, 1,
-0.7243387, 0.2103122, -0.8879495, 0.5176471, 1, 0, 1,
-0.7122507, -0.8423955, -1.434179, 0.5137255, 1, 0, 1,
-0.7085723, 0.8982438, -0.1325176, 0.5058824, 1, 0, 1,
-0.7050458, -2.133511, -3.89924, 0.5019608, 1, 0, 1,
-0.6994761, -0.232556, -1.951915, 0.4941176, 1, 0, 1,
-0.6913998, 1.085706, 0.5133265, 0.4862745, 1, 0, 1,
-0.6907281, -0.595619, -2.156735, 0.4823529, 1, 0, 1,
-0.6839144, -0.1243587, -0.9270719, 0.4745098, 1, 0, 1,
-0.6836652, 0.569665, -0.6074721, 0.4705882, 1, 0, 1,
-0.6824364, 0.9584019, -1.690157, 0.4627451, 1, 0, 1,
-0.6811342, -0.7438915, -1.007524, 0.4588235, 1, 0, 1,
-0.6739631, 0.7752864, -0.7374595, 0.4509804, 1, 0, 1,
-0.6739101, -0.376582, -2.30494, 0.4470588, 1, 0, 1,
-0.6688886, -0.5103992, -2.080382, 0.4392157, 1, 0, 1,
-0.6664902, -0.4609772, -2.251481, 0.4352941, 1, 0, 1,
-0.6661593, 2.22445, -0.3367618, 0.427451, 1, 0, 1,
-0.6660154, 1.059437, -0.04232569, 0.4235294, 1, 0, 1,
-0.6624017, -1.148793, -1.406455, 0.4156863, 1, 0, 1,
-0.6558276, -2.375364, -1.290804, 0.4117647, 1, 0, 1,
-0.652139, 1.566623, -1.071392, 0.4039216, 1, 0, 1,
-0.6517985, -1.148922, -1.829853, 0.3960784, 1, 0, 1,
-0.6488909, -1.270389, -2.411667, 0.3921569, 1, 0, 1,
-0.6472632, -0.2912976, -1.42751, 0.3843137, 1, 0, 1,
-0.6461163, 2.047323, -1.000772, 0.3803922, 1, 0, 1,
-0.6455715, -1.143436, -3.794105, 0.372549, 1, 0, 1,
-0.6435027, -0.9626982, -2.574803, 0.3686275, 1, 0, 1,
-0.6372915, 0.518251, -2.196511, 0.3607843, 1, 0, 1,
-0.6337161, -0.135919, -0.3342215, 0.3568628, 1, 0, 1,
-0.628239, -0.4630394, -2.671512, 0.3490196, 1, 0, 1,
-0.6275862, 0.2039657, -0.487131, 0.345098, 1, 0, 1,
-0.6204762, -1.247342, -1.098767, 0.3372549, 1, 0, 1,
-0.6198107, -0.4207595, -3.949985, 0.3333333, 1, 0, 1,
-0.6197252, -0.9925103, -3.272852, 0.3254902, 1, 0, 1,
-0.6195232, 0.4046377, -0.6969294, 0.3215686, 1, 0, 1,
-0.6177989, 0.3989756, 0.6505107, 0.3137255, 1, 0, 1,
-0.6138892, 0.5751121, -0.3518375, 0.3098039, 1, 0, 1,
-0.6079364, 0.2589635, 0.3029802, 0.3019608, 1, 0, 1,
-0.6077358, -1.983482, -2.309243, 0.2941177, 1, 0, 1,
-0.6053513, -0.07455122, -1.985552, 0.2901961, 1, 0, 1,
-0.5974834, -1.021075, -2.805592, 0.282353, 1, 0, 1,
-0.5950073, 0.8634226, -1.45605, 0.2784314, 1, 0, 1,
-0.5910105, 0.2450318, -1.599998, 0.2705882, 1, 0, 1,
-0.584204, 0.3383021, -1.526243, 0.2666667, 1, 0, 1,
-0.5806068, 0.9361735, 0.2045531, 0.2588235, 1, 0, 1,
-0.5800138, 0.2191674, -0.4297206, 0.254902, 1, 0, 1,
-0.5789726, 1.783621, 0.221589, 0.2470588, 1, 0, 1,
-0.5787895, 0.1298582, -1.604217, 0.2431373, 1, 0, 1,
-0.5786921, 0.5079422, 0.3798269, 0.2352941, 1, 0, 1,
-0.5736799, 0.6247257, 0.518491, 0.2313726, 1, 0, 1,
-0.5730809, 0.2384215, -1.659159, 0.2235294, 1, 0, 1,
-0.571474, -0.8921212, -4.29896, 0.2196078, 1, 0, 1,
-0.5702788, -0.538897, -1.277414, 0.2117647, 1, 0, 1,
-0.5689198, 0.5392547, -1.11255, 0.2078431, 1, 0, 1,
-0.568404, -0.7205418, -0.80352, 0.2, 1, 0, 1,
-0.5620826, -1.13001, -3.754635, 0.1921569, 1, 0, 1,
-0.5601154, -1.173464, -4.060801, 0.1882353, 1, 0, 1,
-0.5598367, 2.056178, 1.022038, 0.1803922, 1, 0, 1,
-0.5513697, 0.795859, -2.310457, 0.1764706, 1, 0, 1,
-0.5476076, -0.7575876, -1.439015, 0.1686275, 1, 0, 1,
-0.5459737, 1.450751, -0.7285228, 0.1647059, 1, 0, 1,
-0.5437157, 0.4357391, -0.9871091, 0.1568628, 1, 0, 1,
-0.5434922, 0.4573916, -0.6466717, 0.1529412, 1, 0, 1,
-0.5419279, 0.6223381, -0.2375937, 0.145098, 1, 0, 1,
-0.5386706, 1.243556, 0.6186671, 0.1411765, 1, 0, 1,
-0.5371766, -0.8476228, -3.22051, 0.1333333, 1, 0, 1,
-0.5222696, 0.247537, -2.467747, 0.1294118, 1, 0, 1,
-0.5201814, 0.6659537, -0.1591135, 0.1215686, 1, 0, 1,
-0.5160118, 0.7451052, -1.067829, 0.1176471, 1, 0, 1,
-0.5154392, 0.1765659, -2.178083, 0.1098039, 1, 0, 1,
-0.5142462, 2.77396, 1.017308, 0.1058824, 1, 0, 1,
-0.5124269, -0.1395401, -2.596629, 0.09803922, 1, 0, 1,
-0.5123224, -0.123892, -2.626132, 0.09019608, 1, 0, 1,
-0.501514, -0.296686, -1.591213, 0.08627451, 1, 0, 1,
-0.500013, 0.2902358, -0.08994411, 0.07843138, 1, 0, 1,
-0.4909797, -0.04114707, -2.68298, 0.07450981, 1, 0, 1,
-0.4873718, 0.3483736, -3.774606, 0.06666667, 1, 0, 1,
-0.4842969, -0.7508598, -2.096664, 0.0627451, 1, 0, 1,
-0.4832004, -0.6758134, -3.641626, 0.05490196, 1, 0, 1,
-0.4821795, 1.067079, -1.25772, 0.05098039, 1, 0, 1,
-0.4806352, -0.07934573, -2.29228, 0.04313726, 1, 0, 1,
-0.4744036, 0.4757859, 0.8078622, 0.03921569, 1, 0, 1,
-0.4640327, 0.7774929, -1.006727, 0.03137255, 1, 0, 1,
-0.4638546, 0.4999149, -0.6444834, 0.02745098, 1, 0, 1,
-0.4589678, 1.693382, -0.3999495, 0.01960784, 1, 0, 1,
-0.4552299, 0.4745611, -1.491102, 0.01568628, 1, 0, 1,
-0.4473447, 0.8091051, -0.8851579, 0.007843138, 1, 0, 1,
-0.4457673, -0.009800398, -2.413197, 0.003921569, 1, 0, 1,
-0.4441873, 0.3039155, -0.7975072, 0, 1, 0.003921569, 1,
-0.4437871, 0.8392861, -2.402511, 0, 1, 0.01176471, 1,
-0.4375013, 0.2847286, -0.5785921, 0, 1, 0.01568628, 1,
-0.4313926, -0.5999468, -2.338563, 0, 1, 0.02352941, 1,
-0.4285114, 0.4671769, 0.241236, 0, 1, 0.02745098, 1,
-0.4268906, -1.928966, -4.538419, 0, 1, 0.03529412, 1,
-0.4267806, -0.3119892, -1.166545, 0, 1, 0.03921569, 1,
-0.4242669, -1.218744, -2.821135, 0, 1, 0.04705882, 1,
-0.4228919, 1.171041, 0.1303737, 0, 1, 0.05098039, 1,
-0.4222766, 0.315098, -1.403723, 0, 1, 0.05882353, 1,
-0.4179985, 0.06808571, -1.098168, 0, 1, 0.0627451, 1,
-0.4155722, 0.9445565, -1.963716, 0, 1, 0.07058824, 1,
-0.4149686, 1.054441, 1.85192, 0, 1, 0.07450981, 1,
-0.4148532, 0.655014, 0.5609043, 0, 1, 0.08235294, 1,
-0.4114093, -0.5956417, -3.933327, 0, 1, 0.08627451, 1,
-0.4107755, 1.068367, -0.02548315, 0, 1, 0.09411765, 1,
-0.4089754, 0.9159796, 0.7161953, 0, 1, 0.1019608, 1,
-0.4084297, 1.454306, -0.4449586, 0, 1, 0.1058824, 1,
-0.4010753, 1.077519, -0.7397398, 0, 1, 0.1137255, 1,
-0.3965524, 1.302678, -0.1163849, 0, 1, 0.1176471, 1,
-0.3915143, 0.8845649, -1.507956, 0, 1, 0.1254902, 1,
-0.3890671, -0.5911252, -2.654984, 0, 1, 0.1294118, 1,
-0.3872159, 0.4474263, -0.2117739, 0, 1, 0.1372549, 1,
-0.3840052, 0.4852477, -1.684512, 0, 1, 0.1411765, 1,
-0.3819791, -0.1226806, -1.997911, 0, 1, 0.1490196, 1,
-0.3804617, -0.3953746, -2.839831, 0, 1, 0.1529412, 1,
-0.3796858, -0.3829357, -1.375806, 0, 1, 0.1607843, 1,
-0.3775537, -0.6680393, -4.188955, 0, 1, 0.1647059, 1,
-0.3757627, -1.170026, -2.980149, 0, 1, 0.172549, 1,
-0.3734744, 1.813071, 0.6310239, 0, 1, 0.1764706, 1,
-0.3733362, 0.918429, -0.8663044, 0, 1, 0.1843137, 1,
-0.3720751, -1.546537, -3.859511, 0, 1, 0.1882353, 1,
-0.3705181, 2.362667, -1.504121, 0, 1, 0.1960784, 1,
-0.3671367, 0.6725397, 0.1454178, 0, 1, 0.2039216, 1,
-0.3648856, -0.3255422, -3.105185, 0, 1, 0.2078431, 1,
-0.3624689, 0.2080806, -0.8865861, 0, 1, 0.2156863, 1,
-0.3614745, -0.7636856, -3.88761, 0, 1, 0.2196078, 1,
-0.3605394, 0.001515132, -0.7455474, 0, 1, 0.227451, 1,
-0.3592227, 1.055075, -2.033147, 0, 1, 0.2313726, 1,
-0.3586025, 1.166993, -0.2827199, 0, 1, 0.2392157, 1,
-0.3578953, 1.638006, -0.4302145, 0, 1, 0.2431373, 1,
-0.3574528, -1.277088, -2.905801, 0, 1, 0.2509804, 1,
-0.3531136, -0.3830536, -2.701394, 0, 1, 0.254902, 1,
-0.3518028, -1.361809, -2.195966, 0, 1, 0.2627451, 1,
-0.3513458, -1.482015, -2.950377, 0, 1, 0.2666667, 1,
-0.3505751, -2.329854, -1.49417, 0, 1, 0.2745098, 1,
-0.3478493, 0.2218793, -0.8403289, 0, 1, 0.2784314, 1,
-0.3468623, 0.05715408, -1.665439, 0, 1, 0.2862745, 1,
-0.338688, 1.202568, 0.104156, 0, 1, 0.2901961, 1,
-0.3373454, -0.3552912, -2.020889, 0, 1, 0.2980392, 1,
-0.333269, 1.177765, 1.335363, 0, 1, 0.3058824, 1,
-0.3315537, 0.3654957, 0.1308145, 0, 1, 0.3098039, 1,
-0.3266465, -2.170861, -3.696352, 0, 1, 0.3176471, 1,
-0.31986, 0.5005979, -0.008743666, 0, 1, 0.3215686, 1,
-0.318327, 1.117916, -0.7870815, 0, 1, 0.3294118, 1,
-0.3159818, -1.338413, -3.657281, 0, 1, 0.3333333, 1,
-0.3114292, -1.031973, -3.008744, 0, 1, 0.3411765, 1,
-0.3033397, 0.9603627, 0.001855461, 0, 1, 0.345098, 1,
-0.3020892, 1.282021, 0.7755382, 0, 1, 0.3529412, 1,
-0.2976741, 0.8239502, -1.193563, 0, 1, 0.3568628, 1,
-0.2963462, 1.844221, -0.05106476, 0, 1, 0.3647059, 1,
-0.2871813, -0.8120497, -2.263503, 0, 1, 0.3686275, 1,
-0.2866385, 0.8269802, 0.646844, 0, 1, 0.3764706, 1,
-0.2836649, -1.269388, -2.228902, 0, 1, 0.3803922, 1,
-0.2773597, -1.405541, -4.048542, 0, 1, 0.3882353, 1,
-0.2766972, 0.4279917, 0.1036209, 0, 1, 0.3921569, 1,
-0.2746536, -0.2227078, -2.275957, 0, 1, 0.4, 1,
-0.2734786, 0.01196448, -0.05551765, 0, 1, 0.4078431, 1,
-0.2703979, -0.9156485, -3.441917, 0, 1, 0.4117647, 1,
-0.2680354, -1.980026, -3.662667, 0, 1, 0.4196078, 1,
-0.2677609, 1.035947, 0.62152, 0, 1, 0.4235294, 1,
-0.2673229, -0.1017798, -2.160212, 0, 1, 0.4313726, 1,
-0.2669199, 0.7463322, -2.122309, 0, 1, 0.4352941, 1,
-0.2624498, -1.153595, -0.6384724, 0, 1, 0.4431373, 1,
-0.2613883, -0.3297403, -2.335564, 0, 1, 0.4470588, 1,
-0.2605158, 0.8866929, -1.921495, 0, 1, 0.454902, 1,
-0.2592831, -0.3196855, -2.219116, 0, 1, 0.4588235, 1,
-0.2579177, 2.399505, -0.1331738, 0, 1, 0.4666667, 1,
-0.2577914, -1.014599, -6.03934, 0, 1, 0.4705882, 1,
-0.2569987, 0.4698938, -1.037362, 0, 1, 0.4784314, 1,
-0.2565647, -0.7324778, -3.575858, 0, 1, 0.4823529, 1,
-0.2551765, 0.8413497, 1.471009, 0, 1, 0.4901961, 1,
-0.2440773, 0.4178518, -0.5623591, 0, 1, 0.4941176, 1,
-0.2429561, 0.2944832, 0.03042507, 0, 1, 0.5019608, 1,
-0.2407898, -0.3536611, -3.059976, 0, 1, 0.509804, 1,
-0.2398156, -0.2069947, -2.90757, 0, 1, 0.5137255, 1,
-0.2391965, 0.9949215, -0.1342678, 0, 1, 0.5215687, 1,
-0.2366839, 0.5210645, -0.8837107, 0, 1, 0.5254902, 1,
-0.2362254, -0.0438699, -3.995942, 0, 1, 0.5333334, 1,
-0.2312886, 1.779848, -1.353775, 0, 1, 0.5372549, 1,
-0.2288422, -0.2193798, -2.811725, 0, 1, 0.5450981, 1,
-0.227584, 1.300983, -0.3301718, 0, 1, 0.5490196, 1,
-0.2245656, 0.7991953, -2.146037, 0, 1, 0.5568628, 1,
-0.2244498, -0.1517283, -2.596355, 0, 1, 0.5607843, 1,
-0.2231556, 1.228154, -0.784753, 0, 1, 0.5686275, 1,
-0.2212682, 0.7359674, 0.9031219, 0, 1, 0.572549, 1,
-0.2209639, 0.2602062, -1.639313, 0, 1, 0.5803922, 1,
-0.2200291, -0.2731605, -1.400129, 0, 1, 0.5843138, 1,
-0.2162789, 0.01714886, -3.345635, 0, 1, 0.5921569, 1,
-0.2151876, -0.287403, -2.50005, 0, 1, 0.5960785, 1,
-0.2107328, -0.550166, -3.711378, 0, 1, 0.6039216, 1,
-0.2098544, 0.9873636, 1.348353, 0, 1, 0.6117647, 1,
-0.2076953, 0.2155086, -0.6130006, 0, 1, 0.6156863, 1,
-0.2071478, 0.8314933, -0.1430809, 0, 1, 0.6235294, 1,
-0.2028298, 0.02233668, -1.917867, 0, 1, 0.627451, 1,
-0.2020579, -0.7010143, -2.385772, 0, 1, 0.6352941, 1,
-0.2015663, 2.261942, 0.4677576, 0, 1, 0.6392157, 1,
-0.2004504, 0.5728166, -0.8721277, 0, 1, 0.6470588, 1,
-0.1987842, 0.2408743, -0.8185044, 0, 1, 0.6509804, 1,
-0.1985607, 0.1819018, 0.7105956, 0, 1, 0.6588235, 1,
-0.1971883, 0.2135979, -1.839887, 0, 1, 0.6627451, 1,
-0.1940514, 0.52364, -0.03778108, 0, 1, 0.6705883, 1,
-0.1927507, 0.5907838, -0.6155672, 0, 1, 0.6745098, 1,
-0.1814522, -0.8407421, -3.116507, 0, 1, 0.682353, 1,
-0.1810716, 1.103966, -1.292852, 0, 1, 0.6862745, 1,
-0.1769757, -1.157395, -2.525429, 0, 1, 0.6941177, 1,
-0.176023, -0.4514478, -2.816009, 0, 1, 0.7019608, 1,
-0.1710843, 2.043766, -0.6023591, 0, 1, 0.7058824, 1,
-0.1688739, -1.750637, -2.075022, 0, 1, 0.7137255, 1,
-0.1660104, 1.622518, 0.388586, 0, 1, 0.7176471, 1,
-0.1643128, 0.4843459, -2.021456, 0, 1, 0.7254902, 1,
-0.1626147, -0.08287152, -1.576941, 0, 1, 0.7294118, 1,
-0.1600626, 0.8642668, -0.5143262, 0, 1, 0.7372549, 1,
-0.1555061, -0.601919, -1.338163, 0, 1, 0.7411765, 1,
-0.1513872, 1.849386, -0.8517317, 0, 1, 0.7490196, 1,
-0.1510011, 0.7918125, 0.7036755, 0, 1, 0.7529412, 1,
-0.1408783, -0.8772561, -2.358422, 0, 1, 0.7607843, 1,
-0.1394646, 1.378116, -0.98914, 0, 1, 0.7647059, 1,
-0.1373698, 0.06806578, -0.8684386, 0, 1, 0.772549, 1,
-0.136235, -1.466295, -4.128832, 0, 1, 0.7764706, 1,
-0.131925, -0.2254368, -3.292873, 0, 1, 0.7843137, 1,
-0.1302581, 1.101453, -0.2565542, 0, 1, 0.7882353, 1,
-0.1213828, 1.052536, 0.9345337, 0, 1, 0.7960784, 1,
-0.1202863, -0.1406825, -0.7300774, 0, 1, 0.8039216, 1,
-0.1190972, -0.4091065, -3.132206, 0, 1, 0.8078431, 1,
-0.1161387, 0.874245, 0.357554, 0, 1, 0.8156863, 1,
-0.1158878, -0.08814067, -2.488648, 0, 1, 0.8196079, 1,
-0.1135384, 1.728562, 0.6543881, 0, 1, 0.827451, 1,
-0.1093148, 1.2048, 1.634648, 0, 1, 0.8313726, 1,
-0.1068008, -0.6139596, -3.185702, 0, 1, 0.8392157, 1,
-0.1059882, 0.2308665, -1.114735, 0, 1, 0.8431373, 1,
-0.1038842, 0.2121185, -1.25796, 0, 1, 0.8509804, 1,
-0.1010987, 1.077891, 0.06792688, 0, 1, 0.854902, 1,
-0.09443419, -0.1228325, -1.561914, 0, 1, 0.8627451, 1,
-0.08952716, -1.025615, -3.305837, 0, 1, 0.8666667, 1,
-0.08741542, -0.1584661, -2.874748, 0, 1, 0.8745098, 1,
-0.08207362, 1.046253, -1.296453, 0, 1, 0.8784314, 1,
-0.08180765, -1.77605, -1.9619, 0, 1, 0.8862745, 1,
-0.0814555, 0.3855484, 0.596103, 0, 1, 0.8901961, 1,
-0.06921338, 0.8675654, -0.01980856, 0, 1, 0.8980392, 1,
-0.06795982, -1.405592, -2.711378, 0, 1, 0.9058824, 1,
-0.06270141, 0.667258, -0.7964504, 0, 1, 0.9098039, 1,
-0.06040804, 0.6263105, -2.664719, 0, 1, 0.9176471, 1,
-0.05950819, 0.1721817, -0.8989245, 0, 1, 0.9215686, 1,
-0.05604467, 0.8473797, -0.265487, 0, 1, 0.9294118, 1,
-0.04992967, 0.2031174, -0.8864943, 0, 1, 0.9333333, 1,
-0.04590488, -0.1454521, -3.967294, 0, 1, 0.9411765, 1,
-0.04400377, -0.3906462, -1.588845, 0, 1, 0.945098, 1,
-0.04372478, 1.317183, 0.9905588, 0, 1, 0.9529412, 1,
-0.04239389, 1.072851, 0.3981481, 0, 1, 0.9568627, 1,
-0.04208898, -1.26397, -1.355678, 0, 1, 0.9647059, 1,
-0.0402691, 0.4608419, -0.636854, 0, 1, 0.9686275, 1,
-0.03737951, -1.682505, -3.328084, 0, 1, 0.9764706, 1,
-0.03677376, 0.4763815, -0.5129341, 0, 1, 0.9803922, 1,
-0.03412132, 1.123511, 1.368579, 0, 1, 0.9882353, 1,
-0.03016539, 1.560951, -0.3800825, 0, 1, 0.9921569, 1,
-0.02862354, -0.5539214, -2.824965, 0, 1, 1, 1,
-0.02800479, -0.9108179, -2.871941, 0, 0.9921569, 1, 1,
-0.01036001, 1.964011, 0.6015702, 0, 0.9882353, 1, 1,
-0.007993829, -0.2110822, -3.176518, 0, 0.9803922, 1, 1,
-0.006366998, 0.3633873, 0.09947715, 0, 0.9764706, 1, 1,
-0.003367573, 1.214682, -0.1858585, 0, 0.9686275, 1, 1,
-0.001445288, 1.317884, 0.0904851, 0, 0.9647059, 1, 1,
0.00175693, -0.1925009, 1.992898, 0, 0.9568627, 1, 1,
0.007788526, -1.180183, 2.467768, 0, 0.9529412, 1, 1,
0.009870141, 0.44138, 1.006739, 0, 0.945098, 1, 1,
0.009895346, -1.582776, 1.9583, 0, 0.9411765, 1, 1,
0.009937025, 0.9341406, -1.135414, 0, 0.9333333, 1, 1,
0.01402317, -0.09873503, 2.54777, 0, 0.9294118, 1, 1,
0.01435009, 1.0948, 1.073018, 0, 0.9215686, 1, 1,
0.01770262, 0.7295995, 0.7254635, 0, 0.9176471, 1, 1,
0.02132033, -0.5599538, 3.63819, 0, 0.9098039, 1, 1,
0.03861921, 1.41874, -1.064186, 0, 0.9058824, 1, 1,
0.04363589, 0.3989225, -0.8163677, 0, 0.8980392, 1, 1,
0.04468098, -0.4791111, 2.730674, 0, 0.8901961, 1, 1,
0.0456818, -0.117559, 1.440395, 0, 0.8862745, 1, 1,
0.04890573, -1.104232, 2.04861, 0, 0.8784314, 1, 1,
0.05104982, -1.257486, 4.221936, 0, 0.8745098, 1, 1,
0.052086, 1.643011, 0.1359559, 0, 0.8666667, 1, 1,
0.056943, 2.957449, 2.391481, 0, 0.8627451, 1, 1,
0.05712034, 0.3477567, 0.2422707, 0, 0.854902, 1, 1,
0.05795291, -0.5771142, 3.668926, 0, 0.8509804, 1, 1,
0.06554899, 0.6915159, -0.8041988, 0, 0.8431373, 1, 1,
0.06677108, 0.7727954, 0.6023485, 0, 0.8392157, 1, 1,
0.06767683, -0.6871547, 3.224461, 0, 0.8313726, 1, 1,
0.06975053, -1.334063, 2.702405, 0, 0.827451, 1, 1,
0.0802189, 0.7553971, -0.9653792, 0, 0.8196079, 1, 1,
0.08418001, -0.5905377, 2.800712, 0, 0.8156863, 1, 1,
0.08658112, -0.2680444, 2.649531, 0, 0.8078431, 1, 1,
0.08880268, -2.382447, 2.995275, 0, 0.8039216, 1, 1,
0.09166124, 0.08450364, 1.39793, 0, 0.7960784, 1, 1,
0.09327574, -3.029162, 3.487378, 0, 0.7882353, 1, 1,
0.0936016, 0.1182484, 0.3647248, 0, 0.7843137, 1, 1,
0.09408548, -0.7465684, 3.279078, 0, 0.7764706, 1, 1,
0.09583151, -0.8155378, 3.852409, 0, 0.772549, 1, 1,
0.09698445, 0.07075554, -0.01653318, 0, 0.7647059, 1, 1,
0.1006714, -1.050682, 2.847366, 0, 0.7607843, 1, 1,
0.1083877, -0.1402071, 2.870837, 0, 0.7529412, 1, 1,
0.1089273, 0.5528504, 0.7052467, 0, 0.7490196, 1, 1,
0.1132431, 0.04696355, 1.095286, 0, 0.7411765, 1, 1,
0.1265768, 0.7141352, -0.850591, 0, 0.7372549, 1, 1,
0.1305446, 0.3779495, 1.022369, 0, 0.7294118, 1, 1,
0.1306487, 0.4408813, 1.14301, 0, 0.7254902, 1, 1,
0.1310061, 0.306334, -1.457385, 0, 0.7176471, 1, 1,
0.1321197, -1.115808, 3.083535, 0, 0.7137255, 1, 1,
0.13412, 0.02382673, 0.8755376, 0, 0.7058824, 1, 1,
0.1347177, 0.2334428, 0.2601547, 0, 0.6980392, 1, 1,
0.1366957, -0.0429813, 0.5880077, 0, 0.6941177, 1, 1,
0.1381545, 0.569221, 1.529107, 0, 0.6862745, 1, 1,
0.1400414, -1.195589, 2.928718, 0, 0.682353, 1, 1,
0.1439074, 0.01323195, 2.477369, 0, 0.6745098, 1, 1,
0.1489877, 0.7035283, 1.2971, 0, 0.6705883, 1, 1,
0.1521594, -0.5795584, 3.902239, 0, 0.6627451, 1, 1,
0.1521733, -0.2058967, 3.158877, 0, 0.6588235, 1, 1,
0.1524299, 1.062764, 0.6966141, 0, 0.6509804, 1, 1,
0.1530064, 2.108707, 0.5613552, 0, 0.6470588, 1, 1,
0.159572, -1.613124, 3.570684, 0, 0.6392157, 1, 1,
0.1606134, -1.592439, 3.163972, 0, 0.6352941, 1, 1,
0.1639288, 1.217509, 1.170539, 0, 0.627451, 1, 1,
0.1643888, -1.022582, 2.744848, 0, 0.6235294, 1, 1,
0.1649415, -1.081369, 2.710982, 0, 0.6156863, 1, 1,
0.168424, 0.4869874, 0.5536044, 0, 0.6117647, 1, 1,
0.1700746, 0.1408077, -1.383578, 0, 0.6039216, 1, 1,
0.1707749, -1.107383, 1.646002, 0, 0.5960785, 1, 1,
0.1726019, -1.018403, 3.251932, 0, 0.5921569, 1, 1,
0.1738849, 1.552801, 0.1633283, 0, 0.5843138, 1, 1,
0.183771, 0.4777048, -0.7687538, 0, 0.5803922, 1, 1,
0.1848257, 1.038823, 0.1915959, 0, 0.572549, 1, 1,
0.1870229, -0.1421497, 1.499939, 0, 0.5686275, 1, 1,
0.1891273, -1.75705, 3.731635, 0, 0.5607843, 1, 1,
0.1900142, -1.303415, 4.026284, 0, 0.5568628, 1, 1,
0.1959159, -2.411792, 3.089925, 0, 0.5490196, 1, 1,
0.1980398, 0.3337639, 0.7844139, 0, 0.5450981, 1, 1,
0.2000952, 0.9054058, -0.4168326, 0, 0.5372549, 1, 1,
0.2052293, 0.2508449, 1.528511, 0, 0.5333334, 1, 1,
0.2061384, -0.2737187, 4.250537, 0, 0.5254902, 1, 1,
0.2067591, 1.060715, -0.8000501, 0, 0.5215687, 1, 1,
0.2070474, 0.6568596, 0.6872202, 0, 0.5137255, 1, 1,
0.2089864, -0.4408202, 1.50449, 0, 0.509804, 1, 1,
0.215894, 1.184566, -0.8069169, 0, 0.5019608, 1, 1,
0.2190927, 0.07977464, 0.2286693, 0, 0.4941176, 1, 1,
0.2198783, -2.075419, 2.771142, 0, 0.4901961, 1, 1,
0.2227325, 0.3333703, 1.509311, 0, 0.4823529, 1, 1,
0.2236095, 1.003302, -1.761183, 0, 0.4784314, 1, 1,
0.2265464, 2.021482, -1.432083, 0, 0.4705882, 1, 1,
0.2289719, -0.9514929, 1.392401, 0, 0.4666667, 1, 1,
0.2307749, -0.3936432, 3.690241, 0, 0.4588235, 1, 1,
0.2347055, 1.294379, -2.036061, 0, 0.454902, 1, 1,
0.239277, 2.999409, 0.06320769, 0, 0.4470588, 1, 1,
0.2416597, -0.2795318, 1.827383, 0, 0.4431373, 1, 1,
0.2483669, 3.103743, -0.3011863, 0, 0.4352941, 1, 1,
0.2485041, 0.3875729, -0.7958716, 0, 0.4313726, 1, 1,
0.2510678, 0.4578313, 1.266763, 0, 0.4235294, 1, 1,
0.2539315, 1.402062, -0.06249735, 0, 0.4196078, 1, 1,
0.2628463, -0.3212238, 3.844007, 0, 0.4117647, 1, 1,
0.2635975, -0.5367939, 1.185536, 0, 0.4078431, 1, 1,
0.2665334, -0.4960732, 3.085705, 0, 0.4, 1, 1,
0.2723188, 0.2884465, 0.1068037, 0, 0.3921569, 1, 1,
0.2723517, -1.450194, 3.530683, 0, 0.3882353, 1, 1,
0.2728535, 0.3174752, 2.360419, 0, 0.3803922, 1, 1,
0.2732833, -0.7928807, 2.055386, 0, 0.3764706, 1, 1,
0.2741719, 2.834052, 0.9544347, 0, 0.3686275, 1, 1,
0.2754355, -0.99622, 3.996762, 0, 0.3647059, 1, 1,
0.2761135, 1.521912, 0.3416807, 0, 0.3568628, 1, 1,
0.2800025, 0.2024134, 0.6666045, 0, 0.3529412, 1, 1,
0.2845654, -0.3867193, 0.992849, 0, 0.345098, 1, 1,
0.2878424, 2.314702, 0.6324921, 0, 0.3411765, 1, 1,
0.2903252, -1.040732, 2.119905, 0, 0.3333333, 1, 1,
0.2948227, 0.2770809, 1.092603, 0, 0.3294118, 1, 1,
0.2980865, -0.9237598, 2.989446, 0, 0.3215686, 1, 1,
0.2981121, -0.1941775, 0.6589103, 0, 0.3176471, 1, 1,
0.2982591, -0.8002524, 2.456157, 0, 0.3098039, 1, 1,
0.2995693, -1.141847, 1.919438, 0, 0.3058824, 1, 1,
0.2998853, -0.4261037, 4.797036, 0, 0.2980392, 1, 1,
0.3022859, -2.075772, 2.726077, 0, 0.2901961, 1, 1,
0.3024935, -0.2188058, 4.135405, 0, 0.2862745, 1, 1,
0.3040942, 0.08215064, 1.11725, 0, 0.2784314, 1, 1,
0.3075079, 0.8245341, 0.8692345, 0, 0.2745098, 1, 1,
0.3103123, -1.031881, 1.693161, 0, 0.2666667, 1, 1,
0.3128049, -0.1351635, 1.69242, 0, 0.2627451, 1, 1,
0.3154126, -0.4617994, 0.3927209, 0, 0.254902, 1, 1,
0.317571, 0.1718577, 0.5747777, 0, 0.2509804, 1, 1,
0.3186553, -0.568459, 4.302817, 0, 0.2431373, 1, 1,
0.3214072, -0.5640563, 2.388374, 0, 0.2392157, 1, 1,
0.3229665, -1.69077, 3.326518, 0, 0.2313726, 1, 1,
0.3231625, 0.3960515, 1.53427, 0, 0.227451, 1, 1,
0.3272689, -2.06099, 3.53982, 0, 0.2196078, 1, 1,
0.3279172, -0.4100327, 1.449477, 0, 0.2156863, 1, 1,
0.3310776, 0.9018567, 0.03813045, 0, 0.2078431, 1, 1,
0.3312114, 1.218946, 0.7715965, 0, 0.2039216, 1, 1,
0.3351047, 0.7263131, 1.016763, 0, 0.1960784, 1, 1,
0.3353837, 0.6525491, -1.066446, 0, 0.1882353, 1, 1,
0.3363235, -1.434181, 2.907593, 0, 0.1843137, 1, 1,
0.3373222, -0.07571679, 1.423226, 0, 0.1764706, 1, 1,
0.3380632, 0.2336514, 1.937051, 0, 0.172549, 1, 1,
0.3383308, 0.6437052, 1.05522, 0, 0.1647059, 1, 1,
0.3406239, 0.3871868, 0.383615, 0, 0.1607843, 1, 1,
0.342228, 2.367018, -1.049688, 0, 0.1529412, 1, 1,
0.3446629, 0.5348209, 2.219242, 0, 0.1490196, 1, 1,
0.350715, -0.3254471, 0.7327971, 0, 0.1411765, 1, 1,
0.352269, 0.5346138, 0.1688198, 0, 0.1372549, 1, 1,
0.3528405, -1.181117, 1.527796, 0, 0.1294118, 1, 1,
0.3532144, -0.7697394, -0.09406266, 0, 0.1254902, 1, 1,
0.353713, -1.584504, 3.192792, 0, 0.1176471, 1, 1,
0.3640804, 0.7474989, -0.5361267, 0, 0.1137255, 1, 1,
0.3641839, -1.044682, 4.072467, 0, 0.1058824, 1, 1,
0.3712786, 0.2298571, 1.368101, 0, 0.09803922, 1, 1,
0.3730097, -1.169106, 3.344765, 0, 0.09411765, 1, 1,
0.3746644, 0.2878307, 0.8848945, 0, 0.08627451, 1, 1,
0.3747546, 0.3445802, 0.8685833, 0, 0.08235294, 1, 1,
0.3824242, 0.3211963, -1.270469, 0, 0.07450981, 1, 1,
0.3840082, -0.3180348, 1.559843, 0, 0.07058824, 1, 1,
0.3857206, -0.8920649, 1.15412, 0, 0.0627451, 1, 1,
0.3880639, -0.09718782, 1.727136, 0, 0.05882353, 1, 1,
0.3898768, -0.8687238, 4.22703, 0, 0.05098039, 1, 1,
0.3929654, 0.7152174, 0.6572517, 0, 0.04705882, 1, 1,
0.3942635, 0.1849914, 2.24734, 0, 0.03921569, 1, 1,
0.3945529, 0.5165231, 0.618566, 0, 0.03529412, 1, 1,
0.3962641, -0.2139846, 3.586567, 0, 0.02745098, 1, 1,
0.3966689, 0.8404696, 1.005913, 0, 0.02352941, 1, 1,
0.3985905, -0.296651, 3.910942, 0, 0.01568628, 1, 1,
0.3988321, 0.9086707, -1.222353, 0, 0.01176471, 1, 1,
0.4008965, -1.435106, 3.059785, 0, 0.003921569, 1, 1,
0.4013213, 0.465295, 0.3236907, 0.003921569, 0, 1, 1,
0.4021984, 0.1103579, 1.001022, 0.007843138, 0, 1, 1,
0.4046732, 0.219142, 1.712431, 0.01568628, 0, 1, 1,
0.4053289, -0.3580484, 2.481632, 0.01960784, 0, 1, 1,
0.4067669, 1.591964, 1.042619, 0.02745098, 0, 1, 1,
0.4114237, -0.5832197, 1.62497, 0.03137255, 0, 1, 1,
0.4140254, -0.5862672, 2.976205, 0.03921569, 0, 1, 1,
0.4177273, -2.689468, 3.674152, 0.04313726, 0, 1, 1,
0.4188447, 0.6991569, 0.07854862, 0.05098039, 0, 1, 1,
0.4208527, 0.07099755, 1.908633, 0.05490196, 0, 1, 1,
0.4227003, 1.462502, 0.8205868, 0.0627451, 0, 1, 1,
0.4246045, 0.8928489, 0.7785849, 0.06666667, 0, 1, 1,
0.4268419, -0.0579878, 0.5434814, 0.07450981, 0, 1, 1,
0.4276956, -0.4265864, 3.580978, 0.07843138, 0, 1, 1,
0.4316463, 0.9266909, 1.688959, 0.08627451, 0, 1, 1,
0.4399607, -0.6037058, 2.611725, 0.09019608, 0, 1, 1,
0.4437116, 0.9569234, 0.6671118, 0.09803922, 0, 1, 1,
0.443912, -0.88708, 2.238189, 0.1058824, 0, 1, 1,
0.4460401, 1.393279, 0.0779248, 0.1098039, 0, 1, 1,
0.4473589, -0.158791, 1.280121, 0.1176471, 0, 1, 1,
0.4536365, -0.9502084, 1.924163, 0.1215686, 0, 1, 1,
0.45682, 0.3171908, 1.582353, 0.1294118, 0, 1, 1,
0.4570123, 0.4826917, 1.195384, 0.1333333, 0, 1, 1,
0.4580055, 0.460438, 1.830096, 0.1411765, 0, 1, 1,
0.4580862, 1.041116, 1.365517, 0.145098, 0, 1, 1,
0.4668359, 1.570233, -1.016203, 0.1529412, 0, 1, 1,
0.468343, 0.6321817, 0.8335102, 0.1568628, 0, 1, 1,
0.4712485, 1.373906, 0.3562665, 0.1647059, 0, 1, 1,
0.4714262, -0.2284589, 1.282129, 0.1686275, 0, 1, 1,
0.4744162, -0.4383963, 1.715588, 0.1764706, 0, 1, 1,
0.4751596, -0.8163417, 2.91292, 0.1803922, 0, 1, 1,
0.4776131, 0.97646, 1.621214, 0.1882353, 0, 1, 1,
0.4847331, 1.200806, 0.5666793, 0.1921569, 0, 1, 1,
0.4849996, -1.65583, 2.350481, 0.2, 0, 1, 1,
0.4850005, 1.281518, 1.858791, 0.2078431, 0, 1, 1,
0.4850901, -1.195839, 2.881656, 0.2117647, 0, 1, 1,
0.4861571, 2.393573, -0.02236654, 0.2196078, 0, 1, 1,
0.4870874, 0.5203233, 0.6917967, 0.2235294, 0, 1, 1,
0.4871555, 0.5607255, -1.868477, 0.2313726, 0, 1, 1,
0.4901019, -2.095712, 1.348854, 0.2352941, 0, 1, 1,
0.4907316, -1.030971, 2.863692, 0.2431373, 0, 1, 1,
0.497045, 0.6209245, 1.696521, 0.2470588, 0, 1, 1,
0.5048602, -0.01232156, 2.501805, 0.254902, 0, 1, 1,
0.5049716, -0.2556682, 1.888189, 0.2588235, 0, 1, 1,
0.5058601, 0.7180076, 0.0215651, 0.2666667, 0, 1, 1,
0.5093389, 1.507653, 1.327773, 0.2705882, 0, 1, 1,
0.50968, -1.07339, 4.501615, 0.2784314, 0, 1, 1,
0.5121333, -1.263152, 1.651784, 0.282353, 0, 1, 1,
0.5135335, 0.9028034, 0.1517471, 0.2901961, 0, 1, 1,
0.5244374, 0.5502043, -1.120258, 0.2941177, 0, 1, 1,
0.5392075, -0.4671859, 2.773663, 0.3019608, 0, 1, 1,
0.5394417, -0.4293625, 3.609967, 0.3098039, 0, 1, 1,
0.5424822, 1.385126, -0.8609954, 0.3137255, 0, 1, 1,
0.5439737, -0.3062202, 2.774295, 0.3215686, 0, 1, 1,
0.5555309, -0.5583587, 3.968972, 0.3254902, 0, 1, 1,
0.556001, 1.06012, -1.303137, 0.3333333, 0, 1, 1,
0.5575994, 1.31129, 0.8656763, 0.3372549, 0, 1, 1,
0.560632, -0.5152329, 2.096274, 0.345098, 0, 1, 1,
0.5627261, -1.309616, 2.675383, 0.3490196, 0, 1, 1,
0.564408, 0.4359797, -0.4550409, 0.3568628, 0, 1, 1,
0.5645923, -2.624394, 2.986693, 0.3607843, 0, 1, 1,
0.5646745, -1.748822, 2.211493, 0.3686275, 0, 1, 1,
0.5653095, -0.7954431, 2.78392, 0.372549, 0, 1, 1,
0.5700462, -0.5829283, 1.46611, 0.3803922, 0, 1, 1,
0.5709607, 0.6973062, -0.4877535, 0.3843137, 0, 1, 1,
0.5750788, 2.257613, 0.2343039, 0.3921569, 0, 1, 1,
0.5759912, -0.04711102, 1.997437, 0.3960784, 0, 1, 1,
0.5825998, -0.3759518, 2.073729, 0.4039216, 0, 1, 1,
0.5854132, -0.2672067, 3.051402, 0.4117647, 0, 1, 1,
0.5903478, -0.9203588, 2.720356, 0.4156863, 0, 1, 1,
0.5945615, 0.7044744, 0.5957637, 0.4235294, 0, 1, 1,
0.5975671, -1.530666, 2.496392, 0.427451, 0, 1, 1,
0.5992855, 0.03844539, 1.186058, 0.4352941, 0, 1, 1,
0.6037666, 1.126804, 0.3100143, 0.4392157, 0, 1, 1,
0.6080442, -0.4534934, 2.258426, 0.4470588, 0, 1, 1,
0.6083525, -0.3051844, 0.6334696, 0.4509804, 0, 1, 1,
0.6137708, -0.3087304, 1.049524, 0.4588235, 0, 1, 1,
0.6284754, 0.4595397, -1.088926, 0.4627451, 0, 1, 1,
0.6314803, 2.470409, 0.3213488, 0.4705882, 0, 1, 1,
0.6355641, -1.076404, 2.13413, 0.4745098, 0, 1, 1,
0.6372086, -1.171337, 1.074866, 0.4823529, 0, 1, 1,
0.6543593, -1.464236, 4.195039, 0.4862745, 0, 1, 1,
0.6566334, -1.620639, 3.300061, 0.4941176, 0, 1, 1,
0.6592495, 0.6529257, 0.5962549, 0.5019608, 0, 1, 1,
0.6698936, -0.1373607, 1.945426, 0.5058824, 0, 1, 1,
0.6711591, 1.468639, 0.2675402, 0.5137255, 0, 1, 1,
0.6863386, -0.4063961, 3.292059, 0.5176471, 0, 1, 1,
0.6875905, -0.1325408, 0.9799926, 0.5254902, 0, 1, 1,
0.6894506, -0.159756, 1.748296, 0.5294118, 0, 1, 1,
0.6914088, -0.3253483, 1.990684, 0.5372549, 0, 1, 1,
0.6946692, 0.9325699, 0.2467937, 0.5411765, 0, 1, 1,
0.6959725, -0.5882281, 0.5665066, 0.5490196, 0, 1, 1,
0.7038609, 0.1788177, 0.4131104, 0.5529412, 0, 1, 1,
0.704116, 0.4678059, 0.3738272, 0.5607843, 0, 1, 1,
0.7051362, -0.2846454, 0.4799043, 0.5647059, 0, 1, 1,
0.7084349, -1.058631, 2.858357, 0.572549, 0, 1, 1,
0.7089398, -0.2074512, 2.702247, 0.5764706, 0, 1, 1,
0.7105939, -0.4925414, 2.858093, 0.5843138, 0, 1, 1,
0.7130924, 0.472707, 0.810441, 0.5882353, 0, 1, 1,
0.7145418, -0.3574921, 1.42781, 0.5960785, 0, 1, 1,
0.72347, 0.1653575, 1.780073, 0.6039216, 0, 1, 1,
0.7281647, -0.7422348, 2.128653, 0.6078432, 0, 1, 1,
0.7299836, -0.7432653, 2.373231, 0.6156863, 0, 1, 1,
0.7362425, -0.2569767, 2.450824, 0.6196079, 0, 1, 1,
0.7506561, 0.5061871, 2.022259, 0.627451, 0, 1, 1,
0.7526948, 0.4891441, 2.14974, 0.6313726, 0, 1, 1,
0.7531255, -1.098858, 1.292731, 0.6392157, 0, 1, 1,
0.7539564, 1.112469, 0.3410206, 0.6431373, 0, 1, 1,
0.7591378, 0.5184533, 2.613408, 0.6509804, 0, 1, 1,
0.7618279, 1.642759, -1.161772, 0.654902, 0, 1, 1,
0.7623055, -1.32216, 2.952248, 0.6627451, 0, 1, 1,
0.7649665, -1.244828, 3.191832, 0.6666667, 0, 1, 1,
0.7703755, 0.06151862, 0.1185022, 0.6745098, 0, 1, 1,
0.7724311, -1.111176, 2.027255, 0.6784314, 0, 1, 1,
0.7729444, 0.8470359, 0.7603444, 0.6862745, 0, 1, 1,
0.7752291, 0.4273541, -0.7054037, 0.6901961, 0, 1, 1,
0.7754275, 0.8943136, 1.488233, 0.6980392, 0, 1, 1,
0.7790396, 0.4138979, 0.9115791, 0.7058824, 0, 1, 1,
0.780134, 0.1344412, 0.5849515, 0.7098039, 0, 1, 1,
0.7873809, -0.213765, 2.951654, 0.7176471, 0, 1, 1,
0.7911444, 1.222226, 0.742054, 0.7215686, 0, 1, 1,
0.7931385, 0.3022313, 2.105933, 0.7294118, 0, 1, 1,
0.7980859, -0.2201142, 2.873848, 0.7333333, 0, 1, 1,
0.7992561, -1.402253, 1.81554, 0.7411765, 0, 1, 1,
0.8070463, -2.451671, 4.312508, 0.7450981, 0, 1, 1,
0.8094221, 0.4177882, 2.932289, 0.7529412, 0, 1, 1,
0.8095761, -1.048161, 2.796315, 0.7568628, 0, 1, 1,
0.8099357, 0.09121224, 1.517341, 0.7647059, 0, 1, 1,
0.8253396, -1.66069, 3.300508, 0.7686275, 0, 1, 1,
0.82627, 1.060994, 1.78971, 0.7764706, 0, 1, 1,
0.8284956, -0.117505, 2.505944, 0.7803922, 0, 1, 1,
0.8312006, -0.2177591, 0.9273597, 0.7882353, 0, 1, 1,
0.8364033, 0.3639505, 2.380105, 0.7921569, 0, 1, 1,
0.8412269, -0.08421612, 2.93126, 0.8, 0, 1, 1,
0.8417467, -0.894311, 1.925231, 0.8078431, 0, 1, 1,
0.8564107, -0.6603252, 2.953077, 0.8117647, 0, 1, 1,
0.8590476, -0.2218681, 1.191034, 0.8196079, 0, 1, 1,
0.8592976, 1.444378, -1.001114, 0.8235294, 0, 1, 1,
0.8625224, -1.399493, 4.463532, 0.8313726, 0, 1, 1,
0.8631518, -1.176328, 2.30441, 0.8352941, 0, 1, 1,
0.8663738, -0.5553181, 0.4151501, 0.8431373, 0, 1, 1,
0.8691478, -0.6239672, 2.107198, 0.8470588, 0, 1, 1,
0.8741457, 0.3953896, 2.825716, 0.854902, 0, 1, 1,
0.8780513, -1.105726, 1.993919, 0.8588235, 0, 1, 1,
0.8821263, 1.066773, 0.2978891, 0.8666667, 0, 1, 1,
0.8841868, -0.4234599, 4.458402, 0.8705882, 0, 1, 1,
0.8852422, 0.5431712, -0.04234683, 0.8784314, 0, 1, 1,
0.8897156, 1.550022, 1.734726, 0.8823529, 0, 1, 1,
0.8910416, -0.5944948, 2.10588, 0.8901961, 0, 1, 1,
0.8923465, 0.6692895, 0.9976357, 0.8941177, 0, 1, 1,
0.8973023, 2.309129, 0.6603445, 0.9019608, 0, 1, 1,
0.9001245, -0.122352, 1.435057, 0.9098039, 0, 1, 1,
0.9016714, -0.6554307, 2.593938, 0.9137255, 0, 1, 1,
0.9025162, -1.05692, 0.5085324, 0.9215686, 0, 1, 1,
0.9080561, -0.5828894, 2.360263, 0.9254902, 0, 1, 1,
0.9129725, 1.103245, 1.267355, 0.9333333, 0, 1, 1,
0.9157106, 0.08690592, 1.297498, 0.9372549, 0, 1, 1,
0.9176716, -0.7022045, 1.607235, 0.945098, 0, 1, 1,
0.9183396, 1.693452, 2.174757, 0.9490196, 0, 1, 1,
0.9187256, -0.1281115, 3.175396, 0.9568627, 0, 1, 1,
0.9267982, 1.33722, 1.25833, 0.9607843, 0, 1, 1,
0.9270353, -0.4906071, 0.8846983, 0.9686275, 0, 1, 1,
0.9275188, 0.4392212, 1.322725, 0.972549, 0, 1, 1,
0.9308327, -0.4279792, 2.429359, 0.9803922, 0, 1, 1,
0.933994, -1.150975, 1.670652, 0.9843137, 0, 1, 1,
0.9419714, -0.219865, -0.1982326, 0.9921569, 0, 1, 1,
0.942086, 0.8357275, -0.142676, 0.9960784, 0, 1, 1,
0.9462629, -0.2381953, 1.391749, 1, 0, 0.9960784, 1,
0.9477593, 0.5743808, 0.3593065, 1, 0, 0.9882353, 1,
0.9509718, -0.2885182, 0.5312499, 1, 0, 0.9843137, 1,
0.9519939, -0.2954625, 1.944638, 1, 0, 0.9764706, 1,
0.9591311, 0.2158828, 2.010284, 1, 0, 0.972549, 1,
0.9683749, -0.2436572, 0.5066286, 1, 0, 0.9647059, 1,
0.9698067, 0.7680755, 3.098357, 1, 0, 0.9607843, 1,
0.9786151, -0.8846523, 0.8545701, 1, 0, 0.9529412, 1,
0.9851046, 0.1691666, 2.370564, 1, 0, 0.9490196, 1,
1.000851, -0.7809144, 2.719681, 1, 0, 0.9411765, 1,
1.001373, -1.705266, 3.707564, 1, 0, 0.9372549, 1,
1.002099, -0.1926657, 0.3561426, 1, 0, 0.9294118, 1,
1.010242, -1.818378, 1.979944, 1, 0, 0.9254902, 1,
1.014615, -0.1928423, 1.153355, 1, 0, 0.9176471, 1,
1.020061, -0.5283757, 1.218642, 1, 0, 0.9137255, 1,
1.030498, -0.2528956, 1.655032, 1, 0, 0.9058824, 1,
1.035282, 1.312399, 1.516214, 1, 0, 0.9019608, 1,
1.036316, -0.6923477, 1.200302, 1, 0, 0.8941177, 1,
1.049486, 1.423154, 2.158411, 1, 0, 0.8862745, 1,
1.059585, 0.9295331, -0.4510509, 1, 0, 0.8823529, 1,
1.064653, -0.6595169, 2.747751, 1, 0, 0.8745098, 1,
1.066285, -0.764073, 4.175627, 1, 0, 0.8705882, 1,
1.074854, -1.321189, 0.6873821, 1, 0, 0.8627451, 1,
1.075058, 1.294785, 0.403692, 1, 0, 0.8588235, 1,
1.076367, -2.058443, 3.273873, 1, 0, 0.8509804, 1,
1.080283, 0.8703083, 1.962743, 1, 0, 0.8470588, 1,
1.080546, -0.5413141, 1.725557, 1, 0, 0.8392157, 1,
1.089708, 0.6970297, 0.1832719, 1, 0, 0.8352941, 1,
1.098644, 1.391455, -0.2434588, 1, 0, 0.827451, 1,
1.109663, -1.050384, 1.751847, 1, 0, 0.8235294, 1,
1.110291, 0.1142238, 1.639537, 1, 0, 0.8156863, 1,
1.121573, -1.909987, 0.7589592, 1, 0, 0.8117647, 1,
1.152536, -0.5862169, 2.268593, 1, 0, 0.8039216, 1,
1.158288, -0.9100112, 2.787499, 1, 0, 0.7960784, 1,
1.160162, 0.1441656, 1.715397, 1, 0, 0.7921569, 1,
1.161846, -1.355755, 3.525927, 1, 0, 0.7843137, 1,
1.168206, -1.359042, 2.322728, 1, 0, 0.7803922, 1,
1.168744, 0.03444717, 1.190234, 1, 0, 0.772549, 1,
1.170389, 0.4147008, -0.1712503, 1, 0, 0.7686275, 1,
1.173991, 0.1095259, 3.163381, 1, 0, 0.7607843, 1,
1.192338, 1.425214, 2.575254, 1, 0, 0.7568628, 1,
1.193372, -1.205005, 3.679085, 1, 0, 0.7490196, 1,
1.196385, 0.7456004, 1.580612, 1, 0, 0.7450981, 1,
1.196931, 1.084363, 1.780086, 1, 0, 0.7372549, 1,
1.197713, -0.747422, 4.11088, 1, 0, 0.7333333, 1,
1.201842, 1.471834, -0.04389044, 1, 0, 0.7254902, 1,
1.202271, -0.2168913, 0.2402966, 1, 0, 0.7215686, 1,
1.208794, -0.1021314, 1.90463, 1, 0, 0.7137255, 1,
1.220153, 0.2875794, 0.8469145, 1, 0, 0.7098039, 1,
1.22124, -0.173355, 1.494567, 1, 0, 0.7019608, 1,
1.237765, 2.478539, 1.959574, 1, 0, 0.6941177, 1,
1.257808, 0.395375, 0.738414, 1, 0, 0.6901961, 1,
1.258657, -0.6424267, 2.084718, 1, 0, 0.682353, 1,
1.259097, -0.2487209, 3.426272, 1, 0, 0.6784314, 1,
1.26132, 0.3847586, 0.01808746, 1, 0, 0.6705883, 1,
1.265297, 1.304852, 1.603095, 1, 0, 0.6666667, 1,
1.277975, -2.236421, 2.366359, 1, 0, 0.6588235, 1,
1.278466, 0.2797391, 1.128469, 1, 0, 0.654902, 1,
1.280187, 0.5765461, 1.788007, 1, 0, 0.6470588, 1,
1.283909, 1.248497, 0.3516237, 1, 0, 0.6431373, 1,
1.28715, 1.028989, 2.15099, 1, 0, 0.6352941, 1,
1.290005, -2.154819, 2.599336, 1, 0, 0.6313726, 1,
1.292356, 1.568665, 0.2142787, 1, 0, 0.6235294, 1,
1.293602, 0.5689729, 2.603038, 1, 0, 0.6196079, 1,
1.304773, 0.3248437, 1.990377, 1, 0, 0.6117647, 1,
1.312418, -0.5167372, 1.691069, 1, 0, 0.6078432, 1,
1.313024, -0.3419201, 1.396769, 1, 0, 0.6, 1,
1.313331, 1.251929, 0.08689538, 1, 0, 0.5921569, 1,
1.316206, 2.386446, -1.170475, 1, 0, 0.5882353, 1,
1.331427, -0.3825147, 1.141897, 1, 0, 0.5803922, 1,
1.338706, -1.596251, 1.201899, 1, 0, 0.5764706, 1,
1.338834, 0.2600439, 1.121508, 1, 0, 0.5686275, 1,
1.347909, -0.9742953, 2.279212, 1, 0, 0.5647059, 1,
1.355614, -1.139222, 2.991737, 1, 0, 0.5568628, 1,
1.370541, -0.5130784, 1.696708, 1, 0, 0.5529412, 1,
1.371344, -0.2744462, 3.370139, 1, 0, 0.5450981, 1,
1.37925, -0.4149335, -1.016088, 1, 0, 0.5411765, 1,
1.379684, 0.2496899, 1.54233, 1, 0, 0.5333334, 1,
1.383516, 1.053952, 0.43489, 1, 0, 0.5294118, 1,
1.389892, 0.3213999, 3.14384, 1, 0, 0.5215687, 1,
1.394981, 1.14643, -1.658733, 1, 0, 0.5176471, 1,
1.399557, -0.2192701, 2.853846, 1, 0, 0.509804, 1,
1.400882, 1.728812, 0.1955491, 1, 0, 0.5058824, 1,
1.402999, -1.050782, 1.426481, 1, 0, 0.4980392, 1,
1.407603, 1.461059, -0.9493351, 1, 0, 0.4901961, 1,
1.413257, -0.7612548, 1.408697, 1, 0, 0.4862745, 1,
1.419654, -0.4403807, 2.852398, 1, 0, 0.4784314, 1,
1.424296, 1.670341, -0.9274981, 1, 0, 0.4745098, 1,
1.450932, 2.716879, 0.9809366, 1, 0, 0.4666667, 1,
1.456784, 1.063832, 0.1799664, 1, 0, 0.4627451, 1,
1.457537, -0.803529, 2.067203, 1, 0, 0.454902, 1,
1.471181, 0.763572, 2.829972, 1, 0, 0.4509804, 1,
1.473436, -0.6828626, 0.06790695, 1, 0, 0.4431373, 1,
1.478526, -0.4909402, 2.595072, 1, 0, 0.4392157, 1,
1.479283, 2.157446, 0.1365228, 1, 0, 0.4313726, 1,
1.484746, -0.318448, 0.5704435, 1, 0, 0.427451, 1,
1.487997, 0.2107823, 1.653998, 1, 0, 0.4196078, 1,
1.495419, 0.4125424, 0.3940316, 1, 0, 0.4156863, 1,
1.498235, 0.3444057, 1.728321, 1, 0, 0.4078431, 1,
1.500015, -0.1736989, 1.751434, 1, 0, 0.4039216, 1,
1.51041, 0.8829692, 0.3372447, 1, 0, 0.3960784, 1,
1.520817, 1.204433, 0.8944525, 1, 0, 0.3882353, 1,
1.521287, -1.737692, 1.648845, 1, 0, 0.3843137, 1,
1.528582, -1.476696, 3.007341, 1, 0, 0.3764706, 1,
1.53013, -0.5105207, 2.860642, 1, 0, 0.372549, 1,
1.536451, -0.7332018, 0.3115226, 1, 0, 0.3647059, 1,
1.538415, -0.06739949, 1.457696, 1, 0, 0.3607843, 1,
1.541516, 1.053599, 0.9660813, 1, 0, 0.3529412, 1,
1.541987, -0.3616632, 1.067332, 1, 0, 0.3490196, 1,
1.550355, 0.03245787, 0.9460935, 1, 0, 0.3411765, 1,
1.561473, -0.3867096, 2.023149, 1, 0, 0.3372549, 1,
1.569536, -1.179386, 1.51288, 1, 0, 0.3294118, 1,
1.580088, 0.4002118, 1.359674, 1, 0, 0.3254902, 1,
1.582667, 0.4084478, 0.5561953, 1, 0, 0.3176471, 1,
1.586226, -0.4466667, 1.539195, 1, 0, 0.3137255, 1,
1.616682, 1.118681, 2.07352, 1, 0, 0.3058824, 1,
1.633844, -0.4579935, 1.258795, 1, 0, 0.2980392, 1,
1.637345, -0.6285616, 2.645875, 1, 0, 0.2941177, 1,
1.644621, 2.492901, 2.413595, 1, 0, 0.2862745, 1,
1.65326, 0.9149801, 1.661023, 1, 0, 0.282353, 1,
1.656557, -1.252042, 1.108083, 1, 0, 0.2745098, 1,
1.667181, -0.9778734, 0.9916015, 1, 0, 0.2705882, 1,
1.67704, -1.282084, 3.243554, 1, 0, 0.2627451, 1,
1.684706, 1.400339, 0.656879, 1, 0, 0.2588235, 1,
1.711391, 0.02078938, -0.6364481, 1, 0, 0.2509804, 1,
1.711623, 0.7528405, 2.442363, 1, 0, 0.2470588, 1,
1.712633, -0.1507753, 2.764654, 1, 0, 0.2392157, 1,
1.71687, -0.3232507, 1.107276, 1, 0, 0.2352941, 1,
1.723996, 0.04295022, 1.112652, 1, 0, 0.227451, 1,
1.729096, -0.03260761, 0.570922, 1, 0, 0.2235294, 1,
1.736207, 1.473362, 0.5981667, 1, 0, 0.2156863, 1,
1.742409, -0.8703442, 2.426148, 1, 0, 0.2117647, 1,
1.746704, 0.6891383, 0.4096701, 1, 0, 0.2039216, 1,
1.748474, 2.175986, 1.895327, 1, 0, 0.1960784, 1,
1.750169, 0.269096, 2.711048, 1, 0, 0.1921569, 1,
1.763567, 0.6127148, 1.247555, 1, 0, 0.1843137, 1,
1.790431, -0.4974985, 2.018661, 1, 0, 0.1803922, 1,
1.79396, 0.5425605, 0.9379374, 1, 0, 0.172549, 1,
1.819318, 0.1378155, 2.326332, 1, 0, 0.1686275, 1,
1.832563, -0.08214025, 1.51596, 1, 0, 0.1607843, 1,
1.833831, -0.7445257, 1.397498, 1, 0, 0.1568628, 1,
1.853207, -2.143164, 2.52828, 1, 0, 0.1490196, 1,
1.855299, -1.511169, 4.619308, 1, 0, 0.145098, 1,
1.85572, -0.5886906, 3.976006, 1, 0, 0.1372549, 1,
1.948988, 1.038731, 0.08627267, 1, 0, 0.1333333, 1,
1.961868, -0.7953129, 3.694658, 1, 0, 0.1254902, 1,
1.963306, -1.248899, 3.159464, 1, 0, 0.1215686, 1,
1.96538, -0.58123, 3.574094, 1, 0, 0.1137255, 1,
1.978722, -1.12752, 2.389945, 1, 0, 0.1098039, 1,
2.052983, -0.03437875, 1.577374, 1, 0, 0.1019608, 1,
2.070946, -0.1542125, 0.6189989, 1, 0, 0.09411765, 1,
2.129732, 0.8882748, 1.554716, 1, 0, 0.09019608, 1,
2.139104, 0.9344691, 0.7187251, 1, 0, 0.08235294, 1,
2.248831, 0.4097347, 1.381843, 1, 0, 0.07843138, 1,
2.257208, 0.5514762, 1.997942, 1, 0, 0.07058824, 1,
2.261617, -0.900733, 1.283456, 1, 0, 0.06666667, 1,
2.355952, 0.7566797, 0.5431738, 1, 0, 0.05882353, 1,
2.449205, -1.255815, 0.5332129, 1, 0, 0.05490196, 1,
2.466226, -0.04498312, 2.240433, 1, 0, 0.04705882, 1,
2.538338, 0.4893451, 1.961413, 1, 0, 0.04313726, 1,
2.574693, 1.61442, 0.8687798, 1, 0, 0.03529412, 1,
2.717452, 0.1711007, 1.174261, 1, 0, 0.03137255, 1,
2.846644, 0.2302086, 0.7304091, 1, 0, 0.02352941, 1,
2.981284, 1.972057, 0.984934, 1, 0, 0.01960784, 1,
3.02662, 0.7118153, 1.004907, 1, 0, 0.01176471, 1,
4.040277, 2.616859, 1.251433, 1, 0, 0.007843138, 1
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
0.5683613, -4.406778, -7.876106, 0, -0.5, 0.5, 0.5,
0.5683613, -4.406778, -7.876106, 1, -0.5, 0.5, 0.5,
0.5683613, -4.406778, -7.876106, 1, 1.5, 0.5, 0.5,
0.5683613, -4.406778, -7.876106, 0, 1.5, 0.5, 0.5
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
-4.080533, 0.0742259, -7.876106, 0, -0.5, 0.5, 0.5,
-4.080533, 0.0742259, -7.876106, 1, -0.5, 0.5, 0.5,
-4.080533, 0.0742259, -7.876106, 1, 1.5, 0.5, 0.5,
-4.080533, 0.0742259, -7.876106, 0, 1.5, 0.5, 0.5
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
-4.080533, -4.406778, -0.6211519, 0, -0.5, 0.5, 0.5,
-4.080533, -4.406778, -0.6211519, 1, -0.5, 0.5, 0.5,
-4.080533, -4.406778, -0.6211519, 1, 1.5, 0.5, 0.5,
-4.080533, -4.406778, -0.6211519, 0, 1.5, 0.5, 0.5
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
-2, -3.3727, -6.201886,
4, -3.3727, -6.201886,
-2, -3.3727, -6.201886,
-2, -3.545046, -6.480922,
-1, -3.3727, -6.201886,
-1, -3.545046, -6.480922,
0, -3.3727, -6.201886,
0, -3.545046, -6.480922,
1, -3.3727, -6.201886,
1, -3.545046, -6.480922,
2, -3.3727, -6.201886,
2, -3.545046, -6.480922,
3, -3.3727, -6.201886,
3, -3.545046, -6.480922,
4, -3.3727, -6.201886,
4, -3.545046, -6.480922
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
"3",
"4"
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
-2, -3.889739, -7.038996, 0, -0.5, 0.5, 0.5,
-2, -3.889739, -7.038996, 1, -0.5, 0.5, 0.5,
-2, -3.889739, -7.038996, 1, 1.5, 0.5, 0.5,
-2, -3.889739, -7.038996, 0, 1.5, 0.5, 0.5,
-1, -3.889739, -7.038996, 0, -0.5, 0.5, 0.5,
-1, -3.889739, -7.038996, 1, -0.5, 0.5, 0.5,
-1, -3.889739, -7.038996, 1, 1.5, 0.5, 0.5,
-1, -3.889739, -7.038996, 0, 1.5, 0.5, 0.5,
0, -3.889739, -7.038996, 0, -0.5, 0.5, 0.5,
0, -3.889739, -7.038996, 1, -0.5, 0.5, 0.5,
0, -3.889739, -7.038996, 1, 1.5, 0.5, 0.5,
0, -3.889739, -7.038996, 0, 1.5, 0.5, 0.5,
1, -3.889739, -7.038996, 0, -0.5, 0.5, 0.5,
1, -3.889739, -7.038996, 1, -0.5, 0.5, 0.5,
1, -3.889739, -7.038996, 1, 1.5, 0.5, 0.5,
1, -3.889739, -7.038996, 0, 1.5, 0.5, 0.5,
2, -3.889739, -7.038996, 0, -0.5, 0.5, 0.5,
2, -3.889739, -7.038996, 1, -0.5, 0.5, 0.5,
2, -3.889739, -7.038996, 1, 1.5, 0.5, 0.5,
2, -3.889739, -7.038996, 0, 1.5, 0.5, 0.5,
3, -3.889739, -7.038996, 0, -0.5, 0.5, 0.5,
3, -3.889739, -7.038996, 1, -0.5, 0.5, 0.5,
3, -3.889739, -7.038996, 1, 1.5, 0.5, 0.5,
3, -3.889739, -7.038996, 0, 1.5, 0.5, 0.5,
4, -3.889739, -7.038996, 0, -0.5, 0.5, 0.5,
4, -3.889739, -7.038996, 1, -0.5, 0.5, 0.5,
4, -3.889739, -7.038996, 1, 1.5, 0.5, 0.5,
4, -3.889739, -7.038996, 0, 1.5, 0.5, 0.5
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
-3.007711, -3, -6.201886,
-3.007711, 3, -6.201886,
-3.007711, -3, -6.201886,
-3.186515, -3, -6.480922,
-3.007711, -2, -6.201886,
-3.186515, -2, -6.480922,
-3.007711, -1, -6.201886,
-3.186515, -1, -6.480922,
-3.007711, 0, -6.201886,
-3.186515, 0, -6.480922,
-3.007711, 1, -6.201886,
-3.186515, 1, -6.480922,
-3.007711, 2, -6.201886,
-3.186515, 2, -6.480922,
-3.007711, 3, -6.201886,
-3.186515, 3, -6.480922
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
-3.544122, -3, -7.038996, 0, -0.5, 0.5, 0.5,
-3.544122, -3, -7.038996, 1, -0.5, 0.5, 0.5,
-3.544122, -3, -7.038996, 1, 1.5, 0.5, 0.5,
-3.544122, -3, -7.038996, 0, 1.5, 0.5, 0.5,
-3.544122, -2, -7.038996, 0, -0.5, 0.5, 0.5,
-3.544122, -2, -7.038996, 1, -0.5, 0.5, 0.5,
-3.544122, -2, -7.038996, 1, 1.5, 0.5, 0.5,
-3.544122, -2, -7.038996, 0, 1.5, 0.5, 0.5,
-3.544122, -1, -7.038996, 0, -0.5, 0.5, 0.5,
-3.544122, -1, -7.038996, 1, -0.5, 0.5, 0.5,
-3.544122, -1, -7.038996, 1, 1.5, 0.5, 0.5,
-3.544122, -1, -7.038996, 0, 1.5, 0.5, 0.5,
-3.544122, 0, -7.038996, 0, -0.5, 0.5, 0.5,
-3.544122, 0, -7.038996, 1, -0.5, 0.5, 0.5,
-3.544122, 0, -7.038996, 1, 1.5, 0.5, 0.5,
-3.544122, 0, -7.038996, 0, 1.5, 0.5, 0.5,
-3.544122, 1, -7.038996, 0, -0.5, 0.5, 0.5,
-3.544122, 1, -7.038996, 1, -0.5, 0.5, 0.5,
-3.544122, 1, -7.038996, 1, 1.5, 0.5, 0.5,
-3.544122, 1, -7.038996, 0, 1.5, 0.5, 0.5,
-3.544122, 2, -7.038996, 0, -0.5, 0.5, 0.5,
-3.544122, 2, -7.038996, 1, -0.5, 0.5, 0.5,
-3.544122, 2, -7.038996, 1, 1.5, 0.5, 0.5,
-3.544122, 2, -7.038996, 0, 1.5, 0.5, 0.5,
-3.544122, 3, -7.038996, 0, -0.5, 0.5, 0.5,
-3.544122, 3, -7.038996, 1, -0.5, 0.5, 0.5,
-3.544122, 3, -7.038996, 1, 1.5, 0.5, 0.5,
-3.544122, 3, -7.038996, 0, 1.5, 0.5, 0.5
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
-3.007711, -3.3727, -6,
-3.007711, -3.3727, 4,
-3.007711, -3.3727, -6,
-3.186515, -3.545046, -6,
-3.007711, -3.3727, -4,
-3.186515, -3.545046, -4,
-3.007711, -3.3727, -2,
-3.186515, -3.545046, -2,
-3.007711, -3.3727, 0,
-3.186515, -3.545046, 0,
-3.007711, -3.3727, 2,
-3.186515, -3.545046, 2,
-3.007711, -3.3727, 4,
-3.186515, -3.545046, 4
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
"-6",
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
-3.544122, -3.889739, -6, 0, -0.5, 0.5, 0.5,
-3.544122, -3.889739, -6, 1, -0.5, 0.5, 0.5,
-3.544122, -3.889739, -6, 1, 1.5, 0.5, 0.5,
-3.544122, -3.889739, -6, 0, 1.5, 0.5, 0.5,
-3.544122, -3.889739, -4, 0, -0.5, 0.5, 0.5,
-3.544122, -3.889739, -4, 1, -0.5, 0.5, 0.5,
-3.544122, -3.889739, -4, 1, 1.5, 0.5, 0.5,
-3.544122, -3.889739, -4, 0, 1.5, 0.5, 0.5,
-3.544122, -3.889739, -2, 0, -0.5, 0.5, 0.5,
-3.544122, -3.889739, -2, 1, -0.5, 0.5, 0.5,
-3.544122, -3.889739, -2, 1, 1.5, 0.5, 0.5,
-3.544122, -3.889739, -2, 0, 1.5, 0.5, 0.5,
-3.544122, -3.889739, 0, 0, -0.5, 0.5, 0.5,
-3.544122, -3.889739, 0, 1, -0.5, 0.5, 0.5,
-3.544122, -3.889739, 0, 1, 1.5, 0.5, 0.5,
-3.544122, -3.889739, 0, 0, 1.5, 0.5, 0.5,
-3.544122, -3.889739, 2, 0, -0.5, 0.5, 0.5,
-3.544122, -3.889739, 2, 1, -0.5, 0.5, 0.5,
-3.544122, -3.889739, 2, 1, 1.5, 0.5, 0.5,
-3.544122, -3.889739, 2, 0, 1.5, 0.5, 0.5,
-3.544122, -3.889739, 4, 0, -0.5, 0.5, 0.5,
-3.544122, -3.889739, 4, 1, -0.5, 0.5, 0.5,
-3.544122, -3.889739, 4, 1, 1.5, 0.5, 0.5,
-3.544122, -3.889739, 4, 0, 1.5, 0.5, 0.5
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
-3.007711, -3.3727, -6.201886,
-3.007711, 3.521152, -6.201886,
-3.007711, -3.3727, 4.959582,
-3.007711, 3.521152, 4.959582,
-3.007711, -3.3727, -6.201886,
-3.007711, -3.3727, 4.959582,
-3.007711, 3.521152, -6.201886,
-3.007711, 3.521152, 4.959582,
-3.007711, -3.3727, -6.201886,
4.144434, -3.3727, -6.201886,
-3.007711, -3.3727, 4.959582,
4.144434, -3.3727, 4.959582,
-3.007711, 3.521152, -6.201886,
4.144434, 3.521152, -6.201886,
-3.007711, 3.521152, 4.959582,
4.144434, 3.521152, 4.959582,
4.144434, -3.3727, -6.201886,
4.144434, 3.521152, -6.201886,
4.144434, -3.3727, 4.959582,
4.144434, 3.521152, 4.959582,
4.144434, -3.3727, -6.201886,
4.144434, -3.3727, 4.959582,
4.144434, 3.521152, -6.201886,
4.144434, 3.521152, 4.959582
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
var radius = 7.978619;
var distance = 35.49778;
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
mvMatrix.translate( -0.5683613, -0.0742259, 0.6211519 );
mvMatrix.scale( 1.206161, 1.251353, 0.7728947 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.49778);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
ethyl_ester_2-ethoxy<-read.table("ethyl_ester_2-ethoxy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-ethyl_ester_2-ethoxy$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_ester_2' not found
```

```r
y<-ethyl_ester_2-ethoxy$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_ester_2' not found
```

```r
z<-ethyl_ester_2-ethoxy$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_ester_2' not found
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
-2.903554, 1.519866, -0.06473777, 0, 0, 1, 1, 1,
-2.782364, -2.266919, -3.114573, 1, 0, 0, 1, 1,
-2.778632, 0.9679523, -3.494339, 1, 0, 0, 1, 1,
-2.766248, -1.661663, -0.7670388, 1, 0, 0, 1, 1,
-2.749454, 0.6149785, -1.104242, 1, 0, 0, 1, 1,
-2.705904, 0.1764388, -2.346449, 1, 0, 0, 1, 1,
-2.583447, 3.420756, -0.7769251, 0, 0, 0, 1, 1,
-2.583051, -0.7335157, -0.6800029, 0, 0, 0, 1, 1,
-2.567901, -1.995493, -2.691334, 0, 0, 0, 1, 1,
-2.546835, -0.2484393, -3.455072, 0, 0, 0, 1, 1,
-2.511818, -0.6154411, -2.14395, 0, 0, 0, 1, 1,
-2.487401, -1.307037, -1.978612, 0, 0, 0, 1, 1,
-2.480118, 0.6243504, 0.9545035, 0, 0, 0, 1, 1,
-2.455712, 0.008000161, -0.5300289, 1, 1, 1, 1, 1,
-2.43501, -1.747546, -3.187948, 1, 1, 1, 1, 1,
-2.421064, -0.3079279, -2.700127, 1, 1, 1, 1, 1,
-2.372285, 0.6007349, -0.5998402, 1, 1, 1, 1, 1,
-2.361156, -1.395566, -1.762549, 1, 1, 1, 1, 1,
-2.321365, -0.2579073, -1.494287, 1, 1, 1, 1, 1,
-2.299527, 0.1854466, -0.2218401, 1, 1, 1, 1, 1,
-2.280149, 0.7884555, -0.1151764, 1, 1, 1, 1, 1,
-2.262047, 0.8785543, -1.632168, 1, 1, 1, 1, 1,
-2.241122, -0.915738, -1.54335, 1, 1, 1, 1, 1,
-2.230947, 0.7652707, 0.2857337, 1, 1, 1, 1, 1,
-2.219029, 0.4100588, -2.670401, 1, 1, 1, 1, 1,
-2.188372, -1.60087, -1.361609, 1, 1, 1, 1, 1,
-2.167017, 0.6020069, -0.4193449, 1, 1, 1, 1, 1,
-2.138287, 0.7329359, 0.4891321, 1, 1, 1, 1, 1,
-2.110465, 1.028964, -0.9084666, 0, 0, 1, 1, 1,
-2.108561, -1.648424, -2.142992, 1, 0, 0, 1, 1,
-2.071649, 0.9413206, -0.9160519, 1, 0, 0, 1, 1,
-2.054664, 1.024566, -0.6542224, 1, 0, 0, 1, 1,
-2.046373, 0.1848963, -2.074807, 1, 0, 0, 1, 1,
-2.024771, 0.4156449, -1.155514, 1, 0, 0, 1, 1,
-1.995333, -1.380645, -0.2958491, 0, 0, 0, 1, 1,
-1.957431, -0.8501431, -1.138824, 0, 0, 0, 1, 1,
-1.954908, 0.985446, -1.486869, 0, 0, 0, 1, 1,
-1.93231, -0.519825, -1.412184, 0, 0, 0, 1, 1,
-1.917562, -1.455535, -1.877418, 0, 0, 0, 1, 1,
-1.917059, 0.1452191, 0.4202411, 0, 0, 0, 1, 1,
-1.90772, -0.1101391, 0.4582257, 0, 0, 0, 1, 1,
-1.892428, -0.6015228, -4.34908, 1, 1, 1, 1, 1,
-1.879163, 0.6490422, -1.95585, 1, 1, 1, 1, 1,
-1.868791, 1.546516, -0.1671604, 1, 1, 1, 1, 1,
-1.828662, -0.4608068, -1.778771, 1, 1, 1, 1, 1,
-1.818715, 1.627578, 0.4706925, 1, 1, 1, 1, 1,
-1.807348, 0.4980543, -3.188825, 1, 1, 1, 1, 1,
-1.785692, -0.8421524, -1.979429, 1, 1, 1, 1, 1,
-1.783096, 1.249979, -1.416849, 1, 1, 1, 1, 1,
-1.772015, -1.372528, -2.768064, 1, 1, 1, 1, 1,
-1.765872, -1.1136, -2.415021, 1, 1, 1, 1, 1,
-1.75326, 0.8666636, 0.1961558, 1, 1, 1, 1, 1,
-1.749968, 1.26391, 0.5448654, 1, 1, 1, 1, 1,
-1.744852, 0.7835998, -0.3090787, 1, 1, 1, 1, 1,
-1.741798, -0.609336, -1.948442, 1, 1, 1, 1, 1,
-1.741302, 0.451107, 0.1550205, 1, 1, 1, 1, 1,
-1.733118, -1.858484, -2.123324, 0, 0, 1, 1, 1,
-1.720749, 1.040466, -1.182054, 1, 0, 0, 1, 1,
-1.719664, -0.4102974, -3.170444, 1, 0, 0, 1, 1,
-1.700842, -1.301209, -0.09811389, 1, 0, 0, 1, 1,
-1.682322, -0.1411766, -3.941879, 1, 0, 0, 1, 1,
-1.652999, 0.8569857, -1.546692, 1, 0, 0, 1, 1,
-1.628608, -2.068758, -2.046332, 0, 0, 0, 1, 1,
-1.613117, -0.8459209, -2.218888, 0, 0, 0, 1, 1,
-1.60124, 1.7647, -1.100862, 0, 0, 0, 1, 1,
-1.600885, 0.7318683, -0.4874893, 0, 0, 0, 1, 1,
-1.584932, 1.353462, -2.028359, 0, 0, 0, 1, 1,
-1.577971, -0.3682517, -1.854824, 0, 0, 0, 1, 1,
-1.577835, 0.1238032, -0.3440301, 0, 0, 0, 1, 1,
-1.565795, -0.1287657, -2.120778, 1, 1, 1, 1, 1,
-1.562026, -1.267495, -1.122968, 1, 1, 1, 1, 1,
-1.549156, 0.3955585, -1.556476, 1, 1, 1, 1, 1,
-1.545396, 1.524082, -0.5699239, 1, 1, 1, 1, 1,
-1.537141, 0.5108876, -1.590829, 1, 1, 1, 1, 1,
-1.524499, -0.3890191, -1.596842, 1, 1, 1, 1, 1,
-1.515773, 0.1656166, -1.50639, 1, 1, 1, 1, 1,
-1.512225, 0.3726431, 0.04901966, 1, 1, 1, 1, 1,
-1.503519, -0.6927286, -2.966361, 1, 1, 1, 1, 1,
-1.496884, -1.100387, -2.363595, 1, 1, 1, 1, 1,
-1.477386, 0.456689, -2.376642, 1, 1, 1, 1, 1,
-1.476217, 0.668288, -2.063397, 1, 1, 1, 1, 1,
-1.460072, 0.2269127, -1.927873, 1, 1, 1, 1, 1,
-1.446188, 0.1737056, -2.268737, 1, 1, 1, 1, 1,
-1.429393, -1.159135, -2.327444, 1, 1, 1, 1, 1,
-1.41875, -0.3967741, -2.179427, 0, 0, 1, 1, 1,
-1.41113, 0.9389053, -0.9197161, 1, 0, 0, 1, 1,
-1.409704, -0.5319393, -0.6274776, 1, 0, 0, 1, 1,
-1.405678, 0.3670947, -1.002118, 1, 0, 0, 1, 1,
-1.40394, 0.7768826, -0.610657, 1, 0, 0, 1, 1,
-1.403471, 0.8623883, -0.07644041, 1, 0, 0, 1, 1,
-1.399855, 0.1142566, 0.2971831, 0, 0, 0, 1, 1,
-1.395258, 0.2736053, -1.408644, 0, 0, 0, 1, 1,
-1.386732, -0.09535159, -2.729542, 0, 0, 0, 1, 1,
-1.384232, 0.214918, -1.383018, 0, 0, 0, 1, 1,
-1.381778, 0.08332734, -0.479021, 0, 0, 0, 1, 1,
-1.371915, 0.5624133, 0.7158403, 0, 0, 0, 1, 1,
-1.359041, 0.2994594, 0.5343792, 0, 0, 0, 1, 1,
-1.356973, 0.3506895, -2.708613, 1, 1, 1, 1, 1,
-1.356325, -0.6286572, -1.193618, 1, 1, 1, 1, 1,
-1.349732, -0.5850143, -1.76687, 1, 1, 1, 1, 1,
-1.345912, -0.8834075, -2.635895, 1, 1, 1, 1, 1,
-1.342656, 0.09861966, -2.127567, 1, 1, 1, 1, 1,
-1.331023, -1.761712, -3.367898, 1, 1, 1, 1, 1,
-1.328822, 0.9088951, -0.1851244, 1, 1, 1, 1, 1,
-1.319009, -0.896406, -1.931061, 1, 1, 1, 1, 1,
-1.317596, 0.1851277, -1.424182, 1, 1, 1, 1, 1,
-1.307358, 1.025577, 0.2519099, 1, 1, 1, 1, 1,
-1.297314, -0.3509611, -0.290241, 1, 1, 1, 1, 1,
-1.293833, -1.015682, -1.947696, 1, 1, 1, 1, 1,
-1.285293, 2.873124, 0.2085603, 1, 1, 1, 1, 1,
-1.283334, 0.4208285, -1.242131, 1, 1, 1, 1, 1,
-1.274724, 0.1459862, -2.29984, 1, 1, 1, 1, 1,
-1.272877, -0.4419433, -1.822316, 0, 0, 1, 1, 1,
-1.271783, 0.4233837, 0.07206733, 1, 0, 0, 1, 1,
-1.26283, -0.849898, -3.732043, 1, 0, 0, 1, 1,
-1.261217, -0.03947467, -0.8900388, 1, 0, 0, 1, 1,
-1.2451, -2.048509, -2.867715, 1, 0, 0, 1, 1,
-1.239283, 0.04871912, -0.9300916, 1, 0, 0, 1, 1,
-1.234465, -1.071004, -2.229409, 0, 0, 0, 1, 1,
-1.232092, 0.4756421, -0.3460742, 0, 0, 0, 1, 1,
-1.223933, 0.844528, -0.151078, 0, 0, 0, 1, 1,
-1.221378, 0.241856, -1.141015, 0, 0, 0, 1, 1,
-1.221242, -0.1837197, -1.721552, 0, 0, 0, 1, 1,
-1.214314, -0.684705, -2.422279, 0, 0, 0, 1, 1,
-1.207428, 1.042276, -0.6515613, 0, 0, 0, 1, 1,
-1.20451, -0.8699513, -1.187827, 1, 1, 1, 1, 1,
-1.203722, -0.6423644, -2.22292, 1, 1, 1, 1, 1,
-1.192006, 0.1482798, -3.083992, 1, 1, 1, 1, 1,
-1.185825, -0.2216626, -2.38471, 1, 1, 1, 1, 1,
-1.170239, 0.4157074, -0.3806751, 1, 1, 1, 1, 1,
-1.167032, 1.545322, -1.369431, 1, 1, 1, 1, 1,
-1.15923, -0.7157642, -2.202047, 1, 1, 1, 1, 1,
-1.152071, -0.9515611, -0.9988463, 1, 1, 1, 1, 1,
-1.14273, 0.5992789, -0.8994041, 1, 1, 1, 1, 1,
-1.133719, -0.1966173, -1.226376, 1, 1, 1, 1, 1,
-1.12406, -0.8802959, -1.505164, 1, 1, 1, 1, 1,
-1.118752, 1.294211, -0.570199, 1, 1, 1, 1, 1,
-1.117727, -0.07760474, -2.292799, 1, 1, 1, 1, 1,
-1.113638, 0.5042936, -1.384767, 1, 1, 1, 1, 1,
-1.110007, -0.6525987, 0.1921844, 1, 1, 1, 1, 1,
-1.103237, -0.1209982, -1.636528, 0, 0, 1, 1, 1,
-1.101073, 0.9636683, -1.056363, 1, 0, 0, 1, 1,
-1.09962, 0.04431363, -1.55412, 1, 0, 0, 1, 1,
-1.098419, 0.1990991, 0.4490183, 1, 0, 0, 1, 1,
-1.097985, -1.318466, -2.792116, 1, 0, 0, 1, 1,
-1.091946, -0.8606168, -2.681218, 1, 0, 0, 1, 1,
-1.088685, -0.4153019, -3.093541, 0, 0, 0, 1, 1,
-1.082425, 1.106215, -2.712049, 0, 0, 0, 1, 1,
-1.082319, 1.166212, -1.292496, 0, 0, 0, 1, 1,
-1.079806, -0.2392646, -2.502244, 0, 0, 0, 1, 1,
-1.079317, 0.8280647, -1.20776, 0, 0, 0, 1, 1,
-1.075507, 0.4104856, 0.5745586, 0, 0, 0, 1, 1,
-1.068491, 1.991918, 0.5252505, 0, 0, 0, 1, 1,
-1.06383, -0.4953073, -2.100719, 1, 1, 1, 1, 1,
-1.063271, 1.583492, 1.66632, 1, 1, 1, 1, 1,
-1.062094, 0.4827412, -1.296133, 1, 1, 1, 1, 1,
-1.057933, 0.2058312, -0.4194719, 1, 1, 1, 1, 1,
-1.043961, -2.360226, -1.917924, 1, 1, 1, 1, 1,
-1.04331, -1.753699, -1.337169, 1, 1, 1, 1, 1,
-1.041028, -0.7508398, -3.077706, 1, 1, 1, 1, 1,
-1.036892, 0.106562, -0.7458599, 1, 1, 1, 1, 1,
-1.031821, 1.08351, -1.913352, 1, 1, 1, 1, 1,
-0.9877182, -0.8700958, -1.224543, 1, 1, 1, 1, 1,
-0.9874811, 0.4050963, -1.488092, 1, 1, 1, 1, 1,
-0.9865522, 1.242746, -0.08434934, 1, 1, 1, 1, 1,
-0.9860678, -0.1044001, -3.080025, 1, 1, 1, 1, 1,
-0.9855664, -0.6276791, -3.502721, 1, 1, 1, 1, 1,
-0.9849477, -0.3858981, -2.166709, 1, 1, 1, 1, 1,
-0.9848599, 3.209862, -0.1384471, 0, 0, 1, 1, 1,
-0.9805326, -1.531015, -2.107723, 1, 0, 0, 1, 1,
-0.9762005, -0.2697102, -0.06372076, 1, 0, 0, 1, 1,
-0.9746242, 0.9336998, -1.162733, 1, 0, 0, 1, 1,
-0.9729734, -2.431735, -1.462926, 1, 0, 0, 1, 1,
-0.9673845, 0.03797085, -1.650445, 1, 0, 0, 1, 1,
-0.9623338, -0.6173936, -2.620562, 0, 0, 0, 1, 1,
-0.9589112, 2.469742, -1.595978, 0, 0, 0, 1, 1,
-0.9570804, 0.3271945, -0.6798627, 0, 0, 0, 1, 1,
-0.9556338, -1.669601, -4.673157, 0, 0, 0, 1, 1,
-0.9542473, -0.366476, -0.1391483, 0, 0, 0, 1, 1,
-0.9522557, 1.029617, 1.525319, 0, 0, 0, 1, 1,
-0.9473194, 0.03924052, -0.5753437, 0, 0, 0, 1, 1,
-0.9443989, 0.537851, -0.5389751, 1, 1, 1, 1, 1,
-0.9422102, 1.334008, -1.385563, 1, 1, 1, 1, 1,
-0.9406894, -0.6904502, -1.116271, 1, 1, 1, 1, 1,
-0.9390423, -0.05007121, -1.822618, 1, 1, 1, 1, 1,
-0.9383496, 0.3860485, -2.473664, 1, 1, 1, 1, 1,
-0.9371517, 1.312648, -1.453537, 1, 1, 1, 1, 1,
-0.9268654, -0.3696697, -2.581015, 1, 1, 1, 1, 1,
-0.9213241, -1.667465, -2.879743, 1, 1, 1, 1, 1,
-0.9130373, -0.2108128, -1.416368, 1, 1, 1, 1, 1,
-0.9125746, -0.1261318, 0.4275709, 1, 1, 1, 1, 1,
-0.907567, 0.8439033, -2.267682, 1, 1, 1, 1, 1,
-0.90482, 0.1703712, -0.9727645, 1, 1, 1, 1, 1,
-0.8922747, 0.04128586, -0.4526269, 1, 1, 1, 1, 1,
-0.8913739, -0.08103386, -1.268471, 1, 1, 1, 1, 1,
-0.8863919, -0.1230072, -2.934339, 1, 1, 1, 1, 1,
-0.8850393, -0.1328426, -3.206727, 0, 0, 1, 1, 1,
-0.8781333, 0.129428, -2.28212, 1, 0, 0, 1, 1,
-0.8736625, 1.464964, 0.6448975, 1, 0, 0, 1, 1,
-0.8713169, -0.2612411, -2.117989, 1, 0, 0, 1, 1,
-0.8707907, 0.3490105, -0.3601494, 1, 0, 0, 1, 1,
-0.8705928, 0.1974604, -1.193276, 1, 0, 0, 1, 1,
-0.8669432, -0.4230004, -1.929525, 0, 0, 0, 1, 1,
-0.8617232, 0.4412562, 0.9089973, 0, 0, 0, 1, 1,
-0.8575695, -0.5353566, -4.014473, 0, 0, 0, 1, 1,
-0.8542777, 1.370345, -0.9299922, 0, 0, 0, 1, 1,
-0.8519827, -0.1108602, -3.078318, 0, 0, 0, 1, 1,
-0.84871, 0.2425066, -2.497518, 0, 0, 0, 1, 1,
-0.8483963, 0.1277829, -0.7541267, 0, 0, 0, 1, 1,
-0.8436798, -0.1326836, -1.268434, 1, 1, 1, 1, 1,
-0.8432561, 1.565353, 1.003857, 1, 1, 1, 1, 1,
-0.8381924, 0.1070806, 0.6286291, 1, 1, 1, 1, 1,
-0.8353841, 0.4838085, -0.4896059, 1, 1, 1, 1, 1,
-0.8308268, -0.1655401, -1.139503, 1, 1, 1, 1, 1,
-0.827381, -0.4370537, -2.066565, 1, 1, 1, 1, 1,
-0.8218278, -2.102901, -2.519424, 1, 1, 1, 1, 1,
-0.8203856, 1.250114, 0.1934089, 1, 1, 1, 1, 1,
-0.8175959, 0.06587831, 0.4465074, 1, 1, 1, 1, 1,
-0.816034, 0.4948585, -0.3530897, 1, 1, 1, 1, 1,
-0.8134596, -3.272304, -2.142838, 1, 1, 1, 1, 1,
-0.8133245, 0.3598966, -0.04309482, 1, 1, 1, 1, 1,
-0.8118642, -0.007992469, -2.445751, 1, 1, 1, 1, 1,
-0.8112363, -0.7387971, -1.10499, 1, 1, 1, 1, 1,
-0.8054858, -1.233603, -2.060003, 1, 1, 1, 1, 1,
-0.8034976, 0.8239678, -1.282286, 0, 0, 1, 1, 1,
-0.8031172, 0.7899258, -0.9068145, 1, 0, 0, 1, 1,
-0.8014997, -0.3119633, -1.237834, 1, 0, 0, 1, 1,
-0.8004842, 0.4678257, -1.937907, 1, 0, 0, 1, 1,
-0.7911958, -1.393806, -3.35742, 1, 0, 0, 1, 1,
-0.7863451, 0.6168559, -0.5767148, 1, 0, 0, 1, 1,
-0.7843156, 0.2253089, -1.62478, 0, 0, 0, 1, 1,
-0.7790173, 0.7300342, -1.041103, 0, 0, 0, 1, 1,
-0.7749292, 0.7693778, -2.15748, 0, 0, 0, 1, 1,
-0.7697313, 0.4490754, -2.339411, 0, 0, 0, 1, 1,
-0.7667915, 1.967563, 0.4089357, 0, 0, 0, 1, 1,
-0.7633838, -0.3542422, -1.87697, 0, 0, 0, 1, 1,
-0.7574602, -1.516683, -3.745157, 0, 0, 0, 1, 1,
-0.755792, -0.4798989, -3.555364, 1, 1, 1, 1, 1,
-0.7457449, -0.8738604, -3.015893, 1, 1, 1, 1, 1,
-0.7431615, 1.116854, 0.6474189, 1, 1, 1, 1, 1,
-0.7396567, 1.473053, 0.09169433, 1, 1, 1, 1, 1,
-0.739277, 1.043692, 0.4155419, 1, 1, 1, 1, 1,
-0.7381846, -2.283071, -3.927153, 1, 1, 1, 1, 1,
-0.7380935, 0.8291165, -0.2551428, 1, 1, 1, 1, 1,
-0.7374793, -1.037606, -3.631252, 1, 1, 1, 1, 1,
-0.7357089, -0.9604604, -1.884996, 1, 1, 1, 1, 1,
-0.7294172, 1.16914, 0.3226961, 1, 1, 1, 1, 1,
-0.7243387, 0.2103122, -0.8879495, 1, 1, 1, 1, 1,
-0.7122507, -0.8423955, -1.434179, 1, 1, 1, 1, 1,
-0.7085723, 0.8982438, -0.1325176, 1, 1, 1, 1, 1,
-0.7050458, -2.133511, -3.89924, 1, 1, 1, 1, 1,
-0.6994761, -0.232556, -1.951915, 1, 1, 1, 1, 1,
-0.6913998, 1.085706, 0.5133265, 0, 0, 1, 1, 1,
-0.6907281, -0.595619, -2.156735, 1, 0, 0, 1, 1,
-0.6839144, -0.1243587, -0.9270719, 1, 0, 0, 1, 1,
-0.6836652, 0.569665, -0.6074721, 1, 0, 0, 1, 1,
-0.6824364, 0.9584019, -1.690157, 1, 0, 0, 1, 1,
-0.6811342, -0.7438915, -1.007524, 1, 0, 0, 1, 1,
-0.6739631, 0.7752864, -0.7374595, 0, 0, 0, 1, 1,
-0.6739101, -0.376582, -2.30494, 0, 0, 0, 1, 1,
-0.6688886, -0.5103992, -2.080382, 0, 0, 0, 1, 1,
-0.6664902, -0.4609772, -2.251481, 0, 0, 0, 1, 1,
-0.6661593, 2.22445, -0.3367618, 0, 0, 0, 1, 1,
-0.6660154, 1.059437, -0.04232569, 0, 0, 0, 1, 1,
-0.6624017, -1.148793, -1.406455, 0, 0, 0, 1, 1,
-0.6558276, -2.375364, -1.290804, 1, 1, 1, 1, 1,
-0.652139, 1.566623, -1.071392, 1, 1, 1, 1, 1,
-0.6517985, -1.148922, -1.829853, 1, 1, 1, 1, 1,
-0.6488909, -1.270389, -2.411667, 1, 1, 1, 1, 1,
-0.6472632, -0.2912976, -1.42751, 1, 1, 1, 1, 1,
-0.6461163, 2.047323, -1.000772, 1, 1, 1, 1, 1,
-0.6455715, -1.143436, -3.794105, 1, 1, 1, 1, 1,
-0.6435027, -0.9626982, -2.574803, 1, 1, 1, 1, 1,
-0.6372915, 0.518251, -2.196511, 1, 1, 1, 1, 1,
-0.6337161, -0.135919, -0.3342215, 1, 1, 1, 1, 1,
-0.628239, -0.4630394, -2.671512, 1, 1, 1, 1, 1,
-0.6275862, 0.2039657, -0.487131, 1, 1, 1, 1, 1,
-0.6204762, -1.247342, -1.098767, 1, 1, 1, 1, 1,
-0.6198107, -0.4207595, -3.949985, 1, 1, 1, 1, 1,
-0.6197252, -0.9925103, -3.272852, 1, 1, 1, 1, 1,
-0.6195232, 0.4046377, -0.6969294, 0, 0, 1, 1, 1,
-0.6177989, 0.3989756, 0.6505107, 1, 0, 0, 1, 1,
-0.6138892, 0.5751121, -0.3518375, 1, 0, 0, 1, 1,
-0.6079364, 0.2589635, 0.3029802, 1, 0, 0, 1, 1,
-0.6077358, -1.983482, -2.309243, 1, 0, 0, 1, 1,
-0.6053513, -0.07455122, -1.985552, 1, 0, 0, 1, 1,
-0.5974834, -1.021075, -2.805592, 0, 0, 0, 1, 1,
-0.5950073, 0.8634226, -1.45605, 0, 0, 0, 1, 1,
-0.5910105, 0.2450318, -1.599998, 0, 0, 0, 1, 1,
-0.584204, 0.3383021, -1.526243, 0, 0, 0, 1, 1,
-0.5806068, 0.9361735, 0.2045531, 0, 0, 0, 1, 1,
-0.5800138, 0.2191674, -0.4297206, 0, 0, 0, 1, 1,
-0.5789726, 1.783621, 0.221589, 0, 0, 0, 1, 1,
-0.5787895, 0.1298582, -1.604217, 1, 1, 1, 1, 1,
-0.5786921, 0.5079422, 0.3798269, 1, 1, 1, 1, 1,
-0.5736799, 0.6247257, 0.518491, 1, 1, 1, 1, 1,
-0.5730809, 0.2384215, -1.659159, 1, 1, 1, 1, 1,
-0.571474, -0.8921212, -4.29896, 1, 1, 1, 1, 1,
-0.5702788, -0.538897, -1.277414, 1, 1, 1, 1, 1,
-0.5689198, 0.5392547, -1.11255, 1, 1, 1, 1, 1,
-0.568404, -0.7205418, -0.80352, 1, 1, 1, 1, 1,
-0.5620826, -1.13001, -3.754635, 1, 1, 1, 1, 1,
-0.5601154, -1.173464, -4.060801, 1, 1, 1, 1, 1,
-0.5598367, 2.056178, 1.022038, 1, 1, 1, 1, 1,
-0.5513697, 0.795859, -2.310457, 1, 1, 1, 1, 1,
-0.5476076, -0.7575876, -1.439015, 1, 1, 1, 1, 1,
-0.5459737, 1.450751, -0.7285228, 1, 1, 1, 1, 1,
-0.5437157, 0.4357391, -0.9871091, 1, 1, 1, 1, 1,
-0.5434922, 0.4573916, -0.6466717, 0, 0, 1, 1, 1,
-0.5419279, 0.6223381, -0.2375937, 1, 0, 0, 1, 1,
-0.5386706, 1.243556, 0.6186671, 1, 0, 0, 1, 1,
-0.5371766, -0.8476228, -3.22051, 1, 0, 0, 1, 1,
-0.5222696, 0.247537, -2.467747, 1, 0, 0, 1, 1,
-0.5201814, 0.6659537, -0.1591135, 1, 0, 0, 1, 1,
-0.5160118, 0.7451052, -1.067829, 0, 0, 0, 1, 1,
-0.5154392, 0.1765659, -2.178083, 0, 0, 0, 1, 1,
-0.5142462, 2.77396, 1.017308, 0, 0, 0, 1, 1,
-0.5124269, -0.1395401, -2.596629, 0, 0, 0, 1, 1,
-0.5123224, -0.123892, -2.626132, 0, 0, 0, 1, 1,
-0.501514, -0.296686, -1.591213, 0, 0, 0, 1, 1,
-0.500013, 0.2902358, -0.08994411, 0, 0, 0, 1, 1,
-0.4909797, -0.04114707, -2.68298, 1, 1, 1, 1, 1,
-0.4873718, 0.3483736, -3.774606, 1, 1, 1, 1, 1,
-0.4842969, -0.7508598, -2.096664, 1, 1, 1, 1, 1,
-0.4832004, -0.6758134, -3.641626, 1, 1, 1, 1, 1,
-0.4821795, 1.067079, -1.25772, 1, 1, 1, 1, 1,
-0.4806352, -0.07934573, -2.29228, 1, 1, 1, 1, 1,
-0.4744036, 0.4757859, 0.8078622, 1, 1, 1, 1, 1,
-0.4640327, 0.7774929, -1.006727, 1, 1, 1, 1, 1,
-0.4638546, 0.4999149, -0.6444834, 1, 1, 1, 1, 1,
-0.4589678, 1.693382, -0.3999495, 1, 1, 1, 1, 1,
-0.4552299, 0.4745611, -1.491102, 1, 1, 1, 1, 1,
-0.4473447, 0.8091051, -0.8851579, 1, 1, 1, 1, 1,
-0.4457673, -0.009800398, -2.413197, 1, 1, 1, 1, 1,
-0.4441873, 0.3039155, -0.7975072, 1, 1, 1, 1, 1,
-0.4437871, 0.8392861, -2.402511, 1, 1, 1, 1, 1,
-0.4375013, 0.2847286, -0.5785921, 0, 0, 1, 1, 1,
-0.4313926, -0.5999468, -2.338563, 1, 0, 0, 1, 1,
-0.4285114, 0.4671769, 0.241236, 1, 0, 0, 1, 1,
-0.4268906, -1.928966, -4.538419, 1, 0, 0, 1, 1,
-0.4267806, -0.3119892, -1.166545, 1, 0, 0, 1, 1,
-0.4242669, -1.218744, -2.821135, 1, 0, 0, 1, 1,
-0.4228919, 1.171041, 0.1303737, 0, 0, 0, 1, 1,
-0.4222766, 0.315098, -1.403723, 0, 0, 0, 1, 1,
-0.4179985, 0.06808571, -1.098168, 0, 0, 0, 1, 1,
-0.4155722, 0.9445565, -1.963716, 0, 0, 0, 1, 1,
-0.4149686, 1.054441, 1.85192, 0, 0, 0, 1, 1,
-0.4148532, 0.655014, 0.5609043, 0, 0, 0, 1, 1,
-0.4114093, -0.5956417, -3.933327, 0, 0, 0, 1, 1,
-0.4107755, 1.068367, -0.02548315, 1, 1, 1, 1, 1,
-0.4089754, 0.9159796, 0.7161953, 1, 1, 1, 1, 1,
-0.4084297, 1.454306, -0.4449586, 1, 1, 1, 1, 1,
-0.4010753, 1.077519, -0.7397398, 1, 1, 1, 1, 1,
-0.3965524, 1.302678, -0.1163849, 1, 1, 1, 1, 1,
-0.3915143, 0.8845649, -1.507956, 1, 1, 1, 1, 1,
-0.3890671, -0.5911252, -2.654984, 1, 1, 1, 1, 1,
-0.3872159, 0.4474263, -0.2117739, 1, 1, 1, 1, 1,
-0.3840052, 0.4852477, -1.684512, 1, 1, 1, 1, 1,
-0.3819791, -0.1226806, -1.997911, 1, 1, 1, 1, 1,
-0.3804617, -0.3953746, -2.839831, 1, 1, 1, 1, 1,
-0.3796858, -0.3829357, -1.375806, 1, 1, 1, 1, 1,
-0.3775537, -0.6680393, -4.188955, 1, 1, 1, 1, 1,
-0.3757627, -1.170026, -2.980149, 1, 1, 1, 1, 1,
-0.3734744, 1.813071, 0.6310239, 1, 1, 1, 1, 1,
-0.3733362, 0.918429, -0.8663044, 0, 0, 1, 1, 1,
-0.3720751, -1.546537, -3.859511, 1, 0, 0, 1, 1,
-0.3705181, 2.362667, -1.504121, 1, 0, 0, 1, 1,
-0.3671367, 0.6725397, 0.1454178, 1, 0, 0, 1, 1,
-0.3648856, -0.3255422, -3.105185, 1, 0, 0, 1, 1,
-0.3624689, 0.2080806, -0.8865861, 1, 0, 0, 1, 1,
-0.3614745, -0.7636856, -3.88761, 0, 0, 0, 1, 1,
-0.3605394, 0.001515132, -0.7455474, 0, 0, 0, 1, 1,
-0.3592227, 1.055075, -2.033147, 0, 0, 0, 1, 1,
-0.3586025, 1.166993, -0.2827199, 0, 0, 0, 1, 1,
-0.3578953, 1.638006, -0.4302145, 0, 0, 0, 1, 1,
-0.3574528, -1.277088, -2.905801, 0, 0, 0, 1, 1,
-0.3531136, -0.3830536, -2.701394, 0, 0, 0, 1, 1,
-0.3518028, -1.361809, -2.195966, 1, 1, 1, 1, 1,
-0.3513458, -1.482015, -2.950377, 1, 1, 1, 1, 1,
-0.3505751, -2.329854, -1.49417, 1, 1, 1, 1, 1,
-0.3478493, 0.2218793, -0.8403289, 1, 1, 1, 1, 1,
-0.3468623, 0.05715408, -1.665439, 1, 1, 1, 1, 1,
-0.338688, 1.202568, 0.104156, 1, 1, 1, 1, 1,
-0.3373454, -0.3552912, -2.020889, 1, 1, 1, 1, 1,
-0.333269, 1.177765, 1.335363, 1, 1, 1, 1, 1,
-0.3315537, 0.3654957, 0.1308145, 1, 1, 1, 1, 1,
-0.3266465, -2.170861, -3.696352, 1, 1, 1, 1, 1,
-0.31986, 0.5005979, -0.008743666, 1, 1, 1, 1, 1,
-0.318327, 1.117916, -0.7870815, 1, 1, 1, 1, 1,
-0.3159818, -1.338413, -3.657281, 1, 1, 1, 1, 1,
-0.3114292, -1.031973, -3.008744, 1, 1, 1, 1, 1,
-0.3033397, 0.9603627, 0.001855461, 1, 1, 1, 1, 1,
-0.3020892, 1.282021, 0.7755382, 0, 0, 1, 1, 1,
-0.2976741, 0.8239502, -1.193563, 1, 0, 0, 1, 1,
-0.2963462, 1.844221, -0.05106476, 1, 0, 0, 1, 1,
-0.2871813, -0.8120497, -2.263503, 1, 0, 0, 1, 1,
-0.2866385, 0.8269802, 0.646844, 1, 0, 0, 1, 1,
-0.2836649, -1.269388, -2.228902, 1, 0, 0, 1, 1,
-0.2773597, -1.405541, -4.048542, 0, 0, 0, 1, 1,
-0.2766972, 0.4279917, 0.1036209, 0, 0, 0, 1, 1,
-0.2746536, -0.2227078, -2.275957, 0, 0, 0, 1, 1,
-0.2734786, 0.01196448, -0.05551765, 0, 0, 0, 1, 1,
-0.2703979, -0.9156485, -3.441917, 0, 0, 0, 1, 1,
-0.2680354, -1.980026, -3.662667, 0, 0, 0, 1, 1,
-0.2677609, 1.035947, 0.62152, 0, 0, 0, 1, 1,
-0.2673229, -0.1017798, -2.160212, 1, 1, 1, 1, 1,
-0.2669199, 0.7463322, -2.122309, 1, 1, 1, 1, 1,
-0.2624498, -1.153595, -0.6384724, 1, 1, 1, 1, 1,
-0.2613883, -0.3297403, -2.335564, 1, 1, 1, 1, 1,
-0.2605158, 0.8866929, -1.921495, 1, 1, 1, 1, 1,
-0.2592831, -0.3196855, -2.219116, 1, 1, 1, 1, 1,
-0.2579177, 2.399505, -0.1331738, 1, 1, 1, 1, 1,
-0.2577914, -1.014599, -6.03934, 1, 1, 1, 1, 1,
-0.2569987, 0.4698938, -1.037362, 1, 1, 1, 1, 1,
-0.2565647, -0.7324778, -3.575858, 1, 1, 1, 1, 1,
-0.2551765, 0.8413497, 1.471009, 1, 1, 1, 1, 1,
-0.2440773, 0.4178518, -0.5623591, 1, 1, 1, 1, 1,
-0.2429561, 0.2944832, 0.03042507, 1, 1, 1, 1, 1,
-0.2407898, -0.3536611, -3.059976, 1, 1, 1, 1, 1,
-0.2398156, -0.2069947, -2.90757, 1, 1, 1, 1, 1,
-0.2391965, 0.9949215, -0.1342678, 0, 0, 1, 1, 1,
-0.2366839, 0.5210645, -0.8837107, 1, 0, 0, 1, 1,
-0.2362254, -0.0438699, -3.995942, 1, 0, 0, 1, 1,
-0.2312886, 1.779848, -1.353775, 1, 0, 0, 1, 1,
-0.2288422, -0.2193798, -2.811725, 1, 0, 0, 1, 1,
-0.227584, 1.300983, -0.3301718, 1, 0, 0, 1, 1,
-0.2245656, 0.7991953, -2.146037, 0, 0, 0, 1, 1,
-0.2244498, -0.1517283, -2.596355, 0, 0, 0, 1, 1,
-0.2231556, 1.228154, -0.784753, 0, 0, 0, 1, 1,
-0.2212682, 0.7359674, 0.9031219, 0, 0, 0, 1, 1,
-0.2209639, 0.2602062, -1.639313, 0, 0, 0, 1, 1,
-0.2200291, -0.2731605, -1.400129, 0, 0, 0, 1, 1,
-0.2162789, 0.01714886, -3.345635, 0, 0, 0, 1, 1,
-0.2151876, -0.287403, -2.50005, 1, 1, 1, 1, 1,
-0.2107328, -0.550166, -3.711378, 1, 1, 1, 1, 1,
-0.2098544, 0.9873636, 1.348353, 1, 1, 1, 1, 1,
-0.2076953, 0.2155086, -0.6130006, 1, 1, 1, 1, 1,
-0.2071478, 0.8314933, -0.1430809, 1, 1, 1, 1, 1,
-0.2028298, 0.02233668, -1.917867, 1, 1, 1, 1, 1,
-0.2020579, -0.7010143, -2.385772, 1, 1, 1, 1, 1,
-0.2015663, 2.261942, 0.4677576, 1, 1, 1, 1, 1,
-0.2004504, 0.5728166, -0.8721277, 1, 1, 1, 1, 1,
-0.1987842, 0.2408743, -0.8185044, 1, 1, 1, 1, 1,
-0.1985607, 0.1819018, 0.7105956, 1, 1, 1, 1, 1,
-0.1971883, 0.2135979, -1.839887, 1, 1, 1, 1, 1,
-0.1940514, 0.52364, -0.03778108, 1, 1, 1, 1, 1,
-0.1927507, 0.5907838, -0.6155672, 1, 1, 1, 1, 1,
-0.1814522, -0.8407421, -3.116507, 1, 1, 1, 1, 1,
-0.1810716, 1.103966, -1.292852, 0, 0, 1, 1, 1,
-0.1769757, -1.157395, -2.525429, 1, 0, 0, 1, 1,
-0.176023, -0.4514478, -2.816009, 1, 0, 0, 1, 1,
-0.1710843, 2.043766, -0.6023591, 1, 0, 0, 1, 1,
-0.1688739, -1.750637, -2.075022, 1, 0, 0, 1, 1,
-0.1660104, 1.622518, 0.388586, 1, 0, 0, 1, 1,
-0.1643128, 0.4843459, -2.021456, 0, 0, 0, 1, 1,
-0.1626147, -0.08287152, -1.576941, 0, 0, 0, 1, 1,
-0.1600626, 0.8642668, -0.5143262, 0, 0, 0, 1, 1,
-0.1555061, -0.601919, -1.338163, 0, 0, 0, 1, 1,
-0.1513872, 1.849386, -0.8517317, 0, 0, 0, 1, 1,
-0.1510011, 0.7918125, 0.7036755, 0, 0, 0, 1, 1,
-0.1408783, -0.8772561, -2.358422, 0, 0, 0, 1, 1,
-0.1394646, 1.378116, -0.98914, 1, 1, 1, 1, 1,
-0.1373698, 0.06806578, -0.8684386, 1, 1, 1, 1, 1,
-0.136235, -1.466295, -4.128832, 1, 1, 1, 1, 1,
-0.131925, -0.2254368, -3.292873, 1, 1, 1, 1, 1,
-0.1302581, 1.101453, -0.2565542, 1, 1, 1, 1, 1,
-0.1213828, 1.052536, 0.9345337, 1, 1, 1, 1, 1,
-0.1202863, -0.1406825, -0.7300774, 1, 1, 1, 1, 1,
-0.1190972, -0.4091065, -3.132206, 1, 1, 1, 1, 1,
-0.1161387, 0.874245, 0.357554, 1, 1, 1, 1, 1,
-0.1158878, -0.08814067, -2.488648, 1, 1, 1, 1, 1,
-0.1135384, 1.728562, 0.6543881, 1, 1, 1, 1, 1,
-0.1093148, 1.2048, 1.634648, 1, 1, 1, 1, 1,
-0.1068008, -0.6139596, -3.185702, 1, 1, 1, 1, 1,
-0.1059882, 0.2308665, -1.114735, 1, 1, 1, 1, 1,
-0.1038842, 0.2121185, -1.25796, 1, 1, 1, 1, 1,
-0.1010987, 1.077891, 0.06792688, 0, 0, 1, 1, 1,
-0.09443419, -0.1228325, -1.561914, 1, 0, 0, 1, 1,
-0.08952716, -1.025615, -3.305837, 1, 0, 0, 1, 1,
-0.08741542, -0.1584661, -2.874748, 1, 0, 0, 1, 1,
-0.08207362, 1.046253, -1.296453, 1, 0, 0, 1, 1,
-0.08180765, -1.77605, -1.9619, 1, 0, 0, 1, 1,
-0.0814555, 0.3855484, 0.596103, 0, 0, 0, 1, 1,
-0.06921338, 0.8675654, -0.01980856, 0, 0, 0, 1, 1,
-0.06795982, -1.405592, -2.711378, 0, 0, 0, 1, 1,
-0.06270141, 0.667258, -0.7964504, 0, 0, 0, 1, 1,
-0.06040804, 0.6263105, -2.664719, 0, 0, 0, 1, 1,
-0.05950819, 0.1721817, -0.8989245, 0, 0, 0, 1, 1,
-0.05604467, 0.8473797, -0.265487, 0, 0, 0, 1, 1,
-0.04992967, 0.2031174, -0.8864943, 1, 1, 1, 1, 1,
-0.04590488, -0.1454521, -3.967294, 1, 1, 1, 1, 1,
-0.04400377, -0.3906462, -1.588845, 1, 1, 1, 1, 1,
-0.04372478, 1.317183, 0.9905588, 1, 1, 1, 1, 1,
-0.04239389, 1.072851, 0.3981481, 1, 1, 1, 1, 1,
-0.04208898, -1.26397, -1.355678, 1, 1, 1, 1, 1,
-0.0402691, 0.4608419, -0.636854, 1, 1, 1, 1, 1,
-0.03737951, -1.682505, -3.328084, 1, 1, 1, 1, 1,
-0.03677376, 0.4763815, -0.5129341, 1, 1, 1, 1, 1,
-0.03412132, 1.123511, 1.368579, 1, 1, 1, 1, 1,
-0.03016539, 1.560951, -0.3800825, 1, 1, 1, 1, 1,
-0.02862354, -0.5539214, -2.824965, 1, 1, 1, 1, 1,
-0.02800479, -0.9108179, -2.871941, 1, 1, 1, 1, 1,
-0.01036001, 1.964011, 0.6015702, 1, 1, 1, 1, 1,
-0.007993829, -0.2110822, -3.176518, 1, 1, 1, 1, 1,
-0.006366998, 0.3633873, 0.09947715, 0, 0, 1, 1, 1,
-0.003367573, 1.214682, -0.1858585, 1, 0, 0, 1, 1,
-0.001445288, 1.317884, 0.0904851, 1, 0, 0, 1, 1,
0.00175693, -0.1925009, 1.992898, 1, 0, 0, 1, 1,
0.007788526, -1.180183, 2.467768, 1, 0, 0, 1, 1,
0.009870141, 0.44138, 1.006739, 1, 0, 0, 1, 1,
0.009895346, -1.582776, 1.9583, 0, 0, 0, 1, 1,
0.009937025, 0.9341406, -1.135414, 0, 0, 0, 1, 1,
0.01402317, -0.09873503, 2.54777, 0, 0, 0, 1, 1,
0.01435009, 1.0948, 1.073018, 0, 0, 0, 1, 1,
0.01770262, 0.7295995, 0.7254635, 0, 0, 0, 1, 1,
0.02132033, -0.5599538, 3.63819, 0, 0, 0, 1, 1,
0.03861921, 1.41874, -1.064186, 0, 0, 0, 1, 1,
0.04363589, 0.3989225, -0.8163677, 1, 1, 1, 1, 1,
0.04468098, -0.4791111, 2.730674, 1, 1, 1, 1, 1,
0.0456818, -0.117559, 1.440395, 1, 1, 1, 1, 1,
0.04890573, -1.104232, 2.04861, 1, 1, 1, 1, 1,
0.05104982, -1.257486, 4.221936, 1, 1, 1, 1, 1,
0.052086, 1.643011, 0.1359559, 1, 1, 1, 1, 1,
0.056943, 2.957449, 2.391481, 1, 1, 1, 1, 1,
0.05712034, 0.3477567, 0.2422707, 1, 1, 1, 1, 1,
0.05795291, -0.5771142, 3.668926, 1, 1, 1, 1, 1,
0.06554899, 0.6915159, -0.8041988, 1, 1, 1, 1, 1,
0.06677108, 0.7727954, 0.6023485, 1, 1, 1, 1, 1,
0.06767683, -0.6871547, 3.224461, 1, 1, 1, 1, 1,
0.06975053, -1.334063, 2.702405, 1, 1, 1, 1, 1,
0.0802189, 0.7553971, -0.9653792, 1, 1, 1, 1, 1,
0.08418001, -0.5905377, 2.800712, 1, 1, 1, 1, 1,
0.08658112, -0.2680444, 2.649531, 0, 0, 1, 1, 1,
0.08880268, -2.382447, 2.995275, 1, 0, 0, 1, 1,
0.09166124, 0.08450364, 1.39793, 1, 0, 0, 1, 1,
0.09327574, -3.029162, 3.487378, 1, 0, 0, 1, 1,
0.0936016, 0.1182484, 0.3647248, 1, 0, 0, 1, 1,
0.09408548, -0.7465684, 3.279078, 1, 0, 0, 1, 1,
0.09583151, -0.8155378, 3.852409, 0, 0, 0, 1, 1,
0.09698445, 0.07075554, -0.01653318, 0, 0, 0, 1, 1,
0.1006714, -1.050682, 2.847366, 0, 0, 0, 1, 1,
0.1083877, -0.1402071, 2.870837, 0, 0, 0, 1, 1,
0.1089273, 0.5528504, 0.7052467, 0, 0, 0, 1, 1,
0.1132431, 0.04696355, 1.095286, 0, 0, 0, 1, 1,
0.1265768, 0.7141352, -0.850591, 0, 0, 0, 1, 1,
0.1305446, 0.3779495, 1.022369, 1, 1, 1, 1, 1,
0.1306487, 0.4408813, 1.14301, 1, 1, 1, 1, 1,
0.1310061, 0.306334, -1.457385, 1, 1, 1, 1, 1,
0.1321197, -1.115808, 3.083535, 1, 1, 1, 1, 1,
0.13412, 0.02382673, 0.8755376, 1, 1, 1, 1, 1,
0.1347177, 0.2334428, 0.2601547, 1, 1, 1, 1, 1,
0.1366957, -0.0429813, 0.5880077, 1, 1, 1, 1, 1,
0.1381545, 0.569221, 1.529107, 1, 1, 1, 1, 1,
0.1400414, -1.195589, 2.928718, 1, 1, 1, 1, 1,
0.1439074, 0.01323195, 2.477369, 1, 1, 1, 1, 1,
0.1489877, 0.7035283, 1.2971, 1, 1, 1, 1, 1,
0.1521594, -0.5795584, 3.902239, 1, 1, 1, 1, 1,
0.1521733, -0.2058967, 3.158877, 1, 1, 1, 1, 1,
0.1524299, 1.062764, 0.6966141, 1, 1, 1, 1, 1,
0.1530064, 2.108707, 0.5613552, 1, 1, 1, 1, 1,
0.159572, -1.613124, 3.570684, 0, 0, 1, 1, 1,
0.1606134, -1.592439, 3.163972, 1, 0, 0, 1, 1,
0.1639288, 1.217509, 1.170539, 1, 0, 0, 1, 1,
0.1643888, -1.022582, 2.744848, 1, 0, 0, 1, 1,
0.1649415, -1.081369, 2.710982, 1, 0, 0, 1, 1,
0.168424, 0.4869874, 0.5536044, 1, 0, 0, 1, 1,
0.1700746, 0.1408077, -1.383578, 0, 0, 0, 1, 1,
0.1707749, -1.107383, 1.646002, 0, 0, 0, 1, 1,
0.1726019, -1.018403, 3.251932, 0, 0, 0, 1, 1,
0.1738849, 1.552801, 0.1633283, 0, 0, 0, 1, 1,
0.183771, 0.4777048, -0.7687538, 0, 0, 0, 1, 1,
0.1848257, 1.038823, 0.1915959, 0, 0, 0, 1, 1,
0.1870229, -0.1421497, 1.499939, 0, 0, 0, 1, 1,
0.1891273, -1.75705, 3.731635, 1, 1, 1, 1, 1,
0.1900142, -1.303415, 4.026284, 1, 1, 1, 1, 1,
0.1959159, -2.411792, 3.089925, 1, 1, 1, 1, 1,
0.1980398, 0.3337639, 0.7844139, 1, 1, 1, 1, 1,
0.2000952, 0.9054058, -0.4168326, 1, 1, 1, 1, 1,
0.2052293, 0.2508449, 1.528511, 1, 1, 1, 1, 1,
0.2061384, -0.2737187, 4.250537, 1, 1, 1, 1, 1,
0.2067591, 1.060715, -0.8000501, 1, 1, 1, 1, 1,
0.2070474, 0.6568596, 0.6872202, 1, 1, 1, 1, 1,
0.2089864, -0.4408202, 1.50449, 1, 1, 1, 1, 1,
0.215894, 1.184566, -0.8069169, 1, 1, 1, 1, 1,
0.2190927, 0.07977464, 0.2286693, 1, 1, 1, 1, 1,
0.2198783, -2.075419, 2.771142, 1, 1, 1, 1, 1,
0.2227325, 0.3333703, 1.509311, 1, 1, 1, 1, 1,
0.2236095, 1.003302, -1.761183, 1, 1, 1, 1, 1,
0.2265464, 2.021482, -1.432083, 0, 0, 1, 1, 1,
0.2289719, -0.9514929, 1.392401, 1, 0, 0, 1, 1,
0.2307749, -0.3936432, 3.690241, 1, 0, 0, 1, 1,
0.2347055, 1.294379, -2.036061, 1, 0, 0, 1, 1,
0.239277, 2.999409, 0.06320769, 1, 0, 0, 1, 1,
0.2416597, -0.2795318, 1.827383, 1, 0, 0, 1, 1,
0.2483669, 3.103743, -0.3011863, 0, 0, 0, 1, 1,
0.2485041, 0.3875729, -0.7958716, 0, 0, 0, 1, 1,
0.2510678, 0.4578313, 1.266763, 0, 0, 0, 1, 1,
0.2539315, 1.402062, -0.06249735, 0, 0, 0, 1, 1,
0.2628463, -0.3212238, 3.844007, 0, 0, 0, 1, 1,
0.2635975, -0.5367939, 1.185536, 0, 0, 0, 1, 1,
0.2665334, -0.4960732, 3.085705, 0, 0, 0, 1, 1,
0.2723188, 0.2884465, 0.1068037, 1, 1, 1, 1, 1,
0.2723517, -1.450194, 3.530683, 1, 1, 1, 1, 1,
0.2728535, 0.3174752, 2.360419, 1, 1, 1, 1, 1,
0.2732833, -0.7928807, 2.055386, 1, 1, 1, 1, 1,
0.2741719, 2.834052, 0.9544347, 1, 1, 1, 1, 1,
0.2754355, -0.99622, 3.996762, 1, 1, 1, 1, 1,
0.2761135, 1.521912, 0.3416807, 1, 1, 1, 1, 1,
0.2800025, 0.2024134, 0.6666045, 1, 1, 1, 1, 1,
0.2845654, -0.3867193, 0.992849, 1, 1, 1, 1, 1,
0.2878424, 2.314702, 0.6324921, 1, 1, 1, 1, 1,
0.2903252, -1.040732, 2.119905, 1, 1, 1, 1, 1,
0.2948227, 0.2770809, 1.092603, 1, 1, 1, 1, 1,
0.2980865, -0.9237598, 2.989446, 1, 1, 1, 1, 1,
0.2981121, -0.1941775, 0.6589103, 1, 1, 1, 1, 1,
0.2982591, -0.8002524, 2.456157, 1, 1, 1, 1, 1,
0.2995693, -1.141847, 1.919438, 0, 0, 1, 1, 1,
0.2998853, -0.4261037, 4.797036, 1, 0, 0, 1, 1,
0.3022859, -2.075772, 2.726077, 1, 0, 0, 1, 1,
0.3024935, -0.2188058, 4.135405, 1, 0, 0, 1, 1,
0.3040942, 0.08215064, 1.11725, 1, 0, 0, 1, 1,
0.3075079, 0.8245341, 0.8692345, 1, 0, 0, 1, 1,
0.3103123, -1.031881, 1.693161, 0, 0, 0, 1, 1,
0.3128049, -0.1351635, 1.69242, 0, 0, 0, 1, 1,
0.3154126, -0.4617994, 0.3927209, 0, 0, 0, 1, 1,
0.317571, 0.1718577, 0.5747777, 0, 0, 0, 1, 1,
0.3186553, -0.568459, 4.302817, 0, 0, 0, 1, 1,
0.3214072, -0.5640563, 2.388374, 0, 0, 0, 1, 1,
0.3229665, -1.69077, 3.326518, 0, 0, 0, 1, 1,
0.3231625, 0.3960515, 1.53427, 1, 1, 1, 1, 1,
0.3272689, -2.06099, 3.53982, 1, 1, 1, 1, 1,
0.3279172, -0.4100327, 1.449477, 1, 1, 1, 1, 1,
0.3310776, 0.9018567, 0.03813045, 1, 1, 1, 1, 1,
0.3312114, 1.218946, 0.7715965, 1, 1, 1, 1, 1,
0.3351047, 0.7263131, 1.016763, 1, 1, 1, 1, 1,
0.3353837, 0.6525491, -1.066446, 1, 1, 1, 1, 1,
0.3363235, -1.434181, 2.907593, 1, 1, 1, 1, 1,
0.3373222, -0.07571679, 1.423226, 1, 1, 1, 1, 1,
0.3380632, 0.2336514, 1.937051, 1, 1, 1, 1, 1,
0.3383308, 0.6437052, 1.05522, 1, 1, 1, 1, 1,
0.3406239, 0.3871868, 0.383615, 1, 1, 1, 1, 1,
0.342228, 2.367018, -1.049688, 1, 1, 1, 1, 1,
0.3446629, 0.5348209, 2.219242, 1, 1, 1, 1, 1,
0.350715, -0.3254471, 0.7327971, 1, 1, 1, 1, 1,
0.352269, 0.5346138, 0.1688198, 0, 0, 1, 1, 1,
0.3528405, -1.181117, 1.527796, 1, 0, 0, 1, 1,
0.3532144, -0.7697394, -0.09406266, 1, 0, 0, 1, 1,
0.353713, -1.584504, 3.192792, 1, 0, 0, 1, 1,
0.3640804, 0.7474989, -0.5361267, 1, 0, 0, 1, 1,
0.3641839, -1.044682, 4.072467, 1, 0, 0, 1, 1,
0.3712786, 0.2298571, 1.368101, 0, 0, 0, 1, 1,
0.3730097, -1.169106, 3.344765, 0, 0, 0, 1, 1,
0.3746644, 0.2878307, 0.8848945, 0, 0, 0, 1, 1,
0.3747546, 0.3445802, 0.8685833, 0, 0, 0, 1, 1,
0.3824242, 0.3211963, -1.270469, 0, 0, 0, 1, 1,
0.3840082, -0.3180348, 1.559843, 0, 0, 0, 1, 1,
0.3857206, -0.8920649, 1.15412, 0, 0, 0, 1, 1,
0.3880639, -0.09718782, 1.727136, 1, 1, 1, 1, 1,
0.3898768, -0.8687238, 4.22703, 1, 1, 1, 1, 1,
0.3929654, 0.7152174, 0.6572517, 1, 1, 1, 1, 1,
0.3942635, 0.1849914, 2.24734, 1, 1, 1, 1, 1,
0.3945529, 0.5165231, 0.618566, 1, 1, 1, 1, 1,
0.3962641, -0.2139846, 3.586567, 1, 1, 1, 1, 1,
0.3966689, 0.8404696, 1.005913, 1, 1, 1, 1, 1,
0.3985905, -0.296651, 3.910942, 1, 1, 1, 1, 1,
0.3988321, 0.9086707, -1.222353, 1, 1, 1, 1, 1,
0.4008965, -1.435106, 3.059785, 1, 1, 1, 1, 1,
0.4013213, 0.465295, 0.3236907, 1, 1, 1, 1, 1,
0.4021984, 0.1103579, 1.001022, 1, 1, 1, 1, 1,
0.4046732, 0.219142, 1.712431, 1, 1, 1, 1, 1,
0.4053289, -0.3580484, 2.481632, 1, 1, 1, 1, 1,
0.4067669, 1.591964, 1.042619, 1, 1, 1, 1, 1,
0.4114237, -0.5832197, 1.62497, 0, 0, 1, 1, 1,
0.4140254, -0.5862672, 2.976205, 1, 0, 0, 1, 1,
0.4177273, -2.689468, 3.674152, 1, 0, 0, 1, 1,
0.4188447, 0.6991569, 0.07854862, 1, 0, 0, 1, 1,
0.4208527, 0.07099755, 1.908633, 1, 0, 0, 1, 1,
0.4227003, 1.462502, 0.8205868, 1, 0, 0, 1, 1,
0.4246045, 0.8928489, 0.7785849, 0, 0, 0, 1, 1,
0.4268419, -0.0579878, 0.5434814, 0, 0, 0, 1, 1,
0.4276956, -0.4265864, 3.580978, 0, 0, 0, 1, 1,
0.4316463, 0.9266909, 1.688959, 0, 0, 0, 1, 1,
0.4399607, -0.6037058, 2.611725, 0, 0, 0, 1, 1,
0.4437116, 0.9569234, 0.6671118, 0, 0, 0, 1, 1,
0.443912, -0.88708, 2.238189, 0, 0, 0, 1, 1,
0.4460401, 1.393279, 0.0779248, 1, 1, 1, 1, 1,
0.4473589, -0.158791, 1.280121, 1, 1, 1, 1, 1,
0.4536365, -0.9502084, 1.924163, 1, 1, 1, 1, 1,
0.45682, 0.3171908, 1.582353, 1, 1, 1, 1, 1,
0.4570123, 0.4826917, 1.195384, 1, 1, 1, 1, 1,
0.4580055, 0.460438, 1.830096, 1, 1, 1, 1, 1,
0.4580862, 1.041116, 1.365517, 1, 1, 1, 1, 1,
0.4668359, 1.570233, -1.016203, 1, 1, 1, 1, 1,
0.468343, 0.6321817, 0.8335102, 1, 1, 1, 1, 1,
0.4712485, 1.373906, 0.3562665, 1, 1, 1, 1, 1,
0.4714262, -0.2284589, 1.282129, 1, 1, 1, 1, 1,
0.4744162, -0.4383963, 1.715588, 1, 1, 1, 1, 1,
0.4751596, -0.8163417, 2.91292, 1, 1, 1, 1, 1,
0.4776131, 0.97646, 1.621214, 1, 1, 1, 1, 1,
0.4847331, 1.200806, 0.5666793, 1, 1, 1, 1, 1,
0.4849996, -1.65583, 2.350481, 0, 0, 1, 1, 1,
0.4850005, 1.281518, 1.858791, 1, 0, 0, 1, 1,
0.4850901, -1.195839, 2.881656, 1, 0, 0, 1, 1,
0.4861571, 2.393573, -0.02236654, 1, 0, 0, 1, 1,
0.4870874, 0.5203233, 0.6917967, 1, 0, 0, 1, 1,
0.4871555, 0.5607255, -1.868477, 1, 0, 0, 1, 1,
0.4901019, -2.095712, 1.348854, 0, 0, 0, 1, 1,
0.4907316, -1.030971, 2.863692, 0, 0, 0, 1, 1,
0.497045, 0.6209245, 1.696521, 0, 0, 0, 1, 1,
0.5048602, -0.01232156, 2.501805, 0, 0, 0, 1, 1,
0.5049716, -0.2556682, 1.888189, 0, 0, 0, 1, 1,
0.5058601, 0.7180076, 0.0215651, 0, 0, 0, 1, 1,
0.5093389, 1.507653, 1.327773, 0, 0, 0, 1, 1,
0.50968, -1.07339, 4.501615, 1, 1, 1, 1, 1,
0.5121333, -1.263152, 1.651784, 1, 1, 1, 1, 1,
0.5135335, 0.9028034, 0.1517471, 1, 1, 1, 1, 1,
0.5244374, 0.5502043, -1.120258, 1, 1, 1, 1, 1,
0.5392075, -0.4671859, 2.773663, 1, 1, 1, 1, 1,
0.5394417, -0.4293625, 3.609967, 1, 1, 1, 1, 1,
0.5424822, 1.385126, -0.8609954, 1, 1, 1, 1, 1,
0.5439737, -0.3062202, 2.774295, 1, 1, 1, 1, 1,
0.5555309, -0.5583587, 3.968972, 1, 1, 1, 1, 1,
0.556001, 1.06012, -1.303137, 1, 1, 1, 1, 1,
0.5575994, 1.31129, 0.8656763, 1, 1, 1, 1, 1,
0.560632, -0.5152329, 2.096274, 1, 1, 1, 1, 1,
0.5627261, -1.309616, 2.675383, 1, 1, 1, 1, 1,
0.564408, 0.4359797, -0.4550409, 1, 1, 1, 1, 1,
0.5645923, -2.624394, 2.986693, 1, 1, 1, 1, 1,
0.5646745, -1.748822, 2.211493, 0, 0, 1, 1, 1,
0.5653095, -0.7954431, 2.78392, 1, 0, 0, 1, 1,
0.5700462, -0.5829283, 1.46611, 1, 0, 0, 1, 1,
0.5709607, 0.6973062, -0.4877535, 1, 0, 0, 1, 1,
0.5750788, 2.257613, 0.2343039, 1, 0, 0, 1, 1,
0.5759912, -0.04711102, 1.997437, 1, 0, 0, 1, 1,
0.5825998, -0.3759518, 2.073729, 0, 0, 0, 1, 1,
0.5854132, -0.2672067, 3.051402, 0, 0, 0, 1, 1,
0.5903478, -0.9203588, 2.720356, 0, 0, 0, 1, 1,
0.5945615, 0.7044744, 0.5957637, 0, 0, 0, 1, 1,
0.5975671, -1.530666, 2.496392, 0, 0, 0, 1, 1,
0.5992855, 0.03844539, 1.186058, 0, 0, 0, 1, 1,
0.6037666, 1.126804, 0.3100143, 0, 0, 0, 1, 1,
0.6080442, -0.4534934, 2.258426, 1, 1, 1, 1, 1,
0.6083525, -0.3051844, 0.6334696, 1, 1, 1, 1, 1,
0.6137708, -0.3087304, 1.049524, 1, 1, 1, 1, 1,
0.6284754, 0.4595397, -1.088926, 1, 1, 1, 1, 1,
0.6314803, 2.470409, 0.3213488, 1, 1, 1, 1, 1,
0.6355641, -1.076404, 2.13413, 1, 1, 1, 1, 1,
0.6372086, -1.171337, 1.074866, 1, 1, 1, 1, 1,
0.6543593, -1.464236, 4.195039, 1, 1, 1, 1, 1,
0.6566334, -1.620639, 3.300061, 1, 1, 1, 1, 1,
0.6592495, 0.6529257, 0.5962549, 1, 1, 1, 1, 1,
0.6698936, -0.1373607, 1.945426, 1, 1, 1, 1, 1,
0.6711591, 1.468639, 0.2675402, 1, 1, 1, 1, 1,
0.6863386, -0.4063961, 3.292059, 1, 1, 1, 1, 1,
0.6875905, -0.1325408, 0.9799926, 1, 1, 1, 1, 1,
0.6894506, -0.159756, 1.748296, 1, 1, 1, 1, 1,
0.6914088, -0.3253483, 1.990684, 0, 0, 1, 1, 1,
0.6946692, 0.9325699, 0.2467937, 1, 0, 0, 1, 1,
0.6959725, -0.5882281, 0.5665066, 1, 0, 0, 1, 1,
0.7038609, 0.1788177, 0.4131104, 1, 0, 0, 1, 1,
0.704116, 0.4678059, 0.3738272, 1, 0, 0, 1, 1,
0.7051362, -0.2846454, 0.4799043, 1, 0, 0, 1, 1,
0.7084349, -1.058631, 2.858357, 0, 0, 0, 1, 1,
0.7089398, -0.2074512, 2.702247, 0, 0, 0, 1, 1,
0.7105939, -0.4925414, 2.858093, 0, 0, 0, 1, 1,
0.7130924, 0.472707, 0.810441, 0, 0, 0, 1, 1,
0.7145418, -0.3574921, 1.42781, 0, 0, 0, 1, 1,
0.72347, 0.1653575, 1.780073, 0, 0, 0, 1, 1,
0.7281647, -0.7422348, 2.128653, 0, 0, 0, 1, 1,
0.7299836, -0.7432653, 2.373231, 1, 1, 1, 1, 1,
0.7362425, -0.2569767, 2.450824, 1, 1, 1, 1, 1,
0.7506561, 0.5061871, 2.022259, 1, 1, 1, 1, 1,
0.7526948, 0.4891441, 2.14974, 1, 1, 1, 1, 1,
0.7531255, -1.098858, 1.292731, 1, 1, 1, 1, 1,
0.7539564, 1.112469, 0.3410206, 1, 1, 1, 1, 1,
0.7591378, 0.5184533, 2.613408, 1, 1, 1, 1, 1,
0.7618279, 1.642759, -1.161772, 1, 1, 1, 1, 1,
0.7623055, -1.32216, 2.952248, 1, 1, 1, 1, 1,
0.7649665, -1.244828, 3.191832, 1, 1, 1, 1, 1,
0.7703755, 0.06151862, 0.1185022, 1, 1, 1, 1, 1,
0.7724311, -1.111176, 2.027255, 1, 1, 1, 1, 1,
0.7729444, 0.8470359, 0.7603444, 1, 1, 1, 1, 1,
0.7752291, 0.4273541, -0.7054037, 1, 1, 1, 1, 1,
0.7754275, 0.8943136, 1.488233, 1, 1, 1, 1, 1,
0.7790396, 0.4138979, 0.9115791, 0, 0, 1, 1, 1,
0.780134, 0.1344412, 0.5849515, 1, 0, 0, 1, 1,
0.7873809, -0.213765, 2.951654, 1, 0, 0, 1, 1,
0.7911444, 1.222226, 0.742054, 1, 0, 0, 1, 1,
0.7931385, 0.3022313, 2.105933, 1, 0, 0, 1, 1,
0.7980859, -0.2201142, 2.873848, 1, 0, 0, 1, 1,
0.7992561, -1.402253, 1.81554, 0, 0, 0, 1, 1,
0.8070463, -2.451671, 4.312508, 0, 0, 0, 1, 1,
0.8094221, 0.4177882, 2.932289, 0, 0, 0, 1, 1,
0.8095761, -1.048161, 2.796315, 0, 0, 0, 1, 1,
0.8099357, 0.09121224, 1.517341, 0, 0, 0, 1, 1,
0.8253396, -1.66069, 3.300508, 0, 0, 0, 1, 1,
0.82627, 1.060994, 1.78971, 0, 0, 0, 1, 1,
0.8284956, -0.117505, 2.505944, 1, 1, 1, 1, 1,
0.8312006, -0.2177591, 0.9273597, 1, 1, 1, 1, 1,
0.8364033, 0.3639505, 2.380105, 1, 1, 1, 1, 1,
0.8412269, -0.08421612, 2.93126, 1, 1, 1, 1, 1,
0.8417467, -0.894311, 1.925231, 1, 1, 1, 1, 1,
0.8564107, -0.6603252, 2.953077, 1, 1, 1, 1, 1,
0.8590476, -0.2218681, 1.191034, 1, 1, 1, 1, 1,
0.8592976, 1.444378, -1.001114, 1, 1, 1, 1, 1,
0.8625224, -1.399493, 4.463532, 1, 1, 1, 1, 1,
0.8631518, -1.176328, 2.30441, 1, 1, 1, 1, 1,
0.8663738, -0.5553181, 0.4151501, 1, 1, 1, 1, 1,
0.8691478, -0.6239672, 2.107198, 1, 1, 1, 1, 1,
0.8741457, 0.3953896, 2.825716, 1, 1, 1, 1, 1,
0.8780513, -1.105726, 1.993919, 1, 1, 1, 1, 1,
0.8821263, 1.066773, 0.2978891, 1, 1, 1, 1, 1,
0.8841868, -0.4234599, 4.458402, 0, 0, 1, 1, 1,
0.8852422, 0.5431712, -0.04234683, 1, 0, 0, 1, 1,
0.8897156, 1.550022, 1.734726, 1, 0, 0, 1, 1,
0.8910416, -0.5944948, 2.10588, 1, 0, 0, 1, 1,
0.8923465, 0.6692895, 0.9976357, 1, 0, 0, 1, 1,
0.8973023, 2.309129, 0.6603445, 1, 0, 0, 1, 1,
0.9001245, -0.122352, 1.435057, 0, 0, 0, 1, 1,
0.9016714, -0.6554307, 2.593938, 0, 0, 0, 1, 1,
0.9025162, -1.05692, 0.5085324, 0, 0, 0, 1, 1,
0.9080561, -0.5828894, 2.360263, 0, 0, 0, 1, 1,
0.9129725, 1.103245, 1.267355, 0, 0, 0, 1, 1,
0.9157106, 0.08690592, 1.297498, 0, 0, 0, 1, 1,
0.9176716, -0.7022045, 1.607235, 0, 0, 0, 1, 1,
0.9183396, 1.693452, 2.174757, 1, 1, 1, 1, 1,
0.9187256, -0.1281115, 3.175396, 1, 1, 1, 1, 1,
0.9267982, 1.33722, 1.25833, 1, 1, 1, 1, 1,
0.9270353, -0.4906071, 0.8846983, 1, 1, 1, 1, 1,
0.9275188, 0.4392212, 1.322725, 1, 1, 1, 1, 1,
0.9308327, -0.4279792, 2.429359, 1, 1, 1, 1, 1,
0.933994, -1.150975, 1.670652, 1, 1, 1, 1, 1,
0.9419714, -0.219865, -0.1982326, 1, 1, 1, 1, 1,
0.942086, 0.8357275, -0.142676, 1, 1, 1, 1, 1,
0.9462629, -0.2381953, 1.391749, 1, 1, 1, 1, 1,
0.9477593, 0.5743808, 0.3593065, 1, 1, 1, 1, 1,
0.9509718, -0.2885182, 0.5312499, 1, 1, 1, 1, 1,
0.9519939, -0.2954625, 1.944638, 1, 1, 1, 1, 1,
0.9591311, 0.2158828, 2.010284, 1, 1, 1, 1, 1,
0.9683749, -0.2436572, 0.5066286, 1, 1, 1, 1, 1,
0.9698067, 0.7680755, 3.098357, 0, 0, 1, 1, 1,
0.9786151, -0.8846523, 0.8545701, 1, 0, 0, 1, 1,
0.9851046, 0.1691666, 2.370564, 1, 0, 0, 1, 1,
1.000851, -0.7809144, 2.719681, 1, 0, 0, 1, 1,
1.001373, -1.705266, 3.707564, 1, 0, 0, 1, 1,
1.002099, -0.1926657, 0.3561426, 1, 0, 0, 1, 1,
1.010242, -1.818378, 1.979944, 0, 0, 0, 1, 1,
1.014615, -0.1928423, 1.153355, 0, 0, 0, 1, 1,
1.020061, -0.5283757, 1.218642, 0, 0, 0, 1, 1,
1.030498, -0.2528956, 1.655032, 0, 0, 0, 1, 1,
1.035282, 1.312399, 1.516214, 0, 0, 0, 1, 1,
1.036316, -0.6923477, 1.200302, 0, 0, 0, 1, 1,
1.049486, 1.423154, 2.158411, 0, 0, 0, 1, 1,
1.059585, 0.9295331, -0.4510509, 1, 1, 1, 1, 1,
1.064653, -0.6595169, 2.747751, 1, 1, 1, 1, 1,
1.066285, -0.764073, 4.175627, 1, 1, 1, 1, 1,
1.074854, -1.321189, 0.6873821, 1, 1, 1, 1, 1,
1.075058, 1.294785, 0.403692, 1, 1, 1, 1, 1,
1.076367, -2.058443, 3.273873, 1, 1, 1, 1, 1,
1.080283, 0.8703083, 1.962743, 1, 1, 1, 1, 1,
1.080546, -0.5413141, 1.725557, 1, 1, 1, 1, 1,
1.089708, 0.6970297, 0.1832719, 1, 1, 1, 1, 1,
1.098644, 1.391455, -0.2434588, 1, 1, 1, 1, 1,
1.109663, -1.050384, 1.751847, 1, 1, 1, 1, 1,
1.110291, 0.1142238, 1.639537, 1, 1, 1, 1, 1,
1.121573, -1.909987, 0.7589592, 1, 1, 1, 1, 1,
1.152536, -0.5862169, 2.268593, 1, 1, 1, 1, 1,
1.158288, -0.9100112, 2.787499, 1, 1, 1, 1, 1,
1.160162, 0.1441656, 1.715397, 0, 0, 1, 1, 1,
1.161846, -1.355755, 3.525927, 1, 0, 0, 1, 1,
1.168206, -1.359042, 2.322728, 1, 0, 0, 1, 1,
1.168744, 0.03444717, 1.190234, 1, 0, 0, 1, 1,
1.170389, 0.4147008, -0.1712503, 1, 0, 0, 1, 1,
1.173991, 0.1095259, 3.163381, 1, 0, 0, 1, 1,
1.192338, 1.425214, 2.575254, 0, 0, 0, 1, 1,
1.193372, -1.205005, 3.679085, 0, 0, 0, 1, 1,
1.196385, 0.7456004, 1.580612, 0, 0, 0, 1, 1,
1.196931, 1.084363, 1.780086, 0, 0, 0, 1, 1,
1.197713, -0.747422, 4.11088, 0, 0, 0, 1, 1,
1.201842, 1.471834, -0.04389044, 0, 0, 0, 1, 1,
1.202271, -0.2168913, 0.2402966, 0, 0, 0, 1, 1,
1.208794, -0.1021314, 1.90463, 1, 1, 1, 1, 1,
1.220153, 0.2875794, 0.8469145, 1, 1, 1, 1, 1,
1.22124, -0.173355, 1.494567, 1, 1, 1, 1, 1,
1.237765, 2.478539, 1.959574, 1, 1, 1, 1, 1,
1.257808, 0.395375, 0.738414, 1, 1, 1, 1, 1,
1.258657, -0.6424267, 2.084718, 1, 1, 1, 1, 1,
1.259097, -0.2487209, 3.426272, 1, 1, 1, 1, 1,
1.26132, 0.3847586, 0.01808746, 1, 1, 1, 1, 1,
1.265297, 1.304852, 1.603095, 1, 1, 1, 1, 1,
1.277975, -2.236421, 2.366359, 1, 1, 1, 1, 1,
1.278466, 0.2797391, 1.128469, 1, 1, 1, 1, 1,
1.280187, 0.5765461, 1.788007, 1, 1, 1, 1, 1,
1.283909, 1.248497, 0.3516237, 1, 1, 1, 1, 1,
1.28715, 1.028989, 2.15099, 1, 1, 1, 1, 1,
1.290005, -2.154819, 2.599336, 1, 1, 1, 1, 1,
1.292356, 1.568665, 0.2142787, 0, 0, 1, 1, 1,
1.293602, 0.5689729, 2.603038, 1, 0, 0, 1, 1,
1.304773, 0.3248437, 1.990377, 1, 0, 0, 1, 1,
1.312418, -0.5167372, 1.691069, 1, 0, 0, 1, 1,
1.313024, -0.3419201, 1.396769, 1, 0, 0, 1, 1,
1.313331, 1.251929, 0.08689538, 1, 0, 0, 1, 1,
1.316206, 2.386446, -1.170475, 0, 0, 0, 1, 1,
1.331427, -0.3825147, 1.141897, 0, 0, 0, 1, 1,
1.338706, -1.596251, 1.201899, 0, 0, 0, 1, 1,
1.338834, 0.2600439, 1.121508, 0, 0, 0, 1, 1,
1.347909, -0.9742953, 2.279212, 0, 0, 0, 1, 1,
1.355614, -1.139222, 2.991737, 0, 0, 0, 1, 1,
1.370541, -0.5130784, 1.696708, 0, 0, 0, 1, 1,
1.371344, -0.2744462, 3.370139, 1, 1, 1, 1, 1,
1.37925, -0.4149335, -1.016088, 1, 1, 1, 1, 1,
1.379684, 0.2496899, 1.54233, 1, 1, 1, 1, 1,
1.383516, 1.053952, 0.43489, 1, 1, 1, 1, 1,
1.389892, 0.3213999, 3.14384, 1, 1, 1, 1, 1,
1.394981, 1.14643, -1.658733, 1, 1, 1, 1, 1,
1.399557, -0.2192701, 2.853846, 1, 1, 1, 1, 1,
1.400882, 1.728812, 0.1955491, 1, 1, 1, 1, 1,
1.402999, -1.050782, 1.426481, 1, 1, 1, 1, 1,
1.407603, 1.461059, -0.9493351, 1, 1, 1, 1, 1,
1.413257, -0.7612548, 1.408697, 1, 1, 1, 1, 1,
1.419654, -0.4403807, 2.852398, 1, 1, 1, 1, 1,
1.424296, 1.670341, -0.9274981, 1, 1, 1, 1, 1,
1.450932, 2.716879, 0.9809366, 1, 1, 1, 1, 1,
1.456784, 1.063832, 0.1799664, 1, 1, 1, 1, 1,
1.457537, -0.803529, 2.067203, 0, 0, 1, 1, 1,
1.471181, 0.763572, 2.829972, 1, 0, 0, 1, 1,
1.473436, -0.6828626, 0.06790695, 1, 0, 0, 1, 1,
1.478526, -0.4909402, 2.595072, 1, 0, 0, 1, 1,
1.479283, 2.157446, 0.1365228, 1, 0, 0, 1, 1,
1.484746, -0.318448, 0.5704435, 1, 0, 0, 1, 1,
1.487997, 0.2107823, 1.653998, 0, 0, 0, 1, 1,
1.495419, 0.4125424, 0.3940316, 0, 0, 0, 1, 1,
1.498235, 0.3444057, 1.728321, 0, 0, 0, 1, 1,
1.500015, -0.1736989, 1.751434, 0, 0, 0, 1, 1,
1.51041, 0.8829692, 0.3372447, 0, 0, 0, 1, 1,
1.520817, 1.204433, 0.8944525, 0, 0, 0, 1, 1,
1.521287, -1.737692, 1.648845, 0, 0, 0, 1, 1,
1.528582, -1.476696, 3.007341, 1, 1, 1, 1, 1,
1.53013, -0.5105207, 2.860642, 1, 1, 1, 1, 1,
1.536451, -0.7332018, 0.3115226, 1, 1, 1, 1, 1,
1.538415, -0.06739949, 1.457696, 1, 1, 1, 1, 1,
1.541516, 1.053599, 0.9660813, 1, 1, 1, 1, 1,
1.541987, -0.3616632, 1.067332, 1, 1, 1, 1, 1,
1.550355, 0.03245787, 0.9460935, 1, 1, 1, 1, 1,
1.561473, -0.3867096, 2.023149, 1, 1, 1, 1, 1,
1.569536, -1.179386, 1.51288, 1, 1, 1, 1, 1,
1.580088, 0.4002118, 1.359674, 1, 1, 1, 1, 1,
1.582667, 0.4084478, 0.5561953, 1, 1, 1, 1, 1,
1.586226, -0.4466667, 1.539195, 1, 1, 1, 1, 1,
1.616682, 1.118681, 2.07352, 1, 1, 1, 1, 1,
1.633844, -0.4579935, 1.258795, 1, 1, 1, 1, 1,
1.637345, -0.6285616, 2.645875, 1, 1, 1, 1, 1,
1.644621, 2.492901, 2.413595, 0, 0, 1, 1, 1,
1.65326, 0.9149801, 1.661023, 1, 0, 0, 1, 1,
1.656557, -1.252042, 1.108083, 1, 0, 0, 1, 1,
1.667181, -0.9778734, 0.9916015, 1, 0, 0, 1, 1,
1.67704, -1.282084, 3.243554, 1, 0, 0, 1, 1,
1.684706, 1.400339, 0.656879, 1, 0, 0, 1, 1,
1.711391, 0.02078938, -0.6364481, 0, 0, 0, 1, 1,
1.711623, 0.7528405, 2.442363, 0, 0, 0, 1, 1,
1.712633, -0.1507753, 2.764654, 0, 0, 0, 1, 1,
1.71687, -0.3232507, 1.107276, 0, 0, 0, 1, 1,
1.723996, 0.04295022, 1.112652, 0, 0, 0, 1, 1,
1.729096, -0.03260761, 0.570922, 0, 0, 0, 1, 1,
1.736207, 1.473362, 0.5981667, 0, 0, 0, 1, 1,
1.742409, -0.8703442, 2.426148, 1, 1, 1, 1, 1,
1.746704, 0.6891383, 0.4096701, 1, 1, 1, 1, 1,
1.748474, 2.175986, 1.895327, 1, 1, 1, 1, 1,
1.750169, 0.269096, 2.711048, 1, 1, 1, 1, 1,
1.763567, 0.6127148, 1.247555, 1, 1, 1, 1, 1,
1.790431, -0.4974985, 2.018661, 1, 1, 1, 1, 1,
1.79396, 0.5425605, 0.9379374, 1, 1, 1, 1, 1,
1.819318, 0.1378155, 2.326332, 1, 1, 1, 1, 1,
1.832563, -0.08214025, 1.51596, 1, 1, 1, 1, 1,
1.833831, -0.7445257, 1.397498, 1, 1, 1, 1, 1,
1.853207, -2.143164, 2.52828, 1, 1, 1, 1, 1,
1.855299, -1.511169, 4.619308, 1, 1, 1, 1, 1,
1.85572, -0.5886906, 3.976006, 1, 1, 1, 1, 1,
1.948988, 1.038731, 0.08627267, 1, 1, 1, 1, 1,
1.961868, -0.7953129, 3.694658, 1, 1, 1, 1, 1,
1.963306, -1.248899, 3.159464, 0, 0, 1, 1, 1,
1.96538, -0.58123, 3.574094, 1, 0, 0, 1, 1,
1.978722, -1.12752, 2.389945, 1, 0, 0, 1, 1,
2.052983, -0.03437875, 1.577374, 1, 0, 0, 1, 1,
2.070946, -0.1542125, 0.6189989, 1, 0, 0, 1, 1,
2.129732, 0.8882748, 1.554716, 1, 0, 0, 1, 1,
2.139104, 0.9344691, 0.7187251, 0, 0, 0, 1, 1,
2.248831, 0.4097347, 1.381843, 0, 0, 0, 1, 1,
2.257208, 0.5514762, 1.997942, 0, 0, 0, 1, 1,
2.261617, -0.900733, 1.283456, 0, 0, 0, 1, 1,
2.355952, 0.7566797, 0.5431738, 0, 0, 0, 1, 1,
2.449205, -1.255815, 0.5332129, 0, 0, 0, 1, 1,
2.466226, -0.04498312, 2.240433, 0, 0, 0, 1, 1,
2.538338, 0.4893451, 1.961413, 1, 1, 1, 1, 1,
2.574693, 1.61442, 0.8687798, 1, 1, 1, 1, 1,
2.717452, 0.1711007, 1.174261, 1, 1, 1, 1, 1,
2.846644, 0.2302086, 0.7304091, 1, 1, 1, 1, 1,
2.981284, 1.972057, 0.984934, 1, 1, 1, 1, 1,
3.02662, 0.7118153, 1.004907, 1, 1, 1, 1, 1,
4.040277, 2.616859, 1.251433, 1, 1, 1, 1, 1
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
var radius = 9.843832;
var distance = 34.57604;
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
mvMatrix.translate( -0.5683613, -0.0742259, 0.6211519 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.57604);
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