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
-2.990011, 1.039628, -0.6578894, 1, 0, 0, 1,
-2.855979, -0.4253486, -2.927412, 1, 0.007843138, 0, 1,
-2.655877, -0.4088203, -2.657911, 1, 0.01176471, 0, 1,
-2.59569, -0.033188, -1.090918, 1, 0.01960784, 0, 1,
-2.558255, 0.2495677, -0.4765236, 1, 0.02352941, 0, 1,
-2.426212, 0.2723851, -0.4843549, 1, 0.03137255, 0, 1,
-2.323898, 0.04594869, -2.990442, 1, 0.03529412, 0, 1,
-2.291303, 0.688153, -1.428301, 1, 0.04313726, 0, 1,
-2.281242, 1.344335, -1.205227, 1, 0.04705882, 0, 1,
-2.250107, 0.3915667, -0.8713768, 1, 0.05490196, 0, 1,
-2.199224, -1.751727, -2.513088, 1, 0.05882353, 0, 1,
-2.192762, 1.914634, 0.3970135, 1, 0.06666667, 0, 1,
-2.177614, 0.5450847, -2.463539, 1, 0.07058824, 0, 1,
-2.168863, -0.02901976, -0.6057267, 1, 0.07843138, 0, 1,
-2.102224, 0.4021381, -1.780722, 1, 0.08235294, 0, 1,
-2.098954, -1.2093, -2.921735, 1, 0.09019608, 0, 1,
-2.074596, 0.8845049, -0.4517837, 1, 0.09411765, 0, 1,
-2.064395, -1.25361, -3.154274, 1, 0.1019608, 0, 1,
-2.063543, -0.4460386, -3.095898, 1, 0.1098039, 0, 1,
-2.050262, 0.6092144, 0.1477651, 1, 0.1137255, 0, 1,
-2.030322, 1.219277, -0.01053947, 1, 0.1215686, 0, 1,
-2.023935, 0.5797772, -0.1870945, 1, 0.1254902, 0, 1,
-2.003803, 1.637899, -0.558979, 1, 0.1333333, 0, 1,
-2.002439, 0.4533865, -2.100461, 1, 0.1372549, 0, 1,
-1.930547, 0.4864007, -0.3990715, 1, 0.145098, 0, 1,
-1.922968, 0.5603381, -1.533549, 1, 0.1490196, 0, 1,
-1.919695, -0.9665728, -4.297644, 1, 0.1568628, 0, 1,
-1.896141, -0.937718, -1.405306, 1, 0.1607843, 0, 1,
-1.840551, 0.2891507, -2.144894, 1, 0.1686275, 0, 1,
-1.838447, 0.2575369, -1.255977, 1, 0.172549, 0, 1,
-1.81249, -0.8532934, -0.617515, 1, 0.1803922, 0, 1,
-1.809065, -0.5403551, -3.252979, 1, 0.1843137, 0, 1,
-1.775211, 0.4089521, -0.0078309, 1, 0.1921569, 0, 1,
-1.768262, 1.206858, 0.2555738, 1, 0.1960784, 0, 1,
-1.758497, -0.5046387, -3.510603, 1, 0.2039216, 0, 1,
-1.748771, 0.05310545, -0.8046546, 1, 0.2117647, 0, 1,
-1.727977, 1.242877, -2.53071, 1, 0.2156863, 0, 1,
-1.72215, -0.1834458, -3.400162, 1, 0.2235294, 0, 1,
-1.690008, -0.2253587, -0.9582694, 1, 0.227451, 0, 1,
-1.679774, 0.006714407, -0.6220502, 1, 0.2352941, 0, 1,
-1.678783, -2.271673, -2.417605, 1, 0.2392157, 0, 1,
-1.673463, -0.09378694, -3.543922, 1, 0.2470588, 0, 1,
-1.6709, 0.4565098, -2.004176, 1, 0.2509804, 0, 1,
-1.646494, 0.3907016, -0.4447899, 1, 0.2588235, 0, 1,
-1.624616, 0.5367319, -2.201734, 1, 0.2627451, 0, 1,
-1.622483, -0.3622744, -1.150519, 1, 0.2705882, 0, 1,
-1.61818, -0.5612363, -1.078055, 1, 0.2745098, 0, 1,
-1.605785, 1.802488, -0.9964691, 1, 0.282353, 0, 1,
-1.602148, 0.5575873, -1.327568, 1, 0.2862745, 0, 1,
-1.599557, 0.2747236, -3.22274, 1, 0.2941177, 0, 1,
-1.591404, -0.04429655, -2.118116, 1, 0.3019608, 0, 1,
-1.584791, -0.2601884, -0.4392177, 1, 0.3058824, 0, 1,
-1.584391, -0.481111, -2.716344, 1, 0.3137255, 0, 1,
-1.577067, 0.3584069, -3.505832, 1, 0.3176471, 0, 1,
-1.56147, -0.5265639, -1.99365, 1, 0.3254902, 0, 1,
-1.5529, 0.3091352, -1.541071, 1, 0.3294118, 0, 1,
-1.548759, -0.9282154, -1.516411, 1, 0.3372549, 0, 1,
-1.544414, 0.1734308, -2.57598, 1, 0.3411765, 0, 1,
-1.526373, -0.5291848, -1.71666, 1, 0.3490196, 0, 1,
-1.517273, 0.8545414, -0.6699805, 1, 0.3529412, 0, 1,
-1.508942, 0.4114121, -1.016134, 1, 0.3607843, 0, 1,
-1.506949, 0.9345077, -1.706624, 1, 0.3647059, 0, 1,
-1.492521, 1.474803, -1.85175, 1, 0.372549, 0, 1,
-1.491961, -0.0555481, -1.270568, 1, 0.3764706, 0, 1,
-1.479675, 1.338401, -0.9919706, 1, 0.3843137, 0, 1,
-1.477705, 0.6275124, -1.888394, 1, 0.3882353, 0, 1,
-1.47756, 0.04578406, -1.21432, 1, 0.3960784, 0, 1,
-1.475504, -0.4561627, -4.191362, 1, 0.4039216, 0, 1,
-1.467287, 0.05664581, -1.884436, 1, 0.4078431, 0, 1,
-1.465781, 1.944113, 0.7832981, 1, 0.4156863, 0, 1,
-1.439826, 1.369575, -0.4431005, 1, 0.4196078, 0, 1,
-1.432136, -0.8693614, -2.848573, 1, 0.427451, 0, 1,
-1.416171, 0.4991881, -1.301849, 1, 0.4313726, 0, 1,
-1.415368, -2.27105, -2.082851, 1, 0.4392157, 0, 1,
-1.414301, 1.644446, -1.922665, 1, 0.4431373, 0, 1,
-1.413773, 0.210404, -2.501693, 1, 0.4509804, 0, 1,
-1.413521, -0.7392306, -2.592514, 1, 0.454902, 0, 1,
-1.406357, -1.172391, -1.073166, 1, 0.4627451, 0, 1,
-1.404924, 0.6590493, -0.9680024, 1, 0.4666667, 0, 1,
-1.397004, 1.156807, 0.7989478, 1, 0.4745098, 0, 1,
-1.391935, -0.6456226, -3.163989, 1, 0.4784314, 0, 1,
-1.388945, 0.008684416, -1.055615, 1, 0.4862745, 0, 1,
-1.386989, 0.6510381, -0.4548431, 1, 0.4901961, 0, 1,
-1.377004, -0.8055271, -3.431618, 1, 0.4980392, 0, 1,
-1.37603, -1.269702, -1.512082, 1, 0.5058824, 0, 1,
-1.370841, -0.7642403, -2.937185, 1, 0.509804, 0, 1,
-1.370837, -0.5725809, -4.673203, 1, 0.5176471, 0, 1,
-1.338703, -0.3096735, -1.233284, 1, 0.5215687, 0, 1,
-1.324486, 1.036685, -2.190638, 1, 0.5294118, 0, 1,
-1.315776, 0.1863772, -1.736765, 1, 0.5333334, 0, 1,
-1.306421, 0.3275766, -1.854958, 1, 0.5411765, 0, 1,
-1.298315, 0.7338072, -0.3427207, 1, 0.5450981, 0, 1,
-1.294111, 1.83596, -1.432411, 1, 0.5529412, 0, 1,
-1.290236, 0.6666874, -0.5231687, 1, 0.5568628, 0, 1,
-1.27359, 0.812776, -0.7873536, 1, 0.5647059, 0, 1,
-1.271648, -0.06080179, -2.363648, 1, 0.5686275, 0, 1,
-1.260438, -0.4728484, -2.462271, 1, 0.5764706, 0, 1,
-1.258234, 1.256906, 0.7319496, 1, 0.5803922, 0, 1,
-1.253011, 0.05036486, -2.035173, 1, 0.5882353, 0, 1,
-1.248945, -0.2466687, -2.691573, 1, 0.5921569, 0, 1,
-1.239809, 0.4908898, -2.394038, 1, 0.6, 0, 1,
-1.238744, 3.186516, -0.5919178, 1, 0.6078432, 0, 1,
-1.235282, 1.599416, -2.403061, 1, 0.6117647, 0, 1,
-1.23457, -1.311487, -2.790985, 1, 0.6196079, 0, 1,
-1.227015, 0.1302335, -2.813291, 1, 0.6235294, 0, 1,
-1.209051, 0.5326458, -0.6823353, 1, 0.6313726, 0, 1,
-1.208398, -0.8204652, -1.280468, 1, 0.6352941, 0, 1,
-1.208118, 1.914911, -0.5956019, 1, 0.6431373, 0, 1,
-1.185531, 0.8260158, -3.131829, 1, 0.6470588, 0, 1,
-1.182068, -0.5126877, -0.6561093, 1, 0.654902, 0, 1,
-1.178878, -0.8520259, -1.238982, 1, 0.6588235, 0, 1,
-1.175877, -0.3112613, -2.544752, 1, 0.6666667, 0, 1,
-1.170096, -0.467612, -2.700209, 1, 0.6705883, 0, 1,
-1.163646, -0.2360108, -2.329718, 1, 0.6784314, 0, 1,
-1.162383, -0.2816781, -2.926084, 1, 0.682353, 0, 1,
-1.161019, 0.8124301, 0.5237449, 1, 0.6901961, 0, 1,
-1.160116, -0.08735769, -1.074594, 1, 0.6941177, 0, 1,
-1.159268, -0.2606873, -1.654644, 1, 0.7019608, 0, 1,
-1.153588, -0.3927639, -1.180567, 1, 0.7098039, 0, 1,
-1.153196, 0.7334796, -2.528603, 1, 0.7137255, 0, 1,
-1.15221, -0.5505099, -0.3083848, 1, 0.7215686, 0, 1,
-1.147373, -1.881357, -0.4470408, 1, 0.7254902, 0, 1,
-1.141076, 0.2769574, -0.4437719, 1, 0.7333333, 0, 1,
-1.140453, -0.3409126, -1.493506, 1, 0.7372549, 0, 1,
-1.13346, 1.909138, -0.246226, 1, 0.7450981, 0, 1,
-1.128968, 0.529218, -3.798308, 1, 0.7490196, 0, 1,
-1.117166, 0.2071863, -0.5112373, 1, 0.7568628, 0, 1,
-1.116618, -1.289066, -2.787347, 1, 0.7607843, 0, 1,
-1.104494, -0.1490887, -2.712269, 1, 0.7686275, 0, 1,
-1.103252, -0.4007213, -2.414231, 1, 0.772549, 0, 1,
-1.098087, -1.531426, -2.132697, 1, 0.7803922, 0, 1,
-1.097443, 1.106036, -0.6524951, 1, 0.7843137, 0, 1,
-1.092825, 0.6932996, -2.363145, 1, 0.7921569, 0, 1,
-1.091951, -0.6727243, -1.692895, 1, 0.7960784, 0, 1,
-1.088978, -1.139519, -3.038214, 1, 0.8039216, 0, 1,
-1.079935, 1.611591, -0.4107495, 1, 0.8117647, 0, 1,
-1.065938, 0.07197823, -1.377882, 1, 0.8156863, 0, 1,
-1.060886, 1.629086, -2.359702, 1, 0.8235294, 0, 1,
-1.046176, 0.6471329, 0.6050981, 1, 0.827451, 0, 1,
-1.037642, 0.7957539, -0.1085227, 1, 0.8352941, 0, 1,
-1.0305, -0.8807133, -2.865313, 1, 0.8392157, 0, 1,
-1.027176, -2.476067, -2.946816, 1, 0.8470588, 0, 1,
-1.026887, -0.8386679, -3.307282, 1, 0.8509804, 0, 1,
-1.025255, 0.3598265, -1.839193, 1, 0.8588235, 0, 1,
-1.024037, -0.8053805, -1.191974, 1, 0.8627451, 0, 1,
-1.0221, -0.6948447, -1.718128, 1, 0.8705882, 0, 1,
-1.022062, -0.428636, -2.409304, 1, 0.8745098, 0, 1,
-1.02125, -0.5905756, -2.018986, 1, 0.8823529, 0, 1,
-1.007122, 0.3809663, -1.853252, 1, 0.8862745, 0, 1,
-1.00202, 1.036844, -1.712296, 1, 0.8941177, 0, 1,
-0.996506, 0.7271666, 0.2518594, 1, 0.8980392, 0, 1,
-0.9928375, -0.5684651, -1.601627, 1, 0.9058824, 0, 1,
-0.9890536, -1.981861, -3.240976, 1, 0.9137255, 0, 1,
-0.9877437, -1.013074, -4.111705, 1, 0.9176471, 0, 1,
-0.981191, 2.143453, 1.418955, 1, 0.9254902, 0, 1,
-0.975925, 0.5307881, -1.251003, 1, 0.9294118, 0, 1,
-0.9742996, 1.223237, -1.336037, 1, 0.9372549, 0, 1,
-0.9710438, -0.4544812, -0.7840087, 1, 0.9411765, 0, 1,
-0.9672563, 1.986612, 0.1742642, 1, 0.9490196, 0, 1,
-0.9638751, -0.173402, -0.6715941, 1, 0.9529412, 0, 1,
-0.9635886, 1.698731, -0.4266978, 1, 0.9607843, 0, 1,
-0.9610168, -1.289351, -2.901545, 1, 0.9647059, 0, 1,
-0.9606708, 0.2116508, -0.3768522, 1, 0.972549, 0, 1,
-0.9580849, 1.137465, 1.161111, 1, 0.9764706, 0, 1,
-0.9572845, 2.26668, -0.2437025, 1, 0.9843137, 0, 1,
-0.9535304, 2.03559, 0.0723653, 1, 0.9882353, 0, 1,
-0.9481794, 0.9324791, -1.041434, 1, 0.9960784, 0, 1,
-0.947943, -1.032566, -1.6647, 0.9960784, 1, 0, 1,
-0.9401435, -0.5712668, -1.843091, 0.9921569, 1, 0, 1,
-0.9317563, -0.5514621, -2.285258, 0.9843137, 1, 0, 1,
-0.9276559, -0.6439285, -1.448225, 0.9803922, 1, 0, 1,
-0.921954, -0.07126791, -1.572124, 0.972549, 1, 0, 1,
-0.9207554, 0.1670991, -1.354292, 0.9686275, 1, 0, 1,
-0.9198251, 0.9844192, -0.2984796, 0.9607843, 1, 0, 1,
-0.9164638, -0.5013352, -1.817353, 0.9568627, 1, 0, 1,
-0.9116386, 0.8367859, -0.5313051, 0.9490196, 1, 0, 1,
-0.9033326, 0.3302127, -0.64836, 0.945098, 1, 0, 1,
-0.9023781, 1.71183, -0.09449853, 0.9372549, 1, 0, 1,
-0.8994667, -0.4633601, -0.2979292, 0.9333333, 1, 0, 1,
-0.8971648, 0.2922092, 0.3456073, 0.9254902, 1, 0, 1,
-0.8949608, -1.692359, -0.6034359, 0.9215686, 1, 0, 1,
-0.8945461, 1.070107, 0.04993555, 0.9137255, 1, 0, 1,
-0.8940169, -0.7386886, -0.6857777, 0.9098039, 1, 0, 1,
-0.8931616, 0.09975451, -2.14998, 0.9019608, 1, 0, 1,
-0.8886052, -0.1534618, 0.389827, 0.8941177, 1, 0, 1,
-0.8879101, 0.7742829, -0.9308226, 0.8901961, 1, 0, 1,
-0.8819978, 0.717048, -1.985851, 0.8823529, 1, 0, 1,
-0.8774664, -1.172309, -2.986683, 0.8784314, 1, 0, 1,
-0.8736325, -0.4202812, -0.3184481, 0.8705882, 1, 0, 1,
-0.8728548, -1.018556, -2.298622, 0.8666667, 1, 0, 1,
-0.8713214, 0.2169462, -1.453112, 0.8588235, 1, 0, 1,
-0.8701813, 1.135327, -0.6989266, 0.854902, 1, 0, 1,
-0.8695136, -1.329798, 0.7442133, 0.8470588, 1, 0, 1,
-0.8648854, -0.2070611, -1.410388, 0.8431373, 1, 0, 1,
-0.8646818, -0.2927857, -1.88256, 0.8352941, 1, 0, 1,
-0.8623247, -0.371535, -1.296671, 0.8313726, 1, 0, 1,
-0.8551865, -1.293877, -3.983064, 0.8235294, 1, 0, 1,
-0.853507, -0.6851935, -2.633204, 0.8196079, 1, 0, 1,
-0.852686, -0.6042932, -3.130925, 0.8117647, 1, 0, 1,
-0.8471888, -0.3323562, -1.364898, 0.8078431, 1, 0, 1,
-0.8465754, -0.002475649, -1.739538, 0.8, 1, 0, 1,
-0.8371442, 1.121211, -0.6150124, 0.7921569, 1, 0, 1,
-0.8334064, 0.6275886, -0.7569271, 0.7882353, 1, 0, 1,
-0.8288502, 2.209825, -0.2119282, 0.7803922, 1, 0, 1,
-0.8263602, 1.193767, 0.2897058, 0.7764706, 1, 0, 1,
-0.8242893, 0.6398969, -1.028029, 0.7686275, 1, 0, 1,
-0.8231805, 0.6974974, -1.220783, 0.7647059, 1, 0, 1,
-0.8226816, 0.07827868, -0.8045731, 0.7568628, 1, 0, 1,
-0.8226619, -0.2473176, -0.01258478, 0.7529412, 1, 0, 1,
-0.8217306, 0.7226292, -1.383676, 0.7450981, 1, 0, 1,
-0.8199546, -0.4929539, -0.2436438, 0.7411765, 1, 0, 1,
-0.8159953, -0.4647264, -2.52038, 0.7333333, 1, 0, 1,
-0.8114807, 0.4222955, -0.3953817, 0.7294118, 1, 0, 1,
-0.8101731, 1.81592, 1.76762, 0.7215686, 1, 0, 1,
-0.8081259, 0.7832707, -2.004858, 0.7176471, 1, 0, 1,
-0.8058571, -1.067545, -3.753832, 0.7098039, 1, 0, 1,
-0.8013209, 1.4071, -0.8200283, 0.7058824, 1, 0, 1,
-0.7978576, 0.3448215, -2.632916, 0.6980392, 1, 0, 1,
-0.7978565, -0.8246858, -2.895021, 0.6901961, 1, 0, 1,
-0.7960929, -0.7775211, -3.453438, 0.6862745, 1, 0, 1,
-0.7945648, 0.3333704, -2.344473, 0.6784314, 1, 0, 1,
-0.7923731, 1.673734, -0.1167866, 0.6745098, 1, 0, 1,
-0.7877692, -0.401195, -2.166589, 0.6666667, 1, 0, 1,
-0.7870455, 1.822023, 0.39699, 0.6627451, 1, 0, 1,
-0.7831258, -0.4400016, -1.591386, 0.654902, 1, 0, 1,
-0.7819406, -1.293642, -0.5065535, 0.6509804, 1, 0, 1,
-0.7749292, 0.6677843, -2.495755, 0.6431373, 1, 0, 1,
-0.7695817, 0.05957771, -1.02262, 0.6392157, 1, 0, 1,
-0.76926, -0.1791627, -1.229699, 0.6313726, 1, 0, 1,
-0.7683784, -0.06375034, -3.189772, 0.627451, 1, 0, 1,
-0.7626795, -1.430121, -4.768149, 0.6196079, 1, 0, 1,
-0.7596431, -0.4907294, -2.092639, 0.6156863, 1, 0, 1,
-0.7309408, -0.8728292, -2.375825, 0.6078432, 1, 0, 1,
-0.7302095, 0.6060337, -0.064212, 0.6039216, 1, 0, 1,
-0.7296974, -0.4157783, -1.824777, 0.5960785, 1, 0, 1,
-0.7265695, -0.681701, -4.539471, 0.5882353, 1, 0, 1,
-0.7249272, -0.1557903, -4.161728, 0.5843138, 1, 0, 1,
-0.7189474, -2.125848, -4.38713, 0.5764706, 1, 0, 1,
-0.718933, -0.2188214, -3.401287, 0.572549, 1, 0, 1,
-0.7171824, -0.4821126, -0.9838362, 0.5647059, 1, 0, 1,
-0.7165326, 1.714948, 1.208464, 0.5607843, 1, 0, 1,
-0.7145374, 1.021407, -0.7552699, 0.5529412, 1, 0, 1,
-0.7111287, 0.5192956, -0.516256, 0.5490196, 1, 0, 1,
-0.7093321, 0.49193, -0.5677021, 0.5411765, 1, 0, 1,
-0.7080867, 0.2161674, -4.075063, 0.5372549, 1, 0, 1,
-0.7026994, -0.7026089, -1.530775, 0.5294118, 1, 0, 1,
-0.7000323, -1.122324, -4.084651, 0.5254902, 1, 0, 1,
-0.6958401, -0.0329123, -3.351957, 0.5176471, 1, 0, 1,
-0.6951527, 0.7445221, -0.4118093, 0.5137255, 1, 0, 1,
-0.6890477, 0.3053052, -0.425271, 0.5058824, 1, 0, 1,
-0.6869165, -0.197473, -2.765801, 0.5019608, 1, 0, 1,
-0.6808094, -1.63862, -1.782554, 0.4941176, 1, 0, 1,
-0.6766884, 0.8336505, -0.1969326, 0.4862745, 1, 0, 1,
-0.6699544, 0.7813642, -0.4562131, 0.4823529, 1, 0, 1,
-0.6698704, -0.1543447, -2.16032, 0.4745098, 1, 0, 1,
-0.6662764, 1.550826, -0.6119197, 0.4705882, 1, 0, 1,
-0.6639853, -0.1163106, -0.6399792, 0.4627451, 1, 0, 1,
-0.6625755, 0.6820961, -1.615524, 0.4588235, 1, 0, 1,
-0.6562566, 0.8297946, 0.7955306, 0.4509804, 1, 0, 1,
-0.6523466, 1.367495, -0.2333998, 0.4470588, 1, 0, 1,
-0.6504589, -0.5551109, -2.501463, 0.4392157, 1, 0, 1,
-0.6487356, 0.5345324, -0.6821856, 0.4352941, 1, 0, 1,
-0.6424701, -0.4156722, -2.611088, 0.427451, 1, 0, 1,
-0.6414515, -0.7428333, -2.24609, 0.4235294, 1, 0, 1,
-0.6378769, 0.1102355, -2.380696, 0.4156863, 1, 0, 1,
-0.6374446, 1.364705, -0.9825011, 0.4117647, 1, 0, 1,
-0.635257, 1.43468, 0.3105817, 0.4039216, 1, 0, 1,
-0.6351779, 0.7599037, -0.541557, 0.3960784, 1, 0, 1,
-0.6344792, 0.6166601, 0.01205986, 0.3921569, 1, 0, 1,
-0.6318765, -0.01656565, -1.742159, 0.3843137, 1, 0, 1,
-0.6313511, -1.043617, -2.427328, 0.3803922, 1, 0, 1,
-0.6299914, -1.412461, -1.889182, 0.372549, 1, 0, 1,
-0.6298622, 0.9816516, 0.1829757, 0.3686275, 1, 0, 1,
-0.6293532, -0.1451594, -1.772812, 0.3607843, 1, 0, 1,
-0.6250948, -0.1501824, -1.788361, 0.3568628, 1, 0, 1,
-0.6230468, 1.041484, -0.7557271, 0.3490196, 1, 0, 1,
-0.6218817, 1.041741, 1.660994, 0.345098, 1, 0, 1,
-0.6164441, 1.862972, -0.05624963, 0.3372549, 1, 0, 1,
-0.6164392, -0.093449, -0.4040238, 0.3333333, 1, 0, 1,
-0.6117392, 0.3783701, -2.247081, 0.3254902, 1, 0, 1,
-0.6098118, -0.05432589, -3.016277, 0.3215686, 1, 0, 1,
-0.6072684, 0.1929638, -1.356047, 0.3137255, 1, 0, 1,
-0.5985433, 1.066662, -0.7724814, 0.3098039, 1, 0, 1,
-0.5959939, -2.474156, -1.626067, 0.3019608, 1, 0, 1,
-0.5936577, -0.1121753, 0.05558642, 0.2941177, 1, 0, 1,
-0.5915281, -1.493202, -2.419347, 0.2901961, 1, 0, 1,
-0.5864719, -0.2671275, -4.350815, 0.282353, 1, 0, 1,
-0.5858809, 1.212536, 0.5960057, 0.2784314, 1, 0, 1,
-0.5850862, -0.08084556, -1.888562, 0.2705882, 1, 0, 1,
-0.5844633, -0.9834688, -2.044917, 0.2666667, 1, 0, 1,
-0.581555, 0.1600164, -1.826518, 0.2588235, 1, 0, 1,
-0.5803753, -1.620914, -1.67349, 0.254902, 1, 0, 1,
-0.5784488, 2.388345, -0.6018027, 0.2470588, 1, 0, 1,
-0.5766452, 1.514153, 0.3909775, 0.2431373, 1, 0, 1,
-0.5748588, -1.883413, -2.540465, 0.2352941, 1, 0, 1,
-0.5686809, -0.8121956, -2.810408, 0.2313726, 1, 0, 1,
-0.5589771, -0.3864265, -1.304466, 0.2235294, 1, 0, 1,
-0.5536518, -0.6982911, -2.077976, 0.2196078, 1, 0, 1,
-0.5452009, 1.394777, 0.3783584, 0.2117647, 1, 0, 1,
-0.5372967, 0.6307015, -0.2037438, 0.2078431, 1, 0, 1,
-0.534282, 2.140045, -1.481859, 0.2, 1, 0, 1,
-0.5332376, -1.476519, -2.366477, 0.1921569, 1, 0, 1,
-0.533102, -1.151313, -2.156228, 0.1882353, 1, 0, 1,
-0.5320707, 0.5789153, -0.9482284, 0.1803922, 1, 0, 1,
-0.5296407, 0.2000193, -0.3174381, 0.1764706, 1, 0, 1,
-0.5255045, -0.7460546, -4.204694, 0.1686275, 1, 0, 1,
-0.5161133, 1.395557, 0.4442805, 0.1647059, 1, 0, 1,
-0.5127608, 0.2215604, -0.5578114, 0.1568628, 1, 0, 1,
-0.5119148, 0.6967363, -2.138031, 0.1529412, 1, 0, 1,
-0.4989439, 0.3555335, -0.2503761, 0.145098, 1, 0, 1,
-0.4944938, 0.6238775, -0.8835619, 0.1411765, 1, 0, 1,
-0.4939277, -0.6307799, -3.038139, 0.1333333, 1, 0, 1,
-0.4932087, -1.794477, -2.441141, 0.1294118, 1, 0, 1,
-0.4925494, -0.4463884, -2.255225, 0.1215686, 1, 0, 1,
-0.4916046, -1.131541, -1.568341, 0.1176471, 1, 0, 1,
-0.4898922, 2.092003, -0.2799422, 0.1098039, 1, 0, 1,
-0.487528, 2.112588, -1.714412, 0.1058824, 1, 0, 1,
-0.4784842, -0.4788883, -4.093104, 0.09803922, 1, 0, 1,
-0.47393, 0.962643, 0.851995, 0.09019608, 1, 0, 1,
-0.4705373, 0.7593205, -1.219995, 0.08627451, 1, 0, 1,
-0.4698821, -0.8532681, -2.278743, 0.07843138, 1, 0, 1,
-0.4676586, -0.07562545, -4.089457, 0.07450981, 1, 0, 1,
-0.463454, 1.69733, 0.04439867, 0.06666667, 1, 0, 1,
-0.4567347, 1.788273, 0.03855303, 0.0627451, 1, 0, 1,
-0.4521433, -0.7941576, -2.374657, 0.05490196, 1, 0, 1,
-0.449304, 0.356922, -1.590567, 0.05098039, 1, 0, 1,
-0.4452823, 1.323107, 0.07923105, 0.04313726, 1, 0, 1,
-0.4449212, 0.2737668, -1.947366, 0.03921569, 1, 0, 1,
-0.440231, 0.9012737, -0.5944765, 0.03137255, 1, 0, 1,
-0.4381378, 0.7955915, -0.5399745, 0.02745098, 1, 0, 1,
-0.4373882, 0.5919742, -0.7468435, 0.01960784, 1, 0, 1,
-0.4256248, 0.3269003, 0.4202003, 0.01568628, 1, 0, 1,
-0.4230389, -1.016307, -1.571568, 0.007843138, 1, 0, 1,
-0.4204207, 1.399079, -0.6305373, 0.003921569, 1, 0, 1,
-0.4181419, -0.5754732, -1.484493, 0, 1, 0.003921569, 1,
-0.4132488, -0.4040393, -3.065531, 0, 1, 0.01176471, 1,
-0.4112593, 1.443451, 0.7571958, 0, 1, 0.01568628, 1,
-0.4109169, -0.1456573, -3.646743, 0, 1, 0.02352941, 1,
-0.4085991, -0.6406518, -3.171349, 0, 1, 0.02745098, 1,
-0.4069868, 0.04121898, -2.900768, 0, 1, 0.03529412, 1,
-0.4048848, 1.403622, -0.03886445, 0, 1, 0.03921569, 1,
-0.3984349, 0.3875232, -1.465797, 0, 1, 0.04705882, 1,
-0.3942718, 0.1410012, -1.465631, 0, 1, 0.05098039, 1,
-0.3929181, -0.3846702, -0.7846916, 0, 1, 0.05882353, 1,
-0.391637, 0.7994866, -0.1262966, 0, 1, 0.0627451, 1,
-0.3913533, 0.5673072, 0.3675687, 0, 1, 0.07058824, 1,
-0.3887022, -0.260216, -2.444574, 0, 1, 0.07450981, 1,
-0.3877323, 0.5056068, -2.042262, 0, 1, 0.08235294, 1,
-0.3848861, -2.146614, -2.602222, 0, 1, 0.08627451, 1,
-0.384626, 0.6954516, -1.939238, 0, 1, 0.09411765, 1,
-0.3841117, -1.659544, -2.719185, 0, 1, 0.1019608, 1,
-0.3813215, 1.949038, -0.3313324, 0, 1, 0.1058824, 1,
-0.3727702, -1.341835, -2.955538, 0, 1, 0.1137255, 1,
-0.3706511, -1.475171, -3.170211, 0, 1, 0.1176471, 1,
-0.3651452, -1.31717, -3.388934, 0, 1, 0.1254902, 1,
-0.3636525, 0.1110335, -0.8118651, 0, 1, 0.1294118, 1,
-0.3628987, 0.2360608, -0.6071044, 0, 1, 0.1372549, 1,
-0.3594144, -0.3724309, -2.551551, 0, 1, 0.1411765, 1,
-0.3548453, 1.151768, 1.664244, 0, 1, 0.1490196, 1,
-0.3537323, -0.1891081, -1.589344, 0, 1, 0.1529412, 1,
-0.3531102, 1.085748, -0.7859516, 0, 1, 0.1607843, 1,
-0.3523271, 0.1428293, -0.9131755, 0, 1, 0.1647059, 1,
-0.3479473, -0.4253659, -3.318202, 0, 1, 0.172549, 1,
-0.3410098, -0.06742866, -1.92419, 0, 1, 0.1764706, 1,
-0.3400875, -0.2131057, -2.122286, 0, 1, 0.1843137, 1,
-0.3342328, 1.531481, 0.4326521, 0, 1, 0.1882353, 1,
-0.3287711, 1.173869, -0.9410511, 0, 1, 0.1960784, 1,
-0.3274345, -1.834829, -4.382434, 0, 1, 0.2039216, 1,
-0.3250032, 0.364713, -0.819733, 0, 1, 0.2078431, 1,
-0.3246937, 1.38029, -0.4260211, 0, 1, 0.2156863, 1,
-0.3231782, -1.273363, -1.104057, 0, 1, 0.2196078, 1,
-0.3201825, -0.09794866, -2.840993, 0, 1, 0.227451, 1,
-0.317965, 1.501558, -0.3438603, 0, 1, 0.2313726, 1,
-0.3166511, -0.7157608, -2.517806, 0, 1, 0.2392157, 1,
-0.3157499, 0.3019266, -2.842731, 0, 1, 0.2431373, 1,
-0.3142003, 0.4291393, -0.2491588, 0, 1, 0.2509804, 1,
-0.3128893, 0.4733796, -1.185814, 0, 1, 0.254902, 1,
-0.312055, -0.5730534, -3.657693, 0, 1, 0.2627451, 1,
-0.307044, -2.014897, -2.587097, 0, 1, 0.2666667, 1,
-0.3021337, -0.08151241, -2.357095, 0, 1, 0.2745098, 1,
-0.3019682, 0.3751916, 0.1696615, 0, 1, 0.2784314, 1,
-0.3013702, -2.343029, -1.744988, 0, 1, 0.2862745, 1,
-0.3003969, 0.6535466, -1.278184, 0, 1, 0.2901961, 1,
-0.2987742, 1.694192, -1.243888, 0, 1, 0.2980392, 1,
-0.2971297, -0.5541756, -3.212897, 0, 1, 0.3058824, 1,
-0.2968681, -0.6723064, -3.948271, 0, 1, 0.3098039, 1,
-0.294732, 1.815565, -0.4815825, 0, 1, 0.3176471, 1,
-0.2928876, -0.06977381, -3.391545, 0, 1, 0.3215686, 1,
-0.2926087, 0.4367492, 1.106843, 0, 1, 0.3294118, 1,
-0.2884581, 0.3317177, -3.489105, 0, 1, 0.3333333, 1,
-0.2881024, 1.766697, -1.163759, 0, 1, 0.3411765, 1,
-0.2880977, 0.8450059, 0.1402529, 0, 1, 0.345098, 1,
-0.2874825, 1.067477, -1.430304, 0, 1, 0.3529412, 1,
-0.2873078, -1.822155, -0.5649136, 0, 1, 0.3568628, 1,
-0.2864302, 0.5960674, 0.792702, 0, 1, 0.3647059, 1,
-0.2844135, 0.431837, -0.771815, 0, 1, 0.3686275, 1,
-0.275871, 0.3470452, -1.279355, 0, 1, 0.3764706, 1,
-0.2753686, -0.3622445, -2.440891, 0, 1, 0.3803922, 1,
-0.2746979, 1.051148, 0.5897443, 0, 1, 0.3882353, 1,
-0.2667602, -1.114596, -1.6489, 0, 1, 0.3921569, 1,
-0.2634294, -1.045515, -4.002614, 0, 1, 0.4, 1,
-0.2630146, 0.7326577, -0.531521, 0, 1, 0.4078431, 1,
-0.2611378, -1.168905, -2.96708, 0, 1, 0.4117647, 1,
-0.2580087, -0.4297082, -1.503204, 0, 1, 0.4196078, 1,
-0.2532036, 0.1143846, 0.1551611, 0, 1, 0.4235294, 1,
-0.2423542, 1.524388, -1.666593, 0, 1, 0.4313726, 1,
-0.2376707, -0.3207961, -4.255868, 0, 1, 0.4352941, 1,
-0.2333386, -0.9420345, -2.22156, 0, 1, 0.4431373, 1,
-0.2312718, 2.125249, -1.217143, 0, 1, 0.4470588, 1,
-0.230873, -0.7812512, -0.9489414, 0, 1, 0.454902, 1,
-0.2303936, -0.9215722, -2.104894, 0, 1, 0.4588235, 1,
-0.2303377, -0.8527643, -3.6906, 0, 1, 0.4666667, 1,
-0.2296585, -0.3412305, -1.771217, 0, 1, 0.4705882, 1,
-0.2263702, 0.6901752, 1.794696, 0, 1, 0.4784314, 1,
-0.2245854, -0.8150572, -2.33455, 0, 1, 0.4823529, 1,
-0.2241196, -0.2921295, -2.21574, 0, 1, 0.4901961, 1,
-0.2238964, -0.09343963, -0.9179546, 0, 1, 0.4941176, 1,
-0.2160324, -0.7449149, -2.737159, 0, 1, 0.5019608, 1,
-0.2159581, 0.7528449, 0.51342, 0, 1, 0.509804, 1,
-0.2158881, -1.265335, -3.310755, 0, 1, 0.5137255, 1,
-0.2151994, 1.647477, -0.5995868, 0, 1, 0.5215687, 1,
-0.2042476, 0.3821045, -0.02136425, 0, 1, 0.5254902, 1,
-0.2025323, -0.2916975, -3.712477, 0, 1, 0.5333334, 1,
-0.2010789, -0.6509867, -1.840525, 0, 1, 0.5372549, 1,
-0.1956596, 1.733317, -0.9640802, 0, 1, 0.5450981, 1,
-0.1841524, 0.3880502, 1.226501, 0, 1, 0.5490196, 1,
-0.1827626, -0.5998145, -2.39549, 0, 1, 0.5568628, 1,
-0.1757402, -0.5369807, -5.960294, 0, 1, 0.5607843, 1,
-0.1644363, -1.982599, -3.395055, 0, 1, 0.5686275, 1,
-0.1638158, -1.212081, -3.557741, 0, 1, 0.572549, 1,
-0.16375, 1.554932, 1.433552, 0, 1, 0.5803922, 1,
-0.1609556, -0.6255023, -1.47266, 0, 1, 0.5843138, 1,
-0.1592835, -0.7621306, -4.104091, 0, 1, 0.5921569, 1,
-0.1581769, 0.0859665, 0.94618, 0, 1, 0.5960785, 1,
-0.150218, -0.4035405, -2.876836, 0, 1, 0.6039216, 1,
-0.1387642, -0.958554, -2.601003, 0, 1, 0.6117647, 1,
-0.1387187, -0.2408647, -2.335478, 0, 1, 0.6156863, 1,
-0.1379402, -0.8328814, -2.88239, 0, 1, 0.6235294, 1,
-0.1378537, 1.0699, -1.529932, 0, 1, 0.627451, 1,
-0.1358815, 0.6796256, -1.012752, 0, 1, 0.6352941, 1,
-0.1331736, -0.08243558, -0.8184129, 0, 1, 0.6392157, 1,
-0.1308967, 1.154226, -0.3422991, 0, 1, 0.6470588, 1,
-0.1308129, -1.780958, -2.400115, 0, 1, 0.6509804, 1,
-0.1274162, -1.637071, -2.558089, 0, 1, 0.6588235, 1,
-0.1263795, -0.4716855, -3.978142, 0, 1, 0.6627451, 1,
-0.1259609, 0.7018452, -1.628664, 0, 1, 0.6705883, 1,
-0.1230286, 1.629882, 0.2207344, 0, 1, 0.6745098, 1,
-0.1208368, 0.9861129, 0.5836966, 0, 1, 0.682353, 1,
-0.1206976, -0.8583064, -2.162393, 0, 1, 0.6862745, 1,
-0.1188754, 0.1979528, -1.470316, 0, 1, 0.6941177, 1,
-0.1185915, -0.6923848, -3.16721, 0, 1, 0.7019608, 1,
-0.1179527, 0.947192, -1.319294, 0, 1, 0.7058824, 1,
-0.116607, -0.7323232, -3.715232, 0, 1, 0.7137255, 1,
-0.1161127, -0.5323116, -2.383211, 0, 1, 0.7176471, 1,
-0.1095748, 1.23979, 1.030546, 0, 1, 0.7254902, 1,
-0.1095431, -0.1325311, -0.6940874, 0, 1, 0.7294118, 1,
-0.103519, 1.732291, 0.4190661, 0, 1, 0.7372549, 1,
-0.1022043, 0.160808, -0.04517101, 0, 1, 0.7411765, 1,
-0.09910942, 1.060412, -0.5490171, 0, 1, 0.7490196, 1,
-0.09745298, -0.551857, -1.73289, 0, 1, 0.7529412, 1,
-0.09491913, 0.03566326, -3.098079, 0, 1, 0.7607843, 1,
-0.09406771, 1.298187, -0.7912934, 0, 1, 0.7647059, 1,
-0.09220517, 0.4009952, -0.263802, 0, 1, 0.772549, 1,
-0.08934736, 1.261958, 0.3107071, 0, 1, 0.7764706, 1,
-0.08812705, 1.613424, -1.505364, 0, 1, 0.7843137, 1,
-0.08463868, 1.479817, -0.08222647, 0, 1, 0.7882353, 1,
-0.0780872, -0.683487, -4.328297, 0, 1, 0.7960784, 1,
-0.07646984, 0.7557174, -0.2583681, 0, 1, 0.8039216, 1,
-0.07254905, 0.1980934, -0.5504887, 0, 1, 0.8078431, 1,
-0.07201819, 0.470338, 1.588757, 0, 1, 0.8156863, 1,
-0.07138366, 0.3948444, 0.1543425, 0, 1, 0.8196079, 1,
-0.06979202, 1.406543, 0.3381771, 0, 1, 0.827451, 1,
-0.06812707, 0.7682676, 0.370707, 0, 1, 0.8313726, 1,
-0.06520156, 1.82809, 0.3164335, 0, 1, 0.8392157, 1,
-0.06314315, -0.1698753, -2.633149, 0, 1, 0.8431373, 1,
-0.0596129, 1.111629, 0.6024181, 0, 1, 0.8509804, 1,
-0.05677037, -0.04264482, -3.124893, 0, 1, 0.854902, 1,
-0.05640195, 0.8228515, -0.3826655, 0, 1, 0.8627451, 1,
-0.05351867, 2.301883, 0.5373644, 0, 1, 0.8666667, 1,
-0.04838813, 0.3098685, -0.1705096, 0, 1, 0.8745098, 1,
-0.04813379, -0.157286, -3.3648, 0, 1, 0.8784314, 1,
-0.04655554, 0.5351983, -1.362594, 0, 1, 0.8862745, 1,
-0.04533882, 0.8078014, 0.3830523, 0, 1, 0.8901961, 1,
-0.04024821, 0.3268201, -2.059692, 0, 1, 0.8980392, 1,
-0.03841168, 0.5741274, -0.7253663, 0, 1, 0.9058824, 1,
-0.03184456, 0.01710097, -1.208556, 0, 1, 0.9098039, 1,
-0.0299298, 1.140959, 0.7441733, 0, 1, 0.9176471, 1,
-0.02853777, 0.9145803, 0.5477849, 0, 1, 0.9215686, 1,
-0.01908568, -0.6828676, -4.026302, 0, 1, 0.9294118, 1,
-0.01572524, -2.230115, -1.685645, 0, 1, 0.9333333, 1,
-0.01423799, 0.5761743, -0.6109965, 0, 1, 0.9411765, 1,
-0.01269359, -1.648726, -0.9662947, 0, 1, 0.945098, 1,
-0.007178568, 0.03055753, -0.5038145, 0, 1, 0.9529412, 1,
0.005596279, -1.544712, 3.431476, 0, 1, 0.9568627, 1,
0.005639563, -0.5808163, 1.911898, 0, 1, 0.9647059, 1,
0.006318936, -0.006652858, 0.6268432, 0, 1, 0.9686275, 1,
0.006908905, 0.189052, -1.737401, 0, 1, 0.9764706, 1,
0.007128387, -1.511149, 3.164939, 0, 1, 0.9803922, 1,
0.009671859, -0.01290631, 2.287099, 0, 1, 0.9882353, 1,
0.01450145, 0.07871864, 0.4351366, 0, 1, 0.9921569, 1,
0.01830064, -1.264861, 4.049025, 0, 1, 1, 1,
0.01853414, 1.136994, 0.4906005, 0, 0.9921569, 1, 1,
0.02177521, -0.5616184, 2.673484, 0, 0.9882353, 1, 1,
0.02533663, 1.467746, 0.7742363, 0, 0.9803922, 1, 1,
0.02571534, 1.214461, 0.8771155, 0, 0.9764706, 1, 1,
0.02617398, 1.227967, 0.8678914, 0, 0.9686275, 1, 1,
0.02646538, 1.026738, -0.2242777, 0, 0.9647059, 1, 1,
0.02760236, -0.09711777, 2.818115, 0, 0.9568627, 1, 1,
0.02804087, -0.5297838, 2.845809, 0, 0.9529412, 1, 1,
0.02927912, -1.076918, 3.166225, 0, 0.945098, 1, 1,
0.03044752, -0.520813, 2.409392, 0, 0.9411765, 1, 1,
0.03159973, 0.1270731, 1.258489, 0, 0.9333333, 1, 1,
0.03271457, -0.3761155, 3.071278, 0, 0.9294118, 1, 1,
0.03619843, 0.8999478, 1.781852, 0, 0.9215686, 1, 1,
0.04188511, 0.2960155, 1.40999, 0, 0.9176471, 1, 1,
0.04273231, 0.643754, 0.6009007, 0, 0.9098039, 1, 1,
0.04299642, 2.187361, -1.521292, 0, 0.9058824, 1, 1,
0.04310868, 1.159272, -0.9388929, 0, 0.8980392, 1, 1,
0.0502564, -0.2505705, 5.627024, 0, 0.8901961, 1, 1,
0.05081446, 1.648866, -0.1501453, 0, 0.8862745, 1, 1,
0.0520207, -1.393399, 3.914121, 0, 0.8784314, 1, 1,
0.05822374, -1.643112, 3.207087, 0, 0.8745098, 1, 1,
0.0586304, -0.003376432, 1.031586, 0, 0.8666667, 1, 1,
0.06002328, -2.470149, 2.72133, 0, 0.8627451, 1, 1,
0.06241275, 2.227499, 2.210147, 0, 0.854902, 1, 1,
0.07175025, -0.02394084, 2.777702, 0, 0.8509804, 1, 1,
0.07279348, -0.5770098, 2.531072, 0, 0.8431373, 1, 1,
0.07708413, 0.578791, 0.2071318, 0, 0.8392157, 1, 1,
0.07954863, -0.3179931, 1.740764, 0, 0.8313726, 1, 1,
0.0814512, 0.1826493, -0.2565569, 0, 0.827451, 1, 1,
0.08192637, -0.2627059, 4.816994, 0, 0.8196079, 1, 1,
0.08245549, 0.8892025, 1.358159, 0, 0.8156863, 1, 1,
0.08249768, -0.8399901, 2.101, 0, 0.8078431, 1, 1,
0.08436631, -0.2302321, 1.991748, 0, 0.8039216, 1, 1,
0.08778738, 0.2905098, 0.1849353, 0, 0.7960784, 1, 1,
0.09068266, -1.997764, 3.923749, 0, 0.7882353, 1, 1,
0.0952945, -0.00871581, 1.193544, 0, 0.7843137, 1, 1,
0.09957626, 0.5026456, 2.027843, 0, 0.7764706, 1, 1,
0.1017931, -0.06501424, 1.131759, 0, 0.772549, 1, 1,
0.1122772, 0.1916902, 0.1468888, 0, 0.7647059, 1, 1,
0.112651, 1.675316, 0.1601591, 0, 0.7607843, 1, 1,
0.1153649, 0.03368771, 0.8922194, 0, 0.7529412, 1, 1,
0.1155938, -0.05921226, 2.363858, 0, 0.7490196, 1, 1,
0.1183671, -0.823329, 3.138082, 0, 0.7411765, 1, 1,
0.1211329, -0.5386786, 2.982714, 0, 0.7372549, 1, 1,
0.1263269, -0.8710036, 0.8239594, 0, 0.7294118, 1, 1,
0.1275036, 2.295668, 1.331852, 0, 0.7254902, 1, 1,
0.1317263, 0.1254829, 1.706462, 0, 0.7176471, 1, 1,
0.1322539, 0.5038809, 0.8194692, 0, 0.7137255, 1, 1,
0.1323827, 0.3088659, 0.3025895, 0, 0.7058824, 1, 1,
0.1434123, 1.057242, -1.697396, 0, 0.6980392, 1, 1,
0.1438698, -0.4570991, 2.29126, 0, 0.6941177, 1, 1,
0.1486666, 1.492937, -1.168143, 0, 0.6862745, 1, 1,
0.1489857, 0.9702815, 1.211826, 0, 0.682353, 1, 1,
0.150692, -1.155959, 2.422261, 0, 0.6745098, 1, 1,
0.1526276, -0.05864994, 2.604478, 0, 0.6705883, 1, 1,
0.1543458, -0.4763722, 2.054101, 0, 0.6627451, 1, 1,
0.1554931, -0.3988974, 3.927543, 0, 0.6588235, 1, 1,
0.1651426, 0.8239732, -1.399485, 0, 0.6509804, 1, 1,
0.166185, 0.6281653, -1.022328, 0, 0.6470588, 1, 1,
0.1689187, 0.5064257, 0.3162654, 0, 0.6392157, 1, 1,
0.1732999, 1.670542, -1.724772, 0, 0.6352941, 1, 1,
0.1738884, -0.7035687, 2.766477, 0, 0.627451, 1, 1,
0.1743374, -0.3848541, 2.53598, 0, 0.6235294, 1, 1,
0.1752443, 0.214085, 0.8576822, 0, 0.6156863, 1, 1,
0.1789683, 0.4851687, -0.7792966, 0, 0.6117647, 1, 1,
0.1792905, 0.03969568, 0.8729606, 0, 0.6039216, 1, 1,
0.1813095, 0.2393366, 1.428238, 0, 0.5960785, 1, 1,
0.1817866, -0.03412058, 3.741505, 0, 0.5921569, 1, 1,
0.1822848, -0.8050038, 2.180526, 0, 0.5843138, 1, 1,
0.1825525, -1.304422, 3.197603, 0, 0.5803922, 1, 1,
0.1825994, 0.3652948, 1.743304, 0, 0.572549, 1, 1,
0.1827811, 0.8537821, 2.543184, 0, 0.5686275, 1, 1,
0.1857904, -1.298437, 2.479208, 0, 0.5607843, 1, 1,
0.185862, -2.299871, 4.734825, 0, 0.5568628, 1, 1,
0.1864839, 0.5500485, -0.276117, 0, 0.5490196, 1, 1,
0.1875786, -0.7643719, 3.089367, 0, 0.5450981, 1, 1,
0.1913854, -0.2643807, 3.094882, 0, 0.5372549, 1, 1,
0.1920254, 0.5244243, -0.7730648, 0, 0.5333334, 1, 1,
0.1933564, 0.2007991, 2.121143, 0, 0.5254902, 1, 1,
0.1949467, 0.6041072, -0.7849969, 0, 0.5215687, 1, 1,
0.1989685, 0.4610061, 0.8079733, 0, 0.5137255, 1, 1,
0.1991461, -0.4712301, 1.800836, 0, 0.509804, 1, 1,
0.2033018, -0.2740952, 0.6230612, 0, 0.5019608, 1, 1,
0.2040953, 0.4531452, 0.9032274, 0, 0.4941176, 1, 1,
0.208979, -3.123301, 2.437455, 0, 0.4901961, 1, 1,
0.2091527, 2.579326, 0.02232783, 0, 0.4823529, 1, 1,
0.2186372, -0.6365914, 3.651091, 0, 0.4784314, 1, 1,
0.2234343, 0.4479551, 1.017809, 0, 0.4705882, 1, 1,
0.2259319, 0.08643241, 0.06840909, 0, 0.4666667, 1, 1,
0.2280455, -0.5468974, 3.902849, 0, 0.4588235, 1, 1,
0.2313335, -0.2573562, 2.246634, 0, 0.454902, 1, 1,
0.2355685, 0.7294335, 0.2180818, 0, 0.4470588, 1, 1,
0.2376262, 0.3396155, 0.738342, 0, 0.4431373, 1, 1,
0.239395, -0.4769692, 2.329798, 0, 0.4352941, 1, 1,
0.2416963, -1.067039, 4.397639, 0, 0.4313726, 1, 1,
0.2420359, 1.628031, -0.297038, 0, 0.4235294, 1, 1,
0.2439178, -0.7532742, 3.148834, 0, 0.4196078, 1, 1,
0.2439577, -0.8239493, 1.521741, 0, 0.4117647, 1, 1,
0.2467157, -0.9913753, 4.734658, 0, 0.4078431, 1, 1,
0.2494332, 1.275161, 1.039011, 0, 0.4, 1, 1,
0.2514105, 0.4188441, -1.84146, 0, 0.3921569, 1, 1,
0.2603854, 0.3443555, 0.7707939, 0, 0.3882353, 1, 1,
0.2631111, 0.5547777, 0.114507, 0, 0.3803922, 1, 1,
0.2682669, -1.939138, 3.995, 0, 0.3764706, 1, 1,
0.2694672, 0.8503306, 0.1034692, 0, 0.3686275, 1, 1,
0.2710488, -1.083378, 3.71151, 0, 0.3647059, 1, 1,
0.2755071, 0.5557587, 0.003394778, 0, 0.3568628, 1, 1,
0.275878, -0.7182923, 0.8185029, 0, 0.3529412, 1, 1,
0.2762735, -1.783298, 3.379319, 0, 0.345098, 1, 1,
0.277368, -0.4747471, 2.513295, 0, 0.3411765, 1, 1,
0.2880959, 0.5753316, -1.513563, 0, 0.3333333, 1, 1,
0.2920517, -0.03990479, -0.2574867, 0, 0.3294118, 1, 1,
0.2966144, 0.1149949, 1.474403, 0, 0.3215686, 1, 1,
0.3021079, 0.6999693, 0.148616, 0, 0.3176471, 1, 1,
0.3051754, 0.4600929, 0.9103227, 0, 0.3098039, 1, 1,
0.3057995, 0.6352506, -0.08665707, 0, 0.3058824, 1, 1,
0.30688, 0.4955068, 1.479183, 0, 0.2980392, 1, 1,
0.3106941, -1.451216, 2.175369, 0, 0.2901961, 1, 1,
0.3108996, -0.7394718, 3.702709, 0, 0.2862745, 1, 1,
0.3176731, 0.8509498, 0.9112878, 0, 0.2784314, 1, 1,
0.318075, 0.3508008, 1.693171, 0, 0.2745098, 1, 1,
0.3270039, -0.1110317, 2.214864, 0, 0.2666667, 1, 1,
0.32715, 0.4212647, -0.608331, 0, 0.2627451, 1, 1,
0.3303884, -1.522979, 3.26878, 0, 0.254902, 1, 1,
0.3318947, 0.09909102, -0.06179395, 0, 0.2509804, 1, 1,
0.3322829, 0.1709336, 0.695569, 0, 0.2431373, 1, 1,
0.333093, 0.07083911, 0.8852925, 0, 0.2392157, 1, 1,
0.3332143, -0.08154312, 3.46628, 0, 0.2313726, 1, 1,
0.3338266, 1.14667, -1.022993, 0, 0.227451, 1, 1,
0.3372618, -0.7840955, 3.555509, 0, 0.2196078, 1, 1,
0.3407862, 2.346719, -0.8430387, 0, 0.2156863, 1, 1,
0.3452956, 0.3086899, 1.615562, 0, 0.2078431, 1, 1,
0.3453193, 0.1293887, 2.551814, 0, 0.2039216, 1, 1,
0.3488997, -0.01258579, 1.708245, 0, 0.1960784, 1, 1,
0.349415, -0.7805203, 1.971303, 0, 0.1882353, 1, 1,
0.3517632, 0.002158342, 2.607061, 0, 0.1843137, 1, 1,
0.3526859, 0.4679216, -0.6337734, 0, 0.1764706, 1, 1,
0.3567615, -1.358775, 3.644771, 0, 0.172549, 1, 1,
0.3573656, -0.05272183, 2.015247, 0, 0.1647059, 1, 1,
0.3592073, -1.584829, 1.944316, 0, 0.1607843, 1, 1,
0.3605053, 0.3342341, -1.050705, 0, 0.1529412, 1, 1,
0.3609565, -1.189199, 3.421939, 0, 0.1490196, 1, 1,
0.3622636, 0.7841949, 1.440478, 0, 0.1411765, 1, 1,
0.3633489, 1.73395, 0.1210786, 0, 0.1372549, 1, 1,
0.3634904, 0.3171077, 0.384648, 0, 0.1294118, 1, 1,
0.3642481, -1.434723, 2.136292, 0, 0.1254902, 1, 1,
0.3666505, -0.6447445, 2.712788, 0, 0.1176471, 1, 1,
0.3685631, 0.1471465, 1.976215, 0, 0.1137255, 1, 1,
0.3689032, -2.131098, 3.006155, 0, 0.1058824, 1, 1,
0.3748506, 0.1633893, 0.6360747, 0, 0.09803922, 1, 1,
0.3749847, 0.5866029, 0.8928733, 0, 0.09411765, 1, 1,
0.3760527, 1.576431, 0.3845994, 0, 0.08627451, 1, 1,
0.3768967, 0.68107, 1.006326, 0, 0.08235294, 1, 1,
0.378013, 0.01181357, 0.2340726, 0, 0.07450981, 1, 1,
0.3791181, -1.230197, 2.580239, 0, 0.07058824, 1, 1,
0.3817596, -0.6638368, 3.411676, 0, 0.0627451, 1, 1,
0.3823974, -0.1762125, 2.412548, 0, 0.05882353, 1, 1,
0.3896281, 1.017378, 0.9532819, 0, 0.05098039, 1, 1,
0.3903514, 1.63573, 0.2778267, 0, 0.04705882, 1, 1,
0.392812, 0.4029441, 0.9705648, 0, 0.03921569, 1, 1,
0.394455, -0.06308684, 1.996667, 0, 0.03529412, 1, 1,
0.3969254, 1.501406, 0.9355912, 0, 0.02745098, 1, 1,
0.3984466, 0.01282311, -0.5306551, 0, 0.02352941, 1, 1,
0.3993562, -1.856212, 2.897674, 0, 0.01568628, 1, 1,
0.3996254, 0.09616974, 2.492689, 0, 0.01176471, 1, 1,
0.3998173, 0.409028, 1.790325, 0, 0.003921569, 1, 1,
0.4051057, 0.6318332, -0.1058883, 0.003921569, 0, 1, 1,
0.4056195, -0.9930445, 3.589327, 0.007843138, 0, 1, 1,
0.4102227, 2.572844, 0.05640743, 0.01568628, 0, 1, 1,
0.4128659, -0.2910749, 3.593439, 0.01960784, 0, 1, 1,
0.4149955, 0.2219834, 2.079575, 0.02745098, 0, 1, 1,
0.4161378, -0.2789899, 1.443214, 0.03137255, 0, 1, 1,
0.4182685, 0.7903686, -0.8993506, 0.03921569, 0, 1, 1,
0.4205536, -0.4344914, 2.221328, 0.04313726, 0, 1, 1,
0.4222498, 0.4310255, 0.8914024, 0.05098039, 0, 1, 1,
0.422675, 0.2992365, 0.9737259, 0.05490196, 0, 1, 1,
0.4273628, 2.473313, 0.4469642, 0.0627451, 0, 1, 1,
0.4283349, 0.2928132, 1.097061, 0.06666667, 0, 1, 1,
0.4348933, 1.842821, 0.09252135, 0.07450981, 0, 1, 1,
0.4350271, -0.134624, 2.975672, 0.07843138, 0, 1, 1,
0.4390032, 0.3699558, 0.9567038, 0.08627451, 0, 1, 1,
0.4435394, 1.585003, 0.6053275, 0.09019608, 0, 1, 1,
0.4499399, -0.1027166, 1.131984, 0.09803922, 0, 1, 1,
0.4505252, -0.3045459, 1.35796, 0.1058824, 0, 1, 1,
0.4513958, 0.1625802, 1.759245, 0.1098039, 0, 1, 1,
0.4543848, -0.8237564, 1.931345, 0.1176471, 0, 1, 1,
0.4572574, 1.176391, 0.1481063, 0.1215686, 0, 1, 1,
0.4582727, 1.650384, -0.05820405, 0.1294118, 0, 1, 1,
0.4620734, 1.849848, 0.3473134, 0.1333333, 0, 1, 1,
0.4652975, 1.320189, -0.0739492, 0.1411765, 0, 1, 1,
0.4660322, 0.07427763, 0.8363311, 0.145098, 0, 1, 1,
0.4719582, -0.3035028, 2.0166, 0.1529412, 0, 1, 1,
0.4759442, -1.91143, 3.530715, 0.1568628, 0, 1, 1,
0.4759678, -0.1753441, 1.546682, 0.1647059, 0, 1, 1,
0.4832321, -1.441586, 1.370498, 0.1686275, 0, 1, 1,
0.489107, -1.768714, 3.222803, 0.1764706, 0, 1, 1,
0.4910723, 0.3951761, -1.565724, 0.1803922, 0, 1, 1,
0.4953287, -0.506888, 0.7212223, 0.1882353, 0, 1, 1,
0.497025, 0.6941623, -0.2290726, 0.1921569, 0, 1, 1,
0.4975991, -0.4661412, 1.600543, 0.2, 0, 1, 1,
0.4982694, 0.7528451, 1.832875, 0.2078431, 0, 1, 1,
0.4992108, 1.165173, 1.153205, 0.2117647, 0, 1, 1,
0.514254, -1.425936, 1.385489, 0.2196078, 0, 1, 1,
0.5142549, 0.03810276, 2.705171, 0.2235294, 0, 1, 1,
0.5144235, 1.775947, 1.18952, 0.2313726, 0, 1, 1,
0.5148211, -0.289114, 1.105163, 0.2352941, 0, 1, 1,
0.5190513, 1.606645, 1.832083, 0.2431373, 0, 1, 1,
0.5192447, -1.616901, 3.512827, 0.2470588, 0, 1, 1,
0.5218555, -2.004314, 1.385622, 0.254902, 0, 1, 1,
0.5235842, 0.7598552, -0.4053011, 0.2588235, 0, 1, 1,
0.5236372, 0.2464567, 1.977947, 0.2666667, 0, 1, 1,
0.5242163, 0.6925421, 0.4806931, 0.2705882, 0, 1, 1,
0.5264257, -0.01022592, 1.700027, 0.2784314, 0, 1, 1,
0.5284949, 0.4808655, -0.5789786, 0.282353, 0, 1, 1,
0.5285011, 0.1940244, -0.3141722, 0.2901961, 0, 1, 1,
0.5307892, 0.7640765, 2.061201, 0.2941177, 0, 1, 1,
0.5321063, -1.132323, 1.598331, 0.3019608, 0, 1, 1,
0.5364534, 0.09113125, 1.496764, 0.3098039, 0, 1, 1,
0.5388861, 1.138967, -0.3194903, 0.3137255, 0, 1, 1,
0.539142, -2.417198, 4.372936, 0.3215686, 0, 1, 1,
0.5456099, 1.065391, 2.13504, 0.3254902, 0, 1, 1,
0.5483524, -0.02057206, 2.098713, 0.3333333, 0, 1, 1,
0.5541677, 0.2396487, 0.8138271, 0.3372549, 0, 1, 1,
0.5554647, -1.719108, 2.442264, 0.345098, 0, 1, 1,
0.555595, -0.7912293, 2.466845, 0.3490196, 0, 1, 1,
0.5572945, 1.511571, -1.340662, 0.3568628, 0, 1, 1,
0.558208, -0.7573277, 2.999011, 0.3607843, 0, 1, 1,
0.5602595, -1.648541, 3.266749, 0.3686275, 0, 1, 1,
0.5613719, 0.6797076, 1.110069, 0.372549, 0, 1, 1,
0.5725724, 0.9689808, 0.7202156, 0.3803922, 0, 1, 1,
0.5742198, 0.3180363, 0.3093846, 0.3843137, 0, 1, 1,
0.5784125, 1.532652, 0.5519716, 0.3921569, 0, 1, 1,
0.5813363, -1.034595, 2.334084, 0.3960784, 0, 1, 1,
0.5843186, -1.171968, 3.688668, 0.4039216, 0, 1, 1,
0.5866061, 0.8179739, 1.116252, 0.4117647, 0, 1, 1,
0.5870238, 0.1907769, 1.064047, 0.4156863, 0, 1, 1,
0.5886169, -0.06478282, 2.308649, 0.4235294, 0, 1, 1,
0.595283, 0.4594834, 0.005325838, 0.427451, 0, 1, 1,
0.5996386, 0.02285347, 2.067249, 0.4352941, 0, 1, 1,
0.6022412, -0.6522179, 1.718213, 0.4392157, 0, 1, 1,
0.6076124, 0.2485794, 2.668118, 0.4470588, 0, 1, 1,
0.6092345, 0.1623645, 0.9362996, 0.4509804, 0, 1, 1,
0.6126349, 0.1771874, 1.649934, 0.4588235, 0, 1, 1,
0.6146104, -1.288296, 0.7734546, 0.4627451, 0, 1, 1,
0.6158698, -0.4542882, 2.247216, 0.4705882, 0, 1, 1,
0.6160499, 1.486474, 0.03559956, 0.4745098, 0, 1, 1,
0.6165798, 0.1119763, 0.2670666, 0.4823529, 0, 1, 1,
0.6178024, -0.2068814, 1.652815, 0.4862745, 0, 1, 1,
0.6180261, 0.1890743, 1.475864, 0.4941176, 0, 1, 1,
0.619705, -0.8765976, 1.74538, 0.5019608, 0, 1, 1,
0.6236125, 1.559752, 0.9867548, 0.5058824, 0, 1, 1,
0.6285613, -0.7115617, 4.034228, 0.5137255, 0, 1, 1,
0.6331729, 0.5868464, 1.593446, 0.5176471, 0, 1, 1,
0.6337068, 1.613505, 0.9597367, 0.5254902, 0, 1, 1,
0.6340544, 0.7592259, 0.09992199, 0.5294118, 0, 1, 1,
0.6352892, -0.5043229, 1.607633, 0.5372549, 0, 1, 1,
0.6362307, -1.135128, 2.633525, 0.5411765, 0, 1, 1,
0.6379189, -0.5570253, 0.7203261, 0.5490196, 0, 1, 1,
0.6428992, -0.8015524, 1.184898, 0.5529412, 0, 1, 1,
0.6443374, 1.742756, -0.9849129, 0.5607843, 0, 1, 1,
0.6475595, -1.115002, 2.750447, 0.5647059, 0, 1, 1,
0.6515623, -1.201005, 4.209366, 0.572549, 0, 1, 1,
0.6526379, 1.392811, 0.3154442, 0.5764706, 0, 1, 1,
0.6527371, -0.1247408, 2.120841, 0.5843138, 0, 1, 1,
0.6527587, -0.8136109, 1.61754, 0.5882353, 0, 1, 1,
0.6567247, -0.4035697, 0.04971617, 0.5960785, 0, 1, 1,
0.6911986, 1.426362, -0.4066778, 0.6039216, 0, 1, 1,
0.6955534, -0.1897744, 0.9359692, 0.6078432, 0, 1, 1,
0.6960233, 1.822825, 0.1853872, 0.6156863, 0, 1, 1,
0.698103, -1.538779, 2.96172, 0.6196079, 0, 1, 1,
0.6986476, 0.279616, 1.356786, 0.627451, 0, 1, 1,
0.7025877, 0.5543752, -0.9042316, 0.6313726, 0, 1, 1,
0.7040621, 0.7978389, 0.4338137, 0.6392157, 0, 1, 1,
0.7041039, -2.23648, 2.589995, 0.6431373, 0, 1, 1,
0.7080137, 0.6562446, 1.724858, 0.6509804, 0, 1, 1,
0.7089119, -0.8988733, 2.365694, 0.654902, 0, 1, 1,
0.7160877, -1.809259, 1.059491, 0.6627451, 0, 1, 1,
0.7227549, -1.518837, 3.738825, 0.6666667, 0, 1, 1,
0.7228319, -0.5994581, 2.352475, 0.6745098, 0, 1, 1,
0.7229672, -0.1137086, 2.31671, 0.6784314, 0, 1, 1,
0.7302314, -1.221747, 3.750753, 0.6862745, 0, 1, 1,
0.7325099, 1.384181, 0.6168089, 0.6901961, 0, 1, 1,
0.7364936, -0.4954871, 3.202261, 0.6980392, 0, 1, 1,
0.737351, 1.434616, 0.7573594, 0.7058824, 0, 1, 1,
0.7459015, 0.8376288, 0.9350829, 0.7098039, 0, 1, 1,
0.752807, -2.667537, 4.487089, 0.7176471, 0, 1, 1,
0.7536228, -0.9584538, 2.198434, 0.7215686, 0, 1, 1,
0.7536983, 0.3502446, 1.530561, 0.7294118, 0, 1, 1,
0.7632313, -0.8099993, 1.165908, 0.7333333, 0, 1, 1,
0.7666104, -1.284119, 0.4668714, 0.7411765, 0, 1, 1,
0.7698252, -0.2523696, 2.901665, 0.7450981, 0, 1, 1,
0.7707404, -0.4308293, 1.067365, 0.7529412, 0, 1, 1,
0.7714725, -1.119052, 2.325834, 0.7568628, 0, 1, 1,
0.7725714, 0.2654037, 1.071556, 0.7647059, 0, 1, 1,
0.7770043, 1.244621, -1.690383, 0.7686275, 0, 1, 1,
0.7773265, -0.9200916, 1.583847, 0.7764706, 0, 1, 1,
0.7958515, -1.691281, 2.626447, 0.7803922, 0, 1, 1,
0.7994787, -0.4525129, 1.035741, 0.7882353, 0, 1, 1,
0.8003464, -0.3988731, 1.340307, 0.7921569, 0, 1, 1,
0.8012364, 1.010067, 0.7683603, 0.8, 0, 1, 1,
0.8021401, 0.977756, 0.8118942, 0.8078431, 0, 1, 1,
0.8047655, -0.3037922, 3.665772, 0.8117647, 0, 1, 1,
0.8076101, -1.052298, 3.612677, 0.8196079, 0, 1, 1,
0.8082885, -2.573451, 3.183177, 0.8235294, 0, 1, 1,
0.8088753, -1.394762, 2.365786, 0.8313726, 0, 1, 1,
0.8089249, -0.0006574702, 1.61252, 0.8352941, 0, 1, 1,
0.8102078, 0.8739657, 2.028007, 0.8431373, 0, 1, 1,
0.8155472, 1.034237, -0.3106694, 0.8470588, 0, 1, 1,
0.8172902, 1.460172, -1.641642, 0.854902, 0, 1, 1,
0.8320447, 0.463408, 1.066251, 0.8588235, 0, 1, 1,
0.8323711, -0.4124427, 1.618801, 0.8666667, 0, 1, 1,
0.8415918, 1.347756, 0.1064463, 0.8705882, 0, 1, 1,
0.842969, 0.5592722, 0.6386825, 0.8784314, 0, 1, 1,
0.8446546, 0.05223008, 2.361317, 0.8823529, 0, 1, 1,
0.8503365, 0.1967199, 3.970044, 0.8901961, 0, 1, 1,
0.8512559, 0.03009821, 0.7204159, 0.8941177, 0, 1, 1,
0.8521833, -1.831533, 2.447432, 0.9019608, 0, 1, 1,
0.859574, -1.52059, 3.248015, 0.9098039, 0, 1, 1,
0.8624312, 1.509236, 1.74733, 0.9137255, 0, 1, 1,
0.8681116, 1.354664, -0.3628262, 0.9215686, 0, 1, 1,
0.8685974, 0.8273122, 0.1558136, 0.9254902, 0, 1, 1,
0.8737988, -2.267437, 1.657039, 0.9333333, 0, 1, 1,
0.8768707, 0.2903407, 0.6449438, 0.9372549, 0, 1, 1,
0.8770835, 0.4053437, 0.4631215, 0.945098, 0, 1, 1,
0.8792629, 1.267714, -0.02949879, 0.9490196, 0, 1, 1,
0.8908253, 0.3864814, 0.598148, 0.9568627, 0, 1, 1,
0.8916498, -0.9979001, 4.388541, 0.9607843, 0, 1, 1,
0.9016258, 0.08206941, 0.9034005, 0.9686275, 0, 1, 1,
0.902992, 0.1092215, 0.5539626, 0.972549, 0, 1, 1,
0.9045275, -0.3004414, 1.639617, 0.9803922, 0, 1, 1,
0.9068035, -1.13052, 1.560076, 0.9843137, 0, 1, 1,
0.9196969, 1.21429, -1.763961, 0.9921569, 0, 1, 1,
0.9233649, 0.4707653, 1.568345, 0.9960784, 0, 1, 1,
0.930766, -2.402113, 1.397596, 1, 0, 0.9960784, 1,
0.9507788, 0.1425059, 1.094837, 1, 0, 0.9882353, 1,
0.9586229, 1.194555, 2.489284, 1, 0, 0.9843137, 1,
0.9633689, -0.3497276, 2.847938, 1, 0, 0.9764706, 1,
0.9709133, -1.224306, 2.634982, 1, 0, 0.972549, 1,
0.9712564, 1.365815, 0.5921125, 1, 0, 0.9647059, 1,
0.9716658, 1.201182, 2.858486, 1, 0, 0.9607843, 1,
0.9724869, 0.7304117, 3.179956, 1, 0, 0.9529412, 1,
0.9734277, 0.7619123, 2.382008, 1, 0, 0.9490196, 1,
0.974372, 0.6745507, 1.634446, 1, 0, 0.9411765, 1,
0.9791062, 2.487814, 1.606793, 1, 0, 0.9372549, 1,
0.9867476, 1.219759, -0.8853667, 1, 0, 0.9294118, 1,
0.9877691, 1.224505, 1.537043, 1, 0, 0.9254902, 1,
0.9890734, -0.2034479, 2.127678, 1, 0, 0.9176471, 1,
0.9936894, -1.516181, 3.269711, 1, 0, 0.9137255, 1,
0.9945324, 0.9613367, 0.6516971, 1, 0, 0.9058824, 1,
0.9946547, -1.308935, 2.439902, 1, 0, 0.9019608, 1,
1.000559, -0.02628196, 1.634461, 1, 0, 0.8941177, 1,
1.001101, 0.5247552, 2.641671, 1, 0, 0.8862745, 1,
1.0014, 0.9829322, 1.066977, 1, 0, 0.8823529, 1,
1.014131, -1.188756, 1.845022, 1, 0, 0.8745098, 1,
1.014536, 0.6352823, 0.7946089, 1, 0, 0.8705882, 1,
1.024391, 0.03239411, 2.700453, 1, 0, 0.8627451, 1,
1.033689, -0.3775339, 3.255926, 1, 0, 0.8588235, 1,
1.034178, -0.5303332, 1.227471, 1, 0, 0.8509804, 1,
1.039121, 0.7639703, 2.758639, 1, 0, 0.8470588, 1,
1.04145, -1.545822, 1.505034, 1, 0, 0.8392157, 1,
1.047395, -0.04648915, 1.963878, 1, 0, 0.8352941, 1,
1.048343, -0.2944776, 1.062978, 1, 0, 0.827451, 1,
1.052285, 0.4763465, 1.760313, 1, 0, 0.8235294, 1,
1.054151, -0.64675, 2.045134, 1, 0, 0.8156863, 1,
1.056523, 0.7069155, -0.4158842, 1, 0, 0.8117647, 1,
1.061017, -0.3247721, 3.394809, 1, 0, 0.8039216, 1,
1.06144, 0.5250539, 0.8967774, 1, 0, 0.7960784, 1,
1.061981, 0.0924525, 1.031217, 1, 0, 0.7921569, 1,
1.068539, -1.18069, 3.165048, 1, 0, 0.7843137, 1,
1.073525, 0.7764398, 1.458069, 1, 0, 0.7803922, 1,
1.074994, 0.9548135, 1.225324, 1, 0, 0.772549, 1,
1.08063, -2.279006, 3.461719, 1, 0, 0.7686275, 1,
1.081678, 0.5452245, 0.2108648, 1, 0, 0.7607843, 1,
1.081858, -0.6924045, 2.682995, 1, 0, 0.7568628, 1,
1.08453, 0.3419997, 0.7944825, 1, 0, 0.7490196, 1,
1.084909, 0.1820518, 1.583269, 1, 0, 0.7450981, 1,
1.086294, 0.4382176, 0.6924157, 1, 0, 0.7372549, 1,
1.096901, 0.3106111, 1.266804, 1, 0, 0.7333333, 1,
1.105798, 0.00557314, 1.055349, 1, 0, 0.7254902, 1,
1.113019, -0.1662816, 2.494122, 1, 0, 0.7215686, 1,
1.113347, 0.1289653, 1.873068, 1, 0, 0.7137255, 1,
1.113602, -1.314439, 2.619792, 1, 0, 0.7098039, 1,
1.115541, 0.5361542, 0.2682319, 1, 0, 0.7019608, 1,
1.116682, 0.08609052, 1.108258, 1, 0, 0.6941177, 1,
1.136667, -0.4112908, 2.374794, 1, 0, 0.6901961, 1,
1.138098, 0.2235261, 2.202275, 1, 0, 0.682353, 1,
1.146723, 0.3182426, -0.2897316, 1, 0, 0.6784314, 1,
1.172369, 0.2122633, 0.7643754, 1, 0, 0.6705883, 1,
1.177552, 0.1982902, 1.944396, 1, 0, 0.6666667, 1,
1.185442, -0.3840191, 2.102864, 1, 0, 0.6588235, 1,
1.185876, 0.8484654, 0.4245998, 1, 0, 0.654902, 1,
1.19198, 0.7299711, 0.6784089, 1, 0, 0.6470588, 1,
1.205238, -0.2535062, 2.175817, 1, 0, 0.6431373, 1,
1.208244, 0.1435689, 2.015589, 1, 0, 0.6352941, 1,
1.209582, 0.9182508, 1.898347, 1, 0, 0.6313726, 1,
1.211072, -0.4632615, 1.971867, 1, 0, 0.6235294, 1,
1.214563, 0.5459998, -0.05228447, 1, 0, 0.6196079, 1,
1.238827, -1.363107, 3.075552, 1, 0, 0.6117647, 1,
1.242058, 2.452941, -0.6633317, 1, 0, 0.6078432, 1,
1.242718, -0.1570408, 1.899391, 1, 0, 0.6, 1,
1.243469, 2.228755, 0.5125818, 1, 0, 0.5921569, 1,
1.250499, 0.1709089, 1.286858, 1, 0, 0.5882353, 1,
1.251963, -0.01915721, 1.965811, 1, 0, 0.5803922, 1,
1.258784, 0.185461, 0.1359847, 1, 0, 0.5764706, 1,
1.261177, 0.2838693, 0.7951302, 1, 0, 0.5686275, 1,
1.268597, -0.702479, 2.388329, 1, 0, 0.5647059, 1,
1.270316, 0.01434126, 1.700257, 1, 0, 0.5568628, 1,
1.286857, 1.699718, 1.411639, 1, 0, 0.5529412, 1,
1.291641, -0.06075887, 1.056554, 1, 0, 0.5450981, 1,
1.293139, 0.7292153, -1.149181, 1, 0, 0.5411765, 1,
1.293672, -0.2339131, 2.412787, 1, 0, 0.5333334, 1,
1.306141, -0.3727166, 3.03386, 1, 0, 0.5294118, 1,
1.315425, -0.688245, 1.493356, 1, 0, 0.5215687, 1,
1.3416, 0.4849818, 2.741466, 1, 0, 0.5176471, 1,
1.34697, 2.010553, 0.390469, 1, 0, 0.509804, 1,
1.35164, -0.306065, -0.9583927, 1, 0, 0.5058824, 1,
1.359201, 0.2904086, 1.044382, 1, 0, 0.4980392, 1,
1.381378, -1.254285, 2.305829, 1, 0, 0.4901961, 1,
1.386953, -1.695583, 2.357459, 1, 0, 0.4862745, 1,
1.39779, 1.446447, 2.37184, 1, 0, 0.4784314, 1,
1.398633, 1.059867, 1.18107, 1, 0, 0.4745098, 1,
1.42324, -0.5148913, 2.246332, 1, 0, 0.4666667, 1,
1.424999, 0.7608069, 0.230264, 1, 0, 0.4627451, 1,
1.43398, -0.7787609, 1.17615, 1, 0, 0.454902, 1,
1.437107, 0.05523312, 1.149908, 1, 0, 0.4509804, 1,
1.439021, -0.3903513, 5.021174, 1, 0, 0.4431373, 1,
1.442078, 0.04122714, 0.5641366, 1, 0, 0.4392157, 1,
1.443409, -1.220081, 1.538931, 1, 0, 0.4313726, 1,
1.448708, 0.5132977, -0.08916892, 1, 0, 0.427451, 1,
1.450721, -0.07833815, 0.2971421, 1, 0, 0.4196078, 1,
1.453686, -0.6856726, 2.895273, 1, 0, 0.4156863, 1,
1.461617, -0.7805418, 0.921095, 1, 0, 0.4078431, 1,
1.469016, -0.4575208, 0.6545163, 1, 0, 0.4039216, 1,
1.471583, -0.2989934, 1.385511, 1, 0, 0.3960784, 1,
1.476836, -1.088633, 1.466935, 1, 0, 0.3882353, 1,
1.502531, -0.2148333, 1.921364, 1, 0, 0.3843137, 1,
1.518061, 1.155109, 0.1767903, 1, 0, 0.3764706, 1,
1.520325, -1.739386, 2.049215, 1, 0, 0.372549, 1,
1.536239, -1.23006, 2.111151, 1, 0, 0.3647059, 1,
1.540308, 0.7540551, 2.034287, 1, 0, 0.3607843, 1,
1.541206, 1.25308, 0.9189474, 1, 0, 0.3529412, 1,
1.541746, -0.7320796, 2.870773, 1, 0, 0.3490196, 1,
1.572482, -1.476464, 2.385577, 1, 0, 0.3411765, 1,
1.594787, -1.015462, 3.980799, 1, 0, 0.3372549, 1,
1.597128, -1.307145, 0.4822673, 1, 0, 0.3294118, 1,
1.59944, -0.2172736, 1.466807, 1, 0, 0.3254902, 1,
1.609855, -0.2577987, 3.212494, 1, 0, 0.3176471, 1,
1.617845, 0.4350151, 1.931368, 1, 0, 0.3137255, 1,
1.628264, 1.797946, -0.1357187, 1, 0, 0.3058824, 1,
1.638064, 1.275927, -0.8297597, 1, 0, 0.2980392, 1,
1.650935, 0.4314387, 1.956597, 1, 0, 0.2941177, 1,
1.654184, -0.9744459, 1.253012, 1, 0, 0.2862745, 1,
1.666652, -1.539253, 2.920076, 1, 0, 0.282353, 1,
1.668556, 0.7177155, 1.383107, 1, 0, 0.2745098, 1,
1.679501, 0.3426992, 2.027197, 1, 0, 0.2705882, 1,
1.697093, -0.3452731, 1.568673, 1, 0, 0.2627451, 1,
1.723228, 0.8687557, 0.5294768, 1, 0, 0.2588235, 1,
1.723371, -0.5567119, 0.4160792, 1, 0, 0.2509804, 1,
1.739984, 1.44654, 1.542197, 1, 0, 0.2470588, 1,
1.750283, 0.3902802, 0.85593, 1, 0, 0.2392157, 1,
1.771043, 0.04097486, 0.9655922, 1, 0, 0.2352941, 1,
1.788515, 0.4011652, 1.898715, 1, 0, 0.227451, 1,
1.789757, 0.9431005, 1.704435, 1, 0, 0.2235294, 1,
1.799121, 0.6571118, 0.7645344, 1, 0, 0.2156863, 1,
1.800373, 0.9399035, 1.22408, 1, 0, 0.2117647, 1,
1.803277, 0.9729888, 1.826497, 1, 0, 0.2039216, 1,
1.836312, -1.808901, 1.736725, 1, 0, 0.1960784, 1,
1.854043, -0.7824982, 2.949185, 1, 0, 0.1921569, 1,
1.861094, -0.1765968, 1.137418, 1, 0, 0.1843137, 1,
1.863078, -0.05732866, 3.514104, 1, 0, 0.1803922, 1,
1.883611, -0.205298, 0.2253817, 1, 0, 0.172549, 1,
1.907835, 0.5768479, 2.387619, 1, 0, 0.1686275, 1,
1.909329, -0.4383394, 1.854642, 1, 0, 0.1607843, 1,
1.911847, -0.9603926, 0.4366533, 1, 0, 0.1568628, 1,
1.918824, -0.2792804, 1.652262, 1, 0, 0.1490196, 1,
1.920005, 1.531519, 0.6097471, 1, 0, 0.145098, 1,
1.938679, 0.7116945, 0.9836722, 1, 0, 0.1372549, 1,
1.962979, -1.905907, 2.510919, 1, 0, 0.1333333, 1,
1.981791, 0.1708778, 1.575947, 1, 0, 0.1254902, 1,
2.009503, 0.3283877, 1.774035, 1, 0, 0.1215686, 1,
2.01248, 0.03355279, 0.7152251, 1, 0, 0.1137255, 1,
2.0163, 0.1676259, 0.5720213, 1, 0, 0.1098039, 1,
2.043822, -0.8286055, 2.886978, 1, 0, 0.1019608, 1,
2.047593, 0.7522908, 0.36275, 1, 0, 0.09411765, 1,
2.051212, 1.054423, -0.3189289, 1, 0, 0.09019608, 1,
2.064542, -0.138201, 0.1271343, 1, 0, 0.08235294, 1,
2.079102, 0.8775886, 1.080534, 1, 0, 0.07843138, 1,
2.184426, -1.587888, 1.701551, 1, 0, 0.07058824, 1,
2.22847, 1.403294, 0.8271809, 1, 0, 0.06666667, 1,
2.250987, -0.8747409, 2.242366, 1, 0, 0.05882353, 1,
2.268655, 0.1580435, 1.039055, 1, 0, 0.05490196, 1,
2.362441, 0.4433917, 0.6546024, 1, 0, 0.04705882, 1,
2.383239, 1.220627, 1.781175, 1, 0, 0.04313726, 1,
2.435388, -2.098612, 3.760619, 1, 0, 0.03529412, 1,
2.47189, 1.218365, 3.347604, 1, 0, 0.03137255, 1,
2.47663, -0.3942928, 2.01422, 1, 0, 0.02352941, 1,
2.548677, 0.0941752, 1.351986, 1, 0, 0.01960784, 1,
2.64234, -0.4564124, 1.435402, 1, 0, 0.01176471, 1,
2.923221, -0.2572487, 0.1801421, 1, 0, 0.007843138, 1
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
-0.03339529, -4.192815, -7.924344, 0, -0.5, 0.5, 0.5,
-0.03339529, -4.192815, -7.924344, 1, -0.5, 0.5, 0.5,
-0.03339529, -4.192815, -7.924344, 1, 1.5, 0.5, 0.5,
-0.03339529, -4.192815, -7.924344, 0, 1.5, 0.5, 0.5
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
-3.992304, 0.03160763, -7.924344, 0, -0.5, 0.5, 0.5,
-3.992304, 0.03160763, -7.924344, 1, -0.5, 0.5, 0.5,
-3.992304, 0.03160763, -7.924344, 1, 1.5, 0.5, 0.5,
-3.992304, 0.03160763, -7.924344, 0, 1.5, 0.5, 0.5
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
-3.992304, -4.192815, -0.166635, 0, -0.5, 0.5, 0.5,
-3.992304, -4.192815, -0.166635, 1, -0.5, 0.5, 0.5,
-3.992304, -4.192815, -0.166635, 1, 1.5, 0.5, 0.5,
-3.992304, -4.192815, -0.166635, 0, 1.5, 0.5, 0.5
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
-2, -3.217948, -6.134103,
2, -3.217948, -6.134103,
-2, -3.217948, -6.134103,
-2, -3.380426, -6.432477,
-1, -3.217948, -6.134103,
-1, -3.380426, -6.432477,
0, -3.217948, -6.134103,
0, -3.380426, -6.432477,
1, -3.217948, -6.134103,
1, -3.380426, -6.432477,
2, -3.217948, -6.134103,
2, -3.380426, -6.432477
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
-2, -3.705382, -7.029224, 0, -0.5, 0.5, 0.5,
-2, -3.705382, -7.029224, 1, -0.5, 0.5, 0.5,
-2, -3.705382, -7.029224, 1, 1.5, 0.5, 0.5,
-2, -3.705382, -7.029224, 0, 1.5, 0.5, 0.5,
-1, -3.705382, -7.029224, 0, -0.5, 0.5, 0.5,
-1, -3.705382, -7.029224, 1, -0.5, 0.5, 0.5,
-1, -3.705382, -7.029224, 1, 1.5, 0.5, 0.5,
-1, -3.705382, -7.029224, 0, 1.5, 0.5, 0.5,
0, -3.705382, -7.029224, 0, -0.5, 0.5, 0.5,
0, -3.705382, -7.029224, 1, -0.5, 0.5, 0.5,
0, -3.705382, -7.029224, 1, 1.5, 0.5, 0.5,
0, -3.705382, -7.029224, 0, 1.5, 0.5, 0.5,
1, -3.705382, -7.029224, 0, -0.5, 0.5, 0.5,
1, -3.705382, -7.029224, 1, -0.5, 0.5, 0.5,
1, -3.705382, -7.029224, 1, 1.5, 0.5, 0.5,
1, -3.705382, -7.029224, 0, 1.5, 0.5, 0.5,
2, -3.705382, -7.029224, 0, -0.5, 0.5, 0.5,
2, -3.705382, -7.029224, 1, -0.5, 0.5, 0.5,
2, -3.705382, -7.029224, 1, 1.5, 0.5, 0.5,
2, -3.705382, -7.029224, 0, 1.5, 0.5, 0.5
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
-3.07871, -3, -6.134103,
-3.07871, 3, -6.134103,
-3.07871, -3, -6.134103,
-3.230975, -3, -6.432477,
-3.07871, -2, -6.134103,
-3.230975, -2, -6.432477,
-3.07871, -1, -6.134103,
-3.230975, -1, -6.432477,
-3.07871, 0, -6.134103,
-3.230975, 0, -6.432477,
-3.07871, 1, -6.134103,
-3.230975, 1, -6.432477,
-3.07871, 2, -6.134103,
-3.230975, 2, -6.432477,
-3.07871, 3, -6.134103,
-3.230975, 3, -6.432477
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
-3.535507, -3, -7.029224, 0, -0.5, 0.5, 0.5,
-3.535507, -3, -7.029224, 1, -0.5, 0.5, 0.5,
-3.535507, -3, -7.029224, 1, 1.5, 0.5, 0.5,
-3.535507, -3, -7.029224, 0, 1.5, 0.5, 0.5,
-3.535507, -2, -7.029224, 0, -0.5, 0.5, 0.5,
-3.535507, -2, -7.029224, 1, -0.5, 0.5, 0.5,
-3.535507, -2, -7.029224, 1, 1.5, 0.5, 0.5,
-3.535507, -2, -7.029224, 0, 1.5, 0.5, 0.5,
-3.535507, -1, -7.029224, 0, -0.5, 0.5, 0.5,
-3.535507, -1, -7.029224, 1, -0.5, 0.5, 0.5,
-3.535507, -1, -7.029224, 1, 1.5, 0.5, 0.5,
-3.535507, -1, -7.029224, 0, 1.5, 0.5, 0.5,
-3.535507, 0, -7.029224, 0, -0.5, 0.5, 0.5,
-3.535507, 0, -7.029224, 1, -0.5, 0.5, 0.5,
-3.535507, 0, -7.029224, 1, 1.5, 0.5, 0.5,
-3.535507, 0, -7.029224, 0, 1.5, 0.5, 0.5,
-3.535507, 1, -7.029224, 0, -0.5, 0.5, 0.5,
-3.535507, 1, -7.029224, 1, -0.5, 0.5, 0.5,
-3.535507, 1, -7.029224, 1, 1.5, 0.5, 0.5,
-3.535507, 1, -7.029224, 0, 1.5, 0.5, 0.5,
-3.535507, 2, -7.029224, 0, -0.5, 0.5, 0.5,
-3.535507, 2, -7.029224, 1, -0.5, 0.5, 0.5,
-3.535507, 2, -7.029224, 1, 1.5, 0.5, 0.5,
-3.535507, 2, -7.029224, 0, 1.5, 0.5, 0.5,
-3.535507, 3, -7.029224, 0, -0.5, 0.5, 0.5,
-3.535507, 3, -7.029224, 1, -0.5, 0.5, 0.5,
-3.535507, 3, -7.029224, 1, 1.5, 0.5, 0.5,
-3.535507, 3, -7.029224, 0, 1.5, 0.5, 0.5
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
-3.07871, -3.217948, -4,
-3.07871, -3.217948, 4,
-3.07871, -3.217948, -4,
-3.230975, -3.380426, -4,
-3.07871, -3.217948, -2,
-3.230975, -3.380426, -2,
-3.07871, -3.217948, 0,
-3.230975, -3.380426, 0,
-3.07871, -3.217948, 2,
-3.230975, -3.380426, 2,
-3.07871, -3.217948, 4,
-3.230975, -3.380426, 4
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
-3.535507, -3.705382, -4, 0, -0.5, 0.5, 0.5,
-3.535507, -3.705382, -4, 1, -0.5, 0.5, 0.5,
-3.535507, -3.705382, -4, 1, 1.5, 0.5, 0.5,
-3.535507, -3.705382, -4, 0, 1.5, 0.5, 0.5,
-3.535507, -3.705382, -2, 0, -0.5, 0.5, 0.5,
-3.535507, -3.705382, -2, 1, -0.5, 0.5, 0.5,
-3.535507, -3.705382, -2, 1, 1.5, 0.5, 0.5,
-3.535507, -3.705382, -2, 0, 1.5, 0.5, 0.5,
-3.535507, -3.705382, 0, 0, -0.5, 0.5, 0.5,
-3.535507, -3.705382, 0, 1, -0.5, 0.5, 0.5,
-3.535507, -3.705382, 0, 1, 1.5, 0.5, 0.5,
-3.535507, -3.705382, 0, 0, 1.5, 0.5, 0.5,
-3.535507, -3.705382, 2, 0, -0.5, 0.5, 0.5,
-3.535507, -3.705382, 2, 1, -0.5, 0.5, 0.5,
-3.535507, -3.705382, 2, 1, 1.5, 0.5, 0.5,
-3.535507, -3.705382, 2, 0, 1.5, 0.5, 0.5,
-3.535507, -3.705382, 4, 0, -0.5, 0.5, 0.5,
-3.535507, -3.705382, 4, 1, -0.5, 0.5, 0.5,
-3.535507, -3.705382, 4, 1, 1.5, 0.5, 0.5,
-3.535507, -3.705382, 4, 0, 1.5, 0.5, 0.5
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
-3.07871, -3.217948, -6.134103,
-3.07871, 3.281163, -6.134103,
-3.07871, -3.217948, 5.800833,
-3.07871, 3.281163, 5.800833,
-3.07871, -3.217948, -6.134103,
-3.07871, -3.217948, 5.800833,
-3.07871, 3.281163, -6.134103,
-3.07871, 3.281163, 5.800833,
-3.07871, -3.217948, -6.134103,
3.011919, -3.217948, -6.134103,
-3.07871, -3.217948, 5.800833,
3.011919, -3.217948, 5.800833,
-3.07871, 3.281163, -6.134103,
3.011919, 3.281163, -6.134103,
-3.07871, 3.281163, 5.800833,
3.011919, 3.281163, 5.800833,
3.011919, -3.217948, -6.134103,
3.011919, 3.281163, -6.134103,
3.011919, -3.217948, 5.800833,
3.011919, 3.281163, 5.800833,
3.011919, -3.217948, -6.134103,
3.011919, -3.217948, 5.800833,
3.011919, 3.281163, -6.134103,
3.011919, 3.281163, 5.800833
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
var radius = 7.952133;
var distance = 35.37994;
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
mvMatrix.translate( 0.03339529, -0.03160763, 0.166635 );
mvMatrix.scale( 1.411677, 1.32295, 0.7204062 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.37994);
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


