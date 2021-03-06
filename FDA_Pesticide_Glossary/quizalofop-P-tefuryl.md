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
-3.841778, -0.1984473, -1.769358, 1, 0, 0, 1,
-2.831084, -1.712072, -1.901665, 1, 0.007843138, 0, 1,
-2.694963, -0.4833702, -2.200744, 1, 0.01176471, 0, 1,
-2.471482, -1.013316, -4.384807, 1, 0.01960784, 0, 1,
-2.453248, 1.15919, 0.2882914, 1, 0.02352941, 0, 1,
-2.372815, -0.7108233, -1.978119, 1, 0.03137255, 0, 1,
-2.278107, 0.9097036, -1.415514, 1, 0.03529412, 0, 1,
-2.273829, -1.650807, -4.490237, 1, 0.04313726, 0, 1,
-2.239027, 0.1552763, -0.702542, 1, 0.04705882, 0, 1,
-2.236948, 0.7192817, 1.190803, 1, 0.05490196, 0, 1,
-2.21993, -0.132141, -1.669411, 1, 0.05882353, 0, 1,
-2.178776, -0.6093208, -1.195645, 1, 0.06666667, 0, 1,
-2.172026, 0.353485, -1.318305, 1, 0.07058824, 0, 1,
-2.171868, -0.4772835, -2.710728, 1, 0.07843138, 0, 1,
-2.104475, -2.80122, -2.813944, 1, 0.08235294, 0, 1,
-2.092612, 2.534111, -1.801316, 1, 0.09019608, 0, 1,
-2.058183, 0.1372122, -2.021695, 1, 0.09411765, 0, 1,
-2.040964, -2.600922, -1.980768, 1, 0.1019608, 0, 1,
-2.038348, -0.6039581, -3.514455, 1, 0.1098039, 0, 1,
-2.010567, -1.010277, -2.724277, 1, 0.1137255, 0, 1,
-1.992955, 0.4564009, -0.4366536, 1, 0.1215686, 0, 1,
-1.975046, 0.004526454, -0.8483264, 1, 0.1254902, 0, 1,
-1.965595, -1.856675, -3.985736, 1, 0.1333333, 0, 1,
-1.963053, 0.3174739, -1.388647, 1, 0.1372549, 0, 1,
-1.955521, -1.603557, -2.845213, 1, 0.145098, 0, 1,
-1.953653, 0.8639864, -2.523791, 1, 0.1490196, 0, 1,
-1.920349, 0.151671, -1.841352, 1, 0.1568628, 0, 1,
-1.913971, -1.501822, -0.8571544, 1, 0.1607843, 0, 1,
-1.9058, 1.261843, -0.5441887, 1, 0.1686275, 0, 1,
-1.875104, 2.587689, 1.450429, 1, 0.172549, 0, 1,
-1.773652, 0.8295451, -1.054422, 1, 0.1803922, 0, 1,
-1.75786, -0.1659382, -1.926028, 1, 0.1843137, 0, 1,
-1.754193, 0.4539594, -2.182169, 1, 0.1921569, 0, 1,
-1.753113, 0.399305, -0.910403, 1, 0.1960784, 0, 1,
-1.751852, -0.6433319, -2.474488, 1, 0.2039216, 0, 1,
-1.749227, -0.05206021, -1.998063, 1, 0.2117647, 0, 1,
-1.741056, 0.1279895, -2.634481, 1, 0.2156863, 0, 1,
-1.734284, -0.6136273, -0.7994968, 1, 0.2235294, 0, 1,
-1.706769, -0.3010143, -0.486548, 1, 0.227451, 0, 1,
-1.692918, 0.02602664, -0.110237, 1, 0.2352941, 0, 1,
-1.689912, -0.1399315, 1.204049, 1, 0.2392157, 0, 1,
-1.679476, -0.712843, -1.144901, 1, 0.2470588, 0, 1,
-1.67359, -0.004824651, -2.267809, 1, 0.2509804, 0, 1,
-1.672882, -1.110995, -2.707599, 1, 0.2588235, 0, 1,
-1.666163, -0.4289145, -0.1722618, 1, 0.2627451, 0, 1,
-1.663762, -0.6606532, -0.5501222, 1, 0.2705882, 0, 1,
-1.658278, 0.8835387, -2.022033, 1, 0.2745098, 0, 1,
-1.654013, -0.05857626, -1.848747, 1, 0.282353, 0, 1,
-1.650642, -0.4289438, -1.034117, 1, 0.2862745, 0, 1,
-1.638518, -1.036551, -1.918432, 1, 0.2941177, 0, 1,
-1.617896, -0.4809455, -1.276373, 1, 0.3019608, 0, 1,
-1.609286, -0.1369386, 0.7733915, 1, 0.3058824, 0, 1,
-1.591836, 0.5207802, -1.320031, 1, 0.3137255, 0, 1,
-1.578069, -0.5258913, -0.2955154, 1, 0.3176471, 0, 1,
-1.572539, -0.5563568, -0.9419343, 1, 0.3254902, 0, 1,
-1.565001, 0.5191534, -0.5770667, 1, 0.3294118, 0, 1,
-1.557955, -0.9905154, -0.4274965, 1, 0.3372549, 0, 1,
-1.531918, 0.8563052, -2.498916, 1, 0.3411765, 0, 1,
-1.508767, -0.1956715, -2.262641, 1, 0.3490196, 0, 1,
-1.506688, 0.2779799, -2.147077, 1, 0.3529412, 0, 1,
-1.49805, -1.022807, -2.803743, 1, 0.3607843, 0, 1,
-1.495784, 2.492373, -1.721702, 1, 0.3647059, 0, 1,
-1.492752, -0.6013017, -0.5652868, 1, 0.372549, 0, 1,
-1.488766, -0.2603651, -2.506967, 1, 0.3764706, 0, 1,
-1.483693, 0.172178, -3.042409, 1, 0.3843137, 0, 1,
-1.476759, 0.3107665, -3.289093, 1, 0.3882353, 0, 1,
-1.473318, -0.2939135, -0.4838084, 1, 0.3960784, 0, 1,
-1.460649, 1.39938, -0.6992621, 1, 0.4039216, 0, 1,
-1.457615, -0.0265895, 0.8097807, 1, 0.4078431, 0, 1,
-1.445379, -0.455194, -3.925091, 1, 0.4156863, 0, 1,
-1.438674, -1.27906, -2.593857, 1, 0.4196078, 0, 1,
-1.436995, 1.703323, -2.54093, 1, 0.427451, 0, 1,
-1.434839, 0.3877852, -0.4508221, 1, 0.4313726, 0, 1,
-1.433719, -1.209622, -2.427408, 1, 0.4392157, 0, 1,
-1.414266, -0.2930029, -2.536807, 1, 0.4431373, 0, 1,
-1.365612, -0.2202308, -0.8288581, 1, 0.4509804, 0, 1,
-1.358023, 0.4546185, -2.192086, 1, 0.454902, 0, 1,
-1.349663, 1.166412, -1.188548, 1, 0.4627451, 0, 1,
-1.3446, 0.2586529, -2.050754, 1, 0.4666667, 0, 1,
-1.343364, -2.420744, -1.835794, 1, 0.4745098, 0, 1,
-1.32795, 1.235819, -0.2115901, 1, 0.4784314, 0, 1,
-1.326519, -0.815926, -2.632554, 1, 0.4862745, 0, 1,
-1.32397, 0.9843733, -0.8194975, 1, 0.4901961, 0, 1,
-1.302105, 0.8738379, -0.5558015, 1, 0.4980392, 0, 1,
-1.289236, -0.3390889, -0.8624018, 1, 0.5058824, 0, 1,
-1.274459, -0.665081, -2.63916, 1, 0.509804, 0, 1,
-1.269019, 0.1537867, -0.1638031, 1, 0.5176471, 0, 1,
-1.266565, 2.369893, -1.202624, 1, 0.5215687, 0, 1,
-1.25396, 1.227956, -1.924403, 1, 0.5294118, 0, 1,
-1.245554, -1.412858, -0.5227555, 1, 0.5333334, 0, 1,
-1.244616, -0.7173708, -2.323566, 1, 0.5411765, 0, 1,
-1.242108, -1.260473, -2.838567, 1, 0.5450981, 0, 1,
-1.23489, -0.3883934, -2.622716, 1, 0.5529412, 0, 1,
-1.234389, 0.545141, -1.205584, 1, 0.5568628, 0, 1,
-1.216173, -1.231552, -0.1605816, 1, 0.5647059, 0, 1,
-1.216163, -0.9225175, -2.571389, 1, 0.5686275, 0, 1,
-1.215113, -0.1525609, -1.7464, 1, 0.5764706, 0, 1,
-1.211287, 0.05321241, -0.6958454, 1, 0.5803922, 0, 1,
-1.209988, 0.1522489, -2.663026, 1, 0.5882353, 0, 1,
-1.20959, 2.024963, -0.7314717, 1, 0.5921569, 0, 1,
-1.203489, -0.9495589, -0.4834561, 1, 0.6, 0, 1,
-1.193621, -0.9999852, -2.226385, 1, 0.6078432, 0, 1,
-1.186867, 0.9443593, -0.4489675, 1, 0.6117647, 0, 1,
-1.172335, 1.351391, -0.4812942, 1, 0.6196079, 0, 1,
-1.172232, 1.435952, -1.922133, 1, 0.6235294, 0, 1,
-1.165569, 2.907844, -0.2890718, 1, 0.6313726, 0, 1,
-1.156882, 0.8509635, 0.823305, 1, 0.6352941, 0, 1,
-1.156048, -0.2858387, -0.9038537, 1, 0.6431373, 0, 1,
-1.15359, -0.2016561, -1.896818, 1, 0.6470588, 0, 1,
-1.151902, -0.397375, -1.122533, 1, 0.654902, 0, 1,
-1.144503, -1.022863, -2.940059, 1, 0.6588235, 0, 1,
-1.135157, 1.312918, -1.058419, 1, 0.6666667, 0, 1,
-1.127702, 0.54084, -2.582893, 1, 0.6705883, 0, 1,
-1.117087, -1.525427, -2.842299, 1, 0.6784314, 0, 1,
-1.11172, 1.014789, 0.4038534, 1, 0.682353, 0, 1,
-1.111379, -0.02019849, -0.5450199, 1, 0.6901961, 0, 1,
-1.110186, 1.564461, -1.380246, 1, 0.6941177, 0, 1,
-1.1101, -0.7924789, -0.1968248, 1, 0.7019608, 0, 1,
-1.109515, -0.9857188, -2.09008, 1, 0.7098039, 0, 1,
-1.10933, -0.1049742, -1.04282, 1, 0.7137255, 0, 1,
-1.107428, -0.2617657, -2.023419, 1, 0.7215686, 0, 1,
-1.099896, -0.6354998, -1.669307, 1, 0.7254902, 0, 1,
-1.096177, 0.4208043, -1.012323, 1, 0.7333333, 0, 1,
-1.096092, 0.4492514, -1.429864, 1, 0.7372549, 0, 1,
-1.087732, -1.547085, -2.889458, 1, 0.7450981, 0, 1,
-1.087348, 0.2390043, 0.2418395, 1, 0.7490196, 0, 1,
-1.082214, -0.1996877, -1.121424, 1, 0.7568628, 0, 1,
-1.077731, -0.3333273, -1.107416, 1, 0.7607843, 0, 1,
-1.073053, -0.3345582, -2.491305, 1, 0.7686275, 0, 1,
-1.071913, 0.4108551, -1.328624, 1, 0.772549, 0, 1,
-1.067729, -0.02947935, -2.086339, 1, 0.7803922, 0, 1,
-1.065039, 0.6080338, -0.07925384, 1, 0.7843137, 0, 1,
-1.063605, 0.06014042, -2.230565, 1, 0.7921569, 0, 1,
-1.062414, 1.13077, -1.355315, 1, 0.7960784, 0, 1,
-1.060035, 0.9546331, -0.06708314, 1, 0.8039216, 0, 1,
-1.059508, 0.1606703, -1.967046, 1, 0.8117647, 0, 1,
-1.05833, 0.1880901, -3.128154, 1, 0.8156863, 0, 1,
-1.049857, 0.7440748, -0.1090066, 1, 0.8235294, 0, 1,
-1.048079, 1.51013, 0.01840776, 1, 0.827451, 0, 1,
-1.038077, 1.630703, -0.4790507, 1, 0.8352941, 0, 1,
-1.035115, 0.4773873, -2.531212, 1, 0.8392157, 0, 1,
-1.032525, -0.4473679, -1.881562, 1, 0.8470588, 0, 1,
-1.030148, 0.5821757, -1.597162, 1, 0.8509804, 0, 1,
-1.029368, 0.3152132, 1.038552, 1, 0.8588235, 0, 1,
-1.027737, -0.3863981, -0.6407081, 1, 0.8627451, 0, 1,
-1.022316, 0.8592635, -1.83523, 1, 0.8705882, 0, 1,
-1.021003, 1.281342, -0.5634968, 1, 0.8745098, 0, 1,
-1.017663, 0.4852231, -2.395512, 1, 0.8823529, 0, 1,
-1.013655, -0.8939722, -2.465594, 1, 0.8862745, 0, 1,
-1.007036, -0.1702713, -2.99562, 1, 0.8941177, 0, 1,
-1.002311, -1.388281, -1.371192, 1, 0.8980392, 0, 1,
-0.9994025, 0.07172197, -1.099716, 1, 0.9058824, 0, 1,
-0.9991736, -1.018681, -2.790982, 1, 0.9137255, 0, 1,
-0.9916015, -0.6328783, -2.019241, 1, 0.9176471, 0, 1,
-0.984222, 0.7136773, -0.06419311, 1, 0.9254902, 0, 1,
-0.9840006, 3.062453, -0.8657854, 1, 0.9294118, 0, 1,
-0.9830861, 0.2354437, -1.240409, 1, 0.9372549, 0, 1,
-0.9811735, -0.1982289, -1.340923, 1, 0.9411765, 0, 1,
-0.9790987, 0.5840811, -0.07238994, 1, 0.9490196, 0, 1,
-0.9694434, -0.5240142, -3.359868, 1, 0.9529412, 0, 1,
-0.964515, 0.4020748, -2.409991, 1, 0.9607843, 0, 1,
-0.9575032, -0.07098967, -1.558629, 1, 0.9647059, 0, 1,
-0.9509196, -0.4946671, -1.161602, 1, 0.972549, 0, 1,
-0.9369038, -0.08719912, -2.138667, 1, 0.9764706, 0, 1,
-0.9325791, -0.6237728, -3.323876, 1, 0.9843137, 0, 1,
-0.929346, -1.3191, -2.605749, 1, 0.9882353, 0, 1,
-0.9258621, -1.014924, -2.917141, 1, 0.9960784, 0, 1,
-0.9201549, -0.9958627, -3.697917, 0.9960784, 1, 0, 1,
-0.9143931, -0.1202233, -3.317861, 0.9921569, 1, 0, 1,
-0.9130009, 1.246215, -1.040938, 0.9843137, 1, 0, 1,
-0.9110996, 0.3884849, -0.8158432, 0.9803922, 1, 0, 1,
-0.9076525, 0.443632, -1.445349, 0.972549, 1, 0, 1,
-0.9062914, 0.0620045, -2.709915, 0.9686275, 1, 0, 1,
-0.9062021, -2.248289, -1.054613, 0.9607843, 1, 0, 1,
-0.9016196, -2.054473, -2.21936, 0.9568627, 1, 0, 1,
-0.8961999, 1.363307, 0.2375892, 0.9490196, 1, 0, 1,
-0.8913603, -0.4775753, -1.687997, 0.945098, 1, 0, 1,
-0.8911676, 0.9149675, -0.2331421, 0.9372549, 1, 0, 1,
-0.8899333, 0.1055578, -0.374279, 0.9333333, 1, 0, 1,
-0.8871484, -0.3529125, -2.618005, 0.9254902, 1, 0, 1,
-0.8867211, -1.873375, -2.07559, 0.9215686, 1, 0, 1,
-0.8837931, 0.7053975, -0.8391522, 0.9137255, 1, 0, 1,
-0.8821079, 1.736086, -0.3523315, 0.9098039, 1, 0, 1,
-0.8791679, 0.6426159, -2.031116, 0.9019608, 1, 0, 1,
-0.877907, -0.7333772, -2.545053, 0.8941177, 1, 0, 1,
-0.8775214, -0.6687117, -3.093716, 0.8901961, 1, 0, 1,
-0.8759824, 0.2477323, -2.206344, 0.8823529, 1, 0, 1,
-0.8712398, 0.5738709, -2.582987, 0.8784314, 1, 0, 1,
-0.8706452, 1.076182, -1.124586, 0.8705882, 1, 0, 1,
-0.8663069, -0.9553891, -3.639984, 0.8666667, 1, 0, 1,
-0.8659434, 0.7676883, -0.5240793, 0.8588235, 1, 0, 1,
-0.8652763, 1.102447, -1.315477, 0.854902, 1, 0, 1,
-0.8651239, 1.021995, -0.2404777, 0.8470588, 1, 0, 1,
-0.8613634, -0.1369351, -0.9127752, 0.8431373, 1, 0, 1,
-0.8541911, -3.147999, -3.365156, 0.8352941, 1, 0, 1,
-0.8505486, -0.3047564, -3.266736, 0.8313726, 1, 0, 1,
-0.838271, 0.1322426, -1.268145, 0.8235294, 1, 0, 1,
-0.8359677, 0.3748434, -1.903676, 0.8196079, 1, 0, 1,
-0.8356912, -0.819324, -3.069167, 0.8117647, 1, 0, 1,
-0.8275576, -1.46478, -3.021346, 0.8078431, 1, 0, 1,
-0.8272044, -0.6021491, -2.16579, 0.8, 1, 0, 1,
-0.8261693, 0.4225979, -0.7821699, 0.7921569, 1, 0, 1,
-0.8184416, -0.2288255, -2.47666, 0.7882353, 1, 0, 1,
-0.817213, -0.1094642, -0.7746837, 0.7803922, 1, 0, 1,
-0.8149859, -0.8804784, -1.876379, 0.7764706, 1, 0, 1,
-0.8147607, 2.112448, -1.330448, 0.7686275, 1, 0, 1,
-0.801667, 1.054684, -0.9661657, 0.7647059, 1, 0, 1,
-0.7948202, 0.8973935, -0.4900175, 0.7568628, 1, 0, 1,
-0.7947799, -0.4469781, -2.398433, 0.7529412, 1, 0, 1,
-0.7946672, -0.7596344, -1.872236, 0.7450981, 1, 0, 1,
-0.7945829, -0.457885, -1.573794, 0.7411765, 1, 0, 1,
-0.7924233, 0.9800172, 0.00349932, 0.7333333, 1, 0, 1,
-0.7910094, 0.8517539, -1.438915, 0.7294118, 1, 0, 1,
-0.7884195, 0.7059539, 0.5255519, 0.7215686, 1, 0, 1,
-0.7872702, 0.6792637, -2.321779, 0.7176471, 1, 0, 1,
-0.7831038, 0.6961403, -2.506144, 0.7098039, 1, 0, 1,
-0.7805983, 0.7352867, -0.8000592, 0.7058824, 1, 0, 1,
-0.7799398, -1.414393, -1.510781, 0.6980392, 1, 0, 1,
-0.7794262, 2.423846, 1.404751, 0.6901961, 1, 0, 1,
-0.7779868, -0.5997415, -1.819527, 0.6862745, 1, 0, 1,
-0.7766309, -0.25688, -2.547115, 0.6784314, 1, 0, 1,
-0.7713515, -0.1099283, -2.627955, 0.6745098, 1, 0, 1,
-0.7696, 1.264359, -1.01672, 0.6666667, 1, 0, 1,
-0.7683804, -1.559315, -4.477518, 0.6627451, 1, 0, 1,
-0.767581, 1.512209, -0.5624865, 0.654902, 1, 0, 1,
-0.7662227, 0.5702431, -1.600986, 0.6509804, 1, 0, 1,
-0.765596, 1.585429, -0.5845863, 0.6431373, 1, 0, 1,
-0.7650821, 1.235647, 1.147301, 0.6392157, 1, 0, 1,
-0.758239, -0.3420679, -2.012192, 0.6313726, 1, 0, 1,
-0.7526498, 0.3188872, -2.363348, 0.627451, 1, 0, 1,
-0.7525209, 1.579751, -1.307268, 0.6196079, 1, 0, 1,
-0.7519594, 1.067156, -0.01886701, 0.6156863, 1, 0, 1,
-0.7498199, -1.755358, -2.480891, 0.6078432, 1, 0, 1,
-0.7475373, 0.1201053, -2.520428, 0.6039216, 1, 0, 1,
-0.7372814, 0.03462039, -2.685187, 0.5960785, 1, 0, 1,
-0.7341502, -2.037572, -2.211716, 0.5882353, 1, 0, 1,
-0.7275511, 0.2396724, -3.38012, 0.5843138, 1, 0, 1,
-0.7268438, -0.9654552, -1.102729, 0.5764706, 1, 0, 1,
-0.7207395, -0.9039644, -3.196965, 0.572549, 1, 0, 1,
-0.7178503, 1.032201, -1.653321, 0.5647059, 1, 0, 1,
-0.7161611, 0.412347, -0.6211355, 0.5607843, 1, 0, 1,
-0.714222, -1.332134, -1.343176, 0.5529412, 1, 0, 1,
-0.712745, -1.18978, -2.069534, 0.5490196, 1, 0, 1,
-0.7036668, -0.7196046, -2.29461, 0.5411765, 1, 0, 1,
-0.7004308, 0.1068712, -1.776691, 0.5372549, 1, 0, 1,
-0.6999729, -0.6741391, -0.05051703, 0.5294118, 1, 0, 1,
-0.6992596, 0.302831, -2.551614, 0.5254902, 1, 0, 1,
-0.6983806, 0.6145599, 1.327125, 0.5176471, 1, 0, 1,
-0.6943234, 0.007676379, -1.744699, 0.5137255, 1, 0, 1,
-0.6911007, -1.126681, -2.247228, 0.5058824, 1, 0, 1,
-0.6902243, 2.412377, 1.30615, 0.5019608, 1, 0, 1,
-0.6890241, 0.3080872, -3.079754, 0.4941176, 1, 0, 1,
-0.6845737, -0.5423906, -1.113415, 0.4862745, 1, 0, 1,
-0.6784443, 1.972851, -1.900635, 0.4823529, 1, 0, 1,
-0.6770611, 1.069166, 0.1133726, 0.4745098, 1, 0, 1,
-0.6765968, 1.176759, 1.029181, 0.4705882, 1, 0, 1,
-0.6765018, 1.221011, -0.1339055, 0.4627451, 1, 0, 1,
-0.6715248, 1.288456, 0.430794, 0.4588235, 1, 0, 1,
-0.6695385, 0.5217302, -0.9066, 0.4509804, 1, 0, 1,
-0.6645082, 0.4083133, -1.566571, 0.4470588, 1, 0, 1,
-0.6604939, -0.2824327, -3.246093, 0.4392157, 1, 0, 1,
-0.6584507, -0.7154952, -4.183572, 0.4352941, 1, 0, 1,
-0.6575243, 0.3411129, -1.88154, 0.427451, 1, 0, 1,
-0.6565548, -0.7998575, -2.147256, 0.4235294, 1, 0, 1,
-0.6564104, -0.1299593, -2.203237, 0.4156863, 1, 0, 1,
-0.6557119, 0.5531307, 0.9795723, 0.4117647, 1, 0, 1,
-0.6546152, 0.5712028, -0.7124187, 0.4039216, 1, 0, 1,
-0.6538028, -0.03415596, -1.735746, 0.3960784, 1, 0, 1,
-0.6525033, 0.6382536, -0.5118386, 0.3921569, 1, 0, 1,
-0.6450677, -0.315149, -2.511032, 0.3843137, 1, 0, 1,
-0.644735, -1.107999, -3.263732, 0.3803922, 1, 0, 1,
-0.6413549, -0.8356986, -0.5615448, 0.372549, 1, 0, 1,
-0.6403149, 0.1821916, -1.89235, 0.3686275, 1, 0, 1,
-0.6383485, -2.974204, -3.34858, 0.3607843, 1, 0, 1,
-0.636836, 0.6605991, -0.2802672, 0.3568628, 1, 0, 1,
-0.6364731, 1.135442, -0.9039426, 0.3490196, 1, 0, 1,
-0.6339225, 0.9662747, 0.02007784, 0.345098, 1, 0, 1,
-0.6333963, -1.435226, -2.418425, 0.3372549, 1, 0, 1,
-0.6278692, 0.5091569, -0.07070098, 0.3333333, 1, 0, 1,
-0.6238611, -0.4243338, -2.895784, 0.3254902, 1, 0, 1,
-0.622913, -0.2625865, -1.750966, 0.3215686, 1, 0, 1,
-0.6197147, 0.5166515, -0.1998187, 0.3137255, 1, 0, 1,
-0.6191044, -1.533204, -2.908098, 0.3098039, 1, 0, 1,
-0.6145254, -0.9414632, -1.577013, 0.3019608, 1, 0, 1,
-0.6140968, 0.603139, 0.6106515, 0.2941177, 1, 0, 1,
-0.6108055, 0.02646754, -2.787708, 0.2901961, 1, 0, 1,
-0.6063862, 1.212733, -0.8255944, 0.282353, 1, 0, 1,
-0.6054279, -1.448133, 0.08832295, 0.2784314, 1, 0, 1,
-0.5975907, 0.2632852, -0.9238248, 0.2705882, 1, 0, 1,
-0.5949232, -1.395188, -1.635254, 0.2666667, 1, 0, 1,
-0.5948492, 1.472777, -0.9454293, 0.2588235, 1, 0, 1,
-0.5909401, -0.6920159, -2.446596, 0.254902, 1, 0, 1,
-0.586573, -0.5107884, -3.615989, 0.2470588, 1, 0, 1,
-0.5854992, 0.3471216, -0.6234264, 0.2431373, 1, 0, 1,
-0.580649, 0.0758006, -1.498928, 0.2352941, 1, 0, 1,
-0.5803471, 0.3448966, -1.119678, 0.2313726, 1, 0, 1,
-0.5802727, 1.125453, -1.733067, 0.2235294, 1, 0, 1,
-0.5750993, -0.1463854, -1.244206, 0.2196078, 1, 0, 1,
-0.5743441, 1.825874, 1.737812, 0.2117647, 1, 0, 1,
-0.572369, 1.625588, -0.07003351, 0.2078431, 1, 0, 1,
-0.570786, -1.269836, -1.199134, 0.2, 1, 0, 1,
-0.5546157, 0.7391712, -0.2406251, 0.1921569, 1, 0, 1,
-0.5542369, -0.6114455, -3.329406, 0.1882353, 1, 0, 1,
-0.5528577, -1.576468, -3.452268, 0.1803922, 1, 0, 1,
-0.5521498, 1.382854, 1.226042, 0.1764706, 1, 0, 1,
-0.5512759, -1.938264, -3.057853, 0.1686275, 1, 0, 1,
-0.5434825, -0.9864919, -2.066933, 0.1647059, 1, 0, 1,
-0.541957, -0.08456269, -2.43314, 0.1568628, 1, 0, 1,
-0.5410258, -1.352533, -3.783441, 0.1529412, 1, 0, 1,
-0.5405232, 0.6587699, 0.6727736, 0.145098, 1, 0, 1,
-0.5396236, -3.570534, -2.619236, 0.1411765, 1, 0, 1,
-0.5389389, 0.4795273, 0.2646115, 0.1333333, 1, 0, 1,
-0.5333686, -0.8545722, -2.527648, 0.1294118, 1, 0, 1,
-0.5266683, 0.5817758, -2.08064, 0.1215686, 1, 0, 1,
-0.5257775, -1.169828, -2.85221, 0.1176471, 1, 0, 1,
-0.5206817, 0.301646, -1.171933, 0.1098039, 1, 0, 1,
-0.5093595, -0.9036759, -1.506375, 0.1058824, 1, 0, 1,
-0.5018606, -0.6484672, -0.7213976, 0.09803922, 1, 0, 1,
-0.4998877, 1.483261, 0.1322634, 0.09019608, 1, 0, 1,
-0.497463, 1.70275, -1.484115, 0.08627451, 1, 0, 1,
-0.4963647, -1.134948, -2.12897, 0.07843138, 1, 0, 1,
-0.495644, -0.1112608, -3.445563, 0.07450981, 1, 0, 1,
-0.4883965, -1.404924, -4.910881, 0.06666667, 1, 0, 1,
-0.4856493, 0.4054062, -1.218642, 0.0627451, 1, 0, 1,
-0.4804607, 0.738839, -0.967245, 0.05490196, 1, 0, 1,
-0.4762689, 0.4824467, -2.037134, 0.05098039, 1, 0, 1,
-0.4761437, 0.3082059, -0.6500597, 0.04313726, 1, 0, 1,
-0.4754922, -1.179982, -2.272542, 0.03921569, 1, 0, 1,
-0.4717016, -1.012468, -2.195188, 0.03137255, 1, 0, 1,
-0.4546395, 0.07931171, -1.907487, 0.02745098, 1, 0, 1,
-0.4469799, 1.993043, -0.7107648, 0.01960784, 1, 0, 1,
-0.4459439, -1.305702, -2.076698, 0.01568628, 1, 0, 1,
-0.43822, 0.2323299, -2.522997, 0.007843138, 1, 0, 1,
-0.4354835, -1.19277, -2.361972, 0.003921569, 1, 0, 1,
-0.4345845, -0.4244149, -2.492902, 0, 1, 0.003921569, 1,
-0.4327404, -0.3338548, -0.9793969, 0, 1, 0.01176471, 1,
-0.4302993, -1.252325, -3.849062, 0, 1, 0.01568628, 1,
-0.429682, -0.1281694, -1.31741, 0, 1, 0.02352941, 1,
-0.4284701, -0.4812112, -0.2842243, 0, 1, 0.02745098, 1,
-0.4261174, 0.2754097, -3.197913, 0, 1, 0.03529412, 1,
-0.4251551, 2.550008, -0.8564793, 0, 1, 0.03921569, 1,
-0.4245042, 0.1589616, -2.746713, 0, 1, 0.04705882, 1,
-0.4224583, -0.4731311, -1.226819, 0, 1, 0.05098039, 1,
-0.4210374, 0.2262936, -2.992589, 0, 1, 0.05882353, 1,
-0.4203075, 1.042725, -0.4446078, 0, 1, 0.0627451, 1,
-0.4202286, -0.4009431, -1.801295, 0, 1, 0.07058824, 1,
-0.4199646, -0.7153158, -1.590326, 0, 1, 0.07450981, 1,
-0.419794, 0.9426398, 0.2757204, 0, 1, 0.08235294, 1,
-0.4180976, 1.248167, 1.022397, 0, 1, 0.08627451, 1,
-0.4154932, -1.222606, -2.448702, 0, 1, 0.09411765, 1,
-0.4129747, 1.904322, -0.04056939, 0, 1, 0.1019608, 1,
-0.4110082, -0.02861166, -2.943085, 0, 1, 0.1058824, 1,
-0.4105506, 1.262761, -0.1675896, 0, 1, 0.1137255, 1,
-0.4101504, 0.6204836, 1.36687, 0, 1, 0.1176471, 1,
-0.4083598, -0.4737634, -2.545901, 0, 1, 0.1254902, 1,
-0.4078125, 0.4988699, -1.394757, 0, 1, 0.1294118, 1,
-0.4068467, 0.09482954, -2.623867, 0, 1, 0.1372549, 1,
-0.4063205, 0.7965086, -1.609406, 0, 1, 0.1411765, 1,
-0.4044707, 0.9263627, -1.849187, 0, 1, 0.1490196, 1,
-0.4021292, 1.418933, 0.7981935, 0, 1, 0.1529412, 1,
-0.4005308, -1.040872, -4.366166, 0, 1, 0.1607843, 1,
-0.3892514, -2.057814, -3.280722, 0, 1, 0.1647059, 1,
-0.3886746, 0.4932761, 1.51251, 0, 1, 0.172549, 1,
-0.3851219, 2.033851, -0.7319223, 0, 1, 0.1764706, 1,
-0.3845783, 0.3541984, -1.430973, 0, 1, 0.1843137, 1,
-0.3833898, -0.3125248, -1.128829, 0, 1, 0.1882353, 1,
-0.3788282, -0.3661982, -3.116575, 0, 1, 0.1960784, 1,
-0.3783615, -0.3507046, -3.368591, 0, 1, 0.2039216, 1,
-0.3727291, 0.03115919, -1.727268, 0, 1, 0.2078431, 1,
-0.3712196, -1.090523, -2.905126, 0, 1, 0.2156863, 1,
-0.3661822, 0.01920918, -1.003092, 0, 1, 0.2196078, 1,
-0.3650822, 0.4162247, -0.9113925, 0, 1, 0.227451, 1,
-0.358925, 1.339258, -0.6544955, 0, 1, 0.2313726, 1,
-0.3579799, -0.6404446, -4.725862, 0, 1, 0.2392157, 1,
-0.3528242, -0.8925036, -2.332789, 0, 1, 0.2431373, 1,
-0.3508029, 0.4679782, -0.7436936, 0, 1, 0.2509804, 1,
-0.3501469, 1.122078, 0.6187863, 0, 1, 0.254902, 1,
-0.3480659, -1.001388, -2.737839, 0, 1, 0.2627451, 1,
-0.3452273, 0.6447816, 1.057138, 0, 1, 0.2666667, 1,
-0.3413217, 0.8126348, -1.246895, 0, 1, 0.2745098, 1,
-0.3410164, -0.157427, -1.668534, 0, 1, 0.2784314, 1,
-0.3382668, -0.158866, -1.612863, 0, 1, 0.2862745, 1,
-0.3325588, -0.1317252, -1.06626, 0, 1, 0.2901961, 1,
-0.3258584, 0.2626202, -1.816486, 0, 1, 0.2980392, 1,
-0.3249856, -0.45314, -2.353729, 0, 1, 0.3058824, 1,
-0.3210488, 1.055341, -0.4225201, 0, 1, 0.3098039, 1,
-0.3134686, -0.2284475, -1.677213, 0, 1, 0.3176471, 1,
-0.3114052, 1.220566, -1.269755, 0, 1, 0.3215686, 1,
-0.3112676, 1.562675, 1.232759, 0, 1, 0.3294118, 1,
-0.3063565, 0.6488256, 0.342262, 0, 1, 0.3333333, 1,
-0.3047024, -0.7396216, -2.103407, 0, 1, 0.3411765, 1,
-0.3029174, -0.5081459, -1.719454, 0, 1, 0.345098, 1,
-0.3008416, -1.476127, -3.289208, 0, 1, 0.3529412, 1,
-0.3003774, 1.599873, -0.7001745, 0, 1, 0.3568628, 1,
-0.2995779, -2.028471, -0.8556346, 0, 1, 0.3647059, 1,
-0.2926435, -0.03033791, -1.68988, 0, 1, 0.3686275, 1,
-0.2856027, -0.08955811, -1.825965, 0, 1, 0.3764706, 1,
-0.2780047, -0.369456, -3.021823, 0, 1, 0.3803922, 1,
-0.2708983, 1.180701, 1.054261, 0, 1, 0.3882353, 1,
-0.2699563, 0.2048116, -0.4626258, 0, 1, 0.3921569, 1,
-0.2683893, 0.01541186, -0.9583999, 0, 1, 0.4, 1,
-0.2683336, -0.24283, -2.398063, 0, 1, 0.4078431, 1,
-0.2683004, 2.74248, -1.012034, 0, 1, 0.4117647, 1,
-0.2634384, -1.760697, -3.437184, 0, 1, 0.4196078, 1,
-0.2631938, -0.9240441, -3.835708, 0, 1, 0.4235294, 1,
-0.2615784, -0.210118, -2.059102, 0, 1, 0.4313726, 1,
-0.2600905, -0.1626773, -1.756988, 0, 1, 0.4352941, 1,
-0.2597764, 1.299936, 2.124082, 0, 1, 0.4431373, 1,
-0.2564483, 0.6806463, -1.543762, 0, 1, 0.4470588, 1,
-0.2558154, -0.2105398, -2.968401, 0, 1, 0.454902, 1,
-0.2551458, -0.9061989, -2.585497, 0, 1, 0.4588235, 1,
-0.2491478, -0.5096005, -1.020476, 0, 1, 0.4666667, 1,
-0.2476839, -0.6743768, -1.740031, 0, 1, 0.4705882, 1,
-0.245296, -0.754347, -1.558003, 0, 1, 0.4784314, 1,
-0.245058, -0.3421492, -3.659831, 0, 1, 0.4823529, 1,
-0.2435421, 0.03391964, -3.414942, 0, 1, 0.4901961, 1,
-0.2381659, 0.6219845, -0.313452, 0, 1, 0.4941176, 1,
-0.2351016, 0.9608843, 0.4140883, 0, 1, 0.5019608, 1,
-0.2331768, -0.07414633, -4.272916, 0, 1, 0.509804, 1,
-0.2299267, -0.4573062, -0.2243173, 0, 1, 0.5137255, 1,
-0.2294157, -0.7760641, -2.839282, 0, 1, 0.5215687, 1,
-0.2282789, -0.847632, -2.872247, 0, 1, 0.5254902, 1,
-0.2278407, -1.158656, -2.940406, 0, 1, 0.5333334, 1,
-0.2272209, 1.288595, -0.163571, 0, 1, 0.5372549, 1,
-0.2249661, -0.7015268, -2.814632, 0, 1, 0.5450981, 1,
-0.2233128, -0.04902209, -2.874922, 0, 1, 0.5490196, 1,
-0.2162678, -0.279067, -1.800434, 0, 1, 0.5568628, 1,
-0.2151756, -0.2964408, -2.433892, 0, 1, 0.5607843, 1,
-0.2086942, -0.1872475, -2.703224, 0, 1, 0.5686275, 1,
-0.1988729, -1.205534, -3.37741, 0, 1, 0.572549, 1,
-0.1981279, -0.1106758, -2.8918, 0, 1, 0.5803922, 1,
-0.1936561, 2.211897, -0.5488675, 0, 1, 0.5843138, 1,
-0.1934844, 1.305618, 0.1831667, 0, 1, 0.5921569, 1,
-0.190819, 0.5663037, -0.5858728, 0, 1, 0.5960785, 1,
-0.1905794, -1.25009, -0.5322021, 0, 1, 0.6039216, 1,
-0.1888142, 0.5361457, 0.005638695, 0, 1, 0.6117647, 1,
-0.1884989, -0.1287373, -0.9500826, 0, 1, 0.6156863, 1,
-0.1843408, 1.682925, -1.30092, 0, 1, 0.6235294, 1,
-0.1825724, 0.5947832, -1.467762, 0, 1, 0.627451, 1,
-0.1824104, 0.4600319, -1.911328, 0, 1, 0.6352941, 1,
-0.178421, 0.800631, 0.7180983, 0, 1, 0.6392157, 1,
-0.1766528, 0.5143258, -0.4383187, 0, 1, 0.6470588, 1,
-0.175857, -0.5372329, -2.819513, 0, 1, 0.6509804, 1,
-0.1754745, -0.9986836, -0.8889211, 0, 1, 0.6588235, 1,
-0.1738499, -0.96586, -2.410797, 0, 1, 0.6627451, 1,
-0.1735758, 0.2817565, -0.6830177, 0, 1, 0.6705883, 1,
-0.1711447, -0.2244102, -3.349508, 0, 1, 0.6745098, 1,
-0.1651564, 0.8416913, -0.6372975, 0, 1, 0.682353, 1,
-0.1615545, -0.5414963, -1.751454, 0, 1, 0.6862745, 1,
-0.1595482, -0.3365745, -2.406513, 0, 1, 0.6941177, 1,
-0.1538146, 0.1372857, -0.4835637, 0, 1, 0.7019608, 1,
-0.1523941, -0.8796805, -3.758719, 0, 1, 0.7058824, 1,
-0.1519167, -2.113303, -4.100244, 0, 1, 0.7137255, 1,
-0.146467, 2.041217, -0.1221341, 0, 1, 0.7176471, 1,
-0.1459362, -0.1378911, -2.207485, 0, 1, 0.7254902, 1,
-0.1451025, 1.769041, -3.404898, 0, 1, 0.7294118, 1,
-0.1432631, -0.31869, -1.648077, 0, 1, 0.7372549, 1,
-0.1420336, -0.4948889, -2.31026, 0, 1, 0.7411765, 1,
-0.141142, 1.381314, -1.138052, 0, 1, 0.7490196, 1,
-0.132879, 0.662121, -0.9422876, 0, 1, 0.7529412, 1,
-0.1327538, 0.5331756, 0.9613819, 0, 1, 0.7607843, 1,
-0.1290276, 0.1780123, -1.921401, 0, 1, 0.7647059, 1,
-0.1250156, -0.6569983, -1.943719, 0, 1, 0.772549, 1,
-0.124146, 1.510987, -2.327984, 0, 1, 0.7764706, 1,
-0.1177752, 1.922695, -0.1921471, 0, 1, 0.7843137, 1,
-0.1176802, -1.185264, -1.938026, 0, 1, 0.7882353, 1,
-0.1175027, -0.532761, -2.201818, 0, 1, 0.7960784, 1,
-0.1150681, 0.242935, -0.4973696, 0, 1, 0.8039216, 1,
-0.1128357, -0.7276702, -2.931206, 0, 1, 0.8078431, 1,
-0.1071177, 1.27036, 1.219769, 0, 1, 0.8156863, 1,
-0.1064343, -0.6982719, -3.335171, 0, 1, 0.8196079, 1,
-0.1058281, -0.920672, -4.452747, 0, 1, 0.827451, 1,
-0.1038657, 0.1906253, -1.307425, 0, 1, 0.8313726, 1,
-0.1008482, -0.4724787, -3.633487, 0, 1, 0.8392157, 1,
-0.1006988, 0.8436521, 0.02067963, 0, 1, 0.8431373, 1,
-0.1003852, 0.2546121, -1.691644, 0, 1, 0.8509804, 1,
-0.1003523, -1.110471, -3.521863, 0, 1, 0.854902, 1,
-0.09910964, 1.186404, 0.2004425, 0, 1, 0.8627451, 1,
-0.09905531, -0.8289458, -1.960945, 0, 1, 0.8666667, 1,
-0.09759833, 1.519086, -0.4388197, 0, 1, 0.8745098, 1,
-0.09675311, 0.2608929, 0.3669836, 0, 1, 0.8784314, 1,
-0.09525952, 0.2308079, 1.266311, 0, 1, 0.8862745, 1,
-0.09180507, -0.2031705, -3.226158, 0, 1, 0.8901961, 1,
-0.08758596, -0.2489865, -1.120534, 0, 1, 0.8980392, 1,
-0.08680107, -1.661282, -3.016288, 0, 1, 0.9058824, 1,
-0.08430975, -0.261222, -1.92842, 0, 1, 0.9098039, 1,
-0.07877724, 2.013902, -1.775672, 0, 1, 0.9176471, 1,
-0.0787249, 0.2736493, 0.02484249, 0, 1, 0.9215686, 1,
-0.0781066, -0.1661296, -2.575162, 0, 1, 0.9294118, 1,
-0.07727747, -0.4421067, -2.202674, 0, 1, 0.9333333, 1,
-0.07662566, -0.2621375, -2.919819, 0, 1, 0.9411765, 1,
-0.07583763, 0.9435146, -0.5234811, 0, 1, 0.945098, 1,
-0.07566801, 1.055267, 0.3670937, 0, 1, 0.9529412, 1,
-0.07389809, 1.49105, 0.6054533, 0, 1, 0.9568627, 1,
-0.06403496, 1.05117, 0.2042966, 0, 1, 0.9647059, 1,
-0.06080271, 0.2864153, -0.5865676, 0, 1, 0.9686275, 1,
-0.05922812, -0.913651, -2.980359, 0, 1, 0.9764706, 1,
-0.05902554, 1.128501, 0.04747379, 0, 1, 0.9803922, 1,
-0.05431513, 2.21803, -0.9893748, 0, 1, 0.9882353, 1,
-0.0535062, -0.2243059, -2.792396, 0, 1, 0.9921569, 1,
-0.05137746, -0.03336288, -1.463154, 0, 1, 1, 1,
-0.04981286, 0.04960023, 1.478706, 0, 0.9921569, 1, 1,
-0.04973121, -1.410457, -2.422026, 0, 0.9882353, 1, 1,
-0.04964751, -0.6669351, -3.116485, 0, 0.9803922, 1, 1,
-0.04875727, -0.1412037, -1.612047, 0, 0.9764706, 1, 1,
-0.04771321, -0.7760848, -3.303839, 0, 0.9686275, 1, 1,
-0.04524755, 0.0289662, -0.8383404, 0, 0.9647059, 1, 1,
-0.04387478, 0.6431711, -2.925714, 0, 0.9568627, 1, 1,
-0.04230229, 0.4346784, -1.929563, 0, 0.9529412, 1, 1,
-0.03652246, 0.04687694, -0.2069456, 0, 0.945098, 1, 1,
-0.03625772, 1.523049, 0.8257692, 0, 0.9411765, 1, 1,
-0.03490762, 2.248735, -0.1700334, 0, 0.9333333, 1, 1,
-0.0340504, 1.071021, -1.129164, 0, 0.9294118, 1, 1,
-0.03380536, 0.7768861, -1.916468, 0, 0.9215686, 1, 1,
-0.02745184, -0.6338097, -2.873306, 0, 0.9176471, 1, 1,
-0.02080842, 0.1236704, -0.3746563, 0, 0.9098039, 1, 1,
-0.01247616, -0.4516734, -3.913631, 0, 0.9058824, 1, 1,
-0.01181716, 1.424409, 0.5517047, 0, 0.8980392, 1, 1,
-0.007463646, 0.4596565, 0.4531195, 0, 0.8901961, 1, 1,
-0.006911817, 1.199135, -0.5487444, 0, 0.8862745, 1, 1,
-0.005846933, 0.6984173, -0.2600122, 0, 0.8784314, 1, 1,
-0.002068382, -1.455925, -3.730164, 0, 0.8745098, 1, 1,
0.005963185, -1.795991, 2.406256, 0, 0.8666667, 1, 1,
0.007519648, -0.2836088, 3.224138, 0, 0.8627451, 1, 1,
0.01146392, -0.262964, 2.459021, 0, 0.854902, 1, 1,
0.01840742, -0.1741331, 3.444407, 0, 0.8509804, 1, 1,
0.01936831, 2.530529, 0.985545, 0, 0.8431373, 1, 1,
0.02245066, -1.58687, 2.74619, 0, 0.8392157, 1, 1,
0.02336911, 0.2630124, -0.957208, 0, 0.8313726, 1, 1,
0.02460376, -2.184145, 3.498425, 0, 0.827451, 1, 1,
0.02497266, -0.8371992, 3.099781, 0, 0.8196079, 1, 1,
0.0261218, 0.5225054, -1.239203, 0, 0.8156863, 1, 1,
0.02698474, -0.3370352, 2.40784, 0, 0.8078431, 1, 1,
0.02775923, 0.4413857, -0.2657497, 0, 0.8039216, 1, 1,
0.02873772, 1.203412, 1.536968, 0, 0.7960784, 1, 1,
0.02988672, -1.284453, 4.548889, 0, 0.7882353, 1, 1,
0.03050696, 0.1137259, 1.190556, 0, 0.7843137, 1, 1,
0.03340558, 0.2456592, -0.3372048, 0, 0.7764706, 1, 1,
0.03504053, 0.2062685, 0.3441899, 0, 0.772549, 1, 1,
0.03574725, 0.527083, -0.9757565, 0, 0.7647059, 1, 1,
0.04013763, 1.201717, 0.006977525, 0, 0.7607843, 1, 1,
0.04401375, 0.5179729, 1.045632, 0, 0.7529412, 1, 1,
0.04582221, 0.7081193, -0.3817946, 0, 0.7490196, 1, 1,
0.04855917, -0.8942134, 3.315769, 0, 0.7411765, 1, 1,
0.04991277, 0.195529, 1.412553, 0, 0.7372549, 1, 1,
0.05279746, -0.9431092, 3.741264, 0, 0.7294118, 1, 1,
0.05997806, 0.4441557, 0.7752111, 0, 0.7254902, 1, 1,
0.06058872, -0.3028733, 2.947642, 0, 0.7176471, 1, 1,
0.06249692, 0.5524513, -0.3630032, 0, 0.7137255, 1, 1,
0.07190456, 1.681457, -1.227239, 0, 0.7058824, 1, 1,
0.07191897, 0.1204056, 3.794321, 0, 0.6980392, 1, 1,
0.07266926, -1.505731, 2.506967, 0, 0.6941177, 1, 1,
0.07379232, 1.087645, 2.069724, 0, 0.6862745, 1, 1,
0.07636373, 1.161414, -0.8974964, 0, 0.682353, 1, 1,
0.07742799, -1.111473, 3.268006, 0, 0.6745098, 1, 1,
0.0797162, -0.2941775, 3.139865, 0, 0.6705883, 1, 1,
0.08252583, 0.6218765, -1.605131, 0, 0.6627451, 1, 1,
0.08376902, -0.2221248, 2.091288, 0, 0.6588235, 1, 1,
0.08654359, 1.204364, 0.8843048, 0, 0.6509804, 1, 1,
0.089958, -0.1289824, 2.108702, 0, 0.6470588, 1, 1,
0.09194563, 0.4629492, -0.2140765, 0, 0.6392157, 1, 1,
0.09294733, 1.349157, -0.9800291, 0, 0.6352941, 1, 1,
0.09524367, 0.1217171, 1.230813, 0, 0.627451, 1, 1,
0.1037752, -0.26497, 2.686367, 0, 0.6235294, 1, 1,
0.1177164, 0.6894322, -0.5406245, 0, 0.6156863, 1, 1,
0.1179891, 1.190887, 0.1702689, 0, 0.6117647, 1, 1,
0.1241839, -1.054875, 2.653131, 0, 0.6039216, 1, 1,
0.1278684, 0.4072399, -1.03571, 0, 0.5960785, 1, 1,
0.1330006, 0.6574681, 1.384634, 0, 0.5921569, 1, 1,
0.1360115, 1.037529, -0.8008686, 0, 0.5843138, 1, 1,
0.1389997, 0.5866275, 1.103182, 0, 0.5803922, 1, 1,
0.1394781, 0.7607998, 0.4926747, 0, 0.572549, 1, 1,
0.1429575, 0.6321715, -0.5167913, 0, 0.5686275, 1, 1,
0.1429664, -0.04538089, 0.858221, 0, 0.5607843, 1, 1,
0.1449417, -1.860557, 1.079459, 0, 0.5568628, 1, 1,
0.1487075, 0.3065739, 2.409111, 0, 0.5490196, 1, 1,
0.1521384, -1.19274, 1.758642, 0, 0.5450981, 1, 1,
0.1527907, 0.6919903, 1.46489, 0, 0.5372549, 1, 1,
0.1593158, -1.13395, 3.661278, 0, 0.5333334, 1, 1,
0.1608284, -1.319977, 5.460385, 0, 0.5254902, 1, 1,
0.1628701, 0.3120621, 0.449145, 0, 0.5215687, 1, 1,
0.1637647, -1.831872, 4.29631, 0, 0.5137255, 1, 1,
0.1665844, -1.702593, 4.152751, 0, 0.509804, 1, 1,
0.1669048, 0.4275532, -0.4253792, 0, 0.5019608, 1, 1,
0.1706578, 0.8085555, 0.147156, 0, 0.4941176, 1, 1,
0.1715266, 1.210707, 0.05348829, 0, 0.4901961, 1, 1,
0.1830867, 1.678132, -0.9245047, 0, 0.4823529, 1, 1,
0.1846089, 0.8027202, 2.129124, 0, 0.4784314, 1, 1,
0.1864352, 1.699044, 0.3223137, 0, 0.4705882, 1, 1,
0.188922, -0.3041184, 3.603264, 0, 0.4666667, 1, 1,
0.1892431, 2.165195, -0.6884, 0, 0.4588235, 1, 1,
0.1931051, 2.150995, -1.962912, 0, 0.454902, 1, 1,
0.1946692, 1.423623, -1.25167, 0, 0.4470588, 1, 1,
0.1980398, -0.1515433, 1.240662, 0, 0.4431373, 1, 1,
0.198349, -0.6762667, 1.615934, 0, 0.4352941, 1, 1,
0.2060916, 1.296827, -1.22282, 0, 0.4313726, 1, 1,
0.2076122, -0.7400478, 1.584813, 0, 0.4235294, 1, 1,
0.2076543, -1.899974, 2.976003, 0, 0.4196078, 1, 1,
0.2078125, -0.9711859, 1.834652, 0, 0.4117647, 1, 1,
0.2124778, -0.4286047, 3.239121, 0, 0.4078431, 1, 1,
0.2149824, -0.5241374, 2.97936, 0, 0.4, 1, 1,
0.2158437, 0.4617983, 0.8834078, 0, 0.3921569, 1, 1,
0.2160044, 0.7909346, -0.9594083, 0, 0.3882353, 1, 1,
0.2178513, -0.767168, 3.623168, 0, 0.3803922, 1, 1,
0.2188647, -1.446917, 4.488488, 0, 0.3764706, 1, 1,
0.2191172, 3.59254, 0.5252476, 0, 0.3686275, 1, 1,
0.2223921, -0.5662563, 3.398211, 0, 0.3647059, 1, 1,
0.2245461, 0.9359127, 0.4359844, 0, 0.3568628, 1, 1,
0.2246155, 0.1040632, -0.4025891, 0, 0.3529412, 1, 1,
0.2324265, -1.651047, 2.707276, 0, 0.345098, 1, 1,
0.2327701, -0.8831681, 1.349591, 0, 0.3411765, 1, 1,
0.2368597, 0.5073084, -0.1994836, 0, 0.3333333, 1, 1,
0.2371047, 1.394845, -2.232942, 0, 0.3294118, 1, 1,
0.2374373, 1.404936, -0.7903922, 0, 0.3215686, 1, 1,
0.237822, -0.09134565, -0.6464424, 0, 0.3176471, 1, 1,
0.2382592, -0.5230266, 3.599759, 0, 0.3098039, 1, 1,
0.241284, 0.7415097, 0.1413684, 0, 0.3058824, 1, 1,
0.2427496, -0.8636098, 1.079627, 0, 0.2980392, 1, 1,
0.2495387, -0.4700254, 3.570524, 0, 0.2901961, 1, 1,
0.2496974, -0.2089626, 4.071784, 0, 0.2862745, 1, 1,
0.2515014, -0.7506996, 4.820681, 0, 0.2784314, 1, 1,
0.2534162, 0.04723949, 1.358254, 0, 0.2745098, 1, 1,
0.2562112, 0.3048056, 2.064334, 0, 0.2666667, 1, 1,
0.2579475, -1.350281, 1.745695, 0, 0.2627451, 1, 1,
0.2605229, -1.090265, 3.54613, 0, 0.254902, 1, 1,
0.2609665, 0.9501364, -0.6951939, 0, 0.2509804, 1, 1,
0.2640314, 1.183672, 0.2617535, 0, 0.2431373, 1, 1,
0.2643297, -0.02715081, 1.378351, 0, 0.2392157, 1, 1,
0.2654745, 0.6168236, 0.4864008, 0, 0.2313726, 1, 1,
0.2654973, 1.032134, 0.4768814, 0, 0.227451, 1, 1,
0.2666951, -1.201291, 1.940233, 0, 0.2196078, 1, 1,
0.2679988, 1.270264, 1.893066, 0, 0.2156863, 1, 1,
0.2712862, -0.3890495, 1.522397, 0, 0.2078431, 1, 1,
0.271604, 1.317128, 0.3780941, 0, 0.2039216, 1, 1,
0.2746882, -0.6774017, 2.946348, 0, 0.1960784, 1, 1,
0.2843518, -0.7721027, 2.359602, 0, 0.1882353, 1, 1,
0.2886302, 1.38569, 0.2924848, 0, 0.1843137, 1, 1,
0.2888171, 0.8194688, -0.1584451, 0, 0.1764706, 1, 1,
0.2891551, 2.99772, -2.799268, 0, 0.172549, 1, 1,
0.2906581, -0.3383268, 3.222154, 0, 0.1647059, 1, 1,
0.2940971, 1.350928, -0.7605377, 0, 0.1607843, 1, 1,
0.2952256, -0.7169915, 3.151972, 0, 0.1529412, 1, 1,
0.2964352, -0.9082015, 2.398818, 0, 0.1490196, 1, 1,
0.2970648, -0.1913861, 3.449191, 0, 0.1411765, 1, 1,
0.2979701, -0.3382547, 0.5765516, 0, 0.1372549, 1, 1,
0.3026657, 0.1217409, 1.999576, 0, 0.1294118, 1, 1,
0.3034624, -0.205286, 1.522684, 0, 0.1254902, 1, 1,
0.3037662, 1.211182, 0.6546183, 0, 0.1176471, 1, 1,
0.3038776, 1.71955, -0.8425767, 0, 0.1137255, 1, 1,
0.3060762, 0.04430102, 0.901389, 0, 0.1058824, 1, 1,
0.3085284, -0.5149244, 2.972632, 0, 0.09803922, 1, 1,
0.3100626, -0.2703654, 1.845602, 0, 0.09411765, 1, 1,
0.3108647, 0.9619147, 0.4871573, 0, 0.08627451, 1, 1,
0.3113194, 0.06358671, 0.9872284, 0, 0.08235294, 1, 1,
0.3143402, 0.4197907, 0.3578149, 0, 0.07450981, 1, 1,
0.3185518, 0.769021, 0.5859212, 0, 0.07058824, 1, 1,
0.3193311, 1.241355, 0.5078512, 0, 0.0627451, 1, 1,
0.3196819, -1.937345, 3.105335, 0, 0.05882353, 1, 1,
0.3231635, 0.2051517, 1.079392, 0, 0.05098039, 1, 1,
0.3243953, -0.4991869, 2.368552, 0, 0.04705882, 1, 1,
0.325923, -0.1885101, 2.146777, 0, 0.03921569, 1, 1,
0.3264415, 1.230217, 1.315841, 0, 0.03529412, 1, 1,
0.3266638, -0.9312556, 0.7926769, 0, 0.02745098, 1, 1,
0.3328273, 0.003404469, 3.439126, 0, 0.02352941, 1, 1,
0.3351576, 0.8731575, -1.635886, 0, 0.01568628, 1, 1,
0.3356565, 0.05597073, 2.385438, 0, 0.01176471, 1, 1,
0.3381135, 0.4526717, 2.072574, 0, 0.003921569, 1, 1,
0.3444466, -1.710364, 3.054896, 0.003921569, 0, 1, 1,
0.3471013, 0.2284898, 4.39376, 0.007843138, 0, 1, 1,
0.3486585, 0.7289528, 0.3785833, 0.01568628, 0, 1, 1,
0.3499908, -0.1281337, 0.2229696, 0.01960784, 0, 1, 1,
0.3544998, 1.084915, 1.128163, 0.02745098, 0, 1, 1,
0.3565625, -1.393236, 2.169392, 0.03137255, 0, 1, 1,
0.3580502, 0.05998036, 1.21151, 0.03921569, 0, 1, 1,
0.3583063, 1.190284, 0.08059516, 0.04313726, 0, 1, 1,
0.3586714, 1.692663, 0.2866045, 0.05098039, 0, 1, 1,
0.3618115, -0.666056, 2.17147, 0.05490196, 0, 1, 1,
0.3628121, -0.9476171, 3.139381, 0.0627451, 0, 1, 1,
0.3635382, 0.2181361, 0.4455586, 0.06666667, 0, 1, 1,
0.3672535, 0.01654849, 0.6983001, 0.07450981, 0, 1, 1,
0.3673742, -0.2247641, 1.550519, 0.07843138, 0, 1, 1,
0.3681648, -0.6465005, 1.829157, 0.08627451, 0, 1, 1,
0.3684107, -1.063447, 2.673516, 0.09019608, 0, 1, 1,
0.3702979, -0.3624703, 0.2700911, 0.09803922, 0, 1, 1,
0.3752745, -1.622858, 4.053224, 0.1058824, 0, 1, 1,
0.3754953, 0.7071856, 0.1847529, 0.1098039, 0, 1, 1,
0.3787284, 0.4318087, -0.277092, 0.1176471, 0, 1, 1,
0.3805977, 1.455826, -0.3407353, 0.1215686, 0, 1, 1,
0.3855168, 1.439166, -0.08628528, 0.1294118, 0, 1, 1,
0.3881463, -0.7016777, 4.22913, 0.1333333, 0, 1, 1,
0.3988526, 0.8314392, 1.08934, 0.1411765, 0, 1, 1,
0.3997147, 0.9225491, 0.6442179, 0.145098, 0, 1, 1,
0.4019971, 0.04776141, 0.6981871, 0.1529412, 0, 1, 1,
0.4252773, 0.178123, 2.334507, 0.1568628, 0, 1, 1,
0.4295688, 1.351697, -0.2712634, 0.1647059, 0, 1, 1,
0.4324634, -1.59784, 2.635238, 0.1686275, 0, 1, 1,
0.4331795, 0.1814963, 1.77713, 0.1764706, 0, 1, 1,
0.4340812, -1.171292, 3.008794, 0.1803922, 0, 1, 1,
0.4367865, -1.082574, 3.359504, 0.1882353, 0, 1, 1,
0.4376313, 0.9246687, -0.7626163, 0.1921569, 0, 1, 1,
0.4381253, 0.0938658, 2.972308, 0.2, 0, 1, 1,
0.4413481, -1.11467, 0.8371404, 0.2078431, 0, 1, 1,
0.4417072, -1.081723, 3.998142, 0.2117647, 0, 1, 1,
0.4450971, 1.766225, 0.4685241, 0.2196078, 0, 1, 1,
0.456062, 1.638333, 1.311831, 0.2235294, 0, 1, 1,
0.4564237, 1.492023, 1.383088, 0.2313726, 0, 1, 1,
0.4577203, -0.5893449, 2.384072, 0.2352941, 0, 1, 1,
0.4643585, 0.2707676, 1.991653, 0.2431373, 0, 1, 1,
0.4645123, -0.895777, 3.237222, 0.2470588, 0, 1, 1,
0.4677655, -0.6371366, 4.227685, 0.254902, 0, 1, 1,
0.4752458, -0.318996, 3.362682, 0.2588235, 0, 1, 1,
0.4823973, 0.2629287, 1.095292, 0.2666667, 0, 1, 1,
0.4833145, 0.6204129, 1.127202, 0.2705882, 0, 1, 1,
0.4913701, -0.692389, 3.364815, 0.2784314, 0, 1, 1,
0.4924894, 0.7493324, 0.5486892, 0.282353, 0, 1, 1,
0.505933, -2.391289, 2.329732, 0.2901961, 0, 1, 1,
0.5116981, 0.3336138, 0.6532385, 0.2941177, 0, 1, 1,
0.5145034, -0.4140435, 3.129237, 0.3019608, 0, 1, 1,
0.5168065, 1.747935, 1.533341, 0.3098039, 0, 1, 1,
0.5174167, -2.046829, 2.821467, 0.3137255, 0, 1, 1,
0.5191013, -0.5961952, 2.456676, 0.3215686, 0, 1, 1,
0.5252618, -1.611858, 1.388099, 0.3254902, 0, 1, 1,
0.526273, -0.1929467, 1.985512, 0.3333333, 0, 1, 1,
0.5303483, 0.7143289, 1.171744, 0.3372549, 0, 1, 1,
0.5350077, 1.28012, 0.7995224, 0.345098, 0, 1, 1,
0.5497373, -1.409584, 2.55781, 0.3490196, 0, 1, 1,
0.5505253, -1.251698, 0.8380287, 0.3568628, 0, 1, 1,
0.5519211, -0.7935535, 2.266284, 0.3607843, 0, 1, 1,
0.5538481, 1.64257, 1.509365, 0.3686275, 0, 1, 1,
0.5642709, 0.8544889, 1.060358, 0.372549, 0, 1, 1,
0.5675521, -0.5830619, 0.6732829, 0.3803922, 0, 1, 1,
0.5709285, -0.1143166, 2.129763, 0.3843137, 0, 1, 1,
0.5730382, 0.06843402, 0.5368708, 0.3921569, 0, 1, 1,
0.5738888, -1.276704, 2.903331, 0.3960784, 0, 1, 1,
0.5773401, 1.278707, 0.3834937, 0.4039216, 0, 1, 1,
0.5775653, 0.1349323, 2.624283, 0.4117647, 0, 1, 1,
0.5799412, 1.502846, -0.2961185, 0.4156863, 0, 1, 1,
0.5812079, 0.1293465, 0.7705246, 0.4235294, 0, 1, 1,
0.5825285, -0.02877735, 2.538627, 0.427451, 0, 1, 1,
0.5888083, -0.1200666, 3.709934, 0.4352941, 0, 1, 1,
0.5944208, -1.101325, 0.7881121, 0.4392157, 0, 1, 1,
0.5947377, 0.7235678, -0.2238912, 0.4470588, 0, 1, 1,
0.5950065, 0.4016994, 0.2246455, 0.4509804, 0, 1, 1,
0.5951942, 0.09940838, 2.726655, 0.4588235, 0, 1, 1,
0.5960997, 0.8062968, -1.820646, 0.4627451, 0, 1, 1,
0.5974426, -1.216069, 3.472753, 0.4705882, 0, 1, 1,
0.6066709, -0.609448, 1.557042, 0.4745098, 0, 1, 1,
0.6068849, -0.6229612, 2.527233, 0.4823529, 0, 1, 1,
0.6197825, -1.39171, 3.938212, 0.4862745, 0, 1, 1,
0.6207047, 0.8356141, 0.1260142, 0.4941176, 0, 1, 1,
0.6261632, 0.4220161, 0.6289676, 0.5019608, 0, 1, 1,
0.6285221, -0.0253148, 1.569131, 0.5058824, 0, 1, 1,
0.6290615, 0.5958706, 1.410414, 0.5137255, 0, 1, 1,
0.6337578, -1.058026, 2.432798, 0.5176471, 0, 1, 1,
0.6340377, -0.257021, 1.48373, 0.5254902, 0, 1, 1,
0.6370608, -0.3676606, 1.987573, 0.5294118, 0, 1, 1,
0.6437961, 2.253902, 1.335909, 0.5372549, 0, 1, 1,
0.6611332, -0.2633677, 0.5504302, 0.5411765, 0, 1, 1,
0.6638138, -1.525075, 1.999273, 0.5490196, 0, 1, 1,
0.6650413, -0.6360746, 1.215713, 0.5529412, 0, 1, 1,
0.6672795, 0.9977024, -0.3957696, 0.5607843, 0, 1, 1,
0.6703606, 0.250856, 0.7482389, 0.5647059, 0, 1, 1,
0.6711552, -1.161162, 1.179563, 0.572549, 0, 1, 1,
0.6734568, 0.5037751, 0.1969067, 0.5764706, 0, 1, 1,
0.6829596, -1.061641, 1.493808, 0.5843138, 0, 1, 1,
0.6858355, -3.011745, 3.16381, 0.5882353, 0, 1, 1,
0.690929, -0.6461353, 2.467169, 0.5960785, 0, 1, 1,
0.6919493, -0.6636231, 1.081396, 0.6039216, 0, 1, 1,
0.6943548, 1.316229, 1.395829, 0.6078432, 0, 1, 1,
0.7020039, -0.2049007, 3.303091, 0.6156863, 0, 1, 1,
0.7032126, 1.126188, 0.02891871, 0.6196079, 0, 1, 1,
0.7089536, 0.3372896, 1.102776, 0.627451, 0, 1, 1,
0.7097486, -0.7615983, 2.5346, 0.6313726, 0, 1, 1,
0.712914, -0.1169575, 1.570734, 0.6392157, 0, 1, 1,
0.7142106, -1.0259, 1.232426, 0.6431373, 0, 1, 1,
0.715894, -0.01179077, 2.491798, 0.6509804, 0, 1, 1,
0.7164006, -0.243469, 0.2793613, 0.654902, 0, 1, 1,
0.7259518, -0.6218882, 1.18484, 0.6627451, 0, 1, 1,
0.7310728, 0.3072181, 0.1760468, 0.6666667, 0, 1, 1,
0.7476333, -0.5292436, 2.853152, 0.6745098, 0, 1, 1,
0.7494256, -0.2022326, 1.579249, 0.6784314, 0, 1, 1,
0.7494615, -0.07523053, 3.673969, 0.6862745, 0, 1, 1,
0.7516442, -0.2941039, 2.876975, 0.6901961, 0, 1, 1,
0.7521896, -0.3669658, 2.755039, 0.6980392, 0, 1, 1,
0.7537863, -0.7815493, 3.919912, 0.7058824, 0, 1, 1,
0.7624045, 0.3369651, -1.194584, 0.7098039, 0, 1, 1,
0.7708519, -0.7012131, 2.161011, 0.7176471, 0, 1, 1,
0.7732142, 0.9270313, 1.191434, 0.7215686, 0, 1, 1,
0.7791038, -0.8360037, 1.977169, 0.7294118, 0, 1, 1,
0.7813407, 1.051219, 0.28032, 0.7333333, 0, 1, 1,
0.7881769, -0.09441929, 0.5269959, 0.7411765, 0, 1, 1,
0.8007443, 1.24862, 1.956783, 0.7450981, 0, 1, 1,
0.8027276, -0.6229188, 1.757596, 0.7529412, 0, 1, 1,
0.8028291, -1.604109, 2.195974, 0.7568628, 0, 1, 1,
0.8122044, 0.2603382, 2.246021, 0.7647059, 0, 1, 1,
0.8126765, 1.026155, 0.3640864, 0.7686275, 0, 1, 1,
0.8180959, -2.171877, 2.539563, 0.7764706, 0, 1, 1,
0.8182134, 0.5806729, -0.527332, 0.7803922, 0, 1, 1,
0.8184785, 1.040231, 0.3972401, 0.7882353, 0, 1, 1,
0.8209099, 0.9521981, 0.2659658, 0.7921569, 0, 1, 1,
0.8246645, 1.105844, 0.3058057, 0.8, 0, 1, 1,
0.8318364, 0.9292409, 0.3070692, 0.8078431, 0, 1, 1,
0.8320545, 0.5887967, 0.8089431, 0.8117647, 0, 1, 1,
0.8426732, 0.8080734, 0.09403802, 0.8196079, 0, 1, 1,
0.8427576, -1.220312, 3.263256, 0.8235294, 0, 1, 1,
0.8457361, 0.2698269, 2.267657, 0.8313726, 0, 1, 1,
0.8504601, -0.1290573, 3.039055, 0.8352941, 0, 1, 1,
0.8521389, 0.384745, -0.1363239, 0.8431373, 0, 1, 1,
0.8552641, 0.4031616, 0.8688275, 0.8470588, 0, 1, 1,
0.8553349, 0.2351481, 1.674699, 0.854902, 0, 1, 1,
0.8557124, -0.9106108, 2.840248, 0.8588235, 0, 1, 1,
0.8557767, 0.2525699, 1.288593, 0.8666667, 0, 1, 1,
0.8575748, -0.6451769, 2.138653, 0.8705882, 0, 1, 1,
0.8579679, 1.746917, 0.424453, 0.8784314, 0, 1, 1,
0.8660597, 0.1727755, 2.427635, 0.8823529, 0, 1, 1,
0.8683097, 1.613272, 0.996951, 0.8901961, 0, 1, 1,
0.871657, -0.6119525, 3.453193, 0.8941177, 0, 1, 1,
0.8729044, -1.410003, 2.059134, 0.9019608, 0, 1, 1,
0.8791704, 1.31764, 0.8773614, 0.9098039, 0, 1, 1,
0.8821613, 2.480427, 0.8570488, 0.9137255, 0, 1, 1,
0.8881997, 1.967853, 1.503602, 0.9215686, 0, 1, 1,
0.8936306, 1.351494, 1.549611, 0.9254902, 0, 1, 1,
0.8952034, -0.8343507, 3.089375, 0.9333333, 0, 1, 1,
0.8958815, 0.4846818, 1.303919, 0.9372549, 0, 1, 1,
0.904739, -0.9607264, 3.099925, 0.945098, 0, 1, 1,
0.9052844, 0.4872389, 2.248606, 0.9490196, 0, 1, 1,
0.9057797, 1.303224, 0.101795, 0.9568627, 0, 1, 1,
0.9148681, -0.01550139, 1.299069, 0.9607843, 0, 1, 1,
0.918139, 0.4581309, 0.2528515, 0.9686275, 0, 1, 1,
0.9217496, -0.1000602, 3.591909, 0.972549, 0, 1, 1,
0.9219449, 0.184645, 1.869787, 0.9803922, 0, 1, 1,
0.9245345, 2.102753, 1.323745, 0.9843137, 0, 1, 1,
0.9283002, -0.006071745, 1.958489, 0.9921569, 0, 1, 1,
0.9292085, -0.3607773, 3.206169, 0.9960784, 0, 1, 1,
0.933005, -2.393737, 2.94051, 1, 0, 0.9960784, 1,
0.9380682, -0.4138371, 1.270335, 1, 0, 0.9882353, 1,
0.9480387, 0.2807736, 1.309984, 1, 0, 0.9843137, 1,
0.9493905, -0.003018395, 3.193574, 1, 0, 0.9764706, 1,
0.9501011, 0.7503512, 1.245542, 1, 0, 0.972549, 1,
0.9510106, -0.5996419, 0.8592832, 1, 0, 0.9647059, 1,
0.9532839, -3.006679, 2.010784, 1, 0, 0.9607843, 1,
0.9682699, -0.4928335, 2.295572, 1, 0, 0.9529412, 1,
0.9704597, -1.00367, 2.326144, 1, 0, 0.9490196, 1,
0.9738485, 0.05789606, -0.4526312, 1, 0, 0.9411765, 1,
0.978918, 0.3637682, 1.541119, 1, 0, 0.9372549, 1,
0.9799125, 1.632979, 1.216746, 1, 0, 0.9294118, 1,
0.9951213, 0.6762658, -0.32442, 1, 0, 0.9254902, 1,
1.000313, 1.067152, 0.873825, 1, 0, 0.9176471, 1,
1.003566, 0.8810197, 0.6456991, 1, 0, 0.9137255, 1,
1.003865, -0.3617059, 2.810161, 1, 0, 0.9058824, 1,
1.007355, 0.3127043, 1.034247, 1, 0, 0.9019608, 1,
1.011108, 0.3028719, 0.7771986, 1, 0, 0.8941177, 1,
1.018901, -0.4287767, 2.579096, 1, 0, 0.8862745, 1,
1.037272, -1.000539, 1.68083, 1, 0, 0.8823529, 1,
1.038033, 0.806278, 0.9944254, 1, 0, 0.8745098, 1,
1.04018, -0.1002273, 0.7433082, 1, 0, 0.8705882, 1,
1.045205, -0.9419655, 2.462679, 1, 0, 0.8627451, 1,
1.047078, -0.07791758, 1.410573, 1, 0, 0.8588235, 1,
1.050786, -1.287106, 2.82029, 1, 0, 0.8509804, 1,
1.056081, 1.603075, 0.433789, 1, 0, 0.8470588, 1,
1.056601, 0.05323467, 0.9057862, 1, 0, 0.8392157, 1,
1.056983, 0.5813609, 3.26532, 1, 0, 0.8352941, 1,
1.061819, 0.02120801, 1.769338, 1, 0, 0.827451, 1,
1.063205, 0.3555235, 2.620467, 1, 0, 0.8235294, 1,
1.063938, -0.01002617, 1.858196, 1, 0, 0.8156863, 1,
1.069155, 0.4497088, 0.2757798, 1, 0, 0.8117647, 1,
1.078159, 1.668706, 0.258508, 1, 0, 0.8039216, 1,
1.082731, -0.4016674, 1.001785, 1, 0, 0.7960784, 1,
1.084361, 0.9759886, 0.8298305, 1, 0, 0.7921569, 1,
1.093348, 0.3698251, 1.029911, 1, 0, 0.7843137, 1,
1.097262, -1.005725, 2.633063, 1, 0, 0.7803922, 1,
1.102839, 2.092264, 0.4084513, 1, 0, 0.772549, 1,
1.103284, -0.7184714, 1.911391, 1, 0, 0.7686275, 1,
1.113379, 0.181455, 0.5454536, 1, 0, 0.7607843, 1,
1.113527, 0.7972143, 2.11238, 1, 0, 0.7568628, 1,
1.125121, -1.167278, 1.646294, 1, 0, 0.7490196, 1,
1.134943, -0.7834752, 1.583945, 1, 0, 0.7450981, 1,
1.139623, -0.4094306, -0.6570153, 1, 0, 0.7372549, 1,
1.171384, 0.6391569, 1.7322, 1, 0, 0.7333333, 1,
1.176018, -0.6093591, 2.94752, 1, 0, 0.7254902, 1,
1.176872, -1.75803, 4.405439, 1, 0, 0.7215686, 1,
1.187378, 0.3837782, 0.1103399, 1, 0, 0.7137255, 1,
1.191786, 1.460916, 2.497584, 1, 0, 0.7098039, 1,
1.199365, -0.5615568, 1.846259, 1, 0, 0.7019608, 1,
1.20831, -0.5378774, 2.33555, 1, 0, 0.6941177, 1,
1.208906, -0.1389329, 1.260518, 1, 0, 0.6901961, 1,
1.213461, 0.7792817, 2.58773, 1, 0, 0.682353, 1,
1.213884, -0.6291144, 2.01177, 1, 0, 0.6784314, 1,
1.233455, 1.319224, 0.5070511, 1, 0, 0.6705883, 1,
1.240753, -1.248738, 2.544616, 1, 0, 0.6666667, 1,
1.245324, -0.287494, 1.079409, 1, 0, 0.6588235, 1,
1.249255, -0.01263881, 1.405663, 1, 0, 0.654902, 1,
1.250407, 1.006253, 0.9565716, 1, 0, 0.6470588, 1,
1.255543, 0.8120127, 2.240442, 1, 0, 0.6431373, 1,
1.263707, 0.1283749, 2.514045, 1, 0, 0.6352941, 1,
1.264979, -0.2789244, 2.061946, 1, 0, 0.6313726, 1,
1.268356, -0.03538178, 1.126935, 1, 0, 0.6235294, 1,
1.270224, -0.393079, 0.9884195, 1, 0, 0.6196079, 1,
1.271813, 2.303827, -0.6871561, 1, 0, 0.6117647, 1,
1.286433, 0.05899879, 1.105382, 1, 0, 0.6078432, 1,
1.322833, -1.185728, 3.671592, 1, 0, 0.6, 1,
1.324898, 1.345455, -0.395982, 1, 0, 0.5921569, 1,
1.329848, -0.720327, 0.9507504, 1, 0, 0.5882353, 1,
1.330702, -0.1089231, 1.443331, 1, 0, 0.5803922, 1,
1.34269, 1.587403, 0.798161, 1, 0, 0.5764706, 1,
1.34523, -1.056454, 3.547452, 1, 0, 0.5686275, 1,
1.35915, -1.750707, 2.41695, 1, 0, 0.5647059, 1,
1.360108, 0.6341842, 0.9504055, 1, 0, 0.5568628, 1,
1.362459, -0.1334734, 0.3492738, 1, 0, 0.5529412, 1,
1.36253, 0.3258274, 0.3457833, 1, 0, 0.5450981, 1,
1.375676, -0.7854205, 2.427719, 1, 0, 0.5411765, 1,
1.384684, -2.054097, 2.66405, 1, 0, 0.5333334, 1,
1.389323, 2.346112, 1.188279, 1, 0, 0.5294118, 1,
1.401349, -0.546165, 2.412046, 1, 0, 0.5215687, 1,
1.407359, 0.3987481, -0.3594817, 1, 0, 0.5176471, 1,
1.408454, -0.03524904, 0.510854, 1, 0, 0.509804, 1,
1.411889, -0.5239334, 2.394993, 1, 0, 0.5058824, 1,
1.413688, 0.6811343, 1.122829, 1, 0, 0.4980392, 1,
1.429831, 1.421553, 1.363708, 1, 0, 0.4901961, 1,
1.440403, -1.292245, 3.102239, 1, 0, 0.4862745, 1,
1.465353, 0.8458506, 1.939126, 1, 0, 0.4784314, 1,
1.465651, -1.057303, 3.461391, 1, 0, 0.4745098, 1,
1.472989, -0.2281162, 1.046478, 1, 0, 0.4666667, 1,
1.492756, 0.8669252, 0.09707353, 1, 0, 0.4627451, 1,
1.497393, -0.04252507, 2.996605, 1, 0, 0.454902, 1,
1.498979, 0.2039991, 2.015709, 1, 0, 0.4509804, 1,
1.512045, 0.07735384, 2.675083, 1, 0, 0.4431373, 1,
1.534417, 0.7853647, -0.6152472, 1, 0, 0.4392157, 1,
1.559638, 1.831643, -0.3000517, 1, 0, 0.4313726, 1,
1.565127, -0.1868033, 2.172045, 1, 0, 0.427451, 1,
1.56964, -0.5016219, 0.6310513, 1, 0, 0.4196078, 1,
1.576185, -1.417754, 1.897056, 1, 0, 0.4156863, 1,
1.581905, 0.1863641, 1.920623, 1, 0, 0.4078431, 1,
1.591345, -0.5286592, 1.366542, 1, 0, 0.4039216, 1,
1.596148, 0.9730847, 0.9689838, 1, 0, 0.3960784, 1,
1.608153, -0.6569263, 2.686749, 1, 0, 0.3882353, 1,
1.618533, 1.048873, -1.353485, 1, 0, 0.3843137, 1,
1.620884, 1.370948, 0.395422, 1, 0, 0.3764706, 1,
1.653446, -1.366725, 2.014084, 1, 0, 0.372549, 1,
1.659279, -2.040965, 1.35094, 1, 0, 0.3647059, 1,
1.675141, 1.095366, 0.8258292, 1, 0, 0.3607843, 1,
1.677921, -0.6061193, 2.567366, 1, 0, 0.3529412, 1,
1.680363, 2.556982, 0.6989854, 1, 0, 0.3490196, 1,
1.715603, -0.2049857, 1.86879, 1, 0, 0.3411765, 1,
1.722393, 0.1267845, 1.686676, 1, 0, 0.3372549, 1,
1.726967, -1.478267, 2.715536, 1, 0, 0.3294118, 1,
1.727167, 0.03576906, 1.124275, 1, 0, 0.3254902, 1,
1.73032, 0.5992978, 0.790917, 1, 0, 0.3176471, 1,
1.734246, -0.2781076, 1.702198, 1, 0, 0.3137255, 1,
1.747927, -1.075939, 2.274901, 1, 0, 0.3058824, 1,
1.75107, -0.7692291, 1.833876, 1, 0, 0.2980392, 1,
1.757842, -1.718469, 2.403818, 1, 0, 0.2941177, 1,
1.783614, -0.9665312, 1.097955, 1, 0, 0.2862745, 1,
1.788835, 0.1670148, 3.463457, 1, 0, 0.282353, 1,
1.805721, -1.404923, 3.353034, 1, 0, 0.2745098, 1,
1.81936, -0.3438205, 0.09228098, 1, 0, 0.2705882, 1,
1.824322, -0.2951041, 0.9044622, 1, 0, 0.2627451, 1,
1.836451, -0.4242657, 3.3467, 1, 0, 0.2588235, 1,
1.859521, -0.02280527, 1.544899, 1, 0, 0.2509804, 1,
1.893279, 0.3327978, 1.355517, 1, 0, 0.2470588, 1,
1.898015, -0.3902175, 2.136868, 1, 0, 0.2392157, 1,
1.928811, 0.3240628, 1.256556, 1, 0, 0.2352941, 1,
1.937592, -0.6823264, 2.211588, 1, 0, 0.227451, 1,
1.956924, 0.5053678, 0.6792059, 1, 0, 0.2235294, 1,
1.960004, 0.5849955, 4.099418, 1, 0, 0.2156863, 1,
1.990357, 0.2254178, 0.3990692, 1, 0, 0.2117647, 1,
2.002404, -0.08198514, 1.270087, 1, 0, 0.2039216, 1,
2.023386, -0.3867558, 2.190289, 1, 0, 0.1960784, 1,
2.029169, 1.211828, 0.2745576, 1, 0, 0.1921569, 1,
2.047166, -0.6741204, 1.549472, 1, 0, 0.1843137, 1,
2.057201, -0.2554242, 0.8671586, 1, 0, 0.1803922, 1,
2.059923, 1.394824, 0.6744526, 1, 0, 0.172549, 1,
2.070515, -0.2257825, 2.44584, 1, 0, 0.1686275, 1,
2.087852, 1.500062, 0.9908441, 1, 0, 0.1607843, 1,
2.090982, -1.42161, 2.840846, 1, 0, 0.1568628, 1,
2.091149, 0.382496, 1.043605, 1, 0, 0.1490196, 1,
2.093083, -0.9409171, 2.214889, 1, 0, 0.145098, 1,
2.115233, 1.335072, 0.4691944, 1, 0, 0.1372549, 1,
2.142834, 1.028032, 1.73104, 1, 0, 0.1333333, 1,
2.182267, 1.728561, 1.161753, 1, 0, 0.1254902, 1,
2.192655, 1.12403, 1.151542, 1, 0, 0.1215686, 1,
2.210773, -1.649, 2.088332, 1, 0, 0.1137255, 1,
2.211439, 0.008901063, 1.576731, 1, 0, 0.1098039, 1,
2.23213, 1.763988, -0.2288231, 1, 0, 0.1019608, 1,
2.238622, -0.6884866, 2.453165, 1, 0, 0.09411765, 1,
2.274432, -0.4239016, 1.263104, 1, 0, 0.09019608, 1,
2.310204, -0.7729816, 3.236542, 1, 0, 0.08235294, 1,
2.360983, 0.7217236, 2.129619, 1, 0, 0.07843138, 1,
2.405086, 1.695914, 0.8845314, 1, 0, 0.07058824, 1,
2.407049, 1.405335, -0.3008619, 1, 0, 0.06666667, 1,
2.514169, 0.8539015, 2.276481, 1, 0, 0.05882353, 1,
2.544678, 0.8010057, 1.033652, 1, 0, 0.05490196, 1,
2.58614, -1.332456, 2.483432, 1, 0, 0.04705882, 1,
2.633726, -0.3208812, 1.403924, 1, 0, 0.04313726, 1,
2.678143, -0.730546, 2.857416, 1, 0, 0.03529412, 1,
2.701167, 1.122557, 2.655481, 1, 0, 0.03137255, 1,
2.753321, 0.7186176, -0.2168193, 1, 0, 0.02352941, 1,
2.939945, 0.5132211, 1.380039, 1, 0, 0.01960784, 1,
2.961544, -0.358182, 1.254765, 1, 0, 0.01176471, 1,
3.767935, -0.1141168, 1.936772, 1, 0, 0.007843138, 1
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
-0.0369215, -4.784675, -6.66881, 0, -0.5, 0.5, 0.5,
-0.0369215, -4.784675, -6.66881, 1, -0.5, 0.5, 0.5,
-0.0369215, -4.784675, -6.66881, 1, 1.5, 0.5, 0.5,
-0.0369215, -4.784675, -6.66881, 0, 1.5, 0.5, 0.5
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
-5.131625, 0.01100314, -6.66881, 0, -0.5, 0.5, 0.5,
-5.131625, 0.01100314, -6.66881, 1, -0.5, 0.5, 0.5,
-5.131625, 0.01100314, -6.66881, 1, 1.5, 0.5, 0.5,
-5.131625, 0.01100314, -6.66881, 0, 1.5, 0.5, 0.5
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
-5.131625, -4.784675, 0.2747521, 0, -0.5, 0.5, 0.5,
-5.131625, -4.784675, 0.2747521, 1, -0.5, 0.5, 0.5,
-5.131625, -4.784675, 0.2747521, 1, 1.5, 0.5, 0.5,
-5.131625, -4.784675, 0.2747521, 0, 1.5, 0.5, 0.5
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
-2, -3.67798, -5.06645,
2, -3.67798, -5.06645,
-2, -3.67798, -5.06645,
-2, -3.862429, -5.333509,
0, -3.67798, -5.06645,
0, -3.862429, -5.333509,
2, -3.67798, -5.06645,
2, -3.862429, -5.333509
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
-2, -4.231328, -5.86763, 0, -0.5, 0.5, 0.5,
-2, -4.231328, -5.86763, 1, -0.5, 0.5, 0.5,
-2, -4.231328, -5.86763, 1, 1.5, 0.5, 0.5,
-2, -4.231328, -5.86763, 0, 1.5, 0.5, 0.5,
0, -4.231328, -5.86763, 0, -0.5, 0.5, 0.5,
0, -4.231328, -5.86763, 1, -0.5, 0.5, 0.5,
0, -4.231328, -5.86763, 1, 1.5, 0.5, 0.5,
0, -4.231328, -5.86763, 0, 1.5, 0.5, 0.5,
2, -4.231328, -5.86763, 0, -0.5, 0.5, 0.5,
2, -4.231328, -5.86763, 1, -0.5, 0.5, 0.5,
2, -4.231328, -5.86763, 1, 1.5, 0.5, 0.5,
2, -4.231328, -5.86763, 0, 1.5, 0.5, 0.5
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
-3.955924, -2, -5.06645,
-3.955924, 2, -5.06645,
-3.955924, -2, -5.06645,
-4.151874, -2, -5.333509,
-3.955924, 0, -5.06645,
-4.151874, 0, -5.333509,
-3.955924, 2, -5.06645,
-4.151874, 2, -5.333509
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
-4.543774, -2, -5.86763, 0, -0.5, 0.5, 0.5,
-4.543774, -2, -5.86763, 1, -0.5, 0.5, 0.5,
-4.543774, -2, -5.86763, 1, 1.5, 0.5, 0.5,
-4.543774, -2, -5.86763, 0, 1.5, 0.5, 0.5,
-4.543774, 0, -5.86763, 0, -0.5, 0.5, 0.5,
-4.543774, 0, -5.86763, 1, -0.5, 0.5, 0.5,
-4.543774, 0, -5.86763, 1, 1.5, 0.5, 0.5,
-4.543774, 0, -5.86763, 0, 1.5, 0.5, 0.5,
-4.543774, 2, -5.86763, 0, -0.5, 0.5, 0.5,
-4.543774, 2, -5.86763, 1, -0.5, 0.5, 0.5,
-4.543774, 2, -5.86763, 1, 1.5, 0.5, 0.5,
-4.543774, 2, -5.86763, 0, 1.5, 0.5, 0.5
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
-3.955924, -3.67798, -4,
-3.955924, -3.67798, 4,
-3.955924, -3.67798, -4,
-4.151874, -3.862429, -4,
-3.955924, -3.67798, -2,
-4.151874, -3.862429, -2,
-3.955924, -3.67798, 0,
-4.151874, -3.862429, 0,
-3.955924, -3.67798, 2,
-4.151874, -3.862429, 2,
-3.955924, -3.67798, 4,
-4.151874, -3.862429, 4
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
-4.543774, -4.231328, -4, 0, -0.5, 0.5, 0.5,
-4.543774, -4.231328, -4, 1, -0.5, 0.5, 0.5,
-4.543774, -4.231328, -4, 1, 1.5, 0.5, 0.5,
-4.543774, -4.231328, -4, 0, 1.5, 0.5, 0.5,
-4.543774, -4.231328, -2, 0, -0.5, 0.5, 0.5,
-4.543774, -4.231328, -2, 1, -0.5, 0.5, 0.5,
-4.543774, -4.231328, -2, 1, 1.5, 0.5, 0.5,
-4.543774, -4.231328, -2, 0, 1.5, 0.5, 0.5,
-4.543774, -4.231328, 0, 0, -0.5, 0.5, 0.5,
-4.543774, -4.231328, 0, 1, -0.5, 0.5, 0.5,
-4.543774, -4.231328, 0, 1, 1.5, 0.5, 0.5,
-4.543774, -4.231328, 0, 0, 1.5, 0.5, 0.5,
-4.543774, -4.231328, 2, 0, -0.5, 0.5, 0.5,
-4.543774, -4.231328, 2, 1, -0.5, 0.5, 0.5,
-4.543774, -4.231328, 2, 1, 1.5, 0.5, 0.5,
-4.543774, -4.231328, 2, 0, 1.5, 0.5, 0.5,
-4.543774, -4.231328, 4, 0, -0.5, 0.5, 0.5,
-4.543774, -4.231328, 4, 1, -0.5, 0.5, 0.5,
-4.543774, -4.231328, 4, 1, 1.5, 0.5, 0.5,
-4.543774, -4.231328, 4, 0, 1.5, 0.5, 0.5
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
-3.955924, -3.67798, -5.06645,
-3.955924, 3.699986, -5.06645,
-3.955924, -3.67798, 5.615954,
-3.955924, 3.699986, 5.615954,
-3.955924, -3.67798, -5.06645,
-3.955924, -3.67798, 5.615954,
-3.955924, 3.699986, -5.06645,
-3.955924, 3.699986, 5.615954,
-3.955924, -3.67798, -5.06645,
3.882081, -3.67798, -5.06645,
-3.955924, -3.67798, 5.615954,
3.882081, -3.67798, 5.615954,
-3.955924, 3.699986, -5.06645,
3.882081, 3.699986, -5.06645,
-3.955924, 3.699986, 5.615954,
3.882081, 3.699986, 5.615954,
3.882081, -3.67798, -5.06645,
3.882081, 3.699986, -5.06645,
3.882081, -3.67798, 5.615954,
3.882081, 3.699986, 5.615954,
3.882081, -3.67798, -5.06645,
3.882081, -3.67798, 5.615954,
3.882081, 3.699986, -5.06645,
3.882081, 3.699986, 5.615954
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
var radius = 8.097908;
var distance = 36.02851;
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
mvMatrix.translate( 0.0369215, -0.01100314, -0.2747521 );
mvMatrix.scale( 1.117072, 1.186725, 0.8196298 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.02851);
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
quizalofop-P-tefuryl<-read.table("quizalofop-P-tefuryl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quizalofop-P-tefuryl$V2
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
y<-quizalofop-P-tefuryl$V3
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
z<-quizalofop-P-tefuryl$V4
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
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
-3.841778, -0.1984473, -1.769358, 0, 0, 1, 1, 1,
-2.831084, -1.712072, -1.901665, 1, 0, 0, 1, 1,
-2.694963, -0.4833702, -2.200744, 1, 0, 0, 1, 1,
-2.471482, -1.013316, -4.384807, 1, 0, 0, 1, 1,
-2.453248, 1.15919, 0.2882914, 1, 0, 0, 1, 1,
-2.372815, -0.7108233, -1.978119, 1, 0, 0, 1, 1,
-2.278107, 0.9097036, -1.415514, 0, 0, 0, 1, 1,
-2.273829, -1.650807, -4.490237, 0, 0, 0, 1, 1,
-2.239027, 0.1552763, -0.702542, 0, 0, 0, 1, 1,
-2.236948, 0.7192817, 1.190803, 0, 0, 0, 1, 1,
-2.21993, -0.132141, -1.669411, 0, 0, 0, 1, 1,
-2.178776, -0.6093208, -1.195645, 0, 0, 0, 1, 1,
-2.172026, 0.353485, -1.318305, 0, 0, 0, 1, 1,
-2.171868, -0.4772835, -2.710728, 1, 1, 1, 1, 1,
-2.104475, -2.80122, -2.813944, 1, 1, 1, 1, 1,
-2.092612, 2.534111, -1.801316, 1, 1, 1, 1, 1,
-2.058183, 0.1372122, -2.021695, 1, 1, 1, 1, 1,
-2.040964, -2.600922, -1.980768, 1, 1, 1, 1, 1,
-2.038348, -0.6039581, -3.514455, 1, 1, 1, 1, 1,
-2.010567, -1.010277, -2.724277, 1, 1, 1, 1, 1,
-1.992955, 0.4564009, -0.4366536, 1, 1, 1, 1, 1,
-1.975046, 0.004526454, -0.8483264, 1, 1, 1, 1, 1,
-1.965595, -1.856675, -3.985736, 1, 1, 1, 1, 1,
-1.963053, 0.3174739, -1.388647, 1, 1, 1, 1, 1,
-1.955521, -1.603557, -2.845213, 1, 1, 1, 1, 1,
-1.953653, 0.8639864, -2.523791, 1, 1, 1, 1, 1,
-1.920349, 0.151671, -1.841352, 1, 1, 1, 1, 1,
-1.913971, -1.501822, -0.8571544, 1, 1, 1, 1, 1,
-1.9058, 1.261843, -0.5441887, 0, 0, 1, 1, 1,
-1.875104, 2.587689, 1.450429, 1, 0, 0, 1, 1,
-1.773652, 0.8295451, -1.054422, 1, 0, 0, 1, 1,
-1.75786, -0.1659382, -1.926028, 1, 0, 0, 1, 1,
-1.754193, 0.4539594, -2.182169, 1, 0, 0, 1, 1,
-1.753113, 0.399305, -0.910403, 1, 0, 0, 1, 1,
-1.751852, -0.6433319, -2.474488, 0, 0, 0, 1, 1,
-1.749227, -0.05206021, -1.998063, 0, 0, 0, 1, 1,
-1.741056, 0.1279895, -2.634481, 0, 0, 0, 1, 1,
-1.734284, -0.6136273, -0.7994968, 0, 0, 0, 1, 1,
-1.706769, -0.3010143, -0.486548, 0, 0, 0, 1, 1,
-1.692918, 0.02602664, -0.110237, 0, 0, 0, 1, 1,
-1.689912, -0.1399315, 1.204049, 0, 0, 0, 1, 1,
-1.679476, -0.712843, -1.144901, 1, 1, 1, 1, 1,
-1.67359, -0.004824651, -2.267809, 1, 1, 1, 1, 1,
-1.672882, -1.110995, -2.707599, 1, 1, 1, 1, 1,
-1.666163, -0.4289145, -0.1722618, 1, 1, 1, 1, 1,
-1.663762, -0.6606532, -0.5501222, 1, 1, 1, 1, 1,
-1.658278, 0.8835387, -2.022033, 1, 1, 1, 1, 1,
-1.654013, -0.05857626, -1.848747, 1, 1, 1, 1, 1,
-1.650642, -0.4289438, -1.034117, 1, 1, 1, 1, 1,
-1.638518, -1.036551, -1.918432, 1, 1, 1, 1, 1,
-1.617896, -0.4809455, -1.276373, 1, 1, 1, 1, 1,
-1.609286, -0.1369386, 0.7733915, 1, 1, 1, 1, 1,
-1.591836, 0.5207802, -1.320031, 1, 1, 1, 1, 1,
-1.578069, -0.5258913, -0.2955154, 1, 1, 1, 1, 1,
-1.572539, -0.5563568, -0.9419343, 1, 1, 1, 1, 1,
-1.565001, 0.5191534, -0.5770667, 1, 1, 1, 1, 1,
-1.557955, -0.9905154, -0.4274965, 0, 0, 1, 1, 1,
-1.531918, 0.8563052, -2.498916, 1, 0, 0, 1, 1,
-1.508767, -0.1956715, -2.262641, 1, 0, 0, 1, 1,
-1.506688, 0.2779799, -2.147077, 1, 0, 0, 1, 1,
-1.49805, -1.022807, -2.803743, 1, 0, 0, 1, 1,
-1.495784, 2.492373, -1.721702, 1, 0, 0, 1, 1,
-1.492752, -0.6013017, -0.5652868, 0, 0, 0, 1, 1,
-1.488766, -0.2603651, -2.506967, 0, 0, 0, 1, 1,
-1.483693, 0.172178, -3.042409, 0, 0, 0, 1, 1,
-1.476759, 0.3107665, -3.289093, 0, 0, 0, 1, 1,
-1.473318, -0.2939135, -0.4838084, 0, 0, 0, 1, 1,
-1.460649, 1.39938, -0.6992621, 0, 0, 0, 1, 1,
-1.457615, -0.0265895, 0.8097807, 0, 0, 0, 1, 1,
-1.445379, -0.455194, -3.925091, 1, 1, 1, 1, 1,
-1.438674, -1.27906, -2.593857, 1, 1, 1, 1, 1,
-1.436995, 1.703323, -2.54093, 1, 1, 1, 1, 1,
-1.434839, 0.3877852, -0.4508221, 1, 1, 1, 1, 1,
-1.433719, -1.209622, -2.427408, 1, 1, 1, 1, 1,
-1.414266, -0.2930029, -2.536807, 1, 1, 1, 1, 1,
-1.365612, -0.2202308, -0.8288581, 1, 1, 1, 1, 1,
-1.358023, 0.4546185, -2.192086, 1, 1, 1, 1, 1,
-1.349663, 1.166412, -1.188548, 1, 1, 1, 1, 1,
-1.3446, 0.2586529, -2.050754, 1, 1, 1, 1, 1,
-1.343364, -2.420744, -1.835794, 1, 1, 1, 1, 1,
-1.32795, 1.235819, -0.2115901, 1, 1, 1, 1, 1,
-1.326519, -0.815926, -2.632554, 1, 1, 1, 1, 1,
-1.32397, 0.9843733, -0.8194975, 1, 1, 1, 1, 1,
-1.302105, 0.8738379, -0.5558015, 1, 1, 1, 1, 1,
-1.289236, -0.3390889, -0.8624018, 0, 0, 1, 1, 1,
-1.274459, -0.665081, -2.63916, 1, 0, 0, 1, 1,
-1.269019, 0.1537867, -0.1638031, 1, 0, 0, 1, 1,
-1.266565, 2.369893, -1.202624, 1, 0, 0, 1, 1,
-1.25396, 1.227956, -1.924403, 1, 0, 0, 1, 1,
-1.245554, -1.412858, -0.5227555, 1, 0, 0, 1, 1,
-1.244616, -0.7173708, -2.323566, 0, 0, 0, 1, 1,
-1.242108, -1.260473, -2.838567, 0, 0, 0, 1, 1,
-1.23489, -0.3883934, -2.622716, 0, 0, 0, 1, 1,
-1.234389, 0.545141, -1.205584, 0, 0, 0, 1, 1,
-1.216173, -1.231552, -0.1605816, 0, 0, 0, 1, 1,
-1.216163, -0.9225175, -2.571389, 0, 0, 0, 1, 1,
-1.215113, -0.1525609, -1.7464, 0, 0, 0, 1, 1,
-1.211287, 0.05321241, -0.6958454, 1, 1, 1, 1, 1,
-1.209988, 0.1522489, -2.663026, 1, 1, 1, 1, 1,
-1.20959, 2.024963, -0.7314717, 1, 1, 1, 1, 1,
-1.203489, -0.9495589, -0.4834561, 1, 1, 1, 1, 1,
-1.193621, -0.9999852, -2.226385, 1, 1, 1, 1, 1,
-1.186867, 0.9443593, -0.4489675, 1, 1, 1, 1, 1,
-1.172335, 1.351391, -0.4812942, 1, 1, 1, 1, 1,
-1.172232, 1.435952, -1.922133, 1, 1, 1, 1, 1,
-1.165569, 2.907844, -0.2890718, 1, 1, 1, 1, 1,
-1.156882, 0.8509635, 0.823305, 1, 1, 1, 1, 1,
-1.156048, -0.2858387, -0.9038537, 1, 1, 1, 1, 1,
-1.15359, -0.2016561, -1.896818, 1, 1, 1, 1, 1,
-1.151902, -0.397375, -1.122533, 1, 1, 1, 1, 1,
-1.144503, -1.022863, -2.940059, 1, 1, 1, 1, 1,
-1.135157, 1.312918, -1.058419, 1, 1, 1, 1, 1,
-1.127702, 0.54084, -2.582893, 0, 0, 1, 1, 1,
-1.117087, -1.525427, -2.842299, 1, 0, 0, 1, 1,
-1.11172, 1.014789, 0.4038534, 1, 0, 0, 1, 1,
-1.111379, -0.02019849, -0.5450199, 1, 0, 0, 1, 1,
-1.110186, 1.564461, -1.380246, 1, 0, 0, 1, 1,
-1.1101, -0.7924789, -0.1968248, 1, 0, 0, 1, 1,
-1.109515, -0.9857188, -2.09008, 0, 0, 0, 1, 1,
-1.10933, -0.1049742, -1.04282, 0, 0, 0, 1, 1,
-1.107428, -0.2617657, -2.023419, 0, 0, 0, 1, 1,
-1.099896, -0.6354998, -1.669307, 0, 0, 0, 1, 1,
-1.096177, 0.4208043, -1.012323, 0, 0, 0, 1, 1,
-1.096092, 0.4492514, -1.429864, 0, 0, 0, 1, 1,
-1.087732, -1.547085, -2.889458, 0, 0, 0, 1, 1,
-1.087348, 0.2390043, 0.2418395, 1, 1, 1, 1, 1,
-1.082214, -0.1996877, -1.121424, 1, 1, 1, 1, 1,
-1.077731, -0.3333273, -1.107416, 1, 1, 1, 1, 1,
-1.073053, -0.3345582, -2.491305, 1, 1, 1, 1, 1,
-1.071913, 0.4108551, -1.328624, 1, 1, 1, 1, 1,
-1.067729, -0.02947935, -2.086339, 1, 1, 1, 1, 1,
-1.065039, 0.6080338, -0.07925384, 1, 1, 1, 1, 1,
-1.063605, 0.06014042, -2.230565, 1, 1, 1, 1, 1,
-1.062414, 1.13077, -1.355315, 1, 1, 1, 1, 1,
-1.060035, 0.9546331, -0.06708314, 1, 1, 1, 1, 1,
-1.059508, 0.1606703, -1.967046, 1, 1, 1, 1, 1,
-1.05833, 0.1880901, -3.128154, 1, 1, 1, 1, 1,
-1.049857, 0.7440748, -0.1090066, 1, 1, 1, 1, 1,
-1.048079, 1.51013, 0.01840776, 1, 1, 1, 1, 1,
-1.038077, 1.630703, -0.4790507, 1, 1, 1, 1, 1,
-1.035115, 0.4773873, -2.531212, 0, 0, 1, 1, 1,
-1.032525, -0.4473679, -1.881562, 1, 0, 0, 1, 1,
-1.030148, 0.5821757, -1.597162, 1, 0, 0, 1, 1,
-1.029368, 0.3152132, 1.038552, 1, 0, 0, 1, 1,
-1.027737, -0.3863981, -0.6407081, 1, 0, 0, 1, 1,
-1.022316, 0.8592635, -1.83523, 1, 0, 0, 1, 1,
-1.021003, 1.281342, -0.5634968, 0, 0, 0, 1, 1,
-1.017663, 0.4852231, -2.395512, 0, 0, 0, 1, 1,
-1.013655, -0.8939722, -2.465594, 0, 0, 0, 1, 1,
-1.007036, -0.1702713, -2.99562, 0, 0, 0, 1, 1,
-1.002311, -1.388281, -1.371192, 0, 0, 0, 1, 1,
-0.9994025, 0.07172197, -1.099716, 0, 0, 0, 1, 1,
-0.9991736, -1.018681, -2.790982, 0, 0, 0, 1, 1,
-0.9916015, -0.6328783, -2.019241, 1, 1, 1, 1, 1,
-0.984222, 0.7136773, -0.06419311, 1, 1, 1, 1, 1,
-0.9840006, 3.062453, -0.8657854, 1, 1, 1, 1, 1,
-0.9830861, 0.2354437, -1.240409, 1, 1, 1, 1, 1,
-0.9811735, -0.1982289, -1.340923, 1, 1, 1, 1, 1,
-0.9790987, 0.5840811, -0.07238994, 1, 1, 1, 1, 1,
-0.9694434, -0.5240142, -3.359868, 1, 1, 1, 1, 1,
-0.964515, 0.4020748, -2.409991, 1, 1, 1, 1, 1,
-0.9575032, -0.07098967, -1.558629, 1, 1, 1, 1, 1,
-0.9509196, -0.4946671, -1.161602, 1, 1, 1, 1, 1,
-0.9369038, -0.08719912, -2.138667, 1, 1, 1, 1, 1,
-0.9325791, -0.6237728, -3.323876, 1, 1, 1, 1, 1,
-0.929346, -1.3191, -2.605749, 1, 1, 1, 1, 1,
-0.9258621, -1.014924, -2.917141, 1, 1, 1, 1, 1,
-0.9201549, -0.9958627, -3.697917, 1, 1, 1, 1, 1,
-0.9143931, -0.1202233, -3.317861, 0, 0, 1, 1, 1,
-0.9130009, 1.246215, -1.040938, 1, 0, 0, 1, 1,
-0.9110996, 0.3884849, -0.8158432, 1, 0, 0, 1, 1,
-0.9076525, 0.443632, -1.445349, 1, 0, 0, 1, 1,
-0.9062914, 0.0620045, -2.709915, 1, 0, 0, 1, 1,
-0.9062021, -2.248289, -1.054613, 1, 0, 0, 1, 1,
-0.9016196, -2.054473, -2.21936, 0, 0, 0, 1, 1,
-0.8961999, 1.363307, 0.2375892, 0, 0, 0, 1, 1,
-0.8913603, -0.4775753, -1.687997, 0, 0, 0, 1, 1,
-0.8911676, 0.9149675, -0.2331421, 0, 0, 0, 1, 1,
-0.8899333, 0.1055578, -0.374279, 0, 0, 0, 1, 1,
-0.8871484, -0.3529125, -2.618005, 0, 0, 0, 1, 1,
-0.8867211, -1.873375, -2.07559, 0, 0, 0, 1, 1,
-0.8837931, 0.7053975, -0.8391522, 1, 1, 1, 1, 1,
-0.8821079, 1.736086, -0.3523315, 1, 1, 1, 1, 1,
-0.8791679, 0.6426159, -2.031116, 1, 1, 1, 1, 1,
-0.877907, -0.7333772, -2.545053, 1, 1, 1, 1, 1,
-0.8775214, -0.6687117, -3.093716, 1, 1, 1, 1, 1,
-0.8759824, 0.2477323, -2.206344, 1, 1, 1, 1, 1,
-0.8712398, 0.5738709, -2.582987, 1, 1, 1, 1, 1,
-0.8706452, 1.076182, -1.124586, 1, 1, 1, 1, 1,
-0.8663069, -0.9553891, -3.639984, 1, 1, 1, 1, 1,
-0.8659434, 0.7676883, -0.5240793, 1, 1, 1, 1, 1,
-0.8652763, 1.102447, -1.315477, 1, 1, 1, 1, 1,
-0.8651239, 1.021995, -0.2404777, 1, 1, 1, 1, 1,
-0.8613634, -0.1369351, -0.9127752, 1, 1, 1, 1, 1,
-0.8541911, -3.147999, -3.365156, 1, 1, 1, 1, 1,
-0.8505486, -0.3047564, -3.266736, 1, 1, 1, 1, 1,
-0.838271, 0.1322426, -1.268145, 0, 0, 1, 1, 1,
-0.8359677, 0.3748434, -1.903676, 1, 0, 0, 1, 1,
-0.8356912, -0.819324, -3.069167, 1, 0, 0, 1, 1,
-0.8275576, -1.46478, -3.021346, 1, 0, 0, 1, 1,
-0.8272044, -0.6021491, -2.16579, 1, 0, 0, 1, 1,
-0.8261693, 0.4225979, -0.7821699, 1, 0, 0, 1, 1,
-0.8184416, -0.2288255, -2.47666, 0, 0, 0, 1, 1,
-0.817213, -0.1094642, -0.7746837, 0, 0, 0, 1, 1,
-0.8149859, -0.8804784, -1.876379, 0, 0, 0, 1, 1,
-0.8147607, 2.112448, -1.330448, 0, 0, 0, 1, 1,
-0.801667, 1.054684, -0.9661657, 0, 0, 0, 1, 1,
-0.7948202, 0.8973935, -0.4900175, 0, 0, 0, 1, 1,
-0.7947799, -0.4469781, -2.398433, 0, 0, 0, 1, 1,
-0.7946672, -0.7596344, -1.872236, 1, 1, 1, 1, 1,
-0.7945829, -0.457885, -1.573794, 1, 1, 1, 1, 1,
-0.7924233, 0.9800172, 0.00349932, 1, 1, 1, 1, 1,
-0.7910094, 0.8517539, -1.438915, 1, 1, 1, 1, 1,
-0.7884195, 0.7059539, 0.5255519, 1, 1, 1, 1, 1,
-0.7872702, 0.6792637, -2.321779, 1, 1, 1, 1, 1,
-0.7831038, 0.6961403, -2.506144, 1, 1, 1, 1, 1,
-0.7805983, 0.7352867, -0.8000592, 1, 1, 1, 1, 1,
-0.7799398, -1.414393, -1.510781, 1, 1, 1, 1, 1,
-0.7794262, 2.423846, 1.404751, 1, 1, 1, 1, 1,
-0.7779868, -0.5997415, -1.819527, 1, 1, 1, 1, 1,
-0.7766309, -0.25688, -2.547115, 1, 1, 1, 1, 1,
-0.7713515, -0.1099283, -2.627955, 1, 1, 1, 1, 1,
-0.7696, 1.264359, -1.01672, 1, 1, 1, 1, 1,
-0.7683804, -1.559315, -4.477518, 1, 1, 1, 1, 1,
-0.767581, 1.512209, -0.5624865, 0, 0, 1, 1, 1,
-0.7662227, 0.5702431, -1.600986, 1, 0, 0, 1, 1,
-0.765596, 1.585429, -0.5845863, 1, 0, 0, 1, 1,
-0.7650821, 1.235647, 1.147301, 1, 0, 0, 1, 1,
-0.758239, -0.3420679, -2.012192, 1, 0, 0, 1, 1,
-0.7526498, 0.3188872, -2.363348, 1, 0, 0, 1, 1,
-0.7525209, 1.579751, -1.307268, 0, 0, 0, 1, 1,
-0.7519594, 1.067156, -0.01886701, 0, 0, 0, 1, 1,
-0.7498199, -1.755358, -2.480891, 0, 0, 0, 1, 1,
-0.7475373, 0.1201053, -2.520428, 0, 0, 0, 1, 1,
-0.7372814, 0.03462039, -2.685187, 0, 0, 0, 1, 1,
-0.7341502, -2.037572, -2.211716, 0, 0, 0, 1, 1,
-0.7275511, 0.2396724, -3.38012, 0, 0, 0, 1, 1,
-0.7268438, -0.9654552, -1.102729, 1, 1, 1, 1, 1,
-0.7207395, -0.9039644, -3.196965, 1, 1, 1, 1, 1,
-0.7178503, 1.032201, -1.653321, 1, 1, 1, 1, 1,
-0.7161611, 0.412347, -0.6211355, 1, 1, 1, 1, 1,
-0.714222, -1.332134, -1.343176, 1, 1, 1, 1, 1,
-0.712745, -1.18978, -2.069534, 1, 1, 1, 1, 1,
-0.7036668, -0.7196046, -2.29461, 1, 1, 1, 1, 1,
-0.7004308, 0.1068712, -1.776691, 1, 1, 1, 1, 1,
-0.6999729, -0.6741391, -0.05051703, 1, 1, 1, 1, 1,
-0.6992596, 0.302831, -2.551614, 1, 1, 1, 1, 1,
-0.6983806, 0.6145599, 1.327125, 1, 1, 1, 1, 1,
-0.6943234, 0.007676379, -1.744699, 1, 1, 1, 1, 1,
-0.6911007, -1.126681, -2.247228, 1, 1, 1, 1, 1,
-0.6902243, 2.412377, 1.30615, 1, 1, 1, 1, 1,
-0.6890241, 0.3080872, -3.079754, 1, 1, 1, 1, 1,
-0.6845737, -0.5423906, -1.113415, 0, 0, 1, 1, 1,
-0.6784443, 1.972851, -1.900635, 1, 0, 0, 1, 1,
-0.6770611, 1.069166, 0.1133726, 1, 0, 0, 1, 1,
-0.6765968, 1.176759, 1.029181, 1, 0, 0, 1, 1,
-0.6765018, 1.221011, -0.1339055, 1, 0, 0, 1, 1,
-0.6715248, 1.288456, 0.430794, 1, 0, 0, 1, 1,
-0.6695385, 0.5217302, -0.9066, 0, 0, 0, 1, 1,
-0.6645082, 0.4083133, -1.566571, 0, 0, 0, 1, 1,
-0.6604939, -0.2824327, -3.246093, 0, 0, 0, 1, 1,
-0.6584507, -0.7154952, -4.183572, 0, 0, 0, 1, 1,
-0.6575243, 0.3411129, -1.88154, 0, 0, 0, 1, 1,
-0.6565548, -0.7998575, -2.147256, 0, 0, 0, 1, 1,
-0.6564104, -0.1299593, -2.203237, 0, 0, 0, 1, 1,
-0.6557119, 0.5531307, 0.9795723, 1, 1, 1, 1, 1,
-0.6546152, 0.5712028, -0.7124187, 1, 1, 1, 1, 1,
-0.6538028, -0.03415596, -1.735746, 1, 1, 1, 1, 1,
-0.6525033, 0.6382536, -0.5118386, 1, 1, 1, 1, 1,
-0.6450677, -0.315149, -2.511032, 1, 1, 1, 1, 1,
-0.644735, -1.107999, -3.263732, 1, 1, 1, 1, 1,
-0.6413549, -0.8356986, -0.5615448, 1, 1, 1, 1, 1,
-0.6403149, 0.1821916, -1.89235, 1, 1, 1, 1, 1,
-0.6383485, -2.974204, -3.34858, 1, 1, 1, 1, 1,
-0.636836, 0.6605991, -0.2802672, 1, 1, 1, 1, 1,
-0.6364731, 1.135442, -0.9039426, 1, 1, 1, 1, 1,
-0.6339225, 0.9662747, 0.02007784, 1, 1, 1, 1, 1,
-0.6333963, -1.435226, -2.418425, 1, 1, 1, 1, 1,
-0.6278692, 0.5091569, -0.07070098, 1, 1, 1, 1, 1,
-0.6238611, -0.4243338, -2.895784, 1, 1, 1, 1, 1,
-0.622913, -0.2625865, -1.750966, 0, 0, 1, 1, 1,
-0.6197147, 0.5166515, -0.1998187, 1, 0, 0, 1, 1,
-0.6191044, -1.533204, -2.908098, 1, 0, 0, 1, 1,
-0.6145254, -0.9414632, -1.577013, 1, 0, 0, 1, 1,
-0.6140968, 0.603139, 0.6106515, 1, 0, 0, 1, 1,
-0.6108055, 0.02646754, -2.787708, 1, 0, 0, 1, 1,
-0.6063862, 1.212733, -0.8255944, 0, 0, 0, 1, 1,
-0.6054279, -1.448133, 0.08832295, 0, 0, 0, 1, 1,
-0.5975907, 0.2632852, -0.9238248, 0, 0, 0, 1, 1,
-0.5949232, -1.395188, -1.635254, 0, 0, 0, 1, 1,
-0.5948492, 1.472777, -0.9454293, 0, 0, 0, 1, 1,
-0.5909401, -0.6920159, -2.446596, 0, 0, 0, 1, 1,
-0.586573, -0.5107884, -3.615989, 0, 0, 0, 1, 1,
-0.5854992, 0.3471216, -0.6234264, 1, 1, 1, 1, 1,
-0.580649, 0.0758006, -1.498928, 1, 1, 1, 1, 1,
-0.5803471, 0.3448966, -1.119678, 1, 1, 1, 1, 1,
-0.5802727, 1.125453, -1.733067, 1, 1, 1, 1, 1,
-0.5750993, -0.1463854, -1.244206, 1, 1, 1, 1, 1,
-0.5743441, 1.825874, 1.737812, 1, 1, 1, 1, 1,
-0.572369, 1.625588, -0.07003351, 1, 1, 1, 1, 1,
-0.570786, -1.269836, -1.199134, 1, 1, 1, 1, 1,
-0.5546157, 0.7391712, -0.2406251, 1, 1, 1, 1, 1,
-0.5542369, -0.6114455, -3.329406, 1, 1, 1, 1, 1,
-0.5528577, -1.576468, -3.452268, 1, 1, 1, 1, 1,
-0.5521498, 1.382854, 1.226042, 1, 1, 1, 1, 1,
-0.5512759, -1.938264, -3.057853, 1, 1, 1, 1, 1,
-0.5434825, -0.9864919, -2.066933, 1, 1, 1, 1, 1,
-0.541957, -0.08456269, -2.43314, 1, 1, 1, 1, 1,
-0.5410258, -1.352533, -3.783441, 0, 0, 1, 1, 1,
-0.5405232, 0.6587699, 0.6727736, 1, 0, 0, 1, 1,
-0.5396236, -3.570534, -2.619236, 1, 0, 0, 1, 1,
-0.5389389, 0.4795273, 0.2646115, 1, 0, 0, 1, 1,
-0.5333686, -0.8545722, -2.527648, 1, 0, 0, 1, 1,
-0.5266683, 0.5817758, -2.08064, 1, 0, 0, 1, 1,
-0.5257775, -1.169828, -2.85221, 0, 0, 0, 1, 1,
-0.5206817, 0.301646, -1.171933, 0, 0, 0, 1, 1,
-0.5093595, -0.9036759, -1.506375, 0, 0, 0, 1, 1,
-0.5018606, -0.6484672, -0.7213976, 0, 0, 0, 1, 1,
-0.4998877, 1.483261, 0.1322634, 0, 0, 0, 1, 1,
-0.497463, 1.70275, -1.484115, 0, 0, 0, 1, 1,
-0.4963647, -1.134948, -2.12897, 0, 0, 0, 1, 1,
-0.495644, -0.1112608, -3.445563, 1, 1, 1, 1, 1,
-0.4883965, -1.404924, -4.910881, 1, 1, 1, 1, 1,
-0.4856493, 0.4054062, -1.218642, 1, 1, 1, 1, 1,
-0.4804607, 0.738839, -0.967245, 1, 1, 1, 1, 1,
-0.4762689, 0.4824467, -2.037134, 1, 1, 1, 1, 1,
-0.4761437, 0.3082059, -0.6500597, 1, 1, 1, 1, 1,
-0.4754922, -1.179982, -2.272542, 1, 1, 1, 1, 1,
-0.4717016, -1.012468, -2.195188, 1, 1, 1, 1, 1,
-0.4546395, 0.07931171, -1.907487, 1, 1, 1, 1, 1,
-0.4469799, 1.993043, -0.7107648, 1, 1, 1, 1, 1,
-0.4459439, -1.305702, -2.076698, 1, 1, 1, 1, 1,
-0.43822, 0.2323299, -2.522997, 1, 1, 1, 1, 1,
-0.4354835, -1.19277, -2.361972, 1, 1, 1, 1, 1,
-0.4345845, -0.4244149, -2.492902, 1, 1, 1, 1, 1,
-0.4327404, -0.3338548, -0.9793969, 1, 1, 1, 1, 1,
-0.4302993, -1.252325, -3.849062, 0, 0, 1, 1, 1,
-0.429682, -0.1281694, -1.31741, 1, 0, 0, 1, 1,
-0.4284701, -0.4812112, -0.2842243, 1, 0, 0, 1, 1,
-0.4261174, 0.2754097, -3.197913, 1, 0, 0, 1, 1,
-0.4251551, 2.550008, -0.8564793, 1, 0, 0, 1, 1,
-0.4245042, 0.1589616, -2.746713, 1, 0, 0, 1, 1,
-0.4224583, -0.4731311, -1.226819, 0, 0, 0, 1, 1,
-0.4210374, 0.2262936, -2.992589, 0, 0, 0, 1, 1,
-0.4203075, 1.042725, -0.4446078, 0, 0, 0, 1, 1,
-0.4202286, -0.4009431, -1.801295, 0, 0, 0, 1, 1,
-0.4199646, -0.7153158, -1.590326, 0, 0, 0, 1, 1,
-0.419794, 0.9426398, 0.2757204, 0, 0, 0, 1, 1,
-0.4180976, 1.248167, 1.022397, 0, 0, 0, 1, 1,
-0.4154932, -1.222606, -2.448702, 1, 1, 1, 1, 1,
-0.4129747, 1.904322, -0.04056939, 1, 1, 1, 1, 1,
-0.4110082, -0.02861166, -2.943085, 1, 1, 1, 1, 1,
-0.4105506, 1.262761, -0.1675896, 1, 1, 1, 1, 1,
-0.4101504, 0.6204836, 1.36687, 1, 1, 1, 1, 1,
-0.4083598, -0.4737634, -2.545901, 1, 1, 1, 1, 1,
-0.4078125, 0.4988699, -1.394757, 1, 1, 1, 1, 1,
-0.4068467, 0.09482954, -2.623867, 1, 1, 1, 1, 1,
-0.4063205, 0.7965086, -1.609406, 1, 1, 1, 1, 1,
-0.4044707, 0.9263627, -1.849187, 1, 1, 1, 1, 1,
-0.4021292, 1.418933, 0.7981935, 1, 1, 1, 1, 1,
-0.4005308, -1.040872, -4.366166, 1, 1, 1, 1, 1,
-0.3892514, -2.057814, -3.280722, 1, 1, 1, 1, 1,
-0.3886746, 0.4932761, 1.51251, 1, 1, 1, 1, 1,
-0.3851219, 2.033851, -0.7319223, 1, 1, 1, 1, 1,
-0.3845783, 0.3541984, -1.430973, 0, 0, 1, 1, 1,
-0.3833898, -0.3125248, -1.128829, 1, 0, 0, 1, 1,
-0.3788282, -0.3661982, -3.116575, 1, 0, 0, 1, 1,
-0.3783615, -0.3507046, -3.368591, 1, 0, 0, 1, 1,
-0.3727291, 0.03115919, -1.727268, 1, 0, 0, 1, 1,
-0.3712196, -1.090523, -2.905126, 1, 0, 0, 1, 1,
-0.3661822, 0.01920918, -1.003092, 0, 0, 0, 1, 1,
-0.3650822, 0.4162247, -0.9113925, 0, 0, 0, 1, 1,
-0.358925, 1.339258, -0.6544955, 0, 0, 0, 1, 1,
-0.3579799, -0.6404446, -4.725862, 0, 0, 0, 1, 1,
-0.3528242, -0.8925036, -2.332789, 0, 0, 0, 1, 1,
-0.3508029, 0.4679782, -0.7436936, 0, 0, 0, 1, 1,
-0.3501469, 1.122078, 0.6187863, 0, 0, 0, 1, 1,
-0.3480659, -1.001388, -2.737839, 1, 1, 1, 1, 1,
-0.3452273, 0.6447816, 1.057138, 1, 1, 1, 1, 1,
-0.3413217, 0.8126348, -1.246895, 1, 1, 1, 1, 1,
-0.3410164, -0.157427, -1.668534, 1, 1, 1, 1, 1,
-0.3382668, -0.158866, -1.612863, 1, 1, 1, 1, 1,
-0.3325588, -0.1317252, -1.06626, 1, 1, 1, 1, 1,
-0.3258584, 0.2626202, -1.816486, 1, 1, 1, 1, 1,
-0.3249856, -0.45314, -2.353729, 1, 1, 1, 1, 1,
-0.3210488, 1.055341, -0.4225201, 1, 1, 1, 1, 1,
-0.3134686, -0.2284475, -1.677213, 1, 1, 1, 1, 1,
-0.3114052, 1.220566, -1.269755, 1, 1, 1, 1, 1,
-0.3112676, 1.562675, 1.232759, 1, 1, 1, 1, 1,
-0.3063565, 0.6488256, 0.342262, 1, 1, 1, 1, 1,
-0.3047024, -0.7396216, -2.103407, 1, 1, 1, 1, 1,
-0.3029174, -0.5081459, -1.719454, 1, 1, 1, 1, 1,
-0.3008416, -1.476127, -3.289208, 0, 0, 1, 1, 1,
-0.3003774, 1.599873, -0.7001745, 1, 0, 0, 1, 1,
-0.2995779, -2.028471, -0.8556346, 1, 0, 0, 1, 1,
-0.2926435, -0.03033791, -1.68988, 1, 0, 0, 1, 1,
-0.2856027, -0.08955811, -1.825965, 1, 0, 0, 1, 1,
-0.2780047, -0.369456, -3.021823, 1, 0, 0, 1, 1,
-0.2708983, 1.180701, 1.054261, 0, 0, 0, 1, 1,
-0.2699563, 0.2048116, -0.4626258, 0, 0, 0, 1, 1,
-0.2683893, 0.01541186, -0.9583999, 0, 0, 0, 1, 1,
-0.2683336, -0.24283, -2.398063, 0, 0, 0, 1, 1,
-0.2683004, 2.74248, -1.012034, 0, 0, 0, 1, 1,
-0.2634384, -1.760697, -3.437184, 0, 0, 0, 1, 1,
-0.2631938, -0.9240441, -3.835708, 0, 0, 0, 1, 1,
-0.2615784, -0.210118, -2.059102, 1, 1, 1, 1, 1,
-0.2600905, -0.1626773, -1.756988, 1, 1, 1, 1, 1,
-0.2597764, 1.299936, 2.124082, 1, 1, 1, 1, 1,
-0.2564483, 0.6806463, -1.543762, 1, 1, 1, 1, 1,
-0.2558154, -0.2105398, -2.968401, 1, 1, 1, 1, 1,
-0.2551458, -0.9061989, -2.585497, 1, 1, 1, 1, 1,
-0.2491478, -0.5096005, -1.020476, 1, 1, 1, 1, 1,
-0.2476839, -0.6743768, -1.740031, 1, 1, 1, 1, 1,
-0.245296, -0.754347, -1.558003, 1, 1, 1, 1, 1,
-0.245058, -0.3421492, -3.659831, 1, 1, 1, 1, 1,
-0.2435421, 0.03391964, -3.414942, 1, 1, 1, 1, 1,
-0.2381659, 0.6219845, -0.313452, 1, 1, 1, 1, 1,
-0.2351016, 0.9608843, 0.4140883, 1, 1, 1, 1, 1,
-0.2331768, -0.07414633, -4.272916, 1, 1, 1, 1, 1,
-0.2299267, -0.4573062, -0.2243173, 1, 1, 1, 1, 1,
-0.2294157, -0.7760641, -2.839282, 0, 0, 1, 1, 1,
-0.2282789, -0.847632, -2.872247, 1, 0, 0, 1, 1,
-0.2278407, -1.158656, -2.940406, 1, 0, 0, 1, 1,
-0.2272209, 1.288595, -0.163571, 1, 0, 0, 1, 1,
-0.2249661, -0.7015268, -2.814632, 1, 0, 0, 1, 1,
-0.2233128, -0.04902209, -2.874922, 1, 0, 0, 1, 1,
-0.2162678, -0.279067, -1.800434, 0, 0, 0, 1, 1,
-0.2151756, -0.2964408, -2.433892, 0, 0, 0, 1, 1,
-0.2086942, -0.1872475, -2.703224, 0, 0, 0, 1, 1,
-0.1988729, -1.205534, -3.37741, 0, 0, 0, 1, 1,
-0.1981279, -0.1106758, -2.8918, 0, 0, 0, 1, 1,
-0.1936561, 2.211897, -0.5488675, 0, 0, 0, 1, 1,
-0.1934844, 1.305618, 0.1831667, 0, 0, 0, 1, 1,
-0.190819, 0.5663037, -0.5858728, 1, 1, 1, 1, 1,
-0.1905794, -1.25009, -0.5322021, 1, 1, 1, 1, 1,
-0.1888142, 0.5361457, 0.005638695, 1, 1, 1, 1, 1,
-0.1884989, -0.1287373, -0.9500826, 1, 1, 1, 1, 1,
-0.1843408, 1.682925, -1.30092, 1, 1, 1, 1, 1,
-0.1825724, 0.5947832, -1.467762, 1, 1, 1, 1, 1,
-0.1824104, 0.4600319, -1.911328, 1, 1, 1, 1, 1,
-0.178421, 0.800631, 0.7180983, 1, 1, 1, 1, 1,
-0.1766528, 0.5143258, -0.4383187, 1, 1, 1, 1, 1,
-0.175857, -0.5372329, -2.819513, 1, 1, 1, 1, 1,
-0.1754745, -0.9986836, -0.8889211, 1, 1, 1, 1, 1,
-0.1738499, -0.96586, -2.410797, 1, 1, 1, 1, 1,
-0.1735758, 0.2817565, -0.6830177, 1, 1, 1, 1, 1,
-0.1711447, -0.2244102, -3.349508, 1, 1, 1, 1, 1,
-0.1651564, 0.8416913, -0.6372975, 1, 1, 1, 1, 1,
-0.1615545, -0.5414963, -1.751454, 0, 0, 1, 1, 1,
-0.1595482, -0.3365745, -2.406513, 1, 0, 0, 1, 1,
-0.1538146, 0.1372857, -0.4835637, 1, 0, 0, 1, 1,
-0.1523941, -0.8796805, -3.758719, 1, 0, 0, 1, 1,
-0.1519167, -2.113303, -4.100244, 1, 0, 0, 1, 1,
-0.146467, 2.041217, -0.1221341, 1, 0, 0, 1, 1,
-0.1459362, -0.1378911, -2.207485, 0, 0, 0, 1, 1,
-0.1451025, 1.769041, -3.404898, 0, 0, 0, 1, 1,
-0.1432631, -0.31869, -1.648077, 0, 0, 0, 1, 1,
-0.1420336, -0.4948889, -2.31026, 0, 0, 0, 1, 1,
-0.141142, 1.381314, -1.138052, 0, 0, 0, 1, 1,
-0.132879, 0.662121, -0.9422876, 0, 0, 0, 1, 1,
-0.1327538, 0.5331756, 0.9613819, 0, 0, 0, 1, 1,
-0.1290276, 0.1780123, -1.921401, 1, 1, 1, 1, 1,
-0.1250156, -0.6569983, -1.943719, 1, 1, 1, 1, 1,
-0.124146, 1.510987, -2.327984, 1, 1, 1, 1, 1,
-0.1177752, 1.922695, -0.1921471, 1, 1, 1, 1, 1,
-0.1176802, -1.185264, -1.938026, 1, 1, 1, 1, 1,
-0.1175027, -0.532761, -2.201818, 1, 1, 1, 1, 1,
-0.1150681, 0.242935, -0.4973696, 1, 1, 1, 1, 1,
-0.1128357, -0.7276702, -2.931206, 1, 1, 1, 1, 1,
-0.1071177, 1.27036, 1.219769, 1, 1, 1, 1, 1,
-0.1064343, -0.6982719, -3.335171, 1, 1, 1, 1, 1,
-0.1058281, -0.920672, -4.452747, 1, 1, 1, 1, 1,
-0.1038657, 0.1906253, -1.307425, 1, 1, 1, 1, 1,
-0.1008482, -0.4724787, -3.633487, 1, 1, 1, 1, 1,
-0.1006988, 0.8436521, 0.02067963, 1, 1, 1, 1, 1,
-0.1003852, 0.2546121, -1.691644, 1, 1, 1, 1, 1,
-0.1003523, -1.110471, -3.521863, 0, 0, 1, 1, 1,
-0.09910964, 1.186404, 0.2004425, 1, 0, 0, 1, 1,
-0.09905531, -0.8289458, -1.960945, 1, 0, 0, 1, 1,
-0.09759833, 1.519086, -0.4388197, 1, 0, 0, 1, 1,
-0.09675311, 0.2608929, 0.3669836, 1, 0, 0, 1, 1,
-0.09525952, 0.2308079, 1.266311, 1, 0, 0, 1, 1,
-0.09180507, -0.2031705, -3.226158, 0, 0, 0, 1, 1,
-0.08758596, -0.2489865, -1.120534, 0, 0, 0, 1, 1,
-0.08680107, -1.661282, -3.016288, 0, 0, 0, 1, 1,
-0.08430975, -0.261222, -1.92842, 0, 0, 0, 1, 1,
-0.07877724, 2.013902, -1.775672, 0, 0, 0, 1, 1,
-0.0787249, 0.2736493, 0.02484249, 0, 0, 0, 1, 1,
-0.0781066, -0.1661296, -2.575162, 0, 0, 0, 1, 1,
-0.07727747, -0.4421067, -2.202674, 1, 1, 1, 1, 1,
-0.07662566, -0.2621375, -2.919819, 1, 1, 1, 1, 1,
-0.07583763, 0.9435146, -0.5234811, 1, 1, 1, 1, 1,
-0.07566801, 1.055267, 0.3670937, 1, 1, 1, 1, 1,
-0.07389809, 1.49105, 0.6054533, 1, 1, 1, 1, 1,
-0.06403496, 1.05117, 0.2042966, 1, 1, 1, 1, 1,
-0.06080271, 0.2864153, -0.5865676, 1, 1, 1, 1, 1,
-0.05922812, -0.913651, -2.980359, 1, 1, 1, 1, 1,
-0.05902554, 1.128501, 0.04747379, 1, 1, 1, 1, 1,
-0.05431513, 2.21803, -0.9893748, 1, 1, 1, 1, 1,
-0.0535062, -0.2243059, -2.792396, 1, 1, 1, 1, 1,
-0.05137746, -0.03336288, -1.463154, 1, 1, 1, 1, 1,
-0.04981286, 0.04960023, 1.478706, 1, 1, 1, 1, 1,
-0.04973121, -1.410457, -2.422026, 1, 1, 1, 1, 1,
-0.04964751, -0.6669351, -3.116485, 1, 1, 1, 1, 1,
-0.04875727, -0.1412037, -1.612047, 0, 0, 1, 1, 1,
-0.04771321, -0.7760848, -3.303839, 1, 0, 0, 1, 1,
-0.04524755, 0.0289662, -0.8383404, 1, 0, 0, 1, 1,
-0.04387478, 0.6431711, -2.925714, 1, 0, 0, 1, 1,
-0.04230229, 0.4346784, -1.929563, 1, 0, 0, 1, 1,
-0.03652246, 0.04687694, -0.2069456, 1, 0, 0, 1, 1,
-0.03625772, 1.523049, 0.8257692, 0, 0, 0, 1, 1,
-0.03490762, 2.248735, -0.1700334, 0, 0, 0, 1, 1,
-0.0340504, 1.071021, -1.129164, 0, 0, 0, 1, 1,
-0.03380536, 0.7768861, -1.916468, 0, 0, 0, 1, 1,
-0.02745184, -0.6338097, -2.873306, 0, 0, 0, 1, 1,
-0.02080842, 0.1236704, -0.3746563, 0, 0, 0, 1, 1,
-0.01247616, -0.4516734, -3.913631, 0, 0, 0, 1, 1,
-0.01181716, 1.424409, 0.5517047, 1, 1, 1, 1, 1,
-0.007463646, 0.4596565, 0.4531195, 1, 1, 1, 1, 1,
-0.006911817, 1.199135, -0.5487444, 1, 1, 1, 1, 1,
-0.005846933, 0.6984173, -0.2600122, 1, 1, 1, 1, 1,
-0.002068382, -1.455925, -3.730164, 1, 1, 1, 1, 1,
0.005963185, -1.795991, 2.406256, 1, 1, 1, 1, 1,
0.007519648, -0.2836088, 3.224138, 1, 1, 1, 1, 1,
0.01146392, -0.262964, 2.459021, 1, 1, 1, 1, 1,
0.01840742, -0.1741331, 3.444407, 1, 1, 1, 1, 1,
0.01936831, 2.530529, 0.985545, 1, 1, 1, 1, 1,
0.02245066, -1.58687, 2.74619, 1, 1, 1, 1, 1,
0.02336911, 0.2630124, -0.957208, 1, 1, 1, 1, 1,
0.02460376, -2.184145, 3.498425, 1, 1, 1, 1, 1,
0.02497266, -0.8371992, 3.099781, 1, 1, 1, 1, 1,
0.0261218, 0.5225054, -1.239203, 1, 1, 1, 1, 1,
0.02698474, -0.3370352, 2.40784, 0, 0, 1, 1, 1,
0.02775923, 0.4413857, -0.2657497, 1, 0, 0, 1, 1,
0.02873772, 1.203412, 1.536968, 1, 0, 0, 1, 1,
0.02988672, -1.284453, 4.548889, 1, 0, 0, 1, 1,
0.03050696, 0.1137259, 1.190556, 1, 0, 0, 1, 1,
0.03340558, 0.2456592, -0.3372048, 1, 0, 0, 1, 1,
0.03504053, 0.2062685, 0.3441899, 0, 0, 0, 1, 1,
0.03574725, 0.527083, -0.9757565, 0, 0, 0, 1, 1,
0.04013763, 1.201717, 0.006977525, 0, 0, 0, 1, 1,
0.04401375, 0.5179729, 1.045632, 0, 0, 0, 1, 1,
0.04582221, 0.7081193, -0.3817946, 0, 0, 0, 1, 1,
0.04855917, -0.8942134, 3.315769, 0, 0, 0, 1, 1,
0.04991277, 0.195529, 1.412553, 0, 0, 0, 1, 1,
0.05279746, -0.9431092, 3.741264, 1, 1, 1, 1, 1,
0.05997806, 0.4441557, 0.7752111, 1, 1, 1, 1, 1,
0.06058872, -0.3028733, 2.947642, 1, 1, 1, 1, 1,
0.06249692, 0.5524513, -0.3630032, 1, 1, 1, 1, 1,
0.07190456, 1.681457, -1.227239, 1, 1, 1, 1, 1,
0.07191897, 0.1204056, 3.794321, 1, 1, 1, 1, 1,
0.07266926, -1.505731, 2.506967, 1, 1, 1, 1, 1,
0.07379232, 1.087645, 2.069724, 1, 1, 1, 1, 1,
0.07636373, 1.161414, -0.8974964, 1, 1, 1, 1, 1,
0.07742799, -1.111473, 3.268006, 1, 1, 1, 1, 1,
0.0797162, -0.2941775, 3.139865, 1, 1, 1, 1, 1,
0.08252583, 0.6218765, -1.605131, 1, 1, 1, 1, 1,
0.08376902, -0.2221248, 2.091288, 1, 1, 1, 1, 1,
0.08654359, 1.204364, 0.8843048, 1, 1, 1, 1, 1,
0.089958, -0.1289824, 2.108702, 1, 1, 1, 1, 1,
0.09194563, 0.4629492, -0.2140765, 0, 0, 1, 1, 1,
0.09294733, 1.349157, -0.9800291, 1, 0, 0, 1, 1,
0.09524367, 0.1217171, 1.230813, 1, 0, 0, 1, 1,
0.1037752, -0.26497, 2.686367, 1, 0, 0, 1, 1,
0.1177164, 0.6894322, -0.5406245, 1, 0, 0, 1, 1,
0.1179891, 1.190887, 0.1702689, 1, 0, 0, 1, 1,
0.1241839, -1.054875, 2.653131, 0, 0, 0, 1, 1,
0.1278684, 0.4072399, -1.03571, 0, 0, 0, 1, 1,
0.1330006, 0.6574681, 1.384634, 0, 0, 0, 1, 1,
0.1360115, 1.037529, -0.8008686, 0, 0, 0, 1, 1,
0.1389997, 0.5866275, 1.103182, 0, 0, 0, 1, 1,
0.1394781, 0.7607998, 0.4926747, 0, 0, 0, 1, 1,
0.1429575, 0.6321715, -0.5167913, 0, 0, 0, 1, 1,
0.1429664, -0.04538089, 0.858221, 1, 1, 1, 1, 1,
0.1449417, -1.860557, 1.079459, 1, 1, 1, 1, 1,
0.1487075, 0.3065739, 2.409111, 1, 1, 1, 1, 1,
0.1521384, -1.19274, 1.758642, 1, 1, 1, 1, 1,
0.1527907, 0.6919903, 1.46489, 1, 1, 1, 1, 1,
0.1593158, -1.13395, 3.661278, 1, 1, 1, 1, 1,
0.1608284, -1.319977, 5.460385, 1, 1, 1, 1, 1,
0.1628701, 0.3120621, 0.449145, 1, 1, 1, 1, 1,
0.1637647, -1.831872, 4.29631, 1, 1, 1, 1, 1,
0.1665844, -1.702593, 4.152751, 1, 1, 1, 1, 1,
0.1669048, 0.4275532, -0.4253792, 1, 1, 1, 1, 1,
0.1706578, 0.8085555, 0.147156, 1, 1, 1, 1, 1,
0.1715266, 1.210707, 0.05348829, 1, 1, 1, 1, 1,
0.1830867, 1.678132, -0.9245047, 1, 1, 1, 1, 1,
0.1846089, 0.8027202, 2.129124, 1, 1, 1, 1, 1,
0.1864352, 1.699044, 0.3223137, 0, 0, 1, 1, 1,
0.188922, -0.3041184, 3.603264, 1, 0, 0, 1, 1,
0.1892431, 2.165195, -0.6884, 1, 0, 0, 1, 1,
0.1931051, 2.150995, -1.962912, 1, 0, 0, 1, 1,
0.1946692, 1.423623, -1.25167, 1, 0, 0, 1, 1,
0.1980398, -0.1515433, 1.240662, 1, 0, 0, 1, 1,
0.198349, -0.6762667, 1.615934, 0, 0, 0, 1, 1,
0.2060916, 1.296827, -1.22282, 0, 0, 0, 1, 1,
0.2076122, -0.7400478, 1.584813, 0, 0, 0, 1, 1,
0.2076543, -1.899974, 2.976003, 0, 0, 0, 1, 1,
0.2078125, -0.9711859, 1.834652, 0, 0, 0, 1, 1,
0.2124778, -0.4286047, 3.239121, 0, 0, 0, 1, 1,
0.2149824, -0.5241374, 2.97936, 0, 0, 0, 1, 1,
0.2158437, 0.4617983, 0.8834078, 1, 1, 1, 1, 1,
0.2160044, 0.7909346, -0.9594083, 1, 1, 1, 1, 1,
0.2178513, -0.767168, 3.623168, 1, 1, 1, 1, 1,
0.2188647, -1.446917, 4.488488, 1, 1, 1, 1, 1,
0.2191172, 3.59254, 0.5252476, 1, 1, 1, 1, 1,
0.2223921, -0.5662563, 3.398211, 1, 1, 1, 1, 1,
0.2245461, 0.9359127, 0.4359844, 1, 1, 1, 1, 1,
0.2246155, 0.1040632, -0.4025891, 1, 1, 1, 1, 1,
0.2324265, -1.651047, 2.707276, 1, 1, 1, 1, 1,
0.2327701, -0.8831681, 1.349591, 1, 1, 1, 1, 1,
0.2368597, 0.5073084, -0.1994836, 1, 1, 1, 1, 1,
0.2371047, 1.394845, -2.232942, 1, 1, 1, 1, 1,
0.2374373, 1.404936, -0.7903922, 1, 1, 1, 1, 1,
0.237822, -0.09134565, -0.6464424, 1, 1, 1, 1, 1,
0.2382592, -0.5230266, 3.599759, 1, 1, 1, 1, 1,
0.241284, 0.7415097, 0.1413684, 0, 0, 1, 1, 1,
0.2427496, -0.8636098, 1.079627, 1, 0, 0, 1, 1,
0.2495387, -0.4700254, 3.570524, 1, 0, 0, 1, 1,
0.2496974, -0.2089626, 4.071784, 1, 0, 0, 1, 1,
0.2515014, -0.7506996, 4.820681, 1, 0, 0, 1, 1,
0.2534162, 0.04723949, 1.358254, 1, 0, 0, 1, 1,
0.2562112, 0.3048056, 2.064334, 0, 0, 0, 1, 1,
0.2579475, -1.350281, 1.745695, 0, 0, 0, 1, 1,
0.2605229, -1.090265, 3.54613, 0, 0, 0, 1, 1,
0.2609665, 0.9501364, -0.6951939, 0, 0, 0, 1, 1,
0.2640314, 1.183672, 0.2617535, 0, 0, 0, 1, 1,
0.2643297, -0.02715081, 1.378351, 0, 0, 0, 1, 1,
0.2654745, 0.6168236, 0.4864008, 0, 0, 0, 1, 1,
0.2654973, 1.032134, 0.4768814, 1, 1, 1, 1, 1,
0.2666951, -1.201291, 1.940233, 1, 1, 1, 1, 1,
0.2679988, 1.270264, 1.893066, 1, 1, 1, 1, 1,
0.2712862, -0.3890495, 1.522397, 1, 1, 1, 1, 1,
0.271604, 1.317128, 0.3780941, 1, 1, 1, 1, 1,
0.2746882, -0.6774017, 2.946348, 1, 1, 1, 1, 1,
0.2843518, -0.7721027, 2.359602, 1, 1, 1, 1, 1,
0.2886302, 1.38569, 0.2924848, 1, 1, 1, 1, 1,
0.2888171, 0.8194688, -0.1584451, 1, 1, 1, 1, 1,
0.2891551, 2.99772, -2.799268, 1, 1, 1, 1, 1,
0.2906581, -0.3383268, 3.222154, 1, 1, 1, 1, 1,
0.2940971, 1.350928, -0.7605377, 1, 1, 1, 1, 1,
0.2952256, -0.7169915, 3.151972, 1, 1, 1, 1, 1,
0.2964352, -0.9082015, 2.398818, 1, 1, 1, 1, 1,
0.2970648, -0.1913861, 3.449191, 1, 1, 1, 1, 1,
0.2979701, -0.3382547, 0.5765516, 0, 0, 1, 1, 1,
0.3026657, 0.1217409, 1.999576, 1, 0, 0, 1, 1,
0.3034624, -0.205286, 1.522684, 1, 0, 0, 1, 1,
0.3037662, 1.211182, 0.6546183, 1, 0, 0, 1, 1,
0.3038776, 1.71955, -0.8425767, 1, 0, 0, 1, 1,
0.3060762, 0.04430102, 0.901389, 1, 0, 0, 1, 1,
0.3085284, -0.5149244, 2.972632, 0, 0, 0, 1, 1,
0.3100626, -0.2703654, 1.845602, 0, 0, 0, 1, 1,
0.3108647, 0.9619147, 0.4871573, 0, 0, 0, 1, 1,
0.3113194, 0.06358671, 0.9872284, 0, 0, 0, 1, 1,
0.3143402, 0.4197907, 0.3578149, 0, 0, 0, 1, 1,
0.3185518, 0.769021, 0.5859212, 0, 0, 0, 1, 1,
0.3193311, 1.241355, 0.5078512, 0, 0, 0, 1, 1,
0.3196819, -1.937345, 3.105335, 1, 1, 1, 1, 1,
0.3231635, 0.2051517, 1.079392, 1, 1, 1, 1, 1,
0.3243953, -0.4991869, 2.368552, 1, 1, 1, 1, 1,
0.325923, -0.1885101, 2.146777, 1, 1, 1, 1, 1,
0.3264415, 1.230217, 1.315841, 1, 1, 1, 1, 1,
0.3266638, -0.9312556, 0.7926769, 1, 1, 1, 1, 1,
0.3328273, 0.003404469, 3.439126, 1, 1, 1, 1, 1,
0.3351576, 0.8731575, -1.635886, 1, 1, 1, 1, 1,
0.3356565, 0.05597073, 2.385438, 1, 1, 1, 1, 1,
0.3381135, 0.4526717, 2.072574, 1, 1, 1, 1, 1,
0.3444466, -1.710364, 3.054896, 1, 1, 1, 1, 1,
0.3471013, 0.2284898, 4.39376, 1, 1, 1, 1, 1,
0.3486585, 0.7289528, 0.3785833, 1, 1, 1, 1, 1,
0.3499908, -0.1281337, 0.2229696, 1, 1, 1, 1, 1,
0.3544998, 1.084915, 1.128163, 1, 1, 1, 1, 1,
0.3565625, -1.393236, 2.169392, 0, 0, 1, 1, 1,
0.3580502, 0.05998036, 1.21151, 1, 0, 0, 1, 1,
0.3583063, 1.190284, 0.08059516, 1, 0, 0, 1, 1,
0.3586714, 1.692663, 0.2866045, 1, 0, 0, 1, 1,
0.3618115, -0.666056, 2.17147, 1, 0, 0, 1, 1,
0.3628121, -0.9476171, 3.139381, 1, 0, 0, 1, 1,
0.3635382, 0.2181361, 0.4455586, 0, 0, 0, 1, 1,
0.3672535, 0.01654849, 0.6983001, 0, 0, 0, 1, 1,
0.3673742, -0.2247641, 1.550519, 0, 0, 0, 1, 1,
0.3681648, -0.6465005, 1.829157, 0, 0, 0, 1, 1,
0.3684107, -1.063447, 2.673516, 0, 0, 0, 1, 1,
0.3702979, -0.3624703, 0.2700911, 0, 0, 0, 1, 1,
0.3752745, -1.622858, 4.053224, 0, 0, 0, 1, 1,
0.3754953, 0.7071856, 0.1847529, 1, 1, 1, 1, 1,
0.3787284, 0.4318087, -0.277092, 1, 1, 1, 1, 1,
0.3805977, 1.455826, -0.3407353, 1, 1, 1, 1, 1,
0.3855168, 1.439166, -0.08628528, 1, 1, 1, 1, 1,
0.3881463, -0.7016777, 4.22913, 1, 1, 1, 1, 1,
0.3988526, 0.8314392, 1.08934, 1, 1, 1, 1, 1,
0.3997147, 0.9225491, 0.6442179, 1, 1, 1, 1, 1,
0.4019971, 0.04776141, 0.6981871, 1, 1, 1, 1, 1,
0.4252773, 0.178123, 2.334507, 1, 1, 1, 1, 1,
0.4295688, 1.351697, -0.2712634, 1, 1, 1, 1, 1,
0.4324634, -1.59784, 2.635238, 1, 1, 1, 1, 1,
0.4331795, 0.1814963, 1.77713, 1, 1, 1, 1, 1,
0.4340812, -1.171292, 3.008794, 1, 1, 1, 1, 1,
0.4367865, -1.082574, 3.359504, 1, 1, 1, 1, 1,
0.4376313, 0.9246687, -0.7626163, 1, 1, 1, 1, 1,
0.4381253, 0.0938658, 2.972308, 0, 0, 1, 1, 1,
0.4413481, -1.11467, 0.8371404, 1, 0, 0, 1, 1,
0.4417072, -1.081723, 3.998142, 1, 0, 0, 1, 1,
0.4450971, 1.766225, 0.4685241, 1, 0, 0, 1, 1,
0.456062, 1.638333, 1.311831, 1, 0, 0, 1, 1,
0.4564237, 1.492023, 1.383088, 1, 0, 0, 1, 1,
0.4577203, -0.5893449, 2.384072, 0, 0, 0, 1, 1,
0.4643585, 0.2707676, 1.991653, 0, 0, 0, 1, 1,
0.4645123, -0.895777, 3.237222, 0, 0, 0, 1, 1,
0.4677655, -0.6371366, 4.227685, 0, 0, 0, 1, 1,
0.4752458, -0.318996, 3.362682, 0, 0, 0, 1, 1,
0.4823973, 0.2629287, 1.095292, 0, 0, 0, 1, 1,
0.4833145, 0.6204129, 1.127202, 0, 0, 0, 1, 1,
0.4913701, -0.692389, 3.364815, 1, 1, 1, 1, 1,
0.4924894, 0.7493324, 0.5486892, 1, 1, 1, 1, 1,
0.505933, -2.391289, 2.329732, 1, 1, 1, 1, 1,
0.5116981, 0.3336138, 0.6532385, 1, 1, 1, 1, 1,
0.5145034, -0.4140435, 3.129237, 1, 1, 1, 1, 1,
0.5168065, 1.747935, 1.533341, 1, 1, 1, 1, 1,
0.5174167, -2.046829, 2.821467, 1, 1, 1, 1, 1,
0.5191013, -0.5961952, 2.456676, 1, 1, 1, 1, 1,
0.5252618, -1.611858, 1.388099, 1, 1, 1, 1, 1,
0.526273, -0.1929467, 1.985512, 1, 1, 1, 1, 1,
0.5303483, 0.7143289, 1.171744, 1, 1, 1, 1, 1,
0.5350077, 1.28012, 0.7995224, 1, 1, 1, 1, 1,
0.5497373, -1.409584, 2.55781, 1, 1, 1, 1, 1,
0.5505253, -1.251698, 0.8380287, 1, 1, 1, 1, 1,
0.5519211, -0.7935535, 2.266284, 1, 1, 1, 1, 1,
0.5538481, 1.64257, 1.509365, 0, 0, 1, 1, 1,
0.5642709, 0.8544889, 1.060358, 1, 0, 0, 1, 1,
0.5675521, -0.5830619, 0.6732829, 1, 0, 0, 1, 1,
0.5709285, -0.1143166, 2.129763, 1, 0, 0, 1, 1,
0.5730382, 0.06843402, 0.5368708, 1, 0, 0, 1, 1,
0.5738888, -1.276704, 2.903331, 1, 0, 0, 1, 1,
0.5773401, 1.278707, 0.3834937, 0, 0, 0, 1, 1,
0.5775653, 0.1349323, 2.624283, 0, 0, 0, 1, 1,
0.5799412, 1.502846, -0.2961185, 0, 0, 0, 1, 1,
0.5812079, 0.1293465, 0.7705246, 0, 0, 0, 1, 1,
0.5825285, -0.02877735, 2.538627, 0, 0, 0, 1, 1,
0.5888083, -0.1200666, 3.709934, 0, 0, 0, 1, 1,
0.5944208, -1.101325, 0.7881121, 0, 0, 0, 1, 1,
0.5947377, 0.7235678, -0.2238912, 1, 1, 1, 1, 1,
0.5950065, 0.4016994, 0.2246455, 1, 1, 1, 1, 1,
0.5951942, 0.09940838, 2.726655, 1, 1, 1, 1, 1,
0.5960997, 0.8062968, -1.820646, 1, 1, 1, 1, 1,
0.5974426, -1.216069, 3.472753, 1, 1, 1, 1, 1,
0.6066709, -0.609448, 1.557042, 1, 1, 1, 1, 1,
0.6068849, -0.6229612, 2.527233, 1, 1, 1, 1, 1,
0.6197825, -1.39171, 3.938212, 1, 1, 1, 1, 1,
0.6207047, 0.8356141, 0.1260142, 1, 1, 1, 1, 1,
0.6261632, 0.4220161, 0.6289676, 1, 1, 1, 1, 1,
0.6285221, -0.0253148, 1.569131, 1, 1, 1, 1, 1,
0.6290615, 0.5958706, 1.410414, 1, 1, 1, 1, 1,
0.6337578, -1.058026, 2.432798, 1, 1, 1, 1, 1,
0.6340377, -0.257021, 1.48373, 1, 1, 1, 1, 1,
0.6370608, -0.3676606, 1.987573, 1, 1, 1, 1, 1,
0.6437961, 2.253902, 1.335909, 0, 0, 1, 1, 1,
0.6611332, -0.2633677, 0.5504302, 1, 0, 0, 1, 1,
0.6638138, -1.525075, 1.999273, 1, 0, 0, 1, 1,
0.6650413, -0.6360746, 1.215713, 1, 0, 0, 1, 1,
0.6672795, 0.9977024, -0.3957696, 1, 0, 0, 1, 1,
0.6703606, 0.250856, 0.7482389, 1, 0, 0, 1, 1,
0.6711552, -1.161162, 1.179563, 0, 0, 0, 1, 1,
0.6734568, 0.5037751, 0.1969067, 0, 0, 0, 1, 1,
0.6829596, -1.061641, 1.493808, 0, 0, 0, 1, 1,
0.6858355, -3.011745, 3.16381, 0, 0, 0, 1, 1,
0.690929, -0.6461353, 2.467169, 0, 0, 0, 1, 1,
0.6919493, -0.6636231, 1.081396, 0, 0, 0, 1, 1,
0.6943548, 1.316229, 1.395829, 0, 0, 0, 1, 1,
0.7020039, -0.2049007, 3.303091, 1, 1, 1, 1, 1,
0.7032126, 1.126188, 0.02891871, 1, 1, 1, 1, 1,
0.7089536, 0.3372896, 1.102776, 1, 1, 1, 1, 1,
0.7097486, -0.7615983, 2.5346, 1, 1, 1, 1, 1,
0.712914, -0.1169575, 1.570734, 1, 1, 1, 1, 1,
0.7142106, -1.0259, 1.232426, 1, 1, 1, 1, 1,
0.715894, -0.01179077, 2.491798, 1, 1, 1, 1, 1,
0.7164006, -0.243469, 0.2793613, 1, 1, 1, 1, 1,
0.7259518, -0.6218882, 1.18484, 1, 1, 1, 1, 1,
0.7310728, 0.3072181, 0.1760468, 1, 1, 1, 1, 1,
0.7476333, -0.5292436, 2.853152, 1, 1, 1, 1, 1,
0.7494256, -0.2022326, 1.579249, 1, 1, 1, 1, 1,
0.7494615, -0.07523053, 3.673969, 1, 1, 1, 1, 1,
0.7516442, -0.2941039, 2.876975, 1, 1, 1, 1, 1,
0.7521896, -0.3669658, 2.755039, 1, 1, 1, 1, 1,
0.7537863, -0.7815493, 3.919912, 0, 0, 1, 1, 1,
0.7624045, 0.3369651, -1.194584, 1, 0, 0, 1, 1,
0.7708519, -0.7012131, 2.161011, 1, 0, 0, 1, 1,
0.7732142, 0.9270313, 1.191434, 1, 0, 0, 1, 1,
0.7791038, -0.8360037, 1.977169, 1, 0, 0, 1, 1,
0.7813407, 1.051219, 0.28032, 1, 0, 0, 1, 1,
0.7881769, -0.09441929, 0.5269959, 0, 0, 0, 1, 1,
0.8007443, 1.24862, 1.956783, 0, 0, 0, 1, 1,
0.8027276, -0.6229188, 1.757596, 0, 0, 0, 1, 1,
0.8028291, -1.604109, 2.195974, 0, 0, 0, 1, 1,
0.8122044, 0.2603382, 2.246021, 0, 0, 0, 1, 1,
0.8126765, 1.026155, 0.3640864, 0, 0, 0, 1, 1,
0.8180959, -2.171877, 2.539563, 0, 0, 0, 1, 1,
0.8182134, 0.5806729, -0.527332, 1, 1, 1, 1, 1,
0.8184785, 1.040231, 0.3972401, 1, 1, 1, 1, 1,
0.8209099, 0.9521981, 0.2659658, 1, 1, 1, 1, 1,
0.8246645, 1.105844, 0.3058057, 1, 1, 1, 1, 1,
0.8318364, 0.9292409, 0.3070692, 1, 1, 1, 1, 1,
0.8320545, 0.5887967, 0.8089431, 1, 1, 1, 1, 1,
0.8426732, 0.8080734, 0.09403802, 1, 1, 1, 1, 1,
0.8427576, -1.220312, 3.263256, 1, 1, 1, 1, 1,
0.8457361, 0.2698269, 2.267657, 1, 1, 1, 1, 1,
0.8504601, -0.1290573, 3.039055, 1, 1, 1, 1, 1,
0.8521389, 0.384745, -0.1363239, 1, 1, 1, 1, 1,
0.8552641, 0.4031616, 0.8688275, 1, 1, 1, 1, 1,
0.8553349, 0.2351481, 1.674699, 1, 1, 1, 1, 1,
0.8557124, -0.9106108, 2.840248, 1, 1, 1, 1, 1,
0.8557767, 0.2525699, 1.288593, 1, 1, 1, 1, 1,
0.8575748, -0.6451769, 2.138653, 0, 0, 1, 1, 1,
0.8579679, 1.746917, 0.424453, 1, 0, 0, 1, 1,
0.8660597, 0.1727755, 2.427635, 1, 0, 0, 1, 1,
0.8683097, 1.613272, 0.996951, 1, 0, 0, 1, 1,
0.871657, -0.6119525, 3.453193, 1, 0, 0, 1, 1,
0.8729044, -1.410003, 2.059134, 1, 0, 0, 1, 1,
0.8791704, 1.31764, 0.8773614, 0, 0, 0, 1, 1,
0.8821613, 2.480427, 0.8570488, 0, 0, 0, 1, 1,
0.8881997, 1.967853, 1.503602, 0, 0, 0, 1, 1,
0.8936306, 1.351494, 1.549611, 0, 0, 0, 1, 1,
0.8952034, -0.8343507, 3.089375, 0, 0, 0, 1, 1,
0.8958815, 0.4846818, 1.303919, 0, 0, 0, 1, 1,
0.904739, -0.9607264, 3.099925, 0, 0, 0, 1, 1,
0.9052844, 0.4872389, 2.248606, 1, 1, 1, 1, 1,
0.9057797, 1.303224, 0.101795, 1, 1, 1, 1, 1,
0.9148681, -0.01550139, 1.299069, 1, 1, 1, 1, 1,
0.918139, 0.4581309, 0.2528515, 1, 1, 1, 1, 1,
0.9217496, -0.1000602, 3.591909, 1, 1, 1, 1, 1,
0.9219449, 0.184645, 1.869787, 1, 1, 1, 1, 1,
0.9245345, 2.102753, 1.323745, 1, 1, 1, 1, 1,
0.9283002, -0.006071745, 1.958489, 1, 1, 1, 1, 1,
0.9292085, -0.3607773, 3.206169, 1, 1, 1, 1, 1,
0.933005, -2.393737, 2.94051, 1, 1, 1, 1, 1,
0.9380682, -0.4138371, 1.270335, 1, 1, 1, 1, 1,
0.9480387, 0.2807736, 1.309984, 1, 1, 1, 1, 1,
0.9493905, -0.003018395, 3.193574, 1, 1, 1, 1, 1,
0.9501011, 0.7503512, 1.245542, 1, 1, 1, 1, 1,
0.9510106, -0.5996419, 0.8592832, 1, 1, 1, 1, 1,
0.9532839, -3.006679, 2.010784, 0, 0, 1, 1, 1,
0.9682699, -0.4928335, 2.295572, 1, 0, 0, 1, 1,
0.9704597, -1.00367, 2.326144, 1, 0, 0, 1, 1,
0.9738485, 0.05789606, -0.4526312, 1, 0, 0, 1, 1,
0.978918, 0.3637682, 1.541119, 1, 0, 0, 1, 1,
0.9799125, 1.632979, 1.216746, 1, 0, 0, 1, 1,
0.9951213, 0.6762658, -0.32442, 0, 0, 0, 1, 1,
1.000313, 1.067152, 0.873825, 0, 0, 0, 1, 1,
1.003566, 0.8810197, 0.6456991, 0, 0, 0, 1, 1,
1.003865, -0.3617059, 2.810161, 0, 0, 0, 1, 1,
1.007355, 0.3127043, 1.034247, 0, 0, 0, 1, 1,
1.011108, 0.3028719, 0.7771986, 0, 0, 0, 1, 1,
1.018901, -0.4287767, 2.579096, 0, 0, 0, 1, 1,
1.037272, -1.000539, 1.68083, 1, 1, 1, 1, 1,
1.038033, 0.806278, 0.9944254, 1, 1, 1, 1, 1,
1.04018, -0.1002273, 0.7433082, 1, 1, 1, 1, 1,
1.045205, -0.9419655, 2.462679, 1, 1, 1, 1, 1,
1.047078, -0.07791758, 1.410573, 1, 1, 1, 1, 1,
1.050786, -1.287106, 2.82029, 1, 1, 1, 1, 1,
1.056081, 1.603075, 0.433789, 1, 1, 1, 1, 1,
1.056601, 0.05323467, 0.9057862, 1, 1, 1, 1, 1,
1.056983, 0.5813609, 3.26532, 1, 1, 1, 1, 1,
1.061819, 0.02120801, 1.769338, 1, 1, 1, 1, 1,
1.063205, 0.3555235, 2.620467, 1, 1, 1, 1, 1,
1.063938, -0.01002617, 1.858196, 1, 1, 1, 1, 1,
1.069155, 0.4497088, 0.2757798, 1, 1, 1, 1, 1,
1.078159, 1.668706, 0.258508, 1, 1, 1, 1, 1,
1.082731, -0.4016674, 1.001785, 1, 1, 1, 1, 1,
1.084361, 0.9759886, 0.8298305, 0, 0, 1, 1, 1,
1.093348, 0.3698251, 1.029911, 1, 0, 0, 1, 1,
1.097262, -1.005725, 2.633063, 1, 0, 0, 1, 1,
1.102839, 2.092264, 0.4084513, 1, 0, 0, 1, 1,
1.103284, -0.7184714, 1.911391, 1, 0, 0, 1, 1,
1.113379, 0.181455, 0.5454536, 1, 0, 0, 1, 1,
1.113527, 0.7972143, 2.11238, 0, 0, 0, 1, 1,
1.125121, -1.167278, 1.646294, 0, 0, 0, 1, 1,
1.134943, -0.7834752, 1.583945, 0, 0, 0, 1, 1,
1.139623, -0.4094306, -0.6570153, 0, 0, 0, 1, 1,
1.171384, 0.6391569, 1.7322, 0, 0, 0, 1, 1,
1.176018, -0.6093591, 2.94752, 0, 0, 0, 1, 1,
1.176872, -1.75803, 4.405439, 0, 0, 0, 1, 1,
1.187378, 0.3837782, 0.1103399, 1, 1, 1, 1, 1,
1.191786, 1.460916, 2.497584, 1, 1, 1, 1, 1,
1.199365, -0.5615568, 1.846259, 1, 1, 1, 1, 1,
1.20831, -0.5378774, 2.33555, 1, 1, 1, 1, 1,
1.208906, -0.1389329, 1.260518, 1, 1, 1, 1, 1,
1.213461, 0.7792817, 2.58773, 1, 1, 1, 1, 1,
1.213884, -0.6291144, 2.01177, 1, 1, 1, 1, 1,
1.233455, 1.319224, 0.5070511, 1, 1, 1, 1, 1,
1.240753, -1.248738, 2.544616, 1, 1, 1, 1, 1,
1.245324, -0.287494, 1.079409, 1, 1, 1, 1, 1,
1.249255, -0.01263881, 1.405663, 1, 1, 1, 1, 1,
1.250407, 1.006253, 0.9565716, 1, 1, 1, 1, 1,
1.255543, 0.8120127, 2.240442, 1, 1, 1, 1, 1,
1.263707, 0.1283749, 2.514045, 1, 1, 1, 1, 1,
1.264979, -0.2789244, 2.061946, 1, 1, 1, 1, 1,
1.268356, -0.03538178, 1.126935, 0, 0, 1, 1, 1,
1.270224, -0.393079, 0.9884195, 1, 0, 0, 1, 1,
1.271813, 2.303827, -0.6871561, 1, 0, 0, 1, 1,
1.286433, 0.05899879, 1.105382, 1, 0, 0, 1, 1,
1.322833, -1.185728, 3.671592, 1, 0, 0, 1, 1,
1.324898, 1.345455, -0.395982, 1, 0, 0, 1, 1,
1.329848, -0.720327, 0.9507504, 0, 0, 0, 1, 1,
1.330702, -0.1089231, 1.443331, 0, 0, 0, 1, 1,
1.34269, 1.587403, 0.798161, 0, 0, 0, 1, 1,
1.34523, -1.056454, 3.547452, 0, 0, 0, 1, 1,
1.35915, -1.750707, 2.41695, 0, 0, 0, 1, 1,
1.360108, 0.6341842, 0.9504055, 0, 0, 0, 1, 1,
1.362459, -0.1334734, 0.3492738, 0, 0, 0, 1, 1,
1.36253, 0.3258274, 0.3457833, 1, 1, 1, 1, 1,
1.375676, -0.7854205, 2.427719, 1, 1, 1, 1, 1,
1.384684, -2.054097, 2.66405, 1, 1, 1, 1, 1,
1.389323, 2.346112, 1.188279, 1, 1, 1, 1, 1,
1.401349, -0.546165, 2.412046, 1, 1, 1, 1, 1,
1.407359, 0.3987481, -0.3594817, 1, 1, 1, 1, 1,
1.408454, -0.03524904, 0.510854, 1, 1, 1, 1, 1,
1.411889, -0.5239334, 2.394993, 1, 1, 1, 1, 1,
1.413688, 0.6811343, 1.122829, 1, 1, 1, 1, 1,
1.429831, 1.421553, 1.363708, 1, 1, 1, 1, 1,
1.440403, -1.292245, 3.102239, 1, 1, 1, 1, 1,
1.465353, 0.8458506, 1.939126, 1, 1, 1, 1, 1,
1.465651, -1.057303, 3.461391, 1, 1, 1, 1, 1,
1.472989, -0.2281162, 1.046478, 1, 1, 1, 1, 1,
1.492756, 0.8669252, 0.09707353, 1, 1, 1, 1, 1,
1.497393, -0.04252507, 2.996605, 0, 0, 1, 1, 1,
1.498979, 0.2039991, 2.015709, 1, 0, 0, 1, 1,
1.512045, 0.07735384, 2.675083, 1, 0, 0, 1, 1,
1.534417, 0.7853647, -0.6152472, 1, 0, 0, 1, 1,
1.559638, 1.831643, -0.3000517, 1, 0, 0, 1, 1,
1.565127, -0.1868033, 2.172045, 1, 0, 0, 1, 1,
1.56964, -0.5016219, 0.6310513, 0, 0, 0, 1, 1,
1.576185, -1.417754, 1.897056, 0, 0, 0, 1, 1,
1.581905, 0.1863641, 1.920623, 0, 0, 0, 1, 1,
1.591345, -0.5286592, 1.366542, 0, 0, 0, 1, 1,
1.596148, 0.9730847, 0.9689838, 0, 0, 0, 1, 1,
1.608153, -0.6569263, 2.686749, 0, 0, 0, 1, 1,
1.618533, 1.048873, -1.353485, 0, 0, 0, 1, 1,
1.620884, 1.370948, 0.395422, 1, 1, 1, 1, 1,
1.653446, -1.366725, 2.014084, 1, 1, 1, 1, 1,
1.659279, -2.040965, 1.35094, 1, 1, 1, 1, 1,
1.675141, 1.095366, 0.8258292, 1, 1, 1, 1, 1,
1.677921, -0.6061193, 2.567366, 1, 1, 1, 1, 1,
1.680363, 2.556982, 0.6989854, 1, 1, 1, 1, 1,
1.715603, -0.2049857, 1.86879, 1, 1, 1, 1, 1,
1.722393, 0.1267845, 1.686676, 1, 1, 1, 1, 1,
1.726967, -1.478267, 2.715536, 1, 1, 1, 1, 1,
1.727167, 0.03576906, 1.124275, 1, 1, 1, 1, 1,
1.73032, 0.5992978, 0.790917, 1, 1, 1, 1, 1,
1.734246, -0.2781076, 1.702198, 1, 1, 1, 1, 1,
1.747927, -1.075939, 2.274901, 1, 1, 1, 1, 1,
1.75107, -0.7692291, 1.833876, 1, 1, 1, 1, 1,
1.757842, -1.718469, 2.403818, 1, 1, 1, 1, 1,
1.783614, -0.9665312, 1.097955, 0, 0, 1, 1, 1,
1.788835, 0.1670148, 3.463457, 1, 0, 0, 1, 1,
1.805721, -1.404923, 3.353034, 1, 0, 0, 1, 1,
1.81936, -0.3438205, 0.09228098, 1, 0, 0, 1, 1,
1.824322, -0.2951041, 0.9044622, 1, 0, 0, 1, 1,
1.836451, -0.4242657, 3.3467, 1, 0, 0, 1, 1,
1.859521, -0.02280527, 1.544899, 0, 0, 0, 1, 1,
1.893279, 0.3327978, 1.355517, 0, 0, 0, 1, 1,
1.898015, -0.3902175, 2.136868, 0, 0, 0, 1, 1,
1.928811, 0.3240628, 1.256556, 0, 0, 0, 1, 1,
1.937592, -0.6823264, 2.211588, 0, 0, 0, 1, 1,
1.956924, 0.5053678, 0.6792059, 0, 0, 0, 1, 1,
1.960004, 0.5849955, 4.099418, 0, 0, 0, 1, 1,
1.990357, 0.2254178, 0.3990692, 1, 1, 1, 1, 1,
2.002404, -0.08198514, 1.270087, 1, 1, 1, 1, 1,
2.023386, -0.3867558, 2.190289, 1, 1, 1, 1, 1,
2.029169, 1.211828, 0.2745576, 1, 1, 1, 1, 1,
2.047166, -0.6741204, 1.549472, 1, 1, 1, 1, 1,
2.057201, -0.2554242, 0.8671586, 1, 1, 1, 1, 1,
2.059923, 1.394824, 0.6744526, 1, 1, 1, 1, 1,
2.070515, -0.2257825, 2.44584, 1, 1, 1, 1, 1,
2.087852, 1.500062, 0.9908441, 1, 1, 1, 1, 1,
2.090982, -1.42161, 2.840846, 1, 1, 1, 1, 1,
2.091149, 0.382496, 1.043605, 1, 1, 1, 1, 1,
2.093083, -0.9409171, 2.214889, 1, 1, 1, 1, 1,
2.115233, 1.335072, 0.4691944, 1, 1, 1, 1, 1,
2.142834, 1.028032, 1.73104, 1, 1, 1, 1, 1,
2.182267, 1.728561, 1.161753, 1, 1, 1, 1, 1,
2.192655, 1.12403, 1.151542, 0, 0, 1, 1, 1,
2.210773, -1.649, 2.088332, 1, 0, 0, 1, 1,
2.211439, 0.008901063, 1.576731, 1, 0, 0, 1, 1,
2.23213, 1.763988, -0.2288231, 1, 0, 0, 1, 1,
2.238622, -0.6884866, 2.453165, 1, 0, 0, 1, 1,
2.274432, -0.4239016, 1.263104, 1, 0, 0, 1, 1,
2.310204, -0.7729816, 3.236542, 0, 0, 0, 1, 1,
2.360983, 0.7217236, 2.129619, 0, 0, 0, 1, 1,
2.405086, 1.695914, 0.8845314, 0, 0, 0, 1, 1,
2.407049, 1.405335, -0.3008619, 0, 0, 0, 1, 1,
2.514169, 0.8539015, 2.276481, 0, 0, 0, 1, 1,
2.544678, 0.8010057, 1.033652, 0, 0, 0, 1, 1,
2.58614, -1.332456, 2.483432, 0, 0, 0, 1, 1,
2.633726, -0.3208812, 1.403924, 1, 1, 1, 1, 1,
2.678143, -0.730546, 2.857416, 1, 1, 1, 1, 1,
2.701167, 1.122557, 2.655481, 1, 1, 1, 1, 1,
2.753321, 0.7186176, -0.2168193, 1, 1, 1, 1, 1,
2.939945, 0.5132211, 1.380039, 1, 1, 1, 1, 1,
2.961544, -0.358182, 1.254765, 1, 1, 1, 1, 1,
3.767935, -0.1141168, 1.936772, 1, 1, 1, 1, 1
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
var radius = 9.981503;
var distance = 35.05961;
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
mvMatrix.translate( 0.0369215, -0.01100326, -0.2747521 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.05961);
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
