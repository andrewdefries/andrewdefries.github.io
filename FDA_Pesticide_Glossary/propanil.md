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
-2.977432, 1.895582, -1.001897, 1, 0, 0, 1,
-2.949178, -0.4277751, -2.135324, 1, 0.007843138, 0, 1,
-2.779179, -1.578127, -2.195935, 1, 0.01176471, 0, 1,
-2.669889, -0.2303648, -1.33101, 1, 0.01960784, 0, 1,
-2.590197, -0.5558085, -1.404894, 1, 0.02352941, 0, 1,
-2.547495, 2.394983, -0.07073058, 1, 0.03137255, 0, 1,
-2.45813, 0.4392294, -1.885962, 1, 0.03529412, 0, 1,
-2.419011, -1.056601, -2.438596, 1, 0.04313726, 0, 1,
-2.373906, -1.078591, -0.7146884, 1, 0.04705882, 0, 1,
-2.317433, -1.437372, -1.556368, 1, 0.05490196, 0, 1,
-2.315472, 0.747601, -1.043957, 1, 0.05882353, 0, 1,
-2.285945, -0.6900651, -2.195414, 1, 0.06666667, 0, 1,
-2.271138, 0.009970241, -2.015239, 1, 0.07058824, 0, 1,
-2.232171, 0.3084505, -1.883991, 1, 0.07843138, 0, 1,
-2.172841, -1.148368, -2.926874, 1, 0.08235294, 0, 1,
-2.159642, 0.5619281, -0.8934931, 1, 0.09019608, 0, 1,
-2.153315, 0.4035651, -0.1028531, 1, 0.09411765, 0, 1,
-2.147895, -1.344849, -1.642676, 1, 0.1019608, 0, 1,
-2.139274, 0.9210879, -3.239323, 1, 0.1098039, 0, 1,
-2.096642, 0.4997448, -2.08314, 1, 0.1137255, 0, 1,
-2.074628, 0.2189059, -1.754527, 1, 0.1215686, 0, 1,
-2.066476, 0.8726294, -2.112253, 1, 0.1254902, 0, 1,
-2.05956, 1.589259, -2.502365, 1, 0.1333333, 0, 1,
-2.055817, -1.701383, -2.759562, 1, 0.1372549, 0, 1,
-2.049096, 0.6183894, -0.2824696, 1, 0.145098, 0, 1,
-2.007843, -1.691748, -1.784031, 1, 0.1490196, 0, 1,
-1.974428, 0.06241084, -1.707583, 1, 0.1568628, 0, 1,
-1.962081, 0.1974687, -0.8025119, 1, 0.1607843, 0, 1,
-1.951897, -1.499436, -1.605004, 1, 0.1686275, 0, 1,
-1.916949, 0.8803811, -1.488323, 1, 0.172549, 0, 1,
-1.906501, 1.349134, 1.75653, 1, 0.1803922, 0, 1,
-1.894784, -1.476567, -0.03054502, 1, 0.1843137, 0, 1,
-1.887405, 0.04178565, -0.4793314, 1, 0.1921569, 0, 1,
-1.880705, -1.009155, -1.263936, 1, 0.1960784, 0, 1,
-1.861497, -1.06649, -3.070645, 1, 0.2039216, 0, 1,
-1.851187, 0.2808959, -2.836112, 1, 0.2117647, 0, 1,
-1.846722, 0.644667, -1.748749, 1, 0.2156863, 0, 1,
-1.823019, -0.5107594, -1.916698, 1, 0.2235294, 0, 1,
-1.808376, 1.799266, -0.6248503, 1, 0.227451, 0, 1,
-1.80299, 0.8767552, -2.292553, 1, 0.2352941, 0, 1,
-1.787601, 1.164395, 0.8200178, 1, 0.2392157, 0, 1,
-1.764961, 0.3380389, -2.571708, 1, 0.2470588, 0, 1,
-1.755999, 1.309363, -1.118906, 1, 0.2509804, 0, 1,
-1.748589, 2.157627, -1.911447, 1, 0.2588235, 0, 1,
-1.747657, 1.45359, -0.1273629, 1, 0.2627451, 0, 1,
-1.744462, 1.910313, -1.169135, 1, 0.2705882, 0, 1,
-1.740961, -0.6792949, -2.138573, 1, 0.2745098, 0, 1,
-1.727747, -0.06605189, -1.289814, 1, 0.282353, 0, 1,
-1.672888, 1.59841, -2.144991, 1, 0.2862745, 0, 1,
-1.671793, 0.2670438, -1.102118, 1, 0.2941177, 0, 1,
-1.65567, 1.655863, -0.8407658, 1, 0.3019608, 0, 1,
-1.651341, 1.303934, -0.3707085, 1, 0.3058824, 0, 1,
-1.647887, 0.02278939, -2.474448, 1, 0.3137255, 0, 1,
-1.642655, 1.506482, -1.103068, 1, 0.3176471, 0, 1,
-1.629553, -0.8257449, -0.9174148, 1, 0.3254902, 0, 1,
-1.61717, -0.9089884, -1.730413, 1, 0.3294118, 0, 1,
-1.608606, 1.93337, -0.4956807, 1, 0.3372549, 0, 1,
-1.591133, 1.115118, -0.7400001, 1, 0.3411765, 0, 1,
-1.589825, 0.2215149, -1.175667, 1, 0.3490196, 0, 1,
-1.585731, 0.1636097, -2.246239, 1, 0.3529412, 0, 1,
-1.572236, 0.6934641, -0.9236275, 1, 0.3607843, 0, 1,
-1.567823, 0.7323062, -2.133921, 1, 0.3647059, 0, 1,
-1.566253, -0.3259678, -3.549634, 1, 0.372549, 0, 1,
-1.553471, 1.044824, 0.06763272, 1, 0.3764706, 0, 1,
-1.538914, 0.7539192, -2.210515, 1, 0.3843137, 0, 1,
-1.53709, -1.23319, -1.903936, 1, 0.3882353, 0, 1,
-1.53538, -0.01919512, 0.2102446, 1, 0.3960784, 0, 1,
-1.53052, 0.4124751, -0.973407, 1, 0.4039216, 0, 1,
-1.524515, -0.632905, -1.040795, 1, 0.4078431, 0, 1,
-1.5179, -1.51446, -1.825262, 1, 0.4156863, 0, 1,
-1.510948, -1.588236, -3.32956, 1, 0.4196078, 0, 1,
-1.509519, 0.0548145, -0.9797286, 1, 0.427451, 0, 1,
-1.50593, -0.6793023, -2.137262, 1, 0.4313726, 0, 1,
-1.495259, 0.5361904, -0.9420411, 1, 0.4392157, 0, 1,
-1.484126, 0.4979267, -1.53009, 1, 0.4431373, 0, 1,
-1.482684, -0.05972911, -0.8378959, 1, 0.4509804, 0, 1,
-1.469638, 0.1426103, -3.308843, 1, 0.454902, 0, 1,
-1.464492, 0.139681, -1.760084, 1, 0.4627451, 0, 1,
-1.450827, 0.2048111, -1.381262, 1, 0.4666667, 0, 1,
-1.449478, -1.065091, -1.730791, 1, 0.4745098, 0, 1,
-1.41963, -0.6188191, -1.064609, 1, 0.4784314, 0, 1,
-1.41523, 1.931785, -0.996667, 1, 0.4862745, 0, 1,
-1.413667, 0.117004, -2.506944, 1, 0.4901961, 0, 1,
-1.404328, 1.670136, -0.2610584, 1, 0.4980392, 0, 1,
-1.400046, 0.6813411, -0.1311143, 1, 0.5058824, 0, 1,
-1.394305, -0.2430466, -2.65186, 1, 0.509804, 0, 1,
-1.386039, 0.09887299, -1.677898, 1, 0.5176471, 0, 1,
-1.380959, -1.435649, -3.485656, 1, 0.5215687, 0, 1,
-1.374898, 0.3470923, -1.758985, 1, 0.5294118, 0, 1,
-1.363026, -0.3360033, -2.5831, 1, 0.5333334, 0, 1,
-1.347949, -0.8105474, -1.32034, 1, 0.5411765, 0, 1,
-1.346346, 1.001716, -0.1228812, 1, 0.5450981, 0, 1,
-1.331993, -0.6291386, -2.016728, 1, 0.5529412, 0, 1,
-1.327522, -0.117861, -1.0307, 1, 0.5568628, 0, 1,
-1.32524, 0.574811, -0.4613665, 1, 0.5647059, 0, 1,
-1.320614, -0.2420335, -1.965662, 1, 0.5686275, 0, 1,
-1.312953, -0.2499485, -2.216406, 1, 0.5764706, 0, 1,
-1.309347, -1.426739, -1.552885, 1, 0.5803922, 0, 1,
-1.308937, 0.56037, -1.636476, 1, 0.5882353, 0, 1,
-1.307529, -0.7566903, -0.2817163, 1, 0.5921569, 0, 1,
-1.293562, -0.7553086, -2.602513, 1, 0.6, 0, 1,
-1.287483, -0.00784388, 0.2745447, 1, 0.6078432, 0, 1,
-1.286946, -0.7635407, -2.826882, 1, 0.6117647, 0, 1,
-1.268971, 0.05810591, -3.171978, 1, 0.6196079, 0, 1,
-1.26729, -1.476841, -1.875617, 1, 0.6235294, 0, 1,
-1.256438, 0.5968446, -2.989875, 1, 0.6313726, 0, 1,
-1.256401, -1.725196, -3.264418, 1, 0.6352941, 0, 1,
-1.256197, -1.320567, -2.272733, 1, 0.6431373, 0, 1,
-1.243451, -0.05186342, -2.18381, 1, 0.6470588, 0, 1,
-1.238483, -0.4220499, 0.1120872, 1, 0.654902, 0, 1,
-1.228758, -0.5745085, -1.779476, 1, 0.6588235, 0, 1,
-1.224584, 1.330321, -0.1695732, 1, 0.6666667, 0, 1,
-1.21937, -0.8924843, -1.272437, 1, 0.6705883, 0, 1,
-1.218905, 0.2244215, -1.017057, 1, 0.6784314, 0, 1,
-1.20465, 0.259061, -0.6916385, 1, 0.682353, 0, 1,
-1.204466, 1.454592, -0.9690741, 1, 0.6901961, 0, 1,
-1.20374, -0.4621805, -1.759674, 1, 0.6941177, 0, 1,
-1.203023, 1.239039, -2.068174, 1, 0.7019608, 0, 1,
-1.202451, -1.353869, -3.945192, 1, 0.7098039, 0, 1,
-1.195911, -1.053048, -1.268073, 1, 0.7137255, 0, 1,
-1.19242, 0.9764634, -1.099777, 1, 0.7215686, 0, 1,
-1.191637, 0.0921366, -2.187753, 1, 0.7254902, 0, 1,
-1.183462, -0.02741896, -1.309512, 1, 0.7333333, 0, 1,
-1.181246, 0.8055359, -0.3899583, 1, 0.7372549, 0, 1,
-1.176688, 0.6981704, -2.059806, 1, 0.7450981, 0, 1,
-1.176551, 0.5066029, -0.4901697, 1, 0.7490196, 0, 1,
-1.170757, 1.168548, -0.2713055, 1, 0.7568628, 0, 1,
-1.166625, -0.03678441, -2.055895, 1, 0.7607843, 0, 1,
-1.16532, 1.214279, 2.066754, 1, 0.7686275, 0, 1,
-1.151945, -0.2602654, -2.370581, 1, 0.772549, 0, 1,
-1.145962, -1.015398, -2.212723, 1, 0.7803922, 0, 1,
-1.144074, 0.3895075, -0.586394, 1, 0.7843137, 0, 1,
-1.122222, 1.444763, -1.79696, 1, 0.7921569, 0, 1,
-1.119377, 0.8432542, 0.5239908, 1, 0.7960784, 0, 1,
-1.113778, 0.2321056, -0.8474462, 1, 0.8039216, 0, 1,
-1.097634, -0.2580031, -1.475258, 1, 0.8117647, 0, 1,
-1.095883, -0.2880917, -0.5661942, 1, 0.8156863, 0, 1,
-1.087449, -0.01644306, -3.761606, 1, 0.8235294, 0, 1,
-1.079178, -1.563343, -2.635658, 1, 0.827451, 0, 1,
-1.074147, 1.216598, 1.341828, 1, 0.8352941, 0, 1,
-1.062216, -0.4960482, -3.123408, 1, 0.8392157, 0, 1,
-1.06204, -0.6605523, -2.98116, 1, 0.8470588, 0, 1,
-1.058157, 0.3990478, -0.5723129, 1, 0.8509804, 0, 1,
-1.056306, -1.256366, -2.275521, 1, 0.8588235, 0, 1,
-1.050773, -2.150125, -4.145436, 1, 0.8627451, 0, 1,
-1.050756, -0.9438244, -2.189599, 1, 0.8705882, 0, 1,
-1.043975, -0.1925436, -0.5664334, 1, 0.8745098, 0, 1,
-1.04367, 0.4850757, -0.7562066, 1, 0.8823529, 0, 1,
-1.038794, 1.139938, 0.1236786, 1, 0.8862745, 0, 1,
-1.036931, 0.1096617, -3.235372, 1, 0.8941177, 0, 1,
-1.027494, -1.313824, -2.121633, 1, 0.8980392, 0, 1,
-1.020576, 0.4673022, -1.038455, 1, 0.9058824, 0, 1,
-1.019942, -0.195815, -2.778659, 1, 0.9137255, 0, 1,
-1.016162, 0.7280844, -0.8208371, 1, 0.9176471, 0, 1,
-1.014024, 1.369799, 0.3380269, 1, 0.9254902, 0, 1,
-1.011822, 0.306505, -1.036095, 1, 0.9294118, 0, 1,
-1.011042, 1.309737, -0.4782775, 1, 0.9372549, 0, 1,
-1.009598, 0.1268054, -0.8378168, 1, 0.9411765, 0, 1,
-1.00937, -1.447934, -1.879016, 1, 0.9490196, 0, 1,
-1.004769, 1.006155, 0.2089308, 1, 0.9529412, 0, 1,
-1.004429, -0.1291476, -1.962529, 1, 0.9607843, 0, 1,
-1.000089, 0.5856186, -0.01405784, 1, 0.9647059, 0, 1,
-0.9905774, -0.4958533, -3.326257, 1, 0.972549, 0, 1,
-0.988524, -0.004576534, -1.886025, 1, 0.9764706, 0, 1,
-0.987975, 0.2744499, -1.140284, 1, 0.9843137, 0, 1,
-0.9828899, 0.4409652, -1.274644, 1, 0.9882353, 0, 1,
-0.9816326, -0.4539106, -1.908354, 1, 0.9960784, 0, 1,
-0.9800394, 0.4275981, -1.151548, 0.9960784, 1, 0, 1,
-0.9742426, -0.3990336, -0.5026513, 0.9921569, 1, 0, 1,
-0.9723898, 0.2119792, -1.171873, 0.9843137, 1, 0, 1,
-0.9708695, -0.1646277, -0.5379527, 0.9803922, 1, 0, 1,
-0.9639658, -0.06282786, -1.862332, 0.972549, 1, 0, 1,
-0.9618648, 0.4110305, -1.61794, 0.9686275, 1, 0, 1,
-0.9606951, -1.267815, -2.85087, 0.9607843, 1, 0, 1,
-0.9526879, -0.5527073, -1.462743, 0.9568627, 1, 0, 1,
-0.9447085, -0.00989668, -1.668266, 0.9490196, 1, 0, 1,
-0.9355986, -0.6473059, -3.104908, 0.945098, 1, 0, 1,
-0.9351035, 0.02722165, -3.046859, 0.9372549, 1, 0, 1,
-0.932278, -0.01349158, -0.9443144, 0.9333333, 1, 0, 1,
-0.9205034, 0.4348961, -1.626328, 0.9254902, 1, 0, 1,
-0.9189991, -0.3236264, -2.370095, 0.9215686, 1, 0, 1,
-0.915476, -2.605965, -4.651749, 0.9137255, 1, 0, 1,
-0.9100054, 0.6060177, -1.8051, 0.9098039, 1, 0, 1,
-0.9062639, -0.6834644, -2.417676, 0.9019608, 1, 0, 1,
-0.903762, 1.875779, -2.554771, 0.8941177, 1, 0, 1,
-0.9025599, -0.6108342, -1.744738, 0.8901961, 1, 0, 1,
-0.898738, -0.6447049, -3.609299, 0.8823529, 1, 0, 1,
-0.8983961, 0.9514139, -0.03860916, 0.8784314, 1, 0, 1,
-0.8978215, 0.4193563, -0.2322272, 0.8705882, 1, 0, 1,
-0.8907167, -0.01151408, -2.675714, 0.8666667, 1, 0, 1,
-0.8897681, -1.31372, -2.017152, 0.8588235, 1, 0, 1,
-0.8888474, 0.2058479, -0.4043671, 0.854902, 1, 0, 1,
-0.8862801, 1.33501, 0.2789667, 0.8470588, 1, 0, 1,
-0.8839877, -0.6054319, -3.00477, 0.8431373, 1, 0, 1,
-0.8807881, 1.889776, -2.32612, 0.8352941, 1, 0, 1,
-0.8698038, 0.7768879, 0.9996667, 0.8313726, 1, 0, 1,
-0.8679407, 1.68235, 0.1577054, 0.8235294, 1, 0, 1,
-0.8620122, -0.9160918, -1.786733, 0.8196079, 1, 0, 1,
-0.8595148, -0.01808248, -0.6645701, 0.8117647, 1, 0, 1,
-0.8575904, -0.2897047, -2.126265, 0.8078431, 1, 0, 1,
-0.8494568, -0.5854248, -3.45513, 0.8, 1, 0, 1,
-0.8449309, 0.3541767, 0.4373654, 0.7921569, 1, 0, 1,
-0.8423087, -0.1309268, -2.630653, 0.7882353, 1, 0, 1,
-0.8395768, -2.734469, -3.317383, 0.7803922, 1, 0, 1,
-0.8344281, -0.5133076, -2.889908, 0.7764706, 1, 0, 1,
-0.8303041, 1.349316, -1.070529, 0.7686275, 1, 0, 1,
-0.8237673, 0.9839944, 0.4485362, 0.7647059, 1, 0, 1,
-0.823141, -0.5119734, -3.894736, 0.7568628, 1, 0, 1,
-0.8223909, -0.3528147, -1.974426, 0.7529412, 1, 0, 1,
-0.8181534, -0.1771144, -1.294259, 0.7450981, 1, 0, 1,
-0.817688, 0.556484, -3.015603, 0.7411765, 1, 0, 1,
-0.8139268, 1.374067, -0.281287, 0.7333333, 1, 0, 1,
-0.8068857, -1.08808, -2.753206, 0.7294118, 1, 0, 1,
-0.8048792, -0.3067741, -2.726357, 0.7215686, 1, 0, 1,
-0.8007697, 0.3987187, -2.083738, 0.7176471, 1, 0, 1,
-0.7983623, 0.5409057, -1.593283, 0.7098039, 1, 0, 1,
-0.7880808, -0.4382067, -4.055955, 0.7058824, 1, 0, 1,
-0.7856672, -1.037407, -2.168157, 0.6980392, 1, 0, 1,
-0.7604932, -0.2901695, -2.168176, 0.6901961, 1, 0, 1,
-0.7547719, -0.06865519, -1.589047, 0.6862745, 1, 0, 1,
-0.7506842, -0.3799606, -2.039792, 0.6784314, 1, 0, 1,
-0.7491135, 1.590886, -0.593703, 0.6745098, 1, 0, 1,
-0.7467133, 1.113441, -0.09785089, 0.6666667, 1, 0, 1,
-0.7456351, 1.813921, -0.2625441, 0.6627451, 1, 0, 1,
-0.7437505, 1.104749, -1.581942, 0.654902, 1, 0, 1,
-0.7429968, -0.9897989, -0.632045, 0.6509804, 1, 0, 1,
-0.7423872, -2.127752, -2.430061, 0.6431373, 1, 0, 1,
-0.7334173, 0.1811974, -1.640277, 0.6392157, 1, 0, 1,
-0.7326722, -0.5779457, -2.85696, 0.6313726, 1, 0, 1,
-0.7295842, 0.4414766, 0.112098, 0.627451, 1, 0, 1,
-0.7289358, -0.7575288, -1.994723, 0.6196079, 1, 0, 1,
-0.7230724, 0.6410741, -0.3197712, 0.6156863, 1, 0, 1,
-0.7215055, -0.80556, -2.955277, 0.6078432, 1, 0, 1,
-0.7123485, 0.07782328, -1.630958, 0.6039216, 1, 0, 1,
-0.7114007, 2.141051, -0.06604867, 0.5960785, 1, 0, 1,
-0.7094645, 1.66338, -2.066034, 0.5882353, 1, 0, 1,
-0.7092733, 0.2672665, -1.100196, 0.5843138, 1, 0, 1,
-0.7092636, 0.5324994, -2.489433, 0.5764706, 1, 0, 1,
-0.7072303, 0.6980016, 0.1500565, 0.572549, 1, 0, 1,
-0.7071058, 0.285544, -2.393465, 0.5647059, 1, 0, 1,
-0.7070575, 1.164464, 1.108595, 0.5607843, 1, 0, 1,
-0.7018417, -0.05328809, -1.323509, 0.5529412, 1, 0, 1,
-0.6955841, -0.2267344, -1.65637, 0.5490196, 1, 0, 1,
-0.6917317, 0.7739233, -1.860627, 0.5411765, 1, 0, 1,
-0.6878155, 1.626076, -0.9278094, 0.5372549, 1, 0, 1,
-0.6853679, -0.2423787, -1.249314, 0.5294118, 1, 0, 1,
-0.6827611, 0.7690923, -1.179617, 0.5254902, 1, 0, 1,
-0.6826653, 1.338981, -1.139313, 0.5176471, 1, 0, 1,
-0.6794607, -1.008193, -2.700659, 0.5137255, 1, 0, 1,
-0.6784987, 0.404758, -0.4414507, 0.5058824, 1, 0, 1,
-0.6699658, -0.1638353, -0.2166704, 0.5019608, 1, 0, 1,
-0.6674504, 1.057284, -1.719878, 0.4941176, 1, 0, 1,
-0.6665143, 0.3978345, -0.4984713, 0.4862745, 1, 0, 1,
-0.6663889, -0.4012868, -1.431353, 0.4823529, 1, 0, 1,
-0.6626474, -0.5119871, -3.667469, 0.4745098, 1, 0, 1,
-0.6606576, -0.8548213, -2.155013, 0.4705882, 1, 0, 1,
-0.6595796, 1.736086, 0.3902899, 0.4627451, 1, 0, 1,
-0.6565049, -0.1775963, -1.426279, 0.4588235, 1, 0, 1,
-0.6506677, 0.05996864, -2.215219, 0.4509804, 1, 0, 1,
-0.6502315, -0.0650451, -2.016124, 0.4470588, 1, 0, 1,
-0.6487539, 0.2389902, -0.5685585, 0.4392157, 1, 0, 1,
-0.6457984, 0.864978, -1.482072, 0.4352941, 1, 0, 1,
-0.6456396, 1.210824, -3.286494, 0.427451, 1, 0, 1,
-0.6404791, 1.319758, -1.00497, 0.4235294, 1, 0, 1,
-0.6335514, -1.51051, -2.416757, 0.4156863, 1, 0, 1,
-0.6332008, -1.079075, -1.672033, 0.4117647, 1, 0, 1,
-0.6195997, 0.8332059, 0.2412612, 0.4039216, 1, 0, 1,
-0.6174161, -0.7056433, -3.341779, 0.3960784, 1, 0, 1,
-0.6109408, -0.6807464, -2.194077, 0.3921569, 1, 0, 1,
-0.6104132, -0.1829141, -2.312486, 0.3843137, 1, 0, 1,
-0.6089861, 0.2195943, -1.150054, 0.3803922, 1, 0, 1,
-0.6076161, -0.7351069, -4.348348, 0.372549, 1, 0, 1,
-0.6062828, -1.283539, -1.542455, 0.3686275, 1, 0, 1,
-0.6049668, 1.248605, -0.7416871, 0.3607843, 1, 0, 1,
-0.6029541, -0.809074, -2.589284, 0.3568628, 1, 0, 1,
-0.6001984, -0.5159668, -2.334643, 0.3490196, 1, 0, 1,
-0.5987806, 1.038716, 0.1382409, 0.345098, 1, 0, 1,
-0.5908244, 0.3726172, -2.175452, 0.3372549, 1, 0, 1,
-0.585219, -0.8879322, -1.192737, 0.3333333, 1, 0, 1,
-0.5735705, -0.1078636, -2.330452, 0.3254902, 1, 0, 1,
-0.5735285, 0.8975472, 0.0452945, 0.3215686, 1, 0, 1,
-0.5567809, -0.5870094, -2.317888, 0.3137255, 1, 0, 1,
-0.5540906, 3.178951, -1.692577, 0.3098039, 1, 0, 1,
-0.5521805, -0.3824581, 0.1681759, 0.3019608, 1, 0, 1,
-0.5440269, -0.7163448, -3.27933, 0.2941177, 1, 0, 1,
-0.5420237, -0.6236084, -2.975547, 0.2901961, 1, 0, 1,
-0.5406934, -0.1175263, -2.794865, 0.282353, 1, 0, 1,
-0.5265009, -2.813282, -3.040663, 0.2784314, 1, 0, 1,
-0.522699, 0.003364239, -3.253608, 0.2705882, 1, 0, 1,
-0.5214226, -1.335027, -2.77961, 0.2666667, 1, 0, 1,
-0.5208138, 1.558029, 0.4068625, 0.2588235, 1, 0, 1,
-0.5191706, -1.470192, -3.314352, 0.254902, 1, 0, 1,
-0.5180668, 0.938648, -1.166661, 0.2470588, 1, 0, 1,
-0.5170493, -1.9135, -1.753373, 0.2431373, 1, 0, 1,
-0.5125626, 1.093312, -0.1165951, 0.2352941, 1, 0, 1,
-0.5055848, -0.965141, -1.499462, 0.2313726, 1, 0, 1,
-0.5028923, 0.9746124, -0.1679035, 0.2235294, 1, 0, 1,
-0.5025395, 0.9801475, -1.226358, 0.2196078, 1, 0, 1,
-0.5007461, -1.824318, -2.877602, 0.2117647, 1, 0, 1,
-0.4956782, -0.422923, -3.741905, 0.2078431, 1, 0, 1,
-0.4947716, -0.3865397, -1.589228, 0.2, 1, 0, 1,
-0.4863445, 0.8432621, 0.9562755, 0.1921569, 1, 0, 1,
-0.4831575, -1.408674, -2.700228, 0.1882353, 1, 0, 1,
-0.4813534, -0.6314426, -1.717302, 0.1803922, 1, 0, 1,
-0.4809861, 0.04196865, -1.804601, 0.1764706, 1, 0, 1,
-0.4795836, -2.82185, -2.319389, 0.1686275, 1, 0, 1,
-0.47396, 1.618468, -0.2706681, 0.1647059, 1, 0, 1,
-0.4730383, 0.1292826, -0.7508754, 0.1568628, 1, 0, 1,
-0.4719072, 0.8872284, -0.2316905, 0.1529412, 1, 0, 1,
-0.4716567, -0.1711101, -3.140348, 0.145098, 1, 0, 1,
-0.4652128, -1.190589, -2.465938, 0.1411765, 1, 0, 1,
-0.4624221, 1.88572, 1.68637, 0.1333333, 1, 0, 1,
-0.4615598, -0.5976003, -2.537627, 0.1294118, 1, 0, 1,
-0.4610974, 1.312575, 0.06319765, 0.1215686, 1, 0, 1,
-0.4594604, -0.5775296, -0.5361658, 0.1176471, 1, 0, 1,
-0.4507631, 1.753362, -1.795441, 0.1098039, 1, 0, 1,
-0.4493488, -1.464683, -2.408814, 0.1058824, 1, 0, 1,
-0.4436021, -0.5599847, -2.223943, 0.09803922, 1, 0, 1,
-0.4428786, 2.581382, 0.9559799, 0.09019608, 1, 0, 1,
-0.4383366, -0.5345407, -2.860328, 0.08627451, 1, 0, 1,
-0.4382188, -0.747256, -3.716603, 0.07843138, 1, 0, 1,
-0.4376249, -0.7385135, -4.195183, 0.07450981, 1, 0, 1,
-0.4361612, -0.4360087, -2.658919, 0.06666667, 1, 0, 1,
-0.4342001, 1.277601, -1.04924, 0.0627451, 1, 0, 1,
-0.4324053, 0.08120891, -2.427783, 0.05490196, 1, 0, 1,
-0.4304739, -1.216298, -4.1511, 0.05098039, 1, 0, 1,
-0.430178, -0.334232, -3.235048, 0.04313726, 1, 0, 1,
-0.4270771, -3.190114, -3.103486, 0.03921569, 1, 0, 1,
-0.4247259, -0.3705338, -0.7118696, 0.03137255, 1, 0, 1,
-0.4198098, 0.4272592, -0.1559249, 0.02745098, 1, 0, 1,
-0.4189774, -0.5281336, -2.567039, 0.01960784, 1, 0, 1,
-0.4139864, 0.8381843, -1.424893, 0.01568628, 1, 0, 1,
-0.4130734, -0.8855197, -0.6806362, 0.007843138, 1, 0, 1,
-0.4024198, 0.1752614, -0.3806146, 0.003921569, 1, 0, 1,
-0.4023556, 0.3982204, -0.5457299, 0, 1, 0.003921569, 1,
-0.401901, -1.018291, -3.740967, 0, 1, 0.01176471, 1,
-0.3982919, 0.08122733, -1.027646, 0, 1, 0.01568628, 1,
-0.3965448, -0.05189978, -1.877221, 0, 1, 0.02352941, 1,
-0.3878087, 0.3874511, -0.5247034, 0, 1, 0.02745098, 1,
-0.381862, 2.480529, -0.3090344, 0, 1, 0.03529412, 1,
-0.377524, -0.4564425, -3.79488, 0, 1, 0.03921569, 1,
-0.3762082, -1.174569, -4.22342, 0, 1, 0.04705882, 1,
-0.3723818, -0.4078653, -1.662043, 0, 1, 0.05098039, 1,
-0.3681491, -0.1031436, -0.9635481, 0, 1, 0.05882353, 1,
-0.3595085, -0.8140208, -0.9425287, 0, 1, 0.0627451, 1,
-0.3581924, -0.4429333, -2.821693, 0, 1, 0.07058824, 1,
-0.3513443, 0.2355554, -0.8525797, 0, 1, 0.07450981, 1,
-0.3502561, -1.235597, -3.233333, 0, 1, 0.08235294, 1,
-0.3496781, -1.704438, -3.132365, 0, 1, 0.08627451, 1,
-0.3488564, 0.4015463, -1.469769, 0, 1, 0.09411765, 1,
-0.3456531, -1.478277, -3.343822, 0, 1, 0.1019608, 1,
-0.3454112, -1.792325, -2.568246, 0, 1, 0.1058824, 1,
-0.3447517, 1.075681, -1.86598, 0, 1, 0.1137255, 1,
-0.3435348, -0.4310171, -1.639578, 0, 1, 0.1176471, 1,
-0.342502, 1.901763, -1.834022, 0, 1, 0.1254902, 1,
-0.340176, -0.7416859, -3.052348, 0, 1, 0.1294118, 1,
-0.3330937, -0.2583353, -1.803138, 0, 1, 0.1372549, 1,
-0.3307815, -0.4674613, -3.118802, 0, 1, 0.1411765, 1,
-0.3267383, 0.6574934, 1.40457, 0, 1, 0.1490196, 1,
-0.3263414, -0.2485246, -3.122292, 0, 1, 0.1529412, 1,
-0.3250018, -0.8095098, -4.01783, 0, 1, 0.1607843, 1,
-0.3234821, 0.5922666, -0.1090102, 0, 1, 0.1647059, 1,
-0.3223702, -0.2435484, -3.287454, 0, 1, 0.172549, 1,
-0.3221432, 1.00525, -3.106831, 0, 1, 0.1764706, 1,
-0.3158312, 1.254825, 0.785751, 0, 1, 0.1843137, 1,
-0.3149429, -0.4866091, -3.564039, 0, 1, 0.1882353, 1,
-0.3124628, -0.3022179, -0.9775143, 0, 1, 0.1960784, 1,
-0.3075781, -0.7716027, -1.861313, 0, 1, 0.2039216, 1,
-0.3060158, 0.375681, -1.541317, 0, 1, 0.2078431, 1,
-0.3036084, -0.1097111, -3.370007, 0, 1, 0.2156863, 1,
-0.3022472, -0.6535301, -3.778243, 0, 1, 0.2196078, 1,
-0.2980055, 1.470665, -0.829546, 0, 1, 0.227451, 1,
-0.2964015, 1.752375, 0.09538042, 0, 1, 0.2313726, 1,
-0.2951391, -1.099998, -3.088481, 0, 1, 0.2392157, 1,
-0.294302, 1.907277, -0.576969, 0, 1, 0.2431373, 1,
-0.292607, 0.06597459, -1.008206, 0, 1, 0.2509804, 1,
-0.2898408, -0.3777007, -1.917998, 0, 1, 0.254902, 1,
-0.2836699, -0.09608831, -0.17817, 0, 1, 0.2627451, 1,
-0.2824913, 0.2898276, -1.264957, 0, 1, 0.2666667, 1,
-0.2818806, 0.01938928, 0.5884664, 0, 1, 0.2745098, 1,
-0.28138, 0.2923338, 0.8532073, 0, 1, 0.2784314, 1,
-0.274422, 0.9356921, 0.008890694, 0, 1, 0.2862745, 1,
-0.2718613, 1.535681, 0.1950233, 0, 1, 0.2901961, 1,
-0.2717043, -0.5663905, -2.339611, 0, 1, 0.2980392, 1,
-0.2583582, 0.8009802, -0.6060312, 0, 1, 0.3058824, 1,
-0.2563579, 0.4451032, -2.115009, 0, 1, 0.3098039, 1,
-0.2509164, 0.1454427, -1.017254, 0, 1, 0.3176471, 1,
-0.248445, 0.7087893, 0.5095787, 0, 1, 0.3215686, 1,
-0.247794, 0.8577048, 0.001613516, 0, 1, 0.3294118, 1,
-0.2466872, -0.2556643, -1.535924, 0, 1, 0.3333333, 1,
-0.2459399, -0.2470882, -0.7022641, 0, 1, 0.3411765, 1,
-0.2458357, -0.170331, -1.034901, 0, 1, 0.345098, 1,
-0.2442674, -1.13014, -4.216466, 0, 1, 0.3529412, 1,
-0.2405912, -0.9068015, -1.981315, 0, 1, 0.3568628, 1,
-0.2364632, 2.231805, 0.7436838, 0, 1, 0.3647059, 1,
-0.2359022, 0.5058905, 0.3836462, 0, 1, 0.3686275, 1,
-0.2350213, 0.7242072, -1.385312, 0, 1, 0.3764706, 1,
-0.2344068, -1.387952, -2.620276, 0, 1, 0.3803922, 1,
-0.2339895, 2.03974, -0.8805035, 0, 1, 0.3882353, 1,
-0.2337047, 1.135746, -1.34263, 0, 1, 0.3921569, 1,
-0.2323918, 1.759696, 1.425787, 0, 1, 0.4, 1,
-0.2318203, 0.1019296, -1.222547, 0, 1, 0.4078431, 1,
-0.2290693, 2.425487, 1.088066, 0, 1, 0.4117647, 1,
-0.226536, 0.2808475, -0.6302196, 0, 1, 0.4196078, 1,
-0.2247974, 0.3191621, -0.8398326, 0, 1, 0.4235294, 1,
-0.2246912, -0.3632019, -1.30451, 0, 1, 0.4313726, 1,
-0.2227908, 0.3435666, 0.9897313, 0, 1, 0.4352941, 1,
-0.2175425, 0.2523147, -0.006775046, 0, 1, 0.4431373, 1,
-0.2069275, 1.08887, 0.2848824, 0, 1, 0.4470588, 1,
-0.1954932, 0.05893833, -2.607121, 0, 1, 0.454902, 1,
-0.1910345, 1.265425, -1.069937, 0, 1, 0.4588235, 1,
-0.1877035, -1.935025, -0.9878756, 0, 1, 0.4666667, 1,
-0.1863019, 0.1174005, -1.640465, 0, 1, 0.4705882, 1,
-0.1846314, 0.9135215, 1.086707, 0, 1, 0.4784314, 1,
-0.1818355, 0.8708316, -1.802856, 0, 1, 0.4823529, 1,
-0.1800695, 0.1538013, -1.693063, 0, 1, 0.4901961, 1,
-0.1783342, 1.024204, -0.5225139, 0, 1, 0.4941176, 1,
-0.1767512, 0.835541, -0.4686925, 0, 1, 0.5019608, 1,
-0.17576, -0.5955128, -2.142615, 0, 1, 0.509804, 1,
-0.1754699, 1.324119, -0.4107637, 0, 1, 0.5137255, 1,
-0.1726268, 0.9972648, 2.307451, 0, 1, 0.5215687, 1,
-0.1725471, -1.616639, -2.68712, 0, 1, 0.5254902, 1,
-0.1713253, -0.339287, -2.015941, 0, 1, 0.5333334, 1,
-0.1697867, 0.3034012, 0.4513706, 0, 1, 0.5372549, 1,
-0.1674931, 0.1015788, 0.02523992, 0, 1, 0.5450981, 1,
-0.1668497, 0.4594192, -0.950226, 0, 1, 0.5490196, 1,
-0.1635951, 0.7192466, -0.5212165, 0, 1, 0.5568628, 1,
-0.1601235, -1.73457, -3.655685, 0, 1, 0.5607843, 1,
-0.1559677, 0.2418272, 0.4515786, 0, 1, 0.5686275, 1,
-0.1545381, -0.09737054, -3.104184, 0, 1, 0.572549, 1,
-0.1523335, 0.4322333, 0.1167936, 0, 1, 0.5803922, 1,
-0.1511343, 1.082386, 0.0614713, 0, 1, 0.5843138, 1,
-0.1432188, -0.1021863, -1.983336, 0, 1, 0.5921569, 1,
-0.1413872, -0.7833768, -2.272405, 0, 1, 0.5960785, 1,
-0.1392718, 0.6425363, -0.3421947, 0, 1, 0.6039216, 1,
-0.1369997, 0.0699316, -2.112953, 0, 1, 0.6117647, 1,
-0.135624, 0.09302076, -0.7863109, 0, 1, 0.6156863, 1,
-0.1346388, 1.126204, -0.8224987, 0, 1, 0.6235294, 1,
-0.1336677, 0.4092421, -0.4427913, 0, 1, 0.627451, 1,
-0.127716, 0.9491084, -1.571997, 0, 1, 0.6352941, 1,
-0.1273577, 1.964481, 0.04732042, 0, 1, 0.6392157, 1,
-0.1271846, -0.8227955, -4.434917, 0, 1, 0.6470588, 1,
-0.1254171, 0.5567216, -0.2590788, 0, 1, 0.6509804, 1,
-0.1226244, -2.167477, -4.899797, 0, 1, 0.6588235, 1,
-0.1225461, 0.04947389, -1.225079, 0, 1, 0.6627451, 1,
-0.1197524, -0.3412023, -2.825115, 0, 1, 0.6705883, 1,
-0.1148128, -0.2232071, -3.005151, 0, 1, 0.6745098, 1,
-0.114637, -1.256823, -4.205789, 0, 1, 0.682353, 1,
-0.1108751, -0.5083124, -1.596557, 0, 1, 0.6862745, 1,
-0.1090157, -0.09697011, -3.938514, 0, 1, 0.6941177, 1,
-0.1082876, 0.7592372, 1.114883, 0, 1, 0.7019608, 1,
-0.1060911, -0.482668, -2.702127, 0, 1, 0.7058824, 1,
-0.1051032, -1.159381, -3.347406, 0, 1, 0.7137255, 1,
-0.1034286, 0.06733428, -1.152969, 0, 1, 0.7176471, 1,
-0.1001223, 1.180537, -0.7407489, 0, 1, 0.7254902, 1,
-0.09433248, -0.4821417, -2.044139, 0, 1, 0.7294118, 1,
-0.09095653, 0.1217084, -0.1378568, 0, 1, 0.7372549, 1,
-0.08771536, 0.2794825, -0.8234524, 0, 1, 0.7411765, 1,
-0.0844038, -0.4598901, -3.632435, 0, 1, 0.7490196, 1,
-0.08433348, 0.8844724, 0.3786499, 0, 1, 0.7529412, 1,
-0.08250879, -0.345388, -3.921731, 0, 1, 0.7607843, 1,
-0.07923681, 2.092132, 1.073086, 0, 1, 0.7647059, 1,
-0.07530227, -0.824203, -0.5285628, 0, 1, 0.772549, 1,
-0.07363849, 0.5594175, -1.405024, 0, 1, 0.7764706, 1,
-0.07065558, 0.5421634, -1.5554, 0, 1, 0.7843137, 1,
-0.06658571, 2.007487, -0.7903462, 0, 1, 0.7882353, 1,
-0.06359941, 0.4513832, -1.497104, 0, 1, 0.7960784, 1,
-0.06055601, -1.727414, -2.102807, 0, 1, 0.8039216, 1,
-0.05782301, 0.08419663, -1.340663, 0, 1, 0.8078431, 1,
-0.05418189, 1.630759, -1.109436, 0, 1, 0.8156863, 1,
-0.05388724, 1.555583, 0.3451569, 0, 1, 0.8196079, 1,
-0.05349639, -1.476928, -3.641837, 0, 1, 0.827451, 1,
-0.05151791, -0.8621785, -1.635476, 0, 1, 0.8313726, 1,
-0.04674639, -0.2195137, -3.821412, 0, 1, 0.8392157, 1,
-0.04672042, 0.1629879, -0.8096225, 0, 1, 0.8431373, 1,
-0.04415495, 1.009506, 0.03590187, 0, 1, 0.8509804, 1,
-0.04217039, 0.196522, 0.2207532, 0, 1, 0.854902, 1,
-0.04208875, -2.057909, -3.026281, 0, 1, 0.8627451, 1,
-0.04150692, 0.8620597, 0.4999172, 0, 1, 0.8666667, 1,
-0.03594618, 1.412069, 0.9788015, 0, 1, 0.8745098, 1,
-0.02934495, 1.39867, 2.26479, 0, 1, 0.8784314, 1,
-0.02779445, 1.421437, -0.08000826, 0, 1, 0.8862745, 1,
-0.02089847, -0.3906219, -2.3664, 0, 1, 0.8901961, 1,
-0.01504349, -1.011505, -2.80819, 0, 1, 0.8980392, 1,
-0.01215315, -1.302374, -2.810259, 0, 1, 0.9058824, 1,
-0.01212837, -0.8497677, -2.951715, 0, 1, 0.9098039, 1,
-0.01171839, -0.3094288, -3.037733, 0, 1, 0.9176471, 1,
-0.004925179, -0.5551058, -4.459038, 0, 1, 0.9215686, 1,
-0.0001387069, -0.03374029, -3.403274, 0, 1, 0.9294118, 1,
0.001792365, -0.4421053, 2.163056, 0, 1, 0.9333333, 1,
0.003783237, -0.5782527, 2.95468, 0, 1, 0.9411765, 1,
0.003841022, 0.9021513, -0.5040299, 0, 1, 0.945098, 1,
0.004746825, 0.1780108, 0.5612732, 0, 1, 0.9529412, 1,
0.008168375, -0.3191121, 3.467603, 0, 1, 0.9568627, 1,
0.008574815, -0.92553, 3.097651, 0, 1, 0.9647059, 1,
0.008610252, 0.03572156, -1.451639, 0, 1, 0.9686275, 1,
0.009496244, -1.956353, 4.283852, 0, 1, 0.9764706, 1,
0.01222183, -0.1388627, 2.705417, 0, 1, 0.9803922, 1,
0.0171601, 0.03048353, 0.4471291, 0, 1, 0.9882353, 1,
0.0180087, 0.1739269, -0.9981315, 0, 1, 0.9921569, 1,
0.02205417, 1.920166, 1.117455, 0, 1, 1, 1,
0.02334165, -1.191781, 4.015551, 0, 0.9921569, 1, 1,
0.02881907, 0.5428174, 0.4954436, 0, 0.9882353, 1, 1,
0.02890693, -0.9199713, 4.194395, 0, 0.9803922, 1, 1,
0.02984552, -0.4428682, 1.107037, 0, 0.9764706, 1, 1,
0.03073825, -0.8051674, 4.681489, 0, 0.9686275, 1, 1,
0.03698724, 0.3087234, 0.2441232, 0, 0.9647059, 1, 1,
0.03721968, -1.761857, 3.799379, 0, 0.9568627, 1, 1,
0.04020698, 0.4733643, -0.7703102, 0, 0.9529412, 1, 1,
0.04280835, -0.6940618, 2.324451, 0, 0.945098, 1, 1,
0.04344824, -0.2035888, 2.71903, 0, 0.9411765, 1, 1,
0.04554399, 0.5507259, -0.9850919, 0, 0.9333333, 1, 1,
0.04804035, -0.7719755, 3.420665, 0, 0.9294118, 1, 1,
0.04948173, -1.129291, 2.929895, 0, 0.9215686, 1, 1,
0.05048846, -0.1242977, 3.608152, 0, 0.9176471, 1, 1,
0.05156781, 0.7053112, -0.6672953, 0, 0.9098039, 1, 1,
0.05169654, -0.1564932, 3.469017, 0, 0.9058824, 1, 1,
0.05221077, 1.02869, 0.1531409, 0, 0.8980392, 1, 1,
0.05720029, 0.9104153, -0.5721141, 0, 0.8901961, 1, 1,
0.05999422, 0.1428387, 1.877433, 0, 0.8862745, 1, 1,
0.06449544, 0.5425256, -0.7786971, 0, 0.8784314, 1, 1,
0.06794565, -0.9920833, 2.06909, 0, 0.8745098, 1, 1,
0.06968627, -0.3555933, 3.945272, 0, 0.8666667, 1, 1,
0.07199731, 1.169549, -0.9271057, 0, 0.8627451, 1, 1,
0.07318231, -0.06727453, 1.967261, 0, 0.854902, 1, 1,
0.07469045, 1.122131, 0.6240177, 0, 0.8509804, 1, 1,
0.0791848, -0.00687623, 0.08135591, 0, 0.8431373, 1, 1,
0.08021235, 0.6952116, 0.7124462, 0, 0.8392157, 1, 1,
0.08121363, 0.3649169, -0.745581, 0, 0.8313726, 1, 1,
0.08334539, 0.1729123, -0.1875757, 0, 0.827451, 1, 1,
0.08800934, 0.8154706, -0.2700387, 0, 0.8196079, 1, 1,
0.08942578, -0.4604017, 2.314596, 0, 0.8156863, 1, 1,
0.08989526, -0.9106186, 2.84408, 0, 0.8078431, 1, 1,
0.09837041, 0.0476273, 0.5524704, 0, 0.8039216, 1, 1,
0.1014821, -0.8344226, 1.44215, 0, 0.7960784, 1, 1,
0.1048557, 0.5592321, 0.6069657, 0, 0.7882353, 1, 1,
0.1098258, -0.8835433, 2.42994, 0, 0.7843137, 1, 1,
0.1133027, 0.6742292, 1.463816, 0, 0.7764706, 1, 1,
0.1165697, -0.858788, 2.185287, 0, 0.772549, 1, 1,
0.1171941, 0.4753462, -0.04868222, 0, 0.7647059, 1, 1,
0.1195602, -0.9312343, 4.34358, 0, 0.7607843, 1, 1,
0.1201145, -0.0631648, 0.8365433, 0, 0.7529412, 1, 1,
0.1294848, -1.455762, 0.9565908, 0, 0.7490196, 1, 1,
0.136886, 0.6734838, 0.1521584, 0, 0.7411765, 1, 1,
0.1408065, -0.90659, 2.09867, 0, 0.7372549, 1, 1,
0.1421291, 0.1988015, 1.849157, 0, 0.7294118, 1, 1,
0.1429228, -0.5740338, 3.484233, 0, 0.7254902, 1, 1,
0.1429666, 1.772513, 0.5923091, 0, 0.7176471, 1, 1,
0.1476564, 0.1621977, 1.942612, 0, 0.7137255, 1, 1,
0.1527988, 0.8484387, 1.911742, 0, 0.7058824, 1, 1,
0.1548516, -1.00546, 1.546261, 0, 0.6980392, 1, 1,
0.155621, -0.1438518, 3.096126, 0, 0.6941177, 1, 1,
0.1559939, 0.7676151, 0.01063913, 0, 0.6862745, 1, 1,
0.1600924, -0.3518051, 4.383786, 0, 0.682353, 1, 1,
0.1658627, 0.8201479, 0.08326161, 0, 0.6745098, 1, 1,
0.1666605, -1.629593, 3.028528, 0, 0.6705883, 1, 1,
0.1681649, 1.004356, -2.22329, 0, 0.6627451, 1, 1,
0.1702652, -0.4136247, 1.764554, 0, 0.6588235, 1, 1,
0.1747477, -0.2485878, 2.865109, 0, 0.6509804, 1, 1,
0.1764841, -1.761522, 5.034795, 0, 0.6470588, 1, 1,
0.1767262, -1.359256, 4.286633, 0, 0.6392157, 1, 1,
0.177109, -0.5571634, 2.263149, 0, 0.6352941, 1, 1,
0.1774356, 0.2249507, 0.9410818, 0, 0.627451, 1, 1,
0.1778816, 0.441304, 0.04105127, 0, 0.6235294, 1, 1,
0.1820382, -0.07129478, 3.866195, 0, 0.6156863, 1, 1,
0.1838013, 0.5402508, -0.04114473, 0, 0.6117647, 1, 1,
0.19244, -0.3569206, 3.787352, 0, 0.6039216, 1, 1,
0.1936477, 0.7173754, 0.128236, 0, 0.5960785, 1, 1,
0.1962762, -0.7291195, 2.205281, 0, 0.5921569, 1, 1,
0.2015026, -0.1631944, 1.62546, 0, 0.5843138, 1, 1,
0.2174159, 1.61684, 0.8640838, 0, 0.5803922, 1, 1,
0.2190431, -0.244427, 5.336645, 0, 0.572549, 1, 1,
0.2195808, -1.587748, 3.161566, 0, 0.5686275, 1, 1,
0.2215402, -0.1141974, 2.477112, 0, 0.5607843, 1, 1,
0.226241, 0.1972868, 0.5458736, 0, 0.5568628, 1, 1,
0.226716, 0.009456985, 1.149682, 0, 0.5490196, 1, 1,
0.2273352, -0.6786539, 2.983371, 0, 0.5450981, 1, 1,
0.2305561, -2.153861, 4.939337, 0, 0.5372549, 1, 1,
0.2311689, 0.008722193, 2.019987, 0, 0.5333334, 1, 1,
0.2318234, 1.160162, 0.2296965, 0, 0.5254902, 1, 1,
0.2319078, 0.3410408, 0.2424484, 0, 0.5215687, 1, 1,
0.2319169, 1.470949, 1.869325, 0, 0.5137255, 1, 1,
0.2322061, 0.7828565, 0.6374425, 0, 0.509804, 1, 1,
0.2344459, -1.534696, 3.790277, 0, 0.5019608, 1, 1,
0.2363393, -2.000876, 4.194094, 0, 0.4941176, 1, 1,
0.2397173, 0.7329575, 1.489082, 0, 0.4901961, 1, 1,
0.2463085, -1.531863, 2.341398, 0, 0.4823529, 1, 1,
0.2474626, -1.913429, 2.598339, 0, 0.4784314, 1, 1,
0.2528583, -1.230909, 2.839818, 0, 0.4705882, 1, 1,
0.2601505, 1.416703, 0.9737511, 0, 0.4666667, 1, 1,
0.2633801, -0.2725611, 1.686769, 0, 0.4588235, 1, 1,
0.267009, -0.8136297, 2.024744, 0, 0.454902, 1, 1,
0.2676095, 0.367979, 2.863308, 0, 0.4470588, 1, 1,
0.2696479, -1.82087, 4.934974, 0, 0.4431373, 1, 1,
0.2709023, 0.7707583, 0.563543, 0, 0.4352941, 1, 1,
0.2717778, -0.5248383, 2.773274, 0, 0.4313726, 1, 1,
0.2730989, 0.5565497, 1.400233, 0, 0.4235294, 1, 1,
0.2740918, -0.8057989, 2.382981, 0, 0.4196078, 1, 1,
0.2763174, -0.6982816, 2.072313, 0, 0.4117647, 1, 1,
0.2775217, -1.543786, 4.717782, 0, 0.4078431, 1, 1,
0.281721, -0.163279, 0.454226, 0, 0.4, 1, 1,
0.2817625, 0.9547295, -0.2021127, 0, 0.3921569, 1, 1,
0.2836879, 0.1975793, -0.03989108, 0, 0.3882353, 1, 1,
0.2860008, -0.8665306, 3.488577, 0, 0.3803922, 1, 1,
0.2867652, 1.493336, 0.1356749, 0, 0.3764706, 1, 1,
0.2884857, -1.746238, 3.084988, 0, 0.3686275, 1, 1,
0.2946723, -1.042755, 3.088097, 0, 0.3647059, 1, 1,
0.2972975, 0.2557022, -1.083545, 0, 0.3568628, 1, 1,
0.299496, 0.149043, 2.05064, 0, 0.3529412, 1, 1,
0.3000908, -0.2172048, 1.298836, 0, 0.345098, 1, 1,
0.3052191, 0.2428473, 0.1912902, 0, 0.3411765, 1, 1,
0.3052649, 0.5559667, -0.03666052, 0, 0.3333333, 1, 1,
0.3062581, 1.160963, 0.100222, 0, 0.3294118, 1, 1,
0.3085169, -1.971979, 1.279189, 0, 0.3215686, 1, 1,
0.3085551, 1.301449, 0.2677642, 0, 0.3176471, 1, 1,
0.3104392, -0.6380444, 3.070973, 0, 0.3098039, 1, 1,
0.3110438, -0.9577229, 4.569987, 0, 0.3058824, 1, 1,
0.3121094, -0.6487564, 4.080531, 0, 0.2980392, 1, 1,
0.3134901, 0.3383053, 0.252586, 0, 0.2901961, 1, 1,
0.3153287, -0.489283, 1.835419, 0, 0.2862745, 1, 1,
0.3159558, 1.162205, 0.006308596, 0, 0.2784314, 1, 1,
0.3198442, 0.7983154, -1.80526, 0, 0.2745098, 1, 1,
0.3231924, -1.737793, 3.595118, 0, 0.2666667, 1, 1,
0.3246378, -0.369736, 0.02130915, 0, 0.2627451, 1, 1,
0.3264543, 0.7699835, 0.8472791, 0, 0.254902, 1, 1,
0.3379428, -0.7689424, 1.586905, 0, 0.2509804, 1, 1,
0.3437878, -0.06839208, 0.8198121, 0, 0.2431373, 1, 1,
0.3445061, 0.7147828, -0.2095157, 0, 0.2392157, 1, 1,
0.3490935, -0.6020296, 1.10427, 0, 0.2313726, 1, 1,
0.351076, 0.4178504, 2.554744, 0, 0.227451, 1, 1,
0.3533116, 0.1933759, 1.826054, 0, 0.2196078, 1, 1,
0.3549175, 2.318168, -0.1118449, 0, 0.2156863, 1, 1,
0.3585788, 0.7668365, 3.231395, 0, 0.2078431, 1, 1,
0.360649, -0.5765098, 1.587011, 0, 0.2039216, 1, 1,
0.3623391, -0.234124, 3.179208, 0, 0.1960784, 1, 1,
0.3625346, -1.21905, 1.922925, 0, 0.1882353, 1, 1,
0.3668226, -0.6035407, 1.924369, 0, 0.1843137, 1, 1,
0.3681995, 2.718014, 2.11966, 0, 0.1764706, 1, 1,
0.3689429, -1.127419, 2.935375, 0, 0.172549, 1, 1,
0.374635, 1.574735, 0.249098, 0, 0.1647059, 1, 1,
0.3864709, 1.191917, -1.799525, 0, 0.1607843, 1, 1,
0.3866292, 0.2380725, 3.483679, 0, 0.1529412, 1, 1,
0.3886202, 0.8632161, -0.74447, 0, 0.1490196, 1, 1,
0.3920967, -1.66835, 3.029048, 0, 0.1411765, 1, 1,
0.3935693, 0.4771395, -0.1252549, 0, 0.1372549, 1, 1,
0.3975837, 1.12356, 1.977559, 0, 0.1294118, 1, 1,
0.4013414, 1.796472, 0.2657664, 0, 0.1254902, 1, 1,
0.4016212, 0.6561533, 2.029409, 0, 0.1176471, 1, 1,
0.4024093, -0.817005, 2.671337, 0, 0.1137255, 1, 1,
0.40518, -0.9349829, 3.021702, 0, 0.1058824, 1, 1,
0.4059921, 0.1647481, 2.034246, 0, 0.09803922, 1, 1,
0.4060334, 0.9667852, -0.5955826, 0, 0.09411765, 1, 1,
0.4078073, -0.5845144, 1.820565, 0, 0.08627451, 1, 1,
0.4080602, -0.06414807, 1.789821, 0, 0.08235294, 1, 1,
0.413766, 1.085285, -0.6752853, 0, 0.07450981, 1, 1,
0.414432, 1.966402, -0.7518631, 0, 0.07058824, 1, 1,
0.4172895, -1.486731, 2.406003, 0, 0.0627451, 1, 1,
0.4191531, -0.8285178, 3.045018, 0, 0.05882353, 1, 1,
0.4218161, 0.8904951, -1.164425, 0, 0.05098039, 1, 1,
0.4291902, 0.6420211, 1.110191, 0, 0.04705882, 1, 1,
0.4293151, 0.6173881, -0.1927045, 0, 0.03921569, 1, 1,
0.4302142, -0.759401, 2.432419, 0, 0.03529412, 1, 1,
0.432171, -0.05763583, 2.066083, 0, 0.02745098, 1, 1,
0.4324871, -0.5290334, 2.578849, 0, 0.02352941, 1, 1,
0.4337956, 0.3258414, 1.018527, 0, 0.01568628, 1, 1,
0.4369015, 0.3406985, 1.193996, 0, 0.01176471, 1, 1,
0.4395508, 1.115962, 0.8718297, 0, 0.003921569, 1, 1,
0.4397792, -1.642859, 3.61675, 0.003921569, 0, 1, 1,
0.440214, -1.800636, 2.970379, 0.007843138, 0, 1, 1,
0.4425469, -1.28912, 2.170411, 0.01568628, 0, 1, 1,
0.4428017, -1.284891, 2.191299, 0.01960784, 0, 1, 1,
0.4447257, -0.4210028, -0.2795603, 0.02745098, 0, 1, 1,
0.4461291, 0.0137444, 2.291021, 0.03137255, 0, 1, 1,
0.4505209, 1.594164, -0.6594061, 0.03921569, 0, 1, 1,
0.4508355, -1.005203, 2.759878, 0.04313726, 0, 1, 1,
0.4538012, 1.008631, 2.202419, 0.05098039, 0, 1, 1,
0.4555736, 0.6651107, 1.470977, 0.05490196, 0, 1, 1,
0.4577438, -2.129398, 1.704708, 0.0627451, 0, 1, 1,
0.4591636, 1.263216, -0.4219739, 0.06666667, 0, 1, 1,
0.4635729, -0.9687868, 4.333144, 0.07450981, 0, 1, 1,
0.4664598, -1.280017, 2.244961, 0.07843138, 0, 1, 1,
0.4687519, 0.04027901, 0.3791398, 0.08627451, 0, 1, 1,
0.4733803, 0.3926449, 1.026327, 0.09019608, 0, 1, 1,
0.4760763, 0.9889909, -0.163259, 0.09803922, 0, 1, 1,
0.4812407, -0.800159, 3.819952, 0.1058824, 0, 1, 1,
0.4822713, -2.373672, 3.84858, 0.1098039, 0, 1, 1,
0.4873202, -0.4593534, 2.669446, 0.1176471, 0, 1, 1,
0.4877618, -0.5384841, 0.5751179, 0.1215686, 0, 1, 1,
0.4949703, -1.597413, 1.323809, 0.1294118, 0, 1, 1,
0.5029564, -1.332716, 2.814206, 0.1333333, 0, 1, 1,
0.506114, -0.7163047, 3.858296, 0.1411765, 0, 1, 1,
0.5085633, 0.2762235, 1.735672, 0.145098, 0, 1, 1,
0.5100973, -1.846752, 1.986421, 0.1529412, 0, 1, 1,
0.5134926, 0.08396783, 1.433611, 0.1568628, 0, 1, 1,
0.5157843, 0.03180692, 1.258467, 0.1647059, 0, 1, 1,
0.5194814, -2.015376, 3.225257, 0.1686275, 0, 1, 1,
0.5197945, -0.3540084, 1.223827, 0.1764706, 0, 1, 1,
0.5197977, -1.266279, 2.914824, 0.1803922, 0, 1, 1,
0.5202405, -0.08961793, 2.916077, 0.1882353, 0, 1, 1,
0.5347735, -0.3492158, 2.740635, 0.1921569, 0, 1, 1,
0.5372581, -0.2603464, 1.654447, 0.2, 0, 1, 1,
0.5417907, 0.4860624, 0.9862184, 0.2078431, 0, 1, 1,
0.5442207, 1.487416, 2.122679, 0.2117647, 0, 1, 1,
0.5473257, 0.8623388, 0.9160572, 0.2196078, 0, 1, 1,
0.5475456, -1.032335, 3.21375, 0.2235294, 0, 1, 1,
0.5491272, -0.4023865, 2.158104, 0.2313726, 0, 1, 1,
0.5500598, 0.7137781, 1.200917, 0.2352941, 0, 1, 1,
0.5554816, -1.014999, 1.821552, 0.2431373, 0, 1, 1,
0.5584249, -0.6743246, 1.097654, 0.2470588, 0, 1, 1,
0.5597919, 1.144631, 1.929655, 0.254902, 0, 1, 1,
0.5616843, 0.03429822, 3.456177, 0.2588235, 0, 1, 1,
0.5680577, 0.08781647, 1.926885, 0.2666667, 0, 1, 1,
0.5705022, 0.7228206, 1.258626, 0.2705882, 0, 1, 1,
0.5789048, 0.01705567, 1.901343, 0.2784314, 0, 1, 1,
0.581147, 1.133728, -0.9465755, 0.282353, 0, 1, 1,
0.5836788, -0.2831641, 4.362847, 0.2901961, 0, 1, 1,
0.5840972, 0.4969165, 1.541797, 0.2941177, 0, 1, 1,
0.5868589, 0.3249873, -0.1771857, 0.3019608, 0, 1, 1,
0.5892205, 0.2486738, -0.624779, 0.3098039, 0, 1, 1,
0.5943927, -1.666703, 2.140735, 0.3137255, 0, 1, 1,
0.5953982, 1.214645, -0.4872905, 0.3215686, 0, 1, 1,
0.5983273, 0.1910639, 2.281108, 0.3254902, 0, 1, 1,
0.5990149, 0.4898128, 1.418501, 0.3333333, 0, 1, 1,
0.6020569, -0.2580858, 1.754882, 0.3372549, 0, 1, 1,
0.6039177, -0.006444862, -0.3292649, 0.345098, 0, 1, 1,
0.6041531, -1.925609, 3.773522, 0.3490196, 0, 1, 1,
0.6047686, -1.278805, 2.586199, 0.3568628, 0, 1, 1,
0.6063941, -1.202462, 1.496384, 0.3607843, 0, 1, 1,
0.6066464, -0.07177918, 2.77718, 0.3686275, 0, 1, 1,
0.6066779, -1.234344, 1.277553, 0.372549, 0, 1, 1,
0.6094497, 0.808253, -1.260729, 0.3803922, 0, 1, 1,
0.6110265, 0.3065406, 2.3264, 0.3843137, 0, 1, 1,
0.6121588, 1.65405, 0.4463589, 0.3921569, 0, 1, 1,
0.6135243, 1.955424, -0.6780666, 0.3960784, 0, 1, 1,
0.6165318, -0.6720068, 2.94449, 0.4039216, 0, 1, 1,
0.619452, 1.014865, 1.610889, 0.4117647, 0, 1, 1,
0.6221037, 1.641767, -0.08610637, 0.4156863, 0, 1, 1,
0.6234398, 0.2239458, 0.7778909, 0.4235294, 0, 1, 1,
0.6299956, -0.766497, 2.712175, 0.427451, 0, 1, 1,
0.6307576, -0.1714562, 2.001353, 0.4352941, 0, 1, 1,
0.6312919, -0.07767935, 1.287935, 0.4392157, 0, 1, 1,
0.6331683, -1.429175, 3.089001, 0.4470588, 0, 1, 1,
0.6348525, -1.313036, 1.867218, 0.4509804, 0, 1, 1,
0.6379291, -0.8151148, 2.112693, 0.4588235, 0, 1, 1,
0.642949, -1.185655, 0.985361, 0.4627451, 0, 1, 1,
0.651366, -0.2788484, 0.3497346, 0.4705882, 0, 1, 1,
0.6530208, 0.3889886, 1.354654, 0.4745098, 0, 1, 1,
0.6554005, 0.7184951, -1.06966, 0.4823529, 0, 1, 1,
0.6559693, 1.457153, 0.6496381, 0.4862745, 0, 1, 1,
0.661114, 0.2673304, 0.4262776, 0.4941176, 0, 1, 1,
0.6629239, 0.4121769, 1.814143, 0.5019608, 0, 1, 1,
0.6704425, -1.905368, 2.087949, 0.5058824, 0, 1, 1,
0.6708815, 0.5103821, 0.5112881, 0.5137255, 0, 1, 1,
0.6725315, -1.457442, 4.008528, 0.5176471, 0, 1, 1,
0.6758481, -1.978863, 0.6429093, 0.5254902, 0, 1, 1,
0.6771591, -0.9243068, 1.835904, 0.5294118, 0, 1, 1,
0.6887129, -0.2415653, 1.596561, 0.5372549, 0, 1, 1,
0.6953549, 1.57509, -1.057769, 0.5411765, 0, 1, 1,
0.6966894, -0.7907081, 1.456773, 0.5490196, 0, 1, 1,
0.6993121, -0.1939254, 2.216156, 0.5529412, 0, 1, 1,
0.7016831, -0.4009942, 3.337182, 0.5607843, 0, 1, 1,
0.7044178, 1.080645, -0.2684632, 0.5647059, 0, 1, 1,
0.7058862, -0.2253141, 0.3137579, 0.572549, 0, 1, 1,
0.7092388, -0.2909694, 1.685467, 0.5764706, 0, 1, 1,
0.7133613, 0.2674248, -0.3438787, 0.5843138, 0, 1, 1,
0.7169393, -1.304155, 1.422434, 0.5882353, 0, 1, 1,
0.7221561, 0.05328608, 1.553688, 0.5960785, 0, 1, 1,
0.7261036, 1.219244, 0.9170315, 0.6039216, 0, 1, 1,
0.7289915, 1.087741, 0.304961, 0.6078432, 0, 1, 1,
0.7307552, 1.43661, 2.886343, 0.6156863, 0, 1, 1,
0.7309146, -0.2620433, 1.856266, 0.6196079, 0, 1, 1,
0.7318016, -2.707707, 4.737967, 0.627451, 0, 1, 1,
0.739797, 0.5779971, 1.751937, 0.6313726, 0, 1, 1,
0.7419035, 0.8247523, 0.4934684, 0.6392157, 0, 1, 1,
0.7448336, 1.479721, 0.1376948, 0.6431373, 0, 1, 1,
0.7489578, -0.1971969, 0.4076637, 0.6509804, 0, 1, 1,
0.7524988, 0.2511778, 1.448637, 0.654902, 0, 1, 1,
0.7556619, 0.3694722, 0.8178866, 0.6627451, 0, 1, 1,
0.7560867, -1.54106, 2.154432, 0.6666667, 0, 1, 1,
0.7581773, 0.8455073, 1.450753, 0.6745098, 0, 1, 1,
0.7665839, -0.3791822, 2.851938, 0.6784314, 0, 1, 1,
0.7674524, -1.391276, 1.191273, 0.6862745, 0, 1, 1,
0.7760104, 0.3607706, 0.2557813, 0.6901961, 0, 1, 1,
0.7773635, -1.630736, 1.075073, 0.6980392, 0, 1, 1,
0.7848839, 1.055961, 0.2305231, 0.7058824, 0, 1, 1,
0.805095, -1.470991, 2.766268, 0.7098039, 0, 1, 1,
0.8062223, -0.468934, 1.017338, 0.7176471, 0, 1, 1,
0.8095969, -1.513055, 2.175235, 0.7215686, 0, 1, 1,
0.814124, 1.352345, -0.3403731, 0.7294118, 0, 1, 1,
0.8144132, -0.8524388, 0.4076652, 0.7333333, 0, 1, 1,
0.8156825, -0.1740454, 1.357694, 0.7411765, 0, 1, 1,
0.8186932, -0.8113866, 2.733386, 0.7450981, 0, 1, 1,
0.8196985, 0.3048326, 1.291579, 0.7529412, 0, 1, 1,
0.8262353, -1.844008, 2.843291, 0.7568628, 0, 1, 1,
0.8273566, 0.2409032, 2.462521, 0.7647059, 0, 1, 1,
0.8297901, 0.6510946, 1.233032, 0.7686275, 0, 1, 1,
0.8334487, -0.1364126, 1.186525, 0.7764706, 0, 1, 1,
0.8343883, -0.5136502, 2.742364, 0.7803922, 0, 1, 1,
0.8366932, -0.8639942, 2.480142, 0.7882353, 0, 1, 1,
0.8437583, 0.7229217, -0.4516024, 0.7921569, 0, 1, 1,
0.8460544, 0.9288541, 2.433295, 0.8, 0, 1, 1,
0.8510385, -1.035681, 1.994508, 0.8078431, 0, 1, 1,
0.858629, -0.2323182, 1.476304, 0.8117647, 0, 1, 1,
0.8594191, 1.113557, -0.2299981, 0.8196079, 0, 1, 1,
0.8617248, -0.2310355, 0.9081709, 0.8235294, 0, 1, 1,
0.8630936, -0.2881171, 0.823165, 0.8313726, 0, 1, 1,
0.8639223, -0.1808333, 2.283125, 0.8352941, 0, 1, 1,
0.867448, -0.2490969, 1.063628, 0.8431373, 0, 1, 1,
0.8681172, -0.7920946, 3.421791, 0.8470588, 0, 1, 1,
0.8695985, -0.1049722, 2.705251, 0.854902, 0, 1, 1,
0.8723496, 0.9688063, 1.4149, 0.8588235, 0, 1, 1,
0.8742329, -0.4980188, 3.159255, 0.8666667, 0, 1, 1,
0.8756778, 1.35154, -0.2021715, 0.8705882, 0, 1, 1,
0.8783088, -2.250936, 2.68567, 0.8784314, 0, 1, 1,
0.8805708, 0.3893138, 1.975427, 0.8823529, 0, 1, 1,
0.8860649, 1.020519, -0.9374259, 0.8901961, 0, 1, 1,
0.8939139, 0.3829718, 0.1105419, 0.8941177, 0, 1, 1,
0.8956807, 0.1479333, 1.667221, 0.9019608, 0, 1, 1,
0.8972647, 2.422507, -1.320802, 0.9098039, 0, 1, 1,
0.8983488, -0.1933051, 3.125672, 0.9137255, 0, 1, 1,
0.898887, 0.5860452, 1.409434, 0.9215686, 0, 1, 1,
0.9053578, 0.6812848, 0.8457479, 0.9254902, 0, 1, 1,
0.9100373, 1.68844, 1.394778, 0.9333333, 0, 1, 1,
0.9228739, -1.374541, 1.741494, 0.9372549, 0, 1, 1,
0.9230157, -2.009354, 2.953, 0.945098, 0, 1, 1,
0.9230691, 0.119129, 0.916846, 0.9490196, 0, 1, 1,
0.9255043, -0.5341133, 2.568291, 0.9568627, 0, 1, 1,
0.930577, 0.09938042, 1.510031, 0.9607843, 0, 1, 1,
0.9411725, -1.190943, 3.534287, 0.9686275, 0, 1, 1,
0.9515638, 2.069987, -0.7191104, 0.972549, 0, 1, 1,
0.9521973, -0.5595639, 1.374613, 0.9803922, 0, 1, 1,
0.9554013, 0.2423721, 2.118438, 0.9843137, 0, 1, 1,
0.95633, -1.733379, 1.82104, 0.9921569, 0, 1, 1,
0.9568388, -2.097555, 3.961249, 0.9960784, 0, 1, 1,
0.9578808, 0.05118864, 1.080486, 1, 0, 0.9960784, 1,
0.9614071, 0.9493176, 0.7939013, 1, 0, 0.9882353, 1,
0.9631566, -0.4117602, 1.875476, 1, 0, 0.9843137, 1,
0.9718471, -0.8863711, 2.038498, 1, 0, 0.9764706, 1,
0.972945, 0.3671505, 1.655584, 1, 0, 0.972549, 1,
0.973328, -0.690569, 0.871744, 1, 0, 0.9647059, 1,
0.9866396, 0.5563565, 2.581412, 1, 0, 0.9607843, 1,
0.9905945, 0.6031699, 1.884048, 1, 0, 0.9529412, 1,
0.997587, 0.6502513, 0.8036898, 1, 0, 0.9490196, 1,
0.9991916, -1.27203, 0.1597177, 1, 0, 0.9411765, 1,
1.002249, -1.2545, 2.628361, 1, 0, 0.9372549, 1,
1.006654, 0.5240693, 0.06964289, 1, 0, 0.9294118, 1,
1.012625, -0.40074, 1.092385, 1, 0, 0.9254902, 1,
1.01432, 1.19891, -0.1887843, 1, 0, 0.9176471, 1,
1.019316, 0.664732, 1.716707, 1, 0, 0.9137255, 1,
1.036052, 0.1253377, 3.570653, 1, 0, 0.9058824, 1,
1.038069, -0.9453075, 0.6624429, 1, 0, 0.9019608, 1,
1.041831, -0.1686842, 0.172564, 1, 0, 0.8941177, 1,
1.042423, -0.3954015, 2.764784, 1, 0, 0.8862745, 1,
1.050053, 0.03856164, -0.734014, 1, 0, 0.8823529, 1,
1.062068, 0.6298544, 1.589956, 1, 0, 0.8745098, 1,
1.069241, -0.6940868, 2.578253, 1, 0, 0.8705882, 1,
1.071568, -0.08206011, 1.057707, 1, 0, 0.8627451, 1,
1.092159, -1.577492, 2.750439, 1, 0, 0.8588235, 1,
1.093212, 0.4883605, -1.755866, 1, 0, 0.8509804, 1,
1.093363, -0.8896668, 3.435657, 1, 0, 0.8470588, 1,
1.101015, -0.1954795, 0.6964272, 1, 0, 0.8392157, 1,
1.118743, -1.073664, 2.816008, 1, 0, 0.8352941, 1,
1.119925, -0.07710787, 0.8123291, 1, 0, 0.827451, 1,
1.125356, -0.3263335, 2.21018, 1, 0, 0.8235294, 1,
1.125899, 0.6424263, 0.7039489, 1, 0, 0.8156863, 1,
1.130321, 1.076426, -0.1355523, 1, 0, 0.8117647, 1,
1.130917, 0.04359711, 2.345409, 1, 0, 0.8039216, 1,
1.150676, 1.029433, 1.88149, 1, 0, 0.7960784, 1,
1.154001, -2.068143, 3.040731, 1, 0, 0.7921569, 1,
1.154587, 1.061697, -0.5076053, 1, 0, 0.7843137, 1,
1.15624, 0.4145495, 1.379037, 1, 0, 0.7803922, 1,
1.157893, -1.41599, 2.469499, 1, 0, 0.772549, 1,
1.158361, 0.8732878, -0.1537859, 1, 0, 0.7686275, 1,
1.174782, 1.293129, -0.5116537, 1, 0, 0.7607843, 1,
1.184854, 0.01024037, 1.222473, 1, 0, 0.7568628, 1,
1.198585, -0.1876783, -0.3017073, 1, 0, 0.7490196, 1,
1.200096, 0.1841799, 2.197891, 1, 0, 0.7450981, 1,
1.202083, -0.0007683923, 0.8141546, 1, 0, 0.7372549, 1,
1.205252, -1.007128, 1.93607, 1, 0, 0.7333333, 1,
1.215976, -0.6553956, 2.289967, 1, 0, 0.7254902, 1,
1.239716, -0.4239864, 3.012916, 1, 0, 0.7215686, 1,
1.242477, 0.1200565, 0.005705548, 1, 0, 0.7137255, 1,
1.262794, -0.8141098, 1.401479, 1, 0, 0.7098039, 1,
1.264438, -1.70257, 3.495321, 1, 0, 0.7019608, 1,
1.265564, 0.5237045, 0.7980419, 1, 0, 0.6941177, 1,
1.269324, -2.40759, 1.763591, 1, 0, 0.6901961, 1,
1.269764, 1.228629, 1.121072, 1, 0, 0.682353, 1,
1.272835, 0.0006190012, 3.39588, 1, 0, 0.6784314, 1,
1.274374, -1.068786, 3.172442, 1, 0, 0.6705883, 1,
1.276097, -0.4802776, 1.283566, 1, 0, 0.6666667, 1,
1.288934, -0.566187, 2.939126, 1, 0, 0.6588235, 1,
1.289604, 0.8970826, 0.7883489, 1, 0, 0.654902, 1,
1.298827, 0.17948, 1.894135, 1, 0, 0.6470588, 1,
1.302542, 0.7613428, 1.383753, 1, 0, 0.6431373, 1,
1.307556, -0.4158311, 2.213618, 1, 0, 0.6352941, 1,
1.310718, 0.5854073, 0.3937171, 1, 0, 0.6313726, 1,
1.312658, 0.478923, 1.529839, 1, 0, 0.6235294, 1,
1.314643, 0.8261486, 0.9271594, 1, 0, 0.6196079, 1,
1.32195, 1.039864, 2.187427, 1, 0, 0.6117647, 1,
1.322581, -1.251541, 3.608438, 1, 0, 0.6078432, 1,
1.322683, -0.2193694, 1.524743, 1, 0, 0.6, 1,
1.330625, -0.9130961, 0.266858, 1, 0, 0.5921569, 1,
1.332086, 0.4923016, 2.145087, 1, 0, 0.5882353, 1,
1.332691, 0.1073578, 4.197035, 1, 0, 0.5803922, 1,
1.33753, -0.8250945, 2.103463, 1, 0, 0.5764706, 1,
1.337695, 0.7733333, 0.282838, 1, 0, 0.5686275, 1,
1.338507, -0.5322187, 1.414588, 1, 0, 0.5647059, 1,
1.34195, 0.3380696, 2.38418, 1, 0, 0.5568628, 1,
1.355856, 0.1009611, 0.6528173, 1, 0, 0.5529412, 1,
1.368653, -0.6244555, 4.543596, 1, 0, 0.5450981, 1,
1.369502, -2.132118, 2.067708, 1, 0, 0.5411765, 1,
1.382125, 0.7083967, 1.861139, 1, 0, 0.5333334, 1,
1.384316, 0.1923491, 1.290263, 1, 0, 0.5294118, 1,
1.396688, -0.4937081, 3.096828, 1, 0, 0.5215687, 1,
1.397819, -1.124663, 1.947903, 1, 0, 0.5176471, 1,
1.399447, 0.2517918, 1.952432, 1, 0, 0.509804, 1,
1.401361, -0.1398887, 2.427706, 1, 0, 0.5058824, 1,
1.401937, -0.3660522, -0.4419566, 1, 0, 0.4980392, 1,
1.403414, -0.8514752, 2.785342, 1, 0, 0.4901961, 1,
1.416308, 0.5641949, -0.01637359, 1, 0, 0.4862745, 1,
1.419079, 1.101335, 0.6580819, 1, 0, 0.4784314, 1,
1.423243, 1.044084, 1.054502, 1, 0, 0.4745098, 1,
1.425997, 0.8608086, 1.505199, 1, 0, 0.4666667, 1,
1.437714, -0.5142939, 2.693824, 1, 0, 0.4627451, 1,
1.437987, -0.2816072, 2.348195, 1, 0, 0.454902, 1,
1.464719, -0.7624494, 1.630305, 1, 0, 0.4509804, 1,
1.479994, 0.2241424, 2.659669, 1, 0, 0.4431373, 1,
1.502079, 0.5010671, 1.357297, 1, 0, 0.4392157, 1,
1.51762, -2.925841, 3.958817, 1, 0, 0.4313726, 1,
1.5183, 0.9065085, 0.8470492, 1, 0, 0.427451, 1,
1.522158, 0.2218083, 1.503328, 1, 0, 0.4196078, 1,
1.5225, -0.2137017, 2.490224, 1, 0, 0.4156863, 1,
1.541418, 0.2558246, -0.9006744, 1, 0, 0.4078431, 1,
1.544984, -0.9037221, 2.203414, 1, 0, 0.4039216, 1,
1.548461, 1.657841, 1.230234, 1, 0, 0.3960784, 1,
1.572957, -0.7344572, 1.226885, 1, 0, 0.3882353, 1,
1.575902, 2.037259, 3.072702, 1, 0, 0.3843137, 1,
1.586562, 0.4676383, 1.883121, 1, 0, 0.3764706, 1,
1.616452, 1.330392, -0.2570904, 1, 0, 0.372549, 1,
1.623997, -1.721626, 3.450156, 1, 0, 0.3647059, 1,
1.629073, 0.273125, -0.4033277, 1, 0, 0.3607843, 1,
1.629462, -0.2027465, 0.3104674, 1, 0, 0.3529412, 1,
1.648063, -0.01654619, 2.395943, 1, 0, 0.3490196, 1,
1.662776, 0.5705345, 1.423815, 1, 0, 0.3411765, 1,
1.667667, -0.2024826, 1.605639, 1, 0, 0.3372549, 1,
1.668986, -0.3613667, 2.25444, 1, 0, 0.3294118, 1,
1.669068, -1.213968, 3.42012, 1, 0, 0.3254902, 1,
1.670719, -2.040419, 2.723193, 1, 0, 0.3176471, 1,
1.678042, -0.5102618, 3.036445, 1, 0, 0.3137255, 1,
1.715221, 0.4197439, 2.533556, 1, 0, 0.3058824, 1,
1.726102, -0.9707895, 2.118261, 1, 0, 0.2980392, 1,
1.726286, -0.07644219, 3.095844, 1, 0, 0.2941177, 1,
1.758323, 0.8307504, 0.3843729, 1, 0, 0.2862745, 1,
1.764307, -0.0702586, 2.666842, 1, 0, 0.282353, 1,
1.76551, -0.6889722, 2.980808, 1, 0, 0.2745098, 1,
1.770071, -1.177568, 3.160027, 1, 0, 0.2705882, 1,
1.779658, 0.5064324, -0.01946985, 1, 0, 0.2627451, 1,
1.77991, -0.4517333, 1.991044, 1, 0, 0.2588235, 1,
1.780765, 0.5133783, 2.790256, 1, 0, 0.2509804, 1,
1.782981, -0.1449593, 1.678631, 1, 0, 0.2470588, 1,
1.792741, -0.7571768, 1.128738, 1, 0, 0.2392157, 1,
1.805439, -1.657106, 2.23564, 1, 0, 0.2352941, 1,
1.81596, 0.5594242, 2.448867, 1, 0, 0.227451, 1,
1.83663, -1.732864, 2.783463, 1, 0, 0.2235294, 1,
1.840724, 0.8455169, 1.210944, 1, 0, 0.2156863, 1,
1.844373, -2.2126, 0.4619278, 1, 0, 0.2117647, 1,
1.875745, 0.2970242, 2.240072, 1, 0, 0.2039216, 1,
1.929931, 1.503888, 2.616479, 1, 0, 0.1960784, 1,
1.941622, 0.9795672, -0.9278848, 1, 0, 0.1921569, 1,
1.94222, 0.6500736, 1.196516, 1, 0, 0.1843137, 1,
1.973992, -1.033272, 0.5336066, 1, 0, 0.1803922, 1,
1.976151, 0.9106781, 1.528124, 1, 0, 0.172549, 1,
1.99289, -0.2884775, 1.998726, 1, 0, 0.1686275, 1,
2.01459, 0.2423005, 1.317095, 1, 0, 0.1607843, 1,
2.021614, 0.1748496, -1.375245, 1, 0, 0.1568628, 1,
2.031184, -2.661025, 1.437029, 1, 0, 0.1490196, 1,
2.035763, -1.368208, 1.202165, 1, 0, 0.145098, 1,
2.048298, -0.3998155, 2.708791, 1, 0, 0.1372549, 1,
2.049963, -0.03660506, 2.090021, 1, 0, 0.1333333, 1,
2.055223, -1.495191, 0.6064224, 1, 0, 0.1254902, 1,
2.061124, 1.194203, 0.7364558, 1, 0, 0.1215686, 1,
2.06853, -2.372553, 1.394216, 1, 0, 0.1137255, 1,
2.094459, 1.095445, 0.4074993, 1, 0, 0.1098039, 1,
2.122058, 0.5420653, 1.101986, 1, 0, 0.1019608, 1,
2.146026, -0.663055, 2.14382, 1, 0, 0.09411765, 1,
2.157961, 1.069867, 3.100442, 1, 0, 0.09019608, 1,
2.162044, 1.371968, -0.07399654, 1, 0, 0.08235294, 1,
2.193708, 0.3638188, 1.425618, 1, 0, 0.07843138, 1,
2.198549, -0.8017684, 1.538619, 1, 0, 0.07058824, 1,
2.280687, -0.6424639, 1.628921, 1, 0, 0.06666667, 1,
2.335803, -1.26559, 2.013077, 1, 0, 0.05882353, 1,
2.407073, -1.358234, 2.124496, 1, 0, 0.05490196, 1,
2.515265, 0.2791028, 1.994739, 1, 0, 0.04705882, 1,
2.620345, -0.4024951, 1.816967, 1, 0, 0.04313726, 1,
2.685418, 0.4437286, 2.043408, 1, 0, 0.03529412, 1,
2.812203, 0.4466604, 0.7094064, 1, 0, 0.03137255, 1,
2.969441, -0.06074408, 1.974677, 1, 0, 0.02352941, 1,
3.251425, 1.095356, 1.570636, 1, 0, 0.01960784, 1,
3.336134, -1.473845, 2.920391, 1, 0, 0.01176471, 1,
3.833291, 0.1063714, 0.5556526, 1, 0, 0.007843138, 1
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
0.4279292, -4.26967, -6.634874, 0, -0.5, 0.5, 0.5,
0.4279292, -4.26967, -6.634874, 1, -0.5, 0.5, 0.5,
0.4279292, -4.26967, -6.634874, 1, 1.5, 0.5, 0.5,
0.4279292, -4.26967, -6.634874, 0, 1.5, 0.5, 0.5
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
-4.13185, -0.005581379, -6.634874, 0, -0.5, 0.5, 0.5,
-4.13185, -0.005581379, -6.634874, 1, -0.5, 0.5, 0.5,
-4.13185, -0.005581379, -6.634874, 1, 1.5, 0.5, 0.5,
-4.13185, -0.005581379, -6.634874, 0, 1.5, 0.5, 0.5
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
-4.13185, -4.26967, 0.2184238, 0, -0.5, 0.5, 0.5,
-4.13185, -4.26967, 0.2184238, 1, -0.5, 0.5, 0.5,
-4.13185, -4.26967, 0.2184238, 1, 1.5, 0.5, 0.5,
-4.13185, -4.26967, 0.2184238, 0, 1.5, 0.5, 0.5
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
-2, -3.28565, -5.053344,
3, -3.28565, -5.053344,
-2, -3.28565, -5.053344,
-2, -3.449653, -5.316933,
-1, -3.28565, -5.053344,
-1, -3.449653, -5.316933,
0, -3.28565, -5.053344,
0, -3.449653, -5.316933,
1, -3.28565, -5.053344,
1, -3.449653, -5.316933,
2, -3.28565, -5.053344,
2, -3.449653, -5.316933,
3, -3.28565, -5.053344,
3, -3.449653, -5.316933
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
-2, -3.77766, -5.844109, 0, -0.5, 0.5, 0.5,
-2, -3.77766, -5.844109, 1, -0.5, 0.5, 0.5,
-2, -3.77766, -5.844109, 1, 1.5, 0.5, 0.5,
-2, -3.77766, -5.844109, 0, 1.5, 0.5, 0.5,
-1, -3.77766, -5.844109, 0, -0.5, 0.5, 0.5,
-1, -3.77766, -5.844109, 1, -0.5, 0.5, 0.5,
-1, -3.77766, -5.844109, 1, 1.5, 0.5, 0.5,
-1, -3.77766, -5.844109, 0, 1.5, 0.5, 0.5,
0, -3.77766, -5.844109, 0, -0.5, 0.5, 0.5,
0, -3.77766, -5.844109, 1, -0.5, 0.5, 0.5,
0, -3.77766, -5.844109, 1, 1.5, 0.5, 0.5,
0, -3.77766, -5.844109, 0, 1.5, 0.5, 0.5,
1, -3.77766, -5.844109, 0, -0.5, 0.5, 0.5,
1, -3.77766, -5.844109, 1, -0.5, 0.5, 0.5,
1, -3.77766, -5.844109, 1, 1.5, 0.5, 0.5,
1, -3.77766, -5.844109, 0, 1.5, 0.5, 0.5,
2, -3.77766, -5.844109, 0, -0.5, 0.5, 0.5,
2, -3.77766, -5.844109, 1, -0.5, 0.5, 0.5,
2, -3.77766, -5.844109, 1, 1.5, 0.5, 0.5,
2, -3.77766, -5.844109, 0, 1.5, 0.5, 0.5,
3, -3.77766, -5.844109, 0, -0.5, 0.5, 0.5,
3, -3.77766, -5.844109, 1, -0.5, 0.5, 0.5,
3, -3.77766, -5.844109, 1, 1.5, 0.5, 0.5,
3, -3.77766, -5.844109, 0, 1.5, 0.5, 0.5
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
-3.079593, -3, -5.053344,
-3.079593, 3, -5.053344,
-3.079593, -3, -5.053344,
-3.254969, -3, -5.316933,
-3.079593, -2, -5.053344,
-3.254969, -2, -5.316933,
-3.079593, -1, -5.053344,
-3.254969, -1, -5.316933,
-3.079593, 0, -5.053344,
-3.254969, 0, -5.316933,
-3.079593, 1, -5.053344,
-3.254969, 1, -5.316933,
-3.079593, 2, -5.053344,
-3.254969, 2, -5.316933,
-3.079593, 3, -5.053344,
-3.254969, 3, -5.316933
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
-3.605722, -3, -5.844109, 0, -0.5, 0.5, 0.5,
-3.605722, -3, -5.844109, 1, -0.5, 0.5, 0.5,
-3.605722, -3, -5.844109, 1, 1.5, 0.5, 0.5,
-3.605722, -3, -5.844109, 0, 1.5, 0.5, 0.5,
-3.605722, -2, -5.844109, 0, -0.5, 0.5, 0.5,
-3.605722, -2, -5.844109, 1, -0.5, 0.5, 0.5,
-3.605722, -2, -5.844109, 1, 1.5, 0.5, 0.5,
-3.605722, -2, -5.844109, 0, 1.5, 0.5, 0.5,
-3.605722, -1, -5.844109, 0, -0.5, 0.5, 0.5,
-3.605722, -1, -5.844109, 1, -0.5, 0.5, 0.5,
-3.605722, -1, -5.844109, 1, 1.5, 0.5, 0.5,
-3.605722, -1, -5.844109, 0, 1.5, 0.5, 0.5,
-3.605722, 0, -5.844109, 0, -0.5, 0.5, 0.5,
-3.605722, 0, -5.844109, 1, -0.5, 0.5, 0.5,
-3.605722, 0, -5.844109, 1, 1.5, 0.5, 0.5,
-3.605722, 0, -5.844109, 0, 1.5, 0.5, 0.5,
-3.605722, 1, -5.844109, 0, -0.5, 0.5, 0.5,
-3.605722, 1, -5.844109, 1, -0.5, 0.5, 0.5,
-3.605722, 1, -5.844109, 1, 1.5, 0.5, 0.5,
-3.605722, 1, -5.844109, 0, 1.5, 0.5, 0.5,
-3.605722, 2, -5.844109, 0, -0.5, 0.5, 0.5,
-3.605722, 2, -5.844109, 1, -0.5, 0.5, 0.5,
-3.605722, 2, -5.844109, 1, 1.5, 0.5, 0.5,
-3.605722, 2, -5.844109, 0, 1.5, 0.5, 0.5,
-3.605722, 3, -5.844109, 0, -0.5, 0.5, 0.5,
-3.605722, 3, -5.844109, 1, -0.5, 0.5, 0.5,
-3.605722, 3, -5.844109, 1, 1.5, 0.5, 0.5,
-3.605722, 3, -5.844109, 0, 1.5, 0.5, 0.5
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
-3.079593, -3.28565, -4,
-3.079593, -3.28565, 4,
-3.079593, -3.28565, -4,
-3.254969, -3.449653, -4,
-3.079593, -3.28565, -2,
-3.254969, -3.449653, -2,
-3.079593, -3.28565, 0,
-3.254969, -3.449653, 0,
-3.079593, -3.28565, 2,
-3.254969, -3.449653, 2,
-3.079593, -3.28565, 4,
-3.254969, -3.449653, 4
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
-3.605722, -3.77766, -4, 0, -0.5, 0.5, 0.5,
-3.605722, -3.77766, -4, 1, -0.5, 0.5, 0.5,
-3.605722, -3.77766, -4, 1, 1.5, 0.5, 0.5,
-3.605722, -3.77766, -4, 0, 1.5, 0.5, 0.5,
-3.605722, -3.77766, -2, 0, -0.5, 0.5, 0.5,
-3.605722, -3.77766, -2, 1, -0.5, 0.5, 0.5,
-3.605722, -3.77766, -2, 1, 1.5, 0.5, 0.5,
-3.605722, -3.77766, -2, 0, 1.5, 0.5, 0.5,
-3.605722, -3.77766, 0, 0, -0.5, 0.5, 0.5,
-3.605722, -3.77766, 0, 1, -0.5, 0.5, 0.5,
-3.605722, -3.77766, 0, 1, 1.5, 0.5, 0.5,
-3.605722, -3.77766, 0, 0, 1.5, 0.5, 0.5,
-3.605722, -3.77766, 2, 0, -0.5, 0.5, 0.5,
-3.605722, -3.77766, 2, 1, -0.5, 0.5, 0.5,
-3.605722, -3.77766, 2, 1, 1.5, 0.5, 0.5,
-3.605722, -3.77766, 2, 0, 1.5, 0.5, 0.5,
-3.605722, -3.77766, 4, 0, -0.5, 0.5, 0.5,
-3.605722, -3.77766, 4, 1, -0.5, 0.5, 0.5,
-3.605722, -3.77766, 4, 1, 1.5, 0.5, 0.5,
-3.605722, -3.77766, 4, 0, 1.5, 0.5, 0.5
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
-3.079593, -3.28565, -5.053344,
-3.079593, 3.274487, -5.053344,
-3.079593, -3.28565, 5.490192,
-3.079593, 3.274487, 5.490192,
-3.079593, -3.28565, -5.053344,
-3.079593, -3.28565, 5.490192,
-3.079593, 3.274487, -5.053344,
-3.079593, 3.274487, 5.490192,
-3.079593, -3.28565, -5.053344,
3.935452, -3.28565, -5.053344,
-3.079593, -3.28565, 5.490192,
3.935452, -3.28565, 5.490192,
-3.079593, 3.274487, -5.053344,
3.935452, 3.274487, -5.053344,
-3.079593, 3.274487, 5.490192,
3.935452, 3.274487, 5.490192,
3.935452, -3.28565, -5.053344,
3.935452, 3.274487, -5.053344,
3.935452, -3.28565, 5.490192,
3.935452, 3.274487, 5.490192,
3.935452, -3.28565, -5.053344,
3.935452, -3.28565, 5.490192,
3.935452, 3.274487, -5.053344,
3.935452, 3.274487, 5.490192
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
var radius = 7.615776;
var distance = 33.88345;
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
mvMatrix.translate( -0.4279292, 0.005581379, -0.2184238 );
mvMatrix.scale( 1.17381, 1.255206, 0.7809834 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.88345);
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
propanil<-read.table("propanil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'propanil' not found
```

```r
y<-propanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'propanil' not found
```

```r
z<-propanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'propanil' not found
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
-2.977432, 1.895582, -1.001897, 0, 0, 1, 1, 1,
-2.949178, -0.4277751, -2.135324, 1, 0, 0, 1, 1,
-2.779179, -1.578127, -2.195935, 1, 0, 0, 1, 1,
-2.669889, -0.2303648, -1.33101, 1, 0, 0, 1, 1,
-2.590197, -0.5558085, -1.404894, 1, 0, 0, 1, 1,
-2.547495, 2.394983, -0.07073058, 1, 0, 0, 1, 1,
-2.45813, 0.4392294, -1.885962, 0, 0, 0, 1, 1,
-2.419011, -1.056601, -2.438596, 0, 0, 0, 1, 1,
-2.373906, -1.078591, -0.7146884, 0, 0, 0, 1, 1,
-2.317433, -1.437372, -1.556368, 0, 0, 0, 1, 1,
-2.315472, 0.747601, -1.043957, 0, 0, 0, 1, 1,
-2.285945, -0.6900651, -2.195414, 0, 0, 0, 1, 1,
-2.271138, 0.009970241, -2.015239, 0, 0, 0, 1, 1,
-2.232171, 0.3084505, -1.883991, 1, 1, 1, 1, 1,
-2.172841, -1.148368, -2.926874, 1, 1, 1, 1, 1,
-2.159642, 0.5619281, -0.8934931, 1, 1, 1, 1, 1,
-2.153315, 0.4035651, -0.1028531, 1, 1, 1, 1, 1,
-2.147895, -1.344849, -1.642676, 1, 1, 1, 1, 1,
-2.139274, 0.9210879, -3.239323, 1, 1, 1, 1, 1,
-2.096642, 0.4997448, -2.08314, 1, 1, 1, 1, 1,
-2.074628, 0.2189059, -1.754527, 1, 1, 1, 1, 1,
-2.066476, 0.8726294, -2.112253, 1, 1, 1, 1, 1,
-2.05956, 1.589259, -2.502365, 1, 1, 1, 1, 1,
-2.055817, -1.701383, -2.759562, 1, 1, 1, 1, 1,
-2.049096, 0.6183894, -0.2824696, 1, 1, 1, 1, 1,
-2.007843, -1.691748, -1.784031, 1, 1, 1, 1, 1,
-1.974428, 0.06241084, -1.707583, 1, 1, 1, 1, 1,
-1.962081, 0.1974687, -0.8025119, 1, 1, 1, 1, 1,
-1.951897, -1.499436, -1.605004, 0, 0, 1, 1, 1,
-1.916949, 0.8803811, -1.488323, 1, 0, 0, 1, 1,
-1.906501, 1.349134, 1.75653, 1, 0, 0, 1, 1,
-1.894784, -1.476567, -0.03054502, 1, 0, 0, 1, 1,
-1.887405, 0.04178565, -0.4793314, 1, 0, 0, 1, 1,
-1.880705, -1.009155, -1.263936, 1, 0, 0, 1, 1,
-1.861497, -1.06649, -3.070645, 0, 0, 0, 1, 1,
-1.851187, 0.2808959, -2.836112, 0, 0, 0, 1, 1,
-1.846722, 0.644667, -1.748749, 0, 0, 0, 1, 1,
-1.823019, -0.5107594, -1.916698, 0, 0, 0, 1, 1,
-1.808376, 1.799266, -0.6248503, 0, 0, 0, 1, 1,
-1.80299, 0.8767552, -2.292553, 0, 0, 0, 1, 1,
-1.787601, 1.164395, 0.8200178, 0, 0, 0, 1, 1,
-1.764961, 0.3380389, -2.571708, 1, 1, 1, 1, 1,
-1.755999, 1.309363, -1.118906, 1, 1, 1, 1, 1,
-1.748589, 2.157627, -1.911447, 1, 1, 1, 1, 1,
-1.747657, 1.45359, -0.1273629, 1, 1, 1, 1, 1,
-1.744462, 1.910313, -1.169135, 1, 1, 1, 1, 1,
-1.740961, -0.6792949, -2.138573, 1, 1, 1, 1, 1,
-1.727747, -0.06605189, -1.289814, 1, 1, 1, 1, 1,
-1.672888, 1.59841, -2.144991, 1, 1, 1, 1, 1,
-1.671793, 0.2670438, -1.102118, 1, 1, 1, 1, 1,
-1.65567, 1.655863, -0.8407658, 1, 1, 1, 1, 1,
-1.651341, 1.303934, -0.3707085, 1, 1, 1, 1, 1,
-1.647887, 0.02278939, -2.474448, 1, 1, 1, 1, 1,
-1.642655, 1.506482, -1.103068, 1, 1, 1, 1, 1,
-1.629553, -0.8257449, -0.9174148, 1, 1, 1, 1, 1,
-1.61717, -0.9089884, -1.730413, 1, 1, 1, 1, 1,
-1.608606, 1.93337, -0.4956807, 0, 0, 1, 1, 1,
-1.591133, 1.115118, -0.7400001, 1, 0, 0, 1, 1,
-1.589825, 0.2215149, -1.175667, 1, 0, 0, 1, 1,
-1.585731, 0.1636097, -2.246239, 1, 0, 0, 1, 1,
-1.572236, 0.6934641, -0.9236275, 1, 0, 0, 1, 1,
-1.567823, 0.7323062, -2.133921, 1, 0, 0, 1, 1,
-1.566253, -0.3259678, -3.549634, 0, 0, 0, 1, 1,
-1.553471, 1.044824, 0.06763272, 0, 0, 0, 1, 1,
-1.538914, 0.7539192, -2.210515, 0, 0, 0, 1, 1,
-1.53709, -1.23319, -1.903936, 0, 0, 0, 1, 1,
-1.53538, -0.01919512, 0.2102446, 0, 0, 0, 1, 1,
-1.53052, 0.4124751, -0.973407, 0, 0, 0, 1, 1,
-1.524515, -0.632905, -1.040795, 0, 0, 0, 1, 1,
-1.5179, -1.51446, -1.825262, 1, 1, 1, 1, 1,
-1.510948, -1.588236, -3.32956, 1, 1, 1, 1, 1,
-1.509519, 0.0548145, -0.9797286, 1, 1, 1, 1, 1,
-1.50593, -0.6793023, -2.137262, 1, 1, 1, 1, 1,
-1.495259, 0.5361904, -0.9420411, 1, 1, 1, 1, 1,
-1.484126, 0.4979267, -1.53009, 1, 1, 1, 1, 1,
-1.482684, -0.05972911, -0.8378959, 1, 1, 1, 1, 1,
-1.469638, 0.1426103, -3.308843, 1, 1, 1, 1, 1,
-1.464492, 0.139681, -1.760084, 1, 1, 1, 1, 1,
-1.450827, 0.2048111, -1.381262, 1, 1, 1, 1, 1,
-1.449478, -1.065091, -1.730791, 1, 1, 1, 1, 1,
-1.41963, -0.6188191, -1.064609, 1, 1, 1, 1, 1,
-1.41523, 1.931785, -0.996667, 1, 1, 1, 1, 1,
-1.413667, 0.117004, -2.506944, 1, 1, 1, 1, 1,
-1.404328, 1.670136, -0.2610584, 1, 1, 1, 1, 1,
-1.400046, 0.6813411, -0.1311143, 0, 0, 1, 1, 1,
-1.394305, -0.2430466, -2.65186, 1, 0, 0, 1, 1,
-1.386039, 0.09887299, -1.677898, 1, 0, 0, 1, 1,
-1.380959, -1.435649, -3.485656, 1, 0, 0, 1, 1,
-1.374898, 0.3470923, -1.758985, 1, 0, 0, 1, 1,
-1.363026, -0.3360033, -2.5831, 1, 0, 0, 1, 1,
-1.347949, -0.8105474, -1.32034, 0, 0, 0, 1, 1,
-1.346346, 1.001716, -0.1228812, 0, 0, 0, 1, 1,
-1.331993, -0.6291386, -2.016728, 0, 0, 0, 1, 1,
-1.327522, -0.117861, -1.0307, 0, 0, 0, 1, 1,
-1.32524, 0.574811, -0.4613665, 0, 0, 0, 1, 1,
-1.320614, -0.2420335, -1.965662, 0, 0, 0, 1, 1,
-1.312953, -0.2499485, -2.216406, 0, 0, 0, 1, 1,
-1.309347, -1.426739, -1.552885, 1, 1, 1, 1, 1,
-1.308937, 0.56037, -1.636476, 1, 1, 1, 1, 1,
-1.307529, -0.7566903, -0.2817163, 1, 1, 1, 1, 1,
-1.293562, -0.7553086, -2.602513, 1, 1, 1, 1, 1,
-1.287483, -0.00784388, 0.2745447, 1, 1, 1, 1, 1,
-1.286946, -0.7635407, -2.826882, 1, 1, 1, 1, 1,
-1.268971, 0.05810591, -3.171978, 1, 1, 1, 1, 1,
-1.26729, -1.476841, -1.875617, 1, 1, 1, 1, 1,
-1.256438, 0.5968446, -2.989875, 1, 1, 1, 1, 1,
-1.256401, -1.725196, -3.264418, 1, 1, 1, 1, 1,
-1.256197, -1.320567, -2.272733, 1, 1, 1, 1, 1,
-1.243451, -0.05186342, -2.18381, 1, 1, 1, 1, 1,
-1.238483, -0.4220499, 0.1120872, 1, 1, 1, 1, 1,
-1.228758, -0.5745085, -1.779476, 1, 1, 1, 1, 1,
-1.224584, 1.330321, -0.1695732, 1, 1, 1, 1, 1,
-1.21937, -0.8924843, -1.272437, 0, 0, 1, 1, 1,
-1.218905, 0.2244215, -1.017057, 1, 0, 0, 1, 1,
-1.20465, 0.259061, -0.6916385, 1, 0, 0, 1, 1,
-1.204466, 1.454592, -0.9690741, 1, 0, 0, 1, 1,
-1.20374, -0.4621805, -1.759674, 1, 0, 0, 1, 1,
-1.203023, 1.239039, -2.068174, 1, 0, 0, 1, 1,
-1.202451, -1.353869, -3.945192, 0, 0, 0, 1, 1,
-1.195911, -1.053048, -1.268073, 0, 0, 0, 1, 1,
-1.19242, 0.9764634, -1.099777, 0, 0, 0, 1, 1,
-1.191637, 0.0921366, -2.187753, 0, 0, 0, 1, 1,
-1.183462, -0.02741896, -1.309512, 0, 0, 0, 1, 1,
-1.181246, 0.8055359, -0.3899583, 0, 0, 0, 1, 1,
-1.176688, 0.6981704, -2.059806, 0, 0, 0, 1, 1,
-1.176551, 0.5066029, -0.4901697, 1, 1, 1, 1, 1,
-1.170757, 1.168548, -0.2713055, 1, 1, 1, 1, 1,
-1.166625, -0.03678441, -2.055895, 1, 1, 1, 1, 1,
-1.16532, 1.214279, 2.066754, 1, 1, 1, 1, 1,
-1.151945, -0.2602654, -2.370581, 1, 1, 1, 1, 1,
-1.145962, -1.015398, -2.212723, 1, 1, 1, 1, 1,
-1.144074, 0.3895075, -0.586394, 1, 1, 1, 1, 1,
-1.122222, 1.444763, -1.79696, 1, 1, 1, 1, 1,
-1.119377, 0.8432542, 0.5239908, 1, 1, 1, 1, 1,
-1.113778, 0.2321056, -0.8474462, 1, 1, 1, 1, 1,
-1.097634, -0.2580031, -1.475258, 1, 1, 1, 1, 1,
-1.095883, -0.2880917, -0.5661942, 1, 1, 1, 1, 1,
-1.087449, -0.01644306, -3.761606, 1, 1, 1, 1, 1,
-1.079178, -1.563343, -2.635658, 1, 1, 1, 1, 1,
-1.074147, 1.216598, 1.341828, 1, 1, 1, 1, 1,
-1.062216, -0.4960482, -3.123408, 0, 0, 1, 1, 1,
-1.06204, -0.6605523, -2.98116, 1, 0, 0, 1, 1,
-1.058157, 0.3990478, -0.5723129, 1, 0, 0, 1, 1,
-1.056306, -1.256366, -2.275521, 1, 0, 0, 1, 1,
-1.050773, -2.150125, -4.145436, 1, 0, 0, 1, 1,
-1.050756, -0.9438244, -2.189599, 1, 0, 0, 1, 1,
-1.043975, -0.1925436, -0.5664334, 0, 0, 0, 1, 1,
-1.04367, 0.4850757, -0.7562066, 0, 0, 0, 1, 1,
-1.038794, 1.139938, 0.1236786, 0, 0, 0, 1, 1,
-1.036931, 0.1096617, -3.235372, 0, 0, 0, 1, 1,
-1.027494, -1.313824, -2.121633, 0, 0, 0, 1, 1,
-1.020576, 0.4673022, -1.038455, 0, 0, 0, 1, 1,
-1.019942, -0.195815, -2.778659, 0, 0, 0, 1, 1,
-1.016162, 0.7280844, -0.8208371, 1, 1, 1, 1, 1,
-1.014024, 1.369799, 0.3380269, 1, 1, 1, 1, 1,
-1.011822, 0.306505, -1.036095, 1, 1, 1, 1, 1,
-1.011042, 1.309737, -0.4782775, 1, 1, 1, 1, 1,
-1.009598, 0.1268054, -0.8378168, 1, 1, 1, 1, 1,
-1.00937, -1.447934, -1.879016, 1, 1, 1, 1, 1,
-1.004769, 1.006155, 0.2089308, 1, 1, 1, 1, 1,
-1.004429, -0.1291476, -1.962529, 1, 1, 1, 1, 1,
-1.000089, 0.5856186, -0.01405784, 1, 1, 1, 1, 1,
-0.9905774, -0.4958533, -3.326257, 1, 1, 1, 1, 1,
-0.988524, -0.004576534, -1.886025, 1, 1, 1, 1, 1,
-0.987975, 0.2744499, -1.140284, 1, 1, 1, 1, 1,
-0.9828899, 0.4409652, -1.274644, 1, 1, 1, 1, 1,
-0.9816326, -0.4539106, -1.908354, 1, 1, 1, 1, 1,
-0.9800394, 0.4275981, -1.151548, 1, 1, 1, 1, 1,
-0.9742426, -0.3990336, -0.5026513, 0, 0, 1, 1, 1,
-0.9723898, 0.2119792, -1.171873, 1, 0, 0, 1, 1,
-0.9708695, -0.1646277, -0.5379527, 1, 0, 0, 1, 1,
-0.9639658, -0.06282786, -1.862332, 1, 0, 0, 1, 1,
-0.9618648, 0.4110305, -1.61794, 1, 0, 0, 1, 1,
-0.9606951, -1.267815, -2.85087, 1, 0, 0, 1, 1,
-0.9526879, -0.5527073, -1.462743, 0, 0, 0, 1, 1,
-0.9447085, -0.00989668, -1.668266, 0, 0, 0, 1, 1,
-0.9355986, -0.6473059, -3.104908, 0, 0, 0, 1, 1,
-0.9351035, 0.02722165, -3.046859, 0, 0, 0, 1, 1,
-0.932278, -0.01349158, -0.9443144, 0, 0, 0, 1, 1,
-0.9205034, 0.4348961, -1.626328, 0, 0, 0, 1, 1,
-0.9189991, -0.3236264, -2.370095, 0, 0, 0, 1, 1,
-0.915476, -2.605965, -4.651749, 1, 1, 1, 1, 1,
-0.9100054, 0.6060177, -1.8051, 1, 1, 1, 1, 1,
-0.9062639, -0.6834644, -2.417676, 1, 1, 1, 1, 1,
-0.903762, 1.875779, -2.554771, 1, 1, 1, 1, 1,
-0.9025599, -0.6108342, -1.744738, 1, 1, 1, 1, 1,
-0.898738, -0.6447049, -3.609299, 1, 1, 1, 1, 1,
-0.8983961, 0.9514139, -0.03860916, 1, 1, 1, 1, 1,
-0.8978215, 0.4193563, -0.2322272, 1, 1, 1, 1, 1,
-0.8907167, -0.01151408, -2.675714, 1, 1, 1, 1, 1,
-0.8897681, -1.31372, -2.017152, 1, 1, 1, 1, 1,
-0.8888474, 0.2058479, -0.4043671, 1, 1, 1, 1, 1,
-0.8862801, 1.33501, 0.2789667, 1, 1, 1, 1, 1,
-0.8839877, -0.6054319, -3.00477, 1, 1, 1, 1, 1,
-0.8807881, 1.889776, -2.32612, 1, 1, 1, 1, 1,
-0.8698038, 0.7768879, 0.9996667, 1, 1, 1, 1, 1,
-0.8679407, 1.68235, 0.1577054, 0, 0, 1, 1, 1,
-0.8620122, -0.9160918, -1.786733, 1, 0, 0, 1, 1,
-0.8595148, -0.01808248, -0.6645701, 1, 0, 0, 1, 1,
-0.8575904, -0.2897047, -2.126265, 1, 0, 0, 1, 1,
-0.8494568, -0.5854248, -3.45513, 1, 0, 0, 1, 1,
-0.8449309, 0.3541767, 0.4373654, 1, 0, 0, 1, 1,
-0.8423087, -0.1309268, -2.630653, 0, 0, 0, 1, 1,
-0.8395768, -2.734469, -3.317383, 0, 0, 0, 1, 1,
-0.8344281, -0.5133076, -2.889908, 0, 0, 0, 1, 1,
-0.8303041, 1.349316, -1.070529, 0, 0, 0, 1, 1,
-0.8237673, 0.9839944, 0.4485362, 0, 0, 0, 1, 1,
-0.823141, -0.5119734, -3.894736, 0, 0, 0, 1, 1,
-0.8223909, -0.3528147, -1.974426, 0, 0, 0, 1, 1,
-0.8181534, -0.1771144, -1.294259, 1, 1, 1, 1, 1,
-0.817688, 0.556484, -3.015603, 1, 1, 1, 1, 1,
-0.8139268, 1.374067, -0.281287, 1, 1, 1, 1, 1,
-0.8068857, -1.08808, -2.753206, 1, 1, 1, 1, 1,
-0.8048792, -0.3067741, -2.726357, 1, 1, 1, 1, 1,
-0.8007697, 0.3987187, -2.083738, 1, 1, 1, 1, 1,
-0.7983623, 0.5409057, -1.593283, 1, 1, 1, 1, 1,
-0.7880808, -0.4382067, -4.055955, 1, 1, 1, 1, 1,
-0.7856672, -1.037407, -2.168157, 1, 1, 1, 1, 1,
-0.7604932, -0.2901695, -2.168176, 1, 1, 1, 1, 1,
-0.7547719, -0.06865519, -1.589047, 1, 1, 1, 1, 1,
-0.7506842, -0.3799606, -2.039792, 1, 1, 1, 1, 1,
-0.7491135, 1.590886, -0.593703, 1, 1, 1, 1, 1,
-0.7467133, 1.113441, -0.09785089, 1, 1, 1, 1, 1,
-0.7456351, 1.813921, -0.2625441, 1, 1, 1, 1, 1,
-0.7437505, 1.104749, -1.581942, 0, 0, 1, 1, 1,
-0.7429968, -0.9897989, -0.632045, 1, 0, 0, 1, 1,
-0.7423872, -2.127752, -2.430061, 1, 0, 0, 1, 1,
-0.7334173, 0.1811974, -1.640277, 1, 0, 0, 1, 1,
-0.7326722, -0.5779457, -2.85696, 1, 0, 0, 1, 1,
-0.7295842, 0.4414766, 0.112098, 1, 0, 0, 1, 1,
-0.7289358, -0.7575288, -1.994723, 0, 0, 0, 1, 1,
-0.7230724, 0.6410741, -0.3197712, 0, 0, 0, 1, 1,
-0.7215055, -0.80556, -2.955277, 0, 0, 0, 1, 1,
-0.7123485, 0.07782328, -1.630958, 0, 0, 0, 1, 1,
-0.7114007, 2.141051, -0.06604867, 0, 0, 0, 1, 1,
-0.7094645, 1.66338, -2.066034, 0, 0, 0, 1, 1,
-0.7092733, 0.2672665, -1.100196, 0, 0, 0, 1, 1,
-0.7092636, 0.5324994, -2.489433, 1, 1, 1, 1, 1,
-0.7072303, 0.6980016, 0.1500565, 1, 1, 1, 1, 1,
-0.7071058, 0.285544, -2.393465, 1, 1, 1, 1, 1,
-0.7070575, 1.164464, 1.108595, 1, 1, 1, 1, 1,
-0.7018417, -0.05328809, -1.323509, 1, 1, 1, 1, 1,
-0.6955841, -0.2267344, -1.65637, 1, 1, 1, 1, 1,
-0.6917317, 0.7739233, -1.860627, 1, 1, 1, 1, 1,
-0.6878155, 1.626076, -0.9278094, 1, 1, 1, 1, 1,
-0.6853679, -0.2423787, -1.249314, 1, 1, 1, 1, 1,
-0.6827611, 0.7690923, -1.179617, 1, 1, 1, 1, 1,
-0.6826653, 1.338981, -1.139313, 1, 1, 1, 1, 1,
-0.6794607, -1.008193, -2.700659, 1, 1, 1, 1, 1,
-0.6784987, 0.404758, -0.4414507, 1, 1, 1, 1, 1,
-0.6699658, -0.1638353, -0.2166704, 1, 1, 1, 1, 1,
-0.6674504, 1.057284, -1.719878, 1, 1, 1, 1, 1,
-0.6665143, 0.3978345, -0.4984713, 0, 0, 1, 1, 1,
-0.6663889, -0.4012868, -1.431353, 1, 0, 0, 1, 1,
-0.6626474, -0.5119871, -3.667469, 1, 0, 0, 1, 1,
-0.6606576, -0.8548213, -2.155013, 1, 0, 0, 1, 1,
-0.6595796, 1.736086, 0.3902899, 1, 0, 0, 1, 1,
-0.6565049, -0.1775963, -1.426279, 1, 0, 0, 1, 1,
-0.6506677, 0.05996864, -2.215219, 0, 0, 0, 1, 1,
-0.6502315, -0.0650451, -2.016124, 0, 0, 0, 1, 1,
-0.6487539, 0.2389902, -0.5685585, 0, 0, 0, 1, 1,
-0.6457984, 0.864978, -1.482072, 0, 0, 0, 1, 1,
-0.6456396, 1.210824, -3.286494, 0, 0, 0, 1, 1,
-0.6404791, 1.319758, -1.00497, 0, 0, 0, 1, 1,
-0.6335514, -1.51051, -2.416757, 0, 0, 0, 1, 1,
-0.6332008, -1.079075, -1.672033, 1, 1, 1, 1, 1,
-0.6195997, 0.8332059, 0.2412612, 1, 1, 1, 1, 1,
-0.6174161, -0.7056433, -3.341779, 1, 1, 1, 1, 1,
-0.6109408, -0.6807464, -2.194077, 1, 1, 1, 1, 1,
-0.6104132, -0.1829141, -2.312486, 1, 1, 1, 1, 1,
-0.6089861, 0.2195943, -1.150054, 1, 1, 1, 1, 1,
-0.6076161, -0.7351069, -4.348348, 1, 1, 1, 1, 1,
-0.6062828, -1.283539, -1.542455, 1, 1, 1, 1, 1,
-0.6049668, 1.248605, -0.7416871, 1, 1, 1, 1, 1,
-0.6029541, -0.809074, -2.589284, 1, 1, 1, 1, 1,
-0.6001984, -0.5159668, -2.334643, 1, 1, 1, 1, 1,
-0.5987806, 1.038716, 0.1382409, 1, 1, 1, 1, 1,
-0.5908244, 0.3726172, -2.175452, 1, 1, 1, 1, 1,
-0.585219, -0.8879322, -1.192737, 1, 1, 1, 1, 1,
-0.5735705, -0.1078636, -2.330452, 1, 1, 1, 1, 1,
-0.5735285, 0.8975472, 0.0452945, 0, 0, 1, 1, 1,
-0.5567809, -0.5870094, -2.317888, 1, 0, 0, 1, 1,
-0.5540906, 3.178951, -1.692577, 1, 0, 0, 1, 1,
-0.5521805, -0.3824581, 0.1681759, 1, 0, 0, 1, 1,
-0.5440269, -0.7163448, -3.27933, 1, 0, 0, 1, 1,
-0.5420237, -0.6236084, -2.975547, 1, 0, 0, 1, 1,
-0.5406934, -0.1175263, -2.794865, 0, 0, 0, 1, 1,
-0.5265009, -2.813282, -3.040663, 0, 0, 0, 1, 1,
-0.522699, 0.003364239, -3.253608, 0, 0, 0, 1, 1,
-0.5214226, -1.335027, -2.77961, 0, 0, 0, 1, 1,
-0.5208138, 1.558029, 0.4068625, 0, 0, 0, 1, 1,
-0.5191706, -1.470192, -3.314352, 0, 0, 0, 1, 1,
-0.5180668, 0.938648, -1.166661, 0, 0, 0, 1, 1,
-0.5170493, -1.9135, -1.753373, 1, 1, 1, 1, 1,
-0.5125626, 1.093312, -0.1165951, 1, 1, 1, 1, 1,
-0.5055848, -0.965141, -1.499462, 1, 1, 1, 1, 1,
-0.5028923, 0.9746124, -0.1679035, 1, 1, 1, 1, 1,
-0.5025395, 0.9801475, -1.226358, 1, 1, 1, 1, 1,
-0.5007461, -1.824318, -2.877602, 1, 1, 1, 1, 1,
-0.4956782, -0.422923, -3.741905, 1, 1, 1, 1, 1,
-0.4947716, -0.3865397, -1.589228, 1, 1, 1, 1, 1,
-0.4863445, 0.8432621, 0.9562755, 1, 1, 1, 1, 1,
-0.4831575, -1.408674, -2.700228, 1, 1, 1, 1, 1,
-0.4813534, -0.6314426, -1.717302, 1, 1, 1, 1, 1,
-0.4809861, 0.04196865, -1.804601, 1, 1, 1, 1, 1,
-0.4795836, -2.82185, -2.319389, 1, 1, 1, 1, 1,
-0.47396, 1.618468, -0.2706681, 1, 1, 1, 1, 1,
-0.4730383, 0.1292826, -0.7508754, 1, 1, 1, 1, 1,
-0.4719072, 0.8872284, -0.2316905, 0, 0, 1, 1, 1,
-0.4716567, -0.1711101, -3.140348, 1, 0, 0, 1, 1,
-0.4652128, -1.190589, -2.465938, 1, 0, 0, 1, 1,
-0.4624221, 1.88572, 1.68637, 1, 0, 0, 1, 1,
-0.4615598, -0.5976003, -2.537627, 1, 0, 0, 1, 1,
-0.4610974, 1.312575, 0.06319765, 1, 0, 0, 1, 1,
-0.4594604, -0.5775296, -0.5361658, 0, 0, 0, 1, 1,
-0.4507631, 1.753362, -1.795441, 0, 0, 0, 1, 1,
-0.4493488, -1.464683, -2.408814, 0, 0, 0, 1, 1,
-0.4436021, -0.5599847, -2.223943, 0, 0, 0, 1, 1,
-0.4428786, 2.581382, 0.9559799, 0, 0, 0, 1, 1,
-0.4383366, -0.5345407, -2.860328, 0, 0, 0, 1, 1,
-0.4382188, -0.747256, -3.716603, 0, 0, 0, 1, 1,
-0.4376249, -0.7385135, -4.195183, 1, 1, 1, 1, 1,
-0.4361612, -0.4360087, -2.658919, 1, 1, 1, 1, 1,
-0.4342001, 1.277601, -1.04924, 1, 1, 1, 1, 1,
-0.4324053, 0.08120891, -2.427783, 1, 1, 1, 1, 1,
-0.4304739, -1.216298, -4.1511, 1, 1, 1, 1, 1,
-0.430178, -0.334232, -3.235048, 1, 1, 1, 1, 1,
-0.4270771, -3.190114, -3.103486, 1, 1, 1, 1, 1,
-0.4247259, -0.3705338, -0.7118696, 1, 1, 1, 1, 1,
-0.4198098, 0.4272592, -0.1559249, 1, 1, 1, 1, 1,
-0.4189774, -0.5281336, -2.567039, 1, 1, 1, 1, 1,
-0.4139864, 0.8381843, -1.424893, 1, 1, 1, 1, 1,
-0.4130734, -0.8855197, -0.6806362, 1, 1, 1, 1, 1,
-0.4024198, 0.1752614, -0.3806146, 1, 1, 1, 1, 1,
-0.4023556, 0.3982204, -0.5457299, 1, 1, 1, 1, 1,
-0.401901, -1.018291, -3.740967, 1, 1, 1, 1, 1,
-0.3982919, 0.08122733, -1.027646, 0, 0, 1, 1, 1,
-0.3965448, -0.05189978, -1.877221, 1, 0, 0, 1, 1,
-0.3878087, 0.3874511, -0.5247034, 1, 0, 0, 1, 1,
-0.381862, 2.480529, -0.3090344, 1, 0, 0, 1, 1,
-0.377524, -0.4564425, -3.79488, 1, 0, 0, 1, 1,
-0.3762082, -1.174569, -4.22342, 1, 0, 0, 1, 1,
-0.3723818, -0.4078653, -1.662043, 0, 0, 0, 1, 1,
-0.3681491, -0.1031436, -0.9635481, 0, 0, 0, 1, 1,
-0.3595085, -0.8140208, -0.9425287, 0, 0, 0, 1, 1,
-0.3581924, -0.4429333, -2.821693, 0, 0, 0, 1, 1,
-0.3513443, 0.2355554, -0.8525797, 0, 0, 0, 1, 1,
-0.3502561, -1.235597, -3.233333, 0, 0, 0, 1, 1,
-0.3496781, -1.704438, -3.132365, 0, 0, 0, 1, 1,
-0.3488564, 0.4015463, -1.469769, 1, 1, 1, 1, 1,
-0.3456531, -1.478277, -3.343822, 1, 1, 1, 1, 1,
-0.3454112, -1.792325, -2.568246, 1, 1, 1, 1, 1,
-0.3447517, 1.075681, -1.86598, 1, 1, 1, 1, 1,
-0.3435348, -0.4310171, -1.639578, 1, 1, 1, 1, 1,
-0.342502, 1.901763, -1.834022, 1, 1, 1, 1, 1,
-0.340176, -0.7416859, -3.052348, 1, 1, 1, 1, 1,
-0.3330937, -0.2583353, -1.803138, 1, 1, 1, 1, 1,
-0.3307815, -0.4674613, -3.118802, 1, 1, 1, 1, 1,
-0.3267383, 0.6574934, 1.40457, 1, 1, 1, 1, 1,
-0.3263414, -0.2485246, -3.122292, 1, 1, 1, 1, 1,
-0.3250018, -0.8095098, -4.01783, 1, 1, 1, 1, 1,
-0.3234821, 0.5922666, -0.1090102, 1, 1, 1, 1, 1,
-0.3223702, -0.2435484, -3.287454, 1, 1, 1, 1, 1,
-0.3221432, 1.00525, -3.106831, 1, 1, 1, 1, 1,
-0.3158312, 1.254825, 0.785751, 0, 0, 1, 1, 1,
-0.3149429, -0.4866091, -3.564039, 1, 0, 0, 1, 1,
-0.3124628, -0.3022179, -0.9775143, 1, 0, 0, 1, 1,
-0.3075781, -0.7716027, -1.861313, 1, 0, 0, 1, 1,
-0.3060158, 0.375681, -1.541317, 1, 0, 0, 1, 1,
-0.3036084, -0.1097111, -3.370007, 1, 0, 0, 1, 1,
-0.3022472, -0.6535301, -3.778243, 0, 0, 0, 1, 1,
-0.2980055, 1.470665, -0.829546, 0, 0, 0, 1, 1,
-0.2964015, 1.752375, 0.09538042, 0, 0, 0, 1, 1,
-0.2951391, -1.099998, -3.088481, 0, 0, 0, 1, 1,
-0.294302, 1.907277, -0.576969, 0, 0, 0, 1, 1,
-0.292607, 0.06597459, -1.008206, 0, 0, 0, 1, 1,
-0.2898408, -0.3777007, -1.917998, 0, 0, 0, 1, 1,
-0.2836699, -0.09608831, -0.17817, 1, 1, 1, 1, 1,
-0.2824913, 0.2898276, -1.264957, 1, 1, 1, 1, 1,
-0.2818806, 0.01938928, 0.5884664, 1, 1, 1, 1, 1,
-0.28138, 0.2923338, 0.8532073, 1, 1, 1, 1, 1,
-0.274422, 0.9356921, 0.008890694, 1, 1, 1, 1, 1,
-0.2718613, 1.535681, 0.1950233, 1, 1, 1, 1, 1,
-0.2717043, -0.5663905, -2.339611, 1, 1, 1, 1, 1,
-0.2583582, 0.8009802, -0.6060312, 1, 1, 1, 1, 1,
-0.2563579, 0.4451032, -2.115009, 1, 1, 1, 1, 1,
-0.2509164, 0.1454427, -1.017254, 1, 1, 1, 1, 1,
-0.248445, 0.7087893, 0.5095787, 1, 1, 1, 1, 1,
-0.247794, 0.8577048, 0.001613516, 1, 1, 1, 1, 1,
-0.2466872, -0.2556643, -1.535924, 1, 1, 1, 1, 1,
-0.2459399, -0.2470882, -0.7022641, 1, 1, 1, 1, 1,
-0.2458357, -0.170331, -1.034901, 1, 1, 1, 1, 1,
-0.2442674, -1.13014, -4.216466, 0, 0, 1, 1, 1,
-0.2405912, -0.9068015, -1.981315, 1, 0, 0, 1, 1,
-0.2364632, 2.231805, 0.7436838, 1, 0, 0, 1, 1,
-0.2359022, 0.5058905, 0.3836462, 1, 0, 0, 1, 1,
-0.2350213, 0.7242072, -1.385312, 1, 0, 0, 1, 1,
-0.2344068, -1.387952, -2.620276, 1, 0, 0, 1, 1,
-0.2339895, 2.03974, -0.8805035, 0, 0, 0, 1, 1,
-0.2337047, 1.135746, -1.34263, 0, 0, 0, 1, 1,
-0.2323918, 1.759696, 1.425787, 0, 0, 0, 1, 1,
-0.2318203, 0.1019296, -1.222547, 0, 0, 0, 1, 1,
-0.2290693, 2.425487, 1.088066, 0, 0, 0, 1, 1,
-0.226536, 0.2808475, -0.6302196, 0, 0, 0, 1, 1,
-0.2247974, 0.3191621, -0.8398326, 0, 0, 0, 1, 1,
-0.2246912, -0.3632019, -1.30451, 1, 1, 1, 1, 1,
-0.2227908, 0.3435666, 0.9897313, 1, 1, 1, 1, 1,
-0.2175425, 0.2523147, -0.006775046, 1, 1, 1, 1, 1,
-0.2069275, 1.08887, 0.2848824, 1, 1, 1, 1, 1,
-0.1954932, 0.05893833, -2.607121, 1, 1, 1, 1, 1,
-0.1910345, 1.265425, -1.069937, 1, 1, 1, 1, 1,
-0.1877035, -1.935025, -0.9878756, 1, 1, 1, 1, 1,
-0.1863019, 0.1174005, -1.640465, 1, 1, 1, 1, 1,
-0.1846314, 0.9135215, 1.086707, 1, 1, 1, 1, 1,
-0.1818355, 0.8708316, -1.802856, 1, 1, 1, 1, 1,
-0.1800695, 0.1538013, -1.693063, 1, 1, 1, 1, 1,
-0.1783342, 1.024204, -0.5225139, 1, 1, 1, 1, 1,
-0.1767512, 0.835541, -0.4686925, 1, 1, 1, 1, 1,
-0.17576, -0.5955128, -2.142615, 1, 1, 1, 1, 1,
-0.1754699, 1.324119, -0.4107637, 1, 1, 1, 1, 1,
-0.1726268, 0.9972648, 2.307451, 0, 0, 1, 1, 1,
-0.1725471, -1.616639, -2.68712, 1, 0, 0, 1, 1,
-0.1713253, -0.339287, -2.015941, 1, 0, 0, 1, 1,
-0.1697867, 0.3034012, 0.4513706, 1, 0, 0, 1, 1,
-0.1674931, 0.1015788, 0.02523992, 1, 0, 0, 1, 1,
-0.1668497, 0.4594192, -0.950226, 1, 0, 0, 1, 1,
-0.1635951, 0.7192466, -0.5212165, 0, 0, 0, 1, 1,
-0.1601235, -1.73457, -3.655685, 0, 0, 0, 1, 1,
-0.1559677, 0.2418272, 0.4515786, 0, 0, 0, 1, 1,
-0.1545381, -0.09737054, -3.104184, 0, 0, 0, 1, 1,
-0.1523335, 0.4322333, 0.1167936, 0, 0, 0, 1, 1,
-0.1511343, 1.082386, 0.0614713, 0, 0, 0, 1, 1,
-0.1432188, -0.1021863, -1.983336, 0, 0, 0, 1, 1,
-0.1413872, -0.7833768, -2.272405, 1, 1, 1, 1, 1,
-0.1392718, 0.6425363, -0.3421947, 1, 1, 1, 1, 1,
-0.1369997, 0.0699316, -2.112953, 1, 1, 1, 1, 1,
-0.135624, 0.09302076, -0.7863109, 1, 1, 1, 1, 1,
-0.1346388, 1.126204, -0.8224987, 1, 1, 1, 1, 1,
-0.1336677, 0.4092421, -0.4427913, 1, 1, 1, 1, 1,
-0.127716, 0.9491084, -1.571997, 1, 1, 1, 1, 1,
-0.1273577, 1.964481, 0.04732042, 1, 1, 1, 1, 1,
-0.1271846, -0.8227955, -4.434917, 1, 1, 1, 1, 1,
-0.1254171, 0.5567216, -0.2590788, 1, 1, 1, 1, 1,
-0.1226244, -2.167477, -4.899797, 1, 1, 1, 1, 1,
-0.1225461, 0.04947389, -1.225079, 1, 1, 1, 1, 1,
-0.1197524, -0.3412023, -2.825115, 1, 1, 1, 1, 1,
-0.1148128, -0.2232071, -3.005151, 1, 1, 1, 1, 1,
-0.114637, -1.256823, -4.205789, 1, 1, 1, 1, 1,
-0.1108751, -0.5083124, -1.596557, 0, 0, 1, 1, 1,
-0.1090157, -0.09697011, -3.938514, 1, 0, 0, 1, 1,
-0.1082876, 0.7592372, 1.114883, 1, 0, 0, 1, 1,
-0.1060911, -0.482668, -2.702127, 1, 0, 0, 1, 1,
-0.1051032, -1.159381, -3.347406, 1, 0, 0, 1, 1,
-0.1034286, 0.06733428, -1.152969, 1, 0, 0, 1, 1,
-0.1001223, 1.180537, -0.7407489, 0, 0, 0, 1, 1,
-0.09433248, -0.4821417, -2.044139, 0, 0, 0, 1, 1,
-0.09095653, 0.1217084, -0.1378568, 0, 0, 0, 1, 1,
-0.08771536, 0.2794825, -0.8234524, 0, 0, 0, 1, 1,
-0.0844038, -0.4598901, -3.632435, 0, 0, 0, 1, 1,
-0.08433348, 0.8844724, 0.3786499, 0, 0, 0, 1, 1,
-0.08250879, -0.345388, -3.921731, 0, 0, 0, 1, 1,
-0.07923681, 2.092132, 1.073086, 1, 1, 1, 1, 1,
-0.07530227, -0.824203, -0.5285628, 1, 1, 1, 1, 1,
-0.07363849, 0.5594175, -1.405024, 1, 1, 1, 1, 1,
-0.07065558, 0.5421634, -1.5554, 1, 1, 1, 1, 1,
-0.06658571, 2.007487, -0.7903462, 1, 1, 1, 1, 1,
-0.06359941, 0.4513832, -1.497104, 1, 1, 1, 1, 1,
-0.06055601, -1.727414, -2.102807, 1, 1, 1, 1, 1,
-0.05782301, 0.08419663, -1.340663, 1, 1, 1, 1, 1,
-0.05418189, 1.630759, -1.109436, 1, 1, 1, 1, 1,
-0.05388724, 1.555583, 0.3451569, 1, 1, 1, 1, 1,
-0.05349639, -1.476928, -3.641837, 1, 1, 1, 1, 1,
-0.05151791, -0.8621785, -1.635476, 1, 1, 1, 1, 1,
-0.04674639, -0.2195137, -3.821412, 1, 1, 1, 1, 1,
-0.04672042, 0.1629879, -0.8096225, 1, 1, 1, 1, 1,
-0.04415495, 1.009506, 0.03590187, 1, 1, 1, 1, 1,
-0.04217039, 0.196522, 0.2207532, 0, 0, 1, 1, 1,
-0.04208875, -2.057909, -3.026281, 1, 0, 0, 1, 1,
-0.04150692, 0.8620597, 0.4999172, 1, 0, 0, 1, 1,
-0.03594618, 1.412069, 0.9788015, 1, 0, 0, 1, 1,
-0.02934495, 1.39867, 2.26479, 1, 0, 0, 1, 1,
-0.02779445, 1.421437, -0.08000826, 1, 0, 0, 1, 1,
-0.02089847, -0.3906219, -2.3664, 0, 0, 0, 1, 1,
-0.01504349, -1.011505, -2.80819, 0, 0, 0, 1, 1,
-0.01215315, -1.302374, -2.810259, 0, 0, 0, 1, 1,
-0.01212837, -0.8497677, -2.951715, 0, 0, 0, 1, 1,
-0.01171839, -0.3094288, -3.037733, 0, 0, 0, 1, 1,
-0.004925179, -0.5551058, -4.459038, 0, 0, 0, 1, 1,
-0.0001387069, -0.03374029, -3.403274, 0, 0, 0, 1, 1,
0.001792365, -0.4421053, 2.163056, 1, 1, 1, 1, 1,
0.003783237, -0.5782527, 2.95468, 1, 1, 1, 1, 1,
0.003841022, 0.9021513, -0.5040299, 1, 1, 1, 1, 1,
0.004746825, 0.1780108, 0.5612732, 1, 1, 1, 1, 1,
0.008168375, -0.3191121, 3.467603, 1, 1, 1, 1, 1,
0.008574815, -0.92553, 3.097651, 1, 1, 1, 1, 1,
0.008610252, 0.03572156, -1.451639, 1, 1, 1, 1, 1,
0.009496244, -1.956353, 4.283852, 1, 1, 1, 1, 1,
0.01222183, -0.1388627, 2.705417, 1, 1, 1, 1, 1,
0.0171601, 0.03048353, 0.4471291, 1, 1, 1, 1, 1,
0.0180087, 0.1739269, -0.9981315, 1, 1, 1, 1, 1,
0.02205417, 1.920166, 1.117455, 1, 1, 1, 1, 1,
0.02334165, -1.191781, 4.015551, 1, 1, 1, 1, 1,
0.02881907, 0.5428174, 0.4954436, 1, 1, 1, 1, 1,
0.02890693, -0.9199713, 4.194395, 1, 1, 1, 1, 1,
0.02984552, -0.4428682, 1.107037, 0, 0, 1, 1, 1,
0.03073825, -0.8051674, 4.681489, 1, 0, 0, 1, 1,
0.03698724, 0.3087234, 0.2441232, 1, 0, 0, 1, 1,
0.03721968, -1.761857, 3.799379, 1, 0, 0, 1, 1,
0.04020698, 0.4733643, -0.7703102, 1, 0, 0, 1, 1,
0.04280835, -0.6940618, 2.324451, 1, 0, 0, 1, 1,
0.04344824, -0.2035888, 2.71903, 0, 0, 0, 1, 1,
0.04554399, 0.5507259, -0.9850919, 0, 0, 0, 1, 1,
0.04804035, -0.7719755, 3.420665, 0, 0, 0, 1, 1,
0.04948173, -1.129291, 2.929895, 0, 0, 0, 1, 1,
0.05048846, -0.1242977, 3.608152, 0, 0, 0, 1, 1,
0.05156781, 0.7053112, -0.6672953, 0, 0, 0, 1, 1,
0.05169654, -0.1564932, 3.469017, 0, 0, 0, 1, 1,
0.05221077, 1.02869, 0.1531409, 1, 1, 1, 1, 1,
0.05720029, 0.9104153, -0.5721141, 1, 1, 1, 1, 1,
0.05999422, 0.1428387, 1.877433, 1, 1, 1, 1, 1,
0.06449544, 0.5425256, -0.7786971, 1, 1, 1, 1, 1,
0.06794565, -0.9920833, 2.06909, 1, 1, 1, 1, 1,
0.06968627, -0.3555933, 3.945272, 1, 1, 1, 1, 1,
0.07199731, 1.169549, -0.9271057, 1, 1, 1, 1, 1,
0.07318231, -0.06727453, 1.967261, 1, 1, 1, 1, 1,
0.07469045, 1.122131, 0.6240177, 1, 1, 1, 1, 1,
0.0791848, -0.00687623, 0.08135591, 1, 1, 1, 1, 1,
0.08021235, 0.6952116, 0.7124462, 1, 1, 1, 1, 1,
0.08121363, 0.3649169, -0.745581, 1, 1, 1, 1, 1,
0.08334539, 0.1729123, -0.1875757, 1, 1, 1, 1, 1,
0.08800934, 0.8154706, -0.2700387, 1, 1, 1, 1, 1,
0.08942578, -0.4604017, 2.314596, 1, 1, 1, 1, 1,
0.08989526, -0.9106186, 2.84408, 0, 0, 1, 1, 1,
0.09837041, 0.0476273, 0.5524704, 1, 0, 0, 1, 1,
0.1014821, -0.8344226, 1.44215, 1, 0, 0, 1, 1,
0.1048557, 0.5592321, 0.6069657, 1, 0, 0, 1, 1,
0.1098258, -0.8835433, 2.42994, 1, 0, 0, 1, 1,
0.1133027, 0.6742292, 1.463816, 1, 0, 0, 1, 1,
0.1165697, -0.858788, 2.185287, 0, 0, 0, 1, 1,
0.1171941, 0.4753462, -0.04868222, 0, 0, 0, 1, 1,
0.1195602, -0.9312343, 4.34358, 0, 0, 0, 1, 1,
0.1201145, -0.0631648, 0.8365433, 0, 0, 0, 1, 1,
0.1294848, -1.455762, 0.9565908, 0, 0, 0, 1, 1,
0.136886, 0.6734838, 0.1521584, 0, 0, 0, 1, 1,
0.1408065, -0.90659, 2.09867, 0, 0, 0, 1, 1,
0.1421291, 0.1988015, 1.849157, 1, 1, 1, 1, 1,
0.1429228, -0.5740338, 3.484233, 1, 1, 1, 1, 1,
0.1429666, 1.772513, 0.5923091, 1, 1, 1, 1, 1,
0.1476564, 0.1621977, 1.942612, 1, 1, 1, 1, 1,
0.1527988, 0.8484387, 1.911742, 1, 1, 1, 1, 1,
0.1548516, -1.00546, 1.546261, 1, 1, 1, 1, 1,
0.155621, -0.1438518, 3.096126, 1, 1, 1, 1, 1,
0.1559939, 0.7676151, 0.01063913, 1, 1, 1, 1, 1,
0.1600924, -0.3518051, 4.383786, 1, 1, 1, 1, 1,
0.1658627, 0.8201479, 0.08326161, 1, 1, 1, 1, 1,
0.1666605, -1.629593, 3.028528, 1, 1, 1, 1, 1,
0.1681649, 1.004356, -2.22329, 1, 1, 1, 1, 1,
0.1702652, -0.4136247, 1.764554, 1, 1, 1, 1, 1,
0.1747477, -0.2485878, 2.865109, 1, 1, 1, 1, 1,
0.1764841, -1.761522, 5.034795, 1, 1, 1, 1, 1,
0.1767262, -1.359256, 4.286633, 0, 0, 1, 1, 1,
0.177109, -0.5571634, 2.263149, 1, 0, 0, 1, 1,
0.1774356, 0.2249507, 0.9410818, 1, 0, 0, 1, 1,
0.1778816, 0.441304, 0.04105127, 1, 0, 0, 1, 1,
0.1820382, -0.07129478, 3.866195, 1, 0, 0, 1, 1,
0.1838013, 0.5402508, -0.04114473, 1, 0, 0, 1, 1,
0.19244, -0.3569206, 3.787352, 0, 0, 0, 1, 1,
0.1936477, 0.7173754, 0.128236, 0, 0, 0, 1, 1,
0.1962762, -0.7291195, 2.205281, 0, 0, 0, 1, 1,
0.2015026, -0.1631944, 1.62546, 0, 0, 0, 1, 1,
0.2174159, 1.61684, 0.8640838, 0, 0, 0, 1, 1,
0.2190431, -0.244427, 5.336645, 0, 0, 0, 1, 1,
0.2195808, -1.587748, 3.161566, 0, 0, 0, 1, 1,
0.2215402, -0.1141974, 2.477112, 1, 1, 1, 1, 1,
0.226241, 0.1972868, 0.5458736, 1, 1, 1, 1, 1,
0.226716, 0.009456985, 1.149682, 1, 1, 1, 1, 1,
0.2273352, -0.6786539, 2.983371, 1, 1, 1, 1, 1,
0.2305561, -2.153861, 4.939337, 1, 1, 1, 1, 1,
0.2311689, 0.008722193, 2.019987, 1, 1, 1, 1, 1,
0.2318234, 1.160162, 0.2296965, 1, 1, 1, 1, 1,
0.2319078, 0.3410408, 0.2424484, 1, 1, 1, 1, 1,
0.2319169, 1.470949, 1.869325, 1, 1, 1, 1, 1,
0.2322061, 0.7828565, 0.6374425, 1, 1, 1, 1, 1,
0.2344459, -1.534696, 3.790277, 1, 1, 1, 1, 1,
0.2363393, -2.000876, 4.194094, 1, 1, 1, 1, 1,
0.2397173, 0.7329575, 1.489082, 1, 1, 1, 1, 1,
0.2463085, -1.531863, 2.341398, 1, 1, 1, 1, 1,
0.2474626, -1.913429, 2.598339, 1, 1, 1, 1, 1,
0.2528583, -1.230909, 2.839818, 0, 0, 1, 1, 1,
0.2601505, 1.416703, 0.9737511, 1, 0, 0, 1, 1,
0.2633801, -0.2725611, 1.686769, 1, 0, 0, 1, 1,
0.267009, -0.8136297, 2.024744, 1, 0, 0, 1, 1,
0.2676095, 0.367979, 2.863308, 1, 0, 0, 1, 1,
0.2696479, -1.82087, 4.934974, 1, 0, 0, 1, 1,
0.2709023, 0.7707583, 0.563543, 0, 0, 0, 1, 1,
0.2717778, -0.5248383, 2.773274, 0, 0, 0, 1, 1,
0.2730989, 0.5565497, 1.400233, 0, 0, 0, 1, 1,
0.2740918, -0.8057989, 2.382981, 0, 0, 0, 1, 1,
0.2763174, -0.6982816, 2.072313, 0, 0, 0, 1, 1,
0.2775217, -1.543786, 4.717782, 0, 0, 0, 1, 1,
0.281721, -0.163279, 0.454226, 0, 0, 0, 1, 1,
0.2817625, 0.9547295, -0.2021127, 1, 1, 1, 1, 1,
0.2836879, 0.1975793, -0.03989108, 1, 1, 1, 1, 1,
0.2860008, -0.8665306, 3.488577, 1, 1, 1, 1, 1,
0.2867652, 1.493336, 0.1356749, 1, 1, 1, 1, 1,
0.2884857, -1.746238, 3.084988, 1, 1, 1, 1, 1,
0.2946723, -1.042755, 3.088097, 1, 1, 1, 1, 1,
0.2972975, 0.2557022, -1.083545, 1, 1, 1, 1, 1,
0.299496, 0.149043, 2.05064, 1, 1, 1, 1, 1,
0.3000908, -0.2172048, 1.298836, 1, 1, 1, 1, 1,
0.3052191, 0.2428473, 0.1912902, 1, 1, 1, 1, 1,
0.3052649, 0.5559667, -0.03666052, 1, 1, 1, 1, 1,
0.3062581, 1.160963, 0.100222, 1, 1, 1, 1, 1,
0.3085169, -1.971979, 1.279189, 1, 1, 1, 1, 1,
0.3085551, 1.301449, 0.2677642, 1, 1, 1, 1, 1,
0.3104392, -0.6380444, 3.070973, 1, 1, 1, 1, 1,
0.3110438, -0.9577229, 4.569987, 0, 0, 1, 1, 1,
0.3121094, -0.6487564, 4.080531, 1, 0, 0, 1, 1,
0.3134901, 0.3383053, 0.252586, 1, 0, 0, 1, 1,
0.3153287, -0.489283, 1.835419, 1, 0, 0, 1, 1,
0.3159558, 1.162205, 0.006308596, 1, 0, 0, 1, 1,
0.3198442, 0.7983154, -1.80526, 1, 0, 0, 1, 1,
0.3231924, -1.737793, 3.595118, 0, 0, 0, 1, 1,
0.3246378, -0.369736, 0.02130915, 0, 0, 0, 1, 1,
0.3264543, 0.7699835, 0.8472791, 0, 0, 0, 1, 1,
0.3379428, -0.7689424, 1.586905, 0, 0, 0, 1, 1,
0.3437878, -0.06839208, 0.8198121, 0, 0, 0, 1, 1,
0.3445061, 0.7147828, -0.2095157, 0, 0, 0, 1, 1,
0.3490935, -0.6020296, 1.10427, 0, 0, 0, 1, 1,
0.351076, 0.4178504, 2.554744, 1, 1, 1, 1, 1,
0.3533116, 0.1933759, 1.826054, 1, 1, 1, 1, 1,
0.3549175, 2.318168, -0.1118449, 1, 1, 1, 1, 1,
0.3585788, 0.7668365, 3.231395, 1, 1, 1, 1, 1,
0.360649, -0.5765098, 1.587011, 1, 1, 1, 1, 1,
0.3623391, -0.234124, 3.179208, 1, 1, 1, 1, 1,
0.3625346, -1.21905, 1.922925, 1, 1, 1, 1, 1,
0.3668226, -0.6035407, 1.924369, 1, 1, 1, 1, 1,
0.3681995, 2.718014, 2.11966, 1, 1, 1, 1, 1,
0.3689429, -1.127419, 2.935375, 1, 1, 1, 1, 1,
0.374635, 1.574735, 0.249098, 1, 1, 1, 1, 1,
0.3864709, 1.191917, -1.799525, 1, 1, 1, 1, 1,
0.3866292, 0.2380725, 3.483679, 1, 1, 1, 1, 1,
0.3886202, 0.8632161, -0.74447, 1, 1, 1, 1, 1,
0.3920967, -1.66835, 3.029048, 1, 1, 1, 1, 1,
0.3935693, 0.4771395, -0.1252549, 0, 0, 1, 1, 1,
0.3975837, 1.12356, 1.977559, 1, 0, 0, 1, 1,
0.4013414, 1.796472, 0.2657664, 1, 0, 0, 1, 1,
0.4016212, 0.6561533, 2.029409, 1, 0, 0, 1, 1,
0.4024093, -0.817005, 2.671337, 1, 0, 0, 1, 1,
0.40518, -0.9349829, 3.021702, 1, 0, 0, 1, 1,
0.4059921, 0.1647481, 2.034246, 0, 0, 0, 1, 1,
0.4060334, 0.9667852, -0.5955826, 0, 0, 0, 1, 1,
0.4078073, -0.5845144, 1.820565, 0, 0, 0, 1, 1,
0.4080602, -0.06414807, 1.789821, 0, 0, 0, 1, 1,
0.413766, 1.085285, -0.6752853, 0, 0, 0, 1, 1,
0.414432, 1.966402, -0.7518631, 0, 0, 0, 1, 1,
0.4172895, -1.486731, 2.406003, 0, 0, 0, 1, 1,
0.4191531, -0.8285178, 3.045018, 1, 1, 1, 1, 1,
0.4218161, 0.8904951, -1.164425, 1, 1, 1, 1, 1,
0.4291902, 0.6420211, 1.110191, 1, 1, 1, 1, 1,
0.4293151, 0.6173881, -0.1927045, 1, 1, 1, 1, 1,
0.4302142, -0.759401, 2.432419, 1, 1, 1, 1, 1,
0.432171, -0.05763583, 2.066083, 1, 1, 1, 1, 1,
0.4324871, -0.5290334, 2.578849, 1, 1, 1, 1, 1,
0.4337956, 0.3258414, 1.018527, 1, 1, 1, 1, 1,
0.4369015, 0.3406985, 1.193996, 1, 1, 1, 1, 1,
0.4395508, 1.115962, 0.8718297, 1, 1, 1, 1, 1,
0.4397792, -1.642859, 3.61675, 1, 1, 1, 1, 1,
0.440214, -1.800636, 2.970379, 1, 1, 1, 1, 1,
0.4425469, -1.28912, 2.170411, 1, 1, 1, 1, 1,
0.4428017, -1.284891, 2.191299, 1, 1, 1, 1, 1,
0.4447257, -0.4210028, -0.2795603, 1, 1, 1, 1, 1,
0.4461291, 0.0137444, 2.291021, 0, 0, 1, 1, 1,
0.4505209, 1.594164, -0.6594061, 1, 0, 0, 1, 1,
0.4508355, -1.005203, 2.759878, 1, 0, 0, 1, 1,
0.4538012, 1.008631, 2.202419, 1, 0, 0, 1, 1,
0.4555736, 0.6651107, 1.470977, 1, 0, 0, 1, 1,
0.4577438, -2.129398, 1.704708, 1, 0, 0, 1, 1,
0.4591636, 1.263216, -0.4219739, 0, 0, 0, 1, 1,
0.4635729, -0.9687868, 4.333144, 0, 0, 0, 1, 1,
0.4664598, -1.280017, 2.244961, 0, 0, 0, 1, 1,
0.4687519, 0.04027901, 0.3791398, 0, 0, 0, 1, 1,
0.4733803, 0.3926449, 1.026327, 0, 0, 0, 1, 1,
0.4760763, 0.9889909, -0.163259, 0, 0, 0, 1, 1,
0.4812407, -0.800159, 3.819952, 0, 0, 0, 1, 1,
0.4822713, -2.373672, 3.84858, 1, 1, 1, 1, 1,
0.4873202, -0.4593534, 2.669446, 1, 1, 1, 1, 1,
0.4877618, -0.5384841, 0.5751179, 1, 1, 1, 1, 1,
0.4949703, -1.597413, 1.323809, 1, 1, 1, 1, 1,
0.5029564, -1.332716, 2.814206, 1, 1, 1, 1, 1,
0.506114, -0.7163047, 3.858296, 1, 1, 1, 1, 1,
0.5085633, 0.2762235, 1.735672, 1, 1, 1, 1, 1,
0.5100973, -1.846752, 1.986421, 1, 1, 1, 1, 1,
0.5134926, 0.08396783, 1.433611, 1, 1, 1, 1, 1,
0.5157843, 0.03180692, 1.258467, 1, 1, 1, 1, 1,
0.5194814, -2.015376, 3.225257, 1, 1, 1, 1, 1,
0.5197945, -0.3540084, 1.223827, 1, 1, 1, 1, 1,
0.5197977, -1.266279, 2.914824, 1, 1, 1, 1, 1,
0.5202405, -0.08961793, 2.916077, 1, 1, 1, 1, 1,
0.5347735, -0.3492158, 2.740635, 1, 1, 1, 1, 1,
0.5372581, -0.2603464, 1.654447, 0, 0, 1, 1, 1,
0.5417907, 0.4860624, 0.9862184, 1, 0, 0, 1, 1,
0.5442207, 1.487416, 2.122679, 1, 0, 0, 1, 1,
0.5473257, 0.8623388, 0.9160572, 1, 0, 0, 1, 1,
0.5475456, -1.032335, 3.21375, 1, 0, 0, 1, 1,
0.5491272, -0.4023865, 2.158104, 1, 0, 0, 1, 1,
0.5500598, 0.7137781, 1.200917, 0, 0, 0, 1, 1,
0.5554816, -1.014999, 1.821552, 0, 0, 0, 1, 1,
0.5584249, -0.6743246, 1.097654, 0, 0, 0, 1, 1,
0.5597919, 1.144631, 1.929655, 0, 0, 0, 1, 1,
0.5616843, 0.03429822, 3.456177, 0, 0, 0, 1, 1,
0.5680577, 0.08781647, 1.926885, 0, 0, 0, 1, 1,
0.5705022, 0.7228206, 1.258626, 0, 0, 0, 1, 1,
0.5789048, 0.01705567, 1.901343, 1, 1, 1, 1, 1,
0.581147, 1.133728, -0.9465755, 1, 1, 1, 1, 1,
0.5836788, -0.2831641, 4.362847, 1, 1, 1, 1, 1,
0.5840972, 0.4969165, 1.541797, 1, 1, 1, 1, 1,
0.5868589, 0.3249873, -0.1771857, 1, 1, 1, 1, 1,
0.5892205, 0.2486738, -0.624779, 1, 1, 1, 1, 1,
0.5943927, -1.666703, 2.140735, 1, 1, 1, 1, 1,
0.5953982, 1.214645, -0.4872905, 1, 1, 1, 1, 1,
0.5983273, 0.1910639, 2.281108, 1, 1, 1, 1, 1,
0.5990149, 0.4898128, 1.418501, 1, 1, 1, 1, 1,
0.6020569, -0.2580858, 1.754882, 1, 1, 1, 1, 1,
0.6039177, -0.006444862, -0.3292649, 1, 1, 1, 1, 1,
0.6041531, -1.925609, 3.773522, 1, 1, 1, 1, 1,
0.6047686, -1.278805, 2.586199, 1, 1, 1, 1, 1,
0.6063941, -1.202462, 1.496384, 1, 1, 1, 1, 1,
0.6066464, -0.07177918, 2.77718, 0, 0, 1, 1, 1,
0.6066779, -1.234344, 1.277553, 1, 0, 0, 1, 1,
0.6094497, 0.808253, -1.260729, 1, 0, 0, 1, 1,
0.6110265, 0.3065406, 2.3264, 1, 0, 0, 1, 1,
0.6121588, 1.65405, 0.4463589, 1, 0, 0, 1, 1,
0.6135243, 1.955424, -0.6780666, 1, 0, 0, 1, 1,
0.6165318, -0.6720068, 2.94449, 0, 0, 0, 1, 1,
0.619452, 1.014865, 1.610889, 0, 0, 0, 1, 1,
0.6221037, 1.641767, -0.08610637, 0, 0, 0, 1, 1,
0.6234398, 0.2239458, 0.7778909, 0, 0, 0, 1, 1,
0.6299956, -0.766497, 2.712175, 0, 0, 0, 1, 1,
0.6307576, -0.1714562, 2.001353, 0, 0, 0, 1, 1,
0.6312919, -0.07767935, 1.287935, 0, 0, 0, 1, 1,
0.6331683, -1.429175, 3.089001, 1, 1, 1, 1, 1,
0.6348525, -1.313036, 1.867218, 1, 1, 1, 1, 1,
0.6379291, -0.8151148, 2.112693, 1, 1, 1, 1, 1,
0.642949, -1.185655, 0.985361, 1, 1, 1, 1, 1,
0.651366, -0.2788484, 0.3497346, 1, 1, 1, 1, 1,
0.6530208, 0.3889886, 1.354654, 1, 1, 1, 1, 1,
0.6554005, 0.7184951, -1.06966, 1, 1, 1, 1, 1,
0.6559693, 1.457153, 0.6496381, 1, 1, 1, 1, 1,
0.661114, 0.2673304, 0.4262776, 1, 1, 1, 1, 1,
0.6629239, 0.4121769, 1.814143, 1, 1, 1, 1, 1,
0.6704425, -1.905368, 2.087949, 1, 1, 1, 1, 1,
0.6708815, 0.5103821, 0.5112881, 1, 1, 1, 1, 1,
0.6725315, -1.457442, 4.008528, 1, 1, 1, 1, 1,
0.6758481, -1.978863, 0.6429093, 1, 1, 1, 1, 1,
0.6771591, -0.9243068, 1.835904, 1, 1, 1, 1, 1,
0.6887129, -0.2415653, 1.596561, 0, 0, 1, 1, 1,
0.6953549, 1.57509, -1.057769, 1, 0, 0, 1, 1,
0.6966894, -0.7907081, 1.456773, 1, 0, 0, 1, 1,
0.6993121, -0.1939254, 2.216156, 1, 0, 0, 1, 1,
0.7016831, -0.4009942, 3.337182, 1, 0, 0, 1, 1,
0.7044178, 1.080645, -0.2684632, 1, 0, 0, 1, 1,
0.7058862, -0.2253141, 0.3137579, 0, 0, 0, 1, 1,
0.7092388, -0.2909694, 1.685467, 0, 0, 0, 1, 1,
0.7133613, 0.2674248, -0.3438787, 0, 0, 0, 1, 1,
0.7169393, -1.304155, 1.422434, 0, 0, 0, 1, 1,
0.7221561, 0.05328608, 1.553688, 0, 0, 0, 1, 1,
0.7261036, 1.219244, 0.9170315, 0, 0, 0, 1, 1,
0.7289915, 1.087741, 0.304961, 0, 0, 0, 1, 1,
0.7307552, 1.43661, 2.886343, 1, 1, 1, 1, 1,
0.7309146, -0.2620433, 1.856266, 1, 1, 1, 1, 1,
0.7318016, -2.707707, 4.737967, 1, 1, 1, 1, 1,
0.739797, 0.5779971, 1.751937, 1, 1, 1, 1, 1,
0.7419035, 0.8247523, 0.4934684, 1, 1, 1, 1, 1,
0.7448336, 1.479721, 0.1376948, 1, 1, 1, 1, 1,
0.7489578, -0.1971969, 0.4076637, 1, 1, 1, 1, 1,
0.7524988, 0.2511778, 1.448637, 1, 1, 1, 1, 1,
0.7556619, 0.3694722, 0.8178866, 1, 1, 1, 1, 1,
0.7560867, -1.54106, 2.154432, 1, 1, 1, 1, 1,
0.7581773, 0.8455073, 1.450753, 1, 1, 1, 1, 1,
0.7665839, -0.3791822, 2.851938, 1, 1, 1, 1, 1,
0.7674524, -1.391276, 1.191273, 1, 1, 1, 1, 1,
0.7760104, 0.3607706, 0.2557813, 1, 1, 1, 1, 1,
0.7773635, -1.630736, 1.075073, 1, 1, 1, 1, 1,
0.7848839, 1.055961, 0.2305231, 0, 0, 1, 1, 1,
0.805095, -1.470991, 2.766268, 1, 0, 0, 1, 1,
0.8062223, -0.468934, 1.017338, 1, 0, 0, 1, 1,
0.8095969, -1.513055, 2.175235, 1, 0, 0, 1, 1,
0.814124, 1.352345, -0.3403731, 1, 0, 0, 1, 1,
0.8144132, -0.8524388, 0.4076652, 1, 0, 0, 1, 1,
0.8156825, -0.1740454, 1.357694, 0, 0, 0, 1, 1,
0.8186932, -0.8113866, 2.733386, 0, 0, 0, 1, 1,
0.8196985, 0.3048326, 1.291579, 0, 0, 0, 1, 1,
0.8262353, -1.844008, 2.843291, 0, 0, 0, 1, 1,
0.8273566, 0.2409032, 2.462521, 0, 0, 0, 1, 1,
0.8297901, 0.6510946, 1.233032, 0, 0, 0, 1, 1,
0.8334487, -0.1364126, 1.186525, 0, 0, 0, 1, 1,
0.8343883, -0.5136502, 2.742364, 1, 1, 1, 1, 1,
0.8366932, -0.8639942, 2.480142, 1, 1, 1, 1, 1,
0.8437583, 0.7229217, -0.4516024, 1, 1, 1, 1, 1,
0.8460544, 0.9288541, 2.433295, 1, 1, 1, 1, 1,
0.8510385, -1.035681, 1.994508, 1, 1, 1, 1, 1,
0.858629, -0.2323182, 1.476304, 1, 1, 1, 1, 1,
0.8594191, 1.113557, -0.2299981, 1, 1, 1, 1, 1,
0.8617248, -0.2310355, 0.9081709, 1, 1, 1, 1, 1,
0.8630936, -0.2881171, 0.823165, 1, 1, 1, 1, 1,
0.8639223, -0.1808333, 2.283125, 1, 1, 1, 1, 1,
0.867448, -0.2490969, 1.063628, 1, 1, 1, 1, 1,
0.8681172, -0.7920946, 3.421791, 1, 1, 1, 1, 1,
0.8695985, -0.1049722, 2.705251, 1, 1, 1, 1, 1,
0.8723496, 0.9688063, 1.4149, 1, 1, 1, 1, 1,
0.8742329, -0.4980188, 3.159255, 1, 1, 1, 1, 1,
0.8756778, 1.35154, -0.2021715, 0, 0, 1, 1, 1,
0.8783088, -2.250936, 2.68567, 1, 0, 0, 1, 1,
0.8805708, 0.3893138, 1.975427, 1, 0, 0, 1, 1,
0.8860649, 1.020519, -0.9374259, 1, 0, 0, 1, 1,
0.8939139, 0.3829718, 0.1105419, 1, 0, 0, 1, 1,
0.8956807, 0.1479333, 1.667221, 1, 0, 0, 1, 1,
0.8972647, 2.422507, -1.320802, 0, 0, 0, 1, 1,
0.8983488, -0.1933051, 3.125672, 0, 0, 0, 1, 1,
0.898887, 0.5860452, 1.409434, 0, 0, 0, 1, 1,
0.9053578, 0.6812848, 0.8457479, 0, 0, 0, 1, 1,
0.9100373, 1.68844, 1.394778, 0, 0, 0, 1, 1,
0.9228739, -1.374541, 1.741494, 0, 0, 0, 1, 1,
0.9230157, -2.009354, 2.953, 0, 0, 0, 1, 1,
0.9230691, 0.119129, 0.916846, 1, 1, 1, 1, 1,
0.9255043, -0.5341133, 2.568291, 1, 1, 1, 1, 1,
0.930577, 0.09938042, 1.510031, 1, 1, 1, 1, 1,
0.9411725, -1.190943, 3.534287, 1, 1, 1, 1, 1,
0.9515638, 2.069987, -0.7191104, 1, 1, 1, 1, 1,
0.9521973, -0.5595639, 1.374613, 1, 1, 1, 1, 1,
0.9554013, 0.2423721, 2.118438, 1, 1, 1, 1, 1,
0.95633, -1.733379, 1.82104, 1, 1, 1, 1, 1,
0.9568388, -2.097555, 3.961249, 1, 1, 1, 1, 1,
0.9578808, 0.05118864, 1.080486, 1, 1, 1, 1, 1,
0.9614071, 0.9493176, 0.7939013, 1, 1, 1, 1, 1,
0.9631566, -0.4117602, 1.875476, 1, 1, 1, 1, 1,
0.9718471, -0.8863711, 2.038498, 1, 1, 1, 1, 1,
0.972945, 0.3671505, 1.655584, 1, 1, 1, 1, 1,
0.973328, -0.690569, 0.871744, 1, 1, 1, 1, 1,
0.9866396, 0.5563565, 2.581412, 0, 0, 1, 1, 1,
0.9905945, 0.6031699, 1.884048, 1, 0, 0, 1, 1,
0.997587, 0.6502513, 0.8036898, 1, 0, 0, 1, 1,
0.9991916, -1.27203, 0.1597177, 1, 0, 0, 1, 1,
1.002249, -1.2545, 2.628361, 1, 0, 0, 1, 1,
1.006654, 0.5240693, 0.06964289, 1, 0, 0, 1, 1,
1.012625, -0.40074, 1.092385, 0, 0, 0, 1, 1,
1.01432, 1.19891, -0.1887843, 0, 0, 0, 1, 1,
1.019316, 0.664732, 1.716707, 0, 0, 0, 1, 1,
1.036052, 0.1253377, 3.570653, 0, 0, 0, 1, 1,
1.038069, -0.9453075, 0.6624429, 0, 0, 0, 1, 1,
1.041831, -0.1686842, 0.172564, 0, 0, 0, 1, 1,
1.042423, -0.3954015, 2.764784, 0, 0, 0, 1, 1,
1.050053, 0.03856164, -0.734014, 1, 1, 1, 1, 1,
1.062068, 0.6298544, 1.589956, 1, 1, 1, 1, 1,
1.069241, -0.6940868, 2.578253, 1, 1, 1, 1, 1,
1.071568, -0.08206011, 1.057707, 1, 1, 1, 1, 1,
1.092159, -1.577492, 2.750439, 1, 1, 1, 1, 1,
1.093212, 0.4883605, -1.755866, 1, 1, 1, 1, 1,
1.093363, -0.8896668, 3.435657, 1, 1, 1, 1, 1,
1.101015, -0.1954795, 0.6964272, 1, 1, 1, 1, 1,
1.118743, -1.073664, 2.816008, 1, 1, 1, 1, 1,
1.119925, -0.07710787, 0.8123291, 1, 1, 1, 1, 1,
1.125356, -0.3263335, 2.21018, 1, 1, 1, 1, 1,
1.125899, 0.6424263, 0.7039489, 1, 1, 1, 1, 1,
1.130321, 1.076426, -0.1355523, 1, 1, 1, 1, 1,
1.130917, 0.04359711, 2.345409, 1, 1, 1, 1, 1,
1.150676, 1.029433, 1.88149, 1, 1, 1, 1, 1,
1.154001, -2.068143, 3.040731, 0, 0, 1, 1, 1,
1.154587, 1.061697, -0.5076053, 1, 0, 0, 1, 1,
1.15624, 0.4145495, 1.379037, 1, 0, 0, 1, 1,
1.157893, -1.41599, 2.469499, 1, 0, 0, 1, 1,
1.158361, 0.8732878, -0.1537859, 1, 0, 0, 1, 1,
1.174782, 1.293129, -0.5116537, 1, 0, 0, 1, 1,
1.184854, 0.01024037, 1.222473, 0, 0, 0, 1, 1,
1.198585, -0.1876783, -0.3017073, 0, 0, 0, 1, 1,
1.200096, 0.1841799, 2.197891, 0, 0, 0, 1, 1,
1.202083, -0.0007683923, 0.8141546, 0, 0, 0, 1, 1,
1.205252, -1.007128, 1.93607, 0, 0, 0, 1, 1,
1.215976, -0.6553956, 2.289967, 0, 0, 0, 1, 1,
1.239716, -0.4239864, 3.012916, 0, 0, 0, 1, 1,
1.242477, 0.1200565, 0.005705548, 1, 1, 1, 1, 1,
1.262794, -0.8141098, 1.401479, 1, 1, 1, 1, 1,
1.264438, -1.70257, 3.495321, 1, 1, 1, 1, 1,
1.265564, 0.5237045, 0.7980419, 1, 1, 1, 1, 1,
1.269324, -2.40759, 1.763591, 1, 1, 1, 1, 1,
1.269764, 1.228629, 1.121072, 1, 1, 1, 1, 1,
1.272835, 0.0006190012, 3.39588, 1, 1, 1, 1, 1,
1.274374, -1.068786, 3.172442, 1, 1, 1, 1, 1,
1.276097, -0.4802776, 1.283566, 1, 1, 1, 1, 1,
1.288934, -0.566187, 2.939126, 1, 1, 1, 1, 1,
1.289604, 0.8970826, 0.7883489, 1, 1, 1, 1, 1,
1.298827, 0.17948, 1.894135, 1, 1, 1, 1, 1,
1.302542, 0.7613428, 1.383753, 1, 1, 1, 1, 1,
1.307556, -0.4158311, 2.213618, 1, 1, 1, 1, 1,
1.310718, 0.5854073, 0.3937171, 1, 1, 1, 1, 1,
1.312658, 0.478923, 1.529839, 0, 0, 1, 1, 1,
1.314643, 0.8261486, 0.9271594, 1, 0, 0, 1, 1,
1.32195, 1.039864, 2.187427, 1, 0, 0, 1, 1,
1.322581, -1.251541, 3.608438, 1, 0, 0, 1, 1,
1.322683, -0.2193694, 1.524743, 1, 0, 0, 1, 1,
1.330625, -0.9130961, 0.266858, 1, 0, 0, 1, 1,
1.332086, 0.4923016, 2.145087, 0, 0, 0, 1, 1,
1.332691, 0.1073578, 4.197035, 0, 0, 0, 1, 1,
1.33753, -0.8250945, 2.103463, 0, 0, 0, 1, 1,
1.337695, 0.7733333, 0.282838, 0, 0, 0, 1, 1,
1.338507, -0.5322187, 1.414588, 0, 0, 0, 1, 1,
1.34195, 0.3380696, 2.38418, 0, 0, 0, 1, 1,
1.355856, 0.1009611, 0.6528173, 0, 0, 0, 1, 1,
1.368653, -0.6244555, 4.543596, 1, 1, 1, 1, 1,
1.369502, -2.132118, 2.067708, 1, 1, 1, 1, 1,
1.382125, 0.7083967, 1.861139, 1, 1, 1, 1, 1,
1.384316, 0.1923491, 1.290263, 1, 1, 1, 1, 1,
1.396688, -0.4937081, 3.096828, 1, 1, 1, 1, 1,
1.397819, -1.124663, 1.947903, 1, 1, 1, 1, 1,
1.399447, 0.2517918, 1.952432, 1, 1, 1, 1, 1,
1.401361, -0.1398887, 2.427706, 1, 1, 1, 1, 1,
1.401937, -0.3660522, -0.4419566, 1, 1, 1, 1, 1,
1.403414, -0.8514752, 2.785342, 1, 1, 1, 1, 1,
1.416308, 0.5641949, -0.01637359, 1, 1, 1, 1, 1,
1.419079, 1.101335, 0.6580819, 1, 1, 1, 1, 1,
1.423243, 1.044084, 1.054502, 1, 1, 1, 1, 1,
1.425997, 0.8608086, 1.505199, 1, 1, 1, 1, 1,
1.437714, -0.5142939, 2.693824, 1, 1, 1, 1, 1,
1.437987, -0.2816072, 2.348195, 0, 0, 1, 1, 1,
1.464719, -0.7624494, 1.630305, 1, 0, 0, 1, 1,
1.479994, 0.2241424, 2.659669, 1, 0, 0, 1, 1,
1.502079, 0.5010671, 1.357297, 1, 0, 0, 1, 1,
1.51762, -2.925841, 3.958817, 1, 0, 0, 1, 1,
1.5183, 0.9065085, 0.8470492, 1, 0, 0, 1, 1,
1.522158, 0.2218083, 1.503328, 0, 0, 0, 1, 1,
1.5225, -0.2137017, 2.490224, 0, 0, 0, 1, 1,
1.541418, 0.2558246, -0.9006744, 0, 0, 0, 1, 1,
1.544984, -0.9037221, 2.203414, 0, 0, 0, 1, 1,
1.548461, 1.657841, 1.230234, 0, 0, 0, 1, 1,
1.572957, -0.7344572, 1.226885, 0, 0, 0, 1, 1,
1.575902, 2.037259, 3.072702, 0, 0, 0, 1, 1,
1.586562, 0.4676383, 1.883121, 1, 1, 1, 1, 1,
1.616452, 1.330392, -0.2570904, 1, 1, 1, 1, 1,
1.623997, -1.721626, 3.450156, 1, 1, 1, 1, 1,
1.629073, 0.273125, -0.4033277, 1, 1, 1, 1, 1,
1.629462, -0.2027465, 0.3104674, 1, 1, 1, 1, 1,
1.648063, -0.01654619, 2.395943, 1, 1, 1, 1, 1,
1.662776, 0.5705345, 1.423815, 1, 1, 1, 1, 1,
1.667667, -0.2024826, 1.605639, 1, 1, 1, 1, 1,
1.668986, -0.3613667, 2.25444, 1, 1, 1, 1, 1,
1.669068, -1.213968, 3.42012, 1, 1, 1, 1, 1,
1.670719, -2.040419, 2.723193, 1, 1, 1, 1, 1,
1.678042, -0.5102618, 3.036445, 1, 1, 1, 1, 1,
1.715221, 0.4197439, 2.533556, 1, 1, 1, 1, 1,
1.726102, -0.9707895, 2.118261, 1, 1, 1, 1, 1,
1.726286, -0.07644219, 3.095844, 1, 1, 1, 1, 1,
1.758323, 0.8307504, 0.3843729, 0, 0, 1, 1, 1,
1.764307, -0.0702586, 2.666842, 1, 0, 0, 1, 1,
1.76551, -0.6889722, 2.980808, 1, 0, 0, 1, 1,
1.770071, -1.177568, 3.160027, 1, 0, 0, 1, 1,
1.779658, 0.5064324, -0.01946985, 1, 0, 0, 1, 1,
1.77991, -0.4517333, 1.991044, 1, 0, 0, 1, 1,
1.780765, 0.5133783, 2.790256, 0, 0, 0, 1, 1,
1.782981, -0.1449593, 1.678631, 0, 0, 0, 1, 1,
1.792741, -0.7571768, 1.128738, 0, 0, 0, 1, 1,
1.805439, -1.657106, 2.23564, 0, 0, 0, 1, 1,
1.81596, 0.5594242, 2.448867, 0, 0, 0, 1, 1,
1.83663, -1.732864, 2.783463, 0, 0, 0, 1, 1,
1.840724, 0.8455169, 1.210944, 0, 0, 0, 1, 1,
1.844373, -2.2126, 0.4619278, 1, 1, 1, 1, 1,
1.875745, 0.2970242, 2.240072, 1, 1, 1, 1, 1,
1.929931, 1.503888, 2.616479, 1, 1, 1, 1, 1,
1.941622, 0.9795672, -0.9278848, 1, 1, 1, 1, 1,
1.94222, 0.6500736, 1.196516, 1, 1, 1, 1, 1,
1.973992, -1.033272, 0.5336066, 1, 1, 1, 1, 1,
1.976151, 0.9106781, 1.528124, 1, 1, 1, 1, 1,
1.99289, -0.2884775, 1.998726, 1, 1, 1, 1, 1,
2.01459, 0.2423005, 1.317095, 1, 1, 1, 1, 1,
2.021614, 0.1748496, -1.375245, 1, 1, 1, 1, 1,
2.031184, -2.661025, 1.437029, 1, 1, 1, 1, 1,
2.035763, -1.368208, 1.202165, 1, 1, 1, 1, 1,
2.048298, -0.3998155, 2.708791, 1, 1, 1, 1, 1,
2.049963, -0.03660506, 2.090021, 1, 1, 1, 1, 1,
2.055223, -1.495191, 0.6064224, 1, 1, 1, 1, 1,
2.061124, 1.194203, 0.7364558, 0, 0, 1, 1, 1,
2.06853, -2.372553, 1.394216, 1, 0, 0, 1, 1,
2.094459, 1.095445, 0.4074993, 1, 0, 0, 1, 1,
2.122058, 0.5420653, 1.101986, 1, 0, 0, 1, 1,
2.146026, -0.663055, 2.14382, 1, 0, 0, 1, 1,
2.157961, 1.069867, 3.100442, 1, 0, 0, 1, 1,
2.162044, 1.371968, -0.07399654, 0, 0, 0, 1, 1,
2.193708, 0.3638188, 1.425618, 0, 0, 0, 1, 1,
2.198549, -0.8017684, 1.538619, 0, 0, 0, 1, 1,
2.280687, -0.6424639, 1.628921, 0, 0, 0, 1, 1,
2.335803, -1.26559, 2.013077, 0, 0, 0, 1, 1,
2.407073, -1.358234, 2.124496, 0, 0, 0, 1, 1,
2.515265, 0.2791028, 1.994739, 0, 0, 0, 1, 1,
2.620345, -0.4024951, 1.816967, 1, 1, 1, 1, 1,
2.685418, 0.4437286, 2.043408, 1, 1, 1, 1, 1,
2.812203, 0.4466604, 0.7094064, 1, 1, 1, 1, 1,
2.969441, -0.06074408, 1.974677, 1, 1, 1, 1, 1,
3.251425, 1.095356, 1.570636, 1, 1, 1, 1, 1,
3.336134, -1.473845, 2.920391, 1, 1, 1, 1, 1,
3.833291, 0.1063714, 0.5556526, 1, 1, 1, 1, 1
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
var radius = 9.484919;
var distance = 33.31538;
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
mvMatrix.translate( -0.4279293, 0.005581379, -0.2184238 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31538);
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