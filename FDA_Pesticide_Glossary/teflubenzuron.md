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
-3.442332, 1.270829, -1.448455, 1, 0, 0, 1,
-3.25545, 1.602047, 0.3965303, 1, 0.007843138, 0, 1,
-3.076017, -0.2806342, -2.105505, 1, 0.01176471, 0, 1,
-2.548498, 0.6613923, -0.5284443, 1, 0.01960784, 0, 1,
-2.517036, -0.9841371, -2.264861, 1, 0.02352941, 0, 1,
-2.492895, -0.5252184, -2.639451, 1, 0.03137255, 0, 1,
-2.480699, 0.299878, -0.133742, 1, 0.03529412, 0, 1,
-2.478024, 0.672995, -1.395222, 1, 0.04313726, 0, 1,
-2.421078, -0.2411429, -1.902957, 1, 0.04705882, 0, 1,
-2.408571, -1.099483, 0.08524092, 1, 0.05490196, 0, 1,
-2.364059, 1.057148, -2.002759, 1, 0.05882353, 0, 1,
-2.330521, -0.1750576, -0.5825043, 1, 0.06666667, 0, 1,
-2.27553, -1.055583, -2.076066, 1, 0.07058824, 0, 1,
-2.211676, -0.423698, -2.014505, 1, 0.07843138, 0, 1,
-2.171689, 0.8800176, -1.389742, 1, 0.08235294, 0, 1,
-2.149103, 0.190736, -1.151535, 1, 0.09019608, 0, 1,
-2.120533, -2.601429, -1.041069, 1, 0.09411765, 0, 1,
-2.091514, -1.588628, -0.3627676, 1, 0.1019608, 0, 1,
-2.058449, -3.308748, -2.780027, 1, 0.1098039, 0, 1,
-2.050174, 0.4402955, -0.8978793, 1, 0.1137255, 0, 1,
-2.02742, 0.4374245, -2.150013, 1, 0.1215686, 0, 1,
-1.987604, 0.238116, -0.2187071, 1, 0.1254902, 0, 1,
-1.983117, -0.1375937, -0.9188603, 1, 0.1333333, 0, 1,
-1.963838, -0.5443687, -0.7632968, 1, 0.1372549, 0, 1,
-1.924452, 0.7055586, -0.8564768, 1, 0.145098, 0, 1,
-1.922643, 1.061139, -1.264247, 1, 0.1490196, 0, 1,
-1.915599, -1.63503, -2.417857, 1, 0.1568628, 0, 1,
-1.912586, 0.2682162, -3.585843, 1, 0.1607843, 0, 1,
-1.894147, -1.215501, -0.8266154, 1, 0.1686275, 0, 1,
-1.887996, -1.316652, -1.306046, 1, 0.172549, 0, 1,
-1.864155, 0.6924773, -1.336528, 1, 0.1803922, 0, 1,
-1.855537, 0.2296124, -0.3513204, 1, 0.1843137, 0, 1,
-1.84617, -0.9798866, -2.929629, 1, 0.1921569, 0, 1,
-1.830295, -0.7461775, -2.581597, 1, 0.1960784, 0, 1,
-1.81818, 0.2993194, -0.9817705, 1, 0.2039216, 0, 1,
-1.81522, -0.2153729, -1.486147, 1, 0.2117647, 0, 1,
-1.810894, -0.7348754, -0.5432484, 1, 0.2156863, 0, 1,
-1.77039, -2.402318, -2.21137, 1, 0.2235294, 0, 1,
-1.760412, -1.31856, -1.964384, 1, 0.227451, 0, 1,
-1.743431, -0.9014482, -1.340933, 1, 0.2352941, 0, 1,
-1.716745, -0.3430763, -2.921358, 1, 0.2392157, 0, 1,
-1.713247, 0.5333378, 0.331306, 1, 0.2470588, 0, 1,
-1.711833, -2.302229, -3.88937, 1, 0.2509804, 0, 1,
-1.700054, -1.399516, -2.379835, 1, 0.2588235, 0, 1,
-1.699542, -0.4810824, -0.4953071, 1, 0.2627451, 0, 1,
-1.695507, 1.083518, 0.8538406, 1, 0.2705882, 0, 1,
-1.695232, 0.8191376, -2.098297, 1, 0.2745098, 0, 1,
-1.688614, -0.05168934, -3.911074, 1, 0.282353, 0, 1,
-1.67891, -0.6033722, -1.96896, 1, 0.2862745, 0, 1,
-1.672886, 0.06792582, -0.6725214, 1, 0.2941177, 0, 1,
-1.671168, 0.8526845, -0.5100805, 1, 0.3019608, 0, 1,
-1.663629, 0.5303536, -2.385643, 1, 0.3058824, 0, 1,
-1.643733, -0.8881791, -1.672642, 1, 0.3137255, 0, 1,
-1.642345, -0.1600181, -4.275348, 1, 0.3176471, 0, 1,
-1.638475, -0.4609027, -2.999874, 1, 0.3254902, 0, 1,
-1.635194, 0.3867749, -1.151835, 1, 0.3294118, 0, 1,
-1.634898, -1.233863, -3.071183, 1, 0.3372549, 0, 1,
-1.62931, 1.29673, -0.4132869, 1, 0.3411765, 0, 1,
-1.629214, 1.723347, -2.037266, 1, 0.3490196, 0, 1,
-1.617009, -0.09758271, -1.682786, 1, 0.3529412, 0, 1,
-1.589277, 0.6326074, -0.2567084, 1, 0.3607843, 0, 1,
-1.588683, 1.217216, -0.526261, 1, 0.3647059, 0, 1,
-1.569438, 1.796081, 0.4912963, 1, 0.372549, 0, 1,
-1.568778, -0.5465684, -3.515429, 1, 0.3764706, 0, 1,
-1.565579, -0.1526203, -0.7162547, 1, 0.3843137, 0, 1,
-1.555855, -1.092826, -1.40053, 1, 0.3882353, 0, 1,
-1.549137, 1.075594, -1.430051, 1, 0.3960784, 0, 1,
-1.54191, -0.926551, -4.050986, 1, 0.4039216, 0, 1,
-1.53013, 1.615575, -0.02591088, 1, 0.4078431, 0, 1,
-1.528596, 0.2281691, 0.2396434, 1, 0.4156863, 0, 1,
-1.523232, 0.02425534, -1.174621, 1, 0.4196078, 0, 1,
-1.501546, 0.05755455, -2.706867, 1, 0.427451, 0, 1,
-1.500381, -0.6646239, -2.136011, 1, 0.4313726, 0, 1,
-1.500282, -0.697412, -3.76725, 1, 0.4392157, 0, 1,
-1.469291, 0.8760158, -1.481404, 1, 0.4431373, 0, 1,
-1.467682, -0.2927395, -1.532672, 1, 0.4509804, 0, 1,
-1.454987, 0.4252664, -1.657848, 1, 0.454902, 0, 1,
-1.449576, -0.2767276, -1.620532, 1, 0.4627451, 0, 1,
-1.433224, -0.6415165, -1.923748, 1, 0.4666667, 0, 1,
-1.430892, 0.9634703, -1.103438, 1, 0.4745098, 0, 1,
-1.428852, -0.8719032, 0.4812532, 1, 0.4784314, 0, 1,
-1.426258, -0.1077562, -0.6794546, 1, 0.4862745, 0, 1,
-1.425403, -2.657357, -3.19537, 1, 0.4901961, 0, 1,
-1.422514, 0.3989506, -0.6882422, 1, 0.4980392, 0, 1,
-1.421631, 1.001822, -0.2199526, 1, 0.5058824, 0, 1,
-1.420473, 0.577821, 1.081317, 1, 0.509804, 0, 1,
-1.406938, 1.294966, 0.8835635, 1, 0.5176471, 0, 1,
-1.403622, 0.2690756, -1.402729, 1, 0.5215687, 0, 1,
-1.396126, -1.582715, -3.255426, 1, 0.5294118, 0, 1,
-1.392439, 0.5503503, -1.160091, 1, 0.5333334, 0, 1,
-1.380851, -0.7264742, -2.446141, 1, 0.5411765, 0, 1,
-1.377112, 2.466332, -0.7520929, 1, 0.5450981, 0, 1,
-1.371455, -0.2783755, -1.129076, 1, 0.5529412, 0, 1,
-1.354262, -1.661762, -2.225282, 1, 0.5568628, 0, 1,
-1.347632, -1.409075, -2.44033, 1, 0.5647059, 0, 1,
-1.344482, 0.6477674, -0.8454673, 1, 0.5686275, 0, 1,
-1.338172, 0.3035479, 0.5246752, 1, 0.5764706, 0, 1,
-1.337376, -0.3009893, -2.320662, 1, 0.5803922, 0, 1,
-1.335345, -1.610833, -1.781803, 1, 0.5882353, 0, 1,
-1.33528, -1.230924, -2.251901, 1, 0.5921569, 0, 1,
-1.331128, 1.214628, -0.1288975, 1, 0.6, 0, 1,
-1.327358, -0.6972514, -2.775676, 1, 0.6078432, 0, 1,
-1.322816, 1.466216, -0.4085255, 1, 0.6117647, 0, 1,
-1.322481, -0.5209656, -1.739212, 1, 0.6196079, 0, 1,
-1.319429, -0.9816591, 0.5139326, 1, 0.6235294, 0, 1,
-1.31929, -3.069468, -4.340271, 1, 0.6313726, 0, 1,
-1.313225, -1.359466, -4.079248, 1, 0.6352941, 0, 1,
-1.310197, 1.332737, -2.51432, 1, 0.6431373, 0, 1,
-1.302143, 0.7046642, -1.924952, 1, 0.6470588, 0, 1,
-1.292102, 1.13266, -0.8943375, 1, 0.654902, 0, 1,
-1.287521, -0.6987029, -1.662803, 1, 0.6588235, 0, 1,
-1.277282, 0.713722, -2.577048, 1, 0.6666667, 0, 1,
-1.268222, -1.856421, -2.721794, 1, 0.6705883, 0, 1,
-1.261982, -0.4989019, -3.337357, 1, 0.6784314, 0, 1,
-1.260833, 0.8866805, -1.590695, 1, 0.682353, 0, 1,
-1.25783, -1.138747, -2.833848, 1, 0.6901961, 0, 1,
-1.256924, -0.09170932, -1.106573, 1, 0.6941177, 0, 1,
-1.252084, -0.5492597, -3.566864, 1, 0.7019608, 0, 1,
-1.246023, -0.8873641, -3.433654, 1, 0.7098039, 0, 1,
-1.244823, 0.9512063, -1.361573, 1, 0.7137255, 0, 1,
-1.222685, 0.1136901, -1.156603, 1, 0.7215686, 0, 1,
-1.217541, 0.5613946, -1.948098, 1, 0.7254902, 0, 1,
-1.213389, 1.332721, -0.4597747, 1, 0.7333333, 0, 1,
-1.210905, 1.390518, -2.935088, 1, 0.7372549, 0, 1,
-1.202087, -0.3169151, -1.347007, 1, 0.7450981, 0, 1,
-1.195625, 0.5730183, -1.873294, 1, 0.7490196, 0, 1,
-1.195288, -1.499597, -2.247441, 1, 0.7568628, 0, 1,
-1.180558, -2.656298, -2.830843, 1, 0.7607843, 0, 1,
-1.180356, 0.0453988, -0.4727831, 1, 0.7686275, 0, 1,
-1.175902, 0.7025019, -1.392813, 1, 0.772549, 0, 1,
-1.162981, -0.4406579, -1.068421, 1, 0.7803922, 0, 1,
-1.158248, 0.5777889, -1.482681, 1, 0.7843137, 0, 1,
-1.156914, -0.2331089, -0.4178579, 1, 0.7921569, 0, 1,
-1.149361, 0.3448866, -1.057292, 1, 0.7960784, 0, 1,
-1.130361, -0.1162193, -2.284084, 1, 0.8039216, 0, 1,
-1.125987, -0.713518, -2.847321, 1, 0.8117647, 0, 1,
-1.125775, 0.007757866, -2.124271, 1, 0.8156863, 0, 1,
-1.123031, 1.952841, -2.918214, 1, 0.8235294, 0, 1,
-1.111803, 0.03328506, -0.7421393, 1, 0.827451, 0, 1,
-1.100339, -0.7117667, -1.432434, 1, 0.8352941, 0, 1,
-1.093152, -1.524852, -0.448865, 1, 0.8392157, 0, 1,
-1.092403, -0.02801352, -2.716264, 1, 0.8470588, 0, 1,
-1.080359, -0.6260681, -1.625626, 1, 0.8509804, 0, 1,
-1.077221, -0.4987394, -2.894602, 1, 0.8588235, 0, 1,
-1.073996, -0.7670693, -0.731908, 1, 0.8627451, 0, 1,
-1.071896, 0.1094144, -1.065036, 1, 0.8705882, 0, 1,
-1.054616, 0.2593729, -2.581679, 1, 0.8745098, 0, 1,
-1.053059, -2.566418, -3.075717, 1, 0.8823529, 0, 1,
-1.052808, -0.3504946, -1.389382, 1, 0.8862745, 0, 1,
-1.046196, -1.607087, -1.914059, 1, 0.8941177, 0, 1,
-1.039788, -1.439406, -2.986731, 1, 0.8980392, 0, 1,
-1.033808, -0.05636197, -1.948398, 1, 0.9058824, 0, 1,
-1.030755, 0.0958607, 0.05052814, 1, 0.9137255, 0, 1,
-1.028226, 0.07988925, -0.8502124, 1, 0.9176471, 0, 1,
-1.027162, 0.659716, -0.460832, 1, 0.9254902, 0, 1,
-1.025276, 0.03737246, -2.346482, 1, 0.9294118, 0, 1,
-1.023832, -0.8647701, -1.372715, 1, 0.9372549, 0, 1,
-1.020997, -0.2940902, -2.893705, 1, 0.9411765, 0, 1,
-1.012953, 0.347389, -2.369132, 1, 0.9490196, 0, 1,
-1.007032, 2.184341, -2.574211, 1, 0.9529412, 0, 1,
-0.9977875, 0.7178749, -0.3841252, 1, 0.9607843, 0, 1,
-0.9880289, 0.2648262, -1.721406, 1, 0.9647059, 0, 1,
-0.9869692, 0.3558768, -2.644338, 1, 0.972549, 0, 1,
-0.9708359, -0.2702532, -1.942548, 1, 0.9764706, 0, 1,
-0.9652503, -0.1503869, -0.6971421, 1, 0.9843137, 0, 1,
-0.9617525, 0.09943217, -2.042812, 1, 0.9882353, 0, 1,
-0.957804, 1.220535, 0.03612005, 1, 0.9960784, 0, 1,
-0.9567351, 1.333983, -1.461182, 0.9960784, 1, 0, 1,
-0.9553295, -0.02802028, -2.08057, 0.9921569, 1, 0, 1,
-0.9552365, -0.507601, -1.94662, 0.9843137, 1, 0, 1,
-0.950078, -0.5533809, -2.30634, 0.9803922, 1, 0, 1,
-0.9432696, -0.2958253, -0.7962815, 0.972549, 1, 0, 1,
-0.9404718, 1.034545, -1.74906, 0.9686275, 1, 0, 1,
-0.9402595, 1.588205, -0.5320699, 0.9607843, 1, 0, 1,
-0.933351, -0.3631178, -1.428717, 0.9568627, 1, 0, 1,
-0.9247159, -2.158305, -3.873221, 0.9490196, 1, 0, 1,
-0.918731, 1.175316, 0.1682745, 0.945098, 1, 0, 1,
-0.9181277, 0.8849809, -1.451772, 0.9372549, 1, 0, 1,
-0.9165986, -0.6451294, -1.150069, 0.9333333, 1, 0, 1,
-0.9157676, -1.083656, -4.075706, 0.9254902, 1, 0, 1,
-0.9155927, -2.62294, -1.066885, 0.9215686, 1, 0, 1,
-0.9080735, -0.5886486, -1.863094, 0.9137255, 1, 0, 1,
-0.9042582, -0.07285191, 0.2522594, 0.9098039, 1, 0, 1,
-0.9007614, -0.6858732, -3.000976, 0.9019608, 1, 0, 1,
-0.900076, -0.7718685, -2.081896, 0.8941177, 1, 0, 1,
-0.897233, -0.9463484, -1.51637, 0.8901961, 1, 0, 1,
-0.8970347, -0.6401985, -3.06629, 0.8823529, 1, 0, 1,
-0.8852016, -0.3699784, -1.925368, 0.8784314, 1, 0, 1,
-0.8785658, 0.2079766, -0.8061441, 0.8705882, 1, 0, 1,
-0.8726884, -0.2790957, -1.220447, 0.8666667, 1, 0, 1,
-0.8699139, -0.4032295, -2.120753, 0.8588235, 1, 0, 1,
-0.8593372, 1.858198, 1.256208, 0.854902, 1, 0, 1,
-0.85558, 0.3073082, -1.448194, 0.8470588, 1, 0, 1,
-0.8549276, -0.2804955, -1.397449, 0.8431373, 1, 0, 1,
-0.8534586, -0.5374891, -1.702154, 0.8352941, 1, 0, 1,
-0.8496686, -0.5513342, -2.447709, 0.8313726, 1, 0, 1,
-0.8439798, -1.277694, -2.104706, 0.8235294, 1, 0, 1,
-0.8424612, -0.228567, -3.232893, 0.8196079, 1, 0, 1,
-0.8369777, -0.751067, -1.721879, 0.8117647, 1, 0, 1,
-0.8344679, 0.8312955, 0.2024254, 0.8078431, 1, 0, 1,
-0.8232499, 0.5877153, -1.739039, 0.8, 1, 0, 1,
-0.8218397, -1.044649, -2.236094, 0.7921569, 1, 0, 1,
-0.8187087, 1.940631, -1.157687, 0.7882353, 1, 0, 1,
-0.8043898, -1.440065, -3.073822, 0.7803922, 1, 0, 1,
-0.8016921, 2.288822, 0.9117884, 0.7764706, 1, 0, 1,
-0.7980001, 0.3283611, -0.04626639, 0.7686275, 1, 0, 1,
-0.7939812, 0.9987768, -0.3071083, 0.7647059, 1, 0, 1,
-0.7932426, 0.8132778, -0.1950184, 0.7568628, 1, 0, 1,
-0.7926903, 1.667311, 1.148056, 0.7529412, 1, 0, 1,
-0.791283, 1.292989, 0.7831735, 0.7450981, 1, 0, 1,
-0.7892367, -0.6894707, -2.719802, 0.7411765, 1, 0, 1,
-0.788526, 1.078755, -2.280346, 0.7333333, 1, 0, 1,
-0.7871681, 0.534532, -1.203858, 0.7294118, 1, 0, 1,
-0.7856486, -0.64513, -3.91365, 0.7215686, 1, 0, 1,
-0.7837717, -1.773471, -1.946576, 0.7176471, 1, 0, 1,
-0.7817247, 1.574798, -2.646672, 0.7098039, 1, 0, 1,
-0.7791577, -0.3151622, -4.488412, 0.7058824, 1, 0, 1,
-0.7785799, -1.418006, -2.347193, 0.6980392, 1, 0, 1,
-0.7776972, 0.8126507, 0.3570094, 0.6901961, 1, 0, 1,
-0.7747707, -0.2922004, -2.336103, 0.6862745, 1, 0, 1,
-0.7658226, 0.1057109, -3.467775, 0.6784314, 1, 0, 1,
-0.7644355, 0.05869969, -1.368796, 0.6745098, 1, 0, 1,
-0.7615006, 0.3745215, -2.371906, 0.6666667, 1, 0, 1,
-0.7613473, 0.2534195, -0.8254266, 0.6627451, 1, 0, 1,
-0.7607406, 1.095417, -0.4894627, 0.654902, 1, 0, 1,
-0.7519459, 0.9245417, -2.372057, 0.6509804, 1, 0, 1,
-0.7463891, -0.5921627, -2.768791, 0.6431373, 1, 0, 1,
-0.74244, -2.192703, -4.088196, 0.6392157, 1, 0, 1,
-0.7412887, -0.3762791, 0.4678926, 0.6313726, 1, 0, 1,
-0.7402427, 0.3811385, -0.2372694, 0.627451, 1, 0, 1,
-0.7395995, 0.6078357, -1.156817, 0.6196079, 1, 0, 1,
-0.7376174, 0.9292786, -1.163234, 0.6156863, 1, 0, 1,
-0.7350999, -0.7945057, -3.484443, 0.6078432, 1, 0, 1,
-0.7335703, -0.3996556, -3.914021, 0.6039216, 1, 0, 1,
-0.7199158, -0.7963008, -2.129657, 0.5960785, 1, 0, 1,
-0.7180372, -0.5817047, -0.9908039, 0.5882353, 1, 0, 1,
-0.7159135, -1.593377, -3.139628, 0.5843138, 1, 0, 1,
-0.7090608, 1.295073, 0.520878, 0.5764706, 1, 0, 1,
-0.708037, -0.5752758, -2.440952, 0.572549, 1, 0, 1,
-0.7027265, -0.06270396, -1.672323, 0.5647059, 1, 0, 1,
-0.702265, 0.2739591, -0.8157497, 0.5607843, 1, 0, 1,
-0.7014049, -0.07439625, -0.6122568, 0.5529412, 1, 0, 1,
-0.6974163, -1.134478, -3.210743, 0.5490196, 1, 0, 1,
-0.6964018, -0.191397, -2.962151, 0.5411765, 1, 0, 1,
-0.6952076, -0.639866, -2.740476, 0.5372549, 1, 0, 1,
-0.6943742, 0.003972782, -1.182934, 0.5294118, 1, 0, 1,
-0.6875945, -1.0148, -1.276322, 0.5254902, 1, 0, 1,
-0.6863928, 0.2251694, 0.2150477, 0.5176471, 1, 0, 1,
-0.6778623, -0.8831909, -3.102364, 0.5137255, 1, 0, 1,
-0.6760112, 0.7279841, -1.990574, 0.5058824, 1, 0, 1,
-0.6716383, -0.4454155, -3.904287, 0.5019608, 1, 0, 1,
-0.6693634, -0.2150744, -0.89265, 0.4941176, 1, 0, 1,
-0.6655673, 0.309865, -1.270952, 0.4862745, 1, 0, 1,
-0.6630658, -0.3937317, -0.6256893, 0.4823529, 1, 0, 1,
-0.658762, -0.7872854, -3.757457, 0.4745098, 1, 0, 1,
-0.6576018, -0.2482662, -2.033071, 0.4705882, 1, 0, 1,
-0.6555144, 0.5669067, -0.650696, 0.4627451, 1, 0, 1,
-0.6550285, 1.762822, 0.2765107, 0.4588235, 1, 0, 1,
-0.6531605, 0.6648057, -0.3292084, 0.4509804, 1, 0, 1,
-0.6491513, -0.4655336, -2.29099, 0.4470588, 1, 0, 1,
-0.6442068, 1.70553, -1.437051, 0.4392157, 1, 0, 1,
-0.6352817, -0.03703713, -0.7189682, 0.4352941, 1, 0, 1,
-0.6331825, -0.9605316, -2.477097, 0.427451, 1, 0, 1,
-0.631923, 1.456072, 1.48793, 0.4235294, 1, 0, 1,
-0.6247411, 0.8655488, -0.5592981, 0.4156863, 1, 0, 1,
-0.6216117, 1.127273, -0.03341653, 0.4117647, 1, 0, 1,
-0.6193578, -0.9427584, -4.231648, 0.4039216, 1, 0, 1,
-0.6177588, 0.3758684, -0.9540469, 0.3960784, 1, 0, 1,
-0.6140274, 1.94868, -0.5779117, 0.3921569, 1, 0, 1,
-0.6086547, 0.809529, -0.05956975, 0.3843137, 1, 0, 1,
-0.6038345, -0.6292405, -4.462486, 0.3803922, 1, 0, 1,
-0.5954804, -0.2375544, -2.183852, 0.372549, 1, 0, 1,
-0.5953802, 0.6496896, -1.745818, 0.3686275, 1, 0, 1,
-0.5949479, 1.703552, -0.01354726, 0.3607843, 1, 0, 1,
-0.5945197, 1.272418, -0.5885094, 0.3568628, 1, 0, 1,
-0.591247, -0.9697103, -3.3257, 0.3490196, 1, 0, 1,
-0.5829238, -0.3800912, -1.283304, 0.345098, 1, 0, 1,
-0.5801699, 0.2137802, -0.7189242, 0.3372549, 1, 0, 1,
-0.5736762, -0.2836032, -3.572751, 0.3333333, 1, 0, 1,
-0.5725122, -0.3006601, -3.683582, 0.3254902, 1, 0, 1,
-0.5708921, -0.2287012, -2.521064, 0.3215686, 1, 0, 1,
-0.5700312, -2.490922, -3.937373, 0.3137255, 1, 0, 1,
-0.5668287, -0.08046654, -3.651603, 0.3098039, 1, 0, 1,
-0.5598808, -1.332952, -3.802529, 0.3019608, 1, 0, 1,
-0.5569004, -0.03518011, -3.48369, 0.2941177, 1, 0, 1,
-0.5523255, 0.3749091, -0.2004082, 0.2901961, 1, 0, 1,
-0.5485108, 1.714111, -1.385302, 0.282353, 1, 0, 1,
-0.541786, -0.66019, -0.9907411, 0.2784314, 1, 0, 1,
-0.534884, 0.9093594, -0.6053711, 0.2705882, 1, 0, 1,
-0.5348614, -0.6131797, -1.738539, 0.2666667, 1, 0, 1,
-0.5258061, -1.902626, -1.067241, 0.2588235, 1, 0, 1,
-0.5251905, 1.051073, -1.088554, 0.254902, 1, 0, 1,
-0.5235136, 0.377932, -1.940223, 0.2470588, 1, 0, 1,
-0.5234553, 0.2754281, -1.87258, 0.2431373, 1, 0, 1,
-0.5223649, -0.7002761, -1.199421, 0.2352941, 1, 0, 1,
-0.5198795, 0.7949601, -0.2317595, 0.2313726, 1, 0, 1,
-0.5197217, 0.4353744, -0.5125225, 0.2235294, 1, 0, 1,
-0.5162975, -0.1368817, -3.593058, 0.2196078, 1, 0, 1,
-0.5149808, -0.6864735, -2.226341, 0.2117647, 1, 0, 1,
-0.5135771, -1.241128, -1.827862, 0.2078431, 1, 0, 1,
-0.5108696, 0.296278, -2.049713, 0.2, 1, 0, 1,
-0.5106281, 1.224298, 0.3867793, 0.1921569, 1, 0, 1,
-0.5090747, 0.660768, -0.3926528, 0.1882353, 1, 0, 1,
-0.5070373, -0.6552117, -4.40302, 0.1803922, 1, 0, 1,
-0.5014244, 0.1840736, -1.672995, 0.1764706, 1, 0, 1,
-0.5005, -1.927231, -1.473287, 0.1686275, 1, 0, 1,
-0.4998101, 0.9867084, -0.2768171, 0.1647059, 1, 0, 1,
-0.4988325, -0.3643413, -1.586575, 0.1568628, 1, 0, 1,
-0.4924681, 0.1578323, -1.10591, 0.1529412, 1, 0, 1,
-0.4894402, -0.0495392, -0.8078923, 0.145098, 1, 0, 1,
-0.4885417, -0.3337779, -3.204287, 0.1411765, 1, 0, 1,
-0.4873865, 1.331034, 2.20915, 0.1333333, 1, 0, 1,
-0.4871368, 1.350461, -0.7161361, 0.1294118, 1, 0, 1,
-0.4865464, 0.34569, 0.1840097, 0.1215686, 1, 0, 1,
-0.4837974, 0.683299, -0.6218961, 0.1176471, 1, 0, 1,
-0.4825997, -1.40028, -3.854555, 0.1098039, 1, 0, 1,
-0.4819978, 0.2547737, -1.414603, 0.1058824, 1, 0, 1,
-0.4802519, 1.155287, 1.055972, 0.09803922, 1, 0, 1,
-0.4797623, 3.075806, 2.262065, 0.09019608, 1, 0, 1,
-0.4777809, 0.2060538, -2.181254, 0.08627451, 1, 0, 1,
-0.4734755, -0.5769089, -1.758816, 0.07843138, 1, 0, 1,
-0.4675138, -0.234506, -1.950356, 0.07450981, 1, 0, 1,
-0.4672629, 1.600528, -0.06545314, 0.06666667, 1, 0, 1,
-0.4669253, -0.9813306, -3.117109, 0.0627451, 1, 0, 1,
-0.4571468, -1.2732, -3.252553, 0.05490196, 1, 0, 1,
-0.4566365, 0.5613199, -1.531953, 0.05098039, 1, 0, 1,
-0.4549896, 1.195826, 0.4388353, 0.04313726, 1, 0, 1,
-0.4495498, 1.038909, -0.27979, 0.03921569, 1, 0, 1,
-0.4492388, -1.247484, -2.364218, 0.03137255, 1, 0, 1,
-0.4488387, -0.185661, -0.7205219, 0.02745098, 1, 0, 1,
-0.4472051, -1.976187, -2.790617, 0.01960784, 1, 0, 1,
-0.4424888, -0.2527202, -3.542653, 0.01568628, 1, 0, 1,
-0.4377022, 1.216301, -0.639133, 0.007843138, 1, 0, 1,
-0.4358959, 0.03768025, -1.063734, 0.003921569, 1, 0, 1,
-0.435744, 1.751771, -1.468453, 0, 1, 0.003921569, 1,
-0.4316288, 0.9771289, -1.093967, 0, 1, 0.01176471, 1,
-0.430898, 0.7206659, -1.723482, 0, 1, 0.01568628, 1,
-0.4278212, -0.3002668, -2.248877, 0, 1, 0.02352941, 1,
-0.4246372, 0.7851798, -2.603906, 0, 1, 0.02745098, 1,
-0.4233514, -1.248007, -0.9960864, 0, 1, 0.03529412, 1,
-0.420977, 1.68549, 0.01657465, 0, 1, 0.03921569, 1,
-0.4178713, -1.251917, -1.703766, 0, 1, 0.04705882, 1,
-0.4109958, 0.02530133, -2.342529, 0, 1, 0.05098039, 1,
-0.4083719, -0.5903264, -2.653935, 0, 1, 0.05882353, 1,
-0.405781, 1.187883, -1.269456, 0, 1, 0.0627451, 1,
-0.402119, -0.1581333, -0.4967355, 0, 1, 0.07058824, 1,
-0.4004364, 0.2125468, -0.2397676, 0, 1, 0.07450981, 1,
-0.4003455, -1.474215, -4.953739, 0, 1, 0.08235294, 1,
-0.3997096, 0.0356196, 0.9788847, 0, 1, 0.08627451, 1,
-0.398054, -0.4083403, -1.229185, 0, 1, 0.09411765, 1,
-0.3834836, -0.7633054, -2.204172, 0, 1, 0.1019608, 1,
-0.3827367, -1.813893, -4.19973, 0, 1, 0.1058824, 1,
-0.3810077, 0.124234, 0.07731237, 0, 1, 0.1137255, 1,
-0.3794613, -1.779486, -3.460132, 0, 1, 0.1176471, 1,
-0.3768787, 0.1542849, -1.065267, 0, 1, 0.1254902, 1,
-0.3768676, -1.12504, -2.182568, 0, 1, 0.1294118, 1,
-0.3738362, -1.286793, -3.257556, 0, 1, 0.1372549, 1,
-0.3719786, 0.8683226, -0.6285489, 0, 1, 0.1411765, 1,
-0.3647296, -0.710796, -2.901593, 0, 1, 0.1490196, 1,
-0.3632436, 1.129199, 0.2778359, 0, 1, 0.1529412, 1,
-0.3630496, 0.8661584, 0.5700684, 0, 1, 0.1607843, 1,
-0.3622833, -0.6536463, -3.286175, 0, 1, 0.1647059, 1,
-0.3586538, -1.890646, -3.343429, 0, 1, 0.172549, 1,
-0.3575369, -1.119867, -4.429479, 0, 1, 0.1764706, 1,
-0.3564608, -0.2661515, -1.081971, 0, 1, 0.1843137, 1,
-0.3541749, -1.422509, -3.838482, 0, 1, 0.1882353, 1,
-0.3519526, -2.688449, -3.47562, 0, 1, 0.1960784, 1,
-0.3506053, 0.7674539, -0.6688614, 0, 1, 0.2039216, 1,
-0.3505971, -0.8068395, -3.206849, 0, 1, 0.2078431, 1,
-0.348605, 0.9777611, 1.385434, 0, 1, 0.2156863, 1,
-0.3483788, 0.493692, -1.557322, 0, 1, 0.2196078, 1,
-0.3446023, 0.5313402, -0.9577005, 0, 1, 0.227451, 1,
-0.3441057, -0.6622099, -1.828877, 0, 1, 0.2313726, 1,
-0.3437656, -0.555838, -3.531283, 0, 1, 0.2392157, 1,
-0.3434203, 0.07390935, -1.801464, 0, 1, 0.2431373, 1,
-0.3378935, 1.288175, 0.5394701, 0, 1, 0.2509804, 1,
-0.3356753, -0.4931495, -1.613243, 0, 1, 0.254902, 1,
-0.3355802, 1.111782, 0.8545414, 0, 1, 0.2627451, 1,
-0.335231, -0.6339472, -4.094948, 0, 1, 0.2666667, 1,
-0.3334939, -0.8599096, -0.4443428, 0, 1, 0.2745098, 1,
-0.3332082, 0.2474599, -0.3193279, 0, 1, 0.2784314, 1,
-0.3327506, 0.05683369, 0.03359878, 0, 1, 0.2862745, 1,
-0.3324738, -2.178706, -5.179973, 0, 1, 0.2901961, 1,
-0.3275723, -0.4312475, -3.585254, 0, 1, 0.2980392, 1,
-0.3260795, 1.678799, 0.7427325, 0, 1, 0.3058824, 1,
-0.3226082, 0.9666979, 0.7244947, 0, 1, 0.3098039, 1,
-0.3217938, 0.1372056, 0.6846702, 0, 1, 0.3176471, 1,
-0.3188534, -0.00968795, -1.832028, 0, 1, 0.3215686, 1,
-0.3145091, 0.1887402, 0.539651, 0, 1, 0.3294118, 1,
-0.312581, -0.4903136, -3.504156, 0, 1, 0.3333333, 1,
-0.309876, 2.007029, 0.6134171, 0, 1, 0.3411765, 1,
-0.3088431, -0.6338447, -2.155628, 0, 1, 0.345098, 1,
-0.3055069, -1.303419, -1.939358, 0, 1, 0.3529412, 1,
-0.2995177, -0.4480439, -2.007577, 0, 1, 0.3568628, 1,
-0.2987553, -1.741877, -3.849431, 0, 1, 0.3647059, 1,
-0.2964414, -0.05054978, -0.9324391, 0, 1, 0.3686275, 1,
-0.2956459, 0.8898525, -0.9836567, 0, 1, 0.3764706, 1,
-0.2948411, 0.8632531, -0.1523639, 0, 1, 0.3803922, 1,
-0.2911865, -1.012746, -3.40298, 0, 1, 0.3882353, 1,
-0.2890015, 0.861382, 0.6554731, 0, 1, 0.3921569, 1,
-0.2889266, -0.1226563, -1.608557, 0, 1, 0.4, 1,
-0.2762896, -1.156119, -4.264654, 0, 1, 0.4078431, 1,
-0.2739857, 1.972837, -1.197043, 0, 1, 0.4117647, 1,
-0.2682734, 1.599894, -0.6021209, 0, 1, 0.4196078, 1,
-0.2675575, 0.736286, -0.5806341, 0, 1, 0.4235294, 1,
-0.2636325, -1.617009, -2.74897, 0, 1, 0.4313726, 1,
-0.262555, -1.596276, -1.652435, 0, 1, 0.4352941, 1,
-0.2611179, 1.031388, -1.573685, 0, 1, 0.4431373, 1,
-0.2579859, 0.6911488, -0.3628442, 0, 1, 0.4470588, 1,
-0.2576803, 2.448939, 0.03615962, 0, 1, 0.454902, 1,
-0.2567734, -0.1073133, -1.97778, 0, 1, 0.4588235, 1,
-0.25473, 0.1136038, -1.937853, 0, 1, 0.4666667, 1,
-0.2524794, -0.8229067, -1.20311, 0, 1, 0.4705882, 1,
-0.2427943, -0.9589469, -3.129866, 0, 1, 0.4784314, 1,
-0.2426779, -1.653309, -4.149839, 0, 1, 0.4823529, 1,
-0.2411699, 2.013737, -0.08003667, 0, 1, 0.4901961, 1,
-0.2405585, -0.1830597, -5.432953, 0, 1, 0.4941176, 1,
-0.2401853, 0.5764242, 0.7155586, 0, 1, 0.5019608, 1,
-0.2401708, 2.295334, -0.09163626, 0, 1, 0.509804, 1,
-0.2399888, -0.1648179, -2.845142, 0, 1, 0.5137255, 1,
-0.2378753, 1.646026, -0.3090195, 0, 1, 0.5215687, 1,
-0.2354656, 0.6781656, -0.2768512, 0, 1, 0.5254902, 1,
-0.2327605, 0.9915463, -0.7318125, 0, 1, 0.5333334, 1,
-0.2317206, 0.5910166, -1.975379, 0, 1, 0.5372549, 1,
-0.2281639, -1.204674, -3.859504, 0, 1, 0.5450981, 1,
-0.2241674, 1.003271, -0.79877, 0, 1, 0.5490196, 1,
-0.2222169, -1.046908, -5.419127, 0, 1, 0.5568628, 1,
-0.2207032, 0.7118767, -1.403906, 0, 1, 0.5607843, 1,
-0.2196084, -1.445654, -3.616195, 0, 1, 0.5686275, 1,
-0.2188299, -0.8607515, -3.894657, 0, 1, 0.572549, 1,
-0.2178637, -0.3277042, -4.146944, 0, 1, 0.5803922, 1,
-0.2152577, 0.7001641, 0.8481309, 0, 1, 0.5843138, 1,
-0.2122613, 0.1433397, -0.4087745, 0, 1, 0.5921569, 1,
-0.2122443, 0.02559901, -2.202624, 0, 1, 0.5960785, 1,
-0.2120627, -0.5725008, -4.335073, 0, 1, 0.6039216, 1,
-0.2010197, -0.3958122, -1.166573, 0, 1, 0.6117647, 1,
-0.1947316, -1.2843, -2.37201, 0, 1, 0.6156863, 1,
-0.194137, 0.1486147, 1.141374, 0, 1, 0.6235294, 1,
-0.1934591, -0.2053928, -2.366666, 0, 1, 0.627451, 1,
-0.1928477, 0.6916037, 0.1623028, 0, 1, 0.6352941, 1,
-0.1912572, 1.520711, -0.7039922, 0, 1, 0.6392157, 1,
-0.1891654, -0.4245342, -3.528154, 0, 1, 0.6470588, 1,
-0.1858224, 1.88504, 1.392489, 0, 1, 0.6509804, 1,
-0.1839788, 0.9075483, 0.9487842, 0, 1, 0.6588235, 1,
-0.181869, 0.1135071, -2.197744, 0, 1, 0.6627451, 1,
-0.1767567, -1.814592, -3.359159, 0, 1, 0.6705883, 1,
-0.1748856, 0.8106062, 0.7655604, 0, 1, 0.6745098, 1,
-0.1732421, -0.1458488, -3.35577, 0, 1, 0.682353, 1,
-0.1721151, 0.374443, 0.06482105, 0, 1, 0.6862745, 1,
-0.1699031, -0.1195277, -4.115803, 0, 1, 0.6941177, 1,
-0.1691773, 1.261869, 1.109173, 0, 1, 0.7019608, 1,
-0.1682186, 1.158738, -1.375173, 0, 1, 0.7058824, 1,
-0.1671384, -0.4153433, -4.585371, 0, 1, 0.7137255, 1,
-0.165346, 0.8257393, -2.010573, 0, 1, 0.7176471, 1,
-0.1611709, -1.713454, -2.698846, 0, 1, 0.7254902, 1,
-0.1610629, -0.8587245, -2.038023, 0, 1, 0.7294118, 1,
-0.1587962, -0.6658788, -1.606548, 0, 1, 0.7372549, 1,
-0.1567407, -0.0982741, -2.142193, 0, 1, 0.7411765, 1,
-0.1559703, 0.3826334, -0.5262232, 0, 1, 0.7490196, 1,
-0.1524469, -0.5519772, -2.575623, 0, 1, 0.7529412, 1,
-0.1497853, -0.6927338, -2.463291, 0, 1, 0.7607843, 1,
-0.1494509, 0.0268706, -0.5606013, 0, 1, 0.7647059, 1,
-0.1429856, -0.7515772, -1.002914, 0, 1, 0.772549, 1,
-0.1429706, 1.375248, -0.364334, 0, 1, 0.7764706, 1,
-0.1410834, 1.000357, -1.197609, 0, 1, 0.7843137, 1,
-0.1402067, -1.409543, -2.263164, 0, 1, 0.7882353, 1,
-0.1392761, -1.00848, -1.817771, 0, 1, 0.7960784, 1,
-0.1356429, 0.1026996, -0.6989083, 0, 1, 0.8039216, 1,
-0.1353424, 0.7322853, -1.61692, 0, 1, 0.8078431, 1,
-0.1299231, -0.9806847, -2.466689, 0, 1, 0.8156863, 1,
-0.1274727, 1.185883, -1.280029, 0, 1, 0.8196079, 1,
-0.1270442, 0.6613513, -1.031832, 0, 1, 0.827451, 1,
-0.1262704, -0.4990186, -2.48606, 0, 1, 0.8313726, 1,
-0.1240198, 0.4264599, 1.170321, 0, 1, 0.8392157, 1,
-0.1197378, -0.08673306, -1.63616, 0, 1, 0.8431373, 1,
-0.1160707, -0.944811, -2.058235, 0, 1, 0.8509804, 1,
-0.1108651, -1.333137, -2.132662, 0, 1, 0.854902, 1,
-0.1097084, -0.8212206, -3.669808, 0, 1, 0.8627451, 1,
-0.1086331, -0.8684312, -3.912901, 0, 1, 0.8666667, 1,
-0.1081197, -0.3520976, -1.735979, 0, 1, 0.8745098, 1,
-0.1069604, -1.343279, -2.07843, 0, 1, 0.8784314, 1,
-0.105135, -0.9949955, -2.852623, 0, 1, 0.8862745, 1,
-0.1031272, 0.1571455, -0.9301313, 0, 1, 0.8901961, 1,
-0.1020098, -0.2647537, -2.010941, 0, 1, 0.8980392, 1,
-0.09928383, -0.6044803, -5.579496, 0, 1, 0.9058824, 1,
-0.09421678, 0.1542888, -0.5409002, 0, 1, 0.9098039, 1,
-0.09371375, 0.2600081, 0.1476022, 0, 1, 0.9176471, 1,
-0.0894493, -1.415753, -4.027452, 0, 1, 0.9215686, 1,
-0.08257246, -1.643581, -2.524768, 0, 1, 0.9294118, 1,
-0.08199118, -1.766109, -3.930358, 0, 1, 0.9333333, 1,
-0.08035759, -1.563537, -3.973943, 0, 1, 0.9411765, 1,
-0.07878664, 0.1293851, -0.9730468, 0, 1, 0.945098, 1,
-0.0771233, -0.129238, -2.502285, 0, 1, 0.9529412, 1,
-0.07614063, 1.565623, -2.944288, 0, 1, 0.9568627, 1,
-0.0737832, 0.7612872, -0.519576, 0, 1, 0.9647059, 1,
-0.07342908, 0.94736, 0.7693766, 0, 1, 0.9686275, 1,
-0.0711372, -0.2790609, -3.563429, 0, 1, 0.9764706, 1,
-0.066648, 0.1147759, -0.147377, 0, 1, 0.9803922, 1,
-0.06133492, 1.503273, -0.5127916, 0, 1, 0.9882353, 1,
-0.05912544, -0.7030715, -3.712032, 0, 1, 0.9921569, 1,
-0.05771365, 1.029844, 0.5086289, 0, 1, 1, 1,
-0.05610413, -1.468333, -4.16044, 0, 0.9921569, 1, 1,
-0.05599292, 0.9277321, -0.5942302, 0, 0.9882353, 1, 1,
-0.05591346, -0.2958435, -1.059534, 0, 0.9803922, 1, 1,
-0.04885623, 1.426565, 1.10608, 0, 0.9764706, 1, 1,
-0.04073404, 0.173063, -1.151977, 0, 0.9686275, 1, 1,
-0.03795866, -0.8097332, -2.585934, 0, 0.9647059, 1, 1,
-0.03582208, -1.638896, -2.974831, 0, 0.9568627, 1, 1,
-0.03444545, 0.2991884, -0.1002808, 0, 0.9529412, 1, 1,
-0.03378294, 0.7570877, -1.322304, 0, 0.945098, 1, 1,
-0.03232149, -0.2571387, -4.23442, 0, 0.9411765, 1, 1,
-0.03127785, 2.847674, 1.576533, 0, 0.9333333, 1, 1,
-0.02964405, -0.7077296, -3.105023, 0, 0.9294118, 1, 1,
-0.02799037, -1.626216, -2.754777, 0, 0.9215686, 1, 1,
-0.02605311, -0.2081309, -3.544005, 0, 0.9176471, 1, 1,
-0.02226667, 0.3286311, -0.6826257, 0, 0.9098039, 1, 1,
-0.02210025, 1.211671, 0.636913, 0, 0.9058824, 1, 1,
-0.01904444, -0.3431279, -1.75859, 0, 0.8980392, 1, 1,
-0.01787706, -2.162707, -2.024999, 0, 0.8901961, 1, 1,
-0.0162085, 1.345083, -0.125856, 0, 0.8862745, 1, 1,
-0.01518852, -2.144347, -1.714383, 0, 0.8784314, 1, 1,
-0.01505889, 0.6758122, -0.5148772, 0, 0.8745098, 1, 1,
-0.01230667, 1.026234, -0.1271699, 0, 0.8666667, 1, 1,
-0.01161126, 2.154922, 0.3902878, 0, 0.8627451, 1, 1,
-0.001764459, 0.7359983, 0.003103881, 0, 0.854902, 1, 1,
-0.0009832421, -0.7271631, -2.322998, 0, 0.8509804, 1, 1,
0.0001064899, 1.051147, 0.4082282, 0, 0.8431373, 1, 1,
0.001221561, 0.4483148, -1.638587, 0, 0.8392157, 1, 1,
0.003158202, -0.4268042, 1.792615, 0, 0.8313726, 1, 1,
0.004765131, 1.901777, -0.593776, 0, 0.827451, 1, 1,
0.01550931, 0.2813489, 1.288534, 0, 0.8196079, 1, 1,
0.01572547, 0.3291329, -1.420222, 0, 0.8156863, 1, 1,
0.01611986, 1.450503, -1.17546, 0, 0.8078431, 1, 1,
0.01928345, -1.392106, 4.321488, 0, 0.8039216, 1, 1,
0.01956483, 0.858766, -0.05488387, 0, 0.7960784, 1, 1,
0.02082384, -0.2813981, 3.334901, 0, 0.7882353, 1, 1,
0.02103218, 0.1450903, 1.978136, 0, 0.7843137, 1, 1,
0.02384401, 1.938496, -0.5232151, 0, 0.7764706, 1, 1,
0.02406318, -0.8986892, 3.965549, 0, 0.772549, 1, 1,
0.02582419, -0.2771698, 2.368762, 0, 0.7647059, 1, 1,
0.02615856, 0.7937111, -1.127353, 0, 0.7607843, 1, 1,
0.02798732, -0.6002499, 2.534099, 0, 0.7529412, 1, 1,
0.03052772, 0.5602398, -0.644206, 0, 0.7490196, 1, 1,
0.03388193, -0.9214925, 0.8836718, 0, 0.7411765, 1, 1,
0.03604862, -0.6927933, 2.432794, 0, 0.7372549, 1, 1,
0.03683894, -0.02576163, 0.8804604, 0, 0.7294118, 1, 1,
0.03867278, -0.0688137, 3.265447, 0, 0.7254902, 1, 1,
0.04014295, -2.835718, 5.208009, 0, 0.7176471, 1, 1,
0.04364508, -2.759481, 3.259444, 0, 0.7137255, 1, 1,
0.047072, 1.449705, 0.5870897, 0, 0.7058824, 1, 1,
0.05465127, 0.772997, -0.8661057, 0, 0.6980392, 1, 1,
0.05565353, -0.9314312, 2.350582, 0, 0.6941177, 1, 1,
0.06216823, -0.07363603, 3.280043, 0, 0.6862745, 1, 1,
0.06986021, -1.084279, 4.176874, 0, 0.682353, 1, 1,
0.07143358, 0.2134908, 0.8052799, 0, 0.6745098, 1, 1,
0.0729301, 0.337696, 0.9115176, 0, 0.6705883, 1, 1,
0.08176888, -0.3951257, 2.447217, 0, 0.6627451, 1, 1,
0.08773915, -1.067596, 4.24975, 0, 0.6588235, 1, 1,
0.09046515, -0.8492468, 2.196963, 0, 0.6509804, 1, 1,
0.09176047, 0.4353136, 0.706158, 0, 0.6470588, 1, 1,
0.09576201, -0.2449283, 2.131314, 0, 0.6392157, 1, 1,
0.09578396, -0.6301074, 2.628336, 0, 0.6352941, 1, 1,
0.0973253, -0.8221446, 3.283498, 0, 0.627451, 1, 1,
0.1002986, -0.05986115, 3.808865, 0, 0.6235294, 1, 1,
0.1026939, -0.194691, 3.17353, 0, 0.6156863, 1, 1,
0.1048772, -1.215571, 0.8796898, 0, 0.6117647, 1, 1,
0.1091687, -0.1931892, 1.84271, 0, 0.6039216, 1, 1,
0.1105385, 1.042894, -0.4333065, 0, 0.5960785, 1, 1,
0.1119924, 1.231906, 0.1186431, 0, 0.5921569, 1, 1,
0.1139375, -1.894711, 2.519108, 0, 0.5843138, 1, 1,
0.1148247, 0.6693827, 0.189173, 0, 0.5803922, 1, 1,
0.1179809, 0.5621818, 1.203524, 0, 0.572549, 1, 1,
0.1199477, 0.581013, 1.746588, 0, 0.5686275, 1, 1,
0.1211101, -0.6849591, 3.992862, 0, 0.5607843, 1, 1,
0.1255786, 0.4320738, -0.9457681, 0, 0.5568628, 1, 1,
0.1328988, -1.577237, 5.214215, 0, 0.5490196, 1, 1,
0.1345246, -1.643112, 3.743994, 0, 0.5450981, 1, 1,
0.1345624, 0.1901358, 0.3847527, 0, 0.5372549, 1, 1,
0.1450251, -0.2072681, 2.50384, 0, 0.5333334, 1, 1,
0.1455637, -1.474929, 1.950167, 0, 0.5254902, 1, 1,
0.1472282, 1.839246, -0.9474728, 0, 0.5215687, 1, 1,
0.1473516, -0.108155, 2.29654, 0, 0.5137255, 1, 1,
0.1489294, 0.9423989, 1.245789, 0, 0.509804, 1, 1,
0.1527926, -1.114458, 2.142746, 0, 0.5019608, 1, 1,
0.1588126, 0.9715928, 1.569412, 0, 0.4941176, 1, 1,
0.1625165, -1.506948, 3.98375, 0, 0.4901961, 1, 1,
0.1638742, 0.1401959, -0.2458537, 0, 0.4823529, 1, 1,
0.1691091, -0.5033138, 2.198835, 0, 0.4784314, 1, 1,
0.1697083, -0.5731302, 1.879254, 0, 0.4705882, 1, 1,
0.1701668, -0.6640106, 3.05766, 0, 0.4666667, 1, 1,
0.1720924, -1.489337, 3.834147, 0, 0.4588235, 1, 1,
0.1745874, 0.007843131, 0.4898994, 0, 0.454902, 1, 1,
0.1818118, -2.059291, 3.447437, 0, 0.4470588, 1, 1,
0.1847382, -1.210865, 2.967299, 0, 0.4431373, 1, 1,
0.1945739, 0.0801807, 2.098075, 0, 0.4352941, 1, 1,
0.1982931, 0.1894162, 1.577369, 0, 0.4313726, 1, 1,
0.1985623, -0.5629048, 0.8965231, 0, 0.4235294, 1, 1,
0.2014293, -0.6108956, 3.274805, 0, 0.4196078, 1, 1,
0.2026084, -1.66758, 3.124579, 0, 0.4117647, 1, 1,
0.2065266, 0.655666, -0.2842815, 0, 0.4078431, 1, 1,
0.207102, 1.046336, 0.8682549, 0, 0.4, 1, 1,
0.2089281, -0.02354146, 1.097332, 0, 0.3921569, 1, 1,
0.2089307, 1.554087, 0.5586942, 0, 0.3882353, 1, 1,
0.2098271, -1.041983, 4.514741, 0, 0.3803922, 1, 1,
0.2105165, -0.4934274, 1.148435, 0, 0.3764706, 1, 1,
0.2175496, -1.327165, 2.129064, 0, 0.3686275, 1, 1,
0.2188078, 1.107952, 0.8822469, 0, 0.3647059, 1, 1,
0.2226834, 0.8571573, 0.6456722, 0, 0.3568628, 1, 1,
0.2247935, 0.5485592, 0.5022381, 0, 0.3529412, 1, 1,
0.2260513, 0.6823815, -1.345841, 0, 0.345098, 1, 1,
0.2268191, 1.685618, -0.054417, 0, 0.3411765, 1, 1,
0.230228, 0.7522895, 0.05182321, 0, 0.3333333, 1, 1,
0.235109, -1.178461, 4.161723, 0, 0.3294118, 1, 1,
0.2363571, 0.7804286, -0.1706935, 0, 0.3215686, 1, 1,
0.2369478, -0.3219071, 2.331145, 0, 0.3176471, 1, 1,
0.2406554, 0.06959458, 2.873852, 0, 0.3098039, 1, 1,
0.2418073, -0.1030964, 2.006023, 0, 0.3058824, 1, 1,
0.243291, 1.446929, 2.330814, 0, 0.2980392, 1, 1,
0.2501324, 0.9111043, -0.2342154, 0, 0.2901961, 1, 1,
0.2511056, -1.135868, 2.60631, 0, 0.2862745, 1, 1,
0.251554, 2.079645, 0.09694475, 0, 0.2784314, 1, 1,
0.2587233, -1.539268, 1.939149, 0, 0.2745098, 1, 1,
0.2657907, -0.2423852, 2.991225, 0, 0.2666667, 1, 1,
0.2667825, 1.522431, 1.358041, 0, 0.2627451, 1, 1,
0.2692223, -1.015066, 1.420885, 0, 0.254902, 1, 1,
0.2701964, 0.2350318, 0.9677508, 0, 0.2509804, 1, 1,
0.2787756, 0.135577, 0.8728073, 0, 0.2431373, 1, 1,
0.2815175, 0.7372844, -1.180981, 0, 0.2392157, 1, 1,
0.2822284, -0.2472694, 2.284822, 0, 0.2313726, 1, 1,
0.2880118, 0.5104803, -0.1687618, 0, 0.227451, 1, 1,
0.2904054, 0.6886434, -0.6524585, 0, 0.2196078, 1, 1,
0.2921214, -0.9993364, 2.7705, 0, 0.2156863, 1, 1,
0.292274, 0.4418887, 2.794717, 0, 0.2078431, 1, 1,
0.2937194, 1.169494, -0.6790974, 0, 0.2039216, 1, 1,
0.2951497, -0.2991649, 2.768762, 0, 0.1960784, 1, 1,
0.2971665, 1.032024, 0.8679459, 0, 0.1882353, 1, 1,
0.2973325, 0.2591273, 0.5820998, 0, 0.1843137, 1, 1,
0.2988409, -0.3525156, 2.794061, 0, 0.1764706, 1, 1,
0.3022747, 0.6358488, -0.3688755, 0, 0.172549, 1, 1,
0.3034259, 0.3616872, -0.02990795, 0, 0.1647059, 1, 1,
0.3064128, -0.3856481, 1.837933, 0, 0.1607843, 1, 1,
0.308025, 0.4887568, -0.1013827, 0, 0.1529412, 1, 1,
0.3088426, 0.1440194, 2.062666, 0, 0.1490196, 1, 1,
0.3092365, 0.4638327, -0.3521746, 0, 0.1411765, 1, 1,
0.3155879, -2.691748, 3.258198, 0, 0.1372549, 1, 1,
0.31738, -0.3209569, 1.95069, 0, 0.1294118, 1, 1,
0.3194349, -0.3002506, 1.822299, 0, 0.1254902, 1, 1,
0.3242014, -1.636053, 3.095441, 0, 0.1176471, 1, 1,
0.3247558, -0.9430841, 2.103678, 0, 0.1137255, 1, 1,
0.3275873, 0.1167511, 0.3100264, 0, 0.1058824, 1, 1,
0.3308275, 0.2094091, 1.758797, 0, 0.09803922, 1, 1,
0.3314975, 0.3513866, 2.615116, 0, 0.09411765, 1, 1,
0.3320913, -0.651855, 3.897581, 0, 0.08627451, 1, 1,
0.3325384, -1.619872, 3.209428, 0, 0.08235294, 1, 1,
0.3330691, -1.447534, 5.052602, 0, 0.07450981, 1, 1,
0.3361714, 1.167549, -1.383271, 0, 0.07058824, 1, 1,
0.3407336, -0.5622671, 2.918513, 0, 0.0627451, 1, 1,
0.3414123, -0.5933138, 1.581017, 0, 0.05882353, 1, 1,
0.3460962, 0.09805343, 1.795652, 0, 0.05098039, 1, 1,
0.3470265, 1.123272, 0.2865669, 0, 0.04705882, 1, 1,
0.3591262, -1.342337, 3.139827, 0, 0.03921569, 1, 1,
0.3641106, -0.8246231, 0.9539352, 0, 0.03529412, 1, 1,
0.3660105, -1.640124, 2.060279, 0, 0.02745098, 1, 1,
0.3698678, -1.072998, 4.638514, 0, 0.02352941, 1, 1,
0.3735981, 0.8662532, -0.3009803, 0, 0.01568628, 1, 1,
0.3773911, -0.6074144, 2.945263, 0, 0.01176471, 1, 1,
0.3795116, -1.656822, 1.642301, 0, 0.003921569, 1, 1,
0.3856864, 1.397038, 0.3063133, 0.003921569, 0, 1, 1,
0.3884449, -1.811985, 4.490958, 0.007843138, 0, 1, 1,
0.3917347, 0.08097756, 2.162455, 0.01568628, 0, 1, 1,
0.3944255, 0.1254191, 0.3947802, 0.01960784, 0, 1, 1,
0.399577, -1.029985, 2.446561, 0.02745098, 0, 1, 1,
0.4030409, -0.05006619, 0.9851852, 0.03137255, 0, 1, 1,
0.4089291, 0.3834356, -0.3051239, 0.03921569, 0, 1, 1,
0.4104688, -0.609952, 2.521149, 0.04313726, 0, 1, 1,
0.410603, -0.4419065, -0.1575116, 0.05098039, 0, 1, 1,
0.4127544, -0.8317232, 2.538121, 0.05490196, 0, 1, 1,
0.4136897, 1.472985, 0.8768799, 0.0627451, 0, 1, 1,
0.413789, -0.4337054, 2.962969, 0.06666667, 0, 1, 1,
0.4216262, -0.2236151, 1.768445, 0.07450981, 0, 1, 1,
0.4233016, 1.179982, 0.5982863, 0.07843138, 0, 1, 1,
0.4256797, 0.4587052, 1.077145, 0.08627451, 0, 1, 1,
0.4276513, 1.070413, -0.9330724, 0.09019608, 0, 1, 1,
0.4299227, -1.509684, 2.614811, 0.09803922, 0, 1, 1,
0.433438, 2.644457, 0.5821727, 0.1058824, 0, 1, 1,
0.4373351, -0.4631435, 2.158543, 0.1098039, 0, 1, 1,
0.4417039, 0.6391463, 1.630126, 0.1176471, 0, 1, 1,
0.4431962, 1.137628, -0.006206092, 0.1215686, 0, 1, 1,
0.444592, -1.984751, 4.336948, 0.1294118, 0, 1, 1,
0.4466556, 0.3416006, 1.920117, 0.1333333, 0, 1, 1,
0.4471082, 0.1907831, 2.973452, 0.1411765, 0, 1, 1,
0.4501741, 0.5189392, 0.193542, 0.145098, 0, 1, 1,
0.4541561, 0.1837422, 1.55402, 0.1529412, 0, 1, 1,
0.454609, -0.8668219, 3.013705, 0.1568628, 0, 1, 1,
0.4563795, 0.1688242, 1.696407, 0.1647059, 0, 1, 1,
0.4572087, -0.03036672, 1.361374, 0.1686275, 0, 1, 1,
0.4578424, -0.4456177, 2.822134, 0.1764706, 0, 1, 1,
0.4602964, 0.6398223, -0.3450671, 0.1803922, 0, 1, 1,
0.4612318, 0.3539491, 1.399226, 0.1882353, 0, 1, 1,
0.4680934, 0.2872068, 2.175246, 0.1921569, 0, 1, 1,
0.4684835, -0.4327859, 2.518239, 0.2, 0, 1, 1,
0.4716518, 0.4815062, 2.290948, 0.2078431, 0, 1, 1,
0.472096, 0.7817668, -0.04495358, 0.2117647, 0, 1, 1,
0.4728359, 1.657071, 0.3873865, 0.2196078, 0, 1, 1,
0.473282, -0.3048283, 2.572128, 0.2235294, 0, 1, 1,
0.4782995, 1.050748, 1.950527, 0.2313726, 0, 1, 1,
0.4823114, 0.5478517, 0.5621244, 0.2352941, 0, 1, 1,
0.4824831, 1.843328, -1.102054, 0.2431373, 0, 1, 1,
0.4833298, 0.7445012, 1.191933, 0.2470588, 0, 1, 1,
0.484403, 0.5532466, 1.262608, 0.254902, 0, 1, 1,
0.4857813, 0.6313267, 1.359926, 0.2588235, 0, 1, 1,
0.4887662, -0.4051524, 2.453071, 0.2666667, 0, 1, 1,
0.4897657, -0.2818748, -0.01484894, 0.2705882, 0, 1, 1,
0.4931428, 0.2334369, 1.683838, 0.2784314, 0, 1, 1,
0.4931906, -0.5733554, 1.999533, 0.282353, 0, 1, 1,
0.4947917, 1.026915, 0.5681373, 0.2901961, 0, 1, 1,
0.4968573, -1.014619, 1.471337, 0.2941177, 0, 1, 1,
0.5018468, -0.8091873, 3.33542, 0.3019608, 0, 1, 1,
0.5059166, -1.927182, 2.998353, 0.3098039, 0, 1, 1,
0.5070142, -0.8103642, 1.657326, 0.3137255, 0, 1, 1,
0.5084829, 1.331922, 0.6049275, 0.3215686, 0, 1, 1,
0.5100413, -1.57411, 3.788472, 0.3254902, 0, 1, 1,
0.513916, -0.1675364, 2.587563, 0.3333333, 0, 1, 1,
0.5186751, -0.8199964, 2.272727, 0.3372549, 0, 1, 1,
0.5234634, -0.8175739, 3.366865, 0.345098, 0, 1, 1,
0.5272087, -0.408504, 1.654096, 0.3490196, 0, 1, 1,
0.5274342, 0.2284732, 2.612765, 0.3568628, 0, 1, 1,
0.530201, 1.035059, -0.5209916, 0.3607843, 0, 1, 1,
0.5319432, -0.7927992, 1.345442, 0.3686275, 0, 1, 1,
0.5330051, -0.5332245, 0.7583213, 0.372549, 0, 1, 1,
0.5381826, -0.8601491, 3.029883, 0.3803922, 0, 1, 1,
0.5411, -0.7829443, 1.36092, 0.3843137, 0, 1, 1,
0.5426761, 1.373874, 2.337984, 0.3921569, 0, 1, 1,
0.5427912, -1.612597, 3.95372, 0.3960784, 0, 1, 1,
0.5438552, -1.053372, 1.729312, 0.4039216, 0, 1, 1,
0.5444678, 0.6269677, 0.4417475, 0.4117647, 0, 1, 1,
0.550132, -0.9193254, 3.16924, 0.4156863, 0, 1, 1,
0.5603931, 1.697698, 0.2087863, 0.4235294, 0, 1, 1,
0.5640557, -1.032364, 3.153256, 0.427451, 0, 1, 1,
0.568795, 1.22115, -0.001210972, 0.4352941, 0, 1, 1,
0.5688526, -0.2777649, 1.428636, 0.4392157, 0, 1, 1,
0.580487, -0.3659841, 1.168549, 0.4470588, 0, 1, 1,
0.5808864, 1.005848, -0.3182539, 0.4509804, 0, 1, 1,
0.5809194, 0.3530815, 0.7355792, 0.4588235, 0, 1, 1,
0.5834503, 0.3841659, -0.7397484, 0.4627451, 0, 1, 1,
0.5863585, 2.675299, -1.962451, 0.4705882, 0, 1, 1,
0.5933332, 0.5857757, 1.6826, 0.4745098, 0, 1, 1,
0.5961025, -1.165282, 0.5935445, 0.4823529, 0, 1, 1,
0.5977089, 2.059282, 1.156836, 0.4862745, 0, 1, 1,
0.6000431, 1.550341, 0.08541903, 0.4941176, 0, 1, 1,
0.6048018, -2.252131, 2.59966, 0.5019608, 0, 1, 1,
0.6103349, -0.4800487, 1.011844, 0.5058824, 0, 1, 1,
0.6148312, 0.9973344, 0.0393146, 0.5137255, 0, 1, 1,
0.6214388, -0.5827858, 1.5547, 0.5176471, 0, 1, 1,
0.6219741, -0.4096811, 1.289338, 0.5254902, 0, 1, 1,
0.6310261, -1.055384, 3.265579, 0.5294118, 0, 1, 1,
0.6349999, 0.9096487, 1.829031, 0.5372549, 0, 1, 1,
0.6352772, -0.8532801, 3.331414, 0.5411765, 0, 1, 1,
0.6360078, -1.464447, 2.635489, 0.5490196, 0, 1, 1,
0.6388599, 1.278715, -0.452567, 0.5529412, 0, 1, 1,
0.6405032, 0.2699743, 1.22926, 0.5607843, 0, 1, 1,
0.6546398, -0.1104467, 0.5383314, 0.5647059, 0, 1, 1,
0.6633963, -1.339115, 2.767295, 0.572549, 0, 1, 1,
0.6668219, -0.4119379, 2.259896, 0.5764706, 0, 1, 1,
0.6688251, -0.6418684, 0.6249072, 0.5843138, 0, 1, 1,
0.6706259, -0.3053871, 1.255037, 0.5882353, 0, 1, 1,
0.6724974, -2.33388, 3.242709, 0.5960785, 0, 1, 1,
0.6763531, -1.682681, 2.199011, 0.6039216, 0, 1, 1,
0.6808975, 0.2275223, 0.6143751, 0.6078432, 0, 1, 1,
0.6810447, 0.03533199, 0.7562704, 0.6156863, 0, 1, 1,
0.6830785, -0.5986784, 2.733391, 0.6196079, 0, 1, 1,
0.6867726, -0.6075909, 2.01623, 0.627451, 0, 1, 1,
0.6881364, 1.28391, 0.9311354, 0.6313726, 0, 1, 1,
0.6942834, -0.848848, 4.186072, 0.6392157, 0, 1, 1,
0.6955318, -0.3777514, 2.399899, 0.6431373, 0, 1, 1,
0.6972014, 0.03789786, 1.925451, 0.6509804, 0, 1, 1,
0.7062664, 0.5305522, -0.8262524, 0.654902, 0, 1, 1,
0.7067553, -0.02215724, -0.6748192, 0.6627451, 0, 1, 1,
0.713605, 1.095842, 0.7940361, 0.6666667, 0, 1, 1,
0.7137648, -1.152674, 2.440846, 0.6745098, 0, 1, 1,
0.7143131, 1.150785, 1.257216, 0.6784314, 0, 1, 1,
0.7145212, 1.347772, -0.7096083, 0.6862745, 0, 1, 1,
0.7185375, -2.364839, 3.545867, 0.6901961, 0, 1, 1,
0.7277707, 2.016724, -0.7234168, 0.6980392, 0, 1, 1,
0.7311172, -0.3179345, 3.025362, 0.7058824, 0, 1, 1,
0.7327244, 0.1070841, 1.845072, 0.7098039, 0, 1, 1,
0.7364714, -0.6236961, 1.046039, 0.7176471, 0, 1, 1,
0.7370639, -1.58809, 1.564573, 0.7215686, 0, 1, 1,
0.7394097, 1.053234, 0.8352225, 0.7294118, 0, 1, 1,
0.7395778, 0.1635869, 2.024064, 0.7333333, 0, 1, 1,
0.7429072, -3.048614, 5.116972, 0.7411765, 0, 1, 1,
0.7444451, 0.3114348, 0.5934561, 0.7450981, 0, 1, 1,
0.7483082, -0.05170874, 2.75709, 0.7529412, 0, 1, 1,
0.7498131, -0.1842386, 0.9513566, 0.7568628, 0, 1, 1,
0.7538152, 1.294299, 1.686857, 0.7647059, 0, 1, 1,
0.7555254, -0.2754428, 1.431677, 0.7686275, 0, 1, 1,
0.7650945, -2.45505, 1.557621, 0.7764706, 0, 1, 1,
0.7767122, -0.8526116, 3.676119, 0.7803922, 0, 1, 1,
0.7802389, -1.416991, 3.815105, 0.7882353, 0, 1, 1,
0.7807702, 1.140707, 0.5299422, 0.7921569, 0, 1, 1,
0.7898104, -1.351182, 4.018904, 0.8, 0, 1, 1,
0.796541, -0.8644805, 3.423874, 0.8078431, 0, 1, 1,
0.8045753, 1.898305, 0.5302981, 0.8117647, 0, 1, 1,
0.8090548, 1.400483, 1.484098, 0.8196079, 0, 1, 1,
0.8118039, -0.04177386, 1.968223, 0.8235294, 0, 1, 1,
0.8119802, -0.6958843, 2.151114, 0.8313726, 0, 1, 1,
0.818061, 0.2174544, 2.808636, 0.8352941, 0, 1, 1,
0.8196485, -1.245955, 3.860246, 0.8431373, 0, 1, 1,
0.8207951, 3.038895, -0.7873832, 0.8470588, 0, 1, 1,
0.8218122, 0.4373704, 1.784327, 0.854902, 0, 1, 1,
0.8285227, 0.2571962, 0.783527, 0.8588235, 0, 1, 1,
0.8302206, 1.334163, 1.023562, 0.8666667, 0, 1, 1,
0.8318288, -0.2361312, 0.8462859, 0.8705882, 0, 1, 1,
0.8325654, -0.2119686, 2.346535, 0.8784314, 0, 1, 1,
0.8349944, 0.05286028, 1.528154, 0.8823529, 0, 1, 1,
0.8360361, 1.134992, -0.266765, 0.8901961, 0, 1, 1,
0.8410414, 0.5439084, 0.9963491, 0.8941177, 0, 1, 1,
0.8425882, 0.280745, 0.8972695, 0.9019608, 0, 1, 1,
0.8432905, -1.038737, 2.455387, 0.9098039, 0, 1, 1,
0.8444346, 1.220422, 1.97337, 0.9137255, 0, 1, 1,
0.8484643, -0.6318913, 1.513728, 0.9215686, 0, 1, 1,
0.8499652, -0.8164383, 1.441572, 0.9254902, 0, 1, 1,
0.8522227, -0.1780998, 2.707794, 0.9333333, 0, 1, 1,
0.8522601, 0.726695, 1.199566, 0.9372549, 0, 1, 1,
0.8533663, 0.4683568, 2.379438, 0.945098, 0, 1, 1,
0.8556126, -0.32581, 3.687839, 0.9490196, 0, 1, 1,
0.8567048, 1.079645, 0.2306987, 0.9568627, 0, 1, 1,
0.8568626, -0.5540147, 1.607114, 0.9607843, 0, 1, 1,
0.857949, -0.6703259, 0.8564559, 0.9686275, 0, 1, 1,
0.8618878, 1.082519, 1.749507, 0.972549, 0, 1, 1,
0.8635575, -0.2943786, 3.410635, 0.9803922, 0, 1, 1,
0.8636453, 0.2805461, 1.761583, 0.9843137, 0, 1, 1,
0.8659626, 2.128654, 0.2489479, 0.9921569, 0, 1, 1,
0.872917, 1.146576, 0.7035131, 0.9960784, 0, 1, 1,
0.8742168, 0.6173512, 1.639219, 1, 0, 0.9960784, 1,
0.8763983, 0.939204, 0.09223211, 1, 0, 0.9882353, 1,
0.8772609, -0.1296092, 2.300128, 1, 0, 0.9843137, 1,
0.8840348, 0.777203, 0.1431852, 1, 0, 0.9764706, 1,
0.8863156, 0.272954, 0.6542594, 1, 0, 0.972549, 1,
0.8906547, -1.0838, 3.41205, 1, 0, 0.9647059, 1,
0.8920338, 0.1954546, 3.565064, 1, 0, 0.9607843, 1,
0.89377, 0.05571958, 2.599302, 1, 0, 0.9529412, 1,
0.8948894, -1.064026, 2.856118, 1, 0, 0.9490196, 1,
0.8963628, 1.783823, -0.1011484, 1, 0, 0.9411765, 1,
0.8997486, 1.575227, -0.2688748, 1, 0, 0.9372549, 1,
0.9020206, 0.1940553, 1.845185, 1, 0, 0.9294118, 1,
0.9097961, -0.3850594, 1.41447, 1, 0, 0.9254902, 1,
0.9101078, 0.3829716, 0.4693793, 1, 0, 0.9176471, 1,
0.9138972, 0.8897546, -0.6358076, 1, 0, 0.9137255, 1,
0.925087, 0.1993313, 1.662478, 1, 0, 0.9058824, 1,
0.9340874, -1.159196, 1.022827, 1, 0, 0.9019608, 1,
0.9395969, -0.2253769, 1.10916, 1, 0, 0.8941177, 1,
0.9407468, 0.1718261, 1.453582, 1, 0, 0.8862745, 1,
0.9434898, 1.399768, 0.236611, 1, 0, 0.8823529, 1,
0.9493166, 0.8961859, -0.9514459, 1, 0, 0.8745098, 1,
0.9646112, 0.8135119, 1.608309, 1, 0, 0.8705882, 1,
0.9732885, 0.1594489, 0.8845986, 1, 0, 0.8627451, 1,
0.9744467, 0.8781281, 0.01599997, 1, 0, 0.8588235, 1,
0.9880322, -1.714814, 2.932698, 1, 0, 0.8509804, 1,
0.9942304, -0.8826359, 2.285086, 1, 0, 0.8470588, 1,
0.9971938, 0.81501, 1.01853, 1, 0, 0.8392157, 1,
0.9972256, 0.06134356, 2.217679, 1, 0, 0.8352941, 1,
1.002382, 0.3731581, 0.5413278, 1, 0, 0.827451, 1,
1.005148, 1.026583, -1.267884, 1, 0, 0.8235294, 1,
1.005333, -0.265303, 2.50068, 1, 0, 0.8156863, 1,
1.006453, -0.8551528, 1.72684, 1, 0, 0.8117647, 1,
1.011741, 0.6895576, -0.1416934, 1, 0, 0.8039216, 1,
1.017223, 0.3252979, 0.4489281, 1, 0, 0.7960784, 1,
1.027526, -0.1263877, 0.6080823, 1, 0, 0.7921569, 1,
1.03581, -0.4485422, 2.7949, 1, 0, 0.7843137, 1,
1.044433, -0.785839, 2.189962, 1, 0, 0.7803922, 1,
1.045956, 0.8497612, 0.8895004, 1, 0, 0.772549, 1,
1.048673, 0.01436902, 1.307846, 1, 0, 0.7686275, 1,
1.051723, -0.4890414, 1.962805, 1, 0, 0.7607843, 1,
1.054445, 1.364887, 1.827596, 1, 0, 0.7568628, 1,
1.055414, -1.164744, 0.1340117, 1, 0, 0.7490196, 1,
1.063945, 0.2739147, 1.457321, 1, 0, 0.7450981, 1,
1.071796, 0.007627791, 0.2476214, 1, 0, 0.7372549, 1,
1.074774, -1.067077, 2.73357, 1, 0, 0.7333333, 1,
1.079181, 0.1356763, 1.445006, 1, 0, 0.7254902, 1,
1.081922, 0.7466013, 0.1592344, 1, 0, 0.7215686, 1,
1.087339, -1.673989, 3.978237, 1, 0, 0.7137255, 1,
1.08739, -1.165655, 0.4225262, 1, 0, 0.7098039, 1,
1.09449, -0.332698, 2.521085, 1, 0, 0.7019608, 1,
1.097136, 1.102196, 0.2651315, 1, 0, 0.6941177, 1,
1.10125, -0.5823788, 1.689569, 1, 0, 0.6901961, 1,
1.101762, -1.542555, 3.570329, 1, 0, 0.682353, 1,
1.102358, 1.705531, -0.9557095, 1, 0, 0.6784314, 1,
1.103268, -0.3141907, 1.965613, 1, 0, 0.6705883, 1,
1.110208, -0.05059692, 2.285764, 1, 0, 0.6666667, 1,
1.114224, 0.5544214, 1.850608, 1, 0, 0.6588235, 1,
1.121445, 1.438014, -0.457638, 1, 0, 0.654902, 1,
1.127142, 0.9106659, 1.122649, 1, 0, 0.6470588, 1,
1.127168, -1.034317, 0.6871588, 1, 0, 0.6431373, 1,
1.13348, 0.4643275, 1.391075, 1, 0, 0.6352941, 1,
1.143366, 1.55227, -0.05533602, 1, 0, 0.6313726, 1,
1.151906, -1.344124, 1.800149, 1, 0, 0.6235294, 1,
1.152674, -0.3411042, 1.905544, 1, 0, 0.6196079, 1,
1.154519, 1.988103, -0.2833672, 1, 0, 0.6117647, 1,
1.155414, -0.3374318, 0.4380364, 1, 0, 0.6078432, 1,
1.159043, -1.084425, 2.023935, 1, 0, 0.6, 1,
1.16458, 0.2621661, 0.752397, 1, 0, 0.5921569, 1,
1.167804, 0.2693296, 1.388535, 1, 0, 0.5882353, 1,
1.175848, 0.3137919, 0.782869, 1, 0, 0.5803922, 1,
1.2245, -0.007490376, 1.244829, 1, 0, 0.5764706, 1,
1.225579, 0.6236634, 0.4110601, 1, 0, 0.5686275, 1,
1.229991, 0.4528867, 0.5052163, 1, 0, 0.5647059, 1,
1.237396, 0.223376, 2.396064, 1, 0, 0.5568628, 1,
1.270324, -0.2111328, 1.896853, 1, 0, 0.5529412, 1,
1.271835, -0.1829298, 1.341801, 1, 0, 0.5450981, 1,
1.273173, -1.177214, 1.196766, 1, 0, 0.5411765, 1,
1.276809, -0.3630851, 2.734375, 1, 0, 0.5333334, 1,
1.28124, -1.234266, 2.791886, 1, 0, 0.5294118, 1,
1.286247, 0.6200562, -1.985347, 1, 0, 0.5215687, 1,
1.301685, -1.448446, 2.894094, 1, 0, 0.5176471, 1,
1.303504, -1.055943, 1.871848, 1, 0, 0.509804, 1,
1.307196, -1.335877, 2.22943, 1, 0, 0.5058824, 1,
1.32407, 0.6212841, 3.516786, 1, 0, 0.4980392, 1,
1.341977, 0.670399, 0.9082944, 1, 0, 0.4901961, 1,
1.344735, -0.8346815, 3.049005, 1, 0, 0.4862745, 1,
1.350042, -0.39259, 1.479157, 1, 0, 0.4784314, 1,
1.373611, -1.566308, 1.263869, 1, 0, 0.4745098, 1,
1.37953, -0.2333677, 0.9903082, 1, 0, 0.4666667, 1,
1.381853, 0.08611878, -0.4699512, 1, 0, 0.4627451, 1,
1.384843, -0.2213126, 1.332255, 1, 0, 0.454902, 1,
1.387189, 0.2918448, 2.62799, 1, 0, 0.4509804, 1,
1.387192, -1.041239, 1.038283, 1, 0, 0.4431373, 1,
1.390748, 0.05170962, 0.9523802, 1, 0, 0.4392157, 1,
1.394705, 0.3134222, 2.052162, 1, 0, 0.4313726, 1,
1.398193, 1.247352, 1.366908, 1, 0, 0.427451, 1,
1.404204, 0.2433284, 0.3501271, 1, 0, 0.4196078, 1,
1.418754, 0.6172411, -0.1007895, 1, 0, 0.4156863, 1,
1.421395, -2.056311, 2.901591, 1, 0, 0.4078431, 1,
1.44036, -0.8420315, 1.538699, 1, 0, 0.4039216, 1,
1.449738, -2.077106, 1.166929, 1, 0, 0.3960784, 1,
1.450627, 1.49578, 0.4008101, 1, 0, 0.3882353, 1,
1.456407, 0.5591497, 1.858803, 1, 0, 0.3843137, 1,
1.459217, -1.320069, 2.464157, 1, 0, 0.3764706, 1,
1.464876, -0.3778592, 1.715135, 1, 0, 0.372549, 1,
1.468635, -1.599297, 1.99506, 1, 0, 0.3647059, 1,
1.469057, -0.08989638, 1.824851, 1, 0, 0.3607843, 1,
1.485598, 0.1315454, 1.263755, 1, 0, 0.3529412, 1,
1.48776, -1.043387, 0.1504317, 1, 0, 0.3490196, 1,
1.49944, -0.387539, 2.353496, 1, 0, 0.3411765, 1,
1.506735, 0.2664894, 1.276915, 1, 0, 0.3372549, 1,
1.510236, -2.288495, 3.513242, 1, 0, 0.3294118, 1,
1.51156, 0.7891003, -0.797298, 1, 0, 0.3254902, 1,
1.513914, 1.214839, 0.8107533, 1, 0, 0.3176471, 1,
1.533123, -0.9227596, 3.134685, 1, 0, 0.3137255, 1,
1.534254, -0.003356108, -0.2621777, 1, 0, 0.3058824, 1,
1.535014, -1.094948, 2.132012, 1, 0, 0.2980392, 1,
1.543312, 0.7226948, 0.8288146, 1, 0, 0.2941177, 1,
1.55173, -0.6833349, 1.688107, 1, 0, 0.2862745, 1,
1.60483, 0.8218685, 3.249387, 1, 0, 0.282353, 1,
1.605791, 0.9418539, -0.208974, 1, 0, 0.2745098, 1,
1.608407, 1.358289, 0.1210335, 1, 0, 0.2705882, 1,
1.61018, -1.351797, 2.244857, 1, 0, 0.2627451, 1,
1.616923, -0.5655013, 2.100684, 1, 0, 0.2588235, 1,
1.619025, -1.063608, 1.514317, 1, 0, 0.2509804, 1,
1.622291, -0.6489412, 1.294688, 1, 0, 0.2470588, 1,
1.624346, -0.1262183, 2.87354, 1, 0, 0.2392157, 1,
1.635083, 0.6762118, -0.6783127, 1, 0, 0.2352941, 1,
1.708374, 2.05962, -0.4966435, 1, 0, 0.227451, 1,
1.723048, 2.267023, 0.2127866, 1, 0, 0.2235294, 1,
1.724037, -1.64325, 1.850567, 1, 0, 0.2156863, 1,
1.726061, 1.623614, 0.8012149, 1, 0, 0.2117647, 1,
1.742776, 1.252547, 2.499023, 1, 0, 0.2039216, 1,
1.760546, -1.287242, 3.763316, 1, 0, 0.1960784, 1,
1.790892, -0.1580902, 2.025198, 1, 0, 0.1921569, 1,
1.821262, 0.3163697, 0.8340316, 1, 0, 0.1843137, 1,
1.824663, 1.041697, 1.413742, 1, 0, 0.1803922, 1,
1.832295, 0.08550575, 1.685913, 1, 0, 0.172549, 1,
1.850794, 0.1515564, 1.566543, 1, 0, 0.1686275, 1,
1.862255, 1.277887, 2.28782, 1, 0, 0.1607843, 1,
1.911685, 0.5239775, 0.2682142, 1, 0, 0.1568628, 1,
1.935611, -1.026126, 2.450667, 1, 0, 0.1490196, 1,
1.935891, 1.476008, 0.9328683, 1, 0, 0.145098, 1,
2.022337, 0.05381963, -0.03793908, 1, 0, 0.1372549, 1,
2.034105, -0.7369189, 1.715316, 1, 0, 0.1333333, 1,
2.03819, -0.9771673, 3.32346, 1, 0, 0.1254902, 1,
2.038728, 1.404226, 1.678638, 1, 0, 0.1215686, 1,
2.040781, 0.01081066, -0.3946692, 1, 0, 0.1137255, 1,
2.073497, 0.7475607, 2.357835, 1, 0, 0.1098039, 1,
2.132179, -1.758681, 2.941294, 1, 0, 0.1019608, 1,
2.144529, -0.9936728, 1.85913, 1, 0, 0.09411765, 1,
2.153702, 1.07545, -0.5071521, 1, 0, 0.09019608, 1,
2.185218, 1.586231, 1.731024, 1, 0, 0.08235294, 1,
2.253239, 1.096279, 2.379048, 1, 0, 0.07843138, 1,
2.269122, 0.1268946, 3.085717, 1, 0, 0.07058824, 1,
2.341122, -1.318241, 2.032149, 1, 0, 0.06666667, 1,
2.427153, 0.2987343, 1.788884, 1, 0, 0.05882353, 1,
2.436262, 0.8313373, 0.8573385, 1, 0, 0.05490196, 1,
2.457742, -0.9304569, 2.469222, 1, 0, 0.04705882, 1,
2.485567, 0.01800661, 1.467687, 1, 0, 0.04313726, 1,
2.54952, -0.3822784, 2.626376, 1, 0, 0.03529412, 1,
2.591135, 1.890332, 1.992354, 1, 0, 0.03137255, 1,
2.62066, 0.5091916, 1.206409, 1, 0, 0.02352941, 1,
2.62982, 1.108734, 0.1760617, 1, 0, 0.01960784, 1,
2.836544, -1.944129, 0.7971889, 1, 0, 0.01176471, 1,
3.021706, 1.43302, 0.8747899, 1, 0, 0.007843138, 1
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
-0.2103126, -4.39093, -7.40903, 0, -0.5, 0.5, 0.5,
-0.2103126, -4.39093, -7.40903, 1, -0.5, 0.5, 0.5,
-0.2103126, -4.39093, -7.40903, 1, 1.5, 0.5, 0.5,
-0.2103126, -4.39093, -7.40903, 0, 1.5, 0.5, 0.5
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
-4.537986, -0.1164707, -7.40903, 0, -0.5, 0.5, 0.5,
-4.537986, -0.1164707, -7.40903, 1, -0.5, 0.5, 0.5,
-4.537986, -0.1164707, -7.40903, 1, 1.5, 0.5, 0.5,
-4.537986, -0.1164707, -7.40903, 0, 1.5, 0.5, 0.5
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
-4.537986, -4.39093, -0.1826408, 0, -0.5, 0.5, 0.5,
-4.537986, -4.39093, -0.1826408, 1, -0.5, 0.5, 0.5,
-4.537986, -4.39093, -0.1826408, 1, 1.5, 0.5, 0.5,
-4.537986, -4.39093, -0.1826408, 0, 1.5, 0.5, 0.5
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
-3, -3.404516, -5.741402,
3, -3.404516, -5.741402,
-3, -3.404516, -5.741402,
-3, -3.568918, -6.01934,
-2, -3.404516, -5.741402,
-2, -3.568918, -6.01934,
-1, -3.404516, -5.741402,
-1, -3.568918, -6.01934,
0, -3.404516, -5.741402,
0, -3.568918, -6.01934,
1, -3.404516, -5.741402,
1, -3.568918, -6.01934,
2, -3.404516, -5.741402,
2, -3.568918, -6.01934,
3, -3.404516, -5.741402,
3, -3.568918, -6.01934
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
-3, -3.897723, -6.575216, 0, -0.5, 0.5, 0.5,
-3, -3.897723, -6.575216, 1, -0.5, 0.5, 0.5,
-3, -3.897723, -6.575216, 1, 1.5, 0.5, 0.5,
-3, -3.897723, -6.575216, 0, 1.5, 0.5, 0.5,
-2, -3.897723, -6.575216, 0, -0.5, 0.5, 0.5,
-2, -3.897723, -6.575216, 1, -0.5, 0.5, 0.5,
-2, -3.897723, -6.575216, 1, 1.5, 0.5, 0.5,
-2, -3.897723, -6.575216, 0, 1.5, 0.5, 0.5,
-1, -3.897723, -6.575216, 0, -0.5, 0.5, 0.5,
-1, -3.897723, -6.575216, 1, -0.5, 0.5, 0.5,
-1, -3.897723, -6.575216, 1, 1.5, 0.5, 0.5,
-1, -3.897723, -6.575216, 0, 1.5, 0.5, 0.5,
0, -3.897723, -6.575216, 0, -0.5, 0.5, 0.5,
0, -3.897723, -6.575216, 1, -0.5, 0.5, 0.5,
0, -3.897723, -6.575216, 1, 1.5, 0.5, 0.5,
0, -3.897723, -6.575216, 0, 1.5, 0.5, 0.5,
1, -3.897723, -6.575216, 0, -0.5, 0.5, 0.5,
1, -3.897723, -6.575216, 1, -0.5, 0.5, 0.5,
1, -3.897723, -6.575216, 1, 1.5, 0.5, 0.5,
1, -3.897723, -6.575216, 0, 1.5, 0.5, 0.5,
2, -3.897723, -6.575216, 0, -0.5, 0.5, 0.5,
2, -3.897723, -6.575216, 1, -0.5, 0.5, 0.5,
2, -3.897723, -6.575216, 1, 1.5, 0.5, 0.5,
2, -3.897723, -6.575216, 0, 1.5, 0.5, 0.5,
3, -3.897723, -6.575216, 0, -0.5, 0.5, 0.5,
3, -3.897723, -6.575216, 1, -0.5, 0.5, 0.5,
3, -3.897723, -6.575216, 1, 1.5, 0.5, 0.5,
3, -3.897723, -6.575216, 0, 1.5, 0.5, 0.5
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
-3.539292, -3, -5.741402,
-3.539292, 3, -5.741402,
-3.539292, -3, -5.741402,
-3.705741, -3, -6.01934,
-3.539292, -2, -5.741402,
-3.705741, -2, -6.01934,
-3.539292, -1, -5.741402,
-3.705741, -1, -6.01934,
-3.539292, 0, -5.741402,
-3.705741, 0, -6.01934,
-3.539292, 1, -5.741402,
-3.705741, 1, -6.01934,
-3.539292, 2, -5.741402,
-3.705741, 2, -6.01934,
-3.539292, 3, -5.741402,
-3.705741, 3, -6.01934
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
-4.038639, -3, -6.575216, 0, -0.5, 0.5, 0.5,
-4.038639, -3, -6.575216, 1, -0.5, 0.5, 0.5,
-4.038639, -3, -6.575216, 1, 1.5, 0.5, 0.5,
-4.038639, -3, -6.575216, 0, 1.5, 0.5, 0.5,
-4.038639, -2, -6.575216, 0, -0.5, 0.5, 0.5,
-4.038639, -2, -6.575216, 1, -0.5, 0.5, 0.5,
-4.038639, -2, -6.575216, 1, 1.5, 0.5, 0.5,
-4.038639, -2, -6.575216, 0, 1.5, 0.5, 0.5,
-4.038639, -1, -6.575216, 0, -0.5, 0.5, 0.5,
-4.038639, -1, -6.575216, 1, -0.5, 0.5, 0.5,
-4.038639, -1, -6.575216, 1, 1.5, 0.5, 0.5,
-4.038639, -1, -6.575216, 0, 1.5, 0.5, 0.5,
-4.038639, 0, -6.575216, 0, -0.5, 0.5, 0.5,
-4.038639, 0, -6.575216, 1, -0.5, 0.5, 0.5,
-4.038639, 0, -6.575216, 1, 1.5, 0.5, 0.5,
-4.038639, 0, -6.575216, 0, 1.5, 0.5, 0.5,
-4.038639, 1, -6.575216, 0, -0.5, 0.5, 0.5,
-4.038639, 1, -6.575216, 1, -0.5, 0.5, 0.5,
-4.038639, 1, -6.575216, 1, 1.5, 0.5, 0.5,
-4.038639, 1, -6.575216, 0, 1.5, 0.5, 0.5,
-4.038639, 2, -6.575216, 0, -0.5, 0.5, 0.5,
-4.038639, 2, -6.575216, 1, -0.5, 0.5, 0.5,
-4.038639, 2, -6.575216, 1, 1.5, 0.5, 0.5,
-4.038639, 2, -6.575216, 0, 1.5, 0.5, 0.5,
-4.038639, 3, -6.575216, 0, -0.5, 0.5, 0.5,
-4.038639, 3, -6.575216, 1, -0.5, 0.5, 0.5,
-4.038639, 3, -6.575216, 1, 1.5, 0.5, 0.5,
-4.038639, 3, -6.575216, 0, 1.5, 0.5, 0.5
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
-3.539292, -3.404516, -4,
-3.539292, -3.404516, 4,
-3.539292, -3.404516, -4,
-3.705741, -3.568918, -4,
-3.539292, -3.404516, -2,
-3.705741, -3.568918, -2,
-3.539292, -3.404516, 0,
-3.705741, -3.568918, 0,
-3.539292, -3.404516, 2,
-3.705741, -3.568918, 2,
-3.539292, -3.404516, 4,
-3.705741, -3.568918, 4
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
-4.038639, -3.897723, -4, 0, -0.5, 0.5, 0.5,
-4.038639, -3.897723, -4, 1, -0.5, 0.5, 0.5,
-4.038639, -3.897723, -4, 1, 1.5, 0.5, 0.5,
-4.038639, -3.897723, -4, 0, 1.5, 0.5, 0.5,
-4.038639, -3.897723, -2, 0, -0.5, 0.5, 0.5,
-4.038639, -3.897723, -2, 1, -0.5, 0.5, 0.5,
-4.038639, -3.897723, -2, 1, 1.5, 0.5, 0.5,
-4.038639, -3.897723, -2, 0, 1.5, 0.5, 0.5,
-4.038639, -3.897723, 0, 0, -0.5, 0.5, 0.5,
-4.038639, -3.897723, 0, 1, -0.5, 0.5, 0.5,
-4.038639, -3.897723, 0, 1, 1.5, 0.5, 0.5,
-4.038639, -3.897723, 0, 0, 1.5, 0.5, 0.5,
-4.038639, -3.897723, 2, 0, -0.5, 0.5, 0.5,
-4.038639, -3.897723, 2, 1, -0.5, 0.5, 0.5,
-4.038639, -3.897723, 2, 1, 1.5, 0.5, 0.5,
-4.038639, -3.897723, 2, 0, 1.5, 0.5, 0.5,
-4.038639, -3.897723, 4, 0, -0.5, 0.5, 0.5,
-4.038639, -3.897723, 4, 1, -0.5, 0.5, 0.5,
-4.038639, -3.897723, 4, 1, 1.5, 0.5, 0.5,
-4.038639, -3.897723, 4, 0, 1.5, 0.5, 0.5
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
-3.539292, -3.404516, -5.741402,
-3.539292, 3.171575, -5.741402,
-3.539292, -3.404516, 5.376121,
-3.539292, 3.171575, 5.376121,
-3.539292, -3.404516, -5.741402,
-3.539292, -3.404516, 5.376121,
-3.539292, 3.171575, -5.741402,
-3.539292, 3.171575, 5.376121,
-3.539292, -3.404516, -5.741402,
3.118667, -3.404516, -5.741402,
-3.539292, -3.404516, 5.376121,
3.118667, -3.404516, 5.376121,
-3.539292, 3.171575, -5.741402,
3.118667, 3.171575, -5.741402,
-3.539292, 3.171575, 5.376121,
3.118667, 3.171575, 5.376121,
3.118667, -3.404516, -5.741402,
3.118667, 3.171575, -5.741402,
3.118667, -3.404516, 5.376121,
3.118667, 3.171575, 5.376121,
3.118667, -3.404516, -5.741402,
3.118667, -3.404516, 5.376121,
3.118667, 3.171575, -5.741402,
3.118667, 3.171575, 5.376121
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
var radius = 7.75969;
var distance = 34.52374;
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
mvMatrix.translate( 0.2103126, 0.1164707, 0.1826408 );
mvMatrix.scale( 1.260135, 1.275823, 0.7546581 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.52374);
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
teflubenzuron<-read.table("teflubenzuron.xyz")
```

```
## Error in read.table("teflubenzuron.xyz"): no lines available in input
```

```r
x<-teflubenzuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'teflubenzuron' not found
```

```r
y<-teflubenzuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'teflubenzuron' not found
```

```r
z<-teflubenzuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'teflubenzuron' not found
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
-3.442332, 1.270829, -1.448455, 0, 0, 1, 1, 1,
-3.25545, 1.602047, 0.3965303, 1, 0, 0, 1, 1,
-3.076017, -0.2806342, -2.105505, 1, 0, 0, 1, 1,
-2.548498, 0.6613923, -0.5284443, 1, 0, 0, 1, 1,
-2.517036, -0.9841371, -2.264861, 1, 0, 0, 1, 1,
-2.492895, -0.5252184, -2.639451, 1, 0, 0, 1, 1,
-2.480699, 0.299878, -0.133742, 0, 0, 0, 1, 1,
-2.478024, 0.672995, -1.395222, 0, 0, 0, 1, 1,
-2.421078, -0.2411429, -1.902957, 0, 0, 0, 1, 1,
-2.408571, -1.099483, 0.08524092, 0, 0, 0, 1, 1,
-2.364059, 1.057148, -2.002759, 0, 0, 0, 1, 1,
-2.330521, -0.1750576, -0.5825043, 0, 0, 0, 1, 1,
-2.27553, -1.055583, -2.076066, 0, 0, 0, 1, 1,
-2.211676, -0.423698, -2.014505, 1, 1, 1, 1, 1,
-2.171689, 0.8800176, -1.389742, 1, 1, 1, 1, 1,
-2.149103, 0.190736, -1.151535, 1, 1, 1, 1, 1,
-2.120533, -2.601429, -1.041069, 1, 1, 1, 1, 1,
-2.091514, -1.588628, -0.3627676, 1, 1, 1, 1, 1,
-2.058449, -3.308748, -2.780027, 1, 1, 1, 1, 1,
-2.050174, 0.4402955, -0.8978793, 1, 1, 1, 1, 1,
-2.02742, 0.4374245, -2.150013, 1, 1, 1, 1, 1,
-1.987604, 0.238116, -0.2187071, 1, 1, 1, 1, 1,
-1.983117, -0.1375937, -0.9188603, 1, 1, 1, 1, 1,
-1.963838, -0.5443687, -0.7632968, 1, 1, 1, 1, 1,
-1.924452, 0.7055586, -0.8564768, 1, 1, 1, 1, 1,
-1.922643, 1.061139, -1.264247, 1, 1, 1, 1, 1,
-1.915599, -1.63503, -2.417857, 1, 1, 1, 1, 1,
-1.912586, 0.2682162, -3.585843, 1, 1, 1, 1, 1,
-1.894147, -1.215501, -0.8266154, 0, 0, 1, 1, 1,
-1.887996, -1.316652, -1.306046, 1, 0, 0, 1, 1,
-1.864155, 0.6924773, -1.336528, 1, 0, 0, 1, 1,
-1.855537, 0.2296124, -0.3513204, 1, 0, 0, 1, 1,
-1.84617, -0.9798866, -2.929629, 1, 0, 0, 1, 1,
-1.830295, -0.7461775, -2.581597, 1, 0, 0, 1, 1,
-1.81818, 0.2993194, -0.9817705, 0, 0, 0, 1, 1,
-1.81522, -0.2153729, -1.486147, 0, 0, 0, 1, 1,
-1.810894, -0.7348754, -0.5432484, 0, 0, 0, 1, 1,
-1.77039, -2.402318, -2.21137, 0, 0, 0, 1, 1,
-1.760412, -1.31856, -1.964384, 0, 0, 0, 1, 1,
-1.743431, -0.9014482, -1.340933, 0, 0, 0, 1, 1,
-1.716745, -0.3430763, -2.921358, 0, 0, 0, 1, 1,
-1.713247, 0.5333378, 0.331306, 1, 1, 1, 1, 1,
-1.711833, -2.302229, -3.88937, 1, 1, 1, 1, 1,
-1.700054, -1.399516, -2.379835, 1, 1, 1, 1, 1,
-1.699542, -0.4810824, -0.4953071, 1, 1, 1, 1, 1,
-1.695507, 1.083518, 0.8538406, 1, 1, 1, 1, 1,
-1.695232, 0.8191376, -2.098297, 1, 1, 1, 1, 1,
-1.688614, -0.05168934, -3.911074, 1, 1, 1, 1, 1,
-1.67891, -0.6033722, -1.96896, 1, 1, 1, 1, 1,
-1.672886, 0.06792582, -0.6725214, 1, 1, 1, 1, 1,
-1.671168, 0.8526845, -0.5100805, 1, 1, 1, 1, 1,
-1.663629, 0.5303536, -2.385643, 1, 1, 1, 1, 1,
-1.643733, -0.8881791, -1.672642, 1, 1, 1, 1, 1,
-1.642345, -0.1600181, -4.275348, 1, 1, 1, 1, 1,
-1.638475, -0.4609027, -2.999874, 1, 1, 1, 1, 1,
-1.635194, 0.3867749, -1.151835, 1, 1, 1, 1, 1,
-1.634898, -1.233863, -3.071183, 0, 0, 1, 1, 1,
-1.62931, 1.29673, -0.4132869, 1, 0, 0, 1, 1,
-1.629214, 1.723347, -2.037266, 1, 0, 0, 1, 1,
-1.617009, -0.09758271, -1.682786, 1, 0, 0, 1, 1,
-1.589277, 0.6326074, -0.2567084, 1, 0, 0, 1, 1,
-1.588683, 1.217216, -0.526261, 1, 0, 0, 1, 1,
-1.569438, 1.796081, 0.4912963, 0, 0, 0, 1, 1,
-1.568778, -0.5465684, -3.515429, 0, 0, 0, 1, 1,
-1.565579, -0.1526203, -0.7162547, 0, 0, 0, 1, 1,
-1.555855, -1.092826, -1.40053, 0, 0, 0, 1, 1,
-1.549137, 1.075594, -1.430051, 0, 0, 0, 1, 1,
-1.54191, -0.926551, -4.050986, 0, 0, 0, 1, 1,
-1.53013, 1.615575, -0.02591088, 0, 0, 0, 1, 1,
-1.528596, 0.2281691, 0.2396434, 1, 1, 1, 1, 1,
-1.523232, 0.02425534, -1.174621, 1, 1, 1, 1, 1,
-1.501546, 0.05755455, -2.706867, 1, 1, 1, 1, 1,
-1.500381, -0.6646239, -2.136011, 1, 1, 1, 1, 1,
-1.500282, -0.697412, -3.76725, 1, 1, 1, 1, 1,
-1.469291, 0.8760158, -1.481404, 1, 1, 1, 1, 1,
-1.467682, -0.2927395, -1.532672, 1, 1, 1, 1, 1,
-1.454987, 0.4252664, -1.657848, 1, 1, 1, 1, 1,
-1.449576, -0.2767276, -1.620532, 1, 1, 1, 1, 1,
-1.433224, -0.6415165, -1.923748, 1, 1, 1, 1, 1,
-1.430892, 0.9634703, -1.103438, 1, 1, 1, 1, 1,
-1.428852, -0.8719032, 0.4812532, 1, 1, 1, 1, 1,
-1.426258, -0.1077562, -0.6794546, 1, 1, 1, 1, 1,
-1.425403, -2.657357, -3.19537, 1, 1, 1, 1, 1,
-1.422514, 0.3989506, -0.6882422, 1, 1, 1, 1, 1,
-1.421631, 1.001822, -0.2199526, 0, 0, 1, 1, 1,
-1.420473, 0.577821, 1.081317, 1, 0, 0, 1, 1,
-1.406938, 1.294966, 0.8835635, 1, 0, 0, 1, 1,
-1.403622, 0.2690756, -1.402729, 1, 0, 0, 1, 1,
-1.396126, -1.582715, -3.255426, 1, 0, 0, 1, 1,
-1.392439, 0.5503503, -1.160091, 1, 0, 0, 1, 1,
-1.380851, -0.7264742, -2.446141, 0, 0, 0, 1, 1,
-1.377112, 2.466332, -0.7520929, 0, 0, 0, 1, 1,
-1.371455, -0.2783755, -1.129076, 0, 0, 0, 1, 1,
-1.354262, -1.661762, -2.225282, 0, 0, 0, 1, 1,
-1.347632, -1.409075, -2.44033, 0, 0, 0, 1, 1,
-1.344482, 0.6477674, -0.8454673, 0, 0, 0, 1, 1,
-1.338172, 0.3035479, 0.5246752, 0, 0, 0, 1, 1,
-1.337376, -0.3009893, -2.320662, 1, 1, 1, 1, 1,
-1.335345, -1.610833, -1.781803, 1, 1, 1, 1, 1,
-1.33528, -1.230924, -2.251901, 1, 1, 1, 1, 1,
-1.331128, 1.214628, -0.1288975, 1, 1, 1, 1, 1,
-1.327358, -0.6972514, -2.775676, 1, 1, 1, 1, 1,
-1.322816, 1.466216, -0.4085255, 1, 1, 1, 1, 1,
-1.322481, -0.5209656, -1.739212, 1, 1, 1, 1, 1,
-1.319429, -0.9816591, 0.5139326, 1, 1, 1, 1, 1,
-1.31929, -3.069468, -4.340271, 1, 1, 1, 1, 1,
-1.313225, -1.359466, -4.079248, 1, 1, 1, 1, 1,
-1.310197, 1.332737, -2.51432, 1, 1, 1, 1, 1,
-1.302143, 0.7046642, -1.924952, 1, 1, 1, 1, 1,
-1.292102, 1.13266, -0.8943375, 1, 1, 1, 1, 1,
-1.287521, -0.6987029, -1.662803, 1, 1, 1, 1, 1,
-1.277282, 0.713722, -2.577048, 1, 1, 1, 1, 1,
-1.268222, -1.856421, -2.721794, 0, 0, 1, 1, 1,
-1.261982, -0.4989019, -3.337357, 1, 0, 0, 1, 1,
-1.260833, 0.8866805, -1.590695, 1, 0, 0, 1, 1,
-1.25783, -1.138747, -2.833848, 1, 0, 0, 1, 1,
-1.256924, -0.09170932, -1.106573, 1, 0, 0, 1, 1,
-1.252084, -0.5492597, -3.566864, 1, 0, 0, 1, 1,
-1.246023, -0.8873641, -3.433654, 0, 0, 0, 1, 1,
-1.244823, 0.9512063, -1.361573, 0, 0, 0, 1, 1,
-1.222685, 0.1136901, -1.156603, 0, 0, 0, 1, 1,
-1.217541, 0.5613946, -1.948098, 0, 0, 0, 1, 1,
-1.213389, 1.332721, -0.4597747, 0, 0, 0, 1, 1,
-1.210905, 1.390518, -2.935088, 0, 0, 0, 1, 1,
-1.202087, -0.3169151, -1.347007, 0, 0, 0, 1, 1,
-1.195625, 0.5730183, -1.873294, 1, 1, 1, 1, 1,
-1.195288, -1.499597, -2.247441, 1, 1, 1, 1, 1,
-1.180558, -2.656298, -2.830843, 1, 1, 1, 1, 1,
-1.180356, 0.0453988, -0.4727831, 1, 1, 1, 1, 1,
-1.175902, 0.7025019, -1.392813, 1, 1, 1, 1, 1,
-1.162981, -0.4406579, -1.068421, 1, 1, 1, 1, 1,
-1.158248, 0.5777889, -1.482681, 1, 1, 1, 1, 1,
-1.156914, -0.2331089, -0.4178579, 1, 1, 1, 1, 1,
-1.149361, 0.3448866, -1.057292, 1, 1, 1, 1, 1,
-1.130361, -0.1162193, -2.284084, 1, 1, 1, 1, 1,
-1.125987, -0.713518, -2.847321, 1, 1, 1, 1, 1,
-1.125775, 0.007757866, -2.124271, 1, 1, 1, 1, 1,
-1.123031, 1.952841, -2.918214, 1, 1, 1, 1, 1,
-1.111803, 0.03328506, -0.7421393, 1, 1, 1, 1, 1,
-1.100339, -0.7117667, -1.432434, 1, 1, 1, 1, 1,
-1.093152, -1.524852, -0.448865, 0, 0, 1, 1, 1,
-1.092403, -0.02801352, -2.716264, 1, 0, 0, 1, 1,
-1.080359, -0.6260681, -1.625626, 1, 0, 0, 1, 1,
-1.077221, -0.4987394, -2.894602, 1, 0, 0, 1, 1,
-1.073996, -0.7670693, -0.731908, 1, 0, 0, 1, 1,
-1.071896, 0.1094144, -1.065036, 1, 0, 0, 1, 1,
-1.054616, 0.2593729, -2.581679, 0, 0, 0, 1, 1,
-1.053059, -2.566418, -3.075717, 0, 0, 0, 1, 1,
-1.052808, -0.3504946, -1.389382, 0, 0, 0, 1, 1,
-1.046196, -1.607087, -1.914059, 0, 0, 0, 1, 1,
-1.039788, -1.439406, -2.986731, 0, 0, 0, 1, 1,
-1.033808, -0.05636197, -1.948398, 0, 0, 0, 1, 1,
-1.030755, 0.0958607, 0.05052814, 0, 0, 0, 1, 1,
-1.028226, 0.07988925, -0.8502124, 1, 1, 1, 1, 1,
-1.027162, 0.659716, -0.460832, 1, 1, 1, 1, 1,
-1.025276, 0.03737246, -2.346482, 1, 1, 1, 1, 1,
-1.023832, -0.8647701, -1.372715, 1, 1, 1, 1, 1,
-1.020997, -0.2940902, -2.893705, 1, 1, 1, 1, 1,
-1.012953, 0.347389, -2.369132, 1, 1, 1, 1, 1,
-1.007032, 2.184341, -2.574211, 1, 1, 1, 1, 1,
-0.9977875, 0.7178749, -0.3841252, 1, 1, 1, 1, 1,
-0.9880289, 0.2648262, -1.721406, 1, 1, 1, 1, 1,
-0.9869692, 0.3558768, -2.644338, 1, 1, 1, 1, 1,
-0.9708359, -0.2702532, -1.942548, 1, 1, 1, 1, 1,
-0.9652503, -0.1503869, -0.6971421, 1, 1, 1, 1, 1,
-0.9617525, 0.09943217, -2.042812, 1, 1, 1, 1, 1,
-0.957804, 1.220535, 0.03612005, 1, 1, 1, 1, 1,
-0.9567351, 1.333983, -1.461182, 1, 1, 1, 1, 1,
-0.9553295, -0.02802028, -2.08057, 0, 0, 1, 1, 1,
-0.9552365, -0.507601, -1.94662, 1, 0, 0, 1, 1,
-0.950078, -0.5533809, -2.30634, 1, 0, 0, 1, 1,
-0.9432696, -0.2958253, -0.7962815, 1, 0, 0, 1, 1,
-0.9404718, 1.034545, -1.74906, 1, 0, 0, 1, 1,
-0.9402595, 1.588205, -0.5320699, 1, 0, 0, 1, 1,
-0.933351, -0.3631178, -1.428717, 0, 0, 0, 1, 1,
-0.9247159, -2.158305, -3.873221, 0, 0, 0, 1, 1,
-0.918731, 1.175316, 0.1682745, 0, 0, 0, 1, 1,
-0.9181277, 0.8849809, -1.451772, 0, 0, 0, 1, 1,
-0.9165986, -0.6451294, -1.150069, 0, 0, 0, 1, 1,
-0.9157676, -1.083656, -4.075706, 0, 0, 0, 1, 1,
-0.9155927, -2.62294, -1.066885, 0, 0, 0, 1, 1,
-0.9080735, -0.5886486, -1.863094, 1, 1, 1, 1, 1,
-0.9042582, -0.07285191, 0.2522594, 1, 1, 1, 1, 1,
-0.9007614, -0.6858732, -3.000976, 1, 1, 1, 1, 1,
-0.900076, -0.7718685, -2.081896, 1, 1, 1, 1, 1,
-0.897233, -0.9463484, -1.51637, 1, 1, 1, 1, 1,
-0.8970347, -0.6401985, -3.06629, 1, 1, 1, 1, 1,
-0.8852016, -0.3699784, -1.925368, 1, 1, 1, 1, 1,
-0.8785658, 0.2079766, -0.8061441, 1, 1, 1, 1, 1,
-0.8726884, -0.2790957, -1.220447, 1, 1, 1, 1, 1,
-0.8699139, -0.4032295, -2.120753, 1, 1, 1, 1, 1,
-0.8593372, 1.858198, 1.256208, 1, 1, 1, 1, 1,
-0.85558, 0.3073082, -1.448194, 1, 1, 1, 1, 1,
-0.8549276, -0.2804955, -1.397449, 1, 1, 1, 1, 1,
-0.8534586, -0.5374891, -1.702154, 1, 1, 1, 1, 1,
-0.8496686, -0.5513342, -2.447709, 1, 1, 1, 1, 1,
-0.8439798, -1.277694, -2.104706, 0, 0, 1, 1, 1,
-0.8424612, -0.228567, -3.232893, 1, 0, 0, 1, 1,
-0.8369777, -0.751067, -1.721879, 1, 0, 0, 1, 1,
-0.8344679, 0.8312955, 0.2024254, 1, 0, 0, 1, 1,
-0.8232499, 0.5877153, -1.739039, 1, 0, 0, 1, 1,
-0.8218397, -1.044649, -2.236094, 1, 0, 0, 1, 1,
-0.8187087, 1.940631, -1.157687, 0, 0, 0, 1, 1,
-0.8043898, -1.440065, -3.073822, 0, 0, 0, 1, 1,
-0.8016921, 2.288822, 0.9117884, 0, 0, 0, 1, 1,
-0.7980001, 0.3283611, -0.04626639, 0, 0, 0, 1, 1,
-0.7939812, 0.9987768, -0.3071083, 0, 0, 0, 1, 1,
-0.7932426, 0.8132778, -0.1950184, 0, 0, 0, 1, 1,
-0.7926903, 1.667311, 1.148056, 0, 0, 0, 1, 1,
-0.791283, 1.292989, 0.7831735, 1, 1, 1, 1, 1,
-0.7892367, -0.6894707, -2.719802, 1, 1, 1, 1, 1,
-0.788526, 1.078755, -2.280346, 1, 1, 1, 1, 1,
-0.7871681, 0.534532, -1.203858, 1, 1, 1, 1, 1,
-0.7856486, -0.64513, -3.91365, 1, 1, 1, 1, 1,
-0.7837717, -1.773471, -1.946576, 1, 1, 1, 1, 1,
-0.7817247, 1.574798, -2.646672, 1, 1, 1, 1, 1,
-0.7791577, -0.3151622, -4.488412, 1, 1, 1, 1, 1,
-0.7785799, -1.418006, -2.347193, 1, 1, 1, 1, 1,
-0.7776972, 0.8126507, 0.3570094, 1, 1, 1, 1, 1,
-0.7747707, -0.2922004, -2.336103, 1, 1, 1, 1, 1,
-0.7658226, 0.1057109, -3.467775, 1, 1, 1, 1, 1,
-0.7644355, 0.05869969, -1.368796, 1, 1, 1, 1, 1,
-0.7615006, 0.3745215, -2.371906, 1, 1, 1, 1, 1,
-0.7613473, 0.2534195, -0.8254266, 1, 1, 1, 1, 1,
-0.7607406, 1.095417, -0.4894627, 0, 0, 1, 1, 1,
-0.7519459, 0.9245417, -2.372057, 1, 0, 0, 1, 1,
-0.7463891, -0.5921627, -2.768791, 1, 0, 0, 1, 1,
-0.74244, -2.192703, -4.088196, 1, 0, 0, 1, 1,
-0.7412887, -0.3762791, 0.4678926, 1, 0, 0, 1, 1,
-0.7402427, 0.3811385, -0.2372694, 1, 0, 0, 1, 1,
-0.7395995, 0.6078357, -1.156817, 0, 0, 0, 1, 1,
-0.7376174, 0.9292786, -1.163234, 0, 0, 0, 1, 1,
-0.7350999, -0.7945057, -3.484443, 0, 0, 0, 1, 1,
-0.7335703, -0.3996556, -3.914021, 0, 0, 0, 1, 1,
-0.7199158, -0.7963008, -2.129657, 0, 0, 0, 1, 1,
-0.7180372, -0.5817047, -0.9908039, 0, 0, 0, 1, 1,
-0.7159135, -1.593377, -3.139628, 0, 0, 0, 1, 1,
-0.7090608, 1.295073, 0.520878, 1, 1, 1, 1, 1,
-0.708037, -0.5752758, -2.440952, 1, 1, 1, 1, 1,
-0.7027265, -0.06270396, -1.672323, 1, 1, 1, 1, 1,
-0.702265, 0.2739591, -0.8157497, 1, 1, 1, 1, 1,
-0.7014049, -0.07439625, -0.6122568, 1, 1, 1, 1, 1,
-0.6974163, -1.134478, -3.210743, 1, 1, 1, 1, 1,
-0.6964018, -0.191397, -2.962151, 1, 1, 1, 1, 1,
-0.6952076, -0.639866, -2.740476, 1, 1, 1, 1, 1,
-0.6943742, 0.003972782, -1.182934, 1, 1, 1, 1, 1,
-0.6875945, -1.0148, -1.276322, 1, 1, 1, 1, 1,
-0.6863928, 0.2251694, 0.2150477, 1, 1, 1, 1, 1,
-0.6778623, -0.8831909, -3.102364, 1, 1, 1, 1, 1,
-0.6760112, 0.7279841, -1.990574, 1, 1, 1, 1, 1,
-0.6716383, -0.4454155, -3.904287, 1, 1, 1, 1, 1,
-0.6693634, -0.2150744, -0.89265, 1, 1, 1, 1, 1,
-0.6655673, 0.309865, -1.270952, 0, 0, 1, 1, 1,
-0.6630658, -0.3937317, -0.6256893, 1, 0, 0, 1, 1,
-0.658762, -0.7872854, -3.757457, 1, 0, 0, 1, 1,
-0.6576018, -0.2482662, -2.033071, 1, 0, 0, 1, 1,
-0.6555144, 0.5669067, -0.650696, 1, 0, 0, 1, 1,
-0.6550285, 1.762822, 0.2765107, 1, 0, 0, 1, 1,
-0.6531605, 0.6648057, -0.3292084, 0, 0, 0, 1, 1,
-0.6491513, -0.4655336, -2.29099, 0, 0, 0, 1, 1,
-0.6442068, 1.70553, -1.437051, 0, 0, 0, 1, 1,
-0.6352817, -0.03703713, -0.7189682, 0, 0, 0, 1, 1,
-0.6331825, -0.9605316, -2.477097, 0, 0, 0, 1, 1,
-0.631923, 1.456072, 1.48793, 0, 0, 0, 1, 1,
-0.6247411, 0.8655488, -0.5592981, 0, 0, 0, 1, 1,
-0.6216117, 1.127273, -0.03341653, 1, 1, 1, 1, 1,
-0.6193578, -0.9427584, -4.231648, 1, 1, 1, 1, 1,
-0.6177588, 0.3758684, -0.9540469, 1, 1, 1, 1, 1,
-0.6140274, 1.94868, -0.5779117, 1, 1, 1, 1, 1,
-0.6086547, 0.809529, -0.05956975, 1, 1, 1, 1, 1,
-0.6038345, -0.6292405, -4.462486, 1, 1, 1, 1, 1,
-0.5954804, -0.2375544, -2.183852, 1, 1, 1, 1, 1,
-0.5953802, 0.6496896, -1.745818, 1, 1, 1, 1, 1,
-0.5949479, 1.703552, -0.01354726, 1, 1, 1, 1, 1,
-0.5945197, 1.272418, -0.5885094, 1, 1, 1, 1, 1,
-0.591247, -0.9697103, -3.3257, 1, 1, 1, 1, 1,
-0.5829238, -0.3800912, -1.283304, 1, 1, 1, 1, 1,
-0.5801699, 0.2137802, -0.7189242, 1, 1, 1, 1, 1,
-0.5736762, -0.2836032, -3.572751, 1, 1, 1, 1, 1,
-0.5725122, -0.3006601, -3.683582, 1, 1, 1, 1, 1,
-0.5708921, -0.2287012, -2.521064, 0, 0, 1, 1, 1,
-0.5700312, -2.490922, -3.937373, 1, 0, 0, 1, 1,
-0.5668287, -0.08046654, -3.651603, 1, 0, 0, 1, 1,
-0.5598808, -1.332952, -3.802529, 1, 0, 0, 1, 1,
-0.5569004, -0.03518011, -3.48369, 1, 0, 0, 1, 1,
-0.5523255, 0.3749091, -0.2004082, 1, 0, 0, 1, 1,
-0.5485108, 1.714111, -1.385302, 0, 0, 0, 1, 1,
-0.541786, -0.66019, -0.9907411, 0, 0, 0, 1, 1,
-0.534884, 0.9093594, -0.6053711, 0, 0, 0, 1, 1,
-0.5348614, -0.6131797, -1.738539, 0, 0, 0, 1, 1,
-0.5258061, -1.902626, -1.067241, 0, 0, 0, 1, 1,
-0.5251905, 1.051073, -1.088554, 0, 0, 0, 1, 1,
-0.5235136, 0.377932, -1.940223, 0, 0, 0, 1, 1,
-0.5234553, 0.2754281, -1.87258, 1, 1, 1, 1, 1,
-0.5223649, -0.7002761, -1.199421, 1, 1, 1, 1, 1,
-0.5198795, 0.7949601, -0.2317595, 1, 1, 1, 1, 1,
-0.5197217, 0.4353744, -0.5125225, 1, 1, 1, 1, 1,
-0.5162975, -0.1368817, -3.593058, 1, 1, 1, 1, 1,
-0.5149808, -0.6864735, -2.226341, 1, 1, 1, 1, 1,
-0.5135771, -1.241128, -1.827862, 1, 1, 1, 1, 1,
-0.5108696, 0.296278, -2.049713, 1, 1, 1, 1, 1,
-0.5106281, 1.224298, 0.3867793, 1, 1, 1, 1, 1,
-0.5090747, 0.660768, -0.3926528, 1, 1, 1, 1, 1,
-0.5070373, -0.6552117, -4.40302, 1, 1, 1, 1, 1,
-0.5014244, 0.1840736, -1.672995, 1, 1, 1, 1, 1,
-0.5005, -1.927231, -1.473287, 1, 1, 1, 1, 1,
-0.4998101, 0.9867084, -0.2768171, 1, 1, 1, 1, 1,
-0.4988325, -0.3643413, -1.586575, 1, 1, 1, 1, 1,
-0.4924681, 0.1578323, -1.10591, 0, 0, 1, 1, 1,
-0.4894402, -0.0495392, -0.8078923, 1, 0, 0, 1, 1,
-0.4885417, -0.3337779, -3.204287, 1, 0, 0, 1, 1,
-0.4873865, 1.331034, 2.20915, 1, 0, 0, 1, 1,
-0.4871368, 1.350461, -0.7161361, 1, 0, 0, 1, 1,
-0.4865464, 0.34569, 0.1840097, 1, 0, 0, 1, 1,
-0.4837974, 0.683299, -0.6218961, 0, 0, 0, 1, 1,
-0.4825997, -1.40028, -3.854555, 0, 0, 0, 1, 1,
-0.4819978, 0.2547737, -1.414603, 0, 0, 0, 1, 1,
-0.4802519, 1.155287, 1.055972, 0, 0, 0, 1, 1,
-0.4797623, 3.075806, 2.262065, 0, 0, 0, 1, 1,
-0.4777809, 0.2060538, -2.181254, 0, 0, 0, 1, 1,
-0.4734755, -0.5769089, -1.758816, 0, 0, 0, 1, 1,
-0.4675138, -0.234506, -1.950356, 1, 1, 1, 1, 1,
-0.4672629, 1.600528, -0.06545314, 1, 1, 1, 1, 1,
-0.4669253, -0.9813306, -3.117109, 1, 1, 1, 1, 1,
-0.4571468, -1.2732, -3.252553, 1, 1, 1, 1, 1,
-0.4566365, 0.5613199, -1.531953, 1, 1, 1, 1, 1,
-0.4549896, 1.195826, 0.4388353, 1, 1, 1, 1, 1,
-0.4495498, 1.038909, -0.27979, 1, 1, 1, 1, 1,
-0.4492388, -1.247484, -2.364218, 1, 1, 1, 1, 1,
-0.4488387, -0.185661, -0.7205219, 1, 1, 1, 1, 1,
-0.4472051, -1.976187, -2.790617, 1, 1, 1, 1, 1,
-0.4424888, -0.2527202, -3.542653, 1, 1, 1, 1, 1,
-0.4377022, 1.216301, -0.639133, 1, 1, 1, 1, 1,
-0.4358959, 0.03768025, -1.063734, 1, 1, 1, 1, 1,
-0.435744, 1.751771, -1.468453, 1, 1, 1, 1, 1,
-0.4316288, 0.9771289, -1.093967, 1, 1, 1, 1, 1,
-0.430898, 0.7206659, -1.723482, 0, 0, 1, 1, 1,
-0.4278212, -0.3002668, -2.248877, 1, 0, 0, 1, 1,
-0.4246372, 0.7851798, -2.603906, 1, 0, 0, 1, 1,
-0.4233514, -1.248007, -0.9960864, 1, 0, 0, 1, 1,
-0.420977, 1.68549, 0.01657465, 1, 0, 0, 1, 1,
-0.4178713, -1.251917, -1.703766, 1, 0, 0, 1, 1,
-0.4109958, 0.02530133, -2.342529, 0, 0, 0, 1, 1,
-0.4083719, -0.5903264, -2.653935, 0, 0, 0, 1, 1,
-0.405781, 1.187883, -1.269456, 0, 0, 0, 1, 1,
-0.402119, -0.1581333, -0.4967355, 0, 0, 0, 1, 1,
-0.4004364, 0.2125468, -0.2397676, 0, 0, 0, 1, 1,
-0.4003455, -1.474215, -4.953739, 0, 0, 0, 1, 1,
-0.3997096, 0.0356196, 0.9788847, 0, 0, 0, 1, 1,
-0.398054, -0.4083403, -1.229185, 1, 1, 1, 1, 1,
-0.3834836, -0.7633054, -2.204172, 1, 1, 1, 1, 1,
-0.3827367, -1.813893, -4.19973, 1, 1, 1, 1, 1,
-0.3810077, 0.124234, 0.07731237, 1, 1, 1, 1, 1,
-0.3794613, -1.779486, -3.460132, 1, 1, 1, 1, 1,
-0.3768787, 0.1542849, -1.065267, 1, 1, 1, 1, 1,
-0.3768676, -1.12504, -2.182568, 1, 1, 1, 1, 1,
-0.3738362, -1.286793, -3.257556, 1, 1, 1, 1, 1,
-0.3719786, 0.8683226, -0.6285489, 1, 1, 1, 1, 1,
-0.3647296, -0.710796, -2.901593, 1, 1, 1, 1, 1,
-0.3632436, 1.129199, 0.2778359, 1, 1, 1, 1, 1,
-0.3630496, 0.8661584, 0.5700684, 1, 1, 1, 1, 1,
-0.3622833, -0.6536463, -3.286175, 1, 1, 1, 1, 1,
-0.3586538, -1.890646, -3.343429, 1, 1, 1, 1, 1,
-0.3575369, -1.119867, -4.429479, 1, 1, 1, 1, 1,
-0.3564608, -0.2661515, -1.081971, 0, 0, 1, 1, 1,
-0.3541749, -1.422509, -3.838482, 1, 0, 0, 1, 1,
-0.3519526, -2.688449, -3.47562, 1, 0, 0, 1, 1,
-0.3506053, 0.7674539, -0.6688614, 1, 0, 0, 1, 1,
-0.3505971, -0.8068395, -3.206849, 1, 0, 0, 1, 1,
-0.348605, 0.9777611, 1.385434, 1, 0, 0, 1, 1,
-0.3483788, 0.493692, -1.557322, 0, 0, 0, 1, 1,
-0.3446023, 0.5313402, -0.9577005, 0, 0, 0, 1, 1,
-0.3441057, -0.6622099, -1.828877, 0, 0, 0, 1, 1,
-0.3437656, -0.555838, -3.531283, 0, 0, 0, 1, 1,
-0.3434203, 0.07390935, -1.801464, 0, 0, 0, 1, 1,
-0.3378935, 1.288175, 0.5394701, 0, 0, 0, 1, 1,
-0.3356753, -0.4931495, -1.613243, 0, 0, 0, 1, 1,
-0.3355802, 1.111782, 0.8545414, 1, 1, 1, 1, 1,
-0.335231, -0.6339472, -4.094948, 1, 1, 1, 1, 1,
-0.3334939, -0.8599096, -0.4443428, 1, 1, 1, 1, 1,
-0.3332082, 0.2474599, -0.3193279, 1, 1, 1, 1, 1,
-0.3327506, 0.05683369, 0.03359878, 1, 1, 1, 1, 1,
-0.3324738, -2.178706, -5.179973, 1, 1, 1, 1, 1,
-0.3275723, -0.4312475, -3.585254, 1, 1, 1, 1, 1,
-0.3260795, 1.678799, 0.7427325, 1, 1, 1, 1, 1,
-0.3226082, 0.9666979, 0.7244947, 1, 1, 1, 1, 1,
-0.3217938, 0.1372056, 0.6846702, 1, 1, 1, 1, 1,
-0.3188534, -0.00968795, -1.832028, 1, 1, 1, 1, 1,
-0.3145091, 0.1887402, 0.539651, 1, 1, 1, 1, 1,
-0.312581, -0.4903136, -3.504156, 1, 1, 1, 1, 1,
-0.309876, 2.007029, 0.6134171, 1, 1, 1, 1, 1,
-0.3088431, -0.6338447, -2.155628, 1, 1, 1, 1, 1,
-0.3055069, -1.303419, -1.939358, 0, 0, 1, 1, 1,
-0.2995177, -0.4480439, -2.007577, 1, 0, 0, 1, 1,
-0.2987553, -1.741877, -3.849431, 1, 0, 0, 1, 1,
-0.2964414, -0.05054978, -0.9324391, 1, 0, 0, 1, 1,
-0.2956459, 0.8898525, -0.9836567, 1, 0, 0, 1, 1,
-0.2948411, 0.8632531, -0.1523639, 1, 0, 0, 1, 1,
-0.2911865, -1.012746, -3.40298, 0, 0, 0, 1, 1,
-0.2890015, 0.861382, 0.6554731, 0, 0, 0, 1, 1,
-0.2889266, -0.1226563, -1.608557, 0, 0, 0, 1, 1,
-0.2762896, -1.156119, -4.264654, 0, 0, 0, 1, 1,
-0.2739857, 1.972837, -1.197043, 0, 0, 0, 1, 1,
-0.2682734, 1.599894, -0.6021209, 0, 0, 0, 1, 1,
-0.2675575, 0.736286, -0.5806341, 0, 0, 0, 1, 1,
-0.2636325, -1.617009, -2.74897, 1, 1, 1, 1, 1,
-0.262555, -1.596276, -1.652435, 1, 1, 1, 1, 1,
-0.2611179, 1.031388, -1.573685, 1, 1, 1, 1, 1,
-0.2579859, 0.6911488, -0.3628442, 1, 1, 1, 1, 1,
-0.2576803, 2.448939, 0.03615962, 1, 1, 1, 1, 1,
-0.2567734, -0.1073133, -1.97778, 1, 1, 1, 1, 1,
-0.25473, 0.1136038, -1.937853, 1, 1, 1, 1, 1,
-0.2524794, -0.8229067, -1.20311, 1, 1, 1, 1, 1,
-0.2427943, -0.9589469, -3.129866, 1, 1, 1, 1, 1,
-0.2426779, -1.653309, -4.149839, 1, 1, 1, 1, 1,
-0.2411699, 2.013737, -0.08003667, 1, 1, 1, 1, 1,
-0.2405585, -0.1830597, -5.432953, 1, 1, 1, 1, 1,
-0.2401853, 0.5764242, 0.7155586, 1, 1, 1, 1, 1,
-0.2401708, 2.295334, -0.09163626, 1, 1, 1, 1, 1,
-0.2399888, -0.1648179, -2.845142, 1, 1, 1, 1, 1,
-0.2378753, 1.646026, -0.3090195, 0, 0, 1, 1, 1,
-0.2354656, 0.6781656, -0.2768512, 1, 0, 0, 1, 1,
-0.2327605, 0.9915463, -0.7318125, 1, 0, 0, 1, 1,
-0.2317206, 0.5910166, -1.975379, 1, 0, 0, 1, 1,
-0.2281639, -1.204674, -3.859504, 1, 0, 0, 1, 1,
-0.2241674, 1.003271, -0.79877, 1, 0, 0, 1, 1,
-0.2222169, -1.046908, -5.419127, 0, 0, 0, 1, 1,
-0.2207032, 0.7118767, -1.403906, 0, 0, 0, 1, 1,
-0.2196084, -1.445654, -3.616195, 0, 0, 0, 1, 1,
-0.2188299, -0.8607515, -3.894657, 0, 0, 0, 1, 1,
-0.2178637, -0.3277042, -4.146944, 0, 0, 0, 1, 1,
-0.2152577, 0.7001641, 0.8481309, 0, 0, 0, 1, 1,
-0.2122613, 0.1433397, -0.4087745, 0, 0, 0, 1, 1,
-0.2122443, 0.02559901, -2.202624, 1, 1, 1, 1, 1,
-0.2120627, -0.5725008, -4.335073, 1, 1, 1, 1, 1,
-0.2010197, -0.3958122, -1.166573, 1, 1, 1, 1, 1,
-0.1947316, -1.2843, -2.37201, 1, 1, 1, 1, 1,
-0.194137, 0.1486147, 1.141374, 1, 1, 1, 1, 1,
-0.1934591, -0.2053928, -2.366666, 1, 1, 1, 1, 1,
-0.1928477, 0.6916037, 0.1623028, 1, 1, 1, 1, 1,
-0.1912572, 1.520711, -0.7039922, 1, 1, 1, 1, 1,
-0.1891654, -0.4245342, -3.528154, 1, 1, 1, 1, 1,
-0.1858224, 1.88504, 1.392489, 1, 1, 1, 1, 1,
-0.1839788, 0.9075483, 0.9487842, 1, 1, 1, 1, 1,
-0.181869, 0.1135071, -2.197744, 1, 1, 1, 1, 1,
-0.1767567, -1.814592, -3.359159, 1, 1, 1, 1, 1,
-0.1748856, 0.8106062, 0.7655604, 1, 1, 1, 1, 1,
-0.1732421, -0.1458488, -3.35577, 1, 1, 1, 1, 1,
-0.1721151, 0.374443, 0.06482105, 0, 0, 1, 1, 1,
-0.1699031, -0.1195277, -4.115803, 1, 0, 0, 1, 1,
-0.1691773, 1.261869, 1.109173, 1, 0, 0, 1, 1,
-0.1682186, 1.158738, -1.375173, 1, 0, 0, 1, 1,
-0.1671384, -0.4153433, -4.585371, 1, 0, 0, 1, 1,
-0.165346, 0.8257393, -2.010573, 1, 0, 0, 1, 1,
-0.1611709, -1.713454, -2.698846, 0, 0, 0, 1, 1,
-0.1610629, -0.8587245, -2.038023, 0, 0, 0, 1, 1,
-0.1587962, -0.6658788, -1.606548, 0, 0, 0, 1, 1,
-0.1567407, -0.0982741, -2.142193, 0, 0, 0, 1, 1,
-0.1559703, 0.3826334, -0.5262232, 0, 0, 0, 1, 1,
-0.1524469, -0.5519772, -2.575623, 0, 0, 0, 1, 1,
-0.1497853, -0.6927338, -2.463291, 0, 0, 0, 1, 1,
-0.1494509, 0.0268706, -0.5606013, 1, 1, 1, 1, 1,
-0.1429856, -0.7515772, -1.002914, 1, 1, 1, 1, 1,
-0.1429706, 1.375248, -0.364334, 1, 1, 1, 1, 1,
-0.1410834, 1.000357, -1.197609, 1, 1, 1, 1, 1,
-0.1402067, -1.409543, -2.263164, 1, 1, 1, 1, 1,
-0.1392761, -1.00848, -1.817771, 1, 1, 1, 1, 1,
-0.1356429, 0.1026996, -0.6989083, 1, 1, 1, 1, 1,
-0.1353424, 0.7322853, -1.61692, 1, 1, 1, 1, 1,
-0.1299231, -0.9806847, -2.466689, 1, 1, 1, 1, 1,
-0.1274727, 1.185883, -1.280029, 1, 1, 1, 1, 1,
-0.1270442, 0.6613513, -1.031832, 1, 1, 1, 1, 1,
-0.1262704, -0.4990186, -2.48606, 1, 1, 1, 1, 1,
-0.1240198, 0.4264599, 1.170321, 1, 1, 1, 1, 1,
-0.1197378, -0.08673306, -1.63616, 1, 1, 1, 1, 1,
-0.1160707, -0.944811, -2.058235, 1, 1, 1, 1, 1,
-0.1108651, -1.333137, -2.132662, 0, 0, 1, 1, 1,
-0.1097084, -0.8212206, -3.669808, 1, 0, 0, 1, 1,
-0.1086331, -0.8684312, -3.912901, 1, 0, 0, 1, 1,
-0.1081197, -0.3520976, -1.735979, 1, 0, 0, 1, 1,
-0.1069604, -1.343279, -2.07843, 1, 0, 0, 1, 1,
-0.105135, -0.9949955, -2.852623, 1, 0, 0, 1, 1,
-0.1031272, 0.1571455, -0.9301313, 0, 0, 0, 1, 1,
-0.1020098, -0.2647537, -2.010941, 0, 0, 0, 1, 1,
-0.09928383, -0.6044803, -5.579496, 0, 0, 0, 1, 1,
-0.09421678, 0.1542888, -0.5409002, 0, 0, 0, 1, 1,
-0.09371375, 0.2600081, 0.1476022, 0, 0, 0, 1, 1,
-0.0894493, -1.415753, -4.027452, 0, 0, 0, 1, 1,
-0.08257246, -1.643581, -2.524768, 0, 0, 0, 1, 1,
-0.08199118, -1.766109, -3.930358, 1, 1, 1, 1, 1,
-0.08035759, -1.563537, -3.973943, 1, 1, 1, 1, 1,
-0.07878664, 0.1293851, -0.9730468, 1, 1, 1, 1, 1,
-0.0771233, -0.129238, -2.502285, 1, 1, 1, 1, 1,
-0.07614063, 1.565623, -2.944288, 1, 1, 1, 1, 1,
-0.0737832, 0.7612872, -0.519576, 1, 1, 1, 1, 1,
-0.07342908, 0.94736, 0.7693766, 1, 1, 1, 1, 1,
-0.0711372, -0.2790609, -3.563429, 1, 1, 1, 1, 1,
-0.066648, 0.1147759, -0.147377, 1, 1, 1, 1, 1,
-0.06133492, 1.503273, -0.5127916, 1, 1, 1, 1, 1,
-0.05912544, -0.7030715, -3.712032, 1, 1, 1, 1, 1,
-0.05771365, 1.029844, 0.5086289, 1, 1, 1, 1, 1,
-0.05610413, -1.468333, -4.16044, 1, 1, 1, 1, 1,
-0.05599292, 0.9277321, -0.5942302, 1, 1, 1, 1, 1,
-0.05591346, -0.2958435, -1.059534, 1, 1, 1, 1, 1,
-0.04885623, 1.426565, 1.10608, 0, 0, 1, 1, 1,
-0.04073404, 0.173063, -1.151977, 1, 0, 0, 1, 1,
-0.03795866, -0.8097332, -2.585934, 1, 0, 0, 1, 1,
-0.03582208, -1.638896, -2.974831, 1, 0, 0, 1, 1,
-0.03444545, 0.2991884, -0.1002808, 1, 0, 0, 1, 1,
-0.03378294, 0.7570877, -1.322304, 1, 0, 0, 1, 1,
-0.03232149, -0.2571387, -4.23442, 0, 0, 0, 1, 1,
-0.03127785, 2.847674, 1.576533, 0, 0, 0, 1, 1,
-0.02964405, -0.7077296, -3.105023, 0, 0, 0, 1, 1,
-0.02799037, -1.626216, -2.754777, 0, 0, 0, 1, 1,
-0.02605311, -0.2081309, -3.544005, 0, 0, 0, 1, 1,
-0.02226667, 0.3286311, -0.6826257, 0, 0, 0, 1, 1,
-0.02210025, 1.211671, 0.636913, 0, 0, 0, 1, 1,
-0.01904444, -0.3431279, -1.75859, 1, 1, 1, 1, 1,
-0.01787706, -2.162707, -2.024999, 1, 1, 1, 1, 1,
-0.0162085, 1.345083, -0.125856, 1, 1, 1, 1, 1,
-0.01518852, -2.144347, -1.714383, 1, 1, 1, 1, 1,
-0.01505889, 0.6758122, -0.5148772, 1, 1, 1, 1, 1,
-0.01230667, 1.026234, -0.1271699, 1, 1, 1, 1, 1,
-0.01161126, 2.154922, 0.3902878, 1, 1, 1, 1, 1,
-0.001764459, 0.7359983, 0.003103881, 1, 1, 1, 1, 1,
-0.0009832421, -0.7271631, -2.322998, 1, 1, 1, 1, 1,
0.0001064899, 1.051147, 0.4082282, 1, 1, 1, 1, 1,
0.001221561, 0.4483148, -1.638587, 1, 1, 1, 1, 1,
0.003158202, -0.4268042, 1.792615, 1, 1, 1, 1, 1,
0.004765131, 1.901777, -0.593776, 1, 1, 1, 1, 1,
0.01550931, 0.2813489, 1.288534, 1, 1, 1, 1, 1,
0.01572547, 0.3291329, -1.420222, 1, 1, 1, 1, 1,
0.01611986, 1.450503, -1.17546, 0, 0, 1, 1, 1,
0.01928345, -1.392106, 4.321488, 1, 0, 0, 1, 1,
0.01956483, 0.858766, -0.05488387, 1, 0, 0, 1, 1,
0.02082384, -0.2813981, 3.334901, 1, 0, 0, 1, 1,
0.02103218, 0.1450903, 1.978136, 1, 0, 0, 1, 1,
0.02384401, 1.938496, -0.5232151, 1, 0, 0, 1, 1,
0.02406318, -0.8986892, 3.965549, 0, 0, 0, 1, 1,
0.02582419, -0.2771698, 2.368762, 0, 0, 0, 1, 1,
0.02615856, 0.7937111, -1.127353, 0, 0, 0, 1, 1,
0.02798732, -0.6002499, 2.534099, 0, 0, 0, 1, 1,
0.03052772, 0.5602398, -0.644206, 0, 0, 0, 1, 1,
0.03388193, -0.9214925, 0.8836718, 0, 0, 0, 1, 1,
0.03604862, -0.6927933, 2.432794, 0, 0, 0, 1, 1,
0.03683894, -0.02576163, 0.8804604, 1, 1, 1, 1, 1,
0.03867278, -0.0688137, 3.265447, 1, 1, 1, 1, 1,
0.04014295, -2.835718, 5.208009, 1, 1, 1, 1, 1,
0.04364508, -2.759481, 3.259444, 1, 1, 1, 1, 1,
0.047072, 1.449705, 0.5870897, 1, 1, 1, 1, 1,
0.05465127, 0.772997, -0.8661057, 1, 1, 1, 1, 1,
0.05565353, -0.9314312, 2.350582, 1, 1, 1, 1, 1,
0.06216823, -0.07363603, 3.280043, 1, 1, 1, 1, 1,
0.06986021, -1.084279, 4.176874, 1, 1, 1, 1, 1,
0.07143358, 0.2134908, 0.8052799, 1, 1, 1, 1, 1,
0.0729301, 0.337696, 0.9115176, 1, 1, 1, 1, 1,
0.08176888, -0.3951257, 2.447217, 1, 1, 1, 1, 1,
0.08773915, -1.067596, 4.24975, 1, 1, 1, 1, 1,
0.09046515, -0.8492468, 2.196963, 1, 1, 1, 1, 1,
0.09176047, 0.4353136, 0.706158, 1, 1, 1, 1, 1,
0.09576201, -0.2449283, 2.131314, 0, 0, 1, 1, 1,
0.09578396, -0.6301074, 2.628336, 1, 0, 0, 1, 1,
0.0973253, -0.8221446, 3.283498, 1, 0, 0, 1, 1,
0.1002986, -0.05986115, 3.808865, 1, 0, 0, 1, 1,
0.1026939, -0.194691, 3.17353, 1, 0, 0, 1, 1,
0.1048772, -1.215571, 0.8796898, 1, 0, 0, 1, 1,
0.1091687, -0.1931892, 1.84271, 0, 0, 0, 1, 1,
0.1105385, 1.042894, -0.4333065, 0, 0, 0, 1, 1,
0.1119924, 1.231906, 0.1186431, 0, 0, 0, 1, 1,
0.1139375, -1.894711, 2.519108, 0, 0, 0, 1, 1,
0.1148247, 0.6693827, 0.189173, 0, 0, 0, 1, 1,
0.1179809, 0.5621818, 1.203524, 0, 0, 0, 1, 1,
0.1199477, 0.581013, 1.746588, 0, 0, 0, 1, 1,
0.1211101, -0.6849591, 3.992862, 1, 1, 1, 1, 1,
0.1255786, 0.4320738, -0.9457681, 1, 1, 1, 1, 1,
0.1328988, -1.577237, 5.214215, 1, 1, 1, 1, 1,
0.1345246, -1.643112, 3.743994, 1, 1, 1, 1, 1,
0.1345624, 0.1901358, 0.3847527, 1, 1, 1, 1, 1,
0.1450251, -0.2072681, 2.50384, 1, 1, 1, 1, 1,
0.1455637, -1.474929, 1.950167, 1, 1, 1, 1, 1,
0.1472282, 1.839246, -0.9474728, 1, 1, 1, 1, 1,
0.1473516, -0.108155, 2.29654, 1, 1, 1, 1, 1,
0.1489294, 0.9423989, 1.245789, 1, 1, 1, 1, 1,
0.1527926, -1.114458, 2.142746, 1, 1, 1, 1, 1,
0.1588126, 0.9715928, 1.569412, 1, 1, 1, 1, 1,
0.1625165, -1.506948, 3.98375, 1, 1, 1, 1, 1,
0.1638742, 0.1401959, -0.2458537, 1, 1, 1, 1, 1,
0.1691091, -0.5033138, 2.198835, 1, 1, 1, 1, 1,
0.1697083, -0.5731302, 1.879254, 0, 0, 1, 1, 1,
0.1701668, -0.6640106, 3.05766, 1, 0, 0, 1, 1,
0.1720924, -1.489337, 3.834147, 1, 0, 0, 1, 1,
0.1745874, 0.007843131, 0.4898994, 1, 0, 0, 1, 1,
0.1818118, -2.059291, 3.447437, 1, 0, 0, 1, 1,
0.1847382, -1.210865, 2.967299, 1, 0, 0, 1, 1,
0.1945739, 0.0801807, 2.098075, 0, 0, 0, 1, 1,
0.1982931, 0.1894162, 1.577369, 0, 0, 0, 1, 1,
0.1985623, -0.5629048, 0.8965231, 0, 0, 0, 1, 1,
0.2014293, -0.6108956, 3.274805, 0, 0, 0, 1, 1,
0.2026084, -1.66758, 3.124579, 0, 0, 0, 1, 1,
0.2065266, 0.655666, -0.2842815, 0, 0, 0, 1, 1,
0.207102, 1.046336, 0.8682549, 0, 0, 0, 1, 1,
0.2089281, -0.02354146, 1.097332, 1, 1, 1, 1, 1,
0.2089307, 1.554087, 0.5586942, 1, 1, 1, 1, 1,
0.2098271, -1.041983, 4.514741, 1, 1, 1, 1, 1,
0.2105165, -0.4934274, 1.148435, 1, 1, 1, 1, 1,
0.2175496, -1.327165, 2.129064, 1, 1, 1, 1, 1,
0.2188078, 1.107952, 0.8822469, 1, 1, 1, 1, 1,
0.2226834, 0.8571573, 0.6456722, 1, 1, 1, 1, 1,
0.2247935, 0.5485592, 0.5022381, 1, 1, 1, 1, 1,
0.2260513, 0.6823815, -1.345841, 1, 1, 1, 1, 1,
0.2268191, 1.685618, -0.054417, 1, 1, 1, 1, 1,
0.230228, 0.7522895, 0.05182321, 1, 1, 1, 1, 1,
0.235109, -1.178461, 4.161723, 1, 1, 1, 1, 1,
0.2363571, 0.7804286, -0.1706935, 1, 1, 1, 1, 1,
0.2369478, -0.3219071, 2.331145, 1, 1, 1, 1, 1,
0.2406554, 0.06959458, 2.873852, 1, 1, 1, 1, 1,
0.2418073, -0.1030964, 2.006023, 0, 0, 1, 1, 1,
0.243291, 1.446929, 2.330814, 1, 0, 0, 1, 1,
0.2501324, 0.9111043, -0.2342154, 1, 0, 0, 1, 1,
0.2511056, -1.135868, 2.60631, 1, 0, 0, 1, 1,
0.251554, 2.079645, 0.09694475, 1, 0, 0, 1, 1,
0.2587233, -1.539268, 1.939149, 1, 0, 0, 1, 1,
0.2657907, -0.2423852, 2.991225, 0, 0, 0, 1, 1,
0.2667825, 1.522431, 1.358041, 0, 0, 0, 1, 1,
0.2692223, -1.015066, 1.420885, 0, 0, 0, 1, 1,
0.2701964, 0.2350318, 0.9677508, 0, 0, 0, 1, 1,
0.2787756, 0.135577, 0.8728073, 0, 0, 0, 1, 1,
0.2815175, 0.7372844, -1.180981, 0, 0, 0, 1, 1,
0.2822284, -0.2472694, 2.284822, 0, 0, 0, 1, 1,
0.2880118, 0.5104803, -0.1687618, 1, 1, 1, 1, 1,
0.2904054, 0.6886434, -0.6524585, 1, 1, 1, 1, 1,
0.2921214, -0.9993364, 2.7705, 1, 1, 1, 1, 1,
0.292274, 0.4418887, 2.794717, 1, 1, 1, 1, 1,
0.2937194, 1.169494, -0.6790974, 1, 1, 1, 1, 1,
0.2951497, -0.2991649, 2.768762, 1, 1, 1, 1, 1,
0.2971665, 1.032024, 0.8679459, 1, 1, 1, 1, 1,
0.2973325, 0.2591273, 0.5820998, 1, 1, 1, 1, 1,
0.2988409, -0.3525156, 2.794061, 1, 1, 1, 1, 1,
0.3022747, 0.6358488, -0.3688755, 1, 1, 1, 1, 1,
0.3034259, 0.3616872, -0.02990795, 1, 1, 1, 1, 1,
0.3064128, -0.3856481, 1.837933, 1, 1, 1, 1, 1,
0.308025, 0.4887568, -0.1013827, 1, 1, 1, 1, 1,
0.3088426, 0.1440194, 2.062666, 1, 1, 1, 1, 1,
0.3092365, 0.4638327, -0.3521746, 1, 1, 1, 1, 1,
0.3155879, -2.691748, 3.258198, 0, 0, 1, 1, 1,
0.31738, -0.3209569, 1.95069, 1, 0, 0, 1, 1,
0.3194349, -0.3002506, 1.822299, 1, 0, 0, 1, 1,
0.3242014, -1.636053, 3.095441, 1, 0, 0, 1, 1,
0.3247558, -0.9430841, 2.103678, 1, 0, 0, 1, 1,
0.3275873, 0.1167511, 0.3100264, 1, 0, 0, 1, 1,
0.3308275, 0.2094091, 1.758797, 0, 0, 0, 1, 1,
0.3314975, 0.3513866, 2.615116, 0, 0, 0, 1, 1,
0.3320913, -0.651855, 3.897581, 0, 0, 0, 1, 1,
0.3325384, -1.619872, 3.209428, 0, 0, 0, 1, 1,
0.3330691, -1.447534, 5.052602, 0, 0, 0, 1, 1,
0.3361714, 1.167549, -1.383271, 0, 0, 0, 1, 1,
0.3407336, -0.5622671, 2.918513, 0, 0, 0, 1, 1,
0.3414123, -0.5933138, 1.581017, 1, 1, 1, 1, 1,
0.3460962, 0.09805343, 1.795652, 1, 1, 1, 1, 1,
0.3470265, 1.123272, 0.2865669, 1, 1, 1, 1, 1,
0.3591262, -1.342337, 3.139827, 1, 1, 1, 1, 1,
0.3641106, -0.8246231, 0.9539352, 1, 1, 1, 1, 1,
0.3660105, -1.640124, 2.060279, 1, 1, 1, 1, 1,
0.3698678, -1.072998, 4.638514, 1, 1, 1, 1, 1,
0.3735981, 0.8662532, -0.3009803, 1, 1, 1, 1, 1,
0.3773911, -0.6074144, 2.945263, 1, 1, 1, 1, 1,
0.3795116, -1.656822, 1.642301, 1, 1, 1, 1, 1,
0.3856864, 1.397038, 0.3063133, 1, 1, 1, 1, 1,
0.3884449, -1.811985, 4.490958, 1, 1, 1, 1, 1,
0.3917347, 0.08097756, 2.162455, 1, 1, 1, 1, 1,
0.3944255, 0.1254191, 0.3947802, 1, 1, 1, 1, 1,
0.399577, -1.029985, 2.446561, 1, 1, 1, 1, 1,
0.4030409, -0.05006619, 0.9851852, 0, 0, 1, 1, 1,
0.4089291, 0.3834356, -0.3051239, 1, 0, 0, 1, 1,
0.4104688, -0.609952, 2.521149, 1, 0, 0, 1, 1,
0.410603, -0.4419065, -0.1575116, 1, 0, 0, 1, 1,
0.4127544, -0.8317232, 2.538121, 1, 0, 0, 1, 1,
0.4136897, 1.472985, 0.8768799, 1, 0, 0, 1, 1,
0.413789, -0.4337054, 2.962969, 0, 0, 0, 1, 1,
0.4216262, -0.2236151, 1.768445, 0, 0, 0, 1, 1,
0.4233016, 1.179982, 0.5982863, 0, 0, 0, 1, 1,
0.4256797, 0.4587052, 1.077145, 0, 0, 0, 1, 1,
0.4276513, 1.070413, -0.9330724, 0, 0, 0, 1, 1,
0.4299227, -1.509684, 2.614811, 0, 0, 0, 1, 1,
0.433438, 2.644457, 0.5821727, 0, 0, 0, 1, 1,
0.4373351, -0.4631435, 2.158543, 1, 1, 1, 1, 1,
0.4417039, 0.6391463, 1.630126, 1, 1, 1, 1, 1,
0.4431962, 1.137628, -0.006206092, 1, 1, 1, 1, 1,
0.444592, -1.984751, 4.336948, 1, 1, 1, 1, 1,
0.4466556, 0.3416006, 1.920117, 1, 1, 1, 1, 1,
0.4471082, 0.1907831, 2.973452, 1, 1, 1, 1, 1,
0.4501741, 0.5189392, 0.193542, 1, 1, 1, 1, 1,
0.4541561, 0.1837422, 1.55402, 1, 1, 1, 1, 1,
0.454609, -0.8668219, 3.013705, 1, 1, 1, 1, 1,
0.4563795, 0.1688242, 1.696407, 1, 1, 1, 1, 1,
0.4572087, -0.03036672, 1.361374, 1, 1, 1, 1, 1,
0.4578424, -0.4456177, 2.822134, 1, 1, 1, 1, 1,
0.4602964, 0.6398223, -0.3450671, 1, 1, 1, 1, 1,
0.4612318, 0.3539491, 1.399226, 1, 1, 1, 1, 1,
0.4680934, 0.2872068, 2.175246, 1, 1, 1, 1, 1,
0.4684835, -0.4327859, 2.518239, 0, 0, 1, 1, 1,
0.4716518, 0.4815062, 2.290948, 1, 0, 0, 1, 1,
0.472096, 0.7817668, -0.04495358, 1, 0, 0, 1, 1,
0.4728359, 1.657071, 0.3873865, 1, 0, 0, 1, 1,
0.473282, -0.3048283, 2.572128, 1, 0, 0, 1, 1,
0.4782995, 1.050748, 1.950527, 1, 0, 0, 1, 1,
0.4823114, 0.5478517, 0.5621244, 0, 0, 0, 1, 1,
0.4824831, 1.843328, -1.102054, 0, 0, 0, 1, 1,
0.4833298, 0.7445012, 1.191933, 0, 0, 0, 1, 1,
0.484403, 0.5532466, 1.262608, 0, 0, 0, 1, 1,
0.4857813, 0.6313267, 1.359926, 0, 0, 0, 1, 1,
0.4887662, -0.4051524, 2.453071, 0, 0, 0, 1, 1,
0.4897657, -0.2818748, -0.01484894, 0, 0, 0, 1, 1,
0.4931428, 0.2334369, 1.683838, 1, 1, 1, 1, 1,
0.4931906, -0.5733554, 1.999533, 1, 1, 1, 1, 1,
0.4947917, 1.026915, 0.5681373, 1, 1, 1, 1, 1,
0.4968573, -1.014619, 1.471337, 1, 1, 1, 1, 1,
0.5018468, -0.8091873, 3.33542, 1, 1, 1, 1, 1,
0.5059166, -1.927182, 2.998353, 1, 1, 1, 1, 1,
0.5070142, -0.8103642, 1.657326, 1, 1, 1, 1, 1,
0.5084829, 1.331922, 0.6049275, 1, 1, 1, 1, 1,
0.5100413, -1.57411, 3.788472, 1, 1, 1, 1, 1,
0.513916, -0.1675364, 2.587563, 1, 1, 1, 1, 1,
0.5186751, -0.8199964, 2.272727, 1, 1, 1, 1, 1,
0.5234634, -0.8175739, 3.366865, 1, 1, 1, 1, 1,
0.5272087, -0.408504, 1.654096, 1, 1, 1, 1, 1,
0.5274342, 0.2284732, 2.612765, 1, 1, 1, 1, 1,
0.530201, 1.035059, -0.5209916, 1, 1, 1, 1, 1,
0.5319432, -0.7927992, 1.345442, 0, 0, 1, 1, 1,
0.5330051, -0.5332245, 0.7583213, 1, 0, 0, 1, 1,
0.5381826, -0.8601491, 3.029883, 1, 0, 0, 1, 1,
0.5411, -0.7829443, 1.36092, 1, 0, 0, 1, 1,
0.5426761, 1.373874, 2.337984, 1, 0, 0, 1, 1,
0.5427912, -1.612597, 3.95372, 1, 0, 0, 1, 1,
0.5438552, -1.053372, 1.729312, 0, 0, 0, 1, 1,
0.5444678, 0.6269677, 0.4417475, 0, 0, 0, 1, 1,
0.550132, -0.9193254, 3.16924, 0, 0, 0, 1, 1,
0.5603931, 1.697698, 0.2087863, 0, 0, 0, 1, 1,
0.5640557, -1.032364, 3.153256, 0, 0, 0, 1, 1,
0.568795, 1.22115, -0.001210972, 0, 0, 0, 1, 1,
0.5688526, -0.2777649, 1.428636, 0, 0, 0, 1, 1,
0.580487, -0.3659841, 1.168549, 1, 1, 1, 1, 1,
0.5808864, 1.005848, -0.3182539, 1, 1, 1, 1, 1,
0.5809194, 0.3530815, 0.7355792, 1, 1, 1, 1, 1,
0.5834503, 0.3841659, -0.7397484, 1, 1, 1, 1, 1,
0.5863585, 2.675299, -1.962451, 1, 1, 1, 1, 1,
0.5933332, 0.5857757, 1.6826, 1, 1, 1, 1, 1,
0.5961025, -1.165282, 0.5935445, 1, 1, 1, 1, 1,
0.5977089, 2.059282, 1.156836, 1, 1, 1, 1, 1,
0.6000431, 1.550341, 0.08541903, 1, 1, 1, 1, 1,
0.6048018, -2.252131, 2.59966, 1, 1, 1, 1, 1,
0.6103349, -0.4800487, 1.011844, 1, 1, 1, 1, 1,
0.6148312, 0.9973344, 0.0393146, 1, 1, 1, 1, 1,
0.6214388, -0.5827858, 1.5547, 1, 1, 1, 1, 1,
0.6219741, -0.4096811, 1.289338, 1, 1, 1, 1, 1,
0.6310261, -1.055384, 3.265579, 1, 1, 1, 1, 1,
0.6349999, 0.9096487, 1.829031, 0, 0, 1, 1, 1,
0.6352772, -0.8532801, 3.331414, 1, 0, 0, 1, 1,
0.6360078, -1.464447, 2.635489, 1, 0, 0, 1, 1,
0.6388599, 1.278715, -0.452567, 1, 0, 0, 1, 1,
0.6405032, 0.2699743, 1.22926, 1, 0, 0, 1, 1,
0.6546398, -0.1104467, 0.5383314, 1, 0, 0, 1, 1,
0.6633963, -1.339115, 2.767295, 0, 0, 0, 1, 1,
0.6668219, -0.4119379, 2.259896, 0, 0, 0, 1, 1,
0.6688251, -0.6418684, 0.6249072, 0, 0, 0, 1, 1,
0.6706259, -0.3053871, 1.255037, 0, 0, 0, 1, 1,
0.6724974, -2.33388, 3.242709, 0, 0, 0, 1, 1,
0.6763531, -1.682681, 2.199011, 0, 0, 0, 1, 1,
0.6808975, 0.2275223, 0.6143751, 0, 0, 0, 1, 1,
0.6810447, 0.03533199, 0.7562704, 1, 1, 1, 1, 1,
0.6830785, -0.5986784, 2.733391, 1, 1, 1, 1, 1,
0.6867726, -0.6075909, 2.01623, 1, 1, 1, 1, 1,
0.6881364, 1.28391, 0.9311354, 1, 1, 1, 1, 1,
0.6942834, -0.848848, 4.186072, 1, 1, 1, 1, 1,
0.6955318, -0.3777514, 2.399899, 1, 1, 1, 1, 1,
0.6972014, 0.03789786, 1.925451, 1, 1, 1, 1, 1,
0.7062664, 0.5305522, -0.8262524, 1, 1, 1, 1, 1,
0.7067553, -0.02215724, -0.6748192, 1, 1, 1, 1, 1,
0.713605, 1.095842, 0.7940361, 1, 1, 1, 1, 1,
0.7137648, -1.152674, 2.440846, 1, 1, 1, 1, 1,
0.7143131, 1.150785, 1.257216, 1, 1, 1, 1, 1,
0.7145212, 1.347772, -0.7096083, 1, 1, 1, 1, 1,
0.7185375, -2.364839, 3.545867, 1, 1, 1, 1, 1,
0.7277707, 2.016724, -0.7234168, 1, 1, 1, 1, 1,
0.7311172, -0.3179345, 3.025362, 0, 0, 1, 1, 1,
0.7327244, 0.1070841, 1.845072, 1, 0, 0, 1, 1,
0.7364714, -0.6236961, 1.046039, 1, 0, 0, 1, 1,
0.7370639, -1.58809, 1.564573, 1, 0, 0, 1, 1,
0.7394097, 1.053234, 0.8352225, 1, 0, 0, 1, 1,
0.7395778, 0.1635869, 2.024064, 1, 0, 0, 1, 1,
0.7429072, -3.048614, 5.116972, 0, 0, 0, 1, 1,
0.7444451, 0.3114348, 0.5934561, 0, 0, 0, 1, 1,
0.7483082, -0.05170874, 2.75709, 0, 0, 0, 1, 1,
0.7498131, -0.1842386, 0.9513566, 0, 0, 0, 1, 1,
0.7538152, 1.294299, 1.686857, 0, 0, 0, 1, 1,
0.7555254, -0.2754428, 1.431677, 0, 0, 0, 1, 1,
0.7650945, -2.45505, 1.557621, 0, 0, 0, 1, 1,
0.7767122, -0.8526116, 3.676119, 1, 1, 1, 1, 1,
0.7802389, -1.416991, 3.815105, 1, 1, 1, 1, 1,
0.7807702, 1.140707, 0.5299422, 1, 1, 1, 1, 1,
0.7898104, -1.351182, 4.018904, 1, 1, 1, 1, 1,
0.796541, -0.8644805, 3.423874, 1, 1, 1, 1, 1,
0.8045753, 1.898305, 0.5302981, 1, 1, 1, 1, 1,
0.8090548, 1.400483, 1.484098, 1, 1, 1, 1, 1,
0.8118039, -0.04177386, 1.968223, 1, 1, 1, 1, 1,
0.8119802, -0.6958843, 2.151114, 1, 1, 1, 1, 1,
0.818061, 0.2174544, 2.808636, 1, 1, 1, 1, 1,
0.8196485, -1.245955, 3.860246, 1, 1, 1, 1, 1,
0.8207951, 3.038895, -0.7873832, 1, 1, 1, 1, 1,
0.8218122, 0.4373704, 1.784327, 1, 1, 1, 1, 1,
0.8285227, 0.2571962, 0.783527, 1, 1, 1, 1, 1,
0.8302206, 1.334163, 1.023562, 1, 1, 1, 1, 1,
0.8318288, -0.2361312, 0.8462859, 0, 0, 1, 1, 1,
0.8325654, -0.2119686, 2.346535, 1, 0, 0, 1, 1,
0.8349944, 0.05286028, 1.528154, 1, 0, 0, 1, 1,
0.8360361, 1.134992, -0.266765, 1, 0, 0, 1, 1,
0.8410414, 0.5439084, 0.9963491, 1, 0, 0, 1, 1,
0.8425882, 0.280745, 0.8972695, 1, 0, 0, 1, 1,
0.8432905, -1.038737, 2.455387, 0, 0, 0, 1, 1,
0.8444346, 1.220422, 1.97337, 0, 0, 0, 1, 1,
0.8484643, -0.6318913, 1.513728, 0, 0, 0, 1, 1,
0.8499652, -0.8164383, 1.441572, 0, 0, 0, 1, 1,
0.8522227, -0.1780998, 2.707794, 0, 0, 0, 1, 1,
0.8522601, 0.726695, 1.199566, 0, 0, 0, 1, 1,
0.8533663, 0.4683568, 2.379438, 0, 0, 0, 1, 1,
0.8556126, -0.32581, 3.687839, 1, 1, 1, 1, 1,
0.8567048, 1.079645, 0.2306987, 1, 1, 1, 1, 1,
0.8568626, -0.5540147, 1.607114, 1, 1, 1, 1, 1,
0.857949, -0.6703259, 0.8564559, 1, 1, 1, 1, 1,
0.8618878, 1.082519, 1.749507, 1, 1, 1, 1, 1,
0.8635575, -0.2943786, 3.410635, 1, 1, 1, 1, 1,
0.8636453, 0.2805461, 1.761583, 1, 1, 1, 1, 1,
0.8659626, 2.128654, 0.2489479, 1, 1, 1, 1, 1,
0.872917, 1.146576, 0.7035131, 1, 1, 1, 1, 1,
0.8742168, 0.6173512, 1.639219, 1, 1, 1, 1, 1,
0.8763983, 0.939204, 0.09223211, 1, 1, 1, 1, 1,
0.8772609, -0.1296092, 2.300128, 1, 1, 1, 1, 1,
0.8840348, 0.777203, 0.1431852, 1, 1, 1, 1, 1,
0.8863156, 0.272954, 0.6542594, 1, 1, 1, 1, 1,
0.8906547, -1.0838, 3.41205, 1, 1, 1, 1, 1,
0.8920338, 0.1954546, 3.565064, 0, 0, 1, 1, 1,
0.89377, 0.05571958, 2.599302, 1, 0, 0, 1, 1,
0.8948894, -1.064026, 2.856118, 1, 0, 0, 1, 1,
0.8963628, 1.783823, -0.1011484, 1, 0, 0, 1, 1,
0.8997486, 1.575227, -0.2688748, 1, 0, 0, 1, 1,
0.9020206, 0.1940553, 1.845185, 1, 0, 0, 1, 1,
0.9097961, -0.3850594, 1.41447, 0, 0, 0, 1, 1,
0.9101078, 0.3829716, 0.4693793, 0, 0, 0, 1, 1,
0.9138972, 0.8897546, -0.6358076, 0, 0, 0, 1, 1,
0.925087, 0.1993313, 1.662478, 0, 0, 0, 1, 1,
0.9340874, -1.159196, 1.022827, 0, 0, 0, 1, 1,
0.9395969, -0.2253769, 1.10916, 0, 0, 0, 1, 1,
0.9407468, 0.1718261, 1.453582, 0, 0, 0, 1, 1,
0.9434898, 1.399768, 0.236611, 1, 1, 1, 1, 1,
0.9493166, 0.8961859, -0.9514459, 1, 1, 1, 1, 1,
0.9646112, 0.8135119, 1.608309, 1, 1, 1, 1, 1,
0.9732885, 0.1594489, 0.8845986, 1, 1, 1, 1, 1,
0.9744467, 0.8781281, 0.01599997, 1, 1, 1, 1, 1,
0.9880322, -1.714814, 2.932698, 1, 1, 1, 1, 1,
0.9942304, -0.8826359, 2.285086, 1, 1, 1, 1, 1,
0.9971938, 0.81501, 1.01853, 1, 1, 1, 1, 1,
0.9972256, 0.06134356, 2.217679, 1, 1, 1, 1, 1,
1.002382, 0.3731581, 0.5413278, 1, 1, 1, 1, 1,
1.005148, 1.026583, -1.267884, 1, 1, 1, 1, 1,
1.005333, -0.265303, 2.50068, 1, 1, 1, 1, 1,
1.006453, -0.8551528, 1.72684, 1, 1, 1, 1, 1,
1.011741, 0.6895576, -0.1416934, 1, 1, 1, 1, 1,
1.017223, 0.3252979, 0.4489281, 1, 1, 1, 1, 1,
1.027526, -0.1263877, 0.6080823, 0, 0, 1, 1, 1,
1.03581, -0.4485422, 2.7949, 1, 0, 0, 1, 1,
1.044433, -0.785839, 2.189962, 1, 0, 0, 1, 1,
1.045956, 0.8497612, 0.8895004, 1, 0, 0, 1, 1,
1.048673, 0.01436902, 1.307846, 1, 0, 0, 1, 1,
1.051723, -0.4890414, 1.962805, 1, 0, 0, 1, 1,
1.054445, 1.364887, 1.827596, 0, 0, 0, 1, 1,
1.055414, -1.164744, 0.1340117, 0, 0, 0, 1, 1,
1.063945, 0.2739147, 1.457321, 0, 0, 0, 1, 1,
1.071796, 0.007627791, 0.2476214, 0, 0, 0, 1, 1,
1.074774, -1.067077, 2.73357, 0, 0, 0, 1, 1,
1.079181, 0.1356763, 1.445006, 0, 0, 0, 1, 1,
1.081922, 0.7466013, 0.1592344, 0, 0, 0, 1, 1,
1.087339, -1.673989, 3.978237, 1, 1, 1, 1, 1,
1.08739, -1.165655, 0.4225262, 1, 1, 1, 1, 1,
1.09449, -0.332698, 2.521085, 1, 1, 1, 1, 1,
1.097136, 1.102196, 0.2651315, 1, 1, 1, 1, 1,
1.10125, -0.5823788, 1.689569, 1, 1, 1, 1, 1,
1.101762, -1.542555, 3.570329, 1, 1, 1, 1, 1,
1.102358, 1.705531, -0.9557095, 1, 1, 1, 1, 1,
1.103268, -0.3141907, 1.965613, 1, 1, 1, 1, 1,
1.110208, -0.05059692, 2.285764, 1, 1, 1, 1, 1,
1.114224, 0.5544214, 1.850608, 1, 1, 1, 1, 1,
1.121445, 1.438014, -0.457638, 1, 1, 1, 1, 1,
1.127142, 0.9106659, 1.122649, 1, 1, 1, 1, 1,
1.127168, -1.034317, 0.6871588, 1, 1, 1, 1, 1,
1.13348, 0.4643275, 1.391075, 1, 1, 1, 1, 1,
1.143366, 1.55227, -0.05533602, 1, 1, 1, 1, 1,
1.151906, -1.344124, 1.800149, 0, 0, 1, 1, 1,
1.152674, -0.3411042, 1.905544, 1, 0, 0, 1, 1,
1.154519, 1.988103, -0.2833672, 1, 0, 0, 1, 1,
1.155414, -0.3374318, 0.4380364, 1, 0, 0, 1, 1,
1.159043, -1.084425, 2.023935, 1, 0, 0, 1, 1,
1.16458, 0.2621661, 0.752397, 1, 0, 0, 1, 1,
1.167804, 0.2693296, 1.388535, 0, 0, 0, 1, 1,
1.175848, 0.3137919, 0.782869, 0, 0, 0, 1, 1,
1.2245, -0.007490376, 1.244829, 0, 0, 0, 1, 1,
1.225579, 0.6236634, 0.4110601, 0, 0, 0, 1, 1,
1.229991, 0.4528867, 0.5052163, 0, 0, 0, 1, 1,
1.237396, 0.223376, 2.396064, 0, 0, 0, 1, 1,
1.270324, -0.2111328, 1.896853, 0, 0, 0, 1, 1,
1.271835, -0.1829298, 1.341801, 1, 1, 1, 1, 1,
1.273173, -1.177214, 1.196766, 1, 1, 1, 1, 1,
1.276809, -0.3630851, 2.734375, 1, 1, 1, 1, 1,
1.28124, -1.234266, 2.791886, 1, 1, 1, 1, 1,
1.286247, 0.6200562, -1.985347, 1, 1, 1, 1, 1,
1.301685, -1.448446, 2.894094, 1, 1, 1, 1, 1,
1.303504, -1.055943, 1.871848, 1, 1, 1, 1, 1,
1.307196, -1.335877, 2.22943, 1, 1, 1, 1, 1,
1.32407, 0.6212841, 3.516786, 1, 1, 1, 1, 1,
1.341977, 0.670399, 0.9082944, 1, 1, 1, 1, 1,
1.344735, -0.8346815, 3.049005, 1, 1, 1, 1, 1,
1.350042, -0.39259, 1.479157, 1, 1, 1, 1, 1,
1.373611, -1.566308, 1.263869, 1, 1, 1, 1, 1,
1.37953, -0.2333677, 0.9903082, 1, 1, 1, 1, 1,
1.381853, 0.08611878, -0.4699512, 1, 1, 1, 1, 1,
1.384843, -0.2213126, 1.332255, 0, 0, 1, 1, 1,
1.387189, 0.2918448, 2.62799, 1, 0, 0, 1, 1,
1.387192, -1.041239, 1.038283, 1, 0, 0, 1, 1,
1.390748, 0.05170962, 0.9523802, 1, 0, 0, 1, 1,
1.394705, 0.3134222, 2.052162, 1, 0, 0, 1, 1,
1.398193, 1.247352, 1.366908, 1, 0, 0, 1, 1,
1.404204, 0.2433284, 0.3501271, 0, 0, 0, 1, 1,
1.418754, 0.6172411, -0.1007895, 0, 0, 0, 1, 1,
1.421395, -2.056311, 2.901591, 0, 0, 0, 1, 1,
1.44036, -0.8420315, 1.538699, 0, 0, 0, 1, 1,
1.449738, -2.077106, 1.166929, 0, 0, 0, 1, 1,
1.450627, 1.49578, 0.4008101, 0, 0, 0, 1, 1,
1.456407, 0.5591497, 1.858803, 0, 0, 0, 1, 1,
1.459217, -1.320069, 2.464157, 1, 1, 1, 1, 1,
1.464876, -0.3778592, 1.715135, 1, 1, 1, 1, 1,
1.468635, -1.599297, 1.99506, 1, 1, 1, 1, 1,
1.469057, -0.08989638, 1.824851, 1, 1, 1, 1, 1,
1.485598, 0.1315454, 1.263755, 1, 1, 1, 1, 1,
1.48776, -1.043387, 0.1504317, 1, 1, 1, 1, 1,
1.49944, -0.387539, 2.353496, 1, 1, 1, 1, 1,
1.506735, 0.2664894, 1.276915, 1, 1, 1, 1, 1,
1.510236, -2.288495, 3.513242, 1, 1, 1, 1, 1,
1.51156, 0.7891003, -0.797298, 1, 1, 1, 1, 1,
1.513914, 1.214839, 0.8107533, 1, 1, 1, 1, 1,
1.533123, -0.9227596, 3.134685, 1, 1, 1, 1, 1,
1.534254, -0.003356108, -0.2621777, 1, 1, 1, 1, 1,
1.535014, -1.094948, 2.132012, 1, 1, 1, 1, 1,
1.543312, 0.7226948, 0.8288146, 1, 1, 1, 1, 1,
1.55173, -0.6833349, 1.688107, 0, 0, 1, 1, 1,
1.60483, 0.8218685, 3.249387, 1, 0, 0, 1, 1,
1.605791, 0.9418539, -0.208974, 1, 0, 0, 1, 1,
1.608407, 1.358289, 0.1210335, 1, 0, 0, 1, 1,
1.61018, -1.351797, 2.244857, 1, 0, 0, 1, 1,
1.616923, -0.5655013, 2.100684, 1, 0, 0, 1, 1,
1.619025, -1.063608, 1.514317, 0, 0, 0, 1, 1,
1.622291, -0.6489412, 1.294688, 0, 0, 0, 1, 1,
1.624346, -0.1262183, 2.87354, 0, 0, 0, 1, 1,
1.635083, 0.6762118, -0.6783127, 0, 0, 0, 1, 1,
1.708374, 2.05962, -0.4966435, 0, 0, 0, 1, 1,
1.723048, 2.267023, 0.2127866, 0, 0, 0, 1, 1,
1.724037, -1.64325, 1.850567, 0, 0, 0, 1, 1,
1.726061, 1.623614, 0.8012149, 1, 1, 1, 1, 1,
1.742776, 1.252547, 2.499023, 1, 1, 1, 1, 1,
1.760546, -1.287242, 3.763316, 1, 1, 1, 1, 1,
1.790892, -0.1580902, 2.025198, 1, 1, 1, 1, 1,
1.821262, 0.3163697, 0.8340316, 1, 1, 1, 1, 1,
1.824663, 1.041697, 1.413742, 1, 1, 1, 1, 1,
1.832295, 0.08550575, 1.685913, 1, 1, 1, 1, 1,
1.850794, 0.1515564, 1.566543, 1, 1, 1, 1, 1,
1.862255, 1.277887, 2.28782, 1, 1, 1, 1, 1,
1.911685, 0.5239775, 0.2682142, 1, 1, 1, 1, 1,
1.935611, -1.026126, 2.450667, 1, 1, 1, 1, 1,
1.935891, 1.476008, 0.9328683, 1, 1, 1, 1, 1,
2.022337, 0.05381963, -0.03793908, 1, 1, 1, 1, 1,
2.034105, -0.7369189, 1.715316, 1, 1, 1, 1, 1,
2.03819, -0.9771673, 3.32346, 1, 1, 1, 1, 1,
2.038728, 1.404226, 1.678638, 0, 0, 1, 1, 1,
2.040781, 0.01081066, -0.3946692, 1, 0, 0, 1, 1,
2.073497, 0.7475607, 2.357835, 1, 0, 0, 1, 1,
2.132179, -1.758681, 2.941294, 1, 0, 0, 1, 1,
2.144529, -0.9936728, 1.85913, 1, 0, 0, 1, 1,
2.153702, 1.07545, -0.5071521, 1, 0, 0, 1, 1,
2.185218, 1.586231, 1.731024, 0, 0, 0, 1, 1,
2.253239, 1.096279, 2.379048, 0, 0, 0, 1, 1,
2.269122, 0.1268946, 3.085717, 0, 0, 0, 1, 1,
2.341122, -1.318241, 2.032149, 0, 0, 0, 1, 1,
2.427153, 0.2987343, 1.788884, 0, 0, 0, 1, 1,
2.436262, 0.8313373, 0.8573385, 0, 0, 0, 1, 1,
2.457742, -0.9304569, 2.469222, 0, 0, 0, 1, 1,
2.485567, 0.01800661, 1.467687, 1, 1, 1, 1, 1,
2.54952, -0.3822784, 2.626376, 1, 1, 1, 1, 1,
2.591135, 1.890332, 1.992354, 1, 1, 1, 1, 1,
2.62066, 0.5091916, 1.206409, 1, 1, 1, 1, 1,
2.62982, 1.108734, 0.1760617, 1, 1, 1, 1, 1,
2.836544, -1.944129, 0.7971889, 1, 1, 1, 1, 1,
3.021706, 1.43302, 0.8747899, 1, 1, 1, 1, 1
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
var radius = 9.615091;
var distance = 33.77259;
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
mvMatrix.translate( 0.2103124, 0.1164706, 0.1826408 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.77259);
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
