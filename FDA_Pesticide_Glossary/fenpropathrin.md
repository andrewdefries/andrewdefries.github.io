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
-3.132763, 0.8398206, -2.108887, 1, 0, 0, 1,
-3.050793, 1.090208, 1.072548, 1, 0.007843138, 0, 1,
-2.874932, 0.4223936, -0.2204418, 1, 0.01176471, 0, 1,
-2.714526, 1.43924, -1.420386, 1, 0.01960784, 0, 1,
-2.641309, 0.8731304, -0.9386551, 1, 0.02352941, 0, 1,
-2.543866, -0.8594169, 0.2509556, 1, 0.03137255, 0, 1,
-2.414047, 0.6333108, -2.273869, 1, 0.03529412, 0, 1,
-2.369689, -1.258867, -2.013091, 1, 0.04313726, 0, 1,
-2.362862, 0.3681504, -1.831683, 1, 0.04705882, 0, 1,
-2.327406, 0.4048824, -3.105783, 1, 0.05490196, 0, 1,
-2.307061, -0.8698024, -0.9788364, 1, 0.05882353, 0, 1,
-2.277174, 1.317374, -2.034012, 1, 0.06666667, 0, 1,
-2.273044, -1.141293, -2.072399, 1, 0.07058824, 0, 1,
-2.215943, 0.5000499, -2.173779, 1, 0.07843138, 0, 1,
-2.206153, -0.144605, -2.347398, 1, 0.08235294, 0, 1,
-2.204651, 0.4089787, -1.620453, 1, 0.09019608, 0, 1,
-2.19965, 0.9772484, -1.416195, 1, 0.09411765, 0, 1,
-2.189616, -1.012733, -0.1217628, 1, 0.1019608, 0, 1,
-2.16206, 0.742137, -0.9086422, 1, 0.1098039, 0, 1,
-2.113879, 0.821195, -1.890315, 1, 0.1137255, 0, 1,
-2.104493, 1.024279, 0.3570881, 1, 0.1215686, 0, 1,
-2.104, -0.7822469, -2.357446, 1, 0.1254902, 0, 1,
-2.034269, -0.6218849, -3.102302, 1, 0.1333333, 0, 1,
-1.996641, 0.6079476, -1.728194, 1, 0.1372549, 0, 1,
-1.962147, -0.719477, -2.005574, 1, 0.145098, 0, 1,
-1.95311, 0.2192127, -2.596044, 1, 0.1490196, 0, 1,
-1.939039, -0.5401092, -3.467204, 1, 0.1568628, 0, 1,
-1.912946, 0.2703189, -1.309229, 1, 0.1607843, 0, 1,
-1.908469, -0.6630571, -3.760582, 1, 0.1686275, 0, 1,
-1.880784, 1.743687, -2.183453, 1, 0.172549, 0, 1,
-1.880185, 0.7546268, -2.570886, 1, 0.1803922, 0, 1,
-1.874602, -1.3951, -1.764913, 1, 0.1843137, 0, 1,
-1.867645, -0.7943643, -2.194684, 1, 0.1921569, 0, 1,
-1.863911, -0.1053215, -1.050726, 1, 0.1960784, 0, 1,
-1.863004, 0.282729, -0.1131921, 1, 0.2039216, 0, 1,
-1.849553, -1.780509, -2.728625, 1, 0.2117647, 0, 1,
-1.833775, 0.4889583, -1.847619, 1, 0.2156863, 0, 1,
-1.829725, 0.9042302, -1.346621, 1, 0.2235294, 0, 1,
-1.829017, 0.9896812, -0.4300814, 1, 0.227451, 0, 1,
-1.827578, -0.4517249, -1.786228, 1, 0.2352941, 0, 1,
-1.82213, -0.6108291, -2.190341, 1, 0.2392157, 0, 1,
-1.807355, -1.347413, -4.012638, 1, 0.2470588, 0, 1,
-1.790503, -1.764592, -2.529875, 1, 0.2509804, 0, 1,
-1.783777, -0.3675403, -1.996067, 1, 0.2588235, 0, 1,
-1.775291, 0.8729385, -1.511231, 1, 0.2627451, 0, 1,
-1.74257, 0.257638, -1.221935, 1, 0.2705882, 0, 1,
-1.736992, -0.6100258, -2.152714, 1, 0.2745098, 0, 1,
-1.734482, 0.09139052, 0.1486635, 1, 0.282353, 0, 1,
-1.7195, -0.2352454, -1.298021, 1, 0.2862745, 0, 1,
-1.691839, -0.2033541, -1.942357, 1, 0.2941177, 0, 1,
-1.680222, -0.6501146, -1.655095, 1, 0.3019608, 0, 1,
-1.653335, 0.3261676, -0.845481, 1, 0.3058824, 0, 1,
-1.6505, 0.1892629, -1.201196, 1, 0.3137255, 0, 1,
-1.631951, 0.3477436, -2.966542, 1, 0.3176471, 0, 1,
-1.631513, -1.141132, -1.581016, 1, 0.3254902, 0, 1,
-1.625671, -1.330537, -2.21162, 1, 0.3294118, 0, 1,
-1.61493, 1.886824, -1.509861, 1, 0.3372549, 0, 1,
-1.608158, 0.4023941, -1.302307, 1, 0.3411765, 0, 1,
-1.597498, 0.2072378, -0.3005121, 1, 0.3490196, 0, 1,
-1.575278, -1.28009, -2.801377, 1, 0.3529412, 0, 1,
-1.565307, -0.691955, -1.564118, 1, 0.3607843, 0, 1,
-1.550956, 0.188907, -3.216544, 1, 0.3647059, 0, 1,
-1.537857, 1.60501, -1.114245, 1, 0.372549, 0, 1,
-1.529697, 1.260111, -0.2472101, 1, 0.3764706, 0, 1,
-1.512381, 1.830835, -0.119115, 1, 0.3843137, 0, 1,
-1.506214, 1.369572, -0.1903955, 1, 0.3882353, 0, 1,
-1.496249, -0.04489304, -2.949898, 1, 0.3960784, 0, 1,
-1.47445, 2.090357, -0.2018328, 1, 0.4039216, 0, 1,
-1.473501, -1.524041, -0.9039595, 1, 0.4078431, 0, 1,
-1.470788, -1.144733, -1.80511, 1, 0.4156863, 0, 1,
-1.469901, -1.081043, -3.340136, 1, 0.4196078, 0, 1,
-1.460852, -0.6810775, -4.178541, 1, 0.427451, 0, 1,
-1.455037, -0.5430719, -2.678528, 1, 0.4313726, 0, 1,
-1.447271, 0.04626643, -2.424267, 1, 0.4392157, 0, 1,
-1.444189, -0.4881272, -0.3072944, 1, 0.4431373, 0, 1,
-1.437383, 0.4292993, -1.908851, 1, 0.4509804, 0, 1,
-1.436577, -0.4159012, -1.767201, 1, 0.454902, 0, 1,
-1.436159, -0.3894138, -2.056052, 1, 0.4627451, 0, 1,
-1.434478, 0.1738764, -0.3574796, 1, 0.4666667, 0, 1,
-1.413412, 0.3072036, -1.801267, 1, 0.4745098, 0, 1,
-1.405696, 0.6930315, -1.562128, 1, 0.4784314, 0, 1,
-1.402326, 1.988299, 1.022157, 1, 0.4862745, 0, 1,
-1.400183, 0.209103, -0.9287897, 1, 0.4901961, 0, 1,
-1.385841, -1.198895, -2.105276, 1, 0.4980392, 0, 1,
-1.365293, -1.744943, -2.283529, 1, 0.5058824, 0, 1,
-1.358651, -0.1836262, 0.1515873, 1, 0.509804, 0, 1,
-1.341765, -0.3736601, -2.299384, 1, 0.5176471, 0, 1,
-1.338977, -0.9431871, -3.054481, 1, 0.5215687, 0, 1,
-1.322171, -0.6592075, -2.181181, 1, 0.5294118, 0, 1,
-1.321995, 1.131433, 0.7215317, 1, 0.5333334, 0, 1,
-1.316825, -0.05298441, -0.6751201, 1, 0.5411765, 0, 1,
-1.315708, -0.3231689, -1.911183, 1, 0.5450981, 0, 1,
-1.312446, -1.201109, -1.420473, 1, 0.5529412, 0, 1,
-1.312065, 0.1225079, -1.251777, 1, 0.5568628, 0, 1,
-1.30755, -0.258303, -2.282494, 1, 0.5647059, 0, 1,
-1.303154, 0.6252574, 0.4239327, 1, 0.5686275, 0, 1,
-1.298104, -1.129099, -2.180914, 1, 0.5764706, 0, 1,
-1.297097, -0.2903467, -0.2816597, 1, 0.5803922, 0, 1,
-1.274502, -0.300648, -1.126074, 1, 0.5882353, 0, 1,
-1.272975, 1.279846, -1.237183, 1, 0.5921569, 0, 1,
-1.271594, -0.1892695, -2.040128, 1, 0.6, 0, 1,
-1.271379, 0.4891005, -0.7955406, 1, 0.6078432, 0, 1,
-1.258147, 1.052174, -1.04522, 1, 0.6117647, 0, 1,
-1.25314, -1.420536, -2.9833, 1, 0.6196079, 0, 1,
-1.238531, -0.2386232, -0.6718581, 1, 0.6235294, 0, 1,
-1.238056, 0.7552145, -0.3280827, 1, 0.6313726, 0, 1,
-1.237128, 0.6285545, -1.866466, 1, 0.6352941, 0, 1,
-1.236328, 0.6172988, -1.580076, 1, 0.6431373, 0, 1,
-1.235025, -0.000217112, -1.595444, 1, 0.6470588, 0, 1,
-1.231297, 0.4621114, -0.9618438, 1, 0.654902, 0, 1,
-1.229475, -1.176066, -1.356893, 1, 0.6588235, 0, 1,
-1.221582, -0.7091769, -1.301922, 1, 0.6666667, 0, 1,
-1.218558, 0.3765853, -1.502431, 1, 0.6705883, 0, 1,
-1.218464, 0.05959186, -3.006368, 1, 0.6784314, 0, 1,
-1.20949, -0.06520312, -1.673245, 1, 0.682353, 0, 1,
-1.204613, 1.462068, -1.467898, 1, 0.6901961, 0, 1,
-1.20227, -1.726631, -2.173024, 1, 0.6941177, 0, 1,
-1.202032, -2.380089, -2.763495, 1, 0.7019608, 0, 1,
-1.199011, -0.172594, -0.5446945, 1, 0.7098039, 0, 1,
-1.197614, -0.1166175, -0.2895173, 1, 0.7137255, 0, 1,
-1.193628, -0.7177567, -2.551, 1, 0.7215686, 0, 1,
-1.190941, 1.855153, 0.6621234, 1, 0.7254902, 0, 1,
-1.18505, 2.023133, -0.5389161, 1, 0.7333333, 0, 1,
-1.179373, 1.666675, -0.1135348, 1, 0.7372549, 0, 1,
-1.172023, 0.255705, -1.8725, 1, 0.7450981, 0, 1,
-1.17123, 0.6254422, -1.49106, 1, 0.7490196, 0, 1,
-1.163344, 1.963693, -0.8610839, 1, 0.7568628, 0, 1,
-1.152428, 0.8929292, -1.204357, 1, 0.7607843, 0, 1,
-1.150368, 0.880733, -1.813214, 1, 0.7686275, 0, 1,
-1.149374, -0.6790105, -2.322817, 1, 0.772549, 0, 1,
-1.145748, 0.312315, -1.903196, 1, 0.7803922, 0, 1,
-1.135954, 1.685962, 0.7272764, 1, 0.7843137, 0, 1,
-1.135675, -0.9300141, -1.453835, 1, 0.7921569, 0, 1,
-1.132778, 1.107166, 0.3763429, 1, 0.7960784, 0, 1,
-1.127688, -1.225078, -3.236648, 1, 0.8039216, 0, 1,
-1.124432, -0.5738646, -1.597813, 1, 0.8117647, 0, 1,
-1.113547, 0.8640116, -0.1913234, 1, 0.8156863, 0, 1,
-1.110725, -0.9261912, -2.111257, 1, 0.8235294, 0, 1,
-1.107154, -0.4524304, -3.636341, 1, 0.827451, 0, 1,
-1.102121, 1.581991, 0.00628614, 1, 0.8352941, 0, 1,
-1.100951, -0.6092131, -3.466198, 1, 0.8392157, 0, 1,
-1.09248, 0.3264369, -1.569404, 1, 0.8470588, 0, 1,
-1.074533, -0.08437142, -2.97932, 1, 0.8509804, 0, 1,
-1.064154, 1.51619, -4.615075, 1, 0.8588235, 0, 1,
-1.058654, 0.8006573, -2.860818, 1, 0.8627451, 0, 1,
-1.055579, 0.4707293, -1.075963, 1, 0.8705882, 0, 1,
-1.055316, 0.6621683, -1.417345, 1, 0.8745098, 0, 1,
-1.052316, 0.3477555, 1.081901, 1, 0.8823529, 0, 1,
-1.047385, 0.3086076, -0.9189004, 1, 0.8862745, 0, 1,
-1.043976, -0.3948526, -1.317782, 1, 0.8941177, 0, 1,
-1.040804, 0.8619977, 0.4191608, 1, 0.8980392, 0, 1,
-1.038327, -1.661233, -1.825346, 1, 0.9058824, 0, 1,
-1.032735, -0.9932044, -2.338737, 1, 0.9137255, 0, 1,
-1.032415, -1.742866, -2.56966, 1, 0.9176471, 0, 1,
-1.027023, -1.271971, -1.131644, 1, 0.9254902, 0, 1,
-1.024486, 0.2578018, -1.100306, 1, 0.9294118, 0, 1,
-1.014874, -2.243192, -3.291166, 1, 0.9372549, 0, 1,
-0.9966177, -0.8574459, -3.45618, 1, 0.9411765, 0, 1,
-0.9953755, 1.228587, -0.9006547, 1, 0.9490196, 0, 1,
-0.9939563, -0.7792983, -2.779651, 1, 0.9529412, 0, 1,
-0.9870905, -1.576158, -1.930926, 1, 0.9607843, 0, 1,
-0.9804936, 0.536139, -1.861825, 1, 0.9647059, 0, 1,
-0.9781263, 1.049929, -2.205638, 1, 0.972549, 0, 1,
-0.9589628, -0.320201, -1.274464, 1, 0.9764706, 0, 1,
-0.955312, 0.95112, -1.040442, 1, 0.9843137, 0, 1,
-0.9389495, 0.1969286, 0.2533177, 1, 0.9882353, 0, 1,
-0.9296922, 0.1114071, -3.080552, 1, 0.9960784, 0, 1,
-0.9291698, -0.2879161, -2.283246, 0.9960784, 1, 0, 1,
-0.9225224, 0.1324288, -1.65483, 0.9921569, 1, 0, 1,
-0.9206653, -3.152406, -3.579518, 0.9843137, 1, 0, 1,
-0.9198422, -0.3323936, -2.178118, 0.9803922, 1, 0, 1,
-0.9190368, 1.503005, -0.7451241, 0.972549, 1, 0, 1,
-0.9174758, 1.382856, -0.09215675, 0.9686275, 1, 0, 1,
-0.9173509, 0.5441195, 0.5063158, 0.9607843, 1, 0, 1,
-0.9173483, 0.7974832, -1.319988, 0.9568627, 1, 0, 1,
-0.9144972, -0.1651417, -1.95421, 0.9490196, 1, 0, 1,
-0.9025654, 0.5333643, -0.4398086, 0.945098, 1, 0, 1,
-0.9021259, 0.2860034, -1.803478, 0.9372549, 1, 0, 1,
-0.8940763, -0.06866376, -2.071866, 0.9333333, 1, 0, 1,
-0.8937009, -0.6589942, -2.132332, 0.9254902, 1, 0, 1,
-0.8913969, -0.2295283, -2.012708, 0.9215686, 1, 0, 1,
-0.8852199, 0.2110873, -1.135132, 0.9137255, 1, 0, 1,
-0.8840891, -0.9737434, -1.2548, 0.9098039, 1, 0, 1,
-0.8817575, 1.127555, -0.9984066, 0.9019608, 1, 0, 1,
-0.8786716, -0.7697248, -3.222898, 0.8941177, 1, 0, 1,
-0.876175, 0.1151095, -2.152545, 0.8901961, 1, 0, 1,
-0.8742673, 2.302821, -1.023974, 0.8823529, 1, 0, 1,
-0.8710886, -0.2414391, -0.9854974, 0.8784314, 1, 0, 1,
-0.8643617, -1.625956, -2.886469, 0.8705882, 1, 0, 1,
-0.8629289, -0.8693116, -3.271606, 0.8666667, 1, 0, 1,
-0.8621119, -0.6382285, -2.714186, 0.8588235, 1, 0, 1,
-0.861586, 1.311667, 0.1651626, 0.854902, 1, 0, 1,
-0.8567727, -2.430005, -2.015448, 0.8470588, 1, 0, 1,
-0.854121, 0.81104, 1.579883, 0.8431373, 1, 0, 1,
-0.8539528, -0.251962, -2.802416, 0.8352941, 1, 0, 1,
-0.8455231, 0.08361331, -1.634257, 0.8313726, 1, 0, 1,
-0.8417383, -0.2205641, -2.216513, 0.8235294, 1, 0, 1,
-0.8404921, -1.081339, -4.852657, 0.8196079, 1, 0, 1,
-0.8402225, -0.5187102, -3.133971, 0.8117647, 1, 0, 1,
-0.8384908, 0.58161, 0.366132, 0.8078431, 1, 0, 1,
-0.8367623, 1.954827, -1.797501, 0.8, 1, 0, 1,
-0.8333421, -0.1617667, -1.375924, 0.7921569, 1, 0, 1,
-0.8292302, -0.01445876, -1.727832, 0.7882353, 1, 0, 1,
-0.8290967, 0.2305234, -0.9722319, 0.7803922, 1, 0, 1,
-0.8275911, -1.4087, -2.157637, 0.7764706, 1, 0, 1,
-0.8270703, -0.03374646, -0.4356314, 0.7686275, 1, 0, 1,
-0.8266461, -2.501127, -1.579684, 0.7647059, 1, 0, 1,
-0.8252078, 0.276265, -2.881223, 0.7568628, 1, 0, 1,
-0.821477, 0.5970967, -2.009315, 0.7529412, 1, 0, 1,
-0.8178136, -0.1283006, -2.270735, 0.7450981, 1, 0, 1,
-0.8171037, -0.4889022, -1.21299, 0.7411765, 1, 0, 1,
-0.813522, -0.06205816, -2.231456, 0.7333333, 1, 0, 1,
-0.8120845, 2.639453, 2.648718, 0.7294118, 1, 0, 1,
-0.8112784, 0.1367686, -0.9062855, 0.7215686, 1, 0, 1,
-0.8089881, -0.9291054, -1.978961, 0.7176471, 1, 0, 1,
-0.8037316, -0.9734599, -3.05085, 0.7098039, 1, 0, 1,
-0.7956854, 0.8268718, -1.010212, 0.7058824, 1, 0, 1,
-0.7905506, -0.4355415, -3.125705, 0.6980392, 1, 0, 1,
-0.7846909, -1.321627, -2.713405, 0.6901961, 1, 0, 1,
-0.7833616, -2.380581, -3.505725, 0.6862745, 1, 0, 1,
-0.7815879, -1.597616, -1.641476, 0.6784314, 1, 0, 1,
-0.7799829, -0.6631874, -1.568652, 0.6745098, 1, 0, 1,
-0.775517, 0.14777, -2.582618, 0.6666667, 1, 0, 1,
-0.7730756, 0.1509829, 0.8785127, 0.6627451, 1, 0, 1,
-0.7709538, 1.215057, -2.072872, 0.654902, 1, 0, 1,
-0.7666969, 1.166332, -2.240684, 0.6509804, 1, 0, 1,
-0.7662507, 0.7978228, -0.8745986, 0.6431373, 1, 0, 1,
-0.7655737, -1.273203, -2.425372, 0.6392157, 1, 0, 1,
-0.7576725, -0.3100318, -2.503314, 0.6313726, 1, 0, 1,
-0.7540714, 1.040979, -0.6658799, 0.627451, 1, 0, 1,
-0.7483338, 0.2015147, -1.197433, 0.6196079, 1, 0, 1,
-0.7469273, -0.9910929, -1.78464, 0.6156863, 1, 0, 1,
-0.7452941, 0.7510952, -0.282076, 0.6078432, 1, 0, 1,
-0.7442567, 0.09724642, -0.5982582, 0.6039216, 1, 0, 1,
-0.7417713, -0.2776351, -0.1856725, 0.5960785, 1, 0, 1,
-0.7306983, -0.2411683, -2.463101, 0.5882353, 1, 0, 1,
-0.7302794, 1.207649, -1.009543, 0.5843138, 1, 0, 1,
-0.7269121, 1.315924, -0.9653971, 0.5764706, 1, 0, 1,
-0.7247003, 1.17044, 0.5700622, 0.572549, 1, 0, 1,
-0.7235644, -1.579527, -1.0429, 0.5647059, 1, 0, 1,
-0.7227699, -1.783308, -3.458704, 0.5607843, 1, 0, 1,
-0.7204102, -0.961082, -3.056422, 0.5529412, 1, 0, 1,
-0.7179508, 0.6738271, 0.314663, 0.5490196, 1, 0, 1,
-0.7169251, -0.7912652, -3.161487, 0.5411765, 1, 0, 1,
-0.7089635, -0.8384287, -2.152836, 0.5372549, 1, 0, 1,
-0.7079241, 1.244199, -0.4192034, 0.5294118, 1, 0, 1,
-0.7057827, -0.3885852, -0.694349, 0.5254902, 1, 0, 1,
-0.7056733, 1.179951, -1.600743, 0.5176471, 1, 0, 1,
-0.7030712, 0.03655395, -2.20736, 0.5137255, 1, 0, 1,
-0.7023478, 0.5847368, 0.5760975, 0.5058824, 1, 0, 1,
-0.7014766, 0.4773517, -2.020234, 0.5019608, 1, 0, 1,
-0.6997334, 0.4427365, -0.4066931, 0.4941176, 1, 0, 1,
-0.6919194, -0.8116649, -2.467983, 0.4862745, 1, 0, 1,
-0.6852722, 0.6556799, -1.102905, 0.4823529, 1, 0, 1,
-0.6754889, 0.5943822, -2.629064, 0.4745098, 1, 0, 1,
-0.6737332, 0.1912833, 0.9827428, 0.4705882, 1, 0, 1,
-0.6709412, 0.4289891, -0.8951574, 0.4627451, 1, 0, 1,
-0.6689504, -1.204502, -2.003708, 0.4588235, 1, 0, 1,
-0.6651238, 0.02364791, -0.8009952, 0.4509804, 1, 0, 1,
-0.6518382, 0.6018236, -0.41946, 0.4470588, 1, 0, 1,
-0.6491386, -0.7889172, -1.617245, 0.4392157, 1, 0, 1,
-0.6458726, 0.7793639, 0.5473228, 0.4352941, 1, 0, 1,
-0.6380476, -0.7188169, -2.587788, 0.427451, 1, 0, 1,
-0.6337588, 0.0410947, -3.020481, 0.4235294, 1, 0, 1,
-0.6322274, 0.648471, -0.5298305, 0.4156863, 1, 0, 1,
-0.623478, -0.2033808, -2.122787, 0.4117647, 1, 0, 1,
-0.6211103, 0.9841539, -1.508207, 0.4039216, 1, 0, 1,
-0.6210834, 1.122156, -0.6891195, 0.3960784, 1, 0, 1,
-0.6194982, 0.7050495, -1.276412, 0.3921569, 1, 0, 1,
-0.6172155, -0.8250753, -1.562143, 0.3843137, 1, 0, 1,
-0.6163135, 0.6579916, -3.824513, 0.3803922, 1, 0, 1,
-0.615585, -0.6400388, -3.102834, 0.372549, 1, 0, 1,
-0.6146114, 0.5574104, -0.4136073, 0.3686275, 1, 0, 1,
-0.6078408, 0.6314056, -0.6419802, 0.3607843, 1, 0, 1,
-0.6073839, -0.9744456, -2.88643, 0.3568628, 1, 0, 1,
-0.6073387, -0.9499378, -3.77798, 0.3490196, 1, 0, 1,
-0.6048658, -1.655125, -1.955465, 0.345098, 1, 0, 1,
-0.6010079, 2.187313, 1.283998, 0.3372549, 1, 0, 1,
-0.5955884, -1.29586, -0.9688854, 0.3333333, 1, 0, 1,
-0.5938026, 0.5771492, -1.324275, 0.3254902, 1, 0, 1,
-0.5930812, 2.273905, 0.2104343, 0.3215686, 1, 0, 1,
-0.5829644, 0.4863435, 1.203708, 0.3137255, 1, 0, 1,
-0.581194, 0.4398079, -0.3942118, 0.3098039, 1, 0, 1,
-0.579795, -0.3418882, -0.4728826, 0.3019608, 1, 0, 1,
-0.5783113, -0.08899806, -3.624526, 0.2941177, 1, 0, 1,
-0.5684083, -0.4044584, -1.926615, 0.2901961, 1, 0, 1,
-0.5651081, 1.663403, -0.7466164, 0.282353, 1, 0, 1,
-0.5587885, 0.3050004, -1.629211, 0.2784314, 1, 0, 1,
-0.5563704, 0.2929233, -1.756047, 0.2705882, 1, 0, 1,
-0.5527679, 0.3657268, -0.3877421, 0.2666667, 1, 0, 1,
-0.5483925, -0.4389963, -1.555061, 0.2588235, 1, 0, 1,
-0.5428374, -0.4494155, -2.91324, 0.254902, 1, 0, 1,
-0.5410409, 0.2354068, -2.789037, 0.2470588, 1, 0, 1,
-0.5325178, 2.619096, 0.2542161, 0.2431373, 1, 0, 1,
-0.5236537, -0.2194107, -1.507337, 0.2352941, 1, 0, 1,
-0.5211706, -0.5244109, -1.516573, 0.2313726, 1, 0, 1,
-0.5193137, -0.9607831, -2.634045, 0.2235294, 1, 0, 1,
-0.5178733, 0.7947091, 0.03228243, 0.2196078, 1, 0, 1,
-0.5146269, -0.9027577, -2.678612, 0.2117647, 1, 0, 1,
-0.5109385, -0.7959962, -2.838931, 0.2078431, 1, 0, 1,
-0.5080433, -0.9597258, -1.384773, 0.2, 1, 0, 1,
-0.5054922, -0.5071416, -1.519974, 0.1921569, 1, 0, 1,
-0.5053065, 0.4768038, -2.293291, 0.1882353, 1, 0, 1,
-0.5043472, 0.5717522, -1.841459, 0.1803922, 1, 0, 1,
-0.4998957, -1.250308, -1.919803, 0.1764706, 1, 0, 1,
-0.4965243, -0.580368, -1.457594, 0.1686275, 1, 0, 1,
-0.4939264, 1.366336, -0.3440551, 0.1647059, 1, 0, 1,
-0.4927856, -0.2101424, -0.9497587, 0.1568628, 1, 0, 1,
-0.4917131, -0.5936048, -1.442454, 0.1529412, 1, 0, 1,
-0.4765085, -2.066126, -3.572376, 0.145098, 1, 0, 1,
-0.4756084, -0.521213, -1.930309, 0.1411765, 1, 0, 1,
-0.4745648, -1.411127, -3.646174, 0.1333333, 1, 0, 1,
-0.47114, -0.003718218, -1.989325, 0.1294118, 1, 0, 1,
-0.4693531, 0.2825847, -1.929309, 0.1215686, 1, 0, 1,
-0.4689616, 0.2842665, -1.583885, 0.1176471, 1, 0, 1,
-0.4650304, 2.813499, 0.8636391, 0.1098039, 1, 0, 1,
-0.4624302, -0.7087619, -1.936538, 0.1058824, 1, 0, 1,
-0.4619619, -0.837051, -4.023985, 0.09803922, 1, 0, 1,
-0.4605713, 0.3825053, -1.200881, 0.09019608, 1, 0, 1,
-0.4601736, -1.229517, -2.856256, 0.08627451, 1, 0, 1,
-0.4600036, 0.8557257, -0.8042519, 0.07843138, 1, 0, 1,
-0.4586304, 1.795785, -0.2788436, 0.07450981, 1, 0, 1,
-0.4417384, -2.021781, -3.032781, 0.06666667, 1, 0, 1,
-0.4414646, -0.7755743, -2.772298, 0.0627451, 1, 0, 1,
-0.4410822, -1.297477, -2.510951, 0.05490196, 1, 0, 1,
-0.4364699, -1.221993, -5.101501, 0.05098039, 1, 0, 1,
-0.4343881, -1.253476, -2.152726, 0.04313726, 1, 0, 1,
-0.4211165, 0.4856767, -0.3154703, 0.03921569, 1, 0, 1,
-0.4202306, -0.6017259, -2.744499, 0.03137255, 1, 0, 1,
-0.4160195, 0.5130436, -1.993169, 0.02745098, 1, 0, 1,
-0.4122119, -0.1388232, -2.801377, 0.01960784, 1, 0, 1,
-0.4121938, 0.04369603, -2.470647, 0.01568628, 1, 0, 1,
-0.4110972, -1.260229, -3.382918, 0.007843138, 1, 0, 1,
-0.4106845, 0.2548521, -0.8743578, 0.003921569, 1, 0, 1,
-0.4087138, -1.719725, -2.944452, 0, 1, 0.003921569, 1,
-0.4076596, -1.561194, -4.936469, 0, 1, 0.01176471, 1,
-0.404299, 0.4294889, -1.045264, 0, 1, 0.01568628, 1,
-0.40389, -0.3692095, -1.247838, 0, 1, 0.02352941, 1,
-0.402506, 0.1838275, -2.619945, 0, 1, 0.02745098, 1,
-0.4016201, 0.0491814, 0.0362263, 0, 1, 0.03529412, 1,
-0.4012457, 0.300212, 0.6202781, 0, 1, 0.03921569, 1,
-0.3989665, 0.0969099, -1.566637, 0, 1, 0.04705882, 1,
-0.3980658, 1.591733, -0.1540988, 0, 1, 0.05098039, 1,
-0.3924565, -0.4753831, -1.199563, 0, 1, 0.05882353, 1,
-0.3849997, 0.6560119, 0.2231481, 0, 1, 0.0627451, 1,
-0.3829803, 1.337659, 1.471914, 0, 1, 0.07058824, 1,
-0.3813407, 2.297712, 1.893196, 0, 1, 0.07450981, 1,
-0.3806292, 0.02645671, -1.790408, 0, 1, 0.08235294, 1,
-0.379294, -2.613992, -3.641322, 0, 1, 0.08627451, 1,
-0.3763262, -0.1788553, -2.035277, 0, 1, 0.09411765, 1,
-0.3727292, 1.470472, 0.6390736, 0, 1, 0.1019608, 1,
-0.3724728, -0.230073, -0.8431386, 0, 1, 0.1058824, 1,
-0.3707723, -0.8408047, -2.654545, 0, 1, 0.1137255, 1,
-0.3650301, -0.5177178, -2.125608, 0, 1, 0.1176471, 1,
-0.3618233, -0.9015641, -3.11935, 0, 1, 0.1254902, 1,
-0.3613839, 1.49334, 0.6173705, 0, 1, 0.1294118, 1,
-0.3526954, 1.079877, -0.3865539, 0, 1, 0.1372549, 1,
-0.3474978, 0.208072, -0.08386641, 0, 1, 0.1411765, 1,
-0.3454185, -0.4032061, -2.221914, 0, 1, 0.1490196, 1,
-0.343996, -0.7978323, -1.972349, 0, 1, 0.1529412, 1,
-0.3388076, 1.599371, -0.3702449, 0, 1, 0.1607843, 1,
-0.3357508, -0.9588145, -2.795863, 0, 1, 0.1647059, 1,
-0.3334615, -0.9615588, -3.657317, 0, 1, 0.172549, 1,
-0.3292643, -1.108135, -3.459726, 0, 1, 0.1764706, 1,
-0.3282716, -0.6270195, -3.47651, 0, 1, 0.1843137, 1,
-0.3215636, -0.4584854, -0.8501343, 0, 1, 0.1882353, 1,
-0.3187058, -0.2443035, -1.289092, 0, 1, 0.1960784, 1,
-0.3166688, -0.9462843, -1.908985, 0, 1, 0.2039216, 1,
-0.3142169, -2.908447, -4.333243, 0, 1, 0.2078431, 1,
-0.3082129, -0.1696472, -1.772401, 0, 1, 0.2156863, 1,
-0.3067704, -0.003682214, -1.905169, 0, 1, 0.2196078, 1,
-0.3046411, -1.55005, -4.571282, 0, 1, 0.227451, 1,
-0.3012234, -1.563589, -2.830647, 0, 1, 0.2313726, 1,
-0.2990343, -0.4801835, -2.709266, 0, 1, 0.2392157, 1,
-0.2960445, 0.4748721, -0.2925099, 0, 1, 0.2431373, 1,
-0.2954803, 1.912905, -0.1830405, 0, 1, 0.2509804, 1,
-0.2899516, -0.03721561, -0.8381804, 0, 1, 0.254902, 1,
-0.2894403, 1.05325, -0.3981787, 0, 1, 0.2627451, 1,
-0.2872568, -0.7151858, -2.162283, 0, 1, 0.2666667, 1,
-0.2810597, -0.2301763, -2.024076, 0, 1, 0.2745098, 1,
-0.2806413, -0.01199193, -2.021124, 0, 1, 0.2784314, 1,
-0.2799886, 0.2936017, 0.3755945, 0, 1, 0.2862745, 1,
-0.2788483, -0.6982116, -0.8005366, 0, 1, 0.2901961, 1,
-0.2783138, 0.4147579, 0.7127381, 0, 1, 0.2980392, 1,
-0.2778879, 0.09332241, -0.8564673, 0, 1, 0.3058824, 1,
-0.2775339, -2.489066, -3.04086, 0, 1, 0.3098039, 1,
-0.2762569, 0.496176, -0.5861358, 0, 1, 0.3176471, 1,
-0.2752952, -0.2089038, -1.933819, 0, 1, 0.3215686, 1,
-0.2744986, -1.535754, -3.648347, 0, 1, 0.3294118, 1,
-0.2717468, -1.40503, -3.333957, 0, 1, 0.3333333, 1,
-0.2699422, -0.5261063, -1.774055, 0, 1, 0.3411765, 1,
-0.266653, 1.244801, 0.3267924, 0, 1, 0.345098, 1,
-0.2643105, -0.3070713, -2.769813, 0, 1, 0.3529412, 1,
-0.2639402, 0.2270719, -0.8090224, 0, 1, 0.3568628, 1,
-0.2633766, 0.6638901, 0.7634213, 0, 1, 0.3647059, 1,
-0.2595957, 0.4031243, -0.3045036, 0, 1, 0.3686275, 1,
-0.2586897, -0.5735604, -3.912871, 0, 1, 0.3764706, 1,
-0.2572013, -1.152771, -2.838236, 0, 1, 0.3803922, 1,
-0.2552365, -0.006923565, -3.687113, 0, 1, 0.3882353, 1,
-0.253612, -0.144013, -2.349404, 0, 1, 0.3921569, 1,
-0.2510236, -0.003122441, -4.404216, 0, 1, 0.4, 1,
-0.251014, -0.4842992, -2.092623, 0, 1, 0.4078431, 1,
-0.2497719, -1.397424, -3.338595, 0, 1, 0.4117647, 1,
-0.2494421, 0.3122748, -0.5173976, 0, 1, 0.4196078, 1,
-0.2428814, 2.303947, 0.2114614, 0, 1, 0.4235294, 1,
-0.242491, -0.207662, -3.220687, 0, 1, 0.4313726, 1,
-0.2402162, -1.465129, -3.112312, 0, 1, 0.4352941, 1,
-0.2368972, -1.028427, -3.27525, 0, 1, 0.4431373, 1,
-0.2345488, -0.5829655, -1.623129, 0, 1, 0.4470588, 1,
-0.2324624, 0.6366069, 1.139316, 0, 1, 0.454902, 1,
-0.2324611, 1.370311, 0.6194005, 0, 1, 0.4588235, 1,
-0.2303955, -0.426466, -1.044653, 0, 1, 0.4666667, 1,
-0.2268288, 0.2042033, -0.7311147, 0, 1, 0.4705882, 1,
-0.216689, -0.2599913, -4.588321, 0, 1, 0.4784314, 1,
-0.2164493, 0.8250476, -0.6693073, 0, 1, 0.4823529, 1,
-0.2139167, 1.139688, -0.7609962, 0, 1, 0.4901961, 1,
-0.2099328, 0.1694451, -2.368508, 0, 1, 0.4941176, 1,
-0.2074669, 1.303992, 0.6402747, 0, 1, 0.5019608, 1,
-0.2044834, 0.2307269, -0.6602266, 0, 1, 0.509804, 1,
-0.1983929, -0.697408, -2.455284, 0, 1, 0.5137255, 1,
-0.1928989, -0.0913271, -1.852595, 0, 1, 0.5215687, 1,
-0.1927039, 1.070006, 1.240996, 0, 1, 0.5254902, 1,
-0.1906079, 1.07941, -0.8083041, 0, 1, 0.5333334, 1,
-0.1895435, 0.2659579, -0.9635511, 0, 1, 0.5372549, 1,
-0.1885185, -0.5216043, -2.823056, 0, 1, 0.5450981, 1,
-0.1776525, 1.169705, -0.2540831, 0, 1, 0.5490196, 1,
-0.175065, -0.997363, -2.940789, 0, 1, 0.5568628, 1,
-0.1735231, -1.571361, -3.805885, 0, 1, 0.5607843, 1,
-0.1733398, -0.1110553, -1.909374, 0, 1, 0.5686275, 1,
-0.1714984, 1.259173, 0.6214548, 0, 1, 0.572549, 1,
-0.170273, -0.3783353, -2.371725, 0, 1, 0.5803922, 1,
-0.1698675, -1.306224, -3.840896, 0, 1, 0.5843138, 1,
-0.1695411, -1.165352, -3.206126, 0, 1, 0.5921569, 1,
-0.1659967, 1.620877, 0.5345047, 0, 1, 0.5960785, 1,
-0.1640173, 1.043974, 0.9326752, 0, 1, 0.6039216, 1,
-0.1608077, 1.808383, -0.6557654, 0, 1, 0.6117647, 1,
-0.1582605, 0.182245, -2.039733, 0, 1, 0.6156863, 1,
-0.1573989, -0.7504796, -1.747163, 0, 1, 0.6235294, 1,
-0.1500386, 0.6979105, 1.050528, 0, 1, 0.627451, 1,
-0.1485307, 0.144001, 0.2116183, 0, 1, 0.6352941, 1,
-0.1480041, -0.39632, -1.886623, 0, 1, 0.6392157, 1,
-0.1463008, -1.198165, -2.14237, 0, 1, 0.6470588, 1,
-0.1454738, 0.6509703, -1.622105, 0, 1, 0.6509804, 1,
-0.1450822, 2.093355, 1.43874, 0, 1, 0.6588235, 1,
-0.1427635, 0.7839528, -0.7686542, 0, 1, 0.6627451, 1,
-0.1418145, 0.6487425, 0.8810956, 0, 1, 0.6705883, 1,
-0.1400967, 1.894526, 0.1042375, 0, 1, 0.6745098, 1,
-0.1400669, 0.6866397, -1.324059, 0, 1, 0.682353, 1,
-0.1400006, 1.840927, -0.1679098, 0, 1, 0.6862745, 1,
-0.1375386, 0.004325613, -3.400898, 0, 1, 0.6941177, 1,
-0.1334537, -0.7884797, -3.472001, 0, 1, 0.7019608, 1,
-0.1316828, -0.5911105, -2.813477, 0, 1, 0.7058824, 1,
-0.1300849, 0.8677061, 0.3868243, 0, 1, 0.7137255, 1,
-0.1270819, -2.631675, -1.813408, 0, 1, 0.7176471, 1,
-0.1240502, -0.7892023, -3.286356, 0, 1, 0.7254902, 1,
-0.1224011, -0.8199841, -1.231978, 0, 1, 0.7294118, 1,
-0.1218016, 0.2251266, -0.7566909, 0, 1, 0.7372549, 1,
-0.1199417, -0.9413958, -3.706394, 0, 1, 0.7411765, 1,
-0.1196921, -0.2284658, -0.6536425, 0, 1, 0.7490196, 1,
-0.1115763, 0.02249279, -1.162231, 0, 1, 0.7529412, 1,
-0.1099771, -1.027749, -1.801004, 0, 1, 0.7607843, 1,
-0.1087529, 0.4633538, -0.8490729, 0, 1, 0.7647059, 1,
-0.1069356, 0.6229143, -0.5885898, 0, 1, 0.772549, 1,
-0.1057053, -0.4278661, -3.60235, 0, 1, 0.7764706, 1,
-0.1001105, 1.273286, -1.859466, 0, 1, 0.7843137, 1,
-0.09794238, 1.304009, -0.7776462, 0, 1, 0.7882353, 1,
-0.09788582, -1.11582, -3.154034, 0, 1, 0.7960784, 1,
-0.09488327, -0.4036917, -4.420222, 0, 1, 0.8039216, 1,
-0.09455635, -1.396675, -3.698357, 0, 1, 0.8078431, 1,
-0.09109072, 1.349805, -1.153304, 0, 1, 0.8156863, 1,
-0.09056773, 0.7631834, -1.57393, 0, 1, 0.8196079, 1,
-0.09006134, 1.920792, -1.268496, 0, 1, 0.827451, 1,
-0.08869572, -0.1363743, -2.36275, 0, 1, 0.8313726, 1,
-0.08751318, 0.2548448, 0.7884897, 0, 1, 0.8392157, 1,
-0.08735109, -1.498925, -3.059494, 0, 1, 0.8431373, 1,
-0.08668322, -0.1870649, -2.77705, 0, 1, 0.8509804, 1,
-0.08659808, -0.5451004, -4.25336, 0, 1, 0.854902, 1,
-0.08535042, 1.449955, 1.49314, 0, 1, 0.8627451, 1,
-0.08489539, -0.2902197, -2.522239, 0, 1, 0.8666667, 1,
-0.08461119, -0.6677665, -2.159611, 0, 1, 0.8745098, 1,
-0.07969751, -0.6648341, -2.891888, 0, 1, 0.8784314, 1,
-0.07568047, -1.228891, -4.38262, 0, 1, 0.8862745, 1,
-0.07409085, 1.571655, -2.140902, 0, 1, 0.8901961, 1,
-0.07256279, -1.00472, -2.747806, 0, 1, 0.8980392, 1,
-0.06825633, 0.2654063, -0.6393789, 0, 1, 0.9058824, 1,
-0.05754432, 0.4281195, -0.008727469, 0, 1, 0.9098039, 1,
-0.05335448, -0.1824998, -3.814406, 0, 1, 0.9176471, 1,
-0.05118666, -0.2521371, -3.068388, 0, 1, 0.9215686, 1,
-0.05017384, -1.157621, -2.902807, 0, 1, 0.9294118, 1,
-0.04671441, 1.018273, -1.034463, 0, 1, 0.9333333, 1,
-0.04388288, 0.708487, -0.6017496, 0, 1, 0.9411765, 1,
-0.0409111, -0.5334041, -3.170423, 0, 1, 0.945098, 1,
-0.03899541, -0.06981839, -4.248843, 0, 1, 0.9529412, 1,
-0.03769049, 1.725413, 0.4072272, 0, 1, 0.9568627, 1,
-0.03716965, -0.003705838, -1.024366, 0, 1, 0.9647059, 1,
-0.03497076, 1.678717, -0.4027478, 0, 1, 0.9686275, 1,
-0.03458605, -0.08883148, -3.087371, 0, 1, 0.9764706, 1,
-0.03443399, 1.661795, 0.9637762, 0, 1, 0.9803922, 1,
-0.02815788, -0.7483934, -3.910009, 0, 1, 0.9882353, 1,
-0.02754974, -0.6460313, -3.460702, 0, 1, 0.9921569, 1,
-0.02588988, 1.056578, 1.509089, 0, 1, 1, 1,
-0.02472902, -0.4822378, -3.452021, 0, 0.9921569, 1, 1,
-0.02401605, 0.4811971, 0.2151331, 0, 0.9882353, 1, 1,
-0.02320022, -1.146644, -2.872985, 0, 0.9803922, 1, 1,
-0.02078923, -0.5656394, -3.324352, 0, 0.9764706, 1, 1,
-0.009816021, 0.4391951, -0.4260128, 0, 0.9686275, 1, 1,
-0.009420553, -1.567665, -2.518289, 0, 0.9647059, 1, 1,
-0.003689426, -0.3936315, -3.725578, 0, 0.9568627, 1, 1,
0.001020575, -0.08229549, 3.134074, 0, 0.9529412, 1, 1,
0.006162274, -1.392949, 4.788866, 0, 0.945098, 1, 1,
0.01284499, -2.273392, 3.2349, 0, 0.9411765, 1, 1,
0.01436689, 3.135561, -0.3021582, 0, 0.9333333, 1, 1,
0.01819807, -1.323936, 2.357066, 0, 0.9294118, 1, 1,
0.02264153, -0.541024, 1.11453, 0, 0.9215686, 1, 1,
0.02531728, 0.5957158, -0.02807652, 0, 0.9176471, 1, 1,
0.02911641, -0.3838496, 4.788951, 0, 0.9098039, 1, 1,
0.03410215, -0.8473345, 4.85111, 0, 0.9058824, 1, 1,
0.03607148, 0.3315423, -1.680317, 0, 0.8980392, 1, 1,
0.03805757, 1.90192, 0.3500809, 0, 0.8901961, 1, 1,
0.03813111, 0.5898346, -0.2709578, 0, 0.8862745, 1, 1,
0.04297573, -0.4553826, 1.484508, 0, 0.8784314, 1, 1,
0.04590007, -0.6668913, 3.275847, 0, 0.8745098, 1, 1,
0.04820754, 2.473929, -0.3432627, 0, 0.8666667, 1, 1,
0.05132001, -0.4167227, 2.989976, 0, 0.8627451, 1, 1,
0.05598236, 0.8536227, 0.2844847, 0, 0.854902, 1, 1,
0.05656042, 0.8728039, -1.932658, 0, 0.8509804, 1, 1,
0.06511464, 0.9659982, -1.099252, 0, 0.8431373, 1, 1,
0.06699394, 1.454703, -1.352797, 0, 0.8392157, 1, 1,
0.06717481, 0.8304037, -0.7391415, 0, 0.8313726, 1, 1,
0.06945036, 0.5890654, 0.2552522, 0, 0.827451, 1, 1,
0.06945767, -0.643701, 2.747554, 0, 0.8196079, 1, 1,
0.07141861, 1.849452, -2.427901, 0, 0.8156863, 1, 1,
0.0736175, -0.3375354, 2.624827, 0, 0.8078431, 1, 1,
0.07393882, -0.2935704, 3.536238, 0, 0.8039216, 1, 1,
0.076434, -0.7770461, 3.051249, 0, 0.7960784, 1, 1,
0.07948809, -1.726717, 2.680515, 0, 0.7882353, 1, 1,
0.08159439, -0.385827, 2.270637, 0, 0.7843137, 1, 1,
0.0826504, -0.6608686, 4.102189, 0, 0.7764706, 1, 1,
0.0831534, 1.277716, 0.2942976, 0, 0.772549, 1, 1,
0.08905065, -1.334445, 3.603106, 0, 0.7647059, 1, 1,
0.09031659, 0.04131186, 1.321834, 0, 0.7607843, 1, 1,
0.09492857, 0.08927066, -0.04195078, 0, 0.7529412, 1, 1,
0.1000959, -0.9712874, 3.022924, 0, 0.7490196, 1, 1,
0.101663, -1.782229, 3.421363, 0, 0.7411765, 1, 1,
0.1040359, 2.122841, -0.8126814, 0, 0.7372549, 1, 1,
0.1077407, -1.521386, 3.172703, 0, 0.7294118, 1, 1,
0.1079238, -1.684547, 2.798194, 0, 0.7254902, 1, 1,
0.1126576, 1.588846, -0.1009604, 0, 0.7176471, 1, 1,
0.1143099, 1.762278, -1.013097, 0, 0.7137255, 1, 1,
0.1190547, -0.3077031, 3.733111, 0, 0.7058824, 1, 1,
0.1275792, 0.8702803, 1.766785, 0, 0.6980392, 1, 1,
0.1279509, 1.034664, 1.115962, 0, 0.6941177, 1, 1,
0.130249, 0.5710957, -2.03541, 0, 0.6862745, 1, 1,
0.1348473, 1.162865, 1.458091, 0, 0.682353, 1, 1,
0.1372185, -0.9520065, 2.378349, 0, 0.6745098, 1, 1,
0.1393834, -0.9494087, 2.27984, 0, 0.6705883, 1, 1,
0.1398292, -1.562641, 2.425497, 0, 0.6627451, 1, 1,
0.1452091, -1.752846, 5.196783, 0, 0.6588235, 1, 1,
0.147146, -0.2369115, 0.6114007, 0, 0.6509804, 1, 1,
0.1535261, -0.1248093, 2.832475, 0, 0.6470588, 1, 1,
0.1576976, -0.3295768, 4.005514, 0, 0.6392157, 1, 1,
0.1614617, -0.3115678, 3.159505, 0, 0.6352941, 1, 1,
0.1642911, -1.597968, 2.963565, 0, 0.627451, 1, 1,
0.1652068, -0.2349562, 3.732325, 0, 0.6235294, 1, 1,
0.1664874, 2.116103, 0.9300039, 0, 0.6156863, 1, 1,
0.166661, -0.6946731, 1.309587, 0, 0.6117647, 1, 1,
0.1673887, 0.1441165, 1.698168, 0, 0.6039216, 1, 1,
0.1682873, 0.8590006, -0.8051411, 0, 0.5960785, 1, 1,
0.1708655, 0.6056407, 0.4028552, 0, 0.5921569, 1, 1,
0.1732285, 0.2340232, 0.7827241, 0, 0.5843138, 1, 1,
0.1797768, 1.157839, -1.274606, 0, 0.5803922, 1, 1,
0.1803746, -0.5859418, 3.812988, 0, 0.572549, 1, 1,
0.189067, -0.5277226, 3.244531, 0, 0.5686275, 1, 1,
0.1909117, 0.1866225, 1.050886, 0, 0.5607843, 1, 1,
0.1931619, 1.333693, -1.431868, 0, 0.5568628, 1, 1,
0.1936002, -0.08222134, 2.62209, 0, 0.5490196, 1, 1,
0.1982201, -1.362985, 3.694668, 0, 0.5450981, 1, 1,
0.1985722, 0.006065367, 2.694547, 0, 0.5372549, 1, 1,
0.2009389, -0.7483794, 2.471435, 0, 0.5333334, 1, 1,
0.2036356, -0.7131879, 2.807346, 0, 0.5254902, 1, 1,
0.2040936, -1.012766, 2.2342, 0, 0.5215687, 1, 1,
0.2049712, 1.747824, -0.5948073, 0, 0.5137255, 1, 1,
0.2100312, 1.195563, 0.6075009, 0, 0.509804, 1, 1,
0.2102252, -0.08102174, 2.539776, 0, 0.5019608, 1, 1,
0.211557, -0.04404559, 1.327022, 0, 0.4941176, 1, 1,
0.2129153, 0.2287364, 1.466907, 0, 0.4901961, 1, 1,
0.216413, 1.201671, 0.0634804, 0, 0.4823529, 1, 1,
0.21668, 0.4271819, 0.960008, 0, 0.4784314, 1, 1,
0.220764, 0.5355404, 0.3593754, 0, 0.4705882, 1, 1,
0.2275708, -0.1408622, 1.508171, 0, 0.4666667, 1, 1,
0.2287223, -0.3517052, 1.00709, 0, 0.4588235, 1, 1,
0.2355282, -1.860794, 3.649474, 0, 0.454902, 1, 1,
0.2374912, 0.6012743, 1.881307, 0, 0.4470588, 1, 1,
0.240446, 0.7063615, 0.05453451, 0, 0.4431373, 1, 1,
0.2456511, -0.5852152, 2.432014, 0, 0.4352941, 1, 1,
0.2522248, 0.9749403, -1.105596, 0, 0.4313726, 1, 1,
0.2528072, -1.659195, 4.452399, 0, 0.4235294, 1, 1,
0.2538739, 0.1351057, 1.161977, 0, 0.4196078, 1, 1,
0.2581463, 0.8361501, -0.8568462, 0, 0.4117647, 1, 1,
0.2611389, -0.2912026, 3.459626, 0, 0.4078431, 1, 1,
0.2622409, -0.7660161, 1.077698, 0, 0.4, 1, 1,
0.2659049, -0.2571486, 2.528268, 0, 0.3921569, 1, 1,
0.2675231, 2.703466, 0.6548289, 0, 0.3882353, 1, 1,
0.2675828, -0.5779515, 3.721317, 0, 0.3803922, 1, 1,
0.2723896, 1.482472, -0.4440266, 0, 0.3764706, 1, 1,
0.2726324, -0.44106, 3.095564, 0, 0.3686275, 1, 1,
0.2735327, -0.2705182, 2.289934, 0, 0.3647059, 1, 1,
0.2743196, -0.5567745, 2.235478, 0, 0.3568628, 1, 1,
0.2782413, -0.8859059, 0.9896083, 0, 0.3529412, 1, 1,
0.2790032, 0.8457358, 0.8223352, 0, 0.345098, 1, 1,
0.2843069, -1.147098, 2.036505, 0, 0.3411765, 1, 1,
0.2857031, -0.5096161, 4.254128, 0, 0.3333333, 1, 1,
0.289037, 0.2225102, -0.4834213, 0, 0.3294118, 1, 1,
0.289902, -0.2737392, 2.850388, 0, 0.3215686, 1, 1,
0.2942863, -0.9936314, 2.397962, 0, 0.3176471, 1, 1,
0.2946624, 0.5911289, 0.2205032, 0, 0.3098039, 1, 1,
0.2990881, -0.5045482, 4.539464, 0, 0.3058824, 1, 1,
0.2996326, -0.2955212, 2.610362, 0, 0.2980392, 1, 1,
0.3029369, 0.4073384, 1.420047, 0, 0.2901961, 1, 1,
0.3079989, 0.1700818, 1.198711, 0, 0.2862745, 1, 1,
0.309978, -0.01427658, 1.837736, 0, 0.2784314, 1, 1,
0.3126944, -0.08696792, 1.67984, 0, 0.2745098, 1, 1,
0.3159617, 0.7682171, -2.50134, 0, 0.2666667, 1, 1,
0.3163399, 1.276205, -0.7133167, 0, 0.2627451, 1, 1,
0.3165315, -0.05680281, 2.068774, 0, 0.254902, 1, 1,
0.3176661, 0.39492, 2.816731, 0, 0.2509804, 1, 1,
0.3181272, 0.7923837, 2.138043, 0, 0.2431373, 1, 1,
0.3181349, -0.3649903, 4.277988, 0, 0.2392157, 1, 1,
0.3189239, 1.249998, 0.2749677, 0, 0.2313726, 1, 1,
0.3200645, -0.929116, 3.202297, 0, 0.227451, 1, 1,
0.3304394, 0.1440675, 0.9170284, 0, 0.2196078, 1, 1,
0.3340009, 1.027986, 0.2778895, 0, 0.2156863, 1, 1,
0.3378792, -0.8958853, 2.452972, 0, 0.2078431, 1, 1,
0.341927, 0.1191329, 0.9152088, 0, 0.2039216, 1, 1,
0.3425764, 0.5911224, 0.1947659, 0, 0.1960784, 1, 1,
0.3456892, 1.46325, 1.140487, 0, 0.1882353, 1, 1,
0.3493809, 2.388715, -0.4875991, 0, 0.1843137, 1, 1,
0.3510602, -1.008559, 2.491251, 0, 0.1764706, 1, 1,
0.3514583, 2.871988, -0.2028958, 0, 0.172549, 1, 1,
0.3557387, -0.4027306, 0.9799885, 0, 0.1647059, 1, 1,
0.3560566, -0.9114893, 4.080357, 0, 0.1607843, 1, 1,
0.3613838, -0.4033312, 2.9328, 0, 0.1529412, 1, 1,
0.3686266, -2.096191, 3.808895, 0, 0.1490196, 1, 1,
0.3714616, 0.399264, 0.3551343, 0, 0.1411765, 1, 1,
0.3722217, -0.04281877, 1.851683, 0, 0.1372549, 1, 1,
0.3762223, 0.09128902, 2.801877, 0, 0.1294118, 1, 1,
0.3801009, -0.7279968, 2.222812, 0, 0.1254902, 1, 1,
0.3828059, -0.6831678, 1.921228, 0, 0.1176471, 1, 1,
0.3847995, -0.2530882, 1.164281, 0, 0.1137255, 1, 1,
0.3888825, 2.128681, -1.190694, 0, 0.1058824, 1, 1,
0.3891893, -0.1251567, 0.8728591, 0, 0.09803922, 1, 1,
0.3920611, 0.608433, 1.54333, 0, 0.09411765, 1, 1,
0.4007117, -0.5104917, 3.578227, 0, 0.08627451, 1, 1,
0.4060679, -1.00502, 2.838015, 0, 0.08235294, 1, 1,
0.4084993, 0.8826207, -0.3764186, 0, 0.07450981, 1, 1,
0.4086671, -0.4387087, 2.319849, 0, 0.07058824, 1, 1,
0.4158223, 1.080124, -0.246801, 0, 0.0627451, 1, 1,
0.4244337, 1.291881, -0.4939883, 0, 0.05882353, 1, 1,
0.4246472, -0.1266969, 3.217361, 0, 0.05098039, 1, 1,
0.4265019, 0.744748, 0.7008831, 0, 0.04705882, 1, 1,
0.4269665, -2.033267, 0.6232963, 0, 0.03921569, 1, 1,
0.4325744, 0.5811322, -0.3257769, 0, 0.03529412, 1, 1,
0.4370537, 0.9254028, 1.546266, 0, 0.02745098, 1, 1,
0.4393376, 1.108349, -0.5507425, 0, 0.02352941, 1, 1,
0.4411007, 0.2707942, 0.7157577, 0, 0.01568628, 1, 1,
0.4465784, -0.7328861, 3.288768, 0, 0.01176471, 1, 1,
0.4474942, 0.5024548, 1.449242, 0, 0.003921569, 1, 1,
0.4516363, -0.07169759, 1.412992, 0.003921569, 0, 1, 1,
0.4534262, -0.2944131, 3.698759, 0.007843138, 0, 1, 1,
0.4538723, -0.6210291, 2.890552, 0.01568628, 0, 1, 1,
0.4655401, -2.190918, 1.180597, 0.01960784, 0, 1, 1,
0.4694179, -0.6861693, 3.679906, 0.02745098, 0, 1, 1,
0.4739179, -0.3054707, 3.037365, 0.03137255, 0, 1, 1,
0.4774633, -0.9256302, 1.946097, 0.03921569, 0, 1, 1,
0.4799261, -0.0478874, 1.264637, 0.04313726, 0, 1, 1,
0.4810736, 0.6311904, -0.1492643, 0.05098039, 0, 1, 1,
0.4820765, -0.9343343, 1.807892, 0.05490196, 0, 1, 1,
0.4905952, -0.001648558, 1.612624, 0.0627451, 0, 1, 1,
0.4915168, 2.724225, 0.4048656, 0.06666667, 0, 1, 1,
0.4927187, 0.04426976, 1.953263, 0.07450981, 0, 1, 1,
0.4951263, 1.310664, 1.716161, 0.07843138, 0, 1, 1,
0.4977593, 0.04952632, 1.293229, 0.08627451, 0, 1, 1,
0.4987647, -0.5283231, 3.192123, 0.09019608, 0, 1, 1,
0.5004278, 0.3113051, 1.606605, 0.09803922, 0, 1, 1,
0.5060256, -1.058032, 1.062057, 0.1058824, 0, 1, 1,
0.5084854, 0.06467545, -0.1901122, 0.1098039, 0, 1, 1,
0.5085829, -0.7353904, 2.027016, 0.1176471, 0, 1, 1,
0.5151223, 0.5188051, -0.6183634, 0.1215686, 0, 1, 1,
0.5162233, -1.895754, 3.996585, 0.1294118, 0, 1, 1,
0.5214983, 0.3271146, 1.583886, 0.1333333, 0, 1, 1,
0.5220768, -1.346429, 3.224061, 0.1411765, 0, 1, 1,
0.5229282, -1.135771, 3.735498, 0.145098, 0, 1, 1,
0.5235425, -0.4186117, 2.386883, 0.1529412, 0, 1, 1,
0.5238388, -1.717377, 2.659807, 0.1568628, 0, 1, 1,
0.5240941, -0.2111795, 3.512898, 0.1647059, 0, 1, 1,
0.5321686, -0.4273571, 4.650553, 0.1686275, 0, 1, 1,
0.5344862, -0.3719872, 3.371953, 0.1764706, 0, 1, 1,
0.5359361, -1.130087, 2.739454, 0.1803922, 0, 1, 1,
0.5366119, -0.9692044, 2.943597, 0.1882353, 0, 1, 1,
0.5408156, 0.01908907, 3.763829, 0.1921569, 0, 1, 1,
0.541566, -0.7282649, 1.016291, 0.2, 0, 1, 1,
0.543407, -0.3973967, 2.763468, 0.2078431, 0, 1, 1,
0.5480188, 0.5429001, 1.236948, 0.2117647, 0, 1, 1,
0.5483535, 0.4221301, 3.295676, 0.2196078, 0, 1, 1,
0.5500194, -1.165461, 5.334485, 0.2235294, 0, 1, 1,
0.5527905, 0.3631375, 0.9862659, 0.2313726, 0, 1, 1,
0.5531463, -1.215461, 1.536777, 0.2352941, 0, 1, 1,
0.5540112, -0.8701885, 3.966649, 0.2431373, 0, 1, 1,
0.5553777, -0.4597349, 1.419672, 0.2470588, 0, 1, 1,
0.5574585, 0.1839409, 2.836461, 0.254902, 0, 1, 1,
0.5609379, 1.285833, 0.4647346, 0.2588235, 0, 1, 1,
0.5627407, -0.6716043, 2.724027, 0.2666667, 0, 1, 1,
0.5712864, -0.1500623, 2.639364, 0.2705882, 0, 1, 1,
0.5744749, 0.5501031, 0.226847, 0.2784314, 0, 1, 1,
0.5765695, -0.9242397, 3.33382, 0.282353, 0, 1, 1,
0.5792501, -2.440897, 2.364156, 0.2901961, 0, 1, 1,
0.5855757, 0.4782799, 2.155902, 0.2941177, 0, 1, 1,
0.5909658, -2.138258, 4.057409, 0.3019608, 0, 1, 1,
0.5919672, 0.2812276, 1.39611, 0.3098039, 0, 1, 1,
0.5957204, -1.468891, 2.986375, 0.3137255, 0, 1, 1,
0.5966831, 0.2025111, 1.197691, 0.3215686, 0, 1, 1,
0.5972971, 0.3608832, 0.3872254, 0.3254902, 0, 1, 1,
0.5988501, -0.7700357, 1.41098, 0.3333333, 0, 1, 1,
0.6000843, 1.786111, 0.6431469, 0.3372549, 0, 1, 1,
0.6042004, 2.253581, -1.616676, 0.345098, 0, 1, 1,
0.6044764, 0.8699768, -0.4533728, 0.3490196, 0, 1, 1,
0.6063623, 0.3126318, 0.1489833, 0.3568628, 0, 1, 1,
0.6078443, 0.4489776, 1.678859, 0.3607843, 0, 1, 1,
0.6106457, -0.3457452, 1.609964, 0.3686275, 0, 1, 1,
0.6121596, -0.448929, 1.053029, 0.372549, 0, 1, 1,
0.6129392, 0.8490075, 0.5027686, 0.3803922, 0, 1, 1,
0.6188154, 0.2558241, 1.275582, 0.3843137, 0, 1, 1,
0.6203064, 1.313998, -0.3589787, 0.3921569, 0, 1, 1,
0.6210535, -0.682323, 2.093245, 0.3960784, 0, 1, 1,
0.6308786, -0.7577422, 2.017121, 0.4039216, 0, 1, 1,
0.6321073, -1.343291, 2.441136, 0.4117647, 0, 1, 1,
0.6399844, 0.2893777, 2.138039, 0.4156863, 0, 1, 1,
0.6453661, -0.6467317, 2.053916, 0.4235294, 0, 1, 1,
0.64935, -2.619622, 4.179467, 0.427451, 0, 1, 1,
0.6557457, -0.6577483, 3.331741, 0.4352941, 0, 1, 1,
0.6607549, -0.3255507, 0.8796897, 0.4392157, 0, 1, 1,
0.6621418, 0.3919857, 1.475808, 0.4470588, 0, 1, 1,
0.6626176, 1.28254, 0.8835418, 0.4509804, 0, 1, 1,
0.6658213, -0.3058198, 2.224165, 0.4588235, 0, 1, 1,
0.6668945, -0.4194007, 1.845968, 0.4627451, 0, 1, 1,
0.6746037, -0.5491891, 3.941318, 0.4705882, 0, 1, 1,
0.67733, 0.6728891, 0.6842759, 0.4745098, 0, 1, 1,
0.6780089, -0.9510183, 2.720655, 0.4823529, 0, 1, 1,
0.6791045, 1.533924, -1.804069, 0.4862745, 0, 1, 1,
0.6799017, 0.2008726, 1.16267, 0.4941176, 0, 1, 1,
0.6803275, 0.2851142, 0.5378264, 0.5019608, 0, 1, 1,
0.6809173, -2.821428, 3.003911, 0.5058824, 0, 1, 1,
0.6919084, -0.07957405, 1.302869, 0.5137255, 0, 1, 1,
0.6932836, -1.16364, 4.438808, 0.5176471, 0, 1, 1,
0.6946736, -1.275059, 3.191951, 0.5254902, 0, 1, 1,
0.6960258, -0.8943436, 2.362764, 0.5294118, 0, 1, 1,
0.7002048, -0.4142154, 1.514568, 0.5372549, 0, 1, 1,
0.7003114, 0.4961196, 0.03239697, 0.5411765, 0, 1, 1,
0.7033285, -0.6515015, 1.993751, 0.5490196, 0, 1, 1,
0.7136955, 0.01570492, 2.563141, 0.5529412, 0, 1, 1,
0.7170264, 0.3410563, 0.4794551, 0.5607843, 0, 1, 1,
0.7172023, -1.342703, 3.647321, 0.5647059, 0, 1, 1,
0.7214936, -1.153033, 1.996023, 0.572549, 0, 1, 1,
0.7395194, -0.2452949, 1.802706, 0.5764706, 0, 1, 1,
0.7399499, 0.7957038, 3.156312, 0.5843138, 0, 1, 1,
0.7400301, -1.919443, 3.5809, 0.5882353, 0, 1, 1,
0.7408791, -1.885671, 2.898412, 0.5960785, 0, 1, 1,
0.744386, 0.8122134, 0.4203396, 0.6039216, 0, 1, 1,
0.7472676, 0.4188794, -0.4423745, 0.6078432, 0, 1, 1,
0.7504019, 1.128923, 1.057249, 0.6156863, 0, 1, 1,
0.750987, 1.526947, -0.2244498, 0.6196079, 0, 1, 1,
0.7518131, -0.6132523, 1.347949, 0.627451, 0, 1, 1,
0.7547452, -0.3291968, 1.666098, 0.6313726, 0, 1, 1,
0.7609428, 0.7191426, 0.5491476, 0.6392157, 0, 1, 1,
0.7623429, 0.5510299, 0.1982276, 0.6431373, 0, 1, 1,
0.7635642, 0.33928, -0.2604912, 0.6509804, 0, 1, 1,
0.7694796, -0.01304269, 1.031445, 0.654902, 0, 1, 1,
0.7760455, 1.028168, 2.230468, 0.6627451, 0, 1, 1,
0.7817873, 0.2149171, 2.215002, 0.6666667, 0, 1, 1,
0.7820935, -1.292545, 2.383879, 0.6745098, 0, 1, 1,
0.7883877, 0.01545376, 1.271796, 0.6784314, 0, 1, 1,
0.7925121, 0.6123993, 0.1397957, 0.6862745, 0, 1, 1,
0.8054589, 0.2308539, -0.2007115, 0.6901961, 0, 1, 1,
0.806259, -0.3477114, -1.481094, 0.6980392, 0, 1, 1,
0.8064262, -1.082606, 3.746421, 0.7058824, 0, 1, 1,
0.8067845, 0.6041519, 0.2533981, 0.7098039, 0, 1, 1,
0.8084168, -0.2580536, 3.203332, 0.7176471, 0, 1, 1,
0.8092496, -0.4257008, 1.079337, 0.7215686, 0, 1, 1,
0.8107767, 0.4448007, 1.935344, 0.7294118, 0, 1, 1,
0.8268308, -0.02344175, 1.979714, 0.7333333, 0, 1, 1,
0.8273445, 2.705357, -0.02938871, 0.7411765, 0, 1, 1,
0.8278967, 1.407542, -1.145339, 0.7450981, 0, 1, 1,
0.8293329, -1.162867, 3.350817, 0.7529412, 0, 1, 1,
0.8408509, -0.3691142, 3.859688, 0.7568628, 0, 1, 1,
0.8482497, 0.4203511, 0.6323012, 0.7647059, 0, 1, 1,
0.8519336, -0.6751537, 0.9000197, 0.7686275, 0, 1, 1,
0.8524972, 0.8070042, -1.139133, 0.7764706, 0, 1, 1,
0.8562773, 0.07149891, 3.186636, 0.7803922, 0, 1, 1,
0.8577815, -1.176092, 1.498128, 0.7882353, 0, 1, 1,
0.8595192, -1.100946, 2.184515, 0.7921569, 0, 1, 1,
0.8654438, 1.885466, -0.7042112, 0.8, 0, 1, 1,
0.8657623, -0.6605688, 2.421119, 0.8078431, 0, 1, 1,
0.8680526, -1.20053, 1.985796, 0.8117647, 0, 1, 1,
0.8848649, 1.78952, 0.7543983, 0.8196079, 0, 1, 1,
0.8862272, -0.4835406, 3.261415, 0.8235294, 0, 1, 1,
0.8866374, -1.703517, 2.846115, 0.8313726, 0, 1, 1,
0.8901387, -0.3572559, 1.784488, 0.8352941, 0, 1, 1,
0.8907726, 1.084043, 0.9971159, 0.8431373, 0, 1, 1,
0.8917454, -0.3414996, 0.9499883, 0.8470588, 0, 1, 1,
0.8977115, -0.3422687, 0.7038236, 0.854902, 0, 1, 1,
0.8989111, 0.03730123, 2.273985, 0.8588235, 0, 1, 1,
0.8990163, -2.076, 1.753779, 0.8666667, 0, 1, 1,
0.9050982, 0.07549107, 2.636733, 0.8705882, 0, 1, 1,
0.9072196, -1.228538, 1.091969, 0.8784314, 0, 1, 1,
0.9096588, -0.5733317, 2.994703, 0.8823529, 0, 1, 1,
0.9166309, -0.3888899, 0.6894888, 0.8901961, 0, 1, 1,
0.9192827, -0.9665067, 0.5903191, 0.8941177, 0, 1, 1,
0.9204374, -0.9533931, 1.078306, 0.9019608, 0, 1, 1,
0.9231537, -0.5501727, 2.526435, 0.9098039, 0, 1, 1,
0.9245828, -0.06524622, 2.071341, 0.9137255, 0, 1, 1,
0.9277492, 0.3105344, 0.6501198, 0.9215686, 0, 1, 1,
0.9298761, 0.6232103, -0.1684453, 0.9254902, 0, 1, 1,
0.9315721, 0.1843534, 1.371813, 0.9333333, 0, 1, 1,
0.9357544, 0.3057232, 1.121642, 0.9372549, 0, 1, 1,
0.9448561, 0.4816374, 0.4329287, 0.945098, 0, 1, 1,
0.9470769, 0.2573762, -0.2686967, 0.9490196, 0, 1, 1,
0.9533212, 1.889525, 0.3714008, 0.9568627, 0, 1, 1,
0.9552755, 0.7334954, 2.195864, 0.9607843, 0, 1, 1,
0.9578005, -0.2868514, 2.837158, 0.9686275, 0, 1, 1,
0.9628069, 1.034326, 1.956288, 0.972549, 0, 1, 1,
0.9649088, 0.9110968, 0.9952374, 0.9803922, 0, 1, 1,
0.9658337, -0.314735, 0.5275841, 0.9843137, 0, 1, 1,
0.9735444, 0.8044242, 0.5324592, 0.9921569, 0, 1, 1,
0.9745235, -1.033283, 2.934404, 0.9960784, 0, 1, 1,
0.9758752, 0.844628, 0.6988821, 1, 0, 0.9960784, 1,
0.9923406, 1.551658, 2.368237, 1, 0, 0.9882353, 1,
0.9926685, 1.934435, -0.6178777, 1, 0, 0.9843137, 1,
0.993286, 0.5613856, 0.3615957, 1, 0, 0.9764706, 1,
0.9948975, -0.111767, 1.238153, 1, 0, 0.972549, 1,
0.9986939, -0.2311623, 0.9332171, 1, 0, 0.9647059, 1,
1.004225, -0.9357156, 3.230899, 1, 0, 0.9607843, 1,
1.007762, -0.3639194, 1.656887, 1, 0, 0.9529412, 1,
1.011279, -1.493211, 2.97034, 1, 0, 0.9490196, 1,
1.014967, 1.315915, 0.5982399, 1, 0, 0.9411765, 1,
1.017012, -0.2847891, 2.135381, 1, 0, 0.9372549, 1,
1.018588, -0.4845585, 2.334785, 1, 0, 0.9294118, 1,
1.019865, 0.4571783, 1.311486, 1, 0, 0.9254902, 1,
1.023225, 0.9928038, 0.3219134, 1, 0, 0.9176471, 1,
1.025537, -0.3586044, 0.6863966, 1, 0, 0.9137255, 1,
1.025655, -0.08329896, 1.760569, 1, 0, 0.9058824, 1,
1.03487, 0.4464057, -0.8179207, 1, 0, 0.9019608, 1,
1.036485, -0.06570382, 0.5033244, 1, 0, 0.8941177, 1,
1.038447, 0.3750199, 1.37181, 1, 0, 0.8862745, 1,
1.042616, 0.7042295, 0.1786557, 1, 0, 0.8823529, 1,
1.056909, -0.3828998, 1.533378, 1, 0, 0.8745098, 1,
1.061236, 0.3401846, 2.123873, 1, 0, 0.8705882, 1,
1.064836, -0.3362618, 3.875877, 1, 0, 0.8627451, 1,
1.078109, -0.1012195, 1.415878, 1, 0, 0.8588235, 1,
1.079135, 1.569693, 1.616629, 1, 0, 0.8509804, 1,
1.083244, -0.5354365, 0.5576326, 1, 0, 0.8470588, 1,
1.083768, 1.245836, 2.36029, 1, 0, 0.8392157, 1,
1.088647, -0.3553937, 4.051629, 1, 0, 0.8352941, 1,
1.092168, 0.9462125, 0.6271195, 1, 0, 0.827451, 1,
1.09387, -1.719008, 3.077145, 1, 0, 0.8235294, 1,
1.095653, 1.291396, 1.674652, 1, 0, 0.8156863, 1,
1.108808, -0.6548509, 1.865666, 1, 0, 0.8117647, 1,
1.109348, -1.046805, 2.002672, 1, 0, 0.8039216, 1,
1.113043, 0.5235347, 3.432913, 1, 0, 0.7960784, 1,
1.125766, -0.3418473, 1.029753, 1, 0, 0.7921569, 1,
1.13314, -1.136246, 1.716931, 1, 0, 0.7843137, 1,
1.140373, -0.7252778, 1.858573, 1, 0, 0.7803922, 1,
1.141417, -0.6754376, 0.3342651, 1, 0, 0.772549, 1,
1.147342, 0.9963452, -0.1174864, 1, 0, 0.7686275, 1,
1.161813, -0.7915133, 1.733306, 1, 0, 0.7607843, 1,
1.165471, 1.133426, -0.7223887, 1, 0, 0.7568628, 1,
1.170809, -0.1804887, 3.077793, 1, 0, 0.7490196, 1,
1.183071, -1.636888, 4.216753, 1, 0, 0.7450981, 1,
1.186792, 0.6598844, -0.1731326, 1, 0, 0.7372549, 1,
1.18723, -0.7886825, 3.702953, 1, 0, 0.7333333, 1,
1.190122, 0.4612608, 2.464978, 1, 0, 0.7254902, 1,
1.192925, -0.2366739, 2.611727, 1, 0, 0.7215686, 1,
1.195335, 0.4245395, 0.9723991, 1, 0, 0.7137255, 1,
1.200879, 0.8649608, 3.52, 1, 0, 0.7098039, 1,
1.204044, 1.044481, 1.779802, 1, 0, 0.7019608, 1,
1.204478, 1.493328, 2.219724, 1, 0, 0.6941177, 1,
1.214102, 1.217775, 1.150479, 1, 0, 0.6901961, 1,
1.217226, -0.2906491, 1.629529, 1, 0, 0.682353, 1,
1.22637, -0.9750266, 2.067209, 1, 0, 0.6784314, 1,
1.227659, 1.270336, 0.4118956, 1, 0, 0.6705883, 1,
1.228906, 0.9353042, 1.848831, 1, 0, 0.6666667, 1,
1.229445, 1.036046, 1.689158, 1, 0, 0.6588235, 1,
1.251963, 1.340909, 0.1344186, 1, 0, 0.654902, 1,
1.253468, -1.38671, 2.749203, 1, 0, 0.6470588, 1,
1.255017, -0.4340765, 3.06399, 1, 0, 0.6431373, 1,
1.264105, -1.332773, 2.081083, 1, 0, 0.6352941, 1,
1.265905, 1.187482, -0.5190514, 1, 0, 0.6313726, 1,
1.266946, -1.386338, 2.337302, 1, 0, 0.6235294, 1,
1.268796, -0.26004, 1.490888, 1, 0, 0.6196079, 1,
1.270711, -1.851525, 1.29611, 1, 0, 0.6117647, 1,
1.274555, -0.9433845, 2.125657, 1, 0, 0.6078432, 1,
1.275333, 0.01858327, 1.487046, 1, 0, 0.6, 1,
1.27538, -1.347423, 1.366521, 1, 0, 0.5921569, 1,
1.281057, -0.8348727, 2.733382, 1, 0, 0.5882353, 1,
1.282562, 0.9426721, 1.753464, 1, 0, 0.5803922, 1,
1.285132, 1.330322, 0.6773892, 1, 0, 0.5764706, 1,
1.289818, -0.8630249, 3.364325, 1, 0, 0.5686275, 1,
1.29385, -0.5581372, 2.207593, 1, 0, 0.5647059, 1,
1.305171, 1.814102, 0.3953072, 1, 0, 0.5568628, 1,
1.309872, -2.431953, 3.712295, 1, 0, 0.5529412, 1,
1.313986, -0.2069666, 0.9134188, 1, 0, 0.5450981, 1,
1.333096, 0.6489014, 1.984014, 1, 0, 0.5411765, 1,
1.336815, 1.021827, 1.091859, 1, 0, 0.5333334, 1,
1.348588, -1.122162, 2.377836, 1, 0, 0.5294118, 1,
1.349256, 0.5727392, 0.5369978, 1, 0, 0.5215687, 1,
1.349627, -0.493842, 1.840721, 1, 0, 0.5176471, 1,
1.363095, -3.075815, 2.574425, 1, 0, 0.509804, 1,
1.371361, 1.620088, 0.4865165, 1, 0, 0.5058824, 1,
1.37401, -1.853624, 2.619738, 1, 0, 0.4980392, 1,
1.382775, 0.1485976, 1.356543, 1, 0, 0.4901961, 1,
1.399432, -0.1824565, 2.226325, 1, 0, 0.4862745, 1,
1.402158, 0.006337803, 0.7872866, 1, 0, 0.4784314, 1,
1.425313, -0.06682971, 1.540987, 1, 0, 0.4745098, 1,
1.42864, -1.385326, 3.195051, 1, 0, 0.4666667, 1,
1.429757, 0.6100184, -0.06584449, 1, 0, 0.4627451, 1,
1.435509, 0.005796529, 0.9368733, 1, 0, 0.454902, 1,
1.442913, 0.2914518, 1.770727, 1, 0, 0.4509804, 1,
1.450818, 0.02729374, 1.724994, 1, 0, 0.4431373, 1,
1.452351, 1.249199, 0.5318758, 1, 0, 0.4392157, 1,
1.456193, 0.3750633, -0.5654069, 1, 0, 0.4313726, 1,
1.464871, -1.14488, 1.97251, 1, 0, 0.427451, 1,
1.47772, 0.806655, 0.3990697, 1, 0, 0.4196078, 1,
1.488555, 0.006704319, 1.33575, 1, 0, 0.4156863, 1,
1.493118, -0.808043, 2.267298, 1, 0, 0.4078431, 1,
1.493244, -0.6966922, 0.8380222, 1, 0, 0.4039216, 1,
1.501141, -1.729606, 3.480497, 1, 0, 0.3960784, 1,
1.504999, -0.1094389, 3.316139, 1, 0, 0.3882353, 1,
1.514726, -0.7859427, 1.510405, 1, 0, 0.3843137, 1,
1.523581, -1.809161, 1.55293, 1, 0, 0.3764706, 1,
1.528585, 0.3866684, 1.077224, 1, 0, 0.372549, 1,
1.530335, 2.329477, 0.7498426, 1, 0, 0.3647059, 1,
1.531122, 0.5677313, 0.6298298, 1, 0, 0.3607843, 1,
1.536057, 1.738345, -0.3394079, 1, 0, 0.3529412, 1,
1.553507, -2.687944, 0.6672743, 1, 0, 0.3490196, 1,
1.553782, 0.04468933, -0.01893317, 1, 0, 0.3411765, 1,
1.569905, -0.04146885, 2.060702, 1, 0, 0.3372549, 1,
1.580364, -0.3408763, 3.347765, 1, 0, 0.3294118, 1,
1.583248, -0.5357034, 0.5858038, 1, 0, 0.3254902, 1,
1.586195, 1.652287, 0.813309, 1, 0, 0.3176471, 1,
1.596844, 0.6580667, 0.9879149, 1, 0, 0.3137255, 1,
1.619384, 0.4260657, 1.806576, 1, 0, 0.3058824, 1,
1.621209, -0.3595613, 4.26082, 1, 0, 0.2980392, 1,
1.626279, -0.6531489, 3.528435, 1, 0, 0.2941177, 1,
1.627597, -0.4163358, 2.625145, 1, 0, 0.2862745, 1,
1.638584, -0.8701189, 3.589556, 1, 0, 0.282353, 1,
1.64199, -0.301384, 3.054795, 1, 0, 0.2745098, 1,
1.644348, 0.224605, 1.550077, 1, 0, 0.2705882, 1,
1.666112, -1.2625, 2.123881, 1, 0, 0.2627451, 1,
1.671232, -1.740043, 1.767938, 1, 0, 0.2588235, 1,
1.67868, -0.6761856, 1.130304, 1, 0, 0.2509804, 1,
1.681808, 0.4337229, 1.475739, 1, 0, 0.2470588, 1,
1.685285, 0.06536618, 2.221477, 1, 0, 0.2392157, 1,
1.713413, 0.1194672, 1.409497, 1, 0, 0.2352941, 1,
1.716744, 0.1260989, 1.596017, 1, 0, 0.227451, 1,
1.723054, 0.1404752, 1.218777, 1, 0, 0.2235294, 1,
1.771225, -1.371008, 1.834938, 1, 0, 0.2156863, 1,
1.788107, -0.03303686, 1.169591, 1, 0, 0.2117647, 1,
1.792038, -1.736789, 1.880468, 1, 0, 0.2039216, 1,
1.793584, -1.422055, 3.677029, 1, 0, 0.1960784, 1,
1.812844, -0.4081406, 2.291934, 1, 0, 0.1921569, 1,
1.833418, 0.411045, 1.464264, 1, 0, 0.1843137, 1,
1.857009, 0.1339497, 0.8832257, 1, 0, 0.1803922, 1,
1.866978, -0.329343, 1.855281, 1, 0, 0.172549, 1,
1.8967, -1.548792, 0.3398483, 1, 0, 0.1686275, 1,
1.935887, -0.5233372, -0.1052673, 1, 0, 0.1607843, 1,
1.937168, -1.776908, 0.6714773, 1, 0, 0.1568628, 1,
1.962483, 1.056141, 1.119515, 1, 0, 0.1490196, 1,
1.963848, -0.08397429, 2.676178, 1, 0, 0.145098, 1,
1.986811, -2.492483, 2.209056, 1, 0, 0.1372549, 1,
1.997072, -1.381577, 0.7695579, 1, 0, 0.1333333, 1,
2.029792, 0.2127022, 2.855591, 1, 0, 0.1254902, 1,
2.030342, 2.239488, 0.5580768, 1, 0, 0.1215686, 1,
2.030527, -2.037192, 3.09906, 1, 0, 0.1137255, 1,
2.098519, 2.43061, -2.548083, 1, 0, 0.1098039, 1,
2.205129, 0.02190315, 1.922191, 1, 0, 0.1019608, 1,
2.244708, 0.8941569, 2.392805, 1, 0, 0.09411765, 1,
2.253489, -0.5273887, 1.893163, 1, 0, 0.09019608, 1,
2.277055, 1.359219, 0.2254515, 1, 0, 0.08235294, 1,
2.296903, -0.1909615, 3.242651, 1, 0, 0.07843138, 1,
2.302318, 0.1219349, 0.8839008, 1, 0, 0.07058824, 1,
2.341306, -0.7970363, 1.338609, 1, 0, 0.06666667, 1,
2.441983, -0.5269291, 2.928958, 1, 0, 0.05882353, 1,
2.462956, 1.125855, 1.192347, 1, 0, 0.05490196, 1,
2.516478, -0.9421143, 1.636888, 1, 0, 0.04705882, 1,
2.520885, 1.078694, 0.3481181, 1, 0, 0.04313726, 1,
2.564495, 0.143804, 0.8574328, 1, 0, 0.03529412, 1,
2.614168, 0.03394429, 1.361643, 1, 0, 0.03137255, 1,
2.819692, 0.5001177, 2.39049, 1, 0, 0.02352941, 1,
2.830144, 1.494414, 0.6447858, 1, 0, 0.01960784, 1,
3.059199, -0.6710107, 2.621669, 1, 0, 0.01176471, 1,
3.265413, 0.1807147, 1.874568, 1, 0, 0.007843138, 1
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
0.06632495, -4.218217, -6.8704, 0, -0.5, 0.5, 0.5,
0.06632495, -4.218217, -6.8704, 1, -0.5, 0.5, 0.5,
0.06632495, -4.218217, -6.8704, 1, 1.5, 0.5, 0.5,
0.06632495, -4.218217, -6.8704, 0, 1.5, 0.5, 0.5
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
-4.217254, -0.008422971, -6.8704, 0, -0.5, 0.5, 0.5,
-4.217254, -0.008422971, -6.8704, 1, -0.5, 0.5, 0.5,
-4.217254, -0.008422971, -6.8704, 1, 1.5, 0.5, 0.5,
-4.217254, -0.008422971, -6.8704, 0, 1.5, 0.5, 0.5
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
-4.217254, -4.218217, 0.1164923, 0, -0.5, 0.5, 0.5,
-4.217254, -4.218217, 0.1164923, 1, -0.5, 0.5, 0.5,
-4.217254, -4.218217, 0.1164923, 1, 1.5, 0.5, 0.5,
-4.217254, -4.218217, 0.1164923, 0, 1.5, 0.5, 0.5
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
-3, -3.246726, -5.25804,
3, -3.246726, -5.25804,
-3, -3.246726, -5.25804,
-3, -3.408641, -5.526767,
-2, -3.246726, -5.25804,
-2, -3.408641, -5.526767,
-1, -3.246726, -5.25804,
-1, -3.408641, -5.526767,
0, -3.246726, -5.25804,
0, -3.408641, -5.526767,
1, -3.246726, -5.25804,
1, -3.408641, -5.526767,
2, -3.246726, -5.25804,
2, -3.408641, -5.526767,
3, -3.246726, -5.25804,
3, -3.408641, -5.526767
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
-3, -3.732471, -6.06422, 0, -0.5, 0.5, 0.5,
-3, -3.732471, -6.06422, 1, -0.5, 0.5, 0.5,
-3, -3.732471, -6.06422, 1, 1.5, 0.5, 0.5,
-3, -3.732471, -6.06422, 0, 1.5, 0.5, 0.5,
-2, -3.732471, -6.06422, 0, -0.5, 0.5, 0.5,
-2, -3.732471, -6.06422, 1, -0.5, 0.5, 0.5,
-2, -3.732471, -6.06422, 1, 1.5, 0.5, 0.5,
-2, -3.732471, -6.06422, 0, 1.5, 0.5, 0.5,
-1, -3.732471, -6.06422, 0, -0.5, 0.5, 0.5,
-1, -3.732471, -6.06422, 1, -0.5, 0.5, 0.5,
-1, -3.732471, -6.06422, 1, 1.5, 0.5, 0.5,
-1, -3.732471, -6.06422, 0, 1.5, 0.5, 0.5,
0, -3.732471, -6.06422, 0, -0.5, 0.5, 0.5,
0, -3.732471, -6.06422, 1, -0.5, 0.5, 0.5,
0, -3.732471, -6.06422, 1, 1.5, 0.5, 0.5,
0, -3.732471, -6.06422, 0, 1.5, 0.5, 0.5,
1, -3.732471, -6.06422, 0, -0.5, 0.5, 0.5,
1, -3.732471, -6.06422, 1, -0.5, 0.5, 0.5,
1, -3.732471, -6.06422, 1, 1.5, 0.5, 0.5,
1, -3.732471, -6.06422, 0, 1.5, 0.5, 0.5,
2, -3.732471, -6.06422, 0, -0.5, 0.5, 0.5,
2, -3.732471, -6.06422, 1, -0.5, 0.5, 0.5,
2, -3.732471, -6.06422, 1, 1.5, 0.5, 0.5,
2, -3.732471, -6.06422, 0, 1.5, 0.5, 0.5,
3, -3.732471, -6.06422, 0, -0.5, 0.5, 0.5,
3, -3.732471, -6.06422, 1, -0.5, 0.5, 0.5,
3, -3.732471, -6.06422, 1, 1.5, 0.5, 0.5,
3, -3.732471, -6.06422, 0, 1.5, 0.5, 0.5
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
-3.228736, -3, -5.25804,
-3.228736, 3, -5.25804,
-3.228736, -3, -5.25804,
-3.393489, -3, -5.526767,
-3.228736, -2, -5.25804,
-3.393489, -2, -5.526767,
-3.228736, -1, -5.25804,
-3.393489, -1, -5.526767,
-3.228736, 0, -5.25804,
-3.393489, 0, -5.526767,
-3.228736, 1, -5.25804,
-3.393489, 1, -5.526767,
-3.228736, 2, -5.25804,
-3.393489, 2, -5.526767,
-3.228736, 3, -5.25804,
-3.393489, 3, -5.526767
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
-3.722995, -3, -6.06422, 0, -0.5, 0.5, 0.5,
-3.722995, -3, -6.06422, 1, -0.5, 0.5, 0.5,
-3.722995, -3, -6.06422, 1, 1.5, 0.5, 0.5,
-3.722995, -3, -6.06422, 0, 1.5, 0.5, 0.5,
-3.722995, -2, -6.06422, 0, -0.5, 0.5, 0.5,
-3.722995, -2, -6.06422, 1, -0.5, 0.5, 0.5,
-3.722995, -2, -6.06422, 1, 1.5, 0.5, 0.5,
-3.722995, -2, -6.06422, 0, 1.5, 0.5, 0.5,
-3.722995, -1, -6.06422, 0, -0.5, 0.5, 0.5,
-3.722995, -1, -6.06422, 1, -0.5, 0.5, 0.5,
-3.722995, -1, -6.06422, 1, 1.5, 0.5, 0.5,
-3.722995, -1, -6.06422, 0, 1.5, 0.5, 0.5,
-3.722995, 0, -6.06422, 0, -0.5, 0.5, 0.5,
-3.722995, 0, -6.06422, 1, -0.5, 0.5, 0.5,
-3.722995, 0, -6.06422, 1, 1.5, 0.5, 0.5,
-3.722995, 0, -6.06422, 0, 1.5, 0.5, 0.5,
-3.722995, 1, -6.06422, 0, -0.5, 0.5, 0.5,
-3.722995, 1, -6.06422, 1, -0.5, 0.5, 0.5,
-3.722995, 1, -6.06422, 1, 1.5, 0.5, 0.5,
-3.722995, 1, -6.06422, 0, 1.5, 0.5, 0.5,
-3.722995, 2, -6.06422, 0, -0.5, 0.5, 0.5,
-3.722995, 2, -6.06422, 1, -0.5, 0.5, 0.5,
-3.722995, 2, -6.06422, 1, 1.5, 0.5, 0.5,
-3.722995, 2, -6.06422, 0, 1.5, 0.5, 0.5,
-3.722995, 3, -6.06422, 0, -0.5, 0.5, 0.5,
-3.722995, 3, -6.06422, 1, -0.5, 0.5, 0.5,
-3.722995, 3, -6.06422, 1, 1.5, 0.5, 0.5,
-3.722995, 3, -6.06422, 0, 1.5, 0.5, 0.5
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
-3.228736, -3.246726, -4,
-3.228736, -3.246726, 4,
-3.228736, -3.246726, -4,
-3.393489, -3.408641, -4,
-3.228736, -3.246726, -2,
-3.393489, -3.408641, -2,
-3.228736, -3.246726, 0,
-3.393489, -3.408641, 0,
-3.228736, -3.246726, 2,
-3.393489, -3.408641, 2,
-3.228736, -3.246726, 4,
-3.393489, -3.408641, 4
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
-3.722995, -3.732471, -4, 0, -0.5, 0.5, 0.5,
-3.722995, -3.732471, -4, 1, -0.5, 0.5, 0.5,
-3.722995, -3.732471, -4, 1, 1.5, 0.5, 0.5,
-3.722995, -3.732471, -4, 0, 1.5, 0.5, 0.5,
-3.722995, -3.732471, -2, 0, -0.5, 0.5, 0.5,
-3.722995, -3.732471, -2, 1, -0.5, 0.5, 0.5,
-3.722995, -3.732471, -2, 1, 1.5, 0.5, 0.5,
-3.722995, -3.732471, -2, 0, 1.5, 0.5, 0.5,
-3.722995, -3.732471, 0, 0, -0.5, 0.5, 0.5,
-3.722995, -3.732471, 0, 1, -0.5, 0.5, 0.5,
-3.722995, -3.732471, 0, 1, 1.5, 0.5, 0.5,
-3.722995, -3.732471, 0, 0, 1.5, 0.5, 0.5,
-3.722995, -3.732471, 2, 0, -0.5, 0.5, 0.5,
-3.722995, -3.732471, 2, 1, -0.5, 0.5, 0.5,
-3.722995, -3.732471, 2, 1, 1.5, 0.5, 0.5,
-3.722995, -3.732471, 2, 0, 1.5, 0.5, 0.5,
-3.722995, -3.732471, 4, 0, -0.5, 0.5, 0.5,
-3.722995, -3.732471, 4, 1, -0.5, 0.5, 0.5,
-3.722995, -3.732471, 4, 1, 1.5, 0.5, 0.5,
-3.722995, -3.732471, 4, 0, 1.5, 0.5, 0.5
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
-3.228736, -3.246726, -5.25804,
-3.228736, 3.22988, -5.25804,
-3.228736, -3.246726, 5.491025,
-3.228736, 3.22988, 5.491025,
-3.228736, -3.246726, -5.25804,
-3.228736, -3.246726, 5.491025,
-3.228736, 3.22988, -5.25804,
-3.228736, 3.22988, 5.491025,
-3.228736, -3.246726, -5.25804,
3.361386, -3.246726, -5.25804,
-3.228736, -3.246726, 5.491025,
3.361386, -3.246726, 5.491025,
-3.228736, 3.22988, -5.25804,
3.361386, 3.22988, -5.25804,
-3.228736, 3.22988, 5.491025,
3.361386, 3.22988, 5.491025,
3.361386, -3.246726, -5.25804,
3.361386, 3.22988, -5.25804,
3.361386, -3.246726, 5.491025,
3.361386, 3.22988, 5.491025,
3.361386, -3.246726, -5.25804,
3.361386, -3.246726, 5.491025,
3.361386, 3.22988, -5.25804,
3.361386, 3.22988, 5.491025
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
var radius = 7.568947;
var distance = 33.6751;
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
mvMatrix.translate( -0.06632495, 0.008422971, -0.1164923 );
mvMatrix.scale( 1.241812, 1.263577, 0.76134 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6751);
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
fenpropathrin<-read.table("fenpropathrin.xyz")
```

```
## Error in read.table("fenpropathrin.xyz"): no lines available in input
```

```r
x<-fenpropathrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpropathrin' not found
```

```r
y<-fenpropathrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpropathrin' not found
```

```r
z<-fenpropathrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpropathrin' not found
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
-3.132763, 0.8398206, -2.108887, 0, 0, 1, 1, 1,
-3.050793, 1.090208, 1.072548, 1, 0, 0, 1, 1,
-2.874932, 0.4223936, -0.2204418, 1, 0, 0, 1, 1,
-2.714526, 1.43924, -1.420386, 1, 0, 0, 1, 1,
-2.641309, 0.8731304, -0.9386551, 1, 0, 0, 1, 1,
-2.543866, -0.8594169, 0.2509556, 1, 0, 0, 1, 1,
-2.414047, 0.6333108, -2.273869, 0, 0, 0, 1, 1,
-2.369689, -1.258867, -2.013091, 0, 0, 0, 1, 1,
-2.362862, 0.3681504, -1.831683, 0, 0, 0, 1, 1,
-2.327406, 0.4048824, -3.105783, 0, 0, 0, 1, 1,
-2.307061, -0.8698024, -0.9788364, 0, 0, 0, 1, 1,
-2.277174, 1.317374, -2.034012, 0, 0, 0, 1, 1,
-2.273044, -1.141293, -2.072399, 0, 0, 0, 1, 1,
-2.215943, 0.5000499, -2.173779, 1, 1, 1, 1, 1,
-2.206153, -0.144605, -2.347398, 1, 1, 1, 1, 1,
-2.204651, 0.4089787, -1.620453, 1, 1, 1, 1, 1,
-2.19965, 0.9772484, -1.416195, 1, 1, 1, 1, 1,
-2.189616, -1.012733, -0.1217628, 1, 1, 1, 1, 1,
-2.16206, 0.742137, -0.9086422, 1, 1, 1, 1, 1,
-2.113879, 0.821195, -1.890315, 1, 1, 1, 1, 1,
-2.104493, 1.024279, 0.3570881, 1, 1, 1, 1, 1,
-2.104, -0.7822469, -2.357446, 1, 1, 1, 1, 1,
-2.034269, -0.6218849, -3.102302, 1, 1, 1, 1, 1,
-1.996641, 0.6079476, -1.728194, 1, 1, 1, 1, 1,
-1.962147, -0.719477, -2.005574, 1, 1, 1, 1, 1,
-1.95311, 0.2192127, -2.596044, 1, 1, 1, 1, 1,
-1.939039, -0.5401092, -3.467204, 1, 1, 1, 1, 1,
-1.912946, 0.2703189, -1.309229, 1, 1, 1, 1, 1,
-1.908469, -0.6630571, -3.760582, 0, 0, 1, 1, 1,
-1.880784, 1.743687, -2.183453, 1, 0, 0, 1, 1,
-1.880185, 0.7546268, -2.570886, 1, 0, 0, 1, 1,
-1.874602, -1.3951, -1.764913, 1, 0, 0, 1, 1,
-1.867645, -0.7943643, -2.194684, 1, 0, 0, 1, 1,
-1.863911, -0.1053215, -1.050726, 1, 0, 0, 1, 1,
-1.863004, 0.282729, -0.1131921, 0, 0, 0, 1, 1,
-1.849553, -1.780509, -2.728625, 0, 0, 0, 1, 1,
-1.833775, 0.4889583, -1.847619, 0, 0, 0, 1, 1,
-1.829725, 0.9042302, -1.346621, 0, 0, 0, 1, 1,
-1.829017, 0.9896812, -0.4300814, 0, 0, 0, 1, 1,
-1.827578, -0.4517249, -1.786228, 0, 0, 0, 1, 1,
-1.82213, -0.6108291, -2.190341, 0, 0, 0, 1, 1,
-1.807355, -1.347413, -4.012638, 1, 1, 1, 1, 1,
-1.790503, -1.764592, -2.529875, 1, 1, 1, 1, 1,
-1.783777, -0.3675403, -1.996067, 1, 1, 1, 1, 1,
-1.775291, 0.8729385, -1.511231, 1, 1, 1, 1, 1,
-1.74257, 0.257638, -1.221935, 1, 1, 1, 1, 1,
-1.736992, -0.6100258, -2.152714, 1, 1, 1, 1, 1,
-1.734482, 0.09139052, 0.1486635, 1, 1, 1, 1, 1,
-1.7195, -0.2352454, -1.298021, 1, 1, 1, 1, 1,
-1.691839, -0.2033541, -1.942357, 1, 1, 1, 1, 1,
-1.680222, -0.6501146, -1.655095, 1, 1, 1, 1, 1,
-1.653335, 0.3261676, -0.845481, 1, 1, 1, 1, 1,
-1.6505, 0.1892629, -1.201196, 1, 1, 1, 1, 1,
-1.631951, 0.3477436, -2.966542, 1, 1, 1, 1, 1,
-1.631513, -1.141132, -1.581016, 1, 1, 1, 1, 1,
-1.625671, -1.330537, -2.21162, 1, 1, 1, 1, 1,
-1.61493, 1.886824, -1.509861, 0, 0, 1, 1, 1,
-1.608158, 0.4023941, -1.302307, 1, 0, 0, 1, 1,
-1.597498, 0.2072378, -0.3005121, 1, 0, 0, 1, 1,
-1.575278, -1.28009, -2.801377, 1, 0, 0, 1, 1,
-1.565307, -0.691955, -1.564118, 1, 0, 0, 1, 1,
-1.550956, 0.188907, -3.216544, 1, 0, 0, 1, 1,
-1.537857, 1.60501, -1.114245, 0, 0, 0, 1, 1,
-1.529697, 1.260111, -0.2472101, 0, 0, 0, 1, 1,
-1.512381, 1.830835, -0.119115, 0, 0, 0, 1, 1,
-1.506214, 1.369572, -0.1903955, 0, 0, 0, 1, 1,
-1.496249, -0.04489304, -2.949898, 0, 0, 0, 1, 1,
-1.47445, 2.090357, -0.2018328, 0, 0, 0, 1, 1,
-1.473501, -1.524041, -0.9039595, 0, 0, 0, 1, 1,
-1.470788, -1.144733, -1.80511, 1, 1, 1, 1, 1,
-1.469901, -1.081043, -3.340136, 1, 1, 1, 1, 1,
-1.460852, -0.6810775, -4.178541, 1, 1, 1, 1, 1,
-1.455037, -0.5430719, -2.678528, 1, 1, 1, 1, 1,
-1.447271, 0.04626643, -2.424267, 1, 1, 1, 1, 1,
-1.444189, -0.4881272, -0.3072944, 1, 1, 1, 1, 1,
-1.437383, 0.4292993, -1.908851, 1, 1, 1, 1, 1,
-1.436577, -0.4159012, -1.767201, 1, 1, 1, 1, 1,
-1.436159, -0.3894138, -2.056052, 1, 1, 1, 1, 1,
-1.434478, 0.1738764, -0.3574796, 1, 1, 1, 1, 1,
-1.413412, 0.3072036, -1.801267, 1, 1, 1, 1, 1,
-1.405696, 0.6930315, -1.562128, 1, 1, 1, 1, 1,
-1.402326, 1.988299, 1.022157, 1, 1, 1, 1, 1,
-1.400183, 0.209103, -0.9287897, 1, 1, 1, 1, 1,
-1.385841, -1.198895, -2.105276, 1, 1, 1, 1, 1,
-1.365293, -1.744943, -2.283529, 0, 0, 1, 1, 1,
-1.358651, -0.1836262, 0.1515873, 1, 0, 0, 1, 1,
-1.341765, -0.3736601, -2.299384, 1, 0, 0, 1, 1,
-1.338977, -0.9431871, -3.054481, 1, 0, 0, 1, 1,
-1.322171, -0.6592075, -2.181181, 1, 0, 0, 1, 1,
-1.321995, 1.131433, 0.7215317, 1, 0, 0, 1, 1,
-1.316825, -0.05298441, -0.6751201, 0, 0, 0, 1, 1,
-1.315708, -0.3231689, -1.911183, 0, 0, 0, 1, 1,
-1.312446, -1.201109, -1.420473, 0, 0, 0, 1, 1,
-1.312065, 0.1225079, -1.251777, 0, 0, 0, 1, 1,
-1.30755, -0.258303, -2.282494, 0, 0, 0, 1, 1,
-1.303154, 0.6252574, 0.4239327, 0, 0, 0, 1, 1,
-1.298104, -1.129099, -2.180914, 0, 0, 0, 1, 1,
-1.297097, -0.2903467, -0.2816597, 1, 1, 1, 1, 1,
-1.274502, -0.300648, -1.126074, 1, 1, 1, 1, 1,
-1.272975, 1.279846, -1.237183, 1, 1, 1, 1, 1,
-1.271594, -0.1892695, -2.040128, 1, 1, 1, 1, 1,
-1.271379, 0.4891005, -0.7955406, 1, 1, 1, 1, 1,
-1.258147, 1.052174, -1.04522, 1, 1, 1, 1, 1,
-1.25314, -1.420536, -2.9833, 1, 1, 1, 1, 1,
-1.238531, -0.2386232, -0.6718581, 1, 1, 1, 1, 1,
-1.238056, 0.7552145, -0.3280827, 1, 1, 1, 1, 1,
-1.237128, 0.6285545, -1.866466, 1, 1, 1, 1, 1,
-1.236328, 0.6172988, -1.580076, 1, 1, 1, 1, 1,
-1.235025, -0.000217112, -1.595444, 1, 1, 1, 1, 1,
-1.231297, 0.4621114, -0.9618438, 1, 1, 1, 1, 1,
-1.229475, -1.176066, -1.356893, 1, 1, 1, 1, 1,
-1.221582, -0.7091769, -1.301922, 1, 1, 1, 1, 1,
-1.218558, 0.3765853, -1.502431, 0, 0, 1, 1, 1,
-1.218464, 0.05959186, -3.006368, 1, 0, 0, 1, 1,
-1.20949, -0.06520312, -1.673245, 1, 0, 0, 1, 1,
-1.204613, 1.462068, -1.467898, 1, 0, 0, 1, 1,
-1.20227, -1.726631, -2.173024, 1, 0, 0, 1, 1,
-1.202032, -2.380089, -2.763495, 1, 0, 0, 1, 1,
-1.199011, -0.172594, -0.5446945, 0, 0, 0, 1, 1,
-1.197614, -0.1166175, -0.2895173, 0, 0, 0, 1, 1,
-1.193628, -0.7177567, -2.551, 0, 0, 0, 1, 1,
-1.190941, 1.855153, 0.6621234, 0, 0, 0, 1, 1,
-1.18505, 2.023133, -0.5389161, 0, 0, 0, 1, 1,
-1.179373, 1.666675, -0.1135348, 0, 0, 0, 1, 1,
-1.172023, 0.255705, -1.8725, 0, 0, 0, 1, 1,
-1.17123, 0.6254422, -1.49106, 1, 1, 1, 1, 1,
-1.163344, 1.963693, -0.8610839, 1, 1, 1, 1, 1,
-1.152428, 0.8929292, -1.204357, 1, 1, 1, 1, 1,
-1.150368, 0.880733, -1.813214, 1, 1, 1, 1, 1,
-1.149374, -0.6790105, -2.322817, 1, 1, 1, 1, 1,
-1.145748, 0.312315, -1.903196, 1, 1, 1, 1, 1,
-1.135954, 1.685962, 0.7272764, 1, 1, 1, 1, 1,
-1.135675, -0.9300141, -1.453835, 1, 1, 1, 1, 1,
-1.132778, 1.107166, 0.3763429, 1, 1, 1, 1, 1,
-1.127688, -1.225078, -3.236648, 1, 1, 1, 1, 1,
-1.124432, -0.5738646, -1.597813, 1, 1, 1, 1, 1,
-1.113547, 0.8640116, -0.1913234, 1, 1, 1, 1, 1,
-1.110725, -0.9261912, -2.111257, 1, 1, 1, 1, 1,
-1.107154, -0.4524304, -3.636341, 1, 1, 1, 1, 1,
-1.102121, 1.581991, 0.00628614, 1, 1, 1, 1, 1,
-1.100951, -0.6092131, -3.466198, 0, 0, 1, 1, 1,
-1.09248, 0.3264369, -1.569404, 1, 0, 0, 1, 1,
-1.074533, -0.08437142, -2.97932, 1, 0, 0, 1, 1,
-1.064154, 1.51619, -4.615075, 1, 0, 0, 1, 1,
-1.058654, 0.8006573, -2.860818, 1, 0, 0, 1, 1,
-1.055579, 0.4707293, -1.075963, 1, 0, 0, 1, 1,
-1.055316, 0.6621683, -1.417345, 0, 0, 0, 1, 1,
-1.052316, 0.3477555, 1.081901, 0, 0, 0, 1, 1,
-1.047385, 0.3086076, -0.9189004, 0, 0, 0, 1, 1,
-1.043976, -0.3948526, -1.317782, 0, 0, 0, 1, 1,
-1.040804, 0.8619977, 0.4191608, 0, 0, 0, 1, 1,
-1.038327, -1.661233, -1.825346, 0, 0, 0, 1, 1,
-1.032735, -0.9932044, -2.338737, 0, 0, 0, 1, 1,
-1.032415, -1.742866, -2.56966, 1, 1, 1, 1, 1,
-1.027023, -1.271971, -1.131644, 1, 1, 1, 1, 1,
-1.024486, 0.2578018, -1.100306, 1, 1, 1, 1, 1,
-1.014874, -2.243192, -3.291166, 1, 1, 1, 1, 1,
-0.9966177, -0.8574459, -3.45618, 1, 1, 1, 1, 1,
-0.9953755, 1.228587, -0.9006547, 1, 1, 1, 1, 1,
-0.9939563, -0.7792983, -2.779651, 1, 1, 1, 1, 1,
-0.9870905, -1.576158, -1.930926, 1, 1, 1, 1, 1,
-0.9804936, 0.536139, -1.861825, 1, 1, 1, 1, 1,
-0.9781263, 1.049929, -2.205638, 1, 1, 1, 1, 1,
-0.9589628, -0.320201, -1.274464, 1, 1, 1, 1, 1,
-0.955312, 0.95112, -1.040442, 1, 1, 1, 1, 1,
-0.9389495, 0.1969286, 0.2533177, 1, 1, 1, 1, 1,
-0.9296922, 0.1114071, -3.080552, 1, 1, 1, 1, 1,
-0.9291698, -0.2879161, -2.283246, 1, 1, 1, 1, 1,
-0.9225224, 0.1324288, -1.65483, 0, 0, 1, 1, 1,
-0.9206653, -3.152406, -3.579518, 1, 0, 0, 1, 1,
-0.9198422, -0.3323936, -2.178118, 1, 0, 0, 1, 1,
-0.9190368, 1.503005, -0.7451241, 1, 0, 0, 1, 1,
-0.9174758, 1.382856, -0.09215675, 1, 0, 0, 1, 1,
-0.9173509, 0.5441195, 0.5063158, 1, 0, 0, 1, 1,
-0.9173483, 0.7974832, -1.319988, 0, 0, 0, 1, 1,
-0.9144972, -0.1651417, -1.95421, 0, 0, 0, 1, 1,
-0.9025654, 0.5333643, -0.4398086, 0, 0, 0, 1, 1,
-0.9021259, 0.2860034, -1.803478, 0, 0, 0, 1, 1,
-0.8940763, -0.06866376, -2.071866, 0, 0, 0, 1, 1,
-0.8937009, -0.6589942, -2.132332, 0, 0, 0, 1, 1,
-0.8913969, -0.2295283, -2.012708, 0, 0, 0, 1, 1,
-0.8852199, 0.2110873, -1.135132, 1, 1, 1, 1, 1,
-0.8840891, -0.9737434, -1.2548, 1, 1, 1, 1, 1,
-0.8817575, 1.127555, -0.9984066, 1, 1, 1, 1, 1,
-0.8786716, -0.7697248, -3.222898, 1, 1, 1, 1, 1,
-0.876175, 0.1151095, -2.152545, 1, 1, 1, 1, 1,
-0.8742673, 2.302821, -1.023974, 1, 1, 1, 1, 1,
-0.8710886, -0.2414391, -0.9854974, 1, 1, 1, 1, 1,
-0.8643617, -1.625956, -2.886469, 1, 1, 1, 1, 1,
-0.8629289, -0.8693116, -3.271606, 1, 1, 1, 1, 1,
-0.8621119, -0.6382285, -2.714186, 1, 1, 1, 1, 1,
-0.861586, 1.311667, 0.1651626, 1, 1, 1, 1, 1,
-0.8567727, -2.430005, -2.015448, 1, 1, 1, 1, 1,
-0.854121, 0.81104, 1.579883, 1, 1, 1, 1, 1,
-0.8539528, -0.251962, -2.802416, 1, 1, 1, 1, 1,
-0.8455231, 0.08361331, -1.634257, 1, 1, 1, 1, 1,
-0.8417383, -0.2205641, -2.216513, 0, 0, 1, 1, 1,
-0.8404921, -1.081339, -4.852657, 1, 0, 0, 1, 1,
-0.8402225, -0.5187102, -3.133971, 1, 0, 0, 1, 1,
-0.8384908, 0.58161, 0.366132, 1, 0, 0, 1, 1,
-0.8367623, 1.954827, -1.797501, 1, 0, 0, 1, 1,
-0.8333421, -0.1617667, -1.375924, 1, 0, 0, 1, 1,
-0.8292302, -0.01445876, -1.727832, 0, 0, 0, 1, 1,
-0.8290967, 0.2305234, -0.9722319, 0, 0, 0, 1, 1,
-0.8275911, -1.4087, -2.157637, 0, 0, 0, 1, 1,
-0.8270703, -0.03374646, -0.4356314, 0, 0, 0, 1, 1,
-0.8266461, -2.501127, -1.579684, 0, 0, 0, 1, 1,
-0.8252078, 0.276265, -2.881223, 0, 0, 0, 1, 1,
-0.821477, 0.5970967, -2.009315, 0, 0, 0, 1, 1,
-0.8178136, -0.1283006, -2.270735, 1, 1, 1, 1, 1,
-0.8171037, -0.4889022, -1.21299, 1, 1, 1, 1, 1,
-0.813522, -0.06205816, -2.231456, 1, 1, 1, 1, 1,
-0.8120845, 2.639453, 2.648718, 1, 1, 1, 1, 1,
-0.8112784, 0.1367686, -0.9062855, 1, 1, 1, 1, 1,
-0.8089881, -0.9291054, -1.978961, 1, 1, 1, 1, 1,
-0.8037316, -0.9734599, -3.05085, 1, 1, 1, 1, 1,
-0.7956854, 0.8268718, -1.010212, 1, 1, 1, 1, 1,
-0.7905506, -0.4355415, -3.125705, 1, 1, 1, 1, 1,
-0.7846909, -1.321627, -2.713405, 1, 1, 1, 1, 1,
-0.7833616, -2.380581, -3.505725, 1, 1, 1, 1, 1,
-0.7815879, -1.597616, -1.641476, 1, 1, 1, 1, 1,
-0.7799829, -0.6631874, -1.568652, 1, 1, 1, 1, 1,
-0.775517, 0.14777, -2.582618, 1, 1, 1, 1, 1,
-0.7730756, 0.1509829, 0.8785127, 1, 1, 1, 1, 1,
-0.7709538, 1.215057, -2.072872, 0, 0, 1, 1, 1,
-0.7666969, 1.166332, -2.240684, 1, 0, 0, 1, 1,
-0.7662507, 0.7978228, -0.8745986, 1, 0, 0, 1, 1,
-0.7655737, -1.273203, -2.425372, 1, 0, 0, 1, 1,
-0.7576725, -0.3100318, -2.503314, 1, 0, 0, 1, 1,
-0.7540714, 1.040979, -0.6658799, 1, 0, 0, 1, 1,
-0.7483338, 0.2015147, -1.197433, 0, 0, 0, 1, 1,
-0.7469273, -0.9910929, -1.78464, 0, 0, 0, 1, 1,
-0.7452941, 0.7510952, -0.282076, 0, 0, 0, 1, 1,
-0.7442567, 0.09724642, -0.5982582, 0, 0, 0, 1, 1,
-0.7417713, -0.2776351, -0.1856725, 0, 0, 0, 1, 1,
-0.7306983, -0.2411683, -2.463101, 0, 0, 0, 1, 1,
-0.7302794, 1.207649, -1.009543, 0, 0, 0, 1, 1,
-0.7269121, 1.315924, -0.9653971, 1, 1, 1, 1, 1,
-0.7247003, 1.17044, 0.5700622, 1, 1, 1, 1, 1,
-0.7235644, -1.579527, -1.0429, 1, 1, 1, 1, 1,
-0.7227699, -1.783308, -3.458704, 1, 1, 1, 1, 1,
-0.7204102, -0.961082, -3.056422, 1, 1, 1, 1, 1,
-0.7179508, 0.6738271, 0.314663, 1, 1, 1, 1, 1,
-0.7169251, -0.7912652, -3.161487, 1, 1, 1, 1, 1,
-0.7089635, -0.8384287, -2.152836, 1, 1, 1, 1, 1,
-0.7079241, 1.244199, -0.4192034, 1, 1, 1, 1, 1,
-0.7057827, -0.3885852, -0.694349, 1, 1, 1, 1, 1,
-0.7056733, 1.179951, -1.600743, 1, 1, 1, 1, 1,
-0.7030712, 0.03655395, -2.20736, 1, 1, 1, 1, 1,
-0.7023478, 0.5847368, 0.5760975, 1, 1, 1, 1, 1,
-0.7014766, 0.4773517, -2.020234, 1, 1, 1, 1, 1,
-0.6997334, 0.4427365, -0.4066931, 1, 1, 1, 1, 1,
-0.6919194, -0.8116649, -2.467983, 0, 0, 1, 1, 1,
-0.6852722, 0.6556799, -1.102905, 1, 0, 0, 1, 1,
-0.6754889, 0.5943822, -2.629064, 1, 0, 0, 1, 1,
-0.6737332, 0.1912833, 0.9827428, 1, 0, 0, 1, 1,
-0.6709412, 0.4289891, -0.8951574, 1, 0, 0, 1, 1,
-0.6689504, -1.204502, -2.003708, 1, 0, 0, 1, 1,
-0.6651238, 0.02364791, -0.8009952, 0, 0, 0, 1, 1,
-0.6518382, 0.6018236, -0.41946, 0, 0, 0, 1, 1,
-0.6491386, -0.7889172, -1.617245, 0, 0, 0, 1, 1,
-0.6458726, 0.7793639, 0.5473228, 0, 0, 0, 1, 1,
-0.6380476, -0.7188169, -2.587788, 0, 0, 0, 1, 1,
-0.6337588, 0.0410947, -3.020481, 0, 0, 0, 1, 1,
-0.6322274, 0.648471, -0.5298305, 0, 0, 0, 1, 1,
-0.623478, -0.2033808, -2.122787, 1, 1, 1, 1, 1,
-0.6211103, 0.9841539, -1.508207, 1, 1, 1, 1, 1,
-0.6210834, 1.122156, -0.6891195, 1, 1, 1, 1, 1,
-0.6194982, 0.7050495, -1.276412, 1, 1, 1, 1, 1,
-0.6172155, -0.8250753, -1.562143, 1, 1, 1, 1, 1,
-0.6163135, 0.6579916, -3.824513, 1, 1, 1, 1, 1,
-0.615585, -0.6400388, -3.102834, 1, 1, 1, 1, 1,
-0.6146114, 0.5574104, -0.4136073, 1, 1, 1, 1, 1,
-0.6078408, 0.6314056, -0.6419802, 1, 1, 1, 1, 1,
-0.6073839, -0.9744456, -2.88643, 1, 1, 1, 1, 1,
-0.6073387, -0.9499378, -3.77798, 1, 1, 1, 1, 1,
-0.6048658, -1.655125, -1.955465, 1, 1, 1, 1, 1,
-0.6010079, 2.187313, 1.283998, 1, 1, 1, 1, 1,
-0.5955884, -1.29586, -0.9688854, 1, 1, 1, 1, 1,
-0.5938026, 0.5771492, -1.324275, 1, 1, 1, 1, 1,
-0.5930812, 2.273905, 0.2104343, 0, 0, 1, 1, 1,
-0.5829644, 0.4863435, 1.203708, 1, 0, 0, 1, 1,
-0.581194, 0.4398079, -0.3942118, 1, 0, 0, 1, 1,
-0.579795, -0.3418882, -0.4728826, 1, 0, 0, 1, 1,
-0.5783113, -0.08899806, -3.624526, 1, 0, 0, 1, 1,
-0.5684083, -0.4044584, -1.926615, 1, 0, 0, 1, 1,
-0.5651081, 1.663403, -0.7466164, 0, 0, 0, 1, 1,
-0.5587885, 0.3050004, -1.629211, 0, 0, 0, 1, 1,
-0.5563704, 0.2929233, -1.756047, 0, 0, 0, 1, 1,
-0.5527679, 0.3657268, -0.3877421, 0, 0, 0, 1, 1,
-0.5483925, -0.4389963, -1.555061, 0, 0, 0, 1, 1,
-0.5428374, -0.4494155, -2.91324, 0, 0, 0, 1, 1,
-0.5410409, 0.2354068, -2.789037, 0, 0, 0, 1, 1,
-0.5325178, 2.619096, 0.2542161, 1, 1, 1, 1, 1,
-0.5236537, -0.2194107, -1.507337, 1, 1, 1, 1, 1,
-0.5211706, -0.5244109, -1.516573, 1, 1, 1, 1, 1,
-0.5193137, -0.9607831, -2.634045, 1, 1, 1, 1, 1,
-0.5178733, 0.7947091, 0.03228243, 1, 1, 1, 1, 1,
-0.5146269, -0.9027577, -2.678612, 1, 1, 1, 1, 1,
-0.5109385, -0.7959962, -2.838931, 1, 1, 1, 1, 1,
-0.5080433, -0.9597258, -1.384773, 1, 1, 1, 1, 1,
-0.5054922, -0.5071416, -1.519974, 1, 1, 1, 1, 1,
-0.5053065, 0.4768038, -2.293291, 1, 1, 1, 1, 1,
-0.5043472, 0.5717522, -1.841459, 1, 1, 1, 1, 1,
-0.4998957, -1.250308, -1.919803, 1, 1, 1, 1, 1,
-0.4965243, -0.580368, -1.457594, 1, 1, 1, 1, 1,
-0.4939264, 1.366336, -0.3440551, 1, 1, 1, 1, 1,
-0.4927856, -0.2101424, -0.9497587, 1, 1, 1, 1, 1,
-0.4917131, -0.5936048, -1.442454, 0, 0, 1, 1, 1,
-0.4765085, -2.066126, -3.572376, 1, 0, 0, 1, 1,
-0.4756084, -0.521213, -1.930309, 1, 0, 0, 1, 1,
-0.4745648, -1.411127, -3.646174, 1, 0, 0, 1, 1,
-0.47114, -0.003718218, -1.989325, 1, 0, 0, 1, 1,
-0.4693531, 0.2825847, -1.929309, 1, 0, 0, 1, 1,
-0.4689616, 0.2842665, -1.583885, 0, 0, 0, 1, 1,
-0.4650304, 2.813499, 0.8636391, 0, 0, 0, 1, 1,
-0.4624302, -0.7087619, -1.936538, 0, 0, 0, 1, 1,
-0.4619619, -0.837051, -4.023985, 0, 0, 0, 1, 1,
-0.4605713, 0.3825053, -1.200881, 0, 0, 0, 1, 1,
-0.4601736, -1.229517, -2.856256, 0, 0, 0, 1, 1,
-0.4600036, 0.8557257, -0.8042519, 0, 0, 0, 1, 1,
-0.4586304, 1.795785, -0.2788436, 1, 1, 1, 1, 1,
-0.4417384, -2.021781, -3.032781, 1, 1, 1, 1, 1,
-0.4414646, -0.7755743, -2.772298, 1, 1, 1, 1, 1,
-0.4410822, -1.297477, -2.510951, 1, 1, 1, 1, 1,
-0.4364699, -1.221993, -5.101501, 1, 1, 1, 1, 1,
-0.4343881, -1.253476, -2.152726, 1, 1, 1, 1, 1,
-0.4211165, 0.4856767, -0.3154703, 1, 1, 1, 1, 1,
-0.4202306, -0.6017259, -2.744499, 1, 1, 1, 1, 1,
-0.4160195, 0.5130436, -1.993169, 1, 1, 1, 1, 1,
-0.4122119, -0.1388232, -2.801377, 1, 1, 1, 1, 1,
-0.4121938, 0.04369603, -2.470647, 1, 1, 1, 1, 1,
-0.4110972, -1.260229, -3.382918, 1, 1, 1, 1, 1,
-0.4106845, 0.2548521, -0.8743578, 1, 1, 1, 1, 1,
-0.4087138, -1.719725, -2.944452, 1, 1, 1, 1, 1,
-0.4076596, -1.561194, -4.936469, 1, 1, 1, 1, 1,
-0.404299, 0.4294889, -1.045264, 0, 0, 1, 1, 1,
-0.40389, -0.3692095, -1.247838, 1, 0, 0, 1, 1,
-0.402506, 0.1838275, -2.619945, 1, 0, 0, 1, 1,
-0.4016201, 0.0491814, 0.0362263, 1, 0, 0, 1, 1,
-0.4012457, 0.300212, 0.6202781, 1, 0, 0, 1, 1,
-0.3989665, 0.0969099, -1.566637, 1, 0, 0, 1, 1,
-0.3980658, 1.591733, -0.1540988, 0, 0, 0, 1, 1,
-0.3924565, -0.4753831, -1.199563, 0, 0, 0, 1, 1,
-0.3849997, 0.6560119, 0.2231481, 0, 0, 0, 1, 1,
-0.3829803, 1.337659, 1.471914, 0, 0, 0, 1, 1,
-0.3813407, 2.297712, 1.893196, 0, 0, 0, 1, 1,
-0.3806292, 0.02645671, -1.790408, 0, 0, 0, 1, 1,
-0.379294, -2.613992, -3.641322, 0, 0, 0, 1, 1,
-0.3763262, -0.1788553, -2.035277, 1, 1, 1, 1, 1,
-0.3727292, 1.470472, 0.6390736, 1, 1, 1, 1, 1,
-0.3724728, -0.230073, -0.8431386, 1, 1, 1, 1, 1,
-0.3707723, -0.8408047, -2.654545, 1, 1, 1, 1, 1,
-0.3650301, -0.5177178, -2.125608, 1, 1, 1, 1, 1,
-0.3618233, -0.9015641, -3.11935, 1, 1, 1, 1, 1,
-0.3613839, 1.49334, 0.6173705, 1, 1, 1, 1, 1,
-0.3526954, 1.079877, -0.3865539, 1, 1, 1, 1, 1,
-0.3474978, 0.208072, -0.08386641, 1, 1, 1, 1, 1,
-0.3454185, -0.4032061, -2.221914, 1, 1, 1, 1, 1,
-0.343996, -0.7978323, -1.972349, 1, 1, 1, 1, 1,
-0.3388076, 1.599371, -0.3702449, 1, 1, 1, 1, 1,
-0.3357508, -0.9588145, -2.795863, 1, 1, 1, 1, 1,
-0.3334615, -0.9615588, -3.657317, 1, 1, 1, 1, 1,
-0.3292643, -1.108135, -3.459726, 1, 1, 1, 1, 1,
-0.3282716, -0.6270195, -3.47651, 0, 0, 1, 1, 1,
-0.3215636, -0.4584854, -0.8501343, 1, 0, 0, 1, 1,
-0.3187058, -0.2443035, -1.289092, 1, 0, 0, 1, 1,
-0.3166688, -0.9462843, -1.908985, 1, 0, 0, 1, 1,
-0.3142169, -2.908447, -4.333243, 1, 0, 0, 1, 1,
-0.3082129, -0.1696472, -1.772401, 1, 0, 0, 1, 1,
-0.3067704, -0.003682214, -1.905169, 0, 0, 0, 1, 1,
-0.3046411, -1.55005, -4.571282, 0, 0, 0, 1, 1,
-0.3012234, -1.563589, -2.830647, 0, 0, 0, 1, 1,
-0.2990343, -0.4801835, -2.709266, 0, 0, 0, 1, 1,
-0.2960445, 0.4748721, -0.2925099, 0, 0, 0, 1, 1,
-0.2954803, 1.912905, -0.1830405, 0, 0, 0, 1, 1,
-0.2899516, -0.03721561, -0.8381804, 0, 0, 0, 1, 1,
-0.2894403, 1.05325, -0.3981787, 1, 1, 1, 1, 1,
-0.2872568, -0.7151858, -2.162283, 1, 1, 1, 1, 1,
-0.2810597, -0.2301763, -2.024076, 1, 1, 1, 1, 1,
-0.2806413, -0.01199193, -2.021124, 1, 1, 1, 1, 1,
-0.2799886, 0.2936017, 0.3755945, 1, 1, 1, 1, 1,
-0.2788483, -0.6982116, -0.8005366, 1, 1, 1, 1, 1,
-0.2783138, 0.4147579, 0.7127381, 1, 1, 1, 1, 1,
-0.2778879, 0.09332241, -0.8564673, 1, 1, 1, 1, 1,
-0.2775339, -2.489066, -3.04086, 1, 1, 1, 1, 1,
-0.2762569, 0.496176, -0.5861358, 1, 1, 1, 1, 1,
-0.2752952, -0.2089038, -1.933819, 1, 1, 1, 1, 1,
-0.2744986, -1.535754, -3.648347, 1, 1, 1, 1, 1,
-0.2717468, -1.40503, -3.333957, 1, 1, 1, 1, 1,
-0.2699422, -0.5261063, -1.774055, 1, 1, 1, 1, 1,
-0.266653, 1.244801, 0.3267924, 1, 1, 1, 1, 1,
-0.2643105, -0.3070713, -2.769813, 0, 0, 1, 1, 1,
-0.2639402, 0.2270719, -0.8090224, 1, 0, 0, 1, 1,
-0.2633766, 0.6638901, 0.7634213, 1, 0, 0, 1, 1,
-0.2595957, 0.4031243, -0.3045036, 1, 0, 0, 1, 1,
-0.2586897, -0.5735604, -3.912871, 1, 0, 0, 1, 1,
-0.2572013, -1.152771, -2.838236, 1, 0, 0, 1, 1,
-0.2552365, -0.006923565, -3.687113, 0, 0, 0, 1, 1,
-0.253612, -0.144013, -2.349404, 0, 0, 0, 1, 1,
-0.2510236, -0.003122441, -4.404216, 0, 0, 0, 1, 1,
-0.251014, -0.4842992, -2.092623, 0, 0, 0, 1, 1,
-0.2497719, -1.397424, -3.338595, 0, 0, 0, 1, 1,
-0.2494421, 0.3122748, -0.5173976, 0, 0, 0, 1, 1,
-0.2428814, 2.303947, 0.2114614, 0, 0, 0, 1, 1,
-0.242491, -0.207662, -3.220687, 1, 1, 1, 1, 1,
-0.2402162, -1.465129, -3.112312, 1, 1, 1, 1, 1,
-0.2368972, -1.028427, -3.27525, 1, 1, 1, 1, 1,
-0.2345488, -0.5829655, -1.623129, 1, 1, 1, 1, 1,
-0.2324624, 0.6366069, 1.139316, 1, 1, 1, 1, 1,
-0.2324611, 1.370311, 0.6194005, 1, 1, 1, 1, 1,
-0.2303955, -0.426466, -1.044653, 1, 1, 1, 1, 1,
-0.2268288, 0.2042033, -0.7311147, 1, 1, 1, 1, 1,
-0.216689, -0.2599913, -4.588321, 1, 1, 1, 1, 1,
-0.2164493, 0.8250476, -0.6693073, 1, 1, 1, 1, 1,
-0.2139167, 1.139688, -0.7609962, 1, 1, 1, 1, 1,
-0.2099328, 0.1694451, -2.368508, 1, 1, 1, 1, 1,
-0.2074669, 1.303992, 0.6402747, 1, 1, 1, 1, 1,
-0.2044834, 0.2307269, -0.6602266, 1, 1, 1, 1, 1,
-0.1983929, -0.697408, -2.455284, 1, 1, 1, 1, 1,
-0.1928989, -0.0913271, -1.852595, 0, 0, 1, 1, 1,
-0.1927039, 1.070006, 1.240996, 1, 0, 0, 1, 1,
-0.1906079, 1.07941, -0.8083041, 1, 0, 0, 1, 1,
-0.1895435, 0.2659579, -0.9635511, 1, 0, 0, 1, 1,
-0.1885185, -0.5216043, -2.823056, 1, 0, 0, 1, 1,
-0.1776525, 1.169705, -0.2540831, 1, 0, 0, 1, 1,
-0.175065, -0.997363, -2.940789, 0, 0, 0, 1, 1,
-0.1735231, -1.571361, -3.805885, 0, 0, 0, 1, 1,
-0.1733398, -0.1110553, -1.909374, 0, 0, 0, 1, 1,
-0.1714984, 1.259173, 0.6214548, 0, 0, 0, 1, 1,
-0.170273, -0.3783353, -2.371725, 0, 0, 0, 1, 1,
-0.1698675, -1.306224, -3.840896, 0, 0, 0, 1, 1,
-0.1695411, -1.165352, -3.206126, 0, 0, 0, 1, 1,
-0.1659967, 1.620877, 0.5345047, 1, 1, 1, 1, 1,
-0.1640173, 1.043974, 0.9326752, 1, 1, 1, 1, 1,
-0.1608077, 1.808383, -0.6557654, 1, 1, 1, 1, 1,
-0.1582605, 0.182245, -2.039733, 1, 1, 1, 1, 1,
-0.1573989, -0.7504796, -1.747163, 1, 1, 1, 1, 1,
-0.1500386, 0.6979105, 1.050528, 1, 1, 1, 1, 1,
-0.1485307, 0.144001, 0.2116183, 1, 1, 1, 1, 1,
-0.1480041, -0.39632, -1.886623, 1, 1, 1, 1, 1,
-0.1463008, -1.198165, -2.14237, 1, 1, 1, 1, 1,
-0.1454738, 0.6509703, -1.622105, 1, 1, 1, 1, 1,
-0.1450822, 2.093355, 1.43874, 1, 1, 1, 1, 1,
-0.1427635, 0.7839528, -0.7686542, 1, 1, 1, 1, 1,
-0.1418145, 0.6487425, 0.8810956, 1, 1, 1, 1, 1,
-0.1400967, 1.894526, 0.1042375, 1, 1, 1, 1, 1,
-0.1400669, 0.6866397, -1.324059, 1, 1, 1, 1, 1,
-0.1400006, 1.840927, -0.1679098, 0, 0, 1, 1, 1,
-0.1375386, 0.004325613, -3.400898, 1, 0, 0, 1, 1,
-0.1334537, -0.7884797, -3.472001, 1, 0, 0, 1, 1,
-0.1316828, -0.5911105, -2.813477, 1, 0, 0, 1, 1,
-0.1300849, 0.8677061, 0.3868243, 1, 0, 0, 1, 1,
-0.1270819, -2.631675, -1.813408, 1, 0, 0, 1, 1,
-0.1240502, -0.7892023, -3.286356, 0, 0, 0, 1, 1,
-0.1224011, -0.8199841, -1.231978, 0, 0, 0, 1, 1,
-0.1218016, 0.2251266, -0.7566909, 0, 0, 0, 1, 1,
-0.1199417, -0.9413958, -3.706394, 0, 0, 0, 1, 1,
-0.1196921, -0.2284658, -0.6536425, 0, 0, 0, 1, 1,
-0.1115763, 0.02249279, -1.162231, 0, 0, 0, 1, 1,
-0.1099771, -1.027749, -1.801004, 0, 0, 0, 1, 1,
-0.1087529, 0.4633538, -0.8490729, 1, 1, 1, 1, 1,
-0.1069356, 0.6229143, -0.5885898, 1, 1, 1, 1, 1,
-0.1057053, -0.4278661, -3.60235, 1, 1, 1, 1, 1,
-0.1001105, 1.273286, -1.859466, 1, 1, 1, 1, 1,
-0.09794238, 1.304009, -0.7776462, 1, 1, 1, 1, 1,
-0.09788582, -1.11582, -3.154034, 1, 1, 1, 1, 1,
-0.09488327, -0.4036917, -4.420222, 1, 1, 1, 1, 1,
-0.09455635, -1.396675, -3.698357, 1, 1, 1, 1, 1,
-0.09109072, 1.349805, -1.153304, 1, 1, 1, 1, 1,
-0.09056773, 0.7631834, -1.57393, 1, 1, 1, 1, 1,
-0.09006134, 1.920792, -1.268496, 1, 1, 1, 1, 1,
-0.08869572, -0.1363743, -2.36275, 1, 1, 1, 1, 1,
-0.08751318, 0.2548448, 0.7884897, 1, 1, 1, 1, 1,
-0.08735109, -1.498925, -3.059494, 1, 1, 1, 1, 1,
-0.08668322, -0.1870649, -2.77705, 1, 1, 1, 1, 1,
-0.08659808, -0.5451004, -4.25336, 0, 0, 1, 1, 1,
-0.08535042, 1.449955, 1.49314, 1, 0, 0, 1, 1,
-0.08489539, -0.2902197, -2.522239, 1, 0, 0, 1, 1,
-0.08461119, -0.6677665, -2.159611, 1, 0, 0, 1, 1,
-0.07969751, -0.6648341, -2.891888, 1, 0, 0, 1, 1,
-0.07568047, -1.228891, -4.38262, 1, 0, 0, 1, 1,
-0.07409085, 1.571655, -2.140902, 0, 0, 0, 1, 1,
-0.07256279, -1.00472, -2.747806, 0, 0, 0, 1, 1,
-0.06825633, 0.2654063, -0.6393789, 0, 0, 0, 1, 1,
-0.05754432, 0.4281195, -0.008727469, 0, 0, 0, 1, 1,
-0.05335448, -0.1824998, -3.814406, 0, 0, 0, 1, 1,
-0.05118666, -0.2521371, -3.068388, 0, 0, 0, 1, 1,
-0.05017384, -1.157621, -2.902807, 0, 0, 0, 1, 1,
-0.04671441, 1.018273, -1.034463, 1, 1, 1, 1, 1,
-0.04388288, 0.708487, -0.6017496, 1, 1, 1, 1, 1,
-0.0409111, -0.5334041, -3.170423, 1, 1, 1, 1, 1,
-0.03899541, -0.06981839, -4.248843, 1, 1, 1, 1, 1,
-0.03769049, 1.725413, 0.4072272, 1, 1, 1, 1, 1,
-0.03716965, -0.003705838, -1.024366, 1, 1, 1, 1, 1,
-0.03497076, 1.678717, -0.4027478, 1, 1, 1, 1, 1,
-0.03458605, -0.08883148, -3.087371, 1, 1, 1, 1, 1,
-0.03443399, 1.661795, 0.9637762, 1, 1, 1, 1, 1,
-0.02815788, -0.7483934, -3.910009, 1, 1, 1, 1, 1,
-0.02754974, -0.6460313, -3.460702, 1, 1, 1, 1, 1,
-0.02588988, 1.056578, 1.509089, 1, 1, 1, 1, 1,
-0.02472902, -0.4822378, -3.452021, 1, 1, 1, 1, 1,
-0.02401605, 0.4811971, 0.2151331, 1, 1, 1, 1, 1,
-0.02320022, -1.146644, -2.872985, 1, 1, 1, 1, 1,
-0.02078923, -0.5656394, -3.324352, 0, 0, 1, 1, 1,
-0.009816021, 0.4391951, -0.4260128, 1, 0, 0, 1, 1,
-0.009420553, -1.567665, -2.518289, 1, 0, 0, 1, 1,
-0.003689426, -0.3936315, -3.725578, 1, 0, 0, 1, 1,
0.001020575, -0.08229549, 3.134074, 1, 0, 0, 1, 1,
0.006162274, -1.392949, 4.788866, 1, 0, 0, 1, 1,
0.01284499, -2.273392, 3.2349, 0, 0, 0, 1, 1,
0.01436689, 3.135561, -0.3021582, 0, 0, 0, 1, 1,
0.01819807, -1.323936, 2.357066, 0, 0, 0, 1, 1,
0.02264153, -0.541024, 1.11453, 0, 0, 0, 1, 1,
0.02531728, 0.5957158, -0.02807652, 0, 0, 0, 1, 1,
0.02911641, -0.3838496, 4.788951, 0, 0, 0, 1, 1,
0.03410215, -0.8473345, 4.85111, 0, 0, 0, 1, 1,
0.03607148, 0.3315423, -1.680317, 1, 1, 1, 1, 1,
0.03805757, 1.90192, 0.3500809, 1, 1, 1, 1, 1,
0.03813111, 0.5898346, -0.2709578, 1, 1, 1, 1, 1,
0.04297573, -0.4553826, 1.484508, 1, 1, 1, 1, 1,
0.04590007, -0.6668913, 3.275847, 1, 1, 1, 1, 1,
0.04820754, 2.473929, -0.3432627, 1, 1, 1, 1, 1,
0.05132001, -0.4167227, 2.989976, 1, 1, 1, 1, 1,
0.05598236, 0.8536227, 0.2844847, 1, 1, 1, 1, 1,
0.05656042, 0.8728039, -1.932658, 1, 1, 1, 1, 1,
0.06511464, 0.9659982, -1.099252, 1, 1, 1, 1, 1,
0.06699394, 1.454703, -1.352797, 1, 1, 1, 1, 1,
0.06717481, 0.8304037, -0.7391415, 1, 1, 1, 1, 1,
0.06945036, 0.5890654, 0.2552522, 1, 1, 1, 1, 1,
0.06945767, -0.643701, 2.747554, 1, 1, 1, 1, 1,
0.07141861, 1.849452, -2.427901, 1, 1, 1, 1, 1,
0.0736175, -0.3375354, 2.624827, 0, 0, 1, 1, 1,
0.07393882, -0.2935704, 3.536238, 1, 0, 0, 1, 1,
0.076434, -0.7770461, 3.051249, 1, 0, 0, 1, 1,
0.07948809, -1.726717, 2.680515, 1, 0, 0, 1, 1,
0.08159439, -0.385827, 2.270637, 1, 0, 0, 1, 1,
0.0826504, -0.6608686, 4.102189, 1, 0, 0, 1, 1,
0.0831534, 1.277716, 0.2942976, 0, 0, 0, 1, 1,
0.08905065, -1.334445, 3.603106, 0, 0, 0, 1, 1,
0.09031659, 0.04131186, 1.321834, 0, 0, 0, 1, 1,
0.09492857, 0.08927066, -0.04195078, 0, 0, 0, 1, 1,
0.1000959, -0.9712874, 3.022924, 0, 0, 0, 1, 1,
0.101663, -1.782229, 3.421363, 0, 0, 0, 1, 1,
0.1040359, 2.122841, -0.8126814, 0, 0, 0, 1, 1,
0.1077407, -1.521386, 3.172703, 1, 1, 1, 1, 1,
0.1079238, -1.684547, 2.798194, 1, 1, 1, 1, 1,
0.1126576, 1.588846, -0.1009604, 1, 1, 1, 1, 1,
0.1143099, 1.762278, -1.013097, 1, 1, 1, 1, 1,
0.1190547, -0.3077031, 3.733111, 1, 1, 1, 1, 1,
0.1275792, 0.8702803, 1.766785, 1, 1, 1, 1, 1,
0.1279509, 1.034664, 1.115962, 1, 1, 1, 1, 1,
0.130249, 0.5710957, -2.03541, 1, 1, 1, 1, 1,
0.1348473, 1.162865, 1.458091, 1, 1, 1, 1, 1,
0.1372185, -0.9520065, 2.378349, 1, 1, 1, 1, 1,
0.1393834, -0.9494087, 2.27984, 1, 1, 1, 1, 1,
0.1398292, -1.562641, 2.425497, 1, 1, 1, 1, 1,
0.1452091, -1.752846, 5.196783, 1, 1, 1, 1, 1,
0.147146, -0.2369115, 0.6114007, 1, 1, 1, 1, 1,
0.1535261, -0.1248093, 2.832475, 1, 1, 1, 1, 1,
0.1576976, -0.3295768, 4.005514, 0, 0, 1, 1, 1,
0.1614617, -0.3115678, 3.159505, 1, 0, 0, 1, 1,
0.1642911, -1.597968, 2.963565, 1, 0, 0, 1, 1,
0.1652068, -0.2349562, 3.732325, 1, 0, 0, 1, 1,
0.1664874, 2.116103, 0.9300039, 1, 0, 0, 1, 1,
0.166661, -0.6946731, 1.309587, 1, 0, 0, 1, 1,
0.1673887, 0.1441165, 1.698168, 0, 0, 0, 1, 1,
0.1682873, 0.8590006, -0.8051411, 0, 0, 0, 1, 1,
0.1708655, 0.6056407, 0.4028552, 0, 0, 0, 1, 1,
0.1732285, 0.2340232, 0.7827241, 0, 0, 0, 1, 1,
0.1797768, 1.157839, -1.274606, 0, 0, 0, 1, 1,
0.1803746, -0.5859418, 3.812988, 0, 0, 0, 1, 1,
0.189067, -0.5277226, 3.244531, 0, 0, 0, 1, 1,
0.1909117, 0.1866225, 1.050886, 1, 1, 1, 1, 1,
0.1931619, 1.333693, -1.431868, 1, 1, 1, 1, 1,
0.1936002, -0.08222134, 2.62209, 1, 1, 1, 1, 1,
0.1982201, -1.362985, 3.694668, 1, 1, 1, 1, 1,
0.1985722, 0.006065367, 2.694547, 1, 1, 1, 1, 1,
0.2009389, -0.7483794, 2.471435, 1, 1, 1, 1, 1,
0.2036356, -0.7131879, 2.807346, 1, 1, 1, 1, 1,
0.2040936, -1.012766, 2.2342, 1, 1, 1, 1, 1,
0.2049712, 1.747824, -0.5948073, 1, 1, 1, 1, 1,
0.2100312, 1.195563, 0.6075009, 1, 1, 1, 1, 1,
0.2102252, -0.08102174, 2.539776, 1, 1, 1, 1, 1,
0.211557, -0.04404559, 1.327022, 1, 1, 1, 1, 1,
0.2129153, 0.2287364, 1.466907, 1, 1, 1, 1, 1,
0.216413, 1.201671, 0.0634804, 1, 1, 1, 1, 1,
0.21668, 0.4271819, 0.960008, 1, 1, 1, 1, 1,
0.220764, 0.5355404, 0.3593754, 0, 0, 1, 1, 1,
0.2275708, -0.1408622, 1.508171, 1, 0, 0, 1, 1,
0.2287223, -0.3517052, 1.00709, 1, 0, 0, 1, 1,
0.2355282, -1.860794, 3.649474, 1, 0, 0, 1, 1,
0.2374912, 0.6012743, 1.881307, 1, 0, 0, 1, 1,
0.240446, 0.7063615, 0.05453451, 1, 0, 0, 1, 1,
0.2456511, -0.5852152, 2.432014, 0, 0, 0, 1, 1,
0.2522248, 0.9749403, -1.105596, 0, 0, 0, 1, 1,
0.2528072, -1.659195, 4.452399, 0, 0, 0, 1, 1,
0.2538739, 0.1351057, 1.161977, 0, 0, 0, 1, 1,
0.2581463, 0.8361501, -0.8568462, 0, 0, 0, 1, 1,
0.2611389, -0.2912026, 3.459626, 0, 0, 0, 1, 1,
0.2622409, -0.7660161, 1.077698, 0, 0, 0, 1, 1,
0.2659049, -0.2571486, 2.528268, 1, 1, 1, 1, 1,
0.2675231, 2.703466, 0.6548289, 1, 1, 1, 1, 1,
0.2675828, -0.5779515, 3.721317, 1, 1, 1, 1, 1,
0.2723896, 1.482472, -0.4440266, 1, 1, 1, 1, 1,
0.2726324, -0.44106, 3.095564, 1, 1, 1, 1, 1,
0.2735327, -0.2705182, 2.289934, 1, 1, 1, 1, 1,
0.2743196, -0.5567745, 2.235478, 1, 1, 1, 1, 1,
0.2782413, -0.8859059, 0.9896083, 1, 1, 1, 1, 1,
0.2790032, 0.8457358, 0.8223352, 1, 1, 1, 1, 1,
0.2843069, -1.147098, 2.036505, 1, 1, 1, 1, 1,
0.2857031, -0.5096161, 4.254128, 1, 1, 1, 1, 1,
0.289037, 0.2225102, -0.4834213, 1, 1, 1, 1, 1,
0.289902, -0.2737392, 2.850388, 1, 1, 1, 1, 1,
0.2942863, -0.9936314, 2.397962, 1, 1, 1, 1, 1,
0.2946624, 0.5911289, 0.2205032, 1, 1, 1, 1, 1,
0.2990881, -0.5045482, 4.539464, 0, 0, 1, 1, 1,
0.2996326, -0.2955212, 2.610362, 1, 0, 0, 1, 1,
0.3029369, 0.4073384, 1.420047, 1, 0, 0, 1, 1,
0.3079989, 0.1700818, 1.198711, 1, 0, 0, 1, 1,
0.309978, -0.01427658, 1.837736, 1, 0, 0, 1, 1,
0.3126944, -0.08696792, 1.67984, 1, 0, 0, 1, 1,
0.3159617, 0.7682171, -2.50134, 0, 0, 0, 1, 1,
0.3163399, 1.276205, -0.7133167, 0, 0, 0, 1, 1,
0.3165315, -0.05680281, 2.068774, 0, 0, 0, 1, 1,
0.3176661, 0.39492, 2.816731, 0, 0, 0, 1, 1,
0.3181272, 0.7923837, 2.138043, 0, 0, 0, 1, 1,
0.3181349, -0.3649903, 4.277988, 0, 0, 0, 1, 1,
0.3189239, 1.249998, 0.2749677, 0, 0, 0, 1, 1,
0.3200645, -0.929116, 3.202297, 1, 1, 1, 1, 1,
0.3304394, 0.1440675, 0.9170284, 1, 1, 1, 1, 1,
0.3340009, 1.027986, 0.2778895, 1, 1, 1, 1, 1,
0.3378792, -0.8958853, 2.452972, 1, 1, 1, 1, 1,
0.341927, 0.1191329, 0.9152088, 1, 1, 1, 1, 1,
0.3425764, 0.5911224, 0.1947659, 1, 1, 1, 1, 1,
0.3456892, 1.46325, 1.140487, 1, 1, 1, 1, 1,
0.3493809, 2.388715, -0.4875991, 1, 1, 1, 1, 1,
0.3510602, -1.008559, 2.491251, 1, 1, 1, 1, 1,
0.3514583, 2.871988, -0.2028958, 1, 1, 1, 1, 1,
0.3557387, -0.4027306, 0.9799885, 1, 1, 1, 1, 1,
0.3560566, -0.9114893, 4.080357, 1, 1, 1, 1, 1,
0.3613838, -0.4033312, 2.9328, 1, 1, 1, 1, 1,
0.3686266, -2.096191, 3.808895, 1, 1, 1, 1, 1,
0.3714616, 0.399264, 0.3551343, 1, 1, 1, 1, 1,
0.3722217, -0.04281877, 1.851683, 0, 0, 1, 1, 1,
0.3762223, 0.09128902, 2.801877, 1, 0, 0, 1, 1,
0.3801009, -0.7279968, 2.222812, 1, 0, 0, 1, 1,
0.3828059, -0.6831678, 1.921228, 1, 0, 0, 1, 1,
0.3847995, -0.2530882, 1.164281, 1, 0, 0, 1, 1,
0.3888825, 2.128681, -1.190694, 1, 0, 0, 1, 1,
0.3891893, -0.1251567, 0.8728591, 0, 0, 0, 1, 1,
0.3920611, 0.608433, 1.54333, 0, 0, 0, 1, 1,
0.4007117, -0.5104917, 3.578227, 0, 0, 0, 1, 1,
0.4060679, -1.00502, 2.838015, 0, 0, 0, 1, 1,
0.4084993, 0.8826207, -0.3764186, 0, 0, 0, 1, 1,
0.4086671, -0.4387087, 2.319849, 0, 0, 0, 1, 1,
0.4158223, 1.080124, -0.246801, 0, 0, 0, 1, 1,
0.4244337, 1.291881, -0.4939883, 1, 1, 1, 1, 1,
0.4246472, -0.1266969, 3.217361, 1, 1, 1, 1, 1,
0.4265019, 0.744748, 0.7008831, 1, 1, 1, 1, 1,
0.4269665, -2.033267, 0.6232963, 1, 1, 1, 1, 1,
0.4325744, 0.5811322, -0.3257769, 1, 1, 1, 1, 1,
0.4370537, 0.9254028, 1.546266, 1, 1, 1, 1, 1,
0.4393376, 1.108349, -0.5507425, 1, 1, 1, 1, 1,
0.4411007, 0.2707942, 0.7157577, 1, 1, 1, 1, 1,
0.4465784, -0.7328861, 3.288768, 1, 1, 1, 1, 1,
0.4474942, 0.5024548, 1.449242, 1, 1, 1, 1, 1,
0.4516363, -0.07169759, 1.412992, 1, 1, 1, 1, 1,
0.4534262, -0.2944131, 3.698759, 1, 1, 1, 1, 1,
0.4538723, -0.6210291, 2.890552, 1, 1, 1, 1, 1,
0.4655401, -2.190918, 1.180597, 1, 1, 1, 1, 1,
0.4694179, -0.6861693, 3.679906, 1, 1, 1, 1, 1,
0.4739179, -0.3054707, 3.037365, 0, 0, 1, 1, 1,
0.4774633, -0.9256302, 1.946097, 1, 0, 0, 1, 1,
0.4799261, -0.0478874, 1.264637, 1, 0, 0, 1, 1,
0.4810736, 0.6311904, -0.1492643, 1, 0, 0, 1, 1,
0.4820765, -0.9343343, 1.807892, 1, 0, 0, 1, 1,
0.4905952, -0.001648558, 1.612624, 1, 0, 0, 1, 1,
0.4915168, 2.724225, 0.4048656, 0, 0, 0, 1, 1,
0.4927187, 0.04426976, 1.953263, 0, 0, 0, 1, 1,
0.4951263, 1.310664, 1.716161, 0, 0, 0, 1, 1,
0.4977593, 0.04952632, 1.293229, 0, 0, 0, 1, 1,
0.4987647, -0.5283231, 3.192123, 0, 0, 0, 1, 1,
0.5004278, 0.3113051, 1.606605, 0, 0, 0, 1, 1,
0.5060256, -1.058032, 1.062057, 0, 0, 0, 1, 1,
0.5084854, 0.06467545, -0.1901122, 1, 1, 1, 1, 1,
0.5085829, -0.7353904, 2.027016, 1, 1, 1, 1, 1,
0.5151223, 0.5188051, -0.6183634, 1, 1, 1, 1, 1,
0.5162233, -1.895754, 3.996585, 1, 1, 1, 1, 1,
0.5214983, 0.3271146, 1.583886, 1, 1, 1, 1, 1,
0.5220768, -1.346429, 3.224061, 1, 1, 1, 1, 1,
0.5229282, -1.135771, 3.735498, 1, 1, 1, 1, 1,
0.5235425, -0.4186117, 2.386883, 1, 1, 1, 1, 1,
0.5238388, -1.717377, 2.659807, 1, 1, 1, 1, 1,
0.5240941, -0.2111795, 3.512898, 1, 1, 1, 1, 1,
0.5321686, -0.4273571, 4.650553, 1, 1, 1, 1, 1,
0.5344862, -0.3719872, 3.371953, 1, 1, 1, 1, 1,
0.5359361, -1.130087, 2.739454, 1, 1, 1, 1, 1,
0.5366119, -0.9692044, 2.943597, 1, 1, 1, 1, 1,
0.5408156, 0.01908907, 3.763829, 1, 1, 1, 1, 1,
0.541566, -0.7282649, 1.016291, 0, 0, 1, 1, 1,
0.543407, -0.3973967, 2.763468, 1, 0, 0, 1, 1,
0.5480188, 0.5429001, 1.236948, 1, 0, 0, 1, 1,
0.5483535, 0.4221301, 3.295676, 1, 0, 0, 1, 1,
0.5500194, -1.165461, 5.334485, 1, 0, 0, 1, 1,
0.5527905, 0.3631375, 0.9862659, 1, 0, 0, 1, 1,
0.5531463, -1.215461, 1.536777, 0, 0, 0, 1, 1,
0.5540112, -0.8701885, 3.966649, 0, 0, 0, 1, 1,
0.5553777, -0.4597349, 1.419672, 0, 0, 0, 1, 1,
0.5574585, 0.1839409, 2.836461, 0, 0, 0, 1, 1,
0.5609379, 1.285833, 0.4647346, 0, 0, 0, 1, 1,
0.5627407, -0.6716043, 2.724027, 0, 0, 0, 1, 1,
0.5712864, -0.1500623, 2.639364, 0, 0, 0, 1, 1,
0.5744749, 0.5501031, 0.226847, 1, 1, 1, 1, 1,
0.5765695, -0.9242397, 3.33382, 1, 1, 1, 1, 1,
0.5792501, -2.440897, 2.364156, 1, 1, 1, 1, 1,
0.5855757, 0.4782799, 2.155902, 1, 1, 1, 1, 1,
0.5909658, -2.138258, 4.057409, 1, 1, 1, 1, 1,
0.5919672, 0.2812276, 1.39611, 1, 1, 1, 1, 1,
0.5957204, -1.468891, 2.986375, 1, 1, 1, 1, 1,
0.5966831, 0.2025111, 1.197691, 1, 1, 1, 1, 1,
0.5972971, 0.3608832, 0.3872254, 1, 1, 1, 1, 1,
0.5988501, -0.7700357, 1.41098, 1, 1, 1, 1, 1,
0.6000843, 1.786111, 0.6431469, 1, 1, 1, 1, 1,
0.6042004, 2.253581, -1.616676, 1, 1, 1, 1, 1,
0.6044764, 0.8699768, -0.4533728, 1, 1, 1, 1, 1,
0.6063623, 0.3126318, 0.1489833, 1, 1, 1, 1, 1,
0.6078443, 0.4489776, 1.678859, 1, 1, 1, 1, 1,
0.6106457, -0.3457452, 1.609964, 0, 0, 1, 1, 1,
0.6121596, -0.448929, 1.053029, 1, 0, 0, 1, 1,
0.6129392, 0.8490075, 0.5027686, 1, 0, 0, 1, 1,
0.6188154, 0.2558241, 1.275582, 1, 0, 0, 1, 1,
0.6203064, 1.313998, -0.3589787, 1, 0, 0, 1, 1,
0.6210535, -0.682323, 2.093245, 1, 0, 0, 1, 1,
0.6308786, -0.7577422, 2.017121, 0, 0, 0, 1, 1,
0.6321073, -1.343291, 2.441136, 0, 0, 0, 1, 1,
0.6399844, 0.2893777, 2.138039, 0, 0, 0, 1, 1,
0.6453661, -0.6467317, 2.053916, 0, 0, 0, 1, 1,
0.64935, -2.619622, 4.179467, 0, 0, 0, 1, 1,
0.6557457, -0.6577483, 3.331741, 0, 0, 0, 1, 1,
0.6607549, -0.3255507, 0.8796897, 0, 0, 0, 1, 1,
0.6621418, 0.3919857, 1.475808, 1, 1, 1, 1, 1,
0.6626176, 1.28254, 0.8835418, 1, 1, 1, 1, 1,
0.6658213, -0.3058198, 2.224165, 1, 1, 1, 1, 1,
0.6668945, -0.4194007, 1.845968, 1, 1, 1, 1, 1,
0.6746037, -0.5491891, 3.941318, 1, 1, 1, 1, 1,
0.67733, 0.6728891, 0.6842759, 1, 1, 1, 1, 1,
0.6780089, -0.9510183, 2.720655, 1, 1, 1, 1, 1,
0.6791045, 1.533924, -1.804069, 1, 1, 1, 1, 1,
0.6799017, 0.2008726, 1.16267, 1, 1, 1, 1, 1,
0.6803275, 0.2851142, 0.5378264, 1, 1, 1, 1, 1,
0.6809173, -2.821428, 3.003911, 1, 1, 1, 1, 1,
0.6919084, -0.07957405, 1.302869, 1, 1, 1, 1, 1,
0.6932836, -1.16364, 4.438808, 1, 1, 1, 1, 1,
0.6946736, -1.275059, 3.191951, 1, 1, 1, 1, 1,
0.6960258, -0.8943436, 2.362764, 1, 1, 1, 1, 1,
0.7002048, -0.4142154, 1.514568, 0, 0, 1, 1, 1,
0.7003114, 0.4961196, 0.03239697, 1, 0, 0, 1, 1,
0.7033285, -0.6515015, 1.993751, 1, 0, 0, 1, 1,
0.7136955, 0.01570492, 2.563141, 1, 0, 0, 1, 1,
0.7170264, 0.3410563, 0.4794551, 1, 0, 0, 1, 1,
0.7172023, -1.342703, 3.647321, 1, 0, 0, 1, 1,
0.7214936, -1.153033, 1.996023, 0, 0, 0, 1, 1,
0.7395194, -0.2452949, 1.802706, 0, 0, 0, 1, 1,
0.7399499, 0.7957038, 3.156312, 0, 0, 0, 1, 1,
0.7400301, -1.919443, 3.5809, 0, 0, 0, 1, 1,
0.7408791, -1.885671, 2.898412, 0, 0, 0, 1, 1,
0.744386, 0.8122134, 0.4203396, 0, 0, 0, 1, 1,
0.7472676, 0.4188794, -0.4423745, 0, 0, 0, 1, 1,
0.7504019, 1.128923, 1.057249, 1, 1, 1, 1, 1,
0.750987, 1.526947, -0.2244498, 1, 1, 1, 1, 1,
0.7518131, -0.6132523, 1.347949, 1, 1, 1, 1, 1,
0.7547452, -0.3291968, 1.666098, 1, 1, 1, 1, 1,
0.7609428, 0.7191426, 0.5491476, 1, 1, 1, 1, 1,
0.7623429, 0.5510299, 0.1982276, 1, 1, 1, 1, 1,
0.7635642, 0.33928, -0.2604912, 1, 1, 1, 1, 1,
0.7694796, -0.01304269, 1.031445, 1, 1, 1, 1, 1,
0.7760455, 1.028168, 2.230468, 1, 1, 1, 1, 1,
0.7817873, 0.2149171, 2.215002, 1, 1, 1, 1, 1,
0.7820935, -1.292545, 2.383879, 1, 1, 1, 1, 1,
0.7883877, 0.01545376, 1.271796, 1, 1, 1, 1, 1,
0.7925121, 0.6123993, 0.1397957, 1, 1, 1, 1, 1,
0.8054589, 0.2308539, -0.2007115, 1, 1, 1, 1, 1,
0.806259, -0.3477114, -1.481094, 1, 1, 1, 1, 1,
0.8064262, -1.082606, 3.746421, 0, 0, 1, 1, 1,
0.8067845, 0.6041519, 0.2533981, 1, 0, 0, 1, 1,
0.8084168, -0.2580536, 3.203332, 1, 0, 0, 1, 1,
0.8092496, -0.4257008, 1.079337, 1, 0, 0, 1, 1,
0.8107767, 0.4448007, 1.935344, 1, 0, 0, 1, 1,
0.8268308, -0.02344175, 1.979714, 1, 0, 0, 1, 1,
0.8273445, 2.705357, -0.02938871, 0, 0, 0, 1, 1,
0.8278967, 1.407542, -1.145339, 0, 0, 0, 1, 1,
0.8293329, -1.162867, 3.350817, 0, 0, 0, 1, 1,
0.8408509, -0.3691142, 3.859688, 0, 0, 0, 1, 1,
0.8482497, 0.4203511, 0.6323012, 0, 0, 0, 1, 1,
0.8519336, -0.6751537, 0.9000197, 0, 0, 0, 1, 1,
0.8524972, 0.8070042, -1.139133, 0, 0, 0, 1, 1,
0.8562773, 0.07149891, 3.186636, 1, 1, 1, 1, 1,
0.8577815, -1.176092, 1.498128, 1, 1, 1, 1, 1,
0.8595192, -1.100946, 2.184515, 1, 1, 1, 1, 1,
0.8654438, 1.885466, -0.7042112, 1, 1, 1, 1, 1,
0.8657623, -0.6605688, 2.421119, 1, 1, 1, 1, 1,
0.8680526, -1.20053, 1.985796, 1, 1, 1, 1, 1,
0.8848649, 1.78952, 0.7543983, 1, 1, 1, 1, 1,
0.8862272, -0.4835406, 3.261415, 1, 1, 1, 1, 1,
0.8866374, -1.703517, 2.846115, 1, 1, 1, 1, 1,
0.8901387, -0.3572559, 1.784488, 1, 1, 1, 1, 1,
0.8907726, 1.084043, 0.9971159, 1, 1, 1, 1, 1,
0.8917454, -0.3414996, 0.9499883, 1, 1, 1, 1, 1,
0.8977115, -0.3422687, 0.7038236, 1, 1, 1, 1, 1,
0.8989111, 0.03730123, 2.273985, 1, 1, 1, 1, 1,
0.8990163, -2.076, 1.753779, 1, 1, 1, 1, 1,
0.9050982, 0.07549107, 2.636733, 0, 0, 1, 1, 1,
0.9072196, -1.228538, 1.091969, 1, 0, 0, 1, 1,
0.9096588, -0.5733317, 2.994703, 1, 0, 0, 1, 1,
0.9166309, -0.3888899, 0.6894888, 1, 0, 0, 1, 1,
0.9192827, -0.9665067, 0.5903191, 1, 0, 0, 1, 1,
0.9204374, -0.9533931, 1.078306, 1, 0, 0, 1, 1,
0.9231537, -0.5501727, 2.526435, 0, 0, 0, 1, 1,
0.9245828, -0.06524622, 2.071341, 0, 0, 0, 1, 1,
0.9277492, 0.3105344, 0.6501198, 0, 0, 0, 1, 1,
0.9298761, 0.6232103, -0.1684453, 0, 0, 0, 1, 1,
0.9315721, 0.1843534, 1.371813, 0, 0, 0, 1, 1,
0.9357544, 0.3057232, 1.121642, 0, 0, 0, 1, 1,
0.9448561, 0.4816374, 0.4329287, 0, 0, 0, 1, 1,
0.9470769, 0.2573762, -0.2686967, 1, 1, 1, 1, 1,
0.9533212, 1.889525, 0.3714008, 1, 1, 1, 1, 1,
0.9552755, 0.7334954, 2.195864, 1, 1, 1, 1, 1,
0.9578005, -0.2868514, 2.837158, 1, 1, 1, 1, 1,
0.9628069, 1.034326, 1.956288, 1, 1, 1, 1, 1,
0.9649088, 0.9110968, 0.9952374, 1, 1, 1, 1, 1,
0.9658337, -0.314735, 0.5275841, 1, 1, 1, 1, 1,
0.9735444, 0.8044242, 0.5324592, 1, 1, 1, 1, 1,
0.9745235, -1.033283, 2.934404, 1, 1, 1, 1, 1,
0.9758752, 0.844628, 0.6988821, 1, 1, 1, 1, 1,
0.9923406, 1.551658, 2.368237, 1, 1, 1, 1, 1,
0.9926685, 1.934435, -0.6178777, 1, 1, 1, 1, 1,
0.993286, 0.5613856, 0.3615957, 1, 1, 1, 1, 1,
0.9948975, -0.111767, 1.238153, 1, 1, 1, 1, 1,
0.9986939, -0.2311623, 0.9332171, 1, 1, 1, 1, 1,
1.004225, -0.9357156, 3.230899, 0, 0, 1, 1, 1,
1.007762, -0.3639194, 1.656887, 1, 0, 0, 1, 1,
1.011279, -1.493211, 2.97034, 1, 0, 0, 1, 1,
1.014967, 1.315915, 0.5982399, 1, 0, 0, 1, 1,
1.017012, -0.2847891, 2.135381, 1, 0, 0, 1, 1,
1.018588, -0.4845585, 2.334785, 1, 0, 0, 1, 1,
1.019865, 0.4571783, 1.311486, 0, 0, 0, 1, 1,
1.023225, 0.9928038, 0.3219134, 0, 0, 0, 1, 1,
1.025537, -0.3586044, 0.6863966, 0, 0, 0, 1, 1,
1.025655, -0.08329896, 1.760569, 0, 0, 0, 1, 1,
1.03487, 0.4464057, -0.8179207, 0, 0, 0, 1, 1,
1.036485, -0.06570382, 0.5033244, 0, 0, 0, 1, 1,
1.038447, 0.3750199, 1.37181, 0, 0, 0, 1, 1,
1.042616, 0.7042295, 0.1786557, 1, 1, 1, 1, 1,
1.056909, -0.3828998, 1.533378, 1, 1, 1, 1, 1,
1.061236, 0.3401846, 2.123873, 1, 1, 1, 1, 1,
1.064836, -0.3362618, 3.875877, 1, 1, 1, 1, 1,
1.078109, -0.1012195, 1.415878, 1, 1, 1, 1, 1,
1.079135, 1.569693, 1.616629, 1, 1, 1, 1, 1,
1.083244, -0.5354365, 0.5576326, 1, 1, 1, 1, 1,
1.083768, 1.245836, 2.36029, 1, 1, 1, 1, 1,
1.088647, -0.3553937, 4.051629, 1, 1, 1, 1, 1,
1.092168, 0.9462125, 0.6271195, 1, 1, 1, 1, 1,
1.09387, -1.719008, 3.077145, 1, 1, 1, 1, 1,
1.095653, 1.291396, 1.674652, 1, 1, 1, 1, 1,
1.108808, -0.6548509, 1.865666, 1, 1, 1, 1, 1,
1.109348, -1.046805, 2.002672, 1, 1, 1, 1, 1,
1.113043, 0.5235347, 3.432913, 1, 1, 1, 1, 1,
1.125766, -0.3418473, 1.029753, 0, 0, 1, 1, 1,
1.13314, -1.136246, 1.716931, 1, 0, 0, 1, 1,
1.140373, -0.7252778, 1.858573, 1, 0, 0, 1, 1,
1.141417, -0.6754376, 0.3342651, 1, 0, 0, 1, 1,
1.147342, 0.9963452, -0.1174864, 1, 0, 0, 1, 1,
1.161813, -0.7915133, 1.733306, 1, 0, 0, 1, 1,
1.165471, 1.133426, -0.7223887, 0, 0, 0, 1, 1,
1.170809, -0.1804887, 3.077793, 0, 0, 0, 1, 1,
1.183071, -1.636888, 4.216753, 0, 0, 0, 1, 1,
1.186792, 0.6598844, -0.1731326, 0, 0, 0, 1, 1,
1.18723, -0.7886825, 3.702953, 0, 0, 0, 1, 1,
1.190122, 0.4612608, 2.464978, 0, 0, 0, 1, 1,
1.192925, -0.2366739, 2.611727, 0, 0, 0, 1, 1,
1.195335, 0.4245395, 0.9723991, 1, 1, 1, 1, 1,
1.200879, 0.8649608, 3.52, 1, 1, 1, 1, 1,
1.204044, 1.044481, 1.779802, 1, 1, 1, 1, 1,
1.204478, 1.493328, 2.219724, 1, 1, 1, 1, 1,
1.214102, 1.217775, 1.150479, 1, 1, 1, 1, 1,
1.217226, -0.2906491, 1.629529, 1, 1, 1, 1, 1,
1.22637, -0.9750266, 2.067209, 1, 1, 1, 1, 1,
1.227659, 1.270336, 0.4118956, 1, 1, 1, 1, 1,
1.228906, 0.9353042, 1.848831, 1, 1, 1, 1, 1,
1.229445, 1.036046, 1.689158, 1, 1, 1, 1, 1,
1.251963, 1.340909, 0.1344186, 1, 1, 1, 1, 1,
1.253468, -1.38671, 2.749203, 1, 1, 1, 1, 1,
1.255017, -0.4340765, 3.06399, 1, 1, 1, 1, 1,
1.264105, -1.332773, 2.081083, 1, 1, 1, 1, 1,
1.265905, 1.187482, -0.5190514, 1, 1, 1, 1, 1,
1.266946, -1.386338, 2.337302, 0, 0, 1, 1, 1,
1.268796, -0.26004, 1.490888, 1, 0, 0, 1, 1,
1.270711, -1.851525, 1.29611, 1, 0, 0, 1, 1,
1.274555, -0.9433845, 2.125657, 1, 0, 0, 1, 1,
1.275333, 0.01858327, 1.487046, 1, 0, 0, 1, 1,
1.27538, -1.347423, 1.366521, 1, 0, 0, 1, 1,
1.281057, -0.8348727, 2.733382, 0, 0, 0, 1, 1,
1.282562, 0.9426721, 1.753464, 0, 0, 0, 1, 1,
1.285132, 1.330322, 0.6773892, 0, 0, 0, 1, 1,
1.289818, -0.8630249, 3.364325, 0, 0, 0, 1, 1,
1.29385, -0.5581372, 2.207593, 0, 0, 0, 1, 1,
1.305171, 1.814102, 0.3953072, 0, 0, 0, 1, 1,
1.309872, -2.431953, 3.712295, 0, 0, 0, 1, 1,
1.313986, -0.2069666, 0.9134188, 1, 1, 1, 1, 1,
1.333096, 0.6489014, 1.984014, 1, 1, 1, 1, 1,
1.336815, 1.021827, 1.091859, 1, 1, 1, 1, 1,
1.348588, -1.122162, 2.377836, 1, 1, 1, 1, 1,
1.349256, 0.5727392, 0.5369978, 1, 1, 1, 1, 1,
1.349627, -0.493842, 1.840721, 1, 1, 1, 1, 1,
1.363095, -3.075815, 2.574425, 1, 1, 1, 1, 1,
1.371361, 1.620088, 0.4865165, 1, 1, 1, 1, 1,
1.37401, -1.853624, 2.619738, 1, 1, 1, 1, 1,
1.382775, 0.1485976, 1.356543, 1, 1, 1, 1, 1,
1.399432, -0.1824565, 2.226325, 1, 1, 1, 1, 1,
1.402158, 0.006337803, 0.7872866, 1, 1, 1, 1, 1,
1.425313, -0.06682971, 1.540987, 1, 1, 1, 1, 1,
1.42864, -1.385326, 3.195051, 1, 1, 1, 1, 1,
1.429757, 0.6100184, -0.06584449, 1, 1, 1, 1, 1,
1.435509, 0.005796529, 0.9368733, 0, 0, 1, 1, 1,
1.442913, 0.2914518, 1.770727, 1, 0, 0, 1, 1,
1.450818, 0.02729374, 1.724994, 1, 0, 0, 1, 1,
1.452351, 1.249199, 0.5318758, 1, 0, 0, 1, 1,
1.456193, 0.3750633, -0.5654069, 1, 0, 0, 1, 1,
1.464871, -1.14488, 1.97251, 1, 0, 0, 1, 1,
1.47772, 0.806655, 0.3990697, 0, 0, 0, 1, 1,
1.488555, 0.006704319, 1.33575, 0, 0, 0, 1, 1,
1.493118, -0.808043, 2.267298, 0, 0, 0, 1, 1,
1.493244, -0.6966922, 0.8380222, 0, 0, 0, 1, 1,
1.501141, -1.729606, 3.480497, 0, 0, 0, 1, 1,
1.504999, -0.1094389, 3.316139, 0, 0, 0, 1, 1,
1.514726, -0.7859427, 1.510405, 0, 0, 0, 1, 1,
1.523581, -1.809161, 1.55293, 1, 1, 1, 1, 1,
1.528585, 0.3866684, 1.077224, 1, 1, 1, 1, 1,
1.530335, 2.329477, 0.7498426, 1, 1, 1, 1, 1,
1.531122, 0.5677313, 0.6298298, 1, 1, 1, 1, 1,
1.536057, 1.738345, -0.3394079, 1, 1, 1, 1, 1,
1.553507, -2.687944, 0.6672743, 1, 1, 1, 1, 1,
1.553782, 0.04468933, -0.01893317, 1, 1, 1, 1, 1,
1.569905, -0.04146885, 2.060702, 1, 1, 1, 1, 1,
1.580364, -0.3408763, 3.347765, 1, 1, 1, 1, 1,
1.583248, -0.5357034, 0.5858038, 1, 1, 1, 1, 1,
1.586195, 1.652287, 0.813309, 1, 1, 1, 1, 1,
1.596844, 0.6580667, 0.9879149, 1, 1, 1, 1, 1,
1.619384, 0.4260657, 1.806576, 1, 1, 1, 1, 1,
1.621209, -0.3595613, 4.26082, 1, 1, 1, 1, 1,
1.626279, -0.6531489, 3.528435, 1, 1, 1, 1, 1,
1.627597, -0.4163358, 2.625145, 0, 0, 1, 1, 1,
1.638584, -0.8701189, 3.589556, 1, 0, 0, 1, 1,
1.64199, -0.301384, 3.054795, 1, 0, 0, 1, 1,
1.644348, 0.224605, 1.550077, 1, 0, 0, 1, 1,
1.666112, -1.2625, 2.123881, 1, 0, 0, 1, 1,
1.671232, -1.740043, 1.767938, 1, 0, 0, 1, 1,
1.67868, -0.6761856, 1.130304, 0, 0, 0, 1, 1,
1.681808, 0.4337229, 1.475739, 0, 0, 0, 1, 1,
1.685285, 0.06536618, 2.221477, 0, 0, 0, 1, 1,
1.713413, 0.1194672, 1.409497, 0, 0, 0, 1, 1,
1.716744, 0.1260989, 1.596017, 0, 0, 0, 1, 1,
1.723054, 0.1404752, 1.218777, 0, 0, 0, 1, 1,
1.771225, -1.371008, 1.834938, 0, 0, 0, 1, 1,
1.788107, -0.03303686, 1.169591, 1, 1, 1, 1, 1,
1.792038, -1.736789, 1.880468, 1, 1, 1, 1, 1,
1.793584, -1.422055, 3.677029, 1, 1, 1, 1, 1,
1.812844, -0.4081406, 2.291934, 1, 1, 1, 1, 1,
1.833418, 0.411045, 1.464264, 1, 1, 1, 1, 1,
1.857009, 0.1339497, 0.8832257, 1, 1, 1, 1, 1,
1.866978, -0.329343, 1.855281, 1, 1, 1, 1, 1,
1.8967, -1.548792, 0.3398483, 1, 1, 1, 1, 1,
1.935887, -0.5233372, -0.1052673, 1, 1, 1, 1, 1,
1.937168, -1.776908, 0.6714773, 1, 1, 1, 1, 1,
1.962483, 1.056141, 1.119515, 1, 1, 1, 1, 1,
1.963848, -0.08397429, 2.676178, 1, 1, 1, 1, 1,
1.986811, -2.492483, 2.209056, 1, 1, 1, 1, 1,
1.997072, -1.381577, 0.7695579, 1, 1, 1, 1, 1,
2.029792, 0.2127022, 2.855591, 1, 1, 1, 1, 1,
2.030342, 2.239488, 0.5580768, 0, 0, 1, 1, 1,
2.030527, -2.037192, 3.09906, 1, 0, 0, 1, 1,
2.098519, 2.43061, -2.548083, 1, 0, 0, 1, 1,
2.205129, 0.02190315, 1.922191, 1, 0, 0, 1, 1,
2.244708, 0.8941569, 2.392805, 1, 0, 0, 1, 1,
2.253489, -0.5273887, 1.893163, 1, 0, 0, 1, 1,
2.277055, 1.359219, 0.2254515, 0, 0, 0, 1, 1,
2.296903, -0.1909615, 3.242651, 0, 0, 0, 1, 1,
2.302318, 0.1219349, 0.8839008, 0, 0, 0, 1, 1,
2.341306, -0.7970363, 1.338609, 0, 0, 0, 1, 1,
2.441983, -0.5269291, 2.928958, 0, 0, 0, 1, 1,
2.462956, 1.125855, 1.192347, 0, 0, 0, 1, 1,
2.516478, -0.9421143, 1.636888, 0, 0, 0, 1, 1,
2.520885, 1.078694, 0.3481181, 1, 1, 1, 1, 1,
2.564495, 0.143804, 0.8574328, 1, 1, 1, 1, 1,
2.614168, 0.03394429, 1.361643, 1, 1, 1, 1, 1,
2.819692, 0.5001177, 2.39049, 1, 1, 1, 1, 1,
2.830144, 1.494414, 0.6447858, 1, 1, 1, 1, 1,
3.059199, -0.6710107, 2.621669, 1, 1, 1, 1, 1,
3.265413, 0.1807147, 1.874568, 1, 1, 1, 1, 1
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
var radius = 9.428506;
var distance = 33.11723;
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
mvMatrix.translate( -0.06632519, 0.00842309, -0.1164923 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.11723);
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
