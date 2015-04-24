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
-3.256492, 0.8881133, -1.749875, 1, 0, 0, 1,
-3.099428, -0.5193759, -2.363553, 1, 0.007843138, 0, 1,
-2.803673, 1.107595, -2.362693, 1, 0.01176471, 0, 1,
-2.688435, 0.223045, -3.024983, 1, 0.01960784, 0, 1,
-2.615204, 0.7068431, -1.903795, 1, 0.02352941, 0, 1,
-2.548, 0.1711283, -0.6567956, 1, 0.03137255, 0, 1,
-2.473001, -0.02397569, -1.025759, 1, 0.03529412, 0, 1,
-2.434845, 1.757217, -1.149184, 1, 0.04313726, 0, 1,
-2.334291, -1.620448, -1.982091, 1, 0.04705882, 0, 1,
-2.298643, -0.356858, -1.873756, 1, 0.05490196, 0, 1,
-2.263365, 0.1170265, -0.3414671, 1, 0.05882353, 0, 1,
-2.233722, -0.5177546, -2.276583, 1, 0.06666667, 0, 1,
-2.214419, 0.07898615, -3.520937, 1, 0.07058824, 0, 1,
-2.162604, 0.4591006, -0.8349055, 1, 0.07843138, 0, 1,
-2.150771, 0.2543607, -1.543906, 1, 0.08235294, 0, 1,
-2.146262, 0.5028749, -1.411781, 1, 0.09019608, 0, 1,
-2.13659, 1.563102, -0.7186782, 1, 0.09411765, 0, 1,
-2.127821, 0.1024732, -2.926245, 1, 0.1019608, 0, 1,
-2.11026, -1.238046, -2.783967, 1, 0.1098039, 0, 1,
-2.106894, 0.6135908, -0.59019, 1, 0.1137255, 0, 1,
-2.100609, 0.03169798, -1.455822, 1, 0.1215686, 0, 1,
-2.092023, 0.190193, -2.859522, 1, 0.1254902, 0, 1,
-2.064984, -0.3297168, -1.634669, 1, 0.1333333, 0, 1,
-2.058367, 0.5364426, -0.219055, 1, 0.1372549, 0, 1,
-2.05383, -1.973141, -2.176657, 1, 0.145098, 0, 1,
-2.048767, 0.5451259, -0.2633467, 1, 0.1490196, 0, 1,
-2.025081, -0.3001396, -2.499527, 1, 0.1568628, 0, 1,
-1.997074, -2.44845, -3.651297, 1, 0.1607843, 0, 1,
-1.988304, -0.4784077, -0.1801173, 1, 0.1686275, 0, 1,
-1.980517, -2.260525, -3.522113, 1, 0.172549, 0, 1,
-1.961386, -0.1467925, 0.5583794, 1, 0.1803922, 0, 1,
-1.914866, 2.11357, -1.851754, 1, 0.1843137, 0, 1,
-1.909469, 0.009612986, -0.9540479, 1, 0.1921569, 0, 1,
-1.896686, -0.608549, -2.990082, 1, 0.1960784, 0, 1,
-1.891261, -3.113909, -2.756846, 1, 0.2039216, 0, 1,
-1.890444, 0.03860774, -0.4129083, 1, 0.2117647, 0, 1,
-1.862125, -1.169986, -1.924553, 1, 0.2156863, 0, 1,
-1.840463, -1.661066, -1.734599, 1, 0.2235294, 0, 1,
-1.839161, -0.6184962, -1.427151, 1, 0.227451, 0, 1,
-1.822818, -0.1708209, -2.041518, 1, 0.2352941, 0, 1,
-1.821304, 0.3030173, -2.082697, 1, 0.2392157, 0, 1,
-1.815027, 0.3951265, -2.555512, 1, 0.2470588, 0, 1,
-1.774803, 0.1278696, -2.89083, 1, 0.2509804, 0, 1,
-1.760856, 0.3975513, -2.934084, 1, 0.2588235, 0, 1,
-1.747897, 1.614208, -1.259471, 1, 0.2627451, 0, 1,
-1.712941, 0.9263375, -2.352092, 1, 0.2705882, 0, 1,
-1.710999, 0.7086984, 0.2149591, 1, 0.2745098, 0, 1,
-1.6812, 2.033316, -0.6460016, 1, 0.282353, 0, 1,
-1.666502, 1.127767, -0.2794439, 1, 0.2862745, 0, 1,
-1.6615, 1.568707, -1.415154, 1, 0.2941177, 0, 1,
-1.653974, -0.6873809, -1.258946, 1, 0.3019608, 0, 1,
-1.651098, 0.02565496, -1.242599, 1, 0.3058824, 0, 1,
-1.649753, 1.435603, -1.590907, 1, 0.3137255, 0, 1,
-1.643176, 0.9433625, -1.613995, 1, 0.3176471, 0, 1,
-1.628217, -0.09484425, -2.759571, 1, 0.3254902, 0, 1,
-1.622041, 0.4956822, -0.6614437, 1, 0.3294118, 0, 1,
-1.607224, 0.8853443, -0.7088213, 1, 0.3372549, 0, 1,
-1.606202, 1.14458, -1.987819, 1, 0.3411765, 0, 1,
-1.605372, -0.3761266, -0.8958062, 1, 0.3490196, 0, 1,
-1.584168, 0.3678719, -0.4746841, 1, 0.3529412, 0, 1,
-1.576634, 0.08119434, -2.141281, 1, 0.3607843, 0, 1,
-1.572794, -0.6368696, 0.02207352, 1, 0.3647059, 0, 1,
-1.550469, 0.2695509, -1.026473, 1, 0.372549, 0, 1,
-1.550062, 2.774709, -1.745847, 1, 0.3764706, 0, 1,
-1.549213, 0.1787717, -2.318111, 1, 0.3843137, 0, 1,
-1.544919, -0.6603988, -2.590576, 1, 0.3882353, 0, 1,
-1.526917, -0.1475634, -2.055605, 1, 0.3960784, 0, 1,
-1.52108, 2.234264, -0.8184817, 1, 0.4039216, 0, 1,
-1.515031, 0.06377712, -1.831509, 1, 0.4078431, 0, 1,
-1.509712, 0.4425891, 1.040549, 1, 0.4156863, 0, 1,
-1.499359, -0.6825784, -2.128693, 1, 0.4196078, 0, 1,
-1.493338, -0.2043077, -2.371614, 1, 0.427451, 0, 1,
-1.493047, -0.9841383, -3.77566, 1, 0.4313726, 0, 1,
-1.475476, 0.7752575, -0.4389728, 1, 0.4392157, 0, 1,
-1.474535, 0.4902282, 0.6025205, 1, 0.4431373, 0, 1,
-1.471877, 1.954584, 0.6314713, 1, 0.4509804, 0, 1,
-1.464458, 0.87971, -2.403345, 1, 0.454902, 0, 1,
-1.431975, -0.7014503, -0.2035978, 1, 0.4627451, 0, 1,
-1.427739, 0.5941514, -1.025338, 1, 0.4666667, 0, 1,
-1.426381, -0.4674769, -0.7364031, 1, 0.4745098, 0, 1,
-1.424587, -1.226334, -1.540707, 1, 0.4784314, 0, 1,
-1.424173, 0.0537648, -1.028036, 1, 0.4862745, 0, 1,
-1.418024, -0.08674148, 0.4205468, 1, 0.4901961, 0, 1,
-1.410522, 2.005584, 0.2836489, 1, 0.4980392, 0, 1,
-1.408218, 0.9945095, -0.872266, 1, 0.5058824, 0, 1,
-1.400771, -0.5459049, -2.952941, 1, 0.509804, 0, 1,
-1.391678, -2.068482, -1.653762, 1, 0.5176471, 0, 1,
-1.389572, 0.9059072, -0.9273381, 1, 0.5215687, 0, 1,
-1.38545, 0.7737831, -0.7764925, 1, 0.5294118, 0, 1,
-1.380458, -0.9696871, -0.1192001, 1, 0.5333334, 0, 1,
-1.37259, -0.1318094, -2.455189, 1, 0.5411765, 0, 1,
-1.366313, 1.772739, -0.4317135, 1, 0.5450981, 0, 1,
-1.362411, -0.4965978, -0.5272537, 1, 0.5529412, 0, 1,
-1.358791, -0.5091377, -2.337497, 1, 0.5568628, 0, 1,
-1.353733, -0.8551464, -2.240947, 1, 0.5647059, 0, 1,
-1.33407, 0.4497374, 0.5566038, 1, 0.5686275, 0, 1,
-1.331638, 1.361053, 0.5067165, 1, 0.5764706, 0, 1,
-1.331194, 1.835586, -0.6689629, 1, 0.5803922, 0, 1,
-1.328338, 0.9018243, -0.9876277, 1, 0.5882353, 0, 1,
-1.322836, -1.124978, -2.217209, 1, 0.5921569, 0, 1,
-1.319104, -1.801502, -5.4403, 1, 0.6, 0, 1,
-1.314316, 0.8208287, -1.320765, 1, 0.6078432, 0, 1,
-1.31126, 0.2210425, 0.6947786, 1, 0.6117647, 0, 1,
-1.301559, 0.5773005, -1.560758, 1, 0.6196079, 0, 1,
-1.285091, 0.6698632, -0.8891788, 1, 0.6235294, 0, 1,
-1.280904, -2.563326, -2.87222, 1, 0.6313726, 0, 1,
-1.274063, -0.09150779, 0.02123947, 1, 0.6352941, 0, 1,
-1.26978, 0.2091705, -1.291348, 1, 0.6431373, 0, 1,
-1.261966, -0.08302689, -2.421264, 1, 0.6470588, 0, 1,
-1.260916, -0.5984353, -1.530137, 1, 0.654902, 0, 1,
-1.257967, 0.1690223, -0.53082, 1, 0.6588235, 0, 1,
-1.251266, -2.832602, -1.776033, 1, 0.6666667, 0, 1,
-1.248966, -1.829648, -1.908005, 1, 0.6705883, 0, 1,
-1.243846, -0.4617251, -2.251212, 1, 0.6784314, 0, 1,
-1.242862, -0.1973316, -1.405713, 1, 0.682353, 0, 1,
-1.241397, -0.4528086, -2.605891, 1, 0.6901961, 0, 1,
-1.241095, -0.4696452, -0.7480386, 1, 0.6941177, 0, 1,
-1.238277, -0.02416745, -0.9173586, 1, 0.7019608, 0, 1,
-1.232316, 0.3785967, -1.938203, 1, 0.7098039, 0, 1,
-1.227068, 0.1769987, -0.4846312, 1, 0.7137255, 0, 1,
-1.22436, 1.409019, -1.761154, 1, 0.7215686, 0, 1,
-1.221243, 0.1320088, -0.7810453, 1, 0.7254902, 0, 1,
-1.219696, 1.441099, -0.4633764, 1, 0.7333333, 0, 1,
-1.218493, -0.1275749, 0.1236537, 1, 0.7372549, 0, 1,
-1.20823, -0.47584, -2.387383, 1, 0.7450981, 0, 1,
-1.197079, 1.12086, -1.612188, 1, 0.7490196, 0, 1,
-1.183394, 0.7474883, -1.446586, 1, 0.7568628, 0, 1,
-1.178106, -1.059291, -3.212031, 1, 0.7607843, 0, 1,
-1.176491, 0.8007971, -1.533509, 1, 0.7686275, 0, 1,
-1.162477, -0.5245897, -3.432874, 1, 0.772549, 0, 1,
-1.158317, 0.8079798, 0.3868977, 1, 0.7803922, 0, 1,
-1.155056, 0.202667, -1.065818, 1, 0.7843137, 0, 1,
-1.145177, 0.506846, -1.708277, 1, 0.7921569, 0, 1,
-1.141307, 0.5161722, -0.6073682, 1, 0.7960784, 0, 1,
-1.136951, 0.7094715, 0.2057026, 1, 0.8039216, 0, 1,
-1.134328, -0.8378466, -3.830557, 1, 0.8117647, 0, 1,
-1.133192, -0.1744717, -1.533258, 1, 0.8156863, 0, 1,
-1.128833, -0.5869964, -0.2256754, 1, 0.8235294, 0, 1,
-1.122504, 1.635221, -1.891154, 1, 0.827451, 0, 1,
-1.120807, 1.411522, -1.326004, 1, 0.8352941, 0, 1,
-1.118091, 0.4348244, 1.624215, 1, 0.8392157, 0, 1,
-1.113408, -0.4628501, -2.062183, 1, 0.8470588, 0, 1,
-1.11262, 1.280727, -1.01242, 1, 0.8509804, 0, 1,
-1.104443, 0.332666, -1.326829, 1, 0.8588235, 0, 1,
-1.101907, -0.8581537, -2.36562, 1, 0.8627451, 0, 1,
-1.096463, -0.6032574, -4.265332, 1, 0.8705882, 0, 1,
-1.096303, 0.7616052, -0.2775016, 1, 0.8745098, 0, 1,
-1.092567, 1.764121, -1.075495, 1, 0.8823529, 0, 1,
-1.089777, 0.6965077, -0.6179082, 1, 0.8862745, 0, 1,
-1.075892, 1.434372, -1.562313, 1, 0.8941177, 0, 1,
-1.073706, -2.146688, -2.810938, 1, 0.8980392, 0, 1,
-1.070722, 0.1602839, -0.7504111, 1, 0.9058824, 0, 1,
-1.069569, -0.6950368, -3.013928, 1, 0.9137255, 0, 1,
-1.061442, 0.5476456, -0.2827578, 1, 0.9176471, 0, 1,
-1.061277, -0.6016609, -1.341276, 1, 0.9254902, 0, 1,
-1.056721, 0.9075729, -2.348101, 1, 0.9294118, 0, 1,
-1.05443, 2.282951, 0.5060656, 1, 0.9372549, 0, 1,
-1.049956, -0.3989039, -3.524245, 1, 0.9411765, 0, 1,
-1.044243, -1.424986, -2.048374, 1, 0.9490196, 0, 1,
-1.038362, 0.3493372, 0.2112103, 1, 0.9529412, 0, 1,
-1.032908, -0.4666331, -2.853658, 1, 0.9607843, 0, 1,
-1.022138, -0.06067952, 0.3672065, 1, 0.9647059, 0, 1,
-1.007411, -0.8433802, -2.990379, 1, 0.972549, 0, 1,
-1.005493, -1.011917, -2.625619, 1, 0.9764706, 0, 1,
-0.9933966, -0.2824171, -2.215141, 1, 0.9843137, 0, 1,
-0.96012, -0.02077693, -3.20883, 1, 0.9882353, 0, 1,
-0.9583817, 0.7061735, -2.442768, 1, 0.9960784, 0, 1,
-0.9516918, -0.3459736, -1.829694, 0.9960784, 1, 0, 1,
-0.9451419, 1.031068, -0.4153554, 0.9921569, 1, 0, 1,
-0.9440979, 0.3636557, -0.4992195, 0.9843137, 1, 0, 1,
-0.9374856, -1.147161, -2.540613, 0.9803922, 1, 0, 1,
-0.9271793, -0.1771837, -0.9707033, 0.972549, 1, 0, 1,
-0.9254807, 0.9550848, -0.3553611, 0.9686275, 1, 0, 1,
-0.9246386, 0.1723637, -1.673981, 0.9607843, 1, 0, 1,
-0.9231301, -0.9851819, -2.403609, 0.9568627, 1, 0, 1,
-0.9183797, 0.34999, 0.1927774, 0.9490196, 1, 0, 1,
-0.9137852, -1.365501, -2.527468, 0.945098, 1, 0, 1,
-0.9099537, -1.102384, -3.61851, 0.9372549, 1, 0, 1,
-0.909523, -1.36479, -1.576258, 0.9333333, 1, 0, 1,
-0.9065296, 0.1434076, -1.454201, 0.9254902, 1, 0, 1,
-0.9064251, -0.4488246, -2.192194, 0.9215686, 1, 0, 1,
-0.896813, -0.2723507, -1.499156, 0.9137255, 1, 0, 1,
-0.8898304, -0.3596343, -3.157543, 0.9098039, 1, 0, 1,
-0.8852766, -1.472305, -3.562866, 0.9019608, 1, 0, 1,
-0.8845984, 0.4081056, -0.2441013, 0.8941177, 1, 0, 1,
-0.8818282, 0.1052469, -1.049096, 0.8901961, 1, 0, 1,
-0.8790151, -0.4205814, -2.392182, 0.8823529, 1, 0, 1,
-0.8694806, -1.153416, -2.290656, 0.8784314, 1, 0, 1,
-0.862999, 0.6516281, -0.8564851, 0.8705882, 1, 0, 1,
-0.8590459, 0.9166955, -0.5619719, 0.8666667, 1, 0, 1,
-0.8546085, -0.2739153, -2.687372, 0.8588235, 1, 0, 1,
-0.8520018, -0.548576, -3.308647, 0.854902, 1, 0, 1,
-0.8514863, -0.9753877, -1.615191, 0.8470588, 1, 0, 1,
-0.8508595, 0.5724863, -0.1825325, 0.8431373, 1, 0, 1,
-0.8482454, 1.351418, 0.2070456, 0.8352941, 1, 0, 1,
-0.8407243, -0.5785018, -5.685657, 0.8313726, 1, 0, 1,
-0.8404627, 0.9759282, 0.7164977, 0.8235294, 1, 0, 1,
-0.836928, 1.012803, -2.186417, 0.8196079, 1, 0, 1,
-0.8251558, -0.824441, -3.237423, 0.8117647, 1, 0, 1,
-0.8247207, -1.021701, -3.019867, 0.8078431, 1, 0, 1,
-0.8185496, -0.7318293, -3.154247, 0.8, 1, 0, 1,
-0.8150046, 0.02618344, -0.7337101, 0.7921569, 1, 0, 1,
-0.796282, -1.38925, -1.959433, 0.7882353, 1, 0, 1,
-0.7950917, 1.060784, -0.1052313, 0.7803922, 1, 0, 1,
-0.7878421, -0.5532554, -3.173224, 0.7764706, 1, 0, 1,
-0.7847826, 1.433626, -0.4619139, 0.7686275, 1, 0, 1,
-0.7833537, -0.2837311, -1.64523, 0.7647059, 1, 0, 1,
-0.7669451, -0.1514767, -0.4352498, 0.7568628, 1, 0, 1,
-0.7664764, -0.8751684, -1.806749, 0.7529412, 1, 0, 1,
-0.7574142, 0.924872, -1.006331, 0.7450981, 1, 0, 1,
-0.7559571, 1.513583, -1.427337, 0.7411765, 1, 0, 1,
-0.7526138, 0.7810331, -1.627883, 0.7333333, 1, 0, 1,
-0.7488086, -1.191245, -2.528609, 0.7294118, 1, 0, 1,
-0.7483521, -1.999311, -2.999225, 0.7215686, 1, 0, 1,
-0.747403, -1.668408, -2.049194, 0.7176471, 1, 0, 1,
-0.7451838, 0.6360067, -1.181266, 0.7098039, 1, 0, 1,
-0.742091, -0.895081, -2.467446, 0.7058824, 1, 0, 1,
-0.7365396, -0.3317568, -1.680872, 0.6980392, 1, 0, 1,
-0.7362596, -0.4197493, -2.372672, 0.6901961, 1, 0, 1,
-0.7359676, 0.1212731, -1.16812, 0.6862745, 1, 0, 1,
-0.7247221, -0.6541665, -3.058539, 0.6784314, 1, 0, 1,
-0.7229379, -0.2758941, -1.281676, 0.6745098, 1, 0, 1,
-0.718711, 0.6422305, 0.1406362, 0.6666667, 1, 0, 1,
-0.713618, 0.5810995, -3.053591, 0.6627451, 1, 0, 1,
-0.7070088, -1.311446, -1.595351, 0.654902, 1, 0, 1,
-0.7055117, 0.1098575, -1.556592, 0.6509804, 1, 0, 1,
-0.7038901, 1.64199, -0.1744215, 0.6431373, 1, 0, 1,
-0.7032724, -1.817767, -2.714575, 0.6392157, 1, 0, 1,
-0.6978275, -0.4683374, -0.5373531, 0.6313726, 1, 0, 1,
-0.6977916, 0.686533, 0.1704899, 0.627451, 1, 0, 1,
-0.6891597, -1.111559, -3.85038, 0.6196079, 1, 0, 1,
-0.6889401, 0.3861381, 0.01786458, 0.6156863, 1, 0, 1,
-0.6836931, 1.626751, -2.499502, 0.6078432, 1, 0, 1,
-0.6791508, 0.1388901, -1.783149, 0.6039216, 1, 0, 1,
-0.6768737, 0.4888414, 0.597605, 0.5960785, 1, 0, 1,
-0.6753294, -0.3954176, -1.68699, 0.5882353, 1, 0, 1,
-0.6714698, -1.676985, 0.21391, 0.5843138, 1, 0, 1,
-0.665739, 0.469814, -3.002677, 0.5764706, 1, 0, 1,
-0.6629134, 1.283654, -0.6450862, 0.572549, 1, 0, 1,
-0.657207, -1.17496, -2.306045, 0.5647059, 1, 0, 1,
-0.6570824, 0.8356596, -0.5197872, 0.5607843, 1, 0, 1,
-0.6544427, 1.358535, 0.7413653, 0.5529412, 1, 0, 1,
-0.6537061, 1.173218, -0.8431336, 0.5490196, 1, 0, 1,
-0.6524072, -0.5225257, -2.740781, 0.5411765, 1, 0, 1,
-0.6514489, 1.613584, 0.2481982, 0.5372549, 1, 0, 1,
-0.649041, -1.522026, -3.119041, 0.5294118, 1, 0, 1,
-0.6462649, 0.16338, -1.984666, 0.5254902, 1, 0, 1,
-0.6413453, -1.082739, -2.905958, 0.5176471, 1, 0, 1,
-0.6400275, -0.234204, -2.676054, 0.5137255, 1, 0, 1,
-0.6347352, -0.3819589, -0.7742709, 0.5058824, 1, 0, 1,
-0.6325535, 0.1977685, -0.8315635, 0.5019608, 1, 0, 1,
-0.6281284, -0.1796245, -3.347523, 0.4941176, 1, 0, 1,
-0.6235846, 1.232219, 0.852387, 0.4862745, 1, 0, 1,
-0.6121032, -1.168311, -4.422421, 0.4823529, 1, 0, 1,
-0.6087683, -0.3854772, -2.18732, 0.4745098, 1, 0, 1,
-0.6046449, -0.6277665, -4.370619, 0.4705882, 1, 0, 1,
-0.6042961, 0.1661468, -2.56891, 0.4627451, 1, 0, 1,
-0.6018971, -0.821482, -1.153437, 0.4588235, 1, 0, 1,
-0.5972173, -0.3121541, -1.773115, 0.4509804, 1, 0, 1,
-0.5971333, 1.025411, -0.6401247, 0.4470588, 1, 0, 1,
-0.5939326, 1.232439, -0.09036338, 0.4392157, 1, 0, 1,
-0.5920111, 0.8148942, -1.039278, 0.4352941, 1, 0, 1,
-0.5904259, -0.2554042, -3.145373, 0.427451, 1, 0, 1,
-0.5844875, 1.440639, -1.14712, 0.4235294, 1, 0, 1,
-0.5764345, -0.5904265, -1.953023, 0.4156863, 1, 0, 1,
-0.5753233, -0.8128941, -1.163004, 0.4117647, 1, 0, 1,
-0.5697853, -0.8212906, -2.202132, 0.4039216, 1, 0, 1,
-0.5679367, -0.887184, -1.967968, 0.3960784, 1, 0, 1,
-0.5643676, 0.3950652, -1.142391, 0.3921569, 1, 0, 1,
-0.5621654, 1.423794, -1.082638, 0.3843137, 1, 0, 1,
-0.5593432, 0.1025718, -1.835964, 0.3803922, 1, 0, 1,
-0.5579911, -0.8312225, -1.853185, 0.372549, 1, 0, 1,
-0.5574872, 0.01213727, -3.069858, 0.3686275, 1, 0, 1,
-0.5573852, 0.4171259, -0.1066033, 0.3607843, 1, 0, 1,
-0.5552669, 0.4739296, -1.76184, 0.3568628, 1, 0, 1,
-0.5526223, -1.166926, -2.554281, 0.3490196, 1, 0, 1,
-0.5494615, -0.2956766, -1.639145, 0.345098, 1, 0, 1,
-0.5474075, -0.05748976, -1.266046, 0.3372549, 1, 0, 1,
-0.5461497, 0.5736138, -0.1258171, 0.3333333, 1, 0, 1,
-0.5440494, 0.7944813, -1.172414, 0.3254902, 1, 0, 1,
-0.5425999, -0.3841721, -2.141569, 0.3215686, 1, 0, 1,
-0.5374677, 1.412686, -0.7483466, 0.3137255, 1, 0, 1,
-0.5362967, -0.0755194, -2.417565, 0.3098039, 1, 0, 1,
-0.5322059, 0.06124802, -1.64714, 0.3019608, 1, 0, 1,
-0.5248042, -0.4414323, -1.792747, 0.2941177, 1, 0, 1,
-0.5211881, 0.943884, -0.6368131, 0.2901961, 1, 0, 1,
-0.5208412, -1.642938, -1.667859, 0.282353, 1, 0, 1,
-0.5182903, -0.3831039, -2.515879, 0.2784314, 1, 0, 1,
-0.5181664, -0.6456436, -2.702398, 0.2705882, 1, 0, 1,
-0.5169862, -0.4039796, -1.916466, 0.2666667, 1, 0, 1,
-0.5139506, 0.8017977, 0.8608707, 0.2588235, 1, 0, 1,
-0.5120587, -0.3304108, -2.242588, 0.254902, 1, 0, 1,
-0.5086511, -0.690879, -2.255375, 0.2470588, 1, 0, 1,
-0.5038844, 0.7509597, -2.846879, 0.2431373, 1, 0, 1,
-0.5020765, -0.1128571, -0.3071713, 0.2352941, 1, 0, 1,
-0.4998617, -0.7014639, -1.885042, 0.2313726, 1, 0, 1,
-0.4928392, -0.7982385, -1.969167, 0.2235294, 1, 0, 1,
-0.4840036, 1.677981, -0.7713538, 0.2196078, 1, 0, 1,
-0.4837619, 0.5181792, -0.1050422, 0.2117647, 1, 0, 1,
-0.481261, -0.3163041, -2.92666, 0.2078431, 1, 0, 1,
-0.4799822, -0.6423889, -3.27105, 0.2, 1, 0, 1,
-0.4783235, 1.428655, -1.340025, 0.1921569, 1, 0, 1,
-0.4756168, -0.02128153, -0.09305964, 0.1882353, 1, 0, 1,
-0.4692617, 0.07867142, -0.3736997, 0.1803922, 1, 0, 1,
-0.4673325, 0.7253215, 0.2942151, 0.1764706, 1, 0, 1,
-0.4662859, -1.79385, -2.155728, 0.1686275, 1, 0, 1,
-0.4647632, -0.08853127, -2.171855, 0.1647059, 1, 0, 1,
-0.4595852, -0.325073, -2.621778, 0.1568628, 1, 0, 1,
-0.4493602, -0.1235291, -1.179042, 0.1529412, 1, 0, 1,
-0.4449328, -0.7086781, -2.541258, 0.145098, 1, 0, 1,
-0.4431308, 0.3496398, 0.4882415, 0.1411765, 1, 0, 1,
-0.4416329, -1.622731, -1.884616, 0.1333333, 1, 0, 1,
-0.4388501, 2.451018, 0.2675351, 0.1294118, 1, 0, 1,
-0.4380321, -0.6403352, -2.117958, 0.1215686, 1, 0, 1,
-0.4377563, 1.792552, -0.09488404, 0.1176471, 1, 0, 1,
-0.4283676, -0.5752227, -3.571936, 0.1098039, 1, 0, 1,
-0.4256448, 0.2658416, 0.8416454, 0.1058824, 1, 0, 1,
-0.4085556, -1.323394, -2.257823, 0.09803922, 1, 0, 1,
-0.4081788, 0.670575, 0.2339925, 0.09019608, 1, 0, 1,
-0.4020539, -0.4107714, -2.245777, 0.08627451, 1, 0, 1,
-0.3991604, -1.152684, -3.809923, 0.07843138, 1, 0, 1,
-0.3919044, 1.114911, 0.180053, 0.07450981, 1, 0, 1,
-0.3909661, -0.2179594, -0.1689811, 0.06666667, 1, 0, 1,
-0.3877108, 0.2268332, 0.01601366, 0.0627451, 1, 0, 1,
-0.3850007, -1.271603, -4.643666, 0.05490196, 1, 0, 1,
-0.3849396, -1.178245, -1.612099, 0.05098039, 1, 0, 1,
-0.3837855, -0.06904306, -2.996886, 0.04313726, 1, 0, 1,
-0.3798656, -0.2882262, -0.5914138, 0.03921569, 1, 0, 1,
-0.3759782, 0.1602855, -1.432592, 0.03137255, 1, 0, 1,
-0.3745557, 0.1408059, -0.006325261, 0.02745098, 1, 0, 1,
-0.372837, 0.2121455, -2.014264, 0.01960784, 1, 0, 1,
-0.3677101, -1.586293, -3.223744, 0.01568628, 1, 0, 1,
-0.3590395, -1.11455, -1.847747, 0.007843138, 1, 0, 1,
-0.3470232, 1.969565, 0.2954074, 0.003921569, 1, 0, 1,
-0.3443838, -2.054847, -3.571444, 0, 1, 0.003921569, 1,
-0.3420947, -0.7108652, -3.466513, 0, 1, 0.01176471, 1,
-0.3363248, -0.3130032, -2.426012, 0, 1, 0.01568628, 1,
-0.3307131, 0.7378209, 0.7278925, 0, 1, 0.02352941, 1,
-0.3302998, 0.5385873, 0.7483841, 0, 1, 0.02745098, 1,
-0.3294765, 0.03959388, -0.4369386, 0, 1, 0.03529412, 1,
-0.3294123, -1.480743, -2.751353, 0, 1, 0.03921569, 1,
-0.3211296, -1.384244, -3.360861, 0, 1, 0.04705882, 1,
-0.3179062, 0.4032844, -1.369202, 0, 1, 0.05098039, 1,
-0.3146193, -0.2519194, -1.696216, 0, 1, 0.05882353, 1,
-0.3102415, -0.1581519, -1.874027, 0, 1, 0.0627451, 1,
-0.3034623, 0.6191605, -1.534119, 0, 1, 0.07058824, 1,
-0.3013667, 0.5321171, 0.08846373, 0, 1, 0.07450981, 1,
-0.3013134, 0.1624772, -2.615339, 0, 1, 0.08235294, 1,
-0.2992384, -0.8506238, -2.522936, 0, 1, 0.08627451, 1,
-0.2986615, 0.29553, -2.714094, 0, 1, 0.09411765, 1,
-0.2967495, -0.05496567, -2.579735, 0, 1, 0.1019608, 1,
-0.2951913, 0.4042214, -0.02339315, 0, 1, 0.1058824, 1,
-0.2937134, 1.223877, -1.477011, 0, 1, 0.1137255, 1,
-0.2931687, -0.1464103, -2.504643, 0, 1, 0.1176471, 1,
-0.2930503, -0.5893804, -2.913746, 0, 1, 0.1254902, 1,
-0.2898774, 0.3981623, -1.27298, 0, 1, 0.1294118, 1,
-0.2894517, -0.3863612, -1.130069, 0, 1, 0.1372549, 1,
-0.2881438, 1.150075, -0.9340475, 0, 1, 0.1411765, 1,
-0.2859882, 1.191738, -0.1044191, 0, 1, 0.1490196, 1,
-0.2853785, 1.082786, 0.3427756, 0, 1, 0.1529412, 1,
-0.2797658, 0.7461569, 1.141092, 0, 1, 0.1607843, 1,
-0.2766144, -1.103578, -2.306947, 0, 1, 0.1647059, 1,
-0.2757291, 0.3709562, -1.095548, 0, 1, 0.172549, 1,
-0.2732755, -1.725502, -3.455971, 0, 1, 0.1764706, 1,
-0.2715482, 0.4712943, -0.922997, 0, 1, 0.1843137, 1,
-0.2696992, -0.01898684, -0.5002374, 0, 1, 0.1882353, 1,
-0.269192, 0.2198032, -2.499136, 0, 1, 0.1960784, 1,
-0.2686892, -0.5690982, -2.713952, 0, 1, 0.2039216, 1,
-0.263568, -0.3050004, -0.8734444, 0, 1, 0.2078431, 1,
-0.2591287, -0.353543, -0.81058, 0, 1, 0.2156863, 1,
-0.2584457, -0.1513864, -2.878247, 0, 1, 0.2196078, 1,
-0.2532312, 0.351366, -0.4016825, 0, 1, 0.227451, 1,
-0.2513112, 0.7119314, -1.403591, 0, 1, 0.2313726, 1,
-0.2469714, 0.3935473, -0.1025996, 0, 1, 0.2392157, 1,
-0.2440984, 0.488794, -2.25343, 0, 1, 0.2431373, 1,
-0.243698, 0.9966789, -0.2290228, 0, 1, 0.2509804, 1,
-0.241987, -1.458043, -3.254753, 0, 1, 0.254902, 1,
-0.2413834, 1.282309, -0.3498773, 0, 1, 0.2627451, 1,
-0.2368744, -0.4014482, -2.509999, 0, 1, 0.2666667, 1,
-0.2313343, -1.150791, -2.221928, 0, 1, 0.2745098, 1,
-0.2308453, 0.8133898, 2.275004, 0, 1, 0.2784314, 1,
-0.2307642, 0.2365143, -1.396835, 0, 1, 0.2862745, 1,
-0.227223, -0.1085427, -0.8756205, 0, 1, 0.2901961, 1,
-0.2240457, -0.294645, -3.417958, 0, 1, 0.2980392, 1,
-0.223143, -0.2124259, -1.874545, 0, 1, 0.3058824, 1,
-0.2210074, 0.7001568, 0.1694658, 0, 1, 0.3098039, 1,
-0.2205948, 0.1737326, 2.131058, 0, 1, 0.3176471, 1,
-0.2179106, -1.512961, -2.142153, 0, 1, 0.3215686, 1,
-0.2141729, 0.9867772, -0.0198639, 0, 1, 0.3294118, 1,
-0.2138152, 1.220041, 1.019069, 0, 1, 0.3333333, 1,
-0.2103477, 0.852565, 0.1049169, 0, 1, 0.3411765, 1,
-0.2082767, -0.6189365, -1.853034, 0, 1, 0.345098, 1,
-0.2082655, -0.9973363, -4.390792, 0, 1, 0.3529412, 1,
-0.20444, 1.812443, -1.564509, 0, 1, 0.3568628, 1,
-0.2040539, -1.115315, -4.4367, 0, 1, 0.3647059, 1,
-0.2000367, 0.2184647, 0.5443529, 0, 1, 0.3686275, 1,
-0.1939593, 0.6305248, -1.29225, 0, 1, 0.3764706, 1,
-0.1906085, -2.309808, -2.29932, 0, 1, 0.3803922, 1,
-0.1882867, -1.194049, -2.996257, 0, 1, 0.3882353, 1,
-0.1850167, 0.3932502, 0.1106253, 0, 1, 0.3921569, 1,
-0.1832356, 0.2214728, -1.844355, 0, 1, 0.4, 1,
-0.1829469, -0.2270572, -2.186014, 0, 1, 0.4078431, 1,
-0.1824661, 0.8048956, 0.1140998, 0, 1, 0.4117647, 1,
-0.1811073, 0.04476663, -1.55383, 0, 1, 0.4196078, 1,
-0.1803527, 0.6189626, 0.572516, 0, 1, 0.4235294, 1,
-0.1792327, 1.391026, 0.954327, 0, 1, 0.4313726, 1,
-0.1783572, 0.1305946, -1.891415, 0, 1, 0.4352941, 1,
-0.178252, 0.2822227, -0.645467, 0, 1, 0.4431373, 1,
-0.1775394, -1.852602, -3.295454, 0, 1, 0.4470588, 1,
-0.1750629, 0.9463639, -1.252494, 0, 1, 0.454902, 1,
-0.1745708, -0.6922221, -2.84345, 0, 1, 0.4588235, 1,
-0.1719458, -0.05386345, -1.280975, 0, 1, 0.4666667, 1,
-0.1697347, 1.195835, 1.218008, 0, 1, 0.4705882, 1,
-0.1670802, -1.853798, -3.054443, 0, 1, 0.4784314, 1,
-0.1666407, 1.588605, -2.308246, 0, 1, 0.4823529, 1,
-0.1662777, 0.2251256, 0.37814, 0, 1, 0.4901961, 1,
-0.1648834, -1.588493, -1.443066, 0, 1, 0.4941176, 1,
-0.163482, -0.04382719, -1.619543, 0, 1, 0.5019608, 1,
-0.160255, 0.6821187, 0.06847499, 0, 1, 0.509804, 1,
-0.1592712, -0.03057447, -3.216956, 0, 1, 0.5137255, 1,
-0.1551422, 0.4840488, -1.988751, 0, 1, 0.5215687, 1,
-0.1534919, 0.6785223, 2.445911, 0, 1, 0.5254902, 1,
-0.1489863, 0.5112773, -0.226381, 0, 1, 0.5333334, 1,
-0.1430675, -1.343834, -2.896768, 0, 1, 0.5372549, 1,
-0.1400706, -0.8260342, -2.481235, 0, 1, 0.5450981, 1,
-0.1336022, -1.013281, -4.042537, 0, 1, 0.5490196, 1,
-0.1301288, -0.4912457, -1.558728, 0, 1, 0.5568628, 1,
-0.1299106, -1.83277, -2.482941, 0, 1, 0.5607843, 1,
-0.1297589, 1.119351, -0.5546302, 0, 1, 0.5686275, 1,
-0.1285566, -0.4813548, -3.24297, 0, 1, 0.572549, 1,
-0.1260284, -0.8597561, -3.427746, 0, 1, 0.5803922, 1,
-0.1210629, 0.8054881, -0.6879571, 0, 1, 0.5843138, 1,
-0.1189146, -1.131306, -4.204289, 0, 1, 0.5921569, 1,
-0.1168111, 0.6771808, 0.1550753, 0, 1, 0.5960785, 1,
-0.106573, -0.7902327, -3.555321, 0, 1, 0.6039216, 1,
-0.1059253, -0.1202454, -2.259526, 0, 1, 0.6117647, 1,
-0.104476, -0.5634214, -3.411142, 0, 1, 0.6156863, 1,
-0.1019624, -0.4590048, -2.219166, 0, 1, 0.6235294, 1,
-0.09856305, 0.5021048, 1.227576, 0, 1, 0.627451, 1,
-0.09585956, -1.749662, -2.669716, 0, 1, 0.6352941, 1,
-0.0935685, -0.4981422, -3.881252, 0, 1, 0.6392157, 1,
-0.09123459, -0.4300396, -4.107638, 0, 1, 0.6470588, 1,
-0.08835104, -0.3969227, -4.103457, 0, 1, 0.6509804, 1,
-0.08795254, -0.2404094, -3.460849, 0, 1, 0.6588235, 1,
-0.08662261, 1.562607, 0.789865, 0, 1, 0.6627451, 1,
-0.07979698, -1.046759, -5.103772, 0, 1, 0.6705883, 1,
-0.07927255, 0.2383943, -0.8943835, 0, 1, 0.6745098, 1,
-0.07601719, 0.4195934, 1.288478, 0, 1, 0.682353, 1,
-0.0728912, 0.3843766, -0.9923775, 0, 1, 0.6862745, 1,
-0.07005968, 0.7889602, -0.3450613, 0, 1, 0.6941177, 1,
-0.06550701, 0.2764259, -1.031598, 0, 1, 0.7019608, 1,
-0.06459878, -1.831331, -2.972104, 0, 1, 0.7058824, 1,
-0.06394455, -0.4502235, -3.686872, 0, 1, 0.7137255, 1,
-0.06177476, -1.973793, -3.715677, 0, 1, 0.7176471, 1,
-0.06103311, 0.7754751, -0.4034682, 0, 1, 0.7254902, 1,
-0.05615575, -0.5311068, -3.39263, 0, 1, 0.7294118, 1,
-0.05602137, -0.8501948, -2.409458, 0, 1, 0.7372549, 1,
-0.05528234, -0.8129374, -3.053914, 0, 1, 0.7411765, 1,
-0.05426954, -2.046191, -2.923236, 0, 1, 0.7490196, 1,
-0.05125136, -0.6005635, -3.173557, 0, 1, 0.7529412, 1,
-0.04957356, 0.05111086, -1.868228, 0, 1, 0.7607843, 1,
-0.04710532, 0.01227643, -3.030484, 0, 1, 0.7647059, 1,
-0.04502787, 0.8143111, 0.2551904, 0, 1, 0.772549, 1,
-0.04447211, 1.455922, -0.7990004, 0, 1, 0.7764706, 1,
-0.0437467, 0.6456613, 0.08190062, 0, 1, 0.7843137, 1,
-0.03933162, 1.319908, -1.578867, 0, 1, 0.7882353, 1,
-0.03810435, 0.8820262, 0.8237072, 0, 1, 0.7960784, 1,
-0.03578246, 1.864027, -0.2482861, 0, 1, 0.8039216, 1,
-0.03440979, -0.308331, -3.291119, 0, 1, 0.8078431, 1,
-0.031562, -0.3966227, -2.149974, 0, 1, 0.8156863, 1,
-0.02407592, -1.017086, -2.723253, 0, 1, 0.8196079, 1,
-0.02183316, -0.873838, -2.637687, 0, 1, 0.827451, 1,
-0.0195046, 1.904389, 0.4521766, 0, 1, 0.8313726, 1,
-0.01948186, -0.07972843, -2.92847, 0, 1, 0.8392157, 1,
-0.01828693, 0.8278256, -0.6571867, 0, 1, 0.8431373, 1,
-0.01435696, -0.0815798, -1.59468, 0, 1, 0.8509804, 1,
-0.01169059, -0.4279559, -3.146655, 0, 1, 0.854902, 1,
-0.009834901, -1.423721, -3.79242, 0, 1, 0.8627451, 1,
-0.008077011, 1.26935, 1.779142, 0, 1, 0.8666667, 1,
-0.001126838, 0.9957055, -0.6809886, 0, 1, 0.8745098, 1,
-9.214402e-05, 0.4359623, 0.02173676, 0, 1, 0.8784314, 1,
0.004816001, 0.07800406, 0.7371816, 0, 1, 0.8862745, 1,
0.006735832, -0.4549064, 1.156417, 0, 1, 0.8901961, 1,
0.009558248, 1.878989, -0.6484688, 0, 1, 0.8980392, 1,
0.02604708, 1.373859, -1.908022, 0, 1, 0.9058824, 1,
0.0275823, 0.02909418, 0.7717187, 0, 1, 0.9098039, 1,
0.0296985, 0.4836659, 1.754083, 0, 1, 0.9176471, 1,
0.03034431, -1.580869, 2.837398, 0, 1, 0.9215686, 1,
0.03119723, -1.550328, 3.483929, 0, 1, 0.9294118, 1,
0.03518546, 0.05500737, 0.791417, 0, 1, 0.9333333, 1,
0.03702904, 0.9992216, -0.1294257, 0, 1, 0.9411765, 1,
0.03924169, 0.6453257, 0.191789, 0, 1, 0.945098, 1,
0.0426293, 0.02257986, 1.512478, 0, 1, 0.9529412, 1,
0.04822515, -0.0325186, 0.9544519, 0, 1, 0.9568627, 1,
0.05031567, 0.3850703, -0.8125747, 0, 1, 0.9647059, 1,
0.05218045, 0.8805879, 0.5963417, 0, 1, 0.9686275, 1,
0.05534714, 0.4667489, -0.205563, 0, 1, 0.9764706, 1,
0.05567541, -0.1881637, 1.899484, 0, 1, 0.9803922, 1,
0.05776875, -0.5857012, 1.845574, 0, 1, 0.9882353, 1,
0.05778681, 1.209847, -0.7641463, 0, 1, 0.9921569, 1,
0.05849445, -1.925831, 2.753017, 0, 1, 1, 1,
0.06131605, -0.770444, 2.906055, 0, 0.9921569, 1, 1,
0.06370365, 1.088733, 0.3995661, 0, 0.9882353, 1, 1,
0.06763892, -2.112577, 2.362437, 0, 0.9803922, 1, 1,
0.07092241, -0.877579, 2.676604, 0, 0.9764706, 1, 1,
0.07331932, 1.463268, -0.04266127, 0, 0.9686275, 1, 1,
0.07571717, 0.05250005, 1.093884, 0, 0.9647059, 1, 1,
0.0784561, 0.418156, -0.9007725, 0, 0.9568627, 1, 1,
0.08006328, -1.47816, 4.425241, 0, 0.9529412, 1, 1,
0.08058599, 1.536339, 1.877064, 0, 0.945098, 1, 1,
0.08087617, 0.4617968, 0.1997286, 0, 0.9411765, 1, 1,
0.08174365, 0.1786668, 0.7635255, 0, 0.9333333, 1, 1,
0.08334773, -2.048576, 2.92716, 0, 0.9294118, 1, 1,
0.08422207, -0.4053244, 2.579603, 0, 0.9215686, 1, 1,
0.08458894, 1.36615, 0.05433778, 0, 0.9176471, 1, 1,
0.08865343, -0.4869751, 3.964425, 0, 0.9098039, 1, 1,
0.0918887, -0.4087715, 2.758706, 0, 0.9058824, 1, 1,
0.09275491, -1.513156, 2.979753, 0, 0.8980392, 1, 1,
0.09346169, 0.2827522, 0.4670953, 0, 0.8901961, 1, 1,
0.0966839, -1.892612, 2.873363, 0, 0.8862745, 1, 1,
0.09779404, 0.9752951, -0.01599596, 0, 0.8784314, 1, 1,
0.09803285, -0.3592038, 1.278583, 0, 0.8745098, 1, 1,
0.1012192, 0.0311346, 1.510831, 0, 0.8666667, 1, 1,
0.1064742, 0.5487393, 1.233777, 0, 0.8627451, 1, 1,
0.1098604, -0.8654239, 4.906048, 0, 0.854902, 1, 1,
0.1100615, -0.952795, 1.63682, 0, 0.8509804, 1, 1,
0.11184, -1.227352, 1.927617, 0, 0.8431373, 1, 1,
0.1173502, 0.6846815, 1.703436, 0, 0.8392157, 1, 1,
0.1175484, -0.3513075, 2.333627, 0, 0.8313726, 1, 1,
0.1214363, -0.5372699, 2.427753, 0, 0.827451, 1, 1,
0.1220154, 0.6525198, 2.647411, 0, 0.8196079, 1, 1,
0.1224633, -0.1065873, 1.243315, 0, 0.8156863, 1, 1,
0.1234374, -0.3393233, 0.175536, 0, 0.8078431, 1, 1,
0.1258146, -2.102088, 3.048804, 0, 0.8039216, 1, 1,
0.1282453, -0.5792668, 3.072778, 0, 0.7960784, 1, 1,
0.1290431, -0.7628865, 3.962168, 0, 0.7882353, 1, 1,
0.1295892, 0.3727441, 0.3265524, 0, 0.7843137, 1, 1,
0.129648, -1.210637, 2.354755, 0, 0.7764706, 1, 1,
0.1388093, -0.4413897, 2.586624, 0, 0.772549, 1, 1,
0.1425262, -0.1406983, 2.366243, 0, 0.7647059, 1, 1,
0.1425381, 0.5017089, 0.218706, 0, 0.7607843, 1, 1,
0.1439904, 1.210286, -0.5618353, 0, 0.7529412, 1, 1,
0.1464164, 0.3696209, 0.1583716, 0, 0.7490196, 1, 1,
0.147119, -1.104425, 2.363337, 0, 0.7411765, 1, 1,
0.1472606, -0.2037902, 2.312184, 0, 0.7372549, 1, 1,
0.1477706, 0.9525676, 0.9766671, 0, 0.7294118, 1, 1,
0.1495318, -0.6837876, 0.8562734, 0, 0.7254902, 1, 1,
0.1558954, 0.4375145, 0.3229635, 0, 0.7176471, 1, 1,
0.1570006, -1.330342, 3.205723, 0, 0.7137255, 1, 1,
0.1607175, -0.2250462, 3.254215, 0, 0.7058824, 1, 1,
0.1619929, -0.2018104, 2.380981, 0, 0.6980392, 1, 1,
0.1669066, -1.987304, 3.23722, 0, 0.6941177, 1, 1,
0.1676246, -0.6885957, 1.714818, 0, 0.6862745, 1, 1,
0.1700178, 0.08985905, 3.076967, 0, 0.682353, 1, 1,
0.1707738, 0.2504347, 2.11763, 0, 0.6745098, 1, 1,
0.1708415, 0.7440335, 0.4319875, 0, 0.6705883, 1, 1,
0.1713088, -1.052723, 2.060896, 0, 0.6627451, 1, 1,
0.1719849, 1.446884, 0.4588712, 0, 0.6588235, 1, 1,
0.1764142, 0.2529892, 1.906052, 0, 0.6509804, 1, 1,
0.1788249, -0.2867128, 3.059139, 0, 0.6470588, 1, 1,
0.1806871, 1.412926, 0.9487628, 0, 0.6392157, 1, 1,
0.1813949, 0.06139817, 0.7973197, 0, 0.6352941, 1, 1,
0.181468, 3.073107, -1.35878, 0, 0.627451, 1, 1,
0.1815151, -0.6656472, 1.139868, 0, 0.6235294, 1, 1,
0.1831288, -0.1422638, 1.64935, 0, 0.6156863, 1, 1,
0.1832421, 1.880187, -0.5165235, 0, 0.6117647, 1, 1,
0.1834076, -0.8967301, 4.198815, 0, 0.6039216, 1, 1,
0.1842345, 0.3920453, 0.3550419, 0, 0.5960785, 1, 1,
0.1921186, 0.1839927, -1.046863, 0, 0.5921569, 1, 1,
0.1929683, -0.4608172, 2.618752, 0, 0.5843138, 1, 1,
0.1956251, 0.4778199, 1.030115, 0, 0.5803922, 1, 1,
0.2000898, 0.6812436, 0.6851564, 0, 0.572549, 1, 1,
0.203514, -1.171016, 2.183984, 0, 0.5686275, 1, 1,
0.20478, 0.6177381, 2.825112, 0, 0.5607843, 1, 1,
0.2054768, 0.1785021, 2.190264, 0, 0.5568628, 1, 1,
0.2079951, -0.2042146, 3.286966, 0, 0.5490196, 1, 1,
0.2081372, 0.04193377, -0.3421601, 0, 0.5450981, 1, 1,
0.2096427, 0.2785629, 0.0249127, 0, 0.5372549, 1, 1,
0.2151814, -0.6876286, 2.486542, 0, 0.5333334, 1, 1,
0.2166262, 1.23555, -0.7150384, 0, 0.5254902, 1, 1,
0.2205528, -0.2158788, 2.11367, 0, 0.5215687, 1, 1,
0.2247859, -0.6386977, 3.131855, 0, 0.5137255, 1, 1,
0.2275836, -1.235228, 3.555214, 0, 0.509804, 1, 1,
0.2278051, 0.3711775, -0.2357277, 0, 0.5019608, 1, 1,
0.2344553, 2.709896, 1.363458, 0, 0.4941176, 1, 1,
0.2346915, 0.7330472, 1.243482, 0, 0.4901961, 1, 1,
0.2375731, -0.05887669, 1.144282, 0, 0.4823529, 1, 1,
0.2407543, 0.3849115, 1.579373, 0, 0.4784314, 1, 1,
0.2423334, -2.503404, 2.608939, 0, 0.4705882, 1, 1,
0.243992, 0.6795379, 1.919581, 0, 0.4666667, 1, 1,
0.2441954, 0.1445056, 0.6726872, 0, 0.4588235, 1, 1,
0.2464778, 0.3579226, 0.5230811, 0, 0.454902, 1, 1,
0.2519721, -0.005728537, 1.055556, 0, 0.4470588, 1, 1,
0.2575173, 1.672058, 0.4383378, 0, 0.4431373, 1, 1,
0.2582499, 0.2252062, 1.444581, 0, 0.4352941, 1, 1,
0.2601087, 0.9054544, 0.8743342, 0, 0.4313726, 1, 1,
0.2626763, -1.945365, 1.816485, 0, 0.4235294, 1, 1,
0.2637225, -0.3531545, 1.738958, 0, 0.4196078, 1, 1,
0.2693487, 1.698712, 0.4420893, 0, 0.4117647, 1, 1,
0.2703287, -1.568545, 0.8812019, 0, 0.4078431, 1, 1,
0.2732417, 2.259921, -0.1517356, 0, 0.4, 1, 1,
0.2760492, 0.9557213, 0.6166992, 0, 0.3921569, 1, 1,
0.2799331, -0.8547752, 2.465978, 0, 0.3882353, 1, 1,
0.28005, -1.284106, 3.578118, 0, 0.3803922, 1, 1,
0.281161, -0.2413349, 1.430305, 0, 0.3764706, 1, 1,
0.2821751, 0.4875444, 0.6483253, 0, 0.3686275, 1, 1,
0.2856978, -0.2596637, 3.683337, 0, 0.3647059, 1, 1,
0.2886684, -0.3259439, 2.431127, 0, 0.3568628, 1, 1,
0.2905663, 0.01407155, 2.219881, 0, 0.3529412, 1, 1,
0.2928009, 1.767551, -1.485163, 0, 0.345098, 1, 1,
0.2943582, 0.1220013, 2.196268, 0, 0.3411765, 1, 1,
0.2950578, -0.4581857, 3.84095, 0, 0.3333333, 1, 1,
0.2955908, 0.7174088, 1.649545, 0, 0.3294118, 1, 1,
0.2958461, 1.315606, -1.596777, 0, 0.3215686, 1, 1,
0.2965279, -1.082102, 2.784645, 0, 0.3176471, 1, 1,
0.2988945, 0.8869185, 1.463695, 0, 0.3098039, 1, 1,
0.302269, 0.2696315, 0.4984582, 0, 0.3058824, 1, 1,
0.3051538, -0.3168396, 2.65051, 0, 0.2980392, 1, 1,
0.3060116, -0.02489533, -0.08706024, 0, 0.2901961, 1, 1,
0.3069814, -0.8935876, 3.655032, 0, 0.2862745, 1, 1,
0.3095933, -0.948924, 2.562237, 0, 0.2784314, 1, 1,
0.3122629, 0.7033078, -1.082135, 0, 0.2745098, 1, 1,
0.3125397, 1.691314, 1.358288, 0, 0.2666667, 1, 1,
0.3199707, -0.2171742, 2.467327, 0, 0.2627451, 1, 1,
0.3303453, 1.337541, 2.413025, 0, 0.254902, 1, 1,
0.3321999, 1.144284, 1.088715, 0, 0.2509804, 1, 1,
0.3413097, -0.9434599, 0.3019888, 0, 0.2431373, 1, 1,
0.3413925, 1.728606, 1.91804, 0, 0.2392157, 1, 1,
0.3425118, 1.211174, 0.3332017, 0, 0.2313726, 1, 1,
0.3457378, 1.287239, 1.161869, 0, 0.227451, 1, 1,
0.3459099, -0.8458409, 3.462273, 0, 0.2196078, 1, 1,
0.3480949, -0.4121207, 4.675383, 0, 0.2156863, 1, 1,
0.3519862, -0.7736914, 2.04055, 0, 0.2078431, 1, 1,
0.3522626, 0.810473, -0.189912, 0, 0.2039216, 1, 1,
0.353116, 0.2406855, -0.2009829, 0, 0.1960784, 1, 1,
0.3538813, 0.04757717, 1.508368, 0, 0.1882353, 1, 1,
0.3551802, 2.434739, -0.2169524, 0, 0.1843137, 1, 1,
0.3587185, -1.927041, 2.570795, 0, 0.1764706, 1, 1,
0.3588213, 1.000177, -0.5515091, 0, 0.172549, 1, 1,
0.3613376, -0.7109653, 2.204834, 0, 0.1647059, 1, 1,
0.362735, 0.7403021, 1.002282, 0, 0.1607843, 1, 1,
0.3630767, -0.01992031, 2.416062, 0, 0.1529412, 1, 1,
0.3650945, -0.3194848, 3.34839, 0, 0.1490196, 1, 1,
0.369052, 0.8528435, 1.768713, 0, 0.1411765, 1, 1,
0.3697218, 1.463523, 1.19229, 0, 0.1372549, 1, 1,
0.3773763, 0.3275113, 0.9056011, 0, 0.1294118, 1, 1,
0.3783119, 0.2197831, 0.9983122, 0, 0.1254902, 1, 1,
0.3823246, -0.8761636, 3.251964, 0, 0.1176471, 1, 1,
0.38293, -1.413052, 2.914768, 0, 0.1137255, 1, 1,
0.3829503, 0.3439091, 0.36682, 0, 0.1058824, 1, 1,
0.3854666, -0.2801329, 0.8157261, 0, 0.09803922, 1, 1,
0.3855862, 0.9289377, -0.1189916, 0, 0.09411765, 1, 1,
0.3957174, 1.199427, 1.78265, 0, 0.08627451, 1, 1,
0.3959277, 0.7012346, -0.9687008, 0, 0.08235294, 1, 1,
0.3965163, 1.65679, 1.58509, 0, 0.07450981, 1, 1,
0.4003286, -0.6571984, 2.411487, 0, 0.07058824, 1, 1,
0.4015833, -0.5182138, 1.481942, 0, 0.0627451, 1, 1,
0.4016147, 0.5423238, 1.101347, 0, 0.05882353, 1, 1,
0.404567, 1.389232, 0.1101368, 0, 0.05098039, 1, 1,
0.405438, -1.16786, 2.202542, 0, 0.04705882, 1, 1,
0.4088104, 2.926035, -0.1107711, 0, 0.03921569, 1, 1,
0.4096547, 0.01216428, 2.334716, 0, 0.03529412, 1, 1,
0.4151836, 0.6358086, 0.2348395, 0, 0.02745098, 1, 1,
0.4152048, -1.937009, 2.35313, 0, 0.02352941, 1, 1,
0.4177126, -1.993378, 5.146021, 0, 0.01568628, 1, 1,
0.4217693, -0.1154196, 1.957247, 0, 0.01176471, 1, 1,
0.4308748, 1.517331, 2.026842, 0, 0.003921569, 1, 1,
0.4321333, -1.304068, 3.029481, 0.003921569, 0, 1, 1,
0.4322611, 1.497478, 0.3585907, 0.007843138, 0, 1, 1,
0.4331146, -0.4478404, 2.054405, 0.01568628, 0, 1, 1,
0.4360632, 0.6865274, 1.500316, 0.01960784, 0, 1, 1,
0.437377, 0.9902874, -1.295321, 0.02745098, 0, 1, 1,
0.4407004, -0.4724317, 2.448314, 0.03137255, 0, 1, 1,
0.4422969, 2.990426, -0.4164884, 0.03921569, 0, 1, 1,
0.4445772, -0.9830196, 3.812827, 0.04313726, 0, 1, 1,
0.4498349, -0.844753, 2.160427, 0.05098039, 0, 1, 1,
0.4603903, -1.433323, 3.57774, 0.05490196, 0, 1, 1,
0.463791, 2.215362, -0.01876304, 0.0627451, 0, 1, 1,
0.4647454, -0.00586941, 1.080702, 0.06666667, 0, 1, 1,
0.4648275, -0.5564425, 4.586594, 0.07450981, 0, 1, 1,
0.4693328, 0.2996906, 2.707639, 0.07843138, 0, 1, 1,
0.4807119, -0.4001434, 2.302501, 0.08627451, 0, 1, 1,
0.4822846, -1.738843, 0.8390689, 0.09019608, 0, 1, 1,
0.4942292, 0.7416215, -1.443753, 0.09803922, 0, 1, 1,
0.4947142, 0.8045326, 0.03217563, 0.1058824, 0, 1, 1,
0.4958565, 2.145525, 1.908527, 0.1098039, 0, 1, 1,
0.4968935, -0.3547144, 2.1345, 0.1176471, 0, 1, 1,
0.4989685, -1.553031, 2.123102, 0.1215686, 0, 1, 1,
0.5013776, 0.06183074, 1.125959, 0.1294118, 0, 1, 1,
0.5024239, -1.100424, 0.7366628, 0.1333333, 0, 1, 1,
0.5028066, 0.2609023, 1.957994, 0.1411765, 0, 1, 1,
0.5042179, -0.9597056, 0.510743, 0.145098, 0, 1, 1,
0.5044925, -0.3755161, 1.665928, 0.1529412, 0, 1, 1,
0.5116504, -1.368556, 3.846329, 0.1568628, 0, 1, 1,
0.5127012, -0.7346445, 2.305397, 0.1647059, 0, 1, 1,
0.5203102, 0.2552544, 3.907958, 0.1686275, 0, 1, 1,
0.5225451, 1.635205, 0.6073314, 0.1764706, 0, 1, 1,
0.5258653, -0.3526182, 1.604255, 0.1803922, 0, 1, 1,
0.5264093, 0.547207, 0.3915423, 0.1882353, 0, 1, 1,
0.5283145, -0.9414268, 1.199768, 0.1921569, 0, 1, 1,
0.5291405, 0.89152, -0.3521791, 0.2, 0, 1, 1,
0.5300136, 0.03930343, -0.4838304, 0.2078431, 0, 1, 1,
0.530462, 0.7995306, -0.3948803, 0.2117647, 0, 1, 1,
0.5314066, -0.3953364, 3.508599, 0.2196078, 0, 1, 1,
0.5354557, -0.5179814, 2.447183, 0.2235294, 0, 1, 1,
0.537295, -1.539011, 1.828311, 0.2313726, 0, 1, 1,
0.5409393, 0.6403308, 0.457237, 0.2352941, 0, 1, 1,
0.54353, -1.311211, 4.12829, 0.2431373, 0, 1, 1,
0.5451051, -0.004692345, 0.1881021, 0.2470588, 0, 1, 1,
0.5471412, -0.9027688, 2.913141, 0.254902, 0, 1, 1,
0.550165, -0.6172981, 3.271149, 0.2588235, 0, 1, 1,
0.5503399, 0.1294747, 2.704495, 0.2666667, 0, 1, 1,
0.5551355, 0.6710699, 1.655489, 0.2705882, 0, 1, 1,
0.5570456, -1.688082, 3.494847, 0.2784314, 0, 1, 1,
0.5590137, -0.1425552, 1.437476, 0.282353, 0, 1, 1,
0.5597916, -3.571997, 3.265099, 0.2901961, 0, 1, 1,
0.5656347, 0.471597, 2.460531, 0.2941177, 0, 1, 1,
0.5683925, -0.1834899, 0.5374225, 0.3019608, 0, 1, 1,
0.5785868, -1.590694, 2.983397, 0.3098039, 0, 1, 1,
0.5846184, -0.07200525, 2.143047, 0.3137255, 0, 1, 1,
0.5950743, 0.6392702, 1.88696, 0.3215686, 0, 1, 1,
0.5955443, 0.3360166, 0.8248297, 0.3254902, 0, 1, 1,
0.5967726, 0.2334926, 1.126051, 0.3333333, 0, 1, 1,
0.6034899, -0.008782103, 1.675154, 0.3372549, 0, 1, 1,
0.6049039, 1.416112, 1.419078, 0.345098, 0, 1, 1,
0.6071805, 0.696595, 0.7076923, 0.3490196, 0, 1, 1,
0.6090755, -0.5302802, 2.481378, 0.3568628, 0, 1, 1,
0.6103919, -0.7902853, 1.628478, 0.3607843, 0, 1, 1,
0.6127746, -0.5476837, 2.070091, 0.3686275, 0, 1, 1,
0.6149296, 0.9826605, 0.07685519, 0.372549, 0, 1, 1,
0.6194906, 0.8688039, 0.2653661, 0.3803922, 0, 1, 1,
0.6236181, 1.181577, -0.3752981, 0.3843137, 0, 1, 1,
0.6258948, 0.6382864, -0.6073108, 0.3921569, 0, 1, 1,
0.6264191, 0.6595781, 1.700584, 0.3960784, 0, 1, 1,
0.6332023, 1.620829, 0.6883653, 0.4039216, 0, 1, 1,
0.635865, 0.5403158, 1.054232, 0.4117647, 0, 1, 1,
0.6465191, -1.039746, 4.677357, 0.4156863, 0, 1, 1,
0.6484664, 0.243353, 0.9890726, 0.4235294, 0, 1, 1,
0.6556395, -0.9803473, 2.975947, 0.427451, 0, 1, 1,
0.6595817, -0.6829134, 1.561916, 0.4352941, 0, 1, 1,
0.6620928, -1.521141, 0.9454293, 0.4392157, 0, 1, 1,
0.6633242, -0.221607, 2.184388, 0.4470588, 0, 1, 1,
0.6697187, -0.4477278, 3.224886, 0.4509804, 0, 1, 1,
0.6744787, -0.4386446, 2.042376, 0.4588235, 0, 1, 1,
0.6749809, 0.5693376, 1.38496, 0.4627451, 0, 1, 1,
0.6769257, 2.035855, -0.5100143, 0.4705882, 0, 1, 1,
0.6930895, -0.01396808, 3.033497, 0.4745098, 0, 1, 1,
0.6999548, 0.3493285, 0.7148176, 0.4823529, 0, 1, 1,
0.7001973, 1.008359, 2.075502, 0.4862745, 0, 1, 1,
0.7110881, -0.3629033, 0.3543147, 0.4941176, 0, 1, 1,
0.7119851, 0.8184058, -0.9010538, 0.5019608, 0, 1, 1,
0.7140413, 2.393975, 1.450747, 0.5058824, 0, 1, 1,
0.7248908, 3.534974, -0.2787786, 0.5137255, 0, 1, 1,
0.7299771, 0.302929, 1.351458, 0.5176471, 0, 1, 1,
0.7306791, -0.05849555, 1.151279, 0.5254902, 0, 1, 1,
0.7345142, 0.08512656, 1.669422, 0.5294118, 0, 1, 1,
0.7345236, 2.798807, 0.02962326, 0.5372549, 0, 1, 1,
0.7389191, 0.7454469, 0.9240311, 0.5411765, 0, 1, 1,
0.7410957, -0.4853244, 2.00662, 0.5490196, 0, 1, 1,
0.7425187, -1.57447, 3.356416, 0.5529412, 0, 1, 1,
0.7455168, 0.4815828, 0.1861956, 0.5607843, 0, 1, 1,
0.748434, 0.5963189, 0.506956, 0.5647059, 0, 1, 1,
0.7523246, -0.9055759, 1.849351, 0.572549, 0, 1, 1,
0.7656584, -1.35952, 2.351569, 0.5764706, 0, 1, 1,
0.7677616, -0.7239689, 2.214277, 0.5843138, 0, 1, 1,
0.7745931, -0.2497812, 1.871231, 0.5882353, 0, 1, 1,
0.7772931, -0.8540158, 1.481511, 0.5960785, 0, 1, 1,
0.7781548, 0.3401093, 0.9930065, 0.6039216, 0, 1, 1,
0.781288, 0.8356602, 0.6705929, 0.6078432, 0, 1, 1,
0.7830867, 0.2124514, 1.672677, 0.6156863, 0, 1, 1,
0.7912503, 0.03828251, 0.6249012, 0.6196079, 0, 1, 1,
0.7916678, -0.2672088, 2.095902, 0.627451, 0, 1, 1,
0.7950483, 0.5120196, 2.506063, 0.6313726, 0, 1, 1,
0.7951925, 0.6065795, 0.1613754, 0.6392157, 0, 1, 1,
0.7960644, -0.006072485, 1.739822, 0.6431373, 0, 1, 1,
0.7994446, -1.402946, 3.212682, 0.6509804, 0, 1, 1,
0.8003004, -0.4687745, 1.868213, 0.654902, 0, 1, 1,
0.8006917, 0.1044869, 3.369549, 0.6627451, 0, 1, 1,
0.8012831, -0.5197687, 1.74418, 0.6666667, 0, 1, 1,
0.803515, -0.3036247, 2.422177, 0.6745098, 0, 1, 1,
0.8040889, -1.710592, 1.01367, 0.6784314, 0, 1, 1,
0.8056954, -0.858994, 1.240587, 0.6862745, 0, 1, 1,
0.8126231, 0.6832178, 1.202875, 0.6901961, 0, 1, 1,
0.813477, 1.26746, 2.393484, 0.6980392, 0, 1, 1,
0.8150478, 1.766768, 1.311962, 0.7058824, 0, 1, 1,
0.8174593, 1.834369, 0.1572658, 0.7098039, 0, 1, 1,
0.8185359, -0.9902247, 3.144553, 0.7176471, 0, 1, 1,
0.8190713, 1.488639, 1.056962, 0.7215686, 0, 1, 1,
0.826793, -1.54059, 3.521798, 0.7294118, 0, 1, 1,
0.8336991, 0.5166284, 0.3740477, 0.7333333, 0, 1, 1,
0.8347732, -0.4825642, 1.110288, 0.7411765, 0, 1, 1,
0.8399525, -1.243577, 1.826364, 0.7450981, 0, 1, 1,
0.8401656, -0.3181123, 1.850001, 0.7529412, 0, 1, 1,
0.8441896, -0.195746, 1.221896, 0.7568628, 0, 1, 1,
0.8450285, -0.9715543, 2.34972, 0.7647059, 0, 1, 1,
0.8468771, -1.852029, 2.637475, 0.7686275, 0, 1, 1,
0.8501272, -0.3253148, 0.7117526, 0.7764706, 0, 1, 1,
0.8506358, -0.2076916, 3.527892, 0.7803922, 0, 1, 1,
0.8556688, -2.144365, 3.648999, 0.7882353, 0, 1, 1,
0.8566602, -0.7420491, 0.7142421, 0.7921569, 0, 1, 1,
0.8637484, -0.2379019, 2.81508, 0.8, 0, 1, 1,
0.8645405, 0.7749229, 0.7959085, 0.8078431, 0, 1, 1,
0.872399, -0.4239382, 2.285994, 0.8117647, 0, 1, 1,
0.8742843, -3.910598, 3.938008, 0.8196079, 0, 1, 1,
0.8834392, -1.496676, 1.705759, 0.8235294, 0, 1, 1,
0.8863729, -0.09600198, 0.6869507, 0.8313726, 0, 1, 1,
0.8929346, 0.5366988, 1.339913, 0.8352941, 0, 1, 1,
0.9017964, 1.166259, 0.9960905, 0.8431373, 0, 1, 1,
0.901887, 0.5760872, 0.6128481, 0.8470588, 0, 1, 1,
0.9041063, 0.3373288, 1.25121, 0.854902, 0, 1, 1,
0.9119173, -1.706897, 3.798799, 0.8588235, 0, 1, 1,
0.9150071, 0.5088631, 1.351549, 0.8666667, 0, 1, 1,
0.9159833, -0.6484071, 2.314223, 0.8705882, 0, 1, 1,
0.9174564, 0.1316614, 1.471113, 0.8784314, 0, 1, 1,
0.9179401, -1.297299, 2.046451, 0.8823529, 0, 1, 1,
0.9213562, -1.155674, 3.434545, 0.8901961, 0, 1, 1,
0.9230636, -0.997744, 2.618396, 0.8941177, 0, 1, 1,
0.9232178, -0.3438942, 3.659407, 0.9019608, 0, 1, 1,
0.9272791, 0.6902084, -1.009451, 0.9098039, 0, 1, 1,
0.9348201, -0.8100995, 1.63467, 0.9137255, 0, 1, 1,
0.9423565, 0.1834296, 1.693682, 0.9215686, 0, 1, 1,
0.9443976, 1.29758, 0.2910939, 0.9254902, 0, 1, 1,
0.9536739, 1.36395, 0.7177143, 0.9333333, 0, 1, 1,
0.953814, -0.455591, 1.13317, 0.9372549, 0, 1, 1,
0.9548789, -0.1706104, 1.020263, 0.945098, 0, 1, 1,
0.9596748, 0.2419579, 0.08654439, 0.9490196, 0, 1, 1,
0.964117, 0.4556397, 2.979563, 0.9568627, 0, 1, 1,
0.9696541, -1.068236, 2.533635, 0.9607843, 0, 1, 1,
0.9754796, 0.04942719, 2.64449, 0.9686275, 0, 1, 1,
0.9839971, 1.084378, 1.546525, 0.972549, 0, 1, 1,
0.9850989, -0.9955131, 0.952781, 0.9803922, 0, 1, 1,
0.985664, 1.15827, -0.702718, 0.9843137, 0, 1, 1,
0.9883074, 0.3124277, 1.351579, 0.9921569, 0, 1, 1,
0.9884877, -1.05846, 1.925671, 0.9960784, 0, 1, 1,
1.000728, -0.2753602, 1.808535, 1, 0, 0.9960784, 1,
1.005538, -1.304179, 2.238338, 1, 0, 0.9882353, 1,
1.00739, 0.6541694, 2.107769, 1, 0, 0.9843137, 1,
1.008685, -1.041999, 1.535063, 1, 0, 0.9764706, 1,
1.010596, 0.3296652, 2.898896, 1, 0, 0.972549, 1,
1.013739, 1.588644, -0.9423788, 1, 0, 0.9647059, 1,
1.013955, -1.653229, 1.771397, 1, 0, 0.9607843, 1,
1.014113, -0.2427751, 0.5013436, 1, 0, 0.9529412, 1,
1.025396, 0.9604791, 2.606869, 1, 0, 0.9490196, 1,
1.026303, 1.050787, 2.358988, 1, 0, 0.9411765, 1,
1.027375, 0.072145, 1.747689, 1, 0, 0.9372549, 1,
1.028652, -1.218851, 2.819344, 1, 0, 0.9294118, 1,
1.029182, -2.03924, 2.894149, 1, 0, 0.9254902, 1,
1.02994, 1.015304, 0.2692126, 1, 0, 0.9176471, 1,
1.03372, 0.3136664, 1.479825, 1, 0, 0.9137255, 1,
1.040141, -0.06957574, 0.2601705, 1, 0, 0.9058824, 1,
1.042368, 0.3857116, 1.164817, 1, 0, 0.9019608, 1,
1.043749, 1.328294, 2.38874, 1, 0, 0.8941177, 1,
1.04875, 1.120601, 0.9619147, 1, 0, 0.8862745, 1,
1.049696, -0.5066531, 1.646437, 1, 0, 0.8823529, 1,
1.053987, 0.7066283, 1.557984, 1, 0, 0.8745098, 1,
1.057238, -0.4817875, 1.906821, 1, 0, 0.8705882, 1,
1.057312, -1.191939, 3.208149, 1, 0, 0.8627451, 1,
1.075714, -0.8467751, 2.254716, 1, 0, 0.8588235, 1,
1.077695, 1.003127, -0.8645883, 1, 0, 0.8509804, 1,
1.079141, -0.892966, 3.398589, 1, 0, 0.8470588, 1,
1.080811, -1.259358, 2.123958, 1, 0, 0.8392157, 1,
1.083729, 0.3021317, 2.219378, 1, 0, 0.8352941, 1,
1.088141, -1.526609, 3.464981, 1, 0, 0.827451, 1,
1.090629, 0.05314129, 0.8131921, 1, 0, 0.8235294, 1,
1.09147, -0.1827835, 1.072557, 1, 0, 0.8156863, 1,
1.092135, -0.1277891, 1.252469, 1, 0, 0.8117647, 1,
1.097262, -0.0295994, 1.868572, 1, 0, 0.8039216, 1,
1.100548, 0.7328638, 0.8015499, 1, 0, 0.7960784, 1,
1.102342, -1.628524, 0.4497959, 1, 0, 0.7921569, 1,
1.104068, 0.7159473, 0.4016126, 1, 0, 0.7843137, 1,
1.106196, -0.5789674, 3.216056, 1, 0, 0.7803922, 1,
1.109198, 0.1295275, 2.915983, 1, 0, 0.772549, 1,
1.129995, 1.870132, 1.117694, 1, 0, 0.7686275, 1,
1.139032, -0.6091931, 0.7513673, 1, 0, 0.7607843, 1,
1.149808, 0.9730473, 1.277968, 1, 0, 0.7568628, 1,
1.149868, 3.143786, 3.050885, 1, 0, 0.7490196, 1,
1.16948, 0.5812014, 0.2741049, 1, 0, 0.7450981, 1,
1.169892, -0.07040867, 0.9120461, 1, 0, 0.7372549, 1,
1.18985, -0.497771, 0.9848592, 1, 0, 0.7333333, 1,
1.200213, -0.08426199, 1.892032, 1, 0, 0.7254902, 1,
1.208052, -0.2192653, 1.724917, 1, 0, 0.7215686, 1,
1.208213, 1.333, 1.450424, 1, 0, 0.7137255, 1,
1.211839, -0.1325184, 1.808342, 1, 0, 0.7098039, 1,
1.219657, -0.7695008, 2.115481, 1, 0, 0.7019608, 1,
1.225662, 0.1002868, 1.454607, 1, 0, 0.6941177, 1,
1.230909, 0.4044404, 1.912592, 1, 0, 0.6901961, 1,
1.242281, 0.4079626, 1.307088, 1, 0, 0.682353, 1,
1.270524, 0.46276, 1.581438, 1, 0, 0.6784314, 1,
1.270903, 0.8597149, 1.227104, 1, 0, 0.6705883, 1,
1.279758, 0.7725679, 0.2311751, 1, 0, 0.6666667, 1,
1.29067, 0.3051162, -0.3741778, 1, 0, 0.6588235, 1,
1.294253, -0.7681563, 1.312487, 1, 0, 0.654902, 1,
1.308599, 0.8014777, 0.6579578, 1, 0, 0.6470588, 1,
1.312183, 0.7889026, -0.06378348, 1, 0, 0.6431373, 1,
1.322591, -0.02294226, 0.5380176, 1, 0, 0.6352941, 1,
1.332836, -0.183822, 3.07326, 1, 0, 0.6313726, 1,
1.345767, -0.3169529, 2.427589, 1, 0, 0.6235294, 1,
1.347059, -0.7830031, 2.63671, 1, 0, 0.6196079, 1,
1.351073, -0.3537748, 1.830512, 1, 0, 0.6117647, 1,
1.356566, 0.6748725, 2.201319, 1, 0, 0.6078432, 1,
1.357379, 1.50296, -0.2253068, 1, 0, 0.6, 1,
1.362299, -0.3305016, 1.907663, 1, 0, 0.5921569, 1,
1.368983, 0.8888637, 0.9675092, 1, 0, 0.5882353, 1,
1.388768, 0.2821943, 0.8498449, 1, 0, 0.5803922, 1,
1.389008, -0.1633202, 2.114934, 1, 0, 0.5764706, 1,
1.402219, 0.7978757, 1.833401, 1, 0, 0.5686275, 1,
1.412304, -0.2213613, 2.631482, 1, 0, 0.5647059, 1,
1.414917, 0.6029243, 0.4413496, 1, 0, 0.5568628, 1,
1.420809, 1.403866, 1.433779, 1, 0, 0.5529412, 1,
1.423213, -1.302155, 0.2928671, 1, 0, 0.5450981, 1,
1.427715, 0.5304416, -0.0968423, 1, 0, 0.5411765, 1,
1.439235, 1.270042, 2.072578, 1, 0, 0.5333334, 1,
1.442207, 1.016565, 0.7359379, 1, 0, 0.5294118, 1,
1.445346, 0.4120272, 1.354395, 1, 0, 0.5215687, 1,
1.454006, 0.3376269, 2.377583, 1, 0, 0.5176471, 1,
1.460047, -1.255604, 2.247296, 1, 0, 0.509804, 1,
1.473261, 0.2207206, 2.050992, 1, 0, 0.5058824, 1,
1.485477, -0.1058319, 0.6678042, 1, 0, 0.4980392, 1,
1.493525, -0.8541661, 2.200356, 1, 0, 0.4901961, 1,
1.506128, -2.039186, 1.744429, 1, 0, 0.4862745, 1,
1.513476, -1.221705, 2.059197, 1, 0, 0.4784314, 1,
1.515455, 0.2998717, 1.025307, 1, 0, 0.4745098, 1,
1.520269, -0.3905511, 0.1055306, 1, 0, 0.4666667, 1,
1.521022, 0.7760115, 1.237041, 1, 0, 0.4627451, 1,
1.529548, 0.7303058, 2.741261, 1, 0, 0.454902, 1,
1.532448, 1.206805, -0.004469234, 1, 0, 0.4509804, 1,
1.53302, -2.962198, 2.801394, 1, 0, 0.4431373, 1,
1.538067, 0.9494017, 2.0197, 1, 0, 0.4392157, 1,
1.538217, -0.6108128, 1.290536, 1, 0, 0.4313726, 1,
1.546228, -0.6626388, 2.427034, 1, 0, 0.427451, 1,
1.564729, -0.7321988, 0.3611652, 1, 0, 0.4196078, 1,
1.568067, -0.7400051, 4.001362, 1, 0, 0.4156863, 1,
1.576962, 0.1733863, 1.468236, 1, 0, 0.4078431, 1,
1.591034, 1.322116, 0.5956697, 1, 0, 0.4039216, 1,
1.60165, 1.401379, 0.596767, 1, 0, 0.3960784, 1,
1.601763, -0.6661406, 2.797731, 1, 0, 0.3882353, 1,
1.602319, -0.05328134, 1.06598, 1, 0, 0.3843137, 1,
1.619301, -0.09557885, 3.457416, 1, 0, 0.3764706, 1,
1.629695, 1.211338, 4.244938, 1, 0, 0.372549, 1,
1.631823, 0.8007819, 2.681087, 1, 0, 0.3647059, 1,
1.648045, 0.6634934, 4.133474, 1, 0, 0.3607843, 1,
1.661242, 0.07519203, 2.241162, 1, 0, 0.3529412, 1,
1.663803, -0.5648579, 1.848596, 1, 0, 0.3490196, 1,
1.664813, -1.622159, 3.112606, 1, 0, 0.3411765, 1,
1.665533, -0.5155917, 2.745466, 1, 0, 0.3372549, 1,
1.684132, 0.4353959, 2.182813, 1, 0, 0.3294118, 1,
1.685595, 0.4993735, 1.486826, 1, 0, 0.3254902, 1,
1.688438, 0.8458921, 1.124555, 1, 0, 0.3176471, 1,
1.695537, 0.7378176, 2.920096, 1, 0, 0.3137255, 1,
1.714702, 0.1794877, 0.9331903, 1, 0, 0.3058824, 1,
1.718364, 1.47854, -0.08484174, 1, 0, 0.2980392, 1,
1.733009, -0.6275982, 0.176106, 1, 0, 0.2941177, 1,
1.746337, 0.3594117, 1.210562, 1, 0, 0.2862745, 1,
1.751523, -1.066846, 2.949903, 1, 0, 0.282353, 1,
1.757295, 0.2871795, 0.4706487, 1, 0, 0.2745098, 1,
1.763655, -2.562871, 1.245963, 1, 0, 0.2705882, 1,
1.775298, 0.5006865, 1.415561, 1, 0, 0.2627451, 1,
1.784399, 0.414099, 1.687444, 1, 0, 0.2588235, 1,
1.784875, -0.7590809, 2.244937, 1, 0, 0.2509804, 1,
1.818572, 0.4717338, 0.1854836, 1, 0, 0.2470588, 1,
1.821475, 0.7729488, 0.3490012, 1, 0, 0.2392157, 1,
1.839477, -0.9478651, 3.046136, 1, 0, 0.2352941, 1,
1.843169, 0.9543973, 2.296496, 1, 0, 0.227451, 1,
1.843723, -1.216644, 4.187109, 1, 0, 0.2235294, 1,
1.845565, -1.172728, 0.681526, 1, 0, 0.2156863, 1,
1.867295, -0.09332102, 1.151722, 1, 0, 0.2117647, 1,
1.86783, -1.247432, 4.952883, 1, 0, 0.2039216, 1,
1.874474, -1.34509, 1.959409, 1, 0, 0.1960784, 1,
1.90532, 0.2683089, 1.926057, 1, 0, 0.1921569, 1,
1.929046, -0.4269112, 2.457862, 1, 0, 0.1843137, 1,
1.937086, -1.322156, 3.359362, 1, 0, 0.1803922, 1,
1.954557, -0.6850175, 2.053053, 1, 0, 0.172549, 1,
1.984819, -1.415372, 2.18076, 1, 0, 0.1686275, 1,
2.025313, 0.4863112, 0.09735257, 1, 0, 0.1607843, 1,
2.03862, 0.3647037, 1.146164, 1, 0, 0.1568628, 1,
2.047246, -1.014349, 0.5284309, 1, 0, 0.1490196, 1,
2.055518, 1.205971, 0.3576423, 1, 0, 0.145098, 1,
2.059131, -0.7667214, 1.629696, 1, 0, 0.1372549, 1,
2.083182, -0.06728391, 0.3095008, 1, 0, 0.1333333, 1,
2.088316, 0.4070404, 2.504672, 1, 0, 0.1254902, 1,
2.090962, -0.6211756, 3.52816, 1, 0, 0.1215686, 1,
2.101114, 1.358505, 2.712029, 1, 0, 0.1137255, 1,
2.123711, -0.2318089, 1.590103, 1, 0, 0.1098039, 1,
2.136569, 0.6395252, 2.03995, 1, 0, 0.1019608, 1,
2.145113, -0.3937072, 1.429477, 1, 0, 0.09411765, 1,
2.173827, -0.472994, 1.486831, 1, 0, 0.09019608, 1,
2.188247, 0.6429378, 2.820375, 1, 0, 0.08235294, 1,
2.205498, -0.1329856, 2.901277, 1, 0, 0.07843138, 1,
2.209081, 1.726018, 2.472646, 1, 0, 0.07058824, 1,
2.242982, -2.094246, 1.178908, 1, 0, 0.06666667, 1,
2.332607, -1.448086, 2.333451, 1, 0, 0.05882353, 1,
2.373629, -0.9062991, 1.257137, 1, 0, 0.05490196, 1,
2.441519, -1.021579, 1.373133, 1, 0, 0.04705882, 1,
2.474746, -0.1443539, 2.96403, 1, 0, 0.04313726, 1,
2.535704, 0.2761733, 2.623929, 1, 0, 0.03529412, 1,
2.541081, -0.1053786, 2.406238, 1, 0, 0.03137255, 1,
2.565926, -0.4967835, 3.251163, 1, 0, 0.02352941, 1,
2.584141, 0.8996986, 1.023885, 1, 0, 0.01960784, 1,
2.590433, -0.6853219, 1.887614, 1, 0, 0.01176471, 1,
2.610476, 1.679788, 0.109463, 1, 0, 0.007843138, 1
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
-0.3230079, -5.172622, -7.521626, 0, -0.5, 0.5, 0.5,
-0.3230079, -5.172622, -7.521626, 1, -0.5, 0.5, 0.5,
-0.3230079, -5.172622, -7.521626, 1, 1.5, 0.5, 0.5,
-0.3230079, -5.172622, -7.521626, 0, 1.5, 0.5, 0.5
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
-4.250943, -0.1878117, -7.521626, 0, -0.5, 0.5, 0.5,
-4.250943, -0.1878117, -7.521626, 1, -0.5, 0.5, 0.5,
-4.250943, -0.1878117, -7.521626, 1, 1.5, 0.5, 0.5,
-4.250943, -0.1878117, -7.521626, 0, 1.5, 0.5, 0.5
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
-4.250943, -5.172622, -0.2698178, 0, -0.5, 0.5, 0.5,
-4.250943, -5.172622, -0.2698178, 1, -0.5, 0.5, 0.5,
-4.250943, -5.172622, -0.2698178, 1, 1.5, 0.5, 0.5,
-4.250943, -5.172622, -0.2698178, 0, 1.5, 0.5, 0.5
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
-3, -4.022281, -5.848132,
2, -4.022281, -5.848132,
-3, -4.022281, -5.848132,
-3, -4.214005, -6.127048,
-2, -4.022281, -5.848132,
-2, -4.214005, -6.127048,
-1, -4.022281, -5.848132,
-1, -4.214005, -6.127048,
0, -4.022281, -5.848132,
0, -4.214005, -6.127048,
1, -4.022281, -5.848132,
1, -4.214005, -6.127048,
2, -4.022281, -5.848132,
2, -4.214005, -6.127048
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
-3, -4.597452, -6.684879, 0, -0.5, 0.5, 0.5,
-3, -4.597452, -6.684879, 1, -0.5, 0.5, 0.5,
-3, -4.597452, -6.684879, 1, 1.5, 0.5, 0.5,
-3, -4.597452, -6.684879, 0, 1.5, 0.5, 0.5,
-2, -4.597452, -6.684879, 0, -0.5, 0.5, 0.5,
-2, -4.597452, -6.684879, 1, -0.5, 0.5, 0.5,
-2, -4.597452, -6.684879, 1, 1.5, 0.5, 0.5,
-2, -4.597452, -6.684879, 0, 1.5, 0.5, 0.5,
-1, -4.597452, -6.684879, 0, -0.5, 0.5, 0.5,
-1, -4.597452, -6.684879, 1, -0.5, 0.5, 0.5,
-1, -4.597452, -6.684879, 1, 1.5, 0.5, 0.5,
-1, -4.597452, -6.684879, 0, 1.5, 0.5, 0.5,
0, -4.597452, -6.684879, 0, -0.5, 0.5, 0.5,
0, -4.597452, -6.684879, 1, -0.5, 0.5, 0.5,
0, -4.597452, -6.684879, 1, 1.5, 0.5, 0.5,
0, -4.597452, -6.684879, 0, 1.5, 0.5, 0.5,
1, -4.597452, -6.684879, 0, -0.5, 0.5, 0.5,
1, -4.597452, -6.684879, 1, -0.5, 0.5, 0.5,
1, -4.597452, -6.684879, 1, 1.5, 0.5, 0.5,
1, -4.597452, -6.684879, 0, 1.5, 0.5, 0.5,
2, -4.597452, -6.684879, 0, -0.5, 0.5, 0.5,
2, -4.597452, -6.684879, 1, -0.5, 0.5, 0.5,
2, -4.597452, -6.684879, 1, 1.5, 0.5, 0.5,
2, -4.597452, -6.684879, 0, 1.5, 0.5, 0.5
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
-3.344497, -2, -5.848132,
-3.344497, 2, -5.848132,
-3.344497, -2, -5.848132,
-3.495571, -2, -6.127048,
-3.344497, 0, -5.848132,
-3.495571, 0, -6.127048,
-3.344497, 2, -5.848132,
-3.495571, 2, -6.127048
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
-3.79772, -2, -6.684879, 0, -0.5, 0.5, 0.5,
-3.79772, -2, -6.684879, 1, -0.5, 0.5, 0.5,
-3.79772, -2, -6.684879, 1, 1.5, 0.5, 0.5,
-3.79772, -2, -6.684879, 0, 1.5, 0.5, 0.5,
-3.79772, 0, -6.684879, 0, -0.5, 0.5, 0.5,
-3.79772, 0, -6.684879, 1, -0.5, 0.5, 0.5,
-3.79772, 0, -6.684879, 1, 1.5, 0.5, 0.5,
-3.79772, 0, -6.684879, 0, 1.5, 0.5, 0.5,
-3.79772, 2, -6.684879, 0, -0.5, 0.5, 0.5,
-3.79772, 2, -6.684879, 1, -0.5, 0.5, 0.5,
-3.79772, 2, -6.684879, 1, 1.5, 0.5, 0.5,
-3.79772, 2, -6.684879, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.344497, -4.022281, -4,
-3.344497, -4.022281, 4,
-3.344497, -4.022281, -4,
-3.495571, -4.214005, -4,
-3.344497, -4.022281, -2,
-3.495571, -4.214005, -2,
-3.344497, -4.022281, 0,
-3.495571, -4.214005, 0,
-3.344497, -4.022281, 2,
-3.495571, -4.214005, 2,
-3.344497, -4.022281, 4,
-3.495571, -4.214005, 4
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
-3.79772, -4.597452, -4, 0, -0.5, 0.5, 0.5,
-3.79772, -4.597452, -4, 1, -0.5, 0.5, 0.5,
-3.79772, -4.597452, -4, 1, 1.5, 0.5, 0.5,
-3.79772, -4.597452, -4, 0, 1.5, 0.5, 0.5,
-3.79772, -4.597452, -2, 0, -0.5, 0.5, 0.5,
-3.79772, -4.597452, -2, 1, -0.5, 0.5, 0.5,
-3.79772, -4.597452, -2, 1, 1.5, 0.5, 0.5,
-3.79772, -4.597452, -2, 0, 1.5, 0.5, 0.5,
-3.79772, -4.597452, 0, 0, -0.5, 0.5, 0.5,
-3.79772, -4.597452, 0, 1, -0.5, 0.5, 0.5,
-3.79772, -4.597452, 0, 1, 1.5, 0.5, 0.5,
-3.79772, -4.597452, 0, 0, 1.5, 0.5, 0.5,
-3.79772, -4.597452, 2, 0, -0.5, 0.5, 0.5,
-3.79772, -4.597452, 2, 1, -0.5, 0.5, 0.5,
-3.79772, -4.597452, 2, 1, 1.5, 0.5, 0.5,
-3.79772, -4.597452, 2, 0, 1.5, 0.5, 0.5,
-3.79772, -4.597452, 4, 0, -0.5, 0.5, 0.5,
-3.79772, -4.597452, 4, 1, -0.5, 0.5, 0.5,
-3.79772, -4.597452, 4, 1, 1.5, 0.5, 0.5,
-3.79772, -4.597452, 4, 0, 1.5, 0.5, 0.5
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
-3.344497, -4.022281, -5.848132,
-3.344497, 3.646658, -5.848132,
-3.344497, -4.022281, 5.308496,
-3.344497, 3.646658, 5.308496,
-3.344497, -4.022281, -5.848132,
-3.344497, -4.022281, 5.308496,
-3.344497, 3.646658, -5.848132,
-3.344497, 3.646658, 5.308496,
-3.344497, -4.022281, -5.848132,
2.698481, -4.022281, -5.848132,
-3.344497, -4.022281, 5.308496,
2.698481, -4.022281, 5.308496,
-3.344497, 3.646658, -5.848132,
2.698481, 3.646658, -5.848132,
-3.344497, 3.646658, 5.308496,
2.698481, 3.646658, 5.308496,
2.698481, -4.022281, -5.848132,
2.698481, 3.646658, -5.848132,
2.698481, -4.022281, 5.308496,
2.698481, 3.646658, 5.308496,
2.698481, -4.022281, -5.848132,
2.698481, -4.022281, 5.308496,
2.698481, 3.646658, -5.848132,
2.698481, 3.646658, 5.308496
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
var radius = 7.916621;
var distance = 35.22194;
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
mvMatrix.translate( 0.3230079, 0.1878117, 0.2698178 );
mvMatrix.scale( 1.416455, 1.116139, 0.7672216 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.22194);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
furathiocarb<-read.table("furathiocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furathiocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
```

```r
y<-furathiocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
```

```r
z<-furathiocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
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
-3.256492, 0.8881133, -1.749875, 0, 0, 1, 1, 1,
-3.099428, -0.5193759, -2.363553, 1, 0, 0, 1, 1,
-2.803673, 1.107595, -2.362693, 1, 0, 0, 1, 1,
-2.688435, 0.223045, -3.024983, 1, 0, 0, 1, 1,
-2.615204, 0.7068431, -1.903795, 1, 0, 0, 1, 1,
-2.548, 0.1711283, -0.6567956, 1, 0, 0, 1, 1,
-2.473001, -0.02397569, -1.025759, 0, 0, 0, 1, 1,
-2.434845, 1.757217, -1.149184, 0, 0, 0, 1, 1,
-2.334291, -1.620448, -1.982091, 0, 0, 0, 1, 1,
-2.298643, -0.356858, -1.873756, 0, 0, 0, 1, 1,
-2.263365, 0.1170265, -0.3414671, 0, 0, 0, 1, 1,
-2.233722, -0.5177546, -2.276583, 0, 0, 0, 1, 1,
-2.214419, 0.07898615, -3.520937, 0, 0, 0, 1, 1,
-2.162604, 0.4591006, -0.8349055, 1, 1, 1, 1, 1,
-2.150771, 0.2543607, -1.543906, 1, 1, 1, 1, 1,
-2.146262, 0.5028749, -1.411781, 1, 1, 1, 1, 1,
-2.13659, 1.563102, -0.7186782, 1, 1, 1, 1, 1,
-2.127821, 0.1024732, -2.926245, 1, 1, 1, 1, 1,
-2.11026, -1.238046, -2.783967, 1, 1, 1, 1, 1,
-2.106894, 0.6135908, -0.59019, 1, 1, 1, 1, 1,
-2.100609, 0.03169798, -1.455822, 1, 1, 1, 1, 1,
-2.092023, 0.190193, -2.859522, 1, 1, 1, 1, 1,
-2.064984, -0.3297168, -1.634669, 1, 1, 1, 1, 1,
-2.058367, 0.5364426, -0.219055, 1, 1, 1, 1, 1,
-2.05383, -1.973141, -2.176657, 1, 1, 1, 1, 1,
-2.048767, 0.5451259, -0.2633467, 1, 1, 1, 1, 1,
-2.025081, -0.3001396, -2.499527, 1, 1, 1, 1, 1,
-1.997074, -2.44845, -3.651297, 1, 1, 1, 1, 1,
-1.988304, -0.4784077, -0.1801173, 0, 0, 1, 1, 1,
-1.980517, -2.260525, -3.522113, 1, 0, 0, 1, 1,
-1.961386, -0.1467925, 0.5583794, 1, 0, 0, 1, 1,
-1.914866, 2.11357, -1.851754, 1, 0, 0, 1, 1,
-1.909469, 0.009612986, -0.9540479, 1, 0, 0, 1, 1,
-1.896686, -0.608549, -2.990082, 1, 0, 0, 1, 1,
-1.891261, -3.113909, -2.756846, 0, 0, 0, 1, 1,
-1.890444, 0.03860774, -0.4129083, 0, 0, 0, 1, 1,
-1.862125, -1.169986, -1.924553, 0, 0, 0, 1, 1,
-1.840463, -1.661066, -1.734599, 0, 0, 0, 1, 1,
-1.839161, -0.6184962, -1.427151, 0, 0, 0, 1, 1,
-1.822818, -0.1708209, -2.041518, 0, 0, 0, 1, 1,
-1.821304, 0.3030173, -2.082697, 0, 0, 0, 1, 1,
-1.815027, 0.3951265, -2.555512, 1, 1, 1, 1, 1,
-1.774803, 0.1278696, -2.89083, 1, 1, 1, 1, 1,
-1.760856, 0.3975513, -2.934084, 1, 1, 1, 1, 1,
-1.747897, 1.614208, -1.259471, 1, 1, 1, 1, 1,
-1.712941, 0.9263375, -2.352092, 1, 1, 1, 1, 1,
-1.710999, 0.7086984, 0.2149591, 1, 1, 1, 1, 1,
-1.6812, 2.033316, -0.6460016, 1, 1, 1, 1, 1,
-1.666502, 1.127767, -0.2794439, 1, 1, 1, 1, 1,
-1.6615, 1.568707, -1.415154, 1, 1, 1, 1, 1,
-1.653974, -0.6873809, -1.258946, 1, 1, 1, 1, 1,
-1.651098, 0.02565496, -1.242599, 1, 1, 1, 1, 1,
-1.649753, 1.435603, -1.590907, 1, 1, 1, 1, 1,
-1.643176, 0.9433625, -1.613995, 1, 1, 1, 1, 1,
-1.628217, -0.09484425, -2.759571, 1, 1, 1, 1, 1,
-1.622041, 0.4956822, -0.6614437, 1, 1, 1, 1, 1,
-1.607224, 0.8853443, -0.7088213, 0, 0, 1, 1, 1,
-1.606202, 1.14458, -1.987819, 1, 0, 0, 1, 1,
-1.605372, -0.3761266, -0.8958062, 1, 0, 0, 1, 1,
-1.584168, 0.3678719, -0.4746841, 1, 0, 0, 1, 1,
-1.576634, 0.08119434, -2.141281, 1, 0, 0, 1, 1,
-1.572794, -0.6368696, 0.02207352, 1, 0, 0, 1, 1,
-1.550469, 0.2695509, -1.026473, 0, 0, 0, 1, 1,
-1.550062, 2.774709, -1.745847, 0, 0, 0, 1, 1,
-1.549213, 0.1787717, -2.318111, 0, 0, 0, 1, 1,
-1.544919, -0.6603988, -2.590576, 0, 0, 0, 1, 1,
-1.526917, -0.1475634, -2.055605, 0, 0, 0, 1, 1,
-1.52108, 2.234264, -0.8184817, 0, 0, 0, 1, 1,
-1.515031, 0.06377712, -1.831509, 0, 0, 0, 1, 1,
-1.509712, 0.4425891, 1.040549, 1, 1, 1, 1, 1,
-1.499359, -0.6825784, -2.128693, 1, 1, 1, 1, 1,
-1.493338, -0.2043077, -2.371614, 1, 1, 1, 1, 1,
-1.493047, -0.9841383, -3.77566, 1, 1, 1, 1, 1,
-1.475476, 0.7752575, -0.4389728, 1, 1, 1, 1, 1,
-1.474535, 0.4902282, 0.6025205, 1, 1, 1, 1, 1,
-1.471877, 1.954584, 0.6314713, 1, 1, 1, 1, 1,
-1.464458, 0.87971, -2.403345, 1, 1, 1, 1, 1,
-1.431975, -0.7014503, -0.2035978, 1, 1, 1, 1, 1,
-1.427739, 0.5941514, -1.025338, 1, 1, 1, 1, 1,
-1.426381, -0.4674769, -0.7364031, 1, 1, 1, 1, 1,
-1.424587, -1.226334, -1.540707, 1, 1, 1, 1, 1,
-1.424173, 0.0537648, -1.028036, 1, 1, 1, 1, 1,
-1.418024, -0.08674148, 0.4205468, 1, 1, 1, 1, 1,
-1.410522, 2.005584, 0.2836489, 1, 1, 1, 1, 1,
-1.408218, 0.9945095, -0.872266, 0, 0, 1, 1, 1,
-1.400771, -0.5459049, -2.952941, 1, 0, 0, 1, 1,
-1.391678, -2.068482, -1.653762, 1, 0, 0, 1, 1,
-1.389572, 0.9059072, -0.9273381, 1, 0, 0, 1, 1,
-1.38545, 0.7737831, -0.7764925, 1, 0, 0, 1, 1,
-1.380458, -0.9696871, -0.1192001, 1, 0, 0, 1, 1,
-1.37259, -0.1318094, -2.455189, 0, 0, 0, 1, 1,
-1.366313, 1.772739, -0.4317135, 0, 0, 0, 1, 1,
-1.362411, -0.4965978, -0.5272537, 0, 0, 0, 1, 1,
-1.358791, -0.5091377, -2.337497, 0, 0, 0, 1, 1,
-1.353733, -0.8551464, -2.240947, 0, 0, 0, 1, 1,
-1.33407, 0.4497374, 0.5566038, 0, 0, 0, 1, 1,
-1.331638, 1.361053, 0.5067165, 0, 0, 0, 1, 1,
-1.331194, 1.835586, -0.6689629, 1, 1, 1, 1, 1,
-1.328338, 0.9018243, -0.9876277, 1, 1, 1, 1, 1,
-1.322836, -1.124978, -2.217209, 1, 1, 1, 1, 1,
-1.319104, -1.801502, -5.4403, 1, 1, 1, 1, 1,
-1.314316, 0.8208287, -1.320765, 1, 1, 1, 1, 1,
-1.31126, 0.2210425, 0.6947786, 1, 1, 1, 1, 1,
-1.301559, 0.5773005, -1.560758, 1, 1, 1, 1, 1,
-1.285091, 0.6698632, -0.8891788, 1, 1, 1, 1, 1,
-1.280904, -2.563326, -2.87222, 1, 1, 1, 1, 1,
-1.274063, -0.09150779, 0.02123947, 1, 1, 1, 1, 1,
-1.26978, 0.2091705, -1.291348, 1, 1, 1, 1, 1,
-1.261966, -0.08302689, -2.421264, 1, 1, 1, 1, 1,
-1.260916, -0.5984353, -1.530137, 1, 1, 1, 1, 1,
-1.257967, 0.1690223, -0.53082, 1, 1, 1, 1, 1,
-1.251266, -2.832602, -1.776033, 1, 1, 1, 1, 1,
-1.248966, -1.829648, -1.908005, 0, 0, 1, 1, 1,
-1.243846, -0.4617251, -2.251212, 1, 0, 0, 1, 1,
-1.242862, -0.1973316, -1.405713, 1, 0, 0, 1, 1,
-1.241397, -0.4528086, -2.605891, 1, 0, 0, 1, 1,
-1.241095, -0.4696452, -0.7480386, 1, 0, 0, 1, 1,
-1.238277, -0.02416745, -0.9173586, 1, 0, 0, 1, 1,
-1.232316, 0.3785967, -1.938203, 0, 0, 0, 1, 1,
-1.227068, 0.1769987, -0.4846312, 0, 0, 0, 1, 1,
-1.22436, 1.409019, -1.761154, 0, 0, 0, 1, 1,
-1.221243, 0.1320088, -0.7810453, 0, 0, 0, 1, 1,
-1.219696, 1.441099, -0.4633764, 0, 0, 0, 1, 1,
-1.218493, -0.1275749, 0.1236537, 0, 0, 0, 1, 1,
-1.20823, -0.47584, -2.387383, 0, 0, 0, 1, 1,
-1.197079, 1.12086, -1.612188, 1, 1, 1, 1, 1,
-1.183394, 0.7474883, -1.446586, 1, 1, 1, 1, 1,
-1.178106, -1.059291, -3.212031, 1, 1, 1, 1, 1,
-1.176491, 0.8007971, -1.533509, 1, 1, 1, 1, 1,
-1.162477, -0.5245897, -3.432874, 1, 1, 1, 1, 1,
-1.158317, 0.8079798, 0.3868977, 1, 1, 1, 1, 1,
-1.155056, 0.202667, -1.065818, 1, 1, 1, 1, 1,
-1.145177, 0.506846, -1.708277, 1, 1, 1, 1, 1,
-1.141307, 0.5161722, -0.6073682, 1, 1, 1, 1, 1,
-1.136951, 0.7094715, 0.2057026, 1, 1, 1, 1, 1,
-1.134328, -0.8378466, -3.830557, 1, 1, 1, 1, 1,
-1.133192, -0.1744717, -1.533258, 1, 1, 1, 1, 1,
-1.128833, -0.5869964, -0.2256754, 1, 1, 1, 1, 1,
-1.122504, 1.635221, -1.891154, 1, 1, 1, 1, 1,
-1.120807, 1.411522, -1.326004, 1, 1, 1, 1, 1,
-1.118091, 0.4348244, 1.624215, 0, 0, 1, 1, 1,
-1.113408, -0.4628501, -2.062183, 1, 0, 0, 1, 1,
-1.11262, 1.280727, -1.01242, 1, 0, 0, 1, 1,
-1.104443, 0.332666, -1.326829, 1, 0, 0, 1, 1,
-1.101907, -0.8581537, -2.36562, 1, 0, 0, 1, 1,
-1.096463, -0.6032574, -4.265332, 1, 0, 0, 1, 1,
-1.096303, 0.7616052, -0.2775016, 0, 0, 0, 1, 1,
-1.092567, 1.764121, -1.075495, 0, 0, 0, 1, 1,
-1.089777, 0.6965077, -0.6179082, 0, 0, 0, 1, 1,
-1.075892, 1.434372, -1.562313, 0, 0, 0, 1, 1,
-1.073706, -2.146688, -2.810938, 0, 0, 0, 1, 1,
-1.070722, 0.1602839, -0.7504111, 0, 0, 0, 1, 1,
-1.069569, -0.6950368, -3.013928, 0, 0, 0, 1, 1,
-1.061442, 0.5476456, -0.2827578, 1, 1, 1, 1, 1,
-1.061277, -0.6016609, -1.341276, 1, 1, 1, 1, 1,
-1.056721, 0.9075729, -2.348101, 1, 1, 1, 1, 1,
-1.05443, 2.282951, 0.5060656, 1, 1, 1, 1, 1,
-1.049956, -0.3989039, -3.524245, 1, 1, 1, 1, 1,
-1.044243, -1.424986, -2.048374, 1, 1, 1, 1, 1,
-1.038362, 0.3493372, 0.2112103, 1, 1, 1, 1, 1,
-1.032908, -0.4666331, -2.853658, 1, 1, 1, 1, 1,
-1.022138, -0.06067952, 0.3672065, 1, 1, 1, 1, 1,
-1.007411, -0.8433802, -2.990379, 1, 1, 1, 1, 1,
-1.005493, -1.011917, -2.625619, 1, 1, 1, 1, 1,
-0.9933966, -0.2824171, -2.215141, 1, 1, 1, 1, 1,
-0.96012, -0.02077693, -3.20883, 1, 1, 1, 1, 1,
-0.9583817, 0.7061735, -2.442768, 1, 1, 1, 1, 1,
-0.9516918, -0.3459736, -1.829694, 1, 1, 1, 1, 1,
-0.9451419, 1.031068, -0.4153554, 0, 0, 1, 1, 1,
-0.9440979, 0.3636557, -0.4992195, 1, 0, 0, 1, 1,
-0.9374856, -1.147161, -2.540613, 1, 0, 0, 1, 1,
-0.9271793, -0.1771837, -0.9707033, 1, 0, 0, 1, 1,
-0.9254807, 0.9550848, -0.3553611, 1, 0, 0, 1, 1,
-0.9246386, 0.1723637, -1.673981, 1, 0, 0, 1, 1,
-0.9231301, -0.9851819, -2.403609, 0, 0, 0, 1, 1,
-0.9183797, 0.34999, 0.1927774, 0, 0, 0, 1, 1,
-0.9137852, -1.365501, -2.527468, 0, 0, 0, 1, 1,
-0.9099537, -1.102384, -3.61851, 0, 0, 0, 1, 1,
-0.909523, -1.36479, -1.576258, 0, 0, 0, 1, 1,
-0.9065296, 0.1434076, -1.454201, 0, 0, 0, 1, 1,
-0.9064251, -0.4488246, -2.192194, 0, 0, 0, 1, 1,
-0.896813, -0.2723507, -1.499156, 1, 1, 1, 1, 1,
-0.8898304, -0.3596343, -3.157543, 1, 1, 1, 1, 1,
-0.8852766, -1.472305, -3.562866, 1, 1, 1, 1, 1,
-0.8845984, 0.4081056, -0.2441013, 1, 1, 1, 1, 1,
-0.8818282, 0.1052469, -1.049096, 1, 1, 1, 1, 1,
-0.8790151, -0.4205814, -2.392182, 1, 1, 1, 1, 1,
-0.8694806, -1.153416, -2.290656, 1, 1, 1, 1, 1,
-0.862999, 0.6516281, -0.8564851, 1, 1, 1, 1, 1,
-0.8590459, 0.9166955, -0.5619719, 1, 1, 1, 1, 1,
-0.8546085, -0.2739153, -2.687372, 1, 1, 1, 1, 1,
-0.8520018, -0.548576, -3.308647, 1, 1, 1, 1, 1,
-0.8514863, -0.9753877, -1.615191, 1, 1, 1, 1, 1,
-0.8508595, 0.5724863, -0.1825325, 1, 1, 1, 1, 1,
-0.8482454, 1.351418, 0.2070456, 1, 1, 1, 1, 1,
-0.8407243, -0.5785018, -5.685657, 1, 1, 1, 1, 1,
-0.8404627, 0.9759282, 0.7164977, 0, 0, 1, 1, 1,
-0.836928, 1.012803, -2.186417, 1, 0, 0, 1, 1,
-0.8251558, -0.824441, -3.237423, 1, 0, 0, 1, 1,
-0.8247207, -1.021701, -3.019867, 1, 0, 0, 1, 1,
-0.8185496, -0.7318293, -3.154247, 1, 0, 0, 1, 1,
-0.8150046, 0.02618344, -0.7337101, 1, 0, 0, 1, 1,
-0.796282, -1.38925, -1.959433, 0, 0, 0, 1, 1,
-0.7950917, 1.060784, -0.1052313, 0, 0, 0, 1, 1,
-0.7878421, -0.5532554, -3.173224, 0, 0, 0, 1, 1,
-0.7847826, 1.433626, -0.4619139, 0, 0, 0, 1, 1,
-0.7833537, -0.2837311, -1.64523, 0, 0, 0, 1, 1,
-0.7669451, -0.1514767, -0.4352498, 0, 0, 0, 1, 1,
-0.7664764, -0.8751684, -1.806749, 0, 0, 0, 1, 1,
-0.7574142, 0.924872, -1.006331, 1, 1, 1, 1, 1,
-0.7559571, 1.513583, -1.427337, 1, 1, 1, 1, 1,
-0.7526138, 0.7810331, -1.627883, 1, 1, 1, 1, 1,
-0.7488086, -1.191245, -2.528609, 1, 1, 1, 1, 1,
-0.7483521, -1.999311, -2.999225, 1, 1, 1, 1, 1,
-0.747403, -1.668408, -2.049194, 1, 1, 1, 1, 1,
-0.7451838, 0.6360067, -1.181266, 1, 1, 1, 1, 1,
-0.742091, -0.895081, -2.467446, 1, 1, 1, 1, 1,
-0.7365396, -0.3317568, -1.680872, 1, 1, 1, 1, 1,
-0.7362596, -0.4197493, -2.372672, 1, 1, 1, 1, 1,
-0.7359676, 0.1212731, -1.16812, 1, 1, 1, 1, 1,
-0.7247221, -0.6541665, -3.058539, 1, 1, 1, 1, 1,
-0.7229379, -0.2758941, -1.281676, 1, 1, 1, 1, 1,
-0.718711, 0.6422305, 0.1406362, 1, 1, 1, 1, 1,
-0.713618, 0.5810995, -3.053591, 1, 1, 1, 1, 1,
-0.7070088, -1.311446, -1.595351, 0, 0, 1, 1, 1,
-0.7055117, 0.1098575, -1.556592, 1, 0, 0, 1, 1,
-0.7038901, 1.64199, -0.1744215, 1, 0, 0, 1, 1,
-0.7032724, -1.817767, -2.714575, 1, 0, 0, 1, 1,
-0.6978275, -0.4683374, -0.5373531, 1, 0, 0, 1, 1,
-0.6977916, 0.686533, 0.1704899, 1, 0, 0, 1, 1,
-0.6891597, -1.111559, -3.85038, 0, 0, 0, 1, 1,
-0.6889401, 0.3861381, 0.01786458, 0, 0, 0, 1, 1,
-0.6836931, 1.626751, -2.499502, 0, 0, 0, 1, 1,
-0.6791508, 0.1388901, -1.783149, 0, 0, 0, 1, 1,
-0.6768737, 0.4888414, 0.597605, 0, 0, 0, 1, 1,
-0.6753294, -0.3954176, -1.68699, 0, 0, 0, 1, 1,
-0.6714698, -1.676985, 0.21391, 0, 0, 0, 1, 1,
-0.665739, 0.469814, -3.002677, 1, 1, 1, 1, 1,
-0.6629134, 1.283654, -0.6450862, 1, 1, 1, 1, 1,
-0.657207, -1.17496, -2.306045, 1, 1, 1, 1, 1,
-0.6570824, 0.8356596, -0.5197872, 1, 1, 1, 1, 1,
-0.6544427, 1.358535, 0.7413653, 1, 1, 1, 1, 1,
-0.6537061, 1.173218, -0.8431336, 1, 1, 1, 1, 1,
-0.6524072, -0.5225257, -2.740781, 1, 1, 1, 1, 1,
-0.6514489, 1.613584, 0.2481982, 1, 1, 1, 1, 1,
-0.649041, -1.522026, -3.119041, 1, 1, 1, 1, 1,
-0.6462649, 0.16338, -1.984666, 1, 1, 1, 1, 1,
-0.6413453, -1.082739, -2.905958, 1, 1, 1, 1, 1,
-0.6400275, -0.234204, -2.676054, 1, 1, 1, 1, 1,
-0.6347352, -0.3819589, -0.7742709, 1, 1, 1, 1, 1,
-0.6325535, 0.1977685, -0.8315635, 1, 1, 1, 1, 1,
-0.6281284, -0.1796245, -3.347523, 1, 1, 1, 1, 1,
-0.6235846, 1.232219, 0.852387, 0, 0, 1, 1, 1,
-0.6121032, -1.168311, -4.422421, 1, 0, 0, 1, 1,
-0.6087683, -0.3854772, -2.18732, 1, 0, 0, 1, 1,
-0.6046449, -0.6277665, -4.370619, 1, 0, 0, 1, 1,
-0.6042961, 0.1661468, -2.56891, 1, 0, 0, 1, 1,
-0.6018971, -0.821482, -1.153437, 1, 0, 0, 1, 1,
-0.5972173, -0.3121541, -1.773115, 0, 0, 0, 1, 1,
-0.5971333, 1.025411, -0.6401247, 0, 0, 0, 1, 1,
-0.5939326, 1.232439, -0.09036338, 0, 0, 0, 1, 1,
-0.5920111, 0.8148942, -1.039278, 0, 0, 0, 1, 1,
-0.5904259, -0.2554042, -3.145373, 0, 0, 0, 1, 1,
-0.5844875, 1.440639, -1.14712, 0, 0, 0, 1, 1,
-0.5764345, -0.5904265, -1.953023, 0, 0, 0, 1, 1,
-0.5753233, -0.8128941, -1.163004, 1, 1, 1, 1, 1,
-0.5697853, -0.8212906, -2.202132, 1, 1, 1, 1, 1,
-0.5679367, -0.887184, -1.967968, 1, 1, 1, 1, 1,
-0.5643676, 0.3950652, -1.142391, 1, 1, 1, 1, 1,
-0.5621654, 1.423794, -1.082638, 1, 1, 1, 1, 1,
-0.5593432, 0.1025718, -1.835964, 1, 1, 1, 1, 1,
-0.5579911, -0.8312225, -1.853185, 1, 1, 1, 1, 1,
-0.5574872, 0.01213727, -3.069858, 1, 1, 1, 1, 1,
-0.5573852, 0.4171259, -0.1066033, 1, 1, 1, 1, 1,
-0.5552669, 0.4739296, -1.76184, 1, 1, 1, 1, 1,
-0.5526223, -1.166926, -2.554281, 1, 1, 1, 1, 1,
-0.5494615, -0.2956766, -1.639145, 1, 1, 1, 1, 1,
-0.5474075, -0.05748976, -1.266046, 1, 1, 1, 1, 1,
-0.5461497, 0.5736138, -0.1258171, 1, 1, 1, 1, 1,
-0.5440494, 0.7944813, -1.172414, 1, 1, 1, 1, 1,
-0.5425999, -0.3841721, -2.141569, 0, 0, 1, 1, 1,
-0.5374677, 1.412686, -0.7483466, 1, 0, 0, 1, 1,
-0.5362967, -0.0755194, -2.417565, 1, 0, 0, 1, 1,
-0.5322059, 0.06124802, -1.64714, 1, 0, 0, 1, 1,
-0.5248042, -0.4414323, -1.792747, 1, 0, 0, 1, 1,
-0.5211881, 0.943884, -0.6368131, 1, 0, 0, 1, 1,
-0.5208412, -1.642938, -1.667859, 0, 0, 0, 1, 1,
-0.5182903, -0.3831039, -2.515879, 0, 0, 0, 1, 1,
-0.5181664, -0.6456436, -2.702398, 0, 0, 0, 1, 1,
-0.5169862, -0.4039796, -1.916466, 0, 0, 0, 1, 1,
-0.5139506, 0.8017977, 0.8608707, 0, 0, 0, 1, 1,
-0.5120587, -0.3304108, -2.242588, 0, 0, 0, 1, 1,
-0.5086511, -0.690879, -2.255375, 0, 0, 0, 1, 1,
-0.5038844, 0.7509597, -2.846879, 1, 1, 1, 1, 1,
-0.5020765, -0.1128571, -0.3071713, 1, 1, 1, 1, 1,
-0.4998617, -0.7014639, -1.885042, 1, 1, 1, 1, 1,
-0.4928392, -0.7982385, -1.969167, 1, 1, 1, 1, 1,
-0.4840036, 1.677981, -0.7713538, 1, 1, 1, 1, 1,
-0.4837619, 0.5181792, -0.1050422, 1, 1, 1, 1, 1,
-0.481261, -0.3163041, -2.92666, 1, 1, 1, 1, 1,
-0.4799822, -0.6423889, -3.27105, 1, 1, 1, 1, 1,
-0.4783235, 1.428655, -1.340025, 1, 1, 1, 1, 1,
-0.4756168, -0.02128153, -0.09305964, 1, 1, 1, 1, 1,
-0.4692617, 0.07867142, -0.3736997, 1, 1, 1, 1, 1,
-0.4673325, 0.7253215, 0.2942151, 1, 1, 1, 1, 1,
-0.4662859, -1.79385, -2.155728, 1, 1, 1, 1, 1,
-0.4647632, -0.08853127, -2.171855, 1, 1, 1, 1, 1,
-0.4595852, -0.325073, -2.621778, 1, 1, 1, 1, 1,
-0.4493602, -0.1235291, -1.179042, 0, 0, 1, 1, 1,
-0.4449328, -0.7086781, -2.541258, 1, 0, 0, 1, 1,
-0.4431308, 0.3496398, 0.4882415, 1, 0, 0, 1, 1,
-0.4416329, -1.622731, -1.884616, 1, 0, 0, 1, 1,
-0.4388501, 2.451018, 0.2675351, 1, 0, 0, 1, 1,
-0.4380321, -0.6403352, -2.117958, 1, 0, 0, 1, 1,
-0.4377563, 1.792552, -0.09488404, 0, 0, 0, 1, 1,
-0.4283676, -0.5752227, -3.571936, 0, 0, 0, 1, 1,
-0.4256448, 0.2658416, 0.8416454, 0, 0, 0, 1, 1,
-0.4085556, -1.323394, -2.257823, 0, 0, 0, 1, 1,
-0.4081788, 0.670575, 0.2339925, 0, 0, 0, 1, 1,
-0.4020539, -0.4107714, -2.245777, 0, 0, 0, 1, 1,
-0.3991604, -1.152684, -3.809923, 0, 0, 0, 1, 1,
-0.3919044, 1.114911, 0.180053, 1, 1, 1, 1, 1,
-0.3909661, -0.2179594, -0.1689811, 1, 1, 1, 1, 1,
-0.3877108, 0.2268332, 0.01601366, 1, 1, 1, 1, 1,
-0.3850007, -1.271603, -4.643666, 1, 1, 1, 1, 1,
-0.3849396, -1.178245, -1.612099, 1, 1, 1, 1, 1,
-0.3837855, -0.06904306, -2.996886, 1, 1, 1, 1, 1,
-0.3798656, -0.2882262, -0.5914138, 1, 1, 1, 1, 1,
-0.3759782, 0.1602855, -1.432592, 1, 1, 1, 1, 1,
-0.3745557, 0.1408059, -0.006325261, 1, 1, 1, 1, 1,
-0.372837, 0.2121455, -2.014264, 1, 1, 1, 1, 1,
-0.3677101, -1.586293, -3.223744, 1, 1, 1, 1, 1,
-0.3590395, -1.11455, -1.847747, 1, 1, 1, 1, 1,
-0.3470232, 1.969565, 0.2954074, 1, 1, 1, 1, 1,
-0.3443838, -2.054847, -3.571444, 1, 1, 1, 1, 1,
-0.3420947, -0.7108652, -3.466513, 1, 1, 1, 1, 1,
-0.3363248, -0.3130032, -2.426012, 0, 0, 1, 1, 1,
-0.3307131, 0.7378209, 0.7278925, 1, 0, 0, 1, 1,
-0.3302998, 0.5385873, 0.7483841, 1, 0, 0, 1, 1,
-0.3294765, 0.03959388, -0.4369386, 1, 0, 0, 1, 1,
-0.3294123, -1.480743, -2.751353, 1, 0, 0, 1, 1,
-0.3211296, -1.384244, -3.360861, 1, 0, 0, 1, 1,
-0.3179062, 0.4032844, -1.369202, 0, 0, 0, 1, 1,
-0.3146193, -0.2519194, -1.696216, 0, 0, 0, 1, 1,
-0.3102415, -0.1581519, -1.874027, 0, 0, 0, 1, 1,
-0.3034623, 0.6191605, -1.534119, 0, 0, 0, 1, 1,
-0.3013667, 0.5321171, 0.08846373, 0, 0, 0, 1, 1,
-0.3013134, 0.1624772, -2.615339, 0, 0, 0, 1, 1,
-0.2992384, -0.8506238, -2.522936, 0, 0, 0, 1, 1,
-0.2986615, 0.29553, -2.714094, 1, 1, 1, 1, 1,
-0.2967495, -0.05496567, -2.579735, 1, 1, 1, 1, 1,
-0.2951913, 0.4042214, -0.02339315, 1, 1, 1, 1, 1,
-0.2937134, 1.223877, -1.477011, 1, 1, 1, 1, 1,
-0.2931687, -0.1464103, -2.504643, 1, 1, 1, 1, 1,
-0.2930503, -0.5893804, -2.913746, 1, 1, 1, 1, 1,
-0.2898774, 0.3981623, -1.27298, 1, 1, 1, 1, 1,
-0.2894517, -0.3863612, -1.130069, 1, 1, 1, 1, 1,
-0.2881438, 1.150075, -0.9340475, 1, 1, 1, 1, 1,
-0.2859882, 1.191738, -0.1044191, 1, 1, 1, 1, 1,
-0.2853785, 1.082786, 0.3427756, 1, 1, 1, 1, 1,
-0.2797658, 0.7461569, 1.141092, 1, 1, 1, 1, 1,
-0.2766144, -1.103578, -2.306947, 1, 1, 1, 1, 1,
-0.2757291, 0.3709562, -1.095548, 1, 1, 1, 1, 1,
-0.2732755, -1.725502, -3.455971, 1, 1, 1, 1, 1,
-0.2715482, 0.4712943, -0.922997, 0, 0, 1, 1, 1,
-0.2696992, -0.01898684, -0.5002374, 1, 0, 0, 1, 1,
-0.269192, 0.2198032, -2.499136, 1, 0, 0, 1, 1,
-0.2686892, -0.5690982, -2.713952, 1, 0, 0, 1, 1,
-0.263568, -0.3050004, -0.8734444, 1, 0, 0, 1, 1,
-0.2591287, -0.353543, -0.81058, 1, 0, 0, 1, 1,
-0.2584457, -0.1513864, -2.878247, 0, 0, 0, 1, 1,
-0.2532312, 0.351366, -0.4016825, 0, 0, 0, 1, 1,
-0.2513112, 0.7119314, -1.403591, 0, 0, 0, 1, 1,
-0.2469714, 0.3935473, -0.1025996, 0, 0, 0, 1, 1,
-0.2440984, 0.488794, -2.25343, 0, 0, 0, 1, 1,
-0.243698, 0.9966789, -0.2290228, 0, 0, 0, 1, 1,
-0.241987, -1.458043, -3.254753, 0, 0, 0, 1, 1,
-0.2413834, 1.282309, -0.3498773, 1, 1, 1, 1, 1,
-0.2368744, -0.4014482, -2.509999, 1, 1, 1, 1, 1,
-0.2313343, -1.150791, -2.221928, 1, 1, 1, 1, 1,
-0.2308453, 0.8133898, 2.275004, 1, 1, 1, 1, 1,
-0.2307642, 0.2365143, -1.396835, 1, 1, 1, 1, 1,
-0.227223, -0.1085427, -0.8756205, 1, 1, 1, 1, 1,
-0.2240457, -0.294645, -3.417958, 1, 1, 1, 1, 1,
-0.223143, -0.2124259, -1.874545, 1, 1, 1, 1, 1,
-0.2210074, 0.7001568, 0.1694658, 1, 1, 1, 1, 1,
-0.2205948, 0.1737326, 2.131058, 1, 1, 1, 1, 1,
-0.2179106, -1.512961, -2.142153, 1, 1, 1, 1, 1,
-0.2141729, 0.9867772, -0.0198639, 1, 1, 1, 1, 1,
-0.2138152, 1.220041, 1.019069, 1, 1, 1, 1, 1,
-0.2103477, 0.852565, 0.1049169, 1, 1, 1, 1, 1,
-0.2082767, -0.6189365, -1.853034, 1, 1, 1, 1, 1,
-0.2082655, -0.9973363, -4.390792, 0, 0, 1, 1, 1,
-0.20444, 1.812443, -1.564509, 1, 0, 0, 1, 1,
-0.2040539, -1.115315, -4.4367, 1, 0, 0, 1, 1,
-0.2000367, 0.2184647, 0.5443529, 1, 0, 0, 1, 1,
-0.1939593, 0.6305248, -1.29225, 1, 0, 0, 1, 1,
-0.1906085, -2.309808, -2.29932, 1, 0, 0, 1, 1,
-0.1882867, -1.194049, -2.996257, 0, 0, 0, 1, 1,
-0.1850167, 0.3932502, 0.1106253, 0, 0, 0, 1, 1,
-0.1832356, 0.2214728, -1.844355, 0, 0, 0, 1, 1,
-0.1829469, -0.2270572, -2.186014, 0, 0, 0, 1, 1,
-0.1824661, 0.8048956, 0.1140998, 0, 0, 0, 1, 1,
-0.1811073, 0.04476663, -1.55383, 0, 0, 0, 1, 1,
-0.1803527, 0.6189626, 0.572516, 0, 0, 0, 1, 1,
-0.1792327, 1.391026, 0.954327, 1, 1, 1, 1, 1,
-0.1783572, 0.1305946, -1.891415, 1, 1, 1, 1, 1,
-0.178252, 0.2822227, -0.645467, 1, 1, 1, 1, 1,
-0.1775394, -1.852602, -3.295454, 1, 1, 1, 1, 1,
-0.1750629, 0.9463639, -1.252494, 1, 1, 1, 1, 1,
-0.1745708, -0.6922221, -2.84345, 1, 1, 1, 1, 1,
-0.1719458, -0.05386345, -1.280975, 1, 1, 1, 1, 1,
-0.1697347, 1.195835, 1.218008, 1, 1, 1, 1, 1,
-0.1670802, -1.853798, -3.054443, 1, 1, 1, 1, 1,
-0.1666407, 1.588605, -2.308246, 1, 1, 1, 1, 1,
-0.1662777, 0.2251256, 0.37814, 1, 1, 1, 1, 1,
-0.1648834, -1.588493, -1.443066, 1, 1, 1, 1, 1,
-0.163482, -0.04382719, -1.619543, 1, 1, 1, 1, 1,
-0.160255, 0.6821187, 0.06847499, 1, 1, 1, 1, 1,
-0.1592712, -0.03057447, -3.216956, 1, 1, 1, 1, 1,
-0.1551422, 0.4840488, -1.988751, 0, 0, 1, 1, 1,
-0.1534919, 0.6785223, 2.445911, 1, 0, 0, 1, 1,
-0.1489863, 0.5112773, -0.226381, 1, 0, 0, 1, 1,
-0.1430675, -1.343834, -2.896768, 1, 0, 0, 1, 1,
-0.1400706, -0.8260342, -2.481235, 1, 0, 0, 1, 1,
-0.1336022, -1.013281, -4.042537, 1, 0, 0, 1, 1,
-0.1301288, -0.4912457, -1.558728, 0, 0, 0, 1, 1,
-0.1299106, -1.83277, -2.482941, 0, 0, 0, 1, 1,
-0.1297589, 1.119351, -0.5546302, 0, 0, 0, 1, 1,
-0.1285566, -0.4813548, -3.24297, 0, 0, 0, 1, 1,
-0.1260284, -0.8597561, -3.427746, 0, 0, 0, 1, 1,
-0.1210629, 0.8054881, -0.6879571, 0, 0, 0, 1, 1,
-0.1189146, -1.131306, -4.204289, 0, 0, 0, 1, 1,
-0.1168111, 0.6771808, 0.1550753, 1, 1, 1, 1, 1,
-0.106573, -0.7902327, -3.555321, 1, 1, 1, 1, 1,
-0.1059253, -0.1202454, -2.259526, 1, 1, 1, 1, 1,
-0.104476, -0.5634214, -3.411142, 1, 1, 1, 1, 1,
-0.1019624, -0.4590048, -2.219166, 1, 1, 1, 1, 1,
-0.09856305, 0.5021048, 1.227576, 1, 1, 1, 1, 1,
-0.09585956, -1.749662, -2.669716, 1, 1, 1, 1, 1,
-0.0935685, -0.4981422, -3.881252, 1, 1, 1, 1, 1,
-0.09123459, -0.4300396, -4.107638, 1, 1, 1, 1, 1,
-0.08835104, -0.3969227, -4.103457, 1, 1, 1, 1, 1,
-0.08795254, -0.2404094, -3.460849, 1, 1, 1, 1, 1,
-0.08662261, 1.562607, 0.789865, 1, 1, 1, 1, 1,
-0.07979698, -1.046759, -5.103772, 1, 1, 1, 1, 1,
-0.07927255, 0.2383943, -0.8943835, 1, 1, 1, 1, 1,
-0.07601719, 0.4195934, 1.288478, 1, 1, 1, 1, 1,
-0.0728912, 0.3843766, -0.9923775, 0, 0, 1, 1, 1,
-0.07005968, 0.7889602, -0.3450613, 1, 0, 0, 1, 1,
-0.06550701, 0.2764259, -1.031598, 1, 0, 0, 1, 1,
-0.06459878, -1.831331, -2.972104, 1, 0, 0, 1, 1,
-0.06394455, -0.4502235, -3.686872, 1, 0, 0, 1, 1,
-0.06177476, -1.973793, -3.715677, 1, 0, 0, 1, 1,
-0.06103311, 0.7754751, -0.4034682, 0, 0, 0, 1, 1,
-0.05615575, -0.5311068, -3.39263, 0, 0, 0, 1, 1,
-0.05602137, -0.8501948, -2.409458, 0, 0, 0, 1, 1,
-0.05528234, -0.8129374, -3.053914, 0, 0, 0, 1, 1,
-0.05426954, -2.046191, -2.923236, 0, 0, 0, 1, 1,
-0.05125136, -0.6005635, -3.173557, 0, 0, 0, 1, 1,
-0.04957356, 0.05111086, -1.868228, 0, 0, 0, 1, 1,
-0.04710532, 0.01227643, -3.030484, 1, 1, 1, 1, 1,
-0.04502787, 0.8143111, 0.2551904, 1, 1, 1, 1, 1,
-0.04447211, 1.455922, -0.7990004, 1, 1, 1, 1, 1,
-0.0437467, 0.6456613, 0.08190062, 1, 1, 1, 1, 1,
-0.03933162, 1.319908, -1.578867, 1, 1, 1, 1, 1,
-0.03810435, 0.8820262, 0.8237072, 1, 1, 1, 1, 1,
-0.03578246, 1.864027, -0.2482861, 1, 1, 1, 1, 1,
-0.03440979, -0.308331, -3.291119, 1, 1, 1, 1, 1,
-0.031562, -0.3966227, -2.149974, 1, 1, 1, 1, 1,
-0.02407592, -1.017086, -2.723253, 1, 1, 1, 1, 1,
-0.02183316, -0.873838, -2.637687, 1, 1, 1, 1, 1,
-0.0195046, 1.904389, 0.4521766, 1, 1, 1, 1, 1,
-0.01948186, -0.07972843, -2.92847, 1, 1, 1, 1, 1,
-0.01828693, 0.8278256, -0.6571867, 1, 1, 1, 1, 1,
-0.01435696, -0.0815798, -1.59468, 1, 1, 1, 1, 1,
-0.01169059, -0.4279559, -3.146655, 0, 0, 1, 1, 1,
-0.009834901, -1.423721, -3.79242, 1, 0, 0, 1, 1,
-0.008077011, 1.26935, 1.779142, 1, 0, 0, 1, 1,
-0.001126838, 0.9957055, -0.6809886, 1, 0, 0, 1, 1,
-9.214402e-05, 0.4359623, 0.02173676, 1, 0, 0, 1, 1,
0.004816001, 0.07800406, 0.7371816, 1, 0, 0, 1, 1,
0.006735832, -0.4549064, 1.156417, 0, 0, 0, 1, 1,
0.009558248, 1.878989, -0.6484688, 0, 0, 0, 1, 1,
0.02604708, 1.373859, -1.908022, 0, 0, 0, 1, 1,
0.0275823, 0.02909418, 0.7717187, 0, 0, 0, 1, 1,
0.0296985, 0.4836659, 1.754083, 0, 0, 0, 1, 1,
0.03034431, -1.580869, 2.837398, 0, 0, 0, 1, 1,
0.03119723, -1.550328, 3.483929, 0, 0, 0, 1, 1,
0.03518546, 0.05500737, 0.791417, 1, 1, 1, 1, 1,
0.03702904, 0.9992216, -0.1294257, 1, 1, 1, 1, 1,
0.03924169, 0.6453257, 0.191789, 1, 1, 1, 1, 1,
0.0426293, 0.02257986, 1.512478, 1, 1, 1, 1, 1,
0.04822515, -0.0325186, 0.9544519, 1, 1, 1, 1, 1,
0.05031567, 0.3850703, -0.8125747, 1, 1, 1, 1, 1,
0.05218045, 0.8805879, 0.5963417, 1, 1, 1, 1, 1,
0.05534714, 0.4667489, -0.205563, 1, 1, 1, 1, 1,
0.05567541, -0.1881637, 1.899484, 1, 1, 1, 1, 1,
0.05776875, -0.5857012, 1.845574, 1, 1, 1, 1, 1,
0.05778681, 1.209847, -0.7641463, 1, 1, 1, 1, 1,
0.05849445, -1.925831, 2.753017, 1, 1, 1, 1, 1,
0.06131605, -0.770444, 2.906055, 1, 1, 1, 1, 1,
0.06370365, 1.088733, 0.3995661, 1, 1, 1, 1, 1,
0.06763892, -2.112577, 2.362437, 1, 1, 1, 1, 1,
0.07092241, -0.877579, 2.676604, 0, 0, 1, 1, 1,
0.07331932, 1.463268, -0.04266127, 1, 0, 0, 1, 1,
0.07571717, 0.05250005, 1.093884, 1, 0, 0, 1, 1,
0.0784561, 0.418156, -0.9007725, 1, 0, 0, 1, 1,
0.08006328, -1.47816, 4.425241, 1, 0, 0, 1, 1,
0.08058599, 1.536339, 1.877064, 1, 0, 0, 1, 1,
0.08087617, 0.4617968, 0.1997286, 0, 0, 0, 1, 1,
0.08174365, 0.1786668, 0.7635255, 0, 0, 0, 1, 1,
0.08334773, -2.048576, 2.92716, 0, 0, 0, 1, 1,
0.08422207, -0.4053244, 2.579603, 0, 0, 0, 1, 1,
0.08458894, 1.36615, 0.05433778, 0, 0, 0, 1, 1,
0.08865343, -0.4869751, 3.964425, 0, 0, 0, 1, 1,
0.0918887, -0.4087715, 2.758706, 0, 0, 0, 1, 1,
0.09275491, -1.513156, 2.979753, 1, 1, 1, 1, 1,
0.09346169, 0.2827522, 0.4670953, 1, 1, 1, 1, 1,
0.0966839, -1.892612, 2.873363, 1, 1, 1, 1, 1,
0.09779404, 0.9752951, -0.01599596, 1, 1, 1, 1, 1,
0.09803285, -0.3592038, 1.278583, 1, 1, 1, 1, 1,
0.1012192, 0.0311346, 1.510831, 1, 1, 1, 1, 1,
0.1064742, 0.5487393, 1.233777, 1, 1, 1, 1, 1,
0.1098604, -0.8654239, 4.906048, 1, 1, 1, 1, 1,
0.1100615, -0.952795, 1.63682, 1, 1, 1, 1, 1,
0.11184, -1.227352, 1.927617, 1, 1, 1, 1, 1,
0.1173502, 0.6846815, 1.703436, 1, 1, 1, 1, 1,
0.1175484, -0.3513075, 2.333627, 1, 1, 1, 1, 1,
0.1214363, -0.5372699, 2.427753, 1, 1, 1, 1, 1,
0.1220154, 0.6525198, 2.647411, 1, 1, 1, 1, 1,
0.1224633, -0.1065873, 1.243315, 1, 1, 1, 1, 1,
0.1234374, -0.3393233, 0.175536, 0, 0, 1, 1, 1,
0.1258146, -2.102088, 3.048804, 1, 0, 0, 1, 1,
0.1282453, -0.5792668, 3.072778, 1, 0, 0, 1, 1,
0.1290431, -0.7628865, 3.962168, 1, 0, 0, 1, 1,
0.1295892, 0.3727441, 0.3265524, 1, 0, 0, 1, 1,
0.129648, -1.210637, 2.354755, 1, 0, 0, 1, 1,
0.1388093, -0.4413897, 2.586624, 0, 0, 0, 1, 1,
0.1425262, -0.1406983, 2.366243, 0, 0, 0, 1, 1,
0.1425381, 0.5017089, 0.218706, 0, 0, 0, 1, 1,
0.1439904, 1.210286, -0.5618353, 0, 0, 0, 1, 1,
0.1464164, 0.3696209, 0.1583716, 0, 0, 0, 1, 1,
0.147119, -1.104425, 2.363337, 0, 0, 0, 1, 1,
0.1472606, -0.2037902, 2.312184, 0, 0, 0, 1, 1,
0.1477706, 0.9525676, 0.9766671, 1, 1, 1, 1, 1,
0.1495318, -0.6837876, 0.8562734, 1, 1, 1, 1, 1,
0.1558954, 0.4375145, 0.3229635, 1, 1, 1, 1, 1,
0.1570006, -1.330342, 3.205723, 1, 1, 1, 1, 1,
0.1607175, -0.2250462, 3.254215, 1, 1, 1, 1, 1,
0.1619929, -0.2018104, 2.380981, 1, 1, 1, 1, 1,
0.1669066, -1.987304, 3.23722, 1, 1, 1, 1, 1,
0.1676246, -0.6885957, 1.714818, 1, 1, 1, 1, 1,
0.1700178, 0.08985905, 3.076967, 1, 1, 1, 1, 1,
0.1707738, 0.2504347, 2.11763, 1, 1, 1, 1, 1,
0.1708415, 0.7440335, 0.4319875, 1, 1, 1, 1, 1,
0.1713088, -1.052723, 2.060896, 1, 1, 1, 1, 1,
0.1719849, 1.446884, 0.4588712, 1, 1, 1, 1, 1,
0.1764142, 0.2529892, 1.906052, 1, 1, 1, 1, 1,
0.1788249, -0.2867128, 3.059139, 1, 1, 1, 1, 1,
0.1806871, 1.412926, 0.9487628, 0, 0, 1, 1, 1,
0.1813949, 0.06139817, 0.7973197, 1, 0, 0, 1, 1,
0.181468, 3.073107, -1.35878, 1, 0, 0, 1, 1,
0.1815151, -0.6656472, 1.139868, 1, 0, 0, 1, 1,
0.1831288, -0.1422638, 1.64935, 1, 0, 0, 1, 1,
0.1832421, 1.880187, -0.5165235, 1, 0, 0, 1, 1,
0.1834076, -0.8967301, 4.198815, 0, 0, 0, 1, 1,
0.1842345, 0.3920453, 0.3550419, 0, 0, 0, 1, 1,
0.1921186, 0.1839927, -1.046863, 0, 0, 0, 1, 1,
0.1929683, -0.4608172, 2.618752, 0, 0, 0, 1, 1,
0.1956251, 0.4778199, 1.030115, 0, 0, 0, 1, 1,
0.2000898, 0.6812436, 0.6851564, 0, 0, 0, 1, 1,
0.203514, -1.171016, 2.183984, 0, 0, 0, 1, 1,
0.20478, 0.6177381, 2.825112, 1, 1, 1, 1, 1,
0.2054768, 0.1785021, 2.190264, 1, 1, 1, 1, 1,
0.2079951, -0.2042146, 3.286966, 1, 1, 1, 1, 1,
0.2081372, 0.04193377, -0.3421601, 1, 1, 1, 1, 1,
0.2096427, 0.2785629, 0.0249127, 1, 1, 1, 1, 1,
0.2151814, -0.6876286, 2.486542, 1, 1, 1, 1, 1,
0.2166262, 1.23555, -0.7150384, 1, 1, 1, 1, 1,
0.2205528, -0.2158788, 2.11367, 1, 1, 1, 1, 1,
0.2247859, -0.6386977, 3.131855, 1, 1, 1, 1, 1,
0.2275836, -1.235228, 3.555214, 1, 1, 1, 1, 1,
0.2278051, 0.3711775, -0.2357277, 1, 1, 1, 1, 1,
0.2344553, 2.709896, 1.363458, 1, 1, 1, 1, 1,
0.2346915, 0.7330472, 1.243482, 1, 1, 1, 1, 1,
0.2375731, -0.05887669, 1.144282, 1, 1, 1, 1, 1,
0.2407543, 0.3849115, 1.579373, 1, 1, 1, 1, 1,
0.2423334, -2.503404, 2.608939, 0, 0, 1, 1, 1,
0.243992, 0.6795379, 1.919581, 1, 0, 0, 1, 1,
0.2441954, 0.1445056, 0.6726872, 1, 0, 0, 1, 1,
0.2464778, 0.3579226, 0.5230811, 1, 0, 0, 1, 1,
0.2519721, -0.005728537, 1.055556, 1, 0, 0, 1, 1,
0.2575173, 1.672058, 0.4383378, 1, 0, 0, 1, 1,
0.2582499, 0.2252062, 1.444581, 0, 0, 0, 1, 1,
0.2601087, 0.9054544, 0.8743342, 0, 0, 0, 1, 1,
0.2626763, -1.945365, 1.816485, 0, 0, 0, 1, 1,
0.2637225, -0.3531545, 1.738958, 0, 0, 0, 1, 1,
0.2693487, 1.698712, 0.4420893, 0, 0, 0, 1, 1,
0.2703287, -1.568545, 0.8812019, 0, 0, 0, 1, 1,
0.2732417, 2.259921, -0.1517356, 0, 0, 0, 1, 1,
0.2760492, 0.9557213, 0.6166992, 1, 1, 1, 1, 1,
0.2799331, -0.8547752, 2.465978, 1, 1, 1, 1, 1,
0.28005, -1.284106, 3.578118, 1, 1, 1, 1, 1,
0.281161, -0.2413349, 1.430305, 1, 1, 1, 1, 1,
0.2821751, 0.4875444, 0.6483253, 1, 1, 1, 1, 1,
0.2856978, -0.2596637, 3.683337, 1, 1, 1, 1, 1,
0.2886684, -0.3259439, 2.431127, 1, 1, 1, 1, 1,
0.2905663, 0.01407155, 2.219881, 1, 1, 1, 1, 1,
0.2928009, 1.767551, -1.485163, 1, 1, 1, 1, 1,
0.2943582, 0.1220013, 2.196268, 1, 1, 1, 1, 1,
0.2950578, -0.4581857, 3.84095, 1, 1, 1, 1, 1,
0.2955908, 0.7174088, 1.649545, 1, 1, 1, 1, 1,
0.2958461, 1.315606, -1.596777, 1, 1, 1, 1, 1,
0.2965279, -1.082102, 2.784645, 1, 1, 1, 1, 1,
0.2988945, 0.8869185, 1.463695, 1, 1, 1, 1, 1,
0.302269, 0.2696315, 0.4984582, 0, 0, 1, 1, 1,
0.3051538, -0.3168396, 2.65051, 1, 0, 0, 1, 1,
0.3060116, -0.02489533, -0.08706024, 1, 0, 0, 1, 1,
0.3069814, -0.8935876, 3.655032, 1, 0, 0, 1, 1,
0.3095933, -0.948924, 2.562237, 1, 0, 0, 1, 1,
0.3122629, 0.7033078, -1.082135, 1, 0, 0, 1, 1,
0.3125397, 1.691314, 1.358288, 0, 0, 0, 1, 1,
0.3199707, -0.2171742, 2.467327, 0, 0, 0, 1, 1,
0.3303453, 1.337541, 2.413025, 0, 0, 0, 1, 1,
0.3321999, 1.144284, 1.088715, 0, 0, 0, 1, 1,
0.3413097, -0.9434599, 0.3019888, 0, 0, 0, 1, 1,
0.3413925, 1.728606, 1.91804, 0, 0, 0, 1, 1,
0.3425118, 1.211174, 0.3332017, 0, 0, 0, 1, 1,
0.3457378, 1.287239, 1.161869, 1, 1, 1, 1, 1,
0.3459099, -0.8458409, 3.462273, 1, 1, 1, 1, 1,
0.3480949, -0.4121207, 4.675383, 1, 1, 1, 1, 1,
0.3519862, -0.7736914, 2.04055, 1, 1, 1, 1, 1,
0.3522626, 0.810473, -0.189912, 1, 1, 1, 1, 1,
0.353116, 0.2406855, -0.2009829, 1, 1, 1, 1, 1,
0.3538813, 0.04757717, 1.508368, 1, 1, 1, 1, 1,
0.3551802, 2.434739, -0.2169524, 1, 1, 1, 1, 1,
0.3587185, -1.927041, 2.570795, 1, 1, 1, 1, 1,
0.3588213, 1.000177, -0.5515091, 1, 1, 1, 1, 1,
0.3613376, -0.7109653, 2.204834, 1, 1, 1, 1, 1,
0.362735, 0.7403021, 1.002282, 1, 1, 1, 1, 1,
0.3630767, -0.01992031, 2.416062, 1, 1, 1, 1, 1,
0.3650945, -0.3194848, 3.34839, 1, 1, 1, 1, 1,
0.369052, 0.8528435, 1.768713, 1, 1, 1, 1, 1,
0.3697218, 1.463523, 1.19229, 0, 0, 1, 1, 1,
0.3773763, 0.3275113, 0.9056011, 1, 0, 0, 1, 1,
0.3783119, 0.2197831, 0.9983122, 1, 0, 0, 1, 1,
0.3823246, -0.8761636, 3.251964, 1, 0, 0, 1, 1,
0.38293, -1.413052, 2.914768, 1, 0, 0, 1, 1,
0.3829503, 0.3439091, 0.36682, 1, 0, 0, 1, 1,
0.3854666, -0.2801329, 0.8157261, 0, 0, 0, 1, 1,
0.3855862, 0.9289377, -0.1189916, 0, 0, 0, 1, 1,
0.3957174, 1.199427, 1.78265, 0, 0, 0, 1, 1,
0.3959277, 0.7012346, -0.9687008, 0, 0, 0, 1, 1,
0.3965163, 1.65679, 1.58509, 0, 0, 0, 1, 1,
0.4003286, -0.6571984, 2.411487, 0, 0, 0, 1, 1,
0.4015833, -0.5182138, 1.481942, 0, 0, 0, 1, 1,
0.4016147, 0.5423238, 1.101347, 1, 1, 1, 1, 1,
0.404567, 1.389232, 0.1101368, 1, 1, 1, 1, 1,
0.405438, -1.16786, 2.202542, 1, 1, 1, 1, 1,
0.4088104, 2.926035, -0.1107711, 1, 1, 1, 1, 1,
0.4096547, 0.01216428, 2.334716, 1, 1, 1, 1, 1,
0.4151836, 0.6358086, 0.2348395, 1, 1, 1, 1, 1,
0.4152048, -1.937009, 2.35313, 1, 1, 1, 1, 1,
0.4177126, -1.993378, 5.146021, 1, 1, 1, 1, 1,
0.4217693, -0.1154196, 1.957247, 1, 1, 1, 1, 1,
0.4308748, 1.517331, 2.026842, 1, 1, 1, 1, 1,
0.4321333, -1.304068, 3.029481, 1, 1, 1, 1, 1,
0.4322611, 1.497478, 0.3585907, 1, 1, 1, 1, 1,
0.4331146, -0.4478404, 2.054405, 1, 1, 1, 1, 1,
0.4360632, 0.6865274, 1.500316, 1, 1, 1, 1, 1,
0.437377, 0.9902874, -1.295321, 1, 1, 1, 1, 1,
0.4407004, -0.4724317, 2.448314, 0, 0, 1, 1, 1,
0.4422969, 2.990426, -0.4164884, 1, 0, 0, 1, 1,
0.4445772, -0.9830196, 3.812827, 1, 0, 0, 1, 1,
0.4498349, -0.844753, 2.160427, 1, 0, 0, 1, 1,
0.4603903, -1.433323, 3.57774, 1, 0, 0, 1, 1,
0.463791, 2.215362, -0.01876304, 1, 0, 0, 1, 1,
0.4647454, -0.00586941, 1.080702, 0, 0, 0, 1, 1,
0.4648275, -0.5564425, 4.586594, 0, 0, 0, 1, 1,
0.4693328, 0.2996906, 2.707639, 0, 0, 0, 1, 1,
0.4807119, -0.4001434, 2.302501, 0, 0, 0, 1, 1,
0.4822846, -1.738843, 0.8390689, 0, 0, 0, 1, 1,
0.4942292, 0.7416215, -1.443753, 0, 0, 0, 1, 1,
0.4947142, 0.8045326, 0.03217563, 0, 0, 0, 1, 1,
0.4958565, 2.145525, 1.908527, 1, 1, 1, 1, 1,
0.4968935, -0.3547144, 2.1345, 1, 1, 1, 1, 1,
0.4989685, -1.553031, 2.123102, 1, 1, 1, 1, 1,
0.5013776, 0.06183074, 1.125959, 1, 1, 1, 1, 1,
0.5024239, -1.100424, 0.7366628, 1, 1, 1, 1, 1,
0.5028066, 0.2609023, 1.957994, 1, 1, 1, 1, 1,
0.5042179, -0.9597056, 0.510743, 1, 1, 1, 1, 1,
0.5044925, -0.3755161, 1.665928, 1, 1, 1, 1, 1,
0.5116504, -1.368556, 3.846329, 1, 1, 1, 1, 1,
0.5127012, -0.7346445, 2.305397, 1, 1, 1, 1, 1,
0.5203102, 0.2552544, 3.907958, 1, 1, 1, 1, 1,
0.5225451, 1.635205, 0.6073314, 1, 1, 1, 1, 1,
0.5258653, -0.3526182, 1.604255, 1, 1, 1, 1, 1,
0.5264093, 0.547207, 0.3915423, 1, 1, 1, 1, 1,
0.5283145, -0.9414268, 1.199768, 1, 1, 1, 1, 1,
0.5291405, 0.89152, -0.3521791, 0, 0, 1, 1, 1,
0.5300136, 0.03930343, -0.4838304, 1, 0, 0, 1, 1,
0.530462, 0.7995306, -0.3948803, 1, 0, 0, 1, 1,
0.5314066, -0.3953364, 3.508599, 1, 0, 0, 1, 1,
0.5354557, -0.5179814, 2.447183, 1, 0, 0, 1, 1,
0.537295, -1.539011, 1.828311, 1, 0, 0, 1, 1,
0.5409393, 0.6403308, 0.457237, 0, 0, 0, 1, 1,
0.54353, -1.311211, 4.12829, 0, 0, 0, 1, 1,
0.5451051, -0.004692345, 0.1881021, 0, 0, 0, 1, 1,
0.5471412, -0.9027688, 2.913141, 0, 0, 0, 1, 1,
0.550165, -0.6172981, 3.271149, 0, 0, 0, 1, 1,
0.5503399, 0.1294747, 2.704495, 0, 0, 0, 1, 1,
0.5551355, 0.6710699, 1.655489, 0, 0, 0, 1, 1,
0.5570456, -1.688082, 3.494847, 1, 1, 1, 1, 1,
0.5590137, -0.1425552, 1.437476, 1, 1, 1, 1, 1,
0.5597916, -3.571997, 3.265099, 1, 1, 1, 1, 1,
0.5656347, 0.471597, 2.460531, 1, 1, 1, 1, 1,
0.5683925, -0.1834899, 0.5374225, 1, 1, 1, 1, 1,
0.5785868, -1.590694, 2.983397, 1, 1, 1, 1, 1,
0.5846184, -0.07200525, 2.143047, 1, 1, 1, 1, 1,
0.5950743, 0.6392702, 1.88696, 1, 1, 1, 1, 1,
0.5955443, 0.3360166, 0.8248297, 1, 1, 1, 1, 1,
0.5967726, 0.2334926, 1.126051, 1, 1, 1, 1, 1,
0.6034899, -0.008782103, 1.675154, 1, 1, 1, 1, 1,
0.6049039, 1.416112, 1.419078, 1, 1, 1, 1, 1,
0.6071805, 0.696595, 0.7076923, 1, 1, 1, 1, 1,
0.6090755, -0.5302802, 2.481378, 1, 1, 1, 1, 1,
0.6103919, -0.7902853, 1.628478, 1, 1, 1, 1, 1,
0.6127746, -0.5476837, 2.070091, 0, 0, 1, 1, 1,
0.6149296, 0.9826605, 0.07685519, 1, 0, 0, 1, 1,
0.6194906, 0.8688039, 0.2653661, 1, 0, 0, 1, 1,
0.6236181, 1.181577, -0.3752981, 1, 0, 0, 1, 1,
0.6258948, 0.6382864, -0.6073108, 1, 0, 0, 1, 1,
0.6264191, 0.6595781, 1.700584, 1, 0, 0, 1, 1,
0.6332023, 1.620829, 0.6883653, 0, 0, 0, 1, 1,
0.635865, 0.5403158, 1.054232, 0, 0, 0, 1, 1,
0.6465191, -1.039746, 4.677357, 0, 0, 0, 1, 1,
0.6484664, 0.243353, 0.9890726, 0, 0, 0, 1, 1,
0.6556395, -0.9803473, 2.975947, 0, 0, 0, 1, 1,
0.6595817, -0.6829134, 1.561916, 0, 0, 0, 1, 1,
0.6620928, -1.521141, 0.9454293, 0, 0, 0, 1, 1,
0.6633242, -0.221607, 2.184388, 1, 1, 1, 1, 1,
0.6697187, -0.4477278, 3.224886, 1, 1, 1, 1, 1,
0.6744787, -0.4386446, 2.042376, 1, 1, 1, 1, 1,
0.6749809, 0.5693376, 1.38496, 1, 1, 1, 1, 1,
0.6769257, 2.035855, -0.5100143, 1, 1, 1, 1, 1,
0.6930895, -0.01396808, 3.033497, 1, 1, 1, 1, 1,
0.6999548, 0.3493285, 0.7148176, 1, 1, 1, 1, 1,
0.7001973, 1.008359, 2.075502, 1, 1, 1, 1, 1,
0.7110881, -0.3629033, 0.3543147, 1, 1, 1, 1, 1,
0.7119851, 0.8184058, -0.9010538, 1, 1, 1, 1, 1,
0.7140413, 2.393975, 1.450747, 1, 1, 1, 1, 1,
0.7248908, 3.534974, -0.2787786, 1, 1, 1, 1, 1,
0.7299771, 0.302929, 1.351458, 1, 1, 1, 1, 1,
0.7306791, -0.05849555, 1.151279, 1, 1, 1, 1, 1,
0.7345142, 0.08512656, 1.669422, 1, 1, 1, 1, 1,
0.7345236, 2.798807, 0.02962326, 0, 0, 1, 1, 1,
0.7389191, 0.7454469, 0.9240311, 1, 0, 0, 1, 1,
0.7410957, -0.4853244, 2.00662, 1, 0, 0, 1, 1,
0.7425187, -1.57447, 3.356416, 1, 0, 0, 1, 1,
0.7455168, 0.4815828, 0.1861956, 1, 0, 0, 1, 1,
0.748434, 0.5963189, 0.506956, 1, 0, 0, 1, 1,
0.7523246, -0.9055759, 1.849351, 0, 0, 0, 1, 1,
0.7656584, -1.35952, 2.351569, 0, 0, 0, 1, 1,
0.7677616, -0.7239689, 2.214277, 0, 0, 0, 1, 1,
0.7745931, -0.2497812, 1.871231, 0, 0, 0, 1, 1,
0.7772931, -0.8540158, 1.481511, 0, 0, 0, 1, 1,
0.7781548, 0.3401093, 0.9930065, 0, 0, 0, 1, 1,
0.781288, 0.8356602, 0.6705929, 0, 0, 0, 1, 1,
0.7830867, 0.2124514, 1.672677, 1, 1, 1, 1, 1,
0.7912503, 0.03828251, 0.6249012, 1, 1, 1, 1, 1,
0.7916678, -0.2672088, 2.095902, 1, 1, 1, 1, 1,
0.7950483, 0.5120196, 2.506063, 1, 1, 1, 1, 1,
0.7951925, 0.6065795, 0.1613754, 1, 1, 1, 1, 1,
0.7960644, -0.006072485, 1.739822, 1, 1, 1, 1, 1,
0.7994446, -1.402946, 3.212682, 1, 1, 1, 1, 1,
0.8003004, -0.4687745, 1.868213, 1, 1, 1, 1, 1,
0.8006917, 0.1044869, 3.369549, 1, 1, 1, 1, 1,
0.8012831, -0.5197687, 1.74418, 1, 1, 1, 1, 1,
0.803515, -0.3036247, 2.422177, 1, 1, 1, 1, 1,
0.8040889, -1.710592, 1.01367, 1, 1, 1, 1, 1,
0.8056954, -0.858994, 1.240587, 1, 1, 1, 1, 1,
0.8126231, 0.6832178, 1.202875, 1, 1, 1, 1, 1,
0.813477, 1.26746, 2.393484, 1, 1, 1, 1, 1,
0.8150478, 1.766768, 1.311962, 0, 0, 1, 1, 1,
0.8174593, 1.834369, 0.1572658, 1, 0, 0, 1, 1,
0.8185359, -0.9902247, 3.144553, 1, 0, 0, 1, 1,
0.8190713, 1.488639, 1.056962, 1, 0, 0, 1, 1,
0.826793, -1.54059, 3.521798, 1, 0, 0, 1, 1,
0.8336991, 0.5166284, 0.3740477, 1, 0, 0, 1, 1,
0.8347732, -0.4825642, 1.110288, 0, 0, 0, 1, 1,
0.8399525, -1.243577, 1.826364, 0, 0, 0, 1, 1,
0.8401656, -0.3181123, 1.850001, 0, 0, 0, 1, 1,
0.8441896, -0.195746, 1.221896, 0, 0, 0, 1, 1,
0.8450285, -0.9715543, 2.34972, 0, 0, 0, 1, 1,
0.8468771, -1.852029, 2.637475, 0, 0, 0, 1, 1,
0.8501272, -0.3253148, 0.7117526, 0, 0, 0, 1, 1,
0.8506358, -0.2076916, 3.527892, 1, 1, 1, 1, 1,
0.8556688, -2.144365, 3.648999, 1, 1, 1, 1, 1,
0.8566602, -0.7420491, 0.7142421, 1, 1, 1, 1, 1,
0.8637484, -0.2379019, 2.81508, 1, 1, 1, 1, 1,
0.8645405, 0.7749229, 0.7959085, 1, 1, 1, 1, 1,
0.872399, -0.4239382, 2.285994, 1, 1, 1, 1, 1,
0.8742843, -3.910598, 3.938008, 1, 1, 1, 1, 1,
0.8834392, -1.496676, 1.705759, 1, 1, 1, 1, 1,
0.8863729, -0.09600198, 0.6869507, 1, 1, 1, 1, 1,
0.8929346, 0.5366988, 1.339913, 1, 1, 1, 1, 1,
0.9017964, 1.166259, 0.9960905, 1, 1, 1, 1, 1,
0.901887, 0.5760872, 0.6128481, 1, 1, 1, 1, 1,
0.9041063, 0.3373288, 1.25121, 1, 1, 1, 1, 1,
0.9119173, -1.706897, 3.798799, 1, 1, 1, 1, 1,
0.9150071, 0.5088631, 1.351549, 1, 1, 1, 1, 1,
0.9159833, -0.6484071, 2.314223, 0, 0, 1, 1, 1,
0.9174564, 0.1316614, 1.471113, 1, 0, 0, 1, 1,
0.9179401, -1.297299, 2.046451, 1, 0, 0, 1, 1,
0.9213562, -1.155674, 3.434545, 1, 0, 0, 1, 1,
0.9230636, -0.997744, 2.618396, 1, 0, 0, 1, 1,
0.9232178, -0.3438942, 3.659407, 1, 0, 0, 1, 1,
0.9272791, 0.6902084, -1.009451, 0, 0, 0, 1, 1,
0.9348201, -0.8100995, 1.63467, 0, 0, 0, 1, 1,
0.9423565, 0.1834296, 1.693682, 0, 0, 0, 1, 1,
0.9443976, 1.29758, 0.2910939, 0, 0, 0, 1, 1,
0.9536739, 1.36395, 0.7177143, 0, 0, 0, 1, 1,
0.953814, -0.455591, 1.13317, 0, 0, 0, 1, 1,
0.9548789, -0.1706104, 1.020263, 0, 0, 0, 1, 1,
0.9596748, 0.2419579, 0.08654439, 1, 1, 1, 1, 1,
0.964117, 0.4556397, 2.979563, 1, 1, 1, 1, 1,
0.9696541, -1.068236, 2.533635, 1, 1, 1, 1, 1,
0.9754796, 0.04942719, 2.64449, 1, 1, 1, 1, 1,
0.9839971, 1.084378, 1.546525, 1, 1, 1, 1, 1,
0.9850989, -0.9955131, 0.952781, 1, 1, 1, 1, 1,
0.985664, 1.15827, -0.702718, 1, 1, 1, 1, 1,
0.9883074, 0.3124277, 1.351579, 1, 1, 1, 1, 1,
0.9884877, -1.05846, 1.925671, 1, 1, 1, 1, 1,
1.000728, -0.2753602, 1.808535, 1, 1, 1, 1, 1,
1.005538, -1.304179, 2.238338, 1, 1, 1, 1, 1,
1.00739, 0.6541694, 2.107769, 1, 1, 1, 1, 1,
1.008685, -1.041999, 1.535063, 1, 1, 1, 1, 1,
1.010596, 0.3296652, 2.898896, 1, 1, 1, 1, 1,
1.013739, 1.588644, -0.9423788, 1, 1, 1, 1, 1,
1.013955, -1.653229, 1.771397, 0, 0, 1, 1, 1,
1.014113, -0.2427751, 0.5013436, 1, 0, 0, 1, 1,
1.025396, 0.9604791, 2.606869, 1, 0, 0, 1, 1,
1.026303, 1.050787, 2.358988, 1, 0, 0, 1, 1,
1.027375, 0.072145, 1.747689, 1, 0, 0, 1, 1,
1.028652, -1.218851, 2.819344, 1, 0, 0, 1, 1,
1.029182, -2.03924, 2.894149, 0, 0, 0, 1, 1,
1.02994, 1.015304, 0.2692126, 0, 0, 0, 1, 1,
1.03372, 0.3136664, 1.479825, 0, 0, 0, 1, 1,
1.040141, -0.06957574, 0.2601705, 0, 0, 0, 1, 1,
1.042368, 0.3857116, 1.164817, 0, 0, 0, 1, 1,
1.043749, 1.328294, 2.38874, 0, 0, 0, 1, 1,
1.04875, 1.120601, 0.9619147, 0, 0, 0, 1, 1,
1.049696, -0.5066531, 1.646437, 1, 1, 1, 1, 1,
1.053987, 0.7066283, 1.557984, 1, 1, 1, 1, 1,
1.057238, -0.4817875, 1.906821, 1, 1, 1, 1, 1,
1.057312, -1.191939, 3.208149, 1, 1, 1, 1, 1,
1.075714, -0.8467751, 2.254716, 1, 1, 1, 1, 1,
1.077695, 1.003127, -0.8645883, 1, 1, 1, 1, 1,
1.079141, -0.892966, 3.398589, 1, 1, 1, 1, 1,
1.080811, -1.259358, 2.123958, 1, 1, 1, 1, 1,
1.083729, 0.3021317, 2.219378, 1, 1, 1, 1, 1,
1.088141, -1.526609, 3.464981, 1, 1, 1, 1, 1,
1.090629, 0.05314129, 0.8131921, 1, 1, 1, 1, 1,
1.09147, -0.1827835, 1.072557, 1, 1, 1, 1, 1,
1.092135, -0.1277891, 1.252469, 1, 1, 1, 1, 1,
1.097262, -0.0295994, 1.868572, 1, 1, 1, 1, 1,
1.100548, 0.7328638, 0.8015499, 1, 1, 1, 1, 1,
1.102342, -1.628524, 0.4497959, 0, 0, 1, 1, 1,
1.104068, 0.7159473, 0.4016126, 1, 0, 0, 1, 1,
1.106196, -0.5789674, 3.216056, 1, 0, 0, 1, 1,
1.109198, 0.1295275, 2.915983, 1, 0, 0, 1, 1,
1.129995, 1.870132, 1.117694, 1, 0, 0, 1, 1,
1.139032, -0.6091931, 0.7513673, 1, 0, 0, 1, 1,
1.149808, 0.9730473, 1.277968, 0, 0, 0, 1, 1,
1.149868, 3.143786, 3.050885, 0, 0, 0, 1, 1,
1.16948, 0.5812014, 0.2741049, 0, 0, 0, 1, 1,
1.169892, -0.07040867, 0.9120461, 0, 0, 0, 1, 1,
1.18985, -0.497771, 0.9848592, 0, 0, 0, 1, 1,
1.200213, -0.08426199, 1.892032, 0, 0, 0, 1, 1,
1.208052, -0.2192653, 1.724917, 0, 0, 0, 1, 1,
1.208213, 1.333, 1.450424, 1, 1, 1, 1, 1,
1.211839, -0.1325184, 1.808342, 1, 1, 1, 1, 1,
1.219657, -0.7695008, 2.115481, 1, 1, 1, 1, 1,
1.225662, 0.1002868, 1.454607, 1, 1, 1, 1, 1,
1.230909, 0.4044404, 1.912592, 1, 1, 1, 1, 1,
1.242281, 0.4079626, 1.307088, 1, 1, 1, 1, 1,
1.270524, 0.46276, 1.581438, 1, 1, 1, 1, 1,
1.270903, 0.8597149, 1.227104, 1, 1, 1, 1, 1,
1.279758, 0.7725679, 0.2311751, 1, 1, 1, 1, 1,
1.29067, 0.3051162, -0.3741778, 1, 1, 1, 1, 1,
1.294253, -0.7681563, 1.312487, 1, 1, 1, 1, 1,
1.308599, 0.8014777, 0.6579578, 1, 1, 1, 1, 1,
1.312183, 0.7889026, -0.06378348, 1, 1, 1, 1, 1,
1.322591, -0.02294226, 0.5380176, 1, 1, 1, 1, 1,
1.332836, -0.183822, 3.07326, 1, 1, 1, 1, 1,
1.345767, -0.3169529, 2.427589, 0, 0, 1, 1, 1,
1.347059, -0.7830031, 2.63671, 1, 0, 0, 1, 1,
1.351073, -0.3537748, 1.830512, 1, 0, 0, 1, 1,
1.356566, 0.6748725, 2.201319, 1, 0, 0, 1, 1,
1.357379, 1.50296, -0.2253068, 1, 0, 0, 1, 1,
1.362299, -0.3305016, 1.907663, 1, 0, 0, 1, 1,
1.368983, 0.8888637, 0.9675092, 0, 0, 0, 1, 1,
1.388768, 0.2821943, 0.8498449, 0, 0, 0, 1, 1,
1.389008, -0.1633202, 2.114934, 0, 0, 0, 1, 1,
1.402219, 0.7978757, 1.833401, 0, 0, 0, 1, 1,
1.412304, -0.2213613, 2.631482, 0, 0, 0, 1, 1,
1.414917, 0.6029243, 0.4413496, 0, 0, 0, 1, 1,
1.420809, 1.403866, 1.433779, 0, 0, 0, 1, 1,
1.423213, -1.302155, 0.2928671, 1, 1, 1, 1, 1,
1.427715, 0.5304416, -0.0968423, 1, 1, 1, 1, 1,
1.439235, 1.270042, 2.072578, 1, 1, 1, 1, 1,
1.442207, 1.016565, 0.7359379, 1, 1, 1, 1, 1,
1.445346, 0.4120272, 1.354395, 1, 1, 1, 1, 1,
1.454006, 0.3376269, 2.377583, 1, 1, 1, 1, 1,
1.460047, -1.255604, 2.247296, 1, 1, 1, 1, 1,
1.473261, 0.2207206, 2.050992, 1, 1, 1, 1, 1,
1.485477, -0.1058319, 0.6678042, 1, 1, 1, 1, 1,
1.493525, -0.8541661, 2.200356, 1, 1, 1, 1, 1,
1.506128, -2.039186, 1.744429, 1, 1, 1, 1, 1,
1.513476, -1.221705, 2.059197, 1, 1, 1, 1, 1,
1.515455, 0.2998717, 1.025307, 1, 1, 1, 1, 1,
1.520269, -0.3905511, 0.1055306, 1, 1, 1, 1, 1,
1.521022, 0.7760115, 1.237041, 1, 1, 1, 1, 1,
1.529548, 0.7303058, 2.741261, 0, 0, 1, 1, 1,
1.532448, 1.206805, -0.004469234, 1, 0, 0, 1, 1,
1.53302, -2.962198, 2.801394, 1, 0, 0, 1, 1,
1.538067, 0.9494017, 2.0197, 1, 0, 0, 1, 1,
1.538217, -0.6108128, 1.290536, 1, 0, 0, 1, 1,
1.546228, -0.6626388, 2.427034, 1, 0, 0, 1, 1,
1.564729, -0.7321988, 0.3611652, 0, 0, 0, 1, 1,
1.568067, -0.7400051, 4.001362, 0, 0, 0, 1, 1,
1.576962, 0.1733863, 1.468236, 0, 0, 0, 1, 1,
1.591034, 1.322116, 0.5956697, 0, 0, 0, 1, 1,
1.60165, 1.401379, 0.596767, 0, 0, 0, 1, 1,
1.601763, -0.6661406, 2.797731, 0, 0, 0, 1, 1,
1.602319, -0.05328134, 1.06598, 0, 0, 0, 1, 1,
1.619301, -0.09557885, 3.457416, 1, 1, 1, 1, 1,
1.629695, 1.211338, 4.244938, 1, 1, 1, 1, 1,
1.631823, 0.8007819, 2.681087, 1, 1, 1, 1, 1,
1.648045, 0.6634934, 4.133474, 1, 1, 1, 1, 1,
1.661242, 0.07519203, 2.241162, 1, 1, 1, 1, 1,
1.663803, -0.5648579, 1.848596, 1, 1, 1, 1, 1,
1.664813, -1.622159, 3.112606, 1, 1, 1, 1, 1,
1.665533, -0.5155917, 2.745466, 1, 1, 1, 1, 1,
1.684132, 0.4353959, 2.182813, 1, 1, 1, 1, 1,
1.685595, 0.4993735, 1.486826, 1, 1, 1, 1, 1,
1.688438, 0.8458921, 1.124555, 1, 1, 1, 1, 1,
1.695537, 0.7378176, 2.920096, 1, 1, 1, 1, 1,
1.714702, 0.1794877, 0.9331903, 1, 1, 1, 1, 1,
1.718364, 1.47854, -0.08484174, 1, 1, 1, 1, 1,
1.733009, -0.6275982, 0.176106, 1, 1, 1, 1, 1,
1.746337, 0.3594117, 1.210562, 0, 0, 1, 1, 1,
1.751523, -1.066846, 2.949903, 1, 0, 0, 1, 1,
1.757295, 0.2871795, 0.4706487, 1, 0, 0, 1, 1,
1.763655, -2.562871, 1.245963, 1, 0, 0, 1, 1,
1.775298, 0.5006865, 1.415561, 1, 0, 0, 1, 1,
1.784399, 0.414099, 1.687444, 1, 0, 0, 1, 1,
1.784875, -0.7590809, 2.244937, 0, 0, 0, 1, 1,
1.818572, 0.4717338, 0.1854836, 0, 0, 0, 1, 1,
1.821475, 0.7729488, 0.3490012, 0, 0, 0, 1, 1,
1.839477, -0.9478651, 3.046136, 0, 0, 0, 1, 1,
1.843169, 0.9543973, 2.296496, 0, 0, 0, 1, 1,
1.843723, -1.216644, 4.187109, 0, 0, 0, 1, 1,
1.845565, -1.172728, 0.681526, 0, 0, 0, 1, 1,
1.867295, -0.09332102, 1.151722, 1, 1, 1, 1, 1,
1.86783, -1.247432, 4.952883, 1, 1, 1, 1, 1,
1.874474, -1.34509, 1.959409, 1, 1, 1, 1, 1,
1.90532, 0.2683089, 1.926057, 1, 1, 1, 1, 1,
1.929046, -0.4269112, 2.457862, 1, 1, 1, 1, 1,
1.937086, -1.322156, 3.359362, 1, 1, 1, 1, 1,
1.954557, -0.6850175, 2.053053, 1, 1, 1, 1, 1,
1.984819, -1.415372, 2.18076, 1, 1, 1, 1, 1,
2.025313, 0.4863112, 0.09735257, 1, 1, 1, 1, 1,
2.03862, 0.3647037, 1.146164, 1, 1, 1, 1, 1,
2.047246, -1.014349, 0.5284309, 1, 1, 1, 1, 1,
2.055518, 1.205971, 0.3576423, 1, 1, 1, 1, 1,
2.059131, -0.7667214, 1.629696, 1, 1, 1, 1, 1,
2.083182, -0.06728391, 0.3095008, 1, 1, 1, 1, 1,
2.088316, 0.4070404, 2.504672, 1, 1, 1, 1, 1,
2.090962, -0.6211756, 3.52816, 0, 0, 1, 1, 1,
2.101114, 1.358505, 2.712029, 1, 0, 0, 1, 1,
2.123711, -0.2318089, 1.590103, 1, 0, 0, 1, 1,
2.136569, 0.6395252, 2.03995, 1, 0, 0, 1, 1,
2.145113, -0.3937072, 1.429477, 1, 0, 0, 1, 1,
2.173827, -0.472994, 1.486831, 1, 0, 0, 1, 1,
2.188247, 0.6429378, 2.820375, 0, 0, 0, 1, 1,
2.205498, -0.1329856, 2.901277, 0, 0, 0, 1, 1,
2.209081, 1.726018, 2.472646, 0, 0, 0, 1, 1,
2.242982, -2.094246, 1.178908, 0, 0, 0, 1, 1,
2.332607, -1.448086, 2.333451, 0, 0, 0, 1, 1,
2.373629, -0.9062991, 1.257137, 0, 0, 0, 1, 1,
2.441519, -1.021579, 1.373133, 0, 0, 0, 1, 1,
2.474746, -0.1443539, 2.96403, 1, 1, 1, 1, 1,
2.535704, 0.2761733, 2.623929, 1, 1, 1, 1, 1,
2.541081, -0.1053786, 2.406238, 1, 1, 1, 1, 1,
2.565926, -0.4967835, 3.251163, 1, 1, 1, 1, 1,
2.584141, 0.8996986, 1.023885, 1, 1, 1, 1, 1,
2.590433, -0.6853219, 1.887614, 1, 1, 1, 1, 1,
2.610476, 1.679788, 0.109463, 1, 1, 1, 1, 1
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
var radius = 9.7733;
var distance = 34.3283;
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
mvMatrix.translate( 0.3230079, 0.1878119, 0.2698178 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.3283);
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