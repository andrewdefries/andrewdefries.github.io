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
-3.684558, -0.7518831, -1.544805, 1, 0, 0, 1,
-2.727066, -0.4046197, -1.585429, 1, 0.007843138, 0, 1,
-2.480493, -0.09477729, -0.06419701, 1, 0.01176471, 0, 1,
-2.461555, 1.167876, -1.582672, 1, 0.01960784, 0, 1,
-2.438713, -0.2482824, -1.510831, 1, 0.02352941, 0, 1,
-2.431169, 0.380113, -1.991437, 1, 0.03137255, 0, 1,
-2.314839, -1.841454, -1.232393, 1, 0.03529412, 0, 1,
-2.242386, 0.4502715, -2.816639, 1, 0.04313726, 0, 1,
-2.182694, 0.9681726, -0.9287933, 1, 0.04705882, 0, 1,
-2.168128, 0.3303684, -1.087418, 1, 0.05490196, 0, 1,
-2.145853, 0.3101237, -0.3559111, 1, 0.05882353, 0, 1,
-2.111255, 0.6681837, -1.042203, 1, 0.06666667, 0, 1,
-2.1097, 1.623865, -2.084224, 1, 0.07058824, 0, 1,
-2.072624, 2.439333, -1.628117, 1, 0.07843138, 0, 1,
-2.062534, -0.2512279, -1.713287, 1, 0.08235294, 0, 1,
-2.050625, -1.915633, -2.656056, 1, 0.09019608, 0, 1,
-2.008873, 0.8505897, -1.347297, 1, 0.09411765, 0, 1,
-2.000476, 0.4529048, -0.3223671, 1, 0.1019608, 0, 1,
-1.874337, -0.7406349, -2.260081, 1, 0.1098039, 0, 1,
-1.861478, 1.660595, -2.017583, 1, 0.1137255, 0, 1,
-1.851238, -1.819445, -2.265857, 1, 0.1215686, 0, 1,
-1.843208, 1.861742, 0.1993759, 1, 0.1254902, 0, 1,
-1.828129, -0.6103118, -2.389874, 1, 0.1333333, 0, 1,
-1.827846, -0.3277501, -1.196118, 1, 0.1372549, 0, 1,
-1.826976, -0.2510782, -2.13926, 1, 0.145098, 0, 1,
-1.819029, -0.3868632, -0.9905612, 1, 0.1490196, 0, 1,
-1.788258, 0.2185886, -2.411181, 1, 0.1568628, 0, 1,
-1.787478, 0.2143982, -0.4778695, 1, 0.1607843, 0, 1,
-1.782666, 0.6601403, -0.7239565, 1, 0.1686275, 0, 1,
-1.76814, 0.3493825, 0.6532713, 1, 0.172549, 0, 1,
-1.767625, -1.14342, -2.888957, 1, 0.1803922, 0, 1,
-1.760087, 2.015593, 0.6665614, 1, 0.1843137, 0, 1,
-1.755271, 1.751517, -1.369285, 1, 0.1921569, 0, 1,
-1.746396, 1.641957, -1.435908, 1, 0.1960784, 0, 1,
-1.74614, 1.736702, -1.540469, 1, 0.2039216, 0, 1,
-1.744577, 2.436602, 0.6184384, 1, 0.2117647, 0, 1,
-1.742893, 1.664377, 1.710967, 1, 0.2156863, 0, 1,
-1.733946, 0.6732607, -1.048163, 1, 0.2235294, 0, 1,
-1.71996, 0.8814103, -0.4951189, 1, 0.227451, 0, 1,
-1.719854, 2.091773, 0.237561, 1, 0.2352941, 0, 1,
-1.719396, -0.2189749, -1.563859, 1, 0.2392157, 0, 1,
-1.696549, -0.435784, 0.02235399, 1, 0.2470588, 0, 1,
-1.670865, 0.7630236, -1.990727, 1, 0.2509804, 0, 1,
-1.654114, -0.6269898, -2.492456, 1, 0.2588235, 0, 1,
-1.640858, 0.2918654, -0.1813296, 1, 0.2627451, 0, 1,
-1.621933, -1.104478, -1.173884, 1, 0.2705882, 0, 1,
-1.621277, -1.323929, -2.503658, 1, 0.2745098, 0, 1,
-1.619966, 0.474136, -1.644843, 1, 0.282353, 0, 1,
-1.593725, -0.1807456, -3.054622, 1, 0.2862745, 0, 1,
-1.571256, -0.4164445, -2.976121, 1, 0.2941177, 0, 1,
-1.565169, -0.8569165, -2.818302, 1, 0.3019608, 0, 1,
-1.562361, 1.338828, 0.1890104, 1, 0.3058824, 0, 1,
-1.559364, 0.6324641, -0.9961565, 1, 0.3137255, 0, 1,
-1.549223, 0.2364289, -0.141849, 1, 0.3176471, 0, 1,
-1.53785, -0.2162335, -3.430989, 1, 0.3254902, 0, 1,
-1.499264, 1.074561, -1.843175, 1, 0.3294118, 0, 1,
-1.498718, 0.3184382, -3.105513, 1, 0.3372549, 0, 1,
-1.495304, -0.2640327, -3.325054, 1, 0.3411765, 0, 1,
-1.493189, -1.796341, -3.070369, 1, 0.3490196, 0, 1,
-1.483497, -0.2976764, -1.651188, 1, 0.3529412, 0, 1,
-1.465842, 1.824109, -1.257435, 1, 0.3607843, 0, 1,
-1.451659, 0.3038332, -2.507556, 1, 0.3647059, 0, 1,
-1.448468, -0.1023391, -2.062017, 1, 0.372549, 0, 1,
-1.441715, -0.6625275, -3.649156, 1, 0.3764706, 0, 1,
-1.425182, 1.945327, -0.8443646, 1, 0.3843137, 0, 1,
-1.406181, -0.7668008, -1.749986, 1, 0.3882353, 0, 1,
-1.403206, 0.6111533, -1.24493, 1, 0.3960784, 0, 1,
-1.389979, 0.206234, -0.7618324, 1, 0.4039216, 0, 1,
-1.382156, 0.1668579, -2.730596, 1, 0.4078431, 0, 1,
-1.381554, -0.2333208, -1.142472, 1, 0.4156863, 0, 1,
-1.355742, 1.083493, -0.615566, 1, 0.4196078, 0, 1,
-1.344689, -1.896798, -1.108116, 1, 0.427451, 0, 1,
-1.339801, 0.8776056, -1.072709, 1, 0.4313726, 0, 1,
-1.339192, 1.230517, -1.024177, 1, 0.4392157, 0, 1,
-1.331118, 2.381871, 0.3580637, 1, 0.4431373, 0, 1,
-1.323936, -0.7918113, -0.934504, 1, 0.4509804, 0, 1,
-1.320545, 1.431759, -1.725668, 1, 0.454902, 0, 1,
-1.319782, 2.147625, -0.4369898, 1, 0.4627451, 0, 1,
-1.313213, 1.636209, -0.3672007, 1, 0.4666667, 0, 1,
-1.309981, 0.5780756, -0.9925591, 1, 0.4745098, 0, 1,
-1.307649, 0.6626953, -2.08515, 1, 0.4784314, 0, 1,
-1.302708, 1.382165, -2.030944, 1, 0.4862745, 0, 1,
-1.299612, -2.012041, -3.866143, 1, 0.4901961, 0, 1,
-1.29897, -1.091548, -2.723625, 1, 0.4980392, 0, 1,
-1.296443, -0.7287886, -2.968261, 1, 0.5058824, 0, 1,
-1.296268, 0.2189639, 0.2330628, 1, 0.509804, 0, 1,
-1.292305, 0.01274787, -2.384598, 1, 0.5176471, 0, 1,
-1.276788, 0.4551279, 0.4643119, 1, 0.5215687, 0, 1,
-1.274452, 0.6611025, -1.278463, 1, 0.5294118, 0, 1,
-1.270203, 1.135526, -1.487419, 1, 0.5333334, 0, 1,
-1.268739, 0.1458227, -1.76881, 1, 0.5411765, 0, 1,
-1.267697, -0.1490022, -0.9257478, 1, 0.5450981, 0, 1,
-1.265275, 1.319, -2.013342, 1, 0.5529412, 0, 1,
-1.25555, 1.255519, -1.306011, 1, 0.5568628, 0, 1,
-1.244037, -1.763086, -0.5956659, 1, 0.5647059, 0, 1,
-1.234749, -0.4471152, -2.132792, 1, 0.5686275, 0, 1,
-1.234257, 0.9354697, -0.05442819, 1, 0.5764706, 0, 1,
-1.234068, 0.4165821, -1.302971, 1, 0.5803922, 0, 1,
-1.233842, -0.7932369, -2.563195, 1, 0.5882353, 0, 1,
-1.232078, -1.112764, -2.252188, 1, 0.5921569, 0, 1,
-1.227562, -0.09234454, -2.329572, 1, 0.6, 0, 1,
-1.22735, 0.8759342, -1.431491, 1, 0.6078432, 0, 1,
-1.222995, 0.6474473, -1.984784, 1, 0.6117647, 0, 1,
-1.1987, -1.028981, -1.93191, 1, 0.6196079, 0, 1,
-1.191322, 0.8358633, -1.173833, 1, 0.6235294, 0, 1,
-1.189504, 0.7904562, -0.9157755, 1, 0.6313726, 0, 1,
-1.18934, -1.910932, -2.759664, 1, 0.6352941, 0, 1,
-1.188363, 0.323256, -1.679234, 1, 0.6431373, 0, 1,
-1.1862, 0.07289968, -2.940986, 1, 0.6470588, 0, 1,
-1.184409, -0.4250515, -3.63717, 1, 0.654902, 0, 1,
-1.179223, 0.5581791, -0.6868799, 1, 0.6588235, 0, 1,
-1.177332, -0.7392138, -2.408773, 1, 0.6666667, 0, 1,
-1.16573, -0.09168255, -1.74726, 1, 0.6705883, 0, 1,
-1.165145, 1.834904, 0.4775168, 1, 0.6784314, 0, 1,
-1.164291, -0.7603291, -2.257987, 1, 0.682353, 0, 1,
-1.163076, -0.7936026, -2.448543, 1, 0.6901961, 0, 1,
-1.161376, 1.412804, -0.695783, 1, 0.6941177, 0, 1,
-1.157872, -0.3173893, -1.950401, 1, 0.7019608, 0, 1,
-1.157162, -0.6809675, -1.670926, 1, 0.7098039, 0, 1,
-1.15471, 1.118518, 1.361802, 1, 0.7137255, 0, 1,
-1.152976, -1.867857, -4.526465, 1, 0.7215686, 0, 1,
-1.145604, -0.1113307, -2.310966, 1, 0.7254902, 0, 1,
-1.144501, -1.459081, -2.901534, 1, 0.7333333, 0, 1,
-1.139533, -0.3337072, -2.929291, 1, 0.7372549, 0, 1,
-1.126042, 1.000359, -0.9093415, 1, 0.7450981, 0, 1,
-1.125168, 0.3215845, -0.8227125, 1, 0.7490196, 0, 1,
-1.120375, -0.06286876, -2.378775, 1, 0.7568628, 0, 1,
-1.113316, 0.7295873, -0.7506993, 1, 0.7607843, 0, 1,
-1.105303, 0.8023999, 0.7560614, 1, 0.7686275, 0, 1,
-1.103464, -0.660206, -2.063435, 1, 0.772549, 0, 1,
-1.089529, 0.2445803, -0.1431281, 1, 0.7803922, 0, 1,
-1.088518, 0.04500208, -0.8106269, 1, 0.7843137, 0, 1,
-1.065346, -1.032501, 0.02029033, 1, 0.7921569, 0, 1,
-1.05936, -0.35946, -2.598191, 1, 0.7960784, 0, 1,
-1.056911, 0.5796145, -1.077847, 1, 0.8039216, 0, 1,
-1.055718, -1.126755, -2.685298, 1, 0.8117647, 0, 1,
-1.049311, 0.9028001, -1.072583, 1, 0.8156863, 0, 1,
-1.046803, -2.254618, -1.256082, 1, 0.8235294, 0, 1,
-1.045752, 0.7915058, -1.729438, 1, 0.827451, 0, 1,
-1.039028, 1.324499, 0.4141848, 1, 0.8352941, 0, 1,
-1.035068, 0.8369658, -0.3534068, 1, 0.8392157, 0, 1,
-1.030105, 0.4186283, -1.46972, 1, 0.8470588, 0, 1,
-1.026637, 1.896679, -0.8447842, 1, 0.8509804, 0, 1,
-1.021192, -1.140318, -2.699154, 1, 0.8588235, 0, 1,
-1.017841, 0.02625831, -2.396507, 1, 0.8627451, 0, 1,
-1.016217, 0.2287557, -1.922606, 1, 0.8705882, 0, 1,
-1.016199, 0.1959897, -2.608806, 1, 0.8745098, 0, 1,
-1.010393, -0.9072269, -1.232893, 1, 0.8823529, 0, 1,
-1.008785, -1.433304, -1.242365, 1, 0.8862745, 0, 1,
-1.00767, 0.6337742, -1.490481, 1, 0.8941177, 0, 1,
-0.9969034, -0.533863, -1.268627, 1, 0.8980392, 0, 1,
-0.9817864, 0.5528058, -1.734493, 1, 0.9058824, 0, 1,
-0.9806619, 1.275942, -0.7090982, 1, 0.9137255, 0, 1,
-0.9756792, 1.322279, -0.8195235, 1, 0.9176471, 0, 1,
-0.9733116, 2.635331, -0.3190118, 1, 0.9254902, 0, 1,
-0.9675635, -0.3503954, -2.2069, 1, 0.9294118, 0, 1,
-0.961902, 0.8192775, -1.345602, 1, 0.9372549, 0, 1,
-0.9561175, -0.1259604, -1.925961, 1, 0.9411765, 0, 1,
-0.9549494, -1.338018, 0.05651322, 1, 0.9490196, 0, 1,
-0.954083, 0.2184083, 0.5942571, 1, 0.9529412, 0, 1,
-0.9449586, 1.099189, -0.587417, 1, 0.9607843, 0, 1,
-0.9435815, -1.7578, -1.351376, 1, 0.9647059, 0, 1,
-0.9434946, 1.315779, 0.3419034, 1, 0.972549, 0, 1,
-0.943087, -1.332511, -0.3860738, 1, 0.9764706, 0, 1,
-0.9303895, 0.5821576, -2.451617, 1, 0.9843137, 0, 1,
-0.9293459, 0.5419874, -1.121178, 1, 0.9882353, 0, 1,
-0.9280913, 0.2924281, -0.9852102, 1, 0.9960784, 0, 1,
-0.9268231, 0.8497281, 0.5511904, 0.9960784, 1, 0, 1,
-0.9205763, 0.3997844, -1.418364, 0.9921569, 1, 0, 1,
-0.9189651, 0.6815543, -1.594541, 0.9843137, 1, 0, 1,
-0.911467, 0.07834691, 0.0317756, 0.9803922, 1, 0, 1,
-0.9112513, -0.5003728, -2.021395, 0.972549, 1, 0, 1,
-0.9107991, 0.1092928, -1.955557, 0.9686275, 1, 0, 1,
-0.9103671, 0.3996952, -1.286221, 0.9607843, 1, 0, 1,
-0.9079357, 1.155412, -1.812504, 0.9568627, 1, 0, 1,
-0.9062298, -0.003476409, -1.649225, 0.9490196, 1, 0, 1,
-0.9045909, -0.2344557, -1.667624, 0.945098, 1, 0, 1,
-0.9023243, 0.4044531, 0.1345686, 0.9372549, 1, 0, 1,
-0.89833, -0.6506383, -1.484284, 0.9333333, 1, 0, 1,
-0.8919691, 1.152019, 0.7233375, 0.9254902, 1, 0, 1,
-0.8869306, -0.9752616, -3.241976, 0.9215686, 1, 0, 1,
-0.8662627, 1.291365, -1.244022, 0.9137255, 1, 0, 1,
-0.8650938, -0.5772862, -3.039924, 0.9098039, 1, 0, 1,
-0.8634236, 0.09362751, -0.440833, 0.9019608, 1, 0, 1,
-0.8610941, -0.05555657, -1.679987, 0.8941177, 1, 0, 1,
-0.8562044, -2.291409, -3.040772, 0.8901961, 1, 0, 1,
-0.8356529, 0.6394025, -1.09694, 0.8823529, 1, 0, 1,
-0.8312839, -0.9038543, -3.300092, 0.8784314, 1, 0, 1,
-0.8301031, 0.1086691, -1.825858, 0.8705882, 1, 0, 1,
-0.8300057, 0.6564933, -2.41785, 0.8666667, 1, 0, 1,
-0.8277885, -0.9535949, -2.240355, 0.8588235, 1, 0, 1,
-0.824813, 0.9754117, -0.3980538, 0.854902, 1, 0, 1,
-0.8234735, -0.6938708, -2.164805, 0.8470588, 1, 0, 1,
-0.8233702, -0.5008465, -2.603903, 0.8431373, 1, 0, 1,
-0.8212517, 0.577253, -1.130116, 0.8352941, 1, 0, 1,
-0.8096713, -0.5156373, -0.9317039, 0.8313726, 1, 0, 1,
-0.8058698, -0.7250487, -4.139387, 0.8235294, 1, 0, 1,
-0.8025177, -0.5852018, -0.03302458, 0.8196079, 1, 0, 1,
-0.8002905, -0.0800058, -1.725884, 0.8117647, 1, 0, 1,
-0.7992288, 0.427056, -2.094747, 0.8078431, 1, 0, 1,
-0.7931206, 0.4671668, 0.446733, 0.8, 1, 0, 1,
-0.7916507, 0.06544948, -2.217282, 0.7921569, 1, 0, 1,
-0.7882614, -0.6938168, -1.785491, 0.7882353, 1, 0, 1,
-0.785965, 0.2457353, -1.232439, 0.7803922, 1, 0, 1,
-0.7829954, -0.1568364, -3.111777, 0.7764706, 1, 0, 1,
-0.7757492, -0.4624414, -1.288866, 0.7686275, 1, 0, 1,
-0.774909, -0.9044048, -3.046549, 0.7647059, 1, 0, 1,
-0.774722, -1.324254, -3.947235, 0.7568628, 1, 0, 1,
-0.7733386, 0.2697064, -1.772904, 0.7529412, 1, 0, 1,
-0.767234, -0.6697753, -1.731441, 0.7450981, 1, 0, 1,
-0.7655094, 0.8742391, 0.3612881, 0.7411765, 1, 0, 1,
-0.7646235, 1.753656, -0.7949286, 0.7333333, 1, 0, 1,
-0.7599534, -0.8173456, -1.938444, 0.7294118, 1, 0, 1,
-0.7598073, 0.2306619, -1.43243, 0.7215686, 1, 0, 1,
-0.7588859, -0.4195235, -3.170794, 0.7176471, 1, 0, 1,
-0.7577062, -1.347986, -4.177195, 0.7098039, 1, 0, 1,
-0.7553871, 0.4318154, -2.621716, 0.7058824, 1, 0, 1,
-0.7547686, 0.7304344, 2.403639, 0.6980392, 1, 0, 1,
-0.7498593, 0.7768326, -1.767751, 0.6901961, 1, 0, 1,
-0.7473869, -0.2819767, -0.2878858, 0.6862745, 1, 0, 1,
-0.7471367, 2.395843, -1.033536, 0.6784314, 1, 0, 1,
-0.7408887, -0.2794041, -1.19785, 0.6745098, 1, 0, 1,
-0.7379175, -0.5801954, -2.949116, 0.6666667, 1, 0, 1,
-0.7308302, -1.257867, -4.236423, 0.6627451, 1, 0, 1,
-0.7306173, -0.7538746, -2.146739, 0.654902, 1, 0, 1,
-0.7236748, 1.501178, -0.4580789, 0.6509804, 1, 0, 1,
-0.7226037, 1.452999, -0.9717036, 0.6431373, 1, 0, 1,
-0.7215918, 0.7825104, -1.912602, 0.6392157, 1, 0, 1,
-0.7195893, -0.6628451, -4.734178, 0.6313726, 1, 0, 1,
-0.7175406, 0.4163019, -2.190003, 0.627451, 1, 0, 1,
-0.7172462, 1.652611, 0.1764801, 0.6196079, 1, 0, 1,
-0.7104094, -0.7869126, -3.255561, 0.6156863, 1, 0, 1,
-0.7042475, -1.032954, -2.641899, 0.6078432, 1, 0, 1,
-0.698445, 2.856402, 1.132217, 0.6039216, 1, 0, 1,
-0.6976047, 0.7833823, -1.882577, 0.5960785, 1, 0, 1,
-0.6845564, -1.37899, -2.566107, 0.5882353, 1, 0, 1,
-0.6831916, -0.4343209, -2.968162, 0.5843138, 1, 0, 1,
-0.6829038, 0.1208205, -1.564515, 0.5764706, 1, 0, 1,
-0.6783271, 0.6517742, -0.7301727, 0.572549, 1, 0, 1,
-0.6756546, 0.6475761, 0.3795467, 0.5647059, 1, 0, 1,
-0.6696241, -1.255252, -2.792946, 0.5607843, 1, 0, 1,
-0.6689771, -0.5296647, -1.775115, 0.5529412, 1, 0, 1,
-0.6667061, -0.3889254, -1.177676, 0.5490196, 1, 0, 1,
-0.6660659, 1.46855, 0.6883872, 0.5411765, 1, 0, 1,
-0.665092, 0.6439001, 0.3575289, 0.5372549, 1, 0, 1,
-0.6634359, 1.388688, -0.4210119, 0.5294118, 1, 0, 1,
-0.6612653, 0.315384, -0.7591109, 0.5254902, 1, 0, 1,
-0.6578724, -0.1146917, 1.132786, 0.5176471, 1, 0, 1,
-0.6562674, -0.4132458, -1.385378, 0.5137255, 1, 0, 1,
-0.6496474, 0.4046633, -0.1877622, 0.5058824, 1, 0, 1,
-0.6441571, 1.064977, -0.911489, 0.5019608, 1, 0, 1,
-0.6394144, 0.6108292, -0.4594948, 0.4941176, 1, 0, 1,
-0.6359794, -0.4035678, -1.842533, 0.4862745, 1, 0, 1,
-0.6333548, 1.269319, -0.02020017, 0.4823529, 1, 0, 1,
-0.6266421, 0.07760432, -1.796705, 0.4745098, 1, 0, 1,
-0.6236954, -0.3473083, -1.972064, 0.4705882, 1, 0, 1,
-0.6140606, 1.463954, 1.053705, 0.4627451, 1, 0, 1,
-0.611545, -0.3881674, -3.52574, 0.4588235, 1, 0, 1,
-0.6089565, -0.4492251, -1.174779, 0.4509804, 1, 0, 1,
-0.6074637, 0.2379805, -1.994786, 0.4470588, 1, 0, 1,
-0.6062432, 0.2096831, 0.5749351, 0.4392157, 1, 0, 1,
-0.6055766, -0.5066597, -2.843966, 0.4352941, 1, 0, 1,
-0.6055011, -0.3165563, -1.985083, 0.427451, 1, 0, 1,
-0.6044179, -0.594674, -3.677517, 0.4235294, 1, 0, 1,
-0.5975317, 0.4042602, -0.6250888, 0.4156863, 1, 0, 1,
-0.5972012, 0.6603885, -1.968188, 0.4117647, 1, 0, 1,
-0.5960122, 0.03636997, -0.898389, 0.4039216, 1, 0, 1,
-0.5831351, 0.09666517, -0.7891009, 0.3960784, 1, 0, 1,
-0.5805501, 0.3268625, 0.8152621, 0.3921569, 1, 0, 1,
-0.5798754, -0.5028164, -0.8565032, 0.3843137, 1, 0, 1,
-0.5766458, 0.1476998, -1.285972, 0.3803922, 1, 0, 1,
-0.5749382, 0.5593259, -0.9796473, 0.372549, 1, 0, 1,
-0.5729536, -1.327626, -2.668216, 0.3686275, 1, 0, 1,
-0.5720113, -0.2790645, -1.242129, 0.3607843, 1, 0, 1,
-0.5705075, 0.8928501, 0.4918669, 0.3568628, 1, 0, 1,
-0.5691258, -1.066641, -3.926487, 0.3490196, 1, 0, 1,
-0.5648604, 0.3579778, -0.8566018, 0.345098, 1, 0, 1,
-0.5629144, 0.2924028, -1.07192, 0.3372549, 1, 0, 1,
-0.5625814, 0.3454122, -2.021262, 0.3333333, 1, 0, 1,
-0.5574557, 0.2985441, -0.4241329, 0.3254902, 1, 0, 1,
-0.5559006, -0.7937194, -2.526558, 0.3215686, 1, 0, 1,
-0.5497591, -0.1395094, -2.532845, 0.3137255, 1, 0, 1,
-0.5418179, -0.1466163, -1.450506, 0.3098039, 1, 0, 1,
-0.5374649, -0.5933498, -3.632621, 0.3019608, 1, 0, 1,
-0.5336027, 0.7681819, 0.801593, 0.2941177, 1, 0, 1,
-0.532894, 0.1007794, -0.6182356, 0.2901961, 1, 0, 1,
-0.5252942, -0.4902268, -0.6577605, 0.282353, 1, 0, 1,
-0.5228336, 0.4291117, 0.2445611, 0.2784314, 1, 0, 1,
-0.5225647, -0.02993686, -0.1071689, 0.2705882, 1, 0, 1,
-0.517738, 2.351921, 0.2240421, 0.2666667, 1, 0, 1,
-0.5146279, -1.429912, -3.811865, 0.2588235, 1, 0, 1,
-0.5138036, 0.4562203, -0.4292705, 0.254902, 1, 0, 1,
-0.5137083, -0.4358953, -2.741524, 0.2470588, 1, 0, 1,
-0.5117004, -0.7931107, -3.3045, 0.2431373, 1, 0, 1,
-0.5085921, -1.648388, -1.767412, 0.2352941, 1, 0, 1,
-0.5034553, -0.3664698, -0.5061955, 0.2313726, 1, 0, 1,
-0.5026336, -0.5085416, -3.202419, 0.2235294, 1, 0, 1,
-0.5024818, -1.371484, -0.8415577, 0.2196078, 1, 0, 1,
-0.4981928, -1.14822, -2.764238, 0.2117647, 1, 0, 1,
-0.4969853, -0.967074, -3.076014, 0.2078431, 1, 0, 1,
-0.4953282, 1.313412, -0.1680746, 0.2, 1, 0, 1,
-0.4917295, 1.951964, -0.7923745, 0.1921569, 1, 0, 1,
-0.4903165, -0.008695794, -3.12243, 0.1882353, 1, 0, 1,
-0.4853113, 0.1145874, 0.1890227, 0.1803922, 1, 0, 1,
-0.4827336, -0.4841766, -2.248766, 0.1764706, 1, 0, 1,
-0.481995, 1.09563, -0.2095912, 0.1686275, 1, 0, 1,
-0.4819104, 1.200369, 0.1324297, 0.1647059, 1, 0, 1,
-0.4810586, 0.1945371, -2.553232, 0.1568628, 1, 0, 1,
-0.4795889, 0.5733575, -2.138335, 0.1529412, 1, 0, 1,
-0.478838, 0.5689487, -1.622807, 0.145098, 1, 0, 1,
-0.4767895, 0.3393791, -2.142036, 0.1411765, 1, 0, 1,
-0.4751183, 1.495991, -1.985415, 0.1333333, 1, 0, 1,
-0.4727135, 0.5303237, -2.037753, 0.1294118, 1, 0, 1,
-0.4722061, -0.2485134, -3.075719, 0.1215686, 1, 0, 1,
-0.4699511, -0.9389001, -2.41589, 0.1176471, 1, 0, 1,
-0.4674605, 0.4735791, -0.495064, 0.1098039, 1, 0, 1,
-0.4642226, -0.08413307, -2.449599, 0.1058824, 1, 0, 1,
-0.4624921, 0.8114958, -0.5825637, 0.09803922, 1, 0, 1,
-0.458077, -2.193583, -2.098213, 0.09019608, 1, 0, 1,
-0.4578928, -0.1149336, -2.804154, 0.08627451, 1, 0, 1,
-0.4546221, -0.1819046, -3.492157, 0.07843138, 1, 0, 1,
-0.4517278, -1.825944, -4.747414, 0.07450981, 1, 0, 1,
-0.4468071, 0.347288, -0.6806135, 0.06666667, 1, 0, 1,
-0.4446824, -0.3396138, -1.752114, 0.0627451, 1, 0, 1,
-0.4364222, -0.002976418, -1.645493, 0.05490196, 1, 0, 1,
-0.4358104, -0.217073, -3.609906, 0.05098039, 1, 0, 1,
-0.4335734, -0.1464847, -1.356103, 0.04313726, 1, 0, 1,
-0.4277875, -0.3901689, -2.308442, 0.03921569, 1, 0, 1,
-0.4138561, -0.3420771, -2.707077, 0.03137255, 1, 0, 1,
-0.4131533, 0.9875357, 0.6760805, 0.02745098, 1, 0, 1,
-0.4129401, -0.2495475, -3.480172, 0.01960784, 1, 0, 1,
-0.4120642, 1.263046, -2.319882, 0.01568628, 1, 0, 1,
-0.4100777, 1.471163, -1.660828, 0.007843138, 1, 0, 1,
-0.4069966, 0.4384013, -1.173084, 0.003921569, 1, 0, 1,
-0.4068107, 1.703524, -2.094208, 0, 1, 0.003921569, 1,
-0.4051725, -1.514941, -4.658665, 0, 1, 0.01176471, 1,
-0.3988737, -1.550867, -2.369156, 0, 1, 0.01568628, 1,
-0.3969001, 1.742736, -0.09705649, 0, 1, 0.02352941, 1,
-0.3967519, 0.1495291, -1.320769, 0, 1, 0.02745098, 1,
-0.3955848, 1.323608, 0.297468, 0, 1, 0.03529412, 1,
-0.3927248, -0.3800004, -0.6809968, 0, 1, 0.03921569, 1,
-0.3867455, 0.4919897, -1.0006, 0, 1, 0.04705882, 1,
-0.3839938, -1.324475, -1.375249, 0, 1, 0.05098039, 1,
-0.3829669, 0.1949956, -1.489388, 0, 1, 0.05882353, 1,
-0.3794887, 2.104485, 1.814807, 0, 1, 0.0627451, 1,
-0.3786269, -2.452056, -2.355577, 0, 1, 0.07058824, 1,
-0.3776206, -0.07177848, -4.202147, 0, 1, 0.07450981, 1,
-0.3733714, 0.8011968, -0.7932878, 0, 1, 0.08235294, 1,
-0.372663, 0.5785308, -0.09255334, 0, 1, 0.08627451, 1,
-0.3726055, -0.841072, -2.989338, 0, 1, 0.09411765, 1,
-0.3725367, 0.730502, -0.869057, 0, 1, 0.1019608, 1,
-0.3721338, 0.2769301, -0.5616208, 0, 1, 0.1058824, 1,
-0.3715252, 0.438566, -0.7906979, 0, 1, 0.1137255, 1,
-0.3704016, -0.2647481, -2.054718, 0, 1, 0.1176471, 1,
-0.3700994, -0.9568805, -3.216357, 0, 1, 0.1254902, 1,
-0.3694868, -1.058134, -1.722119, 0, 1, 0.1294118, 1,
-0.3665891, -0.5189318, -1.817939, 0, 1, 0.1372549, 1,
-0.3648117, 0.4242367, 0.6804107, 0, 1, 0.1411765, 1,
-0.3639574, 1.098408, 1.579313, 0, 1, 0.1490196, 1,
-0.3598177, -0.8404378, -3.264569, 0, 1, 0.1529412, 1,
-0.3531649, 1.08963, 0.4100953, 0, 1, 0.1607843, 1,
-0.3520678, -0.6387367, -2.97311, 0, 1, 0.1647059, 1,
-0.3512361, -1.800826, -0.4784265, 0, 1, 0.172549, 1,
-0.3508111, -0.08106341, -1.544285, 0, 1, 0.1764706, 1,
-0.3495404, 0.8608421, 0.4480671, 0, 1, 0.1843137, 1,
-0.3488838, 1.502832, 0.1172859, 0, 1, 0.1882353, 1,
-0.3469168, -1.922221, -4.171955, 0, 1, 0.1960784, 1,
-0.34319, 1.02797, 0.3279335, 0, 1, 0.2039216, 1,
-0.3398407, 0.3032052, -1.112772, 0, 1, 0.2078431, 1,
-0.3381717, 0.120352, -2.10167, 0, 1, 0.2156863, 1,
-0.337861, -0.758853, -2.612948, 0, 1, 0.2196078, 1,
-0.33762, -1.330588, -1.818713, 0, 1, 0.227451, 1,
-0.3301694, -1.468501, -2.716389, 0, 1, 0.2313726, 1,
-0.3281397, -1.123323, -2.860177, 0, 1, 0.2392157, 1,
-0.3248237, 1.515982, -2.696731, 0, 1, 0.2431373, 1,
-0.3241104, 1.264885, -0.537573, 0, 1, 0.2509804, 1,
-0.3234206, -0.1319166, -1.433969, 0, 1, 0.254902, 1,
-0.323355, -0.7210973, -4.057145, 0, 1, 0.2627451, 1,
-0.3222578, -0.1307756, -3.235078, 0, 1, 0.2666667, 1,
-0.3150179, 1.101473, -0.372972, 0, 1, 0.2745098, 1,
-0.3148167, 1.105993, -0.4028195, 0, 1, 0.2784314, 1,
-0.3057564, 1.553211, 0.2474981, 0, 1, 0.2862745, 1,
-0.3047316, -1.121137, -3.232198, 0, 1, 0.2901961, 1,
-0.3035104, 1.755213, -0.1766652, 0, 1, 0.2980392, 1,
-0.3034509, 0.7519583, -0.2027511, 0, 1, 0.3058824, 1,
-0.3020238, -1.606613, -2.840952, 0, 1, 0.3098039, 1,
-0.3015099, -0.7781172, -3.265417, 0, 1, 0.3176471, 1,
-0.2996849, 1.761037, 0.6044674, 0, 1, 0.3215686, 1,
-0.295517, -0.6020025, -3.025221, 0, 1, 0.3294118, 1,
-0.2954914, 1.402867, 0.9736188, 0, 1, 0.3333333, 1,
-0.2941754, -0.6106479, -2.981126, 0, 1, 0.3411765, 1,
-0.2939913, -0.7792346, -3.526549, 0, 1, 0.345098, 1,
-0.2936413, 0.06424281, -2.270946, 0, 1, 0.3529412, 1,
-0.2924019, -0.7224029, -2.733149, 0, 1, 0.3568628, 1,
-0.2908661, -0.1195895, -2.68169, 0, 1, 0.3647059, 1,
-0.2892004, 0.2782158, 1.690524, 0, 1, 0.3686275, 1,
-0.2855373, 1.114712, -0.9562603, 0, 1, 0.3764706, 1,
-0.2839274, -0.4785643, -2.477112, 0, 1, 0.3803922, 1,
-0.2796002, -0.6478693, -4.029777, 0, 1, 0.3882353, 1,
-0.2782444, 0.7386063, -0.3994792, 0, 1, 0.3921569, 1,
-0.276154, -0.04599771, -0.6468323, 0, 1, 0.4, 1,
-0.2759666, -1.332861, -4.083094, 0, 1, 0.4078431, 1,
-0.2715172, 1.138216, 0.3467874, 0, 1, 0.4117647, 1,
-0.2695174, 1.3821, -1.423802, 0, 1, 0.4196078, 1,
-0.2639912, -0.6656309, -2.344868, 0, 1, 0.4235294, 1,
-0.2618889, -0.9624175, -0.9066383, 0, 1, 0.4313726, 1,
-0.2602096, -0.3444884, -3.164138, 0, 1, 0.4352941, 1,
-0.2535751, 0.9879526, -1.198089, 0, 1, 0.4431373, 1,
-0.251777, 0.4310182, -1.084546, 0, 1, 0.4470588, 1,
-0.2510555, 0.9564743, 0.02546652, 0, 1, 0.454902, 1,
-0.2498798, 0.6087866, 0.234209, 0, 1, 0.4588235, 1,
-0.2464778, -0.3809723, -2.466212, 0, 1, 0.4666667, 1,
-0.2432487, 1.062565, -3.139304, 0, 1, 0.4705882, 1,
-0.2394119, -0.04038521, -2.151263, 0, 1, 0.4784314, 1,
-0.2388314, 0.5709308, -0.5203792, 0, 1, 0.4823529, 1,
-0.2354293, 3.67552, 0.3313449, 0, 1, 0.4901961, 1,
-0.2333568, -0.08420926, -1.762392, 0, 1, 0.4941176, 1,
-0.2307812, 0.3803208, 0.6350028, 0, 1, 0.5019608, 1,
-0.2281869, 0.6070778, -0.3544027, 0, 1, 0.509804, 1,
-0.2243851, -1.210942, -4.062108, 0, 1, 0.5137255, 1,
-0.2242811, -2.23349, -1.294389, 0, 1, 0.5215687, 1,
-0.2240278, -1.75869, -3.645709, 0, 1, 0.5254902, 1,
-0.2206205, 0.2290029, -2.123268, 0, 1, 0.5333334, 1,
-0.2196903, 1.424879, 0.1799192, 0, 1, 0.5372549, 1,
-0.2188194, 0.2454077, -2.809062, 0, 1, 0.5450981, 1,
-0.2118949, 0.639964, -0.5104103, 0, 1, 0.5490196, 1,
-0.206466, 1.684775, -1.014038, 0, 1, 0.5568628, 1,
-0.2039956, 0.1719246, -1.138903, 0, 1, 0.5607843, 1,
-0.199671, -0.7832528, -1.910719, 0, 1, 0.5686275, 1,
-0.1994499, 0.06701069, -0.6641509, 0, 1, 0.572549, 1,
-0.1949013, 1.053685, 0.03433312, 0, 1, 0.5803922, 1,
-0.1948078, -0.1009277, -1.715085, 0, 1, 0.5843138, 1,
-0.1937121, 0.7494881, -1.632934, 0, 1, 0.5921569, 1,
-0.1925256, -1.326932, -2.825998, 0, 1, 0.5960785, 1,
-0.192385, 0.1022793, -2.567533, 0, 1, 0.6039216, 1,
-0.1896809, 1.01579, 2.303053, 0, 1, 0.6117647, 1,
-0.1844302, 0.9395795, -1.618984, 0, 1, 0.6156863, 1,
-0.1749288, -0.01629181, -1.315949, 0, 1, 0.6235294, 1,
-0.1739222, 0.4632682, 0.04796427, 0, 1, 0.627451, 1,
-0.1671742, -0.4258098, -3.358048, 0, 1, 0.6352941, 1,
-0.1662927, 0.6160562, -2.186257, 0, 1, 0.6392157, 1,
-0.1643715, 1.380831, 0.2320455, 0, 1, 0.6470588, 1,
-0.1638793, 2.549079, -0.3699201, 0, 1, 0.6509804, 1,
-0.1637127, -0.08167756, -2.349044, 0, 1, 0.6588235, 1,
-0.1596318, 0.452114, 0.6304977, 0, 1, 0.6627451, 1,
-0.1572742, 1.303786, -0.8834686, 0, 1, 0.6705883, 1,
-0.1509825, -0.6725507, -4.167349, 0, 1, 0.6745098, 1,
-0.1506512, -1.511796, -2.960342, 0, 1, 0.682353, 1,
-0.1506255, -0.6280668, -2.837902, 0, 1, 0.6862745, 1,
-0.1490079, -0.7492753, -2.460045, 0, 1, 0.6941177, 1,
-0.1480205, 0.5746691, 1.473028, 0, 1, 0.7019608, 1,
-0.1476271, -1.605706, -4.516287, 0, 1, 0.7058824, 1,
-0.1469912, 0.4145944, 0.5186729, 0, 1, 0.7137255, 1,
-0.1457524, 0.4449465, 0.4901435, 0, 1, 0.7176471, 1,
-0.1439701, -0.9860454, -1.689672, 0, 1, 0.7254902, 1,
-0.1368446, -1.470724, -1.184922, 0, 1, 0.7294118, 1,
-0.1363998, 0.3085974, -1.520994, 0, 1, 0.7372549, 1,
-0.1342591, 0.7908769, -0.9654014, 0, 1, 0.7411765, 1,
-0.1321948, -0.6049008, -2.484875, 0, 1, 0.7490196, 1,
-0.1199153, -0.09909026, -2.876503, 0, 1, 0.7529412, 1,
-0.1189158, 0.5227509, 0.2919457, 0, 1, 0.7607843, 1,
-0.1128202, 1.390652, -1.597568, 0, 1, 0.7647059, 1,
-0.1126224, 1.122867, 1.931846, 0, 1, 0.772549, 1,
-0.1063599, -1.439284, -2.785482, 0, 1, 0.7764706, 1,
-0.1045949, -0.7051292, -3.953412, 0, 1, 0.7843137, 1,
-0.1034027, 0.8646636, 1.083648, 0, 1, 0.7882353, 1,
-0.1008895, 0.534667, -0.4837379, 0, 1, 0.7960784, 1,
-0.09585641, 1.012219, -0.682678, 0, 1, 0.8039216, 1,
-0.0957829, -0.5701931, -3.874206, 0, 1, 0.8078431, 1,
-0.09494358, -0.7018609, -3.691557, 0, 1, 0.8156863, 1,
-0.09104674, 0.667699, -0.2877374, 0, 1, 0.8196079, 1,
-0.09015899, -2.213772, -1.785769, 0, 1, 0.827451, 1,
-0.08992934, 0.3938058, -0.0521347, 0, 1, 0.8313726, 1,
-0.08412933, 1.067836, -1.112885, 0, 1, 0.8392157, 1,
-0.08053073, 0.4639838, -2.079519, 0, 1, 0.8431373, 1,
-0.0799235, 0.129703, 1.187616, 0, 1, 0.8509804, 1,
-0.07931295, 1.102392, 1.219122, 0, 1, 0.854902, 1,
-0.07824236, 0.2618269, -2.196609, 0, 1, 0.8627451, 1,
-0.07631907, -0.6748364, -4.241154, 0, 1, 0.8666667, 1,
-0.07482491, -0.2594788, -2.470008, 0, 1, 0.8745098, 1,
-0.07320054, 0.0851057, 0.9216276, 0, 1, 0.8784314, 1,
-0.0694086, 0.660108, -2.300569, 0, 1, 0.8862745, 1,
-0.0673637, -0.6064662, -2.567591, 0, 1, 0.8901961, 1,
-0.06728833, -0.6796333, -3.327736, 0, 1, 0.8980392, 1,
-0.06079397, 0.4001216, -0.5596307, 0, 1, 0.9058824, 1,
-0.05774956, -0.729554, -3.374729, 0, 1, 0.9098039, 1,
-0.05731313, 0.5393242, 0.9348875, 0, 1, 0.9176471, 1,
-0.05451282, 0.04894704, -0.3408806, 0, 1, 0.9215686, 1,
-0.05086299, 1.265101, -1.143791, 0, 1, 0.9294118, 1,
-0.05053509, -0.8469964, -3.697313, 0, 1, 0.9333333, 1,
-0.04864803, 0.662577, 0.372407, 0, 1, 0.9411765, 1,
-0.04746168, 0.5504639, 1.375853, 0, 1, 0.945098, 1,
-0.04072677, 1.348177, 1.222394, 0, 1, 0.9529412, 1,
-0.02676976, 0.5903206, 0.50412, 0, 1, 0.9568627, 1,
-0.02562278, 0.7510909, -0.3358292, 0, 1, 0.9647059, 1,
-0.0212967, 0.7709897, 0.4479024, 0, 1, 0.9686275, 1,
-0.0209852, -0.12467, -1.511931, 0, 1, 0.9764706, 1,
-0.01809356, -0.1395765, -2.748945, 0, 1, 0.9803922, 1,
-0.01425381, 2.111437, 0.03872659, 0, 1, 0.9882353, 1,
-0.007275897, 0.9431303, 0.5333758, 0, 1, 0.9921569, 1,
-0.004839023, 0.9982816, 0.7101017, 0, 1, 1, 1,
-0.004021647, -0.6231052, -4.328336, 0, 0.9921569, 1, 1,
-0.004015109, 1.045939, 1.780838, 0, 0.9882353, 1, 1,
-0.0007839112, 0.3270237, 0.004899112, 0, 0.9803922, 1, 1,
0.0016688, -1.916398, 1.691471, 0, 0.9764706, 1, 1,
0.003018667, 0.186506, 1.072657, 0, 0.9686275, 1, 1,
0.004158844, 0.9512379, -0.3227745, 0, 0.9647059, 1, 1,
0.01338181, 0.6336154, -0.3849316, 0, 0.9568627, 1, 1,
0.01521862, 0.6061938, 0.8701296, 0, 0.9529412, 1, 1,
0.01585324, -1.409252, 4.247542, 0, 0.945098, 1, 1,
0.02013821, -1.210291, 2.301541, 0, 0.9411765, 1, 1,
0.02540435, 0.3376791, -0.2351865, 0, 0.9333333, 1, 1,
0.02545282, 0.9624509, -1.689317, 0, 0.9294118, 1, 1,
0.02590324, 0.9706219, 0.05760533, 0, 0.9215686, 1, 1,
0.02676382, -0.286636, 3.013891, 0, 0.9176471, 1, 1,
0.02751318, -0.817353, 3.813393, 0, 0.9098039, 1, 1,
0.03092922, 0.292643, 0.8825949, 0, 0.9058824, 1, 1,
0.03372965, -0.9477462, 3.343751, 0, 0.8980392, 1, 1,
0.03655631, -1.399789, 3.73204, 0, 0.8901961, 1, 1,
0.04021589, -0.9746303, 1.922602, 0, 0.8862745, 1, 1,
0.04237074, 0.02843529, 3.002653, 0, 0.8784314, 1, 1,
0.04470981, -1.597632, 3.141711, 0, 0.8745098, 1, 1,
0.05196994, -1.183858, 4.279845, 0, 0.8666667, 1, 1,
0.05412808, -0.5983378, 2.338741, 0, 0.8627451, 1, 1,
0.05634723, -0.4572971, 1.243888, 0, 0.854902, 1, 1,
0.05923155, -0.04094466, 4.052938, 0, 0.8509804, 1, 1,
0.06120667, 1.765211, 0.8053637, 0, 0.8431373, 1, 1,
0.06123718, -0.4916896, 2.221166, 0, 0.8392157, 1, 1,
0.06264219, 0.2106929, -0.7186173, 0, 0.8313726, 1, 1,
0.06491897, -0.2488833, 4.790294, 0, 0.827451, 1, 1,
0.06569092, 0.7617502, -1.282509, 0, 0.8196079, 1, 1,
0.06659187, -0.07123378, 1.285139, 0, 0.8156863, 1, 1,
0.06849207, 1.178252, -0.005418031, 0, 0.8078431, 1, 1,
0.06890026, -1.195219, 3.275139, 0, 0.8039216, 1, 1,
0.07004663, 0.4179978, -1.429727, 0, 0.7960784, 1, 1,
0.07223868, 0.2048433, -0.5179525, 0, 0.7882353, 1, 1,
0.07464969, -1.524325, 4.082864, 0, 0.7843137, 1, 1,
0.07906004, -0.544067, 2.326931, 0, 0.7764706, 1, 1,
0.08066746, -1.686368, 2.49677, 0, 0.772549, 1, 1,
0.08231766, -1.223142, 5.333673, 0, 0.7647059, 1, 1,
0.08257645, 1.795778, -0.4037595, 0, 0.7607843, 1, 1,
0.08549406, -1.154841, 4.872502, 0, 0.7529412, 1, 1,
0.08802603, -0.1354865, 3.100854, 0, 0.7490196, 1, 1,
0.0884294, -0.5370213, 4.06833, 0, 0.7411765, 1, 1,
0.08892684, 1.265895, 2.292337, 0, 0.7372549, 1, 1,
0.09069775, 0.1605747, -0.09954737, 0, 0.7294118, 1, 1,
0.09821, 0.7661105, 0.1437734, 0, 0.7254902, 1, 1,
0.1022904, 1.452609, -0.3951649, 0, 0.7176471, 1, 1,
0.1033727, -0.1235043, 2.396567, 0, 0.7137255, 1, 1,
0.1071164, 1.667972, 1.984103, 0, 0.7058824, 1, 1,
0.1073997, -0.6348889, 1.034337, 0, 0.6980392, 1, 1,
0.111347, -0.7205096, 1.958673, 0, 0.6941177, 1, 1,
0.1115843, -1.624473, 3.530655, 0, 0.6862745, 1, 1,
0.1178799, -0.1195204, 1.472945, 0, 0.682353, 1, 1,
0.1194712, -1.064876, 4.392074, 0, 0.6745098, 1, 1,
0.1203285, 0.344339, 0.583091, 0, 0.6705883, 1, 1,
0.1227685, -0.07938404, 1.733466, 0, 0.6627451, 1, 1,
0.1349736, 0.2602698, 1.043323, 0, 0.6588235, 1, 1,
0.1402236, -1.249666, 4.402005, 0, 0.6509804, 1, 1,
0.1403721, 0.1129267, 0.9911818, 0, 0.6470588, 1, 1,
0.1413448, 0.2163533, -0.2476438, 0, 0.6392157, 1, 1,
0.1416976, -1.270521, 5.677081, 0, 0.6352941, 1, 1,
0.1434463, -0.1184916, 2.219891, 0, 0.627451, 1, 1,
0.1443876, 0.7255726, 0.4385787, 0, 0.6235294, 1, 1,
0.1445197, -0.3338865, 3.751048, 0, 0.6156863, 1, 1,
0.1445759, 0.3066382, -0.7405316, 0, 0.6117647, 1, 1,
0.1458599, -1.112831, 3.979877, 0, 0.6039216, 1, 1,
0.1582255, 0.8856167, 0.9121395, 0, 0.5960785, 1, 1,
0.1583993, -0.5037276, 3.007835, 0, 0.5921569, 1, 1,
0.160469, 0.2405732, 3.570612, 0, 0.5843138, 1, 1,
0.1633945, 0.07245108, 0.8412831, 0, 0.5803922, 1, 1,
0.1813457, -0.2645537, 1.902517, 0, 0.572549, 1, 1,
0.1818957, -0.1116887, 2.340604, 0, 0.5686275, 1, 1,
0.1824195, 0.007473402, 0.2286565, 0, 0.5607843, 1, 1,
0.1834752, 0.5202077, 0.09240945, 0, 0.5568628, 1, 1,
0.1846888, 2.450923, 1.180223, 0, 0.5490196, 1, 1,
0.1853657, 0.7468017, -1.368691, 0, 0.5450981, 1, 1,
0.1874387, -0.8212306, 2.946638, 0, 0.5372549, 1, 1,
0.1931179, -0.07255847, 2.688227, 0, 0.5333334, 1, 1,
0.2000152, -1.431905, 3.801615, 0, 0.5254902, 1, 1,
0.2046933, 0.241584, -0.09510927, 0, 0.5215687, 1, 1,
0.2049024, 0.7468545, -0.2997848, 0, 0.5137255, 1, 1,
0.2098094, -0.3815735, 4.082537, 0, 0.509804, 1, 1,
0.2104886, -0.6951835, 2.108527, 0, 0.5019608, 1, 1,
0.2166106, 0.8174874, -0.9977549, 0, 0.4941176, 1, 1,
0.2181715, -0.5546871, 4.483476, 0, 0.4901961, 1, 1,
0.2188534, -0.3693759, 2.989442, 0, 0.4823529, 1, 1,
0.2222406, 0.3115561, -0.8580648, 0, 0.4784314, 1, 1,
0.2270128, 1.186885, -2.154083, 0, 0.4705882, 1, 1,
0.2299767, 0.6283653, -0.988317, 0, 0.4666667, 1, 1,
0.2315266, -0.221027, 1.920053, 0, 0.4588235, 1, 1,
0.2424869, -0.6345282, 3.14383, 0, 0.454902, 1, 1,
0.2463979, 1.384944, -1.40448, 0, 0.4470588, 1, 1,
0.2493736, -1.808422, 2.268065, 0, 0.4431373, 1, 1,
0.2523737, -1.647739, 4.758636, 0, 0.4352941, 1, 1,
0.2529964, 0.8959775, 1.158021, 0, 0.4313726, 1, 1,
0.2556155, 1.283939, 0.1273697, 0, 0.4235294, 1, 1,
0.2565974, -0.629706, 3.3783, 0, 0.4196078, 1, 1,
0.2618628, -1.961516, 1.965139, 0, 0.4117647, 1, 1,
0.2637511, 0.6186802, 1.602707, 0, 0.4078431, 1, 1,
0.2645465, -0.6520132, 3.369891, 0, 0.4, 1, 1,
0.2680849, 1.229196, 0.4351511, 0, 0.3921569, 1, 1,
0.2703564, 0.6938045, 1.614543, 0, 0.3882353, 1, 1,
0.2757545, -0.9643599, 3.826729, 0, 0.3803922, 1, 1,
0.278289, 0.8887391, 1.41022, 0, 0.3764706, 1, 1,
0.2817258, -0.338069, 3.537706, 0, 0.3686275, 1, 1,
0.2843358, 1.651271, -1.535854, 0, 0.3647059, 1, 1,
0.286447, -0.03681874, 2.951949, 0, 0.3568628, 1, 1,
0.2871224, 0.6312245, 0.1833338, 0, 0.3529412, 1, 1,
0.2939866, 0.4037977, 0.7892777, 0, 0.345098, 1, 1,
0.2954648, -0.09058166, 1.077262, 0, 0.3411765, 1, 1,
0.2963523, -0.7129301, 3.576398, 0, 0.3333333, 1, 1,
0.2974412, -0.9973176, 2.854131, 0, 0.3294118, 1, 1,
0.2997481, -0.7162516, 2.367912, 0, 0.3215686, 1, 1,
0.3053083, -0.2421619, 1.902496, 0, 0.3176471, 1, 1,
0.3060153, 0.4139483, 0.1999737, 0, 0.3098039, 1, 1,
0.3077739, -0.5807362, 2.957784, 0, 0.3058824, 1, 1,
0.3086441, 0.9577426, -0.04978132, 0, 0.2980392, 1, 1,
0.3093781, 0.2554388, 0.04400372, 0, 0.2901961, 1, 1,
0.3106476, -0.2898411, 4.059869, 0, 0.2862745, 1, 1,
0.3112833, 0.8280975, -0.1870637, 0, 0.2784314, 1, 1,
0.3115105, 1.38046, 0.4016699, 0, 0.2745098, 1, 1,
0.3165407, -0.327762, 2.504501, 0, 0.2666667, 1, 1,
0.3226658, -0.2460631, 1.220985, 0, 0.2627451, 1, 1,
0.3228097, 0.01263363, 0.6283513, 0, 0.254902, 1, 1,
0.3242653, -0.8156329, 2.421879, 0, 0.2509804, 1, 1,
0.3255624, 0.08660348, 0.8359324, 0, 0.2431373, 1, 1,
0.3332962, 0.5097024, -0.3426312, 0, 0.2392157, 1, 1,
0.3349185, 1.633564, 0.3090586, 0, 0.2313726, 1, 1,
0.3390436, 0.428518, 1.561348, 0, 0.227451, 1, 1,
0.3404605, 0.01254356, 0.7870329, 0, 0.2196078, 1, 1,
0.3420711, -2.224856, 2.982865, 0, 0.2156863, 1, 1,
0.344429, -0.8901837, 2.057787, 0, 0.2078431, 1, 1,
0.3478367, 0.09238098, 1.791587, 0, 0.2039216, 1, 1,
0.3500038, -0.06480523, 3.143831, 0, 0.1960784, 1, 1,
0.3515538, -0.2194366, 1.840746, 0, 0.1882353, 1, 1,
0.3523126, -1.6269, 4.418215, 0, 0.1843137, 1, 1,
0.3531395, 0.08086716, 2.589844, 0, 0.1764706, 1, 1,
0.3558778, 0.862854, -0.8668031, 0, 0.172549, 1, 1,
0.3565515, 0.5923928, -0.07045484, 0, 0.1647059, 1, 1,
0.3636409, -2.354147, 3.532815, 0, 0.1607843, 1, 1,
0.3687457, 0.5247408, 1.850291, 0, 0.1529412, 1, 1,
0.3688667, 0.1006646, 2.022171, 0, 0.1490196, 1, 1,
0.3697526, -1.837994, 2.632152, 0, 0.1411765, 1, 1,
0.3740332, -0.7831606, 1.8663, 0, 0.1372549, 1, 1,
0.3767124, 0.03736552, 0.5212846, 0, 0.1294118, 1, 1,
0.37682, 1.109741, 0.7057236, 0, 0.1254902, 1, 1,
0.3789466, -0.1045287, 3.044541, 0, 0.1176471, 1, 1,
0.3859697, 1.011184, 1.22555, 0, 0.1137255, 1, 1,
0.3867977, -0.6857968, 1.245803, 0, 0.1058824, 1, 1,
0.3924291, 0.9069408, -0.8985903, 0, 0.09803922, 1, 1,
0.3986636, -1.665671, 2.955434, 0, 0.09411765, 1, 1,
0.4101954, -0.7946704, 3.559738, 0, 0.08627451, 1, 1,
0.4156301, -0.8962798, 3.058665, 0, 0.08235294, 1, 1,
0.4171261, 1.606187, 0.8286698, 0, 0.07450981, 1, 1,
0.4208348, 2.45886, -0.395166, 0, 0.07058824, 1, 1,
0.4228351, -0.5591675, 2.204708, 0, 0.0627451, 1, 1,
0.4233253, 1.564981, 1.877592, 0, 0.05882353, 1, 1,
0.4251449, 1.281309, -0.4499059, 0, 0.05098039, 1, 1,
0.4255489, -1.257584, 4.994627, 0, 0.04705882, 1, 1,
0.4324071, 0.2221922, -1.390856, 0, 0.03921569, 1, 1,
0.4387675, -0.156239, 1.652104, 0, 0.03529412, 1, 1,
0.4392741, -0.9084241, 3.079035, 0, 0.02745098, 1, 1,
0.4405215, 1.229131, -0.1790671, 0, 0.02352941, 1, 1,
0.4417984, -0.8214926, 2.007977, 0, 0.01568628, 1, 1,
0.448133, -1.395818, 3.018902, 0, 0.01176471, 1, 1,
0.4493307, -2.042105, 3.656552, 0, 0.003921569, 1, 1,
0.4520462, -0.541198, 2.915116, 0.003921569, 0, 1, 1,
0.4540237, -0.9915242, 2.786865, 0.007843138, 0, 1, 1,
0.45415, -0.2470025, -0.4258088, 0.01568628, 0, 1, 1,
0.4571725, 0.5700328, 1.435031, 0.01960784, 0, 1, 1,
0.4575149, -1.353153, 4.234512, 0.02745098, 0, 1, 1,
0.4586448, -0.6320612, 2.880208, 0.03137255, 0, 1, 1,
0.4652203, -0.8290061, 2.000448, 0.03921569, 0, 1, 1,
0.4676873, 0.4299925, 0.9339095, 0.04313726, 0, 1, 1,
0.4726916, -2.069098, 3.025377, 0.05098039, 0, 1, 1,
0.4735727, 1.222812, -0.7882041, 0.05490196, 0, 1, 1,
0.474961, 1.368195, -1.11735, 0.0627451, 0, 1, 1,
0.4788838, 0.8542902, 2.661719, 0.06666667, 0, 1, 1,
0.4822859, -0.3729148, 3.203437, 0.07450981, 0, 1, 1,
0.4840681, -0.9975455, 2.538096, 0.07843138, 0, 1, 1,
0.4856057, -1.747269, 2.893142, 0.08627451, 0, 1, 1,
0.48834, 1.03892, 0.3362548, 0.09019608, 0, 1, 1,
0.4898657, -0.3603548, 2.03588, 0.09803922, 0, 1, 1,
0.4915705, -1.897449, 2.283366, 0.1058824, 0, 1, 1,
0.5045471, -0.4051171, 2.890505, 0.1098039, 0, 1, 1,
0.5055922, -1.061702, 4.093734, 0.1176471, 0, 1, 1,
0.5066126, 0.09370855, 2.031205, 0.1215686, 0, 1, 1,
0.5083044, 1.36674, -1.447021, 0.1294118, 0, 1, 1,
0.5097715, -0.1382417, -0.286939, 0.1333333, 0, 1, 1,
0.5109319, -1.260739, 3.473073, 0.1411765, 0, 1, 1,
0.5156866, -0.1731587, -0.4028147, 0.145098, 0, 1, 1,
0.5159969, -3.291277, 2.03591, 0.1529412, 0, 1, 1,
0.5175292, 1.449084, 0.4304447, 0.1568628, 0, 1, 1,
0.525115, -1.665944, 2.058476, 0.1647059, 0, 1, 1,
0.528534, 0.422392, 3.009806, 0.1686275, 0, 1, 1,
0.5294451, 0.5407742, -0.5521806, 0.1764706, 0, 1, 1,
0.5306018, -0.5546148, 3.408023, 0.1803922, 0, 1, 1,
0.5329089, -0.3755609, 2.138499, 0.1882353, 0, 1, 1,
0.5347962, 0.1925212, 0.2375359, 0.1921569, 0, 1, 1,
0.536351, 0.3530611, 0.6971641, 0.2, 0, 1, 1,
0.5409159, -1.55018, 3.308234, 0.2078431, 0, 1, 1,
0.542303, 0.3531795, 0.07300614, 0.2117647, 0, 1, 1,
0.5439836, 0.8110176, -1.522007, 0.2196078, 0, 1, 1,
0.5457831, 0.3310793, 1.07286, 0.2235294, 0, 1, 1,
0.5459427, 0.04086465, -0.009709758, 0.2313726, 0, 1, 1,
0.5479231, 0.3675545, 2.155185, 0.2352941, 0, 1, 1,
0.5497283, 4.284874, -2.087055, 0.2431373, 0, 1, 1,
0.5508342, 0.2087095, 0.9875854, 0.2470588, 0, 1, 1,
0.5562987, 0.07278283, 3.055317, 0.254902, 0, 1, 1,
0.557261, 0.8465198, 1.971204, 0.2588235, 0, 1, 1,
0.5593745, -1.244812, 2.376429, 0.2666667, 0, 1, 1,
0.5641054, 0.1534937, -0.8198884, 0.2705882, 0, 1, 1,
0.5727938, -0.5740619, 3.108633, 0.2784314, 0, 1, 1,
0.5785536, -0.06868203, 1.823346, 0.282353, 0, 1, 1,
0.5887011, -0.722581, 2.136165, 0.2901961, 0, 1, 1,
0.5896147, -0.9668406, 2.453257, 0.2941177, 0, 1, 1,
0.5946453, 1.760614, -1.609552, 0.3019608, 0, 1, 1,
0.5958374, -0.4125848, 2.353162, 0.3098039, 0, 1, 1,
0.6025641, 1.826135, 2.052107, 0.3137255, 0, 1, 1,
0.6064013, 0.1979145, 0.9998885, 0.3215686, 0, 1, 1,
0.6117819, 2.177999, -0.09941747, 0.3254902, 0, 1, 1,
0.6125568, -0.6451484, 1.115706, 0.3333333, 0, 1, 1,
0.6188471, 0.3272835, 1.335046, 0.3372549, 0, 1, 1,
0.6224762, 0.7601172, 0.676981, 0.345098, 0, 1, 1,
0.6231735, -1.165792, 3.718201, 0.3490196, 0, 1, 1,
0.6235675, 1.213213, -0.6819796, 0.3568628, 0, 1, 1,
0.6236128, -0.84559, 1.606224, 0.3607843, 0, 1, 1,
0.6296031, 0.4773828, 1.051195, 0.3686275, 0, 1, 1,
0.63081, 0.5757317, 2.021205, 0.372549, 0, 1, 1,
0.6310405, -0.01636111, 0.8869539, 0.3803922, 0, 1, 1,
0.6313124, -1.560905, 2.050784, 0.3843137, 0, 1, 1,
0.6315119, 0.5121705, 0.04255728, 0.3921569, 0, 1, 1,
0.6330433, 1.548979, -0.2708423, 0.3960784, 0, 1, 1,
0.639353, -1.698252, 1.277652, 0.4039216, 0, 1, 1,
0.6436321, -0.8838654, 1.712515, 0.4117647, 0, 1, 1,
0.6439737, -1.437561, 1.852117, 0.4156863, 0, 1, 1,
0.6442643, 2.111044, 0.8891436, 0.4235294, 0, 1, 1,
0.6445656, -0.2108663, 1.163543, 0.427451, 0, 1, 1,
0.6481405, 0.6431698, 0.754372, 0.4352941, 0, 1, 1,
0.6489696, 0.1696423, 0.5114543, 0.4392157, 0, 1, 1,
0.6492848, 0.01029042, 0.7678391, 0.4470588, 0, 1, 1,
0.6500688, 0.3439594, 0.9680452, 0.4509804, 0, 1, 1,
0.6520702, -0.9416652, 2.115146, 0.4588235, 0, 1, 1,
0.6535766, 0.8335667, 1.310571, 0.4627451, 0, 1, 1,
0.6566572, -0.7325661, 2.676921, 0.4705882, 0, 1, 1,
0.6567533, -0.2023143, 0.2790546, 0.4745098, 0, 1, 1,
0.6571353, 1.447965, 2.067737, 0.4823529, 0, 1, 1,
0.6619919, -0.05733344, 1.2756, 0.4862745, 0, 1, 1,
0.6648982, 0.8813012, -0.04005722, 0.4941176, 0, 1, 1,
0.670987, 0.06843375, 1.050549, 0.5019608, 0, 1, 1,
0.6726342, 0.5076602, 0.8248172, 0.5058824, 0, 1, 1,
0.6732733, 0.01969274, 2.582812, 0.5137255, 0, 1, 1,
0.6736122, 0.4511024, 0.2366104, 0.5176471, 0, 1, 1,
0.6771773, -1.589784, 2.539746, 0.5254902, 0, 1, 1,
0.6792694, 0.06770971, 0.9104598, 0.5294118, 0, 1, 1,
0.6820508, -1.684705, 2.766569, 0.5372549, 0, 1, 1,
0.6835057, -0.9326931, 2.435938, 0.5411765, 0, 1, 1,
0.6835603, -1.475281, 3.272894, 0.5490196, 0, 1, 1,
0.6877052, 0.4806339, 0.4310563, 0.5529412, 0, 1, 1,
0.69098, -1.313188, 1.318464, 0.5607843, 0, 1, 1,
0.6955621, -0.4086679, 2.425135, 0.5647059, 0, 1, 1,
0.6971582, 0.9271957, -1.535016, 0.572549, 0, 1, 1,
0.7038132, -0.317178, 2.294194, 0.5764706, 0, 1, 1,
0.7041262, 2.264241, -0.5285702, 0.5843138, 0, 1, 1,
0.7122186, -1.770853, 3.001649, 0.5882353, 0, 1, 1,
0.7156584, -0.5221418, 1.188352, 0.5960785, 0, 1, 1,
0.7187083, 1.678843, 1.516927, 0.6039216, 0, 1, 1,
0.7192013, 0.1291467, 2.553905, 0.6078432, 0, 1, 1,
0.7192621, 0.6044845, 0.01025005, 0.6156863, 0, 1, 1,
0.7196827, 0.5110518, 0.9916461, 0.6196079, 0, 1, 1,
0.7273717, 0.8417697, 1.387763, 0.627451, 0, 1, 1,
0.7319397, -0.08938665, 0.6619836, 0.6313726, 0, 1, 1,
0.7331252, 1.232361, 0.01434679, 0.6392157, 0, 1, 1,
0.7342171, -0.8846444, 0.9646116, 0.6431373, 0, 1, 1,
0.734503, 0.07822781, 1.235422, 0.6509804, 0, 1, 1,
0.7371488, -0.3875369, 3.832861, 0.654902, 0, 1, 1,
0.7404692, -0.5820351, 1.055723, 0.6627451, 0, 1, 1,
0.7412738, -0.5509765, 2.207859, 0.6666667, 0, 1, 1,
0.7416847, -0.4163191, 3.226414, 0.6745098, 0, 1, 1,
0.7437915, -0.05656815, 0.8321159, 0.6784314, 0, 1, 1,
0.7454003, 0.18414, 1.088804, 0.6862745, 0, 1, 1,
0.7512989, -0.06000785, 1.879803, 0.6901961, 0, 1, 1,
0.7527525, 0.4288155, 1.135904, 0.6980392, 0, 1, 1,
0.752947, 0.01786429, 2.015818, 0.7058824, 0, 1, 1,
0.7556088, 0.03924209, 0.397453, 0.7098039, 0, 1, 1,
0.7558748, 1.302352, -0.9170668, 0.7176471, 0, 1, 1,
0.75744, 1.27515, 2.846709, 0.7215686, 0, 1, 1,
0.7604694, -0.372738, 3.048945, 0.7294118, 0, 1, 1,
0.7629218, -0.9115827, 3.653782, 0.7333333, 0, 1, 1,
0.7641383, 0.2871565, 2.536522, 0.7411765, 0, 1, 1,
0.7720862, 0.3946339, 3.02108, 0.7450981, 0, 1, 1,
0.7726253, -0.7894957, 3.601965, 0.7529412, 0, 1, 1,
0.7730862, -0.1346271, 2.033772, 0.7568628, 0, 1, 1,
0.7845518, -2.472259, 2.576321, 0.7647059, 0, 1, 1,
0.7895986, 0.9558457, 0.09787547, 0.7686275, 0, 1, 1,
0.7909204, 0.9596223, 1.002711, 0.7764706, 0, 1, 1,
0.7961051, -0.04261593, 1.113852, 0.7803922, 0, 1, 1,
0.7981272, 0.8185354, 2.107975, 0.7882353, 0, 1, 1,
0.7985975, 1.672118, 0.1522066, 0.7921569, 0, 1, 1,
0.8000591, 0.7102008, 0.6008067, 0.8, 0, 1, 1,
0.8082284, -0.2319128, 2.790179, 0.8078431, 0, 1, 1,
0.8091311, 1.320887, -1.213145, 0.8117647, 0, 1, 1,
0.8137034, -0.3828001, 1.745316, 0.8196079, 0, 1, 1,
0.8190412, -1.045689, 1.463332, 0.8235294, 0, 1, 1,
0.8233627, -1.520627, 3.573589, 0.8313726, 0, 1, 1,
0.8240154, -0.2817931, 1.939261, 0.8352941, 0, 1, 1,
0.8383877, 0.5029779, 1.830758, 0.8431373, 0, 1, 1,
0.8394972, 0.3981982, 1.195598, 0.8470588, 0, 1, 1,
0.8417761, 1.847822, 0.3799004, 0.854902, 0, 1, 1,
0.8443786, 0.514681, 1.866279, 0.8588235, 0, 1, 1,
0.8474037, -0.840022, 2.313495, 0.8666667, 0, 1, 1,
0.8486701, -0.6004514, 2.53969, 0.8705882, 0, 1, 1,
0.8518974, -1.646471, 3.063937, 0.8784314, 0, 1, 1,
0.8535088, 1.22863, 1.333158, 0.8823529, 0, 1, 1,
0.8583131, 0.9250317, -0.996443, 0.8901961, 0, 1, 1,
0.8585993, 0.7736853, 0.8020528, 0.8941177, 0, 1, 1,
0.8630925, -0.6490571, 2.77921, 0.9019608, 0, 1, 1,
0.8632824, 1.299133, 1.695302, 0.9098039, 0, 1, 1,
0.865226, 0.8192628, 1.389106, 0.9137255, 0, 1, 1,
0.8683996, 0.5206794, 1.433491, 0.9215686, 0, 1, 1,
0.8704645, 2.085364, 1.257787, 0.9254902, 0, 1, 1,
0.8821023, -1.454166, 3.45704, 0.9333333, 0, 1, 1,
0.8876533, -0.5972804, 2.96647, 0.9372549, 0, 1, 1,
0.89327, -0.3315275, 2.030386, 0.945098, 0, 1, 1,
0.8941062, 0.1351795, 2.615199, 0.9490196, 0, 1, 1,
0.8970042, -0.009537648, 0.3399011, 0.9568627, 0, 1, 1,
0.8980609, -2.810633, 3.897914, 0.9607843, 0, 1, 1,
0.9006325, -0.10573, 0.3209911, 0.9686275, 0, 1, 1,
0.9006614, -2.065686, 1.554508, 0.972549, 0, 1, 1,
0.9007116, -0.08897888, -0.0004770738, 0.9803922, 0, 1, 1,
0.9030609, 0.9933725, 0.8841713, 0.9843137, 0, 1, 1,
0.9050736, 1.081768, 0.9891323, 0.9921569, 0, 1, 1,
0.9053664, 0.6040722, 2.058525, 0.9960784, 0, 1, 1,
0.906405, -0.1412649, 2.030533, 1, 0, 0.9960784, 1,
0.908479, 0.9457463, -0.1199968, 1, 0, 0.9882353, 1,
0.9155419, -1.208863, 2.050909, 1, 0, 0.9843137, 1,
0.9198198, 1.103053, 0.6549619, 1, 0, 0.9764706, 1,
0.9205535, 1.58164, 0.8653566, 1, 0, 0.972549, 1,
0.9213033, -0.4800232, 2.075599, 1, 0, 0.9647059, 1,
0.9228747, -0.1291734, 0.9842132, 1, 0, 0.9607843, 1,
0.9285309, -0.6511427, 3.599218, 1, 0, 0.9529412, 1,
0.9316713, 1.066721, -0.1722222, 1, 0, 0.9490196, 1,
0.9516354, -1.232497, 2.003955, 1, 0, 0.9411765, 1,
0.9534528, -0.3541238, 2.263533, 1, 0, 0.9372549, 1,
0.9552934, 1.369628, -0.3561792, 1, 0, 0.9294118, 1,
0.9625174, 0.6901777, 1.21626, 1, 0, 0.9254902, 1,
0.9694576, -0.1842315, 1.417887, 1, 0, 0.9176471, 1,
0.9736167, 0.6189976, 0.7900101, 1, 0, 0.9137255, 1,
0.9751337, 0.7516349, 0.709445, 1, 0, 0.9058824, 1,
0.9863176, 0.5808555, 1.58567, 1, 0, 0.9019608, 1,
0.9903044, 0.3357195, 0.8105929, 1, 0, 0.8941177, 1,
0.9916508, -1.187537, 2.526597, 1, 0, 0.8862745, 1,
0.999019, -0.3442943, 1.39332, 1, 0, 0.8823529, 1,
1.000118, 0.9583216, 1.116097, 1, 0, 0.8745098, 1,
1.001109, -1.386419, 1.64354, 1, 0, 0.8705882, 1,
1.006315, 1.041168, 0.7141377, 1, 0, 0.8627451, 1,
1.00643, 0.8907927, -0.4992265, 1, 0, 0.8588235, 1,
1.010172, -0.3283786, 0.540363, 1, 0, 0.8509804, 1,
1.013348, 0.7767793, -0.1322481, 1, 0, 0.8470588, 1,
1.029374, -0.5024604, 2.117393, 1, 0, 0.8392157, 1,
1.033186, -0.9743052, 2.148352, 1, 0, 0.8352941, 1,
1.061256, -0.2659421, 2.063339, 1, 0, 0.827451, 1,
1.073138, -0.5158973, 1.246937, 1, 0, 0.8235294, 1,
1.076905, 1.399711, -1.474408, 1, 0, 0.8156863, 1,
1.08322, -1.213136, 3.334487, 1, 0, 0.8117647, 1,
1.092925, 1.070844, 1.603395, 1, 0, 0.8039216, 1,
1.094841, 0.4276746, 0.4924962, 1, 0, 0.7960784, 1,
1.095127, 2.053206, 0.1048826, 1, 0, 0.7921569, 1,
1.096037, 1.68445, -0.8082289, 1, 0, 0.7843137, 1,
1.098389, -1.064742, 5.798213, 1, 0, 0.7803922, 1,
1.098468, 0.4479064, 0.4996034, 1, 0, 0.772549, 1,
1.101659, 0.5561768, 1.109905, 1, 0, 0.7686275, 1,
1.110648, 0.7517912, 1.822051, 1, 0, 0.7607843, 1,
1.118871, 0.2175527, 0.09500626, 1, 0, 0.7568628, 1,
1.126825, -0.8791634, 2.68, 1, 0, 0.7490196, 1,
1.13973, 0.5698142, 0.4531116, 1, 0, 0.7450981, 1,
1.145522, -0.717408, 1.853199, 1, 0, 0.7372549, 1,
1.15084, -0.5868344, 2.381365, 1, 0, 0.7333333, 1,
1.153297, -0.618809, 3.823732, 1, 0, 0.7254902, 1,
1.153975, -0.0442109, 0.6062554, 1, 0, 0.7215686, 1,
1.158417, 2.492159, 0.2155902, 1, 0, 0.7137255, 1,
1.162741, -1.163001, 2.908685, 1, 0, 0.7098039, 1,
1.163496, 0.2262528, 0.8035912, 1, 0, 0.7019608, 1,
1.173346, -0.3651781, 1.622582, 1, 0, 0.6941177, 1,
1.182012, 0.6235156, 0.7654201, 1, 0, 0.6901961, 1,
1.193045, -0.7444916, 2.413966, 1, 0, 0.682353, 1,
1.197976, -0.1593061, 2.258886, 1, 0, 0.6784314, 1,
1.199166, 0.979966, 1.46374, 1, 0, 0.6705883, 1,
1.201391, -0.02296679, 0.5707624, 1, 0, 0.6666667, 1,
1.205647, 0.5457473, 0.6176578, 1, 0, 0.6588235, 1,
1.20875, -0.8551648, 2.377571, 1, 0, 0.654902, 1,
1.21374, -1.095999, 4.045074, 1, 0, 0.6470588, 1,
1.220703, 0.7551317, 0.01895701, 1, 0, 0.6431373, 1,
1.225614, 1.629867, 0.9719165, 1, 0, 0.6352941, 1,
1.237178, 0.9034208, 1.247181, 1, 0, 0.6313726, 1,
1.244745, 1.245473, 2.249169, 1, 0, 0.6235294, 1,
1.265273, -0.3507906, 3.145246, 1, 0, 0.6196079, 1,
1.267495, 1.319179, 1.375356, 1, 0, 0.6117647, 1,
1.283842, 1.72605, 3.47506, 1, 0, 0.6078432, 1,
1.292981, 1.231595, -0.3586766, 1, 0, 0.6, 1,
1.301303, 0.6673279, 0.665227, 1, 0, 0.5921569, 1,
1.303811, -0.1017388, 1.036579, 1, 0, 0.5882353, 1,
1.304639, 0.7781812, 1.482993, 1, 0, 0.5803922, 1,
1.307233, 1.833507, 0.05061609, 1, 0, 0.5764706, 1,
1.311642, 0.3045379, 0.5459557, 1, 0, 0.5686275, 1,
1.32216, -0.6027007, 2.295054, 1, 0, 0.5647059, 1,
1.330346, -0.716059, 1.823608, 1, 0, 0.5568628, 1,
1.330684, -0.01624417, 3.549128, 1, 0, 0.5529412, 1,
1.335057, 0.4087324, 2.725733, 1, 0, 0.5450981, 1,
1.349118, 0.9556678, 0.3607184, 1, 0, 0.5411765, 1,
1.349351, -1.646233, 3.315488, 1, 0, 0.5333334, 1,
1.35122, 0.8193986, 1.479696, 1, 0, 0.5294118, 1,
1.361285, -0.3154309, 1.497622, 1, 0, 0.5215687, 1,
1.364642, 0.6525925, 0.9677552, 1, 0, 0.5176471, 1,
1.367203, 0.5797441, 0.786595, 1, 0, 0.509804, 1,
1.368968, -1.398673, 0.2005622, 1, 0, 0.5058824, 1,
1.374432, -0.608465, 0.2833051, 1, 0, 0.4980392, 1,
1.381366, 0.4613883, 4.087835, 1, 0, 0.4901961, 1,
1.389611, 0.2901905, 2.096006, 1, 0, 0.4862745, 1,
1.390096, 0.2514154, 1.032654, 1, 0, 0.4784314, 1,
1.396605, -0.3655004, 1.31884, 1, 0, 0.4745098, 1,
1.416717, 1.23786, 0.7070211, 1, 0, 0.4666667, 1,
1.417129, 0.4186233, 2.312203, 1, 0, 0.4627451, 1,
1.422269, -1.337383, 1.904657, 1, 0, 0.454902, 1,
1.423029, -1.036018, 3.023987, 1, 0, 0.4509804, 1,
1.425761, 1.83771, 0.6784838, 1, 0, 0.4431373, 1,
1.426861, -0.6938949, 1.819465, 1, 0, 0.4392157, 1,
1.430159, -0.6720478, 1.481291, 1, 0, 0.4313726, 1,
1.437553, -0.1735535, 2.991216, 1, 0, 0.427451, 1,
1.437932, -1.006371, 2.294081, 1, 0, 0.4196078, 1,
1.461007, -0.6048975, 3.303384, 1, 0, 0.4156863, 1,
1.467665, -0.2675808, 2.799509, 1, 0, 0.4078431, 1,
1.470649, -1.98483, 1.616714, 1, 0, 0.4039216, 1,
1.4798, 0.06225192, 0.4630145, 1, 0, 0.3960784, 1,
1.487402, -0.3951962, 3.082469, 1, 0, 0.3882353, 1,
1.490744, 1.68006, -1.016596, 1, 0, 0.3843137, 1,
1.498564, -1.347521, 2.013551, 1, 0, 0.3764706, 1,
1.52521, 1.156043, 0.3951365, 1, 0, 0.372549, 1,
1.527703, 0.7242322, 1.201305, 1, 0, 0.3647059, 1,
1.552962, 1.751499, 0.4901485, 1, 0, 0.3607843, 1,
1.563578, -0.1337122, 3.200777, 1, 0, 0.3529412, 1,
1.566228, 0.1703039, 1.380355, 1, 0, 0.3490196, 1,
1.56833, -0.8242027, 0.1857109, 1, 0, 0.3411765, 1,
1.58017, 0.4375958, 0.9400114, 1, 0, 0.3372549, 1,
1.594668, 1.268935, -0.1239247, 1, 0, 0.3294118, 1,
1.597587, 0.3769029, 1.085697, 1, 0, 0.3254902, 1,
1.609567, 0.04701027, 2.204858, 1, 0, 0.3176471, 1,
1.612957, -0.250031, 1.902231, 1, 0, 0.3137255, 1,
1.621139, -0.4160702, 1.555011, 1, 0, 0.3058824, 1,
1.644955, 1.319108, 1.405136, 1, 0, 0.2980392, 1,
1.648983, 1.152974, 1.565992, 1, 0, 0.2941177, 1,
1.65038, -0.4446904, 0.9255856, 1, 0, 0.2862745, 1,
1.681073, 0.8146918, 1.740355, 1, 0, 0.282353, 1,
1.689672, 0.9052909, 0.856559, 1, 0, 0.2745098, 1,
1.692424, 1.917086, 2.629536, 1, 0, 0.2705882, 1,
1.698263, -0.7913314, 0.6163225, 1, 0, 0.2627451, 1,
1.718248, 0.6173056, 0.9941465, 1, 0, 0.2588235, 1,
1.724917, 0.7514479, 0.9368845, 1, 0, 0.2509804, 1,
1.726362, 0.9008557, 0.5823849, 1, 0, 0.2470588, 1,
1.732813, 0.326714, 2.402463, 1, 0, 0.2392157, 1,
1.766791, -1.293184, 1.600261, 1, 0, 0.2352941, 1,
1.77912, 1.057609, 0.5309507, 1, 0, 0.227451, 1,
1.822769, -1.038841, 1.974632, 1, 0, 0.2235294, 1,
1.826176, 2.010378, 1.485316, 1, 0, 0.2156863, 1,
1.829973, 1.126087, 2.290691, 1, 0, 0.2117647, 1,
1.838177, -0.3248087, 1.922197, 1, 0, 0.2039216, 1,
1.868097, 0.6290786, -1.544558, 1, 0, 0.1960784, 1,
1.91566, 1.105273, 1.547647, 1, 0, 0.1921569, 1,
1.940167, 1.572764, -0.1444966, 1, 0, 0.1843137, 1,
1.952471, 1.349707, 1.318361, 1, 0, 0.1803922, 1,
1.978089, 1.566576, 1.76284, 1, 0, 0.172549, 1,
1.99141, -0.00574663, 1.793963, 1, 0, 0.1686275, 1,
1.997354, -0.7753431, 2.568733, 1, 0, 0.1607843, 1,
2.001729, -1.057245, 2.80398, 1, 0, 0.1568628, 1,
2.005263, -0.00747741, 1.805285, 1, 0, 0.1490196, 1,
2.014852, -0.8551047, 1.97943, 1, 0, 0.145098, 1,
2.062537, -1.320822, 1.367719, 1, 0, 0.1372549, 1,
2.06264, -0.02487073, 1.262963, 1, 0, 0.1333333, 1,
2.063691, 0.1287223, 0.7247183, 1, 0, 0.1254902, 1,
2.079212, -0.909606, 1.845295, 1, 0, 0.1215686, 1,
2.080102, -0.4518448, 0.4061616, 1, 0, 0.1137255, 1,
2.104484, -1.143506, 1.673975, 1, 0, 0.1098039, 1,
2.124428, -0.4860444, 1.924598, 1, 0, 0.1019608, 1,
2.179211, 0.09129005, 1.912012, 1, 0, 0.09411765, 1,
2.222967, 1.260772, 0.737489, 1, 0, 0.09019608, 1,
2.231022, 0.3369643, 2.049926, 1, 0, 0.08235294, 1,
2.255644, -1.424239, 1.755765, 1, 0, 0.07843138, 1,
2.263235, 0.5398208, 1.014514, 1, 0, 0.07058824, 1,
2.268219, -0.07468432, 3.423757, 1, 0, 0.06666667, 1,
2.319542, -0.60382, 1.458241, 1, 0, 0.05882353, 1,
2.342, 0.1061838, 1.010358, 1, 0, 0.05490196, 1,
2.512259, -0.9406165, 2.028254, 1, 0, 0.04705882, 1,
2.552426, -0.5951114, 1.482197, 1, 0, 0.04313726, 1,
2.581205, 1.7096, 1.340034, 1, 0, 0.03529412, 1,
2.586283, 0.7398732, 2.233328, 1, 0, 0.03137255, 1,
2.591924, -0.1370429, 1.238813, 1, 0, 0.02352941, 1,
2.635095, -0.4465257, 0.8841616, 1, 0, 0.01960784, 1,
2.787387, 0.3511429, 2.11867, 1, 0, 0.01176471, 1,
2.93651, 0.4182539, 1.604997, 1, 0, 0.007843138, 1
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
-0.3740239, -4.575434, -6.534897, 0, -0.5, 0.5, 0.5,
-0.3740239, -4.575434, -6.534897, 1, -0.5, 0.5, 0.5,
-0.3740239, -4.575434, -6.534897, 1, 1.5, 0.5, 0.5,
-0.3740239, -4.575434, -6.534897, 0, 1.5, 0.5, 0.5
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
-4.806829, 0.4967989, -6.534897, 0, -0.5, 0.5, 0.5,
-4.806829, 0.4967989, -6.534897, 1, -0.5, 0.5, 0.5,
-4.806829, 0.4967989, -6.534897, 1, 1.5, 0.5, 0.5,
-4.806829, 0.4967989, -6.534897, 0, 1.5, 0.5, 0.5
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
-4.806829, -4.575434, 0.5253997, 0, -0.5, 0.5, 0.5,
-4.806829, -4.575434, 0.5253997, 1, -0.5, 0.5, 0.5,
-4.806829, -4.575434, 0.5253997, 1, 1.5, 0.5, 0.5,
-4.806829, -4.575434, 0.5253997, 0, 1.5, 0.5, 0.5
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
-3, -3.404919, -4.905598,
2, -3.404919, -4.905598,
-3, -3.404919, -4.905598,
-3, -3.600005, -5.177148,
-2, -3.404919, -4.905598,
-2, -3.600005, -5.177148,
-1, -3.404919, -4.905598,
-1, -3.600005, -5.177148,
0, -3.404919, -4.905598,
0, -3.600005, -5.177148,
1, -3.404919, -4.905598,
1, -3.600005, -5.177148,
2, -3.404919, -4.905598,
2, -3.600005, -5.177148
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
-3, -3.990177, -5.720248, 0, -0.5, 0.5, 0.5,
-3, -3.990177, -5.720248, 1, -0.5, 0.5, 0.5,
-3, -3.990177, -5.720248, 1, 1.5, 0.5, 0.5,
-3, -3.990177, -5.720248, 0, 1.5, 0.5, 0.5,
-2, -3.990177, -5.720248, 0, -0.5, 0.5, 0.5,
-2, -3.990177, -5.720248, 1, -0.5, 0.5, 0.5,
-2, -3.990177, -5.720248, 1, 1.5, 0.5, 0.5,
-2, -3.990177, -5.720248, 0, 1.5, 0.5, 0.5,
-1, -3.990177, -5.720248, 0, -0.5, 0.5, 0.5,
-1, -3.990177, -5.720248, 1, -0.5, 0.5, 0.5,
-1, -3.990177, -5.720248, 1, 1.5, 0.5, 0.5,
-1, -3.990177, -5.720248, 0, 1.5, 0.5, 0.5,
0, -3.990177, -5.720248, 0, -0.5, 0.5, 0.5,
0, -3.990177, -5.720248, 1, -0.5, 0.5, 0.5,
0, -3.990177, -5.720248, 1, 1.5, 0.5, 0.5,
0, -3.990177, -5.720248, 0, 1.5, 0.5, 0.5,
1, -3.990177, -5.720248, 0, -0.5, 0.5, 0.5,
1, -3.990177, -5.720248, 1, -0.5, 0.5, 0.5,
1, -3.990177, -5.720248, 1, 1.5, 0.5, 0.5,
1, -3.990177, -5.720248, 0, 1.5, 0.5, 0.5,
2, -3.990177, -5.720248, 0, -0.5, 0.5, 0.5,
2, -3.990177, -5.720248, 1, -0.5, 0.5, 0.5,
2, -3.990177, -5.720248, 1, 1.5, 0.5, 0.5,
2, -3.990177, -5.720248, 0, 1.5, 0.5, 0.5
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
-3.783874, -2, -4.905598,
-3.783874, 4, -4.905598,
-3.783874, -2, -4.905598,
-3.954366, -2, -5.177148,
-3.783874, 0, -4.905598,
-3.954366, 0, -5.177148,
-3.783874, 2, -4.905598,
-3.954366, 2, -5.177148,
-3.783874, 4, -4.905598,
-3.954366, 4, -5.177148
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
"2",
"4"
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
-4.295352, -2, -5.720248, 0, -0.5, 0.5, 0.5,
-4.295352, -2, -5.720248, 1, -0.5, 0.5, 0.5,
-4.295352, -2, -5.720248, 1, 1.5, 0.5, 0.5,
-4.295352, -2, -5.720248, 0, 1.5, 0.5, 0.5,
-4.295352, 0, -5.720248, 0, -0.5, 0.5, 0.5,
-4.295352, 0, -5.720248, 1, -0.5, 0.5, 0.5,
-4.295352, 0, -5.720248, 1, 1.5, 0.5, 0.5,
-4.295352, 0, -5.720248, 0, 1.5, 0.5, 0.5,
-4.295352, 2, -5.720248, 0, -0.5, 0.5, 0.5,
-4.295352, 2, -5.720248, 1, -0.5, 0.5, 0.5,
-4.295352, 2, -5.720248, 1, 1.5, 0.5, 0.5,
-4.295352, 2, -5.720248, 0, 1.5, 0.5, 0.5,
-4.295352, 4, -5.720248, 0, -0.5, 0.5, 0.5,
-4.295352, 4, -5.720248, 1, -0.5, 0.5, 0.5,
-4.295352, 4, -5.720248, 1, 1.5, 0.5, 0.5,
-4.295352, 4, -5.720248, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.783874, -3.404919, -4,
-3.783874, -3.404919, 4,
-3.783874, -3.404919, -4,
-3.954366, -3.600005, -4,
-3.783874, -3.404919, -2,
-3.954366, -3.600005, -2,
-3.783874, -3.404919, 0,
-3.954366, -3.600005, 0,
-3.783874, -3.404919, 2,
-3.954366, -3.600005, 2,
-3.783874, -3.404919, 4,
-3.954366, -3.600005, 4
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
-4.295352, -3.990177, -4, 0, -0.5, 0.5, 0.5,
-4.295352, -3.990177, -4, 1, -0.5, 0.5, 0.5,
-4.295352, -3.990177, -4, 1, 1.5, 0.5, 0.5,
-4.295352, -3.990177, -4, 0, 1.5, 0.5, 0.5,
-4.295352, -3.990177, -2, 0, -0.5, 0.5, 0.5,
-4.295352, -3.990177, -2, 1, -0.5, 0.5, 0.5,
-4.295352, -3.990177, -2, 1, 1.5, 0.5, 0.5,
-4.295352, -3.990177, -2, 0, 1.5, 0.5, 0.5,
-4.295352, -3.990177, 0, 0, -0.5, 0.5, 0.5,
-4.295352, -3.990177, 0, 1, -0.5, 0.5, 0.5,
-4.295352, -3.990177, 0, 1, 1.5, 0.5, 0.5,
-4.295352, -3.990177, 0, 0, 1.5, 0.5, 0.5,
-4.295352, -3.990177, 2, 0, -0.5, 0.5, 0.5,
-4.295352, -3.990177, 2, 1, -0.5, 0.5, 0.5,
-4.295352, -3.990177, 2, 1, 1.5, 0.5, 0.5,
-4.295352, -3.990177, 2, 0, 1.5, 0.5, 0.5,
-4.295352, -3.990177, 4, 0, -0.5, 0.5, 0.5,
-4.295352, -3.990177, 4, 1, -0.5, 0.5, 0.5,
-4.295352, -3.990177, 4, 1, 1.5, 0.5, 0.5,
-4.295352, -3.990177, 4, 0, 1.5, 0.5, 0.5
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
-3.783874, -3.404919, -4.905598,
-3.783874, 4.398517, -4.905598,
-3.783874, -3.404919, 5.956398,
-3.783874, 4.398517, 5.956398,
-3.783874, -3.404919, -4.905598,
-3.783874, -3.404919, 5.956398,
-3.783874, 4.398517, -4.905598,
-3.783874, 4.398517, 5.956398,
-3.783874, -3.404919, -4.905598,
3.035826, -3.404919, -4.905598,
-3.783874, -3.404919, 5.956398,
3.035826, -3.404919, 5.956398,
-3.783874, 4.398517, -4.905598,
3.035826, 4.398517, -4.905598,
-3.783874, 4.398517, 5.956398,
3.035826, 4.398517, 5.956398,
3.035826, -3.404919, -4.905598,
3.035826, 4.398517, -4.905598,
3.035826, -3.404919, 5.956398,
3.035826, 4.398517, 5.956398,
3.035826, -3.404919, -4.905598,
3.035826, -3.404919, 5.956398,
3.035826, 4.398517, -4.905598,
3.035826, 4.398517, 5.956398
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
var radius = 8.016556;
var distance = 35.66656;
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
mvMatrix.translate( 0.3740239, -0.4967989, -0.5253997 );
mvMatrix.scale( 1.270973, 1.110749, 0.7979802 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.66656);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
thenylchlor<-read.table("thenylchlor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thenylchlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'thenylchlor' not found
```

```r
y<-thenylchlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'thenylchlor' not found
```

```r
z<-thenylchlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'thenylchlor' not found
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
-3.684558, -0.7518831, -1.544805, 0, 0, 1, 1, 1,
-2.727066, -0.4046197, -1.585429, 1, 0, 0, 1, 1,
-2.480493, -0.09477729, -0.06419701, 1, 0, 0, 1, 1,
-2.461555, 1.167876, -1.582672, 1, 0, 0, 1, 1,
-2.438713, -0.2482824, -1.510831, 1, 0, 0, 1, 1,
-2.431169, 0.380113, -1.991437, 1, 0, 0, 1, 1,
-2.314839, -1.841454, -1.232393, 0, 0, 0, 1, 1,
-2.242386, 0.4502715, -2.816639, 0, 0, 0, 1, 1,
-2.182694, 0.9681726, -0.9287933, 0, 0, 0, 1, 1,
-2.168128, 0.3303684, -1.087418, 0, 0, 0, 1, 1,
-2.145853, 0.3101237, -0.3559111, 0, 0, 0, 1, 1,
-2.111255, 0.6681837, -1.042203, 0, 0, 0, 1, 1,
-2.1097, 1.623865, -2.084224, 0, 0, 0, 1, 1,
-2.072624, 2.439333, -1.628117, 1, 1, 1, 1, 1,
-2.062534, -0.2512279, -1.713287, 1, 1, 1, 1, 1,
-2.050625, -1.915633, -2.656056, 1, 1, 1, 1, 1,
-2.008873, 0.8505897, -1.347297, 1, 1, 1, 1, 1,
-2.000476, 0.4529048, -0.3223671, 1, 1, 1, 1, 1,
-1.874337, -0.7406349, -2.260081, 1, 1, 1, 1, 1,
-1.861478, 1.660595, -2.017583, 1, 1, 1, 1, 1,
-1.851238, -1.819445, -2.265857, 1, 1, 1, 1, 1,
-1.843208, 1.861742, 0.1993759, 1, 1, 1, 1, 1,
-1.828129, -0.6103118, -2.389874, 1, 1, 1, 1, 1,
-1.827846, -0.3277501, -1.196118, 1, 1, 1, 1, 1,
-1.826976, -0.2510782, -2.13926, 1, 1, 1, 1, 1,
-1.819029, -0.3868632, -0.9905612, 1, 1, 1, 1, 1,
-1.788258, 0.2185886, -2.411181, 1, 1, 1, 1, 1,
-1.787478, 0.2143982, -0.4778695, 1, 1, 1, 1, 1,
-1.782666, 0.6601403, -0.7239565, 0, 0, 1, 1, 1,
-1.76814, 0.3493825, 0.6532713, 1, 0, 0, 1, 1,
-1.767625, -1.14342, -2.888957, 1, 0, 0, 1, 1,
-1.760087, 2.015593, 0.6665614, 1, 0, 0, 1, 1,
-1.755271, 1.751517, -1.369285, 1, 0, 0, 1, 1,
-1.746396, 1.641957, -1.435908, 1, 0, 0, 1, 1,
-1.74614, 1.736702, -1.540469, 0, 0, 0, 1, 1,
-1.744577, 2.436602, 0.6184384, 0, 0, 0, 1, 1,
-1.742893, 1.664377, 1.710967, 0, 0, 0, 1, 1,
-1.733946, 0.6732607, -1.048163, 0, 0, 0, 1, 1,
-1.71996, 0.8814103, -0.4951189, 0, 0, 0, 1, 1,
-1.719854, 2.091773, 0.237561, 0, 0, 0, 1, 1,
-1.719396, -0.2189749, -1.563859, 0, 0, 0, 1, 1,
-1.696549, -0.435784, 0.02235399, 1, 1, 1, 1, 1,
-1.670865, 0.7630236, -1.990727, 1, 1, 1, 1, 1,
-1.654114, -0.6269898, -2.492456, 1, 1, 1, 1, 1,
-1.640858, 0.2918654, -0.1813296, 1, 1, 1, 1, 1,
-1.621933, -1.104478, -1.173884, 1, 1, 1, 1, 1,
-1.621277, -1.323929, -2.503658, 1, 1, 1, 1, 1,
-1.619966, 0.474136, -1.644843, 1, 1, 1, 1, 1,
-1.593725, -0.1807456, -3.054622, 1, 1, 1, 1, 1,
-1.571256, -0.4164445, -2.976121, 1, 1, 1, 1, 1,
-1.565169, -0.8569165, -2.818302, 1, 1, 1, 1, 1,
-1.562361, 1.338828, 0.1890104, 1, 1, 1, 1, 1,
-1.559364, 0.6324641, -0.9961565, 1, 1, 1, 1, 1,
-1.549223, 0.2364289, -0.141849, 1, 1, 1, 1, 1,
-1.53785, -0.2162335, -3.430989, 1, 1, 1, 1, 1,
-1.499264, 1.074561, -1.843175, 1, 1, 1, 1, 1,
-1.498718, 0.3184382, -3.105513, 0, 0, 1, 1, 1,
-1.495304, -0.2640327, -3.325054, 1, 0, 0, 1, 1,
-1.493189, -1.796341, -3.070369, 1, 0, 0, 1, 1,
-1.483497, -0.2976764, -1.651188, 1, 0, 0, 1, 1,
-1.465842, 1.824109, -1.257435, 1, 0, 0, 1, 1,
-1.451659, 0.3038332, -2.507556, 1, 0, 0, 1, 1,
-1.448468, -0.1023391, -2.062017, 0, 0, 0, 1, 1,
-1.441715, -0.6625275, -3.649156, 0, 0, 0, 1, 1,
-1.425182, 1.945327, -0.8443646, 0, 0, 0, 1, 1,
-1.406181, -0.7668008, -1.749986, 0, 0, 0, 1, 1,
-1.403206, 0.6111533, -1.24493, 0, 0, 0, 1, 1,
-1.389979, 0.206234, -0.7618324, 0, 0, 0, 1, 1,
-1.382156, 0.1668579, -2.730596, 0, 0, 0, 1, 1,
-1.381554, -0.2333208, -1.142472, 1, 1, 1, 1, 1,
-1.355742, 1.083493, -0.615566, 1, 1, 1, 1, 1,
-1.344689, -1.896798, -1.108116, 1, 1, 1, 1, 1,
-1.339801, 0.8776056, -1.072709, 1, 1, 1, 1, 1,
-1.339192, 1.230517, -1.024177, 1, 1, 1, 1, 1,
-1.331118, 2.381871, 0.3580637, 1, 1, 1, 1, 1,
-1.323936, -0.7918113, -0.934504, 1, 1, 1, 1, 1,
-1.320545, 1.431759, -1.725668, 1, 1, 1, 1, 1,
-1.319782, 2.147625, -0.4369898, 1, 1, 1, 1, 1,
-1.313213, 1.636209, -0.3672007, 1, 1, 1, 1, 1,
-1.309981, 0.5780756, -0.9925591, 1, 1, 1, 1, 1,
-1.307649, 0.6626953, -2.08515, 1, 1, 1, 1, 1,
-1.302708, 1.382165, -2.030944, 1, 1, 1, 1, 1,
-1.299612, -2.012041, -3.866143, 1, 1, 1, 1, 1,
-1.29897, -1.091548, -2.723625, 1, 1, 1, 1, 1,
-1.296443, -0.7287886, -2.968261, 0, 0, 1, 1, 1,
-1.296268, 0.2189639, 0.2330628, 1, 0, 0, 1, 1,
-1.292305, 0.01274787, -2.384598, 1, 0, 0, 1, 1,
-1.276788, 0.4551279, 0.4643119, 1, 0, 0, 1, 1,
-1.274452, 0.6611025, -1.278463, 1, 0, 0, 1, 1,
-1.270203, 1.135526, -1.487419, 1, 0, 0, 1, 1,
-1.268739, 0.1458227, -1.76881, 0, 0, 0, 1, 1,
-1.267697, -0.1490022, -0.9257478, 0, 0, 0, 1, 1,
-1.265275, 1.319, -2.013342, 0, 0, 0, 1, 1,
-1.25555, 1.255519, -1.306011, 0, 0, 0, 1, 1,
-1.244037, -1.763086, -0.5956659, 0, 0, 0, 1, 1,
-1.234749, -0.4471152, -2.132792, 0, 0, 0, 1, 1,
-1.234257, 0.9354697, -0.05442819, 0, 0, 0, 1, 1,
-1.234068, 0.4165821, -1.302971, 1, 1, 1, 1, 1,
-1.233842, -0.7932369, -2.563195, 1, 1, 1, 1, 1,
-1.232078, -1.112764, -2.252188, 1, 1, 1, 1, 1,
-1.227562, -0.09234454, -2.329572, 1, 1, 1, 1, 1,
-1.22735, 0.8759342, -1.431491, 1, 1, 1, 1, 1,
-1.222995, 0.6474473, -1.984784, 1, 1, 1, 1, 1,
-1.1987, -1.028981, -1.93191, 1, 1, 1, 1, 1,
-1.191322, 0.8358633, -1.173833, 1, 1, 1, 1, 1,
-1.189504, 0.7904562, -0.9157755, 1, 1, 1, 1, 1,
-1.18934, -1.910932, -2.759664, 1, 1, 1, 1, 1,
-1.188363, 0.323256, -1.679234, 1, 1, 1, 1, 1,
-1.1862, 0.07289968, -2.940986, 1, 1, 1, 1, 1,
-1.184409, -0.4250515, -3.63717, 1, 1, 1, 1, 1,
-1.179223, 0.5581791, -0.6868799, 1, 1, 1, 1, 1,
-1.177332, -0.7392138, -2.408773, 1, 1, 1, 1, 1,
-1.16573, -0.09168255, -1.74726, 0, 0, 1, 1, 1,
-1.165145, 1.834904, 0.4775168, 1, 0, 0, 1, 1,
-1.164291, -0.7603291, -2.257987, 1, 0, 0, 1, 1,
-1.163076, -0.7936026, -2.448543, 1, 0, 0, 1, 1,
-1.161376, 1.412804, -0.695783, 1, 0, 0, 1, 1,
-1.157872, -0.3173893, -1.950401, 1, 0, 0, 1, 1,
-1.157162, -0.6809675, -1.670926, 0, 0, 0, 1, 1,
-1.15471, 1.118518, 1.361802, 0, 0, 0, 1, 1,
-1.152976, -1.867857, -4.526465, 0, 0, 0, 1, 1,
-1.145604, -0.1113307, -2.310966, 0, 0, 0, 1, 1,
-1.144501, -1.459081, -2.901534, 0, 0, 0, 1, 1,
-1.139533, -0.3337072, -2.929291, 0, 0, 0, 1, 1,
-1.126042, 1.000359, -0.9093415, 0, 0, 0, 1, 1,
-1.125168, 0.3215845, -0.8227125, 1, 1, 1, 1, 1,
-1.120375, -0.06286876, -2.378775, 1, 1, 1, 1, 1,
-1.113316, 0.7295873, -0.7506993, 1, 1, 1, 1, 1,
-1.105303, 0.8023999, 0.7560614, 1, 1, 1, 1, 1,
-1.103464, -0.660206, -2.063435, 1, 1, 1, 1, 1,
-1.089529, 0.2445803, -0.1431281, 1, 1, 1, 1, 1,
-1.088518, 0.04500208, -0.8106269, 1, 1, 1, 1, 1,
-1.065346, -1.032501, 0.02029033, 1, 1, 1, 1, 1,
-1.05936, -0.35946, -2.598191, 1, 1, 1, 1, 1,
-1.056911, 0.5796145, -1.077847, 1, 1, 1, 1, 1,
-1.055718, -1.126755, -2.685298, 1, 1, 1, 1, 1,
-1.049311, 0.9028001, -1.072583, 1, 1, 1, 1, 1,
-1.046803, -2.254618, -1.256082, 1, 1, 1, 1, 1,
-1.045752, 0.7915058, -1.729438, 1, 1, 1, 1, 1,
-1.039028, 1.324499, 0.4141848, 1, 1, 1, 1, 1,
-1.035068, 0.8369658, -0.3534068, 0, 0, 1, 1, 1,
-1.030105, 0.4186283, -1.46972, 1, 0, 0, 1, 1,
-1.026637, 1.896679, -0.8447842, 1, 0, 0, 1, 1,
-1.021192, -1.140318, -2.699154, 1, 0, 0, 1, 1,
-1.017841, 0.02625831, -2.396507, 1, 0, 0, 1, 1,
-1.016217, 0.2287557, -1.922606, 1, 0, 0, 1, 1,
-1.016199, 0.1959897, -2.608806, 0, 0, 0, 1, 1,
-1.010393, -0.9072269, -1.232893, 0, 0, 0, 1, 1,
-1.008785, -1.433304, -1.242365, 0, 0, 0, 1, 1,
-1.00767, 0.6337742, -1.490481, 0, 0, 0, 1, 1,
-0.9969034, -0.533863, -1.268627, 0, 0, 0, 1, 1,
-0.9817864, 0.5528058, -1.734493, 0, 0, 0, 1, 1,
-0.9806619, 1.275942, -0.7090982, 0, 0, 0, 1, 1,
-0.9756792, 1.322279, -0.8195235, 1, 1, 1, 1, 1,
-0.9733116, 2.635331, -0.3190118, 1, 1, 1, 1, 1,
-0.9675635, -0.3503954, -2.2069, 1, 1, 1, 1, 1,
-0.961902, 0.8192775, -1.345602, 1, 1, 1, 1, 1,
-0.9561175, -0.1259604, -1.925961, 1, 1, 1, 1, 1,
-0.9549494, -1.338018, 0.05651322, 1, 1, 1, 1, 1,
-0.954083, 0.2184083, 0.5942571, 1, 1, 1, 1, 1,
-0.9449586, 1.099189, -0.587417, 1, 1, 1, 1, 1,
-0.9435815, -1.7578, -1.351376, 1, 1, 1, 1, 1,
-0.9434946, 1.315779, 0.3419034, 1, 1, 1, 1, 1,
-0.943087, -1.332511, -0.3860738, 1, 1, 1, 1, 1,
-0.9303895, 0.5821576, -2.451617, 1, 1, 1, 1, 1,
-0.9293459, 0.5419874, -1.121178, 1, 1, 1, 1, 1,
-0.9280913, 0.2924281, -0.9852102, 1, 1, 1, 1, 1,
-0.9268231, 0.8497281, 0.5511904, 1, 1, 1, 1, 1,
-0.9205763, 0.3997844, -1.418364, 0, 0, 1, 1, 1,
-0.9189651, 0.6815543, -1.594541, 1, 0, 0, 1, 1,
-0.911467, 0.07834691, 0.0317756, 1, 0, 0, 1, 1,
-0.9112513, -0.5003728, -2.021395, 1, 0, 0, 1, 1,
-0.9107991, 0.1092928, -1.955557, 1, 0, 0, 1, 1,
-0.9103671, 0.3996952, -1.286221, 1, 0, 0, 1, 1,
-0.9079357, 1.155412, -1.812504, 0, 0, 0, 1, 1,
-0.9062298, -0.003476409, -1.649225, 0, 0, 0, 1, 1,
-0.9045909, -0.2344557, -1.667624, 0, 0, 0, 1, 1,
-0.9023243, 0.4044531, 0.1345686, 0, 0, 0, 1, 1,
-0.89833, -0.6506383, -1.484284, 0, 0, 0, 1, 1,
-0.8919691, 1.152019, 0.7233375, 0, 0, 0, 1, 1,
-0.8869306, -0.9752616, -3.241976, 0, 0, 0, 1, 1,
-0.8662627, 1.291365, -1.244022, 1, 1, 1, 1, 1,
-0.8650938, -0.5772862, -3.039924, 1, 1, 1, 1, 1,
-0.8634236, 0.09362751, -0.440833, 1, 1, 1, 1, 1,
-0.8610941, -0.05555657, -1.679987, 1, 1, 1, 1, 1,
-0.8562044, -2.291409, -3.040772, 1, 1, 1, 1, 1,
-0.8356529, 0.6394025, -1.09694, 1, 1, 1, 1, 1,
-0.8312839, -0.9038543, -3.300092, 1, 1, 1, 1, 1,
-0.8301031, 0.1086691, -1.825858, 1, 1, 1, 1, 1,
-0.8300057, 0.6564933, -2.41785, 1, 1, 1, 1, 1,
-0.8277885, -0.9535949, -2.240355, 1, 1, 1, 1, 1,
-0.824813, 0.9754117, -0.3980538, 1, 1, 1, 1, 1,
-0.8234735, -0.6938708, -2.164805, 1, 1, 1, 1, 1,
-0.8233702, -0.5008465, -2.603903, 1, 1, 1, 1, 1,
-0.8212517, 0.577253, -1.130116, 1, 1, 1, 1, 1,
-0.8096713, -0.5156373, -0.9317039, 1, 1, 1, 1, 1,
-0.8058698, -0.7250487, -4.139387, 0, 0, 1, 1, 1,
-0.8025177, -0.5852018, -0.03302458, 1, 0, 0, 1, 1,
-0.8002905, -0.0800058, -1.725884, 1, 0, 0, 1, 1,
-0.7992288, 0.427056, -2.094747, 1, 0, 0, 1, 1,
-0.7931206, 0.4671668, 0.446733, 1, 0, 0, 1, 1,
-0.7916507, 0.06544948, -2.217282, 1, 0, 0, 1, 1,
-0.7882614, -0.6938168, -1.785491, 0, 0, 0, 1, 1,
-0.785965, 0.2457353, -1.232439, 0, 0, 0, 1, 1,
-0.7829954, -0.1568364, -3.111777, 0, 0, 0, 1, 1,
-0.7757492, -0.4624414, -1.288866, 0, 0, 0, 1, 1,
-0.774909, -0.9044048, -3.046549, 0, 0, 0, 1, 1,
-0.774722, -1.324254, -3.947235, 0, 0, 0, 1, 1,
-0.7733386, 0.2697064, -1.772904, 0, 0, 0, 1, 1,
-0.767234, -0.6697753, -1.731441, 1, 1, 1, 1, 1,
-0.7655094, 0.8742391, 0.3612881, 1, 1, 1, 1, 1,
-0.7646235, 1.753656, -0.7949286, 1, 1, 1, 1, 1,
-0.7599534, -0.8173456, -1.938444, 1, 1, 1, 1, 1,
-0.7598073, 0.2306619, -1.43243, 1, 1, 1, 1, 1,
-0.7588859, -0.4195235, -3.170794, 1, 1, 1, 1, 1,
-0.7577062, -1.347986, -4.177195, 1, 1, 1, 1, 1,
-0.7553871, 0.4318154, -2.621716, 1, 1, 1, 1, 1,
-0.7547686, 0.7304344, 2.403639, 1, 1, 1, 1, 1,
-0.7498593, 0.7768326, -1.767751, 1, 1, 1, 1, 1,
-0.7473869, -0.2819767, -0.2878858, 1, 1, 1, 1, 1,
-0.7471367, 2.395843, -1.033536, 1, 1, 1, 1, 1,
-0.7408887, -0.2794041, -1.19785, 1, 1, 1, 1, 1,
-0.7379175, -0.5801954, -2.949116, 1, 1, 1, 1, 1,
-0.7308302, -1.257867, -4.236423, 1, 1, 1, 1, 1,
-0.7306173, -0.7538746, -2.146739, 0, 0, 1, 1, 1,
-0.7236748, 1.501178, -0.4580789, 1, 0, 0, 1, 1,
-0.7226037, 1.452999, -0.9717036, 1, 0, 0, 1, 1,
-0.7215918, 0.7825104, -1.912602, 1, 0, 0, 1, 1,
-0.7195893, -0.6628451, -4.734178, 1, 0, 0, 1, 1,
-0.7175406, 0.4163019, -2.190003, 1, 0, 0, 1, 1,
-0.7172462, 1.652611, 0.1764801, 0, 0, 0, 1, 1,
-0.7104094, -0.7869126, -3.255561, 0, 0, 0, 1, 1,
-0.7042475, -1.032954, -2.641899, 0, 0, 0, 1, 1,
-0.698445, 2.856402, 1.132217, 0, 0, 0, 1, 1,
-0.6976047, 0.7833823, -1.882577, 0, 0, 0, 1, 1,
-0.6845564, -1.37899, -2.566107, 0, 0, 0, 1, 1,
-0.6831916, -0.4343209, -2.968162, 0, 0, 0, 1, 1,
-0.6829038, 0.1208205, -1.564515, 1, 1, 1, 1, 1,
-0.6783271, 0.6517742, -0.7301727, 1, 1, 1, 1, 1,
-0.6756546, 0.6475761, 0.3795467, 1, 1, 1, 1, 1,
-0.6696241, -1.255252, -2.792946, 1, 1, 1, 1, 1,
-0.6689771, -0.5296647, -1.775115, 1, 1, 1, 1, 1,
-0.6667061, -0.3889254, -1.177676, 1, 1, 1, 1, 1,
-0.6660659, 1.46855, 0.6883872, 1, 1, 1, 1, 1,
-0.665092, 0.6439001, 0.3575289, 1, 1, 1, 1, 1,
-0.6634359, 1.388688, -0.4210119, 1, 1, 1, 1, 1,
-0.6612653, 0.315384, -0.7591109, 1, 1, 1, 1, 1,
-0.6578724, -0.1146917, 1.132786, 1, 1, 1, 1, 1,
-0.6562674, -0.4132458, -1.385378, 1, 1, 1, 1, 1,
-0.6496474, 0.4046633, -0.1877622, 1, 1, 1, 1, 1,
-0.6441571, 1.064977, -0.911489, 1, 1, 1, 1, 1,
-0.6394144, 0.6108292, -0.4594948, 1, 1, 1, 1, 1,
-0.6359794, -0.4035678, -1.842533, 0, 0, 1, 1, 1,
-0.6333548, 1.269319, -0.02020017, 1, 0, 0, 1, 1,
-0.6266421, 0.07760432, -1.796705, 1, 0, 0, 1, 1,
-0.6236954, -0.3473083, -1.972064, 1, 0, 0, 1, 1,
-0.6140606, 1.463954, 1.053705, 1, 0, 0, 1, 1,
-0.611545, -0.3881674, -3.52574, 1, 0, 0, 1, 1,
-0.6089565, -0.4492251, -1.174779, 0, 0, 0, 1, 1,
-0.6074637, 0.2379805, -1.994786, 0, 0, 0, 1, 1,
-0.6062432, 0.2096831, 0.5749351, 0, 0, 0, 1, 1,
-0.6055766, -0.5066597, -2.843966, 0, 0, 0, 1, 1,
-0.6055011, -0.3165563, -1.985083, 0, 0, 0, 1, 1,
-0.6044179, -0.594674, -3.677517, 0, 0, 0, 1, 1,
-0.5975317, 0.4042602, -0.6250888, 0, 0, 0, 1, 1,
-0.5972012, 0.6603885, -1.968188, 1, 1, 1, 1, 1,
-0.5960122, 0.03636997, -0.898389, 1, 1, 1, 1, 1,
-0.5831351, 0.09666517, -0.7891009, 1, 1, 1, 1, 1,
-0.5805501, 0.3268625, 0.8152621, 1, 1, 1, 1, 1,
-0.5798754, -0.5028164, -0.8565032, 1, 1, 1, 1, 1,
-0.5766458, 0.1476998, -1.285972, 1, 1, 1, 1, 1,
-0.5749382, 0.5593259, -0.9796473, 1, 1, 1, 1, 1,
-0.5729536, -1.327626, -2.668216, 1, 1, 1, 1, 1,
-0.5720113, -0.2790645, -1.242129, 1, 1, 1, 1, 1,
-0.5705075, 0.8928501, 0.4918669, 1, 1, 1, 1, 1,
-0.5691258, -1.066641, -3.926487, 1, 1, 1, 1, 1,
-0.5648604, 0.3579778, -0.8566018, 1, 1, 1, 1, 1,
-0.5629144, 0.2924028, -1.07192, 1, 1, 1, 1, 1,
-0.5625814, 0.3454122, -2.021262, 1, 1, 1, 1, 1,
-0.5574557, 0.2985441, -0.4241329, 1, 1, 1, 1, 1,
-0.5559006, -0.7937194, -2.526558, 0, 0, 1, 1, 1,
-0.5497591, -0.1395094, -2.532845, 1, 0, 0, 1, 1,
-0.5418179, -0.1466163, -1.450506, 1, 0, 0, 1, 1,
-0.5374649, -0.5933498, -3.632621, 1, 0, 0, 1, 1,
-0.5336027, 0.7681819, 0.801593, 1, 0, 0, 1, 1,
-0.532894, 0.1007794, -0.6182356, 1, 0, 0, 1, 1,
-0.5252942, -0.4902268, -0.6577605, 0, 0, 0, 1, 1,
-0.5228336, 0.4291117, 0.2445611, 0, 0, 0, 1, 1,
-0.5225647, -0.02993686, -0.1071689, 0, 0, 0, 1, 1,
-0.517738, 2.351921, 0.2240421, 0, 0, 0, 1, 1,
-0.5146279, -1.429912, -3.811865, 0, 0, 0, 1, 1,
-0.5138036, 0.4562203, -0.4292705, 0, 0, 0, 1, 1,
-0.5137083, -0.4358953, -2.741524, 0, 0, 0, 1, 1,
-0.5117004, -0.7931107, -3.3045, 1, 1, 1, 1, 1,
-0.5085921, -1.648388, -1.767412, 1, 1, 1, 1, 1,
-0.5034553, -0.3664698, -0.5061955, 1, 1, 1, 1, 1,
-0.5026336, -0.5085416, -3.202419, 1, 1, 1, 1, 1,
-0.5024818, -1.371484, -0.8415577, 1, 1, 1, 1, 1,
-0.4981928, -1.14822, -2.764238, 1, 1, 1, 1, 1,
-0.4969853, -0.967074, -3.076014, 1, 1, 1, 1, 1,
-0.4953282, 1.313412, -0.1680746, 1, 1, 1, 1, 1,
-0.4917295, 1.951964, -0.7923745, 1, 1, 1, 1, 1,
-0.4903165, -0.008695794, -3.12243, 1, 1, 1, 1, 1,
-0.4853113, 0.1145874, 0.1890227, 1, 1, 1, 1, 1,
-0.4827336, -0.4841766, -2.248766, 1, 1, 1, 1, 1,
-0.481995, 1.09563, -0.2095912, 1, 1, 1, 1, 1,
-0.4819104, 1.200369, 0.1324297, 1, 1, 1, 1, 1,
-0.4810586, 0.1945371, -2.553232, 1, 1, 1, 1, 1,
-0.4795889, 0.5733575, -2.138335, 0, 0, 1, 1, 1,
-0.478838, 0.5689487, -1.622807, 1, 0, 0, 1, 1,
-0.4767895, 0.3393791, -2.142036, 1, 0, 0, 1, 1,
-0.4751183, 1.495991, -1.985415, 1, 0, 0, 1, 1,
-0.4727135, 0.5303237, -2.037753, 1, 0, 0, 1, 1,
-0.4722061, -0.2485134, -3.075719, 1, 0, 0, 1, 1,
-0.4699511, -0.9389001, -2.41589, 0, 0, 0, 1, 1,
-0.4674605, 0.4735791, -0.495064, 0, 0, 0, 1, 1,
-0.4642226, -0.08413307, -2.449599, 0, 0, 0, 1, 1,
-0.4624921, 0.8114958, -0.5825637, 0, 0, 0, 1, 1,
-0.458077, -2.193583, -2.098213, 0, 0, 0, 1, 1,
-0.4578928, -0.1149336, -2.804154, 0, 0, 0, 1, 1,
-0.4546221, -0.1819046, -3.492157, 0, 0, 0, 1, 1,
-0.4517278, -1.825944, -4.747414, 1, 1, 1, 1, 1,
-0.4468071, 0.347288, -0.6806135, 1, 1, 1, 1, 1,
-0.4446824, -0.3396138, -1.752114, 1, 1, 1, 1, 1,
-0.4364222, -0.002976418, -1.645493, 1, 1, 1, 1, 1,
-0.4358104, -0.217073, -3.609906, 1, 1, 1, 1, 1,
-0.4335734, -0.1464847, -1.356103, 1, 1, 1, 1, 1,
-0.4277875, -0.3901689, -2.308442, 1, 1, 1, 1, 1,
-0.4138561, -0.3420771, -2.707077, 1, 1, 1, 1, 1,
-0.4131533, 0.9875357, 0.6760805, 1, 1, 1, 1, 1,
-0.4129401, -0.2495475, -3.480172, 1, 1, 1, 1, 1,
-0.4120642, 1.263046, -2.319882, 1, 1, 1, 1, 1,
-0.4100777, 1.471163, -1.660828, 1, 1, 1, 1, 1,
-0.4069966, 0.4384013, -1.173084, 1, 1, 1, 1, 1,
-0.4068107, 1.703524, -2.094208, 1, 1, 1, 1, 1,
-0.4051725, -1.514941, -4.658665, 1, 1, 1, 1, 1,
-0.3988737, -1.550867, -2.369156, 0, 0, 1, 1, 1,
-0.3969001, 1.742736, -0.09705649, 1, 0, 0, 1, 1,
-0.3967519, 0.1495291, -1.320769, 1, 0, 0, 1, 1,
-0.3955848, 1.323608, 0.297468, 1, 0, 0, 1, 1,
-0.3927248, -0.3800004, -0.6809968, 1, 0, 0, 1, 1,
-0.3867455, 0.4919897, -1.0006, 1, 0, 0, 1, 1,
-0.3839938, -1.324475, -1.375249, 0, 0, 0, 1, 1,
-0.3829669, 0.1949956, -1.489388, 0, 0, 0, 1, 1,
-0.3794887, 2.104485, 1.814807, 0, 0, 0, 1, 1,
-0.3786269, -2.452056, -2.355577, 0, 0, 0, 1, 1,
-0.3776206, -0.07177848, -4.202147, 0, 0, 0, 1, 1,
-0.3733714, 0.8011968, -0.7932878, 0, 0, 0, 1, 1,
-0.372663, 0.5785308, -0.09255334, 0, 0, 0, 1, 1,
-0.3726055, -0.841072, -2.989338, 1, 1, 1, 1, 1,
-0.3725367, 0.730502, -0.869057, 1, 1, 1, 1, 1,
-0.3721338, 0.2769301, -0.5616208, 1, 1, 1, 1, 1,
-0.3715252, 0.438566, -0.7906979, 1, 1, 1, 1, 1,
-0.3704016, -0.2647481, -2.054718, 1, 1, 1, 1, 1,
-0.3700994, -0.9568805, -3.216357, 1, 1, 1, 1, 1,
-0.3694868, -1.058134, -1.722119, 1, 1, 1, 1, 1,
-0.3665891, -0.5189318, -1.817939, 1, 1, 1, 1, 1,
-0.3648117, 0.4242367, 0.6804107, 1, 1, 1, 1, 1,
-0.3639574, 1.098408, 1.579313, 1, 1, 1, 1, 1,
-0.3598177, -0.8404378, -3.264569, 1, 1, 1, 1, 1,
-0.3531649, 1.08963, 0.4100953, 1, 1, 1, 1, 1,
-0.3520678, -0.6387367, -2.97311, 1, 1, 1, 1, 1,
-0.3512361, -1.800826, -0.4784265, 1, 1, 1, 1, 1,
-0.3508111, -0.08106341, -1.544285, 1, 1, 1, 1, 1,
-0.3495404, 0.8608421, 0.4480671, 0, 0, 1, 1, 1,
-0.3488838, 1.502832, 0.1172859, 1, 0, 0, 1, 1,
-0.3469168, -1.922221, -4.171955, 1, 0, 0, 1, 1,
-0.34319, 1.02797, 0.3279335, 1, 0, 0, 1, 1,
-0.3398407, 0.3032052, -1.112772, 1, 0, 0, 1, 1,
-0.3381717, 0.120352, -2.10167, 1, 0, 0, 1, 1,
-0.337861, -0.758853, -2.612948, 0, 0, 0, 1, 1,
-0.33762, -1.330588, -1.818713, 0, 0, 0, 1, 1,
-0.3301694, -1.468501, -2.716389, 0, 0, 0, 1, 1,
-0.3281397, -1.123323, -2.860177, 0, 0, 0, 1, 1,
-0.3248237, 1.515982, -2.696731, 0, 0, 0, 1, 1,
-0.3241104, 1.264885, -0.537573, 0, 0, 0, 1, 1,
-0.3234206, -0.1319166, -1.433969, 0, 0, 0, 1, 1,
-0.323355, -0.7210973, -4.057145, 1, 1, 1, 1, 1,
-0.3222578, -0.1307756, -3.235078, 1, 1, 1, 1, 1,
-0.3150179, 1.101473, -0.372972, 1, 1, 1, 1, 1,
-0.3148167, 1.105993, -0.4028195, 1, 1, 1, 1, 1,
-0.3057564, 1.553211, 0.2474981, 1, 1, 1, 1, 1,
-0.3047316, -1.121137, -3.232198, 1, 1, 1, 1, 1,
-0.3035104, 1.755213, -0.1766652, 1, 1, 1, 1, 1,
-0.3034509, 0.7519583, -0.2027511, 1, 1, 1, 1, 1,
-0.3020238, -1.606613, -2.840952, 1, 1, 1, 1, 1,
-0.3015099, -0.7781172, -3.265417, 1, 1, 1, 1, 1,
-0.2996849, 1.761037, 0.6044674, 1, 1, 1, 1, 1,
-0.295517, -0.6020025, -3.025221, 1, 1, 1, 1, 1,
-0.2954914, 1.402867, 0.9736188, 1, 1, 1, 1, 1,
-0.2941754, -0.6106479, -2.981126, 1, 1, 1, 1, 1,
-0.2939913, -0.7792346, -3.526549, 1, 1, 1, 1, 1,
-0.2936413, 0.06424281, -2.270946, 0, 0, 1, 1, 1,
-0.2924019, -0.7224029, -2.733149, 1, 0, 0, 1, 1,
-0.2908661, -0.1195895, -2.68169, 1, 0, 0, 1, 1,
-0.2892004, 0.2782158, 1.690524, 1, 0, 0, 1, 1,
-0.2855373, 1.114712, -0.9562603, 1, 0, 0, 1, 1,
-0.2839274, -0.4785643, -2.477112, 1, 0, 0, 1, 1,
-0.2796002, -0.6478693, -4.029777, 0, 0, 0, 1, 1,
-0.2782444, 0.7386063, -0.3994792, 0, 0, 0, 1, 1,
-0.276154, -0.04599771, -0.6468323, 0, 0, 0, 1, 1,
-0.2759666, -1.332861, -4.083094, 0, 0, 0, 1, 1,
-0.2715172, 1.138216, 0.3467874, 0, 0, 0, 1, 1,
-0.2695174, 1.3821, -1.423802, 0, 0, 0, 1, 1,
-0.2639912, -0.6656309, -2.344868, 0, 0, 0, 1, 1,
-0.2618889, -0.9624175, -0.9066383, 1, 1, 1, 1, 1,
-0.2602096, -0.3444884, -3.164138, 1, 1, 1, 1, 1,
-0.2535751, 0.9879526, -1.198089, 1, 1, 1, 1, 1,
-0.251777, 0.4310182, -1.084546, 1, 1, 1, 1, 1,
-0.2510555, 0.9564743, 0.02546652, 1, 1, 1, 1, 1,
-0.2498798, 0.6087866, 0.234209, 1, 1, 1, 1, 1,
-0.2464778, -0.3809723, -2.466212, 1, 1, 1, 1, 1,
-0.2432487, 1.062565, -3.139304, 1, 1, 1, 1, 1,
-0.2394119, -0.04038521, -2.151263, 1, 1, 1, 1, 1,
-0.2388314, 0.5709308, -0.5203792, 1, 1, 1, 1, 1,
-0.2354293, 3.67552, 0.3313449, 1, 1, 1, 1, 1,
-0.2333568, -0.08420926, -1.762392, 1, 1, 1, 1, 1,
-0.2307812, 0.3803208, 0.6350028, 1, 1, 1, 1, 1,
-0.2281869, 0.6070778, -0.3544027, 1, 1, 1, 1, 1,
-0.2243851, -1.210942, -4.062108, 1, 1, 1, 1, 1,
-0.2242811, -2.23349, -1.294389, 0, 0, 1, 1, 1,
-0.2240278, -1.75869, -3.645709, 1, 0, 0, 1, 1,
-0.2206205, 0.2290029, -2.123268, 1, 0, 0, 1, 1,
-0.2196903, 1.424879, 0.1799192, 1, 0, 0, 1, 1,
-0.2188194, 0.2454077, -2.809062, 1, 0, 0, 1, 1,
-0.2118949, 0.639964, -0.5104103, 1, 0, 0, 1, 1,
-0.206466, 1.684775, -1.014038, 0, 0, 0, 1, 1,
-0.2039956, 0.1719246, -1.138903, 0, 0, 0, 1, 1,
-0.199671, -0.7832528, -1.910719, 0, 0, 0, 1, 1,
-0.1994499, 0.06701069, -0.6641509, 0, 0, 0, 1, 1,
-0.1949013, 1.053685, 0.03433312, 0, 0, 0, 1, 1,
-0.1948078, -0.1009277, -1.715085, 0, 0, 0, 1, 1,
-0.1937121, 0.7494881, -1.632934, 0, 0, 0, 1, 1,
-0.1925256, -1.326932, -2.825998, 1, 1, 1, 1, 1,
-0.192385, 0.1022793, -2.567533, 1, 1, 1, 1, 1,
-0.1896809, 1.01579, 2.303053, 1, 1, 1, 1, 1,
-0.1844302, 0.9395795, -1.618984, 1, 1, 1, 1, 1,
-0.1749288, -0.01629181, -1.315949, 1, 1, 1, 1, 1,
-0.1739222, 0.4632682, 0.04796427, 1, 1, 1, 1, 1,
-0.1671742, -0.4258098, -3.358048, 1, 1, 1, 1, 1,
-0.1662927, 0.6160562, -2.186257, 1, 1, 1, 1, 1,
-0.1643715, 1.380831, 0.2320455, 1, 1, 1, 1, 1,
-0.1638793, 2.549079, -0.3699201, 1, 1, 1, 1, 1,
-0.1637127, -0.08167756, -2.349044, 1, 1, 1, 1, 1,
-0.1596318, 0.452114, 0.6304977, 1, 1, 1, 1, 1,
-0.1572742, 1.303786, -0.8834686, 1, 1, 1, 1, 1,
-0.1509825, -0.6725507, -4.167349, 1, 1, 1, 1, 1,
-0.1506512, -1.511796, -2.960342, 1, 1, 1, 1, 1,
-0.1506255, -0.6280668, -2.837902, 0, 0, 1, 1, 1,
-0.1490079, -0.7492753, -2.460045, 1, 0, 0, 1, 1,
-0.1480205, 0.5746691, 1.473028, 1, 0, 0, 1, 1,
-0.1476271, -1.605706, -4.516287, 1, 0, 0, 1, 1,
-0.1469912, 0.4145944, 0.5186729, 1, 0, 0, 1, 1,
-0.1457524, 0.4449465, 0.4901435, 1, 0, 0, 1, 1,
-0.1439701, -0.9860454, -1.689672, 0, 0, 0, 1, 1,
-0.1368446, -1.470724, -1.184922, 0, 0, 0, 1, 1,
-0.1363998, 0.3085974, -1.520994, 0, 0, 0, 1, 1,
-0.1342591, 0.7908769, -0.9654014, 0, 0, 0, 1, 1,
-0.1321948, -0.6049008, -2.484875, 0, 0, 0, 1, 1,
-0.1199153, -0.09909026, -2.876503, 0, 0, 0, 1, 1,
-0.1189158, 0.5227509, 0.2919457, 0, 0, 0, 1, 1,
-0.1128202, 1.390652, -1.597568, 1, 1, 1, 1, 1,
-0.1126224, 1.122867, 1.931846, 1, 1, 1, 1, 1,
-0.1063599, -1.439284, -2.785482, 1, 1, 1, 1, 1,
-0.1045949, -0.7051292, -3.953412, 1, 1, 1, 1, 1,
-0.1034027, 0.8646636, 1.083648, 1, 1, 1, 1, 1,
-0.1008895, 0.534667, -0.4837379, 1, 1, 1, 1, 1,
-0.09585641, 1.012219, -0.682678, 1, 1, 1, 1, 1,
-0.0957829, -0.5701931, -3.874206, 1, 1, 1, 1, 1,
-0.09494358, -0.7018609, -3.691557, 1, 1, 1, 1, 1,
-0.09104674, 0.667699, -0.2877374, 1, 1, 1, 1, 1,
-0.09015899, -2.213772, -1.785769, 1, 1, 1, 1, 1,
-0.08992934, 0.3938058, -0.0521347, 1, 1, 1, 1, 1,
-0.08412933, 1.067836, -1.112885, 1, 1, 1, 1, 1,
-0.08053073, 0.4639838, -2.079519, 1, 1, 1, 1, 1,
-0.0799235, 0.129703, 1.187616, 1, 1, 1, 1, 1,
-0.07931295, 1.102392, 1.219122, 0, 0, 1, 1, 1,
-0.07824236, 0.2618269, -2.196609, 1, 0, 0, 1, 1,
-0.07631907, -0.6748364, -4.241154, 1, 0, 0, 1, 1,
-0.07482491, -0.2594788, -2.470008, 1, 0, 0, 1, 1,
-0.07320054, 0.0851057, 0.9216276, 1, 0, 0, 1, 1,
-0.0694086, 0.660108, -2.300569, 1, 0, 0, 1, 1,
-0.0673637, -0.6064662, -2.567591, 0, 0, 0, 1, 1,
-0.06728833, -0.6796333, -3.327736, 0, 0, 0, 1, 1,
-0.06079397, 0.4001216, -0.5596307, 0, 0, 0, 1, 1,
-0.05774956, -0.729554, -3.374729, 0, 0, 0, 1, 1,
-0.05731313, 0.5393242, 0.9348875, 0, 0, 0, 1, 1,
-0.05451282, 0.04894704, -0.3408806, 0, 0, 0, 1, 1,
-0.05086299, 1.265101, -1.143791, 0, 0, 0, 1, 1,
-0.05053509, -0.8469964, -3.697313, 1, 1, 1, 1, 1,
-0.04864803, 0.662577, 0.372407, 1, 1, 1, 1, 1,
-0.04746168, 0.5504639, 1.375853, 1, 1, 1, 1, 1,
-0.04072677, 1.348177, 1.222394, 1, 1, 1, 1, 1,
-0.02676976, 0.5903206, 0.50412, 1, 1, 1, 1, 1,
-0.02562278, 0.7510909, -0.3358292, 1, 1, 1, 1, 1,
-0.0212967, 0.7709897, 0.4479024, 1, 1, 1, 1, 1,
-0.0209852, -0.12467, -1.511931, 1, 1, 1, 1, 1,
-0.01809356, -0.1395765, -2.748945, 1, 1, 1, 1, 1,
-0.01425381, 2.111437, 0.03872659, 1, 1, 1, 1, 1,
-0.007275897, 0.9431303, 0.5333758, 1, 1, 1, 1, 1,
-0.004839023, 0.9982816, 0.7101017, 1, 1, 1, 1, 1,
-0.004021647, -0.6231052, -4.328336, 1, 1, 1, 1, 1,
-0.004015109, 1.045939, 1.780838, 1, 1, 1, 1, 1,
-0.0007839112, 0.3270237, 0.004899112, 1, 1, 1, 1, 1,
0.0016688, -1.916398, 1.691471, 0, 0, 1, 1, 1,
0.003018667, 0.186506, 1.072657, 1, 0, 0, 1, 1,
0.004158844, 0.9512379, -0.3227745, 1, 0, 0, 1, 1,
0.01338181, 0.6336154, -0.3849316, 1, 0, 0, 1, 1,
0.01521862, 0.6061938, 0.8701296, 1, 0, 0, 1, 1,
0.01585324, -1.409252, 4.247542, 1, 0, 0, 1, 1,
0.02013821, -1.210291, 2.301541, 0, 0, 0, 1, 1,
0.02540435, 0.3376791, -0.2351865, 0, 0, 0, 1, 1,
0.02545282, 0.9624509, -1.689317, 0, 0, 0, 1, 1,
0.02590324, 0.9706219, 0.05760533, 0, 0, 0, 1, 1,
0.02676382, -0.286636, 3.013891, 0, 0, 0, 1, 1,
0.02751318, -0.817353, 3.813393, 0, 0, 0, 1, 1,
0.03092922, 0.292643, 0.8825949, 0, 0, 0, 1, 1,
0.03372965, -0.9477462, 3.343751, 1, 1, 1, 1, 1,
0.03655631, -1.399789, 3.73204, 1, 1, 1, 1, 1,
0.04021589, -0.9746303, 1.922602, 1, 1, 1, 1, 1,
0.04237074, 0.02843529, 3.002653, 1, 1, 1, 1, 1,
0.04470981, -1.597632, 3.141711, 1, 1, 1, 1, 1,
0.05196994, -1.183858, 4.279845, 1, 1, 1, 1, 1,
0.05412808, -0.5983378, 2.338741, 1, 1, 1, 1, 1,
0.05634723, -0.4572971, 1.243888, 1, 1, 1, 1, 1,
0.05923155, -0.04094466, 4.052938, 1, 1, 1, 1, 1,
0.06120667, 1.765211, 0.8053637, 1, 1, 1, 1, 1,
0.06123718, -0.4916896, 2.221166, 1, 1, 1, 1, 1,
0.06264219, 0.2106929, -0.7186173, 1, 1, 1, 1, 1,
0.06491897, -0.2488833, 4.790294, 1, 1, 1, 1, 1,
0.06569092, 0.7617502, -1.282509, 1, 1, 1, 1, 1,
0.06659187, -0.07123378, 1.285139, 1, 1, 1, 1, 1,
0.06849207, 1.178252, -0.005418031, 0, 0, 1, 1, 1,
0.06890026, -1.195219, 3.275139, 1, 0, 0, 1, 1,
0.07004663, 0.4179978, -1.429727, 1, 0, 0, 1, 1,
0.07223868, 0.2048433, -0.5179525, 1, 0, 0, 1, 1,
0.07464969, -1.524325, 4.082864, 1, 0, 0, 1, 1,
0.07906004, -0.544067, 2.326931, 1, 0, 0, 1, 1,
0.08066746, -1.686368, 2.49677, 0, 0, 0, 1, 1,
0.08231766, -1.223142, 5.333673, 0, 0, 0, 1, 1,
0.08257645, 1.795778, -0.4037595, 0, 0, 0, 1, 1,
0.08549406, -1.154841, 4.872502, 0, 0, 0, 1, 1,
0.08802603, -0.1354865, 3.100854, 0, 0, 0, 1, 1,
0.0884294, -0.5370213, 4.06833, 0, 0, 0, 1, 1,
0.08892684, 1.265895, 2.292337, 0, 0, 0, 1, 1,
0.09069775, 0.1605747, -0.09954737, 1, 1, 1, 1, 1,
0.09821, 0.7661105, 0.1437734, 1, 1, 1, 1, 1,
0.1022904, 1.452609, -0.3951649, 1, 1, 1, 1, 1,
0.1033727, -0.1235043, 2.396567, 1, 1, 1, 1, 1,
0.1071164, 1.667972, 1.984103, 1, 1, 1, 1, 1,
0.1073997, -0.6348889, 1.034337, 1, 1, 1, 1, 1,
0.111347, -0.7205096, 1.958673, 1, 1, 1, 1, 1,
0.1115843, -1.624473, 3.530655, 1, 1, 1, 1, 1,
0.1178799, -0.1195204, 1.472945, 1, 1, 1, 1, 1,
0.1194712, -1.064876, 4.392074, 1, 1, 1, 1, 1,
0.1203285, 0.344339, 0.583091, 1, 1, 1, 1, 1,
0.1227685, -0.07938404, 1.733466, 1, 1, 1, 1, 1,
0.1349736, 0.2602698, 1.043323, 1, 1, 1, 1, 1,
0.1402236, -1.249666, 4.402005, 1, 1, 1, 1, 1,
0.1403721, 0.1129267, 0.9911818, 1, 1, 1, 1, 1,
0.1413448, 0.2163533, -0.2476438, 0, 0, 1, 1, 1,
0.1416976, -1.270521, 5.677081, 1, 0, 0, 1, 1,
0.1434463, -0.1184916, 2.219891, 1, 0, 0, 1, 1,
0.1443876, 0.7255726, 0.4385787, 1, 0, 0, 1, 1,
0.1445197, -0.3338865, 3.751048, 1, 0, 0, 1, 1,
0.1445759, 0.3066382, -0.7405316, 1, 0, 0, 1, 1,
0.1458599, -1.112831, 3.979877, 0, 0, 0, 1, 1,
0.1582255, 0.8856167, 0.9121395, 0, 0, 0, 1, 1,
0.1583993, -0.5037276, 3.007835, 0, 0, 0, 1, 1,
0.160469, 0.2405732, 3.570612, 0, 0, 0, 1, 1,
0.1633945, 0.07245108, 0.8412831, 0, 0, 0, 1, 1,
0.1813457, -0.2645537, 1.902517, 0, 0, 0, 1, 1,
0.1818957, -0.1116887, 2.340604, 0, 0, 0, 1, 1,
0.1824195, 0.007473402, 0.2286565, 1, 1, 1, 1, 1,
0.1834752, 0.5202077, 0.09240945, 1, 1, 1, 1, 1,
0.1846888, 2.450923, 1.180223, 1, 1, 1, 1, 1,
0.1853657, 0.7468017, -1.368691, 1, 1, 1, 1, 1,
0.1874387, -0.8212306, 2.946638, 1, 1, 1, 1, 1,
0.1931179, -0.07255847, 2.688227, 1, 1, 1, 1, 1,
0.2000152, -1.431905, 3.801615, 1, 1, 1, 1, 1,
0.2046933, 0.241584, -0.09510927, 1, 1, 1, 1, 1,
0.2049024, 0.7468545, -0.2997848, 1, 1, 1, 1, 1,
0.2098094, -0.3815735, 4.082537, 1, 1, 1, 1, 1,
0.2104886, -0.6951835, 2.108527, 1, 1, 1, 1, 1,
0.2166106, 0.8174874, -0.9977549, 1, 1, 1, 1, 1,
0.2181715, -0.5546871, 4.483476, 1, 1, 1, 1, 1,
0.2188534, -0.3693759, 2.989442, 1, 1, 1, 1, 1,
0.2222406, 0.3115561, -0.8580648, 1, 1, 1, 1, 1,
0.2270128, 1.186885, -2.154083, 0, 0, 1, 1, 1,
0.2299767, 0.6283653, -0.988317, 1, 0, 0, 1, 1,
0.2315266, -0.221027, 1.920053, 1, 0, 0, 1, 1,
0.2424869, -0.6345282, 3.14383, 1, 0, 0, 1, 1,
0.2463979, 1.384944, -1.40448, 1, 0, 0, 1, 1,
0.2493736, -1.808422, 2.268065, 1, 0, 0, 1, 1,
0.2523737, -1.647739, 4.758636, 0, 0, 0, 1, 1,
0.2529964, 0.8959775, 1.158021, 0, 0, 0, 1, 1,
0.2556155, 1.283939, 0.1273697, 0, 0, 0, 1, 1,
0.2565974, -0.629706, 3.3783, 0, 0, 0, 1, 1,
0.2618628, -1.961516, 1.965139, 0, 0, 0, 1, 1,
0.2637511, 0.6186802, 1.602707, 0, 0, 0, 1, 1,
0.2645465, -0.6520132, 3.369891, 0, 0, 0, 1, 1,
0.2680849, 1.229196, 0.4351511, 1, 1, 1, 1, 1,
0.2703564, 0.6938045, 1.614543, 1, 1, 1, 1, 1,
0.2757545, -0.9643599, 3.826729, 1, 1, 1, 1, 1,
0.278289, 0.8887391, 1.41022, 1, 1, 1, 1, 1,
0.2817258, -0.338069, 3.537706, 1, 1, 1, 1, 1,
0.2843358, 1.651271, -1.535854, 1, 1, 1, 1, 1,
0.286447, -0.03681874, 2.951949, 1, 1, 1, 1, 1,
0.2871224, 0.6312245, 0.1833338, 1, 1, 1, 1, 1,
0.2939866, 0.4037977, 0.7892777, 1, 1, 1, 1, 1,
0.2954648, -0.09058166, 1.077262, 1, 1, 1, 1, 1,
0.2963523, -0.7129301, 3.576398, 1, 1, 1, 1, 1,
0.2974412, -0.9973176, 2.854131, 1, 1, 1, 1, 1,
0.2997481, -0.7162516, 2.367912, 1, 1, 1, 1, 1,
0.3053083, -0.2421619, 1.902496, 1, 1, 1, 1, 1,
0.3060153, 0.4139483, 0.1999737, 1, 1, 1, 1, 1,
0.3077739, -0.5807362, 2.957784, 0, 0, 1, 1, 1,
0.3086441, 0.9577426, -0.04978132, 1, 0, 0, 1, 1,
0.3093781, 0.2554388, 0.04400372, 1, 0, 0, 1, 1,
0.3106476, -0.2898411, 4.059869, 1, 0, 0, 1, 1,
0.3112833, 0.8280975, -0.1870637, 1, 0, 0, 1, 1,
0.3115105, 1.38046, 0.4016699, 1, 0, 0, 1, 1,
0.3165407, -0.327762, 2.504501, 0, 0, 0, 1, 1,
0.3226658, -0.2460631, 1.220985, 0, 0, 0, 1, 1,
0.3228097, 0.01263363, 0.6283513, 0, 0, 0, 1, 1,
0.3242653, -0.8156329, 2.421879, 0, 0, 0, 1, 1,
0.3255624, 0.08660348, 0.8359324, 0, 0, 0, 1, 1,
0.3332962, 0.5097024, -0.3426312, 0, 0, 0, 1, 1,
0.3349185, 1.633564, 0.3090586, 0, 0, 0, 1, 1,
0.3390436, 0.428518, 1.561348, 1, 1, 1, 1, 1,
0.3404605, 0.01254356, 0.7870329, 1, 1, 1, 1, 1,
0.3420711, -2.224856, 2.982865, 1, 1, 1, 1, 1,
0.344429, -0.8901837, 2.057787, 1, 1, 1, 1, 1,
0.3478367, 0.09238098, 1.791587, 1, 1, 1, 1, 1,
0.3500038, -0.06480523, 3.143831, 1, 1, 1, 1, 1,
0.3515538, -0.2194366, 1.840746, 1, 1, 1, 1, 1,
0.3523126, -1.6269, 4.418215, 1, 1, 1, 1, 1,
0.3531395, 0.08086716, 2.589844, 1, 1, 1, 1, 1,
0.3558778, 0.862854, -0.8668031, 1, 1, 1, 1, 1,
0.3565515, 0.5923928, -0.07045484, 1, 1, 1, 1, 1,
0.3636409, -2.354147, 3.532815, 1, 1, 1, 1, 1,
0.3687457, 0.5247408, 1.850291, 1, 1, 1, 1, 1,
0.3688667, 0.1006646, 2.022171, 1, 1, 1, 1, 1,
0.3697526, -1.837994, 2.632152, 1, 1, 1, 1, 1,
0.3740332, -0.7831606, 1.8663, 0, 0, 1, 1, 1,
0.3767124, 0.03736552, 0.5212846, 1, 0, 0, 1, 1,
0.37682, 1.109741, 0.7057236, 1, 0, 0, 1, 1,
0.3789466, -0.1045287, 3.044541, 1, 0, 0, 1, 1,
0.3859697, 1.011184, 1.22555, 1, 0, 0, 1, 1,
0.3867977, -0.6857968, 1.245803, 1, 0, 0, 1, 1,
0.3924291, 0.9069408, -0.8985903, 0, 0, 0, 1, 1,
0.3986636, -1.665671, 2.955434, 0, 0, 0, 1, 1,
0.4101954, -0.7946704, 3.559738, 0, 0, 0, 1, 1,
0.4156301, -0.8962798, 3.058665, 0, 0, 0, 1, 1,
0.4171261, 1.606187, 0.8286698, 0, 0, 0, 1, 1,
0.4208348, 2.45886, -0.395166, 0, 0, 0, 1, 1,
0.4228351, -0.5591675, 2.204708, 0, 0, 0, 1, 1,
0.4233253, 1.564981, 1.877592, 1, 1, 1, 1, 1,
0.4251449, 1.281309, -0.4499059, 1, 1, 1, 1, 1,
0.4255489, -1.257584, 4.994627, 1, 1, 1, 1, 1,
0.4324071, 0.2221922, -1.390856, 1, 1, 1, 1, 1,
0.4387675, -0.156239, 1.652104, 1, 1, 1, 1, 1,
0.4392741, -0.9084241, 3.079035, 1, 1, 1, 1, 1,
0.4405215, 1.229131, -0.1790671, 1, 1, 1, 1, 1,
0.4417984, -0.8214926, 2.007977, 1, 1, 1, 1, 1,
0.448133, -1.395818, 3.018902, 1, 1, 1, 1, 1,
0.4493307, -2.042105, 3.656552, 1, 1, 1, 1, 1,
0.4520462, -0.541198, 2.915116, 1, 1, 1, 1, 1,
0.4540237, -0.9915242, 2.786865, 1, 1, 1, 1, 1,
0.45415, -0.2470025, -0.4258088, 1, 1, 1, 1, 1,
0.4571725, 0.5700328, 1.435031, 1, 1, 1, 1, 1,
0.4575149, -1.353153, 4.234512, 1, 1, 1, 1, 1,
0.4586448, -0.6320612, 2.880208, 0, 0, 1, 1, 1,
0.4652203, -0.8290061, 2.000448, 1, 0, 0, 1, 1,
0.4676873, 0.4299925, 0.9339095, 1, 0, 0, 1, 1,
0.4726916, -2.069098, 3.025377, 1, 0, 0, 1, 1,
0.4735727, 1.222812, -0.7882041, 1, 0, 0, 1, 1,
0.474961, 1.368195, -1.11735, 1, 0, 0, 1, 1,
0.4788838, 0.8542902, 2.661719, 0, 0, 0, 1, 1,
0.4822859, -0.3729148, 3.203437, 0, 0, 0, 1, 1,
0.4840681, -0.9975455, 2.538096, 0, 0, 0, 1, 1,
0.4856057, -1.747269, 2.893142, 0, 0, 0, 1, 1,
0.48834, 1.03892, 0.3362548, 0, 0, 0, 1, 1,
0.4898657, -0.3603548, 2.03588, 0, 0, 0, 1, 1,
0.4915705, -1.897449, 2.283366, 0, 0, 0, 1, 1,
0.5045471, -0.4051171, 2.890505, 1, 1, 1, 1, 1,
0.5055922, -1.061702, 4.093734, 1, 1, 1, 1, 1,
0.5066126, 0.09370855, 2.031205, 1, 1, 1, 1, 1,
0.5083044, 1.36674, -1.447021, 1, 1, 1, 1, 1,
0.5097715, -0.1382417, -0.286939, 1, 1, 1, 1, 1,
0.5109319, -1.260739, 3.473073, 1, 1, 1, 1, 1,
0.5156866, -0.1731587, -0.4028147, 1, 1, 1, 1, 1,
0.5159969, -3.291277, 2.03591, 1, 1, 1, 1, 1,
0.5175292, 1.449084, 0.4304447, 1, 1, 1, 1, 1,
0.525115, -1.665944, 2.058476, 1, 1, 1, 1, 1,
0.528534, 0.422392, 3.009806, 1, 1, 1, 1, 1,
0.5294451, 0.5407742, -0.5521806, 1, 1, 1, 1, 1,
0.5306018, -0.5546148, 3.408023, 1, 1, 1, 1, 1,
0.5329089, -0.3755609, 2.138499, 1, 1, 1, 1, 1,
0.5347962, 0.1925212, 0.2375359, 1, 1, 1, 1, 1,
0.536351, 0.3530611, 0.6971641, 0, 0, 1, 1, 1,
0.5409159, -1.55018, 3.308234, 1, 0, 0, 1, 1,
0.542303, 0.3531795, 0.07300614, 1, 0, 0, 1, 1,
0.5439836, 0.8110176, -1.522007, 1, 0, 0, 1, 1,
0.5457831, 0.3310793, 1.07286, 1, 0, 0, 1, 1,
0.5459427, 0.04086465, -0.009709758, 1, 0, 0, 1, 1,
0.5479231, 0.3675545, 2.155185, 0, 0, 0, 1, 1,
0.5497283, 4.284874, -2.087055, 0, 0, 0, 1, 1,
0.5508342, 0.2087095, 0.9875854, 0, 0, 0, 1, 1,
0.5562987, 0.07278283, 3.055317, 0, 0, 0, 1, 1,
0.557261, 0.8465198, 1.971204, 0, 0, 0, 1, 1,
0.5593745, -1.244812, 2.376429, 0, 0, 0, 1, 1,
0.5641054, 0.1534937, -0.8198884, 0, 0, 0, 1, 1,
0.5727938, -0.5740619, 3.108633, 1, 1, 1, 1, 1,
0.5785536, -0.06868203, 1.823346, 1, 1, 1, 1, 1,
0.5887011, -0.722581, 2.136165, 1, 1, 1, 1, 1,
0.5896147, -0.9668406, 2.453257, 1, 1, 1, 1, 1,
0.5946453, 1.760614, -1.609552, 1, 1, 1, 1, 1,
0.5958374, -0.4125848, 2.353162, 1, 1, 1, 1, 1,
0.6025641, 1.826135, 2.052107, 1, 1, 1, 1, 1,
0.6064013, 0.1979145, 0.9998885, 1, 1, 1, 1, 1,
0.6117819, 2.177999, -0.09941747, 1, 1, 1, 1, 1,
0.6125568, -0.6451484, 1.115706, 1, 1, 1, 1, 1,
0.6188471, 0.3272835, 1.335046, 1, 1, 1, 1, 1,
0.6224762, 0.7601172, 0.676981, 1, 1, 1, 1, 1,
0.6231735, -1.165792, 3.718201, 1, 1, 1, 1, 1,
0.6235675, 1.213213, -0.6819796, 1, 1, 1, 1, 1,
0.6236128, -0.84559, 1.606224, 1, 1, 1, 1, 1,
0.6296031, 0.4773828, 1.051195, 0, 0, 1, 1, 1,
0.63081, 0.5757317, 2.021205, 1, 0, 0, 1, 1,
0.6310405, -0.01636111, 0.8869539, 1, 0, 0, 1, 1,
0.6313124, -1.560905, 2.050784, 1, 0, 0, 1, 1,
0.6315119, 0.5121705, 0.04255728, 1, 0, 0, 1, 1,
0.6330433, 1.548979, -0.2708423, 1, 0, 0, 1, 1,
0.639353, -1.698252, 1.277652, 0, 0, 0, 1, 1,
0.6436321, -0.8838654, 1.712515, 0, 0, 0, 1, 1,
0.6439737, -1.437561, 1.852117, 0, 0, 0, 1, 1,
0.6442643, 2.111044, 0.8891436, 0, 0, 0, 1, 1,
0.6445656, -0.2108663, 1.163543, 0, 0, 0, 1, 1,
0.6481405, 0.6431698, 0.754372, 0, 0, 0, 1, 1,
0.6489696, 0.1696423, 0.5114543, 0, 0, 0, 1, 1,
0.6492848, 0.01029042, 0.7678391, 1, 1, 1, 1, 1,
0.6500688, 0.3439594, 0.9680452, 1, 1, 1, 1, 1,
0.6520702, -0.9416652, 2.115146, 1, 1, 1, 1, 1,
0.6535766, 0.8335667, 1.310571, 1, 1, 1, 1, 1,
0.6566572, -0.7325661, 2.676921, 1, 1, 1, 1, 1,
0.6567533, -0.2023143, 0.2790546, 1, 1, 1, 1, 1,
0.6571353, 1.447965, 2.067737, 1, 1, 1, 1, 1,
0.6619919, -0.05733344, 1.2756, 1, 1, 1, 1, 1,
0.6648982, 0.8813012, -0.04005722, 1, 1, 1, 1, 1,
0.670987, 0.06843375, 1.050549, 1, 1, 1, 1, 1,
0.6726342, 0.5076602, 0.8248172, 1, 1, 1, 1, 1,
0.6732733, 0.01969274, 2.582812, 1, 1, 1, 1, 1,
0.6736122, 0.4511024, 0.2366104, 1, 1, 1, 1, 1,
0.6771773, -1.589784, 2.539746, 1, 1, 1, 1, 1,
0.6792694, 0.06770971, 0.9104598, 1, 1, 1, 1, 1,
0.6820508, -1.684705, 2.766569, 0, 0, 1, 1, 1,
0.6835057, -0.9326931, 2.435938, 1, 0, 0, 1, 1,
0.6835603, -1.475281, 3.272894, 1, 0, 0, 1, 1,
0.6877052, 0.4806339, 0.4310563, 1, 0, 0, 1, 1,
0.69098, -1.313188, 1.318464, 1, 0, 0, 1, 1,
0.6955621, -0.4086679, 2.425135, 1, 0, 0, 1, 1,
0.6971582, 0.9271957, -1.535016, 0, 0, 0, 1, 1,
0.7038132, -0.317178, 2.294194, 0, 0, 0, 1, 1,
0.7041262, 2.264241, -0.5285702, 0, 0, 0, 1, 1,
0.7122186, -1.770853, 3.001649, 0, 0, 0, 1, 1,
0.7156584, -0.5221418, 1.188352, 0, 0, 0, 1, 1,
0.7187083, 1.678843, 1.516927, 0, 0, 0, 1, 1,
0.7192013, 0.1291467, 2.553905, 0, 0, 0, 1, 1,
0.7192621, 0.6044845, 0.01025005, 1, 1, 1, 1, 1,
0.7196827, 0.5110518, 0.9916461, 1, 1, 1, 1, 1,
0.7273717, 0.8417697, 1.387763, 1, 1, 1, 1, 1,
0.7319397, -0.08938665, 0.6619836, 1, 1, 1, 1, 1,
0.7331252, 1.232361, 0.01434679, 1, 1, 1, 1, 1,
0.7342171, -0.8846444, 0.9646116, 1, 1, 1, 1, 1,
0.734503, 0.07822781, 1.235422, 1, 1, 1, 1, 1,
0.7371488, -0.3875369, 3.832861, 1, 1, 1, 1, 1,
0.7404692, -0.5820351, 1.055723, 1, 1, 1, 1, 1,
0.7412738, -0.5509765, 2.207859, 1, 1, 1, 1, 1,
0.7416847, -0.4163191, 3.226414, 1, 1, 1, 1, 1,
0.7437915, -0.05656815, 0.8321159, 1, 1, 1, 1, 1,
0.7454003, 0.18414, 1.088804, 1, 1, 1, 1, 1,
0.7512989, -0.06000785, 1.879803, 1, 1, 1, 1, 1,
0.7527525, 0.4288155, 1.135904, 1, 1, 1, 1, 1,
0.752947, 0.01786429, 2.015818, 0, 0, 1, 1, 1,
0.7556088, 0.03924209, 0.397453, 1, 0, 0, 1, 1,
0.7558748, 1.302352, -0.9170668, 1, 0, 0, 1, 1,
0.75744, 1.27515, 2.846709, 1, 0, 0, 1, 1,
0.7604694, -0.372738, 3.048945, 1, 0, 0, 1, 1,
0.7629218, -0.9115827, 3.653782, 1, 0, 0, 1, 1,
0.7641383, 0.2871565, 2.536522, 0, 0, 0, 1, 1,
0.7720862, 0.3946339, 3.02108, 0, 0, 0, 1, 1,
0.7726253, -0.7894957, 3.601965, 0, 0, 0, 1, 1,
0.7730862, -0.1346271, 2.033772, 0, 0, 0, 1, 1,
0.7845518, -2.472259, 2.576321, 0, 0, 0, 1, 1,
0.7895986, 0.9558457, 0.09787547, 0, 0, 0, 1, 1,
0.7909204, 0.9596223, 1.002711, 0, 0, 0, 1, 1,
0.7961051, -0.04261593, 1.113852, 1, 1, 1, 1, 1,
0.7981272, 0.8185354, 2.107975, 1, 1, 1, 1, 1,
0.7985975, 1.672118, 0.1522066, 1, 1, 1, 1, 1,
0.8000591, 0.7102008, 0.6008067, 1, 1, 1, 1, 1,
0.8082284, -0.2319128, 2.790179, 1, 1, 1, 1, 1,
0.8091311, 1.320887, -1.213145, 1, 1, 1, 1, 1,
0.8137034, -0.3828001, 1.745316, 1, 1, 1, 1, 1,
0.8190412, -1.045689, 1.463332, 1, 1, 1, 1, 1,
0.8233627, -1.520627, 3.573589, 1, 1, 1, 1, 1,
0.8240154, -0.2817931, 1.939261, 1, 1, 1, 1, 1,
0.8383877, 0.5029779, 1.830758, 1, 1, 1, 1, 1,
0.8394972, 0.3981982, 1.195598, 1, 1, 1, 1, 1,
0.8417761, 1.847822, 0.3799004, 1, 1, 1, 1, 1,
0.8443786, 0.514681, 1.866279, 1, 1, 1, 1, 1,
0.8474037, -0.840022, 2.313495, 1, 1, 1, 1, 1,
0.8486701, -0.6004514, 2.53969, 0, 0, 1, 1, 1,
0.8518974, -1.646471, 3.063937, 1, 0, 0, 1, 1,
0.8535088, 1.22863, 1.333158, 1, 0, 0, 1, 1,
0.8583131, 0.9250317, -0.996443, 1, 0, 0, 1, 1,
0.8585993, 0.7736853, 0.8020528, 1, 0, 0, 1, 1,
0.8630925, -0.6490571, 2.77921, 1, 0, 0, 1, 1,
0.8632824, 1.299133, 1.695302, 0, 0, 0, 1, 1,
0.865226, 0.8192628, 1.389106, 0, 0, 0, 1, 1,
0.8683996, 0.5206794, 1.433491, 0, 0, 0, 1, 1,
0.8704645, 2.085364, 1.257787, 0, 0, 0, 1, 1,
0.8821023, -1.454166, 3.45704, 0, 0, 0, 1, 1,
0.8876533, -0.5972804, 2.96647, 0, 0, 0, 1, 1,
0.89327, -0.3315275, 2.030386, 0, 0, 0, 1, 1,
0.8941062, 0.1351795, 2.615199, 1, 1, 1, 1, 1,
0.8970042, -0.009537648, 0.3399011, 1, 1, 1, 1, 1,
0.8980609, -2.810633, 3.897914, 1, 1, 1, 1, 1,
0.9006325, -0.10573, 0.3209911, 1, 1, 1, 1, 1,
0.9006614, -2.065686, 1.554508, 1, 1, 1, 1, 1,
0.9007116, -0.08897888, -0.0004770738, 1, 1, 1, 1, 1,
0.9030609, 0.9933725, 0.8841713, 1, 1, 1, 1, 1,
0.9050736, 1.081768, 0.9891323, 1, 1, 1, 1, 1,
0.9053664, 0.6040722, 2.058525, 1, 1, 1, 1, 1,
0.906405, -0.1412649, 2.030533, 1, 1, 1, 1, 1,
0.908479, 0.9457463, -0.1199968, 1, 1, 1, 1, 1,
0.9155419, -1.208863, 2.050909, 1, 1, 1, 1, 1,
0.9198198, 1.103053, 0.6549619, 1, 1, 1, 1, 1,
0.9205535, 1.58164, 0.8653566, 1, 1, 1, 1, 1,
0.9213033, -0.4800232, 2.075599, 1, 1, 1, 1, 1,
0.9228747, -0.1291734, 0.9842132, 0, 0, 1, 1, 1,
0.9285309, -0.6511427, 3.599218, 1, 0, 0, 1, 1,
0.9316713, 1.066721, -0.1722222, 1, 0, 0, 1, 1,
0.9516354, -1.232497, 2.003955, 1, 0, 0, 1, 1,
0.9534528, -0.3541238, 2.263533, 1, 0, 0, 1, 1,
0.9552934, 1.369628, -0.3561792, 1, 0, 0, 1, 1,
0.9625174, 0.6901777, 1.21626, 0, 0, 0, 1, 1,
0.9694576, -0.1842315, 1.417887, 0, 0, 0, 1, 1,
0.9736167, 0.6189976, 0.7900101, 0, 0, 0, 1, 1,
0.9751337, 0.7516349, 0.709445, 0, 0, 0, 1, 1,
0.9863176, 0.5808555, 1.58567, 0, 0, 0, 1, 1,
0.9903044, 0.3357195, 0.8105929, 0, 0, 0, 1, 1,
0.9916508, -1.187537, 2.526597, 0, 0, 0, 1, 1,
0.999019, -0.3442943, 1.39332, 1, 1, 1, 1, 1,
1.000118, 0.9583216, 1.116097, 1, 1, 1, 1, 1,
1.001109, -1.386419, 1.64354, 1, 1, 1, 1, 1,
1.006315, 1.041168, 0.7141377, 1, 1, 1, 1, 1,
1.00643, 0.8907927, -0.4992265, 1, 1, 1, 1, 1,
1.010172, -0.3283786, 0.540363, 1, 1, 1, 1, 1,
1.013348, 0.7767793, -0.1322481, 1, 1, 1, 1, 1,
1.029374, -0.5024604, 2.117393, 1, 1, 1, 1, 1,
1.033186, -0.9743052, 2.148352, 1, 1, 1, 1, 1,
1.061256, -0.2659421, 2.063339, 1, 1, 1, 1, 1,
1.073138, -0.5158973, 1.246937, 1, 1, 1, 1, 1,
1.076905, 1.399711, -1.474408, 1, 1, 1, 1, 1,
1.08322, -1.213136, 3.334487, 1, 1, 1, 1, 1,
1.092925, 1.070844, 1.603395, 1, 1, 1, 1, 1,
1.094841, 0.4276746, 0.4924962, 1, 1, 1, 1, 1,
1.095127, 2.053206, 0.1048826, 0, 0, 1, 1, 1,
1.096037, 1.68445, -0.8082289, 1, 0, 0, 1, 1,
1.098389, -1.064742, 5.798213, 1, 0, 0, 1, 1,
1.098468, 0.4479064, 0.4996034, 1, 0, 0, 1, 1,
1.101659, 0.5561768, 1.109905, 1, 0, 0, 1, 1,
1.110648, 0.7517912, 1.822051, 1, 0, 0, 1, 1,
1.118871, 0.2175527, 0.09500626, 0, 0, 0, 1, 1,
1.126825, -0.8791634, 2.68, 0, 0, 0, 1, 1,
1.13973, 0.5698142, 0.4531116, 0, 0, 0, 1, 1,
1.145522, -0.717408, 1.853199, 0, 0, 0, 1, 1,
1.15084, -0.5868344, 2.381365, 0, 0, 0, 1, 1,
1.153297, -0.618809, 3.823732, 0, 0, 0, 1, 1,
1.153975, -0.0442109, 0.6062554, 0, 0, 0, 1, 1,
1.158417, 2.492159, 0.2155902, 1, 1, 1, 1, 1,
1.162741, -1.163001, 2.908685, 1, 1, 1, 1, 1,
1.163496, 0.2262528, 0.8035912, 1, 1, 1, 1, 1,
1.173346, -0.3651781, 1.622582, 1, 1, 1, 1, 1,
1.182012, 0.6235156, 0.7654201, 1, 1, 1, 1, 1,
1.193045, -0.7444916, 2.413966, 1, 1, 1, 1, 1,
1.197976, -0.1593061, 2.258886, 1, 1, 1, 1, 1,
1.199166, 0.979966, 1.46374, 1, 1, 1, 1, 1,
1.201391, -0.02296679, 0.5707624, 1, 1, 1, 1, 1,
1.205647, 0.5457473, 0.6176578, 1, 1, 1, 1, 1,
1.20875, -0.8551648, 2.377571, 1, 1, 1, 1, 1,
1.21374, -1.095999, 4.045074, 1, 1, 1, 1, 1,
1.220703, 0.7551317, 0.01895701, 1, 1, 1, 1, 1,
1.225614, 1.629867, 0.9719165, 1, 1, 1, 1, 1,
1.237178, 0.9034208, 1.247181, 1, 1, 1, 1, 1,
1.244745, 1.245473, 2.249169, 0, 0, 1, 1, 1,
1.265273, -0.3507906, 3.145246, 1, 0, 0, 1, 1,
1.267495, 1.319179, 1.375356, 1, 0, 0, 1, 1,
1.283842, 1.72605, 3.47506, 1, 0, 0, 1, 1,
1.292981, 1.231595, -0.3586766, 1, 0, 0, 1, 1,
1.301303, 0.6673279, 0.665227, 1, 0, 0, 1, 1,
1.303811, -0.1017388, 1.036579, 0, 0, 0, 1, 1,
1.304639, 0.7781812, 1.482993, 0, 0, 0, 1, 1,
1.307233, 1.833507, 0.05061609, 0, 0, 0, 1, 1,
1.311642, 0.3045379, 0.5459557, 0, 0, 0, 1, 1,
1.32216, -0.6027007, 2.295054, 0, 0, 0, 1, 1,
1.330346, -0.716059, 1.823608, 0, 0, 0, 1, 1,
1.330684, -0.01624417, 3.549128, 0, 0, 0, 1, 1,
1.335057, 0.4087324, 2.725733, 1, 1, 1, 1, 1,
1.349118, 0.9556678, 0.3607184, 1, 1, 1, 1, 1,
1.349351, -1.646233, 3.315488, 1, 1, 1, 1, 1,
1.35122, 0.8193986, 1.479696, 1, 1, 1, 1, 1,
1.361285, -0.3154309, 1.497622, 1, 1, 1, 1, 1,
1.364642, 0.6525925, 0.9677552, 1, 1, 1, 1, 1,
1.367203, 0.5797441, 0.786595, 1, 1, 1, 1, 1,
1.368968, -1.398673, 0.2005622, 1, 1, 1, 1, 1,
1.374432, -0.608465, 0.2833051, 1, 1, 1, 1, 1,
1.381366, 0.4613883, 4.087835, 1, 1, 1, 1, 1,
1.389611, 0.2901905, 2.096006, 1, 1, 1, 1, 1,
1.390096, 0.2514154, 1.032654, 1, 1, 1, 1, 1,
1.396605, -0.3655004, 1.31884, 1, 1, 1, 1, 1,
1.416717, 1.23786, 0.7070211, 1, 1, 1, 1, 1,
1.417129, 0.4186233, 2.312203, 1, 1, 1, 1, 1,
1.422269, -1.337383, 1.904657, 0, 0, 1, 1, 1,
1.423029, -1.036018, 3.023987, 1, 0, 0, 1, 1,
1.425761, 1.83771, 0.6784838, 1, 0, 0, 1, 1,
1.426861, -0.6938949, 1.819465, 1, 0, 0, 1, 1,
1.430159, -0.6720478, 1.481291, 1, 0, 0, 1, 1,
1.437553, -0.1735535, 2.991216, 1, 0, 0, 1, 1,
1.437932, -1.006371, 2.294081, 0, 0, 0, 1, 1,
1.461007, -0.6048975, 3.303384, 0, 0, 0, 1, 1,
1.467665, -0.2675808, 2.799509, 0, 0, 0, 1, 1,
1.470649, -1.98483, 1.616714, 0, 0, 0, 1, 1,
1.4798, 0.06225192, 0.4630145, 0, 0, 0, 1, 1,
1.487402, -0.3951962, 3.082469, 0, 0, 0, 1, 1,
1.490744, 1.68006, -1.016596, 0, 0, 0, 1, 1,
1.498564, -1.347521, 2.013551, 1, 1, 1, 1, 1,
1.52521, 1.156043, 0.3951365, 1, 1, 1, 1, 1,
1.527703, 0.7242322, 1.201305, 1, 1, 1, 1, 1,
1.552962, 1.751499, 0.4901485, 1, 1, 1, 1, 1,
1.563578, -0.1337122, 3.200777, 1, 1, 1, 1, 1,
1.566228, 0.1703039, 1.380355, 1, 1, 1, 1, 1,
1.56833, -0.8242027, 0.1857109, 1, 1, 1, 1, 1,
1.58017, 0.4375958, 0.9400114, 1, 1, 1, 1, 1,
1.594668, 1.268935, -0.1239247, 1, 1, 1, 1, 1,
1.597587, 0.3769029, 1.085697, 1, 1, 1, 1, 1,
1.609567, 0.04701027, 2.204858, 1, 1, 1, 1, 1,
1.612957, -0.250031, 1.902231, 1, 1, 1, 1, 1,
1.621139, -0.4160702, 1.555011, 1, 1, 1, 1, 1,
1.644955, 1.319108, 1.405136, 1, 1, 1, 1, 1,
1.648983, 1.152974, 1.565992, 1, 1, 1, 1, 1,
1.65038, -0.4446904, 0.9255856, 0, 0, 1, 1, 1,
1.681073, 0.8146918, 1.740355, 1, 0, 0, 1, 1,
1.689672, 0.9052909, 0.856559, 1, 0, 0, 1, 1,
1.692424, 1.917086, 2.629536, 1, 0, 0, 1, 1,
1.698263, -0.7913314, 0.6163225, 1, 0, 0, 1, 1,
1.718248, 0.6173056, 0.9941465, 1, 0, 0, 1, 1,
1.724917, 0.7514479, 0.9368845, 0, 0, 0, 1, 1,
1.726362, 0.9008557, 0.5823849, 0, 0, 0, 1, 1,
1.732813, 0.326714, 2.402463, 0, 0, 0, 1, 1,
1.766791, -1.293184, 1.600261, 0, 0, 0, 1, 1,
1.77912, 1.057609, 0.5309507, 0, 0, 0, 1, 1,
1.822769, -1.038841, 1.974632, 0, 0, 0, 1, 1,
1.826176, 2.010378, 1.485316, 0, 0, 0, 1, 1,
1.829973, 1.126087, 2.290691, 1, 1, 1, 1, 1,
1.838177, -0.3248087, 1.922197, 1, 1, 1, 1, 1,
1.868097, 0.6290786, -1.544558, 1, 1, 1, 1, 1,
1.91566, 1.105273, 1.547647, 1, 1, 1, 1, 1,
1.940167, 1.572764, -0.1444966, 1, 1, 1, 1, 1,
1.952471, 1.349707, 1.318361, 1, 1, 1, 1, 1,
1.978089, 1.566576, 1.76284, 1, 1, 1, 1, 1,
1.99141, -0.00574663, 1.793963, 1, 1, 1, 1, 1,
1.997354, -0.7753431, 2.568733, 1, 1, 1, 1, 1,
2.001729, -1.057245, 2.80398, 1, 1, 1, 1, 1,
2.005263, -0.00747741, 1.805285, 1, 1, 1, 1, 1,
2.014852, -0.8551047, 1.97943, 1, 1, 1, 1, 1,
2.062537, -1.320822, 1.367719, 1, 1, 1, 1, 1,
2.06264, -0.02487073, 1.262963, 1, 1, 1, 1, 1,
2.063691, 0.1287223, 0.7247183, 1, 1, 1, 1, 1,
2.079212, -0.909606, 1.845295, 0, 0, 1, 1, 1,
2.080102, -0.4518448, 0.4061616, 1, 0, 0, 1, 1,
2.104484, -1.143506, 1.673975, 1, 0, 0, 1, 1,
2.124428, -0.4860444, 1.924598, 1, 0, 0, 1, 1,
2.179211, 0.09129005, 1.912012, 1, 0, 0, 1, 1,
2.222967, 1.260772, 0.737489, 1, 0, 0, 1, 1,
2.231022, 0.3369643, 2.049926, 0, 0, 0, 1, 1,
2.255644, -1.424239, 1.755765, 0, 0, 0, 1, 1,
2.263235, 0.5398208, 1.014514, 0, 0, 0, 1, 1,
2.268219, -0.07468432, 3.423757, 0, 0, 0, 1, 1,
2.319542, -0.60382, 1.458241, 0, 0, 0, 1, 1,
2.342, 0.1061838, 1.010358, 0, 0, 0, 1, 1,
2.512259, -0.9406165, 2.028254, 0, 0, 0, 1, 1,
2.552426, -0.5951114, 1.482197, 1, 1, 1, 1, 1,
2.581205, 1.7096, 1.340034, 1, 1, 1, 1, 1,
2.586283, 0.7398732, 2.233328, 1, 1, 1, 1, 1,
2.591924, -0.1370429, 1.238813, 1, 1, 1, 1, 1,
2.635095, -0.4465257, 0.8841616, 1, 1, 1, 1, 1,
2.787387, 0.3511429, 2.11867, 1, 1, 1, 1, 1,
2.93651, 0.4182539, 1.604997, 1, 1, 1, 1, 1
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
var radius = 9.891108;
var distance = 34.7421;
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
mvMatrix.translate( 0.3740239, -0.4967988, -0.5253997 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.7421);
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
