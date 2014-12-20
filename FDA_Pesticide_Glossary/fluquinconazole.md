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
-3.311131, 1.600331, -1.801586, 1, 0, 0, 1,
-3.081454, -0.2566624, -1.397261, 1, 0.007843138, 0, 1,
-2.745177, -0.1029998, -3.000396, 1, 0.01176471, 0, 1,
-2.741698, -0.6482899, -1.768555, 1, 0.01960784, 0, 1,
-2.672686, -0.08437406, -1.721902, 1, 0.02352941, 0, 1,
-2.564642, 0.7019567, -3.037803, 1, 0.03137255, 0, 1,
-2.419451, -0.4115037, -0.616897, 1, 0.03529412, 0, 1,
-2.402695, 0.679297, -0.4074943, 1, 0.04313726, 0, 1,
-2.306252, 0.03506333, -1.017175, 1, 0.04705882, 0, 1,
-2.291709, -0.6850441, -2.675304, 1, 0.05490196, 0, 1,
-2.243612, -0.6162233, -1.023444, 1, 0.05882353, 0, 1,
-2.228475, -0.2135085, -4.118663, 1, 0.06666667, 0, 1,
-2.212346, -1.848697, -0.7489415, 1, 0.07058824, 0, 1,
-2.191738, -0.806595, -2.221982, 1, 0.07843138, 0, 1,
-2.187767, -0.2427772, -4.478974, 1, 0.08235294, 0, 1,
-2.108315, -0.2912973, -2.422715, 1, 0.09019608, 0, 1,
-2.085449, 0.1225765, -0.7400315, 1, 0.09411765, 0, 1,
-2.079278, 0.1187779, -0.8390728, 1, 0.1019608, 0, 1,
-2.028329, -1.047773, -0.6442831, 1, 0.1098039, 0, 1,
-2.013496, -0.490185, -2.98193, 1, 0.1137255, 0, 1,
-1.95452, -0.781431, -0.818691, 1, 0.1215686, 0, 1,
-1.948614, -0.7024369, -1.805724, 1, 0.1254902, 0, 1,
-1.94194, -0.04503736, -3.146699, 1, 0.1333333, 0, 1,
-1.932272, -2.748489, -3.412499, 1, 0.1372549, 0, 1,
-1.917491, 1.055868, -1.083329, 1, 0.145098, 0, 1,
-1.903651, 0.756901, 0.0003101974, 1, 0.1490196, 0, 1,
-1.901618, -0.6486635, -0.6415237, 1, 0.1568628, 0, 1,
-1.901091, -0.5764302, -3.012192, 1, 0.1607843, 0, 1,
-1.895635, 0.3799967, -0.9943223, 1, 0.1686275, 0, 1,
-1.88157, 1.003463, -1.156719, 1, 0.172549, 0, 1,
-1.879012, 1.948493, 0.3380867, 1, 0.1803922, 0, 1,
-1.828357, 1.220703, 0.1987185, 1, 0.1843137, 0, 1,
-1.786588, 2.847167, -2.476044, 1, 0.1921569, 0, 1,
-1.785691, -0.3218172, -3.400184, 1, 0.1960784, 0, 1,
-1.757496, -0.9564633, -1.656243, 1, 0.2039216, 0, 1,
-1.740681, 0.2788284, -0.4540429, 1, 0.2117647, 0, 1,
-1.721175, 0.4940704, -1.394113, 1, 0.2156863, 0, 1,
-1.704596, 0.07338975, -1.643417, 1, 0.2235294, 0, 1,
-1.675802, -1.572152, -1.462382, 1, 0.227451, 0, 1,
-1.665459, -0.6527153, -1.798547, 1, 0.2352941, 0, 1,
-1.662695, 0.7530695, -1.2856, 1, 0.2392157, 0, 1,
-1.654548, -0.7691227, -1.958311, 1, 0.2470588, 0, 1,
-1.651318, -1.410444, -1.804282, 1, 0.2509804, 0, 1,
-1.646888, -0.01015376, -1.263742, 1, 0.2588235, 0, 1,
-1.635365, 0.124666, -1.129121, 1, 0.2627451, 0, 1,
-1.630491, -0.6549152, -1.035062, 1, 0.2705882, 0, 1,
-1.628791, -0.9511914, -1.506414, 1, 0.2745098, 0, 1,
-1.626856, 0.6929909, -0.3123709, 1, 0.282353, 0, 1,
-1.609745, 1.985092, 0.6996011, 1, 0.2862745, 0, 1,
-1.600026, 1.399787, -0.6687809, 1, 0.2941177, 0, 1,
-1.594306, 0.6741042, -1.672578, 1, 0.3019608, 0, 1,
-1.593864, -1.727811, -1.321832, 1, 0.3058824, 0, 1,
-1.593136, -0.7906947, -2.135107, 1, 0.3137255, 0, 1,
-1.585863, 0.7571139, 0.1646244, 1, 0.3176471, 0, 1,
-1.582976, 0.1445038, -2.38562, 1, 0.3254902, 0, 1,
-1.582828, -0.9311317, -3.94533, 1, 0.3294118, 0, 1,
-1.573206, -0.4643742, -2.911777, 1, 0.3372549, 0, 1,
-1.568379, -0.1574119, -1.275949, 1, 0.3411765, 0, 1,
-1.5615, -0.9626518, -1.072724, 1, 0.3490196, 0, 1,
-1.549266, 0.7910868, -2.050828, 1, 0.3529412, 0, 1,
-1.549157, -1.21542, -1.353025, 1, 0.3607843, 0, 1,
-1.53688, 0.384547, -0.9219055, 1, 0.3647059, 0, 1,
-1.522849, -0.6270978, -0.7891495, 1, 0.372549, 0, 1,
-1.502431, 1.715463, -2.048939, 1, 0.3764706, 0, 1,
-1.50069, 1.421099, 0.499593, 1, 0.3843137, 0, 1,
-1.493356, 1.377522, -0.1632874, 1, 0.3882353, 0, 1,
-1.482824, -1.382859, -1.773631, 1, 0.3960784, 0, 1,
-1.479105, -0.2863328, -0.4600331, 1, 0.4039216, 0, 1,
-1.458187, 1.483418, 0.5565688, 1, 0.4078431, 0, 1,
-1.453466, -0.7407592, -2.167637, 1, 0.4156863, 0, 1,
-1.439201, -0.5315446, -2.362977, 1, 0.4196078, 0, 1,
-1.438058, 0.4528142, -1.860929, 1, 0.427451, 0, 1,
-1.437399, -0.4927109, -3.604083, 1, 0.4313726, 0, 1,
-1.418887, -0.3167874, -0.9275634, 1, 0.4392157, 0, 1,
-1.40496, -0.2618453, -3.142789, 1, 0.4431373, 0, 1,
-1.397535, -1.025087, -2.038943, 1, 0.4509804, 0, 1,
-1.393451, 0.155431, -1.781676, 1, 0.454902, 0, 1,
-1.375749, -1.681994, -2.990881, 1, 0.4627451, 0, 1,
-1.374979, -0.7952814, -3.903535, 1, 0.4666667, 0, 1,
-1.367099, -0.2555957, -2.773441, 1, 0.4745098, 0, 1,
-1.364772, 0.5649867, 0.2188112, 1, 0.4784314, 0, 1,
-1.355303, 0.564161, -0.8786459, 1, 0.4862745, 0, 1,
-1.352294, -1.54261, -2.207114, 1, 0.4901961, 0, 1,
-1.338992, 0.9044338, -0.7282482, 1, 0.4980392, 0, 1,
-1.335475, 0.1670199, -1.958132, 1, 0.5058824, 0, 1,
-1.330528, -1.430881, -3.057077, 1, 0.509804, 0, 1,
-1.318545, 0.7792941, -1.077883, 1, 0.5176471, 0, 1,
-1.31716, 0.457071, -1.031885, 1, 0.5215687, 0, 1,
-1.315234, -0.6649476, -2.867473, 1, 0.5294118, 0, 1,
-1.314999, 0.3982037, -2.24495, 1, 0.5333334, 0, 1,
-1.298283, 0.2863707, -1.899932, 1, 0.5411765, 0, 1,
-1.281217, -0.6072021, -0.1392258, 1, 0.5450981, 0, 1,
-1.277246, 1.238407, 0.9044613, 1, 0.5529412, 0, 1,
-1.272171, -0.5572057, -0.5708876, 1, 0.5568628, 0, 1,
-1.260493, 0.2330238, -3.027706, 1, 0.5647059, 0, 1,
-1.258465, 0.04018536, 0.0218506, 1, 0.5686275, 0, 1,
-1.255473, -1.232393, -4.041102, 1, 0.5764706, 0, 1,
-1.246839, 0.4141766, -0.07827517, 1, 0.5803922, 0, 1,
-1.246156, 0.5857682, -0.258978, 1, 0.5882353, 0, 1,
-1.245061, -0.5355039, -2.836887, 1, 0.5921569, 0, 1,
-1.242488, -0.3819839, -0.7569401, 1, 0.6, 0, 1,
-1.238153, -1.173956, -1.324253, 1, 0.6078432, 0, 1,
-1.236, -0.02621497, -2.513027, 1, 0.6117647, 0, 1,
-1.233685, -1.226629, -2.04469, 1, 0.6196079, 0, 1,
-1.232028, -0.3072238, -2.161982, 1, 0.6235294, 0, 1,
-1.216779, 0.1405594, -1.962798, 1, 0.6313726, 0, 1,
-1.213618, 1.710751, -1.848854, 1, 0.6352941, 0, 1,
-1.210694, 0.8058202, -1.002884, 1, 0.6431373, 0, 1,
-1.198279, -2.657009, -2.701359, 1, 0.6470588, 0, 1,
-1.189336, -0.2888034, -4.346309, 1, 0.654902, 0, 1,
-1.184856, 0.005497063, -0.4397001, 1, 0.6588235, 0, 1,
-1.18466, 0.2572739, -1.154181, 1, 0.6666667, 0, 1,
-1.184635, -0.2823184, -2.219432, 1, 0.6705883, 0, 1,
-1.178756, 0.3505183, -0.9314376, 1, 0.6784314, 0, 1,
-1.173593, -0.1884403, -2.37442, 1, 0.682353, 0, 1,
-1.173018, -0.4290351, -2.541249, 1, 0.6901961, 0, 1,
-1.171669, -0.5125593, -2.395977, 1, 0.6941177, 0, 1,
-1.160157, 0.4118596, -2.368913, 1, 0.7019608, 0, 1,
-1.160077, 1.034573, -0.494524, 1, 0.7098039, 0, 1,
-1.156103, 0.8051995, -2.409625, 1, 0.7137255, 0, 1,
-1.151293, 1.031718, 0.01172339, 1, 0.7215686, 0, 1,
-1.142816, 0.0719249, -2.280822, 1, 0.7254902, 0, 1,
-1.139001, -0.09697574, -3.229661, 1, 0.7333333, 0, 1,
-1.137667, 0.5733371, -1.069542, 1, 0.7372549, 0, 1,
-1.136477, -1.495015, -3.261574, 1, 0.7450981, 0, 1,
-1.118945, 0.3170178, -4.108057, 1, 0.7490196, 0, 1,
-1.114708, -0.417991, -0.9375691, 1, 0.7568628, 0, 1,
-1.113646, -0.2913509, -1.878683, 1, 0.7607843, 0, 1,
-1.112989, 0.3757764, -2.757352, 1, 0.7686275, 0, 1,
-1.104189, 0.1483758, -0.9504802, 1, 0.772549, 0, 1,
-1.10229, 1.002553, -1.845879, 1, 0.7803922, 0, 1,
-1.098386, -0.09857897, -3.046608, 1, 0.7843137, 0, 1,
-1.097987, -1.170189, -2.7055, 1, 0.7921569, 0, 1,
-1.095449, -0.05171508, -0.9557245, 1, 0.7960784, 0, 1,
-1.081176, -1.001952, -0.4744439, 1, 0.8039216, 0, 1,
-1.075477, 0.114689, -0.8740246, 1, 0.8117647, 0, 1,
-1.071066, 1.205074, 0.1625102, 1, 0.8156863, 0, 1,
-1.067298, -0.5124468, -0.9540421, 1, 0.8235294, 0, 1,
-1.065065, 0.04874144, -1.882112, 1, 0.827451, 0, 1,
-1.055401, -0.6778672, -2.868432, 1, 0.8352941, 0, 1,
-1.054074, 1.509071, -1.15519, 1, 0.8392157, 0, 1,
-1.047987, -0.3596519, -2.41071, 1, 0.8470588, 0, 1,
-1.046722, -2.16737, -4.311053, 1, 0.8509804, 0, 1,
-1.044452, 0.8925874, 0.3357494, 1, 0.8588235, 0, 1,
-1.040164, -1.342101, -1.721545, 1, 0.8627451, 0, 1,
-1.039628, 0.7001939, 0.2203261, 1, 0.8705882, 0, 1,
-1.033874, 0.007925124, -2.992498, 1, 0.8745098, 0, 1,
-1.03242, 0.7719353, -1.79042, 1, 0.8823529, 0, 1,
-1.020452, -0.4966785, -1.622171, 1, 0.8862745, 0, 1,
-1.014435, 0.9495534, -1.338688, 1, 0.8941177, 0, 1,
-1.013315, -0.3642253, -1.520035, 1, 0.8980392, 0, 1,
-1.01043, -0.2780024, -3.821831, 1, 0.9058824, 0, 1,
-1.007508, -1.265638, -4.212677, 1, 0.9137255, 0, 1,
-0.9975855, 0.5572623, -0.6117746, 1, 0.9176471, 0, 1,
-0.9935908, 0.5235578, -2.255478, 1, 0.9254902, 0, 1,
-0.9857155, -0.3162619, -0.7638795, 1, 0.9294118, 0, 1,
-0.9812133, -0.6517223, -2.36293, 1, 0.9372549, 0, 1,
-0.9733751, -1.900958, -3.765763, 1, 0.9411765, 0, 1,
-0.9576275, 0.08837757, -3.149626, 1, 0.9490196, 0, 1,
-0.954069, -1.762282, -3.204682, 1, 0.9529412, 0, 1,
-0.9445301, 0.4146179, -1.257462, 1, 0.9607843, 0, 1,
-0.9433473, -0.07619403, -0.8607312, 1, 0.9647059, 0, 1,
-0.9423268, 1.329993, -0.1668803, 1, 0.972549, 0, 1,
-0.9375001, -0.9932196, -3.062693, 1, 0.9764706, 0, 1,
-0.936347, 0.05720263, -0.1672518, 1, 0.9843137, 0, 1,
-0.9315678, -0.1158949, -1.183547, 1, 0.9882353, 0, 1,
-0.9304572, -0.8460792, -2.343838, 1, 0.9960784, 0, 1,
-0.9247301, -0.9117563, -4.253285, 0.9960784, 1, 0, 1,
-0.9209071, 1.337582, -0.4527432, 0.9921569, 1, 0, 1,
-0.91959, 0.3689676, -2.265712, 0.9843137, 1, 0, 1,
-0.9174901, 0.8941711, -0.39187, 0.9803922, 1, 0, 1,
-0.8890144, -0.1319054, -2.195852, 0.972549, 1, 0, 1,
-0.8868758, 1.362524, -0.5872059, 0.9686275, 1, 0, 1,
-0.8857572, -0.1973588, -2.566911, 0.9607843, 1, 0, 1,
-0.8819314, -0.5209975, -0.8645062, 0.9568627, 1, 0, 1,
-0.8778951, 0.32168, 0.5222954, 0.9490196, 1, 0, 1,
-0.8776343, 1.534413, 0.4190234, 0.945098, 1, 0, 1,
-0.8767043, 0.857025, -0.7314855, 0.9372549, 1, 0, 1,
-0.8743291, -1.749107, -3.676891, 0.9333333, 1, 0, 1,
-0.8722145, -0.8316604, -2.174609, 0.9254902, 1, 0, 1,
-0.8674083, 1.322358, 1.797595, 0.9215686, 1, 0, 1,
-0.8635274, 0.3391083, -0.143364, 0.9137255, 1, 0, 1,
-0.8629741, 0.4123329, -1.005584, 0.9098039, 1, 0, 1,
-0.860999, -0.1862817, -1.972443, 0.9019608, 1, 0, 1,
-0.860751, -1.055414, -2.657484, 0.8941177, 1, 0, 1,
-0.8581765, 1.15115, -0.545202, 0.8901961, 1, 0, 1,
-0.856178, -1.008278, -1.627391, 0.8823529, 1, 0, 1,
-0.8551805, -1.148494, -3.961939, 0.8784314, 1, 0, 1,
-0.8534842, 1.141302, -0.09752737, 0.8705882, 1, 0, 1,
-0.8488557, -0.4278535, -0.9427169, 0.8666667, 1, 0, 1,
-0.8450492, 0.4243443, 0.03590753, 0.8588235, 1, 0, 1,
-0.8422613, -1.022971, -2.162463, 0.854902, 1, 0, 1,
-0.8409541, 0.7168131, 0.6961301, 0.8470588, 1, 0, 1,
-0.8403609, 0.8642353, -2.216644, 0.8431373, 1, 0, 1,
-0.8394366, -1.860157, -1.97434, 0.8352941, 1, 0, 1,
-0.8366694, -0.1778754, -1.75355, 0.8313726, 1, 0, 1,
-0.8360159, -0.5136812, -0.5194447, 0.8235294, 1, 0, 1,
-0.8302538, -0.5590534, -0.4193103, 0.8196079, 1, 0, 1,
-0.8279122, 0.3338514, -0.2468949, 0.8117647, 1, 0, 1,
-0.8277239, -0.6255535, -1.768521, 0.8078431, 1, 0, 1,
-0.8243591, 0.3997353, -0.3221594, 0.8, 1, 0, 1,
-0.8217624, -0.6015198, -1.146806, 0.7921569, 1, 0, 1,
-0.821277, 0.4214215, -1.436116, 0.7882353, 1, 0, 1,
-0.8187629, -0.5267343, -0.9100603, 0.7803922, 1, 0, 1,
-0.8170511, -0.4089999, -1.288742, 0.7764706, 1, 0, 1,
-0.8161125, 0.5416906, 1.482139, 0.7686275, 1, 0, 1,
-0.8032862, 1.00919, -0.04184368, 0.7647059, 1, 0, 1,
-0.7932922, 0.6630265, -1.761119, 0.7568628, 1, 0, 1,
-0.7846236, -0.1111336, -1.996984, 0.7529412, 1, 0, 1,
-0.7741566, 0.44523, -0.3993743, 0.7450981, 1, 0, 1,
-0.7729037, 0.8778688, 0.3960004, 0.7411765, 1, 0, 1,
-0.7715516, 1.448965, 1.104077, 0.7333333, 1, 0, 1,
-0.7712111, -0.1772423, -2.909282, 0.7294118, 1, 0, 1,
-0.7691761, -0.561142, -3.843081, 0.7215686, 1, 0, 1,
-0.7635209, -1.798992, -1.379739, 0.7176471, 1, 0, 1,
-0.7630372, -1.133206, -1.803702, 0.7098039, 1, 0, 1,
-0.7627798, 1.340189, -0.3456349, 0.7058824, 1, 0, 1,
-0.7542393, -1.459347, -2.830714, 0.6980392, 1, 0, 1,
-0.7467728, -0.03859861, -1.694151, 0.6901961, 1, 0, 1,
-0.7457938, -0.669269, -1.103469, 0.6862745, 1, 0, 1,
-0.7434953, 2.790788, -1.458672, 0.6784314, 1, 0, 1,
-0.740472, -0.6673939, -2.40403, 0.6745098, 1, 0, 1,
-0.7377799, 1.037135, -0.5014045, 0.6666667, 1, 0, 1,
-0.7270848, 1.090906, -0.01368163, 0.6627451, 1, 0, 1,
-0.7270138, 1.091267, 0.02508719, 0.654902, 1, 0, 1,
-0.7153871, 0.4887682, 0.03157005, 0.6509804, 1, 0, 1,
-0.7150168, 1.38593, -0.4433037, 0.6431373, 1, 0, 1,
-0.7111227, 0.7904589, -1.892401, 0.6392157, 1, 0, 1,
-0.7102759, -0.889245, -2.257247, 0.6313726, 1, 0, 1,
-0.7089542, -0.4521874, -2.762201, 0.627451, 1, 0, 1,
-0.7069718, -1.029961, -2.508624, 0.6196079, 1, 0, 1,
-0.7069401, 0.5224049, -0.9719729, 0.6156863, 1, 0, 1,
-0.7053008, 1.131573, -0.5516303, 0.6078432, 1, 0, 1,
-0.7032441, 0.6493334, -1.804004, 0.6039216, 1, 0, 1,
-0.7017587, 0.756988, -0.7760848, 0.5960785, 1, 0, 1,
-0.7000936, 2.229533, -0.2056283, 0.5882353, 1, 0, 1,
-0.6940941, -0.3672506, -3.382773, 0.5843138, 1, 0, 1,
-0.6896702, -1.833037, -3.256089, 0.5764706, 1, 0, 1,
-0.6827797, -0.2348063, 0.0318477, 0.572549, 1, 0, 1,
-0.6709155, -0.4395697, -0.919166, 0.5647059, 1, 0, 1,
-0.6684761, -0.08281723, -1.267642, 0.5607843, 1, 0, 1,
-0.6628751, -1.001682, -1.372129, 0.5529412, 1, 0, 1,
-0.6569861, -0.2638164, -3.738735, 0.5490196, 1, 0, 1,
-0.6557894, -1.66623, -4.222086, 0.5411765, 1, 0, 1,
-0.6537811, 0.5668415, -0.2806702, 0.5372549, 1, 0, 1,
-0.6530036, 0.4395587, -1.709524, 0.5294118, 1, 0, 1,
-0.6474451, -1.384983, -2.164062, 0.5254902, 1, 0, 1,
-0.6454495, 0.1481531, -1.752775, 0.5176471, 1, 0, 1,
-0.643981, 0.3119666, -1.39391, 0.5137255, 1, 0, 1,
-0.6426836, 0.5003896, -2.158948, 0.5058824, 1, 0, 1,
-0.6313538, 1.459087, -0.3126417, 0.5019608, 1, 0, 1,
-0.6300247, -0.8032037, -3.237617, 0.4941176, 1, 0, 1,
-0.6284656, -2.36826, -3.745775, 0.4862745, 1, 0, 1,
-0.62517, -0.07056253, -0.8272278, 0.4823529, 1, 0, 1,
-0.6204427, 1.120532, 0.6290436, 0.4745098, 1, 0, 1,
-0.6125364, 1.370366, -1.915534, 0.4705882, 1, 0, 1,
-0.6098675, 0.7834068, -1.963655, 0.4627451, 1, 0, 1,
-0.6012121, 1.294371, -1.278583, 0.4588235, 1, 0, 1,
-0.6008154, 0.02332859, -0.8289871, 0.4509804, 1, 0, 1,
-0.5996929, -0.04331248, -1.514732, 0.4470588, 1, 0, 1,
-0.5986356, 0.05796334, -0.9441296, 0.4392157, 1, 0, 1,
-0.5960049, -0.702776, -3.493946, 0.4352941, 1, 0, 1,
-0.5941736, 1.744405, 0.3870161, 0.427451, 1, 0, 1,
-0.5900679, -0.3603653, -1.31383, 0.4235294, 1, 0, 1,
-0.5900567, 0.001284226, -2.528109, 0.4156863, 1, 0, 1,
-0.5892997, -0.6739816, -2.464725, 0.4117647, 1, 0, 1,
-0.5879208, -2.187601, -2.714406, 0.4039216, 1, 0, 1,
-0.5875317, -0.9607583, -2.934644, 0.3960784, 1, 0, 1,
-0.5871116, 1.86971, -0.5551521, 0.3921569, 1, 0, 1,
-0.5828158, 0.04415508, -1.789337, 0.3843137, 1, 0, 1,
-0.582225, 0.9673372, 0.4745553, 0.3803922, 1, 0, 1,
-0.5768071, 1.847268, 0.03848945, 0.372549, 1, 0, 1,
-0.5755768, -0.005375567, -1.523191, 0.3686275, 1, 0, 1,
-0.5737629, -0.4183131, -4.623875, 0.3607843, 1, 0, 1,
-0.5703309, -0.978133, -2.415755, 0.3568628, 1, 0, 1,
-0.5653022, -0.6806941, -1.5563, 0.3490196, 1, 0, 1,
-0.5646269, 0.7644724, -0.9868742, 0.345098, 1, 0, 1,
-0.5606223, 1.036033, -0.3321314, 0.3372549, 1, 0, 1,
-0.559787, 2.745569, -1.060882, 0.3333333, 1, 0, 1,
-0.556969, -0.1532037, -1.564183, 0.3254902, 1, 0, 1,
-0.5535987, -1.227272, -1.22799, 0.3215686, 1, 0, 1,
-0.5529288, -2.736455, -2.469762, 0.3137255, 1, 0, 1,
-0.545881, -0.4320202, -1.091171, 0.3098039, 1, 0, 1,
-0.5408546, -0.4811232, -2.296492, 0.3019608, 1, 0, 1,
-0.5390625, 0.8561202, -0.2603913, 0.2941177, 1, 0, 1,
-0.5380843, 0.5165641, -0.7040176, 0.2901961, 1, 0, 1,
-0.531485, -0.5173042, 0.2318327, 0.282353, 1, 0, 1,
-0.5300106, -1.269547, -0.5558476, 0.2784314, 1, 0, 1,
-0.5281659, 0.2363372, -0.8735836, 0.2705882, 1, 0, 1,
-0.5268055, -0.8850494, -3.048283, 0.2666667, 1, 0, 1,
-0.5265247, 0.616562, 0.1271778, 0.2588235, 1, 0, 1,
-0.5259207, 0.5475121, -0.6344603, 0.254902, 1, 0, 1,
-0.5255, 1.716884, -1.258676, 0.2470588, 1, 0, 1,
-0.5247679, -0.1893608, -2.309741, 0.2431373, 1, 0, 1,
-0.5243239, -0.4327684, -1.915217, 0.2352941, 1, 0, 1,
-0.5217363, 1.044338, -0.357222, 0.2313726, 1, 0, 1,
-0.5185527, 0.1093434, -0.3989157, 0.2235294, 1, 0, 1,
-0.5183446, 1.521737, 1.221039, 0.2196078, 1, 0, 1,
-0.516606, 1.565485, -1.536784, 0.2117647, 1, 0, 1,
-0.5134205, -0.114175, -1.999018, 0.2078431, 1, 0, 1,
-0.5128844, -1.148427, -1.232897, 0.2, 1, 0, 1,
-0.5127108, -0.2586395, -2.754401, 0.1921569, 1, 0, 1,
-0.512434, -1.236279, -4.701038, 0.1882353, 1, 0, 1,
-0.5096636, -0.6472458, -2.8773, 0.1803922, 1, 0, 1,
-0.5035959, -1.706664, -3.11892, 0.1764706, 1, 0, 1,
-0.4986743, -0.6695815, -2.174508, 0.1686275, 1, 0, 1,
-0.4930329, 0.7325943, -1.772309, 0.1647059, 1, 0, 1,
-0.4922098, 1.619287, 0.2474746, 0.1568628, 1, 0, 1,
-0.4893661, 0.05259969, -1.838242, 0.1529412, 1, 0, 1,
-0.4877369, 0.6252086, -1.01439, 0.145098, 1, 0, 1,
-0.486787, -0.07159954, -2.205566, 0.1411765, 1, 0, 1,
-0.4795658, 1.038504, 0.2393369, 0.1333333, 1, 0, 1,
-0.4767217, -0.3185758, -2.378138, 0.1294118, 1, 0, 1,
-0.4692017, -0.07750174, -1.012392, 0.1215686, 1, 0, 1,
-0.4687569, -1.566944, -3.59255, 0.1176471, 1, 0, 1,
-0.4631901, -0.3665323, -1.273999, 0.1098039, 1, 0, 1,
-0.4596741, 1.748377, -0.6951455, 0.1058824, 1, 0, 1,
-0.4496493, -0.8788187, -3.462663, 0.09803922, 1, 0, 1,
-0.4482273, 1.192221, -0.3330885, 0.09019608, 1, 0, 1,
-0.4458301, 0.9394764, -1.277435, 0.08627451, 1, 0, 1,
-0.445146, 0.1152523, -3.157568, 0.07843138, 1, 0, 1,
-0.4448751, 0.6512294, 0.8580921, 0.07450981, 1, 0, 1,
-0.4434469, -0.5882556, -4.13436, 0.06666667, 1, 0, 1,
-0.4432749, -0.7837199, -0.4892582, 0.0627451, 1, 0, 1,
-0.4428132, -1.334272, -3.168218, 0.05490196, 1, 0, 1,
-0.4402384, -0.9123687, -2.752127, 0.05098039, 1, 0, 1,
-0.4379622, -0.6712189, -3.430285, 0.04313726, 1, 0, 1,
-0.4336655, -0.2548755, -2.251977, 0.03921569, 1, 0, 1,
-0.4237275, -0.8297921, -2.663076, 0.03137255, 1, 0, 1,
-0.4231518, 0.7001759, -0.7140545, 0.02745098, 1, 0, 1,
-0.4224971, 0.03857539, -3.30908, 0.01960784, 1, 0, 1,
-0.4223994, 0.8047881, -1.442594, 0.01568628, 1, 0, 1,
-0.4190132, -0.7580084, -3.010119, 0.007843138, 1, 0, 1,
-0.4181338, -0.02388715, -1.393955, 0.003921569, 1, 0, 1,
-0.4180071, 0.8899668, 0.7354107, 0, 1, 0.003921569, 1,
-0.4168175, 0.9060521, 0.5504767, 0, 1, 0.01176471, 1,
-0.4126969, -0.5183556, -3.165494, 0, 1, 0.01568628, 1,
-0.410556, 0.6389502, -0.6843916, 0, 1, 0.02352941, 1,
-0.4049816, -0.2617318, -1.632435, 0, 1, 0.02745098, 1,
-0.4014936, 2.00665, -0.407669, 0, 1, 0.03529412, 1,
-0.3986229, -0.7233846, -2.584402, 0, 1, 0.03921569, 1,
-0.3977001, -0.4955586, -2.280754, 0, 1, 0.04705882, 1,
-0.3905388, -0.1104406, -2.295748, 0, 1, 0.05098039, 1,
-0.3860276, -0.4706633, -3.20796, 0, 1, 0.05882353, 1,
-0.3850861, 0.06426333, -1.85342, 0, 1, 0.0627451, 1,
-0.3780679, -1.226163, -2.027914, 0, 1, 0.07058824, 1,
-0.3774173, -0.3827302, -1.926933, 0, 1, 0.07450981, 1,
-0.3728652, -0.3897951, -2.868238, 0, 1, 0.08235294, 1,
-0.371502, -1.029457, -4.180283, 0, 1, 0.08627451, 1,
-0.3692197, 0.7026822, 0.7039159, 0, 1, 0.09411765, 1,
-0.368484, 0.2419636, -0.06363869, 0, 1, 0.1019608, 1,
-0.3620162, -0.2371961, -3.278882, 0, 1, 0.1058824, 1,
-0.3588585, -0.7243299, -3.853035, 0, 1, 0.1137255, 1,
-0.3587454, 0.2242804, -1.654888, 0, 1, 0.1176471, 1,
-0.3551134, 0.07887853, -0.396319, 0, 1, 0.1254902, 1,
-0.3501372, 1.890943, 2.124764, 0, 1, 0.1294118, 1,
-0.3496042, 0.6044512, -0.9958629, 0, 1, 0.1372549, 1,
-0.3457958, 1.728306, -0.3142959, 0, 1, 0.1411765, 1,
-0.339663, -0.8344197, -1.339607, 0, 1, 0.1490196, 1,
-0.3381646, -0.5930859, -3.753924, 0, 1, 0.1529412, 1,
-0.3368936, -0.8674416, -2.764066, 0, 1, 0.1607843, 1,
-0.3350262, 1.922597, -1.970997, 0, 1, 0.1647059, 1,
-0.3348606, 1.185419, -0.3430511, 0, 1, 0.172549, 1,
-0.3330107, -0.3816602, -2.316481, 0, 1, 0.1764706, 1,
-0.3316625, 0.444415, -0.2916754, 0, 1, 0.1843137, 1,
-0.3299029, 0.2734903, -1.846757, 0, 1, 0.1882353, 1,
-0.3277825, -1.359, -4.568201, 0, 1, 0.1960784, 1,
-0.3258714, 0.2244794, -1.522237, 0, 1, 0.2039216, 1,
-0.3103009, 1.157082, -1.306892, 0, 1, 0.2078431, 1,
-0.3102771, 0.6722454, 0.1262144, 0, 1, 0.2156863, 1,
-0.310252, -0.2891015, -3.002613, 0, 1, 0.2196078, 1,
-0.3039735, 0.4229308, -1.35775, 0, 1, 0.227451, 1,
-0.3030648, 0.3468714, -1.794986, 0, 1, 0.2313726, 1,
-0.3026197, 0.1500014, 0.1950885, 0, 1, 0.2392157, 1,
-0.3015019, 1.204669, 0.1209115, 0, 1, 0.2431373, 1,
-0.3014041, 1.561159, 0.9729793, 0, 1, 0.2509804, 1,
-0.2984974, 0.1775504, -1.584342, 0, 1, 0.254902, 1,
-0.2923484, 0.007784316, -2.803369, 0, 1, 0.2627451, 1,
-0.2914304, 0.9430142, -1.138056, 0, 1, 0.2666667, 1,
-0.2890298, 0.7863548, -0.175469, 0, 1, 0.2745098, 1,
-0.2839474, 0.3293511, -0.8411368, 0, 1, 0.2784314, 1,
-0.2795078, 0.01791911, -2.132709, 0, 1, 0.2862745, 1,
-0.2745985, 1.467669, -0.1633217, 0, 1, 0.2901961, 1,
-0.2738172, -1.413044, -2.504276, 0, 1, 0.2980392, 1,
-0.2721983, 1.165049, -1.475309, 0, 1, 0.3058824, 1,
-0.2660172, -0.588255, -3.755063, 0, 1, 0.3098039, 1,
-0.2488925, 0.8478108, -0.7098818, 0, 1, 0.3176471, 1,
-0.2479049, -0.7745704, -4.467802, 0, 1, 0.3215686, 1,
-0.2465041, 2.013119, 0.8412828, 0, 1, 0.3294118, 1,
-0.2422963, -0.6013682, -3.151965, 0, 1, 0.3333333, 1,
-0.2403342, -1.106823, -2.057574, 0, 1, 0.3411765, 1,
-0.2389768, -1.16067, -1.588898, 0, 1, 0.345098, 1,
-0.2372352, 0.5072612, -1.356685, 0, 1, 0.3529412, 1,
-0.2299344, -2.127267, -1.380579, 0, 1, 0.3568628, 1,
-0.2260259, 0.6596027, 0.09871661, 0, 1, 0.3647059, 1,
-0.2241299, 0.100898, -1.390286, 0, 1, 0.3686275, 1,
-0.2161777, -0.1442958, -2.01692, 0, 1, 0.3764706, 1,
-0.2122156, -0.5840523, -3.101787, 0, 1, 0.3803922, 1,
-0.2118168, 0.9877006, -1.822325, 0, 1, 0.3882353, 1,
-0.2092707, 0.3777156, -0.4097225, 0, 1, 0.3921569, 1,
-0.2081721, -0.9791923, -4.523741, 0, 1, 0.4, 1,
-0.2075101, -0.1650976, -2.400848, 0, 1, 0.4078431, 1,
-0.2057707, 0.3310251, -1.516541, 0, 1, 0.4117647, 1,
-0.2037399, 0.6959487, -1.711339, 0, 1, 0.4196078, 1,
-0.1976388, 1.127324, -1.304024, 0, 1, 0.4235294, 1,
-0.1901973, 0.423321, -1.565919, 0, 1, 0.4313726, 1,
-0.1887774, -0.2683518, -2.165724, 0, 1, 0.4352941, 1,
-0.1865448, -0.6679173, -1.948487, 0, 1, 0.4431373, 1,
-0.1856648, 0.1216222, -0.9093679, 0, 1, 0.4470588, 1,
-0.1800559, 0.684975, -0.8976453, 0, 1, 0.454902, 1,
-0.1782199, -0.1724552, -1.844226, 0, 1, 0.4588235, 1,
-0.1777029, 0.3661647, 0.3260587, 0, 1, 0.4666667, 1,
-0.1776696, -0.5926568, -1.747626, 0, 1, 0.4705882, 1,
-0.1712073, 1.487475, 0.9945711, 0, 1, 0.4784314, 1,
-0.169801, 0.8730679, 0.2444136, 0, 1, 0.4823529, 1,
-0.1688752, -0.5006486, -1.236724, 0, 1, 0.4901961, 1,
-0.1685924, 0.1153597, -1.268952, 0, 1, 0.4941176, 1,
-0.1679895, 0.9047962, -0.5763882, 0, 1, 0.5019608, 1,
-0.167202, 0.007379717, -1.604369, 0, 1, 0.509804, 1,
-0.1652012, -0.9038903, -3.609119, 0, 1, 0.5137255, 1,
-0.1636167, -0.5214022, -1.774063, 0, 1, 0.5215687, 1,
-0.1590229, -1.081665, -4.230806, 0, 1, 0.5254902, 1,
-0.1548849, -1.422996, -3.56664, 0, 1, 0.5333334, 1,
-0.1501989, -1.196136, -2.755749, 0, 1, 0.5372549, 1,
-0.1473594, -0.8822277, -1.699622, 0, 1, 0.5450981, 1,
-0.1449229, 1.033639, -0.2803676, 0, 1, 0.5490196, 1,
-0.1421156, -1.977021, -5.026803, 0, 1, 0.5568628, 1,
-0.141142, 0.8852969, 0.9139801, 0, 1, 0.5607843, 1,
-0.1407109, -0.8804947, -2.464992, 0, 1, 0.5686275, 1,
-0.1284356, 0.8925915, 1.346981, 0, 1, 0.572549, 1,
-0.1242419, -0.004413008, -1.529854, 0, 1, 0.5803922, 1,
-0.1242146, 0.6348761, 0.4188872, 0, 1, 0.5843138, 1,
-0.1183245, 0.2469316, -3.345546, 0, 1, 0.5921569, 1,
-0.1109404, -0.1314167, -2.071545, 0, 1, 0.5960785, 1,
-0.1093993, -1.157757, -2.589463, 0, 1, 0.6039216, 1,
-0.108228, -0.6994579, -3.611182, 0, 1, 0.6117647, 1,
-0.107698, -1.818852, -4.264024, 0, 1, 0.6156863, 1,
-0.1009691, -1.04463, -2.954846, 0, 1, 0.6235294, 1,
-0.1004325, -1.20821, -4.457892, 0, 1, 0.627451, 1,
-0.09948143, -0.3352796, -1.573276, 0, 1, 0.6352941, 1,
-0.09803737, 1.988148, -0.628842, 0, 1, 0.6392157, 1,
-0.09715951, -0.03251209, -3.332244, 0, 1, 0.6470588, 1,
-0.09491213, 0.2584174, -1.268237, 0, 1, 0.6509804, 1,
-0.09119812, -0.0004271551, -1.335494, 0, 1, 0.6588235, 1,
-0.08891321, 0.03963159, -2.261503, 0, 1, 0.6627451, 1,
-0.08572787, -0.7871135, -3.208502, 0, 1, 0.6705883, 1,
-0.08238283, -0.2947745, -2.497898, 0, 1, 0.6745098, 1,
-0.08197666, 0.4093258, -1.049549, 0, 1, 0.682353, 1,
-0.07768812, 0.03207718, 1.77003, 0, 1, 0.6862745, 1,
-0.07753562, -0.436279, -1.225103, 0, 1, 0.6941177, 1,
-0.07544826, -0.4906782, -4.017639, 0, 1, 0.7019608, 1,
-0.07489371, 0.7130089, 0.678304, 0, 1, 0.7058824, 1,
-0.07001271, 0.5290998, -1.430146, 0, 1, 0.7137255, 1,
-0.06978715, -2.553302, -4.081522, 0, 1, 0.7176471, 1,
-0.066536, -1.237914, -3.073809, 0, 1, 0.7254902, 1,
-0.06230617, -0.6276981, -3.239848, 0, 1, 0.7294118, 1,
-0.05864368, -1.1886, -3.530724, 0, 1, 0.7372549, 1,
-0.057555, 0.3718578, -0.2867351, 0, 1, 0.7411765, 1,
-0.05620059, 1.661114, 1.844667, 0, 1, 0.7490196, 1,
-0.05516309, 0.9813883, 1.626001, 0, 1, 0.7529412, 1,
-0.05424986, 0.03595291, -0.6373565, 0, 1, 0.7607843, 1,
-0.0533016, -1.51985, -4.637535, 0, 1, 0.7647059, 1,
-0.05285164, -1.42519, -2.58301, 0, 1, 0.772549, 1,
-0.05129521, 1.927079, 0.2697799, 0, 1, 0.7764706, 1,
-0.04920294, -0.5138573, -3.993924, 0, 1, 0.7843137, 1,
-0.04670648, -1.317382, -2.655963, 0, 1, 0.7882353, 1,
-0.04658292, -0.268076, -2.81823, 0, 1, 0.7960784, 1,
-0.04177766, -0.2743729, -2.048376, 0, 1, 0.8039216, 1,
-0.04018638, -1.153844, -1.477258, 0, 1, 0.8078431, 1,
-0.03752826, -0.3836378, -3.207217, 0, 1, 0.8156863, 1,
-0.02827608, -0.3875058, -2.23944, 0, 1, 0.8196079, 1,
-0.02756896, -1.366813, -3.693907, 0, 1, 0.827451, 1,
-0.02048851, 0.06218463, 0.645138, 0, 1, 0.8313726, 1,
-0.019516, 0.1756493, 0.1758067, 0, 1, 0.8392157, 1,
-0.01308064, 0.6288472, 1.738233, 0, 1, 0.8431373, 1,
-0.01249037, 0.3020306, 1.113123, 0, 1, 0.8509804, 1,
-0.01225578, 0.9371263, -0.6813176, 0, 1, 0.854902, 1,
-0.007948173, 1.292755, 0.4336625, 0, 1, 0.8627451, 1,
-0.001283284, -0.4457241, -4.842975, 0, 1, 0.8666667, 1,
0.003213852, -0.507119, 4.138421, 0, 1, 0.8745098, 1,
0.004252993, 0.02170693, -0.07388818, 0, 1, 0.8784314, 1,
0.005841438, 0.7861093, 1.020738, 0, 1, 0.8862745, 1,
0.006044004, 2.070729, 0.2946596, 0, 1, 0.8901961, 1,
0.01417592, 0.1015165, -0.5159508, 0, 1, 0.8980392, 1,
0.01660401, 0.5725108, -0.6251138, 0, 1, 0.9058824, 1,
0.01911967, -1.734509, 3.965106, 0, 1, 0.9098039, 1,
0.02291196, -0.7063615, 4.393839, 0, 1, 0.9176471, 1,
0.02472465, -0.7938352, 1.973732, 0, 1, 0.9215686, 1,
0.02775976, -1.249669, 3.886052, 0, 1, 0.9294118, 1,
0.03144645, -3.169329, 2.513575, 0, 1, 0.9333333, 1,
0.0336326, 1.548166, 2.207345, 0, 1, 0.9411765, 1,
0.03471222, -0.4905798, 3.974287, 0, 1, 0.945098, 1,
0.03557227, -0.570406, 3.189098, 0, 1, 0.9529412, 1,
0.03661534, -1.461669, 4.998648, 0, 1, 0.9568627, 1,
0.03900852, 0.3155162, -0.6614105, 0, 1, 0.9647059, 1,
0.04045638, 0.5632594, -2.266782, 0, 1, 0.9686275, 1,
0.04136945, 1.951362, -0.09600718, 0, 1, 0.9764706, 1,
0.04531296, -0.2126602, 3.740406, 0, 1, 0.9803922, 1,
0.04737127, -0.2508146, 2.980414, 0, 1, 0.9882353, 1,
0.04967406, -0.2352725, 2.530385, 0, 1, 0.9921569, 1,
0.05254653, -0.1419474, 3.114557, 0, 1, 1, 1,
0.05510496, 2.253059, -0.9894717, 0, 0.9921569, 1, 1,
0.05711779, 1.081578, 1.436393, 0, 0.9882353, 1, 1,
0.05754554, 0.1334489, -0.4893223, 0, 0.9803922, 1, 1,
0.0608371, -0.5545753, 0.7469413, 0, 0.9764706, 1, 1,
0.06104052, -0.9948453, 4.388136, 0, 0.9686275, 1, 1,
0.06154583, -0.6521171, 1.783069, 0, 0.9647059, 1, 1,
0.0654993, 2.174343, 0.04282285, 0, 0.9568627, 1, 1,
0.07232282, 1.643229, -0.7960091, 0, 0.9529412, 1, 1,
0.07359833, -0.8822629, 2.359555, 0, 0.945098, 1, 1,
0.08337223, 1.738976, 0.493735, 0, 0.9411765, 1, 1,
0.08463996, 0.9532714, 1.601623, 0, 0.9333333, 1, 1,
0.0906898, 0.05641833, 1.973681, 0, 0.9294118, 1, 1,
0.09164577, -1.014301, 3.112931, 0, 0.9215686, 1, 1,
0.101129, 1.502343, -0.2129872, 0, 0.9176471, 1, 1,
0.1058141, 1.849068, 0.2241623, 0, 0.9098039, 1, 1,
0.106682, 0.7531908, -0.1197397, 0, 0.9058824, 1, 1,
0.1089629, 0.1336515, 1.237254, 0, 0.8980392, 1, 1,
0.1109862, 0.5925949, 0.5268832, 0, 0.8901961, 1, 1,
0.1119866, -0.8938428, 2.392249, 0, 0.8862745, 1, 1,
0.1140169, -2.952313, 2.348978, 0, 0.8784314, 1, 1,
0.1142202, -0.1293428, 3.879667, 0, 0.8745098, 1, 1,
0.1170132, -0.4795685, 2.858676, 0, 0.8666667, 1, 1,
0.1191269, 1.196646, 0.6800681, 0, 0.8627451, 1, 1,
0.1202265, 0.252287, -0.1841298, 0, 0.854902, 1, 1,
0.1220471, -1.336151, 1.926787, 0, 0.8509804, 1, 1,
0.125098, 0.2809123, 1.786435, 0, 0.8431373, 1, 1,
0.1254563, -0.02254415, 1.853992, 0, 0.8392157, 1, 1,
0.1268013, 0.0524401, 0.9090704, 0, 0.8313726, 1, 1,
0.130033, 1.348956, 0.01687066, 0, 0.827451, 1, 1,
0.1335314, 0.2449546, -0.2295885, 0, 0.8196079, 1, 1,
0.1337092, -0.1036695, 1.56477, 0, 0.8156863, 1, 1,
0.1370333, 0.532171, -0.7806574, 0, 0.8078431, 1, 1,
0.13914, -0.7508163, 1.906777, 0, 0.8039216, 1, 1,
0.1405336, -1.004529, 3.443232, 0, 0.7960784, 1, 1,
0.1446737, -1.776535, 2.914586, 0, 0.7882353, 1, 1,
0.1475523, -0.5139718, 2.37356, 0, 0.7843137, 1, 1,
0.1537432, 0.6212406, -0.5094615, 0, 0.7764706, 1, 1,
0.159304, 0.4781347, -1.631039, 0, 0.772549, 1, 1,
0.1594994, 1.091376, -0.6573536, 0, 0.7647059, 1, 1,
0.1620933, -0.04526948, 1.772678, 0, 0.7607843, 1, 1,
0.1648658, -0.6246312, 3.440717, 0, 0.7529412, 1, 1,
0.171088, 0.01511903, -0.2081298, 0, 0.7490196, 1, 1,
0.1723558, 0.5938326, -0.8679488, 0, 0.7411765, 1, 1,
0.1738459, -0.446813, 3.019112, 0, 0.7372549, 1, 1,
0.1753731, 0.6428499, 1.058757, 0, 0.7294118, 1, 1,
0.1769251, 0.1673198, 1.894642, 0, 0.7254902, 1, 1,
0.1850567, 1.103308, 1.014773, 0, 0.7176471, 1, 1,
0.1859338, 2.673911, 0.4562167, 0, 0.7137255, 1, 1,
0.1863928, 0.2495687, -0.2162313, 0, 0.7058824, 1, 1,
0.1866356, 1.458688, 0.5475785, 0, 0.6980392, 1, 1,
0.1889357, 0.2493093, 0.8767502, 0, 0.6941177, 1, 1,
0.192421, 2.120912, 2.016141, 0, 0.6862745, 1, 1,
0.1925441, 0.1548668, 0.2827542, 0, 0.682353, 1, 1,
0.1939143, 0.6046154, -0.003923417, 0, 0.6745098, 1, 1,
0.1953522, -1.173988, 2.599836, 0, 0.6705883, 1, 1,
0.1972525, -1.091277, 2.063297, 0, 0.6627451, 1, 1,
0.1990094, -0.1706828, 1.483762, 0, 0.6588235, 1, 1,
0.2049618, -0.6923395, 2.23058, 0, 0.6509804, 1, 1,
0.2051642, -0.02797168, 4.136048, 0, 0.6470588, 1, 1,
0.20823, -0.4517309, 3.335272, 0, 0.6392157, 1, 1,
0.2133637, 0.2426445, 1.976469, 0, 0.6352941, 1, 1,
0.2133829, -0.8571509, 2.420281, 0, 0.627451, 1, 1,
0.2162096, -0.06628191, 2.12221, 0, 0.6235294, 1, 1,
0.2230812, 0.4927913, -0.08286817, 0, 0.6156863, 1, 1,
0.2298001, 0.7861168, 0.7172061, 0, 0.6117647, 1, 1,
0.2303953, 0.007182884, 1.905548, 0, 0.6039216, 1, 1,
0.2346911, 0.7349631, -0.3556106, 0, 0.5960785, 1, 1,
0.2517487, 0.04769642, 2.104577, 0, 0.5921569, 1, 1,
0.2520815, 0.210562, 1.38036, 0, 0.5843138, 1, 1,
0.2551564, -0.1075448, 0.4196874, 0, 0.5803922, 1, 1,
0.2577419, -0.02113942, 2.147762, 0, 0.572549, 1, 1,
0.2607231, -0.159837, 2.755327, 0, 0.5686275, 1, 1,
0.2638232, -0.6420712, 2.067069, 0, 0.5607843, 1, 1,
0.2666012, 0.2600147, 1.470511, 0, 0.5568628, 1, 1,
0.2679801, 0.2003639, 2.719476, 0, 0.5490196, 1, 1,
0.2736655, 0.5853982, -0.02022333, 0, 0.5450981, 1, 1,
0.2737699, 0.3719349, 0.4295155, 0, 0.5372549, 1, 1,
0.2752922, 0.4664442, -1.332843, 0, 0.5333334, 1, 1,
0.2759652, 0.820731, 1.9851, 0, 0.5254902, 1, 1,
0.2780734, -0.5897633, 3.75245, 0, 0.5215687, 1, 1,
0.2789292, -0.2076067, 0.8823753, 0, 0.5137255, 1, 1,
0.2801018, -1.002288, 2.275007, 0, 0.509804, 1, 1,
0.2911728, -1.313057, 3.362509, 0, 0.5019608, 1, 1,
0.2934874, -0.1997808, 1.864679, 0, 0.4941176, 1, 1,
0.2950511, 0.4113985, 0.8707457, 0, 0.4901961, 1, 1,
0.2986404, 0.4243687, 2.52413, 0, 0.4823529, 1, 1,
0.2999329, -0.6728085, 1.033599, 0, 0.4784314, 1, 1,
0.3043437, 1.206318, 0.9293554, 0, 0.4705882, 1, 1,
0.3073913, 0.4935588, 3.636145, 0, 0.4666667, 1, 1,
0.3086899, -0.55256, 1.631839, 0, 0.4588235, 1, 1,
0.3128776, -0.3291407, 2.675524, 0, 0.454902, 1, 1,
0.3131396, -1.067985, 3.073121, 0, 0.4470588, 1, 1,
0.3132941, -0.0358297, 2.282613, 0, 0.4431373, 1, 1,
0.3178342, 0.4294516, 1.054499, 0, 0.4352941, 1, 1,
0.3184552, -1.291454, 2.004833, 0, 0.4313726, 1, 1,
0.3189195, -0.9213609, 1.112144, 0, 0.4235294, 1, 1,
0.3211238, -0.0182581, 1.150727, 0, 0.4196078, 1, 1,
0.3243892, 1.232438, 0.7059422, 0, 0.4117647, 1, 1,
0.3278215, -0.9930987, 1.086976, 0, 0.4078431, 1, 1,
0.329012, 0.4188686, -0.7099532, 0, 0.4, 1, 1,
0.3309498, -0.277027, 2.643526, 0, 0.3921569, 1, 1,
0.3337346, 0.330264, 0.2460449, 0, 0.3882353, 1, 1,
0.334139, -0.5953096, 2.484249, 0, 0.3803922, 1, 1,
0.3350374, 1.263191, 2.014634, 0, 0.3764706, 1, 1,
0.3375643, 0.3079115, 3.471597, 0, 0.3686275, 1, 1,
0.3399136, 0.01925033, 0.0842438, 0, 0.3647059, 1, 1,
0.3405885, -0.8266452, 3.484612, 0, 0.3568628, 1, 1,
0.3417311, -0.3873004, 1.510864, 0, 0.3529412, 1, 1,
0.3421315, -0.2283771, 2.006119, 0, 0.345098, 1, 1,
0.3439689, -0.7211492, 1.821987, 0, 0.3411765, 1, 1,
0.3456049, 0.0348774, 2.42275, 0, 0.3333333, 1, 1,
0.3481254, -1.3721, 1.242881, 0, 0.3294118, 1, 1,
0.3511579, 0.7119089, 0.03954815, 0, 0.3215686, 1, 1,
0.3537458, -0.004558135, 2.234955, 0, 0.3176471, 1, 1,
0.3568195, 0.3514852, -0.2008313, 0, 0.3098039, 1, 1,
0.3583389, -0.2717259, 4.041238, 0, 0.3058824, 1, 1,
0.3599248, 0.08715397, 0.3409928, 0, 0.2980392, 1, 1,
0.364113, -0.6712999, 2.615739, 0, 0.2901961, 1, 1,
0.3656645, -1.010971, 3.658563, 0, 0.2862745, 1, 1,
0.367114, 0.8356884, 0.5188578, 0, 0.2784314, 1, 1,
0.3692583, -0.9931768, 2.917123, 0, 0.2745098, 1, 1,
0.3708027, 0.7996073, 1.59979, 0, 0.2666667, 1, 1,
0.3722528, 0.5096592, 0.5227231, 0, 0.2627451, 1, 1,
0.3736731, 0.0409862, 0.1862, 0, 0.254902, 1, 1,
0.3738964, -0.1296052, 2.413342, 0, 0.2509804, 1, 1,
0.3742317, 0.8529967, 0.01259705, 0, 0.2431373, 1, 1,
0.3753262, -0.5322013, 2.022941, 0, 0.2392157, 1, 1,
0.379386, 0.1407579, 0.1284932, 0, 0.2313726, 1, 1,
0.3829795, 0.183165, 2.998008, 0, 0.227451, 1, 1,
0.3832301, 1.695273, 1.431961, 0, 0.2196078, 1, 1,
0.3862819, -0.1351992, 2.105568, 0, 0.2156863, 1, 1,
0.3874015, 0.7335489, -1.664732, 0, 0.2078431, 1, 1,
0.3886011, 0.8612344, 0.6386997, 0, 0.2039216, 1, 1,
0.3893295, -0.3823886, 1.726169, 0, 0.1960784, 1, 1,
0.3934577, 1.266806, 1.21125, 0, 0.1882353, 1, 1,
0.3935708, 0.05313637, -0.1253874, 0, 0.1843137, 1, 1,
0.3962674, -2.096758, 3.795825, 0, 0.1764706, 1, 1,
0.3973039, -1.133754, 2.24302, 0, 0.172549, 1, 1,
0.3998849, -0.08134662, 1.14501, 0, 0.1647059, 1, 1,
0.3999339, 1.301909, -0.5979305, 0, 0.1607843, 1, 1,
0.402164, -0.5902276, 1.198306, 0, 0.1529412, 1, 1,
0.4069112, -1.007407, 3.287397, 0, 0.1490196, 1, 1,
0.4074449, 0.5032542, 1.933365, 0, 0.1411765, 1, 1,
0.4083908, -0.6093899, 4.524576, 0, 0.1372549, 1, 1,
0.4087707, 0.3507092, 1.035225, 0, 0.1294118, 1, 1,
0.4092419, -2.230959, 1.932705, 0, 0.1254902, 1, 1,
0.4119651, 0.3903426, 1.371077, 0, 0.1176471, 1, 1,
0.4137716, 1.057784, 1.768822, 0, 0.1137255, 1, 1,
0.4151989, -0.4869019, 0.4793221, 0, 0.1058824, 1, 1,
0.417279, 0.4994815, 0.3798818, 0, 0.09803922, 1, 1,
0.4176352, 0.9839489, 0.1383271, 0, 0.09411765, 1, 1,
0.4238073, -0.1970017, 0.7994539, 0, 0.08627451, 1, 1,
0.4299595, -0.4765845, 1.596823, 0, 0.08235294, 1, 1,
0.4326501, 0.7084982, 0.9815181, 0, 0.07450981, 1, 1,
0.4338364, -1.207663, 4.377668, 0, 0.07058824, 1, 1,
0.4357855, 0.7095657, -0.420658, 0, 0.0627451, 1, 1,
0.4366806, 2.491901, 1.951034, 0, 0.05882353, 1, 1,
0.4378062, -0.9432498, 2.983028, 0, 0.05098039, 1, 1,
0.4428561, -0.04135504, 2.37167, 0, 0.04705882, 1, 1,
0.4468514, 0.4783521, 3.232176, 0, 0.03921569, 1, 1,
0.447374, 0.7469901, -0.1033652, 0, 0.03529412, 1, 1,
0.4481656, -0.6360959, 1.99422, 0, 0.02745098, 1, 1,
0.4523953, 2.966201, -0.3360033, 0, 0.02352941, 1, 1,
0.4571568, 1.117823, -0.7593529, 0, 0.01568628, 1, 1,
0.4711541, 0.1281446, -0.3620651, 0, 0.01176471, 1, 1,
0.4713804, -0.3656161, 3.047822, 0, 0.003921569, 1, 1,
0.471405, 0.03911581, 0.3128944, 0.003921569, 0, 1, 1,
0.4827216, -0.5443845, 1.651663, 0.007843138, 0, 1, 1,
0.4850897, -0.6668272, 2.303063, 0.01568628, 0, 1, 1,
0.4858606, 1.228542, -0.2293306, 0.01960784, 0, 1, 1,
0.4929015, 0.3702082, -0.4431141, 0.02745098, 0, 1, 1,
0.4938089, -0.2886269, -0.2402943, 0.03137255, 0, 1, 1,
0.4940256, 1.145332, -0.4629863, 0.03921569, 0, 1, 1,
0.5005188, 0.735008, 1.837757, 0.04313726, 0, 1, 1,
0.5011405, -0.6850711, 1.847317, 0.05098039, 0, 1, 1,
0.5011803, 1.402187, 0.1870227, 0.05490196, 0, 1, 1,
0.5021929, 0.7200184, 1.041419, 0.0627451, 0, 1, 1,
0.5022359, 1.165127, -0.2833787, 0.06666667, 0, 1, 1,
0.5065308, 2.44396, -0.8870779, 0.07450981, 0, 1, 1,
0.5101861, -1.337357, 3.318218, 0.07843138, 0, 1, 1,
0.5126492, -0.800504, 2.405213, 0.08627451, 0, 1, 1,
0.5167199, -0.8713702, 3.112934, 0.09019608, 0, 1, 1,
0.5180185, 0.1402116, 1.172451, 0.09803922, 0, 1, 1,
0.5198691, -0.393452, 1.41962, 0.1058824, 0, 1, 1,
0.5241401, 1.726083, 0.1400715, 0.1098039, 0, 1, 1,
0.5246466, 0.5621463, 1.081446, 0.1176471, 0, 1, 1,
0.525921, -2.057682, 2.108989, 0.1215686, 0, 1, 1,
0.527351, 1.092276, -1.121569, 0.1294118, 0, 1, 1,
0.5282593, -1.14364, 2.656013, 0.1333333, 0, 1, 1,
0.5309272, -0.4670478, 2.068956, 0.1411765, 0, 1, 1,
0.5329986, -0.2987234, 0.6309491, 0.145098, 0, 1, 1,
0.5340038, 0.09772775, 1.405652, 0.1529412, 0, 1, 1,
0.5437352, -0.4659015, 2.973299, 0.1568628, 0, 1, 1,
0.5444163, -0.3447403, 4.390759, 0.1647059, 0, 1, 1,
0.5468151, -0.2201775, 3.174057, 0.1686275, 0, 1, 1,
0.547391, -2.264029, 2.803347, 0.1764706, 0, 1, 1,
0.5506632, -1.397681, 1.956152, 0.1803922, 0, 1, 1,
0.5538737, -0.7173082, 1.612172, 0.1882353, 0, 1, 1,
0.5539871, 1.272122, 0.3108425, 0.1921569, 0, 1, 1,
0.554383, 0.3968983, 0.691153, 0.2, 0, 1, 1,
0.5547645, -2.341231, 1.219167, 0.2078431, 0, 1, 1,
0.5550401, -1.307635, 3.290933, 0.2117647, 0, 1, 1,
0.5595369, 1.006776, 0.4030091, 0.2196078, 0, 1, 1,
0.5647358, 1.12016, -1.041112, 0.2235294, 0, 1, 1,
0.5659195, -0.1646471, 0.82297, 0.2313726, 0, 1, 1,
0.5687942, -0.04056753, 0.9665982, 0.2352941, 0, 1, 1,
0.5703681, 0.5010982, 0.5700893, 0.2431373, 0, 1, 1,
0.5706051, 1.647691, 0.8363113, 0.2470588, 0, 1, 1,
0.5734259, -1.593872, 2.586156, 0.254902, 0, 1, 1,
0.5736289, -0.6801399, 2.894733, 0.2588235, 0, 1, 1,
0.5763376, 1.1875, 0.3410265, 0.2666667, 0, 1, 1,
0.5769717, 0.02563543, 1.385242, 0.2705882, 0, 1, 1,
0.5820405, -0.6337045, 1.647656, 0.2784314, 0, 1, 1,
0.5851796, -0.850162, 1.194533, 0.282353, 0, 1, 1,
0.5866233, 0.6948051, -1.352415, 0.2901961, 0, 1, 1,
0.5941436, -0.7465101, 2.867378, 0.2941177, 0, 1, 1,
0.5955719, 0.5436581, 0.006529557, 0.3019608, 0, 1, 1,
0.5979512, 0.3014059, 1.25325, 0.3098039, 0, 1, 1,
0.6039425, -0.7448635, 2.513173, 0.3137255, 0, 1, 1,
0.604412, 0.5247464, 3.699901, 0.3215686, 0, 1, 1,
0.614821, 0.6851916, 1.671381, 0.3254902, 0, 1, 1,
0.6191444, -0.8693631, 2.033313, 0.3333333, 0, 1, 1,
0.6210837, -0.08886867, 3.355767, 0.3372549, 0, 1, 1,
0.6271645, 1.008722, -0.32224, 0.345098, 0, 1, 1,
0.6272823, -0.210292, 1.460597, 0.3490196, 0, 1, 1,
0.630549, -0.1148272, 0.06431732, 0.3568628, 0, 1, 1,
0.6416393, 0.7613782, 0.2091846, 0.3607843, 0, 1, 1,
0.6416689, 0.5484551, 0.3887728, 0.3686275, 0, 1, 1,
0.6482998, 0.4913874, 1.296809, 0.372549, 0, 1, 1,
0.6537857, 1.817912, 3.115049, 0.3803922, 0, 1, 1,
0.6617237, 1.822301, 0.7327343, 0.3843137, 0, 1, 1,
0.6629913, -1.384657, 5.304829, 0.3921569, 0, 1, 1,
0.6643164, -0.3038612, 2.548276, 0.3960784, 0, 1, 1,
0.6643256, -0.6931477, 1.27353, 0.4039216, 0, 1, 1,
0.6643903, 1.137277, 0.9717283, 0.4117647, 0, 1, 1,
0.6658531, 1.469232, 0.3479778, 0.4156863, 0, 1, 1,
0.6797878, -0.8703008, 2.875855, 0.4235294, 0, 1, 1,
0.6829486, -1.430335, 2.684763, 0.427451, 0, 1, 1,
0.6883277, 0.05194943, 0.3976359, 0.4352941, 0, 1, 1,
0.691929, 0.1517799, 3.270845, 0.4392157, 0, 1, 1,
0.6919807, 1.409572, 0.5486546, 0.4470588, 0, 1, 1,
0.6937434, 1.633537, -0.8896977, 0.4509804, 0, 1, 1,
0.6979133, -1.260815, 1.314533, 0.4588235, 0, 1, 1,
0.7024678, 1.029777, 2.738765, 0.4627451, 0, 1, 1,
0.7067415, -0.8460009, 1.856093, 0.4705882, 0, 1, 1,
0.7073447, 1.182132, 1.349939, 0.4745098, 0, 1, 1,
0.7074163, 0.5481744, 0.6774516, 0.4823529, 0, 1, 1,
0.7107244, -0.5632555, 4.365766, 0.4862745, 0, 1, 1,
0.7114179, 0.5062022, 1.519522, 0.4941176, 0, 1, 1,
0.7143054, 1.131635, 0.4059677, 0.5019608, 0, 1, 1,
0.7163601, 1.305095, 2.384688, 0.5058824, 0, 1, 1,
0.7172294, 0.1010349, 1.035544, 0.5137255, 0, 1, 1,
0.7287899, 0.7489449, 2.344377, 0.5176471, 0, 1, 1,
0.7388583, 1.141014, 0.4744245, 0.5254902, 0, 1, 1,
0.7424939, -0.1756058, 1.574867, 0.5294118, 0, 1, 1,
0.7447243, 0.04558489, 2.969659, 0.5372549, 0, 1, 1,
0.7448741, 1.21797, -0.9456732, 0.5411765, 0, 1, 1,
0.7458659, -2.081876, 2.177722, 0.5490196, 0, 1, 1,
0.7484764, 0.5455182, 1.680818, 0.5529412, 0, 1, 1,
0.753311, -1.04455, 2.325867, 0.5607843, 0, 1, 1,
0.7601368, 0.8474041, -0.7782674, 0.5647059, 0, 1, 1,
0.7643228, -0.03456131, 2.998986, 0.572549, 0, 1, 1,
0.7654892, -0.3194499, 2.330276, 0.5764706, 0, 1, 1,
0.7671928, -0.1285134, 0.8181223, 0.5843138, 0, 1, 1,
0.7673634, -1.366942, 2.72141, 0.5882353, 0, 1, 1,
0.7684808, 1.594938, -0.5445881, 0.5960785, 0, 1, 1,
0.7694435, 0.6992641, -0.05679333, 0.6039216, 0, 1, 1,
0.7696892, 1.159335, 0.5554235, 0.6078432, 0, 1, 1,
0.7702783, 0.9204849, 2.879911, 0.6156863, 0, 1, 1,
0.7747253, 1.480822, 1.513048, 0.6196079, 0, 1, 1,
0.7750651, -0.4864929, 1.210902, 0.627451, 0, 1, 1,
0.7768145, 0.2141134, 2.444316, 0.6313726, 0, 1, 1,
0.7915227, -2.011832, 1.575548, 0.6392157, 0, 1, 1,
0.7942359, -1.300075, 4.167817, 0.6431373, 0, 1, 1,
0.802839, -0.4847102, 2.067077, 0.6509804, 0, 1, 1,
0.8043619, 1.861099, -2.29772, 0.654902, 0, 1, 1,
0.8066847, -0.614554, 2.752957, 0.6627451, 0, 1, 1,
0.8167328, -0.3543016, 3.451128, 0.6666667, 0, 1, 1,
0.8219966, 1.766029, 0.7276635, 0.6745098, 0, 1, 1,
0.8232228, 0.3338989, 1.558271, 0.6784314, 0, 1, 1,
0.8276757, 0.8409271, 0.6849159, 0.6862745, 0, 1, 1,
0.8288051, 1.05199, 0.02460059, 0.6901961, 0, 1, 1,
0.8293916, 1.053585, 1.598579, 0.6980392, 0, 1, 1,
0.8329877, 0.6185706, 0.09356473, 0.7058824, 0, 1, 1,
0.8336959, -1.491561, 2.867869, 0.7098039, 0, 1, 1,
0.8338842, 0.5510772, 0.7726483, 0.7176471, 0, 1, 1,
0.8354418, -0.6884301, 3.639354, 0.7215686, 0, 1, 1,
0.839029, 0.292369, 1.306937, 0.7294118, 0, 1, 1,
0.8418869, 1.303916, -0.1509991, 0.7333333, 0, 1, 1,
0.849046, -1.512253, 2.784994, 0.7411765, 0, 1, 1,
0.851285, -0.7700599, 1.698886, 0.7450981, 0, 1, 1,
0.8540452, -1.049695, 2.092158, 0.7529412, 0, 1, 1,
0.8651177, -0.9274089, 2.384942, 0.7568628, 0, 1, 1,
0.8660026, -1.304086, 3.895813, 0.7647059, 0, 1, 1,
0.8703927, 0.6983595, -0.5955158, 0.7686275, 0, 1, 1,
0.8705025, -0.9863224, 2.194429, 0.7764706, 0, 1, 1,
0.872935, 2.581689, 0.2642412, 0.7803922, 0, 1, 1,
0.8779442, 1.232271, 0.1430837, 0.7882353, 0, 1, 1,
0.8860421, -0.2083326, 1.451721, 0.7921569, 0, 1, 1,
0.8948647, 0.1386769, 1.474054, 0.8, 0, 1, 1,
0.9038947, -0.17794, 0.2159857, 0.8078431, 0, 1, 1,
0.9044462, -0.8228848, 2.03328, 0.8117647, 0, 1, 1,
0.9118155, 1.036191, -0.3037934, 0.8196079, 0, 1, 1,
0.9119631, 0.6100487, 2.091382, 0.8235294, 0, 1, 1,
0.9175078, -0.4372212, 1.972832, 0.8313726, 0, 1, 1,
0.9202149, 0.4245403, 2.310938, 0.8352941, 0, 1, 1,
0.9212775, 0.3345166, 1.826847, 0.8431373, 0, 1, 1,
0.9327229, 0.2081707, 0.857296, 0.8470588, 0, 1, 1,
0.9379731, -0.4107128, 3.016814, 0.854902, 0, 1, 1,
0.9392452, 0.6427851, -0.2388791, 0.8588235, 0, 1, 1,
0.9405292, 1.416958, -1.364888, 0.8666667, 0, 1, 1,
0.9524238, 0.6590775, 2.21631, 0.8705882, 0, 1, 1,
0.9535058, -0.9460033, 2.121201, 0.8784314, 0, 1, 1,
0.9568142, -0.02894178, 2.742523, 0.8823529, 0, 1, 1,
0.9640894, 0.57045, 1.674565, 0.8901961, 0, 1, 1,
0.9667717, 1.792298, 0.099824, 0.8941177, 0, 1, 1,
0.972608, 0.1821235, 0.7777845, 0.9019608, 0, 1, 1,
0.9738923, -0.6625427, 1.65134, 0.9098039, 0, 1, 1,
0.981499, -2.020137, 3.757406, 0.9137255, 0, 1, 1,
0.9837901, -1.352643, 1.627199, 0.9215686, 0, 1, 1,
0.9892461, 0.7375958, 1.519864, 0.9254902, 0, 1, 1,
0.9987137, 0.2031238, 2.721274, 0.9333333, 0, 1, 1,
1.003267, -0.8338956, 2.192209, 0.9372549, 0, 1, 1,
1.003436, 0.016897, 2.665229, 0.945098, 0, 1, 1,
1.00507, -1.004135, 2.559468, 0.9490196, 0, 1, 1,
1.00831, -0.1142837, 1.981004, 0.9568627, 0, 1, 1,
1.011778, 0.9757746, 0.9065875, 0.9607843, 0, 1, 1,
1.012228, -0.02578542, 2.013968, 0.9686275, 0, 1, 1,
1.01349, -1.147358, 3.568184, 0.972549, 0, 1, 1,
1.014566, -2.456464, 2.241891, 0.9803922, 0, 1, 1,
1.016955, -0.5719272, 3.166377, 0.9843137, 0, 1, 1,
1.01737, 0.4699583, -1.003816, 0.9921569, 0, 1, 1,
1.020981, 0.1257705, 1.374677, 0.9960784, 0, 1, 1,
1.024683, -2.342745, 2.058612, 1, 0, 0.9960784, 1,
1.028704, 0.2697151, 0.4464926, 1, 0, 0.9882353, 1,
1.040528, 1.709682, -0.7656144, 1, 0, 0.9843137, 1,
1.044932, 0.3556058, 0.8719124, 1, 0, 0.9764706, 1,
1.048388, -0.1995402, 2.283311, 1, 0, 0.972549, 1,
1.04935, -0.4333874, 1.296816, 1, 0, 0.9647059, 1,
1.050249, -0.7237188, 3.262293, 1, 0, 0.9607843, 1,
1.051694, 1.686184, 0.4957376, 1, 0, 0.9529412, 1,
1.052299, -2.582294, 2.552518, 1, 0, 0.9490196, 1,
1.054104, -0.4694595, -0.3690975, 1, 0, 0.9411765, 1,
1.055779, -0.4159634, 1.280294, 1, 0, 0.9372549, 1,
1.061216, -0.4100956, 2.280963, 1, 0, 0.9294118, 1,
1.079973, 1.240245, -0.09480636, 1, 0, 0.9254902, 1,
1.080772, 0.6112337, 2.986664, 1, 0, 0.9176471, 1,
1.088429, 2.101895, 2.573369, 1, 0, 0.9137255, 1,
1.094892, -1.05482, 0.7088111, 1, 0, 0.9058824, 1,
1.099787, -1.142958, 2.154593, 1, 0, 0.9019608, 1,
1.099873, 0.3070919, 0.6766681, 1, 0, 0.8941177, 1,
1.102466, -2.202155, 2.16214, 1, 0, 0.8862745, 1,
1.108741, -0.8820947, 0.6027628, 1, 0, 0.8823529, 1,
1.110037, 1.016648, -1.352299, 1, 0, 0.8745098, 1,
1.110214, -0.4948191, 1.951078, 1, 0, 0.8705882, 1,
1.130419, -0.894613, 1.379478, 1, 0, 0.8627451, 1,
1.134623, -3.357979, 2.806278, 1, 0, 0.8588235, 1,
1.140721, -1.033912, 2.677459, 1, 0, 0.8509804, 1,
1.146246, -0.01557287, 1.774282, 1, 0, 0.8470588, 1,
1.148462, 0.08565966, 2.345511, 1, 0, 0.8392157, 1,
1.150343, 0.3155649, 1.789648, 1, 0, 0.8352941, 1,
1.152906, -0.114465, 2.360016, 1, 0, 0.827451, 1,
1.155365, -0.7820988, 3.006433, 1, 0, 0.8235294, 1,
1.159591, 0.6839423, 1.458793, 1, 0, 0.8156863, 1,
1.162093, -1.579177, 2.118739, 1, 0, 0.8117647, 1,
1.16349, -0.4923679, 2.45188, 1, 0, 0.8039216, 1,
1.171039, 1.063252, 1.619292, 1, 0, 0.7960784, 1,
1.172275, -0.4187165, 2.031501, 1, 0, 0.7921569, 1,
1.181183, 0.3288666, 1.689558, 1, 0, 0.7843137, 1,
1.189797, -0.1924207, 1.98491, 1, 0, 0.7803922, 1,
1.190535, -0.1762691, 2.390139, 1, 0, 0.772549, 1,
1.193266, 0.6314803, 2.623222, 1, 0, 0.7686275, 1,
1.195459, -2.592252, 2.692827, 1, 0, 0.7607843, 1,
1.206646, 0.2082841, 0.5349886, 1, 0, 0.7568628, 1,
1.21973, -0.01597006, 1.167427, 1, 0, 0.7490196, 1,
1.220886, -0.8591496, 3.181388, 1, 0, 0.7450981, 1,
1.222542, 0.1524065, 4.362852, 1, 0, 0.7372549, 1,
1.235416, -0.1350892, -0.04641721, 1, 0, 0.7333333, 1,
1.244565, 0.5852942, -0.1833631, 1, 0, 0.7254902, 1,
1.24849, 1.406694, 0.9232166, 1, 0, 0.7215686, 1,
1.249925, -1.084216, 1.892645, 1, 0, 0.7137255, 1,
1.252965, 0.8020884, 1.092731, 1, 0, 0.7098039, 1,
1.253247, 1.297658, 1.698318, 1, 0, 0.7019608, 1,
1.263778, -1.075997, 1.016924, 1, 0, 0.6941177, 1,
1.269274, -0.6084352, 2.506423, 1, 0, 0.6901961, 1,
1.27681, 1.109605, -1.155697, 1, 0, 0.682353, 1,
1.278335, 0.2439013, 1.537153, 1, 0, 0.6784314, 1,
1.281645, -2.233745, 2.529006, 1, 0, 0.6705883, 1,
1.28685, 0.7603231, 1.732444, 1, 0, 0.6666667, 1,
1.291321, 1.035573, 1.145457, 1, 0, 0.6588235, 1,
1.297123, 0.9375867, -0.1026165, 1, 0, 0.654902, 1,
1.298022, -0.4470254, 0.4627158, 1, 0, 0.6470588, 1,
1.313975, -1.030146, 0.9025119, 1, 0, 0.6431373, 1,
1.331922, -1.097049, 0.7677202, 1, 0, 0.6352941, 1,
1.34188, 1.47952, -0.7569417, 1, 0, 0.6313726, 1,
1.351934, -1.208836, 2.360906, 1, 0, 0.6235294, 1,
1.353562, 2.210221, -0.4779417, 1, 0, 0.6196079, 1,
1.355579, 1.447639, 0.0673503, 1, 0, 0.6117647, 1,
1.357449, -0.2797093, 0.1180543, 1, 0, 0.6078432, 1,
1.363624, 0.6915197, 1.355775, 1, 0, 0.6, 1,
1.367129, -0.06419531, 0.4497153, 1, 0, 0.5921569, 1,
1.368159, -1.270347, 3.493046, 1, 0, 0.5882353, 1,
1.371555, 1.060317, 1.055846, 1, 0, 0.5803922, 1,
1.390723, 1.172941, -0.3239786, 1, 0, 0.5764706, 1,
1.394153, -0.7909166, 0.3581917, 1, 0, 0.5686275, 1,
1.401611, -1.306184, 2.872238, 1, 0, 0.5647059, 1,
1.414855, -1.430567, 3.20729, 1, 0, 0.5568628, 1,
1.422639, -1.845071, 2.550299, 1, 0, 0.5529412, 1,
1.423868, -0.9719891, 1.372078, 1, 0, 0.5450981, 1,
1.429823, 0.01063942, 0.2537984, 1, 0, 0.5411765, 1,
1.433515, -0.5706699, 2.771556, 1, 0, 0.5333334, 1,
1.433972, -0.110322, 2.829403, 1, 0, 0.5294118, 1,
1.435454, 0.328442, 0.4438873, 1, 0, 0.5215687, 1,
1.436594, 0.2446177, 1.515854, 1, 0, 0.5176471, 1,
1.446079, -0.7304482, 1.474344, 1, 0, 0.509804, 1,
1.447371, 0.4461447, 1.946624, 1, 0, 0.5058824, 1,
1.470316, 0.5878863, 1.905462, 1, 0, 0.4980392, 1,
1.483448, -2.048161, 2.488752, 1, 0, 0.4901961, 1,
1.483909, 0.4473611, -0.5048785, 1, 0, 0.4862745, 1,
1.495794, -2.189767, 3.389628, 1, 0, 0.4784314, 1,
1.49675, 1.221888, 0.06882579, 1, 0, 0.4745098, 1,
1.501027, 1.460731, 0.7281681, 1, 0, 0.4666667, 1,
1.507061, 1.438468, 1.542781, 1, 0, 0.4627451, 1,
1.52842, -0.5952306, 0.9739248, 1, 0, 0.454902, 1,
1.530797, 0.07520144, 1.927338, 1, 0, 0.4509804, 1,
1.552817, 0.7353328, 1.647419, 1, 0, 0.4431373, 1,
1.555277, -0.3198462, 3.626743, 1, 0, 0.4392157, 1,
1.556923, 0.09931768, 0.4058311, 1, 0, 0.4313726, 1,
1.569738, -1.551426, 0.4539309, 1, 0, 0.427451, 1,
1.575781, 0.1581256, 1.252363, 1, 0, 0.4196078, 1,
1.600862, -0.6291197, 0.7441075, 1, 0, 0.4156863, 1,
1.614741, -1.10126, 2.115798, 1, 0, 0.4078431, 1,
1.631414, 0.2242886, 2.427013, 1, 0, 0.4039216, 1,
1.636346, -0.5954748, 0.6874353, 1, 0, 0.3960784, 1,
1.653551, -0.2770004, -0.2012167, 1, 0, 0.3882353, 1,
1.65718, 0.1375663, 0.7694085, 1, 0, 0.3843137, 1,
1.663828, -1.742849, 2.140274, 1, 0, 0.3764706, 1,
1.678608, -0.6936535, 1.902725, 1, 0, 0.372549, 1,
1.679739, 0.6622466, 1.725959, 1, 0, 0.3647059, 1,
1.695729, -0.1951018, 0.3612985, 1, 0, 0.3607843, 1,
1.69613, 0.8368672, 1.127193, 1, 0, 0.3529412, 1,
1.698039, 0.5480753, 2.870184, 1, 0, 0.3490196, 1,
1.701377, -0.5987605, 1.062574, 1, 0, 0.3411765, 1,
1.718166, 1.234143, 0.845116, 1, 0, 0.3372549, 1,
1.743526, 0.6868665, 2.328285, 1, 0, 0.3294118, 1,
1.753887, -1.131231, 2.130228, 1, 0, 0.3254902, 1,
1.758693, 0.7272146, -0.2003916, 1, 0, 0.3176471, 1,
1.759534, 0.7045337, 1.721419, 1, 0, 0.3137255, 1,
1.773992, -1.748251, 1.307144, 1, 0, 0.3058824, 1,
1.822098, 0.1462463, 0.5779311, 1, 0, 0.2980392, 1,
1.823218, -1.109099, 2.644661, 1, 0, 0.2941177, 1,
1.823283, 2.056211, -0.3435108, 1, 0, 0.2862745, 1,
1.826587, -0.8812544, 1.315793, 1, 0, 0.282353, 1,
1.831231, -0.6383709, 2.309324, 1, 0, 0.2745098, 1,
1.843618, -1.843439, 1.115224, 1, 0, 0.2705882, 1,
1.851197, -0.4932187, 2.497919, 1, 0, 0.2627451, 1,
1.851243, 1.323072, -0.8880411, 1, 0, 0.2588235, 1,
1.86067, 0.8275152, -0.1958957, 1, 0, 0.2509804, 1,
1.881938, -1.76888, 3.792239, 1, 0, 0.2470588, 1,
1.885251, -0.2732588, 2.64152, 1, 0, 0.2392157, 1,
1.896344, -1.566632, 2.87259, 1, 0, 0.2352941, 1,
1.917634, -0.6273224, 1.940125, 1, 0, 0.227451, 1,
1.927962, 0.1806879, 0.572992, 1, 0, 0.2235294, 1,
1.930671, -2.519243, 4.480034, 1, 0, 0.2156863, 1,
1.951453, 0.7226865, 0.9373855, 1, 0, 0.2117647, 1,
1.965817, -0.5463427, 2.018061, 1, 0, 0.2039216, 1,
1.975395, -1.230801, 4.488595, 1, 0, 0.1960784, 1,
1.977912, -0.2050515, 2.224229, 1, 0, 0.1921569, 1,
1.988427, 1.563511, 2.322159, 1, 0, 0.1843137, 1,
1.990753, 1.141681, 1.943977, 1, 0, 0.1803922, 1,
1.994282, 0.1499327, 0.6706415, 1, 0, 0.172549, 1,
2.005101, -1.728981, 2.704226, 1, 0, 0.1686275, 1,
2.03007, 0.04335888, 2.031524, 1, 0, 0.1607843, 1,
2.04142, -1.208254, 3.256637, 1, 0, 0.1568628, 1,
2.04518, -2.481519, 1.080627, 1, 0, 0.1490196, 1,
2.09183, -0.3493577, 1.293414, 1, 0, 0.145098, 1,
2.094449, -1.314042, 0.8104789, 1, 0, 0.1372549, 1,
2.118931, 1.057998, 0.4572909, 1, 0, 0.1333333, 1,
2.160064, 0.04567014, 0.4315149, 1, 0, 0.1254902, 1,
2.188533, -0.30628, 0.3883302, 1, 0, 0.1215686, 1,
2.194828, -0.8332283, 1.524418, 1, 0, 0.1137255, 1,
2.299762, -2.49244, 2.377944, 1, 0, 0.1098039, 1,
2.312872, -0.7510811, 1.68665, 1, 0, 0.1019608, 1,
2.346063, -0.8842485, 0.9933738, 1, 0, 0.09411765, 1,
2.355599, 0.1415406, 0.09863666, 1, 0, 0.09019608, 1,
2.35774, 1.715327, 1.596728, 1, 0, 0.08235294, 1,
2.39547, 0.4713289, 2.006073, 1, 0, 0.07843138, 1,
2.42937, -0.2596256, 2.393757, 1, 0, 0.07058824, 1,
2.480174, -0.114735, 0.2802407, 1, 0, 0.06666667, 1,
2.48252, -1.030662, -0.4292894, 1, 0, 0.05882353, 1,
2.511474, -0.9598894, 1.892004, 1, 0, 0.05490196, 1,
2.520685, -0.6884243, 1.915514, 1, 0, 0.04705882, 1,
2.602151, -0.2963115, 1.980662, 1, 0, 0.04313726, 1,
2.623235, -0.5142455, 0.6834636, 1, 0, 0.03529412, 1,
2.768496, -0.8471088, 2.640711, 1, 0, 0.03137255, 1,
2.796264, 2.849165, -0.7079296, 1, 0, 0.02352941, 1,
2.80294, -1.394014, 1.992634, 1, 0, 0.01960784, 1,
2.821006, 0.3957875, 1.793865, 1, 0, 0.01176471, 1,
2.868911, -0.1097215, 2.337206, 1, 0, 0.007843138, 1
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
-0.2211103, -4.429927, -6.778015, 0, -0.5, 0.5, 0.5,
-0.2211103, -4.429927, -6.778015, 1, -0.5, 0.5, 0.5,
-0.2211103, -4.429927, -6.778015, 1, 1.5, 0.5, 0.5,
-0.2211103, -4.429927, -6.778015, 0, 1.5, 0.5, 0.5
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
-4.358649, -0.1958889, -6.778015, 0, -0.5, 0.5, 0.5,
-4.358649, -0.1958889, -6.778015, 1, -0.5, 0.5, 0.5,
-4.358649, -0.1958889, -6.778015, 1, 1.5, 0.5, 0.5,
-4.358649, -0.1958889, -6.778015, 0, 1.5, 0.5, 0.5
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
-4.358649, -4.429927, 0.1390128, 0, -0.5, 0.5, 0.5,
-4.358649, -4.429927, 0.1390128, 1, -0.5, 0.5, 0.5,
-4.358649, -4.429927, 0.1390128, 1, 1.5, 0.5, 0.5,
-4.358649, -4.429927, 0.1390128, 0, 1.5, 0.5, 0.5
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
-3, -3.452841, -5.181777,
2, -3.452841, -5.181777,
-3, -3.452841, -5.181777,
-3, -3.615689, -5.447817,
-2, -3.452841, -5.181777,
-2, -3.615689, -5.447817,
-1, -3.452841, -5.181777,
-1, -3.615689, -5.447817,
0, -3.452841, -5.181777,
0, -3.615689, -5.447817,
1, -3.452841, -5.181777,
1, -3.615689, -5.447817,
2, -3.452841, -5.181777,
2, -3.615689, -5.447817
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
-3, -3.941384, -5.979896, 0, -0.5, 0.5, 0.5,
-3, -3.941384, -5.979896, 1, -0.5, 0.5, 0.5,
-3, -3.941384, -5.979896, 1, 1.5, 0.5, 0.5,
-3, -3.941384, -5.979896, 0, 1.5, 0.5, 0.5,
-2, -3.941384, -5.979896, 0, -0.5, 0.5, 0.5,
-2, -3.941384, -5.979896, 1, -0.5, 0.5, 0.5,
-2, -3.941384, -5.979896, 1, 1.5, 0.5, 0.5,
-2, -3.941384, -5.979896, 0, 1.5, 0.5, 0.5,
-1, -3.941384, -5.979896, 0, -0.5, 0.5, 0.5,
-1, -3.941384, -5.979896, 1, -0.5, 0.5, 0.5,
-1, -3.941384, -5.979896, 1, 1.5, 0.5, 0.5,
-1, -3.941384, -5.979896, 0, 1.5, 0.5, 0.5,
0, -3.941384, -5.979896, 0, -0.5, 0.5, 0.5,
0, -3.941384, -5.979896, 1, -0.5, 0.5, 0.5,
0, -3.941384, -5.979896, 1, 1.5, 0.5, 0.5,
0, -3.941384, -5.979896, 0, 1.5, 0.5, 0.5,
1, -3.941384, -5.979896, 0, -0.5, 0.5, 0.5,
1, -3.941384, -5.979896, 1, -0.5, 0.5, 0.5,
1, -3.941384, -5.979896, 1, 1.5, 0.5, 0.5,
1, -3.941384, -5.979896, 0, 1.5, 0.5, 0.5,
2, -3.941384, -5.979896, 0, -0.5, 0.5, 0.5,
2, -3.941384, -5.979896, 1, -0.5, 0.5, 0.5,
2, -3.941384, -5.979896, 1, 1.5, 0.5, 0.5,
2, -3.941384, -5.979896, 0, 1.5, 0.5, 0.5
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
-3.403832, -3, -5.181777,
-3.403832, 2, -5.181777,
-3.403832, -3, -5.181777,
-3.562968, -3, -5.447817,
-3.403832, -2, -5.181777,
-3.562968, -2, -5.447817,
-3.403832, -1, -5.181777,
-3.562968, -1, -5.447817,
-3.403832, 0, -5.181777,
-3.562968, 0, -5.447817,
-3.403832, 1, -5.181777,
-3.562968, 1, -5.447817,
-3.403832, 2, -5.181777,
-3.562968, 2, -5.447817
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
-3.88124, -3, -5.979896, 0, -0.5, 0.5, 0.5,
-3.88124, -3, -5.979896, 1, -0.5, 0.5, 0.5,
-3.88124, -3, -5.979896, 1, 1.5, 0.5, 0.5,
-3.88124, -3, -5.979896, 0, 1.5, 0.5, 0.5,
-3.88124, -2, -5.979896, 0, -0.5, 0.5, 0.5,
-3.88124, -2, -5.979896, 1, -0.5, 0.5, 0.5,
-3.88124, -2, -5.979896, 1, 1.5, 0.5, 0.5,
-3.88124, -2, -5.979896, 0, 1.5, 0.5, 0.5,
-3.88124, -1, -5.979896, 0, -0.5, 0.5, 0.5,
-3.88124, -1, -5.979896, 1, -0.5, 0.5, 0.5,
-3.88124, -1, -5.979896, 1, 1.5, 0.5, 0.5,
-3.88124, -1, -5.979896, 0, 1.5, 0.5, 0.5,
-3.88124, 0, -5.979896, 0, -0.5, 0.5, 0.5,
-3.88124, 0, -5.979896, 1, -0.5, 0.5, 0.5,
-3.88124, 0, -5.979896, 1, 1.5, 0.5, 0.5,
-3.88124, 0, -5.979896, 0, 1.5, 0.5, 0.5,
-3.88124, 1, -5.979896, 0, -0.5, 0.5, 0.5,
-3.88124, 1, -5.979896, 1, -0.5, 0.5, 0.5,
-3.88124, 1, -5.979896, 1, 1.5, 0.5, 0.5,
-3.88124, 1, -5.979896, 0, 1.5, 0.5, 0.5,
-3.88124, 2, -5.979896, 0, -0.5, 0.5, 0.5,
-3.88124, 2, -5.979896, 1, -0.5, 0.5, 0.5,
-3.88124, 2, -5.979896, 1, 1.5, 0.5, 0.5,
-3.88124, 2, -5.979896, 0, 1.5, 0.5, 0.5
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
-3.403832, -3.452841, -4,
-3.403832, -3.452841, 4,
-3.403832, -3.452841, -4,
-3.562968, -3.615689, -4,
-3.403832, -3.452841, -2,
-3.562968, -3.615689, -2,
-3.403832, -3.452841, 0,
-3.562968, -3.615689, 0,
-3.403832, -3.452841, 2,
-3.562968, -3.615689, 2,
-3.403832, -3.452841, 4,
-3.562968, -3.615689, 4
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
-3.88124, -3.941384, -4, 0, -0.5, 0.5, 0.5,
-3.88124, -3.941384, -4, 1, -0.5, 0.5, 0.5,
-3.88124, -3.941384, -4, 1, 1.5, 0.5, 0.5,
-3.88124, -3.941384, -4, 0, 1.5, 0.5, 0.5,
-3.88124, -3.941384, -2, 0, -0.5, 0.5, 0.5,
-3.88124, -3.941384, -2, 1, -0.5, 0.5, 0.5,
-3.88124, -3.941384, -2, 1, 1.5, 0.5, 0.5,
-3.88124, -3.941384, -2, 0, 1.5, 0.5, 0.5,
-3.88124, -3.941384, 0, 0, -0.5, 0.5, 0.5,
-3.88124, -3.941384, 0, 1, -0.5, 0.5, 0.5,
-3.88124, -3.941384, 0, 1, 1.5, 0.5, 0.5,
-3.88124, -3.941384, 0, 0, 1.5, 0.5, 0.5,
-3.88124, -3.941384, 2, 0, -0.5, 0.5, 0.5,
-3.88124, -3.941384, 2, 1, -0.5, 0.5, 0.5,
-3.88124, -3.941384, 2, 1, 1.5, 0.5, 0.5,
-3.88124, -3.941384, 2, 0, 1.5, 0.5, 0.5,
-3.88124, -3.941384, 4, 0, -0.5, 0.5, 0.5,
-3.88124, -3.941384, 4, 1, -0.5, 0.5, 0.5,
-3.88124, -3.941384, 4, 1, 1.5, 0.5, 0.5,
-3.88124, -3.941384, 4, 0, 1.5, 0.5, 0.5
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
-3.403832, -3.452841, -5.181777,
-3.403832, 3.061064, -5.181777,
-3.403832, -3.452841, 5.459803,
-3.403832, 3.061064, 5.459803,
-3.403832, -3.452841, -5.181777,
-3.403832, -3.452841, 5.459803,
-3.403832, 3.061064, -5.181777,
-3.403832, 3.061064, 5.459803,
-3.403832, -3.452841, -5.181777,
2.961612, -3.452841, -5.181777,
-3.403832, -3.452841, 5.459803,
2.961612, -3.452841, 5.459803,
-3.403832, 3.061064, -5.181777,
2.961612, 3.061064, -5.181777,
-3.403832, 3.061064, 5.459803,
2.961612, 3.061064, 5.459803,
2.961612, -3.452841, -5.181777,
2.961612, 3.061064, -5.181777,
2.961612, -3.452841, 5.459803,
2.961612, 3.061064, 5.459803,
2.961612, -3.452841, -5.181777,
2.961612, -3.452841, 5.459803,
2.961612, 3.061064, -5.181777,
2.961612, 3.061064, 5.459803
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
var radius = 7.479409;
var distance = 33.27673;
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
mvMatrix.translate( 0.2211103, 0.1958889, -0.1390128 );
mvMatrix.scale( 1.270435, 1.24148, 0.7599326 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.27673);
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
fluquinconazole<-read.table("fluquinconazole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluquinconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
```

```r
y<-fluquinconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
```

```r
z<-fluquinconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
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
-3.311131, 1.600331, -1.801586, 0, 0, 1, 1, 1,
-3.081454, -0.2566624, -1.397261, 1, 0, 0, 1, 1,
-2.745177, -0.1029998, -3.000396, 1, 0, 0, 1, 1,
-2.741698, -0.6482899, -1.768555, 1, 0, 0, 1, 1,
-2.672686, -0.08437406, -1.721902, 1, 0, 0, 1, 1,
-2.564642, 0.7019567, -3.037803, 1, 0, 0, 1, 1,
-2.419451, -0.4115037, -0.616897, 0, 0, 0, 1, 1,
-2.402695, 0.679297, -0.4074943, 0, 0, 0, 1, 1,
-2.306252, 0.03506333, -1.017175, 0, 0, 0, 1, 1,
-2.291709, -0.6850441, -2.675304, 0, 0, 0, 1, 1,
-2.243612, -0.6162233, -1.023444, 0, 0, 0, 1, 1,
-2.228475, -0.2135085, -4.118663, 0, 0, 0, 1, 1,
-2.212346, -1.848697, -0.7489415, 0, 0, 0, 1, 1,
-2.191738, -0.806595, -2.221982, 1, 1, 1, 1, 1,
-2.187767, -0.2427772, -4.478974, 1, 1, 1, 1, 1,
-2.108315, -0.2912973, -2.422715, 1, 1, 1, 1, 1,
-2.085449, 0.1225765, -0.7400315, 1, 1, 1, 1, 1,
-2.079278, 0.1187779, -0.8390728, 1, 1, 1, 1, 1,
-2.028329, -1.047773, -0.6442831, 1, 1, 1, 1, 1,
-2.013496, -0.490185, -2.98193, 1, 1, 1, 1, 1,
-1.95452, -0.781431, -0.818691, 1, 1, 1, 1, 1,
-1.948614, -0.7024369, -1.805724, 1, 1, 1, 1, 1,
-1.94194, -0.04503736, -3.146699, 1, 1, 1, 1, 1,
-1.932272, -2.748489, -3.412499, 1, 1, 1, 1, 1,
-1.917491, 1.055868, -1.083329, 1, 1, 1, 1, 1,
-1.903651, 0.756901, 0.0003101974, 1, 1, 1, 1, 1,
-1.901618, -0.6486635, -0.6415237, 1, 1, 1, 1, 1,
-1.901091, -0.5764302, -3.012192, 1, 1, 1, 1, 1,
-1.895635, 0.3799967, -0.9943223, 0, 0, 1, 1, 1,
-1.88157, 1.003463, -1.156719, 1, 0, 0, 1, 1,
-1.879012, 1.948493, 0.3380867, 1, 0, 0, 1, 1,
-1.828357, 1.220703, 0.1987185, 1, 0, 0, 1, 1,
-1.786588, 2.847167, -2.476044, 1, 0, 0, 1, 1,
-1.785691, -0.3218172, -3.400184, 1, 0, 0, 1, 1,
-1.757496, -0.9564633, -1.656243, 0, 0, 0, 1, 1,
-1.740681, 0.2788284, -0.4540429, 0, 0, 0, 1, 1,
-1.721175, 0.4940704, -1.394113, 0, 0, 0, 1, 1,
-1.704596, 0.07338975, -1.643417, 0, 0, 0, 1, 1,
-1.675802, -1.572152, -1.462382, 0, 0, 0, 1, 1,
-1.665459, -0.6527153, -1.798547, 0, 0, 0, 1, 1,
-1.662695, 0.7530695, -1.2856, 0, 0, 0, 1, 1,
-1.654548, -0.7691227, -1.958311, 1, 1, 1, 1, 1,
-1.651318, -1.410444, -1.804282, 1, 1, 1, 1, 1,
-1.646888, -0.01015376, -1.263742, 1, 1, 1, 1, 1,
-1.635365, 0.124666, -1.129121, 1, 1, 1, 1, 1,
-1.630491, -0.6549152, -1.035062, 1, 1, 1, 1, 1,
-1.628791, -0.9511914, -1.506414, 1, 1, 1, 1, 1,
-1.626856, 0.6929909, -0.3123709, 1, 1, 1, 1, 1,
-1.609745, 1.985092, 0.6996011, 1, 1, 1, 1, 1,
-1.600026, 1.399787, -0.6687809, 1, 1, 1, 1, 1,
-1.594306, 0.6741042, -1.672578, 1, 1, 1, 1, 1,
-1.593864, -1.727811, -1.321832, 1, 1, 1, 1, 1,
-1.593136, -0.7906947, -2.135107, 1, 1, 1, 1, 1,
-1.585863, 0.7571139, 0.1646244, 1, 1, 1, 1, 1,
-1.582976, 0.1445038, -2.38562, 1, 1, 1, 1, 1,
-1.582828, -0.9311317, -3.94533, 1, 1, 1, 1, 1,
-1.573206, -0.4643742, -2.911777, 0, 0, 1, 1, 1,
-1.568379, -0.1574119, -1.275949, 1, 0, 0, 1, 1,
-1.5615, -0.9626518, -1.072724, 1, 0, 0, 1, 1,
-1.549266, 0.7910868, -2.050828, 1, 0, 0, 1, 1,
-1.549157, -1.21542, -1.353025, 1, 0, 0, 1, 1,
-1.53688, 0.384547, -0.9219055, 1, 0, 0, 1, 1,
-1.522849, -0.6270978, -0.7891495, 0, 0, 0, 1, 1,
-1.502431, 1.715463, -2.048939, 0, 0, 0, 1, 1,
-1.50069, 1.421099, 0.499593, 0, 0, 0, 1, 1,
-1.493356, 1.377522, -0.1632874, 0, 0, 0, 1, 1,
-1.482824, -1.382859, -1.773631, 0, 0, 0, 1, 1,
-1.479105, -0.2863328, -0.4600331, 0, 0, 0, 1, 1,
-1.458187, 1.483418, 0.5565688, 0, 0, 0, 1, 1,
-1.453466, -0.7407592, -2.167637, 1, 1, 1, 1, 1,
-1.439201, -0.5315446, -2.362977, 1, 1, 1, 1, 1,
-1.438058, 0.4528142, -1.860929, 1, 1, 1, 1, 1,
-1.437399, -0.4927109, -3.604083, 1, 1, 1, 1, 1,
-1.418887, -0.3167874, -0.9275634, 1, 1, 1, 1, 1,
-1.40496, -0.2618453, -3.142789, 1, 1, 1, 1, 1,
-1.397535, -1.025087, -2.038943, 1, 1, 1, 1, 1,
-1.393451, 0.155431, -1.781676, 1, 1, 1, 1, 1,
-1.375749, -1.681994, -2.990881, 1, 1, 1, 1, 1,
-1.374979, -0.7952814, -3.903535, 1, 1, 1, 1, 1,
-1.367099, -0.2555957, -2.773441, 1, 1, 1, 1, 1,
-1.364772, 0.5649867, 0.2188112, 1, 1, 1, 1, 1,
-1.355303, 0.564161, -0.8786459, 1, 1, 1, 1, 1,
-1.352294, -1.54261, -2.207114, 1, 1, 1, 1, 1,
-1.338992, 0.9044338, -0.7282482, 1, 1, 1, 1, 1,
-1.335475, 0.1670199, -1.958132, 0, 0, 1, 1, 1,
-1.330528, -1.430881, -3.057077, 1, 0, 0, 1, 1,
-1.318545, 0.7792941, -1.077883, 1, 0, 0, 1, 1,
-1.31716, 0.457071, -1.031885, 1, 0, 0, 1, 1,
-1.315234, -0.6649476, -2.867473, 1, 0, 0, 1, 1,
-1.314999, 0.3982037, -2.24495, 1, 0, 0, 1, 1,
-1.298283, 0.2863707, -1.899932, 0, 0, 0, 1, 1,
-1.281217, -0.6072021, -0.1392258, 0, 0, 0, 1, 1,
-1.277246, 1.238407, 0.9044613, 0, 0, 0, 1, 1,
-1.272171, -0.5572057, -0.5708876, 0, 0, 0, 1, 1,
-1.260493, 0.2330238, -3.027706, 0, 0, 0, 1, 1,
-1.258465, 0.04018536, 0.0218506, 0, 0, 0, 1, 1,
-1.255473, -1.232393, -4.041102, 0, 0, 0, 1, 1,
-1.246839, 0.4141766, -0.07827517, 1, 1, 1, 1, 1,
-1.246156, 0.5857682, -0.258978, 1, 1, 1, 1, 1,
-1.245061, -0.5355039, -2.836887, 1, 1, 1, 1, 1,
-1.242488, -0.3819839, -0.7569401, 1, 1, 1, 1, 1,
-1.238153, -1.173956, -1.324253, 1, 1, 1, 1, 1,
-1.236, -0.02621497, -2.513027, 1, 1, 1, 1, 1,
-1.233685, -1.226629, -2.04469, 1, 1, 1, 1, 1,
-1.232028, -0.3072238, -2.161982, 1, 1, 1, 1, 1,
-1.216779, 0.1405594, -1.962798, 1, 1, 1, 1, 1,
-1.213618, 1.710751, -1.848854, 1, 1, 1, 1, 1,
-1.210694, 0.8058202, -1.002884, 1, 1, 1, 1, 1,
-1.198279, -2.657009, -2.701359, 1, 1, 1, 1, 1,
-1.189336, -0.2888034, -4.346309, 1, 1, 1, 1, 1,
-1.184856, 0.005497063, -0.4397001, 1, 1, 1, 1, 1,
-1.18466, 0.2572739, -1.154181, 1, 1, 1, 1, 1,
-1.184635, -0.2823184, -2.219432, 0, 0, 1, 1, 1,
-1.178756, 0.3505183, -0.9314376, 1, 0, 0, 1, 1,
-1.173593, -0.1884403, -2.37442, 1, 0, 0, 1, 1,
-1.173018, -0.4290351, -2.541249, 1, 0, 0, 1, 1,
-1.171669, -0.5125593, -2.395977, 1, 0, 0, 1, 1,
-1.160157, 0.4118596, -2.368913, 1, 0, 0, 1, 1,
-1.160077, 1.034573, -0.494524, 0, 0, 0, 1, 1,
-1.156103, 0.8051995, -2.409625, 0, 0, 0, 1, 1,
-1.151293, 1.031718, 0.01172339, 0, 0, 0, 1, 1,
-1.142816, 0.0719249, -2.280822, 0, 0, 0, 1, 1,
-1.139001, -0.09697574, -3.229661, 0, 0, 0, 1, 1,
-1.137667, 0.5733371, -1.069542, 0, 0, 0, 1, 1,
-1.136477, -1.495015, -3.261574, 0, 0, 0, 1, 1,
-1.118945, 0.3170178, -4.108057, 1, 1, 1, 1, 1,
-1.114708, -0.417991, -0.9375691, 1, 1, 1, 1, 1,
-1.113646, -0.2913509, -1.878683, 1, 1, 1, 1, 1,
-1.112989, 0.3757764, -2.757352, 1, 1, 1, 1, 1,
-1.104189, 0.1483758, -0.9504802, 1, 1, 1, 1, 1,
-1.10229, 1.002553, -1.845879, 1, 1, 1, 1, 1,
-1.098386, -0.09857897, -3.046608, 1, 1, 1, 1, 1,
-1.097987, -1.170189, -2.7055, 1, 1, 1, 1, 1,
-1.095449, -0.05171508, -0.9557245, 1, 1, 1, 1, 1,
-1.081176, -1.001952, -0.4744439, 1, 1, 1, 1, 1,
-1.075477, 0.114689, -0.8740246, 1, 1, 1, 1, 1,
-1.071066, 1.205074, 0.1625102, 1, 1, 1, 1, 1,
-1.067298, -0.5124468, -0.9540421, 1, 1, 1, 1, 1,
-1.065065, 0.04874144, -1.882112, 1, 1, 1, 1, 1,
-1.055401, -0.6778672, -2.868432, 1, 1, 1, 1, 1,
-1.054074, 1.509071, -1.15519, 0, 0, 1, 1, 1,
-1.047987, -0.3596519, -2.41071, 1, 0, 0, 1, 1,
-1.046722, -2.16737, -4.311053, 1, 0, 0, 1, 1,
-1.044452, 0.8925874, 0.3357494, 1, 0, 0, 1, 1,
-1.040164, -1.342101, -1.721545, 1, 0, 0, 1, 1,
-1.039628, 0.7001939, 0.2203261, 1, 0, 0, 1, 1,
-1.033874, 0.007925124, -2.992498, 0, 0, 0, 1, 1,
-1.03242, 0.7719353, -1.79042, 0, 0, 0, 1, 1,
-1.020452, -0.4966785, -1.622171, 0, 0, 0, 1, 1,
-1.014435, 0.9495534, -1.338688, 0, 0, 0, 1, 1,
-1.013315, -0.3642253, -1.520035, 0, 0, 0, 1, 1,
-1.01043, -0.2780024, -3.821831, 0, 0, 0, 1, 1,
-1.007508, -1.265638, -4.212677, 0, 0, 0, 1, 1,
-0.9975855, 0.5572623, -0.6117746, 1, 1, 1, 1, 1,
-0.9935908, 0.5235578, -2.255478, 1, 1, 1, 1, 1,
-0.9857155, -0.3162619, -0.7638795, 1, 1, 1, 1, 1,
-0.9812133, -0.6517223, -2.36293, 1, 1, 1, 1, 1,
-0.9733751, -1.900958, -3.765763, 1, 1, 1, 1, 1,
-0.9576275, 0.08837757, -3.149626, 1, 1, 1, 1, 1,
-0.954069, -1.762282, -3.204682, 1, 1, 1, 1, 1,
-0.9445301, 0.4146179, -1.257462, 1, 1, 1, 1, 1,
-0.9433473, -0.07619403, -0.8607312, 1, 1, 1, 1, 1,
-0.9423268, 1.329993, -0.1668803, 1, 1, 1, 1, 1,
-0.9375001, -0.9932196, -3.062693, 1, 1, 1, 1, 1,
-0.936347, 0.05720263, -0.1672518, 1, 1, 1, 1, 1,
-0.9315678, -0.1158949, -1.183547, 1, 1, 1, 1, 1,
-0.9304572, -0.8460792, -2.343838, 1, 1, 1, 1, 1,
-0.9247301, -0.9117563, -4.253285, 1, 1, 1, 1, 1,
-0.9209071, 1.337582, -0.4527432, 0, 0, 1, 1, 1,
-0.91959, 0.3689676, -2.265712, 1, 0, 0, 1, 1,
-0.9174901, 0.8941711, -0.39187, 1, 0, 0, 1, 1,
-0.8890144, -0.1319054, -2.195852, 1, 0, 0, 1, 1,
-0.8868758, 1.362524, -0.5872059, 1, 0, 0, 1, 1,
-0.8857572, -0.1973588, -2.566911, 1, 0, 0, 1, 1,
-0.8819314, -0.5209975, -0.8645062, 0, 0, 0, 1, 1,
-0.8778951, 0.32168, 0.5222954, 0, 0, 0, 1, 1,
-0.8776343, 1.534413, 0.4190234, 0, 0, 0, 1, 1,
-0.8767043, 0.857025, -0.7314855, 0, 0, 0, 1, 1,
-0.8743291, -1.749107, -3.676891, 0, 0, 0, 1, 1,
-0.8722145, -0.8316604, -2.174609, 0, 0, 0, 1, 1,
-0.8674083, 1.322358, 1.797595, 0, 0, 0, 1, 1,
-0.8635274, 0.3391083, -0.143364, 1, 1, 1, 1, 1,
-0.8629741, 0.4123329, -1.005584, 1, 1, 1, 1, 1,
-0.860999, -0.1862817, -1.972443, 1, 1, 1, 1, 1,
-0.860751, -1.055414, -2.657484, 1, 1, 1, 1, 1,
-0.8581765, 1.15115, -0.545202, 1, 1, 1, 1, 1,
-0.856178, -1.008278, -1.627391, 1, 1, 1, 1, 1,
-0.8551805, -1.148494, -3.961939, 1, 1, 1, 1, 1,
-0.8534842, 1.141302, -0.09752737, 1, 1, 1, 1, 1,
-0.8488557, -0.4278535, -0.9427169, 1, 1, 1, 1, 1,
-0.8450492, 0.4243443, 0.03590753, 1, 1, 1, 1, 1,
-0.8422613, -1.022971, -2.162463, 1, 1, 1, 1, 1,
-0.8409541, 0.7168131, 0.6961301, 1, 1, 1, 1, 1,
-0.8403609, 0.8642353, -2.216644, 1, 1, 1, 1, 1,
-0.8394366, -1.860157, -1.97434, 1, 1, 1, 1, 1,
-0.8366694, -0.1778754, -1.75355, 1, 1, 1, 1, 1,
-0.8360159, -0.5136812, -0.5194447, 0, 0, 1, 1, 1,
-0.8302538, -0.5590534, -0.4193103, 1, 0, 0, 1, 1,
-0.8279122, 0.3338514, -0.2468949, 1, 0, 0, 1, 1,
-0.8277239, -0.6255535, -1.768521, 1, 0, 0, 1, 1,
-0.8243591, 0.3997353, -0.3221594, 1, 0, 0, 1, 1,
-0.8217624, -0.6015198, -1.146806, 1, 0, 0, 1, 1,
-0.821277, 0.4214215, -1.436116, 0, 0, 0, 1, 1,
-0.8187629, -0.5267343, -0.9100603, 0, 0, 0, 1, 1,
-0.8170511, -0.4089999, -1.288742, 0, 0, 0, 1, 1,
-0.8161125, 0.5416906, 1.482139, 0, 0, 0, 1, 1,
-0.8032862, 1.00919, -0.04184368, 0, 0, 0, 1, 1,
-0.7932922, 0.6630265, -1.761119, 0, 0, 0, 1, 1,
-0.7846236, -0.1111336, -1.996984, 0, 0, 0, 1, 1,
-0.7741566, 0.44523, -0.3993743, 1, 1, 1, 1, 1,
-0.7729037, 0.8778688, 0.3960004, 1, 1, 1, 1, 1,
-0.7715516, 1.448965, 1.104077, 1, 1, 1, 1, 1,
-0.7712111, -0.1772423, -2.909282, 1, 1, 1, 1, 1,
-0.7691761, -0.561142, -3.843081, 1, 1, 1, 1, 1,
-0.7635209, -1.798992, -1.379739, 1, 1, 1, 1, 1,
-0.7630372, -1.133206, -1.803702, 1, 1, 1, 1, 1,
-0.7627798, 1.340189, -0.3456349, 1, 1, 1, 1, 1,
-0.7542393, -1.459347, -2.830714, 1, 1, 1, 1, 1,
-0.7467728, -0.03859861, -1.694151, 1, 1, 1, 1, 1,
-0.7457938, -0.669269, -1.103469, 1, 1, 1, 1, 1,
-0.7434953, 2.790788, -1.458672, 1, 1, 1, 1, 1,
-0.740472, -0.6673939, -2.40403, 1, 1, 1, 1, 1,
-0.7377799, 1.037135, -0.5014045, 1, 1, 1, 1, 1,
-0.7270848, 1.090906, -0.01368163, 1, 1, 1, 1, 1,
-0.7270138, 1.091267, 0.02508719, 0, 0, 1, 1, 1,
-0.7153871, 0.4887682, 0.03157005, 1, 0, 0, 1, 1,
-0.7150168, 1.38593, -0.4433037, 1, 0, 0, 1, 1,
-0.7111227, 0.7904589, -1.892401, 1, 0, 0, 1, 1,
-0.7102759, -0.889245, -2.257247, 1, 0, 0, 1, 1,
-0.7089542, -0.4521874, -2.762201, 1, 0, 0, 1, 1,
-0.7069718, -1.029961, -2.508624, 0, 0, 0, 1, 1,
-0.7069401, 0.5224049, -0.9719729, 0, 0, 0, 1, 1,
-0.7053008, 1.131573, -0.5516303, 0, 0, 0, 1, 1,
-0.7032441, 0.6493334, -1.804004, 0, 0, 0, 1, 1,
-0.7017587, 0.756988, -0.7760848, 0, 0, 0, 1, 1,
-0.7000936, 2.229533, -0.2056283, 0, 0, 0, 1, 1,
-0.6940941, -0.3672506, -3.382773, 0, 0, 0, 1, 1,
-0.6896702, -1.833037, -3.256089, 1, 1, 1, 1, 1,
-0.6827797, -0.2348063, 0.0318477, 1, 1, 1, 1, 1,
-0.6709155, -0.4395697, -0.919166, 1, 1, 1, 1, 1,
-0.6684761, -0.08281723, -1.267642, 1, 1, 1, 1, 1,
-0.6628751, -1.001682, -1.372129, 1, 1, 1, 1, 1,
-0.6569861, -0.2638164, -3.738735, 1, 1, 1, 1, 1,
-0.6557894, -1.66623, -4.222086, 1, 1, 1, 1, 1,
-0.6537811, 0.5668415, -0.2806702, 1, 1, 1, 1, 1,
-0.6530036, 0.4395587, -1.709524, 1, 1, 1, 1, 1,
-0.6474451, -1.384983, -2.164062, 1, 1, 1, 1, 1,
-0.6454495, 0.1481531, -1.752775, 1, 1, 1, 1, 1,
-0.643981, 0.3119666, -1.39391, 1, 1, 1, 1, 1,
-0.6426836, 0.5003896, -2.158948, 1, 1, 1, 1, 1,
-0.6313538, 1.459087, -0.3126417, 1, 1, 1, 1, 1,
-0.6300247, -0.8032037, -3.237617, 1, 1, 1, 1, 1,
-0.6284656, -2.36826, -3.745775, 0, 0, 1, 1, 1,
-0.62517, -0.07056253, -0.8272278, 1, 0, 0, 1, 1,
-0.6204427, 1.120532, 0.6290436, 1, 0, 0, 1, 1,
-0.6125364, 1.370366, -1.915534, 1, 0, 0, 1, 1,
-0.6098675, 0.7834068, -1.963655, 1, 0, 0, 1, 1,
-0.6012121, 1.294371, -1.278583, 1, 0, 0, 1, 1,
-0.6008154, 0.02332859, -0.8289871, 0, 0, 0, 1, 1,
-0.5996929, -0.04331248, -1.514732, 0, 0, 0, 1, 1,
-0.5986356, 0.05796334, -0.9441296, 0, 0, 0, 1, 1,
-0.5960049, -0.702776, -3.493946, 0, 0, 0, 1, 1,
-0.5941736, 1.744405, 0.3870161, 0, 0, 0, 1, 1,
-0.5900679, -0.3603653, -1.31383, 0, 0, 0, 1, 1,
-0.5900567, 0.001284226, -2.528109, 0, 0, 0, 1, 1,
-0.5892997, -0.6739816, -2.464725, 1, 1, 1, 1, 1,
-0.5879208, -2.187601, -2.714406, 1, 1, 1, 1, 1,
-0.5875317, -0.9607583, -2.934644, 1, 1, 1, 1, 1,
-0.5871116, 1.86971, -0.5551521, 1, 1, 1, 1, 1,
-0.5828158, 0.04415508, -1.789337, 1, 1, 1, 1, 1,
-0.582225, 0.9673372, 0.4745553, 1, 1, 1, 1, 1,
-0.5768071, 1.847268, 0.03848945, 1, 1, 1, 1, 1,
-0.5755768, -0.005375567, -1.523191, 1, 1, 1, 1, 1,
-0.5737629, -0.4183131, -4.623875, 1, 1, 1, 1, 1,
-0.5703309, -0.978133, -2.415755, 1, 1, 1, 1, 1,
-0.5653022, -0.6806941, -1.5563, 1, 1, 1, 1, 1,
-0.5646269, 0.7644724, -0.9868742, 1, 1, 1, 1, 1,
-0.5606223, 1.036033, -0.3321314, 1, 1, 1, 1, 1,
-0.559787, 2.745569, -1.060882, 1, 1, 1, 1, 1,
-0.556969, -0.1532037, -1.564183, 1, 1, 1, 1, 1,
-0.5535987, -1.227272, -1.22799, 0, 0, 1, 1, 1,
-0.5529288, -2.736455, -2.469762, 1, 0, 0, 1, 1,
-0.545881, -0.4320202, -1.091171, 1, 0, 0, 1, 1,
-0.5408546, -0.4811232, -2.296492, 1, 0, 0, 1, 1,
-0.5390625, 0.8561202, -0.2603913, 1, 0, 0, 1, 1,
-0.5380843, 0.5165641, -0.7040176, 1, 0, 0, 1, 1,
-0.531485, -0.5173042, 0.2318327, 0, 0, 0, 1, 1,
-0.5300106, -1.269547, -0.5558476, 0, 0, 0, 1, 1,
-0.5281659, 0.2363372, -0.8735836, 0, 0, 0, 1, 1,
-0.5268055, -0.8850494, -3.048283, 0, 0, 0, 1, 1,
-0.5265247, 0.616562, 0.1271778, 0, 0, 0, 1, 1,
-0.5259207, 0.5475121, -0.6344603, 0, 0, 0, 1, 1,
-0.5255, 1.716884, -1.258676, 0, 0, 0, 1, 1,
-0.5247679, -0.1893608, -2.309741, 1, 1, 1, 1, 1,
-0.5243239, -0.4327684, -1.915217, 1, 1, 1, 1, 1,
-0.5217363, 1.044338, -0.357222, 1, 1, 1, 1, 1,
-0.5185527, 0.1093434, -0.3989157, 1, 1, 1, 1, 1,
-0.5183446, 1.521737, 1.221039, 1, 1, 1, 1, 1,
-0.516606, 1.565485, -1.536784, 1, 1, 1, 1, 1,
-0.5134205, -0.114175, -1.999018, 1, 1, 1, 1, 1,
-0.5128844, -1.148427, -1.232897, 1, 1, 1, 1, 1,
-0.5127108, -0.2586395, -2.754401, 1, 1, 1, 1, 1,
-0.512434, -1.236279, -4.701038, 1, 1, 1, 1, 1,
-0.5096636, -0.6472458, -2.8773, 1, 1, 1, 1, 1,
-0.5035959, -1.706664, -3.11892, 1, 1, 1, 1, 1,
-0.4986743, -0.6695815, -2.174508, 1, 1, 1, 1, 1,
-0.4930329, 0.7325943, -1.772309, 1, 1, 1, 1, 1,
-0.4922098, 1.619287, 0.2474746, 1, 1, 1, 1, 1,
-0.4893661, 0.05259969, -1.838242, 0, 0, 1, 1, 1,
-0.4877369, 0.6252086, -1.01439, 1, 0, 0, 1, 1,
-0.486787, -0.07159954, -2.205566, 1, 0, 0, 1, 1,
-0.4795658, 1.038504, 0.2393369, 1, 0, 0, 1, 1,
-0.4767217, -0.3185758, -2.378138, 1, 0, 0, 1, 1,
-0.4692017, -0.07750174, -1.012392, 1, 0, 0, 1, 1,
-0.4687569, -1.566944, -3.59255, 0, 0, 0, 1, 1,
-0.4631901, -0.3665323, -1.273999, 0, 0, 0, 1, 1,
-0.4596741, 1.748377, -0.6951455, 0, 0, 0, 1, 1,
-0.4496493, -0.8788187, -3.462663, 0, 0, 0, 1, 1,
-0.4482273, 1.192221, -0.3330885, 0, 0, 0, 1, 1,
-0.4458301, 0.9394764, -1.277435, 0, 0, 0, 1, 1,
-0.445146, 0.1152523, -3.157568, 0, 0, 0, 1, 1,
-0.4448751, 0.6512294, 0.8580921, 1, 1, 1, 1, 1,
-0.4434469, -0.5882556, -4.13436, 1, 1, 1, 1, 1,
-0.4432749, -0.7837199, -0.4892582, 1, 1, 1, 1, 1,
-0.4428132, -1.334272, -3.168218, 1, 1, 1, 1, 1,
-0.4402384, -0.9123687, -2.752127, 1, 1, 1, 1, 1,
-0.4379622, -0.6712189, -3.430285, 1, 1, 1, 1, 1,
-0.4336655, -0.2548755, -2.251977, 1, 1, 1, 1, 1,
-0.4237275, -0.8297921, -2.663076, 1, 1, 1, 1, 1,
-0.4231518, 0.7001759, -0.7140545, 1, 1, 1, 1, 1,
-0.4224971, 0.03857539, -3.30908, 1, 1, 1, 1, 1,
-0.4223994, 0.8047881, -1.442594, 1, 1, 1, 1, 1,
-0.4190132, -0.7580084, -3.010119, 1, 1, 1, 1, 1,
-0.4181338, -0.02388715, -1.393955, 1, 1, 1, 1, 1,
-0.4180071, 0.8899668, 0.7354107, 1, 1, 1, 1, 1,
-0.4168175, 0.9060521, 0.5504767, 1, 1, 1, 1, 1,
-0.4126969, -0.5183556, -3.165494, 0, 0, 1, 1, 1,
-0.410556, 0.6389502, -0.6843916, 1, 0, 0, 1, 1,
-0.4049816, -0.2617318, -1.632435, 1, 0, 0, 1, 1,
-0.4014936, 2.00665, -0.407669, 1, 0, 0, 1, 1,
-0.3986229, -0.7233846, -2.584402, 1, 0, 0, 1, 1,
-0.3977001, -0.4955586, -2.280754, 1, 0, 0, 1, 1,
-0.3905388, -0.1104406, -2.295748, 0, 0, 0, 1, 1,
-0.3860276, -0.4706633, -3.20796, 0, 0, 0, 1, 1,
-0.3850861, 0.06426333, -1.85342, 0, 0, 0, 1, 1,
-0.3780679, -1.226163, -2.027914, 0, 0, 0, 1, 1,
-0.3774173, -0.3827302, -1.926933, 0, 0, 0, 1, 1,
-0.3728652, -0.3897951, -2.868238, 0, 0, 0, 1, 1,
-0.371502, -1.029457, -4.180283, 0, 0, 0, 1, 1,
-0.3692197, 0.7026822, 0.7039159, 1, 1, 1, 1, 1,
-0.368484, 0.2419636, -0.06363869, 1, 1, 1, 1, 1,
-0.3620162, -0.2371961, -3.278882, 1, 1, 1, 1, 1,
-0.3588585, -0.7243299, -3.853035, 1, 1, 1, 1, 1,
-0.3587454, 0.2242804, -1.654888, 1, 1, 1, 1, 1,
-0.3551134, 0.07887853, -0.396319, 1, 1, 1, 1, 1,
-0.3501372, 1.890943, 2.124764, 1, 1, 1, 1, 1,
-0.3496042, 0.6044512, -0.9958629, 1, 1, 1, 1, 1,
-0.3457958, 1.728306, -0.3142959, 1, 1, 1, 1, 1,
-0.339663, -0.8344197, -1.339607, 1, 1, 1, 1, 1,
-0.3381646, -0.5930859, -3.753924, 1, 1, 1, 1, 1,
-0.3368936, -0.8674416, -2.764066, 1, 1, 1, 1, 1,
-0.3350262, 1.922597, -1.970997, 1, 1, 1, 1, 1,
-0.3348606, 1.185419, -0.3430511, 1, 1, 1, 1, 1,
-0.3330107, -0.3816602, -2.316481, 1, 1, 1, 1, 1,
-0.3316625, 0.444415, -0.2916754, 0, 0, 1, 1, 1,
-0.3299029, 0.2734903, -1.846757, 1, 0, 0, 1, 1,
-0.3277825, -1.359, -4.568201, 1, 0, 0, 1, 1,
-0.3258714, 0.2244794, -1.522237, 1, 0, 0, 1, 1,
-0.3103009, 1.157082, -1.306892, 1, 0, 0, 1, 1,
-0.3102771, 0.6722454, 0.1262144, 1, 0, 0, 1, 1,
-0.310252, -0.2891015, -3.002613, 0, 0, 0, 1, 1,
-0.3039735, 0.4229308, -1.35775, 0, 0, 0, 1, 1,
-0.3030648, 0.3468714, -1.794986, 0, 0, 0, 1, 1,
-0.3026197, 0.1500014, 0.1950885, 0, 0, 0, 1, 1,
-0.3015019, 1.204669, 0.1209115, 0, 0, 0, 1, 1,
-0.3014041, 1.561159, 0.9729793, 0, 0, 0, 1, 1,
-0.2984974, 0.1775504, -1.584342, 0, 0, 0, 1, 1,
-0.2923484, 0.007784316, -2.803369, 1, 1, 1, 1, 1,
-0.2914304, 0.9430142, -1.138056, 1, 1, 1, 1, 1,
-0.2890298, 0.7863548, -0.175469, 1, 1, 1, 1, 1,
-0.2839474, 0.3293511, -0.8411368, 1, 1, 1, 1, 1,
-0.2795078, 0.01791911, -2.132709, 1, 1, 1, 1, 1,
-0.2745985, 1.467669, -0.1633217, 1, 1, 1, 1, 1,
-0.2738172, -1.413044, -2.504276, 1, 1, 1, 1, 1,
-0.2721983, 1.165049, -1.475309, 1, 1, 1, 1, 1,
-0.2660172, -0.588255, -3.755063, 1, 1, 1, 1, 1,
-0.2488925, 0.8478108, -0.7098818, 1, 1, 1, 1, 1,
-0.2479049, -0.7745704, -4.467802, 1, 1, 1, 1, 1,
-0.2465041, 2.013119, 0.8412828, 1, 1, 1, 1, 1,
-0.2422963, -0.6013682, -3.151965, 1, 1, 1, 1, 1,
-0.2403342, -1.106823, -2.057574, 1, 1, 1, 1, 1,
-0.2389768, -1.16067, -1.588898, 1, 1, 1, 1, 1,
-0.2372352, 0.5072612, -1.356685, 0, 0, 1, 1, 1,
-0.2299344, -2.127267, -1.380579, 1, 0, 0, 1, 1,
-0.2260259, 0.6596027, 0.09871661, 1, 0, 0, 1, 1,
-0.2241299, 0.100898, -1.390286, 1, 0, 0, 1, 1,
-0.2161777, -0.1442958, -2.01692, 1, 0, 0, 1, 1,
-0.2122156, -0.5840523, -3.101787, 1, 0, 0, 1, 1,
-0.2118168, 0.9877006, -1.822325, 0, 0, 0, 1, 1,
-0.2092707, 0.3777156, -0.4097225, 0, 0, 0, 1, 1,
-0.2081721, -0.9791923, -4.523741, 0, 0, 0, 1, 1,
-0.2075101, -0.1650976, -2.400848, 0, 0, 0, 1, 1,
-0.2057707, 0.3310251, -1.516541, 0, 0, 0, 1, 1,
-0.2037399, 0.6959487, -1.711339, 0, 0, 0, 1, 1,
-0.1976388, 1.127324, -1.304024, 0, 0, 0, 1, 1,
-0.1901973, 0.423321, -1.565919, 1, 1, 1, 1, 1,
-0.1887774, -0.2683518, -2.165724, 1, 1, 1, 1, 1,
-0.1865448, -0.6679173, -1.948487, 1, 1, 1, 1, 1,
-0.1856648, 0.1216222, -0.9093679, 1, 1, 1, 1, 1,
-0.1800559, 0.684975, -0.8976453, 1, 1, 1, 1, 1,
-0.1782199, -0.1724552, -1.844226, 1, 1, 1, 1, 1,
-0.1777029, 0.3661647, 0.3260587, 1, 1, 1, 1, 1,
-0.1776696, -0.5926568, -1.747626, 1, 1, 1, 1, 1,
-0.1712073, 1.487475, 0.9945711, 1, 1, 1, 1, 1,
-0.169801, 0.8730679, 0.2444136, 1, 1, 1, 1, 1,
-0.1688752, -0.5006486, -1.236724, 1, 1, 1, 1, 1,
-0.1685924, 0.1153597, -1.268952, 1, 1, 1, 1, 1,
-0.1679895, 0.9047962, -0.5763882, 1, 1, 1, 1, 1,
-0.167202, 0.007379717, -1.604369, 1, 1, 1, 1, 1,
-0.1652012, -0.9038903, -3.609119, 1, 1, 1, 1, 1,
-0.1636167, -0.5214022, -1.774063, 0, 0, 1, 1, 1,
-0.1590229, -1.081665, -4.230806, 1, 0, 0, 1, 1,
-0.1548849, -1.422996, -3.56664, 1, 0, 0, 1, 1,
-0.1501989, -1.196136, -2.755749, 1, 0, 0, 1, 1,
-0.1473594, -0.8822277, -1.699622, 1, 0, 0, 1, 1,
-0.1449229, 1.033639, -0.2803676, 1, 0, 0, 1, 1,
-0.1421156, -1.977021, -5.026803, 0, 0, 0, 1, 1,
-0.141142, 0.8852969, 0.9139801, 0, 0, 0, 1, 1,
-0.1407109, -0.8804947, -2.464992, 0, 0, 0, 1, 1,
-0.1284356, 0.8925915, 1.346981, 0, 0, 0, 1, 1,
-0.1242419, -0.004413008, -1.529854, 0, 0, 0, 1, 1,
-0.1242146, 0.6348761, 0.4188872, 0, 0, 0, 1, 1,
-0.1183245, 0.2469316, -3.345546, 0, 0, 0, 1, 1,
-0.1109404, -0.1314167, -2.071545, 1, 1, 1, 1, 1,
-0.1093993, -1.157757, -2.589463, 1, 1, 1, 1, 1,
-0.108228, -0.6994579, -3.611182, 1, 1, 1, 1, 1,
-0.107698, -1.818852, -4.264024, 1, 1, 1, 1, 1,
-0.1009691, -1.04463, -2.954846, 1, 1, 1, 1, 1,
-0.1004325, -1.20821, -4.457892, 1, 1, 1, 1, 1,
-0.09948143, -0.3352796, -1.573276, 1, 1, 1, 1, 1,
-0.09803737, 1.988148, -0.628842, 1, 1, 1, 1, 1,
-0.09715951, -0.03251209, -3.332244, 1, 1, 1, 1, 1,
-0.09491213, 0.2584174, -1.268237, 1, 1, 1, 1, 1,
-0.09119812, -0.0004271551, -1.335494, 1, 1, 1, 1, 1,
-0.08891321, 0.03963159, -2.261503, 1, 1, 1, 1, 1,
-0.08572787, -0.7871135, -3.208502, 1, 1, 1, 1, 1,
-0.08238283, -0.2947745, -2.497898, 1, 1, 1, 1, 1,
-0.08197666, 0.4093258, -1.049549, 1, 1, 1, 1, 1,
-0.07768812, 0.03207718, 1.77003, 0, 0, 1, 1, 1,
-0.07753562, -0.436279, -1.225103, 1, 0, 0, 1, 1,
-0.07544826, -0.4906782, -4.017639, 1, 0, 0, 1, 1,
-0.07489371, 0.7130089, 0.678304, 1, 0, 0, 1, 1,
-0.07001271, 0.5290998, -1.430146, 1, 0, 0, 1, 1,
-0.06978715, -2.553302, -4.081522, 1, 0, 0, 1, 1,
-0.066536, -1.237914, -3.073809, 0, 0, 0, 1, 1,
-0.06230617, -0.6276981, -3.239848, 0, 0, 0, 1, 1,
-0.05864368, -1.1886, -3.530724, 0, 0, 0, 1, 1,
-0.057555, 0.3718578, -0.2867351, 0, 0, 0, 1, 1,
-0.05620059, 1.661114, 1.844667, 0, 0, 0, 1, 1,
-0.05516309, 0.9813883, 1.626001, 0, 0, 0, 1, 1,
-0.05424986, 0.03595291, -0.6373565, 0, 0, 0, 1, 1,
-0.0533016, -1.51985, -4.637535, 1, 1, 1, 1, 1,
-0.05285164, -1.42519, -2.58301, 1, 1, 1, 1, 1,
-0.05129521, 1.927079, 0.2697799, 1, 1, 1, 1, 1,
-0.04920294, -0.5138573, -3.993924, 1, 1, 1, 1, 1,
-0.04670648, -1.317382, -2.655963, 1, 1, 1, 1, 1,
-0.04658292, -0.268076, -2.81823, 1, 1, 1, 1, 1,
-0.04177766, -0.2743729, -2.048376, 1, 1, 1, 1, 1,
-0.04018638, -1.153844, -1.477258, 1, 1, 1, 1, 1,
-0.03752826, -0.3836378, -3.207217, 1, 1, 1, 1, 1,
-0.02827608, -0.3875058, -2.23944, 1, 1, 1, 1, 1,
-0.02756896, -1.366813, -3.693907, 1, 1, 1, 1, 1,
-0.02048851, 0.06218463, 0.645138, 1, 1, 1, 1, 1,
-0.019516, 0.1756493, 0.1758067, 1, 1, 1, 1, 1,
-0.01308064, 0.6288472, 1.738233, 1, 1, 1, 1, 1,
-0.01249037, 0.3020306, 1.113123, 1, 1, 1, 1, 1,
-0.01225578, 0.9371263, -0.6813176, 0, 0, 1, 1, 1,
-0.007948173, 1.292755, 0.4336625, 1, 0, 0, 1, 1,
-0.001283284, -0.4457241, -4.842975, 1, 0, 0, 1, 1,
0.003213852, -0.507119, 4.138421, 1, 0, 0, 1, 1,
0.004252993, 0.02170693, -0.07388818, 1, 0, 0, 1, 1,
0.005841438, 0.7861093, 1.020738, 1, 0, 0, 1, 1,
0.006044004, 2.070729, 0.2946596, 0, 0, 0, 1, 1,
0.01417592, 0.1015165, -0.5159508, 0, 0, 0, 1, 1,
0.01660401, 0.5725108, -0.6251138, 0, 0, 0, 1, 1,
0.01911967, -1.734509, 3.965106, 0, 0, 0, 1, 1,
0.02291196, -0.7063615, 4.393839, 0, 0, 0, 1, 1,
0.02472465, -0.7938352, 1.973732, 0, 0, 0, 1, 1,
0.02775976, -1.249669, 3.886052, 0, 0, 0, 1, 1,
0.03144645, -3.169329, 2.513575, 1, 1, 1, 1, 1,
0.0336326, 1.548166, 2.207345, 1, 1, 1, 1, 1,
0.03471222, -0.4905798, 3.974287, 1, 1, 1, 1, 1,
0.03557227, -0.570406, 3.189098, 1, 1, 1, 1, 1,
0.03661534, -1.461669, 4.998648, 1, 1, 1, 1, 1,
0.03900852, 0.3155162, -0.6614105, 1, 1, 1, 1, 1,
0.04045638, 0.5632594, -2.266782, 1, 1, 1, 1, 1,
0.04136945, 1.951362, -0.09600718, 1, 1, 1, 1, 1,
0.04531296, -0.2126602, 3.740406, 1, 1, 1, 1, 1,
0.04737127, -0.2508146, 2.980414, 1, 1, 1, 1, 1,
0.04967406, -0.2352725, 2.530385, 1, 1, 1, 1, 1,
0.05254653, -0.1419474, 3.114557, 1, 1, 1, 1, 1,
0.05510496, 2.253059, -0.9894717, 1, 1, 1, 1, 1,
0.05711779, 1.081578, 1.436393, 1, 1, 1, 1, 1,
0.05754554, 0.1334489, -0.4893223, 1, 1, 1, 1, 1,
0.0608371, -0.5545753, 0.7469413, 0, 0, 1, 1, 1,
0.06104052, -0.9948453, 4.388136, 1, 0, 0, 1, 1,
0.06154583, -0.6521171, 1.783069, 1, 0, 0, 1, 1,
0.0654993, 2.174343, 0.04282285, 1, 0, 0, 1, 1,
0.07232282, 1.643229, -0.7960091, 1, 0, 0, 1, 1,
0.07359833, -0.8822629, 2.359555, 1, 0, 0, 1, 1,
0.08337223, 1.738976, 0.493735, 0, 0, 0, 1, 1,
0.08463996, 0.9532714, 1.601623, 0, 0, 0, 1, 1,
0.0906898, 0.05641833, 1.973681, 0, 0, 0, 1, 1,
0.09164577, -1.014301, 3.112931, 0, 0, 0, 1, 1,
0.101129, 1.502343, -0.2129872, 0, 0, 0, 1, 1,
0.1058141, 1.849068, 0.2241623, 0, 0, 0, 1, 1,
0.106682, 0.7531908, -0.1197397, 0, 0, 0, 1, 1,
0.1089629, 0.1336515, 1.237254, 1, 1, 1, 1, 1,
0.1109862, 0.5925949, 0.5268832, 1, 1, 1, 1, 1,
0.1119866, -0.8938428, 2.392249, 1, 1, 1, 1, 1,
0.1140169, -2.952313, 2.348978, 1, 1, 1, 1, 1,
0.1142202, -0.1293428, 3.879667, 1, 1, 1, 1, 1,
0.1170132, -0.4795685, 2.858676, 1, 1, 1, 1, 1,
0.1191269, 1.196646, 0.6800681, 1, 1, 1, 1, 1,
0.1202265, 0.252287, -0.1841298, 1, 1, 1, 1, 1,
0.1220471, -1.336151, 1.926787, 1, 1, 1, 1, 1,
0.125098, 0.2809123, 1.786435, 1, 1, 1, 1, 1,
0.1254563, -0.02254415, 1.853992, 1, 1, 1, 1, 1,
0.1268013, 0.0524401, 0.9090704, 1, 1, 1, 1, 1,
0.130033, 1.348956, 0.01687066, 1, 1, 1, 1, 1,
0.1335314, 0.2449546, -0.2295885, 1, 1, 1, 1, 1,
0.1337092, -0.1036695, 1.56477, 1, 1, 1, 1, 1,
0.1370333, 0.532171, -0.7806574, 0, 0, 1, 1, 1,
0.13914, -0.7508163, 1.906777, 1, 0, 0, 1, 1,
0.1405336, -1.004529, 3.443232, 1, 0, 0, 1, 1,
0.1446737, -1.776535, 2.914586, 1, 0, 0, 1, 1,
0.1475523, -0.5139718, 2.37356, 1, 0, 0, 1, 1,
0.1537432, 0.6212406, -0.5094615, 1, 0, 0, 1, 1,
0.159304, 0.4781347, -1.631039, 0, 0, 0, 1, 1,
0.1594994, 1.091376, -0.6573536, 0, 0, 0, 1, 1,
0.1620933, -0.04526948, 1.772678, 0, 0, 0, 1, 1,
0.1648658, -0.6246312, 3.440717, 0, 0, 0, 1, 1,
0.171088, 0.01511903, -0.2081298, 0, 0, 0, 1, 1,
0.1723558, 0.5938326, -0.8679488, 0, 0, 0, 1, 1,
0.1738459, -0.446813, 3.019112, 0, 0, 0, 1, 1,
0.1753731, 0.6428499, 1.058757, 1, 1, 1, 1, 1,
0.1769251, 0.1673198, 1.894642, 1, 1, 1, 1, 1,
0.1850567, 1.103308, 1.014773, 1, 1, 1, 1, 1,
0.1859338, 2.673911, 0.4562167, 1, 1, 1, 1, 1,
0.1863928, 0.2495687, -0.2162313, 1, 1, 1, 1, 1,
0.1866356, 1.458688, 0.5475785, 1, 1, 1, 1, 1,
0.1889357, 0.2493093, 0.8767502, 1, 1, 1, 1, 1,
0.192421, 2.120912, 2.016141, 1, 1, 1, 1, 1,
0.1925441, 0.1548668, 0.2827542, 1, 1, 1, 1, 1,
0.1939143, 0.6046154, -0.003923417, 1, 1, 1, 1, 1,
0.1953522, -1.173988, 2.599836, 1, 1, 1, 1, 1,
0.1972525, -1.091277, 2.063297, 1, 1, 1, 1, 1,
0.1990094, -0.1706828, 1.483762, 1, 1, 1, 1, 1,
0.2049618, -0.6923395, 2.23058, 1, 1, 1, 1, 1,
0.2051642, -0.02797168, 4.136048, 1, 1, 1, 1, 1,
0.20823, -0.4517309, 3.335272, 0, 0, 1, 1, 1,
0.2133637, 0.2426445, 1.976469, 1, 0, 0, 1, 1,
0.2133829, -0.8571509, 2.420281, 1, 0, 0, 1, 1,
0.2162096, -0.06628191, 2.12221, 1, 0, 0, 1, 1,
0.2230812, 0.4927913, -0.08286817, 1, 0, 0, 1, 1,
0.2298001, 0.7861168, 0.7172061, 1, 0, 0, 1, 1,
0.2303953, 0.007182884, 1.905548, 0, 0, 0, 1, 1,
0.2346911, 0.7349631, -0.3556106, 0, 0, 0, 1, 1,
0.2517487, 0.04769642, 2.104577, 0, 0, 0, 1, 1,
0.2520815, 0.210562, 1.38036, 0, 0, 0, 1, 1,
0.2551564, -0.1075448, 0.4196874, 0, 0, 0, 1, 1,
0.2577419, -0.02113942, 2.147762, 0, 0, 0, 1, 1,
0.2607231, -0.159837, 2.755327, 0, 0, 0, 1, 1,
0.2638232, -0.6420712, 2.067069, 1, 1, 1, 1, 1,
0.2666012, 0.2600147, 1.470511, 1, 1, 1, 1, 1,
0.2679801, 0.2003639, 2.719476, 1, 1, 1, 1, 1,
0.2736655, 0.5853982, -0.02022333, 1, 1, 1, 1, 1,
0.2737699, 0.3719349, 0.4295155, 1, 1, 1, 1, 1,
0.2752922, 0.4664442, -1.332843, 1, 1, 1, 1, 1,
0.2759652, 0.820731, 1.9851, 1, 1, 1, 1, 1,
0.2780734, -0.5897633, 3.75245, 1, 1, 1, 1, 1,
0.2789292, -0.2076067, 0.8823753, 1, 1, 1, 1, 1,
0.2801018, -1.002288, 2.275007, 1, 1, 1, 1, 1,
0.2911728, -1.313057, 3.362509, 1, 1, 1, 1, 1,
0.2934874, -0.1997808, 1.864679, 1, 1, 1, 1, 1,
0.2950511, 0.4113985, 0.8707457, 1, 1, 1, 1, 1,
0.2986404, 0.4243687, 2.52413, 1, 1, 1, 1, 1,
0.2999329, -0.6728085, 1.033599, 1, 1, 1, 1, 1,
0.3043437, 1.206318, 0.9293554, 0, 0, 1, 1, 1,
0.3073913, 0.4935588, 3.636145, 1, 0, 0, 1, 1,
0.3086899, -0.55256, 1.631839, 1, 0, 0, 1, 1,
0.3128776, -0.3291407, 2.675524, 1, 0, 0, 1, 1,
0.3131396, -1.067985, 3.073121, 1, 0, 0, 1, 1,
0.3132941, -0.0358297, 2.282613, 1, 0, 0, 1, 1,
0.3178342, 0.4294516, 1.054499, 0, 0, 0, 1, 1,
0.3184552, -1.291454, 2.004833, 0, 0, 0, 1, 1,
0.3189195, -0.9213609, 1.112144, 0, 0, 0, 1, 1,
0.3211238, -0.0182581, 1.150727, 0, 0, 0, 1, 1,
0.3243892, 1.232438, 0.7059422, 0, 0, 0, 1, 1,
0.3278215, -0.9930987, 1.086976, 0, 0, 0, 1, 1,
0.329012, 0.4188686, -0.7099532, 0, 0, 0, 1, 1,
0.3309498, -0.277027, 2.643526, 1, 1, 1, 1, 1,
0.3337346, 0.330264, 0.2460449, 1, 1, 1, 1, 1,
0.334139, -0.5953096, 2.484249, 1, 1, 1, 1, 1,
0.3350374, 1.263191, 2.014634, 1, 1, 1, 1, 1,
0.3375643, 0.3079115, 3.471597, 1, 1, 1, 1, 1,
0.3399136, 0.01925033, 0.0842438, 1, 1, 1, 1, 1,
0.3405885, -0.8266452, 3.484612, 1, 1, 1, 1, 1,
0.3417311, -0.3873004, 1.510864, 1, 1, 1, 1, 1,
0.3421315, -0.2283771, 2.006119, 1, 1, 1, 1, 1,
0.3439689, -0.7211492, 1.821987, 1, 1, 1, 1, 1,
0.3456049, 0.0348774, 2.42275, 1, 1, 1, 1, 1,
0.3481254, -1.3721, 1.242881, 1, 1, 1, 1, 1,
0.3511579, 0.7119089, 0.03954815, 1, 1, 1, 1, 1,
0.3537458, -0.004558135, 2.234955, 1, 1, 1, 1, 1,
0.3568195, 0.3514852, -0.2008313, 1, 1, 1, 1, 1,
0.3583389, -0.2717259, 4.041238, 0, 0, 1, 1, 1,
0.3599248, 0.08715397, 0.3409928, 1, 0, 0, 1, 1,
0.364113, -0.6712999, 2.615739, 1, 0, 0, 1, 1,
0.3656645, -1.010971, 3.658563, 1, 0, 0, 1, 1,
0.367114, 0.8356884, 0.5188578, 1, 0, 0, 1, 1,
0.3692583, -0.9931768, 2.917123, 1, 0, 0, 1, 1,
0.3708027, 0.7996073, 1.59979, 0, 0, 0, 1, 1,
0.3722528, 0.5096592, 0.5227231, 0, 0, 0, 1, 1,
0.3736731, 0.0409862, 0.1862, 0, 0, 0, 1, 1,
0.3738964, -0.1296052, 2.413342, 0, 0, 0, 1, 1,
0.3742317, 0.8529967, 0.01259705, 0, 0, 0, 1, 1,
0.3753262, -0.5322013, 2.022941, 0, 0, 0, 1, 1,
0.379386, 0.1407579, 0.1284932, 0, 0, 0, 1, 1,
0.3829795, 0.183165, 2.998008, 1, 1, 1, 1, 1,
0.3832301, 1.695273, 1.431961, 1, 1, 1, 1, 1,
0.3862819, -0.1351992, 2.105568, 1, 1, 1, 1, 1,
0.3874015, 0.7335489, -1.664732, 1, 1, 1, 1, 1,
0.3886011, 0.8612344, 0.6386997, 1, 1, 1, 1, 1,
0.3893295, -0.3823886, 1.726169, 1, 1, 1, 1, 1,
0.3934577, 1.266806, 1.21125, 1, 1, 1, 1, 1,
0.3935708, 0.05313637, -0.1253874, 1, 1, 1, 1, 1,
0.3962674, -2.096758, 3.795825, 1, 1, 1, 1, 1,
0.3973039, -1.133754, 2.24302, 1, 1, 1, 1, 1,
0.3998849, -0.08134662, 1.14501, 1, 1, 1, 1, 1,
0.3999339, 1.301909, -0.5979305, 1, 1, 1, 1, 1,
0.402164, -0.5902276, 1.198306, 1, 1, 1, 1, 1,
0.4069112, -1.007407, 3.287397, 1, 1, 1, 1, 1,
0.4074449, 0.5032542, 1.933365, 1, 1, 1, 1, 1,
0.4083908, -0.6093899, 4.524576, 0, 0, 1, 1, 1,
0.4087707, 0.3507092, 1.035225, 1, 0, 0, 1, 1,
0.4092419, -2.230959, 1.932705, 1, 0, 0, 1, 1,
0.4119651, 0.3903426, 1.371077, 1, 0, 0, 1, 1,
0.4137716, 1.057784, 1.768822, 1, 0, 0, 1, 1,
0.4151989, -0.4869019, 0.4793221, 1, 0, 0, 1, 1,
0.417279, 0.4994815, 0.3798818, 0, 0, 0, 1, 1,
0.4176352, 0.9839489, 0.1383271, 0, 0, 0, 1, 1,
0.4238073, -0.1970017, 0.7994539, 0, 0, 0, 1, 1,
0.4299595, -0.4765845, 1.596823, 0, 0, 0, 1, 1,
0.4326501, 0.7084982, 0.9815181, 0, 0, 0, 1, 1,
0.4338364, -1.207663, 4.377668, 0, 0, 0, 1, 1,
0.4357855, 0.7095657, -0.420658, 0, 0, 0, 1, 1,
0.4366806, 2.491901, 1.951034, 1, 1, 1, 1, 1,
0.4378062, -0.9432498, 2.983028, 1, 1, 1, 1, 1,
0.4428561, -0.04135504, 2.37167, 1, 1, 1, 1, 1,
0.4468514, 0.4783521, 3.232176, 1, 1, 1, 1, 1,
0.447374, 0.7469901, -0.1033652, 1, 1, 1, 1, 1,
0.4481656, -0.6360959, 1.99422, 1, 1, 1, 1, 1,
0.4523953, 2.966201, -0.3360033, 1, 1, 1, 1, 1,
0.4571568, 1.117823, -0.7593529, 1, 1, 1, 1, 1,
0.4711541, 0.1281446, -0.3620651, 1, 1, 1, 1, 1,
0.4713804, -0.3656161, 3.047822, 1, 1, 1, 1, 1,
0.471405, 0.03911581, 0.3128944, 1, 1, 1, 1, 1,
0.4827216, -0.5443845, 1.651663, 1, 1, 1, 1, 1,
0.4850897, -0.6668272, 2.303063, 1, 1, 1, 1, 1,
0.4858606, 1.228542, -0.2293306, 1, 1, 1, 1, 1,
0.4929015, 0.3702082, -0.4431141, 1, 1, 1, 1, 1,
0.4938089, -0.2886269, -0.2402943, 0, 0, 1, 1, 1,
0.4940256, 1.145332, -0.4629863, 1, 0, 0, 1, 1,
0.5005188, 0.735008, 1.837757, 1, 0, 0, 1, 1,
0.5011405, -0.6850711, 1.847317, 1, 0, 0, 1, 1,
0.5011803, 1.402187, 0.1870227, 1, 0, 0, 1, 1,
0.5021929, 0.7200184, 1.041419, 1, 0, 0, 1, 1,
0.5022359, 1.165127, -0.2833787, 0, 0, 0, 1, 1,
0.5065308, 2.44396, -0.8870779, 0, 0, 0, 1, 1,
0.5101861, -1.337357, 3.318218, 0, 0, 0, 1, 1,
0.5126492, -0.800504, 2.405213, 0, 0, 0, 1, 1,
0.5167199, -0.8713702, 3.112934, 0, 0, 0, 1, 1,
0.5180185, 0.1402116, 1.172451, 0, 0, 0, 1, 1,
0.5198691, -0.393452, 1.41962, 0, 0, 0, 1, 1,
0.5241401, 1.726083, 0.1400715, 1, 1, 1, 1, 1,
0.5246466, 0.5621463, 1.081446, 1, 1, 1, 1, 1,
0.525921, -2.057682, 2.108989, 1, 1, 1, 1, 1,
0.527351, 1.092276, -1.121569, 1, 1, 1, 1, 1,
0.5282593, -1.14364, 2.656013, 1, 1, 1, 1, 1,
0.5309272, -0.4670478, 2.068956, 1, 1, 1, 1, 1,
0.5329986, -0.2987234, 0.6309491, 1, 1, 1, 1, 1,
0.5340038, 0.09772775, 1.405652, 1, 1, 1, 1, 1,
0.5437352, -0.4659015, 2.973299, 1, 1, 1, 1, 1,
0.5444163, -0.3447403, 4.390759, 1, 1, 1, 1, 1,
0.5468151, -0.2201775, 3.174057, 1, 1, 1, 1, 1,
0.547391, -2.264029, 2.803347, 1, 1, 1, 1, 1,
0.5506632, -1.397681, 1.956152, 1, 1, 1, 1, 1,
0.5538737, -0.7173082, 1.612172, 1, 1, 1, 1, 1,
0.5539871, 1.272122, 0.3108425, 1, 1, 1, 1, 1,
0.554383, 0.3968983, 0.691153, 0, 0, 1, 1, 1,
0.5547645, -2.341231, 1.219167, 1, 0, 0, 1, 1,
0.5550401, -1.307635, 3.290933, 1, 0, 0, 1, 1,
0.5595369, 1.006776, 0.4030091, 1, 0, 0, 1, 1,
0.5647358, 1.12016, -1.041112, 1, 0, 0, 1, 1,
0.5659195, -0.1646471, 0.82297, 1, 0, 0, 1, 1,
0.5687942, -0.04056753, 0.9665982, 0, 0, 0, 1, 1,
0.5703681, 0.5010982, 0.5700893, 0, 0, 0, 1, 1,
0.5706051, 1.647691, 0.8363113, 0, 0, 0, 1, 1,
0.5734259, -1.593872, 2.586156, 0, 0, 0, 1, 1,
0.5736289, -0.6801399, 2.894733, 0, 0, 0, 1, 1,
0.5763376, 1.1875, 0.3410265, 0, 0, 0, 1, 1,
0.5769717, 0.02563543, 1.385242, 0, 0, 0, 1, 1,
0.5820405, -0.6337045, 1.647656, 1, 1, 1, 1, 1,
0.5851796, -0.850162, 1.194533, 1, 1, 1, 1, 1,
0.5866233, 0.6948051, -1.352415, 1, 1, 1, 1, 1,
0.5941436, -0.7465101, 2.867378, 1, 1, 1, 1, 1,
0.5955719, 0.5436581, 0.006529557, 1, 1, 1, 1, 1,
0.5979512, 0.3014059, 1.25325, 1, 1, 1, 1, 1,
0.6039425, -0.7448635, 2.513173, 1, 1, 1, 1, 1,
0.604412, 0.5247464, 3.699901, 1, 1, 1, 1, 1,
0.614821, 0.6851916, 1.671381, 1, 1, 1, 1, 1,
0.6191444, -0.8693631, 2.033313, 1, 1, 1, 1, 1,
0.6210837, -0.08886867, 3.355767, 1, 1, 1, 1, 1,
0.6271645, 1.008722, -0.32224, 1, 1, 1, 1, 1,
0.6272823, -0.210292, 1.460597, 1, 1, 1, 1, 1,
0.630549, -0.1148272, 0.06431732, 1, 1, 1, 1, 1,
0.6416393, 0.7613782, 0.2091846, 1, 1, 1, 1, 1,
0.6416689, 0.5484551, 0.3887728, 0, 0, 1, 1, 1,
0.6482998, 0.4913874, 1.296809, 1, 0, 0, 1, 1,
0.6537857, 1.817912, 3.115049, 1, 0, 0, 1, 1,
0.6617237, 1.822301, 0.7327343, 1, 0, 0, 1, 1,
0.6629913, -1.384657, 5.304829, 1, 0, 0, 1, 1,
0.6643164, -0.3038612, 2.548276, 1, 0, 0, 1, 1,
0.6643256, -0.6931477, 1.27353, 0, 0, 0, 1, 1,
0.6643903, 1.137277, 0.9717283, 0, 0, 0, 1, 1,
0.6658531, 1.469232, 0.3479778, 0, 0, 0, 1, 1,
0.6797878, -0.8703008, 2.875855, 0, 0, 0, 1, 1,
0.6829486, -1.430335, 2.684763, 0, 0, 0, 1, 1,
0.6883277, 0.05194943, 0.3976359, 0, 0, 0, 1, 1,
0.691929, 0.1517799, 3.270845, 0, 0, 0, 1, 1,
0.6919807, 1.409572, 0.5486546, 1, 1, 1, 1, 1,
0.6937434, 1.633537, -0.8896977, 1, 1, 1, 1, 1,
0.6979133, -1.260815, 1.314533, 1, 1, 1, 1, 1,
0.7024678, 1.029777, 2.738765, 1, 1, 1, 1, 1,
0.7067415, -0.8460009, 1.856093, 1, 1, 1, 1, 1,
0.7073447, 1.182132, 1.349939, 1, 1, 1, 1, 1,
0.7074163, 0.5481744, 0.6774516, 1, 1, 1, 1, 1,
0.7107244, -0.5632555, 4.365766, 1, 1, 1, 1, 1,
0.7114179, 0.5062022, 1.519522, 1, 1, 1, 1, 1,
0.7143054, 1.131635, 0.4059677, 1, 1, 1, 1, 1,
0.7163601, 1.305095, 2.384688, 1, 1, 1, 1, 1,
0.7172294, 0.1010349, 1.035544, 1, 1, 1, 1, 1,
0.7287899, 0.7489449, 2.344377, 1, 1, 1, 1, 1,
0.7388583, 1.141014, 0.4744245, 1, 1, 1, 1, 1,
0.7424939, -0.1756058, 1.574867, 1, 1, 1, 1, 1,
0.7447243, 0.04558489, 2.969659, 0, 0, 1, 1, 1,
0.7448741, 1.21797, -0.9456732, 1, 0, 0, 1, 1,
0.7458659, -2.081876, 2.177722, 1, 0, 0, 1, 1,
0.7484764, 0.5455182, 1.680818, 1, 0, 0, 1, 1,
0.753311, -1.04455, 2.325867, 1, 0, 0, 1, 1,
0.7601368, 0.8474041, -0.7782674, 1, 0, 0, 1, 1,
0.7643228, -0.03456131, 2.998986, 0, 0, 0, 1, 1,
0.7654892, -0.3194499, 2.330276, 0, 0, 0, 1, 1,
0.7671928, -0.1285134, 0.8181223, 0, 0, 0, 1, 1,
0.7673634, -1.366942, 2.72141, 0, 0, 0, 1, 1,
0.7684808, 1.594938, -0.5445881, 0, 0, 0, 1, 1,
0.7694435, 0.6992641, -0.05679333, 0, 0, 0, 1, 1,
0.7696892, 1.159335, 0.5554235, 0, 0, 0, 1, 1,
0.7702783, 0.9204849, 2.879911, 1, 1, 1, 1, 1,
0.7747253, 1.480822, 1.513048, 1, 1, 1, 1, 1,
0.7750651, -0.4864929, 1.210902, 1, 1, 1, 1, 1,
0.7768145, 0.2141134, 2.444316, 1, 1, 1, 1, 1,
0.7915227, -2.011832, 1.575548, 1, 1, 1, 1, 1,
0.7942359, -1.300075, 4.167817, 1, 1, 1, 1, 1,
0.802839, -0.4847102, 2.067077, 1, 1, 1, 1, 1,
0.8043619, 1.861099, -2.29772, 1, 1, 1, 1, 1,
0.8066847, -0.614554, 2.752957, 1, 1, 1, 1, 1,
0.8167328, -0.3543016, 3.451128, 1, 1, 1, 1, 1,
0.8219966, 1.766029, 0.7276635, 1, 1, 1, 1, 1,
0.8232228, 0.3338989, 1.558271, 1, 1, 1, 1, 1,
0.8276757, 0.8409271, 0.6849159, 1, 1, 1, 1, 1,
0.8288051, 1.05199, 0.02460059, 1, 1, 1, 1, 1,
0.8293916, 1.053585, 1.598579, 1, 1, 1, 1, 1,
0.8329877, 0.6185706, 0.09356473, 0, 0, 1, 1, 1,
0.8336959, -1.491561, 2.867869, 1, 0, 0, 1, 1,
0.8338842, 0.5510772, 0.7726483, 1, 0, 0, 1, 1,
0.8354418, -0.6884301, 3.639354, 1, 0, 0, 1, 1,
0.839029, 0.292369, 1.306937, 1, 0, 0, 1, 1,
0.8418869, 1.303916, -0.1509991, 1, 0, 0, 1, 1,
0.849046, -1.512253, 2.784994, 0, 0, 0, 1, 1,
0.851285, -0.7700599, 1.698886, 0, 0, 0, 1, 1,
0.8540452, -1.049695, 2.092158, 0, 0, 0, 1, 1,
0.8651177, -0.9274089, 2.384942, 0, 0, 0, 1, 1,
0.8660026, -1.304086, 3.895813, 0, 0, 0, 1, 1,
0.8703927, 0.6983595, -0.5955158, 0, 0, 0, 1, 1,
0.8705025, -0.9863224, 2.194429, 0, 0, 0, 1, 1,
0.872935, 2.581689, 0.2642412, 1, 1, 1, 1, 1,
0.8779442, 1.232271, 0.1430837, 1, 1, 1, 1, 1,
0.8860421, -0.2083326, 1.451721, 1, 1, 1, 1, 1,
0.8948647, 0.1386769, 1.474054, 1, 1, 1, 1, 1,
0.9038947, -0.17794, 0.2159857, 1, 1, 1, 1, 1,
0.9044462, -0.8228848, 2.03328, 1, 1, 1, 1, 1,
0.9118155, 1.036191, -0.3037934, 1, 1, 1, 1, 1,
0.9119631, 0.6100487, 2.091382, 1, 1, 1, 1, 1,
0.9175078, -0.4372212, 1.972832, 1, 1, 1, 1, 1,
0.9202149, 0.4245403, 2.310938, 1, 1, 1, 1, 1,
0.9212775, 0.3345166, 1.826847, 1, 1, 1, 1, 1,
0.9327229, 0.2081707, 0.857296, 1, 1, 1, 1, 1,
0.9379731, -0.4107128, 3.016814, 1, 1, 1, 1, 1,
0.9392452, 0.6427851, -0.2388791, 1, 1, 1, 1, 1,
0.9405292, 1.416958, -1.364888, 1, 1, 1, 1, 1,
0.9524238, 0.6590775, 2.21631, 0, 0, 1, 1, 1,
0.9535058, -0.9460033, 2.121201, 1, 0, 0, 1, 1,
0.9568142, -0.02894178, 2.742523, 1, 0, 0, 1, 1,
0.9640894, 0.57045, 1.674565, 1, 0, 0, 1, 1,
0.9667717, 1.792298, 0.099824, 1, 0, 0, 1, 1,
0.972608, 0.1821235, 0.7777845, 1, 0, 0, 1, 1,
0.9738923, -0.6625427, 1.65134, 0, 0, 0, 1, 1,
0.981499, -2.020137, 3.757406, 0, 0, 0, 1, 1,
0.9837901, -1.352643, 1.627199, 0, 0, 0, 1, 1,
0.9892461, 0.7375958, 1.519864, 0, 0, 0, 1, 1,
0.9987137, 0.2031238, 2.721274, 0, 0, 0, 1, 1,
1.003267, -0.8338956, 2.192209, 0, 0, 0, 1, 1,
1.003436, 0.016897, 2.665229, 0, 0, 0, 1, 1,
1.00507, -1.004135, 2.559468, 1, 1, 1, 1, 1,
1.00831, -0.1142837, 1.981004, 1, 1, 1, 1, 1,
1.011778, 0.9757746, 0.9065875, 1, 1, 1, 1, 1,
1.012228, -0.02578542, 2.013968, 1, 1, 1, 1, 1,
1.01349, -1.147358, 3.568184, 1, 1, 1, 1, 1,
1.014566, -2.456464, 2.241891, 1, 1, 1, 1, 1,
1.016955, -0.5719272, 3.166377, 1, 1, 1, 1, 1,
1.01737, 0.4699583, -1.003816, 1, 1, 1, 1, 1,
1.020981, 0.1257705, 1.374677, 1, 1, 1, 1, 1,
1.024683, -2.342745, 2.058612, 1, 1, 1, 1, 1,
1.028704, 0.2697151, 0.4464926, 1, 1, 1, 1, 1,
1.040528, 1.709682, -0.7656144, 1, 1, 1, 1, 1,
1.044932, 0.3556058, 0.8719124, 1, 1, 1, 1, 1,
1.048388, -0.1995402, 2.283311, 1, 1, 1, 1, 1,
1.04935, -0.4333874, 1.296816, 1, 1, 1, 1, 1,
1.050249, -0.7237188, 3.262293, 0, 0, 1, 1, 1,
1.051694, 1.686184, 0.4957376, 1, 0, 0, 1, 1,
1.052299, -2.582294, 2.552518, 1, 0, 0, 1, 1,
1.054104, -0.4694595, -0.3690975, 1, 0, 0, 1, 1,
1.055779, -0.4159634, 1.280294, 1, 0, 0, 1, 1,
1.061216, -0.4100956, 2.280963, 1, 0, 0, 1, 1,
1.079973, 1.240245, -0.09480636, 0, 0, 0, 1, 1,
1.080772, 0.6112337, 2.986664, 0, 0, 0, 1, 1,
1.088429, 2.101895, 2.573369, 0, 0, 0, 1, 1,
1.094892, -1.05482, 0.7088111, 0, 0, 0, 1, 1,
1.099787, -1.142958, 2.154593, 0, 0, 0, 1, 1,
1.099873, 0.3070919, 0.6766681, 0, 0, 0, 1, 1,
1.102466, -2.202155, 2.16214, 0, 0, 0, 1, 1,
1.108741, -0.8820947, 0.6027628, 1, 1, 1, 1, 1,
1.110037, 1.016648, -1.352299, 1, 1, 1, 1, 1,
1.110214, -0.4948191, 1.951078, 1, 1, 1, 1, 1,
1.130419, -0.894613, 1.379478, 1, 1, 1, 1, 1,
1.134623, -3.357979, 2.806278, 1, 1, 1, 1, 1,
1.140721, -1.033912, 2.677459, 1, 1, 1, 1, 1,
1.146246, -0.01557287, 1.774282, 1, 1, 1, 1, 1,
1.148462, 0.08565966, 2.345511, 1, 1, 1, 1, 1,
1.150343, 0.3155649, 1.789648, 1, 1, 1, 1, 1,
1.152906, -0.114465, 2.360016, 1, 1, 1, 1, 1,
1.155365, -0.7820988, 3.006433, 1, 1, 1, 1, 1,
1.159591, 0.6839423, 1.458793, 1, 1, 1, 1, 1,
1.162093, -1.579177, 2.118739, 1, 1, 1, 1, 1,
1.16349, -0.4923679, 2.45188, 1, 1, 1, 1, 1,
1.171039, 1.063252, 1.619292, 1, 1, 1, 1, 1,
1.172275, -0.4187165, 2.031501, 0, 0, 1, 1, 1,
1.181183, 0.3288666, 1.689558, 1, 0, 0, 1, 1,
1.189797, -0.1924207, 1.98491, 1, 0, 0, 1, 1,
1.190535, -0.1762691, 2.390139, 1, 0, 0, 1, 1,
1.193266, 0.6314803, 2.623222, 1, 0, 0, 1, 1,
1.195459, -2.592252, 2.692827, 1, 0, 0, 1, 1,
1.206646, 0.2082841, 0.5349886, 0, 0, 0, 1, 1,
1.21973, -0.01597006, 1.167427, 0, 0, 0, 1, 1,
1.220886, -0.8591496, 3.181388, 0, 0, 0, 1, 1,
1.222542, 0.1524065, 4.362852, 0, 0, 0, 1, 1,
1.235416, -0.1350892, -0.04641721, 0, 0, 0, 1, 1,
1.244565, 0.5852942, -0.1833631, 0, 0, 0, 1, 1,
1.24849, 1.406694, 0.9232166, 0, 0, 0, 1, 1,
1.249925, -1.084216, 1.892645, 1, 1, 1, 1, 1,
1.252965, 0.8020884, 1.092731, 1, 1, 1, 1, 1,
1.253247, 1.297658, 1.698318, 1, 1, 1, 1, 1,
1.263778, -1.075997, 1.016924, 1, 1, 1, 1, 1,
1.269274, -0.6084352, 2.506423, 1, 1, 1, 1, 1,
1.27681, 1.109605, -1.155697, 1, 1, 1, 1, 1,
1.278335, 0.2439013, 1.537153, 1, 1, 1, 1, 1,
1.281645, -2.233745, 2.529006, 1, 1, 1, 1, 1,
1.28685, 0.7603231, 1.732444, 1, 1, 1, 1, 1,
1.291321, 1.035573, 1.145457, 1, 1, 1, 1, 1,
1.297123, 0.9375867, -0.1026165, 1, 1, 1, 1, 1,
1.298022, -0.4470254, 0.4627158, 1, 1, 1, 1, 1,
1.313975, -1.030146, 0.9025119, 1, 1, 1, 1, 1,
1.331922, -1.097049, 0.7677202, 1, 1, 1, 1, 1,
1.34188, 1.47952, -0.7569417, 1, 1, 1, 1, 1,
1.351934, -1.208836, 2.360906, 0, 0, 1, 1, 1,
1.353562, 2.210221, -0.4779417, 1, 0, 0, 1, 1,
1.355579, 1.447639, 0.0673503, 1, 0, 0, 1, 1,
1.357449, -0.2797093, 0.1180543, 1, 0, 0, 1, 1,
1.363624, 0.6915197, 1.355775, 1, 0, 0, 1, 1,
1.367129, -0.06419531, 0.4497153, 1, 0, 0, 1, 1,
1.368159, -1.270347, 3.493046, 0, 0, 0, 1, 1,
1.371555, 1.060317, 1.055846, 0, 0, 0, 1, 1,
1.390723, 1.172941, -0.3239786, 0, 0, 0, 1, 1,
1.394153, -0.7909166, 0.3581917, 0, 0, 0, 1, 1,
1.401611, -1.306184, 2.872238, 0, 0, 0, 1, 1,
1.414855, -1.430567, 3.20729, 0, 0, 0, 1, 1,
1.422639, -1.845071, 2.550299, 0, 0, 0, 1, 1,
1.423868, -0.9719891, 1.372078, 1, 1, 1, 1, 1,
1.429823, 0.01063942, 0.2537984, 1, 1, 1, 1, 1,
1.433515, -0.5706699, 2.771556, 1, 1, 1, 1, 1,
1.433972, -0.110322, 2.829403, 1, 1, 1, 1, 1,
1.435454, 0.328442, 0.4438873, 1, 1, 1, 1, 1,
1.436594, 0.2446177, 1.515854, 1, 1, 1, 1, 1,
1.446079, -0.7304482, 1.474344, 1, 1, 1, 1, 1,
1.447371, 0.4461447, 1.946624, 1, 1, 1, 1, 1,
1.470316, 0.5878863, 1.905462, 1, 1, 1, 1, 1,
1.483448, -2.048161, 2.488752, 1, 1, 1, 1, 1,
1.483909, 0.4473611, -0.5048785, 1, 1, 1, 1, 1,
1.495794, -2.189767, 3.389628, 1, 1, 1, 1, 1,
1.49675, 1.221888, 0.06882579, 1, 1, 1, 1, 1,
1.501027, 1.460731, 0.7281681, 1, 1, 1, 1, 1,
1.507061, 1.438468, 1.542781, 1, 1, 1, 1, 1,
1.52842, -0.5952306, 0.9739248, 0, 0, 1, 1, 1,
1.530797, 0.07520144, 1.927338, 1, 0, 0, 1, 1,
1.552817, 0.7353328, 1.647419, 1, 0, 0, 1, 1,
1.555277, -0.3198462, 3.626743, 1, 0, 0, 1, 1,
1.556923, 0.09931768, 0.4058311, 1, 0, 0, 1, 1,
1.569738, -1.551426, 0.4539309, 1, 0, 0, 1, 1,
1.575781, 0.1581256, 1.252363, 0, 0, 0, 1, 1,
1.600862, -0.6291197, 0.7441075, 0, 0, 0, 1, 1,
1.614741, -1.10126, 2.115798, 0, 0, 0, 1, 1,
1.631414, 0.2242886, 2.427013, 0, 0, 0, 1, 1,
1.636346, -0.5954748, 0.6874353, 0, 0, 0, 1, 1,
1.653551, -0.2770004, -0.2012167, 0, 0, 0, 1, 1,
1.65718, 0.1375663, 0.7694085, 0, 0, 0, 1, 1,
1.663828, -1.742849, 2.140274, 1, 1, 1, 1, 1,
1.678608, -0.6936535, 1.902725, 1, 1, 1, 1, 1,
1.679739, 0.6622466, 1.725959, 1, 1, 1, 1, 1,
1.695729, -0.1951018, 0.3612985, 1, 1, 1, 1, 1,
1.69613, 0.8368672, 1.127193, 1, 1, 1, 1, 1,
1.698039, 0.5480753, 2.870184, 1, 1, 1, 1, 1,
1.701377, -0.5987605, 1.062574, 1, 1, 1, 1, 1,
1.718166, 1.234143, 0.845116, 1, 1, 1, 1, 1,
1.743526, 0.6868665, 2.328285, 1, 1, 1, 1, 1,
1.753887, -1.131231, 2.130228, 1, 1, 1, 1, 1,
1.758693, 0.7272146, -0.2003916, 1, 1, 1, 1, 1,
1.759534, 0.7045337, 1.721419, 1, 1, 1, 1, 1,
1.773992, -1.748251, 1.307144, 1, 1, 1, 1, 1,
1.822098, 0.1462463, 0.5779311, 1, 1, 1, 1, 1,
1.823218, -1.109099, 2.644661, 1, 1, 1, 1, 1,
1.823283, 2.056211, -0.3435108, 0, 0, 1, 1, 1,
1.826587, -0.8812544, 1.315793, 1, 0, 0, 1, 1,
1.831231, -0.6383709, 2.309324, 1, 0, 0, 1, 1,
1.843618, -1.843439, 1.115224, 1, 0, 0, 1, 1,
1.851197, -0.4932187, 2.497919, 1, 0, 0, 1, 1,
1.851243, 1.323072, -0.8880411, 1, 0, 0, 1, 1,
1.86067, 0.8275152, -0.1958957, 0, 0, 0, 1, 1,
1.881938, -1.76888, 3.792239, 0, 0, 0, 1, 1,
1.885251, -0.2732588, 2.64152, 0, 0, 0, 1, 1,
1.896344, -1.566632, 2.87259, 0, 0, 0, 1, 1,
1.917634, -0.6273224, 1.940125, 0, 0, 0, 1, 1,
1.927962, 0.1806879, 0.572992, 0, 0, 0, 1, 1,
1.930671, -2.519243, 4.480034, 0, 0, 0, 1, 1,
1.951453, 0.7226865, 0.9373855, 1, 1, 1, 1, 1,
1.965817, -0.5463427, 2.018061, 1, 1, 1, 1, 1,
1.975395, -1.230801, 4.488595, 1, 1, 1, 1, 1,
1.977912, -0.2050515, 2.224229, 1, 1, 1, 1, 1,
1.988427, 1.563511, 2.322159, 1, 1, 1, 1, 1,
1.990753, 1.141681, 1.943977, 1, 1, 1, 1, 1,
1.994282, 0.1499327, 0.6706415, 1, 1, 1, 1, 1,
2.005101, -1.728981, 2.704226, 1, 1, 1, 1, 1,
2.03007, 0.04335888, 2.031524, 1, 1, 1, 1, 1,
2.04142, -1.208254, 3.256637, 1, 1, 1, 1, 1,
2.04518, -2.481519, 1.080627, 1, 1, 1, 1, 1,
2.09183, -0.3493577, 1.293414, 1, 1, 1, 1, 1,
2.094449, -1.314042, 0.8104789, 1, 1, 1, 1, 1,
2.118931, 1.057998, 0.4572909, 1, 1, 1, 1, 1,
2.160064, 0.04567014, 0.4315149, 1, 1, 1, 1, 1,
2.188533, -0.30628, 0.3883302, 0, 0, 1, 1, 1,
2.194828, -0.8332283, 1.524418, 1, 0, 0, 1, 1,
2.299762, -2.49244, 2.377944, 1, 0, 0, 1, 1,
2.312872, -0.7510811, 1.68665, 1, 0, 0, 1, 1,
2.346063, -0.8842485, 0.9933738, 1, 0, 0, 1, 1,
2.355599, 0.1415406, 0.09863666, 1, 0, 0, 1, 1,
2.35774, 1.715327, 1.596728, 0, 0, 0, 1, 1,
2.39547, 0.4713289, 2.006073, 0, 0, 0, 1, 1,
2.42937, -0.2596256, 2.393757, 0, 0, 0, 1, 1,
2.480174, -0.114735, 0.2802407, 0, 0, 0, 1, 1,
2.48252, -1.030662, -0.4292894, 0, 0, 0, 1, 1,
2.511474, -0.9598894, 1.892004, 0, 0, 0, 1, 1,
2.520685, -0.6884243, 1.915514, 0, 0, 0, 1, 1,
2.602151, -0.2963115, 1.980662, 1, 1, 1, 1, 1,
2.623235, -0.5142455, 0.6834636, 1, 1, 1, 1, 1,
2.768496, -0.8471088, 2.640711, 1, 1, 1, 1, 1,
2.796264, 2.849165, -0.7079296, 1, 1, 1, 1, 1,
2.80294, -1.394014, 1.992634, 1, 1, 1, 1, 1,
2.821006, 0.3957875, 1.793865, 1, 1, 1, 1, 1,
2.868911, -0.1097215, 2.337206, 1, 1, 1, 1, 1
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
var radius = 9.338252;
var distance = 32.80021;
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
mvMatrix.translate( 0.2211103, 0.195889, -0.1390128 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80021);
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
