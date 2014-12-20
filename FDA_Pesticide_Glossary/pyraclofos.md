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
-2.677816, 1.000263, -2.006108, 1, 0, 0, 1,
-2.620258, -0.557978, -0.1916348, 1, 0.007843138, 0, 1,
-2.58627, 0.07412343, -0.6915814, 1, 0.01176471, 0, 1,
-2.496401, -2.142962, -3.358427, 1, 0.01960784, 0, 1,
-2.413173, -0.06048492, -2.666361, 1, 0.02352941, 0, 1,
-2.410322, -0.83963, -2.5829, 1, 0.03137255, 0, 1,
-2.396452, -1.489313, -3.894108, 1, 0.03529412, 0, 1,
-2.393435, -0.7372693, -2.037917, 1, 0.04313726, 0, 1,
-2.387334, -0.007076384, -1.008528, 1, 0.04705882, 0, 1,
-2.381031, -1.081143, -1.917956, 1, 0.05490196, 0, 1,
-2.350947, 2.400864, -2.706206, 1, 0.05882353, 0, 1,
-2.308788, 0.2427173, -0.7358934, 1, 0.06666667, 0, 1,
-2.264789, -1.217702, -3.486682, 1, 0.07058824, 0, 1,
-2.217218, -0.04726122, -1.269152, 1, 0.07843138, 0, 1,
-2.155851, 0.01234995, -1.116792, 1, 0.08235294, 0, 1,
-2.152651, -0.08754477, -1.96656, 1, 0.09019608, 0, 1,
-2.151502, -0.1766369, -1.660621, 1, 0.09411765, 0, 1,
-2.147186, 0.2010766, -2.535132, 1, 0.1019608, 0, 1,
-2.140711, -1.644562, -1.794111, 1, 0.1098039, 0, 1,
-2.130908, 0.2885768, -2.807713, 1, 0.1137255, 0, 1,
-2.059473, 0.0931796, -0.3419379, 1, 0.1215686, 0, 1,
-2.025584, -1.165283, -2.347976, 1, 0.1254902, 0, 1,
-1.989067, 0.01245998, -1.080738, 1, 0.1333333, 0, 1,
-1.955511, -0.6333994, -0.7633394, 1, 0.1372549, 0, 1,
-1.955153, 0.09227734, -2.825765, 1, 0.145098, 0, 1,
-1.946166, 0.2116227, -1.89157, 1, 0.1490196, 0, 1,
-1.946071, 0.4731491, 0.6019012, 1, 0.1568628, 0, 1,
-1.925398, 0.01597152, -1.807814, 1, 0.1607843, 0, 1,
-1.914673, 1.400879, 0.138199, 1, 0.1686275, 0, 1,
-1.912045, -0.5050717, -2.821492, 1, 0.172549, 0, 1,
-1.90393, 0.6442993, -0.07359376, 1, 0.1803922, 0, 1,
-1.889433, 1.215734, -2.346831, 1, 0.1843137, 0, 1,
-1.871321, 0.8815745, -2.279742, 1, 0.1921569, 0, 1,
-1.868384, 0.5815639, 0.2721546, 1, 0.1960784, 0, 1,
-1.834316, -0.2730848, -2.356952, 1, 0.2039216, 0, 1,
-1.818873, 0.1044842, -2.378428, 1, 0.2117647, 0, 1,
-1.764522, -0.0278944, -1.413998, 1, 0.2156863, 0, 1,
-1.740256, 0.278447, -1.552678, 1, 0.2235294, 0, 1,
-1.737168, -1.102978, -0.6562183, 1, 0.227451, 0, 1,
-1.728671, 1.47807, -2.593154, 1, 0.2352941, 0, 1,
-1.723627, -0.9791421, -2.426763, 1, 0.2392157, 0, 1,
-1.707619, 2.132585, -0.7383274, 1, 0.2470588, 0, 1,
-1.691232, 0.3074137, -2.274055, 1, 0.2509804, 0, 1,
-1.689381, 0.1464322, -4.236922, 1, 0.2588235, 0, 1,
-1.668235, 0.0953606, -3.32815, 1, 0.2627451, 0, 1,
-1.664859, -1.54131, -1.51591, 1, 0.2705882, 0, 1,
-1.664482, 2.287059, 0.09004273, 1, 0.2745098, 0, 1,
-1.646334, 0.5656513, -1.113813, 1, 0.282353, 0, 1,
-1.645133, -1.079991, -2.622002, 1, 0.2862745, 0, 1,
-1.642107, -1.294461, -2.24418, 1, 0.2941177, 0, 1,
-1.628649, 0.1944126, -0.6141173, 1, 0.3019608, 0, 1,
-1.623361, 1.43151, -1.357614, 1, 0.3058824, 0, 1,
-1.621332, 2.740151, 1.169466, 1, 0.3137255, 0, 1,
-1.621079, -0.8568092, -2.598889, 1, 0.3176471, 0, 1,
-1.595802, -0.5156314, -1.462297, 1, 0.3254902, 0, 1,
-1.582879, 0.7673611, -0.1152568, 1, 0.3294118, 0, 1,
-1.582329, -0.8794348, -1.954659, 1, 0.3372549, 0, 1,
-1.566383, 0.8724542, -2.410069, 1, 0.3411765, 0, 1,
-1.556252, -1.981407, -5.282092, 1, 0.3490196, 0, 1,
-1.549085, -0.7119859, -2.031817, 1, 0.3529412, 0, 1,
-1.53491, 0.3758182, -1.510185, 1, 0.3607843, 0, 1,
-1.522917, -0.4535199, -0.5831252, 1, 0.3647059, 0, 1,
-1.521325, 0.396913, -0.4583946, 1, 0.372549, 0, 1,
-1.508576, 0.6711432, -1.274831, 1, 0.3764706, 0, 1,
-1.503206, -1.126974, -0.3413286, 1, 0.3843137, 0, 1,
-1.501907, 1.326079, -0.7594157, 1, 0.3882353, 0, 1,
-1.491215, -0.1381088, -1.768853, 1, 0.3960784, 0, 1,
-1.478204, -1.124269, -2.299602, 1, 0.4039216, 0, 1,
-1.471436, -0.001489459, -1.389793, 1, 0.4078431, 0, 1,
-1.465256, -1.214053, -0.9284881, 1, 0.4156863, 0, 1,
-1.456333, 0.8468053, -0.6315161, 1, 0.4196078, 0, 1,
-1.435787, -0.9833752, -4.867841, 1, 0.427451, 0, 1,
-1.425805, 0.541002, -0.6974866, 1, 0.4313726, 0, 1,
-1.414234, -0.6877528, -0.02085859, 1, 0.4392157, 0, 1,
-1.377474, 0.8700542, -0.1396615, 1, 0.4431373, 0, 1,
-1.353859, -1.398332, -3.013121, 1, 0.4509804, 0, 1,
-1.349779, -0.9476831, -1.004505, 1, 0.454902, 0, 1,
-1.34607, 0.8340354, 0.09908897, 1, 0.4627451, 0, 1,
-1.343516, -1.799145, -2.891658, 1, 0.4666667, 0, 1,
-1.336063, -1.685613, -1.877586, 1, 0.4745098, 0, 1,
-1.329622, 2.246789, -0.2501975, 1, 0.4784314, 0, 1,
-1.32941, -1.096118, -1.183496, 1, 0.4862745, 0, 1,
-1.329223, 0.2412348, -1.0582, 1, 0.4901961, 0, 1,
-1.32689, -0.08238961, -3.205023, 1, 0.4980392, 0, 1,
-1.320545, -0.3976512, -1.441806, 1, 0.5058824, 0, 1,
-1.317128, 0.844291, -1.637181, 1, 0.509804, 0, 1,
-1.314652, 0.9357383, 0.4146545, 1, 0.5176471, 0, 1,
-1.302457, -0.01091109, -1.436414, 1, 0.5215687, 0, 1,
-1.28265, 0.1126056, -1.447134, 1, 0.5294118, 0, 1,
-1.270902, 0.3810191, -0.1276187, 1, 0.5333334, 0, 1,
-1.26893, 1.206655, -0.5112264, 1, 0.5411765, 0, 1,
-1.267953, -1.27818, -2.52055, 1, 0.5450981, 0, 1,
-1.264668, -0.3237754, -1.491094, 1, 0.5529412, 0, 1,
-1.250929, -0.6256046, -3.110598, 1, 0.5568628, 0, 1,
-1.245034, 0.3767411, -0.8194819, 1, 0.5647059, 0, 1,
-1.237362, -0.6204955, -1.835798, 1, 0.5686275, 0, 1,
-1.234143, 1.127909, -1.678589, 1, 0.5764706, 0, 1,
-1.234093, -0.07673107, -2.816706, 1, 0.5803922, 0, 1,
-1.229964, 0.5867378, -1.181486, 1, 0.5882353, 0, 1,
-1.221996, -1.09045, -1.070292, 1, 0.5921569, 0, 1,
-1.213467, -1.088043, -3.802516, 1, 0.6, 0, 1,
-1.210831, -0.7490097, -2.904918, 1, 0.6078432, 0, 1,
-1.200607, -0.9601166, -2.132775, 1, 0.6117647, 0, 1,
-1.199836, -0.1588976, -2.490022, 1, 0.6196079, 0, 1,
-1.196282, -1.52544, -3.478141, 1, 0.6235294, 0, 1,
-1.187718, 0.7679622, -2.180181, 1, 0.6313726, 0, 1,
-1.167471, -0.4723209, -1.931523, 1, 0.6352941, 0, 1,
-1.165156, -1.341352, -1.852257, 1, 0.6431373, 0, 1,
-1.161684, 0.1212251, -1.540949, 1, 0.6470588, 0, 1,
-1.159712, -0.2699452, -3.766037, 1, 0.654902, 0, 1,
-1.152204, -0.06994586, -2.050117, 1, 0.6588235, 0, 1,
-1.147828, 1.301224, 0.2601595, 1, 0.6666667, 0, 1,
-1.146376, -0.6517276, -0.7427127, 1, 0.6705883, 0, 1,
-1.144998, 0.3860638, -1.198929, 1, 0.6784314, 0, 1,
-1.134881, 0.7189486, -3.22479, 1, 0.682353, 0, 1,
-1.132035, -0.3702172, -2.430102, 1, 0.6901961, 0, 1,
-1.127705, 1.84417, 1.034307, 1, 0.6941177, 0, 1,
-1.11871, -0.947811, -3.26966, 1, 0.7019608, 0, 1,
-1.114026, -0.5365596, -3.01647, 1, 0.7098039, 0, 1,
-1.111331, 1.406627, -0.1833563, 1, 0.7137255, 0, 1,
-1.105775, 0.3842849, -1.013767, 1, 0.7215686, 0, 1,
-1.103248, -0.1226816, -1.928146, 1, 0.7254902, 0, 1,
-1.102317, 1.822204, -1.915329, 1, 0.7333333, 0, 1,
-1.096956, -0.253584, -0.2053672, 1, 0.7372549, 0, 1,
-1.095527, 0.9228497, -0.6461981, 1, 0.7450981, 0, 1,
-1.093632, 0.7432137, -1.15346, 1, 0.7490196, 0, 1,
-1.093428, -0.3501813, -4.137189, 1, 0.7568628, 0, 1,
-1.086723, 0.9000574, -0.1015787, 1, 0.7607843, 0, 1,
-1.086241, 1.160579, -0.2018476, 1, 0.7686275, 0, 1,
-1.081686, -2.215989, -3.695334, 1, 0.772549, 0, 1,
-1.078698, 2.357785, -0.1843018, 1, 0.7803922, 0, 1,
-1.075329, -0.2538563, -2.010653, 1, 0.7843137, 0, 1,
-1.074393, -1.353178, -1.993582, 1, 0.7921569, 0, 1,
-1.072712, -0.8089557, -3.606955, 1, 0.7960784, 0, 1,
-1.067407, 1.591385, 0.8309253, 1, 0.8039216, 0, 1,
-1.066606, 1.576697, -2.08288, 1, 0.8117647, 0, 1,
-1.06638, -1.070182, -1.303068, 1, 0.8156863, 0, 1,
-1.065718, -0.1495174, -1.521016, 1, 0.8235294, 0, 1,
-1.057028, -0.1446862, -2.879572, 1, 0.827451, 0, 1,
-1.056635, 1.513949, -1.223058, 1, 0.8352941, 0, 1,
-1.047727, -0.17162, -1.508341, 1, 0.8392157, 0, 1,
-1.032165, -1.918981, -2.138823, 1, 0.8470588, 0, 1,
-1.026274, 1.357179, -0.4480451, 1, 0.8509804, 0, 1,
-1.02385, 0.6781379, 0.2255193, 1, 0.8588235, 0, 1,
-1.02154, -2.178653, -2.271582, 1, 0.8627451, 0, 1,
-1.015847, -2.296166, -2.704776, 1, 0.8705882, 0, 1,
-1.013135, -1.229014, -3.733217, 1, 0.8745098, 0, 1,
-1.012078, -1.02703, -1.537186, 1, 0.8823529, 0, 1,
-1.008985, 0.7679608, -0.8793226, 1, 0.8862745, 0, 1,
-1.005089, 0.1300894, -2.98781, 1, 0.8941177, 0, 1,
-1.00284, -0.6127819, -1.506723, 1, 0.8980392, 0, 1,
-0.9898866, 0.2707708, -0.5001453, 1, 0.9058824, 0, 1,
-0.9827194, -0.7462478, 0.02279636, 1, 0.9137255, 0, 1,
-0.9825128, 0.08614577, -1.800355, 1, 0.9176471, 0, 1,
-0.9811183, 1.376064, 0.5214015, 1, 0.9254902, 0, 1,
-0.9807047, 0.9320101, -1.341838, 1, 0.9294118, 0, 1,
-0.9791973, -2.063553, -2.724894, 1, 0.9372549, 0, 1,
-0.9764856, 0.6992121, -0.4567523, 1, 0.9411765, 0, 1,
-0.9763355, 1.014334, -1.177876, 1, 0.9490196, 0, 1,
-0.9762098, 0.3400501, -0.21114, 1, 0.9529412, 0, 1,
-0.9762061, -0.6485531, -2.261348, 1, 0.9607843, 0, 1,
-0.9754593, -0.1433148, -2.819643, 1, 0.9647059, 0, 1,
-0.9667307, -1.379098, -3.515332, 1, 0.972549, 0, 1,
-0.9653624, 1.203516, -0.7360966, 1, 0.9764706, 0, 1,
-0.9638044, -1.351742, -0.6840405, 1, 0.9843137, 0, 1,
-0.9621676, -0.1985413, -1.664566, 1, 0.9882353, 0, 1,
-0.9574756, -0.7648833, -3.961493, 1, 0.9960784, 0, 1,
-0.9572036, -2.232742, -1.93361, 0.9960784, 1, 0, 1,
-0.9555658, -0.6723432, -0.1275465, 0.9921569, 1, 0, 1,
-0.9549593, 0.01742382, -0.4647229, 0.9843137, 1, 0, 1,
-0.9535009, -0.3363094, -0.3891159, 0.9803922, 1, 0, 1,
-0.9465647, -0.07106862, -1.341006, 0.972549, 1, 0, 1,
-0.938902, 1.11775, -0.02565923, 0.9686275, 1, 0, 1,
-0.937651, -0.04692098, -1.238526, 0.9607843, 1, 0, 1,
-0.9362546, 2.285006, 1.178501, 0.9568627, 1, 0, 1,
-0.9342449, 0.5396808, 0.6223671, 0.9490196, 1, 0, 1,
-0.9191156, -0.9936153, -1.010679, 0.945098, 1, 0, 1,
-0.9182584, 0.7788917, -2.08961, 0.9372549, 1, 0, 1,
-0.9165263, -0.2662172, -1.651137, 0.9333333, 1, 0, 1,
-0.914215, -0.1477367, -1.298095, 0.9254902, 1, 0, 1,
-0.9133272, 0.8963179, -2.663476, 0.9215686, 1, 0, 1,
-0.9065999, -0.7671453, -2.298092, 0.9137255, 1, 0, 1,
-0.9011592, 0.8830544, 0.0290495, 0.9098039, 1, 0, 1,
-0.8973823, 0.7013123, -1.420686, 0.9019608, 1, 0, 1,
-0.8955721, -1.122325, -2.077368, 0.8941177, 1, 0, 1,
-0.8891421, 0.8617767, 0.1055671, 0.8901961, 1, 0, 1,
-0.8866222, 1.226921, -0.2428667, 0.8823529, 1, 0, 1,
-0.88631, -1.580054, -3.711379, 0.8784314, 1, 0, 1,
-0.8839336, -0.6253844, -2.106287, 0.8705882, 1, 0, 1,
-0.8835741, 0.996902, -1.057819, 0.8666667, 1, 0, 1,
-0.8822962, -1.328496, -4.069091, 0.8588235, 1, 0, 1,
-0.8682922, 2.116671, -0.6036132, 0.854902, 1, 0, 1,
-0.8676848, -0.999292, -1.602234, 0.8470588, 1, 0, 1,
-0.8598849, 0.5576056, -2.069892, 0.8431373, 1, 0, 1,
-0.8573049, 0.7097188, -1.806136, 0.8352941, 1, 0, 1,
-0.8571777, 0.4256935, -1.10502, 0.8313726, 1, 0, 1,
-0.8501089, -0.4420094, -2.998333, 0.8235294, 1, 0, 1,
-0.845983, -1.837455, -2.911714, 0.8196079, 1, 0, 1,
-0.8413141, 1.650557, -0.2651239, 0.8117647, 1, 0, 1,
-0.8410305, 0.1109832, -1.627863, 0.8078431, 1, 0, 1,
-0.8402297, 0.5219601, -0.6756723, 0.8, 1, 0, 1,
-0.8384188, 0.681644, 0.1085874, 0.7921569, 1, 0, 1,
-0.8369774, -1.523641, -1.543848, 0.7882353, 1, 0, 1,
-0.8344789, 1.044416, -1.148139, 0.7803922, 1, 0, 1,
-0.8241062, 0.7028355, -1.825806, 0.7764706, 1, 0, 1,
-0.8081002, 0.03333138, -1.941791, 0.7686275, 1, 0, 1,
-0.8022543, 0.7133636, -1.399198, 0.7647059, 1, 0, 1,
-0.7996488, -1.160302, 0.6804563, 0.7568628, 1, 0, 1,
-0.7955065, 1.398717, -0.1239419, 0.7529412, 1, 0, 1,
-0.7920974, 0.2149817, -0.9722502, 0.7450981, 1, 0, 1,
-0.7851769, -0.7644467, -2.313795, 0.7411765, 1, 0, 1,
-0.7851717, 0.2293833, -1.448602, 0.7333333, 1, 0, 1,
-0.77606, -2.335694, -3.337323, 0.7294118, 1, 0, 1,
-0.7654787, 0.06193307, -1.299157, 0.7215686, 1, 0, 1,
-0.7644489, 2.123092, 1.048288, 0.7176471, 1, 0, 1,
-0.7602444, -2.402411, -2.425562, 0.7098039, 1, 0, 1,
-0.7600471, -1.322558, 0.1078861, 0.7058824, 1, 0, 1,
-0.7595359, -0.4361167, -1.861517, 0.6980392, 1, 0, 1,
-0.7585191, 0.9910357, 0.3134177, 0.6901961, 1, 0, 1,
-0.757157, 1.727683, -0.3414883, 0.6862745, 1, 0, 1,
-0.7564362, 0.0668212, -0.480289, 0.6784314, 1, 0, 1,
-0.7539368, -0.8876764, -4.620181, 0.6745098, 1, 0, 1,
-0.7521095, 0.9749539, -1.892751, 0.6666667, 1, 0, 1,
-0.7485597, -1.857492, -1.940533, 0.6627451, 1, 0, 1,
-0.7417564, 1.962841, -1.163092, 0.654902, 1, 0, 1,
-0.7411516, 0.5074483, -0.3633901, 0.6509804, 1, 0, 1,
-0.7388287, 1.215181, -1.001459, 0.6431373, 1, 0, 1,
-0.7325644, 0.5741172, -0.2561754, 0.6392157, 1, 0, 1,
-0.7292892, 0.02778379, -2.759894, 0.6313726, 1, 0, 1,
-0.7285317, -2.44737, -2.8036, 0.627451, 1, 0, 1,
-0.7227898, -0.4620442, -1.302616, 0.6196079, 1, 0, 1,
-0.7224019, -1.140932, -3.315565, 0.6156863, 1, 0, 1,
-0.7151718, 1.654211, 0.8956297, 0.6078432, 1, 0, 1,
-0.7138066, 1.384816, 0.9325898, 0.6039216, 1, 0, 1,
-0.7096001, -1.187716, -2.389029, 0.5960785, 1, 0, 1,
-0.7076737, -1.015083, -3.062394, 0.5882353, 1, 0, 1,
-0.7039893, -0.04877869, -1.569215, 0.5843138, 1, 0, 1,
-0.7030033, -1.571827, -2.568082, 0.5764706, 1, 0, 1,
-0.7024249, 1.216847, 0.0270234, 0.572549, 1, 0, 1,
-0.7007902, -0.7360982, -1.598542, 0.5647059, 1, 0, 1,
-0.6779099, -0.8494778, -3.26399, 0.5607843, 1, 0, 1,
-0.6767441, -0.1015943, -2.406991, 0.5529412, 1, 0, 1,
-0.6764805, -0.1028443, -1.00079, 0.5490196, 1, 0, 1,
-0.6764506, -0.2845788, -2.81944, 0.5411765, 1, 0, 1,
-0.6710044, -0.3404326, -2.319098, 0.5372549, 1, 0, 1,
-0.6684092, 0.7931785, 0.2530328, 0.5294118, 1, 0, 1,
-0.6659912, 0.9203417, 0.4868945, 0.5254902, 1, 0, 1,
-0.6613064, -0.07375583, -1.875572, 0.5176471, 1, 0, 1,
-0.652052, 0.6637384, -2.974783, 0.5137255, 1, 0, 1,
-0.6504729, -0.7181525, -2.961215, 0.5058824, 1, 0, 1,
-0.6436899, -0.006377154, -1.122371, 0.5019608, 1, 0, 1,
-0.6401821, 0.6390026, -0.1438854, 0.4941176, 1, 0, 1,
-0.6392266, -0.2901441, -1.357338, 0.4862745, 1, 0, 1,
-0.6321093, 1.348555, 0.3957558, 0.4823529, 1, 0, 1,
-0.629098, 0.2258753, -0.3592686, 0.4745098, 1, 0, 1,
-0.6263705, -0.238064, -3.384994, 0.4705882, 1, 0, 1,
-0.6251497, -1.218855, -3.164686, 0.4627451, 1, 0, 1,
-0.6249237, 0.4992127, -1.25949, 0.4588235, 1, 0, 1,
-0.6207507, -0.5551263, -2.191832, 0.4509804, 1, 0, 1,
-0.6189349, -1.227465, -1.524337, 0.4470588, 1, 0, 1,
-0.6156985, 2.280287, 0.2323377, 0.4392157, 1, 0, 1,
-0.6155122, -1.720717, -4.348157, 0.4352941, 1, 0, 1,
-0.6151995, -0.281863, -3.071758, 0.427451, 1, 0, 1,
-0.6138791, 0.1052453, -1.439929, 0.4235294, 1, 0, 1,
-0.6133186, -1.786441, -2.747373, 0.4156863, 1, 0, 1,
-0.6088686, 0.05237373, -0.6634511, 0.4117647, 1, 0, 1,
-0.5923886, 0.554117, -0.6895498, 0.4039216, 1, 0, 1,
-0.5918328, -0.4318264, -0.5963831, 0.3960784, 1, 0, 1,
-0.5911561, -0.1543957, -1.796306, 0.3921569, 1, 0, 1,
-0.5903839, 0.9342227, -0.04622935, 0.3843137, 1, 0, 1,
-0.5896518, 2.384111, -0.29123, 0.3803922, 1, 0, 1,
-0.5875389, 1.171418, -0.843419, 0.372549, 1, 0, 1,
-0.5827057, 0.09948312, -2.742091, 0.3686275, 1, 0, 1,
-0.5623323, 0.6674141, -0.3432969, 0.3607843, 1, 0, 1,
-0.553748, -0.4484198, -3.411637, 0.3568628, 1, 0, 1,
-0.5518276, -1.60632, -3.140663, 0.3490196, 1, 0, 1,
-0.5489239, -0.3589325, -2.119868, 0.345098, 1, 0, 1,
-0.5461186, 1.616255, -0.5448185, 0.3372549, 1, 0, 1,
-0.5460629, -1.968481, -2.234968, 0.3333333, 1, 0, 1,
-0.5425851, 0.6857425, -1.74048, 0.3254902, 1, 0, 1,
-0.5419704, 0.01941282, -2.467843, 0.3215686, 1, 0, 1,
-0.5402895, 0.8656448, -0.9289876, 0.3137255, 1, 0, 1,
-0.5395661, -0.27455, -2.859613, 0.3098039, 1, 0, 1,
-0.5329084, 0.8071851, -1.459344, 0.3019608, 1, 0, 1,
-0.5328065, -0.9764334, -2.173619, 0.2941177, 1, 0, 1,
-0.5325292, 0.1717041, -1.7256, 0.2901961, 1, 0, 1,
-0.5283988, 0.06413931, -0.9478922, 0.282353, 1, 0, 1,
-0.523291, -0.5934127, -3.767469, 0.2784314, 1, 0, 1,
-0.5227394, -0.4137866, -1.679124, 0.2705882, 1, 0, 1,
-0.5223361, -1.247395, -1.908532, 0.2666667, 1, 0, 1,
-0.5211782, 1.12151, -0.7016211, 0.2588235, 1, 0, 1,
-0.519963, -0.7115982, -2.498273, 0.254902, 1, 0, 1,
-0.5193257, 0.3904586, 0.428545, 0.2470588, 1, 0, 1,
-0.5176361, 1.582435, -0.5369523, 0.2431373, 1, 0, 1,
-0.517109, -1.167072, -1.66292, 0.2352941, 1, 0, 1,
-0.5108205, -0.6890458, -2.117631, 0.2313726, 1, 0, 1,
-0.5063938, -0.8909873, -1.813383, 0.2235294, 1, 0, 1,
-0.5061159, -0.6222616, -2.531928, 0.2196078, 1, 0, 1,
-0.5038345, 2.324219, 0.7526295, 0.2117647, 1, 0, 1,
-0.5032022, 0.6632212, -0.07120684, 0.2078431, 1, 0, 1,
-0.5004393, 2.258111, 0.6097274, 0.2, 1, 0, 1,
-0.5001221, -1.403883, -2.989609, 0.1921569, 1, 0, 1,
-0.4968173, 0.5889088, 0.1910483, 0.1882353, 1, 0, 1,
-0.495386, 1.725803, -1.903146, 0.1803922, 1, 0, 1,
-0.4948349, 1.143506, 0.2517163, 0.1764706, 1, 0, 1,
-0.4867406, 0.406418, 0.09542236, 0.1686275, 1, 0, 1,
-0.4856316, 1.08923, -0.09002935, 0.1647059, 1, 0, 1,
-0.4851186, 0.003080488, -0.8244751, 0.1568628, 1, 0, 1,
-0.4806358, 1.898734, -0.2274306, 0.1529412, 1, 0, 1,
-0.4799334, -0.2336916, -2.153063, 0.145098, 1, 0, 1,
-0.4787156, -0.9267406, -1.442949, 0.1411765, 1, 0, 1,
-0.4776904, 0.294152, -1.700933, 0.1333333, 1, 0, 1,
-0.4769823, 0.3148518, -1.146454, 0.1294118, 1, 0, 1,
-0.4716462, -1.565006, -3.262041, 0.1215686, 1, 0, 1,
-0.4681774, -0.2130006, -2.578655, 0.1176471, 1, 0, 1,
-0.4674085, -0.834728, -2.676823, 0.1098039, 1, 0, 1,
-0.4668668, 0.9593699, -1.140274, 0.1058824, 1, 0, 1,
-0.4667661, -1.087396, -2.726244, 0.09803922, 1, 0, 1,
-0.4662766, 0.629256, 1.818812, 0.09019608, 1, 0, 1,
-0.4655057, 1.425039, -0.1536997, 0.08627451, 1, 0, 1,
-0.4585779, -0.2917317, -3.077482, 0.07843138, 1, 0, 1,
-0.4569191, -1.257539, -2.99147, 0.07450981, 1, 0, 1,
-0.456277, 0.2056666, -1.612371, 0.06666667, 1, 0, 1,
-0.4540949, -1.969512, -3.380034, 0.0627451, 1, 0, 1,
-0.4517776, -0.7724344, -2.88328, 0.05490196, 1, 0, 1,
-0.451693, -1.835944, -1.942605, 0.05098039, 1, 0, 1,
-0.4470769, 1.17289, 0.9863969, 0.04313726, 1, 0, 1,
-0.4422835, 1.239149, 0.6030008, 0.03921569, 1, 0, 1,
-0.4385133, 0.1999406, 0.3702525, 0.03137255, 1, 0, 1,
-0.4376952, 0.4873811, -1.000425, 0.02745098, 1, 0, 1,
-0.4346332, 0.02493074, -1.779735, 0.01960784, 1, 0, 1,
-0.4307507, 1.468979, -1.338545, 0.01568628, 1, 0, 1,
-0.429848, -1.084394, -2.410085, 0.007843138, 1, 0, 1,
-0.4232123, -1.226224, -2.603283, 0.003921569, 1, 0, 1,
-0.4221182, 0.8210623, -1.001563, 0, 1, 0.003921569, 1,
-0.420006, -1.051719, -2.92579, 0, 1, 0.01176471, 1,
-0.4169267, -1.848672, -2.133554, 0, 1, 0.01568628, 1,
-0.4165721, 0.210123, -0.9656796, 0, 1, 0.02352941, 1,
-0.4125871, -0.9793578, -2.604491, 0, 1, 0.02745098, 1,
-0.4102928, 0.7660332, -0.6533036, 0, 1, 0.03529412, 1,
-0.3995675, -0.3596565, -3.008271, 0, 1, 0.03921569, 1,
-0.3986166, -0.7570878, -3.360275, 0, 1, 0.04705882, 1,
-0.3983013, 2.822136, 0.8375975, 0, 1, 0.05098039, 1,
-0.3982094, -0.7484606, -3.40484, 0, 1, 0.05882353, 1,
-0.3966854, 1.920065, -0.5263757, 0, 1, 0.0627451, 1,
-0.3949142, 0.9743955, -0.4008522, 0, 1, 0.07058824, 1,
-0.3892236, -0.09069546, -1.792819, 0, 1, 0.07450981, 1,
-0.3879619, 1.54755, -1.502038, 0, 1, 0.08235294, 1,
-0.3873494, 0.7398993, 0.8646897, 0, 1, 0.08627451, 1,
-0.3871292, -0.8740771, -2.002366, 0, 1, 0.09411765, 1,
-0.385813, -0.7597207, -1.374382, 0, 1, 0.1019608, 1,
-0.3756041, -0.2948015, -2.584955, 0, 1, 0.1058824, 1,
-0.3742804, -0.8860994, -3.211385, 0, 1, 0.1137255, 1,
-0.3730718, -0.7519227, -2.669148, 0, 1, 0.1176471, 1,
-0.3634054, -0.004186112, -1.124012, 0, 1, 0.1254902, 1,
-0.3599833, -1.080438, -0.8794684, 0, 1, 0.1294118, 1,
-0.3556639, 0.595829, 0.9631419, 0, 1, 0.1372549, 1,
-0.3523972, -0.2436755, -1.765651, 0, 1, 0.1411765, 1,
-0.3502051, 2.049196, -2.366817, 0, 1, 0.1490196, 1,
-0.3417845, 0.2380903, -2.618999, 0, 1, 0.1529412, 1,
-0.3389104, 0.5240474, -0.09649646, 0, 1, 0.1607843, 1,
-0.3352264, 0.3799985, -0.7171524, 0, 1, 0.1647059, 1,
-0.3323987, 0.6075696, -0.7784334, 0, 1, 0.172549, 1,
-0.3289457, 2.300654, 0.09638013, 0, 1, 0.1764706, 1,
-0.3287927, 0.1288567, -1.277599, 0, 1, 0.1843137, 1,
-0.3260141, -1.195848, -1.336604, 0, 1, 0.1882353, 1,
-0.3220496, -0.7082351, -3.925066, 0, 1, 0.1960784, 1,
-0.3217689, -0.3907147, -3.027426, 0, 1, 0.2039216, 1,
-0.321164, -0.2819611, -3.495429, 0, 1, 0.2078431, 1,
-0.3169428, -2.130976, -4.164621, 0, 1, 0.2156863, 1,
-0.31495, 0.340248, -0.2213125, 0, 1, 0.2196078, 1,
-0.3122897, 0.2684332, 0.3209945, 0, 1, 0.227451, 1,
-0.3060829, -0.09572737, -0.9820509, 0, 1, 0.2313726, 1,
-0.3039776, -1.222021, -3.060909, 0, 1, 0.2392157, 1,
-0.2946947, -0.4023888, -2.767413, 0, 1, 0.2431373, 1,
-0.2924908, 0.6134204, 0.4309164, 0, 1, 0.2509804, 1,
-0.2894643, 0.5656461, 0.6986584, 0, 1, 0.254902, 1,
-0.2880104, 1.07792, 0.7877331, 0, 1, 0.2627451, 1,
-0.2865417, -1.454722, -2.775124, 0, 1, 0.2666667, 1,
-0.284839, 1.366985, 0.02913062, 0, 1, 0.2745098, 1,
-0.2818517, 0.07561541, -0.4856588, 0, 1, 0.2784314, 1,
-0.2783994, -0.4432283, -3.378821, 0, 1, 0.2862745, 1,
-0.2780519, -2.762581, -3.901263, 0, 1, 0.2901961, 1,
-0.2775555, 0.2961901, 0.7428795, 0, 1, 0.2980392, 1,
-0.2775442, 1.349701, 0.5488499, 0, 1, 0.3058824, 1,
-0.2753302, 0.1317286, -0.5979407, 0, 1, 0.3098039, 1,
-0.2730384, -0.4979834, -3.120401, 0, 1, 0.3176471, 1,
-0.2698815, 0.9336032, -1.394154, 0, 1, 0.3215686, 1,
-0.2666648, 0.1232019, -1.694161, 0, 1, 0.3294118, 1,
-0.2660967, -1.623182, -2.201269, 0, 1, 0.3333333, 1,
-0.2656545, -0.4766448, -2.600476, 0, 1, 0.3411765, 1,
-0.259296, 1.135022, 0.02998974, 0, 1, 0.345098, 1,
-0.2586567, -0.03971784, -2.943168, 0, 1, 0.3529412, 1,
-0.2576999, -2.726564, -2.944253, 0, 1, 0.3568628, 1,
-0.2575934, -0.7542096, -2.889189, 0, 1, 0.3647059, 1,
-0.2489514, 1.017032, 1.408758, 0, 1, 0.3686275, 1,
-0.2485452, 0.7566781, 0.349218, 0, 1, 0.3764706, 1,
-0.2423813, 0.607455, 0.9913183, 0, 1, 0.3803922, 1,
-0.2411229, 2.084475, -1.080776, 0, 1, 0.3882353, 1,
-0.2391568, 0.9192824, -0.386485, 0, 1, 0.3921569, 1,
-0.2359878, 0.479649, 0.6345557, 0, 1, 0.4, 1,
-0.2350529, 0.2959219, 0.202306, 0, 1, 0.4078431, 1,
-0.2336678, 1.696837, 1.209611, 0, 1, 0.4117647, 1,
-0.2333914, -0.4031277, -2.657643, 0, 1, 0.4196078, 1,
-0.2299898, 0.3522255, -1.850772, 0, 1, 0.4235294, 1,
-0.2137458, -0.56433, -3.167892, 0, 1, 0.4313726, 1,
-0.2124536, 0.5596286, -2.186531, 0, 1, 0.4352941, 1,
-0.2117457, -0.9729207, -0.9047912, 0, 1, 0.4431373, 1,
-0.2007132, -1.211714, -2.971457, 0, 1, 0.4470588, 1,
-0.197336, 1.676731, -0.5699832, 0, 1, 0.454902, 1,
-0.1920898, 0.9151998, -0.7479799, 0, 1, 0.4588235, 1,
-0.189152, -0.02331374, -2.488839, 0, 1, 0.4666667, 1,
-0.185788, 0.1277878, -1.16408, 0, 1, 0.4705882, 1,
-0.185548, -1.066216, -2.901084, 0, 1, 0.4784314, 1,
-0.1824248, 0.7569765, -2.179999, 0, 1, 0.4823529, 1,
-0.1792573, -1.012033, -3.676872, 0, 1, 0.4901961, 1,
-0.1790654, -0.3284113, -3.248765, 0, 1, 0.4941176, 1,
-0.17768, 0.1261897, -1.627622, 0, 1, 0.5019608, 1,
-0.1771337, 0.040185, -2.06659, 0, 1, 0.509804, 1,
-0.1750738, 0.6628947, -0.788533, 0, 1, 0.5137255, 1,
-0.1745398, 0.6566092, -2.058463, 0, 1, 0.5215687, 1,
-0.1737625, -0.06221534, -2.711907, 0, 1, 0.5254902, 1,
-0.1714787, 1.409457, 0.526466, 0, 1, 0.5333334, 1,
-0.1688388, 0.1405141, -1.139737, 0, 1, 0.5372549, 1,
-0.1671345, 0.03444202, -1.438751, 0, 1, 0.5450981, 1,
-0.1651142, -0.4599373, -3.823523, 0, 1, 0.5490196, 1,
-0.1645003, 0.5095885, -1.524761, 0, 1, 0.5568628, 1,
-0.1610805, 0.375106, -2.076637, 0, 1, 0.5607843, 1,
-0.1603476, 1.255461, -0.2226836, 0, 1, 0.5686275, 1,
-0.1577506, 0.6467348, -0.6311807, 0, 1, 0.572549, 1,
-0.155462, -0.8945882, -3.043365, 0, 1, 0.5803922, 1,
-0.1550523, -0.8873515, -3.049031, 0, 1, 0.5843138, 1,
-0.1541825, -0.4786357, -3.255059, 0, 1, 0.5921569, 1,
-0.1539158, -0.9550771, -3.965046, 0, 1, 0.5960785, 1,
-0.1532095, -2.199798, -3.570646, 0, 1, 0.6039216, 1,
-0.1524835, -0.3607953, -3.249474, 0, 1, 0.6117647, 1,
-0.1524124, 0.8955525, -0.6403466, 0, 1, 0.6156863, 1,
-0.1522529, -0.3679705, -2.843337, 0, 1, 0.6235294, 1,
-0.1480869, 0.9462788, -0.6149721, 0, 1, 0.627451, 1,
-0.1452768, 0.4011856, -1.918644, 0, 1, 0.6352941, 1,
-0.1414239, 0.4908123, -0.8907534, 0, 1, 0.6392157, 1,
-0.1314537, 0.0827129, -0.6492599, 0, 1, 0.6470588, 1,
-0.1278112, -0.8780798, -4.435039, 0, 1, 0.6509804, 1,
-0.1272319, 0.8682147, -0.8864825, 0, 1, 0.6588235, 1,
-0.1247332, 0.09121962, -1.086879, 0, 1, 0.6627451, 1,
-0.1224021, 0.1387256, -1.665855, 0, 1, 0.6705883, 1,
-0.1194699, 0.9370044, -1.504028, 0, 1, 0.6745098, 1,
-0.1175329, -1.038969, -2.558205, 0, 1, 0.682353, 1,
-0.1166047, -0.8676879, -5.589348, 0, 1, 0.6862745, 1,
-0.1136915, -2.075999, -2.131732, 0, 1, 0.6941177, 1,
-0.1125184, -0.8634655, -4.787765, 0, 1, 0.7019608, 1,
-0.1113201, 1.659257, -2.39031, 0, 1, 0.7058824, 1,
-0.1092584, 1.487287, 0.04704532, 0, 1, 0.7137255, 1,
-0.1031121, -1.768328, -1.691077, 0, 1, 0.7176471, 1,
-0.101635, -0.3670419, -3.101142, 0, 1, 0.7254902, 1,
-0.09936002, 0.9536923, 0.2011631, 0, 1, 0.7294118, 1,
-0.09307926, 0.5864773, 0.4163285, 0, 1, 0.7372549, 1,
-0.09300757, 1.796224, -0.236255, 0, 1, 0.7411765, 1,
-0.09221045, 0.4333751, -1.469363, 0, 1, 0.7490196, 1,
-0.08947739, -1.045266, -4.839537, 0, 1, 0.7529412, 1,
-0.08886877, -0.7909025, -3.317153, 0, 1, 0.7607843, 1,
-0.08764059, -1.361355, -2.611533, 0, 1, 0.7647059, 1,
-0.08651113, 0.5433328, 0.4367961, 0, 1, 0.772549, 1,
-0.08038948, -0.4343945, -2.527122, 0, 1, 0.7764706, 1,
-0.07986309, -0.4456001, -2.785194, 0, 1, 0.7843137, 1,
-0.07785788, 2.003667, -0.2825972, 0, 1, 0.7882353, 1,
-0.07690653, -0.7501668, -2.261583, 0, 1, 0.7960784, 1,
-0.07427601, -1.276702, -4.029504, 0, 1, 0.8039216, 1,
-0.07339917, 1.498827, -0.3626149, 0, 1, 0.8078431, 1,
-0.06998608, 0.916406, -0.5296879, 0, 1, 0.8156863, 1,
-0.06863862, 0.7469069, 0.9965424, 0, 1, 0.8196079, 1,
-0.06678208, 0.38905, -0.3870446, 0, 1, 0.827451, 1,
-0.06283488, -0.5014055, -3.83391, 0, 1, 0.8313726, 1,
-0.06120125, -1.533558, -3.756634, 0, 1, 0.8392157, 1,
-0.05604585, 0.3376693, -0.329776, 0, 1, 0.8431373, 1,
-0.0539904, 0.7318588, 0.6494865, 0, 1, 0.8509804, 1,
-0.05203845, 2.111607, 1.973178, 0, 1, 0.854902, 1,
-0.05084493, 0.5060308, -0.221902, 0, 1, 0.8627451, 1,
-0.04922774, 0.4153272, -1.711698, 0, 1, 0.8666667, 1,
-0.047014, 0.006372086, -2.275158, 0, 1, 0.8745098, 1,
-0.0434283, 0.4791639, 0.01031629, 0, 1, 0.8784314, 1,
-0.04097911, -1.326376, -4.977103, 0, 1, 0.8862745, 1,
-0.04015971, -0.02856377, -2.167153, 0, 1, 0.8901961, 1,
-0.03929906, 0.01723038, -0.270163, 0, 1, 0.8980392, 1,
-0.03511129, -0.1689274, -2.838769, 0, 1, 0.9058824, 1,
-0.03388466, -0.6660842, -2.576701, 0, 1, 0.9098039, 1,
-0.0279969, 0.3817975, 0.2470389, 0, 1, 0.9176471, 1,
-0.02693027, 0.4420666, 0.06547792, 0, 1, 0.9215686, 1,
-0.02361843, 0.7017651, 0.222255, 0, 1, 0.9294118, 1,
-0.02050714, -1.32617, -4.210511, 0, 1, 0.9333333, 1,
-0.01550849, 0.4516355, 0.6884418, 0, 1, 0.9411765, 1,
-0.01212892, -0.3747506, -2.491877, 0, 1, 0.945098, 1,
-0.01104685, -1.574201, -2.626063, 0, 1, 0.9529412, 1,
-0.007243483, -0.3432846, -3.307905, 0, 1, 0.9568627, 1,
-0.006544953, 0.7320256, -1.110806, 0, 1, 0.9647059, 1,
-0.004838058, -0.898393, -1.554118, 0, 1, 0.9686275, 1,
-0.001601303, -1.394596, -1.772706, 0, 1, 0.9764706, 1,
0.004245226, 1.441142, 0.2581431, 0, 1, 0.9803922, 1,
0.009560376, 1.095108, -0.7616264, 0, 1, 0.9882353, 1,
0.01069457, -1.907523, 2.694174, 0, 1, 0.9921569, 1,
0.01358842, 0.07978959, 1.870521, 0, 1, 1, 1,
0.01412266, -0.8381953, 2.813994, 0, 0.9921569, 1, 1,
0.01519387, -0.1198477, 5.130358, 0, 0.9882353, 1, 1,
0.01537646, 0.4482422, -1.443101, 0, 0.9803922, 1, 1,
0.01624382, -1.214631, 2.387193, 0, 0.9764706, 1, 1,
0.01626199, 0.9668356, 1.703992, 0, 0.9686275, 1, 1,
0.01756503, 0.487378, 0.3297724, 0, 0.9647059, 1, 1,
0.01811155, 0.587819, 0.9028987, 0, 0.9568627, 1, 1,
0.02136184, -0.007264848, 1.557446, 0, 0.9529412, 1, 1,
0.02222437, 0.438521, -0.6629938, 0, 0.945098, 1, 1,
0.02828432, -0.1127544, 3.110253, 0, 0.9411765, 1, 1,
0.03454228, -0.4278986, 1.600367, 0, 0.9333333, 1, 1,
0.03531318, 0.6923524, -0.4084969, 0, 0.9294118, 1, 1,
0.03673064, -0.4295659, 2.367166, 0, 0.9215686, 1, 1,
0.047278, -0.7971947, 3.468948, 0, 0.9176471, 1, 1,
0.05697826, 1.205523, 1.31727, 0, 0.9098039, 1, 1,
0.06360439, -0.4042781, 5.906822, 0, 0.9058824, 1, 1,
0.06617109, -1.053539, 2.075668, 0, 0.8980392, 1, 1,
0.06756614, -0.9117075, 3.734674, 0, 0.8901961, 1, 1,
0.073635, -1.281271, 2.684261, 0, 0.8862745, 1, 1,
0.07588864, -0.1435976, 0.6348665, 0, 0.8784314, 1, 1,
0.07960889, -3.040508, 3.424014, 0, 0.8745098, 1, 1,
0.07966052, -1.430804, 3.711972, 0, 0.8666667, 1, 1,
0.0805271, 0.4814934, -0.2777499, 0, 0.8627451, 1, 1,
0.08054499, 2.0085, 0.4825201, 0, 0.854902, 1, 1,
0.08325817, 1.008488, -1.20747, 0, 0.8509804, 1, 1,
0.08424035, 1.679108, -0.49216, 0, 0.8431373, 1, 1,
0.08527456, -0.1552977, 2.193354, 0, 0.8392157, 1, 1,
0.08531272, 1.002652, 0.9355747, 0, 0.8313726, 1, 1,
0.09174432, -0.08159605, 4.021427, 0, 0.827451, 1, 1,
0.09242016, -0.4295643, 2.11215, 0, 0.8196079, 1, 1,
0.0931287, 0.02490035, 1.384024, 0, 0.8156863, 1, 1,
0.09758997, -1.949493, 4.160707, 0, 0.8078431, 1, 1,
0.09847311, -1.354528, 2.919626, 0, 0.8039216, 1, 1,
0.09878109, 2.868727, 1.905139, 0, 0.7960784, 1, 1,
0.09928057, -0.2379596, 2.767313, 0, 0.7882353, 1, 1,
0.1025651, 0.2805894, -0.367676, 0, 0.7843137, 1, 1,
0.1050079, 0.1944399, -0.4271688, 0, 0.7764706, 1, 1,
0.1058136, -2.059914, 3.030242, 0, 0.772549, 1, 1,
0.1079472, -0.9417639, 4.958531, 0, 0.7647059, 1, 1,
0.1080133, 0.952087, 0.3431759, 0, 0.7607843, 1, 1,
0.1097992, 1.016207, 0.6105075, 0, 0.7529412, 1, 1,
0.1110168, -0.3795213, 3.299555, 0, 0.7490196, 1, 1,
0.1118639, 0.25055, 1.40187, 0, 0.7411765, 1, 1,
0.1142169, 0.4007119, 0.9369011, 0, 0.7372549, 1, 1,
0.1142322, -0.333614, 2.482955, 0, 0.7294118, 1, 1,
0.1159427, -1.696588, 3.965107, 0, 0.7254902, 1, 1,
0.11786, -0.2108859, 2.223362, 0, 0.7176471, 1, 1,
0.1264423, 0.09395082, 0.7072027, 0, 0.7137255, 1, 1,
0.1275918, 0.3703793, 0.8199242, 0, 0.7058824, 1, 1,
0.1299085, 0.6756884, 0.6472511, 0, 0.6980392, 1, 1,
0.1301517, -1.203004, 3.556845, 0, 0.6941177, 1, 1,
0.13681, -0.1804111, 3.340957, 0, 0.6862745, 1, 1,
0.1370027, -1.994598, 4.214228, 0, 0.682353, 1, 1,
0.1371115, -0.3489758, 2.558192, 0, 0.6745098, 1, 1,
0.1390741, -0.9789251, 0.582851, 0, 0.6705883, 1, 1,
0.1399533, -1.434744, 3.431492, 0, 0.6627451, 1, 1,
0.142176, 0.1610796, -0.9681061, 0, 0.6588235, 1, 1,
0.146648, 0.3151877, 1.500298, 0, 0.6509804, 1, 1,
0.1496445, 0.708053, 1.283398, 0, 0.6470588, 1, 1,
0.1598667, 1.548542, -0.1361672, 0, 0.6392157, 1, 1,
0.1704332, 0.6614949, -0.07744503, 0, 0.6352941, 1, 1,
0.1719897, 0.7195724, 1.705932, 0, 0.627451, 1, 1,
0.1742603, -0.1467212, 1.827477, 0, 0.6235294, 1, 1,
0.1772106, 0.5475255, -0.6310884, 0, 0.6156863, 1, 1,
0.1783475, 1.652572, -1.047547, 0, 0.6117647, 1, 1,
0.1858077, -0.3723285, 3.11818, 0, 0.6039216, 1, 1,
0.1899637, 0.783742, 1.771726, 0, 0.5960785, 1, 1,
0.1902116, -1.964865, 4.761302, 0, 0.5921569, 1, 1,
0.1902792, 0.4397599, 1.289995, 0, 0.5843138, 1, 1,
0.1923136, -1.005875, 3.712384, 0, 0.5803922, 1, 1,
0.1924101, -0.8106149, 2.163335, 0, 0.572549, 1, 1,
0.1929559, 1.043976, 1.035298, 0, 0.5686275, 1, 1,
0.1980263, -1.903205, 4.424087, 0, 0.5607843, 1, 1,
0.198802, 0.3531837, 0.7244094, 0, 0.5568628, 1, 1,
0.2010136, 0.4747208, 1.306987, 0, 0.5490196, 1, 1,
0.202081, -0.07734818, 0.08793306, 0, 0.5450981, 1, 1,
0.2043222, -0.04455339, 1.752064, 0, 0.5372549, 1, 1,
0.2093193, 1.860511, -0.6794177, 0, 0.5333334, 1, 1,
0.2191666, -1.237427, 2.466482, 0, 0.5254902, 1, 1,
0.2199089, -1.86229, 4.045346, 0, 0.5215687, 1, 1,
0.2201785, 1.43009, 0.08321369, 0, 0.5137255, 1, 1,
0.2271068, 0.1184271, 0.6837865, 0, 0.509804, 1, 1,
0.2320231, -0.8376746, 4.47358, 0, 0.5019608, 1, 1,
0.2325022, -0.9046195, 1.645724, 0, 0.4941176, 1, 1,
0.2338285, 1.61598, 0.556967, 0, 0.4901961, 1, 1,
0.2341727, 1.580311, 0.9092394, 0, 0.4823529, 1, 1,
0.2350335, -1.085569, 2.463704, 0, 0.4784314, 1, 1,
0.2368943, 0.3079584, 2.59239, 0, 0.4705882, 1, 1,
0.2396646, 0.332839, 0.9448951, 0, 0.4666667, 1, 1,
0.2399938, -1.406598, 3.222976, 0, 0.4588235, 1, 1,
0.2427411, -0.6128526, 4.309872, 0, 0.454902, 1, 1,
0.2464294, -1.847392, 3.54733, 0, 0.4470588, 1, 1,
0.2523282, -0.9513947, 3.357129, 0, 0.4431373, 1, 1,
0.2538405, 2.493051, -1.685903, 0, 0.4352941, 1, 1,
0.263683, 0.9547333, 1.049881, 0, 0.4313726, 1, 1,
0.2666532, -0.9163664, 2.184709, 0, 0.4235294, 1, 1,
0.2688071, -0.1664904, 2.591436, 0, 0.4196078, 1, 1,
0.2725469, 0.148828, 2.197219, 0, 0.4117647, 1, 1,
0.2731989, -0.6646984, 1.194654, 0, 0.4078431, 1, 1,
0.2775014, 2.203379, -1.148544, 0, 0.4, 1, 1,
0.2776484, 0.9899212, 0.5080351, 0, 0.3921569, 1, 1,
0.2785901, -0.7763352, 3.37149, 0, 0.3882353, 1, 1,
0.2841486, 0.4085726, 0.8508013, 0, 0.3803922, 1, 1,
0.2851622, -0.6516653, 2.815044, 0, 0.3764706, 1, 1,
0.2905646, 2.095482, 0.8429107, 0, 0.3686275, 1, 1,
0.2908335, -0.1665986, 1.70918, 0, 0.3647059, 1, 1,
0.296477, 0.5715352, 1.917823, 0, 0.3568628, 1, 1,
0.2968765, 0.6741576, 1.090749, 0, 0.3529412, 1, 1,
0.2984915, 0.4307009, -0.5195954, 0, 0.345098, 1, 1,
0.3002026, -0.3616064, 0.5023187, 0, 0.3411765, 1, 1,
0.3005237, 0.1492363, 1.53483, 0, 0.3333333, 1, 1,
0.3029872, 0.7254233, 0.3967107, 0, 0.3294118, 1, 1,
0.305212, 2.256849, -0.4039406, 0, 0.3215686, 1, 1,
0.3077605, 0.04607857, 1.260099, 0, 0.3176471, 1, 1,
0.3090348, 1.543755, 0.03602286, 0, 0.3098039, 1, 1,
0.3114262, -0.569907, 4.295537, 0, 0.3058824, 1, 1,
0.314594, -1.304038, 1.854595, 0, 0.2980392, 1, 1,
0.3155795, -0.2399779, 3.71771, 0, 0.2901961, 1, 1,
0.3172993, -0.3007636, 0.6371021, 0, 0.2862745, 1, 1,
0.3188209, 1.305603, -0.5653211, 0, 0.2784314, 1, 1,
0.3192238, 0.1535255, 0.1933234, 0, 0.2745098, 1, 1,
0.3215428, 1.667655, 0.1001146, 0, 0.2666667, 1, 1,
0.3237581, -0.2792048, 2.544013, 0, 0.2627451, 1, 1,
0.327476, -1.053899, 3.762187, 0, 0.254902, 1, 1,
0.3330667, -1.315427, 2.665639, 0, 0.2509804, 1, 1,
0.3388306, -0.6343236, 3.744332, 0, 0.2431373, 1, 1,
0.3389478, 1.444356, 0.3761844, 0, 0.2392157, 1, 1,
0.3391026, -0.6120281, 1.415437, 0, 0.2313726, 1, 1,
0.3394506, 1.235189, 0.189134, 0, 0.227451, 1, 1,
0.3443504, 0.4196685, -0.2808557, 0, 0.2196078, 1, 1,
0.3514139, 0.4060853, 0.7221214, 0, 0.2156863, 1, 1,
0.3560527, 0.9740951, -0.01963715, 0, 0.2078431, 1, 1,
0.356737, -0.08958054, 0.08310623, 0, 0.2039216, 1, 1,
0.3576292, 0.07488079, 0.979012, 0, 0.1960784, 1, 1,
0.3591196, -0.2539292, 2.171956, 0, 0.1882353, 1, 1,
0.360033, 0.1560807, 0.9962457, 0, 0.1843137, 1, 1,
0.3603422, -0.2151693, 1.253837, 0, 0.1764706, 1, 1,
0.3701902, 0.01173023, 0.4908377, 0, 0.172549, 1, 1,
0.3705795, 0.6314359, -0.1675564, 0, 0.1647059, 1, 1,
0.3722918, 1.416452, 0.3224948, 0, 0.1607843, 1, 1,
0.3769825, 0.05774654, 2.983738, 0, 0.1529412, 1, 1,
0.3770844, 0.7403371, -0.1219094, 0, 0.1490196, 1, 1,
0.3891692, -0.09930295, 1.791559, 0, 0.1411765, 1, 1,
0.3909758, -0.2783367, 1.570251, 0, 0.1372549, 1, 1,
0.3952936, 0.6336862, -0.8987567, 0, 0.1294118, 1, 1,
0.4001836, -0.8586376, 2.782124, 0, 0.1254902, 1, 1,
0.4005718, 1.324921, 3.103324, 0, 0.1176471, 1, 1,
0.4022432, -0.008383591, 1.746215, 0, 0.1137255, 1, 1,
0.4126314, -0.7991637, 1.556876, 0, 0.1058824, 1, 1,
0.4159622, -1.146179, 1.653549, 0, 0.09803922, 1, 1,
0.4168423, -0.6609898, 3.198392, 0, 0.09411765, 1, 1,
0.4189272, 0.4498519, 0.8210206, 0, 0.08627451, 1, 1,
0.4200733, -0.620229, 2.265734, 0, 0.08235294, 1, 1,
0.4202536, -0.09866519, 0.9816285, 0, 0.07450981, 1, 1,
0.4221266, -1.048384, 2.333051, 0, 0.07058824, 1, 1,
0.4251456, -0.2554035, 1.401998, 0, 0.0627451, 1, 1,
0.4263845, 0.1918747, 2.602518, 0, 0.05882353, 1, 1,
0.4266078, -0.9470484, 1.440179, 0, 0.05098039, 1, 1,
0.4330453, 0.05857453, 3.33094, 0, 0.04705882, 1, 1,
0.4346819, -0.6498761, 3.969863, 0, 0.03921569, 1, 1,
0.4443352, 0.6535876, -0.02632053, 0, 0.03529412, 1, 1,
0.4530099, 0.8147554, 0.1709602, 0, 0.02745098, 1, 1,
0.4530137, -1.927998, 2.990052, 0, 0.02352941, 1, 1,
0.4535292, -1.175166, 1.896142, 0, 0.01568628, 1, 1,
0.4537815, -0.3830876, 1.780976, 0, 0.01176471, 1, 1,
0.4539465, 0.1235064, 0.4753592, 0, 0.003921569, 1, 1,
0.4604011, -0.7637075, 3.326395, 0.003921569, 0, 1, 1,
0.460895, -0.874115, 1.960238, 0.007843138, 0, 1, 1,
0.4622071, 1.211418, 1.027903, 0.01568628, 0, 1, 1,
0.464803, 0.7044736, -0.5525329, 0.01960784, 0, 1, 1,
0.4705716, 0.3514713, 0.7310573, 0.02745098, 0, 1, 1,
0.4712849, -0.6050994, 2.016356, 0.03137255, 0, 1, 1,
0.4736232, -0.8305888, 3.726628, 0.03921569, 0, 1, 1,
0.4780362, 0.4273725, 1.059767, 0.04313726, 0, 1, 1,
0.4786022, 0.4136163, 1.036481, 0.05098039, 0, 1, 1,
0.4816736, -0.7573736, 2.607017, 0.05490196, 0, 1, 1,
0.4830968, 0.4639226, 1.946855, 0.0627451, 0, 1, 1,
0.4877039, -1.322326, 2.32266, 0.06666667, 0, 1, 1,
0.4906774, -0.1563448, 1.273185, 0.07450981, 0, 1, 1,
0.4917906, 1.319828, -0.4591393, 0.07843138, 0, 1, 1,
0.4934695, 1.121859, 0.036631, 0.08627451, 0, 1, 1,
0.4944708, -0.002746465, 1.830801, 0.09019608, 0, 1, 1,
0.494671, 0.5783322, 0.2712585, 0.09803922, 0, 1, 1,
0.4986246, -1.979594, 2.756254, 0.1058824, 0, 1, 1,
0.5002171, 2.297711, 0.4839523, 0.1098039, 0, 1, 1,
0.5007732, 1.188988, -1.706576, 0.1176471, 0, 1, 1,
0.5053146, 0.6458821, 0.9952232, 0.1215686, 0, 1, 1,
0.5054108, 0.1577327, 1.073735, 0.1294118, 0, 1, 1,
0.5054775, -0.5343817, 3.100547, 0.1333333, 0, 1, 1,
0.510148, 0.7536405, 2.021044, 0.1411765, 0, 1, 1,
0.5137399, -2.388662, 4.151692, 0.145098, 0, 1, 1,
0.516231, 0.9492262, 2.538844, 0.1529412, 0, 1, 1,
0.5168411, -1.02252, 2.314794, 0.1568628, 0, 1, 1,
0.5174575, 0.2415606, 2.49228, 0.1647059, 0, 1, 1,
0.5267974, 0.7782785, 0.7635397, 0.1686275, 0, 1, 1,
0.528307, 1.602925, 0.6399281, 0.1764706, 0, 1, 1,
0.5289167, -0.6522195, 1.825798, 0.1803922, 0, 1, 1,
0.5409446, 1.41018, 0.6824931, 0.1882353, 0, 1, 1,
0.5507594, 0.04975253, 1.536366, 0.1921569, 0, 1, 1,
0.5606907, -0.7411811, 2.804069, 0.2, 0, 1, 1,
0.5607044, -0.3166264, 3.344299, 0.2078431, 0, 1, 1,
0.5678809, 0.9874305, -0.1803047, 0.2117647, 0, 1, 1,
0.5704158, 0.5651566, -0.06505726, 0.2196078, 0, 1, 1,
0.5729693, -2.122066, 2.369927, 0.2235294, 0, 1, 1,
0.5805004, 2.117405, 0.7263155, 0.2313726, 0, 1, 1,
0.5807051, 0.8225861, -1.841503, 0.2352941, 0, 1, 1,
0.5813146, 0.7832284, 1.593513, 0.2431373, 0, 1, 1,
0.5818503, -0.9939023, 3.631399, 0.2470588, 0, 1, 1,
0.5903532, 0.3656669, 1.229941, 0.254902, 0, 1, 1,
0.5916319, -0.4548862, 3.260052, 0.2588235, 0, 1, 1,
0.5938618, -0.8160205, 3.305157, 0.2666667, 0, 1, 1,
0.594093, -0.6190566, 3.338946, 0.2705882, 0, 1, 1,
0.5985018, -0.3202196, 2.428813, 0.2784314, 0, 1, 1,
0.6033832, -1.718807, 1.561557, 0.282353, 0, 1, 1,
0.6065035, 0.5807731, 0.1907803, 0.2901961, 0, 1, 1,
0.6105434, -0.8252398, 2.330716, 0.2941177, 0, 1, 1,
0.6111352, 0.8574434, 0.3695992, 0.3019608, 0, 1, 1,
0.6117139, 0.3460624, 2.078467, 0.3098039, 0, 1, 1,
0.6254206, -1.367191, 2.910736, 0.3137255, 0, 1, 1,
0.6259985, 1.48177, 0.01958219, 0.3215686, 0, 1, 1,
0.6288351, -2.798003, 3.700344, 0.3254902, 0, 1, 1,
0.6296957, 1.478861, -0.5036556, 0.3333333, 0, 1, 1,
0.633876, 0.8554702, 1.480903, 0.3372549, 0, 1, 1,
0.6360972, -0.4116012, 1.943996, 0.345098, 0, 1, 1,
0.640632, 1.862308, 1.919501, 0.3490196, 0, 1, 1,
0.6431733, 0.3693472, 0.1831132, 0.3568628, 0, 1, 1,
0.6433954, -0.1007394, 2.550091, 0.3607843, 0, 1, 1,
0.6438673, -1.050086, 2.773767, 0.3686275, 0, 1, 1,
0.6443508, 0.4663095, 0.5457537, 0.372549, 0, 1, 1,
0.6515507, -2.044253, 5.093436, 0.3803922, 0, 1, 1,
0.6517849, -0.6153377, 2.304204, 0.3843137, 0, 1, 1,
0.6555289, -0.979718, 2.852428, 0.3921569, 0, 1, 1,
0.655915, 1.228956, 0.9891945, 0.3960784, 0, 1, 1,
0.6580352, -0.9539401, 3.257868, 0.4039216, 0, 1, 1,
0.665311, -0.6026344, 2.03793, 0.4117647, 0, 1, 1,
0.6668752, -0.2877963, 2.389503, 0.4156863, 0, 1, 1,
0.6690131, 0.0250566, 1.494387, 0.4235294, 0, 1, 1,
0.6728216, 1.07628, 0.8161255, 0.427451, 0, 1, 1,
0.6734447, -0.8634261, 3.438526, 0.4352941, 0, 1, 1,
0.679454, 0.248411, 1.745086, 0.4392157, 0, 1, 1,
0.683878, -0.1168143, -1.181193, 0.4470588, 0, 1, 1,
0.6857327, -2.069367, 3.522128, 0.4509804, 0, 1, 1,
0.6888149, -0.4507932, 2.12003, 0.4588235, 0, 1, 1,
0.6920244, -0.8550816, 2.72986, 0.4627451, 0, 1, 1,
0.6932071, -1.345179, 1.907696, 0.4705882, 0, 1, 1,
0.6962363, 1.988367, 0.3558657, 0.4745098, 0, 1, 1,
0.6993401, 1.476896, -0.139455, 0.4823529, 0, 1, 1,
0.7006223, -2.393279, 2.090162, 0.4862745, 0, 1, 1,
0.7037688, -1.209287, 2.15592, 0.4941176, 0, 1, 1,
0.7053074, 0.3316024, 1.291233, 0.5019608, 0, 1, 1,
0.7074236, -1.019725, 1.264377, 0.5058824, 0, 1, 1,
0.7194341, 0.2123249, 0.8816971, 0.5137255, 0, 1, 1,
0.7207057, 0.872346, 1.496885, 0.5176471, 0, 1, 1,
0.7252769, 0.793034, 1.201264, 0.5254902, 0, 1, 1,
0.7254068, 0.1309162, -0.4849228, 0.5294118, 0, 1, 1,
0.7273424, 0.5837521, 0.5184073, 0.5372549, 0, 1, 1,
0.7302636, 0.8616407, 0.5179922, 0.5411765, 0, 1, 1,
0.7357864, 0.2242154, -0.4506913, 0.5490196, 0, 1, 1,
0.7365069, 0.2388224, 1.132811, 0.5529412, 0, 1, 1,
0.7387282, -0.6683422, 1.636595, 0.5607843, 0, 1, 1,
0.7468802, -1.908703, 2.72839, 0.5647059, 0, 1, 1,
0.7480119, -0.9830728, 2.620807, 0.572549, 0, 1, 1,
0.7541091, -0.9864181, 2.541471, 0.5764706, 0, 1, 1,
0.7556797, 0.2831677, 1.800435, 0.5843138, 0, 1, 1,
0.7608393, -0.1106303, 2.106016, 0.5882353, 0, 1, 1,
0.7639199, -1.10179, 0.8835198, 0.5960785, 0, 1, 1,
0.7673153, 0.4727975, 0.03953499, 0.6039216, 0, 1, 1,
0.7678437, -0.5488957, 3.074193, 0.6078432, 0, 1, 1,
0.7691385, -0.04638082, 2.427607, 0.6156863, 0, 1, 1,
0.7694381, -1.669624, 2.991941, 0.6196079, 0, 1, 1,
0.7708672, 1.241974, 0.7845979, 0.627451, 0, 1, 1,
0.7725675, -0.1790551, 0.3769518, 0.6313726, 0, 1, 1,
0.7755389, 0.05569991, 2.272753, 0.6392157, 0, 1, 1,
0.7769108, 0.8826904, 1.185402, 0.6431373, 0, 1, 1,
0.7947698, -1.239729, 2.103477, 0.6509804, 0, 1, 1,
0.7964655, -1.134888, 2.48602, 0.654902, 0, 1, 1,
0.8002958, 1.085744, -0.6457475, 0.6627451, 0, 1, 1,
0.8007762, -0.311319, 1.033296, 0.6666667, 0, 1, 1,
0.803343, -0.8676027, 2.813822, 0.6745098, 0, 1, 1,
0.818074, -0.5625052, 2.608337, 0.6784314, 0, 1, 1,
0.8235533, 0.3253359, 2.658823, 0.6862745, 0, 1, 1,
0.8264104, 1.779913, -0.07746171, 0.6901961, 0, 1, 1,
0.8359125, -1.277075, 0.4326712, 0.6980392, 0, 1, 1,
0.8399555, -1.339854, 4.504114, 0.7058824, 0, 1, 1,
0.8443879, 1.737986, -0.3384836, 0.7098039, 0, 1, 1,
0.8443958, 0.799675, 0.9692517, 0.7176471, 0, 1, 1,
0.8480383, -0.9274964, 3.083524, 0.7215686, 0, 1, 1,
0.8511722, -0.09362374, -0.08016268, 0.7294118, 0, 1, 1,
0.8558602, -0.5919211, 1.79107, 0.7333333, 0, 1, 1,
0.8615159, -0.9313235, -0.06050357, 0.7411765, 0, 1, 1,
0.8620946, 0.9505511, -0.1334926, 0.7450981, 0, 1, 1,
0.8669017, 0.3356527, 1.778426, 0.7529412, 0, 1, 1,
0.8677778, 2.104856, -1.186185, 0.7568628, 0, 1, 1,
0.868329, -1.214602, 4.212543, 0.7647059, 0, 1, 1,
0.8725074, -1.064582, 2.603461, 0.7686275, 0, 1, 1,
0.8726445, 0.1613308, 2.291417, 0.7764706, 0, 1, 1,
0.8736392, -0.3933575, 2.438397, 0.7803922, 0, 1, 1,
0.8759902, 0.08165095, 1.712809, 0.7882353, 0, 1, 1,
0.8770211, 0.7926543, -0.9727509, 0.7921569, 0, 1, 1,
0.8799152, -2.116469, 4.906875, 0.8, 0, 1, 1,
0.888417, 1.703246, 0.2538782, 0.8078431, 0, 1, 1,
0.8890959, 2.599147, 0.04320611, 0.8117647, 0, 1, 1,
0.8917441, -0.1473771, 2.234011, 0.8196079, 0, 1, 1,
0.8937572, -1.041111, 2.449299, 0.8235294, 0, 1, 1,
0.8976793, -0.2411813, 1.044896, 0.8313726, 0, 1, 1,
0.9012879, 0.6338581, 0.5489546, 0.8352941, 0, 1, 1,
0.9029934, 0.5722988, 0.6385626, 0.8431373, 0, 1, 1,
0.9033285, 0.7078334, 1.318221, 0.8470588, 0, 1, 1,
0.9095206, 1.113742, -0.2048625, 0.854902, 0, 1, 1,
0.9096878, 1.463118, -0.9848881, 0.8588235, 0, 1, 1,
0.9121422, 0.8083249, -0.5884106, 0.8666667, 0, 1, 1,
0.9127758, 1.413428, 3.199113, 0.8705882, 0, 1, 1,
0.9140331, -0.2125169, 1.146802, 0.8784314, 0, 1, 1,
0.9145264, 1.636096, -1.485936, 0.8823529, 0, 1, 1,
0.9151849, 0.6311896, -0.3945479, 0.8901961, 0, 1, 1,
0.9158667, 2.056359, -1.113729, 0.8941177, 0, 1, 1,
0.9159217, 0.3510245, 1.721565, 0.9019608, 0, 1, 1,
0.9247612, -0.150851, 2.812366, 0.9098039, 0, 1, 1,
0.9297007, 1.396175, 1.5242, 0.9137255, 0, 1, 1,
0.9300362, -0.1847629, 1.979822, 0.9215686, 0, 1, 1,
0.9310611, 0.2213617, 1.905533, 0.9254902, 0, 1, 1,
0.9330847, -0.07283898, 1.086651, 0.9333333, 0, 1, 1,
0.9384087, -0.3242581, 1.90651, 0.9372549, 0, 1, 1,
0.9394373, -1.222801, 2.431946, 0.945098, 0, 1, 1,
0.9406465, 2.075602, 1.651432, 0.9490196, 0, 1, 1,
0.9490813, -1.643818, 2.826133, 0.9568627, 0, 1, 1,
0.955528, -0.454167, 2.159726, 0.9607843, 0, 1, 1,
0.9563785, -1.794062, 2.381708, 0.9686275, 0, 1, 1,
0.9727987, 0.8916983, 1.297416, 0.972549, 0, 1, 1,
0.9741102, -1.27858, 1.383697, 0.9803922, 0, 1, 1,
0.978186, -0.3746739, 0.6100366, 0.9843137, 0, 1, 1,
0.9794704, 1.050222, 0.3806482, 0.9921569, 0, 1, 1,
0.9889976, -0.229631, 2.125181, 0.9960784, 0, 1, 1,
0.9952314, 0.3626915, 2.248883, 1, 0, 0.9960784, 1,
0.9979094, -1.105484, 0.8914042, 1, 0, 0.9882353, 1,
0.998883, -0.737259, 2.032156, 1, 0, 0.9843137, 1,
0.9996207, -0.8620948, 1.477781, 1, 0, 0.9764706, 1,
1.002591, -1.214295, 1.686067, 1, 0, 0.972549, 1,
1.00637, 0.1368712, 0.3653485, 1, 0, 0.9647059, 1,
1.007553, -0.7905217, 0.8301838, 1, 0, 0.9607843, 1,
1.009496, -0.3968017, 1.663546, 1, 0, 0.9529412, 1,
1.018962, 1.715614, -0.9767422, 1, 0, 0.9490196, 1,
1.026271, -0.8186588, 0.7247985, 1, 0, 0.9411765, 1,
1.026336, 0.6673587, 1.426478, 1, 0, 0.9372549, 1,
1.026471, -0.2461326, 0.7130734, 1, 0, 0.9294118, 1,
1.027843, 0.282945, 1.937141, 1, 0, 0.9254902, 1,
1.036312, 0.5537707, 0.3685338, 1, 0, 0.9176471, 1,
1.039033, 0.4437651, 3.111889, 1, 0, 0.9137255, 1,
1.041995, 0.6565069, 1.522412, 1, 0, 0.9058824, 1,
1.045202, 1.057634, 0.3682906, 1, 0, 0.9019608, 1,
1.045893, 0.04145641, 1.164886, 1, 0, 0.8941177, 1,
1.059266, -0.07936087, 0.8911229, 1, 0, 0.8862745, 1,
1.06087, 0.1360296, 1.894214, 1, 0, 0.8823529, 1,
1.062257, 2.451502, 0.1323229, 1, 0, 0.8745098, 1,
1.069378, 0.8824058, 0.8021546, 1, 0, 0.8705882, 1,
1.069563, 0.8502375, 2.499309, 1, 0, 0.8627451, 1,
1.070529, 1.038977, -0.4803301, 1, 0, 0.8588235, 1,
1.072943, 0.7033253, 0.8069118, 1, 0, 0.8509804, 1,
1.077459, -0.1005729, 2.893414, 1, 0, 0.8470588, 1,
1.079618, -0.1592671, 3.337092, 1, 0, 0.8392157, 1,
1.080732, 1.777264, 2.494889, 1, 0, 0.8352941, 1,
1.086391, -0.38509, 4.196987, 1, 0, 0.827451, 1,
1.086622, 1.104115, 0.8349921, 1, 0, 0.8235294, 1,
1.087663, -0.396318, 2.387998, 1, 0, 0.8156863, 1,
1.087945, 0.419452, 0.06800977, 1, 0, 0.8117647, 1,
1.089856, 0.9712068, 1.350451, 1, 0, 0.8039216, 1,
1.093064, -1.393459, 3.850112, 1, 0, 0.7960784, 1,
1.094568, 0.2272555, 0.8299456, 1, 0, 0.7921569, 1,
1.096353, -0.6533533, 2.601164, 1, 0, 0.7843137, 1,
1.096857, 0.5336343, 0.8038304, 1, 0, 0.7803922, 1,
1.101072, 2.111365, -0.5284007, 1, 0, 0.772549, 1,
1.102148, -0.6842453, 1.302687, 1, 0, 0.7686275, 1,
1.114131, -0.4035161, 0.4128358, 1, 0, 0.7607843, 1,
1.115762, -0.5695315, 2.099804, 1, 0, 0.7568628, 1,
1.116554, 0.7030695, -0.1432011, 1, 0, 0.7490196, 1,
1.118416, 0.7317031, 0.2456893, 1, 0, 0.7450981, 1,
1.124067, 0.02275725, 0.8683568, 1, 0, 0.7372549, 1,
1.124696, 0.01490839, 1.967307, 1, 0, 0.7333333, 1,
1.130877, -0.03691261, 1.332614, 1, 0, 0.7254902, 1,
1.13104, 0.7412121, -1.476293, 1, 0, 0.7215686, 1,
1.137895, -0.5527769, 1.159348, 1, 0, 0.7137255, 1,
1.144666, -1.84577, 2.768799, 1, 0, 0.7098039, 1,
1.145958, 0.6435395, 0.3533438, 1, 0, 0.7019608, 1,
1.147937, 0.4824717, 2.122116, 1, 0, 0.6941177, 1,
1.153137, -0.4170952, 3.305823, 1, 0, 0.6901961, 1,
1.172491, -1.489422, 2.143143, 1, 0, 0.682353, 1,
1.184428, -0.2647849, 0.5827464, 1, 0, 0.6784314, 1,
1.192114, -1.311909, 0.7198384, 1, 0, 0.6705883, 1,
1.197085, -0.6643033, 1.326002, 1, 0, 0.6666667, 1,
1.213599, 1.212845, 1.013709, 1, 0, 0.6588235, 1,
1.217251, -0.03277623, 1.222465, 1, 0, 0.654902, 1,
1.230737, -0.9577006, 2.202461, 1, 0, 0.6470588, 1,
1.23137, -1.23477, 4.130905, 1, 0, 0.6431373, 1,
1.232029, 1.07202, 2.247161, 1, 0, 0.6352941, 1,
1.238948, -0.1359356, 2.869, 1, 0, 0.6313726, 1,
1.252995, 1.678065, 0.9701586, 1, 0, 0.6235294, 1,
1.256753, 0.3959582, 2.291583, 1, 0, 0.6196079, 1,
1.258719, -0.006700107, 1.903441, 1, 0, 0.6117647, 1,
1.273571, 1.462539, 1.209764, 1, 0, 0.6078432, 1,
1.280315, 0.1652321, 1.612879, 1, 0, 0.6, 1,
1.280684, 1.008142, 0.4974569, 1, 0, 0.5921569, 1,
1.290837, 1.243367, 1.246176, 1, 0, 0.5882353, 1,
1.290915, -0.3355242, 1.569842, 1, 0, 0.5803922, 1,
1.290951, -0.06420296, 1.968708, 1, 0, 0.5764706, 1,
1.291593, -0.2408587, 2.16359, 1, 0, 0.5686275, 1,
1.313838, -0.008087968, 1.233147, 1, 0, 0.5647059, 1,
1.315693, 0.3312825, 0.5351177, 1, 0, 0.5568628, 1,
1.317348, 0.3190036, 2.422863, 1, 0, 0.5529412, 1,
1.319285, 1.454716, 1.15752, 1, 0, 0.5450981, 1,
1.319596, -0.6468455, 0.5439904, 1, 0, 0.5411765, 1,
1.334308, -1.720497, 2.569445, 1, 0, 0.5333334, 1,
1.3418, -0.870123, 1.807996, 1, 0, 0.5294118, 1,
1.342832, -1.360309, 2.080639, 1, 0, 0.5215687, 1,
1.345309, 0.4704922, 1.910074, 1, 0, 0.5176471, 1,
1.345492, 1.965307, 1.017031, 1, 0, 0.509804, 1,
1.354807, 1.610984, 1.308495, 1, 0, 0.5058824, 1,
1.367456, 1.282244, 3.595533, 1, 0, 0.4980392, 1,
1.371595, 1.425059, -0.5298355, 1, 0, 0.4901961, 1,
1.38967, 0.5270717, 0.5885372, 1, 0, 0.4862745, 1,
1.392665, 1.062872, 0.3820451, 1, 0, 0.4784314, 1,
1.410502, -0.2202358, -1.282221, 1, 0, 0.4745098, 1,
1.414272, 1.439944, 1.43563, 1, 0, 0.4666667, 1,
1.41989, -0.4493994, 1.224263, 1, 0, 0.4627451, 1,
1.430669, -0.160942, 1.778887, 1, 0, 0.454902, 1,
1.444732, -0.8279083, 1.726381, 1, 0, 0.4509804, 1,
1.450781, -1.329683, 1.107265, 1, 0, 0.4431373, 1,
1.458569, -0.9940279, 3.224217, 1, 0, 0.4392157, 1,
1.460026, -0.7828463, 1.081041, 1, 0, 0.4313726, 1,
1.464377, -0.3219314, 1.268594, 1, 0, 0.427451, 1,
1.466487, -0.8406323, 2.492187, 1, 0, 0.4196078, 1,
1.485614, -1.528224, 1.757392, 1, 0, 0.4156863, 1,
1.490145, 0.5475265, 2.235968, 1, 0, 0.4078431, 1,
1.504138, 0.5919998, 1.795773, 1, 0, 0.4039216, 1,
1.506405, 0.8958275, -0.1229169, 1, 0, 0.3960784, 1,
1.50818, 1.227362, 0.0580641, 1, 0, 0.3882353, 1,
1.511579, -2.234709, 1.878559, 1, 0, 0.3843137, 1,
1.547154, -0.2454992, 2.805245, 1, 0, 0.3764706, 1,
1.55126, -0.711609, -0.1416159, 1, 0, 0.372549, 1,
1.552887, 0.02276649, 0.4566734, 1, 0, 0.3647059, 1,
1.555285, -1.421498, 3.1038, 1, 0, 0.3607843, 1,
1.559066, -0.4898472, 1.558138, 1, 0, 0.3529412, 1,
1.56456, -0.2467222, 1.78934, 1, 0, 0.3490196, 1,
1.566086, 0.8886161, -0.08161704, 1, 0, 0.3411765, 1,
1.569904, -0.3676283, 3.229432, 1, 0, 0.3372549, 1,
1.595927, -1.535595, 2.371165, 1, 0, 0.3294118, 1,
1.610927, 2.196612, 2.540353, 1, 0, 0.3254902, 1,
1.620394, -0.9700658, 2.152555, 1, 0, 0.3176471, 1,
1.62415, -1.125819, 2.118345, 1, 0, 0.3137255, 1,
1.626494, 0.6509029, 1.86591, 1, 0, 0.3058824, 1,
1.63099, -0.6408088, 1.102103, 1, 0, 0.2980392, 1,
1.631328, -0.2896659, 1.85001, 1, 0, 0.2941177, 1,
1.64133, -0.794629, 2.686071, 1, 0, 0.2862745, 1,
1.64918, 0.8601486, 1.782071, 1, 0, 0.282353, 1,
1.656161, 1.15075, 0.636738, 1, 0, 0.2745098, 1,
1.669176, -0.9229714, 3.102592, 1, 0, 0.2705882, 1,
1.669438, -1.011345, 2.030072, 1, 0, 0.2627451, 1,
1.673838, 0.5050504, 1.134153, 1, 0, 0.2588235, 1,
1.701731, -0.8396918, 2.351735, 1, 0, 0.2509804, 1,
1.70538, 0.9239048, -0.1965758, 1, 0, 0.2470588, 1,
1.717555, 0.961485, 1.909838, 1, 0, 0.2392157, 1,
1.731414, -0.5611176, 1.828995, 1, 0, 0.2352941, 1,
1.73683, -0.660991, 2.395767, 1, 0, 0.227451, 1,
1.737782, -1.458589, 3.327354, 1, 0, 0.2235294, 1,
1.744099, 1.35841, 0.5487135, 1, 0, 0.2156863, 1,
1.750064, -0.6809435, 0.8853945, 1, 0, 0.2117647, 1,
1.772645, 0.2592738, 0.8294256, 1, 0, 0.2039216, 1,
1.794125, -0.692399, -0.1817289, 1, 0, 0.1960784, 1,
1.794679, 1.789937, -0.6112093, 1, 0, 0.1921569, 1,
1.805756, 0.67574, 0.6595912, 1, 0, 0.1843137, 1,
1.807265, 0.01728787, 2.689139, 1, 0, 0.1803922, 1,
1.812712, -1.02297, 2.271191, 1, 0, 0.172549, 1,
1.818625, 0.8197485, -0.6430798, 1, 0, 0.1686275, 1,
1.851605, -1.126362, 3.44872, 1, 0, 0.1607843, 1,
1.855626, -1.037611, 0.3894134, 1, 0, 0.1568628, 1,
1.871037, -2.317545, 3.327948, 1, 0, 0.1490196, 1,
1.889711, -2.183842, 3.610865, 1, 0, 0.145098, 1,
1.914569, -1.078513, 2.786162, 1, 0, 0.1372549, 1,
1.926605, -1.705816, 2.944383, 1, 0, 0.1333333, 1,
1.92962, 0.3263178, 1.587992, 1, 0, 0.1254902, 1,
1.944391, -1.146341, 3.767669, 1, 0, 0.1215686, 1,
2.017921, -0.6801203, 2.876788, 1, 0, 0.1137255, 1,
2.024572, 0.1357077, -0.6381292, 1, 0, 0.1098039, 1,
2.0403, -1.647131, 1.888544, 1, 0, 0.1019608, 1,
2.105523, -0.702087, 1.541183, 1, 0, 0.09411765, 1,
2.150571, -1.019714, 1.144861, 1, 0, 0.09019608, 1,
2.250229, 2.290951, -1.116307, 1, 0, 0.08235294, 1,
2.273318, -0.5407483, 1.225441, 1, 0, 0.07843138, 1,
2.289811, 0.8674026, 1.223516, 1, 0, 0.07058824, 1,
2.316865, -0.2418928, 1.789545, 1, 0, 0.06666667, 1,
2.326214, 0.4844701, 3.289847, 1, 0, 0.05882353, 1,
2.348493, 0.3763634, 1.143034, 1, 0, 0.05490196, 1,
2.404787, 1.078172, 1.020863, 1, 0, 0.04705882, 1,
2.5384, -1.143651, 0.6274967, 1, 0, 0.04313726, 1,
2.655151, -1.754807, 2.567364, 1, 0, 0.03529412, 1,
2.670996, -0.181005, -0.3814302, 1, 0, 0.03137255, 1,
2.824243, 0.9309882, 0.4677027, 1, 0, 0.02352941, 1,
3.045838, -0.1866338, -0.007732534, 1, 0, 0.01960784, 1,
3.094786, 0.9839185, 0.7693614, 1, 0, 0.01176471, 1,
3.177692, -1.304341, 3.730386, 1, 0, 0.007843138, 1
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
0.2499378, -4.042124, -7.537949, 0, -0.5, 0.5, 0.5,
0.2499378, -4.042124, -7.537949, 1, -0.5, 0.5, 0.5,
0.2499378, -4.042124, -7.537949, 1, 1.5, 0.5, 0.5,
0.2499378, -4.042124, -7.537949, 0, 1.5, 0.5, 0.5
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
-3.670325, -0.08589041, -7.537949, 0, -0.5, 0.5, 0.5,
-3.670325, -0.08589041, -7.537949, 1, -0.5, 0.5, 0.5,
-3.670325, -0.08589041, -7.537949, 1, 1.5, 0.5, 0.5,
-3.670325, -0.08589041, -7.537949, 0, 1.5, 0.5, 0.5
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
-3.670325, -4.042124, 0.1587372, 0, -0.5, 0.5, 0.5,
-3.670325, -4.042124, 0.1587372, 1, -0.5, 0.5, 0.5,
-3.670325, -4.042124, 0.1587372, 1, 1.5, 0.5, 0.5,
-3.670325, -4.042124, 0.1587372, 0, 1.5, 0.5, 0.5
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
-2, -3.129147, -5.76179,
3, -3.129147, -5.76179,
-2, -3.129147, -5.76179,
-2, -3.28131, -6.057817,
-1, -3.129147, -5.76179,
-1, -3.28131, -6.057817,
0, -3.129147, -5.76179,
0, -3.28131, -6.057817,
1, -3.129147, -5.76179,
1, -3.28131, -6.057817,
2, -3.129147, -5.76179,
2, -3.28131, -6.057817,
3, -3.129147, -5.76179,
3, -3.28131, -6.057817
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
-2, -3.585635, -6.649869, 0, -0.5, 0.5, 0.5,
-2, -3.585635, -6.649869, 1, -0.5, 0.5, 0.5,
-2, -3.585635, -6.649869, 1, 1.5, 0.5, 0.5,
-2, -3.585635, -6.649869, 0, 1.5, 0.5, 0.5,
-1, -3.585635, -6.649869, 0, -0.5, 0.5, 0.5,
-1, -3.585635, -6.649869, 1, -0.5, 0.5, 0.5,
-1, -3.585635, -6.649869, 1, 1.5, 0.5, 0.5,
-1, -3.585635, -6.649869, 0, 1.5, 0.5, 0.5,
0, -3.585635, -6.649869, 0, -0.5, 0.5, 0.5,
0, -3.585635, -6.649869, 1, -0.5, 0.5, 0.5,
0, -3.585635, -6.649869, 1, 1.5, 0.5, 0.5,
0, -3.585635, -6.649869, 0, 1.5, 0.5, 0.5,
1, -3.585635, -6.649869, 0, -0.5, 0.5, 0.5,
1, -3.585635, -6.649869, 1, -0.5, 0.5, 0.5,
1, -3.585635, -6.649869, 1, 1.5, 0.5, 0.5,
1, -3.585635, -6.649869, 0, 1.5, 0.5, 0.5,
2, -3.585635, -6.649869, 0, -0.5, 0.5, 0.5,
2, -3.585635, -6.649869, 1, -0.5, 0.5, 0.5,
2, -3.585635, -6.649869, 1, 1.5, 0.5, 0.5,
2, -3.585635, -6.649869, 0, 1.5, 0.5, 0.5,
3, -3.585635, -6.649869, 0, -0.5, 0.5, 0.5,
3, -3.585635, -6.649869, 1, -0.5, 0.5, 0.5,
3, -3.585635, -6.649869, 1, 1.5, 0.5, 0.5,
3, -3.585635, -6.649869, 0, 1.5, 0.5, 0.5
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
-2.765649, -3, -5.76179,
-2.765649, 2, -5.76179,
-2.765649, -3, -5.76179,
-2.916428, -3, -6.057817,
-2.765649, -2, -5.76179,
-2.916428, -2, -6.057817,
-2.765649, -1, -5.76179,
-2.916428, -1, -6.057817,
-2.765649, 0, -5.76179,
-2.916428, 0, -6.057817,
-2.765649, 1, -5.76179,
-2.916428, 1, -6.057817,
-2.765649, 2, -5.76179,
-2.916428, 2, -6.057817
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
-3.217987, -3, -6.649869, 0, -0.5, 0.5, 0.5,
-3.217987, -3, -6.649869, 1, -0.5, 0.5, 0.5,
-3.217987, -3, -6.649869, 1, 1.5, 0.5, 0.5,
-3.217987, -3, -6.649869, 0, 1.5, 0.5, 0.5,
-3.217987, -2, -6.649869, 0, -0.5, 0.5, 0.5,
-3.217987, -2, -6.649869, 1, -0.5, 0.5, 0.5,
-3.217987, -2, -6.649869, 1, 1.5, 0.5, 0.5,
-3.217987, -2, -6.649869, 0, 1.5, 0.5, 0.5,
-3.217987, -1, -6.649869, 0, -0.5, 0.5, 0.5,
-3.217987, -1, -6.649869, 1, -0.5, 0.5, 0.5,
-3.217987, -1, -6.649869, 1, 1.5, 0.5, 0.5,
-3.217987, -1, -6.649869, 0, 1.5, 0.5, 0.5,
-3.217987, 0, -6.649869, 0, -0.5, 0.5, 0.5,
-3.217987, 0, -6.649869, 1, -0.5, 0.5, 0.5,
-3.217987, 0, -6.649869, 1, 1.5, 0.5, 0.5,
-3.217987, 0, -6.649869, 0, 1.5, 0.5, 0.5,
-3.217987, 1, -6.649869, 0, -0.5, 0.5, 0.5,
-3.217987, 1, -6.649869, 1, -0.5, 0.5, 0.5,
-3.217987, 1, -6.649869, 1, 1.5, 0.5, 0.5,
-3.217987, 1, -6.649869, 0, 1.5, 0.5, 0.5,
-3.217987, 2, -6.649869, 0, -0.5, 0.5, 0.5,
-3.217987, 2, -6.649869, 1, -0.5, 0.5, 0.5,
-3.217987, 2, -6.649869, 1, 1.5, 0.5, 0.5,
-3.217987, 2, -6.649869, 0, 1.5, 0.5, 0.5
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
-2.765649, -3.129147, -4,
-2.765649, -3.129147, 4,
-2.765649, -3.129147, -4,
-2.916428, -3.28131, -4,
-2.765649, -3.129147, -2,
-2.916428, -3.28131, -2,
-2.765649, -3.129147, 0,
-2.916428, -3.28131, 0,
-2.765649, -3.129147, 2,
-2.916428, -3.28131, 2,
-2.765649, -3.129147, 4,
-2.916428, -3.28131, 4
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
-3.217987, -3.585635, -4, 0, -0.5, 0.5, 0.5,
-3.217987, -3.585635, -4, 1, -0.5, 0.5, 0.5,
-3.217987, -3.585635, -4, 1, 1.5, 0.5, 0.5,
-3.217987, -3.585635, -4, 0, 1.5, 0.5, 0.5,
-3.217987, -3.585635, -2, 0, -0.5, 0.5, 0.5,
-3.217987, -3.585635, -2, 1, -0.5, 0.5, 0.5,
-3.217987, -3.585635, -2, 1, 1.5, 0.5, 0.5,
-3.217987, -3.585635, -2, 0, 1.5, 0.5, 0.5,
-3.217987, -3.585635, 0, 0, -0.5, 0.5, 0.5,
-3.217987, -3.585635, 0, 1, -0.5, 0.5, 0.5,
-3.217987, -3.585635, 0, 1, 1.5, 0.5, 0.5,
-3.217987, -3.585635, 0, 0, 1.5, 0.5, 0.5,
-3.217987, -3.585635, 2, 0, -0.5, 0.5, 0.5,
-3.217987, -3.585635, 2, 1, -0.5, 0.5, 0.5,
-3.217987, -3.585635, 2, 1, 1.5, 0.5, 0.5,
-3.217987, -3.585635, 2, 0, 1.5, 0.5, 0.5,
-3.217987, -3.585635, 4, 0, -0.5, 0.5, 0.5,
-3.217987, -3.585635, 4, 1, -0.5, 0.5, 0.5,
-3.217987, -3.585635, 4, 1, 1.5, 0.5, 0.5,
-3.217987, -3.585635, 4, 0, 1.5, 0.5, 0.5
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
-2.765649, -3.129147, -5.76179,
-2.765649, 2.957366, -5.76179,
-2.765649, -3.129147, 6.079265,
-2.765649, 2.957366, 6.079265,
-2.765649, -3.129147, -5.76179,
-2.765649, -3.129147, 6.079265,
-2.765649, 2.957366, -5.76179,
-2.765649, 2.957366, 6.079265,
-2.765649, -3.129147, -5.76179,
3.265525, -3.129147, -5.76179,
-2.765649, -3.129147, 6.079265,
3.265525, -3.129147, 6.079265,
-2.765649, 2.957366, -5.76179,
3.265525, 2.957366, -5.76179,
-2.765649, 2.957366, 6.079265,
3.265525, 2.957366, 6.079265,
3.265525, -3.129147, -5.76179,
3.265525, 2.957366, -5.76179,
3.265525, -3.129147, 6.079265,
3.265525, 2.957366, 6.079265,
3.265525, -3.129147, -5.76179,
3.265525, -3.129147, 6.079265,
3.265525, 2.957366, -5.76179,
3.265525, 2.957366, 6.079265
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
var radius = 7.80473;
var distance = 34.72412;
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
mvMatrix.translate( -0.2499378, 0.08589041, -0.1587372 );
mvMatrix.scale( 1.399168, 1.386447, 0.7126583 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.72412);
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
pyraclofos<-read.table("pyraclofos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyraclofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
```

```r
y<-pyraclofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
```

```r
z<-pyraclofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
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
-2.677816, 1.000263, -2.006108, 0, 0, 1, 1, 1,
-2.620258, -0.557978, -0.1916348, 1, 0, 0, 1, 1,
-2.58627, 0.07412343, -0.6915814, 1, 0, 0, 1, 1,
-2.496401, -2.142962, -3.358427, 1, 0, 0, 1, 1,
-2.413173, -0.06048492, -2.666361, 1, 0, 0, 1, 1,
-2.410322, -0.83963, -2.5829, 1, 0, 0, 1, 1,
-2.396452, -1.489313, -3.894108, 0, 0, 0, 1, 1,
-2.393435, -0.7372693, -2.037917, 0, 0, 0, 1, 1,
-2.387334, -0.007076384, -1.008528, 0, 0, 0, 1, 1,
-2.381031, -1.081143, -1.917956, 0, 0, 0, 1, 1,
-2.350947, 2.400864, -2.706206, 0, 0, 0, 1, 1,
-2.308788, 0.2427173, -0.7358934, 0, 0, 0, 1, 1,
-2.264789, -1.217702, -3.486682, 0, 0, 0, 1, 1,
-2.217218, -0.04726122, -1.269152, 1, 1, 1, 1, 1,
-2.155851, 0.01234995, -1.116792, 1, 1, 1, 1, 1,
-2.152651, -0.08754477, -1.96656, 1, 1, 1, 1, 1,
-2.151502, -0.1766369, -1.660621, 1, 1, 1, 1, 1,
-2.147186, 0.2010766, -2.535132, 1, 1, 1, 1, 1,
-2.140711, -1.644562, -1.794111, 1, 1, 1, 1, 1,
-2.130908, 0.2885768, -2.807713, 1, 1, 1, 1, 1,
-2.059473, 0.0931796, -0.3419379, 1, 1, 1, 1, 1,
-2.025584, -1.165283, -2.347976, 1, 1, 1, 1, 1,
-1.989067, 0.01245998, -1.080738, 1, 1, 1, 1, 1,
-1.955511, -0.6333994, -0.7633394, 1, 1, 1, 1, 1,
-1.955153, 0.09227734, -2.825765, 1, 1, 1, 1, 1,
-1.946166, 0.2116227, -1.89157, 1, 1, 1, 1, 1,
-1.946071, 0.4731491, 0.6019012, 1, 1, 1, 1, 1,
-1.925398, 0.01597152, -1.807814, 1, 1, 1, 1, 1,
-1.914673, 1.400879, 0.138199, 0, 0, 1, 1, 1,
-1.912045, -0.5050717, -2.821492, 1, 0, 0, 1, 1,
-1.90393, 0.6442993, -0.07359376, 1, 0, 0, 1, 1,
-1.889433, 1.215734, -2.346831, 1, 0, 0, 1, 1,
-1.871321, 0.8815745, -2.279742, 1, 0, 0, 1, 1,
-1.868384, 0.5815639, 0.2721546, 1, 0, 0, 1, 1,
-1.834316, -0.2730848, -2.356952, 0, 0, 0, 1, 1,
-1.818873, 0.1044842, -2.378428, 0, 0, 0, 1, 1,
-1.764522, -0.0278944, -1.413998, 0, 0, 0, 1, 1,
-1.740256, 0.278447, -1.552678, 0, 0, 0, 1, 1,
-1.737168, -1.102978, -0.6562183, 0, 0, 0, 1, 1,
-1.728671, 1.47807, -2.593154, 0, 0, 0, 1, 1,
-1.723627, -0.9791421, -2.426763, 0, 0, 0, 1, 1,
-1.707619, 2.132585, -0.7383274, 1, 1, 1, 1, 1,
-1.691232, 0.3074137, -2.274055, 1, 1, 1, 1, 1,
-1.689381, 0.1464322, -4.236922, 1, 1, 1, 1, 1,
-1.668235, 0.0953606, -3.32815, 1, 1, 1, 1, 1,
-1.664859, -1.54131, -1.51591, 1, 1, 1, 1, 1,
-1.664482, 2.287059, 0.09004273, 1, 1, 1, 1, 1,
-1.646334, 0.5656513, -1.113813, 1, 1, 1, 1, 1,
-1.645133, -1.079991, -2.622002, 1, 1, 1, 1, 1,
-1.642107, -1.294461, -2.24418, 1, 1, 1, 1, 1,
-1.628649, 0.1944126, -0.6141173, 1, 1, 1, 1, 1,
-1.623361, 1.43151, -1.357614, 1, 1, 1, 1, 1,
-1.621332, 2.740151, 1.169466, 1, 1, 1, 1, 1,
-1.621079, -0.8568092, -2.598889, 1, 1, 1, 1, 1,
-1.595802, -0.5156314, -1.462297, 1, 1, 1, 1, 1,
-1.582879, 0.7673611, -0.1152568, 1, 1, 1, 1, 1,
-1.582329, -0.8794348, -1.954659, 0, 0, 1, 1, 1,
-1.566383, 0.8724542, -2.410069, 1, 0, 0, 1, 1,
-1.556252, -1.981407, -5.282092, 1, 0, 0, 1, 1,
-1.549085, -0.7119859, -2.031817, 1, 0, 0, 1, 1,
-1.53491, 0.3758182, -1.510185, 1, 0, 0, 1, 1,
-1.522917, -0.4535199, -0.5831252, 1, 0, 0, 1, 1,
-1.521325, 0.396913, -0.4583946, 0, 0, 0, 1, 1,
-1.508576, 0.6711432, -1.274831, 0, 0, 0, 1, 1,
-1.503206, -1.126974, -0.3413286, 0, 0, 0, 1, 1,
-1.501907, 1.326079, -0.7594157, 0, 0, 0, 1, 1,
-1.491215, -0.1381088, -1.768853, 0, 0, 0, 1, 1,
-1.478204, -1.124269, -2.299602, 0, 0, 0, 1, 1,
-1.471436, -0.001489459, -1.389793, 0, 0, 0, 1, 1,
-1.465256, -1.214053, -0.9284881, 1, 1, 1, 1, 1,
-1.456333, 0.8468053, -0.6315161, 1, 1, 1, 1, 1,
-1.435787, -0.9833752, -4.867841, 1, 1, 1, 1, 1,
-1.425805, 0.541002, -0.6974866, 1, 1, 1, 1, 1,
-1.414234, -0.6877528, -0.02085859, 1, 1, 1, 1, 1,
-1.377474, 0.8700542, -0.1396615, 1, 1, 1, 1, 1,
-1.353859, -1.398332, -3.013121, 1, 1, 1, 1, 1,
-1.349779, -0.9476831, -1.004505, 1, 1, 1, 1, 1,
-1.34607, 0.8340354, 0.09908897, 1, 1, 1, 1, 1,
-1.343516, -1.799145, -2.891658, 1, 1, 1, 1, 1,
-1.336063, -1.685613, -1.877586, 1, 1, 1, 1, 1,
-1.329622, 2.246789, -0.2501975, 1, 1, 1, 1, 1,
-1.32941, -1.096118, -1.183496, 1, 1, 1, 1, 1,
-1.329223, 0.2412348, -1.0582, 1, 1, 1, 1, 1,
-1.32689, -0.08238961, -3.205023, 1, 1, 1, 1, 1,
-1.320545, -0.3976512, -1.441806, 0, 0, 1, 1, 1,
-1.317128, 0.844291, -1.637181, 1, 0, 0, 1, 1,
-1.314652, 0.9357383, 0.4146545, 1, 0, 0, 1, 1,
-1.302457, -0.01091109, -1.436414, 1, 0, 0, 1, 1,
-1.28265, 0.1126056, -1.447134, 1, 0, 0, 1, 1,
-1.270902, 0.3810191, -0.1276187, 1, 0, 0, 1, 1,
-1.26893, 1.206655, -0.5112264, 0, 0, 0, 1, 1,
-1.267953, -1.27818, -2.52055, 0, 0, 0, 1, 1,
-1.264668, -0.3237754, -1.491094, 0, 0, 0, 1, 1,
-1.250929, -0.6256046, -3.110598, 0, 0, 0, 1, 1,
-1.245034, 0.3767411, -0.8194819, 0, 0, 0, 1, 1,
-1.237362, -0.6204955, -1.835798, 0, 0, 0, 1, 1,
-1.234143, 1.127909, -1.678589, 0, 0, 0, 1, 1,
-1.234093, -0.07673107, -2.816706, 1, 1, 1, 1, 1,
-1.229964, 0.5867378, -1.181486, 1, 1, 1, 1, 1,
-1.221996, -1.09045, -1.070292, 1, 1, 1, 1, 1,
-1.213467, -1.088043, -3.802516, 1, 1, 1, 1, 1,
-1.210831, -0.7490097, -2.904918, 1, 1, 1, 1, 1,
-1.200607, -0.9601166, -2.132775, 1, 1, 1, 1, 1,
-1.199836, -0.1588976, -2.490022, 1, 1, 1, 1, 1,
-1.196282, -1.52544, -3.478141, 1, 1, 1, 1, 1,
-1.187718, 0.7679622, -2.180181, 1, 1, 1, 1, 1,
-1.167471, -0.4723209, -1.931523, 1, 1, 1, 1, 1,
-1.165156, -1.341352, -1.852257, 1, 1, 1, 1, 1,
-1.161684, 0.1212251, -1.540949, 1, 1, 1, 1, 1,
-1.159712, -0.2699452, -3.766037, 1, 1, 1, 1, 1,
-1.152204, -0.06994586, -2.050117, 1, 1, 1, 1, 1,
-1.147828, 1.301224, 0.2601595, 1, 1, 1, 1, 1,
-1.146376, -0.6517276, -0.7427127, 0, 0, 1, 1, 1,
-1.144998, 0.3860638, -1.198929, 1, 0, 0, 1, 1,
-1.134881, 0.7189486, -3.22479, 1, 0, 0, 1, 1,
-1.132035, -0.3702172, -2.430102, 1, 0, 0, 1, 1,
-1.127705, 1.84417, 1.034307, 1, 0, 0, 1, 1,
-1.11871, -0.947811, -3.26966, 1, 0, 0, 1, 1,
-1.114026, -0.5365596, -3.01647, 0, 0, 0, 1, 1,
-1.111331, 1.406627, -0.1833563, 0, 0, 0, 1, 1,
-1.105775, 0.3842849, -1.013767, 0, 0, 0, 1, 1,
-1.103248, -0.1226816, -1.928146, 0, 0, 0, 1, 1,
-1.102317, 1.822204, -1.915329, 0, 0, 0, 1, 1,
-1.096956, -0.253584, -0.2053672, 0, 0, 0, 1, 1,
-1.095527, 0.9228497, -0.6461981, 0, 0, 0, 1, 1,
-1.093632, 0.7432137, -1.15346, 1, 1, 1, 1, 1,
-1.093428, -0.3501813, -4.137189, 1, 1, 1, 1, 1,
-1.086723, 0.9000574, -0.1015787, 1, 1, 1, 1, 1,
-1.086241, 1.160579, -0.2018476, 1, 1, 1, 1, 1,
-1.081686, -2.215989, -3.695334, 1, 1, 1, 1, 1,
-1.078698, 2.357785, -0.1843018, 1, 1, 1, 1, 1,
-1.075329, -0.2538563, -2.010653, 1, 1, 1, 1, 1,
-1.074393, -1.353178, -1.993582, 1, 1, 1, 1, 1,
-1.072712, -0.8089557, -3.606955, 1, 1, 1, 1, 1,
-1.067407, 1.591385, 0.8309253, 1, 1, 1, 1, 1,
-1.066606, 1.576697, -2.08288, 1, 1, 1, 1, 1,
-1.06638, -1.070182, -1.303068, 1, 1, 1, 1, 1,
-1.065718, -0.1495174, -1.521016, 1, 1, 1, 1, 1,
-1.057028, -0.1446862, -2.879572, 1, 1, 1, 1, 1,
-1.056635, 1.513949, -1.223058, 1, 1, 1, 1, 1,
-1.047727, -0.17162, -1.508341, 0, 0, 1, 1, 1,
-1.032165, -1.918981, -2.138823, 1, 0, 0, 1, 1,
-1.026274, 1.357179, -0.4480451, 1, 0, 0, 1, 1,
-1.02385, 0.6781379, 0.2255193, 1, 0, 0, 1, 1,
-1.02154, -2.178653, -2.271582, 1, 0, 0, 1, 1,
-1.015847, -2.296166, -2.704776, 1, 0, 0, 1, 1,
-1.013135, -1.229014, -3.733217, 0, 0, 0, 1, 1,
-1.012078, -1.02703, -1.537186, 0, 0, 0, 1, 1,
-1.008985, 0.7679608, -0.8793226, 0, 0, 0, 1, 1,
-1.005089, 0.1300894, -2.98781, 0, 0, 0, 1, 1,
-1.00284, -0.6127819, -1.506723, 0, 0, 0, 1, 1,
-0.9898866, 0.2707708, -0.5001453, 0, 0, 0, 1, 1,
-0.9827194, -0.7462478, 0.02279636, 0, 0, 0, 1, 1,
-0.9825128, 0.08614577, -1.800355, 1, 1, 1, 1, 1,
-0.9811183, 1.376064, 0.5214015, 1, 1, 1, 1, 1,
-0.9807047, 0.9320101, -1.341838, 1, 1, 1, 1, 1,
-0.9791973, -2.063553, -2.724894, 1, 1, 1, 1, 1,
-0.9764856, 0.6992121, -0.4567523, 1, 1, 1, 1, 1,
-0.9763355, 1.014334, -1.177876, 1, 1, 1, 1, 1,
-0.9762098, 0.3400501, -0.21114, 1, 1, 1, 1, 1,
-0.9762061, -0.6485531, -2.261348, 1, 1, 1, 1, 1,
-0.9754593, -0.1433148, -2.819643, 1, 1, 1, 1, 1,
-0.9667307, -1.379098, -3.515332, 1, 1, 1, 1, 1,
-0.9653624, 1.203516, -0.7360966, 1, 1, 1, 1, 1,
-0.9638044, -1.351742, -0.6840405, 1, 1, 1, 1, 1,
-0.9621676, -0.1985413, -1.664566, 1, 1, 1, 1, 1,
-0.9574756, -0.7648833, -3.961493, 1, 1, 1, 1, 1,
-0.9572036, -2.232742, -1.93361, 1, 1, 1, 1, 1,
-0.9555658, -0.6723432, -0.1275465, 0, 0, 1, 1, 1,
-0.9549593, 0.01742382, -0.4647229, 1, 0, 0, 1, 1,
-0.9535009, -0.3363094, -0.3891159, 1, 0, 0, 1, 1,
-0.9465647, -0.07106862, -1.341006, 1, 0, 0, 1, 1,
-0.938902, 1.11775, -0.02565923, 1, 0, 0, 1, 1,
-0.937651, -0.04692098, -1.238526, 1, 0, 0, 1, 1,
-0.9362546, 2.285006, 1.178501, 0, 0, 0, 1, 1,
-0.9342449, 0.5396808, 0.6223671, 0, 0, 0, 1, 1,
-0.9191156, -0.9936153, -1.010679, 0, 0, 0, 1, 1,
-0.9182584, 0.7788917, -2.08961, 0, 0, 0, 1, 1,
-0.9165263, -0.2662172, -1.651137, 0, 0, 0, 1, 1,
-0.914215, -0.1477367, -1.298095, 0, 0, 0, 1, 1,
-0.9133272, 0.8963179, -2.663476, 0, 0, 0, 1, 1,
-0.9065999, -0.7671453, -2.298092, 1, 1, 1, 1, 1,
-0.9011592, 0.8830544, 0.0290495, 1, 1, 1, 1, 1,
-0.8973823, 0.7013123, -1.420686, 1, 1, 1, 1, 1,
-0.8955721, -1.122325, -2.077368, 1, 1, 1, 1, 1,
-0.8891421, 0.8617767, 0.1055671, 1, 1, 1, 1, 1,
-0.8866222, 1.226921, -0.2428667, 1, 1, 1, 1, 1,
-0.88631, -1.580054, -3.711379, 1, 1, 1, 1, 1,
-0.8839336, -0.6253844, -2.106287, 1, 1, 1, 1, 1,
-0.8835741, 0.996902, -1.057819, 1, 1, 1, 1, 1,
-0.8822962, -1.328496, -4.069091, 1, 1, 1, 1, 1,
-0.8682922, 2.116671, -0.6036132, 1, 1, 1, 1, 1,
-0.8676848, -0.999292, -1.602234, 1, 1, 1, 1, 1,
-0.8598849, 0.5576056, -2.069892, 1, 1, 1, 1, 1,
-0.8573049, 0.7097188, -1.806136, 1, 1, 1, 1, 1,
-0.8571777, 0.4256935, -1.10502, 1, 1, 1, 1, 1,
-0.8501089, -0.4420094, -2.998333, 0, 0, 1, 1, 1,
-0.845983, -1.837455, -2.911714, 1, 0, 0, 1, 1,
-0.8413141, 1.650557, -0.2651239, 1, 0, 0, 1, 1,
-0.8410305, 0.1109832, -1.627863, 1, 0, 0, 1, 1,
-0.8402297, 0.5219601, -0.6756723, 1, 0, 0, 1, 1,
-0.8384188, 0.681644, 0.1085874, 1, 0, 0, 1, 1,
-0.8369774, -1.523641, -1.543848, 0, 0, 0, 1, 1,
-0.8344789, 1.044416, -1.148139, 0, 0, 0, 1, 1,
-0.8241062, 0.7028355, -1.825806, 0, 0, 0, 1, 1,
-0.8081002, 0.03333138, -1.941791, 0, 0, 0, 1, 1,
-0.8022543, 0.7133636, -1.399198, 0, 0, 0, 1, 1,
-0.7996488, -1.160302, 0.6804563, 0, 0, 0, 1, 1,
-0.7955065, 1.398717, -0.1239419, 0, 0, 0, 1, 1,
-0.7920974, 0.2149817, -0.9722502, 1, 1, 1, 1, 1,
-0.7851769, -0.7644467, -2.313795, 1, 1, 1, 1, 1,
-0.7851717, 0.2293833, -1.448602, 1, 1, 1, 1, 1,
-0.77606, -2.335694, -3.337323, 1, 1, 1, 1, 1,
-0.7654787, 0.06193307, -1.299157, 1, 1, 1, 1, 1,
-0.7644489, 2.123092, 1.048288, 1, 1, 1, 1, 1,
-0.7602444, -2.402411, -2.425562, 1, 1, 1, 1, 1,
-0.7600471, -1.322558, 0.1078861, 1, 1, 1, 1, 1,
-0.7595359, -0.4361167, -1.861517, 1, 1, 1, 1, 1,
-0.7585191, 0.9910357, 0.3134177, 1, 1, 1, 1, 1,
-0.757157, 1.727683, -0.3414883, 1, 1, 1, 1, 1,
-0.7564362, 0.0668212, -0.480289, 1, 1, 1, 1, 1,
-0.7539368, -0.8876764, -4.620181, 1, 1, 1, 1, 1,
-0.7521095, 0.9749539, -1.892751, 1, 1, 1, 1, 1,
-0.7485597, -1.857492, -1.940533, 1, 1, 1, 1, 1,
-0.7417564, 1.962841, -1.163092, 0, 0, 1, 1, 1,
-0.7411516, 0.5074483, -0.3633901, 1, 0, 0, 1, 1,
-0.7388287, 1.215181, -1.001459, 1, 0, 0, 1, 1,
-0.7325644, 0.5741172, -0.2561754, 1, 0, 0, 1, 1,
-0.7292892, 0.02778379, -2.759894, 1, 0, 0, 1, 1,
-0.7285317, -2.44737, -2.8036, 1, 0, 0, 1, 1,
-0.7227898, -0.4620442, -1.302616, 0, 0, 0, 1, 1,
-0.7224019, -1.140932, -3.315565, 0, 0, 0, 1, 1,
-0.7151718, 1.654211, 0.8956297, 0, 0, 0, 1, 1,
-0.7138066, 1.384816, 0.9325898, 0, 0, 0, 1, 1,
-0.7096001, -1.187716, -2.389029, 0, 0, 0, 1, 1,
-0.7076737, -1.015083, -3.062394, 0, 0, 0, 1, 1,
-0.7039893, -0.04877869, -1.569215, 0, 0, 0, 1, 1,
-0.7030033, -1.571827, -2.568082, 1, 1, 1, 1, 1,
-0.7024249, 1.216847, 0.0270234, 1, 1, 1, 1, 1,
-0.7007902, -0.7360982, -1.598542, 1, 1, 1, 1, 1,
-0.6779099, -0.8494778, -3.26399, 1, 1, 1, 1, 1,
-0.6767441, -0.1015943, -2.406991, 1, 1, 1, 1, 1,
-0.6764805, -0.1028443, -1.00079, 1, 1, 1, 1, 1,
-0.6764506, -0.2845788, -2.81944, 1, 1, 1, 1, 1,
-0.6710044, -0.3404326, -2.319098, 1, 1, 1, 1, 1,
-0.6684092, 0.7931785, 0.2530328, 1, 1, 1, 1, 1,
-0.6659912, 0.9203417, 0.4868945, 1, 1, 1, 1, 1,
-0.6613064, -0.07375583, -1.875572, 1, 1, 1, 1, 1,
-0.652052, 0.6637384, -2.974783, 1, 1, 1, 1, 1,
-0.6504729, -0.7181525, -2.961215, 1, 1, 1, 1, 1,
-0.6436899, -0.006377154, -1.122371, 1, 1, 1, 1, 1,
-0.6401821, 0.6390026, -0.1438854, 1, 1, 1, 1, 1,
-0.6392266, -0.2901441, -1.357338, 0, 0, 1, 1, 1,
-0.6321093, 1.348555, 0.3957558, 1, 0, 0, 1, 1,
-0.629098, 0.2258753, -0.3592686, 1, 0, 0, 1, 1,
-0.6263705, -0.238064, -3.384994, 1, 0, 0, 1, 1,
-0.6251497, -1.218855, -3.164686, 1, 0, 0, 1, 1,
-0.6249237, 0.4992127, -1.25949, 1, 0, 0, 1, 1,
-0.6207507, -0.5551263, -2.191832, 0, 0, 0, 1, 1,
-0.6189349, -1.227465, -1.524337, 0, 0, 0, 1, 1,
-0.6156985, 2.280287, 0.2323377, 0, 0, 0, 1, 1,
-0.6155122, -1.720717, -4.348157, 0, 0, 0, 1, 1,
-0.6151995, -0.281863, -3.071758, 0, 0, 0, 1, 1,
-0.6138791, 0.1052453, -1.439929, 0, 0, 0, 1, 1,
-0.6133186, -1.786441, -2.747373, 0, 0, 0, 1, 1,
-0.6088686, 0.05237373, -0.6634511, 1, 1, 1, 1, 1,
-0.5923886, 0.554117, -0.6895498, 1, 1, 1, 1, 1,
-0.5918328, -0.4318264, -0.5963831, 1, 1, 1, 1, 1,
-0.5911561, -0.1543957, -1.796306, 1, 1, 1, 1, 1,
-0.5903839, 0.9342227, -0.04622935, 1, 1, 1, 1, 1,
-0.5896518, 2.384111, -0.29123, 1, 1, 1, 1, 1,
-0.5875389, 1.171418, -0.843419, 1, 1, 1, 1, 1,
-0.5827057, 0.09948312, -2.742091, 1, 1, 1, 1, 1,
-0.5623323, 0.6674141, -0.3432969, 1, 1, 1, 1, 1,
-0.553748, -0.4484198, -3.411637, 1, 1, 1, 1, 1,
-0.5518276, -1.60632, -3.140663, 1, 1, 1, 1, 1,
-0.5489239, -0.3589325, -2.119868, 1, 1, 1, 1, 1,
-0.5461186, 1.616255, -0.5448185, 1, 1, 1, 1, 1,
-0.5460629, -1.968481, -2.234968, 1, 1, 1, 1, 1,
-0.5425851, 0.6857425, -1.74048, 1, 1, 1, 1, 1,
-0.5419704, 0.01941282, -2.467843, 0, 0, 1, 1, 1,
-0.5402895, 0.8656448, -0.9289876, 1, 0, 0, 1, 1,
-0.5395661, -0.27455, -2.859613, 1, 0, 0, 1, 1,
-0.5329084, 0.8071851, -1.459344, 1, 0, 0, 1, 1,
-0.5328065, -0.9764334, -2.173619, 1, 0, 0, 1, 1,
-0.5325292, 0.1717041, -1.7256, 1, 0, 0, 1, 1,
-0.5283988, 0.06413931, -0.9478922, 0, 0, 0, 1, 1,
-0.523291, -0.5934127, -3.767469, 0, 0, 0, 1, 1,
-0.5227394, -0.4137866, -1.679124, 0, 0, 0, 1, 1,
-0.5223361, -1.247395, -1.908532, 0, 0, 0, 1, 1,
-0.5211782, 1.12151, -0.7016211, 0, 0, 0, 1, 1,
-0.519963, -0.7115982, -2.498273, 0, 0, 0, 1, 1,
-0.5193257, 0.3904586, 0.428545, 0, 0, 0, 1, 1,
-0.5176361, 1.582435, -0.5369523, 1, 1, 1, 1, 1,
-0.517109, -1.167072, -1.66292, 1, 1, 1, 1, 1,
-0.5108205, -0.6890458, -2.117631, 1, 1, 1, 1, 1,
-0.5063938, -0.8909873, -1.813383, 1, 1, 1, 1, 1,
-0.5061159, -0.6222616, -2.531928, 1, 1, 1, 1, 1,
-0.5038345, 2.324219, 0.7526295, 1, 1, 1, 1, 1,
-0.5032022, 0.6632212, -0.07120684, 1, 1, 1, 1, 1,
-0.5004393, 2.258111, 0.6097274, 1, 1, 1, 1, 1,
-0.5001221, -1.403883, -2.989609, 1, 1, 1, 1, 1,
-0.4968173, 0.5889088, 0.1910483, 1, 1, 1, 1, 1,
-0.495386, 1.725803, -1.903146, 1, 1, 1, 1, 1,
-0.4948349, 1.143506, 0.2517163, 1, 1, 1, 1, 1,
-0.4867406, 0.406418, 0.09542236, 1, 1, 1, 1, 1,
-0.4856316, 1.08923, -0.09002935, 1, 1, 1, 1, 1,
-0.4851186, 0.003080488, -0.8244751, 1, 1, 1, 1, 1,
-0.4806358, 1.898734, -0.2274306, 0, 0, 1, 1, 1,
-0.4799334, -0.2336916, -2.153063, 1, 0, 0, 1, 1,
-0.4787156, -0.9267406, -1.442949, 1, 0, 0, 1, 1,
-0.4776904, 0.294152, -1.700933, 1, 0, 0, 1, 1,
-0.4769823, 0.3148518, -1.146454, 1, 0, 0, 1, 1,
-0.4716462, -1.565006, -3.262041, 1, 0, 0, 1, 1,
-0.4681774, -0.2130006, -2.578655, 0, 0, 0, 1, 1,
-0.4674085, -0.834728, -2.676823, 0, 0, 0, 1, 1,
-0.4668668, 0.9593699, -1.140274, 0, 0, 0, 1, 1,
-0.4667661, -1.087396, -2.726244, 0, 0, 0, 1, 1,
-0.4662766, 0.629256, 1.818812, 0, 0, 0, 1, 1,
-0.4655057, 1.425039, -0.1536997, 0, 0, 0, 1, 1,
-0.4585779, -0.2917317, -3.077482, 0, 0, 0, 1, 1,
-0.4569191, -1.257539, -2.99147, 1, 1, 1, 1, 1,
-0.456277, 0.2056666, -1.612371, 1, 1, 1, 1, 1,
-0.4540949, -1.969512, -3.380034, 1, 1, 1, 1, 1,
-0.4517776, -0.7724344, -2.88328, 1, 1, 1, 1, 1,
-0.451693, -1.835944, -1.942605, 1, 1, 1, 1, 1,
-0.4470769, 1.17289, 0.9863969, 1, 1, 1, 1, 1,
-0.4422835, 1.239149, 0.6030008, 1, 1, 1, 1, 1,
-0.4385133, 0.1999406, 0.3702525, 1, 1, 1, 1, 1,
-0.4376952, 0.4873811, -1.000425, 1, 1, 1, 1, 1,
-0.4346332, 0.02493074, -1.779735, 1, 1, 1, 1, 1,
-0.4307507, 1.468979, -1.338545, 1, 1, 1, 1, 1,
-0.429848, -1.084394, -2.410085, 1, 1, 1, 1, 1,
-0.4232123, -1.226224, -2.603283, 1, 1, 1, 1, 1,
-0.4221182, 0.8210623, -1.001563, 1, 1, 1, 1, 1,
-0.420006, -1.051719, -2.92579, 1, 1, 1, 1, 1,
-0.4169267, -1.848672, -2.133554, 0, 0, 1, 1, 1,
-0.4165721, 0.210123, -0.9656796, 1, 0, 0, 1, 1,
-0.4125871, -0.9793578, -2.604491, 1, 0, 0, 1, 1,
-0.4102928, 0.7660332, -0.6533036, 1, 0, 0, 1, 1,
-0.3995675, -0.3596565, -3.008271, 1, 0, 0, 1, 1,
-0.3986166, -0.7570878, -3.360275, 1, 0, 0, 1, 1,
-0.3983013, 2.822136, 0.8375975, 0, 0, 0, 1, 1,
-0.3982094, -0.7484606, -3.40484, 0, 0, 0, 1, 1,
-0.3966854, 1.920065, -0.5263757, 0, 0, 0, 1, 1,
-0.3949142, 0.9743955, -0.4008522, 0, 0, 0, 1, 1,
-0.3892236, -0.09069546, -1.792819, 0, 0, 0, 1, 1,
-0.3879619, 1.54755, -1.502038, 0, 0, 0, 1, 1,
-0.3873494, 0.7398993, 0.8646897, 0, 0, 0, 1, 1,
-0.3871292, -0.8740771, -2.002366, 1, 1, 1, 1, 1,
-0.385813, -0.7597207, -1.374382, 1, 1, 1, 1, 1,
-0.3756041, -0.2948015, -2.584955, 1, 1, 1, 1, 1,
-0.3742804, -0.8860994, -3.211385, 1, 1, 1, 1, 1,
-0.3730718, -0.7519227, -2.669148, 1, 1, 1, 1, 1,
-0.3634054, -0.004186112, -1.124012, 1, 1, 1, 1, 1,
-0.3599833, -1.080438, -0.8794684, 1, 1, 1, 1, 1,
-0.3556639, 0.595829, 0.9631419, 1, 1, 1, 1, 1,
-0.3523972, -0.2436755, -1.765651, 1, 1, 1, 1, 1,
-0.3502051, 2.049196, -2.366817, 1, 1, 1, 1, 1,
-0.3417845, 0.2380903, -2.618999, 1, 1, 1, 1, 1,
-0.3389104, 0.5240474, -0.09649646, 1, 1, 1, 1, 1,
-0.3352264, 0.3799985, -0.7171524, 1, 1, 1, 1, 1,
-0.3323987, 0.6075696, -0.7784334, 1, 1, 1, 1, 1,
-0.3289457, 2.300654, 0.09638013, 1, 1, 1, 1, 1,
-0.3287927, 0.1288567, -1.277599, 0, 0, 1, 1, 1,
-0.3260141, -1.195848, -1.336604, 1, 0, 0, 1, 1,
-0.3220496, -0.7082351, -3.925066, 1, 0, 0, 1, 1,
-0.3217689, -0.3907147, -3.027426, 1, 0, 0, 1, 1,
-0.321164, -0.2819611, -3.495429, 1, 0, 0, 1, 1,
-0.3169428, -2.130976, -4.164621, 1, 0, 0, 1, 1,
-0.31495, 0.340248, -0.2213125, 0, 0, 0, 1, 1,
-0.3122897, 0.2684332, 0.3209945, 0, 0, 0, 1, 1,
-0.3060829, -0.09572737, -0.9820509, 0, 0, 0, 1, 1,
-0.3039776, -1.222021, -3.060909, 0, 0, 0, 1, 1,
-0.2946947, -0.4023888, -2.767413, 0, 0, 0, 1, 1,
-0.2924908, 0.6134204, 0.4309164, 0, 0, 0, 1, 1,
-0.2894643, 0.5656461, 0.6986584, 0, 0, 0, 1, 1,
-0.2880104, 1.07792, 0.7877331, 1, 1, 1, 1, 1,
-0.2865417, -1.454722, -2.775124, 1, 1, 1, 1, 1,
-0.284839, 1.366985, 0.02913062, 1, 1, 1, 1, 1,
-0.2818517, 0.07561541, -0.4856588, 1, 1, 1, 1, 1,
-0.2783994, -0.4432283, -3.378821, 1, 1, 1, 1, 1,
-0.2780519, -2.762581, -3.901263, 1, 1, 1, 1, 1,
-0.2775555, 0.2961901, 0.7428795, 1, 1, 1, 1, 1,
-0.2775442, 1.349701, 0.5488499, 1, 1, 1, 1, 1,
-0.2753302, 0.1317286, -0.5979407, 1, 1, 1, 1, 1,
-0.2730384, -0.4979834, -3.120401, 1, 1, 1, 1, 1,
-0.2698815, 0.9336032, -1.394154, 1, 1, 1, 1, 1,
-0.2666648, 0.1232019, -1.694161, 1, 1, 1, 1, 1,
-0.2660967, -1.623182, -2.201269, 1, 1, 1, 1, 1,
-0.2656545, -0.4766448, -2.600476, 1, 1, 1, 1, 1,
-0.259296, 1.135022, 0.02998974, 1, 1, 1, 1, 1,
-0.2586567, -0.03971784, -2.943168, 0, 0, 1, 1, 1,
-0.2576999, -2.726564, -2.944253, 1, 0, 0, 1, 1,
-0.2575934, -0.7542096, -2.889189, 1, 0, 0, 1, 1,
-0.2489514, 1.017032, 1.408758, 1, 0, 0, 1, 1,
-0.2485452, 0.7566781, 0.349218, 1, 0, 0, 1, 1,
-0.2423813, 0.607455, 0.9913183, 1, 0, 0, 1, 1,
-0.2411229, 2.084475, -1.080776, 0, 0, 0, 1, 1,
-0.2391568, 0.9192824, -0.386485, 0, 0, 0, 1, 1,
-0.2359878, 0.479649, 0.6345557, 0, 0, 0, 1, 1,
-0.2350529, 0.2959219, 0.202306, 0, 0, 0, 1, 1,
-0.2336678, 1.696837, 1.209611, 0, 0, 0, 1, 1,
-0.2333914, -0.4031277, -2.657643, 0, 0, 0, 1, 1,
-0.2299898, 0.3522255, -1.850772, 0, 0, 0, 1, 1,
-0.2137458, -0.56433, -3.167892, 1, 1, 1, 1, 1,
-0.2124536, 0.5596286, -2.186531, 1, 1, 1, 1, 1,
-0.2117457, -0.9729207, -0.9047912, 1, 1, 1, 1, 1,
-0.2007132, -1.211714, -2.971457, 1, 1, 1, 1, 1,
-0.197336, 1.676731, -0.5699832, 1, 1, 1, 1, 1,
-0.1920898, 0.9151998, -0.7479799, 1, 1, 1, 1, 1,
-0.189152, -0.02331374, -2.488839, 1, 1, 1, 1, 1,
-0.185788, 0.1277878, -1.16408, 1, 1, 1, 1, 1,
-0.185548, -1.066216, -2.901084, 1, 1, 1, 1, 1,
-0.1824248, 0.7569765, -2.179999, 1, 1, 1, 1, 1,
-0.1792573, -1.012033, -3.676872, 1, 1, 1, 1, 1,
-0.1790654, -0.3284113, -3.248765, 1, 1, 1, 1, 1,
-0.17768, 0.1261897, -1.627622, 1, 1, 1, 1, 1,
-0.1771337, 0.040185, -2.06659, 1, 1, 1, 1, 1,
-0.1750738, 0.6628947, -0.788533, 1, 1, 1, 1, 1,
-0.1745398, 0.6566092, -2.058463, 0, 0, 1, 1, 1,
-0.1737625, -0.06221534, -2.711907, 1, 0, 0, 1, 1,
-0.1714787, 1.409457, 0.526466, 1, 0, 0, 1, 1,
-0.1688388, 0.1405141, -1.139737, 1, 0, 0, 1, 1,
-0.1671345, 0.03444202, -1.438751, 1, 0, 0, 1, 1,
-0.1651142, -0.4599373, -3.823523, 1, 0, 0, 1, 1,
-0.1645003, 0.5095885, -1.524761, 0, 0, 0, 1, 1,
-0.1610805, 0.375106, -2.076637, 0, 0, 0, 1, 1,
-0.1603476, 1.255461, -0.2226836, 0, 0, 0, 1, 1,
-0.1577506, 0.6467348, -0.6311807, 0, 0, 0, 1, 1,
-0.155462, -0.8945882, -3.043365, 0, 0, 0, 1, 1,
-0.1550523, -0.8873515, -3.049031, 0, 0, 0, 1, 1,
-0.1541825, -0.4786357, -3.255059, 0, 0, 0, 1, 1,
-0.1539158, -0.9550771, -3.965046, 1, 1, 1, 1, 1,
-0.1532095, -2.199798, -3.570646, 1, 1, 1, 1, 1,
-0.1524835, -0.3607953, -3.249474, 1, 1, 1, 1, 1,
-0.1524124, 0.8955525, -0.6403466, 1, 1, 1, 1, 1,
-0.1522529, -0.3679705, -2.843337, 1, 1, 1, 1, 1,
-0.1480869, 0.9462788, -0.6149721, 1, 1, 1, 1, 1,
-0.1452768, 0.4011856, -1.918644, 1, 1, 1, 1, 1,
-0.1414239, 0.4908123, -0.8907534, 1, 1, 1, 1, 1,
-0.1314537, 0.0827129, -0.6492599, 1, 1, 1, 1, 1,
-0.1278112, -0.8780798, -4.435039, 1, 1, 1, 1, 1,
-0.1272319, 0.8682147, -0.8864825, 1, 1, 1, 1, 1,
-0.1247332, 0.09121962, -1.086879, 1, 1, 1, 1, 1,
-0.1224021, 0.1387256, -1.665855, 1, 1, 1, 1, 1,
-0.1194699, 0.9370044, -1.504028, 1, 1, 1, 1, 1,
-0.1175329, -1.038969, -2.558205, 1, 1, 1, 1, 1,
-0.1166047, -0.8676879, -5.589348, 0, 0, 1, 1, 1,
-0.1136915, -2.075999, -2.131732, 1, 0, 0, 1, 1,
-0.1125184, -0.8634655, -4.787765, 1, 0, 0, 1, 1,
-0.1113201, 1.659257, -2.39031, 1, 0, 0, 1, 1,
-0.1092584, 1.487287, 0.04704532, 1, 0, 0, 1, 1,
-0.1031121, -1.768328, -1.691077, 1, 0, 0, 1, 1,
-0.101635, -0.3670419, -3.101142, 0, 0, 0, 1, 1,
-0.09936002, 0.9536923, 0.2011631, 0, 0, 0, 1, 1,
-0.09307926, 0.5864773, 0.4163285, 0, 0, 0, 1, 1,
-0.09300757, 1.796224, -0.236255, 0, 0, 0, 1, 1,
-0.09221045, 0.4333751, -1.469363, 0, 0, 0, 1, 1,
-0.08947739, -1.045266, -4.839537, 0, 0, 0, 1, 1,
-0.08886877, -0.7909025, -3.317153, 0, 0, 0, 1, 1,
-0.08764059, -1.361355, -2.611533, 1, 1, 1, 1, 1,
-0.08651113, 0.5433328, 0.4367961, 1, 1, 1, 1, 1,
-0.08038948, -0.4343945, -2.527122, 1, 1, 1, 1, 1,
-0.07986309, -0.4456001, -2.785194, 1, 1, 1, 1, 1,
-0.07785788, 2.003667, -0.2825972, 1, 1, 1, 1, 1,
-0.07690653, -0.7501668, -2.261583, 1, 1, 1, 1, 1,
-0.07427601, -1.276702, -4.029504, 1, 1, 1, 1, 1,
-0.07339917, 1.498827, -0.3626149, 1, 1, 1, 1, 1,
-0.06998608, 0.916406, -0.5296879, 1, 1, 1, 1, 1,
-0.06863862, 0.7469069, 0.9965424, 1, 1, 1, 1, 1,
-0.06678208, 0.38905, -0.3870446, 1, 1, 1, 1, 1,
-0.06283488, -0.5014055, -3.83391, 1, 1, 1, 1, 1,
-0.06120125, -1.533558, -3.756634, 1, 1, 1, 1, 1,
-0.05604585, 0.3376693, -0.329776, 1, 1, 1, 1, 1,
-0.0539904, 0.7318588, 0.6494865, 1, 1, 1, 1, 1,
-0.05203845, 2.111607, 1.973178, 0, 0, 1, 1, 1,
-0.05084493, 0.5060308, -0.221902, 1, 0, 0, 1, 1,
-0.04922774, 0.4153272, -1.711698, 1, 0, 0, 1, 1,
-0.047014, 0.006372086, -2.275158, 1, 0, 0, 1, 1,
-0.0434283, 0.4791639, 0.01031629, 1, 0, 0, 1, 1,
-0.04097911, -1.326376, -4.977103, 1, 0, 0, 1, 1,
-0.04015971, -0.02856377, -2.167153, 0, 0, 0, 1, 1,
-0.03929906, 0.01723038, -0.270163, 0, 0, 0, 1, 1,
-0.03511129, -0.1689274, -2.838769, 0, 0, 0, 1, 1,
-0.03388466, -0.6660842, -2.576701, 0, 0, 0, 1, 1,
-0.0279969, 0.3817975, 0.2470389, 0, 0, 0, 1, 1,
-0.02693027, 0.4420666, 0.06547792, 0, 0, 0, 1, 1,
-0.02361843, 0.7017651, 0.222255, 0, 0, 0, 1, 1,
-0.02050714, -1.32617, -4.210511, 1, 1, 1, 1, 1,
-0.01550849, 0.4516355, 0.6884418, 1, 1, 1, 1, 1,
-0.01212892, -0.3747506, -2.491877, 1, 1, 1, 1, 1,
-0.01104685, -1.574201, -2.626063, 1, 1, 1, 1, 1,
-0.007243483, -0.3432846, -3.307905, 1, 1, 1, 1, 1,
-0.006544953, 0.7320256, -1.110806, 1, 1, 1, 1, 1,
-0.004838058, -0.898393, -1.554118, 1, 1, 1, 1, 1,
-0.001601303, -1.394596, -1.772706, 1, 1, 1, 1, 1,
0.004245226, 1.441142, 0.2581431, 1, 1, 1, 1, 1,
0.009560376, 1.095108, -0.7616264, 1, 1, 1, 1, 1,
0.01069457, -1.907523, 2.694174, 1, 1, 1, 1, 1,
0.01358842, 0.07978959, 1.870521, 1, 1, 1, 1, 1,
0.01412266, -0.8381953, 2.813994, 1, 1, 1, 1, 1,
0.01519387, -0.1198477, 5.130358, 1, 1, 1, 1, 1,
0.01537646, 0.4482422, -1.443101, 1, 1, 1, 1, 1,
0.01624382, -1.214631, 2.387193, 0, 0, 1, 1, 1,
0.01626199, 0.9668356, 1.703992, 1, 0, 0, 1, 1,
0.01756503, 0.487378, 0.3297724, 1, 0, 0, 1, 1,
0.01811155, 0.587819, 0.9028987, 1, 0, 0, 1, 1,
0.02136184, -0.007264848, 1.557446, 1, 0, 0, 1, 1,
0.02222437, 0.438521, -0.6629938, 1, 0, 0, 1, 1,
0.02828432, -0.1127544, 3.110253, 0, 0, 0, 1, 1,
0.03454228, -0.4278986, 1.600367, 0, 0, 0, 1, 1,
0.03531318, 0.6923524, -0.4084969, 0, 0, 0, 1, 1,
0.03673064, -0.4295659, 2.367166, 0, 0, 0, 1, 1,
0.047278, -0.7971947, 3.468948, 0, 0, 0, 1, 1,
0.05697826, 1.205523, 1.31727, 0, 0, 0, 1, 1,
0.06360439, -0.4042781, 5.906822, 0, 0, 0, 1, 1,
0.06617109, -1.053539, 2.075668, 1, 1, 1, 1, 1,
0.06756614, -0.9117075, 3.734674, 1, 1, 1, 1, 1,
0.073635, -1.281271, 2.684261, 1, 1, 1, 1, 1,
0.07588864, -0.1435976, 0.6348665, 1, 1, 1, 1, 1,
0.07960889, -3.040508, 3.424014, 1, 1, 1, 1, 1,
0.07966052, -1.430804, 3.711972, 1, 1, 1, 1, 1,
0.0805271, 0.4814934, -0.2777499, 1, 1, 1, 1, 1,
0.08054499, 2.0085, 0.4825201, 1, 1, 1, 1, 1,
0.08325817, 1.008488, -1.20747, 1, 1, 1, 1, 1,
0.08424035, 1.679108, -0.49216, 1, 1, 1, 1, 1,
0.08527456, -0.1552977, 2.193354, 1, 1, 1, 1, 1,
0.08531272, 1.002652, 0.9355747, 1, 1, 1, 1, 1,
0.09174432, -0.08159605, 4.021427, 1, 1, 1, 1, 1,
0.09242016, -0.4295643, 2.11215, 1, 1, 1, 1, 1,
0.0931287, 0.02490035, 1.384024, 1, 1, 1, 1, 1,
0.09758997, -1.949493, 4.160707, 0, 0, 1, 1, 1,
0.09847311, -1.354528, 2.919626, 1, 0, 0, 1, 1,
0.09878109, 2.868727, 1.905139, 1, 0, 0, 1, 1,
0.09928057, -0.2379596, 2.767313, 1, 0, 0, 1, 1,
0.1025651, 0.2805894, -0.367676, 1, 0, 0, 1, 1,
0.1050079, 0.1944399, -0.4271688, 1, 0, 0, 1, 1,
0.1058136, -2.059914, 3.030242, 0, 0, 0, 1, 1,
0.1079472, -0.9417639, 4.958531, 0, 0, 0, 1, 1,
0.1080133, 0.952087, 0.3431759, 0, 0, 0, 1, 1,
0.1097992, 1.016207, 0.6105075, 0, 0, 0, 1, 1,
0.1110168, -0.3795213, 3.299555, 0, 0, 0, 1, 1,
0.1118639, 0.25055, 1.40187, 0, 0, 0, 1, 1,
0.1142169, 0.4007119, 0.9369011, 0, 0, 0, 1, 1,
0.1142322, -0.333614, 2.482955, 1, 1, 1, 1, 1,
0.1159427, -1.696588, 3.965107, 1, 1, 1, 1, 1,
0.11786, -0.2108859, 2.223362, 1, 1, 1, 1, 1,
0.1264423, 0.09395082, 0.7072027, 1, 1, 1, 1, 1,
0.1275918, 0.3703793, 0.8199242, 1, 1, 1, 1, 1,
0.1299085, 0.6756884, 0.6472511, 1, 1, 1, 1, 1,
0.1301517, -1.203004, 3.556845, 1, 1, 1, 1, 1,
0.13681, -0.1804111, 3.340957, 1, 1, 1, 1, 1,
0.1370027, -1.994598, 4.214228, 1, 1, 1, 1, 1,
0.1371115, -0.3489758, 2.558192, 1, 1, 1, 1, 1,
0.1390741, -0.9789251, 0.582851, 1, 1, 1, 1, 1,
0.1399533, -1.434744, 3.431492, 1, 1, 1, 1, 1,
0.142176, 0.1610796, -0.9681061, 1, 1, 1, 1, 1,
0.146648, 0.3151877, 1.500298, 1, 1, 1, 1, 1,
0.1496445, 0.708053, 1.283398, 1, 1, 1, 1, 1,
0.1598667, 1.548542, -0.1361672, 0, 0, 1, 1, 1,
0.1704332, 0.6614949, -0.07744503, 1, 0, 0, 1, 1,
0.1719897, 0.7195724, 1.705932, 1, 0, 0, 1, 1,
0.1742603, -0.1467212, 1.827477, 1, 0, 0, 1, 1,
0.1772106, 0.5475255, -0.6310884, 1, 0, 0, 1, 1,
0.1783475, 1.652572, -1.047547, 1, 0, 0, 1, 1,
0.1858077, -0.3723285, 3.11818, 0, 0, 0, 1, 1,
0.1899637, 0.783742, 1.771726, 0, 0, 0, 1, 1,
0.1902116, -1.964865, 4.761302, 0, 0, 0, 1, 1,
0.1902792, 0.4397599, 1.289995, 0, 0, 0, 1, 1,
0.1923136, -1.005875, 3.712384, 0, 0, 0, 1, 1,
0.1924101, -0.8106149, 2.163335, 0, 0, 0, 1, 1,
0.1929559, 1.043976, 1.035298, 0, 0, 0, 1, 1,
0.1980263, -1.903205, 4.424087, 1, 1, 1, 1, 1,
0.198802, 0.3531837, 0.7244094, 1, 1, 1, 1, 1,
0.2010136, 0.4747208, 1.306987, 1, 1, 1, 1, 1,
0.202081, -0.07734818, 0.08793306, 1, 1, 1, 1, 1,
0.2043222, -0.04455339, 1.752064, 1, 1, 1, 1, 1,
0.2093193, 1.860511, -0.6794177, 1, 1, 1, 1, 1,
0.2191666, -1.237427, 2.466482, 1, 1, 1, 1, 1,
0.2199089, -1.86229, 4.045346, 1, 1, 1, 1, 1,
0.2201785, 1.43009, 0.08321369, 1, 1, 1, 1, 1,
0.2271068, 0.1184271, 0.6837865, 1, 1, 1, 1, 1,
0.2320231, -0.8376746, 4.47358, 1, 1, 1, 1, 1,
0.2325022, -0.9046195, 1.645724, 1, 1, 1, 1, 1,
0.2338285, 1.61598, 0.556967, 1, 1, 1, 1, 1,
0.2341727, 1.580311, 0.9092394, 1, 1, 1, 1, 1,
0.2350335, -1.085569, 2.463704, 1, 1, 1, 1, 1,
0.2368943, 0.3079584, 2.59239, 0, 0, 1, 1, 1,
0.2396646, 0.332839, 0.9448951, 1, 0, 0, 1, 1,
0.2399938, -1.406598, 3.222976, 1, 0, 0, 1, 1,
0.2427411, -0.6128526, 4.309872, 1, 0, 0, 1, 1,
0.2464294, -1.847392, 3.54733, 1, 0, 0, 1, 1,
0.2523282, -0.9513947, 3.357129, 1, 0, 0, 1, 1,
0.2538405, 2.493051, -1.685903, 0, 0, 0, 1, 1,
0.263683, 0.9547333, 1.049881, 0, 0, 0, 1, 1,
0.2666532, -0.9163664, 2.184709, 0, 0, 0, 1, 1,
0.2688071, -0.1664904, 2.591436, 0, 0, 0, 1, 1,
0.2725469, 0.148828, 2.197219, 0, 0, 0, 1, 1,
0.2731989, -0.6646984, 1.194654, 0, 0, 0, 1, 1,
0.2775014, 2.203379, -1.148544, 0, 0, 0, 1, 1,
0.2776484, 0.9899212, 0.5080351, 1, 1, 1, 1, 1,
0.2785901, -0.7763352, 3.37149, 1, 1, 1, 1, 1,
0.2841486, 0.4085726, 0.8508013, 1, 1, 1, 1, 1,
0.2851622, -0.6516653, 2.815044, 1, 1, 1, 1, 1,
0.2905646, 2.095482, 0.8429107, 1, 1, 1, 1, 1,
0.2908335, -0.1665986, 1.70918, 1, 1, 1, 1, 1,
0.296477, 0.5715352, 1.917823, 1, 1, 1, 1, 1,
0.2968765, 0.6741576, 1.090749, 1, 1, 1, 1, 1,
0.2984915, 0.4307009, -0.5195954, 1, 1, 1, 1, 1,
0.3002026, -0.3616064, 0.5023187, 1, 1, 1, 1, 1,
0.3005237, 0.1492363, 1.53483, 1, 1, 1, 1, 1,
0.3029872, 0.7254233, 0.3967107, 1, 1, 1, 1, 1,
0.305212, 2.256849, -0.4039406, 1, 1, 1, 1, 1,
0.3077605, 0.04607857, 1.260099, 1, 1, 1, 1, 1,
0.3090348, 1.543755, 0.03602286, 1, 1, 1, 1, 1,
0.3114262, -0.569907, 4.295537, 0, 0, 1, 1, 1,
0.314594, -1.304038, 1.854595, 1, 0, 0, 1, 1,
0.3155795, -0.2399779, 3.71771, 1, 0, 0, 1, 1,
0.3172993, -0.3007636, 0.6371021, 1, 0, 0, 1, 1,
0.3188209, 1.305603, -0.5653211, 1, 0, 0, 1, 1,
0.3192238, 0.1535255, 0.1933234, 1, 0, 0, 1, 1,
0.3215428, 1.667655, 0.1001146, 0, 0, 0, 1, 1,
0.3237581, -0.2792048, 2.544013, 0, 0, 0, 1, 1,
0.327476, -1.053899, 3.762187, 0, 0, 0, 1, 1,
0.3330667, -1.315427, 2.665639, 0, 0, 0, 1, 1,
0.3388306, -0.6343236, 3.744332, 0, 0, 0, 1, 1,
0.3389478, 1.444356, 0.3761844, 0, 0, 0, 1, 1,
0.3391026, -0.6120281, 1.415437, 0, 0, 0, 1, 1,
0.3394506, 1.235189, 0.189134, 1, 1, 1, 1, 1,
0.3443504, 0.4196685, -0.2808557, 1, 1, 1, 1, 1,
0.3514139, 0.4060853, 0.7221214, 1, 1, 1, 1, 1,
0.3560527, 0.9740951, -0.01963715, 1, 1, 1, 1, 1,
0.356737, -0.08958054, 0.08310623, 1, 1, 1, 1, 1,
0.3576292, 0.07488079, 0.979012, 1, 1, 1, 1, 1,
0.3591196, -0.2539292, 2.171956, 1, 1, 1, 1, 1,
0.360033, 0.1560807, 0.9962457, 1, 1, 1, 1, 1,
0.3603422, -0.2151693, 1.253837, 1, 1, 1, 1, 1,
0.3701902, 0.01173023, 0.4908377, 1, 1, 1, 1, 1,
0.3705795, 0.6314359, -0.1675564, 1, 1, 1, 1, 1,
0.3722918, 1.416452, 0.3224948, 1, 1, 1, 1, 1,
0.3769825, 0.05774654, 2.983738, 1, 1, 1, 1, 1,
0.3770844, 0.7403371, -0.1219094, 1, 1, 1, 1, 1,
0.3891692, -0.09930295, 1.791559, 1, 1, 1, 1, 1,
0.3909758, -0.2783367, 1.570251, 0, 0, 1, 1, 1,
0.3952936, 0.6336862, -0.8987567, 1, 0, 0, 1, 1,
0.4001836, -0.8586376, 2.782124, 1, 0, 0, 1, 1,
0.4005718, 1.324921, 3.103324, 1, 0, 0, 1, 1,
0.4022432, -0.008383591, 1.746215, 1, 0, 0, 1, 1,
0.4126314, -0.7991637, 1.556876, 1, 0, 0, 1, 1,
0.4159622, -1.146179, 1.653549, 0, 0, 0, 1, 1,
0.4168423, -0.6609898, 3.198392, 0, 0, 0, 1, 1,
0.4189272, 0.4498519, 0.8210206, 0, 0, 0, 1, 1,
0.4200733, -0.620229, 2.265734, 0, 0, 0, 1, 1,
0.4202536, -0.09866519, 0.9816285, 0, 0, 0, 1, 1,
0.4221266, -1.048384, 2.333051, 0, 0, 0, 1, 1,
0.4251456, -0.2554035, 1.401998, 0, 0, 0, 1, 1,
0.4263845, 0.1918747, 2.602518, 1, 1, 1, 1, 1,
0.4266078, -0.9470484, 1.440179, 1, 1, 1, 1, 1,
0.4330453, 0.05857453, 3.33094, 1, 1, 1, 1, 1,
0.4346819, -0.6498761, 3.969863, 1, 1, 1, 1, 1,
0.4443352, 0.6535876, -0.02632053, 1, 1, 1, 1, 1,
0.4530099, 0.8147554, 0.1709602, 1, 1, 1, 1, 1,
0.4530137, -1.927998, 2.990052, 1, 1, 1, 1, 1,
0.4535292, -1.175166, 1.896142, 1, 1, 1, 1, 1,
0.4537815, -0.3830876, 1.780976, 1, 1, 1, 1, 1,
0.4539465, 0.1235064, 0.4753592, 1, 1, 1, 1, 1,
0.4604011, -0.7637075, 3.326395, 1, 1, 1, 1, 1,
0.460895, -0.874115, 1.960238, 1, 1, 1, 1, 1,
0.4622071, 1.211418, 1.027903, 1, 1, 1, 1, 1,
0.464803, 0.7044736, -0.5525329, 1, 1, 1, 1, 1,
0.4705716, 0.3514713, 0.7310573, 1, 1, 1, 1, 1,
0.4712849, -0.6050994, 2.016356, 0, 0, 1, 1, 1,
0.4736232, -0.8305888, 3.726628, 1, 0, 0, 1, 1,
0.4780362, 0.4273725, 1.059767, 1, 0, 0, 1, 1,
0.4786022, 0.4136163, 1.036481, 1, 0, 0, 1, 1,
0.4816736, -0.7573736, 2.607017, 1, 0, 0, 1, 1,
0.4830968, 0.4639226, 1.946855, 1, 0, 0, 1, 1,
0.4877039, -1.322326, 2.32266, 0, 0, 0, 1, 1,
0.4906774, -0.1563448, 1.273185, 0, 0, 0, 1, 1,
0.4917906, 1.319828, -0.4591393, 0, 0, 0, 1, 1,
0.4934695, 1.121859, 0.036631, 0, 0, 0, 1, 1,
0.4944708, -0.002746465, 1.830801, 0, 0, 0, 1, 1,
0.494671, 0.5783322, 0.2712585, 0, 0, 0, 1, 1,
0.4986246, -1.979594, 2.756254, 0, 0, 0, 1, 1,
0.5002171, 2.297711, 0.4839523, 1, 1, 1, 1, 1,
0.5007732, 1.188988, -1.706576, 1, 1, 1, 1, 1,
0.5053146, 0.6458821, 0.9952232, 1, 1, 1, 1, 1,
0.5054108, 0.1577327, 1.073735, 1, 1, 1, 1, 1,
0.5054775, -0.5343817, 3.100547, 1, 1, 1, 1, 1,
0.510148, 0.7536405, 2.021044, 1, 1, 1, 1, 1,
0.5137399, -2.388662, 4.151692, 1, 1, 1, 1, 1,
0.516231, 0.9492262, 2.538844, 1, 1, 1, 1, 1,
0.5168411, -1.02252, 2.314794, 1, 1, 1, 1, 1,
0.5174575, 0.2415606, 2.49228, 1, 1, 1, 1, 1,
0.5267974, 0.7782785, 0.7635397, 1, 1, 1, 1, 1,
0.528307, 1.602925, 0.6399281, 1, 1, 1, 1, 1,
0.5289167, -0.6522195, 1.825798, 1, 1, 1, 1, 1,
0.5409446, 1.41018, 0.6824931, 1, 1, 1, 1, 1,
0.5507594, 0.04975253, 1.536366, 1, 1, 1, 1, 1,
0.5606907, -0.7411811, 2.804069, 0, 0, 1, 1, 1,
0.5607044, -0.3166264, 3.344299, 1, 0, 0, 1, 1,
0.5678809, 0.9874305, -0.1803047, 1, 0, 0, 1, 1,
0.5704158, 0.5651566, -0.06505726, 1, 0, 0, 1, 1,
0.5729693, -2.122066, 2.369927, 1, 0, 0, 1, 1,
0.5805004, 2.117405, 0.7263155, 1, 0, 0, 1, 1,
0.5807051, 0.8225861, -1.841503, 0, 0, 0, 1, 1,
0.5813146, 0.7832284, 1.593513, 0, 0, 0, 1, 1,
0.5818503, -0.9939023, 3.631399, 0, 0, 0, 1, 1,
0.5903532, 0.3656669, 1.229941, 0, 0, 0, 1, 1,
0.5916319, -0.4548862, 3.260052, 0, 0, 0, 1, 1,
0.5938618, -0.8160205, 3.305157, 0, 0, 0, 1, 1,
0.594093, -0.6190566, 3.338946, 0, 0, 0, 1, 1,
0.5985018, -0.3202196, 2.428813, 1, 1, 1, 1, 1,
0.6033832, -1.718807, 1.561557, 1, 1, 1, 1, 1,
0.6065035, 0.5807731, 0.1907803, 1, 1, 1, 1, 1,
0.6105434, -0.8252398, 2.330716, 1, 1, 1, 1, 1,
0.6111352, 0.8574434, 0.3695992, 1, 1, 1, 1, 1,
0.6117139, 0.3460624, 2.078467, 1, 1, 1, 1, 1,
0.6254206, -1.367191, 2.910736, 1, 1, 1, 1, 1,
0.6259985, 1.48177, 0.01958219, 1, 1, 1, 1, 1,
0.6288351, -2.798003, 3.700344, 1, 1, 1, 1, 1,
0.6296957, 1.478861, -0.5036556, 1, 1, 1, 1, 1,
0.633876, 0.8554702, 1.480903, 1, 1, 1, 1, 1,
0.6360972, -0.4116012, 1.943996, 1, 1, 1, 1, 1,
0.640632, 1.862308, 1.919501, 1, 1, 1, 1, 1,
0.6431733, 0.3693472, 0.1831132, 1, 1, 1, 1, 1,
0.6433954, -0.1007394, 2.550091, 1, 1, 1, 1, 1,
0.6438673, -1.050086, 2.773767, 0, 0, 1, 1, 1,
0.6443508, 0.4663095, 0.5457537, 1, 0, 0, 1, 1,
0.6515507, -2.044253, 5.093436, 1, 0, 0, 1, 1,
0.6517849, -0.6153377, 2.304204, 1, 0, 0, 1, 1,
0.6555289, -0.979718, 2.852428, 1, 0, 0, 1, 1,
0.655915, 1.228956, 0.9891945, 1, 0, 0, 1, 1,
0.6580352, -0.9539401, 3.257868, 0, 0, 0, 1, 1,
0.665311, -0.6026344, 2.03793, 0, 0, 0, 1, 1,
0.6668752, -0.2877963, 2.389503, 0, 0, 0, 1, 1,
0.6690131, 0.0250566, 1.494387, 0, 0, 0, 1, 1,
0.6728216, 1.07628, 0.8161255, 0, 0, 0, 1, 1,
0.6734447, -0.8634261, 3.438526, 0, 0, 0, 1, 1,
0.679454, 0.248411, 1.745086, 0, 0, 0, 1, 1,
0.683878, -0.1168143, -1.181193, 1, 1, 1, 1, 1,
0.6857327, -2.069367, 3.522128, 1, 1, 1, 1, 1,
0.6888149, -0.4507932, 2.12003, 1, 1, 1, 1, 1,
0.6920244, -0.8550816, 2.72986, 1, 1, 1, 1, 1,
0.6932071, -1.345179, 1.907696, 1, 1, 1, 1, 1,
0.6962363, 1.988367, 0.3558657, 1, 1, 1, 1, 1,
0.6993401, 1.476896, -0.139455, 1, 1, 1, 1, 1,
0.7006223, -2.393279, 2.090162, 1, 1, 1, 1, 1,
0.7037688, -1.209287, 2.15592, 1, 1, 1, 1, 1,
0.7053074, 0.3316024, 1.291233, 1, 1, 1, 1, 1,
0.7074236, -1.019725, 1.264377, 1, 1, 1, 1, 1,
0.7194341, 0.2123249, 0.8816971, 1, 1, 1, 1, 1,
0.7207057, 0.872346, 1.496885, 1, 1, 1, 1, 1,
0.7252769, 0.793034, 1.201264, 1, 1, 1, 1, 1,
0.7254068, 0.1309162, -0.4849228, 1, 1, 1, 1, 1,
0.7273424, 0.5837521, 0.5184073, 0, 0, 1, 1, 1,
0.7302636, 0.8616407, 0.5179922, 1, 0, 0, 1, 1,
0.7357864, 0.2242154, -0.4506913, 1, 0, 0, 1, 1,
0.7365069, 0.2388224, 1.132811, 1, 0, 0, 1, 1,
0.7387282, -0.6683422, 1.636595, 1, 0, 0, 1, 1,
0.7468802, -1.908703, 2.72839, 1, 0, 0, 1, 1,
0.7480119, -0.9830728, 2.620807, 0, 0, 0, 1, 1,
0.7541091, -0.9864181, 2.541471, 0, 0, 0, 1, 1,
0.7556797, 0.2831677, 1.800435, 0, 0, 0, 1, 1,
0.7608393, -0.1106303, 2.106016, 0, 0, 0, 1, 1,
0.7639199, -1.10179, 0.8835198, 0, 0, 0, 1, 1,
0.7673153, 0.4727975, 0.03953499, 0, 0, 0, 1, 1,
0.7678437, -0.5488957, 3.074193, 0, 0, 0, 1, 1,
0.7691385, -0.04638082, 2.427607, 1, 1, 1, 1, 1,
0.7694381, -1.669624, 2.991941, 1, 1, 1, 1, 1,
0.7708672, 1.241974, 0.7845979, 1, 1, 1, 1, 1,
0.7725675, -0.1790551, 0.3769518, 1, 1, 1, 1, 1,
0.7755389, 0.05569991, 2.272753, 1, 1, 1, 1, 1,
0.7769108, 0.8826904, 1.185402, 1, 1, 1, 1, 1,
0.7947698, -1.239729, 2.103477, 1, 1, 1, 1, 1,
0.7964655, -1.134888, 2.48602, 1, 1, 1, 1, 1,
0.8002958, 1.085744, -0.6457475, 1, 1, 1, 1, 1,
0.8007762, -0.311319, 1.033296, 1, 1, 1, 1, 1,
0.803343, -0.8676027, 2.813822, 1, 1, 1, 1, 1,
0.818074, -0.5625052, 2.608337, 1, 1, 1, 1, 1,
0.8235533, 0.3253359, 2.658823, 1, 1, 1, 1, 1,
0.8264104, 1.779913, -0.07746171, 1, 1, 1, 1, 1,
0.8359125, -1.277075, 0.4326712, 1, 1, 1, 1, 1,
0.8399555, -1.339854, 4.504114, 0, 0, 1, 1, 1,
0.8443879, 1.737986, -0.3384836, 1, 0, 0, 1, 1,
0.8443958, 0.799675, 0.9692517, 1, 0, 0, 1, 1,
0.8480383, -0.9274964, 3.083524, 1, 0, 0, 1, 1,
0.8511722, -0.09362374, -0.08016268, 1, 0, 0, 1, 1,
0.8558602, -0.5919211, 1.79107, 1, 0, 0, 1, 1,
0.8615159, -0.9313235, -0.06050357, 0, 0, 0, 1, 1,
0.8620946, 0.9505511, -0.1334926, 0, 0, 0, 1, 1,
0.8669017, 0.3356527, 1.778426, 0, 0, 0, 1, 1,
0.8677778, 2.104856, -1.186185, 0, 0, 0, 1, 1,
0.868329, -1.214602, 4.212543, 0, 0, 0, 1, 1,
0.8725074, -1.064582, 2.603461, 0, 0, 0, 1, 1,
0.8726445, 0.1613308, 2.291417, 0, 0, 0, 1, 1,
0.8736392, -0.3933575, 2.438397, 1, 1, 1, 1, 1,
0.8759902, 0.08165095, 1.712809, 1, 1, 1, 1, 1,
0.8770211, 0.7926543, -0.9727509, 1, 1, 1, 1, 1,
0.8799152, -2.116469, 4.906875, 1, 1, 1, 1, 1,
0.888417, 1.703246, 0.2538782, 1, 1, 1, 1, 1,
0.8890959, 2.599147, 0.04320611, 1, 1, 1, 1, 1,
0.8917441, -0.1473771, 2.234011, 1, 1, 1, 1, 1,
0.8937572, -1.041111, 2.449299, 1, 1, 1, 1, 1,
0.8976793, -0.2411813, 1.044896, 1, 1, 1, 1, 1,
0.9012879, 0.6338581, 0.5489546, 1, 1, 1, 1, 1,
0.9029934, 0.5722988, 0.6385626, 1, 1, 1, 1, 1,
0.9033285, 0.7078334, 1.318221, 1, 1, 1, 1, 1,
0.9095206, 1.113742, -0.2048625, 1, 1, 1, 1, 1,
0.9096878, 1.463118, -0.9848881, 1, 1, 1, 1, 1,
0.9121422, 0.8083249, -0.5884106, 1, 1, 1, 1, 1,
0.9127758, 1.413428, 3.199113, 0, 0, 1, 1, 1,
0.9140331, -0.2125169, 1.146802, 1, 0, 0, 1, 1,
0.9145264, 1.636096, -1.485936, 1, 0, 0, 1, 1,
0.9151849, 0.6311896, -0.3945479, 1, 0, 0, 1, 1,
0.9158667, 2.056359, -1.113729, 1, 0, 0, 1, 1,
0.9159217, 0.3510245, 1.721565, 1, 0, 0, 1, 1,
0.9247612, -0.150851, 2.812366, 0, 0, 0, 1, 1,
0.9297007, 1.396175, 1.5242, 0, 0, 0, 1, 1,
0.9300362, -0.1847629, 1.979822, 0, 0, 0, 1, 1,
0.9310611, 0.2213617, 1.905533, 0, 0, 0, 1, 1,
0.9330847, -0.07283898, 1.086651, 0, 0, 0, 1, 1,
0.9384087, -0.3242581, 1.90651, 0, 0, 0, 1, 1,
0.9394373, -1.222801, 2.431946, 0, 0, 0, 1, 1,
0.9406465, 2.075602, 1.651432, 1, 1, 1, 1, 1,
0.9490813, -1.643818, 2.826133, 1, 1, 1, 1, 1,
0.955528, -0.454167, 2.159726, 1, 1, 1, 1, 1,
0.9563785, -1.794062, 2.381708, 1, 1, 1, 1, 1,
0.9727987, 0.8916983, 1.297416, 1, 1, 1, 1, 1,
0.9741102, -1.27858, 1.383697, 1, 1, 1, 1, 1,
0.978186, -0.3746739, 0.6100366, 1, 1, 1, 1, 1,
0.9794704, 1.050222, 0.3806482, 1, 1, 1, 1, 1,
0.9889976, -0.229631, 2.125181, 1, 1, 1, 1, 1,
0.9952314, 0.3626915, 2.248883, 1, 1, 1, 1, 1,
0.9979094, -1.105484, 0.8914042, 1, 1, 1, 1, 1,
0.998883, -0.737259, 2.032156, 1, 1, 1, 1, 1,
0.9996207, -0.8620948, 1.477781, 1, 1, 1, 1, 1,
1.002591, -1.214295, 1.686067, 1, 1, 1, 1, 1,
1.00637, 0.1368712, 0.3653485, 1, 1, 1, 1, 1,
1.007553, -0.7905217, 0.8301838, 0, 0, 1, 1, 1,
1.009496, -0.3968017, 1.663546, 1, 0, 0, 1, 1,
1.018962, 1.715614, -0.9767422, 1, 0, 0, 1, 1,
1.026271, -0.8186588, 0.7247985, 1, 0, 0, 1, 1,
1.026336, 0.6673587, 1.426478, 1, 0, 0, 1, 1,
1.026471, -0.2461326, 0.7130734, 1, 0, 0, 1, 1,
1.027843, 0.282945, 1.937141, 0, 0, 0, 1, 1,
1.036312, 0.5537707, 0.3685338, 0, 0, 0, 1, 1,
1.039033, 0.4437651, 3.111889, 0, 0, 0, 1, 1,
1.041995, 0.6565069, 1.522412, 0, 0, 0, 1, 1,
1.045202, 1.057634, 0.3682906, 0, 0, 0, 1, 1,
1.045893, 0.04145641, 1.164886, 0, 0, 0, 1, 1,
1.059266, -0.07936087, 0.8911229, 0, 0, 0, 1, 1,
1.06087, 0.1360296, 1.894214, 1, 1, 1, 1, 1,
1.062257, 2.451502, 0.1323229, 1, 1, 1, 1, 1,
1.069378, 0.8824058, 0.8021546, 1, 1, 1, 1, 1,
1.069563, 0.8502375, 2.499309, 1, 1, 1, 1, 1,
1.070529, 1.038977, -0.4803301, 1, 1, 1, 1, 1,
1.072943, 0.7033253, 0.8069118, 1, 1, 1, 1, 1,
1.077459, -0.1005729, 2.893414, 1, 1, 1, 1, 1,
1.079618, -0.1592671, 3.337092, 1, 1, 1, 1, 1,
1.080732, 1.777264, 2.494889, 1, 1, 1, 1, 1,
1.086391, -0.38509, 4.196987, 1, 1, 1, 1, 1,
1.086622, 1.104115, 0.8349921, 1, 1, 1, 1, 1,
1.087663, -0.396318, 2.387998, 1, 1, 1, 1, 1,
1.087945, 0.419452, 0.06800977, 1, 1, 1, 1, 1,
1.089856, 0.9712068, 1.350451, 1, 1, 1, 1, 1,
1.093064, -1.393459, 3.850112, 1, 1, 1, 1, 1,
1.094568, 0.2272555, 0.8299456, 0, 0, 1, 1, 1,
1.096353, -0.6533533, 2.601164, 1, 0, 0, 1, 1,
1.096857, 0.5336343, 0.8038304, 1, 0, 0, 1, 1,
1.101072, 2.111365, -0.5284007, 1, 0, 0, 1, 1,
1.102148, -0.6842453, 1.302687, 1, 0, 0, 1, 1,
1.114131, -0.4035161, 0.4128358, 1, 0, 0, 1, 1,
1.115762, -0.5695315, 2.099804, 0, 0, 0, 1, 1,
1.116554, 0.7030695, -0.1432011, 0, 0, 0, 1, 1,
1.118416, 0.7317031, 0.2456893, 0, 0, 0, 1, 1,
1.124067, 0.02275725, 0.8683568, 0, 0, 0, 1, 1,
1.124696, 0.01490839, 1.967307, 0, 0, 0, 1, 1,
1.130877, -0.03691261, 1.332614, 0, 0, 0, 1, 1,
1.13104, 0.7412121, -1.476293, 0, 0, 0, 1, 1,
1.137895, -0.5527769, 1.159348, 1, 1, 1, 1, 1,
1.144666, -1.84577, 2.768799, 1, 1, 1, 1, 1,
1.145958, 0.6435395, 0.3533438, 1, 1, 1, 1, 1,
1.147937, 0.4824717, 2.122116, 1, 1, 1, 1, 1,
1.153137, -0.4170952, 3.305823, 1, 1, 1, 1, 1,
1.172491, -1.489422, 2.143143, 1, 1, 1, 1, 1,
1.184428, -0.2647849, 0.5827464, 1, 1, 1, 1, 1,
1.192114, -1.311909, 0.7198384, 1, 1, 1, 1, 1,
1.197085, -0.6643033, 1.326002, 1, 1, 1, 1, 1,
1.213599, 1.212845, 1.013709, 1, 1, 1, 1, 1,
1.217251, -0.03277623, 1.222465, 1, 1, 1, 1, 1,
1.230737, -0.9577006, 2.202461, 1, 1, 1, 1, 1,
1.23137, -1.23477, 4.130905, 1, 1, 1, 1, 1,
1.232029, 1.07202, 2.247161, 1, 1, 1, 1, 1,
1.238948, -0.1359356, 2.869, 1, 1, 1, 1, 1,
1.252995, 1.678065, 0.9701586, 0, 0, 1, 1, 1,
1.256753, 0.3959582, 2.291583, 1, 0, 0, 1, 1,
1.258719, -0.006700107, 1.903441, 1, 0, 0, 1, 1,
1.273571, 1.462539, 1.209764, 1, 0, 0, 1, 1,
1.280315, 0.1652321, 1.612879, 1, 0, 0, 1, 1,
1.280684, 1.008142, 0.4974569, 1, 0, 0, 1, 1,
1.290837, 1.243367, 1.246176, 0, 0, 0, 1, 1,
1.290915, -0.3355242, 1.569842, 0, 0, 0, 1, 1,
1.290951, -0.06420296, 1.968708, 0, 0, 0, 1, 1,
1.291593, -0.2408587, 2.16359, 0, 0, 0, 1, 1,
1.313838, -0.008087968, 1.233147, 0, 0, 0, 1, 1,
1.315693, 0.3312825, 0.5351177, 0, 0, 0, 1, 1,
1.317348, 0.3190036, 2.422863, 0, 0, 0, 1, 1,
1.319285, 1.454716, 1.15752, 1, 1, 1, 1, 1,
1.319596, -0.6468455, 0.5439904, 1, 1, 1, 1, 1,
1.334308, -1.720497, 2.569445, 1, 1, 1, 1, 1,
1.3418, -0.870123, 1.807996, 1, 1, 1, 1, 1,
1.342832, -1.360309, 2.080639, 1, 1, 1, 1, 1,
1.345309, 0.4704922, 1.910074, 1, 1, 1, 1, 1,
1.345492, 1.965307, 1.017031, 1, 1, 1, 1, 1,
1.354807, 1.610984, 1.308495, 1, 1, 1, 1, 1,
1.367456, 1.282244, 3.595533, 1, 1, 1, 1, 1,
1.371595, 1.425059, -0.5298355, 1, 1, 1, 1, 1,
1.38967, 0.5270717, 0.5885372, 1, 1, 1, 1, 1,
1.392665, 1.062872, 0.3820451, 1, 1, 1, 1, 1,
1.410502, -0.2202358, -1.282221, 1, 1, 1, 1, 1,
1.414272, 1.439944, 1.43563, 1, 1, 1, 1, 1,
1.41989, -0.4493994, 1.224263, 1, 1, 1, 1, 1,
1.430669, -0.160942, 1.778887, 0, 0, 1, 1, 1,
1.444732, -0.8279083, 1.726381, 1, 0, 0, 1, 1,
1.450781, -1.329683, 1.107265, 1, 0, 0, 1, 1,
1.458569, -0.9940279, 3.224217, 1, 0, 0, 1, 1,
1.460026, -0.7828463, 1.081041, 1, 0, 0, 1, 1,
1.464377, -0.3219314, 1.268594, 1, 0, 0, 1, 1,
1.466487, -0.8406323, 2.492187, 0, 0, 0, 1, 1,
1.485614, -1.528224, 1.757392, 0, 0, 0, 1, 1,
1.490145, 0.5475265, 2.235968, 0, 0, 0, 1, 1,
1.504138, 0.5919998, 1.795773, 0, 0, 0, 1, 1,
1.506405, 0.8958275, -0.1229169, 0, 0, 0, 1, 1,
1.50818, 1.227362, 0.0580641, 0, 0, 0, 1, 1,
1.511579, -2.234709, 1.878559, 0, 0, 0, 1, 1,
1.547154, -0.2454992, 2.805245, 1, 1, 1, 1, 1,
1.55126, -0.711609, -0.1416159, 1, 1, 1, 1, 1,
1.552887, 0.02276649, 0.4566734, 1, 1, 1, 1, 1,
1.555285, -1.421498, 3.1038, 1, 1, 1, 1, 1,
1.559066, -0.4898472, 1.558138, 1, 1, 1, 1, 1,
1.56456, -0.2467222, 1.78934, 1, 1, 1, 1, 1,
1.566086, 0.8886161, -0.08161704, 1, 1, 1, 1, 1,
1.569904, -0.3676283, 3.229432, 1, 1, 1, 1, 1,
1.595927, -1.535595, 2.371165, 1, 1, 1, 1, 1,
1.610927, 2.196612, 2.540353, 1, 1, 1, 1, 1,
1.620394, -0.9700658, 2.152555, 1, 1, 1, 1, 1,
1.62415, -1.125819, 2.118345, 1, 1, 1, 1, 1,
1.626494, 0.6509029, 1.86591, 1, 1, 1, 1, 1,
1.63099, -0.6408088, 1.102103, 1, 1, 1, 1, 1,
1.631328, -0.2896659, 1.85001, 1, 1, 1, 1, 1,
1.64133, -0.794629, 2.686071, 0, 0, 1, 1, 1,
1.64918, 0.8601486, 1.782071, 1, 0, 0, 1, 1,
1.656161, 1.15075, 0.636738, 1, 0, 0, 1, 1,
1.669176, -0.9229714, 3.102592, 1, 0, 0, 1, 1,
1.669438, -1.011345, 2.030072, 1, 0, 0, 1, 1,
1.673838, 0.5050504, 1.134153, 1, 0, 0, 1, 1,
1.701731, -0.8396918, 2.351735, 0, 0, 0, 1, 1,
1.70538, 0.9239048, -0.1965758, 0, 0, 0, 1, 1,
1.717555, 0.961485, 1.909838, 0, 0, 0, 1, 1,
1.731414, -0.5611176, 1.828995, 0, 0, 0, 1, 1,
1.73683, -0.660991, 2.395767, 0, 0, 0, 1, 1,
1.737782, -1.458589, 3.327354, 0, 0, 0, 1, 1,
1.744099, 1.35841, 0.5487135, 0, 0, 0, 1, 1,
1.750064, -0.6809435, 0.8853945, 1, 1, 1, 1, 1,
1.772645, 0.2592738, 0.8294256, 1, 1, 1, 1, 1,
1.794125, -0.692399, -0.1817289, 1, 1, 1, 1, 1,
1.794679, 1.789937, -0.6112093, 1, 1, 1, 1, 1,
1.805756, 0.67574, 0.6595912, 1, 1, 1, 1, 1,
1.807265, 0.01728787, 2.689139, 1, 1, 1, 1, 1,
1.812712, -1.02297, 2.271191, 1, 1, 1, 1, 1,
1.818625, 0.8197485, -0.6430798, 1, 1, 1, 1, 1,
1.851605, -1.126362, 3.44872, 1, 1, 1, 1, 1,
1.855626, -1.037611, 0.3894134, 1, 1, 1, 1, 1,
1.871037, -2.317545, 3.327948, 1, 1, 1, 1, 1,
1.889711, -2.183842, 3.610865, 1, 1, 1, 1, 1,
1.914569, -1.078513, 2.786162, 1, 1, 1, 1, 1,
1.926605, -1.705816, 2.944383, 1, 1, 1, 1, 1,
1.92962, 0.3263178, 1.587992, 1, 1, 1, 1, 1,
1.944391, -1.146341, 3.767669, 0, 0, 1, 1, 1,
2.017921, -0.6801203, 2.876788, 1, 0, 0, 1, 1,
2.024572, 0.1357077, -0.6381292, 1, 0, 0, 1, 1,
2.0403, -1.647131, 1.888544, 1, 0, 0, 1, 1,
2.105523, -0.702087, 1.541183, 1, 0, 0, 1, 1,
2.150571, -1.019714, 1.144861, 1, 0, 0, 1, 1,
2.250229, 2.290951, -1.116307, 0, 0, 0, 1, 1,
2.273318, -0.5407483, 1.225441, 0, 0, 0, 1, 1,
2.289811, 0.8674026, 1.223516, 0, 0, 0, 1, 1,
2.316865, -0.2418928, 1.789545, 0, 0, 0, 1, 1,
2.326214, 0.4844701, 3.289847, 0, 0, 0, 1, 1,
2.348493, 0.3763634, 1.143034, 0, 0, 0, 1, 1,
2.404787, 1.078172, 1.020863, 0, 0, 0, 1, 1,
2.5384, -1.143651, 0.6274967, 1, 1, 1, 1, 1,
2.655151, -1.754807, 2.567364, 1, 1, 1, 1, 1,
2.670996, -0.181005, -0.3814302, 1, 1, 1, 1, 1,
2.824243, 0.9309882, 0.4677027, 1, 1, 1, 1, 1,
3.045838, -0.1866338, -0.007732534, 1, 1, 1, 1, 1,
3.094786, 0.9839185, 0.7693614, 1, 1, 1, 1, 1,
3.177692, -1.304341, 3.730386, 1, 1, 1, 1, 1
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
var radius = 9.62754;
var distance = 33.81633;
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
mvMatrix.translate( -0.2499378, 0.08589041, -0.1587372 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.81633);
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
