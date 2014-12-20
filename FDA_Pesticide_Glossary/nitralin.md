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
-3.200145, -0.8456722, -0.2371416, 1, 0, 0, 1,
-3.082311, -0.6519048, -1.493082, 1, 0.007843138, 0, 1,
-2.708795, -1.080487, -2.766456, 1, 0.01176471, 0, 1,
-2.586428, -0.513372, -4.211147, 1, 0.01960784, 0, 1,
-2.388623, -0.2139937, -2.237471, 1, 0.02352941, 0, 1,
-2.1395, -0.2363915, -2.515307, 1, 0.03137255, 0, 1,
-2.093131, -0.9974681, -3.138587, 1, 0.03529412, 0, 1,
-2.083785, -0.2978453, -3.432551, 1, 0.04313726, 0, 1,
-2.061079, -1.039098, -1.47217, 1, 0.04705882, 0, 1,
-2.039058, 0.5614116, -0.6079618, 1, 0.05490196, 0, 1,
-1.990966, 0.6405599, -1.890839, 1, 0.05882353, 0, 1,
-1.967504, 1.15771, -0.5816894, 1, 0.06666667, 0, 1,
-1.965495, 0.1628609, -1.617555, 1, 0.07058824, 0, 1,
-1.940211, 1.086406, -1.426292, 1, 0.07843138, 0, 1,
-1.933695, -0.3050257, -2.274784, 1, 0.08235294, 0, 1,
-1.919912, -0.7081334, -2.225061, 1, 0.09019608, 0, 1,
-1.916993, 0.5979855, -1.155424, 1, 0.09411765, 0, 1,
-1.912068, 1.444816, -1.338052, 1, 0.1019608, 0, 1,
-1.906286, 0.3108702, -0.6695573, 1, 0.1098039, 0, 1,
-1.884095, -0.3446369, -2.763682, 1, 0.1137255, 0, 1,
-1.874885, 0.45264, 0.4682031, 1, 0.1215686, 0, 1,
-1.830831, 0.2925933, -1.520178, 1, 0.1254902, 0, 1,
-1.797766, -0.8060748, -0.8883063, 1, 0.1333333, 0, 1,
-1.795267, -0.06039391, -1.054388, 1, 0.1372549, 0, 1,
-1.792361, 0.08514143, -1.831693, 1, 0.145098, 0, 1,
-1.762509, 0.195509, -0.9531581, 1, 0.1490196, 0, 1,
-1.759024, -0.2020582, -2.284983, 1, 0.1568628, 0, 1,
-1.737462, -0.7995779, -2.894527, 1, 0.1607843, 0, 1,
-1.732252, 0.2019233, -3.289466, 1, 0.1686275, 0, 1,
-1.697706, -1.06406, -2.709734, 1, 0.172549, 0, 1,
-1.655808, -0.4783967, -3.586807, 1, 0.1803922, 0, 1,
-1.649601, -0.1731035, -2.513772, 1, 0.1843137, 0, 1,
-1.649272, 0.9144622, -1.433209, 1, 0.1921569, 0, 1,
-1.646184, -0.4468361, -1.276348, 1, 0.1960784, 0, 1,
-1.603346, -1.069039, -1.859308, 1, 0.2039216, 0, 1,
-1.559019, -1.219943, -2.34795, 1, 0.2117647, 0, 1,
-1.554313, 1.303996, -1.325141, 1, 0.2156863, 0, 1,
-1.537104, -0.0527134, -0.6185936, 1, 0.2235294, 0, 1,
-1.518597, 0.4024851, -0.3856217, 1, 0.227451, 0, 1,
-1.503825, -0.195485, -2.111666, 1, 0.2352941, 0, 1,
-1.496308, -0.3702445, -1.938894, 1, 0.2392157, 0, 1,
-1.478481, -1.932434, -3.20892, 1, 0.2470588, 0, 1,
-1.466265, 0.4213156, -1.514744, 1, 0.2509804, 0, 1,
-1.463268, 0.3366684, -0.4164437, 1, 0.2588235, 0, 1,
-1.461116, 0.06049684, -1.008363, 1, 0.2627451, 0, 1,
-1.458584, -0.7004089, -2.158883, 1, 0.2705882, 0, 1,
-1.449825, -1.457953, -2.905358, 1, 0.2745098, 0, 1,
-1.447956, 1.374367, -0.3547104, 1, 0.282353, 0, 1,
-1.432795, -1.345466, -1.687002, 1, 0.2862745, 0, 1,
-1.423503, 0.5659491, -0.6515995, 1, 0.2941177, 0, 1,
-1.423454, 0.6776058, 1.991758, 1, 0.3019608, 0, 1,
-1.419621, 0.1637398, -3.145931, 1, 0.3058824, 0, 1,
-1.412618, 1.31266, 1.451179, 1, 0.3137255, 0, 1,
-1.383015, -0.1071403, -0.7829701, 1, 0.3176471, 0, 1,
-1.381092, -0.743578, -2.869986, 1, 0.3254902, 0, 1,
-1.376056, -0.2603212, -0.4029187, 1, 0.3294118, 0, 1,
-1.375658, -1.670098, -3.037179, 1, 0.3372549, 0, 1,
-1.371453, -3.013122, -3.337762, 1, 0.3411765, 0, 1,
-1.367659, -0.2290317, -3.076907, 1, 0.3490196, 0, 1,
-1.359349, 0.6530355, -0.8877326, 1, 0.3529412, 0, 1,
-1.35106, 1.207179, -0.1645286, 1, 0.3607843, 0, 1,
-1.336568, -1.120859, -2.266784, 1, 0.3647059, 0, 1,
-1.32646, 0.2560746, -0.661338, 1, 0.372549, 0, 1,
-1.325498, 0.3102102, -2.55357, 1, 0.3764706, 0, 1,
-1.312529, 0.7644901, -1.789234, 1, 0.3843137, 0, 1,
-1.303102, -1.194894, -2.164092, 1, 0.3882353, 0, 1,
-1.30269, -1.579198, -3.953456, 1, 0.3960784, 0, 1,
-1.29322, -0.9544153, -3.921587, 1, 0.4039216, 0, 1,
-1.282789, 1.086907, -1.022691, 1, 0.4078431, 0, 1,
-1.263454, -0.05158392, -0.5865902, 1, 0.4156863, 0, 1,
-1.238788, -0.07936217, -1.009524, 1, 0.4196078, 0, 1,
-1.235333, -0.7260404, -1.374439, 1, 0.427451, 0, 1,
-1.232277, 1.46364, -2.738386, 1, 0.4313726, 0, 1,
-1.231263, 1.556634, 0.6414506, 1, 0.4392157, 0, 1,
-1.227066, -0.6192327, -2.467254, 1, 0.4431373, 0, 1,
-1.221291, -0.1899071, -1.213063, 1, 0.4509804, 0, 1,
-1.217315, 0.7580429, -0.01205026, 1, 0.454902, 0, 1,
-1.216897, 0.6278706, -0.3393584, 1, 0.4627451, 0, 1,
-1.208938, 0.2390029, -0.498005, 1, 0.4666667, 0, 1,
-1.207238, -0.9193782, -2.043518, 1, 0.4745098, 0, 1,
-1.204784, 0.2279185, -2.154088, 1, 0.4784314, 0, 1,
-1.20375, -0.7430857, -1.220911, 1, 0.4862745, 0, 1,
-1.19894, -0.2353034, -2.11265, 1, 0.4901961, 0, 1,
-1.197942, 0.0220619, -2.200326, 1, 0.4980392, 0, 1,
-1.196149, -0.113444, -3.559309, 1, 0.5058824, 0, 1,
-1.195077, 0.05571203, -0.1280926, 1, 0.509804, 0, 1,
-1.187243, 0.1702808, -1.206526, 1, 0.5176471, 0, 1,
-1.176368, 0.5604005, -1.154266, 1, 0.5215687, 0, 1,
-1.172888, -0.1029554, -1.247401, 1, 0.5294118, 0, 1,
-1.172116, 1.306409, -0.9827338, 1, 0.5333334, 0, 1,
-1.165717, 1.393333, -0.9026104, 1, 0.5411765, 0, 1,
-1.147398, 0.551564, 0.277848, 1, 0.5450981, 0, 1,
-1.141039, -2.165092, -2.440041, 1, 0.5529412, 0, 1,
-1.140118, -0.4619448, -0.5498633, 1, 0.5568628, 0, 1,
-1.14001, 0.3984458, -1.553108, 1, 0.5647059, 0, 1,
-1.13938, 1.933001, 0.1443136, 1, 0.5686275, 0, 1,
-1.137521, 0.2367898, -0.3087853, 1, 0.5764706, 0, 1,
-1.131542, -2.089052, -2.477796, 1, 0.5803922, 0, 1,
-1.114139, 1.173513, 1.161199, 1, 0.5882353, 0, 1,
-1.111969, 0.641935, -0.9019591, 1, 0.5921569, 0, 1,
-1.110206, 1.442564, -0.5600752, 1, 0.6, 0, 1,
-1.109831, -0.4100837, -1.238377, 1, 0.6078432, 0, 1,
-1.107325, 1.444622, -0.6643192, 1, 0.6117647, 0, 1,
-1.107048, -0.4147035, -1.976925, 1, 0.6196079, 0, 1,
-1.104068, -0.9421455, -2.285342, 1, 0.6235294, 0, 1,
-1.103832, -0.8365216, -1.671524, 1, 0.6313726, 0, 1,
-1.100804, -3.159778, -3.576747, 1, 0.6352941, 0, 1,
-1.100534, -1.390958, -2.855296, 1, 0.6431373, 0, 1,
-1.097426, -0.7899711, -3.623595, 1, 0.6470588, 0, 1,
-1.091283, -0.7312812, -3.770387, 1, 0.654902, 0, 1,
-1.090635, -0.8015033, -1.482372, 1, 0.6588235, 0, 1,
-1.085232, 0.482066, -0.7956895, 1, 0.6666667, 0, 1,
-1.083117, -1.319685, -0.8453984, 1, 0.6705883, 0, 1,
-1.070091, 1.358518, 0.03048255, 1, 0.6784314, 0, 1,
-1.0572, 0.182998, -2.465295, 1, 0.682353, 0, 1,
-1.054094, -0.7758824, -1.314586, 1, 0.6901961, 0, 1,
-1.05132, 0.6860284, -1.235331, 1, 0.6941177, 0, 1,
-1.045255, -0.2058242, -1.761457, 1, 0.7019608, 0, 1,
-1.042373, 0.5091059, -0.2918568, 1, 0.7098039, 0, 1,
-1.041031, -1.630318, -1.663873, 1, 0.7137255, 0, 1,
-1.03179, 1.997027, -0.2568314, 1, 0.7215686, 0, 1,
-1.02905, -1.254094, -5.221, 1, 0.7254902, 0, 1,
-1.022138, 0.7192847, -1.508294, 1, 0.7333333, 0, 1,
-1.012313, -0.5033357, -1.951784, 1, 0.7372549, 0, 1,
-1.006944, 1.30846, -1.879775, 1, 0.7450981, 0, 1,
-1.004916, 0.6417418, -0.4980083, 1, 0.7490196, 0, 1,
-1.003859, 0.444513, -1.547644, 1, 0.7568628, 0, 1,
-1.003807, -0.6522067, -2.141065, 1, 0.7607843, 0, 1,
-1.001947, 0.8420886, 1.824935, 1, 0.7686275, 0, 1,
-1.001534, -1.275161, -4.794463, 1, 0.772549, 0, 1,
-0.989791, 1.671959, -0.93363, 1, 0.7803922, 0, 1,
-0.9872305, 0.1826365, -1.914544, 1, 0.7843137, 0, 1,
-0.9829972, 1.290291, 0.5442133, 1, 0.7921569, 0, 1,
-0.968828, 0.614976, 1.612505, 1, 0.7960784, 0, 1,
-0.9669414, 0.4665831, -0.2278597, 1, 0.8039216, 0, 1,
-0.963824, -0.2264961, -0.8292593, 1, 0.8117647, 0, 1,
-0.9624241, -0.3982258, -2.470574, 1, 0.8156863, 0, 1,
-0.960559, 1.275741, -1.362708, 1, 0.8235294, 0, 1,
-0.9552731, -0.4540435, -2.477291, 1, 0.827451, 0, 1,
-0.9542048, 0.6731614, -0.4634983, 1, 0.8352941, 0, 1,
-0.9539148, -0.3439869, -1.4948, 1, 0.8392157, 0, 1,
-0.9497515, -1.244087, -3.52516, 1, 0.8470588, 0, 1,
-0.9472002, -1.052608, -2.738935, 1, 0.8509804, 0, 1,
-0.9439878, 1.137103, -0.06842938, 1, 0.8588235, 0, 1,
-0.9363883, -0.3063936, 0.8802505, 1, 0.8627451, 0, 1,
-0.9303651, 0.8445117, -1.215247, 1, 0.8705882, 0, 1,
-0.9264655, -3.241586, -4.127854, 1, 0.8745098, 0, 1,
-0.9260406, -0.2725355, -2.456548, 1, 0.8823529, 0, 1,
-0.925281, -1.313199, -2.948521, 1, 0.8862745, 0, 1,
-0.9239323, 0.9667981, 1.44155, 1, 0.8941177, 0, 1,
-0.9225855, -0.2050711, -2.789362, 1, 0.8980392, 0, 1,
-0.9178032, 0.3065591, -1.18224, 1, 0.9058824, 0, 1,
-0.9139252, -0.6693127, -2.449312, 1, 0.9137255, 0, 1,
-0.912948, -0.9544095, -1.492747, 1, 0.9176471, 0, 1,
-0.9121348, 0.3760321, -0.3786062, 1, 0.9254902, 0, 1,
-0.9111606, -1.830487, -1.757204, 1, 0.9294118, 0, 1,
-0.9053509, 0.5897422, -0.9384071, 1, 0.9372549, 0, 1,
-0.896523, -2.240916, -2.584587, 1, 0.9411765, 0, 1,
-0.8953047, 1.150623, -1.197881, 1, 0.9490196, 0, 1,
-0.8860635, -0.1945346, -3.789636, 1, 0.9529412, 0, 1,
-0.8801409, 2.142925, -0.1857252, 1, 0.9607843, 0, 1,
-0.8790335, -0.3718626, -2.525599, 1, 0.9647059, 0, 1,
-0.874339, 1.010704, -0.6575484, 1, 0.972549, 0, 1,
-0.873998, 1.749634, -0.4467639, 1, 0.9764706, 0, 1,
-0.8711952, -0.09751707, -1.975665, 1, 0.9843137, 0, 1,
-0.8689901, -0.2327258, -1.255702, 1, 0.9882353, 0, 1,
-0.8679855, 0.9081033, 1.004001, 1, 0.9960784, 0, 1,
-0.8617516, -0.9447288, -2.215393, 0.9960784, 1, 0, 1,
-0.8490162, -0.937954, -3.629844, 0.9921569, 1, 0, 1,
-0.8464242, -1.478514, -2.787159, 0.9843137, 1, 0, 1,
-0.8375566, -0.09742101, -0.1756608, 0.9803922, 1, 0, 1,
-0.8360237, 0.414412, -0.6672587, 0.972549, 1, 0, 1,
-0.8345515, 0.7476215, -0.8630801, 0.9686275, 1, 0, 1,
-0.8328404, -0.224233, -2.321241, 0.9607843, 1, 0, 1,
-0.8212838, -2.550345, -3.53925, 0.9568627, 1, 0, 1,
-0.8206313, -0.6609768, -2.862207, 0.9490196, 1, 0, 1,
-0.8166414, 1.181285, 0.3161694, 0.945098, 1, 0, 1,
-0.8106268, -0.409669, -1.277597, 0.9372549, 1, 0, 1,
-0.8096073, 0.7961627, -2.753967, 0.9333333, 1, 0, 1,
-0.8083174, 1.90372, 0.08305539, 0.9254902, 1, 0, 1,
-0.80753, -0.3771757, -1.360605, 0.9215686, 1, 0, 1,
-0.8060864, 0.5711313, -0.4896292, 0.9137255, 1, 0, 1,
-0.8025945, 0.9738998, -0.5523504, 0.9098039, 1, 0, 1,
-0.7976295, -0.5007604, -1.07378, 0.9019608, 1, 0, 1,
-0.7970989, -0.4039379, -0.8517485, 0.8941177, 1, 0, 1,
-0.7967671, -0.2684553, -1.853477, 0.8901961, 1, 0, 1,
-0.795997, -0.3571513, -2.879546, 0.8823529, 1, 0, 1,
-0.7953708, 0.7541801, -0.5296974, 0.8784314, 1, 0, 1,
-0.792869, -1.381916, -4.628579, 0.8705882, 1, 0, 1,
-0.7863442, 0.7807556, -0.4966288, 0.8666667, 1, 0, 1,
-0.784361, 1.21572, -0.3371533, 0.8588235, 1, 0, 1,
-0.7818022, -0.2861264, -0.899867, 0.854902, 1, 0, 1,
-0.7795893, 0.8462133, -1.675937, 0.8470588, 1, 0, 1,
-0.7739531, 1.088061, -0.8017971, 0.8431373, 1, 0, 1,
-0.7679726, -2.14142, -1.824368, 0.8352941, 1, 0, 1,
-0.7664167, 1.289883, -1.169873, 0.8313726, 1, 0, 1,
-0.7623274, -0.9754447, -1.801185, 0.8235294, 1, 0, 1,
-0.7605457, 0.6175376, -1.04636, 0.8196079, 1, 0, 1,
-0.7494851, -0.1316757, -3.766042, 0.8117647, 1, 0, 1,
-0.740545, 0.5663334, -0.4078051, 0.8078431, 1, 0, 1,
-0.7403001, 1.392212, 0.5256262, 0.8, 1, 0, 1,
-0.7391194, -0.9134091, -3.696365, 0.7921569, 1, 0, 1,
-0.7372525, 1.611834, -0.7390872, 0.7882353, 1, 0, 1,
-0.737121, -0.9575436, -2.37349, 0.7803922, 1, 0, 1,
-0.7340307, -1.036149, -3.689618, 0.7764706, 1, 0, 1,
-0.7315816, -0.2013991, -1.158831, 0.7686275, 1, 0, 1,
-0.7300826, 1.587044, -0.1475637, 0.7647059, 1, 0, 1,
-0.7182094, 0.7411293, -0.7147702, 0.7568628, 1, 0, 1,
-0.7140531, -0.7953188, -1.985155, 0.7529412, 1, 0, 1,
-0.706569, -0.1449291, -1.58136, 0.7450981, 1, 0, 1,
-0.7061354, 0.8723199, -1.480465, 0.7411765, 1, 0, 1,
-0.702871, -1.169363, -2.826528, 0.7333333, 1, 0, 1,
-0.7009111, -0.3271667, -0.9171745, 0.7294118, 1, 0, 1,
-0.7000214, -1.103334, -3.56708, 0.7215686, 1, 0, 1,
-0.6925073, -0.2359205, -1.877307, 0.7176471, 1, 0, 1,
-0.6924292, 0.61409, -2.065798, 0.7098039, 1, 0, 1,
-0.6883433, -0.4119391, -3.048245, 0.7058824, 1, 0, 1,
-0.6855711, -0.2647227, -1.467523, 0.6980392, 1, 0, 1,
-0.6845601, -0.2346177, -2.911219, 0.6901961, 1, 0, 1,
-0.6765732, -0.09537008, -1.685491, 0.6862745, 1, 0, 1,
-0.6751927, -0.6473333, -2.500271, 0.6784314, 1, 0, 1,
-0.6692649, -0.8781945, -2.465156, 0.6745098, 1, 0, 1,
-0.6689715, -0.3110779, -1.256859, 0.6666667, 1, 0, 1,
-0.6676211, 0.1851658, -1.358953, 0.6627451, 1, 0, 1,
-0.6663056, -1.123249, -2.217365, 0.654902, 1, 0, 1,
-0.6660246, -0.9228038, -3.264328, 0.6509804, 1, 0, 1,
-0.664366, 0.25536, -2.363579, 0.6431373, 1, 0, 1,
-0.6605662, 0.1576555, -0.272597, 0.6392157, 1, 0, 1,
-0.6598793, 0.6677209, -0.9169979, 0.6313726, 1, 0, 1,
-0.6558611, -0.289919, -4.047695, 0.627451, 1, 0, 1,
-0.6545144, -0.07670962, -1.95656, 0.6196079, 1, 0, 1,
-0.6538499, -0.4400328, -1.357095, 0.6156863, 1, 0, 1,
-0.6515259, -0.132493, -1.899053, 0.6078432, 1, 0, 1,
-0.6474974, 0.2626418, -2.033782, 0.6039216, 1, 0, 1,
-0.6452509, 0.4419031, -2.13839, 0.5960785, 1, 0, 1,
-0.6445644, 0.4850343, -2.176393, 0.5882353, 1, 0, 1,
-0.6441399, -0.2412149, -1.677366, 0.5843138, 1, 0, 1,
-0.6390068, -0.1474831, 0.106629, 0.5764706, 1, 0, 1,
-0.635444, -0.9301262, -3.272448, 0.572549, 1, 0, 1,
-0.6340118, 0.09157017, -2.838902, 0.5647059, 1, 0, 1,
-0.6328655, -0.4557042, -3.483936, 0.5607843, 1, 0, 1,
-0.6312099, -1.20602, -0.4395703, 0.5529412, 1, 0, 1,
-0.6301149, 0.6897665, -0.008061936, 0.5490196, 1, 0, 1,
-0.6266397, 1.847601, -0.09851578, 0.5411765, 1, 0, 1,
-0.6260162, -0.8296759, -4.17729, 0.5372549, 1, 0, 1,
-0.6219844, -0.4929195, -1.150555, 0.5294118, 1, 0, 1,
-0.6199798, -1.541425, -1.96833, 0.5254902, 1, 0, 1,
-0.6197649, 0.5622097, -0.9554694, 0.5176471, 1, 0, 1,
-0.6188853, -0.04681055, -3.627806, 0.5137255, 1, 0, 1,
-0.6095304, 0.655084, -0.8311399, 0.5058824, 1, 0, 1,
-0.6065716, 2.595135, -1.553572, 0.5019608, 1, 0, 1,
-0.5992774, -1.628995, -4.199713, 0.4941176, 1, 0, 1,
-0.5991532, -0.01609174, -2.179343, 0.4862745, 1, 0, 1,
-0.5958778, -1.044545, -2.231406, 0.4823529, 1, 0, 1,
-0.5956544, 0.8863173, 0.5244058, 0.4745098, 1, 0, 1,
-0.5936249, -1.071275, -2.941689, 0.4705882, 1, 0, 1,
-0.5934449, 2.236521, 0.5089161, 0.4627451, 1, 0, 1,
-0.593299, 0.2810775, -1.997805, 0.4588235, 1, 0, 1,
-0.5897703, 1.313784, -0.6592689, 0.4509804, 1, 0, 1,
-0.5894732, -0.03460619, -0.7038406, 0.4470588, 1, 0, 1,
-0.588273, -0.9835808, -3.593764, 0.4392157, 1, 0, 1,
-0.5855065, -0.1376684, -1.312643, 0.4352941, 1, 0, 1,
-0.5793642, -0.3028501, -1.798313, 0.427451, 1, 0, 1,
-0.5774377, -0.7846352, -3.472838, 0.4235294, 1, 0, 1,
-0.5754367, 0.03117365, -2.794399, 0.4156863, 1, 0, 1,
-0.5746797, -0.06241706, -1.573918, 0.4117647, 1, 0, 1,
-0.572997, 0.5677144, -1.150879, 0.4039216, 1, 0, 1,
-0.5716644, -0.07381166, -2.574622, 0.3960784, 1, 0, 1,
-0.5710494, 1.336141, -1.640502, 0.3921569, 1, 0, 1,
-0.5682508, -0.6352176, -1.757779, 0.3843137, 1, 0, 1,
-0.562632, -0.1916665, -2.913705, 0.3803922, 1, 0, 1,
-0.5620062, -0.8961443, -2.849719, 0.372549, 1, 0, 1,
-0.5590237, -0.1931754, -1.60439, 0.3686275, 1, 0, 1,
-0.5415009, 0.6085207, -0.9836217, 0.3607843, 1, 0, 1,
-0.5305463, -2.440336, -3.584883, 0.3568628, 1, 0, 1,
-0.5284323, -0.7827092, -3.495538, 0.3490196, 1, 0, 1,
-0.5230163, -0.4027789, -4.273599, 0.345098, 1, 0, 1,
-0.5162101, 0.9084101, -0.4483819, 0.3372549, 1, 0, 1,
-0.5153441, -0.6884692, -2.510313, 0.3333333, 1, 0, 1,
-0.5136136, 1.051064, -1.865034, 0.3254902, 1, 0, 1,
-0.5134037, -0.636156, -2.282008, 0.3215686, 1, 0, 1,
-0.5132242, 0.4003644, -0.4302937, 0.3137255, 1, 0, 1,
-0.5130733, -0.7084228, -2.360026, 0.3098039, 1, 0, 1,
-0.5093934, -1.506877, -1.509429, 0.3019608, 1, 0, 1,
-0.5076916, 1.365073, -1.660885, 0.2941177, 1, 0, 1,
-0.5065948, 1.012253, -2.684389, 0.2901961, 1, 0, 1,
-0.5048938, 0.7721187, 0.7094243, 0.282353, 1, 0, 1,
-0.5032544, -1.3488, -1.404318, 0.2784314, 1, 0, 1,
-0.5021933, -0.3698179, -0.70783, 0.2705882, 1, 0, 1,
-0.4997568, -0.2268929, -1.314516, 0.2666667, 1, 0, 1,
-0.4975092, -0.9010357, -2.298478, 0.2588235, 1, 0, 1,
-0.4962103, -0.6578677, -2.416097, 0.254902, 1, 0, 1,
-0.4956394, 1.088968, -0.3945905, 0.2470588, 1, 0, 1,
-0.4930928, -0.165331, -0.5656897, 0.2431373, 1, 0, 1,
-0.4904796, 0.6097274, -0.587315, 0.2352941, 1, 0, 1,
-0.4900301, -2.234266, -2.581541, 0.2313726, 1, 0, 1,
-0.4888435, 1.209469, -1.077911, 0.2235294, 1, 0, 1,
-0.4849427, -1.118439, -0.5196553, 0.2196078, 1, 0, 1,
-0.4765086, 2.057196, -0.5942764, 0.2117647, 1, 0, 1,
-0.4728763, 1.183833, -0.7165828, 0.2078431, 1, 0, 1,
-0.471027, -0.1856298, -2.829605, 0.2, 1, 0, 1,
-0.4706819, -0.9568471, -4.040704, 0.1921569, 1, 0, 1,
-0.4691374, 0.4047293, -0.9177865, 0.1882353, 1, 0, 1,
-0.4688845, -1.977051, -2.412068, 0.1803922, 1, 0, 1,
-0.4646218, -1.525608, -3.390224, 0.1764706, 1, 0, 1,
-0.4613518, 1.413491, -0.1313042, 0.1686275, 1, 0, 1,
-0.4569914, -0.9677451, -1.331563, 0.1647059, 1, 0, 1,
-0.4556623, -1.357438, -2.606147, 0.1568628, 1, 0, 1,
-0.4524445, 0.4799323, 0.5306691, 0.1529412, 1, 0, 1,
-0.4519246, 0.2251908, -1.289846, 0.145098, 1, 0, 1,
-0.4513973, -0.6599548, -3.013301, 0.1411765, 1, 0, 1,
-0.4443536, 0.8612956, -1.447257, 0.1333333, 1, 0, 1,
-0.441284, -0.6945168, -3.268741, 0.1294118, 1, 0, 1,
-0.4405864, 0.4642048, 0.1134722, 0.1215686, 1, 0, 1,
-0.4375278, 0.4836944, -0.9490595, 0.1176471, 1, 0, 1,
-0.4366035, 0.574243, -0.2898575, 0.1098039, 1, 0, 1,
-0.4349817, 0.4480646, -2.385251, 0.1058824, 1, 0, 1,
-0.4342743, 0.4715562, -2.054483, 0.09803922, 1, 0, 1,
-0.4319371, 0.6886322, -0.110295, 0.09019608, 1, 0, 1,
-0.4254531, -1.204884, -2.044928, 0.08627451, 1, 0, 1,
-0.4244309, 1.402604, 0.6441385, 0.07843138, 1, 0, 1,
-0.4164153, -0.1389892, -1.469615, 0.07450981, 1, 0, 1,
-0.4108525, 2.048977, -0.833277, 0.06666667, 1, 0, 1,
-0.4067586, 0.9614035, -0.1185399, 0.0627451, 1, 0, 1,
-0.4049468, 0.3807901, 0.1895237, 0.05490196, 1, 0, 1,
-0.4047402, 0.5815134, -1.148775, 0.05098039, 1, 0, 1,
-0.3992516, -1.129448, -2.936564, 0.04313726, 1, 0, 1,
-0.3957117, 0.4306572, -1.962676, 0.03921569, 1, 0, 1,
-0.394, 0.6475511, 0.973905, 0.03137255, 1, 0, 1,
-0.3834379, 0.6989255, -1.148815, 0.02745098, 1, 0, 1,
-0.3812449, -1.778064, -4.879221, 0.01960784, 1, 0, 1,
-0.3802134, 0.5609217, 1.369944, 0.01568628, 1, 0, 1,
-0.3765554, 0.09623876, -1.316134, 0.007843138, 1, 0, 1,
-0.3732209, -1.217901, -2.97388, 0.003921569, 1, 0, 1,
-0.3730035, 1.320522, -0.5370032, 0, 1, 0.003921569, 1,
-0.3705708, -1.709508, -3.774599, 0, 1, 0.01176471, 1,
-0.3673175, -1.181381, -1.806428, 0, 1, 0.01568628, 1,
-0.3667108, -1.05844, -2.463821, 0, 1, 0.02352941, 1,
-0.3653379, 0.5739299, 0.250795, 0, 1, 0.02745098, 1,
-0.3630693, -0.3880108, -1.418952, 0, 1, 0.03529412, 1,
-0.3624642, -0.3732026, -3.410157, 0, 1, 0.03921569, 1,
-0.3592253, 0.0877891, -1.817173, 0, 1, 0.04705882, 1,
-0.3541938, 0.7177088, -0.04110093, 0, 1, 0.05098039, 1,
-0.3494964, 0.4055986, 1.21274, 0, 1, 0.05882353, 1,
-0.3464189, 0.649043, -1.031426, 0, 1, 0.0627451, 1,
-0.3438452, 0.3431292, -0.5891953, 0, 1, 0.07058824, 1,
-0.3387036, -0.8441256, -3.315245, 0, 1, 0.07450981, 1,
-0.3348462, 1.400358, -0.9112831, 0, 1, 0.08235294, 1,
-0.3273713, 1.129312, 0.85227, 0, 1, 0.08627451, 1,
-0.3272893, 1.394295, 1.955519, 0, 1, 0.09411765, 1,
-0.3272184, 0.1659399, -1.575355, 0, 1, 0.1019608, 1,
-0.3256776, 1.157382, -0.5008357, 0, 1, 0.1058824, 1,
-0.3228581, -0.4026222, -4.0463, 0, 1, 0.1137255, 1,
-0.3227497, -0.9986838, -3.924171, 0, 1, 0.1176471, 1,
-0.3214454, 0.3746346, 0.03732533, 0, 1, 0.1254902, 1,
-0.321329, 0.9013097, 1.25474, 0, 1, 0.1294118, 1,
-0.3204196, -1.262165, -3.579584, 0, 1, 0.1372549, 1,
-0.3199285, -0.4055285, -4.179643, 0, 1, 0.1411765, 1,
-0.3124581, -0.1805429, -1.105016, 0, 1, 0.1490196, 1,
-0.3109004, -0.2510457, -2.571337, 0, 1, 0.1529412, 1,
-0.30961, -1.922132, -3.379419, 0, 1, 0.1607843, 1,
-0.2999047, -1.150008, -3.049473, 0, 1, 0.1647059, 1,
-0.2993467, 1.023674, -0.3374277, 0, 1, 0.172549, 1,
-0.2958997, 1.183252, 0.5468082, 0, 1, 0.1764706, 1,
-0.2904165, 0.2840764, -1.65718, 0, 1, 0.1843137, 1,
-0.2878935, 0.2547498, 1.069287, 0, 1, 0.1882353, 1,
-0.287215, -1.153412, -1.083408, 0, 1, 0.1960784, 1,
-0.2868184, 0.04659823, -2.705088, 0, 1, 0.2039216, 1,
-0.2843167, -1.641861, -4.307445, 0, 1, 0.2078431, 1,
-0.2794947, 1.224023, -0.8361039, 0, 1, 0.2156863, 1,
-0.2726485, -0.2555782, -2.142426, 0, 1, 0.2196078, 1,
-0.2701278, -0.08126302, -3.342373, 0, 1, 0.227451, 1,
-0.2629766, -0.3943777, -0.9198207, 0, 1, 0.2313726, 1,
-0.2591934, 1.999056, -0.462713, 0, 1, 0.2392157, 1,
-0.2589469, 2.442934, 0.1476956, 0, 1, 0.2431373, 1,
-0.2573423, 1.275321, 1.017393, 0, 1, 0.2509804, 1,
-0.2568646, 1.067672, -0.1506721, 0, 1, 0.254902, 1,
-0.2544932, -0.3422304, -2.414814, 0, 1, 0.2627451, 1,
-0.254121, 0.1861567, -0.7866077, 0, 1, 0.2666667, 1,
-0.2491463, 0.440268, -0.2426855, 0, 1, 0.2745098, 1,
-0.2472224, -1.628902, -1.791346, 0, 1, 0.2784314, 1,
-0.2446423, 0.1709321, -0.201539, 0, 1, 0.2862745, 1,
-0.2420275, -0.3474248, -3.019261, 0, 1, 0.2901961, 1,
-0.2358931, -0.9579989, -2.285256, 0, 1, 0.2980392, 1,
-0.2287245, -0.3956841, -1.745121, 0, 1, 0.3058824, 1,
-0.2214544, 0.2665021, -0.1496513, 0, 1, 0.3098039, 1,
-0.2205231, 0.3409947, -0.369926, 0, 1, 0.3176471, 1,
-0.2197122, 0.3325483, 0.3277188, 0, 1, 0.3215686, 1,
-0.2173508, -0.3257337, 0.4264375, 0, 1, 0.3294118, 1,
-0.2169254, -0.6515712, -3.081471, 0, 1, 0.3333333, 1,
-0.213551, 0.1990306, -1.3671, 0, 1, 0.3411765, 1,
-0.2133667, 1.308453, 1.091348, 0, 1, 0.345098, 1,
-0.2124607, -1.130331, -2.044605, 0, 1, 0.3529412, 1,
-0.2120677, 1.079667, -0.3162577, 0, 1, 0.3568628, 1,
-0.2106955, 1.99643, -0.7105777, 0, 1, 0.3647059, 1,
-0.207531, 1.534584, 1.342501, 0, 1, 0.3686275, 1,
-0.1989955, 0.6801805, 1.627226, 0, 1, 0.3764706, 1,
-0.1958226, 0.3832469, -1.105401, 0, 1, 0.3803922, 1,
-0.1951789, -0.03952837, -1.496255, 0, 1, 0.3882353, 1,
-0.19101, -1.743408, -2.025187, 0, 1, 0.3921569, 1,
-0.1907788, 0.7510496, 1.160396, 0, 1, 0.4, 1,
-0.1855116, 0.5457622, 0.8023065, 0, 1, 0.4078431, 1,
-0.1850947, -0.1433745, -1.794439, 0, 1, 0.4117647, 1,
-0.1827103, -1.078391, -4.784157, 0, 1, 0.4196078, 1,
-0.1821837, 1.274081, -2.212786, 0, 1, 0.4235294, 1,
-0.1821267, 0.4482207, 0.009196769, 0, 1, 0.4313726, 1,
-0.1763849, -0.1751754, -1.751661, 0, 1, 0.4352941, 1,
-0.1749649, -0.08242373, -1.103399, 0, 1, 0.4431373, 1,
-0.1696979, -0.8626819, -4.053246, 0, 1, 0.4470588, 1,
-0.1686165, 0.9121052, 1.250936, 0, 1, 0.454902, 1,
-0.1628228, 1.979642, 0.297583, 0, 1, 0.4588235, 1,
-0.16174, 0.2793145, -0.4853995, 0, 1, 0.4666667, 1,
-0.158203, 0.6364357, -0.3934323, 0, 1, 0.4705882, 1,
-0.1478006, 0.6489357, 0.6663067, 0, 1, 0.4784314, 1,
-0.1425814, 0.3276742, -1.188338, 0, 1, 0.4823529, 1,
-0.138579, 0.1912273, -1.999767, 0, 1, 0.4901961, 1,
-0.1356526, -0.7358399, -4.140247, 0, 1, 0.4941176, 1,
-0.1333412, 0.6284125, -1.309063, 0, 1, 0.5019608, 1,
-0.1331514, 1.18539, 0.8049523, 0, 1, 0.509804, 1,
-0.132813, 1.063714, 0.480586, 0, 1, 0.5137255, 1,
-0.128716, -0.1344052, -2.180206, 0, 1, 0.5215687, 1,
-0.1282218, -0.207909, -2.584502, 0, 1, 0.5254902, 1,
-0.1281291, 0.08474471, -0.1776461, 0, 1, 0.5333334, 1,
-0.1270425, -2.35647, -2.545518, 0, 1, 0.5372549, 1,
-0.1249893, -0.09992202, -2.691346, 0, 1, 0.5450981, 1,
-0.1229874, -1.469603, -4.339868, 0, 1, 0.5490196, 1,
-0.1224841, -0.599386, -2.770917, 0, 1, 0.5568628, 1,
-0.1196321, 0.07571878, -1.146888, 0, 1, 0.5607843, 1,
-0.1193504, 0.1829194, -0.3040439, 0, 1, 0.5686275, 1,
-0.1163086, 0.2657322, 0.7968943, 0, 1, 0.572549, 1,
-0.1149805, 1.085142, 2.148458, 0, 1, 0.5803922, 1,
-0.1141821, 0.1960289, 0.4835207, 0, 1, 0.5843138, 1,
-0.1103357, 0.4378662, 0.3381895, 0, 1, 0.5921569, 1,
-0.1076278, -0.7095153, -1.68641, 0, 1, 0.5960785, 1,
-0.1074844, -0.2214317, -1.759447, 0, 1, 0.6039216, 1,
-0.1070176, 0.378129, 1.516224, 0, 1, 0.6117647, 1,
-0.106182, 0.538325, -0.8312048, 0, 1, 0.6156863, 1,
-0.09824423, 2.321502, -0.4431938, 0, 1, 0.6235294, 1,
-0.09740497, -0.3685122, -2.371308, 0, 1, 0.627451, 1,
-0.09682927, 0.7146803, 1.573976, 0, 1, 0.6352941, 1,
-0.09526909, 1.908427, -0.9426084, 0, 1, 0.6392157, 1,
-0.09461091, -1.979905, -1.493458, 0, 1, 0.6470588, 1,
-0.09166101, 0.864087, -1.298765, 0, 1, 0.6509804, 1,
-0.09117281, 0.03187127, -0.8828412, 0, 1, 0.6588235, 1,
-0.0883669, -0.02430719, -0.9885782, 0, 1, 0.6627451, 1,
-0.08831523, 1.992461, -1.064031, 0, 1, 0.6705883, 1,
-0.08614495, 1.330494, 0.220876, 0, 1, 0.6745098, 1,
-0.08356876, 0.5212862, -1.516562, 0, 1, 0.682353, 1,
-0.08307267, 1.321159, 0.422264, 0, 1, 0.6862745, 1,
-0.07557406, 0.5538719, 0.8791046, 0, 1, 0.6941177, 1,
-0.07476146, -0.8335842, -2.537636, 0, 1, 0.7019608, 1,
-0.07458483, -1.082741, -2.040478, 0, 1, 0.7058824, 1,
-0.07369378, 1.890496, -1.219842, 0, 1, 0.7137255, 1,
-0.07214281, 0.02913914, -2.304906, 0, 1, 0.7176471, 1,
-0.07165149, 0.8478618, -0.5711149, 0, 1, 0.7254902, 1,
-0.071202, -2.018064, -1.430666, 0, 1, 0.7294118, 1,
-0.06763189, 1.366957, -0.6341063, 0, 1, 0.7372549, 1,
-0.06717378, 0.1853796, -0.5145408, 0, 1, 0.7411765, 1,
-0.06657918, 1.696726, -1.329816, 0, 1, 0.7490196, 1,
-0.06162795, -0.3702141, -3.317499, 0, 1, 0.7529412, 1,
-0.05852694, 2.295016, -0.4018509, 0, 1, 0.7607843, 1,
-0.0579554, 0.1370452, -1.692842, 0, 1, 0.7647059, 1,
-0.05417312, -0.4708456, -4.323987, 0, 1, 0.772549, 1,
-0.05364789, -2.571881, -1.261345, 0, 1, 0.7764706, 1,
-0.05343211, -0.1059556, -1.92096, 0, 1, 0.7843137, 1,
-0.05279486, -0.08777679, -2.138376, 0, 1, 0.7882353, 1,
-0.05265162, -1.151833, -2.95903, 0, 1, 0.7960784, 1,
-0.04655702, -0.9689552, -4.269289, 0, 1, 0.8039216, 1,
-0.04507228, -0.6486367, -2.198493, 0, 1, 0.8078431, 1,
-0.04375334, -0.1086806, -2.603936, 0, 1, 0.8156863, 1,
-0.04357924, -1.116745, -0.3857197, 0, 1, 0.8196079, 1,
-0.04225892, 0.387637, 0.6168489, 0, 1, 0.827451, 1,
-0.04199999, -0.8887407, -2.714164, 0, 1, 0.8313726, 1,
-0.03915312, -1.117512, -4.349726, 0, 1, 0.8392157, 1,
-0.03340678, 0.7437279, 1.368332, 0, 1, 0.8431373, 1,
-0.03184409, 0.3278844, -0.9027286, 0, 1, 0.8509804, 1,
-0.01879969, -0.6825305, -2.904179, 0, 1, 0.854902, 1,
-0.01829479, 1.825439, -1.562403, 0, 1, 0.8627451, 1,
-0.01617579, -1.701346, -2.700843, 0, 1, 0.8666667, 1,
-0.01144336, -0.3969181, -1.671321, 0, 1, 0.8745098, 1,
-0.007166459, 0.2860261, -0.9225147, 0, 1, 0.8784314, 1,
-0.006299943, -0.7273791, -0.9307028, 0, 1, 0.8862745, 1,
-0.003558743, 0.3823497, 1.426247, 0, 1, 0.8901961, 1,
-0.001930081, -1.394875, -2.313219, 0, 1, 0.8980392, 1,
-0.001268155, -0.6006582, -4.496414, 0, 1, 0.9058824, 1,
-0.0002516438, 0.8033688, -0.945065, 0, 1, 0.9098039, 1,
0.0005372012, -0.04911234, 2.340483, 0, 1, 0.9176471, 1,
0.003469547, 0.9575385, 0.3478085, 0, 1, 0.9215686, 1,
0.004261739, 0.7732378, -0.137167, 0, 1, 0.9294118, 1,
0.004601437, -1.372391, 3.81377, 0, 1, 0.9333333, 1,
0.006072313, -0.9004978, 3.342776, 0, 1, 0.9411765, 1,
0.007621628, 0.2340465, 0.7908463, 0, 1, 0.945098, 1,
0.0125192, 1.471176, 0.0980413, 0, 1, 0.9529412, 1,
0.0135645, -0.319084, 3.960609, 0, 1, 0.9568627, 1,
0.01573373, -0.2977034, 2.27401, 0, 1, 0.9647059, 1,
0.02041131, 0.9003381, 1.221686, 0, 1, 0.9686275, 1,
0.0204748, -0.8975984, 3.09278, 0, 1, 0.9764706, 1,
0.02051271, 0.6677629, 0.4302662, 0, 1, 0.9803922, 1,
0.02630819, 0.4117106, -0.2045739, 0, 1, 0.9882353, 1,
0.02653741, 0.3555202, 0.1630796, 0, 1, 0.9921569, 1,
0.02872715, -0.3984053, 3.977609, 0, 1, 1, 1,
0.03310579, 1.020611, -0.6964818, 0, 0.9921569, 1, 1,
0.03639503, -0.3695886, 2.994327, 0, 0.9882353, 1, 1,
0.03649506, -1.691781, 2.327796, 0, 0.9803922, 1, 1,
0.03719571, 1.026395, -1.062787, 0, 0.9764706, 1, 1,
0.03863412, 0.5638776, -0.196467, 0, 0.9686275, 1, 1,
0.04136715, 0.4869455, -0.8466527, 0, 0.9647059, 1, 1,
0.0430878, -1.623043, 2.199869, 0, 0.9568627, 1, 1,
0.04334466, -1.62289, 2.869058, 0, 0.9529412, 1, 1,
0.04642212, -0.09274998, 3.764465, 0, 0.945098, 1, 1,
0.04829011, -2.03686, 2.522026, 0, 0.9411765, 1, 1,
0.05305739, 0.9736121, -0.126979, 0, 0.9333333, 1, 1,
0.05699784, -0.2929859, 3.820772, 0, 0.9294118, 1, 1,
0.06035466, 0.1753146, -0.9661897, 0, 0.9215686, 1, 1,
0.06145865, 1.046394, 0.06225722, 0, 0.9176471, 1, 1,
0.06225158, 0.5656283, -0.4907719, 0, 0.9098039, 1, 1,
0.06258146, -0.40829, 3.276872, 0, 0.9058824, 1, 1,
0.06509266, 0.9328967, -0.9298753, 0, 0.8980392, 1, 1,
0.06977683, -0.7796946, 3.238799, 0, 0.8901961, 1, 1,
0.070059, -0.08211522, 4.620094, 0, 0.8862745, 1, 1,
0.07024167, 1.388778, 1.447835, 0, 0.8784314, 1, 1,
0.07204496, -1.091084, 4.703834, 0, 0.8745098, 1, 1,
0.07914892, 1.725493, -0.2509671, 0, 0.8666667, 1, 1,
0.08106797, 0.08403516, 0.9797689, 0, 0.8627451, 1, 1,
0.08948851, -2.506521, 3.039486, 0, 0.854902, 1, 1,
0.09062252, -0.5821236, 1.995676, 0, 0.8509804, 1, 1,
0.09126551, -1.100523, 2.410714, 0, 0.8431373, 1, 1,
0.09428696, 1.476364, -0.5549466, 0, 0.8392157, 1, 1,
0.0947676, 0.5414548, 1.15255, 0, 0.8313726, 1, 1,
0.1001506, 0.7081826, 0.6490251, 0, 0.827451, 1, 1,
0.1028966, -1.305734, 4.477801, 0, 0.8196079, 1, 1,
0.1049674, -0.7747826, 2.548348, 0, 0.8156863, 1, 1,
0.1079496, -1.468095, 3.501521, 0, 0.8078431, 1, 1,
0.109902, 1.297791, -1.270156, 0, 0.8039216, 1, 1,
0.1100613, 0.05325706, -0.08527794, 0, 0.7960784, 1, 1,
0.1135146, 0.8459836, 0.7201273, 0, 0.7882353, 1, 1,
0.1207784, 0.9790155, -2.175658, 0, 0.7843137, 1, 1,
0.1235787, 1.065463, -1.792642, 0, 0.7764706, 1, 1,
0.1274895, -0.4762419, 1.422759, 0, 0.772549, 1, 1,
0.1280379, -0.5327407, 1.442642, 0, 0.7647059, 1, 1,
0.1287199, -0.6441824, 2.721534, 0, 0.7607843, 1, 1,
0.1336368, 0.1079666, 3.006924, 0, 0.7529412, 1, 1,
0.1347954, -2.435435, 4.223053, 0, 0.7490196, 1, 1,
0.1373405, -0.4163891, 1.473589, 0, 0.7411765, 1, 1,
0.1457804, -0.2322554, 0.5758876, 0, 0.7372549, 1, 1,
0.1459727, -0.03177238, -0.9366595, 0, 0.7294118, 1, 1,
0.1496249, -0.9587793, 2.313588, 0, 0.7254902, 1, 1,
0.1502622, 0.2419365, -0.9210191, 0, 0.7176471, 1, 1,
0.1514418, -0.6729959, 3.006201, 0, 0.7137255, 1, 1,
0.1530311, -0.009851598, 0.2513409, 0, 0.7058824, 1, 1,
0.1548474, -1.27033, 3.736406, 0, 0.6980392, 1, 1,
0.1556513, -0.6879598, 2.580961, 0, 0.6941177, 1, 1,
0.1590466, 2.495351, 0.4567638, 0, 0.6862745, 1, 1,
0.1657231, -0.6524981, 2.270263, 0, 0.682353, 1, 1,
0.1665669, -1.619445, 4.60615, 0, 0.6745098, 1, 1,
0.1767337, 2.206747, 0.8159686, 0, 0.6705883, 1, 1,
0.1767991, -1.191631, 3.397722, 0, 0.6627451, 1, 1,
0.18004, -0.8281247, 2.337053, 0, 0.6588235, 1, 1,
0.18093, 1.645079, -0.9159667, 0, 0.6509804, 1, 1,
0.1831842, 0.1720029, 0.2315669, 0, 0.6470588, 1, 1,
0.185752, -1.242094, 1.059859, 0, 0.6392157, 1, 1,
0.1937165, -0.5175841, 4.166837, 0, 0.6352941, 1, 1,
0.194047, -1.790809, 1.867081, 0, 0.627451, 1, 1,
0.1956725, 1.210617, 0.5861102, 0, 0.6235294, 1, 1,
0.1961539, -1.697767, 6.688641, 0, 0.6156863, 1, 1,
0.2011598, 1.138451, -0.1175765, 0, 0.6117647, 1, 1,
0.2028655, 1.073445, 0.38518, 0, 0.6039216, 1, 1,
0.203689, -0.5449429, 3.004441, 0, 0.5960785, 1, 1,
0.2048635, -0.8597711, 3.165984, 0, 0.5921569, 1, 1,
0.2069739, -1.011835, 3.466641, 0, 0.5843138, 1, 1,
0.2135898, -0.08653988, 3.067065, 0, 0.5803922, 1, 1,
0.2168605, -1.018663, 3.65451, 0, 0.572549, 1, 1,
0.2183763, -0.06208651, 2.293141, 0, 0.5686275, 1, 1,
0.2211719, -0.7490491, 2.300587, 0, 0.5607843, 1, 1,
0.2238714, 0.1445478, 1.332491, 0, 0.5568628, 1, 1,
0.2255289, -0.3150632, 0.8674499, 0, 0.5490196, 1, 1,
0.226014, -1.11136, 2.314897, 0, 0.5450981, 1, 1,
0.2267084, 0.2746971, 1.846496, 0, 0.5372549, 1, 1,
0.2282509, 1.186597, 0.8573088, 0, 0.5333334, 1, 1,
0.2377331, -0.2056848, 3.197279, 0, 0.5254902, 1, 1,
0.2383523, -0.648616, 2.610303, 0, 0.5215687, 1, 1,
0.239364, 0.9364523, -0.3183798, 0, 0.5137255, 1, 1,
0.2468296, 1.353661, -2.268092, 0, 0.509804, 1, 1,
0.2504133, -0.0425943, 1.569667, 0, 0.5019608, 1, 1,
0.2562183, -0.7891288, 3.510538, 0, 0.4941176, 1, 1,
0.256794, -0.8756334, 3.509024, 0, 0.4901961, 1, 1,
0.2575398, -2.098149, 5.128461, 0, 0.4823529, 1, 1,
0.2591258, 1.562642, -0.03281138, 0, 0.4784314, 1, 1,
0.2599798, 0.4887638, -0.09127022, 0, 0.4705882, 1, 1,
0.2608618, -0.06602371, 1.147016, 0, 0.4666667, 1, 1,
0.2613123, -0.5683247, 0.7317064, 0, 0.4588235, 1, 1,
0.2642733, -0.2335754, 2.468541, 0, 0.454902, 1, 1,
0.2678332, 0.1252765, 2.107923, 0, 0.4470588, 1, 1,
0.2716949, 0.635915, 1.102184, 0, 0.4431373, 1, 1,
0.2719801, 0.6627797, 0.476582, 0, 0.4352941, 1, 1,
0.2761659, -0.5033451, 2.918195, 0, 0.4313726, 1, 1,
0.2788033, -1.011963, 1.94609, 0, 0.4235294, 1, 1,
0.2790741, -1.822988, 2.577266, 0, 0.4196078, 1, 1,
0.280774, -0.6076022, 1.807252, 0, 0.4117647, 1, 1,
0.2834548, 1.591952, 1.853923, 0, 0.4078431, 1, 1,
0.2926953, -1.984391, 3.411579, 0, 0.4, 1, 1,
0.2942433, 1.419189, 1.401442, 0, 0.3921569, 1, 1,
0.2993118, 0.09639267, -0.506736, 0, 0.3882353, 1, 1,
0.3010148, 0.1701336, 0.4897182, 0, 0.3803922, 1, 1,
0.3014714, -0.2638149, 1.858482, 0, 0.3764706, 1, 1,
0.3019941, 0.08071744, 1.223431, 0, 0.3686275, 1, 1,
0.3032549, 0.3104768, 2.168455, 0, 0.3647059, 1, 1,
0.3061773, -0.4024563, 1.55981, 0, 0.3568628, 1, 1,
0.3085739, -1.047277, 3.83814, 0, 0.3529412, 1, 1,
0.3094872, -0.9927498, 2.143509, 0, 0.345098, 1, 1,
0.3095098, 1.014711, 2.313788, 0, 0.3411765, 1, 1,
0.3115927, 0.203503, 1.497825, 0, 0.3333333, 1, 1,
0.312733, -1.648493, 3.778519, 0, 0.3294118, 1, 1,
0.3130195, 0.3443183, 0.2579435, 0, 0.3215686, 1, 1,
0.3207621, -0.1650332, 1.54567, 0, 0.3176471, 1, 1,
0.3222694, 0.5654541, 0.04840846, 0, 0.3098039, 1, 1,
0.331311, 0.1436487, 1.088586, 0, 0.3058824, 1, 1,
0.3324328, 2.011418, -1.945873, 0, 0.2980392, 1, 1,
0.3338446, -1.040738, 2.876811, 0, 0.2901961, 1, 1,
0.3349256, 0.764119, 1.900831, 0, 0.2862745, 1, 1,
0.3351983, -1.073565, 4.024577, 0, 0.2784314, 1, 1,
0.3376396, -0.2230045, 2.376666, 0, 0.2745098, 1, 1,
0.3382252, 0.2156943, 2.800239, 0, 0.2666667, 1, 1,
0.3390141, 0.06495503, 2.47735, 0, 0.2627451, 1, 1,
0.3414538, 0.4118145, 0.5577644, 0, 0.254902, 1, 1,
0.3421169, 1.370424, 0.3253606, 0, 0.2509804, 1, 1,
0.3430802, 0.839824, -0.828115, 0, 0.2431373, 1, 1,
0.3436242, -1.249328, 3.515989, 0, 0.2392157, 1, 1,
0.3437502, 0.6514559, -0.395881, 0, 0.2313726, 1, 1,
0.3443511, -0.6629308, 2.317174, 0, 0.227451, 1, 1,
0.3513407, -0.8421821, 2.898671, 0, 0.2196078, 1, 1,
0.3523824, 0.1971177, 0.3680794, 0, 0.2156863, 1, 1,
0.353708, -0.542381, 2.669235, 0, 0.2078431, 1, 1,
0.3553519, -0.02674404, 2.164663, 0, 0.2039216, 1, 1,
0.3568178, -0.1249558, 2.497152, 0, 0.1960784, 1, 1,
0.3639419, 1.416034, 0.1372377, 0, 0.1882353, 1, 1,
0.3648725, -1.239255, 1.565436, 0, 0.1843137, 1, 1,
0.3698813, 0.4233062, 2.796175, 0, 0.1764706, 1, 1,
0.3698828, 3.217213, -0.2957929, 0, 0.172549, 1, 1,
0.3729002, 0.2716636, 0.5477326, 0, 0.1647059, 1, 1,
0.3764865, 0.8217242, 0.02202063, 0, 0.1607843, 1, 1,
0.3789757, 0.3605821, 2.996423, 0, 0.1529412, 1, 1,
0.3847599, -1.7799, 3.206324, 0, 0.1490196, 1, 1,
0.3862627, 0.7693346, 1.535229, 0, 0.1411765, 1, 1,
0.4003505, -1.072232, 3.327726, 0, 0.1372549, 1, 1,
0.4005166, 1.336248, 0.6253897, 0, 0.1294118, 1, 1,
0.4030313, -1.204026, 2.484706, 0, 0.1254902, 1, 1,
0.4043019, 0.6325423, -1.278968, 0, 0.1176471, 1, 1,
0.4061624, 0.1035575, 0.9017878, 0, 0.1137255, 1, 1,
0.406769, -0.7793686, 4.088892, 0, 0.1058824, 1, 1,
0.4115062, 1.957965, 1.52505, 0, 0.09803922, 1, 1,
0.4120519, 0.7812921, 1.142936, 0, 0.09411765, 1, 1,
0.4157225, 1.67385, 0.1617366, 0, 0.08627451, 1, 1,
0.4307307, -0.9451605, 1.975186, 0, 0.08235294, 1, 1,
0.4334965, 0.2863328, 2.563873, 0, 0.07450981, 1, 1,
0.4350941, 3.010582, -1.112323, 0, 0.07058824, 1, 1,
0.4361233, -0.07116336, 0.6237419, 0, 0.0627451, 1, 1,
0.4394037, -0.2160278, 1.173787, 0, 0.05882353, 1, 1,
0.440683, 0.728251, -0.06529751, 0, 0.05098039, 1, 1,
0.4488241, -0.02174215, 2.36578, 0, 0.04705882, 1, 1,
0.4565267, -0.2250123, 2.389153, 0, 0.03921569, 1, 1,
0.4581574, -0.05725127, 1.161344, 0, 0.03529412, 1, 1,
0.4608948, 2.17672, 0.8600137, 0, 0.02745098, 1, 1,
0.4627935, 0.4044027, 1.548342, 0, 0.02352941, 1, 1,
0.4637097, 1.024481, 0.8251582, 0, 0.01568628, 1, 1,
0.4728729, 0.6594972, 1.285473, 0, 0.01176471, 1, 1,
0.4736161, -0.3814534, 2.763178, 0, 0.003921569, 1, 1,
0.4818601, -0.6013496, 1.888711, 0.003921569, 0, 1, 1,
0.4827575, 0.1996113, 0.7409983, 0.007843138, 0, 1, 1,
0.4882079, 0.1454004, 1.117182, 0.01568628, 0, 1, 1,
0.493783, 0.03987424, 1.249467, 0.01960784, 0, 1, 1,
0.4939256, 0.5313463, 2.208313, 0.02745098, 0, 1, 1,
0.4999726, -0.6939684, 3.270549, 0.03137255, 0, 1, 1,
0.5010876, 0.4700225, 0.8177425, 0.03921569, 0, 1, 1,
0.5042729, 0.9630177, 1.593534, 0.04313726, 0, 1, 1,
0.5070037, -1.125912, 2.458637, 0.05098039, 0, 1, 1,
0.5074851, -1.113602, 2.788445, 0.05490196, 0, 1, 1,
0.5082082, -0.3883757, 0.3348263, 0.0627451, 0, 1, 1,
0.5127413, -0.2275081, 1.370767, 0.06666667, 0, 1, 1,
0.519763, 0.6260848, 0.5844585, 0.07450981, 0, 1, 1,
0.5220189, 0.1728705, 0.8626038, 0.07843138, 0, 1, 1,
0.5222456, -0.2388875, 2.784398, 0.08627451, 0, 1, 1,
0.5301636, 0.3562412, 0.6923521, 0.09019608, 0, 1, 1,
0.5302842, 0.648114, 2.03009, 0.09803922, 0, 1, 1,
0.5348513, -0.08678985, 2.783918, 0.1058824, 0, 1, 1,
0.5362402, 1.683425, 2.060808, 0.1098039, 0, 1, 1,
0.5394439, 1.200814, 0.1476855, 0.1176471, 0, 1, 1,
0.5439675, 0.4518173, 2.546439, 0.1215686, 0, 1, 1,
0.5441552, 2.414907, 0.3279613, 0.1294118, 0, 1, 1,
0.5470185, -0.9546371, 1.808787, 0.1333333, 0, 1, 1,
0.5485966, -0.4022708, 0.7743489, 0.1411765, 0, 1, 1,
0.5492733, 0.4122218, 0.4475968, 0.145098, 0, 1, 1,
0.5514998, 0.8748151, 1.879586, 0.1529412, 0, 1, 1,
0.5536599, 0.5411394, 1.148031, 0.1568628, 0, 1, 1,
0.5540929, 0.1731075, 0.09620851, 0.1647059, 0, 1, 1,
0.5576731, 0.7469937, 0.1231352, 0.1686275, 0, 1, 1,
0.5586686, 1.293885, -0.1063792, 0.1764706, 0, 1, 1,
0.5592774, -0.1612291, 0.8417242, 0.1803922, 0, 1, 1,
0.5595092, -1.377571, 1.779657, 0.1882353, 0, 1, 1,
0.5607294, 0.2958495, -0.1960741, 0.1921569, 0, 1, 1,
0.563534, 1.09174, -0.464662, 0.2, 0, 1, 1,
0.5637556, -0.8464017, 2.851915, 0.2078431, 0, 1, 1,
0.571031, -0.4577617, 2.214376, 0.2117647, 0, 1, 1,
0.5749152, 0.4110776, 3.08298, 0.2196078, 0, 1, 1,
0.5897229, 0.4879321, 0.3077379, 0.2235294, 0, 1, 1,
0.5949128, 0.365856, 0.8031777, 0.2313726, 0, 1, 1,
0.5954397, -2.196504, 2.928871, 0.2352941, 0, 1, 1,
0.5966398, 1.009191, 1.848384, 0.2431373, 0, 1, 1,
0.5975993, -1.765419, 1.811415, 0.2470588, 0, 1, 1,
0.6007537, -0.1390227, 3.66822, 0.254902, 0, 1, 1,
0.6025155, 1.095143, 0.5318311, 0.2588235, 0, 1, 1,
0.6025647, -0.7663924, 2.714857, 0.2666667, 0, 1, 1,
0.606031, -0.5018566, 1.916543, 0.2705882, 0, 1, 1,
0.6078752, -0.97788, 2.616234, 0.2784314, 0, 1, 1,
0.6135424, 0.9376517, -1.128004, 0.282353, 0, 1, 1,
0.6150805, 1.350467, 1.4602, 0.2901961, 0, 1, 1,
0.6161895, -0.7962059, 1.591389, 0.2941177, 0, 1, 1,
0.6186749, 0.1745193, 1.418499, 0.3019608, 0, 1, 1,
0.6270452, -0.04503276, 2.349222, 0.3098039, 0, 1, 1,
0.629009, 0.09319678, 0.3673441, 0.3137255, 0, 1, 1,
0.6298707, -1.281252, 3.052773, 0.3215686, 0, 1, 1,
0.6369075, 1.100127, 1.452556, 0.3254902, 0, 1, 1,
0.6467144, 0.2526676, 2.210722, 0.3333333, 0, 1, 1,
0.6484284, -0.6209877, 3.088234, 0.3372549, 0, 1, 1,
0.6525263, 0.0687774, 1.297714, 0.345098, 0, 1, 1,
0.6558856, 0.2597204, 1.374172, 0.3490196, 0, 1, 1,
0.6598504, 1.175404, 1.304441, 0.3568628, 0, 1, 1,
0.6613162, -0.07590283, 2.22951, 0.3607843, 0, 1, 1,
0.6614475, 0.2432631, 2.085136, 0.3686275, 0, 1, 1,
0.6661189, 0.685789, 0.9515917, 0.372549, 0, 1, 1,
0.6687636, 1.229992, 0.05235036, 0.3803922, 0, 1, 1,
0.6726668, -1.388723, 4.334416, 0.3843137, 0, 1, 1,
0.6752856, -0.401908, 0.6556031, 0.3921569, 0, 1, 1,
0.6761842, 0.1514837, 0.4396357, 0.3960784, 0, 1, 1,
0.6775935, -1.503087, 4.650029, 0.4039216, 0, 1, 1,
0.677898, 1.42573, -0.1176221, 0.4117647, 0, 1, 1,
0.6792119, -0.4223577, 2.22786, 0.4156863, 0, 1, 1,
0.6844535, -1.360146, 4.553226, 0.4235294, 0, 1, 1,
0.6883559, 0.566554, 0.01333579, 0.427451, 0, 1, 1,
0.6916015, -2.192677, 3.464653, 0.4352941, 0, 1, 1,
0.6929848, -0.9709148, 2.169401, 0.4392157, 0, 1, 1,
0.6996561, -0.1609045, 0.5142443, 0.4470588, 0, 1, 1,
0.7012173, -0.4437901, 1.504631, 0.4509804, 0, 1, 1,
0.7016429, 0.2068856, 1.604621, 0.4588235, 0, 1, 1,
0.7044393, -0.3857526, 2.72867, 0.4627451, 0, 1, 1,
0.7067892, -0.9959181, 2.443898, 0.4705882, 0, 1, 1,
0.7096849, -1.255119, 2.858608, 0.4745098, 0, 1, 1,
0.7161194, 0.0005701306, 0.2909066, 0.4823529, 0, 1, 1,
0.7183064, -0.3118734, 1.054545, 0.4862745, 0, 1, 1,
0.7185384, -0.4595341, 3.723578, 0.4941176, 0, 1, 1,
0.7216471, 1.868769, 1.476091, 0.5019608, 0, 1, 1,
0.7220588, -0.3131806, 2.028594, 0.5058824, 0, 1, 1,
0.7251663, 1.574583, -0.3958622, 0.5137255, 0, 1, 1,
0.7312413, -0.5124044, 1.949419, 0.5176471, 0, 1, 1,
0.7373707, 0.6886328, 0.5880189, 0.5254902, 0, 1, 1,
0.7379332, -0.4859797, 3.155245, 0.5294118, 0, 1, 1,
0.7458869, 0.5805795, 0.03966503, 0.5372549, 0, 1, 1,
0.7492151, -0.9986963, 2.348795, 0.5411765, 0, 1, 1,
0.7511103, 1.256304, -1.3054, 0.5490196, 0, 1, 1,
0.7519228, 0.4747452, 1.987324, 0.5529412, 0, 1, 1,
0.7534291, 1.046817, 1.044393, 0.5607843, 0, 1, 1,
0.7555951, 0.313089, 1.642028, 0.5647059, 0, 1, 1,
0.7573337, -1.445659, 1.466423, 0.572549, 0, 1, 1,
0.7598584, -0.7933704, 3.166394, 0.5764706, 0, 1, 1,
0.760533, 1.240182, 1.465371, 0.5843138, 0, 1, 1,
0.7683122, 0.9067077, 1.174556, 0.5882353, 0, 1, 1,
0.7887483, 0.4952698, 0.9694557, 0.5960785, 0, 1, 1,
0.7911965, 0.2047916, 0.8101401, 0.6039216, 0, 1, 1,
0.8024981, 0.1683829, 2.383433, 0.6078432, 0, 1, 1,
0.8061686, 1.123667, 3.115418, 0.6156863, 0, 1, 1,
0.8191692, 1.596492, 0.01064235, 0.6196079, 0, 1, 1,
0.8199108, -3.984705, 1.954473, 0.627451, 0, 1, 1,
0.8347337, 1.31207, -0.3203555, 0.6313726, 0, 1, 1,
0.8369347, 0.480595, 4.082239, 0.6392157, 0, 1, 1,
0.838644, 0.5055599, 1.09605, 0.6431373, 0, 1, 1,
0.8434422, -0.1879063, 2.343508, 0.6509804, 0, 1, 1,
0.8447999, -0.4507114, 1.086442, 0.654902, 0, 1, 1,
0.8451427, -0.3387658, 1.386573, 0.6627451, 0, 1, 1,
0.8474158, -0.8121231, 1.683419, 0.6666667, 0, 1, 1,
0.852532, 1.804819, -0.2133182, 0.6745098, 0, 1, 1,
0.8540078, 0.2246612, 0.7029699, 0.6784314, 0, 1, 1,
0.8551619, -0.09230839, 1.434952, 0.6862745, 0, 1, 1,
0.8555979, 0.4944667, -0.8281552, 0.6901961, 0, 1, 1,
0.8565623, 1.454374, -0.4578794, 0.6980392, 0, 1, 1,
0.8593663, -0.6869437, 2.789125, 0.7058824, 0, 1, 1,
0.8623723, -0.07426573, 0.7013313, 0.7098039, 0, 1, 1,
0.8633035, 0.8230453, 0.8962975, 0.7176471, 0, 1, 1,
0.8667917, -0.243198, 2.089139, 0.7215686, 0, 1, 1,
0.8681848, -0.05298704, 0.5569078, 0.7294118, 0, 1, 1,
0.8686874, 1.552721, 1.920059, 0.7333333, 0, 1, 1,
0.872023, -0.2684942, 3.170807, 0.7411765, 0, 1, 1,
0.8738442, 1.082422, 0.8138884, 0.7450981, 0, 1, 1,
0.8792686, -0.5604845, 0.9500806, 0.7529412, 0, 1, 1,
0.8803669, 0.7518954, 0.8240517, 0.7568628, 0, 1, 1,
0.8820571, -0.4794465, 1.132927, 0.7647059, 0, 1, 1,
0.8839399, -0.5477835, 1.112637, 0.7686275, 0, 1, 1,
0.8859242, 1.788591, 1.466614, 0.7764706, 0, 1, 1,
0.8917778, -3.657319, 2.261955, 0.7803922, 0, 1, 1,
0.8947376, -0.6955728, 2.787467, 0.7882353, 0, 1, 1,
0.9073528, -1.517832, 4.690271, 0.7921569, 0, 1, 1,
0.9259975, 0.4369584, 0.1612686, 0.8, 0, 1, 1,
0.9274023, 0.05659801, 3.553888, 0.8078431, 0, 1, 1,
0.9300122, 0.2798173, 0.8735715, 0.8117647, 0, 1, 1,
0.9481569, -1.104973, -0.06090713, 0.8196079, 0, 1, 1,
0.9483438, 1.076254, 1.161462, 0.8235294, 0, 1, 1,
0.949306, -0.1581178, 2.122175, 0.8313726, 0, 1, 1,
0.9526771, -0.6799303, 2.489868, 0.8352941, 0, 1, 1,
0.9560052, -0.5555063, 2.997267, 0.8431373, 0, 1, 1,
0.9656556, 0.8150503, 1.323348, 0.8470588, 0, 1, 1,
0.969743, 1.101275, 0.8527769, 0.854902, 0, 1, 1,
0.9717889, -2.192934, 1.810233, 0.8588235, 0, 1, 1,
0.9928677, 2.352546, 0.702554, 0.8666667, 0, 1, 1,
0.9975183, 1.083024, 0.2938541, 0.8705882, 0, 1, 1,
0.99989, -0.1126437, 1.058012, 0.8784314, 0, 1, 1,
1.00058, 0.08610258, 0.7180393, 0.8823529, 0, 1, 1,
1.000789, 2.804482, -0.335858, 0.8901961, 0, 1, 1,
1.001158, 1.018816, -0.6369393, 0.8941177, 0, 1, 1,
1.004921, -0.02560405, 1.557515, 0.9019608, 0, 1, 1,
1.006286, -0.6400837, 1.751639, 0.9098039, 0, 1, 1,
1.006473, 0.5921053, 1.336759, 0.9137255, 0, 1, 1,
1.00754, -0.07320148, 3.174397, 0.9215686, 0, 1, 1,
1.010609, -1.86766, 2.147176, 0.9254902, 0, 1, 1,
1.020052, -0.122459, 1.861197, 0.9333333, 0, 1, 1,
1.031142, -0.4132165, 4.075963, 0.9372549, 0, 1, 1,
1.035785, 2.600823, -0.4828117, 0.945098, 0, 1, 1,
1.052114, -0.4751271, 1.317171, 0.9490196, 0, 1, 1,
1.052502, 1.832147, 0.2070467, 0.9568627, 0, 1, 1,
1.054178, -0.4913228, 2.579448, 0.9607843, 0, 1, 1,
1.061157, -0.1785297, 1.333995, 0.9686275, 0, 1, 1,
1.061826, 0.2488905, 1.686251, 0.972549, 0, 1, 1,
1.065661, -2.750225, 3.817034, 0.9803922, 0, 1, 1,
1.066141, -0.6302245, 1.899151, 0.9843137, 0, 1, 1,
1.066944, -1.027233, 3.713115, 0.9921569, 0, 1, 1,
1.067217, -1.479616, 4.610413, 0.9960784, 0, 1, 1,
1.074721, -1.185543, 3.561435, 1, 0, 0.9960784, 1,
1.076649, 0.05918739, 2.467723, 1, 0, 0.9882353, 1,
1.077469, -0.6668699, 2.958431, 1, 0, 0.9843137, 1,
1.08006, -0.03731265, 3.640673, 1, 0, 0.9764706, 1,
1.080495, -0.5360883, 2.312454, 1, 0, 0.972549, 1,
1.080535, 0.2887235, 1.372738, 1, 0, 0.9647059, 1,
1.081892, -0.9906474, 1.651108, 1, 0, 0.9607843, 1,
1.083083, -2.363286, 1.488069, 1, 0, 0.9529412, 1,
1.089071, 0.9926375, 2.448512, 1, 0, 0.9490196, 1,
1.091619, 1.116926, -0.9883266, 1, 0, 0.9411765, 1,
1.091671, -1.463635, 4.373428, 1, 0, 0.9372549, 1,
1.09305, 0.07998467, 2.360815, 1, 0, 0.9294118, 1,
1.093786, 0.1867015, 1.85394, 1, 0, 0.9254902, 1,
1.095183, 2.370246, 0.4377438, 1, 0, 0.9176471, 1,
1.099127, 0.580136, 1.462273, 1, 0, 0.9137255, 1,
1.099257, -0.3508411, 1.942085, 1, 0, 0.9058824, 1,
1.110114, 0.2925974, 1.241393, 1, 0, 0.9019608, 1,
1.11673, -1.329521, 2.016464, 1, 0, 0.8941177, 1,
1.120435, 0.4872121, 0.3984197, 1, 0, 0.8862745, 1,
1.122516, 1.049394, -0.6835933, 1, 0, 0.8823529, 1,
1.129061, -1.196804, 3.481385, 1, 0, 0.8745098, 1,
1.12988, -1.69462, 3.605495, 1, 0, 0.8705882, 1,
1.132787, 0.9755695, 1.358539, 1, 0, 0.8627451, 1,
1.144552, 1.288512, 1.252895, 1, 0, 0.8588235, 1,
1.153115, 0.5345306, 2.180842, 1, 0, 0.8509804, 1,
1.167408, 0.9870229, 1.42791, 1, 0, 0.8470588, 1,
1.169466, -0.4204841, 1.175086, 1, 0, 0.8392157, 1,
1.171172, -1.287999, 3.253037, 1, 0, 0.8352941, 1,
1.172374, -0.3232164, 2.130479, 1, 0, 0.827451, 1,
1.197637, -0.6537765, 3.062381, 1, 0, 0.8235294, 1,
1.200706, 0.8760172, 1.406942, 1, 0, 0.8156863, 1,
1.205728, -0.7823281, 1.252547, 1, 0, 0.8117647, 1,
1.208393, 0.8111107, 2.572934, 1, 0, 0.8039216, 1,
1.212062, -0.4742446, 2.140759, 1, 0, 0.7960784, 1,
1.212599, -1.254529, 2.258308, 1, 0, 0.7921569, 1,
1.220061, 2.695202, -0.4485815, 1, 0, 0.7843137, 1,
1.221157, -0.2861504, 2.550461, 1, 0, 0.7803922, 1,
1.223608, 0.1353537, 1.869092, 1, 0, 0.772549, 1,
1.231739, 0.3159202, 1.60559, 1, 0, 0.7686275, 1,
1.234069, 0.8180286, 2.76258, 1, 0, 0.7607843, 1,
1.251462, 0.3135819, 2.454736, 1, 0, 0.7568628, 1,
1.254068, -1.205114, 1.699854, 1, 0, 0.7490196, 1,
1.268751, -0.008519966, 0.9576355, 1, 0, 0.7450981, 1,
1.285235, -0.9723545, 0.8845353, 1, 0, 0.7372549, 1,
1.290615, 1.582362, 2.675627, 1, 0, 0.7333333, 1,
1.295302, -0.7586058, 2.723353, 1, 0, 0.7254902, 1,
1.303121, -0.5340246, 4.815835, 1, 0, 0.7215686, 1,
1.307957, -0.1242077, 0.1985101, 1, 0, 0.7137255, 1,
1.310625, -2.491799, 1.848862, 1, 0, 0.7098039, 1,
1.311364, 0.5952669, 1.389136, 1, 0, 0.7019608, 1,
1.316704, 1.311372, 1.317252, 1, 0, 0.6941177, 1,
1.322163, -0.7614422, 2.396287, 1, 0, 0.6901961, 1,
1.326809, -0.08182144, 1.85586, 1, 0, 0.682353, 1,
1.330065, -0.190088, 1.900336, 1, 0, 0.6784314, 1,
1.331478, -1.301402, 2.270849, 1, 0, 0.6705883, 1,
1.33511, 0.5243549, 1.304412, 1, 0, 0.6666667, 1,
1.338424, 0.9976485, 1.157608, 1, 0, 0.6588235, 1,
1.351504, -0.3407181, 0.1447586, 1, 0, 0.654902, 1,
1.364805, -0.3862759, 1.739754, 1, 0, 0.6470588, 1,
1.367876, -2.221773, 3.062459, 1, 0, 0.6431373, 1,
1.385441, -0.2988289, 2.953768, 1, 0, 0.6352941, 1,
1.391927, -1.583086, 1.474764, 1, 0, 0.6313726, 1,
1.403525, -0.6153836, 1.478169, 1, 0, 0.6235294, 1,
1.406301, -0.3661496, -0.3011046, 1, 0, 0.6196079, 1,
1.413817, 1.018119, -0.1390212, 1, 0, 0.6117647, 1,
1.41543, -0.9401823, 2.111118, 1, 0, 0.6078432, 1,
1.41677, -1.288402, 3.872798, 1, 0, 0.6, 1,
1.422819, 0.3416543, 1.613528, 1, 0, 0.5921569, 1,
1.423112, 0.732789, 1.894887, 1, 0, 0.5882353, 1,
1.423475, 1.264344, 0.008181556, 1, 0, 0.5803922, 1,
1.42646, 2.019798, 1.39472, 1, 0, 0.5764706, 1,
1.430761, 0.3981732, 1.149178, 1, 0, 0.5686275, 1,
1.440736, 0.2034979, 2.116464, 1, 0, 0.5647059, 1,
1.443763, 0.1839483, 0.7995861, 1, 0, 0.5568628, 1,
1.445614, 0.471516, 1.58089, 1, 0, 0.5529412, 1,
1.44755, -1.723156, 1.942557, 1, 0, 0.5450981, 1,
1.449199, 1.20254, 0.2245125, 1, 0, 0.5411765, 1,
1.45182, 2.091591, -0.3443831, 1, 0, 0.5333334, 1,
1.458963, -0.7816483, 3.642152, 1, 0, 0.5294118, 1,
1.471264, -1.825257, 2.469015, 1, 0, 0.5215687, 1,
1.474015, -0.3811854, 1.023431, 1, 0, 0.5176471, 1,
1.474017, -1.081276, 2.350779, 1, 0, 0.509804, 1,
1.48411, 1.252973, -0.1882993, 1, 0, 0.5058824, 1,
1.485161, -1.668375, 3.967288, 1, 0, 0.4980392, 1,
1.490313, -2.053391, 3.930229, 1, 0, 0.4901961, 1,
1.496936, 0.6420429, 1.632297, 1, 0, 0.4862745, 1,
1.498331, 0.142978, 1.004731, 1, 0, 0.4784314, 1,
1.500633, 0.2993104, 0.8313153, 1, 0, 0.4745098, 1,
1.507591, 2.109378, 0.9017986, 1, 0, 0.4666667, 1,
1.508887, -0.1838616, 0.5923572, 1, 0, 0.4627451, 1,
1.509231, 0.966105, 1.655075, 1, 0, 0.454902, 1,
1.523483, -0.1803806, -0.5631869, 1, 0, 0.4509804, 1,
1.54017, 2.210178, 1.184294, 1, 0, 0.4431373, 1,
1.547644, -0.3323145, 2.183248, 1, 0, 0.4392157, 1,
1.549515, 2.105291, 0.4135877, 1, 0, 0.4313726, 1,
1.563087, 0.1871837, 0.4583667, 1, 0, 0.427451, 1,
1.566944, -1.37519, 2.390647, 1, 0, 0.4196078, 1,
1.574101, 0.2059764, 1.686442, 1, 0, 0.4156863, 1,
1.59751, 0.8988665, 2.178449, 1, 0, 0.4078431, 1,
1.602492, 0.7816761, 1.230756, 1, 0, 0.4039216, 1,
1.606103, 1.599328, 2.169075, 1, 0, 0.3960784, 1,
1.606145, 0.4882304, 0.3320864, 1, 0, 0.3882353, 1,
1.63631, 0.8672354, 0.4030604, 1, 0, 0.3843137, 1,
1.657228, -1.457001, 2.953766, 1, 0, 0.3764706, 1,
1.665031, -0.3331349, 2.306773, 1, 0, 0.372549, 1,
1.672066, 0.279263, -0.2934159, 1, 0, 0.3647059, 1,
1.676061, 0.8249948, 1.562177, 1, 0, 0.3607843, 1,
1.6777, -0.7748597, 0.8095068, 1, 0, 0.3529412, 1,
1.68248, -0.4554833, 1.024987, 1, 0, 0.3490196, 1,
1.690052, 1.118894, 1.009759, 1, 0, 0.3411765, 1,
1.70197, -0.4916543, -0.3428277, 1, 0, 0.3372549, 1,
1.703738, 1.362611, -1.299544, 1, 0, 0.3294118, 1,
1.735663, -0.8411217, 2.068417, 1, 0, 0.3254902, 1,
1.736914, -0.531325, 1.641668, 1, 0, 0.3176471, 1,
1.770499, 0.3878149, 2.916036, 1, 0, 0.3137255, 1,
1.790795, 1.427571, 3.747453, 1, 0, 0.3058824, 1,
1.805473, 0.9200459, 2.171862, 1, 0, 0.2980392, 1,
1.80763, 1.383522, 0.8632901, 1, 0, 0.2941177, 1,
1.824368, 2.033295, 1.585067, 1, 0, 0.2862745, 1,
1.828951, -0.2835186, 2.291213, 1, 0, 0.282353, 1,
1.829053, 0.2264278, -0.6699077, 1, 0, 0.2745098, 1,
1.83944, -1.356628, 1.484449, 1, 0, 0.2705882, 1,
1.868294, 0.04092918, 2.707235, 1, 0, 0.2627451, 1,
1.873, -0.1523816, 1.279529, 1, 0, 0.2588235, 1,
1.883678, -0.3767313, 2.556413, 1, 0, 0.2509804, 1,
1.88453, -1.043288, -0.2331504, 1, 0, 0.2470588, 1,
1.885738, 0.8228714, 1.387059, 1, 0, 0.2392157, 1,
1.885975, -0.2958509, 1.850705, 1, 0, 0.2352941, 1,
1.890831, 0.4213557, 1.823906, 1, 0, 0.227451, 1,
1.890854, 1.418745, 2.302444, 1, 0, 0.2235294, 1,
1.896204, -1.922551, 2.110674, 1, 0, 0.2156863, 1,
1.90528, -0.8876052, 2.455187, 1, 0, 0.2117647, 1,
1.929795, 2.532912, -0.4601943, 1, 0, 0.2039216, 1,
1.932131, 0.1551628, 0.3651368, 1, 0, 0.1960784, 1,
1.936913, -1.000264, 3.588048, 1, 0, 0.1921569, 1,
1.938102, 1.284981, 1.498362, 1, 0, 0.1843137, 1,
1.966237, -0.2890541, 0.3379888, 1, 0, 0.1803922, 1,
2.012517, -1.128051, 2.54341, 1, 0, 0.172549, 1,
2.060551, -2.167943, 1.61408, 1, 0, 0.1686275, 1,
2.067592, -1.08211, 1.194396, 1, 0, 0.1607843, 1,
2.07849, -0.4425074, 2.433919, 1, 0, 0.1568628, 1,
2.120017, -0.001603441, 1.588401, 1, 0, 0.1490196, 1,
2.179637, 0.7352057, 0.8334753, 1, 0, 0.145098, 1,
2.192171, -0.9855747, 1.816763, 1, 0, 0.1372549, 1,
2.196488, -0.3840993, 1.37954, 1, 0, 0.1333333, 1,
2.20635, 0.2907059, 2.852979, 1, 0, 0.1254902, 1,
2.241343, -0.3667127, 1.250344, 1, 0, 0.1215686, 1,
2.290985, 0.6458169, 1.658331, 1, 0, 0.1137255, 1,
2.35129, 0.4468498, 1.814517, 1, 0, 0.1098039, 1,
2.403685, 1.264855, 0.9147582, 1, 0, 0.1019608, 1,
2.417397, -0.7415402, 1.366672, 1, 0, 0.09411765, 1,
2.422986, 0.7511044, 2.611928, 1, 0, 0.09019608, 1,
2.428772, 0.2242477, 0.7191794, 1, 0, 0.08235294, 1,
2.644933, -1.881544, 0.7532164, 1, 0, 0.07843138, 1,
2.688281, -1.465433, 0.1063937, 1, 0, 0.07058824, 1,
2.689819, 0.4265637, 1.613853, 1, 0, 0.06666667, 1,
2.719135, -0.1180124, 2.775893, 1, 0, 0.05882353, 1,
2.759539, 0.9122937, 1.003279, 1, 0, 0.05490196, 1,
2.780006, -2.746397, 1.964272, 1, 0, 0.04705882, 1,
2.810776, -0.4242902, 3.654408, 1, 0, 0.04313726, 1,
2.890279, 0.5943716, 0.329078, 1, 0, 0.03529412, 1,
2.940208, -0.1479707, 1.856665, 1, 0, 0.03137255, 1,
3.269534, -1.680554, 3.448044, 1, 0, 0.02352941, 1,
3.413294, -0.0914337, -0.4755246, 1, 0, 0.01960784, 1,
3.477119, 1.205676, 2.353626, 1, 0, 0.01176471, 1,
3.633275, 1.41249, 1.822613, 1, 0, 0.007843138, 1
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
0.2165649, -5.20543, -7.239684, 0, -0.5, 0.5, 0.5,
0.2165649, -5.20543, -7.239684, 1, -0.5, 0.5, 0.5,
0.2165649, -5.20543, -7.239684, 1, 1.5, 0.5, 0.5,
0.2165649, -5.20543, -7.239684, 0, 1.5, 0.5, 0.5
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
-4.35841, -0.3837458, -7.239684, 0, -0.5, 0.5, 0.5,
-4.35841, -0.3837458, -7.239684, 1, -0.5, 0.5, 0.5,
-4.35841, -0.3837458, -7.239684, 1, 1.5, 0.5, 0.5,
-4.35841, -0.3837458, -7.239684, 0, 1.5, 0.5, 0.5
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
-4.35841, -5.20543, 0.7338204, 0, -0.5, 0.5, 0.5,
-4.35841, -5.20543, 0.7338204, 1, -0.5, 0.5, 0.5,
-4.35841, -5.20543, 0.7338204, 1, 1.5, 0.5, 0.5,
-4.35841, -5.20543, 0.7338204, 0, 1.5, 0.5, 0.5
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
-3, -4.092733, -5.399644,
3, -4.092733, -5.399644,
-3, -4.092733, -5.399644,
-3, -4.278183, -5.706317,
-2, -4.092733, -5.399644,
-2, -4.278183, -5.706317,
-1, -4.092733, -5.399644,
-1, -4.278183, -5.706317,
0, -4.092733, -5.399644,
0, -4.278183, -5.706317,
1, -4.092733, -5.399644,
1, -4.278183, -5.706317,
2, -4.092733, -5.399644,
2, -4.278183, -5.706317,
3, -4.092733, -5.399644,
3, -4.278183, -5.706317
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
-3, -4.649082, -6.319664, 0, -0.5, 0.5, 0.5,
-3, -4.649082, -6.319664, 1, -0.5, 0.5, 0.5,
-3, -4.649082, -6.319664, 1, 1.5, 0.5, 0.5,
-3, -4.649082, -6.319664, 0, 1.5, 0.5, 0.5,
-2, -4.649082, -6.319664, 0, -0.5, 0.5, 0.5,
-2, -4.649082, -6.319664, 1, -0.5, 0.5, 0.5,
-2, -4.649082, -6.319664, 1, 1.5, 0.5, 0.5,
-2, -4.649082, -6.319664, 0, 1.5, 0.5, 0.5,
-1, -4.649082, -6.319664, 0, -0.5, 0.5, 0.5,
-1, -4.649082, -6.319664, 1, -0.5, 0.5, 0.5,
-1, -4.649082, -6.319664, 1, 1.5, 0.5, 0.5,
-1, -4.649082, -6.319664, 0, 1.5, 0.5, 0.5,
0, -4.649082, -6.319664, 0, -0.5, 0.5, 0.5,
0, -4.649082, -6.319664, 1, -0.5, 0.5, 0.5,
0, -4.649082, -6.319664, 1, 1.5, 0.5, 0.5,
0, -4.649082, -6.319664, 0, 1.5, 0.5, 0.5,
1, -4.649082, -6.319664, 0, -0.5, 0.5, 0.5,
1, -4.649082, -6.319664, 1, -0.5, 0.5, 0.5,
1, -4.649082, -6.319664, 1, 1.5, 0.5, 0.5,
1, -4.649082, -6.319664, 0, 1.5, 0.5, 0.5,
2, -4.649082, -6.319664, 0, -0.5, 0.5, 0.5,
2, -4.649082, -6.319664, 1, -0.5, 0.5, 0.5,
2, -4.649082, -6.319664, 1, 1.5, 0.5, 0.5,
2, -4.649082, -6.319664, 0, 1.5, 0.5, 0.5,
3, -4.649082, -6.319664, 0, -0.5, 0.5, 0.5,
3, -4.649082, -6.319664, 1, -0.5, 0.5, 0.5,
3, -4.649082, -6.319664, 1, 1.5, 0.5, 0.5,
3, -4.649082, -6.319664, 0, 1.5, 0.5, 0.5
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
-3.302646, -2, -5.399644,
-3.302646, 2, -5.399644,
-3.302646, -2, -5.399644,
-3.478607, -2, -5.706317,
-3.302646, 0, -5.399644,
-3.478607, 0, -5.706317,
-3.302646, 2, -5.399644,
-3.478607, 2, -5.706317
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
-3.830528, -2, -6.319664, 0, -0.5, 0.5, 0.5,
-3.830528, -2, -6.319664, 1, -0.5, 0.5, 0.5,
-3.830528, -2, -6.319664, 1, 1.5, 0.5, 0.5,
-3.830528, -2, -6.319664, 0, 1.5, 0.5, 0.5,
-3.830528, 0, -6.319664, 0, -0.5, 0.5, 0.5,
-3.830528, 0, -6.319664, 1, -0.5, 0.5, 0.5,
-3.830528, 0, -6.319664, 1, 1.5, 0.5, 0.5,
-3.830528, 0, -6.319664, 0, 1.5, 0.5, 0.5,
-3.830528, 2, -6.319664, 0, -0.5, 0.5, 0.5,
-3.830528, 2, -6.319664, 1, -0.5, 0.5, 0.5,
-3.830528, 2, -6.319664, 1, 1.5, 0.5, 0.5,
-3.830528, 2, -6.319664, 0, 1.5, 0.5, 0.5
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
-3.302646, -4.092733, -4,
-3.302646, -4.092733, 6,
-3.302646, -4.092733, -4,
-3.478607, -4.278183, -4,
-3.302646, -4.092733, -2,
-3.478607, -4.278183, -2,
-3.302646, -4.092733, 0,
-3.478607, -4.278183, 0,
-3.302646, -4.092733, 2,
-3.478607, -4.278183, 2,
-3.302646, -4.092733, 4,
-3.478607, -4.278183, 4,
-3.302646, -4.092733, 6,
-3.478607, -4.278183, 6
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
"4",
"6"
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
-3.830528, -4.649082, -4, 0, -0.5, 0.5, 0.5,
-3.830528, -4.649082, -4, 1, -0.5, 0.5, 0.5,
-3.830528, -4.649082, -4, 1, 1.5, 0.5, 0.5,
-3.830528, -4.649082, -4, 0, 1.5, 0.5, 0.5,
-3.830528, -4.649082, -2, 0, -0.5, 0.5, 0.5,
-3.830528, -4.649082, -2, 1, -0.5, 0.5, 0.5,
-3.830528, -4.649082, -2, 1, 1.5, 0.5, 0.5,
-3.830528, -4.649082, -2, 0, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 0, 0, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 0, 1, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 0, 1, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 0, 0, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 2, 0, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 2, 1, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 2, 1, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 2, 0, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 4, 0, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 4, 1, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 4, 1, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 4, 0, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 6, 0, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 6, 1, -0.5, 0.5, 0.5,
-3.830528, -4.649082, 6, 1, 1.5, 0.5, 0.5,
-3.830528, -4.649082, 6, 0, 1.5, 0.5, 0.5
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
-3.302646, -4.092733, -5.399644,
-3.302646, 3.325242, -5.399644,
-3.302646, -4.092733, 6.867285,
-3.302646, 3.325242, 6.867285,
-3.302646, -4.092733, -5.399644,
-3.302646, -4.092733, 6.867285,
-3.302646, 3.325242, -5.399644,
-3.302646, 3.325242, 6.867285,
-3.302646, -4.092733, -5.399644,
3.735776, -4.092733, -5.399644,
-3.302646, -4.092733, 6.867285,
3.735776, -4.092733, 6.867285,
-3.302646, 3.325242, -5.399644,
3.735776, 3.325242, -5.399644,
-3.302646, 3.325242, 6.867285,
3.735776, 3.325242, 6.867285,
3.735776, -4.092733, -5.399644,
3.735776, 3.325242, -5.399644,
3.735776, -4.092733, 6.867285,
3.735776, 3.325242, 6.867285,
3.735776, -4.092733, -5.399644,
3.735776, -4.092733, 6.867285,
3.735776, 3.325242, -5.399644,
3.735776, 3.325242, 6.867285
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
var radius = 8.52771;
var distance = 37.94074;
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
mvMatrix.translate( -0.2165649, 0.3837458, -0.7338204 );
mvMatrix.scale( 1.309999, 1.242971, 0.751641 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.94074);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
nitralin<-read.table("nitralin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nitralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
```

```r
y<-nitralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
```

```r
z<-nitralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
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
-3.200145, -0.8456722, -0.2371416, 0, 0, 1, 1, 1,
-3.082311, -0.6519048, -1.493082, 1, 0, 0, 1, 1,
-2.708795, -1.080487, -2.766456, 1, 0, 0, 1, 1,
-2.586428, -0.513372, -4.211147, 1, 0, 0, 1, 1,
-2.388623, -0.2139937, -2.237471, 1, 0, 0, 1, 1,
-2.1395, -0.2363915, -2.515307, 1, 0, 0, 1, 1,
-2.093131, -0.9974681, -3.138587, 0, 0, 0, 1, 1,
-2.083785, -0.2978453, -3.432551, 0, 0, 0, 1, 1,
-2.061079, -1.039098, -1.47217, 0, 0, 0, 1, 1,
-2.039058, 0.5614116, -0.6079618, 0, 0, 0, 1, 1,
-1.990966, 0.6405599, -1.890839, 0, 0, 0, 1, 1,
-1.967504, 1.15771, -0.5816894, 0, 0, 0, 1, 1,
-1.965495, 0.1628609, -1.617555, 0, 0, 0, 1, 1,
-1.940211, 1.086406, -1.426292, 1, 1, 1, 1, 1,
-1.933695, -0.3050257, -2.274784, 1, 1, 1, 1, 1,
-1.919912, -0.7081334, -2.225061, 1, 1, 1, 1, 1,
-1.916993, 0.5979855, -1.155424, 1, 1, 1, 1, 1,
-1.912068, 1.444816, -1.338052, 1, 1, 1, 1, 1,
-1.906286, 0.3108702, -0.6695573, 1, 1, 1, 1, 1,
-1.884095, -0.3446369, -2.763682, 1, 1, 1, 1, 1,
-1.874885, 0.45264, 0.4682031, 1, 1, 1, 1, 1,
-1.830831, 0.2925933, -1.520178, 1, 1, 1, 1, 1,
-1.797766, -0.8060748, -0.8883063, 1, 1, 1, 1, 1,
-1.795267, -0.06039391, -1.054388, 1, 1, 1, 1, 1,
-1.792361, 0.08514143, -1.831693, 1, 1, 1, 1, 1,
-1.762509, 0.195509, -0.9531581, 1, 1, 1, 1, 1,
-1.759024, -0.2020582, -2.284983, 1, 1, 1, 1, 1,
-1.737462, -0.7995779, -2.894527, 1, 1, 1, 1, 1,
-1.732252, 0.2019233, -3.289466, 0, 0, 1, 1, 1,
-1.697706, -1.06406, -2.709734, 1, 0, 0, 1, 1,
-1.655808, -0.4783967, -3.586807, 1, 0, 0, 1, 1,
-1.649601, -0.1731035, -2.513772, 1, 0, 0, 1, 1,
-1.649272, 0.9144622, -1.433209, 1, 0, 0, 1, 1,
-1.646184, -0.4468361, -1.276348, 1, 0, 0, 1, 1,
-1.603346, -1.069039, -1.859308, 0, 0, 0, 1, 1,
-1.559019, -1.219943, -2.34795, 0, 0, 0, 1, 1,
-1.554313, 1.303996, -1.325141, 0, 0, 0, 1, 1,
-1.537104, -0.0527134, -0.6185936, 0, 0, 0, 1, 1,
-1.518597, 0.4024851, -0.3856217, 0, 0, 0, 1, 1,
-1.503825, -0.195485, -2.111666, 0, 0, 0, 1, 1,
-1.496308, -0.3702445, -1.938894, 0, 0, 0, 1, 1,
-1.478481, -1.932434, -3.20892, 1, 1, 1, 1, 1,
-1.466265, 0.4213156, -1.514744, 1, 1, 1, 1, 1,
-1.463268, 0.3366684, -0.4164437, 1, 1, 1, 1, 1,
-1.461116, 0.06049684, -1.008363, 1, 1, 1, 1, 1,
-1.458584, -0.7004089, -2.158883, 1, 1, 1, 1, 1,
-1.449825, -1.457953, -2.905358, 1, 1, 1, 1, 1,
-1.447956, 1.374367, -0.3547104, 1, 1, 1, 1, 1,
-1.432795, -1.345466, -1.687002, 1, 1, 1, 1, 1,
-1.423503, 0.5659491, -0.6515995, 1, 1, 1, 1, 1,
-1.423454, 0.6776058, 1.991758, 1, 1, 1, 1, 1,
-1.419621, 0.1637398, -3.145931, 1, 1, 1, 1, 1,
-1.412618, 1.31266, 1.451179, 1, 1, 1, 1, 1,
-1.383015, -0.1071403, -0.7829701, 1, 1, 1, 1, 1,
-1.381092, -0.743578, -2.869986, 1, 1, 1, 1, 1,
-1.376056, -0.2603212, -0.4029187, 1, 1, 1, 1, 1,
-1.375658, -1.670098, -3.037179, 0, 0, 1, 1, 1,
-1.371453, -3.013122, -3.337762, 1, 0, 0, 1, 1,
-1.367659, -0.2290317, -3.076907, 1, 0, 0, 1, 1,
-1.359349, 0.6530355, -0.8877326, 1, 0, 0, 1, 1,
-1.35106, 1.207179, -0.1645286, 1, 0, 0, 1, 1,
-1.336568, -1.120859, -2.266784, 1, 0, 0, 1, 1,
-1.32646, 0.2560746, -0.661338, 0, 0, 0, 1, 1,
-1.325498, 0.3102102, -2.55357, 0, 0, 0, 1, 1,
-1.312529, 0.7644901, -1.789234, 0, 0, 0, 1, 1,
-1.303102, -1.194894, -2.164092, 0, 0, 0, 1, 1,
-1.30269, -1.579198, -3.953456, 0, 0, 0, 1, 1,
-1.29322, -0.9544153, -3.921587, 0, 0, 0, 1, 1,
-1.282789, 1.086907, -1.022691, 0, 0, 0, 1, 1,
-1.263454, -0.05158392, -0.5865902, 1, 1, 1, 1, 1,
-1.238788, -0.07936217, -1.009524, 1, 1, 1, 1, 1,
-1.235333, -0.7260404, -1.374439, 1, 1, 1, 1, 1,
-1.232277, 1.46364, -2.738386, 1, 1, 1, 1, 1,
-1.231263, 1.556634, 0.6414506, 1, 1, 1, 1, 1,
-1.227066, -0.6192327, -2.467254, 1, 1, 1, 1, 1,
-1.221291, -0.1899071, -1.213063, 1, 1, 1, 1, 1,
-1.217315, 0.7580429, -0.01205026, 1, 1, 1, 1, 1,
-1.216897, 0.6278706, -0.3393584, 1, 1, 1, 1, 1,
-1.208938, 0.2390029, -0.498005, 1, 1, 1, 1, 1,
-1.207238, -0.9193782, -2.043518, 1, 1, 1, 1, 1,
-1.204784, 0.2279185, -2.154088, 1, 1, 1, 1, 1,
-1.20375, -0.7430857, -1.220911, 1, 1, 1, 1, 1,
-1.19894, -0.2353034, -2.11265, 1, 1, 1, 1, 1,
-1.197942, 0.0220619, -2.200326, 1, 1, 1, 1, 1,
-1.196149, -0.113444, -3.559309, 0, 0, 1, 1, 1,
-1.195077, 0.05571203, -0.1280926, 1, 0, 0, 1, 1,
-1.187243, 0.1702808, -1.206526, 1, 0, 0, 1, 1,
-1.176368, 0.5604005, -1.154266, 1, 0, 0, 1, 1,
-1.172888, -0.1029554, -1.247401, 1, 0, 0, 1, 1,
-1.172116, 1.306409, -0.9827338, 1, 0, 0, 1, 1,
-1.165717, 1.393333, -0.9026104, 0, 0, 0, 1, 1,
-1.147398, 0.551564, 0.277848, 0, 0, 0, 1, 1,
-1.141039, -2.165092, -2.440041, 0, 0, 0, 1, 1,
-1.140118, -0.4619448, -0.5498633, 0, 0, 0, 1, 1,
-1.14001, 0.3984458, -1.553108, 0, 0, 0, 1, 1,
-1.13938, 1.933001, 0.1443136, 0, 0, 0, 1, 1,
-1.137521, 0.2367898, -0.3087853, 0, 0, 0, 1, 1,
-1.131542, -2.089052, -2.477796, 1, 1, 1, 1, 1,
-1.114139, 1.173513, 1.161199, 1, 1, 1, 1, 1,
-1.111969, 0.641935, -0.9019591, 1, 1, 1, 1, 1,
-1.110206, 1.442564, -0.5600752, 1, 1, 1, 1, 1,
-1.109831, -0.4100837, -1.238377, 1, 1, 1, 1, 1,
-1.107325, 1.444622, -0.6643192, 1, 1, 1, 1, 1,
-1.107048, -0.4147035, -1.976925, 1, 1, 1, 1, 1,
-1.104068, -0.9421455, -2.285342, 1, 1, 1, 1, 1,
-1.103832, -0.8365216, -1.671524, 1, 1, 1, 1, 1,
-1.100804, -3.159778, -3.576747, 1, 1, 1, 1, 1,
-1.100534, -1.390958, -2.855296, 1, 1, 1, 1, 1,
-1.097426, -0.7899711, -3.623595, 1, 1, 1, 1, 1,
-1.091283, -0.7312812, -3.770387, 1, 1, 1, 1, 1,
-1.090635, -0.8015033, -1.482372, 1, 1, 1, 1, 1,
-1.085232, 0.482066, -0.7956895, 1, 1, 1, 1, 1,
-1.083117, -1.319685, -0.8453984, 0, 0, 1, 1, 1,
-1.070091, 1.358518, 0.03048255, 1, 0, 0, 1, 1,
-1.0572, 0.182998, -2.465295, 1, 0, 0, 1, 1,
-1.054094, -0.7758824, -1.314586, 1, 0, 0, 1, 1,
-1.05132, 0.6860284, -1.235331, 1, 0, 0, 1, 1,
-1.045255, -0.2058242, -1.761457, 1, 0, 0, 1, 1,
-1.042373, 0.5091059, -0.2918568, 0, 0, 0, 1, 1,
-1.041031, -1.630318, -1.663873, 0, 0, 0, 1, 1,
-1.03179, 1.997027, -0.2568314, 0, 0, 0, 1, 1,
-1.02905, -1.254094, -5.221, 0, 0, 0, 1, 1,
-1.022138, 0.7192847, -1.508294, 0, 0, 0, 1, 1,
-1.012313, -0.5033357, -1.951784, 0, 0, 0, 1, 1,
-1.006944, 1.30846, -1.879775, 0, 0, 0, 1, 1,
-1.004916, 0.6417418, -0.4980083, 1, 1, 1, 1, 1,
-1.003859, 0.444513, -1.547644, 1, 1, 1, 1, 1,
-1.003807, -0.6522067, -2.141065, 1, 1, 1, 1, 1,
-1.001947, 0.8420886, 1.824935, 1, 1, 1, 1, 1,
-1.001534, -1.275161, -4.794463, 1, 1, 1, 1, 1,
-0.989791, 1.671959, -0.93363, 1, 1, 1, 1, 1,
-0.9872305, 0.1826365, -1.914544, 1, 1, 1, 1, 1,
-0.9829972, 1.290291, 0.5442133, 1, 1, 1, 1, 1,
-0.968828, 0.614976, 1.612505, 1, 1, 1, 1, 1,
-0.9669414, 0.4665831, -0.2278597, 1, 1, 1, 1, 1,
-0.963824, -0.2264961, -0.8292593, 1, 1, 1, 1, 1,
-0.9624241, -0.3982258, -2.470574, 1, 1, 1, 1, 1,
-0.960559, 1.275741, -1.362708, 1, 1, 1, 1, 1,
-0.9552731, -0.4540435, -2.477291, 1, 1, 1, 1, 1,
-0.9542048, 0.6731614, -0.4634983, 1, 1, 1, 1, 1,
-0.9539148, -0.3439869, -1.4948, 0, 0, 1, 1, 1,
-0.9497515, -1.244087, -3.52516, 1, 0, 0, 1, 1,
-0.9472002, -1.052608, -2.738935, 1, 0, 0, 1, 1,
-0.9439878, 1.137103, -0.06842938, 1, 0, 0, 1, 1,
-0.9363883, -0.3063936, 0.8802505, 1, 0, 0, 1, 1,
-0.9303651, 0.8445117, -1.215247, 1, 0, 0, 1, 1,
-0.9264655, -3.241586, -4.127854, 0, 0, 0, 1, 1,
-0.9260406, -0.2725355, -2.456548, 0, 0, 0, 1, 1,
-0.925281, -1.313199, -2.948521, 0, 0, 0, 1, 1,
-0.9239323, 0.9667981, 1.44155, 0, 0, 0, 1, 1,
-0.9225855, -0.2050711, -2.789362, 0, 0, 0, 1, 1,
-0.9178032, 0.3065591, -1.18224, 0, 0, 0, 1, 1,
-0.9139252, -0.6693127, -2.449312, 0, 0, 0, 1, 1,
-0.912948, -0.9544095, -1.492747, 1, 1, 1, 1, 1,
-0.9121348, 0.3760321, -0.3786062, 1, 1, 1, 1, 1,
-0.9111606, -1.830487, -1.757204, 1, 1, 1, 1, 1,
-0.9053509, 0.5897422, -0.9384071, 1, 1, 1, 1, 1,
-0.896523, -2.240916, -2.584587, 1, 1, 1, 1, 1,
-0.8953047, 1.150623, -1.197881, 1, 1, 1, 1, 1,
-0.8860635, -0.1945346, -3.789636, 1, 1, 1, 1, 1,
-0.8801409, 2.142925, -0.1857252, 1, 1, 1, 1, 1,
-0.8790335, -0.3718626, -2.525599, 1, 1, 1, 1, 1,
-0.874339, 1.010704, -0.6575484, 1, 1, 1, 1, 1,
-0.873998, 1.749634, -0.4467639, 1, 1, 1, 1, 1,
-0.8711952, -0.09751707, -1.975665, 1, 1, 1, 1, 1,
-0.8689901, -0.2327258, -1.255702, 1, 1, 1, 1, 1,
-0.8679855, 0.9081033, 1.004001, 1, 1, 1, 1, 1,
-0.8617516, -0.9447288, -2.215393, 1, 1, 1, 1, 1,
-0.8490162, -0.937954, -3.629844, 0, 0, 1, 1, 1,
-0.8464242, -1.478514, -2.787159, 1, 0, 0, 1, 1,
-0.8375566, -0.09742101, -0.1756608, 1, 0, 0, 1, 1,
-0.8360237, 0.414412, -0.6672587, 1, 0, 0, 1, 1,
-0.8345515, 0.7476215, -0.8630801, 1, 0, 0, 1, 1,
-0.8328404, -0.224233, -2.321241, 1, 0, 0, 1, 1,
-0.8212838, -2.550345, -3.53925, 0, 0, 0, 1, 1,
-0.8206313, -0.6609768, -2.862207, 0, 0, 0, 1, 1,
-0.8166414, 1.181285, 0.3161694, 0, 0, 0, 1, 1,
-0.8106268, -0.409669, -1.277597, 0, 0, 0, 1, 1,
-0.8096073, 0.7961627, -2.753967, 0, 0, 0, 1, 1,
-0.8083174, 1.90372, 0.08305539, 0, 0, 0, 1, 1,
-0.80753, -0.3771757, -1.360605, 0, 0, 0, 1, 1,
-0.8060864, 0.5711313, -0.4896292, 1, 1, 1, 1, 1,
-0.8025945, 0.9738998, -0.5523504, 1, 1, 1, 1, 1,
-0.7976295, -0.5007604, -1.07378, 1, 1, 1, 1, 1,
-0.7970989, -0.4039379, -0.8517485, 1, 1, 1, 1, 1,
-0.7967671, -0.2684553, -1.853477, 1, 1, 1, 1, 1,
-0.795997, -0.3571513, -2.879546, 1, 1, 1, 1, 1,
-0.7953708, 0.7541801, -0.5296974, 1, 1, 1, 1, 1,
-0.792869, -1.381916, -4.628579, 1, 1, 1, 1, 1,
-0.7863442, 0.7807556, -0.4966288, 1, 1, 1, 1, 1,
-0.784361, 1.21572, -0.3371533, 1, 1, 1, 1, 1,
-0.7818022, -0.2861264, -0.899867, 1, 1, 1, 1, 1,
-0.7795893, 0.8462133, -1.675937, 1, 1, 1, 1, 1,
-0.7739531, 1.088061, -0.8017971, 1, 1, 1, 1, 1,
-0.7679726, -2.14142, -1.824368, 1, 1, 1, 1, 1,
-0.7664167, 1.289883, -1.169873, 1, 1, 1, 1, 1,
-0.7623274, -0.9754447, -1.801185, 0, 0, 1, 1, 1,
-0.7605457, 0.6175376, -1.04636, 1, 0, 0, 1, 1,
-0.7494851, -0.1316757, -3.766042, 1, 0, 0, 1, 1,
-0.740545, 0.5663334, -0.4078051, 1, 0, 0, 1, 1,
-0.7403001, 1.392212, 0.5256262, 1, 0, 0, 1, 1,
-0.7391194, -0.9134091, -3.696365, 1, 0, 0, 1, 1,
-0.7372525, 1.611834, -0.7390872, 0, 0, 0, 1, 1,
-0.737121, -0.9575436, -2.37349, 0, 0, 0, 1, 1,
-0.7340307, -1.036149, -3.689618, 0, 0, 0, 1, 1,
-0.7315816, -0.2013991, -1.158831, 0, 0, 0, 1, 1,
-0.7300826, 1.587044, -0.1475637, 0, 0, 0, 1, 1,
-0.7182094, 0.7411293, -0.7147702, 0, 0, 0, 1, 1,
-0.7140531, -0.7953188, -1.985155, 0, 0, 0, 1, 1,
-0.706569, -0.1449291, -1.58136, 1, 1, 1, 1, 1,
-0.7061354, 0.8723199, -1.480465, 1, 1, 1, 1, 1,
-0.702871, -1.169363, -2.826528, 1, 1, 1, 1, 1,
-0.7009111, -0.3271667, -0.9171745, 1, 1, 1, 1, 1,
-0.7000214, -1.103334, -3.56708, 1, 1, 1, 1, 1,
-0.6925073, -0.2359205, -1.877307, 1, 1, 1, 1, 1,
-0.6924292, 0.61409, -2.065798, 1, 1, 1, 1, 1,
-0.6883433, -0.4119391, -3.048245, 1, 1, 1, 1, 1,
-0.6855711, -0.2647227, -1.467523, 1, 1, 1, 1, 1,
-0.6845601, -0.2346177, -2.911219, 1, 1, 1, 1, 1,
-0.6765732, -0.09537008, -1.685491, 1, 1, 1, 1, 1,
-0.6751927, -0.6473333, -2.500271, 1, 1, 1, 1, 1,
-0.6692649, -0.8781945, -2.465156, 1, 1, 1, 1, 1,
-0.6689715, -0.3110779, -1.256859, 1, 1, 1, 1, 1,
-0.6676211, 0.1851658, -1.358953, 1, 1, 1, 1, 1,
-0.6663056, -1.123249, -2.217365, 0, 0, 1, 1, 1,
-0.6660246, -0.9228038, -3.264328, 1, 0, 0, 1, 1,
-0.664366, 0.25536, -2.363579, 1, 0, 0, 1, 1,
-0.6605662, 0.1576555, -0.272597, 1, 0, 0, 1, 1,
-0.6598793, 0.6677209, -0.9169979, 1, 0, 0, 1, 1,
-0.6558611, -0.289919, -4.047695, 1, 0, 0, 1, 1,
-0.6545144, -0.07670962, -1.95656, 0, 0, 0, 1, 1,
-0.6538499, -0.4400328, -1.357095, 0, 0, 0, 1, 1,
-0.6515259, -0.132493, -1.899053, 0, 0, 0, 1, 1,
-0.6474974, 0.2626418, -2.033782, 0, 0, 0, 1, 1,
-0.6452509, 0.4419031, -2.13839, 0, 0, 0, 1, 1,
-0.6445644, 0.4850343, -2.176393, 0, 0, 0, 1, 1,
-0.6441399, -0.2412149, -1.677366, 0, 0, 0, 1, 1,
-0.6390068, -0.1474831, 0.106629, 1, 1, 1, 1, 1,
-0.635444, -0.9301262, -3.272448, 1, 1, 1, 1, 1,
-0.6340118, 0.09157017, -2.838902, 1, 1, 1, 1, 1,
-0.6328655, -0.4557042, -3.483936, 1, 1, 1, 1, 1,
-0.6312099, -1.20602, -0.4395703, 1, 1, 1, 1, 1,
-0.6301149, 0.6897665, -0.008061936, 1, 1, 1, 1, 1,
-0.6266397, 1.847601, -0.09851578, 1, 1, 1, 1, 1,
-0.6260162, -0.8296759, -4.17729, 1, 1, 1, 1, 1,
-0.6219844, -0.4929195, -1.150555, 1, 1, 1, 1, 1,
-0.6199798, -1.541425, -1.96833, 1, 1, 1, 1, 1,
-0.6197649, 0.5622097, -0.9554694, 1, 1, 1, 1, 1,
-0.6188853, -0.04681055, -3.627806, 1, 1, 1, 1, 1,
-0.6095304, 0.655084, -0.8311399, 1, 1, 1, 1, 1,
-0.6065716, 2.595135, -1.553572, 1, 1, 1, 1, 1,
-0.5992774, -1.628995, -4.199713, 1, 1, 1, 1, 1,
-0.5991532, -0.01609174, -2.179343, 0, 0, 1, 1, 1,
-0.5958778, -1.044545, -2.231406, 1, 0, 0, 1, 1,
-0.5956544, 0.8863173, 0.5244058, 1, 0, 0, 1, 1,
-0.5936249, -1.071275, -2.941689, 1, 0, 0, 1, 1,
-0.5934449, 2.236521, 0.5089161, 1, 0, 0, 1, 1,
-0.593299, 0.2810775, -1.997805, 1, 0, 0, 1, 1,
-0.5897703, 1.313784, -0.6592689, 0, 0, 0, 1, 1,
-0.5894732, -0.03460619, -0.7038406, 0, 0, 0, 1, 1,
-0.588273, -0.9835808, -3.593764, 0, 0, 0, 1, 1,
-0.5855065, -0.1376684, -1.312643, 0, 0, 0, 1, 1,
-0.5793642, -0.3028501, -1.798313, 0, 0, 0, 1, 1,
-0.5774377, -0.7846352, -3.472838, 0, 0, 0, 1, 1,
-0.5754367, 0.03117365, -2.794399, 0, 0, 0, 1, 1,
-0.5746797, -0.06241706, -1.573918, 1, 1, 1, 1, 1,
-0.572997, 0.5677144, -1.150879, 1, 1, 1, 1, 1,
-0.5716644, -0.07381166, -2.574622, 1, 1, 1, 1, 1,
-0.5710494, 1.336141, -1.640502, 1, 1, 1, 1, 1,
-0.5682508, -0.6352176, -1.757779, 1, 1, 1, 1, 1,
-0.562632, -0.1916665, -2.913705, 1, 1, 1, 1, 1,
-0.5620062, -0.8961443, -2.849719, 1, 1, 1, 1, 1,
-0.5590237, -0.1931754, -1.60439, 1, 1, 1, 1, 1,
-0.5415009, 0.6085207, -0.9836217, 1, 1, 1, 1, 1,
-0.5305463, -2.440336, -3.584883, 1, 1, 1, 1, 1,
-0.5284323, -0.7827092, -3.495538, 1, 1, 1, 1, 1,
-0.5230163, -0.4027789, -4.273599, 1, 1, 1, 1, 1,
-0.5162101, 0.9084101, -0.4483819, 1, 1, 1, 1, 1,
-0.5153441, -0.6884692, -2.510313, 1, 1, 1, 1, 1,
-0.5136136, 1.051064, -1.865034, 1, 1, 1, 1, 1,
-0.5134037, -0.636156, -2.282008, 0, 0, 1, 1, 1,
-0.5132242, 0.4003644, -0.4302937, 1, 0, 0, 1, 1,
-0.5130733, -0.7084228, -2.360026, 1, 0, 0, 1, 1,
-0.5093934, -1.506877, -1.509429, 1, 0, 0, 1, 1,
-0.5076916, 1.365073, -1.660885, 1, 0, 0, 1, 1,
-0.5065948, 1.012253, -2.684389, 1, 0, 0, 1, 1,
-0.5048938, 0.7721187, 0.7094243, 0, 0, 0, 1, 1,
-0.5032544, -1.3488, -1.404318, 0, 0, 0, 1, 1,
-0.5021933, -0.3698179, -0.70783, 0, 0, 0, 1, 1,
-0.4997568, -0.2268929, -1.314516, 0, 0, 0, 1, 1,
-0.4975092, -0.9010357, -2.298478, 0, 0, 0, 1, 1,
-0.4962103, -0.6578677, -2.416097, 0, 0, 0, 1, 1,
-0.4956394, 1.088968, -0.3945905, 0, 0, 0, 1, 1,
-0.4930928, -0.165331, -0.5656897, 1, 1, 1, 1, 1,
-0.4904796, 0.6097274, -0.587315, 1, 1, 1, 1, 1,
-0.4900301, -2.234266, -2.581541, 1, 1, 1, 1, 1,
-0.4888435, 1.209469, -1.077911, 1, 1, 1, 1, 1,
-0.4849427, -1.118439, -0.5196553, 1, 1, 1, 1, 1,
-0.4765086, 2.057196, -0.5942764, 1, 1, 1, 1, 1,
-0.4728763, 1.183833, -0.7165828, 1, 1, 1, 1, 1,
-0.471027, -0.1856298, -2.829605, 1, 1, 1, 1, 1,
-0.4706819, -0.9568471, -4.040704, 1, 1, 1, 1, 1,
-0.4691374, 0.4047293, -0.9177865, 1, 1, 1, 1, 1,
-0.4688845, -1.977051, -2.412068, 1, 1, 1, 1, 1,
-0.4646218, -1.525608, -3.390224, 1, 1, 1, 1, 1,
-0.4613518, 1.413491, -0.1313042, 1, 1, 1, 1, 1,
-0.4569914, -0.9677451, -1.331563, 1, 1, 1, 1, 1,
-0.4556623, -1.357438, -2.606147, 1, 1, 1, 1, 1,
-0.4524445, 0.4799323, 0.5306691, 0, 0, 1, 1, 1,
-0.4519246, 0.2251908, -1.289846, 1, 0, 0, 1, 1,
-0.4513973, -0.6599548, -3.013301, 1, 0, 0, 1, 1,
-0.4443536, 0.8612956, -1.447257, 1, 0, 0, 1, 1,
-0.441284, -0.6945168, -3.268741, 1, 0, 0, 1, 1,
-0.4405864, 0.4642048, 0.1134722, 1, 0, 0, 1, 1,
-0.4375278, 0.4836944, -0.9490595, 0, 0, 0, 1, 1,
-0.4366035, 0.574243, -0.2898575, 0, 0, 0, 1, 1,
-0.4349817, 0.4480646, -2.385251, 0, 0, 0, 1, 1,
-0.4342743, 0.4715562, -2.054483, 0, 0, 0, 1, 1,
-0.4319371, 0.6886322, -0.110295, 0, 0, 0, 1, 1,
-0.4254531, -1.204884, -2.044928, 0, 0, 0, 1, 1,
-0.4244309, 1.402604, 0.6441385, 0, 0, 0, 1, 1,
-0.4164153, -0.1389892, -1.469615, 1, 1, 1, 1, 1,
-0.4108525, 2.048977, -0.833277, 1, 1, 1, 1, 1,
-0.4067586, 0.9614035, -0.1185399, 1, 1, 1, 1, 1,
-0.4049468, 0.3807901, 0.1895237, 1, 1, 1, 1, 1,
-0.4047402, 0.5815134, -1.148775, 1, 1, 1, 1, 1,
-0.3992516, -1.129448, -2.936564, 1, 1, 1, 1, 1,
-0.3957117, 0.4306572, -1.962676, 1, 1, 1, 1, 1,
-0.394, 0.6475511, 0.973905, 1, 1, 1, 1, 1,
-0.3834379, 0.6989255, -1.148815, 1, 1, 1, 1, 1,
-0.3812449, -1.778064, -4.879221, 1, 1, 1, 1, 1,
-0.3802134, 0.5609217, 1.369944, 1, 1, 1, 1, 1,
-0.3765554, 0.09623876, -1.316134, 1, 1, 1, 1, 1,
-0.3732209, -1.217901, -2.97388, 1, 1, 1, 1, 1,
-0.3730035, 1.320522, -0.5370032, 1, 1, 1, 1, 1,
-0.3705708, -1.709508, -3.774599, 1, 1, 1, 1, 1,
-0.3673175, -1.181381, -1.806428, 0, 0, 1, 1, 1,
-0.3667108, -1.05844, -2.463821, 1, 0, 0, 1, 1,
-0.3653379, 0.5739299, 0.250795, 1, 0, 0, 1, 1,
-0.3630693, -0.3880108, -1.418952, 1, 0, 0, 1, 1,
-0.3624642, -0.3732026, -3.410157, 1, 0, 0, 1, 1,
-0.3592253, 0.0877891, -1.817173, 1, 0, 0, 1, 1,
-0.3541938, 0.7177088, -0.04110093, 0, 0, 0, 1, 1,
-0.3494964, 0.4055986, 1.21274, 0, 0, 0, 1, 1,
-0.3464189, 0.649043, -1.031426, 0, 0, 0, 1, 1,
-0.3438452, 0.3431292, -0.5891953, 0, 0, 0, 1, 1,
-0.3387036, -0.8441256, -3.315245, 0, 0, 0, 1, 1,
-0.3348462, 1.400358, -0.9112831, 0, 0, 0, 1, 1,
-0.3273713, 1.129312, 0.85227, 0, 0, 0, 1, 1,
-0.3272893, 1.394295, 1.955519, 1, 1, 1, 1, 1,
-0.3272184, 0.1659399, -1.575355, 1, 1, 1, 1, 1,
-0.3256776, 1.157382, -0.5008357, 1, 1, 1, 1, 1,
-0.3228581, -0.4026222, -4.0463, 1, 1, 1, 1, 1,
-0.3227497, -0.9986838, -3.924171, 1, 1, 1, 1, 1,
-0.3214454, 0.3746346, 0.03732533, 1, 1, 1, 1, 1,
-0.321329, 0.9013097, 1.25474, 1, 1, 1, 1, 1,
-0.3204196, -1.262165, -3.579584, 1, 1, 1, 1, 1,
-0.3199285, -0.4055285, -4.179643, 1, 1, 1, 1, 1,
-0.3124581, -0.1805429, -1.105016, 1, 1, 1, 1, 1,
-0.3109004, -0.2510457, -2.571337, 1, 1, 1, 1, 1,
-0.30961, -1.922132, -3.379419, 1, 1, 1, 1, 1,
-0.2999047, -1.150008, -3.049473, 1, 1, 1, 1, 1,
-0.2993467, 1.023674, -0.3374277, 1, 1, 1, 1, 1,
-0.2958997, 1.183252, 0.5468082, 1, 1, 1, 1, 1,
-0.2904165, 0.2840764, -1.65718, 0, 0, 1, 1, 1,
-0.2878935, 0.2547498, 1.069287, 1, 0, 0, 1, 1,
-0.287215, -1.153412, -1.083408, 1, 0, 0, 1, 1,
-0.2868184, 0.04659823, -2.705088, 1, 0, 0, 1, 1,
-0.2843167, -1.641861, -4.307445, 1, 0, 0, 1, 1,
-0.2794947, 1.224023, -0.8361039, 1, 0, 0, 1, 1,
-0.2726485, -0.2555782, -2.142426, 0, 0, 0, 1, 1,
-0.2701278, -0.08126302, -3.342373, 0, 0, 0, 1, 1,
-0.2629766, -0.3943777, -0.9198207, 0, 0, 0, 1, 1,
-0.2591934, 1.999056, -0.462713, 0, 0, 0, 1, 1,
-0.2589469, 2.442934, 0.1476956, 0, 0, 0, 1, 1,
-0.2573423, 1.275321, 1.017393, 0, 0, 0, 1, 1,
-0.2568646, 1.067672, -0.1506721, 0, 0, 0, 1, 1,
-0.2544932, -0.3422304, -2.414814, 1, 1, 1, 1, 1,
-0.254121, 0.1861567, -0.7866077, 1, 1, 1, 1, 1,
-0.2491463, 0.440268, -0.2426855, 1, 1, 1, 1, 1,
-0.2472224, -1.628902, -1.791346, 1, 1, 1, 1, 1,
-0.2446423, 0.1709321, -0.201539, 1, 1, 1, 1, 1,
-0.2420275, -0.3474248, -3.019261, 1, 1, 1, 1, 1,
-0.2358931, -0.9579989, -2.285256, 1, 1, 1, 1, 1,
-0.2287245, -0.3956841, -1.745121, 1, 1, 1, 1, 1,
-0.2214544, 0.2665021, -0.1496513, 1, 1, 1, 1, 1,
-0.2205231, 0.3409947, -0.369926, 1, 1, 1, 1, 1,
-0.2197122, 0.3325483, 0.3277188, 1, 1, 1, 1, 1,
-0.2173508, -0.3257337, 0.4264375, 1, 1, 1, 1, 1,
-0.2169254, -0.6515712, -3.081471, 1, 1, 1, 1, 1,
-0.213551, 0.1990306, -1.3671, 1, 1, 1, 1, 1,
-0.2133667, 1.308453, 1.091348, 1, 1, 1, 1, 1,
-0.2124607, -1.130331, -2.044605, 0, 0, 1, 1, 1,
-0.2120677, 1.079667, -0.3162577, 1, 0, 0, 1, 1,
-0.2106955, 1.99643, -0.7105777, 1, 0, 0, 1, 1,
-0.207531, 1.534584, 1.342501, 1, 0, 0, 1, 1,
-0.1989955, 0.6801805, 1.627226, 1, 0, 0, 1, 1,
-0.1958226, 0.3832469, -1.105401, 1, 0, 0, 1, 1,
-0.1951789, -0.03952837, -1.496255, 0, 0, 0, 1, 1,
-0.19101, -1.743408, -2.025187, 0, 0, 0, 1, 1,
-0.1907788, 0.7510496, 1.160396, 0, 0, 0, 1, 1,
-0.1855116, 0.5457622, 0.8023065, 0, 0, 0, 1, 1,
-0.1850947, -0.1433745, -1.794439, 0, 0, 0, 1, 1,
-0.1827103, -1.078391, -4.784157, 0, 0, 0, 1, 1,
-0.1821837, 1.274081, -2.212786, 0, 0, 0, 1, 1,
-0.1821267, 0.4482207, 0.009196769, 1, 1, 1, 1, 1,
-0.1763849, -0.1751754, -1.751661, 1, 1, 1, 1, 1,
-0.1749649, -0.08242373, -1.103399, 1, 1, 1, 1, 1,
-0.1696979, -0.8626819, -4.053246, 1, 1, 1, 1, 1,
-0.1686165, 0.9121052, 1.250936, 1, 1, 1, 1, 1,
-0.1628228, 1.979642, 0.297583, 1, 1, 1, 1, 1,
-0.16174, 0.2793145, -0.4853995, 1, 1, 1, 1, 1,
-0.158203, 0.6364357, -0.3934323, 1, 1, 1, 1, 1,
-0.1478006, 0.6489357, 0.6663067, 1, 1, 1, 1, 1,
-0.1425814, 0.3276742, -1.188338, 1, 1, 1, 1, 1,
-0.138579, 0.1912273, -1.999767, 1, 1, 1, 1, 1,
-0.1356526, -0.7358399, -4.140247, 1, 1, 1, 1, 1,
-0.1333412, 0.6284125, -1.309063, 1, 1, 1, 1, 1,
-0.1331514, 1.18539, 0.8049523, 1, 1, 1, 1, 1,
-0.132813, 1.063714, 0.480586, 1, 1, 1, 1, 1,
-0.128716, -0.1344052, -2.180206, 0, 0, 1, 1, 1,
-0.1282218, -0.207909, -2.584502, 1, 0, 0, 1, 1,
-0.1281291, 0.08474471, -0.1776461, 1, 0, 0, 1, 1,
-0.1270425, -2.35647, -2.545518, 1, 0, 0, 1, 1,
-0.1249893, -0.09992202, -2.691346, 1, 0, 0, 1, 1,
-0.1229874, -1.469603, -4.339868, 1, 0, 0, 1, 1,
-0.1224841, -0.599386, -2.770917, 0, 0, 0, 1, 1,
-0.1196321, 0.07571878, -1.146888, 0, 0, 0, 1, 1,
-0.1193504, 0.1829194, -0.3040439, 0, 0, 0, 1, 1,
-0.1163086, 0.2657322, 0.7968943, 0, 0, 0, 1, 1,
-0.1149805, 1.085142, 2.148458, 0, 0, 0, 1, 1,
-0.1141821, 0.1960289, 0.4835207, 0, 0, 0, 1, 1,
-0.1103357, 0.4378662, 0.3381895, 0, 0, 0, 1, 1,
-0.1076278, -0.7095153, -1.68641, 1, 1, 1, 1, 1,
-0.1074844, -0.2214317, -1.759447, 1, 1, 1, 1, 1,
-0.1070176, 0.378129, 1.516224, 1, 1, 1, 1, 1,
-0.106182, 0.538325, -0.8312048, 1, 1, 1, 1, 1,
-0.09824423, 2.321502, -0.4431938, 1, 1, 1, 1, 1,
-0.09740497, -0.3685122, -2.371308, 1, 1, 1, 1, 1,
-0.09682927, 0.7146803, 1.573976, 1, 1, 1, 1, 1,
-0.09526909, 1.908427, -0.9426084, 1, 1, 1, 1, 1,
-0.09461091, -1.979905, -1.493458, 1, 1, 1, 1, 1,
-0.09166101, 0.864087, -1.298765, 1, 1, 1, 1, 1,
-0.09117281, 0.03187127, -0.8828412, 1, 1, 1, 1, 1,
-0.0883669, -0.02430719, -0.9885782, 1, 1, 1, 1, 1,
-0.08831523, 1.992461, -1.064031, 1, 1, 1, 1, 1,
-0.08614495, 1.330494, 0.220876, 1, 1, 1, 1, 1,
-0.08356876, 0.5212862, -1.516562, 1, 1, 1, 1, 1,
-0.08307267, 1.321159, 0.422264, 0, 0, 1, 1, 1,
-0.07557406, 0.5538719, 0.8791046, 1, 0, 0, 1, 1,
-0.07476146, -0.8335842, -2.537636, 1, 0, 0, 1, 1,
-0.07458483, -1.082741, -2.040478, 1, 0, 0, 1, 1,
-0.07369378, 1.890496, -1.219842, 1, 0, 0, 1, 1,
-0.07214281, 0.02913914, -2.304906, 1, 0, 0, 1, 1,
-0.07165149, 0.8478618, -0.5711149, 0, 0, 0, 1, 1,
-0.071202, -2.018064, -1.430666, 0, 0, 0, 1, 1,
-0.06763189, 1.366957, -0.6341063, 0, 0, 0, 1, 1,
-0.06717378, 0.1853796, -0.5145408, 0, 0, 0, 1, 1,
-0.06657918, 1.696726, -1.329816, 0, 0, 0, 1, 1,
-0.06162795, -0.3702141, -3.317499, 0, 0, 0, 1, 1,
-0.05852694, 2.295016, -0.4018509, 0, 0, 0, 1, 1,
-0.0579554, 0.1370452, -1.692842, 1, 1, 1, 1, 1,
-0.05417312, -0.4708456, -4.323987, 1, 1, 1, 1, 1,
-0.05364789, -2.571881, -1.261345, 1, 1, 1, 1, 1,
-0.05343211, -0.1059556, -1.92096, 1, 1, 1, 1, 1,
-0.05279486, -0.08777679, -2.138376, 1, 1, 1, 1, 1,
-0.05265162, -1.151833, -2.95903, 1, 1, 1, 1, 1,
-0.04655702, -0.9689552, -4.269289, 1, 1, 1, 1, 1,
-0.04507228, -0.6486367, -2.198493, 1, 1, 1, 1, 1,
-0.04375334, -0.1086806, -2.603936, 1, 1, 1, 1, 1,
-0.04357924, -1.116745, -0.3857197, 1, 1, 1, 1, 1,
-0.04225892, 0.387637, 0.6168489, 1, 1, 1, 1, 1,
-0.04199999, -0.8887407, -2.714164, 1, 1, 1, 1, 1,
-0.03915312, -1.117512, -4.349726, 1, 1, 1, 1, 1,
-0.03340678, 0.7437279, 1.368332, 1, 1, 1, 1, 1,
-0.03184409, 0.3278844, -0.9027286, 1, 1, 1, 1, 1,
-0.01879969, -0.6825305, -2.904179, 0, 0, 1, 1, 1,
-0.01829479, 1.825439, -1.562403, 1, 0, 0, 1, 1,
-0.01617579, -1.701346, -2.700843, 1, 0, 0, 1, 1,
-0.01144336, -0.3969181, -1.671321, 1, 0, 0, 1, 1,
-0.007166459, 0.2860261, -0.9225147, 1, 0, 0, 1, 1,
-0.006299943, -0.7273791, -0.9307028, 1, 0, 0, 1, 1,
-0.003558743, 0.3823497, 1.426247, 0, 0, 0, 1, 1,
-0.001930081, -1.394875, -2.313219, 0, 0, 0, 1, 1,
-0.001268155, -0.6006582, -4.496414, 0, 0, 0, 1, 1,
-0.0002516438, 0.8033688, -0.945065, 0, 0, 0, 1, 1,
0.0005372012, -0.04911234, 2.340483, 0, 0, 0, 1, 1,
0.003469547, 0.9575385, 0.3478085, 0, 0, 0, 1, 1,
0.004261739, 0.7732378, -0.137167, 0, 0, 0, 1, 1,
0.004601437, -1.372391, 3.81377, 1, 1, 1, 1, 1,
0.006072313, -0.9004978, 3.342776, 1, 1, 1, 1, 1,
0.007621628, 0.2340465, 0.7908463, 1, 1, 1, 1, 1,
0.0125192, 1.471176, 0.0980413, 1, 1, 1, 1, 1,
0.0135645, -0.319084, 3.960609, 1, 1, 1, 1, 1,
0.01573373, -0.2977034, 2.27401, 1, 1, 1, 1, 1,
0.02041131, 0.9003381, 1.221686, 1, 1, 1, 1, 1,
0.0204748, -0.8975984, 3.09278, 1, 1, 1, 1, 1,
0.02051271, 0.6677629, 0.4302662, 1, 1, 1, 1, 1,
0.02630819, 0.4117106, -0.2045739, 1, 1, 1, 1, 1,
0.02653741, 0.3555202, 0.1630796, 1, 1, 1, 1, 1,
0.02872715, -0.3984053, 3.977609, 1, 1, 1, 1, 1,
0.03310579, 1.020611, -0.6964818, 1, 1, 1, 1, 1,
0.03639503, -0.3695886, 2.994327, 1, 1, 1, 1, 1,
0.03649506, -1.691781, 2.327796, 1, 1, 1, 1, 1,
0.03719571, 1.026395, -1.062787, 0, 0, 1, 1, 1,
0.03863412, 0.5638776, -0.196467, 1, 0, 0, 1, 1,
0.04136715, 0.4869455, -0.8466527, 1, 0, 0, 1, 1,
0.0430878, -1.623043, 2.199869, 1, 0, 0, 1, 1,
0.04334466, -1.62289, 2.869058, 1, 0, 0, 1, 1,
0.04642212, -0.09274998, 3.764465, 1, 0, 0, 1, 1,
0.04829011, -2.03686, 2.522026, 0, 0, 0, 1, 1,
0.05305739, 0.9736121, -0.126979, 0, 0, 0, 1, 1,
0.05699784, -0.2929859, 3.820772, 0, 0, 0, 1, 1,
0.06035466, 0.1753146, -0.9661897, 0, 0, 0, 1, 1,
0.06145865, 1.046394, 0.06225722, 0, 0, 0, 1, 1,
0.06225158, 0.5656283, -0.4907719, 0, 0, 0, 1, 1,
0.06258146, -0.40829, 3.276872, 0, 0, 0, 1, 1,
0.06509266, 0.9328967, -0.9298753, 1, 1, 1, 1, 1,
0.06977683, -0.7796946, 3.238799, 1, 1, 1, 1, 1,
0.070059, -0.08211522, 4.620094, 1, 1, 1, 1, 1,
0.07024167, 1.388778, 1.447835, 1, 1, 1, 1, 1,
0.07204496, -1.091084, 4.703834, 1, 1, 1, 1, 1,
0.07914892, 1.725493, -0.2509671, 1, 1, 1, 1, 1,
0.08106797, 0.08403516, 0.9797689, 1, 1, 1, 1, 1,
0.08948851, -2.506521, 3.039486, 1, 1, 1, 1, 1,
0.09062252, -0.5821236, 1.995676, 1, 1, 1, 1, 1,
0.09126551, -1.100523, 2.410714, 1, 1, 1, 1, 1,
0.09428696, 1.476364, -0.5549466, 1, 1, 1, 1, 1,
0.0947676, 0.5414548, 1.15255, 1, 1, 1, 1, 1,
0.1001506, 0.7081826, 0.6490251, 1, 1, 1, 1, 1,
0.1028966, -1.305734, 4.477801, 1, 1, 1, 1, 1,
0.1049674, -0.7747826, 2.548348, 1, 1, 1, 1, 1,
0.1079496, -1.468095, 3.501521, 0, 0, 1, 1, 1,
0.109902, 1.297791, -1.270156, 1, 0, 0, 1, 1,
0.1100613, 0.05325706, -0.08527794, 1, 0, 0, 1, 1,
0.1135146, 0.8459836, 0.7201273, 1, 0, 0, 1, 1,
0.1207784, 0.9790155, -2.175658, 1, 0, 0, 1, 1,
0.1235787, 1.065463, -1.792642, 1, 0, 0, 1, 1,
0.1274895, -0.4762419, 1.422759, 0, 0, 0, 1, 1,
0.1280379, -0.5327407, 1.442642, 0, 0, 0, 1, 1,
0.1287199, -0.6441824, 2.721534, 0, 0, 0, 1, 1,
0.1336368, 0.1079666, 3.006924, 0, 0, 0, 1, 1,
0.1347954, -2.435435, 4.223053, 0, 0, 0, 1, 1,
0.1373405, -0.4163891, 1.473589, 0, 0, 0, 1, 1,
0.1457804, -0.2322554, 0.5758876, 0, 0, 0, 1, 1,
0.1459727, -0.03177238, -0.9366595, 1, 1, 1, 1, 1,
0.1496249, -0.9587793, 2.313588, 1, 1, 1, 1, 1,
0.1502622, 0.2419365, -0.9210191, 1, 1, 1, 1, 1,
0.1514418, -0.6729959, 3.006201, 1, 1, 1, 1, 1,
0.1530311, -0.009851598, 0.2513409, 1, 1, 1, 1, 1,
0.1548474, -1.27033, 3.736406, 1, 1, 1, 1, 1,
0.1556513, -0.6879598, 2.580961, 1, 1, 1, 1, 1,
0.1590466, 2.495351, 0.4567638, 1, 1, 1, 1, 1,
0.1657231, -0.6524981, 2.270263, 1, 1, 1, 1, 1,
0.1665669, -1.619445, 4.60615, 1, 1, 1, 1, 1,
0.1767337, 2.206747, 0.8159686, 1, 1, 1, 1, 1,
0.1767991, -1.191631, 3.397722, 1, 1, 1, 1, 1,
0.18004, -0.8281247, 2.337053, 1, 1, 1, 1, 1,
0.18093, 1.645079, -0.9159667, 1, 1, 1, 1, 1,
0.1831842, 0.1720029, 0.2315669, 1, 1, 1, 1, 1,
0.185752, -1.242094, 1.059859, 0, 0, 1, 1, 1,
0.1937165, -0.5175841, 4.166837, 1, 0, 0, 1, 1,
0.194047, -1.790809, 1.867081, 1, 0, 0, 1, 1,
0.1956725, 1.210617, 0.5861102, 1, 0, 0, 1, 1,
0.1961539, -1.697767, 6.688641, 1, 0, 0, 1, 1,
0.2011598, 1.138451, -0.1175765, 1, 0, 0, 1, 1,
0.2028655, 1.073445, 0.38518, 0, 0, 0, 1, 1,
0.203689, -0.5449429, 3.004441, 0, 0, 0, 1, 1,
0.2048635, -0.8597711, 3.165984, 0, 0, 0, 1, 1,
0.2069739, -1.011835, 3.466641, 0, 0, 0, 1, 1,
0.2135898, -0.08653988, 3.067065, 0, 0, 0, 1, 1,
0.2168605, -1.018663, 3.65451, 0, 0, 0, 1, 1,
0.2183763, -0.06208651, 2.293141, 0, 0, 0, 1, 1,
0.2211719, -0.7490491, 2.300587, 1, 1, 1, 1, 1,
0.2238714, 0.1445478, 1.332491, 1, 1, 1, 1, 1,
0.2255289, -0.3150632, 0.8674499, 1, 1, 1, 1, 1,
0.226014, -1.11136, 2.314897, 1, 1, 1, 1, 1,
0.2267084, 0.2746971, 1.846496, 1, 1, 1, 1, 1,
0.2282509, 1.186597, 0.8573088, 1, 1, 1, 1, 1,
0.2377331, -0.2056848, 3.197279, 1, 1, 1, 1, 1,
0.2383523, -0.648616, 2.610303, 1, 1, 1, 1, 1,
0.239364, 0.9364523, -0.3183798, 1, 1, 1, 1, 1,
0.2468296, 1.353661, -2.268092, 1, 1, 1, 1, 1,
0.2504133, -0.0425943, 1.569667, 1, 1, 1, 1, 1,
0.2562183, -0.7891288, 3.510538, 1, 1, 1, 1, 1,
0.256794, -0.8756334, 3.509024, 1, 1, 1, 1, 1,
0.2575398, -2.098149, 5.128461, 1, 1, 1, 1, 1,
0.2591258, 1.562642, -0.03281138, 1, 1, 1, 1, 1,
0.2599798, 0.4887638, -0.09127022, 0, 0, 1, 1, 1,
0.2608618, -0.06602371, 1.147016, 1, 0, 0, 1, 1,
0.2613123, -0.5683247, 0.7317064, 1, 0, 0, 1, 1,
0.2642733, -0.2335754, 2.468541, 1, 0, 0, 1, 1,
0.2678332, 0.1252765, 2.107923, 1, 0, 0, 1, 1,
0.2716949, 0.635915, 1.102184, 1, 0, 0, 1, 1,
0.2719801, 0.6627797, 0.476582, 0, 0, 0, 1, 1,
0.2761659, -0.5033451, 2.918195, 0, 0, 0, 1, 1,
0.2788033, -1.011963, 1.94609, 0, 0, 0, 1, 1,
0.2790741, -1.822988, 2.577266, 0, 0, 0, 1, 1,
0.280774, -0.6076022, 1.807252, 0, 0, 0, 1, 1,
0.2834548, 1.591952, 1.853923, 0, 0, 0, 1, 1,
0.2926953, -1.984391, 3.411579, 0, 0, 0, 1, 1,
0.2942433, 1.419189, 1.401442, 1, 1, 1, 1, 1,
0.2993118, 0.09639267, -0.506736, 1, 1, 1, 1, 1,
0.3010148, 0.1701336, 0.4897182, 1, 1, 1, 1, 1,
0.3014714, -0.2638149, 1.858482, 1, 1, 1, 1, 1,
0.3019941, 0.08071744, 1.223431, 1, 1, 1, 1, 1,
0.3032549, 0.3104768, 2.168455, 1, 1, 1, 1, 1,
0.3061773, -0.4024563, 1.55981, 1, 1, 1, 1, 1,
0.3085739, -1.047277, 3.83814, 1, 1, 1, 1, 1,
0.3094872, -0.9927498, 2.143509, 1, 1, 1, 1, 1,
0.3095098, 1.014711, 2.313788, 1, 1, 1, 1, 1,
0.3115927, 0.203503, 1.497825, 1, 1, 1, 1, 1,
0.312733, -1.648493, 3.778519, 1, 1, 1, 1, 1,
0.3130195, 0.3443183, 0.2579435, 1, 1, 1, 1, 1,
0.3207621, -0.1650332, 1.54567, 1, 1, 1, 1, 1,
0.3222694, 0.5654541, 0.04840846, 1, 1, 1, 1, 1,
0.331311, 0.1436487, 1.088586, 0, 0, 1, 1, 1,
0.3324328, 2.011418, -1.945873, 1, 0, 0, 1, 1,
0.3338446, -1.040738, 2.876811, 1, 0, 0, 1, 1,
0.3349256, 0.764119, 1.900831, 1, 0, 0, 1, 1,
0.3351983, -1.073565, 4.024577, 1, 0, 0, 1, 1,
0.3376396, -0.2230045, 2.376666, 1, 0, 0, 1, 1,
0.3382252, 0.2156943, 2.800239, 0, 0, 0, 1, 1,
0.3390141, 0.06495503, 2.47735, 0, 0, 0, 1, 1,
0.3414538, 0.4118145, 0.5577644, 0, 0, 0, 1, 1,
0.3421169, 1.370424, 0.3253606, 0, 0, 0, 1, 1,
0.3430802, 0.839824, -0.828115, 0, 0, 0, 1, 1,
0.3436242, -1.249328, 3.515989, 0, 0, 0, 1, 1,
0.3437502, 0.6514559, -0.395881, 0, 0, 0, 1, 1,
0.3443511, -0.6629308, 2.317174, 1, 1, 1, 1, 1,
0.3513407, -0.8421821, 2.898671, 1, 1, 1, 1, 1,
0.3523824, 0.1971177, 0.3680794, 1, 1, 1, 1, 1,
0.353708, -0.542381, 2.669235, 1, 1, 1, 1, 1,
0.3553519, -0.02674404, 2.164663, 1, 1, 1, 1, 1,
0.3568178, -0.1249558, 2.497152, 1, 1, 1, 1, 1,
0.3639419, 1.416034, 0.1372377, 1, 1, 1, 1, 1,
0.3648725, -1.239255, 1.565436, 1, 1, 1, 1, 1,
0.3698813, 0.4233062, 2.796175, 1, 1, 1, 1, 1,
0.3698828, 3.217213, -0.2957929, 1, 1, 1, 1, 1,
0.3729002, 0.2716636, 0.5477326, 1, 1, 1, 1, 1,
0.3764865, 0.8217242, 0.02202063, 1, 1, 1, 1, 1,
0.3789757, 0.3605821, 2.996423, 1, 1, 1, 1, 1,
0.3847599, -1.7799, 3.206324, 1, 1, 1, 1, 1,
0.3862627, 0.7693346, 1.535229, 1, 1, 1, 1, 1,
0.4003505, -1.072232, 3.327726, 0, 0, 1, 1, 1,
0.4005166, 1.336248, 0.6253897, 1, 0, 0, 1, 1,
0.4030313, -1.204026, 2.484706, 1, 0, 0, 1, 1,
0.4043019, 0.6325423, -1.278968, 1, 0, 0, 1, 1,
0.4061624, 0.1035575, 0.9017878, 1, 0, 0, 1, 1,
0.406769, -0.7793686, 4.088892, 1, 0, 0, 1, 1,
0.4115062, 1.957965, 1.52505, 0, 0, 0, 1, 1,
0.4120519, 0.7812921, 1.142936, 0, 0, 0, 1, 1,
0.4157225, 1.67385, 0.1617366, 0, 0, 0, 1, 1,
0.4307307, -0.9451605, 1.975186, 0, 0, 0, 1, 1,
0.4334965, 0.2863328, 2.563873, 0, 0, 0, 1, 1,
0.4350941, 3.010582, -1.112323, 0, 0, 0, 1, 1,
0.4361233, -0.07116336, 0.6237419, 0, 0, 0, 1, 1,
0.4394037, -0.2160278, 1.173787, 1, 1, 1, 1, 1,
0.440683, 0.728251, -0.06529751, 1, 1, 1, 1, 1,
0.4488241, -0.02174215, 2.36578, 1, 1, 1, 1, 1,
0.4565267, -0.2250123, 2.389153, 1, 1, 1, 1, 1,
0.4581574, -0.05725127, 1.161344, 1, 1, 1, 1, 1,
0.4608948, 2.17672, 0.8600137, 1, 1, 1, 1, 1,
0.4627935, 0.4044027, 1.548342, 1, 1, 1, 1, 1,
0.4637097, 1.024481, 0.8251582, 1, 1, 1, 1, 1,
0.4728729, 0.6594972, 1.285473, 1, 1, 1, 1, 1,
0.4736161, -0.3814534, 2.763178, 1, 1, 1, 1, 1,
0.4818601, -0.6013496, 1.888711, 1, 1, 1, 1, 1,
0.4827575, 0.1996113, 0.7409983, 1, 1, 1, 1, 1,
0.4882079, 0.1454004, 1.117182, 1, 1, 1, 1, 1,
0.493783, 0.03987424, 1.249467, 1, 1, 1, 1, 1,
0.4939256, 0.5313463, 2.208313, 1, 1, 1, 1, 1,
0.4999726, -0.6939684, 3.270549, 0, 0, 1, 1, 1,
0.5010876, 0.4700225, 0.8177425, 1, 0, 0, 1, 1,
0.5042729, 0.9630177, 1.593534, 1, 0, 0, 1, 1,
0.5070037, -1.125912, 2.458637, 1, 0, 0, 1, 1,
0.5074851, -1.113602, 2.788445, 1, 0, 0, 1, 1,
0.5082082, -0.3883757, 0.3348263, 1, 0, 0, 1, 1,
0.5127413, -0.2275081, 1.370767, 0, 0, 0, 1, 1,
0.519763, 0.6260848, 0.5844585, 0, 0, 0, 1, 1,
0.5220189, 0.1728705, 0.8626038, 0, 0, 0, 1, 1,
0.5222456, -0.2388875, 2.784398, 0, 0, 0, 1, 1,
0.5301636, 0.3562412, 0.6923521, 0, 0, 0, 1, 1,
0.5302842, 0.648114, 2.03009, 0, 0, 0, 1, 1,
0.5348513, -0.08678985, 2.783918, 0, 0, 0, 1, 1,
0.5362402, 1.683425, 2.060808, 1, 1, 1, 1, 1,
0.5394439, 1.200814, 0.1476855, 1, 1, 1, 1, 1,
0.5439675, 0.4518173, 2.546439, 1, 1, 1, 1, 1,
0.5441552, 2.414907, 0.3279613, 1, 1, 1, 1, 1,
0.5470185, -0.9546371, 1.808787, 1, 1, 1, 1, 1,
0.5485966, -0.4022708, 0.7743489, 1, 1, 1, 1, 1,
0.5492733, 0.4122218, 0.4475968, 1, 1, 1, 1, 1,
0.5514998, 0.8748151, 1.879586, 1, 1, 1, 1, 1,
0.5536599, 0.5411394, 1.148031, 1, 1, 1, 1, 1,
0.5540929, 0.1731075, 0.09620851, 1, 1, 1, 1, 1,
0.5576731, 0.7469937, 0.1231352, 1, 1, 1, 1, 1,
0.5586686, 1.293885, -0.1063792, 1, 1, 1, 1, 1,
0.5592774, -0.1612291, 0.8417242, 1, 1, 1, 1, 1,
0.5595092, -1.377571, 1.779657, 1, 1, 1, 1, 1,
0.5607294, 0.2958495, -0.1960741, 1, 1, 1, 1, 1,
0.563534, 1.09174, -0.464662, 0, 0, 1, 1, 1,
0.5637556, -0.8464017, 2.851915, 1, 0, 0, 1, 1,
0.571031, -0.4577617, 2.214376, 1, 0, 0, 1, 1,
0.5749152, 0.4110776, 3.08298, 1, 0, 0, 1, 1,
0.5897229, 0.4879321, 0.3077379, 1, 0, 0, 1, 1,
0.5949128, 0.365856, 0.8031777, 1, 0, 0, 1, 1,
0.5954397, -2.196504, 2.928871, 0, 0, 0, 1, 1,
0.5966398, 1.009191, 1.848384, 0, 0, 0, 1, 1,
0.5975993, -1.765419, 1.811415, 0, 0, 0, 1, 1,
0.6007537, -0.1390227, 3.66822, 0, 0, 0, 1, 1,
0.6025155, 1.095143, 0.5318311, 0, 0, 0, 1, 1,
0.6025647, -0.7663924, 2.714857, 0, 0, 0, 1, 1,
0.606031, -0.5018566, 1.916543, 0, 0, 0, 1, 1,
0.6078752, -0.97788, 2.616234, 1, 1, 1, 1, 1,
0.6135424, 0.9376517, -1.128004, 1, 1, 1, 1, 1,
0.6150805, 1.350467, 1.4602, 1, 1, 1, 1, 1,
0.6161895, -0.7962059, 1.591389, 1, 1, 1, 1, 1,
0.6186749, 0.1745193, 1.418499, 1, 1, 1, 1, 1,
0.6270452, -0.04503276, 2.349222, 1, 1, 1, 1, 1,
0.629009, 0.09319678, 0.3673441, 1, 1, 1, 1, 1,
0.6298707, -1.281252, 3.052773, 1, 1, 1, 1, 1,
0.6369075, 1.100127, 1.452556, 1, 1, 1, 1, 1,
0.6467144, 0.2526676, 2.210722, 1, 1, 1, 1, 1,
0.6484284, -0.6209877, 3.088234, 1, 1, 1, 1, 1,
0.6525263, 0.0687774, 1.297714, 1, 1, 1, 1, 1,
0.6558856, 0.2597204, 1.374172, 1, 1, 1, 1, 1,
0.6598504, 1.175404, 1.304441, 1, 1, 1, 1, 1,
0.6613162, -0.07590283, 2.22951, 1, 1, 1, 1, 1,
0.6614475, 0.2432631, 2.085136, 0, 0, 1, 1, 1,
0.6661189, 0.685789, 0.9515917, 1, 0, 0, 1, 1,
0.6687636, 1.229992, 0.05235036, 1, 0, 0, 1, 1,
0.6726668, -1.388723, 4.334416, 1, 0, 0, 1, 1,
0.6752856, -0.401908, 0.6556031, 1, 0, 0, 1, 1,
0.6761842, 0.1514837, 0.4396357, 1, 0, 0, 1, 1,
0.6775935, -1.503087, 4.650029, 0, 0, 0, 1, 1,
0.677898, 1.42573, -0.1176221, 0, 0, 0, 1, 1,
0.6792119, -0.4223577, 2.22786, 0, 0, 0, 1, 1,
0.6844535, -1.360146, 4.553226, 0, 0, 0, 1, 1,
0.6883559, 0.566554, 0.01333579, 0, 0, 0, 1, 1,
0.6916015, -2.192677, 3.464653, 0, 0, 0, 1, 1,
0.6929848, -0.9709148, 2.169401, 0, 0, 0, 1, 1,
0.6996561, -0.1609045, 0.5142443, 1, 1, 1, 1, 1,
0.7012173, -0.4437901, 1.504631, 1, 1, 1, 1, 1,
0.7016429, 0.2068856, 1.604621, 1, 1, 1, 1, 1,
0.7044393, -0.3857526, 2.72867, 1, 1, 1, 1, 1,
0.7067892, -0.9959181, 2.443898, 1, 1, 1, 1, 1,
0.7096849, -1.255119, 2.858608, 1, 1, 1, 1, 1,
0.7161194, 0.0005701306, 0.2909066, 1, 1, 1, 1, 1,
0.7183064, -0.3118734, 1.054545, 1, 1, 1, 1, 1,
0.7185384, -0.4595341, 3.723578, 1, 1, 1, 1, 1,
0.7216471, 1.868769, 1.476091, 1, 1, 1, 1, 1,
0.7220588, -0.3131806, 2.028594, 1, 1, 1, 1, 1,
0.7251663, 1.574583, -0.3958622, 1, 1, 1, 1, 1,
0.7312413, -0.5124044, 1.949419, 1, 1, 1, 1, 1,
0.7373707, 0.6886328, 0.5880189, 1, 1, 1, 1, 1,
0.7379332, -0.4859797, 3.155245, 1, 1, 1, 1, 1,
0.7458869, 0.5805795, 0.03966503, 0, 0, 1, 1, 1,
0.7492151, -0.9986963, 2.348795, 1, 0, 0, 1, 1,
0.7511103, 1.256304, -1.3054, 1, 0, 0, 1, 1,
0.7519228, 0.4747452, 1.987324, 1, 0, 0, 1, 1,
0.7534291, 1.046817, 1.044393, 1, 0, 0, 1, 1,
0.7555951, 0.313089, 1.642028, 1, 0, 0, 1, 1,
0.7573337, -1.445659, 1.466423, 0, 0, 0, 1, 1,
0.7598584, -0.7933704, 3.166394, 0, 0, 0, 1, 1,
0.760533, 1.240182, 1.465371, 0, 0, 0, 1, 1,
0.7683122, 0.9067077, 1.174556, 0, 0, 0, 1, 1,
0.7887483, 0.4952698, 0.9694557, 0, 0, 0, 1, 1,
0.7911965, 0.2047916, 0.8101401, 0, 0, 0, 1, 1,
0.8024981, 0.1683829, 2.383433, 0, 0, 0, 1, 1,
0.8061686, 1.123667, 3.115418, 1, 1, 1, 1, 1,
0.8191692, 1.596492, 0.01064235, 1, 1, 1, 1, 1,
0.8199108, -3.984705, 1.954473, 1, 1, 1, 1, 1,
0.8347337, 1.31207, -0.3203555, 1, 1, 1, 1, 1,
0.8369347, 0.480595, 4.082239, 1, 1, 1, 1, 1,
0.838644, 0.5055599, 1.09605, 1, 1, 1, 1, 1,
0.8434422, -0.1879063, 2.343508, 1, 1, 1, 1, 1,
0.8447999, -0.4507114, 1.086442, 1, 1, 1, 1, 1,
0.8451427, -0.3387658, 1.386573, 1, 1, 1, 1, 1,
0.8474158, -0.8121231, 1.683419, 1, 1, 1, 1, 1,
0.852532, 1.804819, -0.2133182, 1, 1, 1, 1, 1,
0.8540078, 0.2246612, 0.7029699, 1, 1, 1, 1, 1,
0.8551619, -0.09230839, 1.434952, 1, 1, 1, 1, 1,
0.8555979, 0.4944667, -0.8281552, 1, 1, 1, 1, 1,
0.8565623, 1.454374, -0.4578794, 1, 1, 1, 1, 1,
0.8593663, -0.6869437, 2.789125, 0, 0, 1, 1, 1,
0.8623723, -0.07426573, 0.7013313, 1, 0, 0, 1, 1,
0.8633035, 0.8230453, 0.8962975, 1, 0, 0, 1, 1,
0.8667917, -0.243198, 2.089139, 1, 0, 0, 1, 1,
0.8681848, -0.05298704, 0.5569078, 1, 0, 0, 1, 1,
0.8686874, 1.552721, 1.920059, 1, 0, 0, 1, 1,
0.872023, -0.2684942, 3.170807, 0, 0, 0, 1, 1,
0.8738442, 1.082422, 0.8138884, 0, 0, 0, 1, 1,
0.8792686, -0.5604845, 0.9500806, 0, 0, 0, 1, 1,
0.8803669, 0.7518954, 0.8240517, 0, 0, 0, 1, 1,
0.8820571, -0.4794465, 1.132927, 0, 0, 0, 1, 1,
0.8839399, -0.5477835, 1.112637, 0, 0, 0, 1, 1,
0.8859242, 1.788591, 1.466614, 0, 0, 0, 1, 1,
0.8917778, -3.657319, 2.261955, 1, 1, 1, 1, 1,
0.8947376, -0.6955728, 2.787467, 1, 1, 1, 1, 1,
0.9073528, -1.517832, 4.690271, 1, 1, 1, 1, 1,
0.9259975, 0.4369584, 0.1612686, 1, 1, 1, 1, 1,
0.9274023, 0.05659801, 3.553888, 1, 1, 1, 1, 1,
0.9300122, 0.2798173, 0.8735715, 1, 1, 1, 1, 1,
0.9481569, -1.104973, -0.06090713, 1, 1, 1, 1, 1,
0.9483438, 1.076254, 1.161462, 1, 1, 1, 1, 1,
0.949306, -0.1581178, 2.122175, 1, 1, 1, 1, 1,
0.9526771, -0.6799303, 2.489868, 1, 1, 1, 1, 1,
0.9560052, -0.5555063, 2.997267, 1, 1, 1, 1, 1,
0.9656556, 0.8150503, 1.323348, 1, 1, 1, 1, 1,
0.969743, 1.101275, 0.8527769, 1, 1, 1, 1, 1,
0.9717889, -2.192934, 1.810233, 1, 1, 1, 1, 1,
0.9928677, 2.352546, 0.702554, 1, 1, 1, 1, 1,
0.9975183, 1.083024, 0.2938541, 0, 0, 1, 1, 1,
0.99989, -0.1126437, 1.058012, 1, 0, 0, 1, 1,
1.00058, 0.08610258, 0.7180393, 1, 0, 0, 1, 1,
1.000789, 2.804482, -0.335858, 1, 0, 0, 1, 1,
1.001158, 1.018816, -0.6369393, 1, 0, 0, 1, 1,
1.004921, -0.02560405, 1.557515, 1, 0, 0, 1, 1,
1.006286, -0.6400837, 1.751639, 0, 0, 0, 1, 1,
1.006473, 0.5921053, 1.336759, 0, 0, 0, 1, 1,
1.00754, -0.07320148, 3.174397, 0, 0, 0, 1, 1,
1.010609, -1.86766, 2.147176, 0, 0, 0, 1, 1,
1.020052, -0.122459, 1.861197, 0, 0, 0, 1, 1,
1.031142, -0.4132165, 4.075963, 0, 0, 0, 1, 1,
1.035785, 2.600823, -0.4828117, 0, 0, 0, 1, 1,
1.052114, -0.4751271, 1.317171, 1, 1, 1, 1, 1,
1.052502, 1.832147, 0.2070467, 1, 1, 1, 1, 1,
1.054178, -0.4913228, 2.579448, 1, 1, 1, 1, 1,
1.061157, -0.1785297, 1.333995, 1, 1, 1, 1, 1,
1.061826, 0.2488905, 1.686251, 1, 1, 1, 1, 1,
1.065661, -2.750225, 3.817034, 1, 1, 1, 1, 1,
1.066141, -0.6302245, 1.899151, 1, 1, 1, 1, 1,
1.066944, -1.027233, 3.713115, 1, 1, 1, 1, 1,
1.067217, -1.479616, 4.610413, 1, 1, 1, 1, 1,
1.074721, -1.185543, 3.561435, 1, 1, 1, 1, 1,
1.076649, 0.05918739, 2.467723, 1, 1, 1, 1, 1,
1.077469, -0.6668699, 2.958431, 1, 1, 1, 1, 1,
1.08006, -0.03731265, 3.640673, 1, 1, 1, 1, 1,
1.080495, -0.5360883, 2.312454, 1, 1, 1, 1, 1,
1.080535, 0.2887235, 1.372738, 1, 1, 1, 1, 1,
1.081892, -0.9906474, 1.651108, 0, 0, 1, 1, 1,
1.083083, -2.363286, 1.488069, 1, 0, 0, 1, 1,
1.089071, 0.9926375, 2.448512, 1, 0, 0, 1, 1,
1.091619, 1.116926, -0.9883266, 1, 0, 0, 1, 1,
1.091671, -1.463635, 4.373428, 1, 0, 0, 1, 1,
1.09305, 0.07998467, 2.360815, 1, 0, 0, 1, 1,
1.093786, 0.1867015, 1.85394, 0, 0, 0, 1, 1,
1.095183, 2.370246, 0.4377438, 0, 0, 0, 1, 1,
1.099127, 0.580136, 1.462273, 0, 0, 0, 1, 1,
1.099257, -0.3508411, 1.942085, 0, 0, 0, 1, 1,
1.110114, 0.2925974, 1.241393, 0, 0, 0, 1, 1,
1.11673, -1.329521, 2.016464, 0, 0, 0, 1, 1,
1.120435, 0.4872121, 0.3984197, 0, 0, 0, 1, 1,
1.122516, 1.049394, -0.6835933, 1, 1, 1, 1, 1,
1.129061, -1.196804, 3.481385, 1, 1, 1, 1, 1,
1.12988, -1.69462, 3.605495, 1, 1, 1, 1, 1,
1.132787, 0.9755695, 1.358539, 1, 1, 1, 1, 1,
1.144552, 1.288512, 1.252895, 1, 1, 1, 1, 1,
1.153115, 0.5345306, 2.180842, 1, 1, 1, 1, 1,
1.167408, 0.9870229, 1.42791, 1, 1, 1, 1, 1,
1.169466, -0.4204841, 1.175086, 1, 1, 1, 1, 1,
1.171172, -1.287999, 3.253037, 1, 1, 1, 1, 1,
1.172374, -0.3232164, 2.130479, 1, 1, 1, 1, 1,
1.197637, -0.6537765, 3.062381, 1, 1, 1, 1, 1,
1.200706, 0.8760172, 1.406942, 1, 1, 1, 1, 1,
1.205728, -0.7823281, 1.252547, 1, 1, 1, 1, 1,
1.208393, 0.8111107, 2.572934, 1, 1, 1, 1, 1,
1.212062, -0.4742446, 2.140759, 1, 1, 1, 1, 1,
1.212599, -1.254529, 2.258308, 0, 0, 1, 1, 1,
1.220061, 2.695202, -0.4485815, 1, 0, 0, 1, 1,
1.221157, -0.2861504, 2.550461, 1, 0, 0, 1, 1,
1.223608, 0.1353537, 1.869092, 1, 0, 0, 1, 1,
1.231739, 0.3159202, 1.60559, 1, 0, 0, 1, 1,
1.234069, 0.8180286, 2.76258, 1, 0, 0, 1, 1,
1.251462, 0.3135819, 2.454736, 0, 0, 0, 1, 1,
1.254068, -1.205114, 1.699854, 0, 0, 0, 1, 1,
1.268751, -0.008519966, 0.9576355, 0, 0, 0, 1, 1,
1.285235, -0.9723545, 0.8845353, 0, 0, 0, 1, 1,
1.290615, 1.582362, 2.675627, 0, 0, 0, 1, 1,
1.295302, -0.7586058, 2.723353, 0, 0, 0, 1, 1,
1.303121, -0.5340246, 4.815835, 0, 0, 0, 1, 1,
1.307957, -0.1242077, 0.1985101, 1, 1, 1, 1, 1,
1.310625, -2.491799, 1.848862, 1, 1, 1, 1, 1,
1.311364, 0.5952669, 1.389136, 1, 1, 1, 1, 1,
1.316704, 1.311372, 1.317252, 1, 1, 1, 1, 1,
1.322163, -0.7614422, 2.396287, 1, 1, 1, 1, 1,
1.326809, -0.08182144, 1.85586, 1, 1, 1, 1, 1,
1.330065, -0.190088, 1.900336, 1, 1, 1, 1, 1,
1.331478, -1.301402, 2.270849, 1, 1, 1, 1, 1,
1.33511, 0.5243549, 1.304412, 1, 1, 1, 1, 1,
1.338424, 0.9976485, 1.157608, 1, 1, 1, 1, 1,
1.351504, -0.3407181, 0.1447586, 1, 1, 1, 1, 1,
1.364805, -0.3862759, 1.739754, 1, 1, 1, 1, 1,
1.367876, -2.221773, 3.062459, 1, 1, 1, 1, 1,
1.385441, -0.2988289, 2.953768, 1, 1, 1, 1, 1,
1.391927, -1.583086, 1.474764, 1, 1, 1, 1, 1,
1.403525, -0.6153836, 1.478169, 0, 0, 1, 1, 1,
1.406301, -0.3661496, -0.3011046, 1, 0, 0, 1, 1,
1.413817, 1.018119, -0.1390212, 1, 0, 0, 1, 1,
1.41543, -0.9401823, 2.111118, 1, 0, 0, 1, 1,
1.41677, -1.288402, 3.872798, 1, 0, 0, 1, 1,
1.422819, 0.3416543, 1.613528, 1, 0, 0, 1, 1,
1.423112, 0.732789, 1.894887, 0, 0, 0, 1, 1,
1.423475, 1.264344, 0.008181556, 0, 0, 0, 1, 1,
1.42646, 2.019798, 1.39472, 0, 0, 0, 1, 1,
1.430761, 0.3981732, 1.149178, 0, 0, 0, 1, 1,
1.440736, 0.2034979, 2.116464, 0, 0, 0, 1, 1,
1.443763, 0.1839483, 0.7995861, 0, 0, 0, 1, 1,
1.445614, 0.471516, 1.58089, 0, 0, 0, 1, 1,
1.44755, -1.723156, 1.942557, 1, 1, 1, 1, 1,
1.449199, 1.20254, 0.2245125, 1, 1, 1, 1, 1,
1.45182, 2.091591, -0.3443831, 1, 1, 1, 1, 1,
1.458963, -0.7816483, 3.642152, 1, 1, 1, 1, 1,
1.471264, -1.825257, 2.469015, 1, 1, 1, 1, 1,
1.474015, -0.3811854, 1.023431, 1, 1, 1, 1, 1,
1.474017, -1.081276, 2.350779, 1, 1, 1, 1, 1,
1.48411, 1.252973, -0.1882993, 1, 1, 1, 1, 1,
1.485161, -1.668375, 3.967288, 1, 1, 1, 1, 1,
1.490313, -2.053391, 3.930229, 1, 1, 1, 1, 1,
1.496936, 0.6420429, 1.632297, 1, 1, 1, 1, 1,
1.498331, 0.142978, 1.004731, 1, 1, 1, 1, 1,
1.500633, 0.2993104, 0.8313153, 1, 1, 1, 1, 1,
1.507591, 2.109378, 0.9017986, 1, 1, 1, 1, 1,
1.508887, -0.1838616, 0.5923572, 1, 1, 1, 1, 1,
1.509231, 0.966105, 1.655075, 0, 0, 1, 1, 1,
1.523483, -0.1803806, -0.5631869, 1, 0, 0, 1, 1,
1.54017, 2.210178, 1.184294, 1, 0, 0, 1, 1,
1.547644, -0.3323145, 2.183248, 1, 0, 0, 1, 1,
1.549515, 2.105291, 0.4135877, 1, 0, 0, 1, 1,
1.563087, 0.1871837, 0.4583667, 1, 0, 0, 1, 1,
1.566944, -1.37519, 2.390647, 0, 0, 0, 1, 1,
1.574101, 0.2059764, 1.686442, 0, 0, 0, 1, 1,
1.59751, 0.8988665, 2.178449, 0, 0, 0, 1, 1,
1.602492, 0.7816761, 1.230756, 0, 0, 0, 1, 1,
1.606103, 1.599328, 2.169075, 0, 0, 0, 1, 1,
1.606145, 0.4882304, 0.3320864, 0, 0, 0, 1, 1,
1.63631, 0.8672354, 0.4030604, 0, 0, 0, 1, 1,
1.657228, -1.457001, 2.953766, 1, 1, 1, 1, 1,
1.665031, -0.3331349, 2.306773, 1, 1, 1, 1, 1,
1.672066, 0.279263, -0.2934159, 1, 1, 1, 1, 1,
1.676061, 0.8249948, 1.562177, 1, 1, 1, 1, 1,
1.6777, -0.7748597, 0.8095068, 1, 1, 1, 1, 1,
1.68248, -0.4554833, 1.024987, 1, 1, 1, 1, 1,
1.690052, 1.118894, 1.009759, 1, 1, 1, 1, 1,
1.70197, -0.4916543, -0.3428277, 1, 1, 1, 1, 1,
1.703738, 1.362611, -1.299544, 1, 1, 1, 1, 1,
1.735663, -0.8411217, 2.068417, 1, 1, 1, 1, 1,
1.736914, -0.531325, 1.641668, 1, 1, 1, 1, 1,
1.770499, 0.3878149, 2.916036, 1, 1, 1, 1, 1,
1.790795, 1.427571, 3.747453, 1, 1, 1, 1, 1,
1.805473, 0.9200459, 2.171862, 1, 1, 1, 1, 1,
1.80763, 1.383522, 0.8632901, 1, 1, 1, 1, 1,
1.824368, 2.033295, 1.585067, 0, 0, 1, 1, 1,
1.828951, -0.2835186, 2.291213, 1, 0, 0, 1, 1,
1.829053, 0.2264278, -0.6699077, 1, 0, 0, 1, 1,
1.83944, -1.356628, 1.484449, 1, 0, 0, 1, 1,
1.868294, 0.04092918, 2.707235, 1, 0, 0, 1, 1,
1.873, -0.1523816, 1.279529, 1, 0, 0, 1, 1,
1.883678, -0.3767313, 2.556413, 0, 0, 0, 1, 1,
1.88453, -1.043288, -0.2331504, 0, 0, 0, 1, 1,
1.885738, 0.8228714, 1.387059, 0, 0, 0, 1, 1,
1.885975, -0.2958509, 1.850705, 0, 0, 0, 1, 1,
1.890831, 0.4213557, 1.823906, 0, 0, 0, 1, 1,
1.890854, 1.418745, 2.302444, 0, 0, 0, 1, 1,
1.896204, -1.922551, 2.110674, 0, 0, 0, 1, 1,
1.90528, -0.8876052, 2.455187, 1, 1, 1, 1, 1,
1.929795, 2.532912, -0.4601943, 1, 1, 1, 1, 1,
1.932131, 0.1551628, 0.3651368, 1, 1, 1, 1, 1,
1.936913, -1.000264, 3.588048, 1, 1, 1, 1, 1,
1.938102, 1.284981, 1.498362, 1, 1, 1, 1, 1,
1.966237, -0.2890541, 0.3379888, 1, 1, 1, 1, 1,
2.012517, -1.128051, 2.54341, 1, 1, 1, 1, 1,
2.060551, -2.167943, 1.61408, 1, 1, 1, 1, 1,
2.067592, -1.08211, 1.194396, 1, 1, 1, 1, 1,
2.07849, -0.4425074, 2.433919, 1, 1, 1, 1, 1,
2.120017, -0.001603441, 1.588401, 1, 1, 1, 1, 1,
2.179637, 0.7352057, 0.8334753, 1, 1, 1, 1, 1,
2.192171, -0.9855747, 1.816763, 1, 1, 1, 1, 1,
2.196488, -0.3840993, 1.37954, 1, 1, 1, 1, 1,
2.20635, 0.2907059, 2.852979, 1, 1, 1, 1, 1,
2.241343, -0.3667127, 1.250344, 0, 0, 1, 1, 1,
2.290985, 0.6458169, 1.658331, 1, 0, 0, 1, 1,
2.35129, 0.4468498, 1.814517, 1, 0, 0, 1, 1,
2.403685, 1.264855, 0.9147582, 1, 0, 0, 1, 1,
2.417397, -0.7415402, 1.366672, 1, 0, 0, 1, 1,
2.422986, 0.7511044, 2.611928, 1, 0, 0, 1, 1,
2.428772, 0.2242477, 0.7191794, 0, 0, 0, 1, 1,
2.644933, -1.881544, 0.7532164, 0, 0, 0, 1, 1,
2.688281, -1.465433, 0.1063937, 0, 0, 0, 1, 1,
2.689819, 0.4265637, 1.613853, 0, 0, 0, 1, 1,
2.719135, -0.1180124, 2.775893, 0, 0, 0, 1, 1,
2.759539, 0.9122937, 1.003279, 0, 0, 0, 1, 1,
2.780006, -2.746397, 1.964272, 0, 0, 0, 1, 1,
2.810776, -0.4242902, 3.654408, 1, 1, 1, 1, 1,
2.890279, 0.5943716, 0.329078, 1, 1, 1, 1, 1,
2.940208, -0.1479707, 1.856665, 1, 1, 1, 1, 1,
3.269534, -1.680554, 3.448044, 1, 1, 1, 1, 1,
3.413294, -0.0914337, -0.4755246, 1, 1, 1, 1, 1,
3.477119, 1.205676, 2.353626, 1, 1, 1, 1, 1,
3.633275, 1.41249, 1.822613, 1, 1, 1, 1, 1
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
var radius = 10.38004;
var distance = 36.45945;
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
mvMatrix.translate( -0.2165651, 0.3837459, -0.7338204 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.45945);
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
