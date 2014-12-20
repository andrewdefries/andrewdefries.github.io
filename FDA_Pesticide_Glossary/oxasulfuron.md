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
-2.82013, -0.8504055, -1.140008, 1, 0, 0, 1,
-2.718059, 0.3576581, -1.435837, 1, 0.007843138, 0, 1,
-2.610487, -0.868875, -2.260888, 1, 0.01176471, 0, 1,
-2.478008, 2.216005, -0.581479, 1, 0.01960784, 0, 1,
-2.387358, 1.391772, -0.9065408, 1, 0.02352941, 0, 1,
-2.29606, 1.217658, -0.5932759, 1, 0.03137255, 0, 1,
-2.294384, 0.4923339, 0.2279295, 1, 0.03529412, 0, 1,
-2.269904, 0.0006074345, -0.2623271, 1, 0.04313726, 0, 1,
-2.259066, 1.134861, 0.07037634, 1, 0.04705882, 0, 1,
-2.222055, -0.5848081, -1.098304, 1, 0.05490196, 0, 1,
-2.162019, 2.149342, -1.252898, 1, 0.05882353, 0, 1,
-2.16016, -1.114052, -0.3397552, 1, 0.06666667, 0, 1,
-2.158635, 2.184112, -0.8736315, 1, 0.07058824, 0, 1,
-2.050401, 0.03219389, -0.2712029, 1, 0.07843138, 0, 1,
-2.04736, -0.8961285, -2.923943, 1, 0.08235294, 0, 1,
-2.031606, 0.947262, -1.219282, 1, 0.09019608, 0, 1,
-2.010922, 0.8897321, -0.4360525, 1, 0.09411765, 0, 1,
-2.001201, -0.3987628, -1.931018, 1, 0.1019608, 0, 1,
-1.997593, -0.5133501, 0.03610986, 1, 0.1098039, 0, 1,
-1.996079, -1.760882, -0.6054711, 1, 0.1137255, 0, 1,
-1.969657, 1.078109, -1.266208, 1, 0.1215686, 0, 1,
-1.958925, 2.100588, -1.160083, 1, 0.1254902, 0, 1,
-1.942815, -0.1892448, -3.153301, 1, 0.1333333, 0, 1,
-1.941721, 1.23234, -1.062505, 1, 0.1372549, 0, 1,
-1.933902, -1.131545, -2.51701, 1, 0.145098, 0, 1,
-1.919377, 0.6857824, -0.4926094, 1, 0.1490196, 0, 1,
-1.916273, 0.2230228, -1.488835, 1, 0.1568628, 0, 1,
-1.904224, -0.9271149, -2.90468, 1, 0.1607843, 0, 1,
-1.892517, -0.6998888, -2.567691, 1, 0.1686275, 0, 1,
-1.86273, 0.03567274, -1.578904, 1, 0.172549, 0, 1,
-1.826223, -0.4022689, -1.219513, 1, 0.1803922, 0, 1,
-1.824255, -0.1498906, -1.042933, 1, 0.1843137, 0, 1,
-1.813196, -1.04272, -1.006615, 1, 0.1921569, 0, 1,
-1.812582, 1.745749, -0.5041603, 1, 0.1960784, 0, 1,
-1.811073, -0.5810983, -0.8762252, 1, 0.2039216, 0, 1,
-1.80461, -1.076461, 0.6275666, 1, 0.2117647, 0, 1,
-1.800821, 1.312112, -0.3011062, 1, 0.2156863, 0, 1,
-1.796665, -0.9285426, -1.146155, 1, 0.2235294, 0, 1,
-1.789162, 0.08182453, -1.862858, 1, 0.227451, 0, 1,
-1.77695, 1.087378, -1.02765, 1, 0.2352941, 0, 1,
-1.740806, 0.8703952, -0.5595486, 1, 0.2392157, 0, 1,
-1.720742, -0.7141585, 0.9533071, 1, 0.2470588, 0, 1,
-1.716868, -1.163111, -3.980199, 1, 0.2509804, 0, 1,
-1.696066, 0.9304873, -0.4307083, 1, 0.2588235, 0, 1,
-1.691241, 0.7729148, -0.2213917, 1, 0.2627451, 0, 1,
-1.682867, -1.095491, -4.467371, 1, 0.2705882, 0, 1,
-1.67881, 0.8954857, -1.796401, 1, 0.2745098, 0, 1,
-1.661653, 1.731851, -0.009253736, 1, 0.282353, 0, 1,
-1.642616, 0.4274747, -2.233429, 1, 0.2862745, 0, 1,
-1.620557, -1.194453, -0.5298141, 1, 0.2941177, 0, 1,
-1.620133, 1.317939, -0.06503771, 1, 0.3019608, 0, 1,
-1.610074, -2.103179, -2.271384, 1, 0.3058824, 0, 1,
-1.606719, -0.9674933, -2.933987, 1, 0.3137255, 0, 1,
-1.599516, 0.1958402, -2.076244, 1, 0.3176471, 0, 1,
-1.579731, 0.8538793, -2.577371, 1, 0.3254902, 0, 1,
-1.576721, -0.4184933, -1.434368, 1, 0.3294118, 0, 1,
-1.56411, -0.03312466, -2.110494, 1, 0.3372549, 0, 1,
-1.549561, -0.3694519, -1.158595, 1, 0.3411765, 0, 1,
-1.547428, -0.3743321, -1.762772, 1, 0.3490196, 0, 1,
-1.546661, 0.09371827, 0.310195, 1, 0.3529412, 0, 1,
-1.536331, 2.111096, -1.265115, 1, 0.3607843, 0, 1,
-1.516906, 0.3003903, -1.776685, 1, 0.3647059, 0, 1,
-1.504294, 0.4125151, -1.510718, 1, 0.372549, 0, 1,
-1.502843, 0.2450138, -2.101835, 1, 0.3764706, 0, 1,
-1.501571, -0.7751811, -4.44333, 1, 0.3843137, 0, 1,
-1.489638, 2.606988, -0.7146338, 1, 0.3882353, 0, 1,
-1.480579, -0.1639716, -1.351556, 1, 0.3960784, 0, 1,
-1.478655, -1.591079, -2.437872, 1, 0.4039216, 0, 1,
-1.476166, -0.9882584, -0.3720454, 1, 0.4078431, 0, 1,
-1.473685, -0.3093056, -2.006553, 1, 0.4156863, 0, 1,
-1.459118, 0.3181497, -1.284428, 1, 0.4196078, 0, 1,
-1.457322, 1.40169, -0.5198534, 1, 0.427451, 0, 1,
-1.454728, 0.03344307, -1.339791, 1, 0.4313726, 0, 1,
-1.45345, 0.3934433, -2.41597, 1, 0.4392157, 0, 1,
-1.44183, 2.587757, -0.6415977, 1, 0.4431373, 0, 1,
-1.441184, -0.33505, -1.468068, 1, 0.4509804, 0, 1,
-1.407706, -0.4267446, -0.7415874, 1, 0.454902, 0, 1,
-1.404405, -0.627122, -1.524612, 1, 0.4627451, 0, 1,
-1.401984, 0.03275084, -0.1501191, 1, 0.4666667, 0, 1,
-1.401871, -0.9739944, -1.797168, 1, 0.4745098, 0, 1,
-1.396445, -0.3815045, -0.3906977, 1, 0.4784314, 0, 1,
-1.387739, -1.450835, -2.934156, 1, 0.4862745, 0, 1,
-1.385286, 0.6899013, 0.302463, 1, 0.4901961, 0, 1,
-1.384813, 0.7311629, 0.2028996, 1, 0.4980392, 0, 1,
-1.382543, 0.7311454, 1.25888, 1, 0.5058824, 0, 1,
-1.368017, -0.5933433, -2.52936, 1, 0.509804, 0, 1,
-1.364567, -0.06485029, -3.039657, 1, 0.5176471, 0, 1,
-1.359339, 0.8472217, -1.42598, 1, 0.5215687, 0, 1,
-1.353924, 1.469651, -1.611534, 1, 0.5294118, 0, 1,
-1.343607, -1.467398, -2.356622, 1, 0.5333334, 0, 1,
-1.341816, -1.656991, -0.5527883, 1, 0.5411765, 0, 1,
-1.333002, -2.572982, -3.141021, 1, 0.5450981, 0, 1,
-1.324168, 2.180222, -0.3856045, 1, 0.5529412, 0, 1,
-1.320128, 1.030771, -2.007656, 1, 0.5568628, 0, 1,
-1.31024, -1.528048, -2.967117, 1, 0.5647059, 0, 1,
-1.309914, 0.5999213, -2.224463, 1, 0.5686275, 0, 1,
-1.302282, -0.4991066, -2.866896, 1, 0.5764706, 0, 1,
-1.28438, -0.4407897, -1.432074, 1, 0.5803922, 0, 1,
-1.275987, -0.476077, -0.4167921, 1, 0.5882353, 0, 1,
-1.274777, -0.113401, -2.295164, 1, 0.5921569, 0, 1,
-1.270583, 0.7009826, 1.245293, 1, 0.6, 0, 1,
-1.259251, 1.131531, -2.471568, 1, 0.6078432, 0, 1,
-1.245465, -0.5523495, -2.414185, 1, 0.6117647, 0, 1,
-1.229456, -0.222441, -0.8497909, 1, 0.6196079, 0, 1,
-1.227594, -0.1370451, -2.295563, 1, 0.6235294, 0, 1,
-1.227189, 0.4419112, -0.5862784, 1, 0.6313726, 0, 1,
-1.214776, -2.222316, -3.49163, 1, 0.6352941, 0, 1,
-1.212861, 1.488419, -1.032925, 1, 0.6431373, 0, 1,
-1.210332, 0.82626, -0.1628505, 1, 0.6470588, 0, 1,
-1.201083, 0.04029627, -2.675835, 1, 0.654902, 0, 1,
-1.198622, -0.7544805, -1.913378, 1, 0.6588235, 0, 1,
-1.19614, -0.4361905, -2.133014, 1, 0.6666667, 0, 1,
-1.194059, -1.190578, -2.807643, 1, 0.6705883, 0, 1,
-1.177868, -0.1501671, -2.546603, 1, 0.6784314, 0, 1,
-1.177153, -0.8126806, -3.360976, 1, 0.682353, 0, 1,
-1.172555, 0.5079054, -1.826075, 1, 0.6901961, 0, 1,
-1.171275, -2.011644, -4.36861, 1, 0.6941177, 0, 1,
-1.161099, 0.1925178, -0.1831986, 1, 0.7019608, 0, 1,
-1.15901, -0.6726192, -2.520649, 1, 0.7098039, 0, 1,
-1.153231, 0.4289991, -0.4539286, 1, 0.7137255, 0, 1,
-1.14899, 0.03238054, -1.617151, 1, 0.7215686, 0, 1,
-1.14728, 1.10327, 0.3960845, 1, 0.7254902, 0, 1,
-1.132305, -0.9102103, -4.676558, 1, 0.7333333, 0, 1,
-1.129288, 0.3262504, -0.685071, 1, 0.7372549, 0, 1,
-1.127022, 0.8225005, -1.969071, 1, 0.7450981, 0, 1,
-1.121789, 1.103431, -2.719451, 1, 0.7490196, 0, 1,
-1.119159, 0.7298771, -0.2766318, 1, 0.7568628, 0, 1,
-1.104749, 0.5721796, -1.810364, 1, 0.7607843, 0, 1,
-1.10412, 1.662757, 0.2747099, 1, 0.7686275, 0, 1,
-1.101917, 0.2807207, -1.402668, 1, 0.772549, 0, 1,
-1.10142, 1.307752, 0.2638055, 1, 0.7803922, 0, 1,
-1.09956, -1.28421, -1.73775, 1, 0.7843137, 0, 1,
-1.095581, 0.6053112, -2.340897, 1, 0.7921569, 0, 1,
-1.094111, 0.01036915, 1.135476, 1, 0.7960784, 0, 1,
-1.083584, -0.7843136, -2.078828, 1, 0.8039216, 0, 1,
-1.081404, -0.4598171, -2.201823, 1, 0.8117647, 0, 1,
-1.072169, -0.9345075, -2.228421, 1, 0.8156863, 0, 1,
-1.071889, -0.6017517, -2.223519, 1, 0.8235294, 0, 1,
-1.069834, 1.737182, -0.5328355, 1, 0.827451, 0, 1,
-1.060678, -0.3399197, -1.62113, 1, 0.8352941, 0, 1,
-1.057498, 0.9159949, -0.007798986, 1, 0.8392157, 0, 1,
-1.056544, -0.117089, -3.052519, 1, 0.8470588, 0, 1,
-1.052026, -1.815701, -2.351978, 1, 0.8509804, 0, 1,
-1.043037, 0.9564171, -0.4032333, 1, 0.8588235, 0, 1,
-1.036748, 1.331424, -0.4182935, 1, 0.8627451, 0, 1,
-1.035146, 0.2590034, -2.777622, 1, 0.8705882, 0, 1,
-1.031217, -0.03260697, -2.295018, 1, 0.8745098, 0, 1,
-1.027856, -0.5838614, -1.986963, 1, 0.8823529, 0, 1,
-1.020504, 0.02740396, -1.684703, 1, 0.8862745, 0, 1,
-1.019247, 0.6024472, 0.7166862, 1, 0.8941177, 0, 1,
-1.014721, 0.5924009, -1.250554, 1, 0.8980392, 0, 1,
-1.01418, -0.916658, 0.2806531, 1, 0.9058824, 0, 1,
-1.001421, -0.5910512, -1.221449, 1, 0.9137255, 0, 1,
-1.001332, -1.521888, -2.67616, 1, 0.9176471, 0, 1,
-0.9986381, 1.319698, -0.3542704, 1, 0.9254902, 0, 1,
-0.9960394, -0.1530116, -0.9854704, 1, 0.9294118, 0, 1,
-0.9920005, -0.2997743, -2.194376, 1, 0.9372549, 0, 1,
-0.9795771, 0.526592, 1.005667, 1, 0.9411765, 0, 1,
-0.9793493, 0.4490284, -0.6698142, 1, 0.9490196, 0, 1,
-0.9591776, 0.03996598, -2.550358, 1, 0.9529412, 0, 1,
-0.9416564, -0.3099134, -0.3335827, 1, 0.9607843, 0, 1,
-0.9374541, -0.4621932, -2.250555, 1, 0.9647059, 0, 1,
-0.9372733, 0.9920726, 0.7407435, 1, 0.972549, 0, 1,
-0.9370443, -0.2617593, -1.474252, 1, 0.9764706, 0, 1,
-0.9318258, -0.9241633, -3.528214, 1, 0.9843137, 0, 1,
-0.9204878, -0.3543151, -0.8134192, 1, 0.9882353, 0, 1,
-0.9191549, 1.173215, -1.9154, 1, 0.9960784, 0, 1,
-0.9161603, 1.459874, -1.286497, 0.9960784, 1, 0, 1,
-0.913707, 1.089498, -0.1324889, 0.9921569, 1, 0, 1,
-0.9085878, -0.1983183, -2.442918, 0.9843137, 1, 0, 1,
-0.905835, -0.3197618, -3.382503, 0.9803922, 1, 0, 1,
-0.9042695, 0.004945147, -2.678443, 0.972549, 1, 0, 1,
-0.9034082, -1.054583, -3.232251, 0.9686275, 1, 0, 1,
-0.8975154, -0.9325873, -1.291015, 0.9607843, 1, 0, 1,
-0.8953006, 1.343665, -2.25205, 0.9568627, 1, 0, 1,
-0.8926252, 1.033238, -0.2750981, 0.9490196, 1, 0, 1,
-0.8909257, -0.1849556, -3.316647, 0.945098, 1, 0, 1,
-0.8875974, -0.7985508, -2.199773, 0.9372549, 1, 0, 1,
-0.8833409, 1.73874, -3.443891, 0.9333333, 1, 0, 1,
-0.8765009, 0.637606, -0.1416604, 0.9254902, 1, 0, 1,
-0.8740917, 1.315617, -0.7679761, 0.9215686, 1, 0, 1,
-0.8734044, -0.3688179, 0.4407689, 0.9137255, 1, 0, 1,
-0.869355, -0.3588726, -1.719061, 0.9098039, 1, 0, 1,
-0.8693545, 0.04289749, -1.197219, 0.9019608, 1, 0, 1,
-0.8683367, -0.1772521, -3.307129, 0.8941177, 1, 0, 1,
-0.86707, -1.186934, -1.055301, 0.8901961, 1, 0, 1,
-0.8632098, 1.658644, 0.1314518, 0.8823529, 1, 0, 1,
-0.8611739, 0.4919876, -0.6616161, 0.8784314, 1, 0, 1,
-0.8562236, 0.04606853, -2.351204, 0.8705882, 1, 0, 1,
-0.8557248, 1.263001, -0.4365829, 0.8666667, 1, 0, 1,
-0.8543233, -1.137216, -0.8962254, 0.8588235, 1, 0, 1,
-0.8502433, 0.2017594, -0.5576252, 0.854902, 1, 0, 1,
-0.8501357, 0.3389947, -2.363158, 0.8470588, 1, 0, 1,
-0.8484775, 1.145549, -0.1396969, 0.8431373, 1, 0, 1,
-0.8468005, -0.2059583, -1.818889, 0.8352941, 1, 0, 1,
-0.8424433, 0.6036929, -0.2088228, 0.8313726, 1, 0, 1,
-0.8374672, -0.08879431, -1.756568, 0.8235294, 1, 0, 1,
-0.8309214, 0.3181429, -2.369404, 0.8196079, 1, 0, 1,
-0.8307989, 1.626735, -0.8290222, 0.8117647, 1, 0, 1,
-0.8135365, -0.6304283, -2.503001, 0.8078431, 1, 0, 1,
-0.811062, -0.7776167, -1.442107, 0.8, 1, 0, 1,
-0.8102267, 0.2421037, -2.972704, 0.7921569, 1, 0, 1,
-0.8086644, -0.7310015, -2.367214, 0.7882353, 1, 0, 1,
-0.8066714, -1.035789, -1.988255, 0.7803922, 1, 0, 1,
-0.8059154, -0.05602158, -2.200846, 0.7764706, 1, 0, 1,
-0.7988957, 0.2142413, -1.922131, 0.7686275, 1, 0, 1,
-0.7947876, -1.007415, -2.705859, 0.7647059, 1, 0, 1,
-0.7933228, 1.791904, 1.2373, 0.7568628, 1, 0, 1,
-0.7927598, -0.4238794, -3.352714, 0.7529412, 1, 0, 1,
-0.7916589, -0.2245494, -1.947698, 0.7450981, 1, 0, 1,
-0.7915874, -0.2362195, -1.465055, 0.7411765, 1, 0, 1,
-0.7898949, -0.9427551, -0.6230333, 0.7333333, 1, 0, 1,
-0.7853029, -0.6103362, -1.88334, 0.7294118, 1, 0, 1,
-0.7818545, 1.339556, 1.22506, 0.7215686, 1, 0, 1,
-0.7768599, -0.6447276, -3.033323, 0.7176471, 1, 0, 1,
-0.7768576, -0.2238742, -1.449707, 0.7098039, 1, 0, 1,
-0.7748401, 1.269421, -1.511417, 0.7058824, 1, 0, 1,
-0.7731715, -0.2051289, -4.397501, 0.6980392, 1, 0, 1,
-0.7725768, 1.930002, -0.3811026, 0.6901961, 1, 0, 1,
-0.763527, 1.000826, -0.1573022, 0.6862745, 1, 0, 1,
-0.7565841, -0.7871609, -1.508186, 0.6784314, 1, 0, 1,
-0.7548006, -1.465103, -3.292455, 0.6745098, 1, 0, 1,
-0.7529188, -0.9320144, -4.239561, 0.6666667, 1, 0, 1,
-0.7457129, -1.234015, -3.939851, 0.6627451, 1, 0, 1,
-0.7422063, -0.2453978, -0.4767978, 0.654902, 1, 0, 1,
-0.7411004, -0.4007922, -2.652204, 0.6509804, 1, 0, 1,
-0.7286226, 1.192769, -0.5631882, 0.6431373, 1, 0, 1,
-0.7257161, -0.3262308, -0.9229151, 0.6392157, 1, 0, 1,
-0.7250519, 1.118171, -0.3442916, 0.6313726, 1, 0, 1,
-0.7233557, 0.09362131, -2.336859, 0.627451, 1, 0, 1,
-0.7154286, -0.004042958, -0.983847, 0.6196079, 1, 0, 1,
-0.7151492, 1.778619, -1.72677, 0.6156863, 1, 0, 1,
-0.7133428, 0.3803711, -1.19577, 0.6078432, 1, 0, 1,
-0.7125151, 1.283059, -1.561857, 0.6039216, 1, 0, 1,
-0.7121426, -0.9356619, -3.776426, 0.5960785, 1, 0, 1,
-0.7089984, 0.4678855, -0.6571885, 0.5882353, 1, 0, 1,
-0.7085792, 0.7779939, -0.7677487, 0.5843138, 1, 0, 1,
-0.7013555, 0.4688817, -0.6295114, 0.5764706, 1, 0, 1,
-0.6956499, 1.852578, -1.283421, 0.572549, 1, 0, 1,
-0.694904, 1.155794, 0.6033604, 0.5647059, 1, 0, 1,
-0.6883405, -1.409723, -2.407915, 0.5607843, 1, 0, 1,
-0.6872199, 0.7286485, -2.753515, 0.5529412, 1, 0, 1,
-0.6859828, -1.698348, -2.062241, 0.5490196, 1, 0, 1,
-0.6843163, 1.06361, -1.330904, 0.5411765, 1, 0, 1,
-0.6782582, 0.9656364, -0.3042624, 0.5372549, 1, 0, 1,
-0.6761296, 0.08718508, -2.349505, 0.5294118, 1, 0, 1,
-0.6710173, 0.3790068, -0.2571356, 0.5254902, 1, 0, 1,
-0.6680067, -0.8579546, -3.562063, 0.5176471, 1, 0, 1,
-0.6661757, -0.8059886, -0.4629665, 0.5137255, 1, 0, 1,
-0.6600953, -1.193847, -1.910253, 0.5058824, 1, 0, 1,
-0.6581427, 0.04796505, -0.780551, 0.5019608, 1, 0, 1,
-0.6576389, -2.397716, -2.963978, 0.4941176, 1, 0, 1,
-0.6567792, -0.0400716, -1.508339, 0.4862745, 1, 0, 1,
-0.6546112, 0.8622706, -0.01405566, 0.4823529, 1, 0, 1,
-0.6514064, -1.508772, -3.575346, 0.4745098, 1, 0, 1,
-0.6502706, 2.123651, 1.027256, 0.4705882, 1, 0, 1,
-0.6477746, 1.545315, -0.9143528, 0.4627451, 1, 0, 1,
-0.6461579, -0.371793, -1.340196, 0.4588235, 1, 0, 1,
-0.6416965, -0.8804682, -2.160521, 0.4509804, 1, 0, 1,
-0.6408587, -0.3642587, -1.582008, 0.4470588, 1, 0, 1,
-0.6404597, 0.3467793, -0.8011752, 0.4392157, 1, 0, 1,
-0.6397786, 0.5513855, -1.396185, 0.4352941, 1, 0, 1,
-0.6368244, -0.707572, -1.173879, 0.427451, 1, 0, 1,
-0.6366504, 1.189526, 0.5119308, 0.4235294, 1, 0, 1,
-0.6360484, 0.4083116, 0.2784714, 0.4156863, 1, 0, 1,
-0.6315786, 0.8724574, -1.154882, 0.4117647, 1, 0, 1,
-0.6293962, 0.8184661, 0.2331563, 0.4039216, 1, 0, 1,
-0.6279951, 0.5329517, -0.8935431, 0.3960784, 1, 0, 1,
-0.627603, -0.9246528, -1.998992, 0.3921569, 1, 0, 1,
-0.626325, -1.109267, -1.548845, 0.3843137, 1, 0, 1,
-0.6243256, -0.3555005, -2.476837, 0.3803922, 1, 0, 1,
-0.618673, 0.3255747, -0.8049541, 0.372549, 1, 0, 1,
-0.6170917, -0.6435001, -1.686377, 0.3686275, 1, 0, 1,
-0.6124594, -0.09371964, -1.025006, 0.3607843, 1, 0, 1,
-0.6115403, -0.5341383, -2.036512, 0.3568628, 1, 0, 1,
-0.6102285, 1.213297, -0.6151973, 0.3490196, 1, 0, 1,
-0.6070104, -1.945367, -3.293572, 0.345098, 1, 0, 1,
-0.600819, -1.671171, -3.085998, 0.3372549, 1, 0, 1,
-0.6001943, -0.9928393, -1.366683, 0.3333333, 1, 0, 1,
-0.5964419, 0.6355147, -0.7052365, 0.3254902, 1, 0, 1,
-0.5961977, 0.1701391, -1.650418, 0.3215686, 1, 0, 1,
-0.5947872, -0.8871595, -3.192122, 0.3137255, 1, 0, 1,
-0.5918754, -0.2718151, -2.616335, 0.3098039, 1, 0, 1,
-0.5912558, 1.063765, -0.1087513, 0.3019608, 1, 0, 1,
-0.5901645, 0.01552834, -1.286112, 0.2941177, 1, 0, 1,
-0.5847223, 0.07246667, 0.5446938, 0.2901961, 1, 0, 1,
-0.5833551, 0.250609, -0.7045065, 0.282353, 1, 0, 1,
-0.5706313, 0.6003521, -1.354153, 0.2784314, 1, 0, 1,
-0.5699117, 2.001749, -0.01897595, 0.2705882, 1, 0, 1,
-0.5689589, 0.3512925, -2.02582, 0.2666667, 1, 0, 1,
-0.5643682, 1.255009, -0.01895545, 0.2588235, 1, 0, 1,
-0.5568281, 0.8625664, 1.685633, 0.254902, 1, 0, 1,
-0.5562278, -1.633052, -1.812616, 0.2470588, 1, 0, 1,
-0.5545247, 0.5069189, 1.149122, 0.2431373, 1, 0, 1,
-0.5477608, 1.181287, -0.8523383, 0.2352941, 1, 0, 1,
-0.5448368, -0.304347, -1.642915, 0.2313726, 1, 0, 1,
-0.5446605, -0.7958152, -2.999282, 0.2235294, 1, 0, 1,
-0.5441756, -0.8358343, -2.946718, 0.2196078, 1, 0, 1,
-0.5438429, -1.109361, -3.871949, 0.2117647, 1, 0, 1,
-0.5420036, 1.660912, 0.7626625, 0.2078431, 1, 0, 1,
-0.539576, -0.02366572, -2.552306, 0.2, 1, 0, 1,
-0.5375701, 0.5582051, -1.069475, 0.1921569, 1, 0, 1,
-0.5334057, -2.205953, -3.670768, 0.1882353, 1, 0, 1,
-0.5331923, 1.417952, -0.7576173, 0.1803922, 1, 0, 1,
-0.5324789, -0.9441189, -1.962204, 0.1764706, 1, 0, 1,
-0.5302795, -0.1184138, -0.7116863, 0.1686275, 1, 0, 1,
-0.5275685, 0.4136416, 0.2999451, 0.1647059, 1, 0, 1,
-0.5234966, -0.6318187, -1.79262, 0.1568628, 1, 0, 1,
-0.5200174, 0.1949379, 0.320601, 0.1529412, 1, 0, 1,
-0.519102, -0.4015847, -2.425883, 0.145098, 1, 0, 1,
-0.5129629, 0.8006425, -1.849102, 0.1411765, 1, 0, 1,
-0.5115045, -0.01443293, -0.6989565, 0.1333333, 1, 0, 1,
-0.511056, -0.006491052, -1.164171, 0.1294118, 1, 0, 1,
-0.5075846, -1.213874, -3.184025, 0.1215686, 1, 0, 1,
-0.5063554, 0.5020531, -0.877031, 0.1176471, 1, 0, 1,
-0.5023406, -0.4237789, -1.853255, 0.1098039, 1, 0, 1,
-0.5020831, -0.4778929, -2.340566, 0.1058824, 1, 0, 1,
-0.5017053, 0.4749435, -0.2479998, 0.09803922, 1, 0, 1,
-0.5003509, -0.4870737, -1.369016, 0.09019608, 1, 0, 1,
-0.4931577, 0.5029471, -0.1968871, 0.08627451, 1, 0, 1,
-0.4916587, -0.543538, -2.762044, 0.07843138, 1, 0, 1,
-0.490208, -1.929937, -2.482564, 0.07450981, 1, 0, 1,
-0.4843906, 0.9012918, 1.134264, 0.06666667, 1, 0, 1,
-0.4836953, 0.4561905, -1.898507, 0.0627451, 1, 0, 1,
-0.4831893, 0.3243535, -1.348201, 0.05490196, 1, 0, 1,
-0.4781628, -0.5863765, -3.135139, 0.05098039, 1, 0, 1,
-0.4731236, 0.5593234, 0.1403252, 0.04313726, 1, 0, 1,
-0.4680161, -0.4163695, -2.316927, 0.03921569, 1, 0, 1,
-0.4678715, 0.9649705, 0.1043948, 0.03137255, 1, 0, 1,
-0.4609868, -0.606482, -1.3918, 0.02745098, 1, 0, 1,
-0.460925, -0.0545667, -1.162073, 0.01960784, 1, 0, 1,
-0.4603042, 0.6609635, 0.816592, 0.01568628, 1, 0, 1,
-0.455209, 0.4572986, -0.1314449, 0.007843138, 1, 0, 1,
-0.4550377, -0.3745542, -2.153055, 0.003921569, 1, 0, 1,
-0.4539496, -1.351404, -2.290643, 0, 1, 0.003921569, 1,
-0.4528618, -0.1858327, -2.422266, 0, 1, 0.01176471, 1,
-0.4523569, -0.852631, -3.686096, 0, 1, 0.01568628, 1,
-0.4522268, -1.403111, -3.605721, 0, 1, 0.02352941, 1,
-0.4498648, 0.0380303, -1.026438, 0, 1, 0.02745098, 1,
-0.4468891, -0.6945822, -2.09934, 0, 1, 0.03529412, 1,
-0.4467905, 1.086766, -0.6722015, 0, 1, 0.03921569, 1,
-0.4426005, -0.2269976, -2.429485, 0, 1, 0.04705882, 1,
-0.4420604, -2.308488, -1.642747, 0, 1, 0.05098039, 1,
-0.4408378, -3.196924, -2.339868, 0, 1, 0.05882353, 1,
-0.437282, -0.3787924, -0.8591765, 0, 1, 0.0627451, 1,
-0.4367268, 0.9212258, -0.005629804, 0, 1, 0.07058824, 1,
-0.4323081, -0.4876823, -3.081633, 0, 1, 0.07450981, 1,
-0.4289594, 0.7518123, 1.258833, 0, 1, 0.08235294, 1,
-0.4271075, -0.4268966, -2.553955, 0, 1, 0.08627451, 1,
-0.4264196, -0.5518485, -3.693018, 0, 1, 0.09411765, 1,
-0.4256172, -1.174905, -4.357241, 0, 1, 0.1019608, 1,
-0.4130909, 0.6145917, -1.107737, 0, 1, 0.1058824, 1,
-0.4121834, 0.1508921, 0.07549497, 0, 1, 0.1137255, 1,
-0.4081286, -0.1444755, -2.357162, 0, 1, 0.1176471, 1,
-0.4080181, 0.6326525, 1.117295, 0, 1, 0.1254902, 1,
-0.4052725, -0.7692335, -1.830621, 0, 1, 0.1294118, 1,
-0.4027272, -0.3803978, -3.022056, 0, 1, 0.1372549, 1,
-0.3983223, -1.394687, -2.65679, 0, 1, 0.1411765, 1,
-0.3936992, -0.6228778, -3.357205, 0, 1, 0.1490196, 1,
-0.3882537, -0.01114442, -1.385161, 0, 1, 0.1529412, 1,
-0.387202, 0.5010267, -1.988249, 0, 1, 0.1607843, 1,
-0.3805091, 0.02374009, -1.72273, 0, 1, 0.1647059, 1,
-0.3799709, -0.02892735, 0.1190664, 0, 1, 0.172549, 1,
-0.3785748, -0.2888213, -2.443399, 0, 1, 0.1764706, 1,
-0.3765003, 2.093889, -0.3370181, 0, 1, 0.1843137, 1,
-0.3713246, 0.7930213, -2.137404, 0, 1, 0.1882353, 1,
-0.3697996, 0.8479053, -0.6151468, 0, 1, 0.1960784, 1,
-0.3671244, 0.8001788, -0.6359259, 0, 1, 0.2039216, 1,
-0.3666582, -0.5675676, -2.760842, 0, 1, 0.2078431, 1,
-0.366393, 0.4634214, -0.002148779, 0, 1, 0.2156863, 1,
-0.3618172, 0.1018393, -3.881996, 0, 1, 0.2196078, 1,
-0.3562959, 0.5294605, -2.473279, 0, 1, 0.227451, 1,
-0.3560171, 0.8036126, -0.5843282, 0, 1, 0.2313726, 1,
-0.3552566, -0.04028174, -2.562761, 0, 1, 0.2392157, 1,
-0.3485328, 0.3430142, 0.8584297, 0, 1, 0.2431373, 1,
-0.3471118, 1.161781, 0.5910373, 0, 1, 0.2509804, 1,
-0.3444899, 1.304867, -1.802585, 0, 1, 0.254902, 1,
-0.3400345, 0.02042322, -3.475129, 0, 1, 0.2627451, 1,
-0.3371337, -0.4718847, -3.268512, 0, 1, 0.2666667, 1,
-0.3357668, 1.897521, -0.8741875, 0, 1, 0.2745098, 1,
-0.3355693, 1.407713, 1.044509, 0, 1, 0.2784314, 1,
-0.3337196, -1.47629, -1.530009, 0, 1, 0.2862745, 1,
-0.3316239, 0.9447574, 0.4201123, 0, 1, 0.2901961, 1,
-0.3314848, -1.010917, -2.243551, 0, 1, 0.2980392, 1,
-0.3268412, -0.8217791, -1.179746, 0, 1, 0.3058824, 1,
-0.3267586, -1.091439, -2.76158, 0, 1, 0.3098039, 1,
-0.3198121, 0.5317162, 0.3996812, 0, 1, 0.3176471, 1,
-0.3119734, 0.8850445, -0.2895664, 0, 1, 0.3215686, 1,
-0.3104786, 1.574373, 0.696241, 0, 1, 0.3294118, 1,
-0.3102454, 0.9026309, 0.3627291, 0, 1, 0.3333333, 1,
-0.307383, -0.8307041, -1.958558, 0, 1, 0.3411765, 1,
-0.306218, -0.7665598, -2.581165, 0, 1, 0.345098, 1,
-0.3001724, -1.737412, -2.451418, 0, 1, 0.3529412, 1,
-0.2987532, 0.8814349, -1.403602, 0, 1, 0.3568628, 1,
-0.2962987, -2.055876, -4.11652, 0, 1, 0.3647059, 1,
-0.2899313, -0.3395673, -2.468024, 0, 1, 0.3686275, 1,
-0.2889192, 0.9279707, 0.2121781, 0, 1, 0.3764706, 1,
-0.2865812, 0.212486, -1.226669, 0, 1, 0.3803922, 1,
-0.285992, -0.9175131, -4.253587, 0, 1, 0.3882353, 1,
-0.2826049, 0.130626, -0.5997379, 0, 1, 0.3921569, 1,
-0.2808306, -2.01491, -3.360183, 0, 1, 0.4, 1,
-0.2798673, 0.9223753, -0.8381132, 0, 1, 0.4078431, 1,
-0.2768033, -0.03906447, -1.744606, 0, 1, 0.4117647, 1,
-0.2737213, -0.02525431, -2.038443, 0, 1, 0.4196078, 1,
-0.2732476, -0.06629675, -3.093451, 0, 1, 0.4235294, 1,
-0.2658648, 0.1462552, -0.8710122, 0, 1, 0.4313726, 1,
-0.2654442, 0.02272611, -0.9358369, 0, 1, 0.4352941, 1,
-0.2619666, -0.3409049, -2.999588, 0, 1, 0.4431373, 1,
-0.2582712, -0.6667918, -1.928228, 0, 1, 0.4470588, 1,
-0.2577127, -0.9149371, -4.03269, 0, 1, 0.454902, 1,
-0.254369, -0.9067864, -3.314254, 0, 1, 0.4588235, 1,
-0.2540752, -1.654722, -2.657166, 0, 1, 0.4666667, 1,
-0.2495941, -0.5865653, -3.098639, 0, 1, 0.4705882, 1,
-0.2482012, -0.6650281, -4.140309, 0, 1, 0.4784314, 1,
-0.2466529, -0.5158843, -2.040351, 0, 1, 0.4823529, 1,
-0.2445137, -0.1957686, -3.399301, 0, 1, 0.4901961, 1,
-0.2391087, 0.6449495, 0.3514802, 0, 1, 0.4941176, 1,
-0.2342902, 0.5953515, 0.4758867, 0, 1, 0.5019608, 1,
-0.2340942, 1.413521, 0.5376105, 0, 1, 0.509804, 1,
-0.2324193, 0.2488574, -0.4221081, 0, 1, 0.5137255, 1,
-0.2318487, -0.534441, -1.678125, 0, 1, 0.5215687, 1,
-0.230641, -2.458989, -3.121924, 0, 1, 0.5254902, 1,
-0.2269718, 0.3226712, -1.125886, 0, 1, 0.5333334, 1,
-0.2253522, 0.02314447, -1.567129, 0, 1, 0.5372549, 1,
-0.2251947, -0.5240467, -2.185286, 0, 1, 0.5450981, 1,
-0.2231483, -0.9864309, -1.734591, 0, 1, 0.5490196, 1,
-0.2230899, -0.3917449, -2.987823, 0, 1, 0.5568628, 1,
-0.2214224, -0.3348744, -2.430524, 0, 1, 0.5607843, 1,
-0.2199605, 0.147186, -1.090274, 0, 1, 0.5686275, 1,
-0.2084186, -0.1165365, -3.077412, 0, 1, 0.572549, 1,
-0.2083409, -1.510134, -4.637858, 0, 1, 0.5803922, 1,
-0.2073079, 0.5232473, -0.7387729, 0, 1, 0.5843138, 1,
-0.2063992, -0.8158358, -3.84023, 0, 1, 0.5921569, 1,
-0.2046938, 0.3894811, 0.7612175, 0, 1, 0.5960785, 1,
-0.2040831, -0.3095928, -1.404838, 0, 1, 0.6039216, 1,
-0.1969666, -1.315458, -2.462238, 0, 1, 0.6117647, 1,
-0.1940219, 0.6833912, 0.9811286, 0, 1, 0.6156863, 1,
-0.1912382, 0.1729488, -1.155468, 0, 1, 0.6235294, 1,
-0.188266, -1.732775, -1.710751, 0, 1, 0.627451, 1,
-0.187945, -0.4335606, -1.539179, 0, 1, 0.6352941, 1,
-0.1878647, -1.279154, -2.89637, 0, 1, 0.6392157, 1,
-0.1855264, 0.1453009, -0.1219485, 0, 1, 0.6470588, 1,
-0.1785719, -0.3048857, -2.598815, 0, 1, 0.6509804, 1,
-0.1782792, -0.3892295, -2.11715, 0, 1, 0.6588235, 1,
-0.1733864, -0.827162, -3.474803, 0, 1, 0.6627451, 1,
-0.1717167, 1.383525, -0.7796054, 0, 1, 0.6705883, 1,
-0.1682223, 0.9775658, -1.413722, 0, 1, 0.6745098, 1,
-0.1644524, 0.7069639, -1.706412, 0, 1, 0.682353, 1,
-0.1618769, 0.7354264, 0.6651613, 0, 1, 0.6862745, 1,
-0.1594806, -1.305379, -2.91158, 0, 1, 0.6941177, 1,
-0.1588541, -0.8875454, -3.172392, 0, 1, 0.7019608, 1,
-0.1567539, -0.2435705, -3.791285, 0, 1, 0.7058824, 1,
-0.1461585, 0.4543196, 0.6802498, 0, 1, 0.7137255, 1,
-0.1303326, 0.479688, 1.387998, 0, 1, 0.7176471, 1,
-0.1285135, -0.008323842, -1.317854, 0, 1, 0.7254902, 1,
-0.1240143, -0.1176639, -2.265226, 0, 1, 0.7294118, 1,
-0.1222025, 2.112811, 1.235542, 0, 1, 0.7372549, 1,
-0.1217863, -0.3845454, -3.91955, 0, 1, 0.7411765, 1,
-0.1185736, 0.8573502, 0.2481198, 0, 1, 0.7490196, 1,
-0.1185457, -0.7365242, -1.787279, 0, 1, 0.7529412, 1,
-0.1176626, 0.6105602, -2.249125, 0, 1, 0.7607843, 1,
-0.1148659, 1.525098, -0.3900428, 0, 1, 0.7647059, 1,
-0.1125772, 0.493802, 0.1796317, 0, 1, 0.772549, 1,
-0.1113034, -0.4231563, -3.797055, 0, 1, 0.7764706, 1,
-0.1072825, -0.2860214, -3.267435, 0, 1, 0.7843137, 1,
-0.09912381, -1.268179, -3.246476, 0, 1, 0.7882353, 1,
-0.09294444, -0.2922694, -2.475984, 0, 1, 0.7960784, 1,
-0.09283778, -0.9551914, -3.007336, 0, 1, 0.8039216, 1,
-0.09101357, 1.021775, -0.4939353, 0, 1, 0.8078431, 1,
-0.08997791, 1.791345, -1.070843, 0, 1, 0.8156863, 1,
-0.08820371, -1.344548, -4.261912, 0, 1, 0.8196079, 1,
-0.08742707, -1.061327, -4.740826, 0, 1, 0.827451, 1,
-0.08633763, -0.2433756, -2.455072, 0, 1, 0.8313726, 1,
-0.08417294, 1.054395, 0.719487, 0, 1, 0.8392157, 1,
-0.08080883, 2.240226, -0.2659665, 0, 1, 0.8431373, 1,
-0.08006842, -0.3243731, -3.39155, 0, 1, 0.8509804, 1,
-0.07842395, 0.2161913, -0.3711798, 0, 1, 0.854902, 1,
-0.07615536, 0.2998854, 0.326928, 0, 1, 0.8627451, 1,
-0.07554314, -0.6220698, -3.475455, 0, 1, 0.8666667, 1,
-0.07439758, 1.452084, 0.2442269, 0, 1, 0.8745098, 1,
-0.07275714, -0.3708698, -3.718745, 0, 1, 0.8784314, 1,
-0.06711479, -0.6469902, -3.215498, 0, 1, 0.8862745, 1,
-0.06491436, -1.692947, -3.007656, 0, 1, 0.8901961, 1,
-0.06217156, -0.4659252, -2.771334, 0, 1, 0.8980392, 1,
-0.06022847, -0.2548268, -4.489618, 0, 1, 0.9058824, 1,
-0.0540536, 0.2900778, 0.04180756, 0, 1, 0.9098039, 1,
-0.05333165, -0.3196412, -0.4900335, 0, 1, 0.9176471, 1,
-0.05262304, -0.9076603, -4.027402, 0, 1, 0.9215686, 1,
-0.05139171, 0.3722098, 0.7899904, 0, 1, 0.9294118, 1,
-0.04734614, -0.8517817, -4.038133, 0, 1, 0.9333333, 1,
-0.03666894, -0.08516938, -1.942493, 0, 1, 0.9411765, 1,
-0.03582544, -0.7013372, -2.522779, 0, 1, 0.945098, 1,
-0.03307863, -0.08760993, -2.261629, 0, 1, 0.9529412, 1,
-0.03159437, -0.7495613, -3.105616, 0, 1, 0.9568627, 1,
-0.02544903, -0.4765044, -2.85205, 0, 1, 0.9647059, 1,
-0.02398707, 0.2841194, -0.6437537, 0, 1, 0.9686275, 1,
-0.02397988, -2.294792, -3.172108, 0, 1, 0.9764706, 1,
-0.02390783, 0.8752274, 2.258671, 0, 1, 0.9803922, 1,
-0.02235428, -0.5547573, -1.901999, 0, 1, 0.9882353, 1,
-0.02126982, 0.6330076, -0.02312808, 0, 1, 0.9921569, 1,
-0.01580313, -0.2116197, -3.286707, 0, 1, 1, 1,
-0.01488432, 0.2081325, 1.169255, 0, 0.9921569, 1, 1,
-0.01479001, 0.5631994, -0.8679233, 0, 0.9882353, 1, 1,
-0.01309467, -0.4615423, -3.459186, 0, 0.9803922, 1, 1,
-0.003820889, 1.243178, 1.627269, 0, 0.9764706, 1, 1,
-0.002773541, 1.998614, 0.6575928, 0, 0.9686275, 1, 1,
-0.002134472, 0.1736614, 0.1768162, 0, 0.9647059, 1, 1,
7.758175e-05, 0.1625326, -1.125461, 0, 0.9568627, 1, 1,
0.0005895565, -0.3570955, 4.031904, 0, 0.9529412, 1, 1,
0.002181983, -0.1820691, 5.275627, 0, 0.945098, 1, 1,
0.005504016, -0.692285, 3.765817, 0, 0.9411765, 1, 1,
0.006918508, 1.701459, -1.366653, 0, 0.9333333, 1, 1,
0.008953667, 0.5393467, 0.7158061, 0, 0.9294118, 1, 1,
0.01181622, -0.4521775, 3.22454, 0, 0.9215686, 1, 1,
0.01371806, 0.9373252, -0.769605, 0, 0.9176471, 1, 1,
0.01615156, 1.507443, 2.244464, 0, 0.9098039, 1, 1,
0.02100549, -0.1817567, 2.771842, 0, 0.9058824, 1, 1,
0.02143158, 0.08579135, 0.4943845, 0, 0.8980392, 1, 1,
0.02659614, -0.914014, 3.342039, 0, 0.8901961, 1, 1,
0.02789653, 1.626225, 0.7040957, 0, 0.8862745, 1, 1,
0.0309768, -0.4582349, 2.419502, 0, 0.8784314, 1, 1,
0.03186157, -0.01472013, 2.590462, 0, 0.8745098, 1, 1,
0.03286914, -1.602394, 3.165204, 0, 0.8666667, 1, 1,
0.03420015, 0.6575389, -0.1919144, 0, 0.8627451, 1, 1,
0.03475524, 1.059016, -2.169425, 0, 0.854902, 1, 1,
0.0374741, 0.05974818, 1.619682, 0, 0.8509804, 1, 1,
0.03773041, -0.5329888, 3.605526, 0, 0.8431373, 1, 1,
0.04664479, 0.6257913, 0.6993325, 0, 0.8392157, 1, 1,
0.04806648, -0.2600767, 2.41026, 0, 0.8313726, 1, 1,
0.04921831, 0.5688207, -1.092975, 0, 0.827451, 1, 1,
0.04968476, 0.6034694, -0.8193953, 0, 0.8196079, 1, 1,
0.05147372, 1.387657, 0.6418555, 0, 0.8156863, 1, 1,
0.05271227, -0.4287015, 2.787204, 0, 0.8078431, 1, 1,
0.05280053, 0.5033667, -1.17421, 0, 0.8039216, 1, 1,
0.05301325, 0.09926341, 1.133364, 0, 0.7960784, 1, 1,
0.0554596, -1.58448, 2.888928, 0, 0.7882353, 1, 1,
0.05952644, -1.889302, 3.671678, 0, 0.7843137, 1, 1,
0.06017605, -0.8636752, 2.58092, 0, 0.7764706, 1, 1,
0.06088072, -0.6324762, 3.375531, 0, 0.772549, 1, 1,
0.06468289, 0.5453112, 0.4497524, 0, 0.7647059, 1, 1,
0.06694397, 0.09350365, 1.728809, 0, 0.7607843, 1, 1,
0.07071396, -0.08973116, 2.144227, 0, 0.7529412, 1, 1,
0.07205417, 0.07107498, 0.7747852, 0, 0.7490196, 1, 1,
0.07371034, -0.0518238, 2.873501, 0, 0.7411765, 1, 1,
0.07692703, -0.2468622, 4.624343, 0, 0.7372549, 1, 1,
0.07728368, -1.238189, 1.713929, 0, 0.7294118, 1, 1,
0.08189391, -1.496602, 4.077809, 0, 0.7254902, 1, 1,
0.08849579, -0.1196081, 1.871168, 0, 0.7176471, 1, 1,
0.09315799, 0.9205918, 0.4728678, 0, 0.7137255, 1, 1,
0.09751076, -0.052495, 2.672491, 0, 0.7058824, 1, 1,
0.09754618, -1.017952, 3.203804, 0, 0.6980392, 1, 1,
0.09767371, 0.4845365, -1.063446, 0, 0.6941177, 1, 1,
0.1018938, 0.09208059, 1.275214, 0, 0.6862745, 1, 1,
0.1025705, 1.01665, 0.004853297, 0, 0.682353, 1, 1,
0.103043, -1.333393, 3.31821, 0, 0.6745098, 1, 1,
0.1039789, -0.9519275, 3.927909, 0, 0.6705883, 1, 1,
0.1042027, -0.1888335, 1.7044, 0, 0.6627451, 1, 1,
0.1099284, -0.3000178, 2.439425, 0, 0.6588235, 1, 1,
0.1148253, 2.509221, -0.6825399, 0, 0.6509804, 1, 1,
0.1170639, -0.1726019, 1.779171, 0, 0.6470588, 1, 1,
0.119493, -0.2804057, 3.843671, 0, 0.6392157, 1, 1,
0.119567, 1.111337, 0.7992823, 0, 0.6352941, 1, 1,
0.1242725, 0.3727709, -0.6713732, 0, 0.627451, 1, 1,
0.1252192, -0.1561001, 4.367449, 0, 0.6235294, 1, 1,
0.125996, -0.6600016, 4.110997, 0, 0.6156863, 1, 1,
0.1275548, -0.2973549, 3.634052, 0, 0.6117647, 1, 1,
0.1424731, -0.3918929, 1.339043, 0, 0.6039216, 1, 1,
0.1438653, -0.4092694, 3.191015, 0, 0.5960785, 1, 1,
0.1460114, 0.2492178, 2.85764, 0, 0.5921569, 1, 1,
0.1513045, 0.9807484, -0.06573154, 0, 0.5843138, 1, 1,
0.1551947, -0.08262908, 2.002129, 0, 0.5803922, 1, 1,
0.1582461, 0.768672, 0.3167443, 0, 0.572549, 1, 1,
0.1610613, -0.2981615, 3.56648, 0, 0.5686275, 1, 1,
0.162772, -0.2294519, 1.679159, 0, 0.5607843, 1, 1,
0.163564, 0.0469873, 0.3161948, 0, 0.5568628, 1, 1,
0.1687306, 0.4344929, -0.2783477, 0, 0.5490196, 1, 1,
0.1706749, 0.4939318, -0.1861577, 0, 0.5450981, 1, 1,
0.1724296, -1.481388, 2.131972, 0, 0.5372549, 1, 1,
0.1724434, 1.545864, 0.0792997, 0, 0.5333334, 1, 1,
0.1866706, 0.6825212, -0.2567477, 0, 0.5254902, 1, 1,
0.1867498, -0.02473121, 4.291718, 0, 0.5215687, 1, 1,
0.1885484, 1.142416, 1.121521, 0, 0.5137255, 1, 1,
0.1939812, 0.911472, -1.180385, 0, 0.509804, 1, 1,
0.1971764, -0.9686041, 2.779548, 0, 0.5019608, 1, 1,
0.1977112, 2.001475, 2.295386, 0, 0.4941176, 1, 1,
0.1978019, 1.973244, -2.047529, 0, 0.4901961, 1, 1,
0.1994285, -0.1861295, 1.843963, 0, 0.4823529, 1, 1,
0.2122026, 0.8007475, 0.5887275, 0, 0.4784314, 1, 1,
0.2137216, -0.5227991, 1.478317, 0, 0.4705882, 1, 1,
0.2147025, 0.2460763, 0.443864, 0, 0.4666667, 1, 1,
0.217567, 1.821076, -0.370691, 0, 0.4588235, 1, 1,
0.2181994, -0.119592, 2.888482, 0, 0.454902, 1, 1,
0.2219634, 0.8259159, -1.204194, 0, 0.4470588, 1, 1,
0.223618, -0.6919572, 2.158906, 0, 0.4431373, 1, 1,
0.226738, -2.041301, 2.654635, 0, 0.4352941, 1, 1,
0.2300422, -0.8706784, 4.268804, 0, 0.4313726, 1, 1,
0.2303962, -2.591741, 3.314006, 0, 0.4235294, 1, 1,
0.2336591, 0.3941452, 2.336342, 0, 0.4196078, 1, 1,
0.2352696, -0.3384541, 2.984467, 0, 0.4117647, 1, 1,
0.2372203, -0.3301148, 2.55481, 0, 0.4078431, 1, 1,
0.2408769, 0.625491, 2.005267, 0, 0.4, 1, 1,
0.2426304, 1.841546, -0.9463193, 0, 0.3921569, 1, 1,
0.24345, 1.110026, -0.0009271935, 0, 0.3882353, 1, 1,
0.2445998, -1.807516, 0.863041, 0, 0.3803922, 1, 1,
0.2572224, 0.8762274, -0.9301209, 0, 0.3764706, 1, 1,
0.2582009, 0.1373944, 1.215204, 0, 0.3686275, 1, 1,
0.2585702, 1.733116, -0.8195084, 0, 0.3647059, 1, 1,
0.260153, -0.9086518, 3.658844, 0, 0.3568628, 1, 1,
0.2606925, -0.8494255, 2.701769, 0, 0.3529412, 1, 1,
0.2652083, 2.538525, 0.1655376, 0, 0.345098, 1, 1,
0.2669305, 0.522947, 0.345955, 0, 0.3411765, 1, 1,
0.2690417, 0.7047677, 2.613471, 0, 0.3333333, 1, 1,
0.2691337, 1.940461, -1.250803, 0, 0.3294118, 1, 1,
0.2756394, 0.5602889, -0.1770773, 0, 0.3215686, 1, 1,
0.2793574, -0.4683203, 3.996344, 0, 0.3176471, 1, 1,
0.2834782, -0.4607753, 3.074504, 0, 0.3098039, 1, 1,
0.287512, 0.1554701, 1.429679, 0, 0.3058824, 1, 1,
0.2912477, -0.6796378, 2.527441, 0, 0.2980392, 1, 1,
0.2931477, -0.4012035, 1.873969, 0, 0.2901961, 1, 1,
0.2947117, 0.6903246, 1.264697, 0, 0.2862745, 1, 1,
0.301938, 0.4179889, 2.185678, 0, 0.2784314, 1, 1,
0.3020756, 0.03479172, 0.7729409, 0, 0.2745098, 1, 1,
0.3036918, 0.5349124, 0.6914039, 0, 0.2666667, 1, 1,
0.3099081, -1.200856, 1.949741, 0, 0.2627451, 1, 1,
0.3165714, 1.386639, 0.6776704, 0, 0.254902, 1, 1,
0.3170411, -1.05697, 0.1504714, 0, 0.2509804, 1, 1,
0.3172975, 1.40645, -0.4858855, 0, 0.2431373, 1, 1,
0.3235715, -0.5492562, 0.7077029, 0, 0.2392157, 1, 1,
0.3251149, -1.077922, 2.38416, 0, 0.2313726, 1, 1,
0.3257456, -0.1625318, 1.934183, 0, 0.227451, 1, 1,
0.325813, 0.1980489, 2.29746, 0, 0.2196078, 1, 1,
0.3303179, -0.4312677, 2.301031, 0, 0.2156863, 1, 1,
0.3399275, 0.8291604, 0.7959023, 0, 0.2078431, 1, 1,
0.3399502, 0.555282, 0.150576, 0, 0.2039216, 1, 1,
0.3401587, 0.5587589, -0.09401064, 0, 0.1960784, 1, 1,
0.3419731, 0.3795673, 1.770633, 0, 0.1882353, 1, 1,
0.3455753, 0.2075034, 1.03608, 0, 0.1843137, 1, 1,
0.3501646, -0.9808164, 3.823965, 0, 0.1764706, 1, 1,
0.3526262, 2.762212, -0.1990415, 0, 0.172549, 1, 1,
0.355509, 0.3532941, 1.422838, 0, 0.1647059, 1, 1,
0.3568907, 0.6794803, 1.423975, 0, 0.1607843, 1, 1,
0.3609729, -0.6908212, 3.551698, 0, 0.1529412, 1, 1,
0.3611014, 0.395112, 0.1960726, 0, 0.1490196, 1, 1,
0.3632893, -1.169883, 2.690654, 0, 0.1411765, 1, 1,
0.3755448, 0.6194283, 0.7784907, 0, 0.1372549, 1, 1,
0.379587, -0.1178325, 0.8491696, 0, 0.1294118, 1, 1,
0.3833979, -0.9321573, 2.900479, 0, 0.1254902, 1, 1,
0.3842061, -0.4625065, 0.7526656, 0, 0.1176471, 1, 1,
0.3854811, -1.501763, 2.752086, 0, 0.1137255, 1, 1,
0.3869312, 1.057639, 0.03588622, 0, 0.1058824, 1, 1,
0.3929915, 1.350326, 1.421513, 0, 0.09803922, 1, 1,
0.394926, -0.4822079, 0.9963489, 0, 0.09411765, 1, 1,
0.3997256, 1.390147, 0.1855369, 0, 0.08627451, 1, 1,
0.4020836, -1.201992, 3.30442, 0, 0.08235294, 1, 1,
0.4083797, -0.1103121, 1.776612, 0, 0.07450981, 1, 1,
0.4137345, 0.8620524, 0.2693246, 0, 0.07058824, 1, 1,
0.4224377, -0.2906644, 1.360497, 0, 0.0627451, 1, 1,
0.4232082, -2.117669, 5.096786, 0, 0.05882353, 1, 1,
0.423885, 1.457457, 0.91523, 0, 0.05098039, 1, 1,
0.4244731, 0.2711497, 0.6481559, 0, 0.04705882, 1, 1,
0.4253739, -1.605229, 1.250888, 0, 0.03921569, 1, 1,
0.4293912, -0.8247323, 1.538329, 0, 0.03529412, 1, 1,
0.4298604, 0.2198331, 0.4006341, 0, 0.02745098, 1, 1,
0.433526, 0.08830895, 0.9556981, 0, 0.02352941, 1, 1,
0.4352164, 1.487237, 0.3390191, 0, 0.01568628, 1, 1,
0.4362822, 0.2742664, 1.590014, 0, 0.01176471, 1, 1,
0.4434805, 0.8518973, -0.2244013, 0, 0.003921569, 1, 1,
0.4453691, 0.0004704488, -0.7136329, 0.003921569, 0, 1, 1,
0.4487685, -0.7141834, 2.689143, 0.007843138, 0, 1, 1,
0.4520554, -0.2329773, 1.504157, 0.01568628, 0, 1, 1,
0.4566536, 0.3273621, -0.7867568, 0.01960784, 0, 1, 1,
0.4568366, 0.4047577, 1.124177, 0.02745098, 0, 1, 1,
0.46948, 0.9199478, 0.4183224, 0.03137255, 0, 1, 1,
0.4705557, -0.1533341, 2.050787, 0.03921569, 0, 1, 1,
0.4727974, -0.3886199, 3.536957, 0.04313726, 0, 1, 1,
0.4734959, 1.362815, 1.022936, 0.05098039, 0, 1, 1,
0.4750073, 0.2067468, 0.6507565, 0.05490196, 0, 1, 1,
0.4800725, 0.4882039, 0.129736, 0.0627451, 0, 1, 1,
0.4801769, 0.9561613, 1.846958, 0.06666667, 0, 1, 1,
0.4820035, -0.3573642, -0.07701702, 0.07450981, 0, 1, 1,
0.4850987, 0.486389, 1.789758, 0.07843138, 0, 1, 1,
0.4875864, -0.2841994, 2.475378, 0.08627451, 0, 1, 1,
0.4881536, 0.007585971, 2.325662, 0.09019608, 0, 1, 1,
0.4884885, 0.1094745, 1.705761, 0.09803922, 0, 1, 1,
0.4893751, -0.9352486, 3.367903, 0.1058824, 0, 1, 1,
0.4946565, -0.7538917, 1.194046, 0.1098039, 0, 1, 1,
0.5011409, -0.4533007, 1.854215, 0.1176471, 0, 1, 1,
0.5016281, 0.9429242, -0.9544511, 0.1215686, 0, 1, 1,
0.5016413, 1.924798, -0.9377747, 0.1294118, 0, 1, 1,
0.5036395, 0.9783682, -0.5404964, 0.1333333, 0, 1, 1,
0.510889, 0.08795204, 3.169625, 0.1411765, 0, 1, 1,
0.5124536, 0.6396931, 1.857835, 0.145098, 0, 1, 1,
0.5129319, 0.5558496, 2.41724, 0.1529412, 0, 1, 1,
0.513011, 0.4603778, 1.989533, 0.1568628, 0, 1, 1,
0.5139972, -0.2371125, 1.879953, 0.1647059, 0, 1, 1,
0.5144735, -0.2622887, 2.646208, 0.1686275, 0, 1, 1,
0.5173988, -0.1670176, 1.098779, 0.1764706, 0, 1, 1,
0.5204704, 0.7542921, 0.9346446, 0.1803922, 0, 1, 1,
0.5220703, 0.2326933, 3.11567, 0.1882353, 0, 1, 1,
0.5221336, -0.3116692, 1.626895, 0.1921569, 0, 1, 1,
0.5271799, 0.7598801, 1.59168, 0.2, 0, 1, 1,
0.529807, -0.4132774, 4.392665, 0.2078431, 0, 1, 1,
0.5315228, -0.7432703, 0.7480689, 0.2117647, 0, 1, 1,
0.5408812, 0.350325, 1.656759, 0.2196078, 0, 1, 1,
0.5448687, -0.2742354, 1.557503, 0.2235294, 0, 1, 1,
0.5510598, -0.001017171, 1.496268, 0.2313726, 0, 1, 1,
0.5512774, -0.06806337, 1.732462, 0.2352941, 0, 1, 1,
0.5513344, 0.07515088, 0.7401488, 0.2431373, 0, 1, 1,
0.5541974, 2.101248, 0.3278671, 0.2470588, 0, 1, 1,
0.5563329, 1.737186, -0.6242225, 0.254902, 0, 1, 1,
0.5575199, 1.405336, -0.1482738, 0.2588235, 0, 1, 1,
0.563685, -0.05993691, 2.345501, 0.2666667, 0, 1, 1,
0.5673822, 1.672946, 1.022034, 0.2705882, 0, 1, 1,
0.5740486, 0.4467164, 0.4517901, 0.2784314, 0, 1, 1,
0.5772615, 0.191419, 0.4967785, 0.282353, 0, 1, 1,
0.5794258, 0.6237739, 1.351735, 0.2901961, 0, 1, 1,
0.5846034, -1.457327, 1.986978, 0.2941177, 0, 1, 1,
0.5872875, -1.233194, 3.328944, 0.3019608, 0, 1, 1,
0.5920257, 0.9426433, 0.3400523, 0.3098039, 0, 1, 1,
0.5922051, 0.6538101, -0.05978066, 0.3137255, 0, 1, 1,
0.594981, 1.833891, -0.5136917, 0.3215686, 0, 1, 1,
0.6009236, 1.171764, -0.4512542, 0.3254902, 0, 1, 1,
0.6036466, -0.4151334, 2.084203, 0.3333333, 0, 1, 1,
0.6060116, -0.01880217, 0.7548188, 0.3372549, 0, 1, 1,
0.6060433, 0.8293493, 1.312879, 0.345098, 0, 1, 1,
0.6077651, -1.602595, 2.184664, 0.3490196, 0, 1, 1,
0.6129401, 0.3845054, 0.9765265, 0.3568628, 0, 1, 1,
0.6160766, 0.5268329, 2.694037, 0.3607843, 0, 1, 1,
0.6171309, 0.04076196, 2.917462, 0.3686275, 0, 1, 1,
0.6179438, 0.2058157, 2.982876, 0.372549, 0, 1, 1,
0.6179661, 1.512705, -0.2306338, 0.3803922, 0, 1, 1,
0.6199222, 0.8702505, 0.6219487, 0.3843137, 0, 1, 1,
0.6259194, -0.4838884, 2.211154, 0.3921569, 0, 1, 1,
0.6303256, -1.705163, 2.492836, 0.3960784, 0, 1, 1,
0.6366127, -0.4595986, 2.726279, 0.4039216, 0, 1, 1,
0.641351, 1.315066, 1.459377, 0.4117647, 0, 1, 1,
0.6421555, -0.6433801, 1.821863, 0.4156863, 0, 1, 1,
0.6455436, 0.4541262, -0.3063615, 0.4235294, 0, 1, 1,
0.6458931, -0.8550746, 1.50323, 0.427451, 0, 1, 1,
0.6463811, -0.2543699, 3.239624, 0.4352941, 0, 1, 1,
0.6491602, -0.6384764, 2.773223, 0.4392157, 0, 1, 1,
0.6491655, 0.2522562, 0.351043, 0.4470588, 0, 1, 1,
0.6532568, -0.5829176, 1.660383, 0.4509804, 0, 1, 1,
0.6708059, -0.4954913, 3.371011, 0.4588235, 0, 1, 1,
0.673384, -0.213071, 2.609389, 0.4627451, 0, 1, 1,
0.6737, 0.5679675, 0.2693047, 0.4705882, 0, 1, 1,
0.6816966, 0.4474415, 2.576096, 0.4745098, 0, 1, 1,
0.6826585, -2.091372, 2.089552, 0.4823529, 0, 1, 1,
0.6844901, -0.5814058, 0.228332, 0.4862745, 0, 1, 1,
0.6859372, 0.1887882, 0.3704013, 0.4941176, 0, 1, 1,
0.6919028, -0.02550817, 2.131788, 0.5019608, 0, 1, 1,
0.6991761, -1.637831, 2.892826, 0.5058824, 0, 1, 1,
0.6996756, 0.8822789, 0.9598206, 0.5137255, 0, 1, 1,
0.6997226, 0.2608759, 1.093413, 0.5176471, 0, 1, 1,
0.7000648, 0.9396942, 2.677607, 0.5254902, 0, 1, 1,
0.70285, -0.1444692, 0.1548404, 0.5294118, 0, 1, 1,
0.7056249, 0.3084255, 1.168643, 0.5372549, 0, 1, 1,
0.7113074, 0.7818944, 3.500949, 0.5411765, 0, 1, 1,
0.7190616, 0.1864005, 0.4910995, 0.5490196, 0, 1, 1,
0.7200802, -1.115694, 0.5622836, 0.5529412, 0, 1, 1,
0.7215375, 1.141523, -0.2386438, 0.5607843, 0, 1, 1,
0.7220064, -0.9930484, 2.905734, 0.5647059, 0, 1, 1,
0.7252818, 1.315762, -1.046859, 0.572549, 0, 1, 1,
0.730145, 1.23031, -0.1994268, 0.5764706, 0, 1, 1,
0.7302933, -1.406047, 2.859625, 0.5843138, 0, 1, 1,
0.7304747, -0.8273963, 3.991467, 0.5882353, 0, 1, 1,
0.7306007, 0.8218004, -0.5916643, 0.5960785, 0, 1, 1,
0.7311823, 0.3487421, 1.982884, 0.6039216, 0, 1, 1,
0.7338108, 0.09326042, 0.417817, 0.6078432, 0, 1, 1,
0.7437439, 0.1131701, 1.253065, 0.6156863, 0, 1, 1,
0.744572, 1.542728, 2.1763, 0.6196079, 0, 1, 1,
0.7451591, -0.5509328, 1.221422, 0.627451, 0, 1, 1,
0.7455487, -0.5825434, 1.846626, 0.6313726, 0, 1, 1,
0.7471514, -0.361957, 1.057554, 0.6392157, 0, 1, 1,
0.7516988, -1.229974, 1.518979, 0.6431373, 0, 1, 1,
0.7522867, -0.4139789, 3.355346, 0.6509804, 0, 1, 1,
0.7528217, -0.3482481, 1.691344, 0.654902, 0, 1, 1,
0.7562691, -1.821916, 2.496338, 0.6627451, 0, 1, 1,
0.7571396, 2.719625, 1.953814, 0.6666667, 0, 1, 1,
0.759109, -0.02469337, 2.041006, 0.6745098, 0, 1, 1,
0.7612773, 0.8511524, 0.7448479, 0.6784314, 0, 1, 1,
0.7646694, -0.668085, 1.834502, 0.6862745, 0, 1, 1,
0.7648725, -1.054368, 4.223419, 0.6901961, 0, 1, 1,
0.7670548, 2.097657, -0.2721053, 0.6980392, 0, 1, 1,
0.7718869, 0.2540164, 0.06860042, 0.7058824, 0, 1, 1,
0.7737754, -0.5890019, 2.660213, 0.7098039, 0, 1, 1,
0.7743762, 0.7628209, 1.59883, 0.7176471, 0, 1, 1,
0.7747974, -1.236399, 3.028386, 0.7215686, 0, 1, 1,
0.7865259, 1.082531, -0.7007619, 0.7294118, 0, 1, 1,
0.7920324, -0.5096635, 2.818138, 0.7333333, 0, 1, 1,
0.7927471, 1.656718, -0.4312962, 0.7411765, 0, 1, 1,
0.7986582, 0.6915509, 0.8551155, 0.7450981, 0, 1, 1,
0.8026302, -1.076624, 3.397004, 0.7529412, 0, 1, 1,
0.8030338, -0.1110763, 1.345158, 0.7568628, 0, 1, 1,
0.8044637, 0.2868596, 0.9269621, 0.7647059, 0, 1, 1,
0.8056108, -0.6187676, 4.334771, 0.7686275, 0, 1, 1,
0.8095815, -0.08856676, 2.724382, 0.7764706, 0, 1, 1,
0.8120797, 0.7122761, 0.9866033, 0.7803922, 0, 1, 1,
0.8144569, 1.259824, -0.4808245, 0.7882353, 0, 1, 1,
0.8189914, -1.149702, 2.914126, 0.7921569, 0, 1, 1,
0.8192217, -0.5255209, 2.423501, 0.8, 0, 1, 1,
0.8225023, 0.6471946, -0.0127082, 0.8078431, 0, 1, 1,
0.8355618, 1.103374, 0.2213004, 0.8117647, 0, 1, 1,
0.8365012, 0.9279682, -0.5206861, 0.8196079, 0, 1, 1,
0.8369423, 1.171515, 0.6391984, 0.8235294, 0, 1, 1,
0.837566, 0.4169297, 1.398172, 0.8313726, 0, 1, 1,
0.842519, -1.414046, 3.009324, 0.8352941, 0, 1, 1,
0.8468293, 0.2884077, 0.1283361, 0.8431373, 0, 1, 1,
0.84777, 1.000769, 0.1224874, 0.8470588, 0, 1, 1,
0.8495654, -0.3731038, -0.4898788, 0.854902, 0, 1, 1,
0.8512057, 1.590216, -0.2124467, 0.8588235, 0, 1, 1,
0.8512755, 0.02500139, 2.8858, 0.8666667, 0, 1, 1,
0.8553291, -0.1002862, 2.581897, 0.8705882, 0, 1, 1,
0.8572954, 0.6608835, 0.3006634, 0.8784314, 0, 1, 1,
0.8592787, 0.4527549, 3.441115, 0.8823529, 0, 1, 1,
0.8615939, 0.3955794, 0.09426595, 0.8901961, 0, 1, 1,
0.8619986, 0.1563926, 2.073432, 0.8941177, 0, 1, 1,
0.8667198, -2.278796, 1.384844, 0.9019608, 0, 1, 1,
0.8735157, -0.6745051, 0.1025296, 0.9098039, 0, 1, 1,
0.8753772, -0.5510576, 0.2449405, 0.9137255, 0, 1, 1,
0.8765861, 0.6242453, 1.222657, 0.9215686, 0, 1, 1,
0.8837317, 0.5586002, 0.2707998, 0.9254902, 0, 1, 1,
0.8854637, -0.4083525, 0.6679673, 0.9333333, 0, 1, 1,
0.8935128, 1.095017, -1.072611, 0.9372549, 0, 1, 1,
0.9031594, -1.231247, 1.862811, 0.945098, 0, 1, 1,
0.9055267, -0.5107148, 1.862691, 0.9490196, 0, 1, 1,
0.9070044, 0.2351153, 0.8185784, 0.9568627, 0, 1, 1,
0.9088706, -0.5953667, 2.043046, 0.9607843, 0, 1, 1,
0.9136046, -0.2355671, 2.58672, 0.9686275, 0, 1, 1,
0.9147767, -1.802808, 1.345619, 0.972549, 0, 1, 1,
0.9246641, 0.1825977, 1.019169, 0.9803922, 0, 1, 1,
0.9364046, -0.002850183, 1.285825, 0.9843137, 0, 1, 1,
0.9483766, 1.268838, 0.6671422, 0.9921569, 0, 1, 1,
0.9531314, -0.4217442, 1.671818, 0.9960784, 0, 1, 1,
0.9564773, 0.2924552, 1.674539, 1, 0, 0.9960784, 1,
0.9582414, -0.3918873, 2.384245, 1, 0, 0.9882353, 1,
0.9585301, 0.141302, 2.476183, 1, 0, 0.9843137, 1,
0.9611408, 0.1343959, 0.4581003, 1, 0, 0.9764706, 1,
0.967551, -1.479357, 1.987773, 1, 0, 0.972549, 1,
0.9689741, 0.6033326, 1.274951, 1, 0, 0.9647059, 1,
0.9698802, -0.6681283, 2.630049, 1, 0, 0.9607843, 1,
0.9814952, -1.624329, 1.59789, 1, 0, 0.9529412, 1,
0.9815342, 0.4215975, 3.037882, 1, 0, 0.9490196, 1,
0.9875799, -0.5441626, 1.121948, 1, 0, 0.9411765, 1,
0.9876106, -2.041305, 2.490215, 1, 0, 0.9372549, 1,
0.9954514, 0.0753655, 2.134836, 1, 0, 0.9294118, 1,
0.9984019, -1.482715, 1.002046, 1, 0, 0.9254902, 1,
1.000526, 0.8329155, 1.136503, 1, 0, 0.9176471, 1,
1.007711, 0.8982531, 0.6094926, 1, 0, 0.9137255, 1,
1.013304, 0.314803, -0.7579316, 1, 0, 0.9058824, 1,
1.014639, -0.4227651, 3.66725, 1, 0, 0.9019608, 1,
1.016015, 0.5717555, 2.240442, 1, 0, 0.8941177, 1,
1.023574, -0.0864912, 3.012062, 1, 0, 0.8862745, 1,
1.02603, 0.6342568, -1.153749, 1, 0, 0.8823529, 1,
1.040924, -1.640451, 2.230995, 1, 0, 0.8745098, 1,
1.04106, -0.5040893, 3.853975, 1, 0, 0.8705882, 1,
1.045033, -1.432203, 1.952047, 1, 0, 0.8627451, 1,
1.04525, 0.2209946, 1.96718, 1, 0, 0.8588235, 1,
1.053308, -0.7500492, 1.809502, 1, 0, 0.8509804, 1,
1.060796, 1.474874, 0.570379, 1, 0, 0.8470588, 1,
1.068309, 0.02659623, 1.420691, 1, 0, 0.8392157, 1,
1.069868, 1.936844, -0.9444535, 1, 0, 0.8352941, 1,
1.071742, -0.5405945, 2.268775, 1, 0, 0.827451, 1,
1.07348, -1.509997, 3.049703, 1, 0, 0.8235294, 1,
1.073983, 0.1359752, 0.5453565, 1, 0, 0.8156863, 1,
1.078431, 0.346528, -0.2965054, 1, 0, 0.8117647, 1,
1.087026, -1.214183, 3.449192, 1, 0, 0.8039216, 1,
1.087915, 0.3436617, 0.589261, 1, 0, 0.7960784, 1,
1.095757, 0.1845604, 1.329597, 1, 0, 0.7921569, 1,
1.100874, -0.08549765, -0.04579147, 1, 0, 0.7843137, 1,
1.103122, 0.5743319, 0.3280531, 1, 0, 0.7803922, 1,
1.108028, 1.766458, 0.7730704, 1, 0, 0.772549, 1,
1.108409, 0.9660109, 0.7064158, 1, 0, 0.7686275, 1,
1.109122, -0.4029849, 1.737174, 1, 0, 0.7607843, 1,
1.10962, -1.601366, 1.861754, 1, 0, 0.7568628, 1,
1.114606, -1.955791, 3.406412, 1, 0, 0.7490196, 1,
1.11596, 0.0506152, 2.429924, 1, 0, 0.7450981, 1,
1.134133, -1.11689, 3.292829, 1, 0, 0.7372549, 1,
1.13466, 0.2622185, 1.563946, 1, 0, 0.7333333, 1,
1.142198, 0.003537473, 2.099405, 1, 0, 0.7254902, 1,
1.145137, -0.5765768, 1.867357, 1, 0, 0.7215686, 1,
1.146246, 0.399567, 1.136791, 1, 0, 0.7137255, 1,
1.147126, 1.488597, 2.523389, 1, 0, 0.7098039, 1,
1.149235, -1.550817, 2.554134, 1, 0, 0.7019608, 1,
1.154019, -2.379607, 3.463669, 1, 0, 0.6941177, 1,
1.155287, 0.1009766, 3.156156, 1, 0, 0.6901961, 1,
1.156094, 1.777263, -0.6336336, 1, 0, 0.682353, 1,
1.168339, -0.2555614, 2.724313, 1, 0, 0.6784314, 1,
1.172085, -1.147345, 2.69867, 1, 0, 0.6705883, 1,
1.176305, -0.1335336, 2.304556, 1, 0, 0.6666667, 1,
1.181816, -0.1738467, -0.07408006, 1, 0, 0.6588235, 1,
1.183797, -0.8920795, 2.810279, 1, 0, 0.654902, 1,
1.209818, -0.5856602, 2.114295, 1, 0, 0.6470588, 1,
1.210482, 1.129616, 1.716877, 1, 0, 0.6431373, 1,
1.216724, 2.159763, 1.121675, 1, 0, 0.6352941, 1,
1.217785, 1.723818, -0.2550565, 1, 0, 0.6313726, 1,
1.218846, 0.2416718, 1.758953, 1, 0, 0.6235294, 1,
1.244139, 1.690515, 2.114342, 1, 0, 0.6196079, 1,
1.250388, 0.6508515, 1.92874, 1, 0, 0.6117647, 1,
1.255455, -0.8329781, 3.360199, 1, 0, 0.6078432, 1,
1.266786, 0.9507853, -1.208607, 1, 0, 0.6, 1,
1.267094, -0.1571876, 2.940041, 1, 0, 0.5921569, 1,
1.273167, -0.7968854, 1.80456, 1, 0, 0.5882353, 1,
1.277418, -1.19082, 3.912103, 1, 0, 0.5803922, 1,
1.279392, -1.014466, 2.830541, 1, 0, 0.5764706, 1,
1.284309, -0.716611, 1.25121, 1, 0, 0.5686275, 1,
1.287612, -0.4120943, 3.091059, 1, 0, 0.5647059, 1,
1.290741, 0.07535244, 2.402392, 1, 0, 0.5568628, 1,
1.293734, -0.9951954, 3.642812, 1, 0, 0.5529412, 1,
1.321208, -0.7505829, 2.976197, 1, 0, 0.5450981, 1,
1.332122, 2.548359, 1.284061, 1, 0, 0.5411765, 1,
1.358663, -0.9961424, 2.274016, 1, 0, 0.5333334, 1,
1.36412, -0.4983315, 2.854804, 1, 0, 0.5294118, 1,
1.372667, 0.1510908, 3.575245, 1, 0, 0.5215687, 1,
1.377418, 1.854625, 1.155275, 1, 0, 0.5176471, 1,
1.379524, 1.328143, 1.311684, 1, 0, 0.509804, 1,
1.383576, -1.795651, 0.6893374, 1, 0, 0.5058824, 1,
1.389983, -0.5315102, 3.279714, 1, 0, 0.4980392, 1,
1.391639, 0.314762, -0.3835636, 1, 0, 0.4901961, 1,
1.398449, 0.4082387, 0.5823875, 1, 0, 0.4862745, 1,
1.404262, -0.07258052, 1.298198, 1, 0, 0.4784314, 1,
1.407902, -0.6983901, 1.482713, 1, 0, 0.4745098, 1,
1.413971, 0.6518034, 0.199967, 1, 0, 0.4666667, 1,
1.42812, -0.3316096, 1.549803, 1, 0, 0.4627451, 1,
1.430005, 0.4579904, -0.05396452, 1, 0, 0.454902, 1,
1.43003, -0.01028159, 1.42474, 1, 0, 0.4509804, 1,
1.441834, 0.4170702, -0.6563056, 1, 0, 0.4431373, 1,
1.450059, -0.6408566, 0.212892, 1, 0, 0.4392157, 1,
1.462616, 1.055398, 1.534151, 1, 0, 0.4313726, 1,
1.465983, -0.3593047, 2.946724, 1, 0, 0.427451, 1,
1.467532, 0.4677111, 2.705115, 1, 0, 0.4196078, 1,
1.479017, 0.005850867, 0.7278594, 1, 0, 0.4156863, 1,
1.487023, -0.8363189, 1.896493, 1, 0, 0.4078431, 1,
1.506637, -1.684526, 0.04768817, 1, 0, 0.4039216, 1,
1.51621, -0.03498729, 1.403633, 1, 0, 0.3960784, 1,
1.517378, -0.6757786, 0.7362883, 1, 0, 0.3882353, 1,
1.519155, -1.641647, 2.165971, 1, 0, 0.3843137, 1,
1.519401, 1.307233, 2.257044, 1, 0, 0.3764706, 1,
1.552303, 0.7851026, 0.7068098, 1, 0, 0.372549, 1,
1.560367, 0.6157081, 1.964141, 1, 0, 0.3647059, 1,
1.579305, -0.9626302, 3.378348, 1, 0, 0.3607843, 1,
1.58636, 0.4719247, -0.3909099, 1, 0, 0.3529412, 1,
1.588158, 0.1246812, 1.949412, 1, 0, 0.3490196, 1,
1.589428, 0.8674062, 1.024624, 1, 0, 0.3411765, 1,
1.590294, 0.5736287, 1.282862, 1, 0, 0.3372549, 1,
1.594897, 1.30002, 1.551492, 1, 0, 0.3294118, 1,
1.613777, -0.3591855, 1.253935, 1, 0, 0.3254902, 1,
1.625429, -1.502123, 2.726179, 1, 0, 0.3176471, 1,
1.631167, 1.442289, 0.03717554, 1, 0, 0.3137255, 1,
1.652209, 1.062646, 1.193147, 1, 0, 0.3058824, 1,
1.664133, 0.6452763, 2.79936, 1, 0, 0.2980392, 1,
1.665632, -0.2841835, 2.03002, 1, 0, 0.2941177, 1,
1.692518, -1.210272, 0.9991031, 1, 0, 0.2862745, 1,
1.712505, 1.37133, 0.2130797, 1, 0, 0.282353, 1,
1.715305, -0.2816282, 0.3728345, 1, 0, 0.2745098, 1,
1.731873, 0.2435501, 1.882598, 1, 0, 0.2705882, 1,
1.735559, -0.527383, 1.954741, 1, 0, 0.2627451, 1,
1.739148, -0.2247451, 2.165063, 1, 0, 0.2588235, 1,
1.752031, -0.352303, 2.178056, 1, 0, 0.2509804, 1,
1.76972, 2.292642, 0.7733126, 1, 0, 0.2470588, 1,
1.769861, -0.2179501, 1.194427, 1, 0, 0.2392157, 1,
1.774425, 0.1065617, 2.288849, 1, 0, 0.2352941, 1,
1.796414, -0.8738012, 2.293006, 1, 0, 0.227451, 1,
1.80359, -0.7199724, 1.482069, 1, 0, 0.2235294, 1,
1.810308, 0.8922235, 1.060611, 1, 0, 0.2156863, 1,
1.8138, 0.7917915, -0.3653451, 1, 0, 0.2117647, 1,
1.819261, -0.2098981, 1.433932, 1, 0, 0.2039216, 1,
1.848193, -0.7591722, 2.244587, 1, 0, 0.1960784, 1,
1.868551, -0.4013572, 2.495146, 1, 0, 0.1921569, 1,
1.928822, 0.2101342, 2.669949, 1, 0, 0.1843137, 1,
1.930613, -0.7387643, 0.6629581, 1, 0, 0.1803922, 1,
1.930889, 1.664637, 0.6025318, 1, 0, 0.172549, 1,
1.949045, -0.6515086, 1.299309, 1, 0, 0.1686275, 1,
1.953541, 1.606961, 2.026188, 1, 0, 0.1607843, 1,
1.970719, -1.29388, 3.807168, 1, 0, 0.1568628, 1,
1.983143, -0.6569908, 4.017932, 1, 0, 0.1490196, 1,
1.985044, -0.3150544, 2.940169, 1, 0, 0.145098, 1,
2.026384, -0.5875506, -0.1017765, 1, 0, 0.1372549, 1,
2.044368, -0.6116658, 0.3111233, 1, 0, 0.1333333, 1,
2.059899, -0.07056518, 1.684258, 1, 0, 0.1254902, 1,
2.086566, 0.758487, 0.4902849, 1, 0, 0.1215686, 1,
2.125846, 1.047001, 0.04700792, 1, 0, 0.1137255, 1,
2.166736, -2.196291, 2.31165, 1, 0, 0.1098039, 1,
2.176464, -0.5466796, 2.164311, 1, 0, 0.1019608, 1,
2.26112, -0.5412279, 1.805767, 1, 0, 0.09411765, 1,
2.270438, -1.003579, 2.039959, 1, 0, 0.09019608, 1,
2.33375, 1.29897, 0.7794658, 1, 0, 0.08235294, 1,
2.355551, -0.2585593, 1.954981, 1, 0, 0.07843138, 1,
2.36963, 0.3442089, -0.1302387, 1, 0, 0.07058824, 1,
2.370872, -0.07653839, 2.021354, 1, 0, 0.06666667, 1,
2.436798, -0.2683115, -0.1170733, 1, 0, 0.05882353, 1,
2.442264, -0.711172, 1.92275, 1, 0, 0.05490196, 1,
2.456014, -0.6274471, 1.451174, 1, 0, 0.04705882, 1,
2.565089, -0.7380745, 0.2860177, 1, 0, 0.04313726, 1,
2.664778, -0.2719364, 1.024958, 1, 0, 0.03529412, 1,
2.709364, 1.052399, 2.733652, 1, 0, 0.03137255, 1,
2.719788, -0.03854704, 0.02998892, 1, 0, 0.02352941, 1,
2.723492, 0.2044218, 0.8447332, 1, 0, 0.01960784, 1,
2.830692, -1.391692, 2.101443, 1, 0, 0.01176471, 1,
2.999593, -1.347044, -0.5005234, 1, 0, 0.007843138, 1
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
0.0897311, -4.206997, -6.438614, 0, -0.5, 0.5, 0.5,
0.0897311, -4.206997, -6.438614, 1, -0.5, 0.5, 0.5,
0.0897311, -4.206997, -6.438614, 1, 1.5, 0.5, 0.5,
0.0897311, -4.206997, -6.438614, 0, 1.5, 0.5, 0.5
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
-3.806573, -0.2173561, -6.438614, 0, -0.5, 0.5, 0.5,
-3.806573, -0.2173561, -6.438614, 1, -0.5, 0.5, 0.5,
-3.806573, -0.2173561, -6.438614, 1, 1.5, 0.5, 0.5,
-3.806573, -0.2173561, -6.438614, 0, 1.5, 0.5, 0.5
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
-3.806573, -4.206997, 0.2674007, 0, -0.5, 0.5, 0.5,
-3.806573, -4.206997, 0.2674007, 1, -0.5, 0.5, 0.5,
-3.806573, -4.206997, 0.2674007, 1, 1.5, 0.5, 0.5,
-3.806573, -4.206997, 0.2674007, 0, 1.5, 0.5, 0.5
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
-2, -3.286311, -4.891072,
2, -3.286311, -4.891072,
-2, -3.286311, -4.891072,
-2, -3.439759, -5.148996,
-1, -3.286311, -4.891072,
-1, -3.439759, -5.148996,
0, -3.286311, -4.891072,
0, -3.439759, -5.148996,
1, -3.286311, -4.891072,
1, -3.439759, -5.148996,
2, -3.286311, -4.891072,
2, -3.439759, -5.148996
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
-2, -3.746654, -5.664844, 0, -0.5, 0.5, 0.5,
-2, -3.746654, -5.664844, 1, -0.5, 0.5, 0.5,
-2, -3.746654, -5.664844, 1, 1.5, 0.5, 0.5,
-2, -3.746654, -5.664844, 0, 1.5, 0.5, 0.5,
-1, -3.746654, -5.664844, 0, -0.5, 0.5, 0.5,
-1, -3.746654, -5.664844, 1, -0.5, 0.5, 0.5,
-1, -3.746654, -5.664844, 1, 1.5, 0.5, 0.5,
-1, -3.746654, -5.664844, 0, 1.5, 0.5, 0.5,
0, -3.746654, -5.664844, 0, -0.5, 0.5, 0.5,
0, -3.746654, -5.664844, 1, -0.5, 0.5, 0.5,
0, -3.746654, -5.664844, 1, 1.5, 0.5, 0.5,
0, -3.746654, -5.664844, 0, 1.5, 0.5, 0.5,
1, -3.746654, -5.664844, 0, -0.5, 0.5, 0.5,
1, -3.746654, -5.664844, 1, -0.5, 0.5, 0.5,
1, -3.746654, -5.664844, 1, 1.5, 0.5, 0.5,
1, -3.746654, -5.664844, 0, 1.5, 0.5, 0.5,
2, -3.746654, -5.664844, 0, -0.5, 0.5, 0.5,
2, -3.746654, -5.664844, 1, -0.5, 0.5, 0.5,
2, -3.746654, -5.664844, 1, 1.5, 0.5, 0.5,
2, -3.746654, -5.664844, 0, 1.5, 0.5, 0.5
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
-2.907426, -3, -4.891072,
-2.907426, 2, -4.891072,
-2.907426, -3, -4.891072,
-3.057284, -3, -5.148996,
-2.907426, -2, -4.891072,
-3.057284, -2, -5.148996,
-2.907426, -1, -4.891072,
-3.057284, -1, -5.148996,
-2.907426, 0, -4.891072,
-3.057284, 0, -5.148996,
-2.907426, 1, -4.891072,
-3.057284, 1, -5.148996,
-2.907426, 2, -4.891072,
-3.057284, 2, -5.148996
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
-3.357, -3, -5.664844, 0, -0.5, 0.5, 0.5,
-3.357, -3, -5.664844, 1, -0.5, 0.5, 0.5,
-3.357, -3, -5.664844, 1, 1.5, 0.5, 0.5,
-3.357, -3, -5.664844, 0, 1.5, 0.5, 0.5,
-3.357, -2, -5.664844, 0, -0.5, 0.5, 0.5,
-3.357, -2, -5.664844, 1, -0.5, 0.5, 0.5,
-3.357, -2, -5.664844, 1, 1.5, 0.5, 0.5,
-3.357, -2, -5.664844, 0, 1.5, 0.5, 0.5,
-3.357, -1, -5.664844, 0, -0.5, 0.5, 0.5,
-3.357, -1, -5.664844, 1, -0.5, 0.5, 0.5,
-3.357, -1, -5.664844, 1, 1.5, 0.5, 0.5,
-3.357, -1, -5.664844, 0, 1.5, 0.5, 0.5,
-3.357, 0, -5.664844, 0, -0.5, 0.5, 0.5,
-3.357, 0, -5.664844, 1, -0.5, 0.5, 0.5,
-3.357, 0, -5.664844, 1, 1.5, 0.5, 0.5,
-3.357, 0, -5.664844, 0, 1.5, 0.5, 0.5,
-3.357, 1, -5.664844, 0, -0.5, 0.5, 0.5,
-3.357, 1, -5.664844, 1, -0.5, 0.5, 0.5,
-3.357, 1, -5.664844, 1, 1.5, 0.5, 0.5,
-3.357, 1, -5.664844, 0, 1.5, 0.5, 0.5,
-3.357, 2, -5.664844, 0, -0.5, 0.5, 0.5,
-3.357, 2, -5.664844, 1, -0.5, 0.5, 0.5,
-3.357, 2, -5.664844, 1, 1.5, 0.5, 0.5,
-3.357, 2, -5.664844, 0, 1.5, 0.5, 0.5
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
-2.907426, -3.286311, -4,
-2.907426, -3.286311, 4,
-2.907426, -3.286311, -4,
-3.057284, -3.439759, -4,
-2.907426, -3.286311, -2,
-3.057284, -3.439759, -2,
-2.907426, -3.286311, 0,
-3.057284, -3.439759, 0,
-2.907426, -3.286311, 2,
-3.057284, -3.439759, 2,
-2.907426, -3.286311, 4,
-3.057284, -3.439759, 4
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
-3.357, -3.746654, -4, 0, -0.5, 0.5, 0.5,
-3.357, -3.746654, -4, 1, -0.5, 0.5, 0.5,
-3.357, -3.746654, -4, 1, 1.5, 0.5, 0.5,
-3.357, -3.746654, -4, 0, 1.5, 0.5, 0.5,
-3.357, -3.746654, -2, 0, -0.5, 0.5, 0.5,
-3.357, -3.746654, -2, 1, -0.5, 0.5, 0.5,
-3.357, -3.746654, -2, 1, 1.5, 0.5, 0.5,
-3.357, -3.746654, -2, 0, 1.5, 0.5, 0.5,
-3.357, -3.746654, 0, 0, -0.5, 0.5, 0.5,
-3.357, -3.746654, 0, 1, -0.5, 0.5, 0.5,
-3.357, -3.746654, 0, 1, 1.5, 0.5, 0.5,
-3.357, -3.746654, 0, 0, 1.5, 0.5, 0.5,
-3.357, -3.746654, 2, 0, -0.5, 0.5, 0.5,
-3.357, -3.746654, 2, 1, -0.5, 0.5, 0.5,
-3.357, -3.746654, 2, 1, 1.5, 0.5, 0.5,
-3.357, -3.746654, 2, 0, 1.5, 0.5, 0.5,
-3.357, -3.746654, 4, 0, -0.5, 0.5, 0.5,
-3.357, -3.746654, 4, 1, -0.5, 0.5, 0.5,
-3.357, -3.746654, 4, 1, 1.5, 0.5, 0.5,
-3.357, -3.746654, 4, 0, 1.5, 0.5, 0.5
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
-2.907426, -3.286311, -4.891072,
-2.907426, 2.851599, -4.891072,
-2.907426, -3.286311, 5.425874,
-2.907426, 2.851599, 5.425874,
-2.907426, -3.286311, -4.891072,
-2.907426, -3.286311, 5.425874,
-2.907426, 2.851599, -4.891072,
-2.907426, 2.851599, 5.425874,
-2.907426, -3.286311, -4.891072,
3.086888, -3.286311, -4.891072,
-2.907426, -3.286311, 5.425874,
3.086888, -3.286311, 5.425874,
-2.907426, 2.851599, -4.891072,
3.086888, 2.851599, -4.891072,
-2.907426, 2.851599, 5.425874,
3.086888, 2.851599, 5.425874,
3.086888, -3.286311, -4.891072,
3.086888, 2.851599, -4.891072,
3.086888, -3.286311, 5.425874,
3.086888, 2.851599, 5.425874,
3.086888, -3.286311, -4.891072,
3.086888, -3.286311, 5.425874,
3.086888, 2.851599, -4.891072,
3.086888, 2.851599, 5.425874
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
var radius = 7.164999;
var distance = 31.87789;
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
mvMatrix.translate( -0.0897311, 0.2173561, -0.2674007 );
mvMatrix.scale( 1.292381, 1.262146, 0.7508944 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.87789);
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
oxasulfuron<-read.table("oxasulfuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxasulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
```

```r
y<-oxasulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
```

```r
z<-oxasulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
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
-2.82013, -0.8504055, -1.140008, 0, 0, 1, 1, 1,
-2.718059, 0.3576581, -1.435837, 1, 0, 0, 1, 1,
-2.610487, -0.868875, -2.260888, 1, 0, 0, 1, 1,
-2.478008, 2.216005, -0.581479, 1, 0, 0, 1, 1,
-2.387358, 1.391772, -0.9065408, 1, 0, 0, 1, 1,
-2.29606, 1.217658, -0.5932759, 1, 0, 0, 1, 1,
-2.294384, 0.4923339, 0.2279295, 0, 0, 0, 1, 1,
-2.269904, 0.0006074345, -0.2623271, 0, 0, 0, 1, 1,
-2.259066, 1.134861, 0.07037634, 0, 0, 0, 1, 1,
-2.222055, -0.5848081, -1.098304, 0, 0, 0, 1, 1,
-2.162019, 2.149342, -1.252898, 0, 0, 0, 1, 1,
-2.16016, -1.114052, -0.3397552, 0, 0, 0, 1, 1,
-2.158635, 2.184112, -0.8736315, 0, 0, 0, 1, 1,
-2.050401, 0.03219389, -0.2712029, 1, 1, 1, 1, 1,
-2.04736, -0.8961285, -2.923943, 1, 1, 1, 1, 1,
-2.031606, 0.947262, -1.219282, 1, 1, 1, 1, 1,
-2.010922, 0.8897321, -0.4360525, 1, 1, 1, 1, 1,
-2.001201, -0.3987628, -1.931018, 1, 1, 1, 1, 1,
-1.997593, -0.5133501, 0.03610986, 1, 1, 1, 1, 1,
-1.996079, -1.760882, -0.6054711, 1, 1, 1, 1, 1,
-1.969657, 1.078109, -1.266208, 1, 1, 1, 1, 1,
-1.958925, 2.100588, -1.160083, 1, 1, 1, 1, 1,
-1.942815, -0.1892448, -3.153301, 1, 1, 1, 1, 1,
-1.941721, 1.23234, -1.062505, 1, 1, 1, 1, 1,
-1.933902, -1.131545, -2.51701, 1, 1, 1, 1, 1,
-1.919377, 0.6857824, -0.4926094, 1, 1, 1, 1, 1,
-1.916273, 0.2230228, -1.488835, 1, 1, 1, 1, 1,
-1.904224, -0.9271149, -2.90468, 1, 1, 1, 1, 1,
-1.892517, -0.6998888, -2.567691, 0, 0, 1, 1, 1,
-1.86273, 0.03567274, -1.578904, 1, 0, 0, 1, 1,
-1.826223, -0.4022689, -1.219513, 1, 0, 0, 1, 1,
-1.824255, -0.1498906, -1.042933, 1, 0, 0, 1, 1,
-1.813196, -1.04272, -1.006615, 1, 0, 0, 1, 1,
-1.812582, 1.745749, -0.5041603, 1, 0, 0, 1, 1,
-1.811073, -0.5810983, -0.8762252, 0, 0, 0, 1, 1,
-1.80461, -1.076461, 0.6275666, 0, 0, 0, 1, 1,
-1.800821, 1.312112, -0.3011062, 0, 0, 0, 1, 1,
-1.796665, -0.9285426, -1.146155, 0, 0, 0, 1, 1,
-1.789162, 0.08182453, -1.862858, 0, 0, 0, 1, 1,
-1.77695, 1.087378, -1.02765, 0, 0, 0, 1, 1,
-1.740806, 0.8703952, -0.5595486, 0, 0, 0, 1, 1,
-1.720742, -0.7141585, 0.9533071, 1, 1, 1, 1, 1,
-1.716868, -1.163111, -3.980199, 1, 1, 1, 1, 1,
-1.696066, 0.9304873, -0.4307083, 1, 1, 1, 1, 1,
-1.691241, 0.7729148, -0.2213917, 1, 1, 1, 1, 1,
-1.682867, -1.095491, -4.467371, 1, 1, 1, 1, 1,
-1.67881, 0.8954857, -1.796401, 1, 1, 1, 1, 1,
-1.661653, 1.731851, -0.009253736, 1, 1, 1, 1, 1,
-1.642616, 0.4274747, -2.233429, 1, 1, 1, 1, 1,
-1.620557, -1.194453, -0.5298141, 1, 1, 1, 1, 1,
-1.620133, 1.317939, -0.06503771, 1, 1, 1, 1, 1,
-1.610074, -2.103179, -2.271384, 1, 1, 1, 1, 1,
-1.606719, -0.9674933, -2.933987, 1, 1, 1, 1, 1,
-1.599516, 0.1958402, -2.076244, 1, 1, 1, 1, 1,
-1.579731, 0.8538793, -2.577371, 1, 1, 1, 1, 1,
-1.576721, -0.4184933, -1.434368, 1, 1, 1, 1, 1,
-1.56411, -0.03312466, -2.110494, 0, 0, 1, 1, 1,
-1.549561, -0.3694519, -1.158595, 1, 0, 0, 1, 1,
-1.547428, -0.3743321, -1.762772, 1, 0, 0, 1, 1,
-1.546661, 0.09371827, 0.310195, 1, 0, 0, 1, 1,
-1.536331, 2.111096, -1.265115, 1, 0, 0, 1, 1,
-1.516906, 0.3003903, -1.776685, 1, 0, 0, 1, 1,
-1.504294, 0.4125151, -1.510718, 0, 0, 0, 1, 1,
-1.502843, 0.2450138, -2.101835, 0, 0, 0, 1, 1,
-1.501571, -0.7751811, -4.44333, 0, 0, 0, 1, 1,
-1.489638, 2.606988, -0.7146338, 0, 0, 0, 1, 1,
-1.480579, -0.1639716, -1.351556, 0, 0, 0, 1, 1,
-1.478655, -1.591079, -2.437872, 0, 0, 0, 1, 1,
-1.476166, -0.9882584, -0.3720454, 0, 0, 0, 1, 1,
-1.473685, -0.3093056, -2.006553, 1, 1, 1, 1, 1,
-1.459118, 0.3181497, -1.284428, 1, 1, 1, 1, 1,
-1.457322, 1.40169, -0.5198534, 1, 1, 1, 1, 1,
-1.454728, 0.03344307, -1.339791, 1, 1, 1, 1, 1,
-1.45345, 0.3934433, -2.41597, 1, 1, 1, 1, 1,
-1.44183, 2.587757, -0.6415977, 1, 1, 1, 1, 1,
-1.441184, -0.33505, -1.468068, 1, 1, 1, 1, 1,
-1.407706, -0.4267446, -0.7415874, 1, 1, 1, 1, 1,
-1.404405, -0.627122, -1.524612, 1, 1, 1, 1, 1,
-1.401984, 0.03275084, -0.1501191, 1, 1, 1, 1, 1,
-1.401871, -0.9739944, -1.797168, 1, 1, 1, 1, 1,
-1.396445, -0.3815045, -0.3906977, 1, 1, 1, 1, 1,
-1.387739, -1.450835, -2.934156, 1, 1, 1, 1, 1,
-1.385286, 0.6899013, 0.302463, 1, 1, 1, 1, 1,
-1.384813, 0.7311629, 0.2028996, 1, 1, 1, 1, 1,
-1.382543, 0.7311454, 1.25888, 0, 0, 1, 1, 1,
-1.368017, -0.5933433, -2.52936, 1, 0, 0, 1, 1,
-1.364567, -0.06485029, -3.039657, 1, 0, 0, 1, 1,
-1.359339, 0.8472217, -1.42598, 1, 0, 0, 1, 1,
-1.353924, 1.469651, -1.611534, 1, 0, 0, 1, 1,
-1.343607, -1.467398, -2.356622, 1, 0, 0, 1, 1,
-1.341816, -1.656991, -0.5527883, 0, 0, 0, 1, 1,
-1.333002, -2.572982, -3.141021, 0, 0, 0, 1, 1,
-1.324168, 2.180222, -0.3856045, 0, 0, 0, 1, 1,
-1.320128, 1.030771, -2.007656, 0, 0, 0, 1, 1,
-1.31024, -1.528048, -2.967117, 0, 0, 0, 1, 1,
-1.309914, 0.5999213, -2.224463, 0, 0, 0, 1, 1,
-1.302282, -0.4991066, -2.866896, 0, 0, 0, 1, 1,
-1.28438, -0.4407897, -1.432074, 1, 1, 1, 1, 1,
-1.275987, -0.476077, -0.4167921, 1, 1, 1, 1, 1,
-1.274777, -0.113401, -2.295164, 1, 1, 1, 1, 1,
-1.270583, 0.7009826, 1.245293, 1, 1, 1, 1, 1,
-1.259251, 1.131531, -2.471568, 1, 1, 1, 1, 1,
-1.245465, -0.5523495, -2.414185, 1, 1, 1, 1, 1,
-1.229456, -0.222441, -0.8497909, 1, 1, 1, 1, 1,
-1.227594, -0.1370451, -2.295563, 1, 1, 1, 1, 1,
-1.227189, 0.4419112, -0.5862784, 1, 1, 1, 1, 1,
-1.214776, -2.222316, -3.49163, 1, 1, 1, 1, 1,
-1.212861, 1.488419, -1.032925, 1, 1, 1, 1, 1,
-1.210332, 0.82626, -0.1628505, 1, 1, 1, 1, 1,
-1.201083, 0.04029627, -2.675835, 1, 1, 1, 1, 1,
-1.198622, -0.7544805, -1.913378, 1, 1, 1, 1, 1,
-1.19614, -0.4361905, -2.133014, 1, 1, 1, 1, 1,
-1.194059, -1.190578, -2.807643, 0, 0, 1, 1, 1,
-1.177868, -0.1501671, -2.546603, 1, 0, 0, 1, 1,
-1.177153, -0.8126806, -3.360976, 1, 0, 0, 1, 1,
-1.172555, 0.5079054, -1.826075, 1, 0, 0, 1, 1,
-1.171275, -2.011644, -4.36861, 1, 0, 0, 1, 1,
-1.161099, 0.1925178, -0.1831986, 1, 0, 0, 1, 1,
-1.15901, -0.6726192, -2.520649, 0, 0, 0, 1, 1,
-1.153231, 0.4289991, -0.4539286, 0, 0, 0, 1, 1,
-1.14899, 0.03238054, -1.617151, 0, 0, 0, 1, 1,
-1.14728, 1.10327, 0.3960845, 0, 0, 0, 1, 1,
-1.132305, -0.9102103, -4.676558, 0, 0, 0, 1, 1,
-1.129288, 0.3262504, -0.685071, 0, 0, 0, 1, 1,
-1.127022, 0.8225005, -1.969071, 0, 0, 0, 1, 1,
-1.121789, 1.103431, -2.719451, 1, 1, 1, 1, 1,
-1.119159, 0.7298771, -0.2766318, 1, 1, 1, 1, 1,
-1.104749, 0.5721796, -1.810364, 1, 1, 1, 1, 1,
-1.10412, 1.662757, 0.2747099, 1, 1, 1, 1, 1,
-1.101917, 0.2807207, -1.402668, 1, 1, 1, 1, 1,
-1.10142, 1.307752, 0.2638055, 1, 1, 1, 1, 1,
-1.09956, -1.28421, -1.73775, 1, 1, 1, 1, 1,
-1.095581, 0.6053112, -2.340897, 1, 1, 1, 1, 1,
-1.094111, 0.01036915, 1.135476, 1, 1, 1, 1, 1,
-1.083584, -0.7843136, -2.078828, 1, 1, 1, 1, 1,
-1.081404, -0.4598171, -2.201823, 1, 1, 1, 1, 1,
-1.072169, -0.9345075, -2.228421, 1, 1, 1, 1, 1,
-1.071889, -0.6017517, -2.223519, 1, 1, 1, 1, 1,
-1.069834, 1.737182, -0.5328355, 1, 1, 1, 1, 1,
-1.060678, -0.3399197, -1.62113, 1, 1, 1, 1, 1,
-1.057498, 0.9159949, -0.007798986, 0, 0, 1, 1, 1,
-1.056544, -0.117089, -3.052519, 1, 0, 0, 1, 1,
-1.052026, -1.815701, -2.351978, 1, 0, 0, 1, 1,
-1.043037, 0.9564171, -0.4032333, 1, 0, 0, 1, 1,
-1.036748, 1.331424, -0.4182935, 1, 0, 0, 1, 1,
-1.035146, 0.2590034, -2.777622, 1, 0, 0, 1, 1,
-1.031217, -0.03260697, -2.295018, 0, 0, 0, 1, 1,
-1.027856, -0.5838614, -1.986963, 0, 0, 0, 1, 1,
-1.020504, 0.02740396, -1.684703, 0, 0, 0, 1, 1,
-1.019247, 0.6024472, 0.7166862, 0, 0, 0, 1, 1,
-1.014721, 0.5924009, -1.250554, 0, 0, 0, 1, 1,
-1.01418, -0.916658, 0.2806531, 0, 0, 0, 1, 1,
-1.001421, -0.5910512, -1.221449, 0, 0, 0, 1, 1,
-1.001332, -1.521888, -2.67616, 1, 1, 1, 1, 1,
-0.9986381, 1.319698, -0.3542704, 1, 1, 1, 1, 1,
-0.9960394, -0.1530116, -0.9854704, 1, 1, 1, 1, 1,
-0.9920005, -0.2997743, -2.194376, 1, 1, 1, 1, 1,
-0.9795771, 0.526592, 1.005667, 1, 1, 1, 1, 1,
-0.9793493, 0.4490284, -0.6698142, 1, 1, 1, 1, 1,
-0.9591776, 0.03996598, -2.550358, 1, 1, 1, 1, 1,
-0.9416564, -0.3099134, -0.3335827, 1, 1, 1, 1, 1,
-0.9374541, -0.4621932, -2.250555, 1, 1, 1, 1, 1,
-0.9372733, 0.9920726, 0.7407435, 1, 1, 1, 1, 1,
-0.9370443, -0.2617593, -1.474252, 1, 1, 1, 1, 1,
-0.9318258, -0.9241633, -3.528214, 1, 1, 1, 1, 1,
-0.9204878, -0.3543151, -0.8134192, 1, 1, 1, 1, 1,
-0.9191549, 1.173215, -1.9154, 1, 1, 1, 1, 1,
-0.9161603, 1.459874, -1.286497, 1, 1, 1, 1, 1,
-0.913707, 1.089498, -0.1324889, 0, 0, 1, 1, 1,
-0.9085878, -0.1983183, -2.442918, 1, 0, 0, 1, 1,
-0.905835, -0.3197618, -3.382503, 1, 0, 0, 1, 1,
-0.9042695, 0.004945147, -2.678443, 1, 0, 0, 1, 1,
-0.9034082, -1.054583, -3.232251, 1, 0, 0, 1, 1,
-0.8975154, -0.9325873, -1.291015, 1, 0, 0, 1, 1,
-0.8953006, 1.343665, -2.25205, 0, 0, 0, 1, 1,
-0.8926252, 1.033238, -0.2750981, 0, 0, 0, 1, 1,
-0.8909257, -0.1849556, -3.316647, 0, 0, 0, 1, 1,
-0.8875974, -0.7985508, -2.199773, 0, 0, 0, 1, 1,
-0.8833409, 1.73874, -3.443891, 0, 0, 0, 1, 1,
-0.8765009, 0.637606, -0.1416604, 0, 0, 0, 1, 1,
-0.8740917, 1.315617, -0.7679761, 0, 0, 0, 1, 1,
-0.8734044, -0.3688179, 0.4407689, 1, 1, 1, 1, 1,
-0.869355, -0.3588726, -1.719061, 1, 1, 1, 1, 1,
-0.8693545, 0.04289749, -1.197219, 1, 1, 1, 1, 1,
-0.8683367, -0.1772521, -3.307129, 1, 1, 1, 1, 1,
-0.86707, -1.186934, -1.055301, 1, 1, 1, 1, 1,
-0.8632098, 1.658644, 0.1314518, 1, 1, 1, 1, 1,
-0.8611739, 0.4919876, -0.6616161, 1, 1, 1, 1, 1,
-0.8562236, 0.04606853, -2.351204, 1, 1, 1, 1, 1,
-0.8557248, 1.263001, -0.4365829, 1, 1, 1, 1, 1,
-0.8543233, -1.137216, -0.8962254, 1, 1, 1, 1, 1,
-0.8502433, 0.2017594, -0.5576252, 1, 1, 1, 1, 1,
-0.8501357, 0.3389947, -2.363158, 1, 1, 1, 1, 1,
-0.8484775, 1.145549, -0.1396969, 1, 1, 1, 1, 1,
-0.8468005, -0.2059583, -1.818889, 1, 1, 1, 1, 1,
-0.8424433, 0.6036929, -0.2088228, 1, 1, 1, 1, 1,
-0.8374672, -0.08879431, -1.756568, 0, 0, 1, 1, 1,
-0.8309214, 0.3181429, -2.369404, 1, 0, 0, 1, 1,
-0.8307989, 1.626735, -0.8290222, 1, 0, 0, 1, 1,
-0.8135365, -0.6304283, -2.503001, 1, 0, 0, 1, 1,
-0.811062, -0.7776167, -1.442107, 1, 0, 0, 1, 1,
-0.8102267, 0.2421037, -2.972704, 1, 0, 0, 1, 1,
-0.8086644, -0.7310015, -2.367214, 0, 0, 0, 1, 1,
-0.8066714, -1.035789, -1.988255, 0, 0, 0, 1, 1,
-0.8059154, -0.05602158, -2.200846, 0, 0, 0, 1, 1,
-0.7988957, 0.2142413, -1.922131, 0, 0, 0, 1, 1,
-0.7947876, -1.007415, -2.705859, 0, 0, 0, 1, 1,
-0.7933228, 1.791904, 1.2373, 0, 0, 0, 1, 1,
-0.7927598, -0.4238794, -3.352714, 0, 0, 0, 1, 1,
-0.7916589, -0.2245494, -1.947698, 1, 1, 1, 1, 1,
-0.7915874, -0.2362195, -1.465055, 1, 1, 1, 1, 1,
-0.7898949, -0.9427551, -0.6230333, 1, 1, 1, 1, 1,
-0.7853029, -0.6103362, -1.88334, 1, 1, 1, 1, 1,
-0.7818545, 1.339556, 1.22506, 1, 1, 1, 1, 1,
-0.7768599, -0.6447276, -3.033323, 1, 1, 1, 1, 1,
-0.7768576, -0.2238742, -1.449707, 1, 1, 1, 1, 1,
-0.7748401, 1.269421, -1.511417, 1, 1, 1, 1, 1,
-0.7731715, -0.2051289, -4.397501, 1, 1, 1, 1, 1,
-0.7725768, 1.930002, -0.3811026, 1, 1, 1, 1, 1,
-0.763527, 1.000826, -0.1573022, 1, 1, 1, 1, 1,
-0.7565841, -0.7871609, -1.508186, 1, 1, 1, 1, 1,
-0.7548006, -1.465103, -3.292455, 1, 1, 1, 1, 1,
-0.7529188, -0.9320144, -4.239561, 1, 1, 1, 1, 1,
-0.7457129, -1.234015, -3.939851, 1, 1, 1, 1, 1,
-0.7422063, -0.2453978, -0.4767978, 0, 0, 1, 1, 1,
-0.7411004, -0.4007922, -2.652204, 1, 0, 0, 1, 1,
-0.7286226, 1.192769, -0.5631882, 1, 0, 0, 1, 1,
-0.7257161, -0.3262308, -0.9229151, 1, 0, 0, 1, 1,
-0.7250519, 1.118171, -0.3442916, 1, 0, 0, 1, 1,
-0.7233557, 0.09362131, -2.336859, 1, 0, 0, 1, 1,
-0.7154286, -0.004042958, -0.983847, 0, 0, 0, 1, 1,
-0.7151492, 1.778619, -1.72677, 0, 0, 0, 1, 1,
-0.7133428, 0.3803711, -1.19577, 0, 0, 0, 1, 1,
-0.7125151, 1.283059, -1.561857, 0, 0, 0, 1, 1,
-0.7121426, -0.9356619, -3.776426, 0, 0, 0, 1, 1,
-0.7089984, 0.4678855, -0.6571885, 0, 0, 0, 1, 1,
-0.7085792, 0.7779939, -0.7677487, 0, 0, 0, 1, 1,
-0.7013555, 0.4688817, -0.6295114, 1, 1, 1, 1, 1,
-0.6956499, 1.852578, -1.283421, 1, 1, 1, 1, 1,
-0.694904, 1.155794, 0.6033604, 1, 1, 1, 1, 1,
-0.6883405, -1.409723, -2.407915, 1, 1, 1, 1, 1,
-0.6872199, 0.7286485, -2.753515, 1, 1, 1, 1, 1,
-0.6859828, -1.698348, -2.062241, 1, 1, 1, 1, 1,
-0.6843163, 1.06361, -1.330904, 1, 1, 1, 1, 1,
-0.6782582, 0.9656364, -0.3042624, 1, 1, 1, 1, 1,
-0.6761296, 0.08718508, -2.349505, 1, 1, 1, 1, 1,
-0.6710173, 0.3790068, -0.2571356, 1, 1, 1, 1, 1,
-0.6680067, -0.8579546, -3.562063, 1, 1, 1, 1, 1,
-0.6661757, -0.8059886, -0.4629665, 1, 1, 1, 1, 1,
-0.6600953, -1.193847, -1.910253, 1, 1, 1, 1, 1,
-0.6581427, 0.04796505, -0.780551, 1, 1, 1, 1, 1,
-0.6576389, -2.397716, -2.963978, 1, 1, 1, 1, 1,
-0.6567792, -0.0400716, -1.508339, 0, 0, 1, 1, 1,
-0.6546112, 0.8622706, -0.01405566, 1, 0, 0, 1, 1,
-0.6514064, -1.508772, -3.575346, 1, 0, 0, 1, 1,
-0.6502706, 2.123651, 1.027256, 1, 0, 0, 1, 1,
-0.6477746, 1.545315, -0.9143528, 1, 0, 0, 1, 1,
-0.6461579, -0.371793, -1.340196, 1, 0, 0, 1, 1,
-0.6416965, -0.8804682, -2.160521, 0, 0, 0, 1, 1,
-0.6408587, -0.3642587, -1.582008, 0, 0, 0, 1, 1,
-0.6404597, 0.3467793, -0.8011752, 0, 0, 0, 1, 1,
-0.6397786, 0.5513855, -1.396185, 0, 0, 0, 1, 1,
-0.6368244, -0.707572, -1.173879, 0, 0, 0, 1, 1,
-0.6366504, 1.189526, 0.5119308, 0, 0, 0, 1, 1,
-0.6360484, 0.4083116, 0.2784714, 0, 0, 0, 1, 1,
-0.6315786, 0.8724574, -1.154882, 1, 1, 1, 1, 1,
-0.6293962, 0.8184661, 0.2331563, 1, 1, 1, 1, 1,
-0.6279951, 0.5329517, -0.8935431, 1, 1, 1, 1, 1,
-0.627603, -0.9246528, -1.998992, 1, 1, 1, 1, 1,
-0.626325, -1.109267, -1.548845, 1, 1, 1, 1, 1,
-0.6243256, -0.3555005, -2.476837, 1, 1, 1, 1, 1,
-0.618673, 0.3255747, -0.8049541, 1, 1, 1, 1, 1,
-0.6170917, -0.6435001, -1.686377, 1, 1, 1, 1, 1,
-0.6124594, -0.09371964, -1.025006, 1, 1, 1, 1, 1,
-0.6115403, -0.5341383, -2.036512, 1, 1, 1, 1, 1,
-0.6102285, 1.213297, -0.6151973, 1, 1, 1, 1, 1,
-0.6070104, -1.945367, -3.293572, 1, 1, 1, 1, 1,
-0.600819, -1.671171, -3.085998, 1, 1, 1, 1, 1,
-0.6001943, -0.9928393, -1.366683, 1, 1, 1, 1, 1,
-0.5964419, 0.6355147, -0.7052365, 1, 1, 1, 1, 1,
-0.5961977, 0.1701391, -1.650418, 0, 0, 1, 1, 1,
-0.5947872, -0.8871595, -3.192122, 1, 0, 0, 1, 1,
-0.5918754, -0.2718151, -2.616335, 1, 0, 0, 1, 1,
-0.5912558, 1.063765, -0.1087513, 1, 0, 0, 1, 1,
-0.5901645, 0.01552834, -1.286112, 1, 0, 0, 1, 1,
-0.5847223, 0.07246667, 0.5446938, 1, 0, 0, 1, 1,
-0.5833551, 0.250609, -0.7045065, 0, 0, 0, 1, 1,
-0.5706313, 0.6003521, -1.354153, 0, 0, 0, 1, 1,
-0.5699117, 2.001749, -0.01897595, 0, 0, 0, 1, 1,
-0.5689589, 0.3512925, -2.02582, 0, 0, 0, 1, 1,
-0.5643682, 1.255009, -0.01895545, 0, 0, 0, 1, 1,
-0.5568281, 0.8625664, 1.685633, 0, 0, 0, 1, 1,
-0.5562278, -1.633052, -1.812616, 0, 0, 0, 1, 1,
-0.5545247, 0.5069189, 1.149122, 1, 1, 1, 1, 1,
-0.5477608, 1.181287, -0.8523383, 1, 1, 1, 1, 1,
-0.5448368, -0.304347, -1.642915, 1, 1, 1, 1, 1,
-0.5446605, -0.7958152, -2.999282, 1, 1, 1, 1, 1,
-0.5441756, -0.8358343, -2.946718, 1, 1, 1, 1, 1,
-0.5438429, -1.109361, -3.871949, 1, 1, 1, 1, 1,
-0.5420036, 1.660912, 0.7626625, 1, 1, 1, 1, 1,
-0.539576, -0.02366572, -2.552306, 1, 1, 1, 1, 1,
-0.5375701, 0.5582051, -1.069475, 1, 1, 1, 1, 1,
-0.5334057, -2.205953, -3.670768, 1, 1, 1, 1, 1,
-0.5331923, 1.417952, -0.7576173, 1, 1, 1, 1, 1,
-0.5324789, -0.9441189, -1.962204, 1, 1, 1, 1, 1,
-0.5302795, -0.1184138, -0.7116863, 1, 1, 1, 1, 1,
-0.5275685, 0.4136416, 0.2999451, 1, 1, 1, 1, 1,
-0.5234966, -0.6318187, -1.79262, 1, 1, 1, 1, 1,
-0.5200174, 0.1949379, 0.320601, 0, 0, 1, 1, 1,
-0.519102, -0.4015847, -2.425883, 1, 0, 0, 1, 1,
-0.5129629, 0.8006425, -1.849102, 1, 0, 0, 1, 1,
-0.5115045, -0.01443293, -0.6989565, 1, 0, 0, 1, 1,
-0.511056, -0.006491052, -1.164171, 1, 0, 0, 1, 1,
-0.5075846, -1.213874, -3.184025, 1, 0, 0, 1, 1,
-0.5063554, 0.5020531, -0.877031, 0, 0, 0, 1, 1,
-0.5023406, -0.4237789, -1.853255, 0, 0, 0, 1, 1,
-0.5020831, -0.4778929, -2.340566, 0, 0, 0, 1, 1,
-0.5017053, 0.4749435, -0.2479998, 0, 0, 0, 1, 1,
-0.5003509, -0.4870737, -1.369016, 0, 0, 0, 1, 1,
-0.4931577, 0.5029471, -0.1968871, 0, 0, 0, 1, 1,
-0.4916587, -0.543538, -2.762044, 0, 0, 0, 1, 1,
-0.490208, -1.929937, -2.482564, 1, 1, 1, 1, 1,
-0.4843906, 0.9012918, 1.134264, 1, 1, 1, 1, 1,
-0.4836953, 0.4561905, -1.898507, 1, 1, 1, 1, 1,
-0.4831893, 0.3243535, -1.348201, 1, 1, 1, 1, 1,
-0.4781628, -0.5863765, -3.135139, 1, 1, 1, 1, 1,
-0.4731236, 0.5593234, 0.1403252, 1, 1, 1, 1, 1,
-0.4680161, -0.4163695, -2.316927, 1, 1, 1, 1, 1,
-0.4678715, 0.9649705, 0.1043948, 1, 1, 1, 1, 1,
-0.4609868, -0.606482, -1.3918, 1, 1, 1, 1, 1,
-0.460925, -0.0545667, -1.162073, 1, 1, 1, 1, 1,
-0.4603042, 0.6609635, 0.816592, 1, 1, 1, 1, 1,
-0.455209, 0.4572986, -0.1314449, 1, 1, 1, 1, 1,
-0.4550377, -0.3745542, -2.153055, 1, 1, 1, 1, 1,
-0.4539496, -1.351404, -2.290643, 1, 1, 1, 1, 1,
-0.4528618, -0.1858327, -2.422266, 1, 1, 1, 1, 1,
-0.4523569, -0.852631, -3.686096, 0, 0, 1, 1, 1,
-0.4522268, -1.403111, -3.605721, 1, 0, 0, 1, 1,
-0.4498648, 0.0380303, -1.026438, 1, 0, 0, 1, 1,
-0.4468891, -0.6945822, -2.09934, 1, 0, 0, 1, 1,
-0.4467905, 1.086766, -0.6722015, 1, 0, 0, 1, 1,
-0.4426005, -0.2269976, -2.429485, 1, 0, 0, 1, 1,
-0.4420604, -2.308488, -1.642747, 0, 0, 0, 1, 1,
-0.4408378, -3.196924, -2.339868, 0, 0, 0, 1, 1,
-0.437282, -0.3787924, -0.8591765, 0, 0, 0, 1, 1,
-0.4367268, 0.9212258, -0.005629804, 0, 0, 0, 1, 1,
-0.4323081, -0.4876823, -3.081633, 0, 0, 0, 1, 1,
-0.4289594, 0.7518123, 1.258833, 0, 0, 0, 1, 1,
-0.4271075, -0.4268966, -2.553955, 0, 0, 0, 1, 1,
-0.4264196, -0.5518485, -3.693018, 1, 1, 1, 1, 1,
-0.4256172, -1.174905, -4.357241, 1, 1, 1, 1, 1,
-0.4130909, 0.6145917, -1.107737, 1, 1, 1, 1, 1,
-0.4121834, 0.1508921, 0.07549497, 1, 1, 1, 1, 1,
-0.4081286, -0.1444755, -2.357162, 1, 1, 1, 1, 1,
-0.4080181, 0.6326525, 1.117295, 1, 1, 1, 1, 1,
-0.4052725, -0.7692335, -1.830621, 1, 1, 1, 1, 1,
-0.4027272, -0.3803978, -3.022056, 1, 1, 1, 1, 1,
-0.3983223, -1.394687, -2.65679, 1, 1, 1, 1, 1,
-0.3936992, -0.6228778, -3.357205, 1, 1, 1, 1, 1,
-0.3882537, -0.01114442, -1.385161, 1, 1, 1, 1, 1,
-0.387202, 0.5010267, -1.988249, 1, 1, 1, 1, 1,
-0.3805091, 0.02374009, -1.72273, 1, 1, 1, 1, 1,
-0.3799709, -0.02892735, 0.1190664, 1, 1, 1, 1, 1,
-0.3785748, -0.2888213, -2.443399, 1, 1, 1, 1, 1,
-0.3765003, 2.093889, -0.3370181, 0, 0, 1, 1, 1,
-0.3713246, 0.7930213, -2.137404, 1, 0, 0, 1, 1,
-0.3697996, 0.8479053, -0.6151468, 1, 0, 0, 1, 1,
-0.3671244, 0.8001788, -0.6359259, 1, 0, 0, 1, 1,
-0.3666582, -0.5675676, -2.760842, 1, 0, 0, 1, 1,
-0.366393, 0.4634214, -0.002148779, 1, 0, 0, 1, 1,
-0.3618172, 0.1018393, -3.881996, 0, 0, 0, 1, 1,
-0.3562959, 0.5294605, -2.473279, 0, 0, 0, 1, 1,
-0.3560171, 0.8036126, -0.5843282, 0, 0, 0, 1, 1,
-0.3552566, -0.04028174, -2.562761, 0, 0, 0, 1, 1,
-0.3485328, 0.3430142, 0.8584297, 0, 0, 0, 1, 1,
-0.3471118, 1.161781, 0.5910373, 0, 0, 0, 1, 1,
-0.3444899, 1.304867, -1.802585, 0, 0, 0, 1, 1,
-0.3400345, 0.02042322, -3.475129, 1, 1, 1, 1, 1,
-0.3371337, -0.4718847, -3.268512, 1, 1, 1, 1, 1,
-0.3357668, 1.897521, -0.8741875, 1, 1, 1, 1, 1,
-0.3355693, 1.407713, 1.044509, 1, 1, 1, 1, 1,
-0.3337196, -1.47629, -1.530009, 1, 1, 1, 1, 1,
-0.3316239, 0.9447574, 0.4201123, 1, 1, 1, 1, 1,
-0.3314848, -1.010917, -2.243551, 1, 1, 1, 1, 1,
-0.3268412, -0.8217791, -1.179746, 1, 1, 1, 1, 1,
-0.3267586, -1.091439, -2.76158, 1, 1, 1, 1, 1,
-0.3198121, 0.5317162, 0.3996812, 1, 1, 1, 1, 1,
-0.3119734, 0.8850445, -0.2895664, 1, 1, 1, 1, 1,
-0.3104786, 1.574373, 0.696241, 1, 1, 1, 1, 1,
-0.3102454, 0.9026309, 0.3627291, 1, 1, 1, 1, 1,
-0.307383, -0.8307041, -1.958558, 1, 1, 1, 1, 1,
-0.306218, -0.7665598, -2.581165, 1, 1, 1, 1, 1,
-0.3001724, -1.737412, -2.451418, 0, 0, 1, 1, 1,
-0.2987532, 0.8814349, -1.403602, 1, 0, 0, 1, 1,
-0.2962987, -2.055876, -4.11652, 1, 0, 0, 1, 1,
-0.2899313, -0.3395673, -2.468024, 1, 0, 0, 1, 1,
-0.2889192, 0.9279707, 0.2121781, 1, 0, 0, 1, 1,
-0.2865812, 0.212486, -1.226669, 1, 0, 0, 1, 1,
-0.285992, -0.9175131, -4.253587, 0, 0, 0, 1, 1,
-0.2826049, 0.130626, -0.5997379, 0, 0, 0, 1, 1,
-0.2808306, -2.01491, -3.360183, 0, 0, 0, 1, 1,
-0.2798673, 0.9223753, -0.8381132, 0, 0, 0, 1, 1,
-0.2768033, -0.03906447, -1.744606, 0, 0, 0, 1, 1,
-0.2737213, -0.02525431, -2.038443, 0, 0, 0, 1, 1,
-0.2732476, -0.06629675, -3.093451, 0, 0, 0, 1, 1,
-0.2658648, 0.1462552, -0.8710122, 1, 1, 1, 1, 1,
-0.2654442, 0.02272611, -0.9358369, 1, 1, 1, 1, 1,
-0.2619666, -0.3409049, -2.999588, 1, 1, 1, 1, 1,
-0.2582712, -0.6667918, -1.928228, 1, 1, 1, 1, 1,
-0.2577127, -0.9149371, -4.03269, 1, 1, 1, 1, 1,
-0.254369, -0.9067864, -3.314254, 1, 1, 1, 1, 1,
-0.2540752, -1.654722, -2.657166, 1, 1, 1, 1, 1,
-0.2495941, -0.5865653, -3.098639, 1, 1, 1, 1, 1,
-0.2482012, -0.6650281, -4.140309, 1, 1, 1, 1, 1,
-0.2466529, -0.5158843, -2.040351, 1, 1, 1, 1, 1,
-0.2445137, -0.1957686, -3.399301, 1, 1, 1, 1, 1,
-0.2391087, 0.6449495, 0.3514802, 1, 1, 1, 1, 1,
-0.2342902, 0.5953515, 0.4758867, 1, 1, 1, 1, 1,
-0.2340942, 1.413521, 0.5376105, 1, 1, 1, 1, 1,
-0.2324193, 0.2488574, -0.4221081, 1, 1, 1, 1, 1,
-0.2318487, -0.534441, -1.678125, 0, 0, 1, 1, 1,
-0.230641, -2.458989, -3.121924, 1, 0, 0, 1, 1,
-0.2269718, 0.3226712, -1.125886, 1, 0, 0, 1, 1,
-0.2253522, 0.02314447, -1.567129, 1, 0, 0, 1, 1,
-0.2251947, -0.5240467, -2.185286, 1, 0, 0, 1, 1,
-0.2231483, -0.9864309, -1.734591, 1, 0, 0, 1, 1,
-0.2230899, -0.3917449, -2.987823, 0, 0, 0, 1, 1,
-0.2214224, -0.3348744, -2.430524, 0, 0, 0, 1, 1,
-0.2199605, 0.147186, -1.090274, 0, 0, 0, 1, 1,
-0.2084186, -0.1165365, -3.077412, 0, 0, 0, 1, 1,
-0.2083409, -1.510134, -4.637858, 0, 0, 0, 1, 1,
-0.2073079, 0.5232473, -0.7387729, 0, 0, 0, 1, 1,
-0.2063992, -0.8158358, -3.84023, 0, 0, 0, 1, 1,
-0.2046938, 0.3894811, 0.7612175, 1, 1, 1, 1, 1,
-0.2040831, -0.3095928, -1.404838, 1, 1, 1, 1, 1,
-0.1969666, -1.315458, -2.462238, 1, 1, 1, 1, 1,
-0.1940219, 0.6833912, 0.9811286, 1, 1, 1, 1, 1,
-0.1912382, 0.1729488, -1.155468, 1, 1, 1, 1, 1,
-0.188266, -1.732775, -1.710751, 1, 1, 1, 1, 1,
-0.187945, -0.4335606, -1.539179, 1, 1, 1, 1, 1,
-0.1878647, -1.279154, -2.89637, 1, 1, 1, 1, 1,
-0.1855264, 0.1453009, -0.1219485, 1, 1, 1, 1, 1,
-0.1785719, -0.3048857, -2.598815, 1, 1, 1, 1, 1,
-0.1782792, -0.3892295, -2.11715, 1, 1, 1, 1, 1,
-0.1733864, -0.827162, -3.474803, 1, 1, 1, 1, 1,
-0.1717167, 1.383525, -0.7796054, 1, 1, 1, 1, 1,
-0.1682223, 0.9775658, -1.413722, 1, 1, 1, 1, 1,
-0.1644524, 0.7069639, -1.706412, 1, 1, 1, 1, 1,
-0.1618769, 0.7354264, 0.6651613, 0, 0, 1, 1, 1,
-0.1594806, -1.305379, -2.91158, 1, 0, 0, 1, 1,
-0.1588541, -0.8875454, -3.172392, 1, 0, 0, 1, 1,
-0.1567539, -0.2435705, -3.791285, 1, 0, 0, 1, 1,
-0.1461585, 0.4543196, 0.6802498, 1, 0, 0, 1, 1,
-0.1303326, 0.479688, 1.387998, 1, 0, 0, 1, 1,
-0.1285135, -0.008323842, -1.317854, 0, 0, 0, 1, 1,
-0.1240143, -0.1176639, -2.265226, 0, 0, 0, 1, 1,
-0.1222025, 2.112811, 1.235542, 0, 0, 0, 1, 1,
-0.1217863, -0.3845454, -3.91955, 0, 0, 0, 1, 1,
-0.1185736, 0.8573502, 0.2481198, 0, 0, 0, 1, 1,
-0.1185457, -0.7365242, -1.787279, 0, 0, 0, 1, 1,
-0.1176626, 0.6105602, -2.249125, 0, 0, 0, 1, 1,
-0.1148659, 1.525098, -0.3900428, 1, 1, 1, 1, 1,
-0.1125772, 0.493802, 0.1796317, 1, 1, 1, 1, 1,
-0.1113034, -0.4231563, -3.797055, 1, 1, 1, 1, 1,
-0.1072825, -0.2860214, -3.267435, 1, 1, 1, 1, 1,
-0.09912381, -1.268179, -3.246476, 1, 1, 1, 1, 1,
-0.09294444, -0.2922694, -2.475984, 1, 1, 1, 1, 1,
-0.09283778, -0.9551914, -3.007336, 1, 1, 1, 1, 1,
-0.09101357, 1.021775, -0.4939353, 1, 1, 1, 1, 1,
-0.08997791, 1.791345, -1.070843, 1, 1, 1, 1, 1,
-0.08820371, -1.344548, -4.261912, 1, 1, 1, 1, 1,
-0.08742707, -1.061327, -4.740826, 1, 1, 1, 1, 1,
-0.08633763, -0.2433756, -2.455072, 1, 1, 1, 1, 1,
-0.08417294, 1.054395, 0.719487, 1, 1, 1, 1, 1,
-0.08080883, 2.240226, -0.2659665, 1, 1, 1, 1, 1,
-0.08006842, -0.3243731, -3.39155, 1, 1, 1, 1, 1,
-0.07842395, 0.2161913, -0.3711798, 0, 0, 1, 1, 1,
-0.07615536, 0.2998854, 0.326928, 1, 0, 0, 1, 1,
-0.07554314, -0.6220698, -3.475455, 1, 0, 0, 1, 1,
-0.07439758, 1.452084, 0.2442269, 1, 0, 0, 1, 1,
-0.07275714, -0.3708698, -3.718745, 1, 0, 0, 1, 1,
-0.06711479, -0.6469902, -3.215498, 1, 0, 0, 1, 1,
-0.06491436, -1.692947, -3.007656, 0, 0, 0, 1, 1,
-0.06217156, -0.4659252, -2.771334, 0, 0, 0, 1, 1,
-0.06022847, -0.2548268, -4.489618, 0, 0, 0, 1, 1,
-0.0540536, 0.2900778, 0.04180756, 0, 0, 0, 1, 1,
-0.05333165, -0.3196412, -0.4900335, 0, 0, 0, 1, 1,
-0.05262304, -0.9076603, -4.027402, 0, 0, 0, 1, 1,
-0.05139171, 0.3722098, 0.7899904, 0, 0, 0, 1, 1,
-0.04734614, -0.8517817, -4.038133, 1, 1, 1, 1, 1,
-0.03666894, -0.08516938, -1.942493, 1, 1, 1, 1, 1,
-0.03582544, -0.7013372, -2.522779, 1, 1, 1, 1, 1,
-0.03307863, -0.08760993, -2.261629, 1, 1, 1, 1, 1,
-0.03159437, -0.7495613, -3.105616, 1, 1, 1, 1, 1,
-0.02544903, -0.4765044, -2.85205, 1, 1, 1, 1, 1,
-0.02398707, 0.2841194, -0.6437537, 1, 1, 1, 1, 1,
-0.02397988, -2.294792, -3.172108, 1, 1, 1, 1, 1,
-0.02390783, 0.8752274, 2.258671, 1, 1, 1, 1, 1,
-0.02235428, -0.5547573, -1.901999, 1, 1, 1, 1, 1,
-0.02126982, 0.6330076, -0.02312808, 1, 1, 1, 1, 1,
-0.01580313, -0.2116197, -3.286707, 1, 1, 1, 1, 1,
-0.01488432, 0.2081325, 1.169255, 1, 1, 1, 1, 1,
-0.01479001, 0.5631994, -0.8679233, 1, 1, 1, 1, 1,
-0.01309467, -0.4615423, -3.459186, 1, 1, 1, 1, 1,
-0.003820889, 1.243178, 1.627269, 0, 0, 1, 1, 1,
-0.002773541, 1.998614, 0.6575928, 1, 0, 0, 1, 1,
-0.002134472, 0.1736614, 0.1768162, 1, 0, 0, 1, 1,
7.758175e-05, 0.1625326, -1.125461, 1, 0, 0, 1, 1,
0.0005895565, -0.3570955, 4.031904, 1, 0, 0, 1, 1,
0.002181983, -0.1820691, 5.275627, 1, 0, 0, 1, 1,
0.005504016, -0.692285, 3.765817, 0, 0, 0, 1, 1,
0.006918508, 1.701459, -1.366653, 0, 0, 0, 1, 1,
0.008953667, 0.5393467, 0.7158061, 0, 0, 0, 1, 1,
0.01181622, -0.4521775, 3.22454, 0, 0, 0, 1, 1,
0.01371806, 0.9373252, -0.769605, 0, 0, 0, 1, 1,
0.01615156, 1.507443, 2.244464, 0, 0, 0, 1, 1,
0.02100549, -0.1817567, 2.771842, 0, 0, 0, 1, 1,
0.02143158, 0.08579135, 0.4943845, 1, 1, 1, 1, 1,
0.02659614, -0.914014, 3.342039, 1, 1, 1, 1, 1,
0.02789653, 1.626225, 0.7040957, 1, 1, 1, 1, 1,
0.0309768, -0.4582349, 2.419502, 1, 1, 1, 1, 1,
0.03186157, -0.01472013, 2.590462, 1, 1, 1, 1, 1,
0.03286914, -1.602394, 3.165204, 1, 1, 1, 1, 1,
0.03420015, 0.6575389, -0.1919144, 1, 1, 1, 1, 1,
0.03475524, 1.059016, -2.169425, 1, 1, 1, 1, 1,
0.0374741, 0.05974818, 1.619682, 1, 1, 1, 1, 1,
0.03773041, -0.5329888, 3.605526, 1, 1, 1, 1, 1,
0.04664479, 0.6257913, 0.6993325, 1, 1, 1, 1, 1,
0.04806648, -0.2600767, 2.41026, 1, 1, 1, 1, 1,
0.04921831, 0.5688207, -1.092975, 1, 1, 1, 1, 1,
0.04968476, 0.6034694, -0.8193953, 1, 1, 1, 1, 1,
0.05147372, 1.387657, 0.6418555, 1, 1, 1, 1, 1,
0.05271227, -0.4287015, 2.787204, 0, 0, 1, 1, 1,
0.05280053, 0.5033667, -1.17421, 1, 0, 0, 1, 1,
0.05301325, 0.09926341, 1.133364, 1, 0, 0, 1, 1,
0.0554596, -1.58448, 2.888928, 1, 0, 0, 1, 1,
0.05952644, -1.889302, 3.671678, 1, 0, 0, 1, 1,
0.06017605, -0.8636752, 2.58092, 1, 0, 0, 1, 1,
0.06088072, -0.6324762, 3.375531, 0, 0, 0, 1, 1,
0.06468289, 0.5453112, 0.4497524, 0, 0, 0, 1, 1,
0.06694397, 0.09350365, 1.728809, 0, 0, 0, 1, 1,
0.07071396, -0.08973116, 2.144227, 0, 0, 0, 1, 1,
0.07205417, 0.07107498, 0.7747852, 0, 0, 0, 1, 1,
0.07371034, -0.0518238, 2.873501, 0, 0, 0, 1, 1,
0.07692703, -0.2468622, 4.624343, 0, 0, 0, 1, 1,
0.07728368, -1.238189, 1.713929, 1, 1, 1, 1, 1,
0.08189391, -1.496602, 4.077809, 1, 1, 1, 1, 1,
0.08849579, -0.1196081, 1.871168, 1, 1, 1, 1, 1,
0.09315799, 0.9205918, 0.4728678, 1, 1, 1, 1, 1,
0.09751076, -0.052495, 2.672491, 1, 1, 1, 1, 1,
0.09754618, -1.017952, 3.203804, 1, 1, 1, 1, 1,
0.09767371, 0.4845365, -1.063446, 1, 1, 1, 1, 1,
0.1018938, 0.09208059, 1.275214, 1, 1, 1, 1, 1,
0.1025705, 1.01665, 0.004853297, 1, 1, 1, 1, 1,
0.103043, -1.333393, 3.31821, 1, 1, 1, 1, 1,
0.1039789, -0.9519275, 3.927909, 1, 1, 1, 1, 1,
0.1042027, -0.1888335, 1.7044, 1, 1, 1, 1, 1,
0.1099284, -0.3000178, 2.439425, 1, 1, 1, 1, 1,
0.1148253, 2.509221, -0.6825399, 1, 1, 1, 1, 1,
0.1170639, -0.1726019, 1.779171, 1, 1, 1, 1, 1,
0.119493, -0.2804057, 3.843671, 0, 0, 1, 1, 1,
0.119567, 1.111337, 0.7992823, 1, 0, 0, 1, 1,
0.1242725, 0.3727709, -0.6713732, 1, 0, 0, 1, 1,
0.1252192, -0.1561001, 4.367449, 1, 0, 0, 1, 1,
0.125996, -0.6600016, 4.110997, 1, 0, 0, 1, 1,
0.1275548, -0.2973549, 3.634052, 1, 0, 0, 1, 1,
0.1424731, -0.3918929, 1.339043, 0, 0, 0, 1, 1,
0.1438653, -0.4092694, 3.191015, 0, 0, 0, 1, 1,
0.1460114, 0.2492178, 2.85764, 0, 0, 0, 1, 1,
0.1513045, 0.9807484, -0.06573154, 0, 0, 0, 1, 1,
0.1551947, -0.08262908, 2.002129, 0, 0, 0, 1, 1,
0.1582461, 0.768672, 0.3167443, 0, 0, 0, 1, 1,
0.1610613, -0.2981615, 3.56648, 0, 0, 0, 1, 1,
0.162772, -0.2294519, 1.679159, 1, 1, 1, 1, 1,
0.163564, 0.0469873, 0.3161948, 1, 1, 1, 1, 1,
0.1687306, 0.4344929, -0.2783477, 1, 1, 1, 1, 1,
0.1706749, 0.4939318, -0.1861577, 1, 1, 1, 1, 1,
0.1724296, -1.481388, 2.131972, 1, 1, 1, 1, 1,
0.1724434, 1.545864, 0.0792997, 1, 1, 1, 1, 1,
0.1866706, 0.6825212, -0.2567477, 1, 1, 1, 1, 1,
0.1867498, -0.02473121, 4.291718, 1, 1, 1, 1, 1,
0.1885484, 1.142416, 1.121521, 1, 1, 1, 1, 1,
0.1939812, 0.911472, -1.180385, 1, 1, 1, 1, 1,
0.1971764, -0.9686041, 2.779548, 1, 1, 1, 1, 1,
0.1977112, 2.001475, 2.295386, 1, 1, 1, 1, 1,
0.1978019, 1.973244, -2.047529, 1, 1, 1, 1, 1,
0.1994285, -0.1861295, 1.843963, 1, 1, 1, 1, 1,
0.2122026, 0.8007475, 0.5887275, 1, 1, 1, 1, 1,
0.2137216, -0.5227991, 1.478317, 0, 0, 1, 1, 1,
0.2147025, 0.2460763, 0.443864, 1, 0, 0, 1, 1,
0.217567, 1.821076, -0.370691, 1, 0, 0, 1, 1,
0.2181994, -0.119592, 2.888482, 1, 0, 0, 1, 1,
0.2219634, 0.8259159, -1.204194, 1, 0, 0, 1, 1,
0.223618, -0.6919572, 2.158906, 1, 0, 0, 1, 1,
0.226738, -2.041301, 2.654635, 0, 0, 0, 1, 1,
0.2300422, -0.8706784, 4.268804, 0, 0, 0, 1, 1,
0.2303962, -2.591741, 3.314006, 0, 0, 0, 1, 1,
0.2336591, 0.3941452, 2.336342, 0, 0, 0, 1, 1,
0.2352696, -0.3384541, 2.984467, 0, 0, 0, 1, 1,
0.2372203, -0.3301148, 2.55481, 0, 0, 0, 1, 1,
0.2408769, 0.625491, 2.005267, 0, 0, 0, 1, 1,
0.2426304, 1.841546, -0.9463193, 1, 1, 1, 1, 1,
0.24345, 1.110026, -0.0009271935, 1, 1, 1, 1, 1,
0.2445998, -1.807516, 0.863041, 1, 1, 1, 1, 1,
0.2572224, 0.8762274, -0.9301209, 1, 1, 1, 1, 1,
0.2582009, 0.1373944, 1.215204, 1, 1, 1, 1, 1,
0.2585702, 1.733116, -0.8195084, 1, 1, 1, 1, 1,
0.260153, -0.9086518, 3.658844, 1, 1, 1, 1, 1,
0.2606925, -0.8494255, 2.701769, 1, 1, 1, 1, 1,
0.2652083, 2.538525, 0.1655376, 1, 1, 1, 1, 1,
0.2669305, 0.522947, 0.345955, 1, 1, 1, 1, 1,
0.2690417, 0.7047677, 2.613471, 1, 1, 1, 1, 1,
0.2691337, 1.940461, -1.250803, 1, 1, 1, 1, 1,
0.2756394, 0.5602889, -0.1770773, 1, 1, 1, 1, 1,
0.2793574, -0.4683203, 3.996344, 1, 1, 1, 1, 1,
0.2834782, -0.4607753, 3.074504, 1, 1, 1, 1, 1,
0.287512, 0.1554701, 1.429679, 0, 0, 1, 1, 1,
0.2912477, -0.6796378, 2.527441, 1, 0, 0, 1, 1,
0.2931477, -0.4012035, 1.873969, 1, 0, 0, 1, 1,
0.2947117, 0.6903246, 1.264697, 1, 0, 0, 1, 1,
0.301938, 0.4179889, 2.185678, 1, 0, 0, 1, 1,
0.3020756, 0.03479172, 0.7729409, 1, 0, 0, 1, 1,
0.3036918, 0.5349124, 0.6914039, 0, 0, 0, 1, 1,
0.3099081, -1.200856, 1.949741, 0, 0, 0, 1, 1,
0.3165714, 1.386639, 0.6776704, 0, 0, 0, 1, 1,
0.3170411, -1.05697, 0.1504714, 0, 0, 0, 1, 1,
0.3172975, 1.40645, -0.4858855, 0, 0, 0, 1, 1,
0.3235715, -0.5492562, 0.7077029, 0, 0, 0, 1, 1,
0.3251149, -1.077922, 2.38416, 0, 0, 0, 1, 1,
0.3257456, -0.1625318, 1.934183, 1, 1, 1, 1, 1,
0.325813, 0.1980489, 2.29746, 1, 1, 1, 1, 1,
0.3303179, -0.4312677, 2.301031, 1, 1, 1, 1, 1,
0.3399275, 0.8291604, 0.7959023, 1, 1, 1, 1, 1,
0.3399502, 0.555282, 0.150576, 1, 1, 1, 1, 1,
0.3401587, 0.5587589, -0.09401064, 1, 1, 1, 1, 1,
0.3419731, 0.3795673, 1.770633, 1, 1, 1, 1, 1,
0.3455753, 0.2075034, 1.03608, 1, 1, 1, 1, 1,
0.3501646, -0.9808164, 3.823965, 1, 1, 1, 1, 1,
0.3526262, 2.762212, -0.1990415, 1, 1, 1, 1, 1,
0.355509, 0.3532941, 1.422838, 1, 1, 1, 1, 1,
0.3568907, 0.6794803, 1.423975, 1, 1, 1, 1, 1,
0.3609729, -0.6908212, 3.551698, 1, 1, 1, 1, 1,
0.3611014, 0.395112, 0.1960726, 1, 1, 1, 1, 1,
0.3632893, -1.169883, 2.690654, 1, 1, 1, 1, 1,
0.3755448, 0.6194283, 0.7784907, 0, 0, 1, 1, 1,
0.379587, -0.1178325, 0.8491696, 1, 0, 0, 1, 1,
0.3833979, -0.9321573, 2.900479, 1, 0, 0, 1, 1,
0.3842061, -0.4625065, 0.7526656, 1, 0, 0, 1, 1,
0.3854811, -1.501763, 2.752086, 1, 0, 0, 1, 1,
0.3869312, 1.057639, 0.03588622, 1, 0, 0, 1, 1,
0.3929915, 1.350326, 1.421513, 0, 0, 0, 1, 1,
0.394926, -0.4822079, 0.9963489, 0, 0, 0, 1, 1,
0.3997256, 1.390147, 0.1855369, 0, 0, 0, 1, 1,
0.4020836, -1.201992, 3.30442, 0, 0, 0, 1, 1,
0.4083797, -0.1103121, 1.776612, 0, 0, 0, 1, 1,
0.4137345, 0.8620524, 0.2693246, 0, 0, 0, 1, 1,
0.4224377, -0.2906644, 1.360497, 0, 0, 0, 1, 1,
0.4232082, -2.117669, 5.096786, 1, 1, 1, 1, 1,
0.423885, 1.457457, 0.91523, 1, 1, 1, 1, 1,
0.4244731, 0.2711497, 0.6481559, 1, 1, 1, 1, 1,
0.4253739, -1.605229, 1.250888, 1, 1, 1, 1, 1,
0.4293912, -0.8247323, 1.538329, 1, 1, 1, 1, 1,
0.4298604, 0.2198331, 0.4006341, 1, 1, 1, 1, 1,
0.433526, 0.08830895, 0.9556981, 1, 1, 1, 1, 1,
0.4352164, 1.487237, 0.3390191, 1, 1, 1, 1, 1,
0.4362822, 0.2742664, 1.590014, 1, 1, 1, 1, 1,
0.4434805, 0.8518973, -0.2244013, 1, 1, 1, 1, 1,
0.4453691, 0.0004704488, -0.7136329, 1, 1, 1, 1, 1,
0.4487685, -0.7141834, 2.689143, 1, 1, 1, 1, 1,
0.4520554, -0.2329773, 1.504157, 1, 1, 1, 1, 1,
0.4566536, 0.3273621, -0.7867568, 1, 1, 1, 1, 1,
0.4568366, 0.4047577, 1.124177, 1, 1, 1, 1, 1,
0.46948, 0.9199478, 0.4183224, 0, 0, 1, 1, 1,
0.4705557, -0.1533341, 2.050787, 1, 0, 0, 1, 1,
0.4727974, -0.3886199, 3.536957, 1, 0, 0, 1, 1,
0.4734959, 1.362815, 1.022936, 1, 0, 0, 1, 1,
0.4750073, 0.2067468, 0.6507565, 1, 0, 0, 1, 1,
0.4800725, 0.4882039, 0.129736, 1, 0, 0, 1, 1,
0.4801769, 0.9561613, 1.846958, 0, 0, 0, 1, 1,
0.4820035, -0.3573642, -0.07701702, 0, 0, 0, 1, 1,
0.4850987, 0.486389, 1.789758, 0, 0, 0, 1, 1,
0.4875864, -0.2841994, 2.475378, 0, 0, 0, 1, 1,
0.4881536, 0.007585971, 2.325662, 0, 0, 0, 1, 1,
0.4884885, 0.1094745, 1.705761, 0, 0, 0, 1, 1,
0.4893751, -0.9352486, 3.367903, 0, 0, 0, 1, 1,
0.4946565, -0.7538917, 1.194046, 1, 1, 1, 1, 1,
0.5011409, -0.4533007, 1.854215, 1, 1, 1, 1, 1,
0.5016281, 0.9429242, -0.9544511, 1, 1, 1, 1, 1,
0.5016413, 1.924798, -0.9377747, 1, 1, 1, 1, 1,
0.5036395, 0.9783682, -0.5404964, 1, 1, 1, 1, 1,
0.510889, 0.08795204, 3.169625, 1, 1, 1, 1, 1,
0.5124536, 0.6396931, 1.857835, 1, 1, 1, 1, 1,
0.5129319, 0.5558496, 2.41724, 1, 1, 1, 1, 1,
0.513011, 0.4603778, 1.989533, 1, 1, 1, 1, 1,
0.5139972, -0.2371125, 1.879953, 1, 1, 1, 1, 1,
0.5144735, -0.2622887, 2.646208, 1, 1, 1, 1, 1,
0.5173988, -0.1670176, 1.098779, 1, 1, 1, 1, 1,
0.5204704, 0.7542921, 0.9346446, 1, 1, 1, 1, 1,
0.5220703, 0.2326933, 3.11567, 1, 1, 1, 1, 1,
0.5221336, -0.3116692, 1.626895, 1, 1, 1, 1, 1,
0.5271799, 0.7598801, 1.59168, 0, 0, 1, 1, 1,
0.529807, -0.4132774, 4.392665, 1, 0, 0, 1, 1,
0.5315228, -0.7432703, 0.7480689, 1, 0, 0, 1, 1,
0.5408812, 0.350325, 1.656759, 1, 0, 0, 1, 1,
0.5448687, -0.2742354, 1.557503, 1, 0, 0, 1, 1,
0.5510598, -0.001017171, 1.496268, 1, 0, 0, 1, 1,
0.5512774, -0.06806337, 1.732462, 0, 0, 0, 1, 1,
0.5513344, 0.07515088, 0.7401488, 0, 0, 0, 1, 1,
0.5541974, 2.101248, 0.3278671, 0, 0, 0, 1, 1,
0.5563329, 1.737186, -0.6242225, 0, 0, 0, 1, 1,
0.5575199, 1.405336, -0.1482738, 0, 0, 0, 1, 1,
0.563685, -0.05993691, 2.345501, 0, 0, 0, 1, 1,
0.5673822, 1.672946, 1.022034, 0, 0, 0, 1, 1,
0.5740486, 0.4467164, 0.4517901, 1, 1, 1, 1, 1,
0.5772615, 0.191419, 0.4967785, 1, 1, 1, 1, 1,
0.5794258, 0.6237739, 1.351735, 1, 1, 1, 1, 1,
0.5846034, -1.457327, 1.986978, 1, 1, 1, 1, 1,
0.5872875, -1.233194, 3.328944, 1, 1, 1, 1, 1,
0.5920257, 0.9426433, 0.3400523, 1, 1, 1, 1, 1,
0.5922051, 0.6538101, -0.05978066, 1, 1, 1, 1, 1,
0.594981, 1.833891, -0.5136917, 1, 1, 1, 1, 1,
0.6009236, 1.171764, -0.4512542, 1, 1, 1, 1, 1,
0.6036466, -0.4151334, 2.084203, 1, 1, 1, 1, 1,
0.6060116, -0.01880217, 0.7548188, 1, 1, 1, 1, 1,
0.6060433, 0.8293493, 1.312879, 1, 1, 1, 1, 1,
0.6077651, -1.602595, 2.184664, 1, 1, 1, 1, 1,
0.6129401, 0.3845054, 0.9765265, 1, 1, 1, 1, 1,
0.6160766, 0.5268329, 2.694037, 1, 1, 1, 1, 1,
0.6171309, 0.04076196, 2.917462, 0, 0, 1, 1, 1,
0.6179438, 0.2058157, 2.982876, 1, 0, 0, 1, 1,
0.6179661, 1.512705, -0.2306338, 1, 0, 0, 1, 1,
0.6199222, 0.8702505, 0.6219487, 1, 0, 0, 1, 1,
0.6259194, -0.4838884, 2.211154, 1, 0, 0, 1, 1,
0.6303256, -1.705163, 2.492836, 1, 0, 0, 1, 1,
0.6366127, -0.4595986, 2.726279, 0, 0, 0, 1, 1,
0.641351, 1.315066, 1.459377, 0, 0, 0, 1, 1,
0.6421555, -0.6433801, 1.821863, 0, 0, 0, 1, 1,
0.6455436, 0.4541262, -0.3063615, 0, 0, 0, 1, 1,
0.6458931, -0.8550746, 1.50323, 0, 0, 0, 1, 1,
0.6463811, -0.2543699, 3.239624, 0, 0, 0, 1, 1,
0.6491602, -0.6384764, 2.773223, 0, 0, 0, 1, 1,
0.6491655, 0.2522562, 0.351043, 1, 1, 1, 1, 1,
0.6532568, -0.5829176, 1.660383, 1, 1, 1, 1, 1,
0.6708059, -0.4954913, 3.371011, 1, 1, 1, 1, 1,
0.673384, -0.213071, 2.609389, 1, 1, 1, 1, 1,
0.6737, 0.5679675, 0.2693047, 1, 1, 1, 1, 1,
0.6816966, 0.4474415, 2.576096, 1, 1, 1, 1, 1,
0.6826585, -2.091372, 2.089552, 1, 1, 1, 1, 1,
0.6844901, -0.5814058, 0.228332, 1, 1, 1, 1, 1,
0.6859372, 0.1887882, 0.3704013, 1, 1, 1, 1, 1,
0.6919028, -0.02550817, 2.131788, 1, 1, 1, 1, 1,
0.6991761, -1.637831, 2.892826, 1, 1, 1, 1, 1,
0.6996756, 0.8822789, 0.9598206, 1, 1, 1, 1, 1,
0.6997226, 0.2608759, 1.093413, 1, 1, 1, 1, 1,
0.7000648, 0.9396942, 2.677607, 1, 1, 1, 1, 1,
0.70285, -0.1444692, 0.1548404, 1, 1, 1, 1, 1,
0.7056249, 0.3084255, 1.168643, 0, 0, 1, 1, 1,
0.7113074, 0.7818944, 3.500949, 1, 0, 0, 1, 1,
0.7190616, 0.1864005, 0.4910995, 1, 0, 0, 1, 1,
0.7200802, -1.115694, 0.5622836, 1, 0, 0, 1, 1,
0.7215375, 1.141523, -0.2386438, 1, 0, 0, 1, 1,
0.7220064, -0.9930484, 2.905734, 1, 0, 0, 1, 1,
0.7252818, 1.315762, -1.046859, 0, 0, 0, 1, 1,
0.730145, 1.23031, -0.1994268, 0, 0, 0, 1, 1,
0.7302933, -1.406047, 2.859625, 0, 0, 0, 1, 1,
0.7304747, -0.8273963, 3.991467, 0, 0, 0, 1, 1,
0.7306007, 0.8218004, -0.5916643, 0, 0, 0, 1, 1,
0.7311823, 0.3487421, 1.982884, 0, 0, 0, 1, 1,
0.7338108, 0.09326042, 0.417817, 0, 0, 0, 1, 1,
0.7437439, 0.1131701, 1.253065, 1, 1, 1, 1, 1,
0.744572, 1.542728, 2.1763, 1, 1, 1, 1, 1,
0.7451591, -0.5509328, 1.221422, 1, 1, 1, 1, 1,
0.7455487, -0.5825434, 1.846626, 1, 1, 1, 1, 1,
0.7471514, -0.361957, 1.057554, 1, 1, 1, 1, 1,
0.7516988, -1.229974, 1.518979, 1, 1, 1, 1, 1,
0.7522867, -0.4139789, 3.355346, 1, 1, 1, 1, 1,
0.7528217, -0.3482481, 1.691344, 1, 1, 1, 1, 1,
0.7562691, -1.821916, 2.496338, 1, 1, 1, 1, 1,
0.7571396, 2.719625, 1.953814, 1, 1, 1, 1, 1,
0.759109, -0.02469337, 2.041006, 1, 1, 1, 1, 1,
0.7612773, 0.8511524, 0.7448479, 1, 1, 1, 1, 1,
0.7646694, -0.668085, 1.834502, 1, 1, 1, 1, 1,
0.7648725, -1.054368, 4.223419, 1, 1, 1, 1, 1,
0.7670548, 2.097657, -0.2721053, 1, 1, 1, 1, 1,
0.7718869, 0.2540164, 0.06860042, 0, 0, 1, 1, 1,
0.7737754, -0.5890019, 2.660213, 1, 0, 0, 1, 1,
0.7743762, 0.7628209, 1.59883, 1, 0, 0, 1, 1,
0.7747974, -1.236399, 3.028386, 1, 0, 0, 1, 1,
0.7865259, 1.082531, -0.7007619, 1, 0, 0, 1, 1,
0.7920324, -0.5096635, 2.818138, 1, 0, 0, 1, 1,
0.7927471, 1.656718, -0.4312962, 0, 0, 0, 1, 1,
0.7986582, 0.6915509, 0.8551155, 0, 0, 0, 1, 1,
0.8026302, -1.076624, 3.397004, 0, 0, 0, 1, 1,
0.8030338, -0.1110763, 1.345158, 0, 0, 0, 1, 1,
0.8044637, 0.2868596, 0.9269621, 0, 0, 0, 1, 1,
0.8056108, -0.6187676, 4.334771, 0, 0, 0, 1, 1,
0.8095815, -0.08856676, 2.724382, 0, 0, 0, 1, 1,
0.8120797, 0.7122761, 0.9866033, 1, 1, 1, 1, 1,
0.8144569, 1.259824, -0.4808245, 1, 1, 1, 1, 1,
0.8189914, -1.149702, 2.914126, 1, 1, 1, 1, 1,
0.8192217, -0.5255209, 2.423501, 1, 1, 1, 1, 1,
0.8225023, 0.6471946, -0.0127082, 1, 1, 1, 1, 1,
0.8355618, 1.103374, 0.2213004, 1, 1, 1, 1, 1,
0.8365012, 0.9279682, -0.5206861, 1, 1, 1, 1, 1,
0.8369423, 1.171515, 0.6391984, 1, 1, 1, 1, 1,
0.837566, 0.4169297, 1.398172, 1, 1, 1, 1, 1,
0.842519, -1.414046, 3.009324, 1, 1, 1, 1, 1,
0.8468293, 0.2884077, 0.1283361, 1, 1, 1, 1, 1,
0.84777, 1.000769, 0.1224874, 1, 1, 1, 1, 1,
0.8495654, -0.3731038, -0.4898788, 1, 1, 1, 1, 1,
0.8512057, 1.590216, -0.2124467, 1, 1, 1, 1, 1,
0.8512755, 0.02500139, 2.8858, 1, 1, 1, 1, 1,
0.8553291, -0.1002862, 2.581897, 0, 0, 1, 1, 1,
0.8572954, 0.6608835, 0.3006634, 1, 0, 0, 1, 1,
0.8592787, 0.4527549, 3.441115, 1, 0, 0, 1, 1,
0.8615939, 0.3955794, 0.09426595, 1, 0, 0, 1, 1,
0.8619986, 0.1563926, 2.073432, 1, 0, 0, 1, 1,
0.8667198, -2.278796, 1.384844, 1, 0, 0, 1, 1,
0.8735157, -0.6745051, 0.1025296, 0, 0, 0, 1, 1,
0.8753772, -0.5510576, 0.2449405, 0, 0, 0, 1, 1,
0.8765861, 0.6242453, 1.222657, 0, 0, 0, 1, 1,
0.8837317, 0.5586002, 0.2707998, 0, 0, 0, 1, 1,
0.8854637, -0.4083525, 0.6679673, 0, 0, 0, 1, 1,
0.8935128, 1.095017, -1.072611, 0, 0, 0, 1, 1,
0.9031594, -1.231247, 1.862811, 0, 0, 0, 1, 1,
0.9055267, -0.5107148, 1.862691, 1, 1, 1, 1, 1,
0.9070044, 0.2351153, 0.8185784, 1, 1, 1, 1, 1,
0.9088706, -0.5953667, 2.043046, 1, 1, 1, 1, 1,
0.9136046, -0.2355671, 2.58672, 1, 1, 1, 1, 1,
0.9147767, -1.802808, 1.345619, 1, 1, 1, 1, 1,
0.9246641, 0.1825977, 1.019169, 1, 1, 1, 1, 1,
0.9364046, -0.002850183, 1.285825, 1, 1, 1, 1, 1,
0.9483766, 1.268838, 0.6671422, 1, 1, 1, 1, 1,
0.9531314, -0.4217442, 1.671818, 1, 1, 1, 1, 1,
0.9564773, 0.2924552, 1.674539, 1, 1, 1, 1, 1,
0.9582414, -0.3918873, 2.384245, 1, 1, 1, 1, 1,
0.9585301, 0.141302, 2.476183, 1, 1, 1, 1, 1,
0.9611408, 0.1343959, 0.4581003, 1, 1, 1, 1, 1,
0.967551, -1.479357, 1.987773, 1, 1, 1, 1, 1,
0.9689741, 0.6033326, 1.274951, 1, 1, 1, 1, 1,
0.9698802, -0.6681283, 2.630049, 0, 0, 1, 1, 1,
0.9814952, -1.624329, 1.59789, 1, 0, 0, 1, 1,
0.9815342, 0.4215975, 3.037882, 1, 0, 0, 1, 1,
0.9875799, -0.5441626, 1.121948, 1, 0, 0, 1, 1,
0.9876106, -2.041305, 2.490215, 1, 0, 0, 1, 1,
0.9954514, 0.0753655, 2.134836, 1, 0, 0, 1, 1,
0.9984019, -1.482715, 1.002046, 0, 0, 0, 1, 1,
1.000526, 0.8329155, 1.136503, 0, 0, 0, 1, 1,
1.007711, 0.8982531, 0.6094926, 0, 0, 0, 1, 1,
1.013304, 0.314803, -0.7579316, 0, 0, 0, 1, 1,
1.014639, -0.4227651, 3.66725, 0, 0, 0, 1, 1,
1.016015, 0.5717555, 2.240442, 0, 0, 0, 1, 1,
1.023574, -0.0864912, 3.012062, 0, 0, 0, 1, 1,
1.02603, 0.6342568, -1.153749, 1, 1, 1, 1, 1,
1.040924, -1.640451, 2.230995, 1, 1, 1, 1, 1,
1.04106, -0.5040893, 3.853975, 1, 1, 1, 1, 1,
1.045033, -1.432203, 1.952047, 1, 1, 1, 1, 1,
1.04525, 0.2209946, 1.96718, 1, 1, 1, 1, 1,
1.053308, -0.7500492, 1.809502, 1, 1, 1, 1, 1,
1.060796, 1.474874, 0.570379, 1, 1, 1, 1, 1,
1.068309, 0.02659623, 1.420691, 1, 1, 1, 1, 1,
1.069868, 1.936844, -0.9444535, 1, 1, 1, 1, 1,
1.071742, -0.5405945, 2.268775, 1, 1, 1, 1, 1,
1.07348, -1.509997, 3.049703, 1, 1, 1, 1, 1,
1.073983, 0.1359752, 0.5453565, 1, 1, 1, 1, 1,
1.078431, 0.346528, -0.2965054, 1, 1, 1, 1, 1,
1.087026, -1.214183, 3.449192, 1, 1, 1, 1, 1,
1.087915, 0.3436617, 0.589261, 1, 1, 1, 1, 1,
1.095757, 0.1845604, 1.329597, 0, 0, 1, 1, 1,
1.100874, -0.08549765, -0.04579147, 1, 0, 0, 1, 1,
1.103122, 0.5743319, 0.3280531, 1, 0, 0, 1, 1,
1.108028, 1.766458, 0.7730704, 1, 0, 0, 1, 1,
1.108409, 0.9660109, 0.7064158, 1, 0, 0, 1, 1,
1.109122, -0.4029849, 1.737174, 1, 0, 0, 1, 1,
1.10962, -1.601366, 1.861754, 0, 0, 0, 1, 1,
1.114606, -1.955791, 3.406412, 0, 0, 0, 1, 1,
1.11596, 0.0506152, 2.429924, 0, 0, 0, 1, 1,
1.134133, -1.11689, 3.292829, 0, 0, 0, 1, 1,
1.13466, 0.2622185, 1.563946, 0, 0, 0, 1, 1,
1.142198, 0.003537473, 2.099405, 0, 0, 0, 1, 1,
1.145137, -0.5765768, 1.867357, 0, 0, 0, 1, 1,
1.146246, 0.399567, 1.136791, 1, 1, 1, 1, 1,
1.147126, 1.488597, 2.523389, 1, 1, 1, 1, 1,
1.149235, -1.550817, 2.554134, 1, 1, 1, 1, 1,
1.154019, -2.379607, 3.463669, 1, 1, 1, 1, 1,
1.155287, 0.1009766, 3.156156, 1, 1, 1, 1, 1,
1.156094, 1.777263, -0.6336336, 1, 1, 1, 1, 1,
1.168339, -0.2555614, 2.724313, 1, 1, 1, 1, 1,
1.172085, -1.147345, 2.69867, 1, 1, 1, 1, 1,
1.176305, -0.1335336, 2.304556, 1, 1, 1, 1, 1,
1.181816, -0.1738467, -0.07408006, 1, 1, 1, 1, 1,
1.183797, -0.8920795, 2.810279, 1, 1, 1, 1, 1,
1.209818, -0.5856602, 2.114295, 1, 1, 1, 1, 1,
1.210482, 1.129616, 1.716877, 1, 1, 1, 1, 1,
1.216724, 2.159763, 1.121675, 1, 1, 1, 1, 1,
1.217785, 1.723818, -0.2550565, 1, 1, 1, 1, 1,
1.218846, 0.2416718, 1.758953, 0, 0, 1, 1, 1,
1.244139, 1.690515, 2.114342, 1, 0, 0, 1, 1,
1.250388, 0.6508515, 1.92874, 1, 0, 0, 1, 1,
1.255455, -0.8329781, 3.360199, 1, 0, 0, 1, 1,
1.266786, 0.9507853, -1.208607, 1, 0, 0, 1, 1,
1.267094, -0.1571876, 2.940041, 1, 0, 0, 1, 1,
1.273167, -0.7968854, 1.80456, 0, 0, 0, 1, 1,
1.277418, -1.19082, 3.912103, 0, 0, 0, 1, 1,
1.279392, -1.014466, 2.830541, 0, 0, 0, 1, 1,
1.284309, -0.716611, 1.25121, 0, 0, 0, 1, 1,
1.287612, -0.4120943, 3.091059, 0, 0, 0, 1, 1,
1.290741, 0.07535244, 2.402392, 0, 0, 0, 1, 1,
1.293734, -0.9951954, 3.642812, 0, 0, 0, 1, 1,
1.321208, -0.7505829, 2.976197, 1, 1, 1, 1, 1,
1.332122, 2.548359, 1.284061, 1, 1, 1, 1, 1,
1.358663, -0.9961424, 2.274016, 1, 1, 1, 1, 1,
1.36412, -0.4983315, 2.854804, 1, 1, 1, 1, 1,
1.372667, 0.1510908, 3.575245, 1, 1, 1, 1, 1,
1.377418, 1.854625, 1.155275, 1, 1, 1, 1, 1,
1.379524, 1.328143, 1.311684, 1, 1, 1, 1, 1,
1.383576, -1.795651, 0.6893374, 1, 1, 1, 1, 1,
1.389983, -0.5315102, 3.279714, 1, 1, 1, 1, 1,
1.391639, 0.314762, -0.3835636, 1, 1, 1, 1, 1,
1.398449, 0.4082387, 0.5823875, 1, 1, 1, 1, 1,
1.404262, -0.07258052, 1.298198, 1, 1, 1, 1, 1,
1.407902, -0.6983901, 1.482713, 1, 1, 1, 1, 1,
1.413971, 0.6518034, 0.199967, 1, 1, 1, 1, 1,
1.42812, -0.3316096, 1.549803, 1, 1, 1, 1, 1,
1.430005, 0.4579904, -0.05396452, 0, 0, 1, 1, 1,
1.43003, -0.01028159, 1.42474, 1, 0, 0, 1, 1,
1.441834, 0.4170702, -0.6563056, 1, 0, 0, 1, 1,
1.450059, -0.6408566, 0.212892, 1, 0, 0, 1, 1,
1.462616, 1.055398, 1.534151, 1, 0, 0, 1, 1,
1.465983, -0.3593047, 2.946724, 1, 0, 0, 1, 1,
1.467532, 0.4677111, 2.705115, 0, 0, 0, 1, 1,
1.479017, 0.005850867, 0.7278594, 0, 0, 0, 1, 1,
1.487023, -0.8363189, 1.896493, 0, 0, 0, 1, 1,
1.506637, -1.684526, 0.04768817, 0, 0, 0, 1, 1,
1.51621, -0.03498729, 1.403633, 0, 0, 0, 1, 1,
1.517378, -0.6757786, 0.7362883, 0, 0, 0, 1, 1,
1.519155, -1.641647, 2.165971, 0, 0, 0, 1, 1,
1.519401, 1.307233, 2.257044, 1, 1, 1, 1, 1,
1.552303, 0.7851026, 0.7068098, 1, 1, 1, 1, 1,
1.560367, 0.6157081, 1.964141, 1, 1, 1, 1, 1,
1.579305, -0.9626302, 3.378348, 1, 1, 1, 1, 1,
1.58636, 0.4719247, -0.3909099, 1, 1, 1, 1, 1,
1.588158, 0.1246812, 1.949412, 1, 1, 1, 1, 1,
1.589428, 0.8674062, 1.024624, 1, 1, 1, 1, 1,
1.590294, 0.5736287, 1.282862, 1, 1, 1, 1, 1,
1.594897, 1.30002, 1.551492, 1, 1, 1, 1, 1,
1.613777, -0.3591855, 1.253935, 1, 1, 1, 1, 1,
1.625429, -1.502123, 2.726179, 1, 1, 1, 1, 1,
1.631167, 1.442289, 0.03717554, 1, 1, 1, 1, 1,
1.652209, 1.062646, 1.193147, 1, 1, 1, 1, 1,
1.664133, 0.6452763, 2.79936, 1, 1, 1, 1, 1,
1.665632, -0.2841835, 2.03002, 1, 1, 1, 1, 1,
1.692518, -1.210272, 0.9991031, 0, 0, 1, 1, 1,
1.712505, 1.37133, 0.2130797, 1, 0, 0, 1, 1,
1.715305, -0.2816282, 0.3728345, 1, 0, 0, 1, 1,
1.731873, 0.2435501, 1.882598, 1, 0, 0, 1, 1,
1.735559, -0.527383, 1.954741, 1, 0, 0, 1, 1,
1.739148, -0.2247451, 2.165063, 1, 0, 0, 1, 1,
1.752031, -0.352303, 2.178056, 0, 0, 0, 1, 1,
1.76972, 2.292642, 0.7733126, 0, 0, 0, 1, 1,
1.769861, -0.2179501, 1.194427, 0, 0, 0, 1, 1,
1.774425, 0.1065617, 2.288849, 0, 0, 0, 1, 1,
1.796414, -0.8738012, 2.293006, 0, 0, 0, 1, 1,
1.80359, -0.7199724, 1.482069, 0, 0, 0, 1, 1,
1.810308, 0.8922235, 1.060611, 0, 0, 0, 1, 1,
1.8138, 0.7917915, -0.3653451, 1, 1, 1, 1, 1,
1.819261, -0.2098981, 1.433932, 1, 1, 1, 1, 1,
1.848193, -0.7591722, 2.244587, 1, 1, 1, 1, 1,
1.868551, -0.4013572, 2.495146, 1, 1, 1, 1, 1,
1.928822, 0.2101342, 2.669949, 1, 1, 1, 1, 1,
1.930613, -0.7387643, 0.6629581, 1, 1, 1, 1, 1,
1.930889, 1.664637, 0.6025318, 1, 1, 1, 1, 1,
1.949045, -0.6515086, 1.299309, 1, 1, 1, 1, 1,
1.953541, 1.606961, 2.026188, 1, 1, 1, 1, 1,
1.970719, -1.29388, 3.807168, 1, 1, 1, 1, 1,
1.983143, -0.6569908, 4.017932, 1, 1, 1, 1, 1,
1.985044, -0.3150544, 2.940169, 1, 1, 1, 1, 1,
2.026384, -0.5875506, -0.1017765, 1, 1, 1, 1, 1,
2.044368, -0.6116658, 0.3111233, 1, 1, 1, 1, 1,
2.059899, -0.07056518, 1.684258, 1, 1, 1, 1, 1,
2.086566, 0.758487, 0.4902849, 0, 0, 1, 1, 1,
2.125846, 1.047001, 0.04700792, 1, 0, 0, 1, 1,
2.166736, -2.196291, 2.31165, 1, 0, 0, 1, 1,
2.176464, -0.5466796, 2.164311, 1, 0, 0, 1, 1,
2.26112, -0.5412279, 1.805767, 1, 0, 0, 1, 1,
2.270438, -1.003579, 2.039959, 1, 0, 0, 1, 1,
2.33375, 1.29897, 0.7794658, 0, 0, 0, 1, 1,
2.355551, -0.2585593, 1.954981, 0, 0, 0, 1, 1,
2.36963, 0.3442089, -0.1302387, 0, 0, 0, 1, 1,
2.370872, -0.07653839, 2.021354, 0, 0, 0, 1, 1,
2.436798, -0.2683115, -0.1170733, 0, 0, 0, 1, 1,
2.442264, -0.711172, 1.92275, 0, 0, 0, 1, 1,
2.456014, -0.6274471, 1.451174, 0, 0, 0, 1, 1,
2.565089, -0.7380745, 0.2860177, 1, 1, 1, 1, 1,
2.664778, -0.2719364, 1.024958, 1, 1, 1, 1, 1,
2.709364, 1.052399, 2.733652, 1, 1, 1, 1, 1,
2.719788, -0.03854704, 0.02998892, 1, 1, 1, 1, 1,
2.723492, 0.2044218, 0.8447332, 1, 1, 1, 1, 1,
2.830692, -1.391692, 2.101443, 1, 1, 1, 1, 1,
2.999593, -1.347044, -0.5005234, 1, 1, 1, 1, 1
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
var radius = 9.018844;
var distance = 31.67831;
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
mvMatrix.translate( -0.0897311, 0.2173561, -0.2674007 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.67831);
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
