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
-3.101322, -0.08137014, -0.3276121, 1, 0, 0, 1,
-2.73648, -0.02915002, -0.282634, 1, 0.007843138, 0, 1,
-2.703249, -0.75063, -1.865701, 1, 0.01176471, 0, 1,
-2.551394, -0.5356227, -1.23296, 1, 0.01960784, 0, 1,
-2.537462, -0.5660192, -1.495558, 1, 0.02352941, 0, 1,
-2.400408, -0.1698165, -1.805635, 1, 0.03137255, 0, 1,
-2.330794, -0.5420529, -0.505122, 1, 0.03529412, 0, 1,
-2.318328, -0.7325537, -1.222263, 1, 0.04313726, 0, 1,
-2.253443, -2.086146, -1.501205, 1, 0.04705882, 0, 1,
-2.250023, 0.9447018, -0.4976549, 1, 0.05490196, 0, 1,
-2.192049, -1.175049, -1.66884, 1, 0.05882353, 0, 1,
-2.157657, 0.4662314, -0.6761166, 1, 0.06666667, 0, 1,
-2.101686, 0.4414357, -1.356455, 1, 0.07058824, 0, 1,
-2.099926, 0.1292738, -2.859089, 1, 0.07843138, 0, 1,
-2.096094, 0.5051431, -2.045898, 1, 0.08235294, 0, 1,
-2.089688, 1.553433, -2.073677, 1, 0.09019608, 0, 1,
-2.046107, -0.259343, -2.106811, 1, 0.09411765, 0, 1,
-2.030568, 0.1559947, -2.168607, 1, 0.1019608, 0, 1,
-1.985652, -0.9317966, -2.075356, 1, 0.1098039, 0, 1,
-1.979042, 3.519098, 0.4415999, 1, 0.1137255, 0, 1,
-1.977778, -0.3176964, -4.228655, 1, 0.1215686, 0, 1,
-1.949936, 0.3885486, -1.32857, 1, 0.1254902, 0, 1,
-1.946679, -1.690101, -1.894372, 1, 0.1333333, 0, 1,
-1.942693, 0.1048236, -1.188361, 1, 0.1372549, 0, 1,
-1.942135, 0.1017076, -0.8037108, 1, 0.145098, 0, 1,
-1.939484, -1.017603, -0.4140343, 1, 0.1490196, 0, 1,
-1.934927, -0.5233238, -3.883644, 1, 0.1568628, 0, 1,
-1.923952, 1.765867, 0.01430722, 1, 0.1607843, 0, 1,
-1.916263, 1.574695, -1.316179, 1, 0.1686275, 0, 1,
-1.91481, -0.7691036, -3.118854, 1, 0.172549, 0, 1,
-1.908635, -0.06849691, -2.336237, 1, 0.1803922, 0, 1,
-1.903942, 0.6486779, -1.382526, 1, 0.1843137, 0, 1,
-1.901216, 0.5970212, -2.300747, 1, 0.1921569, 0, 1,
-1.892882, -0.5694452, -0.8595132, 1, 0.1960784, 0, 1,
-1.885701, 0.5410935, -0.3727966, 1, 0.2039216, 0, 1,
-1.868742, -0.130273, -3.185072, 1, 0.2117647, 0, 1,
-1.845881, 0.08976283, -2.98823, 1, 0.2156863, 0, 1,
-1.842404, -0.4211766, -0.8223161, 1, 0.2235294, 0, 1,
-1.842382, 1.272262, -2.315602, 1, 0.227451, 0, 1,
-1.829135, 0.4177132, -3.153509, 1, 0.2352941, 0, 1,
-1.822557, -0.7573366, -1.556622, 1, 0.2392157, 0, 1,
-1.814453, -0.1073766, -0.9612346, 1, 0.2470588, 0, 1,
-1.805368, -0.9963752, -2.828137, 1, 0.2509804, 0, 1,
-1.804573, -1.113304, -2.114806, 1, 0.2588235, 0, 1,
-1.787465, 0.1914041, -1.128221, 1, 0.2627451, 0, 1,
-1.769492, 1.48506, 0.5438135, 1, 0.2705882, 0, 1,
-1.760172, -0.1068567, -4.253023, 1, 0.2745098, 0, 1,
-1.759953, 0.644654, -2.98091, 1, 0.282353, 0, 1,
-1.757263, -0.6719071, -2.018009, 1, 0.2862745, 0, 1,
-1.749147, 1.160183, -0.586561, 1, 0.2941177, 0, 1,
-1.747786, 0.2568516, -0.7081212, 1, 0.3019608, 0, 1,
-1.741226, 0.2824401, -1.368584, 1, 0.3058824, 0, 1,
-1.73823, -0.1953609, -1.589357, 1, 0.3137255, 0, 1,
-1.733, -0.1498373, -1.166051, 1, 0.3176471, 0, 1,
-1.727791, -0.1537733, -1.969455, 1, 0.3254902, 0, 1,
-1.725217, -0.3752322, -1.274599, 1, 0.3294118, 0, 1,
-1.721131, 0.1904918, -0.8823979, 1, 0.3372549, 0, 1,
-1.711671, -0.8614081, -3.628111, 1, 0.3411765, 0, 1,
-1.71109, -0.650691, -3.402987, 1, 0.3490196, 0, 1,
-1.681187, 0.8190504, -0.9432905, 1, 0.3529412, 0, 1,
-1.679025, -0.7883246, -2.414029, 1, 0.3607843, 0, 1,
-1.671424, -0.8589364, -2.518347, 1, 0.3647059, 0, 1,
-1.659742, -0.7082555, -3.689498, 1, 0.372549, 0, 1,
-1.636256, -0.4616574, -3.102695, 1, 0.3764706, 0, 1,
-1.635564, 0.666907, -0.4618117, 1, 0.3843137, 0, 1,
-1.634146, -0.9236932, 0.2686469, 1, 0.3882353, 0, 1,
-1.630587, -0.0359767, -0.6877689, 1, 0.3960784, 0, 1,
-1.623421, 0.6991904, -2.715496, 1, 0.4039216, 0, 1,
-1.619411, -1.628037, -1.074295, 1, 0.4078431, 0, 1,
-1.61759, 1.436119, -0.7294389, 1, 0.4156863, 0, 1,
-1.616229, 2.024684, 0.3275411, 1, 0.4196078, 0, 1,
-1.604996, -0.644548, -1.673308, 1, 0.427451, 0, 1,
-1.595223, 1.081747, -0.8530518, 1, 0.4313726, 0, 1,
-1.586318, 0.5602819, -1.704663, 1, 0.4392157, 0, 1,
-1.583444, -1.984714, -2.928987, 1, 0.4431373, 0, 1,
-1.570153, 0.7500936, -1.494987, 1, 0.4509804, 0, 1,
-1.567043, -1.197567, -1.601795, 1, 0.454902, 0, 1,
-1.565906, 0.3736656, -2.158218, 1, 0.4627451, 0, 1,
-1.561472, -0.6769181, -3.169312, 1, 0.4666667, 0, 1,
-1.559423, -2.01456, -2.845775, 1, 0.4745098, 0, 1,
-1.547787, 0.2287467, -2.495013, 1, 0.4784314, 0, 1,
-1.546038, 1.453683, -1.708643, 1, 0.4862745, 0, 1,
-1.528694, 1.188568, -2.030037, 1, 0.4901961, 0, 1,
-1.524788, 0.5701966, -0.1712776, 1, 0.4980392, 0, 1,
-1.517137, 0.9584417, -3.070812, 1, 0.5058824, 0, 1,
-1.508447, -0.6076074, -3.213268, 1, 0.509804, 0, 1,
-1.507219, 0.7642177, -1.812042, 1, 0.5176471, 0, 1,
-1.493974, 1.731901, 0.07188113, 1, 0.5215687, 0, 1,
-1.488306, 1.457175, -2.130504, 1, 0.5294118, 0, 1,
-1.470204, -0.80607, -3.569388, 1, 0.5333334, 0, 1,
-1.469028, 0.08606853, 1.010239, 1, 0.5411765, 0, 1,
-1.466954, -0.3706935, -1.699476, 1, 0.5450981, 0, 1,
-1.456924, -0.6085916, -2.225879, 1, 0.5529412, 0, 1,
-1.447255, 1.896269, -0.6213328, 1, 0.5568628, 0, 1,
-1.447233, 1.768065, 0.725244, 1, 0.5647059, 0, 1,
-1.44208, 1.409971, 0.5203394, 1, 0.5686275, 0, 1,
-1.441031, 0.5186318, -0.2005259, 1, 0.5764706, 0, 1,
-1.435564, 0.3151188, -2.664567, 1, 0.5803922, 0, 1,
-1.43543, 0.8375357, -0.6275958, 1, 0.5882353, 0, 1,
-1.425866, 1.095826, -0.7599247, 1, 0.5921569, 0, 1,
-1.425541, -0.1690045, -0.6236683, 1, 0.6, 0, 1,
-1.418442, 0.732653, 0.6450761, 1, 0.6078432, 0, 1,
-1.414983, -1.023379, -2.545083, 1, 0.6117647, 0, 1,
-1.405946, 0.6814207, 1.343246, 1, 0.6196079, 0, 1,
-1.400614, 1.68877, 0.02329771, 1, 0.6235294, 0, 1,
-1.399166, 0.1486711, -0.8687932, 1, 0.6313726, 0, 1,
-1.397117, -0.1578842, -1.761801, 1, 0.6352941, 0, 1,
-1.382009, -0.2544574, -3.165743, 1, 0.6431373, 0, 1,
-1.373882, 0.4802631, -2.032597, 1, 0.6470588, 0, 1,
-1.371922, 0.6409415, -1.151244, 1, 0.654902, 0, 1,
-1.371111, -1.871326, -2.106171, 1, 0.6588235, 0, 1,
-1.364599, -2.343348, -3.303765, 1, 0.6666667, 0, 1,
-1.356669, -0.1464129, -1.970732, 1, 0.6705883, 0, 1,
-1.322749, -0.6069561, -3.006995, 1, 0.6784314, 0, 1,
-1.318788, 0.9935202, -1.183625, 1, 0.682353, 0, 1,
-1.315578, 0.2867034, -1.83916, 1, 0.6901961, 0, 1,
-1.31452, -0.3563926, -2.664964, 1, 0.6941177, 0, 1,
-1.311587, 1.48055, -1.245065, 1, 0.7019608, 0, 1,
-1.308257, 0.2585859, -1.119856, 1, 0.7098039, 0, 1,
-1.307033, 1.499776, -0.6115348, 1, 0.7137255, 0, 1,
-1.301255, 1.818079, 0.9741376, 1, 0.7215686, 0, 1,
-1.300211, 1.040534, -0.3677479, 1, 0.7254902, 0, 1,
-1.298735, 0.7714403, -0.9572598, 1, 0.7333333, 0, 1,
-1.293475, -0.9993959, -2.367191, 1, 0.7372549, 0, 1,
-1.289014, 0.8592094, -0.652209, 1, 0.7450981, 0, 1,
-1.284105, -0.1807618, -1.848358, 1, 0.7490196, 0, 1,
-1.282438, -1.337915, -2.622406, 1, 0.7568628, 0, 1,
-1.277901, 1.382944, -2.295607, 1, 0.7607843, 0, 1,
-1.262694, -0.008438888, -1.899987, 1, 0.7686275, 0, 1,
-1.260577, -0.6635522, -2.677411, 1, 0.772549, 0, 1,
-1.255647, -0.03156171, -2.800887, 1, 0.7803922, 0, 1,
-1.246738, -0.25971, -1.199538, 1, 0.7843137, 0, 1,
-1.244208, 0.8803966, -2.18561, 1, 0.7921569, 0, 1,
-1.239081, 0.7373034, -0.9804028, 1, 0.7960784, 0, 1,
-1.229777, -1.983104, -1.806857, 1, 0.8039216, 0, 1,
-1.222499, -0.5713871, -2.82656, 1, 0.8117647, 0, 1,
-1.206379, 1.050381, -0.1364297, 1, 0.8156863, 0, 1,
-1.205742, 0.9134311, -1.907466, 1, 0.8235294, 0, 1,
-1.203883, -1.164186, -1.431056, 1, 0.827451, 0, 1,
-1.199892, -0.0767262, -1.142687, 1, 0.8352941, 0, 1,
-1.194574, -1.843602, -2.209477, 1, 0.8392157, 0, 1,
-1.182968, 0.8623207, -1.892363, 1, 0.8470588, 0, 1,
-1.180827, -0.4804733, -1.010587, 1, 0.8509804, 0, 1,
-1.160866, -0.9435599, -2.68648, 1, 0.8588235, 0, 1,
-1.160497, -0.370664, -0.7492365, 1, 0.8627451, 0, 1,
-1.158051, -0.4000573, -2.929982, 1, 0.8705882, 0, 1,
-1.154671, -0.3727648, -2.185664, 1, 0.8745098, 0, 1,
-1.151938, -0.5252187, -1.715114, 1, 0.8823529, 0, 1,
-1.151088, 0.7849159, -1.094867, 1, 0.8862745, 0, 1,
-1.150916, -0.3485276, -1.976146, 1, 0.8941177, 0, 1,
-1.147961, 2.403354, -0.307077, 1, 0.8980392, 0, 1,
-1.142809, -2.040862, -3.680689, 1, 0.9058824, 0, 1,
-1.138357, 0.02598608, -1.745655, 1, 0.9137255, 0, 1,
-1.134924, 0.5582663, 0.8018633, 1, 0.9176471, 0, 1,
-1.132384, -1.007345, -1.279781, 1, 0.9254902, 0, 1,
-1.119461, 0.1818086, -2.336235, 1, 0.9294118, 0, 1,
-1.117573, 1.503733, -0.02926995, 1, 0.9372549, 0, 1,
-1.107845, -0.1613046, -2.687503, 1, 0.9411765, 0, 1,
-1.098938, -0.09263877, -2.01969, 1, 0.9490196, 0, 1,
-1.097838, 0.1615449, -1.165978, 1, 0.9529412, 0, 1,
-1.088205, -0.9932753, -1.586544, 1, 0.9607843, 0, 1,
-1.084039, 1.309264, -2.027436, 1, 0.9647059, 0, 1,
-1.076575, 0.4215863, -0.7278486, 1, 0.972549, 0, 1,
-1.071947, -0.1127465, -1.791043, 1, 0.9764706, 0, 1,
-1.070936, -0.8621067, -1.302298, 1, 0.9843137, 0, 1,
-1.066335, -0.8990657, -2.669146, 1, 0.9882353, 0, 1,
-1.065876, 0.3464383, 0.2311074, 1, 0.9960784, 0, 1,
-1.054618, -0.8830802, -2.134999, 0.9960784, 1, 0, 1,
-1.048828, 0.4932314, -0.8075414, 0.9921569, 1, 0, 1,
-1.047222, 2.002915, -0.710486, 0.9843137, 1, 0, 1,
-1.0326, 2.091683, -0.9672266, 0.9803922, 1, 0, 1,
-1.023314, 0.7301196, -0.007297497, 0.972549, 1, 0, 1,
-1.018256, 0.2504145, -2.254867, 0.9686275, 1, 0, 1,
-1.008439, 0.7393894, -1.727939, 0.9607843, 1, 0, 1,
-1.0057, 0.3291339, -1.021667, 0.9568627, 1, 0, 1,
-1.000107, -0.6738167, -1.270141, 0.9490196, 1, 0, 1,
-0.9990087, 0.2266509, -0.2743865, 0.945098, 1, 0, 1,
-0.9988728, 0.5782356, -0.8196057, 0.9372549, 1, 0, 1,
-0.9890303, -0.4015784, -3.506441, 0.9333333, 1, 0, 1,
-0.9856428, 0.6475093, -2.600013, 0.9254902, 1, 0, 1,
-0.9765213, 0.3896797, -0.4529949, 0.9215686, 1, 0, 1,
-0.9699316, -0.4021436, -1.634411, 0.9137255, 1, 0, 1,
-0.9696072, -1.195705, -2.172049, 0.9098039, 1, 0, 1,
-0.964112, -0.4840045, -1.758989, 0.9019608, 1, 0, 1,
-0.9529825, 0.6169633, -0.7071298, 0.8941177, 1, 0, 1,
-0.952732, -0.04977395, -0.6693212, 0.8901961, 1, 0, 1,
-0.9350234, -0.2739042, -2.435397, 0.8823529, 1, 0, 1,
-0.9344484, 0.6954033, 0.4638206, 0.8784314, 1, 0, 1,
-0.9335774, 0.4357096, -2.091511, 0.8705882, 1, 0, 1,
-0.926487, 1.222197, -0.3890998, 0.8666667, 1, 0, 1,
-0.922773, 0.8389252, 0.6356716, 0.8588235, 1, 0, 1,
-0.920076, 0.09732737, -1.440902, 0.854902, 1, 0, 1,
-0.9183915, 0.1932235, 1.076488, 0.8470588, 1, 0, 1,
-0.9062379, 0.8936936, -1.058836, 0.8431373, 1, 0, 1,
-0.9039827, -0.2882794, -1.209611, 0.8352941, 1, 0, 1,
-0.8981621, -2.003754, -3.236069, 0.8313726, 1, 0, 1,
-0.8957905, 0.994445, -0.534066, 0.8235294, 1, 0, 1,
-0.8844781, 0.504268, -3.175648, 0.8196079, 1, 0, 1,
-0.880399, 0.5581223, -2.089309, 0.8117647, 1, 0, 1,
-0.8737962, -0.5636727, -1.045359, 0.8078431, 1, 0, 1,
-0.8644243, 1.657936, 0.336975, 0.8, 1, 0, 1,
-0.8577726, -0.48847, -1.757097, 0.7921569, 1, 0, 1,
-0.8542368, 0.9412886, 0.2347033, 0.7882353, 1, 0, 1,
-0.8535261, 1.926583, -1.434208, 0.7803922, 1, 0, 1,
-0.8502432, 1.327258, -2.957598, 0.7764706, 1, 0, 1,
-0.8450379, -0.01111841, -1.456495, 0.7686275, 1, 0, 1,
-0.8419485, -1.166818, -2.521997, 0.7647059, 1, 0, 1,
-0.8384551, 1.724846, -0.2146447, 0.7568628, 1, 0, 1,
-0.8373865, 0.1717468, -0.09908254, 0.7529412, 1, 0, 1,
-0.8335249, 0.4723817, -0.4747425, 0.7450981, 1, 0, 1,
-0.832226, 0.09063232, -0.9946628, 0.7411765, 1, 0, 1,
-0.8309709, 0.4685499, -3.8903, 0.7333333, 1, 0, 1,
-0.8309032, -0.7557614, -1.113684, 0.7294118, 1, 0, 1,
-0.826454, 0.09464697, -1.482601, 0.7215686, 1, 0, 1,
-0.8187407, -2.414211, -3.601799, 0.7176471, 1, 0, 1,
-0.8175331, 1.109127, -1.97628, 0.7098039, 1, 0, 1,
-0.8129654, -0.5937755, -3.062418, 0.7058824, 1, 0, 1,
-0.8103445, 0.00920403, -3.549498, 0.6980392, 1, 0, 1,
-0.8102188, -2.132039, -2.403844, 0.6901961, 1, 0, 1,
-0.8069021, -0.8852983, -1.909067, 0.6862745, 1, 0, 1,
-0.8066598, 0.3245717, -0.9300635, 0.6784314, 1, 0, 1,
-0.8049752, 0.3894864, -2.365166, 0.6745098, 1, 0, 1,
-0.8044369, 0.1019649, -1.224564, 0.6666667, 1, 0, 1,
-0.8003175, -1.141899, -1.399351, 0.6627451, 1, 0, 1,
-0.7941186, 1.967968, -1.144914, 0.654902, 1, 0, 1,
-0.7926824, -1.01565, -3.087718, 0.6509804, 1, 0, 1,
-0.7844082, -0.6398273, -3.212447, 0.6431373, 1, 0, 1,
-0.7758517, -2.006471, -3.01865, 0.6392157, 1, 0, 1,
-0.7722027, -1.250373, -2.032678, 0.6313726, 1, 0, 1,
-0.7700156, -1.235021, -3.608383, 0.627451, 1, 0, 1,
-0.7634345, -0.2950782, -2.693996, 0.6196079, 1, 0, 1,
-0.7633964, -1.032961, -2.220051, 0.6156863, 1, 0, 1,
-0.7617349, -1.292848, -1.773759, 0.6078432, 1, 0, 1,
-0.7568768, -0.6660107, -4.368915, 0.6039216, 1, 0, 1,
-0.7522584, 0.3800051, -0.03281752, 0.5960785, 1, 0, 1,
-0.7500453, 1.278978, -1.519516, 0.5882353, 1, 0, 1,
-0.7469684, 0.3973106, -1.764713, 0.5843138, 1, 0, 1,
-0.745079, -0.7436246, -3.287517, 0.5764706, 1, 0, 1,
-0.7434659, -0.07983695, 0.1297692, 0.572549, 1, 0, 1,
-0.7433742, 2.079461, -0.680324, 0.5647059, 1, 0, 1,
-0.7426932, 1.876319, -1.95184, 0.5607843, 1, 0, 1,
-0.7421684, 0.4917318, -0.9237092, 0.5529412, 1, 0, 1,
-0.7370942, 1.15026, 0.924769, 0.5490196, 1, 0, 1,
-0.7349646, 0.3494248, -0.2328671, 0.5411765, 1, 0, 1,
-0.7334898, 0.8313045, -2.006564, 0.5372549, 1, 0, 1,
-0.7238747, 1.08082, -1.659483, 0.5294118, 1, 0, 1,
-0.7131422, 0.3655983, 0.6600423, 0.5254902, 1, 0, 1,
-0.7128555, 0.6774158, -1.779673, 0.5176471, 1, 0, 1,
-0.7108605, -1.062694, -0.2062839, 0.5137255, 1, 0, 1,
-0.7103216, 0.678139, 1.192602, 0.5058824, 1, 0, 1,
-0.708323, -2.129118, -2.226482, 0.5019608, 1, 0, 1,
-0.7075778, 0.2196772, -0.4118867, 0.4941176, 1, 0, 1,
-0.7038081, 0.3586344, -3.040367, 0.4862745, 1, 0, 1,
-0.703359, -0.3629687, -3.53376, 0.4823529, 1, 0, 1,
-0.6990561, 0.3897733, -1.425132, 0.4745098, 1, 0, 1,
-0.6989686, -0.4164331, -3.129574, 0.4705882, 1, 0, 1,
-0.6981975, -0.7741785, -2.413109, 0.4627451, 1, 0, 1,
-0.6896022, 0.6995854, 0.2972777, 0.4588235, 1, 0, 1,
-0.6811441, -0.9977941, -2.274137, 0.4509804, 1, 0, 1,
-0.6810079, -2.088686, -4.52999, 0.4470588, 1, 0, 1,
-0.6793602, 0.9429026, -1.376899, 0.4392157, 1, 0, 1,
-0.6634036, 0.0906491, -2.459559, 0.4352941, 1, 0, 1,
-0.6583135, 0.1132277, -1.437772, 0.427451, 1, 0, 1,
-0.6570202, 0.5212244, -0.1230419, 0.4235294, 1, 0, 1,
-0.656444, -0.5817335, -3.685397, 0.4156863, 1, 0, 1,
-0.6563548, 1.155645, -0.4263062, 0.4117647, 1, 0, 1,
-0.6561909, -1.277002, -2.536893, 0.4039216, 1, 0, 1,
-0.6558882, 1.038434, -0.8767574, 0.3960784, 1, 0, 1,
-0.6439991, 1.609887, -0.7484605, 0.3921569, 1, 0, 1,
-0.638939, 0.7031254, -0.2479508, 0.3843137, 1, 0, 1,
-0.638307, -1.085863, -1.951379, 0.3803922, 1, 0, 1,
-0.6344574, 0.1881902, -1.209463, 0.372549, 1, 0, 1,
-0.6253561, -0.2431228, -4.219687, 0.3686275, 1, 0, 1,
-0.6249683, 0.6133139, 1.287457, 0.3607843, 1, 0, 1,
-0.6154767, -0.09656326, -2.696373, 0.3568628, 1, 0, 1,
-0.6143791, -0.8363785, -3.425887, 0.3490196, 1, 0, 1,
-0.6101041, 1.671751, -1.262227, 0.345098, 1, 0, 1,
-0.6086357, 0.1353234, -0.08397335, 0.3372549, 1, 0, 1,
-0.606717, 0.1896314, -0.162771, 0.3333333, 1, 0, 1,
-0.6015113, -0.06561667, -1.662274, 0.3254902, 1, 0, 1,
-0.5978419, -0.005674069, -2.35052, 0.3215686, 1, 0, 1,
-0.5960375, 1.815911, -0.1101437, 0.3137255, 1, 0, 1,
-0.5948776, -0.6683093, -2.024471, 0.3098039, 1, 0, 1,
-0.5888237, -0.4146214, -1.971147, 0.3019608, 1, 0, 1,
-0.5874008, 0.3112295, -0.5944859, 0.2941177, 1, 0, 1,
-0.5872486, -1.072767, -0.5575525, 0.2901961, 1, 0, 1,
-0.5841229, -1.952099, -1.479803, 0.282353, 1, 0, 1,
-0.5830535, -1.302224, -2.925767, 0.2784314, 1, 0, 1,
-0.5820144, 0.3452527, 0.5467549, 0.2705882, 1, 0, 1,
-0.581048, -0.1828949, -2.048033, 0.2666667, 1, 0, 1,
-0.5809439, 0.1097232, -0.8946639, 0.2588235, 1, 0, 1,
-0.5780741, -1.005572, -2.462246, 0.254902, 1, 0, 1,
-0.5734663, -1.233329, -3.125004, 0.2470588, 1, 0, 1,
-0.5709998, 0.07301065, -2.687266, 0.2431373, 1, 0, 1,
-0.5704305, 0.2598608, -1.142259, 0.2352941, 1, 0, 1,
-0.5662545, -0.5777299, -2.495671, 0.2313726, 1, 0, 1,
-0.5658136, -0.4530047, -2.26492, 0.2235294, 1, 0, 1,
-0.5605546, 0.5869371, -2.62437, 0.2196078, 1, 0, 1,
-0.549588, -0.9944507, -3.059697, 0.2117647, 1, 0, 1,
-0.5492357, -0.4464747, -3.163437, 0.2078431, 1, 0, 1,
-0.5484464, -1.712098, -1.831375, 0.2, 1, 0, 1,
-0.5462874, -1.732078, -3.011234, 0.1921569, 1, 0, 1,
-0.5425102, 0.8840895, -0.06744127, 0.1882353, 1, 0, 1,
-0.5409719, 0.4805872, -0.1001507, 0.1803922, 1, 0, 1,
-0.5372705, 0.02541773, -2.334728, 0.1764706, 1, 0, 1,
-0.5358827, -0.7406075, -2.520457, 0.1686275, 1, 0, 1,
-0.5341619, 1.508871, -2.589437, 0.1647059, 1, 0, 1,
-0.5303515, -0.9442025, -3.183288, 0.1568628, 1, 0, 1,
-0.5280994, 1.147374, 0.7616886, 0.1529412, 1, 0, 1,
-0.5226621, -1.55748, -4.082145, 0.145098, 1, 0, 1,
-0.5193735, -0.1200105, -1.738165, 0.1411765, 1, 0, 1,
-0.5191582, 0.3372322, -1.792938, 0.1333333, 1, 0, 1,
-0.5099155, -0.1146169, -0.1976312, 0.1294118, 1, 0, 1,
-0.5043797, 1.003802, -0.633011, 0.1215686, 1, 0, 1,
-0.5043788, -0.364943, -0.5837782, 0.1176471, 1, 0, 1,
-0.5029401, -1.254032, -3.195644, 0.1098039, 1, 0, 1,
-0.5028661, -2.264021, -3.038655, 0.1058824, 1, 0, 1,
-0.4987479, -0.2929345, -1.691846, 0.09803922, 1, 0, 1,
-0.490435, 0.4474608, -1.439045, 0.09019608, 1, 0, 1,
-0.4861335, -0.0111264, -1.389692, 0.08627451, 1, 0, 1,
-0.4851854, -0.3546173, -1.060586, 0.07843138, 1, 0, 1,
-0.4795898, -1.504741, -3.842859, 0.07450981, 1, 0, 1,
-0.4753622, 0.6042321, -1.67379, 0.06666667, 1, 0, 1,
-0.474461, -1.386837, -4.144678, 0.0627451, 1, 0, 1,
-0.4727597, 0.6422395, 1.024046, 0.05490196, 1, 0, 1,
-0.4687377, 0.206573, -1.353891, 0.05098039, 1, 0, 1,
-0.4644139, 2.043626, 0.3412992, 0.04313726, 1, 0, 1,
-0.46385, 0.5590262, -1.598105, 0.03921569, 1, 0, 1,
-0.4636124, 0.5985738, -0.7728635, 0.03137255, 1, 0, 1,
-0.4620512, -1.98255, -3.623181, 0.02745098, 1, 0, 1,
-0.4527206, -0.124579, -0.3433526, 0.01960784, 1, 0, 1,
-0.4517619, -1.559807, -1.905585, 0.01568628, 1, 0, 1,
-0.450181, -0.5446918, -1.450421, 0.007843138, 1, 0, 1,
-0.4476397, 1.304772, -1.093778, 0.003921569, 1, 0, 1,
-0.4463753, 0.127607, -1.462279, 0, 1, 0.003921569, 1,
-0.4458399, 1.495587, 0.3961321, 0, 1, 0.01176471, 1,
-0.4430937, 0.2780428, -3.09565, 0, 1, 0.01568628, 1,
-0.4429063, 0.2402979, -0.06877612, 0, 1, 0.02352941, 1,
-0.4387827, 0.5706571, -1.295985, 0, 1, 0.02745098, 1,
-0.4358657, -0.5628967, -2.259263, 0, 1, 0.03529412, 1,
-0.4313622, 2.295206, -1.81022, 0, 1, 0.03921569, 1,
-0.430318, -0.4195116, -1.329514, 0, 1, 0.04705882, 1,
-0.4247328, 0.3376649, -0.8499421, 0, 1, 0.05098039, 1,
-0.4198248, 0.7540087, 0.01073523, 0, 1, 0.05882353, 1,
-0.419226, -1.064379, -2.090259, 0, 1, 0.0627451, 1,
-0.4174852, -0.6107536, -1.408623, 0, 1, 0.07058824, 1,
-0.4087867, -0.8490782, -2.392806, 0, 1, 0.07450981, 1,
-0.4087118, -0.9162837, -1.821314, 0, 1, 0.08235294, 1,
-0.4054284, 0.04103994, -1.519692, 0, 1, 0.08627451, 1,
-0.4014095, 0.6247025, -0.4591408, 0, 1, 0.09411765, 1,
-0.399857, 0.8989379, 1.166826, 0, 1, 0.1019608, 1,
-0.395719, 1.479885, -1.38332, 0, 1, 0.1058824, 1,
-0.3957091, 0.6454483, 0.04898168, 0, 1, 0.1137255, 1,
-0.3941934, -0.06012462, -2.052739, 0, 1, 0.1176471, 1,
-0.389011, 0.9736229, 0.9232705, 0, 1, 0.1254902, 1,
-0.3883213, 0.763827, -0.9769144, 0, 1, 0.1294118, 1,
-0.3878801, -0.7991253, -2.577294, 0, 1, 0.1372549, 1,
-0.3842312, 0.7764118, 1.134007, 0, 1, 0.1411765, 1,
-0.3788688, 1.126992, -1.192657, 0, 1, 0.1490196, 1,
-0.3777094, 0.1415514, -1.432289, 0, 1, 0.1529412, 1,
-0.3729839, 0.8957775, 0.7147387, 0, 1, 0.1607843, 1,
-0.3704821, 0.009268072, -2.959966, 0, 1, 0.1647059, 1,
-0.3690725, -0.5295531, -4.367049, 0, 1, 0.172549, 1,
-0.3656906, -1.278854, -3.558635, 0, 1, 0.1764706, 1,
-0.3629707, -0.1577661, -2.164045, 0, 1, 0.1843137, 1,
-0.3625482, -1.296843, -2.240646, 0, 1, 0.1882353, 1,
-0.3607409, -1.455272, -3.791768, 0, 1, 0.1960784, 1,
-0.3606262, -1.49214, -3.241795, 0, 1, 0.2039216, 1,
-0.3574021, 0.5465668, -1.193869, 0, 1, 0.2078431, 1,
-0.3566879, 0.5678032, -0.5023789, 0, 1, 0.2156863, 1,
-0.3554684, 1.106755, -1.704995, 0, 1, 0.2196078, 1,
-0.3552396, 1.100811, -0.590382, 0, 1, 0.227451, 1,
-0.3540896, 0.4281616, -2.177621, 0, 1, 0.2313726, 1,
-0.3528082, 0.7261468, 0.4116145, 0, 1, 0.2392157, 1,
-0.3524477, -0.4501209, -3.125861, 0, 1, 0.2431373, 1,
-0.3523729, 1.058292, -1.281593, 0, 1, 0.2509804, 1,
-0.3521997, -0.7643296, -2.611273, 0, 1, 0.254902, 1,
-0.3514594, 1.322869, -0.2422807, 0, 1, 0.2627451, 1,
-0.3493609, 0.5720903, -0.5565287, 0, 1, 0.2666667, 1,
-0.3467474, -0.919111, -3.519738, 0, 1, 0.2745098, 1,
-0.3439948, -0.5985627, -0.04455309, 0, 1, 0.2784314, 1,
-0.3401022, -0.6699873, -3.660051, 0, 1, 0.2862745, 1,
-0.3369336, 0.1849163, -1.258476, 0, 1, 0.2901961, 1,
-0.3347161, -1.554053, -1.558553, 0, 1, 0.2980392, 1,
-0.3209054, -0.08260901, -2.029549, 0, 1, 0.3058824, 1,
-0.3204998, -0.3048207, -1.660212, 0, 1, 0.3098039, 1,
-0.3053031, 0.1822893, -1.899831, 0, 1, 0.3176471, 1,
-0.3025919, 0.4683603, -0.670416, 0, 1, 0.3215686, 1,
-0.300679, -0.5765577, -2.826328, 0, 1, 0.3294118, 1,
-0.2949494, -0.6254219, -2.189487, 0, 1, 0.3333333, 1,
-0.2949339, 0.3557912, -1.522498, 0, 1, 0.3411765, 1,
-0.2919447, 1.088848, 0.2667728, 0, 1, 0.345098, 1,
-0.2854064, 0.9554275, -1.682273, 0, 1, 0.3529412, 1,
-0.2826159, 1.191091, -1.147136, 0, 1, 0.3568628, 1,
-0.2743201, -0.2806203, -0.9800099, 0, 1, 0.3647059, 1,
-0.2699613, -1.408533, 0.444889, 0, 1, 0.3686275, 1,
-0.2690729, 0.2350987, -0.7122103, 0, 1, 0.3764706, 1,
-0.2667301, -1.305825, -1.398163, 0, 1, 0.3803922, 1,
-0.2655604, 0.3776503, -1.166528, 0, 1, 0.3882353, 1,
-0.2645281, 0.03016565, -1.297629, 0, 1, 0.3921569, 1,
-0.261007, -1.532108, -3.750454, 0, 1, 0.4, 1,
-0.2576419, -0.9787313, -2.646695, 0, 1, 0.4078431, 1,
-0.2552317, -0.527412, -3.606261, 0, 1, 0.4117647, 1,
-0.2532439, 0.0423709, -1.335929, 0, 1, 0.4196078, 1,
-0.2454737, -0.3080926, -4.055027, 0, 1, 0.4235294, 1,
-0.242133, -1.385661, -2.922731, 0, 1, 0.4313726, 1,
-0.2369674, -0.1691547, 0.1878397, 0, 1, 0.4352941, 1,
-0.2328915, 0.3845702, -1.771893, 0, 1, 0.4431373, 1,
-0.2307964, 0.1607946, -0.04980191, 0, 1, 0.4470588, 1,
-0.2303592, 0.03602927, -1.683098, 0, 1, 0.454902, 1,
-0.2294418, -0.1688351, 0.07376683, 0, 1, 0.4588235, 1,
-0.2293116, 0.5672056, 0.6821083, 0, 1, 0.4666667, 1,
-0.2274816, -1.841761, -3.699671, 0, 1, 0.4705882, 1,
-0.2272448, -1.014264, -2.699727, 0, 1, 0.4784314, 1,
-0.2270916, -0.03333978, 0.09183185, 0, 1, 0.4823529, 1,
-0.2264681, -0.0006396841, -0.4890931, 0, 1, 0.4901961, 1,
-0.2220982, 0.7521633, -0.3686658, 0, 1, 0.4941176, 1,
-0.2163137, -1.26648, -4.524765, 0, 1, 0.5019608, 1,
-0.2157428, 0.5192705, -0.742497, 0, 1, 0.509804, 1,
-0.2147641, 0.0318231, -1.454237, 0, 1, 0.5137255, 1,
-0.2141501, 0.5410706, 0.2292677, 0, 1, 0.5215687, 1,
-0.2123728, 0.03814556, -1.828196, 0, 1, 0.5254902, 1,
-0.2077457, -1.15024, -2.044088, 0, 1, 0.5333334, 1,
-0.2002915, -0.9767984, -3.216194, 0, 1, 0.5372549, 1,
-0.1987397, 0.6141458, -1.251051, 0, 1, 0.5450981, 1,
-0.1928724, -0.009423549, -2.421117, 0, 1, 0.5490196, 1,
-0.1917454, -0.1735279, -1.925922, 0, 1, 0.5568628, 1,
-0.1906019, 0.440462, -0.1141518, 0, 1, 0.5607843, 1,
-0.1903709, -0.3230559, -3.09606, 0, 1, 0.5686275, 1,
-0.1822529, -0.8831367, -3.856572, 0, 1, 0.572549, 1,
-0.181271, -0.02735318, -0.2354401, 0, 1, 0.5803922, 1,
-0.1790874, 0.2071502, -2.566524, 0, 1, 0.5843138, 1,
-0.1732459, 0.3273152, 1.091574, 0, 1, 0.5921569, 1,
-0.1675787, 0.8314254, -0.20502, 0, 1, 0.5960785, 1,
-0.1636105, 0.7566032, -1.164177, 0, 1, 0.6039216, 1,
-0.1578784, 1.770723, 1.600075, 0, 1, 0.6117647, 1,
-0.15606, 0.4464275, 1.096174, 0, 1, 0.6156863, 1,
-0.1552703, 0.1375257, -1.15878, 0, 1, 0.6235294, 1,
-0.1546206, 1.42287, 0.9300855, 0, 1, 0.627451, 1,
-0.1545025, -0.4105178, -2.060228, 0, 1, 0.6352941, 1,
-0.1518722, 0.3814178, -1.478058, 0, 1, 0.6392157, 1,
-0.1515168, 1.416833, -0.004171208, 0, 1, 0.6470588, 1,
-0.1514557, -0.3066906, -2.439486, 0, 1, 0.6509804, 1,
-0.1410993, -0.06825656, -0.5395818, 0, 1, 0.6588235, 1,
-0.1349555, -0.2296363, -1.304508, 0, 1, 0.6627451, 1,
-0.1343752, -0.8778101, -5.973152, 0, 1, 0.6705883, 1,
-0.132678, -0.3865279, -3.848356, 0, 1, 0.6745098, 1,
-0.1314345, -0.517042, -3.976702, 0, 1, 0.682353, 1,
-0.1296047, -0.9284914, -2.814026, 0, 1, 0.6862745, 1,
-0.1294317, 1.250927, -1.261394, 0, 1, 0.6941177, 1,
-0.1275135, 1.251973, 0.467068, 0, 1, 0.7019608, 1,
-0.1251498, -0.3307642, -3.254445, 0, 1, 0.7058824, 1,
-0.1222904, 0.3435187, 0.9356428, 0, 1, 0.7137255, 1,
-0.1172572, 1.639218, -1.66605, 0, 1, 0.7176471, 1,
-0.1138729, 1.528761, -1.003089, 0, 1, 0.7254902, 1,
-0.1008336, -2.055011, -3.928323, 0, 1, 0.7294118, 1,
-0.09910415, 0.4757649, -8.757255e-05, 0, 1, 0.7372549, 1,
-0.098565, 1.020429, 0.5207453, 0, 1, 0.7411765, 1,
-0.09665456, -0.0833702, -1.675876, 0, 1, 0.7490196, 1,
-0.0960589, 0.2198233, -1.110962, 0, 1, 0.7529412, 1,
-0.09326438, 0.7186099, -1.123351, 0, 1, 0.7607843, 1,
-0.0902808, 0.64375, -1.69395, 0, 1, 0.7647059, 1,
-0.08924972, 1.219616, 0.5228059, 0, 1, 0.772549, 1,
-0.08870449, -1.336861, -2.749635, 0, 1, 0.7764706, 1,
-0.08819557, 1.76255, -0.06451926, 0, 1, 0.7843137, 1,
-0.08600619, -0.1609058, -2.393152, 0, 1, 0.7882353, 1,
-0.08579087, -2.980487, -4.965339, 0, 1, 0.7960784, 1,
-0.0745019, 0.1671683, -0.933543, 0, 1, 0.8039216, 1,
-0.07437015, -1.356019, -5.987224, 0, 1, 0.8078431, 1,
-0.06973063, 0.9335245, 0.2072123, 0, 1, 0.8156863, 1,
-0.06838684, -1.601655, -4.274413, 0, 1, 0.8196079, 1,
-0.06730054, -0.6346462, -1.554391, 0, 1, 0.827451, 1,
-0.06700616, 0.2177417, -0.8539972, 0, 1, 0.8313726, 1,
-0.06533234, 0.03552819, 1.422735, 0, 1, 0.8392157, 1,
-0.06495825, -0.07062054, -3.36546, 0, 1, 0.8431373, 1,
-0.06431245, 1.916585, 0.05873844, 0, 1, 0.8509804, 1,
-0.06276495, -0.9086955, -3.560224, 0, 1, 0.854902, 1,
-0.05487408, -0.351203, -2.7494, 0, 1, 0.8627451, 1,
-0.05422877, -1.333359, -4.471558, 0, 1, 0.8666667, 1,
-0.05045683, -0.2017971, -0.6712252, 0, 1, 0.8745098, 1,
-0.04791958, -0.4097377, -3.582778, 0, 1, 0.8784314, 1,
-0.04426228, 0.05839609, -0.126917, 0, 1, 0.8862745, 1,
-0.04384154, -1.048895, -2.4478, 0, 1, 0.8901961, 1,
-0.03916886, -1.662843, -2.56432, 0, 1, 0.8980392, 1,
-0.03784529, 0.5660904, 1.039405, 0, 1, 0.9058824, 1,
-0.03558856, 0.6795713, 0.4487531, 0, 1, 0.9098039, 1,
-0.03320225, 0.49142, 1.578063, 0, 1, 0.9176471, 1,
-0.03276441, 0.8047922, -1.137411, 0, 1, 0.9215686, 1,
-0.03166765, 1.025785, 0.7546667, 0, 1, 0.9294118, 1,
-0.03028835, -0.2343944, -2.932101, 0, 1, 0.9333333, 1,
-0.02772038, -1.254228, -4.764347, 0, 1, 0.9411765, 1,
-0.02488585, -1.34853, -1.85388, 0, 1, 0.945098, 1,
-0.02399778, 0.4059039, -1.263698, 0, 1, 0.9529412, 1,
-0.01274101, -0.2608461, -3.533865, 0, 1, 0.9568627, 1,
-0.01173292, -1.825423, -2.932661, 0, 1, 0.9647059, 1,
-4.52016e-05, -0.7756429, -4.155286, 0, 1, 0.9686275, 1,
0.003297701, 0.431958, -0.01657675, 0, 1, 0.9764706, 1,
0.006173679, 0.1426076, -0.6247239, 0, 1, 0.9803922, 1,
0.01108999, 0.1919612, 0.5764269, 0, 1, 0.9882353, 1,
0.02002616, -0.45138, 3.714478, 0, 1, 0.9921569, 1,
0.02084628, -0.3449154, 3.257424, 0, 1, 1, 1,
0.02155364, -0.09885702, 3.818246, 0, 0.9921569, 1, 1,
0.02333771, 0.5327788, -0.9716228, 0, 0.9882353, 1, 1,
0.02408065, -0.9046791, 4.137078, 0, 0.9803922, 1, 1,
0.02975385, 1.428502, 1.369087, 0, 0.9764706, 1, 1,
0.03358544, 0.7766086, -2.421218, 0, 0.9686275, 1, 1,
0.03695767, 0.4132223, -0.6033095, 0, 0.9647059, 1, 1,
0.03724708, 2.565655, -1.084915, 0, 0.9568627, 1, 1,
0.03765728, 0.00437331, 2.456489, 0, 0.9529412, 1, 1,
0.04017908, -0.6550947, 2.29379, 0, 0.945098, 1, 1,
0.04205275, 1.372904, 0.2314073, 0, 0.9411765, 1, 1,
0.04365592, 1.42865, 0.8987104, 0, 0.9333333, 1, 1,
0.04619129, 0.07748073, 0.2870661, 0, 0.9294118, 1, 1,
0.04937636, 0.8431105, -0.699352, 0, 0.9215686, 1, 1,
0.04974609, 0.2207541, -0.4081678, 0, 0.9176471, 1, 1,
0.05466538, -1.384005, 3.454746, 0, 0.9098039, 1, 1,
0.05790208, -0.2689771, 3.797244, 0, 0.9058824, 1, 1,
0.05921111, 1.270042, 2.333897, 0, 0.8980392, 1, 1,
0.05995329, 0.1685417, -0.7701258, 0, 0.8901961, 1, 1,
0.06180149, -0.5438159, 3.060924, 0, 0.8862745, 1, 1,
0.06188719, -1.210227, 2.610511, 0, 0.8784314, 1, 1,
0.06352795, 1.82627, 0.1154175, 0, 0.8745098, 1, 1,
0.06473663, -0.865557, 1.672102, 0, 0.8666667, 1, 1,
0.06949913, 0.1988676, 1.89833, 0, 0.8627451, 1, 1,
0.07017778, -0.7825673, 1.353097, 0, 0.854902, 1, 1,
0.07170516, -0.4656526, 2.947012, 0, 0.8509804, 1, 1,
0.07406403, -1.186959, 4.172288, 0, 0.8431373, 1, 1,
0.07510105, -0.1846002, 4.233373, 0, 0.8392157, 1, 1,
0.07629393, -0.2230209, 2.217015, 0, 0.8313726, 1, 1,
0.08310469, 0.2844487, -0.185193, 0, 0.827451, 1, 1,
0.08536652, 0.5007592, 0.7929699, 0, 0.8196079, 1, 1,
0.08569201, -0.9496791, 4.250589, 0, 0.8156863, 1, 1,
0.0885665, 0.3192908, -0.8144956, 0, 0.8078431, 1, 1,
0.08954397, 0.3793096, -1.957953, 0, 0.8039216, 1, 1,
0.0902242, -0.3924743, 3.441391, 0, 0.7960784, 1, 1,
0.09107813, -0.562821, 4.739189, 0, 0.7882353, 1, 1,
0.09322962, 2.274791, -0.6470849, 0, 0.7843137, 1, 1,
0.09641054, -0.3312454, 4.313189, 0, 0.7764706, 1, 1,
0.09864048, 0.314185, 1.428237, 0, 0.772549, 1, 1,
0.1013116, 1.456388, 0.2907932, 0, 0.7647059, 1, 1,
0.1024227, -0.05999526, 1.407444, 0, 0.7607843, 1, 1,
0.1025707, 1.144539, -1.979236, 0, 0.7529412, 1, 1,
0.1042685, 0.6618418, -0.3516443, 0, 0.7490196, 1, 1,
0.105791, -0.2315797, 2.956771, 0, 0.7411765, 1, 1,
0.1193451, 1.286563, 0.2620541, 0, 0.7372549, 1, 1,
0.1207816, -0.527398, 4.282184, 0, 0.7294118, 1, 1,
0.122344, 0.4358994, 1.663915, 0, 0.7254902, 1, 1,
0.1259575, -0.457374, 2.809969, 0, 0.7176471, 1, 1,
0.1305301, -0.7957786, 3.107314, 0, 0.7137255, 1, 1,
0.1312587, -1.481897, 3.050356, 0, 0.7058824, 1, 1,
0.1347239, 0.005138952, 0.9715103, 0, 0.6980392, 1, 1,
0.1348127, -1.213245, 3.288509, 0, 0.6941177, 1, 1,
0.1397894, 0.5282947, 1.052152, 0, 0.6862745, 1, 1,
0.1408078, -0.006420042, 1.419145, 0, 0.682353, 1, 1,
0.1412104, 0.5706553, -0.2085921, 0, 0.6745098, 1, 1,
0.1414138, -0.266301, 2.312692, 0, 0.6705883, 1, 1,
0.143139, 0.6759988, -0.1860493, 0, 0.6627451, 1, 1,
0.1435388, -0.3786181, 3.429201, 0, 0.6588235, 1, 1,
0.1464061, 0.6254256, 0.923197, 0, 0.6509804, 1, 1,
0.1499846, -0.8149266, 3.181482, 0, 0.6470588, 1, 1,
0.1572952, -1.087708, 2.805975, 0, 0.6392157, 1, 1,
0.1631235, 0.6988973, -0.6051797, 0, 0.6352941, 1, 1,
0.1648677, -0.4383, 2.432292, 0, 0.627451, 1, 1,
0.1675584, 1.443975, -0.3976979, 0, 0.6235294, 1, 1,
0.16777, 0.02381804, 1.265432, 0, 0.6156863, 1, 1,
0.1686718, -0.1024059, 3.015706, 0, 0.6117647, 1, 1,
0.1701542, 0.8373909, 0.2246233, 0, 0.6039216, 1, 1,
0.171458, -3.424319, 4.283358, 0, 0.5960785, 1, 1,
0.1719611, 1.738533, 2.371255, 0, 0.5921569, 1, 1,
0.1741953, 0.1490034, 0.5309991, 0, 0.5843138, 1, 1,
0.1774006, -0.7339697, 2.350552, 0, 0.5803922, 1, 1,
0.1871425, -0.3481658, 2.779611, 0, 0.572549, 1, 1,
0.187713, 0.7567263, -0.4755889, 0, 0.5686275, 1, 1,
0.1892213, -1.055293, 3.208209, 0, 0.5607843, 1, 1,
0.1928927, -0.569797, 2.901112, 0, 0.5568628, 1, 1,
0.1944674, 0.9427511, -0.156483, 0, 0.5490196, 1, 1,
0.1971524, 0.8529764, -1.921009, 0, 0.5450981, 1, 1,
0.2053036, 0.9771377, -0.05689729, 0, 0.5372549, 1, 1,
0.2134977, 0.1821839, 0.8854253, 0, 0.5333334, 1, 1,
0.2138972, 0.02141429, 2.605365, 0, 0.5254902, 1, 1,
0.2161731, -1.002182, 2.865197, 0, 0.5215687, 1, 1,
0.2217769, -0.1173677, 0.801384, 0, 0.5137255, 1, 1,
0.2232908, 2.372443, 0.7363998, 0, 0.509804, 1, 1,
0.2323014, 0.9391935, -0.3522218, 0, 0.5019608, 1, 1,
0.2323871, -1.364548, 4.400311, 0, 0.4941176, 1, 1,
0.2330946, -0.9664881, 3.012208, 0, 0.4901961, 1, 1,
0.2378015, 0.374519, 0.3595854, 0, 0.4823529, 1, 1,
0.2406917, 1.505289, 0.8726291, 0, 0.4784314, 1, 1,
0.2412172, -0.3505855, 2.216371, 0, 0.4705882, 1, 1,
0.2414336, 0.4574713, 0.3657787, 0, 0.4666667, 1, 1,
0.2417955, -0.7545437, 2.992234, 0, 0.4588235, 1, 1,
0.2442751, 0.6396418, 0.7278672, 0, 0.454902, 1, 1,
0.2459619, -0.2699196, 2.928288, 0, 0.4470588, 1, 1,
0.2462927, -0.8861043, 2.367609, 0, 0.4431373, 1, 1,
0.2464237, -0.07952815, 2.383689, 0, 0.4352941, 1, 1,
0.2482419, 0.2202964, -1.024983, 0, 0.4313726, 1, 1,
0.2490515, 1.498334, -1.013453, 0, 0.4235294, 1, 1,
0.2500281, 0.7241626, 2.124705, 0, 0.4196078, 1, 1,
0.2502112, -1.707729, 1.525683, 0, 0.4117647, 1, 1,
0.2534277, 2.624126, 0.6544192, 0, 0.4078431, 1, 1,
0.2539843, -1.768473, 2.925738, 0, 0.4, 1, 1,
0.2539905, 0.1758709, 0.8366434, 0, 0.3921569, 1, 1,
0.2592628, -0.4869447, 3.587901, 0, 0.3882353, 1, 1,
0.2620665, 0.6467983, -0.5600919, 0, 0.3803922, 1, 1,
0.2629615, -1.443021, 2.119398, 0, 0.3764706, 1, 1,
0.2692586, -0.7628417, 2.49328, 0, 0.3686275, 1, 1,
0.2719241, 2.058473, 1.118796, 0, 0.3647059, 1, 1,
0.2724347, -0.189222, -0.6192224, 0, 0.3568628, 1, 1,
0.2724627, 2.610912, -1.155344, 0, 0.3529412, 1, 1,
0.2756964, 0.5275646, -0.522502, 0, 0.345098, 1, 1,
0.2784357, -0.5501664, 3.729321, 0, 0.3411765, 1, 1,
0.2811401, -1.395344, 3.360929, 0, 0.3333333, 1, 1,
0.2817508, 1.218161, 0.9562583, 0, 0.3294118, 1, 1,
0.283994, -0.7954181, 3.367519, 0, 0.3215686, 1, 1,
0.287444, 1.544182, -0.3775944, 0, 0.3176471, 1, 1,
0.2889591, -0.6482, 2.685851, 0, 0.3098039, 1, 1,
0.2889929, 0.353833, -1.352365, 0, 0.3058824, 1, 1,
0.2899888, 1.669215, 0.1869989, 0, 0.2980392, 1, 1,
0.2904989, -0.5988882, 4.014293, 0, 0.2901961, 1, 1,
0.2915218, 0.102936, 0.5863083, 0, 0.2862745, 1, 1,
0.2927625, -0.8444634, 3.007849, 0, 0.2784314, 1, 1,
0.2986564, 0.3204153, 1.894595, 0, 0.2745098, 1, 1,
0.2992986, -1.54868, 3.916901, 0, 0.2666667, 1, 1,
0.3011519, 0.3491315, 0.3437054, 0, 0.2627451, 1, 1,
0.3087979, 0.3870002, 1.440437, 0, 0.254902, 1, 1,
0.3097447, -0.6489369, 1.810454, 0, 0.2509804, 1, 1,
0.3125251, 1.409172, -0.9131506, 0, 0.2431373, 1, 1,
0.3176151, 0.152657, 2.083318, 0, 0.2392157, 1, 1,
0.3267559, 0.3361333, 0.02911988, 0, 0.2313726, 1, 1,
0.3304338, -0.3391024, 2.466243, 0, 0.227451, 1, 1,
0.3324281, 0.0663735, 2.375365, 0, 0.2196078, 1, 1,
0.3336197, -0.5016597, 2.266585, 0, 0.2156863, 1, 1,
0.336718, 1.318185, -0.01852393, 0, 0.2078431, 1, 1,
0.3371164, 0.6736368, 0.8087674, 0, 0.2039216, 1, 1,
0.3385103, -0.275881, 3.227225, 0, 0.1960784, 1, 1,
0.3456426, -0.03240142, 1.328179, 0, 0.1882353, 1, 1,
0.3546624, 0.9172423, -0.7192268, 0, 0.1843137, 1, 1,
0.3556407, 1.164234, 0.6509892, 0, 0.1764706, 1, 1,
0.357157, 0.507393, -0.2172865, 0, 0.172549, 1, 1,
0.3573345, -0.9802849, 2.361864, 0, 0.1647059, 1, 1,
0.3644121, 3.133707, -0.5930495, 0, 0.1607843, 1, 1,
0.3645517, 0.7581204, -0.9048043, 0, 0.1529412, 1, 1,
0.3676327, 0.4717702, 0.3709555, 0, 0.1490196, 1, 1,
0.3695716, -0.01587137, 0.9532618, 0, 0.1411765, 1, 1,
0.373011, 0.4462408, -0.5617236, 0, 0.1372549, 1, 1,
0.3759781, 0.1301857, 0.8410783, 0, 0.1294118, 1, 1,
0.3785681, 0.8357263, 0.883562, 0, 0.1254902, 1, 1,
0.3837622, -1.223293, 2.988655, 0, 0.1176471, 1, 1,
0.3902245, 0.3481528, 0.3292077, 0, 0.1137255, 1, 1,
0.3930001, -0.4733833, 3.138656, 0, 0.1058824, 1, 1,
0.3954015, 0.3325619, 0.8462853, 0, 0.09803922, 1, 1,
0.3957287, -0.5190161, 4.295939, 0, 0.09411765, 1, 1,
0.3975921, 0.4203392, 0.6406796, 0, 0.08627451, 1, 1,
0.3981884, 0.4467784, 1.246617, 0, 0.08235294, 1, 1,
0.3982585, 0.8358883, -0.5055171, 0, 0.07450981, 1, 1,
0.4021075, 0.03171787, 0.6118992, 0, 0.07058824, 1, 1,
0.406873, -0.06305576, 2.962417, 0, 0.0627451, 1, 1,
0.4068761, -0.9220544, 2.70328, 0, 0.05882353, 1, 1,
0.4076584, -1.709897, 3.757586, 0, 0.05098039, 1, 1,
0.4122525, 0.765785, 0.03926675, 0, 0.04705882, 1, 1,
0.4163682, -1.044832, 3.053537, 0, 0.03921569, 1, 1,
0.4229282, -0.6933546, 3.213753, 0, 0.03529412, 1, 1,
0.4233184, 0.9316982, 0.5619245, 0, 0.02745098, 1, 1,
0.4248488, 1.871282, 1.100594, 0, 0.02352941, 1, 1,
0.4317473, 0.278341, 2.001457, 0, 0.01568628, 1, 1,
0.4368769, 0.9848355, 0.8564138, 0, 0.01176471, 1, 1,
0.4371759, 0.4082752, 0.3750723, 0, 0.003921569, 1, 1,
0.4402449, 1.110386, 0.7317794, 0.003921569, 0, 1, 1,
0.4411037, 0.1303194, 0.01551132, 0.007843138, 0, 1, 1,
0.4414429, -0.0117799, 0.8520373, 0.01568628, 0, 1, 1,
0.4418687, 1.584951, -0.8131405, 0.01960784, 0, 1, 1,
0.4443392, 1.274309, -0.259359, 0.02745098, 0, 1, 1,
0.4457225, -0.2613731, 0.8962873, 0.03137255, 0, 1, 1,
0.4524597, -1.633682, 3.159395, 0.03921569, 0, 1, 1,
0.4556317, -1.343576, 2.72307, 0.04313726, 0, 1, 1,
0.4581136, -0.9949942, 2.158086, 0.05098039, 0, 1, 1,
0.4635233, -1.92529, 4.845905, 0.05490196, 0, 1, 1,
0.4639234, -0.6351704, 1.804975, 0.0627451, 0, 1, 1,
0.4681931, -0.3905518, 1.90993, 0.06666667, 0, 1, 1,
0.4682065, 0.1025923, 0.6902125, 0.07450981, 0, 1, 1,
0.4682678, 0.7114832, -0.889255, 0.07843138, 0, 1, 1,
0.4775407, -0.4974537, 2.662505, 0.08627451, 0, 1, 1,
0.4783043, -1.507605, 3.936998, 0.09019608, 0, 1, 1,
0.4803915, -0.3493206, 2.382841, 0.09803922, 0, 1, 1,
0.4811793, 1.129071, 0.09588984, 0.1058824, 0, 1, 1,
0.4816154, -0.6136825, 1.751569, 0.1098039, 0, 1, 1,
0.4839399, 0.9097444, -0.2527386, 0.1176471, 0, 1, 1,
0.4848005, 0.8188608, 2.141914, 0.1215686, 0, 1, 1,
0.4868856, 2.845321, -0.7749351, 0.1294118, 0, 1, 1,
0.4872902, 0.2579178, 0.958583, 0.1333333, 0, 1, 1,
0.4921398, 0.8340765, -0.7707801, 0.1411765, 0, 1, 1,
0.4935227, 0.04430945, 2.072909, 0.145098, 0, 1, 1,
0.5073481, -1.648177, 2.964723, 0.1529412, 0, 1, 1,
0.5090531, 0.2890968, 0.826197, 0.1568628, 0, 1, 1,
0.5127299, -0.1205508, 0.7065995, 0.1647059, 0, 1, 1,
0.513886, -2.038806, 4.23087, 0.1686275, 0, 1, 1,
0.5171381, 0.4201523, 0.892791, 0.1764706, 0, 1, 1,
0.5172254, -1.409849, 2.264576, 0.1803922, 0, 1, 1,
0.5193564, -1.874208, 3.838469, 0.1882353, 0, 1, 1,
0.5294406, 0.7228473, 1.285123, 0.1921569, 0, 1, 1,
0.5358046, 0.434953, 2.495053, 0.2, 0, 1, 1,
0.5358625, 0.1480725, 0.4993712, 0.2078431, 0, 1, 1,
0.5399812, -0.7544141, 4.757046, 0.2117647, 0, 1, 1,
0.5427112, -0.3587855, 1.203651, 0.2196078, 0, 1, 1,
0.5454808, 0.5460026, 1.136267, 0.2235294, 0, 1, 1,
0.5469892, -1.313077, 2.068584, 0.2313726, 0, 1, 1,
0.5470632, -0.1259136, 1.030889, 0.2352941, 0, 1, 1,
0.5488934, 0.3515415, 2.56048, 0.2431373, 0, 1, 1,
0.5497686, -0.02770675, 1.88252, 0.2470588, 0, 1, 1,
0.5543675, 0.1749434, 1.87315, 0.254902, 0, 1, 1,
0.5557575, 0.3466001, -0.493071, 0.2588235, 0, 1, 1,
0.557234, 1.008833, 1.899068, 0.2666667, 0, 1, 1,
0.5579112, -1.196029, 3.287731, 0.2705882, 0, 1, 1,
0.5601738, 1.598857, 0.959398, 0.2784314, 0, 1, 1,
0.5605516, 0.4636441, 0.8019603, 0.282353, 0, 1, 1,
0.5632603, -0.9623395, 2.217352, 0.2901961, 0, 1, 1,
0.5645444, -2.372553, 2.970436, 0.2941177, 0, 1, 1,
0.567278, 0.7657925, 0.580696, 0.3019608, 0, 1, 1,
0.5732533, 0.7089245, 0.3287172, 0.3098039, 0, 1, 1,
0.577207, 0.2897527, 1.841876, 0.3137255, 0, 1, 1,
0.5787134, -0.5451913, 1.956365, 0.3215686, 0, 1, 1,
0.579724, 1.460982, -0.158287, 0.3254902, 0, 1, 1,
0.5829705, 0.8555381, 2.671124, 0.3333333, 0, 1, 1,
0.5844991, 0.767042, 0.8691498, 0.3372549, 0, 1, 1,
0.586423, -0.6785993, 1.43986, 0.345098, 0, 1, 1,
0.5877165, -0.7813269, 3.490339, 0.3490196, 0, 1, 1,
0.5902527, 0.6199473, 0.5091328, 0.3568628, 0, 1, 1,
0.5906231, 0.2220419, 1.317533, 0.3607843, 0, 1, 1,
0.598859, -0.4568196, 1.640212, 0.3686275, 0, 1, 1,
0.5992529, 2.38856, 0.3318763, 0.372549, 0, 1, 1,
0.6000154, -0.7601281, 3.268082, 0.3803922, 0, 1, 1,
0.600876, 0.3144657, 0.8985863, 0.3843137, 0, 1, 1,
0.6041752, 0.5690641, 1.227242, 0.3921569, 0, 1, 1,
0.604807, -0.2612326, 2.613107, 0.3960784, 0, 1, 1,
0.6056209, 0.1969759, 2.55679, 0.4039216, 0, 1, 1,
0.6076964, 0.1787044, 2.106181, 0.4117647, 0, 1, 1,
0.6144361, 0.03125555, 0.3669555, 0.4156863, 0, 1, 1,
0.6159095, -2.826479, 2.667362, 0.4235294, 0, 1, 1,
0.6163756, -0.3532667, 2.776474, 0.427451, 0, 1, 1,
0.6310441, -1.518227, 3.515636, 0.4352941, 0, 1, 1,
0.6316753, 0.2671918, 1.957828, 0.4392157, 0, 1, 1,
0.6317093, 0.8623108, -0.3137387, 0.4470588, 0, 1, 1,
0.6327974, -1.05028, 5.145616, 0.4509804, 0, 1, 1,
0.6344898, -0.4932344, 2.222663, 0.4588235, 0, 1, 1,
0.6369506, -0.1087743, 0.2531605, 0.4627451, 0, 1, 1,
0.6386709, 0.6239956, 1.707094, 0.4705882, 0, 1, 1,
0.6455846, 1.016259, 0.6419243, 0.4745098, 0, 1, 1,
0.6466947, 1.292987, -0.03014649, 0.4823529, 0, 1, 1,
0.6495462, 0.4010223, 3.03647, 0.4862745, 0, 1, 1,
0.6568837, -0.1763924, 2.247226, 0.4941176, 0, 1, 1,
0.6600438, -0.2627692, 1.475735, 0.5019608, 0, 1, 1,
0.660755, 0.1108982, -0.6707301, 0.5058824, 0, 1, 1,
0.6623591, -0.03659816, 3.535934, 0.5137255, 0, 1, 1,
0.663455, -0.02143649, 1.514855, 0.5176471, 0, 1, 1,
0.6636238, -1.614852, 1.199865, 0.5254902, 0, 1, 1,
0.6663193, 0.006113459, 0.4952985, 0.5294118, 0, 1, 1,
0.6678488, 0.3991792, 0.6522585, 0.5372549, 0, 1, 1,
0.6687089, 1.347911, 1.873992, 0.5411765, 0, 1, 1,
0.6697662, -1.266081, 1.660377, 0.5490196, 0, 1, 1,
0.6731338, 0.08624847, 1.89318, 0.5529412, 0, 1, 1,
0.6741605, 0.5020105, -0.2874781, 0.5607843, 0, 1, 1,
0.6783666, 0.4080916, 1.233623, 0.5647059, 0, 1, 1,
0.680977, 0.4013519, 0.8526193, 0.572549, 0, 1, 1,
0.683549, 1.544087, 1.368008, 0.5764706, 0, 1, 1,
0.6869997, -0.8100557, 2.67539, 0.5843138, 0, 1, 1,
0.6879727, -1.469062, 2.409428, 0.5882353, 0, 1, 1,
0.6887336, 1.194604, 1.059475, 0.5960785, 0, 1, 1,
0.6989951, 1.609363, 2.096006, 0.6039216, 0, 1, 1,
0.712597, 1.099067, 2.991955, 0.6078432, 0, 1, 1,
0.7182264, -0.4310203, 2.410447, 0.6156863, 0, 1, 1,
0.7203495, 0.5773449, 0.8006135, 0.6196079, 0, 1, 1,
0.7224559, -0.2400224, -0.3263812, 0.627451, 0, 1, 1,
0.7241754, -0.5383556, 3.162089, 0.6313726, 0, 1, 1,
0.7271491, 2.350963, 0.8081892, 0.6392157, 0, 1, 1,
0.7332023, -0.9201533, 3.670097, 0.6431373, 0, 1, 1,
0.7336542, 0.02472488, 1.394052, 0.6509804, 0, 1, 1,
0.7346315, 0.1482388, 2.758021, 0.654902, 0, 1, 1,
0.7388533, -0.009778298, 1.068934, 0.6627451, 0, 1, 1,
0.7478421, -2.320637, 2.176829, 0.6666667, 0, 1, 1,
0.7571365, -0.7351993, 2.224336, 0.6745098, 0, 1, 1,
0.7577845, 0.4387155, 0.57068, 0.6784314, 0, 1, 1,
0.7643632, -0.9404039, 3.951922, 0.6862745, 0, 1, 1,
0.7666958, -0.09087819, 0.9269351, 0.6901961, 0, 1, 1,
0.7707143, 0.4568702, 1.733698, 0.6980392, 0, 1, 1,
0.7711995, 2.221316, 1.936418, 0.7058824, 0, 1, 1,
0.775619, -1.00116, 2.880667, 0.7098039, 0, 1, 1,
0.7861919, -0.8655851, 1.735076, 0.7176471, 0, 1, 1,
0.7884317, 0.7480094, 0.1853182, 0.7215686, 0, 1, 1,
0.7892678, 0.1334483, 0.7420523, 0.7294118, 0, 1, 1,
0.7929069, -0.2599894, 0.5644442, 0.7333333, 0, 1, 1,
0.7930135, 0.3207835, 0.8488809, 0.7411765, 0, 1, 1,
0.7938979, 0.3160932, 0.5909312, 0.7450981, 0, 1, 1,
0.7969793, 0.2116171, 0.8055744, 0.7529412, 0, 1, 1,
0.7972879, -1.998383, 1.343421, 0.7568628, 0, 1, 1,
0.7984524, -0.315133, 1.09557, 0.7647059, 0, 1, 1,
0.8073972, 1.097741, -0.201326, 0.7686275, 0, 1, 1,
0.8079187, 1.865656, 0.6945951, 0.7764706, 0, 1, 1,
0.8113599, 0.4449375, 1.562548, 0.7803922, 0, 1, 1,
0.8117279, 1.198283, -0.7927335, 0.7882353, 0, 1, 1,
0.8141397, -0.242936, 1.194078, 0.7921569, 0, 1, 1,
0.8212224, 0.2254239, 2.57734, 0.8, 0, 1, 1,
0.8250561, 0.429224, 0.934576, 0.8078431, 0, 1, 1,
0.8312626, 0.5993352, 1.241762, 0.8117647, 0, 1, 1,
0.8321366, 0.5012249, 2.980223, 0.8196079, 0, 1, 1,
0.8369504, -0.2994148, 1.904385, 0.8235294, 0, 1, 1,
0.8408467, -0.2481746, 1.001092, 0.8313726, 0, 1, 1,
0.8416173, 0.574872, 2.322591, 0.8352941, 0, 1, 1,
0.8467779, 2.361392, -0.5016116, 0.8431373, 0, 1, 1,
0.8524983, 0.4951448, 1.227803, 0.8470588, 0, 1, 1,
0.8566145, 0.3634264, 2.519751, 0.854902, 0, 1, 1,
0.8589832, -0.5355092, 2.201444, 0.8588235, 0, 1, 1,
0.8638373, 1.235207, -0.02648588, 0.8666667, 0, 1, 1,
0.8721591, -0.4505604, 1.315404, 0.8705882, 0, 1, 1,
0.8763704, 1.24754, 0.4611236, 0.8784314, 0, 1, 1,
0.8825903, -0.5576802, 1.958354, 0.8823529, 0, 1, 1,
0.8871638, 1.489062, 1.713655, 0.8901961, 0, 1, 1,
0.8915033, -0.322461, 0.7968813, 0.8941177, 0, 1, 1,
0.8926117, 0.0891602, 1.191005, 0.9019608, 0, 1, 1,
0.8961878, -0.32608, 2.827533, 0.9098039, 0, 1, 1,
0.8981497, -2.853393, 2.065714, 0.9137255, 0, 1, 1,
0.8995961, 0.2237716, 0.649241, 0.9215686, 0, 1, 1,
0.899676, 0.7723638, 1.984916, 0.9254902, 0, 1, 1,
0.9016762, -0.2378114, 2.158346, 0.9333333, 0, 1, 1,
0.9028052, 1.210689, -1.504942, 0.9372549, 0, 1, 1,
0.9090697, -0.5005965, 3.141289, 0.945098, 0, 1, 1,
0.9190112, -0.9783602, 1.438782, 0.9490196, 0, 1, 1,
0.9336612, -0.5295708, 2.656803, 0.9568627, 0, 1, 1,
0.9461877, 1.175872, -0.3450209, 0.9607843, 0, 1, 1,
0.9477885, -0.9924248, 1.118794, 0.9686275, 0, 1, 1,
0.9491512, -0.322771, 2.27406, 0.972549, 0, 1, 1,
0.9532897, -1.930072, 2.089708, 0.9803922, 0, 1, 1,
0.9555262, 0.8645825, 0.993315, 0.9843137, 0, 1, 1,
0.957132, -0.3202142, 3.655531, 0.9921569, 0, 1, 1,
0.9609535, -0.1544802, 2.543123, 0.9960784, 0, 1, 1,
0.961395, -0.01505309, 1.413951, 1, 0, 0.9960784, 1,
0.9614992, 0.02910828, 1.210624, 1, 0, 0.9882353, 1,
0.9637612, 1.210833, -0.5698226, 1, 0, 0.9843137, 1,
0.9721164, -1.129904, 2.370787, 1, 0, 0.9764706, 1,
0.9732126, -1.378934, 2.504475, 1, 0, 0.972549, 1,
0.9854378, -1.910939, 3.240369, 1, 0, 0.9647059, 1,
0.9915192, 0.8192651, 0.8068059, 1, 0, 0.9607843, 1,
0.9918494, -0.1742833, 3.147992, 1, 0, 0.9529412, 1,
0.996149, 0.8357772, -0.5714118, 1, 0, 0.9490196, 1,
0.9977494, 0.4397319, 1.711101, 1, 0, 0.9411765, 1,
1.000388, -1.086274, 1.781635, 1, 0, 0.9372549, 1,
1.002362, -0.4512934, 2.714707, 1, 0, 0.9294118, 1,
1.005141, 0.4063471, -0.1912452, 1, 0, 0.9254902, 1,
1.009369, 0.5419949, 0.3050871, 1, 0, 0.9176471, 1,
1.012267, -1.930482, 4.559681, 1, 0, 0.9137255, 1,
1.015504, 0.9712426, 2.805076, 1, 0, 0.9058824, 1,
1.029902, -0.2321455, 1.212807, 1, 0, 0.9019608, 1,
1.033074, -0.7794443, 3.725734, 1, 0, 0.8941177, 1,
1.037714, 0.438906, 1.359458, 1, 0, 0.8862745, 1,
1.038257, 0.3563707, 2.446191, 1, 0, 0.8823529, 1,
1.039396, 0.2608629, 0.7199716, 1, 0, 0.8745098, 1,
1.041164, -0.1487759, 0.3343099, 1, 0, 0.8705882, 1,
1.043613, 0.7038376, 2.055905, 1, 0, 0.8627451, 1,
1.05195, -0.3742367, 2.740007, 1, 0, 0.8588235, 1,
1.053943, -0.1633459, 1.768891, 1, 0, 0.8509804, 1,
1.059775, 0.5447897, 2.078978, 1, 0, 0.8470588, 1,
1.064557, 0.3004288, 2.759553, 1, 0, 0.8392157, 1,
1.065693, -0.6898565, 2.765965, 1, 0, 0.8352941, 1,
1.069547, 0.3504889, 1.698371, 1, 0, 0.827451, 1,
1.075164, 1.28856, 1.82926, 1, 0, 0.8235294, 1,
1.085444, -0.6676952, 1.802455, 1, 0, 0.8156863, 1,
1.089643, -2.01049, 2.400542, 1, 0, 0.8117647, 1,
1.094285, 0.4160956, -0.403813, 1, 0, 0.8039216, 1,
1.096452, -0.3468781, 1.933781, 1, 0, 0.7960784, 1,
1.112764, -0.4614511, 3.327336, 1, 0, 0.7921569, 1,
1.117766, 1.128077, 1.646366, 1, 0, 0.7843137, 1,
1.118521, 1.557342, 0.2710518, 1, 0, 0.7803922, 1,
1.121547, 0.1758277, 0.9667853, 1, 0, 0.772549, 1,
1.125909, 0.3968159, 0.1870203, 1, 0, 0.7686275, 1,
1.132782, -0.6298025, 2.068537, 1, 0, 0.7607843, 1,
1.134497, -0.6201069, 1.77699, 1, 0, 0.7568628, 1,
1.137958, -0.5920922, 2.322285, 1, 0, 0.7490196, 1,
1.141647, -0.7445294, 1.046982, 1, 0, 0.7450981, 1,
1.142732, 0.1913077, 1.551661, 1, 0, 0.7372549, 1,
1.14297, -0.1880397, 2.421469, 1, 0, 0.7333333, 1,
1.147691, 0.4710663, 0.7218279, 1, 0, 0.7254902, 1,
1.14954, -0.2693035, 0.6783118, 1, 0, 0.7215686, 1,
1.154118, 0.4815665, -1.181736, 1, 0, 0.7137255, 1,
1.157022, 1.820943, 3.902483, 1, 0, 0.7098039, 1,
1.161156, 1.792423, 0.3428915, 1, 0, 0.7019608, 1,
1.170656, -1.632029, 3.063323, 1, 0, 0.6941177, 1,
1.172948, -1.200531, 3.090907, 1, 0, 0.6901961, 1,
1.185062, -0.3865616, 1.611725, 1, 0, 0.682353, 1,
1.192383, 0.7292967, 0.9945472, 1, 0, 0.6784314, 1,
1.193569, -1.010245, 3.562835, 1, 0, 0.6705883, 1,
1.214264, -0.6438686, 1.258142, 1, 0, 0.6666667, 1,
1.217317, 1.853471, 0.8118561, 1, 0, 0.6588235, 1,
1.218127, -0.1707517, 1.606458, 1, 0, 0.654902, 1,
1.219681, -1.085013, 1.920391, 1, 0, 0.6470588, 1,
1.225362, -1.145842, 2.943139, 1, 0, 0.6431373, 1,
1.231012, 1.717886, 1.430198, 1, 0, 0.6352941, 1,
1.2427, 1.292715, 2.468718, 1, 0, 0.6313726, 1,
1.248084, 1.142629, 0.8185787, 1, 0, 0.6235294, 1,
1.265197, 0.3025708, 0.1368296, 1, 0, 0.6196079, 1,
1.271762, 0.5647212, 1.016542, 1, 0, 0.6117647, 1,
1.272375, 0.8558336, 0.6086295, 1, 0, 0.6078432, 1,
1.277564, 1.064279, -0.01312896, 1, 0, 0.6, 1,
1.286727, 0.8852733, 0.2558994, 1, 0, 0.5921569, 1,
1.297142, -2.030877, 2.518764, 1, 0, 0.5882353, 1,
1.305096, 0.1006304, 1.121903, 1, 0, 0.5803922, 1,
1.318242, 1.602659, -0.7657634, 1, 0, 0.5764706, 1,
1.321607, -1.936895, 2.505781, 1, 0, 0.5686275, 1,
1.329324, -0.6559988, 3.600763, 1, 0, 0.5647059, 1,
1.332679, -2.771399, 2.233819, 1, 0, 0.5568628, 1,
1.335608, 1.527764, -0.9678007, 1, 0, 0.5529412, 1,
1.354008, -0.8329579, 2.650489, 1, 0, 0.5450981, 1,
1.359404, -0.5512322, 1.10828, 1, 0, 0.5411765, 1,
1.361718, 0.451143, 0.1395901, 1, 0, 0.5333334, 1,
1.374467, -0.1009244, -0.2804251, 1, 0, 0.5294118, 1,
1.375175, 0.1823448, 2.922698, 1, 0, 0.5215687, 1,
1.382023, 1.713357, -1.583618, 1, 0, 0.5176471, 1,
1.388007, -0.1343044, 2.361623, 1, 0, 0.509804, 1,
1.389298, -2.449773, 3.505978, 1, 0, 0.5058824, 1,
1.409742, -1.457062, 3.750882, 1, 0, 0.4980392, 1,
1.415246, 0.2238311, 2.297864, 1, 0, 0.4901961, 1,
1.42766, -1.090058, 2.70987, 1, 0, 0.4862745, 1,
1.44665, 1.144325, 1.111882, 1, 0, 0.4784314, 1,
1.446802, -0.8762724, 0.8340403, 1, 0, 0.4745098, 1,
1.451008, 1.06618, 2.112043, 1, 0, 0.4666667, 1,
1.455137, 1.2234, -1.143194, 1, 0, 0.4627451, 1,
1.474782, 1.39094, 0.3139119, 1, 0, 0.454902, 1,
1.478618, -0.6998587, 1.582645, 1, 0, 0.4509804, 1,
1.484313, -0.6872495, 3.10616, 1, 0, 0.4431373, 1,
1.48831, -0.1023589, 0.5281675, 1, 0, 0.4392157, 1,
1.488596, -1.137278, 4.274343, 1, 0, 0.4313726, 1,
1.491701, 1.026114, 0.6407617, 1, 0, 0.427451, 1,
1.495283, -1.543534, 1.734093, 1, 0, 0.4196078, 1,
1.497318, -0.8788942, 1.953792, 1, 0, 0.4156863, 1,
1.502609, 0.1197012, 2.575203, 1, 0, 0.4078431, 1,
1.503246, -1.15914, 2.562597, 1, 0, 0.4039216, 1,
1.510535, 1.1914, -1.454263, 1, 0, 0.3960784, 1,
1.510804, -0.277606, 2.305815, 1, 0, 0.3882353, 1,
1.515349, -0.1900373, 1.070875, 1, 0, 0.3843137, 1,
1.523047, -0.177887, 0.1379363, 1, 0, 0.3764706, 1,
1.523136, -0.126312, 5.514844, 1, 0, 0.372549, 1,
1.531187, -0.7596834, 1.942459, 1, 0, 0.3647059, 1,
1.550859, -0.4635983, 1.374979, 1, 0, 0.3607843, 1,
1.561942, -0.5188903, 1.598581, 1, 0, 0.3529412, 1,
1.565165, -0.004570209, 1.768749, 1, 0, 0.3490196, 1,
1.573594, 1.729674, 0.8697183, 1, 0, 0.3411765, 1,
1.584852, 0.7053815, -0.6253709, 1, 0, 0.3372549, 1,
1.595067, 1.388548, 1.229742, 1, 0, 0.3294118, 1,
1.613465, -1.244891, 3.754132, 1, 0, 0.3254902, 1,
1.621296, -0.25383, 2.448199, 1, 0, 0.3176471, 1,
1.626909, -1.5766, 3.322846, 1, 0, 0.3137255, 1,
1.655919, -1.629235, 2.832762, 1, 0, 0.3058824, 1,
1.675097, 1.245477, 1.38278, 1, 0, 0.2980392, 1,
1.685657, -0.2432646, 3.329407, 1, 0, 0.2941177, 1,
1.687839, -0.4407555, 1.825649, 1, 0, 0.2862745, 1,
1.7009, 1.391819, 1.360086, 1, 0, 0.282353, 1,
1.702089, 0.5755463, -0.1266829, 1, 0, 0.2745098, 1,
1.73124, -0.4748361, 3.108165, 1, 0, 0.2705882, 1,
1.733252, -0.3071533, 3.437788, 1, 0, 0.2627451, 1,
1.745339, -0.6678064, 0.08912448, 1, 0, 0.2588235, 1,
1.746718, -1.208364, 3.718731, 1, 0, 0.2509804, 1,
1.793222, 1.267404, 0.03787723, 1, 0, 0.2470588, 1,
1.798075, -2.427069, 0.1568048, 1, 0, 0.2392157, 1,
1.811288, -0.3240602, 2.127009, 1, 0, 0.2352941, 1,
1.835043, 0.443318, 0.1690491, 1, 0, 0.227451, 1,
1.848601, -1.532697, 2.009817, 1, 0, 0.2235294, 1,
1.852473, 0.5446803, 0.6227604, 1, 0, 0.2156863, 1,
1.857623, 0.08045665, 1.101999, 1, 0, 0.2117647, 1,
1.860417, -0.04420907, 1.510315, 1, 0, 0.2039216, 1,
1.860945, -0.629719, 1.17125, 1, 0, 0.1960784, 1,
1.861558, 1.156449, 1.404616, 1, 0, 0.1921569, 1,
1.872219, 2.0121, 1.748045, 1, 0, 0.1843137, 1,
1.877612, 0.2244412, 0.5477777, 1, 0, 0.1803922, 1,
1.882284, 0.3422664, 0.3348547, 1, 0, 0.172549, 1,
1.885159, -0.3806014, -0.2093214, 1, 0, 0.1686275, 1,
1.925554, -0.6546686, 4.052806, 1, 0, 0.1607843, 1,
1.938534, -1.673788, 2.294089, 1, 0, 0.1568628, 1,
2.047321, 0.8621202, 1.616782, 1, 0, 0.1490196, 1,
2.04792, 0.2563868, 2.442791, 1, 0, 0.145098, 1,
2.055626, -1.164656, 2.586521, 1, 0, 0.1372549, 1,
2.078483, -0.638177, 1.328586, 1, 0, 0.1333333, 1,
2.085909, -0.1601974, 2.50521, 1, 0, 0.1254902, 1,
2.096604, -0.9466949, 2.067682, 1, 0, 0.1215686, 1,
2.102692, 0.8218188, 2.744279, 1, 0, 0.1137255, 1,
2.142722, -0.4094643, 3.129418, 1, 0, 0.1098039, 1,
2.146431, -1.861669, 2.819093, 1, 0, 0.1019608, 1,
2.251213, -0.4876268, 2.515505, 1, 0, 0.09411765, 1,
2.261606, -1.596107, 1.76866, 1, 0, 0.09019608, 1,
2.305693, 0.2526229, 2.112876, 1, 0, 0.08235294, 1,
2.350565, -0.8724656, 0.8626828, 1, 0, 0.07843138, 1,
2.371871, 0.4250796, 0.5808516, 1, 0, 0.07058824, 1,
2.386759, 0.3269368, 0.9039776, 1, 0, 0.06666667, 1,
2.409655, -0.2962306, 0.6889204, 1, 0, 0.05882353, 1,
2.422238, -0.2393221, 2.152861, 1, 0, 0.05490196, 1,
2.44678, 0.02691196, 0.5082006, 1, 0, 0.04705882, 1,
2.485795, 3.277997, 3.078569, 1, 0, 0.04313726, 1,
2.496653, -1.32174, 2.744514, 1, 0, 0.03529412, 1,
2.602637, 1.144193, 1.727113, 1, 0, 0.03137255, 1,
2.704998, -0.09298567, 2.170078, 1, 0, 0.02352941, 1,
2.792353, 1.608138, 0.522112, 1, 0, 0.01960784, 1,
3.107361, -0.2228784, 1.263171, 1, 0, 0.01176471, 1,
3.566758, 1.933782, 0.6283455, 1, 0, 0.007843138, 1
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
0.2327181, -4.601228, -7.936825, 0, -0.5, 0.5, 0.5,
0.2327181, -4.601228, -7.936825, 1, -0.5, 0.5, 0.5,
0.2327181, -4.601228, -7.936825, 1, 1.5, 0.5, 0.5,
0.2327181, -4.601228, -7.936825, 0, 1.5, 0.5, 0.5
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
-4.231561, 0.04738951, -7.936825, 0, -0.5, 0.5, 0.5,
-4.231561, 0.04738951, -7.936825, 1, -0.5, 0.5, 0.5,
-4.231561, 0.04738951, -7.936825, 1, 1.5, 0.5, 0.5,
-4.231561, 0.04738951, -7.936825, 0, 1.5, 0.5, 0.5
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
-4.231561, -4.601228, -0.2361898, 0, -0.5, 0.5, 0.5,
-4.231561, -4.601228, -0.2361898, 1, -0.5, 0.5, 0.5,
-4.231561, -4.601228, -0.2361898, 1, 1.5, 0.5, 0.5,
-4.231561, -4.601228, -0.2361898, 0, 1.5, 0.5, 0.5
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
-3, -3.52847, -6.159755,
3, -3.52847, -6.159755,
-3, -3.52847, -6.159755,
-3, -3.707263, -6.455934,
-2, -3.52847, -6.159755,
-2, -3.707263, -6.455934,
-1, -3.52847, -6.159755,
-1, -3.707263, -6.455934,
0, -3.52847, -6.159755,
0, -3.707263, -6.455934,
1, -3.52847, -6.159755,
1, -3.707263, -6.455934,
2, -3.52847, -6.159755,
2, -3.707263, -6.455934,
3, -3.52847, -6.159755,
3, -3.707263, -6.455934
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
-3, -4.064849, -7.04829, 0, -0.5, 0.5, 0.5,
-3, -4.064849, -7.04829, 1, -0.5, 0.5, 0.5,
-3, -4.064849, -7.04829, 1, 1.5, 0.5, 0.5,
-3, -4.064849, -7.04829, 0, 1.5, 0.5, 0.5,
-2, -4.064849, -7.04829, 0, -0.5, 0.5, 0.5,
-2, -4.064849, -7.04829, 1, -0.5, 0.5, 0.5,
-2, -4.064849, -7.04829, 1, 1.5, 0.5, 0.5,
-2, -4.064849, -7.04829, 0, 1.5, 0.5, 0.5,
-1, -4.064849, -7.04829, 0, -0.5, 0.5, 0.5,
-1, -4.064849, -7.04829, 1, -0.5, 0.5, 0.5,
-1, -4.064849, -7.04829, 1, 1.5, 0.5, 0.5,
-1, -4.064849, -7.04829, 0, 1.5, 0.5, 0.5,
0, -4.064849, -7.04829, 0, -0.5, 0.5, 0.5,
0, -4.064849, -7.04829, 1, -0.5, 0.5, 0.5,
0, -4.064849, -7.04829, 1, 1.5, 0.5, 0.5,
0, -4.064849, -7.04829, 0, 1.5, 0.5, 0.5,
1, -4.064849, -7.04829, 0, -0.5, 0.5, 0.5,
1, -4.064849, -7.04829, 1, -0.5, 0.5, 0.5,
1, -4.064849, -7.04829, 1, 1.5, 0.5, 0.5,
1, -4.064849, -7.04829, 0, 1.5, 0.5, 0.5,
2, -4.064849, -7.04829, 0, -0.5, 0.5, 0.5,
2, -4.064849, -7.04829, 1, -0.5, 0.5, 0.5,
2, -4.064849, -7.04829, 1, 1.5, 0.5, 0.5,
2, -4.064849, -7.04829, 0, 1.5, 0.5, 0.5,
3, -4.064849, -7.04829, 0, -0.5, 0.5, 0.5,
3, -4.064849, -7.04829, 1, -0.5, 0.5, 0.5,
3, -4.064849, -7.04829, 1, 1.5, 0.5, 0.5,
3, -4.064849, -7.04829, 0, 1.5, 0.5, 0.5
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
-3.201343, -3, -6.159755,
-3.201343, 3, -6.159755,
-3.201343, -3, -6.159755,
-3.373046, -3, -6.455934,
-3.201343, -2, -6.159755,
-3.373046, -2, -6.455934,
-3.201343, -1, -6.159755,
-3.373046, -1, -6.455934,
-3.201343, 0, -6.159755,
-3.373046, 0, -6.455934,
-3.201343, 1, -6.159755,
-3.373046, 1, -6.455934,
-3.201343, 2, -6.159755,
-3.373046, 2, -6.455934,
-3.201343, 3, -6.159755,
-3.373046, 3, -6.455934
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
-3.716452, -3, -7.04829, 0, -0.5, 0.5, 0.5,
-3.716452, -3, -7.04829, 1, -0.5, 0.5, 0.5,
-3.716452, -3, -7.04829, 1, 1.5, 0.5, 0.5,
-3.716452, -3, -7.04829, 0, 1.5, 0.5, 0.5,
-3.716452, -2, -7.04829, 0, -0.5, 0.5, 0.5,
-3.716452, -2, -7.04829, 1, -0.5, 0.5, 0.5,
-3.716452, -2, -7.04829, 1, 1.5, 0.5, 0.5,
-3.716452, -2, -7.04829, 0, 1.5, 0.5, 0.5,
-3.716452, -1, -7.04829, 0, -0.5, 0.5, 0.5,
-3.716452, -1, -7.04829, 1, -0.5, 0.5, 0.5,
-3.716452, -1, -7.04829, 1, 1.5, 0.5, 0.5,
-3.716452, -1, -7.04829, 0, 1.5, 0.5, 0.5,
-3.716452, 0, -7.04829, 0, -0.5, 0.5, 0.5,
-3.716452, 0, -7.04829, 1, -0.5, 0.5, 0.5,
-3.716452, 0, -7.04829, 1, 1.5, 0.5, 0.5,
-3.716452, 0, -7.04829, 0, 1.5, 0.5, 0.5,
-3.716452, 1, -7.04829, 0, -0.5, 0.5, 0.5,
-3.716452, 1, -7.04829, 1, -0.5, 0.5, 0.5,
-3.716452, 1, -7.04829, 1, 1.5, 0.5, 0.5,
-3.716452, 1, -7.04829, 0, 1.5, 0.5, 0.5,
-3.716452, 2, -7.04829, 0, -0.5, 0.5, 0.5,
-3.716452, 2, -7.04829, 1, -0.5, 0.5, 0.5,
-3.716452, 2, -7.04829, 1, 1.5, 0.5, 0.5,
-3.716452, 2, -7.04829, 0, 1.5, 0.5, 0.5,
-3.716452, 3, -7.04829, 0, -0.5, 0.5, 0.5,
-3.716452, 3, -7.04829, 1, -0.5, 0.5, 0.5,
-3.716452, 3, -7.04829, 1, 1.5, 0.5, 0.5,
-3.716452, 3, -7.04829, 0, 1.5, 0.5, 0.5
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
-3.201343, -3.52847, -4,
-3.201343, -3.52847, 4,
-3.201343, -3.52847, -4,
-3.373046, -3.707263, -4,
-3.201343, -3.52847, -2,
-3.373046, -3.707263, -2,
-3.201343, -3.52847, 0,
-3.373046, -3.707263, 0,
-3.201343, -3.52847, 2,
-3.373046, -3.707263, 2,
-3.201343, -3.52847, 4,
-3.373046, -3.707263, 4
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
-3.716452, -4.064849, -4, 0, -0.5, 0.5, 0.5,
-3.716452, -4.064849, -4, 1, -0.5, 0.5, 0.5,
-3.716452, -4.064849, -4, 1, 1.5, 0.5, 0.5,
-3.716452, -4.064849, -4, 0, 1.5, 0.5, 0.5,
-3.716452, -4.064849, -2, 0, -0.5, 0.5, 0.5,
-3.716452, -4.064849, -2, 1, -0.5, 0.5, 0.5,
-3.716452, -4.064849, -2, 1, 1.5, 0.5, 0.5,
-3.716452, -4.064849, -2, 0, 1.5, 0.5, 0.5,
-3.716452, -4.064849, 0, 0, -0.5, 0.5, 0.5,
-3.716452, -4.064849, 0, 1, -0.5, 0.5, 0.5,
-3.716452, -4.064849, 0, 1, 1.5, 0.5, 0.5,
-3.716452, -4.064849, 0, 0, 1.5, 0.5, 0.5,
-3.716452, -4.064849, 2, 0, -0.5, 0.5, 0.5,
-3.716452, -4.064849, 2, 1, -0.5, 0.5, 0.5,
-3.716452, -4.064849, 2, 1, 1.5, 0.5, 0.5,
-3.716452, -4.064849, 2, 0, 1.5, 0.5, 0.5,
-3.716452, -4.064849, 4, 0, -0.5, 0.5, 0.5,
-3.716452, -4.064849, 4, 1, -0.5, 0.5, 0.5,
-3.716452, -4.064849, 4, 1, 1.5, 0.5, 0.5,
-3.716452, -4.064849, 4, 0, 1.5, 0.5, 0.5
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
-3.201343, -3.52847, -6.159755,
-3.201343, 3.623249, -6.159755,
-3.201343, -3.52847, 5.687376,
-3.201343, 3.623249, 5.687376,
-3.201343, -3.52847, -6.159755,
-3.201343, -3.52847, 5.687376,
-3.201343, 3.623249, -6.159755,
-3.201343, 3.623249, 5.687376,
-3.201343, -3.52847, -6.159755,
3.666779, -3.52847, -6.159755,
-3.201343, -3.52847, 5.687376,
3.666779, -3.52847, 5.687376,
-3.201343, 3.623249, -6.159755,
3.666779, 3.623249, -6.159755,
-3.201343, 3.623249, 5.687376,
3.666779, 3.623249, 5.687376,
3.666779, -3.52847, -6.159755,
3.666779, 3.623249, -6.159755,
3.666779, -3.52847, 5.687376,
3.666779, 3.623249, 5.687376,
3.666779, -3.52847, -6.159755,
3.666779, -3.52847, 5.687376,
3.666779, 3.623249, -6.159755,
3.666779, 3.623249, 5.687376
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
var radius = 8.249485;
var distance = 36.70289;
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
mvMatrix.translate( -0.2327181, -0.04738951, 0.2361898 );
mvMatrix.scale( 1.298682, 1.247183, 0.7528831 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.70289);
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
etrimfos<-read.table("etrimfos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etrimfos$V2
```

```
## Error in eval(expr, envir, enclos): object 'etrimfos' not found
```

```r
y<-etrimfos$V3
```

```
## Error in eval(expr, envir, enclos): object 'etrimfos' not found
```

```r
z<-etrimfos$V4
```

```
## Error in eval(expr, envir, enclos): object 'etrimfos' not found
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
-3.101322, -0.08137014, -0.3276121, 0, 0, 1, 1, 1,
-2.73648, -0.02915002, -0.282634, 1, 0, 0, 1, 1,
-2.703249, -0.75063, -1.865701, 1, 0, 0, 1, 1,
-2.551394, -0.5356227, -1.23296, 1, 0, 0, 1, 1,
-2.537462, -0.5660192, -1.495558, 1, 0, 0, 1, 1,
-2.400408, -0.1698165, -1.805635, 1, 0, 0, 1, 1,
-2.330794, -0.5420529, -0.505122, 0, 0, 0, 1, 1,
-2.318328, -0.7325537, -1.222263, 0, 0, 0, 1, 1,
-2.253443, -2.086146, -1.501205, 0, 0, 0, 1, 1,
-2.250023, 0.9447018, -0.4976549, 0, 0, 0, 1, 1,
-2.192049, -1.175049, -1.66884, 0, 0, 0, 1, 1,
-2.157657, 0.4662314, -0.6761166, 0, 0, 0, 1, 1,
-2.101686, 0.4414357, -1.356455, 0, 0, 0, 1, 1,
-2.099926, 0.1292738, -2.859089, 1, 1, 1, 1, 1,
-2.096094, 0.5051431, -2.045898, 1, 1, 1, 1, 1,
-2.089688, 1.553433, -2.073677, 1, 1, 1, 1, 1,
-2.046107, -0.259343, -2.106811, 1, 1, 1, 1, 1,
-2.030568, 0.1559947, -2.168607, 1, 1, 1, 1, 1,
-1.985652, -0.9317966, -2.075356, 1, 1, 1, 1, 1,
-1.979042, 3.519098, 0.4415999, 1, 1, 1, 1, 1,
-1.977778, -0.3176964, -4.228655, 1, 1, 1, 1, 1,
-1.949936, 0.3885486, -1.32857, 1, 1, 1, 1, 1,
-1.946679, -1.690101, -1.894372, 1, 1, 1, 1, 1,
-1.942693, 0.1048236, -1.188361, 1, 1, 1, 1, 1,
-1.942135, 0.1017076, -0.8037108, 1, 1, 1, 1, 1,
-1.939484, -1.017603, -0.4140343, 1, 1, 1, 1, 1,
-1.934927, -0.5233238, -3.883644, 1, 1, 1, 1, 1,
-1.923952, 1.765867, 0.01430722, 1, 1, 1, 1, 1,
-1.916263, 1.574695, -1.316179, 0, 0, 1, 1, 1,
-1.91481, -0.7691036, -3.118854, 1, 0, 0, 1, 1,
-1.908635, -0.06849691, -2.336237, 1, 0, 0, 1, 1,
-1.903942, 0.6486779, -1.382526, 1, 0, 0, 1, 1,
-1.901216, 0.5970212, -2.300747, 1, 0, 0, 1, 1,
-1.892882, -0.5694452, -0.8595132, 1, 0, 0, 1, 1,
-1.885701, 0.5410935, -0.3727966, 0, 0, 0, 1, 1,
-1.868742, -0.130273, -3.185072, 0, 0, 0, 1, 1,
-1.845881, 0.08976283, -2.98823, 0, 0, 0, 1, 1,
-1.842404, -0.4211766, -0.8223161, 0, 0, 0, 1, 1,
-1.842382, 1.272262, -2.315602, 0, 0, 0, 1, 1,
-1.829135, 0.4177132, -3.153509, 0, 0, 0, 1, 1,
-1.822557, -0.7573366, -1.556622, 0, 0, 0, 1, 1,
-1.814453, -0.1073766, -0.9612346, 1, 1, 1, 1, 1,
-1.805368, -0.9963752, -2.828137, 1, 1, 1, 1, 1,
-1.804573, -1.113304, -2.114806, 1, 1, 1, 1, 1,
-1.787465, 0.1914041, -1.128221, 1, 1, 1, 1, 1,
-1.769492, 1.48506, 0.5438135, 1, 1, 1, 1, 1,
-1.760172, -0.1068567, -4.253023, 1, 1, 1, 1, 1,
-1.759953, 0.644654, -2.98091, 1, 1, 1, 1, 1,
-1.757263, -0.6719071, -2.018009, 1, 1, 1, 1, 1,
-1.749147, 1.160183, -0.586561, 1, 1, 1, 1, 1,
-1.747786, 0.2568516, -0.7081212, 1, 1, 1, 1, 1,
-1.741226, 0.2824401, -1.368584, 1, 1, 1, 1, 1,
-1.73823, -0.1953609, -1.589357, 1, 1, 1, 1, 1,
-1.733, -0.1498373, -1.166051, 1, 1, 1, 1, 1,
-1.727791, -0.1537733, -1.969455, 1, 1, 1, 1, 1,
-1.725217, -0.3752322, -1.274599, 1, 1, 1, 1, 1,
-1.721131, 0.1904918, -0.8823979, 0, 0, 1, 1, 1,
-1.711671, -0.8614081, -3.628111, 1, 0, 0, 1, 1,
-1.71109, -0.650691, -3.402987, 1, 0, 0, 1, 1,
-1.681187, 0.8190504, -0.9432905, 1, 0, 0, 1, 1,
-1.679025, -0.7883246, -2.414029, 1, 0, 0, 1, 1,
-1.671424, -0.8589364, -2.518347, 1, 0, 0, 1, 1,
-1.659742, -0.7082555, -3.689498, 0, 0, 0, 1, 1,
-1.636256, -0.4616574, -3.102695, 0, 0, 0, 1, 1,
-1.635564, 0.666907, -0.4618117, 0, 0, 0, 1, 1,
-1.634146, -0.9236932, 0.2686469, 0, 0, 0, 1, 1,
-1.630587, -0.0359767, -0.6877689, 0, 0, 0, 1, 1,
-1.623421, 0.6991904, -2.715496, 0, 0, 0, 1, 1,
-1.619411, -1.628037, -1.074295, 0, 0, 0, 1, 1,
-1.61759, 1.436119, -0.7294389, 1, 1, 1, 1, 1,
-1.616229, 2.024684, 0.3275411, 1, 1, 1, 1, 1,
-1.604996, -0.644548, -1.673308, 1, 1, 1, 1, 1,
-1.595223, 1.081747, -0.8530518, 1, 1, 1, 1, 1,
-1.586318, 0.5602819, -1.704663, 1, 1, 1, 1, 1,
-1.583444, -1.984714, -2.928987, 1, 1, 1, 1, 1,
-1.570153, 0.7500936, -1.494987, 1, 1, 1, 1, 1,
-1.567043, -1.197567, -1.601795, 1, 1, 1, 1, 1,
-1.565906, 0.3736656, -2.158218, 1, 1, 1, 1, 1,
-1.561472, -0.6769181, -3.169312, 1, 1, 1, 1, 1,
-1.559423, -2.01456, -2.845775, 1, 1, 1, 1, 1,
-1.547787, 0.2287467, -2.495013, 1, 1, 1, 1, 1,
-1.546038, 1.453683, -1.708643, 1, 1, 1, 1, 1,
-1.528694, 1.188568, -2.030037, 1, 1, 1, 1, 1,
-1.524788, 0.5701966, -0.1712776, 1, 1, 1, 1, 1,
-1.517137, 0.9584417, -3.070812, 0, 0, 1, 1, 1,
-1.508447, -0.6076074, -3.213268, 1, 0, 0, 1, 1,
-1.507219, 0.7642177, -1.812042, 1, 0, 0, 1, 1,
-1.493974, 1.731901, 0.07188113, 1, 0, 0, 1, 1,
-1.488306, 1.457175, -2.130504, 1, 0, 0, 1, 1,
-1.470204, -0.80607, -3.569388, 1, 0, 0, 1, 1,
-1.469028, 0.08606853, 1.010239, 0, 0, 0, 1, 1,
-1.466954, -0.3706935, -1.699476, 0, 0, 0, 1, 1,
-1.456924, -0.6085916, -2.225879, 0, 0, 0, 1, 1,
-1.447255, 1.896269, -0.6213328, 0, 0, 0, 1, 1,
-1.447233, 1.768065, 0.725244, 0, 0, 0, 1, 1,
-1.44208, 1.409971, 0.5203394, 0, 0, 0, 1, 1,
-1.441031, 0.5186318, -0.2005259, 0, 0, 0, 1, 1,
-1.435564, 0.3151188, -2.664567, 1, 1, 1, 1, 1,
-1.43543, 0.8375357, -0.6275958, 1, 1, 1, 1, 1,
-1.425866, 1.095826, -0.7599247, 1, 1, 1, 1, 1,
-1.425541, -0.1690045, -0.6236683, 1, 1, 1, 1, 1,
-1.418442, 0.732653, 0.6450761, 1, 1, 1, 1, 1,
-1.414983, -1.023379, -2.545083, 1, 1, 1, 1, 1,
-1.405946, 0.6814207, 1.343246, 1, 1, 1, 1, 1,
-1.400614, 1.68877, 0.02329771, 1, 1, 1, 1, 1,
-1.399166, 0.1486711, -0.8687932, 1, 1, 1, 1, 1,
-1.397117, -0.1578842, -1.761801, 1, 1, 1, 1, 1,
-1.382009, -0.2544574, -3.165743, 1, 1, 1, 1, 1,
-1.373882, 0.4802631, -2.032597, 1, 1, 1, 1, 1,
-1.371922, 0.6409415, -1.151244, 1, 1, 1, 1, 1,
-1.371111, -1.871326, -2.106171, 1, 1, 1, 1, 1,
-1.364599, -2.343348, -3.303765, 1, 1, 1, 1, 1,
-1.356669, -0.1464129, -1.970732, 0, 0, 1, 1, 1,
-1.322749, -0.6069561, -3.006995, 1, 0, 0, 1, 1,
-1.318788, 0.9935202, -1.183625, 1, 0, 0, 1, 1,
-1.315578, 0.2867034, -1.83916, 1, 0, 0, 1, 1,
-1.31452, -0.3563926, -2.664964, 1, 0, 0, 1, 1,
-1.311587, 1.48055, -1.245065, 1, 0, 0, 1, 1,
-1.308257, 0.2585859, -1.119856, 0, 0, 0, 1, 1,
-1.307033, 1.499776, -0.6115348, 0, 0, 0, 1, 1,
-1.301255, 1.818079, 0.9741376, 0, 0, 0, 1, 1,
-1.300211, 1.040534, -0.3677479, 0, 0, 0, 1, 1,
-1.298735, 0.7714403, -0.9572598, 0, 0, 0, 1, 1,
-1.293475, -0.9993959, -2.367191, 0, 0, 0, 1, 1,
-1.289014, 0.8592094, -0.652209, 0, 0, 0, 1, 1,
-1.284105, -0.1807618, -1.848358, 1, 1, 1, 1, 1,
-1.282438, -1.337915, -2.622406, 1, 1, 1, 1, 1,
-1.277901, 1.382944, -2.295607, 1, 1, 1, 1, 1,
-1.262694, -0.008438888, -1.899987, 1, 1, 1, 1, 1,
-1.260577, -0.6635522, -2.677411, 1, 1, 1, 1, 1,
-1.255647, -0.03156171, -2.800887, 1, 1, 1, 1, 1,
-1.246738, -0.25971, -1.199538, 1, 1, 1, 1, 1,
-1.244208, 0.8803966, -2.18561, 1, 1, 1, 1, 1,
-1.239081, 0.7373034, -0.9804028, 1, 1, 1, 1, 1,
-1.229777, -1.983104, -1.806857, 1, 1, 1, 1, 1,
-1.222499, -0.5713871, -2.82656, 1, 1, 1, 1, 1,
-1.206379, 1.050381, -0.1364297, 1, 1, 1, 1, 1,
-1.205742, 0.9134311, -1.907466, 1, 1, 1, 1, 1,
-1.203883, -1.164186, -1.431056, 1, 1, 1, 1, 1,
-1.199892, -0.0767262, -1.142687, 1, 1, 1, 1, 1,
-1.194574, -1.843602, -2.209477, 0, 0, 1, 1, 1,
-1.182968, 0.8623207, -1.892363, 1, 0, 0, 1, 1,
-1.180827, -0.4804733, -1.010587, 1, 0, 0, 1, 1,
-1.160866, -0.9435599, -2.68648, 1, 0, 0, 1, 1,
-1.160497, -0.370664, -0.7492365, 1, 0, 0, 1, 1,
-1.158051, -0.4000573, -2.929982, 1, 0, 0, 1, 1,
-1.154671, -0.3727648, -2.185664, 0, 0, 0, 1, 1,
-1.151938, -0.5252187, -1.715114, 0, 0, 0, 1, 1,
-1.151088, 0.7849159, -1.094867, 0, 0, 0, 1, 1,
-1.150916, -0.3485276, -1.976146, 0, 0, 0, 1, 1,
-1.147961, 2.403354, -0.307077, 0, 0, 0, 1, 1,
-1.142809, -2.040862, -3.680689, 0, 0, 0, 1, 1,
-1.138357, 0.02598608, -1.745655, 0, 0, 0, 1, 1,
-1.134924, 0.5582663, 0.8018633, 1, 1, 1, 1, 1,
-1.132384, -1.007345, -1.279781, 1, 1, 1, 1, 1,
-1.119461, 0.1818086, -2.336235, 1, 1, 1, 1, 1,
-1.117573, 1.503733, -0.02926995, 1, 1, 1, 1, 1,
-1.107845, -0.1613046, -2.687503, 1, 1, 1, 1, 1,
-1.098938, -0.09263877, -2.01969, 1, 1, 1, 1, 1,
-1.097838, 0.1615449, -1.165978, 1, 1, 1, 1, 1,
-1.088205, -0.9932753, -1.586544, 1, 1, 1, 1, 1,
-1.084039, 1.309264, -2.027436, 1, 1, 1, 1, 1,
-1.076575, 0.4215863, -0.7278486, 1, 1, 1, 1, 1,
-1.071947, -0.1127465, -1.791043, 1, 1, 1, 1, 1,
-1.070936, -0.8621067, -1.302298, 1, 1, 1, 1, 1,
-1.066335, -0.8990657, -2.669146, 1, 1, 1, 1, 1,
-1.065876, 0.3464383, 0.2311074, 1, 1, 1, 1, 1,
-1.054618, -0.8830802, -2.134999, 1, 1, 1, 1, 1,
-1.048828, 0.4932314, -0.8075414, 0, 0, 1, 1, 1,
-1.047222, 2.002915, -0.710486, 1, 0, 0, 1, 1,
-1.0326, 2.091683, -0.9672266, 1, 0, 0, 1, 1,
-1.023314, 0.7301196, -0.007297497, 1, 0, 0, 1, 1,
-1.018256, 0.2504145, -2.254867, 1, 0, 0, 1, 1,
-1.008439, 0.7393894, -1.727939, 1, 0, 0, 1, 1,
-1.0057, 0.3291339, -1.021667, 0, 0, 0, 1, 1,
-1.000107, -0.6738167, -1.270141, 0, 0, 0, 1, 1,
-0.9990087, 0.2266509, -0.2743865, 0, 0, 0, 1, 1,
-0.9988728, 0.5782356, -0.8196057, 0, 0, 0, 1, 1,
-0.9890303, -0.4015784, -3.506441, 0, 0, 0, 1, 1,
-0.9856428, 0.6475093, -2.600013, 0, 0, 0, 1, 1,
-0.9765213, 0.3896797, -0.4529949, 0, 0, 0, 1, 1,
-0.9699316, -0.4021436, -1.634411, 1, 1, 1, 1, 1,
-0.9696072, -1.195705, -2.172049, 1, 1, 1, 1, 1,
-0.964112, -0.4840045, -1.758989, 1, 1, 1, 1, 1,
-0.9529825, 0.6169633, -0.7071298, 1, 1, 1, 1, 1,
-0.952732, -0.04977395, -0.6693212, 1, 1, 1, 1, 1,
-0.9350234, -0.2739042, -2.435397, 1, 1, 1, 1, 1,
-0.9344484, 0.6954033, 0.4638206, 1, 1, 1, 1, 1,
-0.9335774, 0.4357096, -2.091511, 1, 1, 1, 1, 1,
-0.926487, 1.222197, -0.3890998, 1, 1, 1, 1, 1,
-0.922773, 0.8389252, 0.6356716, 1, 1, 1, 1, 1,
-0.920076, 0.09732737, -1.440902, 1, 1, 1, 1, 1,
-0.9183915, 0.1932235, 1.076488, 1, 1, 1, 1, 1,
-0.9062379, 0.8936936, -1.058836, 1, 1, 1, 1, 1,
-0.9039827, -0.2882794, -1.209611, 1, 1, 1, 1, 1,
-0.8981621, -2.003754, -3.236069, 1, 1, 1, 1, 1,
-0.8957905, 0.994445, -0.534066, 0, 0, 1, 1, 1,
-0.8844781, 0.504268, -3.175648, 1, 0, 0, 1, 1,
-0.880399, 0.5581223, -2.089309, 1, 0, 0, 1, 1,
-0.8737962, -0.5636727, -1.045359, 1, 0, 0, 1, 1,
-0.8644243, 1.657936, 0.336975, 1, 0, 0, 1, 1,
-0.8577726, -0.48847, -1.757097, 1, 0, 0, 1, 1,
-0.8542368, 0.9412886, 0.2347033, 0, 0, 0, 1, 1,
-0.8535261, 1.926583, -1.434208, 0, 0, 0, 1, 1,
-0.8502432, 1.327258, -2.957598, 0, 0, 0, 1, 1,
-0.8450379, -0.01111841, -1.456495, 0, 0, 0, 1, 1,
-0.8419485, -1.166818, -2.521997, 0, 0, 0, 1, 1,
-0.8384551, 1.724846, -0.2146447, 0, 0, 0, 1, 1,
-0.8373865, 0.1717468, -0.09908254, 0, 0, 0, 1, 1,
-0.8335249, 0.4723817, -0.4747425, 1, 1, 1, 1, 1,
-0.832226, 0.09063232, -0.9946628, 1, 1, 1, 1, 1,
-0.8309709, 0.4685499, -3.8903, 1, 1, 1, 1, 1,
-0.8309032, -0.7557614, -1.113684, 1, 1, 1, 1, 1,
-0.826454, 0.09464697, -1.482601, 1, 1, 1, 1, 1,
-0.8187407, -2.414211, -3.601799, 1, 1, 1, 1, 1,
-0.8175331, 1.109127, -1.97628, 1, 1, 1, 1, 1,
-0.8129654, -0.5937755, -3.062418, 1, 1, 1, 1, 1,
-0.8103445, 0.00920403, -3.549498, 1, 1, 1, 1, 1,
-0.8102188, -2.132039, -2.403844, 1, 1, 1, 1, 1,
-0.8069021, -0.8852983, -1.909067, 1, 1, 1, 1, 1,
-0.8066598, 0.3245717, -0.9300635, 1, 1, 1, 1, 1,
-0.8049752, 0.3894864, -2.365166, 1, 1, 1, 1, 1,
-0.8044369, 0.1019649, -1.224564, 1, 1, 1, 1, 1,
-0.8003175, -1.141899, -1.399351, 1, 1, 1, 1, 1,
-0.7941186, 1.967968, -1.144914, 0, 0, 1, 1, 1,
-0.7926824, -1.01565, -3.087718, 1, 0, 0, 1, 1,
-0.7844082, -0.6398273, -3.212447, 1, 0, 0, 1, 1,
-0.7758517, -2.006471, -3.01865, 1, 0, 0, 1, 1,
-0.7722027, -1.250373, -2.032678, 1, 0, 0, 1, 1,
-0.7700156, -1.235021, -3.608383, 1, 0, 0, 1, 1,
-0.7634345, -0.2950782, -2.693996, 0, 0, 0, 1, 1,
-0.7633964, -1.032961, -2.220051, 0, 0, 0, 1, 1,
-0.7617349, -1.292848, -1.773759, 0, 0, 0, 1, 1,
-0.7568768, -0.6660107, -4.368915, 0, 0, 0, 1, 1,
-0.7522584, 0.3800051, -0.03281752, 0, 0, 0, 1, 1,
-0.7500453, 1.278978, -1.519516, 0, 0, 0, 1, 1,
-0.7469684, 0.3973106, -1.764713, 0, 0, 0, 1, 1,
-0.745079, -0.7436246, -3.287517, 1, 1, 1, 1, 1,
-0.7434659, -0.07983695, 0.1297692, 1, 1, 1, 1, 1,
-0.7433742, 2.079461, -0.680324, 1, 1, 1, 1, 1,
-0.7426932, 1.876319, -1.95184, 1, 1, 1, 1, 1,
-0.7421684, 0.4917318, -0.9237092, 1, 1, 1, 1, 1,
-0.7370942, 1.15026, 0.924769, 1, 1, 1, 1, 1,
-0.7349646, 0.3494248, -0.2328671, 1, 1, 1, 1, 1,
-0.7334898, 0.8313045, -2.006564, 1, 1, 1, 1, 1,
-0.7238747, 1.08082, -1.659483, 1, 1, 1, 1, 1,
-0.7131422, 0.3655983, 0.6600423, 1, 1, 1, 1, 1,
-0.7128555, 0.6774158, -1.779673, 1, 1, 1, 1, 1,
-0.7108605, -1.062694, -0.2062839, 1, 1, 1, 1, 1,
-0.7103216, 0.678139, 1.192602, 1, 1, 1, 1, 1,
-0.708323, -2.129118, -2.226482, 1, 1, 1, 1, 1,
-0.7075778, 0.2196772, -0.4118867, 1, 1, 1, 1, 1,
-0.7038081, 0.3586344, -3.040367, 0, 0, 1, 1, 1,
-0.703359, -0.3629687, -3.53376, 1, 0, 0, 1, 1,
-0.6990561, 0.3897733, -1.425132, 1, 0, 0, 1, 1,
-0.6989686, -0.4164331, -3.129574, 1, 0, 0, 1, 1,
-0.6981975, -0.7741785, -2.413109, 1, 0, 0, 1, 1,
-0.6896022, 0.6995854, 0.2972777, 1, 0, 0, 1, 1,
-0.6811441, -0.9977941, -2.274137, 0, 0, 0, 1, 1,
-0.6810079, -2.088686, -4.52999, 0, 0, 0, 1, 1,
-0.6793602, 0.9429026, -1.376899, 0, 0, 0, 1, 1,
-0.6634036, 0.0906491, -2.459559, 0, 0, 0, 1, 1,
-0.6583135, 0.1132277, -1.437772, 0, 0, 0, 1, 1,
-0.6570202, 0.5212244, -0.1230419, 0, 0, 0, 1, 1,
-0.656444, -0.5817335, -3.685397, 0, 0, 0, 1, 1,
-0.6563548, 1.155645, -0.4263062, 1, 1, 1, 1, 1,
-0.6561909, -1.277002, -2.536893, 1, 1, 1, 1, 1,
-0.6558882, 1.038434, -0.8767574, 1, 1, 1, 1, 1,
-0.6439991, 1.609887, -0.7484605, 1, 1, 1, 1, 1,
-0.638939, 0.7031254, -0.2479508, 1, 1, 1, 1, 1,
-0.638307, -1.085863, -1.951379, 1, 1, 1, 1, 1,
-0.6344574, 0.1881902, -1.209463, 1, 1, 1, 1, 1,
-0.6253561, -0.2431228, -4.219687, 1, 1, 1, 1, 1,
-0.6249683, 0.6133139, 1.287457, 1, 1, 1, 1, 1,
-0.6154767, -0.09656326, -2.696373, 1, 1, 1, 1, 1,
-0.6143791, -0.8363785, -3.425887, 1, 1, 1, 1, 1,
-0.6101041, 1.671751, -1.262227, 1, 1, 1, 1, 1,
-0.6086357, 0.1353234, -0.08397335, 1, 1, 1, 1, 1,
-0.606717, 0.1896314, -0.162771, 1, 1, 1, 1, 1,
-0.6015113, -0.06561667, -1.662274, 1, 1, 1, 1, 1,
-0.5978419, -0.005674069, -2.35052, 0, 0, 1, 1, 1,
-0.5960375, 1.815911, -0.1101437, 1, 0, 0, 1, 1,
-0.5948776, -0.6683093, -2.024471, 1, 0, 0, 1, 1,
-0.5888237, -0.4146214, -1.971147, 1, 0, 0, 1, 1,
-0.5874008, 0.3112295, -0.5944859, 1, 0, 0, 1, 1,
-0.5872486, -1.072767, -0.5575525, 1, 0, 0, 1, 1,
-0.5841229, -1.952099, -1.479803, 0, 0, 0, 1, 1,
-0.5830535, -1.302224, -2.925767, 0, 0, 0, 1, 1,
-0.5820144, 0.3452527, 0.5467549, 0, 0, 0, 1, 1,
-0.581048, -0.1828949, -2.048033, 0, 0, 0, 1, 1,
-0.5809439, 0.1097232, -0.8946639, 0, 0, 0, 1, 1,
-0.5780741, -1.005572, -2.462246, 0, 0, 0, 1, 1,
-0.5734663, -1.233329, -3.125004, 0, 0, 0, 1, 1,
-0.5709998, 0.07301065, -2.687266, 1, 1, 1, 1, 1,
-0.5704305, 0.2598608, -1.142259, 1, 1, 1, 1, 1,
-0.5662545, -0.5777299, -2.495671, 1, 1, 1, 1, 1,
-0.5658136, -0.4530047, -2.26492, 1, 1, 1, 1, 1,
-0.5605546, 0.5869371, -2.62437, 1, 1, 1, 1, 1,
-0.549588, -0.9944507, -3.059697, 1, 1, 1, 1, 1,
-0.5492357, -0.4464747, -3.163437, 1, 1, 1, 1, 1,
-0.5484464, -1.712098, -1.831375, 1, 1, 1, 1, 1,
-0.5462874, -1.732078, -3.011234, 1, 1, 1, 1, 1,
-0.5425102, 0.8840895, -0.06744127, 1, 1, 1, 1, 1,
-0.5409719, 0.4805872, -0.1001507, 1, 1, 1, 1, 1,
-0.5372705, 0.02541773, -2.334728, 1, 1, 1, 1, 1,
-0.5358827, -0.7406075, -2.520457, 1, 1, 1, 1, 1,
-0.5341619, 1.508871, -2.589437, 1, 1, 1, 1, 1,
-0.5303515, -0.9442025, -3.183288, 1, 1, 1, 1, 1,
-0.5280994, 1.147374, 0.7616886, 0, 0, 1, 1, 1,
-0.5226621, -1.55748, -4.082145, 1, 0, 0, 1, 1,
-0.5193735, -0.1200105, -1.738165, 1, 0, 0, 1, 1,
-0.5191582, 0.3372322, -1.792938, 1, 0, 0, 1, 1,
-0.5099155, -0.1146169, -0.1976312, 1, 0, 0, 1, 1,
-0.5043797, 1.003802, -0.633011, 1, 0, 0, 1, 1,
-0.5043788, -0.364943, -0.5837782, 0, 0, 0, 1, 1,
-0.5029401, -1.254032, -3.195644, 0, 0, 0, 1, 1,
-0.5028661, -2.264021, -3.038655, 0, 0, 0, 1, 1,
-0.4987479, -0.2929345, -1.691846, 0, 0, 0, 1, 1,
-0.490435, 0.4474608, -1.439045, 0, 0, 0, 1, 1,
-0.4861335, -0.0111264, -1.389692, 0, 0, 0, 1, 1,
-0.4851854, -0.3546173, -1.060586, 0, 0, 0, 1, 1,
-0.4795898, -1.504741, -3.842859, 1, 1, 1, 1, 1,
-0.4753622, 0.6042321, -1.67379, 1, 1, 1, 1, 1,
-0.474461, -1.386837, -4.144678, 1, 1, 1, 1, 1,
-0.4727597, 0.6422395, 1.024046, 1, 1, 1, 1, 1,
-0.4687377, 0.206573, -1.353891, 1, 1, 1, 1, 1,
-0.4644139, 2.043626, 0.3412992, 1, 1, 1, 1, 1,
-0.46385, 0.5590262, -1.598105, 1, 1, 1, 1, 1,
-0.4636124, 0.5985738, -0.7728635, 1, 1, 1, 1, 1,
-0.4620512, -1.98255, -3.623181, 1, 1, 1, 1, 1,
-0.4527206, -0.124579, -0.3433526, 1, 1, 1, 1, 1,
-0.4517619, -1.559807, -1.905585, 1, 1, 1, 1, 1,
-0.450181, -0.5446918, -1.450421, 1, 1, 1, 1, 1,
-0.4476397, 1.304772, -1.093778, 1, 1, 1, 1, 1,
-0.4463753, 0.127607, -1.462279, 1, 1, 1, 1, 1,
-0.4458399, 1.495587, 0.3961321, 1, 1, 1, 1, 1,
-0.4430937, 0.2780428, -3.09565, 0, 0, 1, 1, 1,
-0.4429063, 0.2402979, -0.06877612, 1, 0, 0, 1, 1,
-0.4387827, 0.5706571, -1.295985, 1, 0, 0, 1, 1,
-0.4358657, -0.5628967, -2.259263, 1, 0, 0, 1, 1,
-0.4313622, 2.295206, -1.81022, 1, 0, 0, 1, 1,
-0.430318, -0.4195116, -1.329514, 1, 0, 0, 1, 1,
-0.4247328, 0.3376649, -0.8499421, 0, 0, 0, 1, 1,
-0.4198248, 0.7540087, 0.01073523, 0, 0, 0, 1, 1,
-0.419226, -1.064379, -2.090259, 0, 0, 0, 1, 1,
-0.4174852, -0.6107536, -1.408623, 0, 0, 0, 1, 1,
-0.4087867, -0.8490782, -2.392806, 0, 0, 0, 1, 1,
-0.4087118, -0.9162837, -1.821314, 0, 0, 0, 1, 1,
-0.4054284, 0.04103994, -1.519692, 0, 0, 0, 1, 1,
-0.4014095, 0.6247025, -0.4591408, 1, 1, 1, 1, 1,
-0.399857, 0.8989379, 1.166826, 1, 1, 1, 1, 1,
-0.395719, 1.479885, -1.38332, 1, 1, 1, 1, 1,
-0.3957091, 0.6454483, 0.04898168, 1, 1, 1, 1, 1,
-0.3941934, -0.06012462, -2.052739, 1, 1, 1, 1, 1,
-0.389011, 0.9736229, 0.9232705, 1, 1, 1, 1, 1,
-0.3883213, 0.763827, -0.9769144, 1, 1, 1, 1, 1,
-0.3878801, -0.7991253, -2.577294, 1, 1, 1, 1, 1,
-0.3842312, 0.7764118, 1.134007, 1, 1, 1, 1, 1,
-0.3788688, 1.126992, -1.192657, 1, 1, 1, 1, 1,
-0.3777094, 0.1415514, -1.432289, 1, 1, 1, 1, 1,
-0.3729839, 0.8957775, 0.7147387, 1, 1, 1, 1, 1,
-0.3704821, 0.009268072, -2.959966, 1, 1, 1, 1, 1,
-0.3690725, -0.5295531, -4.367049, 1, 1, 1, 1, 1,
-0.3656906, -1.278854, -3.558635, 1, 1, 1, 1, 1,
-0.3629707, -0.1577661, -2.164045, 0, 0, 1, 1, 1,
-0.3625482, -1.296843, -2.240646, 1, 0, 0, 1, 1,
-0.3607409, -1.455272, -3.791768, 1, 0, 0, 1, 1,
-0.3606262, -1.49214, -3.241795, 1, 0, 0, 1, 1,
-0.3574021, 0.5465668, -1.193869, 1, 0, 0, 1, 1,
-0.3566879, 0.5678032, -0.5023789, 1, 0, 0, 1, 1,
-0.3554684, 1.106755, -1.704995, 0, 0, 0, 1, 1,
-0.3552396, 1.100811, -0.590382, 0, 0, 0, 1, 1,
-0.3540896, 0.4281616, -2.177621, 0, 0, 0, 1, 1,
-0.3528082, 0.7261468, 0.4116145, 0, 0, 0, 1, 1,
-0.3524477, -0.4501209, -3.125861, 0, 0, 0, 1, 1,
-0.3523729, 1.058292, -1.281593, 0, 0, 0, 1, 1,
-0.3521997, -0.7643296, -2.611273, 0, 0, 0, 1, 1,
-0.3514594, 1.322869, -0.2422807, 1, 1, 1, 1, 1,
-0.3493609, 0.5720903, -0.5565287, 1, 1, 1, 1, 1,
-0.3467474, -0.919111, -3.519738, 1, 1, 1, 1, 1,
-0.3439948, -0.5985627, -0.04455309, 1, 1, 1, 1, 1,
-0.3401022, -0.6699873, -3.660051, 1, 1, 1, 1, 1,
-0.3369336, 0.1849163, -1.258476, 1, 1, 1, 1, 1,
-0.3347161, -1.554053, -1.558553, 1, 1, 1, 1, 1,
-0.3209054, -0.08260901, -2.029549, 1, 1, 1, 1, 1,
-0.3204998, -0.3048207, -1.660212, 1, 1, 1, 1, 1,
-0.3053031, 0.1822893, -1.899831, 1, 1, 1, 1, 1,
-0.3025919, 0.4683603, -0.670416, 1, 1, 1, 1, 1,
-0.300679, -0.5765577, -2.826328, 1, 1, 1, 1, 1,
-0.2949494, -0.6254219, -2.189487, 1, 1, 1, 1, 1,
-0.2949339, 0.3557912, -1.522498, 1, 1, 1, 1, 1,
-0.2919447, 1.088848, 0.2667728, 1, 1, 1, 1, 1,
-0.2854064, 0.9554275, -1.682273, 0, 0, 1, 1, 1,
-0.2826159, 1.191091, -1.147136, 1, 0, 0, 1, 1,
-0.2743201, -0.2806203, -0.9800099, 1, 0, 0, 1, 1,
-0.2699613, -1.408533, 0.444889, 1, 0, 0, 1, 1,
-0.2690729, 0.2350987, -0.7122103, 1, 0, 0, 1, 1,
-0.2667301, -1.305825, -1.398163, 1, 0, 0, 1, 1,
-0.2655604, 0.3776503, -1.166528, 0, 0, 0, 1, 1,
-0.2645281, 0.03016565, -1.297629, 0, 0, 0, 1, 1,
-0.261007, -1.532108, -3.750454, 0, 0, 0, 1, 1,
-0.2576419, -0.9787313, -2.646695, 0, 0, 0, 1, 1,
-0.2552317, -0.527412, -3.606261, 0, 0, 0, 1, 1,
-0.2532439, 0.0423709, -1.335929, 0, 0, 0, 1, 1,
-0.2454737, -0.3080926, -4.055027, 0, 0, 0, 1, 1,
-0.242133, -1.385661, -2.922731, 1, 1, 1, 1, 1,
-0.2369674, -0.1691547, 0.1878397, 1, 1, 1, 1, 1,
-0.2328915, 0.3845702, -1.771893, 1, 1, 1, 1, 1,
-0.2307964, 0.1607946, -0.04980191, 1, 1, 1, 1, 1,
-0.2303592, 0.03602927, -1.683098, 1, 1, 1, 1, 1,
-0.2294418, -0.1688351, 0.07376683, 1, 1, 1, 1, 1,
-0.2293116, 0.5672056, 0.6821083, 1, 1, 1, 1, 1,
-0.2274816, -1.841761, -3.699671, 1, 1, 1, 1, 1,
-0.2272448, -1.014264, -2.699727, 1, 1, 1, 1, 1,
-0.2270916, -0.03333978, 0.09183185, 1, 1, 1, 1, 1,
-0.2264681, -0.0006396841, -0.4890931, 1, 1, 1, 1, 1,
-0.2220982, 0.7521633, -0.3686658, 1, 1, 1, 1, 1,
-0.2163137, -1.26648, -4.524765, 1, 1, 1, 1, 1,
-0.2157428, 0.5192705, -0.742497, 1, 1, 1, 1, 1,
-0.2147641, 0.0318231, -1.454237, 1, 1, 1, 1, 1,
-0.2141501, 0.5410706, 0.2292677, 0, 0, 1, 1, 1,
-0.2123728, 0.03814556, -1.828196, 1, 0, 0, 1, 1,
-0.2077457, -1.15024, -2.044088, 1, 0, 0, 1, 1,
-0.2002915, -0.9767984, -3.216194, 1, 0, 0, 1, 1,
-0.1987397, 0.6141458, -1.251051, 1, 0, 0, 1, 1,
-0.1928724, -0.009423549, -2.421117, 1, 0, 0, 1, 1,
-0.1917454, -0.1735279, -1.925922, 0, 0, 0, 1, 1,
-0.1906019, 0.440462, -0.1141518, 0, 0, 0, 1, 1,
-0.1903709, -0.3230559, -3.09606, 0, 0, 0, 1, 1,
-0.1822529, -0.8831367, -3.856572, 0, 0, 0, 1, 1,
-0.181271, -0.02735318, -0.2354401, 0, 0, 0, 1, 1,
-0.1790874, 0.2071502, -2.566524, 0, 0, 0, 1, 1,
-0.1732459, 0.3273152, 1.091574, 0, 0, 0, 1, 1,
-0.1675787, 0.8314254, -0.20502, 1, 1, 1, 1, 1,
-0.1636105, 0.7566032, -1.164177, 1, 1, 1, 1, 1,
-0.1578784, 1.770723, 1.600075, 1, 1, 1, 1, 1,
-0.15606, 0.4464275, 1.096174, 1, 1, 1, 1, 1,
-0.1552703, 0.1375257, -1.15878, 1, 1, 1, 1, 1,
-0.1546206, 1.42287, 0.9300855, 1, 1, 1, 1, 1,
-0.1545025, -0.4105178, -2.060228, 1, 1, 1, 1, 1,
-0.1518722, 0.3814178, -1.478058, 1, 1, 1, 1, 1,
-0.1515168, 1.416833, -0.004171208, 1, 1, 1, 1, 1,
-0.1514557, -0.3066906, -2.439486, 1, 1, 1, 1, 1,
-0.1410993, -0.06825656, -0.5395818, 1, 1, 1, 1, 1,
-0.1349555, -0.2296363, -1.304508, 1, 1, 1, 1, 1,
-0.1343752, -0.8778101, -5.973152, 1, 1, 1, 1, 1,
-0.132678, -0.3865279, -3.848356, 1, 1, 1, 1, 1,
-0.1314345, -0.517042, -3.976702, 1, 1, 1, 1, 1,
-0.1296047, -0.9284914, -2.814026, 0, 0, 1, 1, 1,
-0.1294317, 1.250927, -1.261394, 1, 0, 0, 1, 1,
-0.1275135, 1.251973, 0.467068, 1, 0, 0, 1, 1,
-0.1251498, -0.3307642, -3.254445, 1, 0, 0, 1, 1,
-0.1222904, 0.3435187, 0.9356428, 1, 0, 0, 1, 1,
-0.1172572, 1.639218, -1.66605, 1, 0, 0, 1, 1,
-0.1138729, 1.528761, -1.003089, 0, 0, 0, 1, 1,
-0.1008336, -2.055011, -3.928323, 0, 0, 0, 1, 1,
-0.09910415, 0.4757649, -8.757255e-05, 0, 0, 0, 1, 1,
-0.098565, 1.020429, 0.5207453, 0, 0, 0, 1, 1,
-0.09665456, -0.0833702, -1.675876, 0, 0, 0, 1, 1,
-0.0960589, 0.2198233, -1.110962, 0, 0, 0, 1, 1,
-0.09326438, 0.7186099, -1.123351, 0, 0, 0, 1, 1,
-0.0902808, 0.64375, -1.69395, 1, 1, 1, 1, 1,
-0.08924972, 1.219616, 0.5228059, 1, 1, 1, 1, 1,
-0.08870449, -1.336861, -2.749635, 1, 1, 1, 1, 1,
-0.08819557, 1.76255, -0.06451926, 1, 1, 1, 1, 1,
-0.08600619, -0.1609058, -2.393152, 1, 1, 1, 1, 1,
-0.08579087, -2.980487, -4.965339, 1, 1, 1, 1, 1,
-0.0745019, 0.1671683, -0.933543, 1, 1, 1, 1, 1,
-0.07437015, -1.356019, -5.987224, 1, 1, 1, 1, 1,
-0.06973063, 0.9335245, 0.2072123, 1, 1, 1, 1, 1,
-0.06838684, -1.601655, -4.274413, 1, 1, 1, 1, 1,
-0.06730054, -0.6346462, -1.554391, 1, 1, 1, 1, 1,
-0.06700616, 0.2177417, -0.8539972, 1, 1, 1, 1, 1,
-0.06533234, 0.03552819, 1.422735, 1, 1, 1, 1, 1,
-0.06495825, -0.07062054, -3.36546, 1, 1, 1, 1, 1,
-0.06431245, 1.916585, 0.05873844, 1, 1, 1, 1, 1,
-0.06276495, -0.9086955, -3.560224, 0, 0, 1, 1, 1,
-0.05487408, -0.351203, -2.7494, 1, 0, 0, 1, 1,
-0.05422877, -1.333359, -4.471558, 1, 0, 0, 1, 1,
-0.05045683, -0.2017971, -0.6712252, 1, 0, 0, 1, 1,
-0.04791958, -0.4097377, -3.582778, 1, 0, 0, 1, 1,
-0.04426228, 0.05839609, -0.126917, 1, 0, 0, 1, 1,
-0.04384154, -1.048895, -2.4478, 0, 0, 0, 1, 1,
-0.03916886, -1.662843, -2.56432, 0, 0, 0, 1, 1,
-0.03784529, 0.5660904, 1.039405, 0, 0, 0, 1, 1,
-0.03558856, 0.6795713, 0.4487531, 0, 0, 0, 1, 1,
-0.03320225, 0.49142, 1.578063, 0, 0, 0, 1, 1,
-0.03276441, 0.8047922, -1.137411, 0, 0, 0, 1, 1,
-0.03166765, 1.025785, 0.7546667, 0, 0, 0, 1, 1,
-0.03028835, -0.2343944, -2.932101, 1, 1, 1, 1, 1,
-0.02772038, -1.254228, -4.764347, 1, 1, 1, 1, 1,
-0.02488585, -1.34853, -1.85388, 1, 1, 1, 1, 1,
-0.02399778, 0.4059039, -1.263698, 1, 1, 1, 1, 1,
-0.01274101, -0.2608461, -3.533865, 1, 1, 1, 1, 1,
-0.01173292, -1.825423, -2.932661, 1, 1, 1, 1, 1,
-4.52016e-05, -0.7756429, -4.155286, 1, 1, 1, 1, 1,
0.003297701, 0.431958, -0.01657675, 1, 1, 1, 1, 1,
0.006173679, 0.1426076, -0.6247239, 1, 1, 1, 1, 1,
0.01108999, 0.1919612, 0.5764269, 1, 1, 1, 1, 1,
0.02002616, -0.45138, 3.714478, 1, 1, 1, 1, 1,
0.02084628, -0.3449154, 3.257424, 1, 1, 1, 1, 1,
0.02155364, -0.09885702, 3.818246, 1, 1, 1, 1, 1,
0.02333771, 0.5327788, -0.9716228, 1, 1, 1, 1, 1,
0.02408065, -0.9046791, 4.137078, 1, 1, 1, 1, 1,
0.02975385, 1.428502, 1.369087, 0, 0, 1, 1, 1,
0.03358544, 0.7766086, -2.421218, 1, 0, 0, 1, 1,
0.03695767, 0.4132223, -0.6033095, 1, 0, 0, 1, 1,
0.03724708, 2.565655, -1.084915, 1, 0, 0, 1, 1,
0.03765728, 0.00437331, 2.456489, 1, 0, 0, 1, 1,
0.04017908, -0.6550947, 2.29379, 1, 0, 0, 1, 1,
0.04205275, 1.372904, 0.2314073, 0, 0, 0, 1, 1,
0.04365592, 1.42865, 0.8987104, 0, 0, 0, 1, 1,
0.04619129, 0.07748073, 0.2870661, 0, 0, 0, 1, 1,
0.04937636, 0.8431105, -0.699352, 0, 0, 0, 1, 1,
0.04974609, 0.2207541, -0.4081678, 0, 0, 0, 1, 1,
0.05466538, -1.384005, 3.454746, 0, 0, 0, 1, 1,
0.05790208, -0.2689771, 3.797244, 0, 0, 0, 1, 1,
0.05921111, 1.270042, 2.333897, 1, 1, 1, 1, 1,
0.05995329, 0.1685417, -0.7701258, 1, 1, 1, 1, 1,
0.06180149, -0.5438159, 3.060924, 1, 1, 1, 1, 1,
0.06188719, -1.210227, 2.610511, 1, 1, 1, 1, 1,
0.06352795, 1.82627, 0.1154175, 1, 1, 1, 1, 1,
0.06473663, -0.865557, 1.672102, 1, 1, 1, 1, 1,
0.06949913, 0.1988676, 1.89833, 1, 1, 1, 1, 1,
0.07017778, -0.7825673, 1.353097, 1, 1, 1, 1, 1,
0.07170516, -0.4656526, 2.947012, 1, 1, 1, 1, 1,
0.07406403, -1.186959, 4.172288, 1, 1, 1, 1, 1,
0.07510105, -0.1846002, 4.233373, 1, 1, 1, 1, 1,
0.07629393, -0.2230209, 2.217015, 1, 1, 1, 1, 1,
0.08310469, 0.2844487, -0.185193, 1, 1, 1, 1, 1,
0.08536652, 0.5007592, 0.7929699, 1, 1, 1, 1, 1,
0.08569201, -0.9496791, 4.250589, 1, 1, 1, 1, 1,
0.0885665, 0.3192908, -0.8144956, 0, 0, 1, 1, 1,
0.08954397, 0.3793096, -1.957953, 1, 0, 0, 1, 1,
0.0902242, -0.3924743, 3.441391, 1, 0, 0, 1, 1,
0.09107813, -0.562821, 4.739189, 1, 0, 0, 1, 1,
0.09322962, 2.274791, -0.6470849, 1, 0, 0, 1, 1,
0.09641054, -0.3312454, 4.313189, 1, 0, 0, 1, 1,
0.09864048, 0.314185, 1.428237, 0, 0, 0, 1, 1,
0.1013116, 1.456388, 0.2907932, 0, 0, 0, 1, 1,
0.1024227, -0.05999526, 1.407444, 0, 0, 0, 1, 1,
0.1025707, 1.144539, -1.979236, 0, 0, 0, 1, 1,
0.1042685, 0.6618418, -0.3516443, 0, 0, 0, 1, 1,
0.105791, -0.2315797, 2.956771, 0, 0, 0, 1, 1,
0.1193451, 1.286563, 0.2620541, 0, 0, 0, 1, 1,
0.1207816, -0.527398, 4.282184, 1, 1, 1, 1, 1,
0.122344, 0.4358994, 1.663915, 1, 1, 1, 1, 1,
0.1259575, -0.457374, 2.809969, 1, 1, 1, 1, 1,
0.1305301, -0.7957786, 3.107314, 1, 1, 1, 1, 1,
0.1312587, -1.481897, 3.050356, 1, 1, 1, 1, 1,
0.1347239, 0.005138952, 0.9715103, 1, 1, 1, 1, 1,
0.1348127, -1.213245, 3.288509, 1, 1, 1, 1, 1,
0.1397894, 0.5282947, 1.052152, 1, 1, 1, 1, 1,
0.1408078, -0.006420042, 1.419145, 1, 1, 1, 1, 1,
0.1412104, 0.5706553, -0.2085921, 1, 1, 1, 1, 1,
0.1414138, -0.266301, 2.312692, 1, 1, 1, 1, 1,
0.143139, 0.6759988, -0.1860493, 1, 1, 1, 1, 1,
0.1435388, -0.3786181, 3.429201, 1, 1, 1, 1, 1,
0.1464061, 0.6254256, 0.923197, 1, 1, 1, 1, 1,
0.1499846, -0.8149266, 3.181482, 1, 1, 1, 1, 1,
0.1572952, -1.087708, 2.805975, 0, 0, 1, 1, 1,
0.1631235, 0.6988973, -0.6051797, 1, 0, 0, 1, 1,
0.1648677, -0.4383, 2.432292, 1, 0, 0, 1, 1,
0.1675584, 1.443975, -0.3976979, 1, 0, 0, 1, 1,
0.16777, 0.02381804, 1.265432, 1, 0, 0, 1, 1,
0.1686718, -0.1024059, 3.015706, 1, 0, 0, 1, 1,
0.1701542, 0.8373909, 0.2246233, 0, 0, 0, 1, 1,
0.171458, -3.424319, 4.283358, 0, 0, 0, 1, 1,
0.1719611, 1.738533, 2.371255, 0, 0, 0, 1, 1,
0.1741953, 0.1490034, 0.5309991, 0, 0, 0, 1, 1,
0.1774006, -0.7339697, 2.350552, 0, 0, 0, 1, 1,
0.1871425, -0.3481658, 2.779611, 0, 0, 0, 1, 1,
0.187713, 0.7567263, -0.4755889, 0, 0, 0, 1, 1,
0.1892213, -1.055293, 3.208209, 1, 1, 1, 1, 1,
0.1928927, -0.569797, 2.901112, 1, 1, 1, 1, 1,
0.1944674, 0.9427511, -0.156483, 1, 1, 1, 1, 1,
0.1971524, 0.8529764, -1.921009, 1, 1, 1, 1, 1,
0.2053036, 0.9771377, -0.05689729, 1, 1, 1, 1, 1,
0.2134977, 0.1821839, 0.8854253, 1, 1, 1, 1, 1,
0.2138972, 0.02141429, 2.605365, 1, 1, 1, 1, 1,
0.2161731, -1.002182, 2.865197, 1, 1, 1, 1, 1,
0.2217769, -0.1173677, 0.801384, 1, 1, 1, 1, 1,
0.2232908, 2.372443, 0.7363998, 1, 1, 1, 1, 1,
0.2323014, 0.9391935, -0.3522218, 1, 1, 1, 1, 1,
0.2323871, -1.364548, 4.400311, 1, 1, 1, 1, 1,
0.2330946, -0.9664881, 3.012208, 1, 1, 1, 1, 1,
0.2378015, 0.374519, 0.3595854, 1, 1, 1, 1, 1,
0.2406917, 1.505289, 0.8726291, 1, 1, 1, 1, 1,
0.2412172, -0.3505855, 2.216371, 0, 0, 1, 1, 1,
0.2414336, 0.4574713, 0.3657787, 1, 0, 0, 1, 1,
0.2417955, -0.7545437, 2.992234, 1, 0, 0, 1, 1,
0.2442751, 0.6396418, 0.7278672, 1, 0, 0, 1, 1,
0.2459619, -0.2699196, 2.928288, 1, 0, 0, 1, 1,
0.2462927, -0.8861043, 2.367609, 1, 0, 0, 1, 1,
0.2464237, -0.07952815, 2.383689, 0, 0, 0, 1, 1,
0.2482419, 0.2202964, -1.024983, 0, 0, 0, 1, 1,
0.2490515, 1.498334, -1.013453, 0, 0, 0, 1, 1,
0.2500281, 0.7241626, 2.124705, 0, 0, 0, 1, 1,
0.2502112, -1.707729, 1.525683, 0, 0, 0, 1, 1,
0.2534277, 2.624126, 0.6544192, 0, 0, 0, 1, 1,
0.2539843, -1.768473, 2.925738, 0, 0, 0, 1, 1,
0.2539905, 0.1758709, 0.8366434, 1, 1, 1, 1, 1,
0.2592628, -0.4869447, 3.587901, 1, 1, 1, 1, 1,
0.2620665, 0.6467983, -0.5600919, 1, 1, 1, 1, 1,
0.2629615, -1.443021, 2.119398, 1, 1, 1, 1, 1,
0.2692586, -0.7628417, 2.49328, 1, 1, 1, 1, 1,
0.2719241, 2.058473, 1.118796, 1, 1, 1, 1, 1,
0.2724347, -0.189222, -0.6192224, 1, 1, 1, 1, 1,
0.2724627, 2.610912, -1.155344, 1, 1, 1, 1, 1,
0.2756964, 0.5275646, -0.522502, 1, 1, 1, 1, 1,
0.2784357, -0.5501664, 3.729321, 1, 1, 1, 1, 1,
0.2811401, -1.395344, 3.360929, 1, 1, 1, 1, 1,
0.2817508, 1.218161, 0.9562583, 1, 1, 1, 1, 1,
0.283994, -0.7954181, 3.367519, 1, 1, 1, 1, 1,
0.287444, 1.544182, -0.3775944, 1, 1, 1, 1, 1,
0.2889591, -0.6482, 2.685851, 1, 1, 1, 1, 1,
0.2889929, 0.353833, -1.352365, 0, 0, 1, 1, 1,
0.2899888, 1.669215, 0.1869989, 1, 0, 0, 1, 1,
0.2904989, -0.5988882, 4.014293, 1, 0, 0, 1, 1,
0.2915218, 0.102936, 0.5863083, 1, 0, 0, 1, 1,
0.2927625, -0.8444634, 3.007849, 1, 0, 0, 1, 1,
0.2986564, 0.3204153, 1.894595, 1, 0, 0, 1, 1,
0.2992986, -1.54868, 3.916901, 0, 0, 0, 1, 1,
0.3011519, 0.3491315, 0.3437054, 0, 0, 0, 1, 1,
0.3087979, 0.3870002, 1.440437, 0, 0, 0, 1, 1,
0.3097447, -0.6489369, 1.810454, 0, 0, 0, 1, 1,
0.3125251, 1.409172, -0.9131506, 0, 0, 0, 1, 1,
0.3176151, 0.152657, 2.083318, 0, 0, 0, 1, 1,
0.3267559, 0.3361333, 0.02911988, 0, 0, 0, 1, 1,
0.3304338, -0.3391024, 2.466243, 1, 1, 1, 1, 1,
0.3324281, 0.0663735, 2.375365, 1, 1, 1, 1, 1,
0.3336197, -0.5016597, 2.266585, 1, 1, 1, 1, 1,
0.336718, 1.318185, -0.01852393, 1, 1, 1, 1, 1,
0.3371164, 0.6736368, 0.8087674, 1, 1, 1, 1, 1,
0.3385103, -0.275881, 3.227225, 1, 1, 1, 1, 1,
0.3456426, -0.03240142, 1.328179, 1, 1, 1, 1, 1,
0.3546624, 0.9172423, -0.7192268, 1, 1, 1, 1, 1,
0.3556407, 1.164234, 0.6509892, 1, 1, 1, 1, 1,
0.357157, 0.507393, -0.2172865, 1, 1, 1, 1, 1,
0.3573345, -0.9802849, 2.361864, 1, 1, 1, 1, 1,
0.3644121, 3.133707, -0.5930495, 1, 1, 1, 1, 1,
0.3645517, 0.7581204, -0.9048043, 1, 1, 1, 1, 1,
0.3676327, 0.4717702, 0.3709555, 1, 1, 1, 1, 1,
0.3695716, -0.01587137, 0.9532618, 1, 1, 1, 1, 1,
0.373011, 0.4462408, -0.5617236, 0, 0, 1, 1, 1,
0.3759781, 0.1301857, 0.8410783, 1, 0, 0, 1, 1,
0.3785681, 0.8357263, 0.883562, 1, 0, 0, 1, 1,
0.3837622, -1.223293, 2.988655, 1, 0, 0, 1, 1,
0.3902245, 0.3481528, 0.3292077, 1, 0, 0, 1, 1,
0.3930001, -0.4733833, 3.138656, 1, 0, 0, 1, 1,
0.3954015, 0.3325619, 0.8462853, 0, 0, 0, 1, 1,
0.3957287, -0.5190161, 4.295939, 0, 0, 0, 1, 1,
0.3975921, 0.4203392, 0.6406796, 0, 0, 0, 1, 1,
0.3981884, 0.4467784, 1.246617, 0, 0, 0, 1, 1,
0.3982585, 0.8358883, -0.5055171, 0, 0, 0, 1, 1,
0.4021075, 0.03171787, 0.6118992, 0, 0, 0, 1, 1,
0.406873, -0.06305576, 2.962417, 0, 0, 0, 1, 1,
0.4068761, -0.9220544, 2.70328, 1, 1, 1, 1, 1,
0.4076584, -1.709897, 3.757586, 1, 1, 1, 1, 1,
0.4122525, 0.765785, 0.03926675, 1, 1, 1, 1, 1,
0.4163682, -1.044832, 3.053537, 1, 1, 1, 1, 1,
0.4229282, -0.6933546, 3.213753, 1, 1, 1, 1, 1,
0.4233184, 0.9316982, 0.5619245, 1, 1, 1, 1, 1,
0.4248488, 1.871282, 1.100594, 1, 1, 1, 1, 1,
0.4317473, 0.278341, 2.001457, 1, 1, 1, 1, 1,
0.4368769, 0.9848355, 0.8564138, 1, 1, 1, 1, 1,
0.4371759, 0.4082752, 0.3750723, 1, 1, 1, 1, 1,
0.4402449, 1.110386, 0.7317794, 1, 1, 1, 1, 1,
0.4411037, 0.1303194, 0.01551132, 1, 1, 1, 1, 1,
0.4414429, -0.0117799, 0.8520373, 1, 1, 1, 1, 1,
0.4418687, 1.584951, -0.8131405, 1, 1, 1, 1, 1,
0.4443392, 1.274309, -0.259359, 1, 1, 1, 1, 1,
0.4457225, -0.2613731, 0.8962873, 0, 0, 1, 1, 1,
0.4524597, -1.633682, 3.159395, 1, 0, 0, 1, 1,
0.4556317, -1.343576, 2.72307, 1, 0, 0, 1, 1,
0.4581136, -0.9949942, 2.158086, 1, 0, 0, 1, 1,
0.4635233, -1.92529, 4.845905, 1, 0, 0, 1, 1,
0.4639234, -0.6351704, 1.804975, 1, 0, 0, 1, 1,
0.4681931, -0.3905518, 1.90993, 0, 0, 0, 1, 1,
0.4682065, 0.1025923, 0.6902125, 0, 0, 0, 1, 1,
0.4682678, 0.7114832, -0.889255, 0, 0, 0, 1, 1,
0.4775407, -0.4974537, 2.662505, 0, 0, 0, 1, 1,
0.4783043, -1.507605, 3.936998, 0, 0, 0, 1, 1,
0.4803915, -0.3493206, 2.382841, 0, 0, 0, 1, 1,
0.4811793, 1.129071, 0.09588984, 0, 0, 0, 1, 1,
0.4816154, -0.6136825, 1.751569, 1, 1, 1, 1, 1,
0.4839399, 0.9097444, -0.2527386, 1, 1, 1, 1, 1,
0.4848005, 0.8188608, 2.141914, 1, 1, 1, 1, 1,
0.4868856, 2.845321, -0.7749351, 1, 1, 1, 1, 1,
0.4872902, 0.2579178, 0.958583, 1, 1, 1, 1, 1,
0.4921398, 0.8340765, -0.7707801, 1, 1, 1, 1, 1,
0.4935227, 0.04430945, 2.072909, 1, 1, 1, 1, 1,
0.5073481, -1.648177, 2.964723, 1, 1, 1, 1, 1,
0.5090531, 0.2890968, 0.826197, 1, 1, 1, 1, 1,
0.5127299, -0.1205508, 0.7065995, 1, 1, 1, 1, 1,
0.513886, -2.038806, 4.23087, 1, 1, 1, 1, 1,
0.5171381, 0.4201523, 0.892791, 1, 1, 1, 1, 1,
0.5172254, -1.409849, 2.264576, 1, 1, 1, 1, 1,
0.5193564, -1.874208, 3.838469, 1, 1, 1, 1, 1,
0.5294406, 0.7228473, 1.285123, 1, 1, 1, 1, 1,
0.5358046, 0.434953, 2.495053, 0, 0, 1, 1, 1,
0.5358625, 0.1480725, 0.4993712, 1, 0, 0, 1, 1,
0.5399812, -0.7544141, 4.757046, 1, 0, 0, 1, 1,
0.5427112, -0.3587855, 1.203651, 1, 0, 0, 1, 1,
0.5454808, 0.5460026, 1.136267, 1, 0, 0, 1, 1,
0.5469892, -1.313077, 2.068584, 1, 0, 0, 1, 1,
0.5470632, -0.1259136, 1.030889, 0, 0, 0, 1, 1,
0.5488934, 0.3515415, 2.56048, 0, 0, 0, 1, 1,
0.5497686, -0.02770675, 1.88252, 0, 0, 0, 1, 1,
0.5543675, 0.1749434, 1.87315, 0, 0, 0, 1, 1,
0.5557575, 0.3466001, -0.493071, 0, 0, 0, 1, 1,
0.557234, 1.008833, 1.899068, 0, 0, 0, 1, 1,
0.5579112, -1.196029, 3.287731, 0, 0, 0, 1, 1,
0.5601738, 1.598857, 0.959398, 1, 1, 1, 1, 1,
0.5605516, 0.4636441, 0.8019603, 1, 1, 1, 1, 1,
0.5632603, -0.9623395, 2.217352, 1, 1, 1, 1, 1,
0.5645444, -2.372553, 2.970436, 1, 1, 1, 1, 1,
0.567278, 0.7657925, 0.580696, 1, 1, 1, 1, 1,
0.5732533, 0.7089245, 0.3287172, 1, 1, 1, 1, 1,
0.577207, 0.2897527, 1.841876, 1, 1, 1, 1, 1,
0.5787134, -0.5451913, 1.956365, 1, 1, 1, 1, 1,
0.579724, 1.460982, -0.158287, 1, 1, 1, 1, 1,
0.5829705, 0.8555381, 2.671124, 1, 1, 1, 1, 1,
0.5844991, 0.767042, 0.8691498, 1, 1, 1, 1, 1,
0.586423, -0.6785993, 1.43986, 1, 1, 1, 1, 1,
0.5877165, -0.7813269, 3.490339, 1, 1, 1, 1, 1,
0.5902527, 0.6199473, 0.5091328, 1, 1, 1, 1, 1,
0.5906231, 0.2220419, 1.317533, 1, 1, 1, 1, 1,
0.598859, -0.4568196, 1.640212, 0, 0, 1, 1, 1,
0.5992529, 2.38856, 0.3318763, 1, 0, 0, 1, 1,
0.6000154, -0.7601281, 3.268082, 1, 0, 0, 1, 1,
0.600876, 0.3144657, 0.8985863, 1, 0, 0, 1, 1,
0.6041752, 0.5690641, 1.227242, 1, 0, 0, 1, 1,
0.604807, -0.2612326, 2.613107, 1, 0, 0, 1, 1,
0.6056209, 0.1969759, 2.55679, 0, 0, 0, 1, 1,
0.6076964, 0.1787044, 2.106181, 0, 0, 0, 1, 1,
0.6144361, 0.03125555, 0.3669555, 0, 0, 0, 1, 1,
0.6159095, -2.826479, 2.667362, 0, 0, 0, 1, 1,
0.6163756, -0.3532667, 2.776474, 0, 0, 0, 1, 1,
0.6310441, -1.518227, 3.515636, 0, 0, 0, 1, 1,
0.6316753, 0.2671918, 1.957828, 0, 0, 0, 1, 1,
0.6317093, 0.8623108, -0.3137387, 1, 1, 1, 1, 1,
0.6327974, -1.05028, 5.145616, 1, 1, 1, 1, 1,
0.6344898, -0.4932344, 2.222663, 1, 1, 1, 1, 1,
0.6369506, -0.1087743, 0.2531605, 1, 1, 1, 1, 1,
0.6386709, 0.6239956, 1.707094, 1, 1, 1, 1, 1,
0.6455846, 1.016259, 0.6419243, 1, 1, 1, 1, 1,
0.6466947, 1.292987, -0.03014649, 1, 1, 1, 1, 1,
0.6495462, 0.4010223, 3.03647, 1, 1, 1, 1, 1,
0.6568837, -0.1763924, 2.247226, 1, 1, 1, 1, 1,
0.6600438, -0.2627692, 1.475735, 1, 1, 1, 1, 1,
0.660755, 0.1108982, -0.6707301, 1, 1, 1, 1, 1,
0.6623591, -0.03659816, 3.535934, 1, 1, 1, 1, 1,
0.663455, -0.02143649, 1.514855, 1, 1, 1, 1, 1,
0.6636238, -1.614852, 1.199865, 1, 1, 1, 1, 1,
0.6663193, 0.006113459, 0.4952985, 1, 1, 1, 1, 1,
0.6678488, 0.3991792, 0.6522585, 0, 0, 1, 1, 1,
0.6687089, 1.347911, 1.873992, 1, 0, 0, 1, 1,
0.6697662, -1.266081, 1.660377, 1, 0, 0, 1, 1,
0.6731338, 0.08624847, 1.89318, 1, 0, 0, 1, 1,
0.6741605, 0.5020105, -0.2874781, 1, 0, 0, 1, 1,
0.6783666, 0.4080916, 1.233623, 1, 0, 0, 1, 1,
0.680977, 0.4013519, 0.8526193, 0, 0, 0, 1, 1,
0.683549, 1.544087, 1.368008, 0, 0, 0, 1, 1,
0.6869997, -0.8100557, 2.67539, 0, 0, 0, 1, 1,
0.6879727, -1.469062, 2.409428, 0, 0, 0, 1, 1,
0.6887336, 1.194604, 1.059475, 0, 0, 0, 1, 1,
0.6989951, 1.609363, 2.096006, 0, 0, 0, 1, 1,
0.712597, 1.099067, 2.991955, 0, 0, 0, 1, 1,
0.7182264, -0.4310203, 2.410447, 1, 1, 1, 1, 1,
0.7203495, 0.5773449, 0.8006135, 1, 1, 1, 1, 1,
0.7224559, -0.2400224, -0.3263812, 1, 1, 1, 1, 1,
0.7241754, -0.5383556, 3.162089, 1, 1, 1, 1, 1,
0.7271491, 2.350963, 0.8081892, 1, 1, 1, 1, 1,
0.7332023, -0.9201533, 3.670097, 1, 1, 1, 1, 1,
0.7336542, 0.02472488, 1.394052, 1, 1, 1, 1, 1,
0.7346315, 0.1482388, 2.758021, 1, 1, 1, 1, 1,
0.7388533, -0.009778298, 1.068934, 1, 1, 1, 1, 1,
0.7478421, -2.320637, 2.176829, 1, 1, 1, 1, 1,
0.7571365, -0.7351993, 2.224336, 1, 1, 1, 1, 1,
0.7577845, 0.4387155, 0.57068, 1, 1, 1, 1, 1,
0.7643632, -0.9404039, 3.951922, 1, 1, 1, 1, 1,
0.7666958, -0.09087819, 0.9269351, 1, 1, 1, 1, 1,
0.7707143, 0.4568702, 1.733698, 1, 1, 1, 1, 1,
0.7711995, 2.221316, 1.936418, 0, 0, 1, 1, 1,
0.775619, -1.00116, 2.880667, 1, 0, 0, 1, 1,
0.7861919, -0.8655851, 1.735076, 1, 0, 0, 1, 1,
0.7884317, 0.7480094, 0.1853182, 1, 0, 0, 1, 1,
0.7892678, 0.1334483, 0.7420523, 1, 0, 0, 1, 1,
0.7929069, -0.2599894, 0.5644442, 1, 0, 0, 1, 1,
0.7930135, 0.3207835, 0.8488809, 0, 0, 0, 1, 1,
0.7938979, 0.3160932, 0.5909312, 0, 0, 0, 1, 1,
0.7969793, 0.2116171, 0.8055744, 0, 0, 0, 1, 1,
0.7972879, -1.998383, 1.343421, 0, 0, 0, 1, 1,
0.7984524, -0.315133, 1.09557, 0, 0, 0, 1, 1,
0.8073972, 1.097741, -0.201326, 0, 0, 0, 1, 1,
0.8079187, 1.865656, 0.6945951, 0, 0, 0, 1, 1,
0.8113599, 0.4449375, 1.562548, 1, 1, 1, 1, 1,
0.8117279, 1.198283, -0.7927335, 1, 1, 1, 1, 1,
0.8141397, -0.242936, 1.194078, 1, 1, 1, 1, 1,
0.8212224, 0.2254239, 2.57734, 1, 1, 1, 1, 1,
0.8250561, 0.429224, 0.934576, 1, 1, 1, 1, 1,
0.8312626, 0.5993352, 1.241762, 1, 1, 1, 1, 1,
0.8321366, 0.5012249, 2.980223, 1, 1, 1, 1, 1,
0.8369504, -0.2994148, 1.904385, 1, 1, 1, 1, 1,
0.8408467, -0.2481746, 1.001092, 1, 1, 1, 1, 1,
0.8416173, 0.574872, 2.322591, 1, 1, 1, 1, 1,
0.8467779, 2.361392, -0.5016116, 1, 1, 1, 1, 1,
0.8524983, 0.4951448, 1.227803, 1, 1, 1, 1, 1,
0.8566145, 0.3634264, 2.519751, 1, 1, 1, 1, 1,
0.8589832, -0.5355092, 2.201444, 1, 1, 1, 1, 1,
0.8638373, 1.235207, -0.02648588, 1, 1, 1, 1, 1,
0.8721591, -0.4505604, 1.315404, 0, 0, 1, 1, 1,
0.8763704, 1.24754, 0.4611236, 1, 0, 0, 1, 1,
0.8825903, -0.5576802, 1.958354, 1, 0, 0, 1, 1,
0.8871638, 1.489062, 1.713655, 1, 0, 0, 1, 1,
0.8915033, -0.322461, 0.7968813, 1, 0, 0, 1, 1,
0.8926117, 0.0891602, 1.191005, 1, 0, 0, 1, 1,
0.8961878, -0.32608, 2.827533, 0, 0, 0, 1, 1,
0.8981497, -2.853393, 2.065714, 0, 0, 0, 1, 1,
0.8995961, 0.2237716, 0.649241, 0, 0, 0, 1, 1,
0.899676, 0.7723638, 1.984916, 0, 0, 0, 1, 1,
0.9016762, -0.2378114, 2.158346, 0, 0, 0, 1, 1,
0.9028052, 1.210689, -1.504942, 0, 0, 0, 1, 1,
0.9090697, -0.5005965, 3.141289, 0, 0, 0, 1, 1,
0.9190112, -0.9783602, 1.438782, 1, 1, 1, 1, 1,
0.9336612, -0.5295708, 2.656803, 1, 1, 1, 1, 1,
0.9461877, 1.175872, -0.3450209, 1, 1, 1, 1, 1,
0.9477885, -0.9924248, 1.118794, 1, 1, 1, 1, 1,
0.9491512, -0.322771, 2.27406, 1, 1, 1, 1, 1,
0.9532897, -1.930072, 2.089708, 1, 1, 1, 1, 1,
0.9555262, 0.8645825, 0.993315, 1, 1, 1, 1, 1,
0.957132, -0.3202142, 3.655531, 1, 1, 1, 1, 1,
0.9609535, -0.1544802, 2.543123, 1, 1, 1, 1, 1,
0.961395, -0.01505309, 1.413951, 1, 1, 1, 1, 1,
0.9614992, 0.02910828, 1.210624, 1, 1, 1, 1, 1,
0.9637612, 1.210833, -0.5698226, 1, 1, 1, 1, 1,
0.9721164, -1.129904, 2.370787, 1, 1, 1, 1, 1,
0.9732126, -1.378934, 2.504475, 1, 1, 1, 1, 1,
0.9854378, -1.910939, 3.240369, 1, 1, 1, 1, 1,
0.9915192, 0.8192651, 0.8068059, 0, 0, 1, 1, 1,
0.9918494, -0.1742833, 3.147992, 1, 0, 0, 1, 1,
0.996149, 0.8357772, -0.5714118, 1, 0, 0, 1, 1,
0.9977494, 0.4397319, 1.711101, 1, 0, 0, 1, 1,
1.000388, -1.086274, 1.781635, 1, 0, 0, 1, 1,
1.002362, -0.4512934, 2.714707, 1, 0, 0, 1, 1,
1.005141, 0.4063471, -0.1912452, 0, 0, 0, 1, 1,
1.009369, 0.5419949, 0.3050871, 0, 0, 0, 1, 1,
1.012267, -1.930482, 4.559681, 0, 0, 0, 1, 1,
1.015504, 0.9712426, 2.805076, 0, 0, 0, 1, 1,
1.029902, -0.2321455, 1.212807, 0, 0, 0, 1, 1,
1.033074, -0.7794443, 3.725734, 0, 0, 0, 1, 1,
1.037714, 0.438906, 1.359458, 0, 0, 0, 1, 1,
1.038257, 0.3563707, 2.446191, 1, 1, 1, 1, 1,
1.039396, 0.2608629, 0.7199716, 1, 1, 1, 1, 1,
1.041164, -0.1487759, 0.3343099, 1, 1, 1, 1, 1,
1.043613, 0.7038376, 2.055905, 1, 1, 1, 1, 1,
1.05195, -0.3742367, 2.740007, 1, 1, 1, 1, 1,
1.053943, -0.1633459, 1.768891, 1, 1, 1, 1, 1,
1.059775, 0.5447897, 2.078978, 1, 1, 1, 1, 1,
1.064557, 0.3004288, 2.759553, 1, 1, 1, 1, 1,
1.065693, -0.6898565, 2.765965, 1, 1, 1, 1, 1,
1.069547, 0.3504889, 1.698371, 1, 1, 1, 1, 1,
1.075164, 1.28856, 1.82926, 1, 1, 1, 1, 1,
1.085444, -0.6676952, 1.802455, 1, 1, 1, 1, 1,
1.089643, -2.01049, 2.400542, 1, 1, 1, 1, 1,
1.094285, 0.4160956, -0.403813, 1, 1, 1, 1, 1,
1.096452, -0.3468781, 1.933781, 1, 1, 1, 1, 1,
1.112764, -0.4614511, 3.327336, 0, 0, 1, 1, 1,
1.117766, 1.128077, 1.646366, 1, 0, 0, 1, 1,
1.118521, 1.557342, 0.2710518, 1, 0, 0, 1, 1,
1.121547, 0.1758277, 0.9667853, 1, 0, 0, 1, 1,
1.125909, 0.3968159, 0.1870203, 1, 0, 0, 1, 1,
1.132782, -0.6298025, 2.068537, 1, 0, 0, 1, 1,
1.134497, -0.6201069, 1.77699, 0, 0, 0, 1, 1,
1.137958, -0.5920922, 2.322285, 0, 0, 0, 1, 1,
1.141647, -0.7445294, 1.046982, 0, 0, 0, 1, 1,
1.142732, 0.1913077, 1.551661, 0, 0, 0, 1, 1,
1.14297, -0.1880397, 2.421469, 0, 0, 0, 1, 1,
1.147691, 0.4710663, 0.7218279, 0, 0, 0, 1, 1,
1.14954, -0.2693035, 0.6783118, 0, 0, 0, 1, 1,
1.154118, 0.4815665, -1.181736, 1, 1, 1, 1, 1,
1.157022, 1.820943, 3.902483, 1, 1, 1, 1, 1,
1.161156, 1.792423, 0.3428915, 1, 1, 1, 1, 1,
1.170656, -1.632029, 3.063323, 1, 1, 1, 1, 1,
1.172948, -1.200531, 3.090907, 1, 1, 1, 1, 1,
1.185062, -0.3865616, 1.611725, 1, 1, 1, 1, 1,
1.192383, 0.7292967, 0.9945472, 1, 1, 1, 1, 1,
1.193569, -1.010245, 3.562835, 1, 1, 1, 1, 1,
1.214264, -0.6438686, 1.258142, 1, 1, 1, 1, 1,
1.217317, 1.853471, 0.8118561, 1, 1, 1, 1, 1,
1.218127, -0.1707517, 1.606458, 1, 1, 1, 1, 1,
1.219681, -1.085013, 1.920391, 1, 1, 1, 1, 1,
1.225362, -1.145842, 2.943139, 1, 1, 1, 1, 1,
1.231012, 1.717886, 1.430198, 1, 1, 1, 1, 1,
1.2427, 1.292715, 2.468718, 1, 1, 1, 1, 1,
1.248084, 1.142629, 0.8185787, 0, 0, 1, 1, 1,
1.265197, 0.3025708, 0.1368296, 1, 0, 0, 1, 1,
1.271762, 0.5647212, 1.016542, 1, 0, 0, 1, 1,
1.272375, 0.8558336, 0.6086295, 1, 0, 0, 1, 1,
1.277564, 1.064279, -0.01312896, 1, 0, 0, 1, 1,
1.286727, 0.8852733, 0.2558994, 1, 0, 0, 1, 1,
1.297142, -2.030877, 2.518764, 0, 0, 0, 1, 1,
1.305096, 0.1006304, 1.121903, 0, 0, 0, 1, 1,
1.318242, 1.602659, -0.7657634, 0, 0, 0, 1, 1,
1.321607, -1.936895, 2.505781, 0, 0, 0, 1, 1,
1.329324, -0.6559988, 3.600763, 0, 0, 0, 1, 1,
1.332679, -2.771399, 2.233819, 0, 0, 0, 1, 1,
1.335608, 1.527764, -0.9678007, 0, 0, 0, 1, 1,
1.354008, -0.8329579, 2.650489, 1, 1, 1, 1, 1,
1.359404, -0.5512322, 1.10828, 1, 1, 1, 1, 1,
1.361718, 0.451143, 0.1395901, 1, 1, 1, 1, 1,
1.374467, -0.1009244, -0.2804251, 1, 1, 1, 1, 1,
1.375175, 0.1823448, 2.922698, 1, 1, 1, 1, 1,
1.382023, 1.713357, -1.583618, 1, 1, 1, 1, 1,
1.388007, -0.1343044, 2.361623, 1, 1, 1, 1, 1,
1.389298, -2.449773, 3.505978, 1, 1, 1, 1, 1,
1.409742, -1.457062, 3.750882, 1, 1, 1, 1, 1,
1.415246, 0.2238311, 2.297864, 1, 1, 1, 1, 1,
1.42766, -1.090058, 2.70987, 1, 1, 1, 1, 1,
1.44665, 1.144325, 1.111882, 1, 1, 1, 1, 1,
1.446802, -0.8762724, 0.8340403, 1, 1, 1, 1, 1,
1.451008, 1.06618, 2.112043, 1, 1, 1, 1, 1,
1.455137, 1.2234, -1.143194, 1, 1, 1, 1, 1,
1.474782, 1.39094, 0.3139119, 0, 0, 1, 1, 1,
1.478618, -0.6998587, 1.582645, 1, 0, 0, 1, 1,
1.484313, -0.6872495, 3.10616, 1, 0, 0, 1, 1,
1.48831, -0.1023589, 0.5281675, 1, 0, 0, 1, 1,
1.488596, -1.137278, 4.274343, 1, 0, 0, 1, 1,
1.491701, 1.026114, 0.6407617, 1, 0, 0, 1, 1,
1.495283, -1.543534, 1.734093, 0, 0, 0, 1, 1,
1.497318, -0.8788942, 1.953792, 0, 0, 0, 1, 1,
1.502609, 0.1197012, 2.575203, 0, 0, 0, 1, 1,
1.503246, -1.15914, 2.562597, 0, 0, 0, 1, 1,
1.510535, 1.1914, -1.454263, 0, 0, 0, 1, 1,
1.510804, -0.277606, 2.305815, 0, 0, 0, 1, 1,
1.515349, -0.1900373, 1.070875, 0, 0, 0, 1, 1,
1.523047, -0.177887, 0.1379363, 1, 1, 1, 1, 1,
1.523136, -0.126312, 5.514844, 1, 1, 1, 1, 1,
1.531187, -0.7596834, 1.942459, 1, 1, 1, 1, 1,
1.550859, -0.4635983, 1.374979, 1, 1, 1, 1, 1,
1.561942, -0.5188903, 1.598581, 1, 1, 1, 1, 1,
1.565165, -0.004570209, 1.768749, 1, 1, 1, 1, 1,
1.573594, 1.729674, 0.8697183, 1, 1, 1, 1, 1,
1.584852, 0.7053815, -0.6253709, 1, 1, 1, 1, 1,
1.595067, 1.388548, 1.229742, 1, 1, 1, 1, 1,
1.613465, -1.244891, 3.754132, 1, 1, 1, 1, 1,
1.621296, -0.25383, 2.448199, 1, 1, 1, 1, 1,
1.626909, -1.5766, 3.322846, 1, 1, 1, 1, 1,
1.655919, -1.629235, 2.832762, 1, 1, 1, 1, 1,
1.675097, 1.245477, 1.38278, 1, 1, 1, 1, 1,
1.685657, -0.2432646, 3.329407, 1, 1, 1, 1, 1,
1.687839, -0.4407555, 1.825649, 0, 0, 1, 1, 1,
1.7009, 1.391819, 1.360086, 1, 0, 0, 1, 1,
1.702089, 0.5755463, -0.1266829, 1, 0, 0, 1, 1,
1.73124, -0.4748361, 3.108165, 1, 0, 0, 1, 1,
1.733252, -0.3071533, 3.437788, 1, 0, 0, 1, 1,
1.745339, -0.6678064, 0.08912448, 1, 0, 0, 1, 1,
1.746718, -1.208364, 3.718731, 0, 0, 0, 1, 1,
1.793222, 1.267404, 0.03787723, 0, 0, 0, 1, 1,
1.798075, -2.427069, 0.1568048, 0, 0, 0, 1, 1,
1.811288, -0.3240602, 2.127009, 0, 0, 0, 1, 1,
1.835043, 0.443318, 0.1690491, 0, 0, 0, 1, 1,
1.848601, -1.532697, 2.009817, 0, 0, 0, 1, 1,
1.852473, 0.5446803, 0.6227604, 0, 0, 0, 1, 1,
1.857623, 0.08045665, 1.101999, 1, 1, 1, 1, 1,
1.860417, -0.04420907, 1.510315, 1, 1, 1, 1, 1,
1.860945, -0.629719, 1.17125, 1, 1, 1, 1, 1,
1.861558, 1.156449, 1.404616, 1, 1, 1, 1, 1,
1.872219, 2.0121, 1.748045, 1, 1, 1, 1, 1,
1.877612, 0.2244412, 0.5477777, 1, 1, 1, 1, 1,
1.882284, 0.3422664, 0.3348547, 1, 1, 1, 1, 1,
1.885159, -0.3806014, -0.2093214, 1, 1, 1, 1, 1,
1.925554, -0.6546686, 4.052806, 1, 1, 1, 1, 1,
1.938534, -1.673788, 2.294089, 1, 1, 1, 1, 1,
2.047321, 0.8621202, 1.616782, 1, 1, 1, 1, 1,
2.04792, 0.2563868, 2.442791, 1, 1, 1, 1, 1,
2.055626, -1.164656, 2.586521, 1, 1, 1, 1, 1,
2.078483, -0.638177, 1.328586, 1, 1, 1, 1, 1,
2.085909, -0.1601974, 2.50521, 1, 1, 1, 1, 1,
2.096604, -0.9466949, 2.067682, 0, 0, 1, 1, 1,
2.102692, 0.8218188, 2.744279, 1, 0, 0, 1, 1,
2.142722, -0.4094643, 3.129418, 1, 0, 0, 1, 1,
2.146431, -1.861669, 2.819093, 1, 0, 0, 1, 1,
2.251213, -0.4876268, 2.515505, 1, 0, 0, 1, 1,
2.261606, -1.596107, 1.76866, 1, 0, 0, 1, 1,
2.305693, 0.2526229, 2.112876, 0, 0, 0, 1, 1,
2.350565, -0.8724656, 0.8626828, 0, 0, 0, 1, 1,
2.371871, 0.4250796, 0.5808516, 0, 0, 0, 1, 1,
2.386759, 0.3269368, 0.9039776, 0, 0, 0, 1, 1,
2.409655, -0.2962306, 0.6889204, 0, 0, 0, 1, 1,
2.422238, -0.2393221, 2.152861, 0, 0, 0, 1, 1,
2.44678, 0.02691196, 0.5082006, 0, 0, 0, 1, 1,
2.485795, 3.277997, 3.078569, 1, 1, 1, 1, 1,
2.496653, -1.32174, 2.744514, 1, 1, 1, 1, 1,
2.602637, 1.144193, 1.727113, 1, 1, 1, 1, 1,
2.704998, -0.09298567, 2.170078, 1, 1, 1, 1, 1,
2.792353, 1.608138, 0.522112, 1, 1, 1, 1, 1,
3.107361, -0.2228784, 1.263171, 1, 1, 1, 1, 1,
3.566758, 1.933782, 0.6283455, 1, 1, 1, 1, 1
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
var radius = 10.10304;
var distance = 35.4865;
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
mvMatrix.translate( -0.2327182, -0.04738951, 0.2361898 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.4865);
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