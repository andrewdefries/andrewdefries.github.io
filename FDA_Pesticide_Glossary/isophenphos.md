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
-2.960406, 0.001413976, -2.234268, 1, 0, 0, 1,
-2.835207, -0.3537216, -3.327336, 1, 0.007843138, 0, 1,
-2.630821, 2.128275, -0.09947402, 1, 0.01176471, 0, 1,
-2.610376, 0.8500338, -0.9881256, 1, 0.01960784, 0, 1,
-2.577567, -0.04895355, -1.071459, 1, 0.02352941, 0, 1,
-2.421433, -0.487857, -2.940193, 1, 0.03137255, 0, 1,
-2.3764, 0.005510407, -0.7597691, 1, 0.03529412, 0, 1,
-2.342255, 0.6115914, -1.302218, 1, 0.04313726, 0, 1,
-2.324646, -1.891593, -3.151066, 1, 0.04705882, 0, 1,
-2.156781, -0.6893907, -2.969651, 1, 0.05490196, 0, 1,
-2.137486, 2.051839, -0.369206, 1, 0.05882353, 0, 1,
-2.099171, 0.5364875, -2.026497, 1, 0.06666667, 0, 1,
-2.093943, 0.6575708, -0.9678507, 1, 0.07058824, 0, 1,
-2.081131, -0.1875505, -0.3515153, 1, 0.07843138, 0, 1,
-2.048211, 0.1472376, -0.8589912, 1, 0.08235294, 0, 1,
-2.040931, -1.017622, -0.7963685, 1, 0.09019608, 0, 1,
-1.995316, -2.448602, -1.496265, 1, 0.09411765, 0, 1,
-1.974385, 0.6250522, -0.4269043, 1, 0.1019608, 0, 1,
-1.972644, 0.4823373, -2.194433, 1, 0.1098039, 0, 1,
-1.968934, -0.5435264, -2.061645, 1, 0.1137255, 0, 1,
-1.968016, 0.7208518, -0.2152316, 1, 0.1215686, 0, 1,
-1.936739, 0.05853625, -1.702692, 1, 0.1254902, 0, 1,
-1.92361, 1.034773, 0.2979714, 1, 0.1333333, 0, 1,
-1.903827, 0.6699613, -1.363764, 1, 0.1372549, 0, 1,
-1.899777, -0.8762025, -2.524829, 1, 0.145098, 0, 1,
-1.893491, -0.2213666, -1.71976, 1, 0.1490196, 0, 1,
-1.890508, 1.881901, -1.805751, 1, 0.1568628, 0, 1,
-1.8783, -0.4990348, -3.662231, 1, 0.1607843, 0, 1,
-1.864169, -1.471222, -1.061919, 1, 0.1686275, 0, 1,
-1.858207, 0.433151, -0.533709, 1, 0.172549, 0, 1,
-1.856158, -0.04318879, -1.005262, 1, 0.1803922, 0, 1,
-1.844122, -0.438647, -2.796227, 1, 0.1843137, 0, 1,
-1.840551, 0.07205634, -2.040014, 1, 0.1921569, 0, 1,
-1.823813, 0.1996772, -2.000519, 1, 0.1960784, 0, 1,
-1.818992, 0.7675065, -2.592071, 1, 0.2039216, 0, 1,
-1.808777, 0.9353544, 0.3145274, 1, 0.2117647, 0, 1,
-1.800845, -1.076477, 0.9000548, 1, 0.2156863, 0, 1,
-1.774737, 0.2946221, -1.05601, 1, 0.2235294, 0, 1,
-1.766227, -0.4930235, -3.09879, 1, 0.227451, 0, 1,
-1.738532, 0.1619489, -0.3619249, 1, 0.2352941, 0, 1,
-1.731346, 1.50215, -0.535018, 1, 0.2392157, 0, 1,
-1.728773, 0.7365582, -1.593133, 1, 0.2470588, 0, 1,
-1.726064, -0.6160679, -2.249416, 1, 0.2509804, 0, 1,
-1.713276, -0.8425362, -3.03997, 1, 0.2588235, 0, 1,
-1.708616, -2.044638, -2.484243, 1, 0.2627451, 0, 1,
-1.702616, 0.7217653, -0.5424199, 1, 0.2705882, 0, 1,
-1.696092, -0.8231911, -2.310413, 1, 0.2745098, 0, 1,
-1.688653, 0.8628698, -0.0569985, 1, 0.282353, 0, 1,
-1.670935, 0.3399745, -0.4009515, 1, 0.2862745, 0, 1,
-1.67046, 1.178943, -2.240228, 1, 0.2941177, 0, 1,
-1.656047, -1.327863, -2.095582, 1, 0.3019608, 0, 1,
-1.651882, 0.1889755, -2.282917, 1, 0.3058824, 0, 1,
-1.646184, -2.283556, -3.066064, 1, 0.3137255, 0, 1,
-1.630748, -2.734727, -3.338675, 1, 0.3176471, 0, 1,
-1.627751, -0.1647882, -3.130584, 1, 0.3254902, 0, 1,
-1.620723, -2.160037, -1.371038, 1, 0.3294118, 0, 1,
-1.608074, 0.6319978, -1.82683, 1, 0.3372549, 0, 1,
-1.582422, 1.696436, -1.440759, 1, 0.3411765, 0, 1,
-1.578773, 0.9810089, 0.2067267, 1, 0.3490196, 0, 1,
-1.572298, 0.8128871, -2.10272, 1, 0.3529412, 0, 1,
-1.564909, 1.060887, 0.2590393, 1, 0.3607843, 0, 1,
-1.56197, -0.4713725, -0.9888965, 1, 0.3647059, 0, 1,
-1.553921, 0.8625549, 1.46752, 1, 0.372549, 0, 1,
-1.547838, -1.257509, -0.6809659, 1, 0.3764706, 0, 1,
-1.528443, 1.616019, -0.5332895, 1, 0.3843137, 0, 1,
-1.524339, -1.77633, -4.303034, 1, 0.3882353, 0, 1,
-1.519156, -1.752724, -2.077669, 1, 0.3960784, 0, 1,
-1.503729, 1.779572, 0.1760603, 1, 0.4039216, 0, 1,
-1.492007, 0.06024101, -2.429981, 1, 0.4078431, 0, 1,
-1.483621, -0.8032144, -0.6052203, 1, 0.4156863, 0, 1,
-1.477158, 1.900035, 0.2230125, 1, 0.4196078, 0, 1,
-1.465893, 0.4048522, -0.9419546, 1, 0.427451, 0, 1,
-1.430687, -1.13841, -3.303216, 1, 0.4313726, 0, 1,
-1.429837, -0.2263198, -2.971482, 1, 0.4392157, 0, 1,
-1.429086, -0.7239679, -1.132701, 1, 0.4431373, 0, 1,
-1.426513, 0.4541594, -0.6143391, 1, 0.4509804, 0, 1,
-1.405386, -0.5476257, -2.506608, 1, 0.454902, 0, 1,
-1.405339, 0.9927453, 0.6347221, 1, 0.4627451, 0, 1,
-1.395227, -0.4793318, 0.01179006, 1, 0.4666667, 0, 1,
-1.376108, 1.741465, -0.1362507, 1, 0.4745098, 0, 1,
-1.369913, 0.008382972, -1.098627, 1, 0.4784314, 0, 1,
-1.36927, 0.5358091, -0.416147, 1, 0.4862745, 0, 1,
-1.362507, 0.4523674, 1.347422, 1, 0.4901961, 0, 1,
-1.353372, -0.1190563, -0.4799349, 1, 0.4980392, 0, 1,
-1.352117, 0.8036402, -1.672285, 1, 0.5058824, 0, 1,
-1.345698, -0.3625978, -2.612389, 1, 0.509804, 0, 1,
-1.344801, 0.2360811, -2.290217, 1, 0.5176471, 0, 1,
-1.304995, 0.2122316, -0.372764, 1, 0.5215687, 0, 1,
-1.291568, -0.8762229, -1.610147, 1, 0.5294118, 0, 1,
-1.284685, -0.1242389, -1.724113, 1, 0.5333334, 0, 1,
-1.283167, 0.5907991, -1.248277, 1, 0.5411765, 0, 1,
-1.282214, -1.244946, -2.005908, 1, 0.5450981, 0, 1,
-1.280745, 1.564095, -0.7317064, 1, 0.5529412, 0, 1,
-1.268701, 1.741778, -0.08045107, 1, 0.5568628, 0, 1,
-1.267817, 0.1260022, -1.173007, 1, 0.5647059, 0, 1,
-1.265324, 1.435989, -0.8089808, 1, 0.5686275, 0, 1,
-1.262968, 0.2608223, -2.30584, 1, 0.5764706, 0, 1,
-1.260041, 1.371008, -0.3592676, 1, 0.5803922, 0, 1,
-1.259587, -0.2614123, -1.860232, 1, 0.5882353, 0, 1,
-1.258076, 1.909321, -1.036113, 1, 0.5921569, 0, 1,
-1.252842, -0.7695289, -1.5671, 1, 0.6, 0, 1,
-1.251708, 0.4502836, -0.4784231, 1, 0.6078432, 0, 1,
-1.245142, 0.5195726, 0.7809079, 1, 0.6117647, 0, 1,
-1.239346, 0.2875228, -2.350505, 1, 0.6196079, 0, 1,
-1.235958, 1.330629, 0.3294894, 1, 0.6235294, 0, 1,
-1.230635, -0.8738195, -1.621325, 1, 0.6313726, 0, 1,
-1.22612, -0.4759202, -3.711994, 1, 0.6352941, 0, 1,
-1.225515, -0.126653, -1.760003, 1, 0.6431373, 0, 1,
-1.218949, 0.7048197, -0.9791473, 1, 0.6470588, 0, 1,
-1.215812, -1.544745, -0.5969459, 1, 0.654902, 0, 1,
-1.208622, -0.5044709, -1.975207, 1, 0.6588235, 0, 1,
-1.207565, 0.4674115, -1.57034, 1, 0.6666667, 0, 1,
-1.203502, -0.6712664, -1.367668, 1, 0.6705883, 0, 1,
-1.195841, 0.9562498, -1.719305, 1, 0.6784314, 0, 1,
-1.191883, -0.6643575, -1.759692, 1, 0.682353, 0, 1,
-1.184039, 0.5194462, -2.61484, 1, 0.6901961, 0, 1,
-1.176309, 1.750339, -1.393629, 1, 0.6941177, 0, 1,
-1.162459, -2.238017, -2.64536, 1, 0.7019608, 0, 1,
-1.148083, 0.7400334, -1.433127, 1, 0.7098039, 0, 1,
-1.142927, 1.684712, -0.9403723, 1, 0.7137255, 0, 1,
-1.138292, 2.32899, 0.7075667, 1, 0.7215686, 0, 1,
-1.130421, 3.519955, -0.227244, 1, 0.7254902, 0, 1,
-1.113442, -0.0331024, -2.493213, 1, 0.7333333, 0, 1,
-1.113274, -1.062428, -1.364395, 1, 0.7372549, 0, 1,
-1.109878, -1.129618, -2.667496, 1, 0.7450981, 0, 1,
-1.108027, 0.03482826, -1.776422, 1, 0.7490196, 0, 1,
-1.107915, -0.6814916, -1.470981, 1, 0.7568628, 0, 1,
-1.103649, -1.169676, -1.295519, 1, 0.7607843, 0, 1,
-1.103211, -0.1363045, -1.070029, 1, 0.7686275, 0, 1,
-1.093517, -0.02813906, -1.250836, 1, 0.772549, 0, 1,
-1.090608, -0.4579251, -0.9581638, 1, 0.7803922, 0, 1,
-1.088221, 0.2697164, -2.812747, 1, 0.7843137, 0, 1,
-1.084292, -1.096703, -0.9357024, 1, 0.7921569, 0, 1,
-1.078624, -0.2552316, -0.1520243, 1, 0.7960784, 0, 1,
-1.078447, 1.188943, 0.2406041, 1, 0.8039216, 0, 1,
-1.071927, -0.5584819, -1.594544, 1, 0.8117647, 0, 1,
-1.069854, -0.9984565, -3.130022, 1, 0.8156863, 0, 1,
-1.067553, -0.4626546, -3.42544, 1, 0.8235294, 0, 1,
-1.066787, -0.1502692, -0.1708152, 1, 0.827451, 0, 1,
-1.062316, -0.4421337, -2.04762, 1, 0.8352941, 0, 1,
-1.054371, 0.9936201, -2.578028, 1, 0.8392157, 0, 1,
-1.05108, 0.3371196, -1.153057, 1, 0.8470588, 0, 1,
-1.044276, 0.467932, -1.656019, 1, 0.8509804, 0, 1,
-1.042676, -0.09248506, -1.362571, 1, 0.8588235, 0, 1,
-1.036016, 0.9831293, -1.877838, 1, 0.8627451, 0, 1,
-1.035177, 0.3485137, -1.722728, 1, 0.8705882, 0, 1,
-1.034639, -0.752211, -2.945562, 1, 0.8745098, 0, 1,
-1.028606, -1.139661, -1.956833, 1, 0.8823529, 0, 1,
-1.027417, -1.173942, -2.761842, 1, 0.8862745, 0, 1,
-1.025452, -1.580799, -3.623216, 1, 0.8941177, 0, 1,
-1.024372, -0.7447269, -1.889816, 1, 0.8980392, 0, 1,
-1.023804, 0.6642491, -0.7493704, 1, 0.9058824, 0, 1,
-1.022486, 1.257036, -0.6747083, 1, 0.9137255, 0, 1,
-1.018961, -1.040323, -4.018943, 1, 0.9176471, 0, 1,
-1.018594, -1.824859, -2.378414, 1, 0.9254902, 0, 1,
-1.008909, -0.3319682, -2.233685, 1, 0.9294118, 0, 1,
-1.008496, 0.2988591, -1.784955, 1, 0.9372549, 0, 1,
-1.007626, 1.776981, 0.8773972, 1, 0.9411765, 0, 1,
-1.001477, 2.367, -0.4067416, 1, 0.9490196, 0, 1,
-0.9993192, -0.3352909, -1.927068, 1, 0.9529412, 0, 1,
-0.9911557, -0.03003619, -2.466742, 1, 0.9607843, 0, 1,
-0.9797148, 0.3645757, -0.5249645, 1, 0.9647059, 0, 1,
-0.9685335, 1.437131, -0.5988525, 1, 0.972549, 0, 1,
-0.9646956, 0.4934763, -1.128054, 1, 0.9764706, 0, 1,
-0.964344, 1.415842, 0.9646102, 1, 0.9843137, 0, 1,
-0.9531005, 0.7884101, -1.558141, 1, 0.9882353, 0, 1,
-0.9518983, 0.8164999, -0.4013734, 1, 0.9960784, 0, 1,
-0.950627, -0.8896928, -3.181599, 0.9960784, 1, 0, 1,
-0.9498588, -1.742776, -1.810903, 0.9921569, 1, 0, 1,
-0.9467669, 1.336743, -0.459698, 0.9843137, 1, 0, 1,
-0.9452583, -0.04885283, -2.615657, 0.9803922, 1, 0, 1,
-0.9422991, -0.6193942, -1.369828, 0.972549, 1, 0, 1,
-0.9387006, 0.2389457, -1.11329, 0.9686275, 1, 0, 1,
-0.9374295, 0.4257843, -2.746131, 0.9607843, 1, 0, 1,
-0.9352114, -2.775305, -1.779337, 0.9568627, 1, 0, 1,
-0.9346986, -1.375381, -4.222813, 0.9490196, 1, 0, 1,
-0.9335912, 1.227749, -0.3890965, 0.945098, 1, 0, 1,
-0.928624, -0.03884999, 0.4067279, 0.9372549, 1, 0, 1,
-0.9274614, -0.8203323, -1.954963, 0.9333333, 1, 0, 1,
-0.9210798, 1.002263, -1.633065, 0.9254902, 1, 0, 1,
-0.9142342, -0.04845427, -1.036358, 0.9215686, 1, 0, 1,
-0.914004, -0.2563646, -0.4797257, 0.9137255, 1, 0, 1,
-0.9076483, 0.3734416, -2.386544, 0.9098039, 1, 0, 1,
-0.9076384, 0.3801911, -1.924341, 0.9019608, 1, 0, 1,
-0.8993512, -1.382139, -2.240971, 0.8941177, 1, 0, 1,
-0.8917952, -0.2715015, -2.941591, 0.8901961, 1, 0, 1,
-0.8908994, 0.582136, -2.100006, 0.8823529, 1, 0, 1,
-0.8905661, -0.07799621, -1.436527, 0.8784314, 1, 0, 1,
-0.8853362, 1.325332, 0.6159671, 0.8705882, 1, 0, 1,
-0.8847432, -1.572716, -3.493347, 0.8666667, 1, 0, 1,
-0.8817628, -1.319631, -2.611657, 0.8588235, 1, 0, 1,
-0.8811466, -1.87473, -1.857341, 0.854902, 1, 0, 1,
-0.8711073, -1.780292, -0.7912828, 0.8470588, 1, 0, 1,
-0.8700414, -0.4033791, -0.7575431, 0.8431373, 1, 0, 1,
-0.8687549, -0.2182623, -2.226907, 0.8352941, 1, 0, 1,
-0.8633414, 0.5265698, 0.9195331, 0.8313726, 1, 0, 1,
-0.8621562, 0.680103, -0.8745763, 0.8235294, 1, 0, 1,
-0.8590468, -0.5205181, -2.196991, 0.8196079, 1, 0, 1,
-0.8573952, 2.082848, -0.3467558, 0.8117647, 1, 0, 1,
-0.855325, -1.08384, -2.154648, 0.8078431, 1, 0, 1,
-0.8541273, 0.306448, -2.264983, 0.8, 1, 0, 1,
-0.8520083, -0.7070617, -1.663252, 0.7921569, 1, 0, 1,
-0.8505726, 1.173666, -1.568234, 0.7882353, 1, 0, 1,
-0.8497744, 0.2593417, -2.936083, 0.7803922, 1, 0, 1,
-0.8458215, -0.6929511, -1.676564, 0.7764706, 1, 0, 1,
-0.8426799, -0.5873585, -3.606376, 0.7686275, 1, 0, 1,
-0.8416865, 1.378048, -0.5672264, 0.7647059, 1, 0, 1,
-0.8408231, -0.1792734, -0.1810814, 0.7568628, 1, 0, 1,
-0.8313816, 0.33865, 0.2919915, 0.7529412, 1, 0, 1,
-0.828822, -1.637982, -0.6690792, 0.7450981, 1, 0, 1,
-0.8273719, 0.9781987, -0.8169121, 0.7411765, 1, 0, 1,
-0.8181333, -2.874534, -1.323368, 0.7333333, 1, 0, 1,
-0.8174087, -0.4143554, -0.8730288, 0.7294118, 1, 0, 1,
-0.8160331, 0.7232217, -2.586502, 0.7215686, 1, 0, 1,
-0.8156806, 0.8163602, 0.0797003, 0.7176471, 1, 0, 1,
-0.8127353, 0.6243661, -0.3404664, 0.7098039, 1, 0, 1,
-0.8088451, -0.6664594, -1.212286, 0.7058824, 1, 0, 1,
-0.8084107, -0.02775611, -2.581917, 0.6980392, 1, 0, 1,
-0.7985497, 0.4283972, -2.163805, 0.6901961, 1, 0, 1,
-0.7967439, -0.4982002, -2.898769, 0.6862745, 1, 0, 1,
-0.7904765, 0.5640805, -2.678075, 0.6784314, 1, 0, 1,
-0.7904053, 1.567068, 1.101551, 0.6745098, 1, 0, 1,
-0.7897149, -0.8458872, -3.168442, 0.6666667, 1, 0, 1,
-0.7846981, 0.7439141, -0.853976, 0.6627451, 1, 0, 1,
-0.7790776, 0.1210488, -0.08010247, 0.654902, 1, 0, 1,
-0.7737744, -0.1786321, -1.049765, 0.6509804, 1, 0, 1,
-0.7731435, -2.704691, -2.684509, 0.6431373, 1, 0, 1,
-0.7674865, -1.302127, -2.548482, 0.6392157, 1, 0, 1,
-0.7647962, 1.948243, 0.3654385, 0.6313726, 1, 0, 1,
-0.7619442, -2.21328, -3.291679, 0.627451, 1, 0, 1,
-0.7575594, -0.7456341, -1.015554, 0.6196079, 1, 0, 1,
-0.7564802, -0.4534582, -2.731678, 0.6156863, 1, 0, 1,
-0.756413, 1.056387, -2.133778, 0.6078432, 1, 0, 1,
-0.7552755, -2.012536, -3.226462, 0.6039216, 1, 0, 1,
-0.7544438, 1.318352, 1.505348, 0.5960785, 1, 0, 1,
-0.7539848, 0.3152255, -2.987983, 0.5882353, 1, 0, 1,
-0.7478881, -1.07226, -3.443802, 0.5843138, 1, 0, 1,
-0.7477344, 0.1336463, -2.244712, 0.5764706, 1, 0, 1,
-0.7439352, 0.01456357, -2.886303, 0.572549, 1, 0, 1,
-0.740401, 0.3039425, -1.435677, 0.5647059, 1, 0, 1,
-0.7352919, 0.06931703, -1.355089, 0.5607843, 1, 0, 1,
-0.7342152, 1.752828, 0.6069707, 0.5529412, 1, 0, 1,
-0.7260348, 1.402069, 0.03907221, 0.5490196, 1, 0, 1,
-0.7224553, -1.478447, -2.566844, 0.5411765, 1, 0, 1,
-0.7185514, 0.2649752, -1.892325, 0.5372549, 1, 0, 1,
-0.7144122, 0.1090592, -2.375479, 0.5294118, 1, 0, 1,
-0.7139664, 1.892618, 0.09515069, 0.5254902, 1, 0, 1,
-0.713023, 0.8098109, -0.4523587, 0.5176471, 1, 0, 1,
-0.7105209, 0.418009, -0.9687032, 0.5137255, 1, 0, 1,
-0.7079933, -0.4031053, -1.53797, 0.5058824, 1, 0, 1,
-0.7044615, -0.1397841, -0.5086883, 0.5019608, 1, 0, 1,
-0.7020124, -2.090544, -4.291475, 0.4941176, 1, 0, 1,
-0.6949092, -0.9363221, -2.617964, 0.4862745, 1, 0, 1,
-0.6862193, 2.433235, -0.04630481, 0.4823529, 1, 0, 1,
-0.6826351, -0.001508741, -1.583336, 0.4745098, 1, 0, 1,
-0.6820071, -0.01522644, -1.448863, 0.4705882, 1, 0, 1,
-0.677777, 1.050121, -0.1919723, 0.4627451, 1, 0, 1,
-0.6733293, -0.6559047, -3.91938, 0.4588235, 1, 0, 1,
-0.6712204, -1.478005, -2.381039, 0.4509804, 1, 0, 1,
-0.6680921, 0.5918841, -1.26543, 0.4470588, 1, 0, 1,
-0.6649724, 1.344077, -0.1435062, 0.4392157, 1, 0, 1,
-0.6586198, 0.8351873, 0.9138397, 0.4352941, 1, 0, 1,
-0.6584814, 0.5214451, -2.187696, 0.427451, 1, 0, 1,
-0.6506593, 0.5797732, -1.097801, 0.4235294, 1, 0, 1,
-0.6478931, -0.5489079, -2.409583, 0.4156863, 1, 0, 1,
-0.6458111, -0.8062778, -0.7410815, 0.4117647, 1, 0, 1,
-0.6367079, -1.282727, -2.060294, 0.4039216, 1, 0, 1,
-0.6315874, -2.287663, -3.945439, 0.3960784, 1, 0, 1,
-0.61334, 1.176023, -1.540565, 0.3921569, 1, 0, 1,
-0.612729, 0.8219399, -0.2802529, 0.3843137, 1, 0, 1,
-0.6123804, -0.1777964, -1.32989, 0.3803922, 1, 0, 1,
-0.6095569, 0.5618649, -0.4459015, 0.372549, 1, 0, 1,
-0.6082262, -0.2805679, -1.552372, 0.3686275, 1, 0, 1,
-0.5999879, 0.02748574, -1.41968, 0.3607843, 1, 0, 1,
-0.5980417, -1.659587, -2.053074, 0.3568628, 1, 0, 1,
-0.5978274, -0.7627733, -1.810616, 0.3490196, 1, 0, 1,
-0.5942297, 1.484107, -0.4506664, 0.345098, 1, 0, 1,
-0.5893573, -0.09643777, -3.501707, 0.3372549, 1, 0, 1,
-0.5892473, 0.8521664, -0.1436809, 0.3333333, 1, 0, 1,
-0.5886188, 0.5393148, 0.6462719, 0.3254902, 1, 0, 1,
-0.5881802, 0.6958405, 0.6893747, 0.3215686, 1, 0, 1,
-0.5848493, -0.9682558, -4.531826, 0.3137255, 1, 0, 1,
-0.5803137, -0.7956558, -2.428246, 0.3098039, 1, 0, 1,
-0.5798814, 0.897716, -0.6568531, 0.3019608, 1, 0, 1,
-0.5763087, 1.082811, -0.2030192, 0.2941177, 1, 0, 1,
-0.5688112, 0.5750942, -2.336775, 0.2901961, 1, 0, 1,
-0.5673281, -0.7154872, -3.055944, 0.282353, 1, 0, 1,
-0.5654465, -1.848756, -3.201875, 0.2784314, 1, 0, 1,
-0.5651046, -0.5596072, -1.752423, 0.2705882, 1, 0, 1,
-0.55968, -1.637575, -2.938606, 0.2666667, 1, 0, 1,
-0.5570451, -1.032485, -2.372192, 0.2588235, 1, 0, 1,
-0.556863, -2.287513, -2.224738, 0.254902, 1, 0, 1,
-0.5565736, 1.942405, 1.637826, 0.2470588, 1, 0, 1,
-0.5564382, -0.07382502, -1.4694, 0.2431373, 1, 0, 1,
-0.5548351, 0.8463483, 1.268573, 0.2352941, 1, 0, 1,
-0.5516296, -0.003650717, -0.7246149, 0.2313726, 1, 0, 1,
-0.5512051, 0.6289622, 1.075023, 0.2235294, 1, 0, 1,
-0.5494383, 0.6408427, -0.1078441, 0.2196078, 1, 0, 1,
-0.5483961, 1.186506, -3.058221, 0.2117647, 1, 0, 1,
-0.5439568, -0.2695667, -1.898908, 0.2078431, 1, 0, 1,
-0.5414165, -1.010946, -2.131554, 0.2, 1, 0, 1,
-0.5407578, 0.03019582, -1.099234, 0.1921569, 1, 0, 1,
-0.5402436, -1.262064, -3.195632, 0.1882353, 1, 0, 1,
-0.5401735, 0.1186152, -1.917007, 0.1803922, 1, 0, 1,
-0.5395896, -1.899451, -1.281134, 0.1764706, 1, 0, 1,
-0.5377159, -0.5722062, -2.657556, 0.1686275, 1, 0, 1,
-0.5326456, 0.1700647, -1.573198, 0.1647059, 1, 0, 1,
-0.5281964, -1.264538, -2.01353, 0.1568628, 1, 0, 1,
-0.5219371, 0.1996986, -2.524457, 0.1529412, 1, 0, 1,
-0.5140464, 0.8275002, -1.731772, 0.145098, 1, 0, 1,
-0.5136549, -0.3899681, -1.782382, 0.1411765, 1, 0, 1,
-0.5103544, 0.3059001, -3.514375, 0.1333333, 1, 0, 1,
-0.5090207, 1.061002, 0.3277032, 0.1294118, 1, 0, 1,
-0.5083523, -0.5172269, -4.772309, 0.1215686, 1, 0, 1,
-0.4984218, 0.5131025, -0.1935802, 0.1176471, 1, 0, 1,
-0.4807836, -0.621157, -2.81972, 0.1098039, 1, 0, 1,
-0.4797325, -1.10915, -3.031799, 0.1058824, 1, 0, 1,
-0.4754651, 0.4412141, 1.861943, 0.09803922, 1, 0, 1,
-0.4726368, -0.7162725, -2.677195, 0.09019608, 1, 0, 1,
-0.4726074, 0.4345039, -0.4831974, 0.08627451, 1, 0, 1,
-0.4679165, 0.7506015, -0.5626833, 0.07843138, 1, 0, 1,
-0.4661563, 0.8949618, -0.9097791, 0.07450981, 1, 0, 1,
-0.4640882, -0.06927099, -0.3296129, 0.06666667, 1, 0, 1,
-0.4640611, 0.132973, -1.875889, 0.0627451, 1, 0, 1,
-0.4578842, -1.228845, -1.928417, 0.05490196, 1, 0, 1,
-0.4541462, -0.9495454, -3.447208, 0.05098039, 1, 0, 1,
-0.4512531, 1.851581, -0.2778133, 0.04313726, 1, 0, 1,
-0.4509276, -0.7595713, -3.048769, 0.03921569, 1, 0, 1,
-0.4461653, -0.04199518, -3.150437, 0.03137255, 1, 0, 1,
-0.4445932, 0.6635491, -0.2721744, 0.02745098, 1, 0, 1,
-0.4406919, -1.577843, -3.26273, 0.01960784, 1, 0, 1,
-0.4385998, -0.2032304, -3.219707, 0.01568628, 1, 0, 1,
-0.4385053, -0.5287817, -3.472662, 0.007843138, 1, 0, 1,
-0.4328396, -1.03286, -1.268344, 0.003921569, 1, 0, 1,
-0.4318741, 0.7475657, -0.1486033, 0, 1, 0.003921569, 1,
-0.4307719, -2.542819, -2.548749, 0, 1, 0.01176471, 1,
-0.4306459, -0.1294346, -1.289448, 0, 1, 0.01568628, 1,
-0.4277264, -1.753481, -2.395269, 0, 1, 0.02352941, 1,
-0.4274839, -0.1192342, -3.104772, 0, 1, 0.02745098, 1,
-0.4266301, -0.1362193, -2.236545, 0, 1, 0.03529412, 1,
-0.4216821, -1.919428, -2.416029, 0, 1, 0.03921569, 1,
-0.4209859, 0.6377426, -0.05172354, 0, 1, 0.04705882, 1,
-0.4180654, 1.589104, 0.8013222, 0, 1, 0.05098039, 1,
-0.4179829, 0.8281491, -1.927617, 0, 1, 0.05882353, 1,
-0.4134257, -0.4352373, -3.835503, 0, 1, 0.0627451, 1,
-0.4133262, -1.156182, -1.130856, 0, 1, 0.07058824, 1,
-0.400744, -0.002041578, -1.65537, 0, 1, 0.07450981, 1,
-0.395371, -0.5215448, -3.407557, 0, 1, 0.08235294, 1,
-0.3915422, -0.3480255, -0.033358, 0, 1, 0.08627451, 1,
-0.3914437, -1.327977, -2.01346, 0, 1, 0.09411765, 1,
-0.3902955, 1.129127, 0.03000312, 0, 1, 0.1019608, 1,
-0.3878407, -1.817542, -2.506668, 0, 1, 0.1058824, 1,
-0.3844127, 0.2477087, -0.3325503, 0, 1, 0.1137255, 1,
-0.3833232, -0.1219236, -3.104632, 0, 1, 0.1176471, 1,
-0.3802793, 1.043109, -1.077854, 0, 1, 0.1254902, 1,
-0.3762306, 1.053789, -1.589947, 0, 1, 0.1294118, 1,
-0.3761279, -0.3807538, -2.614885, 0, 1, 0.1372549, 1,
-0.3757696, -0.03508929, 0.2914349, 0, 1, 0.1411765, 1,
-0.3697286, -1.598912, -4.123014, 0, 1, 0.1490196, 1,
-0.361953, 0.6793721, -0.1715763, 0, 1, 0.1529412, 1,
-0.3603801, 1.080735, -0.6859253, 0, 1, 0.1607843, 1,
-0.3560706, -0.3747964, -2.599787, 0, 1, 0.1647059, 1,
-0.3531952, 0.04531645, -0.709682, 0, 1, 0.172549, 1,
-0.3523321, -0.4811052, -1.917585, 0, 1, 0.1764706, 1,
-0.344813, -0.2006274, -2.289012, 0, 1, 0.1843137, 1,
-0.3437896, -1.149543, -1.718475, 0, 1, 0.1882353, 1,
-0.3421621, 0.2120889, -0.8722981, 0, 1, 0.1960784, 1,
-0.3410386, 1.190027, -0.9349537, 0, 1, 0.2039216, 1,
-0.3395318, -1.294824, -2.887084, 0, 1, 0.2078431, 1,
-0.3303493, -0.111718, -1.599433, 0, 1, 0.2156863, 1,
-0.322059, -0.3137952, -1.697559, 0, 1, 0.2196078, 1,
-0.3216245, 1.863552, 1.200296, 0, 1, 0.227451, 1,
-0.3173483, 0.8270269, 0.676234, 0, 1, 0.2313726, 1,
-0.3125367, 1.600868, -1.851306, 0, 1, 0.2392157, 1,
-0.3022775, 1.619847, -0.3665397, 0, 1, 0.2431373, 1,
-0.2999854, 1.13046, -1.027302, 0, 1, 0.2509804, 1,
-0.2953798, 1.51361, 0.01833356, 0, 1, 0.254902, 1,
-0.2944698, 2.354659, 1.116005, 0, 1, 0.2627451, 1,
-0.2939162, 0.1616057, -0.6800717, 0, 1, 0.2666667, 1,
-0.2935629, 0.6180115, 0.3843598, 0, 1, 0.2745098, 1,
-0.2911213, 0.8308439, -0.3360326, 0, 1, 0.2784314, 1,
-0.2895849, -0.8261628, -2.88577, 0, 1, 0.2862745, 1,
-0.2860124, -1.853514, -2.973439, 0, 1, 0.2901961, 1,
-0.2835015, -1.40778, -3.382627, 0, 1, 0.2980392, 1,
-0.2780017, -0.2263197, -2.992009, 0, 1, 0.3058824, 1,
-0.2769373, 0.733891, -0.7107494, 0, 1, 0.3098039, 1,
-0.2749961, -0.806555, -1.700004, 0, 1, 0.3176471, 1,
-0.2684986, 0.083265, -1.217365, 0, 1, 0.3215686, 1,
-0.2639678, -0.3843935, -3.07554, 0, 1, 0.3294118, 1,
-0.2623369, 0.7115132, 1.386915, 0, 1, 0.3333333, 1,
-0.2620142, 0.6358519, 1.080396, 0, 1, 0.3411765, 1,
-0.2528487, 0.4181347, 0.1023616, 0, 1, 0.345098, 1,
-0.252198, -1.042172, -1.513208, 0, 1, 0.3529412, 1,
-0.2521598, 1.307492, 1.501055, 0, 1, 0.3568628, 1,
-0.2514121, 0.4537774, -0.355126, 0, 1, 0.3647059, 1,
-0.2502992, -0.8110397, -3.248335, 0, 1, 0.3686275, 1,
-0.2487178, -0.2364865, -0.1744548, 0, 1, 0.3764706, 1,
-0.2454651, 1.564325, 0.06922238, 0, 1, 0.3803922, 1,
-0.2365963, -0.4688476, -3.44388, 0, 1, 0.3882353, 1,
-0.2361906, -1.099857, -5.359496, 0, 1, 0.3921569, 1,
-0.234646, -0.5304079, -3.519391, 0, 1, 0.4, 1,
-0.2284409, 0.1693647, -0.9733922, 0, 1, 0.4078431, 1,
-0.2268127, 0.9023202, -0.2186126, 0, 1, 0.4117647, 1,
-0.2227661, -0.5740606, -1.731431, 0, 1, 0.4196078, 1,
-0.2216565, -0.3038739, -2.984754, 0, 1, 0.4235294, 1,
-0.2149562, -0.6441131, -3.596561, 0, 1, 0.4313726, 1,
-0.2138971, -0.6946496, -2.804552, 0, 1, 0.4352941, 1,
-0.2113134, 1.124157, 1.787153, 0, 1, 0.4431373, 1,
-0.2089486, -1.042581, -2.595632, 0, 1, 0.4470588, 1,
-0.2084548, 0.9857417, -1.236297, 0, 1, 0.454902, 1,
-0.2065112, 1.549016, -2.375241, 0, 1, 0.4588235, 1,
-0.2002907, -0.2815655, -2.46546, 0, 1, 0.4666667, 1,
-0.1997412, -0.1107874, -1.637533, 0, 1, 0.4705882, 1,
-0.1937884, -2.236229, -3.774442, 0, 1, 0.4784314, 1,
-0.1936912, -0.5470595, -2.578675, 0, 1, 0.4823529, 1,
-0.1897835, 0.1732741, -0.1578751, 0, 1, 0.4901961, 1,
-0.1879694, 0.2980372, -1.014835, 0, 1, 0.4941176, 1,
-0.1875896, -0.6591649, -3.310398, 0, 1, 0.5019608, 1,
-0.1871845, 0.9590961, -0.3258536, 0, 1, 0.509804, 1,
-0.1856893, -0.06778472, -0.2055345, 0, 1, 0.5137255, 1,
-0.1826116, -0.7268202, -5.11707, 0, 1, 0.5215687, 1,
-0.1815031, -0.1188578, -3.205387, 0, 1, 0.5254902, 1,
-0.1803583, -0.2881381, -3.821059, 0, 1, 0.5333334, 1,
-0.180094, 0.2912986, 0.3258918, 0, 1, 0.5372549, 1,
-0.1770178, 0.4904845, -0.2267427, 0, 1, 0.5450981, 1,
-0.1597658, -0.7921959, -4.119537, 0, 1, 0.5490196, 1,
-0.1577227, 0.4788012, -0.3082054, 0, 1, 0.5568628, 1,
-0.1567543, -1.202287, -2.705298, 0, 1, 0.5607843, 1,
-0.1563473, 1.769281, 1.426269, 0, 1, 0.5686275, 1,
-0.1527382, -0.6718519, -1.942889, 0, 1, 0.572549, 1,
-0.1523895, -1.927301, -1.322733, 0, 1, 0.5803922, 1,
-0.1484841, 1.315435, -1.585586, 0, 1, 0.5843138, 1,
-0.1448086, -1.260287, -2.929404, 0, 1, 0.5921569, 1,
-0.1444375, 1.39053, 0.1979674, 0, 1, 0.5960785, 1,
-0.1427988, 2.017504, -0.2342498, 0, 1, 0.6039216, 1,
-0.1424421, 0.3689551, 0.03347588, 0, 1, 0.6117647, 1,
-0.1406904, -0.1418981, -2.588323, 0, 1, 0.6156863, 1,
-0.1397992, 0.9901181, -0.1772632, 0, 1, 0.6235294, 1,
-0.13897, -2.407368, -3.154227, 0, 1, 0.627451, 1,
-0.1381238, 0.4220968, -0.4071011, 0, 1, 0.6352941, 1,
-0.1368793, -1.17458, -3.026125, 0, 1, 0.6392157, 1,
-0.1366287, -0.4977184, -2.344373, 0, 1, 0.6470588, 1,
-0.1359423, 0.1987887, -0.5537068, 0, 1, 0.6509804, 1,
-0.1328591, 0.07009475, -0.4289163, 0, 1, 0.6588235, 1,
-0.1310305, -0.3903034, -3.730942, 0, 1, 0.6627451, 1,
-0.1303493, 1.728475, -0.4499778, 0, 1, 0.6705883, 1,
-0.1286296, -1.387003, -4.45793, 0, 1, 0.6745098, 1,
-0.1277015, 0.1073368, -2.226157, 0, 1, 0.682353, 1,
-0.126922, -0.2570092, -2.606646, 0, 1, 0.6862745, 1,
-0.1257013, -0.7438174, -4.503586, 0, 1, 0.6941177, 1,
-0.1212378, 0.1540664, -1.636761, 0, 1, 0.7019608, 1,
-0.1202537, -1.595946, -2.80737, 0, 1, 0.7058824, 1,
-0.1154982, 0.4309382, -1.754021, 0, 1, 0.7137255, 1,
-0.1105329, 1.0355, -0.4802215, 0, 1, 0.7176471, 1,
-0.1095596, -0.09013727, -1.572621, 0, 1, 0.7254902, 1,
-0.1076664, 1.85013, -1.122123, 0, 1, 0.7294118, 1,
-0.1069226, -1.440624, -2.175798, 0, 1, 0.7372549, 1,
-0.106898, 1.537943, 0.5719573, 0, 1, 0.7411765, 1,
-0.1017456, -0.1748798, -3.173872, 0, 1, 0.7490196, 1,
-0.1012705, 0.68897, -1.595761, 0, 1, 0.7529412, 1,
-0.1012369, 0.5473725, 0.9987641, 0, 1, 0.7607843, 1,
-0.09868862, -1.730847, -3.710407, 0, 1, 0.7647059, 1,
-0.09439453, 1.404315, -0.9359106, 0, 1, 0.772549, 1,
-0.09284192, -1.088889, -2.494503, 0, 1, 0.7764706, 1,
-0.09123062, -0.1929742, -3.355282, 0, 1, 0.7843137, 1,
-0.08967249, 0.633812, 1.048641, 0, 1, 0.7882353, 1,
-0.08719749, 0.3325468, 0.6030101, 0, 1, 0.7960784, 1,
-0.08621261, -1.692335, -3.89776, 0, 1, 0.8039216, 1,
-0.083396, -0.4152244, -4.273616, 0, 1, 0.8078431, 1,
-0.0827411, -0.1877135, -2.188676, 0, 1, 0.8156863, 1,
-0.07349115, -0.2844902, -2.273863, 0, 1, 0.8196079, 1,
-0.06689974, 1.450334, 1.2735, 0, 1, 0.827451, 1,
-0.05873257, -0.5574189, -3.5729, 0, 1, 0.8313726, 1,
-0.05370103, 0.6705108, -0.7413734, 0, 1, 0.8392157, 1,
-0.05077258, 0.6876779, 1.218228, 0, 1, 0.8431373, 1,
-0.04662454, -1.3778, -4.595222, 0, 1, 0.8509804, 1,
-0.04278013, -0.1523608, -2.013432, 0, 1, 0.854902, 1,
-0.04151313, 2.137859, 1.715022, 0, 1, 0.8627451, 1,
-0.0412385, 1.20583, 0.4571797, 0, 1, 0.8666667, 1,
-0.04119115, 1.95491, 0.95084, 0, 1, 0.8745098, 1,
-0.04072721, 0.06114054, 0.2537479, 0, 1, 0.8784314, 1,
-0.04058355, 0.007449686, -1.632012, 0, 1, 0.8862745, 1,
-0.04056895, 0.7275267, -1.343125, 0, 1, 0.8901961, 1,
-0.02870631, 1.347783, 0.5030176, 0, 1, 0.8980392, 1,
-0.0284131, -0.6131938, -3.25047, 0, 1, 0.9058824, 1,
-0.02550984, -1.363709, -1.680114, 0, 1, 0.9098039, 1,
-0.02459548, -0.3685965, -2.563427, 0, 1, 0.9176471, 1,
-0.02198325, -2.037527, -4.763825, 0, 1, 0.9215686, 1,
-0.02152105, -0.153839, -3.385899, 0, 1, 0.9294118, 1,
-0.02112124, -0.7363145, -2.570898, 0, 1, 0.9333333, 1,
-0.0196214, 0.04337879, -0.9957419, 0, 1, 0.9411765, 1,
-0.01935092, -0.05441442, -3.156417, 0, 1, 0.945098, 1,
-0.01842958, -1.326433, -4.417171, 0, 1, 0.9529412, 1,
-0.01665069, -1.68834, -3.314105, 0, 1, 0.9568627, 1,
-0.01606634, 1.584573, -2.030365, 0, 1, 0.9647059, 1,
-0.01455001, -2.203332, -3.900606, 0, 1, 0.9686275, 1,
-0.00760809, 1.343646, -0.01326383, 0, 1, 0.9764706, 1,
-0.001737403, 0.3552687, 0.6442982, 0, 1, 0.9803922, 1,
-0.001642628, 0.952469, 0.3283646, 0, 1, 0.9882353, 1,
0.01223551, -0.8302997, 4.222382, 0, 1, 0.9921569, 1,
0.01394754, 1.605705, -0.7579636, 0, 1, 1, 1,
0.01470496, 0.517513, 0.1067203, 0, 0.9921569, 1, 1,
0.01583925, -0.4098297, 3.271901, 0, 0.9882353, 1, 1,
0.01846896, -1.179572, 3.775436, 0, 0.9803922, 1, 1,
0.02266798, -0.08128247, 2.221197, 0, 0.9764706, 1, 1,
0.02339141, -0.2152275, 2.419235, 0, 0.9686275, 1, 1,
0.02528149, -0.3702476, 1.269318, 0, 0.9647059, 1, 1,
0.02562748, -0.7037, 4.344251, 0, 0.9568627, 1, 1,
0.02625042, 0.7614869, -1.7533, 0, 0.9529412, 1, 1,
0.02682673, 1.820797, -0.05835642, 0, 0.945098, 1, 1,
0.02744242, -0.2367458, 4.241928, 0, 0.9411765, 1, 1,
0.02937081, 1.197659, 0.04270315, 0, 0.9333333, 1, 1,
0.02952478, -2.524177, 4.367332, 0, 0.9294118, 1, 1,
0.03272935, -0.4094957, 2.464181, 0, 0.9215686, 1, 1,
0.03458818, 0.5338783, -1.196433, 0, 0.9176471, 1, 1,
0.03521573, -0.7415423, 3.398339, 0, 0.9098039, 1, 1,
0.03612909, -0.1089564, 2.985235, 0, 0.9058824, 1, 1,
0.03721171, 1.630066, -0.3946294, 0, 0.8980392, 1, 1,
0.03808472, -1.201243, 1.088821, 0, 0.8901961, 1, 1,
0.04058852, 0.66365, -1.032949, 0, 0.8862745, 1, 1,
0.0447732, -0.1458094, 2.637642, 0, 0.8784314, 1, 1,
0.05488976, -0.4104521, 4.045637, 0, 0.8745098, 1, 1,
0.05898602, 2.40177, -2.005781, 0, 0.8666667, 1, 1,
0.0667261, 1.422456, 0.3388349, 0, 0.8627451, 1, 1,
0.06694255, -0.4428168, 5.394588, 0, 0.854902, 1, 1,
0.08240516, 0.3200483, 0.8428252, 0, 0.8509804, 1, 1,
0.0851256, 0.8217087, -0.04868025, 0, 0.8431373, 1, 1,
0.08818767, 1.119453, -0.4208562, 0, 0.8392157, 1, 1,
0.0891571, 0.1888618, 3.102043, 0, 0.8313726, 1, 1,
0.09016914, -1.173433, 3.631428, 0, 0.827451, 1, 1,
0.09037446, 2.222749, -0.06538759, 0, 0.8196079, 1, 1,
0.0976905, -1.483255, 1.60553, 0, 0.8156863, 1, 1,
0.09865096, 1.221766, -0.1643526, 0, 0.8078431, 1, 1,
0.1018144, 0.8281289, -1.155249, 0, 0.8039216, 1, 1,
0.1077826, 0.4885601, -0.3480754, 0, 0.7960784, 1, 1,
0.1102739, 1.319662, 1.102667, 0, 0.7882353, 1, 1,
0.1146476, 0.6031581, 0.3407682, 0, 0.7843137, 1, 1,
0.1155965, 1.586307, -0.2870568, 0, 0.7764706, 1, 1,
0.1165813, 0.01836669, 0.01206725, 0, 0.772549, 1, 1,
0.1174224, -0.2284563, 1.985187, 0, 0.7647059, 1, 1,
0.1240255, 1.041191, -0.3909715, 0, 0.7607843, 1, 1,
0.1247546, 0.1515081, 1.88968, 0, 0.7529412, 1, 1,
0.1264863, 0.5234728, -1.165845, 0, 0.7490196, 1, 1,
0.131446, 0.7090415, -0.6655833, 0, 0.7411765, 1, 1,
0.1318083, 0.4285276, 0.9112902, 0, 0.7372549, 1, 1,
0.1340957, -0.3377557, 2.857538, 0, 0.7294118, 1, 1,
0.1361326, 0.6898396, 0.8269364, 0, 0.7254902, 1, 1,
0.1364155, 0.07385128, 1.367015, 0, 0.7176471, 1, 1,
0.1367405, -1.572498, 5.470947, 0, 0.7137255, 1, 1,
0.138693, 1.309479, 0.9944218, 0, 0.7058824, 1, 1,
0.1442108, 0.03384052, -0.4954482, 0, 0.6980392, 1, 1,
0.1487746, 0.7139335, 1.311702, 0, 0.6941177, 1, 1,
0.1512088, 0.1647035, 0.282779, 0, 0.6862745, 1, 1,
0.1516079, 1.050225, 1.256328, 0, 0.682353, 1, 1,
0.1527458, 0.2507498, -0.3690622, 0, 0.6745098, 1, 1,
0.1546788, -1.103612, 3.485999, 0, 0.6705883, 1, 1,
0.1554369, -0.0934521, 3.220356, 0, 0.6627451, 1, 1,
0.1578396, 0.1715904, 1.436526, 0, 0.6588235, 1, 1,
0.15804, 1.214552, 0.1407149, 0, 0.6509804, 1, 1,
0.1588241, -1.139252, 3.048548, 0, 0.6470588, 1, 1,
0.1592803, -0.8224496, 3.323395, 0, 0.6392157, 1, 1,
0.1697035, 0.05910006, 0.8072023, 0, 0.6352941, 1, 1,
0.1713741, -0.879552, 2.317776, 0, 0.627451, 1, 1,
0.1745969, 0.6288236, -0.06331202, 0, 0.6235294, 1, 1,
0.1758261, -0.3727938, 1.854659, 0, 0.6156863, 1, 1,
0.1767925, 1.157416, 0.09899201, 0, 0.6117647, 1, 1,
0.1906034, 1.19953, 0.4604398, 0, 0.6039216, 1, 1,
0.200898, 1.485123, 1.893083, 0, 0.5960785, 1, 1,
0.2018803, 0.6607889, 0.5062771, 0, 0.5921569, 1, 1,
0.2106895, -2.100216, 2.873926, 0, 0.5843138, 1, 1,
0.2140911, 0.5413249, 0.1944576, 0, 0.5803922, 1, 1,
0.2150946, 0.5809924, 1.376848, 0, 0.572549, 1, 1,
0.2152387, -1.972181, 1.379553, 0, 0.5686275, 1, 1,
0.2155596, -0.870357, 4.935555, 0, 0.5607843, 1, 1,
0.2161355, 1.060606, -0.2223669, 0, 0.5568628, 1, 1,
0.2215368, -1.435439, 3.31579, 0, 0.5490196, 1, 1,
0.2234986, 0.9877183, 0.9644321, 0, 0.5450981, 1, 1,
0.2241145, -0.2885276, 2.950112, 0, 0.5372549, 1, 1,
0.2266673, -1.808963, 3.78067, 0, 0.5333334, 1, 1,
0.2320543, 0.4964288, 0.187203, 0, 0.5254902, 1, 1,
0.2324617, -0.108445, 0.5602568, 0, 0.5215687, 1, 1,
0.2337816, 0.9977868, 0.09270999, 0, 0.5137255, 1, 1,
0.2344974, 0.9204082, -0.2934598, 0, 0.509804, 1, 1,
0.2373251, 0.6172708, -1.635671, 0, 0.5019608, 1, 1,
0.2415953, 0.686848, 0.6183483, 0, 0.4941176, 1, 1,
0.2450274, 0.1954686, 2.232941, 0, 0.4901961, 1, 1,
0.2483679, 1.38625, -0.1000386, 0, 0.4823529, 1, 1,
0.2490941, 0.9195171, 0.1893266, 0, 0.4784314, 1, 1,
0.2537208, -0.8785179, 2.124235, 0, 0.4705882, 1, 1,
0.254349, -0.2531185, 1.692844, 0, 0.4666667, 1, 1,
0.2575962, -0.6614161, 3.810227, 0, 0.4588235, 1, 1,
0.2601316, 0.001575471, 1.593186, 0, 0.454902, 1, 1,
0.260646, 0.9745994, -0.8855194, 0, 0.4470588, 1, 1,
0.2713952, -0.7520388, 3.415425, 0, 0.4431373, 1, 1,
0.2737831, -0.4320607, 2.958812, 0, 0.4352941, 1, 1,
0.2801925, -1.73588, 3.171708, 0, 0.4313726, 1, 1,
0.2805153, 1.362004, 0.5404843, 0, 0.4235294, 1, 1,
0.2817184, -1.069685, 4.940029, 0, 0.4196078, 1, 1,
0.2844736, 0.9010638, 1.183247, 0, 0.4117647, 1, 1,
0.2845233, -1.190088, 3.785125, 0, 0.4078431, 1, 1,
0.2854267, 0.3230889, 1.775687, 0, 0.4, 1, 1,
0.2880683, -0.9259502, 2.413367, 0, 0.3921569, 1, 1,
0.2886998, 0.5495873, -1.097309, 0, 0.3882353, 1, 1,
0.2887089, 0.09782321, 1.220447, 0, 0.3803922, 1, 1,
0.2927368, 1.820428, 1.015868, 0, 0.3764706, 1, 1,
0.2936952, -0.09050872, 0.8104538, 0, 0.3686275, 1, 1,
0.2938138, 0.9089845, 1.022484, 0, 0.3647059, 1, 1,
0.2964105, 0.4397133, 2.007901, 0, 0.3568628, 1, 1,
0.2981992, 0.4417932, -0.1206158, 0, 0.3529412, 1, 1,
0.3008539, 1.609998, -1.525782, 0, 0.345098, 1, 1,
0.3051146, -1.636196, 3.406845, 0, 0.3411765, 1, 1,
0.3073925, 0.8761789, -0.6796198, 0, 0.3333333, 1, 1,
0.3102852, -1.293132, 4.72763, 0, 0.3294118, 1, 1,
0.3168934, 2.283297, 0.8322786, 0, 0.3215686, 1, 1,
0.3213103, 0.2003391, 1.483674, 0, 0.3176471, 1, 1,
0.3217391, 0.09013004, 1.408228, 0, 0.3098039, 1, 1,
0.3235808, -0.8666652, 0.6903206, 0, 0.3058824, 1, 1,
0.3267751, -1.211971, 3.715633, 0, 0.2980392, 1, 1,
0.3286637, 0.2643256, 1.644641, 0, 0.2901961, 1, 1,
0.3287341, 0.4957456, 1.2182, 0, 0.2862745, 1, 1,
0.3296161, 0.3569835, 1.182977, 0, 0.2784314, 1, 1,
0.3305666, 0.1914328, 0.2306644, 0, 0.2745098, 1, 1,
0.3308428, -0.2679565, 2.347614, 0, 0.2666667, 1, 1,
0.3345905, -1.049484, 3.544775, 0, 0.2627451, 1, 1,
0.3377753, 0.8472193, 0.928726, 0, 0.254902, 1, 1,
0.3385166, -0.2198947, 0.1839906, 0, 0.2509804, 1, 1,
0.3392864, 1.297704, -1.373886, 0, 0.2431373, 1, 1,
0.3414112, 1.320924, 0.008922293, 0, 0.2392157, 1, 1,
0.3425918, -0.3752405, 2.993666, 0, 0.2313726, 1, 1,
0.3530036, -0.6824254, 3.471474, 0, 0.227451, 1, 1,
0.3544302, -0.397652, 3.200595, 0, 0.2196078, 1, 1,
0.3548934, -2.200587, 4.740846, 0, 0.2156863, 1, 1,
0.355472, -0.1650469, 3.805103, 0, 0.2078431, 1, 1,
0.358147, -0.3568744, 2.417802, 0, 0.2039216, 1, 1,
0.3596081, 0.7022747, -0.2215965, 0, 0.1960784, 1, 1,
0.3613662, 0.09455084, 1.08431, 0, 0.1882353, 1, 1,
0.3630852, 1.69339, 0.01304281, 0, 0.1843137, 1, 1,
0.3660767, -0.9198276, 4.206496, 0, 0.1764706, 1, 1,
0.3664925, -0.1214621, -0.5516636, 0, 0.172549, 1, 1,
0.3707309, -0.09070932, 1.597043, 0, 0.1647059, 1, 1,
0.3755687, -0.8047367, 4.204918, 0, 0.1607843, 1, 1,
0.3774129, 0.02943497, -0.334834, 0, 0.1529412, 1, 1,
0.3811721, 1.771083, 0.9083339, 0, 0.1490196, 1, 1,
0.3830977, -1.620402, 1.846656, 0, 0.1411765, 1, 1,
0.3863207, 0.2925727, 0.8131232, 0, 0.1372549, 1, 1,
0.3942489, -0.08069451, 0.5316725, 0, 0.1294118, 1, 1,
0.3958147, 0.1832946, -0.003089424, 0, 0.1254902, 1, 1,
0.3984324, -1.980853, 3.684954, 0, 0.1176471, 1, 1,
0.3984331, 1.442134, 0.8149314, 0, 0.1137255, 1, 1,
0.4080189, 1.262492, 0.1147777, 0, 0.1058824, 1, 1,
0.4096832, 0.1713576, 1.660532, 0, 0.09803922, 1, 1,
0.4105045, -0.7375031, 3.308524, 0, 0.09411765, 1, 1,
0.4150046, 1.509367, -0.3680616, 0, 0.08627451, 1, 1,
0.4212131, -0.6832458, 3.568156, 0, 0.08235294, 1, 1,
0.4218292, -1.257246, 2.523236, 0, 0.07450981, 1, 1,
0.4219137, 0.3642021, 1.136091, 0, 0.07058824, 1, 1,
0.4238536, 0.1231489, 2.217314, 0, 0.0627451, 1, 1,
0.4311365, -0.4813042, 2.597527, 0, 0.05882353, 1, 1,
0.4314145, 0.7502634, -0.4534308, 0, 0.05098039, 1, 1,
0.4338003, 0.7434749, 0.5486268, 0, 0.04705882, 1, 1,
0.4339122, 0.5367312, 0.7090751, 0, 0.03921569, 1, 1,
0.4357177, 0.6814235, -0.2013394, 0, 0.03529412, 1, 1,
0.4446968, -0.4714508, 2.010887, 0, 0.02745098, 1, 1,
0.4478397, 1.962008, 1.360091, 0, 0.02352941, 1, 1,
0.4501578, 0.2839057, 0.7689002, 0, 0.01568628, 1, 1,
0.4531444, -0.06004606, 0.2588494, 0, 0.01176471, 1, 1,
0.4535866, 1.299503, 0.7952254, 0, 0.003921569, 1, 1,
0.4541559, -1.564267, 3.0494, 0.003921569, 0, 1, 1,
0.4543339, 0.4395663, 1.095511, 0.007843138, 0, 1, 1,
0.4620308, -0.3262525, 2.75813, 0.01568628, 0, 1, 1,
0.4678615, -0.2649712, 2.54655, 0.01960784, 0, 1, 1,
0.4716037, -0.695315, 1.676851, 0.02745098, 0, 1, 1,
0.4742726, 0.6535304, -0.01422412, 0.03137255, 0, 1, 1,
0.4773085, 0.4501545, 1.557959, 0.03921569, 0, 1, 1,
0.4774863, -0.03690072, -0.9653608, 0.04313726, 0, 1, 1,
0.4801085, 0.5625274, 0.05801358, 0.05098039, 0, 1, 1,
0.4804613, 0.4382482, 0.815851, 0.05490196, 0, 1, 1,
0.4812492, 0.2379196, 1.571244, 0.0627451, 0, 1, 1,
0.4855108, 0.295897, 2.419779, 0.06666667, 0, 1, 1,
0.4881052, 0.9487767, -1.320183, 0.07450981, 0, 1, 1,
0.4894553, 2.652687, 0.7789993, 0.07843138, 0, 1, 1,
0.4916273, 0.3867429, 0.4126077, 0.08627451, 0, 1, 1,
0.4922425, 0.5449734, 0.6347163, 0.09019608, 0, 1, 1,
0.4980386, 0.3720946, 1.767968, 0.09803922, 0, 1, 1,
0.4981507, -0.6173862, 4.157175, 0.1058824, 0, 1, 1,
0.4989414, 0.8829182, -0.6154476, 0.1098039, 0, 1, 1,
0.5055527, -1.610136, 2.713921, 0.1176471, 0, 1, 1,
0.5078241, -0.8041945, 3.064644, 0.1215686, 0, 1, 1,
0.5104014, -0.5659033, 3.894689, 0.1294118, 0, 1, 1,
0.5109695, -0.1739567, 1.605636, 0.1333333, 0, 1, 1,
0.5116808, -0.5482776, 1.96237, 0.1411765, 0, 1, 1,
0.515537, -0.8480479, 3.365447, 0.145098, 0, 1, 1,
0.524011, 0.8689006, 1.296085, 0.1529412, 0, 1, 1,
0.5285089, -0.9114506, 0.6023731, 0.1568628, 0, 1, 1,
0.5301135, 0.1842521, 0.7995071, 0.1647059, 0, 1, 1,
0.5373884, -0.3781068, 2.265471, 0.1686275, 0, 1, 1,
0.5387291, -0.7955258, 1.334185, 0.1764706, 0, 1, 1,
0.5436409, 0.9149465, -0.5825903, 0.1803922, 0, 1, 1,
0.5444105, 0.2957296, 1.607496, 0.1882353, 0, 1, 1,
0.5447538, -1.082919, 2.56204, 0.1921569, 0, 1, 1,
0.5507862, 0.7935534, 1.686073, 0.2, 0, 1, 1,
0.5533395, -1.488889, 3.565432, 0.2078431, 0, 1, 1,
0.5586792, -0.394261, 2.701458, 0.2117647, 0, 1, 1,
0.5586799, 0.8538487, 0.4822356, 0.2196078, 0, 1, 1,
0.5591906, 0.9911118, -1.610972, 0.2235294, 0, 1, 1,
0.5598946, -0.2775147, 2.341656, 0.2313726, 0, 1, 1,
0.5621992, -0.3183394, 3.203578, 0.2352941, 0, 1, 1,
0.5626398, 1.169263, -0.5187597, 0.2431373, 0, 1, 1,
0.5684286, 1.709089, -0.4971175, 0.2470588, 0, 1, 1,
0.5705284, -0.8276496, 2.136154, 0.254902, 0, 1, 1,
0.5706757, -0.1343362, 1.12626, 0.2588235, 0, 1, 1,
0.5718064, 0.9093146, 2.634147, 0.2666667, 0, 1, 1,
0.5815738, 1.406988, 0.9382952, 0.2705882, 0, 1, 1,
0.5822402, 0.9734917, 0.7169443, 0.2784314, 0, 1, 1,
0.5838571, 0.820376, 1.06153, 0.282353, 0, 1, 1,
0.5838611, -0.2407952, 0.806488, 0.2901961, 0, 1, 1,
0.5854455, -1.288493, 1.882527, 0.2941177, 0, 1, 1,
0.5887681, -0.7295066, 3.772238, 0.3019608, 0, 1, 1,
0.5912613, -1.578358, 1.698028, 0.3098039, 0, 1, 1,
0.5919483, -0.9418618, 4.250882, 0.3137255, 0, 1, 1,
0.5928172, 0.8469045, 0.6469932, 0.3215686, 0, 1, 1,
0.5938315, -0.1842622, 1.221439, 0.3254902, 0, 1, 1,
0.5973835, 0.3559687, -0.6529326, 0.3333333, 0, 1, 1,
0.5974151, -0.7593976, 3.466173, 0.3372549, 0, 1, 1,
0.6037791, 0.1205326, 2.218374, 0.345098, 0, 1, 1,
0.6056156, 0.3370407, 1.410591, 0.3490196, 0, 1, 1,
0.6135477, -0.8210638, 2.545663, 0.3568628, 0, 1, 1,
0.6169545, -1.863267, 4.039411, 0.3607843, 0, 1, 1,
0.6217054, -0.1485359, 2.413536, 0.3686275, 0, 1, 1,
0.6274693, 0.03584588, 2.803633, 0.372549, 0, 1, 1,
0.6338175, 0.73079, 0.642555, 0.3803922, 0, 1, 1,
0.6381326, 0.01051998, 0.9908922, 0.3843137, 0, 1, 1,
0.6382589, 0.9568083, 1.0866, 0.3921569, 0, 1, 1,
0.6407351, 0.7674763, 1.44345, 0.3960784, 0, 1, 1,
0.6408728, 0.08150898, 1.514925, 0.4039216, 0, 1, 1,
0.6413711, -1.55347, 2.85055, 0.4117647, 0, 1, 1,
0.6436188, -1.186202, 2.841814, 0.4156863, 0, 1, 1,
0.6439623, 0.5925764, 2.231477, 0.4235294, 0, 1, 1,
0.6499056, 1.082258, 0.8301419, 0.427451, 0, 1, 1,
0.6533839, -1.289692, 4.384651, 0.4352941, 0, 1, 1,
0.6536609, -0.287043, 1.088057, 0.4392157, 0, 1, 1,
0.6601891, -4.945554e-05, 1.003441, 0.4470588, 0, 1, 1,
0.6659174, -1.081791, 1.387851, 0.4509804, 0, 1, 1,
0.6700854, -0.2304534, 1.200072, 0.4588235, 0, 1, 1,
0.6766922, -1.581573, 4.630104, 0.4627451, 0, 1, 1,
0.6768687, -0.03952614, 1.274672, 0.4705882, 0, 1, 1,
0.6787149, -0.1417173, 2.635992, 0.4745098, 0, 1, 1,
0.6847488, 1.412096, 0.8180496, 0.4823529, 0, 1, 1,
0.6883124, 1.069021, 0.9561213, 0.4862745, 0, 1, 1,
0.6914971, -0.01607066, 2.256747, 0.4941176, 0, 1, 1,
0.6936009, -1.224368, 2.535147, 0.5019608, 0, 1, 1,
0.6940168, 0.05418304, 0.568207, 0.5058824, 0, 1, 1,
0.6966842, 0.9619529, 0.198172, 0.5137255, 0, 1, 1,
0.6976159, 0.8946388, 0.9358358, 0.5176471, 0, 1, 1,
0.7000577, 0.04572247, 0.125816, 0.5254902, 0, 1, 1,
0.7032576, 0.7436221, 2.028259, 0.5294118, 0, 1, 1,
0.7070645, -1.768982, 2.001766, 0.5372549, 0, 1, 1,
0.7089525, -1.05755, 3.575877, 0.5411765, 0, 1, 1,
0.7114747, -0.5434145, 2.871295, 0.5490196, 0, 1, 1,
0.7191647, 0.264681, 0.6400673, 0.5529412, 0, 1, 1,
0.7219931, 0.7519088, 1.350686, 0.5607843, 0, 1, 1,
0.7257457, 0.01579918, -0.03328956, 0.5647059, 0, 1, 1,
0.7278431, 0.01375123, 2.447612, 0.572549, 0, 1, 1,
0.7297704, -0.02540209, 1.788675, 0.5764706, 0, 1, 1,
0.7327085, 0.4958552, 0.5842533, 0.5843138, 0, 1, 1,
0.7333444, -2.131937, 4.003267, 0.5882353, 0, 1, 1,
0.7353741, 1.884523, 1.253795, 0.5960785, 0, 1, 1,
0.7390563, -1.193611, 2.879739, 0.6039216, 0, 1, 1,
0.7474901, -0.7155277, 2.253101, 0.6078432, 0, 1, 1,
0.7480555, 0.6124995, 0.4448153, 0.6156863, 0, 1, 1,
0.7537566, 1.594439, 0.247376, 0.6196079, 0, 1, 1,
0.7580235, -0.1286535, 1.55964, 0.627451, 0, 1, 1,
0.7592335, -1.260628, 4.664642, 0.6313726, 0, 1, 1,
0.7617146, 1.099225, 0.516059, 0.6392157, 0, 1, 1,
0.7625505, 1.665477, -2.008747, 0.6431373, 0, 1, 1,
0.7638226, 1.240019, 1.95904, 0.6509804, 0, 1, 1,
0.7687882, 0.4756061, 0.3128914, 0.654902, 0, 1, 1,
0.7694662, 0.1644666, 1.650425, 0.6627451, 0, 1, 1,
0.7715025, -0.6903082, 2.382715, 0.6666667, 0, 1, 1,
0.7729022, -1.073315, 2.749672, 0.6745098, 0, 1, 1,
0.7736278, 2.248141, -0.5413424, 0.6784314, 0, 1, 1,
0.7754533, -2.24281, 4.614491, 0.6862745, 0, 1, 1,
0.7760355, -0.4257905, -0.06703846, 0.6901961, 0, 1, 1,
0.7770575, -0.5638207, 0.7726746, 0.6980392, 0, 1, 1,
0.7787969, 0.4044752, 2.157015, 0.7058824, 0, 1, 1,
0.7831824, -1.382134, 4.234854, 0.7098039, 0, 1, 1,
0.7838174, 0.650976, 0.4633658, 0.7176471, 0, 1, 1,
0.7848298, 0.4218259, 0.6895417, 0.7215686, 0, 1, 1,
0.7865747, 0.6318308, 1.449768, 0.7294118, 0, 1, 1,
0.7905337, -0.6314275, 2.377509, 0.7333333, 0, 1, 1,
0.7906243, 0.3479683, 2.361928, 0.7411765, 0, 1, 1,
0.7942666, 0.3886868, 1.336277, 0.7450981, 0, 1, 1,
0.7983881, 0.3802942, 2.675655, 0.7529412, 0, 1, 1,
0.8010711, 0.6925875, -0.2044836, 0.7568628, 0, 1, 1,
0.8070675, -1.221072, 2.735171, 0.7647059, 0, 1, 1,
0.8073962, 0.3007672, 2.2166, 0.7686275, 0, 1, 1,
0.8090327, 0.4046751, 1.304539, 0.7764706, 0, 1, 1,
0.8145214, 0.2486927, 1.504206, 0.7803922, 0, 1, 1,
0.8174529, 1.499543, 1.203484, 0.7882353, 0, 1, 1,
0.820316, 0.6875778, 1.615345, 0.7921569, 0, 1, 1,
0.8296684, -1.308274, 1.906885, 0.8, 0, 1, 1,
0.834478, 0.8684009, -0.1415748, 0.8078431, 0, 1, 1,
0.8367919, 1.622087, -0.1142399, 0.8117647, 0, 1, 1,
0.8454748, 0.8583385, 1.045006, 0.8196079, 0, 1, 1,
0.8601679, 0.1733406, 1.509812, 0.8235294, 0, 1, 1,
0.8623675, -0.1996053, 1.597067, 0.8313726, 0, 1, 1,
0.8661914, 0.3838019, 1.882054, 0.8352941, 0, 1, 1,
0.8853989, 0.2694015, 1.405559, 0.8431373, 0, 1, 1,
0.8870133, 0.4812165, 2.098839, 0.8470588, 0, 1, 1,
0.8892874, -1.500428, 2.463362, 0.854902, 0, 1, 1,
0.8902163, 0.05286449, 0.456577, 0.8588235, 0, 1, 1,
0.8913251, 0.3927916, 1.241678, 0.8666667, 0, 1, 1,
0.8971568, -0.7883805, 1.862154, 0.8705882, 0, 1, 1,
0.9001632, -0.2157276, 1.543138, 0.8784314, 0, 1, 1,
0.9012524, -0.570012, 2.027276, 0.8823529, 0, 1, 1,
0.9030705, -0.1693192, 1.751694, 0.8901961, 0, 1, 1,
0.9045113, 0.00793343, 1.800422, 0.8941177, 0, 1, 1,
0.9110433, -1.335337, 3.460115, 0.9019608, 0, 1, 1,
0.9138781, 1.151964, -1.209342, 0.9098039, 0, 1, 1,
0.9192451, 0.5887834, 1.286098, 0.9137255, 0, 1, 1,
0.9227715, -1.51663, 1.304811, 0.9215686, 0, 1, 1,
0.9228138, 0.9357813, -0.8766532, 0.9254902, 0, 1, 1,
0.9288027, -1.463234, 2.963332, 0.9333333, 0, 1, 1,
0.9336362, -0.3840152, 2.588764, 0.9372549, 0, 1, 1,
0.9346755, 0.8180066, 1.627377, 0.945098, 0, 1, 1,
0.9349189, 0.8986961, 1.576243, 0.9490196, 0, 1, 1,
0.9392704, 0.7251576, 1.203005, 0.9568627, 0, 1, 1,
0.9393425, 0.2617182, 2.314548, 0.9607843, 0, 1, 1,
0.9415446, 0.7189316, 1.264084, 0.9686275, 0, 1, 1,
0.9478096, -2.679976, 3.734812, 0.972549, 0, 1, 1,
0.9491944, -0.8167874, 0.7204671, 0.9803922, 0, 1, 1,
0.950879, -0.2826407, 2.612877, 0.9843137, 0, 1, 1,
0.9513804, -1.520712, -0.5964801, 0.9921569, 0, 1, 1,
0.9600975, 0.5953717, 2.161057, 0.9960784, 0, 1, 1,
0.9726275, -0.1008435, -0.145166, 1, 0, 0.9960784, 1,
0.9727271, 0.5393968, 0.1153916, 1, 0, 0.9882353, 1,
0.9729539, -1.177698, 1.510129, 1, 0, 0.9843137, 1,
0.9739553, -1.169279, 3.975143, 1, 0, 0.9764706, 1,
0.9753531, -0.1607577, 1.399473, 1, 0, 0.972549, 1,
0.9784684, -0.3120856, 0.8649654, 1, 0, 0.9647059, 1,
0.9800022, 0.2338226, -0.4311188, 1, 0, 0.9607843, 1,
0.9858441, 1.248572, 0.2392855, 1, 0, 0.9529412, 1,
0.9860932, 0.2988591, 2.281406, 1, 0, 0.9490196, 1,
0.9898726, 0.7368082, 0.2076886, 1, 0, 0.9411765, 1,
1.003601, -1.173292, 2.685678, 1, 0, 0.9372549, 1,
1.010852, 1.029932, 0.7670373, 1, 0, 0.9294118, 1,
1.013716, -1.150454, 1.269713, 1, 0, 0.9254902, 1,
1.021619, -0.685202, 1.623392, 1, 0, 0.9176471, 1,
1.023386, 0.9142053, 1.239497, 1, 0, 0.9137255, 1,
1.026208, 0.5151013, 2.516772, 1, 0, 0.9058824, 1,
1.026744, -1.0131, 2.1255, 1, 0, 0.9019608, 1,
1.029492, 0.6670708, -0.9558043, 1, 0, 0.8941177, 1,
1.031713, 1.11306, -1.011864, 1, 0, 0.8862745, 1,
1.033353, 1.292252, -0.8441424, 1, 0, 0.8823529, 1,
1.033929, 1.160255, 2.157288, 1, 0, 0.8745098, 1,
1.046074, 0.1288957, 1.846656, 1, 0, 0.8705882, 1,
1.046532, 1.158263, 1.179081, 1, 0, 0.8627451, 1,
1.047519, 1.387915, 1.794419, 1, 0, 0.8588235, 1,
1.047839, 0.4676199, 0.5795338, 1, 0, 0.8509804, 1,
1.050326, 0.4754014, 1.104605, 1, 0, 0.8470588, 1,
1.051446, 1.486251, 1.141025, 1, 0, 0.8392157, 1,
1.053057, -0.1593363, 1.236564, 1, 0, 0.8352941, 1,
1.068858, -0.3059753, 1.8779, 1, 0, 0.827451, 1,
1.076772, -0.1688757, 2.800045, 1, 0, 0.8235294, 1,
1.077913, -0.452847, 1.328106, 1, 0, 0.8156863, 1,
1.095694, -1.475242, 2.54325, 1, 0, 0.8117647, 1,
1.1026, -0.3635223, 3.194045, 1, 0, 0.8039216, 1,
1.113823, 0.1261856, -1.511079, 1, 0, 0.7960784, 1,
1.122186, 0.775303, -1.223314, 1, 0, 0.7921569, 1,
1.133191, -1.486444, 0.8164742, 1, 0, 0.7843137, 1,
1.138894, -0.04325768, 1.809397, 1, 0, 0.7803922, 1,
1.139757, -0.7848366, 1.787981, 1, 0, 0.772549, 1,
1.141998, -0.5312896, 1.143559, 1, 0, 0.7686275, 1,
1.146518, -1.276389, 2.700179, 1, 0, 0.7607843, 1,
1.147046, -0.5484033, 2.127358, 1, 0, 0.7568628, 1,
1.153275, -0.721899, 3.127662, 1, 0, 0.7490196, 1,
1.153413, 0.128985, 2.334034, 1, 0, 0.7450981, 1,
1.15668, 0.7355432, 0.9682037, 1, 0, 0.7372549, 1,
1.171363, 1.427987, 0.7775216, 1, 0, 0.7333333, 1,
1.175369, 0.2482189, 3.183472, 1, 0, 0.7254902, 1,
1.175879, 0.4604051, -0.7193142, 1, 0, 0.7215686, 1,
1.177625, -1.427286, 5.393023, 1, 0, 0.7137255, 1,
1.180431, -0.6568093, 1.200467, 1, 0, 0.7098039, 1,
1.196984, -1.61576, 3.098307, 1, 0, 0.7019608, 1,
1.197494, 0.4269597, 3.017051, 1, 0, 0.6941177, 1,
1.203129, 0.7887794, 0.2230327, 1, 0, 0.6901961, 1,
1.209184, -0.1234867, 1.594778, 1, 0, 0.682353, 1,
1.209762, 0.7122318, 0.8365634, 1, 0, 0.6784314, 1,
1.218768, -0.1418902, 2.036386, 1, 0, 0.6705883, 1,
1.222226, -0.6718083, 1.100798, 1, 0, 0.6666667, 1,
1.222657, -0.4644699, 1.671296, 1, 0, 0.6588235, 1,
1.229738, -0.400714, 0.7854301, 1, 0, 0.654902, 1,
1.234443, -1.241375, 0.8616891, 1, 0, 0.6470588, 1,
1.250227, -1.976688, 2.827538, 1, 0, 0.6431373, 1,
1.255061, 0.4457378, 2.016993, 1, 0, 0.6352941, 1,
1.2581, -0.4254003, 1.190926, 1, 0, 0.6313726, 1,
1.259682, 0.7938887, 0.8600183, 1, 0, 0.6235294, 1,
1.27816, 0.6722197, 0.1521041, 1, 0, 0.6196079, 1,
1.278682, -0.4403457, 2.941774, 1, 0, 0.6117647, 1,
1.286847, -1.483011, 3.825435, 1, 0, 0.6078432, 1,
1.286885, 0.05109535, 1.801538, 1, 0, 0.6, 1,
1.293924, 2.519612, 0.2101668, 1, 0, 0.5921569, 1,
1.302284, -0.5884538, 3.797711, 1, 0, 0.5882353, 1,
1.303159, -1.202105, 2.518548, 1, 0, 0.5803922, 1,
1.304134, -1.02928, 2.764517, 1, 0, 0.5764706, 1,
1.314949, 0.8561625, 2.162436, 1, 0, 0.5686275, 1,
1.325024, 0.9451502, -0.2978104, 1, 0, 0.5647059, 1,
1.328069, -0.8931038, 2.701972, 1, 0, 0.5568628, 1,
1.328213, 1.285203, 1.397891, 1, 0, 0.5529412, 1,
1.33906, 1.036862, 1.226975, 1, 0, 0.5450981, 1,
1.342442, -1.310042, 3.526166, 1, 0, 0.5411765, 1,
1.345512, 0.5342103, 1.570013, 1, 0, 0.5333334, 1,
1.35703, -0.2075618, 0.6689575, 1, 0, 0.5294118, 1,
1.37089, 0.8427573, 1.976678, 1, 0, 0.5215687, 1,
1.376803, 0.4297805, 1.573082, 1, 0, 0.5176471, 1,
1.377008, -0.6962291, 2.40368, 1, 0, 0.509804, 1,
1.38785, -0.2998901, 1.567858, 1, 0, 0.5058824, 1,
1.390044, -0.8916121, 3.327473, 1, 0, 0.4980392, 1,
1.395142, -2.083572, 0.7872361, 1, 0, 0.4901961, 1,
1.431892, -0.6716508, 1.075233, 1, 0, 0.4862745, 1,
1.440565, 0.496605, 0.8151178, 1, 0, 0.4784314, 1,
1.464209, -0.249577, 2.457845, 1, 0, 0.4745098, 1,
1.474812, 0.9054505, -0.7785233, 1, 0, 0.4666667, 1,
1.481685, 0.03211918, 3.287888, 1, 0, 0.4627451, 1,
1.497544, -0.3270122, 2.221285, 1, 0, 0.454902, 1,
1.503078, -0.1781161, 1.92413, 1, 0, 0.4509804, 1,
1.504294, -1.526534, 2.873201, 1, 0, 0.4431373, 1,
1.513151, 1.999488, 2.662509, 1, 0, 0.4392157, 1,
1.522867, 0.9465282, 0.3825901, 1, 0, 0.4313726, 1,
1.531672, -0.8462218, 1.875411, 1, 0, 0.427451, 1,
1.539012, -0.7433257, 1.801652, 1, 0, 0.4196078, 1,
1.552808, 0.7647476, 0.3168903, 1, 0, 0.4156863, 1,
1.556391, -0.4087082, 2.048547, 1, 0, 0.4078431, 1,
1.558016, 1.144506, -0.5662731, 1, 0, 0.4039216, 1,
1.559982, 2.421676, 1.323558, 1, 0, 0.3960784, 1,
1.568153, -2.021273, 2.494266, 1, 0, 0.3882353, 1,
1.573306, 0.7708559, 3.260285, 1, 0, 0.3843137, 1,
1.58127, -0.8866615, 0.772055, 1, 0, 0.3764706, 1,
1.599491, 1.286897, -0.3661627, 1, 0, 0.372549, 1,
1.602501, -0.7594984, 2.536354, 1, 0, 0.3647059, 1,
1.610228, 0.6185022, 0.5485196, 1, 0, 0.3607843, 1,
1.613561, -0.04088167, 1.205254, 1, 0, 0.3529412, 1,
1.655787, -0.171972, 0.9798478, 1, 0, 0.3490196, 1,
1.674933, 0.3112242, 1.598181, 1, 0, 0.3411765, 1,
1.677537, 0.5031776, 1.267899, 1, 0, 0.3372549, 1,
1.680723, -0.1963516, 1.032777, 1, 0, 0.3294118, 1,
1.694528, 0.6047044, 2.116899, 1, 0, 0.3254902, 1,
1.703425, -1.043839, 2.967353, 1, 0, 0.3176471, 1,
1.716508, -0.8097034, 2.39674, 1, 0, 0.3137255, 1,
1.720634, 1.083768, -0.2073455, 1, 0, 0.3058824, 1,
1.723094, -0.2050944, 1.709491, 1, 0, 0.2980392, 1,
1.757411, -0.7411209, 2.019914, 1, 0, 0.2941177, 1,
1.757909, -0.1017809, 1.690204, 1, 0, 0.2862745, 1,
1.773445, -1.510398, 1.591837, 1, 0, 0.282353, 1,
1.78152, -1.320782, 2.713058, 1, 0, 0.2745098, 1,
1.784135, -0.4338965, 1.335653, 1, 0, 0.2705882, 1,
1.806113, 0.9072506, 0.4265436, 1, 0, 0.2627451, 1,
1.850793, 0.1144982, -0.7204211, 1, 0, 0.2588235, 1,
1.853117, -0.3403486, 1.178332, 1, 0, 0.2509804, 1,
1.857299, 0.8498311, 1.934082, 1, 0, 0.2470588, 1,
1.863635, -0.08706869, 2.410219, 1, 0, 0.2392157, 1,
1.865176, 0.5810024, 0.01279572, 1, 0, 0.2352941, 1,
1.870163, 1.895151, 1.072668, 1, 0, 0.227451, 1,
1.8834, 1.803459, 1.792634, 1, 0, 0.2235294, 1,
1.889256, -0.4284148, 1.631771, 1, 0, 0.2156863, 1,
1.914354, -0.7199996, 2.773511, 1, 0, 0.2117647, 1,
1.937997, -1.207836, 2.273879, 1, 0, 0.2039216, 1,
1.940949, 0.9521891, 1.545888, 1, 0, 0.1960784, 1,
1.95302, 0.1859348, 2.349753, 1, 0, 0.1921569, 1,
1.959672, -1.089366, 1.404981, 1, 0, 0.1843137, 1,
1.976662, 0.5824915, 1.125649, 1, 0, 0.1803922, 1,
2.041507, -0.7083423, 3.319199, 1, 0, 0.172549, 1,
2.04685, 1.958472, -0.5536817, 1, 0, 0.1686275, 1,
2.068738, 0.07872295, 0.6656591, 1, 0, 0.1607843, 1,
2.089361, 0.07449542, 1.205669, 1, 0, 0.1568628, 1,
2.128225, -0.3311807, 1.118075, 1, 0, 0.1490196, 1,
2.160823, -0.8497772, 1.815332, 1, 0, 0.145098, 1,
2.176959, -0.1294554, 0.4626698, 1, 0, 0.1372549, 1,
2.182052, 0.7873252, 0.16937, 1, 0, 0.1333333, 1,
2.214614, 0.4606127, 3.244564, 1, 0, 0.1254902, 1,
2.215354, -0.5418316, -0.7240152, 1, 0, 0.1215686, 1,
2.238352, 0.9073447, 2.678663, 1, 0, 0.1137255, 1,
2.245173, 1.065322, 2.020543, 1, 0, 0.1098039, 1,
2.289198, -0.45017, 2.813011, 1, 0, 0.1019608, 1,
2.290072, 1.079159, 0.6193665, 1, 0, 0.09411765, 1,
2.331232, -1.465456, 1.098256, 1, 0, 0.09019608, 1,
2.337653, 0.4283176, 1.303316, 1, 0, 0.08235294, 1,
2.352301, 0.2896292, 2.178316, 1, 0, 0.07843138, 1,
2.356671, 0.3225748, 0.6705679, 1, 0, 0.07058824, 1,
2.357065, 0.5649177, 1.294146, 1, 0, 0.06666667, 1,
2.386146, 1.349926, 2.31718, 1, 0, 0.05882353, 1,
2.417525, 0.3094448, 2.234327, 1, 0, 0.05490196, 1,
2.431493, 0.3159259, 1.501352, 1, 0, 0.04705882, 1,
2.471631, -0.5184492, 1.66966, 1, 0, 0.04313726, 1,
2.476183, 1.559035, 2.165236, 1, 0, 0.03529412, 1,
2.557124, -2.517228, 0.8472596, 1, 0, 0.03137255, 1,
2.56587, -0.18931, 1.084507, 1, 0, 0.02352941, 1,
2.68764, -1.001917, 1.893978, 1, 0, 0.01960784, 1,
2.857476, -0.9761623, 0.6900292, 1, 0, 0.01176471, 1,
3.114918, -1.029598, 1.803832, 1, 0, 0.007843138, 1
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
0.07725596, -3.9584, -7.195256, 0, -0.5, 0.5, 0.5,
0.07725596, -3.9584, -7.195256, 1, -0.5, 0.5, 0.5,
0.07725596, -3.9584, -7.195256, 1, 1.5, 0.5, 0.5,
0.07725596, -3.9584, -7.195256, 0, 1.5, 0.5, 0.5
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
-3.990173, 0.3227105, -7.195256, 0, -0.5, 0.5, 0.5,
-3.990173, 0.3227105, -7.195256, 1, -0.5, 0.5, 0.5,
-3.990173, 0.3227105, -7.195256, 1, 1.5, 0.5, 0.5,
-3.990173, 0.3227105, -7.195256, 0, 1.5, 0.5, 0.5
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
-3.990173, -3.9584, 0.05572557, 0, -0.5, 0.5, 0.5,
-3.990173, -3.9584, 0.05572557, 1, -0.5, 0.5, 0.5,
-3.990173, -3.9584, 0.05572557, 1, 1.5, 0.5, 0.5,
-3.990173, -3.9584, 0.05572557, 0, 1.5, 0.5, 0.5
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
-2, -2.970451, -5.521952,
3, -2.970451, -5.521952,
-2, -2.970451, -5.521952,
-2, -3.13511, -5.800836,
-1, -2.970451, -5.521952,
-1, -3.13511, -5.800836,
0, -2.970451, -5.521952,
0, -3.13511, -5.800836,
1, -2.970451, -5.521952,
1, -3.13511, -5.800836,
2, -2.970451, -5.521952,
2, -3.13511, -5.800836,
3, -2.970451, -5.521952,
3, -3.13511, -5.800836
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
-2, -3.464426, -6.358604, 0, -0.5, 0.5, 0.5,
-2, -3.464426, -6.358604, 1, -0.5, 0.5, 0.5,
-2, -3.464426, -6.358604, 1, 1.5, 0.5, 0.5,
-2, -3.464426, -6.358604, 0, 1.5, 0.5, 0.5,
-1, -3.464426, -6.358604, 0, -0.5, 0.5, 0.5,
-1, -3.464426, -6.358604, 1, -0.5, 0.5, 0.5,
-1, -3.464426, -6.358604, 1, 1.5, 0.5, 0.5,
-1, -3.464426, -6.358604, 0, 1.5, 0.5, 0.5,
0, -3.464426, -6.358604, 0, -0.5, 0.5, 0.5,
0, -3.464426, -6.358604, 1, -0.5, 0.5, 0.5,
0, -3.464426, -6.358604, 1, 1.5, 0.5, 0.5,
0, -3.464426, -6.358604, 0, 1.5, 0.5, 0.5,
1, -3.464426, -6.358604, 0, -0.5, 0.5, 0.5,
1, -3.464426, -6.358604, 1, -0.5, 0.5, 0.5,
1, -3.464426, -6.358604, 1, 1.5, 0.5, 0.5,
1, -3.464426, -6.358604, 0, 1.5, 0.5, 0.5,
2, -3.464426, -6.358604, 0, -0.5, 0.5, 0.5,
2, -3.464426, -6.358604, 1, -0.5, 0.5, 0.5,
2, -3.464426, -6.358604, 1, 1.5, 0.5, 0.5,
2, -3.464426, -6.358604, 0, 1.5, 0.5, 0.5,
3, -3.464426, -6.358604, 0, -0.5, 0.5, 0.5,
3, -3.464426, -6.358604, 1, -0.5, 0.5, 0.5,
3, -3.464426, -6.358604, 1, 1.5, 0.5, 0.5,
3, -3.464426, -6.358604, 0, 1.5, 0.5, 0.5
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
-3.051536, -2, -5.521952,
-3.051536, 3, -5.521952,
-3.051536, -2, -5.521952,
-3.207975, -2, -5.800836,
-3.051536, -1, -5.521952,
-3.207975, -1, -5.800836,
-3.051536, 0, -5.521952,
-3.207975, 0, -5.800836,
-3.051536, 1, -5.521952,
-3.207975, 1, -5.800836,
-3.051536, 2, -5.521952,
-3.207975, 2, -5.800836,
-3.051536, 3, -5.521952,
-3.207975, 3, -5.800836
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
-3.520854, -2, -6.358604, 0, -0.5, 0.5, 0.5,
-3.520854, -2, -6.358604, 1, -0.5, 0.5, 0.5,
-3.520854, -2, -6.358604, 1, 1.5, 0.5, 0.5,
-3.520854, -2, -6.358604, 0, 1.5, 0.5, 0.5,
-3.520854, -1, -6.358604, 0, -0.5, 0.5, 0.5,
-3.520854, -1, -6.358604, 1, -0.5, 0.5, 0.5,
-3.520854, -1, -6.358604, 1, 1.5, 0.5, 0.5,
-3.520854, -1, -6.358604, 0, 1.5, 0.5, 0.5,
-3.520854, 0, -6.358604, 0, -0.5, 0.5, 0.5,
-3.520854, 0, -6.358604, 1, -0.5, 0.5, 0.5,
-3.520854, 0, -6.358604, 1, 1.5, 0.5, 0.5,
-3.520854, 0, -6.358604, 0, 1.5, 0.5, 0.5,
-3.520854, 1, -6.358604, 0, -0.5, 0.5, 0.5,
-3.520854, 1, -6.358604, 1, -0.5, 0.5, 0.5,
-3.520854, 1, -6.358604, 1, 1.5, 0.5, 0.5,
-3.520854, 1, -6.358604, 0, 1.5, 0.5, 0.5,
-3.520854, 2, -6.358604, 0, -0.5, 0.5, 0.5,
-3.520854, 2, -6.358604, 1, -0.5, 0.5, 0.5,
-3.520854, 2, -6.358604, 1, 1.5, 0.5, 0.5,
-3.520854, 2, -6.358604, 0, 1.5, 0.5, 0.5,
-3.520854, 3, -6.358604, 0, -0.5, 0.5, 0.5,
-3.520854, 3, -6.358604, 1, -0.5, 0.5, 0.5,
-3.520854, 3, -6.358604, 1, 1.5, 0.5, 0.5,
-3.520854, 3, -6.358604, 0, 1.5, 0.5, 0.5
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
-3.051536, -2.970451, -4,
-3.051536, -2.970451, 4,
-3.051536, -2.970451, -4,
-3.207975, -3.13511, -4,
-3.051536, -2.970451, -2,
-3.207975, -3.13511, -2,
-3.051536, -2.970451, 0,
-3.207975, -3.13511, 0,
-3.051536, -2.970451, 2,
-3.207975, -3.13511, 2,
-3.051536, -2.970451, 4,
-3.207975, -3.13511, 4
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
-3.520854, -3.464426, -4, 0, -0.5, 0.5, 0.5,
-3.520854, -3.464426, -4, 1, -0.5, 0.5, 0.5,
-3.520854, -3.464426, -4, 1, 1.5, 0.5, 0.5,
-3.520854, -3.464426, -4, 0, 1.5, 0.5, 0.5,
-3.520854, -3.464426, -2, 0, -0.5, 0.5, 0.5,
-3.520854, -3.464426, -2, 1, -0.5, 0.5, 0.5,
-3.520854, -3.464426, -2, 1, 1.5, 0.5, 0.5,
-3.520854, -3.464426, -2, 0, 1.5, 0.5, 0.5,
-3.520854, -3.464426, 0, 0, -0.5, 0.5, 0.5,
-3.520854, -3.464426, 0, 1, -0.5, 0.5, 0.5,
-3.520854, -3.464426, 0, 1, 1.5, 0.5, 0.5,
-3.520854, -3.464426, 0, 0, 1.5, 0.5, 0.5,
-3.520854, -3.464426, 2, 0, -0.5, 0.5, 0.5,
-3.520854, -3.464426, 2, 1, -0.5, 0.5, 0.5,
-3.520854, -3.464426, 2, 1, 1.5, 0.5, 0.5,
-3.520854, -3.464426, 2, 0, 1.5, 0.5, 0.5,
-3.520854, -3.464426, 4, 0, -0.5, 0.5, 0.5,
-3.520854, -3.464426, 4, 1, -0.5, 0.5, 0.5,
-3.520854, -3.464426, 4, 1, 1.5, 0.5, 0.5,
-3.520854, -3.464426, 4, 0, 1.5, 0.5, 0.5
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
-3.051536, -2.970451, -5.521952,
-3.051536, 3.615872, -5.521952,
-3.051536, -2.970451, 5.633403,
-3.051536, 3.615872, 5.633403,
-3.051536, -2.970451, -5.521952,
-3.051536, -2.970451, 5.633403,
-3.051536, 3.615872, -5.521952,
-3.051536, 3.615872, 5.633403,
-3.051536, -2.970451, -5.521952,
3.206048, -2.970451, -5.521952,
-3.051536, -2.970451, 5.633403,
3.206048, -2.970451, 5.633403,
-3.051536, 3.615872, -5.521952,
3.206048, 3.615872, -5.521952,
-3.051536, 3.615872, 5.633403,
3.206048, 3.615872, 5.633403,
3.206048, -2.970451, -5.521952,
3.206048, 3.615872, -5.521952,
3.206048, -2.970451, 5.633403,
3.206048, 3.615872, 5.633403,
3.206048, -2.970451, -5.521952,
3.206048, -2.970451, 5.633403,
3.206048, 3.615872, -5.521952,
3.206048, 3.615872, 5.633403
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
var radius = 7.682252;
var distance = 34.17921;
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
mvMatrix.translate( -0.07725596, -0.3227105, -0.05572557 );
mvMatrix.scale( 1.327382, 1.261129, 0.7445932 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.17921);
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
isophenphos<-read.table("isophenphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isophenphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'isophenphos' not found
```

```r
y<-isophenphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'isophenphos' not found
```

```r
z<-isophenphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'isophenphos' not found
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
-2.960406, 0.001413976, -2.234268, 0, 0, 1, 1, 1,
-2.835207, -0.3537216, -3.327336, 1, 0, 0, 1, 1,
-2.630821, 2.128275, -0.09947402, 1, 0, 0, 1, 1,
-2.610376, 0.8500338, -0.9881256, 1, 0, 0, 1, 1,
-2.577567, -0.04895355, -1.071459, 1, 0, 0, 1, 1,
-2.421433, -0.487857, -2.940193, 1, 0, 0, 1, 1,
-2.3764, 0.005510407, -0.7597691, 0, 0, 0, 1, 1,
-2.342255, 0.6115914, -1.302218, 0, 0, 0, 1, 1,
-2.324646, -1.891593, -3.151066, 0, 0, 0, 1, 1,
-2.156781, -0.6893907, -2.969651, 0, 0, 0, 1, 1,
-2.137486, 2.051839, -0.369206, 0, 0, 0, 1, 1,
-2.099171, 0.5364875, -2.026497, 0, 0, 0, 1, 1,
-2.093943, 0.6575708, -0.9678507, 0, 0, 0, 1, 1,
-2.081131, -0.1875505, -0.3515153, 1, 1, 1, 1, 1,
-2.048211, 0.1472376, -0.8589912, 1, 1, 1, 1, 1,
-2.040931, -1.017622, -0.7963685, 1, 1, 1, 1, 1,
-1.995316, -2.448602, -1.496265, 1, 1, 1, 1, 1,
-1.974385, 0.6250522, -0.4269043, 1, 1, 1, 1, 1,
-1.972644, 0.4823373, -2.194433, 1, 1, 1, 1, 1,
-1.968934, -0.5435264, -2.061645, 1, 1, 1, 1, 1,
-1.968016, 0.7208518, -0.2152316, 1, 1, 1, 1, 1,
-1.936739, 0.05853625, -1.702692, 1, 1, 1, 1, 1,
-1.92361, 1.034773, 0.2979714, 1, 1, 1, 1, 1,
-1.903827, 0.6699613, -1.363764, 1, 1, 1, 1, 1,
-1.899777, -0.8762025, -2.524829, 1, 1, 1, 1, 1,
-1.893491, -0.2213666, -1.71976, 1, 1, 1, 1, 1,
-1.890508, 1.881901, -1.805751, 1, 1, 1, 1, 1,
-1.8783, -0.4990348, -3.662231, 1, 1, 1, 1, 1,
-1.864169, -1.471222, -1.061919, 0, 0, 1, 1, 1,
-1.858207, 0.433151, -0.533709, 1, 0, 0, 1, 1,
-1.856158, -0.04318879, -1.005262, 1, 0, 0, 1, 1,
-1.844122, -0.438647, -2.796227, 1, 0, 0, 1, 1,
-1.840551, 0.07205634, -2.040014, 1, 0, 0, 1, 1,
-1.823813, 0.1996772, -2.000519, 1, 0, 0, 1, 1,
-1.818992, 0.7675065, -2.592071, 0, 0, 0, 1, 1,
-1.808777, 0.9353544, 0.3145274, 0, 0, 0, 1, 1,
-1.800845, -1.076477, 0.9000548, 0, 0, 0, 1, 1,
-1.774737, 0.2946221, -1.05601, 0, 0, 0, 1, 1,
-1.766227, -0.4930235, -3.09879, 0, 0, 0, 1, 1,
-1.738532, 0.1619489, -0.3619249, 0, 0, 0, 1, 1,
-1.731346, 1.50215, -0.535018, 0, 0, 0, 1, 1,
-1.728773, 0.7365582, -1.593133, 1, 1, 1, 1, 1,
-1.726064, -0.6160679, -2.249416, 1, 1, 1, 1, 1,
-1.713276, -0.8425362, -3.03997, 1, 1, 1, 1, 1,
-1.708616, -2.044638, -2.484243, 1, 1, 1, 1, 1,
-1.702616, 0.7217653, -0.5424199, 1, 1, 1, 1, 1,
-1.696092, -0.8231911, -2.310413, 1, 1, 1, 1, 1,
-1.688653, 0.8628698, -0.0569985, 1, 1, 1, 1, 1,
-1.670935, 0.3399745, -0.4009515, 1, 1, 1, 1, 1,
-1.67046, 1.178943, -2.240228, 1, 1, 1, 1, 1,
-1.656047, -1.327863, -2.095582, 1, 1, 1, 1, 1,
-1.651882, 0.1889755, -2.282917, 1, 1, 1, 1, 1,
-1.646184, -2.283556, -3.066064, 1, 1, 1, 1, 1,
-1.630748, -2.734727, -3.338675, 1, 1, 1, 1, 1,
-1.627751, -0.1647882, -3.130584, 1, 1, 1, 1, 1,
-1.620723, -2.160037, -1.371038, 1, 1, 1, 1, 1,
-1.608074, 0.6319978, -1.82683, 0, 0, 1, 1, 1,
-1.582422, 1.696436, -1.440759, 1, 0, 0, 1, 1,
-1.578773, 0.9810089, 0.2067267, 1, 0, 0, 1, 1,
-1.572298, 0.8128871, -2.10272, 1, 0, 0, 1, 1,
-1.564909, 1.060887, 0.2590393, 1, 0, 0, 1, 1,
-1.56197, -0.4713725, -0.9888965, 1, 0, 0, 1, 1,
-1.553921, 0.8625549, 1.46752, 0, 0, 0, 1, 1,
-1.547838, -1.257509, -0.6809659, 0, 0, 0, 1, 1,
-1.528443, 1.616019, -0.5332895, 0, 0, 0, 1, 1,
-1.524339, -1.77633, -4.303034, 0, 0, 0, 1, 1,
-1.519156, -1.752724, -2.077669, 0, 0, 0, 1, 1,
-1.503729, 1.779572, 0.1760603, 0, 0, 0, 1, 1,
-1.492007, 0.06024101, -2.429981, 0, 0, 0, 1, 1,
-1.483621, -0.8032144, -0.6052203, 1, 1, 1, 1, 1,
-1.477158, 1.900035, 0.2230125, 1, 1, 1, 1, 1,
-1.465893, 0.4048522, -0.9419546, 1, 1, 1, 1, 1,
-1.430687, -1.13841, -3.303216, 1, 1, 1, 1, 1,
-1.429837, -0.2263198, -2.971482, 1, 1, 1, 1, 1,
-1.429086, -0.7239679, -1.132701, 1, 1, 1, 1, 1,
-1.426513, 0.4541594, -0.6143391, 1, 1, 1, 1, 1,
-1.405386, -0.5476257, -2.506608, 1, 1, 1, 1, 1,
-1.405339, 0.9927453, 0.6347221, 1, 1, 1, 1, 1,
-1.395227, -0.4793318, 0.01179006, 1, 1, 1, 1, 1,
-1.376108, 1.741465, -0.1362507, 1, 1, 1, 1, 1,
-1.369913, 0.008382972, -1.098627, 1, 1, 1, 1, 1,
-1.36927, 0.5358091, -0.416147, 1, 1, 1, 1, 1,
-1.362507, 0.4523674, 1.347422, 1, 1, 1, 1, 1,
-1.353372, -0.1190563, -0.4799349, 1, 1, 1, 1, 1,
-1.352117, 0.8036402, -1.672285, 0, 0, 1, 1, 1,
-1.345698, -0.3625978, -2.612389, 1, 0, 0, 1, 1,
-1.344801, 0.2360811, -2.290217, 1, 0, 0, 1, 1,
-1.304995, 0.2122316, -0.372764, 1, 0, 0, 1, 1,
-1.291568, -0.8762229, -1.610147, 1, 0, 0, 1, 1,
-1.284685, -0.1242389, -1.724113, 1, 0, 0, 1, 1,
-1.283167, 0.5907991, -1.248277, 0, 0, 0, 1, 1,
-1.282214, -1.244946, -2.005908, 0, 0, 0, 1, 1,
-1.280745, 1.564095, -0.7317064, 0, 0, 0, 1, 1,
-1.268701, 1.741778, -0.08045107, 0, 0, 0, 1, 1,
-1.267817, 0.1260022, -1.173007, 0, 0, 0, 1, 1,
-1.265324, 1.435989, -0.8089808, 0, 0, 0, 1, 1,
-1.262968, 0.2608223, -2.30584, 0, 0, 0, 1, 1,
-1.260041, 1.371008, -0.3592676, 1, 1, 1, 1, 1,
-1.259587, -0.2614123, -1.860232, 1, 1, 1, 1, 1,
-1.258076, 1.909321, -1.036113, 1, 1, 1, 1, 1,
-1.252842, -0.7695289, -1.5671, 1, 1, 1, 1, 1,
-1.251708, 0.4502836, -0.4784231, 1, 1, 1, 1, 1,
-1.245142, 0.5195726, 0.7809079, 1, 1, 1, 1, 1,
-1.239346, 0.2875228, -2.350505, 1, 1, 1, 1, 1,
-1.235958, 1.330629, 0.3294894, 1, 1, 1, 1, 1,
-1.230635, -0.8738195, -1.621325, 1, 1, 1, 1, 1,
-1.22612, -0.4759202, -3.711994, 1, 1, 1, 1, 1,
-1.225515, -0.126653, -1.760003, 1, 1, 1, 1, 1,
-1.218949, 0.7048197, -0.9791473, 1, 1, 1, 1, 1,
-1.215812, -1.544745, -0.5969459, 1, 1, 1, 1, 1,
-1.208622, -0.5044709, -1.975207, 1, 1, 1, 1, 1,
-1.207565, 0.4674115, -1.57034, 1, 1, 1, 1, 1,
-1.203502, -0.6712664, -1.367668, 0, 0, 1, 1, 1,
-1.195841, 0.9562498, -1.719305, 1, 0, 0, 1, 1,
-1.191883, -0.6643575, -1.759692, 1, 0, 0, 1, 1,
-1.184039, 0.5194462, -2.61484, 1, 0, 0, 1, 1,
-1.176309, 1.750339, -1.393629, 1, 0, 0, 1, 1,
-1.162459, -2.238017, -2.64536, 1, 0, 0, 1, 1,
-1.148083, 0.7400334, -1.433127, 0, 0, 0, 1, 1,
-1.142927, 1.684712, -0.9403723, 0, 0, 0, 1, 1,
-1.138292, 2.32899, 0.7075667, 0, 0, 0, 1, 1,
-1.130421, 3.519955, -0.227244, 0, 0, 0, 1, 1,
-1.113442, -0.0331024, -2.493213, 0, 0, 0, 1, 1,
-1.113274, -1.062428, -1.364395, 0, 0, 0, 1, 1,
-1.109878, -1.129618, -2.667496, 0, 0, 0, 1, 1,
-1.108027, 0.03482826, -1.776422, 1, 1, 1, 1, 1,
-1.107915, -0.6814916, -1.470981, 1, 1, 1, 1, 1,
-1.103649, -1.169676, -1.295519, 1, 1, 1, 1, 1,
-1.103211, -0.1363045, -1.070029, 1, 1, 1, 1, 1,
-1.093517, -0.02813906, -1.250836, 1, 1, 1, 1, 1,
-1.090608, -0.4579251, -0.9581638, 1, 1, 1, 1, 1,
-1.088221, 0.2697164, -2.812747, 1, 1, 1, 1, 1,
-1.084292, -1.096703, -0.9357024, 1, 1, 1, 1, 1,
-1.078624, -0.2552316, -0.1520243, 1, 1, 1, 1, 1,
-1.078447, 1.188943, 0.2406041, 1, 1, 1, 1, 1,
-1.071927, -0.5584819, -1.594544, 1, 1, 1, 1, 1,
-1.069854, -0.9984565, -3.130022, 1, 1, 1, 1, 1,
-1.067553, -0.4626546, -3.42544, 1, 1, 1, 1, 1,
-1.066787, -0.1502692, -0.1708152, 1, 1, 1, 1, 1,
-1.062316, -0.4421337, -2.04762, 1, 1, 1, 1, 1,
-1.054371, 0.9936201, -2.578028, 0, 0, 1, 1, 1,
-1.05108, 0.3371196, -1.153057, 1, 0, 0, 1, 1,
-1.044276, 0.467932, -1.656019, 1, 0, 0, 1, 1,
-1.042676, -0.09248506, -1.362571, 1, 0, 0, 1, 1,
-1.036016, 0.9831293, -1.877838, 1, 0, 0, 1, 1,
-1.035177, 0.3485137, -1.722728, 1, 0, 0, 1, 1,
-1.034639, -0.752211, -2.945562, 0, 0, 0, 1, 1,
-1.028606, -1.139661, -1.956833, 0, 0, 0, 1, 1,
-1.027417, -1.173942, -2.761842, 0, 0, 0, 1, 1,
-1.025452, -1.580799, -3.623216, 0, 0, 0, 1, 1,
-1.024372, -0.7447269, -1.889816, 0, 0, 0, 1, 1,
-1.023804, 0.6642491, -0.7493704, 0, 0, 0, 1, 1,
-1.022486, 1.257036, -0.6747083, 0, 0, 0, 1, 1,
-1.018961, -1.040323, -4.018943, 1, 1, 1, 1, 1,
-1.018594, -1.824859, -2.378414, 1, 1, 1, 1, 1,
-1.008909, -0.3319682, -2.233685, 1, 1, 1, 1, 1,
-1.008496, 0.2988591, -1.784955, 1, 1, 1, 1, 1,
-1.007626, 1.776981, 0.8773972, 1, 1, 1, 1, 1,
-1.001477, 2.367, -0.4067416, 1, 1, 1, 1, 1,
-0.9993192, -0.3352909, -1.927068, 1, 1, 1, 1, 1,
-0.9911557, -0.03003619, -2.466742, 1, 1, 1, 1, 1,
-0.9797148, 0.3645757, -0.5249645, 1, 1, 1, 1, 1,
-0.9685335, 1.437131, -0.5988525, 1, 1, 1, 1, 1,
-0.9646956, 0.4934763, -1.128054, 1, 1, 1, 1, 1,
-0.964344, 1.415842, 0.9646102, 1, 1, 1, 1, 1,
-0.9531005, 0.7884101, -1.558141, 1, 1, 1, 1, 1,
-0.9518983, 0.8164999, -0.4013734, 1, 1, 1, 1, 1,
-0.950627, -0.8896928, -3.181599, 1, 1, 1, 1, 1,
-0.9498588, -1.742776, -1.810903, 0, 0, 1, 1, 1,
-0.9467669, 1.336743, -0.459698, 1, 0, 0, 1, 1,
-0.9452583, -0.04885283, -2.615657, 1, 0, 0, 1, 1,
-0.9422991, -0.6193942, -1.369828, 1, 0, 0, 1, 1,
-0.9387006, 0.2389457, -1.11329, 1, 0, 0, 1, 1,
-0.9374295, 0.4257843, -2.746131, 1, 0, 0, 1, 1,
-0.9352114, -2.775305, -1.779337, 0, 0, 0, 1, 1,
-0.9346986, -1.375381, -4.222813, 0, 0, 0, 1, 1,
-0.9335912, 1.227749, -0.3890965, 0, 0, 0, 1, 1,
-0.928624, -0.03884999, 0.4067279, 0, 0, 0, 1, 1,
-0.9274614, -0.8203323, -1.954963, 0, 0, 0, 1, 1,
-0.9210798, 1.002263, -1.633065, 0, 0, 0, 1, 1,
-0.9142342, -0.04845427, -1.036358, 0, 0, 0, 1, 1,
-0.914004, -0.2563646, -0.4797257, 1, 1, 1, 1, 1,
-0.9076483, 0.3734416, -2.386544, 1, 1, 1, 1, 1,
-0.9076384, 0.3801911, -1.924341, 1, 1, 1, 1, 1,
-0.8993512, -1.382139, -2.240971, 1, 1, 1, 1, 1,
-0.8917952, -0.2715015, -2.941591, 1, 1, 1, 1, 1,
-0.8908994, 0.582136, -2.100006, 1, 1, 1, 1, 1,
-0.8905661, -0.07799621, -1.436527, 1, 1, 1, 1, 1,
-0.8853362, 1.325332, 0.6159671, 1, 1, 1, 1, 1,
-0.8847432, -1.572716, -3.493347, 1, 1, 1, 1, 1,
-0.8817628, -1.319631, -2.611657, 1, 1, 1, 1, 1,
-0.8811466, -1.87473, -1.857341, 1, 1, 1, 1, 1,
-0.8711073, -1.780292, -0.7912828, 1, 1, 1, 1, 1,
-0.8700414, -0.4033791, -0.7575431, 1, 1, 1, 1, 1,
-0.8687549, -0.2182623, -2.226907, 1, 1, 1, 1, 1,
-0.8633414, 0.5265698, 0.9195331, 1, 1, 1, 1, 1,
-0.8621562, 0.680103, -0.8745763, 0, 0, 1, 1, 1,
-0.8590468, -0.5205181, -2.196991, 1, 0, 0, 1, 1,
-0.8573952, 2.082848, -0.3467558, 1, 0, 0, 1, 1,
-0.855325, -1.08384, -2.154648, 1, 0, 0, 1, 1,
-0.8541273, 0.306448, -2.264983, 1, 0, 0, 1, 1,
-0.8520083, -0.7070617, -1.663252, 1, 0, 0, 1, 1,
-0.8505726, 1.173666, -1.568234, 0, 0, 0, 1, 1,
-0.8497744, 0.2593417, -2.936083, 0, 0, 0, 1, 1,
-0.8458215, -0.6929511, -1.676564, 0, 0, 0, 1, 1,
-0.8426799, -0.5873585, -3.606376, 0, 0, 0, 1, 1,
-0.8416865, 1.378048, -0.5672264, 0, 0, 0, 1, 1,
-0.8408231, -0.1792734, -0.1810814, 0, 0, 0, 1, 1,
-0.8313816, 0.33865, 0.2919915, 0, 0, 0, 1, 1,
-0.828822, -1.637982, -0.6690792, 1, 1, 1, 1, 1,
-0.8273719, 0.9781987, -0.8169121, 1, 1, 1, 1, 1,
-0.8181333, -2.874534, -1.323368, 1, 1, 1, 1, 1,
-0.8174087, -0.4143554, -0.8730288, 1, 1, 1, 1, 1,
-0.8160331, 0.7232217, -2.586502, 1, 1, 1, 1, 1,
-0.8156806, 0.8163602, 0.0797003, 1, 1, 1, 1, 1,
-0.8127353, 0.6243661, -0.3404664, 1, 1, 1, 1, 1,
-0.8088451, -0.6664594, -1.212286, 1, 1, 1, 1, 1,
-0.8084107, -0.02775611, -2.581917, 1, 1, 1, 1, 1,
-0.7985497, 0.4283972, -2.163805, 1, 1, 1, 1, 1,
-0.7967439, -0.4982002, -2.898769, 1, 1, 1, 1, 1,
-0.7904765, 0.5640805, -2.678075, 1, 1, 1, 1, 1,
-0.7904053, 1.567068, 1.101551, 1, 1, 1, 1, 1,
-0.7897149, -0.8458872, -3.168442, 1, 1, 1, 1, 1,
-0.7846981, 0.7439141, -0.853976, 1, 1, 1, 1, 1,
-0.7790776, 0.1210488, -0.08010247, 0, 0, 1, 1, 1,
-0.7737744, -0.1786321, -1.049765, 1, 0, 0, 1, 1,
-0.7731435, -2.704691, -2.684509, 1, 0, 0, 1, 1,
-0.7674865, -1.302127, -2.548482, 1, 0, 0, 1, 1,
-0.7647962, 1.948243, 0.3654385, 1, 0, 0, 1, 1,
-0.7619442, -2.21328, -3.291679, 1, 0, 0, 1, 1,
-0.7575594, -0.7456341, -1.015554, 0, 0, 0, 1, 1,
-0.7564802, -0.4534582, -2.731678, 0, 0, 0, 1, 1,
-0.756413, 1.056387, -2.133778, 0, 0, 0, 1, 1,
-0.7552755, -2.012536, -3.226462, 0, 0, 0, 1, 1,
-0.7544438, 1.318352, 1.505348, 0, 0, 0, 1, 1,
-0.7539848, 0.3152255, -2.987983, 0, 0, 0, 1, 1,
-0.7478881, -1.07226, -3.443802, 0, 0, 0, 1, 1,
-0.7477344, 0.1336463, -2.244712, 1, 1, 1, 1, 1,
-0.7439352, 0.01456357, -2.886303, 1, 1, 1, 1, 1,
-0.740401, 0.3039425, -1.435677, 1, 1, 1, 1, 1,
-0.7352919, 0.06931703, -1.355089, 1, 1, 1, 1, 1,
-0.7342152, 1.752828, 0.6069707, 1, 1, 1, 1, 1,
-0.7260348, 1.402069, 0.03907221, 1, 1, 1, 1, 1,
-0.7224553, -1.478447, -2.566844, 1, 1, 1, 1, 1,
-0.7185514, 0.2649752, -1.892325, 1, 1, 1, 1, 1,
-0.7144122, 0.1090592, -2.375479, 1, 1, 1, 1, 1,
-0.7139664, 1.892618, 0.09515069, 1, 1, 1, 1, 1,
-0.713023, 0.8098109, -0.4523587, 1, 1, 1, 1, 1,
-0.7105209, 0.418009, -0.9687032, 1, 1, 1, 1, 1,
-0.7079933, -0.4031053, -1.53797, 1, 1, 1, 1, 1,
-0.7044615, -0.1397841, -0.5086883, 1, 1, 1, 1, 1,
-0.7020124, -2.090544, -4.291475, 1, 1, 1, 1, 1,
-0.6949092, -0.9363221, -2.617964, 0, 0, 1, 1, 1,
-0.6862193, 2.433235, -0.04630481, 1, 0, 0, 1, 1,
-0.6826351, -0.001508741, -1.583336, 1, 0, 0, 1, 1,
-0.6820071, -0.01522644, -1.448863, 1, 0, 0, 1, 1,
-0.677777, 1.050121, -0.1919723, 1, 0, 0, 1, 1,
-0.6733293, -0.6559047, -3.91938, 1, 0, 0, 1, 1,
-0.6712204, -1.478005, -2.381039, 0, 0, 0, 1, 1,
-0.6680921, 0.5918841, -1.26543, 0, 0, 0, 1, 1,
-0.6649724, 1.344077, -0.1435062, 0, 0, 0, 1, 1,
-0.6586198, 0.8351873, 0.9138397, 0, 0, 0, 1, 1,
-0.6584814, 0.5214451, -2.187696, 0, 0, 0, 1, 1,
-0.6506593, 0.5797732, -1.097801, 0, 0, 0, 1, 1,
-0.6478931, -0.5489079, -2.409583, 0, 0, 0, 1, 1,
-0.6458111, -0.8062778, -0.7410815, 1, 1, 1, 1, 1,
-0.6367079, -1.282727, -2.060294, 1, 1, 1, 1, 1,
-0.6315874, -2.287663, -3.945439, 1, 1, 1, 1, 1,
-0.61334, 1.176023, -1.540565, 1, 1, 1, 1, 1,
-0.612729, 0.8219399, -0.2802529, 1, 1, 1, 1, 1,
-0.6123804, -0.1777964, -1.32989, 1, 1, 1, 1, 1,
-0.6095569, 0.5618649, -0.4459015, 1, 1, 1, 1, 1,
-0.6082262, -0.2805679, -1.552372, 1, 1, 1, 1, 1,
-0.5999879, 0.02748574, -1.41968, 1, 1, 1, 1, 1,
-0.5980417, -1.659587, -2.053074, 1, 1, 1, 1, 1,
-0.5978274, -0.7627733, -1.810616, 1, 1, 1, 1, 1,
-0.5942297, 1.484107, -0.4506664, 1, 1, 1, 1, 1,
-0.5893573, -0.09643777, -3.501707, 1, 1, 1, 1, 1,
-0.5892473, 0.8521664, -0.1436809, 1, 1, 1, 1, 1,
-0.5886188, 0.5393148, 0.6462719, 1, 1, 1, 1, 1,
-0.5881802, 0.6958405, 0.6893747, 0, 0, 1, 1, 1,
-0.5848493, -0.9682558, -4.531826, 1, 0, 0, 1, 1,
-0.5803137, -0.7956558, -2.428246, 1, 0, 0, 1, 1,
-0.5798814, 0.897716, -0.6568531, 1, 0, 0, 1, 1,
-0.5763087, 1.082811, -0.2030192, 1, 0, 0, 1, 1,
-0.5688112, 0.5750942, -2.336775, 1, 0, 0, 1, 1,
-0.5673281, -0.7154872, -3.055944, 0, 0, 0, 1, 1,
-0.5654465, -1.848756, -3.201875, 0, 0, 0, 1, 1,
-0.5651046, -0.5596072, -1.752423, 0, 0, 0, 1, 1,
-0.55968, -1.637575, -2.938606, 0, 0, 0, 1, 1,
-0.5570451, -1.032485, -2.372192, 0, 0, 0, 1, 1,
-0.556863, -2.287513, -2.224738, 0, 0, 0, 1, 1,
-0.5565736, 1.942405, 1.637826, 0, 0, 0, 1, 1,
-0.5564382, -0.07382502, -1.4694, 1, 1, 1, 1, 1,
-0.5548351, 0.8463483, 1.268573, 1, 1, 1, 1, 1,
-0.5516296, -0.003650717, -0.7246149, 1, 1, 1, 1, 1,
-0.5512051, 0.6289622, 1.075023, 1, 1, 1, 1, 1,
-0.5494383, 0.6408427, -0.1078441, 1, 1, 1, 1, 1,
-0.5483961, 1.186506, -3.058221, 1, 1, 1, 1, 1,
-0.5439568, -0.2695667, -1.898908, 1, 1, 1, 1, 1,
-0.5414165, -1.010946, -2.131554, 1, 1, 1, 1, 1,
-0.5407578, 0.03019582, -1.099234, 1, 1, 1, 1, 1,
-0.5402436, -1.262064, -3.195632, 1, 1, 1, 1, 1,
-0.5401735, 0.1186152, -1.917007, 1, 1, 1, 1, 1,
-0.5395896, -1.899451, -1.281134, 1, 1, 1, 1, 1,
-0.5377159, -0.5722062, -2.657556, 1, 1, 1, 1, 1,
-0.5326456, 0.1700647, -1.573198, 1, 1, 1, 1, 1,
-0.5281964, -1.264538, -2.01353, 1, 1, 1, 1, 1,
-0.5219371, 0.1996986, -2.524457, 0, 0, 1, 1, 1,
-0.5140464, 0.8275002, -1.731772, 1, 0, 0, 1, 1,
-0.5136549, -0.3899681, -1.782382, 1, 0, 0, 1, 1,
-0.5103544, 0.3059001, -3.514375, 1, 0, 0, 1, 1,
-0.5090207, 1.061002, 0.3277032, 1, 0, 0, 1, 1,
-0.5083523, -0.5172269, -4.772309, 1, 0, 0, 1, 1,
-0.4984218, 0.5131025, -0.1935802, 0, 0, 0, 1, 1,
-0.4807836, -0.621157, -2.81972, 0, 0, 0, 1, 1,
-0.4797325, -1.10915, -3.031799, 0, 0, 0, 1, 1,
-0.4754651, 0.4412141, 1.861943, 0, 0, 0, 1, 1,
-0.4726368, -0.7162725, -2.677195, 0, 0, 0, 1, 1,
-0.4726074, 0.4345039, -0.4831974, 0, 0, 0, 1, 1,
-0.4679165, 0.7506015, -0.5626833, 0, 0, 0, 1, 1,
-0.4661563, 0.8949618, -0.9097791, 1, 1, 1, 1, 1,
-0.4640882, -0.06927099, -0.3296129, 1, 1, 1, 1, 1,
-0.4640611, 0.132973, -1.875889, 1, 1, 1, 1, 1,
-0.4578842, -1.228845, -1.928417, 1, 1, 1, 1, 1,
-0.4541462, -0.9495454, -3.447208, 1, 1, 1, 1, 1,
-0.4512531, 1.851581, -0.2778133, 1, 1, 1, 1, 1,
-0.4509276, -0.7595713, -3.048769, 1, 1, 1, 1, 1,
-0.4461653, -0.04199518, -3.150437, 1, 1, 1, 1, 1,
-0.4445932, 0.6635491, -0.2721744, 1, 1, 1, 1, 1,
-0.4406919, -1.577843, -3.26273, 1, 1, 1, 1, 1,
-0.4385998, -0.2032304, -3.219707, 1, 1, 1, 1, 1,
-0.4385053, -0.5287817, -3.472662, 1, 1, 1, 1, 1,
-0.4328396, -1.03286, -1.268344, 1, 1, 1, 1, 1,
-0.4318741, 0.7475657, -0.1486033, 1, 1, 1, 1, 1,
-0.4307719, -2.542819, -2.548749, 1, 1, 1, 1, 1,
-0.4306459, -0.1294346, -1.289448, 0, 0, 1, 1, 1,
-0.4277264, -1.753481, -2.395269, 1, 0, 0, 1, 1,
-0.4274839, -0.1192342, -3.104772, 1, 0, 0, 1, 1,
-0.4266301, -0.1362193, -2.236545, 1, 0, 0, 1, 1,
-0.4216821, -1.919428, -2.416029, 1, 0, 0, 1, 1,
-0.4209859, 0.6377426, -0.05172354, 1, 0, 0, 1, 1,
-0.4180654, 1.589104, 0.8013222, 0, 0, 0, 1, 1,
-0.4179829, 0.8281491, -1.927617, 0, 0, 0, 1, 1,
-0.4134257, -0.4352373, -3.835503, 0, 0, 0, 1, 1,
-0.4133262, -1.156182, -1.130856, 0, 0, 0, 1, 1,
-0.400744, -0.002041578, -1.65537, 0, 0, 0, 1, 1,
-0.395371, -0.5215448, -3.407557, 0, 0, 0, 1, 1,
-0.3915422, -0.3480255, -0.033358, 0, 0, 0, 1, 1,
-0.3914437, -1.327977, -2.01346, 1, 1, 1, 1, 1,
-0.3902955, 1.129127, 0.03000312, 1, 1, 1, 1, 1,
-0.3878407, -1.817542, -2.506668, 1, 1, 1, 1, 1,
-0.3844127, 0.2477087, -0.3325503, 1, 1, 1, 1, 1,
-0.3833232, -0.1219236, -3.104632, 1, 1, 1, 1, 1,
-0.3802793, 1.043109, -1.077854, 1, 1, 1, 1, 1,
-0.3762306, 1.053789, -1.589947, 1, 1, 1, 1, 1,
-0.3761279, -0.3807538, -2.614885, 1, 1, 1, 1, 1,
-0.3757696, -0.03508929, 0.2914349, 1, 1, 1, 1, 1,
-0.3697286, -1.598912, -4.123014, 1, 1, 1, 1, 1,
-0.361953, 0.6793721, -0.1715763, 1, 1, 1, 1, 1,
-0.3603801, 1.080735, -0.6859253, 1, 1, 1, 1, 1,
-0.3560706, -0.3747964, -2.599787, 1, 1, 1, 1, 1,
-0.3531952, 0.04531645, -0.709682, 1, 1, 1, 1, 1,
-0.3523321, -0.4811052, -1.917585, 1, 1, 1, 1, 1,
-0.344813, -0.2006274, -2.289012, 0, 0, 1, 1, 1,
-0.3437896, -1.149543, -1.718475, 1, 0, 0, 1, 1,
-0.3421621, 0.2120889, -0.8722981, 1, 0, 0, 1, 1,
-0.3410386, 1.190027, -0.9349537, 1, 0, 0, 1, 1,
-0.3395318, -1.294824, -2.887084, 1, 0, 0, 1, 1,
-0.3303493, -0.111718, -1.599433, 1, 0, 0, 1, 1,
-0.322059, -0.3137952, -1.697559, 0, 0, 0, 1, 1,
-0.3216245, 1.863552, 1.200296, 0, 0, 0, 1, 1,
-0.3173483, 0.8270269, 0.676234, 0, 0, 0, 1, 1,
-0.3125367, 1.600868, -1.851306, 0, 0, 0, 1, 1,
-0.3022775, 1.619847, -0.3665397, 0, 0, 0, 1, 1,
-0.2999854, 1.13046, -1.027302, 0, 0, 0, 1, 1,
-0.2953798, 1.51361, 0.01833356, 0, 0, 0, 1, 1,
-0.2944698, 2.354659, 1.116005, 1, 1, 1, 1, 1,
-0.2939162, 0.1616057, -0.6800717, 1, 1, 1, 1, 1,
-0.2935629, 0.6180115, 0.3843598, 1, 1, 1, 1, 1,
-0.2911213, 0.8308439, -0.3360326, 1, 1, 1, 1, 1,
-0.2895849, -0.8261628, -2.88577, 1, 1, 1, 1, 1,
-0.2860124, -1.853514, -2.973439, 1, 1, 1, 1, 1,
-0.2835015, -1.40778, -3.382627, 1, 1, 1, 1, 1,
-0.2780017, -0.2263197, -2.992009, 1, 1, 1, 1, 1,
-0.2769373, 0.733891, -0.7107494, 1, 1, 1, 1, 1,
-0.2749961, -0.806555, -1.700004, 1, 1, 1, 1, 1,
-0.2684986, 0.083265, -1.217365, 1, 1, 1, 1, 1,
-0.2639678, -0.3843935, -3.07554, 1, 1, 1, 1, 1,
-0.2623369, 0.7115132, 1.386915, 1, 1, 1, 1, 1,
-0.2620142, 0.6358519, 1.080396, 1, 1, 1, 1, 1,
-0.2528487, 0.4181347, 0.1023616, 1, 1, 1, 1, 1,
-0.252198, -1.042172, -1.513208, 0, 0, 1, 1, 1,
-0.2521598, 1.307492, 1.501055, 1, 0, 0, 1, 1,
-0.2514121, 0.4537774, -0.355126, 1, 0, 0, 1, 1,
-0.2502992, -0.8110397, -3.248335, 1, 0, 0, 1, 1,
-0.2487178, -0.2364865, -0.1744548, 1, 0, 0, 1, 1,
-0.2454651, 1.564325, 0.06922238, 1, 0, 0, 1, 1,
-0.2365963, -0.4688476, -3.44388, 0, 0, 0, 1, 1,
-0.2361906, -1.099857, -5.359496, 0, 0, 0, 1, 1,
-0.234646, -0.5304079, -3.519391, 0, 0, 0, 1, 1,
-0.2284409, 0.1693647, -0.9733922, 0, 0, 0, 1, 1,
-0.2268127, 0.9023202, -0.2186126, 0, 0, 0, 1, 1,
-0.2227661, -0.5740606, -1.731431, 0, 0, 0, 1, 1,
-0.2216565, -0.3038739, -2.984754, 0, 0, 0, 1, 1,
-0.2149562, -0.6441131, -3.596561, 1, 1, 1, 1, 1,
-0.2138971, -0.6946496, -2.804552, 1, 1, 1, 1, 1,
-0.2113134, 1.124157, 1.787153, 1, 1, 1, 1, 1,
-0.2089486, -1.042581, -2.595632, 1, 1, 1, 1, 1,
-0.2084548, 0.9857417, -1.236297, 1, 1, 1, 1, 1,
-0.2065112, 1.549016, -2.375241, 1, 1, 1, 1, 1,
-0.2002907, -0.2815655, -2.46546, 1, 1, 1, 1, 1,
-0.1997412, -0.1107874, -1.637533, 1, 1, 1, 1, 1,
-0.1937884, -2.236229, -3.774442, 1, 1, 1, 1, 1,
-0.1936912, -0.5470595, -2.578675, 1, 1, 1, 1, 1,
-0.1897835, 0.1732741, -0.1578751, 1, 1, 1, 1, 1,
-0.1879694, 0.2980372, -1.014835, 1, 1, 1, 1, 1,
-0.1875896, -0.6591649, -3.310398, 1, 1, 1, 1, 1,
-0.1871845, 0.9590961, -0.3258536, 1, 1, 1, 1, 1,
-0.1856893, -0.06778472, -0.2055345, 1, 1, 1, 1, 1,
-0.1826116, -0.7268202, -5.11707, 0, 0, 1, 1, 1,
-0.1815031, -0.1188578, -3.205387, 1, 0, 0, 1, 1,
-0.1803583, -0.2881381, -3.821059, 1, 0, 0, 1, 1,
-0.180094, 0.2912986, 0.3258918, 1, 0, 0, 1, 1,
-0.1770178, 0.4904845, -0.2267427, 1, 0, 0, 1, 1,
-0.1597658, -0.7921959, -4.119537, 1, 0, 0, 1, 1,
-0.1577227, 0.4788012, -0.3082054, 0, 0, 0, 1, 1,
-0.1567543, -1.202287, -2.705298, 0, 0, 0, 1, 1,
-0.1563473, 1.769281, 1.426269, 0, 0, 0, 1, 1,
-0.1527382, -0.6718519, -1.942889, 0, 0, 0, 1, 1,
-0.1523895, -1.927301, -1.322733, 0, 0, 0, 1, 1,
-0.1484841, 1.315435, -1.585586, 0, 0, 0, 1, 1,
-0.1448086, -1.260287, -2.929404, 0, 0, 0, 1, 1,
-0.1444375, 1.39053, 0.1979674, 1, 1, 1, 1, 1,
-0.1427988, 2.017504, -0.2342498, 1, 1, 1, 1, 1,
-0.1424421, 0.3689551, 0.03347588, 1, 1, 1, 1, 1,
-0.1406904, -0.1418981, -2.588323, 1, 1, 1, 1, 1,
-0.1397992, 0.9901181, -0.1772632, 1, 1, 1, 1, 1,
-0.13897, -2.407368, -3.154227, 1, 1, 1, 1, 1,
-0.1381238, 0.4220968, -0.4071011, 1, 1, 1, 1, 1,
-0.1368793, -1.17458, -3.026125, 1, 1, 1, 1, 1,
-0.1366287, -0.4977184, -2.344373, 1, 1, 1, 1, 1,
-0.1359423, 0.1987887, -0.5537068, 1, 1, 1, 1, 1,
-0.1328591, 0.07009475, -0.4289163, 1, 1, 1, 1, 1,
-0.1310305, -0.3903034, -3.730942, 1, 1, 1, 1, 1,
-0.1303493, 1.728475, -0.4499778, 1, 1, 1, 1, 1,
-0.1286296, -1.387003, -4.45793, 1, 1, 1, 1, 1,
-0.1277015, 0.1073368, -2.226157, 1, 1, 1, 1, 1,
-0.126922, -0.2570092, -2.606646, 0, 0, 1, 1, 1,
-0.1257013, -0.7438174, -4.503586, 1, 0, 0, 1, 1,
-0.1212378, 0.1540664, -1.636761, 1, 0, 0, 1, 1,
-0.1202537, -1.595946, -2.80737, 1, 0, 0, 1, 1,
-0.1154982, 0.4309382, -1.754021, 1, 0, 0, 1, 1,
-0.1105329, 1.0355, -0.4802215, 1, 0, 0, 1, 1,
-0.1095596, -0.09013727, -1.572621, 0, 0, 0, 1, 1,
-0.1076664, 1.85013, -1.122123, 0, 0, 0, 1, 1,
-0.1069226, -1.440624, -2.175798, 0, 0, 0, 1, 1,
-0.106898, 1.537943, 0.5719573, 0, 0, 0, 1, 1,
-0.1017456, -0.1748798, -3.173872, 0, 0, 0, 1, 1,
-0.1012705, 0.68897, -1.595761, 0, 0, 0, 1, 1,
-0.1012369, 0.5473725, 0.9987641, 0, 0, 0, 1, 1,
-0.09868862, -1.730847, -3.710407, 1, 1, 1, 1, 1,
-0.09439453, 1.404315, -0.9359106, 1, 1, 1, 1, 1,
-0.09284192, -1.088889, -2.494503, 1, 1, 1, 1, 1,
-0.09123062, -0.1929742, -3.355282, 1, 1, 1, 1, 1,
-0.08967249, 0.633812, 1.048641, 1, 1, 1, 1, 1,
-0.08719749, 0.3325468, 0.6030101, 1, 1, 1, 1, 1,
-0.08621261, -1.692335, -3.89776, 1, 1, 1, 1, 1,
-0.083396, -0.4152244, -4.273616, 1, 1, 1, 1, 1,
-0.0827411, -0.1877135, -2.188676, 1, 1, 1, 1, 1,
-0.07349115, -0.2844902, -2.273863, 1, 1, 1, 1, 1,
-0.06689974, 1.450334, 1.2735, 1, 1, 1, 1, 1,
-0.05873257, -0.5574189, -3.5729, 1, 1, 1, 1, 1,
-0.05370103, 0.6705108, -0.7413734, 1, 1, 1, 1, 1,
-0.05077258, 0.6876779, 1.218228, 1, 1, 1, 1, 1,
-0.04662454, -1.3778, -4.595222, 1, 1, 1, 1, 1,
-0.04278013, -0.1523608, -2.013432, 0, 0, 1, 1, 1,
-0.04151313, 2.137859, 1.715022, 1, 0, 0, 1, 1,
-0.0412385, 1.20583, 0.4571797, 1, 0, 0, 1, 1,
-0.04119115, 1.95491, 0.95084, 1, 0, 0, 1, 1,
-0.04072721, 0.06114054, 0.2537479, 1, 0, 0, 1, 1,
-0.04058355, 0.007449686, -1.632012, 1, 0, 0, 1, 1,
-0.04056895, 0.7275267, -1.343125, 0, 0, 0, 1, 1,
-0.02870631, 1.347783, 0.5030176, 0, 0, 0, 1, 1,
-0.0284131, -0.6131938, -3.25047, 0, 0, 0, 1, 1,
-0.02550984, -1.363709, -1.680114, 0, 0, 0, 1, 1,
-0.02459548, -0.3685965, -2.563427, 0, 0, 0, 1, 1,
-0.02198325, -2.037527, -4.763825, 0, 0, 0, 1, 1,
-0.02152105, -0.153839, -3.385899, 0, 0, 0, 1, 1,
-0.02112124, -0.7363145, -2.570898, 1, 1, 1, 1, 1,
-0.0196214, 0.04337879, -0.9957419, 1, 1, 1, 1, 1,
-0.01935092, -0.05441442, -3.156417, 1, 1, 1, 1, 1,
-0.01842958, -1.326433, -4.417171, 1, 1, 1, 1, 1,
-0.01665069, -1.68834, -3.314105, 1, 1, 1, 1, 1,
-0.01606634, 1.584573, -2.030365, 1, 1, 1, 1, 1,
-0.01455001, -2.203332, -3.900606, 1, 1, 1, 1, 1,
-0.00760809, 1.343646, -0.01326383, 1, 1, 1, 1, 1,
-0.001737403, 0.3552687, 0.6442982, 1, 1, 1, 1, 1,
-0.001642628, 0.952469, 0.3283646, 1, 1, 1, 1, 1,
0.01223551, -0.8302997, 4.222382, 1, 1, 1, 1, 1,
0.01394754, 1.605705, -0.7579636, 1, 1, 1, 1, 1,
0.01470496, 0.517513, 0.1067203, 1, 1, 1, 1, 1,
0.01583925, -0.4098297, 3.271901, 1, 1, 1, 1, 1,
0.01846896, -1.179572, 3.775436, 1, 1, 1, 1, 1,
0.02266798, -0.08128247, 2.221197, 0, 0, 1, 1, 1,
0.02339141, -0.2152275, 2.419235, 1, 0, 0, 1, 1,
0.02528149, -0.3702476, 1.269318, 1, 0, 0, 1, 1,
0.02562748, -0.7037, 4.344251, 1, 0, 0, 1, 1,
0.02625042, 0.7614869, -1.7533, 1, 0, 0, 1, 1,
0.02682673, 1.820797, -0.05835642, 1, 0, 0, 1, 1,
0.02744242, -0.2367458, 4.241928, 0, 0, 0, 1, 1,
0.02937081, 1.197659, 0.04270315, 0, 0, 0, 1, 1,
0.02952478, -2.524177, 4.367332, 0, 0, 0, 1, 1,
0.03272935, -0.4094957, 2.464181, 0, 0, 0, 1, 1,
0.03458818, 0.5338783, -1.196433, 0, 0, 0, 1, 1,
0.03521573, -0.7415423, 3.398339, 0, 0, 0, 1, 1,
0.03612909, -0.1089564, 2.985235, 0, 0, 0, 1, 1,
0.03721171, 1.630066, -0.3946294, 1, 1, 1, 1, 1,
0.03808472, -1.201243, 1.088821, 1, 1, 1, 1, 1,
0.04058852, 0.66365, -1.032949, 1, 1, 1, 1, 1,
0.0447732, -0.1458094, 2.637642, 1, 1, 1, 1, 1,
0.05488976, -0.4104521, 4.045637, 1, 1, 1, 1, 1,
0.05898602, 2.40177, -2.005781, 1, 1, 1, 1, 1,
0.0667261, 1.422456, 0.3388349, 1, 1, 1, 1, 1,
0.06694255, -0.4428168, 5.394588, 1, 1, 1, 1, 1,
0.08240516, 0.3200483, 0.8428252, 1, 1, 1, 1, 1,
0.0851256, 0.8217087, -0.04868025, 1, 1, 1, 1, 1,
0.08818767, 1.119453, -0.4208562, 1, 1, 1, 1, 1,
0.0891571, 0.1888618, 3.102043, 1, 1, 1, 1, 1,
0.09016914, -1.173433, 3.631428, 1, 1, 1, 1, 1,
0.09037446, 2.222749, -0.06538759, 1, 1, 1, 1, 1,
0.0976905, -1.483255, 1.60553, 1, 1, 1, 1, 1,
0.09865096, 1.221766, -0.1643526, 0, 0, 1, 1, 1,
0.1018144, 0.8281289, -1.155249, 1, 0, 0, 1, 1,
0.1077826, 0.4885601, -0.3480754, 1, 0, 0, 1, 1,
0.1102739, 1.319662, 1.102667, 1, 0, 0, 1, 1,
0.1146476, 0.6031581, 0.3407682, 1, 0, 0, 1, 1,
0.1155965, 1.586307, -0.2870568, 1, 0, 0, 1, 1,
0.1165813, 0.01836669, 0.01206725, 0, 0, 0, 1, 1,
0.1174224, -0.2284563, 1.985187, 0, 0, 0, 1, 1,
0.1240255, 1.041191, -0.3909715, 0, 0, 0, 1, 1,
0.1247546, 0.1515081, 1.88968, 0, 0, 0, 1, 1,
0.1264863, 0.5234728, -1.165845, 0, 0, 0, 1, 1,
0.131446, 0.7090415, -0.6655833, 0, 0, 0, 1, 1,
0.1318083, 0.4285276, 0.9112902, 0, 0, 0, 1, 1,
0.1340957, -0.3377557, 2.857538, 1, 1, 1, 1, 1,
0.1361326, 0.6898396, 0.8269364, 1, 1, 1, 1, 1,
0.1364155, 0.07385128, 1.367015, 1, 1, 1, 1, 1,
0.1367405, -1.572498, 5.470947, 1, 1, 1, 1, 1,
0.138693, 1.309479, 0.9944218, 1, 1, 1, 1, 1,
0.1442108, 0.03384052, -0.4954482, 1, 1, 1, 1, 1,
0.1487746, 0.7139335, 1.311702, 1, 1, 1, 1, 1,
0.1512088, 0.1647035, 0.282779, 1, 1, 1, 1, 1,
0.1516079, 1.050225, 1.256328, 1, 1, 1, 1, 1,
0.1527458, 0.2507498, -0.3690622, 1, 1, 1, 1, 1,
0.1546788, -1.103612, 3.485999, 1, 1, 1, 1, 1,
0.1554369, -0.0934521, 3.220356, 1, 1, 1, 1, 1,
0.1578396, 0.1715904, 1.436526, 1, 1, 1, 1, 1,
0.15804, 1.214552, 0.1407149, 1, 1, 1, 1, 1,
0.1588241, -1.139252, 3.048548, 1, 1, 1, 1, 1,
0.1592803, -0.8224496, 3.323395, 0, 0, 1, 1, 1,
0.1697035, 0.05910006, 0.8072023, 1, 0, 0, 1, 1,
0.1713741, -0.879552, 2.317776, 1, 0, 0, 1, 1,
0.1745969, 0.6288236, -0.06331202, 1, 0, 0, 1, 1,
0.1758261, -0.3727938, 1.854659, 1, 0, 0, 1, 1,
0.1767925, 1.157416, 0.09899201, 1, 0, 0, 1, 1,
0.1906034, 1.19953, 0.4604398, 0, 0, 0, 1, 1,
0.200898, 1.485123, 1.893083, 0, 0, 0, 1, 1,
0.2018803, 0.6607889, 0.5062771, 0, 0, 0, 1, 1,
0.2106895, -2.100216, 2.873926, 0, 0, 0, 1, 1,
0.2140911, 0.5413249, 0.1944576, 0, 0, 0, 1, 1,
0.2150946, 0.5809924, 1.376848, 0, 0, 0, 1, 1,
0.2152387, -1.972181, 1.379553, 0, 0, 0, 1, 1,
0.2155596, -0.870357, 4.935555, 1, 1, 1, 1, 1,
0.2161355, 1.060606, -0.2223669, 1, 1, 1, 1, 1,
0.2215368, -1.435439, 3.31579, 1, 1, 1, 1, 1,
0.2234986, 0.9877183, 0.9644321, 1, 1, 1, 1, 1,
0.2241145, -0.2885276, 2.950112, 1, 1, 1, 1, 1,
0.2266673, -1.808963, 3.78067, 1, 1, 1, 1, 1,
0.2320543, 0.4964288, 0.187203, 1, 1, 1, 1, 1,
0.2324617, -0.108445, 0.5602568, 1, 1, 1, 1, 1,
0.2337816, 0.9977868, 0.09270999, 1, 1, 1, 1, 1,
0.2344974, 0.9204082, -0.2934598, 1, 1, 1, 1, 1,
0.2373251, 0.6172708, -1.635671, 1, 1, 1, 1, 1,
0.2415953, 0.686848, 0.6183483, 1, 1, 1, 1, 1,
0.2450274, 0.1954686, 2.232941, 1, 1, 1, 1, 1,
0.2483679, 1.38625, -0.1000386, 1, 1, 1, 1, 1,
0.2490941, 0.9195171, 0.1893266, 1, 1, 1, 1, 1,
0.2537208, -0.8785179, 2.124235, 0, 0, 1, 1, 1,
0.254349, -0.2531185, 1.692844, 1, 0, 0, 1, 1,
0.2575962, -0.6614161, 3.810227, 1, 0, 0, 1, 1,
0.2601316, 0.001575471, 1.593186, 1, 0, 0, 1, 1,
0.260646, 0.9745994, -0.8855194, 1, 0, 0, 1, 1,
0.2713952, -0.7520388, 3.415425, 1, 0, 0, 1, 1,
0.2737831, -0.4320607, 2.958812, 0, 0, 0, 1, 1,
0.2801925, -1.73588, 3.171708, 0, 0, 0, 1, 1,
0.2805153, 1.362004, 0.5404843, 0, 0, 0, 1, 1,
0.2817184, -1.069685, 4.940029, 0, 0, 0, 1, 1,
0.2844736, 0.9010638, 1.183247, 0, 0, 0, 1, 1,
0.2845233, -1.190088, 3.785125, 0, 0, 0, 1, 1,
0.2854267, 0.3230889, 1.775687, 0, 0, 0, 1, 1,
0.2880683, -0.9259502, 2.413367, 1, 1, 1, 1, 1,
0.2886998, 0.5495873, -1.097309, 1, 1, 1, 1, 1,
0.2887089, 0.09782321, 1.220447, 1, 1, 1, 1, 1,
0.2927368, 1.820428, 1.015868, 1, 1, 1, 1, 1,
0.2936952, -0.09050872, 0.8104538, 1, 1, 1, 1, 1,
0.2938138, 0.9089845, 1.022484, 1, 1, 1, 1, 1,
0.2964105, 0.4397133, 2.007901, 1, 1, 1, 1, 1,
0.2981992, 0.4417932, -0.1206158, 1, 1, 1, 1, 1,
0.3008539, 1.609998, -1.525782, 1, 1, 1, 1, 1,
0.3051146, -1.636196, 3.406845, 1, 1, 1, 1, 1,
0.3073925, 0.8761789, -0.6796198, 1, 1, 1, 1, 1,
0.3102852, -1.293132, 4.72763, 1, 1, 1, 1, 1,
0.3168934, 2.283297, 0.8322786, 1, 1, 1, 1, 1,
0.3213103, 0.2003391, 1.483674, 1, 1, 1, 1, 1,
0.3217391, 0.09013004, 1.408228, 1, 1, 1, 1, 1,
0.3235808, -0.8666652, 0.6903206, 0, 0, 1, 1, 1,
0.3267751, -1.211971, 3.715633, 1, 0, 0, 1, 1,
0.3286637, 0.2643256, 1.644641, 1, 0, 0, 1, 1,
0.3287341, 0.4957456, 1.2182, 1, 0, 0, 1, 1,
0.3296161, 0.3569835, 1.182977, 1, 0, 0, 1, 1,
0.3305666, 0.1914328, 0.2306644, 1, 0, 0, 1, 1,
0.3308428, -0.2679565, 2.347614, 0, 0, 0, 1, 1,
0.3345905, -1.049484, 3.544775, 0, 0, 0, 1, 1,
0.3377753, 0.8472193, 0.928726, 0, 0, 0, 1, 1,
0.3385166, -0.2198947, 0.1839906, 0, 0, 0, 1, 1,
0.3392864, 1.297704, -1.373886, 0, 0, 0, 1, 1,
0.3414112, 1.320924, 0.008922293, 0, 0, 0, 1, 1,
0.3425918, -0.3752405, 2.993666, 0, 0, 0, 1, 1,
0.3530036, -0.6824254, 3.471474, 1, 1, 1, 1, 1,
0.3544302, -0.397652, 3.200595, 1, 1, 1, 1, 1,
0.3548934, -2.200587, 4.740846, 1, 1, 1, 1, 1,
0.355472, -0.1650469, 3.805103, 1, 1, 1, 1, 1,
0.358147, -0.3568744, 2.417802, 1, 1, 1, 1, 1,
0.3596081, 0.7022747, -0.2215965, 1, 1, 1, 1, 1,
0.3613662, 0.09455084, 1.08431, 1, 1, 1, 1, 1,
0.3630852, 1.69339, 0.01304281, 1, 1, 1, 1, 1,
0.3660767, -0.9198276, 4.206496, 1, 1, 1, 1, 1,
0.3664925, -0.1214621, -0.5516636, 1, 1, 1, 1, 1,
0.3707309, -0.09070932, 1.597043, 1, 1, 1, 1, 1,
0.3755687, -0.8047367, 4.204918, 1, 1, 1, 1, 1,
0.3774129, 0.02943497, -0.334834, 1, 1, 1, 1, 1,
0.3811721, 1.771083, 0.9083339, 1, 1, 1, 1, 1,
0.3830977, -1.620402, 1.846656, 1, 1, 1, 1, 1,
0.3863207, 0.2925727, 0.8131232, 0, 0, 1, 1, 1,
0.3942489, -0.08069451, 0.5316725, 1, 0, 0, 1, 1,
0.3958147, 0.1832946, -0.003089424, 1, 0, 0, 1, 1,
0.3984324, -1.980853, 3.684954, 1, 0, 0, 1, 1,
0.3984331, 1.442134, 0.8149314, 1, 0, 0, 1, 1,
0.4080189, 1.262492, 0.1147777, 1, 0, 0, 1, 1,
0.4096832, 0.1713576, 1.660532, 0, 0, 0, 1, 1,
0.4105045, -0.7375031, 3.308524, 0, 0, 0, 1, 1,
0.4150046, 1.509367, -0.3680616, 0, 0, 0, 1, 1,
0.4212131, -0.6832458, 3.568156, 0, 0, 0, 1, 1,
0.4218292, -1.257246, 2.523236, 0, 0, 0, 1, 1,
0.4219137, 0.3642021, 1.136091, 0, 0, 0, 1, 1,
0.4238536, 0.1231489, 2.217314, 0, 0, 0, 1, 1,
0.4311365, -0.4813042, 2.597527, 1, 1, 1, 1, 1,
0.4314145, 0.7502634, -0.4534308, 1, 1, 1, 1, 1,
0.4338003, 0.7434749, 0.5486268, 1, 1, 1, 1, 1,
0.4339122, 0.5367312, 0.7090751, 1, 1, 1, 1, 1,
0.4357177, 0.6814235, -0.2013394, 1, 1, 1, 1, 1,
0.4446968, -0.4714508, 2.010887, 1, 1, 1, 1, 1,
0.4478397, 1.962008, 1.360091, 1, 1, 1, 1, 1,
0.4501578, 0.2839057, 0.7689002, 1, 1, 1, 1, 1,
0.4531444, -0.06004606, 0.2588494, 1, 1, 1, 1, 1,
0.4535866, 1.299503, 0.7952254, 1, 1, 1, 1, 1,
0.4541559, -1.564267, 3.0494, 1, 1, 1, 1, 1,
0.4543339, 0.4395663, 1.095511, 1, 1, 1, 1, 1,
0.4620308, -0.3262525, 2.75813, 1, 1, 1, 1, 1,
0.4678615, -0.2649712, 2.54655, 1, 1, 1, 1, 1,
0.4716037, -0.695315, 1.676851, 1, 1, 1, 1, 1,
0.4742726, 0.6535304, -0.01422412, 0, 0, 1, 1, 1,
0.4773085, 0.4501545, 1.557959, 1, 0, 0, 1, 1,
0.4774863, -0.03690072, -0.9653608, 1, 0, 0, 1, 1,
0.4801085, 0.5625274, 0.05801358, 1, 0, 0, 1, 1,
0.4804613, 0.4382482, 0.815851, 1, 0, 0, 1, 1,
0.4812492, 0.2379196, 1.571244, 1, 0, 0, 1, 1,
0.4855108, 0.295897, 2.419779, 0, 0, 0, 1, 1,
0.4881052, 0.9487767, -1.320183, 0, 0, 0, 1, 1,
0.4894553, 2.652687, 0.7789993, 0, 0, 0, 1, 1,
0.4916273, 0.3867429, 0.4126077, 0, 0, 0, 1, 1,
0.4922425, 0.5449734, 0.6347163, 0, 0, 0, 1, 1,
0.4980386, 0.3720946, 1.767968, 0, 0, 0, 1, 1,
0.4981507, -0.6173862, 4.157175, 0, 0, 0, 1, 1,
0.4989414, 0.8829182, -0.6154476, 1, 1, 1, 1, 1,
0.5055527, -1.610136, 2.713921, 1, 1, 1, 1, 1,
0.5078241, -0.8041945, 3.064644, 1, 1, 1, 1, 1,
0.5104014, -0.5659033, 3.894689, 1, 1, 1, 1, 1,
0.5109695, -0.1739567, 1.605636, 1, 1, 1, 1, 1,
0.5116808, -0.5482776, 1.96237, 1, 1, 1, 1, 1,
0.515537, -0.8480479, 3.365447, 1, 1, 1, 1, 1,
0.524011, 0.8689006, 1.296085, 1, 1, 1, 1, 1,
0.5285089, -0.9114506, 0.6023731, 1, 1, 1, 1, 1,
0.5301135, 0.1842521, 0.7995071, 1, 1, 1, 1, 1,
0.5373884, -0.3781068, 2.265471, 1, 1, 1, 1, 1,
0.5387291, -0.7955258, 1.334185, 1, 1, 1, 1, 1,
0.5436409, 0.9149465, -0.5825903, 1, 1, 1, 1, 1,
0.5444105, 0.2957296, 1.607496, 1, 1, 1, 1, 1,
0.5447538, -1.082919, 2.56204, 1, 1, 1, 1, 1,
0.5507862, 0.7935534, 1.686073, 0, 0, 1, 1, 1,
0.5533395, -1.488889, 3.565432, 1, 0, 0, 1, 1,
0.5586792, -0.394261, 2.701458, 1, 0, 0, 1, 1,
0.5586799, 0.8538487, 0.4822356, 1, 0, 0, 1, 1,
0.5591906, 0.9911118, -1.610972, 1, 0, 0, 1, 1,
0.5598946, -0.2775147, 2.341656, 1, 0, 0, 1, 1,
0.5621992, -0.3183394, 3.203578, 0, 0, 0, 1, 1,
0.5626398, 1.169263, -0.5187597, 0, 0, 0, 1, 1,
0.5684286, 1.709089, -0.4971175, 0, 0, 0, 1, 1,
0.5705284, -0.8276496, 2.136154, 0, 0, 0, 1, 1,
0.5706757, -0.1343362, 1.12626, 0, 0, 0, 1, 1,
0.5718064, 0.9093146, 2.634147, 0, 0, 0, 1, 1,
0.5815738, 1.406988, 0.9382952, 0, 0, 0, 1, 1,
0.5822402, 0.9734917, 0.7169443, 1, 1, 1, 1, 1,
0.5838571, 0.820376, 1.06153, 1, 1, 1, 1, 1,
0.5838611, -0.2407952, 0.806488, 1, 1, 1, 1, 1,
0.5854455, -1.288493, 1.882527, 1, 1, 1, 1, 1,
0.5887681, -0.7295066, 3.772238, 1, 1, 1, 1, 1,
0.5912613, -1.578358, 1.698028, 1, 1, 1, 1, 1,
0.5919483, -0.9418618, 4.250882, 1, 1, 1, 1, 1,
0.5928172, 0.8469045, 0.6469932, 1, 1, 1, 1, 1,
0.5938315, -0.1842622, 1.221439, 1, 1, 1, 1, 1,
0.5973835, 0.3559687, -0.6529326, 1, 1, 1, 1, 1,
0.5974151, -0.7593976, 3.466173, 1, 1, 1, 1, 1,
0.6037791, 0.1205326, 2.218374, 1, 1, 1, 1, 1,
0.6056156, 0.3370407, 1.410591, 1, 1, 1, 1, 1,
0.6135477, -0.8210638, 2.545663, 1, 1, 1, 1, 1,
0.6169545, -1.863267, 4.039411, 1, 1, 1, 1, 1,
0.6217054, -0.1485359, 2.413536, 0, 0, 1, 1, 1,
0.6274693, 0.03584588, 2.803633, 1, 0, 0, 1, 1,
0.6338175, 0.73079, 0.642555, 1, 0, 0, 1, 1,
0.6381326, 0.01051998, 0.9908922, 1, 0, 0, 1, 1,
0.6382589, 0.9568083, 1.0866, 1, 0, 0, 1, 1,
0.6407351, 0.7674763, 1.44345, 1, 0, 0, 1, 1,
0.6408728, 0.08150898, 1.514925, 0, 0, 0, 1, 1,
0.6413711, -1.55347, 2.85055, 0, 0, 0, 1, 1,
0.6436188, -1.186202, 2.841814, 0, 0, 0, 1, 1,
0.6439623, 0.5925764, 2.231477, 0, 0, 0, 1, 1,
0.6499056, 1.082258, 0.8301419, 0, 0, 0, 1, 1,
0.6533839, -1.289692, 4.384651, 0, 0, 0, 1, 1,
0.6536609, -0.287043, 1.088057, 0, 0, 0, 1, 1,
0.6601891, -4.945554e-05, 1.003441, 1, 1, 1, 1, 1,
0.6659174, -1.081791, 1.387851, 1, 1, 1, 1, 1,
0.6700854, -0.2304534, 1.200072, 1, 1, 1, 1, 1,
0.6766922, -1.581573, 4.630104, 1, 1, 1, 1, 1,
0.6768687, -0.03952614, 1.274672, 1, 1, 1, 1, 1,
0.6787149, -0.1417173, 2.635992, 1, 1, 1, 1, 1,
0.6847488, 1.412096, 0.8180496, 1, 1, 1, 1, 1,
0.6883124, 1.069021, 0.9561213, 1, 1, 1, 1, 1,
0.6914971, -0.01607066, 2.256747, 1, 1, 1, 1, 1,
0.6936009, -1.224368, 2.535147, 1, 1, 1, 1, 1,
0.6940168, 0.05418304, 0.568207, 1, 1, 1, 1, 1,
0.6966842, 0.9619529, 0.198172, 1, 1, 1, 1, 1,
0.6976159, 0.8946388, 0.9358358, 1, 1, 1, 1, 1,
0.7000577, 0.04572247, 0.125816, 1, 1, 1, 1, 1,
0.7032576, 0.7436221, 2.028259, 1, 1, 1, 1, 1,
0.7070645, -1.768982, 2.001766, 0, 0, 1, 1, 1,
0.7089525, -1.05755, 3.575877, 1, 0, 0, 1, 1,
0.7114747, -0.5434145, 2.871295, 1, 0, 0, 1, 1,
0.7191647, 0.264681, 0.6400673, 1, 0, 0, 1, 1,
0.7219931, 0.7519088, 1.350686, 1, 0, 0, 1, 1,
0.7257457, 0.01579918, -0.03328956, 1, 0, 0, 1, 1,
0.7278431, 0.01375123, 2.447612, 0, 0, 0, 1, 1,
0.7297704, -0.02540209, 1.788675, 0, 0, 0, 1, 1,
0.7327085, 0.4958552, 0.5842533, 0, 0, 0, 1, 1,
0.7333444, -2.131937, 4.003267, 0, 0, 0, 1, 1,
0.7353741, 1.884523, 1.253795, 0, 0, 0, 1, 1,
0.7390563, -1.193611, 2.879739, 0, 0, 0, 1, 1,
0.7474901, -0.7155277, 2.253101, 0, 0, 0, 1, 1,
0.7480555, 0.6124995, 0.4448153, 1, 1, 1, 1, 1,
0.7537566, 1.594439, 0.247376, 1, 1, 1, 1, 1,
0.7580235, -0.1286535, 1.55964, 1, 1, 1, 1, 1,
0.7592335, -1.260628, 4.664642, 1, 1, 1, 1, 1,
0.7617146, 1.099225, 0.516059, 1, 1, 1, 1, 1,
0.7625505, 1.665477, -2.008747, 1, 1, 1, 1, 1,
0.7638226, 1.240019, 1.95904, 1, 1, 1, 1, 1,
0.7687882, 0.4756061, 0.3128914, 1, 1, 1, 1, 1,
0.7694662, 0.1644666, 1.650425, 1, 1, 1, 1, 1,
0.7715025, -0.6903082, 2.382715, 1, 1, 1, 1, 1,
0.7729022, -1.073315, 2.749672, 1, 1, 1, 1, 1,
0.7736278, 2.248141, -0.5413424, 1, 1, 1, 1, 1,
0.7754533, -2.24281, 4.614491, 1, 1, 1, 1, 1,
0.7760355, -0.4257905, -0.06703846, 1, 1, 1, 1, 1,
0.7770575, -0.5638207, 0.7726746, 1, 1, 1, 1, 1,
0.7787969, 0.4044752, 2.157015, 0, 0, 1, 1, 1,
0.7831824, -1.382134, 4.234854, 1, 0, 0, 1, 1,
0.7838174, 0.650976, 0.4633658, 1, 0, 0, 1, 1,
0.7848298, 0.4218259, 0.6895417, 1, 0, 0, 1, 1,
0.7865747, 0.6318308, 1.449768, 1, 0, 0, 1, 1,
0.7905337, -0.6314275, 2.377509, 1, 0, 0, 1, 1,
0.7906243, 0.3479683, 2.361928, 0, 0, 0, 1, 1,
0.7942666, 0.3886868, 1.336277, 0, 0, 0, 1, 1,
0.7983881, 0.3802942, 2.675655, 0, 0, 0, 1, 1,
0.8010711, 0.6925875, -0.2044836, 0, 0, 0, 1, 1,
0.8070675, -1.221072, 2.735171, 0, 0, 0, 1, 1,
0.8073962, 0.3007672, 2.2166, 0, 0, 0, 1, 1,
0.8090327, 0.4046751, 1.304539, 0, 0, 0, 1, 1,
0.8145214, 0.2486927, 1.504206, 1, 1, 1, 1, 1,
0.8174529, 1.499543, 1.203484, 1, 1, 1, 1, 1,
0.820316, 0.6875778, 1.615345, 1, 1, 1, 1, 1,
0.8296684, -1.308274, 1.906885, 1, 1, 1, 1, 1,
0.834478, 0.8684009, -0.1415748, 1, 1, 1, 1, 1,
0.8367919, 1.622087, -0.1142399, 1, 1, 1, 1, 1,
0.8454748, 0.8583385, 1.045006, 1, 1, 1, 1, 1,
0.8601679, 0.1733406, 1.509812, 1, 1, 1, 1, 1,
0.8623675, -0.1996053, 1.597067, 1, 1, 1, 1, 1,
0.8661914, 0.3838019, 1.882054, 1, 1, 1, 1, 1,
0.8853989, 0.2694015, 1.405559, 1, 1, 1, 1, 1,
0.8870133, 0.4812165, 2.098839, 1, 1, 1, 1, 1,
0.8892874, -1.500428, 2.463362, 1, 1, 1, 1, 1,
0.8902163, 0.05286449, 0.456577, 1, 1, 1, 1, 1,
0.8913251, 0.3927916, 1.241678, 1, 1, 1, 1, 1,
0.8971568, -0.7883805, 1.862154, 0, 0, 1, 1, 1,
0.9001632, -0.2157276, 1.543138, 1, 0, 0, 1, 1,
0.9012524, -0.570012, 2.027276, 1, 0, 0, 1, 1,
0.9030705, -0.1693192, 1.751694, 1, 0, 0, 1, 1,
0.9045113, 0.00793343, 1.800422, 1, 0, 0, 1, 1,
0.9110433, -1.335337, 3.460115, 1, 0, 0, 1, 1,
0.9138781, 1.151964, -1.209342, 0, 0, 0, 1, 1,
0.9192451, 0.5887834, 1.286098, 0, 0, 0, 1, 1,
0.9227715, -1.51663, 1.304811, 0, 0, 0, 1, 1,
0.9228138, 0.9357813, -0.8766532, 0, 0, 0, 1, 1,
0.9288027, -1.463234, 2.963332, 0, 0, 0, 1, 1,
0.9336362, -0.3840152, 2.588764, 0, 0, 0, 1, 1,
0.9346755, 0.8180066, 1.627377, 0, 0, 0, 1, 1,
0.9349189, 0.8986961, 1.576243, 1, 1, 1, 1, 1,
0.9392704, 0.7251576, 1.203005, 1, 1, 1, 1, 1,
0.9393425, 0.2617182, 2.314548, 1, 1, 1, 1, 1,
0.9415446, 0.7189316, 1.264084, 1, 1, 1, 1, 1,
0.9478096, -2.679976, 3.734812, 1, 1, 1, 1, 1,
0.9491944, -0.8167874, 0.7204671, 1, 1, 1, 1, 1,
0.950879, -0.2826407, 2.612877, 1, 1, 1, 1, 1,
0.9513804, -1.520712, -0.5964801, 1, 1, 1, 1, 1,
0.9600975, 0.5953717, 2.161057, 1, 1, 1, 1, 1,
0.9726275, -0.1008435, -0.145166, 1, 1, 1, 1, 1,
0.9727271, 0.5393968, 0.1153916, 1, 1, 1, 1, 1,
0.9729539, -1.177698, 1.510129, 1, 1, 1, 1, 1,
0.9739553, -1.169279, 3.975143, 1, 1, 1, 1, 1,
0.9753531, -0.1607577, 1.399473, 1, 1, 1, 1, 1,
0.9784684, -0.3120856, 0.8649654, 1, 1, 1, 1, 1,
0.9800022, 0.2338226, -0.4311188, 0, 0, 1, 1, 1,
0.9858441, 1.248572, 0.2392855, 1, 0, 0, 1, 1,
0.9860932, 0.2988591, 2.281406, 1, 0, 0, 1, 1,
0.9898726, 0.7368082, 0.2076886, 1, 0, 0, 1, 1,
1.003601, -1.173292, 2.685678, 1, 0, 0, 1, 1,
1.010852, 1.029932, 0.7670373, 1, 0, 0, 1, 1,
1.013716, -1.150454, 1.269713, 0, 0, 0, 1, 1,
1.021619, -0.685202, 1.623392, 0, 0, 0, 1, 1,
1.023386, 0.9142053, 1.239497, 0, 0, 0, 1, 1,
1.026208, 0.5151013, 2.516772, 0, 0, 0, 1, 1,
1.026744, -1.0131, 2.1255, 0, 0, 0, 1, 1,
1.029492, 0.6670708, -0.9558043, 0, 0, 0, 1, 1,
1.031713, 1.11306, -1.011864, 0, 0, 0, 1, 1,
1.033353, 1.292252, -0.8441424, 1, 1, 1, 1, 1,
1.033929, 1.160255, 2.157288, 1, 1, 1, 1, 1,
1.046074, 0.1288957, 1.846656, 1, 1, 1, 1, 1,
1.046532, 1.158263, 1.179081, 1, 1, 1, 1, 1,
1.047519, 1.387915, 1.794419, 1, 1, 1, 1, 1,
1.047839, 0.4676199, 0.5795338, 1, 1, 1, 1, 1,
1.050326, 0.4754014, 1.104605, 1, 1, 1, 1, 1,
1.051446, 1.486251, 1.141025, 1, 1, 1, 1, 1,
1.053057, -0.1593363, 1.236564, 1, 1, 1, 1, 1,
1.068858, -0.3059753, 1.8779, 1, 1, 1, 1, 1,
1.076772, -0.1688757, 2.800045, 1, 1, 1, 1, 1,
1.077913, -0.452847, 1.328106, 1, 1, 1, 1, 1,
1.095694, -1.475242, 2.54325, 1, 1, 1, 1, 1,
1.1026, -0.3635223, 3.194045, 1, 1, 1, 1, 1,
1.113823, 0.1261856, -1.511079, 1, 1, 1, 1, 1,
1.122186, 0.775303, -1.223314, 0, 0, 1, 1, 1,
1.133191, -1.486444, 0.8164742, 1, 0, 0, 1, 1,
1.138894, -0.04325768, 1.809397, 1, 0, 0, 1, 1,
1.139757, -0.7848366, 1.787981, 1, 0, 0, 1, 1,
1.141998, -0.5312896, 1.143559, 1, 0, 0, 1, 1,
1.146518, -1.276389, 2.700179, 1, 0, 0, 1, 1,
1.147046, -0.5484033, 2.127358, 0, 0, 0, 1, 1,
1.153275, -0.721899, 3.127662, 0, 0, 0, 1, 1,
1.153413, 0.128985, 2.334034, 0, 0, 0, 1, 1,
1.15668, 0.7355432, 0.9682037, 0, 0, 0, 1, 1,
1.171363, 1.427987, 0.7775216, 0, 0, 0, 1, 1,
1.175369, 0.2482189, 3.183472, 0, 0, 0, 1, 1,
1.175879, 0.4604051, -0.7193142, 0, 0, 0, 1, 1,
1.177625, -1.427286, 5.393023, 1, 1, 1, 1, 1,
1.180431, -0.6568093, 1.200467, 1, 1, 1, 1, 1,
1.196984, -1.61576, 3.098307, 1, 1, 1, 1, 1,
1.197494, 0.4269597, 3.017051, 1, 1, 1, 1, 1,
1.203129, 0.7887794, 0.2230327, 1, 1, 1, 1, 1,
1.209184, -0.1234867, 1.594778, 1, 1, 1, 1, 1,
1.209762, 0.7122318, 0.8365634, 1, 1, 1, 1, 1,
1.218768, -0.1418902, 2.036386, 1, 1, 1, 1, 1,
1.222226, -0.6718083, 1.100798, 1, 1, 1, 1, 1,
1.222657, -0.4644699, 1.671296, 1, 1, 1, 1, 1,
1.229738, -0.400714, 0.7854301, 1, 1, 1, 1, 1,
1.234443, -1.241375, 0.8616891, 1, 1, 1, 1, 1,
1.250227, -1.976688, 2.827538, 1, 1, 1, 1, 1,
1.255061, 0.4457378, 2.016993, 1, 1, 1, 1, 1,
1.2581, -0.4254003, 1.190926, 1, 1, 1, 1, 1,
1.259682, 0.7938887, 0.8600183, 0, 0, 1, 1, 1,
1.27816, 0.6722197, 0.1521041, 1, 0, 0, 1, 1,
1.278682, -0.4403457, 2.941774, 1, 0, 0, 1, 1,
1.286847, -1.483011, 3.825435, 1, 0, 0, 1, 1,
1.286885, 0.05109535, 1.801538, 1, 0, 0, 1, 1,
1.293924, 2.519612, 0.2101668, 1, 0, 0, 1, 1,
1.302284, -0.5884538, 3.797711, 0, 0, 0, 1, 1,
1.303159, -1.202105, 2.518548, 0, 0, 0, 1, 1,
1.304134, -1.02928, 2.764517, 0, 0, 0, 1, 1,
1.314949, 0.8561625, 2.162436, 0, 0, 0, 1, 1,
1.325024, 0.9451502, -0.2978104, 0, 0, 0, 1, 1,
1.328069, -0.8931038, 2.701972, 0, 0, 0, 1, 1,
1.328213, 1.285203, 1.397891, 0, 0, 0, 1, 1,
1.33906, 1.036862, 1.226975, 1, 1, 1, 1, 1,
1.342442, -1.310042, 3.526166, 1, 1, 1, 1, 1,
1.345512, 0.5342103, 1.570013, 1, 1, 1, 1, 1,
1.35703, -0.2075618, 0.6689575, 1, 1, 1, 1, 1,
1.37089, 0.8427573, 1.976678, 1, 1, 1, 1, 1,
1.376803, 0.4297805, 1.573082, 1, 1, 1, 1, 1,
1.377008, -0.6962291, 2.40368, 1, 1, 1, 1, 1,
1.38785, -0.2998901, 1.567858, 1, 1, 1, 1, 1,
1.390044, -0.8916121, 3.327473, 1, 1, 1, 1, 1,
1.395142, -2.083572, 0.7872361, 1, 1, 1, 1, 1,
1.431892, -0.6716508, 1.075233, 1, 1, 1, 1, 1,
1.440565, 0.496605, 0.8151178, 1, 1, 1, 1, 1,
1.464209, -0.249577, 2.457845, 1, 1, 1, 1, 1,
1.474812, 0.9054505, -0.7785233, 1, 1, 1, 1, 1,
1.481685, 0.03211918, 3.287888, 1, 1, 1, 1, 1,
1.497544, -0.3270122, 2.221285, 0, 0, 1, 1, 1,
1.503078, -0.1781161, 1.92413, 1, 0, 0, 1, 1,
1.504294, -1.526534, 2.873201, 1, 0, 0, 1, 1,
1.513151, 1.999488, 2.662509, 1, 0, 0, 1, 1,
1.522867, 0.9465282, 0.3825901, 1, 0, 0, 1, 1,
1.531672, -0.8462218, 1.875411, 1, 0, 0, 1, 1,
1.539012, -0.7433257, 1.801652, 0, 0, 0, 1, 1,
1.552808, 0.7647476, 0.3168903, 0, 0, 0, 1, 1,
1.556391, -0.4087082, 2.048547, 0, 0, 0, 1, 1,
1.558016, 1.144506, -0.5662731, 0, 0, 0, 1, 1,
1.559982, 2.421676, 1.323558, 0, 0, 0, 1, 1,
1.568153, -2.021273, 2.494266, 0, 0, 0, 1, 1,
1.573306, 0.7708559, 3.260285, 0, 0, 0, 1, 1,
1.58127, -0.8866615, 0.772055, 1, 1, 1, 1, 1,
1.599491, 1.286897, -0.3661627, 1, 1, 1, 1, 1,
1.602501, -0.7594984, 2.536354, 1, 1, 1, 1, 1,
1.610228, 0.6185022, 0.5485196, 1, 1, 1, 1, 1,
1.613561, -0.04088167, 1.205254, 1, 1, 1, 1, 1,
1.655787, -0.171972, 0.9798478, 1, 1, 1, 1, 1,
1.674933, 0.3112242, 1.598181, 1, 1, 1, 1, 1,
1.677537, 0.5031776, 1.267899, 1, 1, 1, 1, 1,
1.680723, -0.1963516, 1.032777, 1, 1, 1, 1, 1,
1.694528, 0.6047044, 2.116899, 1, 1, 1, 1, 1,
1.703425, -1.043839, 2.967353, 1, 1, 1, 1, 1,
1.716508, -0.8097034, 2.39674, 1, 1, 1, 1, 1,
1.720634, 1.083768, -0.2073455, 1, 1, 1, 1, 1,
1.723094, -0.2050944, 1.709491, 1, 1, 1, 1, 1,
1.757411, -0.7411209, 2.019914, 1, 1, 1, 1, 1,
1.757909, -0.1017809, 1.690204, 0, 0, 1, 1, 1,
1.773445, -1.510398, 1.591837, 1, 0, 0, 1, 1,
1.78152, -1.320782, 2.713058, 1, 0, 0, 1, 1,
1.784135, -0.4338965, 1.335653, 1, 0, 0, 1, 1,
1.806113, 0.9072506, 0.4265436, 1, 0, 0, 1, 1,
1.850793, 0.1144982, -0.7204211, 1, 0, 0, 1, 1,
1.853117, -0.3403486, 1.178332, 0, 0, 0, 1, 1,
1.857299, 0.8498311, 1.934082, 0, 0, 0, 1, 1,
1.863635, -0.08706869, 2.410219, 0, 0, 0, 1, 1,
1.865176, 0.5810024, 0.01279572, 0, 0, 0, 1, 1,
1.870163, 1.895151, 1.072668, 0, 0, 0, 1, 1,
1.8834, 1.803459, 1.792634, 0, 0, 0, 1, 1,
1.889256, -0.4284148, 1.631771, 0, 0, 0, 1, 1,
1.914354, -0.7199996, 2.773511, 1, 1, 1, 1, 1,
1.937997, -1.207836, 2.273879, 1, 1, 1, 1, 1,
1.940949, 0.9521891, 1.545888, 1, 1, 1, 1, 1,
1.95302, 0.1859348, 2.349753, 1, 1, 1, 1, 1,
1.959672, -1.089366, 1.404981, 1, 1, 1, 1, 1,
1.976662, 0.5824915, 1.125649, 1, 1, 1, 1, 1,
2.041507, -0.7083423, 3.319199, 1, 1, 1, 1, 1,
2.04685, 1.958472, -0.5536817, 1, 1, 1, 1, 1,
2.068738, 0.07872295, 0.6656591, 1, 1, 1, 1, 1,
2.089361, 0.07449542, 1.205669, 1, 1, 1, 1, 1,
2.128225, -0.3311807, 1.118075, 1, 1, 1, 1, 1,
2.160823, -0.8497772, 1.815332, 1, 1, 1, 1, 1,
2.176959, -0.1294554, 0.4626698, 1, 1, 1, 1, 1,
2.182052, 0.7873252, 0.16937, 1, 1, 1, 1, 1,
2.214614, 0.4606127, 3.244564, 1, 1, 1, 1, 1,
2.215354, -0.5418316, -0.7240152, 0, 0, 1, 1, 1,
2.238352, 0.9073447, 2.678663, 1, 0, 0, 1, 1,
2.245173, 1.065322, 2.020543, 1, 0, 0, 1, 1,
2.289198, -0.45017, 2.813011, 1, 0, 0, 1, 1,
2.290072, 1.079159, 0.6193665, 1, 0, 0, 1, 1,
2.331232, -1.465456, 1.098256, 1, 0, 0, 1, 1,
2.337653, 0.4283176, 1.303316, 0, 0, 0, 1, 1,
2.352301, 0.2896292, 2.178316, 0, 0, 0, 1, 1,
2.356671, 0.3225748, 0.6705679, 0, 0, 0, 1, 1,
2.357065, 0.5649177, 1.294146, 0, 0, 0, 1, 1,
2.386146, 1.349926, 2.31718, 0, 0, 0, 1, 1,
2.417525, 0.3094448, 2.234327, 0, 0, 0, 1, 1,
2.431493, 0.3159259, 1.501352, 0, 0, 0, 1, 1,
2.471631, -0.5184492, 1.66966, 1, 1, 1, 1, 1,
2.476183, 1.559035, 2.165236, 1, 1, 1, 1, 1,
2.557124, -2.517228, 0.8472596, 1, 1, 1, 1, 1,
2.56587, -0.18931, 1.084507, 1, 1, 1, 1, 1,
2.68764, -1.001917, 1.893978, 1, 1, 1, 1, 1,
2.857476, -0.9761623, 0.6900292, 1, 1, 1, 1, 1,
3.114918, -1.029598, 1.803832, 1, 1, 1, 1, 1
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
var radius = 9.531018;
var distance = 33.4773;
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
mvMatrix.translate( -0.07725596, -0.3227105, -0.05572557 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4773);
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
