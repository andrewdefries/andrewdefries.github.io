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
-3.086384, -2.702327, -2.488094, 1, 0, 0, 1,
-2.934879, -0.4872576, -2.008411, 1, 0.007843138, 0, 1,
-2.906552, 0.7500662, -1.480191, 1, 0.01176471, 0, 1,
-2.776995, -0.9935005, -2.212694, 1, 0.01960784, 0, 1,
-2.705935, 1.139909, -1.462466, 1, 0.02352941, 0, 1,
-2.662418, 0.3204221, -1.705414, 1, 0.03137255, 0, 1,
-2.589989, -0.321233, -1.237925, 1, 0.03529412, 0, 1,
-2.544583, 0.05545611, -1.338687, 1, 0.04313726, 0, 1,
-2.503376, 0.2634147, -1.989605, 1, 0.04705882, 0, 1,
-2.389949, 1.201669, 0.7611453, 1, 0.05490196, 0, 1,
-2.330448, -1.355898, -3.935106, 1, 0.05882353, 0, 1,
-2.269213, 0.4424716, -2.318396, 1, 0.06666667, 0, 1,
-2.265006, -0.537542, -1.78023, 1, 0.07058824, 0, 1,
-2.247952, 0.2907819, -1.962105, 1, 0.07843138, 0, 1,
-2.246446, 0.1760809, -1.469472, 1, 0.08235294, 0, 1,
-2.238534, -0.2887209, -2.547177, 1, 0.09019608, 0, 1,
-2.200402, 0.2866643, -1.336054, 1, 0.09411765, 0, 1,
-2.193913, -0.6612222, -1.896407, 1, 0.1019608, 0, 1,
-2.163663, -0.8445661, -2.070866, 1, 0.1098039, 0, 1,
-2.156171, 1.008448, 0.1153524, 1, 0.1137255, 0, 1,
-2.123824, -0.1601555, -0.3687322, 1, 0.1215686, 0, 1,
-2.110057, 0.4270613, -0.9289751, 1, 0.1254902, 0, 1,
-2.108819, -0.9927427, -2.887882, 1, 0.1333333, 0, 1,
-2.084104, 0.04278645, -2.352043, 1, 0.1372549, 0, 1,
-2.068179, 0.3219463, -1.480211, 1, 0.145098, 0, 1,
-2.058629, 1.1007, -2.352894, 1, 0.1490196, 0, 1,
-1.990829, -1.009827, -0.6875252, 1, 0.1568628, 0, 1,
-1.982988, 0.3368515, -3.772613, 1, 0.1607843, 0, 1,
-1.969426, -0.3291748, -1.40985, 1, 0.1686275, 0, 1,
-1.965045, -0.06520938, -0.4740636, 1, 0.172549, 0, 1,
-1.938815, -0.1860669, -1.107578, 1, 0.1803922, 0, 1,
-1.933037, 0.2034545, -1.992556, 1, 0.1843137, 0, 1,
-1.918256, 0.3093473, -1.778952, 1, 0.1921569, 0, 1,
-1.912197, 0.8605593, -0.9515568, 1, 0.1960784, 0, 1,
-1.895847, 0.912273, 0.37647, 1, 0.2039216, 0, 1,
-1.891864, 0.9073502, -0.7035084, 1, 0.2117647, 0, 1,
-1.882893, 1.933747, -1.630095, 1, 0.2156863, 0, 1,
-1.841787, -0.4503219, -0.7615142, 1, 0.2235294, 0, 1,
-1.830539, -0.08697884, -1.985148, 1, 0.227451, 0, 1,
-1.828518, 1.389635, 0.2760722, 1, 0.2352941, 0, 1,
-1.776782, -0.1088047, -0.3511549, 1, 0.2392157, 0, 1,
-1.766942, -0.9692454, -3.715502, 1, 0.2470588, 0, 1,
-1.765652, 0.488595, -0.1026942, 1, 0.2509804, 0, 1,
-1.762396, -0.3982786, -3.007663, 1, 0.2588235, 0, 1,
-1.752585, -0.3425094, -2.662473, 1, 0.2627451, 0, 1,
-1.748259, -1.317269, -1.238112, 1, 0.2705882, 0, 1,
-1.744552, -0.4114052, -2.3585, 1, 0.2745098, 0, 1,
-1.731336, 0.572217, -1.059896, 1, 0.282353, 0, 1,
-1.730858, 0.1081562, -2.372515, 1, 0.2862745, 0, 1,
-1.670197, 0.7276717, -1.153121, 1, 0.2941177, 0, 1,
-1.653968, -1.385343, -3.236074, 1, 0.3019608, 0, 1,
-1.649542, -0.05132457, -2.67782, 1, 0.3058824, 0, 1,
-1.647152, 0.1768408, -1.015778, 1, 0.3137255, 0, 1,
-1.629769, 0.4769144, -1.152938, 1, 0.3176471, 0, 1,
-1.623741, 0.2721379, -1.856447, 1, 0.3254902, 0, 1,
-1.620757, 1.630859, -0.08710487, 1, 0.3294118, 0, 1,
-1.611816, 0.5465512, -3.435976, 1, 0.3372549, 0, 1,
-1.60663, -1.052421, -2.807636, 1, 0.3411765, 0, 1,
-1.599106, 0.2641623, -0.8148249, 1, 0.3490196, 0, 1,
-1.597925, 0.184107, -1.94658, 1, 0.3529412, 0, 1,
-1.586238, 0.2031192, -1.001183, 1, 0.3607843, 0, 1,
-1.577122, 1.915813, -0.4736451, 1, 0.3647059, 0, 1,
-1.57679, 0.387396, -3.233192, 1, 0.372549, 0, 1,
-1.575713, -1.505539, -1.744583, 1, 0.3764706, 0, 1,
-1.571815, -0.8605693, -1.822082, 1, 0.3843137, 0, 1,
-1.550836, 0.8904797, -1.438261, 1, 0.3882353, 0, 1,
-1.547534, -0.08473266, -1.61581, 1, 0.3960784, 0, 1,
-1.547083, 1.506143, -0.5519855, 1, 0.4039216, 0, 1,
-1.543377, 1.729361, -0.6871313, 1, 0.4078431, 0, 1,
-1.522859, -0.9064076, -1.648517, 1, 0.4156863, 0, 1,
-1.506163, 0.4555672, -2.42468, 1, 0.4196078, 0, 1,
-1.492034, -0.01523218, 0.1094239, 1, 0.427451, 0, 1,
-1.475712, -0.2400131, -0.1507924, 1, 0.4313726, 0, 1,
-1.466329, 0.4319932, 0.1917416, 1, 0.4392157, 0, 1,
-1.46444, -0.5384742, -2.635612, 1, 0.4431373, 0, 1,
-1.464038, 1.110938, -1.050249, 1, 0.4509804, 0, 1,
-1.446682, -1.510329, -1.115891, 1, 0.454902, 0, 1,
-1.446233, -0.4226494, -1.856958, 1, 0.4627451, 0, 1,
-1.444037, -0.1020538, -0.9210934, 1, 0.4666667, 0, 1,
-1.436209, -0.4540532, -3.464447, 1, 0.4745098, 0, 1,
-1.435825, 0.6289174, 1.581803, 1, 0.4784314, 0, 1,
-1.424292, 1.49239, -1.084251, 1, 0.4862745, 0, 1,
-1.422341, -0.8462864, -1.969767, 1, 0.4901961, 0, 1,
-1.421467, 0.7986711, -0.01065164, 1, 0.4980392, 0, 1,
-1.403303, 1.055048, -1.982935, 1, 0.5058824, 0, 1,
-1.401447, 0.2028199, -0.7722813, 1, 0.509804, 0, 1,
-1.391173, 0.5127605, -1.444193, 1, 0.5176471, 0, 1,
-1.386752, -0.3916568, -2.960513, 1, 0.5215687, 0, 1,
-1.361984, -1.241177, -1.760604, 1, 0.5294118, 0, 1,
-1.361069, 1.270583, -0.7746276, 1, 0.5333334, 0, 1,
-1.356022, -0.7828293, -2.326986, 1, 0.5411765, 0, 1,
-1.336449, -0.6546901, -3.436004, 1, 0.5450981, 0, 1,
-1.333642, 0.6223724, -1.167801, 1, 0.5529412, 0, 1,
-1.323364, 0.4681816, -2.912068, 1, 0.5568628, 0, 1,
-1.315525, -1.816709, -1.112396, 1, 0.5647059, 0, 1,
-1.314119, 0.7989447, -1.536309, 1, 0.5686275, 0, 1,
-1.313499, 0.807978, 0.3196273, 1, 0.5764706, 0, 1,
-1.303221, -0.3928195, -0.2621608, 1, 0.5803922, 0, 1,
-1.302765, 1.135394, -1.658076, 1, 0.5882353, 0, 1,
-1.301692, 0.9022663, -1.946652, 1, 0.5921569, 0, 1,
-1.300804, -0.1503222, -1.554032, 1, 0.6, 0, 1,
-1.298774, 0.169255, -1.058026, 1, 0.6078432, 0, 1,
-1.295267, 1.006654, -1.15693, 1, 0.6117647, 0, 1,
-1.295264, -1.429849, -1.038358, 1, 0.6196079, 0, 1,
-1.294104, -0.6131572, -1.450521, 1, 0.6235294, 0, 1,
-1.288169, 2.111597, -1.19276, 1, 0.6313726, 0, 1,
-1.270797, 1.319187, -2.014409, 1, 0.6352941, 0, 1,
-1.267705, 0.5450468, -1.454491, 1, 0.6431373, 0, 1,
-1.265565, -0.5975657, -1.507258, 1, 0.6470588, 0, 1,
-1.2568, 0.7125477, -0.4554515, 1, 0.654902, 0, 1,
-1.25666, -2.116991, -3.192527, 1, 0.6588235, 0, 1,
-1.255102, -1.298183, -1.165278, 1, 0.6666667, 0, 1,
-1.244999, -0.4422732, -2.091773, 1, 0.6705883, 0, 1,
-1.243631, 0.5563176, -0.7629862, 1, 0.6784314, 0, 1,
-1.228932, -0.04362042, -2.564261, 1, 0.682353, 0, 1,
-1.228864, 0.8351427, -2.253088, 1, 0.6901961, 0, 1,
-1.213267, 0.09813137, -2.137793, 1, 0.6941177, 0, 1,
-1.210949, -0.7080274, -2.247339, 1, 0.7019608, 0, 1,
-1.206144, -0.04872783, -0.9588721, 1, 0.7098039, 0, 1,
-1.204808, -0.3613731, -1.464381, 1, 0.7137255, 0, 1,
-1.203458, -0.3659379, -2.609525, 1, 0.7215686, 0, 1,
-1.20034, 1.036058, 0.3193812, 1, 0.7254902, 0, 1,
-1.19603, 0.6402568, -1.313659, 1, 0.7333333, 0, 1,
-1.190034, -0.1009106, 0.175751, 1, 0.7372549, 0, 1,
-1.189592, 0.5091729, -0.9798786, 1, 0.7450981, 0, 1,
-1.185917, -1.001887, -0.8541174, 1, 0.7490196, 0, 1,
-1.184328, 0.6142207, -0.1948347, 1, 0.7568628, 0, 1,
-1.181882, 1.713143, -0.952562, 1, 0.7607843, 0, 1,
-1.177493, 0.02154201, -1.102199, 1, 0.7686275, 0, 1,
-1.175975, 0.5110042, -0.7810093, 1, 0.772549, 0, 1,
-1.173401, 0.5454761, -1.132361, 1, 0.7803922, 0, 1,
-1.171187, 1.217336, -1.145365, 1, 0.7843137, 0, 1,
-1.169268, -1.504075, -2.139317, 1, 0.7921569, 0, 1,
-1.168627, 1.100435, -0.8532539, 1, 0.7960784, 0, 1,
-1.154366, -1.675923, -2.570159, 1, 0.8039216, 0, 1,
-1.15239, -0.06387131, -3.759612, 1, 0.8117647, 0, 1,
-1.141869, 0.170309, -0.9801299, 1, 0.8156863, 0, 1,
-1.140346, 0.7366877, -0.6111721, 1, 0.8235294, 0, 1,
-1.139964, -0.6054192, -1.221538, 1, 0.827451, 0, 1,
-1.138103, 0.9817609, -0.6792961, 1, 0.8352941, 0, 1,
-1.137168, 0.03390916, -1.582396, 1, 0.8392157, 0, 1,
-1.135052, -0.7860268, -1.919504, 1, 0.8470588, 0, 1,
-1.132333, -0.8542673, -0.9489282, 1, 0.8509804, 0, 1,
-1.124373, -1.15332, -1.747828, 1, 0.8588235, 0, 1,
-1.12301, 2.29091, -0.4972802, 1, 0.8627451, 0, 1,
-1.122358, -0.2941843, -0.471031, 1, 0.8705882, 0, 1,
-1.115967, 1.483317, 0.00815416, 1, 0.8745098, 0, 1,
-1.115036, -0.6470235, -2.821502, 1, 0.8823529, 0, 1,
-1.113381, -0.9457543, -1.485102, 1, 0.8862745, 0, 1,
-1.112367, -1.246834, -1.786955, 1, 0.8941177, 0, 1,
-1.111361, 0.3747592, -2.57573, 1, 0.8980392, 0, 1,
-1.107798, 0.8301751, -0.9575135, 1, 0.9058824, 0, 1,
-1.096638, -1.640141, -3.464802, 1, 0.9137255, 0, 1,
-1.081486, 0.5293559, 0.06179085, 1, 0.9176471, 0, 1,
-1.080582, 0.7976477, 0.2079249, 1, 0.9254902, 0, 1,
-1.079153, -0.1372423, -2.196331, 1, 0.9294118, 0, 1,
-1.064843, -1.045673, -1.937862, 1, 0.9372549, 0, 1,
-1.058752, -1.896849, -4.801232, 1, 0.9411765, 0, 1,
-1.054225, 0.07004389, -2.406895, 1, 0.9490196, 0, 1,
-1.054175, 0.3799345, -2.286851, 1, 0.9529412, 0, 1,
-1.045678, -0.9311897, -3.435599, 1, 0.9607843, 0, 1,
-1.033661, 0.2901659, -0.5267663, 1, 0.9647059, 0, 1,
-1.030957, 0.3042349, -0.5319555, 1, 0.972549, 0, 1,
-1.03072, -0.1428165, -3.585077, 1, 0.9764706, 0, 1,
-1.017213, 0.9778876, -1.565987, 1, 0.9843137, 0, 1,
-1.011256, -0.8636258, -2.793602, 1, 0.9882353, 0, 1,
-1.004877, 1.002378, -0.446463, 1, 0.9960784, 0, 1,
-1.003732, 0.5158857, -0.8507702, 0.9960784, 1, 0, 1,
-1.002284, -2.263398, -1.734948, 0.9921569, 1, 0, 1,
-0.9992608, 1.328031, -1.446323, 0.9843137, 1, 0, 1,
-0.9860373, 1.27447, -0.4918033, 0.9803922, 1, 0, 1,
-0.9801132, 0.4803162, -1.689658, 0.972549, 1, 0, 1,
-0.9783428, -0.04773321, -0.814635, 0.9686275, 1, 0, 1,
-0.9723458, -0.6908029, -2.770926, 0.9607843, 1, 0, 1,
-0.961125, -0.03062765, -2.729048, 0.9568627, 1, 0, 1,
-0.9571465, 0.8172808, 0.5523037, 0.9490196, 1, 0, 1,
-0.9466801, 0.2606236, -0.4157535, 0.945098, 1, 0, 1,
-0.9448958, 1.512876, -0.1531016, 0.9372549, 1, 0, 1,
-0.9448179, -0.5406145, -2.893019, 0.9333333, 1, 0, 1,
-0.9440894, 0.7274059, -0.4856496, 0.9254902, 1, 0, 1,
-0.9404386, -0.4614215, -1.860305, 0.9215686, 1, 0, 1,
-0.9343498, 0.1496397, -1.185076, 0.9137255, 1, 0, 1,
-0.9330417, 2.589755, -0.432571, 0.9098039, 1, 0, 1,
-0.9329785, 1.382707, 0.7719297, 0.9019608, 1, 0, 1,
-0.9257476, 0.2828261, 0.02466318, 0.8941177, 1, 0, 1,
-0.9233691, 0.09439156, -2.776561, 0.8901961, 1, 0, 1,
-0.9216402, 0.1504813, -2.930596, 0.8823529, 1, 0, 1,
-0.905008, -0.7518163, -2.619212, 0.8784314, 1, 0, 1,
-0.9000864, 1.475491, 0.46167, 0.8705882, 1, 0, 1,
-0.8995414, 1.465596, -2.093972, 0.8666667, 1, 0, 1,
-0.8898581, -0.08600623, -0.4656768, 0.8588235, 1, 0, 1,
-0.8887072, 1.896425, -1.378431, 0.854902, 1, 0, 1,
-0.8852751, -0.1176287, -1.80254, 0.8470588, 1, 0, 1,
-0.8741607, -0.2443824, -0.4486546, 0.8431373, 1, 0, 1,
-0.872291, -0.7250683, -2.381916, 0.8352941, 1, 0, 1,
-0.8665182, 1.857077, 0.9783448, 0.8313726, 1, 0, 1,
-0.8650582, -0.03094299, -2.169622, 0.8235294, 1, 0, 1,
-0.8636956, -0.4069493, -2.588009, 0.8196079, 1, 0, 1,
-0.8634854, -0.2961518, -1.161413, 0.8117647, 1, 0, 1,
-0.8627237, -0.0658901, -1.484365, 0.8078431, 1, 0, 1,
-0.8585777, -0.07136645, 1.045613, 0.8, 1, 0, 1,
-0.8582922, -0.8816209, -2.996817, 0.7921569, 1, 0, 1,
-0.8557068, 0.05920989, -3.096616, 0.7882353, 1, 0, 1,
-0.8533551, 0.4860637, -1.660773, 0.7803922, 1, 0, 1,
-0.8518882, 0.170709, -1.366537, 0.7764706, 1, 0, 1,
-0.8513995, 1.530808, -1.040604, 0.7686275, 1, 0, 1,
-0.8511808, -0.3417039, -1.419296, 0.7647059, 1, 0, 1,
-0.8436273, -1.450986, -2.043727, 0.7568628, 1, 0, 1,
-0.8434333, 1.479219, 0.3556968, 0.7529412, 1, 0, 1,
-0.8430372, -0.2412873, -2.531999, 0.7450981, 1, 0, 1,
-0.8420996, -0.9082969, -4.798781, 0.7411765, 1, 0, 1,
-0.8364565, 0.1270231, -1.204395, 0.7333333, 1, 0, 1,
-0.8357728, 1.462497, -0.3900129, 0.7294118, 1, 0, 1,
-0.8322348, -0.5019814, -0.9681703, 0.7215686, 1, 0, 1,
-0.8311672, -1.072318, -2.268071, 0.7176471, 1, 0, 1,
-0.8241498, 1.407675, -0.4552723, 0.7098039, 1, 0, 1,
-0.8213676, 0.8314446, -1.04244, 0.7058824, 1, 0, 1,
-0.820895, 1.661692, 0.4784703, 0.6980392, 1, 0, 1,
-0.8125075, 0.2727287, 1.480612, 0.6901961, 1, 0, 1,
-0.805634, -0.679153, -1.210408, 0.6862745, 1, 0, 1,
-0.8042484, 1.11074, -2.868433, 0.6784314, 1, 0, 1,
-0.7999273, -0.8572901, -1.886464, 0.6745098, 1, 0, 1,
-0.7916613, 0.07179405, -1.257776, 0.6666667, 1, 0, 1,
-0.7909725, -0.9915287, -3.602852, 0.6627451, 1, 0, 1,
-0.788948, 0.5904229, -1.137304, 0.654902, 1, 0, 1,
-0.7886744, -0.3773552, -1.552895, 0.6509804, 1, 0, 1,
-0.7879532, 0.07419364, -1.124982, 0.6431373, 1, 0, 1,
-0.7865479, -1.79212, -2.49016, 0.6392157, 1, 0, 1,
-0.785594, 0.9746529, 1.206494, 0.6313726, 1, 0, 1,
-0.7802895, -1.007171, -2.080115, 0.627451, 1, 0, 1,
-0.779983, 0.1195782, -2.104208, 0.6196079, 1, 0, 1,
-0.773267, 0.7689042, -2.146651, 0.6156863, 1, 0, 1,
-0.7716145, -0.02944962, -1.643235, 0.6078432, 1, 0, 1,
-0.7710378, -1.205095, -4.019041, 0.6039216, 1, 0, 1,
-0.7671524, 1.077541, -0.1666734, 0.5960785, 1, 0, 1,
-0.7655926, 0.236846, -1.850304, 0.5882353, 1, 0, 1,
-0.761732, -0.7322227, -3.028134, 0.5843138, 1, 0, 1,
-0.7587312, 0.8779388, -2.730402, 0.5764706, 1, 0, 1,
-0.7579131, 0.1508024, -0.2017697, 0.572549, 1, 0, 1,
-0.7472223, 0.4009052, -1.927612, 0.5647059, 1, 0, 1,
-0.7382538, -0.8550801, -1.849469, 0.5607843, 1, 0, 1,
-0.7355891, -1.759862, -1.402701, 0.5529412, 1, 0, 1,
-0.7297118, -0.7802693, -1.887162, 0.5490196, 1, 0, 1,
-0.7277133, 0.8997338, -1.620148, 0.5411765, 1, 0, 1,
-0.7272688, -1.040871, -3.198975, 0.5372549, 1, 0, 1,
-0.7211657, -1.0336, -3.227375, 0.5294118, 1, 0, 1,
-0.7192868, -0.5982816, -1.181646, 0.5254902, 1, 0, 1,
-0.7156503, 0.3935106, 0.5336521, 0.5176471, 1, 0, 1,
-0.7106315, 1.354227, -0.2400687, 0.5137255, 1, 0, 1,
-0.7072486, -0.8235382, -1.463547, 0.5058824, 1, 0, 1,
-0.7058848, 0.2717923, 0.9676084, 0.5019608, 1, 0, 1,
-0.7056037, -1.931129, -1.374743, 0.4941176, 1, 0, 1,
-0.7053623, -0.8373182, -2.769749, 0.4862745, 1, 0, 1,
-0.7028015, -0.1330178, -1.361562, 0.4823529, 1, 0, 1,
-0.6995816, -1.121931, -2.705681, 0.4745098, 1, 0, 1,
-0.6978554, 0.2892089, -0.7415166, 0.4705882, 1, 0, 1,
-0.6909584, 0.05290151, 0.2109466, 0.4627451, 1, 0, 1,
-0.6897612, -0.1969084, -0.3998252, 0.4588235, 1, 0, 1,
-0.6881194, 1.119656, -0.5456753, 0.4509804, 1, 0, 1,
-0.6854826, 1.474618, -3.146386, 0.4470588, 1, 0, 1,
-0.6810474, -0.3639616, -1.213046, 0.4392157, 1, 0, 1,
-0.6810183, 1.848373, -0.8666267, 0.4352941, 1, 0, 1,
-0.6794345, 0.1868461, -1.252864, 0.427451, 1, 0, 1,
-0.6789538, -1.39528, -2.968283, 0.4235294, 1, 0, 1,
-0.6765935, 0.3529373, -1.731165, 0.4156863, 1, 0, 1,
-0.6684324, 1.202775, -2.223578, 0.4117647, 1, 0, 1,
-0.6620768, 0.5901395, -0.8763786, 0.4039216, 1, 0, 1,
-0.6607997, 0.8464382, -0.5573286, 0.3960784, 1, 0, 1,
-0.6591722, -0.276522, -1.164353, 0.3921569, 1, 0, 1,
-0.6551827, -0.5541175, -2.594467, 0.3843137, 1, 0, 1,
-0.6528969, 0.2022794, -1.587587, 0.3803922, 1, 0, 1,
-0.6512389, -1.505477, -3.272535, 0.372549, 1, 0, 1,
-0.64276, -1.054464, -2.822253, 0.3686275, 1, 0, 1,
-0.6406665, 0.5855331, -0.8331001, 0.3607843, 1, 0, 1,
-0.6402907, -2.393893, -2.115617, 0.3568628, 1, 0, 1,
-0.635961, -0.07606634, -2.979438, 0.3490196, 1, 0, 1,
-0.6355907, -0.3916043, -3.461124, 0.345098, 1, 0, 1,
-0.6332462, 0.3531857, -0.688144, 0.3372549, 1, 0, 1,
-0.6292002, -0.9655542, -1.325264, 0.3333333, 1, 0, 1,
-0.6290331, -0.449854, -2.256188, 0.3254902, 1, 0, 1,
-0.6278464, -0.6370406, -3.064893, 0.3215686, 1, 0, 1,
-0.625886, -0.6707755, -3.112213, 0.3137255, 1, 0, 1,
-0.6227499, 2.079621, -1.822786, 0.3098039, 1, 0, 1,
-0.6210545, 0.851327, -0.9170938, 0.3019608, 1, 0, 1,
-0.6200366, 0.8554483, 0.4720376, 0.2941177, 1, 0, 1,
-0.6193331, -0.1076757, -0.920464, 0.2901961, 1, 0, 1,
-0.6189632, -0.2688552, -1.83346, 0.282353, 1, 0, 1,
-0.6185447, 1.250705, -0.7547532, 0.2784314, 1, 0, 1,
-0.6112545, -1.278654, -0.8304504, 0.2705882, 1, 0, 1,
-0.6086603, 0.4433153, 0.3146129, 0.2666667, 1, 0, 1,
-0.6046516, -1.20621, -3.026967, 0.2588235, 1, 0, 1,
-0.6002355, -1.502458, -1.540621, 0.254902, 1, 0, 1,
-0.5958541, 0.9837934, -0.03921378, 0.2470588, 1, 0, 1,
-0.5939847, 0.1585717, -0.5867022, 0.2431373, 1, 0, 1,
-0.591301, 2.407925, -0.428645, 0.2352941, 1, 0, 1,
-0.5896439, 0.6461103, -1.623987, 0.2313726, 1, 0, 1,
-0.5886432, 0.2659132, -0.4994012, 0.2235294, 1, 0, 1,
-0.5883482, -0.5042214, -2.50768, 0.2196078, 1, 0, 1,
-0.5875838, -0.8318444, -2.480909, 0.2117647, 1, 0, 1,
-0.5854658, 0.02842917, -0.05833812, 0.2078431, 1, 0, 1,
-0.5832059, -1.534339, -3.693544, 0.2, 1, 0, 1,
-0.5809343, 0.5586418, -0.1232638, 0.1921569, 1, 0, 1,
-0.571234, 0.5235205, -2.318937, 0.1882353, 1, 0, 1,
-0.5674946, -0.4669284, -1.048662, 0.1803922, 1, 0, 1,
-0.5632935, 0.7436693, 0.03106639, 0.1764706, 1, 0, 1,
-0.5629485, -0.5330067, -1.726164, 0.1686275, 1, 0, 1,
-0.5566372, 0.5463163, -0.3551817, 0.1647059, 1, 0, 1,
-0.553817, 0.9756043, -2.384991, 0.1568628, 1, 0, 1,
-0.5535778, -0.1530192, -2.556997, 0.1529412, 1, 0, 1,
-0.5456065, -0.2000334, -2.529281, 0.145098, 1, 0, 1,
-0.5321423, 0.3861017, 0.1107244, 0.1411765, 1, 0, 1,
-0.5304, 0.04212246, -4.426976, 0.1333333, 1, 0, 1,
-0.5283224, -0.1071417, -0.04620972, 0.1294118, 1, 0, 1,
-0.5196927, 0.2864099, -1.768524, 0.1215686, 1, 0, 1,
-0.5170219, -1.274488, -2.814683, 0.1176471, 1, 0, 1,
-0.5134266, 0.6785956, -2.686878, 0.1098039, 1, 0, 1,
-0.5132662, -0.6037166, -2.775437, 0.1058824, 1, 0, 1,
-0.5131027, 1.274915, -1.649412, 0.09803922, 1, 0, 1,
-0.5088475, -1.372776, -4.709073, 0.09019608, 1, 0, 1,
-0.5057405, -1.184665, -1.220822, 0.08627451, 1, 0, 1,
-0.503204, -1.280377, -2.584498, 0.07843138, 1, 0, 1,
-0.5016406, -0.4376721, -2.252075, 0.07450981, 1, 0, 1,
-0.4923795, -0.02505621, -1.887443, 0.06666667, 1, 0, 1,
-0.4857331, 1.248867, 0.228881, 0.0627451, 1, 0, 1,
-0.4807075, 0.8778881, 1.636739, 0.05490196, 1, 0, 1,
-0.4791023, -0.6336741, -3.40783, 0.05098039, 1, 0, 1,
-0.4723746, -0.0801928, -4.26472, 0.04313726, 1, 0, 1,
-0.4713798, -0.1017324, -0.7140706, 0.03921569, 1, 0, 1,
-0.4707876, -0.1451637, 0.02067837, 0.03137255, 1, 0, 1,
-0.4657376, -1.513709, -2.260576, 0.02745098, 1, 0, 1,
-0.4637555, 0.532788, -1.671011, 0.01960784, 1, 0, 1,
-0.4635537, -0.4571116, -2.970145, 0.01568628, 1, 0, 1,
-0.4615714, -0.963965, -1.860681, 0.007843138, 1, 0, 1,
-0.4548815, -0.3184949, -2.477565, 0.003921569, 1, 0, 1,
-0.4548101, 1.234997, 1.221748, 0, 1, 0.003921569, 1,
-0.4542068, 0.3346509, -1.855604, 0, 1, 0.01176471, 1,
-0.4477352, 1.560619, 2.119773, 0, 1, 0.01568628, 1,
-0.4471153, 2.029914, 0.1738098, 0, 1, 0.02352941, 1,
-0.4458316, 0.6252609, 0.152468, 0, 1, 0.02745098, 1,
-0.445059, -0.8600991, -3.218291, 0, 1, 0.03529412, 1,
-0.4445469, -0.3041669, -4.277932, 0, 1, 0.03921569, 1,
-0.4443461, 2.723641, -0.4540582, 0, 1, 0.04705882, 1,
-0.4438874, 1.147023, -0.8863249, 0, 1, 0.05098039, 1,
-0.4426928, 0.8736888, -1.057776, 0, 1, 0.05882353, 1,
-0.4420317, -1.956359, -3.406395, 0, 1, 0.0627451, 1,
-0.4418386, -0.5224371, -5.054697, 0, 1, 0.07058824, 1,
-0.4317358, 0.686596, -0.3503851, 0, 1, 0.07450981, 1,
-0.4299029, -0.8163826, -2.081847, 0, 1, 0.08235294, 1,
-0.427838, -0.9604425, -2.123231, 0, 1, 0.08627451, 1,
-0.4235803, 0.3781219, -0.3748548, 0, 1, 0.09411765, 1,
-0.4228494, 0.4982934, -0.2065925, 0, 1, 0.1019608, 1,
-0.4201662, 0.9795392, 0.8297424, 0, 1, 0.1058824, 1,
-0.4109093, -0.06478105, -2.095717, 0, 1, 0.1137255, 1,
-0.4045312, 0.2546387, 0.1897372, 0, 1, 0.1176471, 1,
-0.4013127, -1.206561, -2.172789, 0, 1, 0.1254902, 1,
-0.3986773, -0.06493977, -1.598991, 0, 1, 0.1294118, 1,
-0.3951359, -0.7122477, -3.301612, 0, 1, 0.1372549, 1,
-0.3941151, -1.225943, -4.224972, 0, 1, 0.1411765, 1,
-0.3885328, 0.6699215, 1.117712, 0, 1, 0.1490196, 1,
-0.3869815, -2.043897, -2.415868, 0, 1, 0.1529412, 1,
-0.3867136, 0.4370485, -0.3056208, 0, 1, 0.1607843, 1,
-0.3862947, 0.2598131, -1.818248, 0, 1, 0.1647059, 1,
-0.3855337, 3.104799, 0.3484165, 0, 1, 0.172549, 1,
-0.3852715, 0.8895189, -2.40399, 0, 1, 0.1764706, 1,
-0.3842417, 0.6322171, -0.8827704, 0, 1, 0.1843137, 1,
-0.3825867, 0.3116601, -0.5690807, 0, 1, 0.1882353, 1,
-0.3743431, -0.2378834, -1.175545, 0, 1, 0.1960784, 1,
-0.3681355, 0.06741681, -0.9593137, 0, 1, 0.2039216, 1,
-0.3666575, 0.7294555, 0.7684391, 0, 1, 0.2078431, 1,
-0.3649816, 0.1348214, -1.175636, 0, 1, 0.2156863, 1,
-0.3622116, -1.846887, -3.117692, 0, 1, 0.2196078, 1,
-0.3608837, -0.5817388, -2.497371, 0, 1, 0.227451, 1,
-0.3596067, -0.9765258, -2.380832, 0, 1, 0.2313726, 1,
-0.355345, 0.1125084, -2.023123, 0, 1, 0.2392157, 1,
-0.3440877, -0.03621925, -1.276503, 0, 1, 0.2431373, 1,
-0.3402264, -0.878968, -3.765651, 0, 1, 0.2509804, 1,
-0.3281105, -0.6742485, -2.054111, 0, 1, 0.254902, 1,
-0.3278567, -0.6422201, -3.64255, 0, 1, 0.2627451, 1,
-0.327547, 0.1440405, 0.4297348, 0, 1, 0.2666667, 1,
-0.325865, -1.237625, -3.698834, 0, 1, 0.2745098, 1,
-0.3231597, 0.6644126, -0.9263178, 0, 1, 0.2784314, 1,
-0.3227274, -1.437667, -1.87443, 0, 1, 0.2862745, 1,
-0.3226803, -1.271264, -2.591616, 0, 1, 0.2901961, 1,
-0.3204115, -0.01307732, -1.761893, 0, 1, 0.2980392, 1,
-0.3092157, 0.1800844, -0.9569949, 0, 1, 0.3058824, 1,
-0.3082705, -1.50801, -0.12797, 0, 1, 0.3098039, 1,
-0.3056546, -2.434268, -1.279473, 0, 1, 0.3176471, 1,
-0.2975474, 1.377872, -0.06511795, 0, 1, 0.3215686, 1,
-0.2954489, -0.6589988, -2.032892, 0, 1, 0.3294118, 1,
-0.2944359, 1.335275, -0.06533036, 0, 1, 0.3333333, 1,
-0.294311, -0.9285037, -1.731276, 0, 1, 0.3411765, 1,
-0.2907764, -0.191193, -0.4268514, 0, 1, 0.345098, 1,
-0.2880163, -1.106795, -2.359852, 0, 1, 0.3529412, 1,
-0.2870699, -1.868286, -3.525658, 0, 1, 0.3568628, 1,
-0.2841949, 0.5723152, -0.538912, 0, 1, 0.3647059, 1,
-0.2804858, 1.750304, 0.708969, 0, 1, 0.3686275, 1,
-0.2783123, -0.2841022, -3.020192, 0, 1, 0.3764706, 1,
-0.2745574, 1.861701, -1.273238, 0, 1, 0.3803922, 1,
-0.2698256, -0.2979234, -2.340402, 0, 1, 0.3882353, 1,
-0.268102, 0.6570765, -1.374341, 0, 1, 0.3921569, 1,
-0.2622993, -0.5133033, -4.597184, 0, 1, 0.4, 1,
-0.2546386, 0.4018568, 0.6435957, 0, 1, 0.4078431, 1,
-0.2520152, 0.9913633, 0.8456808, 0, 1, 0.4117647, 1,
-0.2502413, -0.5152645, -2.322754, 0, 1, 0.4196078, 1,
-0.2500268, 1.446416, 0.3836693, 0, 1, 0.4235294, 1,
-0.2497815, -0.5268487, -2.622478, 0, 1, 0.4313726, 1,
-0.2416707, 0.768213, 0.1123923, 0, 1, 0.4352941, 1,
-0.2378544, -1.258327, -2.86126, 0, 1, 0.4431373, 1,
-0.236908, 1.348133, 0.2186177, 0, 1, 0.4470588, 1,
-0.2356692, 0.9854205, -0.2800184, 0, 1, 0.454902, 1,
-0.2345467, -1.42544, -3.465027, 0, 1, 0.4588235, 1,
-0.2321263, 0.5065461, -2.18418, 0, 1, 0.4666667, 1,
-0.2305822, -0.5272328, -4.142488, 0, 1, 0.4705882, 1,
-0.2301719, -0.1849, -1.641421, 0, 1, 0.4784314, 1,
-0.2299637, 0.6644566, 0.2109578, 0, 1, 0.4823529, 1,
-0.2264599, 0.5839575, -2.566686, 0, 1, 0.4901961, 1,
-0.225849, -1.118084, -2.192124, 0, 1, 0.4941176, 1,
-0.2221728, -1.28828, -2.907686, 0, 1, 0.5019608, 1,
-0.2221129, -0.2134985, -1.798017, 0, 1, 0.509804, 1,
-0.2121784, 0.2729188, -0.5743868, 0, 1, 0.5137255, 1,
-0.2086975, 0.2188775, 0.3707586, 0, 1, 0.5215687, 1,
-0.2054847, -0.7266746, -1.189922, 0, 1, 0.5254902, 1,
-0.1984278, 0.3002149, -0.7670646, 0, 1, 0.5333334, 1,
-0.1943707, -0.5032434, -2.63219, 0, 1, 0.5372549, 1,
-0.1940641, -1.938159, -3.027953, 0, 1, 0.5450981, 1,
-0.1924584, -1.497737, -2.981305, 0, 1, 0.5490196, 1,
-0.1922637, 0.2139958, -1.961789, 0, 1, 0.5568628, 1,
-0.1887719, 2.301544, 0.2346659, 0, 1, 0.5607843, 1,
-0.1831349, -0.9427517, -4.332839, 0, 1, 0.5686275, 1,
-0.1823264, -1.186051, -1.664048, 0, 1, 0.572549, 1,
-0.1757686, -0.4703395, -4.359543, 0, 1, 0.5803922, 1,
-0.1688663, 1.987624, -1.566947, 0, 1, 0.5843138, 1,
-0.1682495, 0.8019246, 0.4015488, 0, 1, 0.5921569, 1,
-0.1658142, 1.432039, -1.106247, 0, 1, 0.5960785, 1,
-0.1652794, -0.02005335, -0.8019755, 0, 1, 0.6039216, 1,
-0.1601749, 0.7781434, -0.3487853, 0, 1, 0.6117647, 1,
-0.1594142, 0.8379576, -2.076022, 0, 1, 0.6156863, 1,
-0.1592522, -1.543469, -3.722331, 0, 1, 0.6235294, 1,
-0.1588542, 0.09395498, 0.3711021, 0, 1, 0.627451, 1,
-0.1559943, 0.6084003, -0.9616026, 0, 1, 0.6352941, 1,
-0.1514568, 1.320219, -0.3349745, 0, 1, 0.6392157, 1,
-0.1500575, 0.1646505, -1.975656, 0, 1, 0.6470588, 1,
-0.1457161, 0.1627578, -0.1029755, 0, 1, 0.6509804, 1,
-0.143252, 0.7799038, 1.163488, 0, 1, 0.6588235, 1,
-0.1415082, 0.5815295, 1.072766, 0, 1, 0.6627451, 1,
-0.1379038, -0.08868512, -0.8077817, 0, 1, 0.6705883, 1,
-0.1325905, -0.2713262, -3.951162, 0, 1, 0.6745098, 1,
-0.131911, 0.5332477, -1.057546, 0, 1, 0.682353, 1,
-0.1280597, 0.6199536, -0.874137, 0, 1, 0.6862745, 1,
-0.1265278, 0.4304401, -1.256529, 0, 1, 0.6941177, 1,
-0.1166211, 0.783783, -0.379117, 0, 1, 0.7019608, 1,
-0.1158493, -0.8102075, -2.064536, 0, 1, 0.7058824, 1,
-0.1156579, -0.1631812, -1.757008, 0, 1, 0.7137255, 1,
-0.1145052, 0.3412153, -0.3550959, 0, 1, 0.7176471, 1,
-0.1119394, -0.5037449, -2.872339, 0, 1, 0.7254902, 1,
-0.111463, -0.1874145, -1.685625, 0, 1, 0.7294118, 1,
-0.1103149, 0.7830194, 0.1565417, 0, 1, 0.7372549, 1,
-0.1087695, 1.429723, -2.112133, 0, 1, 0.7411765, 1,
-0.108516, 0.3094912, -0.4727332, 0, 1, 0.7490196, 1,
-0.1084118, 0.8128707, -0.678845, 0, 1, 0.7529412, 1,
-0.1081853, -0.3772108, -2.460095, 0, 1, 0.7607843, 1,
-0.1056041, 0.6460823, -1.144256, 0, 1, 0.7647059, 1,
-0.1042836, 0.8164734, -2.482627, 0, 1, 0.772549, 1,
-0.1027134, 1.330654, -0.5423248, 0, 1, 0.7764706, 1,
-0.1008601, 0.1334205, -0.8486166, 0, 1, 0.7843137, 1,
-0.09759998, 0.1522998, -0.9256736, 0, 1, 0.7882353, 1,
-0.09747442, -0.02243895, -3.240466, 0, 1, 0.7960784, 1,
-0.09119707, 0.05228923, -2.522823, 0, 1, 0.8039216, 1,
-0.08924701, 0.6021016, -0.1984048, 0, 1, 0.8078431, 1,
-0.07674208, 0.3359753, -0.6525206, 0, 1, 0.8156863, 1,
-0.07296488, 1.642375, 0.4220565, 0, 1, 0.8196079, 1,
-0.06943057, 0.08627833, -0.03041787, 0, 1, 0.827451, 1,
-0.06639143, 0.004327161, -1.66857, 0, 1, 0.8313726, 1,
-0.06599762, -0.635182, -4.324597, 0, 1, 0.8392157, 1,
-0.06576096, 0.3229612, 1.776443, 0, 1, 0.8431373, 1,
-0.06570122, 0.5966371, -1.384801, 0, 1, 0.8509804, 1,
-0.06415033, -0.3893412, -2.15349, 0, 1, 0.854902, 1,
-0.06281256, -0.3820821, -3.063778, 0, 1, 0.8627451, 1,
-0.06136433, 0.7432028, 1.300041, 0, 1, 0.8666667, 1,
-0.06130588, 1.154437, -0.1134502, 0, 1, 0.8745098, 1,
-0.05834578, -0.0120243, -1.892696, 0, 1, 0.8784314, 1,
-0.05725424, -0.7917245, -4.411649, 0, 1, 0.8862745, 1,
-0.05356622, -0.8395851, -2.59552, 0, 1, 0.8901961, 1,
-0.04839021, 0.3034829, -1.470985, 0, 1, 0.8980392, 1,
-0.04838607, -1.615931, -1.766266, 0, 1, 0.9058824, 1,
-0.04696151, 0.378387, -0.7837475, 0, 1, 0.9098039, 1,
-0.04688428, -0.1217809, -4.747728, 0, 1, 0.9176471, 1,
-0.04364137, 1.138976, 1.2868, 0, 1, 0.9215686, 1,
-0.03764027, 2.084391, 0.5130742, 0, 1, 0.9294118, 1,
-0.03433001, 0.2997525, 0.6479104, 0, 1, 0.9333333, 1,
-0.03235263, -0.1229029, -3.089125, 0, 1, 0.9411765, 1,
-0.03215185, 0.4531007, -0.09140908, 0, 1, 0.945098, 1,
-0.02913918, -0.3896931, -2.032325, 0, 1, 0.9529412, 1,
-0.02221351, 0.2265726, 0.3693147, 0, 1, 0.9568627, 1,
-0.02078116, 0.5246413, 0.3852142, 0, 1, 0.9647059, 1,
-0.01418142, -1.105821, -2.169659, 0, 1, 0.9686275, 1,
-0.01389077, 0.06046361, 1.552786, 0, 1, 0.9764706, 1,
-0.01265772, -1.205065, -3.024302, 0, 1, 0.9803922, 1,
-0.01241616, -0.02528584, -4.518777, 0, 1, 0.9882353, 1,
-0.01155153, 0.3339598, 0.1887756, 0, 1, 0.9921569, 1,
-0.008540272, -0.8365587, -3.646327, 0, 1, 1, 1,
-0.007134929, 0.8262172, 0.2614926, 0, 0.9921569, 1, 1,
-0.002715048, 0.1933976, -1.595711, 0, 0.9882353, 1, 1,
-0.002376378, 0.1522656, 0.9844825, 0, 0.9803922, 1, 1,
-0.0001648122, 1.758525, 0.9830856, 0, 0.9764706, 1, 1,
0.0004975659, -0.7729106, 2.670922, 0, 0.9686275, 1, 1,
0.001875888, 0.2584673, -0.3530794, 0, 0.9647059, 1, 1,
0.004185161, -0.9511286, 3.831988, 0, 0.9568627, 1, 1,
0.007182041, -0.4170972, 3.924206, 0, 0.9529412, 1, 1,
0.007882107, 0.2552755, 0.7527524, 0, 0.945098, 1, 1,
0.01833018, -0.9968435, 4.402898, 0, 0.9411765, 1, 1,
0.02033344, -1.804692, 4.268414, 0, 0.9333333, 1, 1,
0.02060067, 0.5277799, 0.8467349, 0, 0.9294118, 1, 1,
0.02141993, -0.6074505, 3.13274, 0, 0.9215686, 1, 1,
0.02716863, 1.032042, -0.006440192, 0, 0.9176471, 1, 1,
0.02809872, 0.183226, 0.2952208, 0, 0.9098039, 1, 1,
0.0283192, -0.320643, 3.257003, 0, 0.9058824, 1, 1,
0.02959433, -0.006327432, 2.966996, 0, 0.8980392, 1, 1,
0.02978789, -1.069635, 4.182866, 0, 0.8901961, 1, 1,
0.03182513, 0.3319864, -0.1835285, 0, 0.8862745, 1, 1,
0.0367558, 0.3889172, -0.9559308, 0, 0.8784314, 1, 1,
0.03834634, 1.099595, 0.9466212, 0, 0.8745098, 1, 1,
0.03867686, 0.7214484, 0.1438902, 0, 0.8666667, 1, 1,
0.03908542, 0.02537837, 0.5673627, 0, 0.8627451, 1, 1,
0.04377728, 1.177556, 0.2192258, 0, 0.854902, 1, 1,
0.04388241, -0.6731562, 3.335994, 0, 0.8509804, 1, 1,
0.04551316, -1.588056, 3.54978, 0, 0.8431373, 1, 1,
0.04575736, -0.5573382, 3.578013, 0, 0.8392157, 1, 1,
0.04873835, -0.1549271, 0.5975541, 0, 0.8313726, 1, 1,
0.05332062, 1.740197, 2.420834, 0, 0.827451, 1, 1,
0.05498921, -0.7083055, 3.531671, 0, 0.8196079, 1, 1,
0.05771535, -1.065113, 4.42816, 0, 0.8156863, 1, 1,
0.06039735, 1.805763, -0.7801607, 0, 0.8078431, 1, 1,
0.06098673, 0.3634657, -0.4156567, 0, 0.8039216, 1, 1,
0.06101893, -0.4738873, 3.342207, 0, 0.7960784, 1, 1,
0.06120999, 0.551317, -0.4721359, 0, 0.7882353, 1, 1,
0.06354326, 2.064348, -2.235032, 0, 0.7843137, 1, 1,
0.06566938, 0.4427985, 0.8936029, 0, 0.7764706, 1, 1,
0.06810189, 1.16267, -0.8447198, 0, 0.772549, 1, 1,
0.07383982, 1.01143, 0.3969996, 0, 0.7647059, 1, 1,
0.07618295, -1.984057, 3.745892, 0, 0.7607843, 1, 1,
0.07651521, 0.002111402, 1.04465, 0, 0.7529412, 1, 1,
0.08139414, 1.502902, -0.4901398, 0, 0.7490196, 1, 1,
0.08156002, 1.360864, 0.2438411, 0, 0.7411765, 1, 1,
0.08161814, 0.01981182, 1.42975, 0, 0.7372549, 1, 1,
0.08343416, -0.4168891, 3.911137, 0, 0.7294118, 1, 1,
0.08689599, -0.2338418, 1.689587, 0, 0.7254902, 1, 1,
0.08840133, 0.4467036, -1.054645, 0, 0.7176471, 1, 1,
0.08902241, -1.389809, 3.615236, 0, 0.7137255, 1, 1,
0.09163217, -0.442425, 2.105022, 0, 0.7058824, 1, 1,
0.09424935, 1.192827, -1.191825, 0, 0.6980392, 1, 1,
0.09627451, 1.670201, 0.2666644, 0, 0.6941177, 1, 1,
0.09917128, 0.3194055, -0.5901183, 0, 0.6862745, 1, 1,
0.1005214, -0.2032655, 2.56651, 0, 0.682353, 1, 1,
0.1006446, -0.2532786, 1.643982, 0, 0.6745098, 1, 1,
0.1009828, 2.411819, 0.2061128, 0, 0.6705883, 1, 1,
0.1031283, -0.7250476, 2.377363, 0, 0.6627451, 1, 1,
0.1049269, -0.142612, 3.21889, 0, 0.6588235, 1, 1,
0.1073661, -1.835388, 3.759943, 0, 0.6509804, 1, 1,
0.1115388, 1.038621, 1.44156, 0, 0.6470588, 1, 1,
0.1164664, 0.8684471, -0.588617, 0, 0.6392157, 1, 1,
0.1173547, -0.5174611, 3.699895, 0, 0.6352941, 1, 1,
0.1184302, 1.745978, -0.9139305, 0, 0.627451, 1, 1,
0.1197077, 0.8124155, -1.554349, 0, 0.6235294, 1, 1,
0.1228366, 0.3238633, 0.7585943, 0, 0.6156863, 1, 1,
0.1255684, -0.4167771, 1.488733, 0, 0.6117647, 1, 1,
0.1256295, -0.6147758, 4.314523, 0, 0.6039216, 1, 1,
0.1265121, -0.3944268, 3.007641, 0, 0.5960785, 1, 1,
0.1307819, 0.2427843, 0.8735038, 0, 0.5921569, 1, 1,
0.1309954, -0.2197474, 4.732924, 0, 0.5843138, 1, 1,
0.1359672, -0.6540653, 1.708857, 0, 0.5803922, 1, 1,
0.1378915, -0.5268389, 4.602585, 0, 0.572549, 1, 1,
0.1381809, -1.194548, 4.847883, 0, 0.5686275, 1, 1,
0.1389711, -1.202774, 5.452159, 0, 0.5607843, 1, 1,
0.1393566, -0.6362716, 3.987805, 0, 0.5568628, 1, 1,
0.1401786, -1.581711, 4.121154, 0, 0.5490196, 1, 1,
0.147667, 1.264182, 0.7702794, 0, 0.5450981, 1, 1,
0.1496413, 0.6897665, 0.4719747, 0, 0.5372549, 1, 1,
0.1547649, -2.07424, 2.149024, 0, 0.5333334, 1, 1,
0.1580531, -0.004746725, 3.2828, 0, 0.5254902, 1, 1,
0.160149, 1.827444, -0.5476585, 0, 0.5215687, 1, 1,
0.1608184, -1.421738, 2.466214, 0, 0.5137255, 1, 1,
0.161648, -0.3837142, 1.359041, 0, 0.509804, 1, 1,
0.1621074, -0.5566516, 3.126144, 0, 0.5019608, 1, 1,
0.1623536, 0.6748775, -0.02833002, 0, 0.4941176, 1, 1,
0.1635072, 1.424135, 0.6163565, 0, 0.4901961, 1, 1,
0.1661204, 0.4208447, 0.5004304, 0, 0.4823529, 1, 1,
0.1708069, 0.675244, 0.2696097, 0, 0.4784314, 1, 1,
0.1751049, 0.1727453, 0.6300335, 0, 0.4705882, 1, 1,
0.1772297, -0.3587674, 2.741627, 0, 0.4666667, 1, 1,
0.1825966, -0.6484592, 3.050922, 0, 0.4588235, 1, 1,
0.185932, 1.731778, 0.7030104, 0, 0.454902, 1, 1,
0.187795, 0.1412026, 1.779274, 0, 0.4470588, 1, 1,
0.1924591, 0.7728972, -0.9708, 0, 0.4431373, 1, 1,
0.1938363, -0.9670542, 2.889649, 0, 0.4352941, 1, 1,
0.1983949, -0.1935384, 1.285287, 0, 0.4313726, 1, 1,
0.1999282, -1.209237, 2.992446, 0, 0.4235294, 1, 1,
0.1999626, -0.756431, 2.351751, 0, 0.4196078, 1, 1,
0.2012871, 0.3301741, 1.965969, 0, 0.4117647, 1, 1,
0.2015035, -0.1337928, 3.873144, 0, 0.4078431, 1, 1,
0.2028193, 0.2366134, 0.7222406, 0, 0.4, 1, 1,
0.203288, -0.510935, 2.814538, 0, 0.3921569, 1, 1,
0.2126382, -0.03644227, 1.517015, 0, 0.3882353, 1, 1,
0.2131916, -1.082971, 4.839536, 0, 0.3803922, 1, 1,
0.2144666, 0.5058585, 1.009478, 0, 0.3764706, 1, 1,
0.2240737, 0.02920689, 1.385063, 0, 0.3686275, 1, 1,
0.2242425, -1.822468, 3.298831, 0, 0.3647059, 1, 1,
0.2247281, -0.1274474, 2.361777, 0, 0.3568628, 1, 1,
0.2264327, -0.2622312, 4.418531, 0, 0.3529412, 1, 1,
0.2268916, 0.7615889, 1.964824, 0, 0.345098, 1, 1,
0.2314463, 0.8555369, -1.426161, 0, 0.3411765, 1, 1,
0.2317112, 0.169803, 2.466259, 0, 0.3333333, 1, 1,
0.2326351, 1.853792, -0.275411, 0, 0.3294118, 1, 1,
0.2356417, -0.7996275, 2.67254, 0, 0.3215686, 1, 1,
0.2373964, 1.19235, -0.2987007, 0, 0.3176471, 1, 1,
0.2410849, 1.501127, -1.919325, 0, 0.3098039, 1, 1,
0.2414507, -1.914611, 3.014675, 0, 0.3058824, 1, 1,
0.2475611, 0.9158422, 1.443621, 0, 0.2980392, 1, 1,
0.250411, -0.3548926, 2.425471, 0, 0.2901961, 1, 1,
0.2575116, 0.1852781, 1.108661, 0, 0.2862745, 1, 1,
0.2590987, -1.196753, 5.400403, 0, 0.2784314, 1, 1,
0.2721735, -1.640513, 4.528778, 0, 0.2745098, 1, 1,
0.2725465, -0.03389557, 2.467713, 0, 0.2666667, 1, 1,
0.276202, 0.6266838, -0.2723929, 0, 0.2627451, 1, 1,
0.2766808, -0.8173212, 2.293372, 0, 0.254902, 1, 1,
0.2869609, -2.215956, 4.093359, 0, 0.2509804, 1, 1,
0.2963924, 1.411208, 0.06998007, 0, 0.2431373, 1, 1,
0.3004776, 0.007192172, 1.747403, 0, 0.2392157, 1, 1,
0.3022521, 0.7748597, 0.04765238, 0, 0.2313726, 1, 1,
0.3023615, -0.5191061, 3.004005, 0, 0.227451, 1, 1,
0.3035759, -0.7651917, 2.693677, 0, 0.2196078, 1, 1,
0.309211, -1.113216, 4.737044, 0, 0.2156863, 1, 1,
0.3119911, -1.548196, 2.765774, 0, 0.2078431, 1, 1,
0.3146973, -1.387527, 4.073221, 0, 0.2039216, 1, 1,
0.3190174, 0.1586335, 1.360072, 0, 0.1960784, 1, 1,
0.3264335, -1.291134, 4.068355, 0, 0.1882353, 1, 1,
0.3276138, 0.6568059, 1.871444, 0, 0.1843137, 1, 1,
0.3284352, 0.610108, 0.5861095, 0, 0.1764706, 1, 1,
0.3290941, -0.92085, 2.103333, 0, 0.172549, 1, 1,
0.3333457, 0.4942662, 0.08623596, 0, 0.1647059, 1, 1,
0.337076, 1.37164, -1.624368, 0, 0.1607843, 1, 1,
0.3394077, 1.163119, -0.9628679, 0, 0.1529412, 1, 1,
0.3411495, 2.146902, 0.1182586, 0, 0.1490196, 1, 1,
0.3436183, 0.05887807, -0.8738106, 0, 0.1411765, 1, 1,
0.3443868, -1.746878, 1.795853, 0, 0.1372549, 1, 1,
0.3454772, 0.3850489, 1.132712, 0, 0.1294118, 1, 1,
0.3465787, 0.3223902, 0.5115744, 0, 0.1254902, 1, 1,
0.3472763, -2.130249, 3.829459, 0, 0.1176471, 1, 1,
0.3500198, -0.3411556, 2.953989, 0, 0.1137255, 1, 1,
0.3582107, 2.778224, -0.2280024, 0, 0.1058824, 1, 1,
0.3583115, -0.8485574, 3.529487, 0, 0.09803922, 1, 1,
0.3594259, -1.790585, 1.803787, 0, 0.09411765, 1, 1,
0.3644566, 1.288033, 1.853818, 0, 0.08627451, 1, 1,
0.3647144, 1.371943, 0.4907655, 0, 0.08235294, 1, 1,
0.3674619, -0.6143231, 1.771614, 0, 0.07450981, 1, 1,
0.3674822, 0.4537684, 0.4936452, 0, 0.07058824, 1, 1,
0.3698311, 0.148016, 2.714219, 0, 0.0627451, 1, 1,
0.3708444, -1.10383, 2.462916, 0, 0.05882353, 1, 1,
0.3713681, -0.374533, 1.776088, 0, 0.05098039, 1, 1,
0.373182, -0.7389483, 3.541014, 0, 0.04705882, 1, 1,
0.3790237, 0.5644472, 0.9278607, 0, 0.03921569, 1, 1,
0.3803573, 0.142862, 1.068148, 0, 0.03529412, 1, 1,
0.3836488, -1.687383, 1.397892, 0, 0.02745098, 1, 1,
0.3871367, -0.5945489, 0.6940692, 0, 0.02352941, 1, 1,
0.3898139, -1.675743, 2.96289, 0, 0.01568628, 1, 1,
0.3929033, -0.8844252, 4.099515, 0, 0.01176471, 1, 1,
0.3961454, 1.930432, -0.8988664, 0, 0.003921569, 1, 1,
0.4009531, -1.424435, 3.10682, 0.003921569, 0, 1, 1,
0.4030553, 1.507393, 0.3766296, 0.007843138, 0, 1, 1,
0.4083654, 0.09767469, 1.722952, 0.01568628, 0, 1, 1,
0.4111154, -0.02988341, 1.662705, 0.01960784, 0, 1, 1,
0.4166462, 0.596464, 0.2098221, 0.02745098, 0, 1, 1,
0.420896, 0.1856807, 1.325044, 0.03137255, 0, 1, 1,
0.4268337, -1.928401, 2.885618, 0.03921569, 0, 1, 1,
0.4277723, 0.4460991, 0.815844, 0.04313726, 0, 1, 1,
0.4334029, -0.8509225, 3.406698, 0.05098039, 0, 1, 1,
0.436324, 1.718221, -0.4919578, 0.05490196, 0, 1, 1,
0.4406759, 0.1541256, 2.183405, 0.0627451, 0, 1, 1,
0.4429271, 0.5112128, 2.016617, 0.06666667, 0, 1, 1,
0.4450726, -1.563521, 3.212281, 0.07450981, 0, 1, 1,
0.4481919, 1.364444, 1.100497, 0.07843138, 0, 1, 1,
0.4510208, 0.5714878, 1.663376, 0.08627451, 0, 1, 1,
0.4517282, 0.4363903, -0.2027582, 0.09019608, 0, 1, 1,
0.45246, 1.197532, 0.9025844, 0.09803922, 0, 1, 1,
0.4530788, 0.7565236, 0.5070189, 0.1058824, 0, 1, 1,
0.4541304, -2.197277, 0.8594871, 0.1098039, 0, 1, 1,
0.4565023, 0.6869004, 0.2712599, 0.1176471, 0, 1, 1,
0.4609359, 0.1501107, 0.7658522, 0.1215686, 0, 1, 1,
0.4617554, -0.1755463, 2.353637, 0.1294118, 0, 1, 1,
0.4672598, -1.054132, 3.203535, 0.1333333, 0, 1, 1,
0.4717624, -0.09418642, 1.586557, 0.1411765, 0, 1, 1,
0.4825025, -1.091727, 3.85665, 0.145098, 0, 1, 1,
0.4846956, -2.533549, 2.8896, 0.1529412, 0, 1, 1,
0.4860019, -0.8313497, 2.179227, 0.1568628, 0, 1, 1,
0.49371, 0.5102298, 1.030234, 0.1647059, 0, 1, 1,
0.4944381, 0.3571148, 1.607356, 0.1686275, 0, 1, 1,
0.5060394, -0.5864588, 2.074703, 0.1764706, 0, 1, 1,
0.5159541, -1.356371, 3.518299, 0.1803922, 0, 1, 1,
0.5169515, -1.242068, 4.731137, 0.1882353, 0, 1, 1,
0.5182052, -0.0921417, 2.260419, 0.1921569, 0, 1, 1,
0.5211602, -2.158439, 2.818023, 0.2, 0, 1, 1,
0.5234737, 0.8073946, 0.3141645, 0.2078431, 0, 1, 1,
0.525099, 0.2691188, 1.861898, 0.2117647, 0, 1, 1,
0.5350001, -0.2968775, 1.346996, 0.2196078, 0, 1, 1,
0.5376735, -1.723374, 3.131481, 0.2235294, 0, 1, 1,
0.5385624, -0.1494999, 2.315375, 0.2313726, 0, 1, 1,
0.5429071, 1.51555, -0.02926634, 0.2352941, 0, 1, 1,
0.5469832, 1.872477, 0.3595661, 0.2431373, 0, 1, 1,
0.5475444, 0.6044588, 1.06542, 0.2470588, 0, 1, 1,
0.5508531, -0.03795803, 1.501195, 0.254902, 0, 1, 1,
0.5520393, -0.5922658, 4.817509, 0.2588235, 0, 1, 1,
0.5548005, 0.1196967, -0.2230429, 0.2666667, 0, 1, 1,
0.559899, 0.3811703, 1.146953, 0.2705882, 0, 1, 1,
0.5607718, -2.042387, 2.591044, 0.2784314, 0, 1, 1,
0.5617174, -0.9676215, 2.345027, 0.282353, 0, 1, 1,
0.5645958, 0.1832749, 2.428077, 0.2901961, 0, 1, 1,
0.5694008, 0.209963, 1.32985, 0.2941177, 0, 1, 1,
0.5741265, 0.7799039, -0.4660388, 0.3019608, 0, 1, 1,
0.5762621, -0.4368495, 0.1524288, 0.3098039, 0, 1, 1,
0.5835396, -0.5313528, 0.6041141, 0.3137255, 0, 1, 1,
0.5836994, 1.330651, 2.001403, 0.3215686, 0, 1, 1,
0.5848488, -0.09245098, 0.02731617, 0.3254902, 0, 1, 1,
0.5894949, -0.2813373, 1.042711, 0.3333333, 0, 1, 1,
0.5902862, 1.564927, 3.179675, 0.3372549, 0, 1, 1,
0.5919935, 1.965985, -0.1212251, 0.345098, 0, 1, 1,
0.596266, 0.3897552, 1.837746, 0.3490196, 0, 1, 1,
0.5963253, 0.0170177, 3.756029, 0.3568628, 0, 1, 1,
0.6037133, 1.06315, 1.387237, 0.3607843, 0, 1, 1,
0.6273331, -1.029307, 2.556397, 0.3686275, 0, 1, 1,
0.627862, 0.3520868, 1.320123, 0.372549, 0, 1, 1,
0.6305496, -1.229425, 3.002604, 0.3803922, 0, 1, 1,
0.6348729, 1.388034, 0.2179549, 0.3843137, 0, 1, 1,
0.6437368, -0.3298846, 3.006992, 0.3921569, 0, 1, 1,
0.6450125, -0.649669, 3.271615, 0.3960784, 0, 1, 1,
0.6462035, 1.410718, 0.7136344, 0.4039216, 0, 1, 1,
0.6463242, 0.3741337, 1.067362, 0.4117647, 0, 1, 1,
0.6504, 0.2573211, 2.283032, 0.4156863, 0, 1, 1,
0.6517822, 0.2249095, 2.841057, 0.4235294, 0, 1, 1,
0.6563987, 0.8252981, -0.4293379, 0.427451, 0, 1, 1,
0.6585739, 1.657052, 0.8200475, 0.4352941, 0, 1, 1,
0.6589246, -0.9321569, 2.0041, 0.4392157, 0, 1, 1,
0.6599822, -0.4212642, 2.617381, 0.4470588, 0, 1, 1,
0.6672144, -0.8106661, 2.781032, 0.4509804, 0, 1, 1,
0.6674231, 1.203046, 0.7271971, 0.4588235, 0, 1, 1,
0.6689208, -1.620904, 3.701697, 0.4627451, 0, 1, 1,
0.6709557, -0.705895, 1.76741, 0.4705882, 0, 1, 1,
0.6737826, -0.912356, 2.693229, 0.4745098, 0, 1, 1,
0.6743745, -0.3935565, 0.9623222, 0.4823529, 0, 1, 1,
0.6746663, -1.023026, 4.015185, 0.4862745, 0, 1, 1,
0.6753176, 0.3298629, 1.057133, 0.4941176, 0, 1, 1,
0.6820006, -0.8216064, 3.205606, 0.5019608, 0, 1, 1,
0.6845248, -0.246746, 0.9939297, 0.5058824, 0, 1, 1,
0.6863954, 1.00189, -1.800231, 0.5137255, 0, 1, 1,
0.6921405, 2.111573, 1.031951, 0.5176471, 0, 1, 1,
0.6995741, -0.4182124, 2.09846, 0.5254902, 0, 1, 1,
0.7007582, 1.906269, 0.9631428, 0.5294118, 0, 1, 1,
0.7035885, -1.000046, 3.117859, 0.5372549, 0, 1, 1,
0.706507, -0.5514651, 1.045473, 0.5411765, 0, 1, 1,
0.7218448, 0.7585437, 1.380123, 0.5490196, 0, 1, 1,
0.7229167, -0.6468474, 1.446508, 0.5529412, 0, 1, 1,
0.7238201, -1.569077, 1.108889, 0.5607843, 0, 1, 1,
0.72895, -0.9012439, 2.203916, 0.5647059, 0, 1, 1,
0.7334057, -1.22108, 1.436375, 0.572549, 0, 1, 1,
0.7359798, 1.324673, 0.4026315, 0.5764706, 0, 1, 1,
0.7397488, -0.4621359, 2.48258, 0.5843138, 0, 1, 1,
0.7469802, 0.05958256, 2.107658, 0.5882353, 0, 1, 1,
0.7497841, -0.2558309, 3.411391, 0.5960785, 0, 1, 1,
0.7518307, -0.4129604, 2.805759, 0.6039216, 0, 1, 1,
0.7528977, 0.1936581, 0.7017059, 0.6078432, 0, 1, 1,
0.7531551, 0.06308737, 1.76443, 0.6156863, 0, 1, 1,
0.7534283, -0.2668119, 2.878338, 0.6196079, 0, 1, 1,
0.763044, -0.4093389, 3.179383, 0.627451, 0, 1, 1,
0.7634883, -0.3986477, 2.629229, 0.6313726, 0, 1, 1,
0.7638719, 2.273846, 0.8841566, 0.6392157, 0, 1, 1,
0.764547, 2.10883, 0.814284, 0.6431373, 0, 1, 1,
0.7709068, -0.1846226, 1.042035, 0.6509804, 0, 1, 1,
0.7741953, -1.619544, 1.533277, 0.654902, 0, 1, 1,
0.7814452, 1.558625, -0.09325852, 0.6627451, 0, 1, 1,
0.7820702, 1.799368, 1.812023, 0.6666667, 0, 1, 1,
0.7859153, 0.2649125, 1.541864, 0.6745098, 0, 1, 1,
0.7859827, -1.324616, 2.632587, 0.6784314, 0, 1, 1,
0.7907857, 1.304813, 0.1184494, 0.6862745, 0, 1, 1,
0.7965003, -1.680495, 1.83418, 0.6901961, 0, 1, 1,
0.7991947, 0.5772851, -0.3854961, 0.6980392, 0, 1, 1,
0.804733, 0.7782217, 0.6387439, 0.7058824, 0, 1, 1,
0.8051271, 1.021086, 0.3593734, 0.7098039, 0, 1, 1,
0.8058401, 0.380545, -1.256083, 0.7176471, 0, 1, 1,
0.8075333, 1.441182, 0.7222472, 0.7215686, 0, 1, 1,
0.8081372, 1.794342, 0.8733402, 0.7294118, 0, 1, 1,
0.808495, 0.8952891, 1.666462, 0.7333333, 0, 1, 1,
0.8153631, 0.3083295, 1.729939, 0.7411765, 0, 1, 1,
0.8222024, 0.5074438, 3.060444, 0.7450981, 0, 1, 1,
0.8259597, 1.131961, 0.1177698, 0.7529412, 0, 1, 1,
0.8260686, -0.002618345, 4.085547, 0.7568628, 0, 1, 1,
0.8328171, -0.3637241, 2.371648, 0.7647059, 0, 1, 1,
0.8347771, 0.2033761, 3.418838, 0.7686275, 0, 1, 1,
0.8352554, 0.5106928, -0.2575277, 0.7764706, 0, 1, 1,
0.8359262, -1.093311, 3.755785, 0.7803922, 0, 1, 1,
0.8397985, -1.299216, 3.486723, 0.7882353, 0, 1, 1,
0.8410258, 0.1933612, 2.330035, 0.7921569, 0, 1, 1,
0.8416143, -1.141421, 2.448265, 0.8, 0, 1, 1,
0.84407, -0.5818387, 0.4311336, 0.8078431, 0, 1, 1,
0.852128, 0.2318162, 0.5747753, 0.8117647, 0, 1, 1,
0.8536586, 2.845752, -0.2566197, 0.8196079, 0, 1, 1,
0.8552449, 0.5745995, 1.06692, 0.8235294, 0, 1, 1,
0.856608, 2.974105, 0.681883, 0.8313726, 0, 1, 1,
0.8706933, -2.574418, 1.077281, 0.8352941, 0, 1, 1,
0.8714726, -0.4497472, 3.685732, 0.8431373, 0, 1, 1,
0.8752407, 0.5373623, 1.052801, 0.8470588, 0, 1, 1,
0.8759048, -0.3942181, 2.66458, 0.854902, 0, 1, 1,
0.8786324, -0.3210185, 2.339763, 0.8588235, 0, 1, 1,
0.879059, -0.9197168, 3.310702, 0.8666667, 0, 1, 1,
0.8834212, -0.3713129, 1.863915, 0.8705882, 0, 1, 1,
0.8875839, -2.524999, 4.816047, 0.8784314, 0, 1, 1,
0.8928406, 0.8257164, 1.337476, 0.8823529, 0, 1, 1,
0.8933945, 0.4655851, 0.7810404, 0.8901961, 0, 1, 1,
0.8941243, 0.5283998, 1.731271, 0.8941177, 0, 1, 1,
0.8972616, -0.3163569, 1.415759, 0.9019608, 0, 1, 1,
0.901547, -0.5323107, 1.36918, 0.9098039, 0, 1, 1,
0.9019797, -0.8805812, 4.400117, 0.9137255, 0, 1, 1,
0.9063187, -1.120713, 1.243829, 0.9215686, 0, 1, 1,
0.913766, -0.0860744, 1.080468, 0.9254902, 0, 1, 1,
0.918947, -0.7270155, 3.23328, 0.9333333, 0, 1, 1,
0.9236594, 0.1482864, 1.783316, 0.9372549, 0, 1, 1,
0.9274183, -0.2799646, 2.191467, 0.945098, 0, 1, 1,
0.9353441, -0.8039844, 2.312054, 0.9490196, 0, 1, 1,
0.9370105, 0.1303663, -0.5858808, 0.9568627, 0, 1, 1,
0.945303, -0.1680734, 1.746669, 0.9607843, 0, 1, 1,
0.9462719, 0.3813011, 0.8062806, 0.9686275, 0, 1, 1,
0.9480563, -1.470608, 2.881309, 0.972549, 0, 1, 1,
0.9487911, 0.1666261, -0.4419916, 0.9803922, 0, 1, 1,
0.9505695, 0.7548628, 0.2475031, 0.9843137, 0, 1, 1,
0.9535464, -0.6496215, 2.668686, 0.9921569, 0, 1, 1,
0.962167, -0.08696002, 3.130522, 0.9960784, 0, 1, 1,
0.9817073, -0.8443065, 2.469887, 1, 0, 0.9960784, 1,
0.9826805, -0.6383172, 2.448161, 1, 0, 0.9882353, 1,
0.9827264, 0.8624496, 2.788215, 1, 0, 0.9843137, 1,
0.9854828, 0.7858837, 1.806255, 1, 0, 0.9764706, 1,
0.9921346, 0.6431091, 1.325427, 1, 0, 0.972549, 1,
0.9935179, -1.954282, 4.011315, 1, 0, 0.9647059, 1,
1.005394, 0.2216458, -0.0505698, 1, 0, 0.9607843, 1,
1.009603, -0.9110953, 3.14729, 1, 0, 0.9529412, 1,
1.010659, -0.7439967, 0.2579231, 1, 0, 0.9490196, 1,
1.014686, 0.8692128, 2.218402, 1, 0, 0.9411765, 1,
1.019257, 0.1530929, 2.391267, 1, 0, 0.9372549, 1,
1.038433, -0.615817, 2.919329, 1, 0, 0.9294118, 1,
1.047215, -0.6470562, 2.411109, 1, 0, 0.9254902, 1,
1.047661, -1.36064, 3.03879, 1, 0, 0.9176471, 1,
1.049676, -0.5688435, 1.916141, 1, 0, 0.9137255, 1,
1.051172, 0.7593856, -0.240513, 1, 0, 0.9058824, 1,
1.055496, -1.829049, 0.9558719, 1, 0, 0.9019608, 1,
1.057362, 0.2030202, 1.603333, 1, 0, 0.8941177, 1,
1.059515, -0.9734526, 2.68504, 1, 0, 0.8862745, 1,
1.062504, -2.036418, 2.668979, 1, 0, 0.8823529, 1,
1.062861, -1.726341, 2.121346, 1, 0, 0.8745098, 1,
1.067749, 0.4054087, 1.749433, 1, 0, 0.8705882, 1,
1.069017, 0.1669729, 1.940703, 1, 0, 0.8627451, 1,
1.069554, -0.1852007, 2.491798, 1, 0, 0.8588235, 1,
1.07028, 0.2668706, 1.469895, 1, 0, 0.8509804, 1,
1.071075, -0.0638088, 0.2005073, 1, 0, 0.8470588, 1,
1.073401, 0.5224576, 2.095138, 1, 0, 0.8392157, 1,
1.079707, 0.2745157, 3.129419, 1, 0, 0.8352941, 1,
1.082712, 1.142808, 0.4094193, 1, 0, 0.827451, 1,
1.08453, 0.1449067, 2.42825, 1, 0, 0.8235294, 1,
1.088107, 0.6862576, 1.354536, 1, 0, 0.8156863, 1,
1.094825, -0.2946554, 3.963372, 1, 0, 0.8117647, 1,
1.095309, 0.03780817, 1.108129, 1, 0, 0.8039216, 1,
1.096417, -0.1058302, 0.756629, 1, 0, 0.7960784, 1,
1.097724, 1.036977, 0.7057131, 1, 0, 0.7921569, 1,
1.099481, -0.2867399, 1.5219, 1, 0, 0.7843137, 1,
1.100613, -0.1194469, 2.983958, 1, 0, 0.7803922, 1,
1.102393, -0.7053922, 1.460678, 1, 0, 0.772549, 1,
1.105571, -0.09756713, 2.14061, 1, 0, 0.7686275, 1,
1.106716, 1.198429, -1.684793, 1, 0, 0.7607843, 1,
1.111843, -1.032779, 3.353054, 1, 0, 0.7568628, 1,
1.11237, 1.224483, 1.199807, 1, 0, 0.7490196, 1,
1.114733, -1.225529, 2.178093, 1, 0, 0.7450981, 1,
1.119395, -0.8968034, 1.928786, 1, 0, 0.7372549, 1,
1.119936, -0.4573324, 2.598826, 1, 0, 0.7333333, 1,
1.122669, 0.6566443, 1.296082, 1, 0, 0.7254902, 1,
1.127575, 0.1882315, 0.8380601, 1, 0, 0.7215686, 1,
1.128084, -0.591302, 1.077852, 1, 0, 0.7137255, 1,
1.137153, 1.165619, -0.5870299, 1, 0, 0.7098039, 1,
1.145819, -0.2229075, 0.5040062, 1, 0, 0.7019608, 1,
1.147119, -1.694772, 2.600304, 1, 0, 0.6941177, 1,
1.151009, -0.1400845, 2.245633, 1, 0, 0.6901961, 1,
1.153455, 0.5566635, 0.8852692, 1, 0, 0.682353, 1,
1.155054, 1.053236, 0.3670819, 1, 0, 0.6784314, 1,
1.160008, 0.7456955, 2.757542, 1, 0, 0.6705883, 1,
1.174492, -0.1229493, 1.281897, 1, 0, 0.6666667, 1,
1.186316, -0.3042377, 1.997629, 1, 0, 0.6588235, 1,
1.188878, 0.3243081, 2.078758, 1, 0, 0.654902, 1,
1.203666, 0.007035817, -0.1557265, 1, 0, 0.6470588, 1,
1.204973, 0.411714, 0.5331872, 1, 0, 0.6431373, 1,
1.208326, -0.9373853, 3.469073, 1, 0, 0.6352941, 1,
1.21318, 1.004353, 1.883573, 1, 0, 0.6313726, 1,
1.214797, 0.694501, 1.439038, 1, 0, 0.6235294, 1,
1.232764, -0.3081901, 4.01071, 1, 0, 0.6196079, 1,
1.237881, 2.403842, 0.5161679, 1, 0, 0.6117647, 1,
1.241449, -1.100559, 2.019744, 1, 0, 0.6078432, 1,
1.248312, 0.6277406, -0.5839331, 1, 0, 0.6, 1,
1.253115, 0.2398753, -0.06199725, 1, 0, 0.5921569, 1,
1.253924, 1.008021, 1.113128, 1, 0, 0.5882353, 1,
1.264143, 1.310234, 2.257173, 1, 0, 0.5803922, 1,
1.278423, -0.5825476, 1.969425, 1, 0, 0.5764706, 1,
1.28234, 1.125587, 0.8285959, 1, 0, 0.5686275, 1,
1.290205, 0.2916996, 0.4440092, 1, 0, 0.5647059, 1,
1.300284, 0.5497383, 2.174196, 1, 0, 0.5568628, 1,
1.32329, 0.2788449, 1.334009, 1, 0, 0.5529412, 1,
1.336616, -1.485525, 0.8902121, 1, 0, 0.5450981, 1,
1.33918, -0.5771619, 0.7230625, 1, 0, 0.5411765, 1,
1.350104, 1.234726, -0.4773798, 1, 0, 0.5333334, 1,
1.355313, -1.381092, 2.041587, 1, 0, 0.5294118, 1,
1.363142, -0.2707406, 2.390625, 1, 0, 0.5215687, 1,
1.36321, -1.401372, 1.440165, 1, 0, 0.5176471, 1,
1.365891, -0.7128599, 3.746595, 1, 0, 0.509804, 1,
1.366446, -0.4456529, 2.474009, 1, 0, 0.5058824, 1,
1.377972, 2.086538, -0.6278321, 1, 0, 0.4980392, 1,
1.380316, 0.6194763, 2.463612, 1, 0, 0.4901961, 1,
1.380842, -0.1183319, 0.6882916, 1, 0, 0.4862745, 1,
1.381379, -2.556213, 3.90646, 1, 0, 0.4784314, 1,
1.395688, 0.2401838, 1.566017, 1, 0, 0.4745098, 1,
1.403001, 2.660196, 0.79763, 1, 0, 0.4666667, 1,
1.407629, 1.162213, 0.7442401, 1, 0, 0.4627451, 1,
1.409117, -0.3138216, 2.180032, 1, 0, 0.454902, 1,
1.415308, -0.505827, 2.681051, 1, 0, 0.4509804, 1,
1.416687, -0.172075, 1.15951, 1, 0, 0.4431373, 1,
1.417076, -0.7530591, 3.334995, 1, 0, 0.4392157, 1,
1.420866, 1.860217, 1.432206, 1, 0, 0.4313726, 1,
1.425783, -0.3485492, 1.862095, 1, 0, 0.427451, 1,
1.429906, 0.8752974, 0.8074079, 1, 0, 0.4196078, 1,
1.443688, 0.6090171, 0.9355677, 1, 0, 0.4156863, 1,
1.450687, -1.023103, 2.262213, 1, 0, 0.4078431, 1,
1.456616, 1.580336, 1.111932, 1, 0, 0.4039216, 1,
1.469435, -0.205683, 2.442336, 1, 0, 0.3960784, 1,
1.487185, 0.7700009, 1.212443, 1, 0, 0.3882353, 1,
1.513752, -0.02330375, 1.265309, 1, 0, 0.3843137, 1,
1.516716, 2.16961, 0.2417634, 1, 0, 0.3764706, 1,
1.519177, 1.372164, 1.578456, 1, 0, 0.372549, 1,
1.527287, 0.139455, 0.2118183, 1, 0, 0.3647059, 1,
1.53875, 0.7786567, 1.051739, 1, 0, 0.3607843, 1,
1.540661, 0.2092384, 0.1938118, 1, 0, 0.3529412, 1,
1.545133, 0.3248369, 0.6530654, 1, 0, 0.3490196, 1,
1.56174, 0.4366343, 0.2759285, 1, 0, 0.3411765, 1,
1.609692, 0.6232805, 1.169699, 1, 0, 0.3372549, 1,
1.625909, 0.8018652, 2.732939, 1, 0, 0.3294118, 1,
1.627592, 0.2761692, 3.035868, 1, 0, 0.3254902, 1,
1.629075, 0.1754441, 2.192297, 1, 0, 0.3176471, 1,
1.633937, 1.553365, 0.09199452, 1, 0, 0.3137255, 1,
1.634643, 0.6507679, 0.7706155, 1, 0, 0.3058824, 1,
1.637505, 1.352577, 1.868092, 1, 0, 0.2980392, 1,
1.640483, -1.441926, 1.418554, 1, 0, 0.2941177, 1,
1.643367, -1.375816, 2.048723, 1, 0, 0.2862745, 1,
1.670989, -0.8634219, 1.014169, 1, 0, 0.282353, 1,
1.673058, 1.016137, 1.231007, 1, 0, 0.2745098, 1,
1.679557, 0.2825261, 0.1567852, 1, 0, 0.2705882, 1,
1.681481, 0.2479599, 1.630358, 1, 0, 0.2627451, 1,
1.697182, 0.1876724, 1.445638, 1, 0, 0.2588235, 1,
1.714007, 0.7954395, 1.992041, 1, 0, 0.2509804, 1,
1.773317, -1.177908, 1.341515, 1, 0, 0.2470588, 1,
1.774503, -0.1564668, 1.347482, 1, 0, 0.2392157, 1,
1.775246, -2.273684, 0.7242821, 1, 0, 0.2352941, 1,
1.819877, 1.547374, 1.062029, 1, 0, 0.227451, 1,
1.820082, -2.443561, 2.891628, 1, 0, 0.2235294, 1,
1.842614, 0.8464948, 0.7325535, 1, 0, 0.2156863, 1,
1.85443, 0.962717, 1.370562, 1, 0, 0.2117647, 1,
1.861579, 0.2976664, 3.088308, 1, 0, 0.2039216, 1,
1.871341, 1.05062, 2.778469, 1, 0, 0.1960784, 1,
1.872644, 0.3299879, 2.428804, 1, 0, 0.1921569, 1,
1.909151, -0.7805101, 3.038128, 1, 0, 0.1843137, 1,
1.909843, 0.5979712, 0.6626569, 1, 0, 0.1803922, 1,
1.936412, -0.795005, 1.626772, 1, 0, 0.172549, 1,
1.941366, -2.129938, 3.129831, 1, 0, 0.1686275, 1,
1.945421, -0.1973788, -0.02877814, 1, 0, 0.1607843, 1,
1.982948, -0.7076471, 0.808065, 1, 0, 0.1568628, 1,
1.988197, 0.440861, 1.840461, 1, 0, 0.1490196, 1,
2.00554, -1.446534, 1.983686, 1, 0, 0.145098, 1,
2.011434, -1.952214, 0.7538536, 1, 0, 0.1372549, 1,
2.036627, 0.5289207, 0.4535677, 1, 0, 0.1333333, 1,
2.110526, 2.123181, 1.434772, 1, 0, 0.1254902, 1,
2.121571, -0.09840626, 1.784462, 1, 0, 0.1215686, 1,
2.123235, 0.2104189, 0.9954507, 1, 0, 0.1137255, 1,
2.127544, 0.1072368, -0.1581238, 1, 0, 0.1098039, 1,
2.135523, 0.7647405, 0.4743587, 1, 0, 0.1019608, 1,
2.171008, 1.109521, 1.789956, 1, 0, 0.09411765, 1,
2.250937, -0.02678457, 0.6010878, 1, 0, 0.09019608, 1,
2.260389, -0.2659342, -0.1867456, 1, 0, 0.08235294, 1,
2.276278, 0.681182, 1.745957, 1, 0, 0.07843138, 1,
2.327924, -1.043725, -0.2632019, 1, 0, 0.07058824, 1,
2.372005, 0.0761523, 2.477636, 1, 0, 0.06666667, 1,
2.378318, -0.2640854, 2.299911, 1, 0, 0.05882353, 1,
2.44967, -0.3438424, 1.505379, 1, 0, 0.05490196, 1,
2.512881, -0.6787496, 1.020002, 1, 0, 0.04705882, 1,
2.554253, 0.4435731, 1.856085, 1, 0, 0.04313726, 1,
2.625306, -0.3248209, 1.12585, 1, 0, 0.03529412, 1,
2.668847, -0.1044977, 2.867472, 1, 0, 0.03137255, 1,
2.694456, -0.9536216, 1.833813, 1, 0, 0.02352941, 1,
2.711689, 1.279338, 2.429075, 1, 0, 0.01960784, 1,
2.812533, 0.4012069, 1.077819, 1, 0, 0.01176471, 1,
2.990632, 0.6737229, 1.286245, 1, 0, 0.007843138, 1
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
-0.04787576, -3.686635, -6.835608, 0, -0.5, 0.5, 0.5,
-0.04787576, -3.686635, -6.835608, 1, -0.5, 0.5, 0.5,
-0.04787576, -3.686635, -6.835608, 1, 1.5, 0.5, 0.5,
-0.04787576, -3.686635, -6.835608, 0, 1.5, 0.5, 0.5
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
-4.116438, 0.2012359, -6.835608, 0, -0.5, 0.5, 0.5,
-4.116438, 0.2012359, -6.835608, 1, -0.5, 0.5, 0.5,
-4.116438, 0.2012359, -6.835608, 1, 1.5, 0.5, 0.5,
-4.116438, 0.2012359, -6.835608, 0, 1.5, 0.5, 0.5
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
-4.116438, -3.686635, 0.1987314, 0, -0.5, 0.5, 0.5,
-4.116438, -3.686635, 0.1987314, 1, -0.5, 0.5, 0.5,
-4.116438, -3.686635, 0.1987314, 1, 1.5, 0.5, 0.5,
-4.116438, -3.686635, 0.1987314, 0, 1.5, 0.5, 0.5
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
-3, -2.789434, -5.212299,
2, -2.789434, -5.212299,
-3, -2.789434, -5.212299,
-3, -2.938968, -5.482851,
-2, -2.789434, -5.212299,
-2, -2.938968, -5.482851,
-1, -2.789434, -5.212299,
-1, -2.938968, -5.482851,
0, -2.789434, -5.212299,
0, -2.938968, -5.482851,
1, -2.789434, -5.212299,
1, -2.938968, -5.482851,
2, -2.789434, -5.212299,
2, -2.938968, -5.482851
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
-3, -3.238035, -6.023954, 0, -0.5, 0.5, 0.5,
-3, -3.238035, -6.023954, 1, -0.5, 0.5, 0.5,
-3, -3.238035, -6.023954, 1, 1.5, 0.5, 0.5,
-3, -3.238035, -6.023954, 0, 1.5, 0.5, 0.5,
-2, -3.238035, -6.023954, 0, -0.5, 0.5, 0.5,
-2, -3.238035, -6.023954, 1, -0.5, 0.5, 0.5,
-2, -3.238035, -6.023954, 1, 1.5, 0.5, 0.5,
-2, -3.238035, -6.023954, 0, 1.5, 0.5, 0.5,
-1, -3.238035, -6.023954, 0, -0.5, 0.5, 0.5,
-1, -3.238035, -6.023954, 1, -0.5, 0.5, 0.5,
-1, -3.238035, -6.023954, 1, 1.5, 0.5, 0.5,
-1, -3.238035, -6.023954, 0, 1.5, 0.5, 0.5,
0, -3.238035, -6.023954, 0, -0.5, 0.5, 0.5,
0, -3.238035, -6.023954, 1, -0.5, 0.5, 0.5,
0, -3.238035, -6.023954, 1, 1.5, 0.5, 0.5,
0, -3.238035, -6.023954, 0, 1.5, 0.5, 0.5,
1, -3.238035, -6.023954, 0, -0.5, 0.5, 0.5,
1, -3.238035, -6.023954, 1, -0.5, 0.5, 0.5,
1, -3.238035, -6.023954, 1, 1.5, 0.5, 0.5,
1, -3.238035, -6.023954, 0, 1.5, 0.5, 0.5,
2, -3.238035, -6.023954, 0, -0.5, 0.5, 0.5,
2, -3.238035, -6.023954, 1, -0.5, 0.5, 0.5,
2, -3.238035, -6.023954, 1, 1.5, 0.5, 0.5,
2, -3.238035, -6.023954, 0, 1.5, 0.5, 0.5
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
-3.177539, -2, -5.212299,
-3.177539, 3, -5.212299,
-3.177539, -2, -5.212299,
-3.334022, -2, -5.482851,
-3.177539, -1, -5.212299,
-3.334022, -1, -5.482851,
-3.177539, 0, -5.212299,
-3.334022, 0, -5.482851,
-3.177539, 1, -5.212299,
-3.334022, 1, -5.482851,
-3.177539, 2, -5.212299,
-3.334022, 2, -5.482851,
-3.177539, 3, -5.212299,
-3.334022, 3, -5.482851
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
-3.646988, -2, -6.023954, 0, -0.5, 0.5, 0.5,
-3.646988, -2, -6.023954, 1, -0.5, 0.5, 0.5,
-3.646988, -2, -6.023954, 1, 1.5, 0.5, 0.5,
-3.646988, -2, -6.023954, 0, 1.5, 0.5, 0.5,
-3.646988, -1, -6.023954, 0, -0.5, 0.5, 0.5,
-3.646988, -1, -6.023954, 1, -0.5, 0.5, 0.5,
-3.646988, -1, -6.023954, 1, 1.5, 0.5, 0.5,
-3.646988, -1, -6.023954, 0, 1.5, 0.5, 0.5,
-3.646988, 0, -6.023954, 0, -0.5, 0.5, 0.5,
-3.646988, 0, -6.023954, 1, -0.5, 0.5, 0.5,
-3.646988, 0, -6.023954, 1, 1.5, 0.5, 0.5,
-3.646988, 0, -6.023954, 0, 1.5, 0.5, 0.5,
-3.646988, 1, -6.023954, 0, -0.5, 0.5, 0.5,
-3.646988, 1, -6.023954, 1, -0.5, 0.5, 0.5,
-3.646988, 1, -6.023954, 1, 1.5, 0.5, 0.5,
-3.646988, 1, -6.023954, 0, 1.5, 0.5, 0.5,
-3.646988, 2, -6.023954, 0, -0.5, 0.5, 0.5,
-3.646988, 2, -6.023954, 1, -0.5, 0.5, 0.5,
-3.646988, 2, -6.023954, 1, 1.5, 0.5, 0.5,
-3.646988, 2, -6.023954, 0, 1.5, 0.5, 0.5,
-3.646988, 3, -6.023954, 0, -0.5, 0.5, 0.5,
-3.646988, 3, -6.023954, 1, -0.5, 0.5, 0.5,
-3.646988, 3, -6.023954, 1, 1.5, 0.5, 0.5,
-3.646988, 3, -6.023954, 0, 1.5, 0.5, 0.5
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
-3.177539, -2.789434, -4,
-3.177539, -2.789434, 4,
-3.177539, -2.789434, -4,
-3.334022, -2.938968, -4,
-3.177539, -2.789434, -2,
-3.334022, -2.938968, -2,
-3.177539, -2.789434, 0,
-3.334022, -2.938968, 0,
-3.177539, -2.789434, 2,
-3.334022, -2.938968, 2,
-3.177539, -2.789434, 4,
-3.334022, -2.938968, 4
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
-3.646988, -3.238035, -4, 0, -0.5, 0.5, 0.5,
-3.646988, -3.238035, -4, 1, -0.5, 0.5, 0.5,
-3.646988, -3.238035, -4, 1, 1.5, 0.5, 0.5,
-3.646988, -3.238035, -4, 0, 1.5, 0.5, 0.5,
-3.646988, -3.238035, -2, 0, -0.5, 0.5, 0.5,
-3.646988, -3.238035, -2, 1, -0.5, 0.5, 0.5,
-3.646988, -3.238035, -2, 1, 1.5, 0.5, 0.5,
-3.646988, -3.238035, -2, 0, 1.5, 0.5, 0.5,
-3.646988, -3.238035, 0, 0, -0.5, 0.5, 0.5,
-3.646988, -3.238035, 0, 1, -0.5, 0.5, 0.5,
-3.646988, -3.238035, 0, 1, 1.5, 0.5, 0.5,
-3.646988, -3.238035, 0, 0, 1.5, 0.5, 0.5,
-3.646988, -3.238035, 2, 0, -0.5, 0.5, 0.5,
-3.646988, -3.238035, 2, 1, -0.5, 0.5, 0.5,
-3.646988, -3.238035, 2, 1, 1.5, 0.5, 0.5,
-3.646988, -3.238035, 2, 0, 1.5, 0.5, 0.5,
-3.646988, -3.238035, 4, 0, -0.5, 0.5, 0.5,
-3.646988, -3.238035, 4, 1, -0.5, 0.5, 0.5,
-3.646988, -3.238035, 4, 1, 1.5, 0.5, 0.5,
-3.646988, -3.238035, 4, 0, 1.5, 0.5, 0.5
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
-3.177539, -2.789434, -5.212299,
-3.177539, 3.191906, -5.212299,
-3.177539, -2.789434, 5.609762,
-3.177539, 3.191906, 5.609762,
-3.177539, -2.789434, -5.212299,
-3.177539, -2.789434, 5.609762,
-3.177539, 3.191906, -5.212299,
-3.177539, 3.191906, 5.609762,
-3.177539, -2.789434, -5.212299,
3.081787, -2.789434, -5.212299,
-3.177539, -2.789434, 5.609762,
3.081787, -2.789434, 5.609762,
-3.177539, 3.191906, -5.212299,
3.081787, 3.191906, -5.212299,
-3.177539, 3.191906, 5.609762,
3.081787, 3.191906, 5.609762,
3.081787, -2.789434, -5.212299,
3.081787, 3.191906, -5.212299,
3.081787, -2.789434, 5.609762,
3.081787, 3.191906, 5.609762,
3.081787, -2.789434, -5.212299,
3.081787, -2.789434, 5.609762,
3.081787, 3.191906, -5.212299,
3.081787, 3.191906, 5.609762
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
var radius = 7.400451;
var distance = 32.92544;
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
mvMatrix.translate( 0.04787576, -0.2012359, -0.1987314 );
mvMatrix.scale( 1.278334, 1.337746, 0.7393705 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.92544);
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
fluazinam<-read.table("fluazinam.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluazinam$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluazinam' not found
```

```r
y<-fluazinam$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluazinam' not found
```

```r
z<-fluazinam$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluazinam' not found
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
-3.086384, -2.702327, -2.488094, 0, 0, 1, 1, 1,
-2.934879, -0.4872576, -2.008411, 1, 0, 0, 1, 1,
-2.906552, 0.7500662, -1.480191, 1, 0, 0, 1, 1,
-2.776995, -0.9935005, -2.212694, 1, 0, 0, 1, 1,
-2.705935, 1.139909, -1.462466, 1, 0, 0, 1, 1,
-2.662418, 0.3204221, -1.705414, 1, 0, 0, 1, 1,
-2.589989, -0.321233, -1.237925, 0, 0, 0, 1, 1,
-2.544583, 0.05545611, -1.338687, 0, 0, 0, 1, 1,
-2.503376, 0.2634147, -1.989605, 0, 0, 0, 1, 1,
-2.389949, 1.201669, 0.7611453, 0, 0, 0, 1, 1,
-2.330448, -1.355898, -3.935106, 0, 0, 0, 1, 1,
-2.269213, 0.4424716, -2.318396, 0, 0, 0, 1, 1,
-2.265006, -0.537542, -1.78023, 0, 0, 0, 1, 1,
-2.247952, 0.2907819, -1.962105, 1, 1, 1, 1, 1,
-2.246446, 0.1760809, -1.469472, 1, 1, 1, 1, 1,
-2.238534, -0.2887209, -2.547177, 1, 1, 1, 1, 1,
-2.200402, 0.2866643, -1.336054, 1, 1, 1, 1, 1,
-2.193913, -0.6612222, -1.896407, 1, 1, 1, 1, 1,
-2.163663, -0.8445661, -2.070866, 1, 1, 1, 1, 1,
-2.156171, 1.008448, 0.1153524, 1, 1, 1, 1, 1,
-2.123824, -0.1601555, -0.3687322, 1, 1, 1, 1, 1,
-2.110057, 0.4270613, -0.9289751, 1, 1, 1, 1, 1,
-2.108819, -0.9927427, -2.887882, 1, 1, 1, 1, 1,
-2.084104, 0.04278645, -2.352043, 1, 1, 1, 1, 1,
-2.068179, 0.3219463, -1.480211, 1, 1, 1, 1, 1,
-2.058629, 1.1007, -2.352894, 1, 1, 1, 1, 1,
-1.990829, -1.009827, -0.6875252, 1, 1, 1, 1, 1,
-1.982988, 0.3368515, -3.772613, 1, 1, 1, 1, 1,
-1.969426, -0.3291748, -1.40985, 0, 0, 1, 1, 1,
-1.965045, -0.06520938, -0.4740636, 1, 0, 0, 1, 1,
-1.938815, -0.1860669, -1.107578, 1, 0, 0, 1, 1,
-1.933037, 0.2034545, -1.992556, 1, 0, 0, 1, 1,
-1.918256, 0.3093473, -1.778952, 1, 0, 0, 1, 1,
-1.912197, 0.8605593, -0.9515568, 1, 0, 0, 1, 1,
-1.895847, 0.912273, 0.37647, 0, 0, 0, 1, 1,
-1.891864, 0.9073502, -0.7035084, 0, 0, 0, 1, 1,
-1.882893, 1.933747, -1.630095, 0, 0, 0, 1, 1,
-1.841787, -0.4503219, -0.7615142, 0, 0, 0, 1, 1,
-1.830539, -0.08697884, -1.985148, 0, 0, 0, 1, 1,
-1.828518, 1.389635, 0.2760722, 0, 0, 0, 1, 1,
-1.776782, -0.1088047, -0.3511549, 0, 0, 0, 1, 1,
-1.766942, -0.9692454, -3.715502, 1, 1, 1, 1, 1,
-1.765652, 0.488595, -0.1026942, 1, 1, 1, 1, 1,
-1.762396, -0.3982786, -3.007663, 1, 1, 1, 1, 1,
-1.752585, -0.3425094, -2.662473, 1, 1, 1, 1, 1,
-1.748259, -1.317269, -1.238112, 1, 1, 1, 1, 1,
-1.744552, -0.4114052, -2.3585, 1, 1, 1, 1, 1,
-1.731336, 0.572217, -1.059896, 1, 1, 1, 1, 1,
-1.730858, 0.1081562, -2.372515, 1, 1, 1, 1, 1,
-1.670197, 0.7276717, -1.153121, 1, 1, 1, 1, 1,
-1.653968, -1.385343, -3.236074, 1, 1, 1, 1, 1,
-1.649542, -0.05132457, -2.67782, 1, 1, 1, 1, 1,
-1.647152, 0.1768408, -1.015778, 1, 1, 1, 1, 1,
-1.629769, 0.4769144, -1.152938, 1, 1, 1, 1, 1,
-1.623741, 0.2721379, -1.856447, 1, 1, 1, 1, 1,
-1.620757, 1.630859, -0.08710487, 1, 1, 1, 1, 1,
-1.611816, 0.5465512, -3.435976, 0, 0, 1, 1, 1,
-1.60663, -1.052421, -2.807636, 1, 0, 0, 1, 1,
-1.599106, 0.2641623, -0.8148249, 1, 0, 0, 1, 1,
-1.597925, 0.184107, -1.94658, 1, 0, 0, 1, 1,
-1.586238, 0.2031192, -1.001183, 1, 0, 0, 1, 1,
-1.577122, 1.915813, -0.4736451, 1, 0, 0, 1, 1,
-1.57679, 0.387396, -3.233192, 0, 0, 0, 1, 1,
-1.575713, -1.505539, -1.744583, 0, 0, 0, 1, 1,
-1.571815, -0.8605693, -1.822082, 0, 0, 0, 1, 1,
-1.550836, 0.8904797, -1.438261, 0, 0, 0, 1, 1,
-1.547534, -0.08473266, -1.61581, 0, 0, 0, 1, 1,
-1.547083, 1.506143, -0.5519855, 0, 0, 0, 1, 1,
-1.543377, 1.729361, -0.6871313, 0, 0, 0, 1, 1,
-1.522859, -0.9064076, -1.648517, 1, 1, 1, 1, 1,
-1.506163, 0.4555672, -2.42468, 1, 1, 1, 1, 1,
-1.492034, -0.01523218, 0.1094239, 1, 1, 1, 1, 1,
-1.475712, -0.2400131, -0.1507924, 1, 1, 1, 1, 1,
-1.466329, 0.4319932, 0.1917416, 1, 1, 1, 1, 1,
-1.46444, -0.5384742, -2.635612, 1, 1, 1, 1, 1,
-1.464038, 1.110938, -1.050249, 1, 1, 1, 1, 1,
-1.446682, -1.510329, -1.115891, 1, 1, 1, 1, 1,
-1.446233, -0.4226494, -1.856958, 1, 1, 1, 1, 1,
-1.444037, -0.1020538, -0.9210934, 1, 1, 1, 1, 1,
-1.436209, -0.4540532, -3.464447, 1, 1, 1, 1, 1,
-1.435825, 0.6289174, 1.581803, 1, 1, 1, 1, 1,
-1.424292, 1.49239, -1.084251, 1, 1, 1, 1, 1,
-1.422341, -0.8462864, -1.969767, 1, 1, 1, 1, 1,
-1.421467, 0.7986711, -0.01065164, 1, 1, 1, 1, 1,
-1.403303, 1.055048, -1.982935, 0, 0, 1, 1, 1,
-1.401447, 0.2028199, -0.7722813, 1, 0, 0, 1, 1,
-1.391173, 0.5127605, -1.444193, 1, 0, 0, 1, 1,
-1.386752, -0.3916568, -2.960513, 1, 0, 0, 1, 1,
-1.361984, -1.241177, -1.760604, 1, 0, 0, 1, 1,
-1.361069, 1.270583, -0.7746276, 1, 0, 0, 1, 1,
-1.356022, -0.7828293, -2.326986, 0, 0, 0, 1, 1,
-1.336449, -0.6546901, -3.436004, 0, 0, 0, 1, 1,
-1.333642, 0.6223724, -1.167801, 0, 0, 0, 1, 1,
-1.323364, 0.4681816, -2.912068, 0, 0, 0, 1, 1,
-1.315525, -1.816709, -1.112396, 0, 0, 0, 1, 1,
-1.314119, 0.7989447, -1.536309, 0, 0, 0, 1, 1,
-1.313499, 0.807978, 0.3196273, 0, 0, 0, 1, 1,
-1.303221, -0.3928195, -0.2621608, 1, 1, 1, 1, 1,
-1.302765, 1.135394, -1.658076, 1, 1, 1, 1, 1,
-1.301692, 0.9022663, -1.946652, 1, 1, 1, 1, 1,
-1.300804, -0.1503222, -1.554032, 1, 1, 1, 1, 1,
-1.298774, 0.169255, -1.058026, 1, 1, 1, 1, 1,
-1.295267, 1.006654, -1.15693, 1, 1, 1, 1, 1,
-1.295264, -1.429849, -1.038358, 1, 1, 1, 1, 1,
-1.294104, -0.6131572, -1.450521, 1, 1, 1, 1, 1,
-1.288169, 2.111597, -1.19276, 1, 1, 1, 1, 1,
-1.270797, 1.319187, -2.014409, 1, 1, 1, 1, 1,
-1.267705, 0.5450468, -1.454491, 1, 1, 1, 1, 1,
-1.265565, -0.5975657, -1.507258, 1, 1, 1, 1, 1,
-1.2568, 0.7125477, -0.4554515, 1, 1, 1, 1, 1,
-1.25666, -2.116991, -3.192527, 1, 1, 1, 1, 1,
-1.255102, -1.298183, -1.165278, 1, 1, 1, 1, 1,
-1.244999, -0.4422732, -2.091773, 0, 0, 1, 1, 1,
-1.243631, 0.5563176, -0.7629862, 1, 0, 0, 1, 1,
-1.228932, -0.04362042, -2.564261, 1, 0, 0, 1, 1,
-1.228864, 0.8351427, -2.253088, 1, 0, 0, 1, 1,
-1.213267, 0.09813137, -2.137793, 1, 0, 0, 1, 1,
-1.210949, -0.7080274, -2.247339, 1, 0, 0, 1, 1,
-1.206144, -0.04872783, -0.9588721, 0, 0, 0, 1, 1,
-1.204808, -0.3613731, -1.464381, 0, 0, 0, 1, 1,
-1.203458, -0.3659379, -2.609525, 0, 0, 0, 1, 1,
-1.20034, 1.036058, 0.3193812, 0, 0, 0, 1, 1,
-1.19603, 0.6402568, -1.313659, 0, 0, 0, 1, 1,
-1.190034, -0.1009106, 0.175751, 0, 0, 0, 1, 1,
-1.189592, 0.5091729, -0.9798786, 0, 0, 0, 1, 1,
-1.185917, -1.001887, -0.8541174, 1, 1, 1, 1, 1,
-1.184328, 0.6142207, -0.1948347, 1, 1, 1, 1, 1,
-1.181882, 1.713143, -0.952562, 1, 1, 1, 1, 1,
-1.177493, 0.02154201, -1.102199, 1, 1, 1, 1, 1,
-1.175975, 0.5110042, -0.7810093, 1, 1, 1, 1, 1,
-1.173401, 0.5454761, -1.132361, 1, 1, 1, 1, 1,
-1.171187, 1.217336, -1.145365, 1, 1, 1, 1, 1,
-1.169268, -1.504075, -2.139317, 1, 1, 1, 1, 1,
-1.168627, 1.100435, -0.8532539, 1, 1, 1, 1, 1,
-1.154366, -1.675923, -2.570159, 1, 1, 1, 1, 1,
-1.15239, -0.06387131, -3.759612, 1, 1, 1, 1, 1,
-1.141869, 0.170309, -0.9801299, 1, 1, 1, 1, 1,
-1.140346, 0.7366877, -0.6111721, 1, 1, 1, 1, 1,
-1.139964, -0.6054192, -1.221538, 1, 1, 1, 1, 1,
-1.138103, 0.9817609, -0.6792961, 1, 1, 1, 1, 1,
-1.137168, 0.03390916, -1.582396, 0, 0, 1, 1, 1,
-1.135052, -0.7860268, -1.919504, 1, 0, 0, 1, 1,
-1.132333, -0.8542673, -0.9489282, 1, 0, 0, 1, 1,
-1.124373, -1.15332, -1.747828, 1, 0, 0, 1, 1,
-1.12301, 2.29091, -0.4972802, 1, 0, 0, 1, 1,
-1.122358, -0.2941843, -0.471031, 1, 0, 0, 1, 1,
-1.115967, 1.483317, 0.00815416, 0, 0, 0, 1, 1,
-1.115036, -0.6470235, -2.821502, 0, 0, 0, 1, 1,
-1.113381, -0.9457543, -1.485102, 0, 0, 0, 1, 1,
-1.112367, -1.246834, -1.786955, 0, 0, 0, 1, 1,
-1.111361, 0.3747592, -2.57573, 0, 0, 0, 1, 1,
-1.107798, 0.8301751, -0.9575135, 0, 0, 0, 1, 1,
-1.096638, -1.640141, -3.464802, 0, 0, 0, 1, 1,
-1.081486, 0.5293559, 0.06179085, 1, 1, 1, 1, 1,
-1.080582, 0.7976477, 0.2079249, 1, 1, 1, 1, 1,
-1.079153, -0.1372423, -2.196331, 1, 1, 1, 1, 1,
-1.064843, -1.045673, -1.937862, 1, 1, 1, 1, 1,
-1.058752, -1.896849, -4.801232, 1, 1, 1, 1, 1,
-1.054225, 0.07004389, -2.406895, 1, 1, 1, 1, 1,
-1.054175, 0.3799345, -2.286851, 1, 1, 1, 1, 1,
-1.045678, -0.9311897, -3.435599, 1, 1, 1, 1, 1,
-1.033661, 0.2901659, -0.5267663, 1, 1, 1, 1, 1,
-1.030957, 0.3042349, -0.5319555, 1, 1, 1, 1, 1,
-1.03072, -0.1428165, -3.585077, 1, 1, 1, 1, 1,
-1.017213, 0.9778876, -1.565987, 1, 1, 1, 1, 1,
-1.011256, -0.8636258, -2.793602, 1, 1, 1, 1, 1,
-1.004877, 1.002378, -0.446463, 1, 1, 1, 1, 1,
-1.003732, 0.5158857, -0.8507702, 1, 1, 1, 1, 1,
-1.002284, -2.263398, -1.734948, 0, 0, 1, 1, 1,
-0.9992608, 1.328031, -1.446323, 1, 0, 0, 1, 1,
-0.9860373, 1.27447, -0.4918033, 1, 0, 0, 1, 1,
-0.9801132, 0.4803162, -1.689658, 1, 0, 0, 1, 1,
-0.9783428, -0.04773321, -0.814635, 1, 0, 0, 1, 1,
-0.9723458, -0.6908029, -2.770926, 1, 0, 0, 1, 1,
-0.961125, -0.03062765, -2.729048, 0, 0, 0, 1, 1,
-0.9571465, 0.8172808, 0.5523037, 0, 0, 0, 1, 1,
-0.9466801, 0.2606236, -0.4157535, 0, 0, 0, 1, 1,
-0.9448958, 1.512876, -0.1531016, 0, 0, 0, 1, 1,
-0.9448179, -0.5406145, -2.893019, 0, 0, 0, 1, 1,
-0.9440894, 0.7274059, -0.4856496, 0, 0, 0, 1, 1,
-0.9404386, -0.4614215, -1.860305, 0, 0, 0, 1, 1,
-0.9343498, 0.1496397, -1.185076, 1, 1, 1, 1, 1,
-0.9330417, 2.589755, -0.432571, 1, 1, 1, 1, 1,
-0.9329785, 1.382707, 0.7719297, 1, 1, 1, 1, 1,
-0.9257476, 0.2828261, 0.02466318, 1, 1, 1, 1, 1,
-0.9233691, 0.09439156, -2.776561, 1, 1, 1, 1, 1,
-0.9216402, 0.1504813, -2.930596, 1, 1, 1, 1, 1,
-0.905008, -0.7518163, -2.619212, 1, 1, 1, 1, 1,
-0.9000864, 1.475491, 0.46167, 1, 1, 1, 1, 1,
-0.8995414, 1.465596, -2.093972, 1, 1, 1, 1, 1,
-0.8898581, -0.08600623, -0.4656768, 1, 1, 1, 1, 1,
-0.8887072, 1.896425, -1.378431, 1, 1, 1, 1, 1,
-0.8852751, -0.1176287, -1.80254, 1, 1, 1, 1, 1,
-0.8741607, -0.2443824, -0.4486546, 1, 1, 1, 1, 1,
-0.872291, -0.7250683, -2.381916, 1, 1, 1, 1, 1,
-0.8665182, 1.857077, 0.9783448, 1, 1, 1, 1, 1,
-0.8650582, -0.03094299, -2.169622, 0, 0, 1, 1, 1,
-0.8636956, -0.4069493, -2.588009, 1, 0, 0, 1, 1,
-0.8634854, -0.2961518, -1.161413, 1, 0, 0, 1, 1,
-0.8627237, -0.0658901, -1.484365, 1, 0, 0, 1, 1,
-0.8585777, -0.07136645, 1.045613, 1, 0, 0, 1, 1,
-0.8582922, -0.8816209, -2.996817, 1, 0, 0, 1, 1,
-0.8557068, 0.05920989, -3.096616, 0, 0, 0, 1, 1,
-0.8533551, 0.4860637, -1.660773, 0, 0, 0, 1, 1,
-0.8518882, 0.170709, -1.366537, 0, 0, 0, 1, 1,
-0.8513995, 1.530808, -1.040604, 0, 0, 0, 1, 1,
-0.8511808, -0.3417039, -1.419296, 0, 0, 0, 1, 1,
-0.8436273, -1.450986, -2.043727, 0, 0, 0, 1, 1,
-0.8434333, 1.479219, 0.3556968, 0, 0, 0, 1, 1,
-0.8430372, -0.2412873, -2.531999, 1, 1, 1, 1, 1,
-0.8420996, -0.9082969, -4.798781, 1, 1, 1, 1, 1,
-0.8364565, 0.1270231, -1.204395, 1, 1, 1, 1, 1,
-0.8357728, 1.462497, -0.3900129, 1, 1, 1, 1, 1,
-0.8322348, -0.5019814, -0.9681703, 1, 1, 1, 1, 1,
-0.8311672, -1.072318, -2.268071, 1, 1, 1, 1, 1,
-0.8241498, 1.407675, -0.4552723, 1, 1, 1, 1, 1,
-0.8213676, 0.8314446, -1.04244, 1, 1, 1, 1, 1,
-0.820895, 1.661692, 0.4784703, 1, 1, 1, 1, 1,
-0.8125075, 0.2727287, 1.480612, 1, 1, 1, 1, 1,
-0.805634, -0.679153, -1.210408, 1, 1, 1, 1, 1,
-0.8042484, 1.11074, -2.868433, 1, 1, 1, 1, 1,
-0.7999273, -0.8572901, -1.886464, 1, 1, 1, 1, 1,
-0.7916613, 0.07179405, -1.257776, 1, 1, 1, 1, 1,
-0.7909725, -0.9915287, -3.602852, 1, 1, 1, 1, 1,
-0.788948, 0.5904229, -1.137304, 0, 0, 1, 1, 1,
-0.7886744, -0.3773552, -1.552895, 1, 0, 0, 1, 1,
-0.7879532, 0.07419364, -1.124982, 1, 0, 0, 1, 1,
-0.7865479, -1.79212, -2.49016, 1, 0, 0, 1, 1,
-0.785594, 0.9746529, 1.206494, 1, 0, 0, 1, 1,
-0.7802895, -1.007171, -2.080115, 1, 0, 0, 1, 1,
-0.779983, 0.1195782, -2.104208, 0, 0, 0, 1, 1,
-0.773267, 0.7689042, -2.146651, 0, 0, 0, 1, 1,
-0.7716145, -0.02944962, -1.643235, 0, 0, 0, 1, 1,
-0.7710378, -1.205095, -4.019041, 0, 0, 0, 1, 1,
-0.7671524, 1.077541, -0.1666734, 0, 0, 0, 1, 1,
-0.7655926, 0.236846, -1.850304, 0, 0, 0, 1, 1,
-0.761732, -0.7322227, -3.028134, 0, 0, 0, 1, 1,
-0.7587312, 0.8779388, -2.730402, 1, 1, 1, 1, 1,
-0.7579131, 0.1508024, -0.2017697, 1, 1, 1, 1, 1,
-0.7472223, 0.4009052, -1.927612, 1, 1, 1, 1, 1,
-0.7382538, -0.8550801, -1.849469, 1, 1, 1, 1, 1,
-0.7355891, -1.759862, -1.402701, 1, 1, 1, 1, 1,
-0.7297118, -0.7802693, -1.887162, 1, 1, 1, 1, 1,
-0.7277133, 0.8997338, -1.620148, 1, 1, 1, 1, 1,
-0.7272688, -1.040871, -3.198975, 1, 1, 1, 1, 1,
-0.7211657, -1.0336, -3.227375, 1, 1, 1, 1, 1,
-0.7192868, -0.5982816, -1.181646, 1, 1, 1, 1, 1,
-0.7156503, 0.3935106, 0.5336521, 1, 1, 1, 1, 1,
-0.7106315, 1.354227, -0.2400687, 1, 1, 1, 1, 1,
-0.7072486, -0.8235382, -1.463547, 1, 1, 1, 1, 1,
-0.7058848, 0.2717923, 0.9676084, 1, 1, 1, 1, 1,
-0.7056037, -1.931129, -1.374743, 1, 1, 1, 1, 1,
-0.7053623, -0.8373182, -2.769749, 0, 0, 1, 1, 1,
-0.7028015, -0.1330178, -1.361562, 1, 0, 0, 1, 1,
-0.6995816, -1.121931, -2.705681, 1, 0, 0, 1, 1,
-0.6978554, 0.2892089, -0.7415166, 1, 0, 0, 1, 1,
-0.6909584, 0.05290151, 0.2109466, 1, 0, 0, 1, 1,
-0.6897612, -0.1969084, -0.3998252, 1, 0, 0, 1, 1,
-0.6881194, 1.119656, -0.5456753, 0, 0, 0, 1, 1,
-0.6854826, 1.474618, -3.146386, 0, 0, 0, 1, 1,
-0.6810474, -0.3639616, -1.213046, 0, 0, 0, 1, 1,
-0.6810183, 1.848373, -0.8666267, 0, 0, 0, 1, 1,
-0.6794345, 0.1868461, -1.252864, 0, 0, 0, 1, 1,
-0.6789538, -1.39528, -2.968283, 0, 0, 0, 1, 1,
-0.6765935, 0.3529373, -1.731165, 0, 0, 0, 1, 1,
-0.6684324, 1.202775, -2.223578, 1, 1, 1, 1, 1,
-0.6620768, 0.5901395, -0.8763786, 1, 1, 1, 1, 1,
-0.6607997, 0.8464382, -0.5573286, 1, 1, 1, 1, 1,
-0.6591722, -0.276522, -1.164353, 1, 1, 1, 1, 1,
-0.6551827, -0.5541175, -2.594467, 1, 1, 1, 1, 1,
-0.6528969, 0.2022794, -1.587587, 1, 1, 1, 1, 1,
-0.6512389, -1.505477, -3.272535, 1, 1, 1, 1, 1,
-0.64276, -1.054464, -2.822253, 1, 1, 1, 1, 1,
-0.6406665, 0.5855331, -0.8331001, 1, 1, 1, 1, 1,
-0.6402907, -2.393893, -2.115617, 1, 1, 1, 1, 1,
-0.635961, -0.07606634, -2.979438, 1, 1, 1, 1, 1,
-0.6355907, -0.3916043, -3.461124, 1, 1, 1, 1, 1,
-0.6332462, 0.3531857, -0.688144, 1, 1, 1, 1, 1,
-0.6292002, -0.9655542, -1.325264, 1, 1, 1, 1, 1,
-0.6290331, -0.449854, -2.256188, 1, 1, 1, 1, 1,
-0.6278464, -0.6370406, -3.064893, 0, 0, 1, 1, 1,
-0.625886, -0.6707755, -3.112213, 1, 0, 0, 1, 1,
-0.6227499, 2.079621, -1.822786, 1, 0, 0, 1, 1,
-0.6210545, 0.851327, -0.9170938, 1, 0, 0, 1, 1,
-0.6200366, 0.8554483, 0.4720376, 1, 0, 0, 1, 1,
-0.6193331, -0.1076757, -0.920464, 1, 0, 0, 1, 1,
-0.6189632, -0.2688552, -1.83346, 0, 0, 0, 1, 1,
-0.6185447, 1.250705, -0.7547532, 0, 0, 0, 1, 1,
-0.6112545, -1.278654, -0.8304504, 0, 0, 0, 1, 1,
-0.6086603, 0.4433153, 0.3146129, 0, 0, 0, 1, 1,
-0.6046516, -1.20621, -3.026967, 0, 0, 0, 1, 1,
-0.6002355, -1.502458, -1.540621, 0, 0, 0, 1, 1,
-0.5958541, 0.9837934, -0.03921378, 0, 0, 0, 1, 1,
-0.5939847, 0.1585717, -0.5867022, 1, 1, 1, 1, 1,
-0.591301, 2.407925, -0.428645, 1, 1, 1, 1, 1,
-0.5896439, 0.6461103, -1.623987, 1, 1, 1, 1, 1,
-0.5886432, 0.2659132, -0.4994012, 1, 1, 1, 1, 1,
-0.5883482, -0.5042214, -2.50768, 1, 1, 1, 1, 1,
-0.5875838, -0.8318444, -2.480909, 1, 1, 1, 1, 1,
-0.5854658, 0.02842917, -0.05833812, 1, 1, 1, 1, 1,
-0.5832059, -1.534339, -3.693544, 1, 1, 1, 1, 1,
-0.5809343, 0.5586418, -0.1232638, 1, 1, 1, 1, 1,
-0.571234, 0.5235205, -2.318937, 1, 1, 1, 1, 1,
-0.5674946, -0.4669284, -1.048662, 1, 1, 1, 1, 1,
-0.5632935, 0.7436693, 0.03106639, 1, 1, 1, 1, 1,
-0.5629485, -0.5330067, -1.726164, 1, 1, 1, 1, 1,
-0.5566372, 0.5463163, -0.3551817, 1, 1, 1, 1, 1,
-0.553817, 0.9756043, -2.384991, 1, 1, 1, 1, 1,
-0.5535778, -0.1530192, -2.556997, 0, 0, 1, 1, 1,
-0.5456065, -0.2000334, -2.529281, 1, 0, 0, 1, 1,
-0.5321423, 0.3861017, 0.1107244, 1, 0, 0, 1, 1,
-0.5304, 0.04212246, -4.426976, 1, 0, 0, 1, 1,
-0.5283224, -0.1071417, -0.04620972, 1, 0, 0, 1, 1,
-0.5196927, 0.2864099, -1.768524, 1, 0, 0, 1, 1,
-0.5170219, -1.274488, -2.814683, 0, 0, 0, 1, 1,
-0.5134266, 0.6785956, -2.686878, 0, 0, 0, 1, 1,
-0.5132662, -0.6037166, -2.775437, 0, 0, 0, 1, 1,
-0.5131027, 1.274915, -1.649412, 0, 0, 0, 1, 1,
-0.5088475, -1.372776, -4.709073, 0, 0, 0, 1, 1,
-0.5057405, -1.184665, -1.220822, 0, 0, 0, 1, 1,
-0.503204, -1.280377, -2.584498, 0, 0, 0, 1, 1,
-0.5016406, -0.4376721, -2.252075, 1, 1, 1, 1, 1,
-0.4923795, -0.02505621, -1.887443, 1, 1, 1, 1, 1,
-0.4857331, 1.248867, 0.228881, 1, 1, 1, 1, 1,
-0.4807075, 0.8778881, 1.636739, 1, 1, 1, 1, 1,
-0.4791023, -0.6336741, -3.40783, 1, 1, 1, 1, 1,
-0.4723746, -0.0801928, -4.26472, 1, 1, 1, 1, 1,
-0.4713798, -0.1017324, -0.7140706, 1, 1, 1, 1, 1,
-0.4707876, -0.1451637, 0.02067837, 1, 1, 1, 1, 1,
-0.4657376, -1.513709, -2.260576, 1, 1, 1, 1, 1,
-0.4637555, 0.532788, -1.671011, 1, 1, 1, 1, 1,
-0.4635537, -0.4571116, -2.970145, 1, 1, 1, 1, 1,
-0.4615714, -0.963965, -1.860681, 1, 1, 1, 1, 1,
-0.4548815, -0.3184949, -2.477565, 1, 1, 1, 1, 1,
-0.4548101, 1.234997, 1.221748, 1, 1, 1, 1, 1,
-0.4542068, 0.3346509, -1.855604, 1, 1, 1, 1, 1,
-0.4477352, 1.560619, 2.119773, 0, 0, 1, 1, 1,
-0.4471153, 2.029914, 0.1738098, 1, 0, 0, 1, 1,
-0.4458316, 0.6252609, 0.152468, 1, 0, 0, 1, 1,
-0.445059, -0.8600991, -3.218291, 1, 0, 0, 1, 1,
-0.4445469, -0.3041669, -4.277932, 1, 0, 0, 1, 1,
-0.4443461, 2.723641, -0.4540582, 1, 0, 0, 1, 1,
-0.4438874, 1.147023, -0.8863249, 0, 0, 0, 1, 1,
-0.4426928, 0.8736888, -1.057776, 0, 0, 0, 1, 1,
-0.4420317, -1.956359, -3.406395, 0, 0, 0, 1, 1,
-0.4418386, -0.5224371, -5.054697, 0, 0, 0, 1, 1,
-0.4317358, 0.686596, -0.3503851, 0, 0, 0, 1, 1,
-0.4299029, -0.8163826, -2.081847, 0, 0, 0, 1, 1,
-0.427838, -0.9604425, -2.123231, 0, 0, 0, 1, 1,
-0.4235803, 0.3781219, -0.3748548, 1, 1, 1, 1, 1,
-0.4228494, 0.4982934, -0.2065925, 1, 1, 1, 1, 1,
-0.4201662, 0.9795392, 0.8297424, 1, 1, 1, 1, 1,
-0.4109093, -0.06478105, -2.095717, 1, 1, 1, 1, 1,
-0.4045312, 0.2546387, 0.1897372, 1, 1, 1, 1, 1,
-0.4013127, -1.206561, -2.172789, 1, 1, 1, 1, 1,
-0.3986773, -0.06493977, -1.598991, 1, 1, 1, 1, 1,
-0.3951359, -0.7122477, -3.301612, 1, 1, 1, 1, 1,
-0.3941151, -1.225943, -4.224972, 1, 1, 1, 1, 1,
-0.3885328, 0.6699215, 1.117712, 1, 1, 1, 1, 1,
-0.3869815, -2.043897, -2.415868, 1, 1, 1, 1, 1,
-0.3867136, 0.4370485, -0.3056208, 1, 1, 1, 1, 1,
-0.3862947, 0.2598131, -1.818248, 1, 1, 1, 1, 1,
-0.3855337, 3.104799, 0.3484165, 1, 1, 1, 1, 1,
-0.3852715, 0.8895189, -2.40399, 1, 1, 1, 1, 1,
-0.3842417, 0.6322171, -0.8827704, 0, 0, 1, 1, 1,
-0.3825867, 0.3116601, -0.5690807, 1, 0, 0, 1, 1,
-0.3743431, -0.2378834, -1.175545, 1, 0, 0, 1, 1,
-0.3681355, 0.06741681, -0.9593137, 1, 0, 0, 1, 1,
-0.3666575, 0.7294555, 0.7684391, 1, 0, 0, 1, 1,
-0.3649816, 0.1348214, -1.175636, 1, 0, 0, 1, 1,
-0.3622116, -1.846887, -3.117692, 0, 0, 0, 1, 1,
-0.3608837, -0.5817388, -2.497371, 0, 0, 0, 1, 1,
-0.3596067, -0.9765258, -2.380832, 0, 0, 0, 1, 1,
-0.355345, 0.1125084, -2.023123, 0, 0, 0, 1, 1,
-0.3440877, -0.03621925, -1.276503, 0, 0, 0, 1, 1,
-0.3402264, -0.878968, -3.765651, 0, 0, 0, 1, 1,
-0.3281105, -0.6742485, -2.054111, 0, 0, 0, 1, 1,
-0.3278567, -0.6422201, -3.64255, 1, 1, 1, 1, 1,
-0.327547, 0.1440405, 0.4297348, 1, 1, 1, 1, 1,
-0.325865, -1.237625, -3.698834, 1, 1, 1, 1, 1,
-0.3231597, 0.6644126, -0.9263178, 1, 1, 1, 1, 1,
-0.3227274, -1.437667, -1.87443, 1, 1, 1, 1, 1,
-0.3226803, -1.271264, -2.591616, 1, 1, 1, 1, 1,
-0.3204115, -0.01307732, -1.761893, 1, 1, 1, 1, 1,
-0.3092157, 0.1800844, -0.9569949, 1, 1, 1, 1, 1,
-0.3082705, -1.50801, -0.12797, 1, 1, 1, 1, 1,
-0.3056546, -2.434268, -1.279473, 1, 1, 1, 1, 1,
-0.2975474, 1.377872, -0.06511795, 1, 1, 1, 1, 1,
-0.2954489, -0.6589988, -2.032892, 1, 1, 1, 1, 1,
-0.2944359, 1.335275, -0.06533036, 1, 1, 1, 1, 1,
-0.294311, -0.9285037, -1.731276, 1, 1, 1, 1, 1,
-0.2907764, -0.191193, -0.4268514, 1, 1, 1, 1, 1,
-0.2880163, -1.106795, -2.359852, 0, 0, 1, 1, 1,
-0.2870699, -1.868286, -3.525658, 1, 0, 0, 1, 1,
-0.2841949, 0.5723152, -0.538912, 1, 0, 0, 1, 1,
-0.2804858, 1.750304, 0.708969, 1, 0, 0, 1, 1,
-0.2783123, -0.2841022, -3.020192, 1, 0, 0, 1, 1,
-0.2745574, 1.861701, -1.273238, 1, 0, 0, 1, 1,
-0.2698256, -0.2979234, -2.340402, 0, 0, 0, 1, 1,
-0.268102, 0.6570765, -1.374341, 0, 0, 0, 1, 1,
-0.2622993, -0.5133033, -4.597184, 0, 0, 0, 1, 1,
-0.2546386, 0.4018568, 0.6435957, 0, 0, 0, 1, 1,
-0.2520152, 0.9913633, 0.8456808, 0, 0, 0, 1, 1,
-0.2502413, -0.5152645, -2.322754, 0, 0, 0, 1, 1,
-0.2500268, 1.446416, 0.3836693, 0, 0, 0, 1, 1,
-0.2497815, -0.5268487, -2.622478, 1, 1, 1, 1, 1,
-0.2416707, 0.768213, 0.1123923, 1, 1, 1, 1, 1,
-0.2378544, -1.258327, -2.86126, 1, 1, 1, 1, 1,
-0.236908, 1.348133, 0.2186177, 1, 1, 1, 1, 1,
-0.2356692, 0.9854205, -0.2800184, 1, 1, 1, 1, 1,
-0.2345467, -1.42544, -3.465027, 1, 1, 1, 1, 1,
-0.2321263, 0.5065461, -2.18418, 1, 1, 1, 1, 1,
-0.2305822, -0.5272328, -4.142488, 1, 1, 1, 1, 1,
-0.2301719, -0.1849, -1.641421, 1, 1, 1, 1, 1,
-0.2299637, 0.6644566, 0.2109578, 1, 1, 1, 1, 1,
-0.2264599, 0.5839575, -2.566686, 1, 1, 1, 1, 1,
-0.225849, -1.118084, -2.192124, 1, 1, 1, 1, 1,
-0.2221728, -1.28828, -2.907686, 1, 1, 1, 1, 1,
-0.2221129, -0.2134985, -1.798017, 1, 1, 1, 1, 1,
-0.2121784, 0.2729188, -0.5743868, 1, 1, 1, 1, 1,
-0.2086975, 0.2188775, 0.3707586, 0, 0, 1, 1, 1,
-0.2054847, -0.7266746, -1.189922, 1, 0, 0, 1, 1,
-0.1984278, 0.3002149, -0.7670646, 1, 0, 0, 1, 1,
-0.1943707, -0.5032434, -2.63219, 1, 0, 0, 1, 1,
-0.1940641, -1.938159, -3.027953, 1, 0, 0, 1, 1,
-0.1924584, -1.497737, -2.981305, 1, 0, 0, 1, 1,
-0.1922637, 0.2139958, -1.961789, 0, 0, 0, 1, 1,
-0.1887719, 2.301544, 0.2346659, 0, 0, 0, 1, 1,
-0.1831349, -0.9427517, -4.332839, 0, 0, 0, 1, 1,
-0.1823264, -1.186051, -1.664048, 0, 0, 0, 1, 1,
-0.1757686, -0.4703395, -4.359543, 0, 0, 0, 1, 1,
-0.1688663, 1.987624, -1.566947, 0, 0, 0, 1, 1,
-0.1682495, 0.8019246, 0.4015488, 0, 0, 0, 1, 1,
-0.1658142, 1.432039, -1.106247, 1, 1, 1, 1, 1,
-0.1652794, -0.02005335, -0.8019755, 1, 1, 1, 1, 1,
-0.1601749, 0.7781434, -0.3487853, 1, 1, 1, 1, 1,
-0.1594142, 0.8379576, -2.076022, 1, 1, 1, 1, 1,
-0.1592522, -1.543469, -3.722331, 1, 1, 1, 1, 1,
-0.1588542, 0.09395498, 0.3711021, 1, 1, 1, 1, 1,
-0.1559943, 0.6084003, -0.9616026, 1, 1, 1, 1, 1,
-0.1514568, 1.320219, -0.3349745, 1, 1, 1, 1, 1,
-0.1500575, 0.1646505, -1.975656, 1, 1, 1, 1, 1,
-0.1457161, 0.1627578, -0.1029755, 1, 1, 1, 1, 1,
-0.143252, 0.7799038, 1.163488, 1, 1, 1, 1, 1,
-0.1415082, 0.5815295, 1.072766, 1, 1, 1, 1, 1,
-0.1379038, -0.08868512, -0.8077817, 1, 1, 1, 1, 1,
-0.1325905, -0.2713262, -3.951162, 1, 1, 1, 1, 1,
-0.131911, 0.5332477, -1.057546, 1, 1, 1, 1, 1,
-0.1280597, 0.6199536, -0.874137, 0, 0, 1, 1, 1,
-0.1265278, 0.4304401, -1.256529, 1, 0, 0, 1, 1,
-0.1166211, 0.783783, -0.379117, 1, 0, 0, 1, 1,
-0.1158493, -0.8102075, -2.064536, 1, 0, 0, 1, 1,
-0.1156579, -0.1631812, -1.757008, 1, 0, 0, 1, 1,
-0.1145052, 0.3412153, -0.3550959, 1, 0, 0, 1, 1,
-0.1119394, -0.5037449, -2.872339, 0, 0, 0, 1, 1,
-0.111463, -0.1874145, -1.685625, 0, 0, 0, 1, 1,
-0.1103149, 0.7830194, 0.1565417, 0, 0, 0, 1, 1,
-0.1087695, 1.429723, -2.112133, 0, 0, 0, 1, 1,
-0.108516, 0.3094912, -0.4727332, 0, 0, 0, 1, 1,
-0.1084118, 0.8128707, -0.678845, 0, 0, 0, 1, 1,
-0.1081853, -0.3772108, -2.460095, 0, 0, 0, 1, 1,
-0.1056041, 0.6460823, -1.144256, 1, 1, 1, 1, 1,
-0.1042836, 0.8164734, -2.482627, 1, 1, 1, 1, 1,
-0.1027134, 1.330654, -0.5423248, 1, 1, 1, 1, 1,
-0.1008601, 0.1334205, -0.8486166, 1, 1, 1, 1, 1,
-0.09759998, 0.1522998, -0.9256736, 1, 1, 1, 1, 1,
-0.09747442, -0.02243895, -3.240466, 1, 1, 1, 1, 1,
-0.09119707, 0.05228923, -2.522823, 1, 1, 1, 1, 1,
-0.08924701, 0.6021016, -0.1984048, 1, 1, 1, 1, 1,
-0.07674208, 0.3359753, -0.6525206, 1, 1, 1, 1, 1,
-0.07296488, 1.642375, 0.4220565, 1, 1, 1, 1, 1,
-0.06943057, 0.08627833, -0.03041787, 1, 1, 1, 1, 1,
-0.06639143, 0.004327161, -1.66857, 1, 1, 1, 1, 1,
-0.06599762, -0.635182, -4.324597, 1, 1, 1, 1, 1,
-0.06576096, 0.3229612, 1.776443, 1, 1, 1, 1, 1,
-0.06570122, 0.5966371, -1.384801, 1, 1, 1, 1, 1,
-0.06415033, -0.3893412, -2.15349, 0, 0, 1, 1, 1,
-0.06281256, -0.3820821, -3.063778, 1, 0, 0, 1, 1,
-0.06136433, 0.7432028, 1.300041, 1, 0, 0, 1, 1,
-0.06130588, 1.154437, -0.1134502, 1, 0, 0, 1, 1,
-0.05834578, -0.0120243, -1.892696, 1, 0, 0, 1, 1,
-0.05725424, -0.7917245, -4.411649, 1, 0, 0, 1, 1,
-0.05356622, -0.8395851, -2.59552, 0, 0, 0, 1, 1,
-0.04839021, 0.3034829, -1.470985, 0, 0, 0, 1, 1,
-0.04838607, -1.615931, -1.766266, 0, 0, 0, 1, 1,
-0.04696151, 0.378387, -0.7837475, 0, 0, 0, 1, 1,
-0.04688428, -0.1217809, -4.747728, 0, 0, 0, 1, 1,
-0.04364137, 1.138976, 1.2868, 0, 0, 0, 1, 1,
-0.03764027, 2.084391, 0.5130742, 0, 0, 0, 1, 1,
-0.03433001, 0.2997525, 0.6479104, 1, 1, 1, 1, 1,
-0.03235263, -0.1229029, -3.089125, 1, 1, 1, 1, 1,
-0.03215185, 0.4531007, -0.09140908, 1, 1, 1, 1, 1,
-0.02913918, -0.3896931, -2.032325, 1, 1, 1, 1, 1,
-0.02221351, 0.2265726, 0.3693147, 1, 1, 1, 1, 1,
-0.02078116, 0.5246413, 0.3852142, 1, 1, 1, 1, 1,
-0.01418142, -1.105821, -2.169659, 1, 1, 1, 1, 1,
-0.01389077, 0.06046361, 1.552786, 1, 1, 1, 1, 1,
-0.01265772, -1.205065, -3.024302, 1, 1, 1, 1, 1,
-0.01241616, -0.02528584, -4.518777, 1, 1, 1, 1, 1,
-0.01155153, 0.3339598, 0.1887756, 1, 1, 1, 1, 1,
-0.008540272, -0.8365587, -3.646327, 1, 1, 1, 1, 1,
-0.007134929, 0.8262172, 0.2614926, 1, 1, 1, 1, 1,
-0.002715048, 0.1933976, -1.595711, 1, 1, 1, 1, 1,
-0.002376378, 0.1522656, 0.9844825, 1, 1, 1, 1, 1,
-0.0001648122, 1.758525, 0.9830856, 0, 0, 1, 1, 1,
0.0004975659, -0.7729106, 2.670922, 1, 0, 0, 1, 1,
0.001875888, 0.2584673, -0.3530794, 1, 0, 0, 1, 1,
0.004185161, -0.9511286, 3.831988, 1, 0, 0, 1, 1,
0.007182041, -0.4170972, 3.924206, 1, 0, 0, 1, 1,
0.007882107, 0.2552755, 0.7527524, 1, 0, 0, 1, 1,
0.01833018, -0.9968435, 4.402898, 0, 0, 0, 1, 1,
0.02033344, -1.804692, 4.268414, 0, 0, 0, 1, 1,
0.02060067, 0.5277799, 0.8467349, 0, 0, 0, 1, 1,
0.02141993, -0.6074505, 3.13274, 0, 0, 0, 1, 1,
0.02716863, 1.032042, -0.006440192, 0, 0, 0, 1, 1,
0.02809872, 0.183226, 0.2952208, 0, 0, 0, 1, 1,
0.0283192, -0.320643, 3.257003, 0, 0, 0, 1, 1,
0.02959433, -0.006327432, 2.966996, 1, 1, 1, 1, 1,
0.02978789, -1.069635, 4.182866, 1, 1, 1, 1, 1,
0.03182513, 0.3319864, -0.1835285, 1, 1, 1, 1, 1,
0.0367558, 0.3889172, -0.9559308, 1, 1, 1, 1, 1,
0.03834634, 1.099595, 0.9466212, 1, 1, 1, 1, 1,
0.03867686, 0.7214484, 0.1438902, 1, 1, 1, 1, 1,
0.03908542, 0.02537837, 0.5673627, 1, 1, 1, 1, 1,
0.04377728, 1.177556, 0.2192258, 1, 1, 1, 1, 1,
0.04388241, -0.6731562, 3.335994, 1, 1, 1, 1, 1,
0.04551316, -1.588056, 3.54978, 1, 1, 1, 1, 1,
0.04575736, -0.5573382, 3.578013, 1, 1, 1, 1, 1,
0.04873835, -0.1549271, 0.5975541, 1, 1, 1, 1, 1,
0.05332062, 1.740197, 2.420834, 1, 1, 1, 1, 1,
0.05498921, -0.7083055, 3.531671, 1, 1, 1, 1, 1,
0.05771535, -1.065113, 4.42816, 1, 1, 1, 1, 1,
0.06039735, 1.805763, -0.7801607, 0, 0, 1, 1, 1,
0.06098673, 0.3634657, -0.4156567, 1, 0, 0, 1, 1,
0.06101893, -0.4738873, 3.342207, 1, 0, 0, 1, 1,
0.06120999, 0.551317, -0.4721359, 1, 0, 0, 1, 1,
0.06354326, 2.064348, -2.235032, 1, 0, 0, 1, 1,
0.06566938, 0.4427985, 0.8936029, 1, 0, 0, 1, 1,
0.06810189, 1.16267, -0.8447198, 0, 0, 0, 1, 1,
0.07383982, 1.01143, 0.3969996, 0, 0, 0, 1, 1,
0.07618295, -1.984057, 3.745892, 0, 0, 0, 1, 1,
0.07651521, 0.002111402, 1.04465, 0, 0, 0, 1, 1,
0.08139414, 1.502902, -0.4901398, 0, 0, 0, 1, 1,
0.08156002, 1.360864, 0.2438411, 0, 0, 0, 1, 1,
0.08161814, 0.01981182, 1.42975, 0, 0, 0, 1, 1,
0.08343416, -0.4168891, 3.911137, 1, 1, 1, 1, 1,
0.08689599, -0.2338418, 1.689587, 1, 1, 1, 1, 1,
0.08840133, 0.4467036, -1.054645, 1, 1, 1, 1, 1,
0.08902241, -1.389809, 3.615236, 1, 1, 1, 1, 1,
0.09163217, -0.442425, 2.105022, 1, 1, 1, 1, 1,
0.09424935, 1.192827, -1.191825, 1, 1, 1, 1, 1,
0.09627451, 1.670201, 0.2666644, 1, 1, 1, 1, 1,
0.09917128, 0.3194055, -0.5901183, 1, 1, 1, 1, 1,
0.1005214, -0.2032655, 2.56651, 1, 1, 1, 1, 1,
0.1006446, -0.2532786, 1.643982, 1, 1, 1, 1, 1,
0.1009828, 2.411819, 0.2061128, 1, 1, 1, 1, 1,
0.1031283, -0.7250476, 2.377363, 1, 1, 1, 1, 1,
0.1049269, -0.142612, 3.21889, 1, 1, 1, 1, 1,
0.1073661, -1.835388, 3.759943, 1, 1, 1, 1, 1,
0.1115388, 1.038621, 1.44156, 1, 1, 1, 1, 1,
0.1164664, 0.8684471, -0.588617, 0, 0, 1, 1, 1,
0.1173547, -0.5174611, 3.699895, 1, 0, 0, 1, 1,
0.1184302, 1.745978, -0.9139305, 1, 0, 0, 1, 1,
0.1197077, 0.8124155, -1.554349, 1, 0, 0, 1, 1,
0.1228366, 0.3238633, 0.7585943, 1, 0, 0, 1, 1,
0.1255684, -0.4167771, 1.488733, 1, 0, 0, 1, 1,
0.1256295, -0.6147758, 4.314523, 0, 0, 0, 1, 1,
0.1265121, -0.3944268, 3.007641, 0, 0, 0, 1, 1,
0.1307819, 0.2427843, 0.8735038, 0, 0, 0, 1, 1,
0.1309954, -0.2197474, 4.732924, 0, 0, 0, 1, 1,
0.1359672, -0.6540653, 1.708857, 0, 0, 0, 1, 1,
0.1378915, -0.5268389, 4.602585, 0, 0, 0, 1, 1,
0.1381809, -1.194548, 4.847883, 0, 0, 0, 1, 1,
0.1389711, -1.202774, 5.452159, 1, 1, 1, 1, 1,
0.1393566, -0.6362716, 3.987805, 1, 1, 1, 1, 1,
0.1401786, -1.581711, 4.121154, 1, 1, 1, 1, 1,
0.147667, 1.264182, 0.7702794, 1, 1, 1, 1, 1,
0.1496413, 0.6897665, 0.4719747, 1, 1, 1, 1, 1,
0.1547649, -2.07424, 2.149024, 1, 1, 1, 1, 1,
0.1580531, -0.004746725, 3.2828, 1, 1, 1, 1, 1,
0.160149, 1.827444, -0.5476585, 1, 1, 1, 1, 1,
0.1608184, -1.421738, 2.466214, 1, 1, 1, 1, 1,
0.161648, -0.3837142, 1.359041, 1, 1, 1, 1, 1,
0.1621074, -0.5566516, 3.126144, 1, 1, 1, 1, 1,
0.1623536, 0.6748775, -0.02833002, 1, 1, 1, 1, 1,
0.1635072, 1.424135, 0.6163565, 1, 1, 1, 1, 1,
0.1661204, 0.4208447, 0.5004304, 1, 1, 1, 1, 1,
0.1708069, 0.675244, 0.2696097, 1, 1, 1, 1, 1,
0.1751049, 0.1727453, 0.6300335, 0, 0, 1, 1, 1,
0.1772297, -0.3587674, 2.741627, 1, 0, 0, 1, 1,
0.1825966, -0.6484592, 3.050922, 1, 0, 0, 1, 1,
0.185932, 1.731778, 0.7030104, 1, 0, 0, 1, 1,
0.187795, 0.1412026, 1.779274, 1, 0, 0, 1, 1,
0.1924591, 0.7728972, -0.9708, 1, 0, 0, 1, 1,
0.1938363, -0.9670542, 2.889649, 0, 0, 0, 1, 1,
0.1983949, -0.1935384, 1.285287, 0, 0, 0, 1, 1,
0.1999282, -1.209237, 2.992446, 0, 0, 0, 1, 1,
0.1999626, -0.756431, 2.351751, 0, 0, 0, 1, 1,
0.2012871, 0.3301741, 1.965969, 0, 0, 0, 1, 1,
0.2015035, -0.1337928, 3.873144, 0, 0, 0, 1, 1,
0.2028193, 0.2366134, 0.7222406, 0, 0, 0, 1, 1,
0.203288, -0.510935, 2.814538, 1, 1, 1, 1, 1,
0.2126382, -0.03644227, 1.517015, 1, 1, 1, 1, 1,
0.2131916, -1.082971, 4.839536, 1, 1, 1, 1, 1,
0.2144666, 0.5058585, 1.009478, 1, 1, 1, 1, 1,
0.2240737, 0.02920689, 1.385063, 1, 1, 1, 1, 1,
0.2242425, -1.822468, 3.298831, 1, 1, 1, 1, 1,
0.2247281, -0.1274474, 2.361777, 1, 1, 1, 1, 1,
0.2264327, -0.2622312, 4.418531, 1, 1, 1, 1, 1,
0.2268916, 0.7615889, 1.964824, 1, 1, 1, 1, 1,
0.2314463, 0.8555369, -1.426161, 1, 1, 1, 1, 1,
0.2317112, 0.169803, 2.466259, 1, 1, 1, 1, 1,
0.2326351, 1.853792, -0.275411, 1, 1, 1, 1, 1,
0.2356417, -0.7996275, 2.67254, 1, 1, 1, 1, 1,
0.2373964, 1.19235, -0.2987007, 1, 1, 1, 1, 1,
0.2410849, 1.501127, -1.919325, 1, 1, 1, 1, 1,
0.2414507, -1.914611, 3.014675, 0, 0, 1, 1, 1,
0.2475611, 0.9158422, 1.443621, 1, 0, 0, 1, 1,
0.250411, -0.3548926, 2.425471, 1, 0, 0, 1, 1,
0.2575116, 0.1852781, 1.108661, 1, 0, 0, 1, 1,
0.2590987, -1.196753, 5.400403, 1, 0, 0, 1, 1,
0.2721735, -1.640513, 4.528778, 1, 0, 0, 1, 1,
0.2725465, -0.03389557, 2.467713, 0, 0, 0, 1, 1,
0.276202, 0.6266838, -0.2723929, 0, 0, 0, 1, 1,
0.2766808, -0.8173212, 2.293372, 0, 0, 0, 1, 1,
0.2869609, -2.215956, 4.093359, 0, 0, 0, 1, 1,
0.2963924, 1.411208, 0.06998007, 0, 0, 0, 1, 1,
0.3004776, 0.007192172, 1.747403, 0, 0, 0, 1, 1,
0.3022521, 0.7748597, 0.04765238, 0, 0, 0, 1, 1,
0.3023615, -0.5191061, 3.004005, 1, 1, 1, 1, 1,
0.3035759, -0.7651917, 2.693677, 1, 1, 1, 1, 1,
0.309211, -1.113216, 4.737044, 1, 1, 1, 1, 1,
0.3119911, -1.548196, 2.765774, 1, 1, 1, 1, 1,
0.3146973, -1.387527, 4.073221, 1, 1, 1, 1, 1,
0.3190174, 0.1586335, 1.360072, 1, 1, 1, 1, 1,
0.3264335, -1.291134, 4.068355, 1, 1, 1, 1, 1,
0.3276138, 0.6568059, 1.871444, 1, 1, 1, 1, 1,
0.3284352, 0.610108, 0.5861095, 1, 1, 1, 1, 1,
0.3290941, -0.92085, 2.103333, 1, 1, 1, 1, 1,
0.3333457, 0.4942662, 0.08623596, 1, 1, 1, 1, 1,
0.337076, 1.37164, -1.624368, 1, 1, 1, 1, 1,
0.3394077, 1.163119, -0.9628679, 1, 1, 1, 1, 1,
0.3411495, 2.146902, 0.1182586, 1, 1, 1, 1, 1,
0.3436183, 0.05887807, -0.8738106, 1, 1, 1, 1, 1,
0.3443868, -1.746878, 1.795853, 0, 0, 1, 1, 1,
0.3454772, 0.3850489, 1.132712, 1, 0, 0, 1, 1,
0.3465787, 0.3223902, 0.5115744, 1, 0, 0, 1, 1,
0.3472763, -2.130249, 3.829459, 1, 0, 0, 1, 1,
0.3500198, -0.3411556, 2.953989, 1, 0, 0, 1, 1,
0.3582107, 2.778224, -0.2280024, 1, 0, 0, 1, 1,
0.3583115, -0.8485574, 3.529487, 0, 0, 0, 1, 1,
0.3594259, -1.790585, 1.803787, 0, 0, 0, 1, 1,
0.3644566, 1.288033, 1.853818, 0, 0, 0, 1, 1,
0.3647144, 1.371943, 0.4907655, 0, 0, 0, 1, 1,
0.3674619, -0.6143231, 1.771614, 0, 0, 0, 1, 1,
0.3674822, 0.4537684, 0.4936452, 0, 0, 0, 1, 1,
0.3698311, 0.148016, 2.714219, 0, 0, 0, 1, 1,
0.3708444, -1.10383, 2.462916, 1, 1, 1, 1, 1,
0.3713681, -0.374533, 1.776088, 1, 1, 1, 1, 1,
0.373182, -0.7389483, 3.541014, 1, 1, 1, 1, 1,
0.3790237, 0.5644472, 0.9278607, 1, 1, 1, 1, 1,
0.3803573, 0.142862, 1.068148, 1, 1, 1, 1, 1,
0.3836488, -1.687383, 1.397892, 1, 1, 1, 1, 1,
0.3871367, -0.5945489, 0.6940692, 1, 1, 1, 1, 1,
0.3898139, -1.675743, 2.96289, 1, 1, 1, 1, 1,
0.3929033, -0.8844252, 4.099515, 1, 1, 1, 1, 1,
0.3961454, 1.930432, -0.8988664, 1, 1, 1, 1, 1,
0.4009531, -1.424435, 3.10682, 1, 1, 1, 1, 1,
0.4030553, 1.507393, 0.3766296, 1, 1, 1, 1, 1,
0.4083654, 0.09767469, 1.722952, 1, 1, 1, 1, 1,
0.4111154, -0.02988341, 1.662705, 1, 1, 1, 1, 1,
0.4166462, 0.596464, 0.2098221, 1, 1, 1, 1, 1,
0.420896, 0.1856807, 1.325044, 0, 0, 1, 1, 1,
0.4268337, -1.928401, 2.885618, 1, 0, 0, 1, 1,
0.4277723, 0.4460991, 0.815844, 1, 0, 0, 1, 1,
0.4334029, -0.8509225, 3.406698, 1, 0, 0, 1, 1,
0.436324, 1.718221, -0.4919578, 1, 0, 0, 1, 1,
0.4406759, 0.1541256, 2.183405, 1, 0, 0, 1, 1,
0.4429271, 0.5112128, 2.016617, 0, 0, 0, 1, 1,
0.4450726, -1.563521, 3.212281, 0, 0, 0, 1, 1,
0.4481919, 1.364444, 1.100497, 0, 0, 0, 1, 1,
0.4510208, 0.5714878, 1.663376, 0, 0, 0, 1, 1,
0.4517282, 0.4363903, -0.2027582, 0, 0, 0, 1, 1,
0.45246, 1.197532, 0.9025844, 0, 0, 0, 1, 1,
0.4530788, 0.7565236, 0.5070189, 0, 0, 0, 1, 1,
0.4541304, -2.197277, 0.8594871, 1, 1, 1, 1, 1,
0.4565023, 0.6869004, 0.2712599, 1, 1, 1, 1, 1,
0.4609359, 0.1501107, 0.7658522, 1, 1, 1, 1, 1,
0.4617554, -0.1755463, 2.353637, 1, 1, 1, 1, 1,
0.4672598, -1.054132, 3.203535, 1, 1, 1, 1, 1,
0.4717624, -0.09418642, 1.586557, 1, 1, 1, 1, 1,
0.4825025, -1.091727, 3.85665, 1, 1, 1, 1, 1,
0.4846956, -2.533549, 2.8896, 1, 1, 1, 1, 1,
0.4860019, -0.8313497, 2.179227, 1, 1, 1, 1, 1,
0.49371, 0.5102298, 1.030234, 1, 1, 1, 1, 1,
0.4944381, 0.3571148, 1.607356, 1, 1, 1, 1, 1,
0.5060394, -0.5864588, 2.074703, 1, 1, 1, 1, 1,
0.5159541, -1.356371, 3.518299, 1, 1, 1, 1, 1,
0.5169515, -1.242068, 4.731137, 1, 1, 1, 1, 1,
0.5182052, -0.0921417, 2.260419, 1, 1, 1, 1, 1,
0.5211602, -2.158439, 2.818023, 0, 0, 1, 1, 1,
0.5234737, 0.8073946, 0.3141645, 1, 0, 0, 1, 1,
0.525099, 0.2691188, 1.861898, 1, 0, 0, 1, 1,
0.5350001, -0.2968775, 1.346996, 1, 0, 0, 1, 1,
0.5376735, -1.723374, 3.131481, 1, 0, 0, 1, 1,
0.5385624, -0.1494999, 2.315375, 1, 0, 0, 1, 1,
0.5429071, 1.51555, -0.02926634, 0, 0, 0, 1, 1,
0.5469832, 1.872477, 0.3595661, 0, 0, 0, 1, 1,
0.5475444, 0.6044588, 1.06542, 0, 0, 0, 1, 1,
0.5508531, -0.03795803, 1.501195, 0, 0, 0, 1, 1,
0.5520393, -0.5922658, 4.817509, 0, 0, 0, 1, 1,
0.5548005, 0.1196967, -0.2230429, 0, 0, 0, 1, 1,
0.559899, 0.3811703, 1.146953, 0, 0, 0, 1, 1,
0.5607718, -2.042387, 2.591044, 1, 1, 1, 1, 1,
0.5617174, -0.9676215, 2.345027, 1, 1, 1, 1, 1,
0.5645958, 0.1832749, 2.428077, 1, 1, 1, 1, 1,
0.5694008, 0.209963, 1.32985, 1, 1, 1, 1, 1,
0.5741265, 0.7799039, -0.4660388, 1, 1, 1, 1, 1,
0.5762621, -0.4368495, 0.1524288, 1, 1, 1, 1, 1,
0.5835396, -0.5313528, 0.6041141, 1, 1, 1, 1, 1,
0.5836994, 1.330651, 2.001403, 1, 1, 1, 1, 1,
0.5848488, -0.09245098, 0.02731617, 1, 1, 1, 1, 1,
0.5894949, -0.2813373, 1.042711, 1, 1, 1, 1, 1,
0.5902862, 1.564927, 3.179675, 1, 1, 1, 1, 1,
0.5919935, 1.965985, -0.1212251, 1, 1, 1, 1, 1,
0.596266, 0.3897552, 1.837746, 1, 1, 1, 1, 1,
0.5963253, 0.0170177, 3.756029, 1, 1, 1, 1, 1,
0.6037133, 1.06315, 1.387237, 1, 1, 1, 1, 1,
0.6273331, -1.029307, 2.556397, 0, 0, 1, 1, 1,
0.627862, 0.3520868, 1.320123, 1, 0, 0, 1, 1,
0.6305496, -1.229425, 3.002604, 1, 0, 0, 1, 1,
0.6348729, 1.388034, 0.2179549, 1, 0, 0, 1, 1,
0.6437368, -0.3298846, 3.006992, 1, 0, 0, 1, 1,
0.6450125, -0.649669, 3.271615, 1, 0, 0, 1, 1,
0.6462035, 1.410718, 0.7136344, 0, 0, 0, 1, 1,
0.6463242, 0.3741337, 1.067362, 0, 0, 0, 1, 1,
0.6504, 0.2573211, 2.283032, 0, 0, 0, 1, 1,
0.6517822, 0.2249095, 2.841057, 0, 0, 0, 1, 1,
0.6563987, 0.8252981, -0.4293379, 0, 0, 0, 1, 1,
0.6585739, 1.657052, 0.8200475, 0, 0, 0, 1, 1,
0.6589246, -0.9321569, 2.0041, 0, 0, 0, 1, 1,
0.6599822, -0.4212642, 2.617381, 1, 1, 1, 1, 1,
0.6672144, -0.8106661, 2.781032, 1, 1, 1, 1, 1,
0.6674231, 1.203046, 0.7271971, 1, 1, 1, 1, 1,
0.6689208, -1.620904, 3.701697, 1, 1, 1, 1, 1,
0.6709557, -0.705895, 1.76741, 1, 1, 1, 1, 1,
0.6737826, -0.912356, 2.693229, 1, 1, 1, 1, 1,
0.6743745, -0.3935565, 0.9623222, 1, 1, 1, 1, 1,
0.6746663, -1.023026, 4.015185, 1, 1, 1, 1, 1,
0.6753176, 0.3298629, 1.057133, 1, 1, 1, 1, 1,
0.6820006, -0.8216064, 3.205606, 1, 1, 1, 1, 1,
0.6845248, -0.246746, 0.9939297, 1, 1, 1, 1, 1,
0.6863954, 1.00189, -1.800231, 1, 1, 1, 1, 1,
0.6921405, 2.111573, 1.031951, 1, 1, 1, 1, 1,
0.6995741, -0.4182124, 2.09846, 1, 1, 1, 1, 1,
0.7007582, 1.906269, 0.9631428, 1, 1, 1, 1, 1,
0.7035885, -1.000046, 3.117859, 0, 0, 1, 1, 1,
0.706507, -0.5514651, 1.045473, 1, 0, 0, 1, 1,
0.7218448, 0.7585437, 1.380123, 1, 0, 0, 1, 1,
0.7229167, -0.6468474, 1.446508, 1, 0, 0, 1, 1,
0.7238201, -1.569077, 1.108889, 1, 0, 0, 1, 1,
0.72895, -0.9012439, 2.203916, 1, 0, 0, 1, 1,
0.7334057, -1.22108, 1.436375, 0, 0, 0, 1, 1,
0.7359798, 1.324673, 0.4026315, 0, 0, 0, 1, 1,
0.7397488, -0.4621359, 2.48258, 0, 0, 0, 1, 1,
0.7469802, 0.05958256, 2.107658, 0, 0, 0, 1, 1,
0.7497841, -0.2558309, 3.411391, 0, 0, 0, 1, 1,
0.7518307, -0.4129604, 2.805759, 0, 0, 0, 1, 1,
0.7528977, 0.1936581, 0.7017059, 0, 0, 0, 1, 1,
0.7531551, 0.06308737, 1.76443, 1, 1, 1, 1, 1,
0.7534283, -0.2668119, 2.878338, 1, 1, 1, 1, 1,
0.763044, -0.4093389, 3.179383, 1, 1, 1, 1, 1,
0.7634883, -0.3986477, 2.629229, 1, 1, 1, 1, 1,
0.7638719, 2.273846, 0.8841566, 1, 1, 1, 1, 1,
0.764547, 2.10883, 0.814284, 1, 1, 1, 1, 1,
0.7709068, -0.1846226, 1.042035, 1, 1, 1, 1, 1,
0.7741953, -1.619544, 1.533277, 1, 1, 1, 1, 1,
0.7814452, 1.558625, -0.09325852, 1, 1, 1, 1, 1,
0.7820702, 1.799368, 1.812023, 1, 1, 1, 1, 1,
0.7859153, 0.2649125, 1.541864, 1, 1, 1, 1, 1,
0.7859827, -1.324616, 2.632587, 1, 1, 1, 1, 1,
0.7907857, 1.304813, 0.1184494, 1, 1, 1, 1, 1,
0.7965003, -1.680495, 1.83418, 1, 1, 1, 1, 1,
0.7991947, 0.5772851, -0.3854961, 1, 1, 1, 1, 1,
0.804733, 0.7782217, 0.6387439, 0, 0, 1, 1, 1,
0.8051271, 1.021086, 0.3593734, 1, 0, 0, 1, 1,
0.8058401, 0.380545, -1.256083, 1, 0, 0, 1, 1,
0.8075333, 1.441182, 0.7222472, 1, 0, 0, 1, 1,
0.8081372, 1.794342, 0.8733402, 1, 0, 0, 1, 1,
0.808495, 0.8952891, 1.666462, 1, 0, 0, 1, 1,
0.8153631, 0.3083295, 1.729939, 0, 0, 0, 1, 1,
0.8222024, 0.5074438, 3.060444, 0, 0, 0, 1, 1,
0.8259597, 1.131961, 0.1177698, 0, 0, 0, 1, 1,
0.8260686, -0.002618345, 4.085547, 0, 0, 0, 1, 1,
0.8328171, -0.3637241, 2.371648, 0, 0, 0, 1, 1,
0.8347771, 0.2033761, 3.418838, 0, 0, 0, 1, 1,
0.8352554, 0.5106928, -0.2575277, 0, 0, 0, 1, 1,
0.8359262, -1.093311, 3.755785, 1, 1, 1, 1, 1,
0.8397985, -1.299216, 3.486723, 1, 1, 1, 1, 1,
0.8410258, 0.1933612, 2.330035, 1, 1, 1, 1, 1,
0.8416143, -1.141421, 2.448265, 1, 1, 1, 1, 1,
0.84407, -0.5818387, 0.4311336, 1, 1, 1, 1, 1,
0.852128, 0.2318162, 0.5747753, 1, 1, 1, 1, 1,
0.8536586, 2.845752, -0.2566197, 1, 1, 1, 1, 1,
0.8552449, 0.5745995, 1.06692, 1, 1, 1, 1, 1,
0.856608, 2.974105, 0.681883, 1, 1, 1, 1, 1,
0.8706933, -2.574418, 1.077281, 1, 1, 1, 1, 1,
0.8714726, -0.4497472, 3.685732, 1, 1, 1, 1, 1,
0.8752407, 0.5373623, 1.052801, 1, 1, 1, 1, 1,
0.8759048, -0.3942181, 2.66458, 1, 1, 1, 1, 1,
0.8786324, -0.3210185, 2.339763, 1, 1, 1, 1, 1,
0.879059, -0.9197168, 3.310702, 1, 1, 1, 1, 1,
0.8834212, -0.3713129, 1.863915, 0, 0, 1, 1, 1,
0.8875839, -2.524999, 4.816047, 1, 0, 0, 1, 1,
0.8928406, 0.8257164, 1.337476, 1, 0, 0, 1, 1,
0.8933945, 0.4655851, 0.7810404, 1, 0, 0, 1, 1,
0.8941243, 0.5283998, 1.731271, 1, 0, 0, 1, 1,
0.8972616, -0.3163569, 1.415759, 1, 0, 0, 1, 1,
0.901547, -0.5323107, 1.36918, 0, 0, 0, 1, 1,
0.9019797, -0.8805812, 4.400117, 0, 0, 0, 1, 1,
0.9063187, -1.120713, 1.243829, 0, 0, 0, 1, 1,
0.913766, -0.0860744, 1.080468, 0, 0, 0, 1, 1,
0.918947, -0.7270155, 3.23328, 0, 0, 0, 1, 1,
0.9236594, 0.1482864, 1.783316, 0, 0, 0, 1, 1,
0.9274183, -0.2799646, 2.191467, 0, 0, 0, 1, 1,
0.9353441, -0.8039844, 2.312054, 1, 1, 1, 1, 1,
0.9370105, 0.1303663, -0.5858808, 1, 1, 1, 1, 1,
0.945303, -0.1680734, 1.746669, 1, 1, 1, 1, 1,
0.9462719, 0.3813011, 0.8062806, 1, 1, 1, 1, 1,
0.9480563, -1.470608, 2.881309, 1, 1, 1, 1, 1,
0.9487911, 0.1666261, -0.4419916, 1, 1, 1, 1, 1,
0.9505695, 0.7548628, 0.2475031, 1, 1, 1, 1, 1,
0.9535464, -0.6496215, 2.668686, 1, 1, 1, 1, 1,
0.962167, -0.08696002, 3.130522, 1, 1, 1, 1, 1,
0.9817073, -0.8443065, 2.469887, 1, 1, 1, 1, 1,
0.9826805, -0.6383172, 2.448161, 1, 1, 1, 1, 1,
0.9827264, 0.8624496, 2.788215, 1, 1, 1, 1, 1,
0.9854828, 0.7858837, 1.806255, 1, 1, 1, 1, 1,
0.9921346, 0.6431091, 1.325427, 1, 1, 1, 1, 1,
0.9935179, -1.954282, 4.011315, 1, 1, 1, 1, 1,
1.005394, 0.2216458, -0.0505698, 0, 0, 1, 1, 1,
1.009603, -0.9110953, 3.14729, 1, 0, 0, 1, 1,
1.010659, -0.7439967, 0.2579231, 1, 0, 0, 1, 1,
1.014686, 0.8692128, 2.218402, 1, 0, 0, 1, 1,
1.019257, 0.1530929, 2.391267, 1, 0, 0, 1, 1,
1.038433, -0.615817, 2.919329, 1, 0, 0, 1, 1,
1.047215, -0.6470562, 2.411109, 0, 0, 0, 1, 1,
1.047661, -1.36064, 3.03879, 0, 0, 0, 1, 1,
1.049676, -0.5688435, 1.916141, 0, 0, 0, 1, 1,
1.051172, 0.7593856, -0.240513, 0, 0, 0, 1, 1,
1.055496, -1.829049, 0.9558719, 0, 0, 0, 1, 1,
1.057362, 0.2030202, 1.603333, 0, 0, 0, 1, 1,
1.059515, -0.9734526, 2.68504, 0, 0, 0, 1, 1,
1.062504, -2.036418, 2.668979, 1, 1, 1, 1, 1,
1.062861, -1.726341, 2.121346, 1, 1, 1, 1, 1,
1.067749, 0.4054087, 1.749433, 1, 1, 1, 1, 1,
1.069017, 0.1669729, 1.940703, 1, 1, 1, 1, 1,
1.069554, -0.1852007, 2.491798, 1, 1, 1, 1, 1,
1.07028, 0.2668706, 1.469895, 1, 1, 1, 1, 1,
1.071075, -0.0638088, 0.2005073, 1, 1, 1, 1, 1,
1.073401, 0.5224576, 2.095138, 1, 1, 1, 1, 1,
1.079707, 0.2745157, 3.129419, 1, 1, 1, 1, 1,
1.082712, 1.142808, 0.4094193, 1, 1, 1, 1, 1,
1.08453, 0.1449067, 2.42825, 1, 1, 1, 1, 1,
1.088107, 0.6862576, 1.354536, 1, 1, 1, 1, 1,
1.094825, -0.2946554, 3.963372, 1, 1, 1, 1, 1,
1.095309, 0.03780817, 1.108129, 1, 1, 1, 1, 1,
1.096417, -0.1058302, 0.756629, 1, 1, 1, 1, 1,
1.097724, 1.036977, 0.7057131, 0, 0, 1, 1, 1,
1.099481, -0.2867399, 1.5219, 1, 0, 0, 1, 1,
1.100613, -0.1194469, 2.983958, 1, 0, 0, 1, 1,
1.102393, -0.7053922, 1.460678, 1, 0, 0, 1, 1,
1.105571, -0.09756713, 2.14061, 1, 0, 0, 1, 1,
1.106716, 1.198429, -1.684793, 1, 0, 0, 1, 1,
1.111843, -1.032779, 3.353054, 0, 0, 0, 1, 1,
1.11237, 1.224483, 1.199807, 0, 0, 0, 1, 1,
1.114733, -1.225529, 2.178093, 0, 0, 0, 1, 1,
1.119395, -0.8968034, 1.928786, 0, 0, 0, 1, 1,
1.119936, -0.4573324, 2.598826, 0, 0, 0, 1, 1,
1.122669, 0.6566443, 1.296082, 0, 0, 0, 1, 1,
1.127575, 0.1882315, 0.8380601, 0, 0, 0, 1, 1,
1.128084, -0.591302, 1.077852, 1, 1, 1, 1, 1,
1.137153, 1.165619, -0.5870299, 1, 1, 1, 1, 1,
1.145819, -0.2229075, 0.5040062, 1, 1, 1, 1, 1,
1.147119, -1.694772, 2.600304, 1, 1, 1, 1, 1,
1.151009, -0.1400845, 2.245633, 1, 1, 1, 1, 1,
1.153455, 0.5566635, 0.8852692, 1, 1, 1, 1, 1,
1.155054, 1.053236, 0.3670819, 1, 1, 1, 1, 1,
1.160008, 0.7456955, 2.757542, 1, 1, 1, 1, 1,
1.174492, -0.1229493, 1.281897, 1, 1, 1, 1, 1,
1.186316, -0.3042377, 1.997629, 1, 1, 1, 1, 1,
1.188878, 0.3243081, 2.078758, 1, 1, 1, 1, 1,
1.203666, 0.007035817, -0.1557265, 1, 1, 1, 1, 1,
1.204973, 0.411714, 0.5331872, 1, 1, 1, 1, 1,
1.208326, -0.9373853, 3.469073, 1, 1, 1, 1, 1,
1.21318, 1.004353, 1.883573, 1, 1, 1, 1, 1,
1.214797, 0.694501, 1.439038, 0, 0, 1, 1, 1,
1.232764, -0.3081901, 4.01071, 1, 0, 0, 1, 1,
1.237881, 2.403842, 0.5161679, 1, 0, 0, 1, 1,
1.241449, -1.100559, 2.019744, 1, 0, 0, 1, 1,
1.248312, 0.6277406, -0.5839331, 1, 0, 0, 1, 1,
1.253115, 0.2398753, -0.06199725, 1, 0, 0, 1, 1,
1.253924, 1.008021, 1.113128, 0, 0, 0, 1, 1,
1.264143, 1.310234, 2.257173, 0, 0, 0, 1, 1,
1.278423, -0.5825476, 1.969425, 0, 0, 0, 1, 1,
1.28234, 1.125587, 0.8285959, 0, 0, 0, 1, 1,
1.290205, 0.2916996, 0.4440092, 0, 0, 0, 1, 1,
1.300284, 0.5497383, 2.174196, 0, 0, 0, 1, 1,
1.32329, 0.2788449, 1.334009, 0, 0, 0, 1, 1,
1.336616, -1.485525, 0.8902121, 1, 1, 1, 1, 1,
1.33918, -0.5771619, 0.7230625, 1, 1, 1, 1, 1,
1.350104, 1.234726, -0.4773798, 1, 1, 1, 1, 1,
1.355313, -1.381092, 2.041587, 1, 1, 1, 1, 1,
1.363142, -0.2707406, 2.390625, 1, 1, 1, 1, 1,
1.36321, -1.401372, 1.440165, 1, 1, 1, 1, 1,
1.365891, -0.7128599, 3.746595, 1, 1, 1, 1, 1,
1.366446, -0.4456529, 2.474009, 1, 1, 1, 1, 1,
1.377972, 2.086538, -0.6278321, 1, 1, 1, 1, 1,
1.380316, 0.6194763, 2.463612, 1, 1, 1, 1, 1,
1.380842, -0.1183319, 0.6882916, 1, 1, 1, 1, 1,
1.381379, -2.556213, 3.90646, 1, 1, 1, 1, 1,
1.395688, 0.2401838, 1.566017, 1, 1, 1, 1, 1,
1.403001, 2.660196, 0.79763, 1, 1, 1, 1, 1,
1.407629, 1.162213, 0.7442401, 1, 1, 1, 1, 1,
1.409117, -0.3138216, 2.180032, 0, 0, 1, 1, 1,
1.415308, -0.505827, 2.681051, 1, 0, 0, 1, 1,
1.416687, -0.172075, 1.15951, 1, 0, 0, 1, 1,
1.417076, -0.7530591, 3.334995, 1, 0, 0, 1, 1,
1.420866, 1.860217, 1.432206, 1, 0, 0, 1, 1,
1.425783, -0.3485492, 1.862095, 1, 0, 0, 1, 1,
1.429906, 0.8752974, 0.8074079, 0, 0, 0, 1, 1,
1.443688, 0.6090171, 0.9355677, 0, 0, 0, 1, 1,
1.450687, -1.023103, 2.262213, 0, 0, 0, 1, 1,
1.456616, 1.580336, 1.111932, 0, 0, 0, 1, 1,
1.469435, -0.205683, 2.442336, 0, 0, 0, 1, 1,
1.487185, 0.7700009, 1.212443, 0, 0, 0, 1, 1,
1.513752, -0.02330375, 1.265309, 0, 0, 0, 1, 1,
1.516716, 2.16961, 0.2417634, 1, 1, 1, 1, 1,
1.519177, 1.372164, 1.578456, 1, 1, 1, 1, 1,
1.527287, 0.139455, 0.2118183, 1, 1, 1, 1, 1,
1.53875, 0.7786567, 1.051739, 1, 1, 1, 1, 1,
1.540661, 0.2092384, 0.1938118, 1, 1, 1, 1, 1,
1.545133, 0.3248369, 0.6530654, 1, 1, 1, 1, 1,
1.56174, 0.4366343, 0.2759285, 1, 1, 1, 1, 1,
1.609692, 0.6232805, 1.169699, 1, 1, 1, 1, 1,
1.625909, 0.8018652, 2.732939, 1, 1, 1, 1, 1,
1.627592, 0.2761692, 3.035868, 1, 1, 1, 1, 1,
1.629075, 0.1754441, 2.192297, 1, 1, 1, 1, 1,
1.633937, 1.553365, 0.09199452, 1, 1, 1, 1, 1,
1.634643, 0.6507679, 0.7706155, 1, 1, 1, 1, 1,
1.637505, 1.352577, 1.868092, 1, 1, 1, 1, 1,
1.640483, -1.441926, 1.418554, 1, 1, 1, 1, 1,
1.643367, -1.375816, 2.048723, 0, 0, 1, 1, 1,
1.670989, -0.8634219, 1.014169, 1, 0, 0, 1, 1,
1.673058, 1.016137, 1.231007, 1, 0, 0, 1, 1,
1.679557, 0.2825261, 0.1567852, 1, 0, 0, 1, 1,
1.681481, 0.2479599, 1.630358, 1, 0, 0, 1, 1,
1.697182, 0.1876724, 1.445638, 1, 0, 0, 1, 1,
1.714007, 0.7954395, 1.992041, 0, 0, 0, 1, 1,
1.773317, -1.177908, 1.341515, 0, 0, 0, 1, 1,
1.774503, -0.1564668, 1.347482, 0, 0, 0, 1, 1,
1.775246, -2.273684, 0.7242821, 0, 0, 0, 1, 1,
1.819877, 1.547374, 1.062029, 0, 0, 0, 1, 1,
1.820082, -2.443561, 2.891628, 0, 0, 0, 1, 1,
1.842614, 0.8464948, 0.7325535, 0, 0, 0, 1, 1,
1.85443, 0.962717, 1.370562, 1, 1, 1, 1, 1,
1.861579, 0.2976664, 3.088308, 1, 1, 1, 1, 1,
1.871341, 1.05062, 2.778469, 1, 1, 1, 1, 1,
1.872644, 0.3299879, 2.428804, 1, 1, 1, 1, 1,
1.909151, -0.7805101, 3.038128, 1, 1, 1, 1, 1,
1.909843, 0.5979712, 0.6626569, 1, 1, 1, 1, 1,
1.936412, -0.795005, 1.626772, 1, 1, 1, 1, 1,
1.941366, -2.129938, 3.129831, 1, 1, 1, 1, 1,
1.945421, -0.1973788, -0.02877814, 1, 1, 1, 1, 1,
1.982948, -0.7076471, 0.808065, 1, 1, 1, 1, 1,
1.988197, 0.440861, 1.840461, 1, 1, 1, 1, 1,
2.00554, -1.446534, 1.983686, 1, 1, 1, 1, 1,
2.011434, -1.952214, 0.7538536, 1, 1, 1, 1, 1,
2.036627, 0.5289207, 0.4535677, 1, 1, 1, 1, 1,
2.110526, 2.123181, 1.434772, 1, 1, 1, 1, 1,
2.121571, -0.09840626, 1.784462, 0, 0, 1, 1, 1,
2.123235, 0.2104189, 0.9954507, 1, 0, 0, 1, 1,
2.127544, 0.1072368, -0.1581238, 1, 0, 0, 1, 1,
2.135523, 0.7647405, 0.4743587, 1, 0, 0, 1, 1,
2.171008, 1.109521, 1.789956, 1, 0, 0, 1, 1,
2.250937, -0.02678457, 0.6010878, 1, 0, 0, 1, 1,
2.260389, -0.2659342, -0.1867456, 0, 0, 0, 1, 1,
2.276278, 0.681182, 1.745957, 0, 0, 0, 1, 1,
2.327924, -1.043725, -0.2632019, 0, 0, 0, 1, 1,
2.372005, 0.0761523, 2.477636, 0, 0, 0, 1, 1,
2.378318, -0.2640854, 2.299911, 0, 0, 0, 1, 1,
2.44967, -0.3438424, 1.505379, 0, 0, 0, 1, 1,
2.512881, -0.6787496, 1.020002, 0, 0, 0, 1, 1,
2.554253, 0.4435731, 1.856085, 1, 1, 1, 1, 1,
2.625306, -0.3248209, 1.12585, 1, 1, 1, 1, 1,
2.668847, -0.1044977, 2.867472, 1, 1, 1, 1, 1,
2.694456, -0.9536216, 1.833813, 1, 1, 1, 1, 1,
2.711689, 1.279338, 2.429075, 1, 1, 1, 1, 1,
2.812533, 0.4012069, 1.077819, 1, 1, 1, 1, 1,
2.990632, 0.6737229, 1.286245, 1, 1, 1, 1, 1
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
var radius = 9.246069;
var distance = 32.47642;
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
mvMatrix.translate( 0.04787588, -0.2012359, -0.1987314 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.47642);
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
