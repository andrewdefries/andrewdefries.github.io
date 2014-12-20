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
-2.872132, 1.467656, -3.668014, 1, 0, 0, 1,
-2.804893, -0.973439, -2.607861, 1, 0.007843138, 0, 1,
-2.775857, -2.049052, -0.8207572, 1, 0.01176471, 0, 1,
-2.689886, -0.9670336, -0.5927448, 1, 0.01960784, 0, 1,
-2.662335, 0.4207229, 0.3479521, 1, 0.02352941, 0, 1,
-2.650438, -0.2917072, -0.7026522, 1, 0.03137255, 0, 1,
-2.638454, -0.4151918, -2.356985, 1, 0.03529412, 0, 1,
-2.615202, 0.1092422, 0.7628235, 1, 0.04313726, 0, 1,
-2.527195, -1.628499, -1.480306, 1, 0.04705882, 0, 1,
-2.258371, 0.6052245, -0.05882064, 1, 0.05490196, 0, 1,
-2.216927, -0.02347117, -0.5821525, 1, 0.05882353, 0, 1,
-2.156408, 0.6962428, -1.681627, 1, 0.06666667, 0, 1,
-2.116288, 0.905728, 0.05684651, 1, 0.07058824, 0, 1,
-2.101932, -1.09337, -2.433621, 1, 0.07843138, 0, 1,
-2.064364, 0.02361909, -1.278685, 1, 0.08235294, 0, 1,
-2.059871, -0.509222, -2.171422, 1, 0.09019608, 0, 1,
-2.023152, -0.6854534, -2.351578, 1, 0.09411765, 0, 1,
-2.001802, -1.885016, -3.10495, 1, 0.1019608, 0, 1,
-1.967202, -0.1281364, -3.73029, 1, 0.1098039, 0, 1,
-1.941595, -0.1397696, -2.699542, 1, 0.1137255, 0, 1,
-1.941373, 1.077104, -0.2178367, 1, 0.1215686, 0, 1,
-1.93296, 1.590665, -0.6352504, 1, 0.1254902, 0, 1,
-1.917825, 0.7475049, -1.082248, 1, 0.1333333, 0, 1,
-1.913064, 0.2046733, -1.242885, 1, 0.1372549, 0, 1,
-1.894036, 1.099766, -0.5572107, 1, 0.145098, 0, 1,
-1.888896, 0.0910003, -1.280051, 1, 0.1490196, 0, 1,
-1.857525, 1.309187, -0.771055, 1, 0.1568628, 0, 1,
-1.852893, -0.2685167, -1.108098, 1, 0.1607843, 0, 1,
-1.829011, 1.293729, -1.458491, 1, 0.1686275, 0, 1,
-1.819915, 0.2230173, -1.796564, 1, 0.172549, 0, 1,
-1.80287, 0.3053413, -2.0693, 1, 0.1803922, 0, 1,
-1.797894, -0.1836132, -1.481957, 1, 0.1843137, 0, 1,
-1.788624, 1.779591, -2.444692, 1, 0.1921569, 0, 1,
-1.788273, 0.03051005, -1.901465, 1, 0.1960784, 0, 1,
-1.781982, -0.8352545, -3.968774, 1, 0.2039216, 0, 1,
-1.780408, -0.2308923, -2.720321, 1, 0.2117647, 0, 1,
-1.764596, 0.4090948, -0.9618866, 1, 0.2156863, 0, 1,
-1.718961, -1.664074, -2.64569, 1, 0.2235294, 0, 1,
-1.69799, -1.879491, -2.227556, 1, 0.227451, 0, 1,
-1.685652, -0.6984635, -1.604892, 1, 0.2352941, 0, 1,
-1.685373, 0.4691834, -0.3313479, 1, 0.2392157, 0, 1,
-1.683359, 1.409585, -0.4469691, 1, 0.2470588, 0, 1,
-1.677988, -0.7182911, -2.828533, 1, 0.2509804, 0, 1,
-1.67202, 1.095951, -0.7140683, 1, 0.2588235, 0, 1,
-1.67108, 1.76356, -1.204658, 1, 0.2627451, 0, 1,
-1.647241, -1.25313, -1.028734, 1, 0.2705882, 0, 1,
-1.64514, 1.440425, -1.376224, 1, 0.2745098, 0, 1,
-1.633022, 0.3011793, -1.933741, 1, 0.282353, 0, 1,
-1.631374, 0.5366852, -1.511673, 1, 0.2862745, 0, 1,
-1.592806, 0.4038448, -1.773639, 1, 0.2941177, 0, 1,
-1.591318, 0.1856649, -0.8620453, 1, 0.3019608, 0, 1,
-1.569593, -0.3115609, -2.925303, 1, 0.3058824, 0, 1,
-1.554078, 0.465613, -0.4870512, 1, 0.3137255, 0, 1,
-1.54157, -0.05696068, -1.511453, 1, 0.3176471, 0, 1,
-1.539482, 0.9453128, -1.475559, 1, 0.3254902, 0, 1,
-1.536049, -2.18271, -3.836549, 1, 0.3294118, 0, 1,
-1.529927, 0.01387408, -0.2261942, 1, 0.3372549, 0, 1,
-1.52898, 0.1873469, 0.7908964, 1, 0.3411765, 0, 1,
-1.523227, -0.6404255, -1.382553, 1, 0.3490196, 0, 1,
-1.521015, 0.540048, -0.2413754, 1, 0.3529412, 0, 1,
-1.519022, 0.7758796, -2.966644, 1, 0.3607843, 0, 1,
-1.5085, -1.817718, -2.906159, 1, 0.3647059, 0, 1,
-1.503413, 1.677628, -0.5062491, 1, 0.372549, 0, 1,
-1.500475, -0.01135989, -2.089454, 1, 0.3764706, 0, 1,
-1.483837, 0.5625162, -3.619213, 1, 0.3843137, 0, 1,
-1.479333, 0.6469648, -0.8465013, 1, 0.3882353, 0, 1,
-1.471228, 0.2009374, -2.901581, 1, 0.3960784, 0, 1,
-1.462778, 1.349618, -2.603309, 1, 0.4039216, 0, 1,
-1.44913, 0.3516726, -1.480536, 1, 0.4078431, 0, 1,
-1.447628, 1.187322, 0.3676747, 1, 0.4156863, 0, 1,
-1.432896, -0.01255565, -2.203366, 1, 0.4196078, 0, 1,
-1.429172, 0.412589, -1.071859, 1, 0.427451, 0, 1,
-1.42609, 2.621425, -0.9792466, 1, 0.4313726, 0, 1,
-1.414499, 0.1013154, -1.201352, 1, 0.4392157, 0, 1,
-1.409344, 0.4831911, -2.116872, 1, 0.4431373, 0, 1,
-1.407805, -0.5873905, -1.317779, 1, 0.4509804, 0, 1,
-1.404093, -0.2661272, -1.783434, 1, 0.454902, 0, 1,
-1.374726, -0.6878136, -0.7166385, 1, 0.4627451, 0, 1,
-1.356213, -0.8382682, -2.016341, 1, 0.4666667, 0, 1,
-1.33439, 2.573931, 0.3069643, 1, 0.4745098, 0, 1,
-1.325272, 0.2182979, -1.437932, 1, 0.4784314, 0, 1,
-1.321582, -0.009037743, -2.029806, 1, 0.4862745, 0, 1,
-1.314677, 1.716778, -1.684376, 1, 0.4901961, 0, 1,
-1.313707, 2.048786, -1.257877, 1, 0.4980392, 0, 1,
-1.308254, 0.1688258, -2.946717, 1, 0.5058824, 0, 1,
-1.297946, 0.07442249, 0.03121885, 1, 0.509804, 0, 1,
-1.294071, -1.060094, -3.484956, 1, 0.5176471, 0, 1,
-1.289913, 0.4634079, -2.16161, 1, 0.5215687, 0, 1,
-1.284046, -0.7009652, -2.159416, 1, 0.5294118, 0, 1,
-1.271535, 3.287997, -0.2661287, 1, 0.5333334, 0, 1,
-1.263168, 0.1711505, -0.8188725, 1, 0.5411765, 0, 1,
-1.25447, -0.828068, -2.528176, 1, 0.5450981, 0, 1,
-1.237056, -0.9800205, -1.38075, 1, 0.5529412, 0, 1,
-1.235878, 0.5547308, -1.565697, 1, 0.5568628, 0, 1,
-1.234206, 0.5936261, -1.506328, 1, 0.5647059, 0, 1,
-1.233195, 0.250012, -1.76437, 1, 0.5686275, 0, 1,
-1.228612, 0.19344, -0.1970372, 1, 0.5764706, 0, 1,
-1.224094, 0.8488971, -0.9252132, 1, 0.5803922, 0, 1,
-1.220286, -0.2295797, -2.016208, 1, 0.5882353, 0, 1,
-1.219958, 0.5180174, 0.1965366, 1, 0.5921569, 0, 1,
-1.217332, 0.518896, 0.5269899, 1, 0.6, 0, 1,
-1.212457, -0.4719855, -0.8143587, 1, 0.6078432, 0, 1,
-1.206707, 0.2711684, -2.744879, 1, 0.6117647, 0, 1,
-1.200765, -1.748598, -2.589044, 1, 0.6196079, 0, 1,
-1.198727, 0.7955488, -2.861344, 1, 0.6235294, 0, 1,
-1.192463, 0.7691981, -1.530965, 1, 0.6313726, 0, 1,
-1.185624, -0.2742162, -2.607949, 1, 0.6352941, 0, 1,
-1.184096, -0.4090327, -1.415439, 1, 0.6431373, 0, 1,
-1.162639, -1.309103, -1.400741, 1, 0.6470588, 0, 1,
-1.157767, -0.6459835, -1.955243, 1, 0.654902, 0, 1,
-1.157569, -0.4724036, -0.6980289, 1, 0.6588235, 0, 1,
-1.155232, -0.4299622, -1.758831, 1, 0.6666667, 0, 1,
-1.151878, -0.6962612, -1.822678, 1, 0.6705883, 0, 1,
-1.15106, 0.7070912, -1.350519, 1, 0.6784314, 0, 1,
-1.144512, 0.4468115, -1.733819, 1, 0.682353, 0, 1,
-1.144461, 0.3872093, -1.58086, 1, 0.6901961, 0, 1,
-1.142707, -0.7979163, -2.075156, 1, 0.6941177, 0, 1,
-1.138819, 0.2916612, -0.6770214, 1, 0.7019608, 0, 1,
-1.13805, 1.546907, -0.4466833, 1, 0.7098039, 0, 1,
-1.125353, -1.833589, -2.44789, 1, 0.7137255, 0, 1,
-1.119079, -0.6964259, -3.320704, 1, 0.7215686, 0, 1,
-1.117348, -1.899879, -4.352134, 1, 0.7254902, 0, 1,
-1.11534, 0.3004551, -2.333185, 1, 0.7333333, 0, 1,
-1.114848, -0.5392682, -0.9179066, 1, 0.7372549, 0, 1,
-1.113696, 0.1606014, -2.611086, 1, 0.7450981, 0, 1,
-1.104898, 0.7610863, -0.8470376, 1, 0.7490196, 0, 1,
-1.10438, 0.1637711, -1.701658, 1, 0.7568628, 0, 1,
-1.097404, 1.028214, -1.922141, 1, 0.7607843, 0, 1,
-1.091453, -0.6040907, -2.306551, 1, 0.7686275, 0, 1,
-1.090441, -0.1871985, -1.002226, 1, 0.772549, 0, 1,
-1.089791, -1.219093, -2.450718, 1, 0.7803922, 0, 1,
-1.088341, 1.293434, -0.8051929, 1, 0.7843137, 0, 1,
-1.085468, -1.638419, -2.23037, 1, 0.7921569, 0, 1,
-1.082994, -0.8260758, -3.359996, 1, 0.7960784, 0, 1,
-1.081423, -0.4585616, -2.75645, 1, 0.8039216, 0, 1,
-1.078204, -1.564938, -4.603924, 1, 0.8117647, 0, 1,
-1.060079, -1.226238, -2.231187, 1, 0.8156863, 0, 1,
-1.053765, -0.6426837, -2.348148, 1, 0.8235294, 0, 1,
-1.050796, -0.4449468, -2.048336, 1, 0.827451, 0, 1,
-1.050358, 1.183191, -1.128055, 1, 0.8352941, 0, 1,
-1.047427, 0.6288603, -1.237599, 1, 0.8392157, 0, 1,
-1.046543, -0.5758389, -2.708254, 1, 0.8470588, 0, 1,
-1.043989, -0.6263082, -1.388255, 1, 0.8509804, 0, 1,
-1.042928, -0.2305122, -1.633535, 1, 0.8588235, 0, 1,
-1.039823, -0.03689371, -1.787839, 1, 0.8627451, 0, 1,
-1.036375, 0.3602569, -1.485393, 1, 0.8705882, 0, 1,
-1.034245, -0.2397126, -1.88728, 1, 0.8745098, 0, 1,
-1.031204, 0.3692834, -1.07213, 1, 0.8823529, 0, 1,
-1.029804, 0.1391779, -2.118145, 1, 0.8862745, 0, 1,
-1.029042, -2.340093, -3.343837, 1, 0.8941177, 0, 1,
-1.027664, 0.06391382, -2.625108, 1, 0.8980392, 0, 1,
-1.026873, -0.7006018, -2.415384, 1, 0.9058824, 0, 1,
-1.022774, 1.154526, -0.4804523, 1, 0.9137255, 0, 1,
-1.015096, -0.4615922, -2.190479, 1, 0.9176471, 0, 1,
-1.014473, 0.2282839, -2.000314, 1, 0.9254902, 0, 1,
-1.011276, -1.647488, -3.104589, 1, 0.9294118, 0, 1,
-1.006327, 0.1277648, -1.33248, 1, 0.9372549, 0, 1,
-1.004857, 0.1275488, -0.7159016, 1, 0.9411765, 0, 1,
-1.000612, -1.147471, -4.448189, 1, 0.9490196, 0, 1,
-0.9990447, -0.8189225, -3.126179, 1, 0.9529412, 0, 1,
-0.9725527, -0.298899, -3.709602, 1, 0.9607843, 0, 1,
-0.9708414, 0.6950048, -0.5112042, 1, 0.9647059, 0, 1,
-0.9693826, 0.01640986, 0.9379646, 1, 0.972549, 0, 1,
-0.9540926, -2.015798, -3.58677, 1, 0.9764706, 0, 1,
-0.9499219, -0.9958715, -2.848593, 1, 0.9843137, 0, 1,
-0.9430133, -0.5757014, -2.945305, 1, 0.9882353, 0, 1,
-0.9392184, -0.444936, -1.720545, 1, 0.9960784, 0, 1,
-0.933654, 0.3069344, -1.593376, 0.9960784, 1, 0, 1,
-0.9316846, 0.5712039, -0.3486351, 0.9921569, 1, 0, 1,
-0.9303629, 0.5536349, -2.9131, 0.9843137, 1, 0, 1,
-0.9218919, -0.320095, -2.014269, 0.9803922, 1, 0, 1,
-0.9186094, 1.068625, -0.1277546, 0.972549, 1, 0, 1,
-0.9183435, -0.3187102, -0.6384367, 0.9686275, 1, 0, 1,
-0.9090514, 0.6846781, 1.326059, 0.9607843, 1, 0, 1,
-0.887749, -0.2276624, -3.177862, 0.9568627, 1, 0, 1,
-0.8813121, -0.9941719, -1.729784, 0.9490196, 1, 0, 1,
-0.8775175, -0.04238556, -1.013796, 0.945098, 1, 0, 1,
-0.8725258, -2.561885, -3.893822, 0.9372549, 1, 0, 1,
-0.8680045, -0.6550946, -3.230387, 0.9333333, 1, 0, 1,
-0.8660452, 0.3228529, -0.4470552, 0.9254902, 1, 0, 1,
-0.8594469, 1.242166, 0.4678793, 0.9215686, 1, 0, 1,
-0.8588084, 1.722655, 0.2270811, 0.9137255, 1, 0, 1,
-0.8486017, -0.6548817, -1.837793, 0.9098039, 1, 0, 1,
-0.8446189, 0.1835576, -1.436719, 0.9019608, 1, 0, 1,
-0.8427295, -0.9976364, -3.31634, 0.8941177, 1, 0, 1,
-0.8384359, 1.032927, 0.5635029, 0.8901961, 1, 0, 1,
-0.8370008, 0.614825, -0.7994804, 0.8823529, 1, 0, 1,
-0.8352064, -1.251318, -1.792976, 0.8784314, 1, 0, 1,
-0.8337729, -1.593442, -1.419028, 0.8705882, 1, 0, 1,
-0.8308919, 0.1571352, -2.76757, 0.8666667, 1, 0, 1,
-0.8308668, -0.2773629, -0.2941378, 0.8588235, 1, 0, 1,
-0.8260922, 0.2811543, -1.393739, 0.854902, 1, 0, 1,
-0.8162333, -0.01106571, -0.2983939, 0.8470588, 1, 0, 1,
-0.8099671, -0.3550797, -0.4891769, 0.8431373, 1, 0, 1,
-0.809913, 1.61214, -0.186705, 0.8352941, 1, 0, 1,
-0.8055056, 1.562975, 1.706109, 0.8313726, 1, 0, 1,
-0.805262, 0.8248041, 0.1024077, 0.8235294, 1, 0, 1,
-0.8021824, 0.4680772, -0.8633136, 0.8196079, 1, 0, 1,
-0.8011435, -0.961899, -3.0317, 0.8117647, 1, 0, 1,
-0.7891946, 0.6765309, -1.689406, 0.8078431, 1, 0, 1,
-0.7876804, 1.524137, -0.7249767, 0.8, 1, 0, 1,
-0.7720009, 0.5648749, -0.662664, 0.7921569, 1, 0, 1,
-0.7710465, 0.4420686, -1.443934, 0.7882353, 1, 0, 1,
-0.7700109, 0.02195747, 0.3487116, 0.7803922, 1, 0, 1,
-0.7613073, -0.1717184, -2.662801, 0.7764706, 1, 0, 1,
-0.7609356, 1.123932, -1.178508, 0.7686275, 1, 0, 1,
-0.759173, -0.2660053, -0.7957744, 0.7647059, 1, 0, 1,
-0.7483252, 1.565607, 0.3583454, 0.7568628, 1, 0, 1,
-0.7478173, -0.5157088, -1.500338, 0.7529412, 1, 0, 1,
-0.7450275, 1.160168, 0.7165236, 0.7450981, 1, 0, 1,
-0.7433941, 0.5767157, -0.5733034, 0.7411765, 1, 0, 1,
-0.7424632, 0.6234758, -3.468597, 0.7333333, 1, 0, 1,
-0.734377, 0.1922617, -2.115111, 0.7294118, 1, 0, 1,
-0.7332091, -0.1997374, -2.178555, 0.7215686, 1, 0, 1,
-0.720724, 0.2042643, -2.12526, 0.7176471, 1, 0, 1,
-0.7168607, 0.1324987, -0.9569415, 0.7098039, 1, 0, 1,
-0.7165468, -0.9865922, -3.457268, 0.7058824, 1, 0, 1,
-0.7104228, -0.6146742, -3.330889, 0.6980392, 1, 0, 1,
-0.7096614, -0.599766, -1.68849, 0.6901961, 1, 0, 1,
-0.708611, -0.9801889, -0.647965, 0.6862745, 1, 0, 1,
-0.7067928, 0.03519279, -1.438247, 0.6784314, 1, 0, 1,
-0.7033385, -0.03848464, -2.007362, 0.6745098, 1, 0, 1,
-0.7030126, 0.3539688, -0.8527246, 0.6666667, 1, 0, 1,
-0.6969334, 0.09958073, -1.548397, 0.6627451, 1, 0, 1,
-0.6919713, -0.4441192, -2.299749, 0.654902, 1, 0, 1,
-0.6891767, -0.2441588, -1.08061, 0.6509804, 1, 0, 1,
-0.6819443, -0.75495, -3.099895, 0.6431373, 1, 0, 1,
-0.6773369, 0.6566659, -0.2456985, 0.6392157, 1, 0, 1,
-0.6674275, -1.188861, -3.550011, 0.6313726, 1, 0, 1,
-0.6628932, 1.53315, -0.4111231, 0.627451, 1, 0, 1,
-0.660723, 2.358376, 0.5246616, 0.6196079, 1, 0, 1,
-0.6570642, -0.8659923, -1.298803, 0.6156863, 1, 0, 1,
-0.6530559, -0.2411986, -2.309311, 0.6078432, 1, 0, 1,
-0.6431059, -0.140432, -2.78044, 0.6039216, 1, 0, 1,
-0.6392868, 0.6900034, -2.216093, 0.5960785, 1, 0, 1,
-0.637632, -0.4169926, -1.719692, 0.5882353, 1, 0, 1,
-0.6372783, -1.133504, -3.489874, 0.5843138, 1, 0, 1,
-0.6301478, -0.006564795, -1.468888, 0.5764706, 1, 0, 1,
-0.6249399, 0.2805218, -1.273395, 0.572549, 1, 0, 1,
-0.6175301, 0.7540429, -2.092209, 0.5647059, 1, 0, 1,
-0.617162, -0.05644766, -2.047379, 0.5607843, 1, 0, 1,
-0.6162025, -0.5141249, -2.298733, 0.5529412, 1, 0, 1,
-0.613819, 0.9364489, -1.441746, 0.5490196, 1, 0, 1,
-0.6106805, 0.3126586, -1.204592, 0.5411765, 1, 0, 1,
-0.6068634, 1.491232, -0.2549036, 0.5372549, 1, 0, 1,
-0.604599, 1.445783, -0.4316287, 0.5294118, 1, 0, 1,
-0.604429, -0.4509944, -1.778871, 0.5254902, 1, 0, 1,
-0.6034716, -1.240252, -3.014582, 0.5176471, 1, 0, 1,
-0.6001939, -1.055394, -2.201059, 0.5137255, 1, 0, 1,
-0.5994438, -0.5354604, -2.806968, 0.5058824, 1, 0, 1,
-0.5943133, -1.319343, -3.647657, 0.5019608, 1, 0, 1,
-0.5937397, -0.50432, -0.3356199, 0.4941176, 1, 0, 1,
-0.5903115, 0.829335, -0.3441817, 0.4862745, 1, 0, 1,
-0.5901865, -0.7866132, -0.3423015, 0.4823529, 1, 0, 1,
-0.5879602, -0.4838356, -2.278823, 0.4745098, 1, 0, 1,
-0.5793649, -0.5435447, -1.975266, 0.4705882, 1, 0, 1,
-0.5789837, -1.040762, -3.303781, 0.4627451, 1, 0, 1,
-0.5767449, -1.08737, -3.524577, 0.4588235, 1, 0, 1,
-0.5754967, 0.4016585, -1.29582, 0.4509804, 1, 0, 1,
-0.5735429, 0.7615321, -0.5808684, 0.4470588, 1, 0, 1,
-0.5718297, 1.4038, 0.5605264, 0.4392157, 1, 0, 1,
-0.5714644, 0.2670261, -1.417397, 0.4352941, 1, 0, 1,
-0.5670899, -0.3508989, -1.031027, 0.427451, 1, 0, 1,
-0.564265, 1.477435, -0.3894528, 0.4235294, 1, 0, 1,
-0.5618326, 0.05496056, -1.507175, 0.4156863, 1, 0, 1,
-0.5599476, 0.6094999, 0.5703564, 0.4117647, 1, 0, 1,
-0.5579867, -0.6509101, -1.611781, 0.4039216, 1, 0, 1,
-0.5576069, -0.2377748, -1.682928, 0.3960784, 1, 0, 1,
-0.5572121, 0.2481705, -1.255223, 0.3921569, 1, 0, 1,
-0.5568032, -2.103178, -3.387197, 0.3843137, 1, 0, 1,
-0.5550086, 0.640106, -0.7056509, 0.3803922, 1, 0, 1,
-0.5536333, -1.507978, -1.414922, 0.372549, 1, 0, 1,
-0.5508237, 0.602417, -2.668763, 0.3686275, 1, 0, 1,
-0.5485559, -0.8659413, -3.731116, 0.3607843, 1, 0, 1,
-0.5473539, -0.4478885, -2.348256, 0.3568628, 1, 0, 1,
-0.5432714, -0.5026284, -0.7634795, 0.3490196, 1, 0, 1,
-0.5418342, 1.153352, 1.351097, 0.345098, 1, 0, 1,
-0.5408918, -0.7201387, -1.521273, 0.3372549, 1, 0, 1,
-0.5392428, -0.4777335, -1.634188, 0.3333333, 1, 0, 1,
-0.5355799, -0.1839597, -2.640161, 0.3254902, 1, 0, 1,
-0.5326027, 0.3586116, 1.883188, 0.3215686, 1, 0, 1,
-0.5295398, -1.517642, -3.252582, 0.3137255, 1, 0, 1,
-0.5271716, -0.6390542, -2.134733, 0.3098039, 1, 0, 1,
-0.5270586, -1.446318, -2.15975, 0.3019608, 1, 0, 1,
-0.5235456, 1.429045, -0.6934623, 0.2941177, 1, 0, 1,
-0.52126, -1.113331, -1.676219, 0.2901961, 1, 0, 1,
-0.5167608, 1.386219, 1.366031, 0.282353, 1, 0, 1,
-0.5127426, -1.943072, -3.712386, 0.2784314, 1, 0, 1,
-0.5039616, 0.8618147, 0.9181519, 0.2705882, 1, 0, 1,
-0.5024353, 1.317451, 0.3254161, 0.2666667, 1, 0, 1,
-0.501924, -0.6269976, -1.929455, 0.2588235, 1, 0, 1,
-0.5017936, 0.6891085, -0.4264078, 0.254902, 1, 0, 1,
-0.4921115, 0.4699441, -1.466401, 0.2470588, 1, 0, 1,
-0.4897685, -1.326408, -2.820727, 0.2431373, 1, 0, 1,
-0.4887966, 0.9691123, -2.026732, 0.2352941, 1, 0, 1,
-0.4841265, -0.5639585, -4.326978, 0.2313726, 1, 0, 1,
-0.4833764, -0.8207338, -2.629166, 0.2235294, 1, 0, 1,
-0.4748319, -0.5496117, -1.171235, 0.2196078, 1, 0, 1,
-0.4740602, 0.8834621, 0.7708042, 0.2117647, 1, 0, 1,
-0.4719313, -2.070983, -2.003415, 0.2078431, 1, 0, 1,
-0.4669948, 0.6744226, -2.180192, 0.2, 1, 0, 1,
-0.4616789, -0.2825984, -2.930327, 0.1921569, 1, 0, 1,
-0.4616587, 0.6346405, -1.031875, 0.1882353, 1, 0, 1,
-0.4594788, 0.9156272, 0.7706966, 0.1803922, 1, 0, 1,
-0.4591203, -0.4166302, -3.148028, 0.1764706, 1, 0, 1,
-0.4564527, 0.6507477, -0.6125565, 0.1686275, 1, 0, 1,
-0.4555399, -1.03537, -2.034714, 0.1647059, 1, 0, 1,
-0.4530384, -2.124202, -2.654628, 0.1568628, 1, 0, 1,
-0.4421662, -1.943635, -1.549847, 0.1529412, 1, 0, 1,
-0.4324344, 1.534099, -1.470255, 0.145098, 1, 0, 1,
-0.4321288, -0.3993352, -1.527687, 0.1411765, 1, 0, 1,
-0.4277719, -0.7602075, -2.552494, 0.1333333, 1, 0, 1,
-0.4277627, -0.2326437, -1.463337, 0.1294118, 1, 0, 1,
-0.4243647, -0.4945153, -2.525411, 0.1215686, 1, 0, 1,
-0.4214823, -0.2828161, -2.762367, 0.1176471, 1, 0, 1,
-0.4213228, -3.13247, -1.848963, 0.1098039, 1, 0, 1,
-0.4171528, 2.094561, 1.569446, 0.1058824, 1, 0, 1,
-0.4089246, 0.7807526, -2.401245, 0.09803922, 1, 0, 1,
-0.408051, -0.3820922, -2.433134, 0.09019608, 1, 0, 1,
-0.4077792, -0.529634, -2.081583, 0.08627451, 1, 0, 1,
-0.407391, -0.283007, -1.404319, 0.07843138, 1, 0, 1,
-0.4027951, -2.257456, -1.553794, 0.07450981, 1, 0, 1,
-0.4021948, 1.121144, -0.7509937, 0.06666667, 1, 0, 1,
-0.4019434, -0.8312299, -3.589358, 0.0627451, 1, 0, 1,
-0.4016793, 0.2097661, -2.356789, 0.05490196, 1, 0, 1,
-0.3977256, 1.663557, -2.041493, 0.05098039, 1, 0, 1,
-0.3932689, 1.127465, -1.158571, 0.04313726, 1, 0, 1,
-0.3913907, 0.1771017, -1.008983, 0.03921569, 1, 0, 1,
-0.3912298, 1.285145, -0.4208803, 0.03137255, 1, 0, 1,
-0.3900235, 1.380474, -0.5386235, 0.02745098, 1, 0, 1,
-0.3899316, 0.4559578, 0.1879834, 0.01960784, 1, 0, 1,
-0.3874624, 0.8326079, 1.092145, 0.01568628, 1, 0, 1,
-0.3839359, 0.7928178, -1.226197, 0.007843138, 1, 0, 1,
-0.3775853, 1.486223, -0.1807315, 0.003921569, 1, 0, 1,
-0.3744973, -0.8490532, -4.66989, 0, 1, 0.003921569, 1,
-0.372256, 0.2390176, -0.6658739, 0, 1, 0.01176471, 1,
-0.3692124, 0.8769531, 0.2064871, 0, 1, 0.01568628, 1,
-0.3677826, -1.884799, -4.764028, 0, 1, 0.02352941, 1,
-0.3665791, 0.4483615, 0.2829379, 0, 1, 0.02745098, 1,
-0.3650821, -0.4407454, -2.176843, 0, 1, 0.03529412, 1,
-0.3638476, 0.2585876, -0.2394169, 0, 1, 0.03921569, 1,
-0.3623386, -0.5806817, -1.9174, 0, 1, 0.04705882, 1,
-0.3562407, 0.4103721, -0.8912054, 0, 1, 0.05098039, 1,
-0.3551333, -0.1652292, -2.282451, 0, 1, 0.05882353, 1,
-0.3548017, 0.2472809, -1.921042, 0, 1, 0.0627451, 1,
-0.3541664, 0.4474683, -0.2702698, 0, 1, 0.07058824, 1,
-0.3471518, -1.224846, -2.714583, 0, 1, 0.07450981, 1,
-0.3459465, 0.06764828, -1.121667, 0, 1, 0.08235294, 1,
-0.3446878, -0.4322925, -3.362296, 0, 1, 0.08627451, 1,
-0.3425681, -1.40322, -0.7482604, 0, 1, 0.09411765, 1,
-0.3420773, 0.3458074, -1.065265, 0, 1, 0.1019608, 1,
-0.3405944, -0.4622803, -1.224796, 0, 1, 0.1058824, 1,
-0.3387513, -0.2422364, -0.7493377, 0, 1, 0.1137255, 1,
-0.3373491, 2.065337, 1.643993, 0, 1, 0.1176471, 1,
-0.3365608, -0.1075587, -1.474011, 0, 1, 0.1254902, 1,
-0.334002, -0.6001543, -3.265622, 0, 1, 0.1294118, 1,
-0.3323243, -1.705146, -4.276536, 0, 1, 0.1372549, 1,
-0.3290232, -0.3879879, -1.292989, 0, 1, 0.1411765, 1,
-0.326267, 1.1558, -4.025888, 0, 1, 0.1490196, 1,
-0.3231598, -1.199835, -3.374154, 0, 1, 0.1529412, 1,
-0.3194911, -0.5050674, -1.89693, 0, 1, 0.1607843, 1,
-0.3184808, 0.2605591, -0.8202264, 0, 1, 0.1647059, 1,
-0.3183695, -2.421412, -3.903658, 0, 1, 0.172549, 1,
-0.3162271, 1.761988, -0.3390595, 0, 1, 0.1764706, 1,
-0.3140586, 1.679179, -0.2907696, 0, 1, 0.1843137, 1,
-0.3125798, -0.2304715, -0.4325689, 0, 1, 0.1882353, 1,
-0.3125614, -0.7259698, -2.19059, 0, 1, 0.1960784, 1,
-0.3108503, 1.738122, 1.332696, 0, 1, 0.2039216, 1,
-0.3073606, 0.2140024, -2.044086, 0, 1, 0.2078431, 1,
-0.3068697, -0.08861709, -3.526325, 0, 1, 0.2156863, 1,
-0.3065092, 1.393514, -0.0533029, 0, 1, 0.2196078, 1,
-0.3058592, -0.5987582, -2.092891, 0, 1, 0.227451, 1,
-0.3037491, 0.7220621, 2.027438, 0, 1, 0.2313726, 1,
-0.2991704, 1.297696, -0.6481317, 0, 1, 0.2392157, 1,
-0.2956648, -0.7183521, -3.161911, 0, 1, 0.2431373, 1,
-0.2953087, -0.0636645, -2.505479, 0, 1, 0.2509804, 1,
-0.2950041, -0.03680457, -2.090195, 0, 1, 0.254902, 1,
-0.2902606, 1.1351, -0.9809625, 0, 1, 0.2627451, 1,
-0.2838796, -1.228119, -1.176443, 0, 1, 0.2666667, 1,
-0.2823502, -8.574822e-05, -1.143589, 0, 1, 0.2745098, 1,
-0.2818304, -0.5267968, -2.754947, 0, 1, 0.2784314, 1,
-0.2807758, -1.072035, -1.035649, 0, 1, 0.2862745, 1,
-0.2774177, -0.3117115, 0.1021917, 0, 1, 0.2901961, 1,
-0.2768784, 0.7433727, 1.364515, 0, 1, 0.2980392, 1,
-0.2707672, -1.51571, -2.547361, 0, 1, 0.3058824, 1,
-0.2682199, 0.4521966, -1.958245, 0, 1, 0.3098039, 1,
-0.2662085, -0.4224345, -3.19958, 0, 1, 0.3176471, 1,
-0.2659534, 0.7016914, -1.159501, 0, 1, 0.3215686, 1,
-0.2654557, -1.824037, -4.007735, 0, 1, 0.3294118, 1,
-0.2645863, 0.7594439, 0.9009587, 0, 1, 0.3333333, 1,
-0.2621968, 0.400687, -0.2398009, 0, 1, 0.3411765, 1,
-0.2603496, -0.01065, -3.083259, 0, 1, 0.345098, 1,
-0.2575083, -2.085719, -4.12165, 0, 1, 0.3529412, 1,
-0.2487441, 2.359682, -0.5574919, 0, 1, 0.3568628, 1,
-0.2372339, 0.6825402, -1.04847, 0, 1, 0.3647059, 1,
-0.2342164, 0.7253939, 0.4903542, 0, 1, 0.3686275, 1,
-0.2260157, -0.03869566, -1.659119, 0, 1, 0.3764706, 1,
-0.2190515, 0.2404902, -0.2944447, 0, 1, 0.3803922, 1,
-0.2188887, -0.4133484, -3.335812, 0, 1, 0.3882353, 1,
-0.2171112, -1.463786, -0.35707, 0, 1, 0.3921569, 1,
-0.216185, -1.127697, -3.120138, 0, 1, 0.4, 1,
-0.213917, 2.579151, 0.6344829, 0, 1, 0.4078431, 1,
-0.2033018, -1.127607, -3.898776, 0, 1, 0.4117647, 1,
-0.2025906, -0.9739748, -2.386904, 0, 1, 0.4196078, 1,
-0.2005465, 0.01981758, -0.2589306, 0, 1, 0.4235294, 1,
-0.1991634, -0.879887, -4.186985, 0, 1, 0.4313726, 1,
-0.1990295, 0.5146156, 0.2135433, 0, 1, 0.4352941, 1,
-0.1981888, 0.3954543, -0.5681913, 0, 1, 0.4431373, 1,
-0.196016, 1.830417, -1.347198, 0, 1, 0.4470588, 1,
-0.1941586, 0.5576906, 0.1975186, 0, 1, 0.454902, 1,
-0.1929147, -1.142602, -4.120293, 0, 1, 0.4588235, 1,
-0.1928702, -0.5957848, -3.044841, 0, 1, 0.4666667, 1,
-0.1873903, -0.1065064, -3.230504, 0, 1, 0.4705882, 1,
-0.18347, -0.7102537, -2.843083, 0, 1, 0.4784314, 1,
-0.1831798, -0.07287537, -1.522924, 0, 1, 0.4823529, 1,
-0.1824847, 0.4670963, -1.250011, 0, 1, 0.4901961, 1,
-0.1820745, -1.384727, -3.183415, 0, 1, 0.4941176, 1,
-0.1798718, -0.4432731, -1.348079, 0, 1, 0.5019608, 1,
-0.1787, -0.1532981, -3.99631, 0, 1, 0.509804, 1,
-0.1769471, 0.07482956, -1.257598, 0, 1, 0.5137255, 1,
-0.1766791, 1.590202, 1.324557, 0, 1, 0.5215687, 1,
-0.1754257, 2.145348, -0.8893805, 0, 1, 0.5254902, 1,
-0.1727345, -0.007246992, -1.918172, 0, 1, 0.5333334, 1,
-0.1723624, 0.3961581, -0.4491077, 0, 1, 0.5372549, 1,
-0.1696826, -1.187489, -3.053339, 0, 1, 0.5450981, 1,
-0.1684669, 1.041168, -0.4160161, 0, 1, 0.5490196, 1,
-0.1630199, 0.4061849, 0.2008262, 0, 1, 0.5568628, 1,
-0.1608665, -0.5069575, -2.072535, 0, 1, 0.5607843, 1,
-0.1596796, 0.7690226, 0.3437135, 0, 1, 0.5686275, 1,
-0.1591466, 0.9796107, 0.121419, 0, 1, 0.572549, 1,
-0.1584222, 2.142959, -0.2992413, 0, 1, 0.5803922, 1,
-0.1568957, 2.230251, 0.18367, 0, 1, 0.5843138, 1,
-0.155307, -1.890558, -1.568155, 0, 1, 0.5921569, 1,
-0.1521079, 2.359779, -1.04006, 0, 1, 0.5960785, 1,
-0.1516575, -0.5726892, -3.765611, 0, 1, 0.6039216, 1,
-0.1515781, 0.1164493, -1.458352, 0, 1, 0.6117647, 1,
-0.1511197, -1.595742, -3.777149, 0, 1, 0.6156863, 1,
-0.1386799, 0.007757366, -1.293595, 0, 1, 0.6235294, 1,
-0.1344478, 1.040765, 0.1684431, 0, 1, 0.627451, 1,
-0.1342866, -0.4977096, -2.365454, 0, 1, 0.6352941, 1,
-0.1342584, -0.7551022, -3.182369, 0, 1, 0.6392157, 1,
-0.121921, 0.7741772, 0.06018052, 0, 1, 0.6470588, 1,
-0.1184836, 0.1484411, -0.6168625, 0, 1, 0.6509804, 1,
-0.1183231, 1.256308, 0.7817122, 0, 1, 0.6588235, 1,
-0.1174224, -0.2664309, -4.553443, 0, 1, 0.6627451, 1,
-0.1152638, 0.8576564, 1.202357, 0, 1, 0.6705883, 1,
-0.1148059, -0.533603, -2.023262, 0, 1, 0.6745098, 1,
-0.1135271, -0.387076, -3.120995, 0, 1, 0.682353, 1,
-0.113152, -1.569986, -4.176579, 0, 1, 0.6862745, 1,
-0.1119103, 1.219362, -1.473142, 0, 1, 0.6941177, 1,
-0.1114099, -1.074308, -3.087888, 0, 1, 0.7019608, 1,
-0.1096647, -1.451269, -3.562917, 0, 1, 0.7058824, 1,
-0.1087811, 0.511952, 0.9314724, 0, 1, 0.7137255, 1,
-0.1072823, 1.93872, -0.1102415, 0, 1, 0.7176471, 1,
-0.1062703, -0.6573859, -2.008314, 0, 1, 0.7254902, 1,
-0.1051233, -1.24072, -3.632123, 0, 1, 0.7294118, 1,
-0.1049199, -0.7828546, -2.65335, 0, 1, 0.7372549, 1,
-0.1047837, -2.014663, -3.870081, 0, 1, 0.7411765, 1,
-0.0919976, 0.8920867, -1.299647, 0, 1, 0.7490196, 1,
-0.09005729, -0.03287011, -2.718406, 0, 1, 0.7529412, 1,
-0.08834168, -0.2812345, -3.266581, 0, 1, 0.7607843, 1,
-0.08604366, -0.6931617, -2.593874, 0, 1, 0.7647059, 1,
-0.08528854, -0.9067273, -2.512724, 0, 1, 0.772549, 1,
-0.07494013, 1.105979, 0.9466387, 0, 1, 0.7764706, 1,
-0.06685303, 0.4719324, 0.01440865, 0, 1, 0.7843137, 1,
-0.06353518, -0.9610945, -2.155511, 0, 1, 0.7882353, 1,
-0.06250188, -0.563484, -2.566841, 0, 1, 0.7960784, 1,
-0.05568795, -0.7569875, -2.980652, 0, 1, 0.8039216, 1,
-0.05502656, -0.6830151, -2.514294, 0, 1, 0.8078431, 1,
-0.05218922, 0.5309579, 0.8983572, 0, 1, 0.8156863, 1,
-0.04466733, 0.4054539, -1.203556, 0, 1, 0.8196079, 1,
-0.04434305, -0.5298378, -2.904846, 0, 1, 0.827451, 1,
-0.04422178, 0.9947674, -0.7054956, 0, 1, 0.8313726, 1,
-0.0440818, -1.496599, -3.943645, 0, 1, 0.8392157, 1,
-0.04192808, -1.20061, -4.973641, 0, 1, 0.8431373, 1,
-0.04159301, -1.943818, -2.120821, 0, 1, 0.8509804, 1,
-0.04030382, -0.5205672, -1.37457, 0, 1, 0.854902, 1,
-0.0365301, -0.8479427, -1.546615, 0, 1, 0.8627451, 1,
-0.03488, -1.507519, -5.221754, 0, 1, 0.8666667, 1,
-0.03065138, -0.5574474, -4.600063, 0, 1, 0.8745098, 1,
-0.02880586, 0.6075547, 0.4488841, 0, 1, 0.8784314, 1,
-0.02742059, -0.9457495, -4.114417, 0, 1, 0.8862745, 1,
-0.02586298, 0.3135177, 0.6584193, 0, 1, 0.8901961, 1,
-0.02498518, -1.270792, -1.321514, 0, 1, 0.8980392, 1,
-0.02164204, 0.111932, 0.4810362, 0, 1, 0.9058824, 1,
-0.02041026, 1.496896, 1.701627, 0, 1, 0.9098039, 1,
-0.01380417, 0.5162147, 0.5057477, 0, 1, 0.9176471, 1,
-0.008468002, 0.2928775, 0.9678022, 0, 1, 0.9215686, 1,
-0.006687387, 0.5597397, -1.17485, 0, 1, 0.9294118, 1,
-0.006492003, -1.484893, -2.273216, 0, 1, 0.9333333, 1,
-0.005189276, 0.7786639, -0.6154559, 0, 1, 0.9411765, 1,
-0.002776832, 1.857693, 1.622828, 0, 1, 0.945098, 1,
0.002900637, -0.6954016, 3.252128, 0, 1, 0.9529412, 1,
0.003767931, 1.412834, -0.6752832, 0, 1, 0.9568627, 1,
0.003846791, -1.151792, 3.184071, 0, 1, 0.9647059, 1,
0.004219319, 0.5504858, 0.06782326, 0, 1, 0.9686275, 1,
0.0064449, -0.806458, 4.321312, 0, 1, 0.9764706, 1,
0.009155776, 0.7863935, -0.9984165, 0, 1, 0.9803922, 1,
0.01113667, 0.205609, 0.3103972, 0, 1, 0.9882353, 1,
0.01342048, -0.4702085, 4.282077, 0, 1, 0.9921569, 1,
0.01455983, 1.126919, -1.143799, 0, 1, 1, 1,
0.01580892, -0.3830693, 2.07849, 0, 0.9921569, 1, 1,
0.01662118, 0.4673474, 0.5057675, 0, 0.9882353, 1, 1,
0.02444951, -0.8512601, 3.518892, 0, 0.9803922, 1, 1,
0.02743109, -1.887143, 2.136971, 0, 0.9764706, 1, 1,
0.02849003, -1.488232, 4.354062, 0, 0.9686275, 1, 1,
0.02958812, 0.8433244, 0.435599, 0, 0.9647059, 1, 1,
0.04273443, 1.123823, -1.127257, 0, 0.9568627, 1, 1,
0.04315435, -0.07140323, 2.167386, 0, 0.9529412, 1, 1,
0.04828873, -0.1948045, 2.199368, 0, 0.945098, 1, 1,
0.05002436, -0.6969566, 4.488929, 0, 0.9411765, 1, 1,
0.05476149, 0.8292131, -0.7355291, 0, 0.9333333, 1, 1,
0.05619081, -0.638014, 1.266291, 0, 0.9294118, 1, 1,
0.05710195, 0.01812336, 2.083915, 0, 0.9215686, 1, 1,
0.0589378, 0.03648377, -0.01961504, 0, 0.9176471, 1, 1,
0.06032619, -2.286839, 2.768378, 0, 0.9098039, 1, 1,
0.06691718, 0.8476238, 0.3765078, 0, 0.9058824, 1, 1,
0.06772877, 0.08666576, 0.2067783, 0, 0.8980392, 1, 1,
0.0700619, -0.09875863, 3.975586, 0, 0.8901961, 1, 1,
0.07053214, -0.02403487, 0.709637, 0, 0.8862745, 1, 1,
0.0732857, -0.9046975, 2.431572, 0, 0.8784314, 1, 1,
0.07446805, -0.4831934, 3.53413, 0, 0.8745098, 1, 1,
0.0769807, -0.5155164, 4.112495, 0, 0.8666667, 1, 1,
0.07800621, 0.4086067, 0.3724644, 0, 0.8627451, 1, 1,
0.07839365, 0.3191012, 0.8379475, 0, 0.854902, 1, 1,
0.08315082, -1.580184, 3.124655, 0, 0.8509804, 1, 1,
0.08556418, -1.371861, 3.498333, 0, 0.8431373, 1, 1,
0.08568152, -0.3841209, 2.198667, 0, 0.8392157, 1, 1,
0.08602983, -0.1924217, 2.166891, 0, 0.8313726, 1, 1,
0.08990809, 1.778406, 2.354008, 0, 0.827451, 1, 1,
0.09086764, 1.13931, -1.020592, 0, 0.8196079, 1, 1,
0.09196897, -0.07376248, 2.771787, 0, 0.8156863, 1, 1,
0.09337368, 0.7685677, 1.410104, 0, 0.8078431, 1, 1,
0.09596528, 0.5575053, -0.2185742, 0, 0.8039216, 1, 1,
0.09740993, -1.504914, 3.079859, 0, 0.7960784, 1, 1,
0.1044913, 0.9989374, -0.7303025, 0, 0.7882353, 1, 1,
0.1082114, -0.7077279, 3.414802, 0, 0.7843137, 1, 1,
0.1124033, 0.6479137, 1.878982, 0, 0.7764706, 1, 1,
0.1203167, -0.5938413, 2.963789, 0, 0.772549, 1, 1,
0.121296, -0.802197, 3.196635, 0, 0.7647059, 1, 1,
0.125138, -2.681828, 4.746791, 0, 0.7607843, 1, 1,
0.1263904, -0.3004256, 3.532748, 0, 0.7529412, 1, 1,
0.1276373, -0.4587554, 3.460912, 0, 0.7490196, 1, 1,
0.1298159, 0.6010087, 0.1105451, 0, 0.7411765, 1, 1,
0.1299252, 0.08644313, 1.515504, 0, 0.7372549, 1, 1,
0.1393854, -0.6005939, 3.729858, 0, 0.7294118, 1, 1,
0.1407015, 1.991939, 0.2338208, 0, 0.7254902, 1, 1,
0.1425292, -1.285961, 2.868869, 0, 0.7176471, 1, 1,
0.1475794, 0.4025575, -1.027866, 0, 0.7137255, 1, 1,
0.1503428, 0.4935788, 0.7386927, 0, 0.7058824, 1, 1,
0.1520212, -0.06092706, 1.079819, 0, 0.6980392, 1, 1,
0.1530688, 0.1433309, 0.40181, 0, 0.6941177, 1, 1,
0.1538827, -1.18013, 5.310935, 0, 0.6862745, 1, 1,
0.1575029, -0.8544844, 2.66284, 0, 0.682353, 1, 1,
0.1600775, 0.1281259, 1.828042, 0, 0.6745098, 1, 1,
0.1608504, -1.535698, 2.514714, 0, 0.6705883, 1, 1,
0.1609295, 0.9245548, 0.8298602, 0, 0.6627451, 1, 1,
0.1613667, -1.638017, 3.072886, 0, 0.6588235, 1, 1,
0.1617019, 2.332209, -0.639459, 0, 0.6509804, 1, 1,
0.164628, 0.3627685, -1.037124, 0, 0.6470588, 1, 1,
0.1657841, -1.689572, 3.173494, 0, 0.6392157, 1, 1,
0.1672853, 0.3271761, 1.132436, 0, 0.6352941, 1, 1,
0.1686378, -0.4984311, 1.876361, 0, 0.627451, 1, 1,
0.1731898, 0.0719756, 1.536654, 0, 0.6235294, 1, 1,
0.1738218, -0.2782798, 4.135818, 0, 0.6156863, 1, 1,
0.1760336, -0.797258, 2.790724, 0, 0.6117647, 1, 1,
0.1764887, -0.008311605, 1.454595, 0, 0.6039216, 1, 1,
0.1782574, 1.719829, 1.003082, 0, 0.5960785, 1, 1,
0.180085, -1.522322, 2.874084, 0, 0.5921569, 1, 1,
0.1808998, -0.3504008, 2.945236, 0, 0.5843138, 1, 1,
0.1815105, -1.68475, 2.409896, 0, 0.5803922, 1, 1,
0.1834441, 1.318693, 0.07358029, 0, 0.572549, 1, 1,
0.1849838, 0.7561873, -1.31826, 0, 0.5686275, 1, 1,
0.1851063, 1.465108, -0.8656476, 0, 0.5607843, 1, 1,
0.187849, 0.2852522, -0.3684994, 0, 0.5568628, 1, 1,
0.1881772, -0.3895931, 2.667536, 0, 0.5490196, 1, 1,
0.1890614, -1.147312, 3.675961, 0, 0.5450981, 1, 1,
0.1918329, 0.05354765, 1.66578, 0, 0.5372549, 1, 1,
0.192431, -0.6486266, 0.8726357, 0, 0.5333334, 1, 1,
0.1928384, 0.7482564, -0.5124366, 0, 0.5254902, 1, 1,
0.1929238, -0.0945089, 1.821255, 0, 0.5215687, 1, 1,
0.1931828, 0.3536493, 0.7161316, 0, 0.5137255, 1, 1,
0.1945514, 0.7543461, -0.9879069, 0, 0.509804, 1, 1,
0.1945807, -0.6340269, 4.26496, 0, 0.5019608, 1, 1,
0.195247, 0.3092795, 0.2551066, 0, 0.4941176, 1, 1,
0.1987837, 0.8498569, -0.681627, 0, 0.4901961, 1, 1,
0.200034, 0.8389786, 0.3529876, 0, 0.4823529, 1, 1,
0.2008542, 0.3229887, -0.5107309, 0, 0.4784314, 1, 1,
0.2054817, -1.696918, 2.995169, 0, 0.4705882, 1, 1,
0.2078413, 0.6050811, 0.3528263, 0, 0.4666667, 1, 1,
0.2123649, -2.793935, 0.9970741, 0, 0.4588235, 1, 1,
0.2149487, -1.022288, 4.196198, 0, 0.454902, 1, 1,
0.2165055, -0.5462215, 1.421933, 0, 0.4470588, 1, 1,
0.2172044, -1.102806, 2.943368, 0, 0.4431373, 1, 1,
0.2191534, -2.062217, 2.881541, 0, 0.4352941, 1, 1,
0.2191796, 0.370877, -0.8577977, 0, 0.4313726, 1, 1,
0.221319, 0.0689021, 1.820616, 0, 0.4235294, 1, 1,
0.2217537, 0.3340454, 2.843574, 0, 0.4196078, 1, 1,
0.223621, -1.515676, 2.428974, 0, 0.4117647, 1, 1,
0.2319148, -1.789276, 3.49333, 0, 0.4078431, 1, 1,
0.2319455, -0.4257607, 1.964492, 0, 0.4, 1, 1,
0.236319, 0.1044133, 2.147137, 0, 0.3921569, 1, 1,
0.2390134, 0.9450873, 0.9812722, 0, 0.3882353, 1, 1,
0.2392059, 0.8488657, -0.5927418, 0, 0.3803922, 1, 1,
0.24845, -0.3659845, 0.7202354, 0, 0.3764706, 1, 1,
0.2495033, -0.06201374, 2.20354, 0, 0.3686275, 1, 1,
0.2499096, -0.2412902, 1.449874, 0, 0.3647059, 1, 1,
0.2504059, 0.9106059, 0.5454569, 0, 0.3568628, 1, 1,
0.2527564, 0.4389773, -1.560432, 0, 0.3529412, 1, 1,
0.2564494, -0.6662141, 1.961551, 0, 0.345098, 1, 1,
0.2570906, 0.2864994, 1.000461, 0, 0.3411765, 1, 1,
0.2689132, -1.513693, 2.430896, 0, 0.3333333, 1, 1,
0.2691019, -1.084835, 4.473643, 0, 0.3294118, 1, 1,
0.2692152, 0.2725156, 2.070599, 0, 0.3215686, 1, 1,
0.2722522, -1.009507, 3.915486, 0, 0.3176471, 1, 1,
0.2724252, 2.034212, -1.19262, 0, 0.3098039, 1, 1,
0.2745573, 0.5258981, 0.3767312, 0, 0.3058824, 1, 1,
0.2763946, -0.2273736, 0.4304003, 0, 0.2980392, 1, 1,
0.2799429, 0.2791359, 2.464283, 0, 0.2901961, 1, 1,
0.2833887, 0.4397034, 1.384974, 0, 0.2862745, 1, 1,
0.2840427, -0.1978981, 2.058497, 0, 0.2784314, 1, 1,
0.2840673, 0.8777798, -0.9150954, 0, 0.2745098, 1, 1,
0.2850252, -1.46364, 3.74734, 0, 0.2666667, 1, 1,
0.2851989, -0.7519724, 2.508662, 0, 0.2627451, 1, 1,
0.2871583, -1.834046, 3.286366, 0, 0.254902, 1, 1,
0.287505, -1.327774, 3.205287, 0, 0.2509804, 1, 1,
0.2895929, -0.8403642, 4.735279, 0, 0.2431373, 1, 1,
0.2900049, 0.648477, 0.9446892, 0, 0.2392157, 1, 1,
0.2907638, 0.08347761, 0.01746439, 0, 0.2313726, 1, 1,
0.2937044, -0.5120894, 4.477095, 0, 0.227451, 1, 1,
0.2941024, 0.2086976, 1.074286, 0, 0.2196078, 1, 1,
0.2948263, 1.268465, 0.8613462, 0, 0.2156863, 1, 1,
0.3035092, -0.1732768, 2.134773, 0, 0.2078431, 1, 1,
0.3072599, -0.5945997, 3.92279, 0, 0.2039216, 1, 1,
0.3075376, -0.4550452, 3.682966, 0, 0.1960784, 1, 1,
0.3077127, -0.1024219, 0.9046201, 0, 0.1882353, 1, 1,
0.3115081, -0.9676924, 2.288168, 0, 0.1843137, 1, 1,
0.3136491, -1.701499, 4.860888, 0, 0.1764706, 1, 1,
0.3194749, -1.570776, 3.149346, 0, 0.172549, 1, 1,
0.3207343, -2.637993, 3.218213, 0, 0.1647059, 1, 1,
0.3357409, 2.15755, 0.1603294, 0, 0.1607843, 1, 1,
0.3405693, 2.922576, -0.4282129, 0, 0.1529412, 1, 1,
0.3409051, -0.7154298, 1.460117, 0, 0.1490196, 1, 1,
0.3416008, -0.01861645, 1.581902, 0, 0.1411765, 1, 1,
0.3433936, -1.336945, 2.963657, 0, 0.1372549, 1, 1,
0.3457652, 0.09142797, 0.7223314, 0, 0.1294118, 1, 1,
0.348818, -0.2535435, 2.429409, 0, 0.1254902, 1, 1,
0.3488622, -1.086741, 2.525431, 0, 0.1176471, 1, 1,
0.3509415, 0.3051181, 1.853474, 0, 0.1137255, 1, 1,
0.3534466, -1.925986, 3.366263, 0, 0.1058824, 1, 1,
0.3572054, -1.90218, 2.965003, 0, 0.09803922, 1, 1,
0.3576338, 0.07891015, -0.7047029, 0, 0.09411765, 1, 1,
0.3584241, -0.5048295, 2.443519, 0, 0.08627451, 1, 1,
0.3650348, 0.3105581, -0.3972752, 0, 0.08235294, 1, 1,
0.3657249, 1.352272, 0.7821963, 0, 0.07450981, 1, 1,
0.3660996, -1.751127, 1.543555, 0, 0.07058824, 1, 1,
0.3666244, 1.449118, -0.3865369, 0, 0.0627451, 1, 1,
0.3732088, 0.9282248, 0.3239076, 0, 0.05882353, 1, 1,
0.3768197, -0.1806267, 1.901583, 0, 0.05098039, 1, 1,
0.3774796, -0.9602146, 2.046238, 0, 0.04705882, 1, 1,
0.3845841, -0.9714243, 3.030564, 0, 0.03921569, 1, 1,
0.3850572, -0.9575801, 1.763431, 0, 0.03529412, 1, 1,
0.3866731, 0.1464969, 1.035975, 0, 0.02745098, 1, 1,
0.396475, -0.5209326, 2.965692, 0, 0.02352941, 1, 1,
0.3966959, 0.4896371, 0.2881297, 0, 0.01568628, 1, 1,
0.3975779, 0.08479971, 2.459955, 0, 0.01176471, 1, 1,
0.3978218, -0.5423298, 2.785768, 0, 0.003921569, 1, 1,
0.4006587, 1.826376, 0.6830701, 0.003921569, 0, 1, 1,
0.4023449, 1.443311, -0.2685862, 0.007843138, 0, 1, 1,
0.4074965, 2.017634, -0.3347676, 0.01568628, 0, 1, 1,
0.4140541, -0.325053, 2.078468, 0.01960784, 0, 1, 1,
0.4141753, -0.2749719, 1.321514, 0.02745098, 0, 1, 1,
0.4175845, 0.09599098, 0.4474349, 0.03137255, 0, 1, 1,
0.4234549, -0.4014083, 2.812449, 0.03921569, 0, 1, 1,
0.4275006, 0.8010987, 0.09006362, 0.04313726, 0, 1, 1,
0.432734, 0.9153521, 0.1445519, 0.05098039, 0, 1, 1,
0.434785, -0.3737801, 0.7969378, 0.05490196, 0, 1, 1,
0.4349875, 0.4678236, 2.414567, 0.0627451, 0, 1, 1,
0.4367591, -2.228425, 2.440118, 0.06666667, 0, 1, 1,
0.4418685, -1.519992, 2.442908, 0.07450981, 0, 1, 1,
0.4451687, -0.6770914, 2.835117, 0.07843138, 0, 1, 1,
0.4482467, -0.8908831, 3.935204, 0.08627451, 0, 1, 1,
0.4526919, 1.010829, -0.7967092, 0.09019608, 0, 1, 1,
0.453543, 0.2835578, -0.8548204, 0.09803922, 0, 1, 1,
0.4536097, 0.8883103, 1.504944, 0.1058824, 0, 1, 1,
0.4572769, 0.3189335, 1.001384, 0.1098039, 0, 1, 1,
0.4598691, -1.243123, 4.223746, 0.1176471, 0, 1, 1,
0.4609247, 1.946342, -1.407717, 0.1215686, 0, 1, 1,
0.4626761, -0.9540021, 3.292504, 0.1294118, 0, 1, 1,
0.4636048, 0.08856302, 0.9863404, 0.1333333, 0, 1, 1,
0.4640049, -0.5628346, 2.565275, 0.1411765, 0, 1, 1,
0.4713676, 0.8120943, 2.001955, 0.145098, 0, 1, 1,
0.4722441, 1.627644, -0.03636205, 0.1529412, 0, 1, 1,
0.4779084, 0.385772, 0.7390468, 0.1568628, 0, 1, 1,
0.4792158, 0.5913056, -0.4371868, 0.1647059, 0, 1, 1,
0.4794631, 1.365965, 0.5812947, 0.1686275, 0, 1, 1,
0.4799542, 1.624961, -0.4902492, 0.1764706, 0, 1, 1,
0.482178, -0.480321, 1.277792, 0.1803922, 0, 1, 1,
0.4861653, -0.04563043, 1.783427, 0.1882353, 0, 1, 1,
0.4862385, 1.318663, -0.4980994, 0.1921569, 0, 1, 1,
0.4946726, -0.4202412, 2.04693, 0.2, 0, 1, 1,
0.4957267, -0.4394608, 2.900759, 0.2078431, 0, 1, 1,
0.4994186, -1.080629, 1.965392, 0.2117647, 0, 1, 1,
0.5037705, -0.3650965, 3.59907, 0.2196078, 0, 1, 1,
0.5101589, 1.149576, -0.4312733, 0.2235294, 0, 1, 1,
0.5159937, -2.092764, 3.460036, 0.2313726, 0, 1, 1,
0.517388, 0.3828026, 0.3678061, 0.2352941, 0, 1, 1,
0.5196946, 2.209623, -1.944008, 0.2431373, 0, 1, 1,
0.5224111, -0.3044739, 1.094078, 0.2470588, 0, 1, 1,
0.5264781, -0.8509625, 1.926041, 0.254902, 0, 1, 1,
0.5302535, -0.1103864, 1.76292, 0.2588235, 0, 1, 1,
0.5315645, 0.5889858, 0.426468, 0.2666667, 0, 1, 1,
0.5324606, 1.152943, 1.069411, 0.2705882, 0, 1, 1,
0.5354701, 0.5418906, 1.680872, 0.2784314, 0, 1, 1,
0.5409362, -0.9442383, 3.947599, 0.282353, 0, 1, 1,
0.5412918, -0.2675247, 1.196049, 0.2901961, 0, 1, 1,
0.5456716, 0.08574945, 0.6582433, 0.2941177, 0, 1, 1,
0.5569225, -0.6530134, 3.374271, 0.3019608, 0, 1, 1,
0.5652394, 0.9434741, 1.592687, 0.3098039, 0, 1, 1,
0.5677977, 0.6369253, 0.9499752, 0.3137255, 0, 1, 1,
0.5724761, -0.666133, 4.182829, 0.3215686, 0, 1, 1,
0.5763162, 2.657604, -0.03803451, 0.3254902, 0, 1, 1,
0.5768203, 0.4668469, 1.564082, 0.3333333, 0, 1, 1,
0.587653, 0.9636537, 0.2023605, 0.3372549, 0, 1, 1,
0.5877001, 1.429334, 1.531143, 0.345098, 0, 1, 1,
0.5899562, -1.654816, 2.506996, 0.3490196, 0, 1, 1,
0.5933018, -0.9968508, 4.361583, 0.3568628, 0, 1, 1,
0.5957702, 1.085385, -0.913066, 0.3607843, 0, 1, 1,
0.5977052, -0.2484722, 2.418742, 0.3686275, 0, 1, 1,
0.6001652, 0.2632491, 0.9588068, 0.372549, 0, 1, 1,
0.6027199, 0.6244513, 0.4561809, 0.3803922, 0, 1, 1,
0.6056449, 0.4879474, 1.283121, 0.3843137, 0, 1, 1,
0.6059933, -0.3199148, 2.181067, 0.3921569, 0, 1, 1,
0.6220299, 1.074078, 1.244698, 0.3960784, 0, 1, 1,
0.6285331, -0.6873327, 2.798217, 0.4039216, 0, 1, 1,
0.6322357, 1.730789, -0.9033225, 0.4117647, 0, 1, 1,
0.6378867, -0.627308, 2.464813, 0.4156863, 0, 1, 1,
0.6414285, 0.501563, 1.378634, 0.4235294, 0, 1, 1,
0.6431745, -0.8193547, 3.223099, 0.427451, 0, 1, 1,
0.6480739, -0.9232073, 2.695886, 0.4352941, 0, 1, 1,
0.6497659, -0.5205982, 1.117492, 0.4392157, 0, 1, 1,
0.651937, 2.576521, 0.077549, 0.4470588, 0, 1, 1,
0.6527818, -0.8395488, 1.957234, 0.4509804, 0, 1, 1,
0.6532378, 0.8104971, 0.2959309, 0.4588235, 0, 1, 1,
0.656215, 0.7907094, 1.650526, 0.4627451, 0, 1, 1,
0.6565019, 0.1347295, 0.7638364, 0.4705882, 0, 1, 1,
0.6682721, 0.2891713, 1.194528, 0.4745098, 0, 1, 1,
0.6697476, 0.5527071, 0.373046, 0.4823529, 0, 1, 1,
0.6793839, -0.09908763, 2.471708, 0.4862745, 0, 1, 1,
0.6831138, 0.3043124, 0.08630733, 0.4941176, 0, 1, 1,
0.6964325, 1.040132, 1.111652, 0.5019608, 0, 1, 1,
0.6972014, 1.788074, 0.3748419, 0.5058824, 0, 1, 1,
0.6989618, 0.9680637, -0.3013668, 0.5137255, 0, 1, 1,
0.7017482, -0.06752061, 1.51148, 0.5176471, 0, 1, 1,
0.7056313, 0.2475521, 2.807354, 0.5254902, 0, 1, 1,
0.7076806, 0.658485, 1.430788, 0.5294118, 0, 1, 1,
0.7101176, 0.8315706, -0.9653693, 0.5372549, 0, 1, 1,
0.7123358, 1.12276, 0.0400719, 0.5411765, 0, 1, 1,
0.713506, -1.137548, 2.481022, 0.5490196, 0, 1, 1,
0.7207986, -0.055585, 3.294395, 0.5529412, 0, 1, 1,
0.7232019, -0.6340373, 1.838355, 0.5607843, 0, 1, 1,
0.726262, 0.2478452, 1.643551, 0.5647059, 0, 1, 1,
0.7326302, -1.959846, 3.597681, 0.572549, 0, 1, 1,
0.7333895, -0.9994661, 2.596682, 0.5764706, 0, 1, 1,
0.7368562, -2.43109, 3.119805, 0.5843138, 0, 1, 1,
0.7456068, -0.6985943, 1.994695, 0.5882353, 0, 1, 1,
0.7464306, 0.7152471, 1.964821, 0.5960785, 0, 1, 1,
0.7535931, 0.08116078, 1.112946, 0.6039216, 0, 1, 1,
0.7543894, 0.111853, 2.607457, 0.6078432, 0, 1, 1,
0.7569481, 1.852409, -0.1970501, 0.6156863, 0, 1, 1,
0.7575352, 0.5321703, 0.4110275, 0.6196079, 0, 1, 1,
0.7614428, 1.165417, 1.751497, 0.627451, 0, 1, 1,
0.7637729, -1.074442, 2.717277, 0.6313726, 0, 1, 1,
0.7679503, 0.124615, 1.761028, 0.6392157, 0, 1, 1,
0.7767866, 1.072089, 0.2149339, 0.6431373, 0, 1, 1,
0.7782796, 1.919277, 0.2669358, 0.6509804, 0, 1, 1,
0.7807288, -0.3759178, 2.079599, 0.654902, 0, 1, 1,
0.782867, -1.288917, 4.635629, 0.6627451, 0, 1, 1,
0.786594, 1.055284, 0.2040868, 0.6666667, 0, 1, 1,
0.7902799, 0.3304181, 1.163241, 0.6745098, 0, 1, 1,
0.7977385, -1.160709, 2.344594, 0.6784314, 0, 1, 1,
0.8020851, 0.07229632, 2.544559, 0.6862745, 0, 1, 1,
0.8034211, 0.239036, 2.927958, 0.6901961, 0, 1, 1,
0.8039037, -1.071974, 1.022101, 0.6980392, 0, 1, 1,
0.8090768, 0.0249391, 1.876197, 0.7058824, 0, 1, 1,
0.8091052, 0.6585494, 1.098604, 0.7098039, 0, 1, 1,
0.8111391, -0.8580642, 2.866115, 0.7176471, 0, 1, 1,
0.8113147, 1.02809, 0.6077487, 0.7215686, 0, 1, 1,
0.8124897, 1.107433, 1.245495, 0.7294118, 0, 1, 1,
0.8177193, -0.9387798, 2.228507, 0.7333333, 0, 1, 1,
0.818381, -0.03284533, 1.148944, 0.7411765, 0, 1, 1,
0.8215978, 1.355515, 1.273164, 0.7450981, 0, 1, 1,
0.8287768, -1.735727, 2.776589, 0.7529412, 0, 1, 1,
0.8312789, 0.0361231, 1.053895, 0.7568628, 0, 1, 1,
0.8340035, 0.3106252, -0.5486355, 0.7647059, 0, 1, 1,
0.8341684, -0.2129983, 0.3995227, 0.7686275, 0, 1, 1,
0.8371164, -1.10742, 2.36293, 0.7764706, 0, 1, 1,
0.8399383, 2.604551, 1.805863, 0.7803922, 0, 1, 1,
0.8412631, 1.140486, 0.4863019, 0.7882353, 0, 1, 1,
0.8414708, -0.04067278, 1.680666, 0.7921569, 0, 1, 1,
0.8450414, 0.3394491, 2.349588, 0.8, 0, 1, 1,
0.8496016, 0.2010755, 0.332914, 0.8078431, 0, 1, 1,
0.8515851, -0.5500959, 0.8256536, 0.8117647, 0, 1, 1,
0.8516302, -1.86476, 2.055442, 0.8196079, 0, 1, 1,
0.8542665, -0.465079, 3.175238, 0.8235294, 0, 1, 1,
0.8569039, -1.317031, 1.238657, 0.8313726, 0, 1, 1,
0.8651611, -1.014243, 2.813834, 0.8352941, 0, 1, 1,
0.8686135, 1.287846, 3.263173, 0.8431373, 0, 1, 1,
0.8717315, 0.4124592, 1.463681, 0.8470588, 0, 1, 1,
0.8717342, -1.356039, 1.729138, 0.854902, 0, 1, 1,
0.8725753, 0.8483351, 0.6358076, 0.8588235, 0, 1, 1,
0.8815794, -1.910531, 2.649391, 0.8666667, 0, 1, 1,
0.8827903, 0.4349371, 3.237494, 0.8705882, 0, 1, 1,
0.8867909, -0.4909111, 4.287853, 0.8784314, 0, 1, 1,
0.8891008, 0.6466845, 1.355789, 0.8823529, 0, 1, 1,
0.8963981, -0.4079471, 0.9753607, 0.8901961, 0, 1, 1,
0.8983729, 0.3540512, 2.446761, 0.8941177, 0, 1, 1,
0.9054036, 0.2424117, 0.8111361, 0.9019608, 0, 1, 1,
0.9116942, -0.787119, 1.231222, 0.9098039, 0, 1, 1,
0.9126832, 0.9885662, -0.480673, 0.9137255, 0, 1, 1,
0.9157631, -1.177526, 2.363006, 0.9215686, 0, 1, 1,
0.9164171, 0.6220424, 1.965498, 0.9254902, 0, 1, 1,
0.9205564, 0.2519943, 0.3935836, 0.9333333, 0, 1, 1,
0.9206918, -0.1119237, 2.998333, 0.9372549, 0, 1, 1,
0.9217587, -0.5447608, 0.7152183, 0.945098, 0, 1, 1,
0.9219555, -0.4235022, 2.524607, 0.9490196, 0, 1, 1,
0.9239598, -0.1608619, 2.430174, 0.9568627, 0, 1, 1,
0.924939, -0.6162954, 2.317034, 0.9607843, 0, 1, 1,
0.9250476, -1.375672, 2.691513, 0.9686275, 0, 1, 1,
0.9320551, 0.5601104, 1.742456, 0.972549, 0, 1, 1,
0.9514278, 0.7931612, 1.486089, 0.9803922, 0, 1, 1,
0.955593, -0.7443877, 1.746248, 0.9843137, 0, 1, 1,
0.9587356, -1.144495, 2.497833, 0.9921569, 0, 1, 1,
0.9602941, 0.02843906, 1.447391, 0.9960784, 0, 1, 1,
0.967301, -1.055097, 1.110123, 1, 0, 0.9960784, 1,
0.9679398, -0.1550085, 1.030447, 1, 0, 0.9882353, 1,
0.9770904, 0.6355679, 1.557746, 1, 0, 0.9843137, 1,
0.9773684, -0.1246947, 0.829308, 1, 0, 0.9764706, 1,
0.9844884, -0.7927116, 1.916284, 1, 0, 0.972549, 1,
0.9862889, -0.3607364, 1.982271, 1, 0, 0.9647059, 1,
0.9864985, 0.2432706, 1.569761, 1, 0, 0.9607843, 1,
0.989323, -0.08249035, 2.170729, 1, 0, 0.9529412, 1,
0.9914001, -1.353331, 2.688799, 1, 0, 0.9490196, 1,
0.9942231, 0.7274207, 1.208412, 1, 0, 0.9411765, 1,
0.9998853, 0.3323539, 2.862417, 1, 0, 0.9372549, 1,
1.001996, -0.5799072, 1.428884, 1, 0, 0.9294118, 1,
1.003419, 0.2854874, 0.9606755, 1, 0, 0.9254902, 1,
1.003484, -1.761037, 2.15296, 1, 0, 0.9176471, 1,
1.004191, -0.836403, 2.023592, 1, 0, 0.9137255, 1,
1.004915, 0.6152349, 1.380128, 1, 0, 0.9058824, 1,
1.008463, -0.6613837, 1.380908, 1, 0, 0.9019608, 1,
1.018639, -0.05609731, 1.470378, 1, 0, 0.8941177, 1,
1.024361, -0.02740676, 2.141159, 1, 0, 0.8862745, 1,
1.041049, 0.6310188, 0.349215, 1, 0, 0.8823529, 1,
1.042306, -1.003541, 2.258596, 1, 0, 0.8745098, 1,
1.046463, 0.6303926, -0.3092626, 1, 0, 0.8705882, 1,
1.050287, 1.350639, 0.5649994, 1, 0, 0.8627451, 1,
1.052573, 2.219194, -0.7860408, 1, 0, 0.8588235, 1,
1.053973, 0.6979175, 1.005406, 1, 0, 0.8509804, 1,
1.055349, -1.209603, 1.693144, 1, 0, 0.8470588, 1,
1.056123, 0.05259606, 0.1603327, 1, 0, 0.8392157, 1,
1.0563, 1.255143, -0.3187115, 1, 0, 0.8352941, 1,
1.056429, 1.983643, 0.05890502, 1, 0, 0.827451, 1,
1.058605, 1.575389, 0.00584943, 1, 0, 0.8235294, 1,
1.062976, 1.096641, 1.927374, 1, 0, 0.8156863, 1,
1.068134, 0.2665717, 0.6561866, 1, 0, 0.8117647, 1,
1.072833, 1.095405, -0.2027423, 1, 0, 0.8039216, 1,
1.080789, -1.09044, 2.927586, 1, 0, 0.7960784, 1,
1.082748, 0.5992242, 0.7441086, 1, 0, 0.7921569, 1,
1.084649, 0.3091817, 0.6492301, 1, 0, 0.7843137, 1,
1.085193, -0.4382722, 1.8028, 1, 0, 0.7803922, 1,
1.097456, -0.7470743, 3.383313, 1, 0, 0.772549, 1,
1.098024, -0.2071998, 0.4327078, 1, 0, 0.7686275, 1,
1.098147, -2.659505, 2.897955, 1, 0, 0.7607843, 1,
1.100025, 1.252645, 1.234114, 1, 0, 0.7568628, 1,
1.101968, 0.4305427, 1.648453, 1, 0, 0.7490196, 1,
1.115951, 1.152648, -0.1263352, 1, 0, 0.7450981, 1,
1.116441, 0.02774403, 1.573881, 1, 0, 0.7372549, 1,
1.119581, -0.3350014, 3.177201, 1, 0, 0.7333333, 1,
1.122178, 0.7736325, -0.1300461, 1, 0, 0.7254902, 1,
1.132455, -0.7063958, 0.700775, 1, 0, 0.7215686, 1,
1.133211, -1.592728, 2.981469, 1, 0, 0.7137255, 1,
1.135046, 1.555157, 0.6013981, 1, 0, 0.7098039, 1,
1.136209, -0.4892678, 0.7799957, 1, 0, 0.7019608, 1,
1.139735, -1.344528, -0.1082642, 1, 0, 0.6941177, 1,
1.145842, 0.05940764, 0.5602724, 1, 0, 0.6901961, 1,
1.147307, -0.7774977, 0.5691481, 1, 0, 0.682353, 1,
1.152254, -1.405796, 2.095112, 1, 0, 0.6784314, 1,
1.156591, 0.30194, 2.648724, 1, 0, 0.6705883, 1,
1.164592, 0.1215813, 1.335576, 1, 0, 0.6666667, 1,
1.169881, 0.481184, 0.9109594, 1, 0, 0.6588235, 1,
1.170777, 0.6306176, 0.5301784, 1, 0, 0.654902, 1,
1.171984, -1.03302, 3.321712, 1, 0, 0.6470588, 1,
1.175875, 1.457073, -0.3173341, 1, 0, 0.6431373, 1,
1.176097, -1.422584, 2.567116, 1, 0, 0.6352941, 1,
1.177874, 0.5533751, 0.6253274, 1, 0, 0.6313726, 1,
1.18252, -0.6763104, 1.469079, 1, 0, 0.6235294, 1,
1.185194, -1.203133, 1.211314, 1, 0, 0.6196079, 1,
1.18577, -0.1899478, 1.638359, 1, 0, 0.6117647, 1,
1.186878, 0.6004691, -0.5594204, 1, 0, 0.6078432, 1,
1.188782, 0.8190998, -0.5340181, 1, 0, 0.6, 1,
1.194235, 0.1701422, 0.7369065, 1, 0, 0.5921569, 1,
1.200008, 1.342878, -0.5782406, 1, 0, 0.5882353, 1,
1.201433, 2.501596, -1.296237, 1, 0, 0.5803922, 1,
1.205293, 1.374474, -0.5985457, 1, 0, 0.5764706, 1,
1.220646, -0.6135811, 1.260223, 1, 0, 0.5686275, 1,
1.221662, 0.561684, 2.20606, 1, 0, 0.5647059, 1,
1.22451, -0.6797001, 1.303893, 1, 0, 0.5568628, 1,
1.233973, -0.6562027, 2.553855, 1, 0, 0.5529412, 1,
1.23665, 1.101759, 3.068458, 1, 0, 0.5450981, 1,
1.236686, 1.697055, 0.6945728, 1, 0, 0.5411765, 1,
1.243796, -0.846606, 3.566404, 1, 0, 0.5333334, 1,
1.251469, 0.5428696, -0.6746323, 1, 0, 0.5294118, 1,
1.254978, 0.03964766, 2.008048, 1, 0, 0.5215687, 1,
1.283018, 0.1709292, 0.01680378, 1, 0, 0.5176471, 1,
1.293357, -1.252204, 1.325249, 1, 0, 0.509804, 1,
1.294481, -0.8272349, 1.953981, 1, 0, 0.5058824, 1,
1.295098, 0.2579977, 2.936105, 1, 0, 0.4980392, 1,
1.295636, -0.5486618, 1.765485, 1, 0, 0.4901961, 1,
1.303076, 1.204212, 0.458747, 1, 0, 0.4862745, 1,
1.316017, 0.2998564, 2.103972, 1, 0, 0.4784314, 1,
1.320955, -0.280429, 3.351341, 1, 0, 0.4745098, 1,
1.333629, 0.8950191, 0.7880307, 1, 0, 0.4666667, 1,
1.339163, 0.7803288, -0.2160835, 1, 0, 0.4627451, 1,
1.369254, -1.361049, 2.647753, 1, 0, 0.454902, 1,
1.369709, -0.4438524, 1.647551, 1, 0, 0.4509804, 1,
1.374281, 0.8800808, 2.983729, 1, 0, 0.4431373, 1,
1.384655, 0.2397075, 1.926313, 1, 0, 0.4392157, 1,
1.385479, -1.604095, 1.701619, 1, 0, 0.4313726, 1,
1.387598, 1.462265, 1.854928, 1, 0, 0.427451, 1,
1.405407, 0.1953714, 3.256634, 1, 0, 0.4196078, 1,
1.417455, 1.174416, 1.246327, 1, 0, 0.4156863, 1,
1.437428, 0.4226898, 1.670667, 1, 0, 0.4078431, 1,
1.440976, -0.6524721, 1.634962, 1, 0, 0.4039216, 1,
1.444569, 1.581279, 1.674172, 1, 0, 0.3960784, 1,
1.45875, 1.111906, 1.31475, 1, 0, 0.3882353, 1,
1.466162, 0.6391498, 0.877757, 1, 0, 0.3843137, 1,
1.467909, -0.1599405, 2.230645, 1, 0, 0.3764706, 1,
1.47592, -1.108574, 2.577276, 1, 0, 0.372549, 1,
1.483095, 0.5839643, -0.8061275, 1, 0, 0.3647059, 1,
1.491195, 0.3688904, -1.50667, 1, 0, 0.3607843, 1,
1.493459, 0.2331605, 2.453197, 1, 0, 0.3529412, 1,
1.509918, -0.3906877, 0.9720394, 1, 0, 0.3490196, 1,
1.51821, 0.2987276, 0.848921, 1, 0, 0.3411765, 1,
1.540877, -0.1554993, -0.939935, 1, 0, 0.3372549, 1,
1.543819, -1.151438, 1.191689, 1, 0, 0.3294118, 1,
1.550925, -0.5283456, 1.711699, 1, 0, 0.3254902, 1,
1.573559, 0.3104694, 1.314405, 1, 0, 0.3176471, 1,
1.575722, -0.7798347, 1.26878, 1, 0, 0.3137255, 1,
1.585806, 0.1205447, -0.4174362, 1, 0, 0.3058824, 1,
1.591636, 1.266597, -0.1343785, 1, 0, 0.2980392, 1,
1.597366, 0.2611187, 1.87387, 1, 0, 0.2941177, 1,
1.60793, 0.1822103, 2.342863, 1, 0, 0.2862745, 1,
1.628752, 1.140338, 1.847244, 1, 0, 0.282353, 1,
1.636488, -1.279442, 0.8996689, 1, 0, 0.2745098, 1,
1.643475, 0.377738, 0.5244833, 1, 0, 0.2705882, 1,
1.650142, -0.3519696, 2.225461, 1, 0, 0.2627451, 1,
1.656616, -0.5841832, 1.251465, 1, 0, 0.2588235, 1,
1.682391, 0.1438397, 1.718434, 1, 0, 0.2509804, 1,
1.691294, 1.766546, -0.583474, 1, 0, 0.2470588, 1,
1.691698, -0.02687645, 1.933085, 1, 0, 0.2392157, 1,
1.695652, -1.372726, 0.955778, 1, 0, 0.2352941, 1,
1.72194, -1.166578, 3.050285, 1, 0, 0.227451, 1,
1.72514, -0.8671674, 2.101105, 1, 0, 0.2235294, 1,
1.727991, 0.1714638, 0.5552186, 1, 0, 0.2156863, 1,
1.731634, 2.242018, 1.584778, 1, 0, 0.2117647, 1,
1.737125, -0.08433338, 1.25279, 1, 0, 0.2039216, 1,
1.756544, 1.223614, 2.293368, 1, 0, 0.1960784, 1,
1.75682, 0.3910555, 0.7776109, 1, 0, 0.1921569, 1,
1.770963, 0.4740683, 1.401429, 1, 0, 0.1843137, 1,
1.777515, -0.8885684, 1.961873, 1, 0, 0.1803922, 1,
1.795766, -0.2378757, -0.0917271, 1, 0, 0.172549, 1,
1.812895, -0.8666157, 3.137919, 1, 0, 0.1686275, 1,
1.820523, -0.494723, 1.899605, 1, 0, 0.1607843, 1,
1.824217, -1.34854, 2.337362, 1, 0, 0.1568628, 1,
1.835839, 0.4601447, 2.07083, 1, 0, 0.1490196, 1,
1.83958, -1.778574, 1.713392, 1, 0, 0.145098, 1,
1.845752, 1.600839, 0.302662, 1, 0, 0.1372549, 1,
1.913431, -0.1126925, 1.837259, 1, 0, 0.1333333, 1,
1.925229, 0.02650345, 1.870307, 1, 0, 0.1254902, 1,
1.942532, 0.1097743, 1.38494, 1, 0, 0.1215686, 1,
1.987622, -0.852933, 2.961234, 1, 0, 0.1137255, 1,
2.069221, -0.6907103, 4.058901, 1, 0, 0.1098039, 1,
2.112273, 1.447947, 1.418664, 1, 0, 0.1019608, 1,
2.166773, 0.6103483, 0.9514944, 1, 0, 0.09411765, 1,
2.250148, 0.2834553, -0.215549, 1, 0, 0.09019608, 1,
2.258828, 0.7160574, 1.916657, 1, 0, 0.08235294, 1,
2.26548, 0.8194792, -0.5334736, 1, 0, 0.07843138, 1,
2.282135, 1.472949, 1.019971, 1, 0, 0.07058824, 1,
2.285338, -2.356822, 3.892079, 1, 0, 0.06666667, 1,
2.312566, -2.216096, 3.174539, 1, 0, 0.05882353, 1,
2.405555, 0.7859588, 0.4919579, 1, 0, 0.05490196, 1,
2.437049, 1.619001, 3.331027, 1, 0, 0.04705882, 1,
2.594856, -0.8428679, 0.8008541, 1, 0, 0.04313726, 1,
2.617522, -0.1591806, 1.951743, 1, 0, 0.03529412, 1,
2.647958, -0.271659, 2.433194, 1, 0, 0.03137255, 1,
2.765693, -1.694436, 2.480233, 1, 0, 0.02352941, 1,
2.897961, 0.1604946, 0.6174348, 1, 0, 0.01960784, 1,
2.909644, 0.7462298, 0.8134725, 1, 0, 0.01176471, 1,
2.941519, -0.5288431, 2.31212, 1, 0, 0.007843138, 1
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
0.03469372, -4.220739, -7.007044, 0, -0.5, 0.5, 0.5,
0.03469372, -4.220739, -7.007044, 1, -0.5, 0.5, 0.5,
0.03469372, -4.220739, -7.007044, 1, 1.5, 0.5, 0.5,
0.03469372, -4.220739, -7.007044, 0, 1.5, 0.5, 0.5
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
-3.857546, 0.07776308, -7.007044, 0, -0.5, 0.5, 0.5,
-3.857546, 0.07776308, -7.007044, 1, -0.5, 0.5, 0.5,
-3.857546, 0.07776308, -7.007044, 1, 1.5, 0.5, 0.5,
-3.857546, 0.07776308, -7.007044, 0, 1.5, 0.5, 0.5
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
-3.857546, -4.220739, 0.04459047, 0, -0.5, 0.5, 0.5,
-3.857546, -4.220739, 0.04459047, 1, -0.5, 0.5, 0.5,
-3.857546, -4.220739, 0.04459047, 1, 1.5, 0.5, 0.5,
-3.857546, -4.220739, 0.04459047, 0, 1.5, 0.5, 0.5
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
-2, -3.228777, -5.379744,
2, -3.228777, -5.379744,
-2, -3.228777, -5.379744,
-2, -3.394104, -5.65096,
-1, -3.228777, -5.379744,
-1, -3.394104, -5.65096,
0, -3.228777, -5.379744,
0, -3.394104, -5.65096,
1, -3.228777, -5.379744,
1, -3.394104, -5.65096,
2, -3.228777, -5.379744,
2, -3.394104, -5.65096
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
-2, -3.724758, -6.193394, 0, -0.5, 0.5, 0.5,
-2, -3.724758, -6.193394, 1, -0.5, 0.5, 0.5,
-2, -3.724758, -6.193394, 1, 1.5, 0.5, 0.5,
-2, -3.724758, -6.193394, 0, 1.5, 0.5, 0.5,
-1, -3.724758, -6.193394, 0, -0.5, 0.5, 0.5,
-1, -3.724758, -6.193394, 1, -0.5, 0.5, 0.5,
-1, -3.724758, -6.193394, 1, 1.5, 0.5, 0.5,
-1, -3.724758, -6.193394, 0, 1.5, 0.5, 0.5,
0, -3.724758, -6.193394, 0, -0.5, 0.5, 0.5,
0, -3.724758, -6.193394, 1, -0.5, 0.5, 0.5,
0, -3.724758, -6.193394, 1, 1.5, 0.5, 0.5,
0, -3.724758, -6.193394, 0, 1.5, 0.5, 0.5,
1, -3.724758, -6.193394, 0, -0.5, 0.5, 0.5,
1, -3.724758, -6.193394, 1, -0.5, 0.5, 0.5,
1, -3.724758, -6.193394, 1, 1.5, 0.5, 0.5,
1, -3.724758, -6.193394, 0, 1.5, 0.5, 0.5,
2, -3.724758, -6.193394, 0, -0.5, 0.5, 0.5,
2, -3.724758, -6.193394, 1, -0.5, 0.5, 0.5,
2, -3.724758, -6.193394, 1, 1.5, 0.5, 0.5,
2, -3.724758, -6.193394, 0, 1.5, 0.5, 0.5
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
-2.959337, -3, -5.379744,
-2.959337, 3, -5.379744,
-2.959337, -3, -5.379744,
-3.109038, -3, -5.65096,
-2.959337, -2, -5.379744,
-3.109038, -2, -5.65096,
-2.959337, -1, -5.379744,
-3.109038, -1, -5.65096,
-2.959337, 0, -5.379744,
-3.109038, 0, -5.65096,
-2.959337, 1, -5.379744,
-3.109038, 1, -5.65096,
-2.959337, 2, -5.379744,
-3.109038, 2, -5.65096,
-2.959337, 3, -5.379744,
-3.109038, 3, -5.65096
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
-3.408441, -3, -6.193394, 0, -0.5, 0.5, 0.5,
-3.408441, -3, -6.193394, 1, -0.5, 0.5, 0.5,
-3.408441, -3, -6.193394, 1, 1.5, 0.5, 0.5,
-3.408441, -3, -6.193394, 0, 1.5, 0.5, 0.5,
-3.408441, -2, -6.193394, 0, -0.5, 0.5, 0.5,
-3.408441, -2, -6.193394, 1, -0.5, 0.5, 0.5,
-3.408441, -2, -6.193394, 1, 1.5, 0.5, 0.5,
-3.408441, -2, -6.193394, 0, 1.5, 0.5, 0.5,
-3.408441, -1, -6.193394, 0, -0.5, 0.5, 0.5,
-3.408441, -1, -6.193394, 1, -0.5, 0.5, 0.5,
-3.408441, -1, -6.193394, 1, 1.5, 0.5, 0.5,
-3.408441, -1, -6.193394, 0, 1.5, 0.5, 0.5,
-3.408441, 0, -6.193394, 0, -0.5, 0.5, 0.5,
-3.408441, 0, -6.193394, 1, -0.5, 0.5, 0.5,
-3.408441, 0, -6.193394, 1, 1.5, 0.5, 0.5,
-3.408441, 0, -6.193394, 0, 1.5, 0.5, 0.5,
-3.408441, 1, -6.193394, 0, -0.5, 0.5, 0.5,
-3.408441, 1, -6.193394, 1, -0.5, 0.5, 0.5,
-3.408441, 1, -6.193394, 1, 1.5, 0.5, 0.5,
-3.408441, 1, -6.193394, 0, 1.5, 0.5, 0.5,
-3.408441, 2, -6.193394, 0, -0.5, 0.5, 0.5,
-3.408441, 2, -6.193394, 1, -0.5, 0.5, 0.5,
-3.408441, 2, -6.193394, 1, 1.5, 0.5, 0.5,
-3.408441, 2, -6.193394, 0, 1.5, 0.5, 0.5,
-3.408441, 3, -6.193394, 0, -0.5, 0.5, 0.5,
-3.408441, 3, -6.193394, 1, -0.5, 0.5, 0.5,
-3.408441, 3, -6.193394, 1, 1.5, 0.5, 0.5,
-3.408441, 3, -6.193394, 0, 1.5, 0.5, 0.5
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
-2.959337, -3.228777, -4,
-2.959337, -3.228777, 4,
-2.959337, -3.228777, -4,
-3.109038, -3.394104, -4,
-2.959337, -3.228777, -2,
-3.109038, -3.394104, -2,
-2.959337, -3.228777, 0,
-3.109038, -3.394104, 0,
-2.959337, -3.228777, 2,
-3.109038, -3.394104, 2,
-2.959337, -3.228777, 4,
-3.109038, -3.394104, 4
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
-3.408441, -3.724758, -4, 0, -0.5, 0.5, 0.5,
-3.408441, -3.724758, -4, 1, -0.5, 0.5, 0.5,
-3.408441, -3.724758, -4, 1, 1.5, 0.5, 0.5,
-3.408441, -3.724758, -4, 0, 1.5, 0.5, 0.5,
-3.408441, -3.724758, -2, 0, -0.5, 0.5, 0.5,
-3.408441, -3.724758, -2, 1, -0.5, 0.5, 0.5,
-3.408441, -3.724758, -2, 1, 1.5, 0.5, 0.5,
-3.408441, -3.724758, -2, 0, 1.5, 0.5, 0.5,
-3.408441, -3.724758, 0, 0, -0.5, 0.5, 0.5,
-3.408441, -3.724758, 0, 1, -0.5, 0.5, 0.5,
-3.408441, -3.724758, 0, 1, 1.5, 0.5, 0.5,
-3.408441, -3.724758, 0, 0, 1.5, 0.5, 0.5,
-3.408441, -3.724758, 2, 0, -0.5, 0.5, 0.5,
-3.408441, -3.724758, 2, 1, -0.5, 0.5, 0.5,
-3.408441, -3.724758, 2, 1, 1.5, 0.5, 0.5,
-3.408441, -3.724758, 2, 0, 1.5, 0.5, 0.5,
-3.408441, -3.724758, 4, 0, -0.5, 0.5, 0.5,
-3.408441, -3.724758, 4, 1, -0.5, 0.5, 0.5,
-3.408441, -3.724758, 4, 1, 1.5, 0.5, 0.5,
-3.408441, -3.724758, 4, 0, 1.5, 0.5, 0.5
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
-2.959337, -3.228777, -5.379744,
-2.959337, 3.384304, -5.379744,
-2.959337, -3.228777, 5.468925,
-2.959337, 3.384304, 5.468925,
-2.959337, -3.228777, -5.379744,
-2.959337, -3.228777, 5.468925,
-2.959337, 3.384304, -5.379744,
-2.959337, 3.384304, 5.468925,
-2.959337, -3.228777, -5.379744,
3.028724, -3.228777, -5.379744,
-2.959337, -3.228777, 5.468925,
3.028724, -3.228777, 5.468925,
-2.959337, 3.384304, -5.379744,
3.028724, 3.384304, -5.379744,
-2.959337, 3.384304, 5.468925,
3.028724, 3.384304, 5.468925,
3.028724, -3.228777, -5.379744,
3.028724, 3.384304, -5.379744,
3.028724, -3.228777, 5.468925,
3.028724, 3.384304, 5.468925,
3.028724, -3.228777, -5.379744,
3.028724, -3.228777, 5.468925,
3.028724, 3.384304, -5.379744,
3.028724, 3.384304, 5.468925
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
var radius = 7.500162;
var distance = 33.36907;
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
mvMatrix.translate( -0.03469372, -0.07776308, -0.04459047 );
mvMatrix.scale( 1.354249, 1.226255, 0.7474947 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.36907);
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
methylarsonate_ammon<-read.table("methylarsonate_ammon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methylarsonate_ammon$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate_ammon' not found
```

```r
y<-methylarsonate_ammon$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate_ammon' not found
```

```r
z<-methylarsonate_ammon$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate_ammon' not found
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
-2.872132, 1.467656, -3.668014, 0, 0, 1, 1, 1,
-2.804893, -0.973439, -2.607861, 1, 0, 0, 1, 1,
-2.775857, -2.049052, -0.8207572, 1, 0, 0, 1, 1,
-2.689886, -0.9670336, -0.5927448, 1, 0, 0, 1, 1,
-2.662335, 0.4207229, 0.3479521, 1, 0, 0, 1, 1,
-2.650438, -0.2917072, -0.7026522, 1, 0, 0, 1, 1,
-2.638454, -0.4151918, -2.356985, 0, 0, 0, 1, 1,
-2.615202, 0.1092422, 0.7628235, 0, 0, 0, 1, 1,
-2.527195, -1.628499, -1.480306, 0, 0, 0, 1, 1,
-2.258371, 0.6052245, -0.05882064, 0, 0, 0, 1, 1,
-2.216927, -0.02347117, -0.5821525, 0, 0, 0, 1, 1,
-2.156408, 0.6962428, -1.681627, 0, 0, 0, 1, 1,
-2.116288, 0.905728, 0.05684651, 0, 0, 0, 1, 1,
-2.101932, -1.09337, -2.433621, 1, 1, 1, 1, 1,
-2.064364, 0.02361909, -1.278685, 1, 1, 1, 1, 1,
-2.059871, -0.509222, -2.171422, 1, 1, 1, 1, 1,
-2.023152, -0.6854534, -2.351578, 1, 1, 1, 1, 1,
-2.001802, -1.885016, -3.10495, 1, 1, 1, 1, 1,
-1.967202, -0.1281364, -3.73029, 1, 1, 1, 1, 1,
-1.941595, -0.1397696, -2.699542, 1, 1, 1, 1, 1,
-1.941373, 1.077104, -0.2178367, 1, 1, 1, 1, 1,
-1.93296, 1.590665, -0.6352504, 1, 1, 1, 1, 1,
-1.917825, 0.7475049, -1.082248, 1, 1, 1, 1, 1,
-1.913064, 0.2046733, -1.242885, 1, 1, 1, 1, 1,
-1.894036, 1.099766, -0.5572107, 1, 1, 1, 1, 1,
-1.888896, 0.0910003, -1.280051, 1, 1, 1, 1, 1,
-1.857525, 1.309187, -0.771055, 1, 1, 1, 1, 1,
-1.852893, -0.2685167, -1.108098, 1, 1, 1, 1, 1,
-1.829011, 1.293729, -1.458491, 0, 0, 1, 1, 1,
-1.819915, 0.2230173, -1.796564, 1, 0, 0, 1, 1,
-1.80287, 0.3053413, -2.0693, 1, 0, 0, 1, 1,
-1.797894, -0.1836132, -1.481957, 1, 0, 0, 1, 1,
-1.788624, 1.779591, -2.444692, 1, 0, 0, 1, 1,
-1.788273, 0.03051005, -1.901465, 1, 0, 0, 1, 1,
-1.781982, -0.8352545, -3.968774, 0, 0, 0, 1, 1,
-1.780408, -0.2308923, -2.720321, 0, 0, 0, 1, 1,
-1.764596, 0.4090948, -0.9618866, 0, 0, 0, 1, 1,
-1.718961, -1.664074, -2.64569, 0, 0, 0, 1, 1,
-1.69799, -1.879491, -2.227556, 0, 0, 0, 1, 1,
-1.685652, -0.6984635, -1.604892, 0, 0, 0, 1, 1,
-1.685373, 0.4691834, -0.3313479, 0, 0, 0, 1, 1,
-1.683359, 1.409585, -0.4469691, 1, 1, 1, 1, 1,
-1.677988, -0.7182911, -2.828533, 1, 1, 1, 1, 1,
-1.67202, 1.095951, -0.7140683, 1, 1, 1, 1, 1,
-1.67108, 1.76356, -1.204658, 1, 1, 1, 1, 1,
-1.647241, -1.25313, -1.028734, 1, 1, 1, 1, 1,
-1.64514, 1.440425, -1.376224, 1, 1, 1, 1, 1,
-1.633022, 0.3011793, -1.933741, 1, 1, 1, 1, 1,
-1.631374, 0.5366852, -1.511673, 1, 1, 1, 1, 1,
-1.592806, 0.4038448, -1.773639, 1, 1, 1, 1, 1,
-1.591318, 0.1856649, -0.8620453, 1, 1, 1, 1, 1,
-1.569593, -0.3115609, -2.925303, 1, 1, 1, 1, 1,
-1.554078, 0.465613, -0.4870512, 1, 1, 1, 1, 1,
-1.54157, -0.05696068, -1.511453, 1, 1, 1, 1, 1,
-1.539482, 0.9453128, -1.475559, 1, 1, 1, 1, 1,
-1.536049, -2.18271, -3.836549, 1, 1, 1, 1, 1,
-1.529927, 0.01387408, -0.2261942, 0, 0, 1, 1, 1,
-1.52898, 0.1873469, 0.7908964, 1, 0, 0, 1, 1,
-1.523227, -0.6404255, -1.382553, 1, 0, 0, 1, 1,
-1.521015, 0.540048, -0.2413754, 1, 0, 0, 1, 1,
-1.519022, 0.7758796, -2.966644, 1, 0, 0, 1, 1,
-1.5085, -1.817718, -2.906159, 1, 0, 0, 1, 1,
-1.503413, 1.677628, -0.5062491, 0, 0, 0, 1, 1,
-1.500475, -0.01135989, -2.089454, 0, 0, 0, 1, 1,
-1.483837, 0.5625162, -3.619213, 0, 0, 0, 1, 1,
-1.479333, 0.6469648, -0.8465013, 0, 0, 0, 1, 1,
-1.471228, 0.2009374, -2.901581, 0, 0, 0, 1, 1,
-1.462778, 1.349618, -2.603309, 0, 0, 0, 1, 1,
-1.44913, 0.3516726, -1.480536, 0, 0, 0, 1, 1,
-1.447628, 1.187322, 0.3676747, 1, 1, 1, 1, 1,
-1.432896, -0.01255565, -2.203366, 1, 1, 1, 1, 1,
-1.429172, 0.412589, -1.071859, 1, 1, 1, 1, 1,
-1.42609, 2.621425, -0.9792466, 1, 1, 1, 1, 1,
-1.414499, 0.1013154, -1.201352, 1, 1, 1, 1, 1,
-1.409344, 0.4831911, -2.116872, 1, 1, 1, 1, 1,
-1.407805, -0.5873905, -1.317779, 1, 1, 1, 1, 1,
-1.404093, -0.2661272, -1.783434, 1, 1, 1, 1, 1,
-1.374726, -0.6878136, -0.7166385, 1, 1, 1, 1, 1,
-1.356213, -0.8382682, -2.016341, 1, 1, 1, 1, 1,
-1.33439, 2.573931, 0.3069643, 1, 1, 1, 1, 1,
-1.325272, 0.2182979, -1.437932, 1, 1, 1, 1, 1,
-1.321582, -0.009037743, -2.029806, 1, 1, 1, 1, 1,
-1.314677, 1.716778, -1.684376, 1, 1, 1, 1, 1,
-1.313707, 2.048786, -1.257877, 1, 1, 1, 1, 1,
-1.308254, 0.1688258, -2.946717, 0, 0, 1, 1, 1,
-1.297946, 0.07442249, 0.03121885, 1, 0, 0, 1, 1,
-1.294071, -1.060094, -3.484956, 1, 0, 0, 1, 1,
-1.289913, 0.4634079, -2.16161, 1, 0, 0, 1, 1,
-1.284046, -0.7009652, -2.159416, 1, 0, 0, 1, 1,
-1.271535, 3.287997, -0.2661287, 1, 0, 0, 1, 1,
-1.263168, 0.1711505, -0.8188725, 0, 0, 0, 1, 1,
-1.25447, -0.828068, -2.528176, 0, 0, 0, 1, 1,
-1.237056, -0.9800205, -1.38075, 0, 0, 0, 1, 1,
-1.235878, 0.5547308, -1.565697, 0, 0, 0, 1, 1,
-1.234206, 0.5936261, -1.506328, 0, 0, 0, 1, 1,
-1.233195, 0.250012, -1.76437, 0, 0, 0, 1, 1,
-1.228612, 0.19344, -0.1970372, 0, 0, 0, 1, 1,
-1.224094, 0.8488971, -0.9252132, 1, 1, 1, 1, 1,
-1.220286, -0.2295797, -2.016208, 1, 1, 1, 1, 1,
-1.219958, 0.5180174, 0.1965366, 1, 1, 1, 1, 1,
-1.217332, 0.518896, 0.5269899, 1, 1, 1, 1, 1,
-1.212457, -0.4719855, -0.8143587, 1, 1, 1, 1, 1,
-1.206707, 0.2711684, -2.744879, 1, 1, 1, 1, 1,
-1.200765, -1.748598, -2.589044, 1, 1, 1, 1, 1,
-1.198727, 0.7955488, -2.861344, 1, 1, 1, 1, 1,
-1.192463, 0.7691981, -1.530965, 1, 1, 1, 1, 1,
-1.185624, -0.2742162, -2.607949, 1, 1, 1, 1, 1,
-1.184096, -0.4090327, -1.415439, 1, 1, 1, 1, 1,
-1.162639, -1.309103, -1.400741, 1, 1, 1, 1, 1,
-1.157767, -0.6459835, -1.955243, 1, 1, 1, 1, 1,
-1.157569, -0.4724036, -0.6980289, 1, 1, 1, 1, 1,
-1.155232, -0.4299622, -1.758831, 1, 1, 1, 1, 1,
-1.151878, -0.6962612, -1.822678, 0, 0, 1, 1, 1,
-1.15106, 0.7070912, -1.350519, 1, 0, 0, 1, 1,
-1.144512, 0.4468115, -1.733819, 1, 0, 0, 1, 1,
-1.144461, 0.3872093, -1.58086, 1, 0, 0, 1, 1,
-1.142707, -0.7979163, -2.075156, 1, 0, 0, 1, 1,
-1.138819, 0.2916612, -0.6770214, 1, 0, 0, 1, 1,
-1.13805, 1.546907, -0.4466833, 0, 0, 0, 1, 1,
-1.125353, -1.833589, -2.44789, 0, 0, 0, 1, 1,
-1.119079, -0.6964259, -3.320704, 0, 0, 0, 1, 1,
-1.117348, -1.899879, -4.352134, 0, 0, 0, 1, 1,
-1.11534, 0.3004551, -2.333185, 0, 0, 0, 1, 1,
-1.114848, -0.5392682, -0.9179066, 0, 0, 0, 1, 1,
-1.113696, 0.1606014, -2.611086, 0, 0, 0, 1, 1,
-1.104898, 0.7610863, -0.8470376, 1, 1, 1, 1, 1,
-1.10438, 0.1637711, -1.701658, 1, 1, 1, 1, 1,
-1.097404, 1.028214, -1.922141, 1, 1, 1, 1, 1,
-1.091453, -0.6040907, -2.306551, 1, 1, 1, 1, 1,
-1.090441, -0.1871985, -1.002226, 1, 1, 1, 1, 1,
-1.089791, -1.219093, -2.450718, 1, 1, 1, 1, 1,
-1.088341, 1.293434, -0.8051929, 1, 1, 1, 1, 1,
-1.085468, -1.638419, -2.23037, 1, 1, 1, 1, 1,
-1.082994, -0.8260758, -3.359996, 1, 1, 1, 1, 1,
-1.081423, -0.4585616, -2.75645, 1, 1, 1, 1, 1,
-1.078204, -1.564938, -4.603924, 1, 1, 1, 1, 1,
-1.060079, -1.226238, -2.231187, 1, 1, 1, 1, 1,
-1.053765, -0.6426837, -2.348148, 1, 1, 1, 1, 1,
-1.050796, -0.4449468, -2.048336, 1, 1, 1, 1, 1,
-1.050358, 1.183191, -1.128055, 1, 1, 1, 1, 1,
-1.047427, 0.6288603, -1.237599, 0, 0, 1, 1, 1,
-1.046543, -0.5758389, -2.708254, 1, 0, 0, 1, 1,
-1.043989, -0.6263082, -1.388255, 1, 0, 0, 1, 1,
-1.042928, -0.2305122, -1.633535, 1, 0, 0, 1, 1,
-1.039823, -0.03689371, -1.787839, 1, 0, 0, 1, 1,
-1.036375, 0.3602569, -1.485393, 1, 0, 0, 1, 1,
-1.034245, -0.2397126, -1.88728, 0, 0, 0, 1, 1,
-1.031204, 0.3692834, -1.07213, 0, 0, 0, 1, 1,
-1.029804, 0.1391779, -2.118145, 0, 0, 0, 1, 1,
-1.029042, -2.340093, -3.343837, 0, 0, 0, 1, 1,
-1.027664, 0.06391382, -2.625108, 0, 0, 0, 1, 1,
-1.026873, -0.7006018, -2.415384, 0, 0, 0, 1, 1,
-1.022774, 1.154526, -0.4804523, 0, 0, 0, 1, 1,
-1.015096, -0.4615922, -2.190479, 1, 1, 1, 1, 1,
-1.014473, 0.2282839, -2.000314, 1, 1, 1, 1, 1,
-1.011276, -1.647488, -3.104589, 1, 1, 1, 1, 1,
-1.006327, 0.1277648, -1.33248, 1, 1, 1, 1, 1,
-1.004857, 0.1275488, -0.7159016, 1, 1, 1, 1, 1,
-1.000612, -1.147471, -4.448189, 1, 1, 1, 1, 1,
-0.9990447, -0.8189225, -3.126179, 1, 1, 1, 1, 1,
-0.9725527, -0.298899, -3.709602, 1, 1, 1, 1, 1,
-0.9708414, 0.6950048, -0.5112042, 1, 1, 1, 1, 1,
-0.9693826, 0.01640986, 0.9379646, 1, 1, 1, 1, 1,
-0.9540926, -2.015798, -3.58677, 1, 1, 1, 1, 1,
-0.9499219, -0.9958715, -2.848593, 1, 1, 1, 1, 1,
-0.9430133, -0.5757014, -2.945305, 1, 1, 1, 1, 1,
-0.9392184, -0.444936, -1.720545, 1, 1, 1, 1, 1,
-0.933654, 0.3069344, -1.593376, 1, 1, 1, 1, 1,
-0.9316846, 0.5712039, -0.3486351, 0, 0, 1, 1, 1,
-0.9303629, 0.5536349, -2.9131, 1, 0, 0, 1, 1,
-0.9218919, -0.320095, -2.014269, 1, 0, 0, 1, 1,
-0.9186094, 1.068625, -0.1277546, 1, 0, 0, 1, 1,
-0.9183435, -0.3187102, -0.6384367, 1, 0, 0, 1, 1,
-0.9090514, 0.6846781, 1.326059, 1, 0, 0, 1, 1,
-0.887749, -0.2276624, -3.177862, 0, 0, 0, 1, 1,
-0.8813121, -0.9941719, -1.729784, 0, 0, 0, 1, 1,
-0.8775175, -0.04238556, -1.013796, 0, 0, 0, 1, 1,
-0.8725258, -2.561885, -3.893822, 0, 0, 0, 1, 1,
-0.8680045, -0.6550946, -3.230387, 0, 0, 0, 1, 1,
-0.8660452, 0.3228529, -0.4470552, 0, 0, 0, 1, 1,
-0.8594469, 1.242166, 0.4678793, 0, 0, 0, 1, 1,
-0.8588084, 1.722655, 0.2270811, 1, 1, 1, 1, 1,
-0.8486017, -0.6548817, -1.837793, 1, 1, 1, 1, 1,
-0.8446189, 0.1835576, -1.436719, 1, 1, 1, 1, 1,
-0.8427295, -0.9976364, -3.31634, 1, 1, 1, 1, 1,
-0.8384359, 1.032927, 0.5635029, 1, 1, 1, 1, 1,
-0.8370008, 0.614825, -0.7994804, 1, 1, 1, 1, 1,
-0.8352064, -1.251318, -1.792976, 1, 1, 1, 1, 1,
-0.8337729, -1.593442, -1.419028, 1, 1, 1, 1, 1,
-0.8308919, 0.1571352, -2.76757, 1, 1, 1, 1, 1,
-0.8308668, -0.2773629, -0.2941378, 1, 1, 1, 1, 1,
-0.8260922, 0.2811543, -1.393739, 1, 1, 1, 1, 1,
-0.8162333, -0.01106571, -0.2983939, 1, 1, 1, 1, 1,
-0.8099671, -0.3550797, -0.4891769, 1, 1, 1, 1, 1,
-0.809913, 1.61214, -0.186705, 1, 1, 1, 1, 1,
-0.8055056, 1.562975, 1.706109, 1, 1, 1, 1, 1,
-0.805262, 0.8248041, 0.1024077, 0, 0, 1, 1, 1,
-0.8021824, 0.4680772, -0.8633136, 1, 0, 0, 1, 1,
-0.8011435, -0.961899, -3.0317, 1, 0, 0, 1, 1,
-0.7891946, 0.6765309, -1.689406, 1, 0, 0, 1, 1,
-0.7876804, 1.524137, -0.7249767, 1, 0, 0, 1, 1,
-0.7720009, 0.5648749, -0.662664, 1, 0, 0, 1, 1,
-0.7710465, 0.4420686, -1.443934, 0, 0, 0, 1, 1,
-0.7700109, 0.02195747, 0.3487116, 0, 0, 0, 1, 1,
-0.7613073, -0.1717184, -2.662801, 0, 0, 0, 1, 1,
-0.7609356, 1.123932, -1.178508, 0, 0, 0, 1, 1,
-0.759173, -0.2660053, -0.7957744, 0, 0, 0, 1, 1,
-0.7483252, 1.565607, 0.3583454, 0, 0, 0, 1, 1,
-0.7478173, -0.5157088, -1.500338, 0, 0, 0, 1, 1,
-0.7450275, 1.160168, 0.7165236, 1, 1, 1, 1, 1,
-0.7433941, 0.5767157, -0.5733034, 1, 1, 1, 1, 1,
-0.7424632, 0.6234758, -3.468597, 1, 1, 1, 1, 1,
-0.734377, 0.1922617, -2.115111, 1, 1, 1, 1, 1,
-0.7332091, -0.1997374, -2.178555, 1, 1, 1, 1, 1,
-0.720724, 0.2042643, -2.12526, 1, 1, 1, 1, 1,
-0.7168607, 0.1324987, -0.9569415, 1, 1, 1, 1, 1,
-0.7165468, -0.9865922, -3.457268, 1, 1, 1, 1, 1,
-0.7104228, -0.6146742, -3.330889, 1, 1, 1, 1, 1,
-0.7096614, -0.599766, -1.68849, 1, 1, 1, 1, 1,
-0.708611, -0.9801889, -0.647965, 1, 1, 1, 1, 1,
-0.7067928, 0.03519279, -1.438247, 1, 1, 1, 1, 1,
-0.7033385, -0.03848464, -2.007362, 1, 1, 1, 1, 1,
-0.7030126, 0.3539688, -0.8527246, 1, 1, 1, 1, 1,
-0.6969334, 0.09958073, -1.548397, 1, 1, 1, 1, 1,
-0.6919713, -0.4441192, -2.299749, 0, 0, 1, 1, 1,
-0.6891767, -0.2441588, -1.08061, 1, 0, 0, 1, 1,
-0.6819443, -0.75495, -3.099895, 1, 0, 0, 1, 1,
-0.6773369, 0.6566659, -0.2456985, 1, 0, 0, 1, 1,
-0.6674275, -1.188861, -3.550011, 1, 0, 0, 1, 1,
-0.6628932, 1.53315, -0.4111231, 1, 0, 0, 1, 1,
-0.660723, 2.358376, 0.5246616, 0, 0, 0, 1, 1,
-0.6570642, -0.8659923, -1.298803, 0, 0, 0, 1, 1,
-0.6530559, -0.2411986, -2.309311, 0, 0, 0, 1, 1,
-0.6431059, -0.140432, -2.78044, 0, 0, 0, 1, 1,
-0.6392868, 0.6900034, -2.216093, 0, 0, 0, 1, 1,
-0.637632, -0.4169926, -1.719692, 0, 0, 0, 1, 1,
-0.6372783, -1.133504, -3.489874, 0, 0, 0, 1, 1,
-0.6301478, -0.006564795, -1.468888, 1, 1, 1, 1, 1,
-0.6249399, 0.2805218, -1.273395, 1, 1, 1, 1, 1,
-0.6175301, 0.7540429, -2.092209, 1, 1, 1, 1, 1,
-0.617162, -0.05644766, -2.047379, 1, 1, 1, 1, 1,
-0.6162025, -0.5141249, -2.298733, 1, 1, 1, 1, 1,
-0.613819, 0.9364489, -1.441746, 1, 1, 1, 1, 1,
-0.6106805, 0.3126586, -1.204592, 1, 1, 1, 1, 1,
-0.6068634, 1.491232, -0.2549036, 1, 1, 1, 1, 1,
-0.604599, 1.445783, -0.4316287, 1, 1, 1, 1, 1,
-0.604429, -0.4509944, -1.778871, 1, 1, 1, 1, 1,
-0.6034716, -1.240252, -3.014582, 1, 1, 1, 1, 1,
-0.6001939, -1.055394, -2.201059, 1, 1, 1, 1, 1,
-0.5994438, -0.5354604, -2.806968, 1, 1, 1, 1, 1,
-0.5943133, -1.319343, -3.647657, 1, 1, 1, 1, 1,
-0.5937397, -0.50432, -0.3356199, 1, 1, 1, 1, 1,
-0.5903115, 0.829335, -0.3441817, 0, 0, 1, 1, 1,
-0.5901865, -0.7866132, -0.3423015, 1, 0, 0, 1, 1,
-0.5879602, -0.4838356, -2.278823, 1, 0, 0, 1, 1,
-0.5793649, -0.5435447, -1.975266, 1, 0, 0, 1, 1,
-0.5789837, -1.040762, -3.303781, 1, 0, 0, 1, 1,
-0.5767449, -1.08737, -3.524577, 1, 0, 0, 1, 1,
-0.5754967, 0.4016585, -1.29582, 0, 0, 0, 1, 1,
-0.5735429, 0.7615321, -0.5808684, 0, 0, 0, 1, 1,
-0.5718297, 1.4038, 0.5605264, 0, 0, 0, 1, 1,
-0.5714644, 0.2670261, -1.417397, 0, 0, 0, 1, 1,
-0.5670899, -0.3508989, -1.031027, 0, 0, 0, 1, 1,
-0.564265, 1.477435, -0.3894528, 0, 0, 0, 1, 1,
-0.5618326, 0.05496056, -1.507175, 0, 0, 0, 1, 1,
-0.5599476, 0.6094999, 0.5703564, 1, 1, 1, 1, 1,
-0.5579867, -0.6509101, -1.611781, 1, 1, 1, 1, 1,
-0.5576069, -0.2377748, -1.682928, 1, 1, 1, 1, 1,
-0.5572121, 0.2481705, -1.255223, 1, 1, 1, 1, 1,
-0.5568032, -2.103178, -3.387197, 1, 1, 1, 1, 1,
-0.5550086, 0.640106, -0.7056509, 1, 1, 1, 1, 1,
-0.5536333, -1.507978, -1.414922, 1, 1, 1, 1, 1,
-0.5508237, 0.602417, -2.668763, 1, 1, 1, 1, 1,
-0.5485559, -0.8659413, -3.731116, 1, 1, 1, 1, 1,
-0.5473539, -0.4478885, -2.348256, 1, 1, 1, 1, 1,
-0.5432714, -0.5026284, -0.7634795, 1, 1, 1, 1, 1,
-0.5418342, 1.153352, 1.351097, 1, 1, 1, 1, 1,
-0.5408918, -0.7201387, -1.521273, 1, 1, 1, 1, 1,
-0.5392428, -0.4777335, -1.634188, 1, 1, 1, 1, 1,
-0.5355799, -0.1839597, -2.640161, 1, 1, 1, 1, 1,
-0.5326027, 0.3586116, 1.883188, 0, 0, 1, 1, 1,
-0.5295398, -1.517642, -3.252582, 1, 0, 0, 1, 1,
-0.5271716, -0.6390542, -2.134733, 1, 0, 0, 1, 1,
-0.5270586, -1.446318, -2.15975, 1, 0, 0, 1, 1,
-0.5235456, 1.429045, -0.6934623, 1, 0, 0, 1, 1,
-0.52126, -1.113331, -1.676219, 1, 0, 0, 1, 1,
-0.5167608, 1.386219, 1.366031, 0, 0, 0, 1, 1,
-0.5127426, -1.943072, -3.712386, 0, 0, 0, 1, 1,
-0.5039616, 0.8618147, 0.9181519, 0, 0, 0, 1, 1,
-0.5024353, 1.317451, 0.3254161, 0, 0, 0, 1, 1,
-0.501924, -0.6269976, -1.929455, 0, 0, 0, 1, 1,
-0.5017936, 0.6891085, -0.4264078, 0, 0, 0, 1, 1,
-0.4921115, 0.4699441, -1.466401, 0, 0, 0, 1, 1,
-0.4897685, -1.326408, -2.820727, 1, 1, 1, 1, 1,
-0.4887966, 0.9691123, -2.026732, 1, 1, 1, 1, 1,
-0.4841265, -0.5639585, -4.326978, 1, 1, 1, 1, 1,
-0.4833764, -0.8207338, -2.629166, 1, 1, 1, 1, 1,
-0.4748319, -0.5496117, -1.171235, 1, 1, 1, 1, 1,
-0.4740602, 0.8834621, 0.7708042, 1, 1, 1, 1, 1,
-0.4719313, -2.070983, -2.003415, 1, 1, 1, 1, 1,
-0.4669948, 0.6744226, -2.180192, 1, 1, 1, 1, 1,
-0.4616789, -0.2825984, -2.930327, 1, 1, 1, 1, 1,
-0.4616587, 0.6346405, -1.031875, 1, 1, 1, 1, 1,
-0.4594788, 0.9156272, 0.7706966, 1, 1, 1, 1, 1,
-0.4591203, -0.4166302, -3.148028, 1, 1, 1, 1, 1,
-0.4564527, 0.6507477, -0.6125565, 1, 1, 1, 1, 1,
-0.4555399, -1.03537, -2.034714, 1, 1, 1, 1, 1,
-0.4530384, -2.124202, -2.654628, 1, 1, 1, 1, 1,
-0.4421662, -1.943635, -1.549847, 0, 0, 1, 1, 1,
-0.4324344, 1.534099, -1.470255, 1, 0, 0, 1, 1,
-0.4321288, -0.3993352, -1.527687, 1, 0, 0, 1, 1,
-0.4277719, -0.7602075, -2.552494, 1, 0, 0, 1, 1,
-0.4277627, -0.2326437, -1.463337, 1, 0, 0, 1, 1,
-0.4243647, -0.4945153, -2.525411, 1, 0, 0, 1, 1,
-0.4214823, -0.2828161, -2.762367, 0, 0, 0, 1, 1,
-0.4213228, -3.13247, -1.848963, 0, 0, 0, 1, 1,
-0.4171528, 2.094561, 1.569446, 0, 0, 0, 1, 1,
-0.4089246, 0.7807526, -2.401245, 0, 0, 0, 1, 1,
-0.408051, -0.3820922, -2.433134, 0, 0, 0, 1, 1,
-0.4077792, -0.529634, -2.081583, 0, 0, 0, 1, 1,
-0.407391, -0.283007, -1.404319, 0, 0, 0, 1, 1,
-0.4027951, -2.257456, -1.553794, 1, 1, 1, 1, 1,
-0.4021948, 1.121144, -0.7509937, 1, 1, 1, 1, 1,
-0.4019434, -0.8312299, -3.589358, 1, 1, 1, 1, 1,
-0.4016793, 0.2097661, -2.356789, 1, 1, 1, 1, 1,
-0.3977256, 1.663557, -2.041493, 1, 1, 1, 1, 1,
-0.3932689, 1.127465, -1.158571, 1, 1, 1, 1, 1,
-0.3913907, 0.1771017, -1.008983, 1, 1, 1, 1, 1,
-0.3912298, 1.285145, -0.4208803, 1, 1, 1, 1, 1,
-0.3900235, 1.380474, -0.5386235, 1, 1, 1, 1, 1,
-0.3899316, 0.4559578, 0.1879834, 1, 1, 1, 1, 1,
-0.3874624, 0.8326079, 1.092145, 1, 1, 1, 1, 1,
-0.3839359, 0.7928178, -1.226197, 1, 1, 1, 1, 1,
-0.3775853, 1.486223, -0.1807315, 1, 1, 1, 1, 1,
-0.3744973, -0.8490532, -4.66989, 1, 1, 1, 1, 1,
-0.372256, 0.2390176, -0.6658739, 1, 1, 1, 1, 1,
-0.3692124, 0.8769531, 0.2064871, 0, 0, 1, 1, 1,
-0.3677826, -1.884799, -4.764028, 1, 0, 0, 1, 1,
-0.3665791, 0.4483615, 0.2829379, 1, 0, 0, 1, 1,
-0.3650821, -0.4407454, -2.176843, 1, 0, 0, 1, 1,
-0.3638476, 0.2585876, -0.2394169, 1, 0, 0, 1, 1,
-0.3623386, -0.5806817, -1.9174, 1, 0, 0, 1, 1,
-0.3562407, 0.4103721, -0.8912054, 0, 0, 0, 1, 1,
-0.3551333, -0.1652292, -2.282451, 0, 0, 0, 1, 1,
-0.3548017, 0.2472809, -1.921042, 0, 0, 0, 1, 1,
-0.3541664, 0.4474683, -0.2702698, 0, 0, 0, 1, 1,
-0.3471518, -1.224846, -2.714583, 0, 0, 0, 1, 1,
-0.3459465, 0.06764828, -1.121667, 0, 0, 0, 1, 1,
-0.3446878, -0.4322925, -3.362296, 0, 0, 0, 1, 1,
-0.3425681, -1.40322, -0.7482604, 1, 1, 1, 1, 1,
-0.3420773, 0.3458074, -1.065265, 1, 1, 1, 1, 1,
-0.3405944, -0.4622803, -1.224796, 1, 1, 1, 1, 1,
-0.3387513, -0.2422364, -0.7493377, 1, 1, 1, 1, 1,
-0.3373491, 2.065337, 1.643993, 1, 1, 1, 1, 1,
-0.3365608, -0.1075587, -1.474011, 1, 1, 1, 1, 1,
-0.334002, -0.6001543, -3.265622, 1, 1, 1, 1, 1,
-0.3323243, -1.705146, -4.276536, 1, 1, 1, 1, 1,
-0.3290232, -0.3879879, -1.292989, 1, 1, 1, 1, 1,
-0.326267, 1.1558, -4.025888, 1, 1, 1, 1, 1,
-0.3231598, -1.199835, -3.374154, 1, 1, 1, 1, 1,
-0.3194911, -0.5050674, -1.89693, 1, 1, 1, 1, 1,
-0.3184808, 0.2605591, -0.8202264, 1, 1, 1, 1, 1,
-0.3183695, -2.421412, -3.903658, 1, 1, 1, 1, 1,
-0.3162271, 1.761988, -0.3390595, 1, 1, 1, 1, 1,
-0.3140586, 1.679179, -0.2907696, 0, 0, 1, 1, 1,
-0.3125798, -0.2304715, -0.4325689, 1, 0, 0, 1, 1,
-0.3125614, -0.7259698, -2.19059, 1, 0, 0, 1, 1,
-0.3108503, 1.738122, 1.332696, 1, 0, 0, 1, 1,
-0.3073606, 0.2140024, -2.044086, 1, 0, 0, 1, 1,
-0.3068697, -0.08861709, -3.526325, 1, 0, 0, 1, 1,
-0.3065092, 1.393514, -0.0533029, 0, 0, 0, 1, 1,
-0.3058592, -0.5987582, -2.092891, 0, 0, 0, 1, 1,
-0.3037491, 0.7220621, 2.027438, 0, 0, 0, 1, 1,
-0.2991704, 1.297696, -0.6481317, 0, 0, 0, 1, 1,
-0.2956648, -0.7183521, -3.161911, 0, 0, 0, 1, 1,
-0.2953087, -0.0636645, -2.505479, 0, 0, 0, 1, 1,
-0.2950041, -0.03680457, -2.090195, 0, 0, 0, 1, 1,
-0.2902606, 1.1351, -0.9809625, 1, 1, 1, 1, 1,
-0.2838796, -1.228119, -1.176443, 1, 1, 1, 1, 1,
-0.2823502, -8.574822e-05, -1.143589, 1, 1, 1, 1, 1,
-0.2818304, -0.5267968, -2.754947, 1, 1, 1, 1, 1,
-0.2807758, -1.072035, -1.035649, 1, 1, 1, 1, 1,
-0.2774177, -0.3117115, 0.1021917, 1, 1, 1, 1, 1,
-0.2768784, 0.7433727, 1.364515, 1, 1, 1, 1, 1,
-0.2707672, -1.51571, -2.547361, 1, 1, 1, 1, 1,
-0.2682199, 0.4521966, -1.958245, 1, 1, 1, 1, 1,
-0.2662085, -0.4224345, -3.19958, 1, 1, 1, 1, 1,
-0.2659534, 0.7016914, -1.159501, 1, 1, 1, 1, 1,
-0.2654557, -1.824037, -4.007735, 1, 1, 1, 1, 1,
-0.2645863, 0.7594439, 0.9009587, 1, 1, 1, 1, 1,
-0.2621968, 0.400687, -0.2398009, 1, 1, 1, 1, 1,
-0.2603496, -0.01065, -3.083259, 1, 1, 1, 1, 1,
-0.2575083, -2.085719, -4.12165, 0, 0, 1, 1, 1,
-0.2487441, 2.359682, -0.5574919, 1, 0, 0, 1, 1,
-0.2372339, 0.6825402, -1.04847, 1, 0, 0, 1, 1,
-0.2342164, 0.7253939, 0.4903542, 1, 0, 0, 1, 1,
-0.2260157, -0.03869566, -1.659119, 1, 0, 0, 1, 1,
-0.2190515, 0.2404902, -0.2944447, 1, 0, 0, 1, 1,
-0.2188887, -0.4133484, -3.335812, 0, 0, 0, 1, 1,
-0.2171112, -1.463786, -0.35707, 0, 0, 0, 1, 1,
-0.216185, -1.127697, -3.120138, 0, 0, 0, 1, 1,
-0.213917, 2.579151, 0.6344829, 0, 0, 0, 1, 1,
-0.2033018, -1.127607, -3.898776, 0, 0, 0, 1, 1,
-0.2025906, -0.9739748, -2.386904, 0, 0, 0, 1, 1,
-0.2005465, 0.01981758, -0.2589306, 0, 0, 0, 1, 1,
-0.1991634, -0.879887, -4.186985, 1, 1, 1, 1, 1,
-0.1990295, 0.5146156, 0.2135433, 1, 1, 1, 1, 1,
-0.1981888, 0.3954543, -0.5681913, 1, 1, 1, 1, 1,
-0.196016, 1.830417, -1.347198, 1, 1, 1, 1, 1,
-0.1941586, 0.5576906, 0.1975186, 1, 1, 1, 1, 1,
-0.1929147, -1.142602, -4.120293, 1, 1, 1, 1, 1,
-0.1928702, -0.5957848, -3.044841, 1, 1, 1, 1, 1,
-0.1873903, -0.1065064, -3.230504, 1, 1, 1, 1, 1,
-0.18347, -0.7102537, -2.843083, 1, 1, 1, 1, 1,
-0.1831798, -0.07287537, -1.522924, 1, 1, 1, 1, 1,
-0.1824847, 0.4670963, -1.250011, 1, 1, 1, 1, 1,
-0.1820745, -1.384727, -3.183415, 1, 1, 1, 1, 1,
-0.1798718, -0.4432731, -1.348079, 1, 1, 1, 1, 1,
-0.1787, -0.1532981, -3.99631, 1, 1, 1, 1, 1,
-0.1769471, 0.07482956, -1.257598, 1, 1, 1, 1, 1,
-0.1766791, 1.590202, 1.324557, 0, 0, 1, 1, 1,
-0.1754257, 2.145348, -0.8893805, 1, 0, 0, 1, 1,
-0.1727345, -0.007246992, -1.918172, 1, 0, 0, 1, 1,
-0.1723624, 0.3961581, -0.4491077, 1, 0, 0, 1, 1,
-0.1696826, -1.187489, -3.053339, 1, 0, 0, 1, 1,
-0.1684669, 1.041168, -0.4160161, 1, 0, 0, 1, 1,
-0.1630199, 0.4061849, 0.2008262, 0, 0, 0, 1, 1,
-0.1608665, -0.5069575, -2.072535, 0, 0, 0, 1, 1,
-0.1596796, 0.7690226, 0.3437135, 0, 0, 0, 1, 1,
-0.1591466, 0.9796107, 0.121419, 0, 0, 0, 1, 1,
-0.1584222, 2.142959, -0.2992413, 0, 0, 0, 1, 1,
-0.1568957, 2.230251, 0.18367, 0, 0, 0, 1, 1,
-0.155307, -1.890558, -1.568155, 0, 0, 0, 1, 1,
-0.1521079, 2.359779, -1.04006, 1, 1, 1, 1, 1,
-0.1516575, -0.5726892, -3.765611, 1, 1, 1, 1, 1,
-0.1515781, 0.1164493, -1.458352, 1, 1, 1, 1, 1,
-0.1511197, -1.595742, -3.777149, 1, 1, 1, 1, 1,
-0.1386799, 0.007757366, -1.293595, 1, 1, 1, 1, 1,
-0.1344478, 1.040765, 0.1684431, 1, 1, 1, 1, 1,
-0.1342866, -0.4977096, -2.365454, 1, 1, 1, 1, 1,
-0.1342584, -0.7551022, -3.182369, 1, 1, 1, 1, 1,
-0.121921, 0.7741772, 0.06018052, 1, 1, 1, 1, 1,
-0.1184836, 0.1484411, -0.6168625, 1, 1, 1, 1, 1,
-0.1183231, 1.256308, 0.7817122, 1, 1, 1, 1, 1,
-0.1174224, -0.2664309, -4.553443, 1, 1, 1, 1, 1,
-0.1152638, 0.8576564, 1.202357, 1, 1, 1, 1, 1,
-0.1148059, -0.533603, -2.023262, 1, 1, 1, 1, 1,
-0.1135271, -0.387076, -3.120995, 1, 1, 1, 1, 1,
-0.113152, -1.569986, -4.176579, 0, 0, 1, 1, 1,
-0.1119103, 1.219362, -1.473142, 1, 0, 0, 1, 1,
-0.1114099, -1.074308, -3.087888, 1, 0, 0, 1, 1,
-0.1096647, -1.451269, -3.562917, 1, 0, 0, 1, 1,
-0.1087811, 0.511952, 0.9314724, 1, 0, 0, 1, 1,
-0.1072823, 1.93872, -0.1102415, 1, 0, 0, 1, 1,
-0.1062703, -0.6573859, -2.008314, 0, 0, 0, 1, 1,
-0.1051233, -1.24072, -3.632123, 0, 0, 0, 1, 1,
-0.1049199, -0.7828546, -2.65335, 0, 0, 0, 1, 1,
-0.1047837, -2.014663, -3.870081, 0, 0, 0, 1, 1,
-0.0919976, 0.8920867, -1.299647, 0, 0, 0, 1, 1,
-0.09005729, -0.03287011, -2.718406, 0, 0, 0, 1, 1,
-0.08834168, -0.2812345, -3.266581, 0, 0, 0, 1, 1,
-0.08604366, -0.6931617, -2.593874, 1, 1, 1, 1, 1,
-0.08528854, -0.9067273, -2.512724, 1, 1, 1, 1, 1,
-0.07494013, 1.105979, 0.9466387, 1, 1, 1, 1, 1,
-0.06685303, 0.4719324, 0.01440865, 1, 1, 1, 1, 1,
-0.06353518, -0.9610945, -2.155511, 1, 1, 1, 1, 1,
-0.06250188, -0.563484, -2.566841, 1, 1, 1, 1, 1,
-0.05568795, -0.7569875, -2.980652, 1, 1, 1, 1, 1,
-0.05502656, -0.6830151, -2.514294, 1, 1, 1, 1, 1,
-0.05218922, 0.5309579, 0.8983572, 1, 1, 1, 1, 1,
-0.04466733, 0.4054539, -1.203556, 1, 1, 1, 1, 1,
-0.04434305, -0.5298378, -2.904846, 1, 1, 1, 1, 1,
-0.04422178, 0.9947674, -0.7054956, 1, 1, 1, 1, 1,
-0.0440818, -1.496599, -3.943645, 1, 1, 1, 1, 1,
-0.04192808, -1.20061, -4.973641, 1, 1, 1, 1, 1,
-0.04159301, -1.943818, -2.120821, 1, 1, 1, 1, 1,
-0.04030382, -0.5205672, -1.37457, 0, 0, 1, 1, 1,
-0.0365301, -0.8479427, -1.546615, 1, 0, 0, 1, 1,
-0.03488, -1.507519, -5.221754, 1, 0, 0, 1, 1,
-0.03065138, -0.5574474, -4.600063, 1, 0, 0, 1, 1,
-0.02880586, 0.6075547, 0.4488841, 1, 0, 0, 1, 1,
-0.02742059, -0.9457495, -4.114417, 1, 0, 0, 1, 1,
-0.02586298, 0.3135177, 0.6584193, 0, 0, 0, 1, 1,
-0.02498518, -1.270792, -1.321514, 0, 0, 0, 1, 1,
-0.02164204, 0.111932, 0.4810362, 0, 0, 0, 1, 1,
-0.02041026, 1.496896, 1.701627, 0, 0, 0, 1, 1,
-0.01380417, 0.5162147, 0.5057477, 0, 0, 0, 1, 1,
-0.008468002, 0.2928775, 0.9678022, 0, 0, 0, 1, 1,
-0.006687387, 0.5597397, -1.17485, 0, 0, 0, 1, 1,
-0.006492003, -1.484893, -2.273216, 1, 1, 1, 1, 1,
-0.005189276, 0.7786639, -0.6154559, 1, 1, 1, 1, 1,
-0.002776832, 1.857693, 1.622828, 1, 1, 1, 1, 1,
0.002900637, -0.6954016, 3.252128, 1, 1, 1, 1, 1,
0.003767931, 1.412834, -0.6752832, 1, 1, 1, 1, 1,
0.003846791, -1.151792, 3.184071, 1, 1, 1, 1, 1,
0.004219319, 0.5504858, 0.06782326, 1, 1, 1, 1, 1,
0.0064449, -0.806458, 4.321312, 1, 1, 1, 1, 1,
0.009155776, 0.7863935, -0.9984165, 1, 1, 1, 1, 1,
0.01113667, 0.205609, 0.3103972, 1, 1, 1, 1, 1,
0.01342048, -0.4702085, 4.282077, 1, 1, 1, 1, 1,
0.01455983, 1.126919, -1.143799, 1, 1, 1, 1, 1,
0.01580892, -0.3830693, 2.07849, 1, 1, 1, 1, 1,
0.01662118, 0.4673474, 0.5057675, 1, 1, 1, 1, 1,
0.02444951, -0.8512601, 3.518892, 1, 1, 1, 1, 1,
0.02743109, -1.887143, 2.136971, 0, 0, 1, 1, 1,
0.02849003, -1.488232, 4.354062, 1, 0, 0, 1, 1,
0.02958812, 0.8433244, 0.435599, 1, 0, 0, 1, 1,
0.04273443, 1.123823, -1.127257, 1, 0, 0, 1, 1,
0.04315435, -0.07140323, 2.167386, 1, 0, 0, 1, 1,
0.04828873, -0.1948045, 2.199368, 1, 0, 0, 1, 1,
0.05002436, -0.6969566, 4.488929, 0, 0, 0, 1, 1,
0.05476149, 0.8292131, -0.7355291, 0, 0, 0, 1, 1,
0.05619081, -0.638014, 1.266291, 0, 0, 0, 1, 1,
0.05710195, 0.01812336, 2.083915, 0, 0, 0, 1, 1,
0.0589378, 0.03648377, -0.01961504, 0, 0, 0, 1, 1,
0.06032619, -2.286839, 2.768378, 0, 0, 0, 1, 1,
0.06691718, 0.8476238, 0.3765078, 0, 0, 0, 1, 1,
0.06772877, 0.08666576, 0.2067783, 1, 1, 1, 1, 1,
0.0700619, -0.09875863, 3.975586, 1, 1, 1, 1, 1,
0.07053214, -0.02403487, 0.709637, 1, 1, 1, 1, 1,
0.0732857, -0.9046975, 2.431572, 1, 1, 1, 1, 1,
0.07446805, -0.4831934, 3.53413, 1, 1, 1, 1, 1,
0.0769807, -0.5155164, 4.112495, 1, 1, 1, 1, 1,
0.07800621, 0.4086067, 0.3724644, 1, 1, 1, 1, 1,
0.07839365, 0.3191012, 0.8379475, 1, 1, 1, 1, 1,
0.08315082, -1.580184, 3.124655, 1, 1, 1, 1, 1,
0.08556418, -1.371861, 3.498333, 1, 1, 1, 1, 1,
0.08568152, -0.3841209, 2.198667, 1, 1, 1, 1, 1,
0.08602983, -0.1924217, 2.166891, 1, 1, 1, 1, 1,
0.08990809, 1.778406, 2.354008, 1, 1, 1, 1, 1,
0.09086764, 1.13931, -1.020592, 1, 1, 1, 1, 1,
0.09196897, -0.07376248, 2.771787, 1, 1, 1, 1, 1,
0.09337368, 0.7685677, 1.410104, 0, 0, 1, 1, 1,
0.09596528, 0.5575053, -0.2185742, 1, 0, 0, 1, 1,
0.09740993, -1.504914, 3.079859, 1, 0, 0, 1, 1,
0.1044913, 0.9989374, -0.7303025, 1, 0, 0, 1, 1,
0.1082114, -0.7077279, 3.414802, 1, 0, 0, 1, 1,
0.1124033, 0.6479137, 1.878982, 1, 0, 0, 1, 1,
0.1203167, -0.5938413, 2.963789, 0, 0, 0, 1, 1,
0.121296, -0.802197, 3.196635, 0, 0, 0, 1, 1,
0.125138, -2.681828, 4.746791, 0, 0, 0, 1, 1,
0.1263904, -0.3004256, 3.532748, 0, 0, 0, 1, 1,
0.1276373, -0.4587554, 3.460912, 0, 0, 0, 1, 1,
0.1298159, 0.6010087, 0.1105451, 0, 0, 0, 1, 1,
0.1299252, 0.08644313, 1.515504, 0, 0, 0, 1, 1,
0.1393854, -0.6005939, 3.729858, 1, 1, 1, 1, 1,
0.1407015, 1.991939, 0.2338208, 1, 1, 1, 1, 1,
0.1425292, -1.285961, 2.868869, 1, 1, 1, 1, 1,
0.1475794, 0.4025575, -1.027866, 1, 1, 1, 1, 1,
0.1503428, 0.4935788, 0.7386927, 1, 1, 1, 1, 1,
0.1520212, -0.06092706, 1.079819, 1, 1, 1, 1, 1,
0.1530688, 0.1433309, 0.40181, 1, 1, 1, 1, 1,
0.1538827, -1.18013, 5.310935, 1, 1, 1, 1, 1,
0.1575029, -0.8544844, 2.66284, 1, 1, 1, 1, 1,
0.1600775, 0.1281259, 1.828042, 1, 1, 1, 1, 1,
0.1608504, -1.535698, 2.514714, 1, 1, 1, 1, 1,
0.1609295, 0.9245548, 0.8298602, 1, 1, 1, 1, 1,
0.1613667, -1.638017, 3.072886, 1, 1, 1, 1, 1,
0.1617019, 2.332209, -0.639459, 1, 1, 1, 1, 1,
0.164628, 0.3627685, -1.037124, 1, 1, 1, 1, 1,
0.1657841, -1.689572, 3.173494, 0, 0, 1, 1, 1,
0.1672853, 0.3271761, 1.132436, 1, 0, 0, 1, 1,
0.1686378, -0.4984311, 1.876361, 1, 0, 0, 1, 1,
0.1731898, 0.0719756, 1.536654, 1, 0, 0, 1, 1,
0.1738218, -0.2782798, 4.135818, 1, 0, 0, 1, 1,
0.1760336, -0.797258, 2.790724, 1, 0, 0, 1, 1,
0.1764887, -0.008311605, 1.454595, 0, 0, 0, 1, 1,
0.1782574, 1.719829, 1.003082, 0, 0, 0, 1, 1,
0.180085, -1.522322, 2.874084, 0, 0, 0, 1, 1,
0.1808998, -0.3504008, 2.945236, 0, 0, 0, 1, 1,
0.1815105, -1.68475, 2.409896, 0, 0, 0, 1, 1,
0.1834441, 1.318693, 0.07358029, 0, 0, 0, 1, 1,
0.1849838, 0.7561873, -1.31826, 0, 0, 0, 1, 1,
0.1851063, 1.465108, -0.8656476, 1, 1, 1, 1, 1,
0.187849, 0.2852522, -0.3684994, 1, 1, 1, 1, 1,
0.1881772, -0.3895931, 2.667536, 1, 1, 1, 1, 1,
0.1890614, -1.147312, 3.675961, 1, 1, 1, 1, 1,
0.1918329, 0.05354765, 1.66578, 1, 1, 1, 1, 1,
0.192431, -0.6486266, 0.8726357, 1, 1, 1, 1, 1,
0.1928384, 0.7482564, -0.5124366, 1, 1, 1, 1, 1,
0.1929238, -0.0945089, 1.821255, 1, 1, 1, 1, 1,
0.1931828, 0.3536493, 0.7161316, 1, 1, 1, 1, 1,
0.1945514, 0.7543461, -0.9879069, 1, 1, 1, 1, 1,
0.1945807, -0.6340269, 4.26496, 1, 1, 1, 1, 1,
0.195247, 0.3092795, 0.2551066, 1, 1, 1, 1, 1,
0.1987837, 0.8498569, -0.681627, 1, 1, 1, 1, 1,
0.200034, 0.8389786, 0.3529876, 1, 1, 1, 1, 1,
0.2008542, 0.3229887, -0.5107309, 1, 1, 1, 1, 1,
0.2054817, -1.696918, 2.995169, 0, 0, 1, 1, 1,
0.2078413, 0.6050811, 0.3528263, 1, 0, 0, 1, 1,
0.2123649, -2.793935, 0.9970741, 1, 0, 0, 1, 1,
0.2149487, -1.022288, 4.196198, 1, 0, 0, 1, 1,
0.2165055, -0.5462215, 1.421933, 1, 0, 0, 1, 1,
0.2172044, -1.102806, 2.943368, 1, 0, 0, 1, 1,
0.2191534, -2.062217, 2.881541, 0, 0, 0, 1, 1,
0.2191796, 0.370877, -0.8577977, 0, 0, 0, 1, 1,
0.221319, 0.0689021, 1.820616, 0, 0, 0, 1, 1,
0.2217537, 0.3340454, 2.843574, 0, 0, 0, 1, 1,
0.223621, -1.515676, 2.428974, 0, 0, 0, 1, 1,
0.2319148, -1.789276, 3.49333, 0, 0, 0, 1, 1,
0.2319455, -0.4257607, 1.964492, 0, 0, 0, 1, 1,
0.236319, 0.1044133, 2.147137, 1, 1, 1, 1, 1,
0.2390134, 0.9450873, 0.9812722, 1, 1, 1, 1, 1,
0.2392059, 0.8488657, -0.5927418, 1, 1, 1, 1, 1,
0.24845, -0.3659845, 0.7202354, 1, 1, 1, 1, 1,
0.2495033, -0.06201374, 2.20354, 1, 1, 1, 1, 1,
0.2499096, -0.2412902, 1.449874, 1, 1, 1, 1, 1,
0.2504059, 0.9106059, 0.5454569, 1, 1, 1, 1, 1,
0.2527564, 0.4389773, -1.560432, 1, 1, 1, 1, 1,
0.2564494, -0.6662141, 1.961551, 1, 1, 1, 1, 1,
0.2570906, 0.2864994, 1.000461, 1, 1, 1, 1, 1,
0.2689132, -1.513693, 2.430896, 1, 1, 1, 1, 1,
0.2691019, -1.084835, 4.473643, 1, 1, 1, 1, 1,
0.2692152, 0.2725156, 2.070599, 1, 1, 1, 1, 1,
0.2722522, -1.009507, 3.915486, 1, 1, 1, 1, 1,
0.2724252, 2.034212, -1.19262, 1, 1, 1, 1, 1,
0.2745573, 0.5258981, 0.3767312, 0, 0, 1, 1, 1,
0.2763946, -0.2273736, 0.4304003, 1, 0, 0, 1, 1,
0.2799429, 0.2791359, 2.464283, 1, 0, 0, 1, 1,
0.2833887, 0.4397034, 1.384974, 1, 0, 0, 1, 1,
0.2840427, -0.1978981, 2.058497, 1, 0, 0, 1, 1,
0.2840673, 0.8777798, -0.9150954, 1, 0, 0, 1, 1,
0.2850252, -1.46364, 3.74734, 0, 0, 0, 1, 1,
0.2851989, -0.7519724, 2.508662, 0, 0, 0, 1, 1,
0.2871583, -1.834046, 3.286366, 0, 0, 0, 1, 1,
0.287505, -1.327774, 3.205287, 0, 0, 0, 1, 1,
0.2895929, -0.8403642, 4.735279, 0, 0, 0, 1, 1,
0.2900049, 0.648477, 0.9446892, 0, 0, 0, 1, 1,
0.2907638, 0.08347761, 0.01746439, 0, 0, 0, 1, 1,
0.2937044, -0.5120894, 4.477095, 1, 1, 1, 1, 1,
0.2941024, 0.2086976, 1.074286, 1, 1, 1, 1, 1,
0.2948263, 1.268465, 0.8613462, 1, 1, 1, 1, 1,
0.3035092, -0.1732768, 2.134773, 1, 1, 1, 1, 1,
0.3072599, -0.5945997, 3.92279, 1, 1, 1, 1, 1,
0.3075376, -0.4550452, 3.682966, 1, 1, 1, 1, 1,
0.3077127, -0.1024219, 0.9046201, 1, 1, 1, 1, 1,
0.3115081, -0.9676924, 2.288168, 1, 1, 1, 1, 1,
0.3136491, -1.701499, 4.860888, 1, 1, 1, 1, 1,
0.3194749, -1.570776, 3.149346, 1, 1, 1, 1, 1,
0.3207343, -2.637993, 3.218213, 1, 1, 1, 1, 1,
0.3357409, 2.15755, 0.1603294, 1, 1, 1, 1, 1,
0.3405693, 2.922576, -0.4282129, 1, 1, 1, 1, 1,
0.3409051, -0.7154298, 1.460117, 1, 1, 1, 1, 1,
0.3416008, -0.01861645, 1.581902, 1, 1, 1, 1, 1,
0.3433936, -1.336945, 2.963657, 0, 0, 1, 1, 1,
0.3457652, 0.09142797, 0.7223314, 1, 0, 0, 1, 1,
0.348818, -0.2535435, 2.429409, 1, 0, 0, 1, 1,
0.3488622, -1.086741, 2.525431, 1, 0, 0, 1, 1,
0.3509415, 0.3051181, 1.853474, 1, 0, 0, 1, 1,
0.3534466, -1.925986, 3.366263, 1, 0, 0, 1, 1,
0.3572054, -1.90218, 2.965003, 0, 0, 0, 1, 1,
0.3576338, 0.07891015, -0.7047029, 0, 0, 0, 1, 1,
0.3584241, -0.5048295, 2.443519, 0, 0, 0, 1, 1,
0.3650348, 0.3105581, -0.3972752, 0, 0, 0, 1, 1,
0.3657249, 1.352272, 0.7821963, 0, 0, 0, 1, 1,
0.3660996, -1.751127, 1.543555, 0, 0, 0, 1, 1,
0.3666244, 1.449118, -0.3865369, 0, 0, 0, 1, 1,
0.3732088, 0.9282248, 0.3239076, 1, 1, 1, 1, 1,
0.3768197, -0.1806267, 1.901583, 1, 1, 1, 1, 1,
0.3774796, -0.9602146, 2.046238, 1, 1, 1, 1, 1,
0.3845841, -0.9714243, 3.030564, 1, 1, 1, 1, 1,
0.3850572, -0.9575801, 1.763431, 1, 1, 1, 1, 1,
0.3866731, 0.1464969, 1.035975, 1, 1, 1, 1, 1,
0.396475, -0.5209326, 2.965692, 1, 1, 1, 1, 1,
0.3966959, 0.4896371, 0.2881297, 1, 1, 1, 1, 1,
0.3975779, 0.08479971, 2.459955, 1, 1, 1, 1, 1,
0.3978218, -0.5423298, 2.785768, 1, 1, 1, 1, 1,
0.4006587, 1.826376, 0.6830701, 1, 1, 1, 1, 1,
0.4023449, 1.443311, -0.2685862, 1, 1, 1, 1, 1,
0.4074965, 2.017634, -0.3347676, 1, 1, 1, 1, 1,
0.4140541, -0.325053, 2.078468, 1, 1, 1, 1, 1,
0.4141753, -0.2749719, 1.321514, 1, 1, 1, 1, 1,
0.4175845, 0.09599098, 0.4474349, 0, 0, 1, 1, 1,
0.4234549, -0.4014083, 2.812449, 1, 0, 0, 1, 1,
0.4275006, 0.8010987, 0.09006362, 1, 0, 0, 1, 1,
0.432734, 0.9153521, 0.1445519, 1, 0, 0, 1, 1,
0.434785, -0.3737801, 0.7969378, 1, 0, 0, 1, 1,
0.4349875, 0.4678236, 2.414567, 1, 0, 0, 1, 1,
0.4367591, -2.228425, 2.440118, 0, 0, 0, 1, 1,
0.4418685, -1.519992, 2.442908, 0, 0, 0, 1, 1,
0.4451687, -0.6770914, 2.835117, 0, 0, 0, 1, 1,
0.4482467, -0.8908831, 3.935204, 0, 0, 0, 1, 1,
0.4526919, 1.010829, -0.7967092, 0, 0, 0, 1, 1,
0.453543, 0.2835578, -0.8548204, 0, 0, 0, 1, 1,
0.4536097, 0.8883103, 1.504944, 0, 0, 0, 1, 1,
0.4572769, 0.3189335, 1.001384, 1, 1, 1, 1, 1,
0.4598691, -1.243123, 4.223746, 1, 1, 1, 1, 1,
0.4609247, 1.946342, -1.407717, 1, 1, 1, 1, 1,
0.4626761, -0.9540021, 3.292504, 1, 1, 1, 1, 1,
0.4636048, 0.08856302, 0.9863404, 1, 1, 1, 1, 1,
0.4640049, -0.5628346, 2.565275, 1, 1, 1, 1, 1,
0.4713676, 0.8120943, 2.001955, 1, 1, 1, 1, 1,
0.4722441, 1.627644, -0.03636205, 1, 1, 1, 1, 1,
0.4779084, 0.385772, 0.7390468, 1, 1, 1, 1, 1,
0.4792158, 0.5913056, -0.4371868, 1, 1, 1, 1, 1,
0.4794631, 1.365965, 0.5812947, 1, 1, 1, 1, 1,
0.4799542, 1.624961, -0.4902492, 1, 1, 1, 1, 1,
0.482178, -0.480321, 1.277792, 1, 1, 1, 1, 1,
0.4861653, -0.04563043, 1.783427, 1, 1, 1, 1, 1,
0.4862385, 1.318663, -0.4980994, 1, 1, 1, 1, 1,
0.4946726, -0.4202412, 2.04693, 0, 0, 1, 1, 1,
0.4957267, -0.4394608, 2.900759, 1, 0, 0, 1, 1,
0.4994186, -1.080629, 1.965392, 1, 0, 0, 1, 1,
0.5037705, -0.3650965, 3.59907, 1, 0, 0, 1, 1,
0.5101589, 1.149576, -0.4312733, 1, 0, 0, 1, 1,
0.5159937, -2.092764, 3.460036, 1, 0, 0, 1, 1,
0.517388, 0.3828026, 0.3678061, 0, 0, 0, 1, 1,
0.5196946, 2.209623, -1.944008, 0, 0, 0, 1, 1,
0.5224111, -0.3044739, 1.094078, 0, 0, 0, 1, 1,
0.5264781, -0.8509625, 1.926041, 0, 0, 0, 1, 1,
0.5302535, -0.1103864, 1.76292, 0, 0, 0, 1, 1,
0.5315645, 0.5889858, 0.426468, 0, 0, 0, 1, 1,
0.5324606, 1.152943, 1.069411, 0, 0, 0, 1, 1,
0.5354701, 0.5418906, 1.680872, 1, 1, 1, 1, 1,
0.5409362, -0.9442383, 3.947599, 1, 1, 1, 1, 1,
0.5412918, -0.2675247, 1.196049, 1, 1, 1, 1, 1,
0.5456716, 0.08574945, 0.6582433, 1, 1, 1, 1, 1,
0.5569225, -0.6530134, 3.374271, 1, 1, 1, 1, 1,
0.5652394, 0.9434741, 1.592687, 1, 1, 1, 1, 1,
0.5677977, 0.6369253, 0.9499752, 1, 1, 1, 1, 1,
0.5724761, -0.666133, 4.182829, 1, 1, 1, 1, 1,
0.5763162, 2.657604, -0.03803451, 1, 1, 1, 1, 1,
0.5768203, 0.4668469, 1.564082, 1, 1, 1, 1, 1,
0.587653, 0.9636537, 0.2023605, 1, 1, 1, 1, 1,
0.5877001, 1.429334, 1.531143, 1, 1, 1, 1, 1,
0.5899562, -1.654816, 2.506996, 1, 1, 1, 1, 1,
0.5933018, -0.9968508, 4.361583, 1, 1, 1, 1, 1,
0.5957702, 1.085385, -0.913066, 1, 1, 1, 1, 1,
0.5977052, -0.2484722, 2.418742, 0, 0, 1, 1, 1,
0.6001652, 0.2632491, 0.9588068, 1, 0, 0, 1, 1,
0.6027199, 0.6244513, 0.4561809, 1, 0, 0, 1, 1,
0.6056449, 0.4879474, 1.283121, 1, 0, 0, 1, 1,
0.6059933, -0.3199148, 2.181067, 1, 0, 0, 1, 1,
0.6220299, 1.074078, 1.244698, 1, 0, 0, 1, 1,
0.6285331, -0.6873327, 2.798217, 0, 0, 0, 1, 1,
0.6322357, 1.730789, -0.9033225, 0, 0, 0, 1, 1,
0.6378867, -0.627308, 2.464813, 0, 0, 0, 1, 1,
0.6414285, 0.501563, 1.378634, 0, 0, 0, 1, 1,
0.6431745, -0.8193547, 3.223099, 0, 0, 0, 1, 1,
0.6480739, -0.9232073, 2.695886, 0, 0, 0, 1, 1,
0.6497659, -0.5205982, 1.117492, 0, 0, 0, 1, 1,
0.651937, 2.576521, 0.077549, 1, 1, 1, 1, 1,
0.6527818, -0.8395488, 1.957234, 1, 1, 1, 1, 1,
0.6532378, 0.8104971, 0.2959309, 1, 1, 1, 1, 1,
0.656215, 0.7907094, 1.650526, 1, 1, 1, 1, 1,
0.6565019, 0.1347295, 0.7638364, 1, 1, 1, 1, 1,
0.6682721, 0.2891713, 1.194528, 1, 1, 1, 1, 1,
0.6697476, 0.5527071, 0.373046, 1, 1, 1, 1, 1,
0.6793839, -0.09908763, 2.471708, 1, 1, 1, 1, 1,
0.6831138, 0.3043124, 0.08630733, 1, 1, 1, 1, 1,
0.6964325, 1.040132, 1.111652, 1, 1, 1, 1, 1,
0.6972014, 1.788074, 0.3748419, 1, 1, 1, 1, 1,
0.6989618, 0.9680637, -0.3013668, 1, 1, 1, 1, 1,
0.7017482, -0.06752061, 1.51148, 1, 1, 1, 1, 1,
0.7056313, 0.2475521, 2.807354, 1, 1, 1, 1, 1,
0.7076806, 0.658485, 1.430788, 1, 1, 1, 1, 1,
0.7101176, 0.8315706, -0.9653693, 0, 0, 1, 1, 1,
0.7123358, 1.12276, 0.0400719, 1, 0, 0, 1, 1,
0.713506, -1.137548, 2.481022, 1, 0, 0, 1, 1,
0.7207986, -0.055585, 3.294395, 1, 0, 0, 1, 1,
0.7232019, -0.6340373, 1.838355, 1, 0, 0, 1, 1,
0.726262, 0.2478452, 1.643551, 1, 0, 0, 1, 1,
0.7326302, -1.959846, 3.597681, 0, 0, 0, 1, 1,
0.7333895, -0.9994661, 2.596682, 0, 0, 0, 1, 1,
0.7368562, -2.43109, 3.119805, 0, 0, 0, 1, 1,
0.7456068, -0.6985943, 1.994695, 0, 0, 0, 1, 1,
0.7464306, 0.7152471, 1.964821, 0, 0, 0, 1, 1,
0.7535931, 0.08116078, 1.112946, 0, 0, 0, 1, 1,
0.7543894, 0.111853, 2.607457, 0, 0, 0, 1, 1,
0.7569481, 1.852409, -0.1970501, 1, 1, 1, 1, 1,
0.7575352, 0.5321703, 0.4110275, 1, 1, 1, 1, 1,
0.7614428, 1.165417, 1.751497, 1, 1, 1, 1, 1,
0.7637729, -1.074442, 2.717277, 1, 1, 1, 1, 1,
0.7679503, 0.124615, 1.761028, 1, 1, 1, 1, 1,
0.7767866, 1.072089, 0.2149339, 1, 1, 1, 1, 1,
0.7782796, 1.919277, 0.2669358, 1, 1, 1, 1, 1,
0.7807288, -0.3759178, 2.079599, 1, 1, 1, 1, 1,
0.782867, -1.288917, 4.635629, 1, 1, 1, 1, 1,
0.786594, 1.055284, 0.2040868, 1, 1, 1, 1, 1,
0.7902799, 0.3304181, 1.163241, 1, 1, 1, 1, 1,
0.7977385, -1.160709, 2.344594, 1, 1, 1, 1, 1,
0.8020851, 0.07229632, 2.544559, 1, 1, 1, 1, 1,
0.8034211, 0.239036, 2.927958, 1, 1, 1, 1, 1,
0.8039037, -1.071974, 1.022101, 1, 1, 1, 1, 1,
0.8090768, 0.0249391, 1.876197, 0, 0, 1, 1, 1,
0.8091052, 0.6585494, 1.098604, 1, 0, 0, 1, 1,
0.8111391, -0.8580642, 2.866115, 1, 0, 0, 1, 1,
0.8113147, 1.02809, 0.6077487, 1, 0, 0, 1, 1,
0.8124897, 1.107433, 1.245495, 1, 0, 0, 1, 1,
0.8177193, -0.9387798, 2.228507, 1, 0, 0, 1, 1,
0.818381, -0.03284533, 1.148944, 0, 0, 0, 1, 1,
0.8215978, 1.355515, 1.273164, 0, 0, 0, 1, 1,
0.8287768, -1.735727, 2.776589, 0, 0, 0, 1, 1,
0.8312789, 0.0361231, 1.053895, 0, 0, 0, 1, 1,
0.8340035, 0.3106252, -0.5486355, 0, 0, 0, 1, 1,
0.8341684, -0.2129983, 0.3995227, 0, 0, 0, 1, 1,
0.8371164, -1.10742, 2.36293, 0, 0, 0, 1, 1,
0.8399383, 2.604551, 1.805863, 1, 1, 1, 1, 1,
0.8412631, 1.140486, 0.4863019, 1, 1, 1, 1, 1,
0.8414708, -0.04067278, 1.680666, 1, 1, 1, 1, 1,
0.8450414, 0.3394491, 2.349588, 1, 1, 1, 1, 1,
0.8496016, 0.2010755, 0.332914, 1, 1, 1, 1, 1,
0.8515851, -0.5500959, 0.8256536, 1, 1, 1, 1, 1,
0.8516302, -1.86476, 2.055442, 1, 1, 1, 1, 1,
0.8542665, -0.465079, 3.175238, 1, 1, 1, 1, 1,
0.8569039, -1.317031, 1.238657, 1, 1, 1, 1, 1,
0.8651611, -1.014243, 2.813834, 1, 1, 1, 1, 1,
0.8686135, 1.287846, 3.263173, 1, 1, 1, 1, 1,
0.8717315, 0.4124592, 1.463681, 1, 1, 1, 1, 1,
0.8717342, -1.356039, 1.729138, 1, 1, 1, 1, 1,
0.8725753, 0.8483351, 0.6358076, 1, 1, 1, 1, 1,
0.8815794, -1.910531, 2.649391, 1, 1, 1, 1, 1,
0.8827903, 0.4349371, 3.237494, 0, 0, 1, 1, 1,
0.8867909, -0.4909111, 4.287853, 1, 0, 0, 1, 1,
0.8891008, 0.6466845, 1.355789, 1, 0, 0, 1, 1,
0.8963981, -0.4079471, 0.9753607, 1, 0, 0, 1, 1,
0.8983729, 0.3540512, 2.446761, 1, 0, 0, 1, 1,
0.9054036, 0.2424117, 0.8111361, 1, 0, 0, 1, 1,
0.9116942, -0.787119, 1.231222, 0, 0, 0, 1, 1,
0.9126832, 0.9885662, -0.480673, 0, 0, 0, 1, 1,
0.9157631, -1.177526, 2.363006, 0, 0, 0, 1, 1,
0.9164171, 0.6220424, 1.965498, 0, 0, 0, 1, 1,
0.9205564, 0.2519943, 0.3935836, 0, 0, 0, 1, 1,
0.9206918, -0.1119237, 2.998333, 0, 0, 0, 1, 1,
0.9217587, -0.5447608, 0.7152183, 0, 0, 0, 1, 1,
0.9219555, -0.4235022, 2.524607, 1, 1, 1, 1, 1,
0.9239598, -0.1608619, 2.430174, 1, 1, 1, 1, 1,
0.924939, -0.6162954, 2.317034, 1, 1, 1, 1, 1,
0.9250476, -1.375672, 2.691513, 1, 1, 1, 1, 1,
0.9320551, 0.5601104, 1.742456, 1, 1, 1, 1, 1,
0.9514278, 0.7931612, 1.486089, 1, 1, 1, 1, 1,
0.955593, -0.7443877, 1.746248, 1, 1, 1, 1, 1,
0.9587356, -1.144495, 2.497833, 1, 1, 1, 1, 1,
0.9602941, 0.02843906, 1.447391, 1, 1, 1, 1, 1,
0.967301, -1.055097, 1.110123, 1, 1, 1, 1, 1,
0.9679398, -0.1550085, 1.030447, 1, 1, 1, 1, 1,
0.9770904, 0.6355679, 1.557746, 1, 1, 1, 1, 1,
0.9773684, -0.1246947, 0.829308, 1, 1, 1, 1, 1,
0.9844884, -0.7927116, 1.916284, 1, 1, 1, 1, 1,
0.9862889, -0.3607364, 1.982271, 1, 1, 1, 1, 1,
0.9864985, 0.2432706, 1.569761, 0, 0, 1, 1, 1,
0.989323, -0.08249035, 2.170729, 1, 0, 0, 1, 1,
0.9914001, -1.353331, 2.688799, 1, 0, 0, 1, 1,
0.9942231, 0.7274207, 1.208412, 1, 0, 0, 1, 1,
0.9998853, 0.3323539, 2.862417, 1, 0, 0, 1, 1,
1.001996, -0.5799072, 1.428884, 1, 0, 0, 1, 1,
1.003419, 0.2854874, 0.9606755, 0, 0, 0, 1, 1,
1.003484, -1.761037, 2.15296, 0, 0, 0, 1, 1,
1.004191, -0.836403, 2.023592, 0, 0, 0, 1, 1,
1.004915, 0.6152349, 1.380128, 0, 0, 0, 1, 1,
1.008463, -0.6613837, 1.380908, 0, 0, 0, 1, 1,
1.018639, -0.05609731, 1.470378, 0, 0, 0, 1, 1,
1.024361, -0.02740676, 2.141159, 0, 0, 0, 1, 1,
1.041049, 0.6310188, 0.349215, 1, 1, 1, 1, 1,
1.042306, -1.003541, 2.258596, 1, 1, 1, 1, 1,
1.046463, 0.6303926, -0.3092626, 1, 1, 1, 1, 1,
1.050287, 1.350639, 0.5649994, 1, 1, 1, 1, 1,
1.052573, 2.219194, -0.7860408, 1, 1, 1, 1, 1,
1.053973, 0.6979175, 1.005406, 1, 1, 1, 1, 1,
1.055349, -1.209603, 1.693144, 1, 1, 1, 1, 1,
1.056123, 0.05259606, 0.1603327, 1, 1, 1, 1, 1,
1.0563, 1.255143, -0.3187115, 1, 1, 1, 1, 1,
1.056429, 1.983643, 0.05890502, 1, 1, 1, 1, 1,
1.058605, 1.575389, 0.00584943, 1, 1, 1, 1, 1,
1.062976, 1.096641, 1.927374, 1, 1, 1, 1, 1,
1.068134, 0.2665717, 0.6561866, 1, 1, 1, 1, 1,
1.072833, 1.095405, -0.2027423, 1, 1, 1, 1, 1,
1.080789, -1.09044, 2.927586, 1, 1, 1, 1, 1,
1.082748, 0.5992242, 0.7441086, 0, 0, 1, 1, 1,
1.084649, 0.3091817, 0.6492301, 1, 0, 0, 1, 1,
1.085193, -0.4382722, 1.8028, 1, 0, 0, 1, 1,
1.097456, -0.7470743, 3.383313, 1, 0, 0, 1, 1,
1.098024, -0.2071998, 0.4327078, 1, 0, 0, 1, 1,
1.098147, -2.659505, 2.897955, 1, 0, 0, 1, 1,
1.100025, 1.252645, 1.234114, 0, 0, 0, 1, 1,
1.101968, 0.4305427, 1.648453, 0, 0, 0, 1, 1,
1.115951, 1.152648, -0.1263352, 0, 0, 0, 1, 1,
1.116441, 0.02774403, 1.573881, 0, 0, 0, 1, 1,
1.119581, -0.3350014, 3.177201, 0, 0, 0, 1, 1,
1.122178, 0.7736325, -0.1300461, 0, 0, 0, 1, 1,
1.132455, -0.7063958, 0.700775, 0, 0, 0, 1, 1,
1.133211, -1.592728, 2.981469, 1, 1, 1, 1, 1,
1.135046, 1.555157, 0.6013981, 1, 1, 1, 1, 1,
1.136209, -0.4892678, 0.7799957, 1, 1, 1, 1, 1,
1.139735, -1.344528, -0.1082642, 1, 1, 1, 1, 1,
1.145842, 0.05940764, 0.5602724, 1, 1, 1, 1, 1,
1.147307, -0.7774977, 0.5691481, 1, 1, 1, 1, 1,
1.152254, -1.405796, 2.095112, 1, 1, 1, 1, 1,
1.156591, 0.30194, 2.648724, 1, 1, 1, 1, 1,
1.164592, 0.1215813, 1.335576, 1, 1, 1, 1, 1,
1.169881, 0.481184, 0.9109594, 1, 1, 1, 1, 1,
1.170777, 0.6306176, 0.5301784, 1, 1, 1, 1, 1,
1.171984, -1.03302, 3.321712, 1, 1, 1, 1, 1,
1.175875, 1.457073, -0.3173341, 1, 1, 1, 1, 1,
1.176097, -1.422584, 2.567116, 1, 1, 1, 1, 1,
1.177874, 0.5533751, 0.6253274, 1, 1, 1, 1, 1,
1.18252, -0.6763104, 1.469079, 0, 0, 1, 1, 1,
1.185194, -1.203133, 1.211314, 1, 0, 0, 1, 1,
1.18577, -0.1899478, 1.638359, 1, 0, 0, 1, 1,
1.186878, 0.6004691, -0.5594204, 1, 0, 0, 1, 1,
1.188782, 0.8190998, -0.5340181, 1, 0, 0, 1, 1,
1.194235, 0.1701422, 0.7369065, 1, 0, 0, 1, 1,
1.200008, 1.342878, -0.5782406, 0, 0, 0, 1, 1,
1.201433, 2.501596, -1.296237, 0, 0, 0, 1, 1,
1.205293, 1.374474, -0.5985457, 0, 0, 0, 1, 1,
1.220646, -0.6135811, 1.260223, 0, 0, 0, 1, 1,
1.221662, 0.561684, 2.20606, 0, 0, 0, 1, 1,
1.22451, -0.6797001, 1.303893, 0, 0, 0, 1, 1,
1.233973, -0.6562027, 2.553855, 0, 0, 0, 1, 1,
1.23665, 1.101759, 3.068458, 1, 1, 1, 1, 1,
1.236686, 1.697055, 0.6945728, 1, 1, 1, 1, 1,
1.243796, -0.846606, 3.566404, 1, 1, 1, 1, 1,
1.251469, 0.5428696, -0.6746323, 1, 1, 1, 1, 1,
1.254978, 0.03964766, 2.008048, 1, 1, 1, 1, 1,
1.283018, 0.1709292, 0.01680378, 1, 1, 1, 1, 1,
1.293357, -1.252204, 1.325249, 1, 1, 1, 1, 1,
1.294481, -0.8272349, 1.953981, 1, 1, 1, 1, 1,
1.295098, 0.2579977, 2.936105, 1, 1, 1, 1, 1,
1.295636, -0.5486618, 1.765485, 1, 1, 1, 1, 1,
1.303076, 1.204212, 0.458747, 1, 1, 1, 1, 1,
1.316017, 0.2998564, 2.103972, 1, 1, 1, 1, 1,
1.320955, -0.280429, 3.351341, 1, 1, 1, 1, 1,
1.333629, 0.8950191, 0.7880307, 1, 1, 1, 1, 1,
1.339163, 0.7803288, -0.2160835, 1, 1, 1, 1, 1,
1.369254, -1.361049, 2.647753, 0, 0, 1, 1, 1,
1.369709, -0.4438524, 1.647551, 1, 0, 0, 1, 1,
1.374281, 0.8800808, 2.983729, 1, 0, 0, 1, 1,
1.384655, 0.2397075, 1.926313, 1, 0, 0, 1, 1,
1.385479, -1.604095, 1.701619, 1, 0, 0, 1, 1,
1.387598, 1.462265, 1.854928, 1, 0, 0, 1, 1,
1.405407, 0.1953714, 3.256634, 0, 0, 0, 1, 1,
1.417455, 1.174416, 1.246327, 0, 0, 0, 1, 1,
1.437428, 0.4226898, 1.670667, 0, 0, 0, 1, 1,
1.440976, -0.6524721, 1.634962, 0, 0, 0, 1, 1,
1.444569, 1.581279, 1.674172, 0, 0, 0, 1, 1,
1.45875, 1.111906, 1.31475, 0, 0, 0, 1, 1,
1.466162, 0.6391498, 0.877757, 0, 0, 0, 1, 1,
1.467909, -0.1599405, 2.230645, 1, 1, 1, 1, 1,
1.47592, -1.108574, 2.577276, 1, 1, 1, 1, 1,
1.483095, 0.5839643, -0.8061275, 1, 1, 1, 1, 1,
1.491195, 0.3688904, -1.50667, 1, 1, 1, 1, 1,
1.493459, 0.2331605, 2.453197, 1, 1, 1, 1, 1,
1.509918, -0.3906877, 0.9720394, 1, 1, 1, 1, 1,
1.51821, 0.2987276, 0.848921, 1, 1, 1, 1, 1,
1.540877, -0.1554993, -0.939935, 1, 1, 1, 1, 1,
1.543819, -1.151438, 1.191689, 1, 1, 1, 1, 1,
1.550925, -0.5283456, 1.711699, 1, 1, 1, 1, 1,
1.573559, 0.3104694, 1.314405, 1, 1, 1, 1, 1,
1.575722, -0.7798347, 1.26878, 1, 1, 1, 1, 1,
1.585806, 0.1205447, -0.4174362, 1, 1, 1, 1, 1,
1.591636, 1.266597, -0.1343785, 1, 1, 1, 1, 1,
1.597366, 0.2611187, 1.87387, 1, 1, 1, 1, 1,
1.60793, 0.1822103, 2.342863, 0, 0, 1, 1, 1,
1.628752, 1.140338, 1.847244, 1, 0, 0, 1, 1,
1.636488, -1.279442, 0.8996689, 1, 0, 0, 1, 1,
1.643475, 0.377738, 0.5244833, 1, 0, 0, 1, 1,
1.650142, -0.3519696, 2.225461, 1, 0, 0, 1, 1,
1.656616, -0.5841832, 1.251465, 1, 0, 0, 1, 1,
1.682391, 0.1438397, 1.718434, 0, 0, 0, 1, 1,
1.691294, 1.766546, -0.583474, 0, 0, 0, 1, 1,
1.691698, -0.02687645, 1.933085, 0, 0, 0, 1, 1,
1.695652, -1.372726, 0.955778, 0, 0, 0, 1, 1,
1.72194, -1.166578, 3.050285, 0, 0, 0, 1, 1,
1.72514, -0.8671674, 2.101105, 0, 0, 0, 1, 1,
1.727991, 0.1714638, 0.5552186, 0, 0, 0, 1, 1,
1.731634, 2.242018, 1.584778, 1, 1, 1, 1, 1,
1.737125, -0.08433338, 1.25279, 1, 1, 1, 1, 1,
1.756544, 1.223614, 2.293368, 1, 1, 1, 1, 1,
1.75682, 0.3910555, 0.7776109, 1, 1, 1, 1, 1,
1.770963, 0.4740683, 1.401429, 1, 1, 1, 1, 1,
1.777515, -0.8885684, 1.961873, 1, 1, 1, 1, 1,
1.795766, -0.2378757, -0.0917271, 1, 1, 1, 1, 1,
1.812895, -0.8666157, 3.137919, 1, 1, 1, 1, 1,
1.820523, -0.494723, 1.899605, 1, 1, 1, 1, 1,
1.824217, -1.34854, 2.337362, 1, 1, 1, 1, 1,
1.835839, 0.4601447, 2.07083, 1, 1, 1, 1, 1,
1.83958, -1.778574, 1.713392, 1, 1, 1, 1, 1,
1.845752, 1.600839, 0.302662, 1, 1, 1, 1, 1,
1.913431, -0.1126925, 1.837259, 1, 1, 1, 1, 1,
1.925229, 0.02650345, 1.870307, 1, 1, 1, 1, 1,
1.942532, 0.1097743, 1.38494, 0, 0, 1, 1, 1,
1.987622, -0.852933, 2.961234, 1, 0, 0, 1, 1,
2.069221, -0.6907103, 4.058901, 1, 0, 0, 1, 1,
2.112273, 1.447947, 1.418664, 1, 0, 0, 1, 1,
2.166773, 0.6103483, 0.9514944, 1, 0, 0, 1, 1,
2.250148, 0.2834553, -0.215549, 1, 0, 0, 1, 1,
2.258828, 0.7160574, 1.916657, 0, 0, 0, 1, 1,
2.26548, 0.8194792, -0.5334736, 0, 0, 0, 1, 1,
2.282135, 1.472949, 1.019971, 0, 0, 0, 1, 1,
2.285338, -2.356822, 3.892079, 0, 0, 0, 1, 1,
2.312566, -2.216096, 3.174539, 0, 0, 0, 1, 1,
2.405555, 0.7859588, 0.4919579, 0, 0, 0, 1, 1,
2.437049, 1.619001, 3.331027, 0, 0, 0, 1, 1,
2.594856, -0.8428679, 0.8008541, 1, 1, 1, 1, 1,
2.617522, -0.1591806, 1.951743, 1, 1, 1, 1, 1,
2.647958, -0.271659, 2.433194, 1, 1, 1, 1, 1,
2.765693, -1.694436, 2.480233, 1, 1, 1, 1, 1,
2.897961, 0.1604946, 0.6174348, 1, 1, 1, 1, 1,
2.909644, 0.7462298, 0.8134725, 1, 1, 1, 1, 1,
2.941519, -0.5288431, 2.31212, 1, 1, 1, 1, 1
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
var radius = 9.350415;
var distance = 32.84294;
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
mvMatrix.translate( -0.03469372, -0.07776308, -0.04459047 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.84294);
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
