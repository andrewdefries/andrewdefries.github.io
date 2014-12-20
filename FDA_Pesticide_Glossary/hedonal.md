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
-2.871673, -0.2689686, -1.715073, 1, 0, 0, 1,
-2.769695, 0.3054635, -1.47953, 1, 0.007843138, 0, 1,
-2.749943, 2.025205, -1.271528, 1, 0.01176471, 0, 1,
-2.717049, 1.682263, 0.04730183, 1, 0.01960784, 0, 1,
-2.708624, 0.2632252, -2.345036, 1, 0.02352941, 0, 1,
-2.648128, 0.4688624, -0.9885933, 1, 0.03137255, 0, 1,
-2.514589, 0.2972347, -1.184628, 1, 0.03529412, 0, 1,
-2.512387, 1.473066, -0.9484125, 1, 0.04313726, 0, 1,
-2.511614, -0.2049428, -1.328451, 1, 0.04705882, 0, 1,
-2.419087, -0.5530582, -2.070136, 1, 0.05490196, 0, 1,
-2.353882, -0.4821459, -3.415076, 1, 0.05882353, 0, 1,
-2.27589, -0.7590439, -0.3185284, 1, 0.06666667, 0, 1,
-2.260132, 0.3619046, -1.67586, 1, 0.07058824, 0, 1,
-2.255998, 0.6348624, -0.1258392, 1, 0.07843138, 0, 1,
-2.210884, -0.314565, -2.637043, 1, 0.08235294, 0, 1,
-2.16321, 0.9043376, 1.068643, 1, 0.09019608, 0, 1,
-2.092132, -0.03013813, -2.37355, 1, 0.09411765, 0, 1,
-1.96779, -0.8336701, -1.372067, 1, 0.1019608, 0, 1,
-1.966807, -0.3626807, -2.422575, 1, 0.1098039, 0, 1,
-1.946717, 0.069697, -2.575062, 1, 0.1137255, 0, 1,
-1.936026, -1.273283, -3.298227, 1, 0.1215686, 0, 1,
-1.920884, 2.193245, -0.5678768, 1, 0.1254902, 0, 1,
-1.916049, -2.091052, -3.319544, 1, 0.1333333, 0, 1,
-1.913001, -0.7310759, -1.655554, 1, 0.1372549, 0, 1,
-1.906756, -1.400964, -3.334694, 1, 0.145098, 0, 1,
-1.90607, -0.1999334, -1.580377, 1, 0.1490196, 0, 1,
-1.866448, -0.7600852, -1.601075, 1, 0.1568628, 0, 1,
-1.857719, 0.2169585, 1.232575, 1, 0.1607843, 0, 1,
-1.84373, -0.003285564, -1.851131, 1, 0.1686275, 0, 1,
-1.825103, 2.056346, 0.2980241, 1, 0.172549, 0, 1,
-1.811384, 1.400452, -1.432022, 1, 0.1803922, 0, 1,
-1.799675, 0.05163087, -0.7708938, 1, 0.1843137, 0, 1,
-1.792515, -0.894156, -0.5530112, 1, 0.1921569, 0, 1,
-1.781567, -0.007068711, -1.024125, 1, 0.1960784, 0, 1,
-1.77289, 0.9314014, -1.883056, 1, 0.2039216, 0, 1,
-1.73914, -1.488192, -2.548996, 1, 0.2117647, 0, 1,
-1.736076, -0.1017687, -3.942318, 1, 0.2156863, 0, 1,
-1.734761, -0.400062, -1.779124, 1, 0.2235294, 0, 1,
-1.733764, -1.842992, -3.416135, 1, 0.227451, 0, 1,
-1.733042, 0.0008961213, -3.522489, 1, 0.2352941, 0, 1,
-1.718428, 1.452273, -1.093552, 1, 0.2392157, 0, 1,
-1.683988, -2.965618, -2.474289, 1, 0.2470588, 0, 1,
-1.670702, 1.645428, -1.963751, 1, 0.2509804, 0, 1,
-1.668158, 1.102614, -0.02485356, 1, 0.2588235, 0, 1,
-1.663469, -0.3069577, -2.087506, 1, 0.2627451, 0, 1,
-1.661147, -0.2776605, -1.608739, 1, 0.2705882, 0, 1,
-1.650777, -1.174708, -1.373638, 1, 0.2745098, 0, 1,
-1.645168, 0.9348257, -0.9523382, 1, 0.282353, 0, 1,
-1.642685, -0.2657944, -1.069903, 1, 0.2862745, 0, 1,
-1.636617, 1.36062, 0.5075178, 1, 0.2941177, 0, 1,
-1.631781, 0.6974947, -0.9246039, 1, 0.3019608, 0, 1,
-1.608597, 0.2401043, 0.607066, 1, 0.3058824, 0, 1,
-1.603437, -0.3336407, -0.6503399, 1, 0.3137255, 0, 1,
-1.568029, -0.7547126, -4.083352, 1, 0.3176471, 0, 1,
-1.56293, 0.3441913, -3.233743, 1, 0.3254902, 0, 1,
-1.542852, -0.2553701, -2.992187, 1, 0.3294118, 0, 1,
-1.52532, -1.731208, -2.51919, 1, 0.3372549, 0, 1,
-1.524879, -1.156417, -1.922639, 1, 0.3411765, 0, 1,
-1.523414, -2.173666, -3.111868, 1, 0.3490196, 0, 1,
-1.522119, -0.6300457, -1.7713, 1, 0.3529412, 0, 1,
-1.515283, -0.2359178, -3.346158, 1, 0.3607843, 0, 1,
-1.501415, 0.239136, -2.241215, 1, 0.3647059, 0, 1,
-1.472192, 2.042258, 0.8902743, 1, 0.372549, 0, 1,
-1.4623, 0.4046289, -1.059662, 1, 0.3764706, 0, 1,
-1.457828, -0.4920669, -1.697309, 1, 0.3843137, 0, 1,
-1.444198, 1.732683, -0.8424572, 1, 0.3882353, 0, 1,
-1.430242, -0.03949811, -2.240558, 1, 0.3960784, 0, 1,
-1.42381, 0.9314832, -2.597168, 1, 0.4039216, 0, 1,
-1.413598, 2.484063, -0.5637891, 1, 0.4078431, 0, 1,
-1.399225, -0.8170143, -2.401114, 1, 0.4156863, 0, 1,
-1.38646, 0.5220957, -1.538818, 1, 0.4196078, 0, 1,
-1.374175, 1.000153, -1.026521, 1, 0.427451, 0, 1,
-1.373628, 0.765502, -2.347273, 1, 0.4313726, 0, 1,
-1.371746, -1.17229, -2.623798, 1, 0.4392157, 0, 1,
-1.365805, 0.7884784, 0.697405, 1, 0.4431373, 0, 1,
-1.362224, 0.8252768, -0.8332334, 1, 0.4509804, 0, 1,
-1.361285, -0.7020974, -3.69748, 1, 0.454902, 0, 1,
-1.355684, 0.6942594, -0.6970581, 1, 0.4627451, 0, 1,
-1.351948, -0.9655574, -0.6646951, 1, 0.4666667, 0, 1,
-1.348612, 1.704338, -0.4299255, 1, 0.4745098, 0, 1,
-1.348572, -0.9200116, -2.410897, 1, 0.4784314, 0, 1,
-1.343868, 0.9980421, 0.695389, 1, 0.4862745, 0, 1,
-1.340207, 0.4957282, -0.8658878, 1, 0.4901961, 0, 1,
-1.334803, 1.504851, -1.823647, 1, 0.4980392, 0, 1,
-1.325801, 0.2690853, 0.934966, 1, 0.5058824, 0, 1,
-1.320949, 0.1664682, -2.938509, 1, 0.509804, 0, 1,
-1.315745, 0.908926, -2.238467, 1, 0.5176471, 0, 1,
-1.314529, -0.0948846, -1.197441, 1, 0.5215687, 0, 1,
-1.306532, 1.728379, 0.3032437, 1, 0.5294118, 0, 1,
-1.305884, -0.2339952, -1.399618, 1, 0.5333334, 0, 1,
-1.304015, -0.4274235, -2.390553, 1, 0.5411765, 0, 1,
-1.303283, -0.9040518, -3.197552, 1, 0.5450981, 0, 1,
-1.297387, 0.9966582, 0.7456743, 1, 0.5529412, 0, 1,
-1.289864, 0.01100648, -2.404626, 1, 0.5568628, 0, 1,
-1.283602, -0.1395646, -0.5023045, 1, 0.5647059, 0, 1,
-1.27751, -1.366899, -1.634258, 1, 0.5686275, 0, 1,
-1.268078, 0.03684047, -2.899605, 1, 0.5764706, 0, 1,
-1.25474, 1.135966, -3.247965, 1, 0.5803922, 0, 1,
-1.24786, -1.297959, -3.478781, 1, 0.5882353, 0, 1,
-1.222406, 0.3957705, -0.2277467, 1, 0.5921569, 0, 1,
-1.197239, 1.608057, -0.9854365, 1, 0.6, 0, 1,
-1.196686, -1.660676, -2.075969, 1, 0.6078432, 0, 1,
-1.196159, -0.7257224, -3.084415, 1, 0.6117647, 0, 1,
-1.195575, -0.2616847, -0.2182435, 1, 0.6196079, 0, 1,
-1.181253, -1.826725, -2.327323, 1, 0.6235294, 0, 1,
-1.150717, -0.3974352, -2.529769, 1, 0.6313726, 0, 1,
-1.147624, -0.9984159, -0.1205922, 1, 0.6352941, 0, 1,
-1.147315, 0.3921488, -1.104275, 1, 0.6431373, 0, 1,
-1.147138, -0.6398542, -1.989902, 1, 0.6470588, 0, 1,
-1.139822, -1.147322, 0.6886902, 1, 0.654902, 0, 1,
-1.129358, -0.2143921, -3.152151, 1, 0.6588235, 0, 1,
-1.129202, -1.946365, -4.188103, 1, 0.6666667, 0, 1,
-1.127331, -0.05037969, -1.747797, 1, 0.6705883, 0, 1,
-1.126408, 1.119714, -0.6019465, 1, 0.6784314, 0, 1,
-1.121305, -0.4434193, -2.151761, 1, 0.682353, 0, 1,
-1.11651, -0.7153071, -1.871491, 1, 0.6901961, 0, 1,
-1.110517, -1.092398, -3.320743, 1, 0.6941177, 0, 1,
-1.105307, 1.749266, -0.361284, 1, 0.7019608, 0, 1,
-1.103032, -0.4591718, -1.479694, 1, 0.7098039, 0, 1,
-1.096023, 0.2288916, -1.924454, 1, 0.7137255, 0, 1,
-1.092572, -0.1160739, -0.8041152, 1, 0.7215686, 0, 1,
-1.088992, 1.23338, 1.209414, 1, 0.7254902, 0, 1,
-1.088064, -1.05937, -2.564879, 1, 0.7333333, 0, 1,
-1.085958, -0.05111171, -2.035639, 1, 0.7372549, 0, 1,
-1.081462, -0.2718235, -2.961377, 1, 0.7450981, 0, 1,
-1.074159, 0.1535125, -1.620537, 1, 0.7490196, 0, 1,
-1.073269, 1.02999, -0.1749482, 1, 0.7568628, 0, 1,
-1.072927, -0.2593696, -1.780904, 1, 0.7607843, 0, 1,
-1.072391, -0.1616754, -0.5261937, 1, 0.7686275, 0, 1,
-1.068375, -1.536249, -4.3241, 1, 0.772549, 0, 1,
-1.065153, -0.3950089, -1.953104, 1, 0.7803922, 0, 1,
-1.042711, 1.390006, -0.2060532, 1, 0.7843137, 0, 1,
-1.038154, 0.628884, -0.2167787, 1, 0.7921569, 0, 1,
-1.036454, -1.098355, -2.802814, 1, 0.7960784, 0, 1,
-1.030961, -2.129262, -5.015166, 1, 0.8039216, 0, 1,
-1.022763, 0.08685298, -2.169931, 1, 0.8117647, 0, 1,
-1.020415, -1.52824, -3.097937, 1, 0.8156863, 0, 1,
-1.019969, 0.07587993, -3.307463, 1, 0.8235294, 0, 1,
-1.019094, 1.256661, -1.106052, 1, 0.827451, 0, 1,
-1.01735, -0.7159044, -0.8659741, 1, 0.8352941, 0, 1,
-1.010358, 0.04484901, -2.292927, 1, 0.8392157, 0, 1,
-1.007567, 0.4465283, -2.034429, 1, 0.8470588, 0, 1,
-1.003097, 0.3084638, 1.309955, 1, 0.8509804, 0, 1,
-1.002768, -2.558755, -2.88069, 1, 0.8588235, 0, 1,
-0.9768635, 0.7685723, -1.309266, 1, 0.8627451, 0, 1,
-0.9691626, 2.342237, -0.8276355, 1, 0.8705882, 0, 1,
-0.9619299, -0.5554948, -1.80969, 1, 0.8745098, 0, 1,
-0.9580705, 0.7752659, -0.5973372, 1, 0.8823529, 0, 1,
-0.9484918, -0.7712155, -1.445464, 1, 0.8862745, 0, 1,
-0.9484113, 0.6474329, 0.9710343, 1, 0.8941177, 0, 1,
-0.9403121, -0.9937934, -2.223483, 1, 0.8980392, 0, 1,
-0.9382721, 0.6925215, -0.3704602, 1, 0.9058824, 0, 1,
-0.9265858, 0.3160711, -2.809128, 1, 0.9137255, 0, 1,
-0.9209169, -1.114428, -3.248255, 1, 0.9176471, 0, 1,
-0.9144425, -1.167064, -0.6081964, 1, 0.9254902, 0, 1,
-0.9105204, 0.4420113, -2.678145, 1, 0.9294118, 0, 1,
-0.9016759, 0.6726528, -2.074195, 1, 0.9372549, 0, 1,
-0.9002876, 0.2624114, -3.072763, 1, 0.9411765, 0, 1,
-0.9001366, 1.124598, 0.3252916, 1, 0.9490196, 0, 1,
-0.8964806, -0.8687783, -2.10629, 1, 0.9529412, 0, 1,
-0.8952839, 1.094566, 0.01885239, 1, 0.9607843, 0, 1,
-0.8898395, -1.24615, -3.138965, 1, 0.9647059, 0, 1,
-0.8892117, 1.496441, -0.3043246, 1, 0.972549, 0, 1,
-0.8843623, 1.665982, -0.3205881, 1, 0.9764706, 0, 1,
-0.883759, 1.425173, -0.3488525, 1, 0.9843137, 0, 1,
-0.8818288, 0.09622968, -0.7283023, 1, 0.9882353, 0, 1,
-0.8753912, -0.2121367, -1.263308, 1, 0.9960784, 0, 1,
-0.8721893, -0.8035926, -2.659156, 0.9960784, 1, 0, 1,
-0.8719147, -2.469081, -3.997728, 0.9921569, 1, 0, 1,
-0.8702799, 0.3788976, -1.374282, 0.9843137, 1, 0, 1,
-0.8671373, 0.03729847, -0.1363649, 0.9803922, 1, 0, 1,
-0.8657587, -0.8061044, -3.518898, 0.972549, 1, 0, 1,
-0.8648157, -0.5125579, -3.563575, 0.9686275, 1, 0, 1,
-0.8629978, -0.704921, -2.710565, 0.9607843, 1, 0, 1,
-0.855671, -0.8997256, -3.795964, 0.9568627, 1, 0, 1,
-0.8531964, -0.8540611, -4.013297, 0.9490196, 1, 0, 1,
-0.851589, 0.1410433, 0.1211277, 0.945098, 1, 0, 1,
-0.849877, -0.8960968, -0.7944705, 0.9372549, 1, 0, 1,
-0.8467456, -0.9093105, -2.528932, 0.9333333, 1, 0, 1,
-0.8458304, 0.7428259, -0.4620107, 0.9254902, 1, 0, 1,
-0.8431509, 0.1342915, -3.142478, 0.9215686, 1, 0, 1,
-0.8361072, -0.3281657, -4.680137, 0.9137255, 1, 0, 1,
-0.8196414, -0.4669481, -2.149664, 0.9098039, 1, 0, 1,
-0.8188156, -1.38818, -3.736987, 0.9019608, 1, 0, 1,
-0.8154085, -1.771642, -4.327653, 0.8941177, 1, 0, 1,
-0.8149846, 1.149222, -0.6943714, 0.8901961, 1, 0, 1,
-0.8091605, -1.318509, -4.137222, 0.8823529, 1, 0, 1,
-0.8090854, 1.240793, -0.7215979, 0.8784314, 1, 0, 1,
-0.8069882, -0.5599893, -2.632159, 0.8705882, 1, 0, 1,
-0.7980938, -0.01573665, -3.459207, 0.8666667, 1, 0, 1,
-0.7977497, 0.9236563, 1.291588, 0.8588235, 1, 0, 1,
-0.795333, -0.3849254, -3.157781, 0.854902, 1, 0, 1,
-0.7915406, -2.125182, -2.987437, 0.8470588, 1, 0, 1,
-0.7897291, -1.489446, -2.637803, 0.8431373, 1, 0, 1,
-0.7887569, 1.002548, -1.412186, 0.8352941, 1, 0, 1,
-0.7882534, 0.05390071, -2.59503, 0.8313726, 1, 0, 1,
-0.7848887, -0.303484, -0.438966, 0.8235294, 1, 0, 1,
-0.7824813, -0.7155047, -1.973752, 0.8196079, 1, 0, 1,
-0.7794116, -1.083491, -3.215164, 0.8117647, 1, 0, 1,
-0.7677365, 0.9999348, 0.4151054, 0.8078431, 1, 0, 1,
-0.7636111, 0.06185313, -1.42319, 0.8, 1, 0, 1,
-0.7608473, 1.641394, -1.079009, 0.7921569, 1, 0, 1,
-0.752258, -0.3515263, -1.935797, 0.7882353, 1, 0, 1,
-0.7484134, -0.6711653, -2.868425, 0.7803922, 1, 0, 1,
-0.7453131, -0.04703853, -2.919838, 0.7764706, 1, 0, 1,
-0.7446992, -1.801904, -3.824755, 0.7686275, 1, 0, 1,
-0.7438805, 0.9544185, -1.266975, 0.7647059, 1, 0, 1,
-0.7438316, 0.9973178, 0.4087958, 0.7568628, 1, 0, 1,
-0.7401865, -1.709226, -4.68756, 0.7529412, 1, 0, 1,
-0.7382445, -1.542345, -3.114842, 0.7450981, 1, 0, 1,
-0.7344266, -2.412119, -3.533934, 0.7411765, 1, 0, 1,
-0.732473, -0.1413472, -1.222162, 0.7333333, 1, 0, 1,
-0.7303002, 0.7392424, -0.5025325, 0.7294118, 1, 0, 1,
-0.7220481, 0.138132, -1.366871, 0.7215686, 1, 0, 1,
-0.7214495, -0.2623647, 0.003928621, 0.7176471, 1, 0, 1,
-0.7178409, 0.08312216, -2.151008, 0.7098039, 1, 0, 1,
-0.7177928, -0.4225961, -1.01773, 0.7058824, 1, 0, 1,
-0.7173005, -0.7257527, -1.274048, 0.6980392, 1, 0, 1,
-0.7168355, -1.702172, -2.336085, 0.6901961, 1, 0, 1,
-0.7151072, -0.911844, -0.5567716, 0.6862745, 1, 0, 1,
-0.7132167, -0.2076549, -2.274043, 0.6784314, 1, 0, 1,
-0.7122706, 0.7802866, -1.695932, 0.6745098, 1, 0, 1,
-0.7121446, 1.635507, -0.2804604, 0.6666667, 1, 0, 1,
-0.7062484, -2.057264, -3.205826, 0.6627451, 1, 0, 1,
-0.705636, 0.1318442, -0.4766915, 0.654902, 1, 0, 1,
-0.7045806, 0.5793468, -0.3430301, 0.6509804, 1, 0, 1,
-0.7016931, 0.1793875, -1.216707, 0.6431373, 1, 0, 1,
-0.7012507, -1.778616, -4.83158, 0.6392157, 1, 0, 1,
-0.6979619, 0.5938017, -2.052908, 0.6313726, 1, 0, 1,
-0.6911972, -0.7003371, -1.96814, 0.627451, 1, 0, 1,
-0.687804, 0.8004152, -1.402728, 0.6196079, 1, 0, 1,
-0.6860933, -1.962791, -1.837717, 0.6156863, 1, 0, 1,
-0.6833242, -0.8018267, -1.873237, 0.6078432, 1, 0, 1,
-0.6806192, 2.098488, 1.17848, 0.6039216, 1, 0, 1,
-0.6774285, -1.419345, -0.4376996, 0.5960785, 1, 0, 1,
-0.6698964, 1.441931, -2.309481, 0.5882353, 1, 0, 1,
-0.6692582, -0.04932704, -1.382867, 0.5843138, 1, 0, 1,
-0.6623937, 0.5059639, -1.477327, 0.5764706, 1, 0, 1,
-0.6610844, 0.4252508, -2.233753, 0.572549, 1, 0, 1,
-0.655147, 1.574412, -0.3692383, 0.5647059, 1, 0, 1,
-0.6498486, 0.5169954, -2.018612, 0.5607843, 1, 0, 1,
-0.6420655, 0.05758618, -0.9493657, 0.5529412, 1, 0, 1,
-0.63845, 0.4139669, -0.0563765, 0.5490196, 1, 0, 1,
-0.6383867, -0.8558995, -2.468632, 0.5411765, 1, 0, 1,
-0.6362039, -0.09778374, -3.200461, 0.5372549, 1, 0, 1,
-0.6287906, 0.432804, 0.09292567, 0.5294118, 1, 0, 1,
-0.6257676, -0.009250741, -2.375067, 0.5254902, 1, 0, 1,
-0.6214778, -0.0311901, -0.9881772, 0.5176471, 1, 0, 1,
-0.616775, 0.5789704, -0.8627082, 0.5137255, 1, 0, 1,
-0.6136114, 0.8751718, -2.144436, 0.5058824, 1, 0, 1,
-0.6058836, 0.8658909, -0.7465664, 0.5019608, 1, 0, 1,
-0.6056439, -0.2699116, -1.922718, 0.4941176, 1, 0, 1,
-0.6047967, -0.2149143, 0.07036258, 0.4862745, 1, 0, 1,
-0.6033612, 3.33294, -0.2049387, 0.4823529, 1, 0, 1,
-0.5979037, -0.8636599, -2.535424, 0.4745098, 1, 0, 1,
-0.5921299, 0.1674467, -1.718587, 0.4705882, 1, 0, 1,
-0.5910499, -1.759422, -2.423325, 0.4627451, 1, 0, 1,
-0.587306, 1.567349, -0.833431, 0.4588235, 1, 0, 1,
-0.5774502, -0.5901894, -1.658944, 0.4509804, 1, 0, 1,
-0.5722155, -0.09626167, -0.816991, 0.4470588, 1, 0, 1,
-0.5720883, 0.4209289, -0.3913888, 0.4392157, 1, 0, 1,
-0.5645975, -0.7413244, -2.22324, 0.4352941, 1, 0, 1,
-0.5617629, 0.3065362, 0.53251, 0.427451, 1, 0, 1,
-0.5584223, 0.08801584, -1.727047, 0.4235294, 1, 0, 1,
-0.5545101, 0.7082617, -2.473528, 0.4156863, 1, 0, 1,
-0.5481694, 0.9326014, -1.392766, 0.4117647, 1, 0, 1,
-0.5458762, 0.3957337, -1.033951, 0.4039216, 1, 0, 1,
-0.5440756, 0.002544487, -1.078675, 0.3960784, 1, 0, 1,
-0.5403097, 1.325012, 0.4138969, 0.3921569, 1, 0, 1,
-0.5368203, -0.5802507, -1.59356, 0.3843137, 1, 0, 1,
-0.5347403, 0.2347153, -1.195222, 0.3803922, 1, 0, 1,
-0.5338854, -0.1932515, -3.372709, 0.372549, 1, 0, 1,
-0.5321723, -1.189202, -2.854783, 0.3686275, 1, 0, 1,
-0.5315099, -0.6538526, -1.796111, 0.3607843, 1, 0, 1,
-0.5314559, 1.456666, 0.6094466, 0.3568628, 1, 0, 1,
-0.5284057, -1.659718, -3.707916, 0.3490196, 1, 0, 1,
-0.5277637, 1.125903, 0.3235841, 0.345098, 1, 0, 1,
-0.5259398, -1.672837, -2.554445, 0.3372549, 1, 0, 1,
-0.5240584, 1.179241, -0.03212348, 0.3333333, 1, 0, 1,
-0.5165642, -0.1362817, -0.7508649, 0.3254902, 1, 0, 1,
-0.5148361, -0.8547134, -0.6601655, 0.3215686, 1, 0, 1,
-0.5114866, 0.01317606, -2.675007, 0.3137255, 1, 0, 1,
-0.506183, -0.09110095, -1.065613, 0.3098039, 1, 0, 1,
-0.4967714, -0.5872377, -3.080907, 0.3019608, 1, 0, 1,
-0.4956098, 0.3881386, -0.5943589, 0.2941177, 1, 0, 1,
-0.4950666, 0.7849655, -0.9845766, 0.2901961, 1, 0, 1,
-0.494495, 0.6965236, -1.412608, 0.282353, 1, 0, 1,
-0.494094, -0.2722842, -4.381674, 0.2784314, 1, 0, 1,
-0.4929151, 0.03758757, -1.610696, 0.2705882, 1, 0, 1,
-0.4894832, -0.5681495, -2.93311, 0.2666667, 1, 0, 1,
-0.4879016, -1.129356, -3.852716, 0.2588235, 1, 0, 1,
-0.4870022, 1.512905, -1.162698, 0.254902, 1, 0, 1,
-0.4832205, 0.1588151, -0.4092843, 0.2470588, 1, 0, 1,
-0.4822272, -1.150535, -2.206055, 0.2431373, 1, 0, 1,
-0.4810833, -0.5050232, -2.457628, 0.2352941, 1, 0, 1,
-0.4798343, 0.6554728, -0.3836762, 0.2313726, 1, 0, 1,
-0.4760764, 1.023584, -1.50168, 0.2235294, 1, 0, 1,
-0.4759262, 0.5204035, -0.1930444, 0.2196078, 1, 0, 1,
-0.4752612, 0.9492962, 0.3551203, 0.2117647, 1, 0, 1,
-0.4751641, -0.654131, -3.324704, 0.2078431, 1, 0, 1,
-0.4732208, 0.1428259, -2.685536, 0.2, 1, 0, 1,
-0.4731462, 0.176772, 0.1250384, 0.1921569, 1, 0, 1,
-0.4669918, -0.9014906, -2.095769, 0.1882353, 1, 0, 1,
-0.4667293, -0.4344476, -0.6817831, 0.1803922, 1, 0, 1,
-0.4656096, 0.7919966, -0.744505, 0.1764706, 1, 0, 1,
-0.4633376, -1.057536, -3.980083, 0.1686275, 1, 0, 1,
-0.46319, 0.7461001, -1.664687, 0.1647059, 1, 0, 1,
-0.4575897, 0.2950239, -0.2058105, 0.1568628, 1, 0, 1,
-0.447321, -0.3618333, -2.883922, 0.1529412, 1, 0, 1,
-0.4462779, 1.081428, -0.29456, 0.145098, 1, 0, 1,
-0.4398906, 0.2248517, 0.3711108, 0.1411765, 1, 0, 1,
-0.4380394, -1.363405, -2.068789, 0.1333333, 1, 0, 1,
-0.4379983, -0.3123174, -0.8476365, 0.1294118, 1, 0, 1,
-0.4359824, 1.52461, 1.017072, 0.1215686, 1, 0, 1,
-0.4268933, 1.1053, -1.876149, 0.1176471, 1, 0, 1,
-0.4253232, 1.115661, -0.2022531, 0.1098039, 1, 0, 1,
-0.4227574, -1.276491, -2.738015, 0.1058824, 1, 0, 1,
-0.4206164, -0.5653409, -2.837503, 0.09803922, 1, 0, 1,
-0.4199876, 0.1618421, -2.433453, 0.09019608, 1, 0, 1,
-0.4192052, 0.2911377, -3.035594, 0.08627451, 1, 0, 1,
-0.4155224, -0.8675011, -2.802823, 0.07843138, 1, 0, 1,
-0.4153712, 0.8969374, -0.3043651, 0.07450981, 1, 0, 1,
-0.4103294, 0.8189312, -1.433761, 0.06666667, 1, 0, 1,
-0.4016363, -1.599426, -2.503566, 0.0627451, 1, 0, 1,
-0.3992035, -0.8641382, -2.74693, 0.05490196, 1, 0, 1,
-0.3939066, 0.09618215, -1.037671, 0.05098039, 1, 0, 1,
-0.3923236, -1.445456, -4.387769, 0.04313726, 1, 0, 1,
-0.3921048, 0.02262425, -1.097159, 0.03921569, 1, 0, 1,
-0.3862053, -0.4289276, -1.447114, 0.03137255, 1, 0, 1,
-0.3841831, 1.108164, 0.06809322, 0.02745098, 1, 0, 1,
-0.3785517, -0.2250133, -1.542273, 0.01960784, 1, 0, 1,
-0.3672428, -0.5695775, -3.068762, 0.01568628, 1, 0, 1,
-0.3660972, -1.460299, -2.293087, 0.007843138, 1, 0, 1,
-0.3660642, -2.196415, -2.077693, 0.003921569, 1, 0, 1,
-0.3633803, 1.322546, 0.9263958, 0, 1, 0.003921569, 1,
-0.3599904, -0.7455689, -1.353262, 0, 1, 0.01176471, 1,
-0.3584844, 1.735001, 0.6483607, 0, 1, 0.01568628, 1,
-0.357157, 0.1729582, 0.6183374, 0, 1, 0.02352941, 1,
-0.3491445, 1.029654, 0.1614106, 0, 1, 0.02745098, 1,
-0.3455088, 0.1087703, 0.0934018, 0, 1, 0.03529412, 1,
-0.3435643, -0.6297692, -1.407713, 0, 1, 0.03921569, 1,
-0.3384146, -1.351136, -4.204068, 0, 1, 0.04705882, 1,
-0.3373974, -0.5786474, -5.093635, 0, 1, 0.05098039, 1,
-0.3359457, -0.812821, -1.747251, 0, 1, 0.05882353, 1,
-0.3339797, 0.667645, -0.9070761, 0, 1, 0.0627451, 1,
-0.333322, 1.176066, 0.602401, 0, 1, 0.07058824, 1,
-0.3332498, 0.0583284, -1.152553, 0, 1, 0.07450981, 1,
-0.3321937, -0.637274, -2.547947, 0, 1, 0.08235294, 1,
-0.3297009, -0.2827732, -2.34784, 0, 1, 0.08627451, 1,
-0.327275, -1.081003, -3.997457, 0, 1, 0.09411765, 1,
-0.3261892, 1.336616, -1.689099, 0, 1, 0.1019608, 1,
-0.3261206, -2.067649, -2.968544, 0, 1, 0.1058824, 1,
-0.3225532, -0.9322019, -3.766691, 0, 1, 0.1137255, 1,
-0.3181318, -0.543621, -1.353063, 0, 1, 0.1176471, 1,
-0.3170913, -1.179317, -2.813475, 0, 1, 0.1254902, 1,
-0.3127295, 0.5676532, -2.13666, 0, 1, 0.1294118, 1,
-0.3115349, -2.101181, -4.053003, 0, 1, 0.1372549, 1,
-0.3112716, 0.2395082, -2.45466, 0, 1, 0.1411765, 1,
-0.3111132, -0.9659834, -2.267236, 0, 1, 0.1490196, 1,
-0.3102255, 0.4118403, -1.591198, 0, 1, 0.1529412, 1,
-0.3090859, 0.6909376, -1.750057, 0, 1, 0.1607843, 1,
-0.3083856, 0.09958739, -1.401913, 0, 1, 0.1647059, 1,
-0.3078355, 0.8283361, -1.387676, 0, 1, 0.172549, 1,
-0.3056395, -0.1695102, -0.00780554, 0, 1, 0.1764706, 1,
-0.3028223, 0.2353618, -1.390674, 0, 1, 0.1843137, 1,
-0.2989683, -0.5454848, -2.037763, 0, 1, 0.1882353, 1,
-0.2952776, -1.178244, -2.895565, 0, 1, 0.1960784, 1,
-0.2950813, -0.03236035, 0.3683949, 0, 1, 0.2039216, 1,
-0.2938027, -0.759389, -2.548269, 0, 1, 0.2078431, 1,
-0.2897067, -1.249072, -3.049726, 0, 1, 0.2156863, 1,
-0.2771543, 2.195925, -0.7546577, 0, 1, 0.2196078, 1,
-0.2747771, -1.096406, -2.404966, 0, 1, 0.227451, 1,
-0.2736412, 1.614127, 0.509568, 0, 1, 0.2313726, 1,
-0.2730694, -0.8719269, -3.156024, 0, 1, 0.2392157, 1,
-0.270909, 1.186924, 0.7716743, 0, 1, 0.2431373, 1,
-0.269616, 0.375807, 0.4334224, 0, 1, 0.2509804, 1,
-0.2695813, 0.3062975, -0.2021397, 0, 1, 0.254902, 1,
-0.2686329, -0.1226164, -1.457882, 0, 1, 0.2627451, 1,
-0.2666797, -2.027669, -2.7322, 0, 1, 0.2666667, 1,
-0.2663265, 0.3054931, -2.073128, 0, 1, 0.2745098, 1,
-0.2643749, 0.1886582, -1.267327, 0, 1, 0.2784314, 1,
-0.2584874, 0.859984, -2.272057, 0, 1, 0.2862745, 1,
-0.2567851, 1.112606, 0.4927931, 0, 1, 0.2901961, 1,
-0.2566636, 0.3856924, -3.187553, 0, 1, 0.2980392, 1,
-0.2518349, -0.2043425, -1.481589, 0, 1, 0.3058824, 1,
-0.25045, -0.2054756, -4.35196, 0, 1, 0.3098039, 1,
-0.2477448, 0.4849435, -0.03342552, 0, 1, 0.3176471, 1,
-0.2472529, 0.6118969, -0.06740209, 0, 1, 0.3215686, 1,
-0.246282, 0.8496069, -1.026898, 0, 1, 0.3294118, 1,
-0.2456751, -1.175152, -1.457889, 0, 1, 0.3333333, 1,
-0.2448622, -0.4127748, -1.832191, 0, 1, 0.3411765, 1,
-0.2427628, 1.144653, 0.164446, 0, 1, 0.345098, 1,
-0.2422049, -1.117209, -1.862199, 0, 1, 0.3529412, 1,
-0.2374695, 1.561351, 1.213066, 0, 1, 0.3568628, 1,
-0.2339134, -0.1266111, -2.711098, 0, 1, 0.3647059, 1,
-0.2314873, 0.2336191, -0.3020571, 0, 1, 0.3686275, 1,
-0.2265027, 0.840808, -1.455376, 0, 1, 0.3764706, 1,
-0.2262333, 1.293098, -0.7432004, 0, 1, 0.3803922, 1,
-0.2215864, -0.3820578, -1.773893, 0, 1, 0.3882353, 1,
-0.2186368, 1.569082, 0.1636068, 0, 1, 0.3921569, 1,
-0.2143573, -1.652621, -3.041208, 0, 1, 0.4, 1,
-0.2118415, -0.298461, -2.470685, 0, 1, 0.4078431, 1,
-0.2111407, -1.890121, -2.312463, 0, 1, 0.4117647, 1,
-0.2111028, -0.8195246, -4.174131, 0, 1, 0.4196078, 1,
-0.2035119, 0.4926015, -0.3591167, 0, 1, 0.4235294, 1,
-0.1997845, -0.2365107, -2.096835, 0, 1, 0.4313726, 1,
-0.1997149, 2.455727, 0.4780574, 0, 1, 0.4352941, 1,
-0.1972052, -1.859018, -3.716801, 0, 1, 0.4431373, 1,
-0.194282, -0.3386731, -2.727574, 0, 1, 0.4470588, 1,
-0.1933153, 1.819827, 0.9311256, 0, 1, 0.454902, 1,
-0.1856769, 0.4223479, 1.553946, 0, 1, 0.4588235, 1,
-0.1834388, 1.208314, -1.159011, 0, 1, 0.4666667, 1,
-0.1826933, -0.01084843, 0.5020621, 0, 1, 0.4705882, 1,
-0.1814337, 1.870366, -2.90091, 0, 1, 0.4784314, 1,
-0.177826, 0.2681249, -1.724262, 0, 1, 0.4823529, 1,
-0.1762194, -0.4364485, -3.768933, 0, 1, 0.4901961, 1,
-0.1732765, -1.349057, -3.738147, 0, 1, 0.4941176, 1,
-0.1658034, -0.01148727, -3.135934, 0, 1, 0.5019608, 1,
-0.1656553, -0.1755252, -1.879696, 0, 1, 0.509804, 1,
-0.1620734, -0.9630473, -3.82373, 0, 1, 0.5137255, 1,
-0.1610083, 0.3316796, -1.542046, 0, 1, 0.5215687, 1,
-0.1600866, -1.533372, -3.453326, 0, 1, 0.5254902, 1,
-0.1559154, -0.2371877, -0.8373727, 0, 1, 0.5333334, 1,
-0.1530924, 1.000619, 1.353477, 0, 1, 0.5372549, 1,
-0.1516459, -1.809891, -3.336816, 0, 1, 0.5450981, 1,
-0.1458665, -1.91592, -3.338468, 0, 1, 0.5490196, 1,
-0.1437005, 0.0782351, 0.576425, 0, 1, 0.5568628, 1,
-0.1423107, 1.022851, 1.414495, 0, 1, 0.5607843, 1,
-0.1410241, -0.1997268, -3.28985, 0, 1, 0.5686275, 1,
-0.1403445, 1.460492, -2.025674, 0, 1, 0.572549, 1,
-0.1378627, -0.4576264, -2.869401, 0, 1, 0.5803922, 1,
-0.1375273, 0.92783, -1.169953, 0, 1, 0.5843138, 1,
-0.1367821, -0.681823, 0.2472373, 0, 1, 0.5921569, 1,
-0.1331486, 1.070877, 0.4731049, 0, 1, 0.5960785, 1,
-0.132827, 0.5781397, -0.2625571, 0, 1, 0.6039216, 1,
-0.1328098, -2.154234, -4.179872, 0, 1, 0.6117647, 1,
-0.131632, -0.8870993, -3.385096, 0, 1, 0.6156863, 1,
-0.1313647, 1.206545, -0.1113755, 0, 1, 0.6235294, 1,
-0.1260453, -0.3420706, -2.729362, 0, 1, 0.627451, 1,
-0.1118783, -0.1031725, -1.626747, 0, 1, 0.6352941, 1,
-0.1118006, 0.5382293, -0.3846167, 0, 1, 0.6392157, 1,
-0.1070579, -0.1819907, -2.341484, 0, 1, 0.6470588, 1,
-0.1027941, 2.056794, 0.4386036, 0, 1, 0.6509804, 1,
-0.1025793, -0.495625, -3.961659, 0, 1, 0.6588235, 1,
-0.1016322, -0.6082393, -2.932169, 0, 1, 0.6627451, 1,
-0.1005427, 1.963812, -0.2738253, 0, 1, 0.6705883, 1,
-0.09879546, -1.308438, -2.731496, 0, 1, 0.6745098, 1,
-0.09164632, 0.9912822, 0.6880665, 0, 1, 0.682353, 1,
-0.08940077, 0.6297234, -2.264362, 0, 1, 0.6862745, 1,
-0.08844767, -0.03448436, -2.433427, 0, 1, 0.6941177, 1,
-0.08678077, -2.127145, -2.279858, 0, 1, 0.7019608, 1,
-0.08455503, 0.5083207, 0.3249525, 0, 1, 0.7058824, 1,
-0.08442752, 1.352827, -0.4038138, 0, 1, 0.7137255, 1,
-0.08120339, 0.5631343, 1.078627, 0, 1, 0.7176471, 1,
-0.08107706, -1.43404, -3.233132, 0, 1, 0.7254902, 1,
-0.08015545, -2.611003, -2.225206, 0, 1, 0.7294118, 1,
-0.07971002, 0.4062155, 0.9330716, 0, 1, 0.7372549, 1,
-0.0789117, -0.1973635, -3.096301, 0, 1, 0.7411765, 1,
-0.07707205, 0.6392794, 0.9879878, 0, 1, 0.7490196, 1,
-0.07203522, -1.319548, -3.004202, 0, 1, 0.7529412, 1,
-0.06482031, -2.122994, -2.80968, 0, 1, 0.7607843, 1,
-0.06336477, -1.466674, -3.221556, 0, 1, 0.7647059, 1,
-0.05587861, -1.345752, -0.6304088, 0, 1, 0.772549, 1,
-0.05564729, -1.259874, -3.083592, 0, 1, 0.7764706, 1,
-0.05529833, -0.4110584, -3.119494, 0, 1, 0.7843137, 1,
-0.04788989, -0.9947636, -2.00859, 0, 1, 0.7882353, 1,
-0.0422507, -0.1836623, -3.240091, 0, 1, 0.7960784, 1,
-0.04152286, -1.051097, -2.137742, 0, 1, 0.8039216, 1,
-0.04095605, 1.285905, 0.3527361, 0, 1, 0.8078431, 1,
-0.03756696, -0.5645131, -3.069398, 0, 1, 0.8156863, 1,
-0.03636738, -0.8822979, -3.39246, 0, 1, 0.8196079, 1,
-0.03356176, -1.964646, -2.582818, 0, 1, 0.827451, 1,
-0.03307527, 0.01344967, -1.605252, 0, 1, 0.8313726, 1,
-0.03007844, -1.736536, -3.348328, 0, 1, 0.8392157, 1,
-0.03004055, -1.309515, -4.862311, 0, 1, 0.8431373, 1,
-0.02778878, 0.412884, 0.7118607, 0, 1, 0.8509804, 1,
-0.02478307, -0.2547718, -2.265243, 0, 1, 0.854902, 1,
-0.01994826, -1.581222, -3.54408, 0, 1, 0.8627451, 1,
-0.0178209, -1.45707, -2.560791, 0, 1, 0.8666667, 1,
-0.01534765, 0.2885692, 0.3497873, 0, 1, 0.8745098, 1,
-0.01112526, -0.9949549, -3.764844, 0, 1, 0.8784314, 1,
-0.006716498, 0.2709841, -2.720768, 0, 1, 0.8862745, 1,
-0.003818218, -0.777612, -2.343551, 0, 1, 0.8901961, 1,
-0.002828183, -2.195781, -1.749783, 0, 1, 0.8980392, 1,
-0.001846411, 0.5547752, -1.238462, 0, 1, 0.9058824, 1,
0.001304517, 0.01036446, 1.263133, 0, 1, 0.9098039, 1,
0.002760028, 0.1708688, -0.615723, 0, 1, 0.9176471, 1,
0.005066822, 0.5691405, -0.4509093, 0, 1, 0.9215686, 1,
0.008052274, -0.3706566, 4.311089, 0, 1, 0.9294118, 1,
0.008215467, 0.8239879, -0.3310952, 0, 1, 0.9333333, 1,
0.008576045, -1.619144, 4.163653, 0, 1, 0.9411765, 1,
0.01607762, 0.5979349, -0.5767166, 0, 1, 0.945098, 1,
0.01619472, -1.007121, 1.614181, 0, 1, 0.9529412, 1,
0.01718003, 0.8700858, 0.3168694, 0, 1, 0.9568627, 1,
0.01793744, -0.3105923, 3.903347, 0, 1, 0.9647059, 1,
0.02287762, -0.5529456, 2.427537, 0, 1, 0.9686275, 1,
0.02375782, -0.8045732, 1.353459, 0, 1, 0.9764706, 1,
0.02561597, 1.674369, -1.215519, 0, 1, 0.9803922, 1,
0.02570243, -0.6751901, 2.782636, 0, 1, 0.9882353, 1,
0.02629399, 0.3417042, 1.519299, 0, 1, 0.9921569, 1,
0.02746832, -0.969363, 2.475671, 0, 1, 1, 1,
0.02832565, -0.1625988, 3.129735, 0, 0.9921569, 1, 1,
0.0304898, 0.08295664, -0.6983908, 0, 0.9882353, 1, 1,
0.03329824, -0.2579049, 3.044705, 0, 0.9803922, 1, 1,
0.03619522, 0.5193182, -0.2841553, 0, 0.9764706, 1, 1,
0.03681364, -0.4012772, 3.363643, 0, 0.9686275, 1, 1,
0.0368211, -0.6954572, 1.47298, 0, 0.9647059, 1, 1,
0.03859814, 0.28847, 0.2956011, 0, 0.9568627, 1, 1,
0.04022731, -1.643291, 2.239253, 0, 0.9529412, 1, 1,
0.04134058, 0.1649734, 0.5056939, 0, 0.945098, 1, 1,
0.0422806, -1.901576, 3.06813, 0, 0.9411765, 1, 1,
0.04917278, -1.101007, 1.672914, 0, 0.9333333, 1, 1,
0.04965316, -0.3970235, 4.097834, 0, 0.9294118, 1, 1,
0.05119123, 0.3118829, 1.035985, 0, 0.9215686, 1, 1,
0.0548415, -0.4346346, 2.852186, 0, 0.9176471, 1, 1,
0.05714941, -1.169586, 3.66232, 0, 0.9098039, 1, 1,
0.05772553, -0.5040731, 2.541851, 0, 0.9058824, 1, 1,
0.06048731, -0.2325106, 2.1158, 0, 0.8980392, 1, 1,
0.06140886, 1.54815, -0.5980783, 0, 0.8901961, 1, 1,
0.06537554, -1.955872, 3.772016, 0, 0.8862745, 1, 1,
0.06813589, 0.174568, 1.737033, 0, 0.8784314, 1, 1,
0.07599737, -0.8743457, 4.703184, 0, 0.8745098, 1, 1,
0.08329557, -1.599934, 2.957067, 0, 0.8666667, 1, 1,
0.08374117, 0.4045496, 1.450049, 0, 0.8627451, 1, 1,
0.08958082, -1.011197, 3.479733, 0, 0.854902, 1, 1,
0.09089123, 0.1371828, 1.691533, 0, 0.8509804, 1, 1,
0.09134042, 1.324935, -0.239563, 0, 0.8431373, 1, 1,
0.09618337, -1.017327, 3.140955, 0, 0.8392157, 1, 1,
0.09684354, -1.193296, 2.5923, 0, 0.8313726, 1, 1,
0.09803355, 0.7191138, 0.2368496, 0, 0.827451, 1, 1,
0.1005561, 0.6131676, -0.4781526, 0, 0.8196079, 1, 1,
0.1020766, 0.4222777, -1.559487, 0, 0.8156863, 1, 1,
0.1021534, -2.097852, 2.804699, 0, 0.8078431, 1, 1,
0.1081124, 1.146888, 0.3752252, 0, 0.8039216, 1, 1,
0.1127492, 0.4257621, 1.222913, 0, 0.7960784, 1, 1,
0.1212295, -0.5593713, 4.149551, 0, 0.7882353, 1, 1,
0.123023, -0.152305, 2.570206, 0, 0.7843137, 1, 1,
0.124228, -0.7929452, 3.496683, 0, 0.7764706, 1, 1,
0.1259313, 0.1328231, 2.430291, 0, 0.772549, 1, 1,
0.1280374, 0.2362988, 0.9756148, 0, 0.7647059, 1, 1,
0.1294671, -0.958999, 0.9209117, 0, 0.7607843, 1, 1,
0.1305755, -0.6721449, 3.998389, 0, 0.7529412, 1, 1,
0.1332657, -1.212347, 2.798786, 0, 0.7490196, 1, 1,
0.1336355, 1.463379, 1.921607, 0, 0.7411765, 1, 1,
0.1392321, -1.398268, 3.016792, 0, 0.7372549, 1, 1,
0.1478554, -1.403848, 2.676263, 0, 0.7294118, 1, 1,
0.1503101, -0.6816188, 4.878572, 0, 0.7254902, 1, 1,
0.1515118, 0.1015997, 0.5823728, 0, 0.7176471, 1, 1,
0.1524038, -1.8045, 3.312536, 0, 0.7137255, 1, 1,
0.152833, 0.02767478, 0.2245357, 0, 0.7058824, 1, 1,
0.154593, -1.998178, 3.703309, 0, 0.6980392, 1, 1,
0.1578881, 0.2818196, 0.07440568, 0, 0.6941177, 1, 1,
0.1604471, -0.4788745, 4.055406, 0, 0.6862745, 1, 1,
0.1628395, 1.313533, 1.904037, 0, 0.682353, 1, 1,
0.1634825, 0.6545513, 1.241887, 0, 0.6745098, 1, 1,
0.1660231, 2.641085, -0.4561668, 0, 0.6705883, 1, 1,
0.1677032, -0.2765226, 0.3377108, 0, 0.6627451, 1, 1,
0.1682207, 1.590951, -0.8497407, 0, 0.6588235, 1, 1,
0.1684482, -0.2363616, 3.824709, 0, 0.6509804, 1, 1,
0.174324, -0.0290251, 1.108369, 0, 0.6470588, 1, 1,
0.1750401, 0.4023923, 1.785019, 0, 0.6392157, 1, 1,
0.1760234, 1.081987, -1.449533, 0, 0.6352941, 1, 1,
0.1764389, 0.152778, 0.2291002, 0, 0.627451, 1, 1,
0.1791321, -0.8128695, 2.845962, 0, 0.6235294, 1, 1,
0.2019776, 1.546294, 0.4478195, 0, 0.6156863, 1, 1,
0.203218, -2.180804, 2.176056, 0, 0.6117647, 1, 1,
0.2041524, -1.115381, 3.477111, 0, 0.6039216, 1, 1,
0.2085039, 0.08894508, 1.677999, 0, 0.5960785, 1, 1,
0.210329, 0.2673385, 0.6433686, 0, 0.5921569, 1, 1,
0.2103572, 0.612459, 1.012808, 0, 0.5843138, 1, 1,
0.2146418, 0.1256929, 1.596292, 0, 0.5803922, 1, 1,
0.2199987, 0.1963682, 1.067097, 0, 0.572549, 1, 1,
0.2210444, -0.3923687, 2.068646, 0, 0.5686275, 1, 1,
0.2244252, -0.04203228, 1.12058, 0, 0.5607843, 1, 1,
0.2290078, -1.420068, 3.305859, 0, 0.5568628, 1, 1,
0.2299744, -0.2080285, 0.49228, 0, 0.5490196, 1, 1,
0.229982, 0.9669299, 0.3578131, 0, 0.5450981, 1, 1,
0.2306072, 0.8435125, 1.992191, 0, 0.5372549, 1, 1,
0.2327158, 0.9331359, 0.1642868, 0, 0.5333334, 1, 1,
0.2335484, -2.085078, 2.551587, 0, 0.5254902, 1, 1,
0.2378027, -0.8961843, 3.602069, 0, 0.5215687, 1, 1,
0.2387361, -0.3318505, 0.6886613, 0, 0.5137255, 1, 1,
0.2387976, -0.3858791, 1.812307, 0, 0.509804, 1, 1,
0.2398322, 0.2186774, 1.645682, 0, 0.5019608, 1, 1,
0.2409517, -1.431899, 3.447184, 0, 0.4941176, 1, 1,
0.2448046, 1.279855, -1.321037, 0, 0.4901961, 1, 1,
0.2469149, -0.628347, 1.707943, 0, 0.4823529, 1, 1,
0.2474526, 0.3767531, 0.1798583, 0, 0.4784314, 1, 1,
0.2491297, 0.5148121, -0.8144795, 0, 0.4705882, 1, 1,
0.2562396, 0.09425575, 1.647403, 0, 0.4666667, 1, 1,
0.2592692, -0.4691176, 2.944415, 0, 0.4588235, 1, 1,
0.2599151, 1.259646, 0.5153052, 0, 0.454902, 1, 1,
0.2660719, 0.1077796, 2.773938, 0, 0.4470588, 1, 1,
0.268565, 0.7206715, 0.4801102, 0, 0.4431373, 1, 1,
0.271572, -0.1287565, 2.312732, 0, 0.4352941, 1, 1,
0.2833615, -0.3554984, 2.393524, 0, 0.4313726, 1, 1,
0.2848311, 0.6232385, -0.6488937, 0, 0.4235294, 1, 1,
0.2860029, 0.3158166, 0.5156274, 0, 0.4196078, 1, 1,
0.2871063, 0.03076549, 2.509079, 0, 0.4117647, 1, 1,
0.2920229, 0.7240952, 0.1716955, 0, 0.4078431, 1, 1,
0.2960334, -0.8011574, 2.650308, 0, 0.4, 1, 1,
0.2987357, 0.09584525, 0.8162408, 0, 0.3921569, 1, 1,
0.2995873, 0.5796312, 1.749198, 0, 0.3882353, 1, 1,
0.3043674, -0.8877606, 3.48165, 0, 0.3803922, 1, 1,
0.3160509, -0.5692858, 1.797164, 0, 0.3764706, 1, 1,
0.3170868, 0.8401234, 0.1056096, 0, 0.3686275, 1, 1,
0.3181076, 0.05737114, 0.008460151, 0, 0.3647059, 1, 1,
0.320321, 1.964843, -0.3543639, 0, 0.3568628, 1, 1,
0.3210042, 0.2990889, 1.191428, 0, 0.3529412, 1, 1,
0.3280011, 0.3383437, 1.116962, 0, 0.345098, 1, 1,
0.3285822, 0.477082, 2.36894, 0, 0.3411765, 1, 1,
0.3309884, 1.313293, 1.126804, 0, 0.3333333, 1, 1,
0.3319685, -0.08281588, 1.798983, 0, 0.3294118, 1, 1,
0.3320754, 0.4361522, -1.414178, 0, 0.3215686, 1, 1,
0.3344555, 1.676609, 0.5963974, 0, 0.3176471, 1, 1,
0.3351258, 0.2726925, -0.7140638, 0, 0.3098039, 1, 1,
0.3374238, 0.4752664, -0.1310705, 0, 0.3058824, 1, 1,
0.3399843, 0.002555099, 2.483324, 0, 0.2980392, 1, 1,
0.3403983, 1.724137, -1.401427, 0, 0.2901961, 1, 1,
0.3424983, -0.4206399, 1.776815, 0, 0.2862745, 1, 1,
0.3445241, 1.294112, 1.054746, 0, 0.2784314, 1, 1,
0.3457183, -0.8340699, 2.785632, 0, 0.2745098, 1, 1,
0.3468925, -0.7345856, 4.163091, 0, 0.2666667, 1, 1,
0.3476228, 0.8037503, 1.181303, 0, 0.2627451, 1, 1,
0.3519787, 0.9078486, 1.1125, 0, 0.254902, 1, 1,
0.3529185, 0.5765977, 0.6517223, 0, 0.2509804, 1, 1,
0.3549034, 1.468708, 0.3018876, 0, 0.2431373, 1, 1,
0.3563597, -0.1027644, 3.737736, 0, 0.2392157, 1, 1,
0.3589073, -2.199782, 1.563338, 0, 0.2313726, 1, 1,
0.361456, 0.2163099, 0.7251576, 0, 0.227451, 1, 1,
0.3625717, 0.8359006, 1.158025, 0, 0.2196078, 1, 1,
0.3647121, 1.652966, -0.5909777, 0, 0.2156863, 1, 1,
0.3768057, 0.9240815, 0.9384491, 0, 0.2078431, 1, 1,
0.3787501, 1.15325, 0.7055608, 0, 0.2039216, 1, 1,
0.3831506, 0.2817974, 0.2091034, 0, 0.1960784, 1, 1,
0.3872649, -1.344355, 4.120452, 0, 0.1882353, 1, 1,
0.3883517, -1.571826, 4.488703, 0, 0.1843137, 1, 1,
0.3883584, -1.672946, 2.482572, 0, 0.1764706, 1, 1,
0.3888795, 0.08381978, 2.899562, 0, 0.172549, 1, 1,
0.3896979, 0.1659984, 2.693782, 0, 0.1647059, 1, 1,
0.3898984, -0.2114431, 2.525237, 0, 0.1607843, 1, 1,
0.3901242, -1.343058, 1.464032, 0, 0.1529412, 1, 1,
0.3921655, -0.6982051, 2.091085, 0, 0.1490196, 1, 1,
0.3936667, -1.429115, 2.461242, 0, 0.1411765, 1, 1,
0.3941594, 0.110967, 1.203212, 0, 0.1372549, 1, 1,
0.3978302, -0.4215513, 2.477371, 0, 0.1294118, 1, 1,
0.3979934, -0.1354513, 2.071492, 0, 0.1254902, 1, 1,
0.398948, -1.085747, 0.9920728, 0, 0.1176471, 1, 1,
0.4010921, 0.694247, 0.8770322, 0, 0.1137255, 1, 1,
0.4019698, -1.440907, 1.223173, 0, 0.1058824, 1, 1,
0.4034657, 0.2661082, -0.8346807, 0, 0.09803922, 1, 1,
0.4034838, 0.8671786, -0.371318, 0, 0.09411765, 1, 1,
0.4042604, 0.7703555, 0.9868371, 0, 0.08627451, 1, 1,
0.4045278, -0.3749333, 2.91451, 0, 0.08235294, 1, 1,
0.4055843, 0.4807694, 1.017271, 0, 0.07450981, 1, 1,
0.4128484, 1.34525, -0.09929728, 0, 0.07058824, 1, 1,
0.4152902, -1.542144, 3.993377, 0, 0.0627451, 1, 1,
0.4170384, 0.8818354, 0.6556715, 0, 0.05882353, 1, 1,
0.4178059, 0.1664342, 1.965312, 0, 0.05098039, 1, 1,
0.4230552, 1.629903, -0.6272414, 0, 0.04705882, 1, 1,
0.4248003, 0.1040208, 2.259957, 0, 0.03921569, 1, 1,
0.4284608, -0.06183797, 1.860778, 0, 0.03529412, 1, 1,
0.4325193, 0.2451361, 0.6431346, 0, 0.02745098, 1, 1,
0.4336551, 0.8903595, 0.9681481, 0, 0.02352941, 1, 1,
0.437551, -0.02657258, 0.8969309, 0, 0.01568628, 1, 1,
0.4383064, -0.4769168, 2.194586, 0, 0.01176471, 1, 1,
0.4390649, -0.8551012, 1.618233, 0, 0.003921569, 1, 1,
0.4402467, 0.6232776, 1.065138, 0.003921569, 0, 1, 1,
0.4417789, -0.03240972, 2.819435, 0.007843138, 0, 1, 1,
0.4468245, 1.205818, 0.2510147, 0.01568628, 0, 1, 1,
0.4502032, -0.2266306, 2.719716, 0.01960784, 0, 1, 1,
0.4515875, -1.118235, 1.065534, 0.02745098, 0, 1, 1,
0.4565624, -0.1575642, 2.447466, 0.03137255, 0, 1, 1,
0.4583749, 0.1609043, 2.079101, 0.03921569, 0, 1, 1,
0.4592584, -1.481868, 3.005135, 0.04313726, 0, 1, 1,
0.46067, -0.418604, 1.96315, 0.05098039, 0, 1, 1,
0.4618409, 0.8936252, 1.247657, 0.05490196, 0, 1, 1,
0.4667849, -0.1203424, 2.075884, 0.0627451, 0, 1, 1,
0.4682985, 0.2390244, 1.024452, 0.06666667, 0, 1, 1,
0.4693982, 0.6304741, 3.250515, 0.07450981, 0, 1, 1,
0.47326, 0.3848982, -0.08572719, 0.07843138, 0, 1, 1,
0.4756694, -1.433587, 4.443926, 0.08627451, 0, 1, 1,
0.4758834, -0.2748487, 1.826573, 0.09019608, 0, 1, 1,
0.4784859, -0.1771568, 1.632957, 0.09803922, 0, 1, 1,
0.4816251, 1.445052, 1.518735, 0.1058824, 0, 1, 1,
0.4845842, 0.3845329, 1.681821, 0.1098039, 0, 1, 1,
0.4871563, -0.02061856, 0.9448611, 0.1176471, 0, 1, 1,
0.4915671, 1.678911, 0.1929158, 0.1215686, 0, 1, 1,
0.4919725, -0.7875823, 2.364716, 0.1294118, 0, 1, 1,
0.4931115, -0.4336452, 3.157776, 0.1333333, 0, 1, 1,
0.4959391, -0.2682171, 1.25511, 0.1411765, 0, 1, 1,
0.4976807, 0.3023851, 0.1564562, 0.145098, 0, 1, 1,
0.5004381, -0.5995991, 3.547516, 0.1529412, 0, 1, 1,
0.5035603, -0.7690738, 4.352344, 0.1568628, 0, 1, 1,
0.5041969, -1.190311, 0.9503198, 0.1647059, 0, 1, 1,
0.5045156, -0.771223, 2.518296, 0.1686275, 0, 1, 1,
0.5066162, 0.8657962, -0.04235558, 0.1764706, 0, 1, 1,
0.5069407, 1.72106, 0.7085961, 0.1803922, 0, 1, 1,
0.5081465, 0.2675992, 0.7648703, 0.1882353, 0, 1, 1,
0.5099853, 0.4888367, 0.3302009, 0.1921569, 0, 1, 1,
0.5099996, -0.3111267, 0.4930948, 0.2, 0, 1, 1,
0.5112804, 0.01708967, 1.885802, 0.2078431, 0, 1, 1,
0.5123056, -0.9516231, 4.772094, 0.2117647, 0, 1, 1,
0.5132244, 2.383864, 2.371562, 0.2196078, 0, 1, 1,
0.5184076, -0.3577282, 4.262097, 0.2235294, 0, 1, 1,
0.5291242, 0.155729, 0.006028938, 0.2313726, 0, 1, 1,
0.5294144, -0.6775639, 2.496201, 0.2352941, 0, 1, 1,
0.5310079, 0.844427, -0.4195939, 0.2431373, 0, 1, 1,
0.5320623, 1.933967, 0.1326959, 0.2470588, 0, 1, 1,
0.5333663, 0.1374077, 1.82901, 0.254902, 0, 1, 1,
0.5351201, 1.059193, 0.9968155, 0.2588235, 0, 1, 1,
0.5429283, 0.0288318, 3.057225, 0.2666667, 0, 1, 1,
0.5437374, 1.612489, 2.084354, 0.2705882, 0, 1, 1,
0.5437438, 1.955647, 1.318526, 0.2784314, 0, 1, 1,
0.5460709, -0.163215, 3.074467, 0.282353, 0, 1, 1,
0.5501893, -1.724116, 2.164635, 0.2901961, 0, 1, 1,
0.5533657, 0.0338321, 0.729691, 0.2941177, 0, 1, 1,
0.5545924, 0.6399795, 1.760616, 0.3019608, 0, 1, 1,
0.5579937, -0.5950949, 3.665193, 0.3098039, 0, 1, 1,
0.5599544, -1.058978, 3.868666, 0.3137255, 0, 1, 1,
0.5606475, -1.729405, 3.53155, 0.3215686, 0, 1, 1,
0.5629975, 0.1852177, 1.482108, 0.3254902, 0, 1, 1,
0.5640478, 0.3295569, 1.995119, 0.3333333, 0, 1, 1,
0.5641801, 1.669151, -0.3911137, 0.3372549, 0, 1, 1,
0.5664378, 0.5881448, 0.327632, 0.345098, 0, 1, 1,
0.5669303, -1.340063, 3.239881, 0.3490196, 0, 1, 1,
0.5707036, 1.539973, 1.792227, 0.3568628, 0, 1, 1,
0.5721824, -0.2807421, 2.067592, 0.3607843, 0, 1, 1,
0.5765752, -0.4097209, 2.077959, 0.3686275, 0, 1, 1,
0.5772957, -1.743781, 4.030065, 0.372549, 0, 1, 1,
0.5859274, -0.5452581, 2.385799, 0.3803922, 0, 1, 1,
0.5861619, -2.5601, 2.295524, 0.3843137, 0, 1, 1,
0.5893589, -0.3929546, 2.549828, 0.3921569, 0, 1, 1,
0.5930725, 0.1789717, 2.365658, 0.3960784, 0, 1, 1,
0.5967664, 0.8208497, 1.696488, 0.4039216, 0, 1, 1,
0.5984403, -1.181081, 0.9918805, 0.4117647, 0, 1, 1,
0.6003176, -0.5254723, 1.87409, 0.4156863, 0, 1, 1,
0.6028864, -1.314255, 4.18416, 0.4235294, 0, 1, 1,
0.6060023, -0.02514776, 1.139251, 0.427451, 0, 1, 1,
0.6095201, 0.08513688, 1.116003, 0.4352941, 0, 1, 1,
0.6188486, 0.8363604, 0.4203516, 0.4392157, 0, 1, 1,
0.6199598, -0.8764703, 1.663861, 0.4470588, 0, 1, 1,
0.6201093, 2.072957, 0.5951056, 0.4509804, 0, 1, 1,
0.6295527, 2.06426, 0.1832213, 0.4588235, 0, 1, 1,
0.6309718, -0.3023233, 3.886482, 0.4627451, 0, 1, 1,
0.6325357, -1.548623, 2.118221, 0.4705882, 0, 1, 1,
0.6340273, -0.3460257, 2.932679, 0.4745098, 0, 1, 1,
0.6499076, 1.30499, -0.8662211, 0.4823529, 0, 1, 1,
0.6513684, 0.02979073, 3.388211, 0.4862745, 0, 1, 1,
0.6529726, 1.508341, -0.1312762, 0.4941176, 0, 1, 1,
0.6531944, 0.3664494, 0.4216714, 0.5019608, 0, 1, 1,
0.6553645, 0.421014, 1.491877, 0.5058824, 0, 1, 1,
0.6557773, 0.7558805, 0.9381096, 0.5137255, 0, 1, 1,
0.6571455, -2.559878, 3.374296, 0.5176471, 0, 1, 1,
0.6606065, -1.237139, 2.089086, 0.5254902, 0, 1, 1,
0.6655012, 1.299087, 1.860002, 0.5294118, 0, 1, 1,
0.6750515, 1.092939, 1.622094, 0.5372549, 0, 1, 1,
0.6774929, 1.104204, 1.544438, 0.5411765, 0, 1, 1,
0.6820261, -0.1502989, 0.6860163, 0.5490196, 0, 1, 1,
0.6832002, -0.02276707, 2.414483, 0.5529412, 0, 1, 1,
0.6861365, -1.163251, 3.641286, 0.5607843, 0, 1, 1,
0.6864599, 0.5770208, -0.8284206, 0.5647059, 0, 1, 1,
0.6905, -2.424434, 1.146296, 0.572549, 0, 1, 1,
0.6917509, -0.4542788, 2.397704, 0.5764706, 0, 1, 1,
0.6962858, 0.4695877, 1.91513, 0.5843138, 0, 1, 1,
0.7095738, -0.4698775, 2.462809, 0.5882353, 0, 1, 1,
0.7136518, 0.2809365, 1.167998, 0.5960785, 0, 1, 1,
0.7147852, 2.648664, 0.1627889, 0.6039216, 0, 1, 1,
0.7198638, -0.5378169, 2.419826, 0.6078432, 0, 1, 1,
0.7220242, -0.7374433, 2.08628, 0.6156863, 0, 1, 1,
0.7220899, -0.08870646, 0.3970457, 0.6196079, 0, 1, 1,
0.7243646, -1.951494, 2.856942, 0.627451, 0, 1, 1,
0.7311339, -0.04896727, 0.6948129, 0.6313726, 0, 1, 1,
0.7353768, -0.1520852, 1.311517, 0.6392157, 0, 1, 1,
0.7360405, -1.085451, 2.775939, 0.6431373, 0, 1, 1,
0.7378995, -1.027869, 3.214353, 0.6509804, 0, 1, 1,
0.7396911, -0.07235454, 2.784223, 0.654902, 0, 1, 1,
0.7397814, -0.2015074, 2.238602, 0.6627451, 0, 1, 1,
0.7476491, 0.8775992, 1.786296, 0.6666667, 0, 1, 1,
0.7510979, -0.7897673, 2.354345, 0.6745098, 0, 1, 1,
0.7511756, -0.1088217, 1.487316, 0.6784314, 0, 1, 1,
0.752578, -0.1048742, 0.4799537, 0.6862745, 0, 1, 1,
0.7582342, 1.078259, -1.366591, 0.6901961, 0, 1, 1,
0.7764862, 0.6770414, 0.8860924, 0.6980392, 0, 1, 1,
0.7789216, -0.597294, 2.575028, 0.7058824, 0, 1, 1,
0.7851121, 0.4370753, 1.980325, 0.7098039, 0, 1, 1,
0.7852771, 1.130596, 1.521877, 0.7176471, 0, 1, 1,
0.7865668, 0.05641528, 0.7899963, 0.7215686, 0, 1, 1,
0.7995881, -0.7270407, 2.832446, 0.7294118, 0, 1, 1,
0.8105542, -0.8422321, 0.6406904, 0.7333333, 0, 1, 1,
0.8150665, 0.4147955, 1.926033, 0.7411765, 0, 1, 1,
0.8166, -0.3774989, 1.376044, 0.7450981, 0, 1, 1,
0.817278, -0.01847383, 2.459795, 0.7529412, 0, 1, 1,
0.8183106, -0.007920275, 1.333429, 0.7568628, 0, 1, 1,
0.8191099, -0.6771008, 1.107421, 0.7647059, 0, 1, 1,
0.8249233, -0.2917093, 1.908517, 0.7686275, 0, 1, 1,
0.8288398, 0.1193774, 2.147048, 0.7764706, 0, 1, 1,
0.8406371, -1.194437, 1.435631, 0.7803922, 0, 1, 1,
0.8437866, 0.6689819, 0.3873999, 0.7882353, 0, 1, 1,
0.8451585, 0.09349976, 3.246562, 0.7921569, 0, 1, 1,
0.8467418, 1.467204, 0.3535922, 0.8, 0, 1, 1,
0.8590032, -0.2346562, 0.2546915, 0.8078431, 0, 1, 1,
0.8596125, -0.3992905, 0.6524302, 0.8117647, 0, 1, 1,
0.8629054, -0.3803101, 2.000313, 0.8196079, 0, 1, 1,
0.8639784, 0.1965142, 2.374053, 0.8235294, 0, 1, 1,
0.866231, 1.249816, 1.343673, 0.8313726, 0, 1, 1,
0.8705393, -1.180624, 1.99437, 0.8352941, 0, 1, 1,
0.8834159, 0.6549345, 1.068908, 0.8431373, 0, 1, 1,
0.8855511, -0.5002302, 3.970903, 0.8470588, 0, 1, 1,
0.8918429, 0.8573022, 1.563837, 0.854902, 0, 1, 1,
0.8922236, -0.761328, 1.602089, 0.8588235, 0, 1, 1,
0.8940402, 2.100764, -0.055531, 0.8666667, 0, 1, 1,
0.8963253, -1.583707, 2.137189, 0.8705882, 0, 1, 1,
0.9023477, -1.036459, 2.620728, 0.8784314, 0, 1, 1,
0.9039884, -0.198183, 0.444401, 0.8823529, 0, 1, 1,
0.911697, -0.5286701, 3.352166, 0.8901961, 0, 1, 1,
0.9210818, -0.7909942, 0.7561114, 0.8941177, 0, 1, 1,
0.9290616, -1.799139, 1.198193, 0.9019608, 0, 1, 1,
0.9325625, -0.2148566, 2.520049, 0.9098039, 0, 1, 1,
0.9342642, -0.898058, 2.671625, 0.9137255, 0, 1, 1,
0.9378302, 2.293731, 0.7076444, 0.9215686, 0, 1, 1,
0.9514297, 0.6176722, 0.1450361, 0.9254902, 0, 1, 1,
0.9529104, -2.516987, 2.950854, 0.9333333, 0, 1, 1,
0.957288, -1.38302, 2.263061, 0.9372549, 0, 1, 1,
0.9603811, -1.185795, 2.602653, 0.945098, 0, 1, 1,
0.9610128, -0.3919418, 0.8837291, 0.9490196, 0, 1, 1,
0.96365, -0.3820328, 1.467493, 0.9568627, 0, 1, 1,
0.9678133, 2.53327, -0.1083648, 0.9607843, 0, 1, 1,
0.969317, 1.408499, 1.745002, 0.9686275, 0, 1, 1,
0.9705299, -0.8484938, 2.523663, 0.972549, 0, 1, 1,
0.9713163, -0.739249, 0.132336, 0.9803922, 0, 1, 1,
0.9746297, -1.15062, 0.8856932, 0.9843137, 0, 1, 1,
0.9779029, 0.465078, 0.6232505, 0.9921569, 0, 1, 1,
0.9801252, -0.5793163, 1.797277, 0.9960784, 0, 1, 1,
0.9842323, -0.5904338, 4.030259, 1, 0, 0.9960784, 1,
0.9844385, -0.04208016, 0.8723481, 1, 0, 0.9882353, 1,
0.9916098, -0.1846876, 0.4462841, 1, 0, 0.9843137, 1,
0.9935372, -0.8080204, 2.907672, 1, 0, 0.9764706, 1,
0.9950344, -1.059504, 0.8366019, 1, 0, 0.972549, 1,
0.9959648, 1.843323, -1.733592, 1, 0, 0.9647059, 1,
0.9960737, 1.559778, 1.260827, 1, 0, 0.9607843, 1,
0.9976979, 0.887971, -0.5598546, 1, 0, 0.9529412, 1,
0.9980087, 0.08763149, 2.66625, 1, 0, 0.9490196, 1,
1.001137, 0.3360282, 1.167204, 1, 0, 0.9411765, 1,
1.00679, -0.4556782, 1.282187, 1, 0, 0.9372549, 1,
1.013825, 0.2857048, 2.041027, 1, 0, 0.9294118, 1,
1.016258, -1.128299, 2.910156, 1, 0, 0.9254902, 1,
1.020043, 1.249916, 1.151036, 1, 0, 0.9176471, 1,
1.03511, -0.3640703, 1.291581, 1, 0, 0.9137255, 1,
1.044059, 1.187657, 1.16548, 1, 0, 0.9058824, 1,
1.046243, -0.7017293, 2.528139, 1, 0, 0.9019608, 1,
1.049375, -0.595329, 2.264166, 1, 0, 0.8941177, 1,
1.055491, -0.630788, 0.697711, 1, 0, 0.8862745, 1,
1.059441, -0.4788642, 2.527817, 1, 0, 0.8823529, 1,
1.060727, -0.4733677, 2.684709, 1, 0, 0.8745098, 1,
1.069326, 0.2616917, 1.113766, 1, 0, 0.8705882, 1,
1.069886, 0.5878614, -0.4916016, 1, 0, 0.8627451, 1,
1.07144, -0.5473416, 2.791631, 1, 0, 0.8588235, 1,
1.076307, -0.1367965, 0.004109437, 1, 0, 0.8509804, 1,
1.080904, 0.3209517, 1.123952, 1, 0, 0.8470588, 1,
1.091082, -0.7836815, 1.928959, 1, 0, 0.8392157, 1,
1.100271, 0.07012194, 0.8809084, 1, 0, 0.8352941, 1,
1.11652, -0.09483703, 1.317038, 1, 0, 0.827451, 1,
1.119063, 0.8957351, 0.9261664, 1, 0, 0.8235294, 1,
1.125119, 0.05050325, 0.3459832, 1, 0, 0.8156863, 1,
1.125313, -0.8952732, 2.698917, 1, 0, 0.8117647, 1,
1.135543, 0.6547351, 1.772954, 1, 0, 0.8039216, 1,
1.138852, -1.591422, 2.427939, 1, 0, 0.7960784, 1,
1.138858, -0.05047947, 1.433472, 1, 0, 0.7921569, 1,
1.142998, -0.7693833, 3.080554, 1, 0, 0.7843137, 1,
1.1456, 0.5723182, -1.456881, 1, 0, 0.7803922, 1,
1.149095, 0.5265922, 2.000933, 1, 0, 0.772549, 1,
1.149517, 0.8485302, 0.4702281, 1, 0, 0.7686275, 1,
1.157171, -0.9426261, 1.513881, 1, 0, 0.7607843, 1,
1.158068, -0.5486765, 1.775864, 1, 0, 0.7568628, 1,
1.158092, 0.3709946, -1.222217, 1, 0, 0.7490196, 1,
1.166195, 0.0973582, 0.5131207, 1, 0, 0.7450981, 1,
1.178382, 1.604781, 0.6166262, 1, 0, 0.7372549, 1,
1.181465, 0.4804857, 2.183397, 1, 0, 0.7333333, 1,
1.19133, -0.7332784, 3.054209, 1, 0, 0.7254902, 1,
1.194498, -1.069849, 2.59007, 1, 0, 0.7215686, 1,
1.19683, 0.3045401, 1.822703, 1, 0, 0.7137255, 1,
1.198705, -1.172876, 1.67067, 1, 0, 0.7098039, 1,
1.198877, -0.01951378, 2.278254, 1, 0, 0.7019608, 1,
1.207085, -0.8230339, 2.291748, 1, 0, 0.6941177, 1,
1.208987, 0.5170017, -0.006798624, 1, 0, 0.6901961, 1,
1.215962, -0.6003734, 1.173736, 1, 0, 0.682353, 1,
1.217737, -1.406385, 2.401299, 1, 0, 0.6784314, 1,
1.219043, 0.7827868, 0.5820526, 1, 0, 0.6705883, 1,
1.229194, 0.4957851, 0.9166657, 1, 0, 0.6666667, 1,
1.240335, 0.2592312, 1.849357, 1, 0, 0.6588235, 1,
1.243044, -0.8826482, 3.311786, 1, 0, 0.654902, 1,
1.244098, -1.586404, 2.808558, 1, 0, 0.6470588, 1,
1.244817, -0.5797029, 3.337665, 1, 0, 0.6431373, 1,
1.258556, 0.330326, 0.3361583, 1, 0, 0.6352941, 1,
1.258592, -1.322455, 0.5262644, 1, 0, 0.6313726, 1,
1.263413, -0.1742358, 0.8523857, 1, 0, 0.6235294, 1,
1.264628, 1.692927, 0.3056234, 1, 0, 0.6196079, 1,
1.274091, 1.166983, 0.1846612, 1, 0, 0.6117647, 1,
1.278985, 1.047168, 0.7188721, 1, 0, 0.6078432, 1,
1.28516, -1.239565, 0.9183771, 1, 0, 0.6, 1,
1.287015, -0.9920414, 2.506821, 1, 0, 0.5921569, 1,
1.293104, -0.6962813, 1.909894, 1, 0, 0.5882353, 1,
1.307683, 0.5520786, -0.266102, 1, 0, 0.5803922, 1,
1.318817, 0.1140847, 1.092805, 1, 0, 0.5764706, 1,
1.324962, -0.06995938, 0.605171, 1, 0, 0.5686275, 1,
1.333837, 0.0259035, 1.011755, 1, 0, 0.5647059, 1,
1.335361, 1.1032, 1.094734, 1, 0, 0.5568628, 1,
1.34106, 0.1901331, 0.552772, 1, 0, 0.5529412, 1,
1.343266, 0.44195, 0.6048682, 1, 0, 0.5450981, 1,
1.354812, 0.5721233, 0.9602723, 1, 0, 0.5411765, 1,
1.355744, -1.027718, 1.991188, 1, 0, 0.5333334, 1,
1.371584, -0.05490283, 2.249248, 1, 0, 0.5294118, 1,
1.380336, -0.6900895, 1.028983, 1, 0, 0.5215687, 1,
1.384166, -0.2381086, 0.9203699, 1, 0, 0.5176471, 1,
1.385451, -1.27352, 1.338127, 1, 0, 0.509804, 1,
1.389856, 1.380731, 3.72325, 1, 0, 0.5058824, 1,
1.398921, 0.452574, 0.4758984, 1, 0, 0.4980392, 1,
1.415696, 0.6239166, -0.8102952, 1, 0, 0.4901961, 1,
1.431179, -0.4808803, 2.338975, 1, 0, 0.4862745, 1,
1.432385, 0.4667677, 1.587666, 1, 0, 0.4784314, 1,
1.433468, -0.06618717, 2.565229, 1, 0, 0.4745098, 1,
1.439231, -1.489227, 1.147557, 1, 0, 0.4666667, 1,
1.441855, -0.3023506, 1.252835, 1, 0, 0.4627451, 1,
1.443183, 0.2662852, 0.4722997, 1, 0, 0.454902, 1,
1.444815, -0.4311812, 1.49925, 1, 0, 0.4509804, 1,
1.448034, 0.5046253, 3.355133, 1, 0, 0.4431373, 1,
1.452314, -0.536149, 2.949728, 1, 0, 0.4392157, 1,
1.461104, 0.6742058, 3.029364, 1, 0, 0.4313726, 1,
1.468792, 1.470506, 0.8980157, 1, 0, 0.427451, 1,
1.481248, 0.4429838, 1.66107, 1, 0, 0.4196078, 1,
1.50788, 0.750952, 1.761018, 1, 0, 0.4156863, 1,
1.512666, 0.7326148, 0.6463416, 1, 0, 0.4078431, 1,
1.519171, -0.1479506, 1.890421, 1, 0, 0.4039216, 1,
1.520067, -0.5909474, 3.098619, 1, 0, 0.3960784, 1,
1.52154, -0.02551195, 2.648807, 1, 0, 0.3882353, 1,
1.523447, -0.8033419, 3.712891, 1, 0, 0.3843137, 1,
1.524233, 0.7717946, 1.720008, 1, 0, 0.3764706, 1,
1.540693, 0.9718248, 1.729977, 1, 0, 0.372549, 1,
1.572526, 0.5457614, -0.4243586, 1, 0, 0.3647059, 1,
1.577293, -1.317794, 1.402024, 1, 0, 0.3607843, 1,
1.590683, -1.641293, 2.213758, 1, 0, 0.3529412, 1,
1.593158, 1.011314, 0.8140312, 1, 0, 0.3490196, 1,
1.593344, 0.4514584, 1.298971, 1, 0, 0.3411765, 1,
1.606915, -1.183649, 2.843236, 1, 0, 0.3372549, 1,
1.60732, 1.089981, 0.4303902, 1, 0, 0.3294118, 1,
1.607878, 1.690555, 0.773997, 1, 0, 0.3254902, 1,
1.614674, -2.723713, 3.088026, 1, 0, 0.3176471, 1,
1.622461, -0.4594383, 0.5501388, 1, 0, 0.3137255, 1,
1.636391, -1.517196, 0.6000491, 1, 0, 0.3058824, 1,
1.645233, 0.7822063, 0.6419896, 1, 0, 0.2980392, 1,
1.647053, 1.651026, 1.06733, 1, 0, 0.2941177, 1,
1.647775, -1.442786, 2.030034, 1, 0, 0.2862745, 1,
1.649444, 0.3575185, 0.7068053, 1, 0, 0.282353, 1,
1.666797, 0.3151525, 1.365542, 1, 0, 0.2745098, 1,
1.669742, -0.4096043, 3.12374, 1, 0, 0.2705882, 1,
1.67362, 1.415788, -1.583152, 1, 0, 0.2627451, 1,
1.685243, 1.200637, 1.201402, 1, 0, 0.2588235, 1,
1.688393, 0.7639659, 1.675812, 1, 0, 0.2509804, 1,
1.693344, 1.03879, 1.763164, 1, 0, 0.2470588, 1,
1.723289, 0.01382411, 1.500796, 1, 0, 0.2392157, 1,
1.750085, 2.525535, 0.8142348, 1, 0, 0.2352941, 1,
1.762886, 1.527615, 1.08799, 1, 0, 0.227451, 1,
1.764151, -2.260831, 0.6113063, 1, 0, 0.2235294, 1,
1.765525, -2.445325, 2.701235, 1, 0, 0.2156863, 1,
1.770699, -2.782578, 1.727601, 1, 0, 0.2117647, 1,
1.778438, -0.04811706, 1.348289, 1, 0, 0.2039216, 1,
1.805344, -0.4463548, 1.983833, 1, 0, 0.1960784, 1,
1.817879, 0.3306705, -0.179103, 1, 0, 0.1921569, 1,
1.820364, 0.3838436, 0.9421744, 1, 0, 0.1843137, 1,
1.857395, 1.082064, 2.258216, 1, 0, 0.1803922, 1,
1.866635, -1.349495, 2.300243, 1, 0, 0.172549, 1,
1.876492, -0.9018031, 3.30073, 1, 0, 0.1686275, 1,
1.883476, -0.1916396, 1.557643, 1, 0, 0.1607843, 1,
1.92568, -0.3432324, 0.3251465, 1, 0, 0.1568628, 1,
1.94646, -0.2370787, 1.922189, 1, 0, 0.1490196, 1,
1.961199, 0.2027574, 2.216598, 1, 0, 0.145098, 1,
1.981395, 1.306229, 0.8266968, 1, 0, 0.1372549, 1,
2.007707, -0.2914576, 0.7680775, 1, 0, 0.1333333, 1,
2.033353, -0.8476434, 1.555374, 1, 0, 0.1254902, 1,
2.071308, 1.303439, 2.840224, 1, 0, 0.1215686, 1,
2.143215, -0.8664992, 2.41246, 1, 0, 0.1137255, 1,
2.190077, 0.5417171, 0.2449771, 1, 0, 0.1098039, 1,
2.194525, 1.105296, 3.681436, 1, 0, 0.1019608, 1,
2.26504, 0.1928025, 0.2871712, 1, 0, 0.09411765, 1,
2.35004, 0.3258807, 1.613412, 1, 0, 0.09019608, 1,
2.367114, -0.5409063, 2.301404, 1, 0, 0.08235294, 1,
2.470495, 0.2586016, 3.246219, 1, 0, 0.07843138, 1,
2.529077, -1.78395, 3.612222, 1, 0, 0.07058824, 1,
2.537258, -1.599375, 2.591642, 1, 0, 0.06666667, 1,
2.572536, -0.3729017, 1.59294, 1, 0, 0.05882353, 1,
2.574419, 0.3117466, 0.9277989, 1, 0, 0.05490196, 1,
2.585958, -1.118194, 2.626821, 1, 0, 0.04705882, 1,
2.714528, -1.801124, 3.114435, 1, 0, 0.04313726, 1,
2.717694, -0.5688578, 3.059234, 1, 0, 0.03529412, 1,
2.731388, -0.2552323, 1.817384, 1, 0, 0.03137255, 1,
2.768825, -0.5849913, 1.281262, 1, 0, 0.02352941, 1,
3.00268, 1.278491, 2.123166, 1, 0, 0.01960784, 1,
3.207537, -0.3071582, 3.565605, 1, 0, 0.01176471, 1,
3.365574, -0.004372236, 2.572331, 1, 0, 0.007843138, 1
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
0.2469504, -4.033223, -6.783924, 0, -0.5, 0.5, 0.5,
0.2469504, -4.033223, -6.783924, 1, -0.5, 0.5, 0.5,
0.2469504, -4.033223, -6.783924, 1, 1.5, 0.5, 0.5,
0.2469504, -4.033223, -6.783924, 0, 1.5, 0.5, 0.5
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
-3.928886, 0.1836612, -6.783924, 0, -0.5, 0.5, 0.5,
-3.928886, 0.1836612, -6.783924, 1, -0.5, 0.5, 0.5,
-3.928886, 0.1836612, -6.783924, 1, 1.5, 0.5, 0.5,
-3.928886, 0.1836612, -6.783924, 0, 1.5, 0.5, 0.5
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
-3.928886, -4.033223, -0.1075318, 0, -0.5, 0.5, 0.5,
-3.928886, -4.033223, -0.1075318, 1, -0.5, 0.5, 0.5,
-3.928886, -4.033223, -0.1075318, 1, 1.5, 0.5, 0.5,
-3.928886, -4.033223, -0.1075318, 0, 1.5, 0.5, 0.5
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
-2, -3.060096, -5.243218,
3, -3.060096, -5.243218,
-2, -3.060096, -5.243218,
-2, -3.222284, -5.500002,
-1, -3.060096, -5.243218,
-1, -3.222284, -5.500002,
0, -3.060096, -5.243218,
0, -3.222284, -5.500002,
1, -3.060096, -5.243218,
1, -3.222284, -5.500002,
2, -3.060096, -5.243218,
2, -3.222284, -5.500002,
3, -3.060096, -5.243218,
3, -3.222284, -5.500002
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
-2, -3.54666, -6.013571, 0, -0.5, 0.5, 0.5,
-2, -3.54666, -6.013571, 1, -0.5, 0.5, 0.5,
-2, -3.54666, -6.013571, 1, 1.5, 0.5, 0.5,
-2, -3.54666, -6.013571, 0, 1.5, 0.5, 0.5,
-1, -3.54666, -6.013571, 0, -0.5, 0.5, 0.5,
-1, -3.54666, -6.013571, 1, -0.5, 0.5, 0.5,
-1, -3.54666, -6.013571, 1, 1.5, 0.5, 0.5,
-1, -3.54666, -6.013571, 0, 1.5, 0.5, 0.5,
0, -3.54666, -6.013571, 0, -0.5, 0.5, 0.5,
0, -3.54666, -6.013571, 1, -0.5, 0.5, 0.5,
0, -3.54666, -6.013571, 1, 1.5, 0.5, 0.5,
0, -3.54666, -6.013571, 0, 1.5, 0.5, 0.5,
1, -3.54666, -6.013571, 0, -0.5, 0.5, 0.5,
1, -3.54666, -6.013571, 1, -0.5, 0.5, 0.5,
1, -3.54666, -6.013571, 1, 1.5, 0.5, 0.5,
1, -3.54666, -6.013571, 0, 1.5, 0.5, 0.5,
2, -3.54666, -6.013571, 0, -0.5, 0.5, 0.5,
2, -3.54666, -6.013571, 1, -0.5, 0.5, 0.5,
2, -3.54666, -6.013571, 1, 1.5, 0.5, 0.5,
2, -3.54666, -6.013571, 0, 1.5, 0.5, 0.5,
3, -3.54666, -6.013571, 0, -0.5, 0.5, 0.5,
3, -3.54666, -6.013571, 1, -0.5, 0.5, 0.5,
3, -3.54666, -6.013571, 1, 1.5, 0.5, 0.5,
3, -3.54666, -6.013571, 0, 1.5, 0.5, 0.5
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
-2.965232, -2, -5.243218,
-2.965232, 3, -5.243218,
-2.965232, -2, -5.243218,
-3.125841, -2, -5.500002,
-2.965232, -1, -5.243218,
-3.125841, -1, -5.500002,
-2.965232, 0, -5.243218,
-3.125841, 0, -5.500002,
-2.965232, 1, -5.243218,
-3.125841, 1, -5.500002,
-2.965232, 2, -5.243218,
-3.125841, 2, -5.500002,
-2.965232, 3, -5.243218,
-3.125841, 3, -5.500002
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
-3.447059, -2, -6.013571, 0, -0.5, 0.5, 0.5,
-3.447059, -2, -6.013571, 1, -0.5, 0.5, 0.5,
-3.447059, -2, -6.013571, 1, 1.5, 0.5, 0.5,
-3.447059, -2, -6.013571, 0, 1.5, 0.5, 0.5,
-3.447059, -1, -6.013571, 0, -0.5, 0.5, 0.5,
-3.447059, -1, -6.013571, 1, -0.5, 0.5, 0.5,
-3.447059, -1, -6.013571, 1, 1.5, 0.5, 0.5,
-3.447059, -1, -6.013571, 0, 1.5, 0.5, 0.5,
-3.447059, 0, -6.013571, 0, -0.5, 0.5, 0.5,
-3.447059, 0, -6.013571, 1, -0.5, 0.5, 0.5,
-3.447059, 0, -6.013571, 1, 1.5, 0.5, 0.5,
-3.447059, 0, -6.013571, 0, 1.5, 0.5, 0.5,
-3.447059, 1, -6.013571, 0, -0.5, 0.5, 0.5,
-3.447059, 1, -6.013571, 1, -0.5, 0.5, 0.5,
-3.447059, 1, -6.013571, 1, 1.5, 0.5, 0.5,
-3.447059, 1, -6.013571, 0, 1.5, 0.5, 0.5,
-3.447059, 2, -6.013571, 0, -0.5, 0.5, 0.5,
-3.447059, 2, -6.013571, 1, -0.5, 0.5, 0.5,
-3.447059, 2, -6.013571, 1, 1.5, 0.5, 0.5,
-3.447059, 2, -6.013571, 0, 1.5, 0.5, 0.5,
-3.447059, 3, -6.013571, 0, -0.5, 0.5, 0.5,
-3.447059, 3, -6.013571, 1, -0.5, 0.5, 0.5,
-3.447059, 3, -6.013571, 1, 1.5, 0.5, 0.5,
-3.447059, 3, -6.013571, 0, 1.5, 0.5, 0.5
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
-2.965232, -3.060096, -4,
-2.965232, -3.060096, 4,
-2.965232, -3.060096, -4,
-3.125841, -3.222284, -4,
-2.965232, -3.060096, -2,
-3.125841, -3.222284, -2,
-2.965232, -3.060096, 0,
-3.125841, -3.222284, 0,
-2.965232, -3.060096, 2,
-3.125841, -3.222284, 2,
-2.965232, -3.060096, 4,
-3.125841, -3.222284, 4
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
-3.447059, -3.54666, -4, 0, -0.5, 0.5, 0.5,
-3.447059, -3.54666, -4, 1, -0.5, 0.5, 0.5,
-3.447059, -3.54666, -4, 1, 1.5, 0.5, 0.5,
-3.447059, -3.54666, -4, 0, 1.5, 0.5, 0.5,
-3.447059, -3.54666, -2, 0, -0.5, 0.5, 0.5,
-3.447059, -3.54666, -2, 1, -0.5, 0.5, 0.5,
-3.447059, -3.54666, -2, 1, 1.5, 0.5, 0.5,
-3.447059, -3.54666, -2, 0, 1.5, 0.5, 0.5,
-3.447059, -3.54666, 0, 0, -0.5, 0.5, 0.5,
-3.447059, -3.54666, 0, 1, -0.5, 0.5, 0.5,
-3.447059, -3.54666, 0, 1, 1.5, 0.5, 0.5,
-3.447059, -3.54666, 0, 0, 1.5, 0.5, 0.5,
-3.447059, -3.54666, 2, 0, -0.5, 0.5, 0.5,
-3.447059, -3.54666, 2, 1, -0.5, 0.5, 0.5,
-3.447059, -3.54666, 2, 1, 1.5, 0.5, 0.5,
-3.447059, -3.54666, 2, 0, 1.5, 0.5, 0.5,
-3.447059, -3.54666, 4, 0, -0.5, 0.5, 0.5,
-3.447059, -3.54666, 4, 1, -0.5, 0.5, 0.5,
-3.447059, -3.54666, 4, 1, 1.5, 0.5, 0.5,
-3.447059, -3.54666, 4, 0, 1.5, 0.5, 0.5
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
-2.965232, -3.060096, -5.243218,
-2.965232, 3.427418, -5.243218,
-2.965232, -3.060096, 5.028154,
-2.965232, 3.427418, 5.028154,
-2.965232, -3.060096, -5.243218,
-2.965232, -3.060096, 5.028154,
-2.965232, 3.427418, -5.243218,
-2.965232, 3.427418, 5.028154,
-2.965232, -3.060096, -5.243218,
3.459132, -3.060096, -5.243218,
-2.965232, -3.060096, 5.028154,
3.459132, -3.060096, 5.028154,
-2.965232, 3.427418, -5.243218,
3.459132, 3.427418, -5.243218,
-2.965232, 3.427418, 5.028154,
3.459132, 3.427418, 5.028154,
3.459132, -3.060096, -5.243218,
3.459132, 3.427418, -5.243218,
3.459132, -3.060096, 5.028154,
3.459132, 3.427418, 5.028154,
3.459132, -3.060096, -5.243218,
3.459132, -3.060096, 5.028154,
3.459132, 3.427418, -5.243218,
3.459132, 3.427418, 5.028154
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
var radius = 7.338327;
var distance = 32.64904;
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
mvMatrix.translate( -0.2469504, -0.1836612, 0.1075318 );
mvMatrix.scale( 1.235039, 1.223017, 0.7724715 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.64904);
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
hedonal<-read.table("hedonal.xyz")
```

```
## Error in read.table("hedonal.xyz"): no lines available in input
```

```r
x<-hedonal$V2
```

```
## Error in eval(expr, envir, enclos): object 'hedonal' not found
```

```r
y<-hedonal$V3
```

```
## Error in eval(expr, envir, enclos): object 'hedonal' not found
```

```r
z<-hedonal$V4
```

```
## Error in eval(expr, envir, enclos): object 'hedonal' not found
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
-2.871673, -0.2689686, -1.715073, 0, 0, 1, 1, 1,
-2.769695, 0.3054635, -1.47953, 1, 0, 0, 1, 1,
-2.749943, 2.025205, -1.271528, 1, 0, 0, 1, 1,
-2.717049, 1.682263, 0.04730183, 1, 0, 0, 1, 1,
-2.708624, 0.2632252, -2.345036, 1, 0, 0, 1, 1,
-2.648128, 0.4688624, -0.9885933, 1, 0, 0, 1, 1,
-2.514589, 0.2972347, -1.184628, 0, 0, 0, 1, 1,
-2.512387, 1.473066, -0.9484125, 0, 0, 0, 1, 1,
-2.511614, -0.2049428, -1.328451, 0, 0, 0, 1, 1,
-2.419087, -0.5530582, -2.070136, 0, 0, 0, 1, 1,
-2.353882, -0.4821459, -3.415076, 0, 0, 0, 1, 1,
-2.27589, -0.7590439, -0.3185284, 0, 0, 0, 1, 1,
-2.260132, 0.3619046, -1.67586, 0, 0, 0, 1, 1,
-2.255998, 0.6348624, -0.1258392, 1, 1, 1, 1, 1,
-2.210884, -0.314565, -2.637043, 1, 1, 1, 1, 1,
-2.16321, 0.9043376, 1.068643, 1, 1, 1, 1, 1,
-2.092132, -0.03013813, -2.37355, 1, 1, 1, 1, 1,
-1.96779, -0.8336701, -1.372067, 1, 1, 1, 1, 1,
-1.966807, -0.3626807, -2.422575, 1, 1, 1, 1, 1,
-1.946717, 0.069697, -2.575062, 1, 1, 1, 1, 1,
-1.936026, -1.273283, -3.298227, 1, 1, 1, 1, 1,
-1.920884, 2.193245, -0.5678768, 1, 1, 1, 1, 1,
-1.916049, -2.091052, -3.319544, 1, 1, 1, 1, 1,
-1.913001, -0.7310759, -1.655554, 1, 1, 1, 1, 1,
-1.906756, -1.400964, -3.334694, 1, 1, 1, 1, 1,
-1.90607, -0.1999334, -1.580377, 1, 1, 1, 1, 1,
-1.866448, -0.7600852, -1.601075, 1, 1, 1, 1, 1,
-1.857719, 0.2169585, 1.232575, 1, 1, 1, 1, 1,
-1.84373, -0.003285564, -1.851131, 0, 0, 1, 1, 1,
-1.825103, 2.056346, 0.2980241, 1, 0, 0, 1, 1,
-1.811384, 1.400452, -1.432022, 1, 0, 0, 1, 1,
-1.799675, 0.05163087, -0.7708938, 1, 0, 0, 1, 1,
-1.792515, -0.894156, -0.5530112, 1, 0, 0, 1, 1,
-1.781567, -0.007068711, -1.024125, 1, 0, 0, 1, 1,
-1.77289, 0.9314014, -1.883056, 0, 0, 0, 1, 1,
-1.73914, -1.488192, -2.548996, 0, 0, 0, 1, 1,
-1.736076, -0.1017687, -3.942318, 0, 0, 0, 1, 1,
-1.734761, -0.400062, -1.779124, 0, 0, 0, 1, 1,
-1.733764, -1.842992, -3.416135, 0, 0, 0, 1, 1,
-1.733042, 0.0008961213, -3.522489, 0, 0, 0, 1, 1,
-1.718428, 1.452273, -1.093552, 0, 0, 0, 1, 1,
-1.683988, -2.965618, -2.474289, 1, 1, 1, 1, 1,
-1.670702, 1.645428, -1.963751, 1, 1, 1, 1, 1,
-1.668158, 1.102614, -0.02485356, 1, 1, 1, 1, 1,
-1.663469, -0.3069577, -2.087506, 1, 1, 1, 1, 1,
-1.661147, -0.2776605, -1.608739, 1, 1, 1, 1, 1,
-1.650777, -1.174708, -1.373638, 1, 1, 1, 1, 1,
-1.645168, 0.9348257, -0.9523382, 1, 1, 1, 1, 1,
-1.642685, -0.2657944, -1.069903, 1, 1, 1, 1, 1,
-1.636617, 1.36062, 0.5075178, 1, 1, 1, 1, 1,
-1.631781, 0.6974947, -0.9246039, 1, 1, 1, 1, 1,
-1.608597, 0.2401043, 0.607066, 1, 1, 1, 1, 1,
-1.603437, -0.3336407, -0.6503399, 1, 1, 1, 1, 1,
-1.568029, -0.7547126, -4.083352, 1, 1, 1, 1, 1,
-1.56293, 0.3441913, -3.233743, 1, 1, 1, 1, 1,
-1.542852, -0.2553701, -2.992187, 1, 1, 1, 1, 1,
-1.52532, -1.731208, -2.51919, 0, 0, 1, 1, 1,
-1.524879, -1.156417, -1.922639, 1, 0, 0, 1, 1,
-1.523414, -2.173666, -3.111868, 1, 0, 0, 1, 1,
-1.522119, -0.6300457, -1.7713, 1, 0, 0, 1, 1,
-1.515283, -0.2359178, -3.346158, 1, 0, 0, 1, 1,
-1.501415, 0.239136, -2.241215, 1, 0, 0, 1, 1,
-1.472192, 2.042258, 0.8902743, 0, 0, 0, 1, 1,
-1.4623, 0.4046289, -1.059662, 0, 0, 0, 1, 1,
-1.457828, -0.4920669, -1.697309, 0, 0, 0, 1, 1,
-1.444198, 1.732683, -0.8424572, 0, 0, 0, 1, 1,
-1.430242, -0.03949811, -2.240558, 0, 0, 0, 1, 1,
-1.42381, 0.9314832, -2.597168, 0, 0, 0, 1, 1,
-1.413598, 2.484063, -0.5637891, 0, 0, 0, 1, 1,
-1.399225, -0.8170143, -2.401114, 1, 1, 1, 1, 1,
-1.38646, 0.5220957, -1.538818, 1, 1, 1, 1, 1,
-1.374175, 1.000153, -1.026521, 1, 1, 1, 1, 1,
-1.373628, 0.765502, -2.347273, 1, 1, 1, 1, 1,
-1.371746, -1.17229, -2.623798, 1, 1, 1, 1, 1,
-1.365805, 0.7884784, 0.697405, 1, 1, 1, 1, 1,
-1.362224, 0.8252768, -0.8332334, 1, 1, 1, 1, 1,
-1.361285, -0.7020974, -3.69748, 1, 1, 1, 1, 1,
-1.355684, 0.6942594, -0.6970581, 1, 1, 1, 1, 1,
-1.351948, -0.9655574, -0.6646951, 1, 1, 1, 1, 1,
-1.348612, 1.704338, -0.4299255, 1, 1, 1, 1, 1,
-1.348572, -0.9200116, -2.410897, 1, 1, 1, 1, 1,
-1.343868, 0.9980421, 0.695389, 1, 1, 1, 1, 1,
-1.340207, 0.4957282, -0.8658878, 1, 1, 1, 1, 1,
-1.334803, 1.504851, -1.823647, 1, 1, 1, 1, 1,
-1.325801, 0.2690853, 0.934966, 0, 0, 1, 1, 1,
-1.320949, 0.1664682, -2.938509, 1, 0, 0, 1, 1,
-1.315745, 0.908926, -2.238467, 1, 0, 0, 1, 1,
-1.314529, -0.0948846, -1.197441, 1, 0, 0, 1, 1,
-1.306532, 1.728379, 0.3032437, 1, 0, 0, 1, 1,
-1.305884, -0.2339952, -1.399618, 1, 0, 0, 1, 1,
-1.304015, -0.4274235, -2.390553, 0, 0, 0, 1, 1,
-1.303283, -0.9040518, -3.197552, 0, 0, 0, 1, 1,
-1.297387, 0.9966582, 0.7456743, 0, 0, 0, 1, 1,
-1.289864, 0.01100648, -2.404626, 0, 0, 0, 1, 1,
-1.283602, -0.1395646, -0.5023045, 0, 0, 0, 1, 1,
-1.27751, -1.366899, -1.634258, 0, 0, 0, 1, 1,
-1.268078, 0.03684047, -2.899605, 0, 0, 0, 1, 1,
-1.25474, 1.135966, -3.247965, 1, 1, 1, 1, 1,
-1.24786, -1.297959, -3.478781, 1, 1, 1, 1, 1,
-1.222406, 0.3957705, -0.2277467, 1, 1, 1, 1, 1,
-1.197239, 1.608057, -0.9854365, 1, 1, 1, 1, 1,
-1.196686, -1.660676, -2.075969, 1, 1, 1, 1, 1,
-1.196159, -0.7257224, -3.084415, 1, 1, 1, 1, 1,
-1.195575, -0.2616847, -0.2182435, 1, 1, 1, 1, 1,
-1.181253, -1.826725, -2.327323, 1, 1, 1, 1, 1,
-1.150717, -0.3974352, -2.529769, 1, 1, 1, 1, 1,
-1.147624, -0.9984159, -0.1205922, 1, 1, 1, 1, 1,
-1.147315, 0.3921488, -1.104275, 1, 1, 1, 1, 1,
-1.147138, -0.6398542, -1.989902, 1, 1, 1, 1, 1,
-1.139822, -1.147322, 0.6886902, 1, 1, 1, 1, 1,
-1.129358, -0.2143921, -3.152151, 1, 1, 1, 1, 1,
-1.129202, -1.946365, -4.188103, 1, 1, 1, 1, 1,
-1.127331, -0.05037969, -1.747797, 0, 0, 1, 1, 1,
-1.126408, 1.119714, -0.6019465, 1, 0, 0, 1, 1,
-1.121305, -0.4434193, -2.151761, 1, 0, 0, 1, 1,
-1.11651, -0.7153071, -1.871491, 1, 0, 0, 1, 1,
-1.110517, -1.092398, -3.320743, 1, 0, 0, 1, 1,
-1.105307, 1.749266, -0.361284, 1, 0, 0, 1, 1,
-1.103032, -0.4591718, -1.479694, 0, 0, 0, 1, 1,
-1.096023, 0.2288916, -1.924454, 0, 0, 0, 1, 1,
-1.092572, -0.1160739, -0.8041152, 0, 0, 0, 1, 1,
-1.088992, 1.23338, 1.209414, 0, 0, 0, 1, 1,
-1.088064, -1.05937, -2.564879, 0, 0, 0, 1, 1,
-1.085958, -0.05111171, -2.035639, 0, 0, 0, 1, 1,
-1.081462, -0.2718235, -2.961377, 0, 0, 0, 1, 1,
-1.074159, 0.1535125, -1.620537, 1, 1, 1, 1, 1,
-1.073269, 1.02999, -0.1749482, 1, 1, 1, 1, 1,
-1.072927, -0.2593696, -1.780904, 1, 1, 1, 1, 1,
-1.072391, -0.1616754, -0.5261937, 1, 1, 1, 1, 1,
-1.068375, -1.536249, -4.3241, 1, 1, 1, 1, 1,
-1.065153, -0.3950089, -1.953104, 1, 1, 1, 1, 1,
-1.042711, 1.390006, -0.2060532, 1, 1, 1, 1, 1,
-1.038154, 0.628884, -0.2167787, 1, 1, 1, 1, 1,
-1.036454, -1.098355, -2.802814, 1, 1, 1, 1, 1,
-1.030961, -2.129262, -5.015166, 1, 1, 1, 1, 1,
-1.022763, 0.08685298, -2.169931, 1, 1, 1, 1, 1,
-1.020415, -1.52824, -3.097937, 1, 1, 1, 1, 1,
-1.019969, 0.07587993, -3.307463, 1, 1, 1, 1, 1,
-1.019094, 1.256661, -1.106052, 1, 1, 1, 1, 1,
-1.01735, -0.7159044, -0.8659741, 1, 1, 1, 1, 1,
-1.010358, 0.04484901, -2.292927, 0, 0, 1, 1, 1,
-1.007567, 0.4465283, -2.034429, 1, 0, 0, 1, 1,
-1.003097, 0.3084638, 1.309955, 1, 0, 0, 1, 1,
-1.002768, -2.558755, -2.88069, 1, 0, 0, 1, 1,
-0.9768635, 0.7685723, -1.309266, 1, 0, 0, 1, 1,
-0.9691626, 2.342237, -0.8276355, 1, 0, 0, 1, 1,
-0.9619299, -0.5554948, -1.80969, 0, 0, 0, 1, 1,
-0.9580705, 0.7752659, -0.5973372, 0, 0, 0, 1, 1,
-0.9484918, -0.7712155, -1.445464, 0, 0, 0, 1, 1,
-0.9484113, 0.6474329, 0.9710343, 0, 0, 0, 1, 1,
-0.9403121, -0.9937934, -2.223483, 0, 0, 0, 1, 1,
-0.9382721, 0.6925215, -0.3704602, 0, 0, 0, 1, 1,
-0.9265858, 0.3160711, -2.809128, 0, 0, 0, 1, 1,
-0.9209169, -1.114428, -3.248255, 1, 1, 1, 1, 1,
-0.9144425, -1.167064, -0.6081964, 1, 1, 1, 1, 1,
-0.9105204, 0.4420113, -2.678145, 1, 1, 1, 1, 1,
-0.9016759, 0.6726528, -2.074195, 1, 1, 1, 1, 1,
-0.9002876, 0.2624114, -3.072763, 1, 1, 1, 1, 1,
-0.9001366, 1.124598, 0.3252916, 1, 1, 1, 1, 1,
-0.8964806, -0.8687783, -2.10629, 1, 1, 1, 1, 1,
-0.8952839, 1.094566, 0.01885239, 1, 1, 1, 1, 1,
-0.8898395, -1.24615, -3.138965, 1, 1, 1, 1, 1,
-0.8892117, 1.496441, -0.3043246, 1, 1, 1, 1, 1,
-0.8843623, 1.665982, -0.3205881, 1, 1, 1, 1, 1,
-0.883759, 1.425173, -0.3488525, 1, 1, 1, 1, 1,
-0.8818288, 0.09622968, -0.7283023, 1, 1, 1, 1, 1,
-0.8753912, -0.2121367, -1.263308, 1, 1, 1, 1, 1,
-0.8721893, -0.8035926, -2.659156, 1, 1, 1, 1, 1,
-0.8719147, -2.469081, -3.997728, 0, 0, 1, 1, 1,
-0.8702799, 0.3788976, -1.374282, 1, 0, 0, 1, 1,
-0.8671373, 0.03729847, -0.1363649, 1, 0, 0, 1, 1,
-0.8657587, -0.8061044, -3.518898, 1, 0, 0, 1, 1,
-0.8648157, -0.5125579, -3.563575, 1, 0, 0, 1, 1,
-0.8629978, -0.704921, -2.710565, 1, 0, 0, 1, 1,
-0.855671, -0.8997256, -3.795964, 0, 0, 0, 1, 1,
-0.8531964, -0.8540611, -4.013297, 0, 0, 0, 1, 1,
-0.851589, 0.1410433, 0.1211277, 0, 0, 0, 1, 1,
-0.849877, -0.8960968, -0.7944705, 0, 0, 0, 1, 1,
-0.8467456, -0.9093105, -2.528932, 0, 0, 0, 1, 1,
-0.8458304, 0.7428259, -0.4620107, 0, 0, 0, 1, 1,
-0.8431509, 0.1342915, -3.142478, 0, 0, 0, 1, 1,
-0.8361072, -0.3281657, -4.680137, 1, 1, 1, 1, 1,
-0.8196414, -0.4669481, -2.149664, 1, 1, 1, 1, 1,
-0.8188156, -1.38818, -3.736987, 1, 1, 1, 1, 1,
-0.8154085, -1.771642, -4.327653, 1, 1, 1, 1, 1,
-0.8149846, 1.149222, -0.6943714, 1, 1, 1, 1, 1,
-0.8091605, -1.318509, -4.137222, 1, 1, 1, 1, 1,
-0.8090854, 1.240793, -0.7215979, 1, 1, 1, 1, 1,
-0.8069882, -0.5599893, -2.632159, 1, 1, 1, 1, 1,
-0.7980938, -0.01573665, -3.459207, 1, 1, 1, 1, 1,
-0.7977497, 0.9236563, 1.291588, 1, 1, 1, 1, 1,
-0.795333, -0.3849254, -3.157781, 1, 1, 1, 1, 1,
-0.7915406, -2.125182, -2.987437, 1, 1, 1, 1, 1,
-0.7897291, -1.489446, -2.637803, 1, 1, 1, 1, 1,
-0.7887569, 1.002548, -1.412186, 1, 1, 1, 1, 1,
-0.7882534, 0.05390071, -2.59503, 1, 1, 1, 1, 1,
-0.7848887, -0.303484, -0.438966, 0, 0, 1, 1, 1,
-0.7824813, -0.7155047, -1.973752, 1, 0, 0, 1, 1,
-0.7794116, -1.083491, -3.215164, 1, 0, 0, 1, 1,
-0.7677365, 0.9999348, 0.4151054, 1, 0, 0, 1, 1,
-0.7636111, 0.06185313, -1.42319, 1, 0, 0, 1, 1,
-0.7608473, 1.641394, -1.079009, 1, 0, 0, 1, 1,
-0.752258, -0.3515263, -1.935797, 0, 0, 0, 1, 1,
-0.7484134, -0.6711653, -2.868425, 0, 0, 0, 1, 1,
-0.7453131, -0.04703853, -2.919838, 0, 0, 0, 1, 1,
-0.7446992, -1.801904, -3.824755, 0, 0, 0, 1, 1,
-0.7438805, 0.9544185, -1.266975, 0, 0, 0, 1, 1,
-0.7438316, 0.9973178, 0.4087958, 0, 0, 0, 1, 1,
-0.7401865, -1.709226, -4.68756, 0, 0, 0, 1, 1,
-0.7382445, -1.542345, -3.114842, 1, 1, 1, 1, 1,
-0.7344266, -2.412119, -3.533934, 1, 1, 1, 1, 1,
-0.732473, -0.1413472, -1.222162, 1, 1, 1, 1, 1,
-0.7303002, 0.7392424, -0.5025325, 1, 1, 1, 1, 1,
-0.7220481, 0.138132, -1.366871, 1, 1, 1, 1, 1,
-0.7214495, -0.2623647, 0.003928621, 1, 1, 1, 1, 1,
-0.7178409, 0.08312216, -2.151008, 1, 1, 1, 1, 1,
-0.7177928, -0.4225961, -1.01773, 1, 1, 1, 1, 1,
-0.7173005, -0.7257527, -1.274048, 1, 1, 1, 1, 1,
-0.7168355, -1.702172, -2.336085, 1, 1, 1, 1, 1,
-0.7151072, -0.911844, -0.5567716, 1, 1, 1, 1, 1,
-0.7132167, -0.2076549, -2.274043, 1, 1, 1, 1, 1,
-0.7122706, 0.7802866, -1.695932, 1, 1, 1, 1, 1,
-0.7121446, 1.635507, -0.2804604, 1, 1, 1, 1, 1,
-0.7062484, -2.057264, -3.205826, 1, 1, 1, 1, 1,
-0.705636, 0.1318442, -0.4766915, 0, 0, 1, 1, 1,
-0.7045806, 0.5793468, -0.3430301, 1, 0, 0, 1, 1,
-0.7016931, 0.1793875, -1.216707, 1, 0, 0, 1, 1,
-0.7012507, -1.778616, -4.83158, 1, 0, 0, 1, 1,
-0.6979619, 0.5938017, -2.052908, 1, 0, 0, 1, 1,
-0.6911972, -0.7003371, -1.96814, 1, 0, 0, 1, 1,
-0.687804, 0.8004152, -1.402728, 0, 0, 0, 1, 1,
-0.6860933, -1.962791, -1.837717, 0, 0, 0, 1, 1,
-0.6833242, -0.8018267, -1.873237, 0, 0, 0, 1, 1,
-0.6806192, 2.098488, 1.17848, 0, 0, 0, 1, 1,
-0.6774285, -1.419345, -0.4376996, 0, 0, 0, 1, 1,
-0.6698964, 1.441931, -2.309481, 0, 0, 0, 1, 1,
-0.6692582, -0.04932704, -1.382867, 0, 0, 0, 1, 1,
-0.6623937, 0.5059639, -1.477327, 1, 1, 1, 1, 1,
-0.6610844, 0.4252508, -2.233753, 1, 1, 1, 1, 1,
-0.655147, 1.574412, -0.3692383, 1, 1, 1, 1, 1,
-0.6498486, 0.5169954, -2.018612, 1, 1, 1, 1, 1,
-0.6420655, 0.05758618, -0.9493657, 1, 1, 1, 1, 1,
-0.63845, 0.4139669, -0.0563765, 1, 1, 1, 1, 1,
-0.6383867, -0.8558995, -2.468632, 1, 1, 1, 1, 1,
-0.6362039, -0.09778374, -3.200461, 1, 1, 1, 1, 1,
-0.6287906, 0.432804, 0.09292567, 1, 1, 1, 1, 1,
-0.6257676, -0.009250741, -2.375067, 1, 1, 1, 1, 1,
-0.6214778, -0.0311901, -0.9881772, 1, 1, 1, 1, 1,
-0.616775, 0.5789704, -0.8627082, 1, 1, 1, 1, 1,
-0.6136114, 0.8751718, -2.144436, 1, 1, 1, 1, 1,
-0.6058836, 0.8658909, -0.7465664, 1, 1, 1, 1, 1,
-0.6056439, -0.2699116, -1.922718, 1, 1, 1, 1, 1,
-0.6047967, -0.2149143, 0.07036258, 0, 0, 1, 1, 1,
-0.6033612, 3.33294, -0.2049387, 1, 0, 0, 1, 1,
-0.5979037, -0.8636599, -2.535424, 1, 0, 0, 1, 1,
-0.5921299, 0.1674467, -1.718587, 1, 0, 0, 1, 1,
-0.5910499, -1.759422, -2.423325, 1, 0, 0, 1, 1,
-0.587306, 1.567349, -0.833431, 1, 0, 0, 1, 1,
-0.5774502, -0.5901894, -1.658944, 0, 0, 0, 1, 1,
-0.5722155, -0.09626167, -0.816991, 0, 0, 0, 1, 1,
-0.5720883, 0.4209289, -0.3913888, 0, 0, 0, 1, 1,
-0.5645975, -0.7413244, -2.22324, 0, 0, 0, 1, 1,
-0.5617629, 0.3065362, 0.53251, 0, 0, 0, 1, 1,
-0.5584223, 0.08801584, -1.727047, 0, 0, 0, 1, 1,
-0.5545101, 0.7082617, -2.473528, 0, 0, 0, 1, 1,
-0.5481694, 0.9326014, -1.392766, 1, 1, 1, 1, 1,
-0.5458762, 0.3957337, -1.033951, 1, 1, 1, 1, 1,
-0.5440756, 0.002544487, -1.078675, 1, 1, 1, 1, 1,
-0.5403097, 1.325012, 0.4138969, 1, 1, 1, 1, 1,
-0.5368203, -0.5802507, -1.59356, 1, 1, 1, 1, 1,
-0.5347403, 0.2347153, -1.195222, 1, 1, 1, 1, 1,
-0.5338854, -0.1932515, -3.372709, 1, 1, 1, 1, 1,
-0.5321723, -1.189202, -2.854783, 1, 1, 1, 1, 1,
-0.5315099, -0.6538526, -1.796111, 1, 1, 1, 1, 1,
-0.5314559, 1.456666, 0.6094466, 1, 1, 1, 1, 1,
-0.5284057, -1.659718, -3.707916, 1, 1, 1, 1, 1,
-0.5277637, 1.125903, 0.3235841, 1, 1, 1, 1, 1,
-0.5259398, -1.672837, -2.554445, 1, 1, 1, 1, 1,
-0.5240584, 1.179241, -0.03212348, 1, 1, 1, 1, 1,
-0.5165642, -0.1362817, -0.7508649, 1, 1, 1, 1, 1,
-0.5148361, -0.8547134, -0.6601655, 0, 0, 1, 1, 1,
-0.5114866, 0.01317606, -2.675007, 1, 0, 0, 1, 1,
-0.506183, -0.09110095, -1.065613, 1, 0, 0, 1, 1,
-0.4967714, -0.5872377, -3.080907, 1, 0, 0, 1, 1,
-0.4956098, 0.3881386, -0.5943589, 1, 0, 0, 1, 1,
-0.4950666, 0.7849655, -0.9845766, 1, 0, 0, 1, 1,
-0.494495, 0.6965236, -1.412608, 0, 0, 0, 1, 1,
-0.494094, -0.2722842, -4.381674, 0, 0, 0, 1, 1,
-0.4929151, 0.03758757, -1.610696, 0, 0, 0, 1, 1,
-0.4894832, -0.5681495, -2.93311, 0, 0, 0, 1, 1,
-0.4879016, -1.129356, -3.852716, 0, 0, 0, 1, 1,
-0.4870022, 1.512905, -1.162698, 0, 0, 0, 1, 1,
-0.4832205, 0.1588151, -0.4092843, 0, 0, 0, 1, 1,
-0.4822272, -1.150535, -2.206055, 1, 1, 1, 1, 1,
-0.4810833, -0.5050232, -2.457628, 1, 1, 1, 1, 1,
-0.4798343, 0.6554728, -0.3836762, 1, 1, 1, 1, 1,
-0.4760764, 1.023584, -1.50168, 1, 1, 1, 1, 1,
-0.4759262, 0.5204035, -0.1930444, 1, 1, 1, 1, 1,
-0.4752612, 0.9492962, 0.3551203, 1, 1, 1, 1, 1,
-0.4751641, -0.654131, -3.324704, 1, 1, 1, 1, 1,
-0.4732208, 0.1428259, -2.685536, 1, 1, 1, 1, 1,
-0.4731462, 0.176772, 0.1250384, 1, 1, 1, 1, 1,
-0.4669918, -0.9014906, -2.095769, 1, 1, 1, 1, 1,
-0.4667293, -0.4344476, -0.6817831, 1, 1, 1, 1, 1,
-0.4656096, 0.7919966, -0.744505, 1, 1, 1, 1, 1,
-0.4633376, -1.057536, -3.980083, 1, 1, 1, 1, 1,
-0.46319, 0.7461001, -1.664687, 1, 1, 1, 1, 1,
-0.4575897, 0.2950239, -0.2058105, 1, 1, 1, 1, 1,
-0.447321, -0.3618333, -2.883922, 0, 0, 1, 1, 1,
-0.4462779, 1.081428, -0.29456, 1, 0, 0, 1, 1,
-0.4398906, 0.2248517, 0.3711108, 1, 0, 0, 1, 1,
-0.4380394, -1.363405, -2.068789, 1, 0, 0, 1, 1,
-0.4379983, -0.3123174, -0.8476365, 1, 0, 0, 1, 1,
-0.4359824, 1.52461, 1.017072, 1, 0, 0, 1, 1,
-0.4268933, 1.1053, -1.876149, 0, 0, 0, 1, 1,
-0.4253232, 1.115661, -0.2022531, 0, 0, 0, 1, 1,
-0.4227574, -1.276491, -2.738015, 0, 0, 0, 1, 1,
-0.4206164, -0.5653409, -2.837503, 0, 0, 0, 1, 1,
-0.4199876, 0.1618421, -2.433453, 0, 0, 0, 1, 1,
-0.4192052, 0.2911377, -3.035594, 0, 0, 0, 1, 1,
-0.4155224, -0.8675011, -2.802823, 0, 0, 0, 1, 1,
-0.4153712, 0.8969374, -0.3043651, 1, 1, 1, 1, 1,
-0.4103294, 0.8189312, -1.433761, 1, 1, 1, 1, 1,
-0.4016363, -1.599426, -2.503566, 1, 1, 1, 1, 1,
-0.3992035, -0.8641382, -2.74693, 1, 1, 1, 1, 1,
-0.3939066, 0.09618215, -1.037671, 1, 1, 1, 1, 1,
-0.3923236, -1.445456, -4.387769, 1, 1, 1, 1, 1,
-0.3921048, 0.02262425, -1.097159, 1, 1, 1, 1, 1,
-0.3862053, -0.4289276, -1.447114, 1, 1, 1, 1, 1,
-0.3841831, 1.108164, 0.06809322, 1, 1, 1, 1, 1,
-0.3785517, -0.2250133, -1.542273, 1, 1, 1, 1, 1,
-0.3672428, -0.5695775, -3.068762, 1, 1, 1, 1, 1,
-0.3660972, -1.460299, -2.293087, 1, 1, 1, 1, 1,
-0.3660642, -2.196415, -2.077693, 1, 1, 1, 1, 1,
-0.3633803, 1.322546, 0.9263958, 1, 1, 1, 1, 1,
-0.3599904, -0.7455689, -1.353262, 1, 1, 1, 1, 1,
-0.3584844, 1.735001, 0.6483607, 0, 0, 1, 1, 1,
-0.357157, 0.1729582, 0.6183374, 1, 0, 0, 1, 1,
-0.3491445, 1.029654, 0.1614106, 1, 0, 0, 1, 1,
-0.3455088, 0.1087703, 0.0934018, 1, 0, 0, 1, 1,
-0.3435643, -0.6297692, -1.407713, 1, 0, 0, 1, 1,
-0.3384146, -1.351136, -4.204068, 1, 0, 0, 1, 1,
-0.3373974, -0.5786474, -5.093635, 0, 0, 0, 1, 1,
-0.3359457, -0.812821, -1.747251, 0, 0, 0, 1, 1,
-0.3339797, 0.667645, -0.9070761, 0, 0, 0, 1, 1,
-0.333322, 1.176066, 0.602401, 0, 0, 0, 1, 1,
-0.3332498, 0.0583284, -1.152553, 0, 0, 0, 1, 1,
-0.3321937, -0.637274, -2.547947, 0, 0, 0, 1, 1,
-0.3297009, -0.2827732, -2.34784, 0, 0, 0, 1, 1,
-0.327275, -1.081003, -3.997457, 1, 1, 1, 1, 1,
-0.3261892, 1.336616, -1.689099, 1, 1, 1, 1, 1,
-0.3261206, -2.067649, -2.968544, 1, 1, 1, 1, 1,
-0.3225532, -0.9322019, -3.766691, 1, 1, 1, 1, 1,
-0.3181318, -0.543621, -1.353063, 1, 1, 1, 1, 1,
-0.3170913, -1.179317, -2.813475, 1, 1, 1, 1, 1,
-0.3127295, 0.5676532, -2.13666, 1, 1, 1, 1, 1,
-0.3115349, -2.101181, -4.053003, 1, 1, 1, 1, 1,
-0.3112716, 0.2395082, -2.45466, 1, 1, 1, 1, 1,
-0.3111132, -0.9659834, -2.267236, 1, 1, 1, 1, 1,
-0.3102255, 0.4118403, -1.591198, 1, 1, 1, 1, 1,
-0.3090859, 0.6909376, -1.750057, 1, 1, 1, 1, 1,
-0.3083856, 0.09958739, -1.401913, 1, 1, 1, 1, 1,
-0.3078355, 0.8283361, -1.387676, 1, 1, 1, 1, 1,
-0.3056395, -0.1695102, -0.00780554, 1, 1, 1, 1, 1,
-0.3028223, 0.2353618, -1.390674, 0, 0, 1, 1, 1,
-0.2989683, -0.5454848, -2.037763, 1, 0, 0, 1, 1,
-0.2952776, -1.178244, -2.895565, 1, 0, 0, 1, 1,
-0.2950813, -0.03236035, 0.3683949, 1, 0, 0, 1, 1,
-0.2938027, -0.759389, -2.548269, 1, 0, 0, 1, 1,
-0.2897067, -1.249072, -3.049726, 1, 0, 0, 1, 1,
-0.2771543, 2.195925, -0.7546577, 0, 0, 0, 1, 1,
-0.2747771, -1.096406, -2.404966, 0, 0, 0, 1, 1,
-0.2736412, 1.614127, 0.509568, 0, 0, 0, 1, 1,
-0.2730694, -0.8719269, -3.156024, 0, 0, 0, 1, 1,
-0.270909, 1.186924, 0.7716743, 0, 0, 0, 1, 1,
-0.269616, 0.375807, 0.4334224, 0, 0, 0, 1, 1,
-0.2695813, 0.3062975, -0.2021397, 0, 0, 0, 1, 1,
-0.2686329, -0.1226164, -1.457882, 1, 1, 1, 1, 1,
-0.2666797, -2.027669, -2.7322, 1, 1, 1, 1, 1,
-0.2663265, 0.3054931, -2.073128, 1, 1, 1, 1, 1,
-0.2643749, 0.1886582, -1.267327, 1, 1, 1, 1, 1,
-0.2584874, 0.859984, -2.272057, 1, 1, 1, 1, 1,
-0.2567851, 1.112606, 0.4927931, 1, 1, 1, 1, 1,
-0.2566636, 0.3856924, -3.187553, 1, 1, 1, 1, 1,
-0.2518349, -0.2043425, -1.481589, 1, 1, 1, 1, 1,
-0.25045, -0.2054756, -4.35196, 1, 1, 1, 1, 1,
-0.2477448, 0.4849435, -0.03342552, 1, 1, 1, 1, 1,
-0.2472529, 0.6118969, -0.06740209, 1, 1, 1, 1, 1,
-0.246282, 0.8496069, -1.026898, 1, 1, 1, 1, 1,
-0.2456751, -1.175152, -1.457889, 1, 1, 1, 1, 1,
-0.2448622, -0.4127748, -1.832191, 1, 1, 1, 1, 1,
-0.2427628, 1.144653, 0.164446, 1, 1, 1, 1, 1,
-0.2422049, -1.117209, -1.862199, 0, 0, 1, 1, 1,
-0.2374695, 1.561351, 1.213066, 1, 0, 0, 1, 1,
-0.2339134, -0.1266111, -2.711098, 1, 0, 0, 1, 1,
-0.2314873, 0.2336191, -0.3020571, 1, 0, 0, 1, 1,
-0.2265027, 0.840808, -1.455376, 1, 0, 0, 1, 1,
-0.2262333, 1.293098, -0.7432004, 1, 0, 0, 1, 1,
-0.2215864, -0.3820578, -1.773893, 0, 0, 0, 1, 1,
-0.2186368, 1.569082, 0.1636068, 0, 0, 0, 1, 1,
-0.2143573, -1.652621, -3.041208, 0, 0, 0, 1, 1,
-0.2118415, -0.298461, -2.470685, 0, 0, 0, 1, 1,
-0.2111407, -1.890121, -2.312463, 0, 0, 0, 1, 1,
-0.2111028, -0.8195246, -4.174131, 0, 0, 0, 1, 1,
-0.2035119, 0.4926015, -0.3591167, 0, 0, 0, 1, 1,
-0.1997845, -0.2365107, -2.096835, 1, 1, 1, 1, 1,
-0.1997149, 2.455727, 0.4780574, 1, 1, 1, 1, 1,
-0.1972052, -1.859018, -3.716801, 1, 1, 1, 1, 1,
-0.194282, -0.3386731, -2.727574, 1, 1, 1, 1, 1,
-0.1933153, 1.819827, 0.9311256, 1, 1, 1, 1, 1,
-0.1856769, 0.4223479, 1.553946, 1, 1, 1, 1, 1,
-0.1834388, 1.208314, -1.159011, 1, 1, 1, 1, 1,
-0.1826933, -0.01084843, 0.5020621, 1, 1, 1, 1, 1,
-0.1814337, 1.870366, -2.90091, 1, 1, 1, 1, 1,
-0.177826, 0.2681249, -1.724262, 1, 1, 1, 1, 1,
-0.1762194, -0.4364485, -3.768933, 1, 1, 1, 1, 1,
-0.1732765, -1.349057, -3.738147, 1, 1, 1, 1, 1,
-0.1658034, -0.01148727, -3.135934, 1, 1, 1, 1, 1,
-0.1656553, -0.1755252, -1.879696, 1, 1, 1, 1, 1,
-0.1620734, -0.9630473, -3.82373, 1, 1, 1, 1, 1,
-0.1610083, 0.3316796, -1.542046, 0, 0, 1, 1, 1,
-0.1600866, -1.533372, -3.453326, 1, 0, 0, 1, 1,
-0.1559154, -0.2371877, -0.8373727, 1, 0, 0, 1, 1,
-0.1530924, 1.000619, 1.353477, 1, 0, 0, 1, 1,
-0.1516459, -1.809891, -3.336816, 1, 0, 0, 1, 1,
-0.1458665, -1.91592, -3.338468, 1, 0, 0, 1, 1,
-0.1437005, 0.0782351, 0.576425, 0, 0, 0, 1, 1,
-0.1423107, 1.022851, 1.414495, 0, 0, 0, 1, 1,
-0.1410241, -0.1997268, -3.28985, 0, 0, 0, 1, 1,
-0.1403445, 1.460492, -2.025674, 0, 0, 0, 1, 1,
-0.1378627, -0.4576264, -2.869401, 0, 0, 0, 1, 1,
-0.1375273, 0.92783, -1.169953, 0, 0, 0, 1, 1,
-0.1367821, -0.681823, 0.2472373, 0, 0, 0, 1, 1,
-0.1331486, 1.070877, 0.4731049, 1, 1, 1, 1, 1,
-0.132827, 0.5781397, -0.2625571, 1, 1, 1, 1, 1,
-0.1328098, -2.154234, -4.179872, 1, 1, 1, 1, 1,
-0.131632, -0.8870993, -3.385096, 1, 1, 1, 1, 1,
-0.1313647, 1.206545, -0.1113755, 1, 1, 1, 1, 1,
-0.1260453, -0.3420706, -2.729362, 1, 1, 1, 1, 1,
-0.1118783, -0.1031725, -1.626747, 1, 1, 1, 1, 1,
-0.1118006, 0.5382293, -0.3846167, 1, 1, 1, 1, 1,
-0.1070579, -0.1819907, -2.341484, 1, 1, 1, 1, 1,
-0.1027941, 2.056794, 0.4386036, 1, 1, 1, 1, 1,
-0.1025793, -0.495625, -3.961659, 1, 1, 1, 1, 1,
-0.1016322, -0.6082393, -2.932169, 1, 1, 1, 1, 1,
-0.1005427, 1.963812, -0.2738253, 1, 1, 1, 1, 1,
-0.09879546, -1.308438, -2.731496, 1, 1, 1, 1, 1,
-0.09164632, 0.9912822, 0.6880665, 1, 1, 1, 1, 1,
-0.08940077, 0.6297234, -2.264362, 0, 0, 1, 1, 1,
-0.08844767, -0.03448436, -2.433427, 1, 0, 0, 1, 1,
-0.08678077, -2.127145, -2.279858, 1, 0, 0, 1, 1,
-0.08455503, 0.5083207, 0.3249525, 1, 0, 0, 1, 1,
-0.08442752, 1.352827, -0.4038138, 1, 0, 0, 1, 1,
-0.08120339, 0.5631343, 1.078627, 1, 0, 0, 1, 1,
-0.08107706, -1.43404, -3.233132, 0, 0, 0, 1, 1,
-0.08015545, -2.611003, -2.225206, 0, 0, 0, 1, 1,
-0.07971002, 0.4062155, 0.9330716, 0, 0, 0, 1, 1,
-0.0789117, -0.1973635, -3.096301, 0, 0, 0, 1, 1,
-0.07707205, 0.6392794, 0.9879878, 0, 0, 0, 1, 1,
-0.07203522, -1.319548, -3.004202, 0, 0, 0, 1, 1,
-0.06482031, -2.122994, -2.80968, 0, 0, 0, 1, 1,
-0.06336477, -1.466674, -3.221556, 1, 1, 1, 1, 1,
-0.05587861, -1.345752, -0.6304088, 1, 1, 1, 1, 1,
-0.05564729, -1.259874, -3.083592, 1, 1, 1, 1, 1,
-0.05529833, -0.4110584, -3.119494, 1, 1, 1, 1, 1,
-0.04788989, -0.9947636, -2.00859, 1, 1, 1, 1, 1,
-0.0422507, -0.1836623, -3.240091, 1, 1, 1, 1, 1,
-0.04152286, -1.051097, -2.137742, 1, 1, 1, 1, 1,
-0.04095605, 1.285905, 0.3527361, 1, 1, 1, 1, 1,
-0.03756696, -0.5645131, -3.069398, 1, 1, 1, 1, 1,
-0.03636738, -0.8822979, -3.39246, 1, 1, 1, 1, 1,
-0.03356176, -1.964646, -2.582818, 1, 1, 1, 1, 1,
-0.03307527, 0.01344967, -1.605252, 1, 1, 1, 1, 1,
-0.03007844, -1.736536, -3.348328, 1, 1, 1, 1, 1,
-0.03004055, -1.309515, -4.862311, 1, 1, 1, 1, 1,
-0.02778878, 0.412884, 0.7118607, 1, 1, 1, 1, 1,
-0.02478307, -0.2547718, -2.265243, 0, 0, 1, 1, 1,
-0.01994826, -1.581222, -3.54408, 1, 0, 0, 1, 1,
-0.0178209, -1.45707, -2.560791, 1, 0, 0, 1, 1,
-0.01534765, 0.2885692, 0.3497873, 1, 0, 0, 1, 1,
-0.01112526, -0.9949549, -3.764844, 1, 0, 0, 1, 1,
-0.006716498, 0.2709841, -2.720768, 1, 0, 0, 1, 1,
-0.003818218, -0.777612, -2.343551, 0, 0, 0, 1, 1,
-0.002828183, -2.195781, -1.749783, 0, 0, 0, 1, 1,
-0.001846411, 0.5547752, -1.238462, 0, 0, 0, 1, 1,
0.001304517, 0.01036446, 1.263133, 0, 0, 0, 1, 1,
0.002760028, 0.1708688, -0.615723, 0, 0, 0, 1, 1,
0.005066822, 0.5691405, -0.4509093, 0, 0, 0, 1, 1,
0.008052274, -0.3706566, 4.311089, 0, 0, 0, 1, 1,
0.008215467, 0.8239879, -0.3310952, 1, 1, 1, 1, 1,
0.008576045, -1.619144, 4.163653, 1, 1, 1, 1, 1,
0.01607762, 0.5979349, -0.5767166, 1, 1, 1, 1, 1,
0.01619472, -1.007121, 1.614181, 1, 1, 1, 1, 1,
0.01718003, 0.8700858, 0.3168694, 1, 1, 1, 1, 1,
0.01793744, -0.3105923, 3.903347, 1, 1, 1, 1, 1,
0.02287762, -0.5529456, 2.427537, 1, 1, 1, 1, 1,
0.02375782, -0.8045732, 1.353459, 1, 1, 1, 1, 1,
0.02561597, 1.674369, -1.215519, 1, 1, 1, 1, 1,
0.02570243, -0.6751901, 2.782636, 1, 1, 1, 1, 1,
0.02629399, 0.3417042, 1.519299, 1, 1, 1, 1, 1,
0.02746832, -0.969363, 2.475671, 1, 1, 1, 1, 1,
0.02832565, -0.1625988, 3.129735, 1, 1, 1, 1, 1,
0.0304898, 0.08295664, -0.6983908, 1, 1, 1, 1, 1,
0.03329824, -0.2579049, 3.044705, 1, 1, 1, 1, 1,
0.03619522, 0.5193182, -0.2841553, 0, 0, 1, 1, 1,
0.03681364, -0.4012772, 3.363643, 1, 0, 0, 1, 1,
0.0368211, -0.6954572, 1.47298, 1, 0, 0, 1, 1,
0.03859814, 0.28847, 0.2956011, 1, 0, 0, 1, 1,
0.04022731, -1.643291, 2.239253, 1, 0, 0, 1, 1,
0.04134058, 0.1649734, 0.5056939, 1, 0, 0, 1, 1,
0.0422806, -1.901576, 3.06813, 0, 0, 0, 1, 1,
0.04917278, -1.101007, 1.672914, 0, 0, 0, 1, 1,
0.04965316, -0.3970235, 4.097834, 0, 0, 0, 1, 1,
0.05119123, 0.3118829, 1.035985, 0, 0, 0, 1, 1,
0.0548415, -0.4346346, 2.852186, 0, 0, 0, 1, 1,
0.05714941, -1.169586, 3.66232, 0, 0, 0, 1, 1,
0.05772553, -0.5040731, 2.541851, 0, 0, 0, 1, 1,
0.06048731, -0.2325106, 2.1158, 1, 1, 1, 1, 1,
0.06140886, 1.54815, -0.5980783, 1, 1, 1, 1, 1,
0.06537554, -1.955872, 3.772016, 1, 1, 1, 1, 1,
0.06813589, 0.174568, 1.737033, 1, 1, 1, 1, 1,
0.07599737, -0.8743457, 4.703184, 1, 1, 1, 1, 1,
0.08329557, -1.599934, 2.957067, 1, 1, 1, 1, 1,
0.08374117, 0.4045496, 1.450049, 1, 1, 1, 1, 1,
0.08958082, -1.011197, 3.479733, 1, 1, 1, 1, 1,
0.09089123, 0.1371828, 1.691533, 1, 1, 1, 1, 1,
0.09134042, 1.324935, -0.239563, 1, 1, 1, 1, 1,
0.09618337, -1.017327, 3.140955, 1, 1, 1, 1, 1,
0.09684354, -1.193296, 2.5923, 1, 1, 1, 1, 1,
0.09803355, 0.7191138, 0.2368496, 1, 1, 1, 1, 1,
0.1005561, 0.6131676, -0.4781526, 1, 1, 1, 1, 1,
0.1020766, 0.4222777, -1.559487, 1, 1, 1, 1, 1,
0.1021534, -2.097852, 2.804699, 0, 0, 1, 1, 1,
0.1081124, 1.146888, 0.3752252, 1, 0, 0, 1, 1,
0.1127492, 0.4257621, 1.222913, 1, 0, 0, 1, 1,
0.1212295, -0.5593713, 4.149551, 1, 0, 0, 1, 1,
0.123023, -0.152305, 2.570206, 1, 0, 0, 1, 1,
0.124228, -0.7929452, 3.496683, 1, 0, 0, 1, 1,
0.1259313, 0.1328231, 2.430291, 0, 0, 0, 1, 1,
0.1280374, 0.2362988, 0.9756148, 0, 0, 0, 1, 1,
0.1294671, -0.958999, 0.9209117, 0, 0, 0, 1, 1,
0.1305755, -0.6721449, 3.998389, 0, 0, 0, 1, 1,
0.1332657, -1.212347, 2.798786, 0, 0, 0, 1, 1,
0.1336355, 1.463379, 1.921607, 0, 0, 0, 1, 1,
0.1392321, -1.398268, 3.016792, 0, 0, 0, 1, 1,
0.1478554, -1.403848, 2.676263, 1, 1, 1, 1, 1,
0.1503101, -0.6816188, 4.878572, 1, 1, 1, 1, 1,
0.1515118, 0.1015997, 0.5823728, 1, 1, 1, 1, 1,
0.1524038, -1.8045, 3.312536, 1, 1, 1, 1, 1,
0.152833, 0.02767478, 0.2245357, 1, 1, 1, 1, 1,
0.154593, -1.998178, 3.703309, 1, 1, 1, 1, 1,
0.1578881, 0.2818196, 0.07440568, 1, 1, 1, 1, 1,
0.1604471, -0.4788745, 4.055406, 1, 1, 1, 1, 1,
0.1628395, 1.313533, 1.904037, 1, 1, 1, 1, 1,
0.1634825, 0.6545513, 1.241887, 1, 1, 1, 1, 1,
0.1660231, 2.641085, -0.4561668, 1, 1, 1, 1, 1,
0.1677032, -0.2765226, 0.3377108, 1, 1, 1, 1, 1,
0.1682207, 1.590951, -0.8497407, 1, 1, 1, 1, 1,
0.1684482, -0.2363616, 3.824709, 1, 1, 1, 1, 1,
0.174324, -0.0290251, 1.108369, 1, 1, 1, 1, 1,
0.1750401, 0.4023923, 1.785019, 0, 0, 1, 1, 1,
0.1760234, 1.081987, -1.449533, 1, 0, 0, 1, 1,
0.1764389, 0.152778, 0.2291002, 1, 0, 0, 1, 1,
0.1791321, -0.8128695, 2.845962, 1, 0, 0, 1, 1,
0.2019776, 1.546294, 0.4478195, 1, 0, 0, 1, 1,
0.203218, -2.180804, 2.176056, 1, 0, 0, 1, 1,
0.2041524, -1.115381, 3.477111, 0, 0, 0, 1, 1,
0.2085039, 0.08894508, 1.677999, 0, 0, 0, 1, 1,
0.210329, 0.2673385, 0.6433686, 0, 0, 0, 1, 1,
0.2103572, 0.612459, 1.012808, 0, 0, 0, 1, 1,
0.2146418, 0.1256929, 1.596292, 0, 0, 0, 1, 1,
0.2199987, 0.1963682, 1.067097, 0, 0, 0, 1, 1,
0.2210444, -0.3923687, 2.068646, 0, 0, 0, 1, 1,
0.2244252, -0.04203228, 1.12058, 1, 1, 1, 1, 1,
0.2290078, -1.420068, 3.305859, 1, 1, 1, 1, 1,
0.2299744, -0.2080285, 0.49228, 1, 1, 1, 1, 1,
0.229982, 0.9669299, 0.3578131, 1, 1, 1, 1, 1,
0.2306072, 0.8435125, 1.992191, 1, 1, 1, 1, 1,
0.2327158, 0.9331359, 0.1642868, 1, 1, 1, 1, 1,
0.2335484, -2.085078, 2.551587, 1, 1, 1, 1, 1,
0.2378027, -0.8961843, 3.602069, 1, 1, 1, 1, 1,
0.2387361, -0.3318505, 0.6886613, 1, 1, 1, 1, 1,
0.2387976, -0.3858791, 1.812307, 1, 1, 1, 1, 1,
0.2398322, 0.2186774, 1.645682, 1, 1, 1, 1, 1,
0.2409517, -1.431899, 3.447184, 1, 1, 1, 1, 1,
0.2448046, 1.279855, -1.321037, 1, 1, 1, 1, 1,
0.2469149, -0.628347, 1.707943, 1, 1, 1, 1, 1,
0.2474526, 0.3767531, 0.1798583, 1, 1, 1, 1, 1,
0.2491297, 0.5148121, -0.8144795, 0, 0, 1, 1, 1,
0.2562396, 0.09425575, 1.647403, 1, 0, 0, 1, 1,
0.2592692, -0.4691176, 2.944415, 1, 0, 0, 1, 1,
0.2599151, 1.259646, 0.5153052, 1, 0, 0, 1, 1,
0.2660719, 0.1077796, 2.773938, 1, 0, 0, 1, 1,
0.268565, 0.7206715, 0.4801102, 1, 0, 0, 1, 1,
0.271572, -0.1287565, 2.312732, 0, 0, 0, 1, 1,
0.2833615, -0.3554984, 2.393524, 0, 0, 0, 1, 1,
0.2848311, 0.6232385, -0.6488937, 0, 0, 0, 1, 1,
0.2860029, 0.3158166, 0.5156274, 0, 0, 0, 1, 1,
0.2871063, 0.03076549, 2.509079, 0, 0, 0, 1, 1,
0.2920229, 0.7240952, 0.1716955, 0, 0, 0, 1, 1,
0.2960334, -0.8011574, 2.650308, 0, 0, 0, 1, 1,
0.2987357, 0.09584525, 0.8162408, 1, 1, 1, 1, 1,
0.2995873, 0.5796312, 1.749198, 1, 1, 1, 1, 1,
0.3043674, -0.8877606, 3.48165, 1, 1, 1, 1, 1,
0.3160509, -0.5692858, 1.797164, 1, 1, 1, 1, 1,
0.3170868, 0.8401234, 0.1056096, 1, 1, 1, 1, 1,
0.3181076, 0.05737114, 0.008460151, 1, 1, 1, 1, 1,
0.320321, 1.964843, -0.3543639, 1, 1, 1, 1, 1,
0.3210042, 0.2990889, 1.191428, 1, 1, 1, 1, 1,
0.3280011, 0.3383437, 1.116962, 1, 1, 1, 1, 1,
0.3285822, 0.477082, 2.36894, 1, 1, 1, 1, 1,
0.3309884, 1.313293, 1.126804, 1, 1, 1, 1, 1,
0.3319685, -0.08281588, 1.798983, 1, 1, 1, 1, 1,
0.3320754, 0.4361522, -1.414178, 1, 1, 1, 1, 1,
0.3344555, 1.676609, 0.5963974, 1, 1, 1, 1, 1,
0.3351258, 0.2726925, -0.7140638, 1, 1, 1, 1, 1,
0.3374238, 0.4752664, -0.1310705, 0, 0, 1, 1, 1,
0.3399843, 0.002555099, 2.483324, 1, 0, 0, 1, 1,
0.3403983, 1.724137, -1.401427, 1, 0, 0, 1, 1,
0.3424983, -0.4206399, 1.776815, 1, 0, 0, 1, 1,
0.3445241, 1.294112, 1.054746, 1, 0, 0, 1, 1,
0.3457183, -0.8340699, 2.785632, 1, 0, 0, 1, 1,
0.3468925, -0.7345856, 4.163091, 0, 0, 0, 1, 1,
0.3476228, 0.8037503, 1.181303, 0, 0, 0, 1, 1,
0.3519787, 0.9078486, 1.1125, 0, 0, 0, 1, 1,
0.3529185, 0.5765977, 0.6517223, 0, 0, 0, 1, 1,
0.3549034, 1.468708, 0.3018876, 0, 0, 0, 1, 1,
0.3563597, -0.1027644, 3.737736, 0, 0, 0, 1, 1,
0.3589073, -2.199782, 1.563338, 0, 0, 0, 1, 1,
0.361456, 0.2163099, 0.7251576, 1, 1, 1, 1, 1,
0.3625717, 0.8359006, 1.158025, 1, 1, 1, 1, 1,
0.3647121, 1.652966, -0.5909777, 1, 1, 1, 1, 1,
0.3768057, 0.9240815, 0.9384491, 1, 1, 1, 1, 1,
0.3787501, 1.15325, 0.7055608, 1, 1, 1, 1, 1,
0.3831506, 0.2817974, 0.2091034, 1, 1, 1, 1, 1,
0.3872649, -1.344355, 4.120452, 1, 1, 1, 1, 1,
0.3883517, -1.571826, 4.488703, 1, 1, 1, 1, 1,
0.3883584, -1.672946, 2.482572, 1, 1, 1, 1, 1,
0.3888795, 0.08381978, 2.899562, 1, 1, 1, 1, 1,
0.3896979, 0.1659984, 2.693782, 1, 1, 1, 1, 1,
0.3898984, -0.2114431, 2.525237, 1, 1, 1, 1, 1,
0.3901242, -1.343058, 1.464032, 1, 1, 1, 1, 1,
0.3921655, -0.6982051, 2.091085, 1, 1, 1, 1, 1,
0.3936667, -1.429115, 2.461242, 1, 1, 1, 1, 1,
0.3941594, 0.110967, 1.203212, 0, 0, 1, 1, 1,
0.3978302, -0.4215513, 2.477371, 1, 0, 0, 1, 1,
0.3979934, -0.1354513, 2.071492, 1, 0, 0, 1, 1,
0.398948, -1.085747, 0.9920728, 1, 0, 0, 1, 1,
0.4010921, 0.694247, 0.8770322, 1, 0, 0, 1, 1,
0.4019698, -1.440907, 1.223173, 1, 0, 0, 1, 1,
0.4034657, 0.2661082, -0.8346807, 0, 0, 0, 1, 1,
0.4034838, 0.8671786, -0.371318, 0, 0, 0, 1, 1,
0.4042604, 0.7703555, 0.9868371, 0, 0, 0, 1, 1,
0.4045278, -0.3749333, 2.91451, 0, 0, 0, 1, 1,
0.4055843, 0.4807694, 1.017271, 0, 0, 0, 1, 1,
0.4128484, 1.34525, -0.09929728, 0, 0, 0, 1, 1,
0.4152902, -1.542144, 3.993377, 0, 0, 0, 1, 1,
0.4170384, 0.8818354, 0.6556715, 1, 1, 1, 1, 1,
0.4178059, 0.1664342, 1.965312, 1, 1, 1, 1, 1,
0.4230552, 1.629903, -0.6272414, 1, 1, 1, 1, 1,
0.4248003, 0.1040208, 2.259957, 1, 1, 1, 1, 1,
0.4284608, -0.06183797, 1.860778, 1, 1, 1, 1, 1,
0.4325193, 0.2451361, 0.6431346, 1, 1, 1, 1, 1,
0.4336551, 0.8903595, 0.9681481, 1, 1, 1, 1, 1,
0.437551, -0.02657258, 0.8969309, 1, 1, 1, 1, 1,
0.4383064, -0.4769168, 2.194586, 1, 1, 1, 1, 1,
0.4390649, -0.8551012, 1.618233, 1, 1, 1, 1, 1,
0.4402467, 0.6232776, 1.065138, 1, 1, 1, 1, 1,
0.4417789, -0.03240972, 2.819435, 1, 1, 1, 1, 1,
0.4468245, 1.205818, 0.2510147, 1, 1, 1, 1, 1,
0.4502032, -0.2266306, 2.719716, 1, 1, 1, 1, 1,
0.4515875, -1.118235, 1.065534, 1, 1, 1, 1, 1,
0.4565624, -0.1575642, 2.447466, 0, 0, 1, 1, 1,
0.4583749, 0.1609043, 2.079101, 1, 0, 0, 1, 1,
0.4592584, -1.481868, 3.005135, 1, 0, 0, 1, 1,
0.46067, -0.418604, 1.96315, 1, 0, 0, 1, 1,
0.4618409, 0.8936252, 1.247657, 1, 0, 0, 1, 1,
0.4667849, -0.1203424, 2.075884, 1, 0, 0, 1, 1,
0.4682985, 0.2390244, 1.024452, 0, 0, 0, 1, 1,
0.4693982, 0.6304741, 3.250515, 0, 0, 0, 1, 1,
0.47326, 0.3848982, -0.08572719, 0, 0, 0, 1, 1,
0.4756694, -1.433587, 4.443926, 0, 0, 0, 1, 1,
0.4758834, -0.2748487, 1.826573, 0, 0, 0, 1, 1,
0.4784859, -0.1771568, 1.632957, 0, 0, 0, 1, 1,
0.4816251, 1.445052, 1.518735, 0, 0, 0, 1, 1,
0.4845842, 0.3845329, 1.681821, 1, 1, 1, 1, 1,
0.4871563, -0.02061856, 0.9448611, 1, 1, 1, 1, 1,
0.4915671, 1.678911, 0.1929158, 1, 1, 1, 1, 1,
0.4919725, -0.7875823, 2.364716, 1, 1, 1, 1, 1,
0.4931115, -0.4336452, 3.157776, 1, 1, 1, 1, 1,
0.4959391, -0.2682171, 1.25511, 1, 1, 1, 1, 1,
0.4976807, 0.3023851, 0.1564562, 1, 1, 1, 1, 1,
0.5004381, -0.5995991, 3.547516, 1, 1, 1, 1, 1,
0.5035603, -0.7690738, 4.352344, 1, 1, 1, 1, 1,
0.5041969, -1.190311, 0.9503198, 1, 1, 1, 1, 1,
0.5045156, -0.771223, 2.518296, 1, 1, 1, 1, 1,
0.5066162, 0.8657962, -0.04235558, 1, 1, 1, 1, 1,
0.5069407, 1.72106, 0.7085961, 1, 1, 1, 1, 1,
0.5081465, 0.2675992, 0.7648703, 1, 1, 1, 1, 1,
0.5099853, 0.4888367, 0.3302009, 1, 1, 1, 1, 1,
0.5099996, -0.3111267, 0.4930948, 0, 0, 1, 1, 1,
0.5112804, 0.01708967, 1.885802, 1, 0, 0, 1, 1,
0.5123056, -0.9516231, 4.772094, 1, 0, 0, 1, 1,
0.5132244, 2.383864, 2.371562, 1, 0, 0, 1, 1,
0.5184076, -0.3577282, 4.262097, 1, 0, 0, 1, 1,
0.5291242, 0.155729, 0.006028938, 1, 0, 0, 1, 1,
0.5294144, -0.6775639, 2.496201, 0, 0, 0, 1, 1,
0.5310079, 0.844427, -0.4195939, 0, 0, 0, 1, 1,
0.5320623, 1.933967, 0.1326959, 0, 0, 0, 1, 1,
0.5333663, 0.1374077, 1.82901, 0, 0, 0, 1, 1,
0.5351201, 1.059193, 0.9968155, 0, 0, 0, 1, 1,
0.5429283, 0.0288318, 3.057225, 0, 0, 0, 1, 1,
0.5437374, 1.612489, 2.084354, 0, 0, 0, 1, 1,
0.5437438, 1.955647, 1.318526, 1, 1, 1, 1, 1,
0.5460709, -0.163215, 3.074467, 1, 1, 1, 1, 1,
0.5501893, -1.724116, 2.164635, 1, 1, 1, 1, 1,
0.5533657, 0.0338321, 0.729691, 1, 1, 1, 1, 1,
0.5545924, 0.6399795, 1.760616, 1, 1, 1, 1, 1,
0.5579937, -0.5950949, 3.665193, 1, 1, 1, 1, 1,
0.5599544, -1.058978, 3.868666, 1, 1, 1, 1, 1,
0.5606475, -1.729405, 3.53155, 1, 1, 1, 1, 1,
0.5629975, 0.1852177, 1.482108, 1, 1, 1, 1, 1,
0.5640478, 0.3295569, 1.995119, 1, 1, 1, 1, 1,
0.5641801, 1.669151, -0.3911137, 1, 1, 1, 1, 1,
0.5664378, 0.5881448, 0.327632, 1, 1, 1, 1, 1,
0.5669303, -1.340063, 3.239881, 1, 1, 1, 1, 1,
0.5707036, 1.539973, 1.792227, 1, 1, 1, 1, 1,
0.5721824, -0.2807421, 2.067592, 1, 1, 1, 1, 1,
0.5765752, -0.4097209, 2.077959, 0, 0, 1, 1, 1,
0.5772957, -1.743781, 4.030065, 1, 0, 0, 1, 1,
0.5859274, -0.5452581, 2.385799, 1, 0, 0, 1, 1,
0.5861619, -2.5601, 2.295524, 1, 0, 0, 1, 1,
0.5893589, -0.3929546, 2.549828, 1, 0, 0, 1, 1,
0.5930725, 0.1789717, 2.365658, 1, 0, 0, 1, 1,
0.5967664, 0.8208497, 1.696488, 0, 0, 0, 1, 1,
0.5984403, -1.181081, 0.9918805, 0, 0, 0, 1, 1,
0.6003176, -0.5254723, 1.87409, 0, 0, 0, 1, 1,
0.6028864, -1.314255, 4.18416, 0, 0, 0, 1, 1,
0.6060023, -0.02514776, 1.139251, 0, 0, 0, 1, 1,
0.6095201, 0.08513688, 1.116003, 0, 0, 0, 1, 1,
0.6188486, 0.8363604, 0.4203516, 0, 0, 0, 1, 1,
0.6199598, -0.8764703, 1.663861, 1, 1, 1, 1, 1,
0.6201093, 2.072957, 0.5951056, 1, 1, 1, 1, 1,
0.6295527, 2.06426, 0.1832213, 1, 1, 1, 1, 1,
0.6309718, -0.3023233, 3.886482, 1, 1, 1, 1, 1,
0.6325357, -1.548623, 2.118221, 1, 1, 1, 1, 1,
0.6340273, -0.3460257, 2.932679, 1, 1, 1, 1, 1,
0.6499076, 1.30499, -0.8662211, 1, 1, 1, 1, 1,
0.6513684, 0.02979073, 3.388211, 1, 1, 1, 1, 1,
0.6529726, 1.508341, -0.1312762, 1, 1, 1, 1, 1,
0.6531944, 0.3664494, 0.4216714, 1, 1, 1, 1, 1,
0.6553645, 0.421014, 1.491877, 1, 1, 1, 1, 1,
0.6557773, 0.7558805, 0.9381096, 1, 1, 1, 1, 1,
0.6571455, -2.559878, 3.374296, 1, 1, 1, 1, 1,
0.6606065, -1.237139, 2.089086, 1, 1, 1, 1, 1,
0.6655012, 1.299087, 1.860002, 1, 1, 1, 1, 1,
0.6750515, 1.092939, 1.622094, 0, 0, 1, 1, 1,
0.6774929, 1.104204, 1.544438, 1, 0, 0, 1, 1,
0.6820261, -0.1502989, 0.6860163, 1, 0, 0, 1, 1,
0.6832002, -0.02276707, 2.414483, 1, 0, 0, 1, 1,
0.6861365, -1.163251, 3.641286, 1, 0, 0, 1, 1,
0.6864599, 0.5770208, -0.8284206, 1, 0, 0, 1, 1,
0.6905, -2.424434, 1.146296, 0, 0, 0, 1, 1,
0.6917509, -0.4542788, 2.397704, 0, 0, 0, 1, 1,
0.6962858, 0.4695877, 1.91513, 0, 0, 0, 1, 1,
0.7095738, -0.4698775, 2.462809, 0, 0, 0, 1, 1,
0.7136518, 0.2809365, 1.167998, 0, 0, 0, 1, 1,
0.7147852, 2.648664, 0.1627889, 0, 0, 0, 1, 1,
0.7198638, -0.5378169, 2.419826, 0, 0, 0, 1, 1,
0.7220242, -0.7374433, 2.08628, 1, 1, 1, 1, 1,
0.7220899, -0.08870646, 0.3970457, 1, 1, 1, 1, 1,
0.7243646, -1.951494, 2.856942, 1, 1, 1, 1, 1,
0.7311339, -0.04896727, 0.6948129, 1, 1, 1, 1, 1,
0.7353768, -0.1520852, 1.311517, 1, 1, 1, 1, 1,
0.7360405, -1.085451, 2.775939, 1, 1, 1, 1, 1,
0.7378995, -1.027869, 3.214353, 1, 1, 1, 1, 1,
0.7396911, -0.07235454, 2.784223, 1, 1, 1, 1, 1,
0.7397814, -0.2015074, 2.238602, 1, 1, 1, 1, 1,
0.7476491, 0.8775992, 1.786296, 1, 1, 1, 1, 1,
0.7510979, -0.7897673, 2.354345, 1, 1, 1, 1, 1,
0.7511756, -0.1088217, 1.487316, 1, 1, 1, 1, 1,
0.752578, -0.1048742, 0.4799537, 1, 1, 1, 1, 1,
0.7582342, 1.078259, -1.366591, 1, 1, 1, 1, 1,
0.7764862, 0.6770414, 0.8860924, 1, 1, 1, 1, 1,
0.7789216, -0.597294, 2.575028, 0, 0, 1, 1, 1,
0.7851121, 0.4370753, 1.980325, 1, 0, 0, 1, 1,
0.7852771, 1.130596, 1.521877, 1, 0, 0, 1, 1,
0.7865668, 0.05641528, 0.7899963, 1, 0, 0, 1, 1,
0.7995881, -0.7270407, 2.832446, 1, 0, 0, 1, 1,
0.8105542, -0.8422321, 0.6406904, 1, 0, 0, 1, 1,
0.8150665, 0.4147955, 1.926033, 0, 0, 0, 1, 1,
0.8166, -0.3774989, 1.376044, 0, 0, 0, 1, 1,
0.817278, -0.01847383, 2.459795, 0, 0, 0, 1, 1,
0.8183106, -0.007920275, 1.333429, 0, 0, 0, 1, 1,
0.8191099, -0.6771008, 1.107421, 0, 0, 0, 1, 1,
0.8249233, -0.2917093, 1.908517, 0, 0, 0, 1, 1,
0.8288398, 0.1193774, 2.147048, 0, 0, 0, 1, 1,
0.8406371, -1.194437, 1.435631, 1, 1, 1, 1, 1,
0.8437866, 0.6689819, 0.3873999, 1, 1, 1, 1, 1,
0.8451585, 0.09349976, 3.246562, 1, 1, 1, 1, 1,
0.8467418, 1.467204, 0.3535922, 1, 1, 1, 1, 1,
0.8590032, -0.2346562, 0.2546915, 1, 1, 1, 1, 1,
0.8596125, -0.3992905, 0.6524302, 1, 1, 1, 1, 1,
0.8629054, -0.3803101, 2.000313, 1, 1, 1, 1, 1,
0.8639784, 0.1965142, 2.374053, 1, 1, 1, 1, 1,
0.866231, 1.249816, 1.343673, 1, 1, 1, 1, 1,
0.8705393, -1.180624, 1.99437, 1, 1, 1, 1, 1,
0.8834159, 0.6549345, 1.068908, 1, 1, 1, 1, 1,
0.8855511, -0.5002302, 3.970903, 1, 1, 1, 1, 1,
0.8918429, 0.8573022, 1.563837, 1, 1, 1, 1, 1,
0.8922236, -0.761328, 1.602089, 1, 1, 1, 1, 1,
0.8940402, 2.100764, -0.055531, 1, 1, 1, 1, 1,
0.8963253, -1.583707, 2.137189, 0, 0, 1, 1, 1,
0.9023477, -1.036459, 2.620728, 1, 0, 0, 1, 1,
0.9039884, -0.198183, 0.444401, 1, 0, 0, 1, 1,
0.911697, -0.5286701, 3.352166, 1, 0, 0, 1, 1,
0.9210818, -0.7909942, 0.7561114, 1, 0, 0, 1, 1,
0.9290616, -1.799139, 1.198193, 1, 0, 0, 1, 1,
0.9325625, -0.2148566, 2.520049, 0, 0, 0, 1, 1,
0.9342642, -0.898058, 2.671625, 0, 0, 0, 1, 1,
0.9378302, 2.293731, 0.7076444, 0, 0, 0, 1, 1,
0.9514297, 0.6176722, 0.1450361, 0, 0, 0, 1, 1,
0.9529104, -2.516987, 2.950854, 0, 0, 0, 1, 1,
0.957288, -1.38302, 2.263061, 0, 0, 0, 1, 1,
0.9603811, -1.185795, 2.602653, 0, 0, 0, 1, 1,
0.9610128, -0.3919418, 0.8837291, 1, 1, 1, 1, 1,
0.96365, -0.3820328, 1.467493, 1, 1, 1, 1, 1,
0.9678133, 2.53327, -0.1083648, 1, 1, 1, 1, 1,
0.969317, 1.408499, 1.745002, 1, 1, 1, 1, 1,
0.9705299, -0.8484938, 2.523663, 1, 1, 1, 1, 1,
0.9713163, -0.739249, 0.132336, 1, 1, 1, 1, 1,
0.9746297, -1.15062, 0.8856932, 1, 1, 1, 1, 1,
0.9779029, 0.465078, 0.6232505, 1, 1, 1, 1, 1,
0.9801252, -0.5793163, 1.797277, 1, 1, 1, 1, 1,
0.9842323, -0.5904338, 4.030259, 1, 1, 1, 1, 1,
0.9844385, -0.04208016, 0.8723481, 1, 1, 1, 1, 1,
0.9916098, -0.1846876, 0.4462841, 1, 1, 1, 1, 1,
0.9935372, -0.8080204, 2.907672, 1, 1, 1, 1, 1,
0.9950344, -1.059504, 0.8366019, 1, 1, 1, 1, 1,
0.9959648, 1.843323, -1.733592, 1, 1, 1, 1, 1,
0.9960737, 1.559778, 1.260827, 0, 0, 1, 1, 1,
0.9976979, 0.887971, -0.5598546, 1, 0, 0, 1, 1,
0.9980087, 0.08763149, 2.66625, 1, 0, 0, 1, 1,
1.001137, 0.3360282, 1.167204, 1, 0, 0, 1, 1,
1.00679, -0.4556782, 1.282187, 1, 0, 0, 1, 1,
1.013825, 0.2857048, 2.041027, 1, 0, 0, 1, 1,
1.016258, -1.128299, 2.910156, 0, 0, 0, 1, 1,
1.020043, 1.249916, 1.151036, 0, 0, 0, 1, 1,
1.03511, -0.3640703, 1.291581, 0, 0, 0, 1, 1,
1.044059, 1.187657, 1.16548, 0, 0, 0, 1, 1,
1.046243, -0.7017293, 2.528139, 0, 0, 0, 1, 1,
1.049375, -0.595329, 2.264166, 0, 0, 0, 1, 1,
1.055491, -0.630788, 0.697711, 0, 0, 0, 1, 1,
1.059441, -0.4788642, 2.527817, 1, 1, 1, 1, 1,
1.060727, -0.4733677, 2.684709, 1, 1, 1, 1, 1,
1.069326, 0.2616917, 1.113766, 1, 1, 1, 1, 1,
1.069886, 0.5878614, -0.4916016, 1, 1, 1, 1, 1,
1.07144, -0.5473416, 2.791631, 1, 1, 1, 1, 1,
1.076307, -0.1367965, 0.004109437, 1, 1, 1, 1, 1,
1.080904, 0.3209517, 1.123952, 1, 1, 1, 1, 1,
1.091082, -0.7836815, 1.928959, 1, 1, 1, 1, 1,
1.100271, 0.07012194, 0.8809084, 1, 1, 1, 1, 1,
1.11652, -0.09483703, 1.317038, 1, 1, 1, 1, 1,
1.119063, 0.8957351, 0.9261664, 1, 1, 1, 1, 1,
1.125119, 0.05050325, 0.3459832, 1, 1, 1, 1, 1,
1.125313, -0.8952732, 2.698917, 1, 1, 1, 1, 1,
1.135543, 0.6547351, 1.772954, 1, 1, 1, 1, 1,
1.138852, -1.591422, 2.427939, 1, 1, 1, 1, 1,
1.138858, -0.05047947, 1.433472, 0, 0, 1, 1, 1,
1.142998, -0.7693833, 3.080554, 1, 0, 0, 1, 1,
1.1456, 0.5723182, -1.456881, 1, 0, 0, 1, 1,
1.149095, 0.5265922, 2.000933, 1, 0, 0, 1, 1,
1.149517, 0.8485302, 0.4702281, 1, 0, 0, 1, 1,
1.157171, -0.9426261, 1.513881, 1, 0, 0, 1, 1,
1.158068, -0.5486765, 1.775864, 0, 0, 0, 1, 1,
1.158092, 0.3709946, -1.222217, 0, 0, 0, 1, 1,
1.166195, 0.0973582, 0.5131207, 0, 0, 0, 1, 1,
1.178382, 1.604781, 0.6166262, 0, 0, 0, 1, 1,
1.181465, 0.4804857, 2.183397, 0, 0, 0, 1, 1,
1.19133, -0.7332784, 3.054209, 0, 0, 0, 1, 1,
1.194498, -1.069849, 2.59007, 0, 0, 0, 1, 1,
1.19683, 0.3045401, 1.822703, 1, 1, 1, 1, 1,
1.198705, -1.172876, 1.67067, 1, 1, 1, 1, 1,
1.198877, -0.01951378, 2.278254, 1, 1, 1, 1, 1,
1.207085, -0.8230339, 2.291748, 1, 1, 1, 1, 1,
1.208987, 0.5170017, -0.006798624, 1, 1, 1, 1, 1,
1.215962, -0.6003734, 1.173736, 1, 1, 1, 1, 1,
1.217737, -1.406385, 2.401299, 1, 1, 1, 1, 1,
1.219043, 0.7827868, 0.5820526, 1, 1, 1, 1, 1,
1.229194, 0.4957851, 0.9166657, 1, 1, 1, 1, 1,
1.240335, 0.2592312, 1.849357, 1, 1, 1, 1, 1,
1.243044, -0.8826482, 3.311786, 1, 1, 1, 1, 1,
1.244098, -1.586404, 2.808558, 1, 1, 1, 1, 1,
1.244817, -0.5797029, 3.337665, 1, 1, 1, 1, 1,
1.258556, 0.330326, 0.3361583, 1, 1, 1, 1, 1,
1.258592, -1.322455, 0.5262644, 1, 1, 1, 1, 1,
1.263413, -0.1742358, 0.8523857, 0, 0, 1, 1, 1,
1.264628, 1.692927, 0.3056234, 1, 0, 0, 1, 1,
1.274091, 1.166983, 0.1846612, 1, 0, 0, 1, 1,
1.278985, 1.047168, 0.7188721, 1, 0, 0, 1, 1,
1.28516, -1.239565, 0.9183771, 1, 0, 0, 1, 1,
1.287015, -0.9920414, 2.506821, 1, 0, 0, 1, 1,
1.293104, -0.6962813, 1.909894, 0, 0, 0, 1, 1,
1.307683, 0.5520786, -0.266102, 0, 0, 0, 1, 1,
1.318817, 0.1140847, 1.092805, 0, 0, 0, 1, 1,
1.324962, -0.06995938, 0.605171, 0, 0, 0, 1, 1,
1.333837, 0.0259035, 1.011755, 0, 0, 0, 1, 1,
1.335361, 1.1032, 1.094734, 0, 0, 0, 1, 1,
1.34106, 0.1901331, 0.552772, 0, 0, 0, 1, 1,
1.343266, 0.44195, 0.6048682, 1, 1, 1, 1, 1,
1.354812, 0.5721233, 0.9602723, 1, 1, 1, 1, 1,
1.355744, -1.027718, 1.991188, 1, 1, 1, 1, 1,
1.371584, -0.05490283, 2.249248, 1, 1, 1, 1, 1,
1.380336, -0.6900895, 1.028983, 1, 1, 1, 1, 1,
1.384166, -0.2381086, 0.9203699, 1, 1, 1, 1, 1,
1.385451, -1.27352, 1.338127, 1, 1, 1, 1, 1,
1.389856, 1.380731, 3.72325, 1, 1, 1, 1, 1,
1.398921, 0.452574, 0.4758984, 1, 1, 1, 1, 1,
1.415696, 0.6239166, -0.8102952, 1, 1, 1, 1, 1,
1.431179, -0.4808803, 2.338975, 1, 1, 1, 1, 1,
1.432385, 0.4667677, 1.587666, 1, 1, 1, 1, 1,
1.433468, -0.06618717, 2.565229, 1, 1, 1, 1, 1,
1.439231, -1.489227, 1.147557, 1, 1, 1, 1, 1,
1.441855, -0.3023506, 1.252835, 1, 1, 1, 1, 1,
1.443183, 0.2662852, 0.4722997, 0, 0, 1, 1, 1,
1.444815, -0.4311812, 1.49925, 1, 0, 0, 1, 1,
1.448034, 0.5046253, 3.355133, 1, 0, 0, 1, 1,
1.452314, -0.536149, 2.949728, 1, 0, 0, 1, 1,
1.461104, 0.6742058, 3.029364, 1, 0, 0, 1, 1,
1.468792, 1.470506, 0.8980157, 1, 0, 0, 1, 1,
1.481248, 0.4429838, 1.66107, 0, 0, 0, 1, 1,
1.50788, 0.750952, 1.761018, 0, 0, 0, 1, 1,
1.512666, 0.7326148, 0.6463416, 0, 0, 0, 1, 1,
1.519171, -0.1479506, 1.890421, 0, 0, 0, 1, 1,
1.520067, -0.5909474, 3.098619, 0, 0, 0, 1, 1,
1.52154, -0.02551195, 2.648807, 0, 0, 0, 1, 1,
1.523447, -0.8033419, 3.712891, 0, 0, 0, 1, 1,
1.524233, 0.7717946, 1.720008, 1, 1, 1, 1, 1,
1.540693, 0.9718248, 1.729977, 1, 1, 1, 1, 1,
1.572526, 0.5457614, -0.4243586, 1, 1, 1, 1, 1,
1.577293, -1.317794, 1.402024, 1, 1, 1, 1, 1,
1.590683, -1.641293, 2.213758, 1, 1, 1, 1, 1,
1.593158, 1.011314, 0.8140312, 1, 1, 1, 1, 1,
1.593344, 0.4514584, 1.298971, 1, 1, 1, 1, 1,
1.606915, -1.183649, 2.843236, 1, 1, 1, 1, 1,
1.60732, 1.089981, 0.4303902, 1, 1, 1, 1, 1,
1.607878, 1.690555, 0.773997, 1, 1, 1, 1, 1,
1.614674, -2.723713, 3.088026, 1, 1, 1, 1, 1,
1.622461, -0.4594383, 0.5501388, 1, 1, 1, 1, 1,
1.636391, -1.517196, 0.6000491, 1, 1, 1, 1, 1,
1.645233, 0.7822063, 0.6419896, 1, 1, 1, 1, 1,
1.647053, 1.651026, 1.06733, 1, 1, 1, 1, 1,
1.647775, -1.442786, 2.030034, 0, 0, 1, 1, 1,
1.649444, 0.3575185, 0.7068053, 1, 0, 0, 1, 1,
1.666797, 0.3151525, 1.365542, 1, 0, 0, 1, 1,
1.669742, -0.4096043, 3.12374, 1, 0, 0, 1, 1,
1.67362, 1.415788, -1.583152, 1, 0, 0, 1, 1,
1.685243, 1.200637, 1.201402, 1, 0, 0, 1, 1,
1.688393, 0.7639659, 1.675812, 0, 0, 0, 1, 1,
1.693344, 1.03879, 1.763164, 0, 0, 0, 1, 1,
1.723289, 0.01382411, 1.500796, 0, 0, 0, 1, 1,
1.750085, 2.525535, 0.8142348, 0, 0, 0, 1, 1,
1.762886, 1.527615, 1.08799, 0, 0, 0, 1, 1,
1.764151, -2.260831, 0.6113063, 0, 0, 0, 1, 1,
1.765525, -2.445325, 2.701235, 0, 0, 0, 1, 1,
1.770699, -2.782578, 1.727601, 1, 1, 1, 1, 1,
1.778438, -0.04811706, 1.348289, 1, 1, 1, 1, 1,
1.805344, -0.4463548, 1.983833, 1, 1, 1, 1, 1,
1.817879, 0.3306705, -0.179103, 1, 1, 1, 1, 1,
1.820364, 0.3838436, 0.9421744, 1, 1, 1, 1, 1,
1.857395, 1.082064, 2.258216, 1, 1, 1, 1, 1,
1.866635, -1.349495, 2.300243, 1, 1, 1, 1, 1,
1.876492, -0.9018031, 3.30073, 1, 1, 1, 1, 1,
1.883476, -0.1916396, 1.557643, 1, 1, 1, 1, 1,
1.92568, -0.3432324, 0.3251465, 1, 1, 1, 1, 1,
1.94646, -0.2370787, 1.922189, 1, 1, 1, 1, 1,
1.961199, 0.2027574, 2.216598, 1, 1, 1, 1, 1,
1.981395, 1.306229, 0.8266968, 1, 1, 1, 1, 1,
2.007707, -0.2914576, 0.7680775, 1, 1, 1, 1, 1,
2.033353, -0.8476434, 1.555374, 1, 1, 1, 1, 1,
2.071308, 1.303439, 2.840224, 0, 0, 1, 1, 1,
2.143215, -0.8664992, 2.41246, 1, 0, 0, 1, 1,
2.190077, 0.5417171, 0.2449771, 1, 0, 0, 1, 1,
2.194525, 1.105296, 3.681436, 1, 0, 0, 1, 1,
2.26504, 0.1928025, 0.2871712, 1, 0, 0, 1, 1,
2.35004, 0.3258807, 1.613412, 1, 0, 0, 1, 1,
2.367114, -0.5409063, 2.301404, 0, 0, 0, 1, 1,
2.470495, 0.2586016, 3.246219, 0, 0, 0, 1, 1,
2.529077, -1.78395, 3.612222, 0, 0, 0, 1, 1,
2.537258, -1.599375, 2.591642, 0, 0, 0, 1, 1,
2.572536, -0.3729017, 1.59294, 0, 0, 0, 1, 1,
2.574419, 0.3117466, 0.9277989, 0, 0, 0, 1, 1,
2.585958, -1.118194, 2.626821, 0, 0, 0, 1, 1,
2.714528, -1.801124, 3.114435, 1, 1, 1, 1, 1,
2.717694, -0.5688578, 3.059234, 1, 1, 1, 1, 1,
2.731388, -0.2552323, 1.817384, 1, 1, 1, 1, 1,
2.768825, -0.5849913, 1.281262, 1, 1, 1, 1, 1,
3.00268, 1.278491, 2.123166, 1, 1, 1, 1, 1,
3.207537, -0.3071582, 3.565605, 1, 1, 1, 1, 1,
3.365574, -0.004372236, 2.572331, 1, 1, 1, 1, 1
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
var radius = 9.204115;
var distance = 32.32906;
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
mvMatrix.translate( -0.2469505, -0.1836612, 0.1075318 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.32906);
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
