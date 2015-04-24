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
-2.784638, -0.2798123, -0.3422583, 1, 0, 0, 1,
-2.742395, -2.452919, -1.520963, 1, 0.007843138, 0, 1,
-2.73171, -0.7476002, -1.095306, 1, 0.01176471, 0, 1,
-2.591516, -1.53963, -3.305016, 1, 0.01960784, 0, 1,
-2.46248, 0.09930842, -1.22583, 1, 0.02352941, 0, 1,
-2.440026, -0.06544857, -1.857634, 1, 0.03137255, 0, 1,
-2.439518, 0.1686411, -0.3676703, 1, 0.03529412, 0, 1,
-2.415121, 0.9202275, -0.5816097, 1, 0.04313726, 0, 1,
-2.410684, 0.8174409, -1.493864, 1, 0.04705882, 0, 1,
-2.373478, 0.4793322, -2.024539, 1, 0.05490196, 0, 1,
-2.301471, -0.007843852, -2.008622, 1, 0.05882353, 0, 1,
-2.247472, -0.1283178, -2.29831, 1, 0.06666667, 0, 1,
-2.223336, -0.04360948, -2.738053, 1, 0.07058824, 0, 1,
-2.1976, 0.5498279, -1.229095, 1, 0.07843138, 0, 1,
-2.076049, 0.462471, -3.139822, 1, 0.08235294, 0, 1,
-2.05334, 0.2625108, -1.023183, 1, 0.09019608, 0, 1,
-2.053117, 0.2537925, -1.759321, 1, 0.09411765, 0, 1,
-2.047673, 0.5976283, -0.951675, 1, 0.1019608, 0, 1,
-2.026658, 2.111194, -0.08875082, 1, 0.1098039, 0, 1,
-2.012416, 0.1777826, -2.614536, 1, 0.1137255, 0, 1,
-1.98486, 1.116428, -2.232479, 1, 0.1215686, 0, 1,
-1.893876, 0.7874218, -2.691223, 1, 0.1254902, 0, 1,
-1.882926, -0.1897592, -2.474401, 1, 0.1333333, 0, 1,
-1.859255, -0.07177945, -2.113537, 1, 0.1372549, 0, 1,
-1.796495, -0.9715154, -1.374264, 1, 0.145098, 0, 1,
-1.79306, -1.335893, -1.274496, 1, 0.1490196, 0, 1,
-1.791497, 0.2027057, -0.7037793, 1, 0.1568628, 0, 1,
-1.789888, 0.5272459, -1.865317, 1, 0.1607843, 0, 1,
-1.76624, -1.586215, -1.560551, 1, 0.1686275, 0, 1,
-1.762107, 0.742863, -0.9301968, 1, 0.172549, 0, 1,
-1.75853, -0.7816395, -1.711486, 1, 0.1803922, 0, 1,
-1.753325, 1.194402, -1.449209, 1, 0.1843137, 0, 1,
-1.735957, 0.06427492, -1.304516, 1, 0.1921569, 0, 1,
-1.734819, 0.9340414, -0.9429758, 1, 0.1960784, 0, 1,
-1.734354, 0.2657927, -0.7834557, 1, 0.2039216, 0, 1,
-1.713193, 1.26134, 1.618961, 1, 0.2117647, 0, 1,
-1.713193, 0.3851067, -1.996069, 1, 0.2156863, 0, 1,
-1.69966, 0.5622038, -2.4016, 1, 0.2235294, 0, 1,
-1.694213, 0.6749316, -2.370856, 1, 0.227451, 0, 1,
-1.692185, -0.191243, -1.719284, 1, 0.2352941, 0, 1,
-1.674574, -0.4452588, -2.134741, 1, 0.2392157, 0, 1,
-1.653756, 1.288953, -1.279636, 1, 0.2470588, 0, 1,
-1.647463, -1.120643, -2.117467, 1, 0.2509804, 0, 1,
-1.64175, -2.333784, -1.562474, 1, 0.2588235, 0, 1,
-1.591084, -1.415991, -1.968024, 1, 0.2627451, 0, 1,
-1.590427, 1.738973, -0.1517223, 1, 0.2705882, 0, 1,
-1.587428, -1.092758, -0.5131111, 1, 0.2745098, 0, 1,
-1.569333, -1.980029, -3.771961, 1, 0.282353, 0, 1,
-1.566428, -1.192928, -2.455452, 1, 0.2862745, 0, 1,
-1.540836, 2.825396, -0.6708157, 1, 0.2941177, 0, 1,
-1.53843, 1.782063, -2.067795, 1, 0.3019608, 0, 1,
-1.528085, 1.63877, -0.9785016, 1, 0.3058824, 0, 1,
-1.519029, -0.0709095, -0.8526237, 1, 0.3137255, 0, 1,
-1.515956, -1.195894, -4.187714, 1, 0.3176471, 0, 1,
-1.514575, -0.4414479, -3.430056, 1, 0.3254902, 0, 1,
-1.510375, -0.6423895, -0.9568926, 1, 0.3294118, 0, 1,
-1.506522, 0.3924931, -1.294972, 1, 0.3372549, 0, 1,
-1.503601, 0.2949052, -2.076856, 1, 0.3411765, 0, 1,
-1.502549, -1.208102, -3.277813, 1, 0.3490196, 0, 1,
-1.500597, -0.1136692, -1.625449, 1, 0.3529412, 0, 1,
-1.480893, -0.09114814, -1.790531, 1, 0.3607843, 0, 1,
-1.478736, -0.3834326, -2.562987, 1, 0.3647059, 0, 1,
-1.471034, 1.976004, -0.2165908, 1, 0.372549, 0, 1,
-1.470118, 1.055276, -0.1393161, 1, 0.3764706, 0, 1,
-1.447076, 1.890598, -1.074562, 1, 0.3843137, 0, 1,
-1.447018, 0.1278639, -2.004652, 1, 0.3882353, 0, 1,
-1.444753, 0.8085632, -2.087078, 1, 0.3960784, 0, 1,
-1.423336, -1.495361, -3.803603, 1, 0.4039216, 0, 1,
-1.406492, -1.491124, -1.529053, 1, 0.4078431, 0, 1,
-1.403715, 1.033688, -0.8411618, 1, 0.4156863, 0, 1,
-1.395159, -0.4754473, -1.821185, 1, 0.4196078, 0, 1,
-1.390135, 1.622236, -2.143169, 1, 0.427451, 0, 1,
-1.383878, 0.6399439, -0.6673512, 1, 0.4313726, 0, 1,
-1.383412, -0.3366275, -1.717545, 1, 0.4392157, 0, 1,
-1.37754, -0.384612, -2.862432, 1, 0.4431373, 0, 1,
-1.374435, -0.9045796, -1.997879, 1, 0.4509804, 0, 1,
-1.367426, -0.6589761, -0.5716375, 1, 0.454902, 0, 1,
-1.360695, -0.3617388, -0.3701405, 1, 0.4627451, 0, 1,
-1.360671, 1.672202, -2.446206, 1, 0.4666667, 0, 1,
-1.354836, -0.557173, -0.3893108, 1, 0.4745098, 0, 1,
-1.349501, 0.4043789, -1.904849, 1, 0.4784314, 0, 1,
-1.346767, -0.3848626, -1.129601, 1, 0.4862745, 0, 1,
-1.322169, -0.9228042, -2.382149, 1, 0.4901961, 0, 1,
-1.318174, -0.2804324, -2.15535, 1, 0.4980392, 0, 1,
-1.313927, 0.4308531, -0.8644013, 1, 0.5058824, 0, 1,
-1.307104, 0.7325586, -2.750091, 1, 0.509804, 0, 1,
-1.3059, 1.39564, 0.03911075, 1, 0.5176471, 0, 1,
-1.282187, 0.05623248, -0.8355442, 1, 0.5215687, 0, 1,
-1.277029, 0.3490473, -1.12764, 1, 0.5294118, 0, 1,
-1.275672, -0.6395885, -1.620977, 1, 0.5333334, 0, 1,
-1.273362, -0.3939356, -2.037021, 1, 0.5411765, 0, 1,
-1.271431, 0.8522075, -1.177133, 1, 0.5450981, 0, 1,
-1.261841, -1.09391, -1.942351, 1, 0.5529412, 0, 1,
-1.261197, -1.755083, -2.465684, 1, 0.5568628, 0, 1,
-1.252229, -0.283165, -2.161031, 1, 0.5647059, 0, 1,
-1.25201, 0.6182274, -2.043296, 1, 0.5686275, 0, 1,
-1.250457, 1.323977, 1.057385, 1, 0.5764706, 0, 1,
-1.245838, 1.105412, -1.566103, 1, 0.5803922, 0, 1,
-1.244781, 0.251069, -2.632267, 1, 0.5882353, 0, 1,
-1.239931, 0.2869917, -0.8176495, 1, 0.5921569, 0, 1,
-1.229204, -0.7894787, -1.471675, 1, 0.6, 0, 1,
-1.220855, 0.003593818, -2.163194, 1, 0.6078432, 0, 1,
-1.21611, -2.147348, -4.798028, 1, 0.6117647, 0, 1,
-1.215696, -0.4895219, -2.337584, 1, 0.6196079, 0, 1,
-1.166097, 0.1984133, 0.1357131, 1, 0.6235294, 0, 1,
-1.163584, -0.08147163, -2.06123, 1, 0.6313726, 0, 1,
-1.161837, -1.56565, -1.422058, 1, 0.6352941, 0, 1,
-1.156501, -2.372099, -2.826848, 1, 0.6431373, 0, 1,
-1.141306, 0.9411629, -1.883128, 1, 0.6470588, 0, 1,
-1.140494, -0.8453575, -1.196461, 1, 0.654902, 0, 1,
-1.126287, 2.296044, -0.3942269, 1, 0.6588235, 0, 1,
-1.122852, -0.2044029, -1.639739, 1, 0.6666667, 0, 1,
-1.114701, 0.04123527, -2.076014, 1, 0.6705883, 0, 1,
-1.114263, 0.302827, -1.312342, 1, 0.6784314, 0, 1,
-1.11201, -0.3784674, -2.040197, 1, 0.682353, 0, 1,
-1.109333, 0.584214, 0.1873481, 1, 0.6901961, 0, 1,
-1.109093, 0.6676867, -1.12925, 1, 0.6941177, 0, 1,
-1.099074, 0.237063, -0.5872219, 1, 0.7019608, 0, 1,
-1.093368, -1.942306, -4.107967, 1, 0.7098039, 0, 1,
-1.091989, -0.1780628, -1.457603, 1, 0.7137255, 0, 1,
-1.082431, -1.317269, -2.096416, 1, 0.7215686, 0, 1,
-1.078233, 0.07979436, -1.792259, 1, 0.7254902, 0, 1,
-1.069531, -0.4730424, -0.9064822, 1, 0.7333333, 0, 1,
-1.044718, 1.800935, -0.6773108, 1, 0.7372549, 0, 1,
-1.040937, -0.5826006, -1.459113, 1, 0.7450981, 0, 1,
-1.034743, -1.103911, -0.8206429, 1, 0.7490196, 0, 1,
-1.030606, 1.666132, -0.552027, 1, 0.7568628, 0, 1,
-1.028631, -0.114598, 0.4549932, 1, 0.7607843, 0, 1,
-1.012367, 1.19684, -0.8473355, 1, 0.7686275, 0, 1,
-1.010334, 0.7412463, -0.3620986, 1, 0.772549, 0, 1,
-1.007434, 1.309042, -1.066888, 1, 0.7803922, 0, 1,
-1.001622, 0.4553832, -1.259865, 1, 0.7843137, 0, 1,
-0.9965444, -0.8478312, -3.21923, 1, 0.7921569, 0, 1,
-0.9961277, 1.358559, -1.743629, 1, 0.7960784, 0, 1,
-0.9929225, -0.6171693, -4.423581, 1, 0.8039216, 0, 1,
-0.9908942, -2.30445, -3.622737, 1, 0.8117647, 0, 1,
-0.9836907, 2.058344, -0.962867, 1, 0.8156863, 0, 1,
-0.9703479, -1.003074, -2.12183, 1, 0.8235294, 0, 1,
-0.9606349, 0.2864179, -1.226382, 1, 0.827451, 0, 1,
-0.9602073, 0.9961268, -1.738191, 1, 0.8352941, 0, 1,
-0.960002, 0.123208, -0.2315831, 1, 0.8392157, 0, 1,
-0.9599935, 1.781618, -0.1618267, 1, 0.8470588, 0, 1,
-0.9585427, -0.3199986, -1.594312, 1, 0.8509804, 0, 1,
-0.9572477, 0.2336916, -1.754818, 1, 0.8588235, 0, 1,
-0.9425289, 1.460159, -0.2058954, 1, 0.8627451, 0, 1,
-0.939388, 0.8279284, -1.103382, 1, 0.8705882, 0, 1,
-0.9385535, 0.3379539, -0.9530964, 1, 0.8745098, 0, 1,
-0.9377312, 0.8897076, -0.8469233, 1, 0.8823529, 0, 1,
-0.9339577, -0.3631282, -0.8369827, 1, 0.8862745, 0, 1,
-0.9331487, -0.9879778, -2.764747, 1, 0.8941177, 0, 1,
-0.9176049, -0.2061271, -3.870898, 1, 0.8980392, 0, 1,
-0.9142246, -0.5218924, -0.2286138, 1, 0.9058824, 0, 1,
-0.9078273, 1.69754, -1.861615, 1, 0.9137255, 0, 1,
-0.90715, -0.1075279, -0.8422598, 1, 0.9176471, 0, 1,
-0.9071216, 0.2951408, -0.7312064, 1, 0.9254902, 0, 1,
-0.9047778, 0.533861, 0.1790469, 1, 0.9294118, 0, 1,
-0.9004917, -0.09048513, -3.163253, 1, 0.9372549, 0, 1,
-0.8999245, 0.228718, -2.345381, 1, 0.9411765, 0, 1,
-0.8919828, -1.115109, -3.190485, 1, 0.9490196, 0, 1,
-0.8889542, 0.1440266, -0.9198637, 1, 0.9529412, 0, 1,
-0.8885829, -1.764857, -1.910649, 1, 0.9607843, 0, 1,
-0.8795912, -0.9875546, -1.808583, 1, 0.9647059, 0, 1,
-0.8728511, -0.8566243, -3.15972, 1, 0.972549, 0, 1,
-0.8717894, -0.8963794, -2.966102, 1, 0.9764706, 0, 1,
-0.8683918, 1.342692, -1.687239, 1, 0.9843137, 0, 1,
-0.8680864, 2.34606, -1.787339, 1, 0.9882353, 0, 1,
-0.858171, -0.05263448, -2.454704, 1, 0.9960784, 0, 1,
-0.8569778, -1.509215, -0.2402187, 0.9960784, 1, 0, 1,
-0.8519974, 0.6211053, -0.7338077, 0.9921569, 1, 0, 1,
-0.8507593, 1.016621, -0.6753868, 0.9843137, 1, 0, 1,
-0.8503768, 0.2236962, -1.551512, 0.9803922, 1, 0, 1,
-0.8495601, 0.1071792, -0.2397931, 0.972549, 1, 0, 1,
-0.8453044, -1.426763, -0.958958, 0.9686275, 1, 0, 1,
-0.8420306, -0.6725022, -3.730657, 0.9607843, 1, 0, 1,
-0.8413397, 1.180719, 0.4503901, 0.9568627, 1, 0, 1,
-0.8358665, 0.7383846, -0.4913871, 0.9490196, 1, 0, 1,
-0.8349066, 1.275438, -0.8719428, 0.945098, 1, 0, 1,
-0.832217, 0.004286037, -2.153304, 0.9372549, 1, 0, 1,
-0.8316517, 0.1213354, -0.8923813, 0.9333333, 1, 0, 1,
-0.8301463, -0.5843639, -2.097235, 0.9254902, 1, 0, 1,
-0.8282419, -0.1042029, -2.556764, 0.9215686, 1, 0, 1,
-0.8249264, 1.342914, 0.3367361, 0.9137255, 1, 0, 1,
-0.8241231, 1.725616, -0.8118424, 0.9098039, 1, 0, 1,
-0.8197778, 0.182712, -0.6227515, 0.9019608, 1, 0, 1,
-0.8180607, -1.812951, -3.982265, 0.8941177, 1, 0, 1,
-0.8132209, -0.9035163, -1.49336, 0.8901961, 1, 0, 1,
-0.8087166, 1.444095, -0.7205792, 0.8823529, 1, 0, 1,
-0.8029276, -0.3913766, -0.5432574, 0.8784314, 1, 0, 1,
-0.7958034, 1.145281, 0.2917135, 0.8705882, 1, 0, 1,
-0.79441, -0.03162242, -0.3644877, 0.8666667, 1, 0, 1,
-0.7879083, 0.209664, -0.5231109, 0.8588235, 1, 0, 1,
-0.7748711, -0.5012292, 0.9355402, 0.854902, 1, 0, 1,
-0.7739096, 1.014705, 0.5274237, 0.8470588, 1, 0, 1,
-0.7727914, -0.7910096, -1.748674, 0.8431373, 1, 0, 1,
-0.7691246, -0.2956082, -1.603005, 0.8352941, 1, 0, 1,
-0.7686003, 0.3494002, -0.736847, 0.8313726, 1, 0, 1,
-0.7624679, 0.8147607, 0.04880401, 0.8235294, 1, 0, 1,
-0.7598001, 0.0761754, 0.1432168, 0.8196079, 1, 0, 1,
-0.7554792, -1.546945, -2.836739, 0.8117647, 1, 0, 1,
-0.7493804, -0.04177847, -1.75938, 0.8078431, 1, 0, 1,
-0.7489355, 0.4517555, -0.363225, 0.8, 1, 0, 1,
-0.748174, -2.031533, -4.057777, 0.7921569, 1, 0, 1,
-0.7475404, 0.970225, 0.8333233, 0.7882353, 1, 0, 1,
-0.7433483, 0.3132475, -2.620445, 0.7803922, 1, 0, 1,
-0.7366464, -1.39365, -3.836874, 0.7764706, 1, 0, 1,
-0.7349982, -1.375814, -4.293785, 0.7686275, 1, 0, 1,
-0.7301882, 2.224451, -2.424726, 0.7647059, 1, 0, 1,
-0.7257937, -3.146152, -1.171756, 0.7568628, 1, 0, 1,
-0.7236686, -0.9178882, -2.064924, 0.7529412, 1, 0, 1,
-0.7235878, -0.2170189, -1.099215, 0.7450981, 1, 0, 1,
-0.7223554, -2.012537, -2.881459, 0.7411765, 1, 0, 1,
-0.7115831, -0.1842593, -1.621482, 0.7333333, 1, 0, 1,
-0.7051477, 0.8703554, -0.6836938, 0.7294118, 1, 0, 1,
-0.7035158, -1.085392, -1.758585, 0.7215686, 1, 0, 1,
-0.703461, -0.8674114, -2.540754, 0.7176471, 1, 0, 1,
-0.6973057, -0.1507895, -1.074554, 0.7098039, 1, 0, 1,
-0.6909574, 0.9066788, -0.64293, 0.7058824, 1, 0, 1,
-0.6889983, -1.190064, -3.044551, 0.6980392, 1, 0, 1,
-0.6876295, -0.6106526, -2.073666, 0.6901961, 1, 0, 1,
-0.6864016, 0.136543, -1.260995, 0.6862745, 1, 0, 1,
-0.6862517, -1.099633, -2.200178, 0.6784314, 1, 0, 1,
-0.6827064, -0.3340636, -0.8703356, 0.6745098, 1, 0, 1,
-0.6770543, 0.3515138, -1.64559, 0.6666667, 1, 0, 1,
-0.6743721, -0.2350163, -1.791127, 0.6627451, 1, 0, 1,
-0.6740105, -1.274067, -3.979329, 0.654902, 1, 0, 1,
-0.6733525, 0.9920853, -0.7726654, 0.6509804, 1, 0, 1,
-0.6612673, 0.09913357, -0.6910774, 0.6431373, 1, 0, 1,
-0.6581756, -0.3182538, -1.564686, 0.6392157, 1, 0, 1,
-0.6573886, -0.4818054, -0.5172635, 0.6313726, 1, 0, 1,
-0.6536391, -1.160859, -1.869003, 0.627451, 1, 0, 1,
-0.6532423, 0.1014631, -2.429485, 0.6196079, 1, 0, 1,
-0.6522588, 0.5805972, -2.887617, 0.6156863, 1, 0, 1,
-0.6463118, -0.5538995, -2.003393, 0.6078432, 1, 0, 1,
-0.6448269, 0.1262735, -1.526805, 0.6039216, 1, 0, 1,
-0.6385176, -1.357395, -5.374642, 0.5960785, 1, 0, 1,
-0.6382052, 2.082891, -0.08172684, 0.5882353, 1, 0, 1,
-0.6354805, -1.8466, -2.879606, 0.5843138, 1, 0, 1,
-0.6329126, -0.292324, -3.014472, 0.5764706, 1, 0, 1,
-0.6280048, 1.478049, -2.424807, 0.572549, 1, 0, 1,
-0.6274214, -0.2499879, -1.496943, 0.5647059, 1, 0, 1,
-0.6270352, 1.993853, 0.5379456, 0.5607843, 1, 0, 1,
-0.6221309, -0.2956628, -1.027641, 0.5529412, 1, 0, 1,
-0.6185717, 1.704488, 0.6280007, 0.5490196, 1, 0, 1,
-0.6174675, -1.924062, -3.491644, 0.5411765, 1, 0, 1,
-0.6172117, 0.5666264, -0.4579639, 0.5372549, 1, 0, 1,
-0.6167635, 0.9442841, -2.136937, 0.5294118, 1, 0, 1,
-0.6124852, -0.07607453, -1.584986, 0.5254902, 1, 0, 1,
-0.6116304, 1.387203, -0.4694304, 0.5176471, 1, 0, 1,
-0.6101848, -0.1446938, -3.176826, 0.5137255, 1, 0, 1,
-0.6076633, -0.2622028, -2.918463, 0.5058824, 1, 0, 1,
-0.6062196, 0.596603, -1.064659, 0.5019608, 1, 0, 1,
-0.6050513, -0.9698443, -2.08292, 0.4941176, 1, 0, 1,
-0.6048598, -1.276765, -3.068858, 0.4862745, 1, 0, 1,
-0.600356, -0.2691675, -2.055981, 0.4823529, 1, 0, 1,
-0.5970852, 0.3200448, -1.382807, 0.4745098, 1, 0, 1,
-0.5939382, -1.353917, -4.160903, 0.4705882, 1, 0, 1,
-0.5939022, -0.1340877, -2.678423, 0.4627451, 1, 0, 1,
-0.5929471, -0.8128517, -3.950193, 0.4588235, 1, 0, 1,
-0.5920197, -0.657065, -2.848255, 0.4509804, 1, 0, 1,
-0.5844479, 0.8772801, -0.09837942, 0.4470588, 1, 0, 1,
-0.5774873, -0.8152441, -2.453215, 0.4392157, 1, 0, 1,
-0.5715957, -0.7622274, -2.324132, 0.4352941, 1, 0, 1,
-0.5703187, -0.5886678, -2.268149, 0.427451, 1, 0, 1,
-0.5686914, -0.7095535, -2.545722, 0.4235294, 1, 0, 1,
-0.564457, 1.674701, 0.6061246, 0.4156863, 1, 0, 1,
-0.564343, -0.9587193, -2.412641, 0.4117647, 1, 0, 1,
-0.5609015, 0.006703822, -1.264441, 0.4039216, 1, 0, 1,
-0.5604911, -0.9672698, -1.553796, 0.3960784, 1, 0, 1,
-0.5597441, -2.17357, -2.789244, 0.3921569, 1, 0, 1,
-0.5537119, 0.09661032, -1.056794, 0.3843137, 1, 0, 1,
-0.5534557, -1.710636, -4.059366, 0.3803922, 1, 0, 1,
-0.5522471, -1.213069, -4.304327, 0.372549, 1, 0, 1,
-0.550698, -0.9687982, -4.284729, 0.3686275, 1, 0, 1,
-0.5469102, 0.09952776, -2.726953, 0.3607843, 1, 0, 1,
-0.5467092, 0.9139395, -0.3565946, 0.3568628, 1, 0, 1,
-0.5450385, 0.1482224, -1.03784, 0.3490196, 1, 0, 1,
-0.5439647, -0.1347745, -0.4319374, 0.345098, 1, 0, 1,
-0.5422525, -0.9988073, -1.456283, 0.3372549, 1, 0, 1,
-0.5422164, -0.2560145, -1.486791, 0.3333333, 1, 0, 1,
-0.5398981, 0.6053611, -1.43877, 0.3254902, 1, 0, 1,
-0.5378634, -0.8595216, -3.673452, 0.3215686, 1, 0, 1,
-0.5362945, -1.44887, -0.9820297, 0.3137255, 1, 0, 1,
-0.5337594, -0.002599434, -1.630251, 0.3098039, 1, 0, 1,
-0.5289168, -0.2411055, -1.574631, 0.3019608, 1, 0, 1,
-0.527676, 0.03142807, 0.2765854, 0.2941177, 1, 0, 1,
-0.5219228, 0.3531097, -1.247543, 0.2901961, 1, 0, 1,
-0.5204268, 0.6774592, -0.3459238, 0.282353, 1, 0, 1,
-0.5167965, -0.2989989, -1.988438, 0.2784314, 1, 0, 1,
-0.5138698, 0.2894128, -0.5145136, 0.2705882, 1, 0, 1,
-0.5115451, 0.4844702, -1.716202, 0.2666667, 1, 0, 1,
-0.5087428, -0.9431023, -1.647507, 0.2588235, 1, 0, 1,
-0.5068758, 0.1009625, -0.8309858, 0.254902, 1, 0, 1,
-0.4971136, 0.4250264, -1.58814, 0.2470588, 1, 0, 1,
-0.4956001, -1.225983, -1.405501, 0.2431373, 1, 0, 1,
-0.494476, -0.5120153, -2.425085, 0.2352941, 1, 0, 1,
-0.4934632, -1.47073, -1.88324, 0.2313726, 1, 0, 1,
-0.4916763, -1.362982, -3.187139, 0.2235294, 1, 0, 1,
-0.4905593, -0.8692106, -2.25332, 0.2196078, 1, 0, 1,
-0.4903564, -0.544582, -2.087452, 0.2117647, 1, 0, 1,
-0.4891964, -1.409309, -5.716002, 0.2078431, 1, 0, 1,
-0.4891179, -0.01035776, -0.4456151, 0.2, 1, 0, 1,
-0.4840475, 1.292364, -0.6739417, 0.1921569, 1, 0, 1,
-0.4803274, -1.360527, -2.42385, 0.1882353, 1, 0, 1,
-0.4800858, 0.1773629, -1.290611, 0.1803922, 1, 0, 1,
-0.4778979, 0.1851797, -0.9564808, 0.1764706, 1, 0, 1,
-0.4755723, -1.413008, -2.207634, 0.1686275, 1, 0, 1,
-0.4734656, 1.239984, 0.6051648, 0.1647059, 1, 0, 1,
-0.4721078, 1.327217, -2.104978, 0.1568628, 1, 0, 1,
-0.4711038, 1.806316, 0.3063802, 0.1529412, 1, 0, 1,
-0.4682046, 1.037994, -2.627107, 0.145098, 1, 0, 1,
-0.4658489, 0.3479072, -0.9622576, 0.1411765, 1, 0, 1,
-0.4648052, 1.011075, -0.5515262, 0.1333333, 1, 0, 1,
-0.4645951, 0.9313979, 1.182783, 0.1294118, 1, 0, 1,
-0.4642488, 0.4628858, -0.8228622, 0.1215686, 1, 0, 1,
-0.4627707, -2.294613, -4.296277, 0.1176471, 1, 0, 1,
-0.4614837, 1.654853, 0.6270846, 0.1098039, 1, 0, 1,
-0.4560193, 2.343285, 0.4259181, 0.1058824, 1, 0, 1,
-0.449452, -0.3375256, -1.401865, 0.09803922, 1, 0, 1,
-0.4488096, 1.655758, 1.899437, 0.09019608, 1, 0, 1,
-0.4476265, -0.8187953, -2.524674, 0.08627451, 1, 0, 1,
-0.4465079, 1.13159, 0.4168876, 0.07843138, 1, 0, 1,
-0.4438576, -0.2527365, -2.550656, 0.07450981, 1, 0, 1,
-0.4434486, -0.1976574, -0.1202972, 0.06666667, 1, 0, 1,
-0.4392608, -1.000667, -1.952199, 0.0627451, 1, 0, 1,
-0.4335798, -0.1451913, -1.933147, 0.05490196, 1, 0, 1,
-0.4315282, -1.021248, -3.826282, 0.05098039, 1, 0, 1,
-0.4283991, 0.9122435, -0.258395, 0.04313726, 1, 0, 1,
-0.4276483, 1.289442, 0.4244885, 0.03921569, 1, 0, 1,
-0.4270005, -0.4375957, -3.960711, 0.03137255, 1, 0, 1,
-0.4247185, -1.152655, -1.440037, 0.02745098, 1, 0, 1,
-0.4190775, 0.7063959, -0.7543553, 0.01960784, 1, 0, 1,
-0.4173144, 0.4206883, 1.080882, 0.01568628, 1, 0, 1,
-0.4160841, -0.08484381, -2.655043, 0.007843138, 1, 0, 1,
-0.4158054, -0.7172353, -0.906544, 0.003921569, 1, 0, 1,
-0.4122488, 0.0584542, -0.1603866, 0, 1, 0.003921569, 1,
-0.4111397, -0.3856304, -3.137671, 0, 1, 0.01176471, 1,
-0.4105057, 0.05821287, -2.022328, 0, 1, 0.01568628, 1,
-0.407883, 0.6295689, -0.756162, 0, 1, 0.02352941, 1,
-0.4049882, -0.9359198, -2.541923, 0, 1, 0.02745098, 1,
-0.4038623, 0.2729098, -1.269858, 0, 1, 0.03529412, 1,
-0.4026381, 0.8617808, 0.240252, 0, 1, 0.03921569, 1,
-0.4007529, 1.898456, -0.9880144, 0, 1, 0.04705882, 1,
-0.3972858, -1.579338, -2.601648, 0, 1, 0.05098039, 1,
-0.3939148, 1.187777, -0.0558782, 0, 1, 0.05882353, 1,
-0.3931779, 0.2871445, -1.482541, 0, 1, 0.0627451, 1,
-0.391158, 1.287553, -0.6839821, 0, 1, 0.07058824, 1,
-0.3897492, 0.1594567, -2.130937, 0, 1, 0.07450981, 1,
-0.3862558, 1.669702, -0.2711844, 0, 1, 0.08235294, 1,
-0.3830799, 0.2371731, -2.082555, 0, 1, 0.08627451, 1,
-0.3829374, 0.2883618, -2.027874, 0, 1, 0.09411765, 1,
-0.3792135, -1.663963, -2.656345, 0, 1, 0.1019608, 1,
-0.3780052, 0.2118383, -0.8911736, 0, 1, 0.1058824, 1,
-0.3769758, -1.073452, -2.362848, 0, 1, 0.1137255, 1,
-0.3685459, 0.4290553, -2.08142, 0, 1, 0.1176471, 1,
-0.3681384, -1.42137, -3.265945, 0, 1, 0.1254902, 1,
-0.3625516, -1.554707, -2.484328, 0, 1, 0.1294118, 1,
-0.3593161, -0.6348045, -4.107544, 0, 1, 0.1372549, 1,
-0.353564, 0.6308163, -2.509212, 0, 1, 0.1411765, 1,
-0.3534408, 0.411988, -1.722641, 0, 1, 0.1490196, 1,
-0.3480161, 0.2837994, -1.914954, 0, 1, 0.1529412, 1,
-0.3478591, 0.9237014, 0.3148485, 0, 1, 0.1607843, 1,
-0.3394669, 0.8664564, -1.223163, 0, 1, 0.1647059, 1,
-0.3379231, -1.021556, -1.901587, 0, 1, 0.172549, 1,
-0.327531, -0.01900446, -2.015249, 0, 1, 0.1764706, 1,
-0.325365, -0.4037315, -1.180493, 0, 1, 0.1843137, 1,
-0.3231685, 0.7997167, -1.651937, 0, 1, 0.1882353, 1,
-0.3196692, 0.009059116, -1.326439, 0, 1, 0.1960784, 1,
-0.3194886, 1.958055, 0.3308639, 0, 1, 0.2039216, 1,
-0.3191176, -0.301257, -3.005673, 0, 1, 0.2078431, 1,
-0.3185779, 2.133484, -0.2107243, 0, 1, 0.2156863, 1,
-0.317622, -0.6519293, -4.587913, 0, 1, 0.2196078, 1,
-0.3174571, 0.403521, -1.235731, 0, 1, 0.227451, 1,
-0.3158938, -0.2588603, -1.737706, 0, 1, 0.2313726, 1,
-0.3154774, -0.3978656, -1.735327, 0, 1, 0.2392157, 1,
-0.3144514, 0.572751, -0.7187894, 0, 1, 0.2431373, 1,
-0.3135304, -0.6152149, -3.169402, 0, 1, 0.2509804, 1,
-0.3125538, 0.2690698, -1.118772, 0, 1, 0.254902, 1,
-0.3063736, 0.812313, 0.1640655, 0, 1, 0.2627451, 1,
-0.3058947, 0.1448641, -0.913194, 0, 1, 0.2666667, 1,
-0.3053225, -0.7206297, -3.341383, 0, 1, 0.2745098, 1,
-0.3048917, -0.4263808, -3.748173, 0, 1, 0.2784314, 1,
-0.3037629, -0.5574609, -3.570709, 0, 1, 0.2862745, 1,
-0.3029531, 0.2177386, 1.074, 0, 1, 0.2901961, 1,
-0.3009733, -1.447487, -2.899125, 0, 1, 0.2980392, 1,
-0.2961329, -0.05207306, -1.956036, 0, 1, 0.3058824, 1,
-0.2961206, 1.012255, -0.05614059, 0, 1, 0.3098039, 1,
-0.2867738, -0.121303, -0.9458373, 0, 1, 0.3176471, 1,
-0.2853056, -1.789522, -1.65832, 0, 1, 0.3215686, 1,
-0.2851325, 0.6932623, -0.7426962, 0, 1, 0.3294118, 1,
-0.283116, 0.5037873, -0.4120603, 0, 1, 0.3333333, 1,
-0.2799956, 0.6502076, -3.026444, 0, 1, 0.3411765, 1,
-0.279627, 0.3748072, -1.866577, 0, 1, 0.345098, 1,
-0.2738506, -0.5049424, -2.513009, 0, 1, 0.3529412, 1,
-0.2728694, 0.6526528, -2.664372, 0, 1, 0.3568628, 1,
-0.2718266, -0.1362755, -3.151486, 0, 1, 0.3647059, 1,
-0.2701529, -0.7770604, -1.125455, 0, 1, 0.3686275, 1,
-0.2649253, 0.7165291, 0.9035259, 0, 1, 0.3764706, 1,
-0.2623593, 0.4056377, -1.366025, 0, 1, 0.3803922, 1,
-0.2564469, 2.040079, 0.05398464, 0, 1, 0.3882353, 1,
-0.2494658, 3.391287, -0.5686465, 0, 1, 0.3921569, 1,
-0.2491128, -1.598568, -2.887228, 0, 1, 0.4, 1,
-0.248679, -1.042296, -3.144188, 0, 1, 0.4078431, 1,
-0.2482668, 0.1360983, -1.402038, 0, 1, 0.4117647, 1,
-0.247693, 0.1340047, -0.9158326, 0, 1, 0.4196078, 1,
-0.2421239, 1.191186, -0.394767, 0, 1, 0.4235294, 1,
-0.2406781, 0.6940401, 0.4100611, 0, 1, 0.4313726, 1,
-0.2380571, 0.06901542, -2.158855, 0, 1, 0.4352941, 1,
-0.2372414, 0.6022193, -0.302352, 0, 1, 0.4431373, 1,
-0.2365533, 1.420491, 1.178836, 0, 1, 0.4470588, 1,
-0.2346154, 0.789912, -0.01539504, 0, 1, 0.454902, 1,
-0.2311153, -1.277483, -3.824686, 0, 1, 0.4588235, 1,
-0.2308076, 0.6458868, -0.5518681, 0, 1, 0.4666667, 1,
-0.2274507, -0.04404227, 0.3453375, 0, 1, 0.4705882, 1,
-0.2225246, -0.0525386, -2.790299, 0, 1, 0.4784314, 1,
-0.220876, -0.2652636, -1.85488, 0, 1, 0.4823529, 1,
-0.2199026, 0.3373251, -1.3028, 0, 1, 0.4901961, 1,
-0.218891, 0.6055014, 0.006030303, 0, 1, 0.4941176, 1,
-0.2187183, 0.07347637, -1.133725, 0, 1, 0.5019608, 1,
-0.2139065, -0.4161286, -3.025009, 0, 1, 0.509804, 1,
-0.213631, 0.7321444, 0.4357791, 0, 1, 0.5137255, 1,
-0.2103958, 1.52295, 0.06446018, 0, 1, 0.5215687, 1,
-0.2088377, 0.9198157, -0.9531394, 0, 1, 0.5254902, 1,
-0.2059806, 1.502732, -0.9292414, 0, 1, 0.5333334, 1,
-0.205447, -0.8429526, -0.8966275, 0, 1, 0.5372549, 1,
-0.2012302, 0.6837254, 1.105347, 0, 1, 0.5450981, 1,
-0.2012121, 0.7524239, 0.1296888, 0, 1, 0.5490196, 1,
-0.197607, 0.4369117, 0.3204975, 0, 1, 0.5568628, 1,
-0.1970476, -0.02385036, -0.5384091, 0, 1, 0.5607843, 1,
-0.1961263, 0.4814453, -0.6383239, 0, 1, 0.5686275, 1,
-0.1925875, -1.279261, -2.647921, 0, 1, 0.572549, 1,
-0.1918672, -1.022648, -2.990452, 0, 1, 0.5803922, 1,
-0.1885747, -0.235816, -3.024309, 0, 1, 0.5843138, 1,
-0.1874944, 2.121489, -1.567214, 0, 1, 0.5921569, 1,
-0.1870548, 1.73321, 0.1762466, 0, 1, 0.5960785, 1,
-0.176128, 1.849236, 1.514516, 0, 1, 0.6039216, 1,
-0.1746578, -0.2072619, -1.920269, 0, 1, 0.6117647, 1,
-0.1670927, 1.148607, 0.4599161, 0, 1, 0.6156863, 1,
-0.1644014, 0.7817078, 1.074909, 0, 1, 0.6235294, 1,
-0.1637626, -0.7041098, -1.516035, 0, 1, 0.627451, 1,
-0.1582308, -1.660443, -2.152132, 0, 1, 0.6352941, 1,
-0.1562059, -0.4006822, -2.654678, 0, 1, 0.6392157, 1,
-0.1506718, 1.120147, -0.9493275, 0, 1, 0.6470588, 1,
-0.1478338, -0.777714, -4.299922, 0, 1, 0.6509804, 1,
-0.1473919, -1.673437, -3.647478, 0, 1, 0.6588235, 1,
-0.1455015, 1.567205, -0.4932174, 0, 1, 0.6627451, 1,
-0.1446155, 0.2862935, 0.05627648, 0, 1, 0.6705883, 1,
-0.1399071, 1.458058, 1.188234, 0, 1, 0.6745098, 1,
-0.1387081, 2.067272, 2.150587, 0, 1, 0.682353, 1,
-0.1381439, 1.168777, 0.6082255, 0, 1, 0.6862745, 1,
-0.1381074, -1.137726, -3.651791, 0, 1, 0.6941177, 1,
-0.1346799, -1.400882, -2.943651, 0, 1, 0.7019608, 1,
-0.1343888, -0.5568955, -1.984574, 0, 1, 0.7058824, 1,
-0.1325743, 0.2814215, 0.3043151, 0, 1, 0.7137255, 1,
-0.1307716, 0.2207818, -2.315458, 0, 1, 0.7176471, 1,
-0.1276567, -0.4845181, -5.21908, 0, 1, 0.7254902, 1,
-0.1274283, 0.7148932, 1.488451, 0, 1, 0.7294118, 1,
-0.126938, 0.5894207, 1.571364, 0, 1, 0.7372549, 1,
-0.1257819, 0.3064524, -0.5837416, 0, 1, 0.7411765, 1,
-0.1251315, -0.4207682, -2.87362, 0, 1, 0.7490196, 1,
-0.1231841, 0.1672092, -2.991899, 0, 1, 0.7529412, 1,
-0.1149312, -0.4545397, -3.600015, 0, 1, 0.7607843, 1,
-0.1145609, -0.8701685, -1.824932, 0, 1, 0.7647059, 1,
-0.1123748, -0.1883237, -4.761069, 0, 1, 0.772549, 1,
-0.1099443, -0.4228857, -4.309144, 0, 1, 0.7764706, 1,
-0.1091294, -0.01881611, -1.18536, 0, 1, 0.7843137, 1,
-0.1058378, 0.2452585, 0.9604578, 0, 1, 0.7882353, 1,
-0.102671, 1.384244, -1.503102, 0, 1, 0.7960784, 1,
-0.09967726, 1.631046, 1.022206, 0, 1, 0.8039216, 1,
-0.09826525, -2.063642, -1.771928, 0, 1, 0.8078431, 1,
-0.09815267, 2.419444, 0.1422953, 0, 1, 0.8156863, 1,
-0.09664129, 0.3954354, 1.64369, 0, 1, 0.8196079, 1,
-0.0963385, 0.2294136, 0.3290596, 0, 1, 0.827451, 1,
-0.09495153, 1.516787, -1.068509, 0, 1, 0.8313726, 1,
-0.09446155, -1.356421, -2.467736, 0, 1, 0.8392157, 1,
-0.09424736, 0.3733114, -0.2726863, 0, 1, 0.8431373, 1,
-0.09343599, -0.2773306, -3.946661, 0, 1, 0.8509804, 1,
-0.08929048, -0.5593274, -3.796042, 0, 1, 0.854902, 1,
-0.08715538, 0.1696422, 0.8396274, 0, 1, 0.8627451, 1,
-0.08624474, 0.04685983, 0.03221127, 0, 1, 0.8666667, 1,
-0.08340003, -2.292204, -4.294991, 0, 1, 0.8745098, 1,
-0.08037516, 1.633911, -0.9357529, 0, 1, 0.8784314, 1,
-0.07805631, 0.2749523, 3.075697, 0, 1, 0.8862745, 1,
-0.07500108, 0.4970978, -2.352418, 0, 1, 0.8901961, 1,
-0.07218177, -0.833834, -2.680809, 0, 1, 0.8980392, 1,
-0.07165448, 0.3924878, 0.2819589, 0, 1, 0.9058824, 1,
-0.06885726, -0.8850787, -0.7630354, 0, 1, 0.9098039, 1,
-0.06782783, 0.4391994, -0.2971395, 0, 1, 0.9176471, 1,
-0.06764449, -0.2275816, -1.440151, 0, 1, 0.9215686, 1,
-0.06628285, -1.590727, -2.768007, 0, 1, 0.9294118, 1,
-0.06169786, 0.2037654, 0.5105035, 0, 1, 0.9333333, 1,
-0.06125942, 0.05131266, -1.285416, 0, 1, 0.9411765, 1,
-0.05911898, 0.160385, -0.2587824, 0, 1, 0.945098, 1,
-0.05605993, 0.403721, -1.314069, 0, 1, 0.9529412, 1,
-0.05598864, -0.2234925, -2.065371, 0, 1, 0.9568627, 1,
-0.05530007, -0.9719462, -3.145812, 0, 1, 0.9647059, 1,
-0.05365543, -1.229548, -3.706441, 0, 1, 0.9686275, 1,
-0.04971901, -0.6982274, -2.504734, 0, 1, 0.9764706, 1,
-0.0494401, -0.6690027, -2.086751, 0, 1, 0.9803922, 1,
-0.04943711, 1.88759, 0.829605, 0, 1, 0.9882353, 1,
-0.04799066, -1.643001, -1.895516, 0, 1, 0.9921569, 1,
-0.04700447, 0.2091459, -0.1795179, 0, 1, 1, 1,
-0.04545721, -0.2310827, -3.097491, 0, 0.9921569, 1, 1,
-0.04272234, 1.03493, 0.1823239, 0, 0.9882353, 1, 1,
-0.03936301, 0.5676184, 1.326568, 0, 0.9803922, 1, 1,
-0.03908024, -0.5157449, -4.743207, 0, 0.9764706, 1, 1,
-0.03109398, -1.533665, -2.3207, 0, 0.9686275, 1, 1,
-0.03076149, 0.2204045, 0.6865969, 0, 0.9647059, 1, 1,
-0.02665688, -0.122252, -2.483297, 0, 0.9568627, 1, 1,
-0.01917643, 1.45698, 1.855444, 0, 0.9529412, 1, 1,
-0.01757221, -1.543023, -3.149556, 0, 0.945098, 1, 1,
-0.01155444, 0.6625354, 1.561413, 0, 0.9411765, 1, 1,
-0.008678935, 0.5566208, -0.3739335, 0, 0.9333333, 1, 1,
-0.007623487, -0.1924584, -2.584709, 0, 0.9294118, 1, 1,
-0.007183257, -0.4370408, -2.573883, 0, 0.9215686, 1, 1,
0.00451903, 0.4602966, -0.02047541, 0, 0.9176471, 1, 1,
0.009116347, -0.7855638, 4.153512, 0, 0.9098039, 1, 1,
0.009188911, 0.3562779, -0.8595841, 0, 0.9058824, 1, 1,
0.0098016, -0.1658044, 2.467213, 0, 0.8980392, 1, 1,
0.01055126, 0.7040175, -0.03428017, 0, 0.8901961, 1, 1,
0.01631473, 0.214287, 0.3183719, 0, 0.8862745, 1, 1,
0.01684035, 0.3381298, 0.241074, 0, 0.8784314, 1, 1,
0.01684907, 1.515819, 0.898319, 0, 0.8745098, 1, 1,
0.01703683, -0.03514792, 3.278155, 0, 0.8666667, 1, 1,
0.01791574, 0.6019844, 1.812105, 0, 0.8627451, 1, 1,
0.01900584, 0.7429312, 1.70105, 0, 0.854902, 1, 1,
0.01992911, 1.162199, 0.04225932, 0, 0.8509804, 1, 1,
0.02160599, -1.85226, 0.6654098, 0, 0.8431373, 1, 1,
0.02326492, 1.364157, 0.06054443, 0, 0.8392157, 1, 1,
0.02364785, 0.4421398, 0.9146994, 0, 0.8313726, 1, 1,
0.02756342, -0.7682025, 2.850356, 0, 0.827451, 1, 1,
0.0292892, -0.6926551, 2.72133, 0, 0.8196079, 1, 1,
0.03068473, 0.1472221, 0.8739304, 0, 0.8156863, 1, 1,
0.03263028, -2.126297, 3.962224, 0, 0.8078431, 1, 1,
0.03308706, -1.67407, 2.952779, 0, 0.8039216, 1, 1,
0.04160094, -0.4746827, 4.795852, 0, 0.7960784, 1, 1,
0.04330002, 0.3062645, 0.9761747, 0, 0.7882353, 1, 1,
0.0484709, -0.9125844, 4.131062, 0, 0.7843137, 1, 1,
0.04868758, 0.593284, 0.05523197, 0, 0.7764706, 1, 1,
0.05318771, 0.6175361, 1.247318, 0, 0.772549, 1, 1,
0.05767352, 0.2401755, 0.3329041, 0, 0.7647059, 1, 1,
0.06256668, -1.332957, 2.676628, 0, 0.7607843, 1, 1,
0.06838893, 0.9114507, -0.3617869, 0, 0.7529412, 1, 1,
0.06958615, 0.2319614, -0.3112999, 0, 0.7490196, 1, 1,
0.0757267, 0.6923147, -0.8040081, 0, 0.7411765, 1, 1,
0.07620053, 0.865773, -0.1279956, 0, 0.7372549, 1, 1,
0.07884673, -1.791734, 1.716192, 0, 0.7294118, 1, 1,
0.08042752, 0.1093201, -1.014418, 0, 0.7254902, 1, 1,
0.08317489, 0.9297763, 0.430011, 0, 0.7176471, 1, 1,
0.0963546, -0.433681, 1.808403, 0, 0.7137255, 1, 1,
0.09698793, -1.264889, 2.585543, 0, 0.7058824, 1, 1,
0.09839093, -0.4316736, 1.156208, 0, 0.6980392, 1, 1,
0.1003674, -1.331874, 2.724552, 0, 0.6941177, 1, 1,
0.1025221, 0.5523869, 0.772789, 0, 0.6862745, 1, 1,
0.102868, -0.3618751, 1.39886, 0, 0.682353, 1, 1,
0.1061054, -1.350492, 3.850344, 0, 0.6745098, 1, 1,
0.1081576, 0.4438703, 2.736915, 0, 0.6705883, 1, 1,
0.1084061, -1.388333, 3.798631, 0, 0.6627451, 1, 1,
0.113877, 1.191972, 0.6857401, 0, 0.6588235, 1, 1,
0.120466, 0.188652, -0.03874013, 0, 0.6509804, 1, 1,
0.1226656, 0.6636413, 0.8961951, 0, 0.6470588, 1, 1,
0.1236669, -0.2125081, 3.978309, 0, 0.6392157, 1, 1,
0.1246688, -0.5202222, 3.990622, 0, 0.6352941, 1, 1,
0.1316047, 0.2714129, 1.149324, 0, 0.627451, 1, 1,
0.1337352, -0.2023182, 1.650967, 0, 0.6235294, 1, 1,
0.1349328, -1.419818, 3.503812, 0, 0.6156863, 1, 1,
0.1371314, 0.6923039, 0.4048335, 0, 0.6117647, 1, 1,
0.1372316, -0.2350031, 2.02437, 0, 0.6039216, 1, 1,
0.1418722, -2.086223, 3.023289, 0, 0.5960785, 1, 1,
0.1428876, 0.8072187, -0.9423655, 0, 0.5921569, 1, 1,
0.1431397, -0.589169, 0.6257167, 0, 0.5843138, 1, 1,
0.147045, -0.8103741, 2.106848, 0, 0.5803922, 1, 1,
0.1476417, 1.503732, 0.3983017, 0, 0.572549, 1, 1,
0.1509068, 0.7639362, 1.650051, 0, 0.5686275, 1, 1,
0.158158, 1.320223, 0.2608553, 0, 0.5607843, 1, 1,
0.1587391, -2.44756, 1.454061, 0, 0.5568628, 1, 1,
0.1597926, -0.1322001, 1.966667, 0, 0.5490196, 1, 1,
0.1638346, -0.06649193, 1.021669, 0, 0.5450981, 1, 1,
0.165205, -1.64513, 4.294096, 0, 0.5372549, 1, 1,
0.1683013, -0.0492227, 3.843694, 0, 0.5333334, 1, 1,
0.1727028, 0.2985475, 0.3644099, 0, 0.5254902, 1, 1,
0.1755116, -0.9670582, 3.998658, 0, 0.5215687, 1, 1,
0.1795714, -1.277206, 3.647612, 0, 0.5137255, 1, 1,
0.1874805, 0.343817, 2.379097, 0, 0.509804, 1, 1,
0.1875873, 0.07200749, 0.9054099, 0, 0.5019608, 1, 1,
0.1891914, 0.5815976, 0.7235984, 0, 0.4941176, 1, 1,
0.1899268, -0.448845, 2.431406, 0, 0.4901961, 1, 1,
0.1912429, -0.4884988, 1.697552, 0, 0.4823529, 1, 1,
0.1921669, -0.2135326, 2.084642, 0, 0.4784314, 1, 1,
0.1936621, -0.1760663, 1.668814, 0, 0.4705882, 1, 1,
0.1949524, -1.039244, 2.791902, 0, 0.4666667, 1, 1,
0.2005365, 0.1472671, -0.1233472, 0, 0.4588235, 1, 1,
0.204653, 0.1599718, 0.5319906, 0, 0.454902, 1, 1,
0.2056787, -1.615003, 3.552419, 0, 0.4470588, 1, 1,
0.211694, 0.1562068, 0.380538, 0, 0.4431373, 1, 1,
0.2148627, -0.05812792, 1.655384, 0, 0.4352941, 1, 1,
0.2164189, 0.3187644, -0.1361059, 0, 0.4313726, 1, 1,
0.2183063, -0.9572564, 2.474665, 0, 0.4235294, 1, 1,
0.2197344, -1.881605, 3.129462, 0, 0.4196078, 1, 1,
0.2205963, -0.1741295, 2.557938, 0, 0.4117647, 1, 1,
0.2206487, 0.5382328, -0.4995787, 0, 0.4078431, 1, 1,
0.2239364, 0.783107, 0.2622453, 0, 0.4, 1, 1,
0.2269383, -0.9239725, 2.063901, 0, 0.3921569, 1, 1,
0.2329293, 0.5379215, 0.08308103, 0, 0.3882353, 1, 1,
0.2341378, 0.3480381, 1.429652, 0, 0.3803922, 1, 1,
0.2370715, 0.5253516, 0.273323, 0, 0.3764706, 1, 1,
0.2388174, -2.561581, 2.307036, 0, 0.3686275, 1, 1,
0.2401417, 0.6413809, -1.519606, 0, 0.3647059, 1, 1,
0.2416174, -1.748914, 2.961963, 0, 0.3568628, 1, 1,
0.2432574, -1.409774, 3.462857, 0, 0.3529412, 1, 1,
0.2445963, -0.04166853, 0.5929245, 0, 0.345098, 1, 1,
0.2553278, 0.4097458, 0.2817648, 0, 0.3411765, 1, 1,
0.256819, -0.3674839, 1.629394, 0, 0.3333333, 1, 1,
0.2568762, 0.8259355, 1.263623, 0, 0.3294118, 1, 1,
0.2629288, 1.739521, -0.2906332, 0, 0.3215686, 1, 1,
0.270715, -0.3463326, 2.643668, 0, 0.3176471, 1, 1,
0.2737328, 0.4112688, -0.5194823, 0, 0.3098039, 1, 1,
0.2788872, 1.086925, -0.1933975, 0, 0.3058824, 1, 1,
0.282884, -0.5173111, 0.2702959, 0, 0.2980392, 1, 1,
0.2881169, 0.9448703, -0.03370395, 0, 0.2901961, 1, 1,
0.2894628, 0.2694659, 0.91536, 0, 0.2862745, 1, 1,
0.2903782, -0.7568037, 1.969788, 0, 0.2784314, 1, 1,
0.2941715, -0.4739763, 1.247199, 0, 0.2745098, 1, 1,
0.2950885, 0.4932615, 0.8506176, 0, 0.2666667, 1, 1,
0.2970434, 0.1048993, 2.060545, 0, 0.2627451, 1, 1,
0.297394, 1.230443, 1.969422, 0, 0.254902, 1, 1,
0.2982506, -0.6989886, 1.828577, 0, 0.2509804, 1, 1,
0.2991896, 1.582817, -0.2439167, 0, 0.2431373, 1, 1,
0.2997349, -2.436359, 3.729154, 0, 0.2392157, 1, 1,
0.3000964, 0.08608439, 1.096456, 0, 0.2313726, 1, 1,
0.302231, -0.02625532, 0.9541972, 0, 0.227451, 1, 1,
0.3053959, 0.3743773, 2.773406, 0, 0.2196078, 1, 1,
0.3082242, 0.5442654, 1.423288, 0, 0.2156863, 1, 1,
0.3092556, -2.068775, 2.6649, 0, 0.2078431, 1, 1,
0.3101645, 0.3705197, -1.429864, 0, 0.2039216, 1, 1,
0.3148814, 0.5117454, 1.094276, 0, 0.1960784, 1, 1,
0.3153577, 0.862507, 0.7486367, 0, 0.1882353, 1, 1,
0.3227193, -0.2866055, 2.13542, 0, 0.1843137, 1, 1,
0.3233823, -1.480729, 3.441548, 0, 0.1764706, 1, 1,
0.3241549, 0.4993457, -0.4474397, 0, 0.172549, 1, 1,
0.3260967, -0.2488982, 2.117378, 0, 0.1647059, 1, 1,
0.3321888, 0.3422317, 0.2606158, 0, 0.1607843, 1, 1,
0.3344329, 1.558589, -0.4028876, 0, 0.1529412, 1, 1,
0.3371045, 0.129693, 0.8894873, 0, 0.1490196, 1, 1,
0.337926, 1.276961, 0.5826573, 0, 0.1411765, 1, 1,
0.3380735, -1.114201, 1.418396, 0, 0.1372549, 1, 1,
0.338878, 0.8598341, 0.8752968, 0, 0.1294118, 1, 1,
0.338993, 0.6036181, -0.01128645, 0, 0.1254902, 1, 1,
0.3408178, 0.5241614, 2.675125, 0, 0.1176471, 1, 1,
0.3422347, 0.5243907, 0.678189, 0, 0.1137255, 1, 1,
0.3463784, 0.4356232, -0.4211828, 0, 0.1058824, 1, 1,
0.3483842, 1.090065, -0.82309, 0, 0.09803922, 1, 1,
0.355761, 0.5727229, 1.113151, 0, 0.09411765, 1, 1,
0.3595361, -1.210293, 3.380957, 0, 0.08627451, 1, 1,
0.3648846, 1.098119, 1.03088, 0, 0.08235294, 1, 1,
0.3661862, -0.8220522, 2.556464, 0, 0.07450981, 1, 1,
0.3663386, -0.9360037, 3.10364, 0, 0.07058824, 1, 1,
0.3665602, 1.186895, -0.7632418, 0, 0.0627451, 1, 1,
0.3666862, 0.7659653, 0.4550164, 0, 0.05882353, 1, 1,
0.3677141, 0.1226914, 1.57546, 0, 0.05098039, 1, 1,
0.3680491, 0.370855, -0.007513701, 0, 0.04705882, 1, 1,
0.3769422, -0.7839507, 3.191205, 0, 0.03921569, 1, 1,
0.3772541, -0.5238187, 3.484578, 0, 0.03529412, 1, 1,
0.3782701, 0.5398041, -0.3481183, 0, 0.02745098, 1, 1,
0.3832143, -1.211662, 3.92959, 0, 0.02352941, 1, 1,
0.3897828, 0.8010534, 0.5959831, 0, 0.01568628, 1, 1,
0.3915075, 1.755887, 0.3554972, 0, 0.01176471, 1, 1,
0.39222, 0.7915125, 0.7709482, 0, 0.003921569, 1, 1,
0.3960232, -0.4372935, 4.352523, 0.003921569, 0, 1, 1,
0.3965862, -0.4149944, 2.026261, 0.007843138, 0, 1, 1,
0.4011919, 0.5457476, 3.121571, 0.01568628, 0, 1, 1,
0.4017648, -1.240622, 2.337478, 0.01960784, 0, 1, 1,
0.4028956, 0.6287459, -0.1404439, 0.02745098, 0, 1, 1,
0.4041916, -1.033257, 3.954598, 0.03137255, 0, 1, 1,
0.4127152, 0.4007092, 1.092786, 0.03921569, 0, 1, 1,
0.4127514, -1.968861, 3.224359, 0.04313726, 0, 1, 1,
0.4135945, 1.658026, 1.166573, 0.05098039, 0, 1, 1,
0.4150604, 0.5225623, 0.8006494, 0.05490196, 0, 1, 1,
0.4152665, -1.287668, 3.033735, 0.0627451, 0, 1, 1,
0.4153284, 0.927014, -0.09528464, 0.06666667, 0, 1, 1,
0.4183471, -1.247263, 1.362152, 0.07450981, 0, 1, 1,
0.4220627, 0.2655578, 0.1189581, 0.07843138, 0, 1, 1,
0.4276981, 0.6484967, -0.82579, 0.08627451, 0, 1, 1,
0.4305029, 1.000672, 0.04523836, 0.09019608, 0, 1, 1,
0.4336294, 0.4972548, 0.5021679, 0.09803922, 0, 1, 1,
0.4391389, 0.4457938, 1.455992, 0.1058824, 0, 1, 1,
0.439719, 1.131963, -1.030875, 0.1098039, 0, 1, 1,
0.4487814, -0.08112734, 2.112275, 0.1176471, 0, 1, 1,
0.4510914, 0.5370267, 0.9272022, 0.1215686, 0, 1, 1,
0.4587139, 0.3316701, 1.360713, 0.1294118, 0, 1, 1,
0.4605254, 0.07781512, 0.3151252, 0.1333333, 0, 1, 1,
0.4638948, -0.3585124, -0.02652576, 0.1411765, 0, 1, 1,
0.4645304, -0.05046796, 2.615219, 0.145098, 0, 1, 1,
0.4675182, -0.9199487, 3.177418, 0.1529412, 0, 1, 1,
0.4716627, -0.8741634, 3.392103, 0.1568628, 0, 1, 1,
0.486989, -1.325712, 1.204587, 0.1647059, 0, 1, 1,
0.4935607, 0.4165473, 0.799508, 0.1686275, 0, 1, 1,
0.4957961, 1.145834, 1.827638, 0.1764706, 0, 1, 1,
0.4968107, 0.7576264, -0.5490632, 0.1803922, 0, 1, 1,
0.5029743, -0.6860093, 2.957938, 0.1882353, 0, 1, 1,
0.5045477, 0.02972702, 2.302364, 0.1921569, 0, 1, 1,
0.5078373, -0.6452483, 2.46707, 0.2, 0, 1, 1,
0.5136696, 0.6354102, 1.485169, 0.2078431, 0, 1, 1,
0.5142753, 0.2405375, 2.88481, 0.2117647, 0, 1, 1,
0.5172057, -1.96187, 3.671615, 0.2196078, 0, 1, 1,
0.5296981, 0.1068513, 1.129004, 0.2235294, 0, 1, 1,
0.5297616, -0.2144097, 2.821488, 0.2313726, 0, 1, 1,
0.5311717, -1.659657, 2.698462, 0.2352941, 0, 1, 1,
0.5319458, 0.9581129, 0.2252924, 0.2431373, 0, 1, 1,
0.5348766, -0.3306286, 1.677862, 0.2470588, 0, 1, 1,
0.5511085, 0.197967, 0.9997321, 0.254902, 0, 1, 1,
0.5537268, 0.518234, 0.1769574, 0.2588235, 0, 1, 1,
0.554489, 0.05937155, 0.6956729, 0.2666667, 0, 1, 1,
0.5559697, -0.2074399, 2.98509, 0.2705882, 0, 1, 1,
0.5560118, -1.512681, 2.799261, 0.2784314, 0, 1, 1,
0.5586708, 0.7342427, 1.330016, 0.282353, 0, 1, 1,
0.566048, -0.6287334, 2.036784, 0.2901961, 0, 1, 1,
0.5671518, -0.7684789, 3.40064, 0.2941177, 0, 1, 1,
0.5687109, -1.672281, 3.383809, 0.3019608, 0, 1, 1,
0.5702109, 0.09091949, 1.520711, 0.3098039, 0, 1, 1,
0.5705686, -0.774789, 1.563059, 0.3137255, 0, 1, 1,
0.573243, 1.707067, -0.4620865, 0.3215686, 0, 1, 1,
0.5776557, -1.086768, 1.850771, 0.3254902, 0, 1, 1,
0.5798908, -2.505108, 2.21563, 0.3333333, 0, 1, 1,
0.5804231, 0.6044309, 1.872835, 0.3372549, 0, 1, 1,
0.5830871, 1.025332, 0.08479284, 0.345098, 0, 1, 1,
0.586159, 0.8773474, 0.08251075, 0.3490196, 0, 1, 1,
0.5911301, -0.6525095, 3.82778, 0.3568628, 0, 1, 1,
0.5970173, -1.007407, 3.331669, 0.3607843, 0, 1, 1,
0.5998218, 1.211651, 1.199806, 0.3686275, 0, 1, 1,
0.600593, -1.459505, 2.676026, 0.372549, 0, 1, 1,
0.6016864, 0.6394251, -0.6138221, 0.3803922, 0, 1, 1,
0.6034598, -0.3814215, 2.649414, 0.3843137, 0, 1, 1,
0.6043175, 0.2756208, 0.3530984, 0.3921569, 0, 1, 1,
0.6044831, -1.476051, 2.136336, 0.3960784, 0, 1, 1,
0.6082711, 0.3849932, 1.026518, 0.4039216, 0, 1, 1,
0.6100107, -0.2983743, 3.003769, 0.4117647, 0, 1, 1,
0.6128719, 0.3156854, 0.7733721, 0.4156863, 0, 1, 1,
0.6141813, 1.333953, 0.7500435, 0.4235294, 0, 1, 1,
0.6165503, -0.293392, 0.8196805, 0.427451, 0, 1, 1,
0.6166525, 0.1153567, 0.7002525, 0.4352941, 0, 1, 1,
0.6234914, 0.306155, 0.5055898, 0.4392157, 0, 1, 1,
0.6249387, 1.663704, -1.866328, 0.4470588, 0, 1, 1,
0.6251633, 0.6520067, 1.459718, 0.4509804, 0, 1, 1,
0.6264969, -0.2772656, 2.101328, 0.4588235, 0, 1, 1,
0.6266697, -2.145478, 2.78516, 0.4627451, 0, 1, 1,
0.6278499, 1.397382, 0.8255019, 0.4705882, 0, 1, 1,
0.6312442, 1.483218, 2.576619, 0.4745098, 0, 1, 1,
0.639316, -0.8285552, 0.9614616, 0.4823529, 0, 1, 1,
0.6433423, -1.630158, 4.071825, 0.4862745, 0, 1, 1,
0.6504214, -0.6935776, 3.432135, 0.4941176, 0, 1, 1,
0.652977, -0.5589346, 2.089832, 0.5019608, 0, 1, 1,
0.6548567, -0.6162729, 2.923817, 0.5058824, 0, 1, 1,
0.6784003, 0.3568999, 1.621644, 0.5137255, 0, 1, 1,
0.6878616, -0.255454, -0.09390186, 0.5176471, 0, 1, 1,
0.6892601, 0.2509497, 0.4241459, 0.5254902, 0, 1, 1,
0.6922157, -1.422384, 3.448613, 0.5294118, 0, 1, 1,
0.7094143, -1.003621, 2.129327, 0.5372549, 0, 1, 1,
0.7105508, -0.8237761, 2.307022, 0.5411765, 0, 1, 1,
0.7120941, -0.5309625, 0.9347561, 0.5490196, 0, 1, 1,
0.7149, 1.614242, -0.8306211, 0.5529412, 0, 1, 1,
0.7169697, -0.4449009, 1.391998, 0.5607843, 0, 1, 1,
0.7252223, -2.082861, 2.513736, 0.5647059, 0, 1, 1,
0.7256587, 1.102799, 2.306173, 0.572549, 0, 1, 1,
0.7259828, -1.063388, 2.779781, 0.5764706, 0, 1, 1,
0.7287702, 0.7113479, 0.7774619, 0.5843138, 0, 1, 1,
0.7325636, 0.2102269, 0.4571674, 0.5882353, 0, 1, 1,
0.7405596, -0.3192899, 3.791958, 0.5960785, 0, 1, 1,
0.7416409, -1.356072, 2.684886, 0.6039216, 0, 1, 1,
0.7493682, 0.8091459, 0.9884126, 0.6078432, 0, 1, 1,
0.7494099, 0.7908601, 0.3429307, 0.6156863, 0, 1, 1,
0.7520975, 0.1202634, 2.443305, 0.6196079, 0, 1, 1,
0.7534963, -0.8844157, 2.769865, 0.627451, 0, 1, 1,
0.7540705, 1.665614, -1.647667, 0.6313726, 0, 1, 1,
0.7587044, 0.5014145, 2.154805, 0.6392157, 0, 1, 1,
0.7607203, -0.9766394, 3.573, 0.6431373, 0, 1, 1,
0.7616499, 0.6567013, 0.9732763, 0.6509804, 0, 1, 1,
0.7660252, -0.2857976, 2.473904, 0.654902, 0, 1, 1,
0.7688482, 0.7998301, -0.08748294, 0.6627451, 0, 1, 1,
0.7718996, -0.5026155, 1.890647, 0.6666667, 0, 1, 1,
0.7732607, -1.474505, 3.682043, 0.6745098, 0, 1, 1,
0.7733219, 0.5212641, 2.522358, 0.6784314, 0, 1, 1,
0.7804751, -0.1023353, -0.4260176, 0.6862745, 0, 1, 1,
0.782041, -0.5758837, 3.537758, 0.6901961, 0, 1, 1,
0.7827915, -0.5501881, 4.683363, 0.6980392, 0, 1, 1,
0.7938689, 0.1981499, 3.148054, 0.7058824, 0, 1, 1,
0.796183, 0.01536086, 0.2617469, 0.7098039, 0, 1, 1,
0.79804, 1.613164, -0.1044049, 0.7176471, 0, 1, 1,
0.8021464, 0.7032453, 0.5329846, 0.7215686, 0, 1, 1,
0.814326, 0.1176025, 1.347417, 0.7294118, 0, 1, 1,
0.8176455, 2.934725, 0.7036965, 0.7333333, 0, 1, 1,
0.818035, -0.2101611, 2.890187, 0.7411765, 0, 1, 1,
0.8208492, -1.603243, 1.860807, 0.7450981, 0, 1, 1,
0.8310785, -0.4983988, 0.6576404, 0.7529412, 0, 1, 1,
0.8332291, -2.040169, 1.599807, 0.7568628, 0, 1, 1,
0.8405823, 0.441141, 1.858694, 0.7647059, 0, 1, 1,
0.8412993, 0.4574102, 2.330722, 0.7686275, 0, 1, 1,
0.8435555, 0.9112325, 0.2200418, 0.7764706, 0, 1, 1,
0.8447932, 0.3131623, 1.921223, 0.7803922, 0, 1, 1,
0.8454118, 0.2304687, 2.097738, 0.7882353, 0, 1, 1,
0.8570219, 0.8905231, 0.614989, 0.7921569, 0, 1, 1,
0.8594385, -0.8725262, 1.736118, 0.8, 0, 1, 1,
0.8624139, -0.3231807, -0.2845204, 0.8078431, 0, 1, 1,
0.8674667, -0.6256876, 3.08907, 0.8117647, 0, 1, 1,
0.8685566, 0.8260126, 0.85581, 0.8196079, 0, 1, 1,
0.877022, -1.273321, 3.769786, 0.8235294, 0, 1, 1,
0.8828709, 0.6940597, 1.669326, 0.8313726, 0, 1, 1,
0.8880994, 0.04123823, 1.882184, 0.8352941, 0, 1, 1,
0.8883299, 0.2123761, 1.290799, 0.8431373, 0, 1, 1,
0.888772, 0.850948, 1.23112, 0.8470588, 0, 1, 1,
0.8927686, -1.519328, 0.2220019, 0.854902, 0, 1, 1,
0.8960392, 0.6293077, 0.1549395, 0.8588235, 0, 1, 1,
0.8972965, -1.551364, 3.905192, 0.8666667, 0, 1, 1,
0.8981651, -0.7676439, 2.73513, 0.8705882, 0, 1, 1,
0.8983595, 0.1518024, 0.3922377, 0.8784314, 0, 1, 1,
0.9028087, -1.918944, 1.500247, 0.8823529, 0, 1, 1,
0.9091394, 1.133029, 0.1999879, 0.8901961, 0, 1, 1,
0.9109339, -0.5126424, 1.981689, 0.8941177, 0, 1, 1,
0.9111708, -1.742744, 4.477093, 0.9019608, 0, 1, 1,
0.9130456, -0.1121596, 3.278612, 0.9098039, 0, 1, 1,
0.9291949, -0.1688692, -0.4163367, 0.9137255, 0, 1, 1,
0.9308057, 0.7307082, 2.750006, 0.9215686, 0, 1, 1,
0.9342133, -0.3907388, 1.428703, 0.9254902, 0, 1, 1,
0.9379221, 0.3259561, 0.8777224, 0.9333333, 0, 1, 1,
0.9399545, -0.6972631, 0.6737278, 0.9372549, 0, 1, 1,
0.9446747, 1.451451, 2.428989, 0.945098, 0, 1, 1,
0.9460987, -0.07999071, 2.015099, 0.9490196, 0, 1, 1,
0.9517792, -0.2406684, 1.500547, 0.9568627, 0, 1, 1,
0.9527493, -0.2985273, 1.690977, 0.9607843, 0, 1, 1,
0.9593661, 0.07104094, 1.936201, 0.9686275, 0, 1, 1,
0.9647183, -0.6851496, 1.104477, 0.972549, 0, 1, 1,
0.9679799, -1.872583, 4.755247, 0.9803922, 0, 1, 1,
0.9681938, -0.168126, 0.5000982, 0.9843137, 0, 1, 1,
0.9695768, -0.7182134, 3.082886, 0.9921569, 0, 1, 1,
0.9712582, 0.08487979, 1.07911, 0.9960784, 0, 1, 1,
0.9761041, 1.085527, 0.6340108, 1, 0, 0.9960784, 1,
0.9784096, 0.3217978, 3.100034, 1, 0, 0.9882353, 1,
0.9834296, 0.5344495, 0.2712696, 1, 0, 0.9843137, 1,
0.9850733, -1.813138, 3.75846, 1, 0, 0.9764706, 1,
0.9872073, 0.1359564, 1.199018, 1, 0, 0.972549, 1,
0.9914647, 0.8204536, 2.03635, 1, 0, 0.9647059, 1,
0.9936653, -0.4892354, 4.031421, 1, 0, 0.9607843, 1,
1.003791, 1.36275, 0.08217636, 1, 0, 0.9529412, 1,
1.00846, -0.5549514, 5.433487, 1, 0, 0.9490196, 1,
1.012631, 1.518063, 0.8421227, 1, 0, 0.9411765, 1,
1.017628, 0.7615609, -0.5454046, 1, 0, 0.9372549, 1,
1.027463, 1.631353, 1.283135, 1, 0, 0.9294118, 1,
1.028046, -0.7144264, 3.4821, 1, 0, 0.9254902, 1,
1.04042, -1.228229, 0.7687123, 1, 0, 0.9176471, 1,
1.041892, 1.4192, 0.5620081, 1, 0, 0.9137255, 1,
1.048243, 1.50616, 0.1721295, 1, 0, 0.9058824, 1,
1.048553, -1.859412, 2.126613, 1, 0, 0.9019608, 1,
1.050232, -0.7940803, 4.860783, 1, 0, 0.8941177, 1,
1.061285, -0.6599025, 2.98838, 1, 0, 0.8862745, 1,
1.0671, -0.1819543, 1.932155, 1, 0, 0.8823529, 1,
1.070107, -0.1877996, 0.229408, 1, 0, 0.8745098, 1,
1.072733, 0.4645455, -0.6492495, 1, 0, 0.8705882, 1,
1.091333, -0.3956927, 1.494277, 1, 0, 0.8627451, 1,
1.10217, -1.579129, 3.333821, 1, 0, 0.8588235, 1,
1.103788, 2.607853, 1.256916, 1, 0, 0.8509804, 1,
1.109709, -0.6806511, 2.144982, 1, 0, 0.8470588, 1,
1.114639, 1.006075, 0.9843333, 1, 0, 0.8392157, 1,
1.115706, -0.6905146, 0.6175292, 1, 0, 0.8352941, 1,
1.115823, 0.936024, 1.98771, 1, 0, 0.827451, 1,
1.116981, 0.4549786, 0.306278, 1, 0, 0.8235294, 1,
1.120066, 0.8854631, 0.7050408, 1, 0, 0.8156863, 1,
1.12182, -2.510765, 2.217792, 1, 0, 0.8117647, 1,
1.124667, -0.6473587, 2.233744, 1, 0, 0.8039216, 1,
1.125662, -0.4895806, 1.112845, 1, 0, 0.7960784, 1,
1.129927, -0.3057234, 3.004272, 1, 0, 0.7921569, 1,
1.130832, -0.549763, 1.844011, 1, 0, 0.7843137, 1,
1.134715, -0.4771432, 2.159699, 1, 0, 0.7803922, 1,
1.140734, -2.188914, 3.51846, 1, 0, 0.772549, 1,
1.150808, -1.118465, 2.522231, 1, 0, 0.7686275, 1,
1.157279, 0.1379468, 2.115596, 1, 0, 0.7607843, 1,
1.159189, -0.7849979, 2.702982, 1, 0, 0.7568628, 1,
1.165093, 1.274442, 0.2537793, 1, 0, 0.7490196, 1,
1.17748, 0.1170005, 3.741154, 1, 0, 0.7450981, 1,
1.189563, 0.1451018, -1.341169, 1, 0, 0.7372549, 1,
1.194065, 1.67029, 1.721367, 1, 0, 0.7333333, 1,
1.205019, 0.3019955, 2.246901, 1, 0, 0.7254902, 1,
1.219955, -1.024205, 5.092612, 1, 0, 0.7215686, 1,
1.221359, 1.595832, 1.459623, 1, 0, 0.7137255, 1,
1.224804, -0.04575297, 0.6276413, 1, 0, 0.7098039, 1,
1.245276, 1.089093, -0.2549004, 1, 0, 0.7019608, 1,
1.248101, 1.412891, 0.1384397, 1, 0, 0.6941177, 1,
1.249023, -0.4902115, 1.70695, 1, 0, 0.6901961, 1,
1.260818, -0.6281393, 2.830182, 1, 0, 0.682353, 1,
1.270842, -1.477752, 3.679026, 1, 0, 0.6784314, 1,
1.275967, -0.7691921, 2.561206, 1, 0, 0.6705883, 1,
1.279798, 0.1516116, 2.661101, 1, 0, 0.6666667, 1,
1.293731, 0.6633648, 0.7493785, 1, 0, 0.6588235, 1,
1.307341, 1.12682, 0.894024, 1, 0, 0.654902, 1,
1.3083, -1.247312, 4.238437, 1, 0, 0.6470588, 1,
1.308997, 1.269149, 0.419149, 1, 0, 0.6431373, 1,
1.310028, 0.6161569, 2.852612, 1, 0, 0.6352941, 1,
1.316871, 1.9148, 1.719573, 1, 0, 0.6313726, 1,
1.324872, -1.043634, 3.001947, 1, 0, 0.6235294, 1,
1.328404, -0.9723618, 2.733027, 1, 0, 0.6196079, 1,
1.33078, -0.5625247, 2.465215, 1, 0, 0.6117647, 1,
1.332795, 0.2799811, 0.9192503, 1, 0, 0.6078432, 1,
1.337832, 1.508947, -0.2584185, 1, 0, 0.6, 1,
1.340134, 1.120372, 1.178595, 1, 0, 0.5921569, 1,
1.341481, 0.9012411, 0.4281875, 1, 0, 0.5882353, 1,
1.342747, 0.3378458, 1.975785, 1, 0, 0.5803922, 1,
1.347878, 0.06894565, 2.722089, 1, 0, 0.5764706, 1,
1.351283, -1.174999, 2.182766, 1, 0, 0.5686275, 1,
1.3516, 0.8177078, 0.9540385, 1, 0, 0.5647059, 1,
1.356349, -1.098035, 0.07536481, 1, 0, 0.5568628, 1,
1.361082, 0.3857999, 1.172037, 1, 0, 0.5529412, 1,
1.379101, 0.3290688, 1.47825, 1, 0, 0.5450981, 1,
1.385373, -0.1753518, 2.934479, 1, 0, 0.5411765, 1,
1.387581, -1.287524, 2.915705, 1, 0, 0.5333334, 1,
1.39276, 0.1162847, 1.215152, 1, 0, 0.5294118, 1,
1.394583, 0.1877183, -0.9213726, 1, 0, 0.5215687, 1,
1.422066, -1.456105, 1.14411, 1, 0, 0.5176471, 1,
1.425646, 0.826124, -0.8309063, 1, 0, 0.509804, 1,
1.431375, 0.05748498, 0.2552731, 1, 0, 0.5058824, 1,
1.448887, -1.258191, 2.434243, 1, 0, 0.4980392, 1,
1.450833, 0.7262534, 0.1819435, 1, 0, 0.4901961, 1,
1.450964, -0.3992759, 2.092498, 1, 0, 0.4862745, 1,
1.453416, 0.7452968, 0.9094997, 1, 0, 0.4784314, 1,
1.456284, 1.356764, 1.266036, 1, 0, 0.4745098, 1,
1.474248, 1.110313, 2.526954, 1, 0, 0.4666667, 1,
1.484715, -0.1213874, 2.895165, 1, 0, 0.4627451, 1,
1.486087, 0.259476, 1.075264, 1, 0, 0.454902, 1,
1.48903, 0.1935423, 1.696609, 1, 0, 0.4509804, 1,
1.494377, -0.6110917, 1.825444, 1, 0, 0.4431373, 1,
1.521191, -1.42754, 1.501533, 1, 0, 0.4392157, 1,
1.521667, 2.5547, 0.08185761, 1, 0, 0.4313726, 1,
1.538498, -0.9443327, 2.974037, 1, 0, 0.427451, 1,
1.544688, 0.3278752, 2.053583, 1, 0, 0.4196078, 1,
1.545534, 0.835541, 1.461736, 1, 0, 0.4156863, 1,
1.552078, -0.8192803, 3.331084, 1, 0, 0.4078431, 1,
1.555774, -1.610235, 3.728527, 1, 0, 0.4039216, 1,
1.570497, 0.8729352, -0.1488451, 1, 0, 0.3960784, 1,
1.570827, 0.9642515, 2.410957, 1, 0, 0.3882353, 1,
1.576199, -1.34108, 3.218557, 1, 0, 0.3843137, 1,
1.579155, 1.063948, 0.3195581, 1, 0, 0.3764706, 1,
1.599586, 0.7436084, 1.174983, 1, 0, 0.372549, 1,
1.604259, 0.5984672, 1.71453, 1, 0, 0.3647059, 1,
1.609761, 0.851405, 1.155728, 1, 0, 0.3607843, 1,
1.613929, 0.8176153, 2.892121, 1, 0, 0.3529412, 1,
1.614295, -0.827507, 1.573256, 1, 0, 0.3490196, 1,
1.620306, 0.4244851, 0.3556961, 1, 0, 0.3411765, 1,
1.638531, 0.3286595, 2.283467, 1, 0, 0.3372549, 1,
1.644139, -0.6859564, 5.039195, 1, 0, 0.3294118, 1,
1.652081, 0.641218, 1.269184, 1, 0, 0.3254902, 1,
1.663056, -1.159606, 2.461728, 1, 0, 0.3176471, 1,
1.663605, 0.2695763, 2.4, 1, 0, 0.3137255, 1,
1.668794, -1.196014, 2.227332, 1, 0, 0.3058824, 1,
1.683254, 0.187558, 1.700206, 1, 0, 0.2980392, 1,
1.702157, 0.9974638, 0.2812443, 1, 0, 0.2941177, 1,
1.736613, 0.06745499, 1.616407, 1, 0, 0.2862745, 1,
1.737234, 0.06904693, 0.5262824, 1, 0, 0.282353, 1,
1.75874, -0.09891797, 2.687971, 1, 0, 0.2745098, 1,
1.764881, -1.070627, 1.406855, 1, 0, 0.2705882, 1,
1.795656, 0.8743545, 2.56055, 1, 0, 0.2627451, 1,
1.817352, -0.5405946, 1.757846, 1, 0, 0.2588235, 1,
1.841675, 2.021995, -2.202643, 1, 0, 0.2509804, 1,
1.853494, 0.2463445, 2.240396, 1, 0, 0.2470588, 1,
1.855934, 1.917459, -0.4580351, 1, 0, 0.2392157, 1,
1.857418, 0.9726944, 0.8110493, 1, 0, 0.2352941, 1,
1.875996, 0.4702387, -0.3147427, 1, 0, 0.227451, 1,
1.882933, -0.5032742, 3.474137, 1, 0, 0.2235294, 1,
1.887664, -1.209422, 2.223245, 1, 0, 0.2156863, 1,
1.889106, -0.3376517, 2.700394, 1, 0, 0.2117647, 1,
1.89258, -0.06266566, 0.2442872, 1, 0, 0.2039216, 1,
1.912652, -0.7897947, 2.83226, 1, 0, 0.1960784, 1,
1.941877, -0.3241855, 0.7411749, 1, 0, 0.1921569, 1,
1.992869, -0.2881471, 1.905228, 1, 0, 0.1843137, 1,
1.99359, 1.183829, 1.727278, 1, 0, 0.1803922, 1,
2.010601, 0.9366314, 2.16502, 1, 0, 0.172549, 1,
2.02324, 0.7168286, 0.1142346, 1, 0, 0.1686275, 1,
2.029522, 1.950262, -0.4795488, 1, 0, 0.1607843, 1,
2.039875, -0.1589613, -0.5633036, 1, 0, 0.1568628, 1,
2.056965, -2.009403, 2.983837, 1, 0, 0.1490196, 1,
2.077777, 1.443255, 1.27902, 1, 0, 0.145098, 1,
2.086519, 0.1178047, 0.6191348, 1, 0, 0.1372549, 1,
2.089976, 0.3271963, 0.5777845, 1, 0, 0.1333333, 1,
2.101687, -0.5701438, 1.68125, 1, 0, 0.1254902, 1,
2.106595, 1.129072, 1.947567, 1, 0, 0.1215686, 1,
2.140508, 2.018922, 1.793628, 1, 0, 0.1137255, 1,
2.147413, -0.6671454, 1.904065, 1, 0, 0.1098039, 1,
2.14975, 1.173273, 1.461913, 1, 0, 0.1019608, 1,
2.197186, -0.9274604, 1.932998, 1, 0, 0.09411765, 1,
2.198479, -1.664708, 2.320423, 1, 0, 0.09019608, 1,
2.201712, 0.5377805, 0.6868556, 1, 0, 0.08235294, 1,
2.20545, 0.0210896, -0.3639595, 1, 0, 0.07843138, 1,
2.214927, 0.7990835, 1.862215, 1, 0, 0.07058824, 1,
2.230804, -0.6880352, 1.36696, 1, 0, 0.06666667, 1,
2.274097, 1.359732, 1.857096, 1, 0, 0.05882353, 1,
2.304515, -1.212262, 3.786937, 1, 0, 0.05490196, 1,
2.326052, 0.5610409, -0.1988624, 1, 0, 0.04705882, 1,
2.344319, -0.3456271, 1.912511, 1, 0, 0.04313726, 1,
2.487328, -0.5218688, 2.89414, 1, 0, 0.03529412, 1,
2.559127, 0.5776839, 0.7305094, 1, 0, 0.03137255, 1,
2.618679, 0.5165789, 0.8864049, 1, 0, 0.02352941, 1,
2.650668, -1.857731, 1.149934, 1, 0, 0.01960784, 1,
3.07147, 0.2704798, 1.000723, 1, 0, 0.01176471, 1,
3.535351, -0.7162974, 1.610255, 1, 0, 0.007843138, 1
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
0.3753561, -4.254247, -7.60584, 0, -0.5, 0.5, 0.5,
0.3753561, -4.254247, -7.60584, 1, -0.5, 0.5, 0.5,
0.3753561, -4.254247, -7.60584, 1, 1.5, 0.5, 0.5,
0.3753561, -4.254247, -7.60584, 0, 1.5, 0.5, 0.5
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
-3.855876, 0.1225678, -7.60584, 0, -0.5, 0.5, 0.5,
-3.855876, 0.1225678, -7.60584, 1, -0.5, 0.5, 0.5,
-3.855876, 0.1225678, -7.60584, 1, 1.5, 0.5, 0.5,
-3.855876, 0.1225678, -7.60584, 0, 1.5, 0.5, 0.5
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
-3.855876, -4.254247, -0.1412575, 0, -0.5, 0.5, 0.5,
-3.855876, -4.254247, -0.1412575, 1, -0.5, 0.5, 0.5,
-3.855876, -4.254247, -0.1412575, 1, 1.5, 0.5, 0.5,
-3.855876, -4.254247, -0.1412575, 0, 1.5, 0.5, 0.5
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
-2, -3.244213, -5.883245,
3, -3.244213, -5.883245,
-2, -3.244213, -5.883245,
-2, -3.412552, -6.170344,
-1, -3.244213, -5.883245,
-1, -3.412552, -6.170344,
0, -3.244213, -5.883245,
0, -3.412552, -6.170344,
1, -3.244213, -5.883245,
1, -3.412552, -6.170344,
2, -3.244213, -5.883245,
2, -3.412552, -6.170344,
3, -3.244213, -5.883245,
3, -3.412552, -6.170344
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
-2, -3.74923, -6.744542, 0, -0.5, 0.5, 0.5,
-2, -3.74923, -6.744542, 1, -0.5, 0.5, 0.5,
-2, -3.74923, -6.744542, 1, 1.5, 0.5, 0.5,
-2, -3.74923, -6.744542, 0, 1.5, 0.5, 0.5,
-1, -3.74923, -6.744542, 0, -0.5, 0.5, 0.5,
-1, -3.74923, -6.744542, 1, -0.5, 0.5, 0.5,
-1, -3.74923, -6.744542, 1, 1.5, 0.5, 0.5,
-1, -3.74923, -6.744542, 0, 1.5, 0.5, 0.5,
0, -3.74923, -6.744542, 0, -0.5, 0.5, 0.5,
0, -3.74923, -6.744542, 1, -0.5, 0.5, 0.5,
0, -3.74923, -6.744542, 1, 1.5, 0.5, 0.5,
0, -3.74923, -6.744542, 0, 1.5, 0.5, 0.5,
1, -3.74923, -6.744542, 0, -0.5, 0.5, 0.5,
1, -3.74923, -6.744542, 1, -0.5, 0.5, 0.5,
1, -3.74923, -6.744542, 1, 1.5, 0.5, 0.5,
1, -3.74923, -6.744542, 0, 1.5, 0.5, 0.5,
2, -3.74923, -6.744542, 0, -0.5, 0.5, 0.5,
2, -3.74923, -6.744542, 1, -0.5, 0.5, 0.5,
2, -3.74923, -6.744542, 1, 1.5, 0.5, 0.5,
2, -3.74923, -6.744542, 0, 1.5, 0.5, 0.5,
3, -3.74923, -6.744542, 0, -0.5, 0.5, 0.5,
3, -3.74923, -6.744542, 1, -0.5, 0.5, 0.5,
3, -3.74923, -6.744542, 1, 1.5, 0.5, 0.5,
3, -3.74923, -6.744542, 0, 1.5, 0.5, 0.5
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
-2.879438, -3, -5.883245,
-2.879438, 3, -5.883245,
-2.879438, -3, -5.883245,
-3.042178, -3, -6.170344,
-2.879438, -2, -5.883245,
-3.042178, -2, -6.170344,
-2.879438, -1, -5.883245,
-3.042178, -1, -6.170344,
-2.879438, 0, -5.883245,
-3.042178, 0, -6.170344,
-2.879438, 1, -5.883245,
-3.042178, 1, -6.170344,
-2.879438, 2, -5.883245,
-3.042178, 2, -6.170344,
-2.879438, 3, -5.883245,
-3.042178, 3, -6.170344
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
-3.367657, -3, -6.744542, 0, -0.5, 0.5, 0.5,
-3.367657, -3, -6.744542, 1, -0.5, 0.5, 0.5,
-3.367657, -3, -6.744542, 1, 1.5, 0.5, 0.5,
-3.367657, -3, -6.744542, 0, 1.5, 0.5, 0.5,
-3.367657, -2, -6.744542, 0, -0.5, 0.5, 0.5,
-3.367657, -2, -6.744542, 1, -0.5, 0.5, 0.5,
-3.367657, -2, -6.744542, 1, 1.5, 0.5, 0.5,
-3.367657, -2, -6.744542, 0, 1.5, 0.5, 0.5,
-3.367657, -1, -6.744542, 0, -0.5, 0.5, 0.5,
-3.367657, -1, -6.744542, 1, -0.5, 0.5, 0.5,
-3.367657, -1, -6.744542, 1, 1.5, 0.5, 0.5,
-3.367657, -1, -6.744542, 0, 1.5, 0.5, 0.5,
-3.367657, 0, -6.744542, 0, -0.5, 0.5, 0.5,
-3.367657, 0, -6.744542, 1, -0.5, 0.5, 0.5,
-3.367657, 0, -6.744542, 1, 1.5, 0.5, 0.5,
-3.367657, 0, -6.744542, 0, 1.5, 0.5, 0.5,
-3.367657, 1, -6.744542, 0, -0.5, 0.5, 0.5,
-3.367657, 1, -6.744542, 1, -0.5, 0.5, 0.5,
-3.367657, 1, -6.744542, 1, 1.5, 0.5, 0.5,
-3.367657, 1, -6.744542, 0, 1.5, 0.5, 0.5,
-3.367657, 2, -6.744542, 0, -0.5, 0.5, 0.5,
-3.367657, 2, -6.744542, 1, -0.5, 0.5, 0.5,
-3.367657, 2, -6.744542, 1, 1.5, 0.5, 0.5,
-3.367657, 2, -6.744542, 0, 1.5, 0.5, 0.5,
-3.367657, 3, -6.744542, 0, -0.5, 0.5, 0.5,
-3.367657, 3, -6.744542, 1, -0.5, 0.5, 0.5,
-3.367657, 3, -6.744542, 1, 1.5, 0.5, 0.5,
-3.367657, 3, -6.744542, 0, 1.5, 0.5, 0.5
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
-2.879438, -3.244213, -4,
-2.879438, -3.244213, 4,
-2.879438, -3.244213, -4,
-3.042178, -3.412552, -4,
-2.879438, -3.244213, -2,
-3.042178, -3.412552, -2,
-2.879438, -3.244213, 0,
-3.042178, -3.412552, 0,
-2.879438, -3.244213, 2,
-3.042178, -3.412552, 2,
-2.879438, -3.244213, 4,
-3.042178, -3.412552, 4
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
-3.367657, -3.74923, -4, 0, -0.5, 0.5, 0.5,
-3.367657, -3.74923, -4, 1, -0.5, 0.5, 0.5,
-3.367657, -3.74923, -4, 1, 1.5, 0.5, 0.5,
-3.367657, -3.74923, -4, 0, 1.5, 0.5, 0.5,
-3.367657, -3.74923, -2, 0, -0.5, 0.5, 0.5,
-3.367657, -3.74923, -2, 1, -0.5, 0.5, 0.5,
-3.367657, -3.74923, -2, 1, 1.5, 0.5, 0.5,
-3.367657, -3.74923, -2, 0, 1.5, 0.5, 0.5,
-3.367657, -3.74923, 0, 0, -0.5, 0.5, 0.5,
-3.367657, -3.74923, 0, 1, -0.5, 0.5, 0.5,
-3.367657, -3.74923, 0, 1, 1.5, 0.5, 0.5,
-3.367657, -3.74923, 0, 0, 1.5, 0.5, 0.5,
-3.367657, -3.74923, 2, 0, -0.5, 0.5, 0.5,
-3.367657, -3.74923, 2, 1, -0.5, 0.5, 0.5,
-3.367657, -3.74923, 2, 1, 1.5, 0.5, 0.5,
-3.367657, -3.74923, 2, 0, 1.5, 0.5, 0.5,
-3.367657, -3.74923, 4, 0, -0.5, 0.5, 0.5,
-3.367657, -3.74923, 4, 1, -0.5, 0.5, 0.5,
-3.367657, -3.74923, 4, 1, 1.5, 0.5, 0.5,
-3.367657, -3.74923, 4, 0, 1.5, 0.5, 0.5
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
-2.879438, -3.244213, -5.883245,
-2.879438, 3.489349, -5.883245,
-2.879438, -3.244213, 5.600729,
-2.879438, 3.489349, 5.600729,
-2.879438, -3.244213, -5.883245,
-2.879438, -3.244213, 5.600729,
-2.879438, 3.489349, -5.883245,
-2.879438, 3.489349, 5.600729,
-2.879438, -3.244213, -5.883245,
3.63015, -3.244213, -5.883245,
-2.879438, -3.244213, 5.600729,
3.63015, -3.244213, 5.600729,
-2.879438, 3.489349, -5.883245,
3.63015, 3.489349, -5.883245,
-2.879438, 3.489349, 5.600729,
3.63015, 3.489349, 5.600729,
3.63015, -3.244213, -5.883245,
3.63015, 3.489349, -5.883245,
3.63015, -3.244213, 5.600729,
3.63015, 3.489349, 5.600729,
3.63015, -3.244213, -5.883245,
3.63015, -3.244213, 5.600729,
3.63015, 3.489349, -5.883245,
3.63015, 3.489349, 5.600729
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
var radius = 7.912959;
var distance = 35.20565;
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
mvMatrix.translate( -0.3753561, -0.1225678, 0.1412575 );
mvMatrix.scale( 1.314314, 1.270597, 0.7450075 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.20565);
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
streptomycin<-read.table("streptomycin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-streptomycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'streptomycin' not found
```

```r
y<-streptomycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'streptomycin' not found
```

```r
z<-streptomycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'streptomycin' not found
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
-2.784638, -0.2798123, -0.3422583, 0, 0, 1, 1, 1,
-2.742395, -2.452919, -1.520963, 1, 0, 0, 1, 1,
-2.73171, -0.7476002, -1.095306, 1, 0, 0, 1, 1,
-2.591516, -1.53963, -3.305016, 1, 0, 0, 1, 1,
-2.46248, 0.09930842, -1.22583, 1, 0, 0, 1, 1,
-2.440026, -0.06544857, -1.857634, 1, 0, 0, 1, 1,
-2.439518, 0.1686411, -0.3676703, 0, 0, 0, 1, 1,
-2.415121, 0.9202275, -0.5816097, 0, 0, 0, 1, 1,
-2.410684, 0.8174409, -1.493864, 0, 0, 0, 1, 1,
-2.373478, 0.4793322, -2.024539, 0, 0, 0, 1, 1,
-2.301471, -0.007843852, -2.008622, 0, 0, 0, 1, 1,
-2.247472, -0.1283178, -2.29831, 0, 0, 0, 1, 1,
-2.223336, -0.04360948, -2.738053, 0, 0, 0, 1, 1,
-2.1976, 0.5498279, -1.229095, 1, 1, 1, 1, 1,
-2.076049, 0.462471, -3.139822, 1, 1, 1, 1, 1,
-2.05334, 0.2625108, -1.023183, 1, 1, 1, 1, 1,
-2.053117, 0.2537925, -1.759321, 1, 1, 1, 1, 1,
-2.047673, 0.5976283, -0.951675, 1, 1, 1, 1, 1,
-2.026658, 2.111194, -0.08875082, 1, 1, 1, 1, 1,
-2.012416, 0.1777826, -2.614536, 1, 1, 1, 1, 1,
-1.98486, 1.116428, -2.232479, 1, 1, 1, 1, 1,
-1.893876, 0.7874218, -2.691223, 1, 1, 1, 1, 1,
-1.882926, -0.1897592, -2.474401, 1, 1, 1, 1, 1,
-1.859255, -0.07177945, -2.113537, 1, 1, 1, 1, 1,
-1.796495, -0.9715154, -1.374264, 1, 1, 1, 1, 1,
-1.79306, -1.335893, -1.274496, 1, 1, 1, 1, 1,
-1.791497, 0.2027057, -0.7037793, 1, 1, 1, 1, 1,
-1.789888, 0.5272459, -1.865317, 1, 1, 1, 1, 1,
-1.76624, -1.586215, -1.560551, 0, 0, 1, 1, 1,
-1.762107, 0.742863, -0.9301968, 1, 0, 0, 1, 1,
-1.75853, -0.7816395, -1.711486, 1, 0, 0, 1, 1,
-1.753325, 1.194402, -1.449209, 1, 0, 0, 1, 1,
-1.735957, 0.06427492, -1.304516, 1, 0, 0, 1, 1,
-1.734819, 0.9340414, -0.9429758, 1, 0, 0, 1, 1,
-1.734354, 0.2657927, -0.7834557, 0, 0, 0, 1, 1,
-1.713193, 1.26134, 1.618961, 0, 0, 0, 1, 1,
-1.713193, 0.3851067, -1.996069, 0, 0, 0, 1, 1,
-1.69966, 0.5622038, -2.4016, 0, 0, 0, 1, 1,
-1.694213, 0.6749316, -2.370856, 0, 0, 0, 1, 1,
-1.692185, -0.191243, -1.719284, 0, 0, 0, 1, 1,
-1.674574, -0.4452588, -2.134741, 0, 0, 0, 1, 1,
-1.653756, 1.288953, -1.279636, 1, 1, 1, 1, 1,
-1.647463, -1.120643, -2.117467, 1, 1, 1, 1, 1,
-1.64175, -2.333784, -1.562474, 1, 1, 1, 1, 1,
-1.591084, -1.415991, -1.968024, 1, 1, 1, 1, 1,
-1.590427, 1.738973, -0.1517223, 1, 1, 1, 1, 1,
-1.587428, -1.092758, -0.5131111, 1, 1, 1, 1, 1,
-1.569333, -1.980029, -3.771961, 1, 1, 1, 1, 1,
-1.566428, -1.192928, -2.455452, 1, 1, 1, 1, 1,
-1.540836, 2.825396, -0.6708157, 1, 1, 1, 1, 1,
-1.53843, 1.782063, -2.067795, 1, 1, 1, 1, 1,
-1.528085, 1.63877, -0.9785016, 1, 1, 1, 1, 1,
-1.519029, -0.0709095, -0.8526237, 1, 1, 1, 1, 1,
-1.515956, -1.195894, -4.187714, 1, 1, 1, 1, 1,
-1.514575, -0.4414479, -3.430056, 1, 1, 1, 1, 1,
-1.510375, -0.6423895, -0.9568926, 1, 1, 1, 1, 1,
-1.506522, 0.3924931, -1.294972, 0, 0, 1, 1, 1,
-1.503601, 0.2949052, -2.076856, 1, 0, 0, 1, 1,
-1.502549, -1.208102, -3.277813, 1, 0, 0, 1, 1,
-1.500597, -0.1136692, -1.625449, 1, 0, 0, 1, 1,
-1.480893, -0.09114814, -1.790531, 1, 0, 0, 1, 1,
-1.478736, -0.3834326, -2.562987, 1, 0, 0, 1, 1,
-1.471034, 1.976004, -0.2165908, 0, 0, 0, 1, 1,
-1.470118, 1.055276, -0.1393161, 0, 0, 0, 1, 1,
-1.447076, 1.890598, -1.074562, 0, 0, 0, 1, 1,
-1.447018, 0.1278639, -2.004652, 0, 0, 0, 1, 1,
-1.444753, 0.8085632, -2.087078, 0, 0, 0, 1, 1,
-1.423336, -1.495361, -3.803603, 0, 0, 0, 1, 1,
-1.406492, -1.491124, -1.529053, 0, 0, 0, 1, 1,
-1.403715, 1.033688, -0.8411618, 1, 1, 1, 1, 1,
-1.395159, -0.4754473, -1.821185, 1, 1, 1, 1, 1,
-1.390135, 1.622236, -2.143169, 1, 1, 1, 1, 1,
-1.383878, 0.6399439, -0.6673512, 1, 1, 1, 1, 1,
-1.383412, -0.3366275, -1.717545, 1, 1, 1, 1, 1,
-1.37754, -0.384612, -2.862432, 1, 1, 1, 1, 1,
-1.374435, -0.9045796, -1.997879, 1, 1, 1, 1, 1,
-1.367426, -0.6589761, -0.5716375, 1, 1, 1, 1, 1,
-1.360695, -0.3617388, -0.3701405, 1, 1, 1, 1, 1,
-1.360671, 1.672202, -2.446206, 1, 1, 1, 1, 1,
-1.354836, -0.557173, -0.3893108, 1, 1, 1, 1, 1,
-1.349501, 0.4043789, -1.904849, 1, 1, 1, 1, 1,
-1.346767, -0.3848626, -1.129601, 1, 1, 1, 1, 1,
-1.322169, -0.9228042, -2.382149, 1, 1, 1, 1, 1,
-1.318174, -0.2804324, -2.15535, 1, 1, 1, 1, 1,
-1.313927, 0.4308531, -0.8644013, 0, 0, 1, 1, 1,
-1.307104, 0.7325586, -2.750091, 1, 0, 0, 1, 1,
-1.3059, 1.39564, 0.03911075, 1, 0, 0, 1, 1,
-1.282187, 0.05623248, -0.8355442, 1, 0, 0, 1, 1,
-1.277029, 0.3490473, -1.12764, 1, 0, 0, 1, 1,
-1.275672, -0.6395885, -1.620977, 1, 0, 0, 1, 1,
-1.273362, -0.3939356, -2.037021, 0, 0, 0, 1, 1,
-1.271431, 0.8522075, -1.177133, 0, 0, 0, 1, 1,
-1.261841, -1.09391, -1.942351, 0, 0, 0, 1, 1,
-1.261197, -1.755083, -2.465684, 0, 0, 0, 1, 1,
-1.252229, -0.283165, -2.161031, 0, 0, 0, 1, 1,
-1.25201, 0.6182274, -2.043296, 0, 0, 0, 1, 1,
-1.250457, 1.323977, 1.057385, 0, 0, 0, 1, 1,
-1.245838, 1.105412, -1.566103, 1, 1, 1, 1, 1,
-1.244781, 0.251069, -2.632267, 1, 1, 1, 1, 1,
-1.239931, 0.2869917, -0.8176495, 1, 1, 1, 1, 1,
-1.229204, -0.7894787, -1.471675, 1, 1, 1, 1, 1,
-1.220855, 0.003593818, -2.163194, 1, 1, 1, 1, 1,
-1.21611, -2.147348, -4.798028, 1, 1, 1, 1, 1,
-1.215696, -0.4895219, -2.337584, 1, 1, 1, 1, 1,
-1.166097, 0.1984133, 0.1357131, 1, 1, 1, 1, 1,
-1.163584, -0.08147163, -2.06123, 1, 1, 1, 1, 1,
-1.161837, -1.56565, -1.422058, 1, 1, 1, 1, 1,
-1.156501, -2.372099, -2.826848, 1, 1, 1, 1, 1,
-1.141306, 0.9411629, -1.883128, 1, 1, 1, 1, 1,
-1.140494, -0.8453575, -1.196461, 1, 1, 1, 1, 1,
-1.126287, 2.296044, -0.3942269, 1, 1, 1, 1, 1,
-1.122852, -0.2044029, -1.639739, 1, 1, 1, 1, 1,
-1.114701, 0.04123527, -2.076014, 0, 0, 1, 1, 1,
-1.114263, 0.302827, -1.312342, 1, 0, 0, 1, 1,
-1.11201, -0.3784674, -2.040197, 1, 0, 0, 1, 1,
-1.109333, 0.584214, 0.1873481, 1, 0, 0, 1, 1,
-1.109093, 0.6676867, -1.12925, 1, 0, 0, 1, 1,
-1.099074, 0.237063, -0.5872219, 1, 0, 0, 1, 1,
-1.093368, -1.942306, -4.107967, 0, 0, 0, 1, 1,
-1.091989, -0.1780628, -1.457603, 0, 0, 0, 1, 1,
-1.082431, -1.317269, -2.096416, 0, 0, 0, 1, 1,
-1.078233, 0.07979436, -1.792259, 0, 0, 0, 1, 1,
-1.069531, -0.4730424, -0.9064822, 0, 0, 0, 1, 1,
-1.044718, 1.800935, -0.6773108, 0, 0, 0, 1, 1,
-1.040937, -0.5826006, -1.459113, 0, 0, 0, 1, 1,
-1.034743, -1.103911, -0.8206429, 1, 1, 1, 1, 1,
-1.030606, 1.666132, -0.552027, 1, 1, 1, 1, 1,
-1.028631, -0.114598, 0.4549932, 1, 1, 1, 1, 1,
-1.012367, 1.19684, -0.8473355, 1, 1, 1, 1, 1,
-1.010334, 0.7412463, -0.3620986, 1, 1, 1, 1, 1,
-1.007434, 1.309042, -1.066888, 1, 1, 1, 1, 1,
-1.001622, 0.4553832, -1.259865, 1, 1, 1, 1, 1,
-0.9965444, -0.8478312, -3.21923, 1, 1, 1, 1, 1,
-0.9961277, 1.358559, -1.743629, 1, 1, 1, 1, 1,
-0.9929225, -0.6171693, -4.423581, 1, 1, 1, 1, 1,
-0.9908942, -2.30445, -3.622737, 1, 1, 1, 1, 1,
-0.9836907, 2.058344, -0.962867, 1, 1, 1, 1, 1,
-0.9703479, -1.003074, -2.12183, 1, 1, 1, 1, 1,
-0.9606349, 0.2864179, -1.226382, 1, 1, 1, 1, 1,
-0.9602073, 0.9961268, -1.738191, 1, 1, 1, 1, 1,
-0.960002, 0.123208, -0.2315831, 0, 0, 1, 1, 1,
-0.9599935, 1.781618, -0.1618267, 1, 0, 0, 1, 1,
-0.9585427, -0.3199986, -1.594312, 1, 0, 0, 1, 1,
-0.9572477, 0.2336916, -1.754818, 1, 0, 0, 1, 1,
-0.9425289, 1.460159, -0.2058954, 1, 0, 0, 1, 1,
-0.939388, 0.8279284, -1.103382, 1, 0, 0, 1, 1,
-0.9385535, 0.3379539, -0.9530964, 0, 0, 0, 1, 1,
-0.9377312, 0.8897076, -0.8469233, 0, 0, 0, 1, 1,
-0.9339577, -0.3631282, -0.8369827, 0, 0, 0, 1, 1,
-0.9331487, -0.9879778, -2.764747, 0, 0, 0, 1, 1,
-0.9176049, -0.2061271, -3.870898, 0, 0, 0, 1, 1,
-0.9142246, -0.5218924, -0.2286138, 0, 0, 0, 1, 1,
-0.9078273, 1.69754, -1.861615, 0, 0, 0, 1, 1,
-0.90715, -0.1075279, -0.8422598, 1, 1, 1, 1, 1,
-0.9071216, 0.2951408, -0.7312064, 1, 1, 1, 1, 1,
-0.9047778, 0.533861, 0.1790469, 1, 1, 1, 1, 1,
-0.9004917, -0.09048513, -3.163253, 1, 1, 1, 1, 1,
-0.8999245, 0.228718, -2.345381, 1, 1, 1, 1, 1,
-0.8919828, -1.115109, -3.190485, 1, 1, 1, 1, 1,
-0.8889542, 0.1440266, -0.9198637, 1, 1, 1, 1, 1,
-0.8885829, -1.764857, -1.910649, 1, 1, 1, 1, 1,
-0.8795912, -0.9875546, -1.808583, 1, 1, 1, 1, 1,
-0.8728511, -0.8566243, -3.15972, 1, 1, 1, 1, 1,
-0.8717894, -0.8963794, -2.966102, 1, 1, 1, 1, 1,
-0.8683918, 1.342692, -1.687239, 1, 1, 1, 1, 1,
-0.8680864, 2.34606, -1.787339, 1, 1, 1, 1, 1,
-0.858171, -0.05263448, -2.454704, 1, 1, 1, 1, 1,
-0.8569778, -1.509215, -0.2402187, 1, 1, 1, 1, 1,
-0.8519974, 0.6211053, -0.7338077, 0, 0, 1, 1, 1,
-0.8507593, 1.016621, -0.6753868, 1, 0, 0, 1, 1,
-0.8503768, 0.2236962, -1.551512, 1, 0, 0, 1, 1,
-0.8495601, 0.1071792, -0.2397931, 1, 0, 0, 1, 1,
-0.8453044, -1.426763, -0.958958, 1, 0, 0, 1, 1,
-0.8420306, -0.6725022, -3.730657, 1, 0, 0, 1, 1,
-0.8413397, 1.180719, 0.4503901, 0, 0, 0, 1, 1,
-0.8358665, 0.7383846, -0.4913871, 0, 0, 0, 1, 1,
-0.8349066, 1.275438, -0.8719428, 0, 0, 0, 1, 1,
-0.832217, 0.004286037, -2.153304, 0, 0, 0, 1, 1,
-0.8316517, 0.1213354, -0.8923813, 0, 0, 0, 1, 1,
-0.8301463, -0.5843639, -2.097235, 0, 0, 0, 1, 1,
-0.8282419, -0.1042029, -2.556764, 0, 0, 0, 1, 1,
-0.8249264, 1.342914, 0.3367361, 1, 1, 1, 1, 1,
-0.8241231, 1.725616, -0.8118424, 1, 1, 1, 1, 1,
-0.8197778, 0.182712, -0.6227515, 1, 1, 1, 1, 1,
-0.8180607, -1.812951, -3.982265, 1, 1, 1, 1, 1,
-0.8132209, -0.9035163, -1.49336, 1, 1, 1, 1, 1,
-0.8087166, 1.444095, -0.7205792, 1, 1, 1, 1, 1,
-0.8029276, -0.3913766, -0.5432574, 1, 1, 1, 1, 1,
-0.7958034, 1.145281, 0.2917135, 1, 1, 1, 1, 1,
-0.79441, -0.03162242, -0.3644877, 1, 1, 1, 1, 1,
-0.7879083, 0.209664, -0.5231109, 1, 1, 1, 1, 1,
-0.7748711, -0.5012292, 0.9355402, 1, 1, 1, 1, 1,
-0.7739096, 1.014705, 0.5274237, 1, 1, 1, 1, 1,
-0.7727914, -0.7910096, -1.748674, 1, 1, 1, 1, 1,
-0.7691246, -0.2956082, -1.603005, 1, 1, 1, 1, 1,
-0.7686003, 0.3494002, -0.736847, 1, 1, 1, 1, 1,
-0.7624679, 0.8147607, 0.04880401, 0, 0, 1, 1, 1,
-0.7598001, 0.0761754, 0.1432168, 1, 0, 0, 1, 1,
-0.7554792, -1.546945, -2.836739, 1, 0, 0, 1, 1,
-0.7493804, -0.04177847, -1.75938, 1, 0, 0, 1, 1,
-0.7489355, 0.4517555, -0.363225, 1, 0, 0, 1, 1,
-0.748174, -2.031533, -4.057777, 1, 0, 0, 1, 1,
-0.7475404, 0.970225, 0.8333233, 0, 0, 0, 1, 1,
-0.7433483, 0.3132475, -2.620445, 0, 0, 0, 1, 1,
-0.7366464, -1.39365, -3.836874, 0, 0, 0, 1, 1,
-0.7349982, -1.375814, -4.293785, 0, 0, 0, 1, 1,
-0.7301882, 2.224451, -2.424726, 0, 0, 0, 1, 1,
-0.7257937, -3.146152, -1.171756, 0, 0, 0, 1, 1,
-0.7236686, -0.9178882, -2.064924, 0, 0, 0, 1, 1,
-0.7235878, -0.2170189, -1.099215, 1, 1, 1, 1, 1,
-0.7223554, -2.012537, -2.881459, 1, 1, 1, 1, 1,
-0.7115831, -0.1842593, -1.621482, 1, 1, 1, 1, 1,
-0.7051477, 0.8703554, -0.6836938, 1, 1, 1, 1, 1,
-0.7035158, -1.085392, -1.758585, 1, 1, 1, 1, 1,
-0.703461, -0.8674114, -2.540754, 1, 1, 1, 1, 1,
-0.6973057, -0.1507895, -1.074554, 1, 1, 1, 1, 1,
-0.6909574, 0.9066788, -0.64293, 1, 1, 1, 1, 1,
-0.6889983, -1.190064, -3.044551, 1, 1, 1, 1, 1,
-0.6876295, -0.6106526, -2.073666, 1, 1, 1, 1, 1,
-0.6864016, 0.136543, -1.260995, 1, 1, 1, 1, 1,
-0.6862517, -1.099633, -2.200178, 1, 1, 1, 1, 1,
-0.6827064, -0.3340636, -0.8703356, 1, 1, 1, 1, 1,
-0.6770543, 0.3515138, -1.64559, 1, 1, 1, 1, 1,
-0.6743721, -0.2350163, -1.791127, 1, 1, 1, 1, 1,
-0.6740105, -1.274067, -3.979329, 0, 0, 1, 1, 1,
-0.6733525, 0.9920853, -0.7726654, 1, 0, 0, 1, 1,
-0.6612673, 0.09913357, -0.6910774, 1, 0, 0, 1, 1,
-0.6581756, -0.3182538, -1.564686, 1, 0, 0, 1, 1,
-0.6573886, -0.4818054, -0.5172635, 1, 0, 0, 1, 1,
-0.6536391, -1.160859, -1.869003, 1, 0, 0, 1, 1,
-0.6532423, 0.1014631, -2.429485, 0, 0, 0, 1, 1,
-0.6522588, 0.5805972, -2.887617, 0, 0, 0, 1, 1,
-0.6463118, -0.5538995, -2.003393, 0, 0, 0, 1, 1,
-0.6448269, 0.1262735, -1.526805, 0, 0, 0, 1, 1,
-0.6385176, -1.357395, -5.374642, 0, 0, 0, 1, 1,
-0.6382052, 2.082891, -0.08172684, 0, 0, 0, 1, 1,
-0.6354805, -1.8466, -2.879606, 0, 0, 0, 1, 1,
-0.6329126, -0.292324, -3.014472, 1, 1, 1, 1, 1,
-0.6280048, 1.478049, -2.424807, 1, 1, 1, 1, 1,
-0.6274214, -0.2499879, -1.496943, 1, 1, 1, 1, 1,
-0.6270352, 1.993853, 0.5379456, 1, 1, 1, 1, 1,
-0.6221309, -0.2956628, -1.027641, 1, 1, 1, 1, 1,
-0.6185717, 1.704488, 0.6280007, 1, 1, 1, 1, 1,
-0.6174675, -1.924062, -3.491644, 1, 1, 1, 1, 1,
-0.6172117, 0.5666264, -0.4579639, 1, 1, 1, 1, 1,
-0.6167635, 0.9442841, -2.136937, 1, 1, 1, 1, 1,
-0.6124852, -0.07607453, -1.584986, 1, 1, 1, 1, 1,
-0.6116304, 1.387203, -0.4694304, 1, 1, 1, 1, 1,
-0.6101848, -0.1446938, -3.176826, 1, 1, 1, 1, 1,
-0.6076633, -0.2622028, -2.918463, 1, 1, 1, 1, 1,
-0.6062196, 0.596603, -1.064659, 1, 1, 1, 1, 1,
-0.6050513, -0.9698443, -2.08292, 1, 1, 1, 1, 1,
-0.6048598, -1.276765, -3.068858, 0, 0, 1, 1, 1,
-0.600356, -0.2691675, -2.055981, 1, 0, 0, 1, 1,
-0.5970852, 0.3200448, -1.382807, 1, 0, 0, 1, 1,
-0.5939382, -1.353917, -4.160903, 1, 0, 0, 1, 1,
-0.5939022, -0.1340877, -2.678423, 1, 0, 0, 1, 1,
-0.5929471, -0.8128517, -3.950193, 1, 0, 0, 1, 1,
-0.5920197, -0.657065, -2.848255, 0, 0, 0, 1, 1,
-0.5844479, 0.8772801, -0.09837942, 0, 0, 0, 1, 1,
-0.5774873, -0.8152441, -2.453215, 0, 0, 0, 1, 1,
-0.5715957, -0.7622274, -2.324132, 0, 0, 0, 1, 1,
-0.5703187, -0.5886678, -2.268149, 0, 0, 0, 1, 1,
-0.5686914, -0.7095535, -2.545722, 0, 0, 0, 1, 1,
-0.564457, 1.674701, 0.6061246, 0, 0, 0, 1, 1,
-0.564343, -0.9587193, -2.412641, 1, 1, 1, 1, 1,
-0.5609015, 0.006703822, -1.264441, 1, 1, 1, 1, 1,
-0.5604911, -0.9672698, -1.553796, 1, 1, 1, 1, 1,
-0.5597441, -2.17357, -2.789244, 1, 1, 1, 1, 1,
-0.5537119, 0.09661032, -1.056794, 1, 1, 1, 1, 1,
-0.5534557, -1.710636, -4.059366, 1, 1, 1, 1, 1,
-0.5522471, -1.213069, -4.304327, 1, 1, 1, 1, 1,
-0.550698, -0.9687982, -4.284729, 1, 1, 1, 1, 1,
-0.5469102, 0.09952776, -2.726953, 1, 1, 1, 1, 1,
-0.5467092, 0.9139395, -0.3565946, 1, 1, 1, 1, 1,
-0.5450385, 0.1482224, -1.03784, 1, 1, 1, 1, 1,
-0.5439647, -0.1347745, -0.4319374, 1, 1, 1, 1, 1,
-0.5422525, -0.9988073, -1.456283, 1, 1, 1, 1, 1,
-0.5422164, -0.2560145, -1.486791, 1, 1, 1, 1, 1,
-0.5398981, 0.6053611, -1.43877, 1, 1, 1, 1, 1,
-0.5378634, -0.8595216, -3.673452, 0, 0, 1, 1, 1,
-0.5362945, -1.44887, -0.9820297, 1, 0, 0, 1, 1,
-0.5337594, -0.002599434, -1.630251, 1, 0, 0, 1, 1,
-0.5289168, -0.2411055, -1.574631, 1, 0, 0, 1, 1,
-0.527676, 0.03142807, 0.2765854, 1, 0, 0, 1, 1,
-0.5219228, 0.3531097, -1.247543, 1, 0, 0, 1, 1,
-0.5204268, 0.6774592, -0.3459238, 0, 0, 0, 1, 1,
-0.5167965, -0.2989989, -1.988438, 0, 0, 0, 1, 1,
-0.5138698, 0.2894128, -0.5145136, 0, 0, 0, 1, 1,
-0.5115451, 0.4844702, -1.716202, 0, 0, 0, 1, 1,
-0.5087428, -0.9431023, -1.647507, 0, 0, 0, 1, 1,
-0.5068758, 0.1009625, -0.8309858, 0, 0, 0, 1, 1,
-0.4971136, 0.4250264, -1.58814, 0, 0, 0, 1, 1,
-0.4956001, -1.225983, -1.405501, 1, 1, 1, 1, 1,
-0.494476, -0.5120153, -2.425085, 1, 1, 1, 1, 1,
-0.4934632, -1.47073, -1.88324, 1, 1, 1, 1, 1,
-0.4916763, -1.362982, -3.187139, 1, 1, 1, 1, 1,
-0.4905593, -0.8692106, -2.25332, 1, 1, 1, 1, 1,
-0.4903564, -0.544582, -2.087452, 1, 1, 1, 1, 1,
-0.4891964, -1.409309, -5.716002, 1, 1, 1, 1, 1,
-0.4891179, -0.01035776, -0.4456151, 1, 1, 1, 1, 1,
-0.4840475, 1.292364, -0.6739417, 1, 1, 1, 1, 1,
-0.4803274, -1.360527, -2.42385, 1, 1, 1, 1, 1,
-0.4800858, 0.1773629, -1.290611, 1, 1, 1, 1, 1,
-0.4778979, 0.1851797, -0.9564808, 1, 1, 1, 1, 1,
-0.4755723, -1.413008, -2.207634, 1, 1, 1, 1, 1,
-0.4734656, 1.239984, 0.6051648, 1, 1, 1, 1, 1,
-0.4721078, 1.327217, -2.104978, 1, 1, 1, 1, 1,
-0.4711038, 1.806316, 0.3063802, 0, 0, 1, 1, 1,
-0.4682046, 1.037994, -2.627107, 1, 0, 0, 1, 1,
-0.4658489, 0.3479072, -0.9622576, 1, 0, 0, 1, 1,
-0.4648052, 1.011075, -0.5515262, 1, 0, 0, 1, 1,
-0.4645951, 0.9313979, 1.182783, 1, 0, 0, 1, 1,
-0.4642488, 0.4628858, -0.8228622, 1, 0, 0, 1, 1,
-0.4627707, -2.294613, -4.296277, 0, 0, 0, 1, 1,
-0.4614837, 1.654853, 0.6270846, 0, 0, 0, 1, 1,
-0.4560193, 2.343285, 0.4259181, 0, 0, 0, 1, 1,
-0.449452, -0.3375256, -1.401865, 0, 0, 0, 1, 1,
-0.4488096, 1.655758, 1.899437, 0, 0, 0, 1, 1,
-0.4476265, -0.8187953, -2.524674, 0, 0, 0, 1, 1,
-0.4465079, 1.13159, 0.4168876, 0, 0, 0, 1, 1,
-0.4438576, -0.2527365, -2.550656, 1, 1, 1, 1, 1,
-0.4434486, -0.1976574, -0.1202972, 1, 1, 1, 1, 1,
-0.4392608, -1.000667, -1.952199, 1, 1, 1, 1, 1,
-0.4335798, -0.1451913, -1.933147, 1, 1, 1, 1, 1,
-0.4315282, -1.021248, -3.826282, 1, 1, 1, 1, 1,
-0.4283991, 0.9122435, -0.258395, 1, 1, 1, 1, 1,
-0.4276483, 1.289442, 0.4244885, 1, 1, 1, 1, 1,
-0.4270005, -0.4375957, -3.960711, 1, 1, 1, 1, 1,
-0.4247185, -1.152655, -1.440037, 1, 1, 1, 1, 1,
-0.4190775, 0.7063959, -0.7543553, 1, 1, 1, 1, 1,
-0.4173144, 0.4206883, 1.080882, 1, 1, 1, 1, 1,
-0.4160841, -0.08484381, -2.655043, 1, 1, 1, 1, 1,
-0.4158054, -0.7172353, -0.906544, 1, 1, 1, 1, 1,
-0.4122488, 0.0584542, -0.1603866, 1, 1, 1, 1, 1,
-0.4111397, -0.3856304, -3.137671, 1, 1, 1, 1, 1,
-0.4105057, 0.05821287, -2.022328, 0, 0, 1, 1, 1,
-0.407883, 0.6295689, -0.756162, 1, 0, 0, 1, 1,
-0.4049882, -0.9359198, -2.541923, 1, 0, 0, 1, 1,
-0.4038623, 0.2729098, -1.269858, 1, 0, 0, 1, 1,
-0.4026381, 0.8617808, 0.240252, 1, 0, 0, 1, 1,
-0.4007529, 1.898456, -0.9880144, 1, 0, 0, 1, 1,
-0.3972858, -1.579338, -2.601648, 0, 0, 0, 1, 1,
-0.3939148, 1.187777, -0.0558782, 0, 0, 0, 1, 1,
-0.3931779, 0.2871445, -1.482541, 0, 0, 0, 1, 1,
-0.391158, 1.287553, -0.6839821, 0, 0, 0, 1, 1,
-0.3897492, 0.1594567, -2.130937, 0, 0, 0, 1, 1,
-0.3862558, 1.669702, -0.2711844, 0, 0, 0, 1, 1,
-0.3830799, 0.2371731, -2.082555, 0, 0, 0, 1, 1,
-0.3829374, 0.2883618, -2.027874, 1, 1, 1, 1, 1,
-0.3792135, -1.663963, -2.656345, 1, 1, 1, 1, 1,
-0.3780052, 0.2118383, -0.8911736, 1, 1, 1, 1, 1,
-0.3769758, -1.073452, -2.362848, 1, 1, 1, 1, 1,
-0.3685459, 0.4290553, -2.08142, 1, 1, 1, 1, 1,
-0.3681384, -1.42137, -3.265945, 1, 1, 1, 1, 1,
-0.3625516, -1.554707, -2.484328, 1, 1, 1, 1, 1,
-0.3593161, -0.6348045, -4.107544, 1, 1, 1, 1, 1,
-0.353564, 0.6308163, -2.509212, 1, 1, 1, 1, 1,
-0.3534408, 0.411988, -1.722641, 1, 1, 1, 1, 1,
-0.3480161, 0.2837994, -1.914954, 1, 1, 1, 1, 1,
-0.3478591, 0.9237014, 0.3148485, 1, 1, 1, 1, 1,
-0.3394669, 0.8664564, -1.223163, 1, 1, 1, 1, 1,
-0.3379231, -1.021556, -1.901587, 1, 1, 1, 1, 1,
-0.327531, -0.01900446, -2.015249, 1, 1, 1, 1, 1,
-0.325365, -0.4037315, -1.180493, 0, 0, 1, 1, 1,
-0.3231685, 0.7997167, -1.651937, 1, 0, 0, 1, 1,
-0.3196692, 0.009059116, -1.326439, 1, 0, 0, 1, 1,
-0.3194886, 1.958055, 0.3308639, 1, 0, 0, 1, 1,
-0.3191176, -0.301257, -3.005673, 1, 0, 0, 1, 1,
-0.3185779, 2.133484, -0.2107243, 1, 0, 0, 1, 1,
-0.317622, -0.6519293, -4.587913, 0, 0, 0, 1, 1,
-0.3174571, 0.403521, -1.235731, 0, 0, 0, 1, 1,
-0.3158938, -0.2588603, -1.737706, 0, 0, 0, 1, 1,
-0.3154774, -0.3978656, -1.735327, 0, 0, 0, 1, 1,
-0.3144514, 0.572751, -0.7187894, 0, 0, 0, 1, 1,
-0.3135304, -0.6152149, -3.169402, 0, 0, 0, 1, 1,
-0.3125538, 0.2690698, -1.118772, 0, 0, 0, 1, 1,
-0.3063736, 0.812313, 0.1640655, 1, 1, 1, 1, 1,
-0.3058947, 0.1448641, -0.913194, 1, 1, 1, 1, 1,
-0.3053225, -0.7206297, -3.341383, 1, 1, 1, 1, 1,
-0.3048917, -0.4263808, -3.748173, 1, 1, 1, 1, 1,
-0.3037629, -0.5574609, -3.570709, 1, 1, 1, 1, 1,
-0.3029531, 0.2177386, 1.074, 1, 1, 1, 1, 1,
-0.3009733, -1.447487, -2.899125, 1, 1, 1, 1, 1,
-0.2961329, -0.05207306, -1.956036, 1, 1, 1, 1, 1,
-0.2961206, 1.012255, -0.05614059, 1, 1, 1, 1, 1,
-0.2867738, -0.121303, -0.9458373, 1, 1, 1, 1, 1,
-0.2853056, -1.789522, -1.65832, 1, 1, 1, 1, 1,
-0.2851325, 0.6932623, -0.7426962, 1, 1, 1, 1, 1,
-0.283116, 0.5037873, -0.4120603, 1, 1, 1, 1, 1,
-0.2799956, 0.6502076, -3.026444, 1, 1, 1, 1, 1,
-0.279627, 0.3748072, -1.866577, 1, 1, 1, 1, 1,
-0.2738506, -0.5049424, -2.513009, 0, 0, 1, 1, 1,
-0.2728694, 0.6526528, -2.664372, 1, 0, 0, 1, 1,
-0.2718266, -0.1362755, -3.151486, 1, 0, 0, 1, 1,
-0.2701529, -0.7770604, -1.125455, 1, 0, 0, 1, 1,
-0.2649253, 0.7165291, 0.9035259, 1, 0, 0, 1, 1,
-0.2623593, 0.4056377, -1.366025, 1, 0, 0, 1, 1,
-0.2564469, 2.040079, 0.05398464, 0, 0, 0, 1, 1,
-0.2494658, 3.391287, -0.5686465, 0, 0, 0, 1, 1,
-0.2491128, -1.598568, -2.887228, 0, 0, 0, 1, 1,
-0.248679, -1.042296, -3.144188, 0, 0, 0, 1, 1,
-0.2482668, 0.1360983, -1.402038, 0, 0, 0, 1, 1,
-0.247693, 0.1340047, -0.9158326, 0, 0, 0, 1, 1,
-0.2421239, 1.191186, -0.394767, 0, 0, 0, 1, 1,
-0.2406781, 0.6940401, 0.4100611, 1, 1, 1, 1, 1,
-0.2380571, 0.06901542, -2.158855, 1, 1, 1, 1, 1,
-0.2372414, 0.6022193, -0.302352, 1, 1, 1, 1, 1,
-0.2365533, 1.420491, 1.178836, 1, 1, 1, 1, 1,
-0.2346154, 0.789912, -0.01539504, 1, 1, 1, 1, 1,
-0.2311153, -1.277483, -3.824686, 1, 1, 1, 1, 1,
-0.2308076, 0.6458868, -0.5518681, 1, 1, 1, 1, 1,
-0.2274507, -0.04404227, 0.3453375, 1, 1, 1, 1, 1,
-0.2225246, -0.0525386, -2.790299, 1, 1, 1, 1, 1,
-0.220876, -0.2652636, -1.85488, 1, 1, 1, 1, 1,
-0.2199026, 0.3373251, -1.3028, 1, 1, 1, 1, 1,
-0.218891, 0.6055014, 0.006030303, 1, 1, 1, 1, 1,
-0.2187183, 0.07347637, -1.133725, 1, 1, 1, 1, 1,
-0.2139065, -0.4161286, -3.025009, 1, 1, 1, 1, 1,
-0.213631, 0.7321444, 0.4357791, 1, 1, 1, 1, 1,
-0.2103958, 1.52295, 0.06446018, 0, 0, 1, 1, 1,
-0.2088377, 0.9198157, -0.9531394, 1, 0, 0, 1, 1,
-0.2059806, 1.502732, -0.9292414, 1, 0, 0, 1, 1,
-0.205447, -0.8429526, -0.8966275, 1, 0, 0, 1, 1,
-0.2012302, 0.6837254, 1.105347, 1, 0, 0, 1, 1,
-0.2012121, 0.7524239, 0.1296888, 1, 0, 0, 1, 1,
-0.197607, 0.4369117, 0.3204975, 0, 0, 0, 1, 1,
-0.1970476, -0.02385036, -0.5384091, 0, 0, 0, 1, 1,
-0.1961263, 0.4814453, -0.6383239, 0, 0, 0, 1, 1,
-0.1925875, -1.279261, -2.647921, 0, 0, 0, 1, 1,
-0.1918672, -1.022648, -2.990452, 0, 0, 0, 1, 1,
-0.1885747, -0.235816, -3.024309, 0, 0, 0, 1, 1,
-0.1874944, 2.121489, -1.567214, 0, 0, 0, 1, 1,
-0.1870548, 1.73321, 0.1762466, 1, 1, 1, 1, 1,
-0.176128, 1.849236, 1.514516, 1, 1, 1, 1, 1,
-0.1746578, -0.2072619, -1.920269, 1, 1, 1, 1, 1,
-0.1670927, 1.148607, 0.4599161, 1, 1, 1, 1, 1,
-0.1644014, 0.7817078, 1.074909, 1, 1, 1, 1, 1,
-0.1637626, -0.7041098, -1.516035, 1, 1, 1, 1, 1,
-0.1582308, -1.660443, -2.152132, 1, 1, 1, 1, 1,
-0.1562059, -0.4006822, -2.654678, 1, 1, 1, 1, 1,
-0.1506718, 1.120147, -0.9493275, 1, 1, 1, 1, 1,
-0.1478338, -0.777714, -4.299922, 1, 1, 1, 1, 1,
-0.1473919, -1.673437, -3.647478, 1, 1, 1, 1, 1,
-0.1455015, 1.567205, -0.4932174, 1, 1, 1, 1, 1,
-0.1446155, 0.2862935, 0.05627648, 1, 1, 1, 1, 1,
-0.1399071, 1.458058, 1.188234, 1, 1, 1, 1, 1,
-0.1387081, 2.067272, 2.150587, 1, 1, 1, 1, 1,
-0.1381439, 1.168777, 0.6082255, 0, 0, 1, 1, 1,
-0.1381074, -1.137726, -3.651791, 1, 0, 0, 1, 1,
-0.1346799, -1.400882, -2.943651, 1, 0, 0, 1, 1,
-0.1343888, -0.5568955, -1.984574, 1, 0, 0, 1, 1,
-0.1325743, 0.2814215, 0.3043151, 1, 0, 0, 1, 1,
-0.1307716, 0.2207818, -2.315458, 1, 0, 0, 1, 1,
-0.1276567, -0.4845181, -5.21908, 0, 0, 0, 1, 1,
-0.1274283, 0.7148932, 1.488451, 0, 0, 0, 1, 1,
-0.126938, 0.5894207, 1.571364, 0, 0, 0, 1, 1,
-0.1257819, 0.3064524, -0.5837416, 0, 0, 0, 1, 1,
-0.1251315, -0.4207682, -2.87362, 0, 0, 0, 1, 1,
-0.1231841, 0.1672092, -2.991899, 0, 0, 0, 1, 1,
-0.1149312, -0.4545397, -3.600015, 0, 0, 0, 1, 1,
-0.1145609, -0.8701685, -1.824932, 1, 1, 1, 1, 1,
-0.1123748, -0.1883237, -4.761069, 1, 1, 1, 1, 1,
-0.1099443, -0.4228857, -4.309144, 1, 1, 1, 1, 1,
-0.1091294, -0.01881611, -1.18536, 1, 1, 1, 1, 1,
-0.1058378, 0.2452585, 0.9604578, 1, 1, 1, 1, 1,
-0.102671, 1.384244, -1.503102, 1, 1, 1, 1, 1,
-0.09967726, 1.631046, 1.022206, 1, 1, 1, 1, 1,
-0.09826525, -2.063642, -1.771928, 1, 1, 1, 1, 1,
-0.09815267, 2.419444, 0.1422953, 1, 1, 1, 1, 1,
-0.09664129, 0.3954354, 1.64369, 1, 1, 1, 1, 1,
-0.0963385, 0.2294136, 0.3290596, 1, 1, 1, 1, 1,
-0.09495153, 1.516787, -1.068509, 1, 1, 1, 1, 1,
-0.09446155, -1.356421, -2.467736, 1, 1, 1, 1, 1,
-0.09424736, 0.3733114, -0.2726863, 1, 1, 1, 1, 1,
-0.09343599, -0.2773306, -3.946661, 1, 1, 1, 1, 1,
-0.08929048, -0.5593274, -3.796042, 0, 0, 1, 1, 1,
-0.08715538, 0.1696422, 0.8396274, 1, 0, 0, 1, 1,
-0.08624474, 0.04685983, 0.03221127, 1, 0, 0, 1, 1,
-0.08340003, -2.292204, -4.294991, 1, 0, 0, 1, 1,
-0.08037516, 1.633911, -0.9357529, 1, 0, 0, 1, 1,
-0.07805631, 0.2749523, 3.075697, 1, 0, 0, 1, 1,
-0.07500108, 0.4970978, -2.352418, 0, 0, 0, 1, 1,
-0.07218177, -0.833834, -2.680809, 0, 0, 0, 1, 1,
-0.07165448, 0.3924878, 0.2819589, 0, 0, 0, 1, 1,
-0.06885726, -0.8850787, -0.7630354, 0, 0, 0, 1, 1,
-0.06782783, 0.4391994, -0.2971395, 0, 0, 0, 1, 1,
-0.06764449, -0.2275816, -1.440151, 0, 0, 0, 1, 1,
-0.06628285, -1.590727, -2.768007, 0, 0, 0, 1, 1,
-0.06169786, 0.2037654, 0.5105035, 1, 1, 1, 1, 1,
-0.06125942, 0.05131266, -1.285416, 1, 1, 1, 1, 1,
-0.05911898, 0.160385, -0.2587824, 1, 1, 1, 1, 1,
-0.05605993, 0.403721, -1.314069, 1, 1, 1, 1, 1,
-0.05598864, -0.2234925, -2.065371, 1, 1, 1, 1, 1,
-0.05530007, -0.9719462, -3.145812, 1, 1, 1, 1, 1,
-0.05365543, -1.229548, -3.706441, 1, 1, 1, 1, 1,
-0.04971901, -0.6982274, -2.504734, 1, 1, 1, 1, 1,
-0.0494401, -0.6690027, -2.086751, 1, 1, 1, 1, 1,
-0.04943711, 1.88759, 0.829605, 1, 1, 1, 1, 1,
-0.04799066, -1.643001, -1.895516, 1, 1, 1, 1, 1,
-0.04700447, 0.2091459, -0.1795179, 1, 1, 1, 1, 1,
-0.04545721, -0.2310827, -3.097491, 1, 1, 1, 1, 1,
-0.04272234, 1.03493, 0.1823239, 1, 1, 1, 1, 1,
-0.03936301, 0.5676184, 1.326568, 1, 1, 1, 1, 1,
-0.03908024, -0.5157449, -4.743207, 0, 0, 1, 1, 1,
-0.03109398, -1.533665, -2.3207, 1, 0, 0, 1, 1,
-0.03076149, 0.2204045, 0.6865969, 1, 0, 0, 1, 1,
-0.02665688, -0.122252, -2.483297, 1, 0, 0, 1, 1,
-0.01917643, 1.45698, 1.855444, 1, 0, 0, 1, 1,
-0.01757221, -1.543023, -3.149556, 1, 0, 0, 1, 1,
-0.01155444, 0.6625354, 1.561413, 0, 0, 0, 1, 1,
-0.008678935, 0.5566208, -0.3739335, 0, 0, 0, 1, 1,
-0.007623487, -0.1924584, -2.584709, 0, 0, 0, 1, 1,
-0.007183257, -0.4370408, -2.573883, 0, 0, 0, 1, 1,
0.00451903, 0.4602966, -0.02047541, 0, 0, 0, 1, 1,
0.009116347, -0.7855638, 4.153512, 0, 0, 0, 1, 1,
0.009188911, 0.3562779, -0.8595841, 0, 0, 0, 1, 1,
0.0098016, -0.1658044, 2.467213, 1, 1, 1, 1, 1,
0.01055126, 0.7040175, -0.03428017, 1, 1, 1, 1, 1,
0.01631473, 0.214287, 0.3183719, 1, 1, 1, 1, 1,
0.01684035, 0.3381298, 0.241074, 1, 1, 1, 1, 1,
0.01684907, 1.515819, 0.898319, 1, 1, 1, 1, 1,
0.01703683, -0.03514792, 3.278155, 1, 1, 1, 1, 1,
0.01791574, 0.6019844, 1.812105, 1, 1, 1, 1, 1,
0.01900584, 0.7429312, 1.70105, 1, 1, 1, 1, 1,
0.01992911, 1.162199, 0.04225932, 1, 1, 1, 1, 1,
0.02160599, -1.85226, 0.6654098, 1, 1, 1, 1, 1,
0.02326492, 1.364157, 0.06054443, 1, 1, 1, 1, 1,
0.02364785, 0.4421398, 0.9146994, 1, 1, 1, 1, 1,
0.02756342, -0.7682025, 2.850356, 1, 1, 1, 1, 1,
0.0292892, -0.6926551, 2.72133, 1, 1, 1, 1, 1,
0.03068473, 0.1472221, 0.8739304, 1, 1, 1, 1, 1,
0.03263028, -2.126297, 3.962224, 0, 0, 1, 1, 1,
0.03308706, -1.67407, 2.952779, 1, 0, 0, 1, 1,
0.04160094, -0.4746827, 4.795852, 1, 0, 0, 1, 1,
0.04330002, 0.3062645, 0.9761747, 1, 0, 0, 1, 1,
0.0484709, -0.9125844, 4.131062, 1, 0, 0, 1, 1,
0.04868758, 0.593284, 0.05523197, 1, 0, 0, 1, 1,
0.05318771, 0.6175361, 1.247318, 0, 0, 0, 1, 1,
0.05767352, 0.2401755, 0.3329041, 0, 0, 0, 1, 1,
0.06256668, -1.332957, 2.676628, 0, 0, 0, 1, 1,
0.06838893, 0.9114507, -0.3617869, 0, 0, 0, 1, 1,
0.06958615, 0.2319614, -0.3112999, 0, 0, 0, 1, 1,
0.0757267, 0.6923147, -0.8040081, 0, 0, 0, 1, 1,
0.07620053, 0.865773, -0.1279956, 0, 0, 0, 1, 1,
0.07884673, -1.791734, 1.716192, 1, 1, 1, 1, 1,
0.08042752, 0.1093201, -1.014418, 1, 1, 1, 1, 1,
0.08317489, 0.9297763, 0.430011, 1, 1, 1, 1, 1,
0.0963546, -0.433681, 1.808403, 1, 1, 1, 1, 1,
0.09698793, -1.264889, 2.585543, 1, 1, 1, 1, 1,
0.09839093, -0.4316736, 1.156208, 1, 1, 1, 1, 1,
0.1003674, -1.331874, 2.724552, 1, 1, 1, 1, 1,
0.1025221, 0.5523869, 0.772789, 1, 1, 1, 1, 1,
0.102868, -0.3618751, 1.39886, 1, 1, 1, 1, 1,
0.1061054, -1.350492, 3.850344, 1, 1, 1, 1, 1,
0.1081576, 0.4438703, 2.736915, 1, 1, 1, 1, 1,
0.1084061, -1.388333, 3.798631, 1, 1, 1, 1, 1,
0.113877, 1.191972, 0.6857401, 1, 1, 1, 1, 1,
0.120466, 0.188652, -0.03874013, 1, 1, 1, 1, 1,
0.1226656, 0.6636413, 0.8961951, 1, 1, 1, 1, 1,
0.1236669, -0.2125081, 3.978309, 0, 0, 1, 1, 1,
0.1246688, -0.5202222, 3.990622, 1, 0, 0, 1, 1,
0.1316047, 0.2714129, 1.149324, 1, 0, 0, 1, 1,
0.1337352, -0.2023182, 1.650967, 1, 0, 0, 1, 1,
0.1349328, -1.419818, 3.503812, 1, 0, 0, 1, 1,
0.1371314, 0.6923039, 0.4048335, 1, 0, 0, 1, 1,
0.1372316, -0.2350031, 2.02437, 0, 0, 0, 1, 1,
0.1418722, -2.086223, 3.023289, 0, 0, 0, 1, 1,
0.1428876, 0.8072187, -0.9423655, 0, 0, 0, 1, 1,
0.1431397, -0.589169, 0.6257167, 0, 0, 0, 1, 1,
0.147045, -0.8103741, 2.106848, 0, 0, 0, 1, 1,
0.1476417, 1.503732, 0.3983017, 0, 0, 0, 1, 1,
0.1509068, 0.7639362, 1.650051, 0, 0, 0, 1, 1,
0.158158, 1.320223, 0.2608553, 1, 1, 1, 1, 1,
0.1587391, -2.44756, 1.454061, 1, 1, 1, 1, 1,
0.1597926, -0.1322001, 1.966667, 1, 1, 1, 1, 1,
0.1638346, -0.06649193, 1.021669, 1, 1, 1, 1, 1,
0.165205, -1.64513, 4.294096, 1, 1, 1, 1, 1,
0.1683013, -0.0492227, 3.843694, 1, 1, 1, 1, 1,
0.1727028, 0.2985475, 0.3644099, 1, 1, 1, 1, 1,
0.1755116, -0.9670582, 3.998658, 1, 1, 1, 1, 1,
0.1795714, -1.277206, 3.647612, 1, 1, 1, 1, 1,
0.1874805, 0.343817, 2.379097, 1, 1, 1, 1, 1,
0.1875873, 0.07200749, 0.9054099, 1, 1, 1, 1, 1,
0.1891914, 0.5815976, 0.7235984, 1, 1, 1, 1, 1,
0.1899268, -0.448845, 2.431406, 1, 1, 1, 1, 1,
0.1912429, -0.4884988, 1.697552, 1, 1, 1, 1, 1,
0.1921669, -0.2135326, 2.084642, 1, 1, 1, 1, 1,
0.1936621, -0.1760663, 1.668814, 0, 0, 1, 1, 1,
0.1949524, -1.039244, 2.791902, 1, 0, 0, 1, 1,
0.2005365, 0.1472671, -0.1233472, 1, 0, 0, 1, 1,
0.204653, 0.1599718, 0.5319906, 1, 0, 0, 1, 1,
0.2056787, -1.615003, 3.552419, 1, 0, 0, 1, 1,
0.211694, 0.1562068, 0.380538, 1, 0, 0, 1, 1,
0.2148627, -0.05812792, 1.655384, 0, 0, 0, 1, 1,
0.2164189, 0.3187644, -0.1361059, 0, 0, 0, 1, 1,
0.2183063, -0.9572564, 2.474665, 0, 0, 0, 1, 1,
0.2197344, -1.881605, 3.129462, 0, 0, 0, 1, 1,
0.2205963, -0.1741295, 2.557938, 0, 0, 0, 1, 1,
0.2206487, 0.5382328, -0.4995787, 0, 0, 0, 1, 1,
0.2239364, 0.783107, 0.2622453, 0, 0, 0, 1, 1,
0.2269383, -0.9239725, 2.063901, 1, 1, 1, 1, 1,
0.2329293, 0.5379215, 0.08308103, 1, 1, 1, 1, 1,
0.2341378, 0.3480381, 1.429652, 1, 1, 1, 1, 1,
0.2370715, 0.5253516, 0.273323, 1, 1, 1, 1, 1,
0.2388174, -2.561581, 2.307036, 1, 1, 1, 1, 1,
0.2401417, 0.6413809, -1.519606, 1, 1, 1, 1, 1,
0.2416174, -1.748914, 2.961963, 1, 1, 1, 1, 1,
0.2432574, -1.409774, 3.462857, 1, 1, 1, 1, 1,
0.2445963, -0.04166853, 0.5929245, 1, 1, 1, 1, 1,
0.2553278, 0.4097458, 0.2817648, 1, 1, 1, 1, 1,
0.256819, -0.3674839, 1.629394, 1, 1, 1, 1, 1,
0.2568762, 0.8259355, 1.263623, 1, 1, 1, 1, 1,
0.2629288, 1.739521, -0.2906332, 1, 1, 1, 1, 1,
0.270715, -0.3463326, 2.643668, 1, 1, 1, 1, 1,
0.2737328, 0.4112688, -0.5194823, 1, 1, 1, 1, 1,
0.2788872, 1.086925, -0.1933975, 0, 0, 1, 1, 1,
0.282884, -0.5173111, 0.2702959, 1, 0, 0, 1, 1,
0.2881169, 0.9448703, -0.03370395, 1, 0, 0, 1, 1,
0.2894628, 0.2694659, 0.91536, 1, 0, 0, 1, 1,
0.2903782, -0.7568037, 1.969788, 1, 0, 0, 1, 1,
0.2941715, -0.4739763, 1.247199, 1, 0, 0, 1, 1,
0.2950885, 0.4932615, 0.8506176, 0, 0, 0, 1, 1,
0.2970434, 0.1048993, 2.060545, 0, 0, 0, 1, 1,
0.297394, 1.230443, 1.969422, 0, 0, 0, 1, 1,
0.2982506, -0.6989886, 1.828577, 0, 0, 0, 1, 1,
0.2991896, 1.582817, -0.2439167, 0, 0, 0, 1, 1,
0.2997349, -2.436359, 3.729154, 0, 0, 0, 1, 1,
0.3000964, 0.08608439, 1.096456, 0, 0, 0, 1, 1,
0.302231, -0.02625532, 0.9541972, 1, 1, 1, 1, 1,
0.3053959, 0.3743773, 2.773406, 1, 1, 1, 1, 1,
0.3082242, 0.5442654, 1.423288, 1, 1, 1, 1, 1,
0.3092556, -2.068775, 2.6649, 1, 1, 1, 1, 1,
0.3101645, 0.3705197, -1.429864, 1, 1, 1, 1, 1,
0.3148814, 0.5117454, 1.094276, 1, 1, 1, 1, 1,
0.3153577, 0.862507, 0.7486367, 1, 1, 1, 1, 1,
0.3227193, -0.2866055, 2.13542, 1, 1, 1, 1, 1,
0.3233823, -1.480729, 3.441548, 1, 1, 1, 1, 1,
0.3241549, 0.4993457, -0.4474397, 1, 1, 1, 1, 1,
0.3260967, -0.2488982, 2.117378, 1, 1, 1, 1, 1,
0.3321888, 0.3422317, 0.2606158, 1, 1, 1, 1, 1,
0.3344329, 1.558589, -0.4028876, 1, 1, 1, 1, 1,
0.3371045, 0.129693, 0.8894873, 1, 1, 1, 1, 1,
0.337926, 1.276961, 0.5826573, 1, 1, 1, 1, 1,
0.3380735, -1.114201, 1.418396, 0, 0, 1, 1, 1,
0.338878, 0.8598341, 0.8752968, 1, 0, 0, 1, 1,
0.338993, 0.6036181, -0.01128645, 1, 0, 0, 1, 1,
0.3408178, 0.5241614, 2.675125, 1, 0, 0, 1, 1,
0.3422347, 0.5243907, 0.678189, 1, 0, 0, 1, 1,
0.3463784, 0.4356232, -0.4211828, 1, 0, 0, 1, 1,
0.3483842, 1.090065, -0.82309, 0, 0, 0, 1, 1,
0.355761, 0.5727229, 1.113151, 0, 0, 0, 1, 1,
0.3595361, -1.210293, 3.380957, 0, 0, 0, 1, 1,
0.3648846, 1.098119, 1.03088, 0, 0, 0, 1, 1,
0.3661862, -0.8220522, 2.556464, 0, 0, 0, 1, 1,
0.3663386, -0.9360037, 3.10364, 0, 0, 0, 1, 1,
0.3665602, 1.186895, -0.7632418, 0, 0, 0, 1, 1,
0.3666862, 0.7659653, 0.4550164, 1, 1, 1, 1, 1,
0.3677141, 0.1226914, 1.57546, 1, 1, 1, 1, 1,
0.3680491, 0.370855, -0.007513701, 1, 1, 1, 1, 1,
0.3769422, -0.7839507, 3.191205, 1, 1, 1, 1, 1,
0.3772541, -0.5238187, 3.484578, 1, 1, 1, 1, 1,
0.3782701, 0.5398041, -0.3481183, 1, 1, 1, 1, 1,
0.3832143, -1.211662, 3.92959, 1, 1, 1, 1, 1,
0.3897828, 0.8010534, 0.5959831, 1, 1, 1, 1, 1,
0.3915075, 1.755887, 0.3554972, 1, 1, 1, 1, 1,
0.39222, 0.7915125, 0.7709482, 1, 1, 1, 1, 1,
0.3960232, -0.4372935, 4.352523, 1, 1, 1, 1, 1,
0.3965862, -0.4149944, 2.026261, 1, 1, 1, 1, 1,
0.4011919, 0.5457476, 3.121571, 1, 1, 1, 1, 1,
0.4017648, -1.240622, 2.337478, 1, 1, 1, 1, 1,
0.4028956, 0.6287459, -0.1404439, 1, 1, 1, 1, 1,
0.4041916, -1.033257, 3.954598, 0, 0, 1, 1, 1,
0.4127152, 0.4007092, 1.092786, 1, 0, 0, 1, 1,
0.4127514, -1.968861, 3.224359, 1, 0, 0, 1, 1,
0.4135945, 1.658026, 1.166573, 1, 0, 0, 1, 1,
0.4150604, 0.5225623, 0.8006494, 1, 0, 0, 1, 1,
0.4152665, -1.287668, 3.033735, 1, 0, 0, 1, 1,
0.4153284, 0.927014, -0.09528464, 0, 0, 0, 1, 1,
0.4183471, -1.247263, 1.362152, 0, 0, 0, 1, 1,
0.4220627, 0.2655578, 0.1189581, 0, 0, 0, 1, 1,
0.4276981, 0.6484967, -0.82579, 0, 0, 0, 1, 1,
0.4305029, 1.000672, 0.04523836, 0, 0, 0, 1, 1,
0.4336294, 0.4972548, 0.5021679, 0, 0, 0, 1, 1,
0.4391389, 0.4457938, 1.455992, 0, 0, 0, 1, 1,
0.439719, 1.131963, -1.030875, 1, 1, 1, 1, 1,
0.4487814, -0.08112734, 2.112275, 1, 1, 1, 1, 1,
0.4510914, 0.5370267, 0.9272022, 1, 1, 1, 1, 1,
0.4587139, 0.3316701, 1.360713, 1, 1, 1, 1, 1,
0.4605254, 0.07781512, 0.3151252, 1, 1, 1, 1, 1,
0.4638948, -0.3585124, -0.02652576, 1, 1, 1, 1, 1,
0.4645304, -0.05046796, 2.615219, 1, 1, 1, 1, 1,
0.4675182, -0.9199487, 3.177418, 1, 1, 1, 1, 1,
0.4716627, -0.8741634, 3.392103, 1, 1, 1, 1, 1,
0.486989, -1.325712, 1.204587, 1, 1, 1, 1, 1,
0.4935607, 0.4165473, 0.799508, 1, 1, 1, 1, 1,
0.4957961, 1.145834, 1.827638, 1, 1, 1, 1, 1,
0.4968107, 0.7576264, -0.5490632, 1, 1, 1, 1, 1,
0.5029743, -0.6860093, 2.957938, 1, 1, 1, 1, 1,
0.5045477, 0.02972702, 2.302364, 1, 1, 1, 1, 1,
0.5078373, -0.6452483, 2.46707, 0, 0, 1, 1, 1,
0.5136696, 0.6354102, 1.485169, 1, 0, 0, 1, 1,
0.5142753, 0.2405375, 2.88481, 1, 0, 0, 1, 1,
0.5172057, -1.96187, 3.671615, 1, 0, 0, 1, 1,
0.5296981, 0.1068513, 1.129004, 1, 0, 0, 1, 1,
0.5297616, -0.2144097, 2.821488, 1, 0, 0, 1, 1,
0.5311717, -1.659657, 2.698462, 0, 0, 0, 1, 1,
0.5319458, 0.9581129, 0.2252924, 0, 0, 0, 1, 1,
0.5348766, -0.3306286, 1.677862, 0, 0, 0, 1, 1,
0.5511085, 0.197967, 0.9997321, 0, 0, 0, 1, 1,
0.5537268, 0.518234, 0.1769574, 0, 0, 0, 1, 1,
0.554489, 0.05937155, 0.6956729, 0, 0, 0, 1, 1,
0.5559697, -0.2074399, 2.98509, 0, 0, 0, 1, 1,
0.5560118, -1.512681, 2.799261, 1, 1, 1, 1, 1,
0.5586708, 0.7342427, 1.330016, 1, 1, 1, 1, 1,
0.566048, -0.6287334, 2.036784, 1, 1, 1, 1, 1,
0.5671518, -0.7684789, 3.40064, 1, 1, 1, 1, 1,
0.5687109, -1.672281, 3.383809, 1, 1, 1, 1, 1,
0.5702109, 0.09091949, 1.520711, 1, 1, 1, 1, 1,
0.5705686, -0.774789, 1.563059, 1, 1, 1, 1, 1,
0.573243, 1.707067, -0.4620865, 1, 1, 1, 1, 1,
0.5776557, -1.086768, 1.850771, 1, 1, 1, 1, 1,
0.5798908, -2.505108, 2.21563, 1, 1, 1, 1, 1,
0.5804231, 0.6044309, 1.872835, 1, 1, 1, 1, 1,
0.5830871, 1.025332, 0.08479284, 1, 1, 1, 1, 1,
0.586159, 0.8773474, 0.08251075, 1, 1, 1, 1, 1,
0.5911301, -0.6525095, 3.82778, 1, 1, 1, 1, 1,
0.5970173, -1.007407, 3.331669, 1, 1, 1, 1, 1,
0.5998218, 1.211651, 1.199806, 0, 0, 1, 1, 1,
0.600593, -1.459505, 2.676026, 1, 0, 0, 1, 1,
0.6016864, 0.6394251, -0.6138221, 1, 0, 0, 1, 1,
0.6034598, -0.3814215, 2.649414, 1, 0, 0, 1, 1,
0.6043175, 0.2756208, 0.3530984, 1, 0, 0, 1, 1,
0.6044831, -1.476051, 2.136336, 1, 0, 0, 1, 1,
0.6082711, 0.3849932, 1.026518, 0, 0, 0, 1, 1,
0.6100107, -0.2983743, 3.003769, 0, 0, 0, 1, 1,
0.6128719, 0.3156854, 0.7733721, 0, 0, 0, 1, 1,
0.6141813, 1.333953, 0.7500435, 0, 0, 0, 1, 1,
0.6165503, -0.293392, 0.8196805, 0, 0, 0, 1, 1,
0.6166525, 0.1153567, 0.7002525, 0, 0, 0, 1, 1,
0.6234914, 0.306155, 0.5055898, 0, 0, 0, 1, 1,
0.6249387, 1.663704, -1.866328, 1, 1, 1, 1, 1,
0.6251633, 0.6520067, 1.459718, 1, 1, 1, 1, 1,
0.6264969, -0.2772656, 2.101328, 1, 1, 1, 1, 1,
0.6266697, -2.145478, 2.78516, 1, 1, 1, 1, 1,
0.6278499, 1.397382, 0.8255019, 1, 1, 1, 1, 1,
0.6312442, 1.483218, 2.576619, 1, 1, 1, 1, 1,
0.639316, -0.8285552, 0.9614616, 1, 1, 1, 1, 1,
0.6433423, -1.630158, 4.071825, 1, 1, 1, 1, 1,
0.6504214, -0.6935776, 3.432135, 1, 1, 1, 1, 1,
0.652977, -0.5589346, 2.089832, 1, 1, 1, 1, 1,
0.6548567, -0.6162729, 2.923817, 1, 1, 1, 1, 1,
0.6784003, 0.3568999, 1.621644, 1, 1, 1, 1, 1,
0.6878616, -0.255454, -0.09390186, 1, 1, 1, 1, 1,
0.6892601, 0.2509497, 0.4241459, 1, 1, 1, 1, 1,
0.6922157, -1.422384, 3.448613, 1, 1, 1, 1, 1,
0.7094143, -1.003621, 2.129327, 0, 0, 1, 1, 1,
0.7105508, -0.8237761, 2.307022, 1, 0, 0, 1, 1,
0.7120941, -0.5309625, 0.9347561, 1, 0, 0, 1, 1,
0.7149, 1.614242, -0.8306211, 1, 0, 0, 1, 1,
0.7169697, -0.4449009, 1.391998, 1, 0, 0, 1, 1,
0.7252223, -2.082861, 2.513736, 1, 0, 0, 1, 1,
0.7256587, 1.102799, 2.306173, 0, 0, 0, 1, 1,
0.7259828, -1.063388, 2.779781, 0, 0, 0, 1, 1,
0.7287702, 0.7113479, 0.7774619, 0, 0, 0, 1, 1,
0.7325636, 0.2102269, 0.4571674, 0, 0, 0, 1, 1,
0.7405596, -0.3192899, 3.791958, 0, 0, 0, 1, 1,
0.7416409, -1.356072, 2.684886, 0, 0, 0, 1, 1,
0.7493682, 0.8091459, 0.9884126, 0, 0, 0, 1, 1,
0.7494099, 0.7908601, 0.3429307, 1, 1, 1, 1, 1,
0.7520975, 0.1202634, 2.443305, 1, 1, 1, 1, 1,
0.7534963, -0.8844157, 2.769865, 1, 1, 1, 1, 1,
0.7540705, 1.665614, -1.647667, 1, 1, 1, 1, 1,
0.7587044, 0.5014145, 2.154805, 1, 1, 1, 1, 1,
0.7607203, -0.9766394, 3.573, 1, 1, 1, 1, 1,
0.7616499, 0.6567013, 0.9732763, 1, 1, 1, 1, 1,
0.7660252, -0.2857976, 2.473904, 1, 1, 1, 1, 1,
0.7688482, 0.7998301, -0.08748294, 1, 1, 1, 1, 1,
0.7718996, -0.5026155, 1.890647, 1, 1, 1, 1, 1,
0.7732607, -1.474505, 3.682043, 1, 1, 1, 1, 1,
0.7733219, 0.5212641, 2.522358, 1, 1, 1, 1, 1,
0.7804751, -0.1023353, -0.4260176, 1, 1, 1, 1, 1,
0.782041, -0.5758837, 3.537758, 1, 1, 1, 1, 1,
0.7827915, -0.5501881, 4.683363, 1, 1, 1, 1, 1,
0.7938689, 0.1981499, 3.148054, 0, 0, 1, 1, 1,
0.796183, 0.01536086, 0.2617469, 1, 0, 0, 1, 1,
0.79804, 1.613164, -0.1044049, 1, 0, 0, 1, 1,
0.8021464, 0.7032453, 0.5329846, 1, 0, 0, 1, 1,
0.814326, 0.1176025, 1.347417, 1, 0, 0, 1, 1,
0.8176455, 2.934725, 0.7036965, 1, 0, 0, 1, 1,
0.818035, -0.2101611, 2.890187, 0, 0, 0, 1, 1,
0.8208492, -1.603243, 1.860807, 0, 0, 0, 1, 1,
0.8310785, -0.4983988, 0.6576404, 0, 0, 0, 1, 1,
0.8332291, -2.040169, 1.599807, 0, 0, 0, 1, 1,
0.8405823, 0.441141, 1.858694, 0, 0, 0, 1, 1,
0.8412993, 0.4574102, 2.330722, 0, 0, 0, 1, 1,
0.8435555, 0.9112325, 0.2200418, 0, 0, 0, 1, 1,
0.8447932, 0.3131623, 1.921223, 1, 1, 1, 1, 1,
0.8454118, 0.2304687, 2.097738, 1, 1, 1, 1, 1,
0.8570219, 0.8905231, 0.614989, 1, 1, 1, 1, 1,
0.8594385, -0.8725262, 1.736118, 1, 1, 1, 1, 1,
0.8624139, -0.3231807, -0.2845204, 1, 1, 1, 1, 1,
0.8674667, -0.6256876, 3.08907, 1, 1, 1, 1, 1,
0.8685566, 0.8260126, 0.85581, 1, 1, 1, 1, 1,
0.877022, -1.273321, 3.769786, 1, 1, 1, 1, 1,
0.8828709, 0.6940597, 1.669326, 1, 1, 1, 1, 1,
0.8880994, 0.04123823, 1.882184, 1, 1, 1, 1, 1,
0.8883299, 0.2123761, 1.290799, 1, 1, 1, 1, 1,
0.888772, 0.850948, 1.23112, 1, 1, 1, 1, 1,
0.8927686, -1.519328, 0.2220019, 1, 1, 1, 1, 1,
0.8960392, 0.6293077, 0.1549395, 1, 1, 1, 1, 1,
0.8972965, -1.551364, 3.905192, 1, 1, 1, 1, 1,
0.8981651, -0.7676439, 2.73513, 0, 0, 1, 1, 1,
0.8983595, 0.1518024, 0.3922377, 1, 0, 0, 1, 1,
0.9028087, -1.918944, 1.500247, 1, 0, 0, 1, 1,
0.9091394, 1.133029, 0.1999879, 1, 0, 0, 1, 1,
0.9109339, -0.5126424, 1.981689, 1, 0, 0, 1, 1,
0.9111708, -1.742744, 4.477093, 1, 0, 0, 1, 1,
0.9130456, -0.1121596, 3.278612, 0, 0, 0, 1, 1,
0.9291949, -0.1688692, -0.4163367, 0, 0, 0, 1, 1,
0.9308057, 0.7307082, 2.750006, 0, 0, 0, 1, 1,
0.9342133, -0.3907388, 1.428703, 0, 0, 0, 1, 1,
0.9379221, 0.3259561, 0.8777224, 0, 0, 0, 1, 1,
0.9399545, -0.6972631, 0.6737278, 0, 0, 0, 1, 1,
0.9446747, 1.451451, 2.428989, 0, 0, 0, 1, 1,
0.9460987, -0.07999071, 2.015099, 1, 1, 1, 1, 1,
0.9517792, -0.2406684, 1.500547, 1, 1, 1, 1, 1,
0.9527493, -0.2985273, 1.690977, 1, 1, 1, 1, 1,
0.9593661, 0.07104094, 1.936201, 1, 1, 1, 1, 1,
0.9647183, -0.6851496, 1.104477, 1, 1, 1, 1, 1,
0.9679799, -1.872583, 4.755247, 1, 1, 1, 1, 1,
0.9681938, -0.168126, 0.5000982, 1, 1, 1, 1, 1,
0.9695768, -0.7182134, 3.082886, 1, 1, 1, 1, 1,
0.9712582, 0.08487979, 1.07911, 1, 1, 1, 1, 1,
0.9761041, 1.085527, 0.6340108, 1, 1, 1, 1, 1,
0.9784096, 0.3217978, 3.100034, 1, 1, 1, 1, 1,
0.9834296, 0.5344495, 0.2712696, 1, 1, 1, 1, 1,
0.9850733, -1.813138, 3.75846, 1, 1, 1, 1, 1,
0.9872073, 0.1359564, 1.199018, 1, 1, 1, 1, 1,
0.9914647, 0.8204536, 2.03635, 1, 1, 1, 1, 1,
0.9936653, -0.4892354, 4.031421, 0, 0, 1, 1, 1,
1.003791, 1.36275, 0.08217636, 1, 0, 0, 1, 1,
1.00846, -0.5549514, 5.433487, 1, 0, 0, 1, 1,
1.012631, 1.518063, 0.8421227, 1, 0, 0, 1, 1,
1.017628, 0.7615609, -0.5454046, 1, 0, 0, 1, 1,
1.027463, 1.631353, 1.283135, 1, 0, 0, 1, 1,
1.028046, -0.7144264, 3.4821, 0, 0, 0, 1, 1,
1.04042, -1.228229, 0.7687123, 0, 0, 0, 1, 1,
1.041892, 1.4192, 0.5620081, 0, 0, 0, 1, 1,
1.048243, 1.50616, 0.1721295, 0, 0, 0, 1, 1,
1.048553, -1.859412, 2.126613, 0, 0, 0, 1, 1,
1.050232, -0.7940803, 4.860783, 0, 0, 0, 1, 1,
1.061285, -0.6599025, 2.98838, 0, 0, 0, 1, 1,
1.0671, -0.1819543, 1.932155, 1, 1, 1, 1, 1,
1.070107, -0.1877996, 0.229408, 1, 1, 1, 1, 1,
1.072733, 0.4645455, -0.6492495, 1, 1, 1, 1, 1,
1.091333, -0.3956927, 1.494277, 1, 1, 1, 1, 1,
1.10217, -1.579129, 3.333821, 1, 1, 1, 1, 1,
1.103788, 2.607853, 1.256916, 1, 1, 1, 1, 1,
1.109709, -0.6806511, 2.144982, 1, 1, 1, 1, 1,
1.114639, 1.006075, 0.9843333, 1, 1, 1, 1, 1,
1.115706, -0.6905146, 0.6175292, 1, 1, 1, 1, 1,
1.115823, 0.936024, 1.98771, 1, 1, 1, 1, 1,
1.116981, 0.4549786, 0.306278, 1, 1, 1, 1, 1,
1.120066, 0.8854631, 0.7050408, 1, 1, 1, 1, 1,
1.12182, -2.510765, 2.217792, 1, 1, 1, 1, 1,
1.124667, -0.6473587, 2.233744, 1, 1, 1, 1, 1,
1.125662, -0.4895806, 1.112845, 1, 1, 1, 1, 1,
1.129927, -0.3057234, 3.004272, 0, 0, 1, 1, 1,
1.130832, -0.549763, 1.844011, 1, 0, 0, 1, 1,
1.134715, -0.4771432, 2.159699, 1, 0, 0, 1, 1,
1.140734, -2.188914, 3.51846, 1, 0, 0, 1, 1,
1.150808, -1.118465, 2.522231, 1, 0, 0, 1, 1,
1.157279, 0.1379468, 2.115596, 1, 0, 0, 1, 1,
1.159189, -0.7849979, 2.702982, 0, 0, 0, 1, 1,
1.165093, 1.274442, 0.2537793, 0, 0, 0, 1, 1,
1.17748, 0.1170005, 3.741154, 0, 0, 0, 1, 1,
1.189563, 0.1451018, -1.341169, 0, 0, 0, 1, 1,
1.194065, 1.67029, 1.721367, 0, 0, 0, 1, 1,
1.205019, 0.3019955, 2.246901, 0, 0, 0, 1, 1,
1.219955, -1.024205, 5.092612, 0, 0, 0, 1, 1,
1.221359, 1.595832, 1.459623, 1, 1, 1, 1, 1,
1.224804, -0.04575297, 0.6276413, 1, 1, 1, 1, 1,
1.245276, 1.089093, -0.2549004, 1, 1, 1, 1, 1,
1.248101, 1.412891, 0.1384397, 1, 1, 1, 1, 1,
1.249023, -0.4902115, 1.70695, 1, 1, 1, 1, 1,
1.260818, -0.6281393, 2.830182, 1, 1, 1, 1, 1,
1.270842, -1.477752, 3.679026, 1, 1, 1, 1, 1,
1.275967, -0.7691921, 2.561206, 1, 1, 1, 1, 1,
1.279798, 0.1516116, 2.661101, 1, 1, 1, 1, 1,
1.293731, 0.6633648, 0.7493785, 1, 1, 1, 1, 1,
1.307341, 1.12682, 0.894024, 1, 1, 1, 1, 1,
1.3083, -1.247312, 4.238437, 1, 1, 1, 1, 1,
1.308997, 1.269149, 0.419149, 1, 1, 1, 1, 1,
1.310028, 0.6161569, 2.852612, 1, 1, 1, 1, 1,
1.316871, 1.9148, 1.719573, 1, 1, 1, 1, 1,
1.324872, -1.043634, 3.001947, 0, 0, 1, 1, 1,
1.328404, -0.9723618, 2.733027, 1, 0, 0, 1, 1,
1.33078, -0.5625247, 2.465215, 1, 0, 0, 1, 1,
1.332795, 0.2799811, 0.9192503, 1, 0, 0, 1, 1,
1.337832, 1.508947, -0.2584185, 1, 0, 0, 1, 1,
1.340134, 1.120372, 1.178595, 1, 0, 0, 1, 1,
1.341481, 0.9012411, 0.4281875, 0, 0, 0, 1, 1,
1.342747, 0.3378458, 1.975785, 0, 0, 0, 1, 1,
1.347878, 0.06894565, 2.722089, 0, 0, 0, 1, 1,
1.351283, -1.174999, 2.182766, 0, 0, 0, 1, 1,
1.3516, 0.8177078, 0.9540385, 0, 0, 0, 1, 1,
1.356349, -1.098035, 0.07536481, 0, 0, 0, 1, 1,
1.361082, 0.3857999, 1.172037, 0, 0, 0, 1, 1,
1.379101, 0.3290688, 1.47825, 1, 1, 1, 1, 1,
1.385373, -0.1753518, 2.934479, 1, 1, 1, 1, 1,
1.387581, -1.287524, 2.915705, 1, 1, 1, 1, 1,
1.39276, 0.1162847, 1.215152, 1, 1, 1, 1, 1,
1.394583, 0.1877183, -0.9213726, 1, 1, 1, 1, 1,
1.422066, -1.456105, 1.14411, 1, 1, 1, 1, 1,
1.425646, 0.826124, -0.8309063, 1, 1, 1, 1, 1,
1.431375, 0.05748498, 0.2552731, 1, 1, 1, 1, 1,
1.448887, -1.258191, 2.434243, 1, 1, 1, 1, 1,
1.450833, 0.7262534, 0.1819435, 1, 1, 1, 1, 1,
1.450964, -0.3992759, 2.092498, 1, 1, 1, 1, 1,
1.453416, 0.7452968, 0.9094997, 1, 1, 1, 1, 1,
1.456284, 1.356764, 1.266036, 1, 1, 1, 1, 1,
1.474248, 1.110313, 2.526954, 1, 1, 1, 1, 1,
1.484715, -0.1213874, 2.895165, 1, 1, 1, 1, 1,
1.486087, 0.259476, 1.075264, 0, 0, 1, 1, 1,
1.48903, 0.1935423, 1.696609, 1, 0, 0, 1, 1,
1.494377, -0.6110917, 1.825444, 1, 0, 0, 1, 1,
1.521191, -1.42754, 1.501533, 1, 0, 0, 1, 1,
1.521667, 2.5547, 0.08185761, 1, 0, 0, 1, 1,
1.538498, -0.9443327, 2.974037, 1, 0, 0, 1, 1,
1.544688, 0.3278752, 2.053583, 0, 0, 0, 1, 1,
1.545534, 0.835541, 1.461736, 0, 0, 0, 1, 1,
1.552078, -0.8192803, 3.331084, 0, 0, 0, 1, 1,
1.555774, -1.610235, 3.728527, 0, 0, 0, 1, 1,
1.570497, 0.8729352, -0.1488451, 0, 0, 0, 1, 1,
1.570827, 0.9642515, 2.410957, 0, 0, 0, 1, 1,
1.576199, -1.34108, 3.218557, 0, 0, 0, 1, 1,
1.579155, 1.063948, 0.3195581, 1, 1, 1, 1, 1,
1.599586, 0.7436084, 1.174983, 1, 1, 1, 1, 1,
1.604259, 0.5984672, 1.71453, 1, 1, 1, 1, 1,
1.609761, 0.851405, 1.155728, 1, 1, 1, 1, 1,
1.613929, 0.8176153, 2.892121, 1, 1, 1, 1, 1,
1.614295, -0.827507, 1.573256, 1, 1, 1, 1, 1,
1.620306, 0.4244851, 0.3556961, 1, 1, 1, 1, 1,
1.638531, 0.3286595, 2.283467, 1, 1, 1, 1, 1,
1.644139, -0.6859564, 5.039195, 1, 1, 1, 1, 1,
1.652081, 0.641218, 1.269184, 1, 1, 1, 1, 1,
1.663056, -1.159606, 2.461728, 1, 1, 1, 1, 1,
1.663605, 0.2695763, 2.4, 1, 1, 1, 1, 1,
1.668794, -1.196014, 2.227332, 1, 1, 1, 1, 1,
1.683254, 0.187558, 1.700206, 1, 1, 1, 1, 1,
1.702157, 0.9974638, 0.2812443, 1, 1, 1, 1, 1,
1.736613, 0.06745499, 1.616407, 0, 0, 1, 1, 1,
1.737234, 0.06904693, 0.5262824, 1, 0, 0, 1, 1,
1.75874, -0.09891797, 2.687971, 1, 0, 0, 1, 1,
1.764881, -1.070627, 1.406855, 1, 0, 0, 1, 1,
1.795656, 0.8743545, 2.56055, 1, 0, 0, 1, 1,
1.817352, -0.5405946, 1.757846, 1, 0, 0, 1, 1,
1.841675, 2.021995, -2.202643, 0, 0, 0, 1, 1,
1.853494, 0.2463445, 2.240396, 0, 0, 0, 1, 1,
1.855934, 1.917459, -0.4580351, 0, 0, 0, 1, 1,
1.857418, 0.9726944, 0.8110493, 0, 0, 0, 1, 1,
1.875996, 0.4702387, -0.3147427, 0, 0, 0, 1, 1,
1.882933, -0.5032742, 3.474137, 0, 0, 0, 1, 1,
1.887664, -1.209422, 2.223245, 0, 0, 0, 1, 1,
1.889106, -0.3376517, 2.700394, 1, 1, 1, 1, 1,
1.89258, -0.06266566, 0.2442872, 1, 1, 1, 1, 1,
1.912652, -0.7897947, 2.83226, 1, 1, 1, 1, 1,
1.941877, -0.3241855, 0.7411749, 1, 1, 1, 1, 1,
1.992869, -0.2881471, 1.905228, 1, 1, 1, 1, 1,
1.99359, 1.183829, 1.727278, 1, 1, 1, 1, 1,
2.010601, 0.9366314, 2.16502, 1, 1, 1, 1, 1,
2.02324, 0.7168286, 0.1142346, 1, 1, 1, 1, 1,
2.029522, 1.950262, -0.4795488, 1, 1, 1, 1, 1,
2.039875, -0.1589613, -0.5633036, 1, 1, 1, 1, 1,
2.056965, -2.009403, 2.983837, 1, 1, 1, 1, 1,
2.077777, 1.443255, 1.27902, 1, 1, 1, 1, 1,
2.086519, 0.1178047, 0.6191348, 1, 1, 1, 1, 1,
2.089976, 0.3271963, 0.5777845, 1, 1, 1, 1, 1,
2.101687, -0.5701438, 1.68125, 1, 1, 1, 1, 1,
2.106595, 1.129072, 1.947567, 0, 0, 1, 1, 1,
2.140508, 2.018922, 1.793628, 1, 0, 0, 1, 1,
2.147413, -0.6671454, 1.904065, 1, 0, 0, 1, 1,
2.14975, 1.173273, 1.461913, 1, 0, 0, 1, 1,
2.197186, -0.9274604, 1.932998, 1, 0, 0, 1, 1,
2.198479, -1.664708, 2.320423, 1, 0, 0, 1, 1,
2.201712, 0.5377805, 0.6868556, 0, 0, 0, 1, 1,
2.20545, 0.0210896, -0.3639595, 0, 0, 0, 1, 1,
2.214927, 0.7990835, 1.862215, 0, 0, 0, 1, 1,
2.230804, -0.6880352, 1.36696, 0, 0, 0, 1, 1,
2.274097, 1.359732, 1.857096, 0, 0, 0, 1, 1,
2.304515, -1.212262, 3.786937, 0, 0, 0, 1, 1,
2.326052, 0.5610409, -0.1988624, 0, 0, 0, 1, 1,
2.344319, -0.3456271, 1.912511, 1, 1, 1, 1, 1,
2.487328, -0.5218688, 2.89414, 1, 1, 1, 1, 1,
2.559127, 0.5776839, 0.7305094, 1, 1, 1, 1, 1,
2.618679, 0.5165789, 0.8864049, 1, 1, 1, 1, 1,
2.650668, -1.857731, 1.149934, 1, 1, 1, 1, 1,
3.07147, 0.2704798, 1.000723, 1, 1, 1, 1, 1,
3.535351, -0.7162974, 1.610255, 1, 1, 1, 1, 1
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
var radius = 9.761828;
var distance = 34.28801;
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
mvMatrix.translate( -0.3753562, -0.1225677, 0.1412575 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.28801);
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