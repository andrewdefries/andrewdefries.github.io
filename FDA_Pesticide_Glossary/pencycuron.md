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
-3.264091, -0.4384297, -0.9145487, 1, 0, 0, 1,
-3.049875, 0.217666, -1.541024, 1, 0.007843138, 0, 1,
-2.846633, 0.4848546, -0.9288819, 1, 0.01176471, 0, 1,
-2.679137, 0.4874786, -1.01938, 1, 0.01960784, 0, 1,
-2.630774, 0.9995423, 0.2686091, 1, 0.02352941, 0, 1,
-2.555492, 0.5279337, -2.040296, 1, 0.03137255, 0, 1,
-2.551107, 0.2005433, -3.322944, 1, 0.03529412, 0, 1,
-2.527011, -0.8993899, -1.865707, 1, 0.04313726, 0, 1,
-2.489512, -1.597601, -2.811145, 1, 0.04705882, 0, 1,
-2.364951, -0.5485451, -1.792351, 1, 0.05490196, 0, 1,
-2.361302, 0.01490483, -3.082738, 1, 0.05882353, 0, 1,
-2.297524, 1.27923, 0.02835082, 1, 0.06666667, 0, 1,
-2.259237, -0.6386839, -4.387905, 1, 0.07058824, 0, 1,
-2.19938, -0.3930565, -0.9798927, 1, 0.07843138, 0, 1,
-2.149661, -3.890661, -1.28657, 1, 0.08235294, 0, 1,
-2.121801, -0.1069835, -2.239972, 1, 0.09019608, 0, 1,
-2.090804, -1.110008, -0.5578524, 1, 0.09411765, 0, 1,
-2.086698, -0.09328846, -1.487331, 1, 0.1019608, 0, 1,
-2.054767, 0.06910092, -2.27093, 1, 0.1098039, 0, 1,
-2.0541, -2.025593, -2.669424, 1, 0.1137255, 0, 1,
-1.98715, -0.8999372, -0.4875469, 1, 0.1215686, 0, 1,
-1.961105, 0.5428189, -1.4461, 1, 0.1254902, 0, 1,
-1.929161, 0.8797533, 0.3175618, 1, 0.1333333, 0, 1,
-1.92342, -0.1909403, -1.537336, 1, 0.1372549, 0, 1,
-1.899206, -0.6834645, -2.401064, 1, 0.145098, 0, 1,
-1.874586, 0.5362878, -0.6782211, 1, 0.1490196, 0, 1,
-1.865047, -1.169155, -2.696607, 1, 0.1568628, 0, 1,
-1.863816, -0.3902352, -2.895475, 1, 0.1607843, 0, 1,
-1.827269, -0.4390441, -3.169983, 1, 0.1686275, 0, 1,
-1.822447, -0.8714001, -1.32307, 1, 0.172549, 0, 1,
-1.79432, -1.07614, -1.6179, 1, 0.1803922, 0, 1,
-1.79117, -0.02395972, -0.3546796, 1, 0.1843137, 0, 1,
-1.78571, -0.415749, -1.099395, 1, 0.1921569, 0, 1,
-1.784196, 0.02147714, -0.7525781, 1, 0.1960784, 0, 1,
-1.777697, -0.7154725, -3.473085, 1, 0.2039216, 0, 1,
-1.766203, -0.5219602, -0.6605551, 1, 0.2117647, 0, 1,
-1.758995, 0.647945, -1.477465, 1, 0.2156863, 0, 1,
-1.755947, -1.165239, -2.858472, 1, 0.2235294, 0, 1,
-1.729443, 1.086457, 0.1085361, 1, 0.227451, 0, 1,
-1.722393, -1.392703, -3.000084, 1, 0.2352941, 0, 1,
-1.72037, 1.140436, -1.519357, 1, 0.2392157, 0, 1,
-1.70989, -0.2436887, -1.125728, 1, 0.2470588, 0, 1,
-1.708994, -0.04116532, -0.8550595, 1, 0.2509804, 0, 1,
-1.705567, -0.6553722, -1.585926, 1, 0.2588235, 0, 1,
-1.684243, -0.3426118, -0.3641921, 1, 0.2627451, 0, 1,
-1.682418, -0.1810826, -0.1401263, 1, 0.2705882, 0, 1,
-1.677921, -1.331792, -1.503375, 1, 0.2745098, 0, 1,
-1.674358, 1.091083, -1.213447, 1, 0.282353, 0, 1,
-1.667772, 0.244387, -1.099686, 1, 0.2862745, 0, 1,
-1.644787, -1.167234, -3.566577, 1, 0.2941177, 0, 1,
-1.616552, -1.794379, -2.562486, 1, 0.3019608, 0, 1,
-1.60807, -0.8071858, -1.486874, 1, 0.3058824, 0, 1,
-1.602666, 0.5467585, -0.8654427, 1, 0.3137255, 0, 1,
-1.590193, 0.4672369, -0.2585445, 1, 0.3176471, 0, 1,
-1.569045, -0.5124927, -3.409672, 1, 0.3254902, 0, 1,
-1.557753, -1.101909, -1.239438, 1, 0.3294118, 0, 1,
-1.533417, -1.597229, -1.55354, 1, 0.3372549, 0, 1,
-1.532269, -0.001703273, -2.304773, 1, 0.3411765, 0, 1,
-1.525269, -1.229838, -1.418289, 1, 0.3490196, 0, 1,
-1.516629, -1.101465, -3.067936, 1, 0.3529412, 0, 1,
-1.507942, 0.2118119, -1.223148, 1, 0.3607843, 0, 1,
-1.501285, -0.3682967, -4.347307, 1, 0.3647059, 0, 1,
-1.480943, -0.8926408, -0.6041382, 1, 0.372549, 0, 1,
-1.478319, -0.7927513, -2.803383, 1, 0.3764706, 0, 1,
-1.473345, 1.132262, -2.140462, 1, 0.3843137, 0, 1,
-1.467628, 0.2360083, 0.1470335, 1, 0.3882353, 0, 1,
-1.464144, -0.9130194, -0.2862166, 1, 0.3960784, 0, 1,
-1.463778, -0.2817305, -0.04815869, 1, 0.4039216, 0, 1,
-1.458242, 1.725582, -0.4558201, 1, 0.4078431, 0, 1,
-1.45552, 0.4301239, -0.7215085, 1, 0.4156863, 0, 1,
-1.433129, 0.5179258, -1.796377, 1, 0.4196078, 0, 1,
-1.429241, -0.1247821, -1.526912, 1, 0.427451, 0, 1,
-1.426556, 0.7477645, -1.406696, 1, 0.4313726, 0, 1,
-1.422618, -0.7753997, -2.320513, 1, 0.4392157, 0, 1,
-1.402802, 0.4244789, 0.14754, 1, 0.4431373, 0, 1,
-1.401906, -0.6796572, -1.791473, 1, 0.4509804, 0, 1,
-1.400073, 0.6309412, -0.2560746, 1, 0.454902, 0, 1,
-1.399633, 1.300931, -0.05602924, 1, 0.4627451, 0, 1,
-1.382781, 0.5147906, -0.7231549, 1, 0.4666667, 0, 1,
-1.380311, -0.8174738, -3.13241, 1, 0.4745098, 0, 1,
-1.373503, 1.543126, -0.06315508, 1, 0.4784314, 0, 1,
-1.368403, -1.391538, -1.556037, 1, 0.4862745, 0, 1,
-1.355739, 1.833786, 0.3774779, 1, 0.4901961, 0, 1,
-1.347913, 1.677791, -1.049472, 1, 0.4980392, 0, 1,
-1.345301, -1.496319, -1.748071, 1, 0.5058824, 0, 1,
-1.342724, 1.355576, -0.8424367, 1, 0.509804, 0, 1,
-1.331258, -0.671129, -0.9132986, 1, 0.5176471, 0, 1,
-1.318283, 0.2419083, 0.2863023, 1, 0.5215687, 0, 1,
-1.308683, 0.3600016, -0.3903786, 1, 0.5294118, 0, 1,
-1.3041, 0.9766987, -0.4813128, 1, 0.5333334, 0, 1,
-1.294738, 0.6273841, -0.1367452, 1, 0.5411765, 0, 1,
-1.293405, 0.6254061, 0.03130237, 1, 0.5450981, 0, 1,
-1.291247, -2.178261, -3.377342, 1, 0.5529412, 0, 1,
-1.288606, -0.425924, -2.103297, 1, 0.5568628, 0, 1,
-1.281691, -1.38747, -2.021601, 1, 0.5647059, 0, 1,
-1.279825, -0.6829216, -3.463109, 1, 0.5686275, 0, 1,
-1.275362, 0.92954, 0.9432266, 1, 0.5764706, 0, 1,
-1.274327, -1.455714, -4.6982, 1, 0.5803922, 0, 1,
-1.265259, 0.86019, -1.084219, 1, 0.5882353, 0, 1,
-1.26482, -1.372907, -2.217769, 1, 0.5921569, 0, 1,
-1.258915, 0.152884, -1.310358, 1, 0.6, 0, 1,
-1.249602, 0.4790282, -2.193881, 1, 0.6078432, 0, 1,
-1.240197, 0.5456851, -0.7469, 1, 0.6117647, 0, 1,
-1.234546, -0.3375484, -1.657025, 1, 0.6196079, 0, 1,
-1.231224, -0.01414726, -2.682754, 1, 0.6235294, 0, 1,
-1.224726, -1.60911, -3.510772, 1, 0.6313726, 0, 1,
-1.222305, 0.6198829, 0.4416747, 1, 0.6352941, 0, 1,
-1.218788, 2.246496, -0.00930667, 1, 0.6431373, 0, 1,
-1.21503, -0.2525724, -1.820371, 1, 0.6470588, 0, 1,
-1.206875, 0.1180582, -0.2128303, 1, 0.654902, 0, 1,
-1.206626, 1.703742, 0.47605, 1, 0.6588235, 0, 1,
-1.203549, 0.5104234, -2.33318, 1, 0.6666667, 0, 1,
-1.198807, 1.160623, 0.7672231, 1, 0.6705883, 0, 1,
-1.197848, 1.324282, -2.943936, 1, 0.6784314, 0, 1,
-1.195931, -3.155764, -4.543077, 1, 0.682353, 0, 1,
-1.194411, 1.448794, -0.6780566, 1, 0.6901961, 0, 1,
-1.193172, -0.03310248, -1.442712, 1, 0.6941177, 0, 1,
-1.191156, 0.1691945, -2.007909, 1, 0.7019608, 0, 1,
-1.186975, 0.2883392, -1.369935, 1, 0.7098039, 0, 1,
-1.184422, -0.4260966, -0.866126, 1, 0.7137255, 0, 1,
-1.173301, 0.6948811, -0.2110899, 1, 0.7215686, 0, 1,
-1.150763, -1.290901, -2.737397, 1, 0.7254902, 0, 1,
-1.149527, -0.01062176, -0.3210509, 1, 0.7333333, 0, 1,
-1.145813, -0.5769874, -0.412357, 1, 0.7372549, 0, 1,
-1.145253, 0.4719126, -2.39738, 1, 0.7450981, 0, 1,
-1.141486, 0.5321993, -1.491403, 1, 0.7490196, 0, 1,
-1.13957, 2.047745, 1.15189, 1, 0.7568628, 0, 1,
-1.131343, -1.268618, -3.346335, 1, 0.7607843, 0, 1,
-1.122407, -0.0615503, -1.165233, 1, 0.7686275, 0, 1,
-1.113569, 1.031624, -1.312232, 1, 0.772549, 0, 1,
-1.110433, 1.939409, 0.1098082, 1, 0.7803922, 0, 1,
-1.105633, -1.369451, -2.474181, 1, 0.7843137, 0, 1,
-1.10183, 1.114069, 0.2750794, 1, 0.7921569, 0, 1,
-1.100999, 1.494782, -2.560801, 1, 0.7960784, 0, 1,
-1.099595, 0.21822, -0.6162177, 1, 0.8039216, 0, 1,
-1.094946, -1.211841, -2.144188, 1, 0.8117647, 0, 1,
-1.088834, 0.6431134, 0.3503698, 1, 0.8156863, 0, 1,
-1.083476, 0.9346915, -0.04007225, 1, 0.8235294, 0, 1,
-1.081352, 1.798249, -0.3795006, 1, 0.827451, 0, 1,
-1.080964, -0.6000693, -3.448031, 1, 0.8352941, 0, 1,
-1.07956, -0.5127317, -1.034318, 1, 0.8392157, 0, 1,
-1.075522, -0.4759805, -3.573704, 1, 0.8470588, 0, 1,
-1.075434, 1.598258, -2.583413, 1, 0.8509804, 0, 1,
-1.062709, -1.861766, -3.099643, 1, 0.8588235, 0, 1,
-1.058842, 0.9559001, -0.4157731, 1, 0.8627451, 0, 1,
-1.058754, 0.2334418, -1.820292, 1, 0.8705882, 0, 1,
-1.057711, 2.000001, -2.015418, 1, 0.8745098, 0, 1,
-1.053963, -1.702361, -3.537634, 1, 0.8823529, 0, 1,
-1.053696, -0.9682169, -0.1710402, 1, 0.8862745, 0, 1,
-1.053665, 0.2781029, -0.4631417, 1, 0.8941177, 0, 1,
-1.052207, -0.6361529, -2.463571, 1, 0.8980392, 0, 1,
-1.047567, 0.8676424, -0.7150469, 1, 0.9058824, 0, 1,
-1.043899, -0.2078476, -2.02548, 1, 0.9137255, 0, 1,
-1.033725, -0.3818628, -0.7472362, 1, 0.9176471, 0, 1,
-1.029562, -0.004175349, -1.64198, 1, 0.9254902, 0, 1,
-1.02903, -1.564666, -2.499141, 1, 0.9294118, 0, 1,
-1.028961, 1.376369, -1.826133, 1, 0.9372549, 0, 1,
-1.022704, -0.224899, -0.8305032, 1, 0.9411765, 0, 1,
-1.021838, 0.1725796, -0.9366215, 1, 0.9490196, 0, 1,
-1.021373, -0.310216, -1.89928, 1, 0.9529412, 0, 1,
-1.016104, 0.2949305, -2.704861, 1, 0.9607843, 0, 1,
-1.010607, 0.8276229, 0.2098049, 1, 0.9647059, 0, 1,
-1.008175, -1.665784, -0.633019, 1, 0.972549, 0, 1,
-1.005921, -1.362578, -3.281636, 1, 0.9764706, 0, 1,
-0.9927706, 0.4070724, -1.903182, 1, 0.9843137, 0, 1,
-0.9841722, 0.181056, -1.33545, 1, 0.9882353, 0, 1,
-0.9771244, 0.02239467, -2.103794, 1, 0.9960784, 0, 1,
-0.9768897, -1.893271, -1.790139, 0.9960784, 1, 0, 1,
-0.9754805, -0.1682542, -2.419683, 0.9921569, 1, 0, 1,
-0.9751699, -0.2499626, -0.7767, 0.9843137, 1, 0, 1,
-0.9704524, 1.961699, 0.5326772, 0.9803922, 1, 0, 1,
-0.9632111, 2.469496, -1.228581, 0.972549, 1, 0, 1,
-0.961426, -1.154803, -2.575886, 0.9686275, 1, 0, 1,
-0.9612619, 0.6864834, 0.5076728, 0.9607843, 1, 0, 1,
-0.9612491, 0.3954751, -1.213838, 0.9568627, 1, 0, 1,
-0.9575056, 0.6109249, -0.4472194, 0.9490196, 1, 0, 1,
-0.95698, -1.413513, -1.580566, 0.945098, 1, 0, 1,
-0.9567834, 1.72748, -1.570775, 0.9372549, 1, 0, 1,
-0.951274, 0.3761372, -2.450008, 0.9333333, 1, 0, 1,
-0.9498696, 0.2130743, -0.009539382, 0.9254902, 1, 0, 1,
-0.9429124, 0.04657699, -2.215967, 0.9215686, 1, 0, 1,
-0.9406211, -0.02535287, -1.720748, 0.9137255, 1, 0, 1,
-0.9365585, 0.1092021, -1.74502, 0.9098039, 1, 0, 1,
-0.9362741, 0.4327789, 0.3727291, 0.9019608, 1, 0, 1,
-0.9265267, -0.04503389, -0.8909509, 0.8941177, 1, 0, 1,
-0.9214042, -1.785291, -1.514173, 0.8901961, 1, 0, 1,
-0.9175661, -0.2289184, -0.3720273, 0.8823529, 1, 0, 1,
-0.9156722, -0.166644, -2.437946, 0.8784314, 1, 0, 1,
-0.9153451, 1.116311, 0.2432515, 0.8705882, 1, 0, 1,
-0.912458, 2.104331, 1.324255, 0.8666667, 1, 0, 1,
-0.9052609, 0.5526733, -1.219719, 0.8588235, 1, 0, 1,
-0.9042854, -0.4135306, -2.280576, 0.854902, 1, 0, 1,
-0.9037498, 0.9858862, -1.151079, 0.8470588, 1, 0, 1,
-0.899449, 1.082351, -1.865179, 0.8431373, 1, 0, 1,
-0.8947898, 1.330345, 1.954242, 0.8352941, 1, 0, 1,
-0.8921359, -0.7837949, -0.483008, 0.8313726, 1, 0, 1,
-0.8907995, 0.7726253, -1.207595, 0.8235294, 1, 0, 1,
-0.8902773, -1.526312, -2.142267, 0.8196079, 1, 0, 1,
-0.8893657, -0.296196, -2.680332, 0.8117647, 1, 0, 1,
-0.8847395, -0.8368261, -0.2030204, 0.8078431, 1, 0, 1,
-0.8776901, -1.70688, -2.45358, 0.8, 1, 0, 1,
-0.8764384, 0.7591615, -0.9949933, 0.7921569, 1, 0, 1,
-0.8622172, -1.129058, -4.389501, 0.7882353, 1, 0, 1,
-0.8583207, -0.5410029, -0.09691592, 0.7803922, 1, 0, 1,
-0.8535349, 0.8690611, -0.3324583, 0.7764706, 1, 0, 1,
-0.8521013, -0.4425417, 0.2459683, 0.7686275, 1, 0, 1,
-0.8477163, -0.7927639, -3.268039, 0.7647059, 1, 0, 1,
-0.8472663, 0.8459783, 0.1991976, 0.7568628, 1, 0, 1,
-0.8452249, 0.06830662, -1.481271, 0.7529412, 1, 0, 1,
-0.8402401, -1.263351, -2.506098, 0.7450981, 1, 0, 1,
-0.8381386, 0.538755, -1.351034, 0.7411765, 1, 0, 1,
-0.8281718, -0.7514748, -1.80672, 0.7333333, 1, 0, 1,
-0.8257987, -0.9248513, -1.521265, 0.7294118, 1, 0, 1,
-0.8239186, -0.9974687, -2.385161, 0.7215686, 1, 0, 1,
-0.8189037, -0.1762531, -2.98912, 0.7176471, 1, 0, 1,
-0.8171562, 0.4769955, -0.8101385, 0.7098039, 1, 0, 1,
-0.8163649, 1.718956, 0.1213352, 0.7058824, 1, 0, 1,
-0.8161649, 0.6909801, -2.302014, 0.6980392, 1, 0, 1,
-0.8078018, 0.2415457, -0.2959692, 0.6901961, 1, 0, 1,
-0.8073504, -1.026778, -2.911991, 0.6862745, 1, 0, 1,
-0.7967048, 0.7349377, -1.206123, 0.6784314, 1, 0, 1,
-0.7955049, 1.853528, 0.4767235, 0.6745098, 1, 0, 1,
-0.7937437, -0.2298494, -1.375535, 0.6666667, 1, 0, 1,
-0.7929918, -0.7907026, -0.9748856, 0.6627451, 1, 0, 1,
-0.7787352, 0.08872505, -1.089376, 0.654902, 1, 0, 1,
-0.7786174, 0.6754153, -1.674719, 0.6509804, 1, 0, 1,
-0.7762253, 0.3571579, -1.068412, 0.6431373, 1, 0, 1,
-0.7751706, 0.6904881, 0.1902299, 0.6392157, 1, 0, 1,
-0.7751067, -0.178875, -0.07706997, 0.6313726, 1, 0, 1,
-0.7733405, -0.14748, -1.024548, 0.627451, 1, 0, 1,
-0.7692882, -1.618661, -2.716955, 0.6196079, 1, 0, 1,
-0.747436, -2.074845, -3.221964, 0.6156863, 1, 0, 1,
-0.7440166, 0.4604872, -0.5952129, 0.6078432, 1, 0, 1,
-0.7381987, -0.5488653, -1.67862, 0.6039216, 1, 0, 1,
-0.7358595, -0.2490059, -1.034492, 0.5960785, 1, 0, 1,
-0.734104, 2.284358, 0.1450866, 0.5882353, 1, 0, 1,
-0.7324518, 0.7599263, -1.599479, 0.5843138, 1, 0, 1,
-0.7259619, 0.8738672, -0.8347938, 0.5764706, 1, 0, 1,
-0.7161058, 0.007329291, -3.483344, 0.572549, 1, 0, 1,
-0.7160715, -0.04902964, -1.357306, 0.5647059, 1, 0, 1,
-0.7159663, -0.3527328, -0.61212, 0.5607843, 1, 0, 1,
-0.7145422, -0.593558, -0.5817335, 0.5529412, 1, 0, 1,
-0.7097847, 0.6316373, -1.110999, 0.5490196, 1, 0, 1,
-0.7080359, -1.236661, -1.768909, 0.5411765, 1, 0, 1,
-0.7072946, -1.071835, -1.374197, 0.5372549, 1, 0, 1,
-0.7066249, 0.07265055, -1.697794, 0.5294118, 1, 0, 1,
-0.7045815, 0.2284832, -1.400223, 0.5254902, 1, 0, 1,
-0.6994594, 0.3936651, 0.2234743, 0.5176471, 1, 0, 1,
-0.697732, 0.639743, -1.020292, 0.5137255, 1, 0, 1,
-0.6977127, -0.2578158, -0.4237113, 0.5058824, 1, 0, 1,
-0.6955991, 0.6912521, 0.1253133, 0.5019608, 1, 0, 1,
-0.6933541, 0.3921325, -2.264521, 0.4941176, 1, 0, 1,
-0.6835896, 0.2775507, -1.275722, 0.4862745, 1, 0, 1,
-0.6801363, -0.06874859, -2.438041, 0.4823529, 1, 0, 1,
-0.6789409, 0.06416584, -0.9898245, 0.4745098, 1, 0, 1,
-0.6766627, -0.9376886, -1.925209, 0.4705882, 1, 0, 1,
-0.6695793, -0.1043656, -3.011589, 0.4627451, 1, 0, 1,
-0.6615846, 0.2123601, -2.097127, 0.4588235, 1, 0, 1,
-0.6540588, 0.05018012, 0.3898214, 0.4509804, 1, 0, 1,
-0.6538615, 0.3256068, -0.4563587, 0.4470588, 1, 0, 1,
-0.6536109, 0.7317125, -0.2804887, 0.4392157, 1, 0, 1,
-0.6523772, -0.4161416, -1.831837, 0.4352941, 1, 0, 1,
-0.6504657, 0.6729113, -1.140599, 0.427451, 1, 0, 1,
-0.6412484, -1.69987, -2.311181, 0.4235294, 1, 0, 1,
-0.6253978, 0.5835896, -1.102185, 0.4156863, 1, 0, 1,
-0.6252231, 1.60173, 0.5237542, 0.4117647, 1, 0, 1,
-0.6249115, 1.764251, -0.04734211, 0.4039216, 1, 0, 1,
-0.6234132, 0.6338592, -1.204085, 0.3960784, 1, 0, 1,
-0.6209703, -0.1087707, -3.963874, 0.3921569, 1, 0, 1,
-0.6199456, -1.684104, -3.015623, 0.3843137, 1, 0, 1,
-0.6078681, 0.1547452, -1.335409, 0.3803922, 1, 0, 1,
-0.6059622, 1.158861, -0.7386876, 0.372549, 1, 0, 1,
-0.6054032, 2.507859, 0.04044812, 0.3686275, 1, 0, 1,
-0.6044725, 0.3743816, -0.727933, 0.3607843, 1, 0, 1,
-0.6002817, -1.424807, -2.96267, 0.3568628, 1, 0, 1,
-0.5989842, 0.2135373, -2.333499, 0.3490196, 1, 0, 1,
-0.5974599, 0.1550383, -0.7203002, 0.345098, 1, 0, 1,
-0.5937376, 1.417374, -0.3159147, 0.3372549, 1, 0, 1,
-0.592143, -0.06012187, -1.378177, 0.3333333, 1, 0, 1,
-0.5889206, 2.028317, 0.6132423, 0.3254902, 1, 0, 1,
-0.5861703, -0.5277779, -0.8928313, 0.3215686, 1, 0, 1,
-0.5823696, -0.4769622, -2.876541, 0.3137255, 1, 0, 1,
-0.5756991, 0.6478795, -0.4921116, 0.3098039, 1, 0, 1,
-0.5734373, 0.775265, -0.316311, 0.3019608, 1, 0, 1,
-0.5698212, 1.444419, -0.8781641, 0.2941177, 1, 0, 1,
-0.5693925, 0.786878, 2.059248, 0.2901961, 1, 0, 1,
-0.5691547, 0.9774446, -1.185135, 0.282353, 1, 0, 1,
-0.5652645, 0.03051551, -2.492343, 0.2784314, 1, 0, 1,
-0.5581767, -0.8632134, -3.224826, 0.2705882, 1, 0, 1,
-0.5550115, -0.8254415, -3.364017, 0.2666667, 1, 0, 1,
-0.5482497, -1.053544, -2.686678, 0.2588235, 1, 0, 1,
-0.5455615, 0.9119549, 0.1007641, 0.254902, 1, 0, 1,
-0.5423861, 1.614791, -2.117406, 0.2470588, 1, 0, 1,
-0.5421101, 0.145764, -1.67602, 0.2431373, 1, 0, 1,
-0.5393862, 0.6593826, -1.268705, 0.2352941, 1, 0, 1,
-0.5378775, 0.03095262, -1.776307, 0.2313726, 1, 0, 1,
-0.534182, -0.4165757, -2.054165, 0.2235294, 1, 0, 1,
-0.5311212, 1.035038, 0.07885259, 0.2196078, 1, 0, 1,
-0.5255391, 0.1409832, -2.229316, 0.2117647, 1, 0, 1,
-0.520865, 2.476425, 0.348008, 0.2078431, 1, 0, 1,
-0.5149575, -0.5304925, -2.198869, 0.2, 1, 0, 1,
-0.514168, -0.3655497, -0.3595072, 0.1921569, 1, 0, 1,
-0.5134952, -0.6751622, -4.280933, 0.1882353, 1, 0, 1,
-0.5123199, 0.8616453, -2.427384, 0.1803922, 1, 0, 1,
-0.5024186, -0.4689976, -4.198163, 0.1764706, 1, 0, 1,
-0.5001554, 0.3479555, -1.508428, 0.1686275, 1, 0, 1,
-0.4988189, -1.020186, -2.047905, 0.1647059, 1, 0, 1,
-0.4977362, -0.4989087, -3.423379, 0.1568628, 1, 0, 1,
-0.495791, 0.3153214, -1.58855, 0.1529412, 1, 0, 1,
-0.4956038, 0.8626165, 0.5407142, 0.145098, 1, 0, 1,
-0.4928816, -1.514044, -4.019851, 0.1411765, 1, 0, 1,
-0.4889769, -0.695773, -1.618689, 0.1333333, 1, 0, 1,
-0.4881961, 0.6941547, -0.470471, 0.1294118, 1, 0, 1,
-0.4809625, 0.3109181, -1.417194, 0.1215686, 1, 0, 1,
-0.4799461, 1.517292, 0.1959852, 0.1176471, 1, 0, 1,
-0.4775717, 0.3224059, -1.202151, 0.1098039, 1, 0, 1,
-0.4771327, -0.6179309, -0.9380156, 0.1058824, 1, 0, 1,
-0.4749118, -0.09975448, -1.532841, 0.09803922, 1, 0, 1,
-0.4724674, 2.81007, -0.6912881, 0.09019608, 1, 0, 1,
-0.4702847, 0.9766209, 0.2740521, 0.08627451, 1, 0, 1,
-0.4655945, -0.09664515, -1.104903, 0.07843138, 1, 0, 1,
-0.4622249, -0.7982943, -1.714867, 0.07450981, 1, 0, 1,
-0.4593796, 0.3880239, -2.93324, 0.06666667, 1, 0, 1,
-0.4561511, -0.9674615, -2.902466, 0.0627451, 1, 0, 1,
-0.4525318, 0.4338726, 0.09844721, 0.05490196, 1, 0, 1,
-0.449117, 0.7927923, -1.148489, 0.05098039, 1, 0, 1,
-0.4421022, 0.495702, -2.252209, 0.04313726, 1, 0, 1,
-0.4404765, 0.1824234, -2.562873, 0.03921569, 1, 0, 1,
-0.4373039, -1.933493, -4.065064, 0.03137255, 1, 0, 1,
-0.4349591, -1.95261, -3.967296, 0.02745098, 1, 0, 1,
-0.4348357, -1.544315, -1.861113, 0.01960784, 1, 0, 1,
-0.4325629, 1.227082, -1.392651, 0.01568628, 1, 0, 1,
-0.4311927, -1.472702, -2.982936, 0.007843138, 1, 0, 1,
-0.4288525, 0.3256679, -1.794922, 0.003921569, 1, 0, 1,
-0.4260501, 1.128013, 0.2983093, 0, 1, 0.003921569, 1,
-0.4238563, -2.274971, -1.534204, 0, 1, 0.01176471, 1,
-0.4194228, -0.4035362, -3.229101, 0, 1, 0.01568628, 1,
-0.4185828, 1.517902, 1.289212, 0, 1, 0.02352941, 1,
-0.4184985, -0.9458789, -1.966193, 0, 1, 0.02745098, 1,
-0.4171433, -0.6486337, -2.953247, 0, 1, 0.03529412, 1,
-0.4161374, -0.8865131, -2.295346, 0, 1, 0.03921569, 1,
-0.414636, -0.1246665, -1.415943, 0, 1, 0.04705882, 1,
-0.4139338, 0.2093996, 1.759818, 0, 1, 0.05098039, 1,
-0.4138534, 1.224228, -1.480277, 0, 1, 0.05882353, 1,
-0.4135033, -0.1125555, -3.654116, 0, 1, 0.0627451, 1,
-0.401052, -0.04212694, -2.882397, 0, 1, 0.07058824, 1,
-0.4006538, -0.08665826, -2.59497, 0, 1, 0.07450981, 1,
-0.3979361, 1.706787, -0.07690015, 0, 1, 0.08235294, 1,
-0.395688, 0.08888, -1.719464, 0, 1, 0.08627451, 1,
-0.3895642, -0.9962428, -0.9629105, 0, 1, 0.09411765, 1,
-0.3838024, -1.341954, -2.228604, 0, 1, 0.1019608, 1,
-0.3765578, 0.4692645, -1.094447, 0, 1, 0.1058824, 1,
-0.3736024, 0.5689492, 0.2577551, 0, 1, 0.1137255, 1,
-0.3714165, -1.940387, -1.508064, 0, 1, 0.1176471, 1,
-0.3667369, -2.582319, -2.838649, 0, 1, 0.1254902, 1,
-0.3646167, 0.4669674, -1.80768, 0, 1, 0.1294118, 1,
-0.3641423, -2.482259, -2.590677, 0, 1, 0.1372549, 1,
-0.3625512, -2.081089, -2.816325, 0, 1, 0.1411765, 1,
-0.3532355, 1.240033, -2.30224, 0, 1, 0.1490196, 1,
-0.3519539, 0.8453308, -1.30643, 0, 1, 0.1529412, 1,
-0.3513454, -0.09832502, -2.086089, 0, 1, 0.1607843, 1,
-0.3509584, 0.2838753, -0.9617047, 0, 1, 0.1647059, 1,
-0.3495763, 0.5075977, -0.6682892, 0, 1, 0.172549, 1,
-0.349033, -1.101343, -3.638453, 0, 1, 0.1764706, 1,
-0.3489065, 0.6395558, -0.6054502, 0, 1, 0.1843137, 1,
-0.3487947, -0.6313128, -3.442728, 0, 1, 0.1882353, 1,
-0.3429713, 0.6506313, -0.4922206, 0, 1, 0.1960784, 1,
-0.3383879, 3.060995e-05, -2.39293, 0, 1, 0.2039216, 1,
-0.3368247, 0.2343703, -1.141795, 0, 1, 0.2078431, 1,
-0.332183, -1.782767, -0.9174958, 0, 1, 0.2156863, 1,
-0.3312639, 1.177869, 0.3963569, 0, 1, 0.2196078, 1,
-0.3310754, -0.1541068, -1.945978, 0, 1, 0.227451, 1,
-0.3271581, -0.6819091, -2.292459, 0, 1, 0.2313726, 1,
-0.3226461, -0.8740952, -3.321431, 0, 1, 0.2392157, 1,
-0.3179577, -1.18435, -2.581355, 0, 1, 0.2431373, 1,
-0.3152552, -1.255812, -2.935959, 0, 1, 0.2509804, 1,
-0.3134681, 0.5304363, 0.04293815, 0, 1, 0.254902, 1,
-0.3121486, 0.1668367, -0.7940371, 0, 1, 0.2627451, 1,
-0.3105829, -1.32975, -2.450677, 0, 1, 0.2666667, 1,
-0.3025185, -1.268955, -3.609071, 0, 1, 0.2745098, 1,
-0.3023913, -1.219648, -2.353182, 0, 1, 0.2784314, 1,
-0.3005313, -1.193239, -3.117304, 0, 1, 0.2862745, 1,
-0.3001314, -0.3432246, -2.972115, 0, 1, 0.2901961, 1,
-0.297334, -0.9313543, -2.775592, 0, 1, 0.2980392, 1,
-0.2958758, 0.3998543, -1.561409, 0, 1, 0.3058824, 1,
-0.2937931, -0.1819483, -1.558343, 0, 1, 0.3098039, 1,
-0.2932654, 0.1348257, 0.6877106, 0, 1, 0.3176471, 1,
-0.2917375, -0.2681974, -2.587855, 0, 1, 0.3215686, 1,
-0.2916338, -2.157872, -3.52424, 0, 1, 0.3294118, 1,
-0.2909852, -0.5065389, -2.338357, 0, 1, 0.3333333, 1,
-0.2908716, 0.2341363, -0.8575571, 0, 1, 0.3411765, 1,
-0.2724778, 0.02749799, 0.2506238, 0, 1, 0.345098, 1,
-0.2615861, 0.04715387, -1.465914, 0, 1, 0.3529412, 1,
-0.2614677, -2.1157, -3.671116, 0, 1, 0.3568628, 1,
-0.260622, 0.9121729, -0.4365008, 0, 1, 0.3647059, 1,
-0.2603603, 0.3067533, 0.5063307, 0, 1, 0.3686275, 1,
-0.2598201, -0.09348781, -2.790295, 0, 1, 0.3764706, 1,
-0.2579359, -0.4375553, -2.276795, 0, 1, 0.3803922, 1,
-0.2536489, -1.080019, -2.36182, 0, 1, 0.3882353, 1,
-0.2425362, 0.3945645, 0.4706011, 0, 1, 0.3921569, 1,
-0.240749, -0.1585831, -1.854995, 0, 1, 0.4, 1,
-0.2302816, -0.4404793, -1.443018, 0, 1, 0.4078431, 1,
-0.2301075, 1.86524, 0.573045, 0, 1, 0.4117647, 1,
-0.2295461, -0.07237162, -2.76988, 0, 1, 0.4196078, 1,
-0.2289525, -0.7555437, -2.704684, 0, 1, 0.4235294, 1,
-0.2274351, -0.5803967, -2.526435, 0, 1, 0.4313726, 1,
-0.2264453, -0.3382109, -2.517086, 0, 1, 0.4352941, 1,
-0.2253232, 1.799235, -1.043814, 0, 1, 0.4431373, 1,
-0.2222447, 0.3081416, -0.4698831, 0, 1, 0.4470588, 1,
-0.2165652, 0.4780718, 2.102616, 0, 1, 0.454902, 1,
-0.2128582, -0.6554568, -3.186867, 0, 1, 0.4588235, 1,
-0.2126442, 1.33351, -2.313026, 0, 1, 0.4666667, 1,
-0.2109798, -2.17983, -2.439523, 0, 1, 0.4705882, 1,
-0.2079737, 1.761538, 0.8039607, 0, 1, 0.4784314, 1,
-0.2077991, 0.2165485, -1.239931, 0, 1, 0.4823529, 1,
-0.2074852, 0.8863078, -1.082593, 0, 1, 0.4901961, 1,
-0.2058057, 0.8349462, -0.1846568, 0, 1, 0.4941176, 1,
-0.2040112, -0.1284851, -2.381515, 0, 1, 0.5019608, 1,
-0.203495, -0.2118067, -3.603135, 0, 1, 0.509804, 1,
-0.2001571, -1.739164, -3.592686, 0, 1, 0.5137255, 1,
-0.1997263, -0.009806923, -2.358598, 0, 1, 0.5215687, 1,
-0.199549, -1.321603, -2.779418, 0, 1, 0.5254902, 1,
-0.1962725, -0.8483338, -2.915211, 0, 1, 0.5333334, 1,
-0.1955273, -0.7444386, -1.200307, 0, 1, 0.5372549, 1,
-0.1936517, 0.571889, 0.1839587, 0, 1, 0.5450981, 1,
-0.1866505, 0.4699798, 0.48929, 0, 1, 0.5490196, 1,
-0.1851007, -0.08390617, -2.236156, 0, 1, 0.5568628, 1,
-0.183907, 1.765381, -0.3442865, 0, 1, 0.5607843, 1,
-0.1823595, 0.1585309, -1.632664, 0, 1, 0.5686275, 1,
-0.1710743, 1.236347, -0.8877181, 0, 1, 0.572549, 1,
-0.1710331, -0.8931101, -3.610828, 0, 1, 0.5803922, 1,
-0.1663537, 0.7485585, -0.3317127, 0, 1, 0.5843138, 1,
-0.165502, 0.1826224, -0.7470442, 0, 1, 0.5921569, 1,
-0.1623505, -0.7835538, -4.789749, 0, 1, 0.5960785, 1,
-0.1602419, 0.391248, -0.8972708, 0, 1, 0.6039216, 1,
-0.1596837, 0.139883, -1.355288, 0, 1, 0.6117647, 1,
-0.1574064, 1.412429, 1.281547, 0, 1, 0.6156863, 1,
-0.157253, 0.9672524, -0.01877427, 0, 1, 0.6235294, 1,
-0.1528518, 1.348873, 1.465762, 0, 1, 0.627451, 1,
-0.1505517, -0.400802, -4.313365, 0, 1, 0.6352941, 1,
-0.1472749, -0.03191515, -0.7767061, 0, 1, 0.6392157, 1,
-0.1469228, -0.4617122, -1.136888, 0, 1, 0.6470588, 1,
-0.1444064, -0.1545475, -1.788535, 0, 1, 0.6509804, 1,
-0.1430119, -0.4289466, -1.48459, 0, 1, 0.6588235, 1,
-0.1383816, 0.5139324, -0.8332791, 0, 1, 0.6627451, 1,
-0.1346452, -1.319005, -3.4226, 0, 1, 0.6705883, 1,
-0.1337768, -1.385099, -2.580419, 0, 1, 0.6745098, 1,
-0.1321839, 1.71598, -0.748409, 0, 1, 0.682353, 1,
-0.1311041, -0.2163381, -3.514123, 0, 1, 0.6862745, 1,
-0.1309768, 0.08138032, 0.5101765, 0, 1, 0.6941177, 1,
-0.1305019, -1.808657, -2.103624, 0, 1, 0.7019608, 1,
-0.1265548, 0.2158049, 0.1747087, 0, 1, 0.7058824, 1,
-0.1237136, -0.5188549, -3.432624, 0, 1, 0.7137255, 1,
-0.1206384, -0.1018191, -0.5355947, 0, 1, 0.7176471, 1,
-0.1204711, -0.5739359, -0.9601115, 0, 1, 0.7254902, 1,
-0.1185697, 1.213756, -0.56628, 0, 1, 0.7294118, 1,
-0.1145748, 0.993866, -0.9254065, 0, 1, 0.7372549, 1,
-0.1144397, 0.1652946, 0.116026, 0, 1, 0.7411765, 1,
-0.1134208, 0.4304305, 1.037483, 0, 1, 0.7490196, 1,
-0.1039953, 0.6008193, -0.6070803, 0, 1, 0.7529412, 1,
-0.103394, -0.4200363, -5.9225, 0, 1, 0.7607843, 1,
-0.0987323, -0.9122811, -1.248868, 0, 1, 0.7647059, 1,
-0.09674753, -0.6861294, -2.623779, 0, 1, 0.772549, 1,
-0.09556174, 0.2409821, -1.188177, 0, 1, 0.7764706, 1,
-0.09471522, -0.01034729, -2.351798, 0, 1, 0.7843137, 1,
-0.09449518, -1.255242, -1.144221, 0, 1, 0.7882353, 1,
-0.0932326, -0.3322172, -3.533623, 0, 1, 0.7960784, 1,
-0.09039996, -0.9515801, -3.175266, 0, 1, 0.8039216, 1,
-0.08972456, -0.006521848, -2.406946, 0, 1, 0.8078431, 1,
-0.08625626, 0.2374536, -1.88124, 0, 1, 0.8156863, 1,
-0.08351276, -0.8101149, -2.572508, 0, 1, 0.8196079, 1,
-0.08222059, -1.978974, -3.187621, 0, 1, 0.827451, 1,
-0.07665341, -1.642853, -2.182719, 0, 1, 0.8313726, 1,
-0.07319488, 1.320143, -1.128822, 0, 1, 0.8392157, 1,
-0.07229456, 1.114279, -0.1843401, 0, 1, 0.8431373, 1,
-0.07110488, -0.2529085, -3.00727, 0, 1, 0.8509804, 1,
-0.06706153, 2.843441, 1.601572, 0, 1, 0.854902, 1,
-0.06684327, 0.6514759, -0.8414605, 0, 1, 0.8627451, 1,
-0.06449682, 1.634033, -0.08164898, 0, 1, 0.8666667, 1,
-0.06277008, 1.23951, -1.057635, 0, 1, 0.8745098, 1,
-0.06071519, 2.375731, -0.4460521, 0, 1, 0.8784314, 1,
-0.05819459, 1.784842, -0.09999979, 0, 1, 0.8862745, 1,
-0.05221765, 0.2807713, -0.6748039, 0, 1, 0.8901961, 1,
-0.05192906, -0.09952374, -3.692935, 0, 1, 0.8980392, 1,
-0.04675941, -0.9724305, -2.972216, 0, 1, 0.9058824, 1,
-0.04125499, -1.27506, -3.307805, 0, 1, 0.9098039, 1,
-0.04105179, 1.270415, -0.8279906, 0, 1, 0.9176471, 1,
-0.04048994, 0.03748962, -1.024175, 0, 1, 0.9215686, 1,
-0.03952058, 0.4273386, 0.2852359, 0, 1, 0.9294118, 1,
-0.0359914, -0.1676707, -2.219462, 0, 1, 0.9333333, 1,
-0.03350289, -0.3788489, -2.435286, 0, 1, 0.9411765, 1,
-0.03236784, 0.9769411, 0.1534304, 0, 1, 0.945098, 1,
-0.03190278, 0.1776296, 0.399329, 0, 1, 0.9529412, 1,
-0.03164325, -0.006187548, -1.693274, 0, 1, 0.9568627, 1,
-0.03112265, 0.829442, -1.100445, 0, 1, 0.9647059, 1,
-0.02922154, -0.6390368, -2.067192, 0, 1, 0.9686275, 1,
-0.02609793, 1.541522, 0.9350172, 0, 1, 0.9764706, 1,
-0.02536403, -0.2949893, -2.87035, 0, 1, 0.9803922, 1,
-0.02151406, -0.6849285, -3.896963, 0, 1, 0.9882353, 1,
-0.01951373, -1.577196, -3.493881, 0, 1, 0.9921569, 1,
-0.01407969, 1.362504, -1.40533, 0, 1, 1, 1,
-0.01355765, 0.3379507, 2.039464, 0, 0.9921569, 1, 1,
-0.01340078, 0.6706885, 0.1795405, 0, 0.9882353, 1, 1,
-0.004442214, -0.5454279, -3.423424, 0, 0.9803922, 1, 1,
-0.003376129, -0.5100512, -4.093663, 0, 0.9764706, 1, 1,
-0.00163531, -0.6358992, -3.082601, 0, 0.9686275, 1, 1,
-0.001134232, -1.337637, -3.705788, 0, 0.9647059, 1, 1,
-0.0002093662, 0.3631403, -0.8336245, 0, 0.9568627, 1, 1,
0.002677856, 0.06499757, 1.014268, 0, 0.9529412, 1, 1,
0.003528819, -0.8943123, 1.652704, 0, 0.945098, 1, 1,
0.004133874, 1.259017, -1.94419, 0, 0.9411765, 1, 1,
0.005814447, 1.996731, -1.07844, 0, 0.9333333, 1, 1,
0.01109055, 0.4668509, 0.3936872, 0, 0.9294118, 1, 1,
0.01723915, -1.463786, 3.233817, 0, 0.9215686, 1, 1,
0.02556425, 1.99907, 0.4444174, 0, 0.9176471, 1, 1,
0.02596158, -0.6152322, 3.277476, 0, 0.9098039, 1, 1,
0.02914876, -0.4271139, 4.584702, 0, 0.9058824, 1, 1,
0.03885708, -0.3978941, 3.146105, 0, 0.8980392, 1, 1,
0.04065945, -2.206367, 3.347342, 0, 0.8901961, 1, 1,
0.04165462, -0.7409959, 2.684855, 0, 0.8862745, 1, 1,
0.04191411, -0.837864, 3.730918, 0, 0.8784314, 1, 1,
0.0427157, -0.8933656, 4.14287, 0, 0.8745098, 1, 1,
0.04590428, 0.4458708, 0.7211554, 0, 0.8666667, 1, 1,
0.04749486, -0.3225553, 2.334659, 0, 0.8627451, 1, 1,
0.04875932, 2.194823, -1.115376, 0, 0.854902, 1, 1,
0.05221935, 0.008663601, 1.067887, 0, 0.8509804, 1, 1,
0.05501598, 0.4782971, 0.3966498, 0, 0.8431373, 1, 1,
0.06715533, -0.3358822, 3.573277, 0, 0.8392157, 1, 1,
0.06833243, 0.8248644, 0.6174599, 0, 0.8313726, 1, 1,
0.07806628, 0.591221, 0.1101436, 0, 0.827451, 1, 1,
0.07882993, -0.7047347, 2.580013, 0, 0.8196079, 1, 1,
0.07896083, -0.4805084, 3.102202, 0, 0.8156863, 1, 1,
0.08085484, -0.5523385, 4.306023, 0, 0.8078431, 1, 1,
0.08173203, 0.04084004, 0.6394163, 0, 0.8039216, 1, 1,
0.08286924, -1.459239, 3.36393, 0, 0.7960784, 1, 1,
0.08297808, -0.1592472, 1.858907, 0, 0.7882353, 1, 1,
0.08557247, 0.5401365, 0.5914527, 0, 0.7843137, 1, 1,
0.0857929, -0.5863273, 1.976156, 0, 0.7764706, 1, 1,
0.08756619, 0.1889718, -0.4631611, 0, 0.772549, 1, 1,
0.09041605, 0.3389429, 1.119975, 0, 0.7647059, 1, 1,
0.09042168, -0.469489, 3.576156, 0, 0.7607843, 1, 1,
0.09291681, 0.8065286, 2.610384, 0, 0.7529412, 1, 1,
0.09310028, -0.1715161, 2.259149, 0, 0.7490196, 1, 1,
0.0938591, 0.7718942, -0.4253388, 0, 0.7411765, 1, 1,
0.09722121, 0.6619556, -0.09011051, 0, 0.7372549, 1, 1,
0.09951448, -0.1243806, 3.212432, 0, 0.7294118, 1, 1,
0.1000795, 0.2968644, 0.09666412, 0, 0.7254902, 1, 1,
0.1011874, 1.452659, -0.2378696, 0, 0.7176471, 1, 1,
0.1028079, -0.1244926, 2.303453, 0, 0.7137255, 1, 1,
0.1048134, -1.037572, 2.77453, 0, 0.7058824, 1, 1,
0.1083533, -1.129951, 3.159106, 0, 0.6980392, 1, 1,
0.1124694, -0.6911469, 3.311399, 0, 0.6941177, 1, 1,
0.1124864, 1.002541, -0.3451017, 0, 0.6862745, 1, 1,
0.1247188, 0.02254498, 1.605418, 0, 0.682353, 1, 1,
0.1249493, 0.02020492, 0.7729971, 0, 0.6745098, 1, 1,
0.1262825, 0.2340811, -0.1118443, 0, 0.6705883, 1, 1,
0.1266555, -0.4924833, 1.174176, 0, 0.6627451, 1, 1,
0.1272669, 1.609232, 0.4489242, 0, 0.6588235, 1, 1,
0.1283437, -0.8074508, 2.04651, 0, 0.6509804, 1, 1,
0.1347074, 2.206982, 0.219196, 0, 0.6470588, 1, 1,
0.1349011, 0.1055921, 2.117423, 0, 0.6392157, 1, 1,
0.1367115, -0.7036006, 0.9971043, 0, 0.6352941, 1, 1,
0.1393301, -1.111857, 2.819392, 0, 0.627451, 1, 1,
0.1394007, -0.8136994, 2.227023, 0, 0.6235294, 1, 1,
0.1394275, -1.1892, 3.154589, 0, 0.6156863, 1, 1,
0.1427802, -0.5814137, 1.778233, 0, 0.6117647, 1, 1,
0.1455187, 0.2558873, 0.9506993, 0, 0.6039216, 1, 1,
0.1520875, -0.4175186, 1.824147, 0, 0.5960785, 1, 1,
0.156757, 0.4971222, 1.401047, 0, 0.5921569, 1, 1,
0.156776, 0.4375953, 2.682315, 0, 0.5843138, 1, 1,
0.1573149, 0.2406861, 1.139517, 0, 0.5803922, 1, 1,
0.1579581, -1.419748, 0.5144842, 0, 0.572549, 1, 1,
0.1594114, 1.27568, 2.135898, 0, 0.5686275, 1, 1,
0.1598831, -0.1030709, 3.327164, 0, 0.5607843, 1, 1,
0.1716552, -2.072925, 3.26653, 0, 0.5568628, 1, 1,
0.174054, 1.172588, 0.6130086, 0, 0.5490196, 1, 1,
0.1754301, 0.8663987, 0.5731881, 0, 0.5450981, 1, 1,
0.1761261, -0.0820471, 1.777841, 0, 0.5372549, 1, 1,
0.1767323, 0.3144071, 2.148906, 0, 0.5333334, 1, 1,
0.181162, -0.7785556, 2.462979, 0, 0.5254902, 1, 1,
0.1836796, -1.245527, 3.555636, 0, 0.5215687, 1, 1,
0.1839788, -0.8514286, 2.442137, 0, 0.5137255, 1, 1,
0.1860177, -0.8178804, 3.045445, 0, 0.509804, 1, 1,
0.1909472, -2.480743, 4.786057, 0, 0.5019608, 1, 1,
0.1912058, 1.234866, -0.1833575, 0, 0.4941176, 1, 1,
0.1946805, 1.545577, 0.2047423, 0, 0.4901961, 1, 1,
0.1947192, -0.7826695, 2.139876, 0, 0.4823529, 1, 1,
0.199079, -1.027779, 4.39292, 0, 0.4784314, 1, 1,
0.2058895, -0.06971499, 1.075232, 0, 0.4705882, 1, 1,
0.2064641, 1.735951, 0.3029196, 0, 0.4666667, 1, 1,
0.2156844, 0.6732694, 0.7406176, 0, 0.4588235, 1, 1,
0.2163481, -0.3248579, 1.818982, 0, 0.454902, 1, 1,
0.2175502, 1.128257, -0.1881434, 0, 0.4470588, 1, 1,
0.2193593, 0.3338013, -1.135444, 0, 0.4431373, 1, 1,
0.2200627, 0.4434851, -1.272119, 0, 0.4352941, 1, 1,
0.2224384, 0.1485486, 0.7659528, 0, 0.4313726, 1, 1,
0.2283835, 0.612598, 0.06344969, 0, 0.4235294, 1, 1,
0.2291978, 0.04168913, 2.931574, 0, 0.4196078, 1, 1,
0.2308859, -2.6606, 4.525139, 0, 0.4117647, 1, 1,
0.2309756, 0.4886278, 0.9839329, 0, 0.4078431, 1, 1,
0.2315414, -0.9016393, 5.107104, 0, 0.4, 1, 1,
0.2320405, -0.1037671, 1.249159, 0, 0.3921569, 1, 1,
0.2321718, -0.8338073, 2.832189, 0, 0.3882353, 1, 1,
0.2332572, 0.1561323, -0.0955615, 0, 0.3803922, 1, 1,
0.2367449, 0.2756252, 0.5848052, 0, 0.3764706, 1, 1,
0.2371449, -0.3444372, 1.397956, 0, 0.3686275, 1, 1,
0.2374238, 0.7169432, -0.6650041, 0, 0.3647059, 1, 1,
0.2374953, -1.461176, 3.206808, 0, 0.3568628, 1, 1,
0.2423696, 0.03984858, 1.347429, 0, 0.3529412, 1, 1,
0.2521529, -0.3348324, 2.992602, 0, 0.345098, 1, 1,
0.2525568, -0.2561901, 1.080122, 0, 0.3411765, 1, 1,
0.2535694, 2.340529, -0.1201429, 0, 0.3333333, 1, 1,
0.2548687, -0.7457452, 1.004526, 0, 0.3294118, 1, 1,
0.2555585, -0.285808, 0.89882, 0, 0.3215686, 1, 1,
0.2571985, 0.4842083, -0.4793346, 0, 0.3176471, 1, 1,
0.2582423, 1.052112, 1.647857, 0, 0.3098039, 1, 1,
0.2591842, -0.1622558, 1.717403, 0, 0.3058824, 1, 1,
0.2640193, -0.0005357199, 1.495722, 0, 0.2980392, 1, 1,
0.2666467, 1.122575, -0.18208, 0, 0.2901961, 1, 1,
0.2687964, 0.4875732, 1.949188, 0, 0.2862745, 1, 1,
0.2714402, -0.2915331, 1.539198, 0, 0.2784314, 1, 1,
0.274465, -1.331227, 3.818128, 0, 0.2745098, 1, 1,
0.2770562, -0.6740989, 1.741707, 0, 0.2666667, 1, 1,
0.281205, -0.03249443, 2.04653, 0, 0.2627451, 1, 1,
0.2838987, 0.5615668, 0.8592457, 0, 0.254902, 1, 1,
0.2858116, -1.805961, 4.273405, 0, 0.2509804, 1, 1,
0.28689, -1.81545, 2.92781, 0, 0.2431373, 1, 1,
0.2883247, 0.4203679, 0.8008263, 0, 0.2392157, 1, 1,
0.2899016, -1.705436, 3.452376, 0, 0.2313726, 1, 1,
0.2938559, 0.1819145, 0.8507591, 0, 0.227451, 1, 1,
0.2952848, -0.6366153, 4.089457, 0, 0.2196078, 1, 1,
0.295817, 1.76832, -0.08074705, 0, 0.2156863, 1, 1,
0.3046863, -0.3528945, 1.937485, 0, 0.2078431, 1, 1,
0.304692, 0.3616499, 2.914965, 0, 0.2039216, 1, 1,
0.3048674, -1.178563, 3.240813, 0, 0.1960784, 1, 1,
0.3053361, 0.1823987, -0.5283826, 0, 0.1882353, 1, 1,
0.3067945, 1.948958, 1.110557, 0, 0.1843137, 1, 1,
0.3159575, 0.08182999, 0.9326631, 0, 0.1764706, 1, 1,
0.3171832, -0.2522323, 1.462738, 0, 0.172549, 1, 1,
0.3173248, 0.7991527, 0.4162359, 0, 0.1647059, 1, 1,
0.3224209, -1.096634, 4.149467, 0, 0.1607843, 1, 1,
0.3253583, 0.4174948, -0.4414757, 0, 0.1529412, 1, 1,
0.3258985, 0.1124228, 1.516977, 0, 0.1490196, 1, 1,
0.328056, -0.3178452, -0.9220533, 0, 0.1411765, 1, 1,
0.3337199, 0.04716486, 2.203755, 0, 0.1372549, 1, 1,
0.3341327, -0.7082167, 3.445224, 0, 0.1294118, 1, 1,
0.3341409, -0.6733648, 1.897091, 0, 0.1254902, 1, 1,
0.3347076, 0.3755229, -0.3280025, 0, 0.1176471, 1, 1,
0.3360877, 0.8633528, -0.7063119, 0, 0.1137255, 1, 1,
0.3399366, -0.1327021, 1.912636, 0, 0.1058824, 1, 1,
0.3406632, -0.6257548, 3.175157, 0, 0.09803922, 1, 1,
0.3408752, -1.157118, 3.587469, 0, 0.09411765, 1, 1,
0.341124, 1.959229, 1.482405, 0, 0.08627451, 1, 1,
0.3411791, -1.020227, 2.723576, 0, 0.08235294, 1, 1,
0.3465309, 2.654675, -0.0322769, 0, 0.07450981, 1, 1,
0.3483796, -1.860098, 3.140295, 0, 0.07058824, 1, 1,
0.3488945, -0.6300731, 2.877761, 0, 0.0627451, 1, 1,
0.3491762, -0.2156478, 1.677933, 0, 0.05882353, 1, 1,
0.3522256, -0.9633836, 2.188716, 0, 0.05098039, 1, 1,
0.3531412, -0.9632292, 4.085251, 0, 0.04705882, 1, 1,
0.358021, 0.2959991, 0.9074019, 0, 0.03921569, 1, 1,
0.3586516, 1.467749, 0.9343886, 0, 0.03529412, 1, 1,
0.3604615, 1.347112, -0.6990238, 0, 0.02745098, 1, 1,
0.3608499, 0.4863183, -0.05286372, 0, 0.02352941, 1, 1,
0.3715841, 0.1014197, 2.56595, 0, 0.01568628, 1, 1,
0.3740214, -1.528548, 3.426337, 0, 0.01176471, 1, 1,
0.3746395, -2.428349, 2.890741, 0, 0.003921569, 1, 1,
0.3771433, -1.00032, 2.777293, 0.003921569, 0, 1, 1,
0.3789302, -0.8616759, 4.216035, 0.007843138, 0, 1, 1,
0.3851676, 1.335088, 0.468949, 0.01568628, 0, 1, 1,
0.38708, -2.087665, 4.26669, 0.01960784, 0, 1, 1,
0.392415, 0.1677782, -0.3096836, 0.02745098, 0, 1, 1,
0.3954181, 3.130858, -0.5318731, 0.03137255, 0, 1, 1,
0.3969326, -1.53853, 3.761893, 0.03921569, 0, 1, 1,
0.3976169, 0.6269376, 1.885988, 0.04313726, 0, 1, 1,
0.3994161, 1.012902, -0.1828404, 0.05098039, 0, 1, 1,
0.4005202, -0.4208439, 4.462623, 0.05490196, 0, 1, 1,
0.4005562, -0.08097809, 1.631333, 0.0627451, 0, 1, 1,
0.4023016, 0.1921998, -0.02905183, 0.06666667, 0, 1, 1,
0.4086544, 1.072018, 0.2255894, 0.07450981, 0, 1, 1,
0.4112244, 0.8268977, 0.7379347, 0.07843138, 0, 1, 1,
0.4118002, -0.7879591, 2.279981, 0.08627451, 0, 1, 1,
0.4181549, -1.287266, 3.162497, 0.09019608, 0, 1, 1,
0.4224367, 1.793544, 1.486977, 0.09803922, 0, 1, 1,
0.4255221, -0.09792181, 2.384623, 0.1058824, 0, 1, 1,
0.432107, 0.5390876, 2.11747, 0.1098039, 0, 1, 1,
0.4365745, -0.1580615, 2.859502, 0.1176471, 0, 1, 1,
0.4392435, -1.549662, 4.685234, 0.1215686, 0, 1, 1,
0.4394839, -0.3678047, 2.151664, 0.1294118, 0, 1, 1,
0.4421895, -0.9865146, 2.357785, 0.1333333, 0, 1, 1,
0.4433229, -1.436894, 3.565809, 0.1411765, 0, 1, 1,
0.4496138, 1.139238, -0.6507789, 0.145098, 0, 1, 1,
0.4615041, -0.3155522, 3.168868, 0.1529412, 0, 1, 1,
0.4646219, -1.362055, 2.863833, 0.1568628, 0, 1, 1,
0.4680831, 1.432203, -0.06819905, 0.1647059, 0, 1, 1,
0.4693292, 0.8438926, 1.955604, 0.1686275, 0, 1, 1,
0.4738277, -0.4545043, 1.668554, 0.1764706, 0, 1, 1,
0.4754962, 0.8968513, 2.605622, 0.1803922, 0, 1, 1,
0.4757688, 0.5563555, 0.5454666, 0.1882353, 0, 1, 1,
0.4786333, 0.1390816, 0.753439, 0.1921569, 0, 1, 1,
0.478766, -0.3071679, 2.776806, 0.2, 0, 1, 1,
0.4853171, 0.4181333, 1.454285, 0.2078431, 0, 1, 1,
0.4960035, 1.534533, 0.3172419, 0.2117647, 0, 1, 1,
0.499097, 0.3145805, 2.071124, 0.2196078, 0, 1, 1,
0.5084594, 0.2834367, 1.520707, 0.2235294, 0, 1, 1,
0.512345, -1.489087, 2.894477, 0.2313726, 0, 1, 1,
0.5172068, -0.8322263, 3.997565, 0.2352941, 0, 1, 1,
0.5265529, 0.3233274, 0.5162305, 0.2431373, 0, 1, 1,
0.5269359, 1.204382, 1.135214, 0.2470588, 0, 1, 1,
0.5336449, 0.03054348, 0.4890457, 0.254902, 0, 1, 1,
0.5381237, 0.4215362, 0.1532497, 0.2588235, 0, 1, 1,
0.5427945, 0.1978222, -0.2891301, 0.2666667, 0, 1, 1,
0.542998, -1.22149, 3.463684, 0.2705882, 0, 1, 1,
0.5456812, 0.2030144, 0.253983, 0.2784314, 0, 1, 1,
0.5463537, -0.101442, 0.8208478, 0.282353, 0, 1, 1,
0.5469654, -0.6423935, 0.9803461, 0.2901961, 0, 1, 1,
0.5509143, -0.439346, 2.0003, 0.2941177, 0, 1, 1,
0.5532976, 1.585716, -0.9141742, 0.3019608, 0, 1, 1,
0.555221, 0.4946627, 2.271922, 0.3098039, 0, 1, 1,
0.5564328, 0.09754997, 1.18871, 0.3137255, 0, 1, 1,
0.5619344, -0.1017026, 0.1179544, 0.3215686, 0, 1, 1,
0.5623717, -1.219318, 3.881774, 0.3254902, 0, 1, 1,
0.562456, 0.5845103, -2.0616, 0.3333333, 0, 1, 1,
0.5672287, 1.655336, 0.5405104, 0.3372549, 0, 1, 1,
0.5676747, 0.04368539, 1.828248, 0.345098, 0, 1, 1,
0.5761935, 0.8423506, 1.51147, 0.3490196, 0, 1, 1,
0.5796005, 1.377319, 1.686083, 0.3568628, 0, 1, 1,
0.5827393, 1.086897, -1.041738, 0.3607843, 0, 1, 1,
0.5831494, 0.9390627, 0.8487504, 0.3686275, 0, 1, 1,
0.5844809, 0.4978664, 1.051681, 0.372549, 0, 1, 1,
0.5939842, 0.5369658, 0.7325323, 0.3803922, 0, 1, 1,
0.5957097, -0.3836055, -0.2526844, 0.3843137, 0, 1, 1,
0.5975381, 0.4932931, -0.4434246, 0.3921569, 0, 1, 1,
0.5979002, 0.338958, 0.5398178, 0.3960784, 0, 1, 1,
0.5982248, 0.08223263, 3.423865, 0.4039216, 0, 1, 1,
0.5995077, 0.1217474, -0.1027871, 0.4117647, 0, 1, 1,
0.6013735, -0.6256587, 2.217805, 0.4156863, 0, 1, 1,
0.6041934, 0.351853, -0.3997503, 0.4235294, 0, 1, 1,
0.6089817, -0.6808626, 2.267032, 0.427451, 0, 1, 1,
0.6121494, 1.498078, 1.119047, 0.4352941, 0, 1, 1,
0.6182375, 1.364025, 1.40588, 0.4392157, 0, 1, 1,
0.6189995, -0.3412571, 1.954929, 0.4470588, 0, 1, 1,
0.6201805, 0.5505545, 0.5216249, 0.4509804, 0, 1, 1,
0.6220034, 0.195901, 2.651877, 0.4588235, 0, 1, 1,
0.6237632, 0.3725946, 0.2522883, 0.4627451, 0, 1, 1,
0.6320542, 0.3429733, 0.9146369, 0.4705882, 0, 1, 1,
0.6385323, -0.08916761, 2.452218, 0.4745098, 0, 1, 1,
0.6445379, -2.535687, 4.45655, 0.4823529, 0, 1, 1,
0.6502385, -0.5529275, 1.41218, 0.4862745, 0, 1, 1,
0.6524435, 0.3831781, 1.994133, 0.4941176, 0, 1, 1,
0.6529149, -1.377718, 4.284148, 0.5019608, 0, 1, 1,
0.6540366, -0.2114128, 1.092983, 0.5058824, 0, 1, 1,
0.6543273, -2.368444, 1.218881, 0.5137255, 0, 1, 1,
0.6558874, -1.707762, 1.388168, 0.5176471, 0, 1, 1,
0.6564414, -0.02372431, 0.06558406, 0.5254902, 0, 1, 1,
0.6590357, 2.647406, 0.8470722, 0.5294118, 0, 1, 1,
0.6625517, 0.2136276, 1.286199, 0.5372549, 0, 1, 1,
0.6689214, -1.454745, 2.787021, 0.5411765, 0, 1, 1,
0.6700061, -0.8812622, 0.7217152, 0.5490196, 0, 1, 1,
0.6709581, -0.009740673, 2.094592, 0.5529412, 0, 1, 1,
0.6718527, 0.04906711, 3.457019, 0.5607843, 0, 1, 1,
0.6818706, -1.301183, 2.956182, 0.5647059, 0, 1, 1,
0.6822495, 0.06203375, 1.431974, 0.572549, 0, 1, 1,
0.682463, -1.091143, 2.731905, 0.5764706, 0, 1, 1,
0.6851693, 1.09498, 0.9288793, 0.5843138, 0, 1, 1,
0.6874745, -0.6070187, 0.962414, 0.5882353, 0, 1, 1,
0.6890833, -2.593996, 3.246956, 0.5960785, 0, 1, 1,
0.6905645, -2.57637, 4.029771, 0.6039216, 0, 1, 1,
0.6935924, -0.8945939, 1.876165, 0.6078432, 0, 1, 1,
0.6996573, -1.783853, 2.369498, 0.6156863, 0, 1, 1,
0.7013482, -0.2735626, 2.186459, 0.6196079, 0, 1, 1,
0.7020396, 1.044161, 1.065398, 0.627451, 0, 1, 1,
0.703153, -0.37423, 1.88767, 0.6313726, 0, 1, 1,
0.7048659, 0.2278785, -0.3138792, 0.6392157, 0, 1, 1,
0.7080263, -0.6088532, 2.57333, 0.6431373, 0, 1, 1,
0.7101309, -2.549292, 1.415747, 0.6509804, 0, 1, 1,
0.7187274, -0.3884889, 1.856146, 0.654902, 0, 1, 1,
0.7195016, -0.7603591, 2.937472, 0.6627451, 0, 1, 1,
0.726994, 1.459523, -0.2585672, 0.6666667, 0, 1, 1,
0.7279777, -2.209414, 4.697447, 0.6745098, 0, 1, 1,
0.7385195, -0.4400317, 1.476504, 0.6784314, 0, 1, 1,
0.7410974, -0.4132137, 2.296332, 0.6862745, 0, 1, 1,
0.7429892, 0.49889, 1.043807, 0.6901961, 0, 1, 1,
0.7433385, 0.8462203, 1.143639, 0.6980392, 0, 1, 1,
0.7450083, 1.414859, 2.773395, 0.7058824, 0, 1, 1,
0.745167, 1.015571, -0.9987129, 0.7098039, 0, 1, 1,
0.7577102, -0.2281624, 1.171381, 0.7176471, 0, 1, 1,
0.7654627, 0.01358839, 2.1998, 0.7215686, 0, 1, 1,
0.76557, -1.100396, 4.195621, 0.7294118, 0, 1, 1,
0.7663789, 0.5969741, 1.335005, 0.7333333, 0, 1, 1,
0.7671962, 0.09983365, 0.9155715, 0.7411765, 0, 1, 1,
0.7705374, 1.366691, 1.701516, 0.7450981, 0, 1, 1,
0.7734799, 0.01553696, -0.07101694, 0.7529412, 0, 1, 1,
0.7770185, 0.9275392, -0.004632, 0.7568628, 0, 1, 1,
0.7774444, 1.0215, -0.4294399, 0.7647059, 0, 1, 1,
0.7808822, -0.4242838, 2.688281, 0.7686275, 0, 1, 1,
0.7911261, -0.3232602, 2.783772, 0.7764706, 0, 1, 1,
0.7924927, -0.3289317, 2.026232, 0.7803922, 0, 1, 1,
0.7961508, 0.05585019, 2.065035, 0.7882353, 0, 1, 1,
0.7967845, 0.1480816, 1.574559, 0.7921569, 0, 1, 1,
0.7974368, -1.020025, 1.922652, 0.8, 0, 1, 1,
0.7990691, -1.25773, 2.030741, 0.8078431, 0, 1, 1,
0.8020418, 0.0868104, -0.01320823, 0.8117647, 0, 1, 1,
0.8032194, -0.6990994, 0.3462427, 0.8196079, 0, 1, 1,
0.8116221, 0.5583341, 0.930491, 0.8235294, 0, 1, 1,
0.8162538, -0.6875017, 2.442281, 0.8313726, 0, 1, 1,
0.8223942, -0.006321507, 3.339726, 0.8352941, 0, 1, 1,
0.8347431, -0.9341409, 2.143703, 0.8431373, 0, 1, 1,
0.8451014, -1.461662, 3.139871, 0.8470588, 0, 1, 1,
0.8471087, -0.2651564, 2.353967, 0.854902, 0, 1, 1,
0.8475176, 0.5188876, 2.454681, 0.8588235, 0, 1, 1,
0.8514725, -0.2415564, 3.751963, 0.8666667, 0, 1, 1,
0.852653, 1.298586, 0.976616, 0.8705882, 0, 1, 1,
0.8575767, 0.716416, 0.6814016, 0.8784314, 0, 1, 1,
0.8597728, -1.350519, 3.333381, 0.8823529, 0, 1, 1,
0.8599921, -1.771335, 2.654674, 0.8901961, 0, 1, 1,
0.8630939, -0.9381905, 1.349594, 0.8941177, 0, 1, 1,
0.8630966, -1.260185, 2.317591, 0.9019608, 0, 1, 1,
0.8675115, -0.001226266, 2.727538, 0.9098039, 0, 1, 1,
0.8856243, 1.648705, -0.3044641, 0.9137255, 0, 1, 1,
0.8965492, 0.3351319, -0.197254, 0.9215686, 0, 1, 1,
0.8986506, -1.018828, 1.065668, 0.9254902, 0, 1, 1,
0.9062422, -1.741996, 1.012078, 0.9333333, 0, 1, 1,
0.9068495, -1.838385, 0.500256, 0.9372549, 0, 1, 1,
0.9221442, 1.265599, 0.9081469, 0.945098, 0, 1, 1,
0.9315559, -0.7121183, 2.748225, 0.9490196, 0, 1, 1,
0.9323511, -0.4180226, 2.284395, 0.9568627, 0, 1, 1,
0.9338295, -2.984875, 3.854693, 0.9607843, 0, 1, 1,
0.9401537, 0.750879, 2.087441, 0.9686275, 0, 1, 1,
0.9412007, 0.776063, 1.424919, 0.972549, 0, 1, 1,
0.9424632, 1.123339, -0.07694163, 0.9803922, 0, 1, 1,
0.9433485, 1.690974, 0.3615424, 0.9843137, 0, 1, 1,
0.9447603, 1.720999, 0.09759416, 0.9921569, 0, 1, 1,
0.948493, -0.2080741, 1.783771, 0.9960784, 0, 1, 1,
0.9497834, 0.5489134, 0.9249996, 1, 0, 0.9960784, 1,
0.9527432, -0.3421427, 1.749122, 1, 0, 0.9882353, 1,
0.9587763, 0.8133469, 1.373499, 1, 0, 0.9843137, 1,
0.9634352, -0.3227014, 2.391891, 1, 0, 0.9764706, 1,
0.96829, 0.09919506, 0.2925903, 1, 0, 0.972549, 1,
0.9695048, -0.2142259, 1.362676, 1, 0, 0.9647059, 1,
0.9703804, -1.376692, 2.20117, 1, 0, 0.9607843, 1,
0.9718596, -0.4243599, 2.263242, 1, 0, 0.9529412, 1,
0.9785659, 0.9647219, 0.8555908, 1, 0, 0.9490196, 1,
0.9791655, 1.00696, 3.051864, 1, 0, 0.9411765, 1,
0.9797229, -2.427997, 2.564924, 1, 0, 0.9372549, 1,
0.9884096, 1.076736, 1.305758, 1, 0, 0.9294118, 1,
0.999227, -0.4893196, 1.627522, 1, 0, 0.9254902, 1,
0.9994187, 0.2544955, 1.753621, 1, 0, 0.9176471, 1,
1.002904, 0.147414, 2.563578, 1, 0, 0.9137255, 1,
1.006019, -0.3665348, 2.433551, 1, 0, 0.9058824, 1,
1.006766, 1.015019, -2.02578, 1, 0, 0.9019608, 1,
1.013022, -1.088078, 2.964097, 1, 0, 0.8941177, 1,
1.024444, 0.4066159, 0.7309251, 1, 0, 0.8862745, 1,
1.036385, 1.481119, 1.525627, 1, 0, 0.8823529, 1,
1.041107, -0.1726694, 1.917637, 1, 0, 0.8745098, 1,
1.04704, -0.8129522, 2.456218, 1, 0, 0.8705882, 1,
1.048423, -0.9544719, 1.72944, 1, 0, 0.8627451, 1,
1.05676, -1.085311, 2.878685, 1, 0, 0.8588235, 1,
1.059007, 0.7900466, 1.371924, 1, 0, 0.8509804, 1,
1.060374, -0.362001, 1.355086, 1, 0, 0.8470588, 1,
1.067461, 0.6744365, 0.6851727, 1, 0, 0.8392157, 1,
1.068441, 0.05251403, 1.040339, 1, 0, 0.8352941, 1,
1.07567, -0.009616829, 3.015784, 1, 0, 0.827451, 1,
1.07647, -0.61889, 2.537433, 1, 0, 0.8235294, 1,
1.083556, -0.03933338, 1.128612, 1, 0, 0.8156863, 1,
1.087775, 0.01197851, 0.5149592, 1, 0, 0.8117647, 1,
1.115123, 0.9335237, -0.1541659, 1, 0, 0.8039216, 1,
1.11855, -0.09986155, 2.015155, 1, 0, 0.7960784, 1,
1.119222, -0.6923812, 1.857083, 1, 0, 0.7921569, 1,
1.120731, -0.555123, 2.160962, 1, 0, 0.7843137, 1,
1.122702, -0.6009331, 3.716623, 1, 0, 0.7803922, 1,
1.132691, -0.01767569, 0.1968, 1, 0, 0.772549, 1,
1.133636, -0.08921905, 1.668772, 1, 0, 0.7686275, 1,
1.136114, -1.704639, 2.988566, 1, 0, 0.7607843, 1,
1.140365, -0.09769505, 2.011958, 1, 0, 0.7568628, 1,
1.144743, 0.3619371, -0.333544, 1, 0, 0.7490196, 1,
1.149578, -2.331098, 2.975883, 1, 0, 0.7450981, 1,
1.150458, 0.7826821, 1.262913, 1, 0, 0.7372549, 1,
1.158638, -1.217495, 1.257027, 1, 0, 0.7333333, 1,
1.161089, -1.255207, 3.839638, 1, 0, 0.7254902, 1,
1.163975, -0.05051021, 2.44305, 1, 0, 0.7215686, 1,
1.172199, -0.484622, 2.233639, 1, 0, 0.7137255, 1,
1.176512, -0.5848579, 2.28496, 1, 0, 0.7098039, 1,
1.176701, 1.451908, -0.5375699, 1, 0, 0.7019608, 1,
1.181776, 1.213226, 1.029076, 1, 0, 0.6941177, 1,
1.201386, -0.7738816, 2.770231, 1, 0, 0.6901961, 1,
1.2018, -0.5233527, 0.6628009, 1, 0, 0.682353, 1,
1.205225, 0.497749, 2.035906, 1, 0, 0.6784314, 1,
1.20898, -0.1285653, 3.002594, 1, 0, 0.6705883, 1,
1.229319, 0.768087, 1.432621, 1, 0, 0.6666667, 1,
1.229871, -0.7072766, 0.7924049, 1, 0, 0.6588235, 1,
1.244274, -0.463242, 1.875077, 1, 0, 0.654902, 1,
1.247111, 0.4831952, 1.995227, 1, 0, 0.6470588, 1,
1.249773, -0.03280777, 2.176324, 1, 0, 0.6431373, 1,
1.255416, -1.039832, 0.05519146, 1, 0, 0.6352941, 1,
1.256348, -0.5342967, 1.415699, 1, 0, 0.6313726, 1,
1.257421, -0.2168003, 2.986949, 1, 0, 0.6235294, 1,
1.260711, -0.7131602, 0.4698803, 1, 0, 0.6196079, 1,
1.263039, -1.718296, 2.427725, 1, 0, 0.6117647, 1,
1.263644, 1.860559, 0.1037252, 1, 0, 0.6078432, 1,
1.271111, 1.442991, 1.917935, 1, 0, 0.6, 1,
1.278433, -0.2528897, 1.380485, 1, 0, 0.5921569, 1,
1.278573, 0.7705371, 0.3569778, 1, 0, 0.5882353, 1,
1.28054, 2.051568, 0.7762695, 1, 0, 0.5803922, 1,
1.281729, 1.496504, 0.3262035, 1, 0, 0.5764706, 1,
1.289617, 1.288501, 0.5216022, 1, 0, 0.5686275, 1,
1.291006, 1.922441, 0.4168109, 1, 0, 0.5647059, 1,
1.294123, 1.127961, -0.09624538, 1, 0, 0.5568628, 1,
1.300548, 0.8869001, 0.720701, 1, 0, 0.5529412, 1,
1.301358, -0.8474266, 1.702796, 1, 0, 0.5450981, 1,
1.309958, 0.03963869, 1.415543, 1, 0, 0.5411765, 1,
1.317034, 1.438278, 2.284619, 1, 0, 0.5333334, 1,
1.32353, -0.361346, 2.294091, 1, 0, 0.5294118, 1,
1.356627, -0.7423447, 1.986774, 1, 0, 0.5215687, 1,
1.356786, -0.8357542, 3.340039, 1, 0, 0.5176471, 1,
1.364888, -0.6964647, 4.116096, 1, 0, 0.509804, 1,
1.372046, 0.1369216, 2.544527, 1, 0, 0.5058824, 1,
1.373135, -1.065225, 1.175436, 1, 0, 0.4980392, 1,
1.376989, -0.3583109, 1.545458, 1, 0, 0.4901961, 1,
1.381687, 0.8897765, 0.1497173, 1, 0, 0.4862745, 1,
1.381869, -1.110083, 2.47614, 1, 0, 0.4784314, 1,
1.382235, 0.823809, 1.763895, 1, 0, 0.4745098, 1,
1.391127, -0.2033426, 1.930218, 1, 0, 0.4666667, 1,
1.404687, 0.5126811, 1.733916, 1, 0, 0.4627451, 1,
1.413176, 1.110301, 0.4425025, 1, 0, 0.454902, 1,
1.414622, 0.4479931, 0.04783706, 1, 0, 0.4509804, 1,
1.417414, -1.783359, 2.255873, 1, 0, 0.4431373, 1,
1.429274, 0.3336852, 2.257979, 1, 0, 0.4392157, 1,
1.430969, 0.916097, -0.6704062, 1, 0, 0.4313726, 1,
1.441642, 0.9144884, 0.5649012, 1, 0, 0.427451, 1,
1.454525, 0.4256953, 0.9372035, 1, 0, 0.4196078, 1,
1.454711, 0.168912, 1.308317, 1, 0, 0.4156863, 1,
1.463916, -0.6772382, 3.034211, 1, 0, 0.4078431, 1,
1.468004, 1.576279, 2.43876, 1, 0, 0.4039216, 1,
1.470222, 2.884028, 0.2200341, 1, 0, 0.3960784, 1,
1.477543, 0.2975641, 2.013136, 1, 0, 0.3882353, 1,
1.480312, -0.2079862, 1.701998, 1, 0, 0.3843137, 1,
1.525491, -0.5874684, 1.880579, 1, 0, 0.3764706, 1,
1.533172, -0.05422413, 1.908466, 1, 0, 0.372549, 1,
1.54253, 0.009491033, 1.812905, 1, 0, 0.3647059, 1,
1.543322, -1.517834, 1.765847, 1, 0, 0.3607843, 1,
1.55337, -0.6877083, 2.555282, 1, 0, 0.3529412, 1,
1.558955, -0.2033587, 1.227709, 1, 0, 0.3490196, 1,
1.561292, 0.226878, 2.266864, 1, 0, 0.3411765, 1,
1.59074, -1.484985, 1.653307, 1, 0, 0.3372549, 1,
1.591608, 0.2069744, 1.857357, 1, 0, 0.3294118, 1,
1.601611, 0.4376542, 1.685996, 1, 0, 0.3254902, 1,
1.603483, -0.9485417, 2.479136, 1, 0, 0.3176471, 1,
1.609759, -0.5445504, 4.361595, 1, 0, 0.3137255, 1,
1.627926, -0.4560585, 0.4700421, 1, 0, 0.3058824, 1,
1.635179, 2.635137, -0.1674896, 1, 0, 0.2980392, 1,
1.637916, 1.06981, 0.1382833, 1, 0, 0.2941177, 1,
1.638041, 0.5678638, 0.9906609, 1, 0, 0.2862745, 1,
1.642327, -0.6138607, 3.182971, 1, 0, 0.282353, 1,
1.65038, 0.1101242, 1.22233, 1, 0, 0.2745098, 1,
1.650713, -0.3163542, 0.6501473, 1, 0, 0.2705882, 1,
1.66771, 0.161617, 1.395341, 1, 0, 0.2627451, 1,
1.668071, 1.078608, -0.5834242, 1, 0, 0.2588235, 1,
1.677284, 0.2705798, 2.576599, 1, 0, 0.2509804, 1,
1.685073, 0.2928329, 0.3416876, 1, 0, 0.2470588, 1,
1.695792, -0.6334537, 1.773166, 1, 0, 0.2392157, 1,
1.711273, -0.8615739, 2.646102, 1, 0, 0.2352941, 1,
1.714378, 0.5575442, -0.3279182, 1, 0, 0.227451, 1,
1.731655, 1.288228, -0.2290108, 1, 0, 0.2235294, 1,
1.73893, 0.7267886, 0.4749797, 1, 0, 0.2156863, 1,
1.770538, -0.4869732, 2.34133, 1, 0, 0.2117647, 1,
1.778636, 1.415509, -0.1095714, 1, 0, 0.2039216, 1,
1.779557, -1.53431, 0.2511559, 1, 0, 0.1960784, 1,
1.802751, 0.8688371, 1.266109, 1, 0, 0.1921569, 1,
1.816451, 0.04254941, -0.4305331, 1, 0, 0.1843137, 1,
1.824415, -0.4370748, 1.529478, 1, 0, 0.1803922, 1,
1.875478, 0.9711559, 2.666895, 1, 0, 0.172549, 1,
1.905461, 1.047088, 0.5026547, 1, 0, 0.1686275, 1,
1.92624, 0.4163066, 2.438202, 1, 0, 0.1607843, 1,
1.957766, -2.045801, 3.30062, 1, 0, 0.1568628, 1,
1.960073, -0.9900184, 2.858386, 1, 0, 0.1490196, 1,
1.961336, 2.380127, 1.155804, 1, 0, 0.145098, 1,
1.974045, -1.170582, 0.7703891, 1, 0, 0.1372549, 1,
1.986314, -0.3923181, 4.064637, 1, 0, 0.1333333, 1,
1.988968, 0.1772611, 1.336456, 1, 0, 0.1254902, 1,
1.996645, 0.3065777, 1.463009, 1, 0, 0.1215686, 1,
2.005665, 0.5034365, 0.8367853, 1, 0, 0.1137255, 1,
2.020823, 1.235337, 0.9023196, 1, 0, 0.1098039, 1,
2.04193, -0.6502984, 4.354373, 1, 0, 0.1019608, 1,
2.052755, 0.2221979, 1.298827, 1, 0, 0.09411765, 1,
2.075666, -0.4134437, 1.532983, 1, 0, 0.09019608, 1,
2.07635, 1.812903, -0.05315005, 1, 0, 0.08235294, 1,
2.077689, -1.385166, 0.5133544, 1, 0, 0.07843138, 1,
2.091779, -0.2800795, 3.616185, 1, 0, 0.07058824, 1,
2.248518, 0.96106, 1.578875, 1, 0, 0.06666667, 1,
2.330607, 0.6189407, 0.7746726, 1, 0, 0.05882353, 1,
2.351648, -0.2596762, 2.381406, 1, 0, 0.05490196, 1,
2.432009, 0.1490916, 0.514618, 1, 0, 0.04705882, 1,
2.489203, -0.1924674, 1.539009, 1, 0, 0.04313726, 1,
2.497863, -2.472801, 1.972382, 1, 0, 0.03529412, 1,
2.547034, 0.3860063, 1.490548, 1, 0, 0.03137255, 1,
2.570263, -0.3895214, 1.361845, 1, 0, 0.02352941, 1,
2.588342, -2.369036, 1.783009, 1, 0, 0.01960784, 1,
3.017124, -0.1619606, 2.264416, 1, 0, 0.01176471, 1,
3.811713, -0.3053333, 1.138845, 1, 0, 0.007843138, 1
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
0.2738107, -5.080809, -7.792018, 0, -0.5, 0.5, 0.5,
0.2738107, -5.080809, -7.792018, 1, -0.5, 0.5, 0.5,
0.2738107, -5.080809, -7.792018, 1, 1.5, 0.5, 0.5,
0.2738107, -5.080809, -7.792018, 0, 1.5, 0.5, 0.5
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
-4.46344, -0.3799014, -7.792018, 0, -0.5, 0.5, 0.5,
-4.46344, -0.3799014, -7.792018, 1, -0.5, 0.5, 0.5,
-4.46344, -0.3799014, -7.792018, 1, 1.5, 0.5, 0.5,
-4.46344, -0.3799014, -7.792018, 0, 1.5, 0.5, 0.5
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
-4.46344, -5.080809, -0.4076982, 0, -0.5, 0.5, 0.5,
-4.46344, -5.080809, -0.4076982, 1, -0.5, 0.5, 0.5,
-4.46344, -5.080809, -0.4076982, 1, 1.5, 0.5, 0.5,
-4.46344, -5.080809, -0.4076982, 0, 1.5, 0.5, 0.5
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
-2, -3.995984, -6.087944,
2, -3.995984, -6.087944,
-2, -3.995984, -6.087944,
-2, -4.176788, -6.371956,
0, -3.995984, -6.087944,
0, -4.176788, -6.371956,
2, -3.995984, -6.087944,
2, -4.176788, -6.371956
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
-2, -4.538396, -6.939981, 0, -0.5, 0.5, 0.5,
-2, -4.538396, -6.939981, 1, -0.5, 0.5, 0.5,
-2, -4.538396, -6.939981, 1, 1.5, 0.5, 0.5,
-2, -4.538396, -6.939981, 0, 1.5, 0.5, 0.5,
0, -4.538396, -6.939981, 0, -0.5, 0.5, 0.5,
0, -4.538396, -6.939981, 1, -0.5, 0.5, 0.5,
0, -4.538396, -6.939981, 1, 1.5, 0.5, 0.5,
0, -4.538396, -6.939981, 0, 1.5, 0.5, 0.5,
2, -4.538396, -6.939981, 0, -0.5, 0.5, 0.5,
2, -4.538396, -6.939981, 1, -0.5, 0.5, 0.5,
2, -4.538396, -6.939981, 1, 1.5, 0.5, 0.5,
2, -4.538396, -6.939981, 0, 1.5, 0.5, 0.5
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
-3.370229, -2, -6.087944,
-3.370229, 2, -6.087944,
-3.370229, -2, -6.087944,
-3.552431, -2, -6.371956,
-3.370229, 0, -6.087944,
-3.552431, 0, -6.371956,
-3.370229, 2, -6.087944,
-3.552431, 2, -6.371956
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
-3.916834, -2, -6.939981, 0, -0.5, 0.5, 0.5,
-3.916834, -2, -6.939981, 1, -0.5, 0.5, 0.5,
-3.916834, -2, -6.939981, 1, 1.5, 0.5, 0.5,
-3.916834, -2, -6.939981, 0, 1.5, 0.5, 0.5,
-3.916834, 0, -6.939981, 0, -0.5, 0.5, 0.5,
-3.916834, 0, -6.939981, 1, -0.5, 0.5, 0.5,
-3.916834, 0, -6.939981, 1, 1.5, 0.5, 0.5,
-3.916834, 0, -6.939981, 0, 1.5, 0.5, 0.5,
-3.916834, 2, -6.939981, 0, -0.5, 0.5, 0.5,
-3.916834, 2, -6.939981, 1, -0.5, 0.5, 0.5,
-3.916834, 2, -6.939981, 1, 1.5, 0.5, 0.5,
-3.916834, 2, -6.939981, 0, 1.5, 0.5, 0.5
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
-3.370229, -3.995984, -4,
-3.370229, -3.995984, 4,
-3.370229, -3.995984, -4,
-3.552431, -4.176788, -4,
-3.370229, -3.995984, -2,
-3.552431, -4.176788, -2,
-3.370229, -3.995984, 0,
-3.552431, -4.176788, 0,
-3.370229, -3.995984, 2,
-3.552431, -4.176788, 2,
-3.370229, -3.995984, 4,
-3.552431, -4.176788, 4
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
-3.916834, -4.538396, -4, 0, -0.5, 0.5, 0.5,
-3.916834, -4.538396, -4, 1, -0.5, 0.5, 0.5,
-3.916834, -4.538396, -4, 1, 1.5, 0.5, 0.5,
-3.916834, -4.538396, -4, 0, 1.5, 0.5, 0.5,
-3.916834, -4.538396, -2, 0, -0.5, 0.5, 0.5,
-3.916834, -4.538396, -2, 1, -0.5, 0.5, 0.5,
-3.916834, -4.538396, -2, 1, 1.5, 0.5, 0.5,
-3.916834, -4.538396, -2, 0, 1.5, 0.5, 0.5,
-3.916834, -4.538396, 0, 0, -0.5, 0.5, 0.5,
-3.916834, -4.538396, 0, 1, -0.5, 0.5, 0.5,
-3.916834, -4.538396, 0, 1, 1.5, 0.5, 0.5,
-3.916834, -4.538396, 0, 0, 1.5, 0.5, 0.5,
-3.916834, -4.538396, 2, 0, -0.5, 0.5, 0.5,
-3.916834, -4.538396, 2, 1, -0.5, 0.5, 0.5,
-3.916834, -4.538396, 2, 1, 1.5, 0.5, 0.5,
-3.916834, -4.538396, 2, 0, 1.5, 0.5, 0.5,
-3.916834, -4.538396, 4, 0, -0.5, 0.5, 0.5,
-3.916834, -4.538396, 4, 1, -0.5, 0.5, 0.5,
-3.916834, -4.538396, 4, 1, 1.5, 0.5, 0.5,
-3.916834, -4.538396, 4, 0, 1.5, 0.5, 0.5
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
-3.370229, -3.995984, -6.087944,
-3.370229, 3.236181, -6.087944,
-3.370229, -3.995984, 5.272548,
-3.370229, 3.236181, 5.272548,
-3.370229, -3.995984, -6.087944,
-3.370229, -3.995984, 5.272548,
-3.370229, 3.236181, -6.087944,
-3.370229, 3.236181, 5.272548,
-3.370229, -3.995984, -6.087944,
3.91785, -3.995984, -6.087944,
-3.370229, -3.995984, 5.272548,
3.91785, -3.995984, 5.272548,
-3.370229, 3.236181, -6.087944,
3.91785, 3.236181, -6.087944,
-3.370229, 3.236181, 5.272548,
3.91785, 3.236181, 5.272548,
3.91785, -3.995984, -6.087944,
3.91785, 3.236181, -6.087944,
3.91785, -3.995984, 5.272548,
3.91785, 3.236181, 5.272548,
3.91785, -3.995984, -6.087944,
3.91785, -3.995984, 5.272548,
3.91785, 3.236181, -6.087944,
3.91785, 3.236181, 5.272548
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
var radius = 8.176725;
var distance = 36.37917;
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
mvMatrix.translate( -0.2738107, 0.3799014, 0.4076982 );
mvMatrix.scale( 1.213054, 1.222433, 0.7782088 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.37917);
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
pencycuron<-read.table("pencycuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pencycuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'pencycuron' not found
```

```r
y<-pencycuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'pencycuron' not found
```

```r
z<-pencycuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'pencycuron' not found
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
-3.264091, -0.4384297, -0.9145487, 0, 0, 1, 1, 1,
-3.049875, 0.217666, -1.541024, 1, 0, 0, 1, 1,
-2.846633, 0.4848546, -0.9288819, 1, 0, 0, 1, 1,
-2.679137, 0.4874786, -1.01938, 1, 0, 0, 1, 1,
-2.630774, 0.9995423, 0.2686091, 1, 0, 0, 1, 1,
-2.555492, 0.5279337, -2.040296, 1, 0, 0, 1, 1,
-2.551107, 0.2005433, -3.322944, 0, 0, 0, 1, 1,
-2.527011, -0.8993899, -1.865707, 0, 0, 0, 1, 1,
-2.489512, -1.597601, -2.811145, 0, 0, 0, 1, 1,
-2.364951, -0.5485451, -1.792351, 0, 0, 0, 1, 1,
-2.361302, 0.01490483, -3.082738, 0, 0, 0, 1, 1,
-2.297524, 1.27923, 0.02835082, 0, 0, 0, 1, 1,
-2.259237, -0.6386839, -4.387905, 0, 0, 0, 1, 1,
-2.19938, -0.3930565, -0.9798927, 1, 1, 1, 1, 1,
-2.149661, -3.890661, -1.28657, 1, 1, 1, 1, 1,
-2.121801, -0.1069835, -2.239972, 1, 1, 1, 1, 1,
-2.090804, -1.110008, -0.5578524, 1, 1, 1, 1, 1,
-2.086698, -0.09328846, -1.487331, 1, 1, 1, 1, 1,
-2.054767, 0.06910092, -2.27093, 1, 1, 1, 1, 1,
-2.0541, -2.025593, -2.669424, 1, 1, 1, 1, 1,
-1.98715, -0.8999372, -0.4875469, 1, 1, 1, 1, 1,
-1.961105, 0.5428189, -1.4461, 1, 1, 1, 1, 1,
-1.929161, 0.8797533, 0.3175618, 1, 1, 1, 1, 1,
-1.92342, -0.1909403, -1.537336, 1, 1, 1, 1, 1,
-1.899206, -0.6834645, -2.401064, 1, 1, 1, 1, 1,
-1.874586, 0.5362878, -0.6782211, 1, 1, 1, 1, 1,
-1.865047, -1.169155, -2.696607, 1, 1, 1, 1, 1,
-1.863816, -0.3902352, -2.895475, 1, 1, 1, 1, 1,
-1.827269, -0.4390441, -3.169983, 0, 0, 1, 1, 1,
-1.822447, -0.8714001, -1.32307, 1, 0, 0, 1, 1,
-1.79432, -1.07614, -1.6179, 1, 0, 0, 1, 1,
-1.79117, -0.02395972, -0.3546796, 1, 0, 0, 1, 1,
-1.78571, -0.415749, -1.099395, 1, 0, 0, 1, 1,
-1.784196, 0.02147714, -0.7525781, 1, 0, 0, 1, 1,
-1.777697, -0.7154725, -3.473085, 0, 0, 0, 1, 1,
-1.766203, -0.5219602, -0.6605551, 0, 0, 0, 1, 1,
-1.758995, 0.647945, -1.477465, 0, 0, 0, 1, 1,
-1.755947, -1.165239, -2.858472, 0, 0, 0, 1, 1,
-1.729443, 1.086457, 0.1085361, 0, 0, 0, 1, 1,
-1.722393, -1.392703, -3.000084, 0, 0, 0, 1, 1,
-1.72037, 1.140436, -1.519357, 0, 0, 0, 1, 1,
-1.70989, -0.2436887, -1.125728, 1, 1, 1, 1, 1,
-1.708994, -0.04116532, -0.8550595, 1, 1, 1, 1, 1,
-1.705567, -0.6553722, -1.585926, 1, 1, 1, 1, 1,
-1.684243, -0.3426118, -0.3641921, 1, 1, 1, 1, 1,
-1.682418, -0.1810826, -0.1401263, 1, 1, 1, 1, 1,
-1.677921, -1.331792, -1.503375, 1, 1, 1, 1, 1,
-1.674358, 1.091083, -1.213447, 1, 1, 1, 1, 1,
-1.667772, 0.244387, -1.099686, 1, 1, 1, 1, 1,
-1.644787, -1.167234, -3.566577, 1, 1, 1, 1, 1,
-1.616552, -1.794379, -2.562486, 1, 1, 1, 1, 1,
-1.60807, -0.8071858, -1.486874, 1, 1, 1, 1, 1,
-1.602666, 0.5467585, -0.8654427, 1, 1, 1, 1, 1,
-1.590193, 0.4672369, -0.2585445, 1, 1, 1, 1, 1,
-1.569045, -0.5124927, -3.409672, 1, 1, 1, 1, 1,
-1.557753, -1.101909, -1.239438, 1, 1, 1, 1, 1,
-1.533417, -1.597229, -1.55354, 0, 0, 1, 1, 1,
-1.532269, -0.001703273, -2.304773, 1, 0, 0, 1, 1,
-1.525269, -1.229838, -1.418289, 1, 0, 0, 1, 1,
-1.516629, -1.101465, -3.067936, 1, 0, 0, 1, 1,
-1.507942, 0.2118119, -1.223148, 1, 0, 0, 1, 1,
-1.501285, -0.3682967, -4.347307, 1, 0, 0, 1, 1,
-1.480943, -0.8926408, -0.6041382, 0, 0, 0, 1, 1,
-1.478319, -0.7927513, -2.803383, 0, 0, 0, 1, 1,
-1.473345, 1.132262, -2.140462, 0, 0, 0, 1, 1,
-1.467628, 0.2360083, 0.1470335, 0, 0, 0, 1, 1,
-1.464144, -0.9130194, -0.2862166, 0, 0, 0, 1, 1,
-1.463778, -0.2817305, -0.04815869, 0, 0, 0, 1, 1,
-1.458242, 1.725582, -0.4558201, 0, 0, 0, 1, 1,
-1.45552, 0.4301239, -0.7215085, 1, 1, 1, 1, 1,
-1.433129, 0.5179258, -1.796377, 1, 1, 1, 1, 1,
-1.429241, -0.1247821, -1.526912, 1, 1, 1, 1, 1,
-1.426556, 0.7477645, -1.406696, 1, 1, 1, 1, 1,
-1.422618, -0.7753997, -2.320513, 1, 1, 1, 1, 1,
-1.402802, 0.4244789, 0.14754, 1, 1, 1, 1, 1,
-1.401906, -0.6796572, -1.791473, 1, 1, 1, 1, 1,
-1.400073, 0.6309412, -0.2560746, 1, 1, 1, 1, 1,
-1.399633, 1.300931, -0.05602924, 1, 1, 1, 1, 1,
-1.382781, 0.5147906, -0.7231549, 1, 1, 1, 1, 1,
-1.380311, -0.8174738, -3.13241, 1, 1, 1, 1, 1,
-1.373503, 1.543126, -0.06315508, 1, 1, 1, 1, 1,
-1.368403, -1.391538, -1.556037, 1, 1, 1, 1, 1,
-1.355739, 1.833786, 0.3774779, 1, 1, 1, 1, 1,
-1.347913, 1.677791, -1.049472, 1, 1, 1, 1, 1,
-1.345301, -1.496319, -1.748071, 0, 0, 1, 1, 1,
-1.342724, 1.355576, -0.8424367, 1, 0, 0, 1, 1,
-1.331258, -0.671129, -0.9132986, 1, 0, 0, 1, 1,
-1.318283, 0.2419083, 0.2863023, 1, 0, 0, 1, 1,
-1.308683, 0.3600016, -0.3903786, 1, 0, 0, 1, 1,
-1.3041, 0.9766987, -0.4813128, 1, 0, 0, 1, 1,
-1.294738, 0.6273841, -0.1367452, 0, 0, 0, 1, 1,
-1.293405, 0.6254061, 0.03130237, 0, 0, 0, 1, 1,
-1.291247, -2.178261, -3.377342, 0, 0, 0, 1, 1,
-1.288606, -0.425924, -2.103297, 0, 0, 0, 1, 1,
-1.281691, -1.38747, -2.021601, 0, 0, 0, 1, 1,
-1.279825, -0.6829216, -3.463109, 0, 0, 0, 1, 1,
-1.275362, 0.92954, 0.9432266, 0, 0, 0, 1, 1,
-1.274327, -1.455714, -4.6982, 1, 1, 1, 1, 1,
-1.265259, 0.86019, -1.084219, 1, 1, 1, 1, 1,
-1.26482, -1.372907, -2.217769, 1, 1, 1, 1, 1,
-1.258915, 0.152884, -1.310358, 1, 1, 1, 1, 1,
-1.249602, 0.4790282, -2.193881, 1, 1, 1, 1, 1,
-1.240197, 0.5456851, -0.7469, 1, 1, 1, 1, 1,
-1.234546, -0.3375484, -1.657025, 1, 1, 1, 1, 1,
-1.231224, -0.01414726, -2.682754, 1, 1, 1, 1, 1,
-1.224726, -1.60911, -3.510772, 1, 1, 1, 1, 1,
-1.222305, 0.6198829, 0.4416747, 1, 1, 1, 1, 1,
-1.218788, 2.246496, -0.00930667, 1, 1, 1, 1, 1,
-1.21503, -0.2525724, -1.820371, 1, 1, 1, 1, 1,
-1.206875, 0.1180582, -0.2128303, 1, 1, 1, 1, 1,
-1.206626, 1.703742, 0.47605, 1, 1, 1, 1, 1,
-1.203549, 0.5104234, -2.33318, 1, 1, 1, 1, 1,
-1.198807, 1.160623, 0.7672231, 0, 0, 1, 1, 1,
-1.197848, 1.324282, -2.943936, 1, 0, 0, 1, 1,
-1.195931, -3.155764, -4.543077, 1, 0, 0, 1, 1,
-1.194411, 1.448794, -0.6780566, 1, 0, 0, 1, 1,
-1.193172, -0.03310248, -1.442712, 1, 0, 0, 1, 1,
-1.191156, 0.1691945, -2.007909, 1, 0, 0, 1, 1,
-1.186975, 0.2883392, -1.369935, 0, 0, 0, 1, 1,
-1.184422, -0.4260966, -0.866126, 0, 0, 0, 1, 1,
-1.173301, 0.6948811, -0.2110899, 0, 0, 0, 1, 1,
-1.150763, -1.290901, -2.737397, 0, 0, 0, 1, 1,
-1.149527, -0.01062176, -0.3210509, 0, 0, 0, 1, 1,
-1.145813, -0.5769874, -0.412357, 0, 0, 0, 1, 1,
-1.145253, 0.4719126, -2.39738, 0, 0, 0, 1, 1,
-1.141486, 0.5321993, -1.491403, 1, 1, 1, 1, 1,
-1.13957, 2.047745, 1.15189, 1, 1, 1, 1, 1,
-1.131343, -1.268618, -3.346335, 1, 1, 1, 1, 1,
-1.122407, -0.0615503, -1.165233, 1, 1, 1, 1, 1,
-1.113569, 1.031624, -1.312232, 1, 1, 1, 1, 1,
-1.110433, 1.939409, 0.1098082, 1, 1, 1, 1, 1,
-1.105633, -1.369451, -2.474181, 1, 1, 1, 1, 1,
-1.10183, 1.114069, 0.2750794, 1, 1, 1, 1, 1,
-1.100999, 1.494782, -2.560801, 1, 1, 1, 1, 1,
-1.099595, 0.21822, -0.6162177, 1, 1, 1, 1, 1,
-1.094946, -1.211841, -2.144188, 1, 1, 1, 1, 1,
-1.088834, 0.6431134, 0.3503698, 1, 1, 1, 1, 1,
-1.083476, 0.9346915, -0.04007225, 1, 1, 1, 1, 1,
-1.081352, 1.798249, -0.3795006, 1, 1, 1, 1, 1,
-1.080964, -0.6000693, -3.448031, 1, 1, 1, 1, 1,
-1.07956, -0.5127317, -1.034318, 0, 0, 1, 1, 1,
-1.075522, -0.4759805, -3.573704, 1, 0, 0, 1, 1,
-1.075434, 1.598258, -2.583413, 1, 0, 0, 1, 1,
-1.062709, -1.861766, -3.099643, 1, 0, 0, 1, 1,
-1.058842, 0.9559001, -0.4157731, 1, 0, 0, 1, 1,
-1.058754, 0.2334418, -1.820292, 1, 0, 0, 1, 1,
-1.057711, 2.000001, -2.015418, 0, 0, 0, 1, 1,
-1.053963, -1.702361, -3.537634, 0, 0, 0, 1, 1,
-1.053696, -0.9682169, -0.1710402, 0, 0, 0, 1, 1,
-1.053665, 0.2781029, -0.4631417, 0, 0, 0, 1, 1,
-1.052207, -0.6361529, -2.463571, 0, 0, 0, 1, 1,
-1.047567, 0.8676424, -0.7150469, 0, 0, 0, 1, 1,
-1.043899, -0.2078476, -2.02548, 0, 0, 0, 1, 1,
-1.033725, -0.3818628, -0.7472362, 1, 1, 1, 1, 1,
-1.029562, -0.004175349, -1.64198, 1, 1, 1, 1, 1,
-1.02903, -1.564666, -2.499141, 1, 1, 1, 1, 1,
-1.028961, 1.376369, -1.826133, 1, 1, 1, 1, 1,
-1.022704, -0.224899, -0.8305032, 1, 1, 1, 1, 1,
-1.021838, 0.1725796, -0.9366215, 1, 1, 1, 1, 1,
-1.021373, -0.310216, -1.89928, 1, 1, 1, 1, 1,
-1.016104, 0.2949305, -2.704861, 1, 1, 1, 1, 1,
-1.010607, 0.8276229, 0.2098049, 1, 1, 1, 1, 1,
-1.008175, -1.665784, -0.633019, 1, 1, 1, 1, 1,
-1.005921, -1.362578, -3.281636, 1, 1, 1, 1, 1,
-0.9927706, 0.4070724, -1.903182, 1, 1, 1, 1, 1,
-0.9841722, 0.181056, -1.33545, 1, 1, 1, 1, 1,
-0.9771244, 0.02239467, -2.103794, 1, 1, 1, 1, 1,
-0.9768897, -1.893271, -1.790139, 1, 1, 1, 1, 1,
-0.9754805, -0.1682542, -2.419683, 0, 0, 1, 1, 1,
-0.9751699, -0.2499626, -0.7767, 1, 0, 0, 1, 1,
-0.9704524, 1.961699, 0.5326772, 1, 0, 0, 1, 1,
-0.9632111, 2.469496, -1.228581, 1, 0, 0, 1, 1,
-0.961426, -1.154803, -2.575886, 1, 0, 0, 1, 1,
-0.9612619, 0.6864834, 0.5076728, 1, 0, 0, 1, 1,
-0.9612491, 0.3954751, -1.213838, 0, 0, 0, 1, 1,
-0.9575056, 0.6109249, -0.4472194, 0, 0, 0, 1, 1,
-0.95698, -1.413513, -1.580566, 0, 0, 0, 1, 1,
-0.9567834, 1.72748, -1.570775, 0, 0, 0, 1, 1,
-0.951274, 0.3761372, -2.450008, 0, 0, 0, 1, 1,
-0.9498696, 0.2130743, -0.009539382, 0, 0, 0, 1, 1,
-0.9429124, 0.04657699, -2.215967, 0, 0, 0, 1, 1,
-0.9406211, -0.02535287, -1.720748, 1, 1, 1, 1, 1,
-0.9365585, 0.1092021, -1.74502, 1, 1, 1, 1, 1,
-0.9362741, 0.4327789, 0.3727291, 1, 1, 1, 1, 1,
-0.9265267, -0.04503389, -0.8909509, 1, 1, 1, 1, 1,
-0.9214042, -1.785291, -1.514173, 1, 1, 1, 1, 1,
-0.9175661, -0.2289184, -0.3720273, 1, 1, 1, 1, 1,
-0.9156722, -0.166644, -2.437946, 1, 1, 1, 1, 1,
-0.9153451, 1.116311, 0.2432515, 1, 1, 1, 1, 1,
-0.912458, 2.104331, 1.324255, 1, 1, 1, 1, 1,
-0.9052609, 0.5526733, -1.219719, 1, 1, 1, 1, 1,
-0.9042854, -0.4135306, -2.280576, 1, 1, 1, 1, 1,
-0.9037498, 0.9858862, -1.151079, 1, 1, 1, 1, 1,
-0.899449, 1.082351, -1.865179, 1, 1, 1, 1, 1,
-0.8947898, 1.330345, 1.954242, 1, 1, 1, 1, 1,
-0.8921359, -0.7837949, -0.483008, 1, 1, 1, 1, 1,
-0.8907995, 0.7726253, -1.207595, 0, 0, 1, 1, 1,
-0.8902773, -1.526312, -2.142267, 1, 0, 0, 1, 1,
-0.8893657, -0.296196, -2.680332, 1, 0, 0, 1, 1,
-0.8847395, -0.8368261, -0.2030204, 1, 0, 0, 1, 1,
-0.8776901, -1.70688, -2.45358, 1, 0, 0, 1, 1,
-0.8764384, 0.7591615, -0.9949933, 1, 0, 0, 1, 1,
-0.8622172, -1.129058, -4.389501, 0, 0, 0, 1, 1,
-0.8583207, -0.5410029, -0.09691592, 0, 0, 0, 1, 1,
-0.8535349, 0.8690611, -0.3324583, 0, 0, 0, 1, 1,
-0.8521013, -0.4425417, 0.2459683, 0, 0, 0, 1, 1,
-0.8477163, -0.7927639, -3.268039, 0, 0, 0, 1, 1,
-0.8472663, 0.8459783, 0.1991976, 0, 0, 0, 1, 1,
-0.8452249, 0.06830662, -1.481271, 0, 0, 0, 1, 1,
-0.8402401, -1.263351, -2.506098, 1, 1, 1, 1, 1,
-0.8381386, 0.538755, -1.351034, 1, 1, 1, 1, 1,
-0.8281718, -0.7514748, -1.80672, 1, 1, 1, 1, 1,
-0.8257987, -0.9248513, -1.521265, 1, 1, 1, 1, 1,
-0.8239186, -0.9974687, -2.385161, 1, 1, 1, 1, 1,
-0.8189037, -0.1762531, -2.98912, 1, 1, 1, 1, 1,
-0.8171562, 0.4769955, -0.8101385, 1, 1, 1, 1, 1,
-0.8163649, 1.718956, 0.1213352, 1, 1, 1, 1, 1,
-0.8161649, 0.6909801, -2.302014, 1, 1, 1, 1, 1,
-0.8078018, 0.2415457, -0.2959692, 1, 1, 1, 1, 1,
-0.8073504, -1.026778, -2.911991, 1, 1, 1, 1, 1,
-0.7967048, 0.7349377, -1.206123, 1, 1, 1, 1, 1,
-0.7955049, 1.853528, 0.4767235, 1, 1, 1, 1, 1,
-0.7937437, -0.2298494, -1.375535, 1, 1, 1, 1, 1,
-0.7929918, -0.7907026, -0.9748856, 1, 1, 1, 1, 1,
-0.7787352, 0.08872505, -1.089376, 0, 0, 1, 1, 1,
-0.7786174, 0.6754153, -1.674719, 1, 0, 0, 1, 1,
-0.7762253, 0.3571579, -1.068412, 1, 0, 0, 1, 1,
-0.7751706, 0.6904881, 0.1902299, 1, 0, 0, 1, 1,
-0.7751067, -0.178875, -0.07706997, 1, 0, 0, 1, 1,
-0.7733405, -0.14748, -1.024548, 1, 0, 0, 1, 1,
-0.7692882, -1.618661, -2.716955, 0, 0, 0, 1, 1,
-0.747436, -2.074845, -3.221964, 0, 0, 0, 1, 1,
-0.7440166, 0.4604872, -0.5952129, 0, 0, 0, 1, 1,
-0.7381987, -0.5488653, -1.67862, 0, 0, 0, 1, 1,
-0.7358595, -0.2490059, -1.034492, 0, 0, 0, 1, 1,
-0.734104, 2.284358, 0.1450866, 0, 0, 0, 1, 1,
-0.7324518, 0.7599263, -1.599479, 0, 0, 0, 1, 1,
-0.7259619, 0.8738672, -0.8347938, 1, 1, 1, 1, 1,
-0.7161058, 0.007329291, -3.483344, 1, 1, 1, 1, 1,
-0.7160715, -0.04902964, -1.357306, 1, 1, 1, 1, 1,
-0.7159663, -0.3527328, -0.61212, 1, 1, 1, 1, 1,
-0.7145422, -0.593558, -0.5817335, 1, 1, 1, 1, 1,
-0.7097847, 0.6316373, -1.110999, 1, 1, 1, 1, 1,
-0.7080359, -1.236661, -1.768909, 1, 1, 1, 1, 1,
-0.7072946, -1.071835, -1.374197, 1, 1, 1, 1, 1,
-0.7066249, 0.07265055, -1.697794, 1, 1, 1, 1, 1,
-0.7045815, 0.2284832, -1.400223, 1, 1, 1, 1, 1,
-0.6994594, 0.3936651, 0.2234743, 1, 1, 1, 1, 1,
-0.697732, 0.639743, -1.020292, 1, 1, 1, 1, 1,
-0.6977127, -0.2578158, -0.4237113, 1, 1, 1, 1, 1,
-0.6955991, 0.6912521, 0.1253133, 1, 1, 1, 1, 1,
-0.6933541, 0.3921325, -2.264521, 1, 1, 1, 1, 1,
-0.6835896, 0.2775507, -1.275722, 0, 0, 1, 1, 1,
-0.6801363, -0.06874859, -2.438041, 1, 0, 0, 1, 1,
-0.6789409, 0.06416584, -0.9898245, 1, 0, 0, 1, 1,
-0.6766627, -0.9376886, -1.925209, 1, 0, 0, 1, 1,
-0.6695793, -0.1043656, -3.011589, 1, 0, 0, 1, 1,
-0.6615846, 0.2123601, -2.097127, 1, 0, 0, 1, 1,
-0.6540588, 0.05018012, 0.3898214, 0, 0, 0, 1, 1,
-0.6538615, 0.3256068, -0.4563587, 0, 0, 0, 1, 1,
-0.6536109, 0.7317125, -0.2804887, 0, 0, 0, 1, 1,
-0.6523772, -0.4161416, -1.831837, 0, 0, 0, 1, 1,
-0.6504657, 0.6729113, -1.140599, 0, 0, 0, 1, 1,
-0.6412484, -1.69987, -2.311181, 0, 0, 0, 1, 1,
-0.6253978, 0.5835896, -1.102185, 0, 0, 0, 1, 1,
-0.6252231, 1.60173, 0.5237542, 1, 1, 1, 1, 1,
-0.6249115, 1.764251, -0.04734211, 1, 1, 1, 1, 1,
-0.6234132, 0.6338592, -1.204085, 1, 1, 1, 1, 1,
-0.6209703, -0.1087707, -3.963874, 1, 1, 1, 1, 1,
-0.6199456, -1.684104, -3.015623, 1, 1, 1, 1, 1,
-0.6078681, 0.1547452, -1.335409, 1, 1, 1, 1, 1,
-0.6059622, 1.158861, -0.7386876, 1, 1, 1, 1, 1,
-0.6054032, 2.507859, 0.04044812, 1, 1, 1, 1, 1,
-0.6044725, 0.3743816, -0.727933, 1, 1, 1, 1, 1,
-0.6002817, -1.424807, -2.96267, 1, 1, 1, 1, 1,
-0.5989842, 0.2135373, -2.333499, 1, 1, 1, 1, 1,
-0.5974599, 0.1550383, -0.7203002, 1, 1, 1, 1, 1,
-0.5937376, 1.417374, -0.3159147, 1, 1, 1, 1, 1,
-0.592143, -0.06012187, -1.378177, 1, 1, 1, 1, 1,
-0.5889206, 2.028317, 0.6132423, 1, 1, 1, 1, 1,
-0.5861703, -0.5277779, -0.8928313, 0, 0, 1, 1, 1,
-0.5823696, -0.4769622, -2.876541, 1, 0, 0, 1, 1,
-0.5756991, 0.6478795, -0.4921116, 1, 0, 0, 1, 1,
-0.5734373, 0.775265, -0.316311, 1, 0, 0, 1, 1,
-0.5698212, 1.444419, -0.8781641, 1, 0, 0, 1, 1,
-0.5693925, 0.786878, 2.059248, 1, 0, 0, 1, 1,
-0.5691547, 0.9774446, -1.185135, 0, 0, 0, 1, 1,
-0.5652645, 0.03051551, -2.492343, 0, 0, 0, 1, 1,
-0.5581767, -0.8632134, -3.224826, 0, 0, 0, 1, 1,
-0.5550115, -0.8254415, -3.364017, 0, 0, 0, 1, 1,
-0.5482497, -1.053544, -2.686678, 0, 0, 0, 1, 1,
-0.5455615, 0.9119549, 0.1007641, 0, 0, 0, 1, 1,
-0.5423861, 1.614791, -2.117406, 0, 0, 0, 1, 1,
-0.5421101, 0.145764, -1.67602, 1, 1, 1, 1, 1,
-0.5393862, 0.6593826, -1.268705, 1, 1, 1, 1, 1,
-0.5378775, 0.03095262, -1.776307, 1, 1, 1, 1, 1,
-0.534182, -0.4165757, -2.054165, 1, 1, 1, 1, 1,
-0.5311212, 1.035038, 0.07885259, 1, 1, 1, 1, 1,
-0.5255391, 0.1409832, -2.229316, 1, 1, 1, 1, 1,
-0.520865, 2.476425, 0.348008, 1, 1, 1, 1, 1,
-0.5149575, -0.5304925, -2.198869, 1, 1, 1, 1, 1,
-0.514168, -0.3655497, -0.3595072, 1, 1, 1, 1, 1,
-0.5134952, -0.6751622, -4.280933, 1, 1, 1, 1, 1,
-0.5123199, 0.8616453, -2.427384, 1, 1, 1, 1, 1,
-0.5024186, -0.4689976, -4.198163, 1, 1, 1, 1, 1,
-0.5001554, 0.3479555, -1.508428, 1, 1, 1, 1, 1,
-0.4988189, -1.020186, -2.047905, 1, 1, 1, 1, 1,
-0.4977362, -0.4989087, -3.423379, 1, 1, 1, 1, 1,
-0.495791, 0.3153214, -1.58855, 0, 0, 1, 1, 1,
-0.4956038, 0.8626165, 0.5407142, 1, 0, 0, 1, 1,
-0.4928816, -1.514044, -4.019851, 1, 0, 0, 1, 1,
-0.4889769, -0.695773, -1.618689, 1, 0, 0, 1, 1,
-0.4881961, 0.6941547, -0.470471, 1, 0, 0, 1, 1,
-0.4809625, 0.3109181, -1.417194, 1, 0, 0, 1, 1,
-0.4799461, 1.517292, 0.1959852, 0, 0, 0, 1, 1,
-0.4775717, 0.3224059, -1.202151, 0, 0, 0, 1, 1,
-0.4771327, -0.6179309, -0.9380156, 0, 0, 0, 1, 1,
-0.4749118, -0.09975448, -1.532841, 0, 0, 0, 1, 1,
-0.4724674, 2.81007, -0.6912881, 0, 0, 0, 1, 1,
-0.4702847, 0.9766209, 0.2740521, 0, 0, 0, 1, 1,
-0.4655945, -0.09664515, -1.104903, 0, 0, 0, 1, 1,
-0.4622249, -0.7982943, -1.714867, 1, 1, 1, 1, 1,
-0.4593796, 0.3880239, -2.93324, 1, 1, 1, 1, 1,
-0.4561511, -0.9674615, -2.902466, 1, 1, 1, 1, 1,
-0.4525318, 0.4338726, 0.09844721, 1, 1, 1, 1, 1,
-0.449117, 0.7927923, -1.148489, 1, 1, 1, 1, 1,
-0.4421022, 0.495702, -2.252209, 1, 1, 1, 1, 1,
-0.4404765, 0.1824234, -2.562873, 1, 1, 1, 1, 1,
-0.4373039, -1.933493, -4.065064, 1, 1, 1, 1, 1,
-0.4349591, -1.95261, -3.967296, 1, 1, 1, 1, 1,
-0.4348357, -1.544315, -1.861113, 1, 1, 1, 1, 1,
-0.4325629, 1.227082, -1.392651, 1, 1, 1, 1, 1,
-0.4311927, -1.472702, -2.982936, 1, 1, 1, 1, 1,
-0.4288525, 0.3256679, -1.794922, 1, 1, 1, 1, 1,
-0.4260501, 1.128013, 0.2983093, 1, 1, 1, 1, 1,
-0.4238563, -2.274971, -1.534204, 1, 1, 1, 1, 1,
-0.4194228, -0.4035362, -3.229101, 0, 0, 1, 1, 1,
-0.4185828, 1.517902, 1.289212, 1, 0, 0, 1, 1,
-0.4184985, -0.9458789, -1.966193, 1, 0, 0, 1, 1,
-0.4171433, -0.6486337, -2.953247, 1, 0, 0, 1, 1,
-0.4161374, -0.8865131, -2.295346, 1, 0, 0, 1, 1,
-0.414636, -0.1246665, -1.415943, 1, 0, 0, 1, 1,
-0.4139338, 0.2093996, 1.759818, 0, 0, 0, 1, 1,
-0.4138534, 1.224228, -1.480277, 0, 0, 0, 1, 1,
-0.4135033, -0.1125555, -3.654116, 0, 0, 0, 1, 1,
-0.401052, -0.04212694, -2.882397, 0, 0, 0, 1, 1,
-0.4006538, -0.08665826, -2.59497, 0, 0, 0, 1, 1,
-0.3979361, 1.706787, -0.07690015, 0, 0, 0, 1, 1,
-0.395688, 0.08888, -1.719464, 0, 0, 0, 1, 1,
-0.3895642, -0.9962428, -0.9629105, 1, 1, 1, 1, 1,
-0.3838024, -1.341954, -2.228604, 1, 1, 1, 1, 1,
-0.3765578, 0.4692645, -1.094447, 1, 1, 1, 1, 1,
-0.3736024, 0.5689492, 0.2577551, 1, 1, 1, 1, 1,
-0.3714165, -1.940387, -1.508064, 1, 1, 1, 1, 1,
-0.3667369, -2.582319, -2.838649, 1, 1, 1, 1, 1,
-0.3646167, 0.4669674, -1.80768, 1, 1, 1, 1, 1,
-0.3641423, -2.482259, -2.590677, 1, 1, 1, 1, 1,
-0.3625512, -2.081089, -2.816325, 1, 1, 1, 1, 1,
-0.3532355, 1.240033, -2.30224, 1, 1, 1, 1, 1,
-0.3519539, 0.8453308, -1.30643, 1, 1, 1, 1, 1,
-0.3513454, -0.09832502, -2.086089, 1, 1, 1, 1, 1,
-0.3509584, 0.2838753, -0.9617047, 1, 1, 1, 1, 1,
-0.3495763, 0.5075977, -0.6682892, 1, 1, 1, 1, 1,
-0.349033, -1.101343, -3.638453, 1, 1, 1, 1, 1,
-0.3489065, 0.6395558, -0.6054502, 0, 0, 1, 1, 1,
-0.3487947, -0.6313128, -3.442728, 1, 0, 0, 1, 1,
-0.3429713, 0.6506313, -0.4922206, 1, 0, 0, 1, 1,
-0.3383879, 3.060995e-05, -2.39293, 1, 0, 0, 1, 1,
-0.3368247, 0.2343703, -1.141795, 1, 0, 0, 1, 1,
-0.332183, -1.782767, -0.9174958, 1, 0, 0, 1, 1,
-0.3312639, 1.177869, 0.3963569, 0, 0, 0, 1, 1,
-0.3310754, -0.1541068, -1.945978, 0, 0, 0, 1, 1,
-0.3271581, -0.6819091, -2.292459, 0, 0, 0, 1, 1,
-0.3226461, -0.8740952, -3.321431, 0, 0, 0, 1, 1,
-0.3179577, -1.18435, -2.581355, 0, 0, 0, 1, 1,
-0.3152552, -1.255812, -2.935959, 0, 0, 0, 1, 1,
-0.3134681, 0.5304363, 0.04293815, 0, 0, 0, 1, 1,
-0.3121486, 0.1668367, -0.7940371, 1, 1, 1, 1, 1,
-0.3105829, -1.32975, -2.450677, 1, 1, 1, 1, 1,
-0.3025185, -1.268955, -3.609071, 1, 1, 1, 1, 1,
-0.3023913, -1.219648, -2.353182, 1, 1, 1, 1, 1,
-0.3005313, -1.193239, -3.117304, 1, 1, 1, 1, 1,
-0.3001314, -0.3432246, -2.972115, 1, 1, 1, 1, 1,
-0.297334, -0.9313543, -2.775592, 1, 1, 1, 1, 1,
-0.2958758, 0.3998543, -1.561409, 1, 1, 1, 1, 1,
-0.2937931, -0.1819483, -1.558343, 1, 1, 1, 1, 1,
-0.2932654, 0.1348257, 0.6877106, 1, 1, 1, 1, 1,
-0.2917375, -0.2681974, -2.587855, 1, 1, 1, 1, 1,
-0.2916338, -2.157872, -3.52424, 1, 1, 1, 1, 1,
-0.2909852, -0.5065389, -2.338357, 1, 1, 1, 1, 1,
-0.2908716, 0.2341363, -0.8575571, 1, 1, 1, 1, 1,
-0.2724778, 0.02749799, 0.2506238, 1, 1, 1, 1, 1,
-0.2615861, 0.04715387, -1.465914, 0, 0, 1, 1, 1,
-0.2614677, -2.1157, -3.671116, 1, 0, 0, 1, 1,
-0.260622, 0.9121729, -0.4365008, 1, 0, 0, 1, 1,
-0.2603603, 0.3067533, 0.5063307, 1, 0, 0, 1, 1,
-0.2598201, -0.09348781, -2.790295, 1, 0, 0, 1, 1,
-0.2579359, -0.4375553, -2.276795, 1, 0, 0, 1, 1,
-0.2536489, -1.080019, -2.36182, 0, 0, 0, 1, 1,
-0.2425362, 0.3945645, 0.4706011, 0, 0, 0, 1, 1,
-0.240749, -0.1585831, -1.854995, 0, 0, 0, 1, 1,
-0.2302816, -0.4404793, -1.443018, 0, 0, 0, 1, 1,
-0.2301075, 1.86524, 0.573045, 0, 0, 0, 1, 1,
-0.2295461, -0.07237162, -2.76988, 0, 0, 0, 1, 1,
-0.2289525, -0.7555437, -2.704684, 0, 0, 0, 1, 1,
-0.2274351, -0.5803967, -2.526435, 1, 1, 1, 1, 1,
-0.2264453, -0.3382109, -2.517086, 1, 1, 1, 1, 1,
-0.2253232, 1.799235, -1.043814, 1, 1, 1, 1, 1,
-0.2222447, 0.3081416, -0.4698831, 1, 1, 1, 1, 1,
-0.2165652, 0.4780718, 2.102616, 1, 1, 1, 1, 1,
-0.2128582, -0.6554568, -3.186867, 1, 1, 1, 1, 1,
-0.2126442, 1.33351, -2.313026, 1, 1, 1, 1, 1,
-0.2109798, -2.17983, -2.439523, 1, 1, 1, 1, 1,
-0.2079737, 1.761538, 0.8039607, 1, 1, 1, 1, 1,
-0.2077991, 0.2165485, -1.239931, 1, 1, 1, 1, 1,
-0.2074852, 0.8863078, -1.082593, 1, 1, 1, 1, 1,
-0.2058057, 0.8349462, -0.1846568, 1, 1, 1, 1, 1,
-0.2040112, -0.1284851, -2.381515, 1, 1, 1, 1, 1,
-0.203495, -0.2118067, -3.603135, 1, 1, 1, 1, 1,
-0.2001571, -1.739164, -3.592686, 1, 1, 1, 1, 1,
-0.1997263, -0.009806923, -2.358598, 0, 0, 1, 1, 1,
-0.199549, -1.321603, -2.779418, 1, 0, 0, 1, 1,
-0.1962725, -0.8483338, -2.915211, 1, 0, 0, 1, 1,
-0.1955273, -0.7444386, -1.200307, 1, 0, 0, 1, 1,
-0.1936517, 0.571889, 0.1839587, 1, 0, 0, 1, 1,
-0.1866505, 0.4699798, 0.48929, 1, 0, 0, 1, 1,
-0.1851007, -0.08390617, -2.236156, 0, 0, 0, 1, 1,
-0.183907, 1.765381, -0.3442865, 0, 0, 0, 1, 1,
-0.1823595, 0.1585309, -1.632664, 0, 0, 0, 1, 1,
-0.1710743, 1.236347, -0.8877181, 0, 0, 0, 1, 1,
-0.1710331, -0.8931101, -3.610828, 0, 0, 0, 1, 1,
-0.1663537, 0.7485585, -0.3317127, 0, 0, 0, 1, 1,
-0.165502, 0.1826224, -0.7470442, 0, 0, 0, 1, 1,
-0.1623505, -0.7835538, -4.789749, 1, 1, 1, 1, 1,
-0.1602419, 0.391248, -0.8972708, 1, 1, 1, 1, 1,
-0.1596837, 0.139883, -1.355288, 1, 1, 1, 1, 1,
-0.1574064, 1.412429, 1.281547, 1, 1, 1, 1, 1,
-0.157253, 0.9672524, -0.01877427, 1, 1, 1, 1, 1,
-0.1528518, 1.348873, 1.465762, 1, 1, 1, 1, 1,
-0.1505517, -0.400802, -4.313365, 1, 1, 1, 1, 1,
-0.1472749, -0.03191515, -0.7767061, 1, 1, 1, 1, 1,
-0.1469228, -0.4617122, -1.136888, 1, 1, 1, 1, 1,
-0.1444064, -0.1545475, -1.788535, 1, 1, 1, 1, 1,
-0.1430119, -0.4289466, -1.48459, 1, 1, 1, 1, 1,
-0.1383816, 0.5139324, -0.8332791, 1, 1, 1, 1, 1,
-0.1346452, -1.319005, -3.4226, 1, 1, 1, 1, 1,
-0.1337768, -1.385099, -2.580419, 1, 1, 1, 1, 1,
-0.1321839, 1.71598, -0.748409, 1, 1, 1, 1, 1,
-0.1311041, -0.2163381, -3.514123, 0, 0, 1, 1, 1,
-0.1309768, 0.08138032, 0.5101765, 1, 0, 0, 1, 1,
-0.1305019, -1.808657, -2.103624, 1, 0, 0, 1, 1,
-0.1265548, 0.2158049, 0.1747087, 1, 0, 0, 1, 1,
-0.1237136, -0.5188549, -3.432624, 1, 0, 0, 1, 1,
-0.1206384, -0.1018191, -0.5355947, 1, 0, 0, 1, 1,
-0.1204711, -0.5739359, -0.9601115, 0, 0, 0, 1, 1,
-0.1185697, 1.213756, -0.56628, 0, 0, 0, 1, 1,
-0.1145748, 0.993866, -0.9254065, 0, 0, 0, 1, 1,
-0.1144397, 0.1652946, 0.116026, 0, 0, 0, 1, 1,
-0.1134208, 0.4304305, 1.037483, 0, 0, 0, 1, 1,
-0.1039953, 0.6008193, -0.6070803, 0, 0, 0, 1, 1,
-0.103394, -0.4200363, -5.9225, 0, 0, 0, 1, 1,
-0.0987323, -0.9122811, -1.248868, 1, 1, 1, 1, 1,
-0.09674753, -0.6861294, -2.623779, 1, 1, 1, 1, 1,
-0.09556174, 0.2409821, -1.188177, 1, 1, 1, 1, 1,
-0.09471522, -0.01034729, -2.351798, 1, 1, 1, 1, 1,
-0.09449518, -1.255242, -1.144221, 1, 1, 1, 1, 1,
-0.0932326, -0.3322172, -3.533623, 1, 1, 1, 1, 1,
-0.09039996, -0.9515801, -3.175266, 1, 1, 1, 1, 1,
-0.08972456, -0.006521848, -2.406946, 1, 1, 1, 1, 1,
-0.08625626, 0.2374536, -1.88124, 1, 1, 1, 1, 1,
-0.08351276, -0.8101149, -2.572508, 1, 1, 1, 1, 1,
-0.08222059, -1.978974, -3.187621, 1, 1, 1, 1, 1,
-0.07665341, -1.642853, -2.182719, 1, 1, 1, 1, 1,
-0.07319488, 1.320143, -1.128822, 1, 1, 1, 1, 1,
-0.07229456, 1.114279, -0.1843401, 1, 1, 1, 1, 1,
-0.07110488, -0.2529085, -3.00727, 1, 1, 1, 1, 1,
-0.06706153, 2.843441, 1.601572, 0, 0, 1, 1, 1,
-0.06684327, 0.6514759, -0.8414605, 1, 0, 0, 1, 1,
-0.06449682, 1.634033, -0.08164898, 1, 0, 0, 1, 1,
-0.06277008, 1.23951, -1.057635, 1, 0, 0, 1, 1,
-0.06071519, 2.375731, -0.4460521, 1, 0, 0, 1, 1,
-0.05819459, 1.784842, -0.09999979, 1, 0, 0, 1, 1,
-0.05221765, 0.2807713, -0.6748039, 0, 0, 0, 1, 1,
-0.05192906, -0.09952374, -3.692935, 0, 0, 0, 1, 1,
-0.04675941, -0.9724305, -2.972216, 0, 0, 0, 1, 1,
-0.04125499, -1.27506, -3.307805, 0, 0, 0, 1, 1,
-0.04105179, 1.270415, -0.8279906, 0, 0, 0, 1, 1,
-0.04048994, 0.03748962, -1.024175, 0, 0, 0, 1, 1,
-0.03952058, 0.4273386, 0.2852359, 0, 0, 0, 1, 1,
-0.0359914, -0.1676707, -2.219462, 1, 1, 1, 1, 1,
-0.03350289, -0.3788489, -2.435286, 1, 1, 1, 1, 1,
-0.03236784, 0.9769411, 0.1534304, 1, 1, 1, 1, 1,
-0.03190278, 0.1776296, 0.399329, 1, 1, 1, 1, 1,
-0.03164325, -0.006187548, -1.693274, 1, 1, 1, 1, 1,
-0.03112265, 0.829442, -1.100445, 1, 1, 1, 1, 1,
-0.02922154, -0.6390368, -2.067192, 1, 1, 1, 1, 1,
-0.02609793, 1.541522, 0.9350172, 1, 1, 1, 1, 1,
-0.02536403, -0.2949893, -2.87035, 1, 1, 1, 1, 1,
-0.02151406, -0.6849285, -3.896963, 1, 1, 1, 1, 1,
-0.01951373, -1.577196, -3.493881, 1, 1, 1, 1, 1,
-0.01407969, 1.362504, -1.40533, 1, 1, 1, 1, 1,
-0.01355765, 0.3379507, 2.039464, 1, 1, 1, 1, 1,
-0.01340078, 0.6706885, 0.1795405, 1, 1, 1, 1, 1,
-0.004442214, -0.5454279, -3.423424, 1, 1, 1, 1, 1,
-0.003376129, -0.5100512, -4.093663, 0, 0, 1, 1, 1,
-0.00163531, -0.6358992, -3.082601, 1, 0, 0, 1, 1,
-0.001134232, -1.337637, -3.705788, 1, 0, 0, 1, 1,
-0.0002093662, 0.3631403, -0.8336245, 1, 0, 0, 1, 1,
0.002677856, 0.06499757, 1.014268, 1, 0, 0, 1, 1,
0.003528819, -0.8943123, 1.652704, 1, 0, 0, 1, 1,
0.004133874, 1.259017, -1.94419, 0, 0, 0, 1, 1,
0.005814447, 1.996731, -1.07844, 0, 0, 0, 1, 1,
0.01109055, 0.4668509, 0.3936872, 0, 0, 0, 1, 1,
0.01723915, -1.463786, 3.233817, 0, 0, 0, 1, 1,
0.02556425, 1.99907, 0.4444174, 0, 0, 0, 1, 1,
0.02596158, -0.6152322, 3.277476, 0, 0, 0, 1, 1,
0.02914876, -0.4271139, 4.584702, 0, 0, 0, 1, 1,
0.03885708, -0.3978941, 3.146105, 1, 1, 1, 1, 1,
0.04065945, -2.206367, 3.347342, 1, 1, 1, 1, 1,
0.04165462, -0.7409959, 2.684855, 1, 1, 1, 1, 1,
0.04191411, -0.837864, 3.730918, 1, 1, 1, 1, 1,
0.0427157, -0.8933656, 4.14287, 1, 1, 1, 1, 1,
0.04590428, 0.4458708, 0.7211554, 1, 1, 1, 1, 1,
0.04749486, -0.3225553, 2.334659, 1, 1, 1, 1, 1,
0.04875932, 2.194823, -1.115376, 1, 1, 1, 1, 1,
0.05221935, 0.008663601, 1.067887, 1, 1, 1, 1, 1,
0.05501598, 0.4782971, 0.3966498, 1, 1, 1, 1, 1,
0.06715533, -0.3358822, 3.573277, 1, 1, 1, 1, 1,
0.06833243, 0.8248644, 0.6174599, 1, 1, 1, 1, 1,
0.07806628, 0.591221, 0.1101436, 1, 1, 1, 1, 1,
0.07882993, -0.7047347, 2.580013, 1, 1, 1, 1, 1,
0.07896083, -0.4805084, 3.102202, 1, 1, 1, 1, 1,
0.08085484, -0.5523385, 4.306023, 0, 0, 1, 1, 1,
0.08173203, 0.04084004, 0.6394163, 1, 0, 0, 1, 1,
0.08286924, -1.459239, 3.36393, 1, 0, 0, 1, 1,
0.08297808, -0.1592472, 1.858907, 1, 0, 0, 1, 1,
0.08557247, 0.5401365, 0.5914527, 1, 0, 0, 1, 1,
0.0857929, -0.5863273, 1.976156, 1, 0, 0, 1, 1,
0.08756619, 0.1889718, -0.4631611, 0, 0, 0, 1, 1,
0.09041605, 0.3389429, 1.119975, 0, 0, 0, 1, 1,
0.09042168, -0.469489, 3.576156, 0, 0, 0, 1, 1,
0.09291681, 0.8065286, 2.610384, 0, 0, 0, 1, 1,
0.09310028, -0.1715161, 2.259149, 0, 0, 0, 1, 1,
0.0938591, 0.7718942, -0.4253388, 0, 0, 0, 1, 1,
0.09722121, 0.6619556, -0.09011051, 0, 0, 0, 1, 1,
0.09951448, -0.1243806, 3.212432, 1, 1, 1, 1, 1,
0.1000795, 0.2968644, 0.09666412, 1, 1, 1, 1, 1,
0.1011874, 1.452659, -0.2378696, 1, 1, 1, 1, 1,
0.1028079, -0.1244926, 2.303453, 1, 1, 1, 1, 1,
0.1048134, -1.037572, 2.77453, 1, 1, 1, 1, 1,
0.1083533, -1.129951, 3.159106, 1, 1, 1, 1, 1,
0.1124694, -0.6911469, 3.311399, 1, 1, 1, 1, 1,
0.1124864, 1.002541, -0.3451017, 1, 1, 1, 1, 1,
0.1247188, 0.02254498, 1.605418, 1, 1, 1, 1, 1,
0.1249493, 0.02020492, 0.7729971, 1, 1, 1, 1, 1,
0.1262825, 0.2340811, -0.1118443, 1, 1, 1, 1, 1,
0.1266555, -0.4924833, 1.174176, 1, 1, 1, 1, 1,
0.1272669, 1.609232, 0.4489242, 1, 1, 1, 1, 1,
0.1283437, -0.8074508, 2.04651, 1, 1, 1, 1, 1,
0.1347074, 2.206982, 0.219196, 1, 1, 1, 1, 1,
0.1349011, 0.1055921, 2.117423, 0, 0, 1, 1, 1,
0.1367115, -0.7036006, 0.9971043, 1, 0, 0, 1, 1,
0.1393301, -1.111857, 2.819392, 1, 0, 0, 1, 1,
0.1394007, -0.8136994, 2.227023, 1, 0, 0, 1, 1,
0.1394275, -1.1892, 3.154589, 1, 0, 0, 1, 1,
0.1427802, -0.5814137, 1.778233, 1, 0, 0, 1, 1,
0.1455187, 0.2558873, 0.9506993, 0, 0, 0, 1, 1,
0.1520875, -0.4175186, 1.824147, 0, 0, 0, 1, 1,
0.156757, 0.4971222, 1.401047, 0, 0, 0, 1, 1,
0.156776, 0.4375953, 2.682315, 0, 0, 0, 1, 1,
0.1573149, 0.2406861, 1.139517, 0, 0, 0, 1, 1,
0.1579581, -1.419748, 0.5144842, 0, 0, 0, 1, 1,
0.1594114, 1.27568, 2.135898, 0, 0, 0, 1, 1,
0.1598831, -0.1030709, 3.327164, 1, 1, 1, 1, 1,
0.1716552, -2.072925, 3.26653, 1, 1, 1, 1, 1,
0.174054, 1.172588, 0.6130086, 1, 1, 1, 1, 1,
0.1754301, 0.8663987, 0.5731881, 1, 1, 1, 1, 1,
0.1761261, -0.0820471, 1.777841, 1, 1, 1, 1, 1,
0.1767323, 0.3144071, 2.148906, 1, 1, 1, 1, 1,
0.181162, -0.7785556, 2.462979, 1, 1, 1, 1, 1,
0.1836796, -1.245527, 3.555636, 1, 1, 1, 1, 1,
0.1839788, -0.8514286, 2.442137, 1, 1, 1, 1, 1,
0.1860177, -0.8178804, 3.045445, 1, 1, 1, 1, 1,
0.1909472, -2.480743, 4.786057, 1, 1, 1, 1, 1,
0.1912058, 1.234866, -0.1833575, 1, 1, 1, 1, 1,
0.1946805, 1.545577, 0.2047423, 1, 1, 1, 1, 1,
0.1947192, -0.7826695, 2.139876, 1, 1, 1, 1, 1,
0.199079, -1.027779, 4.39292, 1, 1, 1, 1, 1,
0.2058895, -0.06971499, 1.075232, 0, 0, 1, 1, 1,
0.2064641, 1.735951, 0.3029196, 1, 0, 0, 1, 1,
0.2156844, 0.6732694, 0.7406176, 1, 0, 0, 1, 1,
0.2163481, -0.3248579, 1.818982, 1, 0, 0, 1, 1,
0.2175502, 1.128257, -0.1881434, 1, 0, 0, 1, 1,
0.2193593, 0.3338013, -1.135444, 1, 0, 0, 1, 1,
0.2200627, 0.4434851, -1.272119, 0, 0, 0, 1, 1,
0.2224384, 0.1485486, 0.7659528, 0, 0, 0, 1, 1,
0.2283835, 0.612598, 0.06344969, 0, 0, 0, 1, 1,
0.2291978, 0.04168913, 2.931574, 0, 0, 0, 1, 1,
0.2308859, -2.6606, 4.525139, 0, 0, 0, 1, 1,
0.2309756, 0.4886278, 0.9839329, 0, 0, 0, 1, 1,
0.2315414, -0.9016393, 5.107104, 0, 0, 0, 1, 1,
0.2320405, -0.1037671, 1.249159, 1, 1, 1, 1, 1,
0.2321718, -0.8338073, 2.832189, 1, 1, 1, 1, 1,
0.2332572, 0.1561323, -0.0955615, 1, 1, 1, 1, 1,
0.2367449, 0.2756252, 0.5848052, 1, 1, 1, 1, 1,
0.2371449, -0.3444372, 1.397956, 1, 1, 1, 1, 1,
0.2374238, 0.7169432, -0.6650041, 1, 1, 1, 1, 1,
0.2374953, -1.461176, 3.206808, 1, 1, 1, 1, 1,
0.2423696, 0.03984858, 1.347429, 1, 1, 1, 1, 1,
0.2521529, -0.3348324, 2.992602, 1, 1, 1, 1, 1,
0.2525568, -0.2561901, 1.080122, 1, 1, 1, 1, 1,
0.2535694, 2.340529, -0.1201429, 1, 1, 1, 1, 1,
0.2548687, -0.7457452, 1.004526, 1, 1, 1, 1, 1,
0.2555585, -0.285808, 0.89882, 1, 1, 1, 1, 1,
0.2571985, 0.4842083, -0.4793346, 1, 1, 1, 1, 1,
0.2582423, 1.052112, 1.647857, 1, 1, 1, 1, 1,
0.2591842, -0.1622558, 1.717403, 0, 0, 1, 1, 1,
0.2640193, -0.0005357199, 1.495722, 1, 0, 0, 1, 1,
0.2666467, 1.122575, -0.18208, 1, 0, 0, 1, 1,
0.2687964, 0.4875732, 1.949188, 1, 0, 0, 1, 1,
0.2714402, -0.2915331, 1.539198, 1, 0, 0, 1, 1,
0.274465, -1.331227, 3.818128, 1, 0, 0, 1, 1,
0.2770562, -0.6740989, 1.741707, 0, 0, 0, 1, 1,
0.281205, -0.03249443, 2.04653, 0, 0, 0, 1, 1,
0.2838987, 0.5615668, 0.8592457, 0, 0, 0, 1, 1,
0.2858116, -1.805961, 4.273405, 0, 0, 0, 1, 1,
0.28689, -1.81545, 2.92781, 0, 0, 0, 1, 1,
0.2883247, 0.4203679, 0.8008263, 0, 0, 0, 1, 1,
0.2899016, -1.705436, 3.452376, 0, 0, 0, 1, 1,
0.2938559, 0.1819145, 0.8507591, 1, 1, 1, 1, 1,
0.2952848, -0.6366153, 4.089457, 1, 1, 1, 1, 1,
0.295817, 1.76832, -0.08074705, 1, 1, 1, 1, 1,
0.3046863, -0.3528945, 1.937485, 1, 1, 1, 1, 1,
0.304692, 0.3616499, 2.914965, 1, 1, 1, 1, 1,
0.3048674, -1.178563, 3.240813, 1, 1, 1, 1, 1,
0.3053361, 0.1823987, -0.5283826, 1, 1, 1, 1, 1,
0.3067945, 1.948958, 1.110557, 1, 1, 1, 1, 1,
0.3159575, 0.08182999, 0.9326631, 1, 1, 1, 1, 1,
0.3171832, -0.2522323, 1.462738, 1, 1, 1, 1, 1,
0.3173248, 0.7991527, 0.4162359, 1, 1, 1, 1, 1,
0.3224209, -1.096634, 4.149467, 1, 1, 1, 1, 1,
0.3253583, 0.4174948, -0.4414757, 1, 1, 1, 1, 1,
0.3258985, 0.1124228, 1.516977, 1, 1, 1, 1, 1,
0.328056, -0.3178452, -0.9220533, 1, 1, 1, 1, 1,
0.3337199, 0.04716486, 2.203755, 0, 0, 1, 1, 1,
0.3341327, -0.7082167, 3.445224, 1, 0, 0, 1, 1,
0.3341409, -0.6733648, 1.897091, 1, 0, 0, 1, 1,
0.3347076, 0.3755229, -0.3280025, 1, 0, 0, 1, 1,
0.3360877, 0.8633528, -0.7063119, 1, 0, 0, 1, 1,
0.3399366, -0.1327021, 1.912636, 1, 0, 0, 1, 1,
0.3406632, -0.6257548, 3.175157, 0, 0, 0, 1, 1,
0.3408752, -1.157118, 3.587469, 0, 0, 0, 1, 1,
0.341124, 1.959229, 1.482405, 0, 0, 0, 1, 1,
0.3411791, -1.020227, 2.723576, 0, 0, 0, 1, 1,
0.3465309, 2.654675, -0.0322769, 0, 0, 0, 1, 1,
0.3483796, -1.860098, 3.140295, 0, 0, 0, 1, 1,
0.3488945, -0.6300731, 2.877761, 0, 0, 0, 1, 1,
0.3491762, -0.2156478, 1.677933, 1, 1, 1, 1, 1,
0.3522256, -0.9633836, 2.188716, 1, 1, 1, 1, 1,
0.3531412, -0.9632292, 4.085251, 1, 1, 1, 1, 1,
0.358021, 0.2959991, 0.9074019, 1, 1, 1, 1, 1,
0.3586516, 1.467749, 0.9343886, 1, 1, 1, 1, 1,
0.3604615, 1.347112, -0.6990238, 1, 1, 1, 1, 1,
0.3608499, 0.4863183, -0.05286372, 1, 1, 1, 1, 1,
0.3715841, 0.1014197, 2.56595, 1, 1, 1, 1, 1,
0.3740214, -1.528548, 3.426337, 1, 1, 1, 1, 1,
0.3746395, -2.428349, 2.890741, 1, 1, 1, 1, 1,
0.3771433, -1.00032, 2.777293, 1, 1, 1, 1, 1,
0.3789302, -0.8616759, 4.216035, 1, 1, 1, 1, 1,
0.3851676, 1.335088, 0.468949, 1, 1, 1, 1, 1,
0.38708, -2.087665, 4.26669, 1, 1, 1, 1, 1,
0.392415, 0.1677782, -0.3096836, 1, 1, 1, 1, 1,
0.3954181, 3.130858, -0.5318731, 0, 0, 1, 1, 1,
0.3969326, -1.53853, 3.761893, 1, 0, 0, 1, 1,
0.3976169, 0.6269376, 1.885988, 1, 0, 0, 1, 1,
0.3994161, 1.012902, -0.1828404, 1, 0, 0, 1, 1,
0.4005202, -0.4208439, 4.462623, 1, 0, 0, 1, 1,
0.4005562, -0.08097809, 1.631333, 1, 0, 0, 1, 1,
0.4023016, 0.1921998, -0.02905183, 0, 0, 0, 1, 1,
0.4086544, 1.072018, 0.2255894, 0, 0, 0, 1, 1,
0.4112244, 0.8268977, 0.7379347, 0, 0, 0, 1, 1,
0.4118002, -0.7879591, 2.279981, 0, 0, 0, 1, 1,
0.4181549, -1.287266, 3.162497, 0, 0, 0, 1, 1,
0.4224367, 1.793544, 1.486977, 0, 0, 0, 1, 1,
0.4255221, -0.09792181, 2.384623, 0, 0, 0, 1, 1,
0.432107, 0.5390876, 2.11747, 1, 1, 1, 1, 1,
0.4365745, -0.1580615, 2.859502, 1, 1, 1, 1, 1,
0.4392435, -1.549662, 4.685234, 1, 1, 1, 1, 1,
0.4394839, -0.3678047, 2.151664, 1, 1, 1, 1, 1,
0.4421895, -0.9865146, 2.357785, 1, 1, 1, 1, 1,
0.4433229, -1.436894, 3.565809, 1, 1, 1, 1, 1,
0.4496138, 1.139238, -0.6507789, 1, 1, 1, 1, 1,
0.4615041, -0.3155522, 3.168868, 1, 1, 1, 1, 1,
0.4646219, -1.362055, 2.863833, 1, 1, 1, 1, 1,
0.4680831, 1.432203, -0.06819905, 1, 1, 1, 1, 1,
0.4693292, 0.8438926, 1.955604, 1, 1, 1, 1, 1,
0.4738277, -0.4545043, 1.668554, 1, 1, 1, 1, 1,
0.4754962, 0.8968513, 2.605622, 1, 1, 1, 1, 1,
0.4757688, 0.5563555, 0.5454666, 1, 1, 1, 1, 1,
0.4786333, 0.1390816, 0.753439, 1, 1, 1, 1, 1,
0.478766, -0.3071679, 2.776806, 0, 0, 1, 1, 1,
0.4853171, 0.4181333, 1.454285, 1, 0, 0, 1, 1,
0.4960035, 1.534533, 0.3172419, 1, 0, 0, 1, 1,
0.499097, 0.3145805, 2.071124, 1, 0, 0, 1, 1,
0.5084594, 0.2834367, 1.520707, 1, 0, 0, 1, 1,
0.512345, -1.489087, 2.894477, 1, 0, 0, 1, 1,
0.5172068, -0.8322263, 3.997565, 0, 0, 0, 1, 1,
0.5265529, 0.3233274, 0.5162305, 0, 0, 0, 1, 1,
0.5269359, 1.204382, 1.135214, 0, 0, 0, 1, 1,
0.5336449, 0.03054348, 0.4890457, 0, 0, 0, 1, 1,
0.5381237, 0.4215362, 0.1532497, 0, 0, 0, 1, 1,
0.5427945, 0.1978222, -0.2891301, 0, 0, 0, 1, 1,
0.542998, -1.22149, 3.463684, 0, 0, 0, 1, 1,
0.5456812, 0.2030144, 0.253983, 1, 1, 1, 1, 1,
0.5463537, -0.101442, 0.8208478, 1, 1, 1, 1, 1,
0.5469654, -0.6423935, 0.9803461, 1, 1, 1, 1, 1,
0.5509143, -0.439346, 2.0003, 1, 1, 1, 1, 1,
0.5532976, 1.585716, -0.9141742, 1, 1, 1, 1, 1,
0.555221, 0.4946627, 2.271922, 1, 1, 1, 1, 1,
0.5564328, 0.09754997, 1.18871, 1, 1, 1, 1, 1,
0.5619344, -0.1017026, 0.1179544, 1, 1, 1, 1, 1,
0.5623717, -1.219318, 3.881774, 1, 1, 1, 1, 1,
0.562456, 0.5845103, -2.0616, 1, 1, 1, 1, 1,
0.5672287, 1.655336, 0.5405104, 1, 1, 1, 1, 1,
0.5676747, 0.04368539, 1.828248, 1, 1, 1, 1, 1,
0.5761935, 0.8423506, 1.51147, 1, 1, 1, 1, 1,
0.5796005, 1.377319, 1.686083, 1, 1, 1, 1, 1,
0.5827393, 1.086897, -1.041738, 1, 1, 1, 1, 1,
0.5831494, 0.9390627, 0.8487504, 0, 0, 1, 1, 1,
0.5844809, 0.4978664, 1.051681, 1, 0, 0, 1, 1,
0.5939842, 0.5369658, 0.7325323, 1, 0, 0, 1, 1,
0.5957097, -0.3836055, -0.2526844, 1, 0, 0, 1, 1,
0.5975381, 0.4932931, -0.4434246, 1, 0, 0, 1, 1,
0.5979002, 0.338958, 0.5398178, 1, 0, 0, 1, 1,
0.5982248, 0.08223263, 3.423865, 0, 0, 0, 1, 1,
0.5995077, 0.1217474, -0.1027871, 0, 0, 0, 1, 1,
0.6013735, -0.6256587, 2.217805, 0, 0, 0, 1, 1,
0.6041934, 0.351853, -0.3997503, 0, 0, 0, 1, 1,
0.6089817, -0.6808626, 2.267032, 0, 0, 0, 1, 1,
0.6121494, 1.498078, 1.119047, 0, 0, 0, 1, 1,
0.6182375, 1.364025, 1.40588, 0, 0, 0, 1, 1,
0.6189995, -0.3412571, 1.954929, 1, 1, 1, 1, 1,
0.6201805, 0.5505545, 0.5216249, 1, 1, 1, 1, 1,
0.6220034, 0.195901, 2.651877, 1, 1, 1, 1, 1,
0.6237632, 0.3725946, 0.2522883, 1, 1, 1, 1, 1,
0.6320542, 0.3429733, 0.9146369, 1, 1, 1, 1, 1,
0.6385323, -0.08916761, 2.452218, 1, 1, 1, 1, 1,
0.6445379, -2.535687, 4.45655, 1, 1, 1, 1, 1,
0.6502385, -0.5529275, 1.41218, 1, 1, 1, 1, 1,
0.6524435, 0.3831781, 1.994133, 1, 1, 1, 1, 1,
0.6529149, -1.377718, 4.284148, 1, 1, 1, 1, 1,
0.6540366, -0.2114128, 1.092983, 1, 1, 1, 1, 1,
0.6543273, -2.368444, 1.218881, 1, 1, 1, 1, 1,
0.6558874, -1.707762, 1.388168, 1, 1, 1, 1, 1,
0.6564414, -0.02372431, 0.06558406, 1, 1, 1, 1, 1,
0.6590357, 2.647406, 0.8470722, 1, 1, 1, 1, 1,
0.6625517, 0.2136276, 1.286199, 0, 0, 1, 1, 1,
0.6689214, -1.454745, 2.787021, 1, 0, 0, 1, 1,
0.6700061, -0.8812622, 0.7217152, 1, 0, 0, 1, 1,
0.6709581, -0.009740673, 2.094592, 1, 0, 0, 1, 1,
0.6718527, 0.04906711, 3.457019, 1, 0, 0, 1, 1,
0.6818706, -1.301183, 2.956182, 1, 0, 0, 1, 1,
0.6822495, 0.06203375, 1.431974, 0, 0, 0, 1, 1,
0.682463, -1.091143, 2.731905, 0, 0, 0, 1, 1,
0.6851693, 1.09498, 0.9288793, 0, 0, 0, 1, 1,
0.6874745, -0.6070187, 0.962414, 0, 0, 0, 1, 1,
0.6890833, -2.593996, 3.246956, 0, 0, 0, 1, 1,
0.6905645, -2.57637, 4.029771, 0, 0, 0, 1, 1,
0.6935924, -0.8945939, 1.876165, 0, 0, 0, 1, 1,
0.6996573, -1.783853, 2.369498, 1, 1, 1, 1, 1,
0.7013482, -0.2735626, 2.186459, 1, 1, 1, 1, 1,
0.7020396, 1.044161, 1.065398, 1, 1, 1, 1, 1,
0.703153, -0.37423, 1.88767, 1, 1, 1, 1, 1,
0.7048659, 0.2278785, -0.3138792, 1, 1, 1, 1, 1,
0.7080263, -0.6088532, 2.57333, 1, 1, 1, 1, 1,
0.7101309, -2.549292, 1.415747, 1, 1, 1, 1, 1,
0.7187274, -0.3884889, 1.856146, 1, 1, 1, 1, 1,
0.7195016, -0.7603591, 2.937472, 1, 1, 1, 1, 1,
0.726994, 1.459523, -0.2585672, 1, 1, 1, 1, 1,
0.7279777, -2.209414, 4.697447, 1, 1, 1, 1, 1,
0.7385195, -0.4400317, 1.476504, 1, 1, 1, 1, 1,
0.7410974, -0.4132137, 2.296332, 1, 1, 1, 1, 1,
0.7429892, 0.49889, 1.043807, 1, 1, 1, 1, 1,
0.7433385, 0.8462203, 1.143639, 1, 1, 1, 1, 1,
0.7450083, 1.414859, 2.773395, 0, 0, 1, 1, 1,
0.745167, 1.015571, -0.9987129, 1, 0, 0, 1, 1,
0.7577102, -0.2281624, 1.171381, 1, 0, 0, 1, 1,
0.7654627, 0.01358839, 2.1998, 1, 0, 0, 1, 1,
0.76557, -1.100396, 4.195621, 1, 0, 0, 1, 1,
0.7663789, 0.5969741, 1.335005, 1, 0, 0, 1, 1,
0.7671962, 0.09983365, 0.9155715, 0, 0, 0, 1, 1,
0.7705374, 1.366691, 1.701516, 0, 0, 0, 1, 1,
0.7734799, 0.01553696, -0.07101694, 0, 0, 0, 1, 1,
0.7770185, 0.9275392, -0.004632, 0, 0, 0, 1, 1,
0.7774444, 1.0215, -0.4294399, 0, 0, 0, 1, 1,
0.7808822, -0.4242838, 2.688281, 0, 0, 0, 1, 1,
0.7911261, -0.3232602, 2.783772, 0, 0, 0, 1, 1,
0.7924927, -0.3289317, 2.026232, 1, 1, 1, 1, 1,
0.7961508, 0.05585019, 2.065035, 1, 1, 1, 1, 1,
0.7967845, 0.1480816, 1.574559, 1, 1, 1, 1, 1,
0.7974368, -1.020025, 1.922652, 1, 1, 1, 1, 1,
0.7990691, -1.25773, 2.030741, 1, 1, 1, 1, 1,
0.8020418, 0.0868104, -0.01320823, 1, 1, 1, 1, 1,
0.8032194, -0.6990994, 0.3462427, 1, 1, 1, 1, 1,
0.8116221, 0.5583341, 0.930491, 1, 1, 1, 1, 1,
0.8162538, -0.6875017, 2.442281, 1, 1, 1, 1, 1,
0.8223942, -0.006321507, 3.339726, 1, 1, 1, 1, 1,
0.8347431, -0.9341409, 2.143703, 1, 1, 1, 1, 1,
0.8451014, -1.461662, 3.139871, 1, 1, 1, 1, 1,
0.8471087, -0.2651564, 2.353967, 1, 1, 1, 1, 1,
0.8475176, 0.5188876, 2.454681, 1, 1, 1, 1, 1,
0.8514725, -0.2415564, 3.751963, 1, 1, 1, 1, 1,
0.852653, 1.298586, 0.976616, 0, 0, 1, 1, 1,
0.8575767, 0.716416, 0.6814016, 1, 0, 0, 1, 1,
0.8597728, -1.350519, 3.333381, 1, 0, 0, 1, 1,
0.8599921, -1.771335, 2.654674, 1, 0, 0, 1, 1,
0.8630939, -0.9381905, 1.349594, 1, 0, 0, 1, 1,
0.8630966, -1.260185, 2.317591, 1, 0, 0, 1, 1,
0.8675115, -0.001226266, 2.727538, 0, 0, 0, 1, 1,
0.8856243, 1.648705, -0.3044641, 0, 0, 0, 1, 1,
0.8965492, 0.3351319, -0.197254, 0, 0, 0, 1, 1,
0.8986506, -1.018828, 1.065668, 0, 0, 0, 1, 1,
0.9062422, -1.741996, 1.012078, 0, 0, 0, 1, 1,
0.9068495, -1.838385, 0.500256, 0, 0, 0, 1, 1,
0.9221442, 1.265599, 0.9081469, 0, 0, 0, 1, 1,
0.9315559, -0.7121183, 2.748225, 1, 1, 1, 1, 1,
0.9323511, -0.4180226, 2.284395, 1, 1, 1, 1, 1,
0.9338295, -2.984875, 3.854693, 1, 1, 1, 1, 1,
0.9401537, 0.750879, 2.087441, 1, 1, 1, 1, 1,
0.9412007, 0.776063, 1.424919, 1, 1, 1, 1, 1,
0.9424632, 1.123339, -0.07694163, 1, 1, 1, 1, 1,
0.9433485, 1.690974, 0.3615424, 1, 1, 1, 1, 1,
0.9447603, 1.720999, 0.09759416, 1, 1, 1, 1, 1,
0.948493, -0.2080741, 1.783771, 1, 1, 1, 1, 1,
0.9497834, 0.5489134, 0.9249996, 1, 1, 1, 1, 1,
0.9527432, -0.3421427, 1.749122, 1, 1, 1, 1, 1,
0.9587763, 0.8133469, 1.373499, 1, 1, 1, 1, 1,
0.9634352, -0.3227014, 2.391891, 1, 1, 1, 1, 1,
0.96829, 0.09919506, 0.2925903, 1, 1, 1, 1, 1,
0.9695048, -0.2142259, 1.362676, 1, 1, 1, 1, 1,
0.9703804, -1.376692, 2.20117, 0, 0, 1, 1, 1,
0.9718596, -0.4243599, 2.263242, 1, 0, 0, 1, 1,
0.9785659, 0.9647219, 0.8555908, 1, 0, 0, 1, 1,
0.9791655, 1.00696, 3.051864, 1, 0, 0, 1, 1,
0.9797229, -2.427997, 2.564924, 1, 0, 0, 1, 1,
0.9884096, 1.076736, 1.305758, 1, 0, 0, 1, 1,
0.999227, -0.4893196, 1.627522, 0, 0, 0, 1, 1,
0.9994187, 0.2544955, 1.753621, 0, 0, 0, 1, 1,
1.002904, 0.147414, 2.563578, 0, 0, 0, 1, 1,
1.006019, -0.3665348, 2.433551, 0, 0, 0, 1, 1,
1.006766, 1.015019, -2.02578, 0, 0, 0, 1, 1,
1.013022, -1.088078, 2.964097, 0, 0, 0, 1, 1,
1.024444, 0.4066159, 0.7309251, 0, 0, 0, 1, 1,
1.036385, 1.481119, 1.525627, 1, 1, 1, 1, 1,
1.041107, -0.1726694, 1.917637, 1, 1, 1, 1, 1,
1.04704, -0.8129522, 2.456218, 1, 1, 1, 1, 1,
1.048423, -0.9544719, 1.72944, 1, 1, 1, 1, 1,
1.05676, -1.085311, 2.878685, 1, 1, 1, 1, 1,
1.059007, 0.7900466, 1.371924, 1, 1, 1, 1, 1,
1.060374, -0.362001, 1.355086, 1, 1, 1, 1, 1,
1.067461, 0.6744365, 0.6851727, 1, 1, 1, 1, 1,
1.068441, 0.05251403, 1.040339, 1, 1, 1, 1, 1,
1.07567, -0.009616829, 3.015784, 1, 1, 1, 1, 1,
1.07647, -0.61889, 2.537433, 1, 1, 1, 1, 1,
1.083556, -0.03933338, 1.128612, 1, 1, 1, 1, 1,
1.087775, 0.01197851, 0.5149592, 1, 1, 1, 1, 1,
1.115123, 0.9335237, -0.1541659, 1, 1, 1, 1, 1,
1.11855, -0.09986155, 2.015155, 1, 1, 1, 1, 1,
1.119222, -0.6923812, 1.857083, 0, 0, 1, 1, 1,
1.120731, -0.555123, 2.160962, 1, 0, 0, 1, 1,
1.122702, -0.6009331, 3.716623, 1, 0, 0, 1, 1,
1.132691, -0.01767569, 0.1968, 1, 0, 0, 1, 1,
1.133636, -0.08921905, 1.668772, 1, 0, 0, 1, 1,
1.136114, -1.704639, 2.988566, 1, 0, 0, 1, 1,
1.140365, -0.09769505, 2.011958, 0, 0, 0, 1, 1,
1.144743, 0.3619371, -0.333544, 0, 0, 0, 1, 1,
1.149578, -2.331098, 2.975883, 0, 0, 0, 1, 1,
1.150458, 0.7826821, 1.262913, 0, 0, 0, 1, 1,
1.158638, -1.217495, 1.257027, 0, 0, 0, 1, 1,
1.161089, -1.255207, 3.839638, 0, 0, 0, 1, 1,
1.163975, -0.05051021, 2.44305, 0, 0, 0, 1, 1,
1.172199, -0.484622, 2.233639, 1, 1, 1, 1, 1,
1.176512, -0.5848579, 2.28496, 1, 1, 1, 1, 1,
1.176701, 1.451908, -0.5375699, 1, 1, 1, 1, 1,
1.181776, 1.213226, 1.029076, 1, 1, 1, 1, 1,
1.201386, -0.7738816, 2.770231, 1, 1, 1, 1, 1,
1.2018, -0.5233527, 0.6628009, 1, 1, 1, 1, 1,
1.205225, 0.497749, 2.035906, 1, 1, 1, 1, 1,
1.20898, -0.1285653, 3.002594, 1, 1, 1, 1, 1,
1.229319, 0.768087, 1.432621, 1, 1, 1, 1, 1,
1.229871, -0.7072766, 0.7924049, 1, 1, 1, 1, 1,
1.244274, -0.463242, 1.875077, 1, 1, 1, 1, 1,
1.247111, 0.4831952, 1.995227, 1, 1, 1, 1, 1,
1.249773, -0.03280777, 2.176324, 1, 1, 1, 1, 1,
1.255416, -1.039832, 0.05519146, 1, 1, 1, 1, 1,
1.256348, -0.5342967, 1.415699, 1, 1, 1, 1, 1,
1.257421, -0.2168003, 2.986949, 0, 0, 1, 1, 1,
1.260711, -0.7131602, 0.4698803, 1, 0, 0, 1, 1,
1.263039, -1.718296, 2.427725, 1, 0, 0, 1, 1,
1.263644, 1.860559, 0.1037252, 1, 0, 0, 1, 1,
1.271111, 1.442991, 1.917935, 1, 0, 0, 1, 1,
1.278433, -0.2528897, 1.380485, 1, 0, 0, 1, 1,
1.278573, 0.7705371, 0.3569778, 0, 0, 0, 1, 1,
1.28054, 2.051568, 0.7762695, 0, 0, 0, 1, 1,
1.281729, 1.496504, 0.3262035, 0, 0, 0, 1, 1,
1.289617, 1.288501, 0.5216022, 0, 0, 0, 1, 1,
1.291006, 1.922441, 0.4168109, 0, 0, 0, 1, 1,
1.294123, 1.127961, -0.09624538, 0, 0, 0, 1, 1,
1.300548, 0.8869001, 0.720701, 0, 0, 0, 1, 1,
1.301358, -0.8474266, 1.702796, 1, 1, 1, 1, 1,
1.309958, 0.03963869, 1.415543, 1, 1, 1, 1, 1,
1.317034, 1.438278, 2.284619, 1, 1, 1, 1, 1,
1.32353, -0.361346, 2.294091, 1, 1, 1, 1, 1,
1.356627, -0.7423447, 1.986774, 1, 1, 1, 1, 1,
1.356786, -0.8357542, 3.340039, 1, 1, 1, 1, 1,
1.364888, -0.6964647, 4.116096, 1, 1, 1, 1, 1,
1.372046, 0.1369216, 2.544527, 1, 1, 1, 1, 1,
1.373135, -1.065225, 1.175436, 1, 1, 1, 1, 1,
1.376989, -0.3583109, 1.545458, 1, 1, 1, 1, 1,
1.381687, 0.8897765, 0.1497173, 1, 1, 1, 1, 1,
1.381869, -1.110083, 2.47614, 1, 1, 1, 1, 1,
1.382235, 0.823809, 1.763895, 1, 1, 1, 1, 1,
1.391127, -0.2033426, 1.930218, 1, 1, 1, 1, 1,
1.404687, 0.5126811, 1.733916, 1, 1, 1, 1, 1,
1.413176, 1.110301, 0.4425025, 0, 0, 1, 1, 1,
1.414622, 0.4479931, 0.04783706, 1, 0, 0, 1, 1,
1.417414, -1.783359, 2.255873, 1, 0, 0, 1, 1,
1.429274, 0.3336852, 2.257979, 1, 0, 0, 1, 1,
1.430969, 0.916097, -0.6704062, 1, 0, 0, 1, 1,
1.441642, 0.9144884, 0.5649012, 1, 0, 0, 1, 1,
1.454525, 0.4256953, 0.9372035, 0, 0, 0, 1, 1,
1.454711, 0.168912, 1.308317, 0, 0, 0, 1, 1,
1.463916, -0.6772382, 3.034211, 0, 0, 0, 1, 1,
1.468004, 1.576279, 2.43876, 0, 0, 0, 1, 1,
1.470222, 2.884028, 0.2200341, 0, 0, 0, 1, 1,
1.477543, 0.2975641, 2.013136, 0, 0, 0, 1, 1,
1.480312, -0.2079862, 1.701998, 0, 0, 0, 1, 1,
1.525491, -0.5874684, 1.880579, 1, 1, 1, 1, 1,
1.533172, -0.05422413, 1.908466, 1, 1, 1, 1, 1,
1.54253, 0.009491033, 1.812905, 1, 1, 1, 1, 1,
1.543322, -1.517834, 1.765847, 1, 1, 1, 1, 1,
1.55337, -0.6877083, 2.555282, 1, 1, 1, 1, 1,
1.558955, -0.2033587, 1.227709, 1, 1, 1, 1, 1,
1.561292, 0.226878, 2.266864, 1, 1, 1, 1, 1,
1.59074, -1.484985, 1.653307, 1, 1, 1, 1, 1,
1.591608, 0.2069744, 1.857357, 1, 1, 1, 1, 1,
1.601611, 0.4376542, 1.685996, 1, 1, 1, 1, 1,
1.603483, -0.9485417, 2.479136, 1, 1, 1, 1, 1,
1.609759, -0.5445504, 4.361595, 1, 1, 1, 1, 1,
1.627926, -0.4560585, 0.4700421, 1, 1, 1, 1, 1,
1.635179, 2.635137, -0.1674896, 1, 1, 1, 1, 1,
1.637916, 1.06981, 0.1382833, 1, 1, 1, 1, 1,
1.638041, 0.5678638, 0.9906609, 0, 0, 1, 1, 1,
1.642327, -0.6138607, 3.182971, 1, 0, 0, 1, 1,
1.65038, 0.1101242, 1.22233, 1, 0, 0, 1, 1,
1.650713, -0.3163542, 0.6501473, 1, 0, 0, 1, 1,
1.66771, 0.161617, 1.395341, 1, 0, 0, 1, 1,
1.668071, 1.078608, -0.5834242, 1, 0, 0, 1, 1,
1.677284, 0.2705798, 2.576599, 0, 0, 0, 1, 1,
1.685073, 0.2928329, 0.3416876, 0, 0, 0, 1, 1,
1.695792, -0.6334537, 1.773166, 0, 0, 0, 1, 1,
1.711273, -0.8615739, 2.646102, 0, 0, 0, 1, 1,
1.714378, 0.5575442, -0.3279182, 0, 0, 0, 1, 1,
1.731655, 1.288228, -0.2290108, 0, 0, 0, 1, 1,
1.73893, 0.7267886, 0.4749797, 0, 0, 0, 1, 1,
1.770538, -0.4869732, 2.34133, 1, 1, 1, 1, 1,
1.778636, 1.415509, -0.1095714, 1, 1, 1, 1, 1,
1.779557, -1.53431, 0.2511559, 1, 1, 1, 1, 1,
1.802751, 0.8688371, 1.266109, 1, 1, 1, 1, 1,
1.816451, 0.04254941, -0.4305331, 1, 1, 1, 1, 1,
1.824415, -0.4370748, 1.529478, 1, 1, 1, 1, 1,
1.875478, 0.9711559, 2.666895, 1, 1, 1, 1, 1,
1.905461, 1.047088, 0.5026547, 1, 1, 1, 1, 1,
1.92624, 0.4163066, 2.438202, 1, 1, 1, 1, 1,
1.957766, -2.045801, 3.30062, 1, 1, 1, 1, 1,
1.960073, -0.9900184, 2.858386, 1, 1, 1, 1, 1,
1.961336, 2.380127, 1.155804, 1, 1, 1, 1, 1,
1.974045, -1.170582, 0.7703891, 1, 1, 1, 1, 1,
1.986314, -0.3923181, 4.064637, 1, 1, 1, 1, 1,
1.988968, 0.1772611, 1.336456, 1, 1, 1, 1, 1,
1.996645, 0.3065777, 1.463009, 0, 0, 1, 1, 1,
2.005665, 0.5034365, 0.8367853, 1, 0, 0, 1, 1,
2.020823, 1.235337, 0.9023196, 1, 0, 0, 1, 1,
2.04193, -0.6502984, 4.354373, 1, 0, 0, 1, 1,
2.052755, 0.2221979, 1.298827, 1, 0, 0, 1, 1,
2.075666, -0.4134437, 1.532983, 1, 0, 0, 1, 1,
2.07635, 1.812903, -0.05315005, 0, 0, 0, 1, 1,
2.077689, -1.385166, 0.5133544, 0, 0, 0, 1, 1,
2.091779, -0.2800795, 3.616185, 0, 0, 0, 1, 1,
2.248518, 0.96106, 1.578875, 0, 0, 0, 1, 1,
2.330607, 0.6189407, 0.7746726, 0, 0, 0, 1, 1,
2.351648, -0.2596762, 2.381406, 0, 0, 0, 1, 1,
2.432009, 0.1490916, 0.514618, 0, 0, 0, 1, 1,
2.489203, -0.1924674, 1.539009, 1, 1, 1, 1, 1,
2.497863, -2.472801, 1.972382, 1, 1, 1, 1, 1,
2.547034, 0.3860063, 1.490548, 1, 1, 1, 1, 1,
2.570263, -0.3895214, 1.361845, 1, 1, 1, 1, 1,
2.588342, -2.369036, 1.783009, 1, 1, 1, 1, 1,
3.017124, -0.1619606, 2.264416, 1, 1, 1, 1, 1,
3.811713, -0.3053333, 1.138845, 1, 1, 1, 1, 1
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
var radius = 10.04452;
var distance = 35.28096;
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
mvMatrix.translate( -0.2738109, 0.3799014, 0.4076982 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.28096);
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
