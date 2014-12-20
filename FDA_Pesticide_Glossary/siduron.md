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
-3.448625, -0.2694992, -1.025953, 1, 0, 0, 1,
-3.123296, -1.532898, -2.121123, 1, 0.007843138, 0, 1,
-2.645448, -0.3391041, -0.5621222, 1, 0.01176471, 0, 1,
-2.620294, -0.1670004, -2.729509, 1, 0.01960784, 0, 1,
-2.563788, 0.4760564, -1.438056, 1, 0.02352941, 0, 1,
-2.347933, -1.938247, -0.6188077, 1, 0.03137255, 0, 1,
-2.341588, 1.770022, -1.042755, 1, 0.03529412, 0, 1,
-2.270227, 0.01738237, -1.462485, 1, 0.04313726, 0, 1,
-2.225151, -1.589716, -0.6802173, 1, 0.04705882, 0, 1,
-2.218076, -0.09285583, -0.654686, 1, 0.05490196, 0, 1,
-2.186857, 0.1587313, -2.254049, 1, 0.05882353, 0, 1,
-2.170263, -1.007165, -3.012879, 1, 0.06666667, 0, 1,
-2.116162, 0.5692841, 0.2551123, 1, 0.07058824, 0, 1,
-2.114834, -0.05319097, -1.293318, 1, 0.07843138, 0, 1,
-2.093932, -1.872877, -1.61034, 1, 0.08235294, 0, 1,
-2.087243, -1.180209, -3.159945, 1, 0.09019608, 0, 1,
-2.07892, -1.094087, -1.416564, 1, 0.09411765, 0, 1,
-2.001335, 0.3941378, -1.627736, 1, 0.1019608, 0, 1,
-2.000844, 0.2171404, -1.497337, 1, 0.1098039, 0, 1,
-1.988302, 0.3454906, -1.908434, 1, 0.1137255, 0, 1,
-1.979426, 2.265658, -1.898207, 1, 0.1215686, 0, 1,
-1.961689, 0.3385109, -1.728914, 1, 0.1254902, 0, 1,
-1.951329, -0.6251155, -2.117994, 1, 0.1333333, 0, 1,
-1.93758, -1.28291, -3.418681, 1, 0.1372549, 0, 1,
-1.905017, 1.260072, -0.981107, 1, 0.145098, 0, 1,
-1.897014, 0.4232821, -3.130982, 1, 0.1490196, 0, 1,
-1.890189, -0.06228264, -1.632815, 1, 0.1568628, 0, 1,
-1.882222, 0.2398462, -1.555978, 1, 0.1607843, 0, 1,
-1.848948, -1.362969, -3.901778, 1, 0.1686275, 0, 1,
-1.839104, 0.3921095, -3.996582, 1, 0.172549, 0, 1,
-1.832459, -0.6269143, -3.438178, 1, 0.1803922, 0, 1,
-1.822786, 1.087058, -2.191826, 1, 0.1843137, 0, 1,
-1.806701, 0.5206143, -1.092568, 1, 0.1921569, 0, 1,
-1.789194, -1.885372, -3.171852, 1, 0.1960784, 0, 1,
-1.784524, 0.4128326, -1.420734, 1, 0.2039216, 0, 1,
-1.754919, 0.7390303, 0.2878043, 1, 0.2117647, 0, 1,
-1.72835, 0.05837861, -2.108073, 1, 0.2156863, 0, 1,
-1.716591, -0.2253052, -2.167382, 1, 0.2235294, 0, 1,
-1.712163, 0.08995201, -2.303175, 1, 0.227451, 0, 1,
-1.698076, 0.4767925, 1.480112, 1, 0.2352941, 0, 1,
-1.696078, 1.630008, -1.302558, 1, 0.2392157, 0, 1,
-1.695953, 0.361781, -1.320219, 1, 0.2470588, 0, 1,
-1.680458, 0.4036823, -1.773087, 1, 0.2509804, 0, 1,
-1.67913, 1.205874, -1.073907, 1, 0.2588235, 0, 1,
-1.653108, 1.850663, -0.0197751, 1, 0.2627451, 0, 1,
-1.6462, 1.210251, -1.409595, 1, 0.2705882, 0, 1,
-1.645225, 2.301187, -1.92429, 1, 0.2745098, 0, 1,
-1.641109, 2.423054, -1.095884, 1, 0.282353, 0, 1,
-1.632715, -0.9724692, -3.626228, 1, 0.2862745, 0, 1,
-1.632685, -2.169018, -1.751957, 1, 0.2941177, 0, 1,
-1.617064, 1.193433, 1.295763, 1, 0.3019608, 0, 1,
-1.607296, 1.863759, 0.3827302, 1, 0.3058824, 0, 1,
-1.600072, -0.7876593, -2.913699, 1, 0.3137255, 0, 1,
-1.584024, -0.1699819, -2.569721, 1, 0.3176471, 0, 1,
-1.582823, -1.914817, -1.976175, 1, 0.3254902, 0, 1,
-1.582034, -2.023062, -2.634181, 1, 0.3294118, 0, 1,
-1.581697, -1.308249, -2.667295, 1, 0.3372549, 0, 1,
-1.569211, -0.2450672, -0.09191945, 1, 0.3411765, 0, 1,
-1.568123, 0.4190181, -2.884598, 1, 0.3490196, 0, 1,
-1.567551, -2.197769, -2.457814, 1, 0.3529412, 0, 1,
-1.559311, 0.1503507, -1.704363, 1, 0.3607843, 0, 1,
-1.538664, -1.151523, -1.75034, 1, 0.3647059, 0, 1,
-1.537074, 1.605824, -0.3013608, 1, 0.372549, 0, 1,
-1.53109, 0.7495164, -2.981355, 1, 0.3764706, 0, 1,
-1.528538, -2.579677, -3.474304, 1, 0.3843137, 0, 1,
-1.52376, -2.200737, -0.8673404, 1, 0.3882353, 0, 1,
-1.519867, 0.429585, 1.284497, 1, 0.3960784, 0, 1,
-1.516748, 0.06985939, -1.010791, 1, 0.4039216, 0, 1,
-1.507957, -0.9664866, -2.125597, 1, 0.4078431, 0, 1,
-1.482744, 0.1016975, -1.857326, 1, 0.4156863, 0, 1,
-1.478551, 0.4987201, -3.205414, 1, 0.4196078, 0, 1,
-1.46725, -1.098046, -3.262048, 1, 0.427451, 0, 1,
-1.464672, 0.531754, -1.169302, 1, 0.4313726, 0, 1,
-1.44846, -0.1375689, -2.755569, 1, 0.4392157, 0, 1,
-1.447226, -2.042376, -3.35665, 1, 0.4431373, 0, 1,
-1.447171, -2.011829, -1.996502, 1, 0.4509804, 0, 1,
-1.444633, 0.288621, -0.5035992, 1, 0.454902, 0, 1,
-1.439976, -0.4653037, -2.041241, 1, 0.4627451, 0, 1,
-1.439096, -0.8722861, -1.499359, 1, 0.4666667, 0, 1,
-1.43599, 0.936382, -1.562379, 1, 0.4745098, 0, 1,
-1.433923, -0.1424685, 0.3300064, 1, 0.4784314, 0, 1,
-1.429333, -1.029671, -2.266388, 1, 0.4862745, 0, 1,
-1.428568, 1.191042, -0.7782608, 1, 0.4901961, 0, 1,
-1.417469, -0.1393501, -3.126182, 1, 0.4980392, 0, 1,
-1.404174, -0.8670215, -1.826635, 1, 0.5058824, 0, 1,
-1.402856, -1.761923, -2.730695, 1, 0.509804, 0, 1,
-1.39866, 0.8534126, -0.3402829, 1, 0.5176471, 0, 1,
-1.389053, -1.296258, -2.854055, 1, 0.5215687, 0, 1,
-1.386837, -1.276384, -2.936391, 1, 0.5294118, 0, 1,
-1.379702, -0.5377722, -2.964708, 1, 0.5333334, 0, 1,
-1.36907, -1.79853, -1.138088, 1, 0.5411765, 0, 1,
-1.367015, 0.2268251, -2.28221, 1, 0.5450981, 0, 1,
-1.348362, -0.9569938, -2.562646, 1, 0.5529412, 0, 1,
-1.343654, 0.02199063, -0.8908849, 1, 0.5568628, 0, 1,
-1.340754, -0.01454765, -0.7373235, 1, 0.5647059, 0, 1,
-1.338776, 0.7476322, -1.712398, 1, 0.5686275, 0, 1,
-1.337445, 0.6598555, -0.1898653, 1, 0.5764706, 0, 1,
-1.33102, 0.7834954, -0.3451258, 1, 0.5803922, 0, 1,
-1.32901, -0.6523518, -3.976443, 1, 0.5882353, 0, 1,
-1.302742, -2.310679, -3.110019, 1, 0.5921569, 0, 1,
-1.302694, 0.1929753, -1.024078, 1, 0.6, 0, 1,
-1.300711, 0.6873028, -0.737992, 1, 0.6078432, 0, 1,
-1.299001, 0.7027705, -1.062887, 1, 0.6117647, 0, 1,
-1.283316, 1.346575, -0.3825584, 1, 0.6196079, 0, 1,
-1.282712, -0.8018724, 0.3963335, 1, 0.6235294, 0, 1,
-1.280882, 0.3053653, -0.197769, 1, 0.6313726, 0, 1,
-1.280423, -0.846333, -0.3667462, 1, 0.6352941, 0, 1,
-1.266953, 0.4243792, -0.7422517, 1, 0.6431373, 0, 1,
-1.257186, 1.393446, -1.52707, 1, 0.6470588, 0, 1,
-1.24322, 0.5067653, -1.382157, 1, 0.654902, 0, 1,
-1.241894, -0.9875755, -1.579331, 1, 0.6588235, 0, 1,
-1.240851, -0.7375191, -3.411276, 1, 0.6666667, 0, 1,
-1.233607, 0.5849882, 0.1806344, 1, 0.6705883, 0, 1,
-1.226739, -0.3679538, -1.252297, 1, 0.6784314, 0, 1,
-1.221104, 0.1548637, -0.9178579, 1, 0.682353, 0, 1,
-1.220882, -0.9416476, -0.9404746, 1, 0.6901961, 0, 1,
-1.212207, 0.4302136, -1.379521, 1, 0.6941177, 0, 1,
-1.208122, -0.8696592, -0.3077817, 1, 0.7019608, 0, 1,
-1.203657, -0.4218191, -2.988673, 1, 0.7098039, 0, 1,
-1.203555, 0.9116622, -3.132751, 1, 0.7137255, 0, 1,
-1.198539, 0.5694346, -0.03036809, 1, 0.7215686, 0, 1,
-1.194624, 0.2476614, -0.677847, 1, 0.7254902, 0, 1,
-1.190621, -1.367638, -2.809763, 1, 0.7333333, 0, 1,
-1.189985, 0.9956792, -3.132109, 1, 0.7372549, 0, 1,
-1.187059, -1.082308, -2.357235, 1, 0.7450981, 0, 1,
-1.184113, 0.1205087, -1.263878, 1, 0.7490196, 0, 1,
-1.183291, -0.2776069, -1.611985, 1, 0.7568628, 0, 1,
-1.176465, -0.678978, -1.176509, 1, 0.7607843, 0, 1,
-1.164578, -0.7456886, -3.737777, 1, 0.7686275, 0, 1,
-1.164336, -1.031512, -0.7064182, 1, 0.772549, 0, 1,
-1.158379, 0.8951746, -0.5814677, 1, 0.7803922, 0, 1,
-1.155153, -0.3691153, -0.7115667, 1, 0.7843137, 0, 1,
-1.152311, 1.267138, -1.151966, 1, 0.7921569, 0, 1,
-1.15213, 0.8472278, 0.2844397, 1, 0.7960784, 0, 1,
-1.151572, -0.7398228, -1.376846, 1, 0.8039216, 0, 1,
-1.149922, 1.205725, -1.546665, 1, 0.8117647, 0, 1,
-1.147481, -0.7010629, -3.462883, 1, 0.8156863, 0, 1,
-1.146799, 0.9126823, -1.690004, 1, 0.8235294, 0, 1,
-1.137842, 1.992427, -0.9400311, 1, 0.827451, 0, 1,
-1.130968, 0.2658927, -1.186233, 1, 0.8352941, 0, 1,
-1.129989, -0.4600581, -3.420171, 1, 0.8392157, 0, 1,
-1.119943, 0.2457057, -0.8617812, 1, 0.8470588, 0, 1,
-1.1172, 3.25747, -0.8926154, 1, 0.8509804, 0, 1,
-1.111616, -0.8057538, -1.336896, 1, 0.8588235, 0, 1,
-1.107974, 0.1640173, -1.23685, 1, 0.8627451, 0, 1,
-1.101622, 0.7692668, -2.427423, 1, 0.8705882, 0, 1,
-1.097122, 0.176066, 0.05803365, 1, 0.8745098, 0, 1,
-1.093393, -0.09182227, -1.391235, 1, 0.8823529, 0, 1,
-1.089261, 1.761873, -0.4920542, 1, 0.8862745, 0, 1,
-1.087502, -0.8667944, -1.906932, 1, 0.8941177, 0, 1,
-1.076218, 1.014964, -1.232682, 1, 0.8980392, 0, 1,
-1.075455, -0.3128776, -3.051015, 1, 0.9058824, 0, 1,
-1.06613, 0.3884402, -1.130827, 1, 0.9137255, 0, 1,
-1.061249, 1.473346, 1.881935, 1, 0.9176471, 0, 1,
-1.060803, 0.09204266, -0.4122138, 1, 0.9254902, 0, 1,
-1.056451, -0.1429981, -1.139941, 1, 0.9294118, 0, 1,
-1.055761, -0.4007501, 0.1062648, 1, 0.9372549, 0, 1,
-1.055106, 0.4455497, -0.3076937, 1, 0.9411765, 0, 1,
-1.038028, 1.594683, 0.9353004, 1, 0.9490196, 0, 1,
-1.036537, -1.174863, -3.11322, 1, 0.9529412, 0, 1,
-1.028125, -0.3071182, -3.68632, 1, 0.9607843, 0, 1,
-1.020003, -0.6068404, -2.537988, 1, 0.9647059, 0, 1,
-1.018723, -0.5746562, -2.97097, 1, 0.972549, 0, 1,
-1.015901, -1.163886, -3.842143, 1, 0.9764706, 0, 1,
-1.01361, 0.846466, -1.490532, 1, 0.9843137, 0, 1,
-1.011103, 0.3332064, -1.455174, 1, 0.9882353, 0, 1,
-1.010373, 2.03489, 0.07272688, 1, 0.9960784, 0, 1,
-1.008681, 1.026728, -1.666976, 0.9960784, 1, 0, 1,
-1.003167, -1.910748, -1.677334, 0.9921569, 1, 0, 1,
-1.002106, -1.175301, -0.400727, 0.9843137, 1, 0, 1,
-1.001548, -0.8560123, -3.307941, 0.9803922, 1, 0, 1,
-1.000086, 0.7593037, -3.276105, 0.972549, 1, 0, 1,
-0.9988557, 0.4579658, -1.337244, 0.9686275, 1, 0, 1,
-0.9987303, 0.4656653, 0.7611573, 0.9607843, 1, 0, 1,
-0.9892683, -0.9064931, -1.947901, 0.9568627, 1, 0, 1,
-0.9875673, 1.300565, -0.3862664, 0.9490196, 1, 0, 1,
-0.9849274, -2.150281, -3.911162, 0.945098, 1, 0, 1,
-0.984091, -1.866455, -2.421137, 0.9372549, 1, 0, 1,
-0.977577, 2.112979, -0.5236571, 0.9333333, 1, 0, 1,
-0.971745, 0.2959863, -2.698453, 0.9254902, 1, 0, 1,
-0.9638878, 0.8922077, -0.716482, 0.9215686, 1, 0, 1,
-0.9602347, 0.9544464, -1.261875, 0.9137255, 1, 0, 1,
-0.9595963, 0.1224155, -0.8417297, 0.9098039, 1, 0, 1,
-0.9587539, -1.165434, -2.754374, 0.9019608, 1, 0, 1,
-0.9492669, 1.139809, -0.2189834, 0.8941177, 1, 0, 1,
-0.9488288, 0.05419372, -2.429943, 0.8901961, 1, 0, 1,
-0.9427877, 1.309986, -2.746944, 0.8823529, 1, 0, 1,
-0.9426442, 0.2277468, -1.091964, 0.8784314, 1, 0, 1,
-0.9357988, -0.541438, -2.141707, 0.8705882, 1, 0, 1,
-0.9352464, -0.8178251, -2.511973, 0.8666667, 1, 0, 1,
-0.9259309, -0.4255368, 0.1876251, 0.8588235, 1, 0, 1,
-0.9250046, 2.079506, 0.2565651, 0.854902, 1, 0, 1,
-0.9205073, 0.6108062, 0.137585, 0.8470588, 1, 0, 1,
-0.9201657, -0.6575448, -3.592874, 0.8431373, 1, 0, 1,
-0.9158541, 0.3327455, -1.535464, 0.8352941, 1, 0, 1,
-0.9155726, -2.231689, -1.724025, 0.8313726, 1, 0, 1,
-0.9151244, 0.196888, -3.969747, 0.8235294, 1, 0, 1,
-0.9017963, 0.03675284, -1.533222, 0.8196079, 1, 0, 1,
-0.8970176, -0.6687043, -1.832789, 0.8117647, 1, 0, 1,
-0.8966624, 0.6357621, -1.494993, 0.8078431, 1, 0, 1,
-0.8955285, -0.2392643, -0.5740572, 0.8, 1, 0, 1,
-0.8936255, -1.180002, -4.66261, 0.7921569, 1, 0, 1,
-0.8926421, -1.379509, -2.808517, 0.7882353, 1, 0, 1,
-0.8914766, -0.8053452, -2.512941, 0.7803922, 1, 0, 1,
-0.8861455, 0.5487311, -1.530791, 0.7764706, 1, 0, 1,
-0.8861324, -0.6712203, -2.106904, 0.7686275, 1, 0, 1,
-0.8801052, -0.4445857, -0.3173218, 0.7647059, 1, 0, 1,
-0.8768346, 0.3069448, 1.001303, 0.7568628, 1, 0, 1,
-0.867266, -0.2937656, -2.890925, 0.7529412, 1, 0, 1,
-0.859322, 0.3229915, -2.308937, 0.7450981, 1, 0, 1,
-0.8592806, -1.249784, -3.387516, 0.7411765, 1, 0, 1,
-0.8540265, -2.239373, -2.186114, 0.7333333, 1, 0, 1,
-0.8530477, -1.477189, -2.604283, 0.7294118, 1, 0, 1,
-0.8510981, -0.5154433, -2.955539, 0.7215686, 1, 0, 1,
-0.8505756, 1.507876, -1.629977, 0.7176471, 1, 0, 1,
-0.8453581, 0.5308162, -2.100174, 0.7098039, 1, 0, 1,
-0.8424125, 1.275102, -2.764248, 0.7058824, 1, 0, 1,
-0.8420824, -0.7602124, -1.123369, 0.6980392, 1, 0, 1,
-0.8184838, 0.4377529, -1.624504, 0.6901961, 1, 0, 1,
-0.8176244, -1.439384, -1.984618, 0.6862745, 1, 0, 1,
-0.8174257, 0.2469567, -0.8861994, 0.6784314, 1, 0, 1,
-0.8164051, 0.7553732, 0.7196238, 0.6745098, 1, 0, 1,
-0.8146161, 0.608818, -0.2826664, 0.6666667, 1, 0, 1,
-0.8097308, -1.41835, -2.616638, 0.6627451, 1, 0, 1,
-0.8071299, -0.4264895, -3.295119, 0.654902, 1, 0, 1,
-0.8025168, 0.739346, -2.226655, 0.6509804, 1, 0, 1,
-0.8019298, 0.276288, -0.3976533, 0.6431373, 1, 0, 1,
-0.8004863, -0.6362241, -1.811144, 0.6392157, 1, 0, 1,
-0.7993367, 1.761595, -0.8088682, 0.6313726, 1, 0, 1,
-0.7977545, 0.09304065, -0.008558195, 0.627451, 1, 0, 1,
-0.7952636, -0.1149923, -1.302316, 0.6196079, 1, 0, 1,
-0.794571, -0.2607508, -3.115811, 0.6156863, 1, 0, 1,
-0.7925279, -0.1375984, -2.218644, 0.6078432, 1, 0, 1,
-0.7921839, 0.4058798, -3.069952, 0.6039216, 1, 0, 1,
-0.7870381, -1.36335, -1.112784, 0.5960785, 1, 0, 1,
-0.7846568, 1.417433, -1.340256, 0.5882353, 1, 0, 1,
-0.7831257, -0.04168754, -0.7506572, 0.5843138, 1, 0, 1,
-0.7819979, -0.4350356, -2.235425, 0.5764706, 1, 0, 1,
-0.7791939, 1.168029, -0.5746151, 0.572549, 1, 0, 1,
-0.7664998, -0.4005354, -2.6123, 0.5647059, 1, 0, 1,
-0.7599828, 0.6243941, -0.2755701, 0.5607843, 1, 0, 1,
-0.7581324, -1.352364, -2.119128, 0.5529412, 1, 0, 1,
-0.757526, -0.8364565, -2.454015, 0.5490196, 1, 0, 1,
-0.7524639, -0.780569, -0.2821436, 0.5411765, 1, 0, 1,
-0.7504117, 2.227496, -1.435745, 0.5372549, 1, 0, 1,
-0.7489376, 0.1723697, -1.809388, 0.5294118, 1, 0, 1,
-0.7455756, -0.4765196, -4.114587, 0.5254902, 1, 0, 1,
-0.7423863, -0.6463614, -1.715502, 0.5176471, 1, 0, 1,
-0.7359359, 0.1448419, -0.05184618, 0.5137255, 1, 0, 1,
-0.7359273, 0.9480058, -0.6760409, 0.5058824, 1, 0, 1,
-0.7304989, 0.9040033, -0.1580399, 0.5019608, 1, 0, 1,
-0.7155561, 1.091425, -1.007561, 0.4941176, 1, 0, 1,
-0.7139209, -0.9090427, -2.118468, 0.4862745, 1, 0, 1,
-0.7135068, -0.07656609, -2.220323, 0.4823529, 1, 0, 1,
-0.7134139, -0.1117426, -1.439956, 0.4745098, 1, 0, 1,
-0.7122977, -0.8056591, -1.580271, 0.4705882, 1, 0, 1,
-0.7087823, 1.062157, -1.699932, 0.4627451, 1, 0, 1,
-0.7073729, 0.08299121, -0.6074365, 0.4588235, 1, 0, 1,
-0.7062402, -0.5476416, -0.2901003, 0.4509804, 1, 0, 1,
-0.7055365, -1.383285, -1.721271, 0.4470588, 1, 0, 1,
-0.7030381, 0.09561095, -1.580598, 0.4392157, 1, 0, 1,
-0.694378, 1.123941, 0.2139283, 0.4352941, 1, 0, 1,
-0.6924848, 0.1190321, -2.23655, 0.427451, 1, 0, 1,
-0.689814, 0.2256345, -1.116139, 0.4235294, 1, 0, 1,
-0.6858619, 1.032991, 0.1438624, 0.4156863, 1, 0, 1,
-0.6837734, 2.051324, 1.87311, 0.4117647, 1, 0, 1,
-0.6827836, -0.03970154, -1.769412, 0.4039216, 1, 0, 1,
-0.6814804, 0.5579804, -0.9353731, 0.3960784, 1, 0, 1,
-0.6811411, 0.8247967, -1.010335, 0.3921569, 1, 0, 1,
-0.6772863, 1.680556, -0.2076691, 0.3843137, 1, 0, 1,
-0.6745404, 1.151612, -0.002141821, 0.3803922, 1, 0, 1,
-0.6731272, -1.425377, -2.442564, 0.372549, 1, 0, 1,
-0.672483, -0.2583537, -1.679594, 0.3686275, 1, 0, 1,
-0.6701124, -0.4296401, -1.682656, 0.3607843, 1, 0, 1,
-0.6676562, 0.5559096, 0.3919466, 0.3568628, 1, 0, 1,
-0.6671996, 0.06300156, -1.125577, 0.3490196, 1, 0, 1,
-0.6669915, -0.0226656, -0.2787485, 0.345098, 1, 0, 1,
-0.66681, 2.098686, 0.1114322, 0.3372549, 1, 0, 1,
-0.6644757, -1.168553, -2.807416, 0.3333333, 1, 0, 1,
-0.660473, 1.344532, 0.4191658, 0.3254902, 1, 0, 1,
-0.6590202, 0.2794791, -0.2737184, 0.3215686, 1, 0, 1,
-0.6552027, 0.1699473, -0.435711, 0.3137255, 1, 0, 1,
-0.6495637, 0.2741707, -1.765304, 0.3098039, 1, 0, 1,
-0.6433939, -0.4242089, -0.9422055, 0.3019608, 1, 0, 1,
-0.6393198, 0.2169501, -1.150486, 0.2941177, 1, 0, 1,
-0.6351387, 0.9935893, -1.916752, 0.2901961, 1, 0, 1,
-0.6347142, -0.9484388, -2.414119, 0.282353, 1, 0, 1,
-0.6315515, -1.024342, -2.521044, 0.2784314, 1, 0, 1,
-0.6280114, 1.071529, 0.2896546, 0.2705882, 1, 0, 1,
-0.6261811, -0.2385725, -2.147655, 0.2666667, 1, 0, 1,
-0.6252807, -0.02162711, -1.111731, 0.2588235, 1, 0, 1,
-0.6193716, 0.2302767, -0.9900105, 0.254902, 1, 0, 1,
-0.6190702, 2.084736, 0.3086152, 0.2470588, 1, 0, 1,
-0.6130409, 0.7595891, -1.832143, 0.2431373, 1, 0, 1,
-0.6046247, -0.6673002, -4.107092, 0.2352941, 1, 0, 1,
-0.6045921, -1.602417, -1.760102, 0.2313726, 1, 0, 1,
-0.5988334, -0.2556091, -1.229917, 0.2235294, 1, 0, 1,
-0.5974799, 1.210309, -1.310334, 0.2196078, 1, 0, 1,
-0.5881503, 0.4682301, -0.8548626, 0.2117647, 1, 0, 1,
-0.5857922, -0.8058739, -2.597014, 0.2078431, 1, 0, 1,
-0.5836888, -0.6774434, -1.842665, 0.2, 1, 0, 1,
-0.5832484, -1.409589, -2.097423, 0.1921569, 1, 0, 1,
-0.5738685, 0.9403915, -0.06490138, 0.1882353, 1, 0, 1,
-0.5731842, -1.841685, -2.917996, 0.1803922, 1, 0, 1,
-0.5712596, 2.08587, 1.071801, 0.1764706, 1, 0, 1,
-0.5697954, -0.9933094, -2.340083, 0.1686275, 1, 0, 1,
-0.5639861, -0.09000055, -2.260153, 0.1647059, 1, 0, 1,
-0.5636784, 3.083376, -0.0286016, 0.1568628, 1, 0, 1,
-0.5635821, 1.619836, -1.435705, 0.1529412, 1, 0, 1,
-0.5541705, -0.7987637, -3.286647, 0.145098, 1, 0, 1,
-0.5489519, 0.4250938, -0.3779444, 0.1411765, 1, 0, 1,
-0.5412708, 0.02972077, -3.661984, 0.1333333, 1, 0, 1,
-0.5320934, -1.074299, -3.148777, 0.1294118, 1, 0, 1,
-0.5317336, -0.617137, -3.396124, 0.1215686, 1, 0, 1,
-0.5255508, -1.456411, -2.636101, 0.1176471, 1, 0, 1,
-0.5237985, -0.9370092, -2.966446, 0.1098039, 1, 0, 1,
-0.5198228, -1.129136, -2.709461, 0.1058824, 1, 0, 1,
-0.5161515, 1.258824, 2.349894, 0.09803922, 1, 0, 1,
-0.5152318, 0.8449327, -1.223322, 0.09019608, 1, 0, 1,
-0.514788, -1.442689, -2.429503, 0.08627451, 1, 0, 1,
-0.5108858, 0.1756342, -1.390102, 0.07843138, 1, 0, 1,
-0.5059078, 0.8540436, 1.146848, 0.07450981, 1, 0, 1,
-0.5057405, 0.2382881, -0.7630249, 0.06666667, 1, 0, 1,
-0.5053038, 1.20969, 0.1549275, 0.0627451, 1, 0, 1,
-0.5033693, 1.861333, -1.087131, 0.05490196, 1, 0, 1,
-0.4998058, -0.6458551, -2.435407, 0.05098039, 1, 0, 1,
-0.4993738, 0.6950501, -2.636178, 0.04313726, 1, 0, 1,
-0.4959642, -1.436348, -3.36144, 0.03921569, 1, 0, 1,
-0.4959017, -0.7512437, -2.603374, 0.03137255, 1, 0, 1,
-0.493852, -0.3315933, -2.878223, 0.02745098, 1, 0, 1,
-0.4910084, -1.100717, -1.329975, 0.01960784, 1, 0, 1,
-0.4834883, 1.423504, 0.07654128, 0.01568628, 1, 0, 1,
-0.4771212, 0.2077138, -3.013976, 0.007843138, 1, 0, 1,
-0.4768828, 0.4731142, -0.006201783, 0.003921569, 1, 0, 1,
-0.4751121, 1.590996, 1.132399, 0, 1, 0.003921569, 1,
-0.473181, -0.6552888, -3.788615, 0, 1, 0.01176471, 1,
-0.4714015, -1.166559, -2.915273, 0, 1, 0.01568628, 1,
-0.4700746, 0.3571336, -0.7426656, 0, 1, 0.02352941, 1,
-0.4668012, 0.2856976, -2.123256, 0, 1, 0.02745098, 1,
-0.4658217, 0.4492877, -1.248509, 0, 1, 0.03529412, 1,
-0.4604999, -0.235903, -1.722425, 0, 1, 0.03921569, 1,
-0.45521, -2.284303, -3.312165, 0, 1, 0.04705882, 1,
-0.4505155, -0.546365, -3.857527, 0, 1, 0.05098039, 1,
-0.449525, 1.67784, -0.1916954, 0, 1, 0.05882353, 1,
-0.4452094, -0.2678279, -1.599413, 0, 1, 0.0627451, 1,
-0.4411443, 0.9270099, -0.7397216, 0, 1, 0.07058824, 1,
-0.4402196, -0.09244952, -2.68036, 0, 1, 0.07450981, 1,
-0.438341, 0.1886734, 0.1309923, 0, 1, 0.08235294, 1,
-0.4351301, -1.545749, -3.71459, 0, 1, 0.08627451, 1,
-0.4348317, 1.015313, -0.4180111, 0, 1, 0.09411765, 1,
-0.4330912, -1.169064, -1.738335, 0, 1, 0.1019608, 1,
-0.4323658, -0.8968706, -4.284816, 0, 1, 0.1058824, 1,
-0.4290436, -0.3738298, -2.042579, 0, 1, 0.1137255, 1,
-0.4240666, -0.825609, -1.946947, 0, 1, 0.1176471, 1,
-0.4177299, -0.0351009, -0.8424075, 0, 1, 0.1254902, 1,
-0.4151381, -0.9977655, -3.140855, 0, 1, 0.1294118, 1,
-0.4135639, 1.330832, 0.4033887, 0, 1, 0.1372549, 1,
-0.4083053, -2.073438, -3.210973, 0, 1, 0.1411765, 1,
-0.4075939, -3.433294, -2.341082, 0, 1, 0.1490196, 1,
-0.4052108, 0.006600248, -2.542609, 0, 1, 0.1529412, 1,
-0.4046288, -0.800312, -3.677653, 0, 1, 0.1607843, 1,
-0.4019732, 1.954011, 0.8247668, 0, 1, 0.1647059, 1,
-0.4009939, 0.7448709, -1.032862, 0, 1, 0.172549, 1,
-0.3899984, -0.8355691, -2.82009, 0, 1, 0.1764706, 1,
-0.3807619, -1.211237, -2.035954, 0, 1, 0.1843137, 1,
-0.3790585, 1.564376, 0.3276366, 0, 1, 0.1882353, 1,
-0.3782011, -1.286885, -1.137301, 0, 1, 0.1960784, 1,
-0.3676072, -0.02577143, -1.315027, 0, 1, 0.2039216, 1,
-0.3634035, -0.5083044, -2.365042, 0, 1, 0.2078431, 1,
-0.3581144, 1.511789, -0.7888751, 0, 1, 0.2156863, 1,
-0.3563182, 0.8148941, -1.046006, 0, 1, 0.2196078, 1,
-0.3562853, 1.138542, -0.03209633, 0, 1, 0.227451, 1,
-0.3553168, -0.08699121, 0.3857924, 0, 1, 0.2313726, 1,
-0.3532657, -0.8909806, -1.307649, 0, 1, 0.2392157, 1,
-0.3420304, 0.5748, -1.738093, 0, 1, 0.2431373, 1,
-0.3420235, -0.1611662, -2.223269, 0, 1, 0.2509804, 1,
-0.3405676, -1.54016, -3.429323, 0, 1, 0.254902, 1,
-0.3348242, 0.9664006, -0.7607394, 0, 1, 0.2627451, 1,
-0.3335095, 2.600032, 0.801621, 0, 1, 0.2666667, 1,
-0.3301321, 1.303419, -1.261633, 0, 1, 0.2745098, 1,
-0.3294846, 0.2777617, -0.2892323, 0, 1, 0.2784314, 1,
-0.3285976, 1.414221, -1.00622, 0, 1, 0.2862745, 1,
-0.3241955, 1.350702, -1.941004, 0, 1, 0.2901961, 1,
-0.3238354, 0.8633221, 0.5709044, 0, 1, 0.2980392, 1,
-0.3179751, -0.1031407, -2.140673, 0, 1, 0.3058824, 1,
-0.3168395, -1.243745, -3.441788, 0, 1, 0.3098039, 1,
-0.3161218, 0.555649, -2.012219, 0, 1, 0.3176471, 1,
-0.3118495, -1.939826, -2.701417, 0, 1, 0.3215686, 1,
-0.3092427, 0.4465342, -0.5636147, 0, 1, 0.3294118, 1,
-0.308547, -0.8701197, -0.06025531, 0, 1, 0.3333333, 1,
-0.3082649, -0.489953, -3.420042, 0, 1, 0.3411765, 1,
-0.3076945, 0.8628123, 0.111895, 0, 1, 0.345098, 1,
-0.3076648, -0.3651298, -1.870988, 0, 1, 0.3529412, 1,
-0.3066646, 0.5851848, -0.1888628, 0, 1, 0.3568628, 1,
-0.3001546, 0.7853419, 0.5300395, 0, 1, 0.3647059, 1,
-0.2920148, 0.6604402, 1.400056, 0, 1, 0.3686275, 1,
-0.2920129, -0.06905691, -1.817536, 0, 1, 0.3764706, 1,
-0.2897407, 1.124012, -2.049454, 0, 1, 0.3803922, 1,
-0.2875665, 0.920248, 0.4268679, 0, 1, 0.3882353, 1,
-0.2846145, -0.2581664, -0.9374271, 0, 1, 0.3921569, 1,
-0.2831515, 0.5157785, -1.540671, 0, 1, 0.4, 1,
-0.2806256, -0.7122453, -0.3744186, 0, 1, 0.4078431, 1,
-0.2766046, -1.67565, -3.079931, 0, 1, 0.4117647, 1,
-0.2741883, 0.1298131, -1.380874, 0, 1, 0.4196078, 1,
-0.2711723, 0.06470646, -0.298748, 0, 1, 0.4235294, 1,
-0.2706179, 0.494519, -0.8821166, 0, 1, 0.4313726, 1,
-0.2682073, -0.7041196, -1.910746, 0, 1, 0.4352941, 1,
-0.2639164, -1.506055, -2.727693, 0, 1, 0.4431373, 1,
-0.2611053, 0.6745715, 1.764094, 0, 1, 0.4470588, 1,
-0.2605374, -0.7951655, -1.310495, 0, 1, 0.454902, 1,
-0.2599417, 0.07509276, -1.165654, 0, 1, 0.4588235, 1,
-0.25971, -0.0148668, -1.803848, 0, 1, 0.4666667, 1,
-0.2590642, 0.9450931, -1.975818, 0, 1, 0.4705882, 1,
-0.2570014, -1.557829, -1.657295, 0, 1, 0.4784314, 1,
-0.2546632, -0.8233873, -2.348079, 0, 1, 0.4823529, 1,
-0.2542956, 0.8273185, -0.3438793, 0, 1, 0.4901961, 1,
-0.2528777, -0.1045711, -1.370037, 0, 1, 0.4941176, 1,
-0.2524117, 1.20061, 0.2509353, 0, 1, 0.5019608, 1,
-0.2507755, -0.472367, -2.814754, 0, 1, 0.509804, 1,
-0.2507678, 0.7521701, -0.3301042, 0, 1, 0.5137255, 1,
-0.2505755, 0.7759045, 0.3388101, 0, 1, 0.5215687, 1,
-0.2480238, -0.7040576, -1.666645, 0, 1, 0.5254902, 1,
-0.2465336, -0.6592899, -1.624808, 0, 1, 0.5333334, 1,
-0.2412508, 1.025875, -0.6718309, 0, 1, 0.5372549, 1,
-0.2383854, -0.7980415, -2.006928, 0, 1, 0.5450981, 1,
-0.2351883, 2.585857, 0.4633967, 0, 1, 0.5490196, 1,
-0.2350357, 0.5852534, -0.7498247, 0, 1, 0.5568628, 1,
-0.2346373, 0.05669728, -1.405133, 0, 1, 0.5607843, 1,
-0.2308661, 0.883453, 1.821946, 0, 1, 0.5686275, 1,
-0.2294623, 1.415551, -1.205456, 0, 1, 0.572549, 1,
-0.227399, 1.702269, 0.08946024, 0, 1, 0.5803922, 1,
-0.225999, 0.5236163, -0.7809166, 0, 1, 0.5843138, 1,
-0.2214973, 0.09257006, -1.779506, 0, 1, 0.5921569, 1,
-0.2162967, -0.1035237, -2.276364, 0, 1, 0.5960785, 1,
-0.2111194, -0.2818166, -1.00706, 0, 1, 0.6039216, 1,
-0.207099, -1.148486, -1.718772, 0, 1, 0.6117647, 1,
-0.2010199, 0.3517127, -0.9950055, 0, 1, 0.6156863, 1,
-0.1977854, -0.05997426, -0.9646574, 0, 1, 0.6235294, 1,
-0.1931881, 0.3358752, -0.02058143, 0, 1, 0.627451, 1,
-0.1928658, 1.056286, 0.6693681, 0, 1, 0.6352941, 1,
-0.1926363, 1.533896, -1.899554, 0, 1, 0.6392157, 1,
-0.1915388, 0.691836, 0.8714395, 0, 1, 0.6470588, 1,
-0.1891553, -0.5340124, -4.489684, 0, 1, 0.6509804, 1,
-0.1882469, -0.4595111, -1.430689, 0, 1, 0.6588235, 1,
-0.1813299, 0.6338938, 0.5740666, 0, 1, 0.6627451, 1,
-0.1808891, -0.6104501, -2.883105, 0, 1, 0.6705883, 1,
-0.1770942, 1.048605, 0.8197471, 0, 1, 0.6745098, 1,
-0.1729821, 1.282482, -0.6502028, 0, 1, 0.682353, 1,
-0.1687332, 0.1761463, -2.279642, 0, 1, 0.6862745, 1,
-0.1664622, -0.8720143, -3.078594, 0, 1, 0.6941177, 1,
-0.1609578, -0.9736776, -2.030996, 0, 1, 0.7019608, 1,
-0.1607187, 2.091095, -2.660695, 0, 1, 0.7058824, 1,
-0.1569314, 0.5719163, -0.8100639, 0, 1, 0.7137255, 1,
-0.1531971, 0.5634002, 0.3271186, 0, 1, 0.7176471, 1,
-0.1488023, 0.4224603, -2.244438, 0, 1, 0.7254902, 1,
-0.1483406, 0.01027439, -0.07792774, 0, 1, 0.7294118, 1,
-0.1441583, -0.7395296, -2.743885, 0, 1, 0.7372549, 1,
-0.1358997, 1.253026, -0.9873767, 0, 1, 0.7411765, 1,
-0.1347505, -0.6527351, -3.239701, 0, 1, 0.7490196, 1,
-0.1344809, -1.037331, -4.057221, 0, 1, 0.7529412, 1,
-0.132322, -0.3123237, -2.733346, 0, 1, 0.7607843, 1,
-0.1275558, 1.666235, -2.316782, 0, 1, 0.7647059, 1,
-0.1201269, 1.243139, -0.6219311, 0, 1, 0.772549, 1,
-0.1199147, -1.442261, -4.143711, 0, 1, 0.7764706, 1,
-0.1156236, -0.4159383, -2.895821, 0, 1, 0.7843137, 1,
-0.1144075, 1.448996, -1.475445, 0, 1, 0.7882353, 1,
-0.1110077, -0.9438362, -5.225399, 0, 1, 0.7960784, 1,
-0.110116, -1.01456, -3.0941, 0, 1, 0.8039216, 1,
-0.1089418, -1.382354, -3.772542, 0, 1, 0.8078431, 1,
-0.1041414, -0.2524522, -3.76875, 0, 1, 0.8156863, 1,
-0.09988554, 0.9207623, -1.374075, 0, 1, 0.8196079, 1,
-0.08915689, -0.2415984, -1.13807, 0, 1, 0.827451, 1,
-0.08441713, -0.6463901, -3.362082, 0, 1, 0.8313726, 1,
-0.08131723, 0.0670289, -1.007334, 0, 1, 0.8392157, 1,
-0.07880963, -1.301872, -3.077458, 0, 1, 0.8431373, 1,
-0.07789257, -1.218446, -0.9499044, 0, 1, 0.8509804, 1,
-0.07571828, 1.579755, 0.6404263, 0, 1, 0.854902, 1,
-0.07260984, -0.4614266, -2.519378, 0, 1, 0.8627451, 1,
-0.07233251, -0.7468091, -4.817008, 0, 1, 0.8666667, 1,
-0.07197592, -0.7758186, -1.202278, 0, 1, 0.8745098, 1,
-0.07171573, 1.515566, 0.6441386, 0, 1, 0.8784314, 1,
-0.07151325, 0.6983231, -0.4168075, 0, 1, 0.8862745, 1,
-0.06985275, -1.65883, -1.830412, 0, 1, 0.8901961, 1,
-0.06548015, 0.06630172, -0.7882283, 0, 1, 0.8980392, 1,
-0.06172862, -1.20188, -3.052621, 0, 1, 0.9058824, 1,
-0.06034119, -0.4180436, -1.805249, 0, 1, 0.9098039, 1,
-0.05622995, 1.326869, 0.2148207, 0, 1, 0.9176471, 1,
-0.05558484, 1.879059, -0.5640757, 0, 1, 0.9215686, 1,
-0.05516677, -1.005128, -1.102809, 0, 1, 0.9294118, 1,
-0.05278286, 0.4891303, -0.1487216, 0, 1, 0.9333333, 1,
-0.04927704, -1.000274, -2.905495, 0, 1, 0.9411765, 1,
-0.04520751, 0.08075497, -1.250709, 0, 1, 0.945098, 1,
-0.04381441, -1.767172, -2.697985, 0, 1, 0.9529412, 1,
-0.04276269, -0.6989077, -3.176852, 0, 1, 0.9568627, 1,
-0.04258815, 0.9346985, -0.4436666, 0, 1, 0.9647059, 1,
-0.04152889, -1.162098, -3.444526, 0, 1, 0.9686275, 1,
-0.04001151, -0.1474841, -2.887232, 0, 1, 0.9764706, 1,
-0.03585785, -1.048299, -2.480945, 0, 1, 0.9803922, 1,
-0.03416436, 1.219556, -0.6473252, 0, 1, 0.9882353, 1,
-0.03291509, -0.8139914, -2.277675, 0, 1, 0.9921569, 1,
-0.03220701, 0.2817272, -0.6675413, 0, 1, 1, 1,
-0.02961128, -0.1668206, -2.905972, 0, 0.9921569, 1, 1,
-0.02871982, -0.2608815, -1.330977, 0, 0.9882353, 1, 1,
-0.02855652, 1.669544, 1.823908, 0, 0.9803922, 1, 1,
-0.02729479, -1.115523, -2.527443, 0, 0.9764706, 1, 1,
-0.02442478, 0.02881134, 1.663904, 0, 0.9686275, 1, 1,
-0.01962194, 0.2190766, -1.886053, 0, 0.9647059, 1, 1,
-0.0184544, 0.9255968, 0.8599124, 0, 0.9568627, 1, 1,
-0.01425024, -1.329594, -2.388575, 0, 0.9529412, 1, 1,
-0.0140254, -1.795169, -3.496268, 0, 0.945098, 1, 1,
-0.00956026, -0.9490123, -4.401501, 0, 0.9411765, 1, 1,
-0.009213491, 0.324912, -1.214122, 0, 0.9333333, 1, 1,
-0.008578121, -0.1309904, -3.6673, 0, 0.9294118, 1, 1,
-0.008024478, 0.5085017, 2.6168, 0, 0.9215686, 1, 1,
-0.003136857, 0.9520298, 0.4262635, 0, 0.9176471, 1, 1,
0.000336823, -1.339605, 0.2115481, 0, 0.9098039, 1, 1,
0.003144333, -0.9268297, 3.207309, 0, 0.9058824, 1, 1,
0.004483074, 0.4876676, 0.4511705, 0, 0.8980392, 1, 1,
0.005137825, -0.100849, 3.256983, 0, 0.8901961, 1, 1,
0.00622688, -1.023452, 2.674358, 0, 0.8862745, 1, 1,
0.01220893, -1.200554, 3.83255, 0, 0.8784314, 1, 1,
0.01409354, 1.048751, -0.6936501, 0, 0.8745098, 1, 1,
0.01518286, -1.213893, 3.216363, 0, 0.8666667, 1, 1,
0.01953175, -0.6006647, 3.219076, 0, 0.8627451, 1, 1,
0.02162888, 1.106613, -0.8416541, 0, 0.854902, 1, 1,
0.02671, 0.631039, 0.7983391, 0, 0.8509804, 1, 1,
0.02816921, 0.5941415, 0.7696686, 0, 0.8431373, 1, 1,
0.03732154, -0.2943093, 2.246624, 0, 0.8392157, 1, 1,
0.03859742, 0.9643936, 0.9424943, 0, 0.8313726, 1, 1,
0.04014328, 0.3709542, 0.4519469, 0, 0.827451, 1, 1,
0.04432574, -2.02977, 3.103437, 0, 0.8196079, 1, 1,
0.04772361, -0.1195946, 3.569509, 0, 0.8156863, 1, 1,
0.05046804, 0.03289471, 0.3172956, 0, 0.8078431, 1, 1,
0.06235541, -1.527516, 2.820075, 0, 0.8039216, 1, 1,
0.06426284, -2.156341, 2.879841, 0, 0.7960784, 1, 1,
0.06898779, 0.01646375, 0.7445356, 0, 0.7882353, 1, 1,
0.07077433, 0.2438615, 0.4411948, 0, 0.7843137, 1, 1,
0.07324775, 0.3518906, 0.61577, 0, 0.7764706, 1, 1,
0.07434208, -0.02402972, 2.149499, 0, 0.772549, 1, 1,
0.07536463, 0.533166, -0.3229633, 0, 0.7647059, 1, 1,
0.0754993, -0.6236775, 3.30478, 0, 0.7607843, 1, 1,
0.08389553, 0.7809839, 0.4576633, 0, 0.7529412, 1, 1,
0.08391158, -0.3163249, 0.8857125, 0, 0.7490196, 1, 1,
0.09264912, -0.3003522, 2.657553, 0, 0.7411765, 1, 1,
0.09360669, -0.2438008, 2.719599, 0, 0.7372549, 1, 1,
0.09616566, 1.360376, -1.206403, 0, 0.7294118, 1, 1,
0.0963693, -0.2937441, 2.759992, 0, 0.7254902, 1, 1,
0.09853142, 0.2953001, -0.5684684, 0, 0.7176471, 1, 1,
0.1013448, 1.034678, -0.07390063, 0, 0.7137255, 1, 1,
0.1023102, 0.04469056, 0.6711994, 0, 0.7058824, 1, 1,
0.10233, -0.09500246, 1.23897, 0, 0.6980392, 1, 1,
0.1063943, 0.2296813, 2.183163, 0, 0.6941177, 1, 1,
0.1069855, 1.607815, 0.02304932, 0, 0.6862745, 1, 1,
0.1083858, 0.7036782, -2.228428, 0, 0.682353, 1, 1,
0.1253333, 0.6095519, -0.543775, 0, 0.6745098, 1, 1,
0.1276954, -1.746392, 3.519483, 0, 0.6705883, 1, 1,
0.1335133, 0.1153478, -0.3434447, 0, 0.6627451, 1, 1,
0.1346121, 0.3988681, 0.3947081, 0, 0.6588235, 1, 1,
0.1348244, 1.945322, -1.084348, 0, 0.6509804, 1, 1,
0.1395277, 2.465458, -0.9911387, 0, 0.6470588, 1, 1,
0.1460603, 2.350169, 0.5645331, 0, 0.6392157, 1, 1,
0.1464279, 0.6927329, 0.1506031, 0, 0.6352941, 1, 1,
0.156307, 0.4939931, -0.7525714, 0, 0.627451, 1, 1,
0.1574016, 1.269124, -0.1946264, 0, 0.6235294, 1, 1,
0.1598447, -0.9311397, 3.202785, 0, 0.6156863, 1, 1,
0.1602361, 1.595543, -0.7608356, 0, 0.6117647, 1, 1,
0.1618054, 0.2996964, 1.860151, 0, 0.6039216, 1, 1,
0.1633844, -1.177387, 4.633933, 0, 0.5960785, 1, 1,
0.1676762, -0.3951155, 3.430659, 0, 0.5921569, 1, 1,
0.1722936, 0.3576538, 0.5133918, 0, 0.5843138, 1, 1,
0.17515, -1.000845, 1.797008, 0, 0.5803922, 1, 1,
0.1797972, -1.288684, 2.783771, 0, 0.572549, 1, 1,
0.1844577, 1.367167, -0.3967374, 0, 0.5686275, 1, 1,
0.1845703, -1.234535, 2.026651, 0, 0.5607843, 1, 1,
0.1854652, 0.6970871, 0.1433188, 0, 0.5568628, 1, 1,
0.1855099, -0.7346812, 2.11242, 0, 0.5490196, 1, 1,
0.1927215, 1.247397, 1.086584, 0, 0.5450981, 1, 1,
0.1951671, -0.2018448, 0.5793932, 0, 0.5372549, 1, 1,
0.1951807, -1.908434, 4.563744, 0, 0.5333334, 1, 1,
0.1980677, -0.8944653, 2.565666, 0, 0.5254902, 1, 1,
0.1994118, -0.2983556, 1.316461, 0, 0.5215687, 1, 1,
0.2030334, -1.222012, 3.629127, 0, 0.5137255, 1, 1,
0.2032728, -1.761643, 2.327411, 0, 0.509804, 1, 1,
0.2078073, -0.3541296, 3.201038, 0, 0.5019608, 1, 1,
0.2085324, -0.005849215, 2.989623, 0, 0.4941176, 1, 1,
0.2086763, -0.4375783, 2.079239, 0, 0.4901961, 1, 1,
0.2097132, 0.8087797, -0.879631, 0, 0.4823529, 1, 1,
0.2106327, -0.4980971, 2.111704, 0, 0.4784314, 1, 1,
0.2128761, 0.4063409, 0.004158116, 0, 0.4705882, 1, 1,
0.2157916, -0.35769, 3.394224, 0, 0.4666667, 1, 1,
0.2217345, 2.394862, 1.598368, 0, 0.4588235, 1, 1,
0.2232345, 0.06613696, 2.104048, 0, 0.454902, 1, 1,
0.223987, 0.3204319, -0.1651189, 0, 0.4470588, 1, 1,
0.2301043, 0.3383828, -0.5948226, 0, 0.4431373, 1, 1,
0.2340179, -2.000827, 3.584622, 0, 0.4352941, 1, 1,
0.235149, -0.7540745, 2.162734, 0, 0.4313726, 1, 1,
0.2356839, 0.4511433, 0.2354353, 0, 0.4235294, 1, 1,
0.2390093, 1.441357, 1.72985, 0, 0.4196078, 1, 1,
0.2413472, -1.011208, 1.390499, 0, 0.4117647, 1, 1,
0.2430271, -0.3599868, 2.188134, 0, 0.4078431, 1, 1,
0.2487655, 0.1174726, 2.498628, 0, 0.4, 1, 1,
0.253673, 0.01666692, 0.8053576, 0, 0.3921569, 1, 1,
0.2540726, -0.9247856, 3.7316, 0, 0.3882353, 1, 1,
0.2592109, -0.8516696, 2.741682, 0, 0.3803922, 1, 1,
0.2636637, -0.5247862, 3.113849, 0, 0.3764706, 1, 1,
0.2659519, 0.007872279, 2.654272, 0, 0.3686275, 1, 1,
0.2661555, 0.3598552, -1.176742, 0, 0.3647059, 1, 1,
0.2675816, 0.5408958, 1.692974, 0, 0.3568628, 1, 1,
0.2689166, 1.723153, 2.401571, 0, 0.3529412, 1, 1,
0.2697461, 0.7492078, 0.534855, 0, 0.345098, 1, 1,
0.2745984, 0.2555203, -1.278501, 0, 0.3411765, 1, 1,
0.2775935, 1.458144, -0.2706463, 0, 0.3333333, 1, 1,
0.2839923, 1.026516, 2.35248, 0, 0.3294118, 1, 1,
0.285035, 0.03479619, 3.25404, 0, 0.3215686, 1, 1,
0.2862374, -0.6441869, 2.720088, 0, 0.3176471, 1, 1,
0.2867868, -0.7622594, 1.586575, 0, 0.3098039, 1, 1,
0.287867, 1.27784, -0.008478845, 0, 0.3058824, 1, 1,
0.2896449, 0.4043363, 1.636934, 0, 0.2980392, 1, 1,
0.2917423, -2.434116, 1.131927, 0, 0.2901961, 1, 1,
0.2918036, -0.4169152, 3.075, 0, 0.2862745, 1, 1,
0.2929492, 1.269628, 0.02786378, 0, 0.2784314, 1, 1,
0.2943761, -1.138325, 3.195931, 0, 0.2745098, 1, 1,
0.2951722, 1.085571, -0.02607465, 0, 0.2666667, 1, 1,
0.2972633, -0.3874606, 2.644525, 0, 0.2627451, 1, 1,
0.2977616, 0.4075297, 0.4310348, 0, 0.254902, 1, 1,
0.3004429, -0.1915201, 2.406516, 0, 0.2509804, 1, 1,
0.3020117, 0.6638426, -0.02862654, 0, 0.2431373, 1, 1,
0.3022617, 1.853746, -1.882144, 0, 0.2392157, 1, 1,
0.3024684, -1.322807, 2.941905, 0, 0.2313726, 1, 1,
0.3037517, -0.8963848, 1.281676, 0, 0.227451, 1, 1,
0.3102484, 0.7715961, 0.5412174, 0, 0.2196078, 1, 1,
0.3116572, 0.5291791, -0.7162815, 0, 0.2156863, 1, 1,
0.3138663, 1.873113, 0.04596858, 0, 0.2078431, 1, 1,
0.315521, 0.3128553, 0.4125903, 0, 0.2039216, 1, 1,
0.3160424, 0.06729575, 1.551736, 0, 0.1960784, 1, 1,
0.3178046, 0.2897269, 1.247024, 0, 0.1882353, 1, 1,
0.3188394, 0.4527044, -0.8368117, 0, 0.1843137, 1, 1,
0.3253583, -0.3078838, 3.037992, 0, 0.1764706, 1, 1,
0.3313648, 0.8314939, -0.6127868, 0, 0.172549, 1, 1,
0.3316192, -1.164171, 2.625094, 0, 0.1647059, 1, 1,
0.3317466, 0.2485248, 0.8406205, 0, 0.1607843, 1, 1,
0.3324231, -0.957042, 2.486251, 0, 0.1529412, 1, 1,
0.3340534, -2.28173, 2.752998, 0, 0.1490196, 1, 1,
0.3356398, 0.9321486, -1.359745, 0, 0.1411765, 1, 1,
0.3358281, 0.1372536, 2.573074, 0, 0.1372549, 1, 1,
0.3380542, -0.604423, 1.506551, 0, 0.1294118, 1, 1,
0.3405555, 1.347147, 1.173437, 0, 0.1254902, 1, 1,
0.3460352, 1.510585, 0.786251, 0, 0.1176471, 1, 1,
0.360937, 1.340067, 1.027534, 0, 0.1137255, 1, 1,
0.3653884, -1.830334, 2.77796, 0, 0.1058824, 1, 1,
0.3655158, 0.2673471, 0.6446841, 0, 0.09803922, 1, 1,
0.3656145, -0.7828599, 2.844346, 0, 0.09411765, 1, 1,
0.3661385, 0.1507834, -0.9751447, 0, 0.08627451, 1, 1,
0.3667352, -1.62673, 2.485004, 0, 0.08235294, 1, 1,
0.3696244, -0.4500288, 3.746646, 0, 0.07450981, 1, 1,
0.3784123, 1.632646, 0.7950486, 0, 0.07058824, 1, 1,
0.3810373, -0.1581856, 2.366729, 0, 0.0627451, 1, 1,
0.3835597, 0.001852636, 2.672379, 0, 0.05882353, 1, 1,
0.3840593, 1.076903, 1.983856, 0, 0.05098039, 1, 1,
0.3855573, 0.02626072, 0.4548903, 0, 0.04705882, 1, 1,
0.3868275, 0.2593109, 1.877828, 0, 0.03921569, 1, 1,
0.3873765, -0.03390757, -0.438876, 0, 0.03529412, 1, 1,
0.3884812, -0.5692927, 3.462114, 0, 0.02745098, 1, 1,
0.3894552, 1.803972, 0.5234625, 0, 0.02352941, 1, 1,
0.3944883, -0.03966627, 1.658244, 0, 0.01568628, 1, 1,
0.3965915, -1.056047, 3.107944, 0, 0.01176471, 1, 1,
0.3975871, 1.235653, -0.8333864, 0, 0.003921569, 1, 1,
0.3990427, 0.7608931, 1.555663, 0.003921569, 0, 1, 1,
0.3995717, -0.7381568, 2.478252, 0.007843138, 0, 1, 1,
0.4001828, 0.3165163, 0.5335295, 0.01568628, 0, 1, 1,
0.401414, 0.07678241, 2.703694, 0.01960784, 0, 1, 1,
0.4027498, -1.344597, 1.847704, 0.02745098, 0, 1, 1,
0.4043251, -0.154906, 1.178004, 0.03137255, 0, 1, 1,
0.4055423, -1.379605, 4.372317, 0.03921569, 0, 1, 1,
0.4120862, 0.5127305, 1.697672, 0.04313726, 0, 1, 1,
0.4162512, -1.003754, 2.146683, 0.05098039, 0, 1, 1,
0.4187217, 0.7276902, 1.110938, 0.05490196, 0, 1, 1,
0.4221129, -1.411986, 3.889035, 0.0627451, 0, 1, 1,
0.4244807, -0.01884209, 1.314183, 0.06666667, 0, 1, 1,
0.4337555, -0.1674764, 2.313914, 0.07450981, 0, 1, 1,
0.4369643, -1.55359, 2.540414, 0.07843138, 0, 1, 1,
0.4380427, -0.03197816, 2.09142, 0.08627451, 0, 1, 1,
0.4409732, 1.092817, -0.129363, 0.09019608, 0, 1, 1,
0.4446303, 0.8528904, -0.2738833, 0.09803922, 0, 1, 1,
0.4459604, 0.3674666, 0.02641557, 0.1058824, 0, 1, 1,
0.4494878, -1.587832, 1.33789, 0.1098039, 0, 1, 1,
0.4500862, -1.080535, 3.693716, 0.1176471, 0, 1, 1,
0.4557005, 0.2803348, 0.1338948, 0.1215686, 0, 1, 1,
0.4593565, 0.0581375, 0.4760998, 0.1294118, 0, 1, 1,
0.4612192, 0.9949229, 2.41416, 0.1333333, 0, 1, 1,
0.470743, 1.441868, 1.279881, 0.1411765, 0, 1, 1,
0.4713387, -0.8930737, 3.808306, 0.145098, 0, 1, 1,
0.4756531, -0.1352385, 1.949491, 0.1529412, 0, 1, 1,
0.4793405, -0.1389486, 0.8840748, 0.1568628, 0, 1, 1,
0.4819525, -1.278881, 1.672531, 0.1647059, 0, 1, 1,
0.4843931, 0.380435, -1.522932, 0.1686275, 0, 1, 1,
0.4981906, -0.5018154, 2.53878, 0.1764706, 0, 1, 1,
0.4999538, 2.460499, -0.5226181, 0.1803922, 0, 1, 1,
0.504568, -2.664499, 3.532583, 0.1882353, 0, 1, 1,
0.5055847, -0.2008914, 0.2905125, 0.1921569, 0, 1, 1,
0.5061074, 0.06223598, 1.703469, 0.2, 0, 1, 1,
0.5066589, 1.033367, 1.026299, 0.2078431, 0, 1, 1,
0.5079889, -0.1841059, 1.095453, 0.2117647, 0, 1, 1,
0.508279, -0.6158813, 3.485723, 0.2196078, 0, 1, 1,
0.5122826, 1.025742, 1.071335, 0.2235294, 0, 1, 1,
0.5129776, -1.194338, 3.159807, 0.2313726, 0, 1, 1,
0.5152324, 1.038327, -1.228638, 0.2352941, 0, 1, 1,
0.5157894, -0.1946929, 2.962809, 0.2431373, 0, 1, 1,
0.5193336, 0.7790831, 1.045429, 0.2470588, 0, 1, 1,
0.519934, 0.1732014, 2.043137, 0.254902, 0, 1, 1,
0.5208936, 1.17244, -1.137641, 0.2588235, 0, 1, 1,
0.521703, -1.628712, 3.729555, 0.2666667, 0, 1, 1,
0.5330952, 0.5125592, 1.388043, 0.2705882, 0, 1, 1,
0.5410028, 0.6757327, 0.7929291, 0.2784314, 0, 1, 1,
0.5413607, -1.841751, 3.912825, 0.282353, 0, 1, 1,
0.550132, -0.6200241, 1.318782, 0.2901961, 0, 1, 1,
0.5505911, -0.2838705, -0.5358779, 0.2941177, 0, 1, 1,
0.5517882, 0.5785263, 0.8203521, 0.3019608, 0, 1, 1,
0.556704, -0.5169323, 1.629514, 0.3098039, 0, 1, 1,
0.5641673, 0.6497831, 0.6141939, 0.3137255, 0, 1, 1,
0.5661612, 0.008540328, 1.109913, 0.3215686, 0, 1, 1,
0.5683997, -0.07803922, 2.261595, 0.3254902, 0, 1, 1,
0.5783967, -0.9953607, 4.002494, 0.3333333, 0, 1, 1,
0.5792181, 0.5911186, 0.4017759, 0.3372549, 0, 1, 1,
0.5813726, -1.484482, 2.417997, 0.345098, 0, 1, 1,
0.5832403, 0.2430813, 0.4911932, 0.3490196, 0, 1, 1,
0.5848699, -1.212124, 4.301034, 0.3568628, 0, 1, 1,
0.5873891, -0.688857, 2.970238, 0.3607843, 0, 1, 1,
0.5883372, 0.3823764, 1.82178, 0.3686275, 0, 1, 1,
0.5902072, -0.5037565, 2.628764, 0.372549, 0, 1, 1,
0.5905695, 0.5820129, 1.19022, 0.3803922, 0, 1, 1,
0.5907141, -1.713567, 1.027999, 0.3843137, 0, 1, 1,
0.5967764, 0.9150331, 0.707019, 0.3921569, 0, 1, 1,
0.6022074, -0.4945676, 3.843454, 0.3960784, 0, 1, 1,
0.6031619, 0.1959294, 1.933505, 0.4039216, 0, 1, 1,
0.6039696, 0.4294009, 0.9491216, 0.4117647, 0, 1, 1,
0.609023, 0.01953726, 1.279176, 0.4156863, 0, 1, 1,
0.6130021, -0.03066448, 1.691525, 0.4235294, 0, 1, 1,
0.6257659, 0.06503306, 1.119656, 0.427451, 0, 1, 1,
0.6285951, -0.5429463, 2.229309, 0.4352941, 0, 1, 1,
0.6355522, 0.1006026, 2.237188, 0.4392157, 0, 1, 1,
0.6365061, -0.20929, 0.3600104, 0.4470588, 0, 1, 1,
0.6383497, 1.293628, 1.091665, 0.4509804, 0, 1, 1,
0.6426817, 0.353532, 1.31261, 0.4588235, 0, 1, 1,
0.6460292, 0.07571397, 3.40709, 0.4627451, 0, 1, 1,
0.6472415, -0.4427097, 3.594418, 0.4705882, 0, 1, 1,
0.647321, 1.131541, 2.009981, 0.4745098, 0, 1, 1,
0.6500202, 0.9922892, 1.828227, 0.4823529, 0, 1, 1,
0.6521512, 1.535394, 0.9233108, 0.4862745, 0, 1, 1,
0.6601423, -0.7856448, 2.622191, 0.4941176, 0, 1, 1,
0.6621048, 3.336789, 0.5303211, 0.5019608, 0, 1, 1,
0.6638269, -0.6949197, 1.088521, 0.5058824, 0, 1, 1,
0.6732707, -0.624002, 4.04805, 0.5137255, 0, 1, 1,
0.6797683, -0.7951182, 1.433639, 0.5176471, 0, 1, 1,
0.6809691, 0.2616583, 1.473061, 0.5254902, 0, 1, 1,
0.6844178, 0.4964927, 0.9787208, 0.5294118, 0, 1, 1,
0.6870909, 0.006442484, 1.560161, 0.5372549, 0, 1, 1,
0.6902134, -0.989665, 1.475333, 0.5411765, 0, 1, 1,
0.6960078, -0.9317464, 3.698217, 0.5490196, 0, 1, 1,
0.7039478, -0.2684829, 1.822989, 0.5529412, 0, 1, 1,
0.7073225, 0.9179804, -1.804332, 0.5607843, 0, 1, 1,
0.7076866, -0.1923659, 0.3279083, 0.5647059, 0, 1, 1,
0.7116709, -0.1520686, 3.401256, 0.572549, 0, 1, 1,
0.7189391, -0.1378925, 2.932661, 0.5764706, 0, 1, 1,
0.7223192, -0.1418002, 2.846063, 0.5843138, 0, 1, 1,
0.7305085, -0.2672375, 3.848663, 0.5882353, 0, 1, 1,
0.7306087, 1.106372, 0.8513079, 0.5960785, 0, 1, 1,
0.7310355, -0.3480607, 2.047003, 0.6039216, 0, 1, 1,
0.731815, -1.951228, 4.32845, 0.6078432, 0, 1, 1,
0.733757, -0.1179927, 1.662341, 0.6156863, 0, 1, 1,
0.7345457, -0.5418329, 3.242904, 0.6196079, 0, 1, 1,
0.7390049, 1.484349, 0.1156394, 0.627451, 0, 1, 1,
0.7393169, 0.2470199, -0.03642624, 0.6313726, 0, 1, 1,
0.7460603, -2.746313, 1.395423, 0.6392157, 0, 1, 1,
0.7485854, -0.01581517, 1.540725, 0.6431373, 0, 1, 1,
0.7563879, 0.3534684, 2.08122, 0.6509804, 0, 1, 1,
0.7652443, -0.7978711, 2.291614, 0.654902, 0, 1, 1,
0.7688463, -2.704478, 3.923276, 0.6627451, 0, 1, 1,
0.7864931, -1.536753, 2.736157, 0.6666667, 0, 1, 1,
0.7897524, -0.3176205, 2.666477, 0.6745098, 0, 1, 1,
0.7921003, -0.01366187, 1.288543, 0.6784314, 0, 1, 1,
0.7958238, -0.03657874, 1.204198, 0.6862745, 0, 1, 1,
0.8108893, 0.3143482, 0.6716866, 0.6901961, 0, 1, 1,
0.8152139, -1.35635, -0.2569456, 0.6980392, 0, 1, 1,
0.8165836, 0.2276899, -0.0687708, 0.7058824, 0, 1, 1,
0.8181134, 2.894169, 0.006234215, 0.7098039, 0, 1, 1,
0.8183377, -1.150645, 2.95968, 0.7176471, 0, 1, 1,
0.8247358, 0.4708977, -0.4216426, 0.7215686, 0, 1, 1,
0.8259947, -0.4139734, 2.071539, 0.7294118, 0, 1, 1,
0.8273667, 1.182589, -0.1114404, 0.7333333, 0, 1, 1,
0.8278541, -0.9835517, 1.462843, 0.7411765, 0, 1, 1,
0.835933, 1.082055, -1.890656, 0.7450981, 0, 1, 1,
0.8461173, 0.3910256, -0.0304306, 0.7529412, 0, 1, 1,
0.851292, -0.2561054, 2.985623, 0.7568628, 0, 1, 1,
0.8537325, -0.4758946, -0.09613767, 0.7647059, 0, 1, 1,
0.8562251, -0.5980455, 0.5113835, 0.7686275, 0, 1, 1,
0.8594558, -0.3916132, 1.427375, 0.7764706, 0, 1, 1,
0.8598791, 1.500621, 0.5894163, 0.7803922, 0, 1, 1,
0.8706515, -0.8781044, 2.482178, 0.7882353, 0, 1, 1,
0.8775197, 1.314027, 0.5528924, 0.7921569, 0, 1, 1,
0.883754, -1.159092, 2.002782, 0.8, 0, 1, 1,
0.8841983, 0.5783659, 0.247153, 0.8078431, 0, 1, 1,
0.8910574, -0.08426417, 1.42849, 0.8117647, 0, 1, 1,
0.8917671, -0.168372, 3.130931, 0.8196079, 0, 1, 1,
0.8921443, 2.182701, 1.341292, 0.8235294, 0, 1, 1,
0.8927307, 0.9637554, 0.7888451, 0.8313726, 0, 1, 1,
0.893082, 2.150263, -0.2401653, 0.8352941, 0, 1, 1,
0.893626, -0.4376422, 2.088187, 0.8431373, 0, 1, 1,
0.8953173, 0.9536416, 0.7522853, 0.8470588, 0, 1, 1,
0.8967369, 0.7326167, 0.1204413, 0.854902, 0, 1, 1,
0.8976158, -2.309569, 2.956806, 0.8588235, 0, 1, 1,
0.9047101, -2.405964, 3.158628, 0.8666667, 0, 1, 1,
0.91424, -1.238245, 3.828904, 0.8705882, 0, 1, 1,
0.9153403, -0.9463254, 3.322755, 0.8784314, 0, 1, 1,
0.9213977, -0.2504607, 1.564707, 0.8823529, 0, 1, 1,
0.9221227, -0.006385375, 1.480636, 0.8901961, 0, 1, 1,
0.922838, -0.8898496, 2.346263, 0.8941177, 0, 1, 1,
0.9238409, 0.9678329, -0.8979696, 0.9019608, 0, 1, 1,
0.9244559, 0.07219855, 1.263992, 0.9098039, 0, 1, 1,
0.9299989, 1.092289, 0.1604132, 0.9137255, 0, 1, 1,
0.9373118, -0.5564569, 2.674968, 0.9215686, 0, 1, 1,
0.9452271, -0.5009071, 1.367318, 0.9254902, 0, 1, 1,
0.9469301, -0.4266659, 2.703043, 0.9333333, 0, 1, 1,
0.9473525, -0.02711351, 1.005153, 0.9372549, 0, 1, 1,
0.9480705, 0.1775032, -0.7022404, 0.945098, 0, 1, 1,
0.9553554, -0.02974358, 1.674043, 0.9490196, 0, 1, 1,
0.9560763, 1.021431, -0.1799709, 0.9568627, 0, 1, 1,
0.9565602, -0.6941894, 2.79448, 0.9607843, 0, 1, 1,
0.9661067, 0.74305, 1.145038, 0.9686275, 0, 1, 1,
0.9673028, -0.3293317, -0.8273938, 0.972549, 0, 1, 1,
0.9797509, -0.5984806, 1.425642, 0.9803922, 0, 1, 1,
0.9798706, -1.633724, 2.577183, 0.9843137, 0, 1, 1,
0.9827695, 0.7446046, 0.5134906, 0.9921569, 0, 1, 1,
0.9833558, -1.120374, 3.716677, 0.9960784, 0, 1, 1,
0.9926676, 1.42368, -0.2678979, 1, 0, 0.9960784, 1,
0.9937623, -1.615204, 1.196025, 1, 0, 0.9882353, 1,
1.0249, -0.3189537, 3.894432, 1, 0, 0.9843137, 1,
1.027382, -0.9270282, 2.189847, 1, 0, 0.9764706, 1,
1.032426, 0.5954357, 0.4738805, 1, 0, 0.972549, 1,
1.038351, -1.034171, 2.287753, 1, 0, 0.9647059, 1,
1.043, -0.4965105, 2.933254, 1, 0, 0.9607843, 1,
1.045777, -0.9093694, 2.856454, 1, 0, 0.9529412, 1,
1.047313, -1.713976, 2.45289, 1, 0, 0.9490196, 1,
1.048757, 0.3325827, 2.51416, 1, 0, 0.9411765, 1,
1.049524, -0.2821606, 1.838226, 1, 0, 0.9372549, 1,
1.054906, -0.08992742, 1.837525, 1, 0, 0.9294118, 1,
1.063813, -0.3007091, 3.707476, 1, 0, 0.9254902, 1,
1.069425, -0.9854799, 2.367169, 1, 0, 0.9176471, 1,
1.07385, -0.2812127, 1.983269, 1, 0, 0.9137255, 1,
1.075796, -1.576845, 2.791257, 1, 0, 0.9058824, 1,
1.077661, 0.1854442, 1.583337, 1, 0, 0.9019608, 1,
1.080717, -0.2883327, 1.662699, 1, 0, 0.8941177, 1,
1.083282, -0.08753234, 2.356214, 1, 0, 0.8862745, 1,
1.084294, -0.9644258, 2.019707, 1, 0, 0.8823529, 1,
1.092082, -0.3593209, 1.461897, 1, 0, 0.8745098, 1,
1.094947, -0.1916851, 2.432075, 1, 0, 0.8705882, 1,
1.096677, 0.9233028, 1.288954, 1, 0, 0.8627451, 1,
1.097054, -0.4855959, 1.023614, 1, 0, 0.8588235, 1,
1.102077, -0.6076415, 2.575641, 1, 0, 0.8509804, 1,
1.104199, 2.280785, -0.02687456, 1, 0, 0.8470588, 1,
1.104548, -0.01624822, 3.294278, 1, 0, 0.8392157, 1,
1.106598, -0.4612612, 1.087502, 1, 0, 0.8352941, 1,
1.109265, -0.5050309, -0.1549381, 1, 0, 0.827451, 1,
1.111052, 1.940228, -0.04015581, 1, 0, 0.8235294, 1,
1.113181, -0.5437869, 3.118201, 1, 0, 0.8156863, 1,
1.11382, -2.449679, 3.356364, 1, 0, 0.8117647, 1,
1.130196, 0.2457905, 0.5960426, 1, 0, 0.8039216, 1,
1.134303, -0.9910015, 3.044653, 1, 0, 0.7960784, 1,
1.134304, -0.8282108, 3.640335, 1, 0, 0.7921569, 1,
1.141412, 0.8684521, 2.210928, 1, 0, 0.7843137, 1,
1.142514, 0.5142111, 2.034736, 1, 0, 0.7803922, 1,
1.146071, -0.9017676, 0.04140133, 1, 0, 0.772549, 1,
1.156294, -2.307792, 3.476774, 1, 0, 0.7686275, 1,
1.160369, 0.9629508, 0.5792539, 1, 0, 0.7607843, 1,
1.161552, 0.1246632, 1.065373, 1, 0, 0.7568628, 1,
1.162714, -1.605607, 1.931779, 1, 0, 0.7490196, 1,
1.168245, 1.972145, 0.3463065, 1, 0, 0.7450981, 1,
1.174168, -2.251934, 1.343982, 1, 0, 0.7372549, 1,
1.179154, 1.300513, 1.213849, 1, 0, 0.7333333, 1,
1.18334, -0.1113025, 2.663018, 1, 0, 0.7254902, 1,
1.185219, 1.604367, 0.2437559, 1, 0, 0.7215686, 1,
1.188642, 0.5369021, 1.678463, 1, 0, 0.7137255, 1,
1.192063, 1.239471, 0.4779625, 1, 0, 0.7098039, 1,
1.210584, -0.856977, 1.041412, 1, 0, 0.7019608, 1,
1.21672, -0.2077916, -0.01015763, 1, 0, 0.6941177, 1,
1.219991, 0.09147342, 0.7484773, 1, 0, 0.6901961, 1,
1.221079, -1.571849, 3.535544, 1, 0, 0.682353, 1,
1.226078, -0.1398232, 3.385145, 1, 0, 0.6784314, 1,
1.234281, 0.2051072, -0.3815244, 1, 0, 0.6705883, 1,
1.238002, 0.03499762, 1.767125, 1, 0, 0.6666667, 1,
1.244888, 0.1965511, 1.524812, 1, 0, 0.6588235, 1,
1.263281, 0.2770803, 1.742776, 1, 0, 0.654902, 1,
1.26409, 0.7293956, -0.6760677, 1, 0, 0.6470588, 1,
1.269578, 2.130656, 0.2822228, 1, 0, 0.6431373, 1,
1.279461, 0.5159402, 1.772174, 1, 0, 0.6352941, 1,
1.282968, -1.943776, 0.2732682, 1, 0, 0.6313726, 1,
1.29101, -0.2376917, 1.92113, 1, 0, 0.6235294, 1,
1.294117, 0.2096829, 1.842833, 1, 0, 0.6196079, 1,
1.299688, -1.076953, 2.115064, 1, 0, 0.6117647, 1,
1.313437, -0.5958789, 1.591462, 1, 0, 0.6078432, 1,
1.314638, 0.9799568, 0.1671156, 1, 0, 0.6, 1,
1.315242, -0.05180577, 1.356913, 1, 0, 0.5921569, 1,
1.315338, 0.01893354, 2.193749, 1, 0, 0.5882353, 1,
1.318573, -0.2858967, 1.968952, 1, 0, 0.5803922, 1,
1.325158, 1.091619, 1.373772, 1, 0, 0.5764706, 1,
1.337351, -1.02135, 1.902433, 1, 0, 0.5686275, 1,
1.342034, 2.058964, 0.6497024, 1, 0, 0.5647059, 1,
1.361596, -0.7084553, 2.751716, 1, 0, 0.5568628, 1,
1.364361, -0.9631614, 2.760645, 1, 0, 0.5529412, 1,
1.365102, 0.1083418, 0.639225, 1, 0, 0.5450981, 1,
1.385476, -0.6847669, 3.31883, 1, 0, 0.5411765, 1,
1.411187, -0.002423885, 0.8544399, 1, 0, 0.5333334, 1,
1.423332, 0.7825558, 1.578359, 1, 0, 0.5294118, 1,
1.433341, 0.3523324, 0.7311458, 1, 0, 0.5215687, 1,
1.435603, -0.7642803, 2.463944, 1, 0, 0.5176471, 1,
1.436657, -0.2807449, 2.630203, 1, 0, 0.509804, 1,
1.438072, 0.9675469, 1.845017, 1, 0, 0.5058824, 1,
1.444034, -1.132623, 2.616215, 1, 0, 0.4980392, 1,
1.449937, 0.296391, 0.2795421, 1, 0, 0.4901961, 1,
1.452531, 1.275961, 2.104734, 1, 0, 0.4862745, 1,
1.452748, -1.076995, 3.106329, 1, 0, 0.4784314, 1,
1.452764, -0.371667, 1.773786, 1, 0, 0.4745098, 1,
1.457966, 0.7627294, 2.00613, 1, 0, 0.4666667, 1,
1.458688, 2.380678, 1.278725, 1, 0, 0.4627451, 1,
1.46222, -0.5768272, 1.44722, 1, 0, 0.454902, 1,
1.468188, -0.6670978, 0.9494873, 1, 0, 0.4509804, 1,
1.469144, -0.3203785, 1.745508, 1, 0, 0.4431373, 1,
1.491236, -0.9396949, 3.643419, 1, 0, 0.4392157, 1,
1.500075, 1.692956, -0.01190268, 1, 0, 0.4313726, 1,
1.500967, -0.8798261, 3.773813, 1, 0, 0.427451, 1,
1.501072, 0.4690261, 1.672519, 1, 0, 0.4196078, 1,
1.503397, -0.1621876, 2.584712, 1, 0, 0.4156863, 1,
1.506183, -0.3910703, 1.526754, 1, 0, 0.4078431, 1,
1.509408, -0.2894978, 0.6289226, 1, 0, 0.4039216, 1,
1.521457, -1.480323, 3.194174, 1, 0, 0.3960784, 1,
1.531728, 0.3845299, 0.8614709, 1, 0, 0.3882353, 1,
1.532173, -0.3862236, 1.994082, 1, 0, 0.3843137, 1,
1.53226, -1.440402, 3.058299, 1, 0, 0.3764706, 1,
1.543249, -0.7609661, 2.846275, 1, 0, 0.372549, 1,
1.567402, -0.4631276, 1.172437, 1, 0, 0.3647059, 1,
1.56946, 0.8738515, -0.258026, 1, 0, 0.3607843, 1,
1.584318, -1.305155, 3.428792, 1, 0, 0.3529412, 1,
1.585473, 0.5692236, 1.618559, 1, 0, 0.3490196, 1,
1.586433, -0.3969823, 1.129435, 1, 0, 0.3411765, 1,
1.601317, 1.049687, 1.932264, 1, 0, 0.3372549, 1,
1.607651, -0.3958032, 1.564054, 1, 0, 0.3294118, 1,
1.621662, -1.2637, 2.393795, 1, 0, 0.3254902, 1,
1.623048, 1.559708, 1.560053, 1, 0, 0.3176471, 1,
1.624292, -0.2208606, 1.653655, 1, 0, 0.3137255, 1,
1.626904, 0.4021338, 0.8593276, 1, 0, 0.3058824, 1,
1.64773, 1.104648, 1.395764, 1, 0, 0.2980392, 1,
1.649751, 1.533201, 1.382392, 1, 0, 0.2941177, 1,
1.654855, 0.6259826, 3.41188, 1, 0, 0.2862745, 1,
1.661234, 1.098464, 0.9861143, 1, 0, 0.282353, 1,
1.673399, 1.039903, -0.6059442, 1, 0, 0.2745098, 1,
1.673627, -0.9088871, 0.9481853, 1, 0, 0.2705882, 1,
1.689249, 0.4301444, -0.01695589, 1, 0, 0.2627451, 1,
1.690497, -1.438969, 0.9333305, 1, 0, 0.2588235, 1,
1.702589, 0.9007527, 1.756884, 1, 0, 0.2509804, 1,
1.70517, 0.7456659, 2.000687, 1, 0, 0.2470588, 1,
1.708652, -1.431341, 4.531965, 1, 0, 0.2392157, 1,
1.719366, 1.943398, 0.905169, 1, 0, 0.2352941, 1,
1.728992, 0.4314758, 0.007197625, 1, 0, 0.227451, 1,
1.73776, -1.546493, 1.930371, 1, 0, 0.2235294, 1,
1.74166, 1.217917, 0.2185123, 1, 0, 0.2156863, 1,
1.742312, -0.90177, 1.532883, 1, 0, 0.2117647, 1,
1.749551, -2.206544, 3.541113, 1, 0, 0.2039216, 1,
1.763355, -1.371287, 2.518429, 1, 0, 0.1960784, 1,
1.781322, 0.1170874, 1.159887, 1, 0, 0.1921569, 1,
1.808608, 1.040295, 1.814544, 1, 0, 0.1843137, 1,
1.813929, -0.4848067, 0.9645643, 1, 0, 0.1803922, 1,
1.817509, -0.06450906, 3.747908, 1, 0, 0.172549, 1,
1.823346, -0.3663054, 3.317884, 1, 0, 0.1686275, 1,
1.831188, 0.02988846, 2.360312, 1, 0, 0.1607843, 1,
1.845114, -1.706386, 3.836042, 1, 0, 0.1568628, 1,
1.873833, 0.7538354, 0.7169659, 1, 0, 0.1490196, 1,
1.886726, -1.574436, 0.802054, 1, 0, 0.145098, 1,
1.903616, 0.4287583, 0.8799137, 1, 0, 0.1372549, 1,
1.916517, -0.01807744, 1.402597, 1, 0, 0.1333333, 1,
1.944722, -1.690231, 3.460991, 1, 0, 0.1254902, 1,
1.945807, 0.7398134, 3.146266, 1, 0, 0.1215686, 1,
1.953235, 0.2193352, 2.312188, 1, 0, 0.1137255, 1,
1.961126, -0.8151251, 2.778664, 1, 0, 0.1098039, 1,
1.982412, 0.3505629, -0.9794936, 1, 0, 0.1019608, 1,
1.988863, -0.1836852, 1.617481, 1, 0, 0.09411765, 1,
1.98948, -0.407315, 2.628203, 1, 0, 0.09019608, 1,
1.993681, -0.60905, 1.065896, 1, 0, 0.08235294, 1,
2.029354, -0.07841079, 0.9839354, 1, 0, 0.07843138, 1,
2.036858, 0.8327197, 0.6590189, 1, 0, 0.07058824, 1,
2.064619, -1.781705, 1.465412, 1, 0, 0.06666667, 1,
2.227241, 1.048784, 1.431969, 1, 0, 0.05882353, 1,
2.229974, -1.277454, 0.9605908, 1, 0, 0.05490196, 1,
2.471619, 0.2755155, 2.618081, 1, 0, 0.04705882, 1,
2.497273, -3.24933, 1.923527, 1, 0, 0.04313726, 1,
2.507921, 0.391389, 1.241033, 1, 0, 0.03529412, 1,
2.582265, -1.861397, 2.965891, 1, 0, 0.03137255, 1,
2.801316, 0.9129581, 2.414716, 1, 0, 0.02352941, 1,
3.235915, 0.1747234, 1.794258, 1, 0, 0.01960784, 1,
3.277826, 1.481077, 0.09203693, 1, 0, 0.01176471, 1,
3.576553, -1.533647, 2.380209, 1, 0, 0.007843138, 1
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
0.06396401, -4.580823, -6.896555, 0, -0.5, 0.5, 0.5,
0.06396401, -4.580823, -6.896555, 1, -0.5, 0.5, 0.5,
0.06396401, -4.580823, -6.896555, 1, 1.5, 0.5, 0.5,
0.06396401, -4.580823, -6.896555, 0, 1.5, 0.5, 0.5
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
-4.639393, -0.04825246, -6.896555, 0, -0.5, 0.5, 0.5,
-4.639393, -0.04825246, -6.896555, 1, -0.5, 0.5, 0.5,
-4.639393, -0.04825246, -6.896555, 1, 1.5, 0.5, 0.5,
-4.639393, -0.04825246, -6.896555, 0, 1.5, 0.5, 0.5
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
-4.639393, -4.580823, -0.295733, 0, -0.5, 0.5, 0.5,
-4.639393, -4.580823, -0.295733, 1, -0.5, 0.5, 0.5,
-4.639393, -4.580823, -0.295733, 1, 1.5, 0.5, 0.5,
-4.639393, -4.580823, -0.295733, 0, 1.5, 0.5, 0.5
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
-2, -3.534846, -5.373289,
2, -3.534846, -5.373289,
-2, -3.534846, -5.373289,
-2, -3.709175, -5.627166,
0, -3.534846, -5.373289,
0, -3.709175, -5.627166,
2, -3.534846, -5.373289,
2, -3.709175, -5.627166
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
-2, -4.057835, -6.134922, 0, -0.5, 0.5, 0.5,
-2, -4.057835, -6.134922, 1, -0.5, 0.5, 0.5,
-2, -4.057835, -6.134922, 1, 1.5, 0.5, 0.5,
-2, -4.057835, -6.134922, 0, 1.5, 0.5, 0.5,
0, -4.057835, -6.134922, 0, -0.5, 0.5, 0.5,
0, -4.057835, -6.134922, 1, -0.5, 0.5, 0.5,
0, -4.057835, -6.134922, 1, 1.5, 0.5, 0.5,
0, -4.057835, -6.134922, 0, 1.5, 0.5, 0.5,
2, -4.057835, -6.134922, 0, -0.5, 0.5, 0.5,
2, -4.057835, -6.134922, 1, -0.5, 0.5, 0.5,
2, -4.057835, -6.134922, 1, 1.5, 0.5, 0.5,
2, -4.057835, -6.134922, 0, 1.5, 0.5, 0.5
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
-3.554003, -3, -5.373289,
-3.554003, 3, -5.373289,
-3.554003, -3, -5.373289,
-3.734901, -3, -5.627166,
-3.554003, -2, -5.373289,
-3.734901, -2, -5.627166,
-3.554003, -1, -5.373289,
-3.734901, -1, -5.627166,
-3.554003, 0, -5.373289,
-3.734901, 0, -5.627166,
-3.554003, 1, -5.373289,
-3.734901, 1, -5.627166,
-3.554003, 2, -5.373289,
-3.734901, 2, -5.627166,
-3.554003, 3, -5.373289,
-3.734901, 3, -5.627166
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
-4.096698, -3, -6.134922, 0, -0.5, 0.5, 0.5,
-4.096698, -3, -6.134922, 1, -0.5, 0.5, 0.5,
-4.096698, -3, -6.134922, 1, 1.5, 0.5, 0.5,
-4.096698, -3, -6.134922, 0, 1.5, 0.5, 0.5,
-4.096698, -2, -6.134922, 0, -0.5, 0.5, 0.5,
-4.096698, -2, -6.134922, 1, -0.5, 0.5, 0.5,
-4.096698, -2, -6.134922, 1, 1.5, 0.5, 0.5,
-4.096698, -2, -6.134922, 0, 1.5, 0.5, 0.5,
-4.096698, -1, -6.134922, 0, -0.5, 0.5, 0.5,
-4.096698, -1, -6.134922, 1, -0.5, 0.5, 0.5,
-4.096698, -1, -6.134922, 1, 1.5, 0.5, 0.5,
-4.096698, -1, -6.134922, 0, 1.5, 0.5, 0.5,
-4.096698, 0, -6.134922, 0, -0.5, 0.5, 0.5,
-4.096698, 0, -6.134922, 1, -0.5, 0.5, 0.5,
-4.096698, 0, -6.134922, 1, 1.5, 0.5, 0.5,
-4.096698, 0, -6.134922, 0, 1.5, 0.5, 0.5,
-4.096698, 1, -6.134922, 0, -0.5, 0.5, 0.5,
-4.096698, 1, -6.134922, 1, -0.5, 0.5, 0.5,
-4.096698, 1, -6.134922, 1, 1.5, 0.5, 0.5,
-4.096698, 1, -6.134922, 0, 1.5, 0.5, 0.5,
-4.096698, 2, -6.134922, 0, -0.5, 0.5, 0.5,
-4.096698, 2, -6.134922, 1, -0.5, 0.5, 0.5,
-4.096698, 2, -6.134922, 1, 1.5, 0.5, 0.5,
-4.096698, 2, -6.134922, 0, 1.5, 0.5, 0.5,
-4.096698, 3, -6.134922, 0, -0.5, 0.5, 0.5,
-4.096698, 3, -6.134922, 1, -0.5, 0.5, 0.5,
-4.096698, 3, -6.134922, 1, 1.5, 0.5, 0.5,
-4.096698, 3, -6.134922, 0, 1.5, 0.5, 0.5
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
-3.554003, -3.534846, -4,
-3.554003, -3.534846, 4,
-3.554003, -3.534846, -4,
-3.734901, -3.709175, -4,
-3.554003, -3.534846, -2,
-3.734901, -3.709175, -2,
-3.554003, -3.534846, 0,
-3.734901, -3.709175, 0,
-3.554003, -3.534846, 2,
-3.734901, -3.709175, 2,
-3.554003, -3.534846, 4,
-3.734901, -3.709175, 4
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
-4.096698, -4.057835, -4, 0, -0.5, 0.5, 0.5,
-4.096698, -4.057835, -4, 1, -0.5, 0.5, 0.5,
-4.096698, -4.057835, -4, 1, 1.5, 0.5, 0.5,
-4.096698, -4.057835, -4, 0, 1.5, 0.5, 0.5,
-4.096698, -4.057835, -2, 0, -0.5, 0.5, 0.5,
-4.096698, -4.057835, -2, 1, -0.5, 0.5, 0.5,
-4.096698, -4.057835, -2, 1, 1.5, 0.5, 0.5,
-4.096698, -4.057835, -2, 0, 1.5, 0.5, 0.5,
-4.096698, -4.057835, 0, 0, -0.5, 0.5, 0.5,
-4.096698, -4.057835, 0, 1, -0.5, 0.5, 0.5,
-4.096698, -4.057835, 0, 1, 1.5, 0.5, 0.5,
-4.096698, -4.057835, 0, 0, 1.5, 0.5, 0.5,
-4.096698, -4.057835, 2, 0, -0.5, 0.5, 0.5,
-4.096698, -4.057835, 2, 1, -0.5, 0.5, 0.5,
-4.096698, -4.057835, 2, 1, 1.5, 0.5, 0.5,
-4.096698, -4.057835, 2, 0, 1.5, 0.5, 0.5,
-4.096698, -4.057835, 4, 0, -0.5, 0.5, 0.5,
-4.096698, -4.057835, 4, 1, -0.5, 0.5, 0.5,
-4.096698, -4.057835, 4, 1, 1.5, 0.5, 0.5,
-4.096698, -4.057835, 4, 0, 1.5, 0.5, 0.5
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
-3.554003, -3.534846, -5.373289,
-3.554003, 3.438341, -5.373289,
-3.554003, -3.534846, 4.781823,
-3.554003, 3.438341, 4.781823,
-3.554003, -3.534846, -5.373289,
-3.554003, -3.534846, 4.781823,
-3.554003, 3.438341, -5.373289,
-3.554003, 3.438341, 4.781823,
-3.554003, -3.534846, -5.373289,
3.681931, -3.534846, -5.373289,
-3.554003, -3.534846, 4.781823,
3.681931, -3.534846, 4.781823,
-3.554003, 3.438341, -5.373289,
3.681931, 3.438341, -5.373289,
-3.554003, 3.438341, 4.781823,
3.681931, 3.438341, 4.781823,
3.681931, -3.534846, -5.373289,
3.681931, 3.438341, -5.373289,
3.681931, -3.534846, 4.781823,
3.681931, 3.438341, 4.781823,
3.681931, -3.534846, -5.373289,
3.681931, -3.534846, 4.781823,
3.681931, 3.438341, -5.373289,
3.681931, 3.438341, 4.781823
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
var radius = 7.628831;
var distance = 33.94153;
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
mvMatrix.translate( -0.06396401, 0.04825246, 0.295733 );
mvMatrix.scale( 1.139928, 1.18288, 0.8122453 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94153);
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
siduron<-read.table("siduron.xyz")
```

```
## Error in read.table("siduron.xyz"): no lines available in input
```

```r
x<-siduron$V2
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
```

```r
y<-siduron$V3
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
```

```r
z<-siduron$V4
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
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
-3.448625, -0.2694992, -1.025953, 0, 0, 1, 1, 1,
-3.123296, -1.532898, -2.121123, 1, 0, 0, 1, 1,
-2.645448, -0.3391041, -0.5621222, 1, 0, 0, 1, 1,
-2.620294, -0.1670004, -2.729509, 1, 0, 0, 1, 1,
-2.563788, 0.4760564, -1.438056, 1, 0, 0, 1, 1,
-2.347933, -1.938247, -0.6188077, 1, 0, 0, 1, 1,
-2.341588, 1.770022, -1.042755, 0, 0, 0, 1, 1,
-2.270227, 0.01738237, -1.462485, 0, 0, 0, 1, 1,
-2.225151, -1.589716, -0.6802173, 0, 0, 0, 1, 1,
-2.218076, -0.09285583, -0.654686, 0, 0, 0, 1, 1,
-2.186857, 0.1587313, -2.254049, 0, 0, 0, 1, 1,
-2.170263, -1.007165, -3.012879, 0, 0, 0, 1, 1,
-2.116162, 0.5692841, 0.2551123, 0, 0, 0, 1, 1,
-2.114834, -0.05319097, -1.293318, 1, 1, 1, 1, 1,
-2.093932, -1.872877, -1.61034, 1, 1, 1, 1, 1,
-2.087243, -1.180209, -3.159945, 1, 1, 1, 1, 1,
-2.07892, -1.094087, -1.416564, 1, 1, 1, 1, 1,
-2.001335, 0.3941378, -1.627736, 1, 1, 1, 1, 1,
-2.000844, 0.2171404, -1.497337, 1, 1, 1, 1, 1,
-1.988302, 0.3454906, -1.908434, 1, 1, 1, 1, 1,
-1.979426, 2.265658, -1.898207, 1, 1, 1, 1, 1,
-1.961689, 0.3385109, -1.728914, 1, 1, 1, 1, 1,
-1.951329, -0.6251155, -2.117994, 1, 1, 1, 1, 1,
-1.93758, -1.28291, -3.418681, 1, 1, 1, 1, 1,
-1.905017, 1.260072, -0.981107, 1, 1, 1, 1, 1,
-1.897014, 0.4232821, -3.130982, 1, 1, 1, 1, 1,
-1.890189, -0.06228264, -1.632815, 1, 1, 1, 1, 1,
-1.882222, 0.2398462, -1.555978, 1, 1, 1, 1, 1,
-1.848948, -1.362969, -3.901778, 0, 0, 1, 1, 1,
-1.839104, 0.3921095, -3.996582, 1, 0, 0, 1, 1,
-1.832459, -0.6269143, -3.438178, 1, 0, 0, 1, 1,
-1.822786, 1.087058, -2.191826, 1, 0, 0, 1, 1,
-1.806701, 0.5206143, -1.092568, 1, 0, 0, 1, 1,
-1.789194, -1.885372, -3.171852, 1, 0, 0, 1, 1,
-1.784524, 0.4128326, -1.420734, 0, 0, 0, 1, 1,
-1.754919, 0.7390303, 0.2878043, 0, 0, 0, 1, 1,
-1.72835, 0.05837861, -2.108073, 0, 0, 0, 1, 1,
-1.716591, -0.2253052, -2.167382, 0, 0, 0, 1, 1,
-1.712163, 0.08995201, -2.303175, 0, 0, 0, 1, 1,
-1.698076, 0.4767925, 1.480112, 0, 0, 0, 1, 1,
-1.696078, 1.630008, -1.302558, 0, 0, 0, 1, 1,
-1.695953, 0.361781, -1.320219, 1, 1, 1, 1, 1,
-1.680458, 0.4036823, -1.773087, 1, 1, 1, 1, 1,
-1.67913, 1.205874, -1.073907, 1, 1, 1, 1, 1,
-1.653108, 1.850663, -0.0197751, 1, 1, 1, 1, 1,
-1.6462, 1.210251, -1.409595, 1, 1, 1, 1, 1,
-1.645225, 2.301187, -1.92429, 1, 1, 1, 1, 1,
-1.641109, 2.423054, -1.095884, 1, 1, 1, 1, 1,
-1.632715, -0.9724692, -3.626228, 1, 1, 1, 1, 1,
-1.632685, -2.169018, -1.751957, 1, 1, 1, 1, 1,
-1.617064, 1.193433, 1.295763, 1, 1, 1, 1, 1,
-1.607296, 1.863759, 0.3827302, 1, 1, 1, 1, 1,
-1.600072, -0.7876593, -2.913699, 1, 1, 1, 1, 1,
-1.584024, -0.1699819, -2.569721, 1, 1, 1, 1, 1,
-1.582823, -1.914817, -1.976175, 1, 1, 1, 1, 1,
-1.582034, -2.023062, -2.634181, 1, 1, 1, 1, 1,
-1.581697, -1.308249, -2.667295, 0, 0, 1, 1, 1,
-1.569211, -0.2450672, -0.09191945, 1, 0, 0, 1, 1,
-1.568123, 0.4190181, -2.884598, 1, 0, 0, 1, 1,
-1.567551, -2.197769, -2.457814, 1, 0, 0, 1, 1,
-1.559311, 0.1503507, -1.704363, 1, 0, 0, 1, 1,
-1.538664, -1.151523, -1.75034, 1, 0, 0, 1, 1,
-1.537074, 1.605824, -0.3013608, 0, 0, 0, 1, 1,
-1.53109, 0.7495164, -2.981355, 0, 0, 0, 1, 1,
-1.528538, -2.579677, -3.474304, 0, 0, 0, 1, 1,
-1.52376, -2.200737, -0.8673404, 0, 0, 0, 1, 1,
-1.519867, 0.429585, 1.284497, 0, 0, 0, 1, 1,
-1.516748, 0.06985939, -1.010791, 0, 0, 0, 1, 1,
-1.507957, -0.9664866, -2.125597, 0, 0, 0, 1, 1,
-1.482744, 0.1016975, -1.857326, 1, 1, 1, 1, 1,
-1.478551, 0.4987201, -3.205414, 1, 1, 1, 1, 1,
-1.46725, -1.098046, -3.262048, 1, 1, 1, 1, 1,
-1.464672, 0.531754, -1.169302, 1, 1, 1, 1, 1,
-1.44846, -0.1375689, -2.755569, 1, 1, 1, 1, 1,
-1.447226, -2.042376, -3.35665, 1, 1, 1, 1, 1,
-1.447171, -2.011829, -1.996502, 1, 1, 1, 1, 1,
-1.444633, 0.288621, -0.5035992, 1, 1, 1, 1, 1,
-1.439976, -0.4653037, -2.041241, 1, 1, 1, 1, 1,
-1.439096, -0.8722861, -1.499359, 1, 1, 1, 1, 1,
-1.43599, 0.936382, -1.562379, 1, 1, 1, 1, 1,
-1.433923, -0.1424685, 0.3300064, 1, 1, 1, 1, 1,
-1.429333, -1.029671, -2.266388, 1, 1, 1, 1, 1,
-1.428568, 1.191042, -0.7782608, 1, 1, 1, 1, 1,
-1.417469, -0.1393501, -3.126182, 1, 1, 1, 1, 1,
-1.404174, -0.8670215, -1.826635, 0, 0, 1, 1, 1,
-1.402856, -1.761923, -2.730695, 1, 0, 0, 1, 1,
-1.39866, 0.8534126, -0.3402829, 1, 0, 0, 1, 1,
-1.389053, -1.296258, -2.854055, 1, 0, 0, 1, 1,
-1.386837, -1.276384, -2.936391, 1, 0, 0, 1, 1,
-1.379702, -0.5377722, -2.964708, 1, 0, 0, 1, 1,
-1.36907, -1.79853, -1.138088, 0, 0, 0, 1, 1,
-1.367015, 0.2268251, -2.28221, 0, 0, 0, 1, 1,
-1.348362, -0.9569938, -2.562646, 0, 0, 0, 1, 1,
-1.343654, 0.02199063, -0.8908849, 0, 0, 0, 1, 1,
-1.340754, -0.01454765, -0.7373235, 0, 0, 0, 1, 1,
-1.338776, 0.7476322, -1.712398, 0, 0, 0, 1, 1,
-1.337445, 0.6598555, -0.1898653, 0, 0, 0, 1, 1,
-1.33102, 0.7834954, -0.3451258, 1, 1, 1, 1, 1,
-1.32901, -0.6523518, -3.976443, 1, 1, 1, 1, 1,
-1.302742, -2.310679, -3.110019, 1, 1, 1, 1, 1,
-1.302694, 0.1929753, -1.024078, 1, 1, 1, 1, 1,
-1.300711, 0.6873028, -0.737992, 1, 1, 1, 1, 1,
-1.299001, 0.7027705, -1.062887, 1, 1, 1, 1, 1,
-1.283316, 1.346575, -0.3825584, 1, 1, 1, 1, 1,
-1.282712, -0.8018724, 0.3963335, 1, 1, 1, 1, 1,
-1.280882, 0.3053653, -0.197769, 1, 1, 1, 1, 1,
-1.280423, -0.846333, -0.3667462, 1, 1, 1, 1, 1,
-1.266953, 0.4243792, -0.7422517, 1, 1, 1, 1, 1,
-1.257186, 1.393446, -1.52707, 1, 1, 1, 1, 1,
-1.24322, 0.5067653, -1.382157, 1, 1, 1, 1, 1,
-1.241894, -0.9875755, -1.579331, 1, 1, 1, 1, 1,
-1.240851, -0.7375191, -3.411276, 1, 1, 1, 1, 1,
-1.233607, 0.5849882, 0.1806344, 0, 0, 1, 1, 1,
-1.226739, -0.3679538, -1.252297, 1, 0, 0, 1, 1,
-1.221104, 0.1548637, -0.9178579, 1, 0, 0, 1, 1,
-1.220882, -0.9416476, -0.9404746, 1, 0, 0, 1, 1,
-1.212207, 0.4302136, -1.379521, 1, 0, 0, 1, 1,
-1.208122, -0.8696592, -0.3077817, 1, 0, 0, 1, 1,
-1.203657, -0.4218191, -2.988673, 0, 0, 0, 1, 1,
-1.203555, 0.9116622, -3.132751, 0, 0, 0, 1, 1,
-1.198539, 0.5694346, -0.03036809, 0, 0, 0, 1, 1,
-1.194624, 0.2476614, -0.677847, 0, 0, 0, 1, 1,
-1.190621, -1.367638, -2.809763, 0, 0, 0, 1, 1,
-1.189985, 0.9956792, -3.132109, 0, 0, 0, 1, 1,
-1.187059, -1.082308, -2.357235, 0, 0, 0, 1, 1,
-1.184113, 0.1205087, -1.263878, 1, 1, 1, 1, 1,
-1.183291, -0.2776069, -1.611985, 1, 1, 1, 1, 1,
-1.176465, -0.678978, -1.176509, 1, 1, 1, 1, 1,
-1.164578, -0.7456886, -3.737777, 1, 1, 1, 1, 1,
-1.164336, -1.031512, -0.7064182, 1, 1, 1, 1, 1,
-1.158379, 0.8951746, -0.5814677, 1, 1, 1, 1, 1,
-1.155153, -0.3691153, -0.7115667, 1, 1, 1, 1, 1,
-1.152311, 1.267138, -1.151966, 1, 1, 1, 1, 1,
-1.15213, 0.8472278, 0.2844397, 1, 1, 1, 1, 1,
-1.151572, -0.7398228, -1.376846, 1, 1, 1, 1, 1,
-1.149922, 1.205725, -1.546665, 1, 1, 1, 1, 1,
-1.147481, -0.7010629, -3.462883, 1, 1, 1, 1, 1,
-1.146799, 0.9126823, -1.690004, 1, 1, 1, 1, 1,
-1.137842, 1.992427, -0.9400311, 1, 1, 1, 1, 1,
-1.130968, 0.2658927, -1.186233, 1, 1, 1, 1, 1,
-1.129989, -0.4600581, -3.420171, 0, 0, 1, 1, 1,
-1.119943, 0.2457057, -0.8617812, 1, 0, 0, 1, 1,
-1.1172, 3.25747, -0.8926154, 1, 0, 0, 1, 1,
-1.111616, -0.8057538, -1.336896, 1, 0, 0, 1, 1,
-1.107974, 0.1640173, -1.23685, 1, 0, 0, 1, 1,
-1.101622, 0.7692668, -2.427423, 1, 0, 0, 1, 1,
-1.097122, 0.176066, 0.05803365, 0, 0, 0, 1, 1,
-1.093393, -0.09182227, -1.391235, 0, 0, 0, 1, 1,
-1.089261, 1.761873, -0.4920542, 0, 0, 0, 1, 1,
-1.087502, -0.8667944, -1.906932, 0, 0, 0, 1, 1,
-1.076218, 1.014964, -1.232682, 0, 0, 0, 1, 1,
-1.075455, -0.3128776, -3.051015, 0, 0, 0, 1, 1,
-1.06613, 0.3884402, -1.130827, 0, 0, 0, 1, 1,
-1.061249, 1.473346, 1.881935, 1, 1, 1, 1, 1,
-1.060803, 0.09204266, -0.4122138, 1, 1, 1, 1, 1,
-1.056451, -0.1429981, -1.139941, 1, 1, 1, 1, 1,
-1.055761, -0.4007501, 0.1062648, 1, 1, 1, 1, 1,
-1.055106, 0.4455497, -0.3076937, 1, 1, 1, 1, 1,
-1.038028, 1.594683, 0.9353004, 1, 1, 1, 1, 1,
-1.036537, -1.174863, -3.11322, 1, 1, 1, 1, 1,
-1.028125, -0.3071182, -3.68632, 1, 1, 1, 1, 1,
-1.020003, -0.6068404, -2.537988, 1, 1, 1, 1, 1,
-1.018723, -0.5746562, -2.97097, 1, 1, 1, 1, 1,
-1.015901, -1.163886, -3.842143, 1, 1, 1, 1, 1,
-1.01361, 0.846466, -1.490532, 1, 1, 1, 1, 1,
-1.011103, 0.3332064, -1.455174, 1, 1, 1, 1, 1,
-1.010373, 2.03489, 0.07272688, 1, 1, 1, 1, 1,
-1.008681, 1.026728, -1.666976, 1, 1, 1, 1, 1,
-1.003167, -1.910748, -1.677334, 0, 0, 1, 1, 1,
-1.002106, -1.175301, -0.400727, 1, 0, 0, 1, 1,
-1.001548, -0.8560123, -3.307941, 1, 0, 0, 1, 1,
-1.000086, 0.7593037, -3.276105, 1, 0, 0, 1, 1,
-0.9988557, 0.4579658, -1.337244, 1, 0, 0, 1, 1,
-0.9987303, 0.4656653, 0.7611573, 1, 0, 0, 1, 1,
-0.9892683, -0.9064931, -1.947901, 0, 0, 0, 1, 1,
-0.9875673, 1.300565, -0.3862664, 0, 0, 0, 1, 1,
-0.9849274, -2.150281, -3.911162, 0, 0, 0, 1, 1,
-0.984091, -1.866455, -2.421137, 0, 0, 0, 1, 1,
-0.977577, 2.112979, -0.5236571, 0, 0, 0, 1, 1,
-0.971745, 0.2959863, -2.698453, 0, 0, 0, 1, 1,
-0.9638878, 0.8922077, -0.716482, 0, 0, 0, 1, 1,
-0.9602347, 0.9544464, -1.261875, 1, 1, 1, 1, 1,
-0.9595963, 0.1224155, -0.8417297, 1, 1, 1, 1, 1,
-0.9587539, -1.165434, -2.754374, 1, 1, 1, 1, 1,
-0.9492669, 1.139809, -0.2189834, 1, 1, 1, 1, 1,
-0.9488288, 0.05419372, -2.429943, 1, 1, 1, 1, 1,
-0.9427877, 1.309986, -2.746944, 1, 1, 1, 1, 1,
-0.9426442, 0.2277468, -1.091964, 1, 1, 1, 1, 1,
-0.9357988, -0.541438, -2.141707, 1, 1, 1, 1, 1,
-0.9352464, -0.8178251, -2.511973, 1, 1, 1, 1, 1,
-0.9259309, -0.4255368, 0.1876251, 1, 1, 1, 1, 1,
-0.9250046, 2.079506, 0.2565651, 1, 1, 1, 1, 1,
-0.9205073, 0.6108062, 0.137585, 1, 1, 1, 1, 1,
-0.9201657, -0.6575448, -3.592874, 1, 1, 1, 1, 1,
-0.9158541, 0.3327455, -1.535464, 1, 1, 1, 1, 1,
-0.9155726, -2.231689, -1.724025, 1, 1, 1, 1, 1,
-0.9151244, 0.196888, -3.969747, 0, 0, 1, 1, 1,
-0.9017963, 0.03675284, -1.533222, 1, 0, 0, 1, 1,
-0.8970176, -0.6687043, -1.832789, 1, 0, 0, 1, 1,
-0.8966624, 0.6357621, -1.494993, 1, 0, 0, 1, 1,
-0.8955285, -0.2392643, -0.5740572, 1, 0, 0, 1, 1,
-0.8936255, -1.180002, -4.66261, 1, 0, 0, 1, 1,
-0.8926421, -1.379509, -2.808517, 0, 0, 0, 1, 1,
-0.8914766, -0.8053452, -2.512941, 0, 0, 0, 1, 1,
-0.8861455, 0.5487311, -1.530791, 0, 0, 0, 1, 1,
-0.8861324, -0.6712203, -2.106904, 0, 0, 0, 1, 1,
-0.8801052, -0.4445857, -0.3173218, 0, 0, 0, 1, 1,
-0.8768346, 0.3069448, 1.001303, 0, 0, 0, 1, 1,
-0.867266, -0.2937656, -2.890925, 0, 0, 0, 1, 1,
-0.859322, 0.3229915, -2.308937, 1, 1, 1, 1, 1,
-0.8592806, -1.249784, -3.387516, 1, 1, 1, 1, 1,
-0.8540265, -2.239373, -2.186114, 1, 1, 1, 1, 1,
-0.8530477, -1.477189, -2.604283, 1, 1, 1, 1, 1,
-0.8510981, -0.5154433, -2.955539, 1, 1, 1, 1, 1,
-0.8505756, 1.507876, -1.629977, 1, 1, 1, 1, 1,
-0.8453581, 0.5308162, -2.100174, 1, 1, 1, 1, 1,
-0.8424125, 1.275102, -2.764248, 1, 1, 1, 1, 1,
-0.8420824, -0.7602124, -1.123369, 1, 1, 1, 1, 1,
-0.8184838, 0.4377529, -1.624504, 1, 1, 1, 1, 1,
-0.8176244, -1.439384, -1.984618, 1, 1, 1, 1, 1,
-0.8174257, 0.2469567, -0.8861994, 1, 1, 1, 1, 1,
-0.8164051, 0.7553732, 0.7196238, 1, 1, 1, 1, 1,
-0.8146161, 0.608818, -0.2826664, 1, 1, 1, 1, 1,
-0.8097308, -1.41835, -2.616638, 1, 1, 1, 1, 1,
-0.8071299, -0.4264895, -3.295119, 0, 0, 1, 1, 1,
-0.8025168, 0.739346, -2.226655, 1, 0, 0, 1, 1,
-0.8019298, 0.276288, -0.3976533, 1, 0, 0, 1, 1,
-0.8004863, -0.6362241, -1.811144, 1, 0, 0, 1, 1,
-0.7993367, 1.761595, -0.8088682, 1, 0, 0, 1, 1,
-0.7977545, 0.09304065, -0.008558195, 1, 0, 0, 1, 1,
-0.7952636, -0.1149923, -1.302316, 0, 0, 0, 1, 1,
-0.794571, -0.2607508, -3.115811, 0, 0, 0, 1, 1,
-0.7925279, -0.1375984, -2.218644, 0, 0, 0, 1, 1,
-0.7921839, 0.4058798, -3.069952, 0, 0, 0, 1, 1,
-0.7870381, -1.36335, -1.112784, 0, 0, 0, 1, 1,
-0.7846568, 1.417433, -1.340256, 0, 0, 0, 1, 1,
-0.7831257, -0.04168754, -0.7506572, 0, 0, 0, 1, 1,
-0.7819979, -0.4350356, -2.235425, 1, 1, 1, 1, 1,
-0.7791939, 1.168029, -0.5746151, 1, 1, 1, 1, 1,
-0.7664998, -0.4005354, -2.6123, 1, 1, 1, 1, 1,
-0.7599828, 0.6243941, -0.2755701, 1, 1, 1, 1, 1,
-0.7581324, -1.352364, -2.119128, 1, 1, 1, 1, 1,
-0.757526, -0.8364565, -2.454015, 1, 1, 1, 1, 1,
-0.7524639, -0.780569, -0.2821436, 1, 1, 1, 1, 1,
-0.7504117, 2.227496, -1.435745, 1, 1, 1, 1, 1,
-0.7489376, 0.1723697, -1.809388, 1, 1, 1, 1, 1,
-0.7455756, -0.4765196, -4.114587, 1, 1, 1, 1, 1,
-0.7423863, -0.6463614, -1.715502, 1, 1, 1, 1, 1,
-0.7359359, 0.1448419, -0.05184618, 1, 1, 1, 1, 1,
-0.7359273, 0.9480058, -0.6760409, 1, 1, 1, 1, 1,
-0.7304989, 0.9040033, -0.1580399, 1, 1, 1, 1, 1,
-0.7155561, 1.091425, -1.007561, 1, 1, 1, 1, 1,
-0.7139209, -0.9090427, -2.118468, 0, 0, 1, 1, 1,
-0.7135068, -0.07656609, -2.220323, 1, 0, 0, 1, 1,
-0.7134139, -0.1117426, -1.439956, 1, 0, 0, 1, 1,
-0.7122977, -0.8056591, -1.580271, 1, 0, 0, 1, 1,
-0.7087823, 1.062157, -1.699932, 1, 0, 0, 1, 1,
-0.7073729, 0.08299121, -0.6074365, 1, 0, 0, 1, 1,
-0.7062402, -0.5476416, -0.2901003, 0, 0, 0, 1, 1,
-0.7055365, -1.383285, -1.721271, 0, 0, 0, 1, 1,
-0.7030381, 0.09561095, -1.580598, 0, 0, 0, 1, 1,
-0.694378, 1.123941, 0.2139283, 0, 0, 0, 1, 1,
-0.6924848, 0.1190321, -2.23655, 0, 0, 0, 1, 1,
-0.689814, 0.2256345, -1.116139, 0, 0, 0, 1, 1,
-0.6858619, 1.032991, 0.1438624, 0, 0, 0, 1, 1,
-0.6837734, 2.051324, 1.87311, 1, 1, 1, 1, 1,
-0.6827836, -0.03970154, -1.769412, 1, 1, 1, 1, 1,
-0.6814804, 0.5579804, -0.9353731, 1, 1, 1, 1, 1,
-0.6811411, 0.8247967, -1.010335, 1, 1, 1, 1, 1,
-0.6772863, 1.680556, -0.2076691, 1, 1, 1, 1, 1,
-0.6745404, 1.151612, -0.002141821, 1, 1, 1, 1, 1,
-0.6731272, -1.425377, -2.442564, 1, 1, 1, 1, 1,
-0.672483, -0.2583537, -1.679594, 1, 1, 1, 1, 1,
-0.6701124, -0.4296401, -1.682656, 1, 1, 1, 1, 1,
-0.6676562, 0.5559096, 0.3919466, 1, 1, 1, 1, 1,
-0.6671996, 0.06300156, -1.125577, 1, 1, 1, 1, 1,
-0.6669915, -0.0226656, -0.2787485, 1, 1, 1, 1, 1,
-0.66681, 2.098686, 0.1114322, 1, 1, 1, 1, 1,
-0.6644757, -1.168553, -2.807416, 1, 1, 1, 1, 1,
-0.660473, 1.344532, 0.4191658, 1, 1, 1, 1, 1,
-0.6590202, 0.2794791, -0.2737184, 0, 0, 1, 1, 1,
-0.6552027, 0.1699473, -0.435711, 1, 0, 0, 1, 1,
-0.6495637, 0.2741707, -1.765304, 1, 0, 0, 1, 1,
-0.6433939, -0.4242089, -0.9422055, 1, 0, 0, 1, 1,
-0.6393198, 0.2169501, -1.150486, 1, 0, 0, 1, 1,
-0.6351387, 0.9935893, -1.916752, 1, 0, 0, 1, 1,
-0.6347142, -0.9484388, -2.414119, 0, 0, 0, 1, 1,
-0.6315515, -1.024342, -2.521044, 0, 0, 0, 1, 1,
-0.6280114, 1.071529, 0.2896546, 0, 0, 0, 1, 1,
-0.6261811, -0.2385725, -2.147655, 0, 0, 0, 1, 1,
-0.6252807, -0.02162711, -1.111731, 0, 0, 0, 1, 1,
-0.6193716, 0.2302767, -0.9900105, 0, 0, 0, 1, 1,
-0.6190702, 2.084736, 0.3086152, 0, 0, 0, 1, 1,
-0.6130409, 0.7595891, -1.832143, 1, 1, 1, 1, 1,
-0.6046247, -0.6673002, -4.107092, 1, 1, 1, 1, 1,
-0.6045921, -1.602417, -1.760102, 1, 1, 1, 1, 1,
-0.5988334, -0.2556091, -1.229917, 1, 1, 1, 1, 1,
-0.5974799, 1.210309, -1.310334, 1, 1, 1, 1, 1,
-0.5881503, 0.4682301, -0.8548626, 1, 1, 1, 1, 1,
-0.5857922, -0.8058739, -2.597014, 1, 1, 1, 1, 1,
-0.5836888, -0.6774434, -1.842665, 1, 1, 1, 1, 1,
-0.5832484, -1.409589, -2.097423, 1, 1, 1, 1, 1,
-0.5738685, 0.9403915, -0.06490138, 1, 1, 1, 1, 1,
-0.5731842, -1.841685, -2.917996, 1, 1, 1, 1, 1,
-0.5712596, 2.08587, 1.071801, 1, 1, 1, 1, 1,
-0.5697954, -0.9933094, -2.340083, 1, 1, 1, 1, 1,
-0.5639861, -0.09000055, -2.260153, 1, 1, 1, 1, 1,
-0.5636784, 3.083376, -0.0286016, 1, 1, 1, 1, 1,
-0.5635821, 1.619836, -1.435705, 0, 0, 1, 1, 1,
-0.5541705, -0.7987637, -3.286647, 1, 0, 0, 1, 1,
-0.5489519, 0.4250938, -0.3779444, 1, 0, 0, 1, 1,
-0.5412708, 0.02972077, -3.661984, 1, 0, 0, 1, 1,
-0.5320934, -1.074299, -3.148777, 1, 0, 0, 1, 1,
-0.5317336, -0.617137, -3.396124, 1, 0, 0, 1, 1,
-0.5255508, -1.456411, -2.636101, 0, 0, 0, 1, 1,
-0.5237985, -0.9370092, -2.966446, 0, 0, 0, 1, 1,
-0.5198228, -1.129136, -2.709461, 0, 0, 0, 1, 1,
-0.5161515, 1.258824, 2.349894, 0, 0, 0, 1, 1,
-0.5152318, 0.8449327, -1.223322, 0, 0, 0, 1, 1,
-0.514788, -1.442689, -2.429503, 0, 0, 0, 1, 1,
-0.5108858, 0.1756342, -1.390102, 0, 0, 0, 1, 1,
-0.5059078, 0.8540436, 1.146848, 1, 1, 1, 1, 1,
-0.5057405, 0.2382881, -0.7630249, 1, 1, 1, 1, 1,
-0.5053038, 1.20969, 0.1549275, 1, 1, 1, 1, 1,
-0.5033693, 1.861333, -1.087131, 1, 1, 1, 1, 1,
-0.4998058, -0.6458551, -2.435407, 1, 1, 1, 1, 1,
-0.4993738, 0.6950501, -2.636178, 1, 1, 1, 1, 1,
-0.4959642, -1.436348, -3.36144, 1, 1, 1, 1, 1,
-0.4959017, -0.7512437, -2.603374, 1, 1, 1, 1, 1,
-0.493852, -0.3315933, -2.878223, 1, 1, 1, 1, 1,
-0.4910084, -1.100717, -1.329975, 1, 1, 1, 1, 1,
-0.4834883, 1.423504, 0.07654128, 1, 1, 1, 1, 1,
-0.4771212, 0.2077138, -3.013976, 1, 1, 1, 1, 1,
-0.4768828, 0.4731142, -0.006201783, 1, 1, 1, 1, 1,
-0.4751121, 1.590996, 1.132399, 1, 1, 1, 1, 1,
-0.473181, -0.6552888, -3.788615, 1, 1, 1, 1, 1,
-0.4714015, -1.166559, -2.915273, 0, 0, 1, 1, 1,
-0.4700746, 0.3571336, -0.7426656, 1, 0, 0, 1, 1,
-0.4668012, 0.2856976, -2.123256, 1, 0, 0, 1, 1,
-0.4658217, 0.4492877, -1.248509, 1, 0, 0, 1, 1,
-0.4604999, -0.235903, -1.722425, 1, 0, 0, 1, 1,
-0.45521, -2.284303, -3.312165, 1, 0, 0, 1, 1,
-0.4505155, -0.546365, -3.857527, 0, 0, 0, 1, 1,
-0.449525, 1.67784, -0.1916954, 0, 0, 0, 1, 1,
-0.4452094, -0.2678279, -1.599413, 0, 0, 0, 1, 1,
-0.4411443, 0.9270099, -0.7397216, 0, 0, 0, 1, 1,
-0.4402196, -0.09244952, -2.68036, 0, 0, 0, 1, 1,
-0.438341, 0.1886734, 0.1309923, 0, 0, 0, 1, 1,
-0.4351301, -1.545749, -3.71459, 0, 0, 0, 1, 1,
-0.4348317, 1.015313, -0.4180111, 1, 1, 1, 1, 1,
-0.4330912, -1.169064, -1.738335, 1, 1, 1, 1, 1,
-0.4323658, -0.8968706, -4.284816, 1, 1, 1, 1, 1,
-0.4290436, -0.3738298, -2.042579, 1, 1, 1, 1, 1,
-0.4240666, -0.825609, -1.946947, 1, 1, 1, 1, 1,
-0.4177299, -0.0351009, -0.8424075, 1, 1, 1, 1, 1,
-0.4151381, -0.9977655, -3.140855, 1, 1, 1, 1, 1,
-0.4135639, 1.330832, 0.4033887, 1, 1, 1, 1, 1,
-0.4083053, -2.073438, -3.210973, 1, 1, 1, 1, 1,
-0.4075939, -3.433294, -2.341082, 1, 1, 1, 1, 1,
-0.4052108, 0.006600248, -2.542609, 1, 1, 1, 1, 1,
-0.4046288, -0.800312, -3.677653, 1, 1, 1, 1, 1,
-0.4019732, 1.954011, 0.8247668, 1, 1, 1, 1, 1,
-0.4009939, 0.7448709, -1.032862, 1, 1, 1, 1, 1,
-0.3899984, -0.8355691, -2.82009, 1, 1, 1, 1, 1,
-0.3807619, -1.211237, -2.035954, 0, 0, 1, 1, 1,
-0.3790585, 1.564376, 0.3276366, 1, 0, 0, 1, 1,
-0.3782011, -1.286885, -1.137301, 1, 0, 0, 1, 1,
-0.3676072, -0.02577143, -1.315027, 1, 0, 0, 1, 1,
-0.3634035, -0.5083044, -2.365042, 1, 0, 0, 1, 1,
-0.3581144, 1.511789, -0.7888751, 1, 0, 0, 1, 1,
-0.3563182, 0.8148941, -1.046006, 0, 0, 0, 1, 1,
-0.3562853, 1.138542, -0.03209633, 0, 0, 0, 1, 1,
-0.3553168, -0.08699121, 0.3857924, 0, 0, 0, 1, 1,
-0.3532657, -0.8909806, -1.307649, 0, 0, 0, 1, 1,
-0.3420304, 0.5748, -1.738093, 0, 0, 0, 1, 1,
-0.3420235, -0.1611662, -2.223269, 0, 0, 0, 1, 1,
-0.3405676, -1.54016, -3.429323, 0, 0, 0, 1, 1,
-0.3348242, 0.9664006, -0.7607394, 1, 1, 1, 1, 1,
-0.3335095, 2.600032, 0.801621, 1, 1, 1, 1, 1,
-0.3301321, 1.303419, -1.261633, 1, 1, 1, 1, 1,
-0.3294846, 0.2777617, -0.2892323, 1, 1, 1, 1, 1,
-0.3285976, 1.414221, -1.00622, 1, 1, 1, 1, 1,
-0.3241955, 1.350702, -1.941004, 1, 1, 1, 1, 1,
-0.3238354, 0.8633221, 0.5709044, 1, 1, 1, 1, 1,
-0.3179751, -0.1031407, -2.140673, 1, 1, 1, 1, 1,
-0.3168395, -1.243745, -3.441788, 1, 1, 1, 1, 1,
-0.3161218, 0.555649, -2.012219, 1, 1, 1, 1, 1,
-0.3118495, -1.939826, -2.701417, 1, 1, 1, 1, 1,
-0.3092427, 0.4465342, -0.5636147, 1, 1, 1, 1, 1,
-0.308547, -0.8701197, -0.06025531, 1, 1, 1, 1, 1,
-0.3082649, -0.489953, -3.420042, 1, 1, 1, 1, 1,
-0.3076945, 0.8628123, 0.111895, 1, 1, 1, 1, 1,
-0.3076648, -0.3651298, -1.870988, 0, 0, 1, 1, 1,
-0.3066646, 0.5851848, -0.1888628, 1, 0, 0, 1, 1,
-0.3001546, 0.7853419, 0.5300395, 1, 0, 0, 1, 1,
-0.2920148, 0.6604402, 1.400056, 1, 0, 0, 1, 1,
-0.2920129, -0.06905691, -1.817536, 1, 0, 0, 1, 1,
-0.2897407, 1.124012, -2.049454, 1, 0, 0, 1, 1,
-0.2875665, 0.920248, 0.4268679, 0, 0, 0, 1, 1,
-0.2846145, -0.2581664, -0.9374271, 0, 0, 0, 1, 1,
-0.2831515, 0.5157785, -1.540671, 0, 0, 0, 1, 1,
-0.2806256, -0.7122453, -0.3744186, 0, 0, 0, 1, 1,
-0.2766046, -1.67565, -3.079931, 0, 0, 0, 1, 1,
-0.2741883, 0.1298131, -1.380874, 0, 0, 0, 1, 1,
-0.2711723, 0.06470646, -0.298748, 0, 0, 0, 1, 1,
-0.2706179, 0.494519, -0.8821166, 1, 1, 1, 1, 1,
-0.2682073, -0.7041196, -1.910746, 1, 1, 1, 1, 1,
-0.2639164, -1.506055, -2.727693, 1, 1, 1, 1, 1,
-0.2611053, 0.6745715, 1.764094, 1, 1, 1, 1, 1,
-0.2605374, -0.7951655, -1.310495, 1, 1, 1, 1, 1,
-0.2599417, 0.07509276, -1.165654, 1, 1, 1, 1, 1,
-0.25971, -0.0148668, -1.803848, 1, 1, 1, 1, 1,
-0.2590642, 0.9450931, -1.975818, 1, 1, 1, 1, 1,
-0.2570014, -1.557829, -1.657295, 1, 1, 1, 1, 1,
-0.2546632, -0.8233873, -2.348079, 1, 1, 1, 1, 1,
-0.2542956, 0.8273185, -0.3438793, 1, 1, 1, 1, 1,
-0.2528777, -0.1045711, -1.370037, 1, 1, 1, 1, 1,
-0.2524117, 1.20061, 0.2509353, 1, 1, 1, 1, 1,
-0.2507755, -0.472367, -2.814754, 1, 1, 1, 1, 1,
-0.2507678, 0.7521701, -0.3301042, 1, 1, 1, 1, 1,
-0.2505755, 0.7759045, 0.3388101, 0, 0, 1, 1, 1,
-0.2480238, -0.7040576, -1.666645, 1, 0, 0, 1, 1,
-0.2465336, -0.6592899, -1.624808, 1, 0, 0, 1, 1,
-0.2412508, 1.025875, -0.6718309, 1, 0, 0, 1, 1,
-0.2383854, -0.7980415, -2.006928, 1, 0, 0, 1, 1,
-0.2351883, 2.585857, 0.4633967, 1, 0, 0, 1, 1,
-0.2350357, 0.5852534, -0.7498247, 0, 0, 0, 1, 1,
-0.2346373, 0.05669728, -1.405133, 0, 0, 0, 1, 1,
-0.2308661, 0.883453, 1.821946, 0, 0, 0, 1, 1,
-0.2294623, 1.415551, -1.205456, 0, 0, 0, 1, 1,
-0.227399, 1.702269, 0.08946024, 0, 0, 0, 1, 1,
-0.225999, 0.5236163, -0.7809166, 0, 0, 0, 1, 1,
-0.2214973, 0.09257006, -1.779506, 0, 0, 0, 1, 1,
-0.2162967, -0.1035237, -2.276364, 1, 1, 1, 1, 1,
-0.2111194, -0.2818166, -1.00706, 1, 1, 1, 1, 1,
-0.207099, -1.148486, -1.718772, 1, 1, 1, 1, 1,
-0.2010199, 0.3517127, -0.9950055, 1, 1, 1, 1, 1,
-0.1977854, -0.05997426, -0.9646574, 1, 1, 1, 1, 1,
-0.1931881, 0.3358752, -0.02058143, 1, 1, 1, 1, 1,
-0.1928658, 1.056286, 0.6693681, 1, 1, 1, 1, 1,
-0.1926363, 1.533896, -1.899554, 1, 1, 1, 1, 1,
-0.1915388, 0.691836, 0.8714395, 1, 1, 1, 1, 1,
-0.1891553, -0.5340124, -4.489684, 1, 1, 1, 1, 1,
-0.1882469, -0.4595111, -1.430689, 1, 1, 1, 1, 1,
-0.1813299, 0.6338938, 0.5740666, 1, 1, 1, 1, 1,
-0.1808891, -0.6104501, -2.883105, 1, 1, 1, 1, 1,
-0.1770942, 1.048605, 0.8197471, 1, 1, 1, 1, 1,
-0.1729821, 1.282482, -0.6502028, 1, 1, 1, 1, 1,
-0.1687332, 0.1761463, -2.279642, 0, 0, 1, 1, 1,
-0.1664622, -0.8720143, -3.078594, 1, 0, 0, 1, 1,
-0.1609578, -0.9736776, -2.030996, 1, 0, 0, 1, 1,
-0.1607187, 2.091095, -2.660695, 1, 0, 0, 1, 1,
-0.1569314, 0.5719163, -0.8100639, 1, 0, 0, 1, 1,
-0.1531971, 0.5634002, 0.3271186, 1, 0, 0, 1, 1,
-0.1488023, 0.4224603, -2.244438, 0, 0, 0, 1, 1,
-0.1483406, 0.01027439, -0.07792774, 0, 0, 0, 1, 1,
-0.1441583, -0.7395296, -2.743885, 0, 0, 0, 1, 1,
-0.1358997, 1.253026, -0.9873767, 0, 0, 0, 1, 1,
-0.1347505, -0.6527351, -3.239701, 0, 0, 0, 1, 1,
-0.1344809, -1.037331, -4.057221, 0, 0, 0, 1, 1,
-0.132322, -0.3123237, -2.733346, 0, 0, 0, 1, 1,
-0.1275558, 1.666235, -2.316782, 1, 1, 1, 1, 1,
-0.1201269, 1.243139, -0.6219311, 1, 1, 1, 1, 1,
-0.1199147, -1.442261, -4.143711, 1, 1, 1, 1, 1,
-0.1156236, -0.4159383, -2.895821, 1, 1, 1, 1, 1,
-0.1144075, 1.448996, -1.475445, 1, 1, 1, 1, 1,
-0.1110077, -0.9438362, -5.225399, 1, 1, 1, 1, 1,
-0.110116, -1.01456, -3.0941, 1, 1, 1, 1, 1,
-0.1089418, -1.382354, -3.772542, 1, 1, 1, 1, 1,
-0.1041414, -0.2524522, -3.76875, 1, 1, 1, 1, 1,
-0.09988554, 0.9207623, -1.374075, 1, 1, 1, 1, 1,
-0.08915689, -0.2415984, -1.13807, 1, 1, 1, 1, 1,
-0.08441713, -0.6463901, -3.362082, 1, 1, 1, 1, 1,
-0.08131723, 0.0670289, -1.007334, 1, 1, 1, 1, 1,
-0.07880963, -1.301872, -3.077458, 1, 1, 1, 1, 1,
-0.07789257, -1.218446, -0.9499044, 1, 1, 1, 1, 1,
-0.07571828, 1.579755, 0.6404263, 0, 0, 1, 1, 1,
-0.07260984, -0.4614266, -2.519378, 1, 0, 0, 1, 1,
-0.07233251, -0.7468091, -4.817008, 1, 0, 0, 1, 1,
-0.07197592, -0.7758186, -1.202278, 1, 0, 0, 1, 1,
-0.07171573, 1.515566, 0.6441386, 1, 0, 0, 1, 1,
-0.07151325, 0.6983231, -0.4168075, 1, 0, 0, 1, 1,
-0.06985275, -1.65883, -1.830412, 0, 0, 0, 1, 1,
-0.06548015, 0.06630172, -0.7882283, 0, 0, 0, 1, 1,
-0.06172862, -1.20188, -3.052621, 0, 0, 0, 1, 1,
-0.06034119, -0.4180436, -1.805249, 0, 0, 0, 1, 1,
-0.05622995, 1.326869, 0.2148207, 0, 0, 0, 1, 1,
-0.05558484, 1.879059, -0.5640757, 0, 0, 0, 1, 1,
-0.05516677, -1.005128, -1.102809, 0, 0, 0, 1, 1,
-0.05278286, 0.4891303, -0.1487216, 1, 1, 1, 1, 1,
-0.04927704, -1.000274, -2.905495, 1, 1, 1, 1, 1,
-0.04520751, 0.08075497, -1.250709, 1, 1, 1, 1, 1,
-0.04381441, -1.767172, -2.697985, 1, 1, 1, 1, 1,
-0.04276269, -0.6989077, -3.176852, 1, 1, 1, 1, 1,
-0.04258815, 0.9346985, -0.4436666, 1, 1, 1, 1, 1,
-0.04152889, -1.162098, -3.444526, 1, 1, 1, 1, 1,
-0.04001151, -0.1474841, -2.887232, 1, 1, 1, 1, 1,
-0.03585785, -1.048299, -2.480945, 1, 1, 1, 1, 1,
-0.03416436, 1.219556, -0.6473252, 1, 1, 1, 1, 1,
-0.03291509, -0.8139914, -2.277675, 1, 1, 1, 1, 1,
-0.03220701, 0.2817272, -0.6675413, 1, 1, 1, 1, 1,
-0.02961128, -0.1668206, -2.905972, 1, 1, 1, 1, 1,
-0.02871982, -0.2608815, -1.330977, 1, 1, 1, 1, 1,
-0.02855652, 1.669544, 1.823908, 1, 1, 1, 1, 1,
-0.02729479, -1.115523, -2.527443, 0, 0, 1, 1, 1,
-0.02442478, 0.02881134, 1.663904, 1, 0, 0, 1, 1,
-0.01962194, 0.2190766, -1.886053, 1, 0, 0, 1, 1,
-0.0184544, 0.9255968, 0.8599124, 1, 0, 0, 1, 1,
-0.01425024, -1.329594, -2.388575, 1, 0, 0, 1, 1,
-0.0140254, -1.795169, -3.496268, 1, 0, 0, 1, 1,
-0.00956026, -0.9490123, -4.401501, 0, 0, 0, 1, 1,
-0.009213491, 0.324912, -1.214122, 0, 0, 0, 1, 1,
-0.008578121, -0.1309904, -3.6673, 0, 0, 0, 1, 1,
-0.008024478, 0.5085017, 2.6168, 0, 0, 0, 1, 1,
-0.003136857, 0.9520298, 0.4262635, 0, 0, 0, 1, 1,
0.000336823, -1.339605, 0.2115481, 0, 0, 0, 1, 1,
0.003144333, -0.9268297, 3.207309, 0, 0, 0, 1, 1,
0.004483074, 0.4876676, 0.4511705, 1, 1, 1, 1, 1,
0.005137825, -0.100849, 3.256983, 1, 1, 1, 1, 1,
0.00622688, -1.023452, 2.674358, 1, 1, 1, 1, 1,
0.01220893, -1.200554, 3.83255, 1, 1, 1, 1, 1,
0.01409354, 1.048751, -0.6936501, 1, 1, 1, 1, 1,
0.01518286, -1.213893, 3.216363, 1, 1, 1, 1, 1,
0.01953175, -0.6006647, 3.219076, 1, 1, 1, 1, 1,
0.02162888, 1.106613, -0.8416541, 1, 1, 1, 1, 1,
0.02671, 0.631039, 0.7983391, 1, 1, 1, 1, 1,
0.02816921, 0.5941415, 0.7696686, 1, 1, 1, 1, 1,
0.03732154, -0.2943093, 2.246624, 1, 1, 1, 1, 1,
0.03859742, 0.9643936, 0.9424943, 1, 1, 1, 1, 1,
0.04014328, 0.3709542, 0.4519469, 1, 1, 1, 1, 1,
0.04432574, -2.02977, 3.103437, 1, 1, 1, 1, 1,
0.04772361, -0.1195946, 3.569509, 1, 1, 1, 1, 1,
0.05046804, 0.03289471, 0.3172956, 0, 0, 1, 1, 1,
0.06235541, -1.527516, 2.820075, 1, 0, 0, 1, 1,
0.06426284, -2.156341, 2.879841, 1, 0, 0, 1, 1,
0.06898779, 0.01646375, 0.7445356, 1, 0, 0, 1, 1,
0.07077433, 0.2438615, 0.4411948, 1, 0, 0, 1, 1,
0.07324775, 0.3518906, 0.61577, 1, 0, 0, 1, 1,
0.07434208, -0.02402972, 2.149499, 0, 0, 0, 1, 1,
0.07536463, 0.533166, -0.3229633, 0, 0, 0, 1, 1,
0.0754993, -0.6236775, 3.30478, 0, 0, 0, 1, 1,
0.08389553, 0.7809839, 0.4576633, 0, 0, 0, 1, 1,
0.08391158, -0.3163249, 0.8857125, 0, 0, 0, 1, 1,
0.09264912, -0.3003522, 2.657553, 0, 0, 0, 1, 1,
0.09360669, -0.2438008, 2.719599, 0, 0, 0, 1, 1,
0.09616566, 1.360376, -1.206403, 1, 1, 1, 1, 1,
0.0963693, -0.2937441, 2.759992, 1, 1, 1, 1, 1,
0.09853142, 0.2953001, -0.5684684, 1, 1, 1, 1, 1,
0.1013448, 1.034678, -0.07390063, 1, 1, 1, 1, 1,
0.1023102, 0.04469056, 0.6711994, 1, 1, 1, 1, 1,
0.10233, -0.09500246, 1.23897, 1, 1, 1, 1, 1,
0.1063943, 0.2296813, 2.183163, 1, 1, 1, 1, 1,
0.1069855, 1.607815, 0.02304932, 1, 1, 1, 1, 1,
0.1083858, 0.7036782, -2.228428, 1, 1, 1, 1, 1,
0.1253333, 0.6095519, -0.543775, 1, 1, 1, 1, 1,
0.1276954, -1.746392, 3.519483, 1, 1, 1, 1, 1,
0.1335133, 0.1153478, -0.3434447, 1, 1, 1, 1, 1,
0.1346121, 0.3988681, 0.3947081, 1, 1, 1, 1, 1,
0.1348244, 1.945322, -1.084348, 1, 1, 1, 1, 1,
0.1395277, 2.465458, -0.9911387, 1, 1, 1, 1, 1,
0.1460603, 2.350169, 0.5645331, 0, 0, 1, 1, 1,
0.1464279, 0.6927329, 0.1506031, 1, 0, 0, 1, 1,
0.156307, 0.4939931, -0.7525714, 1, 0, 0, 1, 1,
0.1574016, 1.269124, -0.1946264, 1, 0, 0, 1, 1,
0.1598447, -0.9311397, 3.202785, 1, 0, 0, 1, 1,
0.1602361, 1.595543, -0.7608356, 1, 0, 0, 1, 1,
0.1618054, 0.2996964, 1.860151, 0, 0, 0, 1, 1,
0.1633844, -1.177387, 4.633933, 0, 0, 0, 1, 1,
0.1676762, -0.3951155, 3.430659, 0, 0, 0, 1, 1,
0.1722936, 0.3576538, 0.5133918, 0, 0, 0, 1, 1,
0.17515, -1.000845, 1.797008, 0, 0, 0, 1, 1,
0.1797972, -1.288684, 2.783771, 0, 0, 0, 1, 1,
0.1844577, 1.367167, -0.3967374, 0, 0, 0, 1, 1,
0.1845703, -1.234535, 2.026651, 1, 1, 1, 1, 1,
0.1854652, 0.6970871, 0.1433188, 1, 1, 1, 1, 1,
0.1855099, -0.7346812, 2.11242, 1, 1, 1, 1, 1,
0.1927215, 1.247397, 1.086584, 1, 1, 1, 1, 1,
0.1951671, -0.2018448, 0.5793932, 1, 1, 1, 1, 1,
0.1951807, -1.908434, 4.563744, 1, 1, 1, 1, 1,
0.1980677, -0.8944653, 2.565666, 1, 1, 1, 1, 1,
0.1994118, -0.2983556, 1.316461, 1, 1, 1, 1, 1,
0.2030334, -1.222012, 3.629127, 1, 1, 1, 1, 1,
0.2032728, -1.761643, 2.327411, 1, 1, 1, 1, 1,
0.2078073, -0.3541296, 3.201038, 1, 1, 1, 1, 1,
0.2085324, -0.005849215, 2.989623, 1, 1, 1, 1, 1,
0.2086763, -0.4375783, 2.079239, 1, 1, 1, 1, 1,
0.2097132, 0.8087797, -0.879631, 1, 1, 1, 1, 1,
0.2106327, -0.4980971, 2.111704, 1, 1, 1, 1, 1,
0.2128761, 0.4063409, 0.004158116, 0, 0, 1, 1, 1,
0.2157916, -0.35769, 3.394224, 1, 0, 0, 1, 1,
0.2217345, 2.394862, 1.598368, 1, 0, 0, 1, 1,
0.2232345, 0.06613696, 2.104048, 1, 0, 0, 1, 1,
0.223987, 0.3204319, -0.1651189, 1, 0, 0, 1, 1,
0.2301043, 0.3383828, -0.5948226, 1, 0, 0, 1, 1,
0.2340179, -2.000827, 3.584622, 0, 0, 0, 1, 1,
0.235149, -0.7540745, 2.162734, 0, 0, 0, 1, 1,
0.2356839, 0.4511433, 0.2354353, 0, 0, 0, 1, 1,
0.2390093, 1.441357, 1.72985, 0, 0, 0, 1, 1,
0.2413472, -1.011208, 1.390499, 0, 0, 0, 1, 1,
0.2430271, -0.3599868, 2.188134, 0, 0, 0, 1, 1,
0.2487655, 0.1174726, 2.498628, 0, 0, 0, 1, 1,
0.253673, 0.01666692, 0.8053576, 1, 1, 1, 1, 1,
0.2540726, -0.9247856, 3.7316, 1, 1, 1, 1, 1,
0.2592109, -0.8516696, 2.741682, 1, 1, 1, 1, 1,
0.2636637, -0.5247862, 3.113849, 1, 1, 1, 1, 1,
0.2659519, 0.007872279, 2.654272, 1, 1, 1, 1, 1,
0.2661555, 0.3598552, -1.176742, 1, 1, 1, 1, 1,
0.2675816, 0.5408958, 1.692974, 1, 1, 1, 1, 1,
0.2689166, 1.723153, 2.401571, 1, 1, 1, 1, 1,
0.2697461, 0.7492078, 0.534855, 1, 1, 1, 1, 1,
0.2745984, 0.2555203, -1.278501, 1, 1, 1, 1, 1,
0.2775935, 1.458144, -0.2706463, 1, 1, 1, 1, 1,
0.2839923, 1.026516, 2.35248, 1, 1, 1, 1, 1,
0.285035, 0.03479619, 3.25404, 1, 1, 1, 1, 1,
0.2862374, -0.6441869, 2.720088, 1, 1, 1, 1, 1,
0.2867868, -0.7622594, 1.586575, 1, 1, 1, 1, 1,
0.287867, 1.27784, -0.008478845, 0, 0, 1, 1, 1,
0.2896449, 0.4043363, 1.636934, 1, 0, 0, 1, 1,
0.2917423, -2.434116, 1.131927, 1, 0, 0, 1, 1,
0.2918036, -0.4169152, 3.075, 1, 0, 0, 1, 1,
0.2929492, 1.269628, 0.02786378, 1, 0, 0, 1, 1,
0.2943761, -1.138325, 3.195931, 1, 0, 0, 1, 1,
0.2951722, 1.085571, -0.02607465, 0, 0, 0, 1, 1,
0.2972633, -0.3874606, 2.644525, 0, 0, 0, 1, 1,
0.2977616, 0.4075297, 0.4310348, 0, 0, 0, 1, 1,
0.3004429, -0.1915201, 2.406516, 0, 0, 0, 1, 1,
0.3020117, 0.6638426, -0.02862654, 0, 0, 0, 1, 1,
0.3022617, 1.853746, -1.882144, 0, 0, 0, 1, 1,
0.3024684, -1.322807, 2.941905, 0, 0, 0, 1, 1,
0.3037517, -0.8963848, 1.281676, 1, 1, 1, 1, 1,
0.3102484, 0.7715961, 0.5412174, 1, 1, 1, 1, 1,
0.3116572, 0.5291791, -0.7162815, 1, 1, 1, 1, 1,
0.3138663, 1.873113, 0.04596858, 1, 1, 1, 1, 1,
0.315521, 0.3128553, 0.4125903, 1, 1, 1, 1, 1,
0.3160424, 0.06729575, 1.551736, 1, 1, 1, 1, 1,
0.3178046, 0.2897269, 1.247024, 1, 1, 1, 1, 1,
0.3188394, 0.4527044, -0.8368117, 1, 1, 1, 1, 1,
0.3253583, -0.3078838, 3.037992, 1, 1, 1, 1, 1,
0.3313648, 0.8314939, -0.6127868, 1, 1, 1, 1, 1,
0.3316192, -1.164171, 2.625094, 1, 1, 1, 1, 1,
0.3317466, 0.2485248, 0.8406205, 1, 1, 1, 1, 1,
0.3324231, -0.957042, 2.486251, 1, 1, 1, 1, 1,
0.3340534, -2.28173, 2.752998, 1, 1, 1, 1, 1,
0.3356398, 0.9321486, -1.359745, 1, 1, 1, 1, 1,
0.3358281, 0.1372536, 2.573074, 0, 0, 1, 1, 1,
0.3380542, -0.604423, 1.506551, 1, 0, 0, 1, 1,
0.3405555, 1.347147, 1.173437, 1, 0, 0, 1, 1,
0.3460352, 1.510585, 0.786251, 1, 0, 0, 1, 1,
0.360937, 1.340067, 1.027534, 1, 0, 0, 1, 1,
0.3653884, -1.830334, 2.77796, 1, 0, 0, 1, 1,
0.3655158, 0.2673471, 0.6446841, 0, 0, 0, 1, 1,
0.3656145, -0.7828599, 2.844346, 0, 0, 0, 1, 1,
0.3661385, 0.1507834, -0.9751447, 0, 0, 0, 1, 1,
0.3667352, -1.62673, 2.485004, 0, 0, 0, 1, 1,
0.3696244, -0.4500288, 3.746646, 0, 0, 0, 1, 1,
0.3784123, 1.632646, 0.7950486, 0, 0, 0, 1, 1,
0.3810373, -0.1581856, 2.366729, 0, 0, 0, 1, 1,
0.3835597, 0.001852636, 2.672379, 1, 1, 1, 1, 1,
0.3840593, 1.076903, 1.983856, 1, 1, 1, 1, 1,
0.3855573, 0.02626072, 0.4548903, 1, 1, 1, 1, 1,
0.3868275, 0.2593109, 1.877828, 1, 1, 1, 1, 1,
0.3873765, -0.03390757, -0.438876, 1, 1, 1, 1, 1,
0.3884812, -0.5692927, 3.462114, 1, 1, 1, 1, 1,
0.3894552, 1.803972, 0.5234625, 1, 1, 1, 1, 1,
0.3944883, -0.03966627, 1.658244, 1, 1, 1, 1, 1,
0.3965915, -1.056047, 3.107944, 1, 1, 1, 1, 1,
0.3975871, 1.235653, -0.8333864, 1, 1, 1, 1, 1,
0.3990427, 0.7608931, 1.555663, 1, 1, 1, 1, 1,
0.3995717, -0.7381568, 2.478252, 1, 1, 1, 1, 1,
0.4001828, 0.3165163, 0.5335295, 1, 1, 1, 1, 1,
0.401414, 0.07678241, 2.703694, 1, 1, 1, 1, 1,
0.4027498, -1.344597, 1.847704, 1, 1, 1, 1, 1,
0.4043251, -0.154906, 1.178004, 0, 0, 1, 1, 1,
0.4055423, -1.379605, 4.372317, 1, 0, 0, 1, 1,
0.4120862, 0.5127305, 1.697672, 1, 0, 0, 1, 1,
0.4162512, -1.003754, 2.146683, 1, 0, 0, 1, 1,
0.4187217, 0.7276902, 1.110938, 1, 0, 0, 1, 1,
0.4221129, -1.411986, 3.889035, 1, 0, 0, 1, 1,
0.4244807, -0.01884209, 1.314183, 0, 0, 0, 1, 1,
0.4337555, -0.1674764, 2.313914, 0, 0, 0, 1, 1,
0.4369643, -1.55359, 2.540414, 0, 0, 0, 1, 1,
0.4380427, -0.03197816, 2.09142, 0, 0, 0, 1, 1,
0.4409732, 1.092817, -0.129363, 0, 0, 0, 1, 1,
0.4446303, 0.8528904, -0.2738833, 0, 0, 0, 1, 1,
0.4459604, 0.3674666, 0.02641557, 0, 0, 0, 1, 1,
0.4494878, -1.587832, 1.33789, 1, 1, 1, 1, 1,
0.4500862, -1.080535, 3.693716, 1, 1, 1, 1, 1,
0.4557005, 0.2803348, 0.1338948, 1, 1, 1, 1, 1,
0.4593565, 0.0581375, 0.4760998, 1, 1, 1, 1, 1,
0.4612192, 0.9949229, 2.41416, 1, 1, 1, 1, 1,
0.470743, 1.441868, 1.279881, 1, 1, 1, 1, 1,
0.4713387, -0.8930737, 3.808306, 1, 1, 1, 1, 1,
0.4756531, -0.1352385, 1.949491, 1, 1, 1, 1, 1,
0.4793405, -0.1389486, 0.8840748, 1, 1, 1, 1, 1,
0.4819525, -1.278881, 1.672531, 1, 1, 1, 1, 1,
0.4843931, 0.380435, -1.522932, 1, 1, 1, 1, 1,
0.4981906, -0.5018154, 2.53878, 1, 1, 1, 1, 1,
0.4999538, 2.460499, -0.5226181, 1, 1, 1, 1, 1,
0.504568, -2.664499, 3.532583, 1, 1, 1, 1, 1,
0.5055847, -0.2008914, 0.2905125, 1, 1, 1, 1, 1,
0.5061074, 0.06223598, 1.703469, 0, 0, 1, 1, 1,
0.5066589, 1.033367, 1.026299, 1, 0, 0, 1, 1,
0.5079889, -0.1841059, 1.095453, 1, 0, 0, 1, 1,
0.508279, -0.6158813, 3.485723, 1, 0, 0, 1, 1,
0.5122826, 1.025742, 1.071335, 1, 0, 0, 1, 1,
0.5129776, -1.194338, 3.159807, 1, 0, 0, 1, 1,
0.5152324, 1.038327, -1.228638, 0, 0, 0, 1, 1,
0.5157894, -0.1946929, 2.962809, 0, 0, 0, 1, 1,
0.5193336, 0.7790831, 1.045429, 0, 0, 0, 1, 1,
0.519934, 0.1732014, 2.043137, 0, 0, 0, 1, 1,
0.5208936, 1.17244, -1.137641, 0, 0, 0, 1, 1,
0.521703, -1.628712, 3.729555, 0, 0, 0, 1, 1,
0.5330952, 0.5125592, 1.388043, 0, 0, 0, 1, 1,
0.5410028, 0.6757327, 0.7929291, 1, 1, 1, 1, 1,
0.5413607, -1.841751, 3.912825, 1, 1, 1, 1, 1,
0.550132, -0.6200241, 1.318782, 1, 1, 1, 1, 1,
0.5505911, -0.2838705, -0.5358779, 1, 1, 1, 1, 1,
0.5517882, 0.5785263, 0.8203521, 1, 1, 1, 1, 1,
0.556704, -0.5169323, 1.629514, 1, 1, 1, 1, 1,
0.5641673, 0.6497831, 0.6141939, 1, 1, 1, 1, 1,
0.5661612, 0.008540328, 1.109913, 1, 1, 1, 1, 1,
0.5683997, -0.07803922, 2.261595, 1, 1, 1, 1, 1,
0.5783967, -0.9953607, 4.002494, 1, 1, 1, 1, 1,
0.5792181, 0.5911186, 0.4017759, 1, 1, 1, 1, 1,
0.5813726, -1.484482, 2.417997, 1, 1, 1, 1, 1,
0.5832403, 0.2430813, 0.4911932, 1, 1, 1, 1, 1,
0.5848699, -1.212124, 4.301034, 1, 1, 1, 1, 1,
0.5873891, -0.688857, 2.970238, 1, 1, 1, 1, 1,
0.5883372, 0.3823764, 1.82178, 0, 0, 1, 1, 1,
0.5902072, -0.5037565, 2.628764, 1, 0, 0, 1, 1,
0.5905695, 0.5820129, 1.19022, 1, 0, 0, 1, 1,
0.5907141, -1.713567, 1.027999, 1, 0, 0, 1, 1,
0.5967764, 0.9150331, 0.707019, 1, 0, 0, 1, 1,
0.6022074, -0.4945676, 3.843454, 1, 0, 0, 1, 1,
0.6031619, 0.1959294, 1.933505, 0, 0, 0, 1, 1,
0.6039696, 0.4294009, 0.9491216, 0, 0, 0, 1, 1,
0.609023, 0.01953726, 1.279176, 0, 0, 0, 1, 1,
0.6130021, -0.03066448, 1.691525, 0, 0, 0, 1, 1,
0.6257659, 0.06503306, 1.119656, 0, 0, 0, 1, 1,
0.6285951, -0.5429463, 2.229309, 0, 0, 0, 1, 1,
0.6355522, 0.1006026, 2.237188, 0, 0, 0, 1, 1,
0.6365061, -0.20929, 0.3600104, 1, 1, 1, 1, 1,
0.6383497, 1.293628, 1.091665, 1, 1, 1, 1, 1,
0.6426817, 0.353532, 1.31261, 1, 1, 1, 1, 1,
0.6460292, 0.07571397, 3.40709, 1, 1, 1, 1, 1,
0.6472415, -0.4427097, 3.594418, 1, 1, 1, 1, 1,
0.647321, 1.131541, 2.009981, 1, 1, 1, 1, 1,
0.6500202, 0.9922892, 1.828227, 1, 1, 1, 1, 1,
0.6521512, 1.535394, 0.9233108, 1, 1, 1, 1, 1,
0.6601423, -0.7856448, 2.622191, 1, 1, 1, 1, 1,
0.6621048, 3.336789, 0.5303211, 1, 1, 1, 1, 1,
0.6638269, -0.6949197, 1.088521, 1, 1, 1, 1, 1,
0.6732707, -0.624002, 4.04805, 1, 1, 1, 1, 1,
0.6797683, -0.7951182, 1.433639, 1, 1, 1, 1, 1,
0.6809691, 0.2616583, 1.473061, 1, 1, 1, 1, 1,
0.6844178, 0.4964927, 0.9787208, 1, 1, 1, 1, 1,
0.6870909, 0.006442484, 1.560161, 0, 0, 1, 1, 1,
0.6902134, -0.989665, 1.475333, 1, 0, 0, 1, 1,
0.6960078, -0.9317464, 3.698217, 1, 0, 0, 1, 1,
0.7039478, -0.2684829, 1.822989, 1, 0, 0, 1, 1,
0.7073225, 0.9179804, -1.804332, 1, 0, 0, 1, 1,
0.7076866, -0.1923659, 0.3279083, 1, 0, 0, 1, 1,
0.7116709, -0.1520686, 3.401256, 0, 0, 0, 1, 1,
0.7189391, -0.1378925, 2.932661, 0, 0, 0, 1, 1,
0.7223192, -0.1418002, 2.846063, 0, 0, 0, 1, 1,
0.7305085, -0.2672375, 3.848663, 0, 0, 0, 1, 1,
0.7306087, 1.106372, 0.8513079, 0, 0, 0, 1, 1,
0.7310355, -0.3480607, 2.047003, 0, 0, 0, 1, 1,
0.731815, -1.951228, 4.32845, 0, 0, 0, 1, 1,
0.733757, -0.1179927, 1.662341, 1, 1, 1, 1, 1,
0.7345457, -0.5418329, 3.242904, 1, 1, 1, 1, 1,
0.7390049, 1.484349, 0.1156394, 1, 1, 1, 1, 1,
0.7393169, 0.2470199, -0.03642624, 1, 1, 1, 1, 1,
0.7460603, -2.746313, 1.395423, 1, 1, 1, 1, 1,
0.7485854, -0.01581517, 1.540725, 1, 1, 1, 1, 1,
0.7563879, 0.3534684, 2.08122, 1, 1, 1, 1, 1,
0.7652443, -0.7978711, 2.291614, 1, 1, 1, 1, 1,
0.7688463, -2.704478, 3.923276, 1, 1, 1, 1, 1,
0.7864931, -1.536753, 2.736157, 1, 1, 1, 1, 1,
0.7897524, -0.3176205, 2.666477, 1, 1, 1, 1, 1,
0.7921003, -0.01366187, 1.288543, 1, 1, 1, 1, 1,
0.7958238, -0.03657874, 1.204198, 1, 1, 1, 1, 1,
0.8108893, 0.3143482, 0.6716866, 1, 1, 1, 1, 1,
0.8152139, -1.35635, -0.2569456, 1, 1, 1, 1, 1,
0.8165836, 0.2276899, -0.0687708, 0, 0, 1, 1, 1,
0.8181134, 2.894169, 0.006234215, 1, 0, 0, 1, 1,
0.8183377, -1.150645, 2.95968, 1, 0, 0, 1, 1,
0.8247358, 0.4708977, -0.4216426, 1, 0, 0, 1, 1,
0.8259947, -0.4139734, 2.071539, 1, 0, 0, 1, 1,
0.8273667, 1.182589, -0.1114404, 1, 0, 0, 1, 1,
0.8278541, -0.9835517, 1.462843, 0, 0, 0, 1, 1,
0.835933, 1.082055, -1.890656, 0, 0, 0, 1, 1,
0.8461173, 0.3910256, -0.0304306, 0, 0, 0, 1, 1,
0.851292, -0.2561054, 2.985623, 0, 0, 0, 1, 1,
0.8537325, -0.4758946, -0.09613767, 0, 0, 0, 1, 1,
0.8562251, -0.5980455, 0.5113835, 0, 0, 0, 1, 1,
0.8594558, -0.3916132, 1.427375, 0, 0, 0, 1, 1,
0.8598791, 1.500621, 0.5894163, 1, 1, 1, 1, 1,
0.8706515, -0.8781044, 2.482178, 1, 1, 1, 1, 1,
0.8775197, 1.314027, 0.5528924, 1, 1, 1, 1, 1,
0.883754, -1.159092, 2.002782, 1, 1, 1, 1, 1,
0.8841983, 0.5783659, 0.247153, 1, 1, 1, 1, 1,
0.8910574, -0.08426417, 1.42849, 1, 1, 1, 1, 1,
0.8917671, -0.168372, 3.130931, 1, 1, 1, 1, 1,
0.8921443, 2.182701, 1.341292, 1, 1, 1, 1, 1,
0.8927307, 0.9637554, 0.7888451, 1, 1, 1, 1, 1,
0.893082, 2.150263, -0.2401653, 1, 1, 1, 1, 1,
0.893626, -0.4376422, 2.088187, 1, 1, 1, 1, 1,
0.8953173, 0.9536416, 0.7522853, 1, 1, 1, 1, 1,
0.8967369, 0.7326167, 0.1204413, 1, 1, 1, 1, 1,
0.8976158, -2.309569, 2.956806, 1, 1, 1, 1, 1,
0.9047101, -2.405964, 3.158628, 1, 1, 1, 1, 1,
0.91424, -1.238245, 3.828904, 0, 0, 1, 1, 1,
0.9153403, -0.9463254, 3.322755, 1, 0, 0, 1, 1,
0.9213977, -0.2504607, 1.564707, 1, 0, 0, 1, 1,
0.9221227, -0.006385375, 1.480636, 1, 0, 0, 1, 1,
0.922838, -0.8898496, 2.346263, 1, 0, 0, 1, 1,
0.9238409, 0.9678329, -0.8979696, 1, 0, 0, 1, 1,
0.9244559, 0.07219855, 1.263992, 0, 0, 0, 1, 1,
0.9299989, 1.092289, 0.1604132, 0, 0, 0, 1, 1,
0.9373118, -0.5564569, 2.674968, 0, 0, 0, 1, 1,
0.9452271, -0.5009071, 1.367318, 0, 0, 0, 1, 1,
0.9469301, -0.4266659, 2.703043, 0, 0, 0, 1, 1,
0.9473525, -0.02711351, 1.005153, 0, 0, 0, 1, 1,
0.9480705, 0.1775032, -0.7022404, 0, 0, 0, 1, 1,
0.9553554, -0.02974358, 1.674043, 1, 1, 1, 1, 1,
0.9560763, 1.021431, -0.1799709, 1, 1, 1, 1, 1,
0.9565602, -0.6941894, 2.79448, 1, 1, 1, 1, 1,
0.9661067, 0.74305, 1.145038, 1, 1, 1, 1, 1,
0.9673028, -0.3293317, -0.8273938, 1, 1, 1, 1, 1,
0.9797509, -0.5984806, 1.425642, 1, 1, 1, 1, 1,
0.9798706, -1.633724, 2.577183, 1, 1, 1, 1, 1,
0.9827695, 0.7446046, 0.5134906, 1, 1, 1, 1, 1,
0.9833558, -1.120374, 3.716677, 1, 1, 1, 1, 1,
0.9926676, 1.42368, -0.2678979, 1, 1, 1, 1, 1,
0.9937623, -1.615204, 1.196025, 1, 1, 1, 1, 1,
1.0249, -0.3189537, 3.894432, 1, 1, 1, 1, 1,
1.027382, -0.9270282, 2.189847, 1, 1, 1, 1, 1,
1.032426, 0.5954357, 0.4738805, 1, 1, 1, 1, 1,
1.038351, -1.034171, 2.287753, 1, 1, 1, 1, 1,
1.043, -0.4965105, 2.933254, 0, 0, 1, 1, 1,
1.045777, -0.9093694, 2.856454, 1, 0, 0, 1, 1,
1.047313, -1.713976, 2.45289, 1, 0, 0, 1, 1,
1.048757, 0.3325827, 2.51416, 1, 0, 0, 1, 1,
1.049524, -0.2821606, 1.838226, 1, 0, 0, 1, 1,
1.054906, -0.08992742, 1.837525, 1, 0, 0, 1, 1,
1.063813, -0.3007091, 3.707476, 0, 0, 0, 1, 1,
1.069425, -0.9854799, 2.367169, 0, 0, 0, 1, 1,
1.07385, -0.2812127, 1.983269, 0, 0, 0, 1, 1,
1.075796, -1.576845, 2.791257, 0, 0, 0, 1, 1,
1.077661, 0.1854442, 1.583337, 0, 0, 0, 1, 1,
1.080717, -0.2883327, 1.662699, 0, 0, 0, 1, 1,
1.083282, -0.08753234, 2.356214, 0, 0, 0, 1, 1,
1.084294, -0.9644258, 2.019707, 1, 1, 1, 1, 1,
1.092082, -0.3593209, 1.461897, 1, 1, 1, 1, 1,
1.094947, -0.1916851, 2.432075, 1, 1, 1, 1, 1,
1.096677, 0.9233028, 1.288954, 1, 1, 1, 1, 1,
1.097054, -0.4855959, 1.023614, 1, 1, 1, 1, 1,
1.102077, -0.6076415, 2.575641, 1, 1, 1, 1, 1,
1.104199, 2.280785, -0.02687456, 1, 1, 1, 1, 1,
1.104548, -0.01624822, 3.294278, 1, 1, 1, 1, 1,
1.106598, -0.4612612, 1.087502, 1, 1, 1, 1, 1,
1.109265, -0.5050309, -0.1549381, 1, 1, 1, 1, 1,
1.111052, 1.940228, -0.04015581, 1, 1, 1, 1, 1,
1.113181, -0.5437869, 3.118201, 1, 1, 1, 1, 1,
1.11382, -2.449679, 3.356364, 1, 1, 1, 1, 1,
1.130196, 0.2457905, 0.5960426, 1, 1, 1, 1, 1,
1.134303, -0.9910015, 3.044653, 1, 1, 1, 1, 1,
1.134304, -0.8282108, 3.640335, 0, 0, 1, 1, 1,
1.141412, 0.8684521, 2.210928, 1, 0, 0, 1, 1,
1.142514, 0.5142111, 2.034736, 1, 0, 0, 1, 1,
1.146071, -0.9017676, 0.04140133, 1, 0, 0, 1, 1,
1.156294, -2.307792, 3.476774, 1, 0, 0, 1, 1,
1.160369, 0.9629508, 0.5792539, 1, 0, 0, 1, 1,
1.161552, 0.1246632, 1.065373, 0, 0, 0, 1, 1,
1.162714, -1.605607, 1.931779, 0, 0, 0, 1, 1,
1.168245, 1.972145, 0.3463065, 0, 0, 0, 1, 1,
1.174168, -2.251934, 1.343982, 0, 0, 0, 1, 1,
1.179154, 1.300513, 1.213849, 0, 0, 0, 1, 1,
1.18334, -0.1113025, 2.663018, 0, 0, 0, 1, 1,
1.185219, 1.604367, 0.2437559, 0, 0, 0, 1, 1,
1.188642, 0.5369021, 1.678463, 1, 1, 1, 1, 1,
1.192063, 1.239471, 0.4779625, 1, 1, 1, 1, 1,
1.210584, -0.856977, 1.041412, 1, 1, 1, 1, 1,
1.21672, -0.2077916, -0.01015763, 1, 1, 1, 1, 1,
1.219991, 0.09147342, 0.7484773, 1, 1, 1, 1, 1,
1.221079, -1.571849, 3.535544, 1, 1, 1, 1, 1,
1.226078, -0.1398232, 3.385145, 1, 1, 1, 1, 1,
1.234281, 0.2051072, -0.3815244, 1, 1, 1, 1, 1,
1.238002, 0.03499762, 1.767125, 1, 1, 1, 1, 1,
1.244888, 0.1965511, 1.524812, 1, 1, 1, 1, 1,
1.263281, 0.2770803, 1.742776, 1, 1, 1, 1, 1,
1.26409, 0.7293956, -0.6760677, 1, 1, 1, 1, 1,
1.269578, 2.130656, 0.2822228, 1, 1, 1, 1, 1,
1.279461, 0.5159402, 1.772174, 1, 1, 1, 1, 1,
1.282968, -1.943776, 0.2732682, 1, 1, 1, 1, 1,
1.29101, -0.2376917, 1.92113, 0, 0, 1, 1, 1,
1.294117, 0.2096829, 1.842833, 1, 0, 0, 1, 1,
1.299688, -1.076953, 2.115064, 1, 0, 0, 1, 1,
1.313437, -0.5958789, 1.591462, 1, 0, 0, 1, 1,
1.314638, 0.9799568, 0.1671156, 1, 0, 0, 1, 1,
1.315242, -0.05180577, 1.356913, 1, 0, 0, 1, 1,
1.315338, 0.01893354, 2.193749, 0, 0, 0, 1, 1,
1.318573, -0.2858967, 1.968952, 0, 0, 0, 1, 1,
1.325158, 1.091619, 1.373772, 0, 0, 0, 1, 1,
1.337351, -1.02135, 1.902433, 0, 0, 0, 1, 1,
1.342034, 2.058964, 0.6497024, 0, 0, 0, 1, 1,
1.361596, -0.7084553, 2.751716, 0, 0, 0, 1, 1,
1.364361, -0.9631614, 2.760645, 0, 0, 0, 1, 1,
1.365102, 0.1083418, 0.639225, 1, 1, 1, 1, 1,
1.385476, -0.6847669, 3.31883, 1, 1, 1, 1, 1,
1.411187, -0.002423885, 0.8544399, 1, 1, 1, 1, 1,
1.423332, 0.7825558, 1.578359, 1, 1, 1, 1, 1,
1.433341, 0.3523324, 0.7311458, 1, 1, 1, 1, 1,
1.435603, -0.7642803, 2.463944, 1, 1, 1, 1, 1,
1.436657, -0.2807449, 2.630203, 1, 1, 1, 1, 1,
1.438072, 0.9675469, 1.845017, 1, 1, 1, 1, 1,
1.444034, -1.132623, 2.616215, 1, 1, 1, 1, 1,
1.449937, 0.296391, 0.2795421, 1, 1, 1, 1, 1,
1.452531, 1.275961, 2.104734, 1, 1, 1, 1, 1,
1.452748, -1.076995, 3.106329, 1, 1, 1, 1, 1,
1.452764, -0.371667, 1.773786, 1, 1, 1, 1, 1,
1.457966, 0.7627294, 2.00613, 1, 1, 1, 1, 1,
1.458688, 2.380678, 1.278725, 1, 1, 1, 1, 1,
1.46222, -0.5768272, 1.44722, 0, 0, 1, 1, 1,
1.468188, -0.6670978, 0.9494873, 1, 0, 0, 1, 1,
1.469144, -0.3203785, 1.745508, 1, 0, 0, 1, 1,
1.491236, -0.9396949, 3.643419, 1, 0, 0, 1, 1,
1.500075, 1.692956, -0.01190268, 1, 0, 0, 1, 1,
1.500967, -0.8798261, 3.773813, 1, 0, 0, 1, 1,
1.501072, 0.4690261, 1.672519, 0, 0, 0, 1, 1,
1.503397, -0.1621876, 2.584712, 0, 0, 0, 1, 1,
1.506183, -0.3910703, 1.526754, 0, 0, 0, 1, 1,
1.509408, -0.2894978, 0.6289226, 0, 0, 0, 1, 1,
1.521457, -1.480323, 3.194174, 0, 0, 0, 1, 1,
1.531728, 0.3845299, 0.8614709, 0, 0, 0, 1, 1,
1.532173, -0.3862236, 1.994082, 0, 0, 0, 1, 1,
1.53226, -1.440402, 3.058299, 1, 1, 1, 1, 1,
1.543249, -0.7609661, 2.846275, 1, 1, 1, 1, 1,
1.567402, -0.4631276, 1.172437, 1, 1, 1, 1, 1,
1.56946, 0.8738515, -0.258026, 1, 1, 1, 1, 1,
1.584318, -1.305155, 3.428792, 1, 1, 1, 1, 1,
1.585473, 0.5692236, 1.618559, 1, 1, 1, 1, 1,
1.586433, -0.3969823, 1.129435, 1, 1, 1, 1, 1,
1.601317, 1.049687, 1.932264, 1, 1, 1, 1, 1,
1.607651, -0.3958032, 1.564054, 1, 1, 1, 1, 1,
1.621662, -1.2637, 2.393795, 1, 1, 1, 1, 1,
1.623048, 1.559708, 1.560053, 1, 1, 1, 1, 1,
1.624292, -0.2208606, 1.653655, 1, 1, 1, 1, 1,
1.626904, 0.4021338, 0.8593276, 1, 1, 1, 1, 1,
1.64773, 1.104648, 1.395764, 1, 1, 1, 1, 1,
1.649751, 1.533201, 1.382392, 1, 1, 1, 1, 1,
1.654855, 0.6259826, 3.41188, 0, 0, 1, 1, 1,
1.661234, 1.098464, 0.9861143, 1, 0, 0, 1, 1,
1.673399, 1.039903, -0.6059442, 1, 0, 0, 1, 1,
1.673627, -0.9088871, 0.9481853, 1, 0, 0, 1, 1,
1.689249, 0.4301444, -0.01695589, 1, 0, 0, 1, 1,
1.690497, -1.438969, 0.9333305, 1, 0, 0, 1, 1,
1.702589, 0.9007527, 1.756884, 0, 0, 0, 1, 1,
1.70517, 0.7456659, 2.000687, 0, 0, 0, 1, 1,
1.708652, -1.431341, 4.531965, 0, 0, 0, 1, 1,
1.719366, 1.943398, 0.905169, 0, 0, 0, 1, 1,
1.728992, 0.4314758, 0.007197625, 0, 0, 0, 1, 1,
1.73776, -1.546493, 1.930371, 0, 0, 0, 1, 1,
1.74166, 1.217917, 0.2185123, 0, 0, 0, 1, 1,
1.742312, -0.90177, 1.532883, 1, 1, 1, 1, 1,
1.749551, -2.206544, 3.541113, 1, 1, 1, 1, 1,
1.763355, -1.371287, 2.518429, 1, 1, 1, 1, 1,
1.781322, 0.1170874, 1.159887, 1, 1, 1, 1, 1,
1.808608, 1.040295, 1.814544, 1, 1, 1, 1, 1,
1.813929, -0.4848067, 0.9645643, 1, 1, 1, 1, 1,
1.817509, -0.06450906, 3.747908, 1, 1, 1, 1, 1,
1.823346, -0.3663054, 3.317884, 1, 1, 1, 1, 1,
1.831188, 0.02988846, 2.360312, 1, 1, 1, 1, 1,
1.845114, -1.706386, 3.836042, 1, 1, 1, 1, 1,
1.873833, 0.7538354, 0.7169659, 1, 1, 1, 1, 1,
1.886726, -1.574436, 0.802054, 1, 1, 1, 1, 1,
1.903616, 0.4287583, 0.8799137, 1, 1, 1, 1, 1,
1.916517, -0.01807744, 1.402597, 1, 1, 1, 1, 1,
1.944722, -1.690231, 3.460991, 1, 1, 1, 1, 1,
1.945807, 0.7398134, 3.146266, 0, 0, 1, 1, 1,
1.953235, 0.2193352, 2.312188, 1, 0, 0, 1, 1,
1.961126, -0.8151251, 2.778664, 1, 0, 0, 1, 1,
1.982412, 0.3505629, -0.9794936, 1, 0, 0, 1, 1,
1.988863, -0.1836852, 1.617481, 1, 0, 0, 1, 1,
1.98948, -0.407315, 2.628203, 1, 0, 0, 1, 1,
1.993681, -0.60905, 1.065896, 0, 0, 0, 1, 1,
2.029354, -0.07841079, 0.9839354, 0, 0, 0, 1, 1,
2.036858, 0.8327197, 0.6590189, 0, 0, 0, 1, 1,
2.064619, -1.781705, 1.465412, 0, 0, 0, 1, 1,
2.227241, 1.048784, 1.431969, 0, 0, 0, 1, 1,
2.229974, -1.277454, 0.9605908, 0, 0, 0, 1, 1,
2.471619, 0.2755155, 2.618081, 0, 0, 0, 1, 1,
2.497273, -3.24933, 1.923527, 1, 1, 1, 1, 1,
2.507921, 0.391389, 1.241033, 1, 1, 1, 1, 1,
2.582265, -1.861397, 2.965891, 1, 1, 1, 1, 1,
2.801316, 0.9129581, 2.414716, 1, 1, 1, 1, 1,
3.235915, 0.1747234, 1.794258, 1, 1, 1, 1, 1,
3.277826, 1.481077, 0.09203693, 1, 1, 1, 1, 1,
3.576553, -1.533647, 2.380209, 1, 1, 1, 1, 1
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
var radius = 9.510579;
var distance = 33.40551;
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
mvMatrix.translate( -0.06396413, 0.04825258, 0.295733 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40551);
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
