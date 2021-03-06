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
-2.940674, 0.651156, -0.8315684, 1, 0, 0, 1,
-2.850181, 0.3429039, -0.9933459, 1, 0.007843138, 0, 1,
-2.849322, -0.2947537, -2.21677, 1, 0.01176471, 0, 1,
-2.771381, -0.1425174, -0.6193696, 1, 0.01960784, 0, 1,
-2.749016, -0.8358353, -2.422949, 1, 0.02352941, 0, 1,
-2.649867, 0.01593313, -1.410729, 1, 0.03137255, 0, 1,
-2.408721, -0.7871401, -2.179599, 1, 0.03529412, 0, 1,
-2.390759, -0.8028586, -2.317038, 1, 0.04313726, 0, 1,
-2.3222, -0.6579463, -2.150682, 1, 0.04705882, 0, 1,
-2.313092, -0.3296212, -0.7310575, 1, 0.05490196, 0, 1,
-2.298082, -0.1428247, -2.821098, 1, 0.05882353, 0, 1,
-2.270283, 0.9544258, -0.6131119, 1, 0.06666667, 0, 1,
-2.246329, 1.300693, 0.3793567, 1, 0.07058824, 0, 1,
-2.230748, 0.819666, -1.269483, 1, 0.07843138, 0, 1,
-2.22464, 0.2616554, -2.221078, 1, 0.08235294, 0, 1,
-2.205552, -0.4606737, -2.663557, 1, 0.09019608, 0, 1,
-2.191916, 0.007991917, -0.9877783, 1, 0.09411765, 0, 1,
-2.180987, -0.6143636, -0.1473547, 1, 0.1019608, 0, 1,
-2.166312, 1.596736, -2.181049, 1, 0.1098039, 0, 1,
-2.147817, -0.8889386, -1.97139, 1, 0.1137255, 0, 1,
-2.093801, -0.9916165, 0.2980037, 1, 0.1215686, 0, 1,
-2.064381, -0.2210396, -0.9140651, 1, 0.1254902, 0, 1,
-2.052541, 1.005516, -2.345934, 1, 0.1333333, 0, 1,
-2.031412, 1.90604, 0.4108874, 1, 0.1372549, 0, 1,
-2.02385, -1.319172, -2.658676, 1, 0.145098, 0, 1,
-2.012257, -0.4524017, -1.640826, 1, 0.1490196, 0, 1,
-1.960208, 0.335095, -0.209107, 1, 0.1568628, 0, 1,
-1.939857, 0.6509474, -1.020882, 1, 0.1607843, 0, 1,
-1.919163, -0.5593644, -0.5298309, 1, 0.1686275, 0, 1,
-1.910691, 0.4085428, -1.578495, 1, 0.172549, 0, 1,
-1.844455, -0.1006841, -2.218116, 1, 0.1803922, 0, 1,
-1.839851, -1.545318, -2.098607, 1, 0.1843137, 0, 1,
-1.833206, 0.5494351, -1.170667, 1, 0.1921569, 0, 1,
-1.822241, 0.3477508, -3.551093, 1, 0.1960784, 0, 1,
-1.815351, 0.1289569, -1.571935, 1, 0.2039216, 0, 1,
-1.81486, 1.842826, -1.800107, 1, 0.2117647, 0, 1,
-1.81307, 0.2159588, -1.102056, 1, 0.2156863, 0, 1,
-1.791555, -1.237095, -3.268164, 1, 0.2235294, 0, 1,
-1.785998, -1.079785, -4.22061, 1, 0.227451, 0, 1,
-1.761809, 0.4382646, -2.985375, 1, 0.2352941, 0, 1,
-1.760597, -0.3508573, -0.596478, 1, 0.2392157, 0, 1,
-1.747331, 0.6991569, -2.985276, 1, 0.2470588, 0, 1,
-1.712716, -0.4155241, -1.73855, 1, 0.2509804, 0, 1,
-1.706867, -0.5309302, -2.439515, 1, 0.2588235, 0, 1,
-1.706252, -1.185575, -3.793844, 1, 0.2627451, 0, 1,
-1.67698, -1.088016, -0.9948835, 1, 0.2705882, 0, 1,
-1.66297, -0.00215047, -1.14208, 1, 0.2745098, 0, 1,
-1.661098, 0.5894406, -0.9713622, 1, 0.282353, 0, 1,
-1.658163, 0.6892774, -2.087386, 1, 0.2862745, 0, 1,
-1.653488, 2.133231, -2.638719, 1, 0.2941177, 0, 1,
-1.646543, -0.3858596, -3.382019, 1, 0.3019608, 0, 1,
-1.639175, -0.2773336, 0.186667, 1, 0.3058824, 0, 1,
-1.632947, -0.345896, -0.2235251, 1, 0.3137255, 0, 1,
-1.624588, 1.05342, -2.783664, 1, 0.3176471, 0, 1,
-1.619132, 0.8834067, -2.386571, 1, 0.3254902, 0, 1,
-1.609462, -0.8010665, -2.114123, 1, 0.3294118, 0, 1,
-1.607686, -0.04085475, -2.846757, 1, 0.3372549, 0, 1,
-1.607663, -1.223826, -1.997314, 1, 0.3411765, 0, 1,
-1.606806, -0.1071246, -1.773227, 1, 0.3490196, 0, 1,
-1.604037, -0.5270821, -1.91644, 1, 0.3529412, 0, 1,
-1.59794, 0.05627989, 0.2011209, 1, 0.3607843, 0, 1,
-1.590614, -2.645266, -2.326316, 1, 0.3647059, 0, 1,
-1.586546, -1.304413, -3.527741, 1, 0.372549, 0, 1,
-1.579836, 0.8653454, -1.597613, 1, 0.3764706, 0, 1,
-1.565661, -0.3233139, -2.008698, 1, 0.3843137, 0, 1,
-1.549739, -0.5504223, -3.019323, 1, 0.3882353, 0, 1,
-1.530963, -0.6229472, -0.6947379, 1, 0.3960784, 0, 1,
-1.522297, 1.397015, -1.447116, 1, 0.4039216, 0, 1,
-1.503193, 1.127812, 0.02552582, 1, 0.4078431, 0, 1,
-1.50282, 0.305603, -1.872657, 1, 0.4156863, 0, 1,
-1.498653, 0.2508779, -4.233085, 1, 0.4196078, 0, 1,
-1.497851, -0.5608091, -2.052551, 1, 0.427451, 0, 1,
-1.496962, 0.2130208, -2.375419, 1, 0.4313726, 0, 1,
-1.496082, 0.4458666, 0.3281919, 1, 0.4392157, 0, 1,
-1.487234, 0.3718729, -0.1923304, 1, 0.4431373, 0, 1,
-1.480436, -1.719667, -2.491013, 1, 0.4509804, 0, 1,
-1.458363, -0.1427915, -1.434296, 1, 0.454902, 0, 1,
-1.455021, 1.074611, -0.04173229, 1, 0.4627451, 0, 1,
-1.450613, -0.5559673, -0.7672573, 1, 0.4666667, 0, 1,
-1.447971, 0.9341261, -0.9479579, 1, 0.4745098, 0, 1,
-1.446584, 1.092594, -2.746348, 1, 0.4784314, 0, 1,
-1.441423, 0.03234157, -0.8671316, 1, 0.4862745, 0, 1,
-1.437054, -0.1986894, -1.383296, 1, 0.4901961, 0, 1,
-1.434845, -0.6340913, -0.6316242, 1, 0.4980392, 0, 1,
-1.423537, 0.8744282, -3.949306, 1, 0.5058824, 0, 1,
-1.417456, -0.5690231, -1.400072, 1, 0.509804, 0, 1,
-1.414236, 0.2037381, -1.132495, 1, 0.5176471, 0, 1,
-1.411637, 1.400996, -2.349496, 1, 0.5215687, 0, 1,
-1.411138, -0.1656492, -2.606416, 1, 0.5294118, 0, 1,
-1.405503, -1.006382, -4.824792, 1, 0.5333334, 0, 1,
-1.404961, -0.729296, -2.110655, 1, 0.5411765, 0, 1,
-1.401417, -0.1014424, -0.8844774, 1, 0.5450981, 0, 1,
-1.400471, 0.4985423, -0.9138722, 1, 0.5529412, 0, 1,
-1.399228, -0.8691876, -0.6472858, 1, 0.5568628, 0, 1,
-1.398424, -1.319659, -0.7680516, 1, 0.5647059, 0, 1,
-1.396243, 0.6438413, -0.1546014, 1, 0.5686275, 0, 1,
-1.385538, 0.5298621, -1.450751, 1, 0.5764706, 0, 1,
-1.383064, -0.3974892, -2.886296, 1, 0.5803922, 0, 1,
-1.382589, 1.875616, -0.0566272, 1, 0.5882353, 0, 1,
-1.378214, -0.5575246, -1.329549, 1, 0.5921569, 0, 1,
-1.344032, 1.566727, -0.1192552, 1, 0.6, 0, 1,
-1.339733, 1.956249, -1.147235, 1, 0.6078432, 0, 1,
-1.334372, 0.718119, -2.902833, 1, 0.6117647, 0, 1,
-1.332646, 0.9869513, -0.921699, 1, 0.6196079, 0, 1,
-1.332206, 0.06310422, -2.418306, 1, 0.6235294, 0, 1,
-1.330533, -1.185682, -2.399844, 1, 0.6313726, 0, 1,
-1.319314, -0.07176942, -2.009453, 1, 0.6352941, 0, 1,
-1.310697, -0.1087235, -1.375798, 1, 0.6431373, 0, 1,
-1.310263, -1.795706, -3.780036, 1, 0.6470588, 0, 1,
-1.306682, 0.1193225, -1.282721, 1, 0.654902, 0, 1,
-1.292786, 1.141639, -0.6842762, 1, 0.6588235, 0, 1,
-1.287194, -0.3673779, -0.9978313, 1, 0.6666667, 0, 1,
-1.272438, -0.3369316, -2.885093, 1, 0.6705883, 0, 1,
-1.265846, -0.3347283, -2.873765, 1, 0.6784314, 0, 1,
-1.263587, -0.5643336, -0.1895136, 1, 0.682353, 0, 1,
-1.262331, 0.4518306, 0.4900494, 1, 0.6901961, 0, 1,
-1.257437, -0.8419448, -3.224277, 1, 0.6941177, 0, 1,
-1.25655, -0.2093745, -3.57291, 1, 0.7019608, 0, 1,
-1.252753, 1.278829, -0.8212427, 1, 0.7098039, 0, 1,
-1.250954, -0.2154613, -2.126876, 1, 0.7137255, 0, 1,
-1.2492, -0.5910323, -3.81311, 1, 0.7215686, 0, 1,
-1.248545, -2.262867, -1.324602, 1, 0.7254902, 0, 1,
-1.233906, 0.5227019, 0.5669028, 1, 0.7333333, 0, 1,
-1.232542, -0.7957436, -2.275764, 1, 0.7372549, 0, 1,
-1.225407, 2.266798, -1.078656, 1, 0.7450981, 0, 1,
-1.221132, -2.993502, -3.202594, 1, 0.7490196, 0, 1,
-1.203971, -1.49036, -3.284403, 1, 0.7568628, 0, 1,
-1.202903, 0.552622, -2.900026, 1, 0.7607843, 0, 1,
-1.199728, -1.320297, -2.011593, 1, 0.7686275, 0, 1,
-1.199357, 0.5461383, -4.530663, 1, 0.772549, 0, 1,
-1.190764, -0.8840731, -1.726068, 1, 0.7803922, 0, 1,
-1.181424, -1.274557, -0.8795383, 1, 0.7843137, 0, 1,
-1.178492, 1.210624, -0.2592076, 1, 0.7921569, 0, 1,
-1.176603, 0.3310954, -0.2834921, 1, 0.7960784, 0, 1,
-1.170043, 1.59301, -0.1976887, 1, 0.8039216, 0, 1,
-1.167047, 0.3497896, -1.421329, 1, 0.8117647, 0, 1,
-1.154126, 1.97861, -0.06614041, 1, 0.8156863, 0, 1,
-1.147382, 1.607591, 1.531784, 1, 0.8235294, 0, 1,
-1.145404, -1.043514, -1.289369, 1, 0.827451, 0, 1,
-1.144322, 0.3719161, -0.8771147, 1, 0.8352941, 0, 1,
-1.141393, -0.6959059, -0.04189467, 1, 0.8392157, 0, 1,
-1.132617, 0.4607524, -1.508147, 1, 0.8470588, 0, 1,
-1.132554, -1.052941, -0.5463502, 1, 0.8509804, 0, 1,
-1.129834, -0.41532, -3.57691, 1, 0.8588235, 0, 1,
-1.115548, 0.05965088, -1.950657, 1, 0.8627451, 0, 1,
-1.111052, -1.007917, -2.911019, 1, 0.8705882, 0, 1,
-1.103729, 1.543244, -1.497699, 1, 0.8745098, 0, 1,
-1.10268, 0.4905063, -0.7165971, 1, 0.8823529, 0, 1,
-1.094884, 1.804493, 0.9088514, 1, 0.8862745, 0, 1,
-1.078026, 1.158665, -0.6656861, 1, 0.8941177, 0, 1,
-1.074661, 0.5000836, -0.6816084, 1, 0.8980392, 0, 1,
-1.073394, 1.017471, 0.8664225, 1, 0.9058824, 0, 1,
-1.071933, 2.267773, 1.392563, 1, 0.9137255, 0, 1,
-1.070794, -0.4082159, -2.769264, 1, 0.9176471, 0, 1,
-1.067548, 0.2918162, -3.731322, 1, 0.9254902, 0, 1,
-1.063121, 1.123684, 0.8511143, 1, 0.9294118, 0, 1,
-1.06299, 0.4829687, -2.362569, 1, 0.9372549, 0, 1,
-1.061613, 0.5299569, -1.756926, 1, 0.9411765, 0, 1,
-1.061059, 0.4631408, 0.6770443, 1, 0.9490196, 0, 1,
-1.058516, -0.164546, -1.581286, 1, 0.9529412, 0, 1,
-1.056164, 1.244713, 0.05029647, 1, 0.9607843, 0, 1,
-1.050095, 0.7457526, -0.4316303, 1, 0.9647059, 0, 1,
-1.047574, 1.797682, -1.883994, 1, 0.972549, 0, 1,
-1.044876, 0.4766286, -1.988487, 1, 0.9764706, 0, 1,
-1.037039, 0.3407773, -1.775847, 1, 0.9843137, 0, 1,
-1.030239, -0.3267559, -0.8031673, 1, 0.9882353, 0, 1,
-1.014544, -1.199095, -1.693515, 1, 0.9960784, 0, 1,
-1.009718, -1.085516, -2.578611, 0.9960784, 1, 0, 1,
-1.00226, -0.7630823, -1.060114, 0.9921569, 1, 0, 1,
-1.001989, 1.778335, 0.385702, 0.9843137, 1, 0, 1,
-0.9987324, 0.473577, -0.9044726, 0.9803922, 1, 0, 1,
-0.9946977, -0.5524773, -2.783109, 0.972549, 1, 0, 1,
-0.9928724, 1.643103, -0.7367453, 0.9686275, 1, 0, 1,
-0.9909306, -0.5789849, -2.688266, 0.9607843, 1, 0, 1,
-0.9835801, 0.4501904, -0.7277339, 0.9568627, 1, 0, 1,
-0.9784051, -3.563997, -2.68396, 0.9490196, 1, 0, 1,
-0.9728883, -1.604966, -3.808836, 0.945098, 1, 0, 1,
-0.9693805, 0.4255228, -1.671316, 0.9372549, 1, 0, 1,
-0.9642087, 0.6896439, -0.9203395, 0.9333333, 1, 0, 1,
-0.9612039, 1.10571, -1.73841, 0.9254902, 1, 0, 1,
-0.9570958, 1.692706, -0.3775424, 0.9215686, 1, 0, 1,
-0.9536608, 0.8861346, 1.087047, 0.9137255, 1, 0, 1,
-0.952568, 1.045774, -1.70376, 0.9098039, 1, 0, 1,
-0.9496114, -1.672158, -2.433113, 0.9019608, 1, 0, 1,
-0.9469541, 0.4105617, 0.1596067, 0.8941177, 1, 0, 1,
-0.9469024, -0.5940835, -2.414548, 0.8901961, 1, 0, 1,
-0.9412454, 0.05546708, -2.3705, 0.8823529, 1, 0, 1,
-0.9384463, 0.7450012, -0.4415716, 0.8784314, 1, 0, 1,
-0.9347025, 0.3159922, 0.3662605, 0.8705882, 1, 0, 1,
-0.9267217, 0.8115556, -1.143989, 0.8666667, 1, 0, 1,
-0.9256344, 1.262764, -2.217222, 0.8588235, 1, 0, 1,
-0.9253011, -0.2779075, -2.380578, 0.854902, 1, 0, 1,
-0.9090698, -0.5732867, -2.589211, 0.8470588, 1, 0, 1,
-0.9075577, -1.478573, -0.9616629, 0.8431373, 1, 0, 1,
-0.9059544, 0.1382067, -2.53593, 0.8352941, 1, 0, 1,
-0.9034079, 0.3122053, -1.709967, 0.8313726, 1, 0, 1,
-0.9010223, -0.8266361, -2.486075, 0.8235294, 1, 0, 1,
-0.8949061, 1.842523, -0.2979135, 0.8196079, 1, 0, 1,
-0.8913519, 0.303001, -2.377505, 0.8117647, 1, 0, 1,
-0.8864627, -1.349596, -3.140032, 0.8078431, 1, 0, 1,
-0.8864428, 1.208732, -1.040584, 0.8, 1, 0, 1,
-0.8817917, -1.507748, -3.565038, 0.7921569, 1, 0, 1,
-0.8805568, -0.1767478, -0.9175029, 0.7882353, 1, 0, 1,
-0.8786087, 1.309953, 0.7464088, 0.7803922, 1, 0, 1,
-0.8774289, -1.603907, -2.799947, 0.7764706, 1, 0, 1,
-0.8758674, 0.4745627, -1.23257, 0.7686275, 1, 0, 1,
-0.8737459, 0.06925384, -1.059365, 0.7647059, 1, 0, 1,
-0.8735889, -0.8058449, -1.725203, 0.7568628, 1, 0, 1,
-0.8649282, -1.120328, -2.584659, 0.7529412, 1, 0, 1,
-0.8598288, 0.9417466, -1.352512, 0.7450981, 1, 0, 1,
-0.8565762, 0.6031132, 0.274387, 0.7411765, 1, 0, 1,
-0.8548725, -0.7406344, -4.370672, 0.7333333, 1, 0, 1,
-0.8533751, 1.004218, -0.3091513, 0.7294118, 1, 0, 1,
-0.8442712, -0.4111594, -3.079543, 0.7215686, 1, 0, 1,
-0.8397253, -0.169091, -1.540099, 0.7176471, 1, 0, 1,
-0.8391366, 0.7573315, 0.04906813, 0.7098039, 1, 0, 1,
-0.8378422, 0.1126437, -1.293953, 0.7058824, 1, 0, 1,
-0.8341118, 1.22229, -1.389983, 0.6980392, 1, 0, 1,
-0.8323321, -1.029988, -2.393301, 0.6901961, 1, 0, 1,
-0.8309047, 1.995016, 0.7599791, 0.6862745, 1, 0, 1,
-0.8301639, -1.712211, -2.584486, 0.6784314, 1, 0, 1,
-0.8245721, 0.3859817, -2.036567, 0.6745098, 1, 0, 1,
-0.8217322, -0.6295984, -0.210412, 0.6666667, 1, 0, 1,
-0.8155317, -0.4025764, -1.619313, 0.6627451, 1, 0, 1,
-0.8142436, 0.6896466, -0.766985, 0.654902, 1, 0, 1,
-0.8136538, 0.6562163, -2.685915, 0.6509804, 1, 0, 1,
-0.8094788, 2.495144, 1.705369, 0.6431373, 1, 0, 1,
-0.8060071, 0.5966763, -0.07982764, 0.6392157, 1, 0, 1,
-0.8020408, 0.3051486, 0.2660303, 0.6313726, 1, 0, 1,
-0.7988456, -0.4659168, -2.617888, 0.627451, 1, 0, 1,
-0.7960762, 1.16694, -2.310827, 0.6196079, 1, 0, 1,
-0.7941745, -0.1561543, -1.77305, 0.6156863, 1, 0, 1,
-0.7879525, -0.5370412, -2.608317, 0.6078432, 1, 0, 1,
-0.7878448, 1.28749, -0.9248865, 0.6039216, 1, 0, 1,
-0.7785534, 1.037634, -0.5862883, 0.5960785, 1, 0, 1,
-0.7749951, 0.1630042, -0.1054106, 0.5882353, 1, 0, 1,
-0.764486, 0.4587503, -0.4040936, 0.5843138, 1, 0, 1,
-0.7587177, -0.6212198, -1.771781, 0.5764706, 1, 0, 1,
-0.7582834, -2.419329, -3.217063, 0.572549, 1, 0, 1,
-0.7582037, -0.4493262, -0.9315868, 0.5647059, 1, 0, 1,
-0.7548348, 0.4405417, -2.485726, 0.5607843, 1, 0, 1,
-0.7533908, -0.6345829, -2.671263, 0.5529412, 1, 0, 1,
-0.7499083, -0.7972063, -3.176647, 0.5490196, 1, 0, 1,
-0.746413, 0.5833366, -2.842052, 0.5411765, 1, 0, 1,
-0.7390728, -0.7078962, -1.781765, 0.5372549, 1, 0, 1,
-0.7348701, -1.105072, -3.487986, 0.5294118, 1, 0, 1,
-0.7334197, 0.8351573, 0.7302817, 0.5254902, 1, 0, 1,
-0.7285282, 0.5784083, 0.4312511, 0.5176471, 1, 0, 1,
-0.7235595, -0.7632167, -2.258004, 0.5137255, 1, 0, 1,
-0.7210057, -0.8969727, -0.8075677, 0.5058824, 1, 0, 1,
-0.7197869, -0.5562279, -2.659669, 0.5019608, 1, 0, 1,
-0.7132684, -1.387218, -2.04794, 0.4941176, 1, 0, 1,
-0.7098534, -0.6567762, -2.429403, 0.4862745, 1, 0, 1,
-0.709139, -0.02999146, -0.5398724, 0.4823529, 1, 0, 1,
-0.7085313, -0.6834318, -2.397257, 0.4745098, 1, 0, 1,
-0.7005427, 1.73019, -2.21296, 0.4705882, 1, 0, 1,
-0.6915326, -0.2751576, -3.391638, 0.4627451, 1, 0, 1,
-0.6864406, -0.4764442, -2.069512, 0.4588235, 1, 0, 1,
-0.6812321, 1.338717, -0.08699613, 0.4509804, 1, 0, 1,
-0.6777618, 0.09856439, -0.4837252, 0.4470588, 1, 0, 1,
-0.6683685, -0.1071776, -1.175363, 0.4392157, 1, 0, 1,
-0.6673026, 0.1769324, -1.134261, 0.4352941, 1, 0, 1,
-0.6622541, -0.0254104, -2.750377, 0.427451, 1, 0, 1,
-0.6517113, -0.2242789, -1.029465, 0.4235294, 1, 0, 1,
-0.6392044, 0.8400058, 0.5333633, 0.4156863, 1, 0, 1,
-0.6373694, 0.215528, -2.125106, 0.4117647, 1, 0, 1,
-0.6372678, 1.677135, 2.009973, 0.4039216, 1, 0, 1,
-0.6359571, 0.6350257, -1.657331, 0.3960784, 1, 0, 1,
-0.6344312, 0.0546037, -2.411143, 0.3921569, 1, 0, 1,
-0.622357, -0.1580729, -2.510807, 0.3843137, 1, 0, 1,
-0.6195582, 1.846308, -0.760684, 0.3803922, 1, 0, 1,
-0.6177254, -0.9860106, -3.31655, 0.372549, 1, 0, 1,
-0.6167705, -0.8269663, -1.877824, 0.3686275, 1, 0, 1,
-0.6141784, 1.120841, -0.4239669, 0.3607843, 1, 0, 1,
-0.6134122, 1.187667, -0.5976314, 0.3568628, 1, 0, 1,
-0.6129106, -0.5054241, -1.194929, 0.3490196, 1, 0, 1,
-0.6117665, 0.8230665, -1.258372, 0.345098, 1, 0, 1,
-0.6116123, 1.096946, 0.1518857, 0.3372549, 1, 0, 1,
-0.6093436, -0.6682112, -2.425254, 0.3333333, 1, 0, 1,
-0.6078121, -0.2136806, -5.202569, 0.3254902, 1, 0, 1,
-0.6065295, 0.6434014, -0.2813541, 0.3215686, 1, 0, 1,
-0.6027985, 1.211695, 1.130282, 0.3137255, 1, 0, 1,
-0.5987165, 1.009438, -1.531956, 0.3098039, 1, 0, 1,
-0.5975965, 1.144927, -1.431867, 0.3019608, 1, 0, 1,
-0.5854205, 1.280758, -0.4579209, 0.2941177, 1, 0, 1,
-0.5800102, 1.245228, -2.415707, 0.2901961, 1, 0, 1,
-0.5787511, 0.764283, -0.03243708, 0.282353, 1, 0, 1,
-0.5787041, 0.1749525, -1.739473, 0.2784314, 1, 0, 1,
-0.5756032, -0.701023, -3.479912, 0.2705882, 1, 0, 1,
-0.5754467, -0.5940214, -2.142743, 0.2666667, 1, 0, 1,
-0.5734552, 1.586058, -0.5485751, 0.2588235, 1, 0, 1,
-0.5661466, -1.537518, -2.471013, 0.254902, 1, 0, 1,
-0.5512242, 0.6477863, -1.973153, 0.2470588, 1, 0, 1,
-0.5506178, 0.654919, 0.5708081, 0.2431373, 1, 0, 1,
-0.548115, -0.4538068, -2.339585, 0.2352941, 1, 0, 1,
-0.5445351, 0.3247061, 0.7637458, 0.2313726, 1, 0, 1,
-0.5436823, 0.5033789, 0.7463065, 0.2235294, 1, 0, 1,
-0.5436664, 1.06403, -0.8873678, 0.2196078, 1, 0, 1,
-0.5433557, 0.2071683, -1.354992, 0.2117647, 1, 0, 1,
-0.5360337, 0.2249848, -0.3267347, 0.2078431, 1, 0, 1,
-0.5290044, -1.084462, -3.245573, 0.2, 1, 0, 1,
-0.5266824, 1.065634, -0.1430093, 0.1921569, 1, 0, 1,
-0.5231492, 0.1999979, -0.7073277, 0.1882353, 1, 0, 1,
-0.5225303, -0.06546726, -0.7411007, 0.1803922, 1, 0, 1,
-0.514955, -0.68072, -2.534799, 0.1764706, 1, 0, 1,
-0.5145344, 1.059308, 0.3125328, 0.1686275, 1, 0, 1,
-0.5117671, 0.01213694, -1.030202, 0.1647059, 1, 0, 1,
-0.5108685, 1.631424, 0.9342856, 0.1568628, 1, 0, 1,
-0.508626, -0.4812993, -2.819407, 0.1529412, 1, 0, 1,
-0.5081465, -0.705523, -3.449921, 0.145098, 1, 0, 1,
-0.5064951, -0.2445797, -4.710225, 0.1411765, 1, 0, 1,
-0.503802, 0.9934518, 0.3124493, 0.1333333, 1, 0, 1,
-0.5025342, -0.9048612, -2.443287, 0.1294118, 1, 0, 1,
-0.4999225, -0.1085882, -2.422549, 0.1215686, 1, 0, 1,
-0.4989412, 0.5346487, -0.4584345, 0.1176471, 1, 0, 1,
-0.4959006, -0.6929474, -3.131936, 0.1098039, 1, 0, 1,
-0.4905286, 0.09265853, -1.487021, 0.1058824, 1, 0, 1,
-0.4899701, -0.6248455, -3.318265, 0.09803922, 1, 0, 1,
-0.4843269, 1.880545, -1.705532, 0.09019608, 1, 0, 1,
-0.4840238, 0.7098127, -0.02702248, 0.08627451, 1, 0, 1,
-0.4812802, -1.280568, -3.575027, 0.07843138, 1, 0, 1,
-0.4803524, 0.5065376, 1.012375, 0.07450981, 1, 0, 1,
-0.4790507, 0.9875636, -1.916653, 0.06666667, 1, 0, 1,
-0.4757947, 0.3349933, -0.5872465, 0.0627451, 1, 0, 1,
-0.4746516, 1.072134, -0.1875351, 0.05490196, 1, 0, 1,
-0.4695601, -1.127084, -2.313277, 0.05098039, 1, 0, 1,
-0.4665162, 0.4758731, -2.661176, 0.04313726, 1, 0, 1,
-0.4664933, -0.3802772, -3.093423, 0.03921569, 1, 0, 1,
-0.4631516, -0.8724113, -2.762835, 0.03137255, 1, 0, 1,
-0.4621282, 0.8397355, -0.3119109, 0.02745098, 1, 0, 1,
-0.459565, -0.3037778, -2.43225, 0.01960784, 1, 0, 1,
-0.454572, 0.9557713, -0.1436818, 0.01568628, 1, 0, 1,
-0.4500427, -0.2349432, -0.7382353, 0.007843138, 1, 0, 1,
-0.450026, 2.110698, 0.5424537, 0.003921569, 1, 0, 1,
-0.4461133, 0.4975981, -0.3693577, 0, 1, 0.003921569, 1,
-0.4449302, -0.7396969, -1.867257, 0, 1, 0.01176471, 1,
-0.4398427, 2.729739, 0.2470301, 0, 1, 0.01568628, 1,
-0.4261975, 0.9195961, 0.844906, 0, 1, 0.02352941, 1,
-0.4244009, -1.968654, -1.252845, 0, 1, 0.02745098, 1,
-0.4179527, -0.03682961, -0.5902693, 0, 1, 0.03529412, 1,
-0.4176611, 0.1286816, -2.675873, 0, 1, 0.03921569, 1,
-0.4166026, -0.7284207, -3.774263, 0, 1, 0.04705882, 1,
-0.4130022, 0.9896476, -0.7056319, 0, 1, 0.05098039, 1,
-0.4088654, 0.5355636, 1.090856, 0, 1, 0.05882353, 1,
-0.4065143, 0.5888233, -0.1112351, 0, 1, 0.0627451, 1,
-0.3955748, 0.8898733, 2.100659, 0, 1, 0.07058824, 1,
-0.3940274, -0.001909198, -1.767057, 0, 1, 0.07450981, 1,
-0.3939138, 0.5493172, 0.05654777, 0, 1, 0.08235294, 1,
-0.3896657, -1.104356, -3.690814, 0, 1, 0.08627451, 1,
-0.3892341, 0.9341003, -0.7127178, 0, 1, 0.09411765, 1,
-0.3886493, 0.8219928, 0.008695167, 0, 1, 0.1019608, 1,
-0.3831913, -0.5272621, -4.483067, 0, 1, 0.1058824, 1,
-0.3800202, -1.061383, -4.618445, 0, 1, 0.1137255, 1,
-0.3775017, -0.117224, -1.894745, 0, 1, 0.1176471, 1,
-0.3752377, 1.311762, 0.7902895, 0, 1, 0.1254902, 1,
-0.3700874, -2.090109, -4.152773, 0, 1, 0.1294118, 1,
-0.3639303, 0.09779908, -0.2115958, 0, 1, 0.1372549, 1,
-0.3606265, 0.08965947, 0.645123, 0, 1, 0.1411765, 1,
-0.3587463, -0.5484741, -3.293064, 0, 1, 0.1490196, 1,
-0.3578638, 0.1163049, -4.511963, 0, 1, 0.1529412, 1,
-0.3543605, -0.7511736, -2.941284, 0, 1, 0.1607843, 1,
-0.3450406, 0.1526351, -2.395034, 0, 1, 0.1647059, 1,
-0.3445353, -0.7434592, -1.003872, 0, 1, 0.172549, 1,
-0.3431657, -1.073011, -3.20164, 0, 1, 0.1764706, 1,
-0.3392709, 0.3847816, -2.380403, 0, 1, 0.1843137, 1,
-0.3346645, 0.8852098, -1.167447, 0, 1, 0.1882353, 1,
-0.3315604, -0.2927996, -1.756785, 0, 1, 0.1960784, 1,
-0.3246863, 0.2709565, -2.918079, 0, 1, 0.2039216, 1,
-0.3244557, -0.8157941, -4.023551, 0, 1, 0.2078431, 1,
-0.3232926, 0.7615109, -0.3864073, 0, 1, 0.2156863, 1,
-0.3160221, 0.942394, -1.124294, 0, 1, 0.2196078, 1,
-0.3124972, 0.8890815, 0.1298551, 0, 1, 0.227451, 1,
-0.3119141, -0.3463359, -3.609861, 0, 1, 0.2313726, 1,
-0.3112142, -1.125061, -3.856037, 0, 1, 0.2392157, 1,
-0.3068146, 0.4685911, 0.6778154, 0, 1, 0.2431373, 1,
-0.3051051, 0.4731415, -1.003833, 0, 1, 0.2509804, 1,
-0.3044437, -1.724859, -3.0377, 0, 1, 0.254902, 1,
-0.3018701, -1.030814, -3.073014, 0, 1, 0.2627451, 1,
-0.3016392, 0.2235571, 0.2538907, 0, 1, 0.2666667, 1,
-0.2950998, -0.2389725, -1.183988, 0, 1, 0.2745098, 1,
-0.2934245, -1.501781, -3.15183, 0, 1, 0.2784314, 1,
-0.2917772, 1.224007, 0.3814221, 0, 1, 0.2862745, 1,
-0.2871965, -1.022416, -1.854779, 0, 1, 0.2901961, 1,
-0.2852962, 0.9772726, -0.3940629, 0, 1, 0.2980392, 1,
-0.2844248, 0.3786976, -1.847049, 0, 1, 0.3058824, 1,
-0.284393, 0.3457011, -0.4450516, 0, 1, 0.3098039, 1,
-0.2825013, 0.6747428, -1.31917, 0, 1, 0.3176471, 1,
-0.2811507, -0.2798305, -2.600652, 0, 1, 0.3215686, 1,
-0.2803692, -0.1660601, -4.353102, 0, 1, 0.3294118, 1,
-0.2730966, 0.981691, -0.1593773, 0, 1, 0.3333333, 1,
-0.2729819, 0.02559096, -2.32136, 0, 1, 0.3411765, 1,
-0.2714162, -0.2898626, -1.152367, 0, 1, 0.345098, 1,
-0.2708468, -0.1050528, -0.9037711, 0, 1, 0.3529412, 1,
-0.2691244, -0.1479133, -1.810409, 0, 1, 0.3568628, 1,
-0.2686065, -0.4955819, -1.961353, 0, 1, 0.3647059, 1,
-0.2622672, 0.3685966, -1.257626, 0, 1, 0.3686275, 1,
-0.2600153, 0.5033978, 0.1122295, 0, 1, 0.3764706, 1,
-0.2577459, -1.327381, -1.296485, 0, 1, 0.3803922, 1,
-0.2573735, -0.7368391, -2.881625, 0, 1, 0.3882353, 1,
-0.2569647, -0.2280983, -1.906014, 0, 1, 0.3921569, 1,
-0.2541625, 1.360992, -1.649284, 0, 1, 0.4, 1,
-0.2520081, 0.2867478, -1.542599, 0, 1, 0.4078431, 1,
-0.2519192, 0.2992877, 1.055731, 0, 1, 0.4117647, 1,
-0.2504976, 1.671125, -0.2646063, 0, 1, 0.4196078, 1,
-0.242335, -0.2979293, -4.041824, 0, 1, 0.4235294, 1,
-0.2418733, 0.02074824, -1.654812, 0, 1, 0.4313726, 1,
-0.2388828, -0.9313575, -4.39015, 0, 1, 0.4352941, 1,
-0.2385021, -0.180309, -0.8787033, 0, 1, 0.4431373, 1,
-0.2368679, -2.079322, -2.020911, 0, 1, 0.4470588, 1,
-0.2352332, -1.856433, -2.661192, 0, 1, 0.454902, 1,
-0.2351463, 0.3831497, -0.9739965, 0, 1, 0.4588235, 1,
-0.2337952, 1.129132, -0.2527694, 0, 1, 0.4666667, 1,
-0.2324166, 1.232267, -1.557864, 0, 1, 0.4705882, 1,
-0.2312548, -0.3163283, -0.9594528, 0, 1, 0.4784314, 1,
-0.2299994, 1.467909, -0.08382688, 0, 1, 0.4823529, 1,
-0.2242274, 0.672552, -1.895485, 0, 1, 0.4901961, 1,
-0.2226709, 0.144287, -2.007553, 0, 1, 0.4941176, 1,
-0.2221627, -0.7635229, -2.454179, 0, 1, 0.5019608, 1,
-0.2142745, 0.1822404, -1.964918, 0, 1, 0.509804, 1,
-0.2116811, 0.1826826, -1.335484, 0, 1, 0.5137255, 1,
-0.2087139, 1.458385, -0.4757386, 0, 1, 0.5215687, 1,
-0.2071039, -1.311048, -3.629229, 0, 1, 0.5254902, 1,
-0.2067421, 0.7771416, -1.266235, 0, 1, 0.5333334, 1,
-0.1989725, 2.367269, 1.038677, 0, 1, 0.5372549, 1,
-0.1985446, 1.27452, 0.696328, 0, 1, 0.5450981, 1,
-0.1948218, -0.9648963, -1.278831, 0, 1, 0.5490196, 1,
-0.1941544, -1.806429, -1.608548, 0, 1, 0.5568628, 1,
-0.1870087, -2.200736, -2.93754, 0, 1, 0.5607843, 1,
-0.1863994, 1.000294, -0.3848483, 0, 1, 0.5686275, 1,
-0.1808352, -0.3358145, -2.868795, 0, 1, 0.572549, 1,
-0.1788059, -0.7208147, -2.401757, 0, 1, 0.5803922, 1,
-0.1762258, 2.621546, -1.759175, 0, 1, 0.5843138, 1,
-0.1756281, -0.3013681, -2.835008, 0, 1, 0.5921569, 1,
-0.1724639, -0.6195635, -1.123788, 0, 1, 0.5960785, 1,
-0.1702102, -0.5802122, -2.87465, 0, 1, 0.6039216, 1,
-0.1695218, -0.4632481, -3.517804, 0, 1, 0.6117647, 1,
-0.1684658, -0.7743964, -3.239286, 0, 1, 0.6156863, 1,
-0.1656968, 1.287828, 0.00150706, 0, 1, 0.6235294, 1,
-0.151746, 0.1745522, -2.36006, 0, 1, 0.627451, 1,
-0.1504801, -0.345192, -2.322193, 0, 1, 0.6352941, 1,
-0.1489841, -0.2656439, -2.586791, 0, 1, 0.6392157, 1,
-0.1480102, -1.15444, -2.853925, 0, 1, 0.6470588, 1,
-0.1477413, -0.8192098, -3.248369, 0, 1, 0.6509804, 1,
-0.1456884, 0.6592684, 0.5225875, 0, 1, 0.6588235, 1,
-0.1442409, 0.1158743, -1.89237, 0, 1, 0.6627451, 1,
-0.1332817, -0.9348616, -4.346208, 0, 1, 0.6705883, 1,
-0.131721, -0.4679807, -3.206545, 0, 1, 0.6745098, 1,
-0.130704, 0.4479489, 0.5379258, 0, 1, 0.682353, 1,
-0.1304233, 0.310068, 0.5898334, 0, 1, 0.6862745, 1,
-0.123259, -1.90018, -2.946671, 0, 1, 0.6941177, 1,
-0.1155847, 0.3490355, 0.9317032, 0, 1, 0.7019608, 1,
-0.1154656, -1.177553, -2.631905, 0, 1, 0.7058824, 1,
-0.1131245, -1.176823, -2.74551, 0, 1, 0.7137255, 1,
-0.1121532, 1.527032, -1.429662, 0, 1, 0.7176471, 1,
-0.1118715, 1.810161, -0.7850341, 0, 1, 0.7254902, 1,
-0.1051964, -0.07800271, -1.659514, 0, 1, 0.7294118, 1,
-0.1048432, -0.7115583, 0.1144826, 0, 1, 0.7372549, 1,
-0.1030922, -2.286878, -2.922712, 0, 1, 0.7411765, 1,
-0.1014232, 1.441595, 0.864659, 0, 1, 0.7490196, 1,
-0.09320892, 0.7412677, 1.195517, 0, 1, 0.7529412, 1,
-0.09285336, 0.3563284, 0.6252042, 0, 1, 0.7607843, 1,
-0.08450784, 0.3891837, 0.5829956, 0, 1, 0.7647059, 1,
-0.08428998, 0.06621765, -1.377215, 0, 1, 0.772549, 1,
-0.08087856, 0.04392271, -0.4456217, 0, 1, 0.7764706, 1,
-0.08037368, -0.5021973, -3.275332, 0, 1, 0.7843137, 1,
-0.07479381, 2.263873, -0.1444681, 0, 1, 0.7882353, 1,
-0.07475562, 0.04737067, -1.769997, 0, 1, 0.7960784, 1,
-0.07169199, -1.70615, -4.16512, 0, 1, 0.8039216, 1,
-0.06799078, -0.7962133, -2.936371, 0, 1, 0.8078431, 1,
-0.06659631, -1.31039, -3.418558, 0, 1, 0.8156863, 1,
-0.06386101, 0.9527316, -0.4433487, 0, 1, 0.8196079, 1,
-0.05059907, 0.73171, -0.1437019, 0, 1, 0.827451, 1,
-0.04962086, 1.477263, 0.1271196, 0, 1, 0.8313726, 1,
-0.04138022, -0.5534254, -3.423519, 0, 1, 0.8392157, 1,
-0.04114371, 0.1988524, 0.8102781, 0, 1, 0.8431373, 1,
-0.03116236, 2.60098, -0.4064203, 0, 1, 0.8509804, 1,
-0.03016644, -0.232786, -3.820308, 0, 1, 0.854902, 1,
-0.02885716, -0.5475681, -4.217482, 0, 1, 0.8627451, 1,
-0.02776888, 0.2651791, -0.1749889, 0, 1, 0.8666667, 1,
-0.02768915, -0.9383814, -5.289463, 0, 1, 0.8745098, 1,
-0.02639805, 0.03054246, -1.117038, 0, 1, 0.8784314, 1,
-0.02292443, -1.581127, -2.586061, 0, 1, 0.8862745, 1,
-0.02128259, -3.197175, -4.618761, 0, 1, 0.8901961, 1,
-0.02083836, -1.351433, -2.038666, 0, 1, 0.8980392, 1,
-0.008525813, -0.5228433, -3.465667, 0, 1, 0.9058824, 1,
-0.006559463, 0.3062623, -0.4873499, 0, 1, 0.9098039, 1,
-0.005793617, 1.002612, -0.8567871, 0, 1, 0.9176471, 1,
-0.003769633, 1.403469, -0.1700879, 0, 1, 0.9215686, 1,
-0.003736455, 0.5016643, -0.4261743, 0, 1, 0.9294118, 1,
-0.002762701, -0.09497307, -3.525986, 0, 1, 0.9333333, 1,
-0.002407967, -0.09289572, -3.533404, 0, 1, 0.9411765, 1,
-0.002064368, -0.01396845, -4.046278, 0, 1, 0.945098, 1,
-0.002014882, 0.987642, 0.7558022, 0, 1, 0.9529412, 1,
-0.0006139276, 1.914518, -1.335019, 0, 1, 0.9568627, 1,
0.0002293005, -1.162662, 3.226631, 0, 1, 0.9647059, 1,
0.0009656957, 1.526941, -1.107405, 0, 1, 0.9686275, 1,
0.001189462, -0.5370607, 4.501861, 0, 1, 0.9764706, 1,
0.00133786, -1.275234, 3.203259, 0, 1, 0.9803922, 1,
0.002793619, -0.7317737, 2.400952, 0, 1, 0.9882353, 1,
0.004386448, 0.7218137, 0.4865218, 0, 1, 0.9921569, 1,
0.00949935, 1.161539, -0.314611, 0, 1, 1, 1,
0.009777263, 1.812348, 0.1987993, 0, 0.9921569, 1, 1,
0.01523426, -1.249033, 4.490289, 0, 0.9882353, 1, 1,
0.01772008, 3.007648, -1.306986, 0, 0.9803922, 1, 1,
0.01963801, -0.918433, 2.563702, 0, 0.9764706, 1, 1,
0.02504721, 1.159964, 1.125861, 0, 0.9686275, 1, 1,
0.0278635, 1.639215, 0.5384284, 0, 0.9647059, 1, 1,
0.02983099, -0.03289862, 1.646838, 0, 0.9568627, 1, 1,
0.03165799, 1.329934, -0.5883615, 0, 0.9529412, 1, 1,
0.04160624, 0.5581917, -0.3828114, 0, 0.945098, 1, 1,
0.04226197, 0.4887248, -0.03903583, 0, 0.9411765, 1, 1,
0.04881665, 0.4495294, -0.630353, 0, 0.9333333, 1, 1,
0.05083358, -0.7523325, 3.006294, 0, 0.9294118, 1, 1,
0.05214792, -0.5999227, 4.627023, 0, 0.9215686, 1, 1,
0.05346532, -1.0387, 4.753235, 0, 0.9176471, 1, 1,
0.05441828, 0.3784807, -0.174736, 0, 0.9098039, 1, 1,
0.05705194, 1.51026, -0.8866972, 0, 0.9058824, 1, 1,
0.05720447, -1.347489, 5.113871, 0, 0.8980392, 1, 1,
0.05889853, 1.259332, 1.143134, 0, 0.8901961, 1, 1,
0.0590932, -0.01864195, 2.00198, 0, 0.8862745, 1, 1,
0.06362955, 1.388572, 0.6136774, 0, 0.8784314, 1, 1,
0.07019619, 0.5029581, 0.4178754, 0, 0.8745098, 1, 1,
0.07088646, 0.2011717, -0.09861225, 0, 0.8666667, 1, 1,
0.07113876, -0.4968866, -0.08312004, 0, 0.8627451, 1, 1,
0.0738123, 1.636525, 0.3098984, 0, 0.854902, 1, 1,
0.07529074, 2.558068, -0.2680625, 0, 0.8509804, 1, 1,
0.07938782, -0.7503803, -0.1278258, 0, 0.8431373, 1, 1,
0.08020025, 1.317896, 0.4200082, 0, 0.8392157, 1, 1,
0.0830844, 0.7722625, 0.3392477, 0, 0.8313726, 1, 1,
0.08485943, -2.621742, 3.283572, 0, 0.827451, 1, 1,
0.0868101, 0.8383735, -1.032536, 0, 0.8196079, 1, 1,
0.08848479, 1.002341, 2.288158, 0, 0.8156863, 1, 1,
0.0917181, 0.6548346, 2.41251, 0, 0.8078431, 1, 1,
0.09331648, -0.3862632, 3.798121, 0, 0.8039216, 1, 1,
0.09409221, 0.2711928, 1.019233, 0, 0.7960784, 1, 1,
0.09673249, -0.3083361, 3.682497, 0, 0.7882353, 1, 1,
0.09850324, -2.01858, 5.76737, 0, 0.7843137, 1, 1,
0.1017977, 0.2329226, 0.7052146, 0, 0.7764706, 1, 1,
0.103191, -1.66469, 2.902226, 0, 0.772549, 1, 1,
0.1037948, -0.8952913, 3.952299, 0, 0.7647059, 1, 1,
0.1050102, 1.527961, -0.5518772, 0, 0.7607843, 1, 1,
0.1052253, -1.064279, 4.847881, 0, 0.7529412, 1, 1,
0.1057861, 0.7356145, -0.2659199, 0, 0.7490196, 1, 1,
0.1092757, 1.024607, 1.451687, 0, 0.7411765, 1, 1,
0.1147614, -0.9469732, 1.500605, 0, 0.7372549, 1, 1,
0.1161621, 0.3725405, 0.4754957, 0, 0.7294118, 1, 1,
0.1324652, 1.724551, 2.066609, 0, 0.7254902, 1, 1,
0.1366616, 0.2934887, 0.4014985, 0, 0.7176471, 1, 1,
0.1389577, -1.288909, 1.753145, 0, 0.7137255, 1, 1,
0.1408402, -0.6316851, 2.655352, 0, 0.7058824, 1, 1,
0.1433084, 0.4447635, 0.428234, 0, 0.6980392, 1, 1,
0.1459987, 0.6210147, -0.5099508, 0, 0.6941177, 1, 1,
0.1464927, -0.4725829, 2.768394, 0, 0.6862745, 1, 1,
0.1466659, 0.1755115, 0.5782097, 0, 0.682353, 1, 1,
0.1481085, 0.7287667, -1.084935, 0, 0.6745098, 1, 1,
0.1534235, -0.03693717, 3.253615, 0, 0.6705883, 1, 1,
0.1596019, -0.6612966, 0.6639231, 0, 0.6627451, 1, 1,
0.1658985, 0.5976936, -0.9911469, 0, 0.6588235, 1, 1,
0.1680252, 0.1700572, 2.460947, 0, 0.6509804, 1, 1,
0.1683989, 0.4496087, 0.07191361, 0, 0.6470588, 1, 1,
0.1726168, 0.6147562, 1.548158, 0, 0.6392157, 1, 1,
0.1773156, -0.6292763, 3.173022, 0, 0.6352941, 1, 1,
0.1774753, -0.8877202, 3.595389, 0, 0.627451, 1, 1,
0.1779152, -0.3521644, 1.733213, 0, 0.6235294, 1, 1,
0.1784468, -2.146161, 1.184246, 0, 0.6156863, 1, 1,
0.1794765, 0.5727404, 0.7475037, 0, 0.6117647, 1, 1,
0.1802976, -0.6384258, 1.757022, 0, 0.6039216, 1, 1,
0.1805243, 0.1946004, 0.1464408, 0, 0.5960785, 1, 1,
0.180574, 0.4514143, 1.355664, 0, 0.5921569, 1, 1,
0.1816795, -1.720852, 2.493634, 0, 0.5843138, 1, 1,
0.183679, -2.240505, 2.588712, 0, 0.5803922, 1, 1,
0.1839221, 0.3134898, 1.592676, 0, 0.572549, 1, 1,
0.1895509, 1.477659, 0.5081378, 0, 0.5686275, 1, 1,
0.1959564, 1.257035, 0.09569366, 0, 0.5607843, 1, 1,
0.201063, 1.731652, 1.044845, 0, 0.5568628, 1, 1,
0.2042968, -0.4595948, 2.293519, 0, 0.5490196, 1, 1,
0.2054923, 0.9333336, 0.2903987, 0, 0.5450981, 1, 1,
0.2056856, -1.84154, 3.117588, 0, 0.5372549, 1, 1,
0.2089594, 1.124004, -0.09438728, 0, 0.5333334, 1, 1,
0.2144726, -0.6920616, 2.970784, 0, 0.5254902, 1, 1,
0.215683, 0.7889183, 0.8976217, 0, 0.5215687, 1, 1,
0.2159753, -0.07758599, 2.498781, 0, 0.5137255, 1, 1,
0.2181055, -1.382673, 3.677174, 0, 0.509804, 1, 1,
0.218127, -0.3269863, 2.402314, 0, 0.5019608, 1, 1,
0.2210287, -1.010163, 2.088476, 0, 0.4941176, 1, 1,
0.2237385, -0.9004997, 4.651302, 0, 0.4901961, 1, 1,
0.224079, 0.441366, 0.04181264, 0, 0.4823529, 1, 1,
0.2281646, -1.510352, 2.818484, 0, 0.4784314, 1, 1,
0.2306883, 0.8620045, 1.638192, 0, 0.4705882, 1, 1,
0.2321264, -0.9476003, 3.323421, 0, 0.4666667, 1, 1,
0.2349456, 0.3725347, 0.9022022, 0, 0.4588235, 1, 1,
0.2372492, -1.414397, 3.494647, 0, 0.454902, 1, 1,
0.2381198, 0.7031285, 0.4260237, 0, 0.4470588, 1, 1,
0.2382586, 0.260968, 0.8563078, 0, 0.4431373, 1, 1,
0.2411918, 0.7140319, 0.3202794, 0, 0.4352941, 1, 1,
0.2459345, 0.5941337, -0.8002073, 0, 0.4313726, 1, 1,
0.2481899, 0.6430394, -1.100223, 0, 0.4235294, 1, 1,
0.2583746, -0.2897912, 2.350637, 0, 0.4196078, 1, 1,
0.2589415, -0.5939772, 1.935136, 0, 0.4117647, 1, 1,
0.2591967, 2.152405, 0.01408172, 0, 0.4078431, 1, 1,
0.2638502, -0.2880127, 2.205648, 0, 0.4, 1, 1,
0.2666522, 0.9725441, 0.1739633, 0, 0.3921569, 1, 1,
0.2688083, 0.02028172, 1.561176, 0, 0.3882353, 1, 1,
0.2731165, -1.259323, 3.087295, 0, 0.3803922, 1, 1,
0.2738917, 1.599784, -0.1560417, 0, 0.3764706, 1, 1,
0.2754104, 1.253553, 0.6219214, 0, 0.3686275, 1, 1,
0.2757876, -0.6430641, 2.719719, 0, 0.3647059, 1, 1,
0.2771761, 0.6868963, 0.4065578, 0, 0.3568628, 1, 1,
0.2779034, -1.940471, 4.597324, 0, 0.3529412, 1, 1,
0.2780268, -0.8973389, 4.670337, 0, 0.345098, 1, 1,
0.2784823, 1.4733, 2.037436, 0, 0.3411765, 1, 1,
0.2787458, 0.0173198, -0.2444526, 0, 0.3333333, 1, 1,
0.2826164, 0.8972256, -1.158304, 0, 0.3294118, 1, 1,
0.2871566, -0.5113234, 4.133825, 0, 0.3215686, 1, 1,
0.2883999, -1.543599, 3.17014, 0, 0.3176471, 1, 1,
0.2886699, -1.780098, 5.025566, 0, 0.3098039, 1, 1,
0.2912824, -0.5828158, 2.919189, 0, 0.3058824, 1, 1,
0.2919056, -0.2278396, 2.133971, 0, 0.2980392, 1, 1,
0.2947111, 0.1977296, 1.790088, 0, 0.2901961, 1, 1,
0.2986928, 1.584015, 0.1197349, 0, 0.2862745, 1, 1,
0.3024018, 0.4137684, 0.1982992, 0, 0.2784314, 1, 1,
0.303408, -1.059072, 3.108141, 0, 0.2745098, 1, 1,
0.3057652, 0.7802413, 2.354688, 0, 0.2666667, 1, 1,
0.3092992, -0.03074982, 1.797991, 0, 0.2627451, 1, 1,
0.3100704, 0.5861357, 1.778031, 0, 0.254902, 1, 1,
0.311572, -1.381239, 2.229035, 0, 0.2509804, 1, 1,
0.3201222, -1.912538, 3.357335, 0, 0.2431373, 1, 1,
0.3262415, -1.323043, 2.958944, 0, 0.2392157, 1, 1,
0.3289082, 1.308785, 0.2077972, 0, 0.2313726, 1, 1,
0.3380947, -0.7646898, 2.471801, 0, 0.227451, 1, 1,
0.3475516, 1.815096, -0.2019987, 0, 0.2196078, 1, 1,
0.3503987, 0.2287968, 1.222124, 0, 0.2156863, 1, 1,
0.3511786, 0.1276388, -0.5677204, 0, 0.2078431, 1, 1,
0.352475, 0.7962655, 0.00907205, 0, 0.2039216, 1, 1,
0.3532923, -0.4089064, 1.276063, 0, 0.1960784, 1, 1,
0.3583759, 0.215462, 0.9268373, 0, 0.1882353, 1, 1,
0.3603951, 0.3205536, -0.6592563, 0, 0.1843137, 1, 1,
0.3618259, 0.6851056, 0.5589644, 0, 0.1764706, 1, 1,
0.3630517, -0.8075686, 1.456695, 0, 0.172549, 1, 1,
0.3644812, 0.8679775, -0.1172737, 0, 0.1647059, 1, 1,
0.3666805, -0.1989758, 1.187209, 0, 0.1607843, 1, 1,
0.3681825, -1.723659, 2.985577, 0, 0.1529412, 1, 1,
0.369868, -0.1983086, -0.6241302, 0, 0.1490196, 1, 1,
0.3823351, -0.3551084, 4.442267, 0, 0.1411765, 1, 1,
0.3826631, 1.049885, -0.2958841, 0, 0.1372549, 1, 1,
0.3832494, -0.254403, 1.718644, 0, 0.1294118, 1, 1,
0.3839047, -0.04526033, 2.577994, 0, 0.1254902, 1, 1,
0.3876801, 0.4804429, 2.863919, 0, 0.1176471, 1, 1,
0.3880824, -0.3247557, 2.314014, 0, 0.1137255, 1, 1,
0.3934886, -1.817536, 3.624452, 0, 0.1058824, 1, 1,
0.396866, -0.3285823, 2.258047, 0, 0.09803922, 1, 1,
0.3992673, -2.14678, 3.28491, 0, 0.09411765, 1, 1,
0.4016168, -0.3379792, 2.776594, 0, 0.08627451, 1, 1,
0.4053853, 0.1204028, -1.698715, 0, 0.08235294, 1, 1,
0.4054655, 0.9819114, 1.255987, 0, 0.07450981, 1, 1,
0.4107589, -0.5149556, 2.39999, 0, 0.07058824, 1, 1,
0.4112288, 0.01560478, 1.753902, 0, 0.0627451, 1, 1,
0.41666, -0.5418562, 2.735514, 0, 0.05882353, 1, 1,
0.4180595, 1.257052, 0.8684727, 0, 0.05098039, 1, 1,
0.4181535, 0.7277047, 1.352193, 0, 0.04705882, 1, 1,
0.4259512, 2.277151, 1.136934, 0, 0.03921569, 1, 1,
0.4269589, 0.8731023, -1.284303, 0, 0.03529412, 1, 1,
0.4272899, 1.282166, -1.400297, 0, 0.02745098, 1, 1,
0.4302728, 0.2331224, 1.817935, 0, 0.02352941, 1, 1,
0.434401, 0.3419814, 2.006497, 0, 0.01568628, 1, 1,
0.4404596, 1.213993, 1.010685, 0, 0.01176471, 1, 1,
0.4527036, -1.402649, 2.287075, 0, 0.003921569, 1, 1,
0.4554061, 1.235165, -0.3884547, 0.003921569, 0, 1, 1,
0.4557449, -0.3932677, 1.823413, 0.007843138, 0, 1, 1,
0.4578812, 1.341655, -1.677344, 0.01568628, 0, 1, 1,
0.4579041, 0.6076242, 0.675925, 0.01960784, 0, 1, 1,
0.4623121, 0.6478077, 2.845742, 0.02745098, 0, 1, 1,
0.4668748, -0.1333112, 2.588845, 0.03137255, 0, 1, 1,
0.468603, -0.407249, 4.70002, 0.03921569, 0, 1, 1,
0.4686486, 0.4744334, 0.2021993, 0.04313726, 0, 1, 1,
0.4694987, -0.6072382, 2.966848, 0.05098039, 0, 1, 1,
0.4741236, -0.5428453, 1.904961, 0.05490196, 0, 1, 1,
0.4741666, -0.9823422, 2.515692, 0.0627451, 0, 1, 1,
0.475722, 0.7987701, -0.007705401, 0.06666667, 0, 1, 1,
0.475793, -0.2472634, 3.148755, 0.07450981, 0, 1, 1,
0.4759618, -0.4614366, 3.556312, 0.07843138, 0, 1, 1,
0.4763865, 1.098527, 0.0110147, 0.08627451, 0, 1, 1,
0.4779713, -1.826459, 2.770195, 0.09019608, 0, 1, 1,
0.4886877, -0.2093223, 2.736216, 0.09803922, 0, 1, 1,
0.4889725, 0.3220881, 0.8669944, 0.1058824, 0, 1, 1,
0.4983881, -1.624647, 4.010524, 0.1098039, 0, 1, 1,
0.5035682, 0.004232883, 1.113909, 0.1176471, 0, 1, 1,
0.5049464, 0.3865703, 1.750663, 0.1215686, 0, 1, 1,
0.5058596, 0.6066344, 0.8175451, 0.1294118, 0, 1, 1,
0.5101364, 0.6840129, 0.0003760938, 0.1333333, 0, 1, 1,
0.5126368, 0.05929897, 2.638929, 0.1411765, 0, 1, 1,
0.5136306, -0.3467484, 1.266408, 0.145098, 0, 1, 1,
0.5167992, 1.315991, 0.9983958, 0.1529412, 0, 1, 1,
0.5227014, 1.51605, -1.670907, 0.1568628, 0, 1, 1,
0.5235849, -1.265981, 3.743416, 0.1647059, 0, 1, 1,
0.5278015, 2.703941, 0.5725544, 0.1686275, 0, 1, 1,
0.5365085, -0.4822532, 2.150346, 0.1764706, 0, 1, 1,
0.5367247, -1.466763, 3.327394, 0.1803922, 0, 1, 1,
0.5387809, -0.08830738, 0.7219786, 0.1882353, 0, 1, 1,
0.5404265, 1.107786, 1.217123, 0.1921569, 0, 1, 1,
0.5466016, 0.1702653, -0.1256511, 0.2, 0, 1, 1,
0.5495692, 0.02333607, 0.9717572, 0.2078431, 0, 1, 1,
0.550828, 0.7950925, 1.712043, 0.2117647, 0, 1, 1,
0.5535393, -0.1848328, 2.122723, 0.2196078, 0, 1, 1,
0.5556396, 0.5824827, 0.1696854, 0.2235294, 0, 1, 1,
0.5559562, 0.5564706, -0.5171057, 0.2313726, 0, 1, 1,
0.5597754, 0.08598513, 1.052172, 0.2352941, 0, 1, 1,
0.5615366, -1.144384, 3.068137, 0.2431373, 0, 1, 1,
0.5625027, 0.07767302, 0.440289, 0.2470588, 0, 1, 1,
0.5824785, 2.280562, -0.4195231, 0.254902, 0, 1, 1,
0.5834128, -0.4034324, 0.6162527, 0.2588235, 0, 1, 1,
0.5869601, -1.129696, 2.33588, 0.2666667, 0, 1, 1,
0.5874617, 1.94146, 0.04118554, 0.2705882, 0, 1, 1,
0.5888935, -1.42477, 2.55771, 0.2784314, 0, 1, 1,
0.5916653, 1.612508, -1.336004, 0.282353, 0, 1, 1,
0.5978975, -0.3822721, 3.281048, 0.2901961, 0, 1, 1,
0.6014684, 0.9848048, 0.7056621, 0.2941177, 0, 1, 1,
0.6016561, 0.2408798, 0.8964372, 0.3019608, 0, 1, 1,
0.606156, -1.689125, 3.554268, 0.3098039, 0, 1, 1,
0.6073843, -0.8875289, 3.28547, 0.3137255, 0, 1, 1,
0.6106302, 1.489156, 0.02435354, 0.3215686, 0, 1, 1,
0.6108943, -0.4660624, 4.407082, 0.3254902, 0, 1, 1,
0.6118535, 1.998352, 0.6978101, 0.3333333, 0, 1, 1,
0.6171082, 1.079442, 2.740467, 0.3372549, 0, 1, 1,
0.6184669, 1.598757, 0.1940504, 0.345098, 0, 1, 1,
0.6190608, 0.4685687, 2.523872, 0.3490196, 0, 1, 1,
0.6226724, -1.371879, 2.736566, 0.3568628, 0, 1, 1,
0.6240582, 1.668509, 0.5732368, 0.3607843, 0, 1, 1,
0.6251128, -0.3918673, 1.466632, 0.3686275, 0, 1, 1,
0.6268786, -0.6134362, 2.974525, 0.372549, 0, 1, 1,
0.6285182, -0.3341573, 2.734389, 0.3803922, 0, 1, 1,
0.6350496, -0.5368163, 2.579091, 0.3843137, 0, 1, 1,
0.6452288, 0.06664883, -1.010465, 0.3921569, 0, 1, 1,
0.6514769, 2.041086, 0.8046561, 0.3960784, 0, 1, 1,
0.6525658, -1.742601, 4.135135, 0.4039216, 0, 1, 1,
0.6540813, 0.5793921, 1.828743, 0.4117647, 0, 1, 1,
0.6545025, -0.3798138, 2.817737, 0.4156863, 0, 1, 1,
0.6563113, -0.770383, 2.564526, 0.4235294, 0, 1, 1,
0.6575492, -0.681363, 3.128222, 0.427451, 0, 1, 1,
0.6586825, -0.6992578, 1.226482, 0.4352941, 0, 1, 1,
0.6616288, 0.5018993, 0.379578, 0.4392157, 0, 1, 1,
0.6649835, -2.36186, 2.61222, 0.4470588, 0, 1, 1,
0.6699801, 0.4358935, 0.242168, 0.4509804, 0, 1, 1,
0.6762223, -0.3762897, 3.153884, 0.4588235, 0, 1, 1,
0.6781225, 0.3367487, -0.05752955, 0.4627451, 0, 1, 1,
0.6832741, -0.4492875, 3.510489, 0.4705882, 0, 1, 1,
0.6872756, 1.069609, 0.4020277, 0.4745098, 0, 1, 1,
0.6903564, -1.320082, 1.914075, 0.4823529, 0, 1, 1,
0.6949872, -0.2052168, 1.36564, 0.4862745, 0, 1, 1,
0.6972041, -0.2929621, 2.291451, 0.4941176, 0, 1, 1,
0.7005579, -1.090217, 2.01253, 0.5019608, 0, 1, 1,
0.7045463, -0.6029726, 2.426516, 0.5058824, 0, 1, 1,
0.7051744, 0.6792715, 0.09693645, 0.5137255, 0, 1, 1,
0.7066947, -0.4383545, 3.359184, 0.5176471, 0, 1, 1,
0.7072157, -0.1525068, 2.755076, 0.5254902, 0, 1, 1,
0.707371, -0.9163221, 2.315467, 0.5294118, 0, 1, 1,
0.7137769, 0.01381583, 0.8125767, 0.5372549, 0, 1, 1,
0.7140669, 0.9178531, 0.9734772, 0.5411765, 0, 1, 1,
0.7231001, 1.357161, -0.6128898, 0.5490196, 0, 1, 1,
0.7293113, 0.1785986, 2.491652, 0.5529412, 0, 1, 1,
0.7463667, -0.2928548, 2.216763, 0.5607843, 0, 1, 1,
0.7483463, -0.1721327, 0.04943499, 0.5647059, 0, 1, 1,
0.7609349, -1.623388, 2.183686, 0.572549, 0, 1, 1,
0.7618369, 0.5213912, 0.9174584, 0.5764706, 0, 1, 1,
0.7632951, -0.5352936, 2.527924, 0.5843138, 0, 1, 1,
0.7720796, 0.6006631, 0.8916035, 0.5882353, 0, 1, 1,
0.7736403, 0.450308, 0.6619304, 0.5960785, 0, 1, 1,
0.7738554, -1.683651, 3.391109, 0.6039216, 0, 1, 1,
0.7839224, 0.3302145, 1.047013, 0.6078432, 0, 1, 1,
0.7870857, 0.4327056, 2.668303, 0.6156863, 0, 1, 1,
0.7886809, -0.1600341, 3.174776, 0.6196079, 0, 1, 1,
0.7949536, -0.2650767, 3.351951, 0.627451, 0, 1, 1,
0.7976533, -0.9951358, 3.546525, 0.6313726, 0, 1, 1,
0.8000505, -0.6083952, 1.902879, 0.6392157, 0, 1, 1,
0.8042662, -0.5560185, 3.978331, 0.6431373, 0, 1, 1,
0.8071751, 1.787918, 0.3267949, 0.6509804, 0, 1, 1,
0.807812, -0.9132797, 3.129244, 0.654902, 0, 1, 1,
0.8103715, -0.5592368, 3.581178, 0.6627451, 0, 1, 1,
0.810714, 0.7142067, 0.2472416, 0.6666667, 0, 1, 1,
0.8118204, 0.4194906, 2.562587, 0.6745098, 0, 1, 1,
0.8142005, -0.9939834, 2.223413, 0.6784314, 0, 1, 1,
0.824914, -0.8314315, 2.090486, 0.6862745, 0, 1, 1,
0.826597, 1.442102, -0.3193508, 0.6901961, 0, 1, 1,
0.8300407, -1.792936, 4.915767, 0.6980392, 0, 1, 1,
0.8322781, 0.4872606, 0.8357508, 0.7058824, 0, 1, 1,
0.8367075, -1.650708, 4.040229, 0.7098039, 0, 1, 1,
0.8375408, 0.5101123, 1.585292, 0.7176471, 0, 1, 1,
0.8407895, -0.9400094, 2.744242, 0.7215686, 0, 1, 1,
0.8413969, 0.8555222, -0.06048263, 0.7294118, 0, 1, 1,
0.8449372, -1.6535, 2.578542, 0.7333333, 0, 1, 1,
0.8497369, 0.5633554, -0.1384601, 0.7411765, 0, 1, 1,
0.8568544, -1.575999, 3.037905, 0.7450981, 0, 1, 1,
0.8585694, 1.469632, -1.762076, 0.7529412, 0, 1, 1,
0.8586276, 0.01770839, 4.213765, 0.7568628, 0, 1, 1,
0.8590641, -1.894848, 2.268657, 0.7647059, 0, 1, 1,
0.8590845, 0.1267549, 0.9904683, 0.7686275, 0, 1, 1,
0.8600322, -0.2216237, 3.671366, 0.7764706, 0, 1, 1,
0.8646553, 0.3851351, 1.145287, 0.7803922, 0, 1, 1,
0.8678088, -0.5280619, 2.543365, 0.7882353, 0, 1, 1,
0.8722445, -0.4825678, 1.742356, 0.7921569, 0, 1, 1,
0.8759854, 0.001942256, 1.256515, 0.8, 0, 1, 1,
0.8786752, -0.5049123, 2.88624, 0.8078431, 0, 1, 1,
0.8874724, 2.094733, -0.4972732, 0.8117647, 0, 1, 1,
0.8895689, 0.2521654, 1.196981, 0.8196079, 0, 1, 1,
0.8901326, -0.3927017, 2.482218, 0.8235294, 0, 1, 1,
0.8906289, 2.079482, -0.4137839, 0.8313726, 0, 1, 1,
0.8954012, 0.1481144, 1.904023, 0.8352941, 0, 1, 1,
0.8988991, -0.495558, 3.31055, 0.8431373, 0, 1, 1,
0.8999328, -0.6691232, 3.56744, 0.8470588, 0, 1, 1,
0.9035516, -1.097982, 1.967803, 0.854902, 0, 1, 1,
0.9049641, -0.6229421, 3.418318, 0.8588235, 0, 1, 1,
0.9241371, 0.899645, 1.767669, 0.8666667, 0, 1, 1,
0.92505, 1.371833, -1.685893, 0.8705882, 0, 1, 1,
0.9289556, 0.6952338, 1.008053, 0.8784314, 0, 1, 1,
0.9297812, 0.9637768, 0.2654562, 0.8823529, 0, 1, 1,
0.9315423, -1.340478, 1.747287, 0.8901961, 0, 1, 1,
0.9318416, 0.5322847, 2.181653, 0.8941177, 0, 1, 1,
0.9326047, -0.1885326, 1.423722, 0.9019608, 0, 1, 1,
0.9438139, 0.4230583, 0.8471233, 0.9098039, 0, 1, 1,
0.9483362, 1.626627, 0.949629, 0.9137255, 0, 1, 1,
0.9551576, 1.339558, 2.514326, 0.9215686, 0, 1, 1,
0.9567726, -1.93569, 3.80137, 0.9254902, 0, 1, 1,
0.9590769, 3.371654, 1.063372, 0.9333333, 0, 1, 1,
0.9603132, 1.282253, 0.4368674, 0.9372549, 0, 1, 1,
0.9610031, -0.2879341, 0.7727048, 0.945098, 0, 1, 1,
0.9622576, 1.273212, -0.9264892, 0.9490196, 0, 1, 1,
0.9642733, 0.3427533, 1.747866, 0.9568627, 0, 1, 1,
0.9691283, -0.4346273, 2.207138, 0.9607843, 0, 1, 1,
0.9820227, 0.9910784, 0.02006653, 0.9686275, 0, 1, 1,
0.9822345, 0.9989462, 2.809159, 0.972549, 0, 1, 1,
0.9852666, -0.9234059, 1.576283, 0.9803922, 0, 1, 1,
0.9936404, -0.1225802, 1.891453, 0.9843137, 0, 1, 1,
0.9936762, -1.626345, 2.770403, 0.9921569, 0, 1, 1,
0.9959438, -1.238582, 1.843168, 0.9960784, 0, 1, 1,
0.9976331, 0.1057031, 0.1787275, 1, 0, 0.9960784, 1,
0.9979465, 0.03516486, 3.209054, 1, 0, 0.9882353, 1,
1.004637, -1.442559, 2.966559, 1, 0, 0.9843137, 1,
1.010338, -1.840664, 2.393819, 1, 0, 0.9764706, 1,
1.010362, -1.281048, 1.752762, 1, 0, 0.972549, 1,
1.012546, -0.4080955, 1.160099, 1, 0, 0.9647059, 1,
1.014421, 0.1133146, 0.9740951, 1, 0, 0.9607843, 1,
1.014725, 0.3519016, 0.4875548, 1, 0, 0.9529412, 1,
1.015914, -0.1526522, 2.501098, 1, 0, 0.9490196, 1,
1.021076, -0.8971152, 2.440838, 1, 0, 0.9411765, 1,
1.025975, -0.3527405, 0.6587669, 1, 0, 0.9372549, 1,
1.037297, -0.1566761, 1.430862, 1, 0, 0.9294118, 1,
1.037809, 0.3685265, 1.442449, 1, 0, 0.9254902, 1,
1.042083, -0.5621678, 1.891801, 1, 0, 0.9176471, 1,
1.044804, -1.253837, 3.517148, 1, 0, 0.9137255, 1,
1.052819, -1.491786, 4.244453, 1, 0, 0.9058824, 1,
1.060701, 0.1858753, 3.715775, 1, 0, 0.9019608, 1,
1.060865, -1.859064, 3.150017, 1, 0, 0.8941177, 1,
1.062014, 0.2407195, 0.4326942, 1, 0, 0.8862745, 1,
1.062758, -1.324295, 2.369888, 1, 0, 0.8823529, 1,
1.064304, -0.4589986, 2.985043, 1, 0, 0.8745098, 1,
1.078463, -3.476528, 2.68309, 1, 0, 0.8705882, 1,
1.079343, 1.192184, -0.6397336, 1, 0, 0.8627451, 1,
1.086337, 0.3572906, 1.96129, 1, 0, 0.8588235, 1,
1.089219, -0.434137, 2.469204, 1, 0, 0.8509804, 1,
1.110154, 0.5622466, 0.6045639, 1, 0, 0.8470588, 1,
1.113378, 0.6320118, 1.882691, 1, 0, 0.8392157, 1,
1.118125, -2.185551, 2.900951, 1, 0, 0.8352941, 1,
1.118776, -0.5386667, 2.907979, 1, 0, 0.827451, 1,
1.12861, 0.6205512, 0.817303, 1, 0, 0.8235294, 1,
1.133374, 0.6654935, 1.376055, 1, 0, 0.8156863, 1,
1.142126, 0.5911651, 1.113536, 1, 0, 0.8117647, 1,
1.143196, -1.554896, 2.275535, 1, 0, 0.8039216, 1,
1.161108, -0.09409831, 1.603332, 1, 0, 0.7960784, 1,
1.164746, -0.7885888, 2.071176, 1, 0, 0.7921569, 1,
1.167643, 0.23763, 0.8987741, 1, 0, 0.7843137, 1,
1.174798, -0.3688007, 2.359513, 1, 0, 0.7803922, 1,
1.176982, 0.3528267, 1.284593, 1, 0, 0.772549, 1,
1.180725, 0.2093639, 2.100782, 1, 0, 0.7686275, 1,
1.184171, -0.9333713, 1.276023, 1, 0, 0.7607843, 1,
1.185157, 0.2520402, 2.440448, 1, 0, 0.7568628, 1,
1.190129, 0.5371519, 0.07188993, 1, 0, 0.7490196, 1,
1.192368, -0.6043386, 3.503854, 1, 0, 0.7450981, 1,
1.194754, -1.65843, 3.645756, 1, 0, 0.7372549, 1,
1.196042, -1.464599, 3.176439, 1, 0, 0.7333333, 1,
1.196581, -1.37808, 2.436092, 1, 0, 0.7254902, 1,
1.199274, -0.6865392, 2.129588, 1, 0, 0.7215686, 1,
1.201817, -0.387333, 0.05159955, 1, 0, 0.7137255, 1,
1.204008, -0.3743807, 2.133682, 1, 0, 0.7098039, 1,
1.206967, 0.148534, 2.617183, 1, 0, 0.7019608, 1,
1.220659, -0.7565352, 2.485834, 1, 0, 0.6941177, 1,
1.224203, -0.6836923, 1.658393, 1, 0, 0.6901961, 1,
1.224839, 1.0029, 0.8238326, 1, 0, 0.682353, 1,
1.225196, 0.5181233, 0.1739064, 1, 0, 0.6784314, 1,
1.228903, 0.1034455, 0.1696771, 1, 0, 0.6705883, 1,
1.231242, 0.5852638, -0.7544688, 1, 0, 0.6666667, 1,
1.242046, 0.2786821, -0.2602976, 1, 0, 0.6588235, 1,
1.242114, -0.6343795, 3.31593, 1, 0, 0.654902, 1,
1.245847, -1.000497, 2.452347, 1, 0, 0.6470588, 1,
1.267187, -0.6871914, 2.208563, 1, 0, 0.6431373, 1,
1.279531, 0.6909178, 0.2143961, 1, 0, 0.6352941, 1,
1.280884, 1.578774, 0.1933956, 1, 0, 0.6313726, 1,
1.287564, 1.692608, 0.5085738, 1, 0, 0.6235294, 1,
1.289351, -0.1478419, 1.54927, 1, 0, 0.6196079, 1,
1.299256, 0.6614785, -0.04392581, 1, 0, 0.6117647, 1,
1.306305, -2.538376, 2.168022, 1, 0, 0.6078432, 1,
1.312106, 0.3880013, 1.746357, 1, 0, 0.6, 1,
1.340461, -0.554766, 2.769332, 1, 0, 0.5921569, 1,
1.351437, -0.6290546, 1.103046, 1, 0, 0.5882353, 1,
1.351518, 0.07758782, 0.8683683, 1, 0, 0.5803922, 1,
1.35484, 0.8678968, 0.2559906, 1, 0, 0.5764706, 1,
1.355225, -0.8189664, 1.03832, 1, 0, 0.5686275, 1,
1.365239, -0.6497645, 1.009474, 1, 0, 0.5647059, 1,
1.368633, -1.024158, 2.271923, 1, 0, 0.5568628, 1,
1.369505, 1.036476, 0.03755055, 1, 0, 0.5529412, 1,
1.374652, -3.321904, 2.941384, 1, 0, 0.5450981, 1,
1.378232, 0.4075699, 1.443073, 1, 0, 0.5411765, 1,
1.388054, -0.1614148, 2.260957, 1, 0, 0.5333334, 1,
1.390383, 1.192358, 1.027894, 1, 0, 0.5294118, 1,
1.397729, -1.419337, 2.790461, 1, 0, 0.5215687, 1,
1.398886, 0.5891497, 1.665584, 1, 0, 0.5176471, 1,
1.402403, 0.3666292, 2.402636, 1, 0, 0.509804, 1,
1.402916, 0.7494555, 1.121451, 1, 0, 0.5058824, 1,
1.433199, -0.6823564, -0.2482934, 1, 0, 0.4980392, 1,
1.435368, 0.09037412, 2.347901, 1, 0, 0.4901961, 1,
1.437294, -0.7697926, 1.878151, 1, 0, 0.4862745, 1,
1.454632, 1.234743, 1.190776, 1, 0, 0.4784314, 1,
1.477221, 1.709962, 0.4485282, 1, 0, 0.4745098, 1,
1.477782, 1.053249, 1.067282, 1, 0, 0.4666667, 1,
1.480278, -2.136416, 2.73011, 1, 0, 0.4627451, 1,
1.484959, -0.6673806, 2.773788, 1, 0, 0.454902, 1,
1.492484, 0.4173416, 0.975938, 1, 0, 0.4509804, 1,
1.497456, -0.2282863, 0.6846686, 1, 0, 0.4431373, 1,
1.497966, -0.296118, 3.841968, 1, 0, 0.4392157, 1,
1.500039, -0.3001201, 3.524403, 1, 0, 0.4313726, 1,
1.502272, -0.1021138, -0.6808894, 1, 0, 0.427451, 1,
1.503282, 1.03511, 1.653012, 1, 0, 0.4196078, 1,
1.526786, -0.8695486, 1.624981, 1, 0, 0.4156863, 1,
1.532773, 0.2510956, 2.861146, 1, 0, 0.4078431, 1,
1.535601, -0.2431337, 1.473805, 1, 0, 0.4039216, 1,
1.536427, -1.783641, 1.364781, 1, 0, 0.3960784, 1,
1.540893, 0.1068112, 3.021388, 1, 0, 0.3882353, 1,
1.546654, -0.1252119, 1.369293, 1, 0, 0.3843137, 1,
1.55307, 0.6568814, 2.313824, 1, 0, 0.3764706, 1,
1.555737, 2.328157, 3.643388, 1, 0, 0.372549, 1,
1.556491, -1.707856, 1.230169, 1, 0, 0.3647059, 1,
1.559128, -1.583459, 2.330771, 1, 0, 0.3607843, 1,
1.573768, 0.8143042, 1.838922, 1, 0, 0.3529412, 1,
1.575808, 1.224371, 0.325479, 1, 0, 0.3490196, 1,
1.576106, -0.2074623, 1.478424, 1, 0, 0.3411765, 1,
1.598286, 1.770432, 0.2186453, 1, 0, 0.3372549, 1,
1.599692, 0.02430111, 0.9865271, 1, 0, 0.3294118, 1,
1.601515, -0.1281262, 2.834185, 1, 0, 0.3254902, 1,
1.603869, 0.1343837, 1.018368, 1, 0, 0.3176471, 1,
1.621272, 0.7230264, 1.565238, 1, 0, 0.3137255, 1,
1.621431, -0.2531284, 3.579612, 1, 0, 0.3058824, 1,
1.63596, 0.2751456, 0.8803267, 1, 0, 0.2980392, 1,
1.641714, -1.303496, 3.197615, 1, 0, 0.2941177, 1,
1.65015, 2.374605, -0.4278675, 1, 0, 0.2862745, 1,
1.680348, -0.004682964, 0.2646625, 1, 0, 0.282353, 1,
1.698592, 0.4105733, 0.2352376, 1, 0, 0.2745098, 1,
1.719782, 1.893074, 1.272702, 1, 0, 0.2705882, 1,
1.725846, 0.5935873, 1.670188, 1, 0, 0.2627451, 1,
1.72809, -1.438287, 1.781605, 1, 0, 0.2588235, 1,
1.729586, -0.3151467, 0.3307271, 1, 0, 0.2509804, 1,
1.731959, 1.453098, 0.8016419, 1, 0, 0.2470588, 1,
1.741078, 0.860092, 1.033523, 1, 0, 0.2392157, 1,
1.748827, -1.954503, 3.444217, 1, 0, 0.2352941, 1,
1.791847, 0.9920409, 1.764266, 1, 0, 0.227451, 1,
1.7923, -0.03188781, 2.784381, 1, 0, 0.2235294, 1,
1.812177, 0.3444313, 0.69583, 1, 0, 0.2156863, 1,
1.814046, -0.735787, 3.626511, 1, 0, 0.2117647, 1,
1.821817, -1.818128, 3.758255, 1, 0, 0.2039216, 1,
1.823942, 1.069405, -1.117051, 1, 0, 0.1960784, 1,
1.828733, -0.2922064, 1.380798, 1, 0, 0.1921569, 1,
1.846935, -1.137465, 1.93054, 1, 0, 0.1843137, 1,
1.847592, 1.336473, 0.1759947, 1, 0, 0.1803922, 1,
1.938597, 0.9146575, 2.938069, 1, 0, 0.172549, 1,
1.951843, -0.7238322, 2.631931, 1, 0, 0.1686275, 1,
1.963715, 0.1401078, 1.943575, 1, 0, 0.1607843, 1,
1.969356, -0.3500489, 2.118973, 1, 0, 0.1568628, 1,
1.993872, 1.279953, 0.6596287, 1, 0, 0.1490196, 1,
2.000608, -0.4966154, 0.6697201, 1, 0, 0.145098, 1,
2.015488, 1.582894, 1.55903, 1, 0, 0.1372549, 1,
2.047932, -0.9015851, 0.1208161, 1, 0, 0.1333333, 1,
2.119554, -0.2379049, 2.620158, 1, 0, 0.1254902, 1,
2.1232, 0.7937694, 1.869738, 1, 0, 0.1215686, 1,
2.130474, -0.4980371, 2.445564, 1, 0, 0.1137255, 1,
2.131279, 0.07869404, 2.116663, 1, 0, 0.1098039, 1,
2.161556, 0.07431526, 0.3343523, 1, 0, 0.1019608, 1,
2.161867, -1.441996, 1.263201, 1, 0, 0.09411765, 1,
2.192157, -2.234144, 2.857441, 1, 0, 0.09019608, 1,
2.245835, 0.5853115, 2.004322, 1, 0, 0.08235294, 1,
2.262967, 1.064512, 1.064509, 1, 0, 0.07843138, 1,
2.309351, -0.2512177, 1.493212, 1, 0, 0.07058824, 1,
2.354371, 0.4917288, 0.4865635, 1, 0, 0.06666667, 1,
2.355349, 2.329344, -0.2541036, 1, 0, 0.05882353, 1,
2.379359, -1.116569, 1.9363, 1, 0, 0.05490196, 1,
2.40685, -0.6779712, 0.7246491, 1, 0, 0.04705882, 1,
2.415251, -0.5935522, 1.474347, 1, 0, 0.04313726, 1,
2.415631, -1.058922, 2.107751, 1, 0, 0.03529412, 1,
2.476168, 0.963906, 1.34796, 1, 0, 0.03137255, 1,
2.555923, 1.302456, 1.202149, 1, 0, 0.02352941, 1,
2.606346, -0.1856959, 1.10601, 1, 0, 0.01960784, 1,
2.608813, 0.4622038, 2.275397, 1, 0, 0.01176471, 1,
2.698974, 0.5968359, 2.03131, 1, 0, 0.007843138, 1
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
-0.1208497, -4.73959, -7.163596, 0, -0.5, 0.5, 0.5,
-0.1208497, -4.73959, -7.163596, 1, -0.5, 0.5, 0.5,
-0.1208497, -4.73959, -7.163596, 1, 1.5, 0.5, 0.5,
-0.1208497, -4.73959, -7.163596, 0, 1.5, 0.5, 0.5
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
-3.896594, -0.0961715, -7.163596, 0, -0.5, 0.5, 0.5,
-3.896594, -0.0961715, -7.163596, 1, -0.5, 0.5, 0.5,
-3.896594, -0.0961715, -7.163596, 1, 1.5, 0.5, 0.5,
-3.896594, -0.0961715, -7.163596, 0, 1.5, 0.5, 0.5
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
-3.896594, -4.73959, 0.2389536, 0, -0.5, 0.5, 0.5,
-3.896594, -4.73959, 0.2389536, 1, -0.5, 0.5, 0.5,
-3.896594, -4.73959, 0.2389536, 1, 1.5, 0.5, 0.5,
-3.896594, -4.73959, 0.2389536, 0, 1.5, 0.5, 0.5
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
-2, -3.668031, -5.455315,
2, -3.668031, -5.455315,
-2, -3.668031, -5.455315,
-2, -3.846625, -5.740028,
-1, -3.668031, -5.455315,
-1, -3.846625, -5.740028,
0, -3.668031, -5.455315,
0, -3.846625, -5.740028,
1, -3.668031, -5.455315,
1, -3.846625, -5.740028,
2, -3.668031, -5.455315,
2, -3.846625, -5.740028
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
-2, -4.203811, -6.309455, 0, -0.5, 0.5, 0.5,
-2, -4.203811, -6.309455, 1, -0.5, 0.5, 0.5,
-2, -4.203811, -6.309455, 1, 1.5, 0.5, 0.5,
-2, -4.203811, -6.309455, 0, 1.5, 0.5, 0.5,
-1, -4.203811, -6.309455, 0, -0.5, 0.5, 0.5,
-1, -4.203811, -6.309455, 1, -0.5, 0.5, 0.5,
-1, -4.203811, -6.309455, 1, 1.5, 0.5, 0.5,
-1, -4.203811, -6.309455, 0, 1.5, 0.5, 0.5,
0, -4.203811, -6.309455, 0, -0.5, 0.5, 0.5,
0, -4.203811, -6.309455, 1, -0.5, 0.5, 0.5,
0, -4.203811, -6.309455, 1, 1.5, 0.5, 0.5,
0, -4.203811, -6.309455, 0, 1.5, 0.5, 0.5,
1, -4.203811, -6.309455, 0, -0.5, 0.5, 0.5,
1, -4.203811, -6.309455, 1, -0.5, 0.5, 0.5,
1, -4.203811, -6.309455, 1, 1.5, 0.5, 0.5,
1, -4.203811, -6.309455, 0, 1.5, 0.5, 0.5,
2, -4.203811, -6.309455, 0, -0.5, 0.5, 0.5,
2, -4.203811, -6.309455, 1, -0.5, 0.5, 0.5,
2, -4.203811, -6.309455, 1, 1.5, 0.5, 0.5,
2, -4.203811, -6.309455, 0, 1.5, 0.5, 0.5
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
-3.025268, -3, -5.455315,
-3.025268, 3, -5.455315,
-3.025268, -3, -5.455315,
-3.170489, -3, -5.740028,
-3.025268, -2, -5.455315,
-3.170489, -2, -5.740028,
-3.025268, -1, -5.455315,
-3.170489, -1, -5.740028,
-3.025268, 0, -5.455315,
-3.170489, 0, -5.740028,
-3.025268, 1, -5.455315,
-3.170489, 1, -5.740028,
-3.025268, 2, -5.455315,
-3.170489, 2, -5.740028,
-3.025268, 3, -5.455315,
-3.170489, 3, -5.740028
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
-3.460931, -3, -6.309455, 0, -0.5, 0.5, 0.5,
-3.460931, -3, -6.309455, 1, -0.5, 0.5, 0.5,
-3.460931, -3, -6.309455, 1, 1.5, 0.5, 0.5,
-3.460931, -3, -6.309455, 0, 1.5, 0.5, 0.5,
-3.460931, -2, -6.309455, 0, -0.5, 0.5, 0.5,
-3.460931, -2, -6.309455, 1, -0.5, 0.5, 0.5,
-3.460931, -2, -6.309455, 1, 1.5, 0.5, 0.5,
-3.460931, -2, -6.309455, 0, 1.5, 0.5, 0.5,
-3.460931, -1, -6.309455, 0, -0.5, 0.5, 0.5,
-3.460931, -1, -6.309455, 1, -0.5, 0.5, 0.5,
-3.460931, -1, -6.309455, 1, 1.5, 0.5, 0.5,
-3.460931, -1, -6.309455, 0, 1.5, 0.5, 0.5,
-3.460931, 0, -6.309455, 0, -0.5, 0.5, 0.5,
-3.460931, 0, -6.309455, 1, -0.5, 0.5, 0.5,
-3.460931, 0, -6.309455, 1, 1.5, 0.5, 0.5,
-3.460931, 0, -6.309455, 0, 1.5, 0.5, 0.5,
-3.460931, 1, -6.309455, 0, -0.5, 0.5, 0.5,
-3.460931, 1, -6.309455, 1, -0.5, 0.5, 0.5,
-3.460931, 1, -6.309455, 1, 1.5, 0.5, 0.5,
-3.460931, 1, -6.309455, 0, 1.5, 0.5, 0.5,
-3.460931, 2, -6.309455, 0, -0.5, 0.5, 0.5,
-3.460931, 2, -6.309455, 1, -0.5, 0.5, 0.5,
-3.460931, 2, -6.309455, 1, 1.5, 0.5, 0.5,
-3.460931, 2, -6.309455, 0, 1.5, 0.5, 0.5,
-3.460931, 3, -6.309455, 0, -0.5, 0.5, 0.5,
-3.460931, 3, -6.309455, 1, -0.5, 0.5, 0.5,
-3.460931, 3, -6.309455, 1, 1.5, 0.5, 0.5,
-3.460931, 3, -6.309455, 0, 1.5, 0.5, 0.5
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
-3.025268, -3.668031, -4,
-3.025268, -3.668031, 4,
-3.025268, -3.668031, -4,
-3.170489, -3.846625, -4,
-3.025268, -3.668031, -2,
-3.170489, -3.846625, -2,
-3.025268, -3.668031, 0,
-3.170489, -3.846625, 0,
-3.025268, -3.668031, 2,
-3.170489, -3.846625, 2,
-3.025268, -3.668031, 4,
-3.170489, -3.846625, 4
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
-3.460931, -4.203811, -4, 0, -0.5, 0.5, 0.5,
-3.460931, -4.203811, -4, 1, -0.5, 0.5, 0.5,
-3.460931, -4.203811, -4, 1, 1.5, 0.5, 0.5,
-3.460931, -4.203811, -4, 0, 1.5, 0.5, 0.5,
-3.460931, -4.203811, -2, 0, -0.5, 0.5, 0.5,
-3.460931, -4.203811, -2, 1, -0.5, 0.5, 0.5,
-3.460931, -4.203811, -2, 1, 1.5, 0.5, 0.5,
-3.460931, -4.203811, -2, 0, 1.5, 0.5, 0.5,
-3.460931, -4.203811, 0, 0, -0.5, 0.5, 0.5,
-3.460931, -4.203811, 0, 1, -0.5, 0.5, 0.5,
-3.460931, -4.203811, 0, 1, 1.5, 0.5, 0.5,
-3.460931, -4.203811, 0, 0, 1.5, 0.5, 0.5,
-3.460931, -4.203811, 2, 0, -0.5, 0.5, 0.5,
-3.460931, -4.203811, 2, 1, -0.5, 0.5, 0.5,
-3.460931, -4.203811, 2, 1, 1.5, 0.5, 0.5,
-3.460931, -4.203811, 2, 0, 1.5, 0.5, 0.5,
-3.460931, -4.203811, 4, 0, -0.5, 0.5, 0.5,
-3.460931, -4.203811, 4, 1, -0.5, 0.5, 0.5,
-3.460931, -4.203811, 4, 1, 1.5, 0.5, 0.5,
-3.460931, -4.203811, 4, 0, 1.5, 0.5, 0.5
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
-3.025268, -3.668031, -5.455315,
-3.025268, 3.475688, -5.455315,
-3.025268, -3.668031, 5.933222,
-3.025268, 3.475688, 5.933222,
-3.025268, -3.668031, -5.455315,
-3.025268, -3.668031, 5.933222,
-3.025268, 3.475688, -5.455315,
-3.025268, 3.475688, 5.933222,
-3.025268, -3.668031, -5.455315,
2.783569, -3.668031, -5.455315,
-3.025268, -3.668031, 5.933222,
2.783569, -3.668031, 5.933222,
-3.025268, 3.475688, -5.455315,
2.783569, 3.475688, -5.455315,
-3.025268, 3.475688, 5.933222,
2.783569, 3.475688, 5.933222,
2.783569, -3.668031, -5.455315,
2.783569, 3.475688, -5.455315,
2.783569, -3.668031, 5.933222,
2.783569, 3.475688, 5.933222,
2.783569, -3.668031, -5.455315,
2.783569, -3.668031, 5.933222,
2.783569, 3.475688, -5.455315,
2.783569, 3.475688, 5.933222
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
var radius = 7.82011;
var distance = 34.79256;
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
mvMatrix.translate( 0.1208497, 0.0961715, -0.2389536 );
mvMatrix.scale( 1.455585, 1.183593, 0.7424357 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79256);
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
imibenconazole<-read.table("imibenconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imibenconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'imibenconazole' not found
```

```r
y<-imibenconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'imibenconazole' not found
```

```r
z<-imibenconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'imibenconazole' not found
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
-2.940674, 0.651156, -0.8315684, 0, 0, 1, 1, 1,
-2.850181, 0.3429039, -0.9933459, 1, 0, 0, 1, 1,
-2.849322, -0.2947537, -2.21677, 1, 0, 0, 1, 1,
-2.771381, -0.1425174, -0.6193696, 1, 0, 0, 1, 1,
-2.749016, -0.8358353, -2.422949, 1, 0, 0, 1, 1,
-2.649867, 0.01593313, -1.410729, 1, 0, 0, 1, 1,
-2.408721, -0.7871401, -2.179599, 0, 0, 0, 1, 1,
-2.390759, -0.8028586, -2.317038, 0, 0, 0, 1, 1,
-2.3222, -0.6579463, -2.150682, 0, 0, 0, 1, 1,
-2.313092, -0.3296212, -0.7310575, 0, 0, 0, 1, 1,
-2.298082, -0.1428247, -2.821098, 0, 0, 0, 1, 1,
-2.270283, 0.9544258, -0.6131119, 0, 0, 0, 1, 1,
-2.246329, 1.300693, 0.3793567, 0, 0, 0, 1, 1,
-2.230748, 0.819666, -1.269483, 1, 1, 1, 1, 1,
-2.22464, 0.2616554, -2.221078, 1, 1, 1, 1, 1,
-2.205552, -0.4606737, -2.663557, 1, 1, 1, 1, 1,
-2.191916, 0.007991917, -0.9877783, 1, 1, 1, 1, 1,
-2.180987, -0.6143636, -0.1473547, 1, 1, 1, 1, 1,
-2.166312, 1.596736, -2.181049, 1, 1, 1, 1, 1,
-2.147817, -0.8889386, -1.97139, 1, 1, 1, 1, 1,
-2.093801, -0.9916165, 0.2980037, 1, 1, 1, 1, 1,
-2.064381, -0.2210396, -0.9140651, 1, 1, 1, 1, 1,
-2.052541, 1.005516, -2.345934, 1, 1, 1, 1, 1,
-2.031412, 1.90604, 0.4108874, 1, 1, 1, 1, 1,
-2.02385, -1.319172, -2.658676, 1, 1, 1, 1, 1,
-2.012257, -0.4524017, -1.640826, 1, 1, 1, 1, 1,
-1.960208, 0.335095, -0.209107, 1, 1, 1, 1, 1,
-1.939857, 0.6509474, -1.020882, 1, 1, 1, 1, 1,
-1.919163, -0.5593644, -0.5298309, 0, 0, 1, 1, 1,
-1.910691, 0.4085428, -1.578495, 1, 0, 0, 1, 1,
-1.844455, -0.1006841, -2.218116, 1, 0, 0, 1, 1,
-1.839851, -1.545318, -2.098607, 1, 0, 0, 1, 1,
-1.833206, 0.5494351, -1.170667, 1, 0, 0, 1, 1,
-1.822241, 0.3477508, -3.551093, 1, 0, 0, 1, 1,
-1.815351, 0.1289569, -1.571935, 0, 0, 0, 1, 1,
-1.81486, 1.842826, -1.800107, 0, 0, 0, 1, 1,
-1.81307, 0.2159588, -1.102056, 0, 0, 0, 1, 1,
-1.791555, -1.237095, -3.268164, 0, 0, 0, 1, 1,
-1.785998, -1.079785, -4.22061, 0, 0, 0, 1, 1,
-1.761809, 0.4382646, -2.985375, 0, 0, 0, 1, 1,
-1.760597, -0.3508573, -0.596478, 0, 0, 0, 1, 1,
-1.747331, 0.6991569, -2.985276, 1, 1, 1, 1, 1,
-1.712716, -0.4155241, -1.73855, 1, 1, 1, 1, 1,
-1.706867, -0.5309302, -2.439515, 1, 1, 1, 1, 1,
-1.706252, -1.185575, -3.793844, 1, 1, 1, 1, 1,
-1.67698, -1.088016, -0.9948835, 1, 1, 1, 1, 1,
-1.66297, -0.00215047, -1.14208, 1, 1, 1, 1, 1,
-1.661098, 0.5894406, -0.9713622, 1, 1, 1, 1, 1,
-1.658163, 0.6892774, -2.087386, 1, 1, 1, 1, 1,
-1.653488, 2.133231, -2.638719, 1, 1, 1, 1, 1,
-1.646543, -0.3858596, -3.382019, 1, 1, 1, 1, 1,
-1.639175, -0.2773336, 0.186667, 1, 1, 1, 1, 1,
-1.632947, -0.345896, -0.2235251, 1, 1, 1, 1, 1,
-1.624588, 1.05342, -2.783664, 1, 1, 1, 1, 1,
-1.619132, 0.8834067, -2.386571, 1, 1, 1, 1, 1,
-1.609462, -0.8010665, -2.114123, 1, 1, 1, 1, 1,
-1.607686, -0.04085475, -2.846757, 0, 0, 1, 1, 1,
-1.607663, -1.223826, -1.997314, 1, 0, 0, 1, 1,
-1.606806, -0.1071246, -1.773227, 1, 0, 0, 1, 1,
-1.604037, -0.5270821, -1.91644, 1, 0, 0, 1, 1,
-1.59794, 0.05627989, 0.2011209, 1, 0, 0, 1, 1,
-1.590614, -2.645266, -2.326316, 1, 0, 0, 1, 1,
-1.586546, -1.304413, -3.527741, 0, 0, 0, 1, 1,
-1.579836, 0.8653454, -1.597613, 0, 0, 0, 1, 1,
-1.565661, -0.3233139, -2.008698, 0, 0, 0, 1, 1,
-1.549739, -0.5504223, -3.019323, 0, 0, 0, 1, 1,
-1.530963, -0.6229472, -0.6947379, 0, 0, 0, 1, 1,
-1.522297, 1.397015, -1.447116, 0, 0, 0, 1, 1,
-1.503193, 1.127812, 0.02552582, 0, 0, 0, 1, 1,
-1.50282, 0.305603, -1.872657, 1, 1, 1, 1, 1,
-1.498653, 0.2508779, -4.233085, 1, 1, 1, 1, 1,
-1.497851, -0.5608091, -2.052551, 1, 1, 1, 1, 1,
-1.496962, 0.2130208, -2.375419, 1, 1, 1, 1, 1,
-1.496082, 0.4458666, 0.3281919, 1, 1, 1, 1, 1,
-1.487234, 0.3718729, -0.1923304, 1, 1, 1, 1, 1,
-1.480436, -1.719667, -2.491013, 1, 1, 1, 1, 1,
-1.458363, -0.1427915, -1.434296, 1, 1, 1, 1, 1,
-1.455021, 1.074611, -0.04173229, 1, 1, 1, 1, 1,
-1.450613, -0.5559673, -0.7672573, 1, 1, 1, 1, 1,
-1.447971, 0.9341261, -0.9479579, 1, 1, 1, 1, 1,
-1.446584, 1.092594, -2.746348, 1, 1, 1, 1, 1,
-1.441423, 0.03234157, -0.8671316, 1, 1, 1, 1, 1,
-1.437054, -0.1986894, -1.383296, 1, 1, 1, 1, 1,
-1.434845, -0.6340913, -0.6316242, 1, 1, 1, 1, 1,
-1.423537, 0.8744282, -3.949306, 0, 0, 1, 1, 1,
-1.417456, -0.5690231, -1.400072, 1, 0, 0, 1, 1,
-1.414236, 0.2037381, -1.132495, 1, 0, 0, 1, 1,
-1.411637, 1.400996, -2.349496, 1, 0, 0, 1, 1,
-1.411138, -0.1656492, -2.606416, 1, 0, 0, 1, 1,
-1.405503, -1.006382, -4.824792, 1, 0, 0, 1, 1,
-1.404961, -0.729296, -2.110655, 0, 0, 0, 1, 1,
-1.401417, -0.1014424, -0.8844774, 0, 0, 0, 1, 1,
-1.400471, 0.4985423, -0.9138722, 0, 0, 0, 1, 1,
-1.399228, -0.8691876, -0.6472858, 0, 0, 0, 1, 1,
-1.398424, -1.319659, -0.7680516, 0, 0, 0, 1, 1,
-1.396243, 0.6438413, -0.1546014, 0, 0, 0, 1, 1,
-1.385538, 0.5298621, -1.450751, 0, 0, 0, 1, 1,
-1.383064, -0.3974892, -2.886296, 1, 1, 1, 1, 1,
-1.382589, 1.875616, -0.0566272, 1, 1, 1, 1, 1,
-1.378214, -0.5575246, -1.329549, 1, 1, 1, 1, 1,
-1.344032, 1.566727, -0.1192552, 1, 1, 1, 1, 1,
-1.339733, 1.956249, -1.147235, 1, 1, 1, 1, 1,
-1.334372, 0.718119, -2.902833, 1, 1, 1, 1, 1,
-1.332646, 0.9869513, -0.921699, 1, 1, 1, 1, 1,
-1.332206, 0.06310422, -2.418306, 1, 1, 1, 1, 1,
-1.330533, -1.185682, -2.399844, 1, 1, 1, 1, 1,
-1.319314, -0.07176942, -2.009453, 1, 1, 1, 1, 1,
-1.310697, -0.1087235, -1.375798, 1, 1, 1, 1, 1,
-1.310263, -1.795706, -3.780036, 1, 1, 1, 1, 1,
-1.306682, 0.1193225, -1.282721, 1, 1, 1, 1, 1,
-1.292786, 1.141639, -0.6842762, 1, 1, 1, 1, 1,
-1.287194, -0.3673779, -0.9978313, 1, 1, 1, 1, 1,
-1.272438, -0.3369316, -2.885093, 0, 0, 1, 1, 1,
-1.265846, -0.3347283, -2.873765, 1, 0, 0, 1, 1,
-1.263587, -0.5643336, -0.1895136, 1, 0, 0, 1, 1,
-1.262331, 0.4518306, 0.4900494, 1, 0, 0, 1, 1,
-1.257437, -0.8419448, -3.224277, 1, 0, 0, 1, 1,
-1.25655, -0.2093745, -3.57291, 1, 0, 0, 1, 1,
-1.252753, 1.278829, -0.8212427, 0, 0, 0, 1, 1,
-1.250954, -0.2154613, -2.126876, 0, 0, 0, 1, 1,
-1.2492, -0.5910323, -3.81311, 0, 0, 0, 1, 1,
-1.248545, -2.262867, -1.324602, 0, 0, 0, 1, 1,
-1.233906, 0.5227019, 0.5669028, 0, 0, 0, 1, 1,
-1.232542, -0.7957436, -2.275764, 0, 0, 0, 1, 1,
-1.225407, 2.266798, -1.078656, 0, 0, 0, 1, 1,
-1.221132, -2.993502, -3.202594, 1, 1, 1, 1, 1,
-1.203971, -1.49036, -3.284403, 1, 1, 1, 1, 1,
-1.202903, 0.552622, -2.900026, 1, 1, 1, 1, 1,
-1.199728, -1.320297, -2.011593, 1, 1, 1, 1, 1,
-1.199357, 0.5461383, -4.530663, 1, 1, 1, 1, 1,
-1.190764, -0.8840731, -1.726068, 1, 1, 1, 1, 1,
-1.181424, -1.274557, -0.8795383, 1, 1, 1, 1, 1,
-1.178492, 1.210624, -0.2592076, 1, 1, 1, 1, 1,
-1.176603, 0.3310954, -0.2834921, 1, 1, 1, 1, 1,
-1.170043, 1.59301, -0.1976887, 1, 1, 1, 1, 1,
-1.167047, 0.3497896, -1.421329, 1, 1, 1, 1, 1,
-1.154126, 1.97861, -0.06614041, 1, 1, 1, 1, 1,
-1.147382, 1.607591, 1.531784, 1, 1, 1, 1, 1,
-1.145404, -1.043514, -1.289369, 1, 1, 1, 1, 1,
-1.144322, 0.3719161, -0.8771147, 1, 1, 1, 1, 1,
-1.141393, -0.6959059, -0.04189467, 0, 0, 1, 1, 1,
-1.132617, 0.4607524, -1.508147, 1, 0, 0, 1, 1,
-1.132554, -1.052941, -0.5463502, 1, 0, 0, 1, 1,
-1.129834, -0.41532, -3.57691, 1, 0, 0, 1, 1,
-1.115548, 0.05965088, -1.950657, 1, 0, 0, 1, 1,
-1.111052, -1.007917, -2.911019, 1, 0, 0, 1, 1,
-1.103729, 1.543244, -1.497699, 0, 0, 0, 1, 1,
-1.10268, 0.4905063, -0.7165971, 0, 0, 0, 1, 1,
-1.094884, 1.804493, 0.9088514, 0, 0, 0, 1, 1,
-1.078026, 1.158665, -0.6656861, 0, 0, 0, 1, 1,
-1.074661, 0.5000836, -0.6816084, 0, 0, 0, 1, 1,
-1.073394, 1.017471, 0.8664225, 0, 0, 0, 1, 1,
-1.071933, 2.267773, 1.392563, 0, 0, 0, 1, 1,
-1.070794, -0.4082159, -2.769264, 1, 1, 1, 1, 1,
-1.067548, 0.2918162, -3.731322, 1, 1, 1, 1, 1,
-1.063121, 1.123684, 0.8511143, 1, 1, 1, 1, 1,
-1.06299, 0.4829687, -2.362569, 1, 1, 1, 1, 1,
-1.061613, 0.5299569, -1.756926, 1, 1, 1, 1, 1,
-1.061059, 0.4631408, 0.6770443, 1, 1, 1, 1, 1,
-1.058516, -0.164546, -1.581286, 1, 1, 1, 1, 1,
-1.056164, 1.244713, 0.05029647, 1, 1, 1, 1, 1,
-1.050095, 0.7457526, -0.4316303, 1, 1, 1, 1, 1,
-1.047574, 1.797682, -1.883994, 1, 1, 1, 1, 1,
-1.044876, 0.4766286, -1.988487, 1, 1, 1, 1, 1,
-1.037039, 0.3407773, -1.775847, 1, 1, 1, 1, 1,
-1.030239, -0.3267559, -0.8031673, 1, 1, 1, 1, 1,
-1.014544, -1.199095, -1.693515, 1, 1, 1, 1, 1,
-1.009718, -1.085516, -2.578611, 1, 1, 1, 1, 1,
-1.00226, -0.7630823, -1.060114, 0, 0, 1, 1, 1,
-1.001989, 1.778335, 0.385702, 1, 0, 0, 1, 1,
-0.9987324, 0.473577, -0.9044726, 1, 0, 0, 1, 1,
-0.9946977, -0.5524773, -2.783109, 1, 0, 0, 1, 1,
-0.9928724, 1.643103, -0.7367453, 1, 0, 0, 1, 1,
-0.9909306, -0.5789849, -2.688266, 1, 0, 0, 1, 1,
-0.9835801, 0.4501904, -0.7277339, 0, 0, 0, 1, 1,
-0.9784051, -3.563997, -2.68396, 0, 0, 0, 1, 1,
-0.9728883, -1.604966, -3.808836, 0, 0, 0, 1, 1,
-0.9693805, 0.4255228, -1.671316, 0, 0, 0, 1, 1,
-0.9642087, 0.6896439, -0.9203395, 0, 0, 0, 1, 1,
-0.9612039, 1.10571, -1.73841, 0, 0, 0, 1, 1,
-0.9570958, 1.692706, -0.3775424, 0, 0, 0, 1, 1,
-0.9536608, 0.8861346, 1.087047, 1, 1, 1, 1, 1,
-0.952568, 1.045774, -1.70376, 1, 1, 1, 1, 1,
-0.9496114, -1.672158, -2.433113, 1, 1, 1, 1, 1,
-0.9469541, 0.4105617, 0.1596067, 1, 1, 1, 1, 1,
-0.9469024, -0.5940835, -2.414548, 1, 1, 1, 1, 1,
-0.9412454, 0.05546708, -2.3705, 1, 1, 1, 1, 1,
-0.9384463, 0.7450012, -0.4415716, 1, 1, 1, 1, 1,
-0.9347025, 0.3159922, 0.3662605, 1, 1, 1, 1, 1,
-0.9267217, 0.8115556, -1.143989, 1, 1, 1, 1, 1,
-0.9256344, 1.262764, -2.217222, 1, 1, 1, 1, 1,
-0.9253011, -0.2779075, -2.380578, 1, 1, 1, 1, 1,
-0.9090698, -0.5732867, -2.589211, 1, 1, 1, 1, 1,
-0.9075577, -1.478573, -0.9616629, 1, 1, 1, 1, 1,
-0.9059544, 0.1382067, -2.53593, 1, 1, 1, 1, 1,
-0.9034079, 0.3122053, -1.709967, 1, 1, 1, 1, 1,
-0.9010223, -0.8266361, -2.486075, 0, 0, 1, 1, 1,
-0.8949061, 1.842523, -0.2979135, 1, 0, 0, 1, 1,
-0.8913519, 0.303001, -2.377505, 1, 0, 0, 1, 1,
-0.8864627, -1.349596, -3.140032, 1, 0, 0, 1, 1,
-0.8864428, 1.208732, -1.040584, 1, 0, 0, 1, 1,
-0.8817917, -1.507748, -3.565038, 1, 0, 0, 1, 1,
-0.8805568, -0.1767478, -0.9175029, 0, 0, 0, 1, 1,
-0.8786087, 1.309953, 0.7464088, 0, 0, 0, 1, 1,
-0.8774289, -1.603907, -2.799947, 0, 0, 0, 1, 1,
-0.8758674, 0.4745627, -1.23257, 0, 0, 0, 1, 1,
-0.8737459, 0.06925384, -1.059365, 0, 0, 0, 1, 1,
-0.8735889, -0.8058449, -1.725203, 0, 0, 0, 1, 1,
-0.8649282, -1.120328, -2.584659, 0, 0, 0, 1, 1,
-0.8598288, 0.9417466, -1.352512, 1, 1, 1, 1, 1,
-0.8565762, 0.6031132, 0.274387, 1, 1, 1, 1, 1,
-0.8548725, -0.7406344, -4.370672, 1, 1, 1, 1, 1,
-0.8533751, 1.004218, -0.3091513, 1, 1, 1, 1, 1,
-0.8442712, -0.4111594, -3.079543, 1, 1, 1, 1, 1,
-0.8397253, -0.169091, -1.540099, 1, 1, 1, 1, 1,
-0.8391366, 0.7573315, 0.04906813, 1, 1, 1, 1, 1,
-0.8378422, 0.1126437, -1.293953, 1, 1, 1, 1, 1,
-0.8341118, 1.22229, -1.389983, 1, 1, 1, 1, 1,
-0.8323321, -1.029988, -2.393301, 1, 1, 1, 1, 1,
-0.8309047, 1.995016, 0.7599791, 1, 1, 1, 1, 1,
-0.8301639, -1.712211, -2.584486, 1, 1, 1, 1, 1,
-0.8245721, 0.3859817, -2.036567, 1, 1, 1, 1, 1,
-0.8217322, -0.6295984, -0.210412, 1, 1, 1, 1, 1,
-0.8155317, -0.4025764, -1.619313, 1, 1, 1, 1, 1,
-0.8142436, 0.6896466, -0.766985, 0, 0, 1, 1, 1,
-0.8136538, 0.6562163, -2.685915, 1, 0, 0, 1, 1,
-0.8094788, 2.495144, 1.705369, 1, 0, 0, 1, 1,
-0.8060071, 0.5966763, -0.07982764, 1, 0, 0, 1, 1,
-0.8020408, 0.3051486, 0.2660303, 1, 0, 0, 1, 1,
-0.7988456, -0.4659168, -2.617888, 1, 0, 0, 1, 1,
-0.7960762, 1.16694, -2.310827, 0, 0, 0, 1, 1,
-0.7941745, -0.1561543, -1.77305, 0, 0, 0, 1, 1,
-0.7879525, -0.5370412, -2.608317, 0, 0, 0, 1, 1,
-0.7878448, 1.28749, -0.9248865, 0, 0, 0, 1, 1,
-0.7785534, 1.037634, -0.5862883, 0, 0, 0, 1, 1,
-0.7749951, 0.1630042, -0.1054106, 0, 0, 0, 1, 1,
-0.764486, 0.4587503, -0.4040936, 0, 0, 0, 1, 1,
-0.7587177, -0.6212198, -1.771781, 1, 1, 1, 1, 1,
-0.7582834, -2.419329, -3.217063, 1, 1, 1, 1, 1,
-0.7582037, -0.4493262, -0.9315868, 1, 1, 1, 1, 1,
-0.7548348, 0.4405417, -2.485726, 1, 1, 1, 1, 1,
-0.7533908, -0.6345829, -2.671263, 1, 1, 1, 1, 1,
-0.7499083, -0.7972063, -3.176647, 1, 1, 1, 1, 1,
-0.746413, 0.5833366, -2.842052, 1, 1, 1, 1, 1,
-0.7390728, -0.7078962, -1.781765, 1, 1, 1, 1, 1,
-0.7348701, -1.105072, -3.487986, 1, 1, 1, 1, 1,
-0.7334197, 0.8351573, 0.7302817, 1, 1, 1, 1, 1,
-0.7285282, 0.5784083, 0.4312511, 1, 1, 1, 1, 1,
-0.7235595, -0.7632167, -2.258004, 1, 1, 1, 1, 1,
-0.7210057, -0.8969727, -0.8075677, 1, 1, 1, 1, 1,
-0.7197869, -0.5562279, -2.659669, 1, 1, 1, 1, 1,
-0.7132684, -1.387218, -2.04794, 1, 1, 1, 1, 1,
-0.7098534, -0.6567762, -2.429403, 0, 0, 1, 1, 1,
-0.709139, -0.02999146, -0.5398724, 1, 0, 0, 1, 1,
-0.7085313, -0.6834318, -2.397257, 1, 0, 0, 1, 1,
-0.7005427, 1.73019, -2.21296, 1, 0, 0, 1, 1,
-0.6915326, -0.2751576, -3.391638, 1, 0, 0, 1, 1,
-0.6864406, -0.4764442, -2.069512, 1, 0, 0, 1, 1,
-0.6812321, 1.338717, -0.08699613, 0, 0, 0, 1, 1,
-0.6777618, 0.09856439, -0.4837252, 0, 0, 0, 1, 1,
-0.6683685, -0.1071776, -1.175363, 0, 0, 0, 1, 1,
-0.6673026, 0.1769324, -1.134261, 0, 0, 0, 1, 1,
-0.6622541, -0.0254104, -2.750377, 0, 0, 0, 1, 1,
-0.6517113, -0.2242789, -1.029465, 0, 0, 0, 1, 1,
-0.6392044, 0.8400058, 0.5333633, 0, 0, 0, 1, 1,
-0.6373694, 0.215528, -2.125106, 1, 1, 1, 1, 1,
-0.6372678, 1.677135, 2.009973, 1, 1, 1, 1, 1,
-0.6359571, 0.6350257, -1.657331, 1, 1, 1, 1, 1,
-0.6344312, 0.0546037, -2.411143, 1, 1, 1, 1, 1,
-0.622357, -0.1580729, -2.510807, 1, 1, 1, 1, 1,
-0.6195582, 1.846308, -0.760684, 1, 1, 1, 1, 1,
-0.6177254, -0.9860106, -3.31655, 1, 1, 1, 1, 1,
-0.6167705, -0.8269663, -1.877824, 1, 1, 1, 1, 1,
-0.6141784, 1.120841, -0.4239669, 1, 1, 1, 1, 1,
-0.6134122, 1.187667, -0.5976314, 1, 1, 1, 1, 1,
-0.6129106, -0.5054241, -1.194929, 1, 1, 1, 1, 1,
-0.6117665, 0.8230665, -1.258372, 1, 1, 1, 1, 1,
-0.6116123, 1.096946, 0.1518857, 1, 1, 1, 1, 1,
-0.6093436, -0.6682112, -2.425254, 1, 1, 1, 1, 1,
-0.6078121, -0.2136806, -5.202569, 1, 1, 1, 1, 1,
-0.6065295, 0.6434014, -0.2813541, 0, 0, 1, 1, 1,
-0.6027985, 1.211695, 1.130282, 1, 0, 0, 1, 1,
-0.5987165, 1.009438, -1.531956, 1, 0, 0, 1, 1,
-0.5975965, 1.144927, -1.431867, 1, 0, 0, 1, 1,
-0.5854205, 1.280758, -0.4579209, 1, 0, 0, 1, 1,
-0.5800102, 1.245228, -2.415707, 1, 0, 0, 1, 1,
-0.5787511, 0.764283, -0.03243708, 0, 0, 0, 1, 1,
-0.5787041, 0.1749525, -1.739473, 0, 0, 0, 1, 1,
-0.5756032, -0.701023, -3.479912, 0, 0, 0, 1, 1,
-0.5754467, -0.5940214, -2.142743, 0, 0, 0, 1, 1,
-0.5734552, 1.586058, -0.5485751, 0, 0, 0, 1, 1,
-0.5661466, -1.537518, -2.471013, 0, 0, 0, 1, 1,
-0.5512242, 0.6477863, -1.973153, 0, 0, 0, 1, 1,
-0.5506178, 0.654919, 0.5708081, 1, 1, 1, 1, 1,
-0.548115, -0.4538068, -2.339585, 1, 1, 1, 1, 1,
-0.5445351, 0.3247061, 0.7637458, 1, 1, 1, 1, 1,
-0.5436823, 0.5033789, 0.7463065, 1, 1, 1, 1, 1,
-0.5436664, 1.06403, -0.8873678, 1, 1, 1, 1, 1,
-0.5433557, 0.2071683, -1.354992, 1, 1, 1, 1, 1,
-0.5360337, 0.2249848, -0.3267347, 1, 1, 1, 1, 1,
-0.5290044, -1.084462, -3.245573, 1, 1, 1, 1, 1,
-0.5266824, 1.065634, -0.1430093, 1, 1, 1, 1, 1,
-0.5231492, 0.1999979, -0.7073277, 1, 1, 1, 1, 1,
-0.5225303, -0.06546726, -0.7411007, 1, 1, 1, 1, 1,
-0.514955, -0.68072, -2.534799, 1, 1, 1, 1, 1,
-0.5145344, 1.059308, 0.3125328, 1, 1, 1, 1, 1,
-0.5117671, 0.01213694, -1.030202, 1, 1, 1, 1, 1,
-0.5108685, 1.631424, 0.9342856, 1, 1, 1, 1, 1,
-0.508626, -0.4812993, -2.819407, 0, 0, 1, 1, 1,
-0.5081465, -0.705523, -3.449921, 1, 0, 0, 1, 1,
-0.5064951, -0.2445797, -4.710225, 1, 0, 0, 1, 1,
-0.503802, 0.9934518, 0.3124493, 1, 0, 0, 1, 1,
-0.5025342, -0.9048612, -2.443287, 1, 0, 0, 1, 1,
-0.4999225, -0.1085882, -2.422549, 1, 0, 0, 1, 1,
-0.4989412, 0.5346487, -0.4584345, 0, 0, 0, 1, 1,
-0.4959006, -0.6929474, -3.131936, 0, 0, 0, 1, 1,
-0.4905286, 0.09265853, -1.487021, 0, 0, 0, 1, 1,
-0.4899701, -0.6248455, -3.318265, 0, 0, 0, 1, 1,
-0.4843269, 1.880545, -1.705532, 0, 0, 0, 1, 1,
-0.4840238, 0.7098127, -0.02702248, 0, 0, 0, 1, 1,
-0.4812802, -1.280568, -3.575027, 0, 0, 0, 1, 1,
-0.4803524, 0.5065376, 1.012375, 1, 1, 1, 1, 1,
-0.4790507, 0.9875636, -1.916653, 1, 1, 1, 1, 1,
-0.4757947, 0.3349933, -0.5872465, 1, 1, 1, 1, 1,
-0.4746516, 1.072134, -0.1875351, 1, 1, 1, 1, 1,
-0.4695601, -1.127084, -2.313277, 1, 1, 1, 1, 1,
-0.4665162, 0.4758731, -2.661176, 1, 1, 1, 1, 1,
-0.4664933, -0.3802772, -3.093423, 1, 1, 1, 1, 1,
-0.4631516, -0.8724113, -2.762835, 1, 1, 1, 1, 1,
-0.4621282, 0.8397355, -0.3119109, 1, 1, 1, 1, 1,
-0.459565, -0.3037778, -2.43225, 1, 1, 1, 1, 1,
-0.454572, 0.9557713, -0.1436818, 1, 1, 1, 1, 1,
-0.4500427, -0.2349432, -0.7382353, 1, 1, 1, 1, 1,
-0.450026, 2.110698, 0.5424537, 1, 1, 1, 1, 1,
-0.4461133, 0.4975981, -0.3693577, 1, 1, 1, 1, 1,
-0.4449302, -0.7396969, -1.867257, 1, 1, 1, 1, 1,
-0.4398427, 2.729739, 0.2470301, 0, 0, 1, 1, 1,
-0.4261975, 0.9195961, 0.844906, 1, 0, 0, 1, 1,
-0.4244009, -1.968654, -1.252845, 1, 0, 0, 1, 1,
-0.4179527, -0.03682961, -0.5902693, 1, 0, 0, 1, 1,
-0.4176611, 0.1286816, -2.675873, 1, 0, 0, 1, 1,
-0.4166026, -0.7284207, -3.774263, 1, 0, 0, 1, 1,
-0.4130022, 0.9896476, -0.7056319, 0, 0, 0, 1, 1,
-0.4088654, 0.5355636, 1.090856, 0, 0, 0, 1, 1,
-0.4065143, 0.5888233, -0.1112351, 0, 0, 0, 1, 1,
-0.3955748, 0.8898733, 2.100659, 0, 0, 0, 1, 1,
-0.3940274, -0.001909198, -1.767057, 0, 0, 0, 1, 1,
-0.3939138, 0.5493172, 0.05654777, 0, 0, 0, 1, 1,
-0.3896657, -1.104356, -3.690814, 0, 0, 0, 1, 1,
-0.3892341, 0.9341003, -0.7127178, 1, 1, 1, 1, 1,
-0.3886493, 0.8219928, 0.008695167, 1, 1, 1, 1, 1,
-0.3831913, -0.5272621, -4.483067, 1, 1, 1, 1, 1,
-0.3800202, -1.061383, -4.618445, 1, 1, 1, 1, 1,
-0.3775017, -0.117224, -1.894745, 1, 1, 1, 1, 1,
-0.3752377, 1.311762, 0.7902895, 1, 1, 1, 1, 1,
-0.3700874, -2.090109, -4.152773, 1, 1, 1, 1, 1,
-0.3639303, 0.09779908, -0.2115958, 1, 1, 1, 1, 1,
-0.3606265, 0.08965947, 0.645123, 1, 1, 1, 1, 1,
-0.3587463, -0.5484741, -3.293064, 1, 1, 1, 1, 1,
-0.3578638, 0.1163049, -4.511963, 1, 1, 1, 1, 1,
-0.3543605, -0.7511736, -2.941284, 1, 1, 1, 1, 1,
-0.3450406, 0.1526351, -2.395034, 1, 1, 1, 1, 1,
-0.3445353, -0.7434592, -1.003872, 1, 1, 1, 1, 1,
-0.3431657, -1.073011, -3.20164, 1, 1, 1, 1, 1,
-0.3392709, 0.3847816, -2.380403, 0, 0, 1, 1, 1,
-0.3346645, 0.8852098, -1.167447, 1, 0, 0, 1, 1,
-0.3315604, -0.2927996, -1.756785, 1, 0, 0, 1, 1,
-0.3246863, 0.2709565, -2.918079, 1, 0, 0, 1, 1,
-0.3244557, -0.8157941, -4.023551, 1, 0, 0, 1, 1,
-0.3232926, 0.7615109, -0.3864073, 1, 0, 0, 1, 1,
-0.3160221, 0.942394, -1.124294, 0, 0, 0, 1, 1,
-0.3124972, 0.8890815, 0.1298551, 0, 0, 0, 1, 1,
-0.3119141, -0.3463359, -3.609861, 0, 0, 0, 1, 1,
-0.3112142, -1.125061, -3.856037, 0, 0, 0, 1, 1,
-0.3068146, 0.4685911, 0.6778154, 0, 0, 0, 1, 1,
-0.3051051, 0.4731415, -1.003833, 0, 0, 0, 1, 1,
-0.3044437, -1.724859, -3.0377, 0, 0, 0, 1, 1,
-0.3018701, -1.030814, -3.073014, 1, 1, 1, 1, 1,
-0.3016392, 0.2235571, 0.2538907, 1, 1, 1, 1, 1,
-0.2950998, -0.2389725, -1.183988, 1, 1, 1, 1, 1,
-0.2934245, -1.501781, -3.15183, 1, 1, 1, 1, 1,
-0.2917772, 1.224007, 0.3814221, 1, 1, 1, 1, 1,
-0.2871965, -1.022416, -1.854779, 1, 1, 1, 1, 1,
-0.2852962, 0.9772726, -0.3940629, 1, 1, 1, 1, 1,
-0.2844248, 0.3786976, -1.847049, 1, 1, 1, 1, 1,
-0.284393, 0.3457011, -0.4450516, 1, 1, 1, 1, 1,
-0.2825013, 0.6747428, -1.31917, 1, 1, 1, 1, 1,
-0.2811507, -0.2798305, -2.600652, 1, 1, 1, 1, 1,
-0.2803692, -0.1660601, -4.353102, 1, 1, 1, 1, 1,
-0.2730966, 0.981691, -0.1593773, 1, 1, 1, 1, 1,
-0.2729819, 0.02559096, -2.32136, 1, 1, 1, 1, 1,
-0.2714162, -0.2898626, -1.152367, 1, 1, 1, 1, 1,
-0.2708468, -0.1050528, -0.9037711, 0, 0, 1, 1, 1,
-0.2691244, -0.1479133, -1.810409, 1, 0, 0, 1, 1,
-0.2686065, -0.4955819, -1.961353, 1, 0, 0, 1, 1,
-0.2622672, 0.3685966, -1.257626, 1, 0, 0, 1, 1,
-0.2600153, 0.5033978, 0.1122295, 1, 0, 0, 1, 1,
-0.2577459, -1.327381, -1.296485, 1, 0, 0, 1, 1,
-0.2573735, -0.7368391, -2.881625, 0, 0, 0, 1, 1,
-0.2569647, -0.2280983, -1.906014, 0, 0, 0, 1, 1,
-0.2541625, 1.360992, -1.649284, 0, 0, 0, 1, 1,
-0.2520081, 0.2867478, -1.542599, 0, 0, 0, 1, 1,
-0.2519192, 0.2992877, 1.055731, 0, 0, 0, 1, 1,
-0.2504976, 1.671125, -0.2646063, 0, 0, 0, 1, 1,
-0.242335, -0.2979293, -4.041824, 0, 0, 0, 1, 1,
-0.2418733, 0.02074824, -1.654812, 1, 1, 1, 1, 1,
-0.2388828, -0.9313575, -4.39015, 1, 1, 1, 1, 1,
-0.2385021, -0.180309, -0.8787033, 1, 1, 1, 1, 1,
-0.2368679, -2.079322, -2.020911, 1, 1, 1, 1, 1,
-0.2352332, -1.856433, -2.661192, 1, 1, 1, 1, 1,
-0.2351463, 0.3831497, -0.9739965, 1, 1, 1, 1, 1,
-0.2337952, 1.129132, -0.2527694, 1, 1, 1, 1, 1,
-0.2324166, 1.232267, -1.557864, 1, 1, 1, 1, 1,
-0.2312548, -0.3163283, -0.9594528, 1, 1, 1, 1, 1,
-0.2299994, 1.467909, -0.08382688, 1, 1, 1, 1, 1,
-0.2242274, 0.672552, -1.895485, 1, 1, 1, 1, 1,
-0.2226709, 0.144287, -2.007553, 1, 1, 1, 1, 1,
-0.2221627, -0.7635229, -2.454179, 1, 1, 1, 1, 1,
-0.2142745, 0.1822404, -1.964918, 1, 1, 1, 1, 1,
-0.2116811, 0.1826826, -1.335484, 1, 1, 1, 1, 1,
-0.2087139, 1.458385, -0.4757386, 0, 0, 1, 1, 1,
-0.2071039, -1.311048, -3.629229, 1, 0, 0, 1, 1,
-0.2067421, 0.7771416, -1.266235, 1, 0, 0, 1, 1,
-0.1989725, 2.367269, 1.038677, 1, 0, 0, 1, 1,
-0.1985446, 1.27452, 0.696328, 1, 0, 0, 1, 1,
-0.1948218, -0.9648963, -1.278831, 1, 0, 0, 1, 1,
-0.1941544, -1.806429, -1.608548, 0, 0, 0, 1, 1,
-0.1870087, -2.200736, -2.93754, 0, 0, 0, 1, 1,
-0.1863994, 1.000294, -0.3848483, 0, 0, 0, 1, 1,
-0.1808352, -0.3358145, -2.868795, 0, 0, 0, 1, 1,
-0.1788059, -0.7208147, -2.401757, 0, 0, 0, 1, 1,
-0.1762258, 2.621546, -1.759175, 0, 0, 0, 1, 1,
-0.1756281, -0.3013681, -2.835008, 0, 0, 0, 1, 1,
-0.1724639, -0.6195635, -1.123788, 1, 1, 1, 1, 1,
-0.1702102, -0.5802122, -2.87465, 1, 1, 1, 1, 1,
-0.1695218, -0.4632481, -3.517804, 1, 1, 1, 1, 1,
-0.1684658, -0.7743964, -3.239286, 1, 1, 1, 1, 1,
-0.1656968, 1.287828, 0.00150706, 1, 1, 1, 1, 1,
-0.151746, 0.1745522, -2.36006, 1, 1, 1, 1, 1,
-0.1504801, -0.345192, -2.322193, 1, 1, 1, 1, 1,
-0.1489841, -0.2656439, -2.586791, 1, 1, 1, 1, 1,
-0.1480102, -1.15444, -2.853925, 1, 1, 1, 1, 1,
-0.1477413, -0.8192098, -3.248369, 1, 1, 1, 1, 1,
-0.1456884, 0.6592684, 0.5225875, 1, 1, 1, 1, 1,
-0.1442409, 0.1158743, -1.89237, 1, 1, 1, 1, 1,
-0.1332817, -0.9348616, -4.346208, 1, 1, 1, 1, 1,
-0.131721, -0.4679807, -3.206545, 1, 1, 1, 1, 1,
-0.130704, 0.4479489, 0.5379258, 1, 1, 1, 1, 1,
-0.1304233, 0.310068, 0.5898334, 0, 0, 1, 1, 1,
-0.123259, -1.90018, -2.946671, 1, 0, 0, 1, 1,
-0.1155847, 0.3490355, 0.9317032, 1, 0, 0, 1, 1,
-0.1154656, -1.177553, -2.631905, 1, 0, 0, 1, 1,
-0.1131245, -1.176823, -2.74551, 1, 0, 0, 1, 1,
-0.1121532, 1.527032, -1.429662, 1, 0, 0, 1, 1,
-0.1118715, 1.810161, -0.7850341, 0, 0, 0, 1, 1,
-0.1051964, -0.07800271, -1.659514, 0, 0, 0, 1, 1,
-0.1048432, -0.7115583, 0.1144826, 0, 0, 0, 1, 1,
-0.1030922, -2.286878, -2.922712, 0, 0, 0, 1, 1,
-0.1014232, 1.441595, 0.864659, 0, 0, 0, 1, 1,
-0.09320892, 0.7412677, 1.195517, 0, 0, 0, 1, 1,
-0.09285336, 0.3563284, 0.6252042, 0, 0, 0, 1, 1,
-0.08450784, 0.3891837, 0.5829956, 1, 1, 1, 1, 1,
-0.08428998, 0.06621765, -1.377215, 1, 1, 1, 1, 1,
-0.08087856, 0.04392271, -0.4456217, 1, 1, 1, 1, 1,
-0.08037368, -0.5021973, -3.275332, 1, 1, 1, 1, 1,
-0.07479381, 2.263873, -0.1444681, 1, 1, 1, 1, 1,
-0.07475562, 0.04737067, -1.769997, 1, 1, 1, 1, 1,
-0.07169199, -1.70615, -4.16512, 1, 1, 1, 1, 1,
-0.06799078, -0.7962133, -2.936371, 1, 1, 1, 1, 1,
-0.06659631, -1.31039, -3.418558, 1, 1, 1, 1, 1,
-0.06386101, 0.9527316, -0.4433487, 1, 1, 1, 1, 1,
-0.05059907, 0.73171, -0.1437019, 1, 1, 1, 1, 1,
-0.04962086, 1.477263, 0.1271196, 1, 1, 1, 1, 1,
-0.04138022, -0.5534254, -3.423519, 1, 1, 1, 1, 1,
-0.04114371, 0.1988524, 0.8102781, 1, 1, 1, 1, 1,
-0.03116236, 2.60098, -0.4064203, 1, 1, 1, 1, 1,
-0.03016644, -0.232786, -3.820308, 0, 0, 1, 1, 1,
-0.02885716, -0.5475681, -4.217482, 1, 0, 0, 1, 1,
-0.02776888, 0.2651791, -0.1749889, 1, 0, 0, 1, 1,
-0.02768915, -0.9383814, -5.289463, 1, 0, 0, 1, 1,
-0.02639805, 0.03054246, -1.117038, 1, 0, 0, 1, 1,
-0.02292443, -1.581127, -2.586061, 1, 0, 0, 1, 1,
-0.02128259, -3.197175, -4.618761, 0, 0, 0, 1, 1,
-0.02083836, -1.351433, -2.038666, 0, 0, 0, 1, 1,
-0.008525813, -0.5228433, -3.465667, 0, 0, 0, 1, 1,
-0.006559463, 0.3062623, -0.4873499, 0, 0, 0, 1, 1,
-0.005793617, 1.002612, -0.8567871, 0, 0, 0, 1, 1,
-0.003769633, 1.403469, -0.1700879, 0, 0, 0, 1, 1,
-0.003736455, 0.5016643, -0.4261743, 0, 0, 0, 1, 1,
-0.002762701, -0.09497307, -3.525986, 1, 1, 1, 1, 1,
-0.002407967, -0.09289572, -3.533404, 1, 1, 1, 1, 1,
-0.002064368, -0.01396845, -4.046278, 1, 1, 1, 1, 1,
-0.002014882, 0.987642, 0.7558022, 1, 1, 1, 1, 1,
-0.0006139276, 1.914518, -1.335019, 1, 1, 1, 1, 1,
0.0002293005, -1.162662, 3.226631, 1, 1, 1, 1, 1,
0.0009656957, 1.526941, -1.107405, 1, 1, 1, 1, 1,
0.001189462, -0.5370607, 4.501861, 1, 1, 1, 1, 1,
0.00133786, -1.275234, 3.203259, 1, 1, 1, 1, 1,
0.002793619, -0.7317737, 2.400952, 1, 1, 1, 1, 1,
0.004386448, 0.7218137, 0.4865218, 1, 1, 1, 1, 1,
0.00949935, 1.161539, -0.314611, 1, 1, 1, 1, 1,
0.009777263, 1.812348, 0.1987993, 1, 1, 1, 1, 1,
0.01523426, -1.249033, 4.490289, 1, 1, 1, 1, 1,
0.01772008, 3.007648, -1.306986, 1, 1, 1, 1, 1,
0.01963801, -0.918433, 2.563702, 0, 0, 1, 1, 1,
0.02504721, 1.159964, 1.125861, 1, 0, 0, 1, 1,
0.0278635, 1.639215, 0.5384284, 1, 0, 0, 1, 1,
0.02983099, -0.03289862, 1.646838, 1, 0, 0, 1, 1,
0.03165799, 1.329934, -0.5883615, 1, 0, 0, 1, 1,
0.04160624, 0.5581917, -0.3828114, 1, 0, 0, 1, 1,
0.04226197, 0.4887248, -0.03903583, 0, 0, 0, 1, 1,
0.04881665, 0.4495294, -0.630353, 0, 0, 0, 1, 1,
0.05083358, -0.7523325, 3.006294, 0, 0, 0, 1, 1,
0.05214792, -0.5999227, 4.627023, 0, 0, 0, 1, 1,
0.05346532, -1.0387, 4.753235, 0, 0, 0, 1, 1,
0.05441828, 0.3784807, -0.174736, 0, 0, 0, 1, 1,
0.05705194, 1.51026, -0.8866972, 0, 0, 0, 1, 1,
0.05720447, -1.347489, 5.113871, 1, 1, 1, 1, 1,
0.05889853, 1.259332, 1.143134, 1, 1, 1, 1, 1,
0.0590932, -0.01864195, 2.00198, 1, 1, 1, 1, 1,
0.06362955, 1.388572, 0.6136774, 1, 1, 1, 1, 1,
0.07019619, 0.5029581, 0.4178754, 1, 1, 1, 1, 1,
0.07088646, 0.2011717, -0.09861225, 1, 1, 1, 1, 1,
0.07113876, -0.4968866, -0.08312004, 1, 1, 1, 1, 1,
0.0738123, 1.636525, 0.3098984, 1, 1, 1, 1, 1,
0.07529074, 2.558068, -0.2680625, 1, 1, 1, 1, 1,
0.07938782, -0.7503803, -0.1278258, 1, 1, 1, 1, 1,
0.08020025, 1.317896, 0.4200082, 1, 1, 1, 1, 1,
0.0830844, 0.7722625, 0.3392477, 1, 1, 1, 1, 1,
0.08485943, -2.621742, 3.283572, 1, 1, 1, 1, 1,
0.0868101, 0.8383735, -1.032536, 1, 1, 1, 1, 1,
0.08848479, 1.002341, 2.288158, 1, 1, 1, 1, 1,
0.0917181, 0.6548346, 2.41251, 0, 0, 1, 1, 1,
0.09331648, -0.3862632, 3.798121, 1, 0, 0, 1, 1,
0.09409221, 0.2711928, 1.019233, 1, 0, 0, 1, 1,
0.09673249, -0.3083361, 3.682497, 1, 0, 0, 1, 1,
0.09850324, -2.01858, 5.76737, 1, 0, 0, 1, 1,
0.1017977, 0.2329226, 0.7052146, 1, 0, 0, 1, 1,
0.103191, -1.66469, 2.902226, 0, 0, 0, 1, 1,
0.1037948, -0.8952913, 3.952299, 0, 0, 0, 1, 1,
0.1050102, 1.527961, -0.5518772, 0, 0, 0, 1, 1,
0.1052253, -1.064279, 4.847881, 0, 0, 0, 1, 1,
0.1057861, 0.7356145, -0.2659199, 0, 0, 0, 1, 1,
0.1092757, 1.024607, 1.451687, 0, 0, 0, 1, 1,
0.1147614, -0.9469732, 1.500605, 0, 0, 0, 1, 1,
0.1161621, 0.3725405, 0.4754957, 1, 1, 1, 1, 1,
0.1324652, 1.724551, 2.066609, 1, 1, 1, 1, 1,
0.1366616, 0.2934887, 0.4014985, 1, 1, 1, 1, 1,
0.1389577, -1.288909, 1.753145, 1, 1, 1, 1, 1,
0.1408402, -0.6316851, 2.655352, 1, 1, 1, 1, 1,
0.1433084, 0.4447635, 0.428234, 1, 1, 1, 1, 1,
0.1459987, 0.6210147, -0.5099508, 1, 1, 1, 1, 1,
0.1464927, -0.4725829, 2.768394, 1, 1, 1, 1, 1,
0.1466659, 0.1755115, 0.5782097, 1, 1, 1, 1, 1,
0.1481085, 0.7287667, -1.084935, 1, 1, 1, 1, 1,
0.1534235, -0.03693717, 3.253615, 1, 1, 1, 1, 1,
0.1596019, -0.6612966, 0.6639231, 1, 1, 1, 1, 1,
0.1658985, 0.5976936, -0.9911469, 1, 1, 1, 1, 1,
0.1680252, 0.1700572, 2.460947, 1, 1, 1, 1, 1,
0.1683989, 0.4496087, 0.07191361, 1, 1, 1, 1, 1,
0.1726168, 0.6147562, 1.548158, 0, 0, 1, 1, 1,
0.1773156, -0.6292763, 3.173022, 1, 0, 0, 1, 1,
0.1774753, -0.8877202, 3.595389, 1, 0, 0, 1, 1,
0.1779152, -0.3521644, 1.733213, 1, 0, 0, 1, 1,
0.1784468, -2.146161, 1.184246, 1, 0, 0, 1, 1,
0.1794765, 0.5727404, 0.7475037, 1, 0, 0, 1, 1,
0.1802976, -0.6384258, 1.757022, 0, 0, 0, 1, 1,
0.1805243, 0.1946004, 0.1464408, 0, 0, 0, 1, 1,
0.180574, 0.4514143, 1.355664, 0, 0, 0, 1, 1,
0.1816795, -1.720852, 2.493634, 0, 0, 0, 1, 1,
0.183679, -2.240505, 2.588712, 0, 0, 0, 1, 1,
0.1839221, 0.3134898, 1.592676, 0, 0, 0, 1, 1,
0.1895509, 1.477659, 0.5081378, 0, 0, 0, 1, 1,
0.1959564, 1.257035, 0.09569366, 1, 1, 1, 1, 1,
0.201063, 1.731652, 1.044845, 1, 1, 1, 1, 1,
0.2042968, -0.4595948, 2.293519, 1, 1, 1, 1, 1,
0.2054923, 0.9333336, 0.2903987, 1, 1, 1, 1, 1,
0.2056856, -1.84154, 3.117588, 1, 1, 1, 1, 1,
0.2089594, 1.124004, -0.09438728, 1, 1, 1, 1, 1,
0.2144726, -0.6920616, 2.970784, 1, 1, 1, 1, 1,
0.215683, 0.7889183, 0.8976217, 1, 1, 1, 1, 1,
0.2159753, -0.07758599, 2.498781, 1, 1, 1, 1, 1,
0.2181055, -1.382673, 3.677174, 1, 1, 1, 1, 1,
0.218127, -0.3269863, 2.402314, 1, 1, 1, 1, 1,
0.2210287, -1.010163, 2.088476, 1, 1, 1, 1, 1,
0.2237385, -0.9004997, 4.651302, 1, 1, 1, 1, 1,
0.224079, 0.441366, 0.04181264, 1, 1, 1, 1, 1,
0.2281646, -1.510352, 2.818484, 1, 1, 1, 1, 1,
0.2306883, 0.8620045, 1.638192, 0, 0, 1, 1, 1,
0.2321264, -0.9476003, 3.323421, 1, 0, 0, 1, 1,
0.2349456, 0.3725347, 0.9022022, 1, 0, 0, 1, 1,
0.2372492, -1.414397, 3.494647, 1, 0, 0, 1, 1,
0.2381198, 0.7031285, 0.4260237, 1, 0, 0, 1, 1,
0.2382586, 0.260968, 0.8563078, 1, 0, 0, 1, 1,
0.2411918, 0.7140319, 0.3202794, 0, 0, 0, 1, 1,
0.2459345, 0.5941337, -0.8002073, 0, 0, 0, 1, 1,
0.2481899, 0.6430394, -1.100223, 0, 0, 0, 1, 1,
0.2583746, -0.2897912, 2.350637, 0, 0, 0, 1, 1,
0.2589415, -0.5939772, 1.935136, 0, 0, 0, 1, 1,
0.2591967, 2.152405, 0.01408172, 0, 0, 0, 1, 1,
0.2638502, -0.2880127, 2.205648, 0, 0, 0, 1, 1,
0.2666522, 0.9725441, 0.1739633, 1, 1, 1, 1, 1,
0.2688083, 0.02028172, 1.561176, 1, 1, 1, 1, 1,
0.2731165, -1.259323, 3.087295, 1, 1, 1, 1, 1,
0.2738917, 1.599784, -0.1560417, 1, 1, 1, 1, 1,
0.2754104, 1.253553, 0.6219214, 1, 1, 1, 1, 1,
0.2757876, -0.6430641, 2.719719, 1, 1, 1, 1, 1,
0.2771761, 0.6868963, 0.4065578, 1, 1, 1, 1, 1,
0.2779034, -1.940471, 4.597324, 1, 1, 1, 1, 1,
0.2780268, -0.8973389, 4.670337, 1, 1, 1, 1, 1,
0.2784823, 1.4733, 2.037436, 1, 1, 1, 1, 1,
0.2787458, 0.0173198, -0.2444526, 1, 1, 1, 1, 1,
0.2826164, 0.8972256, -1.158304, 1, 1, 1, 1, 1,
0.2871566, -0.5113234, 4.133825, 1, 1, 1, 1, 1,
0.2883999, -1.543599, 3.17014, 1, 1, 1, 1, 1,
0.2886699, -1.780098, 5.025566, 1, 1, 1, 1, 1,
0.2912824, -0.5828158, 2.919189, 0, 0, 1, 1, 1,
0.2919056, -0.2278396, 2.133971, 1, 0, 0, 1, 1,
0.2947111, 0.1977296, 1.790088, 1, 0, 0, 1, 1,
0.2986928, 1.584015, 0.1197349, 1, 0, 0, 1, 1,
0.3024018, 0.4137684, 0.1982992, 1, 0, 0, 1, 1,
0.303408, -1.059072, 3.108141, 1, 0, 0, 1, 1,
0.3057652, 0.7802413, 2.354688, 0, 0, 0, 1, 1,
0.3092992, -0.03074982, 1.797991, 0, 0, 0, 1, 1,
0.3100704, 0.5861357, 1.778031, 0, 0, 0, 1, 1,
0.311572, -1.381239, 2.229035, 0, 0, 0, 1, 1,
0.3201222, -1.912538, 3.357335, 0, 0, 0, 1, 1,
0.3262415, -1.323043, 2.958944, 0, 0, 0, 1, 1,
0.3289082, 1.308785, 0.2077972, 0, 0, 0, 1, 1,
0.3380947, -0.7646898, 2.471801, 1, 1, 1, 1, 1,
0.3475516, 1.815096, -0.2019987, 1, 1, 1, 1, 1,
0.3503987, 0.2287968, 1.222124, 1, 1, 1, 1, 1,
0.3511786, 0.1276388, -0.5677204, 1, 1, 1, 1, 1,
0.352475, 0.7962655, 0.00907205, 1, 1, 1, 1, 1,
0.3532923, -0.4089064, 1.276063, 1, 1, 1, 1, 1,
0.3583759, 0.215462, 0.9268373, 1, 1, 1, 1, 1,
0.3603951, 0.3205536, -0.6592563, 1, 1, 1, 1, 1,
0.3618259, 0.6851056, 0.5589644, 1, 1, 1, 1, 1,
0.3630517, -0.8075686, 1.456695, 1, 1, 1, 1, 1,
0.3644812, 0.8679775, -0.1172737, 1, 1, 1, 1, 1,
0.3666805, -0.1989758, 1.187209, 1, 1, 1, 1, 1,
0.3681825, -1.723659, 2.985577, 1, 1, 1, 1, 1,
0.369868, -0.1983086, -0.6241302, 1, 1, 1, 1, 1,
0.3823351, -0.3551084, 4.442267, 1, 1, 1, 1, 1,
0.3826631, 1.049885, -0.2958841, 0, 0, 1, 1, 1,
0.3832494, -0.254403, 1.718644, 1, 0, 0, 1, 1,
0.3839047, -0.04526033, 2.577994, 1, 0, 0, 1, 1,
0.3876801, 0.4804429, 2.863919, 1, 0, 0, 1, 1,
0.3880824, -0.3247557, 2.314014, 1, 0, 0, 1, 1,
0.3934886, -1.817536, 3.624452, 1, 0, 0, 1, 1,
0.396866, -0.3285823, 2.258047, 0, 0, 0, 1, 1,
0.3992673, -2.14678, 3.28491, 0, 0, 0, 1, 1,
0.4016168, -0.3379792, 2.776594, 0, 0, 0, 1, 1,
0.4053853, 0.1204028, -1.698715, 0, 0, 0, 1, 1,
0.4054655, 0.9819114, 1.255987, 0, 0, 0, 1, 1,
0.4107589, -0.5149556, 2.39999, 0, 0, 0, 1, 1,
0.4112288, 0.01560478, 1.753902, 0, 0, 0, 1, 1,
0.41666, -0.5418562, 2.735514, 1, 1, 1, 1, 1,
0.4180595, 1.257052, 0.8684727, 1, 1, 1, 1, 1,
0.4181535, 0.7277047, 1.352193, 1, 1, 1, 1, 1,
0.4259512, 2.277151, 1.136934, 1, 1, 1, 1, 1,
0.4269589, 0.8731023, -1.284303, 1, 1, 1, 1, 1,
0.4272899, 1.282166, -1.400297, 1, 1, 1, 1, 1,
0.4302728, 0.2331224, 1.817935, 1, 1, 1, 1, 1,
0.434401, 0.3419814, 2.006497, 1, 1, 1, 1, 1,
0.4404596, 1.213993, 1.010685, 1, 1, 1, 1, 1,
0.4527036, -1.402649, 2.287075, 1, 1, 1, 1, 1,
0.4554061, 1.235165, -0.3884547, 1, 1, 1, 1, 1,
0.4557449, -0.3932677, 1.823413, 1, 1, 1, 1, 1,
0.4578812, 1.341655, -1.677344, 1, 1, 1, 1, 1,
0.4579041, 0.6076242, 0.675925, 1, 1, 1, 1, 1,
0.4623121, 0.6478077, 2.845742, 1, 1, 1, 1, 1,
0.4668748, -0.1333112, 2.588845, 0, 0, 1, 1, 1,
0.468603, -0.407249, 4.70002, 1, 0, 0, 1, 1,
0.4686486, 0.4744334, 0.2021993, 1, 0, 0, 1, 1,
0.4694987, -0.6072382, 2.966848, 1, 0, 0, 1, 1,
0.4741236, -0.5428453, 1.904961, 1, 0, 0, 1, 1,
0.4741666, -0.9823422, 2.515692, 1, 0, 0, 1, 1,
0.475722, 0.7987701, -0.007705401, 0, 0, 0, 1, 1,
0.475793, -0.2472634, 3.148755, 0, 0, 0, 1, 1,
0.4759618, -0.4614366, 3.556312, 0, 0, 0, 1, 1,
0.4763865, 1.098527, 0.0110147, 0, 0, 0, 1, 1,
0.4779713, -1.826459, 2.770195, 0, 0, 0, 1, 1,
0.4886877, -0.2093223, 2.736216, 0, 0, 0, 1, 1,
0.4889725, 0.3220881, 0.8669944, 0, 0, 0, 1, 1,
0.4983881, -1.624647, 4.010524, 1, 1, 1, 1, 1,
0.5035682, 0.004232883, 1.113909, 1, 1, 1, 1, 1,
0.5049464, 0.3865703, 1.750663, 1, 1, 1, 1, 1,
0.5058596, 0.6066344, 0.8175451, 1, 1, 1, 1, 1,
0.5101364, 0.6840129, 0.0003760938, 1, 1, 1, 1, 1,
0.5126368, 0.05929897, 2.638929, 1, 1, 1, 1, 1,
0.5136306, -0.3467484, 1.266408, 1, 1, 1, 1, 1,
0.5167992, 1.315991, 0.9983958, 1, 1, 1, 1, 1,
0.5227014, 1.51605, -1.670907, 1, 1, 1, 1, 1,
0.5235849, -1.265981, 3.743416, 1, 1, 1, 1, 1,
0.5278015, 2.703941, 0.5725544, 1, 1, 1, 1, 1,
0.5365085, -0.4822532, 2.150346, 1, 1, 1, 1, 1,
0.5367247, -1.466763, 3.327394, 1, 1, 1, 1, 1,
0.5387809, -0.08830738, 0.7219786, 1, 1, 1, 1, 1,
0.5404265, 1.107786, 1.217123, 1, 1, 1, 1, 1,
0.5466016, 0.1702653, -0.1256511, 0, 0, 1, 1, 1,
0.5495692, 0.02333607, 0.9717572, 1, 0, 0, 1, 1,
0.550828, 0.7950925, 1.712043, 1, 0, 0, 1, 1,
0.5535393, -0.1848328, 2.122723, 1, 0, 0, 1, 1,
0.5556396, 0.5824827, 0.1696854, 1, 0, 0, 1, 1,
0.5559562, 0.5564706, -0.5171057, 1, 0, 0, 1, 1,
0.5597754, 0.08598513, 1.052172, 0, 0, 0, 1, 1,
0.5615366, -1.144384, 3.068137, 0, 0, 0, 1, 1,
0.5625027, 0.07767302, 0.440289, 0, 0, 0, 1, 1,
0.5824785, 2.280562, -0.4195231, 0, 0, 0, 1, 1,
0.5834128, -0.4034324, 0.6162527, 0, 0, 0, 1, 1,
0.5869601, -1.129696, 2.33588, 0, 0, 0, 1, 1,
0.5874617, 1.94146, 0.04118554, 0, 0, 0, 1, 1,
0.5888935, -1.42477, 2.55771, 1, 1, 1, 1, 1,
0.5916653, 1.612508, -1.336004, 1, 1, 1, 1, 1,
0.5978975, -0.3822721, 3.281048, 1, 1, 1, 1, 1,
0.6014684, 0.9848048, 0.7056621, 1, 1, 1, 1, 1,
0.6016561, 0.2408798, 0.8964372, 1, 1, 1, 1, 1,
0.606156, -1.689125, 3.554268, 1, 1, 1, 1, 1,
0.6073843, -0.8875289, 3.28547, 1, 1, 1, 1, 1,
0.6106302, 1.489156, 0.02435354, 1, 1, 1, 1, 1,
0.6108943, -0.4660624, 4.407082, 1, 1, 1, 1, 1,
0.6118535, 1.998352, 0.6978101, 1, 1, 1, 1, 1,
0.6171082, 1.079442, 2.740467, 1, 1, 1, 1, 1,
0.6184669, 1.598757, 0.1940504, 1, 1, 1, 1, 1,
0.6190608, 0.4685687, 2.523872, 1, 1, 1, 1, 1,
0.6226724, -1.371879, 2.736566, 1, 1, 1, 1, 1,
0.6240582, 1.668509, 0.5732368, 1, 1, 1, 1, 1,
0.6251128, -0.3918673, 1.466632, 0, 0, 1, 1, 1,
0.6268786, -0.6134362, 2.974525, 1, 0, 0, 1, 1,
0.6285182, -0.3341573, 2.734389, 1, 0, 0, 1, 1,
0.6350496, -0.5368163, 2.579091, 1, 0, 0, 1, 1,
0.6452288, 0.06664883, -1.010465, 1, 0, 0, 1, 1,
0.6514769, 2.041086, 0.8046561, 1, 0, 0, 1, 1,
0.6525658, -1.742601, 4.135135, 0, 0, 0, 1, 1,
0.6540813, 0.5793921, 1.828743, 0, 0, 0, 1, 1,
0.6545025, -0.3798138, 2.817737, 0, 0, 0, 1, 1,
0.6563113, -0.770383, 2.564526, 0, 0, 0, 1, 1,
0.6575492, -0.681363, 3.128222, 0, 0, 0, 1, 1,
0.6586825, -0.6992578, 1.226482, 0, 0, 0, 1, 1,
0.6616288, 0.5018993, 0.379578, 0, 0, 0, 1, 1,
0.6649835, -2.36186, 2.61222, 1, 1, 1, 1, 1,
0.6699801, 0.4358935, 0.242168, 1, 1, 1, 1, 1,
0.6762223, -0.3762897, 3.153884, 1, 1, 1, 1, 1,
0.6781225, 0.3367487, -0.05752955, 1, 1, 1, 1, 1,
0.6832741, -0.4492875, 3.510489, 1, 1, 1, 1, 1,
0.6872756, 1.069609, 0.4020277, 1, 1, 1, 1, 1,
0.6903564, -1.320082, 1.914075, 1, 1, 1, 1, 1,
0.6949872, -0.2052168, 1.36564, 1, 1, 1, 1, 1,
0.6972041, -0.2929621, 2.291451, 1, 1, 1, 1, 1,
0.7005579, -1.090217, 2.01253, 1, 1, 1, 1, 1,
0.7045463, -0.6029726, 2.426516, 1, 1, 1, 1, 1,
0.7051744, 0.6792715, 0.09693645, 1, 1, 1, 1, 1,
0.7066947, -0.4383545, 3.359184, 1, 1, 1, 1, 1,
0.7072157, -0.1525068, 2.755076, 1, 1, 1, 1, 1,
0.707371, -0.9163221, 2.315467, 1, 1, 1, 1, 1,
0.7137769, 0.01381583, 0.8125767, 0, 0, 1, 1, 1,
0.7140669, 0.9178531, 0.9734772, 1, 0, 0, 1, 1,
0.7231001, 1.357161, -0.6128898, 1, 0, 0, 1, 1,
0.7293113, 0.1785986, 2.491652, 1, 0, 0, 1, 1,
0.7463667, -0.2928548, 2.216763, 1, 0, 0, 1, 1,
0.7483463, -0.1721327, 0.04943499, 1, 0, 0, 1, 1,
0.7609349, -1.623388, 2.183686, 0, 0, 0, 1, 1,
0.7618369, 0.5213912, 0.9174584, 0, 0, 0, 1, 1,
0.7632951, -0.5352936, 2.527924, 0, 0, 0, 1, 1,
0.7720796, 0.6006631, 0.8916035, 0, 0, 0, 1, 1,
0.7736403, 0.450308, 0.6619304, 0, 0, 0, 1, 1,
0.7738554, -1.683651, 3.391109, 0, 0, 0, 1, 1,
0.7839224, 0.3302145, 1.047013, 0, 0, 0, 1, 1,
0.7870857, 0.4327056, 2.668303, 1, 1, 1, 1, 1,
0.7886809, -0.1600341, 3.174776, 1, 1, 1, 1, 1,
0.7949536, -0.2650767, 3.351951, 1, 1, 1, 1, 1,
0.7976533, -0.9951358, 3.546525, 1, 1, 1, 1, 1,
0.8000505, -0.6083952, 1.902879, 1, 1, 1, 1, 1,
0.8042662, -0.5560185, 3.978331, 1, 1, 1, 1, 1,
0.8071751, 1.787918, 0.3267949, 1, 1, 1, 1, 1,
0.807812, -0.9132797, 3.129244, 1, 1, 1, 1, 1,
0.8103715, -0.5592368, 3.581178, 1, 1, 1, 1, 1,
0.810714, 0.7142067, 0.2472416, 1, 1, 1, 1, 1,
0.8118204, 0.4194906, 2.562587, 1, 1, 1, 1, 1,
0.8142005, -0.9939834, 2.223413, 1, 1, 1, 1, 1,
0.824914, -0.8314315, 2.090486, 1, 1, 1, 1, 1,
0.826597, 1.442102, -0.3193508, 1, 1, 1, 1, 1,
0.8300407, -1.792936, 4.915767, 1, 1, 1, 1, 1,
0.8322781, 0.4872606, 0.8357508, 0, 0, 1, 1, 1,
0.8367075, -1.650708, 4.040229, 1, 0, 0, 1, 1,
0.8375408, 0.5101123, 1.585292, 1, 0, 0, 1, 1,
0.8407895, -0.9400094, 2.744242, 1, 0, 0, 1, 1,
0.8413969, 0.8555222, -0.06048263, 1, 0, 0, 1, 1,
0.8449372, -1.6535, 2.578542, 1, 0, 0, 1, 1,
0.8497369, 0.5633554, -0.1384601, 0, 0, 0, 1, 1,
0.8568544, -1.575999, 3.037905, 0, 0, 0, 1, 1,
0.8585694, 1.469632, -1.762076, 0, 0, 0, 1, 1,
0.8586276, 0.01770839, 4.213765, 0, 0, 0, 1, 1,
0.8590641, -1.894848, 2.268657, 0, 0, 0, 1, 1,
0.8590845, 0.1267549, 0.9904683, 0, 0, 0, 1, 1,
0.8600322, -0.2216237, 3.671366, 0, 0, 0, 1, 1,
0.8646553, 0.3851351, 1.145287, 1, 1, 1, 1, 1,
0.8678088, -0.5280619, 2.543365, 1, 1, 1, 1, 1,
0.8722445, -0.4825678, 1.742356, 1, 1, 1, 1, 1,
0.8759854, 0.001942256, 1.256515, 1, 1, 1, 1, 1,
0.8786752, -0.5049123, 2.88624, 1, 1, 1, 1, 1,
0.8874724, 2.094733, -0.4972732, 1, 1, 1, 1, 1,
0.8895689, 0.2521654, 1.196981, 1, 1, 1, 1, 1,
0.8901326, -0.3927017, 2.482218, 1, 1, 1, 1, 1,
0.8906289, 2.079482, -0.4137839, 1, 1, 1, 1, 1,
0.8954012, 0.1481144, 1.904023, 1, 1, 1, 1, 1,
0.8988991, -0.495558, 3.31055, 1, 1, 1, 1, 1,
0.8999328, -0.6691232, 3.56744, 1, 1, 1, 1, 1,
0.9035516, -1.097982, 1.967803, 1, 1, 1, 1, 1,
0.9049641, -0.6229421, 3.418318, 1, 1, 1, 1, 1,
0.9241371, 0.899645, 1.767669, 1, 1, 1, 1, 1,
0.92505, 1.371833, -1.685893, 0, 0, 1, 1, 1,
0.9289556, 0.6952338, 1.008053, 1, 0, 0, 1, 1,
0.9297812, 0.9637768, 0.2654562, 1, 0, 0, 1, 1,
0.9315423, -1.340478, 1.747287, 1, 0, 0, 1, 1,
0.9318416, 0.5322847, 2.181653, 1, 0, 0, 1, 1,
0.9326047, -0.1885326, 1.423722, 1, 0, 0, 1, 1,
0.9438139, 0.4230583, 0.8471233, 0, 0, 0, 1, 1,
0.9483362, 1.626627, 0.949629, 0, 0, 0, 1, 1,
0.9551576, 1.339558, 2.514326, 0, 0, 0, 1, 1,
0.9567726, -1.93569, 3.80137, 0, 0, 0, 1, 1,
0.9590769, 3.371654, 1.063372, 0, 0, 0, 1, 1,
0.9603132, 1.282253, 0.4368674, 0, 0, 0, 1, 1,
0.9610031, -0.2879341, 0.7727048, 0, 0, 0, 1, 1,
0.9622576, 1.273212, -0.9264892, 1, 1, 1, 1, 1,
0.9642733, 0.3427533, 1.747866, 1, 1, 1, 1, 1,
0.9691283, -0.4346273, 2.207138, 1, 1, 1, 1, 1,
0.9820227, 0.9910784, 0.02006653, 1, 1, 1, 1, 1,
0.9822345, 0.9989462, 2.809159, 1, 1, 1, 1, 1,
0.9852666, -0.9234059, 1.576283, 1, 1, 1, 1, 1,
0.9936404, -0.1225802, 1.891453, 1, 1, 1, 1, 1,
0.9936762, -1.626345, 2.770403, 1, 1, 1, 1, 1,
0.9959438, -1.238582, 1.843168, 1, 1, 1, 1, 1,
0.9976331, 0.1057031, 0.1787275, 1, 1, 1, 1, 1,
0.9979465, 0.03516486, 3.209054, 1, 1, 1, 1, 1,
1.004637, -1.442559, 2.966559, 1, 1, 1, 1, 1,
1.010338, -1.840664, 2.393819, 1, 1, 1, 1, 1,
1.010362, -1.281048, 1.752762, 1, 1, 1, 1, 1,
1.012546, -0.4080955, 1.160099, 1, 1, 1, 1, 1,
1.014421, 0.1133146, 0.9740951, 0, 0, 1, 1, 1,
1.014725, 0.3519016, 0.4875548, 1, 0, 0, 1, 1,
1.015914, -0.1526522, 2.501098, 1, 0, 0, 1, 1,
1.021076, -0.8971152, 2.440838, 1, 0, 0, 1, 1,
1.025975, -0.3527405, 0.6587669, 1, 0, 0, 1, 1,
1.037297, -0.1566761, 1.430862, 1, 0, 0, 1, 1,
1.037809, 0.3685265, 1.442449, 0, 0, 0, 1, 1,
1.042083, -0.5621678, 1.891801, 0, 0, 0, 1, 1,
1.044804, -1.253837, 3.517148, 0, 0, 0, 1, 1,
1.052819, -1.491786, 4.244453, 0, 0, 0, 1, 1,
1.060701, 0.1858753, 3.715775, 0, 0, 0, 1, 1,
1.060865, -1.859064, 3.150017, 0, 0, 0, 1, 1,
1.062014, 0.2407195, 0.4326942, 0, 0, 0, 1, 1,
1.062758, -1.324295, 2.369888, 1, 1, 1, 1, 1,
1.064304, -0.4589986, 2.985043, 1, 1, 1, 1, 1,
1.078463, -3.476528, 2.68309, 1, 1, 1, 1, 1,
1.079343, 1.192184, -0.6397336, 1, 1, 1, 1, 1,
1.086337, 0.3572906, 1.96129, 1, 1, 1, 1, 1,
1.089219, -0.434137, 2.469204, 1, 1, 1, 1, 1,
1.110154, 0.5622466, 0.6045639, 1, 1, 1, 1, 1,
1.113378, 0.6320118, 1.882691, 1, 1, 1, 1, 1,
1.118125, -2.185551, 2.900951, 1, 1, 1, 1, 1,
1.118776, -0.5386667, 2.907979, 1, 1, 1, 1, 1,
1.12861, 0.6205512, 0.817303, 1, 1, 1, 1, 1,
1.133374, 0.6654935, 1.376055, 1, 1, 1, 1, 1,
1.142126, 0.5911651, 1.113536, 1, 1, 1, 1, 1,
1.143196, -1.554896, 2.275535, 1, 1, 1, 1, 1,
1.161108, -0.09409831, 1.603332, 1, 1, 1, 1, 1,
1.164746, -0.7885888, 2.071176, 0, 0, 1, 1, 1,
1.167643, 0.23763, 0.8987741, 1, 0, 0, 1, 1,
1.174798, -0.3688007, 2.359513, 1, 0, 0, 1, 1,
1.176982, 0.3528267, 1.284593, 1, 0, 0, 1, 1,
1.180725, 0.2093639, 2.100782, 1, 0, 0, 1, 1,
1.184171, -0.9333713, 1.276023, 1, 0, 0, 1, 1,
1.185157, 0.2520402, 2.440448, 0, 0, 0, 1, 1,
1.190129, 0.5371519, 0.07188993, 0, 0, 0, 1, 1,
1.192368, -0.6043386, 3.503854, 0, 0, 0, 1, 1,
1.194754, -1.65843, 3.645756, 0, 0, 0, 1, 1,
1.196042, -1.464599, 3.176439, 0, 0, 0, 1, 1,
1.196581, -1.37808, 2.436092, 0, 0, 0, 1, 1,
1.199274, -0.6865392, 2.129588, 0, 0, 0, 1, 1,
1.201817, -0.387333, 0.05159955, 1, 1, 1, 1, 1,
1.204008, -0.3743807, 2.133682, 1, 1, 1, 1, 1,
1.206967, 0.148534, 2.617183, 1, 1, 1, 1, 1,
1.220659, -0.7565352, 2.485834, 1, 1, 1, 1, 1,
1.224203, -0.6836923, 1.658393, 1, 1, 1, 1, 1,
1.224839, 1.0029, 0.8238326, 1, 1, 1, 1, 1,
1.225196, 0.5181233, 0.1739064, 1, 1, 1, 1, 1,
1.228903, 0.1034455, 0.1696771, 1, 1, 1, 1, 1,
1.231242, 0.5852638, -0.7544688, 1, 1, 1, 1, 1,
1.242046, 0.2786821, -0.2602976, 1, 1, 1, 1, 1,
1.242114, -0.6343795, 3.31593, 1, 1, 1, 1, 1,
1.245847, -1.000497, 2.452347, 1, 1, 1, 1, 1,
1.267187, -0.6871914, 2.208563, 1, 1, 1, 1, 1,
1.279531, 0.6909178, 0.2143961, 1, 1, 1, 1, 1,
1.280884, 1.578774, 0.1933956, 1, 1, 1, 1, 1,
1.287564, 1.692608, 0.5085738, 0, 0, 1, 1, 1,
1.289351, -0.1478419, 1.54927, 1, 0, 0, 1, 1,
1.299256, 0.6614785, -0.04392581, 1, 0, 0, 1, 1,
1.306305, -2.538376, 2.168022, 1, 0, 0, 1, 1,
1.312106, 0.3880013, 1.746357, 1, 0, 0, 1, 1,
1.340461, -0.554766, 2.769332, 1, 0, 0, 1, 1,
1.351437, -0.6290546, 1.103046, 0, 0, 0, 1, 1,
1.351518, 0.07758782, 0.8683683, 0, 0, 0, 1, 1,
1.35484, 0.8678968, 0.2559906, 0, 0, 0, 1, 1,
1.355225, -0.8189664, 1.03832, 0, 0, 0, 1, 1,
1.365239, -0.6497645, 1.009474, 0, 0, 0, 1, 1,
1.368633, -1.024158, 2.271923, 0, 0, 0, 1, 1,
1.369505, 1.036476, 0.03755055, 0, 0, 0, 1, 1,
1.374652, -3.321904, 2.941384, 1, 1, 1, 1, 1,
1.378232, 0.4075699, 1.443073, 1, 1, 1, 1, 1,
1.388054, -0.1614148, 2.260957, 1, 1, 1, 1, 1,
1.390383, 1.192358, 1.027894, 1, 1, 1, 1, 1,
1.397729, -1.419337, 2.790461, 1, 1, 1, 1, 1,
1.398886, 0.5891497, 1.665584, 1, 1, 1, 1, 1,
1.402403, 0.3666292, 2.402636, 1, 1, 1, 1, 1,
1.402916, 0.7494555, 1.121451, 1, 1, 1, 1, 1,
1.433199, -0.6823564, -0.2482934, 1, 1, 1, 1, 1,
1.435368, 0.09037412, 2.347901, 1, 1, 1, 1, 1,
1.437294, -0.7697926, 1.878151, 1, 1, 1, 1, 1,
1.454632, 1.234743, 1.190776, 1, 1, 1, 1, 1,
1.477221, 1.709962, 0.4485282, 1, 1, 1, 1, 1,
1.477782, 1.053249, 1.067282, 1, 1, 1, 1, 1,
1.480278, -2.136416, 2.73011, 1, 1, 1, 1, 1,
1.484959, -0.6673806, 2.773788, 0, 0, 1, 1, 1,
1.492484, 0.4173416, 0.975938, 1, 0, 0, 1, 1,
1.497456, -0.2282863, 0.6846686, 1, 0, 0, 1, 1,
1.497966, -0.296118, 3.841968, 1, 0, 0, 1, 1,
1.500039, -0.3001201, 3.524403, 1, 0, 0, 1, 1,
1.502272, -0.1021138, -0.6808894, 1, 0, 0, 1, 1,
1.503282, 1.03511, 1.653012, 0, 0, 0, 1, 1,
1.526786, -0.8695486, 1.624981, 0, 0, 0, 1, 1,
1.532773, 0.2510956, 2.861146, 0, 0, 0, 1, 1,
1.535601, -0.2431337, 1.473805, 0, 0, 0, 1, 1,
1.536427, -1.783641, 1.364781, 0, 0, 0, 1, 1,
1.540893, 0.1068112, 3.021388, 0, 0, 0, 1, 1,
1.546654, -0.1252119, 1.369293, 0, 0, 0, 1, 1,
1.55307, 0.6568814, 2.313824, 1, 1, 1, 1, 1,
1.555737, 2.328157, 3.643388, 1, 1, 1, 1, 1,
1.556491, -1.707856, 1.230169, 1, 1, 1, 1, 1,
1.559128, -1.583459, 2.330771, 1, 1, 1, 1, 1,
1.573768, 0.8143042, 1.838922, 1, 1, 1, 1, 1,
1.575808, 1.224371, 0.325479, 1, 1, 1, 1, 1,
1.576106, -0.2074623, 1.478424, 1, 1, 1, 1, 1,
1.598286, 1.770432, 0.2186453, 1, 1, 1, 1, 1,
1.599692, 0.02430111, 0.9865271, 1, 1, 1, 1, 1,
1.601515, -0.1281262, 2.834185, 1, 1, 1, 1, 1,
1.603869, 0.1343837, 1.018368, 1, 1, 1, 1, 1,
1.621272, 0.7230264, 1.565238, 1, 1, 1, 1, 1,
1.621431, -0.2531284, 3.579612, 1, 1, 1, 1, 1,
1.63596, 0.2751456, 0.8803267, 1, 1, 1, 1, 1,
1.641714, -1.303496, 3.197615, 1, 1, 1, 1, 1,
1.65015, 2.374605, -0.4278675, 0, 0, 1, 1, 1,
1.680348, -0.004682964, 0.2646625, 1, 0, 0, 1, 1,
1.698592, 0.4105733, 0.2352376, 1, 0, 0, 1, 1,
1.719782, 1.893074, 1.272702, 1, 0, 0, 1, 1,
1.725846, 0.5935873, 1.670188, 1, 0, 0, 1, 1,
1.72809, -1.438287, 1.781605, 1, 0, 0, 1, 1,
1.729586, -0.3151467, 0.3307271, 0, 0, 0, 1, 1,
1.731959, 1.453098, 0.8016419, 0, 0, 0, 1, 1,
1.741078, 0.860092, 1.033523, 0, 0, 0, 1, 1,
1.748827, -1.954503, 3.444217, 0, 0, 0, 1, 1,
1.791847, 0.9920409, 1.764266, 0, 0, 0, 1, 1,
1.7923, -0.03188781, 2.784381, 0, 0, 0, 1, 1,
1.812177, 0.3444313, 0.69583, 0, 0, 0, 1, 1,
1.814046, -0.735787, 3.626511, 1, 1, 1, 1, 1,
1.821817, -1.818128, 3.758255, 1, 1, 1, 1, 1,
1.823942, 1.069405, -1.117051, 1, 1, 1, 1, 1,
1.828733, -0.2922064, 1.380798, 1, 1, 1, 1, 1,
1.846935, -1.137465, 1.93054, 1, 1, 1, 1, 1,
1.847592, 1.336473, 0.1759947, 1, 1, 1, 1, 1,
1.938597, 0.9146575, 2.938069, 1, 1, 1, 1, 1,
1.951843, -0.7238322, 2.631931, 1, 1, 1, 1, 1,
1.963715, 0.1401078, 1.943575, 1, 1, 1, 1, 1,
1.969356, -0.3500489, 2.118973, 1, 1, 1, 1, 1,
1.993872, 1.279953, 0.6596287, 1, 1, 1, 1, 1,
2.000608, -0.4966154, 0.6697201, 1, 1, 1, 1, 1,
2.015488, 1.582894, 1.55903, 1, 1, 1, 1, 1,
2.047932, -0.9015851, 0.1208161, 1, 1, 1, 1, 1,
2.119554, -0.2379049, 2.620158, 1, 1, 1, 1, 1,
2.1232, 0.7937694, 1.869738, 0, 0, 1, 1, 1,
2.130474, -0.4980371, 2.445564, 1, 0, 0, 1, 1,
2.131279, 0.07869404, 2.116663, 1, 0, 0, 1, 1,
2.161556, 0.07431526, 0.3343523, 1, 0, 0, 1, 1,
2.161867, -1.441996, 1.263201, 1, 0, 0, 1, 1,
2.192157, -2.234144, 2.857441, 1, 0, 0, 1, 1,
2.245835, 0.5853115, 2.004322, 0, 0, 0, 1, 1,
2.262967, 1.064512, 1.064509, 0, 0, 0, 1, 1,
2.309351, -0.2512177, 1.493212, 0, 0, 0, 1, 1,
2.354371, 0.4917288, 0.4865635, 0, 0, 0, 1, 1,
2.355349, 2.329344, -0.2541036, 0, 0, 0, 1, 1,
2.379359, -1.116569, 1.9363, 0, 0, 0, 1, 1,
2.40685, -0.6779712, 0.7246491, 0, 0, 0, 1, 1,
2.415251, -0.5935522, 1.474347, 1, 1, 1, 1, 1,
2.415631, -1.058922, 2.107751, 1, 1, 1, 1, 1,
2.476168, 0.963906, 1.34796, 1, 1, 1, 1, 1,
2.555923, 1.302456, 1.202149, 1, 1, 1, 1, 1,
2.606346, -0.1856959, 1.10601, 1, 1, 1, 1, 1,
2.608813, 0.4622038, 2.275397, 1, 1, 1, 1, 1,
2.698974, 0.5968359, 2.03131, 1, 1, 1, 1, 1
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
var radius = 9.663281;
var distance = 33.94187;
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
mvMatrix.translate( 0.1208497, 0.09617162, -0.2389536 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94187);
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
