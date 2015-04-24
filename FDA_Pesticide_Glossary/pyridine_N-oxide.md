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
-3.00634, 0.1248878, -0.8784729, 1, 0, 0, 1,
-2.834341, 0.1849763, -1.258829, 1, 0.007843138, 0, 1,
-2.640773, -0.8683236, -1.104619, 1, 0.01176471, 0, 1,
-2.546843, 0.3460058, -1.639698, 1, 0.01960784, 0, 1,
-2.529628, 1.405493, 0.3755657, 1, 0.02352941, 0, 1,
-2.355158, 1.18989, -0.7816932, 1, 0.03137255, 0, 1,
-2.291288, 1.462024, -1.250098, 1, 0.03529412, 0, 1,
-2.228347, -1.021626, 0.3106357, 1, 0.04313726, 0, 1,
-2.223499, -1.68503, -2.54382, 1, 0.04705882, 0, 1,
-2.201267, -0.3207914, -2.019264, 1, 0.05490196, 0, 1,
-2.201052, -0.5287471, -2.578119, 1, 0.05882353, 0, 1,
-2.19835, 0.308746, -1.334028, 1, 0.06666667, 0, 1,
-2.179473, 0.5249069, -0.4934971, 1, 0.07058824, 0, 1,
-2.130732, -1.441209, -2.863742, 1, 0.07843138, 0, 1,
-2.105691, 0.2321499, -1.208117, 1, 0.08235294, 0, 1,
-2.096452, 0.3786511, -1.673436, 1, 0.09019608, 0, 1,
-2.088461, 0.3295686, -2.401776, 1, 0.09411765, 0, 1,
-2.017965, -0.08175855, -2.022564, 1, 0.1019608, 0, 1,
-1.981379, -0.04982762, -3.348192, 1, 0.1098039, 0, 1,
-1.975616, 0.3113658, -2.307305, 1, 0.1137255, 0, 1,
-1.975318, 0.09667706, -1.634135, 1, 0.1215686, 0, 1,
-1.970573, 1.328671, -1.181754, 1, 0.1254902, 0, 1,
-1.966253, 1.101821, -1.043573, 1, 0.1333333, 0, 1,
-1.956193, 0.5987152, -2.969273, 1, 0.1372549, 0, 1,
-1.947346, 0.02351145, -2.034232, 1, 0.145098, 0, 1,
-1.945697, 0.1555927, -1.141991, 1, 0.1490196, 0, 1,
-1.920494, 0.8610746, -1.095521, 1, 0.1568628, 0, 1,
-1.917477, 0.6433721, -0.5003051, 1, 0.1607843, 0, 1,
-1.916683, -0.9798499, -1.282675, 1, 0.1686275, 0, 1,
-1.901365, -0.1357543, -1.050448, 1, 0.172549, 0, 1,
-1.886528, 2.365396, 1.34189, 1, 0.1803922, 0, 1,
-1.874496, -1.072767, -1.661895, 1, 0.1843137, 0, 1,
-1.871537, 0.2822324, -1.808036, 1, 0.1921569, 0, 1,
-1.813546, 1.572325, -1.849407, 1, 0.1960784, 0, 1,
-1.811396, -0.6480755, -0.707159, 1, 0.2039216, 0, 1,
-1.800863, -0.8550681, -3.268804, 1, 0.2117647, 0, 1,
-1.795868, 0.005605737, 0.3324437, 1, 0.2156863, 0, 1,
-1.789548, -0.4815048, -1.408073, 1, 0.2235294, 0, 1,
-1.775357, -0.1193034, -2.492916, 1, 0.227451, 0, 1,
-1.76618, 1.291325, -0.1381977, 1, 0.2352941, 0, 1,
-1.762097, -0.01775304, -1.098331, 1, 0.2392157, 0, 1,
-1.756566, -0.4493062, -0.588415, 1, 0.2470588, 0, 1,
-1.754786, 0.5212363, -1.718961, 1, 0.2509804, 0, 1,
-1.747005, -0.6711913, -2.064569, 1, 0.2588235, 0, 1,
-1.73268, 0.9738219, -0.6150489, 1, 0.2627451, 0, 1,
-1.724423, -0.4051303, -3.093164, 1, 0.2705882, 0, 1,
-1.720482, 0.4024467, -1.24492, 1, 0.2745098, 0, 1,
-1.709745, 1.12737, -1.826417, 1, 0.282353, 0, 1,
-1.695342, 0.7075649, -0.1819666, 1, 0.2862745, 0, 1,
-1.681994, 0.5767053, -1.53154, 1, 0.2941177, 0, 1,
-1.677991, 0.2089247, -2.107292, 1, 0.3019608, 0, 1,
-1.66869, -0.3261428, -3.119361, 1, 0.3058824, 0, 1,
-1.667008, 1.146285, -0.8607619, 1, 0.3137255, 0, 1,
-1.66341, -0.4026276, -1.465807, 1, 0.3176471, 0, 1,
-1.658143, 1.151381, -0.2767538, 1, 0.3254902, 0, 1,
-1.647775, 0.01908397, -2.395516, 1, 0.3294118, 0, 1,
-1.647205, -1.36926, -0.5411352, 1, 0.3372549, 0, 1,
-1.637921, -0.07591635, -2.470723, 1, 0.3411765, 0, 1,
-1.630992, 0.7521346, -0.4269519, 1, 0.3490196, 0, 1,
-1.618748, 0.5267685, -1.251123, 1, 0.3529412, 0, 1,
-1.617711, -2.465542, -2.727345, 1, 0.3607843, 0, 1,
-1.610847, 0.1480142, -0.4073286, 1, 0.3647059, 0, 1,
-1.595275, -0.4922967, -1.462388, 1, 0.372549, 0, 1,
-1.594424, -0.3154785, -2.835191, 1, 0.3764706, 0, 1,
-1.592106, 0.5573387, -0.2996623, 1, 0.3843137, 0, 1,
-1.587489, -1.806444, -3.225822, 1, 0.3882353, 0, 1,
-1.579495, 1.80181, -0.8716257, 1, 0.3960784, 0, 1,
-1.560938, 0.9545737, -2.390928, 1, 0.4039216, 0, 1,
-1.52336, 0.2365975, -1.469839, 1, 0.4078431, 0, 1,
-1.50914, -0.5571764, -0.9830087, 1, 0.4156863, 0, 1,
-1.506638, 1.010116, -0.6600031, 1, 0.4196078, 0, 1,
-1.498528, -1.826168, -2.265787, 1, 0.427451, 0, 1,
-1.493867, 0.6141466, -0.577068, 1, 0.4313726, 0, 1,
-1.4915, -0.01124479, -1.930374, 1, 0.4392157, 0, 1,
-1.486563, 0.1401745, -3.31041, 1, 0.4431373, 0, 1,
-1.464916, 0.8026652, 0.6760111, 1, 0.4509804, 0, 1,
-1.446727, 1.243419, -0.2493809, 1, 0.454902, 0, 1,
-1.436573, 0.3492834, -0.3615877, 1, 0.4627451, 0, 1,
-1.43243, 0.5702934, 0.2943806, 1, 0.4666667, 0, 1,
-1.42206, -1.0952, -2.919049, 1, 0.4745098, 0, 1,
-1.415125, 1.335495, -1.042271, 1, 0.4784314, 0, 1,
-1.40887, -0.5941151, -1.350064, 1, 0.4862745, 0, 1,
-1.390915, 0.7853609, 0.2447351, 1, 0.4901961, 0, 1,
-1.376885, -1.207311, -3.661755, 1, 0.4980392, 0, 1,
-1.375825, 1.151526, -0.7438663, 1, 0.5058824, 0, 1,
-1.366249, -2.116127, -1.015398, 1, 0.509804, 0, 1,
-1.355637, 0.3473288, -2.011007, 1, 0.5176471, 0, 1,
-1.348459, 0.8673483, -1.282422, 1, 0.5215687, 0, 1,
-1.338745, -0.2157208, -2.048414, 1, 0.5294118, 0, 1,
-1.337943, 0.4140947, -0.7975456, 1, 0.5333334, 0, 1,
-1.334344, 0.6466624, -0.8777381, 1, 0.5411765, 0, 1,
-1.328331, 0.2020073, -1.546807, 1, 0.5450981, 0, 1,
-1.327304, -0.9093695, 0.3892789, 1, 0.5529412, 0, 1,
-1.316648, 0.7498106, -0.05291974, 1, 0.5568628, 0, 1,
-1.315938, 0.4497641, -2.253706, 1, 0.5647059, 0, 1,
-1.312527, -0.4961273, -2.042461, 1, 0.5686275, 0, 1,
-1.311809, -1.232589, -2.315502, 1, 0.5764706, 0, 1,
-1.289521, -0.4914005, -1.785144, 1, 0.5803922, 0, 1,
-1.285553, -0.8276695, -2.155687, 1, 0.5882353, 0, 1,
-1.274859, -0.9126793, -1.301028, 1, 0.5921569, 0, 1,
-1.269472, -0.1277353, -2.43576, 1, 0.6, 0, 1,
-1.269334, -0.04926349, -3.358997, 1, 0.6078432, 0, 1,
-1.263134, -0.8205464, -2.921392, 1, 0.6117647, 0, 1,
-1.258877, -1.35407, -1.956616, 1, 0.6196079, 0, 1,
-1.257721, -0.7275718, -1.981293, 1, 0.6235294, 0, 1,
-1.237758, 0.7389019, -1.497819, 1, 0.6313726, 0, 1,
-1.237347, 0.8333217, -1.971201, 1, 0.6352941, 0, 1,
-1.230657, 0.5489399, 0.2374855, 1, 0.6431373, 0, 1,
-1.224684, -0.2389278, -0.5199971, 1, 0.6470588, 0, 1,
-1.219528, -0.6951978, -1.359479, 1, 0.654902, 0, 1,
-1.199358, 1.693432, 1.029097, 1, 0.6588235, 0, 1,
-1.196756, 0.4795727, -0.12442, 1, 0.6666667, 0, 1,
-1.187684, 0.5795847, -2.048806, 1, 0.6705883, 0, 1,
-1.180892, 1.084551, -2.151374, 1, 0.6784314, 0, 1,
-1.180533, 0.7550558, -2.427428, 1, 0.682353, 0, 1,
-1.18025, 1.53194, -0.3637803, 1, 0.6901961, 0, 1,
-1.169879, 0.1553196, -1.393771, 1, 0.6941177, 0, 1,
-1.165174, 0.3557946, -1.651405, 1, 0.7019608, 0, 1,
-1.164124, -1.424113, -2.421051, 1, 0.7098039, 0, 1,
-1.160175, 0.2934824, -2.077163, 1, 0.7137255, 0, 1,
-1.149867, 0.9254273, -0.6740066, 1, 0.7215686, 0, 1,
-1.143327, 0.5256085, -0.7288015, 1, 0.7254902, 0, 1,
-1.135248, -0.6505056, -2.03049, 1, 0.7333333, 0, 1,
-1.13221, 0.4192206, -0.75527, 1, 0.7372549, 0, 1,
-1.121021, 0.9822513, 0.1571615, 1, 0.7450981, 0, 1,
-1.118653, 0.5651605, -0.4851707, 1, 0.7490196, 0, 1,
-1.114524, 0.5126864, -0.9766877, 1, 0.7568628, 0, 1,
-1.097832, -0.3603068, -2.899552, 1, 0.7607843, 0, 1,
-1.096863, 0.5220572, 0.3643629, 1, 0.7686275, 0, 1,
-1.087985, 0.6150239, -0.6885816, 1, 0.772549, 0, 1,
-1.086024, -0.4757558, -2.17287, 1, 0.7803922, 0, 1,
-1.085213, -0.3975877, -2.43846, 1, 0.7843137, 0, 1,
-1.075805, -1.827371, -1.329091, 1, 0.7921569, 0, 1,
-1.070546, 0.6699759, -2.614305, 1, 0.7960784, 0, 1,
-1.069538, -0.8356034, -1.160842, 1, 0.8039216, 0, 1,
-1.066407, -2.090074, -3.346921, 1, 0.8117647, 0, 1,
-1.044049, 1.442162, -2.102922, 1, 0.8156863, 0, 1,
-1.042838, 0.2923725, -2.27674, 1, 0.8235294, 0, 1,
-1.030011, 0.5078988, -0.5289692, 1, 0.827451, 0, 1,
-1.026285, -0.5688846, -1.091766, 1, 0.8352941, 0, 1,
-1.024435, -1.161828, -1.557745, 1, 0.8392157, 0, 1,
-1.023495, 0.2373242, -0.7823219, 1, 0.8470588, 0, 1,
-1.016459, 1.469481, -0.6899258, 1, 0.8509804, 0, 1,
-1.012734, 0.5868161, -2.706858, 1, 0.8588235, 0, 1,
-1.010452, 0.7585383, 0.2098818, 1, 0.8627451, 0, 1,
-1.008897, 0.2614356, -0.02465791, 1, 0.8705882, 0, 1,
-1.00795, 0.5954638, -1.232321, 1, 0.8745098, 0, 1,
-1.003127, 0.4309894, -2.281629, 1, 0.8823529, 0, 1,
-0.991456, 0.4801405, -2.229774, 1, 0.8862745, 0, 1,
-0.9851699, 2.247966, -0.8329015, 1, 0.8941177, 0, 1,
-0.9841795, 0.5835673, -0.5247098, 1, 0.8980392, 0, 1,
-0.9794304, 1.25963, 1.147436, 1, 0.9058824, 0, 1,
-0.9793665, -0.9116436, -1.259539, 1, 0.9137255, 0, 1,
-0.976149, -1.8597, -1.549262, 1, 0.9176471, 0, 1,
-0.9680284, 0.1195545, -2.28438, 1, 0.9254902, 0, 1,
-0.9640803, -1.883658, -1.083533, 1, 0.9294118, 0, 1,
-0.9544576, -0.6379474, -1.95559, 1, 0.9372549, 0, 1,
-0.9541253, -1.737628, -1.639389, 1, 0.9411765, 0, 1,
-0.9488229, 0.2000038, -1.434916, 1, 0.9490196, 0, 1,
-0.9465823, 0.1817448, -2.169739, 1, 0.9529412, 0, 1,
-0.943031, -0.0006208143, -1.102932, 1, 0.9607843, 0, 1,
-0.9426736, -0.6136398, -2.531168, 1, 0.9647059, 0, 1,
-0.9390718, 1.380304, -2.271855, 1, 0.972549, 0, 1,
-0.9338555, 0.09386361, -1.962586, 1, 0.9764706, 0, 1,
-0.9329569, -0.5343791, -3.65774, 1, 0.9843137, 0, 1,
-0.9296232, -0.7075011, -1.333416, 1, 0.9882353, 0, 1,
-0.9274709, 0.133192, -1.605959, 1, 0.9960784, 0, 1,
-0.9140606, 1.420725, -1.475169, 0.9960784, 1, 0, 1,
-0.9098563, -0.7010205, -2.329879, 0.9921569, 1, 0, 1,
-0.9081892, -0.003760979, -3.874536, 0.9843137, 1, 0, 1,
-0.9040083, -0.505347, -3.849723, 0.9803922, 1, 0, 1,
-0.896709, -0.08918607, -1.313853, 0.972549, 1, 0, 1,
-0.8932316, -0.6237972, -1.451122, 0.9686275, 1, 0, 1,
-0.8880715, -0.9730617, -2.604722, 0.9607843, 1, 0, 1,
-0.8846801, 1.428974, -0.05426751, 0.9568627, 1, 0, 1,
-0.8810742, 0.8115014, -1.570431, 0.9490196, 1, 0, 1,
-0.8788915, -0.779699, -2.059129, 0.945098, 1, 0, 1,
-0.8732608, 0.144548, -2.847267, 0.9372549, 1, 0, 1,
-0.8732022, -0.06022821, -1.929127, 0.9333333, 1, 0, 1,
-0.8722491, -0.9947256, -1.933148, 0.9254902, 1, 0, 1,
-0.8709624, -0.455309, -2.524572, 0.9215686, 1, 0, 1,
-0.8684381, 0.3120372, -3.932868, 0.9137255, 1, 0, 1,
-0.8595313, -1.282224, -2.343018, 0.9098039, 1, 0, 1,
-0.8551359, -1.75574, -2.467927, 0.9019608, 1, 0, 1,
-0.8403817, -2.952119, -2.262231, 0.8941177, 1, 0, 1,
-0.8391673, -0.01650889, -2.366374, 0.8901961, 1, 0, 1,
-0.8337374, -1.504294, -1.919971, 0.8823529, 1, 0, 1,
-0.8313256, -0.1268535, 0.2247036, 0.8784314, 1, 0, 1,
-0.8184116, 1.362663, 0.4650745, 0.8705882, 1, 0, 1,
-0.8108865, -0.452885, 0.1005447, 0.8666667, 1, 0, 1,
-0.8067116, -2.003557, -3.051352, 0.8588235, 1, 0, 1,
-0.8013198, -0.5491974, -2.418711, 0.854902, 1, 0, 1,
-0.7998403, -1.673272, -1.99544, 0.8470588, 1, 0, 1,
-0.7986711, -1.770073, -2.618939, 0.8431373, 1, 0, 1,
-0.7968963, -0.03617793, -0.3779039, 0.8352941, 1, 0, 1,
-0.7954769, 1.106121, 0.879053, 0.8313726, 1, 0, 1,
-0.7910072, 0.1213351, -1.154252, 0.8235294, 1, 0, 1,
-0.790273, -0.1827881, -1.103691, 0.8196079, 1, 0, 1,
-0.7882617, -0.2765338, -2.49719, 0.8117647, 1, 0, 1,
-0.7866182, -0.6678045, -2.680918, 0.8078431, 1, 0, 1,
-0.7862952, -1.115708, -3.071839, 0.8, 1, 0, 1,
-0.7844238, -0.2052961, -0.5757757, 0.7921569, 1, 0, 1,
-0.7825072, -1.821269, -4.470466, 0.7882353, 1, 0, 1,
-0.7769063, 0.4633113, -0.5961887, 0.7803922, 1, 0, 1,
-0.7739497, 1.553716, -0.6339238, 0.7764706, 1, 0, 1,
-0.7720944, 0.4593641, 0.4096951, 0.7686275, 1, 0, 1,
-0.7713767, -2.2199, -3.549123, 0.7647059, 1, 0, 1,
-0.7702891, 0.6626017, -0.6868224, 0.7568628, 1, 0, 1,
-0.7681251, 0.2106455, -2.036588, 0.7529412, 1, 0, 1,
-0.766776, -2.379777, -2.931033, 0.7450981, 1, 0, 1,
-0.7623856, 0.05301261, -2.816874, 0.7411765, 1, 0, 1,
-0.7587877, -0.2509917, -1.047138, 0.7333333, 1, 0, 1,
-0.7578918, 0.9455331, 0.8573627, 0.7294118, 1, 0, 1,
-0.757215, 0.8797149, -0.6127374, 0.7215686, 1, 0, 1,
-0.7570695, -1.146979, -2.01582, 0.7176471, 1, 0, 1,
-0.7455296, -0.6520223, -0.6391113, 0.7098039, 1, 0, 1,
-0.738743, -0.4195057, -0.8197035, 0.7058824, 1, 0, 1,
-0.7346916, -0.4041648, -3.831862, 0.6980392, 1, 0, 1,
-0.7307981, 0.5042073, 0.5053658, 0.6901961, 1, 0, 1,
-0.7280117, -2.583147, -3.348592, 0.6862745, 1, 0, 1,
-0.727348, 0.5201026, -2.261431, 0.6784314, 1, 0, 1,
-0.7271674, 2.394523, -1.825982, 0.6745098, 1, 0, 1,
-0.7226026, 0.8668929, 0.1457142, 0.6666667, 1, 0, 1,
-0.7220705, -0.559736, -2.974245, 0.6627451, 1, 0, 1,
-0.7145134, 1.680284, 0.4773064, 0.654902, 1, 0, 1,
-0.7113121, -3.776321, -2.147894, 0.6509804, 1, 0, 1,
-0.7075083, 0.8663119, -2.071319, 0.6431373, 1, 0, 1,
-0.7037277, 1.887167, -0.1597619, 0.6392157, 1, 0, 1,
-0.6979278, -1.11943, -1.016479, 0.6313726, 1, 0, 1,
-0.691671, 0.6578655, 0.9340661, 0.627451, 1, 0, 1,
-0.6843857, 0.888132, -0.6469682, 0.6196079, 1, 0, 1,
-0.6806874, 0.3264684, -2.829043, 0.6156863, 1, 0, 1,
-0.6772344, -0.208809, -2.215851, 0.6078432, 1, 0, 1,
-0.6749796, -0.3142432, -3.681208, 0.6039216, 1, 0, 1,
-0.6715196, 2.448361, -1.411416, 0.5960785, 1, 0, 1,
-0.6704043, -0.6189422, -2.194557, 0.5882353, 1, 0, 1,
-0.6674544, -1.299068, -5.042328, 0.5843138, 1, 0, 1,
-0.6648358, 0.920359, 0.4802263, 0.5764706, 1, 0, 1,
-0.6648312, -1.018316, -2.501628, 0.572549, 1, 0, 1,
-0.6643943, 0.8667414, 0.4992053, 0.5647059, 1, 0, 1,
-0.6608675, -0.02112707, -1.036313, 0.5607843, 1, 0, 1,
-0.657185, 0.1622241, -2.270103, 0.5529412, 1, 0, 1,
-0.6567232, -0.3544504, -2.612598, 0.5490196, 1, 0, 1,
-0.6564543, -0.4474139, -2.286346, 0.5411765, 1, 0, 1,
-0.6527351, -0.8348378, -3.451418, 0.5372549, 1, 0, 1,
-0.6497064, -0.5661939, -1.435907, 0.5294118, 1, 0, 1,
-0.6443826, 1.420487, -0.2488487, 0.5254902, 1, 0, 1,
-0.6424367, -0.01783383, -1.541626, 0.5176471, 1, 0, 1,
-0.6396572, -0.7391665, -2.067983, 0.5137255, 1, 0, 1,
-0.6385438, -2.297904, -2.25082, 0.5058824, 1, 0, 1,
-0.6363215, -0.2979484, 0.08277883, 0.5019608, 1, 0, 1,
-0.6350418, -0.4492224, -0.5849386, 0.4941176, 1, 0, 1,
-0.6350078, 0.1118025, -4.0724, 0.4862745, 1, 0, 1,
-0.6345662, 0.3372483, -2.561965, 0.4823529, 1, 0, 1,
-0.6329069, 0.09766828, -1.331204, 0.4745098, 1, 0, 1,
-0.6276441, -0.4442754, -2.161676, 0.4705882, 1, 0, 1,
-0.6273314, 0.7354709, -0.9511944, 0.4627451, 1, 0, 1,
-0.6250507, -0.3633548, -0.4992355, 0.4588235, 1, 0, 1,
-0.6228659, 0.4605255, 0.7446105, 0.4509804, 1, 0, 1,
-0.6159002, 0.2037816, -0.4817475, 0.4470588, 1, 0, 1,
-0.6155603, 0.3083116, -1.974999, 0.4392157, 1, 0, 1,
-0.614148, -0.05712604, -2.075081, 0.4352941, 1, 0, 1,
-0.611332, 1.109172, -2.080453, 0.427451, 1, 0, 1,
-0.6100102, -1.572562, -2.748967, 0.4235294, 1, 0, 1,
-0.6068071, -0.7883588, -1.599532, 0.4156863, 1, 0, 1,
-0.6066756, -0.7071198, -3.966317, 0.4117647, 1, 0, 1,
-0.6063275, 1.335914, 0.06211105, 0.4039216, 1, 0, 1,
-0.6060085, -0.3111083, -1.693115, 0.3960784, 1, 0, 1,
-0.6052691, 0.8661509, -1.143462, 0.3921569, 1, 0, 1,
-0.6034695, -1.030224, -4.437331, 0.3843137, 1, 0, 1,
-0.6026992, -0.3682578, -3.319476, 0.3803922, 1, 0, 1,
-0.6024722, 0.8880647, -1.929559, 0.372549, 1, 0, 1,
-0.5868023, -0.3839597, -2.12858, 0.3686275, 1, 0, 1,
-0.5801716, -0.1403028, -1.90258, 0.3607843, 1, 0, 1,
-0.5771231, 0.9314091, -0.3491326, 0.3568628, 1, 0, 1,
-0.5743144, -1.065047, -4.046187, 0.3490196, 1, 0, 1,
-0.5738094, -0.07479449, -2.38813, 0.345098, 1, 0, 1,
-0.5735139, 0.9378279, -1.136441, 0.3372549, 1, 0, 1,
-0.5676323, -0.2176217, -0.9302717, 0.3333333, 1, 0, 1,
-0.5657454, 0.091092, -2.110469, 0.3254902, 1, 0, 1,
-0.5645889, -0.9162022, -1.009726, 0.3215686, 1, 0, 1,
-0.5548063, -0.7728765, -2.712552, 0.3137255, 1, 0, 1,
-0.5528696, 0.1333127, -2.208276, 0.3098039, 1, 0, 1,
-0.5516232, -0.03336944, 0.1324008, 0.3019608, 1, 0, 1,
-0.547435, 0.8082442, -0.3254699, 0.2941177, 1, 0, 1,
-0.5448142, 0.25677, -1.492348, 0.2901961, 1, 0, 1,
-0.5445816, 0.8678594, 0.678771, 0.282353, 1, 0, 1,
-0.5436344, 0.8953773, 0.3425163, 0.2784314, 1, 0, 1,
-0.5381493, 1.122738, -0.9901207, 0.2705882, 1, 0, 1,
-0.5359379, 1.883408, 0.1524561, 0.2666667, 1, 0, 1,
-0.5351613, -0.3008904, -2.682244, 0.2588235, 1, 0, 1,
-0.531175, 0.2818656, -2.749888, 0.254902, 1, 0, 1,
-0.526105, 0.975529, -1.572538, 0.2470588, 1, 0, 1,
-0.5240712, 0.001281422, -2.778236, 0.2431373, 1, 0, 1,
-0.5222697, -0.2427505, -2.314015, 0.2352941, 1, 0, 1,
-0.5211126, -0.6853516, -1.988265, 0.2313726, 1, 0, 1,
-0.5170274, -0.2006289, -1.718671, 0.2235294, 1, 0, 1,
-0.5118359, -2.128067, -3.115946, 0.2196078, 1, 0, 1,
-0.5113493, 1.003272, 0.2524845, 0.2117647, 1, 0, 1,
-0.5104181, -1.754818, -2.663796, 0.2078431, 1, 0, 1,
-0.5093384, -0.2522183, -2.777203, 0.2, 1, 0, 1,
-0.5076047, 0.9573213, -1.586945, 0.1921569, 1, 0, 1,
-0.5072836, 0.08409374, 1.280671, 0.1882353, 1, 0, 1,
-0.5070357, 0.350422, -0.004200011, 0.1803922, 1, 0, 1,
-0.5059028, -0.1855445, -1.373361, 0.1764706, 1, 0, 1,
-0.498601, 0.7138054, 0.3847309, 0.1686275, 1, 0, 1,
-0.4960472, -0.07350743, -2.082141, 0.1647059, 1, 0, 1,
-0.4942555, 2.163424, 1.005221, 0.1568628, 1, 0, 1,
-0.492087, -0.6533223, -2.050026, 0.1529412, 1, 0, 1,
-0.4902081, 1.185674, -0.7783515, 0.145098, 1, 0, 1,
-0.4898381, -0.3223082, -0.9905657, 0.1411765, 1, 0, 1,
-0.4897429, 1.093436, -0.4135201, 0.1333333, 1, 0, 1,
-0.4835486, 0.08820988, -2.230037, 0.1294118, 1, 0, 1,
-0.4809982, -0.5738875, -0.3504784, 0.1215686, 1, 0, 1,
-0.4808719, 1.955003, -1.533928, 0.1176471, 1, 0, 1,
-0.480521, 0.9249954, -0.08318796, 0.1098039, 1, 0, 1,
-0.4746067, 0.4199393, 0.5006099, 0.1058824, 1, 0, 1,
-0.472916, 0.6194853, 0.2709828, 0.09803922, 1, 0, 1,
-0.4702752, -1.416056, -2.292513, 0.09019608, 1, 0, 1,
-0.4669018, -0.4610841, -3.593791, 0.08627451, 1, 0, 1,
-0.4608592, 1.32162, -0.1022121, 0.07843138, 1, 0, 1,
-0.4606058, 0.879252, 0.4868962, 0.07450981, 1, 0, 1,
-0.455191, -1.010811, -2.972373, 0.06666667, 1, 0, 1,
-0.4469055, 1.972947, 1.092918, 0.0627451, 1, 0, 1,
-0.4461056, -1.461942, -5.681105, 0.05490196, 1, 0, 1,
-0.4456865, 0.6257436, -2.465459, 0.05098039, 1, 0, 1,
-0.4455428, 0.03129537, -2.150881, 0.04313726, 1, 0, 1,
-0.4422261, -0.6330702, -1.69328, 0.03921569, 1, 0, 1,
-0.4397011, -2.869633, -2.863811, 0.03137255, 1, 0, 1,
-0.4367836, 0.9496706, -0.04355352, 0.02745098, 1, 0, 1,
-0.4346718, 0.2414836, -1.431953, 0.01960784, 1, 0, 1,
-0.4326411, -0.23623, -0.5838208, 0.01568628, 1, 0, 1,
-0.4271374, 1.389074, 1.826095, 0.007843138, 1, 0, 1,
-0.4232882, -1.212127, -2.396858, 0.003921569, 1, 0, 1,
-0.4144313, -1.189025, -2.259314, 0, 1, 0.003921569, 1,
-0.4142635, 0.3394678, 0.1677257, 0, 1, 0.01176471, 1,
-0.413486, -2.029777, -2.846578, 0, 1, 0.01568628, 1,
-0.4119895, 2.011923, -0.1465277, 0, 1, 0.02352941, 1,
-0.4114373, 0.6207907, -0.3009545, 0, 1, 0.02745098, 1,
-0.4065989, 0.06807347, 0.5687336, 0, 1, 0.03529412, 1,
-0.4048468, -0.9700075, -1.656426, 0, 1, 0.03921569, 1,
-0.3973834, 1.452283, -0.8538611, 0, 1, 0.04705882, 1,
-0.3923697, -0.7989566, -1.676156, 0, 1, 0.05098039, 1,
-0.3900381, -0.1671886, -2.440746, 0, 1, 0.05882353, 1,
-0.387737, 2.023617, -2.069301, 0, 1, 0.0627451, 1,
-0.3861873, -0.08754255, -2.762532, 0, 1, 0.07058824, 1,
-0.3833846, -1.302127, -2.73809, 0, 1, 0.07450981, 1,
-0.3796242, 0.2793173, -1.208695, 0, 1, 0.08235294, 1,
-0.3775138, -0.4527651, -3.138152, 0, 1, 0.08627451, 1,
-0.3764728, 0.4073153, -0.6960108, 0, 1, 0.09411765, 1,
-0.3734683, -0.1541821, -1.742759, 0, 1, 0.1019608, 1,
-0.3705903, -1.102507, -1.897516, 0, 1, 0.1058824, 1,
-0.3705091, 0.4314981, 0.7607875, 0, 1, 0.1137255, 1,
-0.3672038, 1.018406, -1.254443, 0, 1, 0.1176471, 1,
-0.3656569, 0.02903427, -1.754363, 0, 1, 0.1254902, 1,
-0.3643034, 2.382876, -1.075724, 0, 1, 0.1294118, 1,
-0.3478228, 0.8793023, 0.1052732, 0, 1, 0.1372549, 1,
-0.3460053, 0.07155872, -1.980221, 0, 1, 0.1411765, 1,
-0.3452924, -0.4351785, -2.832817, 0, 1, 0.1490196, 1,
-0.3444509, -0.01466516, -1.683534, 0, 1, 0.1529412, 1,
-0.3394339, -1.031042, -2.747023, 0, 1, 0.1607843, 1,
-0.339253, -0.2935452, -2.852154, 0, 1, 0.1647059, 1,
-0.3338391, -1.338141, -2.693909, 0, 1, 0.172549, 1,
-0.3276621, 0.4310764, -1.496514, 0, 1, 0.1764706, 1,
-0.3276276, 0.4037733, -0.6179727, 0, 1, 0.1843137, 1,
-0.327548, -1.12586, -1.81815, 0, 1, 0.1882353, 1,
-0.3265048, 0.9842906, -0.6638296, 0, 1, 0.1960784, 1,
-0.3251407, -0.2057298, -2.067653, 0, 1, 0.2039216, 1,
-0.3226088, -0.1524928, -1.475048, 0, 1, 0.2078431, 1,
-0.32175, -1.261806, -2.210785, 0, 1, 0.2156863, 1,
-0.3181374, -1.507515, -1.69137, 0, 1, 0.2196078, 1,
-0.3138711, -0.3812122, -1.486282, 0, 1, 0.227451, 1,
-0.311504, -0.2559594, -2.945504, 0, 1, 0.2313726, 1,
-0.3066198, 0.01569089, -1.344059, 0, 1, 0.2392157, 1,
-0.3059101, 1.838892, 0.0586527, 0, 1, 0.2431373, 1,
-0.3035386, 0.4253133, -1.270354, 0, 1, 0.2509804, 1,
-0.3033158, -0.3768615, -2.220163, 0, 1, 0.254902, 1,
-0.2970818, 1.234731, -1.299596, 0, 1, 0.2627451, 1,
-0.2957221, -1.151946, -2.335827, 0, 1, 0.2666667, 1,
-0.2915365, 0.3331841, -0.5111596, 0, 1, 0.2745098, 1,
-0.2907633, -0.606456, -2.648682, 0, 1, 0.2784314, 1,
-0.2904229, 0.1171657, -1.109366, 0, 1, 0.2862745, 1,
-0.2889874, -2.444414, -4.060494, 0, 1, 0.2901961, 1,
-0.2880917, -2.40724, -2.836871, 0, 1, 0.2980392, 1,
-0.2860475, 0.3188781, 0.9427592, 0, 1, 0.3058824, 1,
-0.2757255, -0.3118234, -4.495209, 0, 1, 0.3098039, 1,
-0.271798, 1.678613, -1.082572, 0, 1, 0.3176471, 1,
-0.2680785, -0.002345718, 0.9827679, 0, 1, 0.3215686, 1,
-0.2673003, -0.189679, -2.277485, 0, 1, 0.3294118, 1,
-0.2646824, -0.59411, -3.114787, 0, 1, 0.3333333, 1,
-0.2646109, -0.5103454, -0.9118771, 0, 1, 0.3411765, 1,
-0.2591605, 0.3694122, -0.7421657, 0, 1, 0.345098, 1,
-0.2552546, 0.9196262, 0.8433366, 0, 1, 0.3529412, 1,
-0.2547774, 0.3925041, 1.131, 0, 1, 0.3568628, 1,
-0.2501702, 0.2955399, -0.9210422, 0, 1, 0.3647059, 1,
-0.2476692, 0.1135511, -1.519097, 0, 1, 0.3686275, 1,
-0.2467131, 0.2288549, -0.5641862, 0, 1, 0.3764706, 1,
-0.2456955, 0.8695098, 0.6800602, 0, 1, 0.3803922, 1,
-0.2455819, -0.05269275, -3.447075, 0, 1, 0.3882353, 1,
-0.2455145, -1.567896, -2.99444, 0, 1, 0.3921569, 1,
-0.2454669, 0.6341614, -0.3458831, 0, 1, 0.4, 1,
-0.2434862, -1.008247, -3.69344, 0, 1, 0.4078431, 1,
-0.2429685, -1.879319, -1.528328, 0, 1, 0.4117647, 1,
-0.242119, 0.7908245, 0.4391901, 0, 1, 0.4196078, 1,
-0.2404408, 0.5162768, -0.7147366, 0, 1, 0.4235294, 1,
-0.237534, -0.7947537, -1.163921, 0, 1, 0.4313726, 1,
-0.2266804, 0.815398, -0.5739178, 0, 1, 0.4352941, 1,
-0.2243389, 1.03973, -1.720232, 0, 1, 0.4431373, 1,
-0.2192614, -0.07472484, -3.785601, 0, 1, 0.4470588, 1,
-0.2190126, 0.3852364, -1.854528, 0, 1, 0.454902, 1,
-0.2168003, -0.7548086, -2.625797, 0, 1, 0.4588235, 1,
-0.208491, -0.1423641, -3.613002, 0, 1, 0.4666667, 1,
-0.2022539, -1.213555, -2.84585, 0, 1, 0.4705882, 1,
-0.2003416, 0.9988274, 0.6135056, 0, 1, 0.4784314, 1,
-0.1985716, -0.007728516, -2.755907, 0, 1, 0.4823529, 1,
-0.1981381, 1.833832, 0.8924161, 0, 1, 0.4901961, 1,
-0.1973505, 0.3072775, 0.4290311, 0, 1, 0.4941176, 1,
-0.1966386, 2.75774, -0.6158482, 0, 1, 0.5019608, 1,
-0.1937141, 0.8080921, 1.651433, 0, 1, 0.509804, 1,
-0.1880017, 0.6464339, 0.1707236, 0, 1, 0.5137255, 1,
-0.1749676, 0.0404089, -0.2523709, 0, 1, 0.5215687, 1,
-0.173738, -2.104303, -2.750259, 0, 1, 0.5254902, 1,
-0.1724927, 0.1251495, 0.1092086, 0, 1, 0.5333334, 1,
-0.1716222, -0.3657291, -1.616885, 0, 1, 0.5372549, 1,
-0.1686649, -1.289903, -2.536075, 0, 1, 0.5450981, 1,
-0.1586004, 0.3269016, -0.8926671, 0, 1, 0.5490196, 1,
-0.153714, -0.5477148, -2.617482, 0, 1, 0.5568628, 1,
-0.1521685, -0.1649562, -1.740992, 0, 1, 0.5607843, 1,
-0.1494221, -1.344811, -4.504652, 0, 1, 0.5686275, 1,
-0.1489169, 1.573135, -0.419998, 0, 1, 0.572549, 1,
-0.1451294, -0.1223085, -3.834884, 0, 1, 0.5803922, 1,
-0.143171, -2.279107, -3.212775, 0, 1, 0.5843138, 1,
-0.140266, 1.166241, -0.01022469, 0, 1, 0.5921569, 1,
-0.1351165, -0.08552819, -1.559155, 0, 1, 0.5960785, 1,
-0.133502, 0.5066822, -0.2899717, 0, 1, 0.6039216, 1,
-0.1329907, 0.9046415, 0.04739571, 0, 1, 0.6117647, 1,
-0.1305047, 0.03055056, -0.8399451, 0, 1, 0.6156863, 1,
-0.1280196, -0.316546, -2.586674, 0, 1, 0.6235294, 1,
-0.1271371, -0.09900878, 0.1430775, 0, 1, 0.627451, 1,
-0.1250435, 0.3534839, 0.03750616, 0, 1, 0.6352941, 1,
-0.1223465, 0.3288382, 1.70115, 0, 1, 0.6392157, 1,
-0.1218132, -0.8165361, -4.232164, 0, 1, 0.6470588, 1,
-0.1211298, 1.22324, 0.9054647, 0, 1, 0.6509804, 1,
-0.1104006, -0.3987195, -1.265771, 0, 1, 0.6588235, 1,
-0.1088158, 0.3244112, -0.03591516, 0, 1, 0.6627451, 1,
-0.1083387, 1.474784, -0.3991503, 0, 1, 0.6705883, 1,
-0.1049822, 0.1806592, -0.8764327, 0, 1, 0.6745098, 1,
-0.09877489, 1.971485, -1.023755, 0, 1, 0.682353, 1,
-0.09729584, 1.515669, 1.631151, 0, 1, 0.6862745, 1,
-0.09435721, 0.2674429, -0.9216163, 0, 1, 0.6941177, 1,
-0.09205827, 1.072083, 0.2081825, 0, 1, 0.7019608, 1,
-0.09169365, -0.1619335, -2.123093, 0, 1, 0.7058824, 1,
-0.08821997, 0.2693318, -1.101196, 0, 1, 0.7137255, 1,
-0.08766551, 2.388555, 1.05645, 0, 1, 0.7176471, 1,
-0.0860939, 1.859589, -1.549551, 0, 1, 0.7254902, 1,
-0.08459931, -0.6144776, -2.233085, 0, 1, 0.7294118, 1,
-0.08032104, -1.56211, -3.184435, 0, 1, 0.7372549, 1,
-0.07659173, -0.327603, -2.311726, 0, 1, 0.7411765, 1,
-0.07418927, -0.1575169, -2.041635, 0, 1, 0.7490196, 1,
-0.07105687, 0.6924374, -0.7815251, 0, 1, 0.7529412, 1,
-0.0703469, 1.373569, 0.2467765, 0, 1, 0.7607843, 1,
-0.06603903, -0.6492291, -2.548735, 0, 1, 0.7647059, 1,
-0.0637124, 0.7468281, -2.04151, 0, 1, 0.772549, 1,
-0.06168345, 0.9327515, -1.039732, 0, 1, 0.7764706, 1,
-0.06042438, -0.6387836, -4.145885, 0, 1, 0.7843137, 1,
-0.05545663, 0.5919471, 0.6221317, 0, 1, 0.7882353, 1,
-0.05347421, 0.1884768, -0.6207574, 0, 1, 0.7960784, 1,
-0.04998066, 1.245249, 0.8088993, 0, 1, 0.8039216, 1,
-0.04970504, 0.8377991, 1.173956, 0, 1, 0.8078431, 1,
-0.04810786, 0.1999389, -0.9933942, 0, 1, 0.8156863, 1,
-0.04638378, 0.09431768, -1.196069, 0, 1, 0.8196079, 1,
-0.04542354, -1.019816, -2.601058, 0, 1, 0.827451, 1,
-0.04411673, -0.02979836, -3.155716, 0, 1, 0.8313726, 1,
-0.04382145, -0.6958554, -2.57547, 0, 1, 0.8392157, 1,
-0.04327447, 0.8995124, 1.935165, 0, 1, 0.8431373, 1,
-0.04080394, -1.701167, -2.456975, 0, 1, 0.8509804, 1,
-0.04041782, 1.001892, -0.8717423, 0, 1, 0.854902, 1,
-0.0373622, 0.5494159, 1.07249, 0, 1, 0.8627451, 1,
-0.03643692, -0.6798198, -3.679885, 0, 1, 0.8666667, 1,
-0.03260351, -0.03012778, -1.612651, 0, 1, 0.8745098, 1,
-0.0322439, 0.9212133, 1.631617, 0, 1, 0.8784314, 1,
-0.03009376, 0.5794125, -0.3174849, 0, 1, 0.8862745, 1,
-0.02712374, -0.8164116, -2.880454, 0, 1, 0.8901961, 1,
-0.02497148, 0.9925185, -0.4050729, 0, 1, 0.8980392, 1,
-0.02347832, 0.1690124, -0.7711782, 0, 1, 0.9058824, 1,
-0.02155941, 0.08893658, -0.7993457, 0, 1, 0.9098039, 1,
-0.01904492, 0.3851834, -0.6845405, 0, 1, 0.9176471, 1,
-0.01835457, -0.8638686, -2.816095, 0, 1, 0.9215686, 1,
-0.01715881, -0.3986069, -2.71368, 0, 1, 0.9294118, 1,
-0.0163468, 0.5412312, -0.9047161, 0, 1, 0.9333333, 1,
-0.0155199, 0.4876937, 0.5112076, 0, 1, 0.9411765, 1,
-0.01191968, -0.5708002, -1.128042, 0, 1, 0.945098, 1,
-0.008428714, 0.3942605, 0.8728435, 0, 1, 0.9529412, 1,
-0.003650868, 0.9932717, 1.65572, 0, 1, 0.9568627, 1,
-0.002692412, -1.383697, -2.492647, 0, 1, 0.9647059, 1,
0.001680982, 0.04112471, 0.5562373, 0, 1, 0.9686275, 1,
0.01823546, 0.7066954, -0.2008346, 0, 1, 0.9764706, 1,
0.01863474, 0.1103388, -1.000177, 0, 1, 0.9803922, 1,
0.01901899, -0.07633185, 1.530865, 0, 1, 0.9882353, 1,
0.02379969, -0.1850322, 3.204641, 0, 1, 0.9921569, 1,
0.02385255, -0.5193951, 3.123495, 0, 1, 1, 1,
0.0241184, 0.01297588, 3.247847, 0, 0.9921569, 1, 1,
0.02598687, -2.459957, 1.668506, 0, 0.9882353, 1, 1,
0.03451074, -0.4803069, 2.341566, 0, 0.9803922, 1, 1,
0.03772541, -0.853572, 3.686409, 0, 0.9764706, 1, 1,
0.03820487, 0.029384, 3.41121, 0, 0.9686275, 1, 1,
0.04568231, 0.1335664, 1.383219, 0, 0.9647059, 1, 1,
0.05213179, -0.5941017, 4.369887, 0, 0.9568627, 1, 1,
0.05855758, -0.7599952, 4.493348, 0, 0.9529412, 1, 1,
0.05860712, -2.204503, 3.769997, 0, 0.945098, 1, 1,
0.06072659, -1.344561, 3.48998, 0, 0.9411765, 1, 1,
0.0657571, -2.490412, 2.690526, 0, 0.9333333, 1, 1,
0.06829657, 0.8246035, 0.511077, 0, 0.9294118, 1, 1,
0.06976156, 0.06841509, 1.648322, 0, 0.9215686, 1, 1,
0.07065426, 0.1319496, 1.08144, 0, 0.9176471, 1, 1,
0.0724455, 0.764707, 2.624235, 0, 0.9098039, 1, 1,
0.07459291, 0.06172303, 0.2906889, 0, 0.9058824, 1, 1,
0.07564151, -1.081705, 3.018326, 0, 0.8980392, 1, 1,
0.08228783, -0.4228145, 3.046169, 0, 0.8901961, 1, 1,
0.08241811, 0.7463124, -0.2127127, 0, 0.8862745, 1, 1,
0.08399587, 0.2547483, -0.1419078, 0, 0.8784314, 1, 1,
0.08505891, 0.4133793, 0.1833814, 0, 0.8745098, 1, 1,
0.09251846, 0.9150191, 2.112126, 0, 0.8666667, 1, 1,
0.0926092, -0.1107908, 3.460233, 0, 0.8627451, 1, 1,
0.09435667, 0.05784092, 1.149019, 0, 0.854902, 1, 1,
0.09506274, 2.108416, -0.4522048, 0, 0.8509804, 1, 1,
0.09531235, 0.5550348, 0.885339, 0, 0.8431373, 1, 1,
0.09895584, 1.852756, -0.695519, 0, 0.8392157, 1, 1,
0.09910601, -0.08053853, 1.362224, 0, 0.8313726, 1, 1,
0.09944783, -0.9923849, 0.4387474, 0, 0.827451, 1, 1,
0.1015357, 2.515278, -1.462357, 0, 0.8196079, 1, 1,
0.1044928, -0.3652265, 2.490422, 0, 0.8156863, 1, 1,
0.1062624, -0.3894232, 4.35858, 0, 0.8078431, 1, 1,
0.1116999, 0.9958333, 0.3395448, 0, 0.8039216, 1, 1,
0.1166614, 0.8548616, -0.2107866, 0, 0.7960784, 1, 1,
0.1167147, -0.02840165, 2.664065, 0, 0.7882353, 1, 1,
0.1180914, 0.8708604, -0.2376782, 0, 0.7843137, 1, 1,
0.1219608, 0.01316548, 1.163329, 0, 0.7764706, 1, 1,
0.129145, -1.493721, 2.172031, 0, 0.772549, 1, 1,
0.1333122, 0.9913315, -0.6392417, 0, 0.7647059, 1, 1,
0.1380229, 0.4907233, -0.709784, 0, 0.7607843, 1, 1,
0.1391812, 1.65507, 0.6086817, 0, 0.7529412, 1, 1,
0.1395294, -0.3132829, 4.429256, 0, 0.7490196, 1, 1,
0.1396897, -0.1274378, 1.802564, 0, 0.7411765, 1, 1,
0.140759, 2.133747, -0.4226492, 0, 0.7372549, 1, 1,
0.1417347, -0.2987751, 1.277639, 0, 0.7294118, 1, 1,
0.1428449, 0.3101414, 2.224109, 0, 0.7254902, 1, 1,
0.1431835, -1.460457, 3.264634, 0, 0.7176471, 1, 1,
0.1446511, -0.7931721, 3.007768, 0, 0.7137255, 1, 1,
0.1472571, -0.04419858, 0.9510089, 0, 0.7058824, 1, 1,
0.1493252, 2.528546, 1.151059, 0, 0.6980392, 1, 1,
0.1525878, 1.40351, 0.9496994, 0, 0.6941177, 1, 1,
0.1539472, -1.407171, 2.376701, 0, 0.6862745, 1, 1,
0.154359, 0.3977069, 2.035288, 0, 0.682353, 1, 1,
0.1574741, 0.7879093, 0.2580078, 0, 0.6745098, 1, 1,
0.1579828, -0.5769456, 2.615111, 0, 0.6705883, 1, 1,
0.1619445, 1.365758, 1.903931, 0, 0.6627451, 1, 1,
0.1675916, -0.5494932, 1.885063, 0, 0.6588235, 1, 1,
0.1679734, 0.356412, 0.243735, 0, 0.6509804, 1, 1,
0.1683474, 1.926691, -1.935934, 0, 0.6470588, 1, 1,
0.1684442, 0.5651499, -1.986911, 0, 0.6392157, 1, 1,
0.1718533, 0.5360247, 1.53569, 0, 0.6352941, 1, 1,
0.1744261, -1.241647, 4.093858, 0, 0.627451, 1, 1,
0.1748183, 0.6533552, 0.6561732, 0, 0.6235294, 1, 1,
0.1760692, -0.2410655, 1.806787, 0, 0.6156863, 1, 1,
0.1781558, 0.4334255, 0.614884, 0, 0.6117647, 1, 1,
0.1804769, -0.53929, 5.087525, 0, 0.6039216, 1, 1,
0.1806068, 1.279794, 0.9783158, 0, 0.5960785, 1, 1,
0.1820188, 1.505612, 0.7307069, 0, 0.5921569, 1, 1,
0.185587, -0.03982374, 2.784096, 0, 0.5843138, 1, 1,
0.1857098, 0.4725906, 0.03341883, 0, 0.5803922, 1, 1,
0.1879565, -1.042603, 3.702325, 0, 0.572549, 1, 1,
0.189691, 0.09164289, -0.5732958, 0, 0.5686275, 1, 1,
0.1897642, -0.4448722, 3.617727, 0, 0.5607843, 1, 1,
0.1917231, 0.6268912, 0.9405151, 0, 0.5568628, 1, 1,
0.191847, -0.9407911, 0.8362986, 0, 0.5490196, 1, 1,
0.1976863, 0.8843884, 1.271548, 0, 0.5450981, 1, 1,
0.2042924, 0.1931986, 1.942754, 0, 0.5372549, 1, 1,
0.2089044, 1.689683, 0.723632, 0, 0.5333334, 1, 1,
0.2095417, -0.1713952, 4.282077, 0, 0.5254902, 1, 1,
0.2102145, -0.2329857, 5.202744, 0, 0.5215687, 1, 1,
0.2107734, -0.5894938, 1.871926, 0, 0.5137255, 1, 1,
0.2206714, -0.438605, 2.822912, 0, 0.509804, 1, 1,
0.221185, -0.2386887, 2.714153, 0, 0.5019608, 1, 1,
0.2276103, -0.6149231, 3.036944, 0, 0.4941176, 1, 1,
0.2300306, 0.7094258, -0.1226341, 0, 0.4901961, 1, 1,
0.2332674, 0.01871769, 1.550105, 0, 0.4823529, 1, 1,
0.2339043, -1.543796, 3.704477, 0, 0.4784314, 1, 1,
0.2343844, -1.102335, 1.865992, 0, 0.4705882, 1, 1,
0.2348441, -0.9269174, 2.206185, 0, 0.4666667, 1, 1,
0.2359784, -0.3260314, 0.4148426, 0, 0.4588235, 1, 1,
0.2378695, 0.3469215, 2.369804, 0, 0.454902, 1, 1,
0.2438675, -0.0835927, 2.330684, 0, 0.4470588, 1, 1,
0.2449546, -0.6088612, 3.32736, 0, 0.4431373, 1, 1,
0.2488161, 1.286266, -1.20276, 0, 0.4352941, 1, 1,
0.2536007, -1.179204, 3.674273, 0, 0.4313726, 1, 1,
0.2567604, 0.5452396, 0.557647, 0, 0.4235294, 1, 1,
0.2579992, 0.5733301, 1.159486, 0, 0.4196078, 1, 1,
0.26036, 0.4778661, -0.6331687, 0, 0.4117647, 1, 1,
0.2620526, 0.2497318, 2.296499, 0, 0.4078431, 1, 1,
0.2658487, 2.076957, 0.8450567, 0, 0.4, 1, 1,
0.2702624, 0.9975861, -0.4249875, 0, 0.3921569, 1, 1,
0.2719378, 0.5247395, 1.387778, 0, 0.3882353, 1, 1,
0.2752044, 0.1563858, 1.722267, 0, 0.3803922, 1, 1,
0.2758487, 2.054008, 1.058165, 0, 0.3764706, 1, 1,
0.2812255, 0.7607816, 0.2379702, 0, 0.3686275, 1, 1,
0.2816654, -0.6523017, 2.100966, 0, 0.3647059, 1, 1,
0.2839757, 0.6671377, -0.2888865, 0, 0.3568628, 1, 1,
0.2857089, -2.139413, 2.88604, 0, 0.3529412, 1, 1,
0.3115976, 0.0002675757, 3.205903, 0, 0.345098, 1, 1,
0.3142783, -1.056693, 4.198439, 0, 0.3411765, 1, 1,
0.3143654, -0.1685686, 3.106056, 0, 0.3333333, 1, 1,
0.3145298, -1.257072, 2.010288, 0, 0.3294118, 1, 1,
0.3161983, 0.08237323, 2.169474, 0, 0.3215686, 1, 1,
0.3183751, -0.5029202, 4.297627, 0, 0.3176471, 1, 1,
0.3211842, 1.703054, 0.1417777, 0, 0.3098039, 1, 1,
0.32572, 1.301381, -0.2526182, 0, 0.3058824, 1, 1,
0.3324669, 0.09154998, 0.05776709, 0, 0.2980392, 1, 1,
0.3378503, -0.1590065, 2.056865, 0, 0.2901961, 1, 1,
0.3424219, -0.1475161, 1.857098, 0, 0.2862745, 1, 1,
0.3479412, -0.2564464, 2.749283, 0, 0.2784314, 1, 1,
0.3495983, -1.081533, 1.080631, 0, 0.2745098, 1, 1,
0.3524501, 1.786648, 0.3318103, 0, 0.2666667, 1, 1,
0.3533626, -1.107648, 3.975274, 0, 0.2627451, 1, 1,
0.3543487, 0.7966992, 0.7235847, 0, 0.254902, 1, 1,
0.3547011, 0.4213783, 1.151812, 0, 0.2509804, 1, 1,
0.3566909, -0.4201676, 1.66406, 0, 0.2431373, 1, 1,
0.3574725, -0.1494467, 2.196001, 0, 0.2392157, 1, 1,
0.3623695, 2.027543, -1.592517, 0, 0.2313726, 1, 1,
0.371991, -0.01615508, 2.857943, 0, 0.227451, 1, 1,
0.3752056, 0.3288913, 1.864052, 0, 0.2196078, 1, 1,
0.3760563, -0.2398749, 1.478387, 0, 0.2156863, 1, 1,
0.3776223, 0.7971391, -0.154669, 0, 0.2078431, 1, 1,
0.3793342, -1.037337, 2.736351, 0, 0.2039216, 1, 1,
0.3853059, 1.511118, 2.119964, 0, 0.1960784, 1, 1,
0.3872395, -0.2787437, 4.376933, 0, 0.1882353, 1, 1,
0.391716, 0.6329419, 2.367726, 0, 0.1843137, 1, 1,
0.3937789, -0.6894107, 1.829711, 0, 0.1764706, 1, 1,
0.3981685, -0.4896412, 1.970219, 0, 0.172549, 1, 1,
0.40771, 0.9946116, -0.2054643, 0, 0.1647059, 1, 1,
0.41276, 0.4740736, 0.5475205, 0, 0.1607843, 1, 1,
0.413523, -0.5137106, 2.479498, 0, 0.1529412, 1, 1,
0.4202799, -0.284478, 2.657017, 0, 0.1490196, 1, 1,
0.421728, 1.043837, -0.3903145, 0, 0.1411765, 1, 1,
0.4219157, -1.347278, 2.40664, 0, 0.1372549, 1, 1,
0.4260688, -0.4787739, 3.768538, 0, 0.1294118, 1, 1,
0.4299353, -1.398516, 1.727475, 0, 0.1254902, 1, 1,
0.435489, -0.06796408, 1.255879, 0, 0.1176471, 1, 1,
0.4365119, -0.05067141, 0.2964101, 0, 0.1137255, 1, 1,
0.4369888, 0.06791302, 1.124456, 0, 0.1058824, 1, 1,
0.4381314, -1.998868, 3.55897, 0, 0.09803922, 1, 1,
0.4388834, 1.229732, 1.754036, 0, 0.09411765, 1, 1,
0.4480706, 0.7270885, 0.484921, 0, 0.08627451, 1, 1,
0.4486633, -0.432005, 2.336346, 0, 0.08235294, 1, 1,
0.456886, 1.007011, 0.3586971, 0, 0.07450981, 1, 1,
0.4586273, -1.156526, 1.624822, 0, 0.07058824, 1, 1,
0.4604354, 0.743941, -1.344649, 0, 0.0627451, 1, 1,
0.4641187, -0.6591995, 0.6341133, 0, 0.05882353, 1, 1,
0.4739938, 0.7413559, 2.007527, 0, 0.05098039, 1, 1,
0.4749549, 0.3624204, -1.26848, 0, 0.04705882, 1, 1,
0.4755509, -3.945903, 1.816761, 0, 0.03921569, 1, 1,
0.4792271, -0.2682635, 2.433012, 0, 0.03529412, 1, 1,
0.4861173, -0.06057036, -0.5057905, 0, 0.02745098, 1, 1,
0.4887169, -0.0723685, 1.369294, 0, 0.02352941, 1, 1,
0.4891424, -0.1806677, 1.383972, 0, 0.01568628, 1, 1,
0.4951996, 0.79822, -0.3913067, 0, 0.01176471, 1, 1,
0.4984488, -0.2626498, 0.6027401, 0, 0.003921569, 1, 1,
0.4989358, 1.351586, 1.676161, 0.003921569, 0, 1, 1,
0.4990751, -0.9806945, 4.192148, 0.007843138, 0, 1, 1,
0.5010309, -0.6163629, 2.731325, 0.01568628, 0, 1, 1,
0.5030769, 0.01839456, 1.139993, 0.01960784, 0, 1, 1,
0.5109928, 0.04407809, 0.3099194, 0.02745098, 0, 1, 1,
0.5130944, -1.698016, 3.491864, 0.03137255, 0, 1, 1,
0.5225518, 0.8591439, -1.097375, 0.03921569, 0, 1, 1,
0.5229198, 0.5248798, 0.2078076, 0.04313726, 0, 1, 1,
0.5264556, -1.007742, 2.595268, 0.05098039, 0, 1, 1,
0.5292833, -0.3772211, 4.541423, 0.05490196, 0, 1, 1,
0.53259, -0.4551543, 3.00889, 0.0627451, 0, 1, 1,
0.5376735, 0.3940895, 0.8547372, 0.06666667, 0, 1, 1,
0.5400448, 0.7919782, -0.7443131, 0.07450981, 0, 1, 1,
0.5428813, 0.02517876, 2.313868, 0.07843138, 0, 1, 1,
0.5430684, 1.445983, 1.301502, 0.08627451, 0, 1, 1,
0.5508353, -1.483084, 3.600863, 0.09019608, 0, 1, 1,
0.5590296, -0.6278944, 2.1587, 0.09803922, 0, 1, 1,
0.5685, 0.956048, -0.705291, 0.1058824, 0, 1, 1,
0.5758427, 0.6930743, 1.691983, 0.1098039, 0, 1, 1,
0.5793825, 1.74153, -0.4191701, 0.1176471, 0, 1, 1,
0.5795016, 0.5690456, 0.2009696, 0.1215686, 0, 1, 1,
0.5829731, 0.07206731, 1.792484, 0.1294118, 0, 1, 1,
0.5849783, 1.142766, -0.1259244, 0.1333333, 0, 1, 1,
0.5896451, -0.2932799, 2.086163, 0.1411765, 0, 1, 1,
0.5983107, 0.3206613, 0.09918738, 0.145098, 0, 1, 1,
0.5992274, -0.8438888, 2.619284, 0.1529412, 0, 1, 1,
0.6019998, 0.3006372, 0.6940567, 0.1568628, 0, 1, 1,
0.6082991, -2.098906, 2.408202, 0.1647059, 0, 1, 1,
0.6087995, -0.2492315, 1.49189, 0.1686275, 0, 1, 1,
0.6101551, 0.3660648, 0.4166005, 0.1764706, 0, 1, 1,
0.6146986, 0.5001318, 1.146304, 0.1803922, 0, 1, 1,
0.6175412, 0.8780799, -0.9454122, 0.1882353, 0, 1, 1,
0.6190364, 1.841569, 1.838323, 0.1921569, 0, 1, 1,
0.6196314, -0.992705, 0.4204699, 0.2, 0, 1, 1,
0.6209125, -0.7956123, 3.758522, 0.2078431, 0, 1, 1,
0.6238161, -1.356395, 2.523541, 0.2117647, 0, 1, 1,
0.6246364, -0.9652355, 3.284636, 0.2196078, 0, 1, 1,
0.6256995, -0.1324636, 1.871837, 0.2235294, 0, 1, 1,
0.626269, 0.236545, 0.6021789, 0.2313726, 0, 1, 1,
0.6369887, 0.7744817, 0.7799615, 0.2352941, 0, 1, 1,
0.6443245, -1.12275, 3.351505, 0.2431373, 0, 1, 1,
0.6505553, 0.1364958, 0.6545074, 0.2470588, 0, 1, 1,
0.6600432, 1.003228, 1.376481, 0.254902, 0, 1, 1,
0.6623006, 1.64301, 0.7076666, 0.2588235, 0, 1, 1,
0.6684052, 0.8504382, 0.646911, 0.2666667, 0, 1, 1,
0.6703172, 0.6192086, 0.9695777, 0.2705882, 0, 1, 1,
0.6722588, 1.146253, 0.2767732, 0.2784314, 0, 1, 1,
0.6740075, -0.07550696, 1.656714, 0.282353, 0, 1, 1,
0.678187, -1.716416, 2.270403, 0.2901961, 0, 1, 1,
0.681743, 1.305026, -0.1153822, 0.2941177, 0, 1, 1,
0.6888329, 0.9881768, 0.4385172, 0.3019608, 0, 1, 1,
0.6921992, 0.01144497, 0.2507418, 0.3098039, 0, 1, 1,
0.6927921, 0.7984891, 2.174552, 0.3137255, 0, 1, 1,
0.6932982, -0.6975911, 3.489289, 0.3215686, 0, 1, 1,
0.7048801, -0.6688381, 1.081929, 0.3254902, 0, 1, 1,
0.706076, 0.6047339, 0.238468, 0.3333333, 0, 1, 1,
0.7074214, 1.063442, -1.085893, 0.3372549, 0, 1, 1,
0.7104016, 1.367261, -0.1603586, 0.345098, 0, 1, 1,
0.7127597, -0.3387392, 1.166562, 0.3490196, 0, 1, 1,
0.7197635, 1.053751, 1.005592, 0.3568628, 0, 1, 1,
0.7215775, -0.2766814, 2.974267, 0.3607843, 0, 1, 1,
0.724694, -0.7465256, 3.00636, 0.3686275, 0, 1, 1,
0.727991, 0.9923599, -0.795014, 0.372549, 0, 1, 1,
0.7311039, -0.4782111, 3.001752, 0.3803922, 0, 1, 1,
0.7337202, -0.9787863, 0.2774399, 0.3843137, 0, 1, 1,
0.7337874, -0.2115724, 2.24128, 0.3921569, 0, 1, 1,
0.7391344, -3.471116, 2.926245, 0.3960784, 0, 1, 1,
0.7433494, -1.177527, 0.5737007, 0.4039216, 0, 1, 1,
0.7463776, 0.6044028, 0.261411, 0.4117647, 0, 1, 1,
0.7535668, -0.8422629, 0.8380287, 0.4156863, 0, 1, 1,
0.7543722, 0.25181, -1.164686, 0.4235294, 0, 1, 1,
0.7558493, -1.097621, 2.789436, 0.427451, 0, 1, 1,
0.7564762, 0.184747, 2.15806, 0.4352941, 0, 1, 1,
0.7565255, -0.04189917, 3.094734, 0.4392157, 0, 1, 1,
0.7621909, 1.848432, 1.091491, 0.4470588, 0, 1, 1,
0.7626017, -0.8190998, 3.186269, 0.4509804, 0, 1, 1,
0.7630528, -0.2573573, 0.6712587, 0.4588235, 0, 1, 1,
0.7635341, 1.396263, 0.7664618, 0.4627451, 0, 1, 1,
0.7657966, 0.6179302, -0.06670013, 0.4705882, 0, 1, 1,
0.7708572, -0.02708052, 1.370214, 0.4745098, 0, 1, 1,
0.7714592, -0.1590076, 1.509722, 0.4823529, 0, 1, 1,
0.7731109, -0.2762264, 2.605491, 0.4862745, 0, 1, 1,
0.7741405, 0.9030775, 0.1436581, 0.4941176, 0, 1, 1,
0.7789108, -1.064771, 4.016461, 0.5019608, 0, 1, 1,
0.7841591, -0.4631968, 2.620123, 0.5058824, 0, 1, 1,
0.7870957, -0.2860198, 2.815016, 0.5137255, 0, 1, 1,
0.7877243, -1.331354, 2.384095, 0.5176471, 0, 1, 1,
0.7923002, -0.1619947, 2.630306, 0.5254902, 0, 1, 1,
0.794549, 1.140478, -0.2158612, 0.5294118, 0, 1, 1,
0.7981939, -1.116601, 1.791227, 0.5372549, 0, 1, 1,
0.8051394, 0.3639846, -0.2919225, 0.5411765, 0, 1, 1,
0.8063154, 0.8661078, 1.108168, 0.5490196, 0, 1, 1,
0.8118522, -0.5133597, 2.227402, 0.5529412, 0, 1, 1,
0.8135284, -1.465758, 2.192745, 0.5607843, 0, 1, 1,
0.8200995, -1.079906, 2.115335, 0.5647059, 0, 1, 1,
0.820123, -2.568666, 3.1292, 0.572549, 0, 1, 1,
0.8201419, 0.2096776, 1.347729, 0.5764706, 0, 1, 1,
0.825214, -1.21628, 1.304652, 0.5843138, 0, 1, 1,
0.8286763, 0.6851937, 0.08137468, 0.5882353, 0, 1, 1,
0.8370505, 1.87656, 1.041277, 0.5960785, 0, 1, 1,
0.8395883, -0.5265812, 0.4920508, 0.6039216, 0, 1, 1,
0.8499793, 2.497694, -1.206846, 0.6078432, 0, 1, 1,
0.8562984, -0.2345401, 3.039732, 0.6156863, 0, 1, 1,
0.8584781, -1.07766, 1.464376, 0.6196079, 0, 1, 1,
0.8628227, -0.6792846, 4.182907, 0.627451, 0, 1, 1,
0.8654613, 1.981257, 0.5476603, 0.6313726, 0, 1, 1,
0.8768842, -0.4695106, 2.474124, 0.6392157, 0, 1, 1,
0.8780909, -0.0331552, 3.618728, 0.6431373, 0, 1, 1,
0.8820394, 0.3145852, 0.2831156, 0.6509804, 0, 1, 1,
0.882382, 0.6373406, 1.031755, 0.654902, 0, 1, 1,
0.8876566, -1.049787, 2.014397, 0.6627451, 0, 1, 1,
0.8883721, -0.3082603, 1.788637, 0.6666667, 0, 1, 1,
0.8909337, -0.9209061, 4.081256, 0.6745098, 0, 1, 1,
0.8911715, -0.7258477, 1.325393, 0.6784314, 0, 1, 1,
0.891315, -1.717602, 3.408634, 0.6862745, 0, 1, 1,
0.8923458, -1.103634, 1.686297, 0.6901961, 0, 1, 1,
0.9017937, -0.5109133, 2.950637, 0.6980392, 0, 1, 1,
0.9052008, -0.797601, 0.3885923, 0.7058824, 0, 1, 1,
0.909556, 0.2295081, 1.320406, 0.7098039, 0, 1, 1,
0.910642, -1.030516, 2.315483, 0.7176471, 0, 1, 1,
0.9134158, -0.2359602, 0.8588415, 0.7215686, 0, 1, 1,
0.9173664, -0.8108304, 3.333113, 0.7294118, 0, 1, 1,
0.9190369, -0.3693944, 2.059086, 0.7333333, 0, 1, 1,
0.9228595, -0.6634793, 1.894637, 0.7411765, 0, 1, 1,
0.9298352, -0.6438208, 1.982062, 0.7450981, 0, 1, 1,
0.9327686, -0.3383433, 3.054188, 0.7529412, 0, 1, 1,
0.9360309, -0.2075864, 3.083771, 0.7568628, 0, 1, 1,
0.9405438, -0.1396932, 2.71216, 0.7647059, 0, 1, 1,
0.9459123, -0.1285419, 2.985675, 0.7686275, 0, 1, 1,
0.9657015, -1.331626, 1.577755, 0.7764706, 0, 1, 1,
0.9728963, -1.128547, 2.190205, 0.7803922, 0, 1, 1,
0.9736157, -0.2049672, 3.912598, 0.7882353, 0, 1, 1,
0.9741649, 0.420129, 2.419141, 0.7921569, 0, 1, 1,
0.9749275, -1.060039, 3.444972, 0.8, 0, 1, 1,
0.9793165, -0.3636769, 2.180434, 0.8078431, 0, 1, 1,
0.9825802, 0.7200035, 1.376943, 0.8117647, 0, 1, 1,
0.9842285, 0.237581, 0.341023, 0.8196079, 0, 1, 1,
0.9866624, -0.2320562, 2.775466, 0.8235294, 0, 1, 1,
0.9875668, 2.07742, -1.650106, 0.8313726, 0, 1, 1,
0.994215, -0.6179318, 0.8293373, 0.8352941, 0, 1, 1,
0.9942549, 0.08145703, 1.429582, 0.8431373, 0, 1, 1,
0.997775, -0.6002604, 2.348094, 0.8470588, 0, 1, 1,
1.005774, 1.216696, 0.09245642, 0.854902, 0, 1, 1,
1.006756, -2.094922, 1.627408, 0.8588235, 0, 1, 1,
1.009592, -0.3550868, 1.936557, 0.8666667, 0, 1, 1,
1.011703, -0.9643852, 1.619702, 0.8705882, 0, 1, 1,
1.013724, -0.3798422, 1.641148, 0.8784314, 0, 1, 1,
1.014278, 1.177758, 1.287312, 0.8823529, 0, 1, 1,
1.014634, -0.4821417, 2.59239, 0.8901961, 0, 1, 1,
1.017207, 0.1995762, 3.313427, 0.8941177, 0, 1, 1,
1.018045, -0.8792892, 2.759437, 0.9019608, 0, 1, 1,
1.019245, -0.4955117, 1.535302, 0.9098039, 0, 1, 1,
1.026632, 0.4606848, 1.443197, 0.9137255, 0, 1, 1,
1.028602, 0.3040795, 1.4521, 0.9215686, 0, 1, 1,
1.030099, 0.1225838, 1.36204, 0.9254902, 0, 1, 1,
1.032213, -0.173138, 2.952436, 0.9333333, 0, 1, 1,
1.037545, 1.045987, 0.4910647, 0.9372549, 0, 1, 1,
1.041801, -0.569553, 2.734354, 0.945098, 0, 1, 1,
1.043135, -0.4023264, 1.060023, 0.9490196, 0, 1, 1,
1.046749, 0.3417327, 1.328436, 0.9568627, 0, 1, 1,
1.049574, 1.022105, 1.120311, 0.9607843, 0, 1, 1,
1.050205, -1.430396, 2.853033, 0.9686275, 0, 1, 1,
1.054094, -2.475744, 1.665038, 0.972549, 0, 1, 1,
1.055607, -1.397535, 0.8797067, 0.9803922, 0, 1, 1,
1.058297, -0.02933882, 0.3969852, 0.9843137, 0, 1, 1,
1.061886, -0.4282984, 0.03194914, 0.9921569, 0, 1, 1,
1.064421, 0.4362951, 1.305211, 0.9960784, 0, 1, 1,
1.064802, -0.5340835, 1.902769, 1, 0, 0.9960784, 1,
1.06597, 0.305697, 1.914488, 1, 0, 0.9882353, 1,
1.075591, 0.04546151, 1.511583, 1, 0, 0.9843137, 1,
1.08102, 0.5677643, 2.088028, 1, 0, 0.9764706, 1,
1.082914, 0.848821, -0.0141679, 1, 0, 0.972549, 1,
1.085235, 0.9024652, -0.10168, 1, 0, 0.9647059, 1,
1.094531, 0.06081653, 1.014208, 1, 0, 0.9607843, 1,
1.095068, -0.5836445, 0.5167244, 1, 0, 0.9529412, 1,
1.095562, -0.6314394, 1.576421, 1, 0, 0.9490196, 1,
1.098575, -0.004781607, 0.1982364, 1, 0, 0.9411765, 1,
1.104807, 0.7304729, 0.05851748, 1, 0, 0.9372549, 1,
1.10868, -0.5693546, 1.913825, 1, 0, 0.9294118, 1,
1.108683, -0.8889136, 1.709792, 1, 0, 0.9254902, 1,
1.110992, 0.7216805, 0.3796757, 1, 0, 0.9176471, 1,
1.11347, 0.5186039, 0.2280466, 1, 0, 0.9137255, 1,
1.11712, -0.4664002, 1.265391, 1, 0, 0.9058824, 1,
1.117902, -0.1388897, 3.128849, 1, 0, 0.9019608, 1,
1.125196, 0.9081697, 1.452615, 1, 0, 0.8941177, 1,
1.129236, -0.6155881, 2.204529, 1, 0, 0.8862745, 1,
1.13089, 0.6847377, 0.1145002, 1, 0, 0.8823529, 1,
1.132909, -0.6672581, 3.570559, 1, 0, 0.8745098, 1,
1.13817, -0.4663274, 1.035337, 1, 0, 0.8705882, 1,
1.140756, 1.1545, 1.157913, 1, 0, 0.8627451, 1,
1.147178, -0.334399, 1.092676, 1, 0, 0.8588235, 1,
1.157809, -0.1794685, 1.743502, 1, 0, 0.8509804, 1,
1.16548, -1.056678, 2.626981, 1, 0, 0.8470588, 1,
1.167325, -0.8202504, 3.640164, 1, 0, 0.8392157, 1,
1.170635, 0.02623978, 1.625564, 1, 0, 0.8352941, 1,
1.170735, 0.3104853, 1.271824, 1, 0, 0.827451, 1,
1.175446, -0.3601117, 1.747153, 1, 0, 0.8235294, 1,
1.176257, 0.1302002, 0.650398, 1, 0, 0.8156863, 1,
1.196031, -0.1292401, 2.960179, 1, 0, 0.8117647, 1,
1.198171, 0.4747891, 2.994889, 1, 0, 0.8039216, 1,
1.200692, -0.3081836, 1.92752, 1, 0, 0.7960784, 1,
1.203877, 0.4039173, 0.8166925, 1, 0, 0.7921569, 1,
1.205397, 2.137508, -0.7695472, 1, 0, 0.7843137, 1,
1.222741, -0.8874674, 2.928941, 1, 0, 0.7803922, 1,
1.225216, -0.9615197, 2.974753, 1, 0, 0.772549, 1,
1.225296, 0.29878, 2.147896, 1, 0, 0.7686275, 1,
1.231571, 0.4678277, -0.2726519, 1, 0, 0.7607843, 1,
1.233163, 0.2148953, 0.07284275, 1, 0, 0.7568628, 1,
1.244496, 0.7266412, 1.442249, 1, 0, 0.7490196, 1,
1.251874, 0.4198107, 1.411893, 1, 0, 0.7450981, 1,
1.259021, 0.01290314, 1.3471, 1, 0, 0.7372549, 1,
1.268061, -1.44319, 2.860438, 1, 0, 0.7333333, 1,
1.270193, 0.4091522, 2.212004, 1, 0, 0.7254902, 1,
1.274576, 1.398521, 0.3009779, 1, 0, 0.7215686, 1,
1.284036, 0.8726798, -1.512722, 1, 0, 0.7137255, 1,
1.284589, -0.9521846, 2.821966, 1, 0, 0.7098039, 1,
1.289354, -1.286652, 1.836697, 1, 0, 0.7019608, 1,
1.294959, -0.3596795, 1.822431, 1, 0, 0.6941177, 1,
1.300127, -0.7986196, 0.9698109, 1, 0, 0.6901961, 1,
1.30072, -0.7008005, 2.22374, 1, 0, 0.682353, 1,
1.307659, 1.010816, 3.280214, 1, 0, 0.6784314, 1,
1.309159, -0.5643653, 2.118382, 1, 0, 0.6705883, 1,
1.310054, 0.9830552, 0.6705372, 1, 0, 0.6666667, 1,
1.311795, -0.7969034, 3.492323, 1, 0, 0.6588235, 1,
1.313711, -0.387694, 2.810492, 1, 0, 0.654902, 1,
1.324192, 0.01241791, 2.839518, 1, 0, 0.6470588, 1,
1.331176, -0.607434, 2.293687, 1, 0, 0.6431373, 1,
1.337735, 0.5687034, 1.706496, 1, 0, 0.6352941, 1,
1.342135, 0.6797554, 0.874347, 1, 0, 0.6313726, 1,
1.359417, -0.07755573, 2.401855, 1, 0, 0.6235294, 1,
1.360372, -0.8945634, 1.976985, 1, 0, 0.6196079, 1,
1.372096, 1.680778, 0.4682145, 1, 0, 0.6117647, 1,
1.375946, 0.3176668, 1.123446, 1, 0, 0.6078432, 1,
1.387424, -0.168406, 3.159896, 1, 0, 0.6, 1,
1.393154, 0.8706817, 2.345793, 1, 0, 0.5921569, 1,
1.408005, -0.2281308, 3.895959, 1, 0, 0.5882353, 1,
1.412288, 1.014965, -0.906961, 1, 0, 0.5803922, 1,
1.41554, -0.6841306, 1.256428, 1, 0, 0.5764706, 1,
1.415543, 0.09934887, 1.273324, 1, 0, 0.5686275, 1,
1.418369, -1.391207, 1.555473, 1, 0, 0.5647059, 1,
1.419628, -0.06224472, 2.360287, 1, 0, 0.5568628, 1,
1.420074, -0.818785, 0.9592683, 1, 0, 0.5529412, 1,
1.420244, 0.2631206, 1.03546, 1, 0, 0.5450981, 1,
1.423106, 1.660743, 0.047112, 1, 0, 0.5411765, 1,
1.428389, 1.635383, 0.232725, 1, 0, 0.5333334, 1,
1.441771, 0.6878475, 0.7275493, 1, 0, 0.5294118, 1,
1.445649, -0.3076697, 1.076689, 1, 0, 0.5215687, 1,
1.446144, 0.1625851, 2.316512, 1, 0, 0.5176471, 1,
1.454938, -2.130042, 1.208443, 1, 0, 0.509804, 1,
1.466732, 0.06913482, 3.276571, 1, 0, 0.5058824, 1,
1.468102, 0.1610708, 0.7318166, 1, 0, 0.4980392, 1,
1.478181, 0.3497862, 1.090326, 1, 0, 0.4901961, 1,
1.48974, 0.1669096, 2.037174, 1, 0, 0.4862745, 1,
1.491638, -0.9509124, 3.243132, 1, 0, 0.4784314, 1,
1.494405, 0.04472143, 1.533265, 1, 0, 0.4745098, 1,
1.497765, -0.4059478, 2.729751, 1, 0, 0.4666667, 1,
1.499205, 1.057782, -0.5221212, 1, 0, 0.4627451, 1,
1.500024, -0.6561232, 2.120009, 1, 0, 0.454902, 1,
1.508346, -0.8490757, 2.549698, 1, 0, 0.4509804, 1,
1.524793, 1.162335, -0.772137, 1, 0, 0.4431373, 1,
1.524818, -1.600584, 2.409708, 1, 0, 0.4392157, 1,
1.526193, 1.13804, 1.780079, 1, 0, 0.4313726, 1,
1.540053, -0.2375304, 1.314716, 1, 0, 0.427451, 1,
1.548763, -1.187512, 4.067499, 1, 0, 0.4196078, 1,
1.554134, -0.9722698, 1.753831, 1, 0, 0.4156863, 1,
1.556235, -1.215713, 2.598793, 1, 0, 0.4078431, 1,
1.557637, 0.3860874, 2.001422, 1, 0, 0.4039216, 1,
1.561194, -0.3663219, 2.748316, 1, 0, 0.3960784, 1,
1.564877, -0.1146277, -1.249454, 1, 0, 0.3882353, 1,
1.566216, 0.2883579, 1.421322, 1, 0, 0.3843137, 1,
1.566902, 0.8158745, 1.249238, 1, 0, 0.3764706, 1,
1.568479, 1.296652, 0.216795, 1, 0, 0.372549, 1,
1.571237, 0.01278558, 1.578363, 1, 0, 0.3647059, 1,
1.572777, -0.5030248, 2.154431, 1, 0, 0.3607843, 1,
1.575248, -0.5687128, 2.547294, 1, 0, 0.3529412, 1,
1.60767, 1.163515, 3.351497, 1, 0, 0.3490196, 1,
1.611765, -1.787252, 2.363047, 1, 0, 0.3411765, 1,
1.617626, 0.5815122, 1.606902, 1, 0, 0.3372549, 1,
1.620577, 0.01949507, 1.888356, 1, 0, 0.3294118, 1,
1.622649, 0.8425899, 0.9890769, 1, 0, 0.3254902, 1,
1.626167, -2.099885, 2.027921, 1, 0, 0.3176471, 1,
1.62777, -0.02007613, 2.009391, 1, 0, 0.3137255, 1,
1.640058, 1.702886, -0.5121296, 1, 0, 0.3058824, 1,
1.658177, -0.4693812, 1.849523, 1, 0, 0.2980392, 1,
1.665608, -1.282994, 2.138179, 1, 0, 0.2941177, 1,
1.677785, -2.4509, 2.550699, 1, 0, 0.2862745, 1,
1.693144, -0.3906823, 3.883494, 1, 0, 0.282353, 1,
1.705696, -0.4098791, 1.470999, 1, 0, 0.2745098, 1,
1.730592, -0.2251739, 1.835132, 1, 0, 0.2705882, 1,
1.737228, -0.5991119, 1.942226, 1, 0, 0.2627451, 1,
1.738271, -0.9875538, 1.54345, 1, 0, 0.2588235, 1,
1.744368, 0.4252309, 1.121073, 1, 0, 0.2509804, 1,
1.762866, -0.5926043, 2.752524, 1, 0, 0.2470588, 1,
1.767022, -0.4503773, 3.423887, 1, 0, 0.2392157, 1,
1.77116, 0.2499811, 1.021942, 1, 0, 0.2352941, 1,
1.787539, 1.156605, 0.8823268, 1, 0, 0.227451, 1,
1.789936, 0.6834639, 2.177838, 1, 0, 0.2235294, 1,
1.790091, 0.4939546, 0.1909384, 1, 0, 0.2156863, 1,
1.795487, 1.062237, 0.5874338, 1, 0, 0.2117647, 1,
1.799584, -0.2400718, -0.437577, 1, 0, 0.2039216, 1,
1.800331, 0.03158369, -0.6228726, 1, 0, 0.1960784, 1,
1.80399, -1.210373, 2.132013, 1, 0, 0.1921569, 1,
1.813186, -2.977403, 3.789043, 1, 0, 0.1843137, 1,
1.815248, -1.462255, 3.196878, 1, 0, 0.1803922, 1,
1.818694, -0.7771574, 2.790092, 1, 0, 0.172549, 1,
1.822011, 0.6500751, 0.3450816, 1, 0, 0.1686275, 1,
1.822973, 0.2831623, 0.6969988, 1, 0, 0.1607843, 1,
1.843093, -0.5303944, 0.9024796, 1, 0, 0.1568628, 1,
1.847427, 1.33394, 0.6506947, 1, 0, 0.1490196, 1,
1.872643, 0.2664173, -0.2611011, 1, 0, 0.145098, 1,
1.918012, -0.4643701, -0.9068711, 1, 0, 0.1372549, 1,
1.920476, 0.4476347, 1.828349, 1, 0, 0.1333333, 1,
1.925702, 0.6493987, 0.5461225, 1, 0, 0.1254902, 1,
1.928755, 1.918361, 0.812215, 1, 0, 0.1215686, 1,
1.968026, 0.09213269, 2.699082, 1, 0, 0.1137255, 1,
1.975156, 1.169037, 0.2506961, 1, 0, 0.1098039, 1,
1.975537, -0.5280382, 2.782806, 1, 0, 0.1019608, 1,
1.997909, -0.3159944, 1.589362, 1, 0, 0.09411765, 1,
2.012818, -2.06722, 1.512481, 1, 0, 0.09019608, 1,
2.026186, 1.356602, 2.091954, 1, 0, 0.08235294, 1,
2.09843, -0.5785994, 3.360526, 1, 0, 0.07843138, 1,
2.136409, 1.842362, 0.5657985, 1, 0, 0.07058824, 1,
2.192638, -1.196934, 2.445305, 1, 0, 0.06666667, 1,
2.257911, -0.5109462, 1.778237, 1, 0, 0.05882353, 1,
2.358053, 0.8631369, -0.6003428, 1, 0, 0.05490196, 1,
2.414099, -0.1562438, 1.397753, 1, 0, 0.04705882, 1,
2.497884, -0.2184111, 2.494993, 1, 0, 0.04313726, 1,
2.524482, -1.909975, 3.3818, 1, 0, 0.03529412, 1,
2.542745, 1.110121, 2.733786, 1, 0, 0.03137255, 1,
2.944488, -0.4550582, 1.618313, 1, 0, 0.02352941, 1,
2.956132, -0.5405086, 3.119777, 1, 0, 0.01960784, 1,
3.03445, 0.5061025, 2.974962, 1, 0, 0.01176471, 1,
3.3749, 0.5938916, -0.07677606, 1, 0, 0.007843138, 1
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
0.18428, -5.082171, -7.525918, 0, -0.5, 0.5, 0.5,
0.18428, -5.082171, -7.525918, 1, -0.5, 0.5, 0.5,
0.18428, -5.082171, -7.525918, 1, 1.5, 0.5, 0.5,
0.18428, -5.082171, -7.525918, 0, 1.5, 0.5, 0.5
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
-4.087961, -0.5940814, -7.525918, 0, -0.5, 0.5, 0.5,
-4.087961, -0.5940814, -7.525918, 1, -0.5, 0.5, 0.5,
-4.087961, -0.5940814, -7.525918, 1, 1.5, 0.5, 0.5,
-4.087961, -0.5940814, -7.525918, 0, 1.5, 0.5, 0.5
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
-4.087961, -5.082171, -0.2391808, 0, -0.5, 0.5, 0.5,
-4.087961, -5.082171, -0.2391808, 1, -0.5, 0.5, 0.5,
-4.087961, -5.082171, -0.2391808, 1, 1.5, 0.5, 0.5,
-4.087961, -5.082171, -0.2391808, 0, 1.5, 0.5, 0.5
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
-3, -4.046458, -5.844363,
3, -4.046458, -5.844363,
-3, -4.046458, -5.844363,
-3, -4.219077, -6.124622,
-2, -4.046458, -5.844363,
-2, -4.219077, -6.124622,
-1, -4.046458, -5.844363,
-1, -4.219077, -6.124622,
0, -4.046458, -5.844363,
0, -4.219077, -6.124622,
1, -4.046458, -5.844363,
1, -4.219077, -6.124622,
2, -4.046458, -5.844363,
2, -4.219077, -6.124622,
3, -4.046458, -5.844363,
3, -4.219077, -6.124622
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
-3, -4.564314, -6.68514, 0, -0.5, 0.5, 0.5,
-3, -4.564314, -6.68514, 1, -0.5, 0.5, 0.5,
-3, -4.564314, -6.68514, 1, 1.5, 0.5, 0.5,
-3, -4.564314, -6.68514, 0, 1.5, 0.5, 0.5,
-2, -4.564314, -6.68514, 0, -0.5, 0.5, 0.5,
-2, -4.564314, -6.68514, 1, -0.5, 0.5, 0.5,
-2, -4.564314, -6.68514, 1, 1.5, 0.5, 0.5,
-2, -4.564314, -6.68514, 0, 1.5, 0.5, 0.5,
-1, -4.564314, -6.68514, 0, -0.5, 0.5, 0.5,
-1, -4.564314, -6.68514, 1, -0.5, 0.5, 0.5,
-1, -4.564314, -6.68514, 1, 1.5, 0.5, 0.5,
-1, -4.564314, -6.68514, 0, 1.5, 0.5, 0.5,
0, -4.564314, -6.68514, 0, -0.5, 0.5, 0.5,
0, -4.564314, -6.68514, 1, -0.5, 0.5, 0.5,
0, -4.564314, -6.68514, 1, 1.5, 0.5, 0.5,
0, -4.564314, -6.68514, 0, 1.5, 0.5, 0.5,
1, -4.564314, -6.68514, 0, -0.5, 0.5, 0.5,
1, -4.564314, -6.68514, 1, -0.5, 0.5, 0.5,
1, -4.564314, -6.68514, 1, 1.5, 0.5, 0.5,
1, -4.564314, -6.68514, 0, 1.5, 0.5, 0.5,
2, -4.564314, -6.68514, 0, -0.5, 0.5, 0.5,
2, -4.564314, -6.68514, 1, -0.5, 0.5, 0.5,
2, -4.564314, -6.68514, 1, 1.5, 0.5, 0.5,
2, -4.564314, -6.68514, 0, 1.5, 0.5, 0.5,
3, -4.564314, -6.68514, 0, -0.5, 0.5, 0.5,
3, -4.564314, -6.68514, 1, -0.5, 0.5, 0.5,
3, -4.564314, -6.68514, 1, 1.5, 0.5, 0.5,
3, -4.564314, -6.68514, 0, 1.5, 0.5, 0.5
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
-3.102059, -3, -5.844363,
-3.102059, 2, -5.844363,
-3.102059, -3, -5.844363,
-3.266376, -3, -6.124622,
-3.102059, -2, -5.844363,
-3.266376, -2, -6.124622,
-3.102059, -1, -5.844363,
-3.266376, -1, -6.124622,
-3.102059, 0, -5.844363,
-3.266376, 0, -6.124622,
-3.102059, 1, -5.844363,
-3.266376, 1, -6.124622,
-3.102059, 2, -5.844363,
-3.266376, 2, -6.124622
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
-3.59501, -3, -6.68514, 0, -0.5, 0.5, 0.5,
-3.59501, -3, -6.68514, 1, -0.5, 0.5, 0.5,
-3.59501, -3, -6.68514, 1, 1.5, 0.5, 0.5,
-3.59501, -3, -6.68514, 0, 1.5, 0.5, 0.5,
-3.59501, -2, -6.68514, 0, -0.5, 0.5, 0.5,
-3.59501, -2, -6.68514, 1, -0.5, 0.5, 0.5,
-3.59501, -2, -6.68514, 1, 1.5, 0.5, 0.5,
-3.59501, -2, -6.68514, 0, 1.5, 0.5, 0.5,
-3.59501, -1, -6.68514, 0, -0.5, 0.5, 0.5,
-3.59501, -1, -6.68514, 1, -0.5, 0.5, 0.5,
-3.59501, -1, -6.68514, 1, 1.5, 0.5, 0.5,
-3.59501, -1, -6.68514, 0, 1.5, 0.5, 0.5,
-3.59501, 0, -6.68514, 0, -0.5, 0.5, 0.5,
-3.59501, 0, -6.68514, 1, -0.5, 0.5, 0.5,
-3.59501, 0, -6.68514, 1, 1.5, 0.5, 0.5,
-3.59501, 0, -6.68514, 0, 1.5, 0.5, 0.5,
-3.59501, 1, -6.68514, 0, -0.5, 0.5, 0.5,
-3.59501, 1, -6.68514, 1, -0.5, 0.5, 0.5,
-3.59501, 1, -6.68514, 1, 1.5, 0.5, 0.5,
-3.59501, 1, -6.68514, 0, 1.5, 0.5, 0.5,
-3.59501, 2, -6.68514, 0, -0.5, 0.5, 0.5,
-3.59501, 2, -6.68514, 1, -0.5, 0.5, 0.5,
-3.59501, 2, -6.68514, 1, 1.5, 0.5, 0.5,
-3.59501, 2, -6.68514, 0, 1.5, 0.5, 0.5
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
-3.102059, -4.046458, -4,
-3.102059, -4.046458, 4,
-3.102059, -4.046458, -4,
-3.266376, -4.219077, -4,
-3.102059, -4.046458, -2,
-3.266376, -4.219077, -2,
-3.102059, -4.046458, 0,
-3.266376, -4.219077, 0,
-3.102059, -4.046458, 2,
-3.266376, -4.219077, 2,
-3.102059, -4.046458, 4,
-3.266376, -4.219077, 4
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
-3.59501, -4.564314, -4, 0, -0.5, 0.5, 0.5,
-3.59501, -4.564314, -4, 1, -0.5, 0.5, 0.5,
-3.59501, -4.564314, -4, 1, 1.5, 0.5, 0.5,
-3.59501, -4.564314, -4, 0, 1.5, 0.5, 0.5,
-3.59501, -4.564314, -2, 0, -0.5, 0.5, 0.5,
-3.59501, -4.564314, -2, 1, -0.5, 0.5, 0.5,
-3.59501, -4.564314, -2, 1, 1.5, 0.5, 0.5,
-3.59501, -4.564314, -2, 0, 1.5, 0.5, 0.5,
-3.59501, -4.564314, 0, 0, -0.5, 0.5, 0.5,
-3.59501, -4.564314, 0, 1, -0.5, 0.5, 0.5,
-3.59501, -4.564314, 0, 1, 1.5, 0.5, 0.5,
-3.59501, -4.564314, 0, 0, 1.5, 0.5, 0.5,
-3.59501, -4.564314, 2, 0, -0.5, 0.5, 0.5,
-3.59501, -4.564314, 2, 1, -0.5, 0.5, 0.5,
-3.59501, -4.564314, 2, 1, 1.5, 0.5, 0.5,
-3.59501, -4.564314, 2, 0, 1.5, 0.5, 0.5,
-3.59501, -4.564314, 4, 0, -0.5, 0.5, 0.5,
-3.59501, -4.564314, 4, 1, -0.5, 0.5, 0.5,
-3.59501, -4.564314, 4, 1, 1.5, 0.5, 0.5,
-3.59501, -4.564314, 4, 0, 1.5, 0.5, 0.5
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
-3.102059, -4.046458, -5.844363,
-3.102059, 2.858295, -5.844363,
-3.102059, -4.046458, 5.366001,
-3.102059, 2.858295, 5.366001,
-3.102059, -4.046458, -5.844363,
-3.102059, -4.046458, 5.366001,
-3.102059, 2.858295, -5.844363,
-3.102059, 2.858295, 5.366001,
-3.102059, -4.046458, -5.844363,
3.470619, -4.046458, -5.844363,
-3.102059, -4.046458, 5.366001,
3.470619, -4.046458, 5.366001,
-3.102059, 2.858295, -5.844363,
3.470619, 2.858295, -5.844363,
-3.102059, 2.858295, 5.366001,
3.470619, 2.858295, 5.366001,
3.470619, -4.046458, -5.844363,
3.470619, 2.858295, -5.844363,
3.470619, -4.046458, 5.366001,
3.470619, 2.858295, 5.366001,
3.470619, -4.046458, -5.844363,
3.470619, -4.046458, 5.366001,
3.470619, 2.858295, -5.844363,
3.470619, 2.858295, 5.366001
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
var radius = 7.857828;
var distance = 34.96037;
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
mvMatrix.translate( -0.18428, 0.5940814, 0.2391808 );
mvMatrix.scale( 1.29263, 1.230462, 0.7578735 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.96037);
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
pyridine_N-oxide<-read.table("pyridine_N-oxide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridine_N-oxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridine_N' not found
```

```r
y<-pyridine_N-oxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridine_N' not found
```

```r
z<-pyridine_N-oxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridine_N' not found
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
-3.00634, 0.1248878, -0.8784729, 0, 0, 1, 1, 1,
-2.834341, 0.1849763, -1.258829, 1, 0, 0, 1, 1,
-2.640773, -0.8683236, -1.104619, 1, 0, 0, 1, 1,
-2.546843, 0.3460058, -1.639698, 1, 0, 0, 1, 1,
-2.529628, 1.405493, 0.3755657, 1, 0, 0, 1, 1,
-2.355158, 1.18989, -0.7816932, 1, 0, 0, 1, 1,
-2.291288, 1.462024, -1.250098, 0, 0, 0, 1, 1,
-2.228347, -1.021626, 0.3106357, 0, 0, 0, 1, 1,
-2.223499, -1.68503, -2.54382, 0, 0, 0, 1, 1,
-2.201267, -0.3207914, -2.019264, 0, 0, 0, 1, 1,
-2.201052, -0.5287471, -2.578119, 0, 0, 0, 1, 1,
-2.19835, 0.308746, -1.334028, 0, 0, 0, 1, 1,
-2.179473, 0.5249069, -0.4934971, 0, 0, 0, 1, 1,
-2.130732, -1.441209, -2.863742, 1, 1, 1, 1, 1,
-2.105691, 0.2321499, -1.208117, 1, 1, 1, 1, 1,
-2.096452, 0.3786511, -1.673436, 1, 1, 1, 1, 1,
-2.088461, 0.3295686, -2.401776, 1, 1, 1, 1, 1,
-2.017965, -0.08175855, -2.022564, 1, 1, 1, 1, 1,
-1.981379, -0.04982762, -3.348192, 1, 1, 1, 1, 1,
-1.975616, 0.3113658, -2.307305, 1, 1, 1, 1, 1,
-1.975318, 0.09667706, -1.634135, 1, 1, 1, 1, 1,
-1.970573, 1.328671, -1.181754, 1, 1, 1, 1, 1,
-1.966253, 1.101821, -1.043573, 1, 1, 1, 1, 1,
-1.956193, 0.5987152, -2.969273, 1, 1, 1, 1, 1,
-1.947346, 0.02351145, -2.034232, 1, 1, 1, 1, 1,
-1.945697, 0.1555927, -1.141991, 1, 1, 1, 1, 1,
-1.920494, 0.8610746, -1.095521, 1, 1, 1, 1, 1,
-1.917477, 0.6433721, -0.5003051, 1, 1, 1, 1, 1,
-1.916683, -0.9798499, -1.282675, 0, 0, 1, 1, 1,
-1.901365, -0.1357543, -1.050448, 1, 0, 0, 1, 1,
-1.886528, 2.365396, 1.34189, 1, 0, 0, 1, 1,
-1.874496, -1.072767, -1.661895, 1, 0, 0, 1, 1,
-1.871537, 0.2822324, -1.808036, 1, 0, 0, 1, 1,
-1.813546, 1.572325, -1.849407, 1, 0, 0, 1, 1,
-1.811396, -0.6480755, -0.707159, 0, 0, 0, 1, 1,
-1.800863, -0.8550681, -3.268804, 0, 0, 0, 1, 1,
-1.795868, 0.005605737, 0.3324437, 0, 0, 0, 1, 1,
-1.789548, -0.4815048, -1.408073, 0, 0, 0, 1, 1,
-1.775357, -0.1193034, -2.492916, 0, 0, 0, 1, 1,
-1.76618, 1.291325, -0.1381977, 0, 0, 0, 1, 1,
-1.762097, -0.01775304, -1.098331, 0, 0, 0, 1, 1,
-1.756566, -0.4493062, -0.588415, 1, 1, 1, 1, 1,
-1.754786, 0.5212363, -1.718961, 1, 1, 1, 1, 1,
-1.747005, -0.6711913, -2.064569, 1, 1, 1, 1, 1,
-1.73268, 0.9738219, -0.6150489, 1, 1, 1, 1, 1,
-1.724423, -0.4051303, -3.093164, 1, 1, 1, 1, 1,
-1.720482, 0.4024467, -1.24492, 1, 1, 1, 1, 1,
-1.709745, 1.12737, -1.826417, 1, 1, 1, 1, 1,
-1.695342, 0.7075649, -0.1819666, 1, 1, 1, 1, 1,
-1.681994, 0.5767053, -1.53154, 1, 1, 1, 1, 1,
-1.677991, 0.2089247, -2.107292, 1, 1, 1, 1, 1,
-1.66869, -0.3261428, -3.119361, 1, 1, 1, 1, 1,
-1.667008, 1.146285, -0.8607619, 1, 1, 1, 1, 1,
-1.66341, -0.4026276, -1.465807, 1, 1, 1, 1, 1,
-1.658143, 1.151381, -0.2767538, 1, 1, 1, 1, 1,
-1.647775, 0.01908397, -2.395516, 1, 1, 1, 1, 1,
-1.647205, -1.36926, -0.5411352, 0, 0, 1, 1, 1,
-1.637921, -0.07591635, -2.470723, 1, 0, 0, 1, 1,
-1.630992, 0.7521346, -0.4269519, 1, 0, 0, 1, 1,
-1.618748, 0.5267685, -1.251123, 1, 0, 0, 1, 1,
-1.617711, -2.465542, -2.727345, 1, 0, 0, 1, 1,
-1.610847, 0.1480142, -0.4073286, 1, 0, 0, 1, 1,
-1.595275, -0.4922967, -1.462388, 0, 0, 0, 1, 1,
-1.594424, -0.3154785, -2.835191, 0, 0, 0, 1, 1,
-1.592106, 0.5573387, -0.2996623, 0, 0, 0, 1, 1,
-1.587489, -1.806444, -3.225822, 0, 0, 0, 1, 1,
-1.579495, 1.80181, -0.8716257, 0, 0, 0, 1, 1,
-1.560938, 0.9545737, -2.390928, 0, 0, 0, 1, 1,
-1.52336, 0.2365975, -1.469839, 0, 0, 0, 1, 1,
-1.50914, -0.5571764, -0.9830087, 1, 1, 1, 1, 1,
-1.506638, 1.010116, -0.6600031, 1, 1, 1, 1, 1,
-1.498528, -1.826168, -2.265787, 1, 1, 1, 1, 1,
-1.493867, 0.6141466, -0.577068, 1, 1, 1, 1, 1,
-1.4915, -0.01124479, -1.930374, 1, 1, 1, 1, 1,
-1.486563, 0.1401745, -3.31041, 1, 1, 1, 1, 1,
-1.464916, 0.8026652, 0.6760111, 1, 1, 1, 1, 1,
-1.446727, 1.243419, -0.2493809, 1, 1, 1, 1, 1,
-1.436573, 0.3492834, -0.3615877, 1, 1, 1, 1, 1,
-1.43243, 0.5702934, 0.2943806, 1, 1, 1, 1, 1,
-1.42206, -1.0952, -2.919049, 1, 1, 1, 1, 1,
-1.415125, 1.335495, -1.042271, 1, 1, 1, 1, 1,
-1.40887, -0.5941151, -1.350064, 1, 1, 1, 1, 1,
-1.390915, 0.7853609, 0.2447351, 1, 1, 1, 1, 1,
-1.376885, -1.207311, -3.661755, 1, 1, 1, 1, 1,
-1.375825, 1.151526, -0.7438663, 0, 0, 1, 1, 1,
-1.366249, -2.116127, -1.015398, 1, 0, 0, 1, 1,
-1.355637, 0.3473288, -2.011007, 1, 0, 0, 1, 1,
-1.348459, 0.8673483, -1.282422, 1, 0, 0, 1, 1,
-1.338745, -0.2157208, -2.048414, 1, 0, 0, 1, 1,
-1.337943, 0.4140947, -0.7975456, 1, 0, 0, 1, 1,
-1.334344, 0.6466624, -0.8777381, 0, 0, 0, 1, 1,
-1.328331, 0.2020073, -1.546807, 0, 0, 0, 1, 1,
-1.327304, -0.9093695, 0.3892789, 0, 0, 0, 1, 1,
-1.316648, 0.7498106, -0.05291974, 0, 0, 0, 1, 1,
-1.315938, 0.4497641, -2.253706, 0, 0, 0, 1, 1,
-1.312527, -0.4961273, -2.042461, 0, 0, 0, 1, 1,
-1.311809, -1.232589, -2.315502, 0, 0, 0, 1, 1,
-1.289521, -0.4914005, -1.785144, 1, 1, 1, 1, 1,
-1.285553, -0.8276695, -2.155687, 1, 1, 1, 1, 1,
-1.274859, -0.9126793, -1.301028, 1, 1, 1, 1, 1,
-1.269472, -0.1277353, -2.43576, 1, 1, 1, 1, 1,
-1.269334, -0.04926349, -3.358997, 1, 1, 1, 1, 1,
-1.263134, -0.8205464, -2.921392, 1, 1, 1, 1, 1,
-1.258877, -1.35407, -1.956616, 1, 1, 1, 1, 1,
-1.257721, -0.7275718, -1.981293, 1, 1, 1, 1, 1,
-1.237758, 0.7389019, -1.497819, 1, 1, 1, 1, 1,
-1.237347, 0.8333217, -1.971201, 1, 1, 1, 1, 1,
-1.230657, 0.5489399, 0.2374855, 1, 1, 1, 1, 1,
-1.224684, -0.2389278, -0.5199971, 1, 1, 1, 1, 1,
-1.219528, -0.6951978, -1.359479, 1, 1, 1, 1, 1,
-1.199358, 1.693432, 1.029097, 1, 1, 1, 1, 1,
-1.196756, 0.4795727, -0.12442, 1, 1, 1, 1, 1,
-1.187684, 0.5795847, -2.048806, 0, 0, 1, 1, 1,
-1.180892, 1.084551, -2.151374, 1, 0, 0, 1, 1,
-1.180533, 0.7550558, -2.427428, 1, 0, 0, 1, 1,
-1.18025, 1.53194, -0.3637803, 1, 0, 0, 1, 1,
-1.169879, 0.1553196, -1.393771, 1, 0, 0, 1, 1,
-1.165174, 0.3557946, -1.651405, 1, 0, 0, 1, 1,
-1.164124, -1.424113, -2.421051, 0, 0, 0, 1, 1,
-1.160175, 0.2934824, -2.077163, 0, 0, 0, 1, 1,
-1.149867, 0.9254273, -0.6740066, 0, 0, 0, 1, 1,
-1.143327, 0.5256085, -0.7288015, 0, 0, 0, 1, 1,
-1.135248, -0.6505056, -2.03049, 0, 0, 0, 1, 1,
-1.13221, 0.4192206, -0.75527, 0, 0, 0, 1, 1,
-1.121021, 0.9822513, 0.1571615, 0, 0, 0, 1, 1,
-1.118653, 0.5651605, -0.4851707, 1, 1, 1, 1, 1,
-1.114524, 0.5126864, -0.9766877, 1, 1, 1, 1, 1,
-1.097832, -0.3603068, -2.899552, 1, 1, 1, 1, 1,
-1.096863, 0.5220572, 0.3643629, 1, 1, 1, 1, 1,
-1.087985, 0.6150239, -0.6885816, 1, 1, 1, 1, 1,
-1.086024, -0.4757558, -2.17287, 1, 1, 1, 1, 1,
-1.085213, -0.3975877, -2.43846, 1, 1, 1, 1, 1,
-1.075805, -1.827371, -1.329091, 1, 1, 1, 1, 1,
-1.070546, 0.6699759, -2.614305, 1, 1, 1, 1, 1,
-1.069538, -0.8356034, -1.160842, 1, 1, 1, 1, 1,
-1.066407, -2.090074, -3.346921, 1, 1, 1, 1, 1,
-1.044049, 1.442162, -2.102922, 1, 1, 1, 1, 1,
-1.042838, 0.2923725, -2.27674, 1, 1, 1, 1, 1,
-1.030011, 0.5078988, -0.5289692, 1, 1, 1, 1, 1,
-1.026285, -0.5688846, -1.091766, 1, 1, 1, 1, 1,
-1.024435, -1.161828, -1.557745, 0, 0, 1, 1, 1,
-1.023495, 0.2373242, -0.7823219, 1, 0, 0, 1, 1,
-1.016459, 1.469481, -0.6899258, 1, 0, 0, 1, 1,
-1.012734, 0.5868161, -2.706858, 1, 0, 0, 1, 1,
-1.010452, 0.7585383, 0.2098818, 1, 0, 0, 1, 1,
-1.008897, 0.2614356, -0.02465791, 1, 0, 0, 1, 1,
-1.00795, 0.5954638, -1.232321, 0, 0, 0, 1, 1,
-1.003127, 0.4309894, -2.281629, 0, 0, 0, 1, 1,
-0.991456, 0.4801405, -2.229774, 0, 0, 0, 1, 1,
-0.9851699, 2.247966, -0.8329015, 0, 0, 0, 1, 1,
-0.9841795, 0.5835673, -0.5247098, 0, 0, 0, 1, 1,
-0.9794304, 1.25963, 1.147436, 0, 0, 0, 1, 1,
-0.9793665, -0.9116436, -1.259539, 0, 0, 0, 1, 1,
-0.976149, -1.8597, -1.549262, 1, 1, 1, 1, 1,
-0.9680284, 0.1195545, -2.28438, 1, 1, 1, 1, 1,
-0.9640803, -1.883658, -1.083533, 1, 1, 1, 1, 1,
-0.9544576, -0.6379474, -1.95559, 1, 1, 1, 1, 1,
-0.9541253, -1.737628, -1.639389, 1, 1, 1, 1, 1,
-0.9488229, 0.2000038, -1.434916, 1, 1, 1, 1, 1,
-0.9465823, 0.1817448, -2.169739, 1, 1, 1, 1, 1,
-0.943031, -0.0006208143, -1.102932, 1, 1, 1, 1, 1,
-0.9426736, -0.6136398, -2.531168, 1, 1, 1, 1, 1,
-0.9390718, 1.380304, -2.271855, 1, 1, 1, 1, 1,
-0.9338555, 0.09386361, -1.962586, 1, 1, 1, 1, 1,
-0.9329569, -0.5343791, -3.65774, 1, 1, 1, 1, 1,
-0.9296232, -0.7075011, -1.333416, 1, 1, 1, 1, 1,
-0.9274709, 0.133192, -1.605959, 1, 1, 1, 1, 1,
-0.9140606, 1.420725, -1.475169, 1, 1, 1, 1, 1,
-0.9098563, -0.7010205, -2.329879, 0, 0, 1, 1, 1,
-0.9081892, -0.003760979, -3.874536, 1, 0, 0, 1, 1,
-0.9040083, -0.505347, -3.849723, 1, 0, 0, 1, 1,
-0.896709, -0.08918607, -1.313853, 1, 0, 0, 1, 1,
-0.8932316, -0.6237972, -1.451122, 1, 0, 0, 1, 1,
-0.8880715, -0.9730617, -2.604722, 1, 0, 0, 1, 1,
-0.8846801, 1.428974, -0.05426751, 0, 0, 0, 1, 1,
-0.8810742, 0.8115014, -1.570431, 0, 0, 0, 1, 1,
-0.8788915, -0.779699, -2.059129, 0, 0, 0, 1, 1,
-0.8732608, 0.144548, -2.847267, 0, 0, 0, 1, 1,
-0.8732022, -0.06022821, -1.929127, 0, 0, 0, 1, 1,
-0.8722491, -0.9947256, -1.933148, 0, 0, 0, 1, 1,
-0.8709624, -0.455309, -2.524572, 0, 0, 0, 1, 1,
-0.8684381, 0.3120372, -3.932868, 1, 1, 1, 1, 1,
-0.8595313, -1.282224, -2.343018, 1, 1, 1, 1, 1,
-0.8551359, -1.75574, -2.467927, 1, 1, 1, 1, 1,
-0.8403817, -2.952119, -2.262231, 1, 1, 1, 1, 1,
-0.8391673, -0.01650889, -2.366374, 1, 1, 1, 1, 1,
-0.8337374, -1.504294, -1.919971, 1, 1, 1, 1, 1,
-0.8313256, -0.1268535, 0.2247036, 1, 1, 1, 1, 1,
-0.8184116, 1.362663, 0.4650745, 1, 1, 1, 1, 1,
-0.8108865, -0.452885, 0.1005447, 1, 1, 1, 1, 1,
-0.8067116, -2.003557, -3.051352, 1, 1, 1, 1, 1,
-0.8013198, -0.5491974, -2.418711, 1, 1, 1, 1, 1,
-0.7998403, -1.673272, -1.99544, 1, 1, 1, 1, 1,
-0.7986711, -1.770073, -2.618939, 1, 1, 1, 1, 1,
-0.7968963, -0.03617793, -0.3779039, 1, 1, 1, 1, 1,
-0.7954769, 1.106121, 0.879053, 1, 1, 1, 1, 1,
-0.7910072, 0.1213351, -1.154252, 0, 0, 1, 1, 1,
-0.790273, -0.1827881, -1.103691, 1, 0, 0, 1, 1,
-0.7882617, -0.2765338, -2.49719, 1, 0, 0, 1, 1,
-0.7866182, -0.6678045, -2.680918, 1, 0, 0, 1, 1,
-0.7862952, -1.115708, -3.071839, 1, 0, 0, 1, 1,
-0.7844238, -0.2052961, -0.5757757, 1, 0, 0, 1, 1,
-0.7825072, -1.821269, -4.470466, 0, 0, 0, 1, 1,
-0.7769063, 0.4633113, -0.5961887, 0, 0, 0, 1, 1,
-0.7739497, 1.553716, -0.6339238, 0, 0, 0, 1, 1,
-0.7720944, 0.4593641, 0.4096951, 0, 0, 0, 1, 1,
-0.7713767, -2.2199, -3.549123, 0, 0, 0, 1, 1,
-0.7702891, 0.6626017, -0.6868224, 0, 0, 0, 1, 1,
-0.7681251, 0.2106455, -2.036588, 0, 0, 0, 1, 1,
-0.766776, -2.379777, -2.931033, 1, 1, 1, 1, 1,
-0.7623856, 0.05301261, -2.816874, 1, 1, 1, 1, 1,
-0.7587877, -0.2509917, -1.047138, 1, 1, 1, 1, 1,
-0.7578918, 0.9455331, 0.8573627, 1, 1, 1, 1, 1,
-0.757215, 0.8797149, -0.6127374, 1, 1, 1, 1, 1,
-0.7570695, -1.146979, -2.01582, 1, 1, 1, 1, 1,
-0.7455296, -0.6520223, -0.6391113, 1, 1, 1, 1, 1,
-0.738743, -0.4195057, -0.8197035, 1, 1, 1, 1, 1,
-0.7346916, -0.4041648, -3.831862, 1, 1, 1, 1, 1,
-0.7307981, 0.5042073, 0.5053658, 1, 1, 1, 1, 1,
-0.7280117, -2.583147, -3.348592, 1, 1, 1, 1, 1,
-0.727348, 0.5201026, -2.261431, 1, 1, 1, 1, 1,
-0.7271674, 2.394523, -1.825982, 1, 1, 1, 1, 1,
-0.7226026, 0.8668929, 0.1457142, 1, 1, 1, 1, 1,
-0.7220705, -0.559736, -2.974245, 1, 1, 1, 1, 1,
-0.7145134, 1.680284, 0.4773064, 0, 0, 1, 1, 1,
-0.7113121, -3.776321, -2.147894, 1, 0, 0, 1, 1,
-0.7075083, 0.8663119, -2.071319, 1, 0, 0, 1, 1,
-0.7037277, 1.887167, -0.1597619, 1, 0, 0, 1, 1,
-0.6979278, -1.11943, -1.016479, 1, 0, 0, 1, 1,
-0.691671, 0.6578655, 0.9340661, 1, 0, 0, 1, 1,
-0.6843857, 0.888132, -0.6469682, 0, 0, 0, 1, 1,
-0.6806874, 0.3264684, -2.829043, 0, 0, 0, 1, 1,
-0.6772344, -0.208809, -2.215851, 0, 0, 0, 1, 1,
-0.6749796, -0.3142432, -3.681208, 0, 0, 0, 1, 1,
-0.6715196, 2.448361, -1.411416, 0, 0, 0, 1, 1,
-0.6704043, -0.6189422, -2.194557, 0, 0, 0, 1, 1,
-0.6674544, -1.299068, -5.042328, 0, 0, 0, 1, 1,
-0.6648358, 0.920359, 0.4802263, 1, 1, 1, 1, 1,
-0.6648312, -1.018316, -2.501628, 1, 1, 1, 1, 1,
-0.6643943, 0.8667414, 0.4992053, 1, 1, 1, 1, 1,
-0.6608675, -0.02112707, -1.036313, 1, 1, 1, 1, 1,
-0.657185, 0.1622241, -2.270103, 1, 1, 1, 1, 1,
-0.6567232, -0.3544504, -2.612598, 1, 1, 1, 1, 1,
-0.6564543, -0.4474139, -2.286346, 1, 1, 1, 1, 1,
-0.6527351, -0.8348378, -3.451418, 1, 1, 1, 1, 1,
-0.6497064, -0.5661939, -1.435907, 1, 1, 1, 1, 1,
-0.6443826, 1.420487, -0.2488487, 1, 1, 1, 1, 1,
-0.6424367, -0.01783383, -1.541626, 1, 1, 1, 1, 1,
-0.6396572, -0.7391665, -2.067983, 1, 1, 1, 1, 1,
-0.6385438, -2.297904, -2.25082, 1, 1, 1, 1, 1,
-0.6363215, -0.2979484, 0.08277883, 1, 1, 1, 1, 1,
-0.6350418, -0.4492224, -0.5849386, 1, 1, 1, 1, 1,
-0.6350078, 0.1118025, -4.0724, 0, 0, 1, 1, 1,
-0.6345662, 0.3372483, -2.561965, 1, 0, 0, 1, 1,
-0.6329069, 0.09766828, -1.331204, 1, 0, 0, 1, 1,
-0.6276441, -0.4442754, -2.161676, 1, 0, 0, 1, 1,
-0.6273314, 0.7354709, -0.9511944, 1, 0, 0, 1, 1,
-0.6250507, -0.3633548, -0.4992355, 1, 0, 0, 1, 1,
-0.6228659, 0.4605255, 0.7446105, 0, 0, 0, 1, 1,
-0.6159002, 0.2037816, -0.4817475, 0, 0, 0, 1, 1,
-0.6155603, 0.3083116, -1.974999, 0, 0, 0, 1, 1,
-0.614148, -0.05712604, -2.075081, 0, 0, 0, 1, 1,
-0.611332, 1.109172, -2.080453, 0, 0, 0, 1, 1,
-0.6100102, -1.572562, -2.748967, 0, 0, 0, 1, 1,
-0.6068071, -0.7883588, -1.599532, 0, 0, 0, 1, 1,
-0.6066756, -0.7071198, -3.966317, 1, 1, 1, 1, 1,
-0.6063275, 1.335914, 0.06211105, 1, 1, 1, 1, 1,
-0.6060085, -0.3111083, -1.693115, 1, 1, 1, 1, 1,
-0.6052691, 0.8661509, -1.143462, 1, 1, 1, 1, 1,
-0.6034695, -1.030224, -4.437331, 1, 1, 1, 1, 1,
-0.6026992, -0.3682578, -3.319476, 1, 1, 1, 1, 1,
-0.6024722, 0.8880647, -1.929559, 1, 1, 1, 1, 1,
-0.5868023, -0.3839597, -2.12858, 1, 1, 1, 1, 1,
-0.5801716, -0.1403028, -1.90258, 1, 1, 1, 1, 1,
-0.5771231, 0.9314091, -0.3491326, 1, 1, 1, 1, 1,
-0.5743144, -1.065047, -4.046187, 1, 1, 1, 1, 1,
-0.5738094, -0.07479449, -2.38813, 1, 1, 1, 1, 1,
-0.5735139, 0.9378279, -1.136441, 1, 1, 1, 1, 1,
-0.5676323, -0.2176217, -0.9302717, 1, 1, 1, 1, 1,
-0.5657454, 0.091092, -2.110469, 1, 1, 1, 1, 1,
-0.5645889, -0.9162022, -1.009726, 0, 0, 1, 1, 1,
-0.5548063, -0.7728765, -2.712552, 1, 0, 0, 1, 1,
-0.5528696, 0.1333127, -2.208276, 1, 0, 0, 1, 1,
-0.5516232, -0.03336944, 0.1324008, 1, 0, 0, 1, 1,
-0.547435, 0.8082442, -0.3254699, 1, 0, 0, 1, 1,
-0.5448142, 0.25677, -1.492348, 1, 0, 0, 1, 1,
-0.5445816, 0.8678594, 0.678771, 0, 0, 0, 1, 1,
-0.5436344, 0.8953773, 0.3425163, 0, 0, 0, 1, 1,
-0.5381493, 1.122738, -0.9901207, 0, 0, 0, 1, 1,
-0.5359379, 1.883408, 0.1524561, 0, 0, 0, 1, 1,
-0.5351613, -0.3008904, -2.682244, 0, 0, 0, 1, 1,
-0.531175, 0.2818656, -2.749888, 0, 0, 0, 1, 1,
-0.526105, 0.975529, -1.572538, 0, 0, 0, 1, 1,
-0.5240712, 0.001281422, -2.778236, 1, 1, 1, 1, 1,
-0.5222697, -0.2427505, -2.314015, 1, 1, 1, 1, 1,
-0.5211126, -0.6853516, -1.988265, 1, 1, 1, 1, 1,
-0.5170274, -0.2006289, -1.718671, 1, 1, 1, 1, 1,
-0.5118359, -2.128067, -3.115946, 1, 1, 1, 1, 1,
-0.5113493, 1.003272, 0.2524845, 1, 1, 1, 1, 1,
-0.5104181, -1.754818, -2.663796, 1, 1, 1, 1, 1,
-0.5093384, -0.2522183, -2.777203, 1, 1, 1, 1, 1,
-0.5076047, 0.9573213, -1.586945, 1, 1, 1, 1, 1,
-0.5072836, 0.08409374, 1.280671, 1, 1, 1, 1, 1,
-0.5070357, 0.350422, -0.004200011, 1, 1, 1, 1, 1,
-0.5059028, -0.1855445, -1.373361, 1, 1, 1, 1, 1,
-0.498601, 0.7138054, 0.3847309, 1, 1, 1, 1, 1,
-0.4960472, -0.07350743, -2.082141, 1, 1, 1, 1, 1,
-0.4942555, 2.163424, 1.005221, 1, 1, 1, 1, 1,
-0.492087, -0.6533223, -2.050026, 0, 0, 1, 1, 1,
-0.4902081, 1.185674, -0.7783515, 1, 0, 0, 1, 1,
-0.4898381, -0.3223082, -0.9905657, 1, 0, 0, 1, 1,
-0.4897429, 1.093436, -0.4135201, 1, 0, 0, 1, 1,
-0.4835486, 0.08820988, -2.230037, 1, 0, 0, 1, 1,
-0.4809982, -0.5738875, -0.3504784, 1, 0, 0, 1, 1,
-0.4808719, 1.955003, -1.533928, 0, 0, 0, 1, 1,
-0.480521, 0.9249954, -0.08318796, 0, 0, 0, 1, 1,
-0.4746067, 0.4199393, 0.5006099, 0, 0, 0, 1, 1,
-0.472916, 0.6194853, 0.2709828, 0, 0, 0, 1, 1,
-0.4702752, -1.416056, -2.292513, 0, 0, 0, 1, 1,
-0.4669018, -0.4610841, -3.593791, 0, 0, 0, 1, 1,
-0.4608592, 1.32162, -0.1022121, 0, 0, 0, 1, 1,
-0.4606058, 0.879252, 0.4868962, 1, 1, 1, 1, 1,
-0.455191, -1.010811, -2.972373, 1, 1, 1, 1, 1,
-0.4469055, 1.972947, 1.092918, 1, 1, 1, 1, 1,
-0.4461056, -1.461942, -5.681105, 1, 1, 1, 1, 1,
-0.4456865, 0.6257436, -2.465459, 1, 1, 1, 1, 1,
-0.4455428, 0.03129537, -2.150881, 1, 1, 1, 1, 1,
-0.4422261, -0.6330702, -1.69328, 1, 1, 1, 1, 1,
-0.4397011, -2.869633, -2.863811, 1, 1, 1, 1, 1,
-0.4367836, 0.9496706, -0.04355352, 1, 1, 1, 1, 1,
-0.4346718, 0.2414836, -1.431953, 1, 1, 1, 1, 1,
-0.4326411, -0.23623, -0.5838208, 1, 1, 1, 1, 1,
-0.4271374, 1.389074, 1.826095, 1, 1, 1, 1, 1,
-0.4232882, -1.212127, -2.396858, 1, 1, 1, 1, 1,
-0.4144313, -1.189025, -2.259314, 1, 1, 1, 1, 1,
-0.4142635, 0.3394678, 0.1677257, 1, 1, 1, 1, 1,
-0.413486, -2.029777, -2.846578, 0, 0, 1, 1, 1,
-0.4119895, 2.011923, -0.1465277, 1, 0, 0, 1, 1,
-0.4114373, 0.6207907, -0.3009545, 1, 0, 0, 1, 1,
-0.4065989, 0.06807347, 0.5687336, 1, 0, 0, 1, 1,
-0.4048468, -0.9700075, -1.656426, 1, 0, 0, 1, 1,
-0.3973834, 1.452283, -0.8538611, 1, 0, 0, 1, 1,
-0.3923697, -0.7989566, -1.676156, 0, 0, 0, 1, 1,
-0.3900381, -0.1671886, -2.440746, 0, 0, 0, 1, 1,
-0.387737, 2.023617, -2.069301, 0, 0, 0, 1, 1,
-0.3861873, -0.08754255, -2.762532, 0, 0, 0, 1, 1,
-0.3833846, -1.302127, -2.73809, 0, 0, 0, 1, 1,
-0.3796242, 0.2793173, -1.208695, 0, 0, 0, 1, 1,
-0.3775138, -0.4527651, -3.138152, 0, 0, 0, 1, 1,
-0.3764728, 0.4073153, -0.6960108, 1, 1, 1, 1, 1,
-0.3734683, -0.1541821, -1.742759, 1, 1, 1, 1, 1,
-0.3705903, -1.102507, -1.897516, 1, 1, 1, 1, 1,
-0.3705091, 0.4314981, 0.7607875, 1, 1, 1, 1, 1,
-0.3672038, 1.018406, -1.254443, 1, 1, 1, 1, 1,
-0.3656569, 0.02903427, -1.754363, 1, 1, 1, 1, 1,
-0.3643034, 2.382876, -1.075724, 1, 1, 1, 1, 1,
-0.3478228, 0.8793023, 0.1052732, 1, 1, 1, 1, 1,
-0.3460053, 0.07155872, -1.980221, 1, 1, 1, 1, 1,
-0.3452924, -0.4351785, -2.832817, 1, 1, 1, 1, 1,
-0.3444509, -0.01466516, -1.683534, 1, 1, 1, 1, 1,
-0.3394339, -1.031042, -2.747023, 1, 1, 1, 1, 1,
-0.339253, -0.2935452, -2.852154, 1, 1, 1, 1, 1,
-0.3338391, -1.338141, -2.693909, 1, 1, 1, 1, 1,
-0.3276621, 0.4310764, -1.496514, 1, 1, 1, 1, 1,
-0.3276276, 0.4037733, -0.6179727, 0, 0, 1, 1, 1,
-0.327548, -1.12586, -1.81815, 1, 0, 0, 1, 1,
-0.3265048, 0.9842906, -0.6638296, 1, 0, 0, 1, 1,
-0.3251407, -0.2057298, -2.067653, 1, 0, 0, 1, 1,
-0.3226088, -0.1524928, -1.475048, 1, 0, 0, 1, 1,
-0.32175, -1.261806, -2.210785, 1, 0, 0, 1, 1,
-0.3181374, -1.507515, -1.69137, 0, 0, 0, 1, 1,
-0.3138711, -0.3812122, -1.486282, 0, 0, 0, 1, 1,
-0.311504, -0.2559594, -2.945504, 0, 0, 0, 1, 1,
-0.3066198, 0.01569089, -1.344059, 0, 0, 0, 1, 1,
-0.3059101, 1.838892, 0.0586527, 0, 0, 0, 1, 1,
-0.3035386, 0.4253133, -1.270354, 0, 0, 0, 1, 1,
-0.3033158, -0.3768615, -2.220163, 0, 0, 0, 1, 1,
-0.2970818, 1.234731, -1.299596, 1, 1, 1, 1, 1,
-0.2957221, -1.151946, -2.335827, 1, 1, 1, 1, 1,
-0.2915365, 0.3331841, -0.5111596, 1, 1, 1, 1, 1,
-0.2907633, -0.606456, -2.648682, 1, 1, 1, 1, 1,
-0.2904229, 0.1171657, -1.109366, 1, 1, 1, 1, 1,
-0.2889874, -2.444414, -4.060494, 1, 1, 1, 1, 1,
-0.2880917, -2.40724, -2.836871, 1, 1, 1, 1, 1,
-0.2860475, 0.3188781, 0.9427592, 1, 1, 1, 1, 1,
-0.2757255, -0.3118234, -4.495209, 1, 1, 1, 1, 1,
-0.271798, 1.678613, -1.082572, 1, 1, 1, 1, 1,
-0.2680785, -0.002345718, 0.9827679, 1, 1, 1, 1, 1,
-0.2673003, -0.189679, -2.277485, 1, 1, 1, 1, 1,
-0.2646824, -0.59411, -3.114787, 1, 1, 1, 1, 1,
-0.2646109, -0.5103454, -0.9118771, 1, 1, 1, 1, 1,
-0.2591605, 0.3694122, -0.7421657, 1, 1, 1, 1, 1,
-0.2552546, 0.9196262, 0.8433366, 0, 0, 1, 1, 1,
-0.2547774, 0.3925041, 1.131, 1, 0, 0, 1, 1,
-0.2501702, 0.2955399, -0.9210422, 1, 0, 0, 1, 1,
-0.2476692, 0.1135511, -1.519097, 1, 0, 0, 1, 1,
-0.2467131, 0.2288549, -0.5641862, 1, 0, 0, 1, 1,
-0.2456955, 0.8695098, 0.6800602, 1, 0, 0, 1, 1,
-0.2455819, -0.05269275, -3.447075, 0, 0, 0, 1, 1,
-0.2455145, -1.567896, -2.99444, 0, 0, 0, 1, 1,
-0.2454669, 0.6341614, -0.3458831, 0, 0, 0, 1, 1,
-0.2434862, -1.008247, -3.69344, 0, 0, 0, 1, 1,
-0.2429685, -1.879319, -1.528328, 0, 0, 0, 1, 1,
-0.242119, 0.7908245, 0.4391901, 0, 0, 0, 1, 1,
-0.2404408, 0.5162768, -0.7147366, 0, 0, 0, 1, 1,
-0.237534, -0.7947537, -1.163921, 1, 1, 1, 1, 1,
-0.2266804, 0.815398, -0.5739178, 1, 1, 1, 1, 1,
-0.2243389, 1.03973, -1.720232, 1, 1, 1, 1, 1,
-0.2192614, -0.07472484, -3.785601, 1, 1, 1, 1, 1,
-0.2190126, 0.3852364, -1.854528, 1, 1, 1, 1, 1,
-0.2168003, -0.7548086, -2.625797, 1, 1, 1, 1, 1,
-0.208491, -0.1423641, -3.613002, 1, 1, 1, 1, 1,
-0.2022539, -1.213555, -2.84585, 1, 1, 1, 1, 1,
-0.2003416, 0.9988274, 0.6135056, 1, 1, 1, 1, 1,
-0.1985716, -0.007728516, -2.755907, 1, 1, 1, 1, 1,
-0.1981381, 1.833832, 0.8924161, 1, 1, 1, 1, 1,
-0.1973505, 0.3072775, 0.4290311, 1, 1, 1, 1, 1,
-0.1966386, 2.75774, -0.6158482, 1, 1, 1, 1, 1,
-0.1937141, 0.8080921, 1.651433, 1, 1, 1, 1, 1,
-0.1880017, 0.6464339, 0.1707236, 1, 1, 1, 1, 1,
-0.1749676, 0.0404089, -0.2523709, 0, 0, 1, 1, 1,
-0.173738, -2.104303, -2.750259, 1, 0, 0, 1, 1,
-0.1724927, 0.1251495, 0.1092086, 1, 0, 0, 1, 1,
-0.1716222, -0.3657291, -1.616885, 1, 0, 0, 1, 1,
-0.1686649, -1.289903, -2.536075, 1, 0, 0, 1, 1,
-0.1586004, 0.3269016, -0.8926671, 1, 0, 0, 1, 1,
-0.153714, -0.5477148, -2.617482, 0, 0, 0, 1, 1,
-0.1521685, -0.1649562, -1.740992, 0, 0, 0, 1, 1,
-0.1494221, -1.344811, -4.504652, 0, 0, 0, 1, 1,
-0.1489169, 1.573135, -0.419998, 0, 0, 0, 1, 1,
-0.1451294, -0.1223085, -3.834884, 0, 0, 0, 1, 1,
-0.143171, -2.279107, -3.212775, 0, 0, 0, 1, 1,
-0.140266, 1.166241, -0.01022469, 0, 0, 0, 1, 1,
-0.1351165, -0.08552819, -1.559155, 1, 1, 1, 1, 1,
-0.133502, 0.5066822, -0.2899717, 1, 1, 1, 1, 1,
-0.1329907, 0.9046415, 0.04739571, 1, 1, 1, 1, 1,
-0.1305047, 0.03055056, -0.8399451, 1, 1, 1, 1, 1,
-0.1280196, -0.316546, -2.586674, 1, 1, 1, 1, 1,
-0.1271371, -0.09900878, 0.1430775, 1, 1, 1, 1, 1,
-0.1250435, 0.3534839, 0.03750616, 1, 1, 1, 1, 1,
-0.1223465, 0.3288382, 1.70115, 1, 1, 1, 1, 1,
-0.1218132, -0.8165361, -4.232164, 1, 1, 1, 1, 1,
-0.1211298, 1.22324, 0.9054647, 1, 1, 1, 1, 1,
-0.1104006, -0.3987195, -1.265771, 1, 1, 1, 1, 1,
-0.1088158, 0.3244112, -0.03591516, 1, 1, 1, 1, 1,
-0.1083387, 1.474784, -0.3991503, 1, 1, 1, 1, 1,
-0.1049822, 0.1806592, -0.8764327, 1, 1, 1, 1, 1,
-0.09877489, 1.971485, -1.023755, 1, 1, 1, 1, 1,
-0.09729584, 1.515669, 1.631151, 0, 0, 1, 1, 1,
-0.09435721, 0.2674429, -0.9216163, 1, 0, 0, 1, 1,
-0.09205827, 1.072083, 0.2081825, 1, 0, 0, 1, 1,
-0.09169365, -0.1619335, -2.123093, 1, 0, 0, 1, 1,
-0.08821997, 0.2693318, -1.101196, 1, 0, 0, 1, 1,
-0.08766551, 2.388555, 1.05645, 1, 0, 0, 1, 1,
-0.0860939, 1.859589, -1.549551, 0, 0, 0, 1, 1,
-0.08459931, -0.6144776, -2.233085, 0, 0, 0, 1, 1,
-0.08032104, -1.56211, -3.184435, 0, 0, 0, 1, 1,
-0.07659173, -0.327603, -2.311726, 0, 0, 0, 1, 1,
-0.07418927, -0.1575169, -2.041635, 0, 0, 0, 1, 1,
-0.07105687, 0.6924374, -0.7815251, 0, 0, 0, 1, 1,
-0.0703469, 1.373569, 0.2467765, 0, 0, 0, 1, 1,
-0.06603903, -0.6492291, -2.548735, 1, 1, 1, 1, 1,
-0.0637124, 0.7468281, -2.04151, 1, 1, 1, 1, 1,
-0.06168345, 0.9327515, -1.039732, 1, 1, 1, 1, 1,
-0.06042438, -0.6387836, -4.145885, 1, 1, 1, 1, 1,
-0.05545663, 0.5919471, 0.6221317, 1, 1, 1, 1, 1,
-0.05347421, 0.1884768, -0.6207574, 1, 1, 1, 1, 1,
-0.04998066, 1.245249, 0.8088993, 1, 1, 1, 1, 1,
-0.04970504, 0.8377991, 1.173956, 1, 1, 1, 1, 1,
-0.04810786, 0.1999389, -0.9933942, 1, 1, 1, 1, 1,
-0.04638378, 0.09431768, -1.196069, 1, 1, 1, 1, 1,
-0.04542354, -1.019816, -2.601058, 1, 1, 1, 1, 1,
-0.04411673, -0.02979836, -3.155716, 1, 1, 1, 1, 1,
-0.04382145, -0.6958554, -2.57547, 1, 1, 1, 1, 1,
-0.04327447, 0.8995124, 1.935165, 1, 1, 1, 1, 1,
-0.04080394, -1.701167, -2.456975, 1, 1, 1, 1, 1,
-0.04041782, 1.001892, -0.8717423, 0, 0, 1, 1, 1,
-0.0373622, 0.5494159, 1.07249, 1, 0, 0, 1, 1,
-0.03643692, -0.6798198, -3.679885, 1, 0, 0, 1, 1,
-0.03260351, -0.03012778, -1.612651, 1, 0, 0, 1, 1,
-0.0322439, 0.9212133, 1.631617, 1, 0, 0, 1, 1,
-0.03009376, 0.5794125, -0.3174849, 1, 0, 0, 1, 1,
-0.02712374, -0.8164116, -2.880454, 0, 0, 0, 1, 1,
-0.02497148, 0.9925185, -0.4050729, 0, 0, 0, 1, 1,
-0.02347832, 0.1690124, -0.7711782, 0, 0, 0, 1, 1,
-0.02155941, 0.08893658, -0.7993457, 0, 0, 0, 1, 1,
-0.01904492, 0.3851834, -0.6845405, 0, 0, 0, 1, 1,
-0.01835457, -0.8638686, -2.816095, 0, 0, 0, 1, 1,
-0.01715881, -0.3986069, -2.71368, 0, 0, 0, 1, 1,
-0.0163468, 0.5412312, -0.9047161, 1, 1, 1, 1, 1,
-0.0155199, 0.4876937, 0.5112076, 1, 1, 1, 1, 1,
-0.01191968, -0.5708002, -1.128042, 1, 1, 1, 1, 1,
-0.008428714, 0.3942605, 0.8728435, 1, 1, 1, 1, 1,
-0.003650868, 0.9932717, 1.65572, 1, 1, 1, 1, 1,
-0.002692412, -1.383697, -2.492647, 1, 1, 1, 1, 1,
0.001680982, 0.04112471, 0.5562373, 1, 1, 1, 1, 1,
0.01823546, 0.7066954, -0.2008346, 1, 1, 1, 1, 1,
0.01863474, 0.1103388, -1.000177, 1, 1, 1, 1, 1,
0.01901899, -0.07633185, 1.530865, 1, 1, 1, 1, 1,
0.02379969, -0.1850322, 3.204641, 1, 1, 1, 1, 1,
0.02385255, -0.5193951, 3.123495, 1, 1, 1, 1, 1,
0.0241184, 0.01297588, 3.247847, 1, 1, 1, 1, 1,
0.02598687, -2.459957, 1.668506, 1, 1, 1, 1, 1,
0.03451074, -0.4803069, 2.341566, 1, 1, 1, 1, 1,
0.03772541, -0.853572, 3.686409, 0, 0, 1, 1, 1,
0.03820487, 0.029384, 3.41121, 1, 0, 0, 1, 1,
0.04568231, 0.1335664, 1.383219, 1, 0, 0, 1, 1,
0.05213179, -0.5941017, 4.369887, 1, 0, 0, 1, 1,
0.05855758, -0.7599952, 4.493348, 1, 0, 0, 1, 1,
0.05860712, -2.204503, 3.769997, 1, 0, 0, 1, 1,
0.06072659, -1.344561, 3.48998, 0, 0, 0, 1, 1,
0.0657571, -2.490412, 2.690526, 0, 0, 0, 1, 1,
0.06829657, 0.8246035, 0.511077, 0, 0, 0, 1, 1,
0.06976156, 0.06841509, 1.648322, 0, 0, 0, 1, 1,
0.07065426, 0.1319496, 1.08144, 0, 0, 0, 1, 1,
0.0724455, 0.764707, 2.624235, 0, 0, 0, 1, 1,
0.07459291, 0.06172303, 0.2906889, 0, 0, 0, 1, 1,
0.07564151, -1.081705, 3.018326, 1, 1, 1, 1, 1,
0.08228783, -0.4228145, 3.046169, 1, 1, 1, 1, 1,
0.08241811, 0.7463124, -0.2127127, 1, 1, 1, 1, 1,
0.08399587, 0.2547483, -0.1419078, 1, 1, 1, 1, 1,
0.08505891, 0.4133793, 0.1833814, 1, 1, 1, 1, 1,
0.09251846, 0.9150191, 2.112126, 1, 1, 1, 1, 1,
0.0926092, -0.1107908, 3.460233, 1, 1, 1, 1, 1,
0.09435667, 0.05784092, 1.149019, 1, 1, 1, 1, 1,
0.09506274, 2.108416, -0.4522048, 1, 1, 1, 1, 1,
0.09531235, 0.5550348, 0.885339, 1, 1, 1, 1, 1,
0.09895584, 1.852756, -0.695519, 1, 1, 1, 1, 1,
0.09910601, -0.08053853, 1.362224, 1, 1, 1, 1, 1,
0.09944783, -0.9923849, 0.4387474, 1, 1, 1, 1, 1,
0.1015357, 2.515278, -1.462357, 1, 1, 1, 1, 1,
0.1044928, -0.3652265, 2.490422, 1, 1, 1, 1, 1,
0.1062624, -0.3894232, 4.35858, 0, 0, 1, 1, 1,
0.1116999, 0.9958333, 0.3395448, 1, 0, 0, 1, 1,
0.1166614, 0.8548616, -0.2107866, 1, 0, 0, 1, 1,
0.1167147, -0.02840165, 2.664065, 1, 0, 0, 1, 1,
0.1180914, 0.8708604, -0.2376782, 1, 0, 0, 1, 1,
0.1219608, 0.01316548, 1.163329, 1, 0, 0, 1, 1,
0.129145, -1.493721, 2.172031, 0, 0, 0, 1, 1,
0.1333122, 0.9913315, -0.6392417, 0, 0, 0, 1, 1,
0.1380229, 0.4907233, -0.709784, 0, 0, 0, 1, 1,
0.1391812, 1.65507, 0.6086817, 0, 0, 0, 1, 1,
0.1395294, -0.3132829, 4.429256, 0, 0, 0, 1, 1,
0.1396897, -0.1274378, 1.802564, 0, 0, 0, 1, 1,
0.140759, 2.133747, -0.4226492, 0, 0, 0, 1, 1,
0.1417347, -0.2987751, 1.277639, 1, 1, 1, 1, 1,
0.1428449, 0.3101414, 2.224109, 1, 1, 1, 1, 1,
0.1431835, -1.460457, 3.264634, 1, 1, 1, 1, 1,
0.1446511, -0.7931721, 3.007768, 1, 1, 1, 1, 1,
0.1472571, -0.04419858, 0.9510089, 1, 1, 1, 1, 1,
0.1493252, 2.528546, 1.151059, 1, 1, 1, 1, 1,
0.1525878, 1.40351, 0.9496994, 1, 1, 1, 1, 1,
0.1539472, -1.407171, 2.376701, 1, 1, 1, 1, 1,
0.154359, 0.3977069, 2.035288, 1, 1, 1, 1, 1,
0.1574741, 0.7879093, 0.2580078, 1, 1, 1, 1, 1,
0.1579828, -0.5769456, 2.615111, 1, 1, 1, 1, 1,
0.1619445, 1.365758, 1.903931, 1, 1, 1, 1, 1,
0.1675916, -0.5494932, 1.885063, 1, 1, 1, 1, 1,
0.1679734, 0.356412, 0.243735, 1, 1, 1, 1, 1,
0.1683474, 1.926691, -1.935934, 1, 1, 1, 1, 1,
0.1684442, 0.5651499, -1.986911, 0, 0, 1, 1, 1,
0.1718533, 0.5360247, 1.53569, 1, 0, 0, 1, 1,
0.1744261, -1.241647, 4.093858, 1, 0, 0, 1, 1,
0.1748183, 0.6533552, 0.6561732, 1, 0, 0, 1, 1,
0.1760692, -0.2410655, 1.806787, 1, 0, 0, 1, 1,
0.1781558, 0.4334255, 0.614884, 1, 0, 0, 1, 1,
0.1804769, -0.53929, 5.087525, 0, 0, 0, 1, 1,
0.1806068, 1.279794, 0.9783158, 0, 0, 0, 1, 1,
0.1820188, 1.505612, 0.7307069, 0, 0, 0, 1, 1,
0.185587, -0.03982374, 2.784096, 0, 0, 0, 1, 1,
0.1857098, 0.4725906, 0.03341883, 0, 0, 0, 1, 1,
0.1879565, -1.042603, 3.702325, 0, 0, 0, 1, 1,
0.189691, 0.09164289, -0.5732958, 0, 0, 0, 1, 1,
0.1897642, -0.4448722, 3.617727, 1, 1, 1, 1, 1,
0.1917231, 0.6268912, 0.9405151, 1, 1, 1, 1, 1,
0.191847, -0.9407911, 0.8362986, 1, 1, 1, 1, 1,
0.1976863, 0.8843884, 1.271548, 1, 1, 1, 1, 1,
0.2042924, 0.1931986, 1.942754, 1, 1, 1, 1, 1,
0.2089044, 1.689683, 0.723632, 1, 1, 1, 1, 1,
0.2095417, -0.1713952, 4.282077, 1, 1, 1, 1, 1,
0.2102145, -0.2329857, 5.202744, 1, 1, 1, 1, 1,
0.2107734, -0.5894938, 1.871926, 1, 1, 1, 1, 1,
0.2206714, -0.438605, 2.822912, 1, 1, 1, 1, 1,
0.221185, -0.2386887, 2.714153, 1, 1, 1, 1, 1,
0.2276103, -0.6149231, 3.036944, 1, 1, 1, 1, 1,
0.2300306, 0.7094258, -0.1226341, 1, 1, 1, 1, 1,
0.2332674, 0.01871769, 1.550105, 1, 1, 1, 1, 1,
0.2339043, -1.543796, 3.704477, 1, 1, 1, 1, 1,
0.2343844, -1.102335, 1.865992, 0, 0, 1, 1, 1,
0.2348441, -0.9269174, 2.206185, 1, 0, 0, 1, 1,
0.2359784, -0.3260314, 0.4148426, 1, 0, 0, 1, 1,
0.2378695, 0.3469215, 2.369804, 1, 0, 0, 1, 1,
0.2438675, -0.0835927, 2.330684, 1, 0, 0, 1, 1,
0.2449546, -0.6088612, 3.32736, 1, 0, 0, 1, 1,
0.2488161, 1.286266, -1.20276, 0, 0, 0, 1, 1,
0.2536007, -1.179204, 3.674273, 0, 0, 0, 1, 1,
0.2567604, 0.5452396, 0.557647, 0, 0, 0, 1, 1,
0.2579992, 0.5733301, 1.159486, 0, 0, 0, 1, 1,
0.26036, 0.4778661, -0.6331687, 0, 0, 0, 1, 1,
0.2620526, 0.2497318, 2.296499, 0, 0, 0, 1, 1,
0.2658487, 2.076957, 0.8450567, 0, 0, 0, 1, 1,
0.2702624, 0.9975861, -0.4249875, 1, 1, 1, 1, 1,
0.2719378, 0.5247395, 1.387778, 1, 1, 1, 1, 1,
0.2752044, 0.1563858, 1.722267, 1, 1, 1, 1, 1,
0.2758487, 2.054008, 1.058165, 1, 1, 1, 1, 1,
0.2812255, 0.7607816, 0.2379702, 1, 1, 1, 1, 1,
0.2816654, -0.6523017, 2.100966, 1, 1, 1, 1, 1,
0.2839757, 0.6671377, -0.2888865, 1, 1, 1, 1, 1,
0.2857089, -2.139413, 2.88604, 1, 1, 1, 1, 1,
0.3115976, 0.0002675757, 3.205903, 1, 1, 1, 1, 1,
0.3142783, -1.056693, 4.198439, 1, 1, 1, 1, 1,
0.3143654, -0.1685686, 3.106056, 1, 1, 1, 1, 1,
0.3145298, -1.257072, 2.010288, 1, 1, 1, 1, 1,
0.3161983, 0.08237323, 2.169474, 1, 1, 1, 1, 1,
0.3183751, -0.5029202, 4.297627, 1, 1, 1, 1, 1,
0.3211842, 1.703054, 0.1417777, 1, 1, 1, 1, 1,
0.32572, 1.301381, -0.2526182, 0, 0, 1, 1, 1,
0.3324669, 0.09154998, 0.05776709, 1, 0, 0, 1, 1,
0.3378503, -0.1590065, 2.056865, 1, 0, 0, 1, 1,
0.3424219, -0.1475161, 1.857098, 1, 0, 0, 1, 1,
0.3479412, -0.2564464, 2.749283, 1, 0, 0, 1, 1,
0.3495983, -1.081533, 1.080631, 1, 0, 0, 1, 1,
0.3524501, 1.786648, 0.3318103, 0, 0, 0, 1, 1,
0.3533626, -1.107648, 3.975274, 0, 0, 0, 1, 1,
0.3543487, 0.7966992, 0.7235847, 0, 0, 0, 1, 1,
0.3547011, 0.4213783, 1.151812, 0, 0, 0, 1, 1,
0.3566909, -0.4201676, 1.66406, 0, 0, 0, 1, 1,
0.3574725, -0.1494467, 2.196001, 0, 0, 0, 1, 1,
0.3623695, 2.027543, -1.592517, 0, 0, 0, 1, 1,
0.371991, -0.01615508, 2.857943, 1, 1, 1, 1, 1,
0.3752056, 0.3288913, 1.864052, 1, 1, 1, 1, 1,
0.3760563, -0.2398749, 1.478387, 1, 1, 1, 1, 1,
0.3776223, 0.7971391, -0.154669, 1, 1, 1, 1, 1,
0.3793342, -1.037337, 2.736351, 1, 1, 1, 1, 1,
0.3853059, 1.511118, 2.119964, 1, 1, 1, 1, 1,
0.3872395, -0.2787437, 4.376933, 1, 1, 1, 1, 1,
0.391716, 0.6329419, 2.367726, 1, 1, 1, 1, 1,
0.3937789, -0.6894107, 1.829711, 1, 1, 1, 1, 1,
0.3981685, -0.4896412, 1.970219, 1, 1, 1, 1, 1,
0.40771, 0.9946116, -0.2054643, 1, 1, 1, 1, 1,
0.41276, 0.4740736, 0.5475205, 1, 1, 1, 1, 1,
0.413523, -0.5137106, 2.479498, 1, 1, 1, 1, 1,
0.4202799, -0.284478, 2.657017, 1, 1, 1, 1, 1,
0.421728, 1.043837, -0.3903145, 1, 1, 1, 1, 1,
0.4219157, -1.347278, 2.40664, 0, 0, 1, 1, 1,
0.4260688, -0.4787739, 3.768538, 1, 0, 0, 1, 1,
0.4299353, -1.398516, 1.727475, 1, 0, 0, 1, 1,
0.435489, -0.06796408, 1.255879, 1, 0, 0, 1, 1,
0.4365119, -0.05067141, 0.2964101, 1, 0, 0, 1, 1,
0.4369888, 0.06791302, 1.124456, 1, 0, 0, 1, 1,
0.4381314, -1.998868, 3.55897, 0, 0, 0, 1, 1,
0.4388834, 1.229732, 1.754036, 0, 0, 0, 1, 1,
0.4480706, 0.7270885, 0.484921, 0, 0, 0, 1, 1,
0.4486633, -0.432005, 2.336346, 0, 0, 0, 1, 1,
0.456886, 1.007011, 0.3586971, 0, 0, 0, 1, 1,
0.4586273, -1.156526, 1.624822, 0, 0, 0, 1, 1,
0.4604354, 0.743941, -1.344649, 0, 0, 0, 1, 1,
0.4641187, -0.6591995, 0.6341133, 1, 1, 1, 1, 1,
0.4739938, 0.7413559, 2.007527, 1, 1, 1, 1, 1,
0.4749549, 0.3624204, -1.26848, 1, 1, 1, 1, 1,
0.4755509, -3.945903, 1.816761, 1, 1, 1, 1, 1,
0.4792271, -0.2682635, 2.433012, 1, 1, 1, 1, 1,
0.4861173, -0.06057036, -0.5057905, 1, 1, 1, 1, 1,
0.4887169, -0.0723685, 1.369294, 1, 1, 1, 1, 1,
0.4891424, -0.1806677, 1.383972, 1, 1, 1, 1, 1,
0.4951996, 0.79822, -0.3913067, 1, 1, 1, 1, 1,
0.4984488, -0.2626498, 0.6027401, 1, 1, 1, 1, 1,
0.4989358, 1.351586, 1.676161, 1, 1, 1, 1, 1,
0.4990751, -0.9806945, 4.192148, 1, 1, 1, 1, 1,
0.5010309, -0.6163629, 2.731325, 1, 1, 1, 1, 1,
0.5030769, 0.01839456, 1.139993, 1, 1, 1, 1, 1,
0.5109928, 0.04407809, 0.3099194, 1, 1, 1, 1, 1,
0.5130944, -1.698016, 3.491864, 0, 0, 1, 1, 1,
0.5225518, 0.8591439, -1.097375, 1, 0, 0, 1, 1,
0.5229198, 0.5248798, 0.2078076, 1, 0, 0, 1, 1,
0.5264556, -1.007742, 2.595268, 1, 0, 0, 1, 1,
0.5292833, -0.3772211, 4.541423, 1, 0, 0, 1, 1,
0.53259, -0.4551543, 3.00889, 1, 0, 0, 1, 1,
0.5376735, 0.3940895, 0.8547372, 0, 0, 0, 1, 1,
0.5400448, 0.7919782, -0.7443131, 0, 0, 0, 1, 1,
0.5428813, 0.02517876, 2.313868, 0, 0, 0, 1, 1,
0.5430684, 1.445983, 1.301502, 0, 0, 0, 1, 1,
0.5508353, -1.483084, 3.600863, 0, 0, 0, 1, 1,
0.5590296, -0.6278944, 2.1587, 0, 0, 0, 1, 1,
0.5685, 0.956048, -0.705291, 0, 0, 0, 1, 1,
0.5758427, 0.6930743, 1.691983, 1, 1, 1, 1, 1,
0.5793825, 1.74153, -0.4191701, 1, 1, 1, 1, 1,
0.5795016, 0.5690456, 0.2009696, 1, 1, 1, 1, 1,
0.5829731, 0.07206731, 1.792484, 1, 1, 1, 1, 1,
0.5849783, 1.142766, -0.1259244, 1, 1, 1, 1, 1,
0.5896451, -0.2932799, 2.086163, 1, 1, 1, 1, 1,
0.5983107, 0.3206613, 0.09918738, 1, 1, 1, 1, 1,
0.5992274, -0.8438888, 2.619284, 1, 1, 1, 1, 1,
0.6019998, 0.3006372, 0.6940567, 1, 1, 1, 1, 1,
0.6082991, -2.098906, 2.408202, 1, 1, 1, 1, 1,
0.6087995, -0.2492315, 1.49189, 1, 1, 1, 1, 1,
0.6101551, 0.3660648, 0.4166005, 1, 1, 1, 1, 1,
0.6146986, 0.5001318, 1.146304, 1, 1, 1, 1, 1,
0.6175412, 0.8780799, -0.9454122, 1, 1, 1, 1, 1,
0.6190364, 1.841569, 1.838323, 1, 1, 1, 1, 1,
0.6196314, -0.992705, 0.4204699, 0, 0, 1, 1, 1,
0.6209125, -0.7956123, 3.758522, 1, 0, 0, 1, 1,
0.6238161, -1.356395, 2.523541, 1, 0, 0, 1, 1,
0.6246364, -0.9652355, 3.284636, 1, 0, 0, 1, 1,
0.6256995, -0.1324636, 1.871837, 1, 0, 0, 1, 1,
0.626269, 0.236545, 0.6021789, 1, 0, 0, 1, 1,
0.6369887, 0.7744817, 0.7799615, 0, 0, 0, 1, 1,
0.6443245, -1.12275, 3.351505, 0, 0, 0, 1, 1,
0.6505553, 0.1364958, 0.6545074, 0, 0, 0, 1, 1,
0.6600432, 1.003228, 1.376481, 0, 0, 0, 1, 1,
0.6623006, 1.64301, 0.7076666, 0, 0, 0, 1, 1,
0.6684052, 0.8504382, 0.646911, 0, 0, 0, 1, 1,
0.6703172, 0.6192086, 0.9695777, 0, 0, 0, 1, 1,
0.6722588, 1.146253, 0.2767732, 1, 1, 1, 1, 1,
0.6740075, -0.07550696, 1.656714, 1, 1, 1, 1, 1,
0.678187, -1.716416, 2.270403, 1, 1, 1, 1, 1,
0.681743, 1.305026, -0.1153822, 1, 1, 1, 1, 1,
0.6888329, 0.9881768, 0.4385172, 1, 1, 1, 1, 1,
0.6921992, 0.01144497, 0.2507418, 1, 1, 1, 1, 1,
0.6927921, 0.7984891, 2.174552, 1, 1, 1, 1, 1,
0.6932982, -0.6975911, 3.489289, 1, 1, 1, 1, 1,
0.7048801, -0.6688381, 1.081929, 1, 1, 1, 1, 1,
0.706076, 0.6047339, 0.238468, 1, 1, 1, 1, 1,
0.7074214, 1.063442, -1.085893, 1, 1, 1, 1, 1,
0.7104016, 1.367261, -0.1603586, 1, 1, 1, 1, 1,
0.7127597, -0.3387392, 1.166562, 1, 1, 1, 1, 1,
0.7197635, 1.053751, 1.005592, 1, 1, 1, 1, 1,
0.7215775, -0.2766814, 2.974267, 1, 1, 1, 1, 1,
0.724694, -0.7465256, 3.00636, 0, 0, 1, 1, 1,
0.727991, 0.9923599, -0.795014, 1, 0, 0, 1, 1,
0.7311039, -0.4782111, 3.001752, 1, 0, 0, 1, 1,
0.7337202, -0.9787863, 0.2774399, 1, 0, 0, 1, 1,
0.7337874, -0.2115724, 2.24128, 1, 0, 0, 1, 1,
0.7391344, -3.471116, 2.926245, 1, 0, 0, 1, 1,
0.7433494, -1.177527, 0.5737007, 0, 0, 0, 1, 1,
0.7463776, 0.6044028, 0.261411, 0, 0, 0, 1, 1,
0.7535668, -0.8422629, 0.8380287, 0, 0, 0, 1, 1,
0.7543722, 0.25181, -1.164686, 0, 0, 0, 1, 1,
0.7558493, -1.097621, 2.789436, 0, 0, 0, 1, 1,
0.7564762, 0.184747, 2.15806, 0, 0, 0, 1, 1,
0.7565255, -0.04189917, 3.094734, 0, 0, 0, 1, 1,
0.7621909, 1.848432, 1.091491, 1, 1, 1, 1, 1,
0.7626017, -0.8190998, 3.186269, 1, 1, 1, 1, 1,
0.7630528, -0.2573573, 0.6712587, 1, 1, 1, 1, 1,
0.7635341, 1.396263, 0.7664618, 1, 1, 1, 1, 1,
0.7657966, 0.6179302, -0.06670013, 1, 1, 1, 1, 1,
0.7708572, -0.02708052, 1.370214, 1, 1, 1, 1, 1,
0.7714592, -0.1590076, 1.509722, 1, 1, 1, 1, 1,
0.7731109, -0.2762264, 2.605491, 1, 1, 1, 1, 1,
0.7741405, 0.9030775, 0.1436581, 1, 1, 1, 1, 1,
0.7789108, -1.064771, 4.016461, 1, 1, 1, 1, 1,
0.7841591, -0.4631968, 2.620123, 1, 1, 1, 1, 1,
0.7870957, -0.2860198, 2.815016, 1, 1, 1, 1, 1,
0.7877243, -1.331354, 2.384095, 1, 1, 1, 1, 1,
0.7923002, -0.1619947, 2.630306, 1, 1, 1, 1, 1,
0.794549, 1.140478, -0.2158612, 1, 1, 1, 1, 1,
0.7981939, -1.116601, 1.791227, 0, 0, 1, 1, 1,
0.8051394, 0.3639846, -0.2919225, 1, 0, 0, 1, 1,
0.8063154, 0.8661078, 1.108168, 1, 0, 0, 1, 1,
0.8118522, -0.5133597, 2.227402, 1, 0, 0, 1, 1,
0.8135284, -1.465758, 2.192745, 1, 0, 0, 1, 1,
0.8200995, -1.079906, 2.115335, 1, 0, 0, 1, 1,
0.820123, -2.568666, 3.1292, 0, 0, 0, 1, 1,
0.8201419, 0.2096776, 1.347729, 0, 0, 0, 1, 1,
0.825214, -1.21628, 1.304652, 0, 0, 0, 1, 1,
0.8286763, 0.6851937, 0.08137468, 0, 0, 0, 1, 1,
0.8370505, 1.87656, 1.041277, 0, 0, 0, 1, 1,
0.8395883, -0.5265812, 0.4920508, 0, 0, 0, 1, 1,
0.8499793, 2.497694, -1.206846, 0, 0, 0, 1, 1,
0.8562984, -0.2345401, 3.039732, 1, 1, 1, 1, 1,
0.8584781, -1.07766, 1.464376, 1, 1, 1, 1, 1,
0.8628227, -0.6792846, 4.182907, 1, 1, 1, 1, 1,
0.8654613, 1.981257, 0.5476603, 1, 1, 1, 1, 1,
0.8768842, -0.4695106, 2.474124, 1, 1, 1, 1, 1,
0.8780909, -0.0331552, 3.618728, 1, 1, 1, 1, 1,
0.8820394, 0.3145852, 0.2831156, 1, 1, 1, 1, 1,
0.882382, 0.6373406, 1.031755, 1, 1, 1, 1, 1,
0.8876566, -1.049787, 2.014397, 1, 1, 1, 1, 1,
0.8883721, -0.3082603, 1.788637, 1, 1, 1, 1, 1,
0.8909337, -0.9209061, 4.081256, 1, 1, 1, 1, 1,
0.8911715, -0.7258477, 1.325393, 1, 1, 1, 1, 1,
0.891315, -1.717602, 3.408634, 1, 1, 1, 1, 1,
0.8923458, -1.103634, 1.686297, 1, 1, 1, 1, 1,
0.9017937, -0.5109133, 2.950637, 1, 1, 1, 1, 1,
0.9052008, -0.797601, 0.3885923, 0, 0, 1, 1, 1,
0.909556, 0.2295081, 1.320406, 1, 0, 0, 1, 1,
0.910642, -1.030516, 2.315483, 1, 0, 0, 1, 1,
0.9134158, -0.2359602, 0.8588415, 1, 0, 0, 1, 1,
0.9173664, -0.8108304, 3.333113, 1, 0, 0, 1, 1,
0.9190369, -0.3693944, 2.059086, 1, 0, 0, 1, 1,
0.9228595, -0.6634793, 1.894637, 0, 0, 0, 1, 1,
0.9298352, -0.6438208, 1.982062, 0, 0, 0, 1, 1,
0.9327686, -0.3383433, 3.054188, 0, 0, 0, 1, 1,
0.9360309, -0.2075864, 3.083771, 0, 0, 0, 1, 1,
0.9405438, -0.1396932, 2.71216, 0, 0, 0, 1, 1,
0.9459123, -0.1285419, 2.985675, 0, 0, 0, 1, 1,
0.9657015, -1.331626, 1.577755, 0, 0, 0, 1, 1,
0.9728963, -1.128547, 2.190205, 1, 1, 1, 1, 1,
0.9736157, -0.2049672, 3.912598, 1, 1, 1, 1, 1,
0.9741649, 0.420129, 2.419141, 1, 1, 1, 1, 1,
0.9749275, -1.060039, 3.444972, 1, 1, 1, 1, 1,
0.9793165, -0.3636769, 2.180434, 1, 1, 1, 1, 1,
0.9825802, 0.7200035, 1.376943, 1, 1, 1, 1, 1,
0.9842285, 0.237581, 0.341023, 1, 1, 1, 1, 1,
0.9866624, -0.2320562, 2.775466, 1, 1, 1, 1, 1,
0.9875668, 2.07742, -1.650106, 1, 1, 1, 1, 1,
0.994215, -0.6179318, 0.8293373, 1, 1, 1, 1, 1,
0.9942549, 0.08145703, 1.429582, 1, 1, 1, 1, 1,
0.997775, -0.6002604, 2.348094, 1, 1, 1, 1, 1,
1.005774, 1.216696, 0.09245642, 1, 1, 1, 1, 1,
1.006756, -2.094922, 1.627408, 1, 1, 1, 1, 1,
1.009592, -0.3550868, 1.936557, 1, 1, 1, 1, 1,
1.011703, -0.9643852, 1.619702, 0, 0, 1, 1, 1,
1.013724, -0.3798422, 1.641148, 1, 0, 0, 1, 1,
1.014278, 1.177758, 1.287312, 1, 0, 0, 1, 1,
1.014634, -0.4821417, 2.59239, 1, 0, 0, 1, 1,
1.017207, 0.1995762, 3.313427, 1, 0, 0, 1, 1,
1.018045, -0.8792892, 2.759437, 1, 0, 0, 1, 1,
1.019245, -0.4955117, 1.535302, 0, 0, 0, 1, 1,
1.026632, 0.4606848, 1.443197, 0, 0, 0, 1, 1,
1.028602, 0.3040795, 1.4521, 0, 0, 0, 1, 1,
1.030099, 0.1225838, 1.36204, 0, 0, 0, 1, 1,
1.032213, -0.173138, 2.952436, 0, 0, 0, 1, 1,
1.037545, 1.045987, 0.4910647, 0, 0, 0, 1, 1,
1.041801, -0.569553, 2.734354, 0, 0, 0, 1, 1,
1.043135, -0.4023264, 1.060023, 1, 1, 1, 1, 1,
1.046749, 0.3417327, 1.328436, 1, 1, 1, 1, 1,
1.049574, 1.022105, 1.120311, 1, 1, 1, 1, 1,
1.050205, -1.430396, 2.853033, 1, 1, 1, 1, 1,
1.054094, -2.475744, 1.665038, 1, 1, 1, 1, 1,
1.055607, -1.397535, 0.8797067, 1, 1, 1, 1, 1,
1.058297, -0.02933882, 0.3969852, 1, 1, 1, 1, 1,
1.061886, -0.4282984, 0.03194914, 1, 1, 1, 1, 1,
1.064421, 0.4362951, 1.305211, 1, 1, 1, 1, 1,
1.064802, -0.5340835, 1.902769, 1, 1, 1, 1, 1,
1.06597, 0.305697, 1.914488, 1, 1, 1, 1, 1,
1.075591, 0.04546151, 1.511583, 1, 1, 1, 1, 1,
1.08102, 0.5677643, 2.088028, 1, 1, 1, 1, 1,
1.082914, 0.848821, -0.0141679, 1, 1, 1, 1, 1,
1.085235, 0.9024652, -0.10168, 1, 1, 1, 1, 1,
1.094531, 0.06081653, 1.014208, 0, 0, 1, 1, 1,
1.095068, -0.5836445, 0.5167244, 1, 0, 0, 1, 1,
1.095562, -0.6314394, 1.576421, 1, 0, 0, 1, 1,
1.098575, -0.004781607, 0.1982364, 1, 0, 0, 1, 1,
1.104807, 0.7304729, 0.05851748, 1, 0, 0, 1, 1,
1.10868, -0.5693546, 1.913825, 1, 0, 0, 1, 1,
1.108683, -0.8889136, 1.709792, 0, 0, 0, 1, 1,
1.110992, 0.7216805, 0.3796757, 0, 0, 0, 1, 1,
1.11347, 0.5186039, 0.2280466, 0, 0, 0, 1, 1,
1.11712, -0.4664002, 1.265391, 0, 0, 0, 1, 1,
1.117902, -0.1388897, 3.128849, 0, 0, 0, 1, 1,
1.125196, 0.9081697, 1.452615, 0, 0, 0, 1, 1,
1.129236, -0.6155881, 2.204529, 0, 0, 0, 1, 1,
1.13089, 0.6847377, 0.1145002, 1, 1, 1, 1, 1,
1.132909, -0.6672581, 3.570559, 1, 1, 1, 1, 1,
1.13817, -0.4663274, 1.035337, 1, 1, 1, 1, 1,
1.140756, 1.1545, 1.157913, 1, 1, 1, 1, 1,
1.147178, -0.334399, 1.092676, 1, 1, 1, 1, 1,
1.157809, -0.1794685, 1.743502, 1, 1, 1, 1, 1,
1.16548, -1.056678, 2.626981, 1, 1, 1, 1, 1,
1.167325, -0.8202504, 3.640164, 1, 1, 1, 1, 1,
1.170635, 0.02623978, 1.625564, 1, 1, 1, 1, 1,
1.170735, 0.3104853, 1.271824, 1, 1, 1, 1, 1,
1.175446, -0.3601117, 1.747153, 1, 1, 1, 1, 1,
1.176257, 0.1302002, 0.650398, 1, 1, 1, 1, 1,
1.196031, -0.1292401, 2.960179, 1, 1, 1, 1, 1,
1.198171, 0.4747891, 2.994889, 1, 1, 1, 1, 1,
1.200692, -0.3081836, 1.92752, 1, 1, 1, 1, 1,
1.203877, 0.4039173, 0.8166925, 0, 0, 1, 1, 1,
1.205397, 2.137508, -0.7695472, 1, 0, 0, 1, 1,
1.222741, -0.8874674, 2.928941, 1, 0, 0, 1, 1,
1.225216, -0.9615197, 2.974753, 1, 0, 0, 1, 1,
1.225296, 0.29878, 2.147896, 1, 0, 0, 1, 1,
1.231571, 0.4678277, -0.2726519, 1, 0, 0, 1, 1,
1.233163, 0.2148953, 0.07284275, 0, 0, 0, 1, 1,
1.244496, 0.7266412, 1.442249, 0, 0, 0, 1, 1,
1.251874, 0.4198107, 1.411893, 0, 0, 0, 1, 1,
1.259021, 0.01290314, 1.3471, 0, 0, 0, 1, 1,
1.268061, -1.44319, 2.860438, 0, 0, 0, 1, 1,
1.270193, 0.4091522, 2.212004, 0, 0, 0, 1, 1,
1.274576, 1.398521, 0.3009779, 0, 0, 0, 1, 1,
1.284036, 0.8726798, -1.512722, 1, 1, 1, 1, 1,
1.284589, -0.9521846, 2.821966, 1, 1, 1, 1, 1,
1.289354, -1.286652, 1.836697, 1, 1, 1, 1, 1,
1.294959, -0.3596795, 1.822431, 1, 1, 1, 1, 1,
1.300127, -0.7986196, 0.9698109, 1, 1, 1, 1, 1,
1.30072, -0.7008005, 2.22374, 1, 1, 1, 1, 1,
1.307659, 1.010816, 3.280214, 1, 1, 1, 1, 1,
1.309159, -0.5643653, 2.118382, 1, 1, 1, 1, 1,
1.310054, 0.9830552, 0.6705372, 1, 1, 1, 1, 1,
1.311795, -0.7969034, 3.492323, 1, 1, 1, 1, 1,
1.313711, -0.387694, 2.810492, 1, 1, 1, 1, 1,
1.324192, 0.01241791, 2.839518, 1, 1, 1, 1, 1,
1.331176, -0.607434, 2.293687, 1, 1, 1, 1, 1,
1.337735, 0.5687034, 1.706496, 1, 1, 1, 1, 1,
1.342135, 0.6797554, 0.874347, 1, 1, 1, 1, 1,
1.359417, -0.07755573, 2.401855, 0, 0, 1, 1, 1,
1.360372, -0.8945634, 1.976985, 1, 0, 0, 1, 1,
1.372096, 1.680778, 0.4682145, 1, 0, 0, 1, 1,
1.375946, 0.3176668, 1.123446, 1, 0, 0, 1, 1,
1.387424, -0.168406, 3.159896, 1, 0, 0, 1, 1,
1.393154, 0.8706817, 2.345793, 1, 0, 0, 1, 1,
1.408005, -0.2281308, 3.895959, 0, 0, 0, 1, 1,
1.412288, 1.014965, -0.906961, 0, 0, 0, 1, 1,
1.41554, -0.6841306, 1.256428, 0, 0, 0, 1, 1,
1.415543, 0.09934887, 1.273324, 0, 0, 0, 1, 1,
1.418369, -1.391207, 1.555473, 0, 0, 0, 1, 1,
1.419628, -0.06224472, 2.360287, 0, 0, 0, 1, 1,
1.420074, -0.818785, 0.9592683, 0, 0, 0, 1, 1,
1.420244, 0.2631206, 1.03546, 1, 1, 1, 1, 1,
1.423106, 1.660743, 0.047112, 1, 1, 1, 1, 1,
1.428389, 1.635383, 0.232725, 1, 1, 1, 1, 1,
1.441771, 0.6878475, 0.7275493, 1, 1, 1, 1, 1,
1.445649, -0.3076697, 1.076689, 1, 1, 1, 1, 1,
1.446144, 0.1625851, 2.316512, 1, 1, 1, 1, 1,
1.454938, -2.130042, 1.208443, 1, 1, 1, 1, 1,
1.466732, 0.06913482, 3.276571, 1, 1, 1, 1, 1,
1.468102, 0.1610708, 0.7318166, 1, 1, 1, 1, 1,
1.478181, 0.3497862, 1.090326, 1, 1, 1, 1, 1,
1.48974, 0.1669096, 2.037174, 1, 1, 1, 1, 1,
1.491638, -0.9509124, 3.243132, 1, 1, 1, 1, 1,
1.494405, 0.04472143, 1.533265, 1, 1, 1, 1, 1,
1.497765, -0.4059478, 2.729751, 1, 1, 1, 1, 1,
1.499205, 1.057782, -0.5221212, 1, 1, 1, 1, 1,
1.500024, -0.6561232, 2.120009, 0, 0, 1, 1, 1,
1.508346, -0.8490757, 2.549698, 1, 0, 0, 1, 1,
1.524793, 1.162335, -0.772137, 1, 0, 0, 1, 1,
1.524818, -1.600584, 2.409708, 1, 0, 0, 1, 1,
1.526193, 1.13804, 1.780079, 1, 0, 0, 1, 1,
1.540053, -0.2375304, 1.314716, 1, 0, 0, 1, 1,
1.548763, -1.187512, 4.067499, 0, 0, 0, 1, 1,
1.554134, -0.9722698, 1.753831, 0, 0, 0, 1, 1,
1.556235, -1.215713, 2.598793, 0, 0, 0, 1, 1,
1.557637, 0.3860874, 2.001422, 0, 0, 0, 1, 1,
1.561194, -0.3663219, 2.748316, 0, 0, 0, 1, 1,
1.564877, -0.1146277, -1.249454, 0, 0, 0, 1, 1,
1.566216, 0.2883579, 1.421322, 0, 0, 0, 1, 1,
1.566902, 0.8158745, 1.249238, 1, 1, 1, 1, 1,
1.568479, 1.296652, 0.216795, 1, 1, 1, 1, 1,
1.571237, 0.01278558, 1.578363, 1, 1, 1, 1, 1,
1.572777, -0.5030248, 2.154431, 1, 1, 1, 1, 1,
1.575248, -0.5687128, 2.547294, 1, 1, 1, 1, 1,
1.60767, 1.163515, 3.351497, 1, 1, 1, 1, 1,
1.611765, -1.787252, 2.363047, 1, 1, 1, 1, 1,
1.617626, 0.5815122, 1.606902, 1, 1, 1, 1, 1,
1.620577, 0.01949507, 1.888356, 1, 1, 1, 1, 1,
1.622649, 0.8425899, 0.9890769, 1, 1, 1, 1, 1,
1.626167, -2.099885, 2.027921, 1, 1, 1, 1, 1,
1.62777, -0.02007613, 2.009391, 1, 1, 1, 1, 1,
1.640058, 1.702886, -0.5121296, 1, 1, 1, 1, 1,
1.658177, -0.4693812, 1.849523, 1, 1, 1, 1, 1,
1.665608, -1.282994, 2.138179, 1, 1, 1, 1, 1,
1.677785, -2.4509, 2.550699, 0, 0, 1, 1, 1,
1.693144, -0.3906823, 3.883494, 1, 0, 0, 1, 1,
1.705696, -0.4098791, 1.470999, 1, 0, 0, 1, 1,
1.730592, -0.2251739, 1.835132, 1, 0, 0, 1, 1,
1.737228, -0.5991119, 1.942226, 1, 0, 0, 1, 1,
1.738271, -0.9875538, 1.54345, 1, 0, 0, 1, 1,
1.744368, 0.4252309, 1.121073, 0, 0, 0, 1, 1,
1.762866, -0.5926043, 2.752524, 0, 0, 0, 1, 1,
1.767022, -0.4503773, 3.423887, 0, 0, 0, 1, 1,
1.77116, 0.2499811, 1.021942, 0, 0, 0, 1, 1,
1.787539, 1.156605, 0.8823268, 0, 0, 0, 1, 1,
1.789936, 0.6834639, 2.177838, 0, 0, 0, 1, 1,
1.790091, 0.4939546, 0.1909384, 0, 0, 0, 1, 1,
1.795487, 1.062237, 0.5874338, 1, 1, 1, 1, 1,
1.799584, -0.2400718, -0.437577, 1, 1, 1, 1, 1,
1.800331, 0.03158369, -0.6228726, 1, 1, 1, 1, 1,
1.80399, -1.210373, 2.132013, 1, 1, 1, 1, 1,
1.813186, -2.977403, 3.789043, 1, 1, 1, 1, 1,
1.815248, -1.462255, 3.196878, 1, 1, 1, 1, 1,
1.818694, -0.7771574, 2.790092, 1, 1, 1, 1, 1,
1.822011, 0.6500751, 0.3450816, 1, 1, 1, 1, 1,
1.822973, 0.2831623, 0.6969988, 1, 1, 1, 1, 1,
1.843093, -0.5303944, 0.9024796, 1, 1, 1, 1, 1,
1.847427, 1.33394, 0.6506947, 1, 1, 1, 1, 1,
1.872643, 0.2664173, -0.2611011, 1, 1, 1, 1, 1,
1.918012, -0.4643701, -0.9068711, 1, 1, 1, 1, 1,
1.920476, 0.4476347, 1.828349, 1, 1, 1, 1, 1,
1.925702, 0.6493987, 0.5461225, 1, 1, 1, 1, 1,
1.928755, 1.918361, 0.812215, 0, 0, 1, 1, 1,
1.968026, 0.09213269, 2.699082, 1, 0, 0, 1, 1,
1.975156, 1.169037, 0.2506961, 1, 0, 0, 1, 1,
1.975537, -0.5280382, 2.782806, 1, 0, 0, 1, 1,
1.997909, -0.3159944, 1.589362, 1, 0, 0, 1, 1,
2.012818, -2.06722, 1.512481, 1, 0, 0, 1, 1,
2.026186, 1.356602, 2.091954, 0, 0, 0, 1, 1,
2.09843, -0.5785994, 3.360526, 0, 0, 0, 1, 1,
2.136409, 1.842362, 0.5657985, 0, 0, 0, 1, 1,
2.192638, -1.196934, 2.445305, 0, 0, 0, 1, 1,
2.257911, -0.5109462, 1.778237, 0, 0, 0, 1, 1,
2.358053, 0.8631369, -0.6003428, 0, 0, 0, 1, 1,
2.414099, -0.1562438, 1.397753, 0, 0, 0, 1, 1,
2.497884, -0.2184111, 2.494993, 1, 1, 1, 1, 1,
2.524482, -1.909975, 3.3818, 1, 1, 1, 1, 1,
2.542745, 1.110121, 2.733786, 1, 1, 1, 1, 1,
2.944488, -0.4550582, 1.618313, 1, 1, 1, 1, 1,
2.956132, -0.5405086, 3.119777, 1, 1, 1, 1, 1,
3.03445, 0.5061025, 2.974962, 1, 1, 1, 1, 1,
3.3749, 0.5938916, -0.07677606, 1, 1, 1, 1, 1
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
var radius = 9.714815;
var distance = 34.12288;
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
mvMatrix.translate( -0.1842802, 0.5940814, 0.2391808 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.12288);
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