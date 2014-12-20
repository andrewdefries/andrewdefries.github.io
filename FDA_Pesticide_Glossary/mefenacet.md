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
-3.88914, 1.273196, -1.103865, 1, 0, 0, 1,
-3.036935, 0.1481228, -1.216793, 1, 0.007843138, 0, 1,
-2.812603, 1.412922, -2.976772, 1, 0.01176471, 0, 1,
-2.568906, 0.3358521, -1.459733, 1, 0.01960784, 0, 1,
-2.536382, 0.1187708, -0.8271395, 1, 0.02352941, 0, 1,
-2.429415, -1.474335, -3.862595, 1, 0.03137255, 0, 1,
-2.428934, -1.067136, -2.259544, 1, 0.03529412, 0, 1,
-2.386135, -1.878723, -2.600851, 1, 0.04313726, 0, 1,
-2.349921, 0.05962471, -2.317325, 1, 0.04705882, 0, 1,
-2.303476, 1.194819, -1.197286, 1, 0.05490196, 0, 1,
-2.270433, -1.412199, -4.156435, 1, 0.05882353, 0, 1,
-2.248746, 0.1515469, -1.645911, 1, 0.06666667, 0, 1,
-2.187476, -1.320734, -2.819059, 1, 0.07058824, 0, 1,
-2.123646, 0.6331403, -0.898901, 1, 0.07843138, 0, 1,
-2.109801, -0.4210559, -1.953326, 1, 0.08235294, 0, 1,
-2.099048, 0.9309533, 1.080255, 1, 0.09019608, 0, 1,
-2.076365, -0.1939936, -2.740971, 1, 0.09411765, 0, 1,
-2.034029, -0.539496, -3.133961, 1, 0.1019608, 0, 1,
-2.031094, -0.532023, -2.393274, 1, 0.1098039, 0, 1,
-2.019001, -0.6575317, -4.021656, 1, 0.1137255, 0, 1,
-2.011999, 1.168296, -0.4572872, 1, 0.1215686, 0, 1,
-1.982173, -1.613797, -2.495199, 1, 0.1254902, 0, 1,
-1.97405, -0.1125402, -1.004509, 1, 0.1333333, 0, 1,
-1.946795, -1.561236, -2.596195, 1, 0.1372549, 0, 1,
-1.926702, 0.4803925, -1.827703, 1, 0.145098, 0, 1,
-1.863414, -0.1126756, -1.165513, 1, 0.1490196, 0, 1,
-1.861077, 0.8812023, -1.145834, 1, 0.1568628, 0, 1,
-1.85278, -0.4361095, -3.374547, 1, 0.1607843, 0, 1,
-1.819871, -0.5951146, -0.904367, 1, 0.1686275, 0, 1,
-1.78595, -0.203503, -1.855715, 1, 0.172549, 0, 1,
-1.780925, -1.621999, -3.208326, 1, 0.1803922, 0, 1,
-1.778613, -0.05482393, -0.8106002, 1, 0.1843137, 0, 1,
-1.768974, -0.2585692, -0.3882207, 1, 0.1921569, 0, 1,
-1.758544, 0.1841321, -1.953496, 1, 0.1960784, 0, 1,
-1.754594, 2.020943, -2.120926, 1, 0.2039216, 0, 1,
-1.698272, 0.5672707, -1.498548, 1, 0.2117647, 0, 1,
-1.697449, 0.05694664, -0.6067068, 1, 0.2156863, 0, 1,
-1.697071, -0.3409894, -2.569827, 1, 0.2235294, 0, 1,
-1.689576, -1.162505, -2.230892, 1, 0.227451, 0, 1,
-1.681423, -0.1097247, -0.1492296, 1, 0.2352941, 0, 1,
-1.669344, 0.1350479, -3.694516, 1, 0.2392157, 0, 1,
-1.663585, 0.07300887, -0.03308333, 1, 0.2470588, 0, 1,
-1.656489, -0.7493823, -1.089984, 1, 0.2509804, 0, 1,
-1.639832, 2.410637, -0.9068795, 1, 0.2588235, 0, 1,
-1.618323, -0.180221, -3.349783, 1, 0.2627451, 0, 1,
-1.616959, 0.4471144, -2.039198, 1, 0.2705882, 0, 1,
-1.607279, 0.3482334, 0.6728877, 1, 0.2745098, 0, 1,
-1.592105, 0.6027899, -0.3418606, 1, 0.282353, 0, 1,
-1.575873, -1.078202, -2.142007, 1, 0.2862745, 0, 1,
-1.569933, -1.157367, -0.8574882, 1, 0.2941177, 0, 1,
-1.56529, 1.320517, -1.838167, 1, 0.3019608, 0, 1,
-1.559452, -0.4925639, -1.079207, 1, 0.3058824, 0, 1,
-1.554183, -1.213591, -2.528087, 1, 0.3137255, 0, 1,
-1.546676, 0.8533798, 0.4007729, 1, 0.3176471, 0, 1,
-1.537525, 1.84886, -3.326105, 1, 0.3254902, 0, 1,
-1.52268, -1.820942, -3.010048, 1, 0.3294118, 0, 1,
-1.52081, -1.171449, -4.048192, 1, 0.3372549, 0, 1,
-1.513791, 0.8731909, -1.481384, 1, 0.3411765, 0, 1,
-1.501775, 1.155167, -1.114711, 1, 0.3490196, 0, 1,
-1.497351, 1.342878, -2.548107, 1, 0.3529412, 0, 1,
-1.486382, -0.5879251, -0.7100041, 1, 0.3607843, 0, 1,
-1.48377, -0.7229776, -1.708795, 1, 0.3647059, 0, 1,
-1.475391, 1.428247, -0.4694681, 1, 0.372549, 0, 1,
-1.474397, -0.957102, -0.2516182, 1, 0.3764706, 0, 1,
-1.472932, -0.8878612, -2.481739, 1, 0.3843137, 0, 1,
-1.466142, 1.569047, -0.8584979, 1, 0.3882353, 0, 1,
-1.461979, -1.051056, -2.104964, 1, 0.3960784, 0, 1,
-1.458661, -0.2315711, -1.884413, 1, 0.4039216, 0, 1,
-1.455941, 2.239852, -0.4279501, 1, 0.4078431, 0, 1,
-1.442165, -0.5931413, -3.348924, 1, 0.4156863, 0, 1,
-1.441362, -0.1578188, -1.52216, 1, 0.4196078, 0, 1,
-1.440727, 1.08406, -0.4134697, 1, 0.427451, 0, 1,
-1.435091, -0.8738818, -1.114682, 1, 0.4313726, 0, 1,
-1.428837, -1.431068, -2.113194, 1, 0.4392157, 0, 1,
-1.426701, 0.3478343, -1.775871, 1, 0.4431373, 0, 1,
-1.424714, -0.74967, -2.195955, 1, 0.4509804, 0, 1,
-1.421842, -1.071585, -0.2092314, 1, 0.454902, 0, 1,
-1.420344, 0.9212162, 0.7617426, 1, 0.4627451, 0, 1,
-1.406997, -0.6236104, -2.068502, 1, 0.4666667, 0, 1,
-1.398247, 1.06088, -2.338522, 1, 0.4745098, 0, 1,
-1.393951, -0.619906, -0.4327119, 1, 0.4784314, 0, 1,
-1.385377, -1.390528, -0.3957375, 1, 0.4862745, 0, 1,
-1.370564, -0.03377367, -2.01262, 1, 0.4901961, 0, 1,
-1.368698, -0.841198, -2.293138, 1, 0.4980392, 0, 1,
-1.348186, 1.421113, -1.062029, 1, 0.5058824, 0, 1,
-1.34526, -2.478715, -1.573974, 1, 0.509804, 0, 1,
-1.333947, -0.07315542, -0.7924713, 1, 0.5176471, 0, 1,
-1.333434, 1.5029, -1.582578, 1, 0.5215687, 0, 1,
-1.322424, -0.3766679, -2.322435, 1, 0.5294118, 0, 1,
-1.312134, -0.1538699, -2.027915, 1, 0.5333334, 0, 1,
-1.308756, 1.200482, 0.5750669, 1, 0.5411765, 0, 1,
-1.306211, 0.5406101, 0.3825287, 1, 0.5450981, 0, 1,
-1.298522, 0.2684918, -0.7619376, 1, 0.5529412, 0, 1,
-1.29551, -1.070412, -1.928446, 1, 0.5568628, 0, 1,
-1.295144, -0.4985601, -1.980214, 1, 0.5647059, 0, 1,
-1.293839, -0.832033, -2.437198, 1, 0.5686275, 0, 1,
-1.292062, -0.2147727, -1.991827, 1, 0.5764706, 0, 1,
-1.291003, 1.033942, -1.204093, 1, 0.5803922, 0, 1,
-1.282716, -0.8677946, -2.710683, 1, 0.5882353, 0, 1,
-1.276281, -0.6923963, -1.951247, 1, 0.5921569, 0, 1,
-1.270438, 1.64617, -1.241189, 1, 0.6, 0, 1,
-1.268953, -1.159656, -2.425791, 1, 0.6078432, 0, 1,
-1.268811, 2.316309, -0.5897323, 1, 0.6117647, 0, 1,
-1.26349, -0.1143735, -0.6461898, 1, 0.6196079, 0, 1,
-1.255122, -0.9682291, -1.514497, 1, 0.6235294, 0, 1,
-1.243779, 0.2637819, -3.83657, 1, 0.6313726, 0, 1,
-1.239734, -0.7086221, -2.539501, 1, 0.6352941, 0, 1,
-1.232683, -1.198028, -1.958118, 1, 0.6431373, 0, 1,
-1.223249, 0.9403194, -0.5139018, 1, 0.6470588, 0, 1,
-1.220891, -0.2982782, -2.150403, 1, 0.654902, 0, 1,
-1.218894, 2.382485, 0.1653764, 1, 0.6588235, 0, 1,
-1.21654, 0.7104383, -0.722995, 1, 0.6666667, 0, 1,
-1.21544, -0.4242639, -2.544472, 1, 0.6705883, 0, 1,
-1.214207, 0.1225373, -0.7392419, 1, 0.6784314, 0, 1,
-1.211527, 0.6607798, -0.7000731, 1, 0.682353, 0, 1,
-1.209423, -0.9605529, -1.962312, 1, 0.6901961, 0, 1,
-1.207484, 0.1945832, 0.5784171, 1, 0.6941177, 0, 1,
-1.207024, -0.9081497, -2.401609, 1, 0.7019608, 0, 1,
-1.205833, -1.245219, -1.773308, 1, 0.7098039, 0, 1,
-1.196972, 0.5749801, -0.7197548, 1, 0.7137255, 0, 1,
-1.191819, -0.3261278, -0.3833398, 1, 0.7215686, 0, 1,
-1.189353, -0.3860184, -2.74038, 1, 0.7254902, 0, 1,
-1.178568, 0.612169, -0.8062368, 1, 0.7333333, 0, 1,
-1.176238, 0.5769715, -0.858845, 1, 0.7372549, 0, 1,
-1.172944, -0.5279461, -2.345236, 1, 0.7450981, 0, 1,
-1.161994, 0.7859101, -2.215472, 1, 0.7490196, 0, 1,
-1.158845, 0.03682128, -2.159529, 1, 0.7568628, 0, 1,
-1.158644, 0.5120203, -0.9167182, 1, 0.7607843, 0, 1,
-1.157233, -0.5382064, -1.146813, 1, 0.7686275, 0, 1,
-1.151532, -0.6142451, -1.498969, 1, 0.772549, 0, 1,
-1.150765, 0.4525462, -0.5394638, 1, 0.7803922, 0, 1,
-1.144106, 1.227854, -1.550442, 1, 0.7843137, 0, 1,
-1.130236, -0.8147538, -1.113007, 1, 0.7921569, 0, 1,
-1.125807, -0.3750921, -1.564387, 1, 0.7960784, 0, 1,
-1.125001, -0.630389, -1.215012, 1, 0.8039216, 0, 1,
-1.12135, 0.6595082, -2.521224, 1, 0.8117647, 0, 1,
-1.118126, -0.9703355, -1.64192, 1, 0.8156863, 0, 1,
-1.099744, -0.09015054, -2.939766, 1, 0.8235294, 0, 1,
-1.097673, -0.7820778, -4.062994, 1, 0.827451, 0, 1,
-1.07454, 0.1610434, -1.675806, 1, 0.8352941, 0, 1,
-1.073222, -0.6415033, -0.1358264, 1, 0.8392157, 0, 1,
-1.072289, 0.5870168, -1.03995, 1, 0.8470588, 0, 1,
-1.066842, 1.014893, -1.342307, 1, 0.8509804, 0, 1,
-1.065342, 1.175881, -0.9611376, 1, 0.8588235, 0, 1,
-1.06529, -0.1241016, -2.927786, 1, 0.8627451, 0, 1,
-1.064156, 0.1248666, -0.8896499, 1, 0.8705882, 0, 1,
-1.053797, 0.5024868, -0.613833, 1, 0.8745098, 0, 1,
-1.049478, 0.8451074, -0.1642729, 1, 0.8823529, 0, 1,
-1.047093, 0.0640076, -1.132231, 1, 0.8862745, 0, 1,
-1.037369, 0.5796522, -1.54875, 1, 0.8941177, 0, 1,
-1.031677, 0.9779083, -1.033529, 1, 0.8980392, 0, 1,
-1.030576, 1.560851, 0.9956965, 1, 0.9058824, 0, 1,
-1.025491, -0.351531, -2.245152, 1, 0.9137255, 0, 1,
-1.019742, 0.3560205, -0.8536353, 1, 0.9176471, 0, 1,
-1.015415, -1.5143, -3.929279, 1, 0.9254902, 0, 1,
-1.010526, -1.31903, -2.986223, 1, 0.9294118, 0, 1,
-1.009903, 0.08611102, -1.362873, 1, 0.9372549, 0, 1,
-0.9988604, 0.06012814, -1.348963, 1, 0.9411765, 0, 1,
-0.9985421, -0.2127968, -2.531985, 1, 0.9490196, 0, 1,
-0.9918454, 1.448897, -1.678637, 1, 0.9529412, 0, 1,
-0.9904891, -0.673092, -1.428309, 1, 0.9607843, 0, 1,
-0.988604, -0.733227, -2.752583, 1, 0.9647059, 0, 1,
-0.9858786, 0.8314683, -1.129461, 1, 0.972549, 0, 1,
-0.9790471, -2.583809, -4.632984, 1, 0.9764706, 0, 1,
-0.9743267, -0.07620548, -0.6892025, 1, 0.9843137, 0, 1,
-0.9714666, 0.9344747, -1.48958, 1, 0.9882353, 0, 1,
-0.9552492, -0.2458492, -0.5544531, 1, 0.9960784, 0, 1,
-0.9481142, 1.491889, -0.4819452, 0.9960784, 1, 0, 1,
-0.9475436, -0.0860498, -1.803017, 0.9921569, 1, 0, 1,
-0.9471385, 0.4063715, -0.410975, 0.9843137, 1, 0, 1,
-0.9416746, 0.9156189, -0.4454617, 0.9803922, 1, 0, 1,
-0.9413642, 0.6711379, -0.4958753, 0.972549, 1, 0, 1,
-0.9355131, -0.3843839, -2.374745, 0.9686275, 1, 0, 1,
-0.9293773, -0.8579533, -1.630438, 0.9607843, 1, 0, 1,
-0.9257281, -0.03902996, -1.632235, 0.9568627, 1, 0, 1,
-0.9160708, -1.760984, -2.288753, 0.9490196, 1, 0, 1,
-0.9148058, -0.5203694, -2.269165, 0.945098, 1, 0, 1,
-0.9135665, -0.5630081, -2.313948, 0.9372549, 1, 0, 1,
-0.9104449, -0.8731305, -3.426397, 0.9333333, 1, 0, 1,
-0.9089458, -0.8691682, -1.623371, 0.9254902, 1, 0, 1,
-0.906594, -1.460533, -4.44189, 0.9215686, 1, 0, 1,
-0.9056318, -1.170428, -1.67202, 0.9137255, 1, 0, 1,
-0.8927354, 0.5807844, -1.098551, 0.9098039, 1, 0, 1,
-0.8917335, 0.1336994, -1.2159, 0.9019608, 1, 0, 1,
-0.8903443, -0.02558841, -0.7197134, 0.8941177, 1, 0, 1,
-0.8857535, -1.58238, -1.786719, 0.8901961, 1, 0, 1,
-0.8734689, -0.5734561, -2.064377, 0.8823529, 1, 0, 1,
-0.8655159, 0.05818022, -3.331615, 0.8784314, 1, 0, 1,
-0.858088, -0.4921437, -1.915672, 0.8705882, 1, 0, 1,
-0.8454111, 1.175401, 0.769417, 0.8666667, 1, 0, 1,
-0.8441486, 0.8032176, -1.973012, 0.8588235, 1, 0, 1,
-0.834018, 0.1548675, -2.074033, 0.854902, 1, 0, 1,
-0.8328586, -0.361703, -1.563563, 0.8470588, 1, 0, 1,
-0.8289195, -0.7815297, -1.842669, 0.8431373, 1, 0, 1,
-0.8266013, 0.9853122, -0.1319676, 0.8352941, 1, 0, 1,
-0.8207548, -1.157713, -2.313339, 0.8313726, 1, 0, 1,
-0.8197901, -1.386454, -3.898105, 0.8235294, 1, 0, 1,
-0.8185005, -0.164712, -2.303716, 0.8196079, 1, 0, 1,
-0.817172, 0.2129066, -1.071349, 0.8117647, 1, 0, 1,
-0.8160307, -2.87534, -2.312911, 0.8078431, 1, 0, 1,
-0.8099462, 0.3882968, -2.030413, 0.8, 1, 0, 1,
-0.8043289, -0.2557286, -2.515714, 0.7921569, 1, 0, 1,
-0.8028802, -0.4837254, -2.920566, 0.7882353, 1, 0, 1,
-0.79381, -1.439656, -0.8006775, 0.7803922, 1, 0, 1,
-0.7911078, 0.0421731, -3.078564, 0.7764706, 1, 0, 1,
-0.7888721, -0.4179703, -1.634794, 0.7686275, 1, 0, 1,
-0.7877557, 0.1616275, -0.54597, 0.7647059, 1, 0, 1,
-0.782648, 0.1898232, -1.791388, 0.7568628, 1, 0, 1,
-0.7822005, -0.5553929, -2.925032, 0.7529412, 1, 0, 1,
-0.7806958, -2.742604, -3.85915, 0.7450981, 1, 0, 1,
-0.779601, -0.3892196, -2.461681, 0.7411765, 1, 0, 1,
-0.7782074, -1.451657, -2.630393, 0.7333333, 1, 0, 1,
-0.7765707, -0.1951701, -2.07032, 0.7294118, 1, 0, 1,
-0.7758964, -0.03425575, -0.9566695, 0.7215686, 1, 0, 1,
-0.7741859, -0.5837979, -1.171167, 0.7176471, 1, 0, 1,
-0.7678012, -1.401537, -1.909857, 0.7098039, 1, 0, 1,
-0.7626664, 0.8201021, -1.354717, 0.7058824, 1, 0, 1,
-0.7572904, 1.116637, -1.699086, 0.6980392, 1, 0, 1,
-0.7504346, -0.7021133, -3.895476, 0.6901961, 1, 0, 1,
-0.7426723, -0.9662035, -2.418584, 0.6862745, 1, 0, 1,
-0.7360378, 0.02502583, -2.097289, 0.6784314, 1, 0, 1,
-0.7352827, 1.261782, -3.121043, 0.6745098, 1, 0, 1,
-0.7251676, 0.7806982, -0.04518462, 0.6666667, 1, 0, 1,
-0.7205034, 0.4674481, -1.285902, 0.6627451, 1, 0, 1,
-0.7145098, 1.678705, -0.1441843, 0.654902, 1, 0, 1,
-0.7081358, -0.8875466, -2.851002, 0.6509804, 1, 0, 1,
-0.7038914, -1.392505, -1.682738, 0.6431373, 1, 0, 1,
-0.7028008, -1.117784, -0.3523723, 0.6392157, 1, 0, 1,
-0.7018278, 0.8070412, -0.7058479, 0.6313726, 1, 0, 1,
-0.7015638, 0.5429024, -0.6172712, 0.627451, 1, 0, 1,
-0.6986987, 0.1061954, -1.465181, 0.6196079, 1, 0, 1,
-0.6961225, 1.561789, -0.111319, 0.6156863, 1, 0, 1,
-0.6944077, -1.870098, -1.346873, 0.6078432, 1, 0, 1,
-0.693569, -2.069936, -2.2572, 0.6039216, 1, 0, 1,
-0.6905258, 0.3562759, 0.06605139, 0.5960785, 1, 0, 1,
-0.6880053, 0.8354325, -1.624492, 0.5882353, 1, 0, 1,
-0.6846344, -0.8803381, -1.299045, 0.5843138, 1, 0, 1,
-0.6845077, -2.046425, -1.457909, 0.5764706, 1, 0, 1,
-0.6782765, 1.108132, 0.7973149, 0.572549, 1, 0, 1,
-0.6760148, 1.572901, -0.8192319, 0.5647059, 1, 0, 1,
-0.6747409, -1.344504, -3.426727, 0.5607843, 1, 0, 1,
-0.6660693, 0.7088593, -0.7555907, 0.5529412, 1, 0, 1,
-0.6649399, -0.3573713, -2.779802, 0.5490196, 1, 0, 1,
-0.6592932, -0.03825337, -1.135068, 0.5411765, 1, 0, 1,
-0.6563032, -0.8045348, -1.466938, 0.5372549, 1, 0, 1,
-0.6561475, 1.435234, -1.851984, 0.5294118, 1, 0, 1,
-0.653356, -0.3398181, -1.430713, 0.5254902, 1, 0, 1,
-0.6492759, 1.17442, 0.328115, 0.5176471, 1, 0, 1,
-0.6418905, -0.3176447, -2.813623, 0.5137255, 1, 0, 1,
-0.6414467, -0.2136482, -1.679203, 0.5058824, 1, 0, 1,
-0.6414167, 0.5839899, -0.4762245, 0.5019608, 1, 0, 1,
-0.636454, 0.06182225, -1.44067, 0.4941176, 1, 0, 1,
-0.6363699, -0.3687899, -1.846889, 0.4862745, 1, 0, 1,
-0.6351745, 0.2816413, -0.7670914, 0.4823529, 1, 0, 1,
-0.6307763, -0.9219397, -2.995399, 0.4745098, 1, 0, 1,
-0.6307539, 0.3591282, 0.7710607, 0.4705882, 1, 0, 1,
-0.6275963, -1.895116, -2.877022, 0.4627451, 1, 0, 1,
-0.6253209, -1.156204, -1.557726, 0.4588235, 1, 0, 1,
-0.6246184, 0.9584062, -0.6930601, 0.4509804, 1, 0, 1,
-0.6222391, -0.7993204, -1.936113, 0.4470588, 1, 0, 1,
-0.6201299, -0.8079565, -3.130269, 0.4392157, 1, 0, 1,
-0.6200731, -0.5407587, -1.26178, 0.4352941, 1, 0, 1,
-0.6184989, -1.31116, -2.946848, 0.427451, 1, 0, 1,
-0.6138322, -0.805096, -3.489228, 0.4235294, 1, 0, 1,
-0.6114141, 0.3184477, -1.757761, 0.4156863, 1, 0, 1,
-0.6112897, 0.4009715, -1.823069, 0.4117647, 1, 0, 1,
-0.6034347, -1.986386, -2.928975, 0.4039216, 1, 0, 1,
-0.6030839, 0.1367872, -0.6127948, 0.3960784, 1, 0, 1,
-0.601781, -1.881779, -2.467238, 0.3921569, 1, 0, 1,
-0.6007729, 0.7745575, -1.944518, 0.3843137, 1, 0, 1,
-0.5908699, 0.7227363, -1.226031, 0.3803922, 1, 0, 1,
-0.589984, -0.2142734, -1.321708, 0.372549, 1, 0, 1,
-0.5871068, -0.1244869, -1.487797, 0.3686275, 1, 0, 1,
-0.585359, -2.408819, -1.307117, 0.3607843, 1, 0, 1,
-0.5846385, 0.1768424, -1.805188, 0.3568628, 1, 0, 1,
-0.5764549, -1.857627, -3.543278, 0.3490196, 1, 0, 1,
-0.5717813, -0.3735595, -3.150528, 0.345098, 1, 0, 1,
-0.5697215, -0.9775117, -2.136879, 0.3372549, 1, 0, 1,
-0.564047, -0.4115567, -1.891425, 0.3333333, 1, 0, 1,
-0.5573074, -0.571254, -3.089689, 0.3254902, 1, 0, 1,
-0.5552242, 0.2406516, -0.7829523, 0.3215686, 1, 0, 1,
-0.5522143, -0.9226266, -4.857301, 0.3137255, 1, 0, 1,
-0.5518268, -1.019372, -2.075708, 0.3098039, 1, 0, 1,
-0.5435972, 0.1290383, -1.195662, 0.3019608, 1, 0, 1,
-0.5434693, -0.8003278, -1.084424, 0.2941177, 1, 0, 1,
-0.5425119, -0.4331435, -2.129232, 0.2901961, 1, 0, 1,
-0.5398018, 1.075519, -3.537951, 0.282353, 1, 0, 1,
-0.5389386, -0.2670392, -1.707837, 0.2784314, 1, 0, 1,
-0.5357111, -0.4800028, -2.607972, 0.2705882, 1, 0, 1,
-0.5342191, -0.01189322, -2.318292, 0.2666667, 1, 0, 1,
-0.5341825, 1.976672, 1.418769, 0.2588235, 1, 0, 1,
-0.5319605, -1.190463, -2.754207, 0.254902, 1, 0, 1,
-0.5276969, -0.3861854, -1.279976, 0.2470588, 1, 0, 1,
-0.5269437, 0.8870046, -0.2735439, 0.2431373, 1, 0, 1,
-0.525373, -0.5584197, -1.655451, 0.2352941, 1, 0, 1,
-0.5220364, -0.5663453, -0.4439679, 0.2313726, 1, 0, 1,
-0.5218549, -0.3943223, -3.482548, 0.2235294, 1, 0, 1,
-0.5216818, -1.886149, -2.31876, 0.2196078, 1, 0, 1,
-0.5149216, -0.1272247, -2.857164, 0.2117647, 1, 0, 1,
-0.5116579, -0.7910287, -2.246304, 0.2078431, 1, 0, 1,
-0.5097945, -0.4986095, 1.374127, 0.2, 1, 0, 1,
-0.508905, 1.954049, -0.4690944, 0.1921569, 1, 0, 1,
-0.5046744, 0.4538037, -0.09633946, 0.1882353, 1, 0, 1,
-0.4985547, 0.7531053, -0.3169185, 0.1803922, 1, 0, 1,
-0.4926132, 0.3872606, -1.173714, 0.1764706, 1, 0, 1,
-0.481838, -0.9908881, -3.791169, 0.1686275, 1, 0, 1,
-0.4800693, 1.150962, -0.3971802, 0.1647059, 1, 0, 1,
-0.4713871, -0.5352136, -1.203855, 0.1568628, 1, 0, 1,
-0.4662224, -1.25201, -1.665868, 0.1529412, 1, 0, 1,
-0.4643754, 1.994873, -0.8643387, 0.145098, 1, 0, 1,
-0.460328, 0.3468907, -2.313081, 0.1411765, 1, 0, 1,
-0.4537266, 0.5144626, -0.9774629, 0.1333333, 1, 0, 1,
-0.4515065, 0.5940412, -1.507244, 0.1294118, 1, 0, 1,
-0.4496469, 0.7369111, 0.4100701, 0.1215686, 1, 0, 1,
-0.4401838, 1.186547, -0.06508502, 0.1176471, 1, 0, 1,
-0.4345685, 0.4135412, -1.216051, 0.1098039, 1, 0, 1,
-0.4339378, 1.224478, -0.5332381, 0.1058824, 1, 0, 1,
-0.4328409, 0.9528447, -0.9959211, 0.09803922, 1, 0, 1,
-0.4295467, -0.1883238, -1.178345, 0.09019608, 1, 0, 1,
-0.4288456, 2.140263, -0.1444663, 0.08627451, 1, 0, 1,
-0.4285612, -0.9135682, -2.328762, 0.07843138, 1, 0, 1,
-0.4207959, -2.835019, -2.125189, 0.07450981, 1, 0, 1,
-0.4171809, 0.5490497, -0.05566236, 0.06666667, 1, 0, 1,
-0.4127467, 0.7214531, -0.8989235, 0.0627451, 1, 0, 1,
-0.4122731, -1.059447, -5.243673, 0.05490196, 1, 0, 1,
-0.4019972, 0.4067823, -1.340015, 0.05098039, 1, 0, 1,
-0.4017991, 0.3667654, -0.5474129, 0.04313726, 1, 0, 1,
-0.3966659, 0.09824959, -1.229237, 0.03921569, 1, 0, 1,
-0.3945743, 0.7576441, -1.366709, 0.03137255, 1, 0, 1,
-0.3935793, -1.396943, -2.895256, 0.02745098, 1, 0, 1,
-0.3928915, -0.2040837, -2.794162, 0.01960784, 1, 0, 1,
-0.3859395, 0.9823814, 1.095255, 0.01568628, 1, 0, 1,
-0.384845, 0.05788742, -1.032434, 0.007843138, 1, 0, 1,
-0.3829684, -2.084174, -4.08901, 0.003921569, 1, 0, 1,
-0.3751061, 1.035089, 0.8640372, 0, 1, 0.003921569, 1,
-0.3673716, -0.2507721, -2.396595, 0, 1, 0.01176471, 1,
-0.3603302, -0.4274327, -4.238832, 0, 1, 0.01568628, 1,
-0.3570366, -0.3081657, -0.7572999, 0, 1, 0.02352941, 1,
-0.354808, -0.5962797, -3.809304, 0, 1, 0.02745098, 1,
-0.349234, -0.229982, -2.483622, 0, 1, 0.03529412, 1,
-0.3472865, 0.6880399, -0.3849961, 0, 1, 0.03921569, 1,
-0.3455742, 0.1693332, -1.018465, 0, 1, 0.04705882, 1,
-0.3411184, 1.559561, -0.4882865, 0, 1, 0.05098039, 1,
-0.339552, -2.264771, -2.733785, 0, 1, 0.05882353, 1,
-0.3383372, 0.04366488, -1.22146, 0, 1, 0.0627451, 1,
-0.3374344, 0.8138562, -0.5223635, 0, 1, 0.07058824, 1,
-0.3344635, -1.191365, -1.579517, 0, 1, 0.07450981, 1,
-0.3344611, -1.741084, -2.945548, 0, 1, 0.08235294, 1,
-0.3329751, -1.974431, -3.725231, 0, 1, 0.08627451, 1,
-0.3313305, -0.375386, -3.08365, 0, 1, 0.09411765, 1,
-0.3280227, 0.4930952, -1.26137, 0, 1, 0.1019608, 1,
-0.3277795, 0.02568778, -0.1214578, 0, 1, 0.1058824, 1,
-0.3263676, 0.05374321, -0.1476842, 0, 1, 0.1137255, 1,
-0.3257317, 0.0532601, -1.205674, 0, 1, 0.1176471, 1,
-0.3182804, -0.1412058, -2.755908, 0, 1, 0.1254902, 1,
-0.3156084, -1.749095, -2.631845, 0, 1, 0.1294118, 1,
-0.3137483, 0.07787894, 0.05370405, 0, 1, 0.1372549, 1,
-0.3134847, -0.8699772, -3.388901, 0, 1, 0.1411765, 1,
-0.3134054, -1.183694, -2.732711, 0, 1, 0.1490196, 1,
-0.3064238, -0.1816019, -3.153283, 0, 1, 0.1529412, 1,
-0.3027137, -0.5204881, -2.934885, 0, 1, 0.1607843, 1,
-0.3018144, 0.2832464, -0.7557807, 0, 1, 0.1647059, 1,
-0.3011824, 0.009268928, -1.634447, 0, 1, 0.172549, 1,
-0.2997824, 1.20306, -1.896404, 0, 1, 0.1764706, 1,
-0.2955585, 0.7522836, -1.658863, 0, 1, 0.1843137, 1,
-0.2940919, 0.4544377, 0.2182238, 0, 1, 0.1882353, 1,
-0.2897286, 0.6571726, -0.2363888, 0, 1, 0.1960784, 1,
-0.2853986, 0.3050223, -0.5170346, 0, 1, 0.2039216, 1,
-0.2832563, -0.8822698, -4.084122, 0, 1, 0.2078431, 1,
-0.283056, -3.249028, -3.184757, 0, 1, 0.2156863, 1,
-0.279182, 0.6921934, -1.194147, 0, 1, 0.2196078, 1,
-0.2739599, 2.012142, 0.1264604, 0, 1, 0.227451, 1,
-0.2659344, 0.5600743, 1.053814, 0, 1, 0.2313726, 1,
-0.2608641, 0.6712186, 1.645257, 0, 1, 0.2392157, 1,
-0.2598759, -0.8693941, -2.111289, 0, 1, 0.2431373, 1,
-0.2570772, -0.2604012, -1.243951, 0, 1, 0.2509804, 1,
-0.2567188, 1.689476, 0.05105408, 0, 1, 0.254902, 1,
-0.2532074, 0.1828658, -0.9585693, 0, 1, 0.2627451, 1,
-0.2497598, -1.327802, -2.726135, 0, 1, 0.2666667, 1,
-0.2475437, 0.3997761, -0.1260793, 0, 1, 0.2745098, 1,
-0.2470376, -2.013289, -3.478534, 0, 1, 0.2784314, 1,
-0.240718, -2.347184, -2.198241, 0, 1, 0.2862745, 1,
-0.2340208, -1.081556, -1.772815, 0, 1, 0.2901961, 1,
-0.2320221, 0.4883258, -0.8763705, 0, 1, 0.2980392, 1,
-0.2308917, -0.9550461, -3.226195, 0, 1, 0.3058824, 1,
-0.2305072, 0.9204291, -1.092662, 0, 1, 0.3098039, 1,
-0.2288844, 0.03298675, -0.6780114, 0, 1, 0.3176471, 1,
-0.2239336, 0.4107977, -0.9349065, 0, 1, 0.3215686, 1,
-0.2228346, -1.470369, -2.327251, 0, 1, 0.3294118, 1,
-0.2215634, -0.6359216, -2.752098, 0, 1, 0.3333333, 1,
-0.2185925, 1.766635, 1.225988, 0, 1, 0.3411765, 1,
-0.2154502, 1.030607, -1.779332, 0, 1, 0.345098, 1,
-0.2142225, -1.030035, -3.416151, 0, 1, 0.3529412, 1,
-0.2078388, 0.6655091, -1.21299, 0, 1, 0.3568628, 1,
-0.2018935, 0.7905866, -1.874841, 0, 1, 0.3647059, 1,
-0.2014624, 0.6352175, 1.045034, 0, 1, 0.3686275, 1,
-0.2014407, -0.2717791, -2.431208, 0, 1, 0.3764706, 1,
-0.1980516, -0.02682772, -2.359166, 0, 1, 0.3803922, 1,
-0.1913625, -0.8419696, -3.19695, 0, 1, 0.3882353, 1,
-0.1886772, -0.9522253, -0.3359994, 0, 1, 0.3921569, 1,
-0.1881088, 1.049577, 0.2869887, 0, 1, 0.4, 1,
-0.1862668, 1.908723, 0.988929, 0, 1, 0.4078431, 1,
-0.185724, 0.1910586, -0.4372073, 0, 1, 0.4117647, 1,
-0.1840491, 0.5569188, 0.9439282, 0, 1, 0.4196078, 1,
-0.1819055, -0.4975706, -1.491193, 0, 1, 0.4235294, 1,
-0.1783392, -0.2867739, -3.586116, 0, 1, 0.4313726, 1,
-0.1740665, -0.1852248, -1.7372, 0, 1, 0.4352941, 1,
-0.1720235, 0.5664413, 0.979122, 0, 1, 0.4431373, 1,
-0.1711795, -0.2065923, -3.286614, 0, 1, 0.4470588, 1,
-0.1699794, 0.7524922, -1.802431, 0, 1, 0.454902, 1,
-0.1698429, 1.491475, 1.424731, 0, 1, 0.4588235, 1,
-0.1688686, 1.100159, -1.121965, 0, 1, 0.4666667, 1,
-0.1679505, -0.5569186, -2.409693, 0, 1, 0.4705882, 1,
-0.1677476, 1.787146, -0.5155169, 0, 1, 0.4784314, 1,
-0.160217, -0.086379, -2.548911, 0, 1, 0.4823529, 1,
-0.1589209, 1.241318, -0.4748846, 0, 1, 0.4901961, 1,
-0.1543275, -1.137275, -2.011163, 0, 1, 0.4941176, 1,
-0.1540782, -0.06356841, -2.082313, 0, 1, 0.5019608, 1,
-0.1526974, 0.1823228, -0.8377857, 0, 1, 0.509804, 1,
-0.1516672, 1.479434, 0.2918554, 0, 1, 0.5137255, 1,
-0.150055, 1.274917, -0.705945, 0, 1, 0.5215687, 1,
-0.1489772, 1.337969, 0.4178647, 0, 1, 0.5254902, 1,
-0.1448439, -0.9506334, -3.424265, 0, 1, 0.5333334, 1,
-0.1381213, -0.02241297, -1.723071, 0, 1, 0.5372549, 1,
-0.1369539, 0.2309456, -1.924288, 0, 1, 0.5450981, 1,
-0.1352313, 0.3672169, -0.9672863, 0, 1, 0.5490196, 1,
-0.1338591, -0.06015595, -1.564801, 0, 1, 0.5568628, 1,
-0.1332736, -2.317679, -2.966666, 0, 1, 0.5607843, 1,
-0.1242269, 0.6419023, -0.1738643, 0, 1, 0.5686275, 1,
-0.1204978, -0.09105308, -2.79405, 0, 1, 0.572549, 1,
-0.1197415, 0.6074966, 0.7026526, 0, 1, 0.5803922, 1,
-0.1195148, 1.763123, 0.2424772, 0, 1, 0.5843138, 1,
-0.1184954, 1.097373, 0.1878289, 0, 1, 0.5921569, 1,
-0.1175287, 0.4825516, -0.8589128, 0, 1, 0.5960785, 1,
-0.1154695, -0.2408967, -3.712549, 0, 1, 0.6039216, 1,
-0.1150264, -1.350805, -4.723108, 0, 1, 0.6117647, 1,
-0.1109947, 1.129463, 0.3827903, 0, 1, 0.6156863, 1,
-0.1097667, -0.3207134, -0.6376068, 0, 1, 0.6235294, 1,
-0.1094385, 1.178808, -1.189372, 0, 1, 0.627451, 1,
-0.1076755, 0.7765001, -0.3840263, 0, 1, 0.6352941, 1,
-0.1068646, 1.19562, -1.316778, 0, 1, 0.6392157, 1,
-0.1059338, 0.9321586, -0.4331172, 0, 1, 0.6470588, 1,
-0.1018573, 0.6082779, -0.03390481, 0, 1, 0.6509804, 1,
-0.1004875, -1.079652, -4.522335, 0, 1, 0.6588235, 1,
-0.09824836, 1.733053, -0.07984573, 0, 1, 0.6627451, 1,
-0.09698637, 0.3397638, -1.582755, 0, 1, 0.6705883, 1,
-0.09652988, -0.1579282, -1.298841, 0, 1, 0.6745098, 1,
-0.091725, 0.4416516, 2.41213, 0, 1, 0.682353, 1,
-0.09113841, -0.8096328, -4.752025, 0, 1, 0.6862745, 1,
-0.08674785, -0.5701045, -2.454874, 0, 1, 0.6941177, 1,
-0.08138771, -0.6507313, -3.004425, 0, 1, 0.7019608, 1,
-0.0812014, 0.7396445, -0.7987078, 0, 1, 0.7058824, 1,
-0.07857002, 1.219686, -1.041533, 0, 1, 0.7137255, 1,
-0.07664637, -0.9283589, -2.813644, 0, 1, 0.7176471, 1,
-0.07624343, 1.458928, -0.122547, 0, 1, 0.7254902, 1,
-0.07315048, 0.4760466, -1.107539, 0, 1, 0.7294118, 1,
-0.07275993, 0.1285004, 0.81297, 0, 1, 0.7372549, 1,
-0.06731415, 0.5041557, -1.449202, 0, 1, 0.7411765, 1,
-0.06641659, 0.3310566, -0.5247881, 0, 1, 0.7490196, 1,
-0.0653488, 0.9220277, 0.9142588, 0, 1, 0.7529412, 1,
-0.05918241, 0.4904101, -0.9775833, 0, 1, 0.7607843, 1,
-0.05827988, 0.2140821, -0.03737525, 0, 1, 0.7647059, 1,
-0.05691618, -2.510047, -3.85408, 0, 1, 0.772549, 1,
-0.05639156, 1.722823, -1.242095, 0, 1, 0.7764706, 1,
-0.05583486, 1.359355, -1.037711, 0, 1, 0.7843137, 1,
-0.05411615, -0.7321728, -5.520428, 0, 1, 0.7882353, 1,
-0.04633784, -0.1359927, -3.086884, 0, 1, 0.7960784, 1,
-0.04625499, 1.8389, 1.232642, 0, 1, 0.8039216, 1,
-0.04271408, 1.362708, 0.09985589, 0, 1, 0.8078431, 1,
-0.04227211, 1.62607, 0.1148809, 0, 1, 0.8156863, 1,
-0.04126033, 1.214458, -1.060036, 0, 1, 0.8196079, 1,
-0.03805725, 0.4024737, 0.3815013, 0, 1, 0.827451, 1,
-0.03560065, 0.2573304, 0.1476892, 0, 1, 0.8313726, 1,
-0.03164019, 0.5381884, -1.142936, 0, 1, 0.8392157, 1,
-0.02855892, -1.622397, -3.606884, 0, 1, 0.8431373, 1,
-0.0270124, 0.803753, -1.449729, 0, 1, 0.8509804, 1,
-0.02346126, 0.5928781, -0.7995719, 0, 1, 0.854902, 1,
-0.02299915, -0.5344785, -3.036375, 0, 1, 0.8627451, 1,
-0.02083418, -0.1530946, -3.471472, 0, 1, 0.8666667, 1,
-0.01995006, -0.3550128, -2.03756, 0, 1, 0.8745098, 1,
-0.01971688, -0.002367011, -1.456402, 0, 1, 0.8784314, 1,
-0.01817994, -1.6409, -3.874065, 0, 1, 0.8862745, 1,
-0.01614719, 1.055928, 0.1743243, 0, 1, 0.8901961, 1,
-0.01507854, 0.2530404, 0.7756246, 0, 1, 0.8980392, 1,
-0.01456108, 0.980916, 0.9226659, 0, 1, 0.9058824, 1,
-0.01226262, -1.553469, -3.880667, 0, 1, 0.9098039, 1,
-0.01119223, 0.6096256, 0.1952688, 0, 1, 0.9176471, 1,
-0.002961411, -1.000155, -2.939277, 0, 1, 0.9215686, 1,
-0.001170941, 0.2164424, -0.4796351, 0, 1, 0.9294118, 1,
0.0005736789, 1.871857, -0.2819924, 0, 1, 0.9333333, 1,
0.0005884629, 1.394192, -2.086848, 0, 1, 0.9411765, 1,
0.0008617685, -1.427796, 3.366076, 0, 1, 0.945098, 1,
0.00254274, -0.9265256, 2.933633, 0, 1, 0.9529412, 1,
0.0030883, 0.1045174, -1.430034, 0, 1, 0.9568627, 1,
0.008062492, 0.1205826, -3.008783, 0, 1, 0.9647059, 1,
0.008365464, 0.6587405, -0.6965782, 0, 1, 0.9686275, 1,
0.009370519, 0.7473543, -0.9324814, 0, 1, 0.9764706, 1,
0.01354713, 0.2948551, -0.01468347, 0, 1, 0.9803922, 1,
0.01442703, -0.5327399, 3.249839, 0, 1, 0.9882353, 1,
0.01469059, -0.2636116, 2.151415, 0, 1, 0.9921569, 1,
0.02028861, 1.814407, -0.3248933, 0, 1, 1, 1,
0.02175104, -0.1762554, 2.626363, 0, 0.9921569, 1, 1,
0.02184726, -0.2242813, 1.36836, 0, 0.9882353, 1, 1,
0.02708502, -0.7268102, 2.682086, 0, 0.9803922, 1, 1,
0.02952011, 0.06565369, 2.270558, 0, 0.9764706, 1, 1,
0.0331447, -1.65293, 3.074696, 0, 0.9686275, 1, 1,
0.037287, -0.04363038, 1.981946, 0, 0.9647059, 1, 1,
0.03746332, 0.2706241, 1.659706, 0, 0.9568627, 1, 1,
0.03886339, -1.229147, 3.261666, 0, 0.9529412, 1, 1,
0.03946594, -1.690704, 1.891683, 0, 0.945098, 1, 1,
0.03949033, 0.9699946, -0.9167032, 0, 0.9411765, 1, 1,
0.04077536, -0.8762971, 4.103648, 0, 0.9333333, 1, 1,
0.04122689, 0.03690184, -0.4516367, 0, 0.9294118, 1, 1,
0.04139214, -1.01556, 3.873806, 0, 0.9215686, 1, 1,
0.04163359, 0.5011926, 1.001597, 0, 0.9176471, 1, 1,
0.04204966, -0.6620278, 1.837469, 0, 0.9098039, 1, 1,
0.04210289, 0.1000829, 3.426898, 0, 0.9058824, 1, 1,
0.04452555, 0.8035572, -0.3871782, 0, 0.8980392, 1, 1,
0.04837496, 2.208482, -1.471128, 0, 0.8901961, 1, 1,
0.05081075, -0.05991932, 3.179872, 0, 0.8862745, 1, 1,
0.05275777, -0.1513128, 3.632324, 0, 0.8784314, 1, 1,
0.05287961, 1.314338, 1.477666, 0, 0.8745098, 1, 1,
0.05509229, 0.8407033, 1.739391, 0, 0.8666667, 1, 1,
0.0578011, -1.188212, 1.73157, 0, 0.8627451, 1, 1,
0.0649892, 0.7741691, 2.211145, 0, 0.854902, 1, 1,
0.06499561, 0.6161198, 2.027646, 0, 0.8509804, 1, 1,
0.07068633, 1.49461, -0.3452943, 0, 0.8431373, 1, 1,
0.07262051, -0.8179346, 3.356113, 0, 0.8392157, 1, 1,
0.07409946, -0.1427257, 2.843723, 0, 0.8313726, 1, 1,
0.07575981, -0.6208917, 2.538933, 0, 0.827451, 1, 1,
0.0785307, 0.6254076, 2.253994, 0, 0.8196079, 1, 1,
0.07863018, -1.046588, 4.052275, 0, 0.8156863, 1, 1,
0.0861975, 1.352997, 0.5870205, 0, 0.8078431, 1, 1,
0.08642653, -0.03196777, 1.962495, 0, 0.8039216, 1, 1,
0.0888678, 0.1665281, 1.579759, 0, 0.7960784, 1, 1,
0.0893391, -2.45593, 2.906884, 0, 0.7882353, 1, 1,
0.09195868, 1.264039, -0.327055, 0, 0.7843137, 1, 1,
0.09359144, -1.550061, 2.976388, 0, 0.7764706, 1, 1,
0.09473799, -0.1613088, 0.6946407, 0, 0.772549, 1, 1,
0.1019613, -0.5570798, 0.4528272, 0, 0.7647059, 1, 1,
0.1020931, 0.48418, -0.2354943, 0, 0.7607843, 1, 1,
0.1065643, 0.5571712, 1.120719, 0, 0.7529412, 1, 1,
0.1080225, 1.672827, -0.3569531, 0, 0.7490196, 1, 1,
0.1163624, -0.9054574, 4.103219, 0, 0.7411765, 1, 1,
0.1176439, -1.063666, 2.669478, 0, 0.7372549, 1, 1,
0.118814, 1.792915, 0.1279331, 0, 0.7294118, 1, 1,
0.1214096, 0.8893344, 1.137084, 0, 0.7254902, 1, 1,
0.1217165, -0.04752285, 3.44176, 0, 0.7176471, 1, 1,
0.1324531, -0.4155447, 0.478677, 0, 0.7137255, 1, 1,
0.1331691, 0.2386161, 0.208821, 0, 0.7058824, 1, 1,
0.1332438, -1.119205, 1.874108, 0, 0.6980392, 1, 1,
0.1390885, 0.5613051, 0.5340319, 0, 0.6941177, 1, 1,
0.1408742, -3.438129, 4.035136, 0, 0.6862745, 1, 1,
0.1426457, 0.9521409, -0.1511787, 0, 0.682353, 1, 1,
0.1430973, -0.432267, 0.4162577, 0, 0.6745098, 1, 1,
0.145723, -0.614959, 2.520201, 0, 0.6705883, 1, 1,
0.1469817, -0.3858203, 2.433718, 0, 0.6627451, 1, 1,
0.1473101, -0.2320023, 1.399582, 0, 0.6588235, 1, 1,
0.1503957, 0.2390249, 1.49484, 0, 0.6509804, 1, 1,
0.1517947, -0.7620412, 0.7585377, 0, 0.6470588, 1, 1,
0.1567412, -0.3723331, 1.795728, 0, 0.6392157, 1, 1,
0.1580815, 0.1044, 0.1336721, 0, 0.6352941, 1, 1,
0.1592962, 0.6589832, 1.06165, 0, 0.627451, 1, 1,
0.1640963, -0.3309704, 1.429266, 0, 0.6235294, 1, 1,
0.1670509, 0.00767382, 3.736705, 0, 0.6156863, 1, 1,
0.1676195, 0.8026991, 0.8008528, 0, 0.6117647, 1, 1,
0.1693189, -0.2006164, 1.461458, 0, 0.6039216, 1, 1,
0.172117, -1.086473, 2.199041, 0, 0.5960785, 1, 1,
0.174202, 1.074629, 0.6234222, 0, 0.5921569, 1, 1,
0.1747712, -1.080916, 2.29216, 0, 0.5843138, 1, 1,
0.1757, -1.306455, 2.316257, 0, 0.5803922, 1, 1,
0.1757691, -0.5849973, 2.34642, 0, 0.572549, 1, 1,
0.1763732, -0.4603001, 3.202811, 0, 0.5686275, 1, 1,
0.1769082, -0.1298509, 1.933436, 0, 0.5607843, 1, 1,
0.1790954, -0.3013947, 1.187873, 0, 0.5568628, 1, 1,
0.182587, 0.6225616, 1.354685, 0, 0.5490196, 1, 1,
0.1850743, 0.09108632, 0.4212494, 0, 0.5450981, 1, 1,
0.1865136, 0.1780822, -0.3921003, 0, 0.5372549, 1, 1,
0.1871401, -1.968577, 1.687177, 0, 0.5333334, 1, 1,
0.1879439, 0.3952938, 0.8073002, 0, 0.5254902, 1, 1,
0.1890889, 0.1861505, -1.071921, 0, 0.5215687, 1, 1,
0.19134, -0.3757037, -0.1738235, 0, 0.5137255, 1, 1,
0.1939615, 2.906368, -0.9529098, 0, 0.509804, 1, 1,
0.2026439, 1.014154, 0.7635968, 0, 0.5019608, 1, 1,
0.2034623, -0.3251205, 3.604628, 0, 0.4941176, 1, 1,
0.208023, -1.443831, 2.539759, 0, 0.4901961, 1, 1,
0.2113453, -0.5504175, 2.981632, 0, 0.4823529, 1, 1,
0.2131717, -1.328615, 2.86183, 0, 0.4784314, 1, 1,
0.2146281, 1.239622, 0.1000764, 0, 0.4705882, 1, 1,
0.2167977, -0.8582432, 2.58622, 0, 0.4666667, 1, 1,
0.2176619, -0.2169632, 3.652759, 0, 0.4588235, 1, 1,
0.2236745, -0.4990093, 2.843637, 0, 0.454902, 1, 1,
0.2247188, -0.7691783, 0.4714984, 0, 0.4470588, 1, 1,
0.2248107, -0.517488, 3.692933, 0, 0.4431373, 1, 1,
0.2251894, 1.994153, -0.2730891, 0, 0.4352941, 1, 1,
0.2254627, -0.3043806, 2.8302, 0, 0.4313726, 1, 1,
0.227394, -0.6440802, 1.114811, 0, 0.4235294, 1, 1,
0.2275124, -0.5477079, 2.48587, 0, 0.4196078, 1, 1,
0.229492, -0.06264459, 1.951186, 0, 0.4117647, 1, 1,
0.2300097, 0.6541836, 0.5425427, 0, 0.4078431, 1, 1,
0.2324032, 0.3721922, 0.5102575, 0, 0.4, 1, 1,
0.2364505, 1.27863, 1.099756, 0, 0.3921569, 1, 1,
0.236664, -0.125161, 0.6300269, 0, 0.3882353, 1, 1,
0.2376245, -0.7132459, 5.049279, 0, 0.3803922, 1, 1,
0.2415334, -0.23317, 1.767802, 0, 0.3764706, 1, 1,
0.2427992, -2.695993, 3.368994, 0, 0.3686275, 1, 1,
0.2446599, 1.411653, 0.5222087, 0, 0.3647059, 1, 1,
0.2450733, -0.0688751, 2.666307, 0, 0.3568628, 1, 1,
0.246224, 0.2599685, 2.651663, 0, 0.3529412, 1, 1,
0.2472642, 0.4498627, 0.993108, 0, 0.345098, 1, 1,
0.2480148, 0.2110159, 0.2512109, 0, 0.3411765, 1, 1,
0.2481092, 0.2863707, 2.166714, 0, 0.3333333, 1, 1,
0.2487201, 0.7226035, -0.8547533, 0, 0.3294118, 1, 1,
0.2504842, -0.7524663, 2.228131, 0, 0.3215686, 1, 1,
0.2508593, -0.06750817, 3.911414, 0, 0.3176471, 1, 1,
0.2551256, -1.856265, 3.800894, 0, 0.3098039, 1, 1,
0.2634656, 0.9719722, 3.53117, 0, 0.3058824, 1, 1,
0.2637065, 2.902362, 1.116803, 0, 0.2980392, 1, 1,
0.2662247, 0.5740969, 0.02148285, 0, 0.2901961, 1, 1,
0.2677314, 2.810265, 0.510708, 0, 0.2862745, 1, 1,
0.2687535, 2.258864, -1.303408, 0, 0.2784314, 1, 1,
0.271391, -0.3293597, 2.16619, 0, 0.2745098, 1, 1,
0.272025, -1.251312, 4.083123, 0, 0.2666667, 1, 1,
0.2720995, -1.633152, 2.261106, 0, 0.2627451, 1, 1,
0.2809327, 0.3096863, 1.493124, 0, 0.254902, 1, 1,
0.28268, 0.04150977, 1.045109, 0, 0.2509804, 1, 1,
0.2843251, -0.5635996, 5.439311, 0, 0.2431373, 1, 1,
0.2850099, -0.5274527, 3.961026, 0, 0.2392157, 1, 1,
0.2865161, 1.07408, 1.035455, 0, 0.2313726, 1, 1,
0.286788, -0.3884324, 1.846583, 0, 0.227451, 1, 1,
0.2945102, 1.412208, 1.207757, 0, 0.2196078, 1, 1,
0.2946329, 1.178066, -1.411995, 0, 0.2156863, 1, 1,
0.2955008, 0.9512726, 1.164678, 0, 0.2078431, 1, 1,
0.2991361, -1.227726, 3.53573, 0, 0.2039216, 1, 1,
0.3007891, -0.6350459, 3.663339, 0, 0.1960784, 1, 1,
0.3013849, 0.3505237, 0.8428453, 0, 0.1882353, 1, 1,
0.3024929, -0.1828584, 2.090089, 0, 0.1843137, 1, 1,
0.3098566, 1.381749, 0.4591953, 0, 0.1764706, 1, 1,
0.3110814, 0.5235099, -0.6018544, 0, 0.172549, 1, 1,
0.3143551, 0.7558737, 0.8281322, 0, 0.1647059, 1, 1,
0.3160133, -0.9321924, 3.344564, 0, 0.1607843, 1, 1,
0.3178361, 0.5412999, 2.378647, 0, 0.1529412, 1, 1,
0.3198151, 0.2163518, 2.625004, 0, 0.1490196, 1, 1,
0.3232517, 1.86795, -1.16936, 0, 0.1411765, 1, 1,
0.3296355, 1.802895, 1.144112, 0, 0.1372549, 1, 1,
0.3314478, -0.06244889, 3.079704, 0, 0.1294118, 1, 1,
0.336062, 1.002648, -0.5623921, 0, 0.1254902, 1, 1,
0.3371938, -1.410678, 3.12302, 0, 0.1176471, 1, 1,
0.339758, -0.6720577, 0.5595879, 0, 0.1137255, 1, 1,
0.3444018, -1.381198, 1.723511, 0, 0.1058824, 1, 1,
0.3482708, 1.768783, 1.111604, 0, 0.09803922, 1, 1,
0.349201, 0.1037375, 0.8797795, 0, 0.09411765, 1, 1,
0.3495142, -0.2372821, 3.004488, 0, 0.08627451, 1, 1,
0.3504602, 1.114568, 1.990218, 0, 0.08235294, 1, 1,
0.3529469, 0.5637797, 1.006556, 0, 0.07450981, 1, 1,
0.3601142, 3.124507, -0.7752301, 0, 0.07058824, 1, 1,
0.3613002, -1.893308, 3.604882, 0, 0.0627451, 1, 1,
0.3668453, 1.487413, 0.5159988, 0, 0.05882353, 1, 1,
0.3702061, -0.5954666, 0.9431214, 0, 0.05098039, 1, 1,
0.3747755, -1.483936, 3.801698, 0, 0.04705882, 1, 1,
0.3789729, 0.5598682, 0.7177953, 0, 0.03921569, 1, 1,
0.3844144, -0.06666377, 2.16743, 0, 0.03529412, 1, 1,
0.3851446, 0.1008135, 4.146551, 0, 0.02745098, 1, 1,
0.3857375, 1.039757, 0.6240929, 0, 0.02352941, 1, 1,
0.3888387, -0.7435571, 2.757099, 0, 0.01568628, 1, 1,
0.3892182, -0.05899226, 2.444754, 0, 0.01176471, 1, 1,
0.3929474, -0.6298414, 2.2872, 0, 0.003921569, 1, 1,
0.3972786, 0.9566146, 1.639518, 0.003921569, 0, 1, 1,
0.397906, -0.8957758, 3.039945, 0.007843138, 0, 1, 1,
0.400623, 0.5527881, 0.4205256, 0.01568628, 0, 1, 1,
0.4119377, 0.5731378, 1.040604, 0.01960784, 0, 1, 1,
0.4151331, -0.04827107, 3.125711, 0.02745098, 0, 1, 1,
0.4167546, 0.9320382, 0.7062376, 0.03137255, 0, 1, 1,
0.4219609, 1.036944, 1.494338, 0.03921569, 0, 1, 1,
0.4226944, 0.591413, 0.2873924, 0.04313726, 0, 1, 1,
0.4256434, -1.32923, 1.903705, 0.05098039, 0, 1, 1,
0.4271412, -0.5728215, 2.030511, 0.05490196, 0, 1, 1,
0.4317961, -1.072747, 2.101355, 0.0627451, 0, 1, 1,
0.4350058, -2.160439, 2.371079, 0.06666667, 0, 1, 1,
0.4388525, -0.7793548, 4.583904, 0.07450981, 0, 1, 1,
0.4388701, -0.3853335, 2.324453, 0.07843138, 0, 1, 1,
0.438903, -0.8835843, 1.24417, 0.08627451, 0, 1, 1,
0.4422735, 0.355948, 1.344475, 0.09019608, 0, 1, 1,
0.4442893, -0.1200014, 2.79761, 0.09803922, 0, 1, 1,
0.4462614, 0.7369563, 0.4186398, 0.1058824, 0, 1, 1,
0.447499, -1.033857, 2.135849, 0.1098039, 0, 1, 1,
0.4476609, -0.3368981, 3.557235, 0.1176471, 0, 1, 1,
0.4490672, 0.6988263, 0.114819, 0.1215686, 0, 1, 1,
0.4576065, -2.411186, 1.904108, 0.1294118, 0, 1, 1,
0.4593062, -1.001541, 2.474051, 0.1333333, 0, 1, 1,
0.4598484, -1.113675, 2.586556, 0.1411765, 0, 1, 1,
0.4660719, 0.4050426, 2.23094, 0.145098, 0, 1, 1,
0.4693848, -0.9387223, 3.053338, 0.1529412, 0, 1, 1,
0.470083, 0.5457742, 1.5394, 0.1568628, 0, 1, 1,
0.4709981, -1.793102, 2.679942, 0.1647059, 0, 1, 1,
0.4742042, 0.07571661, 0.9905325, 0.1686275, 0, 1, 1,
0.4748023, -0.7483422, 3.370278, 0.1764706, 0, 1, 1,
0.480875, 0.5898029, -1.771122, 0.1803922, 0, 1, 1,
0.4822803, -0.6418964, 2.511867, 0.1882353, 0, 1, 1,
0.4913499, -0.16475, 3.333099, 0.1921569, 0, 1, 1,
0.5037705, 0.2544223, 1.943957, 0.2, 0, 1, 1,
0.5041487, -1.833407, 3.3267, 0.2078431, 0, 1, 1,
0.5097936, -2.562516, 3.089688, 0.2117647, 0, 1, 1,
0.5103027, -1.136249, 3.808183, 0.2196078, 0, 1, 1,
0.5283613, 2.710621, 0.7663663, 0.2235294, 0, 1, 1,
0.5297512, 1.232372, 1.225911, 0.2313726, 0, 1, 1,
0.5297736, -0.117994, 1.460416, 0.2352941, 0, 1, 1,
0.5332218, -0.2482654, 3.082173, 0.2431373, 0, 1, 1,
0.5384445, -0.8159049, 1.020269, 0.2470588, 0, 1, 1,
0.5394493, 0.6466585, -0.384771, 0.254902, 0, 1, 1,
0.543948, 2.122061, 0.6897253, 0.2588235, 0, 1, 1,
0.5468602, 0.5375805, 2.377723, 0.2666667, 0, 1, 1,
0.5495545, 0.3192768, 1.410923, 0.2705882, 0, 1, 1,
0.5502492, -0.7847996, 4.817233, 0.2784314, 0, 1, 1,
0.5519882, -0.2056661, 2.189481, 0.282353, 0, 1, 1,
0.5540304, 0.2569931, 0.9191293, 0.2901961, 0, 1, 1,
0.5622302, 0.007618673, 3.20702, 0.2941177, 0, 1, 1,
0.562737, -0.7670312, 3.072448, 0.3019608, 0, 1, 1,
0.5727006, 1.328211, 0.5524371, 0.3098039, 0, 1, 1,
0.5740723, 0.5388338, 0.4535943, 0.3137255, 0, 1, 1,
0.5833036, 0.113012, 1.575711, 0.3215686, 0, 1, 1,
0.5856547, 0.6050698, -1.663947, 0.3254902, 0, 1, 1,
0.5857602, -0.01955805, 1.70575, 0.3333333, 0, 1, 1,
0.5910694, -1.109432, 3.939416, 0.3372549, 0, 1, 1,
0.5978194, 0.04161835, 1.072236, 0.345098, 0, 1, 1,
0.5979155, -1.011103, 1.731577, 0.3490196, 0, 1, 1,
0.6010479, -0.6851269, 2.370199, 0.3568628, 0, 1, 1,
0.6059952, 0.7980093, 0.175146, 0.3607843, 0, 1, 1,
0.6125445, 1.112585, 0.1639866, 0.3686275, 0, 1, 1,
0.6131476, -0.02574814, 4.120367, 0.372549, 0, 1, 1,
0.6133413, -1.672891, 4.015019, 0.3803922, 0, 1, 1,
0.6146283, 2.828967, 1.487569, 0.3843137, 0, 1, 1,
0.6165549, 0.8002235, -0.6935776, 0.3921569, 0, 1, 1,
0.6178057, -1.053586, 2.6728, 0.3960784, 0, 1, 1,
0.6184618, -0.7930772, 2.552555, 0.4039216, 0, 1, 1,
0.6239797, 0.1294246, 0.5322296, 0.4117647, 0, 1, 1,
0.6246409, 0.7798597, 0.398315, 0.4156863, 0, 1, 1,
0.6356387, -0.6707085, 2.508111, 0.4235294, 0, 1, 1,
0.6364763, -1.808471, 1.816858, 0.427451, 0, 1, 1,
0.6407814, 0.7061999, 0.6981006, 0.4352941, 0, 1, 1,
0.6418789, -0.4120165, 1.374102, 0.4392157, 0, 1, 1,
0.6436809, 0.6849318, 0.866056, 0.4470588, 0, 1, 1,
0.6475865, -0.01424657, 0.607807, 0.4509804, 0, 1, 1,
0.651059, 1.236097, 0.4057088, 0.4588235, 0, 1, 1,
0.6728507, 0.4551448, 0.6948148, 0.4627451, 0, 1, 1,
0.6738166, -0.1914709, 2.495171, 0.4705882, 0, 1, 1,
0.6744604, -0.9761089, 3.086904, 0.4745098, 0, 1, 1,
0.6760366, -0.3114879, 1.780048, 0.4823529, 0, 1, 1,
0.6778989, -0.7548544, 2.074304, 0.4862745, 0, 1, 1,
0.6819378, 0.7012711, -0.7910731, 0.4941176, 0, 1, 1,
0.6827982, 0.1001824, 0.2006323, 0.5019608, 0, 1, 1,
0.6923591, -1.53117, 3.47905, 0.5058824, 0, 1, 1,
0.694409, -0.7864262, 3.227464, 0.5137255, 0, 1, 1,
0.699392, -0.4715583, 1.371231, 0.5176471, 0, 1, 1,
0.699809, 0.5179051, 2.542926, 0.5254902, 0, 1, 1,
0.7041561, 0.9982991, -1.44628, 0.5294118, 0, 1, 1,
0.704846, -0.2041701, 1.712349, 0.5372549, 0, 1, 1,
0.7060625, -0.1635604, 2.954717, 0.5411765, 0, 1, 1,
0.7079191, 0.6686743, 0.9392712, 0.5490196, 0, 1, 1,
0.7123653, 1.33964, 0.4900363, 0.5529412, 0, 1, 1,
0.7138201, 2.522291, 1.152369, 0.5607843, 0, 1, 1,
0.7194883, 1.866042, -0.633586, 0.5647059, 0, 1, 1,
0.7218264, -0.6968352, 1.755079, 0.572549, 0, 1, 1,
0.7220548, 0.221742, 1.118926, 0.5764706, 0, 1, 1,
0.7223927, -0.169922, 1.501181, 0.5843138, 0, 1, 1,
0.7225236, 1.509437, 0.3294763, 0.5882353, 0, 1, 1,
0.7233161, 0.9821215, 1.00772, 0.5960785, 0, 1, 1,
0.7266268, -1.870829, 1.983657, 0.6039216, 0, 1, 1,
0.7301767, -1.310928, 2.321032, 0.6078432, 0, 1, 1,
0.7375208, -1.308736, 2.640834, 0.6156863, 0, 1, 1,
0.7461278, -0.2227263, 2.398008, 0.6196079, 0, 1, 1,
0.7473158, -1.5208, 2.992523, 0.627451, 0, 1, 1,
0.750959, -1.705752, 2.314049, 0.6313726, 0, 1, 1,
0.7528732, 0.4311651, 0.9889351, 0.6392157, 0, 1, 1,
0.7712827, -0.3069947, 2.794728, 0.6431373, 0, 1, 1,
0.7751155, 0.2548014, 0.4246372, 0.6509804, 0, 1, 1,
0.7762856, 1.07214, -0.6024399, 0.654902, 0, 1, 1,
0.7771109, 0.4368382, 0.9033881, 0.6627451, 0, 1, 1,
0.7796252, -0.03896113, 0.6998439, 0.6666667, 0, 1, 1,
0.7864332, -1.848972, 2.369299, 0.6745098, 0, 1, 1,
0.7873401, -0.5357643, 1.750775, 0.6784314, 0, 1, 1,
0.7981231, 0.6905476, 0.9443755, 0.6862745, 0, 1, 1,
0.8006048, -0.3786731, 0.7114971, 0.6901961, 0, 1, 1,
0.8020878, -0.4148184, 2.037636, 0.6980392, 0, 1, 1,
0.803897, 1.430286, -0.7824287, 0.7058824, 0, 1, 1,
0.8042095, 0.7159604, -1.044532, 0.7098039, 0, 1, 1,
0.8045213, -0.1113612, 1.853938, 0.7176471, 0, 1, 1,
0.8047785, -0.5864855, 2.043554, 0.7215686, 0, 1, 1,
0.8063999, 0.4107179, 1.311934, 0.7294118, 0, 1, 1,
0.8085844, -0.5865501, 2.939104, 0.7333333, 0, 1, 1,
0.8099496, -1.077267, 3.383675, 0.7411765, 0, 1, 1,
0.8140343, 0.01087527, 0.1603836, 0.7450981, 0, 1, 1,
0.8213235, 1.736738, -0.9744542, 0.7529412, 0, 1, 1,
0.8225167, 0.9403395, -0.1426461, 0.7568628, 0, 1, 1,
0.8261093, 0.2694682, 1.075383, 0.7647059, 0, 1, 1,
0.8306884, 1.4508, 0.1803439, 0.7686275, 0, 1, 1,
0.8326935, -0.5345919, 2.819579, 0.7764706, 0, 1, 1,
0.8335749, -0.4158381, 4.944796, 0.7803922, 0, 1, 1,
0.8345035, 0.01796195, 2.89829, 0.7882353, 0, 1, 1,
0.8350099, -0.7837555, 1.621024, 0.7921569, 0, 1, 1,
0.8350708, 0.1789751, 2.118506, 0.8, 0, 1, 1,
0.8352582, -2.476884, 3.126182, 0.8078431, 0, 1, 1,
0.8384469, -0.001981774, 2.23853, 0.8117647, 0, 1, 1,
0.8430278, 0.2730818, 1.881958, 0.8196079, 0, 1, 1,
0.8463615, -0.229602, 1.530605, 0.8235294, 0, 1, 1,
0.8472749, 0.4023004, 1.581151, 0.8313726, 0, 1, 1,
0.8500991, -1.107245, 2.605899, 0.8352941, 0, 1, 1,
0.8517916, 1.470807, -0.6759831, 0.8431373, 0, 1, 1,
0.8583187, 0.08878563, 1.329764, 0.8470588, 0, 1, 1,
0.8629066, 0.1529403, 1.331497, 0.854902, 0, 1, 1,
0.8630823, 2.096704, 0.1132146, 0.8588235, 0, 1, 1,
0.8647707, 0.1959224, 1.113255, 0.8666667, 0, 1, 1,
0.8710031, 1.847666, -0.3571734, 0.8705882, 0, 1, 1,
0.8711978, 0.1264253, 2.750965, 0.8784314, 0, 1, 1,
0.8715563, -0.1702182, 1.148369, 0.8823529, 0, 1, 1,
0.8760167, -0.1869605, 0.9994757, 0.8901961, 0, 1, 1,
0.878353, 0.5893123, 2.850619, 0.8941177, 0, 1, 1,
0.8833615, -0.06490158, 0.8503451, 0.9019608, 0, 1, 1,
0.8850281, 1.451108, 0.700848, 0.9098039, 0, 1, 1,
0.8874443, 0.4559864, 0.03246525, 0.9137255, 0, 1, 1,
0.8880092, 0.1236269, 0.360325, 0.9215686, 0, 1, 1,
0.8896104, 1.268422, 2.063382, 0.9254902, 0, 1, 1,
0.8899688, 0.1846685, 1.496176, 0.9333333, 0, 1, 1,
0.890349, -1.015735, 3.638021, 0.9372549, 0, 1, 1,
0.8916181, 0.2791327, 0.7209096, 0.945098, 0, 1, 1,
0.8951581, -2.125435, 2.420754, 0.9490196, 0, 1, 1,
0.8968996, 0.20088, 0.7726187, 0.9568627, 0, 1, 1,
0.8978879, 0.4314336, 2.327783, 0.9607843, 0, 1, 1,
0.9019251, -0.7507691, 2.582489, 0.9686275, 0, 1, 1,
0.9140626, -0.2379445, 1.073232, 0.972549, 0, 1, 1,
0.9288994, 1.95615, -0.7466494, 0.9803922, 0, 1, 1,
0.9315357, 0.3890018, 0.6436747, 0.9843137, 0, 1, 1,
0.9335681, -1.620768, 2.203148, 0.9921569, 0, 1, 1,
0.9372224, -0.1171046, 2.249279, 0.9960784, 0, 1, 1,
0.9465911, -0.8372515, 2.303582, 1, 0, 0.9960784, 1,
0.9481297, -0.3723927, 1.70035, 1, 0, 0.9882353, 1,
0.9531564, -1.227204, 2.618881, 1, 0, 0.9843137, 1,
0.9557687, 0.4088064, 0.352464, 1, 0, 0.9764706, 1,
0.9638128, 0.07135612, 2.39775, 1, 0, 0.972549, 1,
0.9645719, -0.07863652, 3.447248, 1, 0, 0.9647059, 1,
0.9657022, 0.6271455, 1.474058, 1, 0, 0.9607843, 1,
0.9699348, -0.03536701, 0.3244551, 1, 0, 0.9529412, 1,
0.9716501, 1.50364, 0.1649454, 1, 0, 0.9490196, 1,
0.9717889, 1.386188, 0.6117741, 1, 0, 0.9411765, 1,
0.9758645, -0.6782715, 2.598737, 1, 0, 0.9372549, 1,
0.9762241, -1.609773, 2.552053, 1, 0, 0.9294118, 1,
0.978302, -1.0101, -0.06454584, 1, 0, 0.9254902, 1,
0.9818814, -0.04624431, 0.2124104, 1, 0, 0.9176471, 1,
0.9833554, -2.913355, 2.315881, 1, 0, 0.9137255, 1,
0.9852969, 0.2404414, 1.092028, 1, 0, 0.9058824, 1,
0.9853141, -0.8768865, 2.904092, 1, 0, 0.9019608, 1,
0.9890033, 0.7142571, -0.7881299, 1, 0, 0.8941177, 1,
0.9939106, -0.734096, 2.14189, 1, 0, 0.8862745, 1,
1.005136, 1.85585, -0.4532231, 1, 0, 0.8823529, 1,
1.005141, -0.3827883, 1.631425, 1, 0, 0.8745098, 1,
1.01052, 0.2503772, 0.8605396, 1, 0, 0.8705882, 1,
1.010698, 0.9035914, 2.584197, 1, 0, 0.8627451, 1,
1.011818, 1.750777, -1.348458, 1, 0, 0.8588235, 1,
1.012637, -0.4689202, 1.606537, 1, 0, 0.8509804, 1,
1.015833, 1.641616, 2.611364, 1, 0, 0.8470588, 1,
1.018688, -0.3892934, -1.478413, 1, 0, 0.8392157, 1,
1.021205, 0.7186241, 0.09621733, 1, 0, 0.8352941, 1,
1.023475, 0.03841984, 0.5813193, 1, 0, 0.827451, 1,
1.023869, -0.4550553, 1.985086, 1, 0, 0.8235294, 1,
1.030509, -2.090771, 1.332957, 1, 0, 0.8156863, 1,
1.042259, -0.05630502, 2.067173, 1, 0, 0.8117647, 1,
1.049512, -0.05474993, 1.701038, 1, 0, 0.8039216, 1,
1.05997, -0.5427458, 2.13805, 1, 0, 0.7960784, 1,
1.072524, -0.1986098, 1.967991, 1, 0, 0.7921569, 1,
1.085492, 1.589772, -1.308451, 1, 0, 0.7843137, 1,
1.089603, 0.8522251, 2.059875, 1, 0, 0.7803922, 1,
1.096155, -0.8890194, 2.019458, 1, 0, 0.772549, 1,
1.104421, -0.1784191, 1.950975, 1, 0, 0.7686275, 1,
1.106881, 1.012113, 0.9143299, 1, 0, 0.7607843, 1,
1.108299, -0.3563708, 1.061806, 1, 0, 0.7568628, 1,
1.115942, 2.212627, 0.03735017, 1, 0, 0.7490196, 1,
1.121554, 0.8011059, 1.394114, 1, 0, 0.7450981, 1,
1.122997, 0.2719118, 0.935744, 1, 0, 0.7372549, 1,
1.128159, 1.383408, -0.2866008, 1, 0, 0.7333333, 1,
1.140285, -0.5414423, 1.999828, 1, 0, 0.7254902, 1,
1.14074, 1.114459, 2.690849, 1, 0, 0.7215686, 1,
1.1512, -0.5590873, 3.431503, 1, 0, 0.7137255, 1,
1.154567, 0.6727101, 1.112164, 1, 0, 0.7098039, 1,
1.165272, -0.5321621, 1.212606, 1, 0, 0.7019608, 1,
1.169194, -0.3460633, 1.200293, 1, 0, 0.6941177, 1,
1.170169, 0.104741, 2.090415, 1, 0, 0.6901961, 1,
1.170482, -0.8253384, 1.423418, 1, 0, 0.682353, 1,
1.175356, -1.043634, 2.731227, 1, 0, 0.6784314, 1,
1.175861, -0.7418242, 3.736743, 1, 0, 0.6705883, 1,
1.197314, -0.8745967, 1.588007, 1, 0, 0.6666667, 1,
1.207663, -1.065183, 0.5227807, 1, 0, 0.6588235, 1,
1.219006, 1.039634, 1.279608, 1, 0, 0.654902, 1,
1.220699, -0.4593877, 2.923346, 1, 0, 0.6470588, 1,
1.223022, -1.137973, 2.485143, 1, 0, 0.6431373, 1,
1.224098, -1.141033, 1.015793, 1, 0, 0.6352941, 1,
1.225926, 0.1236398, 0.7618098, 1, 0, 0.6313726, 1,
1.235827, -0.2182586, 1.107989, 1, 0, 0.6235294, 1,
1.238385, 2.397782, 0.1518791, 1, 0, 0.6196079, 1,
1.244354, 0.8095763, 1.457943, 1, 0, 0.6117647, 1,
1.247345, -0.683781, 2.338412, 1, 0, 0.6078432, 1,
1.248393, -0.9074959, 3.140236, 1, 0, 0.6, 1,
1.253852, -0.07434642, 0.3675452, 1, 0, 0.5921569, 1,
1.256749, -0.6168101, 3.004196, 1, 0, 0.5882353, 1,
1.25979, -1.314378, 2.641399, 1, 0, 0.5803922, 1,
1.264294, 0.1720576, 2.274717, 1, 0, 0.5764706, 1,
1.264791, 0.4049887, 1.362432, 1, 0, 0.5686275, 1,
1.272293, 1.849134, 2.044793, 1, 0, 0.5647059, 1,
1.277114, -0.1943539, 0.2358361, 1, 0, 0.5568628, 1,
1.278714, -0.328594, 0.881793, 1, 0, 0.5529412, 1,
1.279654, 0.9199012, 1.245427, 1, 0, 0.5450981, 1,
1.28984, 0.2880381, 1.156925, 1, 0, 0.5411765, 1,
1.291418, 1.111946, 1.239346, 1, 0, 0.5333334, 1,
1.301595, -1.536788, 3.839163, 1, 0, 0.5294118, 1,
1.304832, -1.016482, 3.024634, 1, 0, 0.5215687, 1,
1.30596, 0.2918974, 1.72193, 1, 0, 0.5176471, 1,
1.32731, -0.3042895, 3.173029, 1, 0, 0.509804, 1,
1.336649, 0.4370781, 2.077418, 1, 0, 0.5058824, 1,
1.354456, 0.5512656, 1.662042, 1, 0, 0.4980392, 1,
1.356791, -0.5022233, 2.16761, 1, 0, 0.4901961, 1,
1.362067, -0.2165744, 1.627396, 1, 0, 0.4862745, 1,
1.364199, 0.3797382, -0.6479557, 1, 0, 0.4784314, 1,
1.368727, 0.2921271, 0.297803, 1, 0, 0.4745098, 1,
1.371281, 0.4884498, 1.812632, 1, 0, 0.4666667, 1,
1.381307, -0.3223382, 3.138877, 1, 0, 0.4627451, 1,
1.385172, -0.06046114, 0.9802079, 1, 0, 0.454902, 1,
1.393745, -0.3779356, 0.6943086, 1, 0, 0.4509804, 1,
1.40552, 0.504755, 0.3152218, 1, 0, 0.4431373, 1,
1.420281, -1.425917, 2.418888, 1, 0, 0.4392157, 1,
1.424219, -0.09394278, -0.9366544, 1, 0, 0.4313726, 1,
1.424675, -1.000084, 3.022459, 1, 0, 0.427451, 1,
1.431345, -0.3071096, 0.1565894, 1, 0, 0.4196078, 1,
1.439292, -0.1645028, 1.572101, 1, 0, 0.4156863, 1,
1.440402, -0.06533395, 0.3937629, 1, 0, 0.4078431, 1,
1.440556, -0.8667468, 4.015998, 1, 0, 0.4039216, 1,
1.445249, -0.129065, 2.56591, 1, 0, 0.3960784, 1,
1.459393, 2.326539, 0.000733368, 1, 0, 0.3882353, 1,
1.484994, -1.155569, -0.2194518, 1, 0, 0.3843137, 1,
1.492663, -1.278589, 2.551774, 1, 0, 0.3764706, 1,
1.50198, 0.1651132, -0.0256712, 1, 0, 0.372549, 1,
1.503387, 0.8327267, 2.085135, 1, 0, 0.3647059, 1,
1.509668, -1.36312, 1.547547, 1, 0, 0.3607843, 1,
1.520465, 0.6725199, 1.572385, 1, 0, 0.3529412, 1,
1.542713, -1.299888, 2.648139, 1, 0, 0.3490196, 1,
1.564129, -0.08258147, 3.243712, 1, 0, 0.3411765, 1,
1.567813, -0.6034914, 1.008531, 1, 0, 0.3372549, 1,
1.599371, -1.292351, 0.5926327, 1, 0, 0.3294118, 1,
1.603884, 0.6471332, 1.608365, 1, 0, 0.3254902, 1,
1.622822, -0.7776946, 2.185151, 1, 0, 0.3176471, 1,
1.623262, 1.059063, 0.268194, 1, 0, 0.3137255, 1,
1.627499, -0.8064172, 2.914064, 1, 0, 0.3058824, 1,
1.635584, 0.265284, 0.08391394, 1, 0, 0.2980392, 1,
1.639567, 0.8361161, 1.651436, 1, 0, 0.2941177, 1,
1.67132, 0.3931047, 2.004241, 1, 0, 0.2862745, 1,
1.678267, -2.042739, 2.949711, 1, 0, 0.282353, 1,
1.684151, 2.260232, 1.085354, 1, 0, 0.2745098, 1,
1.68427, -0.625531, 0.4723115, 1, 0, 0.2705882, 1,
1.688107, 1.845194, 1.608919, 1, 0, 0.2627451, 1,
1.689013, 0.05679973, -0.1122089, 1, 0, 0.2588235, 1,
1.699646, 0.03694167, 1.403675, 1, 0, 0.2509804, 1,
1.714156, 1.194118, 0.9178314, 1, 0, 0.2470588, 1,
1.715012, -1.592163, 4.451265, 1, 0, 0.2392157, 1,
1.723355, 0.0287741, 1.975051, 1, 0, 0.2352941, 1,
1.740917, -1.751124, 1.424294, 1, 0, 0.227451, 1,
1.750489, 0.1756576, 0.4812855, 1, 0, 0.2235294, 1,
1.75568, 0.3186466, 1.223806, 1, 0, 0.2156863, 1,
1.76061, -0.5679516, 1.481995, 1, 0, 0.2117647, 1,
1.760754, -0.1939507, 3.779044, 1, 0, 0.2039216, 1,
1.764143, -0.4538393, 1.561454, 1, 0, 0.1960784, 1,
1.76529, 0.7102607, 0.6334379, 1, 0, 0.1921569, 1,
1.795384, 0.2943463, 1.583196, 1, 0, 0.1843137, 1,
1.806466, 0.2738373, 2.157699, 1, 0, 0.1803922, 1,
1.825073, 0.727031, 1.239433, 1, 0, 0.172549, 1,
1.879477, -1.281722, 2.928483, 1, 0, 0.1686275, 1,
1.898477, 0.9070585, 1.453599, 1, 0, 0.1607843, 1,
1.905334, -1.062412, 3.001147, 1, 0, 0.1568628, 1,
1.910246, 0.6057982, 1.861815, 1, 0, 0.1490196, 1,
1.969361, -1.307197, 2.307918, 1, 0, 0.145098, 1,
2.009343, -0.0885921, 1.687606, 1, 0, 0.1372549, 1,
2.030333, -0.8532433, 2.678448, 1, 0, 0.1333333, 1,
2.056119, -0.9481674, 0.06317215, 1, 0, 0.1254902, 1,
2.063823, -0.3005153, 1.968566, 1, 0, 0.1215686, 1,
2.101516, 1.569243, -0.6569195, 1, 0, 0.1137255, 1,
2.112274, -0.114349, 1.806493, 1, 0, 0.1098039, 1,
2.124888, -0.9875458, 3.073554, 1, 0, 0.1019608, 1,
2.270491, 1.227593, 1.270337, 1, 0, 0.09411765, 1,
2.30153, -0.4333128, 1.408372, 1, 0, 0.09019608, 1,
2.331789, 0.6968558, 1.998788, 1, 0, 0.08235294, 1,
2.344127, 0.4457428, 0.7696909, 1, 0, 0.07843138, 1,
2.354979, -0.06643839, 2.251195, 1, 0, 0.07058824, 1,
2.399617, -0.8516535, 4.021186, 1, 0, 0.06666667, 1,
2.41633, -0.005782104, 1.40366, 1, 0, 0.05882353, 1,
2.426777, -1.392306, 3.201563, 1, 0, 0.05490196, 1,
2.52246, -0.3031631, 2.676741, 1, 0, 0.04705882, 1,
2.539956, -0.4164166, 3.150625, 1, 0, 0.04313726, 1,
2.543371, -0.05294173, 0.119331, 1, 0, 0.03529412, 1,
2.557097, 2.071933, 2.100316, 1, 0, 0.03137255, 1,
2.705368, 0.04792773, 2.812003, 1, 0, 0.02352941, 1,
2.733218, -1.586549, 2.924319, 1, 0, 0.01960784, 1,
3.181353, 1.120609, 0.7469608, 1, 0, 0.01176471, 1,
3.561407, -0.8891912, 2.772525, 1, 0, 0.007843138, 1
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
-0.1638665, -4.550496, -7.378103, 0, -0.5, 0.5, 0.5,
-0.1638665, -4.550496, -7.378103, 1, -0.5, 0.5, 0.5,
-0.1638665, -4.550496, -7.378103, 1, 1.5, 0.5, 0.5,
-0.1638665, -4.550496, -7.378103, 0, 1.5, 0.5, 0.5
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
-5.152008, -0.1568112, -7.378103, 0, -0.5, 0.5, 0.5,
-5.152008, -0.1568112, -7.378103, 1, -0.5, 0.5, 0.5,
-5.152008, -0.1568112, -7.378103, 1, 1.5, 0.5, 0.5,
-5.152008, -0.1568112, -7.378103, 0, 1.5, 0.5, 0.5
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
-5.152008, -4.550496, -0.04055858, 0, -0.5, 0.5, 0.5,
-5.152008, -4.550496, -0.04055858, 1, -0.5, 0.5, 0.5,
-5.152008, -4.550496, -0.04055858, 1, 1.5, 0.5, 0.5,
-5.152008, -4.550496, -0.04055858, 0, 1.5, 0.5, 0.5
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
-2, -3.536569, -5.684824,
2, -3.536569, -5.684824,
-2, -3.536569, -5.684824,
-2, -3.705557, -5.967037,
0, -3.536569, -5.684824,
0, -3.705557, -5.967037,
2, -3.536569, -5.684824,
2, -3.705557, -5.967037
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
"0",
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
-2, -4.043533, -6.531464, 0, -0.5, 0.5, 0.5,
-2, -4.043533, -6.531464, 1, -0.5, 0.5, 0.5,
-2, -4.043533, -6.531464, 1, 1.5, 0.5, 0.5,
-2, -4.043533, -6.531464, 0, 1.5, 0.5, 0.5,
0, -4.043533, -6.531464, 0, -0.5, 0.5, 0.5,
0, -4.043533, -6.531464, 1, -0.5, 0.5, 0.5,
0, -4.043533, -6.531464, 1, 1.5, 0.5, 0.5,
0, -4.043533, -6.531464, 0, 1.5, 0.5, 0.5,
2, -4.043533, -6.531464, 0, -0.5, 0.5, 0.5,
2, -4.043533, -6.531464, 1, -0.5, 0.5, 0.5,
2, -4.043533, -6.531464, 1, 1.5, 0.5, 0.5,
2, -4.043533, -6.531464, 0, 1.5, 0.5, 0.5
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
-4.000898, -3, -5.684824,
-4.000898, 3, -5.684824,
-4.000898, -3, -5.684824,
-4.19275, -3, -5.967037,
-4.000898, -2, -5.684824,
-4.19275, -2, -5.967037,
-4.000898, -1, -5.684824,
-4.19275, -1, -5.967037,
-4.000898, 0, -5.684824,
-4.19275, 0, -5.967037,
-4.000898, 1, -5.684824,
-4.19275, 1, -5.967037,
-4.000898, 2, -5.684824,
-4.19275, 2, -5.967037,
-4.000898, 3, -5.684824,
-4.19275, 3, -5.967037
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
-4.576453, -3, -6.531464, 0, -0.5, 0.5, 0.5,
-4.576453, -3, -6.531464, 1, -0.5, 0.5, 0.5,
-4.576453, -3, -6.531464, 1, 1.5, 0.5, 0.5,
-4.576453, -3, -6.531464, 0, 1.5, 0.5, 0.5,
-4.576453, -2, -6.531464, 0, -0.5, 0.5, 0.5,
-4.576453, -2, -6.531464, 1, -0.5, 0.5, 0.5,
-4.576453, -2, -6.531464, 1, 1.5, 0.5, 0.5,
-4.576453, -2, -6.531464, 0, 1.5, 0.5, 0.5,
-4.576453, -1, -6.531464, 0, -0.5, 0.5, 0.5,
-4.576453, -1, -6.531464, 1, -0.5, 0.5, 0.5,
-4.576453, -1, -6.531464, 1, 1.5, 0.5, 0.5,
-4.576453, -1, -6.531464, 0, 1.5, 0.5, 0.5,
-4.576453, 0, -6.531464, 0, -0.5, 0.5, 0.5,
-4.576453, 0, -6.531464, 1, -0.5, 0.5, 0.5,
-4.576453, 0, -6.531464, 1, 1.5, 0.5, 0.5,
-4.576453, 0, -6.531464, 0, 1.5, 0.5, 0.5,
-4.576453, 1, -6.531464, 0, -0.5, 0.5, 0.5,
-4.576453, 1, -6.531464, 1, -0.5, 0.5, 0.5,
-4.576453, 1, -6.531464, 1, 1.5, 0.5, 0.5,
-4.576453, 1, -6.531464, 0, 1.5, 0.5, 0.5,
-4.576453, 2, -6.531464, 0, -0.5, 0.5, 0.5,
-4.576453, 2, -6.531464, 1, -0.5, 0.5, 0.5,
-4.576453, 2, -6.531464, 1, 1.5, 0.5, 0.5,
-4.576453, 2, -6.531464, 0, 1.5, 0.5, 0.5,
-4.576453, 3, -6.531464, 0, -0.5, 0.5, 0.5,
-4.576453, 3, -6.531464, 1, -0.5, 0.5, 0.5,
-4.576453, 3, -6.531464, 1, 1.5, 0.5, 0.5,
-4.576453, 3, -6.531464, 0, 1.5, 0.5, 0.5
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
-4.000898, -3.536569, -4,
-4.000898, -3.536569, 4,
-4.000898, -3.536569, -4,
-4.19275, -3.705557, -4,
-4.000898, -3.536569, -2,
-4.19275, -3.705557, -2,
-4.000898, -3.536569, 0,
-4.19275, -3.705557, 0,
-4.000898, -3.536569, 2,
-4.19275, -3.705557, 2,
-4.000898, -3.536569, 4,
-4.19275, -3.705557, 4
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
-4.576453, -4.043533, -4, 0, -0.5, 0.5, 0.5,
-4.576453, -4.043533, -4, 1, -0.5, 0.5, 0.5,
-4.576453, -4.043533, -4, 1, 1.5, 0.5, 0.5,
-4.576453, -4.043533, -4, 0, 1.5, 0.5, 0.5,
-4.576453, -4.043533, -2, 0, -0.5, 0.5, 0.5,
-4.576453, -4.043533, -2, 1, -0.5, 0.5, 0.5,
-4.576453, -4.043533, -2, 1, 1.5, 0.5, 0.5,
-4.576453, -4.043533, -2, 0, 1.5, 0.5, 0.5,
-4.576453, -4.043533, 0, 0, -0.5, 0.5, 0.5,
-4.576453, -4.043533, 0, 1, -0.5, 0.5, 0.5,
-4.576453, -4.043533, 0, 1, 1.5, 0.5, 0.5,
-4.576453, -4.043533, 0, 0, 1.5, 0.5, 0.5,
-4.576453, -4.043533, 2, 0, -0.5, 0.5, 0.5,
-4.576453, -4.043533, 2, 1, -0.5, 0.5, 0.5,
-4.576453, -4.043533, 2, 1, 1.5, 0.5, 0.5,
-4.576453, -4.043533, 2, 0, 1.5, 0.5, 0.5,
-4.576453, -4.043533, 4, 0, -0.5, 0.5, 0.5,
-4.576453, -4.043533, 4, 1, -0.5, 0.5, 0.5,
-4.576453, -4.043533, 4, 1, 1.5, 0.5, 0.5,
-4.576453, -4.043533, 4, 0, 1.5, 0.5, 0.5
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
-4.000898, -3.536569, -5.684824,
-4.000898, 3.222946, -5.684824,
-4.000898, -3.536569, 5.603707,
-4.000898, 3.222946, 5.603707,
-4.000898, -3.536569, -5.684824,
-4.000898, -3.536569, 5.603707,
-4.000898, 3.222946, -5.684824,
-4.000898, 3.222946, 5.603707,
-4.000898, -3.536569, -5.684824,
3.673165, -3.536569, -5.684824,
-4.000898, -3.536569, 5.603707,
3.673165, -3.536569, 5.603707,
-4.000898, 3.222946, -5.684824,
3.673165, 3.222946, -5.684824,
-4.000898, 3.222946, 5.603707,
3.673165, 3.222946, 5.603707,
3.673165, -3.536569, -5.684824,
3.673165, 3.222946, -5.684824,
3.673165, -3.536569, 5.603707,
3.673165, 3.222946, 5.603707,
3.673165, -3.536569, -5.684824,
3.673165, -3.536569, 5.603707,
3.673165, 3.222946, -5.684824,
3.673165, 3.222946, 5.603707
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
var radius = 8.133582;
var distance = 36.18723;
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
mvMatrix.translate( 0.1638665, 0.1568112, 0.04055858 );
mvMatrix.scale( 1.145962, 1.301009, 0.7790374 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.18723);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
mefenacet<-read.table("mefenacet.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mefenacet$V2
```

```
## Error in eval(expr, envir, enclos): object 'mefenacet' not found
```

```r
y<-mefenacet$V3
```

```
## Error in eval(expr, envir, enclos): object 'mefenacet' not found
```

```r
z<-mefenacet$V4
```

```
## Error in eval(expr, envir, enclos): object 'mefenacet' not found
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
-3.88914, 1.273196, -1.103865, 0, 0, 1, 1, 1,
-3.036935, 0.1481228, -1.216793, 1, 0, 0, 1, 1,
-2.812603, 1.412922, -2.976772, 1, 0, 0, 1, 1,
-2.568906, 0.3358521, -1.459733, 1, 0, 0, 1, 1,
-2.536382, 0.1187708, -0.8271395, 1, 0, 0, 1, 1,
-2.429415, -1.474335, -3.862595, 1, 0, 0, 1, 1,
-2.428934, -1.067136, -2.259544, 0, 0, 0, 1, 1,
-2.386135, -1.878723, -2.600851, 0, 0, 0, 1, 1,
-2.349921, 0.05962471, -2.317325, 0, 0, 0, 1, 1,
-2.303476, 1.194819, -1.197286, 0, 0, 0, 1, 1,
-2.270433, -1.412199, -4.156435, 0, 0, 0, 1, 1,
-2.248746, 0.1515469, -1.645911, 0, 0, 0, 1, 1,
-2.187476, -1.320734, -2.819059, 0, 0, 0, 1, 1,
-2.123646, 0.6331403, -0.898901, 1, 1, 1, 1, 1,
-2.109801, -0.4210559, -1.953326, 1, 1, 1, 1, 1,
-2.099048, 0.9309533, 1.080255, 1, 1, 1, 1, 1,
-2.076365, -0.1939936, -2.740971, 1, 1, 1, 1, 1,
-2.034029, -0.539496, -3.133961, 1, 1, 1, 1, 1,
-2.031094, -0.532023, -2.393274, 1, 1, 1, 1, 1,
-2.019001, -0.6575317, -4.021656, 1, 1, 1, 1, 1,
-2.011999, 1.168296, -0.4572872, 1, 1, 1, 1, 1,
-1.982173, -1.613797, -2.495199, 1, 1, 1, 1, 1,
-1.97405, -0.1125402, -1.004509, 1, 1, 1, 1, 1,
-1.946795, -1.561236, -2.596195, 1, 1, 1, 1, 1,
-1.926702, 0.4803925, -1.827703, 1, 1, 1, 1, 1,
-1.863414, -0.1126756, -1.165513, 1, 1, 1, 1, 1,
-1.861077, 0.8812023, -1.145834, 1, 1, 1, 1, 1,
-1.85278, -0.4361095, -3.374547, 1, 1, 1, 1, 1,
-1.819871, -0.5951146, -0.904367, 0, 0, 1, 1, 1,
-1.78595, -0.203503, -1.855715, 1, 0, 0, 1, 1,
-1.780925, -1.621999, -3.208326, 1, 0, 0, 1, 1,
-1.778613, -0.05482393, -0.8106002, 1, 0, 0, 1, 1,
-1.768974, -0.2585692, -0.3882207, 1, 0, 0, 1, 1,
-1.758544, 0.1841321, -1.953496, 1, 0, 0, 1, 1,
-1.754594, 2.020943, -2.120926, 0, 0, 0, 1, 1,
-1.698272, 0.5672707, -1.498548, 0, 0, 0, 1, 1,
-1.697449, 0.05694664, -0.6067068, 0, 0, 0, 1, 1,
-1.697071, -0.3409894, -2.569827, 0, 0, 0, 1, 1,
-1.689576, -1.162505, -2.230892, 0, 0, 0, 1, 1,
-1.681423, -0.1097247, -0.1492296, 0, 0, 0, 1, 1,
-1.669344, 0.1350479, -3.694516, 0, 0, 0, 1, 1,
-1.663585, 0.07300887, -0.03308333, 1, 1, 1, 1, 1,
-1.656489, -0.7493823, -1.089984, 1, 1, 1, 1, 1,
-1.639832, 2.410637, -0.9068795, 1, 1, 1, 1, 1,
-1.618323, -0.180221, -3.349783, 1, 1, 1, 1, 1,
-1.616959, 0.4471144, -2.039198, 1, 1, 1, 1, 1,
-1.607279, 0.3482334, 0.6728877, 1, 1, 1, 1, 1,
-1.592105, 0.6027899, -0.3418606, 1, 1, 1, 1, 1,
-1.575873, -1.078202, -2.142007, 1, 1, 1, 1, 1,
-1.569933, -1.157367, -0.8574882, 1, 1, 1, 1, 1,
-1.56529, 1.320517, -1.838167, 1, 1, 1, 1, 1,
-1.559452, -0.4925639, -1.079207, 1, 1, 1, 1, 1,
-1.554183, -1.213591, -2.528087, 1, 1, 1, 1, 1,
-1.546676, 0.8533798, 0.4007729, 1, 1, 1, 1, 1,
-1.537525, 1.84886, -3.326105, 1, 1, 1, 1, 1,
-1.52268, -1.820942, -3.010048, 1, 1, 1, 1, 1,
-1.52081, -1.171449, -4.048192, 0, 0, 1, 1, 1,
-1.513791, 0.8731909, -1.481384, 1, 0, 0, 1, 1,
-1.501775, 1.155167, -1.114711, 1, 0, 0, 1, 1,
-1.497351, 1.342878, -2.548107, 1, 0, 0, 1, 1,
-1.486382, -0.5879251, -0.7100041, 1, 0, 0, 1, 1,
-1.48377, -0.7229776, -1.708795, 1, 0, 0, 1, 1,
-1.475391, 1.428247, -0.4694681, 0, 0, 0, 1, 1,
-1.474397, -0.957102, -0.2516182, 0, 0, 0, 1, 1,
-1.472932, -0.8878612, -2.481739, 0, 0, 0, 1, 1,
-1.466142, 1.569047, -0.8584979, 0, 0, 0, 1, 1,
-1.461979, -1.051056, -2.104964, 0, 0, 0, 1, 1,
-1.458661, -0.2315711, -1.884413, 0, 0, 0, 1, 1,
-1.455941, 2.239852, -0.4279501, 0, 0, 0, 1, 1,
-1.442165, -0.5931413, -3.348924, 1, 1, 1, 1, 1,
-1.441362, -0.1578188, -1.52216, 1, 1, 1, 1, 1,
-1.440727, 1.08406, -0.4134697, 1, 1, 1, 1, 1,
-1.435091, -0.8738818, -1.114682, 1, 1, 1, 1, 1,
-1.428837, -1.431068, -2.113194, 1, 1, 1, 1, 1,
-1.426701, 0.3478343, -1.775871, 1, 1, 1, 1, 1,
-1.424714, -0.74967, -2.195955, 1, 1, 1, 1, 1,
-1.421842, -1.071585, -0.2092314, 1, 1, 1, 1, 1,
-1.420344, 0.9212162, 0.7617426, 1, 1, 1, 1, 1,
-1.406997, -0.6236104, -2.068502, 1, 1, 1, 1, 1,
-1.398247, 1.06088, -2.338522, 1, 1, 1, 1, 1,
-1.393951, -0.619906, -0.4327119, 1, 1, 1, 1, 1,
-1.385377, -1.390528, -0.3957375, 1, 1, 1, 1, 1,
-1.370564, -0.03377367, -2.01262, 1, 1, 1, 1, 1,
-1.368698, -0.841198, -2.293138, 1, 1, 1, 1, 1,
-1.348186, 1.421113, -1.062029, 0, 0, 1, 1, 1,
-1.34526, -2.478715, -1.573974, 1, 0, 0, 1, 1,
-1.333947, -0.07315542, -0.7924713, 1, 0, 0, 1, 1,
-1.333434, 1.5029, -1.582578, 1, 0, 0, 1, 1,
-1.322424, -0.3766679, -2.322435, 1, 0, 0, 1, 1,
-1.312134, -0.1538699, -2.027915, 1, 0, 0, 1, 1,
-1.308756, 1.200482, 0.5750669, 0, 0, 0, 1, 1,
-1.306211, 0.5406101, 0.3825287, 0, 0, 0, 1, 1,
-1.298522, 0.2684918, -0.7619376, 0, 0, 0, 1, 1,
-1.29551, -1.070412, -1.928446, 0, 0, 0, 1, 1,
-1.295144, -0.4985601, -1.980214, 0, 0, 0, 1, 1,
-1.293839, -0.832033, -2.437198, 0, 0, 0, 1, 1,
-1.292062, -0.2147727, -1.991827, 0, 0, 0, 1, 1,
-1.291003, 1.033942, -1.204093, 1, 1, 1, 1, 1,
-1.282716, -0.8677946, -2.710683, 1, 1, 1, 1, 1,
-1.276281, -0.6923963, -1.951247, 1, 1, 1, 1, 1,
-1.270438, 1.64617, -1.241189, 1, 1, 1, 1, 1,
-1.268953, -1.159656, -2.425791, 1, 1, 1, 1, 1,
-1.268811, 2.316309, -0.5897323, 1, 1, 1, 1, 1,
-1.26349, -0.1143735, -0.6461898, 1, 1, 1, 1, 1,
-1.255122, -0.9682291, -1.514497, 1, 1, 1, 1, 1,
-1.243779, 0.2637819, -3.83657, 1, 1, 1, 1, 1,
-1.239734, -0.7086221, -2.539501, 1, 1, 1, 1, 1,
-1.232683, -1.198028, -1.958118, 1, 1, 1, 1, 1,
-1.223249, 0.9403194, -0.5139018, 1, 1, 1, 1, 1,
-1.220891, -0.2982782, -2.150403, 1, 1, 1, 1, 1,
-1.218894, 2.382485, 0.1653764, 1, 1, 1, 1, 1,
-1.21654, 0.7104383, -0.722995, 1, 1, 1, 1, 1,
-1.21544, -0.4242639, -2.544472, 0, 0, 1, 1, 1,
-1.214207, 0.1225373, -0.7392419, 1, 0, 0, 1, 1,
-1.211527, 0.6607798, -0.7000731, 1, 0, 0, 1, 1,
-1.209423, -0.9605529, -1.962312, 1, 0, 0, 1, 1,
-1.207484, 0.1945832, 0.5784171, 1, 0, 0, 1, 1,
-1.207024, -0.9081497, -2.401609, 1, 0, 0, 1, 1,
-1.205833, -1.245219, -1.773308, 0, 0, 0, 1, 1,
-1.196972, 0.5749801, -0.7197548, 0, 0, 0, 1, 1,
-1.191819, -0.3261278, -0.3833398, 0, 0, 0, 1, 1,
-1.189353, -0.3860184, -2.74038, 0, 0, 0, 1, 1,
-1.178568, 0.612169, -0.8062368, 0, 0, 0, 1, 1,
-1.176238, 0.5769715, -0.858845, 0, 0, 0, 1, 1,
-1.172944, -0.5279461, -2.345236, 0, 0, 0, 1, 1,
-1.161994, 0.7859101, -2.215472, 1, 1, 1, 1, 1,
-1.158845, 0.03682128, -2.159529, 1, 1, 1, 1, 1,
-1.158644, 0.5120203, -0.9167182, 1, 1, 1, 1, 1,
-1.157233, -0.5382064, -1.146813, 1, 1, 1, 1, 1,
-1.151532, -0.6142451, -1.498969, 1, 1, 1, 1, 1,
-1.150765, 0.4525462, -0.5394638, 1, 1, 1, 1, 1,
-1.144106, 1.227854, -1.550442, 1, 1, 1, 1, 1,
-1.130236, -0.8147538, -1.113007, 1, 1, 1, 1, 1,
-1.125807, -0.3750921, -1.564387, 1, 1, 1, 1, 1,
-1.125001, -0.630389, -1.215012, 1, 1, 1, 1, 1,
-1.12135, 0.6595082, -2.521224, 1, 1, 1, 1, 1,
-1.118126, -0.9703355, -1.64192, 1, 1, 1, 1, 1,
-1.099744, -0.09015054, -2.939766, 1, 1, 1, 1, 1,
-1.097673, -0.7820778, -4.062994, 1, 1, 1, 1, 1,
-1.07454, 0.1610434, -1.675806, 1, 1, 1, 1, 1,
-1.073222, -0.6415033, -0.1358264, 0, 0, 1, 1, 1,
-1.072289, 0.5870168, -1.03995, 1, 0, 0, 1, 1,
-1.066842, 1.014893, -1.342307, 1, 0, 0, 1, 1,
-1.065342, 1.175881, -0.9611376, 1, 0, 0, 1, 1,
-1.06529, -0.1241016, -2.927786, 1, 0, 0, 1, 1,
-1.064156, 0.1248666, -0.8896499, 1, 0, 0, 1, 1,
-1.053797, 0.5024868, -0.613833, 0, 0, 0, 1, 1,
-1.049478, 0.8451074, -0.1642729, 0, 0, 0, 1, 1,
-1.047093, 0.0640076, -1.132231, 0, 0, 0, 1, 1,
-1.037369, 0.5796522, -1.54875, 0, 0, 0, 1, 1,
-1.031677, 0.9779083, -1.033529, 0, 0, 0, 1, 1,
-1.030576, 1.560851, 0.9956965, 0, 0, 0, 1, 1,
-1.025491, -0.351531, -2.245152, 0, 0, 0, 1, 1,
-1.019742, 0.3560205, -0.8536353, 1, 1, 1, 1, 1,
-1.015415, -1.5143, -3.929279, 1, 1, 1, 1, 1,
-1.010526, -1.31903, -2.986223, 1, 1, 1, 1, 1,
-1.009903, 0.08611102, -1.362873, 1, 1, 1, 1, 1,
-0.9988604, 0.06012814, -1.348963, 1, 1, 1, 1, 1,
-0.9985421, -0.2127968, -2.531985, 1, 1, 1, 1, 1,
-0.9918454, 1.448897, -1.678637, 1, 1, 1, 1, 1,
-0.9904891, -0.673092, -1.428309, 1, 1, 1, 1, 1,
-0.988604, -0.733227, -2.752583, 1, 1, 1, 1, 1,
-0.9858786, 0.8314683, -1.129461, 1, 1, 1, 1, 1,
-0.9790471, -2.583809, -4.632984, 1, 1, 1, 1, 1,
-0.9743267, -0.07620548, -0.6892025, 1, 1, 1, 1, 1,
-0.9714666, 0.9344747, -1.48958, 1, 1, 1, 1, 1,
-0.9552492, -0.2458492, -0.5544531, 1, 1, 1, 1, 1,
-0.9481142, 1.491889, -0.4819452, 1, 1, 1, 1, 1,
-0.9475436, -0.0860498, -1.803017, 0, 0, 1, 1, 1,
-0.9471385, 0.4063715, -0.410975, 1, 0, 0, 1, 1,
-0.9416746, 0.9156189, -0.4454617, 1, 0, 0, 1, 1,
-0.9413642, 0.6711379, -0.4958753, 1, 0, 0, 1, 1,
-0.9355131, -0.3843839, -2.374745, 1, 0, 0, 1, 1,
-0.9293773, -0.8579533, -1.630438, 1, 0, 0, 1, 1,
-0.9257281, -0.03902996, -1.632235, 0, 0, 0, 1, 1,
-0.9160708, -1.760984, -2.288753, 0, 0, 0, 1, 1,
-0.9148058, -0.5203694, -2.269165, 0, 0, 0, 1, 1,
-0.9135665, -0.5630081, -2.313948, 0, 0, 0, 1, 1,
-0.9104449, -0.8731305, -3.426397, 0, 0, 0, 1, 1,
-0.9089458, -0.8691682, -1.623371, 0, 0, 0, 1, 1,
-0.906594, -1.460533, -4.44189, 0, 0, 0, 1, 1,
-0.9056318, -1.170428, -1.67202, 1, 1, 1, 1, 1,
-0.8927354, 0.5807844, -1.098551, 1, 1, 1, 1, 1,
-0.8917335, 0.1336994, -1.2159, 1, 1, 1, 1, 1,
-0.8903443, -0.02558841, -0.7197134, 1, 1, 1, 1, 1,
-0.8857535, -1.58238, -1.786719, 1, 1, 1, 1, 1,
-0.8734689, -0.5734561, -2.064377, 1, 1, 1, 1, 1,
-0.8655159, 0.05818022, -3.331615, 1, 1, 1, 1, 1,
-0.858088, -0.4921437, -1.915672, 1, 1, 1, 1, 1,
-0.8454111, 1.175401, 0.769417, 1, 1, 1, 1, 1,
-0.8441486, 0.8032176, -1.973012, 1, 1, 1, 1, 1,
-0.834018, 0.1548675, -2.074033, 1, 1, 1, 1, 1,
-0.8328586, -0.361703, -1.563563, 1, 1, 1, 1, 1,
-0.8289195, -0.7815297, -1.842669, 1, 1, 1, 1, 1,
-0.8266013, 0.9853122, -0.1319676, 1, 1, 1, 1, 1,
-0.8207548, -1.157713, -2.313339, 1, 1, 1, 1, 1,
-0.8197901, -1.386454, -3.898105, 0, 0, 1, 1, 1,
-0.8185005, -0.164712, -2.303716, 1, 0, 0, 1, 1,
-0.817172, 0.2129066, -1.071349, 1, 0, 0, 1, 1,
-0.8160307, -2.87534, -2.312911, 1, 0, 0, 1, 1,
-0.8099462, 0.3882968, -2.030413, 1, 0, 0, 1, 1,
-0.8043289, -0.2557286, -2.515714, 1, 0, 0, 1, 1,
-0.8028802, -0.4837254, -2.920566, 0, 0, 0, 1, 1,
-0.79381, -1.439656, -0.8006775, 0, 0, 0, 1, 1,
-0.7911078, 0.0421731, -3.078564, 0, 0, 0, 1, 1,
-0.7888721, -0.4179703, -1.634794, 0, 0, 0, 1, 1,
-0.7877557, 0.1616275, -0.54597, 0, 0, 0, 1, 1,
-0.782648, 0.1898232, -1.791388, 0, 0, 0, 1, 1,
-0.7822005, -0.5553929, -2.925032, 0, 0, 0, 1, 1,
-0.7806958, -2.742604, -3.85915, 1, 1, 1, 1, 1,
-0.779601, -0.3892196, -2.461681, 1, 1, 1, 1, 1,
-0.7782074, -1.451657, -2.630393, 1, 1, 1, 1, 1,
-0.7765707, -0.1951701, -2.07032, 1, 1, 1, 1, 1,
-0.7758964, -0.03425575, -0.9566695, 1, 1, 1, 1, 1,
-0.7741859, -0.5837979, -1.171167, 1, 1, 1, 1, 1,
-0.7678012, -1.401537, -1.909857, 1, 1, 1, 1, 1,
-0.7626664, 0.8201021, -1.354717, 1, 1, 1, 1, 1,
-0.7572904, 1.116637, -1.699086, 1, 1, 1, 1, 1,
-0.7504346, -0.7021133, -3.895476, 1, 1, 1, 1, 1,
-0.7426723, -0.9662035, -2.418584, 1, 1, 1, 1, 1,
-0.7360378, 0.02502583, -2.097289, 1, 1, 1, 1, 1,
-0.7352827, 1.261782, -3.121043, 1, 1, 1, 1, 1,
-0.7251676, 0.7806982, -0.04518462, 1, 1, 1, 1, 1,
-0.7205034, 0.4674481, -1.285902, 1, 1, 1, 1, 1,
-0.7145098, 1.678705, -0.1441843, 0, 0, 1, 1, 1,
-0.7081358, -0.8875466, -2.851002, 1, 0, 0, 1, 1,
-0.7038914, -1.392505, -1.682738, 1, 0, 0, 1, 1,
-0.7028008, -1.117784, -0.3523723, 1, 0, 0, 1, 1,
-0.7018278, 0.8070412, -0.7058479, 1, 0, 0, 1, 1,
-0.7015638, 0.5429024, -0.6172712, 1, 0, 0, 1, 1,
-0.6986987, 0.1061954, -1.465181, 0, 0, 0, 1, 1,
-0.6961225, 1.561789, -0.111319, 0, 0, 0, 1, 1,
-0.6944077, -1.870098, -1.346873, 0, 0, 0, 1, 1,
-0.693569, -2.069936, -2.2572, 0, 0, 0, 1, 1,
-0.6905258, 0.3562759, 0.06605139, 0, 0, 0, 1, 1,
-0.6880053, 0.8354325, -1.624492, 0, 0, 0, 1, 1,
-0.6846344, -0.8803381, -1.299045, 0, 0, 0, 1, 1,
-0.6845077, -2.046425, -1.457909, 1, 1, 1, 1, 1,
-0.6782765, 1.108132, 0.7973149, 1, 1, 1, 1, 1,
-0.6760148, 1.572901, -0.8192319, 1, 1, 1, 1, 1,
-0.6747409, -1.344504, -3.426727, 1, 1, 1, 1, 1,
-0.6660693, 0.7088593, -0.7555907, 1, 1, 1, 1, 1,
-0.6649399, -0.3573713, -2.779802, 1, 1, 1, 1, 1,
-0.6592932, -0.03825337, -1.135068, 1, 1, 1, 1, 1,
-0.6563032, -0.8045348, -1.466938, 1, 1, 1, 1, 1,
-0.6561475, 1.435234, -1.851984, 1, 1, 1, 1, 1,
-0.653356, -0.3398181, -1.430713, 1, 1, 1, 1, 1,
-0.6492759, 1.17442, 0.328115, 1, 1, 1, 1, 1,
-0.6418905, -0.3176447, -2.813623, 1, 1, 1, 1, 1,
-0.6414467, -0.2136482, -1.679203, 1, 1, 1, 1, 1,
-0.6414167, 0.5839899, -0.4762245, 1, 1, 1, 1, 1,
-0.636454, 0.06182225, -1.44067, 1, 1, 1, 1, 1,
-0.6363699, -0.3687899, -1.846889, 0, 0, 1, 1, 1,
-0.6351745, 0.2816413, -0.7670914, 1, 0, 0, 1, 1,
-0.6307763, -0.9219397, -2.995399, 1, 0, 0, 1, 1,
-0.6307539, 0.3591282, 0.7710607, 1, 0, 0, 1, 1,
-0.6275963, -1.895116, -2.877022, 1, 0, 0, 1, 1,
-0.6253209, -1.156204, -1.557726, 1, 0, 0, 1, 1,
-0.6246184, 0.9584062, -0.6930601, 0, 0, 0, 1, 1,
-0.6222391, -0.7993204, -1.936113, 0, 0, 0, 1, 1,
-0.6201299, -0.8079565, -3.130269, 0, 0, 0, 1, 1,
-0.6200731, -0.5407587, -1.26178, 0, 0, 0, 1, 1,
-0.6184989, -1.31116, -2.946848, 0, 0, 0, 1, 1,
-0.6138322, -0.805096, -3.489228, 0, 0, 0, 1, 1,
-0.6114141, 0.3184477, -1.757761, 0, 0, 0, 1, 1,
-0.6112897, 0.4009715, -1.823069, 1, 1, 1, 1, 1,
-0.6034347, -1.986386, -2.928975, 1, 1, 1, 1, 1,
-0.6030839, 0.1367872, -0.6127948, 1, 1, 1, 1, 1,
-0.601781, -1.881779, -2.467238, 1, 1, 1, 1, 1,
-0.6007729, 0.7745575, -1.944518, 1, 1, 1, 1, 1,
-0.5908699, 0.7227363, -1.226031, 1, 1, 1, 1, 1,
-0.589984, -0.2142734, -1.321708, 1, 1, 1, 1, 1,
-0.5871068, -0.1244869, -1.487797, 1, 1, 1, 1, 1,
-0.585359, -2.408819, -1.307117, 1, 1, 1, 1, 1,
-0.5846385, 0.1768424, -1.805188, 1, 1, 1, 1, 1,
-0.5764549, -1.857627, -3.543278, 1, 1, 1, 1, 1,
-0.5717813, -0.3735595, -3.150528, 1, 1, 1, 1, 1,
-0.5697215, -0.9775117, -2.136879, 1, 1, 1, 1, 1,
-0.564047, -0.4115567, -1.891425, 1, 1, 1, 1, 1,
-0.5573074, -0.571254, -3.089689, 1, 1, 1, 1, 1,
-0.5552242, 0.2406516, -0.7829523, 0, 0, 1, 1, 1,
-0.5522143, -0.9226266, -4.857301, 1, 0, 0, 1, 1,
-0.5518268, -1.019372, -2.075708, 1, 0, 0, 1, 1,
-0.5435972, 0.1290383, -1.195662, 1, 0, 0, 1, 1,
-0.5434693, -0.8003278, -1.084424, 1, 0, 0, 1, 1,
-0.5425119, -0.4331435, -2.129232, 1, 0, 0, 1, 1,
-0.5398018, 1.075519, -3.537951, 0, 0, 0, 1, 1,
-0.5389386, -0.2670392, -1.707837, 0, 0, 0, 1, 1,
-0.5357111, -0.4800028, -2.607972, 0, 0, 0, 1, 1,
-0.5342191, -0.01189322, -2.318292, 0, 0, 0, 1, 1,
-0.5341825, 1.976672, 1.418769, 0, 0, 0, 1, 1,
-0.5319605, -1.190463, -2.754207, 0, 0, 0, 1, 1,
-0.5276969, -0.3861854, -1.279976, 0, 0, 0, 1, 1,
-0.5269437, 0.8870046, -0.2735439, 1, 1, 1, 1, 1,
-0.525373, -0.5584197, -1.655451, 1, 1, 1, 1, 1,
-0.5220364, -0.5663453, -0.4439679, 1, 1, 1, 1, 1,
-0.5218549, -0.3943223, -3.482548, 1, 1, 1, 1, 1,
-0.5216818, -1.886149, -2.31876, 1, 1, 1, 1, 1,
-0.5149216, -0.1272247, -2.857164, 1, 1, 1, 1, 1,
-0.5116579, -0.7910287, -2.246304, 1, 1, 1, 1, 1,
-0.5097945, -0.4986095, 1.374127, 1, 1, 1, 1, 1,
-0.508905, 1.954049, -0.4690944, 1, 1, 1, 1, 1,
-0.5046744, 0.4538037, -0.09633946, 1, 1, 1, 1, 1,
-0.4985547, 0.7531053, -0.3169185, 1, 1, 1, 1, 1,
-0.4926132, 0.3872606, -1.173714, 1, 1, 1, 1, 1,
-0.481838, -0.9908881, -3.791169, 1, 1, 1, 1, 1,
-0.4800693, 1.150962, -0.3971802, 1, 1, 1, 1, 1,
-0.4713871, -0.5352136, -1.203855, 1, 1, 1, 1, 1,
-0.4662224, -1.25201, -1.665868, 0, 0, 1, 1, 1,
-0.4643754, 1.994873, -0.8643387, 1, 0, 0, 1, 1,
-0.460328, 0.3468907, -2.313081, 1, 0, 0, 1, 1,
-0.4537266, 0.5144626, -0.9774629, 1, 0, 0, 1, 1,
-0.4515065, 0.5940412, -1.507244, 1, 0, 0, 1, 1,
-0.4496469, 0.7369111, 0.4100701, 1, 0, 0, 1, 1,
-0.4401838, 1.186547, -0.06508502, 0, 0, 0, 1, 1,
-0.4345685, 0.4135412, -1.216051, 0, 0, 0, 1, 1,
-0.4339378, 1.224478, -0.5332381, 0, 0, 0, 1, 1,
-0.4328409, 0.9528447, -0.9959211, 0, 0, 0, 1, 1,
-0.4295467, -0.1883238, -1.178345, 0, 0, 0, 1, 1,
-0.4288456, 2.140263, -0.1444663, 0, 0, 0, 1, 1,
-0.4285612, -0.9135682, -2.328762, 0, 0, 0, 1, 1,
-0.4207959, -2.835019, -2.125189, 1, 1, 1, 1, 1,
-0.4171809, 0.5490497, -0.05566236, 1, 1, 1, 1, 1,
-0.4127467, 0.7214531, -0.8989235, 1, 1, 1, 1, 1,
-0.4122731, -1.059447, -5.243673, 1, 1, 1, 1, 1,
-0.4019972, 0.4067823, -1.340015, 1, 1, 1, 1, 1,
-0.4017991, 0.3667654, -0.5474129, 1, 1, 1, 1, 1,
-0.3966659, 0.09824959, -1.229237, 1, 1, 1, 1, 1,
-0.3945743, 0.7576441, -1.366709, 1, 1, 1, 1, 1,
-0.3935793, -1.396943, -2.895256, 1, 1, 1, 1, 1,
-0.3928915, -0.2040837, -2.794162, 1, 1, 1, 1, 1,
-0.3859395, 0.9823814, 1.095255, 1, 1, 1, 1, 1,
-0.384845, 0.05788742, -1.032434, 1, 1, 1, 1, 1,
-0.3829684, -2.084174, -4.08901, 1, 1, 1, 1, 1,
-0.3751061, 1.035089, 0.8640372, 1, 1, 1, 1, 1,
-0.3673716, -0.2507721, -2.396595, 1, 1, 1, 1, 1,
-0.3603302, -0.4274327, -4.238832, 0, 0, 1, 1, 1,
-0.3570366, -0.3081657, -0.7572999, 1, 0, 0, 1, 1,
-0.354808, -0.5962797, -3.809304, 1, 0, 0, 1, 1,
-0.349234, -0.229982, -2.483622, 1, 0, 0, 1, 1,
-0.3472865, 0.6880399, -0.3849961, 1, 0, 0, 1, 1,
-0.3455742, 0.1693332, -1.018465, 1, 0, 0, 1, 1,
-0.3411184, 1.559561, -0.4882865, 0, 0, 0, 1, 1,
-0.339552, -2.264771, -2.733785, 0, 0, 0, 1, 1,
-0.3383372, 0.04366488, -1.22146, 0, 0, 0, 1, 1,
-0.3374344, 0.8138562, -0.5223635, 0, 0, 0, 1, 1,
-0.3344635, -1.191365, -1.579517, 0, 0, 0, 1, 1,
-0.3344611, -1.741084, -2.945548, 0, 0, 0, 1, 1,
-0.3329751, -1.974431, -3.725231, 0, 0, 0, 1, 1,
-0.3313305, -0.375386, -3.08365, 1, 1, 1, 1, 1,
-0.3280227, 0.4930952, -1.26137, 1, 1, 1, 1, 1,
-0.3277795, 0.02568778, -0.1214578, 1, 1, 1, 1, 1,
-0.3263676, 0.05374321, -0.1476842, 1, 1, 1, 1, 1,
-0.3257317, 0.0532601, -1.205674, 1, 1, 1, 1, 1,
-0.3182804, -0.1412058, -2.755908, 1, 1, 1, 1, 1,
-0.3156084, -1.749095, -2.631845, 1, 1, 1, 1, 1,
-0.3137483, 0.07787894, 0.05370405, 1, 1, 1, 1, 1,
-0.3134847, -0.8699772, -3.388901, 1, 1, 1, 1, 1,
-0.3134054, -1.183694, -2.732711, 1, 1, 1, 1, 1,
-0.3064238, -0.1816019, -3.153283, 1, 1, 1, 1, 1,
-0.3027137, -0.5204881, -2.934885, 1, 1, 1, 1, 1,
-0.3018144, 0.2832464, -0.7557807, 1, 1, 1, 1, 1,
-0.3011824, 0.009268928, -1.634447, 1, 1, 1, 1, 1,
-0.2997824, 1.20306, -1.896404, 1, 1, 1, 1, 1,
-0.2955585, 0.7522836, -1.658863, 0, 0, 1, 1, 1,
-0.2940919, 0.4544377, 0.2182238, 1, 0, 0, 1, 1,
-0.2897286, 0.6571726, -0.2363888, 1, 0, 0, 1, 1,
-0.2853986, 0.3050223, -0.5170346, 1, 0, 0, 1, 1,
-0.2832563, -0.8822698, -4.084122, 1, 0, 0, 1, 1,
-0.283056, -3.249028, -3.184757, 1, 0, 0, 1, 1,
-0.279182, 0.6921934, -1.194147, 0, 0, 0, 1, 1,
-0.2739599, 2.012142, 0.1264604, 0, 0, 0, 1, 1,
-0.2659344, 0.5600743, 1.053814, 0, 0, 0, 1, 1,
-0.2608641, 0.6712186, 1.645257, 0, 0, 0, 1, 1,
-0.2598759, -0.8693941, -2.111289, 0, 0, 0, 1, 1,
-0.2570772, -0.2604012, -1.243951, 0, 0, 0, 1, 1,
-0.2567188, 1.689476, 0.05105408, 0, 0, 0, 1, 1,
-0.2532074, 0.1828658, -0.9585693, 1, 1, 1, 1, 1,
-0.2497598, -1.327802, -2.726135, 1, 1, 1, 1, 1,
-0.2475437, 0.3997761, -0.1260793, 1, 1, 1, 1, 1,
-0.2470376, -2.013289, -3.478534, 1, 1, 1, 1, 1,
-0.240718, -2.347184, -2.198241, 1, 1, 1, 1, 1,
-0.2340208, -1.081556, -1.772815, 1, 1, 1, 1, 1,
-0.2320221, 0.4883258, -0.8763705, 1, 1, 1, 1, 1,
-0.2308917, -0.9550461, -3.226195, 1, 1, 1, 1, 1,
-0.2305072, 0.9204291, -1.092662, 1, 1, 1, 1, 1,
-0.2288844, 0.03298675, -0.6780114, 1, 1, 1, 1, 1,
-0.2239336, 0.4107977, -0.9349065, 1, 1, 1, 1, 1,
-0.2228346, -1.470369, -2.327251, 1, 1, 1, 1, 1,
-0.2215634, -0.6359216, -2.752098, 1, 1, 1, 1, 1,
-0.2185925, 1.766635, 1.225988, 1, 1, 1, 1, 1,
-0.2154502, 1.030607, -1.779332, 1, 1, 1, 1, 1,
-0.2142225, -1.030035, -3.416151, 0, 0, 1, 1, 1,
-0.2078388, 0.6655091, -1.21299, 1, 0, 0, 1, 1,
-0.2018935, 0.7905866, -1.874841, 1, 0, 0, 1, 1,
-0.2014624, 0.6352175, 1.045034, 1, 0, 0, 1, 1,
-0.2014407, -0.2717791, -2.431208, 1, 0, 0, 1, 1,
-0.1980516, -0.02682772, -2.359166, 1, 0, 0, 1, 1,
-0.1913625, -0.8419696, -3.19695, 0, 0, 0, 1, 1,
-0.1886772, -0.9522253, -0.3359994, 0, 0, 0, 1, 1,
-0.1881088, 1.049577, 0.2869887, 0, 0, 0, 1, 1,
-0.1862668, 1.908723, 0.988929, 0, 0, 0, 1, 1,
-0.185724, 0.1910586, -0.4372073, 0, 0, 0, 1, 1,
-0.1840491, 0.5569188, 0.9439282, 0, 0, 0, 1, 1,
-0.1819055, -0.4975706, -1.491193, 0, 0, 0, 1, 1,
-0.1783392, -0.2867739, -3.586116, 1, 1, 1, 1, 1,
-0.1740665, -0.1852248, -1.7372, 1, 1, 1, 1, 1,
-0.1720235, 0.5664413, 0.979122, 1, 1, 1, 1, 1,
-0.1711795, -0.2065923, -3.286614, 1, 1, 1, 1, 1,
-0.1699794, 0.7524922, -1.802431, 1, 1, 1, 1, 1,
-0.1698429, 1.491475, 1.424731, 1, 1, 1, 1, 1,
-0.1688686, 1.100159, -1.121965, 1, 1, 1, 1, 1,
-0.1679505, -0.5569186, -2.409693, 1, 1, 1, 1, 1,
-0.1677476, 1.787146, -0.5155169, 1, 1, 1, 1, 1,
-0.160217, -0.086379, -2.548911, 1, 1, 1, 1, 1,
-0.1589209, 1.241318, -0.4748846, 1, 1, 1, 1, 1,
-0.1543275, -1.137275, -2.011163, 1, 1, 1, 1, 1,
-0.1540782, -0.06356841, -2.082313, 1, 1, 1, 1, 1,
-0.1526974, 0.1823228, -0.8377857, 1, 1, 1, 1, 1,
-0.1516672, 1.479434, 0.2918554, 1, 1, 1, 1, 1,
-0.150055, 1.274917, -0.705945, 0, 0, 1, 1, 1,
-0.1489772, 1.337969, 0.4178647, 1, 0, 0, 1, 1,
-0.1448439, -0.9506334, -3.424265, 1, 0, 0, 1, 1,
-0.1381213, -0.02241297, -1.723071, 1, 0, 0, 1, 1,
-0.1369539, 0.2309456, -1.924288, 1, 0, 0, 1, 1,
-0.1352313, 0.3672169, -0.9672863, 1, 0, 0, 1, 1,
-0.1338591, -0.06015595, -1.564801, 0, 0, 0, 1, 1,
-0.1332736, -2.317679, -2.966666, 0, 0, 0, 1, 1,
-0.1242269, 0.6419023, -0.1738643, 0, 0, 0, 1, 1,
-0.1204978, -0.09105308, -2.79405, 0, 0, 0, 1, 1,
-0.1197415, 0.6074966, 0.7026526, 0, 0, 0, 1, 1,
-0.1195148, 1.763123, 0.2424772, 0, 0, 0, 1, 1,
-0.1184954, 1.097373, 0.1878289, 0, 0, 0, 1, 1,
-0.1175287, 0.4825516, -0.8589128, 1, 1, 1, 1, 1,
-0.1154695, -0.2408967, -3.712549, 1, 1, 1, 1, 1,
-0.1150264, -1.350805, -4.723108, 1, 1, 1, 1, 1,
-0.1109947, 1.129463, 0.3827903, 1, 1, 1, 1, 1,
-0.1097667, -0.3207134, -0.6376068, 1, 1, 1, 1, 1,
-0.1094385, 1.178808, -1.189372, 1, 1, 1, 1, 1,
-0.1076755, 0.7765001, -0.3840263, 1, 1, 1, 1, 1,
-0.1068646, 1.19562, -1.316778, 1, 1, 1, 1, 1,
-0.1059338, 0.9321586, -0.4331172, 1, 1, 1, 1, 1,
-0.1018573, 0.6082779, -0.03390481, 1, 1, 1, 1, 1,
-0.1004875, -1.079652, -4.522335, 1, 1, 1, 1, 1,
-0.09824836, 1.733053, -0.07984573, 1, 1, 1, 1, 1,
-0.09698637, 0.3397638, -1.582755, 1, 1, 1, 1, 1,
-0.09652988, -0.1579282, -1.298841, 1, 1, 1, 1, 1,
-0.091725, 0.4416516, 2.41213, 1, 1, 1, 1, 1,
-0.09113841, -0.8096328, -4.752025, 0, 0, 1, 1, 1,
-0.08674785, -0.5701045, -2.454874, 1, 0, 0, 1, 1,
-0.08138771, -0.6507313, -3.004425, 1, 0, 0, 1, 1,
-0.0812014, 0.7396445, -0.7987078, 1, 0, 0, 1, 1,
-0.07857002, 1.219686, -1.041533, 1, 0, 0, 1, 1,
-0.07664637, -0.9283589, -2.813644, 1, 0, 0, 1, 1,
-0.07624343, 1.458928, -0.122547, 0, 0, 0, 1, 1,
-0.07315048, 0.4760466, -1.107539, 0, 0, 0, 1, 1,
-0.07275993, 0.1285004, 0.81297, 0, 0, 0, 1, 1,
-0.06731415, 0.5041557, -1.449202, 0, 0, 0, 1, 1,
-0.06641659, 0.3310566, -0.5247881, 0, 0, 0, 1, 1,
-0.0653488, 0.9220277, 0.9142588, 0, 0, 0, 1, 1,
-0.05918241, 0.4904101, -0.9775833, 0, 0, 0, 1, 1,
-0.05827988, 0.2140821, -0.03737525, 1, 1, 1, 1, 1,
-0.05691618, -2.510047, -3.85408, 1, 1, 1, 1, 1,
-0.05639156, 1.722823, -1.242095, 1, 1, 1, 1, 1,
-0.05583486, 1.359355, -1.037711, 1, 1, 1, 1, 1,
-0.05411615, -0.7321728, -5.520428, 1, 1, 1, 1, 1,
-0.04633784, -0.1359927, -3.086884, 1, 1, 1, 1, 1,
-0.04625499, 1.8389, 1.232642, 1, 1, 1, 1, 1,
-0.04271408, 1.362708, 0.09985589, 1, 1, 1, 1, 1,
-0.04227211, 1.62607, 0.1148809, 1, 1, 1, 1, 1,
-0.04126033, 1.214458, -1.060036, 1, 1, 1, 1, 1,
-0.03805725, 0.4024737, 0.3815013, 1, 1, 1, 1, 1,
-0.03560065, 0.2573304, 0.1476892, 1, 1, 1, 1, 1,
-0.03164019, 0.5381884, -1.142936, 1, 1, 1, 1, 1,
-0.02855892, -1.622397, -3.606884, 1, 1, 1, 1, 1,
-0.0270124, 0.803753, -1.449729, 1, 1, 1, 1, 1,
-0.02346126, 0.5928781, -0.7995719, 0, 0, 1, 1, 1,
-0.02299915, -0.5344785, -3.036375, 1, 0, 0, 1, 1,
-0.02083418, -0.1530946, -3.471472, 1, 0, 0, 1, 1,
-0.01995006, -0.3550128, -2.03756, 1, 0, 0, 1, 1,
-0.01971688, -0.002367011, -1.456402, 1, 0, 0, 1, 1,
-0.01817994, -1.6409, -3.874065, 1, 0, 0, 1, 1,
-0.01614719, 1.055928, 0.1743243, 0, 0, 0, 1, 1,
-0.01507854, 0.2530404, 0.7756246, 0, 0, 0, 1, 1,
-0.01456108, 0.980916, 0.9226659, 0, 0, 0, 1, 1,
-0.01226262, -1.553469, -3.880667, 0, 0, 0, 1, 1,
-0.01119223, 0.6096256, 0.1952688, 0, 0, 0, 1, 1,
-0.002961411, -1.000155, -2.939277, 0, 0, 0, 1, 1,
-0.001170941, 0.2164424, -0.4796351, 0, 0, 0, 1, 1,
0.0005736789, 1.871857, -0.2819924, 1, 1, 1, 1, 1,
0.0005884629, 1.394192, -2.086848, 1, 1, 1, 1, 1,
0.0008617685, -1.427796, 3.366076, 1, 1, 1, 1, 1,
0.00254274, -0.9265256, 2.933633, 1, 1, 1, 1, 1,
0.0030883, 0.1045174, -1.430034, 1, 1, 1, 1, 1,
0.008062492, 0.1205826, -3.008783, 1, 1, 1, 1, 1,
0.008365464, 0.6587405, -0.6965782, 1, 1, 1, 1, 1,
0.009370519, 0.7473543, -0.9324814, 1, 1, 1, 1, 1,
0.01354713, 0.2948551, -0.01468347, 1, 1, 1, 1, 1,
0.01442703, -0.5327399, 3.249839, 1, 1, 1, 1, 1,
0.01469059, -0.2636116, 2.151415, 1, 1, 1, 1, 1,
0.02028861, 1.814407, -0.3248933, 1, 1, 1, 1, 1,
0.02175104, -0.1762554, 2.626363, 1, 1, 1, 1, 1,
0.02184726, -0.2242813, 1.36836, 1, 1, 1, 1, 1,
0.02708502, -0.7268102, 2.682086, 1, 1, 1, 1, 1,
0.02952011, 0.06565369, 2.270558, 0, 0, 1, 1, 1,
0.0331447, -1.65293, 3.074696, 1, 0, 0, 1, 1,
0.037287, -0.04363038, 1.981946, 1, 0, 0, 1, 1,
0.03746332, 0.2706241, 1.659706, 1, 0, 0, 1, 1,
0.03886339, -1.229147, 3.261666, 1, 0, 0, 1, 1,
0.03946594, -1.690704, 1.891683, 1, 0, 0, 1, 1,
0.03949033, 0.9699946, -0.9167032, 0, 0, 0, 1, 1,
0.04077536, -0.8762971, 4.103648, 0, 0, 0, 1, 1,
0.04122689, 0.03690184, -0.4516367, 0, 0, 0, 1, 1,
0.04139214, -1.01556, 3.873806, 0, 0, 0, 1, 1,
0.04163359, 0.5011926, 1.001597, 0, 0, 0, 1, 1,
0.04204966, -0.6620278, 1.837469, 0, 0, 0, 1, 1,
0.04210289, 0.1000829, 3.426898, 0, 0, 0, 1, 1,
0.04452555, 0.8035572, -0.3871782, 1, 1, 1, 1, 1,
0.04837496, 2.208482, -1.471128, 1, 1, 1, 1, 1,
0.05081075, -0.05991932, 3.179872, 1, 1, 1, 1, 1,
0.05275777, -0.1513128, 3.632324, 1, 1, 1, 1, 1,
0.05287961, 1.314338, 1.477666, 1, 1, 1, 1, 1,
0.05509229, 0.8407033, 1.739391, 1, 1, 1, 1, 1,
0.0578011, -1.188212, 1.73157, 1, 1, 1, 1, 1,
0.0649892, 0.7741691, 2.211145, 1, 1, 1, 1, 1,
0.06499561, 0.6161198, 2.027646, 1, 1, 1, 1, 1,
0.07068633, 1.49461, -0.3452943, 1, 1, 1, 1, 1,
0.07262051, -0.8179346, 3.356113, 1, 1, 1, 1, 1,
0.07409946, -0.1427257, 2.843723, 1, 1, 1, 1, 1,
0.07575981, -0.6208917, 2.538933, 1, 1, 1, 1, 1,
0.0785307, 0.6254076, 2.253994, 1, 1, 1, 1, 1,
0.07863018, -1.046588, 4.052275, 1, 1, 1, 1, 1,
0.0861975, 1.352997, 0.5870205, 0, 0, 1, 1, 1,
0.08642653, -0.03196777, 1.962495, 1, 0, 0, 1, 1,
0.0888678, 0.1665281, 1.579759, 1, 0, 0, 1, 1,
0.0893391, -2.45593, 2.906884, 1, 0, 0, 1, 1,
0.09195868, 1.264039, -0.327055, 1, 0, 0, 1, 1,
0.09359144, -1.550061, 2.976388, 1, 0, 0, 1, 1,
0.09473799, -0.1613088, 0.6946407, 0, 0, 0, 1, 1,
0.1019613, -0.5570798, 0.4528272, 0, 0, 0, 1, 1,
0.1020931, 0.48418, -0.2354943, 0, 0, 0, 1, 1,
0.1065643, 0.5571712, 1.120719, 0, 0, 0, 1, 1,
0.1080225, 1.672827, -0.3569531, 0, 0, 0, 1, 1,
0.1163624, -0.9054574, 4.103219, 0, 0, 0, 1, 1,
0.1176439, -1.063666, 2.669478, 0, 0, 0, 1, 1,
0.118814, 1.792915, 0.1279331, 1, 1, 1, 1, 1,
0.1214096, 0.8893344, 1.137084, 1, 1, 1, 1, 1,
0.1217165, -0.04752285, 3.44176, 1, 1, 1, 1, 1,
0.1324531, -0.4155447, 0.478677, 1, 1, 1, 1, 1,
0.1331691, 0.2386161, 0.208821, 1, 1, 1, 1, 1,
0.1332438, -1.119205, 1.874108, 1, 1, 1, 1, 1,
0.1390885, 0.5613051, 0.5340319, 1, 1, 1, 1, 1,
0.1408742, -3.438129, 4.035136, 1, 1, 1, 1, 1,
0.1426457, 0.9521409, -0.1511787, 1, 1, 1, 1, 1,
0.1430973, -0.432267, 0.4162577, 1, 1, 1, 1, 1,
0.145723, -0.614959, 2.520201, 1, 1, 1, 1, 1,
0.1469817, -0.3858203, 2.433718, 1, 1, 1, 1, 1,
0.1473101, -0.2320023, 1.399582, 1, 1, 1, 1, 1,
0.1503957, 0.2390249, 1.49484, 1, 1, 1, 1, 1,
0.1517947, -0.7620412, 0.7585377, 1, 1, 1, 1, 1,
0.1567412, -0.3723331, 1.795728, 0, 0, 1, 1, 1,
0.1580815, 0.1044, 0.1336721, 1, 0, 0, 1, 1,
0.1592962, 0.6589832, 1.06165, 1, 0, 0, 1, 1,
0.1640963, -0.3309704, 1.429266, 1, 0, 0, 1, 1,
0.1670509, 0.00767382, 3.736705, 1, 0, 0, 1, 1,
0.1676195, 0.8026991, 0.8008528, 1, 0, 0, 1, 1,
0.1693189, -0.2006164, 1.461458, 0, 0, 0, 1, 1,
0.172117, -1.086473, 2.199041, 0, 0, 0, 1, 1,
0.174202, 1.074629, 0.6234222, 0, 0, 0, 1, 1,
0.1747712, -1.080916, 2.29216, 0, 0, 0, 1, 1,
0.1757, -1.306455, 2.316257, 0, 0, 0, 1, 1,
0.1757691, -0.5849973, 2.34642, 0, 0, 0, 1, 1,
0.1763732, -0.4603001, 3.202811, 0, 0, 0, 1, 1,
0.1769082, -0.1298509, 1.933436, 1, 1, 1, 1, 1,
0.1790954, -0.3013947, 1.187873, 1, 1, 1, 1, 1,
0.182587, 0.6225616, 1.354685, 1, 1, 1, 1, 1,
0.1850743, 0.09108632, 0.4212494, 1, 1, 1, 1, 1,
0.1865136, 0.1780822, -0.3921003, 1, 1, 1, 1, 1,
0.1871401, -1.968577, 1.687177, 1, 1, 1, 1, 1,
0.1879439, 0.3952938, 0.8073002, 1, 1, 1, 1, 1,
0.1890889, 0.1861505, -1.071921, 1, 1, 1, 1, 1,
0.19134, -0.3757037, -0.1738235, 1, 1, 1, 1, 1,
0.1939615, 2.906368, -0.9529098, 1, 1, 1, 1, 1,
0.2026439, 1.014154, 0.7635968, 1, 1, 1, 1, 1,
0.2034623, -0.3251205, 3.604628, 1, 1, 1, 1, 1,
0.208023, -1.443831, 2.539759, 1, 1, 1, 1, 1,
0.2113453, -0.5504175, 2.981632, 1, 1, 1, 1, 1,
0.2131717, -1.328615, 2.86183, 1, 1, 1, 1, 1,
0.2146281, 1.239622, 0.1000764, 0, 0, 1, 1, 1,
0.2167977, -0.8582432, 2.58622, 1, 0, 0, 1, 1,
0.2176619, -0.2169632, 3.652759, 1, 0, 0, 1, 1,
0.2236745, -0.4990093, 2.843637, 1, 0, 0, 1, 1,
0.2247188, -0.7691783, 0.4714984, 1, 0, 0, 1, 1,
0.2248107, -0.517488, 3.692933, 1, 0, 0, 1, 1,
0.2251894, 1.994153, -0.2730891, 0, 0, 0, 1, 1,
0.2254627, -0.3043806, 2.8302, 0, 0, 0, 1, 1,
0.227394, -0.6440802, 1.114811, 0, 0, 0, 1, 1,
0.2275124, -0.5477079, 2.48587, 0, 0, 0, 1, 1,
0.229492, -0.06264459, 1.951186, 0, 0, 0, 1, 1,
0.2300097, 0.6541836, 0.5425427, 0, 0, 0, 1, 1,
0.2324032, 0.3721922, 0.5102575, 0, 0, 0, 1, 1,
0.2364505, 1.27863, 1.099756, 1, 1, 1, 1, 1,
0.236664, -0.125161, 0.6300269, 1, 1, 1, 1, 1,
0.2376245, -0.7132459, 5.049279, 1, 1, 1, 1, 1,
0.2415334, -0.23317, 1.767802, 1, 1, 1, 1, 1,
0.2427992, -2.695993, 3.368994, 1, 1, 1, 1, 1,
0.2446599, 1.411653, 0.5222087, 1, 1, 1, 1, 1,
0.2450733, -0.0688751, 2.666307, 1, 1, 1, 1, 1,
0.246224, 0.2599685, 2.651663, 1, 1, 1, 1, 1,
0.2472642, 0.4498627, 0.993108, 1, 1, 1, 1, 1,
0.2480148, 0.2110159, 0.2512109, 1, 1, 1, 1, 1,
0.2481092, 0.2863707, 2.166714, 1, 1, 1, 1, 1,
0.2487201, 0.7226035, -0.8547533, 1, 1, 1, 1, 1,
0.2504842, -0.7524663, 2.228131, 1, 1, 1, 1, 1,
0.2508593, -0.06750817, 3.911414, 1, 1, 1, 1, 1,
0.2551256, -1.856265, 3.800894, 1, 1, 1, 1, 1,
0.2634656, 0.9719722, 3.53117, 0, 0, 1, 1, 1,
0.2637065, 2.902362, 1.116803, 1, 0, 0, 1, 1,
0.2662247, 0.5740969, 0.02148285, 1, 0, 0, 1, 1,
0.2677314, 2.810265, 0.510708, 1, 0, 0, 1, 1,
0.2687535, 2.258864, -1.303408, 1, 0, 0, 1, 1,
0.271391, -0.3293597, 2.16619, 1, 0, 0, 1, 1,
0.272025, -1.251312, 4.083123, 0, 0, 0, 1, 1,
0.2720995, -1.633152, 2.261106, 0, 0, 0, 1, 1,
0.2809327, 0.3096863, 1.493124, 0, 0, 0, 1, 1,
0.28268, 0.04150977, 1.045109, 0, 0, 0, 1, 1,
0.2843251, -0.5635996, 5.439311, 0, 0, 0, 1, 1,
0.2850099, -0.5274527, 3.961026, 0, 0, 0, 1, 1,
0.2865161, 1.07408, 1.035455, 0, 0, 0, 1, 1,
0.286788, -0.3884324, 1.846583, 1, 1, 1, 1, 1,
0.2945102, 1.412208, 1.207757, 1, 1, 1, 1, 1,
0.2946329, 1.178066, -1.411995, 1, 1, 1, 1, 1,
0.2955008, 0.9512726, 1.164678, 1, 1, 1, 1, 1,
0.2991361, -1.227726, 3.53573, 1, 1, 1, 1, 1,
0.3007891, -0.6350459, 3.663339, 1, 1, 1, 1, 1,
0.3013849, 0.3505237, 0.8428453, 1, 1, 1, 1, 1,
0.3024929, -0.1828584, 2.090089, 1, 1, 1, 1, 1,
0.3098566, 1.381749, 0.4591953, 1, 1, 1, 1, 1,
0.3110814, 0.5235099, -0.6018544, 1, 1, 1, 1, 1,
0.3143551, 0.7558737, 0.8281322, 1, 1, 1, 1, 1,
0.3160133, -0.9321924, 3.344564, 1, 1, 1, 1, 1,
0.3178361, 0.5412999, 2.378647, 1, 1, 1, 1, 1,
0.3198151, 0.2163518, 2.625004, 1, 1, 1, 1, 1,
0.3232517, 1.86795, -1.16936, 1, 1, 1, 1, 1,
0.3296355, 1.802895, 1.144112, 0, 0, 1, 1, 1,
0.3314478, -0.06244889, 3.079704, 1, 0, 0, 1, 1,
0.336062, 1.002648, -0.5623921, 1, 0, 0, 1, 1,
0.3371938, -1.410678, 3.12302, 1, 0, 0, 1, 1,
0.339758, -0.6720577, 0.5595879, 1, 0, 0, 1, 1,
0.3444018, -1.381198, 1.723511, 1, 0, 0, 1, 1,
0.3482708, 1.768783, 1.111604, 0, 0, 0, 1, 1,
0.349201, 0.1037375, 0.8797795, 0, 0, 0, 1, 1,
0.3495142, -0.2372821, 3.004488, 0, 0, 0, 1, 1,
0.3504602, 1.114568, 1.990218, 0, 0, 0, 1, 1,
0.3529469, 0.5637797, 1.006556, 0, 0, 0, 1, 1,
0.3601142, 3.124507, -0.7752301, 0, 0, 0, 1, 1,
0.3613002, -1.893308, 3.604882, 0, 0, 0, 1, 1,
0.3668453, 1.487413, 0.5159988, 1, 1, 1, 1, 1,
0.3702061, -0.5954666, 0.9431214, 1, 1, 1, 1, 1,
0.3747755, -1.483936, 3.801698, 1, 1, 1, 1, 1,
0.3789729, 0.5598682, 0.7177953, 1, 1, 1, 1, 1,
0.3844144, -0.06666377, 2.16743, 1, 1, 1, 1, 1,
0.3851446, 0.1008135, 4.146551, 1, 1, 1, 1, 1,
0.3857375, 1.039757, 0.6240929, 1, 1, 1, 1, 1,
0.3888387, -0.7435571, 2.757099, 1, 1, 1, 1, 1,
0.3892182, -0.05899226, 2.444754, 1, 1, 1, 1, 1,
0.3929474, -0.6298414, 2.2872, 1, 1, 1, 1, 1,
0.3972786, 0.9566146, 1.639518, 1, 1, 1, 1, 1,
0.397906, -0.8957758, 3.039945, 1, 1, 1, 1, 1,
0.400623, 0.5527881, 0.4205256, 1, 1, 1, 1, 1,
0.4119377, 0.5731378, 1.040604, 1, 1, 1, 1, 1,
0.4151331, -0.04827107, 3.125711, 1, 1, 1, 1, 1,
0.4167546, 0.9320382, 0.7062376, 0, 0, 1, 1, 1,
0.4219609, 1.036944, 1.494338, 1, 0, 0, 1, 1,
0.4226944, 0.591413, 0.2873924, 1, 0, 0, 1, 1,
0.4256434, -1.32923, 1.903705, 1, 0, 0, 1, 1,
0.4271412, -0.5728215, 2.030511, 1, 0, 0, 1, 1,
0.4317961, -1.072747, 2.101355, 1, 0, 0, 1, 1,
0.4350058, -2.160439, 2.371079, 0, 0, 0, 1, 1,
0.4388525, -0.7793548, 4.583904, 0, 0, 0, 1, 1,
0.4388701, -0.3853335, 2.324453, 0, 0, 0, 1, 1,
0.438903, -0.8835843, 1.24417, 0, 0, 0, 1, 1,
0.4422735, 0.355948, 1.344475, 0, 0, 0, 1, 1,
0.4442893, -0.1200014, 2.79761, 0, 0, 0, 1, 1,
0.4462614, 0.7369563, 0.4186398, 0, 0, 0, 1, 1,
0.447499, -1.033857, 2.135849, 1, 1, 1, 1, 1,
0.4476609, -0.3368981, 3.557235, 1, 1, 1, 1, 1,
0.4490672, 0.6988263, 0.114819, 1, 1, 1, 1, 1,
0.4576065, -2.411186, 1.904108, 1, 1, 1, 1, 1,
0.4593062, -1.001541, 2.474051, 1, 1, 1, 1, 1,
0.4598484, -1.113675, 2.586556, 1, 1, 1, 1, 1,
0.4660719, 0.4050426, 2.23094, 1, 1, 1, 1, 1,
0.4693848, -0.9387223, 3.053338, 1, 1, 1, 1, 1,
0.470083, 0.5457742, 1.5394, 1, 1, 1, 1, 1,
0.4709981, -1.793102, 2.679942, 1, 1, 1, 1, 1,
0.4742042, 0.07571661, 0.9905325, 1, 1, 1, 1, 1,
0.4748023, -0.7483422, 3.370278, 1, 1, 1, 1, 1,
0.480875, 0.5898029, -1.771122, 1, 1, 1, 1, 1,
0.4822803, -0.6418964, 2.511867, 1, 1, 1, 1, 1,
0.4913499, -0.16475, 3.333099, 1, 1, 1, 1, 1,
0.5037705, 0.2544223, 1.943957, 0, 0, 1, 1, 1,
0.5041487, -1.833407, 3.3267, 1, 0, 0, 1, 1,
0.5097936, -2.562516, 3.089688, 1, 0, 0, 1, 1,
0.5103027, -1.136249, 3.808183, 1, 0, 0, 1, 1,
0.5283613, 2.710621, 0.7663663, 1, 0, 0, 1, 1,
0.5297512, 1.232372, 1.225911, 1, 0, 0, 1, 1,
0.5297736, -0.117994, 1.460416, 0, 0, 0, 1, 1,
0.5332218, -0.2482654, 3.082173, 0, 0, 0, 1, 1,
0.5384445, -0.8159049, 1.020269, 0, 0, 0, 1, 1,
0.5394493, 0.6466585, -0.384771, 0, 0, 0, 1, 1,
0.543948, 2.122061, 0.6897253, 0, 0, 0, 1, 1,
0.5468602, 0.5375805, 2.377723, 0, 0, 0, 1, 1,
0.5495545, 0.3192768, 1.410923, 0, 0, 0, 1, 1,
0.5502492, -0.7847996, 4.817233, 1, 1, 1, 1, 1,
0.5519882, -0.2056661, 2.189481, 1, 1, 1, 1, 1,
0.5540304, 0.2569931, 0.9191293, 1, 1, 1, 1, 1,
0.5622302, 0.007618673, 3.20702, 1, 1, 1, 1, 1,
0.562737, -0.7670312, 3.072448, 1, 1, 1, 1, 1,
0.5727006, 1.328211, 0.5524371, 1, 1, 1, 1, 1,
0.5740723, 0.5388338, 0.4535943, 1, 1, 1, 1, 1,
0.5833036, 0.113012, 1.575711, 1, 1, 1, 1, 1,
0.5856547, 0.6050698, -1.663947, 1, 1, 1, 1, 1,
0.5857602, -0.01955805, 1.70575, 1, 1, 1, 1, 1,
0.5910694, -1.109432, 3.939416, 1, 1, 1, 1, 1,
0.5978194, 0.04161835, 1.072236, 1, 1, 1, 1, 1,
0.5979155, -1.011103, 1.731577, 1, 1, 1, 1, 1,
0.6010479, -0.6851269, 2.370199, 1, 1, 1, 1, 1,
0.6059952, 0.7980093, 0.175146, 1, 1, 1, 1, 1,
0.6125445, 1.112585, 0.1639866, 0, 0, 1, 1, 1,
0.6131476, -0.02574814, 4.120367, 1, 0, 0, 1, 1,
0.6133413, -1.672891, 4.015019, 1, 0, 0, 1, 1,
0.6146283, 2.828967, 1.487569, 1, 0, 0, 1, 1,
0.6165549, 0.8002235, -0.6935776, 1, 0, 0, 1, 1,
0.6178057, -1.053586, 2.6728, 1, 0, 0, 1, 1,
0.6184618, -0.7930772, 2.552555, 0, 0, 0, 1, 1,
0.6239797, 0.1294246, 0.5322296, 0, 0, 0, 1, 1,
0.6246409, 0.7798597, 0.398315, 0, 0, 0, 1, 1,
0.6356387, -0.6707085, 2.508111, 0, 0, 0, 1, 1,
0.6364763, -1.808471, 1.816858, 0, 0, 0, 1, 1,
0.6407814, 0.7061999, 0.6981006, 0, 0, 0, 1, 1,
0.6418789, -0.4120165, 1.374102, 0, 0, 0, 1, 1,
0.6436809, 0.6849318, 0.866056, 1, 1, 1, 1, 1,
0.6475865, -0.01424657, 0.607807, 1, 1, 1, 1, 1,
0.651059, 1.236097, 0.4057088, 1, 1, 1, 1, 1,
0.6728507, 0.4551448, 0.6948148, 1, 1, 1, 1, 1,
0.6738166, -0.1914709, 2.495171, 1, 1, 1, 1, 1,
0.6744604, -0.9761089, 3.086904, 1, 1, 1, 1, 1,
0.6760366, -0.3114879, 1.780048, 1, 1, 1, 1, 1,
0.6778989, -0.7548544, 2.074304, 1, 1, 1, 1, 1,
0.6819378, 0.7012711, -0.7910731, 1, 1, 1, 1, 1,
0.6827982, 0.1001824, 0.2006323, 1, 1, 1, 1, 1,
0.6923591, -1.53117, 3.47905, 1, 1, 1, 1, 1,
0.694409, -0.7864262, 3.227464, 1, 1, 1, 1, 1,
0.699392, -0.4715583, 1.371231, 1, 1, 1, 1, 1,
0.699809, 0.5179051, 2.542926, 1, 1, 1, 1, 1,
0.7041561, 0.9982991, -1.44628, 1, 1, 1, 1, 1,
0.704846, -0.2041701, 1.712349, 0, 0, 1, 1, 1,
0.7060625, -0.1635604, 2.954717, 1, 0, 0, 1, 1,
0.7079191, 0.6686743, 0.9392712, 1, 0, 0, 1, 1,
0.7123653, 1.33964, 0.4900363, 1, 0, 0, 1, 1,
0.7138201, 2.522291, 1.152369, 1, 0, 0, 1, 1,
0.7194883, 1.866042, -0.633586, 1, 0, 0, 1, 1,
0.7218264, -0.6968352, 1.755079, 0, 0, 0, 1, 1,
0.7220548, 0.221742, 1.118926, 0, 0, 0, 1, 1,
0.7223927, -0.169922, 1.501181, 0, 0, 0, 1, 1,
0.7225236, 1.509437, 0.3294763, 0, 0, 0, 1, 1,
0.7233161, 0.9821215, 1.00772, 0, 0, 0, 1, 1,
0.7266268, -1.870829, 1.983657, 0, 0, 0, 1, 1,
0.7301767, -1.310928, 2.321032, 0, 0, 0, 1, 1,
0.7375208, -1.308736, 2.640834, 1, 1, 1, 1, 1,
0.7461278, -0.2227263, 2.398008, 1, 1, 1, 1, 1,
0.7473158, -1.5208, 2.992523, 1, 1, 1, 1, 1,
0.750959, -1.705752, 2.314049, 1, 1, 1, 1, 1,
0.7528732, 0.4311651, 0.9889351, 1, 1, 1, 1, 1,
0.7712827, -0.3069947, 2.794728, 1, 1, 1, 1, 1,
0.7751155, 0.2548014, 0.4246372, 1, 1, 1, 1, 1,
0.7762856, 1.07214, -0.6024399, 1, 1, 1, 1, 1,
0.7771109, 0.4368382, 0.9033881, 1, 1, 1, 1, 1,
0.7796252, -0.03896113, 0.6998439, 1, 1, 1, 1, 1,
0.7864332, -1.848972, 2.369299, 1, 1, 1, 1, 1,
0.7873401, -0.5357643, 1.750775, 1, 1, 1, 1, 1,
0.7981231, 0.6905476, 0.9443755, 1, 1, 1, 1, 1,
0.8006048, -0.3786731, 0.7114971, 1, 1, 1, 1, 1,
0.8020878, -0.4148184, 2.037636, 1, 1, 1, 1, 1,
0.803897, 1.430286, -0.7824287, 0, 0, 1, 1, 1,
0.8042095, 0.7159604, -1.044532, 1, 0, 0, 1, 1,
0.8045213, -0.1113612, 1.853938, 1, 0, 0, 1, 1,
0.8047785, -0.5864855, 2.043554, 1, 0, 0, 1, 1,
0.8063999, 0.4107179, 1.311934, 1, 0, 0, 1, 1,
0.8085844, -0.5865501, 2.939104, 1, 0, 0, 1, 1,
0.8099496, -1.077267, 3.383675, 0, 0, 0, 1, 1,
0.8140343, 0.01087527, 0.1603836, 0, 0, 0, 1, 1,
0.8213235, 1.736738, -0.9744542, 0, 0, 0, 1, 1,
0.8225167, 0.9403395, -0.1426461, 0, 0, 0, 1, 1,
0.8261093, 0.2694682, 1.075383, 0, 0, 0, 1, 1,
0.8306884, 1.4508, 0.1803439, 0, 0, 0, 1, 1,
0.8326935, -0.5345919, 2.819579, 0, 0, 0, 1, 1,
0.8335749, -0.4158381, 4.944796, 1, 1, 1, 1, 1,
0.8345035, 0.01796195, 2.89829, 1, 1, 1, 1, 1,
0.8350099, -0.7837555, 1.621024, 1, 1, 1, 1, 1,
0.8350708, 0.1789751, 2.118506, 1, 1, 1, 1, 1,
0.8352582, -2.476884, 3.126182, 1, 1, 1, 1, 1,
0.8384469, -0.001981774, 2.23853, 1, 1, 1, 1, 1,
0.8430278, 0.2730818, 1.881958, 1, 1, 1, 1, 1,
0.8463615, -0.229602, 1.530605, 1, 1, 1, 1, 1,
0.8472749, 0.4023004, 1.581151, 1, 1, 1, 1, 1,
0.8500991, -1.107245, 2.605899, 1, 1, 1, 1, 1,
0.8517916, 1.470807, -0.6759831, 1, 1, 1, 1, 1,
0.8583187, 0.08878563, 1.329764, 1, 1, 1, 1, 1,
0.8629066, 0.1529403, 1.331497, 1, 1, 1, 1, 1,
0.8630823, 2.096704, 0.1132146, 1, 1, 1, 1, 1,
0.8647707, 0.1959224, 1.113255, 1, 1, 1, 1, 1,
0.8710031, 1.847666, -0.3571734, 0, 0, 1, 1, 1,
0.8711978, 0.1264253, 2.750965, 1, 0, 0, 1, 1,
0.8715563, -0.1702182, 1.148369, 1, 0, 0, 1, 1,
0.8760167, -0.1869605, 0.9994757, 1, 0, 0, 1, 1,
0.878353, 0.5893123, 2.850619, 1, 0, 0, 1, 1,
0.8833615, -0.06490158, 0.8503451, 1, 0, 0, 1, 1,
0.8850281, 1.451108, 0.700848, 0, 0, 0, 1, 1,
0.8874443, 0.4559864, 0.03246525, 0, 0, 0, 1, 1,
0.8880092, 0.1236269, 0.360325, 0, 0, 0, 1, 1,
0.8896104, 1.268422, 2.063382, 0, 0, 0, 1, 1,
0.8899688, 0.1846685, 1.496176, 0, 0, 0, 1, 1,
0.890349, -1.015735, 3.638021, 0, 0, 0, 1, 1,
0.8916181, 0.2791327, 0.7209096, 0, 0, 0, 1, 1,
0.8951581, -2.125435, 2.420754, 1, 1, 1, 1, 1,
0.8968996, 0.20088, 0.7726187, 1, 1, 1, 1, 1,
0.8978879, 0.4314336, 2.327783, 1, 1, 1, 1, 1,
0.9019251, -0.7507691, 2.582489, 1, 1, 1, 1, 1,
0.9140626, -0.2379445, 1.073232, 1, 1, 1, 1, 1,
0.9288994, 1.95615, -0.7466494, 1, 1, 1, 1, 1,
0.9315357, 0.3890018, 0.6436747, 1, 1, 1, 1, 1,
0.9335681, -1.620768, 2.203148, 1, 1, 1, 1, 1,
0.9372224, -0.1171046, 2.249279, 1, 1, 1, 1, 1,
0.9465911, -0.8372515, 2.303582, 1, 1, 1, 1, 1,
0.9481297, -0.3723927, 1.70035, 1, 1, 1, 1, 1,
0.9531564, -1.227204, 2.618881, 1, 1, 1, 1, 1,
0.9557687, 0.4088064, 0.352464, 1, 1, 1, 1, 1,
0.9638128, 0.07135612, 2.39775, 1, 1, 1, 1, 1,
0.9645719, -0.07863652, 3.447248, 1, 1, 1, 1, 1,
0.9657022, 0.6271455, 1.474058, 0, 0, 1, 1, 1,
0.9699348, -0.03536701, 0.3244551, 1, 0, 0, 1, 1,
0.9716501, 1.50364, 0.1649454, 1, 0, 0, 1, 1,
0.9717889, 1.386188, 0.6117741, 1, 0, 0, 1, 1,
0.9758645, -0.6782715, 2.598737, 1, 0, 0, 1, 1,
0.9762241, -1.609773, 2.552053, 1, 0, 0, 1, 1,
0.978302, -1.0101, -0.06454584, 0, 0, 0, 1, 1,
0.9818814, -0.04624431, 0.2124104, 0, 0, 0, 1, 1,
0.9833554, -2.913355, 2.315881, 0, 0, 0, 1, 1,
0.9852969, 0.2404414, 1.092028, 0, 0, 0, 1, 1,
0.9853141, -0.8768865, 2.904092, 0, 0, 0, 1, 1,
0.9890033, 0.7142571, -0.7881299, 0, 0, 0, 1, 1,
0.9939106, -0.734096, 2.14189, 0, 0, 0, 1, 1,
1.005136, 1.85585, -0.4532231, 1, 1, 1, 1, 1,
1.005141, -0.3827883, 1.631425, 1, 1, 1, 1, 1,
1.01052, 0.2503772, 0.8605396, 1, 1, 1, 1, 1,
1.010698, 0.9035914, 2.584197, 1, 1, 1, 1, 1,
1.011818, 1.750777, -1.348458, 1, 1, 1, 1, 1,
1.012637, -0.4689202, 1.606537, 1, 1, 1, 1, 1,
1.015833, 1.641616, 2.611364, 1, 1, 1, 1, 1,
1.018688, -0.3892934, -1.478413, 1, 1, 1, 1, 1,
1.021205, 0.7186241, 0.09621733, 1, 1, 1, 1, 1,
1.023475, 0.03841984, 0.5813193, 1, 1, 1, 1, 1,
1.023869, -0.4550553, 1.985086, 1, 1, 1, 1, 1,
1.030509, -2.090771, 1.332957, 1, 1, 1, 1, 1,
1.042259, -0.05630502, 2.067173, 1, 1, 1, 1, 1,
1.049512, -0.05474993, 1.701038, 1, 1, 1, 1, 1,
1.05997, -0.5427458, 2.13805, 1, 1, 1, 1, 1,
1.072524, -0.1986098, 1.967991, 0, 0, 1, 1, 1,
1.085492, 1.589772, -1.308451, 1, 0, 0, 1, 1,
1.089603, 0.8522251, 2.059875, 1, 0, 0, 1, 1,
1.096155, -0.8890194, 2.019458, 1, 0, 0, 1, 1,
1.104421, -0.1784191, 1.950975, 1, 0, 0, 1, 1,
1.106881, 1.012113, 0.9143299, 1, 0, 0, 1, 1,
1.108299, -0.3563708, 1.061806, 0, 0, 0, 1, 1,
1.115942, 2.212627, 0.03735017, 0, 0, 0, 1, 1,
1.121554, 0.8011059, 1.394114, 0, 0, 0, 1, 1,
1.122997, 0.2719118, 0.935744, 0, 0, 0, 1, 1,
1.128159, 1.383408, -0.2866008, 0, 0, 0, 1, 1,
1.140285, -0.5414423, 1.999828, 0, 0, 0, 1, 1,
1.14074, 1.114459, 2.690849, 0, 0, 0, 1, 1,
1.1512, -0.5590873, 3.431503, 1, 1, 1, 1, 1,
1.154567, 0.6727101, 1.112164, 1, 1, 1, 1, 1,
1.165272, -0.5321621, 1.212606, 1, 1, 1, 1, 1,
1.169194, -0.3460633, 1.200293, 1, 1, 1, 1, 1,
1.170169, 0.104741, 2.090415, 1, 1, 1, 1, 1,
1.170482, -0.8253384, 1.423418, 1, 1, 1, 1, 1,
1.175356, -1.043634, 2.731227, 1, 1, 1, 1, 1,
1.175861, -0.7418242, 3.736743, 1, 1, 1, 1, 1,
1.197314, -0.8745967, 1.588007, 1, 1, 1, 1, 1,
1.207663, -1.065183, 0.5227807, 1, 1, 1, 1, 1,
1.219006, 1.039634, 1.279608, 1, 1, 1, 1, 1,
1.220699, -0.4593877, 2.923346, 1, 1, 1, 1, 1,
1.223022, -1.137973, 2.485143, 1, 1, 1, 1, 1,
1.224098, -1.141033, 1.015793, 1, 1, 1, 1, 1,
1.225926, 0.1236398, 0.7618098, 1, 1, 1, 1, 1,
1.235827, -0.2182586, 1.107989, 0, 0, 1, 1, 1,
1.238385, 2.397782, 0.1518791, 1, 0, 0, 1, 1,
1.244354, 0.8095763, 1.457943, 1, 0, 0, 1, 1,
1.247345, -0.683781, 2.338412, 1, 0, 0, 1, 1,
1.248393, -0.9074959, 3.140236, 1, 0, 0, 1, 1,
1.253852, -0.07434642, 0.3675452, 1, 0, 0, 1, 1,
1.256749, -0.6168101, 3.004196, 0, 0, 0, 1, 1,
1.25979, -1.314378, 2.641399, 0, 0, 0, 1, 1,
1.264294, 0.1720576, 2.274717, 0, 0, 0, 1, 1,
1.264791, 0.4049887, 1.362432, 0, 0, 0, 1, 1,
1.272293, 1.849134, 2.044793, 0, 0, 0, 1, 1,
1.277114, -0.1943539, 0.2358361, 0, 0, 0, 1, 1,
1.278714, -0.328594, 0.881793, 0, 0, 0, 1, 1,
1.279654, 0.9199012, 1.245427, 1, 1, 1, 1, 1,
1.28984, 0.2880381, 1.156925, 1, 1, 1, 1, 1,
1.291418, 1.111946, 1.239346, 1, 1, 1, 1, 1,
1.301595, -1.536788, 3.839163, 1, 1, 1, 1, 1,
1.304832, -1.016482, 3.024634, 1, 1, 1, 1, 1,
1.30596, 0.2918974, 1.72193, 1, 1, 1, 1, 1,
1.32731, -0.3042895, 3.173029, 1, 1, 1, 1, 1,
1.336649, 0.4370781, 2.077418, 1, 1, 1, 1, 1,
1.354456, 0.5512656, 1.662042, 1, 1, 1, 1, 1,
1.356791, -0.5022233, 2.16761, 1, 1, 1, 1, 1,
1.362067, -0.2165744, 1.627396, 1, 1, 1, 1, 1,
1.364199, 0.3797382, -0.6479557, 1, 1, 1, 1, 1,
1.368727, 0.2921271, 0.297803, 1, 1, 1, 1, 1,
1.371281, 0.4884498, 1.812632, 1, 1, 1, 1, 1,
1.381307, -0.3223382, 3.138877, 1, 1, 1, 1, 1,
1.385172, -0.06046114, 0.9802079, 0, 0, 1, 1, 1,
1.393745, -0.3779356, 0.6943086, 1, 0, 0, 1, 1,
1.40552, 0.504755, 0.3152218, 1, 0, 0, 1, 1,
1.420281, -1.425917, 2.418888, 1, 0, 0, 1, 1,
1.424219, -0.09394278, -0.9366544, 1, 0, 0, 1, 1,
1.424675, -1.000084, 3.022459, 1, 0, 0, 1, 1,
1.431345, -0.3071096, 0.1565894, 0, 0, 0, 1, 1,
1.439292, -0.1645028, 1.572101, 0, 0, 0, 1, 1,
1.440402, -0.06533395, 0.3937629, 0, 0, 0, 1, 1,
1.440556, -0.8667468, 4.015998, 0, 0, 0, 1, 1,
1.445249, -0.129065, 2.56591, 0, 0, 0, 1, 1,
1.459393, 2.326539, 0.000733368, 0, 0, 0, 1, 1,
1.484994, -1.155569, -0.2194518, 0, 0, 0, 1, 1,
1.492663, -1.278589, 2.551774, 1, 1, 1, 1, 1,
1.50198, 0.1651132, -0.0256712, 1, 1, 1, 1, 1,
1.503387, 0.8327267, 2.085135, 1, 1, 1, 1, 1,
1.509668, -1.36312, 1.547547, 1, 1, 1, 1, 1,
1.520465, 0.6725199, 1.572385, 1, 1, 1, 1, 1,
1.542713, -1.299888, 2.648139, 1, 1, 1, 1, 1,
1.564129, -0.08258147, 3.243712, 1, 1, 1, 1, 1,
1.567813, -0.6034914, 1.008531, 1, 1, 1, 1, 1,
1.599371, -1.292351, 0.5926327, 1, 1, 1, 1, 1,
1.603884, 0.6471332, 1.608365, 1, 1, 1, 1, 1,
1.622822, -0.7776946, 2.185151, 1, 1, 1, 1, 1,
1.623262, 1.059063, 0.268194, 1, 1, 1, 1, 1,
1.627499, -0.8064172, 2.914064, 1, 1, 1, 1, 1,
1.635584, 0.265284, 0.08391394, 1, 1, 1, 1, 1,
1.639567, 0.8361161, 1.651436, 1, 1, 1, 1, 1,
1.67132, 0.3931047, 2.004241, 0, 0, 1, 1, 1,
1.678267, -2.042739, 2.949711, 1, 0, 0, 1, 1,
1.684151, 2.260232, 1.085354, 1, 0, 0, 1, 1,
1.68427, -0.625531, 0.4723115, 1, 0, 0, 1, 1,
1.688107, 1.845194, 1.608919, 1, 0, 0, 1, 1,
1.689013, 0.05679973, -0.1122089, 1, 0, 0, 1, 1,
1.699646, 0.03694167, 1.403675, 0, 0, 0, 1, 1,
1.714156, 1.194118, 0.9178314, 0, 0, 0, 1, 1,
1.715012, -1.592163, 4.451265, 0, 0, 0, 1, 1,
1.723355, 0.0287741, 1.975051, 0, 0, 0, 1, 1,
1.740917, -1.751124, 1.424294, 0, 0, 0, 1, 1,
1.750489, 0.1756576, 0.4812855, 0, 0, 0, 1, 1,
1.75568, 0.3186466, 1.223806, 0, 0, 0, 1, 1,
1.76061, -0.5679516, 1.481995, 1, 1, 1, 1, 1,
1.760754, -0.1939507, 3.779044, 1, 1, 1, 1, 1,
1.764143, -0.4538393, 1.561454, 1, 1, 1, 1, 1,
1.76529, 0.7102607, 0.6334379, 1, 1, 1, 1, 1,
1.795384, 0.2943463, 1.583196, 1, 1, 1, 1, 1,
1.806466, 0.2738373, 2.157699, 1, 1, 1, 1, 1,
1.825073, 0.727031, 1.239433, 1, 1, 1, 1, 1,
1.879477, -1.281722, 2.928483, 1, 1, 1, 1, 1,
1.898477, 0.9070585, 1.453599, 1, 1, 1, 1, 1,
1.905334, -1.062412, 3.001147, 1, 1, 1, 1, 1,
1.910246, 0.6057982, 1.861815, 1, 1, 1, 1, 1,
1.969361, -1.307197, 2.307918, 1, 1, 1, 1, 1,
2.009343, -0.0885921, 1.687606, 1, 1, 1, 1, 1,
2.030333, -0.8532433, 2.678448, 1, 1, 1, 1, 1,
2.056119, -0.9481674, 0.06317215, 1, 1, 1, 1, 1,
2.063823, -0.3005153, 1.968566, 0, 0, 1, 1, 1,
2.101516, 1.569243, -0.6569195, 1, 0, 0, 1, 1,
2.112274, -0.114349, 1.806493, 1, 0, 0, 1, 1,
2.124888, -0.9875458, 3.073554, 1, 0, 0, 1, 1,
2.270491, 1.227593, 1.270337, 1, 0, 0, 1, 1,
2.30153, -0.4333128, 1.408372, 1, 0, 0, 1, 1,
2.331789, 0.6968558, 1.998788, 0, 0, 0, 1, 1,
2.344127, 0.4457428, 0.7696909, 0, 0, 0, 1, 1,
2.354979, -0.06643839, 2.251195, 0, 0, 0, 1, 1,
2.399617, -0.8516535, 4.021186, 0, 0, 0, 1, 1,
2.41633, -0.005782104, 1.40366, 0, 0, 0, 1, 1,
2.426777, -1.392306, 3.201563, 0, 0, 0, 1, 1,
2.52246, -0.3031631, 2.676741, 0, 0, 0, 1, 1,
2.539956, -0.4164166, 3.150625, 1, 1, 1, 1, 1,
2.543371, -0.05294173, 0.119331, 1, 1, 1, 1, 1,
2.557097, 2.071933, 2.100316, 1, 1, 1, 1, 1,
2.705368, 0.04792773, 2.812003, 1, 1, 1, 1, 1,
2.733218, -1.586549, 2.924319, 1, 1, 1, 1, 1,
3.181353, 1.120609, 0.7469608, 1, 1, 1, 1, 1,
3.561407, -0.8891912, 2.772525, 1, 1, 1, 1, 1
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
var radius = 10.00012;
var distance = 35.125;
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
mvMatrix.translate( 0.1638665, 0.1568112, 0.04055858 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.125);
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
