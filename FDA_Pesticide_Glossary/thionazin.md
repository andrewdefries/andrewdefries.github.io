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
-2.79657, -1.169543, -1.726936, 1, 0, 0, 1,
-2.652315, -0.5702456, -2.200423, 1, 0.007843138, 0, 1,
-2.552663, -0.3233978, -1.457468, 1, 0.01176471, 0, 1,
-2.536789, -1.841111, -1.966553, 1, 0.01960784, 0, 1,
-2.390808, -0.0835187, -2.716372, 1, 0.02352941, 0, 1,
-2.362787, -1.443964, -1.99902, 1, 0.03137255, 0, 1,
-2.284352, -0.9345627, -0.9313211, 1, 0.03529412, 0, 1,
-2.25029, -0.6394525, -1.439064, 1, 0.04313726, 0, 1,
-2.174961, 0.2022943, -2.854559, 1, 0.04705882, 0, 1,
-2.16938, 1.10018, 0.2850754, 1, 0.05490196, 0, 1,
-2.149405, -0.2227722, -1.350786, 1, 0.05882353, 0, 1,
-2.112407, -1.881137, -2.38184, 1, 0.06666667, 0, 1,
-2.101998, 0.4492219, -1.754963, 1, 0.07058824, 0, 1,
-2.050275, -0.1629108, -3.019793, 1, 0.07843138, 0, 1,
-2.032928, 3.046197, -0.7685273, 1, 0.08235294, 0, 1,
-2.002626, 1.150652, -0.899286, 1, 0.09019608, 0, 1,
-2.002392, -0.8841656, -1.727619, 1, 0.09411765, 0, 1,
-2.000082, 1.306813, -0.7787457, 1, 0.1019608, 0, 1,
-1.999449, -0.8477852, -1.874978, 1, 0.1098039, 0, 1,
-1.964196, 0.6177366, -2.589195, 1, 0.1137255, 0, 1,
-1.955212, -0.5000386, -2.702848, 1, 0.1215686, 0, 1,
-1.950606, 0.6321142, -1.124115, 1, 0.1254902, 0, 1,
-1.941934, 1.178809, -2.644664, 1, 0.1333333, 0, 1,
-1.934594, 1.501739, -2.303244, 1, 0.1372549, 0, 1,
-1.930728, 0.1180884, -1.536962, 1, 0.145098, 0, 1,
-1.916865, -0.7556708, -3.17982, 1, 0.1490196, 0, 1,
-1.883728, -1.448971, -2.536056, 1, 0.1568628, 0, 1,
-1.877127, 0.1854035, -2.549999, 1, 0.1607843, 0, 1,
-1.864239, 0.5412413, -1.949929, 1, 0.1686275, 0, 1,
-1.849943, 0.1560405, -0.6229511, 1, 0.172549, 0, 1,
-1.84309, -0.8646076, -1.672843, 1, 0.1803922, 0, 1,
-1.833862, 1.385911, -0.5541851, 1, 0.1843137, 0, 1,
-1.832573, -0.4491991, -1.615048, 1, 0.1921569, 0, 1,
-1.816455, 0.895269, -1.102464, 1, 0.1960784, 0, 1,
-1.80441, 1.176797, -2.193984, 1, 0.2039216, 0, 1,
-1.798133, -1.694728, -2.173637, 1, 0.2117647, 0, 1,
-1.797288, -0.2967897, -3.194077, 1, 0.2156863, 0, 1,
-1.794133, -0.2570284, -1.921688, 1, 0.2235294, 0, 1,
-1.782259, 0.217383, -2.447283, 1, 0.227451, 0, 1,
-1.779372, 0.3487651, -2.611692, 1, 0.2352941, 0, 1,
-1.777991, -1.432251, -2.638391, 1, 0.2392157, 0, 1,
-1.757517, 0.2099671, -3.630008, 1, 0.2470588, 0, 1,
-1.750473, -0.5048621, -0.9965315, 1, 0.2509804, 0, 1,
-1.732823, -1.342042, -1.992278, 1, 0.2588235, 0, 1,
-1.728564, -1.544998, -1.827964, 1, 0.2627451, 0, 1,
-1.724666, -0.7172183, -1.122434, 1, 0.2705882, 0, 1,
-1.715533, 0.8221686, -0.9696399, 1, 0.2745098, 0, 1,
-1.691021, -0.5335245, -1.660239, 1, 0.282353, 0, 1,
-1.676504, 0.2053515, -2.423683, 1, 0.2862745, 0, 1,
-1.668564, 0.6348422, -0.2526817, 1, 0.2941177, 0, 1,
-1.651583, -0.2462213, -2.708817, 1, 0.3019608, 0, 1,
-1.649658, -0.8661908, -2.66729, 1, 0.3058824, 0, 1,
-1.630119, 0.7232844, -1.670426, 1, 0.3137255, 0, 1,
-1.620018, 0.09186721, -2.348621, 1, 0.3176471, 0, 1,
-1.612658, 0.470541, -1.863882, 1, 0.3254902, 0, 1,
-1.611139, 0.7940988, -1.272877, 1, 0.3294118, 0, 1,
-1.605807, 0.04732611, 0.1676112, 1, 0.3372549, 0, 1,
-1.604601, 1.838168, 0.5055487, 1, 0.3411765, 0, 1,
-1.588458, -0.4428921, -2.86899, 1, 0.3490196, 0, 1,
-1.570184, 0.2362716, -1.900455, 1, 0.3529412, 0, 1,
-1.563809, 1.031688, -1.444649, 1, 0.3607843, 0, 1,
-1.551929, 1.484209, -2.533304, 1, 0.3647059, 0, 1,
-1.549232, 0.4430586, -1.906924, 1, 0.372549, 0, 1,
-1.547261, -0.8743137, -1.229891, 1, 0.3764706, 0, 1,
-1.546705, 0.4409491, -0.1786401, 1, 0.3843137, 0, 1,
-1.5286, -0.4310704, -0.727156, 1, 0.3882353, 0, 1,
-1.526557, 0.2429151, -1.345053, 1, 0.3960784, 0, 1,
-1.509646, 1.066267, -2.966172, 1, 0.4039216, 0, 1,
-1.500457, -1.958145, -1.034968, 1, 0.4078431, 0, 1,
-1.493808, 0.5673609, 0.1167315, 1, 0.4156863, 0, 1,
-1.492656, 0.4447687, -2.997763, 1, 0.4196078, 0, 1,
-1.485011, -0.07191467, -1.642517, 1, 0.427451, 0, 1,
-1.480404, 0.2338473, -0.5940765, 1, 0.4313726, 0, 1,
-1.473965, -0.6270482, -0.3601257, 1, 0.4392157, 0, 1,
-1.470782, -0.9393615, -1.528284, 1, 0.4431373, 0, 1,
-1.452339, 1.010897, -1.014046, 1, 0.4509804, 0, 1,
-1.443657, 0.1307305, -0.7989109, 1, 0.454902, 0, 1,
-1.443607, 0.1606587, -1.64988, 1, 0.4627451, 0, 1,
-1.436377, 0.138887, -1.786973, 1, 0.4666667, 0, 1,
-1.435776, 0.08863858, -1.096695, 1, 0.4745098, 0, 1,
-1.433269, 1.021144, -2.757681, 1, 0.4784314, 0, 1,
-1.426018, -1.220165, -1.425805, 1, 0.4862745, 0, 1,
-1.41867, -0.6835623, -2.688347, 1, 0.4901961, 0, 1,
-1.414596, 0.5726622, -1.437399, 1, 0.4980392, 0, 1,
-1.412498, 2.126845, 0.5373914, 1, 0.5058824, 0, 1,
-1.41063, 1.282476, -0.8872987, 1, 0.509804, 0, 1,
-1.39501, 0.1479373, -3.264145, 1, 0.5176471, 0, 1,
-1.393946, 0.2688278, -1.447803, 1, 0.5215687, 0, 1,
-1.392151, -0.1590256, -1.549114, 1, 0.5294118, 0, 1,
-1.38328, -0.7252989, -1.691039, 1, 0.5333334, 0, 1,
-1.380377, 0.2536306, -1.688643, 1, 0.5411765, 0, 1,
-1.374526, -0.03654834, -2.138364, 1, 0.5450981, 0, 1,
-1.368493, 0.280545, -0.8448715, 1, 0.5529412, 0, 1,
-1.36841, -0.5060995, -4.383489, 1, 0.5568628, 0, 1,
-1.360576, 0.1258858, -1.239437, 1, 0.5647059, 0, 1,
-1.359773, 0.3453964, -1.205205, 1, 0.5686275, 0, 1,
-1.351332, -0.1739834, -2.878599, 1, 0.5764706, 0, 1,
-1.349317, 0.3515567, -0.03185185, 1, 0.5803922, 0, 1,
-1.348833, 0.1815218, -1.877972, 1, 0.5882353, 0, 1,
-1.34252, -1.082335, -1.963704, 1, 0.5921569, 0, 1,
-1.3415, -0.3129538, -1.556528, 1, 0.6, 0, 1,
-1.337651, 0.1661841, -0.3569063, 1, 0.6078432, 0, 1,
-1.303834, -0.6211907, -3.238635, 1, 0.6117647, 0, 1,
-1.29625, 0.666244, -1.892155, 1, 0.6196079, 0, 1,
-1.29286, -0.4558438, -0.06190452, 1, 0.6235294, 0, 1,
-1.291351, -0.5081459, -2.171449, 1, 0.6313726, 0, 1,
-1.286827, 0.3305055, -1.728339, 1, 0.6352941, 0, 1,
-1.286348, 0.6495671, -1.273281, 1, 0.6431373, 0, 1,
-1.283927, 0.0005705502, -1.835345, 1, 0.6470588, 0, 1,
-1.280499, 0.1340726, -2.847948, 1, 0.654902, 0, 1,
-1.273635, 0.9227806, -1.038694, 1, 0.6588235, 0, 1,
-1.267255, -1.013068, -1.826453, 1, 0.6666667, 0, 1,
-1.257939, 1.575518, -1.755187, 1, 0.6705883, 0, 1,
-1.257205, 1.467436, -0.907649, 1, 0.6784314, 0, 1,
-1.256454, -0.03606344, -1.9211, 1, 0.682353, 0, 1,
-1.2451, -1.108, -1.86145, 1, 0.6901961, 0, 1,
-1.242162, 0.7376505, -2.149189, 1, 0.6941177, 0, 1,
-1.224461, -1.106749, -3.177823, 1, 0.7019608, 0, 1,
-1.222806, -0.6138939, -1.643395, 1, 0.7098039, 0, 1,
-1.217501, 0.5165143, -1.820389, 1, 0.7137255, 0, 1,
-1.210897, -1.057192, -1.369686, 1, 0.7215686, 0, 1,
-1.204805, -0.7870286, -2.062632, 1, 0.7254902, 0, 1,
-1.203362, -0.3789375, -1.421294, 1, 0.7333333, 0, 1,
-1.181529, 0.6065713, -2.366428, 1, 0.7372549, 0, 1,
-1.176959, -0.2028003, -2.367857, 1, 0.7450981, 0, 1,
-1.1754, 0.01025845, -1.77851, 1, 0.7490196, 0, 1,
-1.173632, -1.276778, -2.777054, 1, 0.7568628, 0, 1,
-1.162585, -0.2586618, -3.142078, 1, 0.7607843, 0, 1,
-1.157369, -0.03532192, -1.048973, 1, 0.7686275, 0, 1,
-1.147929, -1.773279, -2.962059, 1, 0.772549, 0, 1,
-1.144415, 0.06724066, -1.069727, 1, 0.7803922, 0, 1,
-1.14002, -1.057306, 0.7898076, 1, 0.7843137, 0, 1,
-1.137933, -0.7499045, -2.804468, 1, 0.7921569, 0, 1,
-1.134105, -0.3337616, -1.583478, 1, 0.7960784, 0, 1,
-1.11677, 0.08129566, -0.2779854, 1, 0.8039216, 0, 1,
-1.114498, -1.709298, -0.4184536, 1, 0.8117647, 0, 1,
-1.113408, -0.971068, -2.55903, 1, 0.8156863, 0, 1,
-1.110627, -0.2053976, -3.270742, 1, 0.8235294, 0, 1,
-1.104571, -0.5693976, -0.4895804, 1, 0.827451, 0, 1,
-1.094873, 0.4466015, -0.514156, 1, 0.8352941, 0, 1,
-1.091056, 0.244316, -1.983106, 1, 0.8392157, 0, 1,
-1.084698, -0.4946931, -0.8112772, 1, 0.8470588, 0, 1,
-1.083184, -0.7191527, -1.620264, 1, 0.8509804, 0, 1,
-1.082736, -0.7022926, -1.526336, 1, 0.8588235, 0, 1,
-1.078187, 1.307514, 1.035928, 1, 0.8627451, 0, 1,
-1.072364, 0.7401633, -0.002950917, 1, 0.8705882, 0, 1,
-1.072146, -2.927476, -4.546564, 1, 0.8745098, 0, 1,
-1.071333, 0.7115119, 0.1044073, 1, 0.8823529, 0, 1,
-1.065434, -2.32059, -2.179129, 1, 0.8862745, 0, 1,
-1.064356, -1.891937, -2.736383, 1, 0.8941177, 0, 1,
-1.056381, -0.04348573, -3.223672, 1, 0.8980392, 0, 1,
-1.051853, -0.5123583, -1.097305, 1, 0.9058824, 0, 1,
-1.051593, -0.1017329, -2.389999, 1, 0.9137255, 0, 1,
-1.043376, -0.7591608, -1.880162, 1, 0.9176471, 0, 1,
-1.034363, 1.056375, -0.650866, 1, 0.9254902, 0, 1,
-1.029931, 0.8943284, -0.3744604, 1, 0.9294118, 0, 1,
-1.022416, 1.445104, 1.119617, 1, 0.9372549, 0, 1,
-1.021736, -0.6301538, -1.353109, 1, 0.9411765, 0, 1,
-1.020042, -0.6839581, -0.9996766, 1, 0.9490196, 0, 1,
-1.015055, -0.1655973, -1.839045, 1, 0.9529412, 0, 1,
-1.015023, 0.07353199, -1.973433, 1, 0.9607843, 0, 1,
-1.014861, 1.115679, -0.4922879, 1, 0.9647059, 0, 1,
-1.000803, 0.2256025, 0.254006, 1, 0.972549, 0, 1,
-0.9945602, -0.1412158, -2.081266, 1, 0.9764706, 0, 1,
-0.9921947, 0.7202694, -1.570025, 1, 0.9843137, 0, 1,
-0.9890602, -1.611159, -1.310696, 1, 0.9882353, 0, 1,
-0.9838036, -1.31335, -2.917014, 1, 0.9960784, 0, 1,
-0.98195, -0.4481891, -2.605958, 0.9960784, 1, 0, 1,
-0.980823, -1.03845, -3.128802, 0.9921569, 1, 0, 1,
-0.9776716, -0.379932, -2.831452, 0.9843137, 1, 0, 1,
-0.9719116, 2.740781, 0.1712713, 0.9803922, 1, 0, 1,
-0.9673051, 0.3820044, -1.651355, 0.972549, 1, 0, 1,
-0.9665587, 0.3454427, -0.4523151, 0.9686275, 1, 0, 1,
-0.9663417, 0.9303526, -0.809448, 0.9607843, 1, 0, 1,
-0.9639379, 1.536764, -1.026613, 0.9568627, 1, 0, 1,
-0.9638367, -0.8656757, -1.46515, 0.9490196, 1, 0, 1,
-0.9618096, -0.949949, -3.374515, 0.945098, 1, 0, 1,
-0.955055, -1.079913, -1.883697, 0.9372549, 1, 0, 1,
-0.9535862, -0.1298463, 0.1164491, 0.9333333, 1, 0, 1,
-0.9471983, 0.9627056, -1.65239, 0.9254902, 1, 0, 1,
-0.9446169, -0.2306357, 0.2698985, 0.9215686, 1, 0, 1,
-0.94374, -0.9809917, -0.4340594, 0.9137255, 1, 0, 1,
-0.9398999, 0.4042729, -0.01848968, 0.9098039, 1, 0, 1,
-0.9397615, -0.1805897, -2.424788, 0.9019608, 1, 0, 1,
-0.9343687, 1.496257, 0.9286575, 0.8941177, 1, 0, 1,
-0.9148785, -0.556936, -0.3921787, 0.8901961, 1, 0, 1,
-0.9126641, 0.6727545, -0.3977317, 0.8823529, 1, 0, 1,
-0.9095287, 1.203931, -0.8037497, 0.8784314, 1, 0, 1,
-0.9086468, 1.864676, 0.3082847, 0.8705882, 1, 0, 1,
-0.9065815, 0.0528039, -1.845435, 0.8666667, 1, 0, 1,
-0.9064447, 0.1371925, -0.07168986, 0.8588235, 1, 0, 1,
-0.90363, -0.1507082, -2.345039, 0.854902, 1, 0, 1,
-0.89982, -0.04280244, -0.631044, 0.8470588, 1, 0, 1,
-0.8880292, -0.8988867, -3.194228, 0.8431373, 1, 0, 1,
-0.8846316, -0.1598664, -2.431362, 0.8352941, 1, 0, 1,
-0.882128, -1.508699, -3.692417, 0.8313726, 1, 0, 1,
-0.8788074, 0.5995261, -1.435311, 0.8235294, 1, 0, 1,
-0.8776438, 0.7144114, 0.8881639, 0.8196079, 1, 0, 1,
-0.8726647, 0.1246974, -2.013792, 0.8117647, 1, 0, 1,
-0.8686424, -0.6215999, -0.5921018, 0.8078431, 1, 0, 1,
-0.8685326, -0.7890244, -2.149249, 0.8, 1, 0, 1,
-0.8671455, 0.08816918, -2.51823, 0.7921569, 1, 0, 1,
-0.8590142, -0.9145202, -3.243906, 0.7882353, 1, 0, 1,
-0.8565037, 0.1700325, -1.553921, 0.7803922, 1, 0, 1,
-0.8553858, 1.932607, -0.9627747, 0.7764706, 1, 0, 1,
-0.8520456, -2.00581, -2.417854, 0.7686275, 1, 0, 1,
-0.8514127, -0.2042529, -2.009977, 0.7647059, 1, 0, 1,
-0.8469282, -0.8746141, -4.839748, 0.7568628, 1, 0, 1,
-0.8459942, -0.04601173, -0.976867, 0.7529412, 1, 0, 1,
-0.8458229, -0.2655936, -2.661684, 0.7450981, 1, 0, 1,
-0.8428291, -0.2999173, -0.3573281, 0.7411765, 1, 0, 1,
-0.840361, -0.03314421, -0.215366, 0.7333333, 1, 0, 1,
-0.8319805, -0.8834103, -0.7278739, 0.7294118, 1, 0, 1,
-0.8278078, 0.9562712, 0.9753716, 0.7215686, 1, 0, 1,
-0.8185339, 0.6398681, -1.62241, 0.7176471, 1, 0, 1,
-0.8177577, -1.119026, -1.820233, 0.7098039, 1, 0, 1,
-0.8155183, 0.5447164, -1.192274, 0.7058824, 1, 0, 1,
-0.8053287, -0.08241263, -0.8386139, 0.6980392, 1, 0, 1,
-0.8032705, 1.940271, -1.566646, 0.6901961, 1, 0, 1,
-0.8012531, -1.427901, -2.602869, 0.6862745, 1, 0, 1,
-0.7999969, 0.2923864, -1.989669, 0.6784314, 1, 0, 1,
-0.7969851, 0.2924609, -1.987723, 0.6745098, 1, 0, 1,
-0.7854023, 0.9768621, -0.3072797, 0.6666667, 1, 0, 1,
-0.7850012, 0.06921785, -2.934101, 0.6627451, 1, 0, 1,
-0.7846771, -0.5995573, -3.412279, 0.654902, 1, 0, 1,
-0.7793305, -0.7260146, -1.065893, 0.6509804, 1, 0, 1,
-0.7775457, 1.668347, -0.5395435, 0.6431373, 1, 0, 1,
-0.7773503, 1.32052, -1.511408, 0.6392157, 1, 0, 1,
-0.7753153, -0.3339281, -1.379561, 0.6313726, 1, 0, 1,
-0.7744019, 0.4859391, -0.1909981, 0.627451, 1, 0, 1,
-0.7729577, 0.7363644, -0.9712251, 0.6196079, 1, 0, 1,
-0.7695252, 0.507194, -1.515195, 0.6156863, 1, 0, 1,
-0.7670335, 0.6797298, -1.043468, 0.6078432, 1, 0, 1,
-0.7577744, 1.042145, -2.888762, 0.6039216, 1, 0, 1,
-0.7547269, -0.01168594, -2.640786, 0.5960785, 1, 0, 1,
-0.7538325, 0.2214565, -3.161914, 0.5882353, 1, 0, 1,
-0.7517595, -1.648291, -3.605755, 0.5843138, 1, 0, 1,
-0.7413695, -0.8467732, -2.52836, 0.5764706, 1, 0, 1,
-0.7356434, 0.0887919, -1.437753, 0.572549, 1, 0, 1,
-0.7330465, -1.951517, -3.674688, 0.5647059, 1, 0, 1,
-0.7310432, -1.941123, -2.429565, 0.5607843, 1, 0, 1,
-0.7299485, 0.3628008, -0.6071451, 0.5529412, 1, 0, 1,
-0.7243942, -1.141959, -2.998043, 0.5490196, 1, 0, 1,
-0.7191185, 0.2863208, -0.6606641, 0.5411765, 1, 0, 1,
-0.716937, 2.199602, -0.1413954, 0.5372549, 1, 0, 1,
-0.7118268, 0.5128707, -2.488562, 0.5294118, 1, 0, 1,
-0.70883, -2.334116, -2.67443, 0.5254902, 1, 0, 1,
-0.7043701, -0.4346383, -1.472765, 0.5176471, 1, 0, 1,
-0.6980886, 0.1843717, -1.908517, 0.5137255, 1, 0, 1,
-0.6963447, -0.2864851, -0.3640707, 0.5058824, 1, 0, 1,
-0.6911309, -0.5300263, -2.06023, 0.5019608, 1, 0, 1,
-0.6902868, -0.8367397, -2.19975, 0.4941176, 1, 0, 1,
-0.6864503, -0.9434581, -3.226621, 0.4862745, 1, 0, 1,
-0.6859068, 1.049306, -1.175417, 0.4823529, 1, 0, 1,
-0.6840236, -0.9750304, -3.999436, 0.4745098, 1, 0, 1,
-0.6837168, 0.2578673, -0.8067935, 0.4705882, 1, 0, 1,
-0.6836821, -0.6847996, -0.9411893, 0.4627451, 1, 0, 1,
-0.6821625, -1.525201, -3.043676, 0.4588235, 1, 0, 1,
-0.6810604, 0.5782019, -2.44482, 0.4509804, 1, 0, 1,
-0.6805238, -1.5772, -2.418442, 0.4470588, 1, 0, 1,
-0.6796657, 0.4422843, -0.1887563, 0.4392157, 1, 0, 1,
-0.6762623, -1.678581, -1.037808, 0.4352941, 1, 0, 1,
-0.6759048, 1.034638, -0.2378242, 0.427451, 1, 0, 1,
-0.6704959, 0.4679914, -0.1098752, 0.4235294, 1, 0, 1,
-0.6682966, 0.289533, -1.32261, 0.4156863, 1, 0, 1,
-0.6650761, -0.1143646, -1.348874, 0.4117647, 1, 0, 1,
-0.6599647, -0.227605, -2.354477, 0.4039216, 1, 0, 1,
-0.6576614, 1.048103, -1.281811, 0.3960784, 1, 0, 1,
-0.6450856, -0.4430894, -2.44098, 0.3921569, 1, 0, 1,
-0.6312713, 1.404768, -0.01921179, 0.3843137, 1, 0, 1,
-0.6274937, -0.368761, -2.024818, 0.3803922, 1, 0, 1,
-0.6233215, -0.1610092, -3.500377, 0.372549, 1, 0, 1,
-0.6223027, -2.007011, -1.698857, 0.3686275, 1, 0, 1,
-0.6189336, -0.04973059, -2.036058, 0.3607843, 1, 0, 1,
-0.6176967, -1.336014, -2.731609, 0.3568628, 1, 0, 1,
-0.6136475, 1.55258, 0.3083272, 0.3490196, 1, 0, 1,
-0.6124858, 0.4156292, -1.448623, 0.345098, 1, 0, 1,
-0.6122723, -1.466331, -2.086386, 0.3372549, 1, 0, 1,
-0.6121639, 0.6377772, -0.809881, 0.3333333, 1, 0, 1,
-0.6110063, -0.7754563, -1.030552, 0.3254902, 1, 0, 1,
-0.6086204, -1.747624, -1.991229, 0.3215686, 1, 0, 1,
-0.608289, -0.7669379, -2.207961, 0.3137255, 1, 0, 1,
-0.6065335, 1.42505, 0.654442, 0.3098039, 1, 0, 1,
-0.6015391, 0.6017068, 0.1052012, 0.3019608, 1, 0, 1,
-0.5984808, 0.657365, -0.2866394, 0.2941177, 1, 0, 1,
-0.592199, 0.127233, -1.080148, 0.2901961, 1, 0, 1,
-0.5823489, 0.4473709, -1.575492, 0.282353, 1, 0, 1,
-0.5823159, 1.074069, -0.6062692, 0.2784314, 1, 0, 1,
-0.5814288, 0.9019342, 1.445287, 0.2705882, 1, 0, 1,
-0.5755982, -1.236407, -2.658492, 0.2666667, 1, 0, 1,
-0.5731868, 0.3484196, -1.006916, 0.2588235, 1, 0, 1,
-0.5722209, -0.9733822, -2.225207, 0.254902, 1, 0, 1,
-0.5720858, -0.2152952, -2.031258, 0.2470588, 1, 0, 1,
-0.5714064, -0.11521, -2.495594, 0.2431373, 1, 0, 1,
-0.5621581, 0.3090233, -0.9481931, 0.2352941, 1, 0, 1,
-0.558199, -0.4820047, -1.850385, 0.2313726, 1, 0, 1,
-0.5574374, 0.417425, -2.301873, 0.2235294, 1, 0, 1,
-0.5567685, 1.018772, -0.03075778, 0.2196078, 1, 0, 1,
-0.5559174, 2.750852, -0.1485325, 0.2117647, 1, 0, 1,
-0.5558863, 0.44884, -1.404883, 0.2078431, 1, 0, 1,
-0.5520854, -1.346272, -1.363037, 0.2, 1, 0, 1,
-0.551205, 0.5022942, -2.471429, 0.1921569, 1, 0, 1,
-0.5511895, -1.376677, -2.873401, 0.1882353, 1, 0, 1,
-0.5485954, -0.08259828, -1.970909, 0.1803922, 1, 0, 1,
-0.5459847, -1.498121, -2.288508, 0.1764706, 1, 0, 1,
-0.5377788, -0.4203956, -1.641581, 0.1686275, 1, 0, 1,
-0.5365608, 0.6509976, 0.2613372, 0.1647059, 1, 0, 1,
-0.5360682, -0.6264539, -2.384093, 0.1568628, 1, 0, 1,
-0.5305912, 0.8137878, -1.574261, 0.1529412, 1, 0, 1,
-0.5303491, -0.2171355, -1.822085, 0.145098, 1, 0, 1,
-0.5266407, 0.9670403, 1.134202, 0.1411765, 1, 0, 1,
-0.5260994, 0.04196498, -1.473681, 0.1333333, 1, 0, 1,
-0.5245478, -1.454073, -1.672082, 0.1294118, 1, 0, 1,
-0.5233765, 1.039331, -2.259112, 0.1215686, 1, 0, 1,
-0.522404, -0.567284, -0.7972085, 0.1176471, 1, 0, 1,
-0.5208504, -0.5308313, -3.218729, 0.1098039, 1, 0, 1,
-0.5170484, 0.5379409, 0.530551, 0.1058824, 1, 0, 1,
-0.5142347, 0.6418283, 1.995155, 0.09803922, 1, 0, 1,
-0.5130842, 0.1604401, -1.35349, 0.09019608, 1, 0, 1,
-0.5120593, -0.04394644, -1.532405, 0.08627451, 1, 0, 1,
-0.5085618, -0.1743466, -3.522027, 0.07843138, 1, 0, 1,
-0.5037198, 1.125535, -0.064601, 0.07450981, 1, 0, 1,
-0.5011559, -0.4386108, -2.787566, 0.06666667, 1, 0, 1,
-0.4976098, -0.6998994, -3.953755, 0.0627451, 1, 0, 1,
-0.4927608, 1.917667, -1.501792, 0.05490196, 1, 0, 1,
-0.4906599, -0.2488675, -1.152284, 0.05098039, 1, 0, 1,
-0.4880909, 0.2379922, -0.8223599, 0.04313726, 1, 0, 1,
-0.4869252, 0.6919659, -1.029232, 0.03921569, 1, 0, 1,
-0.4859296, 1.260887, 0.4711913, 0.03137255, 1, 0, 1,
-0.4855133, -0.892951, -3.416648, 0.02745098, 1, 0, 1,
-0.4832754, -1.419496, -4.16353, 0.01960784, 1, 0, 1,
-0.4818287, 1.832134, -1.168012, 0.01568628, 1, 0, 1,
-0.4789686, 0.1922286, -2.339783, 0.007843138, 1, 0, 1,
-0.4779705, -1.060766, -2.820596, 0.003921569, 1, 0, 1,
-0.4711609, 0.3520896, -0.9394792, 0, 1, 0.003921569, 1,
-0.468854, 0.07474755, -1.235311, 0, 1, 0.01176471, 1,
-0.467188, -0.4646086, -4.042311, 0, 1, 0.01568628, 1,
-0.4666472, -1.204051, -2.589211, 0, 1, 0.02352941, 1,
-0.4657309, -0.4091219, -0.9846478, 0, 1, 0.02745098, 1,
-0.4650017, -0.5908228, -2.258046, 0, 1, 0.03529412, 1,
-0.4642682, 0.9085335, 0.5204448, 0, 1, 0.03921569, 1,
-0.4637107, -1.876785, -4.496392, 0, 1, 0.04705882, 1,
-0.463122, -0.4187832, -1.679101, 0, 1, 0.05098039, 1,
-0.4628694, 0.7559265, 1.336843, 0, 1, 0.05882353, 1,
-0.4618441, -1.162729, -2.445835, 0, 1, 0.0627451, 1,
-0.4594804, 1.619368, 0.03211335, 0, 1, 0.07058824, 1,
-0.449301, 0.1504501, 0.4937708, 0, 1, 0.07450981, 1,
-0.4462313, 0.8833697, -1.516859, 0, 1, 0.08235294, 1,
-0.4461661, 0.2826815, -1.006379, 0, 1, 0.08627451, 1,
-0.44088, 0.2832559, -0.6202465, 0, 1, 0.09411765, 1,
-0.4306457, -0.1484831, -1.37116, 0, 1, 0.1019608, 1,
-0.429169, 1.427306, 1.317001, 0, 1, 0.1058824, 1,
-0.4284115, -0.1136479, -3.281256, 0, 1, 0.1137255, 1,
-0.4260373, 2.062508, 0.5770635, 0, 1, 0.1176471, 1,
-0.4237557, -1.416378, -1.51351, 0, 1, 0.1254902, 1,
-0.4102614, 0.793436, -0.08826534, 0, 1, 0.1294118, 1,
-0.4086743, -0.1134728, -2.200997, 0, 1, 0.1372549, 1,
-0.4080021, -1.000265, -2.167382, 0, 1, 0.1411765, 1,
-0.4045179, 0.3274631, -1.562252, 0, 1, 0.1490196, 1,
-0.4022886, 0.0255508, -1.665803, 0, 1, 0.1529412, 1,
-0.3973801, -0.19421, -3.120724, 0, 1, 0.1607843, 1,
-0.3965759, -0.2419852, -3.292436, 0, 1, 0.1647059, 1,
-0.3960643, 1.685507, 1.209757, 0, 1, 0.172549, 1,
-0.3960398, -0.8668495, -3.022196, 0, 1, 0.1764706, 1,
-0.3959041, -0.678741, -2.311082, 0, 1, 0.1843137, 1,
-0.3952621, 0.5740368, -1.698018, 0, 1, 0.1882353, 1,
-0.3937646, -0.4149677, -1.512689, 0, 1, 0.1960784, 1,
-0.3932369, 0.4799763, -0.6564516, 0, 1, 0.2039216, 1,
-0.3902027, 0.7215607, -0.6056546, 0, 1, 0.2078431, 1,
-0.3897452, -0.5772735, -1.392756, 0, 1, 0.2156863, 1,
-0.3874743, -1.660361, -2.045398, 0, 1, 0.2196078, 1,
-0.3835767, 1.674816, -0.6166199, 0, 1, 0.227451, 1,
-0.3828955, -0.2973187, -2.752815, 0, 1, 0.2313726, 1,
-0.3776837, -0.4046242, -2.065285, 0, 1, 0.2392157, 1,
-0.375986, 1.742721, -0.3812304, 0, 1, 0.2431373, 1,
-0.3747255, -0.128261, -2.761662, 0, 1, 0.2509804, 1,
-0.3728874, -1.569943, -3.212918, 0, 1, 0.254902, 1,
-0.3723481, -1.226521, -2.399425, 0, 1, 0.2627451, 1,
-0.3676526, 0.6968208, -0.6687744, 0, 1, 0.2666667, 1,
-0.3665166, -0.5602433, -2.004966, 0, 1, 0.2745098, 1,
-0.3653846, 1.200685, -1.220335, 0, 1, 0.2784314, 1,
-0.3653821, 1.015774, -0.7831568, 0, 1, 0.2862745, 1,
-0.3626271, 0.235038, -0.797348, 0, 1, 0.2901961, 1,
-0.3597596, 0.3129122, -1.508183, 0, 1, 0.2980392, 1,
-0.356815, 0.1592606, -1.540856, 0, 1, 0.3058824, 1,
-0.3559983, -0.891208, -2.948978, 0, 1, 0.3098039, 1,
-0.349244, -0.706712, -1.822739, 0, 1, 0.3176471, 1,
-0.3490202, 2.396498, 0.3733068, 0, 1, 0.3215686, 1,
-0.3476315, -1.260597, -1.996049, 0, 1, 0.3294118, 1,
-0.3460346, 1.04947, 0.2893234, 0, 1, 0.3333333, 1,
-0.3411305, 0.6935887, -1.825393, 0, 1, 0.3411765, 1,
-0.3406399, 0.1855563, -1.177481, 0, 1, 0.345098, 1,
-0.337116, 0.237298, -1.517173, 0, 1, 0.3529412, 1,
-0.3318106, -0.9731598, -3.166749, 0, 1, 0.3568628, 1,
-0.3281865, 0.4390723, -1.507152, 0, 1, 0.3647059, 1,
-0.3279375, 0.1645618, 1.357399, 0, 1, 0.3686275, 1,
-0.3257163, 0.7583507, 0.1239425, 0, 1, 0.3764706, 1,
-0.3249122, 1.760154, -1.98419, 0, 1, 0.3803922, 1,
-0.3242288, -0.9654726, -2.041439, 0, 1, 0.3882353, 1,
-0.321449, -1.765112, -4.09955, 0, 1, 0.3921569, 1,
-0.3204906, 0.2942813, -0.4274035, 0, 1, 0.4, 1,
-0.3190731, -0.979036, -1.961733, 0, 1, 0.4078431, 1,
-0.3186877, 0.4083001, -0.8796028, 0, 1, 0.4117647, 1,
-0.3147693, -0.1625684, -3.399757, 0, 1, 0.4196078, 1,
-0.3105991, 0.7699834, 1.491162, 0, 1, 0.4235294, 1,
-0.3105395, 1.645785, -0.9524243, 0, 1, 0.4313726, 1,
-0.3103131, 0.7126324, 0.07062098, 0, 1, 0.4352941, 1,
-0.3077971, 1.11385, -1.390037, 0, 1, 0.4431373, 1,
-0.3046904, 0.421286, -1.052504, 0, 1, 0.4470588, 1,
-0.3043889, 0.3824736, -0.656622, 0, 1, 0.454902, 1,
-0.3018204, -0.09926781, -1.782432, 0, 1, 0.4588235, 1,
-0.3001975, 0.4326192, -1.168434, 0, 1, 0.4666667, 1,
-0.2983179, 0.5982496, -1.384624, 0, 1, 0.4705882, 1,
-0.2932078, -1.798891, -3.384798, 0, 1, 0.4784314, 1,
-0.2923024, -0.7445014, -2.647794, 0, 1, 0.4823529, 1,
-0.2829662, 1.222682, 0.2564204, 0, 1, 0.4901961, 1,
-0.2779235, 0.1207877, -1.087895, 0, 1, 0.4941176, 1,
-0.2744814, 0.4668037, -0.4554407, 0, 1, 0.5019608, 1,
-0.273225, -2.335969, -2.917856, 0, 1, 0.509804, 1,
-0.2706002, 0.2152465, -0.9393371, 0, 1, 0.5137255, 1,
-0.2692562, -1.080173, -3.357625, 0, 1, 0.5215687, 1,
-0.2688419, -0.5275816, -2.586214, 0, 1, 0.5254902, 1,
-0.2685624, -1.073399, -2.293261, 0, 1, 0.5333334, 1,
-0.2683533, 0.03893703, -0.7686398, 0, 1, 0.5372549, 1,
-0.2680345, -0.4712878, -1.938347, 0, 1, 0.5450981, 1,
-0.2639408, -0.7133771, -1.967529, 0, 1, 0.5490196, 1,
-0.2622385, -0.1393931, -2.867092, 0, 1, 0.5568628, 1,
-0.2530547, 0.752306, 1.471672, 0, 1, 0.5607843, 1,
-0.2529901, 0.9327872, -2.858766, 0, 1, 0.5686275, 1,
-0.2517866, 0.7083237, 1.866457, 0, 1, 0.572549, 1,
-0.2447593, -1.01106, -2.42557, 0, 1, 0.5803922, 1,
-0.240873, 0.1435382, -1.528532, 0, 1, 0.5843138, 1,
-0.2368888, -0.7502244, -1.785768, 0, 1, 0.5921569, 1,
-0.2366323, 0.0315676, -0.7384797, 0, 1, 0.5960785, 1,
-0.2361601, -1.278793, -4.272286, 0, 1, 0.6039216, 1,
-0.2340175, -0.2293625, -0.7513185, 0, 1, 0.6117647, 1,
-0.2211697, 0.2844455, 0.103768, 0, 1, 0.6156863, 1,
-0.2195878, -1.798835, -2.895386, 0, 1, 0.6235294, 1,
-0.2130916, -2.40227, -2.945395, 0, 1, 0.627451, 1,
-0.2107007, -0.1034294, -1.198356, 0, 1, 0.6352941, 1,
-0.2086836, -0.4349002, -2.026864, 0, 1, 0.6392157, 1,
-0.206663, 0.1565689, -1.067529, 0, 1, 0.6470588, 1,
-0.2047636, -0.03000047, -0.5182461, 0, 1, 0.6509804, 1,
-0.2043164, -0.3834638, -3.311878, 0, 1, 0.6588235, 1,
-0.2033709, 0.2398097, -0.1473609, 0, 1, 0.6627451, 1,
-0.2033549, 0.3435213, 1.340824, 0, 1, 0.6705883, 1,
-0.1966149, 0.988858, -1.10584, 0, 1, 0.6745098, 1,
-0.1959233, -0.5055866, -1.356276, 0, 1, 0.682353, 1,
-0.191598, 1.940692, -1.178956, 0, 1, 0.6862745, 1,
-0.1899979, -0.2857176, -2.989923, 0, 1, 0.6941177, 1,
-0.1873723, 2.197161, 0.8330429, 0, 1, 0.7019608, 1,
-0.1869168, 1.205908, -0.3199334, 0, 1, 0.7058824, 1,
-0.1858051, -0.6001797, -3.850198, 0, 1, 0.7137255, 1,
-0.1804317, -0.8031582, -3.375879, 0, 1, 0.7176471, 1,
-0.1802139, -0.889633, -2.586869, 0, 1, 0.7254902, 1,
-0.1793454, -0.4309865, -4.20437, 0, 1, 0.7294118, 1,
-0.1761281, 1.120364, -1.096959, 0, 1, 0.7372549, 1,
-0.1733876, 0.3199271, -0.01429513, 0, 1, 0.7411765, 1,
-0.1703566, -0.7955371, -3.905912, 0, 1, 0.7490196, 1,
-0.1664743, -0.4789844, -3.638946, 0, 1, 0.7529412, 1,
-0.166347, -0.3889177, -3.163466, 0, 1, 0.7607843, 1,
-0.1647592, -0.2794836, -2.792627, 0, 1, 0.7647059, 1,
-0.1579842, -0.3594154, -1.430167, 0, 1, 0.772549, 1,
-0.155865, 0.6383189, 0.8477461, 0, 1, 0.7764706, 1,
-0.1505688, 2.297064, -0.1313991, 0, 1, 0.7843137, 1,
-0.1491428, -0.6009807, -3.117041, 0, 1, 0.7882353, 1,
-0.1491186, 2.040504, -0.5546058, 0, 1, 0.7960784, 1,
-0.136726, 0.2927578, -1.151255, 0, 1, 0.8039216, 1,
-0.1306588, -2.274858, -3.668175, 0, 1, 0.8078431, 1,
-0.1272857, 0.8441486, 1.773189, 0, 1, 0.8156863, 1,
-0.1268197, -1.478682, -3.820523, 0, 1, 0.8196079, 1,
-0.1246394, -0.6073167, -2.859056, 0, 1, 0.827451, 1,
-0.1191889, -0.1356852, -1.767304, 0, 1, 0.8313726, 1,
-0.1187986, -0.1275816, -0.7438647, 0, 1, 0.8392157, 1,
-0.1168894, 0.5823107, -0.9483337, 0, 1, 0.8431373, 1,
-0.1152379, -0.9520542, -1.919455, 0, 1, 0.8509804, 1,
-0.1066489, -1.236427, -4.609096, 0, 1, 0.854902, 1,
-0.1051031, 0.0801921, -0.2323949, 0, 1, 0.8627451, 1,
-0.09330025, 0.1137146, 1.118905, 0, 1, 0.8666667, 1,
-0.09102024, -1.095929, -3.643783, 0, 1, 0.8745098, 1,
-0.08915583, 0.373547, 0.3063581, 0, 1, 0.8784314, 1,
-0.08625572, -0.227732, -3.155849, 0, 1, 0.8862745, 1,
-0.08600043, -0.821332, -2.37086, 0, 1, 0.8901961, 1,
-0.08577932, -0.7867114, -4.179548, 0, 1, 0.8980392, 1,
-0.08493557, -0.008382513, -1.659808, 0, 1, 0.9058824, 1,
-0.08364137, 0.5284847, -1.312533, 0, 1, 0.9098039, 1,
-0.08352648, 0.4344726, -0.8605884, 0, 1, 0.9176471, 1,
-0.07701602, 0.6176037, -1.039492, 0, 1, 0.9215686, 1,
-0.07424576, -0.4755329, -2.777897, 0, 1, 0.9294118, 1,
-0.07270372, 0.2267474, 0.6343211, 0, 1, 0.9333333, 1,
-0.06449089, 1.191197, -1.340763, 0, 1, 0.9411765, 1,
-0.06441817, -1.152361, -2.046296, 0, 1, 0.945098, 1,
-0.06439073, 0.4792661, -0.5131193, 0, 1, 0.9529412, 1,
-0.06395694, 1.127765, 0.8124706, 0, 1, 0.9568627, 1,
-0.06386882, 0.3232708, -1.216331, 0, 1, 0.9647059, 1,
-0.05833146, 2.078975, 1.387812, 0, 1, 0.9686275, 1,
-0.0536585, -0.6842383, -2.01897, 0, 1, 0.9764706, 1,
-0.05198375, 0.3251085, -0.3302166, 0, 1, 0.9803922, 1,
-0.05056954, 0.9636458, 0.2197776, 0, 1, 0.9882353, 1,
-0.05019289, 0.7754838, 0.7349578, 0, 1, 0.9921569, 1,
-0.05011999, -0.0009277096, -1.698879, 0, 1, 1, 1,
-0.04962966, 0.09199394, -0.3554629, 0, 0.9921569, 1, 1,
-0.04879127, -0.6630546, -2.364568, 0, 0.9882353, 1, 1,
-0.03940994, -0.4418289, -2.718249, 0, 0.9803922, 1, 1,
-0.0240885, 0.8903278, -0.1549153, 0, 0.9764706, 1, 1,
-0.02281448, 0.06756748, 0.0185297, 0, 0.9686275, 1, 1,
-0.02230351, 1.577018, -0.9605569, 0, 0.9647059, 1, 1,
-0.02024399, 0.4910809, 0.2852509, 0, 0.9568627, 1, 1,
-0.01928469, -0.5048504, -1.859805, 0, 0.9529412, 1, 1,
-0.01877801, 1.08846, -1.609739, 0, 0.945098, 1, 1,
-0.01254461, 0.04789938, -1.336735, 0, 0.9411765, 1, 1,
-0.005481527, -2.200605, -2.908225, 0, 0.9333333, 1, 1,
0.0002354976, 2.325854, 0.7385051, 0, 0.9294118, 1, 1,
0.002996855, -1.020293, 1.222696, 0, 0.9215686, 1, 1,
0.004530518, -0.2942965, 3.564045, 0, 0.9176471, 1, 1,
0.005698269, 1.318189, 0.492813, 0, 0.9098039, 1, 1,
0.01260574, -0.4284925, 3.614664, 0, 0.9058824, 1, 1,
0.01849383, 2.07179, 0.06026765, 0, 0.8980392, 1, 1,
0.01940615, 2.288374, -0.3333439, 0, 0.8901961, 1, 1,
0.02022897, 0.2813953, -1.036282, 0, 0.8862745, 1, 1,
0.03100489, 0.4590106, -0.2261257, 0, 0.8784314, 1, 1,
0.03444855, 0.2253177, -0.3698471, 0, 0.8745098, 1, 1,
0.03764148, -0.06381094, 2.099607, 0, 0.8666667, 1, 1,
0.04583286, -0.4555065, 3.393127, 0, 0.8627451, 1, 1,
0.05444104, 0.6994768, -1.571679, 0, 0.854902, 1, 1,
0.05564781, 0.2791303, -0.1264017, 0, 0.8509804, 1, 1,
0.05889692, -1.320061, 1.166406, 0, 0.8431373, 1, 1,
0.06056222, 0.7097619, -0.865594, 0, 0.8392157, 1, 1,
0.06078944, 2.496436, -1.061338, 0, 0.8313726, 1, 1,
0.06830366, 0.1244918, 0.146415, 0, 0.827451, 1, 1,
0.06903778, -2.57672, 2.506652, 0, 0.8196079, 1, 1,
0.06937343, -1.127591, 4.530385, 0, 0.8156863, 1, 1,
0.07077813, 0.3937415, 0.05560618, 0, 0.8078431, 1, 1,
0.07212692, -1.861078, 4.372633, 0, 0.8039216, 1, 1,
0.07647225, -0.8173782, 2.456692, 0, 0.7960784, 1, 1,
0.08042919, -0.4904098, 3.028677, 0, 0.7882353, 1, 1,
0.08076815, -0.3306479, 3.415677, 0, 0.7843137, 1, 1,
0.08186651, 1.049542, -0.507586, 0, 0.7764706, 1, 1,
0.08266131, -0.1488098, 1.065021, 0, 0.772549, 1, 1,
0.08346324, -0.2521472, 2.673622, 0, 0.7647059, 1, 1,
0.08761193, 0.8760573, 0.2239316, 0, 0.7607843, 1, 1,
0.08774227, -0.9669783, 5.682525, 0, 0.7529412, 1, 1,
0.0900222, -0.06403379, 2.961513, 0, 0.7490196, 1, 1,
0.09058867, -0.6609606, 3.696514, 0, 0.7411765, 1, 1,
0.09157629, 1.637434, -1.227452, 0, 0.7372549, 1, 1,
0.09314632, 0.168667, -0.7690781, 0, 0.7294118, 1, 1,
0.09466162, 1.444283, -1.74183, 0, 0.7254902, 1, 1,
0.09758302, 2.116707, 0.7827531, 0, 0.7176471, 1, 1,
0.09988753, -1.005748, 2.671606, 0, 0.7137255, 1, 1,
0.1011656, 1.084695, -2.095498, 0, 0.7058824, 1, 1,
0.1019777, -0.1273481, 3.73954, 0, 0.6980392, 1, 1,
0.109491, 0.6476768, 0.1737944, 0, 0.6941177, 1, 1,
0.1104733, -1.16366, 2.43465, 0, 0.6862745, 1, 1,
0.1108801, 0.4948553, 0.7872313, 0, 0.682353, 1, 1,
0.1127054, -0.876884, 2.707705, 0, 0.6745098, 1, 1,
0.1148391, -2.119424, 1.572959, 0, 0.6705883, 1, 1,
0.1160624, 0.3446506, 0.7896451, 0, 0.6627451, 1, 1,
0.1167646, -0.296898, 4.232212, 0, 0.6588235, 1, 1,
0.117275, -0.4945651, 2.712967, 0, 0.6509804, 1, 1,
0.1178965, -0.3605074, 2.825644, 0, 0.6470588, 1, 1,
0.1183172, -0.7235473, 2.404869, 0, 0.6392157, 1, 1,
0.1270359, -2.427792, 3.574401, 0, 0.6352941, 1, 1,
0.1272322, 0.7824674, 1.200181, 0, 0.627451, 1, 1,
0.1285565, -0.4059199, 1.258147, 0, 0.6235294, 1, 1,
0.1286385, -1.830304, 2.204067, 0, 0.6156863, 1, 1,
0.1300111, 0.2379122, 0.2785771, 0, 0.6117647, 1, 1,
0.1301735, -0.02694352, 0.9863204, 0, 0.6039216, 1, 1,
0.1303615, 0.2865777, -0.3307528, 0, 0.5960785, 1, 1,
0.1333425, 0.1846244, 2.631693, 0, 0.5921569, 1, 1,
0.1346679, 0.9990712, 1.02388, 0, 0.5843138, 1, 1,
0.134895, -0.1934766, 3.644568, 0, 0.5803922, 1, 1,
0.1365619, -0.7027944, 2.268864, 0, 0.572549, 1, 1,
0.1380498, 0.5194873, 0.7132602, 0, 0.5686275, 1, 1,
0.1408087, -0.8798364, 3.33355, 0, 0.5607843, 1, 1,
0.1477801, -0.2313888, 2.526915, 0, 0.5568628, 1, 1,
0.1527193, 2.507597, 1.575503, 0, 0.5490196, 1, 1,
0.1601658, -0.46664, 0.4472726, 0, 0.5450981, 1, 1,
0.160963, -1.882833, 3.080616, 0, 0.5372549, 1, 1,
0.1616951, 1.316211, -0.8044435, 0, 0.5333334, 1, 1,
0.1657154, 1.03335, 1.359323, 0, 0.5254902, 1, 1,
0.167865, -1.16866, 2.122067, 0, 0.5215687, 1, 1,
0.1821878, -1.254478, 3.248287, 0, 0.5137255, 1, 1,
0.1822229, 0.7155988, 0.3721475, 0, 0.509804, 1, 1,
0.1826855, 0.1461486, 0.7324881, 0, 0.5019608, 1, 1,
0.1867353, -1.49462, 1.919656, 0, 0.4941176, 1, 1,
0.1908508, -0.2639443, 3.168132, 0, 0.4901961, 1, 1,
0.1931393, -0.8135342, 3.046417, 0, 0.4823529, 1, 1,
0.1933189, -0.4955718, 4.184571, 0, 0.4784314, 1, 1,
0.193637, -1.943983, 3.641854, 0, 0.4705882, 1, 1,
0.1939931, -1.369837, 3.327464, 0, 0.4666667, 1, 1,
0.1940503, -0.469802, 2.941689, 0, 0.4588235, 1, 1,
0.1966957, -1.086884, 2.139027, 0, 0.454902, 1, 1,
0.2034795, -0.6475745, 1.820108, 0, 0.4470588, 1, 1,
0.2083912, -1.945075, 2.679452, 0, 0.4431373, 1, 1,
0.2089957, 0.7055458, 2.403356, 0, 0.4352941, 1, 1,
0.2108895, -1.484916, 2.125153, 0, 0.4313726, 1, 1,
0.2172718, 0.9408552, -1.217487, 0, 0.4235294, 1, 1,
0.2196189, 0.7951955, 2.184702, 0, 0.4196078, 1, 1,
0.220098, -0.5827524, 4.399425, 0, 0.4117647, 1, 1,
0.2209647, -0.2470665, 2.530575, 0, 0.4078431, 1, 1,
0.2211901, 0.9342898, -1.615896, 0, 0.4, 1, 1,
0.2212622, -0.1367055, 2.59858, 0, 0.3921569, 1, 1,
0.2236071, 0.4646689, 0.7304531, 0, 0.3882353, 1, 1,
0.2240046, 0.4852999, -0.09964449, 0, 0.3803922, 1, 1,
0.2282927, -0.5054344, 3.150843, 0, 0.3764706, 1, 1,
0.2284744, 0.04623707, 1.769192, 0, 0.3686275, 1, 1,
0.2288179, -0.4936944, 3.12287, 0, 0.3647059, 1, 1,
0.2294344, 1.539325, -0.963935, 0, 0.3568628, 1, 1,
0.2320905, -0.257506, 0.9629574, 0, 0.3529412, 1, 1,
0.2337139, -0.608416, 2.121831, 0, 0.345098, 1, 1,
0.2346777, -0.4228935, 3.625976, 0, 0.3411765, 1, 1,
0.2368424, -0.1756934, 1.401093, 0, 0.3333333, 1, 1,
0.2416061, 0.7885117, 0.2217121, 0, 0.3294118, 1, 1,
0.2456491, 0.7566345, 0.6506114, 0, 0.3215686, 1, 1,
0.2461151, 0.07712401, 1.57236, 0, 0.3176471, 1, 1,
0.246471, -0.4196593, 3.909309, 0, 0.3098039, 1, 1,
0.2466199, 2.172376, -1.129703, 0, 0.3058824, 1, 1,
0.2517038, 0.2806079, 1.740865, 0, 0.2980392, 1, 1,
0.2572722, -1.146353, 2.494281, 0, 0.2901961, 1, 1,
0.2584816, -0.2911505, 3.72677, 0, 0.2862745, 1, 1,
0.2597674, -0.01933469, 1.005465, 0, 0.2784314, 1, 1,
0.2656564, -0.1197568, 4.100009, 0, 0.2745098, 1, 1,
0.2659802, 1.63249, -0.102252, 0, 0.2666667, 1, 1,
0.2694641, -1.730237, 4.645766, 0, 0.2627451, 1, 1,
0.2718246, 0.3164546, 0.6247857, 0, 0.254902, 1, 1,
0.2720459, -1.231331, 1.46136, 0, 0.2509804, 1, 1,
0.2744372, -0.3418516, 3.455232, 0, 0.2431373, 1, 1,
0.279427, 0.4298422, 0.916375, 0, 0.2392157, 1, 1,
0.2807707, 0.2575172, -0.3973249, 0, 0.2313726, 1, 1,
0.2825117, -0.5602243, 2.583765, 0, 0.227451, 1, 1,
0.2826918, 0.9966829, 0.5601365, 0, 0.2196078, 1, 1,
0.2830965, 0.6574197, 2.301568, 0, 0.2156863, 1, 1,
0.2849272, -0.6699278, 2.063087, 0, 0.2078431, 1, 1,
0.2863604, 1.427591, -1.637503, 0, 0.2039216, 1, 1,
0.2917079, -0.2816696, 2.965619, 0, 0.1960784, 1, 1,
0.2938728, 0.5916624, 0.9602336, 0, 0.1882353, 1, 1,
0.294243, 0.07470219, 1.289672, 0, 0.1843137, 1, 1,
0.3010489, 0.7817596, 1.506944, 0, 0.1764706, 1, 1,
0.3072686, -0.5456297, 2.611726, 0, 0.172549, 1, 1,
0.3075379, 1.791402, -0.3421459, 0, 0.1647059, 1, 1,
0.3120778, 0.9140154, 1.354993, 0, 0.1607843, 1, 1,
0.3127523, -1.022524, -0.7129047, 0, 0.1529412, 1, 1,
0.321787, 0.2205222, 0.1896859, 0, 0.1490196, 1, 1,
0.3248914, 1.833326, -1.569771, 0, 0.1411765, 1, 1,
0.325813, 0.6867843, 0.6313655, 0, 0.1372549, 1, 1,
0.3260764, -0.6241197, 2.867253, 0, 0.1294118, 1, 1,
0.3263017, 0.6542066, 0.2527424, 0, 0.1254902, 1, 1,
0.3331763, 1.227075, 2.872249, 0, 0.1176471, 1, 1,
0.3361322, -2.868961, 4.914462, 0, 0.1137255, 1, 1,
0.3363652, -0.8731597, 2.673796, 0, 0.1058824, 1, 1,
0.3370751, -1.33595, 3.648194, 0, 0.09803922, 1, 1,
0.3451636, 1.214567, 1.178471, 0, 0.09411765, 1, 1,
0.3502441, -0.2974184, 1.856615, 0, 0.08627451, 1, 1,
0.3522847, 0.5798019, 0.6047451, 0, 0.08235294, 1, 1,
0.3542452, 0.4646331, 0.5659567, 0, 0.07450981, 1, 1,
0.3582417, -2.033995, 1.93412, 0, 0.07058824, 1, 1,
0.3632223, -0.3263606, 1.041425, 0, 0.0627451, 1, 1,
0.364158, -0.6551501, 2.768738, 0, 0.05882353, 1, 1,
0.3663202, 0.1518296, 0.5088589, 0, 0.05098039, 1, 1,
0.3691679, 2.465791, 0.197105, 0, 0.04705882, 1, 1,
0.3699881, -0.751985, 2.014371, 0, 0.03921569, 1, 1,
0.3710783, -0.7475976, 3.123623, 0, 0.03529412, 1, 1,
0.3732097, 0.5058171, 0.1518432, 0, 0.02745098, 1, 1,
0.3763044, -1.067659, 3.295022, 0, 0.02352941, 1, 1,
0.3829977, -0.2151497, 2.223803, 0, 0.01568628, 1, 1,
0.3896817, 0.2365945, 1.125167, 0, 0.01176471, 1, 1,
0.3913774, -1.516153, 3.250909, 0, 0.003921569, 1, 1,
0.3942231, 1.566102, -0.1522826, 0.003921569, 0, 1, 1,
0.3973289, -1.059394, 2.477771, 0.007843138, 0, 1, 1,
0.3978653, 0.3509028, -0.1530664, 0.01568628, 0, 1, 1,
0.4010419, -0.3152951, 3.020334, 0.01960784, 0, 1, 1,
0.4070655, 1.089507, -0.9135548, 0.02745098, 0, 1, 1,
0.4124716, 1.364358, -0.5874833, 0.03137255, 0, 1, 1,
0.4124757, -1.498799, 2.270222, 0.03921569, 0, 1, 1,
0.4136804, -0.6989371, 0.6419353, 0.04313726, 0, 1, 1,
0.4144853, 1.669594, -1.06808, 0.05098039, 0, 1, 1,
0.4171634, -0.01084715, -0.07882375, 0.05490196, 0, 1, 1,
0.4209113, 1.096362, 0.3192443, 0.0627451, 0, 1, 1,
0.4214174, 0.3022279, 2.739072, 0.06666667, 0, 1, 1,
0.4221688, 2.224311, 2.711551, 0.07450981, 0, 1, 1,
0.4274814, 2.443975, 0.2964331, 0.07843138, 0, 1, 1,
0.4303815, 1.276082, -0.3928868, 0.08627451, 0, 1, 1,
0.4394198, 0.9646143, 0.9590361, 0.09019608, 0, 1, 1,
0.4447823, 0.2182436, 0.8942622, 0.09803922, 0, 1, 1,
0.4454385, 1.397827, -2.587391, 0.1058824, 0, 1, 1,
0.4458169, -1.958264, 4.353959, 0.1098039, 0, 1, 1,
0.446979, 1.157494, -0.03441665, 0.1176471, 0, 1, 1,
0.4513027, 0.423024, -2.890404, 0.1215686, 0, 1, 1,
0.4544943, -0.5486863, 2.589184, 0.1294118, 0, 1, 1,
0.4549561, 0.4242659, 1.106087, 0.1333333, 0, 1, 1,
0.4552789, 0.2705955, 2.340716, 0.1411765, 0, 1, 1,
0.461821, -0.287438, 2.233657, 0.145098, 0, 1, 1,
0.4628315, -0.212834, 2.531861, 0.1529412, 0, 1, 1,
0.464625, -0.9613656, 2.554214, 0.1568628, 0, 1, 1,
0.4649989, -1.497088, 3.803006, 0.1647059, 0, 1, 1,
0.467957, 0.6745871, 2.641438, 0.1686275, 0, 1, 1,
0.4680195, 0.4139062, 2.021094, 0.1764706, 0, 1, 1,
0.4697034, -0.6153688, 2.327266, 0.1803922, 0, 1, 1,
0.4703878, 0.600076, 0.6280565, 0.1882353, 0, 1, 1,
0.4715462, 0.2649779, 0.9197202, 0.1921569, 0, 1, 1,
0.4830902, 1.050654, 1.486965, 0.2, 0, 1, 1,
0.4879165, 0.5187608, 1.989014, 0.2078431, 0, 1, 1,
0.4892792, 1.053983, -1.522583, 0.2117647, 0, 1, 1,
0.4938673, 1.039412, 0.3105773, 0.2196078, 0, 1, 1,
0.4969718, -0.1978309, 0.7659793, 0.2235294, 0, 1, 1,
0.4977075, 0.1868162, 0.31335, 0.2313726, 0, 1, 1,
0.4978524, -0.0003346944, 0.4607089, 0.2352941, 0, 1, 1,
0.4996232, 1.132608, 1.280854, 0.2431373, 0, 1, 1,
0.5015408, 0.9179031, -0.5453553, 0.2470588, 0, 1, 1,
0.5019156, 0.4800521, 0.08783341, 0.254902, 0, 1, 1,
0.5062906, -0.3820211, 1.919633, 0.2588235, 0, 1, 1,
0.5086198, -0.08642758, 0.9569334, 0.2666667, 0, 1, 1,
0.5092096, -0.8618324, 2.519495, 0.2705882, 0, 1, 1,
0.5097366, -0.06191495, 1.891242, 0.2784314, 0, 1, 1,
0.5130427, -0.7108451, 3.195719, 0.282353, 0, 1, 1,
0.5131884, -1.113536, 2.262694, 0.2901961, 0, 1, 1,
0.5156666, 0.3897581, 1.663643, 0.2941177, 0, 1, 1,
0.5158958, -1.480908, 1.776391, 0.3019608, 0, 1, 1,
0.5166175, 0.08177145, 0.3576651, 0.3098039, 0, 1, 1,
0.5168052, -0.4257954, 3.864874, 0.3137255, 0, 1, 1,
0.5182654, -0.6038666, 1.290532, 0.3215686, 0, 1, 1,
0.5219552, -0.008363482, 3.337766, 0.3254902, 0, 1, 1,
0.5248859, 0.04536508, 0.5988874, 0.3333333, 0, 1, 1,
0.5281531, -0.03300824, -0.4708966, 0.3372549, 0, 1, 1,
0.5295277, 0.2567664, -0.1726988, 0.345098, 0, 1, 1,
0.5320399, 0.818788, 1.702095, 0.3490196, 0, 1, 1,
0.5353203, -0.9029982, 2.573924, 0.3568628, 0, 1, 1,
0.5368103, 0.6835019, 1.384504, 0.3607843, 0, 1, 1,
0.538928, 0.0778333, 0.4229427, 0.3686275, 0, 1, 1,
0.5397161, -1.573071, 2.375392, 0.372549, 0, 1, 1,
0.5575315, 0.2984089, -1.118773, 0.3803922, 0, 1, 1,
0.5578004, -1.771578, 4.380288, 0.3843137, 0, 1, 1,
0.5581845, -0.09635308, 1.88086, 0.3921569, 0, 1, 1,
0.5622371, 1.563267, -0.5999298, 0.3960784, 0, 1, 1,
0.5622406, 0.4216255, 0.5358258, 0.4039216, 0, 1, 1,
0.5635657, 0.7874899, 0.2216974, 0.4117647, 0, 1, 1,
0.564622, -0.04122725, 3.197558, 0.4156863, 0, 1, 1,
0.5718172, 0.5319127, -0.4256734, 0.4235294, 0, 1, 1,
0.5750022, 1.770714, 0.2425811, 0.427451, 0, 1, 1,
0.5788698, -0.3050638, 2.702225, 0.4352941, 0, 1, 1,
0.5802205, 0.8338574, 0.5645317, 0.4392157, 0, 1, 1,
0.582956, -0.2867884, 0.5859255, 0.4470588, 0, 1, 1,
0.586216, 0.6606832, 2.007978, 0.4509804, 0, 1, 1,
0.5905877, 0.4795977, 0.2454295, 0.4588235, 0, 1, 1,
0.5923535, 0.579393, -1.299083, 0.4627451, 0, 1, 1,
0.5925404, -0.4563158, 3.046549, 0.4705882, 0, 1, 1,
0.5926121, 1.338713, 0.7861458, 0.4745098, 0, 1, 1,
0.5929224, -0.6708866, 2.522515, 0.4823529, 0, 1, 1,
0.5944636, -0.5133917, 2.228024, 0.4862745, 0, 1, 1,
0.5945947, 0.2459487, 0.1557756, 0.4941176, 0, 1, 1,
0.6028913, 0.2996749, -0.9169785, 0.5019608, 0, 1, 1,
0.6030869, 1.932077, 0.7311928, 0.5058824, 0, 1, 1,
0.6043667, -1.009672, 1.714113, 0.5137255, 0, 1, 1,
0.6059713, -0.6062385, 2.655446, 0.5176471, 0, 1, 1,
0.6140195, 0.9645597, 0.04921458, 0.5254902, 0, 1, 1,
0.6183748, -0.9055214, 2.003037, 0.5294118, 0, 1, 1,
0.6235604, -0.5514209, 2.991762, 0.5372549, 0, 1, 1,
0.6390714, 2.327406, -0.06972922, 0.5411765, 0, 1, 1,
0.6458926, -0.06341409, 1.394093, 0.5490196, 0, 1, 1,
0.6485369, 0.7492395, 1.722978, 0.5529412, 0, 1, 1,
0.6599001, 1.792892, 0.007232449, 0.5607843, 0, 1, 1,
0.6625425, -0.142506, 3.077216, 0.5647059, 0, 1, 1,
0.6629199, 0.6115354, 0.5634586, 0.572549, 0, 1, 1,
0.6679516, 0.7093994, 0.3458876, 0.5764706, 0, 1, 1,
0.6693666, 1.376107, -0.5356328, 0.5843138, 0, 1, 1,
0.670179, -0.2593916, 1.477356, 0.5882353, 0, 1, 1,
0.6742344, -1.285829, 3.243984, 0.5960785, 0, 1, 1,
0.6746206, -0.3778433, 2.527291, 0.6039216, 0, 1, 1,
0.6807824, 0.5694196, -0.5538072, 0.6078432, 0, 1, 1,
0.6869544, -0.3446316, 2.896407, 0.6156863, 0, 1, 1,
0.6920493, 0.3350458, 1.775032, 0.6196079, 0, 1, 1,
0.6922047, -0.9686171, 1.512304, 0.627451, 0, 1, 1,
0.6950226, -1.855846, 3.108157, 0.6313726, 0, 1, 1,
0.69523, 0.5243443, 1.234454, 0.6392157, 0, 1, 1,
0.6958414, -1.51439, 2.208575, 0.6431373, 0, 1, 1,
0.6976094, 0.3723982, 0.9674665, 0.6509804, 0, 1, 1,
0.6989574, 0.958491, 0.9311872, 0.654902, 0, 1, 1,
0.6993362, -0.3090085, 1.371413, 0.6627451, 0, 1, 1,
0.7103227, 1.058945, 1.931009, 0.6666667, 0, 1, 1,
0.7210849, 1.158183, 1.66801, 0.6745098, 0, 1, 1,
0.7237117, -2.312576, 3.300531, 0.6784314, 0, 1, 1,
0.7251741, 0.02205134, 1.255255, 0.6862745, 0, 1, 1,
0.7293759, 0.1472612, 2.176637, 0.6901961, 0, 1, 1,
0.7341978, -0.8369835, 3.598849, 0.6980392, 0, 1, 1,
0.7406933, -0.8502293, 2.553529, 0.7058824, 0, 1, 1,
0.7445529, 2.149383, 1.103746, 0.7098039, 0, 1, 1,
0.7475299, 1.127481, 0.7566253, 0.7176471, 0, 1, 1,
0.7526094, -0.9802896, 2.416025, 0.7215686, 0, 1, 1,
0.7703546, -0.8203107, 0.607413, 0.7294118, 0, 1, 1,
0.7713937, -1.307531, 1.962809, 0.7333333, 0, 1, 1,
0.7738521, 0.8599527, -0.6208439, 0.7411765, 0, 1, 1,
0.7746549, -0.3285738, 3.731132, 0.7450981, 0, 1, 1,
0.7748165, -1.074972, 3.490007, 0.7529412, 0, 1, 1,
0.7810369, -0.5216981, 1.363883, 0.7568628, 0, 1, 1,
0.7838587, -0.3178197, 0.09640896, 0.7647059, 0, 1, 1,
0.7846353, 0.3189979, 0.03268665, 0.7686275, 0, 1, 1,
0.785714, 1.814133, 0.07573352, 0.7764706, 0, 1, 1,
0.7870544, 1.358056, 0.2369, 0.7803922, 0, 1, 1,
0.7893023, 2.473286, 1.097986, 0.7882353, 0, 1, 1,
0.7906028, -2.706227, 2.867644, 0.7921569, 0, 1, 1,
0.7917125, 0.1399968, 1.32701, 0.8, 0, 1, 1,
0.7927016, -0.9145523, 3.604538, 0.8078431, 0, 1, 1,
0.7954696, 0.9412029, 1.481213, 0.8117647, 0, 1, 1,
0.7961736, 0.3543155, 1.411933, 0.8196079, 0, 1, 1,
0.8023142, -0.1303276, 2.213101, 0.8235294, 0, 1, 1,
0.8032054, 1.241784, 1.896569, 0.8313726, 0, 1, 1,
0.8036972, -0.6776497, -0.4198492, 0.8352941, 0, 1, 1,
0.8065538, 0.5860596, 0.9682273, 0.8431373, 0, 1, 1,
0.8097109, -1.179498, 1.727497, 0.8470588, 0, 1, 1,
0.815092, -1.4216, 2.428616, 0.854902, 0, 1, 1,
0.816053, -1.526838, 3.196278, 0.8588235, 0, 1, 1,
0.8160942, -0.783199, 3.312628, 0.8666667, 0, 1, 1,
0.8310513, -0.9677812, 0.2940065, 0.8705882, 0, 1, 1,
0.8352186, -0.5699795, 2.505374, 0.8784314, 0, 1, 1,
0.8416046, 0.1372056, 1.547156, 0.8823529, 0, 1, 1,
0.8421311, -0.07847743, 1.402397, 0.8901961, 0, 1, 1,
0.8554648, -1.313207, 1.412331, 0.8941177, 0, 1, 1,
0.8565373, -1.267535, 0.4408099, 0.9019608, 0, 1, 1,
0.8584775, -0.7955016, 2.21838, 0.9098039, 0, 1, 1,
0.8596475, 0.6451714, 0.9366561, 0.9137255, 0, 1, 1,
0.8715262, 0.1184606, 0.6367461, 0.9215686, 0, 1, 1,
0.872111, 0.7627302, 1.994459, 0.9254902, 0, 1, 1,
0.8732857, -1.068928, 2.129715, 0.9333333, 0, 1, 1,
0.8782784, 1.05775, 0.09219795, 0.9372549, 0, 1, 1,
0.8797105, 0.0006872846, -0.5101246, 0.945098, 0, 1, 1,
0.8822935, -0.1798766, 0.8691598, 0.9490196, 0, 1, 1,
0.8832399, -1.170004, 3.19662, 0.9568627, 0, 1, 1,
0.9030619, -1.014434, 1.450727, 0.9607843, 0, 1, 1,
0.9051521, 0.3953529, 1.848885, 0.9686275, 0, 1, 1,
0.9170194, 0.8756545, 0.429924, 0.972549, 0, 1, 1,
0.9172212, 2.059793, 1.30035, 0.9803922, 0, 1, 1,
0.9187329, -1.331067, 3.517747, 0.9843137, 0, 1, 1,
0.9218152, -0.2227119, 1.109552, 0.9921569, 0, 1, 1,
0.9292457, -1.065789, 2.529204, 0.9960784, 0, 1, 1,
0.9328514, -0.2715104, 2.715173, 1, 0, 0.9960784, 1,
0.9333801, 1.023848, 2.156517, 1, 0, 0.9882353, 1,
0.9484007, -0.1843293, 1.823424, 1, 0, 0.9843137, 1,
0.9699203, -1.830356, 2.263696, 1, 0, 0.9764706, 1,
0.9724323, -0.1159942, 0.9547569, 1, 0, 0.972549, 1,
0.9887815, -0.5222231, 1.797186, 1, 0, 0.9647059, 1,
1.008267, 0.2606141, 1.086235, 1, 0, 0.9607843, 1,
1.018138, 0.282207, 2.598936, 1, 0, 0.9529412, 1,
1.033669, -0.1692049, 2.609145, 1, 0, 0.9490196, 1,
1.039332, 0.4089038, 1.525471, 1, 0, 0.9411765, 1,
1.039472, 0.1915025, 1.61635, 1, 0, 0.9372549, 1,
1.039752, 0.831357, 0.207896, 1, 0, 0.9294118, 1,
1.050069, 0.5197858, 1.778115, 1, 0, 0.9254902, 1,
1.051804, -0.7565741, 0.5530345, 1, 0, 0.9176471, 1,
1.052859, -0.1376764, 2.656775, 1, 0, 0.9137255, 1,
1.054186, -0.7973582, 2.472893, 1, 0, 0.9058824, 1,
1.056724, 1.142043, 0.7079064, 1, 0, 0.9019608, 1,
1.057382, -1.80335, 2.116843, 1, 0, 0.8941177, 1,
1.070993, -1.160249, 3.058434, 1, 0, 0.8862745, 1,
1.072955, -0.04638061, 1.740917, 1, 0, 0.8823529, 1,
1.075205, -0.04857604, 2.139559, 1, 0, 0.8745098, 1,
1.080454, -0.4996141, 2.639093, 1, 0, 0.8705882, 1,
1.086778, -0.08104125, 2.695493, 1, 0, 0.8627451, 1,
1.087539, 0.9312609, -0.4094353, 1, 0, 0.8588235, 1,
1.088298, -0.4244115, 0.8256441, 1, 0, 0.8509804, 1,
1.093973, 1.139348, 3.289415, 1, 0, 0.8470588, 1,
1.098492, 0.2077365, 1.083793, 1, 0, 0.8392157, 1,
1.112253, 0.4092814, 0.6544675, 1, 0, 0.8352941, 1,
1.114792, 1.762532, 1.132117, 1, 0, 0.827451, 1,
1.122921, -0.5570925, 2.080734, 1, 0, 0.8235294, 1,
1.124294, -0.7672046, 1.04105, 1, 0, 0.8156863, 1,
1.124975, -1.068578, 1.859374, 1, 0, 0.8117647, 1,
1.127048, 1.225596, 1.412667, 1, 0, 0.8039216, 1,
1.130804, 0.6531263, 1.505661, 1, 0, 0.7960784, 1,
1.130933, -0.5309954, 3.53175, 1, 0, 0.7921569, 1,
1.145271, -0.7388912, 3.151381, 1, 0, 0.7843137, 1,
1.155689, -1.398475, 2.373817, 1, 0, 0.7803922, 1,
1.160307, 1.012412, 2.735884, 1, 0, 0.772549, 1,
1.162518, 0.479654, -0.06809577, 1, 0, 0.7686275, 1,
1.163109, 1.145603, -0.582022, 1, 0, 0.7607843, 1,
1.164134, -0.1048434, 0.0796454, 1, 0, 0.7568628, 1,
1.164868, 0.07874689, 2.381723, 1, 0, 0.7490196, 1,
1.172115, -0.008484097, 2.391311, 1, 0, 0.7450981, 1,
1.178237, -0.1151725, 1.70763, 1, 0, 0.7372549, 1,
1.178912, -0.3342101, 1.617064, 1, 0, 0.7333333, 1,
1.182641, -0.5222737, 2.235612, 1, 0, 0.7254902, 1,
1.185604, 1.796493, 0.9706511, 1, 0, 0.7215686, 1,
1.187459, 0.1507543, 1.311263, 1, 0, 0.7137255, 1,
1.191501, 0.2359082, 0.8284497, 1, 0, 0.7098039, 1,
1.192228, -0.7878281, 2.492315, 1, 0, 0.7019608, 1,
1.209877, -0.8715816, 2.511461, 1, 0, 0.6941177, 1,
1.215797, 0.3852191, 2.01653, 1, 0, 0.6901961, 1,
1.2207, -0.8046706, 3.380016, 1, 0, 0.682353, 1,
1.224218, -2.365803, 3.325776, 1, 0, 0.6784314, 1,
1.227781, -0.5272163, 2.389191, 1, 0, 0.6705883, 1,
1.230885, 0.2601474, 1.566787, 1, 0, 0.6666667, 1,
1.234711, -0.6202097, 4.187835, 1, 0, 0.6588235, 1,
1.239483, 0.4087446, 1.591322, 1, 0, 0.654902, 1,
1.240339, 1.876465, 1.738164, 1, 0, 0.6470588, 1,
1.247622, 0.930887, 1.152022, 1, 0, 0.6431373, 1,
1.248385, 0.6181355, 1.040788, 1, 0, 0.6352941, 1,
1.248474, 0.2297186, 1.108028, 1, 0, 0.6313726, 1,
1.259316, -0.3943026, 1.836664, 1, 0, 0.6235294, 1,
1.262221, 0.8464364, 0.5824919, 1, 0, 0.6196079, 1,
1.271885, 1.268085, -0.04801481, 1, 0, 0.6117647, 1,
1.273503, -0.1823675, 0.0591206, 1, 0, 0.6078432, 1,
1.274773, -0.5482643, 1.291332, 1, 0, 0.6, 1,
1.277023, 2.308681, 0.07631861, 1, 0, 0.5921569, 1,
1.286817, 0.1137549, 1.344415, 1, 0, 0.5882353, 1,
1.30262, -2.224435, 2.136667, 1, 0, 0.5803922, 1,
1.303244, -0.7816411, 3.951219, 1, 0, 0.5764706, 1,
1.308454, -0.4193679, 1.498659, 1, 0, 0.5686275, 1,
1.316987, 0.1533808, 1.41356, 1, 0, 0.5647059, 1,
1.331803, -2.08095, 3.944122, 1, 0, 0.5568628, 1,
1.338086, 1.130996, 0.3228265, 1, 0, 0.5529412, 1,
1.340698, -1.089278, 2.26726, 1, 0, 0.5450981, 1,
1.348693, -0.9562267, 2.439471, 1, 0, 0.5411765, 1,
1.368094, 1.661463, 1.072719, 1, 0, 0.5333334, 1,
1.376386, 1.163319, 1.068663, 1, 0, 0.5294118, 1,
1.379524, 0.4488992, 1.302812, 1, 0, 0.5215687, 1,
1.379667, 0.5746725, 1.543954, 1, 0, 0.5176471, 1,
1.386895, -1.031799, 0.957098, 1, 0, 0.509804, 1,
1.387559, 1.23433, 0.1490898, 1, 0, 0.5058824, 1,
1.396931, -1.032909, 3.04905, 1, 0, 0.4980392, 1,
1.399159, -0.4844809, 1.495101, 1, 0, 0.4901961, 1,
1.404981, -1.118962, 1.514836, 1, 0, 0.4862745, 1,
1.414772, -0.1389884, 0.9559708, 1, 0, 0.4784314, 1,
1.42055, 0.1212821, 0.512761, 1, 0, 0.4745098, 1,
1.422428, -2.307596, 3.10125, 1, 0, 0.4666667, 1,
1.428622, -1.430989, 2.613737, 1, 0, 0.4627451, 1,
1.429193, 0.5602229, 1.300928, 1, 0, 0.454902, 1,
1.435091, 0.5957786, 0.852726, 1, 0, 0.4509804, 1,
1.441164, 1.223736, -0.2483627, 1, 0, 0.4431373, 1,
1.441697, 1.04881, -0.2809466, 1, 0, 0.4392157, 1,
1.450004, 0.4564887, -0.02966043, 1, 0, 0.4313726, 1,
1.452224, 1.114573, 1.18927, 1, 0, 0.427451, 1,
1.45946, 1.193835, 1.792335, 1, 0, 0.4196078, 1,
1.460193, 0.8681043, 0.7836564, 1, 0, 0.4156863, 1,
1.480363, 0.07752143, 2.193548, 1, 0, 0.4078431, 1,
1.485525, 0.6168787, -0.2455661, 1, 0, 0.4039216, 1,
1.487102, -1.972454, 3.452007, 1, 0, 0.3960784, 1,
1.489852, 1.111784, 1.52114, 1, 0, 0.3882353, 1,
1.490513, 0.1137406, 1.662266, 1, 0, 0.3843137, 1,
1.507694, 0.1230272, 1.179235, 1, 0, 0.3764706, 1,
1.509331, 0.3182663, 0.7401248, 1, 0, 0.372549, 1,
1.513224, -0.1658098, 2.284707, 1, 0, 0.3647059, 1,
1.513928, 0.5434208, 1.433699, 1, 0, 0.3607843, 1,
1.522517, 0.8846964, 0.9981824, 1, 0, 0.3529412, 1,
1.529179, -0.8633603, 1.111761, 1, 0, 0.3490196, 1,
1.531451, -1.402947, 1.493391, 1, 0, 0.3411765, 1,
1.535526, -1.545763, 2.569035, 1, 0, 0.3372549, 1,
1.542644, -0.7672626, 2.227759, 1, 0, 0.3294118, 1,
1.547812, -1.127187, 2.1603, 1, 0, 0.3254902, 1,
1.559533, 0.002239687, 0.2716399, 1, 0, 0.3176471, 1,
1.567075, 0.4931132, 0.4465187, 1, 0, 0.3137255, 1,
1.568635, 0.8265473, -1.469709, 1, 0, 0.3058824, 1,
1.569036, -0.02808693, 1.169693, 1, 0, 0.2980392, 1,
1.575665, 0.4728204, 1.333773, 1, 0, 0.2941177, 1,
1.589058, -0.0005131016, 2.540953, 1, 0, 0.2862745, 1,
1.619986, 0.2306676, 1.447164, 1, 0, 0.282353, 1,
1.629064, -2.12446, 2.200745, 1, 0, 0.2745098, 1,
1.633119, 1.716351, 2.270707, 1, 0, 0.2705882, 1,
1.645176, -1.735031, 1.032561, 1, 0, 0.2627451, 1,
1.649119, -0.03813552, 2.127943, 1, 0, 0.2588235, 1,
1.658365, 0.3070983, 0.7093941, 1, 0, 0.2509804, 1,
1.67477, -0.5525194, 2.914836, 1, 0, 0.2470588, 1,
1.685601, 0.7046699, 1.69044, 1, 0, 0.2392157, 1,
1.717369, 0.1976311, 2.723609, 1, 0, 0.2352941, 1,
1.718557, -0.7807398, 0.9553891, 1, 0, 0.227451, 1,
1.746784, -0.4103173, 0.7325543, 1, 0, 0.2235294, 1,
1.750874, 0.7526546, 0.6445686, 1, 0, 0.2156863, 1,
1.80441, 0.3112367, 0.828391, 1, 0, 0.2117647, 1,
1.817153, -1.247173, 2.350581, 1, 0, 0.2039216, 1,
1.836822, 1.86783, 1.193324, 1, 0, 0.1960784, 1,
1.838495, 0.6184213, 0.4512316, 1, 0, 0.1921569, 1,
1.848569, 0.5750907, 2.138479, 1, 0, 0.1843137, 1,
1.853258, 1.354964, -1.247934, 1, 0, 0.1803922, 1,
1.879573, 0.3097725, 2.410136, 1, 0, 0.172549, 1,
1.888839, 1.221192, 1.541332, 1, 0, 0.1686275, 1,
1.901938, 0.4342173, 1.263973, 1, 0, 0.1607843, 1,
1.937547, -0.129334, 1.611285, 1, 0, 0.1568628, 1,
1.960103, 2.692164, 0.6797908, 1, 0, 0.1490196, 1,
1.990758, 1.716458, 0.5357197, 1, 0, 0.145098, 1,
1.99804, -0.7917904, 1.284876, 1, 0, 0.1372549, 1,
2.000245, 0.1451614, 0.02678466, 1, 0, 0.1333333, 1,
2.008052, 0.2711871, 0.3968198, 1, 0, 0.1254902, 1,
2.025734, -1.122706, 1.450329, 1, 0, 0.1215686, 1,
2.067291, 1.560467, 0.6360656, 1, 0, 0.1137255, 1,
2.092473, -2.546569, 3.138948, 1, 0, 0.1098039, 1,
2.103878, -0.3001499, 0.2530207, 1, 0, 0.1019608, 1,
2.125212, -0.173284, 1.721481, 1, 0, 0.09411765, 1,
2.140475, -0.8182564, 2.607804, 1, 0, 0.09019608, 1,
2.153959, -0.3301077, 2.512426, 1, 0, 0.08235294, 1,
2.18063, -1.200537, 3.589455, 1, 0, 0.07843138, 1,
2.222064, 0.3958933, 2.557323, 1, 0, 0.07058824, 1,
2.24699, -1.095763, 2.379829, 1, 0, 0.06666667, 1,
2.276486, -0.1730685, 0.9664725, 1, 0, 0.05882353, 1,
2.309318, 1.946188, 0.7070412, 1, 0, 0.05490196, 1,
2.352514, 1.200142, 1.128159, 1, 0, 0.04705882, 1,
2.444298, -0.2908222, 2.581615, 1, 0, 0.04313726, 1,
2.46833, 0.3213276, 2.764961, 1, 0, 0.03529412, 1,
2.543658, 0.1819734, 0.4975938, 1, 0, 0.03137255, 1,
2.588976, 0.1236186, 1.282684, 1, 0, 0.02352941, 1,
2.62833, 0.5697261, -0.3721805, 1, 0, 0.01960784, 1,
2.942522, 1.045734, 0.7840037, 1, 0, 0.01176471, 1,
3.293416, 0.5465645, 0.8809023, 1, 0, 0.007843138, 1
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
0.2484233, -3.940014, -6.623273, 0, -0.5, 0.5, 0.5,
0.2484233, -3.940014, -6.623273, 1, -0.5, 0.5, 0.5,
0.2484233, -3.940014, -6.623273, 1, 1.5, 0.5, 0.5,
0.2484233, -3.940014, -6.623273, 0, 1.5, 0.5, 0.5
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
-3.828822, 0.05936027, -6.623273, 0, -0.5, 0.5, 0.5,
-3.828822, 0.05936027, -6.623273, 1, -0.5, 0.5, 0.5,
-3.828822, 0.05936027, -6.623273, 1, 1.5, 0.5, 0.5,
-3.828822, 0.05936027, -6.623273, 0, 1.5, 0.5, 0.5
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
-3.828822, -3.940014, 0.4213884, 0, -0.5, 0.5, 0.5,
-3.828822, -3.940014, 0.4213884, 1, -0.5, 0.5, 0.5,
-3.828822, -3.940014, 0.4213884, 1, 1.5, 0.5, 0.5,
-3.828822, -3.940014, 0.4213884, 0, 1.5, 0.5, 0.5
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
-2, -3.017081, -4.997582,
3, -3.017081, -4.997582,
-2, -3.017081, -4.997582,
-2, -3.170903, -5.26853,
-1, -3.017081, -4.997582,
-1, -3.170903, -5.26853,
0, -3.017081, -4.997582,
0, -3.170903, -5.26853,
1, -3.017081, -4.997582,
1, -3.170903, -5.26853,
2, -3.017081, -4.997582,
2, -3.170903, -5.26853,
3, -3.017081, -4.997582,
3, -3.170903, -5.26853
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
-2, -3.478548, -5.810428, 0, -0.5, 0.5, 0.5,
-2, -3.478548, -5.810428, 1, -0.5, 0.5, 0.5,
-2, -3.478548, -5.810428, 1, 1.5, 0.5, 0.5,
-2, -3.478548, -5.810428, 0, 1.5, 0.5, 0.5,
-1, -3.478548, -5.810428, 0, -0.5, 0.5, 0.5,
-1, -3.478548, -5.810428, 1, -0.5, 0.5, 0.5,
-1, -3.478548, -5.810428, 1, 1.5, 0.5, 0.5,
-1, -3.478548, -5.810428, 0, 1.5, 0.5, 0.5,
0, -3.478548, -5.810428, 0, -0.5, 0.5, 0.5,
0, -3.478548, -5.810428, 1, -0.5, 0.5, 0.5,
0, -3.478548, -5.810428, 1, 1.5, 0.5, 0.5,
0, -3.478548, -5.810428, 0, 1.5, 0.5, 0.5,
1, -3.478548, -5.810428, 0, -0.5, 0.5, 0.5,
1, -3.478548, -5.810428, 1, -0.5, 0.5, 0.5,
1, -3.478548, -5.810428, 1, 1.5, 0.5, 0.5,
1, -3.478548, -5.810428, 0, 1.5, 0.5, 0.5,
2, -3.478548, -5.810428, 0, -0.5, 0.5, 0.5,
2, -3.478548, -5.810428, 1, -0.5, 0.5, 0.5,
2, -3.478548, -5.810428, 1, 1.5, 0.5, 0.5,
2, -3.478548, -5.810428, 0, 1.5, 0.5, 0.5,
3, -3.478548, -5.810428, 0, -0.5, 0.5, 0.5,
3, -3.478548, -5.810428, 1, -0.5, 0.5, 0.5,
3, -3.478548, -5.810428, 1, 1.5, 0.5, 0.5,
3, -3.478548, -5.810428, 0, 1.5, 0.5, 0.5
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
-2.887919, -2, -4.997582,
-2.887919, 3, -4.997582,
-2.887919, -2, -4.997582,
-3.044737, -2, -5.26853,
-2.887919, -1, -4.997582,
-3.044737, -1, -5.26853,
-2.887919, 0, -4.997582,
-3.044737, 0, -5.26853,
-2.887919, 1, -4.997582,
-3.044737, 1, -5.26853,
-2.887919, 2, -4.997582,
-3.044737, 2, -5.26853,
-2.887919, 3, -4.997582,
-3.044737, 3, -5.26853
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
-3.358371, -2, -5.810428, 0, -0.5, 0.5, 0.5,
-3.358371, -2, -5.810428, 1, -0.5, 0.5, 0.5,
-3.358371, -2, -5.810428, 1, 1.5, 0.5, 0.5,
-3.358371, -2, -5.810428, 0, 1.5, 0.5, 0.5,
-3.358371, -1, -5.810428, 0, -0.5, 0.5, 0.5,
-3.358371, -1, -5.810428, 1, -0.5, 0.5, 0.5,
-3.358371, -1, -5.810428, 1, 1.5, 0.5, 0.5,
-3.358371, -1, -5.810428, 0, 1.5, 0.5, 0.5,
-3.358371, 0, -5.810428, 0, -0.5, 0.5, 0.5,
-3.358371, 0, -5.810428, 1, -0.5, 0.5, 0.5,
-3.358371, 0, -5.810428, 1, 1.5, 0.5, 0.5,
-3.358371, 0, -5.810428, 0, 1.5, 0.5, 0.5,
-3.358371, 1, -5.810428, 0, -0.5, 0.5, 0.5,
-3.358371, 1, -5.810428, 1, -0.5, 0.5, 0.5,
-3.358371, 1, -5.810428, 1, 1.5, 0.5, 0.5,
-3.358371, 1, -5.810428, 0, 1.5, 0.5, 0.5,
-3.358371, 2, -5.810428, 0, -0.5, 0.5, 0.5,
-3.358371, 2, -5.810428, 1, -0.5, 0.5, 0.5,
-3.358371, 2, -5.810428, 1, 1.5, 0.5, 0.5,
-3.358371, 2, -5.810428, 0, 1.5, 0.5, 0.5,
-3.358371, 3, -5.810428, 0, -0.5, 0.5, 0.5,
-3.358371, 3, -5.810428, 1, -0.5, 0.5, 0.5,
-3.358371, 3, -5.810428, 1, 1.5, 0.5, 0.5,
-3.358371, 3, -5.810428, 0, 1.5, 0.5, 0.5
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
-2.887919, -3.017081, -4,
-2.887919, -3.017081, 4,
-2.887919, -3.017081, -4,
-3.044737, -3.170903, -4,
-2.887919, -3.017081, -2,
-3.044737, -3.170903, -2,
-2.887919, -3.017081, 0,
-3.044737, -3.170903, 0,
-2.887919, -3.017081, 2,
-3.044737, -3.170903, 2,
-2.887919, -3.017081, 4,
-3.044737, -3.170903, 4
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
-3.358371, -3.478548, -4, 0, -0.5, 0.5, 0.5,
-3.358371, -3.478548, -4, 1, -0.5, 0.5, 0.5,
-3.358371, -3.478548, -4, 1, 1.5, 0.5, 0.5,
-3.358371, -3.478548, -4, 0, 1.5, 0.5, 0.5,
-3.358371, -3.478548, -2, 0, -0.5, 0.5, 0.5,
-3.358371, -3.478548, -2, 1, -0.5, 0.5, 0.5,
-3.358371, -3.478548, -2, 1, 1.5, 0.5, 0.5,
-3.358371, -3.478548, -2, 0, 1.5, 0.5, 0.5,
-3.358371, -3.478548, 0, 0, -0.5, 0.5, 0.5,
-3.358371, -3.478548, 0, 1, -0.5, 0.5, 0.5,
-3.358371, -3.478548, 0, 1, 1.5, 0.5, 0.5,
-3.358371, -3.478548, 0, 0, 1.5, 0.5, 0.5,
-3.358371, -3.478548, 2, 0, -0.5, 0.5, 0.5,
-3.358371, -3.478548, 2, 1, -0.5, 0.5, 0.5,
-3.358371, -3.478548, 2, 1, 1.5, 0.5, 0.5,
-3.358371, -3.478548, 2, 0, 1.5, 0.5, 0.5,
-3.358371, -3.478548, 4, 0, -0.5, 0.5, 0.5,
-3.358371, -3.478548, 4, 1, -0.5, 0.5, 0.5,
-3.358371, -3.478548, 4, 1, 1.5, 0.5, 0.5,
-3.358371, -3.478548, 4, 0, 1.5, 0.5, 0.5
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
-2.887919, -3.017081, -4.997582,
-2.887919, 3.135802, -4.997582,
-2.887919, -3.017081, 5.840359,
-2.887919, 3.135802, 5.840359,
-2.887919, -3.017081, -4.997582,
-2.887919, -3.017081, 5.840359,
-2.887919, 3.135802, -4.997582,
-2.887919, 3.135802, 5.840359,
-2.887919, -3.017081, -4.997582,
3.384766, -3.017081, -4.997582,
-2.887919, -3.017081, 5.840359,
3.384766, -3.017081, 5.840359,
-2.887919, 3.135802, -4.997582,
3.384766, 3.135802, -4.997582,
-2.887919, 3.135802, 5.840359,
3.384766, 3.135802, 5.840359,
3.384766, -3.017081, -4.997582,
3.384766, 3.135802, -4.997582,
3.384766, -3.017081, 5.840359,
3.384766, 3.135802, 5.840359,
3.384766, -3.017081, -4.997582,
3.384766, -3.017081, 5.840359,
3.384766, 3.135802, -4.997582,
3.384766, 3.135802, 5.840359
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
var radius = 7.450235;
var distance = 33.14694;
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
mvMatrix.translate( -0.2484233, -0.05936027, -0.4213884 );
mvMatrix.scale( 1.284193, 1.309198, 0.7432538 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.14694);
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
thionazin<-read.table("thionazin.xyz")
```

```
## Error in read.table("thionazin.xyz"): no lines available in input
```

```r
x<-thionazin$V2
```

```
## Error in eval(expr, envir, enclos): object 'thionazin' not found
```

```r
y<-thionazin$V3
```

```
## Error in eval(expr, envir, enclos): object 'thionazin' not found
```

```r
z<-thionazin$V4
```

```
## Error in eval(expr, envir, enclos): object 'thionazin' not found
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
-2.79657, -1.169543, -1.726936, 0, 0, 1, 1, 1,
-2.652315, -0.5702456, -2.200423, 1, 0, 0, 1, 1,
-2.552663, -0.3233978, -1.457468, 1, 0, 0, 1, 1,
-2.536789, -1.841111, -1.966553, 1, 0, 0, 1, 1,
-2.390808, -0.0835187, -2.716372, 1, 0, 0, 1, 1,
-2.362787, -1.443964, -1.99902, 1, 0, 0, 1, 1,
-2.284352, -0.9345627, -0.9313211, 0, 0, 0, 1, 1,
-2.25029, -0.6394525, -1.439064, 0, 0, 0, 1, 1,
-2.174961, 0.2022943, -2.854559, 0, 0, 0, 1, 1,
-2.16938, 1.10018, 0.2850754, 0, 0, 0, 1, 1,
-2.149405, -0.2227722, -1.350786, 0, 0, 0, 1, 1,
-2.112407, -1.881137, -2.38184, 0, 0, 0, 1, 1,
-2.101998, 0.4492219, -1.754963, 0, 0, 0, 1, 1,
-2.050275, -0.1629108, -3.019793, 1, 1, 1, 1, 1,
-2.032928, 3.046197, -0.7685273, 1, 1, 1, 1, 1,
-2.002626, 1.150652, -0.899286, 1, 1, 1, 1, 1,
-2.002392, -0.8841656, -1.727619, 1, 1, 1, 1, 1,
-2.000082, 1.306813, -0.7787457, 1, 1, 1, 1, 1,
-1.999449, -0.8477852, -1.874978, 1, 1, 1, 1, 1,
-1.964196, 0.6177366, -2.589195, 1, 1, 1, 1, 1,
-1.955212, -0.5000386, -2.702848, 1, 1, 1, 1, 1,
-1.950606, 0.6321142, -1.124115, 1, 1, 1, 1, 1,
-1.941934, 1.178809, -2.644664, 1, 1, 1, 1, 1,
-1.934594, 1.501739, -2.303244, 1, 1, 1, 1, 1,
-1.930728, 0.1180884, -1.536962, 1, 1, 1, 1, 1,
-1.916865, -0.7556708, -3.17982, 1, 1, 1, 1, 1,
-1.883728, -1.448971, -2.536056, 1, 1, 1, 1, 1,
-1.877127, 0.1854035, -2.549999, 1, 1, 1, 1, 1,
-1.864239, 0.5412413, -1.949929, 0, 0, 1, 1, 1,
-1.849943, 0.1560405, -0.6229511, 1, 0, 0, 1, 1,
-1.84309, -0.8646076, -1.672843, 1, 0, 0, 1, 1,
-1.833862, 1.385911, -0.5541851, 1, 0, 0, 1, 1,
-1.832573, -0.4491991, -1.615048, 1, 0, 0, 1, 1,
-1.816455, 0.895269, -1.102464, 1, 0, 0, 1, 1,
-1.80441, 1.176797, -2.193984, 0, 0, 0, 1, 1,
-1.798133, -1.694728, -2.173637, 0, 0, 0, 1, 1,
-1.797288, -0.2967897, -3.194077, 0, 0, 0, 1, 1,
-1.794133, -0.2570284, -1.921688, 0, 0, 0, 1, 1,
-1.782259, 0.217383, -2.447283, 0, 0, 0, 1, 1,
-1.779372, 0.3487651, -2.611692, 0, 0, 0, 1, 1,
-1.777991, -1.432251, -2.638391, 0, 0, 0, 1, 1,
-1.757517, 0.2099671, -3.630008, 1, 1, 1, 1, 1,
-1.750473, -0.5048621, -0.9965315, 1, 1, 1, 1, 1,
-1.732823, -1.342042, -1.992278, 1, 1, 1, 1, 1,
-1.728564, -1.544998, -1.827964, 1, 1, 1, 1, 1,
-1.724666, -0.7172183, -1.122434, 1, 1, 1, 1, 1,
-1.715533, 0.8221686, -0.9696399, 1, 1, 1, 1, 1,
-1.691021, -0.5335245, -1.660239, 1, 1, 1, 1, 1,
-1.676504, 0.2053515, -2.423683, 1, 1, 1, 1, 1,
-1.668564, 0.6348422, -0.2526817, 1, 1, 1, 1, 1,
-1.651583, -0.2462213, -2.708817, 1, 1, 1, 1, 1,
-1.649658, -0.8661908, -2.66729, 1, 1, 1, 1, 1,
-1.630119, 0.7232844, -1.670426, 1, 1, 1, 1, 1,
-1.620018, 0.09186721, -2.348621, 1, 1, 1, 1, 1,
-1.612658, 0.470541, -1.863882, 1, 1, 1, 1, 1,
-1.611139, 0.7940988, -1.272877, 1, 1, 1, 1, 1,
-1.605807, 0.04732611, 0.1676112, 0, 0, 1, 1, 1,
-1.604601, 1.838168, 0.5055487, 1, 0, 0, 1, 1,
-1.588458, -0.4428921, -2.86899, 1, 0, 0, 1, 1,
-1.570184, 0.2362716, -1.900455, 1, 0, 0, 1, 1,
-1.563809, 1.031688, -1.444649, 1, 0, 0, 1, 1,
-1.551929, 1.484209, -2.533304, 1, 0, 0, 1, 1,
-1.549232, 0.4430586, -1.906924, 0, 0, 0, 1, 1,
-1.547261, -0.8743137, -1.229891, 0, 0, 0, 1, 1,
-1.546705, 0.4409491, -0.1786401, 0, 0, 0, 1, 1,
-1.5286, -0.4310704, -0.727156, 0, 0, 0, 1, 1,
-1.526557, 0.2429151, -1.345053, 0, 0, 0, 1, 1,
-1.509646, 1.066267, -2.966172, 0, 0, 0, 1, 1,
-1.500457, -1.958145, -1.034968, 0, 0, 0, 1, 1,
-1.493808, 0.5673609, 0.1167315, 1, 1, 1, 1, 1,
-1.492656, 0.4447687, -2.997763, 1, 1, 1, 1, 1,
-1.485011, -0.07191467, -1.642517, 1, 1, 1, 1, 1,
-1.480404, 0.2338473, -0.5940765, 1, 1, 1, 1, 1,
-1.473965, -0.6270482, -0.3601257, 1, 1, 1, 1, 1,
-1.470782, -0.9393615, -1.528284, 1, 1, 1, 1, 1,
-1.452339, 1.010897, -1.014046, 1, 1, 1, 1, 1,
-1.443657, 0.1307305, -0.7989109, 1, 1, 1, 1, 1,
-1.443607, 0.1606587, -1.64988, 1, 1, 1, 1, 1,
-1.436377, 0.138887, -1.786973, 1, 1, 1, 1, 1,
-1.435776, 0.08863858, -1.096695, 1, 1, 1, 1, 1,
-1.433269, 1.021144, -2.757681, 1, 1, 1, 1, 1,
-1.426018, -1.220165, -1.425805, 1, 1, 1, 1, 1,
-1.41867, -0.6835623, -2.688347, 1, 1, 1, 1, 1,
-1.414596, 0.5726622, -1.437399, 1, 1, 1, 1, 1,
-1.412498, 2.126845, 0.5373914, 0, 0, 1, 1, 1,
-1.41063, 1.282476, -0.8872987, 1, 0, 0, 1, 1,
-1.39501, 0.1479373, -3.264145, 1, 0, 0, 1, 1,
-1.393946, 0.2688278, -1.447803, 1, 0, 0, 1, 1,
-1.392151, -0.1590256, -1.549114, 1, 0, 0, 1, 1,
-1.38328, -0.7252989, -1.691039, 1, 0, 0, 1, 1,
-1.380377, 0.2536306, -1.688643, 0, 0, 0, 1, 1,
-1.374526, -0.03654834, -2.138364, 0, 0, 0, 1, 1,
-1.368493, 0.280545, -0.8448715, 0, 0, 0, 1, 1,
-1.36841, -0.5060995, -4.383489, 0, 0, 0, 1, 1,
-1.360576, 0.1258858, -1.239437, 0, 0, 0, 1, 1,
-1.359773, 0.3453964, -1.205205, 0, 0, 0, 1, 1,
-1.351332, -0.1739834, -2.878599, 0, 0, 0, 1, 1,
-1.349317, 0.3515567, -0.03185185, 1, 1, 1, 1, 1,
-1.348833, 0.1815218, -1.877972, 1, 1, 1, 1, 1,
-1.34252, -1.082335, -1.963704, 1, 1, 1, 1, 1,
-1.3415, -0.3129538, -1.556528, 1, 1, 1, 1, 1,
-1.337651, 0.1661841, -0.3569063, 1, 1, 1, 1, 1,
-1.303834, -0.6211907, -3.238635, 1, 1, 1, 1, 1,
-1.29625, 0.666244, -1.892155, 1, 1, 1, 1, 1,
-1.29286, -0.4558438, -0.06190452, 1, 1, 1, 1, 1,
-1.291351, -0.5081459, -2.171449, 1, 1, 1, 1, 1,
-1.286827, 0.3305055, -1.728339, 1, 1, 1, 1, 1,
-1.286348, 0.6495671, -1.273281, 1, 1, 1, 1, 1,
-1.283927, 0.0005705502, -1.835345, 1, 1, 1, 1, 1,
-1.280499, 0.1340726, -2.847948, 1, 1, 1, 1, 1,
-1.273635, 0.9227806, -1.038694, 1, 1, 1, 1, 1,
-1.267255, -1.013068, -1.826453, 1, 1, 1, 1, 1,
-1.257939, 1.575518, -1.755187, 0, 0, 1, 1, 1,
-1.257205, 1.467436, -0.907649, 1, 0, 0, 1, 1,
-1.256454, -0.03606344, -1.9211, 1, 0, 0, 1, 1,
-1.2451, -1.108, -1.86145, 1, 0, 0, 1, 1,
-1.242162, 0.7376505, -2.149189, 1, 0, 0, 1, 1,
-1.224461, -1.106749, -3.177823, 1, 0, 0, 1, 1,
-1.222806, -0.6138939, -1.643395, 0, 0, 0, 1, 1,
-1.217501, 0.5165143, -1.820389, 0, 0, 0, 1, 1,
-1.210897, -1.057192, -1.369686, 0, 0, 0, 1, 1,
-1.204805, -0.7870286, -2.062632, 0, 0, 0, 1, 1,
-1.203362, -0.3789375, -1.421294, 0, 0, 0, 1, 1,
-1.181529, 0.6065713, -2.366428, 0, 0, 0, 1, 1,
-1.176959, -0.2028003, -2.367857, 0, 0, 0, 1, 1,
-1.1754, 0.01025845, -1.77851, 1, 1, 1, 1, 1,
-1.173632, -1.276778, -2.777054, 1, 1, 1, 1, 1,
-1.162585, -0.2586618, -3.142078, 1, 1, 1, 1, 1,
-1.157369, -0.03532192, -1.048973, 1, 1, 1, 1, 1,
-1.147929, -1.773279, -2.962059, 1, 1, 1, 1, 1,
-1.144415, 0.06724066, -1.069727, 1, 1, 1, 1, 1,
-1.14002, -1.057306, 0.7898076, 1, 1, 1, 1, 1,
-1.137933, -0.7499045, -2.804468, 1, 1, 1, 1, 1,
-1.134105, -0.3337616, -1.583478, 1, 1, 1, 1, 1,
-1.11677, 0.08129566, -0.2779854, 1, 1, 1, 1, 1,
-1.114498, -1.709298, -0.4184536, 1, 1, 1, 1, 1,
-1.113408, -0.971068, -2.55903, 1, 1, 1, 1, 1,
-1.110627, -0.2053976, -3.270742, 1, 1, 1, 1, 1,
-1.104571, -0.5693976, -0.4895804, 1, 1, 1, 1, 1,
-1.094873, 0.4466015, -0.514156, 1, 1, 1, 1, 1,
-1.091056, 0.244316, -1.983106, 0, 0, 1, 1, 1,
-1.084698, -0.4946931, -0.8112772, 1, 0, 0, 1, 1,
-1.083184, -0.7191527, -1.620264, 1, 0, 0, 1, 1,
-1.082736, -0.7022926, -1.526336, 1, 0, 0, 1, 1,
-1.078187, 1.307514, 1.035928, 1, 0, 0, 1, 1,
-1.072364, 0.7401633, -0.002950917, 1, 0, 0, 1, 1,
-1.072146, -2.927476, -4.546564, 0, 0, 0, 1, 1,
-1.071333, 0.7115119, 0.1044073, 0, 0, 0, 1, 1,
-1.065434, -2.32059, -2.179129, 0, 0, 0, 1, 1,
-1.064356, -1.891937, -2.736383, 0, 0, 0, 1, 1,
-1.056381, -0.04348573, -3.223672, 0, 0, 0, 1, 1,
-1.051853, -0.5123583, -1.097305, 0, 0, 0, 1, 1,
-1.051593, -0.1017329, -2.389999, 0, 0, 0, 1, 1,
-1.043376, -0.7591608, -1.880162, 1, 1, 1, 1, 1,
-1.034363, 1.056375, -0.650866, 1, 1, 1, 1, 1,
-1.029931, 0.8943284, -0.3744604, 1, 1, 1, 1, 1,
-1.022416, 1.445104, 1.119617, 1, 1, 1, 1, 1,
-1.021736, -0.6301538, -1.353109, 1, 1, 1, 1, 1,
-1.020042, -0.6839581, -0.9996766, 1, 1, 1, 1, 1,
-1.015055, -0.1655973, -1.839045, 1, 1, 1, 1, 1,
-1.015023, 0.07353199, -1.973433, 1, 1, 1, 1, 1,
-1.014861, 1.115679, -0.4922879, 1, 1, 1, 1, 1,
-1.000803, 0.2256025, 0.254006, 1, 1, 1, 1, 1,
-0.9945602, -0.1412158, -2.081266, 1, 1, 1, 1, 1,
-0.9921947, 0.7202694, -1.570025, 1, 1, 1, 1, 1,
-0.9890602, -1.611159, -1.310696, 1, 1, 1, 1, 1,
-0.9838036, -1.31335, -2.917014, 1, 1, 1, 1, 1,
-0.98195, -0.4481891, -2.605958, 1, 1, 1, 1, 1,
-0.980823, -1.03845, -3.128802, 0, 0, 1, 1, 1,
-0.9776716, -0.379932, -2.831452, 1, 0, 0, 1, 1,
-0.9719116, 2.740781, 0.1712713, 1, 0, 0, 1, 1,
-0.9673051, 0.3820044, -1.651355, 1, 0, 0, 1, 1,
-0.9665587, 0.3454427, -0.4523151, 1, 0, 0, 1, 1,
-0.9663417, 0.9303526, -0.809448, 1, 0, 0, 1, 1,
-0.9639379, 1.536764, -1.026613, 0, 0, 0, 1, 1,
-0.9638367, -0.8656757, -1.46515, 0, 0, 0, 1, 1,
-0.9618096, -0.949949, -3.374515, 0, 0, 0, 1, 1,
-0.955055, -1.079913, -1.883697, 0, 0, 0, 1, 1,
-0.9535862, -0.1298463, 0.1164491, 0, 0, 0, 1, 1,
-0.9471983, 0.9627056, -1.65239, 0, 0, 0, 1, 1,
-0.9446169, -0.2306357, 0.2698985, 0, 0, 0, 1, 1,
-0.94374, -0.9809917, -0.4340594, 1, 1, 1, 1, 1,
-0.9398999, 0.4042729, -0.01848968, 1, 1, 1, 1, 1,
-0.9397615, -0.1805897, -2.424788, 1, 1, 1, 1, 1,
-0.9343687, 1.496257, 0.9286575, 1, 1, 1, 1, 1,
-0.9148785, -0.556936, -0.3921787, 1, 1, 1, 1, 1,
-0.9126641, 0.6727545, -0.3977317, 1, 1, 1, 1, 1,
-0.9095287, 1.203931, -0.8037497, 1, 1, 1, 1, 1,
-0.9086468, 1.864676, 0.3082847, 1, 1, 1, 1, 1,
-0.9065815, 0.0528039, -1.845435, 1, 1, 1, 1, 1,
-0.9064447, 0.1371925, -0.07168986, 1, 1, 1, 1, 1,
-0.90363, -0.1507082, -2.345039, 1, 1, 1, 1, 1,
-0.89982, -0.04280244, -0.631044, 1, 1, 1, 1, 1,
-0.8880292, -0.8988867, -3.194228, 1, 1, 1, 1, 1,
-0.8846316, -0.1598664, -2.431362, 1, 1, 1, 1, 1,
-0.882128, -1.508699, -3.692417, 1, 1, 1, 1, 1,
-0.8788074, 0.5995261, -1.435311, 0, 0, 1, 1, 1,
-0.8776438, 0.7144114, 0.8881639, 1, 0, 0, 1, 1,
-0.8726647, 0.1246974, -2.013792, 1, 0, 0, 1, 1,
-0.8686424, -0.6215999, -0.5921018, 1, 0, 0, 1, 1,
-0.8685326, -0.7890244, -2.149249, 1, 0, 0, 1, 1,
-0.8671455, 0.08816918, -2.51823, 1, 0, 0, 1, 1,
-0.8590142, -0.9145202, -3.243906, 0, 0, 0, 1, 1,
-0.8565037, 0.1700325, -1.553921, 0, 0, 0, 1, 1,
-0.8553858, 1.932607, -0.9627747, 0, 0, 0, 1, 1,
-0.8520456, -2.00581, -2.417854, 0, 0, 0, 1, 1,
-0.8514127, -0.2042529, -2.009977, 0, 0, 0, 1, 1,
-0.8469282, -0.8746141, -4.839748, 0, 0, 0, 1, 1,
-0.8459942, -0.04601173, -0.976867, 0, 0, 0, 1, 1,
-0.8458229, -0.2655936, -2.661684, 1, 1, 1, 1, 1,
-0.8428291, -0.2999173, -0.3573281, 1, 1, 1, 1, 1,
-0.840361, -0.03314421, -0.215366, 1, 1, 1, 1, 1,
-0.8319805, -0.8834103, -0.7278739, 1, 1, 1, 1, 1,
-0.8278078, 0.9562712, 0.9753716, 1, 1, 1, 1, 1,
-0.8185339, 0.6398681, -1.62241, 1, 1, 1, 1, 1,
-0.8177577, -1.119026, -1.820233, 1, 1, 1, 1, 1,
-0.8155183, 0.5447164, -1.192274, 1, 1, 1, 1, 1,
-0.8053287, -0.08241263, -0.8386139, 1, 1, 1, 1, 1,
-0.8032705, 1.940271, -1.566646, 1, 1, 1, 1, 1,
-0.8012531, -1.427901, -2.602869, 1, 1, 1, 1, 1,
-0.7999969, 0.2923864, -1.989669, 1, 1, 1, 1, 1,
-0.7969851, 0.2924609, -1.987723, 1, 1, 1, 1, 1,
-0.7854023, 0.9768621, -0.3072797, 1, 1, 1, 1, 1,
-0.7850012, 0.06921785, -2.934101, 1, 1, 1, 1, 1,
-0.7846771, -0.5995573, -3.412279, 0, 0, 1, 1, 1,
-0.7793305, -0.7260146, -1.065893, 1, 0, 0, 1, 1,
-0.7775457, 1.668347, -0.5395435, 1, 0, 0, 1, 1,
-0.7773503, 1.32052, -1.511408, 1, 0, 0, 1, 1,
-0.7753153, -0.3339281, -1.379561, 1, 0, 0, 1, 1,
-0.7744019, 0.4859391, -0.1909981, 1, 0, 0, 1, 1,
-0.7729577, 0.7363644, -0.9712251, 0, 0, 0, 1, 1,
-0.7695252, 0.507194, -1.515195, 0, 0, 0, 1, 1,
-0.7670335, 0.6797298, -1.043468, 0, 0, 0, 1, 1,
-0.7577744, 1.042145, -2.888762, 0, 0, 0, 1, 1,
-0.7547269, -0.01168594, -2.640786, 0, 0, 0, 1, 1,
-0.7538325, 0.2214565, -3.161914, 0, 0, 0, 1, 1,
-0.7517595, -1.648291, -3.605755, 0, 0, 0, 1, 1,
-0.7413695, -0.8467732, -2.52836, 1, 1, 1, 1, 1,
-0.7356434, 0.0887919, -1.437753, 1, 1, 1, 1, 1,
-0.7330465, -1.951517, -3.674688, 1, 1, 1, 1, 1,
-0.7310432, -1.941123, -2.429565, 1, 1, 1, 1, 1,
-0.7299485, 0.3628008, -0.6071451, 1, 1, 1, 1, 1,
-0.7243942, -1.141959, -2.998043, 1, 1, 1, 1, 1,
-0.7191185, 0.2863208, -0.6606641, 1, 1, 1, 1, 1,
-0.716937, 2.199602, -0.1413954, 1, 1, 1, 1, 1,
-0.7118268, 0.5128707, -2.488562, 1, 1, 1, 1, 1,
-0.70883, -2.334116, -2.67443, 1, 1, 1, 1, 1,
-0.7043701, -0.4346383, -1.472765, 1, 1, 1, 1, 1,
-0.6980886, 0.1843717, -1.908517, 1, 1, 1, 1, 1,
-0.6963447, -0.2864851, -0.3640707, 1, 1, 1, 1, 1,
-0.6911309, -0.5300263, -2.06023, 1, 1, 1, 1, 1,
-0.6902868, -0.8367397, -2.19975, 1, 1, 1, 1, 1,
-0.6864503, -0.9434581, -3.226621, 0, 0, 1, 1, 1,
-0.6859068, 1.049306, -1.175417, 1, 0, 0, 1, 1,
-0.6840236, -0.9750304, -3.999436, 1, 0, 0, 1, 1,
-0.6837168, 0.2578673, -0.8067935, 1, 0, 0, 1, 1,
-0.6836821, -0.6847996, -0.9411893, 1, 0, 0, 1, 1,
-0.6821625, -1.525201, -3.043676, 1, 0, 0, 1, 1,
-0.6810604, 0.5782019, -2.44482, 0, 0, 0, 1, 1,
-0.6805238, -1.5772, -2.418442, 0, 0, 0, 1, 1,
-0.6796657, 0.4422843, -0.1887563, 0, 0, 0, 1, 1,
-0.6762623, -1.678581, -1.037808, 0, 0, 0, 1, 1,
-0.6759048, 1.034638, -0.2378242, 0, 0, 0, 1, 1,
-0.6704959, 0.4679914, -0.1098752, 0, 0, 0, 1, 1,
-0.6682966, 0.289533, -1.32261, 0, 0, 0, 1, 1,
-0.6650761, -0.1143646, -1.348874, 1, 1, 1, 1, 1,
-0.6599647, -0.227605, -2.354477, 1, 1, 1, 1, 1,
-0.6576614, 1.048103, -1.281811, 1, 1, 1, 1, 1,
-0.6450856, -0.4430894, -2.44098, 1, 1, 1, 1, 1,
-0.6312713, 1.404768, -0.01921179, 1, 1, 1, 1, 1,
-0.6274937, -0.368761, -2.024818, 1, 1, 1, 1, 1,
-0.6233215, -0.1610092, -3.500377, 1, 1, 1, 1, 1,
-0.6223027, -2.007011, -1.698857, 1, 1, 1, 1, 1,
-0.6189336, -0.04973059, -2.036058, 1, 1, 1, 1, 1,
-0.6176967, -1.336014, -2.731609, 1, 1, 1, 1, 1,
-0.6136475, 1.55258, 0.3083272, 1, 1, 1, 1, 1,
-0.6124858, 0.4156292, -1.448623, 1, 1, 1, 1, 1,
-0.6122723, -1.466331, -2.086386, 1, 1, 1, 1, 1,
-0.6121639, 0.6377772, -0.809881, 1, 1, 1, 1, 1,
-0.6110063, -0.7754563, -1.030552, 1, 1, 1, 1, 1,
-0.6086204, -1.747624, -1.991229, 0, 0, 1, 1, 1,
-0.608289, -0.7669379, -2.207961, 1, 0, 0, 1, 1,
-0.6065335, 1.42505, 0.654442, 1, 0, 0, 1, 1,
-0.6015391, 0.6017068, 0.1052012, 1, 0, 0, 1, 1,
-0.5984808, 0.657365, -0.2866394, 1, 0, 0, 1, 1,
-0.592199, 0.127233, -1.080148, 1, 0, 0, 1, 1,
-0.5823489, 0.4473709, -1.575492, 0, 0, 0, 1, 1,
-0.5823159, 1.074069, -0.6062692, 0, 0, 0, 1, 1,
-0.5814288, 0.9019342, 1.445287, 0, 0, 0, 1, 1,
-0.5755982, -1.236407, -2.658492, 0, 0, 0, 1, 1,
-0.5731868, 0.3484196, -1.006916, 0, 0, 0, 1, 1,
-0.5722209, -0.9733822, -2.225207, 0, 0, 0, 1, 1,
-0.5720858, -0.2152952, -2.031258, 0, 0, 0, 1, 1,
-0.5714064, -0.11521, -2.495594, 1, 1, 1, 1, 1,
-0.5621581, 0.3090233, -0.9481931, 1, 1, 1, 1, 1,
-0.558199, -0.4820047, -1.850385, 1, 1, 1, 1, 1,
-0.5574374, 0.417425, -2.301873, 1, 1, 1, 1, 1,
-0.5567685, 1.018772, -0.03075778, 1, 1, 1, 1, 1,
-0.5559174, 2.750852, -0.1485325, 1, 1, 1, 1, 1,
-0.5558863, 0.44884, -1.404883, 1, 1, 1, 1, 1,
-0.5520854, -1.346272, -1.363037, 1, 1, 1, 1, 1,
-0.551205, 0.5022942, -2.471429, 1, 1, 1, 1, 1,
-0.5511895, -1.376677, -2.873401, 1, 1, 1, 1, 1,
-0.5485954, -0.08259828, -1.970909, 1, 1, 1, 1, 1,
-0.5459847, -1.498121, -2.288508, 1, 1, 1, 1, 1,
-0.5377788, -0.4203956, -1.641581, 1, 1, 1, 1, 1,
-0.5365608, 0.6509976, 0.2613372, 1, 1, 1, 1, 1,
-0.5360682, -0.6264539, -2.384093, 1, 1, 1, 1, 1,
-0.5305912, 0.8137878, -1.574261, 0, 0, 1, 1, 1,
-0.5303491, -0.2171355, -1.822085, 1, 0, 0, 1, 1,
-0.5266407, 0.9670403, 1.134202, 1, 0, 0, 1, 1,
-0.5260994, 0.04196498, -1.473681, 1, 0, 0, 1, 1,
-0.5245478, -1.454073, -1.672082, 1, 0, 0, 1, 1,
-0.5233765, 1.039331, -2.259112, 1, 0, 0, 1, 1,
-0.522404, -0.567284, -0.7972085, 0, 0, 0, 1, 1,
-0.5208504, -0.5308313, -3.218729, 0, 0, 0, 1, 1,
-0.5170484, 0.5379409, 0.530551, 0, 0, 0, 1, 1,
-0.5142347, 0.6418283, 1.995155, 0, 0, 0, 1, 1,
-0.5130842, 0.1604401, -1.35349, 0, 0, 0, 1, 1,
-0.5120593, -0.04394644, -1.532405, 0, 0, 0, 1, 1,
-0.5085618, -0.1743466, -3.522027, 0, 0, 0, 1, 1,
-0.5037198, 1.125535, -0.064601, 1, 1, 1, 1, 1,
-0.5011559, -0.4386108, -2.787566, 1, 1, 1, 1, 1,
-0.4976098, -0.6998994, -3.953755, 1, 1, 1, 1, 1,
-0.4927608, 1.917667, -1.501792, 1, 1, 1, 1, 1,
-0.4906599, -0.2488675, -1.152284, 1, 1, 1, 1, 1,
-0.4880909, 0.2379922, -0.8223599, 1, 1, 1, 1, 1,
-0.4869252, 0.6919659, -1.029232, 1, 1, 1, 1, 1,
-0.4859296, 1.260887, 0.4711913, 1, 1, 1, 1, 1,
-0.4855133, -0.892951, -3.416648, 1, 1, 1, 1, 1,
-0.4832754, -1.419496, -4.16353, 1, 1, 1, 1, 1,
-0.4818287, 1.832134, -1.168012, 1, 1, 1, 1, 1,
-0.4789686, 0.1922286, -2.339783, 1, 1, 1, 1, 1,
-0.4779705, -1.060766, -2.820596, 1, 1, 1, 1, 1,
-0.4711609, 0.3520896, -0.9394792, 1, 1, 1, 1, 1,
-0.468854, 0.07474755, -1.235311, 1, 1, 1, 1, 1,
-0.467188, -0.4646086, -4.042311, 0, 0, 1, 1, 1,
-0.4666472, -1.204051, -2.589211, 1, 0, 0, 1, 1,
-0.4657309, -0.4091219, -0.9846478, 1, 0, 0, 1, 1,
-0.4650017, -0.5908228, -2.258046, 1, 0, 0, 1, 1,
-0.4642682, 0.9085335, 0.5204448, 1, 0, 0, 1, 1,
-0.4637107, -1.876785, -4.496392, 1, 0, 0, 1, 1,
-0.463122, -0.4187832, -1.679101, 0, 0, 0, 1, 1,
-0.4628694, 0.7559265, 1.336843, 0, 0, 0, 1, 1,
-0.4618441, -1.162729, -2.445835, 0, 0, 0, 1, 1,
-0.4594804, 1.619368, 0.03211335, 0, 0, 0, 1, 1,
-0.449301, 0.1504501, 0.4937708, 0, 0, 0, 1, 1,
-0.4462313, 0.8833697, -1.516859, 0, 0, 0, 1, 1,
-0.4461661, 0.2826815, -1.006379, 0, 0, 0, 1, 1,
-0.44088, 0.2832559, -0.6202465, 1, 1, 1, 1, 1,
-0.4306457, -0.1484831, -1.37116, 1, 1, 1, 1, 1,
-0.429169, 1.427306, 1.317001, 1, 1, 1, 1, 1,
-0.4284115, -0.1136479, -3.281256, 1, 1, 1, 1, 1,
-0.4260373, 2.062508, 0.5770635, 1, 1, 1, 1, 1,
-0.4237557, -1.416378, -1.51351, 1, 1, 1, 1, 1,
-0.4102614, 0.793436, -0.08826534, 1, 1, 1, 1, 1,
-0.4086743, -0.1134728, -2.200997, 1, 1, 1, 1, 1,
-0.4080021, -1.000265, -2.167382, 1, 1, 1, 1, 1,
-0.4045179, 0.3274631, -1.562252, 1, 1, 1, 1, 1,
-0.4022886, 0.0255508, -1.665803, 1, 1, 1, 1, 1,
-0.3973801, -0.19421, -3.120724, 1, 1, 1, 1, 1,
-0.3965759, -0.2419852, -3.292436, 1, 1, 1, 1, 1,
-0.3960643, 1.685507, 1.209757, 1, 1, 1, 1, 1,
-0.3960398, -0.8668495, -3.022196, 1, 1, 1, 1, 1,
-0.3959041, -0.678741, -2.311082, 0, 0, 1, 1, 1,
-0.3952621, 0.5740368, -1.698018, 1, 0, 0, 1, 1,
-0.3937646, -0.4149677, -1.512689, 1, 0, 0, 1, 1,
-0.3932369, 0.4799763, -0.6564516, 1, 0, 0, 1, 1,
-0.3902027, 0.7215607, -0.6056546, 1, 0, 0, 1, 1,
-0.3897452, -0.5772735, -1.392756, 1, 0, 0, 1, 1,
-0.3874743, -1.660361, -2.045398, 0, 0, 0, 1, 1,
-0.3835767, 1.674816, -0.6166199, 0, 0, 0, 1, 1,
-0.3828955, -0.2973187, -2.752815, 0, 0, 0, 1, 1,
-0.3776837, -0.4046242, -2.065285, 0, 0, 0, 1, 1,
-0.375986, 1.742721, -0.3812304, 0, 0, 0, 1, 1,
-0.3747255, -0.128261, -2.761662, 0, 0, 0, 1, 1,
-0.3728874, -1.569943, -3.212918, 0, 0, 0, 1, 1,
-0.3723481, -1.226521, -2.399425, 1, 1, 1, 1, 1,
-0.3676526, 0.6968208, -0.6687744, 1, 1, 1, 1, 1,
-0.3665166, -0.5602433, -2.004966, 1, 1, 1, 1, 1,
-0.3653846, 1.200685, -1.220335, 1, 1, 1, 1, 1,
-0.3653821, 1.015774, -0.7831568, 1, 1, 1, 1, 1,
-0.3626271, 0.235038, -0.797348, 1, 1, 1, 1, 1,
-0.3597596, 0.3129122, -1.508183, 1, 1, 1, 1, 1,
-0.356815, 0.1592606, -1.540856, 1, 1, 1, 1, 1,
-0.3559983, -0.891208, -2.948978, 1, 1, 1, 1, 1,
-0.349244, -0.706712, -1.822739, 1, 1, 1, 1, 1,
-0.3490202, 2.396498, 0.3733068, 1, 1, 1, 1, 1,
-0.3476315, -1.260597, -1.996049, 1, 1, 1, 1, 1,
-0.3460346, 1.04947, 0.2893234, 1, 1, 1, 1, 1,
-0.3411305, 0.6935887, -1.825393, 1, 1, 1, 1, 1,
-0.3406399, 0.1855563, -1.177481, 1, 1, 1, 1, 1,
-0.337116, 0.237298, -1.517173, 0, 0, 1, 1, 1,
-0.3318106, -0.9731598, -3.166749, 1, 0, 0, 1, 1,
-0.3281865, 0.4390723, -1.507152, 1, 0, 0, 1, 1,
-0.3279375, 0.1645618, 1.357399, 1, 0, 0, 1, 1,
-0.3257163, 0.7583507, 0.1239425, 1, 0, 0, 1, 1,
-0.3249122, 1.760154, -1.98419, 1, 0, 0, 1, 1,
-0.3242288, -0.9654726, -2.041439, 0, 0, 0, 1, 1,
-0.321449, -1.765112, -4.09955, 0, 0, 0, 1, 1,
-0.3204906, 0.2942813, -0.4274035, 0, 0, 0, 1, 1,
-0.3190731, -0.979036, -1.961733, 0, 0, 0, 1, 1,
-0.3186877, 0.4083001, -0.8796028, 0, 0, 0, 1, 1,
-0.3147693, -0.1625684, -3.399757, 0, 0, 0, 1, 1,
-0.3105991, 0.7699834, 1.491162, 0, 0, 0, 1, 1,
-0.3105395, 1.645785, -0.9524243, 1, 1, 1, 1, 1,
-0.3103131, 0.7126324, 0.07062098, 1, 1, 1, 1, 1,
-0.3077971, 1.11385, -1.390037, 1, 1, 1, 1, 1,
-0.3046904, 0.421286, -1.052504, 1, 1, 1, 1, 1,
-0.3043889, 0.3824736, -0.656622, 1, 1, 1, 1, 1,
-0.3018204, -0.09926781, -1.782432, 1, 1, 1, 1, 1,
-0.3001975, 0.4326192, -1.168434, 1, 1, 1, 1, 1,
-0.2983179, 0.5982496, -1.384624, 1, 1, 1, 1, 1,
-0.2932078, -1.798891, -3.384798, 1, 1, 1, 1, 1,
-0.2923024, -0.7445014, -2.647794, 1, 1, 1, 1, 1,
-0.2829662, 1.222682, 0.2564204, 1, 1, 1, 1, 1,
-0.2779235, 0.1207877, -1.087895, 1, 1, 1, 1, 1,
-0.2744814, 0.4668037, -0.4554407, 1, 1, 1, 1, 1,
-0.273225, -2.335969, -2.917856, 1, 1, 1, 1, 1,
-0.2706002, 0.2152465, -0.9393371, 1, 1, 1, 1, 1,
-0.2692562, -1.080173, -3.357625, 0, 0, 1, 1, 1,
-0.2688419, -0.5275816, -2.586214, 1, 0, 0, 1, 1,
-0.2685624, -1.073399, -2.293261, 1, 0, 0, 1, 1,
-0.2683533, 0.03893703, -0.7686398, 1, 0, 0, 1, 1,
-0.2680345, -0.4712878, -1.938347, 1, 0, 0, 1, 1,
-0.2639408, -0.7133771, -1.967529, 1, 0, 0, 1, 1,
-0.2622385, -0.1393931, -2.867092, 0, 0, 0, 1, 1,
-0.2530547, 0.752306, 1.471672, 0, 0, 0, 1, 1,
-0.2529901, 0.9327872, -2.858766, 0, 0, 0, 1, 1,
-0.2517866, 0.7083237, 1.866457, 0, 0, 0, 1, 1,
-0.2447593, -1.01106, -2.42557, 0, 0, 0, 1, 1,
-0.240873, 0.1435382, -1.528532, 0, 0, 0, 1, 1,
-0.2368888, -0.7502244, -1.785768, 0, 0, 0, 1, 1,
-0.2366323, 0.0315676, -0.7384797, 1, 1, 1, 1, 1,
-0.2361601, -1.278793, -4.272286, 1, 1, 1, 1, 1,
-0.2340175, -0.2293625, -0.7513185, 1, 1, 1, 1, 1,
-0.2211697, 0.2844455, 0.103768, 1, 1, 1, 1, 1,
-0.2195878, -1.798835, -2.895386, 1, 1, 1, 1, 1,
-0.2130916, -2.40227, -2.945395, 1, 1, 1, 1, 1,
-0.2107007, -0.1034294, -1.198356, 1, 1, 1, 1, 1,
-0.2086836, -0.4349002, -2.026864, 1, 1, 1, 1, 1,
-0.206663, 0.1565689, -1.067529, 1, 1, 1, 1, 1,
-0.2047636, -0.03000047, -0.5182461, 1, 1, 1, 1, 1,
-0.2043164, -0.3834638, -3.311878, 1, 1, 1, 1, 1,
-0.2033709, 0.2398097, -0.1473609, 1, 1, 1, 1, 1,
-0.2033549, 0.3435213, 1.340824, 1, 1, 1, 1, 1,
-0.1966149, 0.988858, -1.10584, 1, 1, 1, 1, 1,
-0.1959233, -0.5055866, -1.356276, 1, 1, 1, 1, 1,
-0.191598, 1.940692, -1.178956, 0, 0, 1, 1, 1,
-0.1899979, -0.2857176, -2.989923, 1, 0, 0, 1, 1,
-0.1873723, 2.197161, 0.8330429, 1, 0, 0, 1, 1,
-0.1869168, 1.205908, -0.3199334, 1, 0, 0, 1, 1,
-0.1858051, -0.6001797, -3.850198, 1, 0, 0, 1, 1,
-0.1804317, -0.8031582, -3.375879, 1, 0, 0, 1, 1,
-0.1802139, -0.889633, -2.586869, 0, 0, 0, 1, 1,
-0.1793454, -0.4309865, -4.20437, 0, 0, 0, 1, 1,
-0.1761281, 1.120364, -1.096959, 0, 0, 0, 1, 1,
-0.1733876, 0.3199271, -0.01429513, 0, 0, 0, 1, 1,
-0.1703566, -0.7955371, -3.905912, 0, 0, 0, 1, 1,
-0.1664743, -0.4789844, -3.638946, 0, 0, 0, 1, 1,
-0.166347, -0.3889177, -3.163466, 0, 0, 0, 1, 1,
-0.1647592, -0.2794836, -2.792627, 1, 1, 1, 1, 1,
-0.1579842, -0.3594154, -1.430167, 1, 1, 1, 1, 1,
-0.155865, 0.6383189, 0.8477461, 1, 1, 1, 1, 1,
-0.1505688, 2.297064, -0.1313991, 1, 1, 1, 1, 1,
-0.1491428, -0.6009807, -3.117041, 1, 1, 1, 1, 1,
-0.1491186, 2.040504, -0.5546058, 1, 1, 1, 1, 1,
-0.136726, 0.2927578, -1.151255, 1, 1, 1, 1, 1,
-0.1306588, -2.274858, -3.668175, 1, 1, 1, 1, 1,
-0.1272857, 0.8441486, 1.773189, 1, 1, 1, 1, 1,
-0.1268197, -1.478682, -3.820523, 1, 1, 1, 1, 1,
-0.1246394, -0.6073167, -2.859056, 1, 1, 1, 1, 1,
-0.1191889, -0.1356852, -1.767304, 1, 1, 1, 1, 1,
-0.1187986, -0.1275816, -0.7438647, 1, 1, 1, 1, 1,
-0.1168894, 0.5823107, -0.9483337, 1, 1, 1, 1, 1,
-0.1152379, -0.9520542, -1.919455, 1, 1, 1, 1, 1,
-0.1066489, -1.236427, -4.609096, 0, 0, 1, 1, 1,
-0.1051031, 0.0801921, -0.2323949, 1, 0, 0, 1, 1,
-0.09330025, 0.1137146, 1.118905, 1, 0, 0, 1, 1,
-0.09102024, -1.095929, -3.643783, 1, 0, 0, 1, 1,
-0.08915583, 0.373547, 0.3063581, 1, 0, 0, 1, 1,
-0.08625572, -0.227732, -3.155849, 1, 0, 0, 1, 1,
-0.08600043, -0.821332, -2.37086, 0, 0, 0, 1, 1,
-0.08577932, -0.7867114, -4.179548, 0, 0, 0, 1, 1,
-0.08493557, -0.008382513, -1.659808, 0, 0, 0, 1, 1,
-0.08364137, 0.5284847, -1.312533, 0, 0, 0, 1, 1,
-0.08352648, 0.4344726, -0.8605884, 0, 0, 0, 1, 1,
-0.07701602, 0.6176037, -1.039492, 0, 0, 0, 1, 1,
-0.07424576, -0.4755329, -2.777897, 0, 0, 0, 1, 1,
-0.07270372, 0.2267474, 0.6343211, 1, 1, 1, 1, 1,
-0.06449089, 1.191197, -1.340763, 1, 1, 1, 1, 1,
-0.06441817, -1.152361, -2.046296, 1, 1, 1, 1, 1,
-0.06439073, 0.4792661, -0.5131193, 1, 1, 1, 1, 1,
-0.06395694, 1.127765, 0.8124706, 1, 1, 1, 1, 1,
-0.06386882, 0.3232708, -1.216331, 1, 1, 1, 1, 1,
-0.05833146, 2.078975, 1.387812, 1, 1, 1, 1, 1,
-0.0536585, -0.6842383, -2.01897, 1, 1, 1, 1, 1,
-0.05198375, 0.3251085, -0.3302166, 1, 1, 1, 1, 1,
-0.05056954, 0.9636458, 0.2197776, 1, 1, 1, 1, 1,
-0.05019289, 0.7754838, 0.7349578, 1, 1, 1, 1, 1,
-0.05011999, -0.0009277096, -1.698879, 1, 1, 1, 1, 1,
-0.04962966, 0.09199394, -0.3554629, 1, 1, 1, 1, 1,
-0.04879127, -0.6630546, -2.364568, 1, 1, 1, 1, 1,
-0.03940994, -0.4418289, -2.718249, 1, 1, 1, 1, 1,
-0.0240885, 0.8903278, -0.1549153, 0, 0, 1, 1, 1,
-0.02281448, 0.06756748, 0.0185297, 1, 0, 0, 1, 1,
-0.02230351, 1.577018, -0.9605569, 1, 0, 0, 1, 1,
-0.02024399, 0.4910809, 0.2852509, 1, 0, 0, 1, 1,
-0.01928469, -0.5048504, -1.859805, 1, 0, 0, 1, 1,
-0.01877801, 1.08846, -1.609739, 1, 0, 0, 1, 1,
-0.01254461, 0.04789938, -1.336735, 0, 0, 0, 1, 1,
-0.005481527, -2.200605, -2.908225, 0, 0, 0, 1, 1,
0.0002354976, 2.325854, 0.7385051, 0, 0, 0, 1, 1,
0.002996855, -1.020293, 1.222696, 0, 0, 0, 1, 1,
0.004530518, -0.2942965, 3.564045, 0, 0, 0, 1, 1,
0.005698269, 1.318189, 0.492813, 0, 0, 0, 1, 1,
0.01260574, -0.4284925, 3.614664, 0, 0, 0, 1, 1,
0.01849383, 2.07179, 0.06026765, 1, 1, 1, 1, 1,
0.01940615, 2.288374, -0.3333439, 1, 1, 1, 1, 1,
0.02022897, 0.2813953, -1.036282, 1, 1, 1, 1, 1,
0.03100489, 0.4590106, -0.2261257, 1, 1, 1, 1, 1,
0.03444855, 0.2253177, -0.3698471, 1, 1, 1, 1, 1,
0.03764148, -0.06381094, 2.099607, 1, 1, 1, 1, 1,
0.04583286, -0.4555065, 3.393127, 1, 1, 1, 1, 1,
0.05444104, 0.6994768, -1.571679, 1, 1, 1, 1, 1,
0.05564781, 0.2791303, -0.1264017, 1, 1, 1, 1, 1,
0.05889692, -1.320061, 1.166406, 1, 1, 1, 1, 1,
0.06056222, 0.7097619, -0.865594, 1, 1, 1, 1, 1,
0.06078944, 2.496436, -1.061338, 1, 1, 1, 1, 1,
0.06830366, 0.1244918, 0.146415, 1, 1, 1, 1, 1,
0.06903778, -2.57672, 2.506652, 1, 1, 1, 1, 1,
0.06937343, -1.127591, 4.530385, 1, 1, 1, 1, 1,
0.07077813, 0.3937415, 0.05560618, 0, 0, 1, 1, 1,
0.07212692, -1.861078, 4.372633, 1, 0, 0, 1, 1,
0.07647225, -0.8173782, 2.456692, 1, 0, 0, 1, 1,
0.08042919, -0.4904098, 3.028677, 1, 0, 0, 1, 1,
0.08076815, -0.3306479, 3.415677, 1, 0, 0, 1, 1,
0.08186651, 1.049542, -0.507586, 1, 0, 0, 1, 1,
0.08266131, -0.1488098, 1.065021, 0, 0, 0, 1, 1,
0.08346324, -0.2521472, 2.673622, 0, 0, 0, 1, 1,
0.08761193, 0.8760573, 0.2239316, 0, 0, 0, 1, 1,
0.08774227, -0.9669783, 5.682525, 0, 0, 0, 1, 1,
0.0900222, -0.06403379, 2.961513, 0, 0, 0, 1, 1,
0.09058867, -0.6609606, 3.696514, 0, 0, 0, 1, 1,
0.09157629, 1.637434, -1.227452, 0, 0, 0, 1, 1,
0.09314632, 0.168667, -0.7690781, 1, 1, 1, 1, 1,
0.09466162, 1.444283, -1.74183, 1, 1, 1, 1, 1,
0.09758302, 2.116707, 0.7827531, 1, 1, 1, 1, 1,
0.09988753, -1.005748, 2.671606, 1, 1, 1, 1, 1,
0.1011656, 1.084695, -2.095498, 1, 1, 1, 1, 1,
0.1019777, -0.1273481, 3.73954, 1, 1, 1, 1, 1,
0.109491, 0.6476768, 0.1737944, 1, 1, 1, 1, 1,
0.1104733, -1.16366, 2.43465, 1, 1, 1, 1, 1,
0.1108801, 0.4948553, 0.7872313, 1, 1, 1, 1, 1,
0.1127054, -0.876884, 2.707705, 1, 1, 1, 1, 1,
0.1148391, -2.119424, 1.572959, 1, 1, 1, 1, 1,
0.1160624, 0.3446506, 0.7896451, 1, 1, 1, 1, 1,
0.1167646, -0.296898, 4.232212, 1, 1, 1, 1, 1,
0.117275, -0.4945651, 2.712967, 1, 1, 1, 1, 1,
0.1178965, -0.3605074, 2.825644, 1, 1, 1, 1, 1,
0.1183172, -0.7235473, 2.404869, 0, 0, 1, 1, 1,
0.1270359, -2.427792, 3.574401, 1, 0, 0, 1, 1,
0.1272322, 0.7824674, 1.200181, 1, 0, 0, 1, 1,
0.1285565, -0.4059199, 1.258147, 1, 0, 0, 1, 1,
0.1286385, -1.830304, 2.204067, 1, 0, 0, 1, 1,
0.1300111, 0.2379122, 0.2785771, 1, 0, 0, 1, 1,
0.1301735, -0.02694352, 0.9863204, 0, 0, 0, 1, 1,
0.1303615, 0.2865777, -0.3307528, 0, 0, 0, 1, 1,
0.1333425, 0.1846244, 2.631693, 0, 0, 0, 1, 1,
0.1346679, 0.9990712, 1.02388, 0, 0, 0, 1, 1,
0.134895, -0.1934766, 3.644568, 0, 0, 0, 1, 1,
0.1365619, -0.7027944, 2.268864, 0, 0, 0, 1, 1,
0.1380498, 0.5194873, 0.7132602, 0, 0, 0, 1, 1,
0.1408087, -0.8798364, 3.33355, 1, 1, 1, 1, 1,
0.1477801, -0.2313888, 2.526915, 1, 1, 1, 1, 1,
0.1527193, 2.507597, 1.575503, 1, 1, 1, 1, 1,
0.1601658, -0.46664, 0.4472726, 1, 1, 1, 1, 1,
0.160963, -1.882833, 3.080616, 1, 1, 1, 1, 1,
0.1616951, 1.316211, -0.8044435, 1, 1, 1, 1, 1,
0.1657154, 1.03335, 1.359323, 1, 1, 1, 1, 1,
0.167865, -1.16866, 2.122067, 1, 1, 1, 1, 1,
0.1821878, -1.254478, 3.248287, 1, 1, 1, 1, 1,
0.1822229, 0.7155988, 0.3721475, 1, 1, 1, 1, 1,
0.1826855, 0.1461486, 0.7324881, 1, 1, 1, 1, 1,
0.1867353, -1.49462, 1.919656, 1, 1, 1, 1, 1,
0.1908508, -0.2639443, 3.168132, 1, 1, 1, 1, 1,
0.1931393, -0.8135342, 3.046417, 1, 1, 1, 1, 1,
0.1933189, -0.4955718, 4.184571, 1, 1, 1, 1, 1,
0.193637, -1.943983, 3.641854, 0, 0, 1, 1, 1,
0.1939931, -1.369837, 3.327464, 1, 0, 0, 1, 1,
0.1940503, -0.469802, 2.941689, 1, 0, 0, 1, 1,
0.1966957, -1.086884, 2.139027, 1, 0, 0, 1, 1,
0.2034795, -0.6475745, 1.820108, 1, 0, 0, 1, 1,
0.2083912, -1.945075, 2.679452, 1, 0, 0, 1, 1,
0.2089957, 0.7055458, 2.403356, 0, 0, 0, 1, 1,
0.2108895, -1.484916, 2.125153, 0, 0, 0, 1, 1,
0.2172718, 0.9408552, -1.217487, 0, 0, 0, 1, 1,
0.2196189, 0.7951955, 2.184702, 0, 0, 0, 1, 1,
0.220098, -0.5827524, 4.399425, 0, 0, 0, 1, 1,
0.2209647, -0.2470665, 2.530575, 0, 0, 0, 1, 1,
0.2211901, 0.9342898, -1.615896, 0, 0, 0, 1, 1,
0.2212622, -0.1367055, 2.59858, 1, 1, 1, 1, 1,
0.2236071, 0.4646689, 0.7304531, 1, 1, 1, 1, 1,
0.2240046, 0.4852999, -0.09964449, 1, 1, 1, 1, 1,
0.2282927, -0.5054344, 3.150843, 1, 1, 1, 1, 1,
0.2284744, 0.04623707, 1.769192, 1, 1, 1, 1, 1,
0.2288179, -0.4936944, 3.12287, 1, 1, 1, 1, 1,
0.2294344, 1.539325, -0.963935, 1, 1, 1, 1, 1,
0.2320905, -0.257506, 0.9629574, 1, 1, 1, 1, 1,
0.2337139, -0.608416, 2.121831, 1, 1, 1, 1, 1,
0.2346777, -0.4228935, 3.625976, 1, 1, 1, 1, 1,
0.2368424, -0.1756934, 1.401093, 1, 1, 1, 1, 1,
0.2416061, 0.7885117, 0.2217121, 1, 1, 1, 1, 1,
0.2456491, 0.7566345, 0.6506114, 1, 1, 1, 1, 1,
0.2461151, 0.07712401, 1.57236, 1, 1, 1, 1, 1,
0.246471, -0.4196593, 3.909309, 1, 1, 1, 1, 1,
0.2466199, 2.172376, -1.129703, 0, 0, 1, 1, 1,
0.2517038, 0.2806079, 1.740865, 1, 0, 0, 1, 1,
0.2572722, -1.146353, 2.494281, 1, 0, 0, 1, 1,
0.2584816, -0.2911505, 3.72677, 1, 0, 0, 1, 1,
0.2597674, -0.01933469, 1.005465, 1, 0, 0, 1, 1,
0.2656564, -0.1197568, 4.100009, 1, 0, 0, 1, 1,
0.2659802, 1.63249, -0.102252, 0, 0, 0, 1, 1,
0.2694641, -1.730237, 4.645766, 0, 0, 0, 1, 1,
0.2718246, 0.3164546, 0.6247857, 0, 0, 0, 1, 1,
0.2720459, -1.231331, 1.46136, 0, 0, 0, 1, 1,
0.2744372, -0.3418516, 3.455232, 0, 0, 0, 1, 1,
0.279427, 0.4298422, 0.916375, 0, 0, 0, 1, 1,
0.2807707, 0.2575172, -0.3973249, 0, 0, 0, 1, 1,
0.2825117, -0.5602243, 2.583765, 1, 1, 1, 1, 1,
0.2826918, 0.9966829, 0.5601365, 1, 1, 1, 1, 1,
0.2830965, 0.6574197, 2.301568, 1, 1, 1, 1, 1,
0.2849272, -0.6699278, 2.063087, 1, 1, 1, 1, 1,
0.2863604, 1.427591, -1.637503, 1, 1, 1, 1, 1,
0.2917079, -0.2816696, 2.965619, 1, 1, 1, 1, 1,
0.2938728, 0.5916624, 0.9602336, 1, 1, 1, 1, 1,
0.294243, 0.07470219, 1.289672, 1, 1, 1, 1, 1,
0.3010489, 0.7817596, 1.506944, 1, 1, 1, 1, 1,
0.3072686, -0.5456297, 2.611726, 1, 1, 1, 1, 1,
0.3075379, 1.791402, -0.3421459, 1, 1, 1, 1, 1,
0.3120778, 0.9140154, 1.354993, 1, 1, 1, 1, 1,
0.3127523, -1.022524, -0.7129047, 1, 1, 1, 1, 1,
0.321787, 0.2205222, 0.1896859, 1, 1, 1, 1, 1,
0.3248914, 1.833326, -1.569771, 1, 1, 1, 1, 1,
0.325813, 0.6867843, 0.6313655, 0, 0, 1, 1, 1,
0.3260764, -0.6241197, 2.867253, 1, 0, 0, 1, 1,
0.3263017, 0.6542066, 0.2527424, 1, 0, 0, 1, 1,
0.3331763, 1.227075, 2.872249, 1, 0, 0, 1, 1,
0.3361322, -2.868961, 4.914462, 1, 0, 0, 1, 1,
0.3363652, -0.8731597, 2.673796, 1, 0, 0, 1, 1,
0.3370751, -1.33595, 3.648194, 0, 0, 0, 1, 1,
0.3451636, 1.214567, 1.178471, 0, 0, 0, 1, 1,
0.3502441, -0.2974184, 1.856615, 0, 0, 0, 1, 1,
0.3522847, 0.5798019, 0.6047451, 0, 0, 0, 1, 1,
0.3542452, 0.4646331, 0.5659567, 0, 0, 0, 1, 1,
0.3582417, -2.033995, 1.93412, 0, 0, 0, 1, 1,
0.3632223, -0.3263606, 1.041425, 0, 0, 0, 1, 1,
0.364158, -0.6551501, 2.768738, 1, 1, 1, 1, 1,
0.3663202, 0.1518296, 0.5088589, 1, 1, 1, 1, 1,
0.3691679, 2.465791, 0.197105, 1, 1, 1, 1, 1,
0.3699881, -0.751985, 2.014371, 1, 1, 1, 1, 1,
0.3710783, -0.7475976, 3.123623, 1, 1, 1, 1, 1,
0.3732097, 0.5058171, 0.1518432, 1, 1, 1, 1, 1,
0.3763044, -1.067659, 3.295022, 1, 1, 1, 1, 1,
0.3829977, -0.2151497, 2.223803, 1, 1, 1, 1, 1,
0.3896817, 0.2365945, 1.125167, 1, 1, 1, 1, 1,
0.3913774, -1.516153, 3.250909, 1, 1, 1, 1, 1,
0.3942231, 1.566102, -0.1522826, 1, 1, 1, 1, 1,
0.3973289, -1.059394, 2.477771, 1, 1, 1, 1, 1,
0.3978653, 0.3509028, -0.1530664, 1, 1, 1, 1, 1,
0.4010419, -0.3152951, 3.020334, 1, 1, 1, 1, 1,
0.4070655, 1.089507, -0.9135548, 1, 1, 1, 1, 1,
0.4124716, 1.364358, -0.5874833, 0, 0, 1, 1, 1,
0.4124757, -1.498799, 2.270222, 1, 0, 0, 1, 1,
0.4136804, -0.6989371, 0.6419353, 1, 0, 0, 1, 1,
0.4144853, 1.669594, -1.06808, 1, 0, 0, 1, 1,
0.4171634, -0.01084715, -0.07882375, 1, 0, 0, 1, 1,
0.4209113, 1.096362, 0.3192443, 1, 0, 0, 1, 1,
0.4214174, 0.3022279, 2.739072, 0, 0, 0, 1, 1,
0.4221688, 2.224311, 2.711551, 0, 0, 0, 1, 1,
0.4274814, 2.443975, 0.2964331, 0, 0, 0, 1, 1,
0.4303815, 1.276082, -0.3928868, 0, 0, 0, 1, 1,
0.4394198, 0.9646143, 0.9590361, 0, 0, 0, 1, 1,
0.4447823, 0.2182436, 0.8942622, 0, 0, 0, 1, 1,
0.4454385, 1.397827, -2.587391, 0, 0, 0, 1, 1,
0.4458169, -1.958264, 4.353959, 1, 1, 1, 1, 1,
0.446979, 1.157494, -0.03441665, 1, 1, 1, 1, 1,
0.4513027, 0.423024, -2.890404, 1, 1, 1, 1, 1,
0.4544943, -0.5486863, 2.589184, 1, 1, 1, 1, 1,
0.4549561, 0.4242659, 1.106087, 1, 1, 1, 1, 1,
0.4552789, 0.2705955, 2.340716, 1, 1, 1, 1, 1,
0.461821, -0.287438, 2.233657, 1, 1, 1, 1, 1,
0.4628315, -0.212834, 2.531861, 1, 1, 1, 1, 1,
0.464625, -0.9613656, 2.554214, 1, 1, 1, 1, 1,
0.4649989, -1.497088, 3.803006, 1, 1, 1, 1, 1,
0.467957, 0.6745871, 2.641438, 1, 1, 1, 1, 1,
0.4680195, 0.4139062, 2.021094, 1, 1, 1, 1, 1,
0.4697034, -0.6153688, 2.327266, 1, 1, 1, 1, 1,
0.4703878, 0.600076, 0.6280565, 1, 1, 1, 1, 1,
0.4715462, 0.2649779, 0.9197202, 1, 1, 1, 1, 1,
0.4830902, 1.050654, 1.486965, 0, 0, 1, 1, 1,
0.4879165, 0.5187608, 1.989014, 1, 0, 0, 1, 1,
0.4892792, 1.053983, -1.522583, 1, 0, 0, 1, 1,
0.4938673, 1.039412, 0.3105773, 1, 0, 0, 1, 1,
0.4969718, -0.1978309, 0.7659793, 1, 0, 0, 1, 1,
0.4977075, 0.1868162, 0.31335, 1, 0, 0, 1, 1,
0.4978524, -0.0003346944, 0.4607089, 0, 0, 0, 1, 1,
0.4996232, 1.132608, 1.280854, 0, 0, 0, 1, 1,
0.5015408, 0.9179031, -0.5453553, 0, 0, 0, 1, 1,
0.5019156, 0.4800521, 0.08783341, 0, 0, 0, 1, 1,
0.5062906, -0.3820211, 1.919633, 0, 0, 0, 1, 1,
0.5086198, -0.08642758, 0.9569334, 0, 0, 0, 1, 1,
0.5092096, -0.8618324, 2.519495, 0, 0, 0, 1, 1,
0.5097366, -0.06191495, 1.891242, 1, 1, 1, 1, 1,
0.5130427, -0.7108451, 3.195719, 1, 1, 1, 1, 1,
0.5131884, -1.113536, 2.262694, 1, 1, 1, 1, 1,
0.5156666, 0.3897581, 1.663643, 1, 1, 1, 1, 1,
0.5158958, -1.480908, 1.776391, 1, 1, 1, 1, 1,
0.5166175, 0.08177145, 0.3576651, 1, 1, 1, 1, 1,
0.5168052, -0.4257954, 3.864874, 1, 1, 1, 1, 1,
0.5182654, -0.6038666, 1.290532, 1, 1, 1, 1, 1,
0.5219552, -0.008363482, 3.337766, 1, 1, 1, 1, 1,
0.5248859, 0.04536508, 0.5988874, 1, 1, 1, 1, 1,
0.5281531, -0.03300824, -0.4708966, 1, 1, 1, 1, 1,
0.5295277, 0.2567664, -0.1726988, 1, 1, 1, 1, 1,
0.5320399, 0.818788, 1.702095, 1, 1, 1, 1, 1,
0.5353203, -0.9029982, 2.573924, 1, 1, 1, 1, 1,
0.5368103, 0.6835019, 1.384504, 1, 1, 1, 1, 1,
0.538928, 0.0778333, 0.4229427, 0, 0, 1, 1, 1,
0.5397161, -1.573071, 2.375392, 1, 0, 0, 1, 1,
0.5575315, 0.2984089, -1.118773, 1, 0, 0, 1, 1,
0.5578004, -1.771578, 4.380288, 1, 0, 0, 1, 1,
0.5581845, -0.09635308, 1.88086, 1, 0, 0, 1, 1,
0.5622371, 1.563267, -0.5999298, 1, 0, 0, 1, 1,
0.5622406, 0.4216255, 0.5358258, 0, 0, 0, 1, 1,
0.5635657, 0.7874899, 0.2216974, 0, 0, 0, 1, 1,
0.564622, -0.04122725, 3.197558, 0, 0, 0, 1, 1,
0.5718172, 0.5319127, -0.4256734, 0, 0, 0, 1, 1,
0.5750022, 1.770714, 0.2425811, 0, 0, 0, 1, 1,
0.5788698, -0.3050638, 2.702225, 0, 0, 0, 1, 1,
0.5802205, 0.8338574, 0.5645317, 0, 0, 0, 1, 1,
0.582956, -0.2867884, 0.5859255, 1, 1, 1, 1, 1,
0.586216, 0.6606832, 2.007978, 1, 1, 1, 1, 1,
0.5905877, 0.4795977, 0.2454295, 1, 1, 1, 1, 1,
0.5923535, 0.579393, -1.299083, 1, 1, 1, 1, 1,
0.5925404, -0.4563158, 3.046549, 1, 1, 1, 1, 1,
0.5926121, 1.338713, 0.7861458, 1, 1, 1, 1, 1,
0.5929224, -0.6708866, 2.522515, 1, 1, 1, 1, 1,
0.5944636, -0.5133917, 2.228024, 1, 1, 1, 1, 1,
0.5945947, 0.2459487, 0.1557756, 1, 1, 1, 1, 1,
0.6028913, 0.2996749, -0.9169785, 1, 1, 1, 1, 1,
0.6030869, 1.932077, 0.7311928, 1, 1, 1, 1, 1,
0.6043667, -1.009672, 1.714113, 1, 1, 1, 1, 1,
0.6059713, -0.6062385, 2.655446, 1, 1, 1, 1, 1,
0.6140195, 0.9645597, 0.04921458, 1, 1, 1, 1, 1,
0.6183748, -0.9055214, 2.003037, 1, 1, 1, 1, 1,
0.6235604, -0.5514209, 2.991762, 0, 0, 1, 1, 1,
0.6390714, 2.327406, -0.06972922, 1, 0, 0, 1, 1,
0.6458926, -0.06341409, 1.394093, 1, 0, 0, 1, 1,
0.6485369, 0.7492395, 1.722978, 1, 0, 0, 1, 1,
0.6599001, 1.792892, 0.007232449, 1, 0, 0, 1, 1,
0.6625425, -0.142506, 3.077216, 1, 0, 0, 1, 1,
0.6629199, 0.6115354, 0.5634586, 0, 0, 0, 1, 1,
0.6679516, 0.7093994, 0.3458876, 0, 0, 0, 1, 1,
0.6693666, 1.376107, -0.5356328, 0, 0, 0, 1, 1,
0.670179, -0.2593916, 1.477356, 0, 0, 0, 1, 1,
0.6742344, -1.285829, 3.243984, 0, 0, 0, 1, 1,
0.6746206, -0.3778433, 2.527291, 0, 0, 0, 1, 1,
0.6807824, 0.5694196, -0.5538072, 0, 0, 0, 1, 1,
0.6869544, -0.3446316, 2.896407, 1, 1, 1, 1, 1,
0.6920493, 0.3350458, 1.775032, 1, 1, 1, 1, 1,
0.6922047, -0.9686171, 1.512304, 1, 1, 1, 1, 1,
0.6950226, -1.855846, 3.108157, 1, 1, 1, 1, 1,
0.69523, 0.5243443, 1.234454, 1, 1, 1, 1, 1,
0.6958414, -1.51439, 2.208575, 1, 1, 1, 1, 1,
0.6976094, 0.3723982, 0.9674665, 1, 1, 1, 1, 1,
0.6989574, 0.958491, 0.9311872, 1, 1, 1, 1, 1,
0.6993362, -0.3090085, 1.371413, 1, 1, 1, 1, 1,
0.7103227, 1.058945, 1.931009, 1, 1, 1, 1, 1,
0.7210849, 1.158183, 1.66801, 1, 1, 1, 1, 1,
0.7237117, -2.312576, 3.300531, 1, 1, 1, 1, 1,
0.7251741, 0.02205134, 1.255255, 1, 1, 1, 1, 1,
0.7293759, 0.1472612, 2.176637, 1, 1, 1, 1, 1,
0.7341978, -0.8369835, 3.598849, 1, 1, 1, 1, 1,
0.7406933, -0.8502293, 2.553529, 0, 0, 1, 1, 1,
0.7445529, 2.149383, 1.103746, 1, 0, 0, 1, 1,
0.7475299, 1.127481, 0.7566253, 1, 0, 0, 1, 1,
0.7526094, -0.9802896, 2.416025, 1, 0, 0, 1, 1,
0.7703546, -0.8203107, 0.607413, 1, 0, 0, 1, 1,
0.7713937, -1.307531, 1.962809, 1, 0, 0, 1, 1,
0.7738521, 0.8599527, -0.6208439, 0, 0, 0, 1, 1,
0.7746549, -0.3285738, 3.731132, 0, 0, 0, 1, 1,
0.7748165, -1.074972, 3.490007, 0, 0, 0, 1, 1,
0.7810369, -0.5216981, 1.363883, 0, 0, 0, 1, 1,
0.7838587, -0.3178197, 0.09640896, 0, 0, 0, 1, 1,
0.7846353, 0.3189979, 0.03268665, 0, 0, 0, 1, 1,
0.785714, 1.814133, 0.07573352, 0, 0, 0, 1, 1,
0.7870544, 1.358056, 0.2369, 1, 1, 1, 1, 1,
0.7893023, 2.473286, 1.097986, 1, 1, 1, 1, 1,
0.7906028, -2.706227, 2.867644, 1, 1, 1, 1, 1,
0.7917125, 0.1399968, 1.32701, 1, 1, 1, 1, 1,
0.7927016, -0.9145523, 3.604538, 1, 1, 1, 1, 1,
0.7954696, 0.9412029, 1.481213, 1, 1, 1, 1, 1,
0.7961736, 0.3543155, 1.411933, 1, 1, 1, 1, 1,
0.8023142, -0.1303276, 2.213101, 1, 1, 1, 1, 1,
0.8032054, 1.241784, 1.896569, 1, 1, 1, 1, 1,
0.8036972, -0.6776497, -0.4198492, 1, 1, 1, 1, 1,
0.8065538, 0.5860596, 0.9682273, 1, 1, 1, 1, 1,
0.8097109, -1.179498, 1.727497, 1, 1, 1, 1, 1,
0.815092, -1.4216, 2.428616, 1, 1, 1, 1, 1,
0.816053, -1.526838, 3.196278, 1, 1, 1, 1, 1,
0.8160942, -0.783199, 3.312628, 1, 1, 1, 1, 1,
0.8310513, -0.9677812, 0.2940065, 0, 0, 1, 1, 1,
0.8352186, -0.5699795, 2.505374, 1, 0, 0, 1, 1,
0.8416046, 0.1372056, 1.547156, 1, 0, 0, 1, 1,
0.8421311, -0.07847743, 1.402397, 1, 0, 0, 1, 1,
0.8554648, -1.313207, 1.412331, 1, 0, 0, 1, 1,
0.8565373, -1.267535, 0.4408099, 1, 0, 0, 1, 1,
0.8584775, -0.7955016, 2.21838, 0, 0, 0, 1, 1,
0.8596475, 0.6451714, 0.9366561, 0, 0, 0, 1, 1,
0.8715262, 0.1184606, 0.6367461, 0, 0, 0, 1, 1,
0.872111, 0.7627302, 1.994459, 0, 0, 0, 1, 1,
0.8732857, -1.068928, 2.129715, 0, 0, 0, 1, 1,
0.8782784, 1.05775, 0.09219795, 0, 0, 0, 1, 1,
0.8797105, 0.0006872846, -0.5101246, 0, 0, 0, 1, 1,
0.8822935, -0.1798766, 0.8691598, 1, 1, 1, 1, 1,
0.8832399, -1.170004, 3.19662, 1, 1, 1, 1, 1,
0.9030619, -1.014434, 1.450727, 1, 1, 1, 1, 1,
0.9051521, 0.3953529, 1.848885, 1, 1, 1, 1, 1,
0.9170194, 0.8756545, 0.429924, 1, 1, 1, 1, 1,
0.9172212, 2.059793, 1.30035, 1, 1, 1, 1, 1,
0.9187329, -1.331067, 3.517747, 1, 1, 1, 1, 1,
0.9218152, -0.2227119, 1.109552, 1, 1, 1, 1, 1,
0.9292457, -1.065789, 2.529204, 1, 1, 1, 1, 1,
0.9328514, -0.2715104, 2.715173, 1, 1, 1, 1, 1,
0.9333801, 1.023848, 2.156517, 1, 1, 1, 1, 1,
0.9484007, -0.1843293, 1.823424, 1, 1, 1, 1, 1,
0.9699203, -1.830356, 2.263696, 1, 1, 1, 1, 1,
0.9724323, -0.1159942, 0.9547569, 1, 1, 1, 1, 1,
0.9887815, -0.5222231, 1.797186, 1, 1, 1, 1, 1,
1.008267, 0.2606141, 1.086235, 0, 0, 1, 1, 1,
1.018138, 0.282207, 2.598936, 1, 0, 0, 1, 1,
1.033669, -0.1692049, 2.609145, 1, 0, 0, 1, 1,
1.039332, 0.4089038, 1.525471, 1, 0, 0, 1, 1,
1.039472, 0.1915025, 1.61635, 1, 0, 0, 1, 1,
1.039752, 0.831357, 0.207896, 1, 0, 0, 1, 1,
1.050069, 0.5197858, 1.778115, 0, 0, 0, 1, 1,
1.051804, -0.7565741, 0.5530345, 0, 0, 0, 1, 1,
1.052859, -0.1376764, 2.656775, 0, 0, 0, 1, 1,
1.054186, -0.7973582, 2.472893, 0, 0, 0, 1, 1,
1.056724, 1.142043, 0.7079064, 0, 0, 0, 1, 1,
1.057382, -1.80335, 2.116843, 0, 0, 0, 1, 1,
1.070993, -1.160249, 3.058434, 0, 0, 0, 1, 1,
1.072955, -0.04638061, 1.740917, 1, 1, 1, 1, 1,
1.075205, -0.04857604, 2.139559, 1, 1, 1, 1, 1,
1.080454, -0.4996141, 2.639093, 1, 1, 1, 1, 1,
1.086778, -0.08104125, 2.695493, 1, 1, 1, 1, 1,
1.087539, 0.9312609, -0.4094353, 1, 1, 1, 1, 1,
1.088298, -0.4244115, 0.8256441, 1, 1, 1, 1, 1,
1.093973, 1.139348, 3.289415, 1, 1, 1, 1, 1,
1.098492, 0.2077365, 1.083793, 1, 1, 1, 1, 1,
1.112253, 0.4092814, 0.6544675, 1, 1, 1, 1, 1,
1.114792, 1.762532, 1.132117, 1, 1, 1, 1, 1,
1.122921, -0.5570925, 2.080734, 1, 1, 1, 1, 1,
1.124294, -0.7672046, 1.04105, 1, 1, 1, 1, 1,
1.124975, -1.068578, 1.859374, 1, 1, 1, 1, 1,
1.127048, 1.225596, 1.412667, 1, 1, 1, 1, 1,
1.130804, 0.6531263, 1.505661, 1, 1, 1, 1, 1,
1.130933, -0.5309954, 3.53175, 0, 0, 1, 1, 1,
1.145271, -0.7388912, 3.151381, 1, 0, 0, 1, 1,
1.155689, -1.398475, 2.373817, 1, 0, 0, 1, 1,
1.160307, 1.012412, 2.735884, 1, 0, 0, 1, 1,
1.162518, 0.479654, -0.06809577, 1, 0, 0, 1, 1,
1.163109, 1.145603, -0.582022, 1, 0, 0, 1, 1,
1.164134, -0.1048434, 0.0796454, 0, 0, 0, 1, 1,
1.164868, 0.07874689, 2.381723, 0, 0, 0, 1, 1,
1.172115, -0.008484097, 2.391311, 0, 0, 0, 1, 1,
1.178237, -0.1151725, 1.70763, 0, 0, 0, 1, 1,
1.178912, -0.3342101, 1.617064, 0, 0, 0, 1, 1,
1.182641, -0.5222737, 2.235612, 0, 0, 0, 1, 1,
1.185604, 1.796493, 0.9706511, 0, 0, 0, 1, 1,
1.187459, 0.1507543, 1.311263, 1, 1, 1, 1, 1,
1.191501, 0.2359082, 0.8284497, 1, 1, 1, 1, 1,
1.192228, -0.7878281, 2.492315, 1, 1, 1, 1, 1,
1.209877, -0.8715816, 2.511461, 1, 1, 1, 1, 1,
1.215797, 0.3852191, 2.01653, 1, 1, 1, 1, 1,
1.2207, -0.8046706, 3.380016, 1, 1, 1, 1, 1,
1.224218, -2.365803, 3.325776, 1, 1, 1, 1, 1,
1.227781, -0.5272163, 2.389191, 1, 1, 1, 1, 1,
1.230885, 0.2601474, 1.566787, 1, 1, 1, 1, 1,
1.234711, -0.6202097, 4.187835, 1, 1, 1, 1, 1,
1.239483, 0.4087446, 1.591322, 1, 1, 1, 1, 1,
1.240339, 1.876465, 1.738164, 1, 1, 1, 1, 1,
1.247622, 0.930887, 1.152022, 1, 1, 1, 1, 1,
1.248385, 0.6181355, 1.040788, 1, 1, 1, 1, 1,
1.248474, 0.2297186, 1.108028, 1, 1, 1, 1, 1,
1.259316, -0.3943026, 1.836664, 0, 0, 1, 1, 1,
1.262221, 0.8464364, 0.5824919, 1, 0, 0, 1, 1,
1.271885, 1.268085, -0.04801481, 1, 0, 0, 1, 1,
1.273503, -0.1823675, 0.0591206, 1, 0, 0, 1, 1,
1.274773, -0.5482643, 1.291332, 1, 0, 0, 1, 1,
1.277023, 2.308681, 0.07631861, 1, 0, 0, 1, 1,
1.286817, 0.1137549, 1.344415, 0, 0, 0, 1, 1,
1.30262, -2.224435, 2.136667, 0, 0, 0, 1, 1,
1.303244, -0.7816411, 3.951219, 0, 0, 0, 1, 1,
1.308454, -0.4193679, 1.498659, 0, 0, 0, 1, 1,
1.316987, 0.1533808, 1.41356, 0, 0, 0, 1, 1,
1.331803, -2.08095, 3.944122, 0, 0, 0, 1, 1,
1.338086, 1.130996, 0.3228265, 0, 0, 0, 1, 1,
1.340698, -1.089278, 2.26726, 1, 1, 1, 1, 1,
1.348693, -0.9562267, 2.439471, 1, 1, 1, 1, 1,
1.368094, 1.661463, 1.072719, 1, 1, 1, 1, 1,
1.376386, 1.163319, 1.068663, 1, 1, 1, 1, 1,
1.379524, 0.4488992, 1.302812, 1, 1, 1, 1, 1,
1.379667, 0.5746725, 1.543954, 1, 1, 1, 1, 1,
1.386895, -1.031799, 0.957098, 1, 1, 1, 1, 1,
1.387559, 1.23433, 0.1490898, 1, 1, 1, 1, 1,
1.396931, -1.032909, 3.04905, 1, 1, 1, 1, 1,
1.399159, -0.4844809, 1.495101, 1, 1, 1, 1, 1,
1.404981, -1.118962, 1.514836, 1, 1, 1, 1, 1,
1.414772, -0.1389884, 0.9559708, 1, 1, 1, 1, 1,
1.42055, 0.1212821, 0.512761, 1, 1, 1, 1, 1,
1.422428, -2.307596, 3.10125, 1, 1, 1, 1, 1,
1.428622, -1.430989, 2.613737, 1, 1, 1, 1, 1,
1.429193, 0.5602229, 1.300928, 0, 0, 1, 1, 1,
1.435091, 0.5957786, 0.852726, 1, 0, 0, 1, 1,
1.441164, 1.223736, -0.2483627, 1, 0, 0, 1, 1,
1.441697, 1.04881, -0.2809466, 1, 0, 0, 1, 1,
1.450004, 0.4564887, -0.02966043, 1, 0, 0, 1, 1,
1.452224, 1.114573, 1.18927, 1, 0, 0, 1, 1,
1.45946, 1.193835, 1.792335, 0, 0, 0, 1, 1,
1.460193, 0.8681043, 0.7836564, 0, 0, 0, 1, 1,
1.480363, 0.07752143, 2.193548, 0, 0, 0, 1, 1,
1.485525, 0.6168787, -0.2455661, 0, 0, 0, 1, 1,
1.487102, -1.972454, 3.452007, 0, 0, 0, 1, 1,
1.489852, 1.111784, 1.52114, 0, 0, 0, 1, 1,
1.490513, 0.1137406, 1.662266, 0, 0, 0, 1, 1,
1.507694, 0.1230272, 1.179235, 1, 1, 1, 1, 1,
1.509331, 0.3182663, 0.7401248, 1, 1, 1, 1, 1,
1.513224, -0.1658098, 2.284707, 1, 1, 1, 1, 1,
1.513928, 0.5434208, 1.433699, 1, 1, 1, 1, 1,
1.522517, 0.8846964, 0.9981824, 1, 1, 1, 1, 1,
1.529179, -0.8633603, 1.111761, 1, 1, 1, 1, 1,
1.531451, -1.402947, 1.493391, 1, 1, 1, 1, 1,
1.535526, -1.545763, 2.569035, 1, 1, 1, 1, 1,
1.542644, -0.7672626, 2.227759, 1, 1, 1, 1, 1,
1.547812, -1.127187, 2.1603, 1, 1, 1, 1, 1,
1.559533, 0.002239687, 0.2716399, 1, 1, 1, 1, 1,
1.567075, 0.4931132, 0.4465187, 1, 1, 1, 1, 1,
1.568635, 0.8265473, -1.469709, 1, 1, 1, 1, 1,
1.569036, -0.02808693, 1.169693, 1, 1, 1, 1, 1,
1.575665, 0.4728204, 1.333773, 1, 1, 1, 1, 1,
1.589058, -0.0005131016, 2.540953, 0, 0, 1, 1, 1,
1.619986, 0.2306676, 1.447164, 1, 0, 0, 1, 1,
1.629064, -2.12446, 2.200745, 1, 0, 0, 1, 1,
1.633119, 1.716351, 2.270707, 1, 0, 0, 1, 1,
1.645176, -1.735031, 1.032561, 1, 0, 0, 1, 1,
1.649119, -0.03813552, 2.127943, 1, 0, 0, 1, 1,
1.658365, 0.3070983, 0.7093941, 0, 0, 0, 1, 1,
1.67477, -0.5525194, 2.914836, 0, 0, 0, 1, 1,
1.685601, 0.7046699, 1.69044, 0, 0, 0, 1, 1,
1.717369, 0.1976311, 2.723609, 0, 0, 0, 1, 1,
1.718557, -0.7807398, 0.9553891, 0, 0, 0, 1, 1,
1.746784, -0.4103173, 0.7325543, 0, 0, 0, 1, 1,
1.750874, 0.7526546, 0.6445686, 0, 0, 0, 1, 1,
1.80441, 0.3112367, 0.828391, 1, 1, 1, 1, 1,
1.817153, -1.247173, 2.350581, 1, 1, 1, 1, 1,
1.836822, 1.86783, 1.193324, 1, 1, 1, 1, 1,
1.838495, 0.6184213, 0.4512316, 1, 1, 1, 1, 1,
1.848569, 0.5750907, 2.138479, 1, 1, 1, 1, 1,
1.853258, 1.354964, -1.247934, 1, 1, 1, 1, 1,
1.879573, 0.3097725, 2.410136, 1, 1, 1, 1, 1,
1.888839, 1.221192, 1.541332, 1, 1, 1, 1, 1,
1.901938, 0.4342173, 1.263973, 1, 1, 1, 1, 1,
1.937547, -0.129334, 1.611285, 1, 1, 1, 1, 1,
1.960103, 2.692164, 0.6797908, 1, 1, 1, 1, 1,
1.990758, 1.716458, 0.5357197, 1, 1, 1, 1, 1,
1.99804, -0.7917904, 1.284876, 1, 1, 1, 1, 1,
2.000245, 0.1451614, 0.02678466, 1, 1, 1, 1, 1,
2.008052, 0.2711871, 0.3968198, 1, 1, 1, 1, 1,
2.025734, -1.122706, 1.450329, 0, 0, 1, 1, 1,
2.067291, 1.560467, 0.6360656, 1, 0, 0, 1, 1,
2.092473, -2.546569, 3.138948, 1, 0, 0, 1, 1,
2.103878, -0.3001499, 0.2530207, 1, 0, 0, 1, 1,
2.125212, -0.173284, 1.721481, 1, 0, 0, 1, 1,
2.140475, -0.8182564, 2.607804, 1, 0, 0, 1, 1,
2.153959, -0.3301077, 2.512426, 0, 0, 0, 1, 1,
2.18063, -1.200537, 3.589455, 0, 0, 0, 1, 1,
2.222064, 0.3958933, 2.557323, 0, 0, 0, 1, 1,
2.24699, -1.095763, 2.379829, 0, 0, 0, 1, 1,
2.276486, -0.1730685, 0.9664725, 0, 0, 0, 1, 1,
2.309318, 1.946188, 0.7070412, 0, 0, 0, 1, 1,
2.352514, 1.200142, 1.128159, 0, 0, 0, 1, 1,
2.444298, -0.2908222, 2.581615, 1, 1, 1, 1, 1,
2.46833, 0.3213276, 2.764961, 1, 1, 1, 1, 1,
2.543658, 0.1819734, 0.4975938, 1, 1, 1, 1, 1,
2.588976, 0.1236186, 1.282684, 1, 1, 1, 1, 1,
2.62833, 0.5697261, -0.3721805, 1, 1, 1, 1, 1,
2.942522, 1.045734, 0.7840037, 1, 1, 1, 1, 1,
3.293416, 0.5465645, 0.8809023, 1, 1, 1, 1, 1
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
var radius = 9.298655;
var distance = 32.66113;
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
mvMatrix.translate( -0.2484232, -0.05936038, -0.4213884 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.66113);
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
