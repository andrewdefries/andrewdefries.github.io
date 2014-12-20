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
-3.065503, 0.8685826, -1.360003, 1, 0, 0, 1,
-2.868565, 0.1498809, -1.809674, 1, 0.007843138, 0, 1,
-2.669094, -0.1080865, 0.04302571, 1, 0.01176471, 0, 1,
-2.569864, 0.09917924, -0.4057138, 1, 0.01960784, 0, 1,
-2.526971, -0.2323356, -2.127774, 1, 0.02352941, 0, 1,
-2.509769, 1.259055, -1.326544, 1, 0.03137255, 0, 1,
-2.447857, -1.90047, -1.874596, 1, 0.03529412, 0, 1,
-2.420805, -0.7955632, -1.49898, 1, 0.04313726, 0, 1,
-2.378622, 2.21829, -1.007766, 1, 0.04705882, 0, 1,
-2.317183, -0.2016546, -0.8984265, 1, 0.05490196, 0, 1,
-2.294429, -1.736665, -1.27589, 1, 0.05882353, 0, 1,
-2.258192, -0.2975299, 0.5046083, 1, 0.06666667, 0, 1,
-2.222334, 0.3905089, -1.87389, 1, 0.07058824, 0, 1,
-2.221407, 0.9935958, -1.379804, 1, 0.07843138, 0, 1,
-2.209363, -0.263735, -2.073952, 1, 0.08235294, 0, 1,
-2.188462, -0.02424055, -0.7143955, 1, 0.09019608, 0, 1,
-2.182642, 0.3879259, -0.09867826, 1, 0.09411765, 0, 1,
-2.167049, -0.4462069, -1.468542, 1, 0.1019608, 0, 1,
-2.150254, 1.053526, -1.315071, 1, 0.1098039, 0, 1,
-2.091745, -0.3692414, -2.493973, 1, 0.1137255, 0, 1,
-2.072097, 0.4401291, -2.122557, 1, 0.1215686, 0, 1,
-2.068384, -0.9591259, -0.1249661, 1, 0.1254902, 0, 1,
-2.043612, -1.879945, -2.68284, 1, 0.1333333, 0, 1,
-2.010925, -1.254367, -1.455938, 1, 0.1372549, 0, 1,
-1.996491, -0.5333222, -2.909982, 1, 0.145098, 0, 1,
-1.986317, 0.09311688, -0.8318672, 1, 0.1490196, 0, 1,
-1.975513, -1.374429, -1.553202, 1, 0.1568628, 0, 1,
-1.96501, -0.5184354, -0.8419034, 1, 0.1607843, 0, 1,
-1.96003, 1.096281, 0.2408752, 1, 0.1686275, 0, 1,
-1.953854, -1.403851, -0.9568393, 1, 0.172549, 0, 1,
-1.947511, 0.9972199, -0.4229204, 1, 0.1803922, 0, 1,
-1.930731, 0.7206762, -2.798812, 1, 0.1843137, 0, 1,
-1.91133, 0.7374696, 0.1773939, 1, 0.1921569, 0, 1,
-1.908691, -0.165189, -2.028148, 1, 0.1960784, 0, 1,
-1.900129, -1.106848, -3.531582, 1, 0.2039216, 0, 1,
-1.872013, 0.3173438, -0.03864021, 1, 0.2117647, 0, 1,
-1.866411, -1.927248, -1.69626, 1, 0.2156863, 0, 1,
-1.863098, 0.4154638, -0.7036761, 1, 0.2235294, 0, 1,
-1.855901, 0.4349784, -0.8309077, 1, 0.227451, 0, 1,
-1.824471, -0.6856441, -1.72294, 1, 0.2352941, 0, 1,
-1.819319, 0.04651592, -0.9314143, 1, 0.2392157, 0, 1,
-1.815657, 0.6589526, 0.5843538, 1, 0.2470588, 0, 1,
-1.801123, 0.865914, -1.229456, 1, 0.2509804, 0, 1,
-1.798953, 0.1158551, 0.1382678, 1, 0.2588235, 0, 1,
-1.759611, 0.2893636, -1.730829, 1, 0.2627451, 0, 1,
-1.749078, -0.9587732, -2.660472, 1, 0.2705882, 0, 1,
-1.748814, -1.20367, -2.289557, 1, 0.2745098, 0, 1,
-1.74428, -1.376092, -3.332695, 1, 0.282353, 0, 1,
-1.742333, 0.008816813, -2.111831, 1, 0.2862745, 0, 1,
-1.728226, -0.4816345, -2.073979, 1, 0.2941177, 0, 1,
-1.726848, 0.4207053, -1.57427, 1, 0.3019608, 0, 1,
-1.71994, -1.259498, -3.503152, 1, 0.3058824, 0, 1,
-1.695346, -0.1228892, -2.144788, 1, 0.3137255, 0, 1,
-1.695294, 0.8311976, -1.566166, 1, 0.3176471, 0, 1,
-1.691992, 0.2518966, -3.118623, 1, 0.3254902, 0, 1,
-1.670685, -1.017322, -2.894727, 1, 0.3294118, 0, 1,
-1.663292, -0.4309286, -1.578851, 1, 0.3372549, 0, 1,
-1.645294, 0.7073401, -2.082822, 1, 0.3411765, 0, 1,
-1.644034, 0.950571, -1.083794, 1, 0.3490196, 0, 1,
-1.624503, 0.6791063, -2.533061, 1, 0.3529412, 0, 1,
-1.615431, 0.7650222, -0.2309246, 1, 0.3607843, 0, 1,
-1.610184, -0.821149, -2.126654, 1, 0.3647059, 0, 1,
-1.601489, 1.686443, -0.02376335, 1, 0.372549, 0, 1,
-1.596202, 0.4314205, -1.958177, 1, 0.3764706, 0, 1,
-1.593912, 0.6287161, -2.268958, 1, 0.3843137, 0, 1,
-1.591652, -0.4923547, -2.630637, 1, 0.3882353, 0, 1,
-1.591027, -0.231314, -1.894292, 1, 0.3960784, 0, 1,
-1.583045, -0.2768629, -1.381915, 1, 0.4039216, 0, 1,
-1.552426, 0.1036564, -0.7671716, 1, 0.4078431, 0, 1,
-1.548776, 0.3377116, -1.344167, 1, 0.4156863, 0, 1,
-1.536984, -0.4442295, -0.7892454, 1, 0.4196078, 0, 1,
-1.51326, 1.033877, -0.7536249, 1, 0.427451, 0, 1,
-1.504599, -0.311645, -2.61464, 1, 0.4313726, 0, 1,
-1.501735, -1.89828, -1.48109, 1, 0.4392157, 0, 1,
-1.499194, 0.9624772, -0.1172902, 1, 0.4431373, 0, 1,
-1.490004, 0.6325519, -0.8521466, 1, 0.4509804, 0, 1,
-1.488798, 1.360197, -1.067874, 1, 0.454902, 0, 1,
-1.478357, 0.14082, -1.985826, 1, 0.4627451, 0, 1,
-1.468067, -0.3171846, -1.903584, 1, 0.4666667, 0, 1,
-1.451797, -0.8790088, -1.912196, 1, 0.4745098, 0, 1,
-1.445709, -1.97191, -2.057211, 1, 0.4784314, 0, 1,
-1.441958, 1.363388, -0.8388149, 1, 0.4862745, 0, 1,
-1.438885, 0.6632003, -0.4344452, 1, 0.4901961, 0, 1,
-1.437832, -0.3397212, -1.335799, 1, 0.4980392, 0, 1,
-1.432479, -1.263846, -1.281664, 1, 0.5058824, 0, 1,
-1.425726, -0.2779275, -1.385561, 1, 0.509804, 0, 1,
-1.414031, 0.2636397, -1.336119, 1, 0.5176471, 0, 1,
-1.412615, 2.044832, -1.813215, 1, 0.5215687, 0, 1,
-1.411849, -0.1110186, -1.90588, 1, 0.5294118, 0, 1,
-1.40677, -1.109018, -1.878764, 1, 0.5333334, 0, 1,
-1.397742, 0.9000825, -1.163193, 1, 0.5411765, 0, 1,
-1.39684, 0.8122678, 0.6046553, 1, 0.5450981, 0, 1,
-1.383802, -0.1983279, -1.42564, 1, 0.5529412, 0, 1,
-1.372941, -0.4838679, -0.8667507, 1, 0.5568628, 0, 1,
-1.372138, 1.41448, -0.8318266, 1, 0.5647059, 0, 1,
-1.363473, -0.7777564, -0.8173173, 1, 0.5686275, 0, 1,
-1.350059, 1.604971, 1.097051, 1, 0.5764706, 0, 1,
-1.340937, -0.620966, -3.363198, 1, 0.5803922, 0, 1,
-1.335214, 0.1035938, -0.7101115, 1, 0.5882353, 0, 1,
-1.301399, 1.431426, -1.18063, 1, 0.5921569, 0, 1,
-1.296455, 0.625625, -1.066798, 1, 0.6, 0, 1,
-1.295763, 2.624261, 1.222708, 1, 0.6078432, 0, 1,
-1.285462, -0.1897504, -1.946986, 1, 0.6117647, 0, 1,
-1.262088, -1.265349, -1.137542, 1, 0.6196079, 0, 1,
-1.261121, -1.637707, -1.355339, 1, 0.6235294, 0, 1,
-1.256408, -0.03133075, -4.177627, 1, 0.6313726, 0, 1,
-1.256265, -0.6745942, -1.787164, 1, 0.6352941, 0, 1,
-1.254259, 0.4586752, -0.2081506, 1, 0.6431373, 0, 1,
-1.248119, 0.6340059, -0.3243957, 1, 0.6470588, 0, 1,
-1.247267, -0.7908561, -3.231258, 1, 0.654902, 0, 1,
-1.245141, -0.9957077, -1.024261, 1, 0.6588235, 0, 1,
-1.239322, -1.603974, -3.243253, 1, 0.6666667, 0, 1,
-1.23658, -0.5533348, -2.705417, 1, 0.6705883, 0, 1,
-1.233886, -0.008732808, -0.992197, 1, 0.6784314, 0, 1,
-1.226638, 0.2366227, -1.883467, 1, 0.682353, 0, 1,
-1.221676, -0.3654629, 0.1839926, 1, 0.6901961, 0, 1,
-1.215466, 0.9829791, -0.9190323, 1, 0.6941177, 0, 1,
-1.203737, -0.203297, -3.454586, 1, 0.7019608, 0, 1,
-1.19363, 0.2085761, -1.736641, 1, 0.7098039, 0, 1,
-1.190222, -0.4602566, -3.137816, 1, 0.7137255, 0, 1,
-1.181404, -0.1323233, -3.102707, 1, 0.7215686, 0, 1,
-1.176014, -1.377769, -1.762143, 1, 0.7254902, 0, 1,
-1.165707, -1.324319, -0.5363557, 1, 0.7333333, 0, 1,
-1.163289, -0.7465348, -2.467521, 1, 0.7372549, 0, 1,
-1.151428, -0.5065002, -3.26105, 1, 0.7450981, 0, 1,
-1.148562, -0.08171618, -1.196042, 1, 0.7490196, 0, 1,
-1.142407, 1.830733, 0.2726775, 1, 0.7568628, 0, 1,
-1.141051, 1.739556, -1.293044, 1, 0.7607843, 0, 1,
-1.136557, -0.2009478, -1.454578, 1, 0.7686275, 0, 1,
-1.135419, -0.4090309, -1.813467, 1, 0.772549, 0, 1,
-1.121318, -0.6522005, -1.490363, 1, 0.7803922, 0, 1,
-1.119268, 0.7898481, 0.7888424, 1, 0.7843137, 0, 1,
-1.1122, -2.069793, -1.402696, 1, 0.7921569, 0, 1,
-1.104066, 0.4624537, -1.156934, 1, 0.7960784, 0, 1,
-1.100444, 1.187775, -1.648679, 1, 0.8039216, 0, 1,
-1.091105, 1.02537, -1.589801, 1, 0.8117647, 0, 1,
-1.084851, -0.2249746, -0.4893507, 1, 0.8156863, 0, 1,
-1.071804, -0.04787334, -1.938255, 1, 0.8235294, 0, 1,
-1.069414, -0.4017075, -2.941282, 1, 0.827451, 0, 1,
-1.068662, 0.8708088, -0.3098173, 1, 0.8352941, 0, 1,
-1.067106, 0.01441951, -1.053259, 1, 0.8392157, 0, 1,
-1.065222, -0.1114912, -2.494697, 1, 0.8470588, 0, 1,
-1.063391, 0.1559126, -0.232914, 1, 0.8509804, 0, 1,
-1.061502, 1.447072, -0.001231352, 1, 0.8588235, 0, 1,
-1.059139, -0.1069449, -1.995269, 1, 0.8627451, 0, 1,
-1.047506, 0.9139419, -0.9561254, 1, 0.8705882, 0, 1,
-1.046442, -0.9629925, -1.65241, 1, 0.8745098, 0, 1,
-1.044612, 0.5276659, 1.087876, 1, 0.8823529, 0, 1,
-1.033233, 0.370259, -0.2721586, 1, 0.8862745, 0, 1,
-1.030126, -0.06742643, -2.695944, 1, 0.8941177, 0, 1,
-1.027068, -1.241707, -3.411636, 1, 0.8980392, 0, 1,
-1.026644, 1.038593, -2.596055, 1, 0.9058824, 0, 1,
-1.023605, 0.6979063, -0.1844485, 1, 0.9137255, 0, 1,
-1.02216, -0.3911168, -1.284729, 1, 0.9176471, 0, 1,
-1.02084, -0.3380353, -2.280511, 1, 0.9254902, 0, 1,
-1.018257, 0.2774466, -2.296638, 1, 0.9294118, 0, 1,
-1.012287, 0.3219392, -0.5020375, 1, 0.9372549, 0, 1,
-1.009928, 0.6608531, -1.821825, 1, 0.9411765, 0, 1,
-1.009332, 0.1115202, -1.35347, 1, 0.9490196, 0, 1,
-1.003023, 0.7452918, 0.8934731, 1, 0.9529412, 0, 1,
-1.001731, -0.8425983, -2.651484, 1, 0.9607843, 0, 1,
-0.9981689, -0.3205942, -1.475168, 1, 0.9647059, 0, 1,
-0.9956734, 0.2885296, -0.5545387, 1, 0.972549, 0, 1,
-0.987795, 0.5607195, -1.394397, 1, 0.9764706, 0, 1,
-0.9876955, -1.042818, -2.520275, 1, 0.9843137, 0, 1,
-0.9874358, 0.8439276, -0.9823461, 1, 0.9882353, 0, 1,
-0.986913, -0.1310347, -1.48199, 1, 0.9960784, 0, 1,
-0.9789376, 2.235769, -1.913858, 0.9960784, 1, 0, 1,
-0.9770811, 0.605707, -1.249379, 0.9921569, 1, 0, 1,
-0.9674156, -0.2108187, -1.368093, 0.9843137, 1, 0, 1,
-0.966575, 0.2518606, -2.500544, 0.9803922, 1, 0, 1,
-0.962447, 0.5803084, 0.4254512, 0.972549, 1, 0, 1,
-0.9595342, 0.5828956, -2.047693, 0.9686275, 1, 0, 1,
-0.9456139, 0.08428197, -0.7146574, 0.9607843, 1, 0, 1,
-0.9419493, 0.6327755, -2.358655, 0.9568627, 1, 0, 1,
-0.9414148, -2.455993, -2.991992, 0.9490196, 1, 0, 1,
-0.9408798, -0.4848685, -2.057019, 0.945098, 1, 0, 1,
-0.9353094, 0.05465835, -2.551968, 0.9372549, 1, 0, 1,
-0.9313571, 0.03101527, -1.169764, 0.9333333, 1, 0, 1,
-0.9308112, 0.513581, -0.6355541, 0.9254902, 1, 0, 1,
-0.9301551, -1.215375, -3.361588, 0.9215686, 1, 0, 1,
-0.9244616, -1.1485, -1.702487, 0.9137255, 1, 0, 1,
-0.9235821, 1.403575, -1.467569, 0.9098039, 1, 0, 1,
-0.9198077, 0.3884448, -1.188629, 0.9019608, 1, 0, 1,
-0.9182159, 0.3376035, -2.676383, 0.8941177, 1, 0, 1,
-0.916814, -0.9194074, -2.465858, 0.8901961, 1, 0, 1,
-0.9133083, 1.233418, -0.8730129, 0.8823529, 1, 0, 1,
-0.9093456, -0.4429192, -2.802757, 0.8784314, 1, 0, 1,
-0.904083, 0.4937381, -0.2503788, 0.8705882, 1, 0, 1,
-0.8998641, 0.6820253, -0.8606115, 0.8666667, 1, 0, 1,
-0.8997168, -0.06200743, -2.455555, 0.8588235, 1, 0, 1,
-0.8882691, -0.0744648, -0.6457248, 0.854902, 1, 0, 1,
-0.8830214, -0.305411, -1.284105, 0.8470588, 1, 0, 1,
-0.8815818, -0.2078895, -2.680093, 0.8431373, 1, 0, 1,
-0.8811635, 1.098569, 0.2528143, 0.8352941, 1, 0, 1,
-0.880569, 1.366226, -1.881178, 0.8313726, 1, 0, 1,
-0.8770817, -0.3455859, -2.110369, 0.8235294, 1, 0, 1,
-0.873238, -0.5936067, -2.985994, 0.8196079, 1, 0, 1,
-0.8724247, -0.9710464, -1.629504, 0.8117647, 1, 0, 1,
-0.8707473, -0.08856175, -1.404176, 0.8078431, 1, 0, 1,
-0.8668278, -0.08880375, -3.165484, 0.8, 1, 0, 1,
-0.865662, 0.5480453, -0.5736588, 0.7921569, 1, 0, 1,
-0.8612862, 0.9798509, 1.546086, 0.7882353, 1, 0, 1,
-0.8598568, -0.5794954, -4.014608, 0.7803922, 1, 0, 1,
-0.8592069, 0.4701001, -0.1045466, 0.7764706, 1, 0, 1,
-0.8528703, 0.03087924, -2.514462, 0.7686275, 1, 0, 1,
-0.851097, 1.107224, -1.025784, 0.7647059, 1, 0, 1,
-0.8398356, -1.01774, -1.636541, 0.7568628, 1, 0, 1,
-0.833584, -0.06417193, -1.904473, 0.7529412, 1, 0, 1,
-0.8323885, 0.6546099, -0.6399649, 0.7450981, 1, 0, 1,
-0.8296531, -0.347825, -2.833735, 0.7411765, 1, 0, 1,
-0.8243051, -1.014879, -3.523062, 0.7333333, 1, 0, 1,
-0.8236172, 0.02601247, -0.687508, 0.7294118, 1, 0, 1,
-0.8235019, -1.196551, -3.280553, 0.7215686, 1, 0, 1,
-0.8217573, -1.262314, -2.888286, 0.7176471, 1, 0, 1,
-0.8189735, 1.325019, -0.3409095, 0.7098039, 1, 0, 1,
-0.8136212, 1.077601, -0.3178765, 0.7058824, 1, 0, 1,
-0.8128529, -1.430242, -2.053981, 0.6980392, 1, 0, 1,
-0.8122715, -0.5801433, -1.921787, 0.6901961, 1, 0, 1,
-0.8043689, -0.360136, -1.292775, 0.6862745, 1, 0, 1,
-0.802745, 2.49752, -0.912513, 0.6784314, 1, 0, 1,
-0.7790883, -0.07320976, -2.707986, 0.6745098, 1, 0, 1,
-0.7763658, 0.8762533, -0.5697351, 0.6666667, 1, 0, 1,
-0.7729912, -0.107475, -0.2538359, 0.6627451, 1, 0, 1,
-0.7704288, 1.759401, -0.6601998, 0.654902, 1, 0, 1,
-0.768146, -0.08811116, 0.8865276, 0.6509804, 1, 0, 1,
-0.7681149, 0.8102754, 0.7587514, 0.6431373, 1, 0, 1,
-0.7654237, -0.7536808, -0.3181775, 0.6392157, 1, 0, 1,
-0.763876, -0.6859633, -2.84968, 0.6313726, 1, 0, 1,
-0.7620102, 0.09395712, -0.9139794, 0.627451, 1, 0, 1,
-0.7590991, -0.51754, -1.31828, 0.6196079, 1, 0, 1,
-0.7575461, 0.4079943, -1.871262, 0.6156863, 1, 0, 1,
-0.7561074, 0.245633, -1.145784, 0.6078432, 1, 0, 1,
-0.7521034, 0.5777901, -0.4365029, 0.6039216, 1, 0, 1,
-0.7518231, -0.8032926, -1.045431, 0.5960785, 1, 0, 1,
-0.7503616, 0.3463851, -1.60207, 0.5882353, 1, 0, 1,
-0.7420736, 1.189719, -0.4885827, 0.5843138, 1, 0, 1,
-0.7384486, 1.39675, -1.095751, 0.5764706, 1, 0, 1,
-0.7356549, 0.5622247, -0.8246688, 0.572549, 1, 0, 1,
-0.7328904, 1.048606, -0.3105596, 0.5647059, 1, 0, 1,
-0.7296563, -0.2396259, -1.300352, 0.5607843, 1, 0, 1,
-0.7282009, 0.8752611, 0.442851, 0.5529412, 1, 0, 1,
-0.7261997, -2.36826, -2.967183, 0.5490196, 1, 0, 1,
-0.7221277, -0.324188, -2.718902, 0.5411765, 1, 0, 1,
-0.7197896, 0.2951429, -0.8783956, 0.5372549, 1, 0, 1,
-0.7168419, -1.136609, -3.344412, 0.5294118, 1, 0, 1,
-0.711077, -1.500273, -2.151741, 0.5254902, 1, 0, 1,
-0.7070947, 0.7460513, -2.098397, 0.5176471, 1, 0, 1,
-0.7030884, 0.4365914, 0.9978097, 0.5137255, 1, 0, 1,
-0.6914775, 0.4662206, -0.6513943, 0.5058824, 1, 0, 1,
-0.686535, -1.27804, -2.273393, 0.5019608, 1, 0, 1,
-0.6852641, 1.655282, 0.07473201, 0.4941176, 1, 0, 1,
-0.6833629, -1.306119, -2.867928, 0.4862745, 1, 0, 1,
-0.6820049, -0.215067, -0.2716384, 0.4823529, 1, 0, 1,
-0.6788964, -0.02408158, -1.010877, 0.4745098, 1, 0, 1,
-0.6783895, 0.1311442, -0.5109241, 0.4705882, 1, 0, 1,
-0.6772744, 2.824524, -1.045384, 0.4627451, 1, 0, 1,
-0.675869, 1.818323, -1.302309, 0.4588235, 1, 0, 1,
-0.6733316, 0.2570336, -1.162428, 0.4509804, 1, 0, 1,
-0.6708217, -0.2145128, -1.124174, 0.4470588, 1, 0, 1,
-0.6705666, -0.8370523, -0.9187312, 0.4392157, 1, 0, 1,
-0.6679141, 0.1316617, -0.4625732, 0.4352941, 1, 0, 1,
-0.6626852, -0.02943368, -2.728137, 0.427451, 1, 0, 1,
-0.6585452, -0.3851002, -2.273963, 0.4235294, 1, 0, 1,
-0.6541696, 0.5143377, -0.755402, 0.4156863, 1, 0, 1,
-0.6536672, 0.511874, -0.8727207, 0.4117647, 1, 0, 1,
-0.652465, -1.646972, -3.561325, 0.4039216, 1, 0, 1,
-0.6498879, -0.0484591, -2.568573, 0.3960784, 1, 0, 1,
-0.6461781, 0.6076064, -2.367279, 0.3921569, 1, 0, 1,
-0.640745, -1.023162, -1.627229, 0.3843137, 1, 0, 1,
-0.6362967, 2.365293, -1.311659, 0.3803922, 1, 0, 1,
-0.6284391, -0.8361621, -2.746665, 0.372549, 1, 0, 1,
-0.6275244, 0.03813512, -2.865003, 0.3686275, 1, 0, 1,
-0.6235493, -0.8459463, -3.112894, 0.3607843, 1, 0, 1,
-0.6229962, -0.5587862, -3.983991, 0.3568628, 1, 0, 1,
-0.6179874, -1.301476, -2.704926, 0.3490196, 1, 0, 1,
-0.6170525, 1.498732, 0.5233446, 0.345098, 1, 0, 1,
-0.6089216, -0.1770667, -2.386265, 0.3372549, 1, 0, 1,
-0.605212, -0.5695987, -2.303864, 0.3333333, 1, 0, 1,
-0.6027355, 1.10006, -1.210763, 0.3254902, 1, 0, 1,
-0.5983458, -0.2365211, -1.873846, 0.3215686, 1, 0, 1,
-0.5918621, 0.2488281, -3.223832, 0.3137255, 1, 0, 1,
-0.5876805, -1.232741, -3.995003, 0.3098039, 1, 0, 1,
-0.5828041, 0.9764009, 0.6212401, 0.3019608, 1, 0, 1,
-0.5819612, -1.255716, -2.87025, 0.2941177, 1, 0, 1,
-0.5801416, -1.927462, -2.702907, 0.2901961, 1, 0, 1,
-0.5800695, 0.2014074, -2.246252, 0.282353, 1, 0, 1,
-0.5792739, -0.1021996, -2.491745, 0.2784314, 1, 0, 1,
-0.5777429, -1.603027, -1.843743, 0.2705882, 1, 0, 1,
-0.5678064, 0.1099574, -0.3056392, 0.2666667, 1, 0, 1,
-0.56394, 1.156105, -1.955236, 0.2588235, 1, 0, 1,
-0.5596257, 0.3108189, -0.9727306, 0.254902, 1, 0, 1,
-0.5575798, -0.290515, -0.7778628, 0.2470588, 1, 0, 1,
-0.5572758, -0.4534872, -0.4652386, 0.2431373, 1, 0, 1,
-0.5518041, -2.224088, -3.224292, 0.2352941, 1, 0, 1,
-0.5509778, -1.947856, -3.892011, 0.2313726, 1, 0, 1,
-0.5467197, 0.9044551, 0.4792994, 0.2235294, 1, 0, 1,
-0.5432001, -0.302139, -2.916719, 0.2196078, 1, 0, 1,
-0.5429852, 1.354343, -1.571754, 0.2117647, 1, 0, 1,
-0.5414006, 0.3058563, -1.340098, 0.2078431, 1, 0, 1,
-0.5400735, -0.2270048, -2.346844, 0.2, 1, 0, 1,
-0.5383092, -0.5540355, -3.461573, 0.1921569, 1, 0, 1,
-0.5367726, 1.535419, -0.289348, 0.1882353, 1, 0, 1,
-0.5347492, -0.9718001, -3.033559, 0.1803922, 1, 0, 1,
-0.5341706, -1.557858, -1.222327, 0.1764706, 1, 0, 1,
-0.530422, 1.614298, -0.01071753, 0.1686275, 1, 0, 1,
-0.5303786, -1.474132, -2.353886, 0.1647059, 1, 0, 1,
-0.5269233, -2.112522, -5.231797, 0.1568628, 1, 0, 1,
-0.5252025, -1.000869, -3.729817, 0.1529412, 1, 0, 1,
-0.5248126, -0.089816, -0.7126267, 0.145098, 1, 0, 1,
-0.5219761, 0.1152381, 1.216817, 0.1411765, 1, 0, 1,
-0.5212206, -1.231635, -2.191358, 0.1333333, 1, 0, 1,
-0.5189064, -1.65992, -2.242645, 0.1294118, 1, 0, 1,
-0.5178345, 0.7570458, 1.082178, 0.1215686, 1, 0, 1,
-0.5035772, -0.4217779, -2.845988, 0.1176471, 1, 0, 1,
-0.5016958, -1.925521, -2.580129, 0.1098039, 1, 0, 1,
-0.5004686, -0.5715231, -2.405947, 0.1058824, 1, 0, 1,
-0.4926189, 0.4272036, -0.8993301, 0.09803922, 1, 0, 1,
-0.4913541, 0.4781167, -0.6564472, 0.09019608, 1, 0, 1,
-0.4884642, 1.259369, -1.625899, 0.08627451, 1, 0, 1,
-0.4872831, 0.2238674, -0.6145953, 0.07843138, 1, 0, 1,
-0.4825591, -1.353721, -1.927838, 0.07450981, 1, 0, 1,
-0.4821526, -1.007483, -0.7837508, 0.06666667, 1, 0, 1,
-0.4789028, -1.730895, -4.228735, 0.0627451, 1, 0, 1,
-0.4730528, -0.5216008, -2.465473, 0.05490196, 1, 0, 1,
-0.4728417, 2.103002, 1.171884, 0.05098039, 1, 0, 1,
-0.4705085, -1.162668, -1.485447, 0.04313726, 1, 0, 1,
-0.4676775, 0.2043311, 0.2262509, 0.03921569, 1, 0, 1,
-0.4630545, 0.9551805, -1.932289, 0.03137255, 1, 0, 1,
-0.4622656, -0.1473881, -1.893667, 0.02745098, 1, 0, 1,
-0.4543781, -0.4225919, -2.817033, 0.01960784, 1, 0, 1,
-0.4510313, 0.787227, -0.1733538, 0.01568628, 1, 0, 1,
-0.450775, -0.6756169, -2.051871, 0.007843138, 1, 0, 1,
-0.4489049, -0.8863974, -2.214791, 0.003921569, 1, 0, 1,
-0.4458531, -2.355485, -2.801331, 0, 1, 0.003921569, 1,
-0.4450601, 0.07851297, -2.83854, 0, 1, 0.01176471, 1,
-0.4375413, -0.5370141, -2.5427, 0, 1, 0.01568628, 1,
-0.4369842, 0.4459196, 0.4902371, 0, 1, 0.02352941, 1,
-0.433517, -1.734823, -2.594301, 0, 1, 0.02745098, 1,
-0.4311082, 0.5197069, -1.511294, 0, 1, 0.03529412, 1,
-0.4295401, -1.35878, -2.006592, 0, 1, 0.03921569, 1,
-0.4283055, 0.9267942, -0.7824938, 0, 1, 0.04705882, 1,
-0.4275782, -0.439782, -2.311055, 0, 1, 0.05098039, 1,
-0.4249559, -0.3550899, -3.312874, 0, 1, 0.05882353, 1,
-0.4245798, 1.575431, -1.806719, 0, 1, 0.0627451, 1,
-0.4235897, 1.566884, -0.2916459, 0, 1, 0.07058824, 1,
-0.4230015, -2.034258, -2.732233, 0, 1, 0.07450981, 1,
-0.422729, -1.966183, -4.671712, 0, 1, 0.08235294, 1,
-0.4220847, -0.3689753, -4.62844, 0, 1, 0.08627451, 1,
-0.4125357, -2.278292, -4.264235, 0, 1, 0.09411765, 1,
-0.4104455, -0.8684191, -2.591306, 0, 1, 0.1019608, 1,
-0.4091125, 0.8221008, -1.370252, 0, 1, 0.1058824, 1,
-0.404696, 1.533028, -1.039589, 0, 1, 0.1137255, 1,
-0.4041617, -1.0407, -3.123374, 0, 1, 0.1176471, 1,
-0.4020075, -0.5595027, -3.685192, 0, 1, 0.1254902, 1,
-0.3978342, -0.1230789, -3.480699, 0, 1, 0.1294118, 1,
-0.3935051, 1.87956, 0.1822352, 0, 1, 0.1372549, 1,
-0.3878788, -0.3444083, -2.485031, 0, 1, 0.1411765, 1,
-0.3868923, -0.006233701, -0.5951732, 0, 1, 0.1490196, 1,
-0.3847621, -0.3654667, -2.943599, 0, 1, 0.1529412, 1,
-0.3837889, -0.4306349, -1.594575, 0, 1, 0.1607843, 1,
-0.3823665, 0.0006674094, -2.270965, 0, 1, 0.1647059, 1,
-0.3820921, -1.613698, -4.058014, 0, 1, 0.172549, 1,
-0.3814222, -0.3778352, -2.730438, 0, 1, 0.1764706, 1,
-0.3801451, 1.026956, -0.325426, 0, 1, 0.1843137, 1,
-0.379818, 0.2628106, -1.441468, 0, 1, 0.1882353, 1,
-0.3784582, -1.114941, -3.416585, 0, 1, 0.1960784, 1,
-0.3722281, 1.589369, 1.870783, 0, 1, 0.2039216, 1,
-0.3675409, 1.355546, 1.058083, 0, 1, 0.2078431, 1,
-0.3659303, 0.6033493, -0.8304118, 0, 1, 0.2156863, 1,
-0.3594043, -0.9101403, -2.392197, 0, 1, 0.2196078, 1,
-0.356492, 0.8641227, -1.13422, 0, 1, 0.227451, 1,
-0.3509386, -1.850192, -1.881389, 0, 1, 0.2313726, 1,
-0.3445298, 0.5484571, 1.565615, 0, 1, 0.2392157, 1,
-0.3437078, 0.8221424, -0.1309913, 0, 1, 0.2431373, 1,
-0.3387256, -0.2179284, -1.028238, 0, 1, 0.2509804, 1,
-0.3371344, -0.07857633, -3.045577, 0, 1, 0.254902, 1,
-0.335107, 0.1756864, -0.5782954, 0, 1, 0.2627451, 1,
-0.3296337, 1.043329, 0.8882576, 0, 1, 0.2666667, 1,
-0.3239049, 0.681605, -0.3035501, 0, 1, 0.2745098, 1,
-0.3192224, -0.02377525, -1.374409, 0, 1, 0.2784314, 1,
-0.3174282, 0.7849917, -0.2217245, 0, 1, 0.2862745, 1,
-0.3033541, -1.122391, -1.69761, 0, 1, 0.2901961, 1,
-0.3026804, 0.3564672, -1.713619, 0, 1, 0.2980392, 1,
-0.3000211, -0.9824381, -4.150606, 0, 1, 0.3058824, 1,
-0.2989905, -1.758031, -4.701103, 0, 1, 0.3098039, 1,
-0.294488, 0.3758487, -0.2254035, 0, 1, 0.3176471, 1,
-0.294134, -0.05591436, -3.025265, 0, 1, 0.3215686, 1,
-0.2940075, 0.7457471, -0.6367376, 0, 1, 0.3294118, 1,
-0.2924658, 0.8303747, -1.122224, 0, 1, 0.3333333, 1,
-0.2912816, 0.346074, -0.184173, 0, 1, 0.3411765, 1,
-0.2908049, -0.6089903, -4.069137, 0, 1, 0.345098, 1,
-0.2906134, -1.961871, -4.787932, 0, 1, 0.3529412, 1,
-0.2896963, -1.378419, -3.557509, 0, 1, 0.3568628, 1,
-0.2806569, 0.896472, 0.9788257, 0, 1, 0.3647059, 1,
-0.2749377, 0.3521669, -0.3174351, 0, 1, 0.3686275, 1,
-0.2740542, 0.1685124, -0.03052054, 0, 1, 0.3764706, 1,
-0.2734591, 0.4181314, -1.574289, 0, 1, 0.3803922, 1,
-0.2659619, -0.4295032, -1.774993, 0, 1, 0.3882353, 1,
-0.2621621, 0.6747799, -2.676845, 0, 1, 0.3921569, 1,
-0.2603295, -0.3966014, -3.934445, 0, 1, 0.4, 1,
-0.2585502, 0.2924646, -0.3350001, 0, 1, 0.4078431, 1,
-0.2577158, 0.5609968, 0.3502392, 0, 1, 0.4117647, 1,
-0.2562518, -0.2428901, -1.526468, 0, 1, 0.4196078, 1,
-0.2553475, 0.8902169, 1.047841, 0, 1, 0.4235294, 1,
-0.2539401, 1.789559, -1.106807, 0, 1, 0.4313726, 1,
-0.2506041, 1.526828, -1.150864, 0, 1, 0.4352941, 1,
-0.2492176, -0.0008510406, -2.283672, 0, 1, 0.4431373, 1,
-0.2475321, 0.2696603, -0.5284389, 0, 1, 0.4470588, 1,
-0.2467382, 0.119606, -1.43721, 0, 1, 0.454902, 1,
-0.2406694, 0.1706556, -1.489806, 0, 1, 0.4588235, 1,
-0.2387542, -0.7976626, -3.332389, 0, 1, 0.4666667, 1,
-0.2377384, 0.6733071, -1.246825, 0, 1, 0.4705882, 1,
-0.2369155, -0.8190534, -1.432582, 0, 1, 0.4784314, 1,
-0.2301572, -1.554318, -3.954784, 0, 1, 0.4823529, 1,
-0.2282967, -0.3174759, -2.389431, 0, 1, 0.4901961, 1,
-0.2255354, 1.547258, -0.06589861, 0, 1, 0.4941176, 1,
-0.223537, 0.1641431, -0.5039612, 0, 1, 0.5019608, 1,
-0.2215533, -1.277805, -3.053834, 0, 1, 0.509804, 1,
-0.2192474, 1.198253, -0.8723703, 0, 1, 0.5137255, 1,
-0.2182228, 0.6884463, -1.434186, 0, 1, 0.5215687, 1,
-0.2181355, 0.4418311, -0.4829046, 0, 1, 0.5254902, 1,
-0.2156576, -0.3994961, -1.901263, 0, 1, 0.5333334, 1,
-0.2103478, 1.279663, 0.0288381, 0, 1, 0.5372549, 1,
-0.2085148, -0.7741373, -2.878784, 0, 1, 0.5450981, 1,
-0.2077637, -0.2300946, -3.620862, 0, 1, 0.5490196, 1,
-0.2069528, -0.951377, -4.437696, 0, 1, 0.5568628, 1,
-0.2065063, 0.1616501, -2.235224, 0, 1, 0.5607843, 1,
-0.2055194, 0.5547171, -3.453614, 0, 1, 0.5686275, 1,
-0.2031996, 0.09510448, -2.6029, 0, 1, 0.572549, 1,
-0.2026887, 0.6300641, -0.2677643, 0, 1, 0.5803922, 1,
-0.2016739, -0.9810703, -1.913913, 0, 1, 0.5843138, 1,
-0.1998697, -0.01647078, -1.565181, 0, 1, 0.5921569, 1,
-0.1997861, 0.1076805, -0.4447103, 0, 1, 0.5960785, 1,
-0.199586, 1.078974, -0.5379477, 0, 1, 0.6039216, 1,
-0.1992603, 0.513344, 1.629271, 0, 1, 0.6117647, 1,
-0.1935305, -1.841508, -3.51438, 0, 1, 0.6156863, 1,
-0.1933516, 1.062778, -1.10655, 0, 1, 0.6235294, 1,
-0.1924951, -0.7590862, -2.382739, 0, 1, 0.627451, 1,
-0.1885795, -0.7588234, -2.632406, 0, 1, 0.6352941, 1,
-0.1864835, 1.399095, -1.582275, 0, 1, 0.6392157, 1,
-0.1827509, -0.8391922, -4.742065, 0, 1, 0.6470588, 1,
-0.1814632, 1.937688, -0.860909, 0, 1, 0.6509804, 1,
-0.1779418, -0.9464909, -1.320894, 0, 1, 0.6588235, 1,
-0.1735304, 1.786146, -0.4321614, 0, 1, 0.6627451, 1,
-0.1735254, -0.1801191, -2.630177, 0, 1, 0.6705883, 1,
-0.1726432, 0.2265753, -0.943795, 0, 1, 0.6745098, 1,
-0.1695774, -1.131248, -1.897525, 0, 1, 0.682353, 1,
-0.1682769, 1.098297, 0.8564739, 0, 1, 0.6862745, 1,
-0.1654431, 1.000633, -2.630102, 0, 1, 0.6941177, 1,
-0.163436, -0.7154337, -3.062997, 0, 1, 0.7019608, 1,
-0.1577413, -0.4705681, -1.347448, 0, 1, 0.7058824, 1,
-0.1565761, 1.045135, -0.7367736, 0, 1, 0.7137255, 1,
-0.1483662, -1.362692, -3.424813, 0, 1, 0.7176471, 1,
-0.1483219, 0.4411005, -2.028461, 0, 1, 0.7254902, 1,
-0.1454559, 0.4522846, -1.924829, 0, 1, 0.7294118, 1,
-0.1435915, 0.4698329, 1.03037, 0, 1, 0.7372549, 1,
-0.1432323, -1.700664, -1.132497, 0, 1, 0.7411765, 1,
-0.1390431, 0.74868, -1.411841, 0, 1, 0.7490196, 1,
-0.1386597, -1.055755, -2.769042, 0, 1, 0.7529412, 1,
-0.13665, -0.4006438, -3.149438, 0, 1, 0.7607843, 1,
-0.1322996, -0.2742125, -2.864787, 0, 1, 0.7647059, 1,
-0.1301689, 0.6419191, 1.6893, 0, 1, 0.772549, 1,
-0.1245434, -0.2308076, -3.713332, 0, 1, 0.7764706, 1,
-0.1241715, 1.492206, -1.17819, 0, 1, 0.7843137, 1,
-0.1240752, 0.0975929, -2.035031, 0, 1, 0.7882353, 1,
-0.1192512, 0.8579778, -1.855326, 0, 1, 0.7960784, 1,
-0.1188626, 1.810188, 0.9052002, 0, 1, 0.8039216, 1,
-0.1186127, 0.1606615, 0.2076553, 0, 1, 0.8078431, 1,
-0.1148991, 0.4637001, 0.8208933, 0, 1, 0.8156863, 1,
-0.1146313, -0.3893535, -3.930769, 0, 1, 0.8196079, 1,
-0.1132177, 1.551252, 0.6896263, 0, 1, 0.827451, 1,
-0.111473, 0.2531133, -0.8501675, 0, 1, 0.8313726, 1,
-0.1083766, 0.007331645, -2.149598, 0, 1, 0.8392157, 1,
-0.1069083, -0.1976653, -2.193624, 0, 1, 0.8431373, 1,
-0.1053308, -0.6488054, -3.254928, 0, 1, 0.8509804, 1,
-0.1049115, 2.206039, -0.765154, 0, 1, 0.854902, 1,
-0.1032849, -0.0572006, -3.170843, 0, 1, 0.8627451, 1,
-0.09248897, -0.8640857, -1.804861, 0, 1, 0.8666667, 1,
-0.09168644, -0.1388349, -3.810029, 0, 1, 0.8745098, 1,
-0.08894881, -1.372863, -1.234691, 0, 1, 0.8784314, 1,
-0.08564198, 1.589141, -1.55565, 0, 1, 0.8862745, 1,
-0.08457059, -0.08074573, -2.762628, 0, 1, 0.8901961, 1,
-0.08299325, -0.539355, -3.310131, 0, 1, 0.8980392, 1,
-0.08279194, -0.3609421, -4.221316, 0, 1, 0.9058824, 1,
-0.08128661, 0.07976846, -2.661515, 0, 1, 0.9098039, 1,
-0.08057866, -0.4614436, -3.92401, 0, 1, 0.9176471, 1,
-0.08030259, 0.522613, 1.271923, 0, 1, 0.9215686, 1,
-0.07896041, -2.100855, -2.297045, 0, 1, 0.9294118, 1,
-0.07144018, 0.6906016, -1.455177, 0, 1, 0.9333333, 1,
-0.06684426, 0.2253591, -1.517335, 0, 1, 0.9411765, 1,
-0.06640153, -1.215415, -2.184415, 0, 1, 0.945098, 1,
-0.06248217, -0.1702448, -3.179119, 0, 1, 0.9529412, 1,
-0.06228538, 0.1274321, -1.234013, 0, 1, 0.9568627, 1,
-0.06222143, 1.570856, -0.5451701, 0, 1, 0.9647059, 1,
-0.06219792, 1.102188, -0.04497699, 0, 1, 0.9686275, 1,
-0.06179939, 0.1821138, 0.1670965, 0, 1, 0.9764706, 1,
-0.05914927, -0.1143048, -3.546127, 0, 1, 0.9803922, 1,
-0.05792021, -1.484683, -2.150962, 0, 1, 0.9882353, 1,
-0.05693478, 0.2463785, 0.9234801, 0, 1, 0.9921569, 1,
-0.05539907, 0.6147767, -1.890647, 0, 1, 1, 1,
-0.0526883, 3.085731, -0.7677859, 0, 0.9921569, 1, 1,
-0.04516519, -0.5612757, -3.089597, 0, 0.9882353, 1, 1,
-0.04131551, 1.148477, 0.8934772, 0, 0.9803922, 1, 1,
-0.03431821, 1.265848, -1.962099, 0, 0.9764706, 1, 1,
-0.03266519, 0.1483397, 0.3384408, 0, 0.9686275, 1, 1,
-0.03213511, -0.273014, -1.484674, 0, 0.9647059, 1, 1,
-0.02668663, 0.2192363, -0.5271079, 0, 0.9568627, 1, 1,
-0.02301617, -1.265827, -4.749862, 0, 0.9529412, 1, 1,
-0.01735622, -0.08503068, -1.136602, 0, 0.945098, 1, 1,
-0.01406827, -0.3240722, -3.484116, 0, 0.9411765, 1, 1,
-0.01313676, -0.2795299, -1.301395, 0, 0.9333333, 1, 1,
-0.01241888, 0.642971, -1.368305, 0, 0.9294118, 1, 1,
-0.009999665, 0.2131983, -0.1020199, 0, 0.9215686, 1, 1,
-0.0009141167, -1.201555, -4.292231, 0, 0.9176471, 1, 1,
0.0005369323, 0.9934728, 0.107072, 0, 0.9098039, 1, 1,
0.001086199, -1.595022, 2.637766, 0, 0.9058824, 1, 1,
0.002631681, 1.089796, 2.234429, 0, 0.8980392, 1, 1,
0.002922858, 0.1214374, 0.04173838, 0, 0.8901961, 1, 1,
0.003792611, 0.7227811, -0.3176592, 0, 0.8862745, 1, 1,
0.01022285, -0.2600418, 2.280922, 0, 0.8784314, 1, 1,
0.01289001, -0.3347818, 4.617495, 0, 0.8745098, 1, 1,
0.01295073, 1.358912, -1.322163, 0, 0.8666667, 1, 1,
0.01382268, -0.4270764, 4.274322, 0, 0.8627451, 1, 1,
0.01432428, 1.234509, -0.6501219, 0, 0.854902, 1, 1,
0.01539023, -0.07803248, 2.945663, 0, 0.8509804, 1, 1,
0.0157637, 1.07115, -0.001736698, 0, 0.8431373, 1, 1,
0.01874863, -0.8462123, 3.872893, 0, 0.8392157, 1, 1,
0.01959603, 1.024837, -0.09309653, 0, 0.8313726, 1, 1,
0.02045589, 0.2694618, -0.5235214, 0, 0.827451, 1, 1,
0.02537943, -0.6650349, 3.751163, 0, 0.8196079, 1, 1,
0.02628983, -0.4794783, 3.19125, 0, 0.8156863, 1, 1,
0.02660955, -1.258501, 3.406668, 0, 0.8078431, 1, 1,
0.03228474, -0.6840615, 2.321663, 0, 0.8039216, 1, 1,
0.03259585, 0.1084269, 0.187781, 0, 0.7960784, 1, 1,
0.03637646, -1.800416, 3.7972, 0, 0.7882353, 1, 1,
0.04084419, 0.6052914, 2.381296, 0, 0.7843137, 1, 1,
0.04099547, -0.114733, 3.487597, 0, 0.7764706, 1, 1,
0.04609278, 0.03222326, 1.949956, 0, 0.772549, 1, 1,
0.04758387, -0.9026721, 5.77038, 0, 0.7647059, 1, 1,
0.04774092, -1.810912, 1.798635, 0, 0.7607843, 1, 1,
0.05062178, 1.179587, -0.5052651, 0, 0.7529412, 1, 1,
0.05513516, 0.8559682, -0.1564379, 0, 0.7490196, 1, 1,
0.05553549, 0.3542884, 2.285566, 0, 0.7411765, 1, 1,
0.06718357, 1.448129, -0.420966, 0, 0.7372549, 1, 1,
0.07243804, 1.523469, 0.5012875, 0, 0.7294118, 1, 1,
0.07279405, 0.06767665, 0.1953415, 0, 0.7254902, 1, 1,
0.07372237, -2.123814, 2.637018, 0, 0.7176471, 1, 1,
0.07553376, -0.6972706, 3.766868, 0, 0.7137255, 1, 1,
0.07579509, 0.5314144, -1.4887, 0, 0.7058824, 1, 1,
0.07716649, 0.6052098, 0.6431006, 0, 0.6980392, 1, 1,
0.0782424, -0.1555958, 2.876876, 0, 0.6941177, 1, 1,
0.07923427, 0.8369427, -0.05875819, 0, 0.6862745, 1, 1,
0.08014656, 1.05156, 0.4162384, 0, 0.682353, 1, 1,
0.08948798, 1.498192, 0.4269206, 0, 0.6745098, 1, 1,
0.08997238, 1.397384, 0.459722, 0, 0.6705883, 1, 1,
0.0900575, 0.6583331, 1.048872, 0, 0.6627451, 1, 1,
0.09832272, 0.959152, 0.9432532, 0, 0.6588235, 1, 1,
0.1014459, 0.03884798, 1.521791, 0, 0.6509804, 1, 1,
0.1038298, -0.7901991, 3.083559, 0, 0.6470588, 1, 1,
0.1121861, 0.4696567, 1.614473, 0, 0.6392157, 1, 1,
0.1134083, 0.8169529, -1.415119, 0, 0.6352941, 1, 1,
0.1137976, 0.1890422, 0.927078, 0, 0.627451, 1, 1,
0.1153132, -0.4535286, 0.4788296, 0, 0.6235294, 1, 1,
0.11701, 0.8075655, -1.356995, 0, 0.6156863, 1, 1,
0.1213512, -0.4572758, 3.10813, 0, 0.6117647, 1, 1,
0.1250504, -0.1689522, 1.958222, 0, 0.6039216, 1, 1,
0.1279838, 0.1664227, 0.6722015, 0, 0.5960785, 1, 1,
0.1287104, -0.5258986, 0.922173, 0, 0.5921569, 1, 1,
0.1294828, -0.093898, 3.314011, 0, 0.5843138, 1, 1,
0.1317943, 0.5782595, -0.5579142, 0, 0.5803922, 1, 1,
0.132404, -1.916786, 0.9874971, 0, 0.572549, 1, 1,
0.1324474, 0.5047227, -0.1529437, 0, 0.5686275, 1, 1,
0.1361942, 0.7404929, 0.3273413, 0, 0.5607843, 1, 1,
0.1368831, -0.4049135, 3.442807, 0, 0.5568628, 1, 1,
0.1383111, -0.3123259, 2.095956, 0, 0.5490196, 1, 1,
0.1404411, -1.088773, 3.21786, 0, 0.5450981, 1, 1,
0.144661, -1.826483, 2.299744, 0, 0.5372549, 1, 1,
0.1497981, -0.152126, 1.522038, 0, 0.5333334, 1, 1,
0.1499159, -0.4268348, 1.881436, 0, 0.5254902, 1, 1,
0.1513346, -0.6063855, 2.041743, 0, 0.5215687, 1, 1,
0.1514675, 0.2591189, 0.6274466, 0, 0.5137255, 1, 1,
0.1542804, 0.9562545, 1.459886, 0, 0.509804, 1, 1,
0.1554531, -0.2376748, 2.62611, 0, 0.5019608, 1, 1,
0.1567066, 0.9604768, -0.1866428, 0, 0.4941176, 1, 1,
0.1584829, 0.9294932, -1.462999, 0, 0.4901961, 1, 1,
0.1611873, -0.9896856, 2.239007, 0, 0.4823529, 1, 1,
0.1663856, -0.3513235, 2.793769, 0, 0.4784314, 1, 1,
0.1683913, -0.9287825, 5.067946, 0, 0.4705882, 1, 1,
0.1749884, -0.4354962, 2.93485, 0, 0.4666667, 1, 1,
0.1759112, -1.056655, 1.347992, 0, 0.4588235, 1, 1,
0.1787263, 0.7587312, -0.8836558, 0, 0.454902, 1, 1,
0.1791404, 0.4536476, -1.616342, 0, 0.4470588, 1, 1,
0.1838995, -0.6201136, 3.513364, 0, 0.4431373, 1, 1,
0.1851021, 0.3876561, 1.464645, 0, 0.4352941, 1, 1,
0.1853869, 1.363037, 1.125103, 0, 0.4313726, 1, 1,
0.1864966, -1.191875, 2.927217, 0, 0.4235294, 1, 1,
0.1889458, 0.3897234, -1.673566, 0, 0.4196078, 1, 1,
0.1891387, 0.8233776, 1.476528, 0, 0.4117647, 1, 1,
0.1979846, 0.3365691, 0.4211654, 0, 0.4078431, 1, 1,
0.1989036, 0.2267471, 0.2879761, 0, 0.4, 1, 1,
0.2010258, -0.1734888, 0.6857179, 0, 0.3921569, 1, 1,
0.2050041, 0.67614, -0.3358493, 0, 0.3882353, 1, 1,
0.2120157, -0.7029445, 2.400953, 0, 0.3803922, 1, 1,
0.212464, 0.297594, 0.03087259, 0, 0.3764706, 1, 1,
0.214048, -0.769858, 2.597148, 0, 0.3686275, 1, 1,
0.2181867, -1.409331, 2.097187, 0, 0.3647059, 1, 1,
0.2190185, 0.844174, 0.6446217, 0, 0.3568628, 1, 1,
0.2202366, -1.24281, 3.799033, 0, 0.3529412, 1, 1,
0.2206653, -0.5417982, 3.117963, 0, 0.345098, 1, 1,
0.2291025, 0.3241674, 1.056179, 0, 0.3411765, 1, 1,
0.2303241, 0.8536779, 0.8647246, 0, 0.3333333, 1, 1,
0.2309951, 1.076645, -0.7151255, 0, 0.3294118, 1, 1,
0.231139, -0.02676852, 2.015147, 0, 0.3215686, 1, 1,
0.2353843, 2.746236, -0.03498609, 0, 0.3176471, 1, 1,
0.2361218, 2.014946, 2.132762, 0, 0.3098039, 1, 1,
0.2387407, -1.216807, 4.861567, 0, 0.3058824, 1, 1,
0.2397606, -0.7261179, 2.28132, 0, 0.2980392, 1, 1,
0.2400208, -0.1107535, 0.0110631, 0, 0.2901961, 1, 1,
0.2452676, -0.4980009, 3.261492, 0, 0.2862745, 1, 1,
0.2462201, -0.4467971, 3.129927, 0, 0.2784314, 1, 1,
0.247024, 0.4370999, 0.1464, 0, 0.2745098, 1, 1,
0.248318, -0.4520718, 2.563725, 0, 0.2666667, 1, 1,
0.2515834, 0.1176715, 1.35049, 0, 0.2627451, 1, 1,
0.2521589, -0.3303609, 3.562265, 0, 0.254902, 1, 1,
0.2540319, 1.520774, 1.409461, 0, 0.2509804, 1, 1,
0.2606862, 1.251087, 1.915416, 0, 0.2431373, 1, 1,
0.2642515, 0.4972324, 0.2566045, 0, 0.2392157, 1, 1,
0.2669344, 0.2995247, 1.847114, 0, 0.2313726, 1, 1,
0.2686164, 0.1085328, 2.990171, 0, 0.227451, 1, 1,
0.2688694, 0.5371421, -0.2649916, 0, 0.2196078, 1, 1,
0.27007, 0.1421528, -0.7117288, 0, 0.2156863, 1, 1,
0.2704402, 0.9305692, 0.7333573, 0, 0.2078431, 1, 1,
0.2717203, 0.9674979, -0.8790942, 0, 0.2039216, 1, 1,
0.2721425, -0.2210642, 2.904699, 0, 0.1960784, 1, 1,
0.2721811, 1.450203, -0.7955613, 0, 0.1882353, 1, 1,
0.2723736, -1.853636, 2.520857, 0, 0.1843137, 1, 1,
0.2737526, 1.091848, 0.4625148, 0, 0.1764706, 1, 1,
0.2737776, 0.9235595, 3.254697, 0, 0.172549, 1, 1,
0.2765883, 0.671034, 3.21937, 0, 0.1647059, 1, 1,
0.2767565, -0.9461828, 4.344857, 0, 0.1607843, 1, 1,
0.2786696, 1.104092, -0.5063264, 0, 0.1529412, 1, 1,
0.2850105, -0.9797858, 3.568132, 0, 0.1490196, 1, 1,
0.2878829, 0.4334753, -0.6896851, 0, 0.1411765, 1, 1,
0.2889185, 0.4221128, 0.4805332, 0, 0.1372549, 1, 1,
0.2893654, 1.435582, 0.1524383, 0, 0.1294118, 1, 1,
0.2958976, 1.231792, 1.234386, 0, 0.1254902, 1, 1,
0.2970194, -0.8129219, 2.895459, 0, 0.1176471, 1, 1,
0.3046291, -1.567126, 4.976163, 0, 0.1137255, 1, 1,
0.3131805, -0.57705, -0.09777583, 0, 0.1058824, 1, 1,
0.3171849, 0.1978918, -0.2351774, 0, 0.09803922, 1, 1,
0.3202896, 2.038437, -0.3858238, 0, 0.09411765, 1, 1,
0.3229835, 0.4087521, 0.4065544, 0, 0.08627451, 1, 1,
0.3260118, -0.9394162, 1.495122, 0, 0.08235294, 1, 1,
0.3276347, -1.118711, 3.298658, 0, 0.07450981, 1, 1,
0.3289595, -0.4379564, 2.829421, 0, 0.07058824, 1, 1,
0.3310663, 1.477755, -0.05518576, 0, 0.0627451, 1, 1,
0.3314219, 0.6221783, 0.7061082, 0, 0.05882353, 1, 1,
0.334212, -1.010259, 1.878582, 0, 0.05098039, 1, 1,
0.3352165, 1.222394, 0.6467483, 0, 0.04705882, 1, 1,
0.3352309, 0.3496643, 0.8799338, 0, 0.03921569, 1, 1,
0.3355411, -0.7420911, 1.012563, 0, 0.03529412, 1, 1,
0.3383026, -0.1074993, 2.277802, 0, 0.02745098, 1, 1,
0.3421828, -0.5386881, 2.603304, 0, 0.02352941, 1, 1,
0.3426568, -0.3381096, 2.837532, 0, 0.01568628, 1, 1,
0.3469374, 0.4379964, 1.327068, 0, 0.01176471, 1, 1,
0.3532339, 1.160117, 0.01578499, 0, 0.003921569, 1, 1,
0.3552624, 1.075467, -1.458279, 0.003921569, 0, 1, 1,
0.3595648, 0.8228815, -0.967037, 0.007843138, 0, 1, 1,
0.3611856, -0.8103488, 1.883157, 0.01568628, 0, 1, 1,
0.363512, -0.5849995, 1.885223, 0.01960784, 0, 1, 1,
0.3656333, 0.4381097, 1.039654, 0.02745098, 0, 1, 1,
0.3705941, -0.05026169, 1.588334, 0.03137255, 0, 1, 1,
0.3790815, 0.3014362, -0.8338478, 0.03921569, 0, 1, 1,
0.3916112, 1.359573, 1.033308, 0.04313726, 0, 1, 1,
0.3960341, -1.53875, 3.094791, 0.05098039, 0, 1, 1,
0.4010382, 1.850429, -0.419061, 0.05490196, 0, 1, 1,
0.4049933, -0.6514708, 4.538627, 0.0627451, 0, 1, 1,
0.4076796, 1.478486, 0.2626078, 0.06666667, 0, 1, 1,
0.4118413, 0.2037854, 0.8444391, 0.07450981, 0, 1, 1,
0.4120255, 0.8950322, -0.3998344, 0.07843138, 0, 1, 1,
0.421698, 1.028787, 0.9595492, 0.08627451, 0, 1, 1,
0.4278441, -0.3963078, 1.83707, 0.09019608, 0, 1, 1,
0.427926, 1.198593, -0.847918, 0.09803922, 0, 1, 1,
0.4334903, 0.09053764, 0.1101776, 0.1058824, 0, 1, 1,
0.4354526, -1.276933, 2.674723, 0.1098039, 0, 1, 1,
0.4389713, -0.399472, -0.4996938, 0.1176471, 0, 1, 1,
0.44153, 0.4043191, 2.741847, 0.1215686, 0, 1, 1,
0.4444578, 0.8735458, 0.472822, 0.1294118, 0, 1, 1,
0.4452787, 0.906848, 1.226161, 0.1333333, 0, 1, 1,
0.4469039, 0.111118, 2.292319, 0.1411765, 0, 1, 1,
0.4476866, -0.936973, 2.754744, 0.145098, 0, 1, 1,
0.4506019, 0.5385668, 0.2301109, 0.1529412, 0, 1, 1,
0.4535772, -0.1532446, 0.4581518, 0.1568628, 0, 1, 1,
0.4572727, 0.6602418, 1.492123, 0.1647059, 0, 1, 1,
0.4705139, 1.19185, 0.4146275, 0.1686275, 0, 1, 1,
0.4773275, 0.4376964, 0.13823, 0.1764706, 0, 1, 1,
0.4773677, 0.2408895, -0.616721, 0.1803922, 0, 1, 1,
0.4796826, 1.549691, -0.8131753, 0.1882353, 0, 1, 1,
0.4830326, 0.4332096, 2.276137, 0.1921569, 0, 1, 1,
0.4855367, -1.263643, 4.347324, 0.2, 0, 1, 1,
0.4876876, -0.6087136, 1.158848, 0.2078431, 0, 1, 1,
0.4922751, -1.707496, 1.570095, 0.2117647, 0, 1, 1,
0.5012471, -1.638607, 2.649649, 0.2196078, 0, 1, 1,
0.5020776, 0.3450713, 0.1927128, 0.2235294, 0, 1, 1,
0.511356, 0.3449857, 3.04731, 0.2313726, 0, 1, 1,
0.5201789, -1.266047, 2.410372, 0.2352941, 0, 1, 1,
0.5239424, -0.9523869, 3.432428, 0.2431373, 0, 1, 1,
0.5243035, 0.8084254, 0.6389731, 0.2470588, 0, 1, 1,
0.5288389, -0.6374061, 1.527296, 0.254902, 0, 1, 1,
0.5293074, -0.08503217, 2.140597, 0.2588235, 0, 1, 1,
0.5297596, -0.2110891, 1.01057, 0.2666667, 0, 1, 1,
0.5299354, -1.46583, 4.458753, 0.2705882, 0, 1, 1,
0.5332662, -0.4224063, 2.569381, 0.2784314, 0, 1, 1,
0.5366684, 1.189534, -1.046978, 0.282353, 0, 1, 1,
0.5393167, -0.3551315, 1.322155, 0.2901961, 0, 1, 1,
0.5410248, -0.9137052, 1.796229, 0.2941177, 0, 1, 1,
0.5416666, 0.4841719, -1.571506, 0.3019608, 0, 1, 1,
0.5420681, -1.071192, 2.988193, 0.3098039, 0, 1, 1,
0.5423085, -0.8375928, 1.772189, 0.3137255, 0, 1, 1,
0.5474243, -0.7328267, 2.15499, 0.3215686, 0, 1, 1,
0.5475322, 0.358671, 2.601105, 0.3254902, 0, 1, 1,
0.5488351, 0.08273567, 1.635878, 0.3333333, 0, 1, 1,
0.5494654, 0.07760072, 1.593989, 0.3372549, 0, 1, 1,
0.549797, -0.09144637, 1.510486, 0.345098, 0, 1, 1,
0.5499254, 0.6438025, -1.840903, 0.3490196, 0, 1, 1,
0.5509542, -0.4240245, 1.281899, 0.3568628, 0, 1, 1,
0.5525457, 2.30727, -2.005243, 0.3607843, 0, 1, 1,
0.5551107, -0.7905394, 3.333779, 0.3686275, 0, 1, 1,
0.5557716, -0.2584253, 0.9438414, 0.372549, 0, 1, 1,
0.5564834, 0.2942083, 2.493004, 0.3803922, 0, 1, 1,
0.5584382, 1.158827, 2.588934, 0.3843137, 0, 1, 1,
0.5615569, -1.132518, 2.963318, 0.3921569, 0, 1, 1,
0.5712373, -0.6541002, 3.898039, 0.3960784, 0, 1, 1,
0.5716129, -2.074171, 2.658428, 0.4039216, 0, 1, 1,
0.5760313, 0.4341451, 0.9438001, 0.4117647, 0, 1, 1,
0.5876775, 0.4758571, 1.101764, 0.4156863, 0, 1, 1,
0.5934301, -0.1188725, 3.122547, 0.4235294, 0, 1, 1,
0.5946388, -2.143698, 2.852666, 0.427451, 0, 1, 1,
0.5952184, -0.8307499, 1.859653, 0.4352941, 0, 1, 1,
0.5958767, -0.9882801, 2.891818, 0.4392157, 0, 1, 1,
0.6005767, 1.445523, -0.2409467, 0.4470588, 0, 1, 1,
0.6019321, -0.6674745, 2.004429, 0.4509804, 0, 1, 1,
0.6040726, 0.5196587, 1.111428, 0.4588235, 0, 1, 1,
0.6082094, 1.546294, -0.6438673, 0.4627451, 0, 1, 1,
0.609248, 0.01528668, 2.347479, 0.4705882, 0, 1, 1,
0.6114881, 0.3016996, 1.273797, 0.4745098, 0, 1, 1,
0.6160761, -0.5897276, 0.9168046, 0.4823529, 0, 1, 1,
0.6171935, 0.3801457, 1.396669, 0.4862745, 0, 1, 1,
0.6260622, 1.06959, -0.6032956, 0.4941176, 0, 1, 1,
0.6269783, -0.163482, -0.04409901, 0.5019608, 0, 1, 1,
0.6290801, -1.506709, 3.842733, 0.5058824, 0, 1, 1,
0.6296776, -1.137339, 2.301031, 0.5137255, 0, 1, 1,
0.6324891, -1.548736, 4.095897, 0.5176471, 0, 1, 1,
0.6350562, -0.391399, 3.23828, 0.5254902, 0, 1, 1,
0.6370074, -1.255622, 0.7759323, 0.5294118, 0, 1, 1,
0.6371598, 0.3995294, 1.522387, 0.5372549, 0, 1, 1,
0.6376843, -0.503775, 2.788949, 0.5411765, 0, 1, 1,
0.6403055, -0.1869549, 0.7604802, 0.5490196, 0, 1, 1,
0.6428502, 0.008730446, 1.664058, 0.5529412, 0, 1, 1,
0.6450468, 0.1010056, 2.047617, 0.5607843, 0, 1, 1,
0.6490707, 1.33045, 2.258892, 0.5647059, 0, 1, 1,
0.6542581, -1.875681, 0.8307617, 0.572549, 0, 1, 1,
0.6609263, 0.6946511, 1.128322, 0.5764706, 0, 1, 1,
0.6643125, 0.336241, 0.1058874, 0.5843138, 0, 1, 1,
0.6705316, 1.117126, 0.8169531, 0.5882353, 0, 1, 1,
0.6727933, -0.9618968, 3.968857, 0.5960785, 0, 1, 1,
0.6738941, -0.4067099, 2.350846, 0.6039216, 0, 1, 1,
0.6762961, -0.1852307, 0.2523375, 0.6078432, 0, 1, 1,
0.6782281, -0.4912856, 0.3856477, 0.6156863, 0, 1, 1,
0.6897328, -0.02365263, 0.5429272, 0.6196079, 0, 1, 1,
0.6906746, -0.01823322, 1.046772, 0.627451, 0, 1, 1,
0.6931679, -0.2492167, 2.851547, 0.6313726, 0, 1, 1,
0.696727, 0.7487317, -0.6230114, 0.6392157, 0, 1, 1,
0.6975324, 0.5391754, 2.165968, 0.6431373, 0, 1, 1,
0.7037772, 1.007667, 1.019503, 0.6509804, 0, 1, 1,
0.7147276, 0.7430956, 2.649528, 0.654902, 0, 1, 1,
0.7161726, -0.8983049, 1.698952, 0.6627451, 0, 1, 1,
0.7220876, 2.05578e-05, 2.070174, 0.6666667, 0, 1, 1,
0.729444, -1.308646, 2.464414, 0.6745098, 0, 1, 1,
0.732455, -0.4549733, 2.337527, 0.6784314, 0, 1, 1,
0.7384427, 1.090297, 1.27499, 0.6862745, 0, 1, 1,
0.7412162, -2.79125, 3.200946, 0.6901961, 0, 1, 1,
0.7424098, 1.021889, 0.4056216, 0.6980392, 0, 1, 1,
0.7425119, 1.423462, -0.404183, 0.7058824, 0, 1, 1,
0.743407, 0.8086185, 1.684502, 0.7098039, 0, 1, 1,
0.74502, 0.8030269, -0.5368308, 0.7176471, 0, 1, 1,
0.7457064, 0.5209739, -0.2289112, 0.7215686, 0, 1, 1,
0.750255, -1.191343, 2.124015, 0.7294118, 0, 1, 1,
0.7552443, 0.458123, -0.0008291816, 0.7333333, 0, 1, 1,
0.765575, 1.969193, 1.644619, 0.7411765, 0, 1, 1,
0.7673189, 0.2515544, 0.4391907, 0.7450981, 0, 1, 1,
0.7683936, -0.7712449, 1.826112, 0.7529412, 0, 1, 1,
0.7714541, 0.321404, -1.054906, 0.7568628, 0, 1, 1,
0.775912, 1.915405, 0.08555675, 0.7647059, 0, 1, 1,
0.7779564, 0.3501625, 1.818858, 0.7686275, 0, 1, 1,
0.7795088, -0.8165095, 4.220179, 0.7764706, 0, 1, 1,
0.7802326, 1.931499, -1.309863, 0.7803922, 0, 1, 1,
0.7854533, 0.05459185, 1.238228, 0.7882353, 0, 1, 1,
0.7859231, -0.443962, 2.54936, 0.7921569, 0, 1, 1,
0.7895492, -0.623216, -0.4563099, 0.8, 0, 1, 1,
0.7910143, -0.4668941, 2.99581, 0.8078431, 0, 1, 1,
0.7937891, -0.5834273, 1.889465, 0.8117647, 0, 1, 1,
0.7968214, -0.7921655, 0.4405566, 0.8196079, 0, 1, 1,
0.798084, 0.6712755, 1.719773, 0.8235294, 0, 1, 1,
0.8019669, -0.2389215, 1.177031, 0.8313726, 0, 1, 1,
0.8025753, 0.08929706, 1.207508, 0.8352941, 0, 1, 1,
0.8070691, 1.256289, 1.334161, 0.8431373, 0, 1, 1,
0.8096732, 0.2951243, 0.531112, 0.8470588, 0, 1, 1,
0.8103938, -0.2583178, 3.920244, 0.854902, 0, 1, 1,
0.8125474, 2.053807, -0.1617391, 0.8588235, 0, 1, 1,
0.8161944, 0.5486685, 0.9487427, 0.8666667, 0, 1, 1,
0.8185657, 0.4470017, 1.085527, 0.8705882, 0, 1, 1,
0.8243379, 0.7604845, -0.3748161, 0.8784314, 0, 1, 1,
0.8266803, -0.1778064, 4.626237, 0.8823529, 0, 1, 1,
0.82961, -0.06274403, 1.533077, 0.8901961, 0, 1, 1,
0.830458, -0.4308197, 2.199927, 0.8941177, 0, 1, 1,
0.8307034, -0.4573727, 1.397596, 0.9019608, 0, 1, 1,
0.8346855, -1.777721, 2.742124, 0.9098039, 0, 1, 1,
0.837217, 0.4252222, 1.790555, 0.9137255, 0, 1, 1,
0.8374745, -0.1710553, 0.4051698, 0.9215686, 0, 1, 1,
0.8446918, 2.094166, 1.51825, 0.9254902, 0, 1, 1,
0.8519821, 0.2704381, 2.285122, 0.9333333, 0, 1, 1,
0.8569851, 1.213299, 1.310078, 0.9372549, 0, 1, 1,
0.8583332, -0.6375686, 1.421551, 0.945098, 0, 1, 1,
0.8584723, 1.172514, 0.3148942, 0.9490196, 0, 1, 1,
0.8608938, 0.7527004, 1.695835, 0.9568627, 0, 1, 1,
0.8611406, -0.3931436, 1.995419, 0.9607843, 0, 1, 1,
0.8634523, 0.2928551, 1.125537, 0.9686275, 0, 1, 1,
0.8650346, 1.293291, 2.267786, 0.972549, 0, 1, 1,
0.8698666, -0.3923548, 0.8044577, 0.9803922, 0, 1, 1,
0.8804446, -0.2981824, 0.8263077, 0.9843137, 0, 1, 1,
0.8824398, 0.03528068, 1.940412, 0.9921569, 0, 1, 1,
0.8924442, 0.7481374, 1.07133, 0.9960784, 0, 1, 1,
0.9036814, -0.2266164, 1.133287, 1, 0, 0.9960784, 1,
0.9065484, 0.9458514, 1.826682, 1, 0, 0.9882353, 1,
0.910715, -0.1318882, 1.032469, 1, 0, 0.9843137, 1,
0.9109253, -2.739613, 1.882532, 1, 0, 0.9764706, 1,
0.9253231, -1.17784, 2.731152, 1, 0, 0.972549, 1,
0.9315023, 1.128884, 0.5568278, 1, 0, 0.9647059, 1,
0.9328158, -2.11023, 2.696176, 1, 0, 0.9607843, 1,
0.9472005, 0.8142086, -0.3503312, 1, 0, 0.9529412, 1,
0.9475171, -1.054397, 2.270281, 1, 0, 0.9490196, 1,
0.9482192, 0.8668836, 0.7308329, 1, 0, 0.9411765, 1,
0.9531686, -2.521661, 4.334878, 1, 0, 0.9372549, 1,
0.9544342, 0.5532582, 1.543191, 1, 0, 0.9294118, 1,
0.9568494, -0.1002659, 1.224985, 1, 0, 0.9254902, 1,
0.9655881, -0.9168941, 2.870178, 1, 0, 0.9176471, 1,
0.9800361, -0.4206498, 1.325683, 1, 0, 0.9137255, 1,
0.9831696, 0.2704917, 0.6073337, 1, 0, 0.9058824, 1,
0.983178, 1.847418, -0.3045092, 1, 0, 0.9019608, 1,
0.9885439, 0.2053057, 2.504236, 1, 0, 0.8941177, 1,
0.9887549, 0.491827, 0.6121691, 1, 0, 0.8862745, 1,
0.9896004, 0.854752, 1.251228, 1, 0, 0.8823529, 1,
0.9926066, 0.4661156, 1.743943, 1, 0, 0.8745098, 1,
0.9927998, 1.290996, 1.525854, 1, 0, 0.8705882, 1,
0.99329, 0.08234601, 3.257245, 1, 0, 0.8627451, 1,
0.9970355, 0.2835049, 2.117059, 1, 0, 0.8588235, 1,
1.000949, -0.1440035, 2.817401, 1, 0, 0.8509804, 1,
1.0027, -0.8788994, -0.5335671, 1, 0, 0.8470588, 1,
1.008562, 0.03679932, 0.8060575, 1, 0, 0.8392157, 1,
1.012709, -1.318832, 2.383466, 1, 0, 0.8352941, 1,
1.019541, 1.452239, 1.84442, 1, 0, 0.827451, 1,
1.028159, 1.437932, -1.320068, 1, 0, 0.8235294, 1,
1.031425, 0.9005498, 1.096705, 1, 0, 0.8156863, 1,
1.041143, -0.1647241, 2.087348, 1, 0, 0.8117647, 1,
1.043794, -0.714008, 1.062508, 1, 0, 0.8039216, 1,
1.045141, -0.05712856, 0.1487707, 1, 0, 0.7960784, 1,
1.046884, 1.239918, -0.1963796, 1, 0, 0.7921569, 1,
1.052865, 2.085869, -0.7221536, 1, 0, 0.7843137, 1,
1.055676, -0.02426676, 0.7827546, 1, 0, 0.7803922, 1,
1.060877, 1.219174, 0.4416818, 1, 0, 0.772549, 1,
1.062944, 0.8150406, 1.177609, 1, 0, 0.7686275, 1,
1.072501, -0.714983, 0.9993779, 1, 0, 0.7607843, 1,
1.073724, -1.042101, 1.701024, 1, 0, 0.7568628, 1,
1.076173, -0.984431, 2.118178, 1, 0, 0.7490196, 1,
1.077736, -0.1135052, 1.203116, 1, 0, 0.7450981, 1,
1.084927, 0.5369335, 0.5148644, 1, 0, 0.7372549, 1,
1.094235, 0.07180038, 2.841287, 1, 0, 0.7333333, 1,
1.097364, -1.907462, 0.9386106, 1, 0, 0.7254902, 1,
1.099937, 0.2932454, 2.082805, 1, 0, 0.7215686, 1,
1.116207, -0.3583165, 0.7034581, 1, 0, 0.7137255, 1,
1.118011, -0.6830206, 1.680057, 1, 0, 0.7098039, 1,
1.118126, 1.431131, 0.6634744, 1, 0, 0.7019608, 1,
1.120026, -0.9653203, 1.800023, 1, 0, 0.6941177, 1,
1.122206, 1.589241, 0.05592955, 1, 0, 0.6901961, 1,
1.122831, 0.6968592, 1.849345, 1, 0, 0.682353, 1,
1.125982, 0.2323999, 0.830153, 1, 0, 0.6784314, 1,
1.132985, 0.2114032, 2.562289, 1, 0, 0.6705883, 1,
1.13715, -1.152966, 2.097193, 1, 0, 0.6666667, 1,
1.139135, 1.933269, 0.423499, 1, 0, 0.6588235, 1,
1.151964, -0.2713984, 0.4996675, 1, 0, 0.654902, 1,
1.157736, 0.5499374, 2.140562, 1, 0, 0.6470588, 1,
1.162005, -0.2356761, 1.481457, 1, 0, 0.6431373, 1,
1.167454, -1.804861, 1.266026, 1, 0, 0.6352941, 1,
1.174142, 0.4540752, 1.175099, 1, 0, 0.6313726, 1,
1.182887, -0.4463284, 3.040048, 1, 0, 0.6235294, 1,
1.18432, -0.7403912, 1.334079, 1, 0, 0.6196079, 1,
1.186237, -0.7928913, 0.7060819, 1, 0, 0.6117647, 1,
1.202956, 0.1845918, 0.6644287, 1, 0, 0.6078432, 1,
1.222236, -1.106555, 1.582458, 1, 0, 0.6, 1,
1.226974, 1.094364, 0.8619145, 1, 0, 0.5921569, 1,
1.230634, -1.83874, 1.809662, 1, 0, 0.5882353, 1,
1.255829, 0.1920143, 1.826878, 1, 0, 0.5803922, 1,
1.259231, 0.3102978, 1.835224, 1, 0, 0.5764706, 1,
1.269148, 0.2233194, 0.394225, 1, 0, 0.5686275, 1,
1.271895, 0.9922943, 1.381562, 1, 0, 0.5647059, 1,
1.289181, -1.187729, 3.275862, 1, 0, 0.5568628, 1,
1.293175, -0.241353, 2.72349, 1, 0, 0.5529412, 1,
1.294468, 0.7240817, 1.855015, 1, 0, 0.5450981, 1,
1.294816, -0.09381611, 0.5554717, 1, 0, 0.5411765, 1,
1.296811, 0.6546057, 0.04617599, 1, 0, 0.5333334, 1,
1.299333, -0.476501, 2.380836, 1, 0, 0.5294118, 1,
1.30108, -2.12626, 3.112386, 1, 0, 0.5215687, 1,
1.302687, -0.7794631, 1.631335, 1, 0, 0.5176471, 1,
1.307171, -0.4353145, 1.844451, 1, 0, 0.509804, 1,
1.308051, -0.2908673, 1.826848, 1, 0, 0.5058824, 1,
1.314215, -0.01127819, 1.808521, 1, 0, 0.4980392, 1,
1.318946, 0.1022796, -0.02569677, 1, 0, 0.4901961, 1,
1.322331, -0.2180336, 2.137587, 1, 0, 0.4862745, 1,
1.324066, 0.4116473, 0.6522986, 1, 0, 0.4784314, 1,
1.324421, -0.1719477, 1.427679, 1, 0, 0.4745098, 1,
1.324685, -1.692964, 2.035432, 1, 0, 0.4666667, 1,
1.328896, -0.6440959, 1.174553, 1, 0, 0.4627451, 1,
1.33201, -0.8929173, 2.098623, 1, 0, 0.454902, 1,
1.332047, 0.6694114, 0.7594241, 1, 0, 0.4509804, 1,
1.347226, -0.06252325, 1.781426, 1, 0, 0.4431373, 1,
1.350406, 0.2935672, 2.336025, 1, 0, 0.4392157, 1,
1.354395, -0.6126642, 2.823955, 1, 0, 0.4313726, 1,
1.365135, 1.49784, 1.021536, 1, 0, 0.427451, 1,
1.400985, 0.1196886, 1.906451, 1, 0, 0.4196078, 1,
1.402917, -0.7195094, 2.184595, 1, 0, 0.4156863, 1,
1.40608, -0.4155925, 2.1129, 1, 0, 0.4078431, 1,
1.41032, -0.8923378, 2.375812, 1, 0, 0.4039216, 1,
1.424199, 0.2027278, 2.015107, 1, 0, 0.3960784, 1,
1.424834, -0.1791809, 3.051444, 1, 0, 0.3882353, 1,
1.434026, -0.5223518, 2.584772, 1, 0, 0.3843137, 1,
1.436599, 0.3994439, 1.001292, 1, 0, 0.3764706, 1,
1.449224, -0.7505856, 1.242858, 1, 0, 0.372549, 1,
1.451941, 1.619151, 1.255955, 1, 0, 0.3647059, 1,
1.453453, -0.7122483, 2.541984, 1, 0, 0.3607843, 1,
1.46071, 0.5588875, 1.934225, 1, 0, 0.3529412, 1,
1.471494, 0.537174, 3.428746, 1, 0, 0.3490196, 1,
1.475955, 1.359286, 1.119323, 1, 0, 0.3411765, 1,
1.482813, 0.9843242, 0.2990113, 1, 0, 0.3372549, 1,
1.488738, -1.520694, 1.074175, 1, 0, 0.3294118, 1,
1.490745, -0.8713431, 2.053289, 1, 0, 0.3254902, 1,
1.497244, 0.191254, 0.7975602, 1, 0, 0.3176471, 1,
1.499212, 1.265051, -0.02248368, 1, 0, 0.3137255, 1,
1.501494, -0.02212212, 2.103328, 1, 0, 0.3058824, 1,
1.503737, -1.381246, 1.470162, 1, 0, 0.2980392, 1,
1.512031, -0.1050271, 1.221185, 1, 0, 0.2941177, 1,
1.525309, 0.551534, 0.4439818, 1, 0, 0.2862745, 1,
1.559858, -1.148118, 2.956391, 1, 0, 0.282353, 1,
1.560836, 1.445439, 1.34358, 1, 0, 0.2745098, 1,
1.5671, -1.092634, 0.8937999, 1, 0, 0.2705882, 1,
1.579452, 1.621257, 2.827132, 1, 0, 0.2627451, 1,
1.58326, -0.5520045, 3.017853, 1, 0, 0.2588235, 1,
1.587226, 0.07539088, 1.281324, 1, 0, 0.2509804, 1,
1.599322, 1.041391, -0.6405106, 1, 0, 0.2470588, 1,
1.61894, 1.731162, 1.496254, 1, 0, 0.2392157, 1,
1.630292, 0.1317691, 0.00793076, 1, 0, 0.2352941, 1,
1.646876, 0.9277784, 0.8063998, 1, 0, 0.227451, 1,
1.660578, 0.4718422, 1.693339, 1, 0, 0.2235294, 1,
1.726751, 0.08889614, 1.9837, 1, 0, 0.2156863, 1,
1.737623, 2.110603, 0.3915773, 1, 0, 0.2117647, 1,
1.738993, 0.1693196, 1.490535, 1, 0, 0.2039216, 1,
1.758822, 0.01688933, 1.121877, 1, 0, 0.1960784, 1,
1.776921, 0.6679105, 1.576512, 1, 0, 0.1921569, 1,
1.792249, -0.6132024, 1.713098, 1, 0, 0.1843137, 1,
1.797643, -0.6406675, 4.286411, 1, 0, 0.1803922, 1,
1.816349, -1.441555, 1.314053, 1, 0, 0.172549, 1,
1.826624, 0.8637878, 1.946451, 1, 0, 0.1686275, 1,
1.832977, -1.200585, 1.932151, 1, 0, 0.1607843, 1,
1.857658, 0.04016949, 1.87109, 1, 0, 0.1568628, 1,
1.86356, -0.4895686, 2.728018, 1, 0, 0.1490196, 1,
1.88004, 2.069281, -2.05934, 1, 0, 0.145098, 1,
1.900574, -1.143946, 0.7334561, 1, 0, 0.1372549, 1,
1.918319, -2.505861, 3.35001, 1, 0, 0.1333333, 1,
1.923003, -0.8280272, 3.112913, 1, 0, 0.1254902, 1,
1.935584, 0.1178243, 3.487667, 1, 0, 0.1215686, 1,
1.955914, 0.7357036, 1.395776, 1, 0, 0.1137255, 1,
1.996993, 0.2616714, 1.687184, 1, 0, 0.1098039, 1,
2.00016, -0.9812127, 0.4833227, 1, 0, 0.1019608, 1,
2.079536, -0.5879044, 0.8804369, 1, 0, 0.09411765, 1,
2.093416, -0.7644351, 0.05695116, 1, 0, 0.09019608, 1,
2.129669, 0.301552, 1.737701, 1, 0, 0.08235294, 1,
2.154042, 0.3353049, -0.06096964, 1, 0, 0.07843138, 1,
2.186877, -2.502974, 1.553152, 1, 0, 0.07058824, 1,
2.222293, -1.062415, 1.829232, 1, 0, 0.06666667, 1,
2.341135, -0.5615085, 2.099936, 1, 0, 0.05882353, 1,
2.364785, 0.7214765, 0.9055389, 1, 0, 0.05490196, 1,
2.385577, 0.1629612, 2.44168, 1, 0, 0.04705882, 1,
2.414616, -1.397917, 2.916085, 1, 0, 0.04313726, 1,
2.419675, 2.898328, 2.436439, 1, 0, 0.03529412, 1,
2.512871, -0.04913922, 3.333093, 1, 0, 0.03137255, 1,
2.521506, 0.4035188, 2.098696, 1, 0, 0.02352941, 1,
2.555665, -1.909973, 1.314331, 1, 0, 0.01960784, 1,
2.790118, -1.977504, 1.266105, 1, 0, 0.01176471, 1,
2.80273, -1.453087, 2.297642, 1, 0, 0.007843138, 1
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
-0.1313868, -3.787398, -7.096666, 0, -0.5, 0.5, 0.5,
-0.1313868, -3.787398, -7.096666, 1, -0.5, 0.5, 0.5,
-0.1313868, -3.787398, -7.096666, 1, 1.5, 0.5, 0.5,
-0.1313868, -3.787398, -7.096666, 0, 1.5, 0.5, 0.5
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
-4.060169, 0.1472406, -7.096666, 0, -0.5, 0.5, 0.5,
-4.060169, 0.1472406, -7.096666, 1, -0.5, 0.5, 0.5,
-4.060169, 0.1472406, -7.096666, 1, 1.5, 0.5, 0.5,
-4.060169, 0.1472406, -7.096666, 0, 1.5, 0.5, 0.5
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
-4.060169, -3.787398, 0.2692916, 0, -0.5, 0.5, 0.5,
-4.060169, -3.787398, 0.2692916, 1, -0.5, 0.5, 0.5,
-4.060169, -3.787398, 0.2692916, 1, 1.5, 0.5, 0.5,
-4.060169, -3.787398, 0.2692916, 0, 1.5, 0.5, 0.5
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
-3, -2.879405, -5.39683,
2, -2.879405, -5.39683,
-3, -2.879405, -5.39683,
-3, -3.030737, -5.680135,
-2, -2.879405, -5.39683,
-2, -3.030737, -5.680135,
-1, -2.879405, -5.39683,
-1, -3.030737, -5.680135,
0, -2.879405, -5.39683,
0, -3.030737, -5.680135,
1, -2.879405, -5.39683,
1, -3.030737, -5.680135,
2, -2.879405, -5.39683,
2, -3.030737, -5.680135
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
-3, -3.333401, -6.246747, 0, -0.5, 0.5, 0.5,
-3, -3.333401, -6.246747, 1, -0.5, 0.5, 0.5,
-3, -3.333401, -6.246747, 1, 1.5, 0.5, 0.5,
-3, -3.333401, -6.246747, 0, 1.5, 0.5, 0.5,
-2, -3.333401, -6.246747, 0, -0.5, 0.5, 0.5,
-2, -3.333401, -6.246747, 1, -0.5, 0.5, 0.5,
-2, -3.333401, -6.246747, 1, 1.5, 0.5, 0.5,
-2, -3.333401, -6.246747, 0, 1.5, 0.5, 0.5,
-1, -3.333401, -6.246747, 0, -0.5, 0.5, 0.5,
-1, -3.333401, -6.246747, 1, -0.5, 0.5, 0.5,
-1, -3.333401, -6.246747, 1, 1.5, 0.5, 0.5,
-1, -3.333401, -6.246747, 0, 1.5, 0.5, 0.5,
0, -3.333401, -6.246747, 0, -0.5, 0.5, 0.5,
0, -3.333401, -6.246747, 1, -0.5, 0.5, 0.5,
0, -3.333401, -6.246747, 1, 1.5, 0.5, 0.5,
0, -3.333401, -6.246747, 0, 1.5, 0.5, 0.5,
1, -3.333401, -6.246747, 0, -0.5, 0.5, 0.5,
1, -3.333401, -6.246747, 1, -0.5, 0.5, 0.5,
1, -3.333401, -6.246747, 1, 1.5, 0.5, 0.5,
1, -3.333401, -6.246747, 0, 1.5, 0.5, 0.5,
2, -3.333401, -6.246747, 0, -0.5, 0.5, 0.5,
2, -3.333401, -6.246747, 1, -0.5, 0.5, 0.5,
2, -3.333401, -6.246747, 1, 1.5, 0.5, 0.5,
2, -3.333401, -6.246747, 0, 1.5, 0.5, 0.5
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
-3.153527, -2, -5.39683,
-3.153527, 3, -5.39683,
-3.153527, -2, -5.39683,
-3.304634, -2, -5.680135,
-3.153527, -1, -5.39683,
-3.304634, -1, -5.680135,
-3.153527, 0, -5.39683,
-3.304634, 0, -5.680135,
-3.153527, 1, -5.39683,
-3.304634, 1, -5.680135,
-3.153527, 2, -5.39683,
-3.304634, 2, -5.680135,
-3.153527, 3, -5.39683,
-3.304634, 3, -5.680135
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
-3.606848, -2, -6.246747, 0, -0.5, 0.5, 0.5,
-3.606848, -2, -6.246747, 1, -0.5, 0.5, 0.5,
-3.606848, -2, -6.246747, 1, 1.5, 0.5, 0.5,
-3.606848, -2, -6.246747, 0, 1.5, 0.5, 0.5,
-3.606848, -1, -6.246747, 0, -0.5, 0.5, 0.5,
-3.606848, -1, -6.246747, 1, -0.5, 0.5, 0.5,
-3.606848, -1, -6.246747, 1, 1.5, 0.5, 0.5,
-3.606848, -1, -6.246747, 0, 1.5, 0.5, 0.5,
-3.606848, 0, -6.246747, 0, -0.5, 0.5, 0.5,
-3.606848, 0, -6.246747, 1, -0.5, 0.5, 0.5,
-3.606848, 0, -6.246747, 1, 1.5, 0.5, 0.5,
-3.606848, 0, -6.246747, 0, 1.5, 0.5, 0.5,
-3.606848, 1, -6.246747, 0, -0.5, 0.5, 0.5,
-3.606848, 1, -6.246747, 1, -0.5, 0.5, 0.5,
-3.606848, 1, -6.246747, 1, 1.5, 0.5, 0.5,
-3.606848, 1, -6.246747, 0, 1.5, 0.5, 0.5,
-3.606848, 2, -6.246747, 0, -0.5, 0.5, 0.5,
-3.606848, 2, -6.246747, 1, -0.5, 0.5, 0.5,
-3.606848, 2, -6.246747, 1, 1.5, 0.5, 0.5,
-3.606848, 2, -6.246747, 0, 1.5, 0.5, 0.5,
-3.606848, 3, -6.246747, 0, -0.5, 0.5, 0.5,
-3.606848, 3, -6.246747, 1, -0.5, 0.5, 0.5,
-3.606848, 3, -6.246747, 1, 1.5, 0.5, 0.5,
-3.606848, 3, -6.246747, 0, 1.5, 0.5, 0.5
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
-3.153527, -2.879405, -4,
-3.153527, -2.879405, 4,
-3.153527, -2.879405, -4,
-3.304634, -3.030737, -4,
-3.153527, -2.879405, -2,
-3.304634, -3.030737, -2,
-3.153527, -2.879405, 0,
-3.304634, -3.030737, 0,
-3.153527, -2.879405, 2,
-3.304634, -3.030737, 2,
-3.153527, -2.879405, 4,
-3.304634, -3.030737, 4
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
-3.606848, -3.333401, -4, 0, -0.5, 0.5, 0.5,
-3.606848, -3.333401, -4, 1, -0.5, 0.5, 0.5,
-3.606848, -3.333401, -4, 1, 1.5, 0.5, 0.5,
-3.606848, -3.333401, -4, 0, 1.5, 0.5, 0.5,
-3.606848, -3.333401, -2, 0, -0.5, 0.5, 0.5,
-3.606848, -3.333401, -2, 1, -0.5, 0.5, 0.5,
-3.606848, -3.333401, -2, 1, 1.5, 0.5, 0.5,
-3.606848, -3.333401, -2, 0, 1.5, 0.5, 0.5,
-3.606848, -3.333401, 0, 0, -0.5, 0.5, 0.5,
-3.606848, -3.333401, 0, 1, -0.5, 0.5, 0.5,
-3.606848, -3.333401, 0, 1, 1.5, 0.5, 0.5,
-3.606848, -3.333401, 0, 0, 1.5, 0.5, 0.5,
-3.606848, -3.333401, 2, 0, -0.5, 0.5, 0.5,
-3.606848, -3.333401, 2, 1, -0.5, 0.5, 0.5,
-3.606848, -3.333401, 2, 1, 1.5, 0.5, 0.5,
-3.606848, -3.333401, 2, 0, 1.5, 0.5, 0.5,
-3.606848, -3.333401, 4, 0, -0.5, 0.5, 0.5,
-3.606848, -3.333401, 4, 1, -0.5, 0.5, 0.5,
-3.606848, -3.333401, 4, 1, 1.5, 0.5, 0.5,
-3.606848, -3.333401, 4, 0, 1.5, 0.5, 0.5
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
-3.153527, -2.879405, -5.39683,
-3.153527, 3.173886, -5.39683,
-3.153527, -2.879405, 5.935413,
-3.153527, 3.173886, 5.935413,
-3.153527, -2.879405, -5.39683,
-3.153527, -2.879405, 5.935413,
-3.153527, 3.173886, -5.39683,
-3.153527, 3.173886, 5.935413,
-3.153527, -2.879405, -5.39683,
2.890753, -2.879405, -5.39683,
-3.153527, -2.879405, 5.935413,
2.890753, -2.879405, 5.935413,
-3.153527, 3.173886, -5.39683,
2.890753, 3.173886, -5.39683,
-3.153527, 3.173886, 5.935413,
2.890753, 3.173886, 5.935413,
2.890753, -2.879405, -5.39683,
2.890753, 3.173886, -5.39683,
2.890753, -2.879405, 5.935413,
2.890753, 3.173886, 5.935413,
2.890753, -2.879405, -5.39683,
2.890753, -2.879405, 5.935413,
2.890753, 3.173886, -5.39683,
2.890753, 3.173886, 5.935413
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
var radius = 7.581685;
var distance = 33.73177;
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
mvMatrix.translate( 0.1313868, -0.1472406, -0.2692916 );
mvMatrix.scale( 1.356235, 1.354216, 0.7233755 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.73177);
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
karvon<-read.table("karvon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-karvon$V2
```

```
## Error in eval(expr, envir, enclos): object 'karvon' not found
```

```r
y<-karvon$V3
```

```
## Error in eval(expr, envir, enclos): object 'karvon' not found
```

```r
z<-karvon$V4
```

```
## Error in eval(expr, envir, enclos): object 'karvon' not found
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
-3.065503, 0.8685826, -1.360003, 0, 0, 1, 1, 1,
-2.868565, 0.1498809, -1.809674, 1, 0, 0, 1, 1,
-2.669094, -0.1080865, 0.04302571, 1, 0, 0, 1, 1,
-2.569864, 0.09917924, -0.4057138, 1, 0, 0, 1, 1,
-2.526971, -0.2323356, -2.127774, 1, 0, 0, 1, 1,
-2.509769, 1.259055, -1.326544, 1, 0, 0, 1, 1,
-2.447857, -1.90047, -1.874596, 0, 0, 0, 1, 1,
-2.420805, -0.7955632, -1.49898, 0, 0, 0, 1, 1,
-2.378622, 2.21829, -1.007766, 0, 0, 0, 1, 1,
-2.317183, -0.2016546, -0.8984265, 0, 0, 0, 1, 1,
-2.294429, -1.736665, -1.27589, 0, 0, 0, 1, 1,
-2.258192, -0.2975299, 0.5046083, 0, 0, 0, 1, 1,
-2.222334, 0.3905089, -1.87389, 0, 0, 0, 1, 1,
-2.221407, 0.9935958, -1.379804, 1, 1, 1, 1, 1,
-2.209363, -0.263735, -2.073952, 1, 1, 1, 1, 1,
-2.188462, -0.02424055, -0.7143955, 1, 1, 1, 1, 1,
-2.182642, 0.3879259, -0.09867826, 1, 1, 1, 1, 1,
-2.167049, -0.4462069, -1.468542, 1, 1, 1, 1, 1,
-2.150254, 1.053526, -1.315071, 1, 1, 1, 1, 1,
-2.091745, -0.3692414, -2.493973, 1, 1, 1, 1, 1,
-2.072097, 0.4401291, -2.122557, 1, 1, 1, 1, 1,
-2.068384, -0.9591259, -0.1249661, 1, 1, 1, 1, 1,
-2.043612, -1.879945, -2.68284, 1, 1, 1, 1, 1,
-2.010925, -1.254367, -1.455938, 1, 1, 1, 1, 1,
-1.996491, -0.5333222, -2.909982, 1, 1, 1, 1, 1,
-1.986317, 0.09311688, -0.8318672, 1, 1, 1, 1, 1,
-1.975513, -1.374429, -1.553202, 1, 1, 1, 1, 1,
-1.96501, -0.5184354, -0.8419034, 1, 1, 1, 1, 1,
-1.96003, 1.096281, 0.2408752, 0, 0, 1, 1, 1,
-1.953854, -1.403851, -0.9568393, 1, 0, 0, 1, 1,
-1.947511, 0.9972199, -0.4229204, 1, 0, 0, 1, 1,
-1.930731, 0.7206762, -2.798812, 1, 0, 0, 1, 1,
-1.91133, 0.7374696, 0.1773939, 1, 0, 0, 1, 1,
-1.908691, -0.165189, -2.028148, 1, 0, 0, 1, 1,
-1.900129, -1.106848, -3.531582, 0, 0, 0, 1, 1,
-1.872013, 0.3173438, -0.03864021, 0, 0, 0, 1, 1,
-1.866411, -1.927248, -1.69626, 0, 0, 0, 1, 1,
-1.863098, 0.4154638, -0.7036761, 0, 0, 0, 1, 1,
-1.855901, 0.4349784, -0.8309077, 0, 0, 0, 1, 1,
-1.824471, -0.6856441, -1.72294, 0, 0, 0, 1, 1,
-1.819319, 0.04651592, -0.9314143, 0, 0, 0, 1, 1,
-1.815657, 0.6589526, 0.5843538, 1, 1, 1, 1, 1,
-1.801123, 0.865914, -1.229456, 1, 1, 1, 1, 1,
-1.798953, 0.1158551, 0.1382678, 1, 1, 1, 1, 1,
-1.759611, 0.2893636, -1.730829, 1, 1, 1, 1, 1,
-1.749078, -0.9587732, -2.660472, 1, 1, 1, 1, 1,
-1.748814, -1.20367, -2.289557, 1, 1, 1, 1, 1,
-1.74428, -1.376092, -3.332695, 1, 1, 1, 1, 1,
-1.742333, 0.008816813, -2.111831, 1, 1, 1, 1, 1,
-1.728226, -0.4816345, -2.073979, 1, 1, 1, 1, 1,
-1.726848, 0.4207053, -1.57427, 1, 1, 1, 1, 1,
-1.71994, -1.259498, -3.503152, 1, 1, 1, 1, 1,
-1.695346, -0.1228892, -2.144788, 1, 1, 1, 1, 1,
-1.695294, 0.8311976, -1.566166, 1, 1, 1, 1, 1,
-1.691992, 0.2518966, -3.118623, 1, 1, 1, 1, 1,
-1.670685, -1.017322, -2.894727, 1, 1, 1, 1, 1,
-1.663292, -0.4309286, -1.578851, 0, 0, 1, 1, 1,
-1.645294, 0.7073401, -2.082822, 1, 0, 0, 1, 1,
-1.644034, 0.950571, -1.083794, 1, 0, 0, 1, 1,
-1.624503, 0.6791063, -2.533061, 1, 0, 0, 1, 1,
-1.615431, 0.7650222, -0.2309246, 1, 0, 0, 1, 1,
-1.610184, -0.821149, -2.126654, 1, 0, 0, 1, 1,
-1.601489, 1.686443, -0.02376335, 0, 0, 0, 1, 1,
-1.596202, 0.4314205, -1.958177, 0, 0, 0, 1, 1,
-1.593912, 0.6287161, -2.268958, 0, 0, 0, 1, 1,
-1.591652, -0.4923547, -2.630637, 0, 0, 0, 1, 1,
-1.591027, -0.231314, -1.894292, 0, 0, 0, 1, 1,
-1.583045, -0.2768629, -1.381915, 0, 0, 0, 1, 1,
-1.552426, 0.1036564, -0.7671716, 0, 0, 0, 1, 1,
-1.548776, 0.3377116, -1.344167, 1, 1, 1, 1, 1,
-1.536984, -0.4442295, -0.7892454, 1, 1, 1, 1, 1,
-1.51326, 1.033877, -0.7536249, 1, 1, 1, 1, 1,
-1.504599, -0.311645, -2.61464, 1, 1, 1, 1, 1,
-1.501735, -1.89828, -1.48109, 1, 1, 1, 1, 1,
-1.499194, 0.9624772, -0.1172902, 1, 1, 1, 1, 1,
-1.490004, 0.6325519, -0.8521466, 1, 1, 1, 1, 1,
-1.488798, 1.360197, -1.067874, 1, 1, 1, 1, 1,
-1.478357, 0.14082, -1.985826, 1, 1, 1, 1, 1,
-1.468067, -0.3171846, -1.903584, 1, 1, 1, 1, 1,
-1.451797, -0.8790088, -1.912196, 1, 1, 1, 1, 1,
-1.445709, -1.97191, -2.057211, 1, 1, 1, 1, 1,
-1.441958, 1.363388, -0.8388149, 1, 1, 1, 1, 1,
-1.438885, 0.6632003, -0.4344452, 1, 1, 1, 1, 1,
-1.437832, -0.3397212, -1.335799, 1, 1, 1, 1, 1,
-1.432479, -1.263846, -1.281664, 0, 0, 1, 1, 1,
-1.425726, -0.2779275, -1.385561, 1, 0, 0, 1, 1,
-1.414031, 0.2636397, -1.336119, 1, 0, 0, 1, 1,
-1.412615, 2.044832, -1.813215, 1, 0, 0, 1, 1,
-1.411849, -0.1110186, -1.90588, 1, 0, 0, 1, 1,
-1.40677, -1.109018, -1.878764, 1, 0, 0, 1, 1,
-1.397742, 0.9000825, -1.163193, 0, 0, 0, 1, 1,
-1.39684, 0.8122678, 0.6046553, 0, 0, 0, 1, 1,
-1.383802, -0.1983279, -1.42564, 0, 0, 0, 1, 1,
-1.372941, -0.4838679, -0.8667507, 0, 0, 0, 1, 1,
-1.372138, 1.41448, -0.8318266, 0, 0, 0, 1, 1,
-1.363473, -0.7777564, -0.8173173, 0, 0, 0, 1, 1,
-1.350059, 1.604971, 1.097051, 0, 0, 0, 1, 1,
-1.340937, -0.620966, -3.363198, 1, 1, 1, 1, 1,
-1.335214, 0.1035938, -0.7101115, 1, 1, 1, 1, 1,
-1.301399, 1.431426, -1.18063, 1, 1, 1, 1, 1,
-1.296455, 0.625625, -1.066798, 1, 1, 1, 1, 1,
-1.295763, 2.624261, 1.222708, 1, 1, 1, 1, 1,
-1.285462, -0.1897504, -1.946986, 1, 1, 1, 1, 1,
-1.262088, -1.265349, -1.137542, 1, 1, 1, 1, 1,
-1.261121, -1.637707, -1.355339, 1, 1, 1, 1, 1,
-1.256408, -0.03133075, -4.177627, 1, 1, 1, 1, 1,
-1.256265, -0.6745942, -1.787164, 1, 1, 1, 1, 1,
-1.254259, 0.4586752, -0.2081506, 1, 1, 1, 1, 1,
-1.248119, 0.6340059, -0.3243957, 1, 1, 1, 1, 1,
-1.247267, -0.7908561, -3.231258, 1, 1, 1, 1, 1,
-1.245141, -0.9957077, -1.024261, 1, 1, 1, 1, 1,
-1.239322, -1.603974, -3.243253, 1, 1, 1, 1, 1,
-1.23658, -0.5533348, -2.705417, 0, 0, 1, 1, 1,
-1.233886, -0.008732808, -0.992197, 1, 0, 0, 1, 1,
-1.226638, 0.2366227, -1.883467, 1, 0, 0, 1, 1,
-1.221676, -0.3654629, 0.1839926, 1, 0, 0, 1, 1,
-1.215466, 0.9829791, -0.9190323, 1, 0, 0, 1, 1,
-1.203737, -0.203297, -3.454586, 1, 0, 0, 1, 1,
-1.19363, 0.2085761, -1.736641, 0, 0, 0, 1, 1,
-1.190222, -0.4602566, -3.137816, 0, 0, 0, 1, 1,
-1.181404, -0.1323233, -3.102707, 0, 0, 0, 1, 1,
-1.176014, -1.377769, -1.762143, 0, 0, 0, 1, 1,
-1.165707, -1.324319, -0.5363557, 0, 0, 0, 1, 1,
-1.163289, -0.7465348, -2.467521, 0, 0, 0, 1, 1,
-1.151428, -0.5065002, -3.26105, 0, 0, 0, 1, 1,
-1.148562, -0.08171618, -1.196042, 1, 1, 1, 1, 1,
-1.142407, 1.830733, 0.2726775, 1, 1, 1, 1, 1,
-1.141051, 1.739556, -1.293044, 1, 1, 1, 1, 1,
-1.136557, -0.2009478, -1.454578, 1, 1, 1, 1, 1,
-1.135419, -0.4090309, -1.813467, 1, 1, 1, 1, 1,
-1.121318, -0.6522005, -1.490363, 1, 1, 1, 1, 1,
-1.119268, 0.7898481, 0.7888424, 1, 1, 1, 1, 1,
-1.1122, -2.069793, -1.402696, 1, 1, 1, 1, 1,
-1.104066, 0.4624537, -1.156934, 1, 1, 1, 1, 1,
-1.100444, 1.187775, -1.648679, 1, 1, 1, 1, 1,
-1.091105, 1.02537, -1.589801, 1, 1, 1, 1, 1,
-1.084851, -0.2249746, -0.4893507, 1, 1, 1, 1, 1,
-1.071804, -0.04787334, -1.938255, 1, 1, 1, 1, 1,
-1.069414, -0.4017075, -2.941282, 1, 1, 1, 1, 1,
-1.068662, 0.8708088, -0.3098173, 1, 1, 1, 1, 1,
-1.067106, 0.01441951, -1.053259, 0, 0, 1, 1, 1,
-1.065222, -0.1114912, -2.494697, 1, 0, 0, 1, 1,
-1.063391, 0.1559126, -0.232914, 1, 0, 0, 1, 1,
-1.061502, 1.447072, -0.001231352, 1, 0, 0, 1, 1,
-1.059139, -0.1069449, -1.995269, 1, 0, 0, 1, 1,
-1.047506, 0.9139419, -0.9561254, 1, 0, 0, 1, 1,
-1.046442, -0.9629925, -1.65241, 0, 0, 0, 1, 1,
-1.044612, 0.5276659, 1.087876, 0, 0, 0, 1, 1,
-1.033233, 0.370259, -0.2721586, 0, 0, 0, 1, 1,
-1.030126, -0.06742643, -2.695944, 0, 0, 0, 1, 1,
-1.027068, -1.241707, -3.411636, 0, 0, 0, 1, 1,
-1.026644, 1.038593, -2.596055, 0, 0, 0, 1, 1,
-1.023605, 0.6979063, -0.1844485, 0, 0, 0, 1, 1,
-1.02216, -0.3911168, -1.284729, 1, 1, 1, 1, 1,
-1.02084, -0.3380353, -2.280511, 1, 1, 1, 1, 1,
-1.018257, 0.2774466, -2.296638, 1, 1, 1, 1, 1,
-1.012287, 0.3219392, -0.5020375, 1, 1, 1, 1, 1,
-1.009928, 0.6608531, -1.821825, 1, 1, 1, 1, 1,
-1.009332, 0.1115202, -1.35347, 1, 1, 1, 1, 1,
-1.003023, 0.7452918, 0.8934731, 1, 1, 1, 1, 1,
-1.001731, -0.8425983, -2.651484, 1, 1, 1, 1, 1,
-0.9981689, -0.3205942, -1.475168, 1, 1, 1, 1, 1,
-0.9956734, 0.2885296, -0.5545387, 1, 1, 1, 1, 1,
-0.987795, 0.5607195, -1.394397, 1, 1, 1, 1, 1,
-0.9876955, -1.042818, -2.520275, 1, 1, 1, 1, 1,
-0.9874358, 0.8439276, -0.9823461, 1, 1, 1, 1, 1,
-0.986913, -0.1310347, -1.48199, 1, 1, 1, 1, 1,
-0.9789376, 2.235769, -1.913858, 1, 1, 1, 1, 1,
-0.9770811, 0.605707, -1.249379, 0, 0, 1, 1, 1,
-0.9674156, -0.2108187, -1.368093, 1, 0, 0, 1, 1,
-0.966575, 0.2518606, -2.500544, 1, 0, 0, 1, 1,
-0.962447, 0.5803084, 0.4254512, 1, 0, 0, 1, 1,
-0.9595342, 0.5828956, -2.047693, 1, 0, 0, 1, 1,
-0.9456139, 0.08428197, -0.7146574, 1, 0, 0, 1, 1,
-0.9419493, 0.6327755, -2.358655, 0, 0, 0, 1, 1,
-0.9414148, -2.455993, -2.991992, 0, 0, 0, 1, 1,
-0.9408798, -0.4848685, -2.057019, 0, 0, 0, 1, 1,
-0.9353094, 0.05465835, -2.551968, 0, 0, 0, 1, 1,
-0.9313571, 0.03101527, -1.169764, 0, 0, 0, 1, 1,
-0.9308112, 0.513581, -0.6355541, 0, 0, 0, 1, 1,
-0.9301551, -1.215375, -3.361588, 0, 0, 0, 1, 1,
-0.9244616, -1.1485, -1.702487, 1, 1, 1, 1, 1,
-0.9235821, 1.403575, -1.467569, 1, 1, 1, 1, 1,
-0.9198077, 0.3884448, -1.188629, 1, 1, 1, 1, 1,
-0.9182159, 0.3376035, -2.676383, 1, 1, 1, 1, 1,
-0.916814, -0.9194074, -2.465858, 1, 1, 1, 1, 1,
-0.9133083, 1.233418, -0.8730129, 1, 1, 1, 1, 1,
-0.9093456, -0.4429192, -2.802757, 1, 1, 1, 1, 1,
-0.904083, 0.4937381, -0.2503788, 1, 1, 1, 1, 1,
-0.8998641, 0.6820253, -0.8606115, 1, 1, 1, 1, 1,
-0.8997168, -0.06200743, -2.455555, 1, 1, 1, 1, 1,
-0.8882691, -0.0744648, -0.6457248, 1, 1, 1, 1, 1,
-0.8830214, -0.305411, -1.284105, 1, 1, 1, 1, 1,
-0.8815818, -0.2078895, -2.680093, 1, 1, 1, 1, 1,
-0.8811635, 1.098569, 0.2528143, 1, 1, 1, 1, 1,
-0.880569, 1.366226, -1.881178, 1, 1, 1, 1, 1,
-0.8770817, -0.3455859, -2.110369, 0, 0, 1, 1, 1,
-0.873238, -0.5936067, -2.985994, 1, 0, 0, 1, 1,
-0.8724247, -0.9710464, -1.629504, 1, 0, 0, 1, 1,
-0.8707473, -0.08856175, -1.404176, 1, 0, 0, 1, 1,
-0.8668278, -0.08880375, -3.165484, 1, 0, 0, 1, 1,
-0.865662, 0.5480453, -0.5736588, 1, 0, 0, 1, 1,
-0.8612862, 0.9798509, 1.546086, 0, 0, 0, 1, 1,
-0.8598568, -0.5794954, -4.014608, 0, 0, 0, 1, 1,
-0.8592069, 0.4701001, -0.1045466, 0, 0, 0, 1, 1,
-0.8528703, 0.03087924, -2.514462, 0, 0, 0, 1, 1,
-0.851097, 1.107224, -1.025784, 0, 0, 0, 1, 1,
-0.8398356, -1.01774, -1.636541, 0, 0, 0, 1, 1,
-0.833584, -0.06417193, -1.904473, 0, 0, 0, 1, 1,
-0.8323885, 0.6546099, -0.6399649, 1, 1, 1, 1, 1,
-0.8296531, -0.347825, -2.833735, 1, 1, 1, 1, 1,
-0.8243051, -1.014879, -3.523062, 1, 1, 1, 1, 1,
-0.8236172, 0.02601247, -0.687508, 1, 1, 1, 1, 1,
-0.8235019, -1.196551, -3.280553, 1, 1, 1, 1, 1,
-0.8217573, -1.262314, -2.888286, 1, 1, 1, 1, 1,
-0.8189735, 1.325019, -0.3409095, 1, 1, 1, 1, 1,
-0.8136212, 1.077601, -0.3178765, 1, 1, 1, 1, 1,
-0.8128529, -1.430242, -2.053981, 1, 1, 1, 1, 1,
-0.8122715, -0.5801433, -1.921787, 1, 1, 1, 1, 1,
-0.8043689, -0.360136, -1.292775, 1, 1, 1, 1, 1,
-0.802745, 2.49752, -0.912513, 1, 1, 1, 1, 1,
-0.7790883, -0.07320976, -2.707986, 1, 1, 1, 1, 1,
-0.7763658, 0.8762533, -0.5697351, 1, 1, 1, 1, 1,
-0.7729912, -0.107475, -0.2538359, 1, 1, 1, 1, 1,
-0.7704288, 1.759401, -0.6601998, 0, 0, 1, 1, 1,
-0.768146, -0.08811116, 0.8865276, 1, 0, 0, 1, 1,
-0.7681149, 0.8102754, 0.7587514, 1, 0, 0, 1, 1,
-0.7654237, -0.7536808, -0.3181775, 1, 0, 0, 1, 1,
-0.763876, -0.6859633, -2.84968, 1, 0, 0, 1, 1,
-0.7620102, 0.09395712, -0.9139794, 1, 0, 0, 1, 1,
-0.7590991, -0.51754, -1.31828, 0, 0, 0, 1, 1,
-0.7575461, 0.4079943, -1.871262, 0, 0, 0, 1, 1,
-0.7561074, 0.245633, -1.145784, 0, 0, 0, 1, 1,
-0.7521034, 0.5777901, -0.4365029, 0, 0, 0, 1, 1,
-0.7518231, -0.8032926, -1.045431, 0, 0, 0, 1, 1,
-0.7503616, 0.3463851, -1.60207, 0, 0, 0, 1, 1,
-0.7420736, 1.189719, -0.4885827, 0, 0, 0, 1, 1,
-0.7384486, 1.39675, -1.095751, 1, 1, 1, 1, 1,
-0.7356549, 0.5622247, -0.8246688, 1, 1, 1, 1, 1,
-0.7328904, 1.048606, -0.3105596, 1, 1, 1, 1, 1,
-0.7296563, -0.2396259, -1.300352, 1, 1, 1, 1, 1,
-0.7282009, 0.8752611, 0.442851, 1, 1, 1, 1, 1,
-0.7261997, -2.36826, -2.967183, 1, 1, 1, 1, 1,
-0.7221277, -0.324188, -2.718902, 1, 1, 1, 1, 1,
-0.7197896, 0.2951429, -0.8783956, 1, 1, 1, 1, 1,
-0.7168419, -1.136609, -3.344412, 1, 1, 1, 1, 1,
-0.711077, -1.500273, -2.151741, 1, 1, 1, 1, 1,
-0.7070947, 0.7460513, -2.098397, 1, 1, 1, 1, 1,
-0.7030884, 0.4365914, 0.9978097, 1, 1, 1, 1, 1,
-0.6914775, 0.4662206, -0.6513943, 1, 1, 1, 1, 1,
-0.686535, -1.27804, -2.273393, 1, 1, 1, 1, 1,
-0.6852641, 1.655282, 0.07473201, 1, 1, 1, 1, 1,
-0.6833629, -1.306119, -2.867928, 0, 0, 1, 1, 1,
-0.6820049, -0.215067, -0.2716384, 1, 0, 0, 1, 1,
-0.6788964, -0.02408158, -1.010877, 1, 0, 0, 1, 1,
-0.6783895, 0.1311442, -0.5109241, 1, 0, 0, 1, 1,
-0.6772744, 2.824524, -1.045384, 1, 0, 0, 1, 1,
-0.675869, 1.818323, -1.302309, 1, 0, 0, 1, 1,
-0.6733316, 0.2570336, -1.162428, 0, 0, 0, 1, 1,
-0.6708217, -0.2145128, -1.124174, 0, 0, 0, 1, 1,
-0.6705666, -0.8370523, -0.9187312, 0, 0, 0, 1, 1,
-0.6679141, 0.1316617, -0.4625732, 0, 0, 0, 1, 1,
-0.6626852, -0.02943368, -2.728137, 0, 0, 0, 1, 1,
-0.6585452, -0.3851002, -2.273963, 0, 0, 0, 1, 1,
-0.6541696, 0.5143377, -0.755402, 0, 0, 0, 1, 1,
-0.6536672, 0.511874, -0.8727207, 1, 1, 1, 1, 1,
-0.652465, -1.646972, -3.561325, 1, 1, 1, 1, 1,
-0.6498879, -0.0484591, -2.568573, 1, 1, 1, 1, 1,
-0.6461781, 0.6076064, -2.367279, 1, 1, 1, 1, 1,
-0.640745, -1.023162, -1.627229, 1, 1, 1, 1, 1,
-0.6362967, 2.365293, -1.311659, 1, 1, 1, 1, 1,
-0.6284391, -0.8361621, -2.746665, 1, 1, 1, 1, 1,
-0.6275244, 0.03813512, -2.865003, 1, 1, 1, 1, 1,
-0.6235493, -0.8459463, -3.112894, 1, 1, 1, 1, 1,
-0.6229962, -0.5587862, -3.983991, 1, 1, 1, 1, 1,
-0.6179874, -1.301476, -2.704926, 1, 1, 1, 1, 1,
-0.6170525, 1.498732, 0.5233446, 1, 1, 1, 1, 1,
-0.6089216, -0.1770667, -2.386265, 1, 1, 1, 1, 1,
-0.605212, -0.5695987, -2.303864, 1, 1, 1, 1, 1,
-0.6027355, 1.10006, -1.210763, 1, 1, 1, 1, 1,
-0.5983458, -0.2365211, -1.873846, 0, 0, 1, 1, 1,
-0.5918621, 0.2488281, -3.223832, 1, 0, 0, 1, 1,
-0.5876805, -1.232741, -3.995003, 1, 0, 0, 1, 1,
-0.5828041, 0.9764009, 0.6212401, 1, 0, 0, 1, 1,
-0.5819612, -1.255716, -2.87025, 1, 0, 0, 1, 1,
-0.5801416, -1.927462, -2.702907, 1, 0, 0, 1, 1,
-0.5800695, 0.2014074, -2.246252, 0, 0, 0, 1, 1,
-0.5792739, -0.1021996, -2.491745, 0, 0, 0, 1, 1,
-0.5777429, -1.603027, -1.843743, 0, 0, 0, 1, 1,
-0.5678064, 0.1099574, -0.3056392, 0, 0, 0, 1, 1,
-0.56394, 1.156105, -1.955236, 0, 0, 0, 1, 1,
-0.5596257, 0.3108189, -0.9727306, 0, 0, 0, 1, 1,
-0.5575798, -0.290515, -0.7778628, 0, 0, 0, 1, 1,
-0.5572758, -0.4534872, -0.4652386, 1, 1, 1, 1, 1,
-0.5518041, -2.224088, -3.224292, 1, 1, 1, 1, 1,
-0.5509778, -1.947856, -3.892011, 1, 1, 1, 1, 1,
-0.5467197, 0.9044551, 0.4792994, 1, 1, 1, 1, 1,
-0.5432001, -0.302139, -2.916719, 1, 1, 1, 1, 1,
-0.5429852, 1.354343, -1.571754, 1, 1, 1, 1, 1,
-0.5414006, 0.3058563, -1.340098, 1, 1, 1, 1, 1,
-0.5400735, -0.2270048, -2.346844, 1, 1, 1, 1, 1,
-0.5383092, -0.5540355, -3.461573, 1, 1, 1, 1, 1,
-0.5367726, 1.535419, -0.289348, 1, 1, 1, 1, 1,
-0.5347492, -0.9718001, -3.033559, 1, 1, 1, 1, 1,
-0.5341706, -1.557858, -1.222327, 1, 1, 1, 1, 1,
-0.530422, 1.614298, -0.01071753, 1, 1, 1, 1, 1,
-0.5303786, -1.474132, -2.353886, 1, 1, 1, 1, 1,
-0.5269233, -2.112522, -5.231797, 1, 1, 1, 1, 1,
-0.5252025, -1.000869, -3.729817, 0, 0, 1, 1, 1,
-0.5248126, -0.089816, -0.7126267, 1, 0, 0, 1, 1,
-0.5219761, 0.1152381, 1.216817, 1, 0, 0, 1, 1,
-0.5212206, -1.231635, -2.191358, 1, 0, 0, 1, 1,
-0.5189064, -1.65992, -2.242645, 1, 0, 0, 1, 1,
-0.5178345, 0.7570458, 1.082178, 1, 0, 0, 1, 1,
-0.5035772, -0.4217779, -2.845988, 0, 0, 0, 1, 1,
-0.5016958, -1.925521, -2.580129, 0, 0, 0, 1, 1,
-0.5004686, -0.5715231, -2.405947, 0, 0, 0, 1, 1,
-0.4926189, 0.4272036, -0.8993301, 0, 0, 0, 1, 1,
-0.4913541, 0.4781167, -0.6564472, 0, 0, 0, 1, 1,
-0.4884642, 1.259369, -1.625899, 0, 0, 0, 1, 1,
-0.4872831, 0.2238674, -0.6145953, 0, 0, 0, 1, 1,
-0.4825591, -1.353721, -1.927838, 1, 1, 1, 1, 1,
-0.4821526, -1.007483, -0.7837508, 1, 1, 1, 1, 1,
-0.4789028, -1.730895, -4.228735, 1, 1, 1, 1, 1,
-0.4730528, -0.5216008, -2.465473, 1, 1, 1, 1, 1,
-0.4728417, 2.103002, 1.171884, 1, 1, 1, 1, 1,
-0.4705085, -1.162668, -1.485447, 1, 1, 1, 1, 1,
-0.4676775, 0.2043311, 0.2262509, 1, 1, 1, 1, 1,
-0.4630545, 0.9551805, -1.932289, 1, 1, 1, 1, 1,
-0.4622656, -0.1473881, -1.893667, 1, 1, 1, 1, 1,
-0.4543781, -0.4225919, -2.817033, 1, 1, 1, 1, 1,
-0.4510313, 0.787227, -0.1733538, 1, 1, 1, 1, 1,
-0.450775, -0.6756169, -2.051871, 1, 1, 1, 1, 1,
-0.4489049, -0.8863974, -2.214791, 1, 1, 1, 1, 1,
-0.4458531, -2.355485, -2.801331, 1, 1, 1, 1, 1,
-0.4450601, 0.07851297, -2.83854, 1, 1, 1, 1, 1,
-0.4375413, -0.5370141, -2.5427, 0, 0, 1, 1, 1,
-0.4369842, 0.4459196, 0.4902371, 1, 0, 0, 1, 1,
-0.433517, -1.734823, -2.594301, 1, 0, 0, 1, 1,
-0.4311082, 0.5197069, -1.511294, 1, 0, 0, 1, 1,
-0.4295401, -1.35878, -2.006592, 1, 0, 0, 1, 1,
-0.4283055, 0.9267942, -0.7824938, 1, 0, 0, 1, 1,
-0.4275782, -0.439782, -2.311055, 0, 0, 0, 1, 1,
-0.4249559, -0.3550899, -3.312874, 0, 0, 0, 1, 1,
-0.4245798, 1.575431, -1.806719, 0, 0, 0, 1, 1,
-0.4235897, 1.566884, -0.2916459, 0, 0, 0, 1, 1,
-0.4230015, -2.034258, -2.732233, 0, 0, 0, 1, 1,
-0.422729, -1.966183, -4.671712, 0, 0, 0, 1, 1,
-0.4220847, -0.3689753, -4.62844, 0, 0, 0, 1, 1,
-0.4125357, -2.278292, -4.264235, 1, 1, 1, 1, 1,
-0.4104455, -0.8684191, -2.591306, 1, 1, 1, 1, 1,
-0.4091125, 0.8221008, -1.370252, 1, 1, 1, 1, 1,
-0.404696, 1.533028, -1.039589, 1, 1, 1, 1, 1,
-0.4041617, -1.0407, -3.123374, 1, 1, 1, 1, 1,
-0.4020075, -0.5595027, -3.685192, 1, 1, 1, 1, 1,
-0.3978342, -0.1230789, -3.480699, 1, 1, 1, 1, 1,
-0.3935051, 1.87956, 0.1822352, 1, 1, 1, 1, 1,
-0.3878788, -0.3444083, -2.485031, 1, 1, 1, 1, 1,
-0.3868923, -0.006233701, -0.5951732, 1, 1, 1, 1, 1,
-0.3847621, -0.3654667, -2.943599, 1, 1, 1, 1, 1,
-0.3837889, -0.4306349, -1.594575, 1, 1, 1, 1, 1,
-0.3823665, 0.0006674094, -2.270965, 1, 1, 1, 1, 1,
-0.3820921, -1.613698, -4.058014, 1, 1, 1, 1, 1,
-0.3814222, -0.3778352, -2.730438, 1, 1, 1, 1, 1,
-0.3801451, 1.026956, -0.325426, 0, 0, 1, 1, 1,
-0.379818, 0.2628106, -1.441468, 1, 0, 0, 1, 1,
-0.3784582, -1.114941, -3.416585, 1, 0, 0, 1, 1,
-0.3722281, 1.589369, 1.870783, 1, 0, 0, 1, 1,
-0.3675409, 1.355546, 1.058083, 1, 0, 0, 1, 1,
-0.3659303, 0.6033493, -0.8304118, 1, 0, 0, 1, 1,
-0.3594043, -0.9101403, -2.392197, 0, 0, 0, 1, 1,
-0.356492, 0.8641227, -1.13422, 0, 0, 0, 1, 1,
-0.3509386, -1.850192, -1.881389, 0, 0, 0, 1, 1,
-0.3445298, 0.5484571, 1.565615, 0, 0, 0, 1, 1,
-0.3437078, 0.8221424, -0.1309913, 0, 0, 0, 1, 1,
-0.3387256, -0.2179284, -1.028238, 0, 0, 0, 1, 1,
-0.3371344, -0.07857633, -3.045577, 0, 0, 0, 1, 1,
-0.335107, 0.1756864, -0.5782954, 1, 1, 1, 1, 1,
-0.3296337, 1.043329, 0.8882576, 1, 1, 1, 1, 1,
-0.3239049, 0.681605, -0.3035501, 1, 1, 1, 1, 1,
-0.3192224, -0.02377525, -1.374409, 1, 1, 1, 1, 1,
-0.3174282, 0.7849917, -0.2217245, 1, 1, 1, 1, 1,
-0.3033541, -1.122391, -1.69761, 1, 1, 1, 1, 1,
-0.3026804, 0.3564672, -1.713619, 1, 1, 1, 1, 1,
-0.3000211, -0.9824381, -4.150606, 1, 1, 1, 1, 1,
-0.2989905, -1.758031, -4.701103, 1, 1, 1, 1, 1,
-0.294488, 0.3758487, -0.2254035, 1, 1, 1, 1, 1,
-0.294134, -0.05591436, -3.025265, 1, 1, 1, 1, 1,
-0.2940075, 0.7457471, -0.6367376, 1, 1, 1, 1, 1,
-0.2924658, 0.8303747, -1.122224, 1, 1, 1, 1, 1,
-0.2912816, 0.346074, -0.184173, 1, 1, 1, 1, 1,
-0.2908049, -0.6089903, -4.069137, 1, 1, 1, 1, 1,
-0.2906134, -1.961871, -4.787932, 0, 0, 1, 1, 1,
-0.2896963, -1.378419, -3.557509, 1, 0, 0, 1, 1,
-0.2806569, 0.896472, 0.9788257, 1, 0, 0, 1, 1,
-0.2749377, 0.3521669, -0.3174351, 1, 0, 0, 1, 1,
-0.2740542, 0.1685124, -0.03052054, 1, 0, 0, 1, 1,
-0.2734591, 0.4181314, -1.574289, 1, 0, 0, 1, 1,
-0.2659619, -0.4295032, -1.774993, 0, 0, 0, 1, 1,
-0.2621621, 0.6747799, -2.676845, 0, 0, 0, 1, 1,
-0.2603295, -0.3966014, -3.934445, 0, 0, 0, 1, 1,
-0.2585502, 0.2924646, -0.3350001, 0, 0, 0, 1, 1,
-0.2577158, 0.5609968, 0.3502392, 0, 0, 0, 1, 1,
-0.2562518, -0.2428901, -1.526468, 0, 0, 0, 1, 1,
-0.2553475, 0.8902169, 1.047841, 0, 0, 0, 1, 1,
-0.2539401, 1.789559, -1.106807, 1, 1, 1, 1, 1,
-0.2506041, 1.526828, -1.150864, 1, 1, 1, 1, 1,
-0.2492176, -0.0008510406, -2.283672, 1, 1, 1, 1, 1,
-0.2475321, 0.2696603, -0.5284389, 1, 1, 1, 1, 1,
-0.2467382, 0.119606, -1.43721, 1, 1, 1, 1, 1,
-0.2406694, 0.1706556, -1.489806, 1, 1, 1, 1, 1,
-0.2387542, -0.7976626, -3.332389, 1, 1, 1, 1, 1,
-0.2377384, 0.6733071, -1.246825, 1, 1, 1, 1, 1,
-0.2369155, -0.8190534, -1.432582, 1, 1, 1, 1, 1,
-0.2301572, -1.554318, -3.954784, 1, 1, 1, 1, 1,
-0.2282967, -0.3174759, -2.389431, 1, 1, 1, 1, 1,
-0.2255354, 1.547258, -0.06589861, 1, 1, 1, 1, 1,
-0.223537, 0.1641431, -0.5039612, 1, 1, 1, 1, 1,
-0.2215533, -1.277805, -3.053834, 1, 1, 1, 1, 1,
-0.2192474, 1.198253, -0.8723703, 1, 1, 1, 1, 1,
-0.2182228, 0.6884463, -1.434186, 0, 0, 1, 1, 1,
-0.2181355, 0.4418311, -0.4829046, 1, 0, 0, 1, 1,
-0.2156576, -0.3994961, -1.901263, 1, 0, 0, 1, 1,
-0.2103478, 1.279663, 0.0288381, 1, 0, 0, 1, 1,
-0.2085148, -0.7741373, -2.878784, 1, 0, 0, 1, 1,
-0.2077637, -0.2300946, -3.620862, 1, 0, 0, 1, 1,
-0.2069528, -0.951377, -4.437696, 0, 0, 0, 1, 1,
-0.2065063, 0.1616501, -2.235224, 0, 0, 0, 1, 1,
-0.2055194, 0.5547171, -3.453614, 0, 0, 0, 1, 1,
-0.2031996, 0.09510448, -2.6029, 0, 0, 0, 1, 1,
-0.2026887, 0.6300641, -0.2677643, 0, 0, 0, 1, 1,
-0.2016739, -0.9810703, -1.913913, 0, 0, 0, 1, 1,
-0.1998697, -0.01647078, -1.565181, 0, 0, 0, 1, 1,
-0.1997861, 0.1076805, -0.4447103, 1, 1, 1, 1, 1,
-0.199586, 1.078974, -0.5379477, 1, 1, 1, 1, 1,
-0.1992603, 0.513344, 1.629271, 1, 1, 1, 1, 1,
-0.1935305, -1.841508, -3.51438, 1, 1, 1, 1, 1,
-0.1933516, 1.062778, -1.10655, 1, 1, 1, 1, 1,
-0.1924951, -0.7590862, -2.382739, 1, 1, 1, 1, 1,
-0.1885795, -0.7588234, -2.632406, 1, 1, 1, 1, 1,
-0.1864835, 1.399095, -1.582275, 1, 1, 1, 1, 1,
-0.1827509, -0.8391922, -4.742065, 1, 1, 1, 1, 1,
-0.1814632, 1.937688, -0.860909, 1, 1, 1, 1, 1,
-0.1779418, -0.9464909, -1.320894, 1, 1, 1, 1, 1,
-0.1735304, 1.786146, -0.4321614, 1, 1, 1, 1, 1,
-0.1735254, -0.1801191, -2.630177, 1, 1, 1, 1, 1,
-0.1726432, 0.2265753, -0.943795, 1, 1, 1, 1, 1,
-0.1695774, -1.131248, -1.897525, 1, 1, 1, 1, 1,
-0.1682769, 1.098297, 0.8564739, 0, 0, 1, 1, 1,
-0.1654431, 1.000633, -2.630102, 1, 0, 0, 1, 1,
-0.163436, -0.7154337, -3.062997, 1, 0, 0, 1, 1,
-0.1577413, -0.4705681, -1.347448, 1, 0, 0, 1, 1,
-0.1565761, 1.045135, -0.7367736, 1, 0, 0, 1, 1,
-0.1483662, -1.362692, -3.424813, 1, 0, 0, 1, 1,
-0.1483219, 0.4411005, -2.028461, 0, 0, 0, 1, 1,
-0.1454559, 0.4522846, -1.924829, 0, 0, 0, 1, 1,
-0.1435915, 0.4698329, 1.03037, 0, 0, 0, 1, 1,
-0.1432323, -1.700664, -1.132497, 0, 0, 0, 1, 1,
-0.1390431, 0.74868, -1.411841, 0, 0, 0, 1, 1,
-0.1386597, -1.055755, -2.769042, 0, 0, 0, 1, 1,
-0.13665, -0.4006438, -3.149438, 0, 0, 0, 1, 1,
-0.1322996, -0.2742125, -2.864787, 1, 1, 1, 1, 1,
-0.1301689, 0.6419191, 1.6893, 1, 1, 1, 1, 1,
-0.1245434, -0.2308076, -3.713332, 1, 1, 1, 1, 1,
-0.1241715, 1.492206, -1.17819, 1, 1, 1, 1, 1,
-0.1240752, 0.0975929, -2.035031, 1, 1, 1, 1, 1,
-0.1192512, 0.8579778, -1.855326, 1, 1, 1, 1, 1,
-0.1188626, 1.810188, 0.9052002, 1, 1, 1, 1, 1,
-0.1186127, 0.1606615, 0.2076553, 1, 1, 1, 1, 1,
-0.1148991, 0.4637001, 0.8208933, 1, 1, 1, 1, 1,
-0.1146313, -0.3893535, -3.930769, 1, 1, 1, 1, 1,
-0.1132177, 1.551252, 0.6896263, 1, 1, 1, 1, 1,
-0.111473, 0.2531133, -0.8501675, 1, 1, 1, 1, 1,
-0.1083766, 0.007331645, -2.149598, 1, 1, 1, 1, 1,
-0.1069083, -0.1976653, -2.193624, 1, 1, 1, 1, 1,
-0.1053308, -0.6488054, -3.254928, 1, 1, 1, 1, 1,
-0.1049115, 2.206039, -0.765154, 0, 0, 1, 1, 1,
-0.1032849, -0.0572006, -3.170843, 1, 0, 0, 1, 1,
-0.09248897, -0.8640857, -1.804861, 1, 0, 0, 1, 1,
-0.09168644, -0.1388349, -3.810029, 1, 0, 0, 1, 1,
-0.08894881, -1.372863, -1.234691, 1, 0, 0, 1, 1,
-0.08564198, 1.589141, -1.55565, 1, 0, 0, 1, 1,
-0.08457059, -0.08074573, -2.762628, 0, 0, 0, 1, 1,
-0.08299325, -0.539355, -3.310131, 0, 0, 0, 1, 1,
-0.08279194, -0.3609421, -4.221316, 0, 0, 0, 1, 1,
-0.08128661, 0.07976846, -2.661515, 0, 0, 0, 1, 1,
-0.08057866, -0.4614436, -3.92401, 0, 0, 0, 1, 1,
-0.08030259, 0.522613, 1.271923, 0, 0, 0, 1, 1,
-0.07896041, -2.100855, -2.297045, 0, 0, 0, 1, 1,
-0.07144018, 0.6906016, -1.455177, 1, 1, 1, 1, 1,
-0.06684426, 0.2253591, -1.517335, 1, 1, 1, 1, 1,
-0.06640153, -1.215415, -2.184415, 1, 1, 1, 1, 1,
-0.06248217, -0.1702448, -3.179119, 1, 1, 1, 1, 1,
-0.06228538, 0.1274321, -1.234013, 1, 1, 1, 1, 1,
-0.06222143, 1.570856, -0.5451701, 1, 1, 1, 1, 1,
-0.06219792, 1.102188, -0.04497699, 1, 1, 1, 1, 1,
-0.06179939, 0.1821138, 0.1670965, 1, 1, 1, 1, 1,
-0.05914927, -0.1143048, -3.546127, 1, 1, 1, 1, 1,
-0.05792021, -1.484683, -2.150962, 1, 1, 1, 1, 1,
-0.05693478, 0.2463785, 0.9234801, 1, 1, 1, 1, 1,
-0.05539907, 0.6147767, -1.890647, 1, 1, 1, 1, 1,
-0.0526883, 3.085731, -0.7677859, 1, 1, 1, 1, 1,
-0.04516519, -0.5612757, -3.089597, 1, 1, 1, 1, 1,
-0.04131551, 1.148477, 0.8934772, 1, 1, 1, 1, 1,
-0.03431821, 1.265848, -1.962099, 0, 0, 1, 1, 1,
-0.03266519, 0.1483397, 0.3384408, 1, 0, 0, 1, 1,
-0.03213511, -0.273014, -1.484674, 1, 0, 0, 1, 1,
-0.02668663, 0.2192363, -0.5271079, 1, 0, 0, 1, 1,
-0.02301617, -1.265827, -4.749862, 1, 0, 0, 1, 1,
-0.01735622, -0.08503068, -1.136602, 1, 0, 0, 1, 1,
-0.01406827, -0.3240722, -3.484116, 0, 0, 0, 1, 1,
-0.01313676, -0.2795299, -1.301395, 0, 0, 0, 1, 1,
-0.01241888, 0.642971, -1.368305, 0, 0, 0, 1, 1,
-0.009999665, 0.2131983, -0.1020199, 0, 0, 0, 1, 1,
-0.0009141167, -1.201555, -4.292231, 0, 0, 0, 1, 1,
0.0005369323, 0.9934728, 0.107072, 0, 0, 0, 1, 1,
0.001086199, -1.595022, 2.637766, 0, 0, 0, 1, 1,
0.002631681, 1.089796, 2.234429, 1, 1, 1, 1, 1,
0.002922858, 0.1214374, 0.04173838, 1, 1, 1, 1, 1,
0.003792611, 0.7227811, -0.3176592, 1, 1, 1, 1, 1,
0.01022285, -0.2600418, 2.280922, 1, 1, 1, 1, 1,
0.01289001, -0.3347818, 4.617495, 1, 1, 1, 1, 1,
0.01295073, 1.358912, -1.322163, 1, 1, 1, 1, 1,
0.01382268, -0.4270764, 4.274322, 1, 1, 1, 1, 1,
0.01432428, 1.234509, -0.6501219, 1, 1, 1, 1, 1,
0.01539023, -0.07803248, 2.945663, 1, 1, 1, 1, 1,
0.0157637, 1.07115, -0.001736698, 1, 1, 1, 1, 1,
0.01874863, -0.8462123, 3.872893, 1, 1, 1, 1, 1,
0.01959603, 1.024837, -0.09309653, 1, 1, 1, 1, 1,
0.02045589, 0.2694618, -0.5235214, 1, 1, 1, 1, 1,
0.02537943, -0.6650349, 3.751163, 1, 1, 1, 1, 1,
0.02628983, -0.4794783, 3.19125, 1, 1, 1, 1, 1,
0.02660955, -1.258501, 3.406668, 0, 0, 1, 1, 1,
0.03228474, -0.6840615, 2.321663, 1, 0, 0, 1, 1,
0.03259585, 0.1084269, 0.187781, 1, 0, 0, 1, 1,
0.03637646, -1.800416, 3.7972, 1, 0, 0, 1, 1,
0.04084419, 0.6052914, 2.381296, 1, 0, 0, 1, 1,
0.04099547, -0.114733, 3.487597, 1, 0, 0, 1, 1,
0.04609278, 0.03222326, 1.949956, 0, 0, 0, 1, 1,
0.04758387, -0.9026721, 5.77038, 0, 0, 0, 1, 1,
0.04774092, -1.810912, 1.798635, 0, 0, 0, 1, 1,
0.05062178, 1.179587, -0.5052651, 0, 0, 0, 1, 1,
0.05513516, 0.8559682, -0.1564379, 0, 0, 0, 1, 1,
0.05553549, 0.3542884, 2.285566, 0, 0, 0, 1, 1,
0.06718357, 1.448129, -0.420966, 0, 0, 0, 1, 1,
0.07243804, 1.523469, 0.5012875, 1, 1, 1, 1, 1,
0.07279405, 0.06767665, 0.1953415, 1, 1, 1, 1, 1,
0.07372237, -2.123814, 2.637018, 1, 1, 1, 1, 1,
0.07553376, -0.6972706, 3.766868, 1, 1, 1, 1, 1,
0.07579509, 0.5314144, -1.4887, 1, 1, 1, 1, 1,
0.07716649, 0.6052098, 0.6431006, 1, 1, 1, 1, 1,
0.0782424, -0.1555958, 2.876876, 1, 1, 1, 1, 1,
0.07923427, 0.8369427, -0.05875819, 1, 1, 1, 1, 1,
0.08014656, 1.05156, 0.4162384, 1, 1, 1, 1, 1,
0.08948798, 1.498192, 0.4269206, 1, 1, 1, 1, 1,
0.08997238, 1.397384, 0.459722, 1, 1, 1, 1, 1,
0.0900575, 0.6583331, 1.048872, 1, 1, 1, 1, 1,
0.09832272, 0.959152, 0.9432532, 1, 1, 1, 1, 1,
0.1014459, 0.03884798, 1.521791, 1, 1, 1, 1, 1,
0.1038298, -0.7901991, 3.083559, 1, 1, 1, 1, 1,
0.1121861, 0.4696567, 1.614473, 0, 0, 1, 1, 1,
0.1134083, 0.8169529, -1.415119, 1, 0, 0, 1, 1,
0.1137976, 0.1890422, 0.927078, 1, 0, 0, 1, 1,
0.1153132, -0.4535286, 0.4788296, 1, 0, 0, 1, 1,
0.11701, 0.8075655, -1.356995, 1, 0, 0, 1, 1,
0.1213512, -0.4572758, 3.10813, 1, 0, 0, 1, 1,
0.1250504, -0.1689522, 1.958222, 0, 0, 0, 1, 1,
0.1279838, 0.1664227, 0.6722015, 0, 0, 0, 1, 1,
0.1287104, -0.5258986, 0.922173, 0, 0, 0, 1, 1,
0.1294828, -0.093898, 3.314011, 0, 0, 0, 1, 1,
0.1317943, 0.5782595, -0.5579142, 0, 0, 0, 1, 1,
0.132404, -1.916786, 0.9874971, 0, 0, 0, 1, 1,
0.1324474, 0.5047227, -0.1529437, 0, 0, 0, 1, 1,
0.1361942, 0.7404929, 0.3273413, 1, 1, 1, 1, 1,
0.1368831, -0.4049135, 3.442807, 1, 1, 1, 1, 1,
0.1383111, -0.3123259, 2.095956, 1, 1, 1, 1, 1,
0.1404411, -1.088773, 3.21786, 1, 1, 1, 1, 1,
0.144661, -1.826483, 2.299744, 1, 1, 1, 1, 1,
0.1497981, -0.152126, 1.522038, 1, 1, 1, 1, 1,
0.1499159, -0.4268348, 1.881436, 1, 1, 1, 1, 1,
0.1513346, -0.6063855, 2.041743, 1, 1, 1, 1, 1,
0.1514675, 0.2591189, 0.6274466, 1, 1, 1, 1, 1,
0.1542804, 0.9562545, 1.459886, 1, 1, 1, 1, 1,
0.1554531, -0.2376748, 2.62611, 1, 1, 1, 1, 1,
0.1567066, 0.9604768, -0.1866428, 1, 1, 1, 1, 1,
0.1584829, 0.9294932, -1.462999, 1, 1, 1, 1, 1,
0.1611873, -0.9896856, 2.239007, 1, 1, 1, 1, 1,
0.1663856, -0.3513235, 2.793769, 1, 1, 1, 1, 1,
0.1683913, -0.9287825, 5.067946, 0, 0, 1, 1, 1,
0.1749884, -0.4354962, 2.93485, 1, 0, 0, 1, 1,
0.1759112, -1.056655, 1.347992, 1, 0, 0, 1, 1,
0.1787263, 0.7587312, -0.8836558, 1, 0, 0, 1, 1,
0.1791404, 0.4536476, -1.616342, 1, 0, 0, 1, 1,
0.1838995, -0.6201136, 3.513364, 1, 0, 0, 1, 1,
0.1851021, 0.3876561, 1.464645, 0, 0, 0, 1, 1,
0.1853869, 1.363037, 1.125103, 0, 0, 0, 1, 1,
0.1864966, -1.191875, 2.927217, 0, 0, 0, 1, 1,
0.1889458, 0.3897234, -1.673566, 0, 0, 0, 1, 1,
0.1891387, 0.8233776, 1.476528, 0, 0, 0, 1, 1,
0.1979846, 0.3365691, 0.4211654, 0, 0, 0, 1, 1,
0.1989036, 0.2267471, 0.2879761, 0, 0, 0, 1, 1,
0.2010258, -0.1734888, 0.6857179, 1, 1, 1, 1, 1,
0.2050041, 0.67614, -0.3358493, 1, 1, 1, 1, 1,
0.2120157, -0.7029445, 2.400953, 1, 1, 1, 1, 1,
0.212464, 0.297594, 0.03087259, 1, 1, 1, 1, 1,
0.214048, -0.769858, 2.597148, 1, 1, 1, 1, 1,
0.2181867, -1.409331, 2.097187, 1, 1, 1, 1, 1,
0.2190185, 0.844174, 0.6446217, 1, 1, 1, 1, 1,
0.2202366, -1.24281, 3.799033, 1, 1, 1, 1, 1,
0.2206653, -0.5417982, 3.117963, 1, 1, 1, 1, 1,
0.2291025, 0.3241674, 1.056179, 1, 1, 1, 1, 1,
0.2303241, 0.8536779, 0.8647246, 1, 1, 1, 1, 1,
0.2309951, 1.076645, -0.7151255, 1, 1, 1, 1, 1,
0.231139, -0.02676852, 2.015147, 1, 1, 1, 1, 1,
0.2353843, 2.746236, -0.03498609, 1, 1, 1, 1, 1,
0.2361218, 2.014946, 2.132762, 1, 1, 1, 1, 1,
0.2387407, -1.216807, 4.861567, 0, 0, 1, 1, 1,
0.2397606, -0.7261179, 2.28132, 1, 0, 0, 1, 1,
0.2400208, -0.1107535, 0.0110631, 1, 0, 0, 1, 1,
0.2452676, -0.4980009, 3.261492, 1, 0, 0, 1, 1,
0.2462201, -0.4467971, 3.129927, 1, 0, 0, 1, 1,
0.247024, 0.4370999, 0.1464, 1, 0, 0, 1, 1,
0.248318, -0.4520718, 2.563725, 0, 0, 0, 1, 1,
0.2515834, 0.1176715, 1.35049, 0, 0, 0, 1, 1,
0.2521589, -0.3303609, 3.562265, 0, 0, 0, 1, 1,
0.2540319, 1.520774, 1.409461, 0, 0, 0, 1, 1,
0.2606862, 1.251087, 1.915416, 0, 0, 0, 1, 1,
0.2642515, 0.4972324, 0.2566045, 0, 0, 0, 1, 1,
0.2669344, 0.2995247, 1.847114, 0, 0, 0, 1, 1,
0.2686164, 0.1085328, 2.990171, 1, 1, 1, 1, 1,
0.2688694, 0.5371421, -0.2649916, 1, 1, 1, 1, 1,
0.27007, 0.1421528, -0.7117288, 1, 1, 1, 1, 1,
0.2704402, 0.9305692, 0.7333573, 1, 1, 1, 1, 1,
0.2717203, 0.9674979, -0.8790942, 1, 1, 1, 1, 1,
0.2721425, -0.2210642, 2.904699, 1, 1, 1, 1, 1,
0.2721811, 1.450203, -0.7955613, 1, 1, 1, 1, 1,
0.2723736, -1.853636, 2.520857, 1, 1, 1, 1, 1,
0.2737526, 1.091848, 0.4625148, 1, 1, 1, 1, 1,
0.2737776, 0.9235595, 3.254697, 1, 1, 1, 1, 1,
0.2765883, 0.671034, 3.21937, 1, 1, 1, 1, 1,
0.2767565, -0.9461828, 4.344857, 1, 1, 1, 1, 1,
0.2786696, 1.104092, -0.5063264, 1, 1, 1, 1, 1,
0.2850105, -0.9797858, 3.568132, 1, 1, 1, 1, 1,
0.2878829, 0.4334753, -0.6896851, 1, 1, 1, 1, 1,
0.2889185, 0.4221128, 0.4805332, 0, 0, 1, 1, 1,
0.2893654, 1.435582, 0.1524383, 1, 0, 0, 1, 1,
0.2958976, 1.231792, 1.234386, 1, 0, 0, 1, 1,
0.2970194, -0.8129219, 2.895459, 1, 0, 0, 1, 1,
0.3046291, -1.567126, 4.976163, 1, 0, 0, 1, 1,
0.3131805, -0.57705, -0.09777583, 1, 0, 0, 1, 1,
0.3171849, 0.1978918, -0.2351774, 0, 0, 0, 1, 1,
0.3202896, 2.038437, -0.3858238, 0, 0, 0, 1, 1,
0.3229835, 0.4087521, 0.4065544, 0, 0, 0, 1, 1,
0.3260118, -0.9394162, 1.495122, 0, 0, 0, 1, 1,
0.3276347, -1.118711, 3.298658, 0, 0, 0, 1, 1,
0.3289595, -0.4379564, 2.829421, 0, 0, 0, 1, 1,
0.3310663, 1.477755, -0.05518576, 0, 0, 0, 1, 1,
0.3314219, 0.6221783, 0.7061082, 1, 1, 1, 1, 1,
0.334212, -1.010259, 1.878582, 1, 1, 1, 1, 1,
0.3352165, 1.222394, 0.6467483, 1, 1, 1, 1, 1,
0.3352309, 0.3496643, 0.8799338, 1, 1, 1, 1, 1,
0.3355411, -0.7420911, 1.012563, 1, 1, 1, 1, 1,
0.3383026, -0.1074993, 2.277802, 1, 1, 1, 1, 1,
0.3421828, -0.5386881, 2.603304, 1, 1, 1, 1, 1,
0.3426568, -0.3381096, 2.837532, 1, 1, 1, 1, 1,
0.3469374, 0.4379964, 1.327068, 1, 1, 1, 1, 1,
0.3532339, 1.160117, 0.01578499, 1, 1, 1, 1, 1,
0.3552624, 1.075467, -1.458279, 1, 1, 1, 1, 1,
0.3595648, 0.8228815, -0.967037, 1, 1, 1, 1, 1,
0.3611856, -0.8103488, 1.883157, 1, 1, 1, 1, 1,
0.363512, -0.5849995, 1.885223, 1, 1, 1, 1, 1,
0.3656333, 0.4381097, 1.039654, 1, 1, 1, 1, 1,
0.3705941, -0.05026169, 1.588334, 0, 0, 1, 1, 1,
0.3790815, 0.3014362, -0.8338478, 1, 0, 0, 1, 1,
0.3916112, 1.359573, 1.033308, 1, 0, 0, 1, 1,
0.3960341, -1.53875, 3.094791, 1, 0, 0, 1, 1,
0.4010382, 1.850429, -0.419061, 1, 0, 0, 1, 1,
0.4049933, -0.6514708, 4.538627, 1, 0, 0, 1, 1,
0.4076796, 1.478486, 0.2626078, 0, 0, 0, 1, 1,
0.4118413, 0.2037854, 0.8444391, 0, 0, 0, 1, 1,
0.4120255, 0.8950322, -0.3998344, 0, 0, 0, 1, 1,
0.421698, 1.028787, 0.9595492, 0, 0, 0, 1, 1,
0.4278441, -0.3963078, 1.83707, 0, 0, 0, 1, 1,
0.427926, 1.198593, -0.847918, 0, 0, 0, 1, 1,
0.4334903, 0.09053764, 0.1101776, 0, 0, 0, 1, 1,
0.4354526, -1.276933, 2.674723, 1, 1, 1, 1, 1,
0.4389713, -0.399472, -0.4996938, 1, 1, 1, 1, 1,
0.44153, 0.4043191, 2.741847, 1, 1, 1, 1, 1,
0.4444578, 0.8735458, 0.472822, 1, 1, 1, 1, 1,
0.4452787, 0.906848, 1.226161, 1, 1, 1, 1, 1,
0.4469039, 0.111118, 2.292319, 1, 1, 1, 1, 1,
0.4476866, -0.936973, 2.754744, 1, 1, 1, 1, 1,
0.4506019, 0.5385668, 0.2301109, 1, 1, 1, 1, 1,
0.4535772, -0.1532446, 0.4581518, 1, 1, 1, 1, 1,
0.4572727, 0.6602418, 1.492123, 1, 1, 1, 1, 1,
0.4705139, 1.19185, 0.4146275, 1, 1, 1, 1, 1,
0.4773275, 0.4376964, 0.13823, 1, 1, 1, 1, 1,
0.4773677, 0.2408895, -0.616721, 1, 1, 1, 1, 1,
0.4796826, 1.549691, -0.8131753, 1, 1, 1, 1, 1,
0.4830326, 0.4332096, 2.276137, 1, 1, 1, 1, 1,
0.4855367, -1.263643, 4.347324, 0, 0, 1, 1, 1,
0.4876876, -0.6087136, 1.158848, 1, 0, 0, 1, 1,
0.4922751, -1.707496, 1.570095, 1, 0, 0, 1, 1,
0.5012471, -1.638607, 2.649649, 1, 0, 0, 1, 1,
0.5020776, 0.3450713, 0.1927128, 1, 0, 0, 1, 1,
0.511356, 0.3449857, 3.04731, 1, 0, 0, 1, 1,
0.5201789, -1.266047, 2.410372, 0, 0, 0, 1, 1,
0.5239424, -0.9523869, 3.432428, 0, 0, 0, 1, 1,
0.5243035, 0.8084254, 0.6389731, 0, 0, 0, 1, 1,
0.5288389, -0.6374061, 1.527296, 0, 0, 0, 1, 1,
0.5293074, -0.08503217, 2.140597, 0, 0, 0, 1, 1,
0.5297596, -0.2110891, 1.01057, 0, 0, 0, 1, 1,
0.5299354, -1.46583, 4.458753, 0, 0, 0, 1, 1,
0.5332662, -0.4224063, 2.569381, 1, 1, 1, 1, 1,
0.5366684, 1.189534, -1.046978, 1, 1, 1, 1, 1,
0.5393167, -0.3551315, 1.322155, 1, 1, 1, 1, 1,
0.5410248, -0.9137052, 1.796229, 1, 1, 1, 1, 1,
0.5416666, 0.4841719, -1.571506, 1, 1, 1, 1, 1,
0.5420681, -1.071192, 2.988193, 1, 1, 1, 1, 1,
0.5423085, -0.8375928, 1.772189, 1, 1, 1, 1, 1,
0.5474243, -0.7328267, 2.15499, 1, 1, 1, 1, 1,
0.5475322, 0.358671, 2.601105, 1, 1, 1, 1, 1,
0.5488351, 0.08273567, 1.635878, 1, 1, 1, 1, 1,
0.5494654, 0.07760072, 1.593989, 1, 1, 1, 1, 1,
0.549797, -0.09144637, 1.510486, 1, 1, 1, 1, 1,
0.5499254, 0.6438025, -1.840903, 1, 1, 1, 1, 1,
0.5509542, -0.4240245, 1.281899, 1, 1, 1, 1, 1,
0.5525457, 2.30727, -2.005243, 1, 1, 1, 1, 1,
0.5551107, -0.7905394, 3.333779, 0, 0, 1, 1, 1,
0.5557716, -0.2584253, 0.9438414, 1, 0, 0, 1, 1,
0.5564834, 0.2942083, 2.493004, 1, 0, 0, 1, 1,
0.5584382, 1.158827, 2.588934, 1, 0, 0, 1, 1,
0.5615569, -1.132518, 2.963318, 1, 0, 0, 1, 1,
0.5712373, -0.6541002, 3.898039, 1, 0, 0, 1, 1,
0.5716129, -2.074171, 2.658428, 0, 0, 0, 1, 1,
0.5760313, 0.4341451, 0.9438001, 0, 0, 0, 1, 1,
0.5876775, 0.4758571, 1.101764, 0, 0, 0, 1, 1,
0.5934301, -0.1188725, 3.122547, 0, 0, 0, 1, 1,
0.5946388, -2.143698, 2.852666, 0, 0, 0, 1, 1,
0.5952184, -0.8307499, 1.859653, 0, 0, 0, 1, 1,
0.5958767, -0.9882801, 2.891818, 0, 0, 0, 1, 1,
0.6005767, 1.445523, -0.2409467, 1, 1, 1, 1, 1,
0.6019321, -0.6674745, 2.004429, 1, 1, 1, 1, 1,
0.6040726, 0.5196587, 1.111428, 1, 1, 1, 1, 1,
0.6082094, 1.546294, -0.6438673, 1, 1, 1, 1, 1,
0.609248, 0.01528668, 2.347479, 1, 1, 1, 1, 1,
0.6114881, 0.3016996, 1.273797, 1, 1, 1, 1, 1,
0.6160761, -0.5897276, 0.9168046, 1, 1, 1, 1, 1,
0.6171935, 0.3801457, 1.396669, 1, 1, 1, 1, 1,
0.6260622, 1.06959, -0.6032956, 1, 1, 1, 1, 1,
0.6269783, -0.163482, -0.04409901, 1, 1, 1, 1, 1,
0.6290801, -1.506709, 3.842733, 1, 1, 1, 1, 1,
0.6296776, -1.137339, 2.301031, 1, 1, 1, 1, 1,
0.6324891, -1.548736, 4.095897, 1, 1, 1, 1, 1,
0.6350562, -0.391399, 3.23828, 1, 1, 1, 1, 1,
0.6370074, -1.255622, 0.7759323, 1, 1, 1, 1, 1,
0.6371598, 0.3995294, 1.522387, 0, 0, 1, 1, 1,
0.6376843, -0.503775, 2.788949, 1, 0, 0, 1, 1,
0.6403055, -0.1869549, 0.7604802, 1, 0, 0, 1, 1,
0.6428502, 0.008730446, 1.664058, 1, 0, 0, 1, 1,
0.6450468, 0.1010056, 2.047617, 1, 0, 0, 1, 1,
0.6490707, 1.33045, 2.258892, 1, 0, 0, 1, 1,
0.6542581, -1.875681, 0.8307617, 0, 0, 0, 1, 1,
0.6609263, 0.6946511, 1.128322, 0, 0, 0, 1, 1,
0.6643125, 0.336241, 0.1058874, 0, 0, 0, 1, 1,
0.6705316, 1.117126, 0.8169531, 0, 0, 0, 1, 1,
0.6727933, -0.9618968, 3.968857, 0, 0, 0, 1, 1,
0.6738941, -0.4067099, 2.350846, 0, 0, 0, 1, 1,
0.6762961, -0.1852307, 0.2523375, 0, 0, 0, 1, 1,
0.6782281, -0.4912856, 0.3856477, 1, 1, 1, 1, 1,
0.6897328, -0.02365263, 0.5429272, 1, 1, 1, 1, 1,
0.6906746, -0.01823322, 1.046772, 1, 1, 1, 1, 1,
0.6931679, -0.2492167, 2.851547, 1, 1, 1, 1, 1,
0.696727, 0.7487317, -0.6230114, 1, 1, 1, 1, 1,
0.6975324, 0.5391754, 2.165968, 1, 1, 1, 1, 1,
0.7037772, 1.007667, 1.019503, 1, 1, 1, 1, 1,
0.7147276, 0.7430956, 2.649528, 1, 1, 1, 1, 1,
0.7161726, -0.8983049, 1.698952, 1, 1, 1, 1, 1,
0.7220876, 2.05578e-05, 2.070174, 1, 1, 1, 1, 1,
0.729444, -1.308646, 2.464414, 1, 1, 1, 1, 1,
0.732455, -0.4549733, 2.337527, 1, 1, 1, 1, 1,
0.7384427, 1.090297, 1.27499, 1, 1, 1, 1, 1,
0.7412162, -2.79125, 3.200946, 1, 1, 1, 1, 1,
0.7424098, 1.021889, 0.4056216, 1, 1, 1, 1, 1,
0.7425119, 1.423462, -0.404183, 0, 0, 1, 1, 1,
0.743407, 0.8086185, 1.684502, 1, 0, 0, 1, 1,
0.74502, 0.8030269, -0.5368308, 1, 0, 0, 1, 1,
0.7457064, 0.5209739, -0.2289112, 1, 0, 0, 1, 1,
0.750255, -1.191343, 2.124015, 1, 0, 0, 1, 1,
0.7552443, 0.458123, -0.0008291816, 1, 0, 0, 1, 1,
0.765575, 1.969193, 1.644619, 0, 0, 0, 1, 1,
0.7673189, 0.2515544, 0.4391907, 0, 0, 0, 1, 1,
0.7683936, -0.7712449, 1.826112, 0, 0, 0, 1, 1,
0.7714541, 0.321404, -1.054906, 0, 0, 0, 1, 1,
0.775912, 1.915405, 0.08555675, 0, 0, 0, 1, 1,
0.7779564, 0.3501625, 1.818858, 0, 0, 0, 1, 1,
0.7795088, -0.8165095, 4.220179, 0, 0, 0, 1, 1,
0.7802326, 1.931499, -1.309863, 1, 1, 1, 1, 1,
0.7854533, 0.05459185, 1.238228, 1, 1, 1, 1, 1,
0.7859231, -0.443962, 2.54936, 1, 1, 1, 1, 1,
0.7895492, -0.623216, -0.4563099, 1, 1, 1, 1, 1,
0.7910143, -0.4668941, 2.99581, 1, 1, 1, 1, 1,
0.7937891, -0.5834273, 1.889465, 1, 1, 1, 1, 1,
0.7968214, -0.7921655, 0.4405566, 1, 1, 1, 1, 1,
0.798084, 0.6712755, 1.719773, 1, 1, 1, 1, 1,
0.8019669, -0.2389215, 1.177031, 1, 1, 1, 1, 1,
0.8025753, 0.08929706, 1.207508, 1, 1, 1, 1, 1,
0.8070691, 1.256289, 1.334161, 1, 1, 1, 1, 1,
0.8096732, 0.2951243, 0.531112, 1, 1, 1, 1, 1,
0.8103938, -0.2583178, 3.920244, 1, 1, 1, 1, 1,
0.8125474, 2.053807, -0.1617391, 1, 1, 1, 1, 1,
0.8161944, 0.5486685, 0.9487427, 1, 1, 1, 1, 1,
0.8185657, 0.4470017, 1.085527, 0, 0, 1, 1, 1,
0.8243379, 0.7604845, -0.3748161, 1, 0, 0, 1, 1,
0.8266803, -0.1778064, 4.626237, 1, 0, 0, 1, 1,
0.82961, -0.06274403, 1.533077, 1, 0, 0, 1, 1,
0.830458, -0.4308197, 2.199927, 1, 0, 0, 1, 1,
0.8307034, -0.4573727, 1.397596, 1, 0, 0, 1, 1,
0.8346855, -1.777721, 2.742124, 0, 0, 0, 1, 1,
0.837217, 0.4252222, 1.790555, 0, 0, 0, 1, 1,
0.8374745, -0.1710553, 0.4051698, 0, 0, 0, 1, 1,
0.8446918, 2.094166, 1.51825, 0, 0, 0, 1, 1,
0.8519821, 0.2704381, 2.285122, 0, 0, 0, 1, 1,
0.8569851, 1.213299, 1.310078, 0, 0, 0, 1, 1,
0.8583332, -0.6375686, 1.421551, 0, 0, 0, 1, 1,
0.8584723, 1.172514, 0.3148942, 1, 1, 1, 1, 1,
0.8608938, 0.7527004, 1.695835, 1, 1, 1, 1, 1,
0.8611406, -0.3931436, 1.995419, 1, 1, 1, 1, 1,
0.8634523, 0.2928551, 1.125537, 1, 1, 1, 1, 1,
0.8650346, 1.293291, 2.267786, 1, 1, 1, 1, 1,
0.8698666, -0.3923548, 0.8044577, 1, 1, 1, 1, 1,
0.8804446, -0.2981824, 0.8263077, 1, 1, 1, 1, 1,
0.8824398, 0.03528068, 1.940412, 1, 1, 1, 1, 1,
0.8924442, 0.7481374, 1.07133, 1, 1, 1, 1, 1,
0.9036814, -0.2266164, 1.133287, 1, 1, 1, 1, 1,
0.9065484, 0.9458514, 1.826682, 1, 1, 1, 1, 1,
0.910715, -0.1318882, 1.032469, 1, 1, 1, 1, 1,
0.9109253, -2.739613, 1.882532, 1, 1, 1, 1, 1,
0.9253231, -1.17784, 2.731152, 1, 1, 1, 1, 1,
0.9315023, 1.128884, 0.5568278, 1, 1, 1, 1, 1,
0.9328158, -2.11023, 2.696176, 0, 0, 1, 1, 1,
0.9472005, 0.8142086, -0.3503312, 1, 0, 0, 1, 1,
0.9475171, -1.054397, 2.270281, 1, 0, 0, 1, 1,
0.9482192, 0.8668836, 0.7308329, 1, 0, 0, 1, 1,
0.9531686, -2.521661, 4.334878, 1, 0, 0, 1, 1,
0.9544342, 0.5532582, 1.543191, 1, 0, 0, 1, 1,
0.9568494, -0.1002659, 1.224985, 0, 0, 0, 1, 1,
0.9655881, -0.9168941, 2.870178, 0, 0, 0, 1, 1,
0.9800361, -0.4206498, 1.325683, 0, 0, 0, 1, 1,
0.9831696, 0.2704917, 0.6073337, 0, 0, 0, 1, 1,
0.983178, 1.847418, -0.3045092, 0, 0, 0, 1, 1,
0.9885439, 0.2053057, 2.504236, 0, 0, 0, 1, 1,
0.9887549, 0.491827, 0.6121691, 0, 0, 0, 1, 1,
0.9896004, 0.854752, 1.251228, 1, 1, 1, 1, 1,
0.9926066, 0.4661156, 1.743943, 1, 1, 1, 1, 1,
0.9927998, 1.290996, 1.525854, 1, 1, 1, 1, 1,
0.99329, 0.08234601, 3.257245, 1, 1, 1, 1, 1,
0.9970355, 0.2835049, 2.117059, 1, 1, 1, 1, 1,
1.000949, -0.1440035, 2.817401, 1, 1, 1, 1, 1,
1.0027, -0.8788994, -0.5335671, 1, 1, 1, 1, 1,
1.008562, 0.03679932, 0.8060575, 1, 1, 1, 1, 1,
1.012709, -1.318832, 2.383466, 1, 1, 1, 1, 1,
1.019541, 1.452239, 1.84442, 1, 1, 1, 1, 1,
1.028159, 1.437932, -1.320068, 1, 1, 1, 1, 1,
1.031425, 0.9005498, 1.096705, 1, 1, 1, 1, 1,
1.041143, -0.1647241, 2.087348, 1, 1, 1, 1, 1,
1.043794, -0.714008, 1.062508, 1, 1, 1, 1, 1,
1.045141, -0.05712856, 0.1487707, 1, 1, 1, 1, 1,
1.046884, 1.239918, -0.1963796, 0, 0, 1, 1, 1,
1.052865, 2.085869, -0.7221536, 1, 0, 0, 1, 1,
1.055676, -0.02426676, 0.7827546, 1, 0, 0, 1, 1,
1.060877, 1.219174, 0.4416818, 1, 0, 0, 1, 1,
1.062944, 0.8150406, 1.177609, 1, 0, 0, 1, 1,
1.072501, -0.714983, 0.9993779, 1, 0, 0, 1, 1,
1.073724, -1.042101, 1.701024, 0, 0, 0, 1, 1,
1.076173, -0.984431, 2.118178, 0, 0, 0, 1, 1,
1.077736, -0.1135052, 1.203116, 0, 0, 0, 1, 1,
1.084927, 0.5369335, 0.5148644, 0, 0, 0, 1, 1,
1.094235, 0.07180038, 2.841287, 0, 0, 0, 1, 1,
1.097364, -1.907462, 0.9386106, 0, 0, 0, 1, 1,
1.099937, 0.2932454, 2.082805, 0, 0, 0, 1, 1,
1.116207, -0.3583165, 0.7034581, 1, 1, 1, 1, 1,
1.118011, -0.6830206, 1.680057, 1, 1, 1, 1, 1,
1.118126, 1.431131, 0.6634744, 1, 1, 1, 1, 1,
1.120026, -0.9653203, 1.800023, 1, 1, 1, 1, 1,
1.122206, 1.589241, 0.05592955, 1, 1, 1, 1, 1,
1.122831, 0.6968592, 1.849345, 1, 1, 1, 1, 1,
1.125982, 0.2323999, 0.830153, 1, 1, 1, 1, 1,
1.132985, 0.2114032, 2.562289, 1, 1, 1, 1, 1,
1.13715, -1.152966, 2.097193, 1, 1, 1, 1, 1,
1.139135, 1.933269, 0.423499, 1, 1, 1, 1, 1,
1.151964, -0.2713984, 0.4996675, 1, 1, 1, 1, 1,
1.157736, 0.5499374, 2.140562, 1, 1, 1, 1, 1,
1.162005, -0.2356761, 1.481457, 1, 1, 1, 1, 1,
1.167454, -1.804861, 1.266026, 1, 1, 1, 1, 1,
1.174142, 0.4540752, 1.175099, 1, 1, 1, 1, 1,
1.182887, -0.4463284, 3.040048, 0, 0, 1, 1, 1,
1.18432, -0.7403912, 1.334079, 1, 0, 0, 1, 1,
1.186237, -0.7928913, 0.7060819, 1, 0, 0, 1, 1,
1.202956, 0.1845918, 0.6644287, 1, 0, 0, 1, 1,
1.222236, -1.106555, 1.582458, 1, 0, 0, 1, 1,
1.226974, 1.094364, 0.8619145, 1, 0, 0, 1, 1,
1.230634, -1.83874, 1.809662, 0, 0, 0, 1, 1,
1.255829, 0.1920143, 1.826878, 0, 0, 0, 1, 1,
1.259231, 0.3102978, 1.835224, 0, 0, 0, 1, 1,
1.269148, 0.2233194, 0.394225, 0, 0, 0, 1, 1,
1.271895, 0.9922943, 1.381562, 0, 0, 0, 1, 1,
1.289181, -1.187729, 3.275862, 0, 0, 0, 1, 1,
1.293175, -0.241353, 2.72349, 0, 0, 0, 1, 1,
1.294468, 0.7240817, 1.855015, 1, 1, 1, 1, 1,
1.294816, -0.09381611, 0.5554717, 1, 1, 1, 1, 1,
1.296811, 0.6546057, 0.04617599, 1, 1, 1, 1, 1,
1.299333, -0.476501, 2.380836, 1, 1, 1, 1, 1,
1.30108, -2.12626, 3.112386, 1, 1, 1, 1, 1,
1.302687, -0.7794631, 1.631335, 1, 1, 1, 1, 1,
1.307171, -0.4353145, 1.844451, 1, 1, 1, 1, 1,
1.308051, -0.2908673, 1.826848, 1, 1, 1, 1, 1,
1.314215, -0.01127819, 1.808521, 1, 1, 1, 1, 1,
1.318946, 0.1022796, -0.02569677, 1, 1, 1, 1, 1,
1.322331, -0.2180336, 2.137587, 1, 1, 1, 1, 1,
1.324066, 0.4116473, 0.6522986, 1, 1, 1, 1, 1,
1.324421, -0.1719477, 1.427679, 1, 1, 1, 1, 1,
1.324685, -1.692964, 2.035432, 1, 1, 1, 1, 1,
1.328896, -0.6440959, 1.174553, 1, 1, 1, 1, 1,
1.33201, -0.8929173, 2.098623, 0, 0, 1, 1, 1,
1.332047, 0.6694114, 0.7594241, 1, 0, 0, 1, 1,
1.347226, -0.06252325, 1.781426, 1, 0, 0, 1, 1,
1.350406, 0.2935672, 2.336025, 1, 0, 0, 1, 1,
1.354395, -0.6126642, 2.823955, 1, 0, 0, 1, 1,
1.365135, 1.49784, 1.021536, 1, 0, 0, 1, 1,
1.400985, 0.1196886, 1.906451, 0, 0, 0, 1, 1,
1.402917, -0.7195094, 2.184595, 0, 0, 0, 1, 1,
1.40608, -0.4155925, 2.1129, 0, 0, 0, 1, 1,
1.41032, -0.8923378, 2.375812, 0, 0, 0, 1, 1,
1.424199, 0.2027278, 2.015107, 0, 0, 0, 1, 1,
1.424834, -0.1791809, 3.051444, 0, 0, 0, 1, 1,
1.434026, -0.5223518, 2.584772, 0, 0, 0, 1, 1,
1.436599, 0.3994439, 1.001292, 1, 1, 1, 1, 1,
1.449224, -0.7505856, 1.242858, 1, 1, 1, 1, 1,
1.451941, 1.619151, 1.255955, 1, 1, 1, 1, 1,
1.453453, -0.7122483, 2.541984, 1, 1, 1, 1, 1,
1.46071, 0.5588875, 1.934225, 1, 1, 1, 1, 1,
1.471494, 0.537174, 3.428746, 1, 1, 1, 1, 1,
1.475955, 1.359286, 1.119323, 1, 1, 1, 1, 1,
1.482813, 0.9843242, 0.2990113, 1, 1, 1, 1, 1,
1.488738, -1.520694, 1.074175, 1, 1, 1, 1, 1,
1.490745, -0.8713431, 2.053289, 1, 1, 1, 1, 1,
1.497244, 0.191254, 0.7975602, 1, 1, 1, 1, 1,
1.499212, 1.265051, -0.02248368, 1, 1, 1, 1, 1,
1.501494, -0.02212212, 2.103328, 1, 1, 1, 1, 1,
1.503737, -1.381246, 1.470162, 1, 1, 1, 1, 1,
1.512031, -0.1050271, 1.221185, 1, 1, 1, 1, 1,
1.525309, 0.551534, 0.4439818, 0, 0, 1, 1, 1,
1.559858, -1.148118, 2.956391, 1, 0, 0, 1, 1,
1.560836, 1.445439, 1.34358, 1, 0, 0, 1, 1,
1.5671, -1.092634, 0.8937999, 1, 0, 0, 1, 1,
1.579452, 1.621257, 2.827132, 1, 0, 0, 1, 1,
1.58326, -0.5520045, 3.017853, 1, 0, 0, 1, 1,
1.587226, 0.07539088, 1.281324, 0, 0, 0, 1, 1,
1.599322, 1.041391, -0.6405106, 0, 0, 0, 1, 1,
1.61894, 1.731162, 1.496254, 0, 0, 0, 1, 1,
1.630292, 0.1317691, 0.00793076, 0, 0, 0, 1, 1,
1.646876, 0.9277784, 0.8063998, 0, 0, 0, 1, 1,
1.660578, 0.4718422, 1.693339, 0, 0, 0, 1, 1,
1.726751, 0.08889614, 1.9837, 0, 0, 0, 1, 1,
1.737623, 2.110603, 0.3915773, 1, 1, 1, 1, 1,
1.738993, 0.1693196, 1.490535, 1, 1, 1, 1, 1,
1.758822, 0.01688933, 1.121877, 1, 1, 1, 1, 1,
1.776921, 0.6679105, 1.576512, 1, 1, 1, 1, 1,
1.792249, -0.6132024, 1.713098, 1, 1, 1, 1, 1,
1.797643, -0.6406675, 4.286411, 1, 1, 1, 1, 1,
1.816349, -1.441555, 1.314053, 1, 1, 1, 1, 1,
1.826624, 0.8637878, 1.946451, 1, 1, 1, 1, 1,
1.832977, -1.200585, 1.932151, 1, 1, 1, 1, 1,
1.857658, 0.04016949, 1.87109, 1, 1, 1, 1, 1,
1.86356, -0.4895686, 2.728018, 1, 1, 1, 1, 1,
1.88004, 2.069281, -2.05934, 1, 1, 1, 1, 1,
1.900574, -1.143946, 0.7334561, 1, 1, 1, 1, 1,
1.918319, -2.505861, 3.35001, 1, 1, 1, 1, 1,
1.923003, -0.8280272, 3.112913, 1, 1, 1, 1, 1,
1.935584, 0.1178243, 3.487667, 0, 0, 1, 1, 1,
1.955914, 0.7357036, 1.395776, 1, 0, 0, 1, 1,
1.996993, 0.2616714, 1.687184, 1, 0, 0, 1, 1,
2.00016, -0.9812127, 0.4833227, 1, 0, 0, 1, 1,
2.079536, -0.5879044, 0.8804369, 1, 0, 0, 1, 1,
2.093416, -0.7644351, 0.05695116, 1, 0, 0, 1, 1,
2.129669, 0.301552, 1.737701, 0, 0, 0, 1, 1,
2.154042, 0.3353049, -0.06096964, 0, 0, 0, 1, 1,
2.186877, -2.502974, 1.553152, 0, 0, 0, 1, 1,
2.222293, -1.062415, 1.829232, 0, 0, 0, 1, 1,
2.341135, -0.5615085, 2.099936, 0, 0, 0, 1, 1,
2.364785, 0.7214765, 0.9055389, 0, 0, 0, 1, 1,
2.385577, 0.1629612, 2.44168, 0, 0, 0, 1, 1,
2.414616, -1.397917, 2.916085, 1, 1, 1, 1, 1,
2.419675, 2.898328, 2.436439, 1, 1, 1, 1, 1,
2.512871, -0.04913922, 3.333093, 1, 1, 1, 1, 1,
2.521506, 0.4035188, 2.098696, 1, 1, 1, 1, 1,
2.555665, -1.909973, 1.314331, 1, 1, 1, 1, 1,
2.790118, -1.977504, 1.266105, 1, 1, 1, 1, 1,
2.80273, -1.453087, 2.297642, 1, 1, 1, 1, 1
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
var radius = 9.414685;
var distance = 33.06868;
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
mvMatrix.translate( 0.1313868, -0.1472408, -0.2692916 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.06868);
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
