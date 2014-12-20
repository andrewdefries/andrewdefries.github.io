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
-2.842446, 0.3913537, -2.89948, 1, 0, 0, 1,
-2.792293, -0.03606127, -1.503837, 1, 0.007843138, 0, 1,
-2.595838, -0.3132778, -1.905392, 1, 0.01176471, 0, 1,
-2.584749, 1.394349, -2.196777, 1, 0.01960784, 0, 1,
-2.474262, -0.966938, -1.829527, 1, 0.02352941, 0, 1,
-2.39759, -0.3953582, -1.470983, 1, 0.03137255, 0, 1,
-2.365087, -0.3274718, -1.597141, 1, 0.03529412, 0, 1,
-2.324756, 0.3568502, -0.8016493, 1, 0.04313726, 0, 1,
-2.207921, -0.7330668, -2.042804, 1, 0.04705882, 0, 1,
-2.206236, -0.1709353, -3.289784, 1, 0.05490196, 0, 1,
-2.189139, 0.7033435, -2.469643, 1, 0.05882353, 0, 1,
-2.180955, 0.4084135, -3.097117, 1, 0.06666667, 0, 1,
-2.164945, 0.1059501, -1.365409, 1, 0.07058824, 0, 1,
-2.152987, -0.8121325, -3.008912, 1, 0.07843138, 0, 1,
-2.123258, 0.830636, -1.018582, 1, 0.08235294, 0, 1,
-2.07571, -1.141327, -2.885473, 1, 0.09019608, 0, 1,
-2.010368, 2.100184, -1.501097, 1, 0.09411765, 0, 1,
-1.989921, 0.4229428, -2.171702, 1, 0.1019608, 0, 1,
-1.975175, 1.710129, 0.4584388, 1, 0.1098039, 0, 1,
-1.972742, -0.8500379, -0.3616859, 1, 0.1137255, 0, 1,
-1.965035, 0.02339656, -1.584026, 1, 0.1215686, 0, 1,
-1.943085, -0.4800981, -1.582419, 1, 0.1254902, 0, 1,
-1.905421, 0.1182478, -1.258829, 1, 0.1333333, 0, 1,
-1.883344, -0.4780581, -1.429308, 1, 0.1372549, 0, 1,
-1.867082, 0.5868444, -0.5564921, 1, 0.145098, 0, 1,
-1.85162, -0.6218375, -1.617066, 1, 0.1490196, 0, 1,
-1.850302, 0.8740008, -1.249937, 1, 0.1568628, 0, 1,
-1.845026, 0.6115749, -1.829149, 1, 0.1607843, 0, 1,
-1.80529, 0.251965, -1.160729, 1, 0.1686275, 0, 1,
-1.786702, -1.284469, -1.607739, 1, 0.172549, 0, 1,
-1.781844, -0.4236253, -3.884097, 1, 0.1803922, 0, 1,
-1.779117, 0.01289675, -3.819527, 1, 0.1843137, 0, 1,
-1.77432, 0.1194399, -3.800038, 1, 0.1921569, 0, 1,
-1.773439, -0.5872498, -0.8008752, 1, 0.1960784, 0, 1,
-1.754706, 0.8134605, -2.19353, 1, 0.2039216, 0, 1,
-1.74468, 0.1126881, -1.817627, 1, 0.2117647, 0, 1,
-1.711022, -0.3019531, -1.855533, 1, 0.2156863, 0, 1,
-1.708882, -0.6963786, -2.718122, 1, 0.2235294, 0, 1,
-1.704923, 0.6926436, -0.1071911, 1, 0.227451, 0, 1,
-1.697343, 0.06604868, -1.032386, 1, 0.2352941, 0, 1,
-1.688266, -1.703843, -3.062938, 1, 0.2392157, 0, 1,
-1.684669, 0.0502479, -2.081279, 1, 0.2470588, 0, 1,
-1.633005, 0.5549071, -0.5443308, 1, 0.2509804, 0, 1,
-1.612221, -0.9571154, -1.919012, 1, 0.2588235, 0, 1,
-1.609132, -1.629729, -2.737969, 1, 0.2627451, 0, 1,
-1.599818, -1.060276, -2.978409, 1, 0.2705882, 0, 1,
-1.590856, 0.9173566, -0.6976295, 1, 0.2745098, 0, 1,
-1.571916, 0.02571036, -0.8467326, 1, 0.282353, 0, 1,
-1.558411, -0.1178171, -2.473925, 1, 0.2862745, 0, 1,
-1.5435, -0.6514105, -1.580707, 1, 0.2941177, 0, 1,
-1.527815, 0.7597199, -0.09010055, 1, 0.3019608, 0, 1,
-1.519349, 0.6017389, 1.184872, 1, 0.3058824, 0, 1,
-1.519005, 0.556061, -0.522141, 1, 0.3137255, 0, 1,
-1.501369, -1.385655, -2.104496, 1, 0.3176471, 0, 1,
-1.48737, 0.01831199, -2.182273, 1, 0.3254902, 0, 1,
-1.484522, -1.136358, -2.026642, 1, 0.3294118, 0, 1,
-1.481759, -0.79662, -0.5690237, 1, 0.3372549, 0, 1,
-1.474132, 1.044431, -0.8765404, 1, 0.3411765, 0, 1,
-1.472741, 1.868759, -1.177789, 1, 0.3490196, 0, 1,
-1.470399, 1.396449, 0.1694422, 1, 0.3529412, 0, 1,
-1.469625, 0.5467409, -1.296803, 1, 0.3607843, 0, 1,
-1.467736, -1.452344, -1.076326, 1, 0.3647059, 0, 1,
-1.460684, 2.21897, -0.1445802, 1, 0.372549, 0, 1,
-1.455156, -0.2695367, -0.1034136, 1, 0.3764706, 0, 1,
-1.450638, -0.692064, -1.959173, 1, 0.3843137, 0, 1,
-1.45038, -0.7821952, -1.964545, 1, 0.3882353, 0, 1,
-1.447976, -0.2365381, -0.2263496, 1, 0.3960784, 0, 1,
-1.445108, 0.1615848, -1.101673, 1, 0.4039216, 0, 1,
-1.442158, 0.7536998, -0.0501717, 1, 0.4078431, 0, 1,
-1.431866, 1.315883, -0.2053296, 1, 0.4156863, 0, 1,
-1.427233, 0.338253, -0.1850982, 1, 0.4196078, 0, 1,
-1.420374, -1.72817, -0.7089734, 1, 0.427451, 0, 1,
-1.381868, -1.043974, -1.930196, 1, 0.4313726, 0, 1,
-1.377315, -0.5784593, -2.35108, 1, 0.4392157, 0, 1,
-1.375938, 0.6390682, -1.982998, 1, 0.4431373, 0, 1,
-1.369019, -0.5980678, -2.376571, 1, 0.4509804, 0, 1,
-1.359977, -0.9954848, -1.811239, 1, 0.454902, 0, 1,
-1.358305, -1.101768, -2.466167, 1, 0.4627451, 0, 1,
-1.35277, 2.128894, -0.5568083, 1, 0.4666667, 0, 1,
-1.348974, 0.5927718, 0.2751421, 1, 0.4745098, 0, 1,
-1.334506, -0.2115935, -1.021873, 1, 0.4784314, 0, 1,
-1.3217, 1.546825, -1.660862, 1, 0.4862745, 0, 1,
-1.316845, -1.101508, -1.042912, 1, 0.4901961, 0, 1,
-1.316692, -0.8194689, -2.967249, 1, 0.4980392, 0, 1,
-1.310134, 1.822972, -0.2825177, 1, 0.5058824, 0, 1,
-1.304568, -1.798036, -0.6063703, 1, 0.509804, 0, 1,
-1.281024, -0.6209636, -0.6208797, 1, 0.5176471, 0, 1,
-1.273825, -0.04276012, -2.023465, 1, 0.5215687, 0, 1,
-1.265325, 0.7203042, -1.269479, 1, 0.5294118, 0, 1,
-1.263996, 2.180018, -1.56661, 1, 0.5333334, 0, 1,
-1.26393, -0.2606547, -2.011394, 1, 0.5411765, 0, 1,
-1.263874, -2.05307, -2.725187, 1, 0.5450981, 0, 1,
-1.252711, 0.2928887, -0.393836, 1, 0.5529412, 0, 1,
-1.246193, -1.536804, -4.341842, 1, 0.5568628, 0, 1,
-1.244669, 0.192785, -0.9734144, 1, 0.5647059, 0, 1,
-1.23452, -0.535058, -1.804465, 1, 0.5686275, 0, 1,
-1.230265, -1.676393, -1.607197, 1, 0.5764706, 0, 1,
-1.221034, -0.3394746, -2.106251, 1, 0.5803922, 0, 1,
-1.206247, 0.2894946, -3.415086, 1, 0.5882353, 0, 1,
-1.199654, 0.2348832, -1.2712, 1, 0.5921569, 0, 1,
-1.196373, 0.1603212, -1.847938, 1, 0.6, 0, 1,
-1.195577, -1.134733, -3.07188, 1, 0.6078432, 0, 1,
-1.194899, 0.5369951, -1.908355, 1, 0.6117647, 0, 1,
-1.183753, 0.9977776, -0.4627622, 1, 0.6196079, 0, 1,
-1.178676, 0.1860629, -0.6467278, 1, 0.6235294, 0, 1,
-1.178336, 1.100032, -2.563201, 1, 0.6313726, 0, 1,
-1.172873, -0.1554082, -0.5963962, 1, 0.6352941, 0, 1,
-1.16562, 0.1657504, -0.922991, 1, 0.6431373, 0, 1,
-1.15601, -1.050305, -3.040929, 1, 0.6470588, 0, 1,
-1.150136, -0.2343983, -2.319987, 1, 0.654902, 0, 1,
-1.147351, 0.2065051, -0.4134378, 1, 0.6588235, 0, 1,
-1.140267, -0.5535773, -2.334193, 1, 0.6666667, 0, 1,
-1.134154, 0.7472562, -0.6206183, 1, 0.6705883, 0, 1,
-1.129691, -1.135233, -1.505298, 1, 0.6784314, 0, 1,
-1.126416, -0.3013205, -2.147967, 1, 0.682353, 0, 1,
-1.11105, 0.08570103, -1.288789, 1, 0.6901961, 0, 1,
-1.104977, -0.1695674, -0.8049249, 1, 0.6941177, 0, 1,
-1.102272, 1.181542, -1.489955, 1, 0.7019608, 0, 1,
-1.101068, 0.8984886, 0.5241282, 1, 0.7098039, 0, 1,
-1.091508, -0.0899877, -1.274408, 1, 0.7137255, 0, 1,
-1.08837, -0.4027841, -2.31891, 1, 0.7215686, 0, 1,
-1.087989, 0.596797, -1.129143, 1, 0.7254902, 0, 1,
-1.087039, -1.229678, -1.842436, 1, 0.7333333, 0, 1,
-1.086496, 1.66998, -0.9804834, 1, 0.7372549, 0, 1,
-1.086027, -1.425405, -2.366468, 1, 0.7450981, 0, 1,
-1.08536, -0.09526853, -1.623382, 1, 0.7490196, 0, 1,
-1.084374, -1.980484, -3.779693, 1, 0.7568628, 0, 1,
-1.066854, 0.5038225, 0.369202, 1, 0.7607843, 0, 1,
-1.058452, -0.675017, -2.422374, 1, 0.7686275, 0, 1,
-1.058036, -1.618974, -2.19539, 1, 0.772549, 0, 1,
-1.056991, -0.1135519, -1.892894, 1, 0.7803922, 0, 1,
-1.05387, 1.114386, 0.473424, 1, 0.7843137, 0, 1,
-1.052298, -2.055749, -3.906332, 1, 0.7921569, 0, 1,
-1.050835, 0.4719741, -0.3194303, 1, 0.7960784, 0, 1,
-1.050319, 0.4065045, -0.3759303, 1, 0.8039216, 0, 1,
-1.03838, 0.5883905, -2.708378, 1, 0.8117647, 0, 1,
-1.032839, 0.2210741, -1.88119, 1, 0.8156863, 0, 1,
-1.022378, 1.71924, -1.997808, 1, 0.8235294, 0, 1,
-1.020039, -1.988433, -4.012903, 1, 0.827451, 0, 1,
-1.016675, -0.4762511, -0.6940287, 1, 0.8352941, 0, 1,
-1.013111, 0.9416097, -1.308181, 1, 0.8392157, 0, 1,
-1.010307, 0.4150972, -0.96821, 1, 0.8470588, 0, 1,
-1.006931, -0.179379, -1.499223, 1, 0.8509804, 0, 1,
-0.9905465, 0.7085444, 0.1484607, 1, 0.8588235, 0, 1,
-0.9814223, -1.266838, -1.608895, 1, 0.8627451, 0, 1,
-0.9760801, 0.7197703, 1.024089, 1, 0.8705882, 0, 1,
-0.9742491, -0.9733841, -2.957543, 1, 0.8745098, 0, 1,
-0.9710735, 0.7817216, -1.93471, 1, 0.8823529, 0, 1,
-0.9704064, -0.3801257, -1.703588, 1, 0.8862745, 0, 1,
-0.9656466, -0.5525296, -1.035233, 1, 0.8941177, 0, 1,
-0.9635916, -1.851904, -3.469196, 1, 0.8980392, 0, 1,
-0.956871, -0.6357439, -2.627515, 1, 0.9058824, 0, 1,
-0.9547676, -0.5710696, -1.302222, 1, 0.9137255, 0, 1,
-0.9503318, 0.6119662, -1.103194, 1, 0.9176471, 0, 1,
-0.9480482, -0.8127695, -2.068187, 1, 0.9254902, 0, 1,
-0.9379376, -0.2320684, -1.332542, 1, 0.9294118, 0, 1,
-0.9367472, 0.8005565, -0.9072498, 1, 0.9372549, 0, 1,
-0.9300097, -0.1356975, -1.985171, 1, 0.9411765, 0, 1,
-0.9266688, 0.0429082, -0.6068132, 1, 0.9490196, 0, 1,
-0.9184678, 0.510533, -1.983469, 1, 0.9529412, 0, 1,
-0.9146053, -0.09579051, -0.3895522, 1, 0.9607843, 0, 1,
-0.9095296, 0.1574894, -1.366464, 1, 0.9647059, 0, 1,
-0.9086187, -0.5501835, -1.813741, 1, 0.972549, 0, 1,
-0.9069623, -1.355379, -2.683951, 1, 0.9764706, 0, 1,
-0.9066763, 0.8334819, -2.205784, 1, 0.9843137, 0, 1,
-0.9043579, -0.284714, -1.53171, 1, 0.9882353, 0, 1,
-0.9021091, 0.7911068, -0.9277729, 1, 0.9960784, 0, 1,
-0.8989036, -0.537089, -4.284316, 0.9960784, 1, 0, 1,
-0.8977947, 0.3312873, -0.02894342, 0.9921569, 1, 0, 1,
-0.8972507, 0.2249132, -0.5689116, 0.9843137, 1, 0, 1,
-0.8938655, -0.3761398, -1.000767, 0.9803922, 1, 0, 1,
-0.8866472, 0.5702056, -1.71322, 0.972549, 1, 0, 1,
-0.8746958, 0.3856279, -1.458344, 0.9686275, 1, 0, 1,
-0.8745633, -1.455862, -2.749282, 0.9607843, 1, 0, 1,
-0.8745588, 0.9112339, -0.7011939, 0.9568627, 1, 0, 1,
-0.8687677, 1.811352, -1.585255, 0.9490196, 1, 0, 1,
-0.8496773, 1.074192, -0.9101669, 0.945098, 1, 0, 1,
-0.8483375, 0.8391245, -2.418808, 0.9372549, 1, 0, 1,
-0.8444935, -0.9272835, -1.525046, 0.9333333, 1, 0, 1,
-0.840437, 0.1181613, -1.219975, 0.9254902, 1, 0, 1,
-0.8347825, -0.5457846, -1.623147, 0.9215686, 1, 0, 1,
-0.8339933, 1.0652, 2.145922, 0.9137255, 1, 0, 1,
-0.8312311, 0.2609841, -1.207992, 0.9098039, 1, 0, 1,
-0.8310862, 1.193997, -0.1868604, 0.9019608, 1, 0, 1,
-0.8290974, -0.4641401, -1.892716, 0.8941177, 1, 0, 1,
-0.8149133, -0.196578, -2.545747, 0.8901961, 1, 0, 1,
-0.8119717, -0.2937305, -1.997587, 0.8823529, 1, 0, 1,
-0.81144, 0.6489441, -0.5813779, 0.8784314, 1, 0, 1,
-0.7997404, -0.09464812, -2.901615, 0.8705882, 1, 0, 1,
-0.7964005, -0.2687295, -2.356532, 0.8666667, 1, 0, 1,
-0.7915711, 1.835524, -1.842039, 0.8588235, 1, 0, 1,
-0.7855693, 0.9146054, 1.078231, 0.854902, 1, 0, 1,
-0.7850016, -1.321718, -2.764183, 0.8470588, 1, 0, 1,
-0.781422, -1.195248, -1.735659, 0.8431373, 1, 0, 1,
-0.7776538, -0.5199689, -1.833228, 0.8352941, 1, 0, 1,
-0.7728733, 0.1011944, -1.371375, 0.8313726, 1, 0, 1,
-0.7704287, -1.391882, -1.972481, 0.8235294, 1, 0, 1,
-0.7674592, -1.65568, -1.696593, 0.8196079, 1, 0, 1,
-0.7660394, -2.694001, -2.898185, 0.8117647, 1, 0, 1,
-0.7654038, 0.921399, 0.5393935, 0.8078431, 1, 0, 1,
-0.7522526, 0.5416315, -0.7777912, 0.8, 1, 0, 1,
-0.7495157, 0.04787611, -2.572075, 0.7921569, 1, 0, 1,
-0.747218, 0.6606472, -1.339172, 0.7882353, 1, 0, 1,
-0.746211, -0.8143131, -3.102747, 0.7803922, 1, 0, 1,
-0.7396381, 0.2036131, -2.379481, 0.7764706, 1, 0, 1,
-0.737751, -0.2536964, -1.544135, 0.7686275, 1, 0, 1,
-0.7363551, 0.3576322, -1.67165, 0.7647059, 1, 0, 1,
-0.7345793, 1.761703, 0.6268038, 0.7568628, 1, 0, 1,
-0.7331895, 0.9784319, -2.010079, 0.7529412, 1, 0, 1,
-0.7316284, 0.1464537, -0.3294944, 0.7450981, 1, 0, 1,
-0.7186013, 0.963123, -1.351624, 0.7411765, 1, 0, 1,
-0.7176938, 1.311677, -0.5168226, 0.7333333, 1, 0, 1,
-0.7171548, -0.4117557, -1.889237, 0.7294118, 1, 0, 1,
-0.715038, -0.4872497, -2.115745, 0.7215686, 1, 0, 1,
-0.7120196, -1.599222, -1.155956, 0.7176471, 1, 0, 1,
-0.7102948, -0.3553836, -0.3108267, 0.7098039, 1, 0, 1,
-0.7091768, -0.7318127, -2.673782, 0.7058824, 1, 0, 1,
-0.7085512, -0.4415689, -0.8575779, 0.6980392, 1, 0, 1,
-0.7068956, -2.168958, -1.991232, 0.6901961, 1, 0, 1,
-0.7044541, 0.574654, -0.1008628, 0.6862745, 1, 0, 1,
-0.6952844, 0.9102043, 1.28093, 0.6784314, 1, 0, 1,
-0.6946794, -0.776556, -1.609664, 0.6745098, 1, 0, 1,
-0.6873184, -0.1880781, -1.963523, 0.6666667, 1, 0, 1,
-0.684717, -0.5485742, -4.993093, 0.6627451, 1, 0, 1,
-0.6764587, -0.8486646, -2.338443, 0.654902, 1, 0, 1,
-0.6762707, -2.10997, -3.473289, 0.6509804, 1, 0, 1,
-0.6724913, -1.195339, -2.550678, 0.6431373, 1, 0, 1,
-0.6693798, 0.5324317, -1.915589, 0.6392157, 1, 0, 1,
-0.6684911, -1.212569, -0.9297557, 0.6313726, 1, 0, 1,
-0.6684789, 0.8952273, -0.583806, 0.627451, 1, 0, 1,
-0.6636514, 0.5776879, 0.3926199, 0.6196079, 1, 0, 1,
-0.6622335, -2.46818, -3.265175, 0.6156863, 1, 0, 1,
-0.6616014, -0.441871, -3.984965, 0.6078432, 1, 0, 1,
-0.6614643, 0.3996279, -1.354828, 0.6039216, 1, 0, 1,
-0.6608581, 0.5691166, -1.037006, 0.5960785, 1, 0, 1,
-0.6537176, -1.728888, -2.396846, 0.5882353, 1, 0, 1,
-0.6528836, 0.3696616, -1.302663, 0.5843138, 1, 0, 1,
-0.6513404, -0.0358411, -2.657543, 0.5764706, 1, 0, 1,
-0.6512869, -0.3880242, -0.1635252, 0.572549, 1, 0, 1,
-0.6493325, -0.2159473, -0.4182895, 0.5647059, 1, 0, 1,
-0.6468153, -0.2043944, -1.864251, 0.5607843, 1, 0, 1,
-0.6378986, 0.9748887, -1.372153, 0.5529412, 1, 0, 1,
-0.6361899, -0.2934918, -0.7999115, 0.5490196, 1, 0, 1,
-0.6353962, -0.07488744, -1.692573, 0.5411765, 1, 0, 1,
-0.6296425, -0.3627018, -1.946559, 0.5372549, 1, 0, 1,
-0.6280702, -0.0579423, -1.912203, 0.5294118, 1, 0, 1,
-0.6277718, -0.3506557, -1.265977, 0.5254902, 1, 0, 1,
-0.6234898, 1.354244, 0.5175986, 0.5176471, 1, 0, 1,
-0.6227283, 0.846961, -0.7188035, 0.5137255, 1, 0, 1,
-0.6187246, -0.6497718, -2.870532, 0.5058824, 1, 0, 1,
-0.6125404, -0.9147733, -1.591644, 0.5019608, 1, 0, 1,
-0.6107467, 1.75233, -0.1806315, 0.4941176, 1, 0, 1,
-0.6045607, 0.1350528, -0.7270043, 0.4862745, 1, 0, 1,
-0.6016095, -0.2268869, -2.652416, 0.4823529, 1, 0, 1,
-0.6013883, 0.06235185, 0.3633259, 0.4745098, 1, 0, 1,
-0.6008326, 0.1690114, -1.02413, 0.4705882, 1, 0, 1,
-0.5977605, -0.2239797, -3.048787, 0.4627451, 1, 0, 1,
-0.5960214, -1.414701, -2.6927, 0.4588235, 1, 0, 1,
-0.5908712, 1.767533, -0.0770008, 0.4509804, 1, 0, 1,
-0.5870805, 0.2128602, -2.385019, 0.4470588, 1, 0, 1,
-0.5798216, 0.7440781, -0.2210375, 0.4392157, 1, 0, 1,
-0.579381, -1.750884, -2.529615, 0.4352941, 1, 0, 1,
-0.577455, 1.287951, 1.466572, 0.427451, 1, 0, 1,
-0.5722804, -0.2637912, -1.393157, 0.4235294, 1, 0, 1,
-0.5718685, -0.1977955, -0.5210484, 0.4156863, 1, 0, 1,
-0.5704475, -0.6507535, -0.6566294, 0.4117647, 1, 0, 1,
-0.5555519, 0.519421, -1.741508, 0.4039216, 1, 0, 1,
-0.5468696, -0.4823959, -2.46804, 0.3960784, 1, 0, 1,
-0.5448254, 1.180887, 0.1205813, 0.3921569, 1, 0, 1,
-0.5437588, 1.395078, 0.2196401, 0.3843137, 1, 0, 1,
-0.539215, 0.4327376, -0.6409004, 0.3803922, 1, 0, 1,
-0.5355991, 0.01684933, -1.766166, 0.372549, 1, 0, 1,
-0.5281924, -0.7184469, -3.291684, 0.3686275, 1, 0, 1,
-0.522647, -0.3536313, -2.243326, 0.3607843, 1, 0, 1,
-0.5222902, -0.1591794, -1.931273, 0.3568628, 1, 0, 1,
-0.5163003, 1.302159, -0.6315905, 0.3490196, 1, 0, 1,
-0.5149339, 0.3154041, -0.6700917, 0.345098, 1, 0, 1,
-0.5140091, -0.2597892, -3.0138, 0.3372549, 1, 0, 1,
-0.5090428, -1.128047, -3.031551, 0.3333333, 1, 0, 1,
-0.5051621, 0.3753219, -1.698434, 0.3254902, 1, 0, 1,
-0.5035559, 0.165707, -0.6454817, 0.3215686, 1, 0, 1,
-0.5006091, 1.77631, -1.164877, 0.3137255, 1, 0, 1,
-0.4968236, -0.2954135, -2.162353, 0.3098039, 1, 0, 1,
-0.4912214, 0.8171124, 0.4439141, 0.3019608, 1, 0, 1,
-0.4821439, 0.5416946, -0.1095305, 0.2941177, 1, 0, 1,
-0.4798804, 1.390061, -0.9159999, 0.2901961, 1, 0, 1,
-0.468858, 0.3828292, -0.1235916, 0.282353, 1, 0, 1,
-0.4678255, -0.2912627, -1.744145, 0.2784314, 1, 0, 1,
-0.467562, 0.1243426, -0.8339194, 0.2705882, 1, 0, 1,
-0.4673752, -0.1544894, -2.067497, 0.2666667, 1, 0, 1,
-0.4642356, -1.530483, -1.865808, 0.2588235, 1, 0, 1,
-0.4637696, 0.1746848, -2.040522, 0.254902, 1, 0, 1,
-0.4572884, -1.32936, -1.890718, 0.2470588, 1, 0, 1,
-0.4571264, -1.505272, -1.905287, 0.2431373, 1, 0, 1,
-0.4539881, 0.4547311, -1.099293, 0.2352941, 1, 0, 1,
-0.4505309, -1.324806, -1.877922, 0.2313726, 1, 0, 1,
-0.4468692, 0.469998, -0.4105745, 0.2235294, 1, 0, 1,
-0.4413778, -1.343444, -3.6742, 0.2196078, 1, 0, 1,
-0.4393876, 0.4476462, 0.5265571, 0.2117647, 1, 0, 1,
-0.4368301, -0.9634716, -3.178568, 0.2078431, 1, 0, 1,
-0.4347754, -0.1302686, -2.369399, 0.2, 1, 0, 1,
-0.4346383, 1.747817, -0.01128499, 0.1921569, 1, 0, 1,
-0.434426, 0.1286588, -0.8739184, 0.1882353, 1, 0, 1,
-0.4268002, -3.355383, -3.204095, 0.1803922, 1, 0, 1,
-0.4219798, 1.205774, -1.846212, 0.1764706, 1, 0, 1,
-0.4187489, -0.4743822, -3.226786, 0.1686275, 1, 0, 1,
-0.4149027, -0.1460261, -0.6765531, 0.1647059, 1, 0, 1,
-0.413609, -1.008655, -2.173517, 0.1568628, 1, 0, 1,
-0.4129174, -0.4603665, -3.402891, 0.1529412, 1, 0, 1,
-0.4124057, -0.5183333, -0.8162792, 0.145098, 1, 0, 1,
-0.4094735, 1.274964, -0.498864, 0.1411765, 1, 0, 1,
-0.4044644, -0.8791419, -3.624682, 0.1333333, 1, 0, 1,
-0.3985645, -1.740589, -4.358653, 0.1294118, 1, 0, 1,
-0.3975172, -0.5456725, -0.2269522, 0.1215686, 1, 0, 1,
-0.3918841, 1.383817, 1.85671, 0.1176471, 1, 0, 1,
-0.3910833, 1.111625, -1.017572, 0.1098039, 1, 0, 1,
-0.3880568, -0.04783011, 0.3010328, 0.1058824, 1, 0, 1,
-0.3877772, 0.5495094, -2.00787, 0.09803922, 1, 0, 1,
-0.3870019, 0.3906031, -0.5573397, 0.09019608, 1, 0, 1,
-0.37875, -0.4722923, -2.994337, 0.08627451, 1, 0, 1,
-0.3779454, -0.6788942, -3.143164, 0.07843138, 1, 0, 1,
-0.3772139, -0.3662798, -2.756214, 0.07450981, 1, 0, 1,
-0.3757482, -1.204574, -1.037298, 0.06666667, 1, 0, 1,
-0.37418, -0.433492, -3.893496, 0.0627451, 1, 0, 1,
-0.3727798, 1.429654, -1.141245, 0.05490196, 1, 0, 1,
-0.3660474, -0.2480426, -4.178862, 0.05098039, 1, 0, 1,
-0.3648156, -0.2145, -0.7799276, 0.04313726, 1, 0, 1,
-0.3555686, -0.3678032, -3.769851, 0.03921569, 1, 0, 1,
-0.3552115, 0.2928914, -2.285208, 0.03137255, 1, 0, 1,
-0.3539463, 0.5496555, -1.71305, 0.02745098, 1, 0, 1,
-0.3522599, 0.5034876, -0.4945347, 0.01960784, 1, 0, 1,
-0.351687, -1.154973, -1.884288, 0.01568628, 1, 0, 1,
-0.3496448, -0.03282433, -0.9677222, 0.007843138, 1, 0, 1,
-0.3460496, -0.0318432, -2.11308, 0.003921569, 1, 0, 1,
-0.3442104, 0.01099054, -0.4759708, 0, 1, 0.003921569, 1,
-0.3441461, 0.1149143, -1.031343, 0, 1, 0.01176471, 1,
-0.3436762, -0.05676876, -2.258223, 0, 1, 0.01568628, 1,
-0.3415403, -1.015805, -2.985785, 0, 1, 0.02352941, 1,
-0.3384635, 1.679116, -0.09748974, 0, 1, 0.02745098, 1,
-0.3344551, -0.218876, -3.453593, 0, 1, 0.03529412, 1,
-0.3325237, -1.236421, -2.305103, 0, 1, 0.03921569, 1,
-0.3306571, -1.597965, -1.765433, 0, 1, 0.04705882, 1,
-0.322771, -0.2540496, -3.975062, 0, 1, 0.05098039, 1,
-0.32141, -1.288043, -2.787034, 0, 1, 0.05882353, 1,
-0.319649, -2.160161, -2.722868, 0, 1, 0.0627451, 1,
-0.3188033, 0.6755676, -1.60863, 0, 1, 0.07058824, 1,
-0.3187838, 1.839394, -0.1933512, 0, 1, 0.07450981, 1,
-0.3116623, 0.1546615, -1.330182, 0, 1, 0.08235294, 1,
-0.3110749, -1.623096, -4.212685, 0, 1, 0.08627451, 1,
-0.3102587, -1.571075, -1.31184, 0, 1, 0.09411765, 1,
-0.3083796, 0.1129074, -0.8070595, 0, 1, 0.1019608, 1,
-0.3070848, -0.2869855, -2.905898, 0, 1, 0.1058824, 1,
-0.3018876, 1.107687, -1.113505, 0, 1, 0.1137255, 1,
-0.28725, -1.142102, -3.648685, 0, 1, 0.1176471, 1,
-0.2850677, 1.406635, -0.1463989, 0, 1, 0.1254902, 1,
-0.2778211, 0.07884687, -1.014143, 0, 1, 0.1294118, 1,
-0.2755863, -1.106913, -3.436609, 0, 1, 0.1372549, 1,
-0.2739756, -1.473946, -3.36558, 0, 1, 0.1411765, 1,
-0.2713853, 1.409692, 0.864381, 0, 1, 0.1490196, 1,
-0.2689708, 0.8052058, -0.9690266, 0, 1, 0.1529412, 1,
-0.2677215, -1.240963, -2.091011, 0, 1, 0.1607843, 1,
-0.2626023, 1.401017, 0.8909487, 0, 1, 0.1647059, 1,
-0.2619446, -0.3047808, 0.3638988, 0, 1, 0.172549, 1,
-0.260552, 1.476359, -0.2249817, 0, 1, 0.1764706, 1,
-0.2590058, -0.3888267, -3.134011, 0, 1, 0.1843137, 1,
-0.2583817, -1.5166, -3.47158, 0, 1, 0.1882353, 1,
-0.2509829, -0.2501321, -1.626552, 0, 1, 0.1960784, 1,
-0.2500044, 0.1510074, -1.009032, 0, 1, 0.2039216, 1,
-0.2495073, 0.1592981, 0.2840037, 0, 1, 0.2078431, 1,
-0.2478033, 0.5731037, -0.3123726, 0, 1, 0.2156863, 1,
-0.2419783, 0.8610929, 0.528264, 0, 1, 0.2196078, 1,
-0.2380722, -1.099718, -2.952584, 0, 1, 0.227451, 1,
-0.2336958, 0.0273608, 0.2223595, 0, 1, 0.2313726, 1,
-0.2332633, 0.720019, -2.881947, 0, 1, 0.2392157, 1,
-0.2290067, -1.676042, -2.351825, 0, 1, 0.2431373, 1,
-0.220307, 0.4708828, -1.400489, 0, 1, 0.2509804, 1,
-0.2200306, -0.1959151, -1.133376, 0, 1, 0.254902, 1,
-0.2164858, -0.03915733, -2.973441, 0, 1, 0.2627451, 1,
-0.2143833, 0.479614, -0.3136831, 0, 1, 0.2666667, 1,
-0.2090411, 0.8450367, 1.04471, 0, 1, 0.2745098, 1,
-0.2079962, 0.17748, -0.4311569, 0, 1, 0.2784314, 1,
-0.2056699, -1.147046, -1.370701, 0, 1, 0.2862745, 1,
-0.2011052, -2.091168, -2.883993, 0, 1, 0.2901961, 1,
-0.2005081, -0.1947742, -2.975777, 0, 1, 0.2980392, 1,
-0.1996418, -0.2189889, -2.063778, 0, 1, 0.3058824, 1,
-0.1944722, 1.051432, 0.8599356, 0, 1, 0.3098039, 1,
-0.1932213, 0.73999, 0.879329, 0, 1, 0.3176471, 1,
-0.1928269, 0.1510859, -1.547332, 0, 1, 0.3215686, 1,
-0.190378, -0.5028673, -1.368121, 0, 1, 0.3294118, 1,
-0.1866518, -0.9804478, -3.454412, 0, 1, 0.3333333, 1,
-0.1859853, 1.531088, 1.653612, 0, 1, 0.3411765, 1,
-0.1832377, 0.6291208, -0.7421694, 0, 1, 0.345098, 1,
-0.1815301, -1.576682, -2.001693, 0, 1, 0.3529412, 1,
-0.1777207, -0.6468744, -4.218551, 0, 1, 0.3568628, 1,
-0.1739007, -0.566909, -1.22165, 0, 1, 0.3647059, 1,
-0.1696037, 1.913506, -0.1748473, 0, 1, 0.3686275, 1,
-0.1672441, -0.3405372, -2.018425, 0, 1, 0.3764706, 1,
-0.1656149, -1.493166, -2.878581, 0, 1, 0.3803922, 1,
-0.1619576, 0.2439792, -0.8324153, 0, 1, 0.3882353, 1,
-0.1613483, -0.3960337, -2.697758, 0, 1, 0.3921569, 1,
-0.160864, 1.138548, -0.9441974, 0, 1, 0.4, 1,
-0.1596505, -1.078396, -3.648901, 0, 1, 0.4078431, 1,
-0.1571162, -1.318997, -2.08447, 0, 1, 0.4117647, 1,
-0.1563091, -0.5206295, -3.24982, 0, 1, 0.4196078, 1,
-0.1544833, -0.7398298, -4.179867, 0, 1, 0.4235294, 1,
-0.1537521, 2.085389, -1.69156, 0, 1, 0.4313726, 1,
-0.1511883, 0.8205596, -0.2815754, 0, 1, 0.4352941, 1,
-0.1450609, -0.9265413, -2.813047, 0, 1, 0.4431373, 1,
-0.1441792, -1.543176, -3.316214, 0, 1, 0.4470588, 1,
-0.1427484, 1.277845, 0.3615763, 0, 1, 0.454902, 1,
-0.1414195, 0.2711189, 0.4903952, 0, 1, 0.4588235, 1,
-0.1411486, -0.4618656, -1.950347, 0, 1, 0.4666667, 1,
-0.1403566, 0.9284345, 0.3983582, 0, 1, 0.4705882, 1,
-0.1383386, 1.12278, -1.226134, 0, 1, 0.4784314, 1,
-0.1345228, 0.3743999, -0.1820769, 0, 1, 0.4823529, 1,
-0.1337343, 0.7909087, -0.4041666, 0, 1, 0.4901961, 1,
-0.1324417, -0.205784, -1.40467, 0, 1, 0.4941176, 1,
-0.1320372, -0.1759831, -1.820736, 0, 1, 0.5019608, 1,
-0.1286915, 0.5306195, -0.05917717, 0, 1, 0.509804, 1,
-0.124983, -0.02845545, -1.873745, 0, 1, 0.5137255, 1,
-0.1201683, -0.56168, -2.134226, 0, 1, 0.5215687, 1,
-0.1166379, 0.6434713, -1.531408, 0, 1, 0.5254902, 1,
-0.1160714, -1.377019, -3.489682, 0, 1, 0.5333334, 1,
-0.1141891, -0.7239938, -5.298166, 0, 1, 0.5372549, 1,
-0.111953, 1.832029, 0.647144, 0, 1, 0.5450981, 1,
-0.111164, 0.9673078, -1.06545, 0, 1, 0.5490196, 1,
-0.1094059, -0.2594415, -3.686443, 0, 1, 0.5568628, 1,
-0.1088856, -1.057414, -3.807445, 0, 1, 0.5607843, 1,
-0.1084019, 0.3233036, 0.06667778, 0, 1, 0.5686275, 1,
-0.1061123, 0.4607794, 0.4694895, 0, 1, 0.572549, 1,
-0.1051551, 1.411699, -0.6993139, 0, 1, 0.5803922, 1,
-0.1040065, -0.2595237, -3.3825, 0, 1, 0.5843138, 1,
-0.1029757, -1.733335, -2.035504, 0, 1, 0.5921569, 1,
-0.101272, -0.1693618, -4.011625, 0, 1, 0.5960785, 1,
-0.1001677, 0.510322, -1.096091, 0, 1, 0.6039216, 1,
-0.09939504, -0.5386065, -2.55789, 0, 1, 0.6117647, 1,
-0.09601586, -0.4344805, -1.365558, 0, 1, 0.6156863, 1,
-0.09190131, 0.9649116, 0.1474726, 0, 1, 0.6235294, 1,
-0.08985005, -0.2023667, -1.535417, 0, 1, 0.627451, 1,
-0.08709087, -0.4399501, -1.878163, 0, 1, 0.6352941, 1,
-0.08614732, -1.101778, -2.533642, 0, 1, 0.6392157, 1,
-0.08586521, 0.1014663, -1.576619, 0, 1, 0.6470588, 1,
-0.08505995, -0.3164578, -3.470412, 0, 1, 0.6509804, 1,
-0.07560736, 1.206589, -0.9415858, 0, 1, 0.6588235, 1,
-0.07495681, 1.038044, 0.2197511, 0, 1, 0.6627451, 1,
-0.0693459, 0.116044, 0.4090323, 0, 1, 0.6705883, 1,
-0.06500821, 0.3471935, -2.267726, 0, 1, 0.6745098, 1,
-0.06378336, 0.05819542, 0.5951399, 0, 1, 0.682353, 1,
-0.06219866, 0.3023518, -0.1165969, 0, 1, 0.6862745, 1,
-0.06001829, 0.801011, 0.9600042, 0, 1, 0.6941177, 1,
-0.05655336, -1.98953, -1.765041, 0, 1, 0.7019608, 1,
-0.0552709, -0.4901207, -1.185158, 0, 1, 0.7058824, 1,
-0.05269344, -0.8437225, -2.606846, 0, 1, 0.7137255, 1,
-0.05069453, 0.4798989, 0.2418637, 0, 1, 0.7176471, 1,
-0.04918309, -0.2061065, -3.735902, 0, 1, 0.7254902, 1,
-0.04715174, -0.0548868, -3.167524, 0, 1, 0.7294118, 1,
-0.04622636, -0.8202848, -3.575649, 0, 1, 0.7372549, 1,
-0.0460125, -0.5883013, -4.197007, 0, 1, 0.7411765, 1,
-0.04452205, -0.4093526, -2.919991, 0, 1, 0.7490196, 1,
-0.04290434, -0.433983, -3.431392, 0, 1, 0.7529412, 1,
-0.04241952, -1.016141, -5.697786, 0, 1, 0.7607843, 1,
-0.03989771, -0.260711, -3.206948, 0, 1, 0.7647059, 1,
-0.03924662, -0.07303528, -4.537848, 0, 1, 0.772549, 1,
-0.03332323, -0.576093, -3.177611, 0, 1, 0.7764706, 1,
-0.03278919, -1.33787, -2.545527, 0, 1, 0.7843137, 1,
-0.02146259, -0.722612, -2.505797, 0, 1, 0.7882353, 1,
-0.02127265, -0.386313, -3.086248, 0, 1, 0.7960784, 1,
-0.01940209, -1.639311, -5.581261, 0, 1, 0.8039216, 1,
-0.01338943, -0.1984336, -3.584876, 0, 1, 0.8078431, 1,
-0.01317628, -0.2579822, -3.4467, 0, 1, 0.8156863, 1,
-0.01191212, 0.06012364, -1.081265, 0, 1, 0.8196079, 1,
-0.009556152, -0.4194338, -1.865595, 0, 1, 0.827451, 1,
-0.008375987, 0.09106628, -0.2544588, 0, 1, 0.8313726, 1,
-0.006998552, 0.8124135, -0.9213779, 0, 1, 0.8392157, 1,
-0.006384922, -0.1420511, -2.994516, 0, 1, 0.8431373, 1,
-0.006322355, -1.171314, -3.007355, 0, 1, 0.8509804, 1,
-0.004652545, -2.991029, -2.69773, 0, 1, 0.854902, 1,
-0.002256942, 0.8585806, 0.4347498, 0, 1, 0.8627451, 1,
0.007012473, 0.2372281, -1.042077, 0, 1, 0.8666667, 1,
0.01006146, 0.5201644, -2.37434, 0, 1, 0.8745098, 1,
0.01049022, -0.1145783, 1.306677, 0, 1, 0.8784314, 1,
0.01366615, 0.5496987, -0.6129142, 0, 1, 0.8862745, 1,
0.01385588, 0.5643851, -1.169327, 0, 1, 0.8901961, 1,
0.01637438, 0.8738572, -1.150417, 0, 1, 0.8980392, 1,
0.01750916, -0.3138664, 3.066644, 0, 1, 0.9058824, 1,
0.02045107, 1.312257, -2.453377, 0, 1, 0.9098039, 1,
0.02168315, -0.7803163, 1.097169, 0, 1, 0.9176471, 1,
0.02215806, 2.059605, -1.190704, 0, 1, 0.9215686, 1,
0.02261189, -0.5774107, 4.887233, 0, 1, 0.9294118, 1,
0.02760456, -0.5803002, 3.016322, 0, 1, 0.9333333, 1,
0.02797956, 0.1497568, 0.007015087, 0, 1, 0.9411765, 1,
0.03127031, -0.1442981, 3.140374, 0, 1, 0.945098, 1,
0.03699423, -0.02771751, 0.327447, 0, 1, 0.9529412, 1,
0.03743484, -0.7316867, 2.39237, 0, 1, 0.9568627, 1,
0.04452045, -0.875954, 4.375498, 0, 1, 0.9647059, 1,
0.04457835, 0.5224708, 2.05223, 0, 1, 0.9686275, 1,
0.04871992, -1.404814, 3.78423, 0, 1, 0.9764706, 1,
0.04927274, -0.3596382, 2.577487, 0, 1, 0.9803922, 1,
0.05088089, 0.178267, 0.9740864, 0, 1, 0.9882353, 1,
0.0509111, 0.7225138, 0.4278094, 0, 1, 0.9921569, 1,
0.05102426, -1.648279, 3.967845, 0, 1, 1, 1,
0.05601999, -0.7949489, 2.206601, 0, 0.9921569, 1, 1,
0.05708882, 1.876496, 0.8672855, 0, 0.9882353, 1, 1,
0.06039802, 0.4253803, -1.255072, 0, 0.9803922, 1, 1,
0.07646582, -1.056027, 2.464603, 0, 0.9764706, 1, 1,
0.08030665, 1.654145, 0.9101771, 0, 0.9686275, 1, 1,
0.08365332, -1.173707, 2.671287, 0, 0.9647059, 1, 1,
0.08784707, 1.129088, 0.7370637, 0, 0.9568627, 1, 1,
0.08840997, -0.4053244, 3.737782, 0, 0.9529412, 1, 1,
0.09164692, -0.2011757, 3.401881, 0, 0.945098, 1, 1,
0.09441558, -0.4160763, 2.64972, 0, 0.9411765, 1, 1,
0.1021768, 0.2005707, 0.2660899, 0, 0.9333333, 1, 1,
0.1022881, -1.499289, 3.027667, 0, 0.9294118, 1, 1,
0.1069579, -0.1806888, 1.496615, 0, 0.9215686, 1, 1,
0.1076103, 0.669183, -1.011146, 0, 0.9176471, 1, 1,
0.1078342, -1.822705, 2.728043, 0, 0.9098039, 1, 1,
0.1084438, 0.9521033, -1.344389, 0, 0.9058824, 1, 1,
0.1087229, -2.408324, 4.181997, 0, 0.8980392, 1, 1,
0.1157054, -0.7615169, 4.573061, 0, 0.8901961, 1, 1,
0.1181624, 0.1037062, 3.374026, 0, 0.8862745, 1, 1,
0.1207036, 1.328473, 0.261835, 0, 0.8784314, 1, 1,
0.1229735, -0.1907541, 3.721432, 0, 0.8745098, 1, 1,
0.1238235, 0.7450369, 0.7966687, 0, 0.8666667, 1, 1,
0.1253512, -0.9680365, 3.627681, 0, 0.8627451, 1, 1,
0.1267231, 1.286486, -0.422671, 0, 0.854902, 1, 1,
0.1279157, 0.609753, -1.591478, 0, 0.8509804, 1, 1,
0.1281317, -0.4672048, 2.355478, 0, 0.8431373, 1, 1,
0.1285901, -0.04070851, 3.586311, 0, 0.8392157, 1, 1,
0.1299138, -0.3948211, 2.381786, 0, 0.8313726, 1, 1,
0.1320634, 0.06106021, 0.2488251, 0, 0.827451, 1, 1,
0.1383871, 1.602082, 0.4516095, 0, 0.8196079, 1, 1,
0.1395888, 0.5568893, 1.594677, 0, 0.8156863, 1, 1,
0.140243, 1.117555, 1.028648, 0, 0.8078431, 1, 1,
0.1411552, -2.027479, 1.871956, 0, 0.8039216, 1, 1,
0.1424625, -0.7882617, 1.364825, 0, 0.7960784, 1, 1,
0.1461092, 0.4586129, 1.538366, 0, 0.7882353, 1, 1,
0.1505657, 2.656713, -0.07354415, 0, 0.7843137, 1, 1,
0.1522095, 0.2417405, 1.710215, 0, 0.7764706, 1, 1,
0.1523041, 0.272046, 0.2264278, 0, 0.772549, 1, 1,
0.1558928, -1.792167, 0.5453767, 0, 0.7647059, 1, 1,
0.1580525, -0.09375051, 1.956872, 0, 0.7607843, 1, 1,
0.1597699, 0.9312754, 0.03866204, 0, 0.7529412, 1, 1,
0.1613825, 0.1665935, 0.373661, 0, 0.7490196, 1, 1,
0.1657916, -0.3165413, 1.742254, 0, 0.7411765, 1, 1,
0.1677077, -1.084983, 1.000308, 0, 0.7372549, 1, 1,
0.1692563, 0.04703651, 2.200861, 0, 0.7294118, 1, 1,
0.1703197, -0.4797466, 1.834932, 0, 0.7254902, 1, 1,
0.1706115, -0.8896831, 2.803183, 0, 0.7176471, 1, 1,
0.1720552, -1.422652, 4.602299, 0, 0.7137255, 1, 1,
0.1723653, -0.8772448, 3.901352, 0, 0.7058824, 1, 1,
0.174098, 0.4083203, 0.08322737, 0, 0.6980392, 1, 1,
0.1803508, -0.5189096, 1.645543, 0, 0.6941177, 1, 1,
0.1854445, -0.216494, 3.028832, 0, 0.6862745, 1, 1,
0.1870602, 1.209931, -1.33864, 0, 0.682353, 1, 1,
0.1884352, -1.747438, 4.269151, 0, 0.6745098, 1, 1,
0.1919644, 0.2874446, 0.6186943, 0, 0.6705883, 1, 1,
0.1937213, -1.061115, 1.809765, 0, 0.6627451, 1, 1,
0.1992587, 0.6774379, -0.6607344, 0, 0.6588235, 1, 1,
0.1995468, -2.116695, 3.095279, 0, 0.6509804, 1, 1,
0.2008214, -0.7335206, 2.838705, 0, 0.6470588, 1, 1,
0.2009242, 0.6648127, 1.01117, 0, 0.6392157, 1, 1,
0.2035819, -1.020206, 4.316165, 0, 0.6352941, 1, 1,
0.2067853, -0.9283969, 2.053873, 0, 0.627451, 1, 1,
0.2074244, -1.530976, 2.587948, 0, 0.6235294, 1, 1,
0.208957, -0.2785269, 2.829871, 0, 0.6156863, 1, 1,
0.2099836, -0.9626227, 1.289543, 0, 0.6117647, 1, 1,
0.2103223, -0.03380831, 1.298814, 0, 0.6039216, 1, 1,
0.210834, 0.2607041, -0.5212709, 0, 0.5960785, 1, 1,
0.2109012, -1.378141, 2.871884, 0, 0.5921569, 1, 1,
0.211632, 1.231799, 1.780133, 0, 0.5843138, 1, 1,
0.2129993, 0.4679305, 1.045598, 0, 0.5803922, 1, 1,
0.2158865, -0.5209562, 3.457886, 0, 0.572549, 1, 1,
0.2169018, -0.140088, 2.973468, 0, 0.5686275, 1, 1,
0.2210208, -1.525916, 4.650964, 0, 0.5607843, 1, 1,
0.2231101, 0.2612025, 1.633754, 0, 0.5568628, 1, 1,
0.2247504, -0.1102078, 2.682585, 0, 0.5490196, 1, 1,
0.2248656, 0.4210505, 1.644125, 0, 0.5450981, 1, 1,
0.225946, 1.208283, -2.500834, 0, 0.5372549, 1, 1,
0.2277932, 1.149131, 0.07905595, 0, 0.5333334, 1, 1,
0.2289475, 1.595249, -1.562743, 0, 0.5254902, 1, 1,
0.2306478, -0.3416665, 0.3072006, 0, 0.5215687, 1, 1,
0.2344835, -0.6889457, 1.172316, 0, 0.5137255, 1, 1,
0.2369871, -0.5732005, 2.962467, 0, 0.509804, 1, 1,
0.2370317, -0.556502, 2.814291, 0, 0.5019608, 1, 1,
0.2385706, -0.6091864, 3.901761, 0, 0.4941176, 1, 1,
0.245119, 0.09323577, -0.1282617, 0, 0.4901961, 1, 1,
0.2514402, 0.4998125, 1.8174, 0, 0.4823529, 1, 1,
0.2550521, 0.09506626, 1.817676, 0, 0.4784314, 1, 1,
0.2584584, 0.3027533, 2.623455, 0, 0.4705882, 1, 1,
0.2613541, -0.5113789, 2.472739, 0, 0.4666667, 1, 1,
0.2632436, 0.5596155, -0.1946455, 0, 0.4588235, 1, 1,
0.2724695, 1.127039, 0.05853072, 0, 0.454902, 1, 1,
0.272662, -0.9894037, 2.561635, 0, 0.4470588, 1, 1,
0.2743969, -0.9401308, 3.367816, 0, 0.4431373, 1, 1,
0.2765521, -0.4535428, 1.892298, 0, 0.4352941, 1, 1,
0.2784529, 0.4063094, -1.842616, 0, 0.4313726, 1, 1,
0.2822625, 0.6920422, 1.670398, 0, 0.4235294, 1, 1,
0.2830871, 1.09653, 0.2838718, 0, 0.4196078, 1, 1,
0.2957592, 0.5681697, 1.673362, 0, 0.4117647, 1, 1,
0.3002852, -0.4937891, 3.324345, 0, 0.4078431, 1, 1,
0.3007725, -1.087523, 4.274041, 0, 0.4, 1, 1,
0.3069958, -2.778598, 1.73205, 0, 0.3921569, 1, 1,
0.3070504, 0.2547067, -0.2980184, 0, 0.3882353, 1, 1,
0.308657, -0.4399561, 3.28241, 0, 0.3803922, 1, 1,
0.3126428, 0.4481364, 1.567328, 0, 0.3764706, 1, 1,
0.3130596, -0.08772424, 1.082686, 0, 0.3686275, 1, 1,
0.3173155, 0.6071256, 0.8166407, 0, 0.3647059, 1, 1,
0.3192437, 0.1331678, -0.005922615, 0, 0.3568628, 1, 1,
0.3193645, 1.467483, 2.03786, 0, 0.3529412, 1, 1,
0.3234882, 0.1161284, 1.088736, 0, 0.345098, 1, 1,
0.3383973, 0.4206667, 1.318081, 0, 0.3411765, 1, 1,
0.3449661, -0.2722167, 3.421789, 0, 0.3333333, 1, 1,
0.3556651, 0.03963133, 1.414586, 0, 0.3294118, 1, 1,
0.3606455, 1.262033, 0.8574094, 0, 0.3215686, 1, 1,
0.3635508, -1.640898, 2.479589, 0, 0.3176471, 1, 1,
0.3682919, -0.1068544, -0.1664183, 0, 0.3098039, 1, 1,
0.3693405, -0.5439587, 1.854107, 0, 0.3058824, 1, 1,
0.3706553, -0.644263, 3.477268, 0, 0.2980392, 1, 1,
0.3803452, -0.03407753, 0.9926763, 0, 0.2901961, 1, 1,
0.3849888, -0.4368823, 2.199668, 0, 0.2862745, 1, 1,
0.3851045, 0.4853511, -1.099888, 0, 0.2784314, 1, 1,
0.3854514, -1.123925, 5.464812, 0, 0.2745098, 1, 1,
0.386012, 0.09154107, 2.5042, 0, 0.2666667, 1, 1,
0.3867924, -0.4869792, 1.650213, 0, 0.2627451, 1, 1,
0.387108, 0.6068197, -1.363086, 0, 0.254902, 1, 1,
0.3876907, 0.1590224, 2.809666, 0, 0.2509804, 1, 1,
0.3916414, -1.175969, 3.058437, 0, 0.2431373, 1, 1,
0.3936957, 0.009258981, 3.284539, 0, 0.2392157, 1, 1,
0.3939985, 1.15232, 0.7172776, 0, 0.2313726, 1, 1,
0.3961285, -1.100665, 2.111488, 0, 0.227451, 1, 1,
0.396951, 0.3183324, 0.9053565, 0, 0.2196078, 1, 1,
0.3971924, -0.02499667, 2.086962, 0, 0.2156863, 1, 1,
0.3978289, 1.769856, 1.656807, 0, 0.2078431, 1, 1,
0.3987901, -0.5727053, 2.909147, 0, 0.2039216, 1, 1,
0.4027173, -0.7500998, 2.230634, 0, 0.1960784, 1, 1,
0.4051697, 0.3601548, 2.052874, 0, 0.1882353, 1, 1,
0.4054716, -0.2496826, 2.574247, 0, 0.1843137, 1, 1,
0.4066328, 0.988179, -0.4717375, 0, 0.1764706, 1, 1,
0.4074719, -1.027602, 2.956825, 0, 0.172549, 1, 1,
0.4081482, -0.1455116, 4.605649, 0, 0.1647059, 1, 1,
0.4086908, -0.4528308, 2.570869, 0, 0.1607843, 1, 1,
0.4103216, -0.02743107, 1.394831, 0, 0.1529412, 1, 1,
0.4109995, 1.048333, 0.3292127, 0, 0.1490196, 1, 1,
0.4142828, 0.3273123, 0.1796669, 0, 0.1411765, 1, 1,
0.415597, -0.4484806, 2.721306, 0, 0.1372549, 1, 1,
0.4180668, 0.09137438, 0.5547621, 0, 0.1294118, 1, 1,
0.4201814, 0.9507611, 0.1571671, 0, 0.1254902, 1, 1,
0.4257701, 1.818601, 0.1365913, 0, 0.1176471, 1, 1,
0.4291386, 0.04052479, -0.2338745, 0, 0.1137255, 1, 1,
0.4297254, -0.7050996, 1.59813, 0, 0.1058824, 1, 1,
0.4319625, -1.568173, 3.452899, 0, 0.09803922, 1, 1,
0.4354273, 0.3790255, 1.217172, 0, 0.09411765, 1, 1,
0.4369148, 0.8413536, -0.1643282, 0, 0.08627451, 1, 1,
0.4376154, 0.2520386, 1.86196, 0, 0.08235294, 1, 1,
0.4402492, -1.047285, 0.682708, 0, 0.07450981, 1, 1,
0.4433846, -0.6384455, 2.978819, 0, 0.07058824, 1, 1,
0.444816, 0.9630842, 0.467824, 0, 0.0627451, 1, 1,
0.4500487, -0.5137517, 1.817491, 0, 0.05882353, 1, 1,
0.4549645, 0.2661116, 2.577368, 0, 0.05098039, 1, 1,
0.4603428, -0.3550006, 0.5182801, 0, 0.04705882, 1, 1,
0.4648331, -0.81155, 1.664872, 0, 0.03921569, 1, 1,
0.4659047, -3.446201, 3.769161, 0, 0.03529412, 1, 1,
0.4679903, -1.627225, 2.828952, 0, 0.02745098, 1, 1,
0.4689324, 0.5908765, 0.7927111, 0, 0.02352941, 1, 1,
0.4754888, -1.6339, 3.274261, 0, 0.01568628, 1, 1,
0.4762886, -1.438743, 2.563136, 0, 0.01176471, 1, 1,
0.4813787, -0.1186814, 3.056338, 0, 0.003921569, 1, 1,
0.483897, 1.045156, -0.5131304, 0.003921569, 0, 1, 1,
0.4885039, -0.4199566, 3.125874, 0.007843138, 0, 1, 1,
0.4937799, -1.4257, 0.6674676, 0.01568628, 0, 1, 1,
0.4981455, -3.352646, 2.120513, 0.01960784, 0, 1, 1,
0.502619, 0.2502347, 0.4264454, 0.02745098, 0, 1, 1,
0.5053731, -0.9115291, 2.516123, 0.03137255, 0, 1, 1,
0.5065364, 0.2014487, 0.03904743, 0.03921569, 0, 1, 1,
0.5082855, 1.322446, 1.686102, 0.04313726, 0, 1, 1,
0.5130481, -0.709421, 4.343454, 0.05098039, 0, 1, 1,
0.5134445, 0.8132033, -0.7316774, 0.05490196, 0, 1, 1,
0.5159528, 1.455712, 0.6897865, 0.0627451, 0, 1, 1,
0.5161704, 0.5453755, 0.1842244, 0.06666667, 0, 1, 1,
0.521847, -1.537358, 4.185324, 0.07450981, 0, 1, 1,
0.5325657, 0.05899785, -1.050074, 0.07843138, 0, 1, 1,
0.5344957, 0.9214997, 1.522019, 0.08627451, 0, 1, 1,
0.5360783, -2.334198, 2.668256, 0.09019608, 0, 1, 1,
0.5418468, -1.057439, 1.403615, 0.09803922, 0, 1, 1,
0.5428022, 1.296477, -0.2311508, 0.1058824, 0, 1, 1,
0.5459178, 0.4584334, -0.8528724, 0.1098039, 0, 1, 1,
0.5484416, -0.9524817, 2.060441, 0.1176471, 0, 1, 1,
0.5509267, -2.163644, 1.496615, 0.1215686, 0, 1, 1,
0.5516081, -0.03744205, 2.479085, 0.1294118, 0, 1, 1,
0.5570157, 0.996117, -1.232049, 0.1333333, 0, 1, 1,
0.5619954, -0.6238312, 2.544809, 0.1411765, 0, 1, 1,
0.5696366, 1.756473, 1.1728, 0.145098, 0, 1, 1,
0.575823, -1.187054, 4.741973, 0.1529412, 0, 1, 1,
0.5782948, -0.01510362, 0.4720104, 0.1568628, 0, 1, 1,
0.5792309, 0.6197612, -0.06958858, 0.1647059, 0, 1, 1,
0.5796288, 2.155285, 1.030203, 0.1686275, 0, 1, 1,
0.5802782, 1.673509, 0.1496998, 0.1764706, 0, 1, 1,
0.5807607, -0.1903995, 2.537379, 0.1803922, 0, 1, 1,
0.5857803, -1.044532, 0.9312441, 0.1882353, 0, 1, 1,
0.5879443, -1.320681, 2.733731, 0.1921569, 0, 1, 1,
0.5894744, 0.8951049, 0.1836754, 0.2, 0, 1, 1,
0.5900331, 0.8450382, 0.5802996, 0.2078431, 0, 1, 1,
0.5915776, 0.7489561, -0.1899849, 0.2117647, 0, 1, 1,
0.5965783, -0.799261, 0.7182242, 0.2196078, 0, 1, 1,
0.5974903, 0.6183555, 1.679335, 0.2235294, 0, 1, 1,
0.6021212, -0.1445752, 1.276616, 0.2313726, 0, 1, 1,
0.6096209, 0.8853109, 1.131665, 0.2352941, 0, 1, 1,
0.6123723, -0.09550378, 1.276836, 0.2431373, 0, 1, 1,
0.6130631, 0.9630543, 1.131138, 0.2470588, 0, 1, 1,
0.6134142, -0.09007746, 2.400642, 0.254902, 0, 1, 1,
0.6137009, -0.9758586, 4.393257, 0.2588235, 0, 1, 1,
0.6184862, -2.089057, 2.360686, 0.2666667, 0, 1, 1,
0.6270689, 0.004771259, 0.7467309, 0.2705882, 0, 1, 1,
0.6278529, 0.1785731, 0.3631403, 0.2784314, 0, 1, 1,
0.630205, 0.3745592, 1.931244, 0.282353, 0, 1, 1,
0.6375309, 0.4146196, 0.7311819, 0.2901961, 0, 1, 1,
0.6379938, 0.8352616, -0.5988448, 0.2941177, 0, 1, 1,
0.645008, -1.109953, 3.34429, 0.3019608, 0, 1, 1,
0.6463858, -1.738158, 2.791807, 0.3098039, 0, 1, 1,
0.6464317, 1.30355, -0.0657634, 0.3137255, 0, 1, 1,
0.6484116, -0.958744, 3.599002, 0.3215686, 0, 1, 1,
0.6503596, -0.03583177, 1.29109, 0.3254902, 0, 1, 1,
0.6546223, 0.9661617, 0.2495873, 0.3333333, 0, 1, 1,
0.6556923, -1.087143, 3.420812, 0.3372549, 0, 1, 1,
0.6598136, -0.05903481, 2.174314, 0.345098, 0, 1, 1,
0.6606131, 0.4341904, 2.604938, 0.3490196, 0, 1, 1,
0.6629216, -1.795517, 2.452141, 0.3568628, 0, 1, 1,
0.6659709, -1.149268, 2.504376, 0.3607843, 0, 1, 1,
0.6690894, 0.1718928, 2.099276, 0.3686275, 0, 1, 1,
0.672937, 0.4997965, -0.38373, 0.372549, 0, 1, 1,
0.6746237, 0.5972826, -0.1673619, 0.3803922, 0, 1, 1,
0.6755224, 1.584193, 0.4964447, 0.3843137, 0, 1, 1,
0.6852673, 0.312861, 1.768172, 0.3921569, 0, 1, 1,
0.6882613, 0.2242008, 1.172328, 0.3960784, 0, 1, 1,
0.6887049, -0.9081331, 1.244209, 0.4039216, 0, 1, 1,
0.6930447, -0.8259665, 1.790039, 0.4117647, 0, 1, 1,
0.6976678, 0.3072747, 1.548662, 0.4156863, 0, 1, 1,
0.6983114, 1.09186, 1.315697, 0.4235294, 0, 1, 1,
0.707692, 0.1878553, 0.5895247, 0.427451, 0, 1, 1,
0.7089366, 0.8752515, 1.350622, 0.4352941, 0, 1, 1,
0.7098215, 0.03430725, 0.8347065, 0.4392157, 0, 1, 1,
0.7112831, 0.7975104, -0.09716779, 0.4470588, 0, 1, 1,
0.712481, 1.548649, 1.150054, 0.4509804, 0, 1, 1,
0.7131029, 2.109353, 0.9621524, 0.4588235, 0, 1, 1,
0.7195787, -0.6847856, 3.645159, 0.4627451, 0, 1, 1,
0.7261328, -0.04647998, 2.390397, 0.4705882, 0, 1, 1,
0.7316018, -0.5869288, 2.793883, 0.4745098, 0, 1, 1,
0.7344774, -1.394089, 0.7735239, 0.4823529, 0, 1, 1,
0.7363073, 0.9278265, 0.4292731, 0.4862745, 0, 1, 1,
0.7411187, 0.002145096, 1.663729, 0.4941176, 0, 1, 1,
0.7470288, -0.3203924, 1.6976, 0.5019608, 0, 1, 1,
0.7518246, -0.01234389, 2.45283, 0.5058824, 0, 1, 1,
0.7519403, -0.3668376, 1.487454, 0.5137255, 0, 1, 1,
0.7577099, -1.745301, 0.9588042, 0.5176471, 0, 1, 1,
0.7580928, -1.532155, 3.347815, 0.5254902, 0, 1, 1,
0.7586827, -0.3947369, 2.14555, 0.5294118, 0, 1, 1,
0.7648448, -0.4625764, 1.597201, 0.5372549, 0, 1, 1,
0.7668649, 0.991678, 1.996274, 0.5411765, 0, 1, 1,
0.7669364, 0.150615, 2.424467, 0.5490196, 0, 1, 1,
0.7736287, -0.5848255, 2.508093, 0.5529412, 0, 1, 1,
0.7757882, 0.07038248, 2.474307, 0.5607843, 0, 1, 1,
0.7850621, -1.645705, 2.525136, 0.5647059, 0, 1, 1,
0.7853531, 0.472057, -0.3500756, 0.572549, 0, 1, 1,
0.7869358, 0.7278199, 0.6902444, 0.5764706, 0, 1, 1,
0.7873667, -2.592335, 1.297143, 0.5843138, 0, 1, 1,
0.8090307, 0.05468114, 1.099761, 0.5882353, 0, 1, 1,
0.8091726, -0.7518824, 2.808386, 0.5960785, 0, 1, 1,
0.8093267, -2.057142, -0.1838898, 0.6039216, 0, 1, 1,
0.8115327, 0.5108557, -0.348143, 0.6078432, 0, 1, 1,
0.8190389, -0.447919, 1.083367, 0.6156863, 0, 1, 1,
0.8193092, 0.1681853, -0.3101114, 0.6196079, 0, 1, 1,
0.8233004, -0.7803956, 2.527318, 0.627451, 0, 1, 1,
0.8244292, 1.443607, -0.04536371, 0.6313726, 0, 1, 1,
0.8300179, -0.8394955, 1.317598, 0.6392157, 0, 1, 1,
0.8354375, 1.752306, 0.7155262, 0.6431373, 0, 1, 1,
0.8359427, -0.8036992, 2.357475, 0.6509804, 0, 1, 1,
0.8375625, -0.1832334, -0.00628291, 0.654902, 0, 1, 1,
0.8470049, 1.261611, 0.5993056, 0.6627451, 0, 1, 1,
0.8509851, 0.4681693, 1.714568, 0.6666667, 0, 1, 1,
0.8560493, 1.189053, 0.474223, 0.6745098, 0, 1, 1,
0.8606615, 0.2385003, 2.88958, 0.6784314, 0, 1, 1,
0.8619127, 0.339287, 0.9925996, 0.6862745, 0, 1, 1,
0.8648864, 2.035829, 0.469938, 0.6901961, 0, 1, 1,
0.8743491, 0.3381746, 0.04192764, 0.6980392, 0, 1, 1,
0.8833712, 0.6054536, 0.2939111, 0.7058824, 0, 1, 1,
0.8837323, -1.046809, 2.408803, 0.7098039, 0, 1, 1,
0.8853427, 0.8123424, 0.9625059, 0.7176471, 0, 1, 1,
0.8866233, -0.4611234, 2.934567, 0.7215686, 0, 1, 1,
0.8920432, -0.4064231, 0.9271281, 0.7294118, 0, 1, 1,
0.8929437, -2.856938, 3.095389, 0.7333333, 0, 1, 1,
0.8944316, -0.0373765, 2.315023, 0.7411765, 0, 1, 1,
0.8966066, -0.7648867, 3.397534, 0.7450981, 0, 1, 1,
0.8991995, 1.837428, 2.140911, 0.7529412, 0, 1, 1,
0.9042999, -0.8289259, 0.6262242, 0.7568628, 0, 1, 1,
0.9051741, 0.06089887, 2.901187, 0.7647059, 0, 1, 1,
0.9093965, 0.114327, -0.3344223, 0.7686275, 0, 1, 1,
0.9199914, 1.363254, -1.014561, 0.7764706, 0, 1, 1,
0.9200841, -0.08677457, -0.2386551, 0.7803922, 0, 1, 1,
0.9209563, 0.6487082, 2.878821, 0.7882353, 0, 1, 1,
0.9252189, 0.3072498, 0.07771134, 0.7921569, 0, 1, 1,
0.9258817, -1.168177, 1.090832, 0.8, 0, 1, 1,
0.9282201, -0.5932114, 1.353466, 0.8078431, 0, 1, 1,
0.9303532, -0.3345251, 1.52112, 0.8117647, 0, 1, 1,
0.9360169, 1.163932, 2.408129, 0.8196079, 0, 1, 1,
0.9386236, 0.2045045, 1.071708, 0.8235294, 0, 1, 1,
0.9411558, -0.4821238, 0.02903957, 0.8313726, 0, 1, 1,
0.9420547, 0.7622486, 1.564634, 0.8352941, 0, 1, 1,
0.9450756, 0.4214105, 2.246997, 0.8431373, 0, 1, 1,
0.9451221, 1.916785, 0.6221095, 0.8470588, 0, 1, 1,
0.9454229, 0.1469079, 2.813771, 0.854902, 0, 1, 1,
0.9475237, -0.3830874, 1.53897, 0.8588235, 0, 1, 1,
0.9478775, -2.06547, 2.079883, 0.8666667, 0, 1, 1,
0.9529294, -0.07153022, 2.842801, 0.8705882, 0, 1, 1,
0.9547848, 1.666942, 1.241021, 0.8784314, 0, 1, 1,
0.9625881, -0.9391949, 1.69186, 0.8823529, 0, 1, 1,
0.9703551, 0.3989199, 0.7374207, 0.8901961, 0, 1, 1,
0.973467, -0.8165019, 1.035652, 0.8941177, 0, 1, 1,
0.9753848, 0.6664801, 0.4313033, 0.9019608, 0, 1, 1,
0.9804428, 0.2667003, 2.194538, 0.9098039, 0, 1, 1,
0.9900758, -0.06570249, 3.056849, 0.9137255, 0, 1, 1,
0.9914641, 0.4755877, -1.025443, 0.9215686, 0, 1, 1,
0.9979848, -0.2743854, 1.096812, 0.9254902, 0, 1, 1,
0.9995781, -1.260578, 2.827617, 0.9333333, 0, 1, 1,
1.00156, -0.3626429, 1.707454, 0.9372549, 0, 1, 1,
1.002941, 0.3026743, -0.6902446, 0.945098, 0, 1, 1,
1.011775, 0.938985, 1.673116, 0.9490196, 0, 1, 1,
1.014571, 0.2469036, 0.2698992, 0.9568627, 0, 1, 1,
1.01733, 2.943065, 1.850835, 0.9607843, 0, 1, 1,
1.018924, -0.04456906, 2.068649, 0.9686275, 0, 1, 1,
1.02107, -0.004817753, 1.767265, 0.972549, 0, 1, 1,
1.025605, -0.09758719, 1.538294, 0.9803922, 0, 1, 1,
1.033587, 1.213868, 1.054829, 0.9843137, 0, 1, 1,
1.033596, 0.5547202, 0.2745682, 0.9921569, 0, 1, 1,
1.043169, 0.07834451, 1.400487, 0.9960784, 0, 1, 1,
1.047759, 0.6723974, 0.6296337, 1, 0, 0.9960784, 1,
1.058114, 0.1551614, 1.136572, 1, 0, 0.9882353, 1,
1.066468, 0.1600923, 1.367643, 1, 0, 0.9843137, 1,
1.067866, 0.01385715, 1.769411, 1, 0, 0.9764706, 1,
1.075146, -0.9321528, 1.52849, 1, 0, 0.972549, 1,
1.075925, -0.899047, 2.690095, 1, 0, 0.9647059, 1,
1.07726, 0.9828429, 0.3549532, 1, 0, 0.9607843, 1,
1.077313, -0.237544, 0.1370174, 1, 0, 0.9529412, 1,
1.082521, -0.7568471, 2.14634, 1, 0, 0.9490196, 1,
1.091286, -0.729629, 2.886851, 1, 0, 0.9411765, 1,
1.092071, -0.02083369, 0.9815992, 1, 0, 0.9372549, 1,
1.096842, 1.671547, -0.009735059, 1, 0, 0.9294118, 1,
1.099625, -0.3472805, 1.043614, 1, 0, 0.9254902, 1,
1.104119, -1.754714, 2.070495, 1, 0, 0.9176471, 1,
1.109545, -0.8025271, 4.064765, 1, 0, 0.9137255, 1,
1.117546, 1.065931, 2.012615, 1, 0, 0.9058824, 1,
1.117787, 1.599479, 1.067763, 1, 0, 0.9019608, 1,
1.125244, -0.7456583, 2.132177, 1, 0, 0.8941177, 1,
1.132806, -1.147015, 1.291965, 1, 0, 0.8862745, 1,
1.133729, -0.1399573, 2.209494, 1, 0, 0.8823529, 1,
1.136148, -1.577468, 1.186281, 1, 0, 0.8745098, 1,
1.145464, -1.143669, 4.418913, 1, 0, 0.8705882, 1,
1.146511, 0.7863122, 0.8493069, 1, 0, 0.8627451, 1,
1.148545, 0.01219166, 2.84505, 1, 0, 0.8588235, 1,
1.157215, -0.6572693, 2.544309, 1, 0, 0.8509804, 1,
1.158318, 1.376464, 0.5929658, 1, 0, 0.8470588, 1,
1.164296, 0.540751, 1.295824, 1, 0, 0.8392157, 1,
1.165035, -0.3980819, 0.4693609, 1, 0, 0.8352941, 1,
1.16693, -1.080696, 0.5655327, 1, 0, 0.827451, 1,
1.174941, -1.439266, 2.371299, 1, 0, 0.8235294, 1,
1.17559, -0.2623919, 2.727894, 1, 0, 0.8156863, 1,
1.180733, 2.406179, 0.9620689, 1, 0, 0.8117647, 1,
1.18487, 0.1815196, 0.07035141, 1, 0, 0.8039216, 1,
1.19064, 0.8594026, 3.063766, 1, 0, 0.7960784, 1,
1.190702, -0.9046949, 3.331331, 1, 0, 0.7921569, 1,
1.195782, -0.3758455, 1.333307, 1, 0, 0.7843137, 1,
1.199049, 0.7013569, 0.8109758, 1, 0, 0.7803922, 1,
1.201038, 0.4859303, 0.06888044, 1, 0, 0.772549, 1,
1.206953, -1.10567, 1.862292, 1, 0, 0.7686275, 1,
1.214603, -1.864553, 3.621012, 1, 0, 0.7607843, 1,
1.219069, -1.21888, 1.775178, 1, 0, 0.7568628, 1,
1.221988, 0.289923, 2.135388, 1, 0, 0.7490196, 1,
1.227436, -1.070653, 2.862372, 1, 0, 0.7450981, 1,
1.227667, 1.628662, 0.870487, 1, 0, 0.7372549, 1,
1.234406, 0.2457775, -0.02724322, 1, 0, 0.7333333, 1,
1.239642, -1.117293, 1.576321, 1, 0, 0.7254902, 1,
1.245763, -0.1996447, 1.286826, 1, 0, 0.7215686, 1,
1.24815, 1.402641, 0.3575983, 1, 0, 0.7137255, 1,
1.248271, 1.151756, 0.8463745, 1, 0, 0.7098039, 1,
1.254757, -0.07487704, 0.6773764, 1, 0, 0.7019608, 1,
1.254763, -1.46315, 2.510513, 1, 0, 0.6941177, 1,
1.256414, -0.7469594, 2.546067, 1, 0, 0.6901961, 1,
1.264158, 0.4825527, 0.9476637, 1, 0, 0.682353, 1,
1.273259, 0.4895638, 2.238654, 1, 0, 0.6784314, 1,
1.280849, 1.60433, -1.29028, 1, 0, 0.6705883, 1,
1.281856, 2.103462, 1.801007, 1, 0, 0.6666667, 1,
1.282403, 0.3626214, 1.821994, 1, 0, 0.6588235, 1,
1.28314, -0.7340117, 2.151908, 1, 0, 0.654902, 1,
1.296192, 0.9136297, -0.06128591, 1, 0, 0.6470588, 1,
1.297498, -0.4481424, 3.52815, 1, 0, 0.6431373, 1,
1.300902, 2.489428, 0.4865467, 1, 0, 0.6352941, 1,
1.306309, -0.8776877, 1.448622, 1, 0, 0.6313726, 1,
1.306847, -0.4375906, 2.389177, 1, 0, 0.6235294, 1,
1.311887, -1.480667, 2.468593, 1, 0, 0.6196079, 1,
1.319773, -0.1936807, 2.663264, 1, 0, 0.6117647, 1,
1.322992, 0.3038803, 2.038749, 1, 0, 0.6078432, 1,
1.327234, 1.11388, 2.668899, 1, 0, 0.6, 1,
1.327665, 1.659566, 0.8849251, 1, 0, 0.5921569, 1,
1.333371, 1.816195, 2.064368, 1, 0, 0.5882353, 1,
1.341961, -0.508702, 0.1581414, 1, 0, 0.5803922, 1,
1.343169, -0.1424056, 0.4715686, 1, 0, 0.5764706, 1,
1.347693, -0.4250169, 1.069313, 1, 0, 0.5686275, 1,
1.348477, -1.618809, 3.779291, 1, 0, 0.5647059, 1,
1.35174, 0.4898439, 0.8426874, 1, 0, 0.5568628, 1,
1.358227, 2.001471, 0.9582604, 1, 0, 0.5529412, 1,
1.361873, -0.3051117, 1.926636, 1, 0, 0.5450981, 1,
1.371975, -2.629794, 2.366857, 1, 0, 0.5411765, 1,
1.379967, -1.039033, 2.232257, 1, 0, 0.5333334, 1,
1.382871, -0.34305, 1.328702, 1, 0, 0.5294118, 1,
1.401848, 0.4143659, 1.024179, 1, 0, 0.5215687, 1,
1.404152, 0.9887524, 1.756379, 1, 0, 0.5176471, 1,
1.41599, 0.421031, 1.054301, 1, 0, 0.509804, 1,
1.428342, 0.512442, 2.03294, 1, 0, 0.5058824, 1,
1.429003, 0.4661674, -0.05416442, 1, 0, 0.4980392, 1,
1.430942, 0.3776893, 0.1369878, 1, 0, 0.4901961, 1,
1.445807, -0.6340691, 3.278799, 1, 0, 0.4862745, 1,
1.447026, 0.7979776, 0.5048773, 1, 0, 0.4784314, 1,
1.455925, -0.2042927, 0.7027594, 1, 0, 0.4745098, 1,
1.462922, -1.065672, 1.749853, 1, 0, 0.4666667, 1,
1.466516, 0.2496901, -0.211189, 1, 0, 0.4627451, 1,
1.468101, -2.06035, 3.845007, 1, 0, 0.454902, 1,
1.470485, -0.2455592, 1.030129, 1, 0, 0.4509804, 1,
1.487593, -2.578965, 1.283316, 1, 0, 0.4431373, 1,
1.503278, -1.930121, 3.320609, 1, 0, 0.4392157, 1,
1.504991, -0.6735037, 3.12513, 1, 0, 0.4313726, 1,
1.508412, -0.774758, 2.534475, 1, 0, 0.427451, 1,
1.512677, -0.4768606, 1.959967, 1, 0, 0.4196078, 1,
1.523784, -0.07726453, 2.537471, 1, 0, 0.4156863, 1,
1.528937, 0.1436766, 2.244889, 1, 0, 0.4078431, 1,
1.52998, -0.1908187, 0.4480853, 1, 0, 0.4039216, 1,
1.537892, 0.1119473, 3.102946, 1, 0, 0.3960784, 1,
1.53908, 0.2725578, 1.880461, 1, 0, 0.3882353, 1,
1.539989, 0.9027171, 1.648938, 1, 0, 0.3843137, 1,
1.549818, -2.262036, 2.236622, 1, 0, 0.3764706, 1,
1.572249, 1.64577, 0.019571, 1, 0, 0.372549, 1,
1.576342, 1.117692, 0.9271846, 1, 0, 0.3647059, 1,
1.585218, 0.9048121, -0.1378124, 1, 0, 0.3607843, 1,
1.589484, -0.4863121, 1.407757, 1, 0, 0.3529412, 1,
1.594437, 1.587783, 2.014402, 1, 0, 0.3490196, 1,
1.605265, -0.7559801, 3.762764, 1, 0, 0.3411765, 1,
1.613589, 0.6630939, 0.3738198, 1, 0, 0.3372549, 1,
1.614374, -0.04728414, 1.22076, 1, 0, 0.3294118, 1,
1.621767, -0.2403035, 1.079549, 1, 0, 0.3254902, 1,
1.626451, -2.338318, 3.161275, 1, 0, 0.3176471, 1,
1.629234, 1.345485, 3.359383, 1, 0, 0.3137255, 1,
1.638632, -0.1032164, 3.372649, 1, 0, 0.3058824, 1,
1.638756, -0.7193366, 2.144174, 1, 0, 0.2980392, 1,
1.641938, -1.580565, 2.633415, 1, 0, 0.2941177, 1,
1.661288, 0.3517364, 0.5193582, 1, 0, 0.2862745, 1,
1.668784, 0.2585187, 1.752702, 1, 0, 0.282353, 1,
1.681255, 0.01644126, 3.122783, 1, 0, 0.2745098, 1,
1.705512, -1.287054, 1.875836, 1, 0, 0.2705882, 1,
1.715273, 0.4831846, 0.5648426, 1, 0, 0.2627451, 1,
1.72373, -0.7562951, 2.637372, 1, 0, 0.2588235, 1,
1.753865, -2.366382, 1.912925, 1, 0, 0.2509804, 1,
1.767493, 1.439764, 1.019501, 1, 0, 0.2470588, 1,
1.78136, -0.3205189, 3.197008, 1, 0, 0.2392157, 1,
1.781476, -0.8994108, 2.135103, 1, 0, 0.2352941, 1,
1.78201, -0.7045492, 1.115939, 1, 0, 0.227451, 1,
1.802001, 1.493544, -0.3485932, 1, 0, 0.2235294, 1,
1.820319, 1.298129, 2.571115, 1, 0, 0.2156863, 1,
1.828992, 0.9628887, 1.412664, 1, 0, 0.2117647, 1,
1.84145, 0.2548768, 1.458099, 1, 0, 0.2039216, 1,
1.847255, 0.3133199, 1.213242, 1, 0, 0.1960784, 1,
1.859629, -0.3342757, 0.7197819, 1, 0, 0.1921569, 1,
1.864233, -0.7472374, 1.232576, 1, 0, 0.1843137, 1,
1.866105, 0.1277042, 1.849187, 1, 0, 0.1803922, 1,
1.867289, -0.1231265, 1.51857, 1, 0, 0.172549, 1,
1.886463, -0.0743615, 2.628559, 1, 0, 0.1686275, 1,
1.901501, 0.09492294, 1.370056, 1, 0, 0.1607843, 1,
1.903931, -1.211432, 2.08817, 1, 0, 0.1568628, 1,
1.910968, 1.147265, 0.664636, 1, 0, 0.1490196, 1,
1.915705, -0.8797846, 0.8388655, 1, 0, 0.145098, 1,
1.915813, 1.321719, 1.933833, 1, 0, 0.1372549, 1,
1.957074, 1.55217, 2.461871, 1, 0, 0.1333333, 1,
1.96986, 0.4793938, 1.079162, 1, 0, 0.1254902, 1,
1.970107, 0.7558861, 0.8576037, 1, 0, 0.1215686, 1,
1.970863, 0.8483878, 0.2861125, 1, 0, 0.1137255, 1,
2.000126, -0.1678262, 1.100649, 1, 0, 0.1098039, 1,
2.012773, -0.1038866, 2.011106, 1, 0, 0.1019608, 1,
2.015652, 0.07934453, 0.4078085, 1, 0, 0.09411765, 1,
2.0323, -2.774405, 2.4501, 1, 0, 0.09019608, 1,
2.057431, 0.5923321, 1.23576, 1, 0, 0.08235294, 1,
2.063526, -0.1419369, 1.174029, 1, 0, 0.07843138, 1,
2.084886, 0.02914529, 2.895088, 1, 0, 0.07058824, 1,
2.097605, -1.035068, 2.589583, 1, 0, 0.06666667, 1,
2.225126, -0.6645416, 2.630394, 1, 0, 0.05882353, 1,
2.264038, 1.014739, 0.8895531, 1, 0, 0.05490196, 1,
2.309289, 0.3330949, 2.022137, 1, 0, 0.04705882, 1,
2.332881, -1.530013, 1.648563, 1, 0, 0.04313726, 1,
2.334164, 0.2619429, 2.332535, 1, 0, 0.03529412, 1,
2.335504, -0.4068023, 0.03456801, 1, 0, 0.03137255, 1,
2.439678, -1.224428, 3.738333, 1, 0, 0.02352941, 1,
2.445704, 0.2947162, 2.497934, 1, 0, 0.01960784, 1,
2.639523, 0.4033585, 2.517727, 1, 0, 0.01176471, 1,
2.943519, 0.5761137, 0.03105229, 1, 0, 0.007843138, 1
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
0.05053663, -4.529181, -7.589847, 0, -0.5, 0.5, 0.5,
0.05053663, -4.529181, -7.589847, 1, -0.5, 0.5, 0.5,
0.05053663, -4.529181, -7.589847, 1, 1.5, 0.5, 0.5,
0.05053663, -4.529181, -7.589847, 0, 1.5, 0.5, 0.5
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
-3.823167, -0.2515681, -7.589847, 0, -0.5, 0.5, 0.5,
-3.823167, -0.2515681, -7.589847, 1, -0.5, 0.5, 0.5,
-3.823167, -0.2515681, -7.589847, 1, 1.5, 0.5, 0.5,
-3.823167, -0.2515681, -7.589847, 0, 1.5, 0.5, 0.5
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
-3.823167, -4.529181, -0.116487, 0, -0.5, 0.5, 0.5,
-3.823167, -4.529181, -0.116487, 1, -0.5, 0.5, 0.5,
-3.823167, -4.529181, -0.116487, 1, 1.5, 0.5, 0.5,
-3.823167, -4.529181, -0.116487, 0, 1.5, 0.5, 0.5
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
-2, -3.54204, -5.865225,
2, -3.54204, -5.865225,
-2, -3.54204, -5.865225,
-2, -3.706564, -6.152662,
-1, -3.54204, -5.865225,
-1, -3.706564, -6.152662,
0, -3.54204, -5.865225,
0, -3.706564, -6.152662,
1, -3.54204, -5.865225,
1, -3.706564, -6.152662,
2, -3.54204, -5.865225,
2, -3.706564, -6.152662
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
-2, -4.035611, -6.727536, 0, -0.5, 0.5, 0.5,
-2, -4.035611, -6.727536, 1, -0.5, 0.5, 0.5,
-2, -4.035611, -6.727536, 1, 1.5, 0.5, 0.5,
-2, -4.035611, -6.727536, 0, 1.5, 0.5, 0.5,
-1, -4.035611, -6.727536, 0, -0.5, 0.5, 0.5,
-1, -4.035611, -6.727536, 1, -0.5, 0.5, 0.5,
-1, -4.035611, -6.727536, 1, 1.5, 0.5, 0.5,
-1, -4.035611, -6.727536, 0, 1.5, 0.5, 0.5,
0, -4.035611, -6.727536, 0, -0.5, 0.5, 0.5,
0, -4.035611, -6.727536, 1, -0.5, 0.5, 0.5,
0, -4.035611, -6.727536, 1, 1.5, 0.5, 0.5,
0, -4.035611, -6.727536, 0, 1.5, 0.5, 0.5,
1, -4.035611, -6.727536, 0, -0.5, 0.5, 0.5,
1, -4.035611, -6.727536, 1, -0.5, 0.5, 0.5,
1, -4.035611, -6.727536, 1, 1.5, 0.5, 0.5,
1, -4.035611, -6.727536, 0, 1.5, 0.5, 0.5,
2, -4.035611, -6.727536, 0, -0.5, 0.5, 0.5,
2, -4.035611, -6.727536, 1, -0.5, 0.5, 0.5,
2, -4.035611, -6.727536, 1, 1.5, 0.5, 0.5,
2, -4.035611, -6.727536, 0, 1.5, 0.5, 0.5
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
-2.929235, -3, -5.865225,
-2.929235, 2, -5.865225,
-2.929235, -3, -5.865225,
-3.078224, -3, -6.152662,
-2.929235, -2, -5.865225,
-3.078224, -2, -6.152662,
-2.929235, -1, -5.865225,
-3.078224, -1, -6.152662,
-2.929235, 0, -5.865225,
-3.078224, 0, -6.152662,
-2.929235, 1, -5.865225,
-3.078224, 1, -6.152662,
-2.929235, 2, -5.865225,
-3.078224, 2, -6.152662
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
-3.376201, -3, -6.727536, 0, -0.5, 0.5, 0.5,
-3.376201, -3, -6.727536, 1, -0.5, 0.5, 0.5,
-3.376201, -3, -6.727536, 1, 1.5, 0.5, 0.5,
-3.376201, -3, -6.727536, 0, 1.5, 0.5, 0.5,
-3.376201, -2, -6.727536, 0, -0.5, 0.5, 0.5,
-3.376201, -2, -6.727536, 1, -0.5, 0.5, 0.5,
-3.376201, -2, -6.727536, 1, 1.5, 0.5, 0.5,
-3.376201, -2, -6.727536, 0, 1.5, 0.5, 0.5,
-3.376201, -1, -6.727536, 0, -0.5, 0.5, 0.5,
-3.376201, -1, -6.727536, 1, -0.5, 0.5, 0.5,
-3.376201, -1, -6.727536, 1, 1.5, 0.5, 0.5,
-3.376201, -1, -6.727536, 0, 1.5, 0.5, 0.5,
-3.376201, 0, -6.727536, 0, -0.5, 0.5, 0.5,
-3.376201, 0, -6.727536, 1, -0.5, 0.5, 0.5,
-3.376201, 0, -6.727536, 1, 1.5, 0.5, 0.5,
-3.376201, 0, -6.727536, 0, 1.5, 0.5, 0.5,
-3.376201, 1, -6.727536, 0, -0.5, 0.5, 0.5,
-3.376201, 1, -6.727536, 1, -0.5, 0.5, 0.5,
-3.376201, 1, -6.727536, 1, 1.5, 0.5, 0.5,
-3.376201, 1, -6.727536, 0, 1.5, 0.5, 0.5,
-3.376201, 2, -6.727536, 0, -0.5, 0.5, 0.5,
-3.376201, 2, -6.727536, 1, -0.5, 0.5, 0.5,
-3.376201, 2, -6.727536, 1, 1.5, 0.5, 0.5,
-3.376201, 2, -6.727536, 0, 1.5, 0.5, 0.5
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
-2.929235, -3.54204, -4,
-2.929235, -3.54204, 4,
-2.929235, -3.54204, -4,
-3.078224, -3.706564, -4,
-2.929235, -3.54204, -2,
-3.078224, -3.706564, -2,
-2.929235, -3.54204, 0,
-3.078224, -3.706564, 0,
-2.929235, -3.54204, 2,
-3.078224, -3.706564, 2,
-2.929235, -3.54204, 4,
-3.078224, -3.706564, 4
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
-3.376201, -4.035611, -4, 0, -0.5, 0.5, 0.5,
-3.376201, -4.035611, -4, 1, -0.5, 0.5, 0.5,
-3.376201, -4.035611, -4, 1, 1.5, 0.5, 0.5,
-3.376201, -4.035611, -4, 0, 1.5, 0.5, 0.5,
-3.376201, -4.035611, -2, 0, -0.5, 0.5, 0.5,
-3.376201, -4.035611, -2, 1, -0.5, 0.5, 0.5,
-3.376201, -4.035611, -2, 1, 1.5, 0.5, 0.5,
-3.376201, -4.035611, -2, 0, 1.5, 0.5, 0.5,
-3.376201, -4.035611, 0, 0, -0.5, 0.5, 0.5,
-3.376201, -4.035611, 0, 1, -0.5, 0.5, 0.5,
-3.376201, -4.035611, 0, 1, 1.5, 0.5, 0.5,
-3.376201, -4.035611, 0, 0, 1.5, 0.5, 0.5,
-3.376201, -4.035611, 2, 0, -0.5, 0.5, 0.5,
-3.376201, -4.035611, 2, 1, -0.5, 0.5, 0.5,
-3.376201, -4.035611, 2, 1, 1.5, 0.5, 0.5,
-3.376201, -4.035611, 2, 0, 1.5, 0.5, 0.5,
-3.376201, -4.035611, 4, 0, -0.5, 0.5, 0.5,
-3.376201, -4.035611, 4, 1, -0.5, 0.5, 0.5,
-3.376201, -4.035611, 4, 1, 1.5, 0.5, 0.5,
-3.376201, -4.035611, 4, 0, 1.5, 0.5, 0.5
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
-2.929235, -3.54204, -5.865225,
-2.929235, 3.038904, -5.865225,
-2.929235, -3.54204, 5.632251,
-2.929235, 3.038904, 5.632251,
-2.929235, -3.54204, -5.865225,
-2.929235, -3.54204, 5.632251,
-2.929235, 3.038904, -5.865225,
-2.929235, 3.038904, 5.632251,
-2.929235, -3.54204, -5.865225,
3.030308, -3.54204, -5.865225,
-2.929235, -3.54204, 5.632251,
3.030308, -3.54204, 5.632251,
-2.929235, 3.038904, -5.865225,
3.030308, 3.038904, -5.865225,
-2.929235, 3.038904, 5.632251,
3.030308, 3.038904, 5.632251,
3.030308, -3.54204, -5.865225,
3.030308, 3.038904, -5.865225,
3.030308, -3.54204, 5.632251,
3.030308, 3.038904, 5.632251,
3.030308, -3.54204, -5.865225,
3.030308, -3.54204, 5.632251,
3.030308, 3.038904, -5.865225,
3.030308, 3.038904, 5.632251
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
var radius = 7.756828;
var distance = 34.51101;
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
mvMatrix.translate( -0.05053663, 0.2515681, 0.116487 );
mvMatrix.scale( 1.407295, 1.274412, 0.72945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51101);
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
methoprene<-read.table("methoprene.xyz")
```

```
## Error in read.table("methoprene.xyz"): no lines available in input
```

```r
x<-methoprene$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
```

```r
y<-methoprene$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
```

```r
z<-methoprene$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoprene' not found
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
-2.842446, 0.3913537, -2.89948, 0, 0, 1, 1, 1,
-2.792293, -0.03606127, -1.503837, 1, 0, 0, 1, 1,
-2.595838, -0.3132778, -1.905392, 1, 0, 0, 1, 1,
-2.584749, 1.394349, -2.196777, 1, 0, 0, 1, 1,
-2.474262, -0.966938, -1.829527, 1, 0, 0, 1, 1,
-2.39759, -0.3953582, -1.470983, 1, 0, 0, 1, 1,
-2.365087, -0.3274718, -1.597141, 0, 0, 0, 1, 1,
-2.324756, 0.3568502, -0.8016493, 0, 0, 0, 1, 1,
-2.207921, -0.7330668, -2.042804, 0, 0, 0, 1, 1,
-2.206236, -0.1709353, -3.289784, 0, 0, 0, 1, 1,
-2.189139, 0.7033435, -2.469643, 0, 0, 0, 1, 1,
-2.180955, 0.4084135, -3.097117, 0, 0, 0, 1, 1,
-2.164945, 0.1059501, -1.365409, 0, 0, 0, 1, 1,
-2.152987, -0.8121325, -3.008912, 1, 1, 1, 1, 1,
-2.123258, 0.830636, -1.018582, 1, 1, 1, 1, 1,
-2.07571, -1.141327, -2.885473, 1, 1, 1, 1, 1,
-2.010368, 2.100184, -1.501097, 1, 1, 1, 1, 1,
-1.989921, 0.4229428, -2.171702, 1, 1, 1, 1, 1,
-1.975175, 1.710129, 0.4584388, 1, 1, 1, 1, 1,
-1.972742, -0.8500379, -0.3616859, 1, 1, 1, 1, 1,
-1.965035, 0.02339656, -1.584026, 1, 1, 1, 1, 1,
-1.943085, -0.4800981, -1.582419, 1, 1, 1, 1, 1,
-1.905421, 0.1182478, -1.258829, 1, 1, 1, 1, 1,
-1.883344, -0.4780581, -1.429308, 1, 1, 1, 1, 1,
-1.867082, 0.5868444, -0.5564921, 1, 1, 1, 1, 1,
-1.85162, -0.6218375, -1.617066, 1, 1, 1, 1, 1,
-1.850302, 0.8740008, -1.249937, 1, 1, 1, 1, 1,
-1.845026, 0.6115749, -1.829149, 1, 1, 1, 1, 1,
-1.80529, 0.251965, -1.160729, 0, 0, 1, 1, 1,
-1.786702, -1.284469, -1.607739, 1, 0, 0, 1, 1,
-1.781844, -0.4236253, -3.884097, 1, 0, 0, 1, 1,
-1.779117, 0.01289675, -3.819527, 1, 0, 0, 1, 1,
-1.77432, 0.1194399, -3.800038, 1, 0, 0, 1, 1,
-1.773439, -0.5872498, -0.8008752, 1, 0, 0, 1, 1,
-1.754706, 0.8134605, -2.19353, 0, 0, 0, 1, 1,
-1.74468, 0.1126881, -1.817627, 0, 0, 0, 1, 1,
-1.711022, -0.3019531, -1.855533, 0, 0, 0, 1, 1,
-1.708882, -0.6963786, -2.718122, 0, 0, 0, 1, 1,
-1.704923, 0.6926436, -0.1071911, 0, 0, 0, 1, 1,
-1.697343, 0.06604868, -1.032386, 0, 0, 0, 1, 1,
-1.688266, -1.703843, -3.062938, 0, 0, 0, 1, 1,
-1.684669, 0.0502479, -2.081279, 1, 1, 1, 1, 1,
-1.633005, 0.5549071, -0.5443308, 1, 1, 1, 1, 1,
-1.612221, -0.9571154, -1.919012, 1, 1, 1, 1, 1,
-1.609132, -1.629729, -2.737969, 1, 1, 1, 1, 1,
-1.599818, -1.060276, -2.978409, 1, 1, 1, 1, 1,
-1.590856, 0.9173566, -0.6976295, 1, 1, 1, 1, 1,
-1.571916, 0.02571036, -0.8467326, 1, 1, 1, 1, 1,
-1.558411, -0.1178171, -2.473925, 1, 1, 1, 1, 1,
-1.5435, -0.6514105, -1.580707, 1, 1, 1, 1, 1,
-1.527815, 0.7597199, -0.09010055, 1, 1, 1, 1, 1,
-1.519349, 0.6017389, 1.184872, 1, 1, 1, 1, 1,
-1.519005, 0.556061, -0.522141, 1, 1, 1, 1, 1,
-1.501369, -1.385655, -2.104496, 1, 1, 1, 1, 1,
-1.48737, 0.01831199, -2.182273, 1, 1, 1, 1, 1,
-1.484522, -1.136358, -2.026642, 1, 1, 1, 1, 1,
-1.481759, -0.79662, -0.5690237, 0, 0, 1, 1, 1,
-1.474132, 1.044431, -0.8765404, 1, 0, 0, 1, 1,
-1.472741, 1.868759, -1.177789, 1, 0, 0, 1, 1,
-1.470399, 1.396449, 0.1694422, 1, 0, 0, 1, 1,
-1.469625, 0.5467409, -1.296803, 1, 0, 0, 1, 1,
-1.467736, -1.452344, -1.076326, 1, 0, 0, 1, 1,
-1.460684, 2.21897, -0.1445802, 0, 0, 0, 1, 1,
-1.455156, -0.2695367, -0.1034136, 0, 0, 0, 1, 1,
-1.450638, -0.692064, -1.959173, 0, 0, 0, 1, 1,
-1.45038, -0.7821952, -1.964545, 0, 0, 0, 1, 1,
-1.447976, -0.2365381, -0.2263496, 0, 0, 0, 1, 1,
-1.445108, 0.1615848, -1.101673, 0, 0, 0, 1, 1,
-1.442158, 0.7536998, -0.0501717, 0, 0, 0, 1, 1,
-1.431866, 1.315883, -0.2053296, 1, 1, 1, 1, 1,
-1.427233, 0.338253, -0.1850982, 1, 1, 1, 1, 1,
-1.420374, -1.72817, -0.7089734, 1, 1, 1, 1, 1,
-1.381868, -1.043974, -1.930196, 1, 1, 1, 1, 1,
-1.377315, -0.5784593, -2.35108, 1, 1, 1, 1, 1,
-1.375938, 0.6390682, -1.982998, 1, 1, 1, 1, 1,
-1.369019, -0.5980678, -2.376571, 1, 1, 1, 1, 1,
-1.359977, -0.9954848, -1.811239, 1, 1, 1, 1, 1,
-1.358305, -1.101768, -2.466167, 1, 1, 1, 1, 1,
-1.35277, 2.128894, -0.5568083, 1, 1, 1, 1, 1,
-1.348974, 0.5927718, 0.2751421, 1, 1, 1, 1, 1,
-1.334506, -0.2115935, -1.021873, 1, 1, 1, 1, 1,
-1.3217, 1.546825, -1.660862, 1, 1, 1, 1, 1,
-1.316845, -1.101508, -1.042912, 1, 1, 1, 1, 1,
-1.316692, -0.8194689, -2.967249, 1, 1, 1, 1, 1,
-1.310134, 1.822972, -0.2825177, 0, 0, 1, 1, 1,
-1.304568, -1.798036, -0.6063703, 1, 0, 0, 1, 1,
-1.281024, -0.6209636, -0.6208797, 1, 0, 0, 1, 1,
-1.273825, -0.04276012, -2.023465, 1, 0, 0, 1, 1,
-1.265325, 0.7203042, -1.269479, 1, 0, 0, 1, 1,
-1.263996, 2.180018, -1.56661, 1, 0, 0, 1, 1,
-1.26393, -0.2606547, -2.011394, 0, 0, 0, 1, 1,
-1.263874, -2.05307, -2.725187, 0, 0, 0, 1, 1,
-1.252711, 0.2928887, -0.393836, 0, 0, 0, 1, 1,
-1.246193, -1.536804, -4.341842, 0, 0, 0, 1, 1,
-1.244669, 0.192785, -0.9734144, 0, 0, 0, 1, 1,
-1.23452, -0.535058, -1.804465, 0, 0, 0, 1, 1,
-1.230265, -1.676393, -1.607197, 0, 0, 0, 1, 1,
-1.221034, -0.3394746, -2.106251, 1, 1, 1, 1, 1,
-1.206247, 0.2894946, -3.415086, 1, 1, 1, 1, 1,
-1.199654, 0.2348832, -1.2712, 1, 1, 1, 1, 1,
-1.196373, 0.1603212, -1.847938, 1, 1, 1, 1, 1,
-1.195577, -1.134733, -3.07188, 1, 1, 1, 1, 1,
-1.194899, 0.5369951, -1.908355, 1, 1, 1, 1, 1,
-1.183753, 0.9977776, -0.4627622, 1, 1, 1, 1, 1,
-1.178676, 0.1860629, -0.6467278, 1, 1, 1, 1, 1,
-1.178336, 1.100032, -2.563201, 1, 1, 1, 1, 1,
-1.172873, -0.1554082, -0.5963962, 1, 1, 1, 1, 1,
-1.16562, 0.1657504, -0.922991, 1, 1, 1, 1, 1,
-1.15601, -1.050305, -3.040929, 1, 1, 1, 1, 1,
-1.150136, -0.2343983, -2.319987, 1, 1, 1, 1, 1,
-1.147351, 0.2065051, -0.4134378, 1, 1, 1, 1, 1,
-1.140267, -0.5535773, -2.334193, 1, 1, 1, 1, 1,
-1.134154, 0.7472562, -0.6206183, 0, 0, 1, 1, 1,
-1.129691, -1.135233, -1.505298, 1, 0, 0, 1, 1,
-1.126416, -0.3013205, -2.147967, 1, 0, 0, 1, 1,
-1.11105, 0.08570103, -1.288789, 1, 0, 0, 1, 1,
-1.104977, -0.1695674, -0.8049249, 1, 0, 0, 1, 1,
-1.102272, 1.181542, -1.489955, 1, 0, 0, 1, 1,
-1.101068, 0.8984886, 0.5241282, 0, 0, 0, 1, 1,
-1.091508, -0.0899877, -1.274408, 0, 0, 0, 1, 1,
-1.08837, -0.4027841, -2.31891, 0, 0, 0, 1, 1,
-1.087989, 0.596797, -1.129143, 0, 0, 0, 1, 1,
-1.087039, -1.229678, -1.842436, 0, 0, 0, 1, 1,
-1.086496, 1.66998, -0.9804834, 0, 0, 0, 1, 1,
-1.086027, -1.425405, -2.366468, 0, 0, 0, 1, 1,
-1.08536, -0.09526853, -1.623382, 1, 1, 1, 1, 1,
-1.084374, -1.980484, -3.779693, 1, 1, 1, 1, 1,
-1.066854, 0.5038225, 0.369202, 1, 1, 1, 1, 1,
-1.058452, -0.675017, -2.422374, 1, 1, 1, 1, 1,
-1.058036, -1.618974, -2.19539, 1, 1, 1, 1, 1,
-1.056991, -0.1135519, -1.892894, 1, 1, 1, 1, 1,
-1.05387, 1.114386, 0.473424, 1, 1, 1, 1, 1,
-1.052298, -2.055749, -3.906332, 1, 1, 1, 1, 1,
-1.050835, 0.4719741, -0.3194303, 1, 1, 1, 1, 1,
-1.050319, 0.4065045, -0.3759303, 1, 1, 1, 1, 1,
-1.03838, 0.5883905, -2.708378, 1, 1, 1, 1, 1,
-1.032839, 0.2210741, -1.88119, 1, 1, 1, 1, 1,
-1.022378, 1.71924, -1.997808, 1, 1, 1, 1, 1,
-1.020039, -1.988433, -4.012903, 1, 1, 1, 1, 1,
-1.016675, -0.4762511, -0.6940287, 1, 1, 1, 1, 1,
-1.013111, 0.9416097, -1.308181, 0, 0, 1, 1, 1,
-1.010307, 0.4150972, -0.96821, 1, 0, 0, 1, 1,
-1.006931, -0.179379, -1.499223, 1, 0, 0, 1, 1,
-0.9905465, 0.7085444, 0.1484607, 1, 0, 0, 1, 1,
-0.9814223, -1.266838, -1.608895, 1, 0, 0, 1, 1,
-0.9760801, 0.7197703, 1.024089, 1, 0, 0, 1, 1,
-0.9742491, -0.9733841, -2.957543, 0, 0, 0, 1, 1,
-0.9710735, 0.7817216, -1.93471, 0, 0, 0, 1, 1,
-0.9704064, -0.3801257, -1.703588, 0, 0, 0, 1, 1,
-0.9656466, -0.5525296, -1.035233, 0, 0, 0, 1, 1,
-0.9635916, -1.851904, -3.469196, 0, 0, 0, 1, 1,
-0.956871, -0.6357439, -2.627515, 0, 0, 0, 1, 1,
-0.9547676, -0.5710696, -1.302222, 0, 0, 0, 1, 1,
-0.9503318, 0.6119662, -1.103194, 1, 1, 1, 1, 1,
-0.9480482, -0.8127695, -2.068187, 1, 1, 1, 1, 1,
-0.9379376, -0.2320684, -1.332542, 1, 1, 1, 1, 1,
-0.9367472, 0.8005565, -0.9072498, 1, 1, 1, 1, 1,
-0.9300097, -0.1356975, -1.985171, 1, 1, 1, 1, 1,
-0.9266688, 0.0429082, -0.6068132, 1, 1, 1, 1, 1,
-0.9184678, 0.510533, -1.983469, 1, 1, 1, 1, 1,
-0.9146053, -0.09579051, -0.3895522, 1, 1, 1, 1, 1,
-0.9095296, 0.1574894, -1.366464, 1, 1, 1, 1, 1,
-0.9086187, -0.5501835, -1.813741, 1, 1, 1, 1, 1,
-0.9069623, -1.355379, -2.683951, 1, 1, 1, 1, 1,
-0.9066763, 0.8334819, -2.205784, 1, 1, 1, 1, 1,
-0.9043579, -0.284714, -1.53171, 1, 1, 1, 1, 1,
-0.9021091, 0.7911068, -0.9277729, 1, 1, 1, 1, 1,
-0.8989036, -0.537089, -4.284316, 1, 1, 1, 1, 1,
-0.8977947, 0.3312873, -0.02894342, 0, 0, 1, 1, 1,
-0.8972507, 0.2249132, -0.5689116, 1, 0, 0, 1, 1,
-0.8938655, -0.3761398, -1.000767, 1, 0, 0, 1, 1,
-0.8866472, 0.5702056, -1.71322, 1, 0, 0, 1, 1,
-0.8746958, 0.3856279, -1.458344, 1, 0, 0, 1, 1,
-0.8745633, -1.455862, -2.749282, 1, 0, 0, 1, 1,
-0.8745588, 0.9112339, -0.7011939, 0, 0, 0, 1, 1,
-0.8687677, 1.811352, -1.585255, 0, 0, 0, 1, 1,
-0.8496773, 1.074192, -0.9101669, 0, 0, 0, 1, 1,
-0.8483375, 0.8391245, -2.418808, 0, 0, 0, 1, 1,
-0.8444935, -0.9272835, -1.525046, 0, 0, 0, 1, 1,
-0.840437, 0.1181613, -1.219975, 0, 0, 0, 1, 1,
-0.8347825, -0.5457846, -1.623147, 0, 0, 0, 1, 1,
-0.8339933, 1.0652, 2.145922, 1, 1, 1, 1, 1,
-0.8312311, 0.2609841, -1.207992, 1, 1, 1, 1, 1,
-0.8310862, 1.193997, -0.1868604, 1, 1, 1, 1, 1,
-0.8290974, -0.4641401, -1.892716, 1, 1, 1, 1, 1,
-0.8149133, -0.196578, -2.545747, 1, 1, 1, 1, 1,
-0.8119717, -0.2937305, -1.997587, 1, 1, 1, 1, 1,
-0.81144, 0.6489441, -0.5813779, 1, 1, 1, 1, 1,
-0.7997404, -0.09464812, -2.901615, 1, 1, 1, 1, 1,
-0.7964005, -0.2687295, -2.356532, 1, 1, 1, 1, 1,
-0.7915711, 1.835524, -1.842039, 1, 1, 1, 1, 1,
-0.7855693, 0.9146054, 1.078231, 1, 1, 1, 1, 1,
-0.7850016, -1.321718, -2.764183, 1, 1, 1, 1, 1,
-0.781422, -1.195248, -1.735659, 1, 1, 1, 1, 1,
-0.7776538, -0.5199689, -1.833228, 1, 1, 1, 1, 1,
-0.7728733, 0.1011944, -1.371375, 1, 1, 1, 1, 1,
-0.7704287, -1.391882, -1.972481, 0, 0, 1, 1, 1,
-0.7674592, -1.65568, -1.696593, 1, 0, 0, 1, 1,
-0.7660394, -2.694001, -2.898185, 1, 0, 0, 1, 1,
-0.7654038, 0.921399, 0.5393935, 1, 0, 0, 1, 1,
-0.7522526, 0.5416315, -0.7777912, 1, 0, 0, 1, 1,
-0.7495157, 0.04787611, -2.572075, 1, 0, 0, 1, 1,
-0.747218, 0.6606472, -1.339172, 0, 0, 0, 1, 1,
-0.746211, -0.8143131, -3.102747, 0, 0, 0, 1, 1,
-0.7396381, 0.2036131, -2.379481, 0, 0, 0, 1, 1,
-0.737751, -0.2536964, -1.544135, 0, 0, 0, 1, 1,
-0.7363551, 0.3576322, -1.67165, 0, 0, 0, 1, 1,
-0.7345793, 1.761703, 0.6268038, 0, 0, 0, 1, 1,
-0.7331895, 0.9784319, -2.010079, 0, 0, 0, 1, 1,
-0.7316284, 0.1464537, -0.3294944, 1, 1, 1, 1, 1,
-0.7186013, 0.963123, -1.351624, 1, 1, 1, 1, 1,
-0.7176938, 1.311677, -0.5168226, 1, 1, 1, 1, 1,
-0.7171548, -0.4117557, -1.889237, 1, 1, 1, 1, 1,
-0.715038, -0.4872497, -2.115745, 1, 1, 1, 1, 1,
-0.7120196, -1.599222, -1.155956, 1, 1, 1, 1, 1,
-0.7102948, -0.3553836, -0.3108267, 1, 1, 1, 1, 1,
-0.7091768, -0.7318127, -2.673782, 1, 1, 1, 1, 1,
-0.7085512, -0.4415689, -0.8575779, 1, 1, 1, 1, 1,
-0.7068956, -2.168958, -1.991232, 1, 1, 1, 1, 1,
-0.7044541, 0.574654, -0.1008628, 1, 1, 1, 1, 1,
-0.6952844, 0.9102043, 1.28093, 1, 1, 1, 1, 1,
-0.6946794, -0.776556, -1.609664, 1, 1, 1, 1, 1,
-0.6873184, -0.1880781, -1.963523, 1, 1, 1, 1, 1,
-0.684717, -0.5485742, -4.993093, 1, 1, 1, 1, 1,
-0.6764587, -0.8486646, -2.338443, 0, 0, 1, 1, 1,
-0.6762707, -2.10997, -3.473289, 1, 0, 0, 1, 1,
-0.6724913, -1.195339, -2.550678, 1, 0, 0, 1, 1,
-0.6693798, 0.5324317, -1.915589, 1, 0, 0, 1, 1,
-0.6684911, -1.212569, -0.9297557, 1, 0, 0, 1, 1,
-0.6684789, 0.8952273, -0.583806, 1, 0, 0, 1, 1,
-0.6636514, 0.5776879, 0.3926199, 0, 0, 0, 1, 1,
-0.6622335, -2.46818, -3.265175, 0, 0, 0, 1, 1,
-0.6616014, -0.441871, -3.984965, 0, 0, 0, 1, 1,
-0.6614643, 0.3996279, -1.354828, 0, 0, 0, 1, 1,
-0.6608581, 0.5691166, -1.037006, 0, 0, 0, 1, 1,
-0.6537176, -1.728888, -2.396846, 0, 0, 0, 1, 1,
-0.6528836, 0.3696616, -1.302663, 0, 0, 0, 1, 1,
-0.6513404, -0.0358411, -2.657543, 1, 1, 1, 1, 1,
-0.6512869, -0.3880242, -0.1635252, 1, 1, 1, 1, 1,
-0.6493325, -0.2159473, -0.4182895, 1, 1, 1, 1, 1,
-0.6468153, -0.2043944, -1.864251, 1, 1, 1, 1, 1,
-0.6378986, 0.9748887, -1.372153, 1, 1, 1, 1, 1,
-0.6361899, -0.2934918, -0.7999115, 1, 1, 1, 1, 1,
-0.6353962, -0.07488744, -1.692573, 1, 1, 1, 1, 1,
-0.6296425, -0.3627018, -1.946559, 1, 1, 1, 1, 1,
-0.6280702, -0.0579423, -1.912203, 1, 1, 1, 1, 1,
-0.6277718, -0.3506557, -1.265977, 1, 1, 1, 1, 1,
-0.6234898, 1.354244, 0.5175986, 1, 1, 1, 1, 1,
-0.6227283, 0.846961, -0.7188035, 1, 1, 1, 1, 1,
-0.6187246, -0.6497718, -2.870532, 1, 1, 1, 1, 1,
-0.6125404, -0.9147733, -1.591644, 1, 1, 1, 1, 1,
-0.6107467, 1.75233, -0.1806315, 1, 1, 1, 1, 1,
-0.6045607, 0.1350528, -0.7270043, 0, 0, 1, 1, 1,
-0.6016095, -0.2268869, -2.652416, 1, 0, 0, 1, 1,
-0.6013883, 0.06235185, 0.3633259, 1, 0, 0, 1, 1,
-0.6008326, 0.1690114, -1.02413, 1, 0, 0, 1, 1,
-0.5977605, -0.2239797, -3.048787, 1, 0, 0, 1, 1,
-0.5960214, -1.414701, -2.6927, 1, 0, 0, 1, 1,
-0.5908712, 1.767533, -0.0770008, 0, 0, 0, 1, 1,
-0.5870805, 0.2128602, -2.385019, 0, 0, 0, 1, 1,
-0.5798216, 0.7440781, -0.2210375, 0, 0, 0, 1, 1,
-0.579381, -1.750884, -2.529615, 0, 0, 0, 1, 1,
-0.577455, 1.287951, 1.466572, 0, 0, 0, 1, 1,
-0.5722804, -0.2637912, -1.393157, 0, 0, 0, 1, 1,
-0.5718685, -0.1977955, -0.5210484, 0, 0, 0, 1, 1,
-0.5704475, -0.6507535, -0.6566294, 1, 1, 1, 1, 1,
-0.5555519, 0.519421, -1.741508, 1, 1, 1, 1, 1,
-0.5468696, -0.4823959, -2.46804, 1, 1, 1, 1, 1,
-0.5448254, 1.180887, 0.1205813, 1, 1, 1, 1, 1,
-0.5437588, 1.395078, 0.2196401, 1, 1, 1, 1, 1,
-0.539215, 0.4327376, -0.6409004, 1, 1, 1, 1, 1,
-0.5355991, 0.01684933, -1.766166, 1, 1, 1, 1, 1,
-0.5281924, -0.7184469, -3.291684, 1, 1, 1, 1, 1,
-0.522647, -0.3536313, -2.243326, 1, 1, 1, 1, 1,
-0.5222902, -0.1591794, -1.931273, 1, 1, 1, 1, 1,
-0.5163003, 1.302159, -0.6315905, 1, 1, 1, 1, 1,
-0.5149339, 0.3154041, -0.6700917, 1, 1, 1, 1, 1,
-0.5140091, -0.2597892, -3.0138, 1, 1, 1, 1, 1,
-0.5090428, -1.128047, -3.031551, 1, 1, 1, 1, 1,
-0.5051621, 0.3753219, -1.698434, 1, 1, 1, 1, 1,
-0.5035559, 0.165707, -0.6454817, 0, 0, 1, 1, 1,
-0.5006091, 1.77631, -1.164877, 1, 0, 0, 1, 1,
-0.4968236, -0.2954135, -2.162353, 1, 0, 0, 1, 1,
-0.4912214, 0.8171124, 0.4439141, 1, 0, 0, 1, 1,
-0.4821439, 0.5416946, -0.1095305, 1, 0, 0, 1, 1,
-0.4798804, 1.390061, -0.9159999, 1, 0, 0, 1, 1,
-0.468858, 0.3828292, -0.1235916, 0, 0, 0, 1, 1,
-0.4678255, -0.2912627, -1.744145, 0, 0, 0, 1, 1,
-0.467562, 0.1243426, -0.8339194, 0, 0, 0, 1, 1,
-0.4673752, -0.1544894, -2.067497, 0, 0, 0, 1, 1,
-0.4642356, -1.530483, -1.865808, 0, 0, 0, 1, 1,
-0.4637696, 0.1746848, -2.040522, 0, 0, 0, 1, 1,
-0.4572884, -1.32936, -1.890718, 0, 0, 0, 1, 1,
-0.4571264, -1.505272, -1.905287, 1, 1, 1, 1, 1,
-0.4539881, 0.4547311, -1.099293, 1, 1, 1, 1, 1,
-0.4505309, -1.324806, -1.877922, 1, 1, 1, 1, 1,
-0.4468692, 0.469998, -0.4105745, 1, 1, 1, 1, 1,
-0.4413778, -1.343444, -3.6742, 1, 1, 1, 1, 1,
-0.4393876, 0.4476462, 0.5265571, 1, 1, 1, 1, 1,
-0.4368301, -0.9634716, -3.178568, 1, 1, 1, 1, 1,
-0.4347754, -0.1302686, -2.369399, 1, 1, 1, 1, 1,
-0.4346383, 1.747817, -0.01128499, 1, 1, 1, 1, 1,
-0.434426, 0.1286588, -0.8739184, 1, 1, 1, 1, 1,
-0.4268002, -3.355383, -3.204095, 1, 1, 1, 1, 1,
-0.4219798, 1.205774, -1.846212, 1, 1, 1, 1, 1,
-0.4187489, -0.4743822, -3.226786, 1, 1, 1, 1, 1,
-0.4149027, -0.1460261, -0.6765531, 1, 1, 1, 1, 1,
-0.413609, -1.008655, -2.173517, 1, 1, 1, 1, 1,
-0.4129174, -0.4603665, -3.402891, 0, 0, 1, 1, 1,
-0.4124057, -0.5183333, -0.8162792, 1, 0, 0, 1, 1,
-0.4094735, 1.274964, -0.498864, 1, 0, 0, 1, 1,
-0.4044644, -0.8791419, -3.624682, 1, 0, 0, 1, 1,
-0.3985645, -1.740589, -4.358653, 1, 0, 0, 1, 1,
-0.3975172, -0.5456725, -0.2269522, 1, 0, 0, 1, 1,
-0.3918841, 1.383817, 1.85671, 0, 0, 0, 1, 1,
-0.3910833, 1.111625, -1.017572, 0, 0, 0, 1, 1,
-0.3880568, -0.04783011, 0.3010328, 0, 0, 0, 1, 1,
-0.3877772, 0.5495094, -2.00787, 0, 0, 0, 1, 1,
-0.3870019, 0.3906031, -0.5573397, 0, 0, 0, 1, 1,
-0.37875, -0.4722923, -2.994337, 0, 0, 0, 1, 1,
-0.3779454, -0.6788942, -3.143164, 0, 0, 0, 1, 1,
-0.3772139, -0.3662798, -2.756214, 1, 1, 1, 1, 1,
-0.3757482, -1.204574, -1.037298, 1, 1, 1, 1, 1,
-0.37418, -0.433492, -3.893496, 1, 1, 1, 1, 1,
-0.3727798, 1.429654, -1.141245, 1, 1, 1, 1, 1,
-0.3660474, -0.2480426, -4.178862, 1, 1, 1, 1, 1,
-0.3648156, -0.2145, -0.7799276, 1, 1, 1, 1, 1,
-0.3555686, -0.3678032, -3.769851, 1, 1, 1, 1, 1,
-0.3552115, 0.2928914, -2.285208, 1, 1, 1, 1, 1,
-0.3539463, 0.5496555, -1.71305, 1, 1, 1, 1, 1,
-0.3522599, 0.5034876, -0.4945347, 1, 1, 1, 1, 1,
-0.351687, -1.154973, -1.884288, 1, 1, 1, 1, 1,
-0.3496448, -0.03282433, -0.9677222, 1, 1, 1, 1, 1,
-0.3460496, -0.0318432, -2.11308, 1, 1, 1, 1, 1,
-0.3442104, 0.01099054, -0.4759708, 1, 1, 1, 1, 1,
-0.3441461, 0.1149143, -1.031343, 1, 1, 1, 1, 1,
-0.3436762, -0.05676876, -2.258223, 0, 0, 1, 1, 1,
-0.3415403, -1.015805, -2.985785, 1, 0, 0, 1, 1,
-0.3384635, 1.679116, -0.09748974, 1, 0, 0, 1, 1,
-0.3344551, -0.218876, -3.453593, 1, 0, 0, 1, 1,
-0.3325237, -1.236421, -2.305103, 1, 0, 0, 1, 1,
-0.3306571, -1.597965, -1.765433, 1, 0, 0, 1, 1,
-0.322771, -0.2540496, -3.975062, 0, 0, 0, 1, 1,
-0.32141, -1.288043, -2.787034, 0, 0, 0, 1, 1,
-0.319649, -2.160161, -2.722868, 0, 0, 0, 1, 1,
-0.3188033, 0.6755676, -1.60863, 0, 0, 0, 1, 1,
-0.3187838, 1.839394, -0.1933512, 0, 0, 0, 1, 1,
-0.3116623, 0.1546615, -1.330182, 0, 0, 0, 1, 1,
-0.3110749, -1.623096, -4.212685, 0, 0, 0, 1, 1,
-0.3102587, -1.571075, -1.31184, 1, 1, 1, 1, 1,
-0.3083796, 0.1129074, -0.8070595, 1, 1, 1, 1, 1,
-0.3070848, -0.2869855, -2.905898, 1, 1, 1, 1, 1,
-0.3018876, 1.107687, -1.113505, 1, 1, 1, 1, 1,
-0.28725, -1.142102, -3.648685, 1, 1, 1, 1, 1,
-0.2850677, 1.406635, -0.1463989, 1, 1, 1, 1, 1,
-0.2778211, 0.07884687, -1.014143, 1, 1, 1, 1, 1,
-0.2755863, -1.106913, -3.436609, 1, 1, 1, 1, 1,
-0.2739756, -1.473946, -3.36558, 1, 1, 1, 1, 1,
-0.2713853, 1.409692, 0.864381, 1, 1, 1, 1, 1,
-0.2689708, 0.8052058, -0.9690266, 1, 1, 1, 1, 1,
-0.2677215, -1.240963, -2.091011, 1, 1, 1, 1, 1,
-0.2626023, 1.401017, 0.8909487, 1, 1, 1, 1, 1,
-0.2619446, -0.3047808, 0.3638988, 1, 1, 1, 1, 1,
-0.260552, 1.476359, -0.2249817, 1, 1, 1, 1, 1,
-0.2590058, -0.3888267, -3.134011, 0, 0, 1, 1, 1,
-0.2583817, -1.5166, -3.47158, 1, 0, 0, 1, 1,
-0.2509829, -0.2501321, -1.626552, 1, 0, 0, 1, 1,
-0.2500044, 0.1510074, -1.009032, 1, 0, 0, 1, 1,
-0.2495073, 0.1592981, 0.2840037, 1, 0, 0, 1, 1,
-0.2478033, 0.5731037, -0.3123726, 1, 0, 0, 1, 1,
-0.2419783, 0.8610929, 0.528264, 0, 0, 0, 1, 1,
-0.2380722, -1.099718, -2.952584, 0, 0, 0, 1, 1,
-0.2336958, 0.0273608, 0.2223595, 0, 0, 0, 1, 1,
-0.2332633, 0.720019, -2.881947, 0, 0, 0, 1, 1,
-0.2290067, -1.676042, -2.351825, 0, 0, 0, 1, 1,
-0.220307, 0.4708828, -1.400489, 0, 0, 0, 1, 1,
-0.2200306, -0.1959151, -1.133376, 0, 0, 0, 1, 1,
-0.2164858, -0.03915733, -2.973441, 1, 1, 1, 1, 1,
-0.2143833, 0.479614, -0.3136831, 1, 1, 1, 1, 1,
-0.2090411, 0.8450367, 1.04471, 1, 1, 1, 1, 1,
-0.2079962, 0.17748, -0.4311569, 1, 1, 1, 1, 1,
-0.2056699, -1.147046, -1.370701, 1, 1, 1, 1, 1,
-0.2011052, -2.091168, -2.883993, 1, 1, 1, 1, 1,
-0.2005081, -0.1947742, -2.975777, 1, 1, 1, 1, 1,
-0.1996418, -0.2189889, -2.063778, 1, 1, 1, 1, 1,
-0.1944722, 1.051432, 0.8599356, 1, 1, 1, 1, 1,
-0.1932213, 0.73999, 0.879329, 1, 1, 1, 1, 1,
-0.1928269, 0.1510859, -1.547332, 1, 1, 1, 1, 1,
-0.190378, -0.5028673, -1.368121, 1, 1, 1, 1, 1,
-0.1866518, -0.9804478, -3.454412, 1, 1, 1, 1, 1,
-0.1859853, 1.531088, 1.653612, 1, 1, 1, 1, 1,
-0.1832377, 0.6291208, -0.7421694, 1, 1, 1, 1, 1,
-0.1815301, -1.576682, -2.001693, 0, 0, 1, 1, 1,
-0.1777207, -0.6468744, -4.218551, 1, 0, 0, 1, 1,
-0.1739007, -0.566909, -1.22165, 1, 0, 0, 1, 1,
-0.1696037, 1.913506, -0.1748473, 1, 0, 0, 1, 1,
-0.1672441, -0.3405372, -2.018425, 1, 0, 0, 1, 1,
-0.1656149, -1.493166, -2.878581, 1, 0, 0, 1, 1,
-0.1619576, 0.2439792, -0.8324153, 0, 0, 0, 1, 1,
-0.1613483, -0.3960337, -2.697758, 0, 0, 0, 1, 1,
-0.160864, 1.138548, -0.9441974, 0, 0, 0, 1, 1,
-0.1596505, -1.078396, -3.648901, 0, 0, 0, 1, 1,
-0.1571162, -1.318997, -2.08447, 0, 0, 0, 1, 1,
-0.1563091, -0.5206295, -3.24982, 0, 0, 0, 1, 1,
-0.1544833, -0.7398298, -4.179867, 0, 0, 0, 1, 1,
-0.1537521, 2.085389, -1.69156, 1, 1, 1, 1, 1,
-0.1511883, 0.8205596, -0.2815754, 1, 1, 1, 1, 1,
-0.1450609, -0.9265413, -2.813047, 1, 1, 1, 1, 1,
-0.1441792, -1.543176, -3.316214, 1, 1, 1, 1, 1,
-0.1427484, 1.277845, 0.3615763, 1, 1, 1, 1, 1,
-0.1414195, 0.2711189, 0.4903952, 1, 1, 1, 1, 1,
-0.1411486, -0.4618656, -1.950347, 1, 1, 1, 1, 1,
-0.1403566, 0.9284345, 0.3983582, 1, 1, 1, 1, 1,
-0.1383386, 1.12278, -1.226134, 1, 1, 1, 1, 1,
-0.1345228, 0.3743999, -0.1820769, 1, 1, 1, 1, 1,
-0.1337343, 0.7909087, -0.4041666, 1, 1, 1, 1, 1,
-0.1324417, -0.205784, -1.40467, 1, 1, 1, 1, 1,
-0.1320372, -0.1759831, -1.820736, 1, 1, 1, 1, 1,
-0.1286915, 0.5306195, -0.05917717, 1, 1, 1, 1, 1,
-0.124983, -0.02845545, -1.873745, 1, 1, 1, 1, 1,
-0.1201683, -0.56168, -2.134226, 0, 0, 1, 1, 1,
-0.1166379, 0.6434713, -1.531408, 1, 0, 0, 1, 1,
-0.1160714, -1.377019, -3.489682, 1, 0, 0, 1, 1,
-0.1141891, -0.7239938, -5.298166, 1, 0, 0, 1, 1,
-0.111953, 1.832029, 0.647144, 1, 0, 0, 1, 1,
-0.111164, 0.9673078, -1.06545, 1, 0, 0, 1, 1,
-0.1094059, -0.2594415, -3.686443, 0, 0, 0, 1, 1,
-0.1088856, -1.057414, -3.807445, 0, 0, 0, 1, 1,
-0.1084019, 0.3233036, 0.06667778, 0, 0, 0, 1, 1,
-0.1061123, 0.4607794, 0.4694895, 0, 0, 0, 1, 1,
-0.1051551, 1.411699, -0.6993139, 0, 0, 0, 1, 1,
-0.1040065, -0.2595237, -3.3825, 0, 0, 0, 1, 1,
-0.1029757, -1.733335, -2.035504, 0, 0, 0, 1, 1,
-0.101272, -0.1693618, -4.011625, 1, 1, 1, 1, 1,
-0.1001677, 0.510322, -1.096091, 1, 1, 1, 1, 1,
-0.09939504, -0.5386065, -2.55789, 1, 1, 1, 1, 1,
-0.09601586, -0.4344805, -1.365558, 1, 1, 1, 1, 1,
-0.09190131, 0.9649116, 0.1474726, 1, 1, 1, 1, 1,
-0.08985005, -0.2023667, -1.535417, 1, 1, 1, 1, 1,
-0.08709087, -0.4399501, -1.878163, 1, 1, 1, 1, 1,
-0.08614732, -1.101778, -2.533642, 1, 1, 1, 1, 1,
-0.08586521, 0.1014663, -1.576619, 1, 1, 1, 1, 1,
-0.08505995, -0.3164578, -3.470412, 1, 1, 1, 1, 1,
-0.07560736, 1.206589, -0.9415858, 1, 1, 1, 1, 1,
-0.07495681, 1.038044, 0.2197511, 1, 1, 1, 1, 1,
-0.0693459, 0.116044, 0.4090323, 1, 1, 1, 1, 1,
-0.06500821, 0.3471935, -2.267726, 1, 1, 1, 1, 1,
-0.06378336, 0.05819542, 0.5951399, 1, 1, 1, 1, 1,
-0.06219866, 0.3023518, -0.1165969, 0, 0, 1, 1, 1,
-0.06001829, 0.801011, 0.9600042, 1, 0, 0, 1, 1,
-0.05655336, -1.98953, -1.765041, 1, 0, 0, 1, 1,
-0.0552709, -0.4901207, -1.185158, 1, 0, 0, 1, 1,
-0.05269344, -0.8437225, -2.606846, 1, 0, 0, 1, 1,
-0.05069453, 0.4798989, 0.2418637, 1, 0, 0, 1, 1,
-0.04918309, -0.2061065, -3.735902, 0, 0, 0, 1, 1,
-0.04715174, -0.0548868, -3.167524, 0, 0, 0, 1, 1,
-0.04622636, -0.8202848, -3.575649, 0, 0, 0, 1, 1,
-0.0460125, -0.5883013, -4.197007, 0, 0, 0, 1, 1,
-0.04452205, -0.4093526, -2.919991, 0, 0, 0, 1, 1,
-0.04290434, -0.433983, -3.431392, 0, 0, 0, 1, 1,
-0.04241952, -1.016141, -5.697786, 0, 0, 0, 1, 1,
-0.03989771, -0.260711, -3.206948, 1, 1, 1, 1, 1,
-0.03924662, -0.07303528, -4.537848, 1, 1, 1, 1, 1,
-0.03332323, -0.576093, -3.177611, 1, 1, 1, 1, 1,
-0.03278919, -1.33787, -2.545527, 1, 1, 1, 1, 1,
-0.02146259, -0.722612, -2.505797, 1, 1, 1, 1, 1,
-0.02127265, -0.386313, -3.086248, 1, 1, 1, 1, 1,
-0.01940209, -1.639311, -5.581261, 1, 1, 1, 1, 1,
-0.01338943, -0.1984336, -3.584876, 1, 1, 1, 1, 1,
-0.01317628, -0.2579822, -3.4467, 1, 1, 1, 1, 1,
-0.01191212, 0.06012364, -1.081265, 1, 1, 1, 1, 1,
-0.009556152, -0.4194338, -1.865595, 1, 1, 1, 1, 1,
-0.008375987, 0.09106628, -0.2544588, 1, 1, 1, 1, 1,
-0.006998552, 0.8124135, -0.9213779, 1, 1, 1, 1, 1,
-0.006384922, -0.1420511, -2.994516, 1, 1, 1, 1, 1,
-0.006322355, -1.171314, -3.007355, 1, 1, 1, 1, 1,
-0.004652545, -2.991029, -2.69773, 0, 0, 1, 1, 1,
-0.002256942, 0.8585806, 0.4347498, 1, 0, 0, 1, 1,
0.007012473, 0.2372281, -1.042077, 1, 0, 0, 1, 1,
0.01006146, 0.5201644, -2.37434, 1, 0, 0, 1, 1,
0.01049022, -0.1145783, 1.306677, 1, 0, 0, 1, 1,
0.01366615, 0.5496987, -0.6129142, 1, 0, 0, 1, 1,
0.01385588, 0.5643851, -1.169327, 0, 0, 0, 1, 1,
0.01637438, 0.8738572, -1.150417, 0, 0, 0, 1, 1,
0.01750916, -0.3138664, 3.066644, 0, 0, 0, 1, 1,
0.02045107, 1.312257, -2.453377, 0, 0, 0, 1, 1,
0.02168315, -0.7803163, 1.097169, 0, 0, 0, 1, 1,
0.02215806, 2.059605, -1.190704, 0, 0, 0, 1, 1,
0.02261189, -0.5774107, 4.887233, 0, 0, 0, 1, 1,
0.02760456, -0.5803002, 3.016322, 1, 1, 1, 1, 1,
0.02797956, 0.1497568, 0.007015087, 1, 1, 1, 1, 1,
0.03127031, -0.1442981, 3.140374, 1, 1, 1, 1, 1,
0.03699423, -0.02771751, 0.327447, 1, 1, 1, 1, 1,
0.03743484, -0.7316867, 2.39237, 1, 1, 1, 1, 1,
0.04452045, -0.875954, 4.375498, 1, 1, 1, 1, 1,
0.04457835, 0.5224708, 2.05223, 1, 1, 1, 1, 1,
0.04871992, -1.404814, 3.78423, 1, 1, 1, 1, 1,
0.04927274, -0.3596382, 2.577487, 1, 1, 1, 1, 1,
0.05088089, 0.178267, 0.9740864, 1, 1, 1, 1, 1,
0.0509111, 0.7225138, 0.4278094, 1, 1, 1, 1, 1,
0.05102426, -1.648279, 3.967845, 1, 1, 1, 1, 1,
0.05601999, -0.7949489, 2.206601, 1, 1, 1, 1, 1,
0.05708882, 1.876496, 0.8672855, 1, 1, 1, 1, 1,
0.06039802, 0.4253803, -1.255072, 1, 1, 1, 1, 1,
0.07646582, -1.056027, 2.464603, 0, 0, 1, 1, 1,
0.08030665, 1.654145, 0.9101771, 1, 0, 0, 1, 1,
0.08365332, -1.173707, 2.671287, 1, 0, 0, 1, 1,
0.08784707, 1.129088, 0.7370637, 1, 0, 0, 1, 1,
0.08840997, -0.4053244, 3.737782, 1, 0, 0, 1, 1,
0.09164692, -0.2011757, 3.401881, 1, 0, 0, 1, 1,
0.09441558, -0.4160763, 2.64972, 0, 0, 0, 1, 1,
0.1021768, 0.2005707, 0.2660899, 0, 0, 0, 1, 1,
0.1022881, -1.499289, 3.027667, 0, 0, 0, 1, 1,
0.1069579, -0.1806888, 1.496615, 0, 0, 0, 1, 1,
0.1076103, 0.669183, -1.011146, 0, 0, 0, 1, 1,
0.1078342, -1.822705, 2.728043, 0, 0, 0, 1, 1,
0.1084438, 0.9521033, -1.344389, 0, 0, 0, 1, 1,
0.1087229, -2.408324, 4.181997, 1, 1, 1, 1, 1,
0.1157054, -0.7615169, 4.573061, 1, 1, 1, 1, 1,
0.1181624, 0.1037062, 3.374026, 1, 1, 1, 1, 1,
0.1207036, 1.328473, 0.261835, 1, 1, 1, 1, 1,
0.1229735, -0.1907541, 3.721432, 1, 1, 1, 1, 1,
0.1238235, 0.7450369, 0.7966687, 1, 1, 1, 1, 1,
0.1253512, -0.9680365, 3.627681, 1, 1, 1, 1, 1,
0.1267231, 1.286486, -0.422671, 1, 1, 1, 1, 1,
0.1279157, 0.609753, -1.591478, 1, 1, 1, 1, 1,
0.1281317, -0.4672048, 2.355478, 1, 1, 1, 1, 1,
0.1285901, -0.04070851, 3.586311, 1, 1, 1, 1, 1,
0.1299138, -0.3948211, 2.381786, 1, 1, 1, 1, 1,
0.1320634, 0.06106021, 0.2488251, 1, 1, 1, 1, 1,
0.1383871, 1.602082, 0.4516095, 1, 1, 1, 1, 1,
0.1395888, 0.5568893, 1.594677, 1, 1, 1, 1, 1,
0.140243, 1.117555, 1.028648, 0, 0, 1, 1, 1,
0.1411552, -2.027479, 1.871956, 1, 0, 0, 1, 1,
0.1424625, -0.7882617, 1.364825, 1, 0, 0, 1, 1,
0.1461092, 0.4586129, 1.538366, 1, 0, 0, 1, 1,
0.1505657, 2.656713, -0.07354415, 1, 0, 0, 1, 1,
0.1522095, 0.2417405, 1.710215, 1, 0, 0, 1, 1,
0.1523041, 0.272046, 0.2264278, 0, 0, 0, 1, 1,
0.1558928, -1.792167, 0.5453767, 0, 0, 0, 1, 1,
0.1580525, -0.09375051, 1.956872, 0, 0, 0, 1, 1,
0.1597699, 0.9312754, 0.03866204, 0, 0, 0, 1, 1,
0.1613825, 0.1665935, 0.373661, 0, 0, 0, 1, 1,
0.1657916, -0.3165413, 1.742254, 0, 0, 0, 1, 1,
0.1677077, -1.084983, 1.000308, 0, 0, 0, 1, 1,
0.1692563, 0.04703651, 2.200861, 1, 1, 1, 1, 1,
0.1703197, -0.4797466, 1.834932, 1, 1, 1, 1, 1,
0.1706115, -0.8896831, 2.803183, 1, 1, 1, 1, 1,
0.1720552, -1.422652, 4.602299, 1, 1, 1, 1, 1,
0.1723653, -0.8772448, 3.901352, 1, 1, 1, 1, 1,
0.174098, 0.4083203, 0.08322737, 1, 1, 1, 1, 1,
0.1803508, -0.5189096, 1.645543, 1, 1, 1, 1, 1,
0.1854445, -0.216494, 3.028832, 1, 1, 1, 1, 1,
0.1870602, 1.209931, -1.33864, 1, 1, 1, 1, 1,
0.1884352, -1.747438, 4.269151, 1, 1, 1, 1, 1,
0.1919644, 0.2874446, 0.6186943, 1, 1, 1, 1, 1,
0.1937213, -1.061115, 1.809765, 1, 1, 1, 1, 1,
0.1992587, 0.6774379, -0.6607344, 1, 1, 1, 1, 1,
0.1995468, -2.116695, 3.095279, 1, 1, 1, 1, 1,
0.2008214, -0.7335206, 2.838705, 1, 1, 1, 1, 1,
0.2009242, 0.6648127, 1.01117, 0, 0, 1, 1, 1,
0.2035819, -1.020206, 4.316165, 1, 0, 0, 1, 1,
0.2067853, -0.9283969, 2.053873, 1, 0, 0, 1, 1,
0.2074244, -1.530976, 2.587948, 1, 0, 0, 1, 1,
0.208957, -0.2785269, 2.829871, 1, 0, 0, 1, 1,
0.2099836, -0.9626227, 1.289543, 1, 0, 0, 1, 1,
0.2103223, -0.03380831, 1.298814, 0, 0, 0, 1, 1,
0.210834, 0.2607041, -0.5212709, 0, 0, 0, 1, 1,
0.2109012, -1.378141, 2.871884, 0, 0, 0, 1, 1,
0.211632, 1.231799, 1.780133, 0, 0, 0, 1, 1,
0.2129993, 0.4679305, 1.045598, 0, 0, 0, 1, 1,
0.2158865, -0.5209562, 3.457886, 0, 0, 0, 1, 1,
0.2169018, -0.140088, 2.973468, 0, 0, 0, 1, 1,
0.2210208, -1.525916, 4.650964, 1, 1, 1, 1, 1,
0.2231101, 0.2612025, 1.633754, 1, 1, 1, 1, 1,
0.2247504, -0.1102078, 2.682585, 1, 1, 1, 1, 1,
0.2248656, 0.4210505, 1.644125, 1, 1, 1, 1, 1,
0.225946, 1.208283, -2.500834, 1, 1, 1, 1, 1,
0.2277932, 1.149131, 0.07905595, 1, 1, 1, 1, 1,
0.2289475, 1.595249, -1.562743, 1, 1, 1, 1, 1,
0.2306478, -0.3416665, 0.3072006, 1, 1, 1, 1, 1,
0.2344835, -0.6889457, 1.172316, 1, 1, 1, 1, 1,
0.2369871, -0.5732005, 2.962467, 1, 1, 1, 1, 1,
0.2370317, -0.556502, 2.814291, 1, 1, 1, 1, 1,
0.2385706, -0.6091864, 3.901761, 1, 1, 1, 1, 1,
0.245119, 0.09323577, -0.1282617, 1, 1, 1, 1, 1,
0.2514402, 0.4998125, 1.8174, 1, 1, 1, 1, 1,
0.2550521, 0.09506626, 1.817676, 1, 1, 1, 1, 1,
0.2584584, 0.3027533, 2.623455, 0, 0, 1, 1, 1,
0.2613541, -0.5113789, 2.472739, 1, 0, 0, 1, 1,
0.2632436, 0.5596155, -0.1946455, 1, 0, 0, 1, 1,
0.2724695, 1.127039, 0.05853072, 1, 0, 0, 1, 1,
0.272662, -0.9894037, 2.561635, 1, 0, 0, 1, 1,
0.2743969, -0.9401308, 3.367816, 1, 0, 0, 1, 1,
0.2765521, -0.4535428, 1.892298, 0, 0, 0, 1, 1,
0.2784529, 0.4063094, -1.842616, 0, 0, 0, 1, 1,
0.2822625, 0.6920422, 1.670398, 0, 0, 0, 1, 1,
0.2830871, 1.09653, 0.2838718, 0, 0, 0, 1, 1,
0.2957592, 0.5681697, 1.673362, 0, 0, 0, 1, 1,
0.3002852, -0.4937891, 3.324345, 0, 0, 0, 1, 1,
0.3007725, -1.087523, 4.274041, 0, 0, 0, 1, 1,
0.3069958, -2.778598, 1.73205, 1, 1, 1, 1, 1,
0.3070504, 0.2547067, -0.2980184, 1, 1, 1, 1, 1,
0.308657, -0.4399561, 3.28241, 1, 1, 1, 1, 1,
0.3126428, 0.4481364, 1.567328, 1, 1, 1, 1, 1,
0.3130596, -0.08772424, 1.082686, 1, 1, 1, 1, 1,
0.3173155, 0.6071256, 0.8166407, 1, 1, 1, 1, 1,
0.3192437, 0.1331678, -0.005922615, 1, 1, 1, 1, 1,
0.3193645, 1.467483, 2.03786, 1, 1, 1, 1, 1,
0.3234882, 0.1161284, 1.088736, 1, 1, 1, 1, 1,
0.3383973, 0.4206667, 1.318081, 1, 1, 1, 1, 1,
0.3449661, -0.2722167, 3.421789, 1, 1, 1, 1, 1,
0.3556651, 0.03963133, 1.414586, 1, 1, 1, 1, 1,
0.3606455, 1.262033, 0.8574094, 1, 1, 1, 1, 1,
0.3635508, -1.640898, 2.479589, 1, 1, 1, 1, 1,
0.3682919, -0.1068544, -0.1664183, 1, 1, 1, 1, 1,
0.3693405, -0.5439587, 1.854107, 0, 0, 1, 1, 1,
0.3706553, -0.644263, 3.477268, 1, 0, 0, 1, 1,
0.3803452, -0.03407753, 0.9926763, 1, 0, 0, 1, 1,
0.3849888, -0.4368823, 2.199668, 1, 0, 0, 1, 1,
0.3851045, 0.4853511, -1.099888, 1, 0, 0, 1, 1,
0.3854514, -1.123925, 5.464812, 1, 0, 0, 1, 1,
0.386012, 0.09154107, 2.5042, 0, 0, 0, 1, 1,
0.3867924, -0.4869792, 1.650213, 0, 0, 0, 1, 1,
0.387108, 0.6068197, -1.363086, 0, 0, 0, 1, 1,
0.3876907, 0.1590224, 2.809666, 0, 0, 0, 1, 1,
0.3916414, -1.175969, 3.058437, 0, 0, 0, 1, 1,
0.3936957, 0.009258981, 3.284539, 0, 0, 0, 1, 1,
0.3939985, 1.15232, 0.7172776, 0, 0, 0, 1, 1,
0.3961285, -1.100665, 2.111488, 1, 1, 1, 1, 1,
0.396951, 0.3183324, 0.9053565, 1, 1, 1, 1, 1,
0.3971924, -0.02499667, 2.086962, 1, 1, 1, 1, 1,
0.3978289, 1.769856, 1.656807, 1, 1, 1, 1, 1,
0.3987901, -0.5727053, 2.909147, 1, 1, 1, 1, 1,
0.4027173, -0.7500998, 2.230634, 1, 1, 1, 1, 1,
0.4051697, 0.3601548, 2.052874, 1, 1, 1, 1, 1,
0.4054716, -0.2496826, 2.574247, 1, 1, 1, 1, 1,
0.4066328, 0.988179, -0.4717375, 1, 1, 1, 1, 1,
0.4074719, -1.027602, 2.956825, 1, 1, 1, 1, 1,
0.4081482, -0.1455116, 4.605649, 1, 1, 1, 1, 1,
0.4086908, -0.4528308, 2.570869, 1, 1, 1, 1, 1,
0.4103216, -0.02743107, 1.394831, 1, 1, 1, 1, 1,
0.4109995, 1.048333, 0.3292127, 1, 1, 1, 1, 1,
0.4142828, 0.3273123, 0.1796669, 1, 1, 1, 1, 1,
0.415597, -0.4484806, 2.721306, 0, 0, 1, 1, 1,
0.4180668, 0.09137438, 0.5547621, 1, 0, 0, 1, 1,
0.4201814, 0.9507611, 0.1571671, 1, 0, 0, 1, 1,
0.4257701, 1.818601, 0.1365913, 1, 0, 0, 1, 1,
0.4291386, 0.04052479, -0.2338745, 1, 0, 0, 1, 1,
0.4297254, -0.7050996, 1.59813, 1, 0, 0, 1, 1,
0.4319625, -1.568173, 3.452899, 0, 0, 0, 1, 1,
0.4354273, 0.3790255, 1.217172, 0, 0, 0, 1, 1,
0.4369148, 0.8413536, -0.1643282, 0, 0, 0, 1, 1,
0.4376154, 0.2520386, 1.86196, 0, 0, 0, 1, 1,
0.4402492, -1.047285, 0.682708, 0, 0, 0, 1, 1,
0.4433846, -0.6384455, 2.978819, 0, 0, 0, 1, 1,
0.444816, 0.9630842, 0.467824, 0, 0, 0, 1, 1,
0.4500487, -0.5137517, 1.817491, 1, 1, 1, 1, 1,
0.4549645, 0.2661116, 2.577368, 1, 1, 1, 1, 1,
0.4603428, -0.3550006, 0.5182801, 1, 1, 1, 1, 1,
0.4648331, -0.81155, 1.664872, 1, 1, 1, 1, 1,
0.4659047, -3.446201, 3.769161, 1, 1, 1, 1, 1,
0.4679903, -1.627225, 2.828952, 1, 1, 1, 1, 1,
0.4689324, 0.5908765, 0.7927111, 1, 1, 1, 1, 1,
0.4754888, -1.6339, 3.274261, 1, 1, 1, 1, 1,
0.4762886, -1.438743, 2.563136, 1, 1, 1, 1, 1,
0.4813787, -0.1186814, 3.056338, 1, 1, 1, 1, 1,
0.483897, 1.045156, -0.5131304, 1, 1, 1, 1, 1,
0.4885039, -0.4199566, 3.125874, 1, 1, 1, 1, 1,
0.4937799, -1.4257, 0.6674676, 1, 1, 1, 1, 1,
0.4981455, -3.352646, 2.120513, 1, 1, 1, 1, 1,
0.502619, 0.2502347, 0.4264454, 1, 1, 1, 1, 1,
0.5053731, -0.9115291, 2.516123, 0, 0, 1, 1, 1,
0.5065364, 0.2014487, 0.03904743, 1, 0, 0, 1, 1,
0.5082855, 1.322446, 1.686102, 1, 0, 0, 1, 1,
0.5130481, -0.709421, 4.343454, 1, 0, 0, 1, 1,
0.5134445, 0.8132033, -0.7316774, 1, 0, 0, 1, 1,
0.5159528, 1.455712, 0.6897865, 1, 0, 0, 1, 1,
0.5161704, 0.5453755, 0.1842244, 0, 0, 0, 1, 1,
0.521847, -1.537358, 4.185324, 0, 0, 0, 1, 1,
0.5325657, 0.05899785, -1.050074, 0, 0, 0, 1, 1,
0.5344957, 0.9214997, 1.522019, 0, 0, 0, 1, 1,
0.5360783, -2.334198, 2.668256, 0, 0, 0, 1, 1,
0.5418468, -1.057439, 1.403615, 0, 0, 0, 1, 1,
0.5428022, 1.296477, -0.2311508, 0, 0, 0, 1, 1,
0.5459178, 0.4584334, -0.8528724, 1, 1, 1, 1, 1,
0.5484416, -0.9524817, 2.060441, 1, 1, 1, 1, 1,
0.5509267, -2.163644, 1.496615, 1, 1, 1, 1, 1,
0.5516081, -0.03744205, 2.479085, 1, 1, 1, 1, 1,
0.5570157, 0.996117, -1.232049, 1, 1, 1, 1, 1,
0.5619954, -0.6238312, 2.544809, 1, 1, 1, 1, 1,
0.5696366, 1.756473, 1.1728, 1, 1, 1, 1, 1,
0.575823, -1.187054, 4.741973, 1, 1, 1, 1, 1,
0.5782948, -0.01510362, 0.4720104, 1, 1, 1, 1, 1,
0.5792309, 0.6197612, -0.06958858, 1, 1, 1, 1, 1,
0.5796288, 2.155285, 1.030203, 1, 1, 1, 1, 1,
0.5802782, 1.673509, 0.1496998, 1, 1, 1, 1, 1,
0.5807607, -0.1903995, 2.537379, 1, 1, 1, 1, 1,
0.5857803, -1.044532, 0.9312441, 1, 1, 1, 1, 1,
0.5879443, -1.320681, 2.733731, 1, 1, 1, 1, 1,
0.5894744, 0.8951049, 0.1836754, 0, 0, 1, 1, 1,
0.5900331, 0.8450382, 0.5802996, 1, 0, 0, 1, 1,
0.5915776, 0.7489561, -0.1899849, 1, 0, 0, 1, 1,
0.5965783, -0.799261, 0.7182242, 1, 0, 0, 1, 1,
0.5974903, 0.6183555, 1.679335, 1, 0, 0, 1, 1,
0.6021212, -0.1445752, 1.276616, 1, 0, 0, 1, 1,
0.6096209, 0.8853109, 1.131665, 0, 0, 0, 1, 1,
0.6123723, -0.09550378, 1.276836, 0, 0, 0, 1, 1,
0.6130631, 0.9630543, 1.131138, 0, 0, 0, 1, 1,
0.6134142, -0.09007746, 2.400642, 0, 0, 0, 1, 1,
0.6137009, -0.9758586, 4.393257, 0, 0, 0, 1, 1,
0.6184862, -2.089057, 2.360686, 0, 0, 0, 1, 1,
0.6270689, 0.004771259, 0.7467309, 0, 0, 0, 1, 1,
0.6278529, 0.1785731, 0.3631403, 1, 1, 1, 1, 1,
0.630205, 0.3745592, 1.931244, 1, 1, 1, 1, 1,
0.6375309, 0.4146196, 0.7311819, 1, 1, 1, 1, 1,
0.6379938, 0.8352616, -0.5988448, 1, 1, 1, 1, 1,
0.645008, -1.109953, 3.34429, 1, 1, 1, 1, 1,
0.6463858, -1.738158, 2.791807, 1, 1, 1, 1, 1,
0.6464317, 1.30355, -0.0657634, 1, 1, 1, 1, 1,
0.6484116, -0.958744, 3.599002, 1, 1, 1, 1, 1,
0.6503596, -0.03583177, 1.29109, 1, 1, 1, 1, 1,
0.6546223, 0.9661617, 0.2495873, 1, 1, 1, 1, 1,
0.6556923, -1.087143, 3.420812, 1, 1, 1, 1, 1,
0.6598136, -0.05903481, 2.174314, 1, 1, 1, 1, 1,
0.6606131, 0.4341904, 2.604938, 1, 1, 1, 1, 1,
0.6629216, -1.795517, 2.452141, 1, 1, 1, 1, 1,
0.6659709, -1.149268, 2.504376, 1, 1, 1, 1, 1,
0.6690894, 0.1718928, 2.099276, 0, 0, 1, 1, 1,
0.672937, 0.4997965, -0.38373, 1, 0, 0, 1, 1,
0.6746237, 0.5972826, -0.1673619, 1, 0, 0, 1, 1,
0.6755224, 1.584193, 0.4964447, 1, 0, 0, 1, 1,
0.6852673, 0.312861, 1.768172, 1, 0, 0, 1, 1,
0.6882613, 0.2242008, 1.172328, 1, 0, 0, 1, 1,
0.6887049, -0.9081331, 1.244209, 0, 0, 0, 1, 1,
0.6930447, -0.8259665, 1.790039, 0, 0, 0, 1, 1,
0.6976678, 0.3072747, 1.548662, 0, 0, 0, 1, 1,
0.6983114, 1.09186, 1.315697, 0, 0, 0, 1, 1,
0.707692, 0.1878553, 0.5895247, 0, 0, 0, 1, 1,
0.7089366, 0.8752515, 1.350622, 0, 0, 0, 1, 1,
0.7098215, 0.03430725, 0.8347065, 0, 0, 0, 1, 1,
0.7112831, 0.7975104, -0.09716779, 1, 1, 1, 1, 1,
0.712481, 1.548649, 1.150054, 1, 1, 1, 1, 1,
0.7131029, 2.109353, 0.9621524, 1, 1, 1, 1, 1,
0.7195787, -0.6847856, 3.645159, 1, 1, 1, 1, 1,
0.7261328, -0.04647998, 2.390397, 1, 1, 1, 1, 1,
0.7316018, -0.5869288, 2.793883, 1, 1, 1, 1, 1,
0.7344774, -1.394089, 0.7735239, 1, 1, 1, 1, 1,
0.7363073, 0.9278265, 0.4292731, 1, 1, 1, 1, 1,
0.7411187, 0.002145096, 1.663729, 1, 1, 1, 1, 1,
0.7470288, -0.3203924, 1.6976, 1, 1, 1, 1, 1,
0.7518246, -0.01234389, 2.45283, 1, 1, 1, 1, 1,
0.7519403, -0.3668376, 1.487454, 1, 1, 1, 1, 1,
0.7577099, -1.745301, 0.9588042, 1, 1, 1, 1, 1,
0.7580928, -1.532155, 3.347815, 1, 1, 1, 1, 1,
0.7586827, -0.3947369, 2.14555, 1, 1, 1, 1, 1,
0.7648448, -0.4625764, 1.597201, 0, 0, 1, 1, 1,
0.7668649, 0.991678, 1.996274, 1, 0, 0, 1, 1,
0.7669364, 0.150615, 2.424467, 1, 0, 0, 1, 1,
0.7736287, -0.5848255, 2.508093, 1, 0, 0, 1, 1,
0.7757882, 0.07038248, 2.474307, 1, 0, 0, 1, 1,
0.7850621, -1.645705, 2.525136, 1, 0, 0, 1, 1,
0.7853531, 0.472057, -0.3500756, 0, 0, 0, 1, 1,
0.7869358, 0.7278199, 0.6902444, 0, 0, 0, 1, 1,
0.7873667, -2.592335, 1.297143, 0, 0, 0, 1, 1,
0.8090307, 0.05468114, 1.099761, 0, 0, 0, 1, 1,
0.8091726, -0.7518824, 2.808386, 0, 0, 0, 1, 1,
0.8093267, -2.057142, -0.1838898, 0, 0, 0, 1, 1,
0.8115327, 0.5108557, -0.348143, 0, 0, 0, 1, 1,
0.8190389, -0.447919, 1.083367, 1, 1, 1, 1, 1,
0.8193092, 0.1681853, -0.3101114, 1, 1, 1, 1, 1,
0.8233004, -0.7803956, 2.527318, 1, 1, 1, 1, 1,
0.8244292, 1.443607, -0.04536371, 1, 1, 1, 1, 1,
0.8300179, -0.8394955, 1.317598, 1, 1, 1, 1, 1,
0.8354375, 1.752306, 0.7155262, 1, 1, 1, 1, 1,
0.8359427, -0.8036992, 2.357475, 1, 1, 1, 1, 1,
0.8375625, -0.1832334, -0.00628291, 1, 1, 1, 1, 1,
0.8470049, 1.261611, 0.5993056, 1, 1, 1, 1, 1,
0.8509851, 0.4681693, 1.714568, 1, 1, 1, 1, 1,
0.8560493, 1.189053, 0.474223, 1, 1, 1, 1, 1,
0.8606615, 0.2385003, 2.88958, 1, 1, 1, 1, 1,
0.8619127, 0.339287, 0.9925996, 1, 1, 1, 1, 1,
0.8648864, 2.035829, 0.469938, 1, 1, 1, 1, 1,
0.8743491, 0.3381746, 0.04192764, 1, 1, 1, 1, 1,
0.8833712, 0.6054536, 0.2939111, 0, 0, 1, 1, 1,
0.8837323, -1.046809, 2.408803, 1, 0, 0, 1, 1,
0.8853427, 0.8123424, 0.9625059, 1, 0, 0, 1, 1,
0.8866233, -0.4611234, 2.934567, 1, 0, 0, 1, 1,
0.8920432, -0.4064231, 0.9271281, 1, 0, 0, 1, 1,
0.8929437, -2.856938, 3.095389, 1, 0, 0, 1, 1,
0.8944316, -0.0373765, 2.315023, 0, 0, 0, 1, 1,
0.8966066, -0.7648867, 3.397534, 0, 0, 0, 1, 1,
0.8991995, 1.837428, 2.140911, 0, 0, 0, 1, 1,
0.9042999, -0.8289259, 0.6262242, 0, 0, 0, 1, 1,
0.9051741, 0.06089887, 2.901187, 0, 0, 0, 1, 1,
0.9093965, 0.114327, -0.3344223, 0, 0, 0, 1, 1,
0.9199914, 1.363254, -1.014561, 0, 0, 0, 1, 1,
0.9200841, -0.08677457, -0.2386551, 1, 1, 1, 1, 1,
0.9209563, 0.6487082, 2.878821, 1, 1, 1, 1, 1,
0.9252189, 0.3072498, 0.07771134, 1, 1, 1, 1, 1,
0.9258817, -1.168177, 1.090832, 1, 1, 1, 1, 1,
0.9282201, -0.5932114, 1.353466, 1, 1, 1, 1, 1,
0.9303532, -0.3345251, 1.52112, 1, 1, 1, 1, 1,
0.9360169, 1.163932, 2.408129, 1, 1, 1, 1, 1,
0.9386236, 0.2045045, 1.071708, 1, 1, 1, 1, 1,
0.9411558, -0.4821238, 0.02903957, 1, 1, 1, 1, 1,
0.9420547, 0.7622486, 1.564634, 1, 1, 1, 1, 1,
0.9450756, 0.4214105, 2.246997, 1, 1, 1, 1, 1,
0.9451221, 1.916785, 0.6221095, 1, 1, 1, 1, 1,
0.9454229, 0.1469079, 2.813771, 1, 1, 1, 1, 1,
0.9475237, -0.3830874, 1.53897, 1, 1, 1, 1, 1,
0.9478775, -2.06547, 2.079883, 1, 1, 1, 1, 1,
0.9529294, -0.07153022, 2.842801, 0, 0, 1, 1, 1,
0.9547848, 1.666942, 1.241021, 1, 0, 0, 1, 1,
0.9625881, -0.9391949, 1.69186, 1, 0, 0, 1, 1,
0.9703551, 0.3989199, 0.7374207, 1, 0, 0, 1, 1,
0.973467, -0.8165019, 1.035652, 1, 0, 0, 1, 1,
0.9753848, 0.6664801, 0.4313033, 1, 0, 0, 1, 1,
0.9804428, 0.2667003, 2.194538, 0, 0, 0, 1, 1,
0.9900758, -0.06570249, 3.056849, 0, 0, 0, 1, 1,
0.9914641, 0.4755877, -1.025443, 0, 0, 0, 1, 1,
0.9979848, -0.2743854, 1.096812, 0, 0, 0, 1, 1,
0.9995781, -1.260578, 2.827617, 0, 0, 0, 1, 1,
1.00156, -0.3626429, 1.707454, 0, 0, 0, 1, 1,
1.002941, 0.3026743, -0.6902446, 0, 0, 0, 1, 1,
1.011775, 0.938985, 1.673116, 1, 1, 1, 1, 1,
1.014571, 0.2469036, 0.2698992, 1, 1, 1, 1, 1,
1.01733, 2.943065, 1.850835, 1, 1, 1, 1, 1,
1.018924, -0.04456906, 2.068649, 1, 1, 1, 1, 1,
1.02107, -0.004817753, 1.767265, 1, 1, 1, 1, 1,
1.025605, -0.09758719, 1.538294, 1, 1, 1, 1, 1,
1.033587, 1.213868, 1.054829, 1, 1, 1, 1, 1,
1.033596, 0.5547202, 0.2745682, 1, 1, 1, 1, 1,
1.043169, 0.07834451, 1.400487, 1, 1, 1, 1, 1,
1.047759, 0.6723974, 0.6296337, 1, 1, 1, 1, 1,
1.058114, 0.1551614, 1.136572, 1, 1, 1, 1, 1,
1.066468, 0.1600923, 1.367643, 1, 1, 1, 1, 1,
1.067866, 0.01385715, 1.769411, 1, 1, 1, 1, 1,
1.075146, -0.9321528, 1.52849, 1, 1, 1, 1, 1,
1.075925, -0.899047, 2.690095, 1, 1, 1, 1, 1,
1.07726, 0.9828429, 0.3549532, 0, 0, 1, 1, 1,
1.077313, -0.237544, 0.1370174, 1, 0, 0, 1, 1,
1.082521, -0.7568471, 2.14634, 1, 0, 0, 1, 1,
1.091286, -0.729629, 2.886851, 1, 0, 0, 1, 1,
1.092071, -0.02083369, 0.9815992, 1, 0, 0, 1, 1,
1.096842, 1.671547, -0.009735059, 1, 0, 0, 1, 1,
1.099625, -0.3472805, 1.043614, 0, 0, 0, 1, 1,
1.104119, -1.754714, 2.070495, 0, 0, 0, 1, 1,
1.109545, -0.8025271, 4.064765, 0, 0, 0, 1, 1,
1.117546, 1.065931, 2.012615, 0, 0, 0, 1, 1,
1.117787, 1.599479, 1.067763, 0, 0, 0, 1, 1,
1.125244, -0.7456583, 2.132177, 0, 0, 0, 1, 1,
1.132806, -1.147015, 1.291965, 0, 0, 0, 1, 1,
1.133729, -0.1399573, 2.209494, 1, 1, 1, 1, 1,
1.136148, -1.577468, 1.186281, 1, 1, 1, 1, 1,
1.145464, -1.143669, 4.418913, 1, 1, 1, 1, 1,
1.146511, 0.7863122, 0.8493069, 1, 1, 1, 1, 1,
1.148545, 0.01219166, 2.84505, 1, 1, 1, 1, 1,
1.157215, -0.6572693, 2.544309, 1, 1, 1, 1, 1,
1.158318, 1.376464, 0.5929658, 1, 1, 1, 1, 1,
1.164296, 0.540751, 1.295824, 1, 1, 1, 1, 1,
1.165035, -0.3980819, 0.4693609, 1, 1, 1, 1, 1,
1.16693, -1.080696, 0.5655327, 1, 1, 1, 1, 1,
1.174941, -1.439266, 2.371299, 1, 1, 1, 1, 1,
1.17559, -0.2623919, 2.727894, 1, 1, 1, 1, 1,
1.180733, 2.406179, 0.9620689, 1, 1, 1, 1, 1,
1.18487, 0.1815196, 0.07035141, 1, 1, 1, 1, 1,
1.19064, 0.8594026, 3.063766, 1, 1, 1, 1, 1,
1.190702, -0.9046949, 3.331331, 0, 0, 1, 1, 1,
1.195782, -0.3758455, 1.333307, 1, 0, 0, 1, 1,
1.199049, 0.7013569, 0.8109758, 1, 0, 0, 1, 1,
1.201038, 0.4859303, 0.06888044, 1, 0, 0, 1, 1,
1.206953, -1.10567, 1.862292, 1, 0, 0, 1, 1,
1.214603, -1.864553, 3.621012, 1, 0, 0, 1, 1,
1.219069, -1.21888, 1.775178, 0, 0, 0, 1, 1,
1.221988, 0.289923, 2.135388, 0, 0, 0, 1, 1,
1.227436, -1.070653, 2.862372, 0, 0, 0, 1, 1,
1.227667, 1.628662, 0.870487, 0, 0, 0, 1, 1,
1.234406, 0.2457775, -0.02724322, 0, 0, 0, 1, 1,
1.239642, -1.117293, 1.576321, 0, 0, 0, 1, 1,
1.245763, -0.1996447, 1.286826, 0, 0, 0, 1, 1,
1.24815, 1.402641, 0.3575983, 1, 1, 1, 1, 1,
1.248271, 1.151756, 0.8463745, 1, 1, 1, 1, 1,
1.254757, -0.07487704, 0.6773764, 1, 1, 1, 1, 1,
1.254763, -1.46315, 2.510513, 1, 1, 1, 1, 1,
1.256414, -0.7469594, 2.546067, 1, 1, 1, 1, 1,
1.264158, 0.4825527, 0.9476637, 1, 1, 1, 1, 1,
1.273259, 0.4895638, 2.238654, 1, 1, 1, 1, 1,
1.280849, 1.60433, -1.29028, 1, 1, 1, 1, 1,
1.281856, 2.103462, 1.801007, 1, 1, 1, 1, 1,
1.282403, 0.3626214, 1.821994, 1, 1, 1, 1, 1,
1.28314, -0.7340117, 2.151908, 1, 1, 1, 1, 1,
1.296192, 0.9136297, -0.06128591, 1, 1, 1, 1, 1,
1.297498, -0.4481424, 3.52815, 1, 1, 1, 1, 1,
1.300902, 2.489428, 0.4865467, 1, 1, 1, 1, 1,
1.306309, -0.8776877, 1.448622, 1, 1, 1, 1, 1,
1.306847, -0.4375906, 2.389177, 0, 0, 1, 1, 1,
1.311887, -1.480667, 2.468593, 1, 0, 0, 1, 1,
1.319773, -0.1936807, 2.663264, 1, 0, 0, 1, 1,
1.322992, 0.3038803, 2.038749, 1, 0, 0, 1, 1,
1.327234, 1.11388, 2.668899, 1, 0, 0, 1, 1,
1.327665, 1.659566, 0.8849251, 1, 0, 0, 1, 1,
1.333371, 1.816195, 2.064368, 0, 0, 0, 1, 1,
1.341961, -0.508702, 0.1581414, 0, 0, 0, 1, 1,
1.343169, -0.1424056, 0.4715686, 0, 0, 0, 1, 1,
1.347693, -0.4250169, 1.069313, 0, 0, 0, 1, 1,
1.348477, -1.618809, 3.779291, 0, 0, 0, 1, 1,
1.35174, 0.4898439, 0.8426874, 0, 0, 0, 1, 1,
1.358227, 2.001471, 0.9582604, 0, 0, 0, 1, 1,
1.361873, -0.3051117, 1.926636, 1, 1, 1, 1, 1,
1.371975, -2.629794, 2.366857, 1, 1, 1, 1, 1,
1.379967, -1.039033, 2.232257, 1, 1, 1, 1, 1,
1.382871, -0.34305, 1.328702, 1, 1, 1, 1, 1,
1.401848, 0.4143659, 1.024179, 1, 1, 1, 1, 1,
1.404152, 0.9887524, 1.756379, 1, 1, 1, 1, 1,
1.41599, 0.421031, 1.054301, 1, 1, 1, 1, 1,
1.428342, 0.512442, 2.03294, 1, 1, 1, 1, 1,
1.429003, 0.4661674, -0.05416442, 1, 1, 1, 1, 1,
1.430942, 0.3776893, 0.1369878, 1, 1, 1, 1, 1,
1.445807, -0.6340691, 3.278799, 1, 1, 1, 1, 1,
1.447026, 0.7979776, 0.5048773, 1, 1, 1, 1, 1,
1.455925, -0.2042927, 0.7027594, 1, 1, 1, 1, 1,
1.462922, -1.065672, 1.749853, 1, 1, 1, 1, 1,
1.466516, 0.2496901, -0.211189, 1, 1, 1, 1, 1,
1.468101, -2.06035, 3.845007, 0, 0, 1, 1, 1,
1.470485, -0.2455592, 1.030129, 1, 0, 0, 1, 1,
1.487593, -2.578965, 1.283316, 1, 0, 0, 1, 1,
1.503278, -1.930121, 3.320609, 1, 0, 0, 1, 1,
1.504991, -0.6735037, 3.12513, 1, 0, 0, 1, 1,
1.508412, -0.774758, 2.534475, 1, 0, 0, 1, 1,
1.512677, -0.4768606, 1.959967, 0, 0, 0, 1, 1,
1.523784, -0.07726453, 2.537471, 0, 0, 0, 1, 1,
1.528937, 0.1436766, 2.244889, 0, 0, 0, 1, 1,
1.52998, -0.1908187, 0.4480853, 0, 0, 0, 1, 1,
1.537892, 0.1119473, 3.102946, 0, 0, 0, 1, 1,
1.53908, 0.2725578, 1.880461, 0, 0, 0, 1, 1,
1.539989, 0.9027171, 1.648938, 0, 0, 0, 1, 1,
1.549818, -2.262036, 2.236622, 1, 1, 1, 1, 1,
1.572249, 1.64577, 0.019571, 1, 1, 1, 1, 1,
1.576342, 1.117692, 0.9271846, 1, 1, 1, 1, 1,
1.585218, 0.9048121, -0.1378124, 1, 1, 1, 1, 1,
1.589484, -0.4863121, 1.407757, 1, 1, 1, 1, 1,
1.594437, 1.587783, 2.014402, 1, 1, 1, 1, 1,
1.605265, -0.7559801, 3.762764, 1, 1, 1, 1, 1,
1.613589, 0.6630939, 0.3738198, 1, 1, 1, 1, 1,
1.614374, -0.04728414, 1.22076, 1, 1, 1, 1, 1,
1.621767, -0.2403035, 1.079549, 1, 1, 1, 1, 1,
1.626451, -2.338318, 3.161275, 1, 1, 1, 1, 1,
1.629234, 1.345485, 3.359383, 1, 1, 1, 1, 1,
1.638632, -0.1032164, 3.372649, 1, 1, 1, 1, 1,
1.638756, -0.7193366, 2.144174, 1, 1, 1, 1, 1,
1.641938, -1.580565, 2.633415, 1, 1, 1, 1, 1,
1.661288, 0.3517364, 0.5193582, 0, 0, 1, 1, 1,
1.668784, 0.2585187, 1.752702, 1, 0, 0, 1, 1,
1.681255, 0.01644126, 3.122783, 1, 0, 0, 1, 1,
1.705512, -1.287054, 1.875836, 1, 0, 0, 1, 1,
1.715273, 0.4831846, 0.5648426, 1, 0, 0, 1, 1,
1.72373, -0.7562951, 2.637372, 1, 0, 0, 1, 1,
1.753865, -2.366382, 1.912925, 0, 0, 0, 1, 1,
1.767493, 1.439764, 1.019501, 0, 0, 0, 1, 1,
1.78136, -0.3205189, 3.197008, 0, 0, 0, 1, 1,
1.781476, -0.8994108, 2.135103, 0, 0, 0, 1, 1,
1.78201, -0.7045492, 1.115939, 0, 0, 0, 1, 1,
1.802001, 1.493544, -0.3485932, 0, 0, 0, 1, 1,
1.820319, 1.298129, 2.571115, 0, 0, 0, 1, 1,
1.828992, 0.9628887, 1.412664, 1, 1, 1, 1, 1,
1.84145, 0.2548768, 1.458099, 1, 1, 1, 1, 1,
1.847255, 0.3133199, 1.213242, 1, 1, 1, 1, 1,
1.859629, -0.3342757, 0.7197819, 1, 1, 1, 1, 1,
1.864233, -0.7472374, 1.232576, 1, 1, 1, 1, 1,
1.866105, 0.1277042, 1.849187, 1, 1, 1, 1, 1,
1.867289, -0.1231265, 1.51857, 1, 1, 1, 1, 1,
1.886463, -0.0743615, 2.628559, 1, 1, 1, 1, 1,
1.901501, 0.09492294, 1.370056, 1, 1, 1, 1, 1,
1.903931, -1.211432, 2.08817, 1, 1, 1, 1, 1,
1.910968, 1.147265, 0.664636, 1, 1, 1, 1, 1,
1.915705, -0.8797846, 0.8388655, 1, 1, 1, 1, 1,
1.915813, 1.321719, 1.933833, 1, 1, 1, 1, 1,
1.957074, 1.55217, 2.461871, 1, 1, 1, 1, 1,
1.96986, 0.4793938, 1.079162, 1, 1, 1, 1, 1,
1.970107, 0.7558861, 0.8576037, 0, 0, 1, 1, 1,
1.970863, 0.8483878, 0.2861125, 1, 0, 0, 1, 1,
2.000126, -0.1678262, 1.100649, 1, 0, 0, 1, 1,
2.012773, -0.1038866, 2.011106, 1, 0, 0, 1, 1,
2.015652, 0.07934453, 0.4078085, 1, 0, 0, 1, 1,
2.0323, -2.774405, 2.4501, 1, 0, 0, 1, 1,
2.057431, 0.5923321, 1.23576, 0, 0, 0, 1, 1,
2.063526, -0.1419369, 1.174029, 0, 0, 0, 1, 1,
2.084886, 0.02914529, 2.895088, 0, 0, 0, 1, 1,
2.097605, -1.035068, 2.589583, 0, 0, 0, 1, 1,
2.225126, -0.6645416, 2.630394, 0, 0, 0, 1, 1,
2.264038, 1.014739, 0.8895531, 0, 0, 0, 1, 1,
2.309289, 0.3330949, 2.022137, 0, 0, 0, 1, 1,
2.332881, -1.530013, 1.648563, 1, 1, 1, 1, 1,
2.334164, 0.2619429, 2.332535, 1, 1, 1, 1, 1,
2.335504, -0.4068023, 0.03456801, 1, 1, 1, 1, 1,
2.439678, -1.224428, 3.738333, 1, 1, 1, 1, 1,
2.445704, 0.2947162, 2.497934, 1, 1, 1, 1, 1,
2.639523, 0.4033585, 2.517727, 1, 1, 1, 1, 1,
2.943519, 0.5761137, 0.03105229, 1, 1, 1, 1, 1
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
var radius = 9.593599;
var distance = 33.69711;
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
mvMatrix.translate( -0.05053663, 0.2515682, 0.116487 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.69711);
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
