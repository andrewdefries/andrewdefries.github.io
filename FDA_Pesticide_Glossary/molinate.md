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
-3.113436, -0.1707073, -1.674371, 1, 0, 0, 1,
-3.076384, -0.6547776, -0.1304, 1, 0.007843138, 0, 1,
-2.961014, 1.173451, -2.242302, 1, 0.01176471, 0, 1,
-2.911869, 0.9129646, -1.029906, 1, 0.01960784, 0, 1,
-2.803361, 0.1125051, -1.207797, 1, 0.02352941, 0, 1,
-2.663908, 0.4149458, -0.7335231, 1, 0.03137255, 0, 1,
-2.484893, 1.249672, -0.8681371, 1, 0.03529412, 0, 1,
-2.461159, -0.7480747, -2.203122, 1, 0.04313726, 0, 1,
-2.293572, 0.5482066, -2.285169, 1, 0.04705882, 0, 1,
-2.284694, 0.1357681, -0.7452791, 1, 0.05490196, 0, 1,
-2.264597, -0.8240693, -0.527911, 1, 0.05882353, 0, 1,
-2.225273, 0.3631654, -1.041277, 1, 0.06666667, 0, 1,
-2.200697, -0.8583275, -3.357867, 1, 0.07058824, 0, 1,
-2.170796, 0.1598188, -1.615879, 1, 0.07843138, 0, 1,
-2.16502, 0.6369044, -0.4754157, 1, 0.08235294, 0, 1,
-2.157991, 0.9024901, -0.6754407, 1, 0.09019608, 0, 1,
-2.150708, -0.7803903, -2.142909, 1, 0.09411765, 0, 1,
-2.124964, -0.02885006, -0.5698107, 1, 0.1019608, 0, 1,
-2.101874, -1.32913, -1.001246, 1, 0.1098039, 0, 1,
-2.060455, -0.1228247, -2.630478, 1, 0.1137255, 0, 1,
-2.057699, 0.772924, -0.9351102, 1, 0.1215686, 0, 1,
-2.045084, -0.3802206, -0.415606, 1, 0.1254902, 0, 1,
-2.03736, -0.417743, -2.737093, 1, 0.1333333, 0, 1,
-2.022738, -0.04162753, -1.670481, 1, 0.1372549, 0, 1,
-1.990625, -1.28855, -3.358352, 1, 0.145098, 0, 1,
-1.982414, 1.388453, 0.1528111, 1, 0.1490196, 0, 1,
-1.963354, 0.5176138, -1.442138, 1, 0.1568628, 0, 1,
-1.957557, -1.160816, -3.293414, 1, 0.1607843, 0, 1,
-1.953647, -1.555991, -3.606072, 1, 0.1686275, 0, 1,
-1.901151, -0.03247441, -0.5235852, 1, 0.172549, 0, 1,
-1.895985, 1.303498, 0.5726366, 1, 0.1803922, 0, 1,
-1.890491, 0.2426819, -1.171581, 1, 0.1843137, 0, 1,
-1.887064, -0.980799, -1.524123, 1, 0.1921569, 0, 1,
-1.871161, -0.0853331, -0.7648839, 1, 0.1960784, 0, 1,
-1.85126, -0.9066195, -3.152644, 1, 0.2039216, 0, 1,
-1.850354, -0.2563299, -2.827303, 1, 0.2117647, 0, 1,
-1.825331, 0.8447173, -0.1269148, 1, 0.2156863, 0, 1,
-1.798928, -1.691601, -2.917343, 1, 0.2235294, 0, 1,
-1.791602, -0.4332328, -1.993893, 1, 0.227451, 0, 1,
-1.790652, 0.5271419, -0.1728768, 1, 0.2352941, 0, 1,
-1.785865, 0.01425534, -1.626524, 1, 0.2392157, 0, 1,
-1.777767, 0.4356865, -0.07481853, 1, 0.2470588, 0, 1,
-1.720273, -0.01590425, -3.320203, 1, 0.2509804, 0, 1,
-1.720001, 1.659312, -1.548531, 1, 0.2588235, 0, 1,
-1.700163, -0.2958811, -2.398623, 1, 0.2627451, 0, 1,
-1.676047, 0.03340419, -1.558953, 1, 0.2705882, 0, 1,
-1.654862, 0.2334145, -1.051346, 1, 0.2745098, 0, 1,
-1.652092, -0.245778, 0.05678572, 1, 0.282353, 0, 1,
-1.648219, 0.3181378, -2.956885, 1, 0.2862745, 0, 1,
-1.641972, 0.07312249, -0.06435706, 1, 0.2941177, 0, 1,
-1.635531, 1.996462, -1.248214, 1, 0.3019608, 0, 1,
-1.634095, 1.392277, 0.8331546, 1, 0.3058824, 0, 1,
-1.621813, -0.3815694, -1.6612, 1, 0.3137255, 0, 1,
-1.59054, -0.656486, -0.8083454, 1, 0.3176471, 0, 1,
-1.575667, -0.25334, -2.761362, 1, 0.3254902, 0, 1,
-1.574874, 2.443679, 0.5680631, 1, 0.3294118, 0, 1,
-1.562123, -0.1275586, -0.8749071, 1, 0.3372549, 0, 1,
-1.561805, -0.09131939, -3.490745, 1, 0.3411765, 0, 1,
-1.538647, 0.5347191, -2.008009, 1, 0.3490196, 0, 1,
-1.529014, 1.26095, -2.269835, 1, 0.3529412, 0, 1,
-1.49857, -0.3587865, -0.6279278, 1, 0.3607843, 0, 1,
-1.491056, -0.6869513, -2.347525, 1, 0.3647059, 0, 1,
-1.486748, 0.1731205, -0.9837503, 1, 0.372549, 0, 1,
-1.472077, 1.856889, 0.225233, 1, 0.3764706, 0, 1,
-1.46985, 0.3184838, -2.339641, 1, 0.3843137, 0, 1,
-1.468489, -0.6061448, -0.8249103, 1, 0.3882353, 0, 1,
-1.45996, -1.922776, -1.360757, 1, 0.3960784, 0, 1,
-1.456432, -0.5870858, -2.078814, 1, 0.4039216, 0, 1,
-1.456398, -0.2831038, -1.974027, 1, 0.4078431, 0, 1,
-1.448855, 0.8892874, -1.174459, 1, 0.4156863, 0, 1,
-1.443329, -4.224748, -3.122653, 1, 0.4196078, 0, 1,
-1.437896, 0.669548, 0.222629, 1, 0.427451, 0, 1,
-1.436919, -0.686541, -3.063298, 1, 0.4313726, 0, 1,
-1.427553, 1.525759, 0.1459833, 1, 0.4392157, 0, 1,
-1.416376, -0.3463627, -1.839545, 1, 0.4431373, 0, 1,
-1.406247, 0.1248487, -1.706882, 1, 0.4509804, 0, 1,
-1.402918, -0.5736172, -2.888532, 1, 0.454902, 0, 1,
-1.400434, 0.1490526, -1.251493, 1, 0.4627451, 0, 1,
-1.400111, -0.5617118, -0.832378, 1, 0.4666667, 0, 1,
-1.399755, 3.450389, -0.2600344, 1, 0.4745098, 0, 1,
-1.369638, 0.02332671, -0.6387233, 1, 0.4784314, 0, 1,
-1.366887, -1.095894, -1.458862, 1, 0.4862745, 0, 1,
-1.350269, -1.175047, -1.063445, 1, 0.4901961, 0, 1,
-1.344058, 1.399457, 0.6139004, 1, 0.4980392, 0, 1,
-1.305017, -0.7736277, -2.411081, 1, 0.5058824, 0, 1,
-1.304667, 1.20567, -1.220083, 1, 0.509804, 0, 1,
-1.303369, -0.1367625, -2.052275, 1, 0.5176471, 0, 1,
-1.301437, -0.1992448, -0.3300417, 1, 0.5215687, 0, 1,
-1.301064, -0.5508499, -0.7073631, 1, 0.5294118, 0, 1,
-1.293038, -1.035467, -1.091436, 1, 0.5333334, 0, 1,
-1.29004, 1.775909, 0.6676364, 1, 0.5411765, 0, 1,
-1.288808, -0.6580864, -2.924498, 1, 0.5450981, 0, 1,
-1.285512, -0.007404954, -2.269738, 1, 0.5529412, 0, 1,
-1.278913, -0.4224277, -2.8141, 1, 0.5568628, 0, 1,
-1.277371, -0.3428173, -3.08341, 1, 0.5647059, 0, 1,
-1.274171, 2.946283, 0.5568034, 1, 0.5686275, 0, 1,
-1.273339, -1.306777, -2.573835, 1, 0.5764706, 0, 1,
-1.269947, 0.1965186, -1.085784, 1, 0.5803922, 0, 1,
-1.264473, -1.691549, -2.627069, 1, 0.5882353, 0, 1,
-1.260182, -0.6095525, -1.864835, 1, 0.5921569, 0, 1,
-1.252928, -2.319102, -4.612885, 1, 0.6, 0, 1,
-1.249957, -1.620846, -3.780148, 1, 0.6078432, 0, 1,
-1.239325, -0.002355954, -1.244197, 1, 0.6117647, 0, 1,
-1.22867, -0.09047383, -1.063791, 1, 0.6196079, 0, 1,
-1.220871, 0.701427, -0.4389903, 1, 0.6235294, 0, 1,
-1.218671, -0.505011, -2.512144, 1, 0.6313726, 0, 1,
-1.217061, -0.09132396, -3.812088, 1, 0.6352941, 0, 1,
-1.212698, -0.8655554, -2.400746, 1, 0.6431373, 0, 1,
-1.212438, -0.2286612, -0.8082981, 1, 0.6470588, 0, 1,
-1.207487, -1.357101, -2.526176, 1, 0.654902, 0, 1,
-1.206118, -0.4346035, -2.030228, 1, 0.6588235, 0, 1,
-1.204099, -3.930869, -3.180554, 1, 0.6666667, 0, 1,
-1.198723, -0.09812898, -0.5301606, 1, 0.6705883, 0, 1,
-1.1941, 0.6541719, 1.017335, 1, 0.6784314, 0, 1,
-1.193695, 0.8043063, -1.658466, 1, 0.682353, 0, 1,
-1.191403, -1.582346, -2.928959, 1, 0.6901961, 0, 1,
-1.189412, -1.570653, -2.371009, 1, 0.6941177, 0, 1,
-1.188887, -0.5598522, -1.629639, 1, 0.7019608, 0, 1,
-1.1757, 0.1450524, -0.3462554, 1, 0.7098039, 0, 1,
-1.166677, -0.4276566, -0.7735797, 1, 0.7137255, 0, 1,
-1.163994, 2.088694, -0.8017888, 1, 0.7215686, 0, 1,
-1.158303, -0.9807626, -3.699097, 1, 0.7254902, 0, 1,
-1.156401, 0.6503744, 0.03404187, 1, 0.7333333, 0, 1,
-1.146037, 0.1285987, -1.487845, 1, 0.7372549, 0, 1,
-1.143106, -0.651768, -1.607173, 1, 0.7450981, 0, 1,
-1.142688, -2.708598, -4.022279, 1, 0.7490196, 0, 1,
-1.130313, -0.4835761, -1.878481, 1, 0.7568628, 0, 1,
-1.128133, -2.490356, -3.335829, 1, 0.7607843, 0, 1,
-1.124257, -0.4051739, -3.55421, 1, 0.7686275, 0, 1,
-1.123404, 1.740936, 0.8577788, 1, 0.772549, 0, 1,
-1.121576, -0.07753658, -0.9651946, 1, 0.7803922, 0, 1,
-1.1195, 0.369152, -2.332376, 1, 0.7843137, 0, 1,
-1.118235, 0.4621606, -1.586112, 1, 0.7921569, 0, 1,
-1.116862, -1.53817, -3.35423, 1, 0.7960784, 0, 1,
-1.116849, 0.9445514, -0.4688606, 1, 0.8039216, 0, 1,
-1.114512, 1.348854, -0.3945948, 1, 0.8117647, 0, 1,
-1.112784, 0.9432963, -0.6560852, 1, 0.8156863, 0, 1,
-1.111872, -0.03681283, -1.592684, 1, 0.8235294, 0, 1,
-1.104951, -0.05385979, -2.15667, 1, 0.827451, 0, 1,
-1.102837, 0.04721398, 0.5027789, 1, 0.8352941, 0, 1,
-1.099162, 0.5658822, 1.446089, 1, 0.8392157, 0, 1,
-1.097878, 1.063267, 0.1597358, 1, 0.8470588, 0, 1,
-1.09607, -0.7776142, -2.608967, 1, 0.8509804, 0, 1,
-1.094396, 0.4744233, -1.484088, 1, 0.8588235, 0, 1,
-1.087816, -1.169417, -0.3490126, 1, 0.8627451, 0, 1,
-1.079984, -0.9659436, -1.402511, 1, 0.8705882, 0, 1,
-1.079262, -1.045532, -2.931209, 1, 0.8745098, 0, 1,
-1.072247, 1.807221, -1.536564, 1, 0.8823529, 0, 1,
-1.071236, -0.5437118, -0.8713142, 1, 0.8862745, 0, 1,
-1.069876, -0.385019, -1.487699, 1, 0.8941177, 0, 1,
-1.069486, 0.9382828, -0.8748141, 1, 0.8980392, 0, 1,
-1.059996, 1.339542, -1.154466, 1, 0.9058824, 0, 1,
-1.053641, 2.842795, 0.06091108, 1, 0.9137255, 0, 1,
-1.049669, -1.164961, -4.341165, 1, 0.9176471, 0, 1,
-1.048952, -1.393049, -3.791852, 1, 0.9254902, 0, 1,
-1.045419, -0.429783, -2.051764, 1, 0.9294118, 0, 1,
-1.038393, -0.1741912, -2.711368, 1, 0.9372549, 0, 1,
-1.038165, 1.606269, -1.45591, 1, 0.9411765, 0, 1,
-1.036449, 0.9117107, -0.877947, 1, 0.9490196, 0, 1,
-1.035669, -0.1674912, -0.5564719, 1, 0.9529412, 0, 1,
-1.032176, 0.6520268, -2.49647, 1, 0.9607843, 0, 1,
-1.030941, -1.136786, -2.792987, 1, 0.9647059, 0, 1,
-1.027138, -0.2244063, -2.216573, 1, 0.972549, 0, 1,
-1.025956, 0.6478975, -1.072686, 1, 0.9764706, 0, 1,
-1.025801, 0.212576, 0.3474456, 1, 0.9843137, 0, 1,
-1.018324, -1.245479, 0.3153505, 1, 0.9882353, 0, 1,
-1.0116, 1.53406, -0.8114154, 1, 0.9960784, 0, 1,
-1.002711, 1.702648, -0.8476586, 0.9960784, 1, 0, 1,
-0.9937176, -1.559429, -2.634168, 0.9921569, 1, 0, 1,
-0.9921005, 0.1539588, -1.64017, 0.9843137, 1, 0, 1,
-0.9896846, -0.006631936, -0.4073072, 0.9803922, 1, 0, 1,
-0.9893975, -0.1187156, -1.374843, 0.972549, 1, 0, 1,
-0.9863176, 0.8348265, -0.4665121, 0.9686275, 1, 0, 1,
-0.9857354, 0.5322756, -1.675428, 0.9607843, 1, 0, 1,
-0.9855504, 0.3558459, -0.908103, 0.9568627, 1, 0, 1,
-0.981451, 0.4903755, 0.7900598, 0.9490196, 1, 0, 1,
-0.9786462, 0.8701381, -1.19216, 0.945098, 1, 0, 1,
-0.9785457, -0.7800952, -1.921884, 0.9372549, 1, 0, 1,
-0.9749286, 0.7322981, -1.836298, 0.9333333, 1, 0, 1,
-0.9738049, -0.2352187, -2.456666, 0.9254902, 1, 0, 1,
-0.9727532, -0.1663571, -3.351843, 0.9215686, 1, 0, 1,
-0.9693142, -1.072788, -2.978917, 0.9137255, 1, 0, 1,
-0.9671766, 0.2461911, 0.7237102, 0.9098039, 1, 0, 1,
-0.9592129, -0.485754, -2.089852, 0.9019608, 1, 0, 1,
-0.9442309, 0.2625762, -1.108896, 0.8941177, 1, 0, 1,
-0.9417356, 1.673271, -1.44919, 0.8901961, 1, 0, 1,
-0.9366595, -1.925483, -3.308775, 0.8823529, 1, 0, 1,
-0.9337162, -1.059199, -2.387283, 0.8784314, 1, 0, 1,
-0.9321877, 1.017368, 0.5768327, 0.8705882, 1, 0, 1,
-0.9293478, -0.1637266, -2.121336, 0.8666667, 1, 0, 1,
-0.9257013, -0.7640676, -3.504044, 0.8588235, 1, 0, 1,
-0.9157383, 1.086553, 0.2946841, 0.854902, 1, 0, 1,
-0.9134799, 0.02621107, -0.5897821, 0.8470588, 1, 0, 1,
-0.9123064, -2.606076, -1.6517, 0.8431373, 1, 0, 1,
-0.9107466, -0.2985558, -2.525219, 0.8352941, 1, 0, 1,
-0.9063178, 0.4602199, -0.3313858, 0.8313726, 1, 0, 1,
-0.9020517, 0.821402, -4.237038, 0.8235294, 1, 0, 1,
-0.8941777, 0.6186754, -0.761764, 0.8196079, 1, 0, 1,
-0.8932343, -0.8881928, -3.083651, 0.8117647, 1, 0, 1,
-0.8932104, 0.5937769, -1.189924, 0.8078431, 1, 0, 1,
-0.8859426, -0.1323778, -0.2501307, 0.8, 1, 0, 1,
-0.8843336, -0.42705, -1.117071, 0.7921569, 1, 0, 1,
-0.8779048, -0.05232656, -2.086174, 0.7882353, 1, 0, 1,
-0.8775005, -1.6018, -2.081878, 0.7803922, 1, 0, 1,
-0.8702363, 1.108288, -0.9713375, 0.7764706, 1, 0, 1,
-0.8679891, -0.03581556, -0.8595231, 0.7686275, 1, 0, 1,
-0.8669221, 0.4687472, 0.3423311, 0.7647059, 1, 0, 1,
-0.8635098, -0.1320531, -1.746183, 0.7568628, 1, 0, 1,
-0.8600973, -0.06929031, -1.037969, 0.7529412, 1, 0, 1,
-0.8580863, 1.170193, 0.3360122, 0.7450981, 1, 0, 1,
-0.8495442, -1.268558, -3.500069, 0.7411765, 1, 0, 1,
-0.8494746, -1.15125, -2.858048, 0.7333333, 1, 0, 1,
-0.8490179, 1.814959, 0.06788334, 0.7294118, 1, 0, 1,
-0.845145, 0.4779063, -1.295797, 0.7215686, 1, 0, 1,
-0.8402572, 0.1736685, -1.567881, 0.7176471, 1, 0, 1,
-0.8388958, -1.282658, -3.271802, 0.7098039, 1, 0, 1,
-0.8354277, 1.077681, -0.1246113, 0.7058824, 1, 0, 1,
-0.8290809, 0.3290901, -1.213084, 0.6980392, 1, 0, 1,
-0.828673, 0.4068279, -0.8983243, 0.6901961, 1, 0, 1,
-0.8277236, 0.6147667, -1.73069, 0.6862745, 1, 0, 1,
-0.8109236, 0.08357123, 0.2632573, 0.6784314, 1, 0, 1,
-0.806405, -0.02418987, -3.026199, 0.6745098, 1, 0, 1,
-0.804117, -1.016825, -2.404546, 0.6666667, 1, 0, 1,
-0.8029386, -0.7508064, -3.04554, 0.6627451, 1, 0, 1,
-0.8000623, -0.4452415, -3.305429, 0.654902, 1, 0, 1,
-0.7976279, -0.7446421, -2.055079, 0.6509804, 1, 0, 1,
-0.792949, 0.5376071, -1.999552, 0.6431373, 1, 0, 1,
-0.7898625, 1.0539, 0.8838359, 0.6392157, 1, 0, 1,
-0.7856629, 0.7986491, -2.830441, 0.6313726, 1, 0, 1,
-0.7810261, 1.043704, -1.366574, 0.627451, 1, 0, 1,
-0.7753744, 1.080773, -0.2138582, 0.6196079, 1, 0, 1,
-0.7725677, 0.6626284, 0.2867854, 0.6156863, 1, 0, 1,
-0.7624246, -1.008315, -2.999673, 0.6078432, 1, 0, 1,
-0.7606493, 1.224547, -0.5167153, 0.6039216, 1, 0, 1,
-0.7530096, 1.118951, -1.687591, 0.5960785, 1, 0, 1,
-0.7489073, 0.4041751, -1.867763, 0.5882353, 1, 0, 1,
-0.7457856, 0.1574683, -2.434674, 0.5843138, 1, 0, 1,
-0.745042, 1.342903, -1.369297, 0.5764706, 1, 0, 1,
-0.7422976, 0.2255313, -0.7243797, 0.572549, 1, 0, 1,
-0.7387127, 1.293294, -1.399289, 0.5647059, 1, 0, 1,
-0.7228591, 0.04593159, -1.859276, 0.5607843, 1, 0, 1,
-0.7219024, 0.6845345, -1.0908, 0.5529412, 1, 0, 1,
-0.7179361, -0.1822712, -2.034905, 0.5490196, 1, 0, 1,
-0.7133769, -1.904509, -0.8379922, 0.5411765, 1, 0, 1,
-0.7132196, -0.2048442, -0.766676, 0.5372549, 1, 0, 1,
-0.7118325, 1.54407, 0.4011222, 0.5294118, 1, 0, 1,
-0.7073438, -0.3918455, -1.544238, 0.5254902, 1, 0, 1,
-0.7052118, -0.3389091, -1.411081, 0.5176471, 1, 0, 1,
-0.7042885, -1.446996, -4.889193, 0.5137255, 1, 0, 1,
-0.7002999, -0.4250785, -0.5528678, 0.5058824, 1, 0, 1,
-0.6966035, -2.059984, -2.683208, 0.5019608, 1, 0, 1,
-0.6951614, 1.03852, 0.1756223, 0.4941176, 1, 0, 1,
-0.6911988, 1.13009, -2.076603, 0.4862745, 1, 0, 1,
-0.6900541, 0.03468857, -3.299769, 0.4823529, 1, 0, 1,
-0.6838121, -0.01249692, -2.310234, 0.4745098, 1, 0, 1,
-0.6832054, -0.4161434, -1.274542, 0.4705882, 1, 0, 1,
-0.6799309, -0.3333978, -2.776521, 0.4627451, 1, 0, 1,
-0.6792819, 1.958405, -0.4055597, 0.4588235, 1, 0, 1,
-0.6792727, -1.842751, -2.85245, 0.4509804, 1, 0, 1,
-0.6784411, 0.6902189, -2.226901, 0.4470588, 1, 0, 1,
-0.6784014, -0.3920065, -2.844145, 0.4392157, 1, 0, 1,
-0.6781268, -1.38771, -2.192632, 0.4352941, 1, 0, 1,
-0.674657, -0.6627437, -3.904084, 0.427451, 1, 0, 1,
-0.6731641, 0.7144795, -0.5417965, 0.4235294, 1, 0, 1,
-0.6617059, -0.172415, -1.570791, 0.4156863, 1, 0, 1,
-0.6574759, -2.280706, -2.909621, 0.4117647, 1, 0, 1,
-0.6558287, -1.000947, -3.12133, 0.4039216, 1, 0, 1,
-0.6547906, -0.00610911, -1.399907, 0.3960784, 1, 0, 1,
-0.652469, -0.2536378, -2.299783, 0.3921569, 1, 0, 1,
-0.6517833, 0.5906848, 0.1150378, 0.3843137, 1, 0, 1,
-0.6504279, -1.858736, -3.035158, 0.3803922, 1, 0, 1,
-0.649014, 0.1514669, -0.08733729, 0.372549, 1, 0, 1,
-0.6481835, 0.7646849, -1.30093, 0.3686275, 1, 0, 1,
-0.6419257, 0.3331675, -2.098112, 0.3607843, 1, 0, 1,
-0.6390482, -1.486248, -2.040925, 0.3568628, 1, 0, 1,
-0.6371967, 0.3166787, -1.395085, 0.3490196, 1, 0, 1,
-0.6368955, 1.042641, 0.1743527, 0.345098, 1, 0, 1,
-0.6323497, 1.052145, 0.5721046, 0.3372549, 1, 0, 1,
-0.6269132, 1.503632, -0.2236289, 0.3333333, 1, 0, 1,
-0.6234731, -0.6616046, -2.338368, 0.3254902, 1, 0, 1,
-0.622848, -2.075978, -1.686677, 0.3215686, 1, 0, 1,
-0.6218011, -2.31023, -2.660804, 0.3137255, 1, 0, 1,
-0.6183625, 1.630363, 0.2170641, 0.3098039, 1, 0, 1,
-0.6170413, -0.5103086, -1.247301, 0.3019608, 1, 0, 1,
-0.6150531, 1.287255, 0.05884852, 0.2941177, 1, 0, 1,
-0.6132433, 0.8417083, 1.799042, 0.2901961, 1, 0, 1,
-0.6043236, 0.06729526, -1.894023, 0.282353, 1, 0, 1,
-0.6010313, 0.5439838, -1.414922, 0.2784314, 1, 0, 1,
-0.5986583, 0.2901411, 0.3842897, 0.2705882, 1, 0, 1,
-0.5935481, 0.4780422, -0.6175764, 0.2666667, 1, 0, 1,
-0.5904047, -1.997517, -3.038931, 0.2588235, 1, 0, 1,
-0.5897816, -1.146135, -2.11482, 0.254902, 1, 0, 1,
-0.5867791, -1.015393, -2.611587, 0.2470588, 1, 0, 1,
-0.5823226, -0.6019715, -0.9606591, 0.2431373, 1, 0, 1,
-0.5794561, 0.02266831, -0.6189731, 0.2352941, 1, 0, 1,
-0.5789433, 0.1345775, -0.9175326, 0.2313726, 1, 0, 1,
-0.5781687, 1.292329, -1.381241, 0.2235294, 1, 0, 1,
-0.5761163, -0.04935003, -3.207791, 0.2196078, 1, 0, 1,
-0.5754157, 0.04082114, 0.01800643, 0.2117647, 1, 0, 1,
-0.5746014, -0.6233741, -0.9281833, 0.2078431, 1, 0, 1,
-0.5731849, 0.2109805, 0.6012639, 0.2, 1, 0, 1,
-0.5728621, 0.222195, -0.1751693, 0.1921569, 1, 0, 1,
-0.5722436, -0.2915926, -2.320994, 0.1882353, 1, 0, 1,
-0.5693319, 1.741959, 1.726018, 0.1803922, 1, 0, 1,
-0.5609683, -0.4986072, -3.860092, 0.1764706, 1, 0, 1,
-0.5608572, -0.8096905, -1.148386, 0.1686275, 1, 0, 1,
-0.5601958, -0.6215904, -1.863512, 0.1647059, 1, 0, 1,
-0.5574763, -1.62041, -2.07462, 0.1568628, 1, 0, 1,
-0.5534895, -0.723797, -2.928915, 0.1529412, 1, 0, 1,
-0.5525265, 1.294736, 0.003991717, 0.145098, 1, 0, 1,
-0.5462628, 0.5353721, -1.914845, 0.1411765, 1, 0, 1,
-0.5420456, 1.92229, -0.06245044, 0.1333333, 1, 0, 1,
-0.5305455, -1.582557, -1.991568, 0.1294118, 1, 0, 1,
-0.5294455, 0.1236224, -2.68895, 0.1215686, 1, 0, 1,
-0.5287548, 0.623643, -0.8499101, 0.1176471, 1, 0, 1,
-0.5271395, 1.639918, 1.422538, 0.1098039, 1, 0, 1,
-0.527067, 1.821337, 2.207856, 0.1058824, 1, 0, 1,
-0.5266678, -0.02663732, -3.392885, 0.09803922, 1, 0, 1,
-0.5251234, -1.764657, -2.05021, 0.09019608, 1, 0, 1,
-0.5236388, -0.530176, -0.4595009, 0.08627451, 1, 0, 1,
-0.5229816, 0.1862156, 0.6237886, 0.07843138, 1, 0, 1,
-0.5213763, 0.4443889, 0.3041751, 0.07450981, 1, 0, 1,
-0.5178306, -0.7054794, -3.340184, 0.06666667, 1, 0, 1,
-0.5161555, -1.688361, -1.852664, 0.0627451, 1, 0, 1,
-0.5150859, -0.4683184, -0.2402836, 0.05490196, 1, 0, 1,
-0.5142468, 0.2344947, -0.2900708, 0.05098039, 1, 0, 1,
-0.5135459, 2.088613, -1.592856, 0.04313726, 1, 0, 1,
-0.51096, -0.6965693, -2.077178, 0.03921569, 1, 0, 1,
-0.5096647, -0.1597541, -1.058096, 0.03137255, 1, 0, 1,
-0.5043641, 1.138248, -0.2417543, 0.02745098, 1, 0, 1,
-0.5019058, -0.8309782, -3.848881, 0.01960784, 1, 0, 1,
-0.5011214, 1.4315, 1.159083, 0.01568628, 1, 0, 1,
-0.4988759, 0.7896832, -1.895837, 0.007843138, 1, 0, 1,
-0.4962073, 1.56938, 0.404743, 0.003921569, 1, 0, 1,
-0.4936976, -0.3882982, -1.018329, 0, 1, 0.003921569, 1,
-0.4926464, -0.1415119, -3.809186, 0, 1, 0.01176471, 1,
-0.4918308, -2.491763, -3.702452, 0, 1, 0.01568628, 1,
-0.4886719, -0.1737322, -3.612892, 0, 1, 0.02352941, 1,
-0.4872675, 0.8741352, -0.7465425, 0, 1, 0.02745098, 1,
-0.486076, 2.242578, 0.3655582, 0, 1, 0.03529412, 1,
-0.4836293, -0.03274058, -0.3535515, 0, 1, 0.03921569, 1,
-0.4812509, 0.04999023, -0.2170987, 0, 1, 0.04705882, 1,
-0.4789436, -2.169128, -2.006206, 0, 1, 0.05098039, 1,
-0.4764762, -0.05507624, -0.2135208, 0, 1, 0.05882353, 1,
-0.4760305, 0.5477236, -0.5819286, 0, 1, 0.0627451, 1,
-0.4747481, -0.7446222, -3.741751, 0, 1, 0.07058824, 1,
-0.4713731, -1.119624, -3.170755, 0, 1, 0.07450981, 1,
-0.4529726, 0.6643488, -0.9690821, 0, 1, 0.08235294, 1,
-0.4514489, 0.7922229, -0.1627837, 0, 1, 0.08627451, 1,
-0.4506931, -0.4641965, -3.333924, 0, 1, 0.09411765, 1,
-0.4496899, 0.2547573, -0.8015431, 0, 1, 0.1019608, 1,
-0.4421495, -1.382674, -2.025235, 0, 1, 0.1058824, 1,
-0.4319473, -1.099505, -2.829946, 0, 1, 0.1137255, 1,
-0.4307429, 0.2448661, -1.170218, 0, 1, 0.1176471, 1,
-0.4298157, -0.06511756, -0.7856589, 0, 1, 0.1254902, 1,
-0.4274472, 0.1726595, -1.150267, 0, 1, 0.1294118, 1,
-0.4199729, 0.7000509, -0.7971193, 0, 1, 0.1372549, 1,
-0.4185537, 0.5632168, -1.821768, 0, 1, 0.1411765, 1,
-0.4160973, 1.083206, 0.1755478, 0, 1, 0.1490196, 1,
-0.411602, 0.4792295, -1.17161, 0, 1, 0.1529412, 1,
-0.4102761, -0.3687735, -1.607413, 0, 1, 0.1607843, 1,
-0.4083995, 0.8108756, -1.896105, 0, 1, 0.1647059, 1,
-0.4078505, -1.147633, -0.5341339, 0, 1, 0.172549, 1,
-0.4073355, 0.5242186, -0.2713111, 0, 1, 0.1764706, 1,
-0.403977, -2.170498, -2.09043, 0, 1, 0.1843137, 1,
-0.3974696, 0.8029499, -1.346942, 0, 1, 0.1882353, 1,
-0.3868662, -0.7394648, -2.935319, 0, 1, 0.1960784, 1,
-0.3859014, 0.4578182, 0.06414317, 0, 1, 0.2039216, 1,
-0.3819652, 0.08175341, -3.005835, 0, 1, 0.2078431, 1,
-0.3781098, -1.182073, -2.92839, 0, 1, 0.2156863, 1,
-0.3745576, -0.4734604, -1.848708, 0, 1, 0.2196078, 1,
-0.3743746, -0.5890103, -2.974778, 0, 1, 0.227451, 1,
-0.3738598, -0.1037658, -2.547241, 0, 1, 0.2313726, 1,
-0.3695078, 0.07189795, -1.012948, 0, 1, 0.2392157, 1,
-0.3650801, -1.023563, -2.40626, 0, 1, 0.2431373, 1,
-0.36255, 1.172854, 1.15363, 0, 1, 0.2509804, 1,
-0.353952, -0.0586058, -3.102289, 0, 1, 0.254902, 1,
-0.3494193, 1.236415, -2.299314, 0, 1, 0.2627451, 1,
-0.3474274, -0.6922383, -1.194239, 0, 1, 0.2666667, 1,
-0.3470825, 1.514748, 0.3342151, 0, 1, 0.2745098, 1,
-0.3457381, -0.03806527, -0.1513936, 0, 1, 0.2784314, 1,
-0.3419911, 1.746119, -0.107513, 0, 1, 0.2862745, 1,
-0.338725, -0.3642375, -1.764986, 0, 1, 0.2901961, 1,
-0.3355878, 1.349367, -1.63052, 0, 1, 0.2980392, 1,
-0.3341947, -0.8490834, -4.339554, 0, 1, 0.3058824, 1,
-0.3267273, -1.638984, -3.518672, 0, 1, 0.3098039, 1,
-0.3266571, -0.2893731, -1.702387, 0, 1, 0.3176471, 1,
-0.3247099, -0.2497735, -1.651478, 0, 1, 0.3215686, 1,
-0.3234611, 1.303978, 0.01806251, 0, 1, 0.3294118, 1,
-0.3136173, 0.3060598, -0.4811771, 0, 1, 0.3333333, 1,
-0.3134412, 0.4296086, 0.8126972, 0, 1, 0.3411765, 1,
-0.3125693, -0.1810135, -2.499143, 0, 1, 0.345098, 1,
-0.3096243, -0.1618138, -4.507463, 0, 1, 0.3529412, 1,
-0.3069848, 0.9072837, 0.3478614, 0, 1, 0.3568628, 1,
-0.3069583, 0.7836516, -0.9675328, 0, 1, 0.3647059, 1,
-0.3046732, 0.3974779, 0.271146, 0, 1, 0.3686275, 1,
-0.300542, 0.09886369, -1.915313, 0, 1, 0.3764706, 1,
-0.2987558, 2.285714, -0.3913578, 0, 1, 0.3803922, 1,
-0.2966422, 1.724029, 1.031949, 0, 1, 0.3882353, 1,
-0.2942391, -1.126169, -3.755684, 0, 1, 0.3921569, 1,
-0.2932104, -0.006449509, 0.2588177, 0, 1, 0.4, 1,
-0.2926475, -0.1743126, -1.425558, 0, 1, 0.4078431, 1,
-0.2917645, 0.1760478, -0.8498122, 0, 1, 0.4117647, 1,
-0.289944, 0.915368, -1.060575, 0, 1, 0.4196078, 1,
-0.281135, -0.1600357, -0.9724421, 0, 1, 0.4235294, 1,
-0.2796794, 0.6764766, 0.5374291, 0, 1, 0.4313726, 1,
-0.2786503, -0.0001114411, -1.079406, 0, 1, 0.4352941, 1,
-0.2772744, 1.429985, -0.3956227, 0, 1, 0.4431373, 1,
-0.277177, 0.01823614, -2.098063, 0, 1, 0.4470588, 1,
-0.2756539, 0.2654506, 0.9063152, 0, 1, 0.454902, 1,
-0.2742056, -0.08267643, -1.973428, 0, 1, 0.4588235, 1,
-0.2741329, -0.8794665, -4.418025, 0, 1, 0.4666667, 1,
-0.2690966, 0.5967497, -0.9460329, 0, 1, 0.4705882, 1,
-0.2669295, -0.04788533, -1.548769, 0, 1, 0.4784314, 1,
-0.2640826, -0.2200573, -1.948807, 0, 1, 0.4823529, 1,
-0.2564669, 0.3573502, -0.9572461, 0, 1, 0.4901961, 1,
-0.2494908, 0.7355641, -0.2197237, 0, 1, 0.4941176, 1,
-0.2490228, -1.355084, -1.831307, 0, 1, 0.5019608, 1,
-0.2480529, -1.676768, -0.3413352, 0, 1, 0.509804, 1,
-0.2475279, -0.5616695, -2.369739, 0, 1, 0.5137255, 1,
-0.2472768, -0.6757608, -5.072194, 0, 1, 0.5215687, 1,
-0.246759, -1.489309, -3.254954, 0, 1, 0.5254902, 1,
-0.2407401, 1.382988, -1.201268, 0, 1, 0.5333334, 1,
-0.2401317, -2.467989, -2.278573, 0, 1, 0.5372549, 1,
-0.2387013, -1.397761, -2.852151, 0, 1, 0.5450981, 1,
-0.2371757, -0.9394773, -2.206321, 0, 1, 0.5490196, 1,
-0.2326105, 0.9707869, -0.4460928, 0, 1, 0.5568628, 1,
-0.2316679, -0.3675684, -1.36335, 0, 1, 0.5607843, 1,
-0.2312032, 0.1161262, -0.7276802, 0, 1, 0.5686275, 1,
-0.2295258, -2.179312, -3.867057, 0, 1, 0.572549, 1,
-0.2282462, 0.5107427, 0.411699, 0, 1, 0.5803922, 1,
-0.2255344, -0.7610788, -2.69759, 0, 1, 0.5843138, 1,
-0.2197943, -1.31445, -3.436376, 0, 1, 0.5921569, 1,
-0.21869, -1.384871, -2.897017, 0, 1, 0.5960785, 1,
-0.213383, -0.8869827, -3.969288, 0, 1, 0.6039216, 1,
-0.2112043, -1.262129, -3.716698, 0, 1, 0.6117647, 1,
-0.210676, 0.2162493, -0.8368478, 0, 1, 0.6156863, 1,
-0.2100607, -1.419067, -2.208897, 0, 1, 0.6235294, 1,
-0.2059845, 0.6002067, -0.3161173, 0, 1, 0.627451, 1,
-0.2044363, -0.04023282, -1.261129, 0, 1, 0.6352941, 1,
-0.2040053, 1.59425, 0.4602498, 0, 1, 0.6392157, 1,
-0.2023413, -0.2452868, -1.73001, 0, 1, 0.6470588, 1,
-0.195527, -0.1752995, -3.070115, 0, 1, 0.6509804, 1,
-0.1937635, 0.9685186, 0.2953449, 0, 1, 0.6588235, 1,
-0.1936782, -0.6879233, -3.707569, 0, 1, 0.6627451, 1,
-0.1930436, 0.09659992, -0.2934492, 0, 1, 0.6705883, 1,
-0.1827126, 0.4972455, -1.170997, 0, 1, 0.6745098, 1,
-0.1814236, 0.7610348, 1.123481, 0, 1, 0.682353, 1,
-0.1793565, -1.133428, -2.823468, 0, 1, 0.6862745, 1,
-0.177311, 1.327455, -0.06219234, 0, 1, 0.6941177, 1,
-0.176384, 1.376631, 0.5152364, 0, 1, 0.7019608, 1,
-0.1725376, 0.1613343, -0.554933, 0, 1, 0.7058824, 1,
-0.1725164, 0.1886305, -1.609663, 0, 1, 0.7137255, 1,
-0.1721676, 1.010702, -1.309299, 0, 1, 0.7176471, 1,
-0.1718722, -0.3604619, -2.914232, 0, 1, 0.7254902, 1,
-0.1676139, 0.5989791, 0.4143477, 0, 1, 0.7294118, 1,
-0.166892, -1.623496, -4.737479, 0, 1, 0.7372549, 1,
-0.1667454, -0.6665454, -3.57816, 0, 1, 0.7411765, 1,
-0.1636785, 1.471711, -2.185962, 0, 1, 0.7490196, 1,
-0.1629353, 0.8831635, 0.3415697, 0, 1, 0.7529412, 1,
-0.1622281, 1.189763, -0.4627914, 0, 1, 0.7607843, 1,
-0.1600453, -0.7306066, -1.042179, 0, 1, 0.7647059, 1,
-0.159794, -0.9470307, -2.664744, 0, 1, 0.772549, 1,
-0.1578396, -0.1796528, -2.470813, 0, 1, 0.7764706, 1,
-0.1550211, 0.4500542, 0.1552486, 0, 1, 0.7843137, 1,
-0.1537947, -0.507759, -2.411821, 0, 1, 0.7882353, 1,
-0.1524255, -1.605079, -3.568245, 0, 1, 0.7960784, 1,
-0.1506206, -0.6801797, -3.371958, 0, 1, 0.8039216, 1,
-0.149453, 0.9813036, 0.3764958, 0, 1, 0.8078431, 1,
-0.14942, 0.6405028, -0.2063943, 0, 1, 0.8156863, 1,
-0.1452419, 0.8901743, 0.02247465, 0, 1, 0.8196079, 1,
-0.1409765, -1.015166, -2.682885, 0, 1, 0.827451, 1,
-0.1376158, 0.4586951, 0.01603908, 0, 1, 0.8313726, 1,
-0.1372428, -0.5404075, -2.706528, 0, 1, 0.8392157, 1,
-0.1365412, -0.6201672, -1.671157, 0, 1, 0.8431373, 1,
-0.1339968, -1.111108, -3.129065, 0, 1, 0.8509804, 1,
-0.1278643, -0.8201255, -2.859723, 0, 1, 0.854902, 1,
-0.1257121, -1.205795, -2.137312, 0, 1, 0.8627451, 1,
-0.1241792, -1.093459, -3.395092, 0, 1, 0.8666667, 1,
-0.1206708, -0.01896348, -1.472806, 0, 1, 0.8745098, 1,
-0.1200931, -0.3961173, -3.04741, 0, 1, 0.8784314, 1,
-0.1141703, 0.3954084, 0.2560817, 0, 1, 0.8862745, 1,
-0.1111012, 0.4339156, 0.08315217, 0, 1, 0.8901961, 1,
-0.1095575, 2.54423, 0.3558274, 0, 1, 0.8980392, 1,
-0.1083628, -0.5630497, -3.581041, 0, 1, 0.9058824, 1,
-0.1068426, 0.4592189, 0.7338275, 0, 1, 0.9098039, 1,
-0.1055368, 1.109785, -2.156805, 0, 1, 0.9176471, 1,
-0.1043218, 0.3764973, -1.189111, 0, 1, 0.9215686, 1,
-0.1014778, -0.1303516, -3.273797, 0, 1, 0.9294118, 1,
-0.1006256, -3.041853, -3.398239, 0, 1, 0.9333333, 1,
-0.09881178, -0.5326627, -3.188229, 0, 1, 0.9411765, 1,
-0.09321743, 0.09544942, -1.439343, 0, 1, 0.945098, 1,
-0.09083366, 0.8476466, 0.2414844, 0, 1, 0.9529412, 1,
-0.09016068, -0.5732251, -2.147994, 0, 1, 0.9568627, 1,
-0.0885729, -0.1916688, -2.670058, 0, 1, 0.9647059, 1,
-0.08434089, 1.658673, -0.1493409, 0, 1, 0.9686275, 1,
-0.08423632, 0.7203608, -0.009650041, 0, 1, 0.9764706, 1,
-0.08082093, 2.108659, -2.211956, 0, 1, 0.9803922, 1,
-0.07969636, 0.1162032, -1.933435, 0, 1, 0.9882353, 1,
-0.07751009, -0.1004748, -2.800594, 0, 1, 0.9921569, 1,
-0.07489993, 0.06384297, -1.211228, 0, 1, 1, 1,
-0.07029037, 2.458298, -0.05782005, 0, 0.9921569, 1, 1,
-0.0697986, 0.9377193, 0.269839, 0, 0.9882353, 1, 1,
-0.06943361, 0.7149782, -0.3984337, 0, 0.9803922, 1, 1,
-0.06889712, -0.03014289, -1.526134, 0, 0.9764706, 1, 1,
-0.06805903, 1.605332, -0.2441826, 0, 0.9686275, 1, 1,
-0.06391474, -1.26807, -4.124316, 0, 0.9647059, 1, 1,
-0.06223445, 1.248328, 0.8557831, 0, 0.9568627, 1, 1,
-0.06175771, -0.7913942, -2.675251, 0, 0.9529412, 1, 1,
-0.06111985, 0.9831041, -1.036898, 0, 0.945098, 1, 1,
-0.06005397, 0.3426635, -0.7920338, 0, 0.9411765, 1, 1,
-0.05495422, 2.636336, 1.824993, 0, 0.9333333, 1, 1,
-0.05317326, 1.08138, -2.026963, 0, 0.9294118, 1, 1,
-0.04958351, 0.7402636, -1.389323, 0, 0.9215686, 1, 1,
-0.04896268, -0.1720498, -1.64063, 0, 0.9176471, 1, 1,
-0.04827918, -1.373733, -1.956708, 0, 0.9098039, 1, 1,
-0.04633483, -0.250382, -2.875795, 0, 0.9058824, 1, 1,
-0.04062101, 1.357063, -1.007307, 0, 0.8980392, 1, 1,
-0.03420058, -0.2013417, -4.133885, 0, 0.8901961, 1, 1,
-0.03410742, -0.1215182, -2.017465, 0, 0.8862745, 1, 1,
-0.02786321, -0.08303706, -3.246487, 0, 0.8784314, 1, 1,
-0.02607708, 1.220851, -0.8178207, 0, 0.8745098, 1, 1,
-0.02357072, -0.4129121, -3.322454, 0, 0.8666667, 1, 1,
-0.02314318, -0.02688978, -2.386992, 0, 0.8627451, 1, 1,
-0.01630183, -1.055308, -2.895462, 0, 0.854902, 1, 1,
-0.01262666, 0.3664435, -1.24715, 0, 0.8509804, 1, 1,
-0.01098833, -0.3927801, -0.5442457, 0, 0.8431373, 1, 1,
-0.01059493, -2.10257, -2.385627, 0, 0.8392157, 1, 1,
0.002460082, -2.108134, 3.166293, 0, 0.8313726, 1, 1,
0.002725488, -0.5245177, 4.637246, 0, 0.827451, 1, 1,
0.005338075, 1.587311, -0.33342, 0, 0.8196079, 1, 1,
0.007771975, -0.245194, 2.998706, 0, 0.8156863, 1, 1,
0.009906494, 0.5025948, 0.9380329, 0, 0.8078431, 1, 1,
0.02369058, -0.4465172, 3.299864, 0, 0.8039216, 1, 1,
0.02787587, 1.670554, -0.4073394, 0, 0.7960784, 1, 1,
0.03024718, 1.432886, -0.04037687, 0, 0.7882353, 1, 1,
0.03270195, -1.21032, 4.002259, 0, 0.7843137, 1, 1,
0.03499303, 1.158754, 2.578691, 0, 0.7764706, 1, 1,
0.03737102, -0.5403963, 0.0104621, 0, 0.772549, 1, 1,
0.03778699, 0.6380253, -0.3073966, 0, 0.7647059, 1, 1,
0.04446941, 1.314661, 0.5204647, 0, 0.7607843, 1, 1,
0.0491223, 0.6970099, 1.777925, 0, 0.7529412, 1, 1,
0.0499462, 1.631714, 0.1432248, 0, 0.7490196, 1, 1,
0.05136404, -0.8543508, 2.185172, 0, 0.7411765, 1, 1,
0.0526938, 1.937915, 0.4837447, 0, 0.7372549, 1, 1,
0.05342351, -0.7751925, 3.893469, 0, 0.7294118, 1, 1,
0.05604058, -0.921075, 2.681381, 0, 0.7254902, 1, 1,
0.05864075, 0.06353832, -0.8795447, 0, 0.7176471, 1, 1,
0.0593357, 0.116268, -1.160613, 0, 0.7137255, 1, 1,
0.06134844, -0.3134815, 4.352933, 0, 0.7058824, 1, 1,
0.06141469, 0.5864034, -0.3439362, 0, 0.6980392, 1, 1,
0.06315927, 0.1740522, 1.464511, 0, 0.6941177, 1, 1,
0.06758134, 0.4495938, 0.5599384, 0, 0.6862745, 1, 1,
0.06832833, -0.3604423, 1.842453, 0, 0.682353, 1, 1,
0.07069048, -1.23094, 2.514377, 0, 0.6745098, 1, 1,
0.08368295, -1.250632, 3.11257, 0, 0.6705883, 1, 1,
0.08912873, -1.376556, 2.345088, 0, 0.6627451, 1, 1,
0.09398168, 0.1857009, 0.3508096, 0, 0.6588235, 1, 1,
0.09413135, 0.413819, 0.9580249, 0, 0.6509804, 1, 1,
0.09421358, -0.267453, 3.544022, 0, 0.6470588, 1, 1,
0.09506217, -2.014802, 5.361567, 0, 0.6392157, 1, 1,
0.09967139, -0.2108763, 1.716406, 0, 0.6352941, 1, 1,
0.1048191, -1.676124, 4.440519, 0, 0.627451, 1, 1,
0.105516, 1.487397, 0.702396, 0, 0.6235294, 1, 1,
0.1083532, 0.8296324, 0.4568842, 0, 0.6156863, 1, 1,
0.111314, -0.8194083, 2.877424, 0, 0.6117647, 1, 1,
0.1146628, -2.048514, 4.233576, 0, 0.6039216, 1, 1,
0.1152202, 0.5646054, -0.4956928, 0, 0.5960785, 1, 1,
0.1216465, 0.2722443, 0.8403765, 0, 0.5921569, 1, 1,
0.1271254, 0.08149479, 1.468453, 0, 0.5843138, 1, 1,
0.1275102, -0.9803157, 2.681208, 0, 0.5803922, 1, 1,
0.1336077, 0.7663863, -0.8352275, 0, 0.572549, 1, 1,
0.1342505, 1.68942, 0.3480831, 0, 0.5686275, 1, 1,
0.1356981, -0.0001024849, 1.290476, 0, 0.5607843, 1, 1,
0.1372948, 0.4393675, 0.005653805, 0, 0.5568628, 1, 1,
0.141438, -1.061688, 3.930396, 0, 0.5490196, 1, 1,
0.1444918, 0.1449504, 1.103082, 0, 0.5450981, 1, 1,
0.1512109, -0.6791754, 2.719346, 0, 0.5372549, 1, 1,
0.1526463, -0.6736319, 2.886169, 0, 0.5333334, 1, 1,
0.1568549, -1.350249, 3.741917, 0, 0.5254902, 1, 1,
0.1570264, 0.164395, 0.9202985, 0, 0.5215687, 1, 1,
0.1573981, -0.6671442, 1.06345, 0, 0.5137255, 1, 1,
0.1581754, 0.203879, -0.8863761, 0, 0.509804, 1, 1,
0.1651499, 0.1909073, 0.615894, 0, 0.5019608, 1, 1,
0.1715904, -0.0794426, 2.234044, 0, 0.4941176, 1, 1,
0.1735022, -0.6183723, 2.770969, 0, 0.4901961, 1, 1,
0.1738982, -0.772409, 3.116971, 0, 0.4823529, 1, 1,
0.1742002, 0.9157404, 1.091363, 0, 0.4784314, 1, 1,
0.1749243, -0.3386247, 2.366, 0, 0.4705882, 1, 1,
0.1812825, 1.206912, -0.9458828, 0, 0.4666667, 1, 1,
0.1859894, -1.373459, 2.076864, 0, 0.4588235, 1, 1,
0.1923755, -1.808381, 3.53633, 0, 0.454902, 1, 1,
0.1936053, 0.6892937, -0.6914207, 0, 0.4470588, 1, 1,
0.1992201, -2.239241, 3.267356, 0, 0.4431373, 1, 1,
0.2016241, 1.055863, 1.6561, 0, 0.4352941, 1, 1,
0.2016473, 1.294008, 1.199972, 0, 0.4313726, 1, 1,
0.2017892, 1.848333, 0.6357197, 0, 0.4235294, 1, 1,
0.2020497, -0.5026524, 3.206043, 0, 0.4196078, 1, 1,
0.2076757, 1.102684, 2.57831, 0, 0.4117647, 1, 1,
0.2079273, -0.9541316, 2.101638, 0, 0.4078431, 1, 1,
0.2083198, 1.724129, 0.02654643, 0, 0.4, 1, 1,
0.2116658, 2.983357, 0.2987153, 0, 0.3921569, 1, 1,
0.2117606, 1.511827, -1.177247, 0, 0.3882353, 1, 1,
0.2177405, -0.4614533, 2.509591, 0, 0.3803922, 1, 1,
0.2189576, 0.2093204, 0.1116409, 0, 0.3764706, 1, 1,
0.2210395, -1.059861, 3.381298, 0, 0.3686275, 1, 1,
0.2221426, -1.133898, 2.355516, 0, 0.3647059, 1, 1,
0.2237426, -0.1055753, 1.946189, 0, 0.3568628, 1, 1,
0.2271657, -0.6911744, 1.85916, 0, 0.3529412, 1, 1,
0.2355307, 0.1500083, -0.3942649, 0, 0.345098, 1, 1,
0.2362539, -1.788452, 3.226021, 0, 0.3411765, 1, 1,
0.2384786, 0.5844279, 0.6194268, 0, 0.3333333, 1, 1,
0.240113, 0.5156757, 0.06473421, 0, 0.3294118, 1, 1,
0.2441472, -1.240933, 3.232354, 0, 0.3215686, 1, 1,
0.2472549, 0.04994245, 0.5884433, 0, 0.3176471, 1, 1,
0.2480412, -1.206576, 2.286697, 0, 0.3098039, 1, 1,
0.2574038, -1.582406, 2.266334, 0, 0.3058824, 1, 1,
0.2584563, -0.6986182, 2.473256, 0, 0.2980392, 1, 1,
0.2597052, -0.4009558, 3.814563, 0, 0.2901961, 1, 1,
0.2631875, 0.9724959, -1.208195, 0, 0.2862745, 1, 1,
0.2645315, 0.1145161, 1.75275, 0, 0.2784314, 1, 1,
0.2686682, 1.346219, 1.294598, 0, 0.2745098, 1, 1,
0.2691728, -0.06890561, 1.75186, 0, 0.2666667, 1, 1,
0.2701857, 0.2279302, 1.167679, 0, 0.2627451, 1, 1,
0.2721181, -0.6191776, 1.181129, 0, 0.254902, 1, 1,
0.2733093, -0.7899779, 2.508908, 0, 0.2509804, 1, 1,
0.2759445, 0.5396662, 0.7275885, 0, 0.2431373, 1, 1,
0.2794008, 0.9766719, 0.565458, 0, 0.2392157, 1, 1,
0.283898, -1.272819, 4.247717, 0, 0.2313726, 1, 1,
0.285391, -0.6866421, 3.734534, 0, 0.227451, 1, 1,
0.285433, -1.34917, 3.772214, 0, 0.2196078, 1, 1,
0.2908255, 0.5544341, -0.00247705, 0, 0.2156863, 1, 1,
0.2910301, 0.4463207, 2.256939, 0, 0.2078431, 1, 1,
0.2918049, 1.15877, -0.8627719, 0, 0.2039216, 1, 1,
0.2919665, -0.474235, 1.89975, 0, 0.1960784, 1, 1,
0.2932521, 1.298181, -0.5923278, 0, 0.1882353, 1, 1,
0.2935608, 0.1956155, 0.9655036, 0, 0.1843137, 1, 1,
0.2944194, 1.457605, 1.37239, 0, 0.1764706, 1, 1,
0.2945896, 0.0543832, 2.852911, 0, 0.172549, 1, 1,
0.2972347, 0.9432053, 0.8635522, 0, 0.1647059, 1, 1,
0.3020733, -0.2065854, 4.234909, 0, 0.1607843, 1, 1,
0.3032174, 0.4082872, 1.816992, 0, 0.1529412, 1, 1,
0.3077398, -0.5409982, 3.431379, 0, 0.1490196, 1, 1,
0.3090473, -0.3963723, 1.215405, 0, 0.1411765, 1, 1,
0.3115438, 0.9196898, 0.7490413, 0, 0.1372549, 1, 1,
0.3116116, 0.273536, -0.727801, 0, 0.1294118, 1, 1,
0.3126039, 0.268242, 2.448785, 0, 0.1254902, 1, 1,
0.3136739, -0.1257823, 0.9381692, 0, 0.1176471, 1, 1,
0.3244277, -0.6289964, 2.858958, 0, 0.1137255, 1, 1,
0.3276952, -1.144629, 4.625432, 0, 0.1058824, 1, 1,
0.3287398, -1.132713, 1.941467, 0, 0.09803922, 1, 1,
0.3318036, -0.8420224, 1.523739, 0, 0.09411765, 1, 1,
0.337029, -0.9236533, 2.417629, 0, 0.08627451, 1, 1,
0.3429275, 2.554538, 0.4380518, 0, 0.08235294, 1, 1,
0.3431098, -0.08998962, 2.887485, 0, 0.07450981, 1, 1,
0.3437628, -1.163723, 1.640282, 0, 0.07058824, 1, 1,
0.3437772, 1.974164, 0.2556935, 0, 0.0627451, 1, 1,
0.3480895, -0.4733896, 2.218047, 0, 0.05882353, 1, 1,
0.3489458, 0.916839, 0.3503712, 0, 0.05098039, 1, 1,
0.358486, -0.9918112, 1.199076, 0, 0.04705882, 1, 1,
0.3625562, 0.515336, 0.2996821, 0, 0.03921569, 1, 1,
0.365613, -0.2635937, 2.392377, 0, 0.03529412, 1, 1,
0.3662904, 0.423922, -0.1156151, 0, 0.02745098, 1, 1,
0.3669942, -0.1823667, 0.7808762, 0, 0.02352941, 1, 1,
0.3688291, -1.149707, 3.137161, 0, 0.01568628, 1, 1,
0.3693552, -1.108506, 4.470086, 0, 0.01176471, 1, 1,
0.3794786, 0.7989796, 1.982723, 0, 0.003921569, 1, 1,
0.3806599, 0.5730304, -1.231243, 0.003921569, 0, 1, 1,
0.3808763, 1.333927, 0.1364876, 0.007843138, 0, 1, 1,
0.3820197, -0.3370796, 1.304448, 0.01568628, 0, 1, 1,
0.3842074, -0.860547, 5.412331, 0.01960784, 0, 1, 1,
0.3857597, 1.922821, -0.04776261, 0.02745098, 0, 1, 1,
0.3867424, 0.8947399, -2.405016, 0.03137255, 0, 1, 1,
0.3888335, -1.046216, 2.129126, 0.03921569, 0, 1, 1,
0.3904921, -0.2581265, 0.7674013, 0.04313726, 0, 1, 1,
0.397286, -0.03226233, 3.235455, 0.05098039, 0, 1, 1,
0.3975643, -1.211683, 2.512782, 0.05490196, 0, 1, 1,
0.3992593, -1.34337, 2.410723, 0.0627451, 0, 1, 1,
0.4013584, 1.321543, -0.2568058, 0.06666667, 0, 1, 1,
0.4026815, 0.9051964, 0.1375779, 0.07450981, 0, 1, 1,
0.4029048, -0.961195, 3.789939, 0.07843138, 0, 1, 1,
0.4104862, -0.01671026, 2.957527, 0.08627451, 0, 1, 1,
0.4107656, -1.552327, 2.691609, 0.09019608, 0, 1, 1,
0.4111006, 0.861495, 1.331313, 0.09803922, 0, 1, 1,
0.4123915, -0.8253726, 3.918042, 0.1058824, 0, 1, 1,
0.4137462, 1.443566, 0.8160564, 0.1098039, 0, 1, 1,
0.415405, 1.375786, 0.1158943, 0.1176471, 0, 1, 1,
0.4222883, 1.875456, -0.548905, 0.1215686, 0, 1, 1,
0.4224045, 0.2563758, 0.6253464, 0.1294118, 0, 1, 1,
0.4231399, 0.5293873, -0.4650732, 0.1333333, 0, 1, 1,
0.4256855, -0.05105847, 1.36629, 0.1411765, 0, 1, 1,
0.4344859, 0.7592786, 0.2176119, 0.145098, 0, 1, 1,
0.4371471, -0.1108936, 2.063371, 0.1529412, 0, 1, 1,
0.4371946, -0.8243334, 1.379435, 0.1568628, 0, 1, 1,
0.4379691, 1.606714, -0.2323992, 0.1647059, 0, 1, 1,
0.4418972, -0.06416834, 2.392595, 0.1686275, 0, 1, 1,
0.4436235, -0.6128099, 1.086811, 0.1764706, 0, 1, 1,
0.4453207, 0.6668665, 1.363932, 0.1803922, 0, 1, 1,
0.4465241, 0.7773263, -0.3563953, 0.1882353, 0, 1, 1,
0.446741, 1.032672, -0.009669219, 0.1921569, 0, 1, 1,
0.4517221, 0.2641231, -0.7042534, 0.2, 0, 1, 1,
0.4608001, -1.163707, 2.228121, 0.2078431, 0, 1, 1,
0.4611231, 0.9784652, 0.5168907, 0.2117647, 0, 1, 1,
0.4638937, 0.1297167, 2.379329, 0.2196078, 0, 1, 1,
0.4656281, -1.593768, 2.204841, 0.2235294, 0, 1, 1,
0.4786464, 0.6878707, 0.08701009, 0.2313726, 0, 1, 1,
0.4799335, 0.2245655, 1.075589, 0.2352941, 0, 1, 1,
0.4816004, 0.3705136, -0.008181312, 0.2431373, 0, 1, 1,
0.4938457, 0.7157024, -0.705155, 0.2470588, 0, 1, 1,
0.4951297, -0.0789427, 2.065184, 0.254902, 0, 1, 1,
0.4984682, -1.282853, 2.791569, 0.2588235, 0, 1, 1,
0.4999631, -0.06581719, 1.39598, 0.2666667, 0, 1, 1,
0.5037341, -1.228296, 2.488459, 0.2705882, 0, 1, 1,
0.5075939, 2.43916, -0.3678912, 0.2784314, 0, 1, 1,
0.5088196, 0.5157005, -0.8488743, 0.282353, 0, 1, 1,
0.5125801, 1.671084, 2.224947, 0.2901961, 0, 1, 1,
0.5172544, -1.090171, 2.466228, 0.2941177, 0, 1, 1,
0.519698, 1.652812, 0.4980505, 0.3019608, 0, 1, 1,
0.5202625, -0.602924, 2.290718, 0.3098039, 0, 1, 1,
0.5203133, -0.8352884, 1.873956, 0.3137255, 0, 1, 1,
0.52885, 0.07676142, 0.9586002, 0.3215686, 0, 1, 1,
0.5311869, -0.4548588, 2.040553, 0.3254902, 0, 1, 1,
0.5373784, -1.676109, 3.49704, 0.3333333, 0, 1, 1,
0.5387542, 0.8437528, -0.02395272, 0.3372549, 0, 1, 1,
0.5403824, -0.9124007, 3.354053, 0.345098, 0, 1, 1,
0.5438948, -0.7481409, 2.949127, 0.3490196, 0, 1, 1,
0.5468571, 0.08335141, 1.759345, 0.3568628, 0, 1, 1,
0.5490935, -1.642273, 4.174212, 0.3607843, 0, 1, 1,
0.5519382, 1.580691, 1.058275, 0.3686275, 0, 1, 1,
0.5612726, -1.009928, 2.303174, 0.372549, 0, 1, 1,
0.5620893, -0.3880491, 3.375839, 0.3803922, 0, 1, 1,
0.566627, 0.08789986, 0.6372026, 0.3843137, 0, 1, 1,
0.5695868, 1.391801, 1.0533, 0.3921569, 0, 1, 1,
0.5751155, 1.926365, -0.3164062, 0.3960784, 0, 1, 1,
0.576027, -0.4959628, 1.490759, 0.4039216, 0, 1, 1,
0.5768524, 1.15746, -0.5589099, 0.4117647, 0, 1, 1,
0.5820112, -0.1494158, 3.167449, 0.4156863, 0, 1, 1,
0.5847636, -0.02555145, 2.202495, 0.4235294, 0, 1, 1,
0.5980512, -1.112049, 4.333026, 0.427451, 0, 1, 1,
0.5980843, -0.02118189, -0.6398584, 0.4352941, 0, 1, 1,
0.6001628, 0.6265105, 1.099098, 0.4392157, 0, 1, 1,
0.6045344, -0.5757309, 0.6522668, 0.4470588, 0, 1, 1,
0.6059675, 1.528024, -2.162226, 0.4509804, 0, 1, 1,
0.6092505, -0.03475164, 1.572698, 0.4588235, 0, 1, 1,
0.6093757, 1.267567, 0.02939561, 0.4627451, 0, 1, 1,
0.609474, -0.933103, 1.385753, 0.4705882, 0, 1, 1,
0.611914, -0.6836993, 3.036081, 0.4745098, 0, 1, 1,
0.6123469, 0.7672877, 0.1873509, 0.4823529, 0, 1, 1,
0.6211236, 0.3452446, -0.9348592, 0.4862745, 0, 1, 1,
0.6225496, -0.03248647, 0.3239109, 0.4941176, 0, 1, 1,
0.6331224, -0.7528616, 1.333413, 0.5019608, 0, 1, 1,
0.6332579, -0.4122769, 1.766837, 0.5058824, 0, 1, 1,
0.635347, 1.099517, 1.632694, 0.5137255, 0, 1, 1,
0.6409132, 0.5505249, 0.2753206, 0.5176471, 0, 1, 1,
0.6428995, -0.08482514, 1.240168, 0.5254902, 0, 1, 1,
0.6522247, -1.189831, 2.903671, 0.5294118, 0, 1, 1,
0.6533104, 2.064692, 0.7756069, 0.5372549, 0, 1, 1,
0.6555659, -1.03287, 0.3630045, 0.5411765, 0, 1, 1,
0.6583188, 1.657297, 0.02150495, 0.5490196, 0, 1, 1,
0.6699197, -0.2041626, 1.089552, 0.5529412, 0, 1, 1,
0.6734006, 0.142239, 3.109047, 0.5607843, 0, 1, 1,
0.6736941, -0.1522202, 1.484463, 0.5647059, 0, 1, 1,
0.6771591, 0.1252057, -0.610484, 0.572549, 0, 1, 1,
0.6826887, -0.6163455, 3.210286, 0.5764706, 0, 1, 1,
0.6863481, -0.8709918, 3.307894, 0.5843138, 0, 1, 1,
0.7001663, 1.638762, 0.418744, 0.5882353, 0, 1, 1,
0.7030123, -1.612436, 2.210387, 0.5960785, 0, 1, 1,
0.7119912, -1.003157, 2.248368, 0.6039216, 0, 1, 1,
0.7142121, 1.011032, 1.407722, 0.6078432, 0, 1, 1,
0.7143734, 1.483909, 0.1916317, 0.6156863, 0, 1, 1,
0.721422, -1.627074, 2.679298, 0.6196079, 0, 1, 1,
0.7237359, 0.5345279, 0.6899, 0.627451, 0, 1, 1,
0.724956, 0.2955356, 0.56127, 0.6313726, 0, 1, 1,
0.7297673, 0.2077073, 1.955093, 0.6392157, 0, 1, 1,
0.7315352, -0.7655043, 2.479284, 0.6431373, 0, 1, 1,
0.7327845, 0.3391803, 1.986287, 0.6509804, 0, 1, 1,
0.73578, 0.8267398, 1.230797, 0.654902, 0, 1, 1,
0.7374772, 1.531519, 2.159976, 0.6627451, 0, 1, 1,
0.7418661, 0.3643264, 1.2831, 0.6666667, 0, 1, 1,
0.7436585, 0.5945244, 1.34405, 0.6745098, 0, 1, 1,
0.7455836, 1.208089, 0.6121259, 0.6784314, 0, 1, 1,
0.7504048, -1.406745, 2.898542, 0.6862745, 0, 1, 1,
0.7537116, 0.5721325, 1.397395, 0.6901961, 0, 1, 1,
0.7544761, -0.2409346, 3.053821, 0.6980392, 0, 1, 1,
0.7621795, -1.118929, 3.307064, 0.7058824, 0, 1, 1,
0.7624314, -2.270577, 2.141219, 0.7098039, 0, 1, 1,
0.7635905, -0.3457638, 1.29868, 0.7176471, 0, 1, 1,
0.7710611, 0.07570432, -0.03009816, 0.7215686, 0, 1, 1,
0.7753819, -0.4801566, -0.203947, 0.7294118, 0, 1, 1,
0.7788758, -0.07701483, 1.878281, 0.7333333, 0, 1, 1,
0.7826414, 1.376367, 1.183084, 0.7411765, 0, 1, 1,
0.7852485, -2.475913, 1.890152, 0.7450981, 0, 1, 1,
0.7944384, 0.5098634, 0.7014039, 0.7529412, 0, 1, 1,
0.7962498, 2.02564, -0.556477, 0.7568628, 0, 1, 1,
0.8125218, -0.6652705, 2.327525, 0.7647059, 0, 1, 1,
0.8129801, 0.5238991, 0.8448734, 0.7686275, 0, 1, 1,
0.8244174, 1.654723, -0.8389345, 0.7764706, 0, 1, 1,
0.8267322, -0.485041, 0.9525422, 0.7803922, 0, 1, 1,
0.8288859, -0.4635931, 2.173637, 0.7882353, 0, 1, 1,
0.8300117, 0.1340937, 4.20857, 0.7921569, 0, 1, 1,
0.8307083, -0.4547634, 1.524751, 0.8, 0, 1, 1,
0.8333529, -0.2992904, 2.369663, 0.8078431, 0, 1, 1,
0.8379014, -0.635298, 1.34248, 0.8117647, 0, 1, 1,
0.8424495, -0.1422237, 1.369925, 0.8196079, 0, 1, 1,
0.8494748, 1.405362, 1.939962, 0.8235294, 0, 1, 1,
0.8510656, 1.069755, -0.7729949, 0.8313726, 0, 1, 1,
0.8517559, 1.037996, -0.4884415, 0.8352941, 0, 1, 1,
0.8520297, 1.305488, 0.6848164, 0.8431373, 0, 1, 1,
0.8529626, -1.712652, 4.017439, 0.8470588, 0, 1, 1,
0.8672177, 1.806695, -0.07338603, 0.854902, 0, 1, 1,
0.8714926, 0.13879, 2.293467, 0.8588235, 0, 1, 1,
0.8736938, -1.692058, 3.430619, 0.8666667, 0, 1, 1,
0.8787947, 0.6430839, 0.9545956, 0.8705882, 0, 1, 1,
0.8803101, 0.3243188, 0.5280709, 0.8784314, 0, 1, 1,
0.8819805, -0.2604806, 1.233002, 0.8823529, 0, 1, 1,
0.887301, -0.6275221, 0.7104682, 0.8901961, 0, 1, 1,
0.8890617, -0.2633563, 1.862298, 0.8941177, 0, 1, 1,
0.894016, 0.3104028, 0.5465076, 0.9019608, 0, 1, 1,
0.9024469, -1.447619, 2.733044, 0.9098039, 0, 1, 1,
0.9038, -1.537559, 2.407258, 0.9137255, 0, 1, 1,
0.9105383, 0.5045238, 1.303285, 0.9215686, 0, 1, 1,
0.9109122, -1.213307, 2.433805, 0.9254902, 0, 1, 1,
0.9113503, 0.458504, 1.41397, 0.9333333, 0, 1, 1,
0.9170646, 0.8115957, 1.548104, 0.9372549, 0, 1, 1,
0.9186324, -0.3579576, 0.4498242, 0.945098, 0, 1, 1,
0.9298108, 1.310748, 2.926555, 0.9490196, 0, 1, 1,
0.9370991, -0.08490989, -0.3230969, 0.9568627, 0, 1, 1,
0.9392889, 0.2799036, 2.023489, 0.9607843, 0, 1, 1,
0.9421669, -1.225954, 5.476805, 0.9686275, 0, 1, 1,
0.9434332, -0.9338019, 4.34008, 0.972549, 0, 1, 1,
0.9463201, -0.7996917, 2.43579, 0.9803922, 0, 1, 1,
0.9470024, -0.8443112, 1.596952, 0.9843137, 0, 1, 1,
0.958586, 0.8924751, 1.251893, 0.9921569, 0, 1, 1,
0.9620146, -0.02231691, 2.554506, 0.9960784, 0, 1, 1,
0.9675248, 0.5179315, 1.876983, 1, 0, 0.9960784, 1,
0.9721031, 0.2221318, 2.247751, 1, 0, 0.9882353, 1,
0.9730334, -2.372215, 1.947134, 1, 0, 0.9843137, 1,
0.9784149, -2.108001, 3.699143, 1, 0, 0.9764706, 1,
0.9799837, -0.6997395, 3.908999, 1, 0, 0.972549, 1,
0.9834054, -2.19981, 3.922211, 1, 0, 0.9647059, 1,
0.9849949, -1.721611, 4.002193, 1, 0, 0.9607843, 1,
0.9870771, -0.1017003, 2.57393, 1, 0, 0.9529412, 1,
0.9910852, 1.132838, 1.081549, 1, 0, 0.9490196, 1,
0.9999887, 1.98983, 1.147141, 1, 0, 0.9411765, 1,
1.000525, -1.349309, 3.210427, 1, 0, 0.9372549, 1,
1.001028, -0.3141092, 3.127909, 1, 0, 0.9294118, 1,
1.005843, -1.591763, 2.945399, 1, 0, 0.9254902, 1,
1.009393, -1.439383, 3.94396, 1, 0, 0.9176471, 1,
1.013524, 0.3759788, 1.822815, 1, 0, 0.9137255, 1,
1.015149, 0.7465489, 0.3928175, 1, 0, 0.9058824, 1,
1.021198, -2.222934, 3.16425, 1, 0, 0.9019608, 1,
1.029204, -0.4658202, 0.2195679, 1, 0, 0.8941177, 1,
1.034403, 0.1304935, -0.09708757, 1, 0, 0.8862745, 1,
1.035846, 0.03703277, 1.133554, 1, 0, 0.8823529, 1,
1.036128, -1.654132, 2.45623, 1, 0, 0.8745098, 1,
1.040687, 0.5747928, 2.864286, 1, 0, 0.8705882, 1,
1.041299, 1.103157, 0.9610277, 1, 0, 0.8627451, 1,
1.049909, -1.084849, 1.111624, 1, 0, 0.8588235, 1,
1.05325, 0.928634, 0.4673882, 1, 0, 0.8509804, 1,
1.054024, -1.59347, 2.215961, 1, 0, 0.8470588, 1,
1.069974, 0.3738409, 0.9837857, 1, 0, 0.8392157, 1,
1.07231, -0.4587307, 2.80078, 1, 0, 0.8352941, 1,
1.07724, 0.7803032, 0.1792721, 1, 0, 0.827451, 1,
1.078478, -0.704994, 2.707449, 1, 0, 0.8235294, 1,
1.079, -1.3998, 2.556836, 1, 0, 0.8156863, 1,
1.081367, 1.981686, -0.3488417, 1, 0, 0.8117647, 1,
1.084443, -1.31613, 3.369335, 1, 0, 0.8039216, 1,
1.086075, -0.3264035, 1.738714, 1, 0, 0.7960784, 1,
1.08907, 0.07182761, 2.417699, 1, 0, 0.7921569, 1,
1.097303, -1.585316, 1.564052, 1, 0, 0.7843137, 1,
1.103559, 0.134328, 1.451254, 1, 0, 0.7803922, 1,
1.11081, -0.7006088, 2.849683, 1, 0, 0.772549, 1,
1.124247, -2.610138, 1.507562, 1, 0, 0.7686275, 1,
1.124618, 1.427035, 0.5212089, 1, 0, 0.7607843, 1,
1.128712, -0.5771273, 1.946699, 1, 0, 0.7568628, 1,
1.135101, -0.3256373, 2.276002, 1, 0, 0.7490196, 1,
1.136849, -0.04780749, 2.221928, 1, 0, 0.7450981, 1,
1.143112, 0.7700331, 0.8030663, 1, 0, 0.7372549, 1,
1.148738, 0.7047445, 1.97855, 1, 0, 0.7333333, 1,
1.161364, -2.024098, 3.697764, 1, 0, 0.7254902, 1,
1.161449, 0.5352949, 1.201916, 1, 0, 0.7215686, 1,
1.164693, -1.044098, 2.753027, 1, 0, 0.7137255, 1,
1.171058, 0.554383, 2.409111, 1, 0, 0.7098039, 1,
1.171157, 0.04122822, 2.497262, 1, 0, 0.7019608, 1,
1.1749, 0.2586074, 3.340717, 1, 0, 0.6941177, 1,
1.182474, 0.2085649, 1.253186, 1, 0, 0.6901961, 1,
1.199049, 1.660655, 2.021495, 1, 0, 0.682353, 1,
1.199092, -1.028879, 2.733091, 1, 0, 0.6784314, 1,
1.203566, 0.4608404, 1.547415, 1, 0, 0.6705883, 1,
1.214349, -0.07481286, 0.9871527, 1, 0, 0.6666667, 1,
1.218882, -0.5713913, 3.096744, 1, 0, 0.6588235, 1,
1.223498, 0.8293934, 1.664749, 1, 0, 0.654902, 1,
1.228592, -0.05840504, 1.319643, 1, 0, 0.6470588, 1,
1.2295, -1.036043, 2.694842, 1, 0, 0.6431373, 1,
1.231008, 1.264221, -0.1362467, 1, 0, 0.6352941, 1,
1.23164, -0.8185251, 1.444713, 1, 0, 0.6313726, 1,
1.235331, 0.09102705, 0.8369122, 1, 0, 0.6235294, 1,
1.248889, 0.5374532, 0.853727, 1, 0, 0.6196079, 1,
1.249344, 1.066786, 0.3476057, 1, 0, 0.6117647, 1,
1.25013, 0.01363413, 0.2504151, 1, 0, 0.6078432, 1,
1.268299, 1.485782, -1.283882, 1, 0, 0.6, 1,
1.281581, 1.401335, -0.1117078, 1, 0, 0.5921569, 1,
1.30393, 1.131521, -0.5612342, 1, 0, 0.5882353, 1,
1.313988, 0.06326137, 1.64704, 1, 0, 0.5803922, 1,
1.317174, 0.1374275, 1.29054, 1, 0, 0.5764706, 1,
1.336236, 0.8726833, 1.117022, 1, 0, 0.5686275, 1,
1.346027, 0.5531818, 0.7733405, 1, 0, 0.5647059, 1,
1.348127, -2.443364, 3.092001, 1, 0, 0.5568628, 1,
1.349779, -0.5970046, 1.84388, 1, 0, 0.5529412, 1,
1.350732, -1.050463, 0.8312702, 1, 0, 0.5450981, 1,
1.360872, -0.2883356, 1.161749, 1, 0, 0.5411765, 1,
1.364025, 0.01171565, 2.151018, 1, 0, 0.5333334, 1,
1.375336, 1.715241, 1.568685, 1, 0, 0.5294118, 1,
1.376753, 0.07436018, 1.923335, 1, 0, 0.5215687, 1,
1.396562, 0.2217009, 2.129237, 1, 0, 0.5176471, 1,
1.399758, -0.4662431, 3.187747, 1, 0, 0.509804, 1,
1.400299, 1.25737, -0.5053531, 1, 0, 0.5058824, 1,
1.408937, -0.2970326, 1.077154, 1, 0, 0.4980392, 1,
1.410714, -1.056466, 1.755537, 1, 0, 0.4901961, 1,
1.419676, 0.0917454, 0.7529029, 1, 0, 0.4862745, 1,
1.42259, 0.08803792, 0.6340242, 1, 0, 0.4784314, 1,
1.424656, 0.8177323, 1.562895, 1, 0, 0.4745098, 1,
1.429396, -0.6449974, 3.261184, 1, 0, 0.4666667, 1,
1.45743, 1.188522, 1.080644, 1, 0, 0.4627451, 1,
1.47497, 2.554186, 0.474518, 1, 0, 0.454902, 1,
1.487887, -0.3662819, 0.6032146, 1, 0, 0.4509804, 1,
1.491199, -0.170248, 0.5799512, 1, 0, 0.4431373, 1,
1.506089, -0.8502752, 2.746306, 1, 0, 0.4392157, 1,
1.506958, -1.404469, 2.597922, 1, 0, 0.4313726, 1,
1.509872, -0.6888905, 2.0595, 1, 0, 0.427451, 1,
1.513182, -0.4393581, 1.257091, 1, 0, 0.4196078, 1,
1.523996, 0.5108005, 1.251178, 1, 0, 0.4156863, 1,
1.525497, -0.06506049, 3.52985, 1, 0, 0.4078431, 1,
1.533936, -0.3540151, -0.1323725, 1, 0, 0.4039216, 1,
1.544911, -0.8025025, 3.388944, 1, 0, 0.3960784, 1,
1.559526, -0.2822985, 0.1146834, 1, 0, 0.3882353, 1,
1.561728, -1.449065, 1.840629, 1, 0, 0.3843137, 1,
1.563673, 0.4873895, 1.946509, 1, 0, 0.3764706, 1,
1.56617, -1.966758, 1.553232, 1, 0, 0.372549, 1,
1.571635, 1.159717, -0.3462161, 1, 0, 0.3647059, 1,
1.571839, 0.1008937, 2.059844, 1, 0, 0.3607843, 1,
1.576102, -0.1100924, 1.652238, 1, 0, 0.3529412, 1,
1.582061, -1.057967, 0.674984, 1, 0, 0.3490196, 1,
1.586691, 0.6661158, 1.475703, 1, 0, 0.3411765, 1,
1.594214, -0.1143806, 1.295707, 1, 0, 0.3372549, 1,
1.599577, -0.4748192, 2.072015, 1, 0, 0.3294118, 1,
1.600331, 1.532573, -0.979082, 1, 0, 0.3254902, 1,
1.603698, 0.4091393, 1.853788, 1, 0, 0.3176471, 1,
1.609203, 0.632111, 2.965437, 1, 0, 0.3137255, 1,
1.622443, 1.097593, 1.505031, 1, 0, 0.3058824, 1,
1.623929, -0.6955622, 2.133127, 1, 0, 0.2980392, 1,
1.630922, -1.140346, 2.873238, 1, 0, 0.2941177, 1,
1.633157, -0.235913, 2.196208, 1, 0, 0.2862745, 1,
1.649926, 0.2396296, 2.471204, 1, 0, 0.282353, 1,
1.654115, 0.09207161, 2.565792, 1, 0, 0.2745098, 1,
1.676957, 0.3167854, 3.833633, 1, 0, 0.2705882, 1,
1.688816, -0.1587141, 0.9405863, 1, 0, 0.2627451, 1,
1.698291, 0.2580576, 1.903123, 1, 0, 0.2588235, 1,
1.739257, -0.03398025, 0.6234857, 1, 0, 0.2509804, 1,
1.751191, 1.518568, 0.1910619, 1, 0, 0.2470588, 1,
1.755498, -0.4548157, 1.285122, 1, 0, 0.2392157, 1,
1.760674, -0.7993205, 2.622058, 1, 0, 0.2352941, 1,
1.761329, 0.4654201, 0.8323051, 1, 0, 0.227451, 1,
1.767793, -0.4469183, 1.666244, 1, 0, 0.2235294, 1,
1.781755, -1.574889, 1.260197, 1, 0, 0.2156863, 1,
1.781831, -0.2082024, 2.033631, 1, 0, 0.2117647, 1,
1.790946, 0.7162464, 1.282684, 1, 0, 0.2039216, 1,
1.81143, 0.7107099, 2.123788, 1, 0, 0.1960784, 1,
1.814868, 1.169943, 0.2130416, 1, 0, 0.1921569, 1,
1.820737, -0.289897, 2.980833, 1, 0, 0.1843137, 1,
1.82246, 0.827355, 0.6963913, 1, 0, 0.1803922, 1,
1.835999, -2.192704, 0.374064, 1, 0, 0.172549, 1,
1.847687, -1.605417, 3.058882, 1, 0, 0.1686275, 1,
1.893642, 0.1989888, 0.3780663, 1, 0, 0.1607843, 1,
1.90331, -0.6112238, 2.014502, 1, 0, 0.1568628, 1,
1.907332, 0.4776259, 0.5941575, 1, 0, 0.1490196, 1,
1.911194, -0.07210311, 0.8204311, 1, 0, 0.145098, 1,
1.914734, -0.1531604, 2.936522, 1, 0, 0.1372549, 1,
1.948555, -1.667345, 2.38783, 1, 0, 0.1333333, 1,
1.957406, 1.70322, 0.1925523, 1, 0, 0.1254902, 1,
1.958539, -0.0473687, 2.502496, 1, 0, 0.1215686, 1,
1.978722, -0.5313898, 1.498571, 1, 0, 0.1137255, 1,
2.013031, -0.665651, 1.74655, 1, 0, 0.1098039, 1,
2.023002, -0.7159226, -0.08154751, 1, 0, 0.1019608, 1,
2.026108, 0.1915368, 1.307312, 1, 0, 0.09411765, 1,
2.035275, 2.427098, 2.151323, 1, 0, 0.09019608, 1,
2.063416, 0.8797799, 1.537425, 1, 0, 0.08235294, 1,
2.0659, -0.7828503, 0.8665345, 1, 0, 0.07843138, 1,
2.146509, 1.179455, 1.2468, 1, 0, 0.07058824, 1,
2.168903, -1.60752, 3.215515, 1, 0, 0.06666667, 1,
2.251428, 0.2432233, 0.4063003, 1, 0, 0.05882353, 1,
2.313784, -1.939132, 0.9671921, 1, 0, 0.05490196, 1,
2.373812, -0.4971634, 0.1728651, 1, 0, 0.04705882, 1,
2.389446, -0.2995526, 3.338479, 1, 0, 0.04313726, 1,
2.453298, -0.3690207, -0.542682, 1, 0, 0.03529412, 1,
2.477275, -0.7021176, 0.757845, 1, 0, 0.03137255, 1,
2.621669, -0.4445775, 2.3925, 1, 0, 0.02352941, 1,
2.758061, 1.040923, 1.646899, 1, 0, 0.01960784, 1,
2.789119, 0.8160017, 0.5854177, 1, 0, 0.01176471, 1,
2.918223, 0.243793, 2.125387, 1, 0, 0.007843138, 1
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
-0.09760666, -5.525684, -6.86025, 0, -0.5, 0.5, 0.5,
-0.09760666, -5.525684, -6.86025, 1, -0.5, 0.5, 0.5,
-0.09760666, -5.525684, -6.86025, 1, 1.5, 0.5, 0.5,
-0.09760666, -5.525684, -6.86025, 0, 1.5, 0.5, 0.5
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
-4.135802, -0.3871796, -6.86025, 0, -0.5, 0.5, 0.5,
-4.135802, -0.3871796, -6.86025, 1, -0.5, 0.5, 0.5,
-4.135802, -0.3871796, -6.86025, 1, 1.5, 0.5, 0.5,
-4.135802, -0.3871796, -6.86025, 0, 1.5, 0.5, 0.5
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
-4.135802, -5.525684, 0.2023056, 0, -0.5, 0.5, 0.5,
-4.135802, -5.525684, 0.2023056, 1, -0.5, 0.5, 0.5,
-4.135802, -5.525684, 0.2023056, 1, 1.5, 0.5, 0.5,
-4.135802, -5.525684, 0.2023056, 0, 1.5, 0.5, 0.5
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
-3, -4.339875, -5.230429,
2, -4.339875, -5.230429,
-3, -4.339875, -5.230429,
-3, -4.53751, -5.502066,
-2, -4.339875, -5.230429,
-2, -4.53751, -5.502066,
-1, -4.339875, -5.230429,
-1, -4.53751, -5.502066,
0, -4.339875, -5.230429,
0, -4.53751, -5.502066,
1, -4.339875, -5.230429,
1, -4.53751, -5.502066,
2, -4.339875, -5.230429,
2, -4.53751, -5.502066
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
-3, -4.932779, -6.045339, 0, -0.5, 0.5, 0.5,
-3, -4.932779, -6.045339, 1, -0.5, 0.5, 0.5,
-3, -4.932779, -6.045339, 1, 1.5, 0.5, 0.5,
-3, -4.932779, -6.045339, 0, 1.5, 0.5, 0.5,
-2, -4.932779, -6.045339, 0, -0.5, 0.5, 0.5,
-2, -4.932779, -6.045339, 1, -0.5, 0.5, 0.5,
-2, -4.932779, -6.045339, 1, 1.5, 0.5, 0.5,
-2, -4.932779, -6.045339, 0, 1.5, 0.5, 0.5,
-1, -4.932779, -6.045339, 0, -0.5, 0.5, 0.5,
-1, -4.932779, -6.045339, 1, -0.5, 0.5, 0.5,
-1, -4.932779, -6.045339, 1, 1.5, 0.5, 0.5,
-1, -4.932779, -6.045339, 0, 1.5, 0.5, 0.5,
0, -4.932779, -6.045339, 0, -0.5, 0.5, 0.5,
0, -4.932779, -6.045339, 1, -0.5, 0.5, 0.5,
0, -4.932779, -6.045339, 1, 1.5, 0.5, 0.5,
0, -4.932779, -6.045339, 0, 1.5, 0.5, 0.5,
1, -4.932779, -6.045339, 0, -0.5, 0.5, 0.5,
1, -4.932779, -6.045339, 1, -0.5, 0.5, 0.5,
1, -4.932779, -6.045339, 1, 1.5, 0.5, 0.5,
1, -4.932779, -6.045339, 0, 1.5, 0.5, 0.5,
2, -4.932779, -6.045339, 0, -0.5, 0.5, 0.5,
2, -4.932779, -6.045339, 1, -0.5, 0.5, 0.5,
2, -4.932779, -6.045339, 1, 1.5, 0.5, 0.5,
2, -4.932779, -6.045339, 0, 1.5, 0.5, 0.5
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
-3.203911, -4, -5.230429,
-3.203911, 2, -5.230429,
-3.203911, -4, -5.230429,
-3.359226, -4, -5.502066,
-3.203911, -2, -5.230429,
-3.359226, -2, -5.502066,
-3.203911, 0, -5.230429,
-3.359226, 0, -5.502066,
-3.203911, 2, -5.230429,
-3.359226, 2, -5.502066
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
"-4",
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
-3.669857, -4, -6.045339, 0, -0.5, 0.5, 0.5,
-3.669857, -4, -6.045339, 1, -0.5, 0.5, 0.5,
-3.669857, -4, -6.045339, 1, 1.5, 0.5, 0.5,
-3.669857, -4, -6.045339, 0, 1.5, 0.5, 0.5,
-3.669857, -2, -6.045339, 0, -0.5, 0.5, 0.5,
-3.669857, -2, -6.045339, 1, -0.5, 0.5, 0.5,
-3.669857, -2, -6.045339, 1, 1.5, 0.5, 0.5,
-3.669857, -2, -6.045339, 0, 1.5, 0.5, 0.5,
-3.669857, 0, -6.045339, 0, -0.5, 0.5, 0.5,
-3.669857, 0, -6.045339, 1, -0.5, 0.5, 0.5,
-3.669857, 0, -6.045339, 1, 1.5, 0.5, 0.5,
-3.669857, 0, -6.045339, 0, 1.5, 0.5, 0.5,
-3.669857, 2, -6.045339, 0, -0.5, 0.5, 0.5,
-3.669857, 2, -6.045339, 1, -0.5, 0.5, 0.5,
-3.669857, 2, -6.045339, 1, 1.5, 0.5, 0.5,
-3.669857, 2, -6.045339, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.203911, -4.339875, -4,
-3.203911, -4.339875, 4,
-3.203911, -4.339875, -4,
-3.359226, -4.53751, -4,
-3.203911, -4.339875, -2,
-3.359226, -4.53751, -2,
-3.203911, -4.339875, 0,
-3.359226, -4.53751, 0,
-3.203911, -4.339875, 2,
-3.359226, -4.53751, 2,
-3.203911, -4.339875, 4,
-3.359226, -4.53751, 4
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
-3.669857, -4.932779, -4, 0, -0.5, 0.5, 0.5,
-3.669857, -4.932779, -4, 1, -0.5, 0.5, 0.5,
-3.669857, -4.932779, -4, 1, 1.5, 0.5, 0.5,
-3.669857, -4.932779, -4, 0, 1.5, 0.5, 0.5,
-3.669857, -4.932779, -2, 0, -0.5, 0.5, 0.5,
-3.669857, -4.932779, -2, 1, -0.5, 0.5, 0.5,
-3.669857, -4.932779, -2, 1, 1.5, 0.5, 0.5,
-3.669857, -4.932779, -2, 0, 1.5, 0.5, 0.5,
-3.669857, -4.932779, 0, 0, -0.5, 0.5, 0.5,
-3.669857, -4.932779, 0, 1, -0.5, 0.5, 0.5,
-3.669857, -4.932779, 0, 1, 1.5, 0.5, 0.5,
-3.669857, -4.932779, 0, 0, 1.5, 0.5, 0.5,
-3.669857, -4.932779, 2, 0, -0.5, 0.5, 0.5,
-3.669857, -4.932779, 2, 1, -0.5, 0.5, 0.5,
-3.669857, -4.932779, 2, 1, 1.5, 0.5, 0.5,
-3.669857, -4.932779, 2, 0, 1.5, 0.5, 0.5,
-3.669857, -4.932779, 4, 0, -0.5, 0.5, 0.5,
-3.669857, -4.932779, 4, 1, -0.5, 0.5, 0.5,
-3.669857, -4.932779, 4, 1, 1.5, 0.5, 0.5,
-3.669857, -4.932779, 4, 0, 1.5, 0.5, 0.5
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
-3.203911, -4.339875, -5.230429,
-3.203911, 3.565516, -5.230429,
-3.203911, -4.339875, 5.63504,
-3.203911, 3.565516, 5.63504,
-3.203911, -4.339875, -5.230429,
-3.203911, -4.339875, 5.63504,
-3.203911, 3.565516, -5.230429,
-3.203911, 3.565516, 5.63504,
-3.203911, -4.339875, -5.230429,
3.008698, -4.339875, -5.230429,
-3.203911, -4.339875, 5.63504,
3.008698, -4.339875, 5.63504,
-3.203911, 3.565516, -5.230429,
3.008698, 3.565516, -5.230429,
-3.203911, 3.565516, 5.63504,
3.008698, 3.565516, 5.63504,
3.008698, -4.339875, -5.230429,
3.008698, 3.565516, -5.230429,
3.008698, -4.339875, 5.63504,
3.008698, 3.565516, 5.63504,
3.008698, -4.339875, -5.230429,
3.008698, -4.339875, 5.63504,
3.008698, 3.565516, -5.230429,
3.008698, 3.565516, 5.63504
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
var radius = 7.904899;
var distance = 35.16979;
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
mvMatrix.translate( 0.09760666, 0.3871796, -0.2023056 );
mvMatrix.scale( 1.37574, 1.081152, 0.7866142 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.16979);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
molinate<-read.table("molinate.xyz")
```

```
## Error in read.table("molinate.xyz"): no lines available in input
```

```r
x<-molinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
```

```r
y<-molinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
```

```r
z<-molinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
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
-3.113436, -0.1707073, -1.674371, 0, 0, 1, 1, 1,
-3.076384, -0.6547776, -0.1304, 1, 0, 0, 1, 1,
-2.961014, 1.173451, -2.242302, 1, 0, 0, 1, 1,
-2.911869, 0.9129646, -1.029906, 1, 0, 0, 1, 1,
-2.803361, 0.1125051, -1.207797, 1, 0, 0, 1, 1,
-2.663908, 0.4149458, -0.7335231, 1, 0, 0, 1, 1,
-2.484893, 1.249672, -0.8681371, 0, 0, 0, 1, 1,
-2.461159, -0.7480747, -2.203122, 0, 0, 0, 1, 1,
-2.293572, 0.5482066, -2.285169, 0, 0, 0, 1, 1,
-2.284694, 0.1357681, -0.7452791, 0, 0, 0, 1, 1,
-2.264597, -0.8240693, -0.527911, 0, 0, 0, 1, 1,
-2.225273, 0.3631654, -1.041277, 0, 0, 0, 1, 1,
-2.200697, -0.8583275, -3.357867, 0, 0, 0, 1, 1,
-2.170796, 0.1598188, -1.615879, 1, 1, 1, 1, 1,
-2.16502, 0.6369044, -0.4754157, 1, 1, 1, 1, 1,
-2.157991, 0.9024901, -0.6754407, 1, 1, 1, 1, 1,
-2.150708, -0.7803903, -2.142909, 1, 1, 1, 1, 1,
-2.124964, -0.02885006, -0.5698107, 1, 1, 1, 1, 1,
-2.101874, -1.32913, -1.001246, 1, 1, 1, 1, 1,
-2.060455, -0.1228247, -2.630478, 1, 1, 1, 1, 1,
-2.057699, 0.772924, -0.9351102, 1, 1, 1, 1, 1,
-2.045084, -0.3802206, -0.415606, 1, 1, 1, 1, 1,
-2.03736, -0.417743, -2.737093, 1, 1, 1, 1, 1,
-2.022738, -0.04162753, -1.670481, 1, 1, 1, 1, 1,
-1.990625, -1.28855, -3.358352, 1, 1, 1, 1, 1,
-1.982414, 1.388453, 0.1528111, 1, 1, 1, 1, 1,
-1.963354, 0.5176138, -1.442138, 1, 1, 1, 1, 1,
-1.957557, -1.160816, -3.293414, 1, 1, 1, 1, 1,
-1.953647, -1.555991, -3.606072, 0, 0, 1, 1, 1,
-1.901151, -0.03247441, -0.5235852, 1, 0, 0, 1, 1,
-1.895985, 1.303498, 0.5726366, 1, 0, 0, 1, 1,
-1.890491, 0.2426819, -1.171581, 1, 0, 0, 1, 1,
-1.887064, -0.980799, -1.524123, 1, 0, 0, 1, 1,
-1.871161, -0.0853331, -0.7648839, 1, 0, 0, 1, 1,
-1.85126, -0.9066195, -3.152644, 0, 0, 0, 1, 1,
-1.850354, -0.2563299, -2.827303, 0, 0, 0, 1, 1,
-1.825331, 0.8447173, -0.1269148, 0, 0, 0, 1, 1,
-1.798928, -1.691601, -2.917343, 0, 0, 0, 1, 1,
-1.791602, -0.4332328, -1.993893, 0, 0, 0, 1, 1,
-1.790652, 0.5271419, -0.1728768, 0, 0, 0, 1, 1,
-1.785865, 0.01425534, -1.626524, 0, 0, 0, 1, 1,
-1.777767, 0.4356865, -0.07481853, 1, 1, 1, 1, 1,
-1.720273, -0.01590425, -3.320203, 1, 1, 1, 1, 1,
-1.720001, 1.659312, -1.548531, 1, 1, 1, 1, 1,
-1.700163, -0.2958811, -2.398623, 1, 1, 1, 1, 1,
-1.676047, 0.03340419, -1.558953, 1, 1, 1, 1, 1,
-1.654862, 0.2334145, -1.051346, 1, 1, 1, 1, 1,
-1.652092, -0.245778, 0.05678572, 1, 1, 1, 1, 1,
-1.648219, 0.3181378, -2.956885, 1, 1, 1, 1, 1,
-1.641972, 0.07312249, -0.06435706, 1, 1, 1, 1, 1,
-1.635531, 1.996462, -1.248214, 1, 1, 1, 1, 1,
-1.634095, 1.392277, 0.8331546, 1, 1, 1, 1, 1,
-1.621813, -0.3815694, -1.6612, 1, 1, 1, 1, 1,
-1.59054, -0.656486, -0.8083454, 1, 1, 1, 1, 1,
-1.575667, -0.25334, -2.761362, 1, 1, 1, 1, 1,
-1.574874, 2.443679, 0.5680631, 1, 1, 1, 1, 1,
-1.562123, -0.1275586, -0.8749071, 0, 0, 1, 1, 1,
-1.561805, -0.09131939, -3.490745, 1, 0, 0, 1, 1,
-1.538647, 0.5347191, -2.008009, 1, 0, 0, 1, 1,
-1.529014, 1.26095, -2.269835, 1, 0, 0, 1, 1,
-1.49857, -0.3587865, -0.6279278, 1, 0, 0, 1, 1,
-1.491056, -0.6869513, -2.347525, 1, 0, 0, 1, 1,
-1.486748, 0.1731205, -0.9837503, 0, 0, 0, 1, 1,
-1.472077, 1.856889, 0.225233, 0, 0, 0, 1, 1,
-1.46985, 0.3184838, -2.339641, 0, 0, 0, 1, 1,
-1.468489, -0.6061448, -0.8249103, 0, 0, 0, 1, 1,
-1.45996, -1.922776, -1.360757, 0, 0, 0, 1, 1,
-1.456432, -0.5870858, -2.078814, 0, 0, 0, 1, 1,
-1.456398, -0.2831038, -1.974027, 0, 0, 0, 1, 1,
-1.448855, 0.8892874, -1.174459, 1, 1, 1, 1, 1,
-1.443329, -4.224748, -3.122653, 1, 1, 1, 1, 1,
-1.437896, 0.669548, 0.222629, 1, 1, 1, 1, 1,
-1.436919, -0.686541, -3.063298, 1, 1, 1, 1, 1,
-1.427553, 1.525759, 0.1459833, 1, 1, 1, 1, 1,
-1.416376, -0.3463627, -1.839545, 1, 1, 1, 1, 1,
-1.406247, 0.1248487, -1.706882, 1, 1, 1, 1, 1,
-1.402918, -0.5736172, -2.888532, 1, 1, 1, 1, 1,
-1.400434, 0.1490526, -1.251493, 1, 1, 1, 1, 1,
-1.400111, -0.5617118, -0.832378, 1, 1, 1, 1, 1,
-1.399755, 3.450389, -0.2600344, 1, 1, 1, 1, 1,
-1.369638, 0.02332671, -0.6387233, 1, 1, 1, 1, 1,
-1.366887, -1.095894, -1.458862, 1, 1, 1, 1, 1,
-1.350269, -1.175047, -1.063445, 1, 1, 1, 1, 1,
-1.344058, 1.399457, 0.6139004, 1, 1, 1, 1, 1,
-1.305017, -0.7736277, -2.411081, 0, 0, 1, 1, 1,
-1.304667, 1.20567, -1.220083, 1, 0, 0, 1, 1,
-1.303369, -0.1367625, -2.052275, 1, 0, 0, 1, 1,
-1.301437, -0.1992448, -0.3300417, 1, 0, 0, 1, 1,
-1.301064, -0.5508499, -0.7073631, 1, 0, 0, 1, 1,
-1.293038, -1.035467, -1.091436, 1, 0, 0, 1, 1,
-1.29004, 1.775909, 0.6676364, 0, 0, 0, 1, 1,
-1.288808, -0.6580864, -2.924498, 0, 0, 0, 1, 1,
-1.285512, -0.007404954, -2.269738, 0, 0, 0, 1, 1,
-1.278913, -0.4224277, -2.8141, 0, 0, 0, 1, 1,
-1.277371, -0.3428173, -3.08341, 0, 0, 0, 1, 1,
-1.274171, 2.946283, 0.5568034, 0, 0, 0, 1, 1,
-1.273339, -1.306777, -2.573835, 0, 0, 0, 1, 1,
-1.269947, 0.1965186, -1.085784, 1, 1, 1, 1, 1,
-1.264473, -1.691549, -2.627069, 1, 1, 1, 1, 1,
-1.260182, -0.6095525, -1.864835, 1, 1, 1, 1, 1,
-1.252928, -2.319102, -4.612885, 1, 1, 1, 1, 1,
-1.249957, -1.620846, -3.780148, 1, 1, 1, 1, 1,
-1.239325, -0.002355954, -1.244197, 1, 1, 1, 1, 1,
-1.22867, -0.09047383, -1.063791, 1, 1, 1, 1, 1,
-1.220871, 0.701427, -0.4389903, 1, 1, 1, 1, 1,
-1.218671, -0.505011, -2.512144, 1, 1, 1, 1, 1,
-1.217061, -0.09132396, -3.812088, 1, 1, 1, 1, 1,
-1.212698, -0.8655554, -2.400746, 1, 1, 1, 1, 1,
-1.212438, -0.2286612, -0.8082981, 1, 1, 1, 1, 1,
-1.207487, -1.357101, -2.526176, 1, 1, 1, 1, 1,
-1.206118, -0.4346035, -2.030228, 1, 1, 1, 1, 1,
-1.204099, -3.930869, -3.180554, 1, 1, 1, 1, 1,
-1.198723, -0.09812898, -0.5301606, 0, 0, 1, 1, 1,
-1.1941, 0.6541719, 1.017335, 1, 0, 0, 1, 1,
-1.193695, 0.8043063, -1.658466, 1, 0, 0, 1, 1,
-1.191403, -1.582346, -2.928959, 1, 0, 0, 1, 1,
-1.189412, -1.570653, -2.371009, 1, 0, 0, 1, 1,
-1.188887, -0.5598522, -1.629639, 1, 0, 0, 1, 1,
-1.1757, 0.1450524, -0.3462554, 0, 0, 0, 1, 1,
-1.166677, -0.4276566, -0.7735797, 0, 0, 0, 1, 1,
-1.163994, 2.088694, -0.8017888, 0, 0, 0, 1, 1,
-1.158303, -0.9807626, -3.699097, 0, 0, 0, 1, 1,
-1.156401, 0.6503744, 0.03404187, 0, 0, 0, 1, 1,
-1.146037, 0.1285987, -1.487845, 0, 0, 0, 1, 1,
-1.143106, -0.651768, -1.607173, 0, 0, 0, 1, 1,
-1.142688, -2.708598, -4.022279, 1, 1, 1, 1, 1,
-1.130313, -0.4835761, -1.878481, 1, 1, 1, 1, 1,
-1.128133, -2.490356, -3.335829, 1, 1, 1, 1, 1,
-1.124257, -0.4051739, -3.55421, 1, 1, 1, 1, 1,
-1.123404, 1.740936, 0.8577788, 1, 1, 1, 1, 1,
-1.121576, -0.07753658, -0.9651946, 1, 1, 1, 1, 1,
-1.1195, 0.369152, -2.332376, 1, 1, 1, 1, 1,
-1.118235, 0.4621606, -1.586112, 1, 1, 1, 1, 1,
-1.116862, -1.53817, -3.35423, 1, 1, 1, 1, 1,
-1.116849, 0.9445514, -0.4688606, 1, 1, 1, 1, 1,
-1.114512, 1.348854, -0.3945948, 1, 1, 1, 1, 1,
-1.112784, 0.9432963, -0.6560852, 1, 1, 1, 1, 1,
-1.111872, -0.03681283, -1.592684, 1, 1, 1, 1, 1,
-1.104951, -0.05385979, -2.15667, 1, 1, 1, 1, 1,
-1.102837, 0.04721398, 0.5027789, 1, 1, 1, 1, 1,
-1.099162, 0.5658822, 1.446089, 0, 0, 1, 1, 1,
-1.097878, 1.063267, 0.1597358, 1, 0, 0, 1, 1,
-1.09607, -0.7776142, -2.608967, 1, 0, 0, 1, 1,
-1.094396, 0.4744233, -1.484088, 1, 0, 0, 1, 1,
-1.087816, -1.169417, -0.3490126, 1, 0, 0, 1, 1,
-1.079984, -0.9659436, -1.402511, 1, 0, 0, 1, 1,
-1.079262, -1.045532, -2.931209, 0, 0, 0, 1, 1,
-1.072247, 1.807221, -1.536564, 0, 0, 0, 1, 1,
-1.071236, -0.5437118, -0.8713142, 0, 0, 0, 1, 1,
-1.069876, -0.385019, -1.487699, 0, 0, 0, 1, 1,
-1.069486, 0.9382828, -0.8748141, 0, 0, 0, 1, 1,
-1.059996, 1.339542, -1.154466, 0, 0, 0, 1, 1,
-1.053641, 2.842795, 0.06091108, 0, 0, 0, 1, 1,
-1.049669, -1.164961, -4.341165, 1, 1, 1, 1, 1,
-1.048952, -1.393049, -3.791852, 1, 1, 1, 1, 1,
-1.045419, -0.429783, -2.051764, 1, 1, 1, 1, 1,
-1.038393, -0.1741912, -2.711368, 1, 1, 1, 1, 1,
-1.038165, 1.606269, -1.45591, 1, 1, 1, 1, 1,
-1.036449, 0.9117107, -0.877947, 1, 1, 1, 1, 1,
-1.035669, -0.1674912, -0.5564719, 1, 1, 1, 1, 1,
-1.032176, 0.6520268, -2.49647, 1, 1, 1, 1, 1,
-1.030941, -1.136786, -2.792987, 1, 1, 1, 1, 1,
-1.027138, -0.2244063, -2.216573, 1, 1, 1, 1, 1,
-1.025956, 0.6478975, -1.072686, 1, 1, 1, 1, 1,
-1.025801, 0.212576, 0.3474456, 1, 1, 1, 1, 1,
-1.018324, -1.245479, 0.3153505, 1, 1, 1, 1, 1,
-1.0116, 1.53406, -0.8114154, 1, 1, 1, 1, 1,
-1.002711, 1.702648, -0.8476586, 1, 1, 1, 1, 1,
-0.9937176, -1.559429, -2.634168, 0, 0, 1, 1, 1,
-0.9921005, 0.1539588, -1.64017, 1, 0, 0, 1, 1,
-0.9896846, -0.006631936, -0.4073072, 1, 0, 0, 1, 1,
-0.9893975, -0.1187156, -1.374843, 1, 0, 0, 1, 1,
-0.9863176, 0.8348265, -0.4665121, 1, 0, 0, 1, 1,
-0.9857354, 0.5322756, -1.675428, 1, 0, 0, 1, 1,
-0.9855504, 0.3558459, -0.908103, 0, 0, 0, 1, 1,
-0.981451, 0.4903755, 0.7900598, 0, 0, 0, 1, 1,
-0.9786462, 0.8701381, -1.19216, 0, 0, 0, 1, 1,
-0.9785457, -0.7800952, -1.921884, 0, 0, 0, 1, 1,
-0.9749286, 0.7322981, -1.836298, 0, 0, 0, 1, 1,
-0.9738049, -0.2352187, -2.456666, 0, 0, 0, 1, 1,
-0.9727532, -0.1663571, -3.351843, 0, 0, 0, 1, 1,
-0.9693142, -1.072788, -2.978917, 1, 1, 1, 1, 1,
-0.9671766, 0.2461911, 0.7237102, 1, 1, 1, 1, 1,
-0.9592129, -0.485754, -2.089852, 1, 1, 1, 1, 1,
-0.9442309, 0.2625762, -1.108896, 1, 1, 1, 1, 1,
-0.9417356, 1.673271, -1.44919, 1, 1, 1, 1, 1,
-0.9366595, -1.925483, -3.308775, 1, 1, 1, 1, 1,
-0.9337162, -1.059199, -2.387283, 1, 1, 1, 1, 1,
-0.9321877, 1.017368, 0.5768327, 1, 1, 1, 1, 1,
-0.9293478, -0.1637266, -2.121336, 1, 1, 1, 1, 1,
-0.9257013, -0.7640676, -3.504044, 1, 1, 1, 1, 1,
-0.9157383, 1.086553, 0.2946841, 1, 1, 1, 1, 1,
-0.9134799, 0.02621107, -0.5897821, 1, 1, 1, 1, 1,
-0.9123064, -2.606076, -1.6517, 1, 1, 1, 1, 1,
-0.9107466, -0.2985558, -2.525219, 1, 1, 1, 1, 1,
-0.9063178, 0.4602199, -0.3313858, 1, 1, 1, 1, 1,
-0.9020517, 0.821402, -4.237038, 0, 0, 1, 1, 1,
-0.8941777, 0.6186754, -0.761764, 1, 0, 0, 1, 1,
-0.8932343, -0.8881928, -3.083651, 1, 0, 0, 1, 1,
-0.8932104, 0.5937769, -1.189924, 1, 0, 0, 1, 1,
-0.8859426, -0.1323778, -0.2501307, 1, 0, 0, 1, 1,
-0.8843336, -0.42705, -1.117071, 1, 0, 0, 1, 1,
-0.8779048, -0.05232656, -2.086174, 0, 0, 0, 1, 1,
-0.8775005, -1.6018, -2.081878, 0, 0, 0, 1, 1,
-0.8702363, 1.108288, -0.9713375, 0, 0, 0, 1, 1,
-0.8679891, -0.03581556, -0.8595231, 0, 0, 0, 1, 1,
-0.8669221, 0.4687472, 0.3423311, 0, 0, 0, 1, 1,
-0.8635098, -0.1320531, -1.746183, 0, 0, 0, 1, 1,
-0.8600973, -0.06929031, -1.037969, 0, 0, 0, 1, 1,
-0.8580863, 1.170193, 0.3360122, 1, 1, 1, 1, 1,
-0.8495442, -1.268558, -3.500069, 1, 1, 1, 1, 1,
-0.8494746, -1.15125, -2.858048, 1, 1, 1, 1, 1,
-0.8490179, 1.814959, 0.06788334, 1, 1, 1, 1, 1,
-0.845145, 0.4779063, -1.295797, 1, 1, 1, 1, 1,
-0.8402572, 0.1736685, -1.567881, 1, 1, 1, 1, 1,
-0.8388958, -1.282658, -3.271802, 1, 1, 1, 1, 1,
-0.8354277, 1.077681, -0.1246113, 1, 1, 1, 1, 1,
-0.8290809, 0.3290901, -1.213084, 1, 1, 1, 1, 1,
-0.828673, 0.4068279, -0.8983243, 1, 1, 1, 1, 1,
-0.8277236, 0.6147667, -1.73069, 1, 1, 1, 1, 1,
-0.8109236, 0.08357123, 0.2632573, 1, 1, 1, 1, 1,
-0.806405, -0.02418987, -3.026199, 1, 1, 1, 1, 1,
-0.804117, -1.016825, -2.404546, 1, 1, 1, 1, 1,
-0.8029386, -0.7508064, -3.04554, 1, 1, 1, 1, 1,
-0.8000623, -0.4452415, -3.305429, 0, 0, 1, 1, 1,
-0.7976279, -0.7446421, -2.055079, 1, 0, 0, 1, 1,
-0.792949, 0.5376071, -1.999552, 1, 0, 0, 1, 1,
-0.7898625, 1.0539, 0.8838359, 1, 0, 0, 1, 1,
-0.7856629, 0.7986491, -2.830441, 1, 0, 0, 1, 1,
-0.7810261, 1.043704, -1.366574, 1, 0, 0, 1, 1,
-0.7753744, 1.080773, -0.2138582, 0, 0, 0, 1, 1,
-0.7725677, 0.6626284, 0.2867854, 0, 0, 0, 1, 1,
-0.7624246, -1.008315, -2.999673, 0, 0, 0, 1, 1,
-0.7606493, 1.224547, -0.5167153, 0, 0, 0, 1, 1,
-0.7530096, 1.118951, -1.687591, 0, 0, 0, 1, 1,
-0.7489073, 0.4041751, -1.867763, 0, 0, 0, 1, 1,
-0.7457856, 0.1574683, -2.434674, 0, 0, 0, 1, 1,
-0.745042, 1.342903, -1.369297, 1, 1, 1, 1, 1,
-0.7422976, 0.2255313, -0.7243797, 1, 1, 1, 1, 1,
-0.7387127, 1.293294, -1.399289, 1, 1, 1, 1, 1,
-0.7228591, 0.04593159, -1.859276, 1, 1, 1, 1, 1,
-0.7219024, 0.6845345, -1.0908, 1, 1, 1, 1, 1,
-0.7179361, -0.1822712, -2.034905, 1, 1, 1, 1, 1,
-0.7133769, -1.904509, -0.8379922, 1, 1, 1, 1, 1,
-0.7132196, -0.2048442, -0.766676, 1, 1, 1, 1, 1,
-0.7118325, 1.54407, 0.4011222, 1, 1, 1, 1, 1,
-0.7073438, -0.3918455, -1.544238, 1, 1, 1, 1, 1,
-0.7052118, -0.3389091, -1.411081, 1, 1, 1, 1, 1,
-0.7042885, -1.446996, -4.889193, 1, 1, 1, 1, 1,
-0.7002999, -0.4250785, -0.5528678, 1, 1, 1, 1, 1,
-0.6966035, -2.059984, -2.683208, 1, 1, 1, 1, 1,
-0.6951614, 1.03852, 0.1756223, 1, 1, 1, 1, 1,
-0.6911988, 1.13009, -2.076603, 0, 0, 1, 1, 1,
-0.6900541, 0.03468857, -3.299769, 1, 0, 0, 1, 1,
-0.6838121, -0.01249692, -2.310234, 1, 0, 0, 1, 1,
-0.6832054, -0.4161434, -1.274542, 1, 0, 0, 1, 1,
-0.6799309, -0.3333978, -2.776521, 1, 0, 0, 1, 1,
-0.6792819, 1.958405, -0.4055597, 1, 0, 0, 1, 1,
-0.6792727, -1.842751, -2.85245, 0, 0, 0, 1, 1,
-0.6784411, 0.6902189, -2.226901, 0, 0, 0, 1, 1,
-0.6784014, -0.3920065, -2.844145, 0, 0, 0, 1, 1,
-0.6781268, -1.38771, -2.192632, 0, 0, 0, 1, 1,
-0.674657, -0.6627437, -3.904084, 0, 0, 0, 1, 1,
-0.6731641, 0.7144795, -0.5417965, 0, 0, 0, 1, 1,
-0.6617059, -0.172415, -1.570791, 0, 0, 0, 1, 1,
-0.6574759, -2.280706, -2.909621, 1, 1, 1, 1, 1,
-0.6558287, -1.000947, -3.12133, 1, 1, 1, 1, 1,
-0.6547906, -0.00610911, -1.399907, 1, 1, 1, 1, 1,
-0.652469, -0.2536378, -2.299783, 1, 1, 1, 1, 1,
-0.6517833, 0.5906848, 0.1150378, 1, 1, 1, 1, 1,
-0.6504279, -1.858736, -3.035158, 1, 1, 1, 1, 1,
-0.649014, 0.1514669, -0.08733729, 1, 1, 1, 1, 1,
-0.6481835, 0.7646849, -1.30093, 1, 1, 1, 1, 1,
-0.6419257, 0.3331675, -2.098112, 1, 1, 1, 1, 1,
-0.6390482, -1.486248, -2.040925, 1, 1, 1, 1, 1,
-0.6371967, 0.3166787, -1.395085, 1, 1, 1, 1, 1,
-0.6368955, 1.042641, 0.1743527, 1, 1, 1, 1, 1,
-0.6323497, 1.052145, 0.5721046, 1, 1, 1, 1, 1,
-0.6269132, 1.503632, -0.2236289, 1, 1, 1, 1, 1,
-0.6234731, -0.6616046, -2.338368, 1, 1, 1, 1, 1,
-0.622848, -2.075978, -1.686677, 0, 0, 1, 1, 1,
-0.6218011, -2.31023, -2.660804, 1, 0, 0, 1, 1,
-0.6183625, 1.630363, 0.2170641, 1, 0, 0, 1, 1,
-0.6170413, -0.5103086, -1.247301, 1, 0, 0, 1, 1,
-0.6150531, 1.287255, 0.05884852, 1, 0, 0, 1, 1,
-0.6132433, 0.8417083, 1.799042, 1, 0, 0, 1, 1,
-0.6043236, 0.06729526, -1.894023, 0, 0, 0, 1, 1,
-0.6010313, 0.5439838, -1.414922, 0, 0, 0, 1, 1,
-0.5986583, 0.2901411, 0.3842897, 0, 0, 0, 1, 1,
-0.5935481, 0.4780422, -0.6175764, 0, 0, 0, 1, 1,
-0.5904047, -1.997517, -3.038931, 0, 0, 0, 1, 1,
-0.5897816, -1.146135, -2.11482, 0, 0, 0, 1, 1,
-0.5867791, -1.015393, -2.611587, 0, 0, 0, 1, 1,
-0.5823226, -0.6019715, -0.9606591, 1, 1, 1, 1, 1,
-0.5794561, 0.02266831, -0.6189731, 1, 1, 1, 1, 1,
-0.5789433, 0.1345775, -0.9175326, 1, 1, 1, 1, 1,
-0.5781687, 1.292329, -1.381241, 1, 1, 1, 1, 1,
-0.5761163, -0.04935003, -3.207791, 1, 1, 1, 1, 1,
-0.5754157, 0.04082114, 0.01800643, 1, 1, 1, 1, 1,
-0.5746014, -0.6233741, -0.9281833, 1, 1, 1, 1, 1,
-0.5731849, 0.2109805, 0.6012639, 1, 1, 1, 1, 1,
-0.5728621, 0.222195, -0.1751693, 1, 1, 1, 1, 1,
-0.5722436, -0.2915926, -2.320994, 1, 1, 1, 1, 1,
-0.5693319, 1.741959, 1.726018, 1, 1, 1, 1, 1,
-0.5609683, -0.4986072, -3.860092, 1, 1, 1, 1, 1,
-0.5608572, -0.8096905, -1.148386, 1, 1, 1, 1, 1,
-0.5601958, -0.6215904, -1.863512, 1, 1, 1, 1, 1,
-0.5574763, -1.62041, -2.07462, 1, 1, 1, 1, 1,
-0.5534895, -0.723797, -2.928915, 0, 0, 1, 1, 1,
-0.5525265, 1.294736, 0.003991717, 1, 0, 0, 1, 1,
-0.5462628, 0.5353721, -1.914845, 1, 0, 0, 1, 1,
-0.5420456, 1.92229, -0.06245044, 1, 0, 0, 1, 1,
-0.5305455, -1.582557, -1.991568, 1, 0, 0, 1, 1,
-0.5294455, 0.1236224, -2.68895, 1, 0, 0, 1, 1,
-0.5287548, 0.623643, -0.8499101, 0, 0, 0, 1, 1,
-0.5271395, 1.639918, 1.422538, 0, 0, 0, 1, 1,
-0.527067, 1.821337, 2.207856, 0, 0, 0, 1, 1,
-0.5266678, -0.02663732, -3.392885, 0, 0, 0, 1, 1,
-0.5251234, -1.764657, -2.05021, 0, 0, 0, 1, 1,
-0.5236388, -0.530176, -0.4595009, 0, 0, 0, 1, 1,
-0.5229816, 0.1862156, 0.6237886, 0, 0, 0, 1, 1,
-0.5213763, 0.4443889, 0.3041751, 1, 1, 1, 1, 1,
-0.5178306, -0.7054794, -3.340184, 1, 1, 1, 1, 1,
-0.5161555, -1.688361, -1.852664, 1, 1, 1, 1, 1,
-0.5150859, -0.4683184, -0.2402836, 1, 1, 1, 1, 1,
-0.5142468, 0.2344947, -0.2900708, 1, 1, 1, 1, 1,
-0.5135459, 2.088613, -1.592856, 1, 1, 1, 1, 1,
-0.51096, -0.6965693, -2.077178, 1, 1, 1, 1, 1,
-0.5096647, -0.1597541, -1.058096, 1, 1, 1, 1, 1,
-0.5043641, 1.138248, -0.2417543, 1, 1, 1, 1, 1,
-0.5019058, -0.8309782, -3.848881, 1, 1, 1, 1, 1,
-0.5011214, 1.4315, 1.159083, 1, 1, 1, 1, 1,
-0.4988759, 0.7896832, -1.895837, 1, 1, 1, 1, 1,
-0.4962073, 1.56938, 0.404743, 1, 1, 1, 1, 1,
-0.4936976, -0.3882982, -1.018329, 1, 1, 1, 1, 1,
-0.4926464, -0.1415119, -3.809186, 1, 1, 1, 1, 1,
-0.4918308, -2.491763, -3.702452, 0, 0, 1, 1, 1,
-0.4886719, -0.1737322, -3.612892, 1, 0, 0, 1, 1,
-0.4872675, 0.8741352, -0.7465425, 1, 0, 0, 1, 1,
-0.486076, 2.242578, 0.3655582, 1, 0, 0, 1, 1,
-0.4836293, -0.03274058, -0.3535515, 1, 0, 0, 1, 1,
-0.4812509, 0.04999023, -0.2170987, 1, 0, 0, 1, 1,
-0.4789436, -2.169128, -2.006206, 0, 0, 0, 1, 1,
-0.4764762, -0.05507624, -0.2135208, 0, 0, 0, 1, 1,
-0.4760305, 0.5477236, -0.5819286, 0, 0, 0, 1, 1,
-0.4747481, -0.7446222, -3.741751, 0, 0, 0, 1, 1,
-0.4713731, -1.119624, -3.170755, 0, 0, 0, 1, 1,
-0.4529726, 0.6643488, -0.9690821, 0, 0, 0, 1, 1,
-0.4514489, 0.7922229, -0.1627837, 0, 0, 0, 1, 1,
-0.4506931, -0.4641965, -3.333924, 1, 1, 1, 1, 1,
-0.4496899, 0.2547573, -0.8015431, 1, 1, 1, 1, 1,
-0.4421495, -1.382674, -2.025235, 1, 1, 1, 1, 1,
-0.4319473, -1.099505, -2.829946, 1, 1, 1, 1, 1,
-0.4307429, 0.2448661, -1.170218, 1, 1, 1, 1, 1,
-0.4298157, -0.06511756, -0.7856589, 1, 1, 1, 1, 1,
-0.4274472, 0.1726595, -1.150267, 1, 1, 1, 1, 1,
-0.4199729, 0.7000509, -0.7971193, 1, 1, 1, 1, 1,
-0.4185537, 0.5632168, -1.821768, 1, 1, 1, 1, 1,
-0.4160973, 1.083206, 0.1755478, 1, 1, 1, 1, 1,
-0.411602, 0.4792295, -1.17161, 1, 1, 1, 1, 1,
-0.4102761, -0.3687735, -1.607413, 1, 1, 1, 1, 1,
-0.4083995, 0.8108756, -1.896105, 1, 1, 1, 1, 1,
-0.4078505, -1.147633, -0.5341339, 1, 1, 1, 1, 1,
-0.4073355, 0.5242186, -0.2713111, 1, 1, 1, 1, 1,
-0.403977, -2.170498, -2.09043, 0, 0, 1, 1, 1,
-0.3974696, 0.8029499, -1.346942, 1, 0, 0, 1, 1,
-0.3868662, -0.7394648, -2.935319, 1, 0, 0, 1, 1,
-0.3859014, 0.4578182, 0.06414317, 1, 0, 0, 1, 1,
-0.3819652, 0.08175341, -3.005835, 1, 0, 0, 1, 1,
-0.3781098, -1.182073, -2.92839, 1, 0, 0, 1, 1,
-0.3745576, -0.4734604, -1.848708, 0, 0, 0, 1, 1,
-0.3743746, -0.5890103, -2.974778, 0, 0, 0, 1, 1,
-0.3738598, -0.1037658, -2.547241, 0, 0, 0, 1, 1,
-0.3695078, 0.07189795, -1.012948, 0, 0, 0, 1, 1,
-0.3650801, -1.023563, -2.40626, 0, 0, 0, 1, 1,
-0.36255, 1.172854, 1.15363, 0, 0, 0, 1, 1,
-0.353952, -0.0586058, -3.102289, 0, 0, 0, 1, 1,
-0.3494193, 1.236415, -2.299314, 1, 1, 1, 1, 1,
-0.3474274, -0.6922383, -1.194239, 1, 1, 1, 1, 1,
-0.3470825, 1.514748, 0.3342151, 1, 1, 1, 1, 1,
-0.3457381, -0.03806527, -0.1513936, 1, 1, 1, 1, 1,
-0.3419911, 1.746119, -0.107513, 1, 1, 1, 1, 1,
-0.338725, -0.3642375, -1.764986, 1, 1, 1, 1, 1,
-0.3355878, 1.349367, -1.63052, 1, 1, 1, 1, 1,
-0.3341947, -0.8490834, -4.339554, 1, 1, 1, 1, 1,
-0.3267273, -1.638984, -3.518672, 1, 1, 1, 1, 1,
-0.3266571, -0.2893731, -1.702387, 1, 1, 1, 1, 1,
-0.3247099, -0.2497735, -1.651478, 1, 1, 1, 1, 1,
-0.3234611, 1.303978, 0.01806251, 1, 1, 1, 1, 1,
-0.3136173, 0.3060598, -0.4811771, 1, 1, 1, 1, 1,
-0.3134412, 0.4296086, 0.8126972, 1, 1, 1, 1, 1,
-0.3125693, -0.1810135, -2.499143, 1, 1, 1, 1, 1,
-0.3096243, -0.1618138, -4.507463, 0, 0, 1, 1, 1,
-0.3069848, 0.9072837, 0.3478614, 1, 0, 0, 1, 1,
-0.3069583, 0.7836516, -0.9675328, 1, 0, 0, 1, 1,
-0.3046732, 0.3974779, 0.271146, 1, 0, 0, 1, 1,
-0.300542, 0.09886369, -1.915313, 1, 0, 0, 1, 1,
-0.2987558, 2.285714, -0.3913578, 1, 0, 0, 1, 1,
-0.2966422, 1.724029, 1.031949, 0, 0, 0, 1, 1,
-0.2942391, -1.126169, -3.755684, 0, 0, 0, 1, 1,
-0.2932104, -0.006449509, 0.2588177, 0, 0, 0, 1, 1,
-0.2926475, -0.1743126, -1.425558, 0, 0, 0, 1, 1,
-0.2917645, 0.1760478, -0.8498122, 0, 0, 0, 1, 1,
-0.289944, 0.915368, -1.060575, 0, 0, 0, 1, 1,
-0.281135, -0.1600357, -0.9724421, 0, 0, 0, 1, 1,
-0.2796794, 0.6764766, 0.5374291, 1, 1, 1, 1, 1,
-0.2786503, -0.0001114411, -1.079406, 1, 1, 1, 1, 1,
-0.2772744, 1.429985, -0.3956227, 1, 1, 1, 1, 1,
-0.277177, 0.01823614, -2.098063, 1, 1, 1, 1, 1,
-0.2756539, 0.2654506, 0.9063152, 1, 1, 1, 1, 1,
-0.2742056, -0.08267643, -1.973428, 1, 1, 1, 1, 1,
-0.2741329, -0.8794665, -4.418025, 1, 1, 1, 1, 1,
-0.2690966, 0.5967497, -0.9460329, 1, 1, 1, 1, 1,
-0.2669295, -0.04788533, -1.548769, 1, 1, 1, 1, 1,
-0.2640826, -0.2200573, -1.948807, 1, 1, 1, 1, 1,
-0.2564669, 0.3573502, -0.9572461, 1, 1, 1, 1, 1,
-0.2494908, 0.7355641, -0.2197237, 1, 1, 1, 1, 1,
-0.2490228, -1.355084, -1.831307, 1, 1, 1, 1, 1,
-0.2480529, -1.676768, -0.3413352, 1, 1, 1, 1, 1,
-0.2475279, -0.5616695, -2.369739, 1, 1, 1, 1, 1,
-0.2472768, -0.6757608, -5.072194, 0, 0, 1, 1, 1,
-0.246759, -1.489309, -3.254954, 1, 0, 0, 1, 1,
-0.2407401, 1.382988, -1.201268, 1, 0, 0, 1, 1,
-0.2401317, -2.467989, -2.278573, 1, 0, 0, 1, 1,
-0.2387013, -1.397761, -2.852151, 1, 0, 0, 1, 1,
-0.2371757, -0.9394773, -2.206321, 1, 0, 0, 1, 1,
-0.2326105, 0.9707869, -0.4460928, 0, 0, 0, 1, 1,
-0.2316679, -0.3675684, -1.36335, 0, 0, 0, 1, 1,
-0.2312032, 0.1161262, -0.7276802, 0, 0, 0, 1, 1,
-0.2295258, -2.179312, -3.867057, 0, 0, 0, 1, 1,
-0.2282462, 0.5107427, 0.411699, 0, 0, 0, 1, 1,
-0.2255344, -0.7610788, -2.69759, 0, 0, 0, 1, 1,
-0.2197943, -1.31445, -3.436376, 0, 0, 0, 1, 1,
-0.21869, -1.384871, -2.897017, 1, 1, 1, 1, 1,
-0.213383, -0.8869827, -3.969288, 1, 1, 1, 1, 1,
-0.2112043, -1.262129, -3.716698, 1, 1, 1, 1, 1,
-0.210676, 0.2162493, -0.8368478, 1, 1, 1, 1, 1,
-0.2100607, -1.419067, -2.208897, 1, 1, 1, 1, 1,
-0.2059845, 0.6002067, -0.3161173, 1, 1, 1, 1, 1,
-0.2044363, -0.04023282, -1.261129, 1, 1, 1, 1, 1,
-0.2040053, 1.59425, 0.4602498, 1, 1, 1, 1, 1,
-0.2023413, -0.2452868, -1.73001, 1, 1, 1, 1, 1,
-0.195527, -0.1752995, -3.070115, 1, 1, 1, 1, 1,
-0.1937635, 0.9685186, 0.2953449, 1, 1, 1, 1, 1,
-0.1936782, -0.6879233, -3.707569, 1, 1, 1, 1, 1,
-0.1930436, 0.09659992, -0.2934492, 1, 1, 1, 1, 1,
-0.1827126, 0.4972455, -1.170997, 1, 1, 1, 1, 1,
-0.1814236, 0.7610348, 1.123481, 1, 1, 1, 1, 1,
-0.1793565, -1.133428, -2.823468, 0, 0, 1, 1, 1,
-0.177311, 1.327455, -0.06219234, 1, 0, 0, 1, 1,
-0.176384, 1.376631, 0.5152364, 1, 0, 0, 1, 1,
-0.1725376, 0.1613343, -0.554933, 1, 0, 0, 1, 1,
-0.1725164, 0.1886305, -1.609663, 1, 0, 0, 1, 1,
-0.1721676, 1.010702, -1.309299, 1, 0, 0, 1, 1,
-0.1718722, -0.3604619, -2.914232, 0, 0, 0, 1, 1,
-0.1676139, 0.5989791, 0.4143477, 0, 0, 0, 1, 1,
-0.166892, -1.623496, -4.737479, 0, 0, 0, 1, 1,
-0.1667454, -0.6665454, -3.57816, 0, 0, 0, 1, 1,
-0.1636785, 1.471711, -2.185962, 0, 0, 0, 1, 1,
-0.1629353, 0.8831635, 0.3415697, 0, 0, 0, 1, 1,
-0.1622281, 1.189763, -0.4627914, 0, 0, 0, 1, 1,
-0.1600453, -0.7306066, -1.042179, 1, 1, 1, 1, 1,
-0.159794, -0.9470307, -2.664744, 1, 1, 1, 1, 1,
-0.1578396, -0.1796528, -2.470813, 1, 1, 1, 1, 1,
-0.1550211, 0.4500542, 0.1552486, 1, 1, 1, 1, 1,
-0.1537947, -0.507759, -2.411821, 1, 1, 1, 1, 1,
-0.1524255, -1.605079, -3.568245, 1, 1, 1, 1, 1,
-0.1506206, -0.6801797, -3.371958, 1, 1, 1, 1, 1,
-0.149453, 0.9813036, 0.3764958, 1, 1, 1, 1, 1,
-0.14942, 0.6405028, -0.2063943, 1, 1, 1, 1, 1,
-0.1452419, 0.8901743, 0.02247465, 1, 1, 1, 1, 1,
-0.1409765, -1.015166, -2.682885, 1, 1, 1, 1, 1,
-0.1376158, 0.4586951, 0.01603908, 1, 1, 1, 1, 1,
-0.1372428, -0.5404075, -2.706528, 1, 1, 1, 1, 1,
-0.1365412, -0.6201672, -1.671157, 1, 1, 1, 1, 1,
-0.1339968, -1.111108, -3.129065, 1, 1, 1, 1, 1,
-0.1278643, -0.8201255, -2.859723, 0, 0, 1, 1, 1,
-0.1257121, -1.205795, -2.137312, 1, 0, 0, 1, 1,
-0.1241792, -1.093459, -3.395092, 1, 0, 0, 1, 1,
-0.1206708, -0.01896348, -1.472806, 1, 0, 0, 1, 1,
-0.1200931, -0.3961173, -3.04741, 1, 0, 0, 1, 1,
-0.1141703, 0.3954084, 0.2560817, 1, 0, 0, 1, 1,
-0.1111012, 0.4339156, 0.08315217, 0, 0, 0, 1, 1,
-0.1095575, 2.54423, 0.3558274, 0, 0, 0, 1, 1,
-0.1083628, -0.5630497, -3.581041, 0, 0, 0, 1, 1,
-0.1068426, 0.4592189, 0.7338275, 0, 0, 0, 1, 1,
-0.1055368, 1.109785, -2.156805, 0, 0, 0, 1, 1,
-0.1043218, 0.3764973, -1.189111, 0, 0, 0, 1, 1,
-0.1014778, -0.1303516, -3.273797, 0, 0, 0, 1, 1,
-0.1006256, -3.041853, -3.398239, 1, 1, 1, 1, 1,
-0.09881178, -0.5326627, -3.188229, 1, 1, 1, 1, 1,
-0.09321743, 0.09544942, -1.439343, 1, 1, 1, 1, 1,
-0.09083366, 0.8476466, 0.2414844, 1, 1, 1, 1, 1,
-0.09016068, -0.5732251, -2.147994, 1, 1, 1, 1, 1,
-0.0885729, -0.1916688, -2.670058, 1, 1, 1, 1, 1,
-0.08434089, 1.658673, -0.1493409, 1, 1, 1, 1, 1,
-0.08423632, 0.7203608, -0.009650041, 1, 1, 1, 1, 1,
-0.08082093, 2.108659, -2.211956, 1, 1, 1, 1, 1,
-0.07969636, 0.1162032, -1.933435, 1, 1, 1, 1, 1,
-0.07751009, -0.1004748, -2.800594, 1, 1, 1, 1, 1,
-0.07489993, 0.06384297, -1.211228, 1, 1, 1, 1, 1,
-0.07029037, 2.458298, -0.05782005, 1, 1, 1, 1, 1,
-0.0697986, 0.9377193, 0.269839, 1, 1, 1, 1, 1,
-0.06943361, 0.7149782, -0.3984337, 1, 1, 1, 1, 1,
-0.06889712, -0.03014289, -1.526134, 0, 0, 1, 1, 1,
-0.06805903, 1.605332, -0.2441826, 1, 0, 0, 1, 1,
-0.06391474, -1.26807, -4.124316, 1, 0, 0, 1, 1,
-0.06223445, 1.248328, 0.8557831, 1, 0, 0, 1, 1,
-0.06175771, -0.7913942, -2.675251, 1, 0, 0, 1, 1,
-0.06111985, 0.9831041, -1.036898, 1, 0, 0, 1, 1,
-0.06005397, 0.3426635, -0.7920338, 0, 0, 0, 1, 1,
-0.05495422, 2.636336, 1.824993, 0, 0, 0, 1, 1,
-0.05317326, 1.08138, -2.026963, 0, 0, 0, 1, 1,
-0.04958351, 0.7402636, -1.389323, 0, 0, 0, 1, 1,
-0.04896268, -0.1720498, -1.64063, 0, 0, 0, 1, 1,
-0.04827918, -1.373733, -1.956708, 0, 0, 0, 1, 1,
-0.04633483, -0.250382, -2.875795, 0, 0, 0, 1, 1,
-0.04062101, 1.357063, -1.007307, 1, 1, 1, 1, 1,
-0.03420058, -0.2013417, -4.133885, 1, 1, 1, 1, 1,
-0.03410742, -0.1215182, -2.017465, 1, 1, 1, 1, 1,
-0.02786321, -0.08303706, -3.246487, 1, 1, 1, 1, 1,
-0.02607708, 1.220851, -0.8178207, 1, 1, 1, 1, 1,
-0.02357072, -0.4129121, -3.322454, 1, 1, 1, 1, 1,
-0.02314318, -0.02688978, -2.386992, 1, 1, 1, 1, 1,
-0.01630183, -1.055308, -2.895462, 1, 1, 1, 1, 1,
-0.01262666, 0.3664435, -1.24715, 1, 1, 1, 1, 1,
-0.01098833, -0.3927801, -0.5442457, 1, 1, 1, 1, 1,
-0.01059493, -2.10257, -2.385627, 1, 1, 1, 1, 1,
0.002460082, -2.108134, 3.166293, 1, 1, 1, 1, 1,
0.002725488, -0.5245177, 4.637246, 1, 1, 1, 1, 1,
0.005338075, 1.587311, -0.33342, 1, 1, 1, 1, 1,
0.007771975, -0.245194, 2.998706, 1, 1, 1, 1, 1,
0.009906494, 0.5025948, 0.9380329, 0, 0, 1, 1, 1,
0.02369058, -0.4465172, 3.299864, 1, 0, 0, 1, 1,
0.02787587, 1.670554, -0.4073394, 1, 0, 0, 1, 1,
0.03024718, 1.432886, -0.04037687, 1, 0, 0, 1, 1,
0.03270195, -1.21032, 4.002259, 1, 0, 0, 1, 1,
0.03499303, 1.158754, 2.578691, 1, 0, 0, 1, 1,
0.03737102, -0.5403963, 0.0104621, 0, 0, 0, 1, 1,
0.03778699, 0.6380253, -0.3073966, 0, 0, 0, 1, 1,
0.04446941, 1.314661, 0.5204647, 0, 0, 0, 1, 1,
0.0491223, 0.6970099, 1.777925, 0, 0, 0, 1, 1,
0.0499462, 1.631714, 0.1432248, 0, 0, 0, 1, 1,
0.05136404, -0.8543508, 2.185172, 0, 0, 0, 1, 1,
0.0526938, 1.937915, 0.4837447, 0, 0, 0, 1, 1,
0.05342351, -0.7751925, 3.893469, 1, 1, 1, 1, 1,
0.05604058, -0.921075, 2.681381, 1, 1, 1, 1, 1,
0.05864075, 0.06353832, -0.8795447, 1, 1, 1, 1, 1,
0.0593357, 0.116268, -1.160613, 1, 1, 1, 1, 1,
0.06134844, -0.3134815, 4.352933, 1, 1, 1, 1, 1,
0.06141469, 0.5864034, -0.3439362, 1, 1, 1, 1, 1,
0.06315927, 0.1740522, 1.464511, 1, 1, 1, 1, 1,
0.06758134, 0.4495938, 0.5599384, 1, 1, 1, 1, 1,
0.06832833, -0.3604423, 1.842453, 1, 1, 1, 1, 1,
0.07069048, -1.23094, 2.514377, 1, 1, 1, 1, 1,
0.08368295, -1.250632, 3.11257, 1, 1, 1, 1, 1,
0.08912873, -1.376556, 2.345088, 1, 1, 1, 1, 1,
0.09398168, 0.1857009, 0.3508096, 1, 1, 1, 1, 1,
0.09413135, 0.413819, 0.9580249, 1, 1, 1, 1, 1,
0.09421358, -0.267453, 3.544022, 1, 1, 1, 1, 1,
0.09506217, -2.014802, 5.361567, 0, 0, 1, 1, 1,
0.09967139, -0.2108763, 1.716406, 1, 0, 0, 1, 1,
0.1048191, -1.676124, 4.440519, 1, 0, 0, 1, 1,
0.105516, 1.487397, 0.702396, 1, 0, 0, 1, 1,
0.1083532, 0.8296324, 0.4568842, 1, 0, 0, 1, 1,
0.111314, -0.8194083, 2.877424, 1, 0, 0, 1, 1,
0.1146628, -2.048514, 4.233576, 0, 0, 0, 1, 1,
0.1152202, 0.5646054, -0.4956928, 0, 0, 0, 1, 1,
0.1216465, 0.2722443, 0.8403765, 0, 0, 0, 1, 1,
0.1271254, 0.08149479, 1.468453, 0, 0, 0, 1, 1,
0.1275102, -0.9803157, 2.681208, 0, 0, 0, 1, 1,
0.1336077, 0.7663863, -0.8352275, 0, 0, 0, 1, 1,
0.1342505, 1.68942, 0.3480831, 0, 0, 0, 1, 1,
0.1356981, -0.0001024849, 1.290476, 1, 1, 1, 1, 1,
0.1372948, 0.4393675, 0.005653805, 1, 1, 1, 1, 1,
0.141438, -1.061688, 3.930396, 1, 1, 1, 1, 1,
0.1444918, 0.1449504, 1.103082, 1, 1, 1, 1, 1,
0.1512109, -0.6791754, 2.719346, 1, 1, 1, 1, 1,
0.1526463, -0.6736319, 2.886169, 1, 1, 1, 1, 1,
0.1568549, -1.350249, 3.741917, 1, 1, 1, 1, 1,
0.1570264, 0.164395, 0.9202985, 1, 1, 1, 1, 1,
0.1573981, -0.6671442, 1.06345, 1, 1, 1, 1, 1,
0.1581754, 0.203879, -0.8863761, 1, 1, 1, 1, 1,
0.1651499, 0.1909073, 0.615894, 1, 1, 1, 1, 1,
0.1715904, -0.0794426, 2.234044, 1, 1, 1, 1, 1,
0.1735022, -0.6183723, 2.770969, 1, 1, 1, 1, 1,
0.1738982, -0.772409, 3.116971, 1, 1, 1, 1, 1,
0.1742002, 0.9157404, 1.091363, 1, 1, 1, 1, 1,
0.1749243, -0.3386247, 2.366, 0, 0, 1, 1, 1,
0.1812825, 1.206912, -0.9458828, 1, 0, 0, 1, 1,
0.1859894, -1.373459, 2.076864, 1, 0, 0, 1, 1,
0.1923755, -1.808381, 3.53633, 1, 0, 0, 1, 1,
0.1936053, 0.6892937, -0.6914207, 1, 0, 0, 1, 1,
0.1992201, -2.239241, 3.267356, 1, 0, 0, 1, 1,
0.2016241, 1.055863, 1.6561, 0, 0, 0, 1, 1,
0.2016473, 1.294008, 1.199972, 0, 0, 0, 1, 1,
0.2017892, 1.848333, 0.6357197, 0, 0, 0, 1, 1,
0.2020497, -0.5026524, 3.206043, 0, 0, 0, 1, 1,
0.2076757, 1.102684, 2.57831, 0, 0, 0, 1, 1,
0.2079273, -0.9541316, 2.101638, 0, 0, 0, 1, 1,
0.2083198, 1.724129, 0.02654643, 0, 0, 0, 1, 1,
0.2116658, 2.983357, 0.2987153, 1, 1, 1, 1, 1,
0.2117606, 1.511827, -1.177247, 1, 1, 1, 1, 1,
0.2177405, -0.4614533, 2.509591, 1, 1, 1, 1, 1,
0.2189576, 0.2093204, 0.1116409, 1, 1, 1, 1, 1,
0.2210395, -1.059861, 3.381298, 1, 1, 1, 1, 1,
0.2221426, -1.133898, 2.355516, 1, 1, 1, 1, 1,
0.2237426, -0.1055753, 1.946189, 1, 1, 1, 1, 1,
0.2271657, -0.6911744, 1.85916, 1, 1, 1, 1, 1,
0.2355307, 0.1500083, -0.3942649, 1, 1, 1, 1, 1,
0.2362539, -1.788452, 3.226021, 1, 1, 1, 1, 1,
0.2384786, 0.5844279, 0.6194268, 1, 1, 1, 1, 1,
0.240113, 0.5156757, 0.06473421, 1, 1, 1, 1, 1,
0.2441472, -1.240933, 3.232354, 1, 1, 1, 1, 1,
0.2472549, 0.04994245, 0.5884433, 1, 1, 1, 1, 1,
0.2480412, -1.206576, 2.286697, 1, 1, 1, 1, 1,
0.2574038, -1.582406, 2.266334, 0, 0, 1, 1, 1,
0.2584563, -0.6986182, 2.473256, 1, 0, 0, 1, 1,
0.2597052, -0.4009558, 3.814563, 1, 0, 0, 1, 1,
0.2631875, 0.9724959, -1.208195, 1, 0, 0, 1, 1,
0.2645315, 0.1145161, 1.75275, 1, 0, 0, 1, 1,
0.2686682, 1.346219, 1.294598, 1, 0, 0, 1, 1,
0.2691728, -0.06890561, 1.75186, 0, 0, 0, 1, 1,
0.2701857, 0.2279302, 1.167679, 0, 0, 0, 1, 1,
0.2721181, -0.6191776, 1.181129, 0, 0, 0, 1, 1,
0.2733093, -0.7899779, 2.508908, 0, 0, 0, 1, 1,
0.2759445, 0.5396662, 0.7275885, 0, 0, 0, 1, 1,
0.2794008, 0.9766719, 0.565458, 0, 0, 0, 1, 1,
0.283898, -1.272819, 4.247717, 0, 0, 0, 1, 1,
0.285391, -0.6866421, 3.734534, 1, 1, 1, 1, 1,
0.285433, -1.34917, 3.772214, 1, 1, 1, 1, 1,
0.2908255, 0.5544341, -0.00247705, 1, 1, 1, 1, 1,
0.2910301, 0.4463207, 2.256939, 1, 1, 1, 1, 1,
0.2918049, 1.15877, -0.8627719, 1, 1, 1, 1, 1,
0.2919665, -0.474235, 1.89975, 1, 1, 1, 1, 1,
0.2932521, 1.298181, -0.5923278, 1, 1, 1, 1, 1,
0.2935608, 0.1956155, 0.9655036, 1, 1, 1, 1, 1,
0.2944194, 1.457605, 1.37239, 1, 1, 1, 1, 1,
0.2945896, 0.0543832, 2.852911, 1, 1, 1, 1, 1,
0.2972347, 0.9432053, 0.8635522, 1, 1, 1, 1, 1,
0.3020733, -0.2065854, 4.234909, 1, 1, 1, 1, 1,
0.3032174, 0.4082872, 1.816992, 1, 1, 1, 1, 1,
0.3077398, -0.5409982, 3.431379, 1, 1, 1, 1, 1,
0.3090473, -0.3963723, 1.215405, 1, 1, 1, 1, 1,
0.3115438, 0.9196898, 0.7490413, 0, 0, 1, 1, 1,
0.3116116, 0.273536, -0.727801, 1, 0, 0, 1, 1,
0.3126039, 0.268242, 2.448785, 1, 0, 0, 1, 1,
0.3136739, -0.1257823, 0.9381692, 1, 0, 0, 1, 1,
0.3244277, -0.6289964, 2.858958, 1, 0, 0, 1, 1,
0.3276952, -1.144629, 4.625432, 1, 0, 0, 1, 1,
0.3287398, -1.132713, 1.941467, 0, 0, 0, 1, 1,
0.3318036, -0.8420224, 1.523739, 0, 0, 0, 1, 1,
0.337029, -0.9236533, 2.417629, 0, 0, 0, 1, 1,
0.3429275, 2.554538, 0.4380518, 0, 0, 0, 1, 1,
0.3431098, -0.08998962, 2.887485, 0, 0, 0, 1, 1,
0.3437628, -1.163723, 1.640282, 0, 0, 0, 1, 1,
0.3437772, 1.974164, 0.2556935, 0, 0, 0, 1, 1,
0.3480895, -0.4733896, 2.218047, 1, 1, 1, 1, 1,
0.3489458, 0.916839, 0.3503712, 1, 1, 1, 1, 1,
0.358486, -0.9918112, 1.199076, 1, 1, 1, 1, 1,
0.3625562, 0.515336, 0.2996821, 1, 1, 1, 1, 1,
0.365613, -0.2635937, 2.392377, 1, 1, 1, 1, 1,
0.3662904, 0.423922, -0.1156151, 1, 1, 1, 1, 1,
0.3669942, -0.1823667, 0.7808762, 1, 1, 1, 1, 1,
0.3688291, -1.149707, 3.137161, 1, 1, 1, 1, 1,
0.3693552, -1.108506, 4.470086, 1, 1, 1, 1, 1,
0.3794786, 0.7989796, 1.982723, 1, 1, 1, 1, 1,
0.3806599, 0.5730304, -1.231243, 1, 1, 1, 1, 1,
0.3808763, 1.333927, 0.1364876, 1, 1, 1, 1, 1,
0.3820197, -0.3370796, 1.304448, 1, 1, 1, 1, 1,
0.3842074, -0.860547, 5.412331, 1, 1, 1, 1, 1,
0.3857597, 1.922821, -0.04776261, 1, 1, 1, 1, 1,
0.3867424, 0.8947399, -2.405016, 0, 0, 1, 1, 1,
0.3888335, -1.046216, 2.129126, 1, 0, 0, 1, 1,
0.3904921, -0.2581265, 0.7674013, 1, 0, 0, 1, 1,
0.397286, -0.03226233, 3.235455, 1, 0, 0, 1, 1,
0.3975643, -1.211683, 2.512782, 1, 0, 0, 1, 1,
0.3992593, -1.34337, 2.410723, 1, 0, 0, 1, 1,
0.4013584, 1.321543, -0.2568058, 0, 0, 0, 1, 1,
0.4026815, 0.9051964, 0.1375779, 0, 0, 0, 1, 1,
0.4029048, -0.961195, 3.789939, 0, 0, 0, 1, 1,
0.4104862, -0.01671026, 2.957527, 0, 0, 0, 1, 1,
0.4107656, -1.552327, 2.691609, 0, 0, 0, 1, 1,
0.4111006, 0.861495, 1.331313, 0, 0, 0, 1, 1,
0.4123915, -0.8253726, 3.918042, 0, 0, 0, 1, 1,
0.4137462, 1.443566, 0.8160564, 1, 1, 1, 1, 1,
0.415405, 1.375786, 0.1158943, 1, 1, 1, 1, 1,
0.4222883, 1.875456, -0.548905, 1, 1, 1, 1, 1,
0.4224045, 0.2563758, 0.6253464, 1, 1, 1, 1, 1,
0.4231399, 0.5293873, -0.4650732, 1, 1, 1, 1, 1,
0.4256855, -0.05105847, 1.36629, 1, 1, 1, 1, 1,
0.4344859, 0.7592786, 0.2176119, 1, 1, 1, 1, 1,
0.4371471, -0.1108936, 2.063371, 1, 1, 1, 1, 1,
0.4371946, -0.8243334, 1.379435, 1, 1, 1, 1, 1,
0.4379691, 1.606714, -0.2323992, 1, 1, 1, 1, 1,
0.4418972, -0.06416834, 2.392595, 1, 1, 1, 1, 1,
0.4436235, -0.6128099, 1.086811, 1, 1, 1, 1, 1,
0.4453207, 0.6668665, 1.363932, 1, 1, 1, 1, 1,
0.4465241, 0.7773263, -0.3563953, 1, 1, 1, 1, 1,
0.446741, 1.032672, -0.009669219, 1, 1, 1, 1, 1,
0.4517221, 0.2641231, -0.7042534, 0, 0, 1, 1, 1,
0.4608001, -1.163707, 2.228121, 1, 0, 0, 1, 1,
0.4611231, 0.9784652, 0.5168907, 1, 0, 0, 1, 1,
0.4638937, 0.1297167, 2.379329, 1, 0, 0, 1, 1,
0.4656281, -1.593768, 2.204841, 1, 0, 0, 1, 1,
0.4786464, 0.6878707, 0.08701009, 1, 0, 0, 1, 1,
0.4799335, 0.2245655, 1.075589, 0, 0, 0, 1, 1,
0.4816004, 0.3705136, -0.008181312, 0, 0, 0, 1, 1,
0.4938457, 0.7157024, -0.705155, 0, 0, 0, 1, 1,
0.4951297, -0.0789427, 2.065184, 0, 0, 0, 1, 1,
0.4984682, -1.282853, 2.791569, 0, 0, 0, 1, 1,
0.4999631, -0.06581719, 1.39598, 0, 0, 0, 1, 1,
0.5037341, -1.228296, 2.488459, 0, 0, 0, 1, 1,
0.5075939, 2.43916, -0.3678912, 1, 1, 1, 1, 1,
0.5088196, 0.5157005, -0.8488743, 1, 1, 1, 1, 1,
0.5125801, 1.671084, 2.224947, 1, 1, 1, 1, 1,
0.5172544, -1.090171, 2.466228, 1, 1, 1, 1, 1,
0.519698, 1.652812, 0.4980505, 1, 1, 1, 1, 1,
0.5202625, -0.602924, 2.290718, 1, 1, 1, 1, 1,
0.5203133, -0.8352884, 1.873956, 1, 1, 1, 1, 1,
0.52885, 0.07676142, 0.9586002, 1, 1, 1, 1, 1,
0.5311869, -0.4548588, 2.040553, 1, 1, 1, 1, 1,
0.5373784, -1.676109, 3.49704, 1, 1, 1, 1, 1,
0.5387542, 0.8437528, -0.02395272, 1, 1, 1, 1, 1,
0.5403824, -0.9124007, 3.354053, 1, 1, 1, 1, 1,
0.5438948, -0.7481409, 2.949127, 1, 1, 1, 1, 1,
0.5468571, 0.08335141, 1.759345, 1, 1, 1, 1, 1,
0.5490935, -1.642273, 4.174212, 1, 1, 1, 1, 1,
0.5519382, 1.580691, 1.058275, 0, 0, 1, 1, 1,
0.5612726, -1.009928, 2.303174, 1, 0, 0, 1, 1,
0.5620893, -0.3880491, 3.375839, 1, 0, 0, 1, 1,
0.566627, 0.08789986, 0.6372026, 1, 0, 0, 1, 1,
0.5695868, 1.391801, 1.0533, 1, 0, 0, 1, 1,
0.5751155, 1.926365, -0.3164062, 1, 0, 0, 1, 1,
0.576027, -0.4959628, 1.490759, 0, 0, 0, 1, 1,
0.5768524, 1.15746, -0.5589099, 0, 0, 0, 1, 1,
0.5820112, -0.1494158, 3.167449, 0, 0, 0, 1, 1,
0.5847636, -0.02555145, 2.202495, 0, 0, 0, 1, 1,
0.5980512, -1.112049, 4.333026, 0, 0, 0, 1, 1,
0.5980843, -0.02118189, -0.6398584, 0, 0, 0, 1, 1,
0.6001628, 0.6265105, 1.099098, 0, 0, 0, 1, 1,
0.6045344, -0.5757309, 0.6522668, 1, 1, 1, 1, 1,
0.6059675, 1.528024, -2.162226, 1, 1, 1, 1, 1,
0.6092505, -0.03475164, 1.572698, 1, 1, 1, 1, 1,
0.6093757, 1.267567, 0.02939561, 1, 1, 1, 1, 1,
0.609474, -0.933103, 1.385753, 1, 1, 1, 1, 1,
0.611914, -0.6836993, 3.036081, 1, 1, 1, 1, 1,
0.6123469, 0.7672877, 0.1873509, 1, 1, 1, 1, 1,
0.6211236, 0.3452446, -0.9348592, 1, 1, 1, 1, 1,
0.6225496, -0.03248647, 0.3239109, 1, 1, 1, 1, 1,
0.6331224, -0.7528616, 1.333413, 1, 1, 1, 1, 1,
0.6332579, -0.4122769, 1.766837, 1, 1, 1, 1, 1,
0.635347, 1.099517, 1.632694, 1, 1, 1, 1, 1,
0.6409132, 0.5505249, 0.2753206, 1, 1, 1, 1, 1,
0.6428995, -0.08482514, 1.240168, 1, 1, 1, 1, 1,
0.6522247, -1.189831, 2.903671, 1, 1, 1, 1, 1,
0.6533104, 2.064692, 0.7756069, 0, 0, 1, 1, 1,
0.6555659, -1.03287, 0.3630045, 1, 0, 0, 1, 1,
0.6583188, 1.657297, 0.02150495, 1, 0, 0, 1, 1,
0.6699197, -0.2041626, 1.089552, 1, 0, 0, 1, 1,
0.6734006, 0.142239, 3.109047, 1, 0, 0, 1, 1,
0.6736941, -0.1522202, 1.484463, 1, 0, 0, 1, 1,
0.6771591, 0.1252057, -0.610484, 0, 0, 0, 1, 1,
0.6826887, -0.6163455, 3.210286, 0, 0, 0, 1, 1,
0.6863481, -0.8709918, 3.307894, 0, 0, 0, 1, 1,
0.7001663, 1.638762, 0.418744, 0, 0, 0, 1, 1,
0.7030123, -1.612436, 2.210387, 0, 0, 0, 1, 1,
0.7119912, -1.003157, 2.248368, 0, 0, 0, 1, 1,
0.7142121, 1.011032, 1.407722, 0, 0, 0, 1, 1,
0.7143734, 1.483909, 0.1916317, 1, 1, 1, 1, 1,
0.721422, -1.627074, 2.679298, 1, 1, 1, 1, 1,
0.7237359, 0.5345279, 0.6899, 1, 1, 1, 1, 1,
0.724956, 0.2955356, 0.56127, 1, 1, 1, 1, 1,
0.7297673, 0.2077073, 1.955093, 1, 1, 1, 1, 1,
0.7315352, -0.7655043, 2.479284, 1, 1, 1, 1, 1,
0.7327845, 0.3391803, 1.986287, 1, 1, 1, 1, 1,
0.73578, 0.8267398, 1.230797, 1, 1, 1, 1, 1,
0.7374772, 1.531519, 2.159976, 1, 1, 1, 1, 1,
0.7418661, 0.3643264, 1.2831, 1, 1, 1, 1, 1,
0.7436585, 0.5945244, 1.34405, 1, 1, 1, 1, 1,
0.7455836, 1.208089, 0.6121259, 1, 1, 1, 1, 1,
0.7504048, -1.406745, 2.898542, 1, 1, 1, 1, 1,
0.7537116, 0.5721325, 1.397395, 1, 1, 1, 1, 1,
0.7544761, -0.2409346, 3.053821, 1, 1, 1, 1, 1,
0.7621795, -1.118929, 3.307064, 0, 0, 1, 1, 1,
0.7624314, -2.270577, 2.141219, 1, 0, 0, 1, 1,
0.7635905, -0.3457638, 1.29868, 1, 0, 0, 1, 1,
0.7710611, 0.07570432, -0.03009816, 1, 0, 0, 1, 1,
0.7753819, -0.4801566, -0.203947, 1, 0, 0, 1, 1,
0.7788758, -0.07701483, 1.878281, 1, 0, 0, 1, 1,
0.7826414, 1.376367, 1.183084, 0, 0, 0, 1, 1,
0.7852485, -2.475913, 1.890152, 0, 0, 0, 1, 1,
0.7944384, 0.5098634, 0.7014039, 0, 0, 0, 1, 1,
0.7962498, 2.02564, -0.556477, 0, 0, 0, 1, 1,
0.8125218, -0.6652705, 2.327525, 0, 0, 0, 1, 1,
0.8129801, 0.5238991, 0.8448734, 0, 0, 0, 1, 1,
0.8244174, 1.654723, -0.8389345, 0, 0, 0, 1, 1,
0.8267322, -0.485041, 0.9525422, 1, 1, 1, 1, 1,
0.8288859, -0.4635931, 2.173637, 1, 1, 1, 1, 1,
0.8300117, 0.1340937, 4.20857, 1, 1, 1, 1, 1,
0.8307083, -0.4547634, 1.524751, 1, 1, 1, 1, 1,
0.8333529, -0.2992904, 2.369663, 1, 1, 1, 1, 1,
0.8379014, -0.635298, 1.34248, 1, 1, 1, 1, 1,
0.8424495, -0.1422237, 1.369925, 1, 1, 1, 1, 1,
0.8494748, 1.405362, 1.939962, 1, 1, 1, 1, 1,
0.8510656, 1.069755, -0.7729949, 1, 1, 1, 1, 1,
0.8517559, 1.037996, -0.4884415, 1, 1, 1, 1, 1,
0.8520297, 1.305488, 0.6848164, 1, 1, 1, 1, 1,
0.8529626, -1.712652, 4.017439, 1, 1, 1, 1, 1,
0.8672177, 1.806695, -0.07338603, 1, 1, 1, 1, 1,
0.8714926, 0.13879, 2.293467, 1, 1, 1, 1, 1,
0.8736938, -1.692058, 3.430619, 1, 1, 1, 1, 1,
0.8787947, 0.6430839, 0.9545956, 0, 0, 1, 1, 1,
0.8803101, 0.3243188, 0.5280709, 1, 0, 0, 1, 1,
0.8819805, -0.2604806, 1.233002, 1, 0, 0, 1, 1,
0.887301, -0.6275221, 0.7104682, 1, 0, 0, 1, 1,
0.8890617, -0.2633563, 1.862298, 1, 0, 0, 1, 1,
0.894016, 0.3104028, 0.5465076, 1, 0, 0, 1, 1,
0.9024469, -1.447619, 2.733044, 0, 0, 0, 1, 1,
0.9038, -1.537559, 2.407258, 0, 0, 0, 1, 1,
0.9105383, 0.5045238, 1.303285, 0, 0, 0, 1, 1,
0.9109122, -1.213307, 2.433805, 0, 0, 0, 1, 1,
0.9113503, 0.458504, 1.41397, 0, 0, 0, 1, 1,
0.9170646, 0.8115957, 1.548104, 0, 0, 0, 1, 1,
0.9186324, -0.3579576, 0.4498242, 0, 0, 0, 1, 1,
0.9298108, 1.310748, 2.926555, 1, 1, 1, 1, 1,
0.9370991, -0.08490989, -0.3230969, 1, 1, 1, 1, 1,
0.9392889, 0.2799036, 2.023489, 1, 1, 1, 1, 1,
0.9421669, -1.225954, 5.476805, 1, 1, 1, 1, 1,
0.9434332, -0.9338019, 4.34008, 1, 1, 1, 1, 1,
0.9463201, -0.7996917, 2.43579, 1, 1, 1, 1, 1,
0.9470024, -0.8443112, 1.596952, 1, 1, 1, 1, 1,
0.958586, 0.8924751, 1.251893, 1, 1, 1, 1, 1,
0.9620146, -0.02231691, 2.554506, 1, 1, 1, 1, 1,
0.9675248, 0.5179315, 1.876983, 1, 1, 1, 1, 1,
0.9721031, 0.2221318, 2.247751, 1, 1, 1, 1, 1,
0.9730334, -2.372215, 1.947134, 1, 1, 1, 1, 1,
0.9784149, -2.108001, 3.699143, 1, 1, 1, 1, 1,
0.9799837, -0.6997395, 3.908999, 1, 1, 1, 1, 1,
0.9834054, -2.19981, 3.922211, 1, 1, 1, 1, 1,
0.9849949, -1.721611, 4.002193, 0, 0, 1, 1, 1,
0.9870771, -0.1017003, 2.57393, 1, 0, 0, 1, 1,
0.9910852, 1.132838, 1.081549, 1, 0, 0, 1, 1,
0.9999887, 1.98983, 1.147141, 1, 0, 0, 1, 1,
1.000525, -1.349309, 3.210427, 1, 0, 0, 1, 1,
1.001028, -0.3141092, 3.127909, 1, 0, 0, 1, 1,
1.005843, -1.591763, 2.945399, 0, 0, 0, 1, 1,
1.009393, -1.439383, 3.94396, 0, 0, 0, 1, 1,
1.013524, 0.3759788, 1.822815, 0, 0, 0, 1, 1,
1.015149, 0.7465489, 0.3928175, 0, 0, 0, 1, 1,
1.021198, -2.222934, 3.16425, 0, 0, 0, 1, 1,
1.029204, -0.4658202, 0.2195679, 0, 0, 0, 1, 1,
1.034403, 0.1304935, -0.09708757, 0, 0, 0, 1, 1,
1.035846, 0.03703277, 1.133554, 1, 1, 1, 1, 1,
1.036128, -1.654132, 2.45623, 1, 1, 1, 1, 1,
1.040687, 0.5747928, 2.864286, 1, 1, 1, 1, 1,
1.041299, 1.103157, 0.9610277, 1, 1, 1, 1, 1,
1.049909, -1.084849, 1.111624, 1, 1, 1, 1, 1,
1.05325, 0.928634, 0.4673882, 1, 1, 1, 1, 1,
1.054024, -1.59347, 2.215961, 1, 1, 1, 1, 1,
1.069974, 0.3738409, 0.9837857, 1, 1, 1, 1, 1,
1.07231, -0.4587307, 2.80078, 1, 1, 1, 1, 1,
1.07724, 0.7803032, 0.1792721, 1, 1, 1, 1, 1,
1.078478, -0.704994, 2.707449, 1, 1, 1, 1, 1,
1.079, -1.3998, 2.556836, 1, 1, 1, 1, 1,
1.081367, 1.981686, -0.3488417, 1, 1, 1, 1, 1,
1.084443, -1.31613, 3.369335, 1, 1, 1, 1, 1,
1.086075, -0.3264035, 1.738714, 1, 1, 1, 1, 1,
1.08907, 0.07182761, 2.417699, 0, 0, 1, 1, 1,
1.097303, -1.585316, 1.564052, 1, 0, 0, 1, 1,
1.103559, 0.134328, 1.451254, 1, 0, 0, 1, 1,
1.11081, -0.7006088, 2.849683, 1, 0, 0, 1, 1,
1.124247, -2.610138, 1.507562, 1, 0, 0, 1, 1,
1.124618, 1.427035, 0.5212089, 1, 0, 0, 1, 1,
1.128712, -0.5771273, 1.946699, 0, 0, 0, 1, 1,
1.135101, -0.3256373, 2.276002, 0, 0, 0, 1, 1,
1.136849, -0.04780749, 2.221928, 0, 0, 0, 1, 1,
1.143112, 0.7700331, 0.8030663, 0, 0, 0, 1, 1,
1.148738, 0.7047445, 1.97855, 0, 0, 0, 1, 1,
1.161364, -2.024098, 3.697764, 0, 0, 0, 1, 1,
1.161449, 0.5352949, 1.201916, 0, 0, 0, 1, 1,
1.164693, -1.044098, 2.753027, 1, 1, 1, 1, 1,
1.171058, 0.554383, 2.409111, 1, 1, 1, 1, 1,
1.171157, 0.04122822, 2.497262, 1, 1, 1, 1, 1,
1.1749, 0.2586074, 3.340717, 1, 1, 1, 1, 1,
1.182474, 0.2085649, 1.253186, 1, 1, 1, 1, 1,
1.199049, 1.660655, 2.021495, 1, 1, 1, 1, 1,
1.199092, -1.028879, 2.733091, 1, 1, 1, 1, 1,
1.203566, 0.4608404, 1.547415, 1, 1, 1, 1, 1,
1.214349, -0.07481286, 0.9871527, 1, 1, 1, 1, 1,
1.218882, -0.5713913, 3.096744, 1, 1, 1, 1, 1,
1.223498, 0.8293934, 1.664749, 1, 1, 1, 1, 1,
1.228592, -0.05840504, 1.319643, 1, 1, 1, 1, 1,
1.2295, -1.036043, 2.694842, 1, 1, 1, 1, 1,
1.231008, 1.264221, -0.1362467, 1, 1, 1, 1, 1,
1.23164, -0.8185251, 1.444713, 1, 1, 1, 1, 1,
1.235331, 0.09102705, 0.8369122, 0, 0, 1, 1, 1,
1.248889, 0.5374532, 0.853727, 1, 0, 0, 1, 1,
1.249344, 1.066786, 0.3476057, 1, 0, 0, 1, 1,
1.25013, 0.01363413, 0.2504151, 1, 0, 0, 1, 1,
1.268299, 1.485782, -1.283882, 1, 0, 0, 1, 1,
1.281581, 1.401335, -0.1117078, 1, 0, 0, 1, 1,
1.30393, 1.131521, -0.5612342, 0, 0, 0, 1, 1,
1.313988, 0.06326137, 1.64704, 0, 0, 0, 1, 1,
1.317174, 0.1374275, 1.29054, 0, 0, 0, 1, 1,
1.336236, 0.8726833, 1.117022, 0, 0, 0, 1, 1,
1.346027, 0.5531818, 0.7733405, 0, 0, 0, 1, 1,
1.348127, -2.443364, 3.092001, 0, 0, 0, 1, 1,
1.349779, -0.5970046, 1.84388, 0, 0, 0, 1, 1,
1.350732, -1.050463, 0.8312702, 1, 1, 1, 1, 1,
1.360872, -0.2883356, 1.161749, 1, 1, 1, 1, 1,
1.364025, 0.01171565, 2.151018, 1, 1, 1, 1, 1,
1.375336, 1.715241, 1.568685, 1, 1, 1, 1, 1,
1.376753, 0.07436018, 1.923335, 1, 1, 1, 1, 1,
1.396562, 0.2217009, 2.129237, 1, 1, 1, 1, 1,
1.399758, -0.4662431, 3.187747, 1, 1, 1, 1, 1,
1.400299, 1.25737, -0.5053531, 1, 1, 1, 1, 1,
1.408937, -0.2970326, 1.077154, 1, 1, 1, 1, 1,
1.410714, -1.056466, 1.755537, 1, 1, 1, 1, 1,
1.419676, 0.0917454, 0.7529029, 1, 1, 1, 1, 1,
1.42259, 0.08803792, 0.6340242, 1, 1, 1, 1, 1,
1.424656, 0.8177323, 1.562895, 1, 1, 1, 1, 1,
1.429396, -0.6449974, 3.261184, 1, 1, 1, 1, 1,
1.45743, 1.188522, 1.080644, 1, 1, 1, 1, 1,
1.47497, 2.554186, 0.474518, 0, 0, 1, 1, 1,
1.487887, -0.3662819, 0.6032146, 1, 0, 0, 1, 1,
1.491199, -0.170248, 0.5799512, 1, 0, 0, 1, 1,
1.506089, -0.8502752, 2.746306, 1, 0, 0, 1, 1,
1.506958, -1.404469, 2.597922, 1, 0, 0, 1, 1,
1.509872, -0.6888905, 2.0595, 1, 0, 0, 1, 1,
1.513182, -0.4393581, 1.257091, 0, 0, 0, 1, 1,
1.523996, 0.5108005, 1.251178, 0, 0, 0, 1, 1,
1.525497, -0.06506049, 3.52985, 0, 0, 0, 1, 1,
1.533936, -0.3540151, -0.1323725, 0, 0, 0, 1, 1,
1.544911, -0.8025025, 3.388944, 0, 0, 0, 1, 1,
1.559526, -0.2822985, 0.1146834, 0, 0, 0, 1, 1,
1.561728, -1.449065, 1.840629, 0, 0, 0, 1, 1,
1.563673, 0.4873895, 1.946509, 1, 1, 1, 1, 1,
1.56617, -1.966758, 1.553232, 1, 1, 1, 1, 1,
1.571635, 1.159717, -0.3462161, 1, 1, 1, 1, 1,
1.571839, 0.1008937, 2.059844, 1, 1, 1, 1, 1,
1.576102, -0.1100924, 1.652238, 1, 1, 1, 1, 1,
1.582061, -1.057967, 0.674984, 1, 1, 1, 1, 1,
1.586691, 0.6661158, 1.475703, 1, 1, 1, 1, 1,
1.594214, -0.1143806, 1.295707, 1, 1, 1, 1, 1,
1.599577, -0.4748192, 2.072015, 1, 1, 1, 1, 1,
1.600331, 1.532573, -0.979082, 1, 1, 1, 1, 1,
1.603698, 0.4091393, 1.853788, 1, 1, 1, 1, 1,
1.609203, 0.632111, 2.965437, 1, 1, 1, 1, 1,
1.622443, 1.097593, 1.505031, 1, 1, 1, 1, 1,
1.623929, -0.6955622, 2.133127, 1, 1, 1, 1, 1,
1.630922, -1.140346, 2.873238, 1, 1, 1, 1, 1,
1.633157, -0.235913, 2.196208, 0, 0, 1, 1, 1,
1.649926, 0.2396296, 2.471204, 1, 0, 0, 1, 1,
1.654115, 0.09207161, 2.565792, 1, 0, 0, 1, 1,
1.676957, 0.3167854, 3.833633, 1, 0, 0, 1, 1,
1.688816, -0.1587141, 0.9405863, 1, 0, 0, 1, 1,
1.698291, 0.2580576, 1.903123, 1, 0, 0, 1, 1,
1.739257, -0.03398025, 0.6234857, 0, 0, 0, 1, 1,
1.751191, 1.518568, 0.1910619, 0, 0, 0, 1, 1,
1.755498, -0.4548157, 1.285122, 0, 0, 0, 1, 1,
1.760674, -0.7993205, 2.622058, 0, 0, 0, 1, 1,
1.761329, 0.4654201, 0.8323051, 0, 0, 0, 1, 1,
1.767793, -0.4469183, 1.666244, 0, 0, 0, 1, 1,
1.781755, -1.574889, 1.260197, 0, 0, 0, 1, 1,
1.781831, -0.2082024, 2.033631, 1, 1, 1, 1, 1,
1.790946, 0.7162464, 1.282684, 1, 1, 1, 1, 1,
1.81143, 0.7107099, 2.123788, 1, 1, 1, 1, 1,
1.814868, 1.169943, 0.2130416, 1, 1, 1, 1, 1,
1.820737, -0.289897, 2.980833, 1, 1, 1, 1, 1,
1.82246, 0.827355, 0.6963913, 1, 1, 1, 1, 1,
1.835999, -2.192704, 0.374064, 1, 1, 1, 1, 1,
1.847687, -1.605417, 3.058882, 1, 1, 1, 1, 1,
1.893642, 0.1989888, 0.3780663, 1, 1, 1, 1, 1,
1.90331, -0.6112238, 2.014502, 1, 1, 1, 1, 1,
1.907332, 0.4776259, 0.5941575, 1, 1, 1, 1, 1,
1.911194, -0.07210311, 0.8204311, 1, 1, 1, 1, 1,
1.914734, -0.1531604, 2.936522, 1, 1, 1, 1, 1,
1.948555, -1.667345, 2.38783, 1, 1, 1, 1, 1,
1.957406, 1.70322, 0.1925523, 1, 1, 1, 1, 1,
1.958539, -0.0473687, 2.502496, 0, 0, 1, 1, 1,
1.978722, -0.5313898, 1.498571, 1, 0, 0, 1, 1,
2.013031, -0.665651, 1.74655, 1, 0, 0, 1, 1,
2.023002, -0.7159226, -0.08154751, 1, 0, 0, 1, 1,
2.026108, 0.1915368, 1.307312, 1, 0, 0, 1, 1,
2.035275, 2.427098, 2.151323, 1, 0, 0, 1, 1,
2.063416, 0.8797799, 1.537425, 0, 0, 0, 1, 1,
2.0659, -0.7828503, 0.8665345, 0, 0, 0, 1, 1,
2.146509, 1.179455, 1.2468, 0, 0, 0, 1, 1,
2.168903, -1.60752, 3.215515, 0, 0, 0, 1, 1,
2.251428, 0.2432233, 0.4063003, 0, 0, 0, 1, 1,
2.313784, -1.939132, 0.9671921, 0, 0, 0, 1, 1,
2.373812, -0.4971634, 0.1728651, 0, 0, 0, 1, 1,
2.389446, -0.2995526, 3.338479, 1, 1, 1, 1, 1,
2.453298, -0.3690207, -0.542682, 1, 1, 1, 1, 1,
2.477275, -0.7021176, 0.757845, 1, 1, 1, 1, 1,
2.621669, -0.4445775, 2.3925, 1, 1, 1, 1, 1,
2.758061, 1.040923, 1.646899, 1, 1, 1, 1, 1,
2.789119, 0.8160017, 0.5854177, 1, 1, 1, 1, 1,
2.918223, 0.243793, 2.125387, 1, 1, 1, 1, 1
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
var radius = 9.770719;
var distance = 34.31923;
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
mvMatrix.translate( 0.09760654, 0.3871796, -0.2023056 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31923);
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
