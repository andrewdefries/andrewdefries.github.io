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
-3.265482, -0.8122514, -2.564677, 1, 0, 0, 1,
-3.087204, -0.09766003, -2.148615, 1, 0.007843138, 0, 1,
-3.055927, -0.4254411, -2.243218, 1, 0.01176471, 0, 1,
-2.784415, -0.6128302, -2.957169, 1, 0.01960784, 0, 1,
-2.72491, -1.101379, -1.877662, 1, 0.02352941, 0, 1,
-2.53584, -1.987029, -1.668494, 1, 0.03137255, 0, 1,
-2.394194, -1.026808, -2.611627, 1, 0.03529412, 0, 1,
-2.373471, -0.45437, -2.098371, 1, 0.04313726, 0, 1,
-2.372563, 0.6547493, -3.058735, 1, 0.04705882, 0, 1,
-2.358306, 0.7801815, -1.064496, 1, 0.05490196, 0, 1,
-2.346932, -0.5167949, -1.748023, 1, 0.05882353, 0, 1,
-2.289047, -0.4554535, -2.44398, 1, 0.06666667, 0, 1,
-2.283647, 1.382325, 0.6260943, 1, 0.07058824, 0, 1,
-2.283593, -1.905997, -0.9363542, 1, 0.07843138, 0, 1,
-2.210779, 0.7252958, -2.194483, 1, 0.08235294, 0, 1,
-2.194914, 0.9912605, -2.593949, 1, 0.09019608, 0, 1,
-2.161492, -0.06598905, -3.032307, 1, 0.09411765, 0, 1,
-2.145537, -0.7167147, -1.553292, 1, 0.1019608, 0, 1,
-2.106855, 0.4727633, -1.000067, 1, 0.1098039, 0, 1,
-2.075838, -1.054923, -1.072505, 1, 0.1137255, 0, 1,
-2.075111, -1.498919, -3.625515, 1, 0.1215686, 0, 1,
-2.073891, -0.0224746, -1.62209, 1, 0.1254902, 0, 1,
-2.070933, 0.8248463, -2.608037, 1, 0.1333333, 0, 1,
-2.00892, 0.5169725, -1.31807, 1, 0.1372549, 0, 1,
-1.982455, -1.099987, -1.0806, 1, 0.145098, 0, 1,
-1.968932, -1.03387, -2.418921, 1, 0.1490196, 0, 1,
-1.956393, -0.7897226, -3.657482, 1, 0.1568628, 0, 1,
-1.938327, 0.2581987, -1.280392, 1, 0.1607843, 0, 1,
-1.925345, -0.6027757, -1.889319, 1, 0.1686275, 0, 1,
-1.920397, -1.494364, -1.886351, 1, 0.172549, 0, 1,
-1.891212, 0.004241738, -1.373682, 1, 0.1803922, 0, 1,
-1.887419, 0.3329732, -1.218136, 1, 0.1843137, 0, 1,
-1.839107, -0.6844687, -4.090376, 1, 0.1921569, 0, 1,
-1.830428, 1.033003, -0.7079104, 1, 0.1960784, 0, 1,
-1.827264, -1.097906, -1.363157, 1, 0.2039216, 0, 1,
-1.825999, -0.1918493, -0.2043986, 1, 0.2117647, 0, 1,
-1.804307, -0.3468886, -2.977416, 1, 0.2156863, 0, 1,
-1.801859, -1.105555, -4.323567, 1, 0.2235294, 0, 1,
-1.775103, -0.2191975, -1.658865, 1, 0.227451, 0, 1,
-1.767596, 1.071993, -1.152851, 1, 0.2352941, 0, 1,
-1.764375, -0.9488485, -1.242609, 1, 0.2392157, 0, 1,
-1.76211, -0.5446933, -0.7120798, 1, 0.2470588, 0, 1,
-1.758506, -0.8039151, -2.041337, 1, 0.2509804, 0, 1,
-1.754864, 0.5076249, 1.398702, 1, 0.2588235, 0, 1,
-1.746697, 1.240813, -2.366824, 1, 0.2627451, 0, 1,
-1.723609, 2.146835, 0.5616608, 1, 0.2705882, 0, 1,
-1.722332, 0.622508, -1.545621, 1, 0.2745098, 0, 1,
-1.714285, 1.543525, -1.021476, 1, 0.282353, 0, 1,
-1.712388, 1.862824, -1.163979, 1, 0.2862745, 0, 1,
-1.704765, -0.3108013, -3.389424, 1, 0.2941177, 0, 1,
-1.701417, -1.358754, -2.306296, 1, 0.3019608, 0, 1,
-1.676174, -1.121712, -1.804077, 1, 0.3058824, 0, 1,
-1.668682, 0.5521098, -1.890253, 1, 0.3137255, 0, 1,
-1.657804, -0.2520773, -2.19614, 1, 0.3176471, 0, 1,
-1.647694, 1.109753, -2.000821, 1, 0.3254902, 0, 1,
-1.615648, -0.06878913, -0.5260198, 1, 0.3294118, 0, 1,
-1.609735, -0.212414, -2.038502, 1, 0.3372549, 0, 1,
-1.609492, -0.1861473, -2.805703, 1, 0.3411765, 0, 1,
-1.576138, 0.1480889, -3.723578, 1, 0.3490196, 0, 1,
-1.574491, 0.9505623, -1.340549, 1, 0.3529412, 0, 1,
-1.563195, 1.120058, -1.094315, 1, 0.3607843, 0, 1,
-1.5525, -0.9097682, -2.714006, 1, 0.3647059, 0, 1,
-1.550967, 0.09633851, -1.289875, 1, 0.372549, 0, 1,
-1.543388, 0.3086143, -0.435718, 1, 0.3764706, 0, 1,
-1.529433, 0.1038194, -2.015217, 1, 0.3843137, 0, 1,
-1.523023, 1.204975, -0.6661192, 1, 0.3882353, 0, 1,
-1.523004, 0.09611677, -2.615724, 1, 0.3960784, 0, 1,
-1.521111, -0.05523711, -2.554019, 1, 0.4039216, 0, 1,
-1.514511, -0.1970091, -2.629832, 1, 0.4078431, 0, 1,
-1.505527, -1.691953, -3.455071, 1, 0.4156863, 0, 1,
-1.504564, -0.8499566, -1.919389, 1, 0.4196078, 0, 1,
-1.501981, -0.1220446, -1.24797, 1, 0.427451, 0, 1,
-1.492626, -1.117869, -1.96812, 1, 0.4313726, 0, 1,
-1.492237, 0.9758713, -0.6165899, 1, 0.4392157, 0, 1,
-1.490257, -1.449148, -3.419705, 1, 0.4431373, 0, 1,
-1.489871, -1.909022, -3.69349, 1, 0.4509804, 0, 1,
-1.478431, -1.060246, -2.995195, 1, 0.454902, 0, 1,
-1.473042, 0.8365031, -2.375964, 1, 0.4627451, 0, 1,
-1.467638, -1.259998, -1.433565, 1, 0.4666667, 0, 1,
-1.467127, -0.0320405, -1.501734, 1, 0.4745098, 0, 1,
-1.463426, -0.6893468, -3.255929, 1, 0.4784314, 0, 1,
-1.456178, 2.786417, -0.5774373, 1, 0.4862745, 0, 1,
-1.453458, 0.1128248, -0.6156666, 1, 0.4901961, 0, 1,
-1.445663, -0.3083303, -1.841768, 1, 0.4980392, 0, 1,
-1.438718, 0.2097272, 0.1258793, 1, 0.5058824, 0, 1,
-1.437222, 0.1297215, -1.692447, 1, 0.509804, 0, 1,
-1.423607, 0.5412853, -1.331244, 1, 0.5176471, 0, 1,
-1.421055, -1.301328, -2.06023, 1, 0.5215687, 0, 1,
-1.419371, -1.84158, -2.684335, 1, 0.5294118, 0, 1,
-1.416104, -1.312783, -3.97491, 1, 0.5333334, 0, 1,
-1.401185, 1.318744, -1.702754, 1, 0.5411765, 0, 1,
-1.396955, -0.730589, -0.4197519, 1, 0.5450981, 0, 1,
-1.381296, -1.199247, -1.877372, 1, 0.5529412, 0, 1,
-1.380072, 0.3738056, -0.483718, 1, 0.5568628, 0, 1,
-1.37496, -1.468783, -1.558643, 1, 0.5647059, 0, 1,
-1.355914, 0.3702982, -1.273432, 1, 0.5686275, 0, 1,
-1.350345, 0.5777696, -0.4742505, 1, 0.5764706, 0, 1,
-1.346709, 0.0761459, -1.467215, 1, 0.5803922, 0, 1,
-1.344887, -1.887322, -2.122879, 1, 0.5882353, 0, 1,
-1.340903, 1.589364, -1.257972, 1, 0.5921569, 0, 1,
-1.334057, 0.9111282, -0.4934443, 1, 0.6, 0, 1,
-1.327457, 2.132144, -0.1972067, 1, 0.6078432, 0, 1,
-1.325117, -1.823686, -2.900028, 1, 0.6117647, 0, 1,
-1.311511, -1.441114, -2.673676, 1, 0.6196079, 0, 1,
-1.310033, 0.1105647, -3.417278, 1, 0.6235294, 0, 1,
-1.300633, 0.2270527, 0.4780957, 1, 0.6313726, 0, 1,
-1.300481, 0.9222944, -0.02888032, 1, 0.6352941, 0, 1,
-1.29994, 0.4696603, -2.016764, 1, 0.6431373, 0, 1,
-1.292596, 1.424887, -2.380803, 1, 0.6470588, 0, 1,
-1.29123, -1.116113, -3.150626, 1, 0.654902, 0, 1,
-1.290647, -1.344536, -2.647106, 1, 0.6588235, 0, 1,
-1.289649, 0.2219523, -0.1062044, 1, 0.6666667, 0, 1,
-1.274433, -0.1674005, -2.457157, 1, 0.6705883, 0, 1,
-1.27032, -0.6723375, -1.036052, 1, 0.6784314, 0, 1,
-1.258221, 1.713925, -1.992697, 1, 0.682353, 0, 1,
-1.257059, 1.407595, -1.563064, 1, 0.6901961, 0, 1,
-1.250074, 0.5998896, -0.1379739, 1, 0.6941177, 0, 1,
-1.244445, 1.26853, 1.680737, 1, 0.7019608, 0, 1,
-1.241638, -0.04228183, -1.793817, 1, 0.7098039, 0, 1,
-1.241179, 1.474221, -2.33272, 1, 0.7137255, 0, 1,
-1.235507, -0.9593151, -1.731851, 1, 0.7215686, 0, 1,
-1.234795, 0.630909, -0.02741644, 1, 0.7254902, 0, 1,
-1.230479, 0.5340056, 0.3563266, 1, 0.7333333, 0, 1,
-1.221695, 1.412735, -0.5141709, 1, 0.7372549, 0, 1,
-1.220644, 0.6317053, -1.336554, 1, 0.7450981, 0, 1,
-1.212722, 0.7516724, -1.341724, 1, 0.7490196, 0, 1,
-1.211781, 0.5072967, -3.0878, 1, 0.7568628, 0, 1,
-1.209723, -0.4483503, -0.815928, 1, 0.7607843, 0, 1,
-1.208569, 0.5363653, -1.617745, 1, 0.7686275, 0, 1,
-1.185039, 2.47571, 1.580413, 1, 0.772549, 0, 1,
-1.182459, -0.6393019, -0.7061577, 1, 0.7803922, 0, 1,
-1.179007, 0.8016196, 0.1604661, 1, 0.7843137, 0, 1,
-1.177384, -1.565373, -1.130739, 1, 0.7921569, 0, 1,
-1.173822, 0.6415758, 0.230545, 1, 0.7960784, 0, 1,
-1.161414, -1.767749, -5.014462, 1, 0.8039216, 0, 1,
-1.160542, 0.3130607, -1.160408, 1, 0.8117647, 0, 1,
-1.158014, -0.5856898, -2.881212, 1, 0.8156863, 0, 1,
-1.157673, -1.142617, -2.299862, 1, 0.8235294, 0, 1,
-1.157553, 0.7491509, -0.09684595, 1, 0.827451, 0, 1,
-1.153205, 1.025238, 0.07175077, 1, 0.8352941, 0, 1,
-1.146596, 0.153557, -1.200216, 1, 0.8392157, 0, 1,
-1.142268, 1.535064, 0.1881287, 1, 0.8470588, 0, 1,
-1.141882, -0.02222051, -2.977483, 1, 0.8509804, 0, 1,
-1.134685, 1.00117, -0.2061141, 1, 0.8588235, 0, 1,
-1.126752, 1.024772, 0.2400509, 1, 0.8627451, 0, 1,
-1.121118, -1.084462, -2.327621, 1, 0.8705882, 0, 1,
-1.11472, -1.758111, -0.4700711, 1, 0.8745098, 0, 1,
-1.110638, 0.6475026, -0.5708588, 1, 0.8823529, 0, 1,
-1.104159, -0.6449679, -2.506509, 1, 0.8862745, 0, 1,
-1.102518, 0.9744706, -1.813603, 1, 0.8941177, 0, 1,
-1.094018, -0.1642882, 0.1255843, 1, 0.8980392, 0, 1,
-1.093847, 0.6949933, -0.3058488, 1, 0.9058824, 0, 1,
-1.088618, -1.383128, -3.554393, 1, 0.9137255, 0, 1,
-1.083785, 0.4743565, -1.690108, 1, 0.9176471, 0, 1,
-1.083527, 0.1682269, -1.242343, 1, 0.9254902, 0, 1,
-1.082433, 0.390916, -1.53859, 1, 0.9294118, 0, 1,
-1.07958, 0.4848118, -1.670361, 1, 0.9372549, 0, 1,
-1.074408, 1.110018, -0.4766287, 1, 0.9411765, 0, 1,
-1.074354, 0.1357144, -1.445337, 1, 0.9490196, 0, 1,
-1.07391, -0.09119998, -0.7915151, 1, 0.9529412, 0, 1,
-1.068854, 0.06183452, -0.7847791, 1, 0.9607843, 0, 1,
-1.064911, 1.211806, -1.264395, 1, 0.9647059, 0, 1,
-1.062203, -0.9503716, -0.6463612, 1, 0.972549, 0, 1,
-1.056003, 2.689621, -1.622752, 1, 0.9764706, 0, 1,
-1.055087, 0.3004601, 0.1215734, 1, 0.9843137, 0, 1,
-1.04051, -0.5398767, -1.397851, 1, 0.9882353, 0, 1,
-1.037005, 0.7881169, -1.152109, 1, 0.9960784, 0, 1,
-1.033811, -0.5357112, -2.61989, 0.9960784, 1, 0, 1,
-1.031277, 0.5232319, -2.133847, 0.9921569, 1, 0, 1,
-1.028829, 0.3239463, -2.076559, 0.9843137, 1, 0, 1,
-1.025744, -0.2444152, -3.405219, 0.9803922, 1, 0, 1,
-1.025066, 0.407843, -2.934352, 0.972549, 1, 0, 1,
-1.022923, 1.012739, -0.1358592, 0.9686275, 1, 0, 1,
-1.02015, 1.421605, -2.040432, 0.9607843, 1, 0, 1,
-1.020085, 1.637509, -0.5184854, 0.9568627, 1, 0, 1,
-1.019679, 0.3889369, -1.66336, 0.9490196, 1, 0, 1,
-1.019378, 1.064476, -0.7008405, 0.945098, 1, 0, 1,
-1.016869, 1.672066, -0.7077207, 0.9372549, 1, 0, 1,
-1.016604, 0.560912, -0.4202722, 0.9333333, 1, 0, 1,
-1.014609, 0.7381518, -1.301176, 0.9254902, 1, 0, 1,
-1.013798, -0.9820617, -1.614793, 0.9215686, 1, 0, 1,
-1.009941, 0.6141556, -2.578646, 0.9137255, 1, 0, 1,
-1.008184, 0.2183726, -1.228361, 0.9098039, 1, 0, 1,
-1.006296, -2.232523, -2.878154, 0.9019608, 1, 0, 1,
-1.002243, 0.2855031, -0.6561114, 0.8941177, 1, 0, 1,
-1.001936, -1.366292, -1.098646, 0.8901961, 1, 0, 1,
-1.00092, -0.8539136, -2.610287, 0.8823529, 1, 0, 1,
-0.9983838, 1.440848, -1.048484, 0.8784314, 1, 0, 1,
-0.9960311, -2.32241, -1.796699, 0.8705882, 1, 0, 1,
-0.9946975, 0.7964042, -0.04144128, 0.8666667, 1, 0, 1,
-0.9932038, 0.497738, -1.4503, 0.8588235, 1, 0, 1,
-0.9865245, 3.106036, 0.1470081, 0.854902, 1, 0, 1,
-0.9856921, -0.3986714, -3.067982, 0.8470588, 1, 0, 1,
-0.9738507, -0.3957651, -3.675817, 0.8431373, 1, 0, 1,
-0.9576984, -1.181974, -2.890424, 0.8352941, 1, 0, 1,
-0.9532779, -0.7520716, -2.849447, 0.8313726, 1, 0, 1,
-0.9527478, -0.7630935, -2.401684, 0.8235294, 1, 0, 1,
-0.947586, -0.3300912, -1.596339, 0.8196079, 1, 0, 1,
-0.9451516, -1.605624, -1.924533, 0.8117647, 1, 0, 1,
-0.9442677, -0.3831167, -3.586341, 0.8078431, 1, 0, 1,
-0.9417242, 1.465597, 0.3015138, 0.8, 1, 0, 1,
-0.940888, -0.112731, -0.726208, 0.7921569, 1, 0, 1,
-0.9335971, -0.9521239, -0.4982603, 0.7882353, 1, 0, 1,
-0.9249496, -0.5875413, -4.248591, 0.7803922, 1, 0, 1,
-0.9245222, 0.2461557, -0.6603624, 0.7764706, 1, 0, 1,
-0.9085522, -0.6807356, -0.7555531, 0.7686275, 1, 0, 1,
-0.9079221, 0.01644738, -1.656126, 0.7647059, 1, 0, 1,
-0.9071015, 0.470012, -1.723114, 0.7568628, 1, 0, 1,
-0.9063278, 1.406887, -0.9301053, 0.7529412, 1, 0, 1,
-0.9030122, 0.6558509, 0.4705454, 0.7450981, 1, 0, 1,
-0.901917, 0.03555145, -1.488772, 0.7411765, 1, 0, 1,
-0.8983436, 2.24162, -0.3464336, 0.7333333, 1, 0, 1,
-0.887028, 0.7011862, 1.224256, 0.7294118, 1, 0, 1,
-0.887005, -1.491214, -3.567017, 0.7215686, 1, 0, 1,
-0.8863914, -2.245507, -1.807194, 0.7176471, 1, 0, 1,
-0.8861493, -1.390261, -2.478932, 0.7098039, 1, 0, 1,
-0.883324, 1.666376, -1.026619, 0.7058824, 1, 0, 1,
-0.8794393, 1.076266, 0.4506401, 0.6980392, 1, 0, 1,
-0.866996, 1.731084, -0.7684118, 0.6901961, 1, 0, 1,
-0.8648229, 0.1423232, -0.6157433, 0.6862745, 1, 0, 1,
-0.8639528, 1.217985, -2.035219, 0.6784314, 1, 0, 1,
-0.8537593, 0.7260415, -1.525333, 0.6745098, 1, 0, 1,
-0.8521774, 0.8267657, 1.821487, 0.6666667, 1, 0, 1,
-0.8442472, 0.8133771, -0.603467, 0.6627451, 1, 0, 1,
-0.8438595, -1.70785, -3.432764, 0.654902, 1, 0, 1,
-0.8418804, 0.3788866, -0.627624, 0.6509804, 1, 0, 1,
-0.8413044, -0.7703679, -2.003547, 0.6431373, 1, 0, 1,
-0.8372787, -0.2015506, -1.980836, 0.6392157, 1, 0, 1,
-0.8348954, -1.44971, -1.08921, 0.6313726, 1, 0, 1,
-0.819194, 0.1332196, -1.549439, 0.627451, 1, 0, 1,
-0.8186783, -0.3288183, 0.09640364, 0.6196079, 1, 0, 1,
-0.8170039, -0.01125398, -1.11243, 0.6156863, 1, 0, 1,
-0.812472, 0.1031151, 0.05783726, 0.6078432, 1, 0, 1,
-0.8016635, -0.7325456, -3.274346, 0.6039216, 1, 0, 1,
-0.7988128, -1.176851, -4.670161, 0.5960785, 1, 0, 1,
-0.7903651, 0.461452, -1.54305, 0.5882353, 1, 0, 1,
-0.7800834, 2.097006, -0.4880654, 0.5843138, 1, 0, 1,
-0.7795545, 0.05851641, -0.2236563, 0.5764706, 1, 0, 1,
-0.7755494, -0.1873643, -1.186677, 0.572549, 1, 0, 1,
-0.766601, 1.75236, -0.1764186, 0.5647059, 1, 0, 1,
-0.7633596, 0.9855474, 0.1422285, 0.5607843, 1, 0, 1,
-0.7616561, -0.695657, -4.472332, 0.5529412, 1, 0, 1,
-0.7597923, 0.4419818, -0.6607707, 0.5490196, 1, 0, 1,
-0.7581318, -0.2519873, -2.742455, 0.5411765, 1, 0, 1,
-0.7573116, 0.2214874, 0.268372, 0.5372549, 1, 0, 1,
-0.7537131, 0.4274799, -0.6613719, 0.5294118, 1, 0, 1,
-0.7499296, 1.106571, 0.7120279, 0.5254902, 1, 0, 1,
-0.74984, 1.152924, -1.433457, 0.5176471, 1, 0, 1,
-0.7373441, -1.309399, -3.597125, 0.5137255, 1, 0, 1,
-0.7344471, -1.332386, -1.570921, 0.5058824, 1, 0, 1,
-0.7342549, -1.28835, -3.291014, 0.5019608, 1, 0, 1,
-0.7274265, 3.097546, -1.526499, 0.4941176, 1, 0, 1,
-0.7150758, -1.133871, -4.829298, 0.4862745, 1, 0, 1,
-0.7143403, 0.5497092, -1.353375, 0.4823529, 1, 0, 1,
-0.712781, -2.258489, -1.653944, 0.4745098, 1, 0, 1,
-0.710423, -0.9533556, -1.478252, 0.4705882, 1, 0, 1,
-0.7091714, 0.6076189, -1.702315, 0.4627451, 1, 0, 1,
-0.7078774, 0.9171678, -1.041361, 0.4588235, 1, 0, 1,
-0.7024135, -0.9785067, -4.343244, 0.4509804, 1, 0, 1,
-0.6943864, -0.4731938, -2.325286, 0.4470588, 1, 0, 1,
-0.6915875, -0.2771448, -2.99637, 0.4392157, 1, 0, 1,
-0.6855667, -0.51182, -2.092593, 0.4352941, 1, 0, 1,
-0.680396, 0.2491784, -2.25685, 0.427451, 1, 0, 1,
-0.6779103, 0.01407663, -1.113025, 0.4235294, 1, 0, 1,
-0.6712589, -1.02688, -1.652653, 0.4156863, 1, 0, 1,
-0.6704334, -0.5048783, -1.225253, 0.4117647, 1, 0, 1,
-0.6685317, -0.1515641, -0.1238206, 0.4039216, 1, 0, 1,
-0.6659886, 0.4620205, -0.1759222, 0.3960784, 1, 0, 1,
-0.6653703, -1.371104, -1.91559, 0.3921569, 1, 0, 1,
-0.6629928, -1.402674, -2.908758, 0.3843137, 1, 0, 1,
-0.6614988, -0.448728, -3.798383, 0.3803922, 1, 0, 1,
-0.6602738, -0.1512605, -2.153728, 0.372549, 1, 0, 1,
-0.643191, -1.108229, -1.097048, 0.3686275, 1, 0, 1,
-0.641411, 2.494135, 1.609614, 0.3607843, 1, 0, 1,
-0.6364383, -1.193685, -2.884268, 0.3568628, 1, 0, 1,
-0.6356042, 0.8504431, 0.6591398, 0.3490196, 1, 0, 1,
-0.6331986, 0.1439808, -1.630421, 0.345098, 1, 0, 1,
-0.6329488, -0.5849487, -1.457217, 0.3372549, 1, 0, 1,
-0.6284784, 0.3927925, -0.6327098, 0.3333333, 1, 0, 1,
-0.6275684, 0.6786473, -1.13968, 0.3254902, 1, 0, 1,
-0.6203112, 0.3071183, -0.9834822, 0.3215686, 1, 0, 1,
-0.6182901, 0.07562828, -0.5255181, 0.3137255, 1, 0, 1,
-0.6178712, 0.07597924, -0.6988455, 0.3098039, 1, 0, 1,
-0.6167582, 0.6443616, -1.51505, 0.3019608, 1, 0, 1,
-0.6137373, -0.1882984, -2.458781, 0.2941177, 1, 0, 1,
-0.6126167, -1.417436, -2.044729, 0.2901961, 1, 0, 1,
-0.6065235, -0.3184669, -2.600098, 0.282353, 1, 0, 1,
-0.5960833, 0.3755465, 0.5401056, 0.2784314, 1, 0, 1,
-0.5944228, 0.09064125, 0.1711643, 0.2705882, 1, 0, 1,
-0.5928264, 0.1748033, -2.846661, 0.2666667, 1, 0, 1,
-0.5900928, 0.4521383, -1.678414, 0.2588235, 1, 0, 1,
-0.5869832, -0.6078567, -3.368955, 0.254902, 1, 0, 1,
-0.5867925, -0.7643816, -3.350071, 0.2470588, 1, 0, 1,
-0.5867674, -0.8985585, -3.403834, 0.2431373, 1, 0, 1,
-0.5866645, 1.269752, 1.459179, 0.2352941, 1, 0, 1,
-0.5834592, -0.844609, -3.234095, 0.2313726, 1, 0, 1,
-0.5765025, -0.1128153, -2.390007, 0.2235294, 1, 0, 1,
-0.5746526, -0.2263248, -2.231637, 0.2196078, 1, 0, 1,
-0.5746232, -1.956633, -2.601934, 0.2117647, 1, 0, 1,
-0.5712192, -0.02063631, -0.5776551, 0.2078431, 1, 0, 1,
-0.5706738, 0.1888496, 0.298346, 0.2, 1, 0, 1,
-0.5699561, -0.2838268, -0.4648032, 0.1921569, 1, 0, 1,
-0.5668732, 1.501705, -2.132627, 0.1882353, 1, 0, 1,
-0.558498, -1.379418, -1.258939, 0.1803922, 1, 0, 1,
-0.5584791, 0.1888772, -0.5703093, 0.1764706, 1, 0, 1,
-0.5546183, 1.120252, -1.636298, 0.1686275, 1, 0, 1,
-0.5512347, 1.191927, -2.353168, 0.1647059, 1, 0, 1,
-0.5466923, 0.09395134, -2.326997, 0.1568628, 1, 0, 1,
-0.5391148, 1.33481, 0.01705943, 0.1529412, 1, 0, 1,
-0.5387748, -0.9388621, -1.364369, 0.145098, 1, 0, 1,
-0.5308547, -0.02380119, -2.405435, 0.1411765, 1, 0, 1,
-0.5294204, -0.8603658, -1.267884, 0.1333333, 1, 0, 1,
-0.5289682, 0.6193482, 1.801103, 0.1294118, 1, 0, 1,
-0.5272022, 1.820868, -0.1903753, 0.1215686, 1, 0, 1,
-0.5270487, 0.11703, 0.36211, 0.1176471, 1, 0, 1,
-0.5244824, 1.054113, 0.825572, 0.1098039, 1, 0, 1,
-0.5208169, -0.1864725, -1.657548, 0.1058824, 1, 0, 1,
-0.5200086, -1.722019, -2.265886, 0.09803922, 1, 0, 1,
-0.5166875, 0.8453515, -0.02955862, 0.09019608, 1, 0, 1,
-0.5161179, 0.9350519, 0.02176163, 0.08627451, 1, 0, 1,
-0.5159461, -1.676548, -2.716627, 0.07843138, 1, 0, 1,
-0.5137439, -1.511139, -2.427143, 0.07450981, 1, 0, 1,
-0.5112857, 0.5893442, -0.5577567, 0.06666667, 1, 0, 1,
-0.507214, -2.688289, -2.935215, 0.0627451, 1, 0, 1,
-0.5041565, -0.03817246, -3.343398, 0.05490196, 1, 0, 1,
-0.5021511, 1.740063, -0.08593797, 0.05098039, 1, 0, 1,
-0.5005375, 1.029366, 0.185314, 0.04313726, 1, 0, 1,
-0.4985382, -0.9732318, -2.846816, 0.03921569, 1, 0, 1,
-0.4951895, 0.09933154, -1.234852, 0.03137255, 1, 0, 1,
-0.4936946, 1.293262, 1.530118, 0.02745098, 1, 0, 1,
-0.4902383, -0.6203957, -0.8078332, 0.01960784, 1, 0, 1,
-0.4893296, -0.9989709, -2.725406, 0.01568628, 1, 0, 1,
-0.4774274, 0.2521291, -0.4761211, 0.007843138, 1, 0, 1,
-0.4719427, -0.9438336, -2.662191, 0.003921569, 1, 0, 1,
-0.4701748, -1.484812, -2.005469, 0, 1, 0.003921569, 1,
-0.4689015, 0.8341566, -2.274738, 0, 1, 0.01176471, 1,
-0.467898, -0.4569986, -2.157823, 0, 1, 0.01568628, 1,
-0.4618919, 0.2793536, -0.6981807, 0, 1, 0.02352941, 1,
-0.4592789, 1.908199, 0.6080527, 0, 1, 0.02745098, 1,
-0.4571548, -1.295302, -3.009269, 0, 1, 0.03529412, 1,
-0.4509882, 0.421711, -0.6037351, 0, 1, 0.03921569, 1,
-0.4501293, 0.7665474, -0.7424883, 0, 1, 0.04705882, 1,
-0.447897, -0.7575626, -1.761045, 0, 1, 0.05098039, 1,
-0.447534, -0.5929472, -4.153985, 0, 1, 0.05882353, 1,
-0.4452844, -0.5428029, -1.089894, 0, 1, 0.0627451, 1,
-0.4424174, -1.088436, -4.13555, 0, 1, 0.07058824, 1,
-0.4412017, 0.6929401, 2.238154, 0, 1, 0.07450981, 1,
-0.4315409, -0.7138482, -4.634761, 0, 1, 0.08235294, 1,
-0.431514, -2.309187, -4.280785, 0, 1, 0.08627451, 1,
-0.4293821, -0.1286317, -1.662481, 0, 1, 0.09411765, 1,
-0.4282192, -0.1867875, -2.867266, 0, 1, 0.1019608, 1,
-0.4269814, -0.4823228, -1.205779, 0, 1, 0.1058824, 1,
-0.4246055, -0.3612077, -1.949756, 0, 1, 0.1137255, 1,
-0.4215104, 1.187085, -2.475395, 0, 1, 0.1176471, 1,
-0.4205078, -1.348153, -3.592657, 0, 1, 0.1254902, 1,
-0.418348, 0.5506654, 1.484759, 0, 1, 0.1294118, 1,
-0.4164687, 1.304456, -0.357143, 0, 1, 0.1372549, 1,
-0.4144765, -1.107965, -3.381653, 0, 1, 0.1411765, 1,
-0.4117118, 0.5730668, -0.3675087, 0, 1, 0.1490196, 1,
-0.4076941, -0.4117567, -2.739066, 0, 1, 0.1529412, 1,
-0.4035878, 0.6539021, -0.2448423, 0, 1, 0.1607843, 1,
-0.4021085, -2.072279, -1.948836, 0, 1, 0.1647059, 1,
-0.3939808, 2.634516, 0.01897887, 0, 1, 0.172549, 1,
-0.3912449, -0.8112899, -2.699074, 0, 1, 0.1764706, 1,
-0.3902249, -0.4210429, -3.611455, 0, 1, 0.1843137, 1,
-0.3858451, -0.5865835, -4.791648, 0, 1, 0.1882353, 1,
-0.3855825, -0.3781381, -3.433751, 0, 1, 0.1960784, 1,
-0.380485, 1.208999, 2.437911, 0, 1, 0.2039216, 1,
-0.3792345, 0.3158357, 0.2107088, 0, 1, 0.2078431, 1,
-0.3791038, 0.8838783, -0.7862294, 0, 1, 0.2156863, 1,
-0.3772908, -0.3766554, -2.985378, 0, 1, 0.2196078, 1,
-0.3771651, -2.952513, -3.642072, 0, 1, 0.227451, 1,
-0.3747116, 0.6706613, 0.1581692, 0, 1, 0.2313726, 1,
-0.3743773, 0.7401213, -1.043743, 0, 1, 0.2392157, 1,
-0.3702583, 0.6310115, 0.04448991, 0, 1, 0.2431373, 1,
-0.3694801, 0.6333636, -0.1847632, 0, 1, 0.2509804, 1,
-0.3691898, 1.469931, -0.2680345, 0, 1, 0.254902, 1,
-0.3688479, 0.1221227, -1.780953, 0, 1, 0.2627451, 1,
-0.3674999, 0.6283441, -0.2257056, 0, 1, 0.2666667, 1,
-0.3657832, 0.3368941, -0.2941313, 0, 1, 0.2745098, 1,
-0.3637861, -2.40647, -1.689573, 0, 1, 0.2784314, 1,
-0.3626175, -0.273916, -2.422198, 0, 1, 0.2862745, 1,
-0.3542762, -1.175204, -3.148225, 0, 1, 0.2901961, 1,
-0.3514791, 0.687339, 0.3518584, 0, 1, 0.2980392, 1,
-0.3491998, -0.3903367, -2.165786, 0, 1, 0.3058824, 1,
-0.3431723, -1.682245, -2.987441, 0, 1, 0.3098039, 1,
-0.3430789, 0.7309939, 0.1519479, 0, 1, 0.3176471, 1,
-0.3422162, 0.6240541, -1.905625, 0, 1, 0.3215686, 1,
-0.3383647, 1.355736, -0.4180085, 0, 1, 0.3294118, 1,
-0.3367469, -0.3945772, 0.3748727, 0, 1, 0.3333333, 1,
-0.3315634, -0.549442, -2.307212, 0, 1, 0.3411765, 1,
-0.3287585, 0.2237029, 0.1734908, 0, 1, 0.345098, 1,
-0.3279497, -1.104875, -1.405769, 0, 1, 0.3529412, 1,
-0.3196641, 0.6157876, -0.6296141, 0, 1, 0.3568628, 1,
-0.3179901, -0.6782519, -2.845714, 0, 1, 0.3647059, 1,
-0.3179321, -0.4950708, -4.057363, 0, 1, 0.3686275, 1,
-0.3112624, -0.2722224, -2.410191, 0, 1, 0.3764706, 1,
-0.3042848, 0.07683345, -1.031873, 0, 1, 0.3803922, 1,
-0.303605, 0.8195475, -0.07080103, 0, 1, 0.3882353, 1,
-0.2977188, -0.9358225, -3.099559, 0, 1, 0.3921569, 1,
-0.2939714, 1.243839, 1.494578, 0, 1, 0.4, 1,
-0.2937176, 0.3980108, -1.959556, 0, 1, 0.4078431, 1,
-0.2927631, -0.9847742, -3.406835, 0, 1, 0.4117647, 1,
-0.2847993, 0.6579683, -0.6066388, 0, 1, 0.4196078, 1,
-0.2811307, -0.130759, -1.387676, 0, 1, 0.4235294, 1,
-0.2801031, -0.2911525, -0.4869408, 0, 1, 0.4313726, 1,
-0.2792882, 0.5538216, -0.02282173, 0, 1, 0.4352941, 1,
-0.2776889, -1.206318, -2.462058, 0, 1, 0.4431373, 1,
-0.2776549, -1.007228, -1.601251, 0, 1, 0.4470588, 1,
-0.2753829, -0.3784288, -1.882715, 0, 1, 0.454902, 1,
-0.2684472, -0.1155965, -2.258893, 0, 1, 0.4588235, 1,
-0.268077, -1.177136, -1.708176, 0, 1, 0.4666667, 1,
-0.2649277, 0.6555638, 0.721995, 0, 1, 0.4705882, 1,
-0.2619993, 0.2506675, -0.9173007, 0, 1, 0.4784314, 1,
-0.2612192, 0.4046362, -1.777144, 0, 1, 0.4823529, 1,
-0.2530165, -0.7654251, -2.671299, 0, 1, 0.4901961, 1,
-0.2524558, 0.9747063, -2.197863, 0, 1, 0.4941176, 1,
-0.2508581, -0.4456273, -2.946576, 0, 1, 0.5019608, 1,
-0.2488383, 1.01376, 0.01379462, 0, 1, 0.509804, 1,
-0.2484839, -0.2736503, -2.782809, 0, 1, 0.5137255, 1,
-0.244906, -0.1133111, -1.768281, 0, 1, 0.5215687, 1,
-0.2411262, -0.4799041, -2.681058, 0, 1, 0.5254902, 1,
-0.2404665, -1.378872, -3.146202, 0, 1, 0.5333334, 1,
-0.2330643, 0.1259414, -0.519965, 0, 1, 0.5372549, 1,
-0.2327585, -0.4666131, -2.404848, 0, 1, 0.5450981, 1,
-0.23124, 0.949545, -1.188606, 0, 1, 0.5490196, 1,
-0.2284894, -0.5248612, -2.406369, 0, 1, 0.5568628, 1,
-0.228161, 0.6914604, -0.3831743, 0, 1, 0.5607843, 1,
-0.227627, -2.131224, -4.04663, 0, 1, 0.5686275, 1,
-0.2275416, 0.3388102, -0.5101237, 0, 1, 0.572549, 1,
-0.2263882, -0.3461348, -1.018171, 0, 1, 0.5803922, 1,
-0.224411, -1.124092, -2.3233, 0, 1, 0.5843138, 1,
-0.2208223, 0.8460262, 0.1040623, 0, 1, 0.5921569, 1,
-0.2160751, 0.2166515, 0.7011554, 0, 1, 0.5960785, 1,
-0.2134586, 0.7753528, 0.511001, 0, 1, 0.6039216, 1,
-0.2096038, 0.1119771, -1.811096, 0, 1, 0.6117647, 1,
-0.2065844, -0.5243839, -2.045628, 0, 1, 0.6156863, 1,
-0.2043867, 0.3614093, 0.1025314, 0, 1, 0.6235294, 1,
-0.2042128, -1.365545, -2.362365, 0, 1, 0.627451, 1,
-0.2030113, -0.2714725, -2.834448, 0, 1, 0.6352941, 1,
-0.2023248, -1.299252, -3.311156, 0, 1, 0.6392157, 1,
-0.198456, 0.1481856, -0.6126994, 0, 1, 0.6470588, 1,
-0.1976236, -0.2351471, -1.894735, 0, 1, 0.6509804, 1,
-0.1965536, 0.2126112, -1.53823, 0, 1, 0.6588235, 1,
-0.1939748, -0.09791163, -1.57116, 0, 1, 0.6627451, 1,
-0.1931675, 1.932883, 1.526058, 0, 1, 0.6705883, 1,
-0.1917666, -0.5462788, -3.981457, 0, 1, 0.6745098, 1,
-0.189751, -0.7388647, -2.657452, 0, 1, 0.682353, 1,
-0.1864491, 0.8116133, 0.5722961, 0, 1, 0.6862745, 1,
-0.1864443, 0.4300794, -0.5618453, 0, 1, 0.6941177, 1,
-0.1815936, 0.5620866, 0.5530927, 0, 1, 0.7019608, 1,
-0.181582, 1.395211, 0.1002089, 0, 1, 0.7058824, 1,
-0.1782261, -0.3293165, -0.8964117, 0, 1, 0.7137255, 1,
-0.1747065, -1.868999, -2.926229, 0, 1, 0.7176471, 1,
-0.1735827, -0.01690523, -2.096408, 0, 1, 0.7254902, 1,
-0.1601395, 2.697942, 0.3429525, 0, 1, 0.7294118, 1,
-0.1566277, 1.597755, -2.061666, 0, 1, 0.7372549, 1,
-0.1515196, -0.9218578, -2.144241, 0, 1, 0.7411765, 1,
-0.1471855, 1.459093, -0.3971241, 0, 1, 0.7490196, 1,
-0.1452423, -0.2438511, -0.5931867, 0, 1, 0.7529412, 1,
-0.140731, 2.782498, 1.610827, 0, 1, 0.7607843, 1,
-0.1398965, 0.6186455, 1.549488, 0, 1, 0.7647059, 1,
-0.1393048, 0.4119955, 0.4110045, 0, 1, 0.772549, 1,
-0.1387741, -0.1818137, -2.608209, 0, 1, 0.7764706, 1,
-0.1386259, 1.02018, 1.259196, 0, 1, 0.7843137, 1,
-0.1373378, 0.5123384, -0.5253028, 0, 1, 0.7882353, 1,
-0.1372938, -0.2474713, -1.19276, 0, 1, 0.7960784, 1,
-0.1325099, -0.7312944, -0.9323765, 0, 1, 0.8039216, 1,
-0.1301739, -0.34692, -3.225443, 0, 1, 0.8078431, 1,
-0.127782, -0.7871211, -2.497621, 0, 1, 0.8156863, 1,
-0.1221488, -0.1819207, -3.293634, 0, 1, 0.8196079, 1,
-0.1151728, -0.629423, -0.5282093, 0, 1, 0.827451, 1,
-0.1072549, 0.8560074, -0.668303, 0, 1, 0.8313726, 1,
-0.1066539, -0.1157217, -3.626179, 0, 1, 0.8392157, 1,
-0.09942264, 1.411322, -1.312207, 0, 1, 0.8431373, 1,
-0.09556982, -0.0922322, -2.567694, 0, 1, 0.8509804, 1,
-0.08659533, 0.4760945, 0.5742139, 0, 1, 0.854902, 1,
-0.08630256, -1.986636, -2.041589, 0, 1, 0.8627451, 1,
-0.08155889, 0.7369735, -0.5210918, 0, 1, 0.8666667, 1,
-0.07644948, 0.1414561, -0.04577332, 0, 1, 0.8745098, 1,
-0.07454612, -0.6262923, -3.374084, 0, 1, 0.8784314, 1,
-0.07327374, -0.3148887, -1.542604, 0, 1, 0.8862745, 1,
-0.07147035, -0.2641361, -4.276329, 0, 1, 0.8901961, 1,
-0.07132187, 0.2133302, -1.599092, 0, 1, 0.8980392, 1,
-0.07131011, 1.655116, -0.3294709, 0, 1, 0.9058824, 1,
-0.0680676, 0.3895534, -0.6218767, 0, 1, 0.9098039, 1,
-0.06629451, 0.8610414, 0.4228332, 0, 1, 0.9176471, 1,
-0.06627151, 1.612508, -2.644178, 0, 1, 0.9215686, 1,
-0.06591488, 0.06191673, -0.9803157, 0, 1, 0.9294118, 1,
-0.06151119, 0.4074389, -0.0644975, 0, 1, 0.9333333, 1,
-0.05976482, -1.723689, -3.97462, 0, 1, 0.9411765, 1,
-0.05681064, 1.193989, 0.9421304, 0, 1, 0.945098, 1,
-0.04938344, -0.6219511, -2.278859, 0, 1, 0.9529412, 1,
-0.04267403, -0.7067467, -0.4603483, 0, 1, 0.9568627, 1,
-0.04250836, 0.3699774, -0.5599456, 0, 1, 0.9647059, 1,
-0.04042831, 0.5230285, 0.3721119, 0, 1, 0.9686275, 1,
-0.03812852, 0.5988402, -0.7117094, 0, 1, 0.9764706, 1,
-0.03603449, 1.915656, -0.6691447, 0, 1, 0.9803922, 1,
-0.03294657, -0.8231227, -3.277337, 0, 1, 0.9882353, 1,
-0.03158884, -2.298863, -4.821151, 0, 1, 0.9921569, 1,
-0.02740417, -0.3395907, -3.313355, 0, 1, 1, 1,
-0.02711937, 1.182127, -0.1550486, 0, 0.9921569, 1, 1,
-0.02581333, 0.7385345, -2.000892, 0, 0.9882353, 1, 1,
-0.02513754, 0.2428149, -0.0463854, 0, 0.9803922, 1, 1,
-0.02469531, -0.48515, -3.419798, 0, 0.9764706, 1, 1,
-0.02401476, 0.6848497, -1.597066, 0, 0.9686275, 1, 1,
-0.02288551, -1.600525, -1.38318, 0, 0.9647059, 1, 1,
-0.02003564, 1.079376, -1.207492, 0, 0.9568627, 1, 1,
-0.01054658, -0.149429, -2.108308, 0, 0.9529412, 1, 1,
-0.006750527, -1.201418, -4.432817, 0, 0.945098, 1, 1,
-0.005459697, 0.1229828, -1.674469, 0, 0.9411765, 1, 1,
-0.0007910311, -1.262599, -2.507532, 0, 0.9333333, 1, 1,
0.00101631, -0.7025418, 2.249931, 0, 0.9294118, 1, 1,
0.005544813, 0.4599301, -0.7355915, 0, 0.9215686, 1, 1,
0.006906453, -1.510719, 0.8372656, 0, 0.9176471, 1, 1,
0.007466509, -0.2476173, 3.646564, 0, 0.9098039, 1, 1,
0.009361719, 0.5222341, -0.4800818, 0, 0.9058824, 1, 1,
0.01001234, -0.7587492, 3.968476, 0, 0.8980392, 1, 1,
0.01025404, 0.882495, 0.2929493, 0, 0.8901961, 1, 1,
0.01711167, -0.601826, 5.623842, 0, 0.8862745, 1, 1,
0.01721748, 1.478591, -0.4195532, 0, 0.8784314, 1, 1,
0.01790324, 0.4875999, -0.9673142, 0, 0.8745098, 1, 1,
0.02241099, 0.6280866, 1.594498, 0, 0.8666667, 1, 1,
0.0240427, -0.3757629, 2.923152, 0, 0.8627451, 1, 1,
0.025993, -0.1421518, 2.30108, 0, 0.854902, 1, 1,
0.03176526, -0.2563917, 4.388175, 0, 0.8509804, 1, 1,
0.03179517, -0.08069787, 4.038181, 0, 0.8431373, 1, 1,
0.03198322, -0.2246366, 3.969418, 0, 0.8392157, 1, 1,
0.03583354, -1.102101, 4.484127, 0, 0.8313726, 1, 1,
0.0367931, 0.7728072, 0.8624097, 0, 0.827451, 1, 1,
0.03878846, 0.0929009, 0.8039789, 0, 0.8196079, 1, 1,
0.04060596, -1.500185, 3.829485, 0, 0.8156863, 1, 1,
0.0461036, -0.8448618, 3.090648, 0, 0.8078431, 1, 1,
0.0497774, -1.640078, 2.586605, 0, 0.8039216, 1, 1,
0.05419423, -0.6888699, 4.524731, 0, 0.7960784, 1, 1,
0.05426399, -0.440704, 3.368961, 0, 0.7882353, 1, 1,
0.06129474, -0.2576027, 4.650355, 0, 0.7843137, 1, 1,
0.06251931, -0.06480598, 2.71005, 0, 0.7764706, 1, 1,
0.06317304, 0.046096, 1.644358, 0, 0.772549, 1, 1,
0.06989338, 1.439635, -1.999372, 0, 0.7647059, 1, 1,
0.07177581, 2.318693, 0.770381, 0, 0.7607843, 1, 1,
0.07397479, -1.450973, 4.115411, 0, 0.7529412, 1, 1,
0.07591893, -0.7296471, 4.089385, 0, 0.7490196, 1, 1,
0.07619318, -0.2034878, 1.496006, 0, 0.7411765, 1, 1,
0.07976194, 0.2003226, 1.272214, 0, 0.7372549, 1, 1,
0.08058368, 0.05140076, 0.8152867, 0, 0.7294118, 1, 1,
0.08818301, -0.9025742, 2.865566, 0, 0.7254902, 1, 1,
0.08925455, -0.5812324, 1.943157, 0, 0.7176471, 1, 1,
0.09011251, -0.8225187, 2.070831, 0, 0.7137255, 1, 1,
0.09015501, -0.9892005, 3.11376, 0, 0.7058824, 1, 1,
0.09585201, -0.005846818, 2.031115, 0, 0.6980392, 1, 1,
0.09938034, -1.099119, 3.299938, 0, 0.6941177, 1, 1,
0.1004796, 1.022031, -0.6751359, 0, 0.6862745, 1, 1,
0.1022488, 0.2422353, -0.01750562, 0, 0.682353, 1, 1,
0.1033224, 2.879059, -1.978482, 0, 0.6745098, 1, 1,
0.1035341, 0.8927531, -0.2469808, 0, 0.6705883, 1, 1,
0.1047525, 2.133498, 1.613131, 0, 0.6627451, 1, 1,
0.1067756, 0.4689306, 1.977033, 0, 0.6588235, 1, 1,
0.1075251, -0.3309605, 2.830579, 0, 0.6509804, 1, 1,
0.1094259, -0.2916768, 4.956822, 0, 0.6470588, 1, 1,
0.1146489, -0.5929239, 1.779403, 0, 0.6392157, 1, 1,
0.1149471, 1.914248, -2.416589, 0, 0.6352941, 1, 1,
0.1151293, -0.5037284, 3.502904, 0, 0.627451, 1, 1,
0.1210733, -1.531638, 4.404226, 0, 0.6235294, 1, 1,
0.1357221, -1.706198, 1.26042, 0, 0.6156863, 1, 1,
0.1363016, -0.7807709, 1.910123, 0, 0.6117647, 1, 1,
0.136502, -0.02005086, 3.577411, 0, 0.6039216, 1, 1,
0.1367976, 1.474387, -0.7999993, 0, 0.5960785, 1, 1,
0.1392093, 0.0716725, 1.308992, 0, 0.5921569, 1, 1,
0.1408339, -0.5529616, 5.403306, 0, 0.5843138, 1, 1,
0.1436753, 0.560532, 1.029225, 0, 0.5803922, 1, 1,
0.1461842, 0.590167, 1.051931, 0, 0.572549, 1, 1,
0.1611298, -2.594699, 1.9006, 0, 0.5686275, 1, 1,
0.1612565, -0.5953394, 2.703174, 0, 0.5607843, 1, 1,
0.1621263, -0.1286525, 2.251636, 0, 0.5568628, 1, 1,
0.1654765, 1.087497, 0.2132885, 0, 0.5490196, 1, 1,
0.1681987, 1.193665, 0.5170302, 0, 0.5450981, 1, 1,
0.1686661, 0.3153385, 0.4394457, 0, 0.5372549, 1, 1,
0.1689865, 1.329603, 0.05792645, 0, 0.5333334, 1, 1,
0.1755796, -1.002823, 3.279419, 0, 0.5254902, 1, 1,
0.1776312, 0.176136, 1.131571, 0, 0.5215687, 1, 1,
0.1786633, -0.541954, 2.330431, 0, 0.5137255, 1, 1,
0.1801594, 0.2530255, 0.163177, 0, 0.509804, 1, 1,
0.1810846, -1.598002, 1.207643, 0, 0.5019608, 1, 1,
0.1833144, 1.870574, -0.1931219, 0, 0.4941176, 1, 1,
0.1840631, 1.911498, 1.566721, 0, 0.4901961, 1, 1,
0.1849482, 0.5023625, -0.9100406, 0, 0.4823529, 1, 1,
0.1861656, -0.5924146, 3.057499, 0, 0.4784314, 1, 1,
0.1883632, -0.425476, 3.960834, 0, 0.4705882, 1, 1,
0.1884111, 0.04276211, 1.060363, 0, 0.4666667, 1, 1,
0.1891109, -0.09398977, 3.170888, 0, 0.4588235, 1, 1,
0.1897885, -1.865887, 4.95288, 0, 0.454902, 1, 1,
0.1958236, -0.4711462, 2.712322, 0, 0.4470588, 1, 1,
0.1978245, 0.05524651, -0.3228529, 0, 0.4431373, 1, 1,
0.1983605, 0.9397025, -2.006014, 0, 0.4352941, 1, 1,
0.20403, -1.220639, 3.653707, 0, 0.4313726, 1, 1,
0.2058648, 0.4135075, 1.083805, 0, 0.4235294, 1, 1,
0.2061172, 0.2971045, -1.448617, 0, 0.4196078, 1, 1,
0.2079035, 0.3095861, 2.43783, 0, 0.4117647, 1, 1,
0.2101238, -0.02467393, 1.225291, 0, 0.4078431, 1, 1,
0.2114353, 0.6052285, -0.2381815, 0, 0.4, 1, 1,
0.2158081, 1.495461, 0.9120619, 0, 0.3921569, 1, 1,
0.2185744, -0.6799732, 4.277063, 0, 0.3882353, 1, 1,
0.2232503, -0.2329421, 2.549566, 0, 0.3803922, 1, 1,
0.2234528, 0.6312441, -0.9648952, 0, 0.3764706, 1, 1,
0.2318455, -0.4349487, 4.44081, 0, 0.3686275, 1, 1,
0.2340268, -0.6388738, 2.283069, 0, 0.3647059, 1, 1,
0.2378032, 0.1173121, 1.702338, 0, 0.3568628, 1, 1,
0.2392777, -2.70643, 3.387728, 0, 0.3529412, 1, 1,
0.2420635, 2.873223, -0.7747619, 0, 0.345098, 1, 1,
0.2431757, -0.8393818, 1.778874, 0, 0.3411765, 1, 1,
0.244418, 1.011973, -0.665066, 0, 0.3333333, 1, 1,
0.2445074, -1.035159, 4.384137, 0, 0.3294118, 1, 1,
0.2453965, -1.226879, 2.297526, 0, 0.3215686, 1, 1,
0.2488212, -0.9042959, 2.551942, 0, 0.3176471, 1, 1,
0.2501391, -1.306688, 3.441228, 0, 0.3098039, 1, 1,
0.2531975, 0.1452592, 0.5037389, 0, 0.3058824, 1, 1,
0.2542984, 1.540996, -0.4944725, 0, 0.2980392, 1, 1,
0.2591432, 2.627314, -0.9434369, 0, 0.2901961, 1, 1,
0.2624641, -0.2461241, 2.592289, 0, 0.2862745, 1, 1,
0.2649108, -0.414807, 0.9815336, 0, 0.2784314, 1, 1,
0.2650729, -0.6118048, 2.776603, 0, 0.2745098, 1, 1,
0.2659432, 0.8246203, -0.4324432, 0, 0.2666667, 1, 1,
0.2661543, 0.8567926, 0.9361703, 0, 0.2627451, 1, 1,
0.2700328, 0.7108553, 1.172848, 0, 0.254902, 1, 1,
0.2737084, -0.5833224, 2.782305, 0, 0.2509804, 1, 1,
0.2809702, -1.038775, 1.419715, 0, 0.2431373, 1, 1,
0.2825573, 1.066648, 0.8135357, 0, 0.2392157, 1, 1,
0.286061, 0.8521094, 1.15817, 0, 0.2313726, 1, 1,
0.2876036, -0.3897483, 2.543211, 0, 0.227451, 1, 1,
0.2923833, 1.526366, -1.751089, 0, 0.2196078, 1, 1,
0.2938573, 1.265872, 0.5043437, 0, 0.2156863, 1, 1,
0.2955637, -0.2657218, 2.219038, 0, 0.2078431, 1, 1,
0.29745, 0.140884, 2.06496, 0, 0.2039216, 1, 1,
0.301691, -1.649749, 2.624973, 0, 0.1960784, 1, 1,
0.302519, 1.377545, -1.267533, 0, 0.1882353, 1, 1,
0.3028488, 0.4729515, -0.2886165, 0, 0.1843137, 1, 1,
0.3079438, -0.8976649, 2.559508, 0, 0.1764706, 1, 1,
0.308865, -1.13096, 2.009981, 0, 0.172549, 1, 1,
0.3115803, -0.6370929, 3.640024, 0, 0.1647059, 1, 1,
0.3118158, -0.3496914, 3.852468, 0, 0.1607843, 1, 1,
0.3119617, 0.139313, 0.770651, 0, 0.1529412, 1, 1,
0.3140738, -0.008552943, 0.1112506, 0, 0.1490196, 1, 1,
0.3215792, -0.03228619, 2.622362, 0, 0.1411765, 1, 1,
0.3232024, 2.032804, 0.4049211, 0, 0.1372549, 1, 1,
0.326366, -0.2810679, 1.722546, 0, 0.1294118, 1, 1,
0.3316714, 0.2042593, -0.1152531, 0, 0.1254902, 1, 1,
0.332379, -0.1497229, 2.697483, 0, 0.1176471, 1, 1,
0.3371715, 0.7048386, 0.3775384, 0, 0.1137255, 1, 1,
0.3378807, -0.1176599, 1.483818, 0, 0.1058824, 1, 1,
0.3450567, -0.9998727, 1.631476, 0, 0.09803922, 1, 1,
0.3472286, -1.543635, 4.856593, 0, 0.09411765, 1, 1,
0.3509699, -0.5827912, 2.365583, 0, 0.08627451, 1, 1,
0.3512198, -0.1142873, 0.7140542, 0, 0.08235294, 1, 1,
0.3516814, -1.362631, 3.250049, 0, 0.07450981, 1, 1,
0.3548394, 1.197054, 0.3948492, 0, 0.07058824, 1, 1,
0.3553221, 0.05751053, 0.8781943, 0, 0.0627451, 1, 1,
0.3553822, 0.1092282, 2.158836, 0, 0.05882353, 1, 1,
0.3558334, -0.6643819, 1.921174, 0, 0.05098039, 1, 1,
0.3560478, -0.5591518, 1.9561, 0, 0.04705882, 1, 1,
0.3561611, -1.816619, 3.344404, 0, 0.03921569, 1, 1,
0.356719, 0.02778986, 4.709961, 0, 0.03529412, 1, 1,
0.3630195, 0.2791075, 2.941688, 0, 0.02745098, 1, 1,
0.3637716, 0.6109435, -1.003601, 0, 0.02352941, 1, 1,
0.3669385, -0.4955093, 2.643718, 0, 0.01568628, 1, 1,
0.3674849, -0.5940836, 2.087244, 0, 0.01176471, 1, 1,
0.3698059, 0.1189633, -0.7524366, 0, 0.003921569, 1, 1,
0.3769609, 0.5384586, -0.2880245, 0.003921569, 0, 1, 1,
0.3779866, 0.2069491, 1.99147, 0.007843138, 0, 1, 1,
0.3794638, 1.622932, 1.63037, 0.01568628, 0, 1, 1,
0.3870496, 0.9426568, -0.4488773, 0.01960784, 0, 1, 1,
0.3888087, 1.998812, -1.449881, 0.02745098, 0, 1, 1,
0.391979, -0.07617043, 1.635285, 0.03137255, 0, 1, 1,
0.3935084, 0.2814957, 1.165164, 0.03921569, 0, 1, 1,
0.3954193, -1.667086, 3.231062, 0.04313726, 0, 1, 1,
0.3975694, -0.6489421, 2.159241, 0.05098039, 0, 1, 1,
0.3983385, 0.3963897, 2.898319, 0.05490196, 0, 1, 1,
0.4058715, 1.804771, 0.5612504, 0.0627451, 0, 1, 1,
0.4093138, 0.1599562, -0.8883049, 0.06666667, 0, 1, 1,
0.4126124, -0.6959062, 3.942933, 0.07450981, 0, 1, 1,
0.4136877, 1.321548, -0.1599643, 0.07843138, 0, 1, 1,
0.4161676, -1.092996, 2.431412, 0.08627451, 0, 1, 1,
0.4165017, 0.9490892, 1.341786, 0.09019608, 0, 1, 1,
0.4197778, 0.4176651, -0.4723642, 0.09803922, 0, 1, 1,
0.4237439, -1.083584, 2.616294, 0.1058824, 0, 1, 1,
0.4246424, -0.4804962, 3.095807, 0.1098039, 0, 1, 1,
0.4257852, 1.471171, 0.989483, 0.1176471, 0, 1, 1,
0.4260695, -1.326833, 2.518861, 0.1215686, 0, 1, 1,
0.4263404, 0.4617684, 1.934551, 0.1294118, 0, 1, 1,
0.4270498, -0.1083409, 2.608631, 0.1333333, 0, 1, 1,
0.4297275, -1.164911, 3.488456, 0.1411765, 0, 1, 1,
0.4311729, 0.8364863, 1.52792, 0.145098, 0, 1, 1,
0.4320522, -0.9290611, 0.03587821, 0.1529412, 0, 1, 1,
0.4335343, -1.486417, 3.790785, 0.1568628, 0, 1, 1,
0.4341752, 1.855758, 1.168961, 0.1647059, 0, 1, 1,
0.4379026, -0.05145769, 1.51604, 0.1686275, 0, 1, 1,
0.4401704, -0.9462934, 4.04602, 0.1764706, 0, 1, 1,
0.4468645, 0.1804387, 2.730215, 0.1803922, 0, 1, 1,
0.4508113, -1.051858, 1.679532, 0.1882353, 0, 1, 1,
0.4524624, -0.4024535, 2.174767, 0.1921569, 0, 1, 1,
0.4526548, 0.6788383, 0.4121834, 0.2, 0, 1, 1,
0.4532177, -0.3731862, 3.486815, 0.2078431, 0, 1, 1,
0.4631449, 2.580555, 0.1253829, 0.2117647, 0, 1, 1,
0.4719718, -0.1608858, 1.493244, 0.2196078, 0, 1, 1,
0.4791541, 2.706545, 0.1382483, 0.2235294, 0, 1, 1,
0.4839346, 0.2994134, 0.8064299, 0.2313726, 0, 1, 1,
0.48449, -0.182456, 1.660221, 0.2352941, 0, 1, 1,
0.485597, 0.8518213, 0.5308292, 0.2431373, 0, 1, 1,
0.4873037, 0.6219959, 2.421391, 0.2470588, 0, 1, 1,
0.4894181, 1.678388, -1.478104, 0.254902, 0, 1, 1,
0.4947525, 0.678448, 1.038789, 0.2588235, 0, 1, 1,
0.4954065, 0.6612967, 1.670386, 0.2666667, 0, 1, 1,
0.4963495, 0.8246351, 0.9099303, 0.2705882, 0, 1, 1,
0.4971449, -0.2916507, 1.889086, 0.2784314, 0, 1, 1,
0.4971966, 0.7441419, 1.670959, 0.282353, 0, 1, 1,
0.4977176, -0.683589, 1.438048, 0.2901961, 0, 1, 1,
0.5033882, 0.3533916, 0.8792595, 0.2941177, 0, 1, 1,
0.5041902, 0.2915151, 1.110941, 0.3019608, 0, 1, 1,
0.5056203, 0.3971541, 1.821128, 0.3098039, 0, 1, 1,
0.5067654, 0.8011605, 1.624578, 0.3137255, 0, 1, 1,
0.5082681, 0.2501279, -0.1393814, 0.3215686, 0, 1, 1,
0.5100733, -0.535917, 2.893868, 0.3254902, 0, 1, 1,
0.5135963, 0.3256297, 1.399887, 0.3333333, 0, 1, 1,
0.5147148, -1.447687, 1.781444, 0.3372549, 0, 1, 1,
0.5246716, 0.2456752, 0.5890767, 0.345098, 0, 1, 1,
0.5257099, -0.4542857, 3.045049, 0.3490196, 0, 1, 1,
0.5263932, 0.3282278, 0.8535761, 0.3568628, 0, 1, 1,
0.5271016, 0.1698356, 0.4615657, 0.3607843, 0, 1, 1,
0.5281182, 2.048963, -1.200179, 0.3686275, 0, 1, 1,
0.5292135, -0.446883, 3.217479, 0.372549, 0, 1, 1,
0.5297102, 1.174901, -1.483979, 0.3803922, 0, 1, 1,
0.5322344, 1.584172, -0.09483808, 0.3843137, 0, 1, 1,
0.5382382, -0.6361876, 2.910068, 0.3921569, 0, 1, 1,
0.5392815, 0.6492016, 0.5927737, 0.3960784, 0, 1, 1,
0.5409283, 0.4075276, 0.3700953, 0.4039216, 0, 1, 1,
0.5448235, 0.2612778, 3.014906, 0.4117647, 0, 1, 1,
0.5483158, 0.4697273, 1.992123, 0.4156863, 0, 1, 1,
0.5504351, -0.4274223, 2.442456, 0.4235294, 0, 1, 1,
0.5525266, 0.3454522, 1.541158, 0.427451, 0, 1, 1,
0.5527583, 0.06556272, 0.6180047, 0.4352941, 0, 1, 1,
0.5530757, -0.2906875, 1.7206, 0.4392157, 0, 1, 1,
0.566684, 1.30603, 1.443518, 0.4470588, 0, 1, 1,
0.5670767, -0.08542664, 3.910459, 0.4509804, 0, 1, 1,
0.5681964, -2.502575, 3.244905, 0.4588235, 0, 1, 1,
0.5717908, -0.7987196, 2.964919, 0.4627451, 0, 1, 1,
0.572999, 0.1737975, 2.153122, 0.4705882, 0, 1, 1,
0.5746406, -0.02043505, 2.590807, 0.4745098, 0, 1, 1,
0.5774494, -0.1897865, 1.179787, 0.4823529, 0, 1, 1,
0.5821173, 0.8324582, -0.5644609, 0.4862745, 0, 1, 1,
0.58276, 0.6586134, -0.1421226, 0.4941176, 0, 1, 1,
0.5830356, 0.7625322, 0.0359946, 0.5019608, 0, 1, 1,
0.5916087, -2.03716, 3.145614, 0.5058824, 0, 1, 1,
0.5936094, 0.7635964, -0.39621, 0.5137255, 0, 1, 1,
0.6014891, -0.2939378, 1.144452, 0.5176471, 0, 1, 1,
0.6024948, -0.745479, 2.466161, 0.5254902, 0, 1, 1,
0.6047318, -0.3347837, 3.54653, 0.5294118, 0, 1, 1,
0.6087126, 0.8718517, -0.4447987, 0.5372549, 0, 1, 1,
0.6099371, -0.003905897, 1.518244, 0.5411765, 0, 1, 1,
0.6105116, 0.6975635, 0.07327689, 0.5490196, 0, 1, 1,
0.6122553, -0.207951, 2.027707, 0.5529412, 0, 1, 1,
0.6129813, -0.07495023, 0.9022126, 0.5607843, 0, 1, 1,
0.613789, -0.6617114, 1.44434, 0.5647059, 0, 1, 1,
0.6157386, 0.304166, 1.202282, 0.572549, 0, 1, 1,
0.6161473, -0.5076251, 1.773755, 0.5764706, 0, 1, 1,
0.6220285, -1.31297, 2.470659, 0.5843138, 0, 1, 1,
0.6240689, -0.2247016, 1.211159, 0.5882353, 0, 1, 1,
0.6263291, -0.2255341, 1.157955, 0.5960785, 0, 1, 1,
0.6277116, -0.523301, 1.040244, 0.6039216, 0, 1, 1,
0.628144, -0.1524998, 0.9377933, 0.6078432, 0, 1, 1,
0.6314626, 0.1787523, 1.553938, 0.6156863, 0, 1, 1,
0.6393754, -1.557978, 2.608034, 0.6196079, 0, 1, 1,
0.640341, -0.9950736, 0.658676, 0.627451, 0, 1, 1,
0.6415452, -0.5038549, 3.107744, 0.6313726, 0, 1, 1,
0.6453313, -0.7192898, 2.913803, 0.6392157, 0, 1, 1,
0.6455116, -1.015064, 3.324726, 0.6431373, 0, 1, 1,
0.6467468, -1.109044, 2.286711, 0.6509804, 0, 1, 1,
0.6476779, 0.3134614, 2.470636, 0.654902, 0, 1, 1,
0.6507368, -1.612653, 5.288779, 0.6627451, 0, 1, 1,
0.6565659, -1.012232, 2.962467, 0.6666667, 0, 1, 1,
0.6567655, 1.244539, -0.434858, 0.6745098, 0, 1, 1,
0.6574884, -1.01565, 2.463961, 0.6784314, 0, 1, 1,
0.6597045, -0.6409338, 3.091466, 0.6862745, 0, 1, 1,
0.6610414, 0.009651249, 1.869749, 0.6901961, 0, 1, 1,
0.6618934, -0.7082167, 1.327791, 0.6980392, 0, 1, 1,
0.6698616, -1.293801, 1.708293, 0.7058824, 0, 1, 1,
0.6729217, -0.5990502, 3.459139, 0.7098039, 0, 1, 1,
0.6801665, -0.4282285, 2.731774, 0.7176471, 0, 1, 1,
0.6923729, -0.3662525, -0.1292621, 0.7215686, 0, 1, 1,
0.6950787, -0.2675603, 0.3450511, 0.7294118, 0, 1, 1,
0.6956233, 0.03056449, 1.258896, 0.7333333, 0, 1, 1,
0.6981091, -1.748955, 3.792032, 0.7411765, 0, 1, 1,
0.6986147, -0.3829427, 1.194216, 0.7450981, 0, 1, 1,
0.6989837, 0.09985114, 2.393974, 0.7529412, 0, 1, 1,
0.7046705, 0.7598801, -1.061931, 0.7568628, 0, 1, 1,
0.709156, 0.07128648, 0.2646833, 0.7647059, 0, 1, 1,
0.7118436, 0.0883076, 1.188095, 0.7686275, 0, 1, 1,
0.7147605, -0.1823402, 1.755208, 0.7764706, 0, 1, 1,
0.7150536, -0.1890059, 2.696832, 0.7803922, 0, 1, 1,
0.7202491, -0.3634546, 0.8096001, 0.7882353, 0, 1, 1,
0.7211986, 0.06607265, 2.123787, 0.7921569, 0, 1, 1,
0.7245095, -2.050729, 2.985182, 0.8, 0, 1, 1,
0.7290754, -0.6690176, 3.640622, 0.8078431, 0, 1, 1,
0.7344788, 0.2954368, 1.805937, 0.8117647, 0, 1, 1,
0.7347096, 2.191719, 0.3905013, 0.8196079, 0, 1, 1,
0.7361197, 0.3578963, 2.676761, 0.8235294, 0, 1, 1,
0.7403609, -1.10998, 1.764949, 0.8313726, 0, 1, 1,
0.7552184, -0.08898176, 2.183942, 0.8352941, 0, 1, 1,
0.7556852, 0.8368855, 1.020107, 0.8431373, 0, 1, 1,
0.7623332, 2.126595, 0.525377, 0.8470588, 0, 1, 1,
0.7673198, -0.5130815, 2.470623, 0.854902, 0, 1, 1,
0.7762614, -2.04423, 2.42914, 0.8588235, 0, 1, 1,
0.782382, -1.577366, 4.380747, 0.8666667, 0, 1, 1,
0.7824194, -1.362029, 4.290154, 0.8705882, 0, 1, 1,
0.7861214, 1.268237, 0.5189036, 0.8784314, 0, 1, 1,
0.7874294, -1.472381, 2.710968, 0.8823529, 0, 1, 1,
0.7888429, -0.2765367, 3.280511, 0.8901961, 0, 1, 1,
0.7904355, 0.6522228, -0.7920576, 0.8941177, 0, 1, 1,
0.7962263, 1.424445, -0.1830996, 0.9019608, 0, 1, 1,
0.8009099, 0.1237336, 2.115551, 0.9098039, 0, 1, 1,
0.8107112, 0.315753, 0.5124158, 0.9137255, 0, 1, 1,
0.8108865, 0.5623802, 0.7898549, 0.9215686, 0, 1, 1,
0.8172607, 0.6064537, 1.286119, 0.9254902, 0, 1, 1,
0.8193352, -1.346595, 4.012054, 0.9333333, 0, 1, 1,
0.8209673, -0.1336437, 2.270985, 0.9372549, 0, 1, 1,
0.8211753, -0.1000187, 1.738312, 0.945098, 0, 1, 1,
0.8214283, -0.871089, 2.902758, 0.9490196, 0, 1, 1,
0.8270408, 0.09403502, 2.230877, 0.9568627, 0, 1, 1,
0.8381547, -0.7778363, 3.061343, 0.9607843, 0, 1, 1,
0.8462148, -0.3900293, 1.857716, 0.9686275, 0, 1, 1,
0.8476961, -1.957146, 1.045329, 0.972549, 0, 1, 1,
0.8496957, 0.3890977, 1.253038, 0.9803922, 0, 1, 1,
0.8525134, -1.249266, 5.379224, 0.9843137, 0, 1, 1,
0.8549737, 0.6375355, 0.8991603, 0.9921569, 0, 1, 1,
0.8558135, 0.5720526, -1.124795, 0.9960784, 0, 1, 1,
0.8714328, -0.9633841, 2.968019, 1, 0, 0.9960784, 1,
0.8793204, 1.028514, 1.341208, 1, 0, 0.9882353, 1,
0.8804553, 0.04040492, 1.775793, 1, 0, 0.9843137, 1,
0.8809873, 1.016911, -0.9714266, 1, 0, 0.9764706, 1,
0.8831383, -0.1078462, 0.1700915, 1, 0, 0.972549, 1,
0.8856655, 0.2619932, 1.768068, 1, 0, 0.9647059, 1,
0.8881131, -0.2638811, 1.711206, 1, 0, 0.9607843, 1,
0.8991078, -0.7417071, 1.358463, 1, 0, 0.9529412, 1,
0.9053817, 0.1321552, 1.610927, 1, 0, 0.9490196, 1,
0.9210939, -0.9203171, 2.089694, 1, 0, 0.9411765, 1,
0.9286863, 0.934535, -0.1156918, 1, 0, 0.9372549, 1,
0.9375414, -0.7886443, 3.317524, 1, 0, 0.9294118, 1,
0.9439977, -0.1708816, 1.785704, 1, 0, 0.9254902, 1,
0.9477367, -0.1766429, -0.6578032, 1, 0, 0.9176471, 1,
0.9477697, -1.805762, 3.327549, 1, 0, 0.9137255, 1,
0.9526859, 0.04234224, 1.123156, 1, 0, 0.9058824, 1,
0.9534912, -1.097361, 3.164502, 1, 0, 0.9019608, 1,
0.9558591, -1.210385, 0.5804805, 1, 0, 0.8941177, 1,
0.9578826, 0.3909593, 0.8924019, 1, 0, 0.8862745, 1,
0.9744982, 0.6388791, 0.9160181, 1, 0, 0.8823529, 1,
0.9774573, 0.2467327, 1.27421, 1, 0, 0.8745098, 1,
0.98824, 0.6536866, -0.5302996, 1, 0, 0.8705882, 1,
1.005298, 0.4310443, 3.110802, 1, 0, 0.8627451, 1,
1.021043, -1.742635, 3.074813, 1, 0, 0.8588235, 1,
1.026175, 1.560008, 0.9278642, 1, 0, 0.8509804, 1,
1.027448, -0.4290148, 1.281123, 1, 0, 0.8470588, 1,
1.033123, 1.681266, 1.788784, 1, 0, 0.8392157, 1,
1.034344, -0.4883922, 3.75385, 1, 0, 0.8352941, 1,
1.034878, 0.2303335, 0.492231, 1, 0, 0.827451, 1,
1.040934, 0.8839796, 1.382203, 1, 0, 0.8235294, 1,
1.041931, 1.070854, 1.436131, 1, 0, 0.8156863, 1,
1.043489, 1.622934, -0.2701959, 1, 0, 0.8117647, 1,
1.044294, 1.267717, 0.2381515, 1, 0, 0.8039216, 1,
1.050086, 0.2818896, 0.6587864, 1, 0, 0.7960784, 1,
1.061084, 1.824314, 1.165052, 1, 0, 0.7921569, 1,
1.062455, -0.4170811, 1.193578, 1, 0, 0.7843137, 1,
1.077289, 0.8379886, -0.2471057, 1, 0, 0.7803922, 1,
1.090913, -0.5708362, 2.158487, 1, 0, 0.772549, 1,
1.096502, 0.04449918, 2.338061, 1, 0, 0.7686275, 1,
1.0989, 0.04124676, 1.525022, 1, 0, 0.7607843, 1,
1.110561, -0.6030409, 1.73717, 1, 0, 0.7568628, 1,
1.11347, -0.9783657, 2.001399, 1, 0, 0.7490196, 1,
1.125588, -0.04754914, 1.733043, 1, 0, 0.7450981, 1,
1.128368, -0.01385358, 3.028414, 1, 0, 0.7372549, 1,
1.129909, -0.5759068, 2.435177, 1, 0, 0.7333333, 1,
1.136227, 0.6910625, 1.551656, 1, 0, 0.7254902, 1,
1.136474, 0.3314138, 1.233668, 1, 0, 0.7215686, 1,
1.148277, 0.1109549, 2.061503, 1, 0, 0.7137255, 1,
1.158975, 0.008580325, 2.161492, 1, 0, 0.7098039, 1,
1.16407, -1.108649, 3.679938, 1, 0, 0.7019608, 1,
1.172196, -0.08123498, 0.8535394, 1, 0, 0.6941177, 1,
1.173825, 2.356616, 0.1251348, 1, 0, 0.6901961, 1,
1.189773, -0.3191197, 0.6270888, 1, 0, 0.682353, 1,
1.198533, 1.280659, -0.2894737, 1, 0, 0.6784314, 1,
1.200873, -0.4737378, 1.566414, 1, 0, 0.6705883, 1,
1.212783, 1.804895, 0.09705221, 1, 0, 0.6666667, 1,
1.214659, 0.4464584, 0.1575543, 1, 0, 0.6588235, 1,
1.220845, -1.79509, 3.907065, 1, 0, 0.654902, 1,
1.224153, -0.08990104, 0.4708663, 1, 0, 0.6470588, 1,
1.231589, 0.6586627, 2.375296, 1, 0, 0.6431373, 1,
1.238009, -0.2876551, 2.116084, 1, 0, 0.6352941, 1,
1.239245, 1.816876, 0.4133897, 1, 0, 0.6313726, 1,
1.243179, -2.10219, 2.804371, 1, 0, 0.6235294, 1,
1.247897, -0.5628914, 3.170735, 1, 0, 0.6196079, 1,
1.252927, 0.6505188, 1.104523, 1, 0, 0.6117647, 1,
1.253959, -0.318078, 2.081887, 1, 0, 0.6078432, 1,
1.262196, 1.130787, 1.260396, 1, 0, 0.6, 1,
1.272075, 0.1121983, 1.548126, 1, 0, 0.5921569, 1,
1.278133, 0.8888306, 1.158184, 1, 0, 0.5882353, 1,
1.279504, -1.914462, 3.06009, 1, 0, 0.5803922, 1,
1.279603, -1.502163, 2.440456, 1, 0, 0.5764706, 1,
1.283293, 0.9169002, 1.221949, 1, 0, 0.5686275, 1,
1.287205, -0.976114, 2.547612, 1, 0, 0.5647059, 1,
1.308395, -1.594306, 0.07990202, 1, 0, 0.5568628, 1,
1.313185, -0.2503452, 0.8286611, 1, 0, 0.5529412, 1,
1.317884, 0.2920255, 2.359111, 1, 0, 0.5450981, 1,
1.334083, -1.029544, 2.665719, 1, 0, 0.5411765, 1,
1.336021, 0.05278082, 2.433887, 1, 0, 0.5333334, 1,
1.336428, -0.1369852, 1.682847, 1, 0, 0.5294118, 1,
1.341096, 0.2761397, 2.323767, 1, 0, 0.5215687, 1,
1.343823, 2.269078, 0.2060782, 1, 0, 0.5176471, 1,
1.355656, 1.119324, 1.530122, 1, 0, 0.509804, 1,
1.356418, -0.1926454, 1.769198, 1, 0, 0.5058824, 1,
1.357824, -1.988512, 4.346193, 1, 0, 0.4980392, 1,
1.363869, 0.6287635, 3.209645, 1, 0, 0.4901961, 1,
1.366262, 0.2725354, 1.323074, 1, 0, 0.4862745, 1,
1.368991, 0.2701606, 0.552759, 1, 0, 0.4784314, 1,
1.370192, 0.5726896, 1.78343, 1, 0, 0.4745098, 1,
1.384816, 0.6278068, -1.050905, 1, 0, 0.4666667, 1,
1.386407, -0.8243999, 4.033608, 1, 0, 0.4627451, 1,
1.387462, 1.099491, 0.4554847, 1, 0, 0.454902, 1,
1.392981, 1.560416, -0.3550589, 1, 0, 0.4509804, 1,
1.410828, 1.028976, -0.8216069, 1, 0, 0.4431373, 1,
1.412061, -1.079771, 3.003171, 1, 0, 0.4392157, 1,
1.418184, 0.6771463, 0.1534126, 1, 0, 0.4313726, 1,
1.427788, -0.4592527, 1.692583, 1, 0, 0.427451, 1,
1.431047, 0.4080086, 0.5281675, 1, 0, 0.4196078, 1,
1.431617, 0.2484163, 1.470824, 1, 0, 0.4156863, 1,
1.447733, -0.5438418, 2.005349, 1, 0, 0.4078431, 1,
1.448349, 1.236863, -0.105315, 1, 0, 0.4039216, 1,
1.460007, 0.6798149, 3.307652, 1, 0, 0.3960784, 1,
1.46556, 1.927206, 0.9773835, 1, 0, 0.3882353, 1,
1.467539, -0.7609116, 3.46874, 1, 0, 0.3843137, 1,
1.471268, -0.3676574, 1.417474, 1, 0, 0.3764706, 1,
1.473212, -1.302584, 3.140491, 1, 0, 0.372549, 1,
1.478677, 0.7111417, -0.5912787, 1, 0, 0.3647059, 1,
1.495358, 0.6618026, 1.386153, 1, 0, 0.3607843, 1,
1.502164, 0.3056278, 2.319342, 1, 0, 0.3529412, 1,
1.504756, 0.5474913, 2.362707, 1, 0, 0.3490196, 1,
1.554474, 0.9458341, 2.469013, 1, 0, 0.3411765, 1,
1.598489, -0.8459967, 2.645105, 1, 0, 0.3372549, 1,
1.603462, -0.9087674, 2.939998, 1, 0, 0.3294118, 1,
1.604291, 0.4300081, 1.418523, 1, 0, 0.3254902, 1,
1.613187, -0.4999314, 5.238717, 1, 0, 0.3176471, 1,
1.613326, 0.09672772, 2.609635, 1, 0, 0.3137255, 1,
1.618589, 0.02008488, 1.842164, 1, 0, 0.3058824, 1,
1.618933, 0.9697856, 0.560849, 1, 0, 0.2980392, 1,
1.657653, 0.5817163, 0.9996561, 1, 0, 0.2941177, 1,
1.664945, 0.2002852, 1.532672, 1, 0, 0.2862745, 1,
1.666712, -2.051547, 1.712089, 1, 0, 0.282353, 1,
1.667733, 0.8291188, 2.423591, 1, 0, 0.2745098, 1,
1.694693, -2.148631, 3.212766, 1, 0, 0.2705882, 1,
1.697583, 0.1325064, 2.190665, 1, 0, 0.2627451, 1,
1.698246, -0.06629093, 1.008671, 1, 0, 0.2588235, 1,
1.703029, 1.085646, 0.3533125, 1, 0, 0.2509804, 1,
1.706221, 1.202755, 0.2709864, 1, 0, 0.2470588, 1,
1.719106, -0.3037364, 1.723864, 1, 0, 0.2392157, 1,
1.720948, -0.177794, 1.620525, 1, 0, 0.2352941, 1,
1.749344, -0.5361276, 1.106469, 1, 0, 0.227451, 1,
1.767733, 0.5397438, -0.5904052, 1, 0, 0.2235294, 1,
1.773155, -1.014015, 3.432467, 1, 0, 0.2156863, 1,
1.785605, -1.144934, 1.443533, 1, 0, 0.2117647, 1,
1.793389, 0.7545839, 2.165459, 1, 0, 0.2039216, 1,
1.820111, 0.7866434, 0.879307, 1, 0, 0.1960784, 1,
1.832767, -0.5931469, 2.667939, 1, 0, 0.1921569, 1,
1.840813, -0.7809992, 1.535802, 1, 0, 0.1843137, 1,
1.864766, 0.7200916, 1.691668, 1, 0, 0.1803922, 1,
1.881413, -1.44558, 0.2157976, 1, 0, 0.172549, 1,
1.882741, -1.099685, 2.801105, 1, 0, 0.1686275, 1,
1.895233, -0.5766703, 1.554823, 1, 0, 0.1607843, 1,
1.895446, 0.3395419, 0.4712057, 1, 0, 0.1568628, 1,
1.936583, 1.674718, 1.199598, 1, 0, 0.1490196, 1,
1.943411, -0.6059977, 1.67845, 1, 0, 0.145098, 1,
1.982163, -1.114125, 1.654817, 1, 0, 0.1372549, 1,
2.016108, 0.8849423, 0.3676367, 1, 0, 0.1333333, 1,
2.066887, 0.4119871, 1.99284, 1, 0, 0.1254902, 1,
2.068027, -1.828692, 3.275279, 1, 0, 0.1215686, 1,
2.106867, -2.134557, 2.37582, 1, 0, 0.1137255, 1,
2.123503, 0.2808115, 1.114363, 1, 0, 0.1098039, 1,
2.144745, -1.28881, 1.850463, 1, 0, 0.1019608, 1,
2.17156, 1.910998, 2.208845, 1, 0, 0.09411765, 1,
2.175936, 0.5255737, 1.601433, 1, 0, 0.09019608, 1,
2.194159, -1.202106, 2.097611, 1, 0, 0.08235294, 1,
2.258525, -0.2383272, 2.987054, 1, 0, 0.07843138, 1,
2.295252, -1.42971, 1.127645, 1, 0, 0.07058824, 1,
2.368636, -0.1876536, 1.699771, 1, 0, 0.06666667, 1,
2.449297, -0.9651403, 2.175061, 1, 0, 0.05882353, 1,
2.585317, 0.3371265, 1.063945, 1, 0, 0.05490196, 1,
2.60941, -0.2531163, 2.528365, 1, 0, 0.04705882, 1,
2.684256, -0.6277928, 1.997757, 1, 0, 0.04313726, 1,
2.690422, 1.860447, 0.8934029, 1, 0, 0.03529412, 1,
2.745289, -0.05883969, 2.001039, 1, 0, 0.03137255, 1,
2.866045, -1.42774, 2.727525, 1, 0, 0.02352941, 1,
2.964792, -0.750408, 0.8407474, 1, 0, 0.01960784, 1,
3.017627, 0.8435796, 2.04674, 1, 0, 0.01176471, 1,
3.039901, -0.4873312, 2.348347, 1, 0, 0.007843138, 1
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
-0.1127905, -3.979436, -6.817655, 0, -0.5, 0.5, 0.5,
-0.1127905, -3.979436, -6.817655, 1, -0.5, 0.5, 0.5,
-0.1127905, -3.979436, -6.817655, 1, 1.5, 0.5, 0.5,
-0.1127905, -3.979436, -6.817655, 0, 1.5, 0.5, 0.5
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
-4.334245, 0.0767616, -6.817655, 0, -0.5, 0.5, 0.5,
-4.334245, 0.0767616, -6.817655, 1, -0.5, 0.5, 0.5,
-4.334245, 0.0767616, -6.817655, 1, 1.5, 0.5, 0.5,
-4.334245, 0.0767616, -6.817655, 0, 1.5, 0.5, 0.5
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
-4.334245, -3.979436, 0.3046896, 0, -0.5, 0.5, 0.5,
-4.334245, -3.979436, 0.3046896, 1, -0.5, 0.5, 0.5,
-4.334245, -3.979436, 0.3046896, 1, 1.5, 0.5, 0.5,
-4.334245, -3.979436, 0.3046896, 0, 1.5, 0.5, 0.5
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
-3, -3.043391, -5.174037,
3, -3.043391, -5.174037,
-3, -3.043391, -5.174037,
-3, -3.199398, -5.447973,
-2, -3.043391, -5.174037,
-2, -3.199398, -5.447973,
-1, -3.043391, -5.174037,
-1, -3.199398, -5.447973,
0, -3.043391, -5.174037,
0, -3.199398, -5.447973,
1, -3.043391, -5.174037,
1, -3.199398, -5.447973,
2, -3.043391, -5.174037,
2, -3.199398, -5.447973,
3, -3.043391, -5.174037,
3, -3.199398, -5.447973
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
-3, -3.511414, -5.995846, 0, -0.5, 0.5, 0.5,
-3, -3.511414, -5.995846, 1, -0.5, 0.5, 0.5,
-3, -3.511414, -5.995846, 1, 1.5, 0.5, 0.5,
-3, -3.511414, -5.995846, 0, 1.5, 0.5, 0.5,
-2, -3.511414, -5.995846, 0, -0.5, 0.5, 0.5,
-2, -3.511414, -5.995846, 1, -0.5, 0.5, 0.5,
-2, -3.511414, -5.995846, 1, 1.5, 0.5, 0.5,
-2, -3.511414, -5.995846, 0, 1.5, 0.5, 0.5,
-1, -3.511414, -5.995846, 0, -0.5, 0.5, 0.5,
-1, -3.511414, -5.995846, 1, -0.5, 0.5, 0.5,
-1, -3.511414, -5.995846, 1, 1.5, 0.5, 0.5,
-1, -3.511414, -5.995846, 0, 1.5, 0.5, 0.5,
0, -3.511414, -5.995846, 0, -0.5, 0.5, 0.5,
0, -3.511414, -5.995846, 1, -0.5, 0.5, 0.5,
0, -3.511414, -5.995846, 1, 1.5, 0.5, 0.5,
0, -3.511414, -5.995846, 0, 1.5, 0.5, 0.5,
1, -3.511414, -5.995846, 0, -0.5, 0.5, 0.5,
1, -3.511414, -5.995846, 1, -0.5, 0.5, 0.5,
1, -3.511414, -5.995846, 1, 1.5, 0.5, 0.5,
1, -3.511414, -5.995846, 0, 1.5, 0.5, 0.5,
2, -3.511414, -5.995846, 0, -0.5, 0.5, 0.5,
2, -3.511414, -5.995846, 1, -0.5, 0.5, 0.5,
2, -3.511414, -5.995846, 1, 1.5, 0.5, 0.5,
2, -3.511414, -5.995846, 0, 1.5, 0.5, 0.5,
3, -3.511414, -5.995846, 0, -0.5, 0.5, 0.5,
3, -3.511414, -5.995846, 1, -0.5, 0.5, 0.5,
3, -3.511414, -5.995846, 1, 1.5, 0.5, 0.5,
3, -3.511414, -5.995846, 0, 1.5, 0.5, 0.5
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
-3.360063, -2, -5.174037,
-3.360063, 3, -5.174037,
-3.360063, -2, -5.174037,
-3.522427, -2, -5.447973,
-3.360063, -1, -5.174037,
-3.522427, -1, -5.447973,
-3.360063, 0, -5.174037,
-3.522427, 0, -5.447973,
-3.360063, 1, -5.174037,
-3.522427, 1, -5.447973,
-3.360063, 2, -5.174037,
-3.522427, 2, -5.447973,
-3.360063, 3, -5.174037,
-3.522427, 3, -5.447973
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
-3.847154, -2, -5.995846, 0, -0.5, 0.5, 0.5,
-3.847154, -2, -5.995846, 1, -0.5, 0.5, 0.5,
-3.847154, -2, -5.995846, 1, 1.5, 0.5, 0.5,
-3.847154, -2, -5.995846, 0, 1.5, 0.5, 0.5,
-3.847154, -1, -5.995846, 0, -0.5, 0.5, 0.5,
-3.847154, -1, -5.995846, 1, -0.5, 0.5, 0.5,
-3.847154, -1, -5.995846, 1, 1.5, 0.5, 0.5,
-3.847154, -1, -5.995846, 0, 1.5, 0.5, 0.5,
-3.847154, 0, -5.995846, 0, -0.5, 0.5, 0.5,
-3.847154, 0, -5.995846, 1, -0.5, 0.5, 0.5,
-3.847154, 0, -5.995846, 1, 1.5, 0.5, 0.5,
-3.847154, 0, -5.995846, 0, 1.5, 0.5, 0.5,
-3.847154, 1, -5.995846, 0, -0.5, 0.5, 0.5,
-3.847154, 1, -5.995846, 1, -0.5, 0.5, 0.5,
-3.847154, 1, -5.995846, 1, 1.5, 0.5, 0.5,
-3.847154, 1, -5.995846, 0, 1.5, 0.5, 0.5,
-3.847154, 2, -5.995846, 0, -0.5, 0.5, 0.5,
-3.847154, 2, -5.995846, 1, -0.5, 0.5, 0.5,
-3.847154, 2, -5.995846, 1, 1.5, 0.5, 0.5,
-3.847154, 2, -5.995846, 0, 1.5, 0.5, 0.5,
-3.847154, 3, -5.995846, 0, -0.5, 0.5, 0.5,
-3.847154, 3, -5.995846, 1, -0.5, 0.5, 0.5,
-3.847154, 3, -5.995846, 1, 1.5, 0.5, 0.5,
-3.847154, 3, -5.995846, 0, 1.5, 0.5, 0.5
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
-3.360063, -3.043391, -4,
-3.360063, -3.043391, 4,
-3.360063, -3.043391, -4,
-3.522427, -3.199398, -4,
-3.360063, -3.043391, -2,
-3.522427, -3.199398, -2,
-3.360063, -3.043391, 0,
-3.522427, -3.199398, 0,
-3.360063, -3.043391, 2,
-3.522427, -3.199398, 2,
-3.360063, -3.043391, 4,
-3.522427, -3.199398, 4
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
-3.847154, -3.511414, -4, 0, -0.5, 0.5, 0.5,
-3.847154, -3.511414, -4, 1, -0.5, 0.5, 0.5,
-3.847154, -3.511414, -4, 1, 1.5, 0.5, 0.5,
-3.847154, -3.511414, -4, 0, 1.5, 0.5, 0.5,
-3.847154, -3.511414, -2, 0, -0.5, 0.5, 0.5,
-3.847154, -3.511414, -2, 1, -0.5, 0.5, 0.5,
-3.847154, -3.511414, -2, 1, 1.5, 0.5, 0.5,
-3.847154, -3.511414, -2, 0, 1.5, 0.5, 0.5,
-3.847154, -3.511414, 0, 0, -0.5, 0.5, 0.5,
-3.847154, -3.511414, 0, 1, -0.5, 0.5, 0.5,
-3.847154, -3.511414, 0, 1, 1.5, 0.5, 0.5,
-3.847154, -3.511414, 0, 0, 1.5, 0.5, 0.5,
-3.847154, -3.511414, 2, 0, -0.5, 0.5, 0.5,
-3.847154, -3.511414, 2, 1, -0.5, 0.5, 0.5,
-3.847154, -3.511414, 2, 1, 1.5, 0.5, 0.5,
-3.847154, -3.511414, 2, 0, 1.5, 0.5, 0.5,
-3.847154, -3.511414, 4, 0, -0.5, 0.5, 0.5,
-3.847154, -3.511414, 4, 1, -0.5, 0.5, 0.5,
-3.847154, -3.511414, 4, 1, 1.5, 0.5, 0.5,
-3.847154, -3.511414, 4, 0, 1.5, 0.5, 0.5
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
-3.360063, -3.043391, -5.174037,
-3.360063, 3.196914, -5.174037,
-3.360063, -3.043391, 5.783416,
-3.360063, 3.196914, 5.783416,
-3.360063, -3.043391, -5.174037,
-3.360063, -3.043391, 5.783416,
-3.360063, 3.196914, -5.174037,
-3.360063, 3.196914, 5.783416,
-3.360063, -3.043391, -5.174037,
3.134482, -3.043391, -5.174037,
-3.360063, -3.043391, 5.783416,
3.134482, -3.043391, 5.783416,
-3.360063, 3.196914, -5.174037,
3.134482, 3.196914, -5.174037,
-3.360063, 3.196914, 5.783416,
3.134482, 3.196914, 5.783416,
3.134482, -3.043391, -5.174037,
3.134482, 3.196914, -5.174037,
3.134482, -3.043391, 5.783416,
3.134482, 3.196914, 5.783416,
3.134482, -3.043391, -5.174037,
3.134482, -3.043391, 5.783416,
3.134482, 3.196914, -5.174037,
3.134482, 3.196914, 5.783416
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
var radius = 7.573989;
var distance = 33.69753;
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
mvMatrix.translate( 0.1127905, -0.0767616, -0.3046896 );
mvMatrix.scale( 1.260927, 1.312299, 0.7473584 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69753);
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
phosphonate<-read.table("phosphonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphonate' not found
```

```r
y<-phosphonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphonate' not found
```

```r
z<-phosphonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphonate' not found
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
-3.265482, -0.8122514, -2.564677, 0, 0, 1, 1, 1,
-3.087204, -0.09766003, -2.148615, 1, 0, 0, 1, 1,
-3.055927, -0.4254411, -2.243218, 1, 0, 0, 1, 1,
-2.784415, -0.6128302, -2.957169, 1, 0, 0, 1, 1,
-2.72491, -1.101379, -1.877662, 1, 0, 0, 1, 1,
-2.53584, -1.987029, -1.668494, 1, 0, 0, 1, 1,
-2.394194, -1.026808, -2.611627, 0, 0, 0, 1, 1,
-2.373471, -0.45437, -2.098371, 0, 0, 0, 1, 1,
-2.372563, 0.6547493, -3.058735, 0, 0, 0, 1, 1,
-2.358306, 0.7801815, -1.064496, 0, 0, 0, 1, 1,
-2.346932, -0.5167949, -1.748023, 0, 0, 0, 1, 1,
-2.289047, -0.4554535, -2.44398, 0, 0, 0, 1, 1,
-2.283647, 1.382325, 0.6260943, 0, 0, 0, 1, 1,
-2.283593, -1.905997, -0.9363542, 1, 1, 1, 1, 1,
-2.210779, 0.7252958, -2.194483, 1, 1, 1, 1, 1,
-2.194914, 0.9912605, -2.593949, 1, 1, 1, 1, 1,
-2.161492, -0.06598905, -3.032307, 1, 1, 1, 1, 1,
-2.145537, -0.7167147, -1.553292, 1, 1, 1, 1, 1,
-2.106855, 0.4727633, -1.000067, 1, 1, 1, 1, 1,
-2.075838, -1.054923, -1.072505, 1, 1, 1, 1, 1,
-2.075111, -1.498919, -3.625515, 1, 1, 1, 1, 1,
-2.073891, -0.0224746, -1.62209, 1, 1, 1, 1, 1,
-2.070933, 0.8248463, -2.608037, 1, 1, 1, 1, 1,
-2.00892, 0.5169725, -1.31807, 1, 1, 1, 1, 1,
-1.982455, -1.099987, -1.0806, 1, 1, 1, 1, 1,
-1.968932, -1.03387, -2.418921, 1, 1, 1, 1, 1,
-1.956393, -0.7897226, -3.657482, 1, 1, 1, 1, 1,
-1.938327, 0.2581987, -1.280392, 1, 1, 1, 1, 1,
-1.925345, -0.6027757, -1.889319, 0, 0, 1, 1, 1,
-1.920397, -1.494364, -1.886351, 1, 0, 0, 1, 1,
-1.891212, 0.004241738, -1.373682, 1, 0, 0, 1, 1,
-1.887419, 0.3329732, -1.218136, 1, 0, 0, 1, 1,
-1.839107, -0.6844687, -4.090376, 1, 0, 0, 1, 1,
-1.830428, 1.033003, -0.7079104, 1, 0, 0, 1, 1,
-1.827264, -1.097906, -1.363157, 0, 0, 0, 1, 1,
-1.825999, -0.1918493, -0.2043986, 0, 0, 0, 1, 1,
-1.804307, -0.3468886, -2.977416, 0, 0, 0, 1, 1,
-1.801859, -1.105555, -4.323567, 0, 0, 0, 1, 1,
-1.775103, -0.2191975, -1.658865, 0, 0, 0, 1, 1,
-1.767596, 1.071993, -1.152851, 0, 0, 0, 1, 1,
-1.764375, -0.9488485, -1.242609, 0, 0, 0, 1, 1,
-1.76211, -0.5446933, -0.7120798, 1, 1, 1, 1, 1,
-1.758506, -0.8039151, -2.041337, 1, 1, 1, 1, 1,
-1.754864, 0.5076249, 1.398702, 1, 1, 1, 1, 1,
-1.746697, 1.240813, -2.366824, 1, 1, 1, 1, 1,
-1.723609, 2.146835, 0.5616608, 1, 1, 1, 1, 1,
-1.722332, 0.622508, -1.545621, 1, 1, 1, 1, 1,
-1.714285, 1.543525, -1.021476, 1, 1, 1, 1, 1,
-1.712388, 1.862824, -1.163979, 1, 1, 1, 1, 1,
-1.704765, -0.3108013, -3.389424, 1, 1, 1, 1, 1,
-1.701417, -1.358754, -2.306296, 1, 1, 1, 1, 1,
-1.676174, -1.121712, -1.804077, 1, 1, 1, 1, 1,
-1.668682, 0.5521098, -1.890253, 1, 1, 1, 1, 1,
-1.657804, -0.2520773, -2.19614, 1, 1, 1, 1, 1,
-1.647694, 1.109753, -2.000821, 1, 1, 1, 1, 1,
-1.615648, -0.06878913, -0.5260198, 1, 1, 1, 1, 1,
-1.609735, -0.212414, -2.038502, 0, 0, 1, 1, 1,
-1.609492, -0.1861473, -2.805703, 1, 0, 0, 1, 1,
-1.576138, 0.1480889, -3.723578, 1, 0, 0, 1, 1,
-1.574491, 0.9505623, -1.340549, 1, 0, 0, 1, 1,
-1.563195, 1.120058, -1.094315, 1, 0, 0, 1, 1,
-1.5525, -0.9097682, -2.714006, 1, 0, 0, 1, 1,
-1.550967, 0.09633851, -1.289875, 0, 0, 0, 1, 1,
-1.543388, 0.3086143, -0.435718, 0, 0, 0, 1, 1,
-1.529433, 0.1038194, -2.015217, 0, 0, 0, 1, 1,
-1.523023, 1.204975, -0.6661192, 0, 0, 0, 1, 1,
-1.523004, 0.09611677, -2.615724, 0, 0, 0, 1, 1,
-1.521111, -0.05523711, -2.554019, 0, 0, 0, 1, 1,
-1.514511, -0.1970091, -2.629832, 0, 0, 0, 1, 1,
-1.505527, -1.691953, -3.455071, 1, 1, 1, 1, 1,
-1.504564, -0.8499566, -1.919389, 1, 1, 1, 1, 1,
-1.501981, -0.1220446, -1.24797, 1, 1, 1, 1, 1,
-1.492626, -1.117869, -1.96812, 1, 1, 1, 1, 1,
-1.492237, 0.9758713, -0.6165899, 1, 1, 1, 1, 1,
-1.490257, -1.449148, -3.419705, 1, 1, 1, 1, 1,
-1.489871, -1.909022, -3.69349, 1, 1, 1, 1, 1,
-1.478431, -1.060246, -2.995195, 1, 1, 1, 1, 1,
-1.473042, 0.8365031, -2.375964, 1, 1, 1, 1, 1,
-1.467638, -1.259998, -1.433565, 1, 1, 1, 1, 1,
-1.467127, -0.0320405, -1.501734, 1, 1, 1, 1, 1,
-1.463426, -0.6893468, -3.255929, 1, 1, 1, 1, 1,
-1.456178, 2.786417, -0.5774373, 1, 1, 1, 1, 1,
-1.453458, 0.1128248, -0.6156666, 1, 1, 1, 1, 1,
-1.445663, -0.3083303, -1.841768, 1, 1, 1, 1, 1,
-1.438718, 0.2097272, 0.1258793, 0, 0, 1, 1, 1,
-1.437222, 0.1297215, -1.692447, 1, 0, 0, 1, 1,
-1.423607, 0.5412853, -1.331244, 1, 0, 0, 1, 1,
-1.421055, -1.301328, -2.06023, 1, 0, 0, 1, 1,
-1.419371, -1.84158, -2.684335, 1, 0, 0, 1, 1,
-1.416104, -1.312783, -3.97491, 1, 0, 0, 1, 1,
-1.401185, 1.318744, -1.702754, 0, 0, 0, 1, 1,
-1.396955, -0.730589, -0.4197519, 0, 0, 0, 1, 1,
-1.381296, -1.199247, -1.877372, 0, 0, 0, 1, 1,
-1.380072, 0.3738056, -0.483718, 0, 0, 0, 1, 1,
-1.37496, -1.468783, -1.558643, 0, 0, 0, 1, 1,
-1.355914, 0.3702982, -1.273432, 0, 0, 0, 1, 1,
-1.350345, 0.5777696, -0.4742505, 0, 0, 0, 1, 1,
-1.346709, 0.0761459, -1.467215, 1, 1, 1, 1, 1,
-1.344887, -1.887322, -2.122879, 1, 1, 1, 1, 1,
-1.340903, 1.589364, -1.257972, 1, 1, 1, 1, 1,
-1.334057, 0.9111282, -0.4934443, 1, 1, 1, 1, 1,
-1.327457, 2.132144, -0.1972067, 1, 1, 1, 1, 1,
-1.325117, -1.823686, -2.900028, 1, 1, 1, 1, 1,
-1.311511, -1.441114, -2.673676, 1, 1, 1, 1, 1,
-1.310033, 0.1105647, -3.417278, 1, 1, 1, 1, 1,
-1.300633, 0.2270527, 0.4780957, 1, 1, 1, 1, 1,
-1.300481, 0.9222944, -0.02888032, 1, 1, 1, 1, 1,
-1.29994, 0.4696603, -2.016764, 1, 1, 1, 1, 1,
-1.292596, 1.424887, -2.380803, 1, 1, 1, 1, 1,
-1.29123, -1.116113, -3.150626, 1, 1, 1, 1, 1,
-1.290647, -1.344536, -2.647106, 1, 1, 1, 1, 1,
-1.289649, 0.2219523, -0.1062044, 1, 1, 1, 1, 1,
-1.274433, -0.1674005, -2.457157, 0, 0, 1, 1, 1,
-1.27032, -0.6723375, -1.036052, 1, 0, 0, 1, 1,
-1.258221, 1.713925, -1.992697, 1, 0, 0, 1, 1,
-1.257059, 1.407595, -1.563064, 1, 0, 0, 1, 1,
-1.250074, 0.5998896, -0.1379739, 1, 0, 0, 1, 1,
-1.244445, 1.26853, 1.680737, 1, 0, 0, 1, 1,
-1.241638, -0.04228183, -1.793817, 0, 0, 0, 1, 1,
-1.241179, 1.474221, -2.33272, 0, 0, 0, 1, 1,
-1.235507, -0.9593151, -1.731851, 0, 0, 0, 1, 1,
-1.234795, 0.630909, -0.02741644, 0, 0, 0, 1, 1,
-1.230479, 0.5340056, 0.3563266, 0, 0, 0, 1, 1,
-1.221695, 1.412735, -0.5141709, 0, 0, 0, 1, 1,
-1.220644, 0.6317053, -1.336554, 0, 0, 0, 1, 1,
-1.212722, 0.7516724, -1.341724, 1, 1, 1, 1, 1,
-1.211781, 0.5072967, -3.0878, 1, 1, 1, 1, 1,
-1.209723, -0.4483503, -0.815928, 1, 1, 1, 1, 1,
-1.208569, 0.5363653, -1.617745, 1, 1, 1, 1, 1,
-1.185039, 2.47571, 1.580413, 1, 1, 1, 1, 1,
-1.182459, -0.6393019, -0.7061577, 1, 1, 1, 1, 1,
-1.179007, 0.8016196, 0.1604661, 1, 1, 1, 1, 1,
-1.177384, -1.565373, -1.130739, 1, 1, 1, 1, 1,
-1.173822, 0.6415758, 0.230545, 1, 1, 1, 1, 1,
-1.161414, -1.767749, -5.014462, 1, 1, 1, 1, 1,
-1.160542, 0.3130607, -1.160408, 1, 1, 1, 1, 1,
-1.158014, -0.5856898, -2.881212, 1, 1, 1, 1, 1,
-1.157673, -1.142617, -2.299862, 1, 1, 1, 1, 1,
-1.157553, 0.7491509, -0.09684595, 1, 1, 1, 1, 1,
-1.153205, 1.025238, 0.07175077, 1, 1, 1, 1, 1,
-1.146596, 0.153557, -1.200216, 0, 0, 1, 1, 1,
-1.142268, 1.535064, 0.1881287, 1, 0, 0, 1, 1,
-1.141882, -0.02222051, -2.977483, 1, 0, 0, 1, 1,
-1.134685, 1.00117, -0.2061141, 1, 0, 0, 1, 1,
-1.126752, 1.024772, 0.2400509, 1, 0, 0, 1, 1,
-1.121118, -1.084462, -2.327621, 1, 0, 0, 1, 1,
-1.11472, -1.758111, -0.4700711, 0, 0, 0, 1, 1,
-1.110638, 0.6475026, -0.5708588, 0, 0, 0, 1, 1,
-1.104159, -0.6449679, -2.506509, 0, 0, 0, 1, 1,
-1.102518, 0.9744706, -1.813603, 0, 0, 0, 1, 1,
-1.094018, -0.1642882, 0.1255843, 0, 0, 0, 1, 1,
-1.093847, 0.6949933, -0.3058488, 0, 0, 0, 1, 1,
-1.088618, -1.383128, -3.554393, 0, 0, 0, 1, 1,
-1.083785, 0.4743565, -1.690108, 1, 1, 1, 1, 1,
-1.083527, 0.1682269, -1.242343, 1, 1, 1, 1, 1,
-1.082433, 0.390916, -1.53859, 1, 1, 1, 1, 1,
-1.07958, 0.4848118, -1.670361, 1, 1, 1, 1, 1,
-1.074408, 1.110018, -0.4766287, 1, 1, 1, 1, 1,
-1.074354, 0.1357144, -1.445337, 1, 1, 1, 1, 1,
-1.07391, -0.09119998, -0.7915151, 1, 1, 1, 1, 1,
-1.068854, 0.06183452, -0.7847791, 1, 1, 1, 1, 1,
-1.064911, 1.211806, -1.264395, 1, 1, 1, 1, 1,
-1.062203, -0.9503716, -0.6463612, 1, 1, 1, 1, 1,
-1.056003, 2.689621, -1.622752, 1, 1, 1, 1, 1,
-1.055087, 0.3004601, 0.1215734, 1, 1, 1, 1, 1,
-1.04051, -0.5398767, -1.397851, 1, 1, 1, 1, 1,
-1.037005, 0.7881169, -1.152109, 1, 1, 1, 1, 1,
-1.033811, -0.5357112, -2.61989, 1, 1, 1, 1, 1,
-1.031277, 0.5232319, -2.133847, 0, 0, 1, 1, 1,
-1.028829, 0.3239463, -2.076559, 1, 0, 0, 1, 1,
-1.025744, -0.2444152, -3.405219, 1, 0, 0, 1, 1,
-1.025066, 0.407843, -2.934352, 1, 0, 0, 1, 1,
-1.022923, 1.012739, -0.1358592, 1, 0, 0, 1, 1,
-1.02015, 1.421605, -2.040432, 1, 0, 0, 1, 1,
-1.020085, 1.637509, -0.5184854, 0, 0, 0, 1, 1,
-1.019679, 0.3889369, -1.66336, 0, 0, 0, 1, 1,
-1.019378, 1.064476, -0.7008405, 0, 0, 0, 1, 1,
-1.016869, 1.672066, -0.7077207, 0, 0, 0, 1, 1,
-1.016604, 0.560912, -0.4202722, 0, 0, 0, 1, 1,
-1.014609, 0.7381518, -1.301176, 0, 0, 0, 1, 1,
-1.013798, -0.9820617, -1.614793, 0, 0, 0, 1, 1,
-1.009941, 0.6141556, -2.578646, 1, 1, 1, 1, 1,
-1.008184, 0.2183726, -1.228361, 1, 1, 1, 1, 1,
-1.006296, -2.232523, -2.878154, 1, 1, 1, 1, 1,
-1.002243, 0.2855031, -0.6561114, 1, 1, 1, 1, 1,
-1.001936, -1.366292, -1.098646, 1, 1, 1, 1, 1,
-1.00092, -0.8539136, -2.610287, 1, 1, 1, 1, 1,
-0.9983838, 1.440848, -1.048484, 1, 1, 1, 1, 1,
-0.9960311, -2.32241, -1.796699, 1, 1, 1, 1, 1,
-0.9946975, 0.7964042, -0.04144128, 1, 1, 1, 1, 1,
-0.9932038, 0.497738, -1.4503, 1, 1, 1, 1, 1,
-0.9865245, 3.106036, 0.1470081, 1, 1, 1, 1, 1,
-0.9856921, -0.3986714, -3.067982, 1, 1, 1, 1, 1,
-0.9738507, -0.3957651, -3.675817, 1, 1, 1, 1, 1,
-0.9576984, -1.181974, -2.890424, 1, 1, 1, 1, 1,
-0.9532779, -0.7520716, -2.849447, 1, 1, 1, 1, 1,
-0.9527478, -0.7630935, -2.401684, 0, 0, 1, 1, 1,
-0.947586, -0.3300912, -1.596339, 1, 0, 0, 1, 1,
-0.9451516, -1.605624, -1.924533, 1, 0, 0, 1, 1,
-0.9442677, -0.3831167, -3.586341, 1, 0, 0, 1, 1,
-0.9417242, 1.465597, 0.3015138, 1, 0, 0, 1, 1,
-0.940888, -0.112731, -0.726208, 1, 0, 0, 1, 1,
-0.9335971, -0.9521239, -0.4982603, 0, 0, 0, 1, 1,
-0.9249496, -0.5875413, -4.248591, 0, 0, 0, 1, 1,
-0.9245222, 0.2461557, -0.6603624, 0, 0, 0, 1, 1,
-0.9085522, -0.6807356, -0.7555531, 0, 0, 0, 1, 1,
-0.9079221, 0.01644738, -1.656126, 0, 0, 0, 1, 1,
-0.9071015, 0.470012, -1.723114, 0, 0, 0, 1, 1,
-0.9063278, 1.406887, -0.9301053, 0, 0, 0, 1, 1,
-0.9030122, 0.6558509, 0.4705454, 1, 1, 1, 1, 1,
-0.901917, 0.03555145, -1.488772, 1, 1, 1, 1, 1,
-0.8983436, 2.24162, -0.3464336, 1, 1, 1, 1, 1,
-0.887028, 0.7011862, 1.224256, 1, 1, 1, 1, 1,
-0.887005, -1.491214, -3.567017, 1, 1, 1, 1, 1,
-0.8863914, -2.245507, -1.807194, 1, 1, 1, 1, 1,
-0.8861493, -1.390261, -2.478932, 1, 1, 1, 1, 1,
-0.883324, 1.666376, -1.026619, 1, 1, 1, 1, 1,
-0.8794393, 1.076266, 0.4506401, 1, 1, 1, 1, 1,
-0.866996, 1.731084, -0.7684118, 1, 1, 1, 1, 1,
-0.8648229, 0.1423232, -0.6157433, 1, 1, 1, 1, 1,
-0.8639528, 1.217985, -2.035219, 1, 1, 1, 1, 1,
-0.8537593, 0.7260415, -1.525333, 1, 1, 1, 1, 1,
-0.8521774, 0.8267657, 1.821487, 1, 1, 1, 1, 1,
-0.8442472, 0.8133771, -0.603467, 1, 1, 1, 1, 1,
-0.8438595, -1.70785, -3.432764, 0, 0, 1, 1, 1,
-0.8418804, 0.3788866, -0.627624, 1, 0, 0, 1, 1,
-0.8413044, -0.7703679, -2.003547, 1, 0, 0, 1, 1,
-0.8372787, -0.2015506, -1.980836, 1, 0, 0, 1, 1,
-0.8348954, -1.44971, -1.08921, 1, 0, 0, 1, 1,
-0.819194, 0.1332196, -1.549439, 1, 0, 0, 1, 1,
-0.8186783, -0.3288183, 0.09640364, 0, 0, 0, 1, 1,
-0.8170039, -0.01125398, -1.11243, 0, 0, 0, 1, 1,
-0.812472, 0.1031151, 0.05783726, 0, 0, 0, 1, 1,
-0.8016635, -0.7325456, -3.274346, 0, 0, 0, 1, 1,
-0.7988128, -1.176851, -4.670161, 0, 0, 0, 1, 1,
-0.7903651, 0.461452, -1.54305, 0, 0, 0, 1, 1,
-0.7800834, 2.097006, -0.4880654, 0, 0, 0, 1, 1,
-0.7795545, 0.05851641, -0.2236563, 1, 1, 1, 1, 1,
-0.7755494, -0.1873643, -1.186677, 1, 1, 1, 1, 1,
-0.766601, 1.75236, -0.1764186, 1, 1, 1, 1, 1,
-0.7633596, 0.9855474, 0.1422285, 1, 1, 1, 1, 1,
-0.7616561, -0.695657, -4.472332, 1, 1, 1, 1, 1,
-0.7597923, 0.4419818, -0.6607707, 1, 1, 1, 1, 1,
-0.7581318, -0.2519873, -2.742455, 1, 1, 1, 1, 1,
-0.7573116, 0.2214874, 0.268372, 1, 1, 1, 1, 1,
-0.7537131, 0.4274799, -0.6613719, 1, 1, 1, 1, 1,
-0.7499296, 1.106571, 0.7120279, 1, 1, 1, 1, 1,
-0.74984, 1.152924, -1.433457, 1, 1, 1, 1, 1,
-0.7373441, -1.309399, -3.597125, 1, 1, 1, 1, 1,
-0.7344471, -1.332386, -1.570921, 1, 1, 1, 1, 1,
-0.7342549, -1.28835, -3.291014, 1, 1, 1, 1, 1,
-0.7274265, 3.097546, -1.526499, 1, 1, 1, 1, 1,
-0.7150758, -1.133871, -4.829298, 0, 0, 1, 1, 1,
-0.7143403, 0.5497092, -1.353375, 1, 0, 0, 1, 1,
-0.712781, -2.258489, -1.653944, 1, 0, 0, 1, 1,
-0.710423, -0.9533556, -1.478252, 1, 0, 0, 1, 1,
-0.7091714, 0.6076189, -1.702315, 1, 0, 0, 1, 1,
-0.7078774, 0.9171678, -1.041361, 1, 0, 0, 1, 1,
-0.7024135, -0.9785067, -4.343244, 0, 0, 0, 1, 1,
-0.6943864, -0.4731938, -2.325286, 0, 0, 0, 1, 1,
-0.6915875, -0.2771448, -2.99637, 0, 0, 0, 1, 1,
-0.6855667, -0.51182, -2.092593, 0, 0, 0, 1, 1,
-0.680396, 0.2491784, -2.25685, 0, 0, 0, 1, 1,
-0.6779103, 0.01407663, -1.113025, 0, 0, 0, 1, 1,
-0.6712589, -1.02688, -1.652653, 0, 0, 0, 1, 1,
-0.6704334, -0.5048783, -1.225253, 1, 1, 1, 1, 1,
-0.6685317, -0.1515641, -0.1238206, 1, 1, 1, 1, 1,
-0.6659886, 0.4620205, -0.1759222, 1, 1, 1, 1, 1,
-0.6653703, -1.371104, -1.91559, 1, 1, 1, 1, 1,
-0.6629928, -1.402674, -2.908758, 1, 1, 1, 1, 1,
-0.6614988, -0.448728, -3.798383, 1, 1, 1, 1, 1,
-0.6602738, -0.1512605, -2.153728, 1, 1, 1, 1, 1,
-0.643191, -1.108229, -1.097048, 1, 1, 1, 1, 1,
-0.641411, 2.494135, 1.609614, 1, 1, 1, 1, 1,
-0.6364383, -1.193685, -2.884268, 1, 1, 1, 1, 1,
-0.6356042, 0.8504431, 0.6591398, 1, 1, 1, 1, 1,
-0.6331986, 0.1439808, -1.630421, 1, 1, 1, 1, 1,
-0.6329488, -0.5849487, -1.457217, 1, 1, 1, 1, 1,
-0.6284784, 0.3927925, -0.6327098, 1, 1, 1, 1, 1,
-0.6275684, 0.6786473, -1.13968, 1, 1, 1, 1, 1,
-0.6203112, 0.3071183, -0.9834822, 0, 0, 1, 1, 1,
-0.6182901, 0.07562828, -0.5255181, 1, 0, 0, 1, 1,
-0.6178712, 0.07597924, -0.6988455, 1, 0, 0, 1, 1,
-0.6167582, 0.6443616, -1.51505, 1, 0, 0, 1, 1,
-0.6137373, -0.1882984, -2.458781, 1, 0, 0, 1, 1,
-0.6126167, -1.417436, -2.044729, 1, 0, 0, 1, 1,
-0.6065235, -0.3184669, -2.600098, 0, 0, 0, 1, 1,
-0.5960833, 0.3755465, 0.5401056, 0, 0, 0, 1, 1,
-0.5944228, 0.09064125, 0.1711643, 0, 0, 0, 1, 1,
-0.5928264, 0.1748033, -2.846661, 0, 0, 0, 1, 1,
-0.5900928, 0.4521383, -1.678414, 0, 0, 0, 1, 1,
-0.5869832, -0.6078567, -3.368955, 0, 0, 0, 1, 1,
-0.5867925, -0.7643816, -3.350071, 0, 0, 0, 1, 1,
-0.5867674, -0.8985585, -3.403834, 1, 1, 1, 1, 1,
-0.5866645, 1.269752, 1.459179, 1, 1, 1, 1, 1,
-0.5834592, -0.844609, -3.234095, 1, 1, 1, 1, 1,
-0.5765025, -0.1128153, -2.390007, 1, 1, 1, 1, 1,
-0.5746526, -0.2263248, -2.231637, 1, 1, 1, 1, 1,
-0.5746232, -1.956633, -2.601934, 1, 1, 1, 1, 1,
-0.5712192, -0.02063631, -0.5776551, 1, 1, 1, 1, 1,
-0.5706738, 0.1888496, 0.298346, 1, 1, 1, 1, 1,
-0.5699561, -0.2838268, -0.4648032, 1, 1, 1, 1, 1,
-0.5668732, 1.501705, -2.132627, 1, 1, 1, 1, 1,
-0.558498, -1.379418, -1.258939, 1, 1, 1, 1, 1,
-0.5584791, 0.1888772, -0.5703093, 1, 1, 1, 1, 1,
-0.5546183, 1.120252, -1.636298, 1, 1, 1, 1, 1,
-0.5512347, 1.191927, -2.353168, 1, 1, 1, 1, 1,
-0.5466923, 0.09395134, -2.326997, 1, 1, 1, 1, 1,
-0.5391148, 1.33481, 0.01705943, 0, 0, 1, 1, 1,
-0.5387748, -0.9388621, -1.364369, 1, 0, 0, 1, 1,
-0.5308547, -0.02380119, -2.405435, 1, 0, 0, 1, 1,
-0.5294204, -0.8603658, -1.267884, 1, 0, 0, 1, 1,
-0.5289682, 0.6193482, 1.801103, 1, 0, 0, 1, 1,
-0.5272022, 1.820868, -0.1903753, 1, 0, 0, 1, 1,
-0.5270487, 0.11703, 0.36211, 0, 0, 0, 1, 1,
-0.5244824, 1.054113, 0.825572, 0, 0, 0, 1, 1,
-0.5208169, -0.1864725, -1.657548, 0, 0, 0, 1, 1,
-0.5200086, -1.722019, -2.265886, 0, 0, 0, 1, 1,
-0.5166875, 0.8453515, -0.02955862, 0, 0, 0, 1, 1,
-0.5161179, 0.9350519, 0.02176163, 0, 0, 0, 1, 1,
-0.5159461, -1.676548, -2.716627, 0, 0, 0, 1, 1,
-0.5137439, -1.511139, -2.427143, 1, 1, 1, 1, 1,
-0.5112857, 0.5893442, -0.5577567, 1, 1, 1, 1, 1,
-0.507214, -2.688289, -2.935215, 1, 1, 1, 1, 1,
-0.5041565, -0.03817246, -3.343398, 1, 1, 1, 1, 1,
-0.5021511, 1.740063, -0.08593797, 1, 1, 1, 1, 1,
-0.5005375, 1.029366, 0.185314, 1, 1, 1, 1, 1,
-0.4985382, -0.9732318, -2.846816, 1, 1, 1, 1, 1,
-0.4951895, 0.09933154, -1.234852, 1, 1, 1, 1, 1,
-0.4936946, 1.293262, 1.530118, 1, 1, 1, 1, 1,
-0.4902383, -0.6203957, -0.8078332, 1, 1, 1, 1, 1,
-0.4893296, -0.9989709, -2.725406, 1, 1, 1, 1, 1,
-0.4774274, 0.2521291, -0.4761211, 1, 1, 1, 1, 1,
-0.4719427, -0.9438336, -2.662191, 1, 1, 1, 1, 1,
-0.4701748, -1.484812, -2.005469, 1, 1, 1, 1, 1,
-0.4689015, 0.8341566, -2.274738, 1, 1, 1, 1, 1,
-0.467898, -0.4569986, -2.157823, 0, 0, 1, 1, 1,
-0.4618919, 0.2793536, -0.6981807, 1, 0, 0, 1, 1,
-0.4592789, 1.908199, 0.6080527, 1, 0, 0, 1, 1,
-0.4571548, -1.295302, -3.009269, 1, 0, 0, 1, 1,
-0.4509882, 0.421711, -0.6037351, 1, 0, 0, 1, 1,
-0.4501293, 0.7665474, -0.7424883, 1, 0, 0, 1, 1,
-0.447897, -0.7575626, -1.761045, 0, 0, 0, 1, 1,
-0.447534, -0.5929472, -4.153985, 0, 0, 0, 1, 1,
-0.4452844, -0.5428029, -1.089894, 0, 0, 0, 1, 1,
-0.4424174, -1.088436, -4.13555, 0, 0, 0, 1, 1,
-0.4412017, 0.6929401, 2.238154, 0, 0, 0, 1, 1,
-0.4315409, -0.7138482, -4.634761, 0, 0, 0, 1, 1,
-0.431514, -2.309187, -4.280785, 0, 0, 0, 1, 1,
-0.4293821, -0.1286317, -1.662481, 1, 1, 1, 1, 1,
-0.4282192, -0.1867875, -2.867266, 1, 1, 1, 1, 1,
-0.4269814, -0.4823228, -1.205779, 1, 1, 1, 1, 1,
-0.4246055, -0.3612077, -1.949756, 1, 1, 1, 1, 1,
-0.4215104, 1.187085, -2.475395, 1, 1, 1, 1, 1,
-0.4205078, -1.348153, -3.592657, 1, 1, 1, 1, 1,
-0.418348, 0.5506654, 1.484759, 1, 1, 1, 1, 1,
-0.4164687, 1.304456, -0.357143, 1, 1, 1, 1, 1,
-0.4144765, -1.107965, -3.381653, 1, 1, 1, 1, 1,
-0.4117118, 0.5730668, -0.3675087, 1, 1, 1, 1, 1,
-0.4076941, -0.4117567, -2.739066, 1, 1, 1, 1, 1,
-0.4035878, 0.6539021, -0.2448423, 1, 1, 1, 1, 1,
-0.4021085, -2.072279, -1.948836, 1, 1, 1, 1, 1,
-0.3939808, 2.634516, 0.01897887, 1, 1, 1, 1, 1,
-0.3912449, -0.8112899, -2.699074, 1, 1, 1, 1, 1,
-0.3902249, -0.4210429, -3.611455, 0, 0, 1, 1, 1,
-0.3858451, -0.5865835, -4.791648, 1, 0, 0, 1, 1,
-0.3855825, -0.3781381, -3.433751, 1, 0, 0, 1, 1,
-0.380485, 1.208999, 2.437911, 1, 0, 0, 1, 1,
-0.3792345, 0.3158357, 0.2107088, 1, 0, 0, 1, 1,
-0.3791038, 0.8838783, -0.7862294, 1, 0, 0, 1, 1,
-0.3772908, -0.3766554, -2.985378, 0, 0, 0, 1, 1,
-0.3771651, -2.952513, -3.642072, 0, 0, 0, 1, 1,
-0.3747116, 0.6706613, 0.1581692, 0, 0, 0, 1, 1,
-0.3743773, 0.7401213, -1.043743, 0, 0, 0, 1, 1,
-0.3702583, 0.6310115, 0.04448991, 0, 0, 0, 1, 1,
-0.3694801, 0.6333636, -0.1847632, 0, 0, 0, 1, 1,
-0.3691898, 1.469931, -0.2680345, 0, 0, 0, 1, 1,
-0.3688479, 0.1221227, -1.780953, 1, 1, 1, 1, 1,
-0.3674999, 0.6283441, -0.2257056, 1, 1, 1, 1, 1,
-0.3657832, 0.3368941, -0.2941313, 1, 1, 1, 1, 1,
-0.3637861, -2.40647, -1.689573, 1, 1, 1, 1, 1,
-0.3626175, -0.273916, -2.422198, 1, 1, 1, 1, 1,
-0.3542762, -1.175204, -3.148225, 1, 1, 1, 1, 1,
-0.3514791, 0.687339, 0.3518584, 1, 1, 1, 1, 1,
-0.3491998, -0.3903367, -2.165786, 1, 1, 1, 1, 1,
-0.3431723, -1.682245, -2.987441, 1, 1, 1, 1, 1,
-0.3430789, 0.7309939, 0.1519479, 1, 1, 1, 1, 1,
-0.3422162, 0.6240541, -1.905625, 1, 1, 1, 1, 1,
-0.3383647, 1.355736, -0.4180085, 1, 1, 1, 1, 1,
-0.3367469, -0.3945772, 0.3748727, 1, 1, 1, 1, 1,
-0.3315634, -0.549442, -2.307212, 1, 1, 1, 1, 1,
-0.3287585, 0.2237029, 0.1734908, 1, 1, 1, 1, 1,
-0.3279497, -1.104875, -1.405769, 0, 0, 1, 1, 1,
-0.3196641, 0.6157876, -0.6296141, 1, 0, 0, 1, 1,
-0.3179901, -0.6782519, -2.845714, 1, 0, 0, 1, 1,
-0.3179321, -0.4950708, -4.057363, 1, 0, 0, 1, 1,
-0.3112624, -0.2722224, -2.410191, 1, 0, 0, 1, 1,
-0.3042848, 0.07683345, -1.031873, 1, 0, 0, 1, 1,
-0.303605, 0.8195475, -0.07080103, 0, 0, 0, 1, 1,
-0.2977188, -0.9358225, -3.099559, 0, 0, 0, 1, 1,
-0.2939714, 1.243839, 1.494578, 0, 0, 0, 1, 1,
-0.2937176, 0.3980108, -1.959556, 0, 0, 0, 1, 1,
-0.2927631, -0.9847742, -3.406835, 0, 0, 0, 1, 1,
-0.2847993, 0.6579683, -0.6066388, 0, 0, 0, 1, 1,
-0.2811307, -0.130759, -1.387676, 0, 0, 0, 1, 1,
-0.2801031, -0.2911525, -0.4869408, 1, 1, 1, 1, 1,
-0.2792882, 0.5538216, -0.02282173, 1, 1, 1, 1, 1,
-0.2776889, -1.206318, -2.462058, 1, 1, 1, 1, 1,
-0.2776549, -1.007228, -1.601251, 1, 1, 1, 1, 1,
-0.2753829, -0.3784288, -1.882715, 1, 1, 1, 1, 1,
-0.2684472, -0.1155965, -2.258893, 1, 1, 1, 1, 1,
-0.268077, -1.177136, -1.708176, 1, 1, 1, 1, 1,
-0.2649277, 0.6555638, 0.721995, 1, 1, 1, 1, 1,
-0.2619993, 0.2506675, -0.9173007, 1, 1, 1, 1, 1,
-0.2612192, 0.4046362, -1.777144, 1, 1, 1, 1, 1,
-0.2530165, -0.7654251, -2.671299, 1, 1, 1, 1, 1,
-0.2524558, 0.9747063, -2.197863, 1, 1, 1, 1, 1,
-0.2508581, -0.4456273, -2.946576, 1, 1, 1, 1, 1,
-0.2488383, 1.01376, 0.01379462, 1, 1, 1, 1, 1,
-0.2484839, -0.2736503, -2.782809, 1, 1, 1, 1, 1,
-0.244906, -0.1133111, -1.768281, 0, 0, 1, 1, 1,
-0.2411262, -0.4799041, -2.681058, 1, 0, 0, 1, 1,
-0.2404665, -1.378872, -3.146202, 1, 0, 0, 1, 1,
-0.2330643, 0.1259414, -0.519965, 1, 0, 0, 1, 1,
-0.2327585, -0.4666131, -2.404848, 1, 0, 0, 1, 1,
-0.23124, 0.949545, -1.188606, 1, 0, 0, 1, 1,
-0.2284894, -0.5248612, -2.406369, 0, 0, 0, 1, 1,
-0.228161, 0.6914604, -0.3831743, 0, 0, 0, 1, 1,
-0.227627, -2.131224, -4.04663, 0, 0, 0, 1, 1,
-0.2275416, 0.3388102, -0.5101237, 0, 0, 0, 1, 1,
-0.2263882, -0.3461348, -1.018171, 0, 0, 0, 1, 1,
-0.224411, -1.124092, -2.3233, 0, 0, 0, 1, 1,
-0.2208223, 0.8460262, 0.1040623, 0, 0, 0, 1, 1,
-0.2160751, 0.2166515, 0.7011554, 1, 1, 1, 1, 1,
-0.2134586, 0.7753528, 0.511001, 1, 1, 1, 1, 1,
-0.2096038, 0.1119771, -1.811096, 1, 1, 1, 1, 1,
-0.2065844, -0.5243839, -2.045628, 1, 1, 1, 1, 1,
-0.2043867, 0.3614093, 0.1025314, 1, 1, 1, 1, 1,
-0.2042128, -1.365545, -2.362365, 1, 1, 1, 1, 1,
-0.2030113, -0.2714725, -2.834448, 1, 1, 1, 1, 1,
-0.2023248, -1.299252, -3.311156, 1, 1, 1, 1, 1,
-0.198456, 0.1481856, -0.6126994, 1, 1, 1, 1, 1,
-0.1976236, -0.2351471, -1.894735, 1, 1, 1, 1, 1,
-0.1965536, 0.2126112, -1.53823, 1, 1, 1, 1, 1,
-0.1939748, -0.09791163, -1.57116, 1, 1, 1, 1, 1,
-0.1931675, 1.932883, 1.526058, 1, 1, 1, 1, 1,
-0.1917666, -0.5462788, -3.981457, 1, 1, 1, 1, 1,
-0.189751, -0.7388647, -2.657452, 1, 1, 1, 1, 1,
-0.1864491, 0.8116133, 0.5722961, 0, 0, 1, 1, 1,
-0.1864443, 0.4300794, -0.5618453, 1, 0, 0, 1, 1,
-0.1815936, 0.5620866, 0.5530927, 1, 0, 0, 1, 1,
-0.181582, 1.395211, 0.1002089, 1, 0, 0, 1, 1,
-0.1782261, -0.3293165, -0.8964117, 1, 0, 0, 1, 1,
-0.1747065, -1.868999, -2.926229, 1, 0, 0, 1, 1,
-0.1735827, -0.01690523, -2.096408, 0, 0, 0, 1, 1,
-0.1601395, 2.697942, 0.3429525, 0, 0, 0, 1, 1,
-0.1566277, 1.597755, -2.061666, 0, 0, 0, 1, 1,
-0.1515196, -0.9218578, -2.144241, 0, 0, 0, 1, 1,
-0.1471855, 1.459093, -0.3971241, 0, 0, 0, 1, 1,
-0.1452423, -0.2438511, -0.5931867, 0, 0, 0, 1, 1,
-0.140731, 2.782498, 1.610827, 0, 0, 0, 1, 1,
-0.1398965, 0.6186455, 1.549488, 1, 1, 1, 1, 1,
-0.1393048, 0.4119955, 0.4110045, 1, 1, 1, 1, 1,
-0.1387741, -0.1818137, -2.608209, 1, 1, 1, 1, 1,
-0.1386259, 1.02018, 1.259196, 1, 1, 1, 1, 1,
-0.1373378, 0.5123384, -0.5253028, 1, 1, 1, 1, 1,
-0.1372938, -0.2474713, -1.19276, 1, 1, 1, 1, 1,
-0.1325099, -0.7312944, -0.9323765, 1, 1, 1, 1, 1,
-0.1301739, -0.34692, -3.225443, 1, 1, 1, 1, 1,
-0.127782, -0.7871211, -2.497621, 1, 1, 1, 1, 1,
-0.1221488, -0.1819207, -3.293634, 1, 1, 1, 1, 1,
-0.1151728, -0.629423, -0.5282093, 1, 1, 1, 1, 1,
-0.1072549, 0.8560074, -0.668303, 1, 1, 1, 1, 1,
-0.1066539, -0.1157217, -3.626179, 1, 1, 1, 1, 1,
-0.09942264, 1.411322, -1.312207, 1, 1, 1, 1, 1,
-0.09556982, -0.0922322, -2.567694, 1, 1, 1, 1, 1,
-0.08659533, 0.4760945, 0.5742139, 0, 0, 1, 1, 1,
-0.08630256, -1.986636, -2.041589, 1, 0, 0, 1, 1,
-0.08155889, 0.7369735, -0.5210918, 1, 0, 0, 1, 1,
-0.07644948, 0.1414561, -0.04577332, 1, 0, 0, 1, 1,
-0.07454612, -0.6262923, -3.374084, 1, 0, 0, 1, 1,
-0.07327374, -0.3148887, -1.542604, 1, 0, 0, 1, 1,
-0.07147035, -0.2641361, -4.276329, 0, 0, 0, 1, 1,
-0.07132187, 0.2133302, -1.599092, 0, 0, 0, 1, 1,
-0.07131011, 1.655116, -0.3294709, 0, 0, 0, 1, 1,
-0.0680676, 0.3895534, -0.6218767, 0, 0, 0, 1, 1,
-0.06629451, 0.8610414, 0.4228332, 0, 0, 0, 1, 1,
-0.06627151, 1.612508, -2.644178, 0, 0, 0, 1, 1,
-0.06591488, 0.06191673, -0.9803157, 0, 0, 0, 1, 1,
-0.06151119, 0.4074389, -0.0644975, 1, 1, 1, 1, 1,
-0.05976482, -1.723689, -3.97462, 1, 1, 1, 1, 1,
-0.05681064, 1.193989, 0.9421304, 1, 1, 1, 1, 1,
-0.04938344, -0.6219511, -2.278859, 1, 1, 1, 1, 1,
-0.04267403, -0.7067467, -0.4603483, 1, 1, 1, 1, 1,
-0.04250836, 0.3699774, -0.5599456, 1, 1, 1, 1, 1,
-0.04042831, 0.5230285, 0.3721119, 1, 1, 1, 1, 1,
-0.03812852, 0.5988402, -0.7117094, 1, 1, 1, 1, 1,
-0.03603449, 1.915656, -0.6691447, 1, 1, 1, 1, 1,
-0.03294657, -0.8231227, -3.277337, 1, 1, 1, 1, 1,
-0.03158884, -2.298863, -4.821151, 1, 1, 1, 1, 1,
-0.02740417, -0.3395907, -3.313355, 1, 1, 1, 1, 1,
-0.02711937, 1.182127, -0.1550486, 1, 1, 1, 1, 1,
-0.02581333, 0.7385345, -2.000892, 1, 1, 1, 1, 1,
-0.02513754, 0.2428149, -0.0463854, 1, 1, 1, 1, 1,
-0.02469531, -0.48515, -3.419798, 0, 0, 1, 1, 1,
-0.02401476, 0.6848497, -1.597066, 1, 0, 0, 1, 1,
-0.02288551, -1.600525, -1.38318, 1, 0, 0, 1, 1,
-0.02003564, 1.079376, -1.207492, 1, 0, 0, 1, 1,
-0.01054658, -0.149429, -2.108308, 1, 0, 0, 1, 1,
-0.006750527, -1.201418, -4.432817, 1, 0, 0, 1, 1,
-0.005459697, 0.1229828, -1.674469, 0, 0, 0, 1, 1,
-0.0007910311, -1.262599, -2.507532, 0, 0, 0, 1, 1,
0.00101631, -0.7025418, 2.249931, 0, 0, 0, 1, 1,
0.005544813, 0.4599301, -0.7355915, 0, 0, 0, 1, 1,
0.006906453, -1.510719, 0.8372656, 0, 0, 0, 1, 1,
0.007466509, -0.2476173, 3.646564, 0, 0, 0, 1, 1,
0.009361719, 0.5222341, -0.4800818, 0, 0, 0, 1, 1,
0.01001234, -0.7587492, 3.968476, 1, 1, 1, 1, 1,
0.01025404, 0.882495, 0.2929493, 1, 1, 1, 1, 1,
0.01711167, -0.601826, 5.623842, 1, 1, 1, 1, 1,
0.01721748, 1.478591, -0.4195532, 1, 1, 1, 1, 1,
0.01790324, 0.4875999, -0.9673142, 1, 1, 1, 1, 1,
0.02241099, 0.6280866, 1.594498, 1, 1, 1, 1, 1,
0.0240427, -0.3757629, 2.923152, 1, 1, 1, 1, 1,
0.025993, -0.1421518, 2.30108, 1, 1, 1, 1, 1,
0.03176526, -0.2563917, 4.388175, 1, 1, 1, 1, 1,
0.03179517, -0.08069787, 4.038181, 1, 1, 1, 1, 1,
0.03198322, -0.2246366, 3.969418, 1, 1, 1, 1, 1,
0.03583354, -1.102101, 4.484127, 1, 1, 1, 1, 1,
0.0367931, 0.7728072, 0.8624097, 1, 1, 1, 1, 1,
0.03878846, 0.0929009, 0.8039789, 1, 1, 1, 1, 1,
0.04060596, -1.500185, 3.829485, 1, 1, 1, 1, 1,
0.0461036, -0.8448618, 3.090648, 0, 0, 1, 1, 1,
0.0497774, -1.640078, 2.586605, 1, 0, 0, 1, 1,
0.05419423, -0.6888699, 4.524731, 1, 0, 0, 1, 1,
0.05426399, -0.440704, 3.368961, 1, 0, 0, 1, 1,
0.06129474, -0.2576027, 4.650355, 1, 0, 0, 1, 1,
0.06251931, -0.06480598, 2.71005, 1, 0, 0, 1, 1,
0.06317304, 0.046096, 1.644358, 0, 0, 0, 1, 1,
0.06989338, 1.439635, -1.999372, 0, 0, 0, 1, 1,
0.07177581, 2.318693, 0.770381, 0, 0, 0, 1, 1,
0.07397479, -1.450973, 4.115411, 0, 0, 0, 1, 1,
0.07591893, -0.7296471, 4.089385, 0, 0, 0, 1, 1,
0.07619318, -0.2034878, 1.496006, 0, 0, 0, 1, 1,
0.07976194, 0.2003226, 1.272214, 0, 0, 0, 1, 1,
0.08058368, 0.05140076, 0.8152867, 1, 1, 1, 1, 1,
0.08818301, -0.9025742, 2.865566, 1, 1, 1, 1, 1,
0.08925455, -0.5812324, 1.943157, 1, 1, 1, 1, 1,
0.09011251, -0.8225187, 2.070831, 1, 1, 1, 1, 1,
0.09015501, -0.9892005, 3.11376, 1, 1, 1, 1, 1,
0.09585201, -0.005846818, 2.031115, 1, 1, 1, 1, 1,
0.09938034, -1.099119, 3.299938, 1, 1, 1, 1, 1,
0.1004796, 1.022031, -0.6751359, 1, 1, 1, 1, 1,
0.1022488, 0.2422353, -0.01750562, 1, 1, 1, 1, 1,
0.1033224, 2.879059, -1.978482, 1, 1, 1, 1, 1,
0.1035341, 0.8927531, -0.2469808, 1, 1, 1, 1, 1,
0.1047525, 2.133498, 1.613131, 1, 1, 1, 1, 1,
0.1067756, 0.4689306, 1.977033, 1, 1, 1, 1, 1,
0.1075251, -0.3309605, 2.830579, 1, 1, 1, 1, 1,
0.1094259, -0.2916768, 4.956822, 1, 1, 1, 1, 1,
0.1146489, -0.5929239, 1.779403, 0, 0, 1, 1, 1,
0.1149471, 1.914248, -2.416589, 1, 0, 0, 1, 1,
0.1151293, -0.5037284, 3.502904, 1, 0, 0, 1, 1,
0.1210733, -1.531638, 4.404226, 1, 0, 0, 1, 1,
0.1357221, -1.706198, 1.26042, 1, 0, 0, 1, 1,
0.1363016, -0.7807709, 1.910123, 1, 0, 0, 1, 1,
0.136502, -0.02005086, 3.577411, 0, 0, 0, 1, 1,
0.1367976, 1.474387, -0.7999993, 0, 0, 0, 1, 1,
0.1392093, 0.0716725, 1.308992, 0, 0, 0, 1, 1,
0.1408339, -0.5529616, 5.403306, 0, 0, 0, 1, 1,
0.1436753, 0.560532, 1.029225, 0, 0, 0, 1, 1,
0.1461842, 0.590167, 1.051931, 0, 0, 0, 1, 1,
0.1611298, -2.594699, 1.9006, 0, 0, 0, 1, 1,
0.1612565, -0.5953394, 2.703174, 1, 1, 1, 1, 1,
0.1621263, -0.1286525, 2.251636, 1, 1, 1, 1, 1,
0.1654765, 1.087497, 0.2132885, 1, 1, 1, 1, 1,
0.1681987, 1.193665, 0.5170302, 1, 1, 1, 1, 1,
0.1686661, 0.3153385, 0.4394457, 1, 1, 1, 1, 1,
0.1689865, 1.329603, 0.05792645, 1, 1, 1, 1, 1,
0.1755796, -1.002823, 3.279419, 1, 1, 1, 1, 1,
0.1776312, 0.176136, 1.131571, 1, 1, 1, 1, 1,
0.1786633, -0.541954, 2.330431, 1, 1, 1, 1, 1,
0.1801594, 0.2530255, 0.163177, 1, 1, 1, 1, 1,
0.1810846, -1.598002, 1.207643, 1, 1, 1, 1, 1,
0.1833144, 1.870574, -0.1931219, 1, 1, 1, 1, 1,
0.1840631, 1.911498, 1.566721, 1, 1, 1, 1, 1,
0.1849482, 0.5023625, -0.9100406, 1, 1, 1, 1, 1,
0.1861656, -0.5924146, 3.057499, 1, 1, 1, 1, 1,
0.1883632, -0.425476, 3.960834, 0, 0, 1, 1, 1,
0.1884111, 0.04276211, 1.060363, 1, 0, 0, 1, 1,
0.1891109, -0.09398977, 3.170888, 1, 0, 0, 1, 1,
0.1897885, -1.865887, 4.95288, 1, 0, 0, 1, 1,
0.1958236, -0.4711462, 2.712322, 1, 0, 0, 1, 1,
0.1978245, 0.05524651, -0.3228529, 1, 0, 0, 1, 1,
0.1983605, 0.9397025, -2.006014, 0, 0, 0, 1, 1,
0.20403, -1.220639, 3.653707, 0, 0, 0, 1, 1,
0.2058648, 0.4135075, 1.083805, 0, 0, 0, 1, 1,
0.2061172, 0.2971045, -1.448617, 0, 0, 0, 1, 1,
0.2079035, 0.3095861, 2.43783, 0, 0, 0, 1, 1,
0.2101238, -0.02467393, 1.225291, 0, 0, 0, 1, 1,
0.2114353, 0.6052285, -0.2381815, 0, 0, 0, 1, 1,
0.2158081, 1.495461, 0.9120619, 1, 1, 1, 1, 1,
0.2185744, -0.6799732, 4.277063, 1, 1, 1, 1, 1,
0.2232503, -0.2329421, 2.549566, 1, 1, 1, 1, 1,
0.2234528, 0.6312441, -0.9648952, 1, 1, 1, 1, 1,
0.2318455, -0.4349487, 4.44081, 1, 1, 1, 1, 1,
0.2340268, -0.6388738, 2.283069, 1, 1, 1, 1, 1,
0.2378032, 0.1173121, 1.702338, 1, 1, 1, 1, 1,
0.2392777, -2.70643, 3.387728, 1, 1, 1, 1, 1,
0.2420635, 2.873223, -0.7747619, 1, 1, 1, 1, 1,
0.2431757, -0.8393818, 1.778874, 1, 1, 1, 1, 1,
0.244418, 1.011973, -0.665066, 1, 1, 1, 1, 1,
0.2445074, -1.035159, 4.384137, 1, 1, 1, 1, 1,
0.2453965, -1.226879, 2.297526, 1, 1, 1, 1, 1,
0.2488212, -0.9042959, 2.551942, 1, 1, 1, 1, 1,
0.2501391, -1.306688, 3.441228, 1, 1, 1, 1, 1,
0.2531975, 0.1452592, 0.5037389, 0, 0, 1, 1, 1,
0.2542984, 1.540996, -0.4944725, 1, 0, 0, 1, 1,
0.2591432, 2.627314, -0.9434369, 1, 0, 0, 1, 1,
0.2624641, -0.2461241, 2.592289, 1, 0, 0, 1, 1,
0.2649108, -0.414807, 0.9815336, 1, 0, 0, 1, 1,
0.2650729, -0.6118048, 2.776603, 1, 0, 0, 1, 1,
0.2659432, 0.8246203, -0.4324432, 0, 0, 0, 1, 1,
0.2661543, 0.8567926, 0.9361703, 0, 0, 0, 1, 1,
0.2700328, 0.7108553, 1.172848, 0, 0, 0, 1, 1,
0.2737084, -0.5833224, 2.782305, 0, 0, 0, 1, 1,
0.2809702, -1.038775, 1.419715, 0, 0, 0, 1, 1,
0.2825573, 1.066648, 0.8135357, 0, 0, 0, 1, 1,
0.286061, 0.8521094, 1.15817, 0, 0, 0, 1, 1,
0.2876036, -0.3897483, 2.543211, 1, 1, 1, 1, 1,
0.2923833, 1.526366, -1.751089, 1, 1, 1, 1, 1,
0.2938573, 1.265872, 0.5043437, 1, 1, 1, 1, 1,
0.2955637, -0.2657218, 2.219038, 1, 1, 1, 1, 1,
0.29745, 0.140884, 2.06496, 1, 1, 1, 1, 1,
0.301691, -1.649749, 2.624973, 1, 1, 1, 1, 1,
0.302519, 1.377545, -1.267533, 1, 1, 1, 1, 1,
0.3028488, 0.4729515, -0.2886165, 1, 1, 1, 1, 1,
0.3079438, -0.8976649, 2.559508, 1, 1, 1, 1, 1,
0.308865, -1.13096, 2.009981, 1, 1, 1, 1, 1,
0.3115803, -0.6370929, 3.640024, 1, 1, 1, 1, 1,
0.3118158, -0.3496914, 3.852468, 1, 1, 1, 1, 1,
0.3119617, 0.139313, 0.770651, 1, 1, 1, 1, 1,
0.3140738, -0.008552943, 0.1112506, 1, 1, 1, 1, 1,
0.3215792, -0.03228619, 2.622362, 1, 1, 1, 1, 1,
0.3232024, 2.032804, 0.4049211, 0, 0, 1, 1, 1,
0.326366, -0.2810679, 1.722546, 1, 0, 0, 1, 1,
0.3316714, 0.2042593, -0.1152531, 1, 0, 0, 1, 1,
0.332379, -0.1497229, 2.697483, 1, 0, 0, 1, 1,
0.3371715, 0.7048386, 0.3775384, 1, 0, 0, 1, 1,
0.3378807, -0.1176599, 1.483818, 1, 0, 0, 1, 1,
0.3450567, -0.9998727, 1.631476, 0, 0, 0, 1, 1,
0.3472286, -1.543635, 4.856593, 0, 0, 0, 1, 1,
0.3509699, -0.5827912, 2.365583, 0, 0, 0, 1, 1,
0.3512198, -0.1142873, 0.7140542, 0, 0, 0, 1, 1,
0.3516814, -1.362631, 3.250049, 0, 0, 0, 1, 1,
0.3548394, 1.197054, 0.3948492, 0, 0, 0, 1, 1,
0.3553221, 0.05751053, 0.8781943, 0, 0, 0, 1, 1,
0.3553822, 0.1092282, 2.158836, 1, 1, 1, 1, 1,
0.3558334, -0.6643819, 1.921174, 1, 1, 1, 1, 1,
0.3560478, -0.5591518, 1.9561, 1, 1, 1, 1, 1,
0.3561611, -1.816619, 3.344404, 1, 1, 1, 1, 1,
0.356719, 0.02778986, 4.709961, 1, 1, 1, 1, 1,
0.3630195, 0.2791075, 2.941688, 1, 1, 1, 1, 1,
0.3637716, 0.6109435, -1.003601, 1, 1, 1, 1, 1,
0.3669385, -0.4955093, 2.643718, 1, 1, 1, 1, 1,
0.3674849, -0.5940836, 2.087244, 1, 1, 1, 1, 1,
0.3698059, 0.1189633, -0.7524366, 1, 1, 1, 1, 1,
0.3769609, 0.5384586, -0.2880245, 1, 1, 1, 1, 1,
0.3779866, 0.2069491, 1.99147, 1, 1, 1, 1, 1,
0.3794638, 1.622932, 1.63037, 1, 1, 1, 1, 1,
0.3870496, 0.9426568, -0.4488773, 1, 1, 1, 1, 1,
0.3888087, 1.998812, -1.449881, 1, 1, 1, 1, 1,
0.391979, -0.07617043, 1.635285, 0, 0, 1, 1, 1,
0.3935084, 0.2814957, 1.165164, 1, 0, 0, 1, 1,
0.3954193, -1.667086, 3.231062, 1, 0, 0, 1, 1,
0.3975694, -0.6489421, 2.159241, 1, 0, 0, 1, 1,
0.3983385, 0.3963897, 2.898319, 1, 0, 0, 1, 1,
0.4058715, 1.804771, 0.5612504, 1, 0, 0, 1, 1,
0.4093138, 0.1599562, -0.8883049, 0, 0, 0, 1, 1,
0.4126124, -0.6959062, 3.942933, 0, 0, 0, 1, 1,
0.4136877, 1.321548, -0.1599643, 0, 0, 0, 1, 1,
0.4161676, -1.092996, 2.431412, 0, 0, 0, 1, 1,
0.4165017, 0.9490892, 1.341786, 0, 0, 0, 1, 1,
0.4197778, 0.4176651, -0.4723642, 0, 0, 0, 1, 1,
0.4237439, -1.083584, 2.616294, 0, 0, 0, 1, 1,
0.4246424, -0.4804962, 3.095807, 1, 1, 1, 1, 1,
0.4257852, 1.471171, 0.989483, 1, 1, 1, 1, 1,
0.4260695, -1.326833, 2.518861, 1, 1, 1, 1, 1,
0.4263404, 0.4617684, 1.934551, 1, 1, 1, 1, 1,
0.4270498, -0.1083409, 2.608631, 1, 1, 1, 1, 1,
0.4297275, -1.164911, 3.488456, 1, 1, 1, 1, 1,
0.4311729, 0.8364863, 1.52792, 1, 1, 1, 1, 1,
0.4320522, -0.9290611, 0.03587821, 1, 1, 1, 1, 1,
0.4335343, -1.486417, 3.790785, 1, 1, 1, 1, 1,
0.4341752, 1.855758, 1.168961, 1, 1, 1, 1, 1,
0.4379026, -0.05145769, 1.51604, 1, 1, 1, 1, 1,
0.4401704, -0.9462934, 4.04602, 1, 1, 1, 1, 1,
0.4468645, 0.1804387, 2.730215, 1, 1, 1, 1, 1,
0.4508113, -1.051858, 1.679532, 1, 1, 1, 1, 1,
0.4524624, -0.4024535, 2.174767, 1, 1, 1, 1, 1,
0.4526548, 0.6788383, 0.4121834, 0, 0, 1, 1, 1,
0.4532177, -0.3731862, 3.486815, 1, 0, 0, 1, 1,
0.4631449, 2.580555, 0.1253829, 1, 0, 0, 1, 1,
0.4719718, -0.1608858, 1.493244, 1, 0, 0, 1, 1,
0.4791541, 2.706545, 0.1382483, 1, 0, 0, 1, 1,
0.4839346, 0.2994134, 0.8064299, 1, 0, 0, 1, 1,
0.48449, -0.182456, 1.660221, 0, 0, 0, 1, 1,
0.485597, 0.8518213, 0.5308292, 0, 0, 0, 1, 1,
0.4873037, 0.6219959, 2.421391, 0, 0, 0, 1, 1,
0.4894181, 1.678388, -1.478104, 0, 0, 0, 1, 1,
0.4947525, 0.678448, 1.038789, 0, 0, 0, 1, 1,
0.4954065, 0.6612967, 1.670386, 0, 0, 0, 1, 1,
0.4963495, 0.8246351, 0.9099303, 0, 0, 0, 1, 1,
0.4971449, -0.2916507, 1.889086, 1, 1, 1, 1, 1,
0.4971966, 0.7441419, 1.670959, 1, 1, 1, 1, 1,
0.4977176, -0.683589, 1.438048, 1, 1, 1, 1, 1,
0.5033882, 0.3533916, 0.8792595, 1, 1, 1, 1, 1,
0.5041902, 0.2915151, 1.110941, 1, 1, 1, 1, 1,
0.5056203, 0.3971541, 1.821128, 1, 1, 1, 1, 1,
0.5067654, 0.8011605, 1.624578, 1, 1, 1, 1, 1,
0.5082681, 0.2501279, -0.1393814, 1, 1, 1, 1, 1,
0.5100733, -0.535917, 2.893868, 1, 1, 1, 1, 1,
0.5135963, 0.3256297, 1.399887, 1, 1, 1, 1, 1,
0.5147148, -1.447687, 1.781444, 1, 1, 1, 1, 1,
0.5246716, 0.2456752, 0.5890767, 1, 1, 1, 1, 1,
0.5257099, -0.4542857, 3.045049, 1, 1, 1, 1, 1,
0.5263932, 0.3282278, 0.8535761, 1, 1, 1, 1, 1,
0.5271016, 0.1698356, 0.4615657, 1, 1, 1, 1, 1,
0.5281182, 2.048963, -1.200179, 0, 0, 1, 1, 1,
0.5292135, -0.446883, 3.217479, 1, 0, 0, 1, 1,
0.5297102, 1.174901, -1.483979, 1, 0, 0, 1, 1,
0.5322344, 1.584172, -0.09483808, 1, 0, 0, 1, 1,
0.5382382, -0.6361876, 2.910068, 1, 0, 0, 1, 1,
0.5392815, 0.6492016, 0.5927737, 1, 0, 0, 1, 1,
0.5409283, 0.4075276, 0.3700953, 0, 0, 0, 1, 1,
0.5448235, 0.2612778, 3.014906, 0, 0, 0, 1, 1,
0.5483158, 0.4697273, 1.992123, 0, 0, 0, 1, 1,
0.5504351, -0.4274223, 2.442456, 0, 0, 0, 1, 1,
0.5525266, 0.3454522, 1.541158, 0, 0, 0, 1, 1,
0.5527583, 0.06556272, 0.6180047, 0, 0, 0, 1, 1,
0.5530757, -0.2906875, 1.7206, 0, 0, 0, 1, 1,
0.566684, 1.30603, 1.443518, 1, 1, 1, 1, 1,
0.5670767, -0.08542664, 3.910459, 1, 1, 1, 1, 1,
0.5681964, -2.502575, 3.244905, 1, 1, 1, 1, 1,
0.5717908, -0.7987196, 2.964919, 1, 1, 1, 1, 1,
0.572999, 0.1737975, 2.153122, 1, 1, 1, 1, 1,
0.5746406, -0.02043505, 2.590807, 1, 1, 1, 1, 1,
0.5774494, -0.1897865, 1.179787, 1, 1, 1, 1, 1,
0.5821173, 0.8324582, -0.5644609, 1, 1, 1, 1, 1,
0.58276, 0.6586134, -0.1421226, 1, 1, 1, 1, 1,
0.5830356, 0.7625322, 0.0359946, 1, 1, 1, 1, 1,
0.5916087, -2.03716, 3.145614, 1, 1, 1, 1, 1,
0.5936094, 0.7635964, -0.39621, 1, 1, 1, 1, 1,
0.6014891, -0.2939378, 1.144452, 1, 1, 1, 1, 1,
0.6024948, -0.745479, 2.466161, 1, 1, 1, 1, 1,
0.6047318, -0.3347837, 3.54653, 1, 1, 1, 1, 1,
0.6087126, 0.8718517, -0.4447987, 0, 0, 1, 1, 1,
0.6099371, -0.003905897, 1.518244, 1, 0, 0, 1, 1,
0.6105116, 0.6975635, 0.07327689, 1, 0, 0, 1, 1,
0.6122553, -0.207951, 2.027707, 1, 0, 0, 1, 1,
0.6129813, -0.07495023, 0.9022126, 1, 0, 0, 1, 1,
0.613789, -0.6617114, 1.44434, 1, 0, 0, 1, 1,
0.6157386, 0.304166, 1.202282, 0, 0, 0, 1, 1,
0.6161473, -0.5076251, 1.773755, 0, 0, 0, 1, 1,
0.6220285, -1.31297, 2.470659, 0, 0, 0, 1, 1,
0.6240689, -0.2247016, 1.211159, 0, 0, 0, 1, 1,
0.6263291, -0.2255341, 1.157955, 0, 0, 0, 1, 1,
0.6277116, -0.523301, 1.040244, 0, 0, 0, 1, 1,
0.628144, -0.1524998, 0.9377933, 0, 0, 0, 1, 1,
0.6314626, 0.1787523, 1.553938, 1, 1, 1, 1, 1,
0.6393754, -1.557978, 2.608034, 1, 1, 1, 1, 1,
0.640341, -0.9950736, 0.658676, 1, 1, 1, 1, 1,
0.6415452, -0.5038549, 3.107744, 1, 1, 1, 1, 1,
0.6453313, -0.7192898, 2.913803, 1, 1, 1, 1, 1,
0.6455116, -1.015064, 3.324726, 1, 1, 1, 1, 1,
0.6467468, -1.109044, 2.286711, 1, 1, 1, 1, 1,
0.6476779, 0.3134614, 2.470636, 1, 1, 1, 1, 1,
0.6507368, -1.612653, 5.288779, 1, 1, 1, 1, 1,
0.6565659, -1.012232, 2.962467, 1, 1, 1, 1, 1,
0.6567655, 1.244539, -0.434858, 1, 1, 1, 1, 1,
0.6574884, -1.01565, 2.463961, 1, 1, 1, 1, 1,
0.6597045, -0.6409338, 3.091466, 1, 1, 1, 1, 1,
0.6610414, 0.009651249, 1.869749, 1, 1, 1, 1, 1,
0.6618934, -0.7082167, 1.327791, 1, 1, 1, 1, 1,
0.6698616, -1.293801, 1.708293, 0, 0, 1, 1, 1,
0.6729217, -0.5990502, 3.459139, 1, 0, 0, 1, 1,
0.6801665, -0.4282285, 2.731774, 1, 0, 0, 1, 1,
0.6923729, -0.3662525, -0.1292621, 1, 0, 0, 1, 1,
0.6950787, -0.2675603, 0.3450511, 1, 0, 0, 1, 1,
0.6956233, 0.03056449, 1.258896, 1, 0, 0, 1, 1,
0.6981091, -1.748955, 3.792032, 0, 0, 0, 1, 1,
0.6986147, -0.3829427, 1.194216, 0, 0, 0, 1, 1,
0.6989837, 0.09985114, 2.393974, 0, 0, 0, 1, 1,
0.7046705, 0.7598801, -1.061931, 0, 0, 0, 1, 1,
0.709156, 0.07128648, 0.2646833, 0, 0, 0, 1, 1,
0.7118436, 0.0883076, 1.188095, 0, 0, 0, 1, 1,
0.7147605, -0.1823402, 1.755208, 0, 0, 0, 1, 1,
0.7150536, -0.1890059, 2.696832, 1, 1, 1, 1, 1,
0.7202491, -0.3634546, 0.8096001, 1, 1, 1, 1, 1,
0.7211986, 0.06607265, 2.123787, 1, 1, 1, 1, 1,
0.7245095, -2.050729, 2.985182, 1, 1, 1, 1, 1,
0.7290754, -0.6690176, 3.640622, 1, 1, 1, 1, 1,
0.7344788, 0.2954368, 1.805937, 1, 1, 1, 1, 1,
0.7347096, 2.191719, 0.3905013, 1, 1, 1, 1, 1,
0.7361197, 0.3578963, 2.676761, 1, 1, 1, 1, 1,
0.7403609, -1.10998, 1.764949, 1, 1, 1, 1, 1,
0.7552184, -0.08898176, 2.183942, 1, 1, 1, 1, 1,
0.7556852, 0.8368855, 1.020107, 1, 1, 1, 1, 1,
0.7623332, 2.126595, 0.525377, 1, 1, 1, 1, 1,
0.7673198, -0.5130815, 2.470623, 1, 1, 1, 1, 1,
0.7762614, -2.04423, 2.42914, 1, 1, 1, 1, 1,
0.782382, -1.577366, 4.380747, 1, 1, 1, 1, 1,
0.7824194, -1.362029, 4.290154, 0, 0, 1, 1, 1,
0.7861214, 1.268237, 0.5189036, 1, 0, 0, 1, 1,
0.7874294, -1.472381, 2.710968, 1, 0, 0, 1, 1,
0.7888429, -0.2765367, 3.280511, 1, 0, 0, 1, 1,
0.7904355, 0.6522228, -0.7920576, 1, 0, 0, 1, 1,
0.7962263, 1.424445, -0.1830996, 1, 0, 0, 1, 1,
0.8009099, 0.1237336, 2.115551, 0, 0, 0, 1, 1,
0.8107112, 0.315753, 0.5124158, 0, 0, 0, 1, 1,
0.8108865, 0.5623802, 0.7898549, 0, 0, 0, 1, 1,
0.8172607, 0.6064537, 1.286119, 0, 0, 0, 1, 1,
0.8193352, -1.346595, 4.012054, 0, 0, 0, 1, 1,
0.8209673, -0.1336437, 2.270985, 0, 0, 0, 1, 1,
0.8211753, -0.1000187, 1.738312, 0, 0, 0, 1, 1,
0.8214283, -0.871089, 2.902758, 1, 1, 1, 1, 1,
0.8270408, 0.09403502, 2.230877, 1, 1, 1, 1, 1,
0.8381547, -0.7778363, 3.061343, 1, 1, 1, 1, 1,
0.8462148, -0.3900293, 1.857716, 1, 1, 1, 1, 1,
0.8476961, -1.957146, 1.045329, 1, 1, 1, 1, 1,
0.8496957, 0.3890977, 1.253038, 1, 1, 1, 1, 1,
0.8525134, -1.249266, 5.379224, 1, 1, 1, 1, 1,
0.8549737, 0.6375355, 0.8991603, 1, 1, 1, 1, 1,
0.8558135, 0.5720526, -1.124795, 1, 1, 1, 1, 1,
0.8714328, -0.9633841, 2.968019, 1, 1, 1, 1, 1,
0.8793204, 1.028514, 1.341208, 1, 1, 1, 1, 1,
0.8804553, 0.04040492, 1.775793, 1, 1, 1, 1, 1,
0.8809873, 1.016911, -0.9714266, 1, 1, 1, 1, 1,
0.8831383, -0.1078462, 0.1700915, 1, 1, 1, 1, 1,
0.8856655, 0.2619932, 1.768068, 1, 1, 1, 1, 1,
0.8881131, -0.2638811, 1.711206, 0, 0, 1, 1, 1,
0.8991078, -0.7417071, 1.358463, 1, 0, 0, 1, 1,
0.9053817, 0.1321552, 1.610927, 1, 0, 0, 1, 1,
0.9210939, -0.9203171, 2.089694, 1, 0, 0, 1, 1,
0.9286863, 0.934535, -0.1156918, 1, 0, 0, 1, 1,
0.9375414, -0.7886443, 3.317524, 1, 0, 0, 1, 1,
0.9439977, -0.1708816, 1.785704, 0, 0, 0, 1, 1,
0.9477367, -0.1766429, -0.6578032, 0, 0, 0, 1, 1,
0.9477697, -1.805762, 3.327549, 0, 0, 0, 1, 1,
0.9526859, 0.04234224, 1.123156, 0, 0, 0, 1, 1,
0.9534912, -1.097361, 3.164502, 0, 0, 0, 1, 1,
0.9558591, -1.210385, 0.5804805, 0, 0, 0, 1, 1,
0.9578826, 0.3909593, 0.8924019, 0, 0, 0, 1, 1,
0.9744982, 0.6388791, 0.9160181, 1, 1, 1, 1, 1,
0.9774573, 0.2467327, 1.27421, 1, 1, 1, 1, 1,
0.98824, 0.6536866, -0.5302996, 1, 1, 1, 1, 1,
1.005298, 0.4310443, 3.110802, 1, 1, 1, 1, 1,
1.021043, -1.742635, 3.074813, 1, 1, 1, 1, 1,
1.026175, 1.560008, 0.9278642, 1, 1, 1, 1, 1,
1.027448, -0.4290148, 1.281123, 1, 1, 1, 1, 1,
1.033123, 1.681266, 1.788784, 1, 1, 1, 1, 1,
1.034344, -0.4883922, 3.75385, 1, 1, 1, 1, 1,
1.034878, 0.2303335, 0.492231, 1, 1, 1, 1, 1,
1.040934, 0.8839796, 1.382203, 1, 1, 1, 1, 1,
1.041931, 1.070854, 1.436131, 1, 1, 1, 1, 1,
1.043489, 1.622934, -0.2701959, 1, 1, 1, 1, 1,
1.044294, 1.267717, 0.2381515, 1, 1, 1, 1, 1,
1.050086, 0.2818896, 0.6587864, 1, 1, 1, 1, 1,
1.061084, 1.824314, 1.165052, 0, 0, 1, 1, 1,
1.062455, -0.4170811, 1.193578, 1, 0, 0, 1, 1,
1.077289, 0.8379886, -0.2471057, 1, 0, 0, 1, 1,
1.090913, -0.5708362, 2.158487, 1, 0, 0, 1, 1,
1.096502, 0.04449918, 2.338061, 1, 0, 0, 1, 1,
1.0989, 0.04124676, 1.525022, 1, 0, 0, 1, 1,
1.110561, -0.6030409, 1.73717, 0, 0, 0, 1, 1,
1.11347, -0.9783657, 2.001399, 0, 0, 0, 1, 1,
1.125588, -0.04754914, 1.733043, 0, 0, 0, 1, 1,
1.128368, -0.01385358, 3.028414, 0, 0, 0, 1, 1,
1.129909, -0.5759068, 2.435177, 0, 0, 0, 1, 1,
1.136227, 0.6910625, 1.551656, 0, 0, 0, 1, 1,
1.136474, 0.3314138, 1.233668, 0, 0, 0, 1, 1,
1.148277, 0.1109549, 2.061503, 1, 1, 1, 1, 1,
1.158975, 0.008580325, 2.161492, 1, 1, 1, 1, 1,
1.16407, -1.108649, 3.679938, 1, 1, 1, 1, 1,
1.172196, -0.08123498, 0.8535394, 1, 1, 1, 1, 1,
1.173825, 2.356616, 0.1251348, 1, 1, 1, 1, 1,
1.189773, -0.3191197, 0.6270888, 1, 1, 1, 1, 1,
1.198533, 1.280659, -0.2894737, 1, 1, 1, 1, 1,
1.200873, -0.4737378, 1.566414, 1, 1, 1, 1, 1,
1.212783, 1.804895, 0.09705221, 1, 1, 1, 1, 1,
1.214659, 0.4464584, 0.1575543, 1, 1, 1, 1, 1,
1.220845, -1.79509, 3.907065, 1, 1, 1, 1, 1,
1.224153, -0.08990104, 0.4708663, 1, 1, 1, 1, 1,
1.231589, 0.6586627, 2.375296, 1, 1, 1, 1, 1,
1.238009, -0.2876551, 2.116084, 1, 1, 1, 1, 1,
1.239245, 1.816876, 0.4133897, 1, 1, 1, 1, 1,
1.243179, -2.10219, 2.804371, 0, 0, 1, 1, 1,
1.247897, -0.5628914, 3.170735, 1, 0, 0, 1, 1,
1.252927, 0.6505188, 1.104523, 1, 0, 0, 1, 1,
1.253959, -0.318078, 2.081887, 1, 0, 0, 1, 1,
1.262196, 1.130787, 1.260396, 1, 0, 0, 1, 1,
1.272075, 0.1121983, 1.548126, 1, 0, 0, 1, 1,
1.278133, 0.8888306, 1.158184, 0, 0, 0, 1, 1,
1.279504, -1.914462, 3.06009, 0, 0, 0, 1, 1,
1.279603, -1.502163, 2.440456, 0, 0, 0, 1, 1,
1.283293, 0.9169002, 1.221949, 0, 0, 0, 1, 1,
1.287205, -0.976114, 2.547612, 0, 0, 0, 1, 1,
1.308395, -1.594306, 0.07990202, 0, 0, 0, 1, 1,
1.313185, -0.2503452, 0.8286611, 0, 0, 0, 1, 1,
1.317884, 0.2920255, 2.359111, 1, 1, 1, 1, 1,
1.334083, -1.029544, 2.665719, 1, 1, 1, 1, 1,
1.336021, 0.05278082, 2.433887, 1, 1, 1, 1, 1,
1.336428, -0.1369852, 1.682847, 1, 1, 1, 1, 1,
1.341096, 0.2761397, 2.323767, 1, 1, 1, 1, 1,
1.343823, 2.269078, 0.2060782, 1, 1, 1, 1, 1,
1.355656, 1.119324, 1.530122, 1, 1, 1, 1, 1,
1.356418, -0.1926454, 1.769198, 1, 1, 1, 1, 1,
1.357824, -1.988512, 4.346193, 1, 1, 1, 1, 1,
1.363869, 0.6287635, 3.209645, 1, 1, 1, 1, 1,
1.366262, 0.2725354, 1.323074, 1, 1, 1, 1, 1,
1.368991, 0.2701606, 0.552759, 1, 1, 1, 1, 1,
1.370192, 0.5726896, 1.78343, 1, 1, 1, 1, 1,
1.384816, 0.6278068, -1.050905, 1, 1, 1, 1, 1,
1.386407, -0.8243999, 4.033608, 1, 1, 1, 1, 1,
1.387462, 1.099491, 0.4554847, 0, 0, 1, 1, 1,
1.392981, 1.560416, -0.3550589, 1, 0, 0, 1, 1,
1.410828, 1.028976, -0.8216069, 1, 0, 0, 1, 1,
1.412061, -1.079771, 3.003171, 1, 0, 0, 1, 1,
1.418184, 0.6771463, 0.1534126, 1, 0, 0, 1, 1,
1.427788, -0.4592527, 1.692583, 1, 0, 0, 1, 1,
1.431047, 0.4080086, 0.5281675, 0, 0, 0, 1, 1,
1.431617, 0.2484163, 1.470824, 0, 0, 0, 1, 1,
1.447733, -0.5438418, 2.005349, 0, 0, 0, 1, 1,
1.448349, 1.236863, -0.105315, 0, 0, 0, 1, 1,
1.460007, 0.6798149, 3.307652, 0, 0, 0, 1, 1,
1.46556, 1.927206, 0.9773835, 0, 0, 0, 1, 1,
1.467539, -0.7609116, 3.46874, 0, 0, 0, 1, 1,
1.471268, -0.3676574, 1.417474, 1, 1, 1, 1, 1,
1.473212, -1.302584, 3.140491, 1, 1, 1, 1, 1,
1.478677, 0.7111417, -0.5912787, 1, 1, 1, 1, 1,
1.495358, 0.6618026, 1.386153, 1, 1, 1, 1, 1,
1.502164, 0.3056278, 2.319342, 1, 1, 1, 1, 1,
1.504756, 0.5474913, 2.362707, 1, 1, 1, 1, 1,
1.554474, 0.9458341, 2.469013, 1, 1, 1, 1, 1,
1.598489, -0.8459967, 2.645105, 1, 1, 1, 1, 1,
1.603462, -0.9087674, 2.939998, 1, 1, 1, 1, 1,
1.604291, 0.4300081, 1.418523, 1, 1, 1, 1, 1,
1.613187, -0.4999314, 5.238717, 1, 1, 1, 1, 1,
1.613326, 0.09672772, 2.609635, 1, 1, 1, 1, 1,
1.618589, 0.02008488, 1.842164, 1, 1, 1, 1, 1,
1.618933, 0.9697856, 0.560849, 1, 1, 1, 1, 1,
1.657653, 0.5817163, 0.9996561, 1, 1, 1, 1, 1,
1.664945, 0.2002852, 1.532672, 0, 0, 1, 1, 1,
1.666712, -2.051547, 1.712089, 1, 0, 0, 1, 1,
1.667733, 0.8291188, 2.423591, 1, 0, 0, 1, 1,
1.694693, -2.148631, 3.212766, 1, 0, 0, 1, 1,
1.697583, 0.1325064, 2.190665, 1, 0, 0, 1, 1,
1.698246, -0.06629093, 1.008671, 1, 0, 0, 1, 1,
1.703029, 1.085646, 0.3533125, 0, 0, 0, 1, 1,
1.706221, 1.202755, 0.2709864, 0, 0, 0, 1, 1,
1.719106, -0.3037364, 1.723864, 0, 0, 0, 1, 1,
1.720948, -0.177794, 1.620525, 0, 0, 0, 1, 1,
1.749344, -0.5361276, 1.106469, 0, 0, 0, 1, 1,
1.767733, 0.5397438, -0.5904052, 0, 0, 0, 1, 1,
1.773155, -1.014015, 3.432467, 0, 0, 0, 1, 1,
1.785605, -1.144934, 1.443533, 1, 1, 1, 1, 1,
1.793389, 0.7545839, 2.165459, 1, 1, 1, 1, 1,
1.820111, 0.7866434, 0.879307, 1, 1, 1, 1, 1,
1.832767, -0.5931469, 2.667939, 1, 1, 1, 1, 1,
1.840813, -0.7809992, 1.535802, 1, 1, 1, 1, 1,
1.864766, 0.7200916, 1.691668, 1, 1, 1, 1, 1,
1.881413, -1.44558, 0.2157976, 1, 1, 1, 1, 1,
1.882741, -1.099685, 2.801105, 1, 1, 1, 1, 1,
1.895233, -0.5766703, 1.554823, 1, 1, 1, 1, 1,
1.895446, 0.3395419, 0.4712057, 1, 1, 1, 1, 1,
1.936583, 1.674718, 1.199598, 1, 1, 1, 1, 1,
1.943411, -0.6059977, 1.67845, 1, 1, 1, 1, 1,
1.982163, -1.114125, 1.654817, 1, 1, 1, 1, 1,
2.016108, 0.8849423, 0.3676367, 1, 1, 1, 1, 1,
2.066887, 0.4119871, 1.99284, 1, 1, 1, 1, 1,
2.068027, -1.828692, 3.275279, 0, 0, 1, 1, 1,
2.106867, -2.134557, 2.37582, 1, 0, 0, 1, 1,
2.123503, 0.2808115, 1.114363, 1, 0, 0, 1, 1,
2.144745, -1.28881, 1.850463, 1, 0, 0, 1, 1,
2.17156, 1.910998, 2.208845, 1, 0, 0, 1, 1,
2.175936, 0.5255737, 1.601433, 1, 0, 0, 1, 1,
2.194159, -1.202106, 2.097611, 0, 0, 0, 1, 1,
2.258525, -0.2383272, 2.987054, 0, 0, 0, 1, 1,
2.295252, -1.42971, 1.127645, 0, 0, 0, 1, 1,
2.368636, -0.1876536, 1.699771, 0, 0, 0, 1, 1,
2.449297, -0.9651403, 2.175061, 0, 0, 0, 1, 1,
2.585317, 0.3371265, 1.063945, 0, 0, 0, 1, 1,
2.60941, -0.2531163, 2.528365, 0, 0, 0, 1, 1,
2.684256, -0.6277928, 1.997757, 1, 1, 1, 1, 1,
2.690422, 1.860447, 0.8934029, 1, 1, 1, 1, 1,
2.745289, -0.05883969, 2.001039, 1, 1, 1, 1, 1,
2.866045, -1.42774, 2.727525, 1, 1, 1, 1, 1,
2.964792, -0.750408, 0.8407474, 1, 1, 1, 1, 1,
3.017627, 0.8435796, 2.04674, 1, 1, 1, 1, 1,
3.039901, -0.4873312, 2.348347, 1, 1, 1, 1, 1
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
var radius = 9.424862;
var distance = 33.10442;
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
mvMatrix.translate( 0.1127903, -0.0767616, -0.3046896 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.10442);
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