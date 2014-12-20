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
-4.297487, -0.01672683, -1.954809, 1, 0, 0, 1,
-3.400929, -0.2467751, -3.115328, 1, 0.007843138, 0, 1,
-3.005961, -0.8218457, -1.67689, 1, 0.01176471, 0, 1,
-2.941981, 0.3071758, -2.055364, 1, 0.01960784, 0, 1,
-2.809507, -0.5075753, -1.555893, 1, 0.02352941, 0, 1,
-2.754887, -0.7032771, -1.534332, 1, 0.03137255, 0, 1,
-2.533386, 0.684353, -2.62819, 1, 0.03529412, 0, 1,
-2.481954, -0.6396868, -2.037063, 1, 0.04313726, 0, 1,
-2.446776, 0.3634859, -0.1418634, 1, 0.04705882, 0, 1,
-2.373072, 0.2024729, 0.06909147, 1, 0.05490196, 0, 1,
-2.339641, -0.6566103, 1.015049, 1, 0.05882353, 0, 1,
-2.244106, -0.6066417, -0.7256861, 1, 0.06666667, 0, 1,
-2.207765, -0.3453602, -2.13555, 1, 0.07058824, 0, 1,
-2.19357, -0.9054358, -2.197235, 1, 0.07843138, 0, 1,
-2.175637, -0.6728808, -0.8210413, 1, 0.08235294, 0, 1,
-2.11289, -0.764966, -1.139558, 1, 0.09019608, 0, 1,
-2.112159, -0.3474888, -1.642076, 1, 0.09411765, 0, 1,
-2.104766, 1.266061, -0.5322675, 1, 0.1019608, 0, 1,
-2.103954, 0.5398023, -2.125592, 1, 0.1098039, 0, 1,
-2.090063, -0.6228122, -1.407193, 1, 0.1137255, 0, 1,
-2.031801, -1.27637, -1.462552, 1, 0.1215686, 0, 1,
-2.00733, -0.8285405, -1.948986, 1, 0.1254902, 0, 1,
-1.981625, -0.5842714, -2.443064, 1, 0.1333333, 0, 1,
-1.940621, -1.290297, 0.1167944, 1, 0.1372549, 0, 1,
-1.921946, -0.8478994, -1.129365, 1, 0.145098, 0, 1,
-1.901288, -0.3020543, -1.781417, 1, 0.1490196, 0, 1,
-1.895843, 0.2972996, -2.194629, 1, 0.1568628, 0, 1,
-1.876419, -1.061743, -3.797185, 1, 0.1607843, 0, 1,
-1.866377, -0.6736068, -1.23693, 1, 0.1686275, 0, 1,
-1.833206, -0.9490034, -2.910162, 1, 0.172549, 0, 1,
-1.82639, -1.930819, -3.221967, 1, 0.1803922, 0, 1,
-1.819306, -0.2673917, -2.794359, 1, 0.1843137, 0, 1,
-1.812714, -1.691693, -3.243136, 1, 0.1921569, 0, 1,
-1.799502, 0.2349237, -0.5788884, 1, 0.1960784, 0, 1,
-1.793142, -1.005424, -1.337225, 1, 0.2039216, 0, 1,
-1.768212, -0.04855759, -2.517165, 1, 0.2117647, 0, 1,
-1.734311, -0.4169121, -1.674884, 1, 0.2156863, 0, 1,
-1.731062, -0.1815828, -0.5265166, 1, 0.2235294, 0, 1,
-1.730384, -1.917531, -2.074325, 1, 0.227451, 0, 1,
-1.716054, -0.4135414, -2.075714, 1, 0.2352941, 0, 1,
-1.711967, 0.8174549, -0.3633802, 1, 0.2392157, 0, 1,
-1.711208, 1.241161, -0.4731352, 1, 0.2470588, 0, 1,
-1.708408, -0.6394337, -1.318955, 1, 0.2509804, 0, 1,
-1.690313, -0.1506515, -0.7995318, 1, 0.2588235, 0, 1,
-1.681157, 0.7948543, -2.377027, 1, 0.2627451, 0, 1,
-1.641573, 0.9848356, -0.8911354, 1, 0.2705882, 0, 1,
-1.631247, -0.8850096, -1.487073, 1, 0.2745098, 0, 1,
-1.615039, -1.478782, -1.678869, 1, 0.282353, 0, 1,
-1.608965, 0.1026767, -1.04735, 1, 0.2862745, 0, 1,
-1.599334, 0.3574339, -1.232554, 1, 0.2941177, 0, 1,
-1.597444, 1.721471, -2.58093, 1, 0.3019608, 0, 1,
-1.582553, -1.968869, -1.245925, 1, 0.3058824, 0, 1,
-1.582551, 0.5556858, -0.5099434, 1, 0.3137255, 0, 1,
-1.549509, -0.6018947, -1.211611, 1, 0.3176471, 0, 1,
-1.539944, 0.2837066, -0.3180668, 1, 0.3254902, 0, 1,
-1.539262, -0.04199448, -3.501874, 1, 0.3294118, 0, 1,
-1.520288, -0.1258396, -1.790779, 1, 0.3372549, 0, 1,
-1.50462, -1.062905, -2.420542, 1, 0.3411765, 0, 1,
-1.498674, -1.523036, -0.1363482, 1, 0.3490196, 0, 1,
-1.485633, -0.3404515, -0.6943115, 1, 0.3529412, 0, 1,
-1.480174, -1.27844, -2.154441, 1, 0.3607843, 0, 1,
-1.456021, 1.181724, -1.406139, 1, 0.3647059, 0, 1,
-1.449259, 0.3034251, -3.799036, 1, 0.372549, 0, 1,
-1.448834, 0.4357318, -1.386113, 1, 0.3764706, 0, 1,
-1.442422, 1.044346, -0.8730435, 1, 0.3843137, 0, 1,
-1.440094, 0.6731254, -1.537352, 1, 0.3882353, 0, 1,
-1.438707, -0.9953981, -1.234508, 1, 0.3960784, 0, 1,
-1.433838, -0.7579588, -3.176699, 1, 0.4039216, 0, 1,
-1.428702, -0.6069167, -2.402016, 1, 0.4078431, 0, 1,
-1.427152, -2.717656, -3.522953, 1, 0.4156863, 0, 1,
-1.420648, 0.1421491, -1.389924, 1, 0.4196078, 0, 1,
-1.414885, 0.2463447, -1.602144, 1, 0.427451, 0, 1,
-1.410043, 0.03046064, -1.689707, 1, 0.4313726, 0, 1,
-1.40346, 1.127895, -1.54575, 1, 0.4392157, 0, 1,
-1.393112, -1.302527, -2.138707, 1, 0.4431373, 0, 1,
-1.377693, 0.5488672, -1.586821, 1, 0.4509804, 0, 1,
-1.369976, -0.605469, -3.821421, 1, 0.454902, 0, 1,
-1.369495, -0.1585215, -1.414715, 1, 0.4627451, 0, 1,
-1.350177, -0.5732337, -1.630018, 1, 0.4666667, 0, 1,
-1.341913, 0.728766, -1.018574, 1, 0.4745098, 0, 1,
-1.341567, 0.2117636, -0.6571405, 1, 0.4784314, 0, 1,
-1.338642, 0.6557461, -1.288928, 1, 0.4862745, 0, 1,
-1.326293, -1.976721, -1.977618, 1, 0.4901961, 0, 1,
-1.325187, -0.2512023, -1.690701, 1, 0.4980392, 0, 1,
-1.32074, -0.3777469, -0.5599079, 1, 0.5058824, 0, 1,
-1.318301, -0.9947627, -1.594311, 1, 0.509804, 0, 1,
-1.297598, -0.8095936, -2.543679, 1, 0.5176471, 0, 1,
-1.291106, -1.093408, -1.040359, 1, 0.5215687, 0, 1,
-1.287863, -2.052046, -1.823394, 1, 0.5294118, 0, 1,
-1.286104, -0.4136418, -0.8447962, 1, 0.5333334, 0, 1,
-1.285532, -0.9196858, -2.043736, 1, 0.5411765, 0, 1,
-1.283536, -0.5525796, -1.882581, 1, 0.5450981, 0, 1,
-1.282502, 0.8856634, -2.714352, 1, 0.5529412, 0, 1,
-1.281625, -0.879377, -1.474408, 1, 0.5568628, 0, 1,
-1.27963, 0.2033604, -0.661485, 1, 0.5647059, 0, 1,
-1.263741, 0.9105245, 0.3965145, 1, 0.5686275, 0, 1,
-1.25266, -0.406136, -2.396684, 1, 0.5764706, 0, 1,
-1.252457, -0.282073, -1.563925, 1, 0.5803922, 0, 1,
-1.248618, -1.278973, -3.172644, 1, 0.5882353, 0, 1,
-1.24771, 1.167161, 0.08238392, 1, 0.5921569, 0, 1,
-1.246223, -0.173868, -1.698021, 1, 0.6, 0, 1,
-1.238853, -1.711992, -3.50947, 1, 0.6078432, 0, 1,
-1.234992, 1.242451, -0.9562929, 1, 0.6117647, 0, 1,
-1.231917, -0.8873402, -3.584233, 1, 0.6196079, 0, 1,
-1.215733, 0.1767772, -1.991152, 1, 0.6235294, 0, 1,
-1.215669, 0.1863993, -1.640204, 1, 0.6313726, 0, 1,
-1.212428, 0.7959887, -0.5526461, 1, 0.6352941, 0, 1,
-1.203605, -0.0207388, -2.660972, 1, 0.6431373, 0, 1,
-1.199776, -0.4628118, -0.7031925, 1, 0.6470588, 0, 1,
-1.175827, -0.794112, -2.359632, 1, 0.654902, 0, 1,
-1.17558, -0.5229285, -2.714188, 1, 0.6588235, 0, 1,
-1.170006, 0.309606, -0.5924551, 1, 0.6666667, 0, 1,
-1.151505, 0.7617381, -1.092287, 1, 0.6705883, 0, 1,
-1.151132, -0.5291709, -1.903384, 1, 0.6784314, 0, 1,
-1.145657, 0.607305, -0.4866215, 1, 0.682353, 0, 1,
-1.145215, -0.4390307, -1.993792, 1, 0.6901961, 0, 1,
-1.141292, 0.3474182, 0.1600191, 1, 0.6941177, 0, 1,
-1.1284, -0.8458857, -4.176539, 1, 0.7019608, 0, 1,
-1.126229, -0.9226819, -0.693488, 1, 0.7098039, 0, 1,
-1.121485, -0.9125309, -1.436473, 1, 0.7137255, 0, 1,
-1.118189, 2.495927, -1.566639, 1, 0.7215686, 0, 1,
-1.117522, -0.3834157, -1.6364, 1, 0.7254902, 0, 1,
-1.116074, -0.1375329, -1.167281, 1, 0.7333333, 0, 1,
-1.112017, -0.3560044, -1.773538, 1, 0.7372549, 0, 1,
-1.110623, 0.8604831, -1.436795, 1, 0.7450981, 0, 1,
-1.110595, -0.3258968, -1.125277, 1, 0.7490196, 0, 1,
-1.109893, -0.9114089, -3.431522, 1, 0.7568628, 0, 1,
-1.109765, 0.02882925, -2.082349, 1, 0.7607843, 0, 1,
-1.106648, 0.5356459, -1.919828, 1, 0.7686275, 0, 1,
-1.101509, 1.249408, -0.8954241, 1, 0.772549, 0, 1,
-1.098242, -1.284727, -1.924675, 1, 0.7803922, 0, 1,
-1.091696, -2.110343, -2.065375, 1, 0.7843137, 0, 1,
-1.090427, 1.194396, -1.234483, 1, 0.7921569, 0, 1,
-1.090201, 1.279939, -0.9614751, 1, 0.7960784, 0, 1,
-1.087607, 0.4626987, -0.7804126, 1, 0.8039216, 0, 1,
-1.084416, -1.712877, -1.826301, 1, 0.8117647, 0, 1,
-1.083028, 0.3672396, -0.7327911, 1, 0.8156863, 0, 1,
-1.080189, -0.3073552, -0.1126824, 1, 0.8235294, 0, 1,
-1.074271, -0.3086671, -2.111558, 1, 0.827451, 0, 1,
-1.073962, 0.9745963, 0.4375301, 1, 0.8352941, 0, 1,
-1.071853, -1.384297, -3.185296, 1, 0.8392157, 0, 1,
-1.066602, -0.09081804, -1.735674, 1, 0.8470588, 0, 1,
-1.054887, -1.66644, -1.414369, 1, 0.8509804, 0, 1,
-1.054386, 0.1787896, 0.1541478, 1, 0.8588235, 0, 1,
-1.049677, 2.429575, 0.8252234, 1, 0.8627451, 0, 1,
-1.046525, -0.7377095, -0.3969317, 1, 0.8705882, 0, 1,
-1.045845, 0.4584534, -0.6821064, 1, 0.8745098, 0, 1,
-1.045106, 0.4763308, -2.243232, 1, 0.8823529, 0, 1,
-1.0388, -1.632461, -3.857714, 1, 0.8862745, 0, 1,
-1.028708, -0.1665936, -2.965952, 1, 0.8941177, 0, 1,
-1.021749, -1.818068, -1.092203, 1, 0.8980392, 0, 1,
-1.018637, 1.297674, -0.6953518, 1, 0.9058824, 0, 1,
-1.015425, -1.993796, -2.992148, 1, 0.9137255, 0, 1,
-1.013965, -0.6200195, -2.890306, 1, 0.9176471, 0, 1,
-1.006207, 1.398813, -1.431212, 1, 0.9254902, 0, 1,
-1.000403, 0.4202993, -1.654246, 1, 0.9294118, 0, 1,
-0.9926606, 1.383827, -1.666589, 1, 0.9372549, 0, 1,
-0.9915428, -0.2371266, -0.2170272, 1, 0.9411765, 0, 1,
-0.9915121, -1.832355, -3.94203, 1, 0.9490196, 0, 1,
-0.9909125, -0.804581, -2.923544, 1, 0.9529412, 0, 1,
-0.9897968, -0.8590643, -2.293467, 1, 0.9607843, 0, 1,
-0.9845837, -1.00142, -3.536484, 1, 0.9647059, 0, 1,
-0.9777117, -1.218604, -3.729379, 1, 0.972549, 0, 1,
-0.9740617, -0.7863839, -3.749315, 1, 0.9764706, 0, 1,
-0.9693825, -1.238159, -2.71466, 1, 0.9843137, 0, 1,
-0.9545258, 0.4578654, -0.8900458, 1, 0.9882353, 0, 1,
-0.9529605, 0.09837899, -2.16081, 1, 0.9960784, 0, 1,
-0.9467776, -0.9579472, -0.4586371, 0.9960784, 1, 0, 1,
-0.9322838, -0.0145071, -2.356527, 0.9921569, 1, 0, 1,
-0.9303939, -0.3082082, -1.132774, 0.9843137, 1, 0, 1,
-0.929087, 0.8561505, 0.059188, 0.9803922, 1, 0, 1,
-0.9200463, -0.3406473, -2.77106, 0.972549, 1, 0, 1,
-0.9198028, 0.1240313, 0.2849856, 0.9686275, 1, 0, 1,
-0.9120771, 0.330679, -3.030864, 0.9607843, 1, 0, 1,
-0.9115129, 1.875606, -1.351836, 0.9568627, 1, 0, 1,
-0.9093168, -0.1680263, -0.5299882, 0.9490196, 1, 0, 1,
-0.9072616, -0.3615336, -1.780231, 0.945098, 1, 0, 1,
-0.9056473, 0.8261235, -0.570678, 0.9372549, 1, 0, 1,
-0.9053766, -0.9013304, -2.179172, 0.9333333, 1, 0, 1,
-0.9047425, 1.904358, 1.237574, 0.9254902, 1, 0, 1,
-0.899462, 0.2002509, -0.800297, 0.9215686, 1, 0, 1,
-0.8955476, 0.4544654, -0.2813152, 0.9137255, 1, 0, 1,
-0.8943413, 0.3268813, -0.8417521, 0.9098039, 1, 0, 1,
-0.8939838, 1.253443, 0.7890099, 0.9019608, 1, 0, 1,
-0.8888095, -1.287157, -1.517076, 0.8941177, 1, 0, 1,
-0.8864871, 0.09271909, -1.695128, 0.8901961, 1, 0, 1,
-0.8753374, -1.090439, -2.694916, 0.8823529, 1, 0, 1,
-0.8741661, 0.8677043, -2.409901, 0.8784314, 1, 0, 1,
-0.8694536, -1.273967, -2.709309, 0.8705882, 1, 0, 1,
-0.8624142, 1.049976, -0.08652978, 0.8666667, 1, 0, 1,
-0.8608308, 0.5984885, 0.1950148, 0.8588235, 1, 0, 1,
-0.8542621, 0.8848649, -0.2863807, 0.854902, 1, 0, 1,
-0.8501192, -0.01039015, -1.533297, 0.8470588, 1, 0, 1,
-0.8460339, 0.139093, -2.26096, 0.8431373, 1, 0, 1,
-0.8431661, -0.7283411, -3.524345, 0.8352941, 1, 0, 1,
-0.8413559, -0.0147704, -1.307665, 0.8313726, 1, 0, 1,
-0.8390115, -1.004138, -2.943382, 0.8235294, 1, 0, 1,
-0.8304451, 1.074346, -0.1144967, 0.8196079, 1, 0, 1,
-0.8284106, -0.2132234, -0.3026155, 0.8117647, 1, 0, 1,
-0.8257538, 1.365272, -0.09216952, 0.8078431, 1, 0, 1,
-0.8227258, -0.6213616, -2.535417, 0.8, 1, 0, 1,
-0.8218569, 0.3309689, -1.253867, 0.7921569, 1, 0, 1,
-0.8173779, 0.3129215, -2.595842, 0.7882353, 1, 0, 1,
-0.8158208, 1.234537, -3.030043, 0.7803922, 1, 0, 1,
-0.8147651, -0.7081947, -2.867992, 0.7764706, 1, 0, 1,
-0.8046809, 0.5184979, -1.396561, 0.7686275, 1, 0, 1,
-0.7996942, 0.662518, 0.03031666, 0.7647059, 1, 0, 1,
-0.7962965, -0.1314418, 0.2636776, 0.7568628, 1, 0, 1,
-0.7929984, -0.6522521, -3.180504, 0.7529412, 1, 0, 1,
-0.7906426, -1.163535, -1.484775, 0.7450981, 1, 0, 1,
-0.7851542, -0.5753328, -3.189743, 0.7411765, 1, 0, 1,
-0.7842352, -0.508099, -0.4301208, 0.7333333, 1, 0, 1,
-0.7837381, 0.6624013, -1.869241, 0.7294118, 1, 0, 1,
-0.7825763, 0.991626, -0.9698718, 0.7215686, 1, 0, 1,
-0.7822441, 0.4821988, 0.1075002, 0.7176471, 1, 0, 1,
-0.7798162, -0.08904488, -1.583606, 0.7098039, 1, 0, 1,
-0.7778459, -0.6829183, -2.624071, 0.7058824, 1, 0, 1,
-0.7754186, -0.2459529, -3.409889, 0.6980392, 1, 0, 1,
-0.77409, -0.196437, 0.1910968, 0.6901961, 1, 0, 1,
-0.7642802, -0.3304498, -0.2693478, 0.6862745, 1, 0, 1,
-0.7590521, 0.08978201, -0.2830647, 0.6784314, 1, 0, 1,
-0.7590492, 0.3066905, -0.2369246, 0.6745098, 1, 0, 1,
-0.7552398, 0.6010635, -2.499991, 0.6666667, 1, 0, 1,
-0.754628, -0.8281425, -2.370416, 0.6627451, 1, 0, 1,
-0.7539849, -0.04184651, -1.772506, 0.654902, 1, 0, 1,
-0.7538127, 0.7302516, -0.6667903, 0.6509804, 1, 0, 1,
-0.7536039, 0.3931261, -1.774421, 0.6431373, 1, 0, 1,
-0.7533957, 1.35807, 1.872558, 0.6392157, 1, 0, 1,
-0.750024, -1.252013, -0.9814471, 0.6313726, 1, 0, 1,
-0.7491129, 1.708484, -1.35728, 0.627451, 1, 0, 1,
-0.7479963, 0.1824487, -1.287892, 0.6196079, 1, 0, 1,
-0.7477112, -0.1668437, -1.771679, 0.6156863, 1, 0, 1,
-0.747695, 0.9395043, -0.8991482, 0.6078432, 1, 0, 1,
-0.7429261, -0.006896816, -0.8238373, 0.6039216, 1, 0, 1,
-0.7382616, -1.200464, -0.4525071, 0.5960785, 1, 0, 1,
-0.737273, -0.3778568, -1.609237, 0.5882353, 1, 0, 1,
-0.7356951, -1.454732, -2.279551, 0.5843138, 1, 0, 1,
-0.7333962, 2.76458, -0.8002692, 0.5764706, 1, 0, 1,
-0.731868, -1.841039, -2.98951, 0.572549, 1, 0, 1,
-0.7247796, -1.329099, -3.521228, 0.5647059, 1, 0, 1,
-0.7227088, -0.1655176, -2.322866, 0.5607843, 1, 0, 1,
-0.7185617, -0.310058, -4.218706, 0.5529412, 1, 0, 1,
-0.7163373, -0.8108006, -1.587588, 0.5490196, 1, 0, 1,
-0.711339, -0.3778895, -2.623994, 0.5411765, 1, 0, 1,
-0.7094544, -2.089524, -2.082401, 0.5372549, 1, 0, 1,
-0.7089257, -0.7409595, -2.364504, 0.5294118, 1, 0, 1,
-0.7066059, 0.7170828, -0.7254881, 0.5254902, 1, 0, 1,
-0.7052932, -1.91958, -2.551218, 0.5176471, 1, 0, 1,
-0.7019373, 0.1063013, -0.1398751, 0.5137255, 1, 0, 1,
-0.6839302, -1.254307, -3.524587, 0.5058824, 1, 0, 1,
-0.6801307, -0.9713768, -2.003479, 0.5019608, 1, 0, 1,
-0.6735166, -1.307265, -1.017324, 0.4941176, 1, 0, 1,
-0.6734192, 1.349681, 0.353727, 0.4862745, 1, 0, 1,
-0.6708089, 0.4917641, -2.25606, 0.4823529, 1, 0, 1,
-0.668773, -1.379012, -1.85497, 0.4745098, 1, 0, 1,
-0.6686695, -0.7563688, -1.847917, 0.4705882, 1, 0, 1,
-0.6645935, -0.4772412, -3.257127, 0.4627451, 1, 0, 1,
-0.6617529, 0.2575739, -1.353803, 0.4588235, 1, 0, 1,
-0.6611762, 0.3436842, -1.430539, 0.4509804, 1, 0, 1,
-0.6611369, 1.51999, 0.6651658, 0.4470588, 1, 0, 1,
-0.6561928, 0.1303182, -3.388776, 0.4392157, 1, 0, 1,
-0.65325, -1.74463, -3.801939, 0.4352941, 1, 0, 1,
-0.6521643, -1.841828, -4.214338, 0.427451, 1, 0, 1,
-0.65084, 0.1725263, -0.401239, 0.4235294, 1, 0, 1,
-0.6480671, 0.9764028, -0.8250793, 0.4156863, 1, 0, 1,
-0.6449462, 0.6192127, 0.2927247, 0.4117647, 1, 0, 1,
-0.6344969, 0.6777559, 0.4614059, 0.4039216, 1, 0, 1,
-0.6332983, 0.283578, -0.1061314, 0.3960784, 1, 0, 1,
-0.6331324, 0.01288436, -1.210164, 0.3921569, 1, 0, 1,
-0.6329903, 0.3272474, -0.3001506, 0.3843137, 1, 0, 1,
-0.6292647, -0.1230338, -2.773675, 0.3803922, 1, 0, 1,
-0.6291763, -0.2734556, -0.1556465, 0.372549, 1, 0, 1,
-0.6255416, -1.287199, -2.571203, 0.3686275, 1, 0, 1,
-0.6182643, -0.2484836, -3.365622, 0.3607843, 1, 0, 1,
-0.6181732, -0.3408468, -2.356693, 0.3568628, 1, 0, 1,
-0.6126471, 0.1321253, -1.114598, 0.3490196, 1, 0, 1,
-0.6108286, 0.5009856, -0.7005862, 0.345098, 1, 0, 1,
-0.6069731, -0.0853744, -0.3330524, 0.3372549, 1, 0, 1,
-0.604715, -0.7147703, -2.511002, 0.3333333, 1, 0, 1,
-0.6032089, 0.4280888, -0.03618577, 0.3254902, 1, 0, 1,
-0.6021183, -2.23771, -3.282979, 0.3215686, 1, 0, 1,
-0.6013424, 0.7154051, -1.586677, 0.3137255, 1, 0, 1,
-0.5992833, -0.4404046, -1.4976, 0.3098039, 1, 0, 1,
-0.5990095, 1.967608, -0.8905236, 0.3019608, 1, 0, 1,
-0.5871602, -1.136573, -4.20381, 0.2941177, 1, 0, 1,
-0.5792189, -1.195697, -2.558232, 0.2901961, 1, 0, 1,
-0.5692775, -1.637322, -3.156382, 0.282353, 1, 0, 1,
-0.5645049, -0.1170805, -0.5111407, 0.2784314, 1, 0, 1,
-0.562964, 1.156416, -0.04654782, 0.2705882, 1, 0, 1,
-0.5610359, -0.151175, -1.570219, 0.2666667, 1, 0, 1,
-0.5591735, 1.284626, 1.507109, 0.2588235, 1, 0, 1,
-0.5569641, 0.2614423, -2.69133, 0.254902, 1, 0, 1,
-0.555773, 1.216901, 0.5376055, 0.2470588, 1, 0, 1,
-0.5518304, -0.8206214, -3.443285, 0.2431373, 1, 0, 1,
-0.5493207, -0.5008531, -1.850184, 0.2352941, 1, 0, 1,
-0.5377242, 0.04888666, -0.5574406, 0.2313726, 1, 0, 1,
-0.5335053, 1.610317, -1.434904, 0.2235294, 1, 0, 1,
-0.5329248, 1.903067, -0.2706292, 0.2196078, 1, 0, 1,
-0.5285457, 0.8683205, -1.552307, 0.2117647, 1, 0, 1,
-0.5253164, -1.633722, -5.298209, 0.2078431, 1, 0, 1,
-0.5251998, 1.149555, 0.1970126, 0.2, 1, 0, 1,
-0.5247395, -0.9020576, -0.8949659, 0.1921569, 1, 0, 1,
-0.5247247, 0.03514133, 0.001954831, 0.1882353, 1, 0, 1,
-0.5236081, -1.776643, -2.652488, 0.1803922, 1, 0, 1,
-0.5227672, -2.510618, -2.047371, 0.1764706, 1, 0, 1,
-0.5055882, -0.6803934, -1.9767, 0.1686275, 1, 0, 1,
-0.5040473, 2.749297, 0.167409, 0.1647059, 1, 0, 1,
-0.5020368, 1.31334, -1.056259, 0.1568628, 1, 0, 1,
-0.4993105, 2.273048, 1.573766, 0.1529412, 1, 0, 1,
-0.4983555, 0.7922276, 0.2755454, 0.145098, 1, 0, 1,
-0.4976243, 0.1998371, -2.888818, 0.1411765, 1, 0, 1,
-0.4960136, -0.4541493, -1.765149, 0.1333333, 1, 0, 1,
-0.4940648, -1.119996, -1.652995, 0.1294118, 1, 0, 1,
-0.4938101, 1.187418, -1.035691, 0.1215686, 1, 0, 1,
-0.4937063, 1.020198, 0.1613902, 0.1176471, 1, 0, 1,
-0.4934384, 0.2280401, -1.507424, 0.1098039, 1, 0, 1,
-0.4896255, -1.659872, -3.649174, 0.1058824, 1, 0, 1,
-0.4857073, 1.261777, -0.7244051, 0.09803922, 1, 0, 1,
-0.4839306, -1.23203, -2.369262, 0.09019608, 1, 0, 1,
-0.4814834, -0.5942577, -4.409252, 0.08627451, 1, 0, 1,
-0.4791417, 2.494385, -0.6034896, 0.07843138, 1, 0, 1,
-0.4694741, 0.7932202, -2.140589, 0.07450981, 1, 0, 1,
-0.4681448, -0.5440245, -3.392858, 0.06666667, 1, 0, 1,
-0.4522338, 0.7382963, 0.8644651, 0.0627451, 1, 0, 1,
-0.4510171, 1.616156, -1.784302, 0.05490196, 1, 0, 1,
-0.4507327, -2.138783, -2.558159, 0.05098039, 1, 0, 1,
-0.4462858, 1.315454, -0.8569226, 0.04313726, 1, 0, 1,
-0.4424432, -0.9963968, -3.238422, 0.03921569, 1, 0, 1,
-0.441184, -1.101082, -4.199131, 0.03137255, 1, 0, 1,
-0.4408758, 1.006285, 0.3183725, 0.02745098, 1, 0, 1,
-0.43727, -0.05630489, -2.04654, 0.01960784, 1, 0, 1,
-0.4357429, -0.5417327, -2.485998, 0.01568628, 1, 0, 1,
-0.4351773, 1.27442, -0.8669269, 0.007843138, 1, 0, 1,
-0.4340975, -0.3233736, -3.405914, 0.003921569, 1, 0, 1,
-0.4280045, -0.8471849, -2.016897, 0, 1, 0.003921569, 1,
-0.4269727, -0.680702, -2.969155, 0, 1, 0.01176471, 1,
-0.4260047, 2.342776, 0.3181961, 0, 1, 0.01568628, 1,
-0.4241625, 1.020966, -1.110223, 0, 1, 0.02352941, 1,
-0.4220478, 0.6948642, -1.934484, 0, 1, 0.02745098, 1,
-0.4212505, 0.6627815, -1.860989, 0, 1, 0.03529412, 1,
-0.4202606, 0.3799893, 0.9103161, 0, 1, 0.03921569, 1,
-0.4187479, -0.02549638, -2.735189, 0, 1, 0.04705882, 1,
-0.4183384, -0.8781343, -1.90298, 0, 1, 0.05098039, 1,
-0.4156139, 1.563678, -0.3938993, 0, 1, 0.05882353, 1,
-0.4145475, -2.05118, -2.539062, 0, 1, 0.0627451, 1,
-0.4144529, 0.04631443, -1.634645, 0, 1, 0.07058824, 1,
-0.40571, -1.488358, -3.50848, 0, 1, 0.07450981, 1,
-0.4055786, -1.541752, -2.050213, 0, 1, 0.08235294, 1,
-0.4036686, -0.05133052, -0.4867184, 0, 1, 0.08627451, 1,
-0.3963333, 0.2927302, -1.266429, 0, 1, 0.09411765, 1,
-0.3960209, 0.3024318, -0.183137, 0, 1, 0.1019608, 1,
-0.3956747, -0.3609105, -3.1856, 0, 1, 0.1058824, 1,
-0.392782, -0.970116, -3.516839, 0, 1, 0.1137255, 1,
-0.3912174, -0.2957079, -0.313402, 0, 1, 0.1176471, 1,
-0.3901855, -1.592636, -2.331861, 0, 1, 0.1254902, 1,
-0.3875987, -0.5687444, -2.657894, 0, 1, 0.1294118, 1,
-0.3872918, 0.8941911, 1.784068, 0, 1, 0.1372549, 1,
-0.3836144, 0.6016924, -0.9209742, 0, 1, 0.1411765, 1,
-0.3777077, 0.7362702, -0.09424917, 0, 1, 0.1490196, 1,
-0.3740553, -0.7009971, -3.054567, 0, 1, 0.1529412, 1,
-0.3730664, -0.35352, -2.597406, 0, 1, 0.1607843, 1,
-0.3729694, -0.2426735, -1.418811, 0, 1, 0.1647059, 1,
-0.3699742, 0.2815416, -1.675131, 0, 1, 0.172549, 1,
-0.3664459, 0.6169583, -1.356446, 0, 1, 0.1764706, 1,
-0.3650911, -1.089321, -2.279621, 0, 1, 0.1843137, 1,
-0.355538, 0.2014001, -1.904034, 0, 1, 0.1882353, 1,
-0.3433044, -0.6463426, -1.863, 0, 1, 0.1960784, 1,
-0.3428932, -0.5396895, -4.328453, 0, 1, 0.2039216, 1,
-0.3412393, 2.573004, -0.004084095, 0, 1, 0.2078431, 1,
-0.341076, -0.2115173, -2.683533, 0, 1, 0.2156863, 1,
-0.3392749, -0.08010518, -2.596642, 0, 1, 0.2196078, 1,
-0.3363279, 1.584629, -0.1456511, 0, 1, 0.227451, 1,
-0.3299629, 1.00243, 0.8673096, 0, 1, 0.2313726, 1,
-0.3272339, 1.020217, 0.01122444, 0, 1, 0.2392157, 1,
-0.3204629, 1.154513, 0.608309, 0, 1, 0.2431373, 1,
-0.31797, -0.2486536, -0.4755054, 0, 1, 0.2509804, 1,
-0.3139752, 0.1607675, -3.405547, 0, 1, 0.254902, 1,
-0.3122901, 1.367532, 0.1386459, 0, 1, 0.2627451, 1,
-0.3111688, 0.2091136, -2.300726, 0, 1, 0.2666667, 1,
-0.3109665, -1.855824, -2.847879, 0, 1, 0.2745098, 1,
-0.3081772, -1.065267, -3.906476, 0, 1, 0.2784314, 1,
-0.2985007, 0.8271942, -0.5782432, 0, 1, 0.2862745, 1,
-0.2930677, 0.855857, -1.885458, 0, 1, 0.2901961, 1,
-0.2906514, 1.074706, 1.063982, 0, 1, 0.2980392, 1,
-0.2905943, -1.062783, -2.691368, 0, 1, 0.3058824, 1,
-0.2878785, -0.7032862, -2.681986, 0, 1, 0.3098039, 1,
-0.2872683, 2.415939, 0.2603611, 0, 1, 0.3176471, 1,
-0.2849934, 0.05468553, -0.454303, 0, 1, 0.3215686, 1,
-0.282317, 0.672614, -0.2318687, 0, 1, 0.3294118, 1,
-0.2813987, 0.09603653, -1.926259, 0, 1, 0.3333333, 1,
-0.2776699, 0.580146, -1.827042, 0, 1, 0.3411765, 1,
-0.2771525, 1.501988, 1.632361, 0, 1, 0.345098, 1,
-0.2739573, -0.03103179, -1.897699, 0, 1, 0.3529412, 1,
-0.2737063, -1.752092, -3.311297, 0, 1, 0.3568628, 1,
-0.2726946, -0.868051, -2.479351, 0, 1, 0.3647059, 1,
-0.2722512, -0.2555731, -2.838825, 0, 1, 0.3686275, 1,
-0.2692285, -0.9271878, -3.526055, 0, 1, 0.3764706, 1,
-0.2690556, -0.2716809, -0.01978353, 0, 1, 0.3803922, 1,
-0.2689309, -2.150366, -3.579171, 0, 1, 0.3882353, 1,
-0.2681667, 0.2292487, -2.201153, 0, 1, 0.3921569, 1,
-0.2651501, -0.8619165, -2.785944, 0, 1, 0.4, 1,
-0.2624865, -0.3998742, -0.5237194, 0, 1, 0.4078431, 1,
-0.2509229, 1.135471, -0.3400183, 0, 1, 0.4117647, 1,
-0.2469268, -0.7060972, -2.270315, 0, 1, 0.4196078, 1,
-0.2400398, -1.565847, -1.657027, 0, 1, 0.4235294, 1,
-0.2379014, 0.8214775, 1.568822, 0, 1, 0.4313726, 1,
-0.2374323, -0.03894694, -1.292485, 0, 1, 0.4352941, 1,
-0.2369789, 0.2771965, -2.241345, 0, 1, 0.4431373, 1,
-0.2369483, 2.273987, -0.8319153, 0, 1, 0.4470588, 1,
-0.2359182, -0.9392901, -2.101497, 0, 1, 0.454902, 1,
-0.23429, -1.078735, -3.318423, 0, 1, 0.4588235, 1,
-0.2320896, -0.2009955, -2.11332, 0, 1, 0.4666667, 1,
-0.2308863, -0.3767856, -2.532439, 0, 1, 0.4705882, 1,
-0.227754, -0.7994089, -2.685446, 0, 1, 0.4784314, 1,
-0.2275643, -0.1012963, -2.175606, 0, 1, 0.4823529, 1,
-0.225113, -0.2221138, -2.734573, 0, 1, 0.4901961, 1,
-0.2249814, 2.124134, 0.4950825, 0, 1, 0.4941176, 1,
-0.2142304, -0.4605631, -1.904028, 0, 1, 0.5019608, 1,
-0.213523, 0.1526718, -2.317216, 0, 1, 0.509804, 1,
-0.2114164, -0.3208493, -2.481472, 0, 1, 0.5137255, 1,
-0.2069281, -0.07862052, -0.623196, 0, 1, 0.5215687, 1,
-0.2006226, -0.05684892, -1.023126, 0, 1, 0.5254902, 1,
-0.1958411, -1.519105, -3.029582, 0, 1, 0.5333334, 1,
-0.1908509, 2.281507, -0.6393189, 0, 1, 0.5372549, 1,
-0.1907042, -0.309254, -0.6682279, 0, 1, 0.5450981, 1,
-0.189076, -0.8777721, -2.793866, 0, 1, 0.5490196, 1,
-0.1843781, 0.7437682, -0.8868889, 0, 1, 0.5568628, 1,
-0.1824431, 0.05196811, -1.278686, 0, 1, 0.5607843, 1,
-0.1802965, -0.2416587, -2.627351, 0, 1, 0.5686275, 1,
-0.179775, 0.4629664, -0.1800536, 0, 1, 0.572549, 1,
-0.174272, -1.440642, -1.190781, 0, 1, 0.5803922, 1,
-0.1729649, -1.353966, -4.401998, 0, 1, 0.5843138, 1,
-0.1692807, 0.3676389, -0.3894795, 0, 1, 0.5921569, 1,
-0.1690577, -0.5428613, -4.068017, 0, 1, 0.5960785, 1,
-0.1657395, 0.003106921, -2.789938, 0, 1, 0.6039216, 1,
-0.1651025, 2.62165, -0.3714828, 0, 1, 0.6117647, 1,
-0.1645126, 0.4240708, -0.367687, 0, 1, 0.6156863, 1,
-0.1597834, 0.9750741, -0.4824581, 0, 1, 0.6235294, 1,
-0.1563417, -0.01946513, -0.84594, 0, 1, 0.627451, 1,
-0.151456, 1.815803, 0.6543803, 0, 1, 0.6352941, 1,
-0.1501308, 0.1579428, -1.478591, 0, 1, 0.6392157, 1,
-0.1437258, -0.4014756, -2.370876, 0, 1, 0.6470588, 1,
-0.1403988, -1.286376, -2.091585, 0, 1, 0.6509804, 1,
-0.138348, -0.7359136, -2.133085, 0, 1, 0.6588235, 1,
-0.1336004, 0.5813223, -1.220018, 0, 1, 0.6627451, 1,
-0.1315504, 1.125275, -0.7236261, 0, 1, 0.6705883, 1,
-0.1261778, -0.5542926, -3.154109, 0, 1, 0.6745098, 1,
-0.1257811, 0.3447349, -0.5603433, 0, 1, 0.682353, 1,
-0.1232667, -0.459527, -2.248077, 0, 1, 0.6862745, 1,
-0.1215867, 0.1764829, 1.03895, 0, 1, 0.6941177, 1,
-0.1215345, -0.3711811, -2.301739, 0, 1, 0.7019608, 1,
-0.1213873, -0.27542, -0.9813155, 0, 1, 0.7058824, 1,
-0.1205361, 0.4769374, -0.08153723, 0, 1, 0.7137255, 1,
-0.1187976, -0.9784866, -2.965301, 0, 1, 0.7176471, 1,
-0.1137397, -0.7208552, -2.050033, 0, 1, 0.7254902, 1,
-0.1134784, -1.226492, -2.978666, 0, 1, 0.7294118, 1,
-0.1130133, 1.844207, -0.6963885, 0, 1, 0.7372549, 1,
-0.1120651, -1.052022, -3.983732, 0, 1, 0.7411765, 1,
-0.1071448, -0.08725268, -3.760956, 0, 1, 0.7490196, 1,
-0.1071325, 0.6874666, -1.311612, 0, 1, 0.7529412, 1,
-0.1062299, -0.7507407, -1.758165, 0, 1, 0.7607843, 1,
-0.1031089, -1.203934, -4.354495, 0, 1, 0.7647059, 1,
-0.101877, -1.248006, -2.636677, 0, 1, 0.772549, 1,
-0.09173041, -0.628386, -1.261239, 0, 1, 0.7764706, 1,
-0.08370655, -0.5028127, -4.422282, 0, 1, 0.7843137, 1,
-0.08357254, -0.2022075, -3.681784, 0, 1, 0.7882353, 1,
-0.07683878, -1.329987, -2.106162, 0, 1, 0.7960784, 1,
-0.07002081, 0.8066024, -0.6240321, 0, 1, 0.8039216, 1,
-0.06962867, -1.972785, -2.053012, 0, 1, 0.8078431, 1,
-0.06834119, 0.4275088, -0.9989098, 0, 1, 0.8156863, 1,
-0.06649657, 0.4288158, -0.7409597, 0, 1, 0.8196079, 1,
-0.06513492, 0.9953746, -0.750181, 0, 1, 0.827451, 1,
-0.06180215, 1.509038, -1.031503, 0, 1, 0.8313726, 1,
-0.05771516, 0.651892, -1.338987, 0, 1, 0.8392157, 1,
-0.05584544, -1.06118, -4.049853, 0, 1, 0.8431373, 1,
-0.05466875, 0.7695993, -0.2116861, 0, 1, 0.8509804, 1,
-0.05442828, -0.4903952, -1.910684, 0, 1, 0.854902, 1,
-0.05410442, -0.3411369, -3.45408, 0, 1, 0.8627451, 1,
-0.05132615, 0.9184877, -1.425653, 0, 1, 0.8666667, 1,
-0.04687983, 0.162384, 0.5521874, 0, 1, 0.8745098, 1,
-0.04584217, -0.1027974, -2.542998, 0, 1, 0.8784314, 1,
-0.04525721, -0.3157552, -3.035144, 0, 1, 0.8862745, 1,
-0.0428947, -0.3258178, -1.478225, 0, 1, 0.8901961, 1,
-0.04016633, -1.475445, -4.65293, 0, 1, 0.8980392, 1,
-0.03289379, -1.156108, -2.846093, 0, 1, 0.9058824, 1,
-0.03166695, 0.04947696, -1.726496, 0, 1, 0.9098039, 1,
-0.02964306, 1.352409, -0.513131, 0, 1, 0.9176471, 1,
-0.0259697, -1.109726, -4.526481, 0, 1, 0.9215686, 1,
-0.02463924, 0.7708603, -0.3149137, 0, 1, 0.9294118, 1,
-0.01891949, -0.741798, -1.9727, 0, 1, 0.9333333, 1,
-0.01516926, -0.3337298, -1.790504, 0, 1, 0.9411765, 1,
-0.01304091, -0.1055477, -4.314676, 0, 1, 0.945098, 1,
-0.01044749, -0.5602325, -3.088905, 0, 1, 0.9529412, 1,
-0.01022909, 1.079691, 0.8880695, 0, 1, 0.9568627, 1,
-0.01013146, -1.153877, -1.778778, 0, 1, 0.9647059, 1,
-0.007024006, -0.6159772, -1.290297, 0, 1, 0.9686275, 1,
-0.006172031, -0.0100903, -2.689396, 0, 1, 0.9764706, 1,
-0.006164823, 0.3329297, -1.01695, 0, 1, 0.9803922, 1,
-0.006076517, -0.6046489, -2.696002, 0, 1, 0.9882353, 1,
-0.003608079, -1.036265, -3.09815, 0, 1, 0.9921569, 1,
0.004456926, -1.549862, 1.910711, 0, 1, 1, 1,
0.01988482, -2.173468, 3.204129, 0, 0.9921569, 1, 1,
0.02480204, -0.3771445, 3.637228, 0, 0.9882353, 1, 1,
0.02967839, -0.4526703, 1.961697, 0, 0.9803922, 1, 1,
0.03406771, 0.2656917, 0.2624575, 0, 0.9764706, 1, 1,
0.03507671, 1.00861, -0.2604623, 0, 0.9686275, 1, 1,
0.037687, 0.5969669, -1.6265, 0, 0.9647059, 1, 1,
0.04093667, 0.8947771, 0.007334234, 0, 0.9568627, 1, 1,
0.04224231, 0.9503123, -0.379961, 0, 0.9529412, 1, 1,
0.04350517, -1.213359, 3.51642, 0, 0.945098, 1, 1,
0.05031333, 1.334694, -0.3613752, 0, 0.9411765, 1, 1,
0.05248886, -0.4859335, 2.766168, 0, 0.9333333, 1, 1,
0.06188953, -0.01761962, 1.336232, 0, 0.9294118, 1, 1,
0.06235842, -0.1804453, 3.792408, 0, 0.9215686, 1, 1,
0.06328939, 1.318031, -0.6135417, 0, 0.9176471, 1, 1,
0.06529387, -0.26566, 2.481848, 0, 0.9098039, 1, 1,
0.06573042, 1.615205, -0.2703978, 0, 0.9058824, 1, 1,
0.07152922, 0.705131, -0.3702564, 0, 0.8980392, 1, 1,
0.07527556, -1.067081, 1.499323, 0, 0.8901961, 1, 1,
0.07886992, 1.761594, 0.1424988, 0, 0.8862745, 1, 1,
0.0790801, -0.3449284, 2.398291, 0, 0.8784314, 1, 1,
0.08064277, -1.089401, 2.534387, 0, 0.8745098, 1, 1,
0.08165288, 0.6750159, 0.9026947, 0, 0.8666667, 1, 1,
0.0925016, 0.2361913, -2.017502, 0, 0.8627451, 1, 1,
0.0942407, -0.7730692, 3.27478, 0, 0.854902, 1, 1,
0.09443826, -1.860794, 3.052029, 0, 0.8509804, 1, 1,
0.09459674, 0.8176081, 1.094986, 0, 0.8431373, 1, 1,
0.1017437, 1.795736, 0.114816, 0, 0.8392157, 1, 1,
0.1028646, -1.011687, 6.024611, 0, 0.8313726, 1, 1,
0.103772, -0.3490141, 3.97121, 0, 0.827451, 1, 1,
0.1059254, -0.02262591, 1.540518, 0, 0.8196079, 1, 1,
0.1060123, 1.030614, 1.299848, 0, 0.8156863, 1, 1,
0.1092873, 1.738586, -2.462441, 0, 0.8078431, 1, 1,
0.1106477, 0.2443374, -0.9641926, 0, 0.8039216, 1, 1,
0.122202, -0.8372523, 3.625483, 0, 0.7960784, 1, 1,
0.1238813, 0.01109676, 2.131697, 0, 0.7882353, 1, 1,
0.1303364, -1.322402, 3.851234, 0, 0.7843137, 1, 1,
0.1358787, 2.005397, 0.7771522, 0, 0.7764706, 1, 1,
0.1365287, -1.013521, 3.441691, 0, 0.772549, 1, 1,
0.1428884, -0.01414595, 1.40658, 0, 0.7647059, 1, 1,
0.1462817, -0.4251888, 1.93403, 0, 0.7607843, 1, 1,
0.1478098, 0.2477305, 0.6326391, 0, 0.7529412, 1, 1,
0.1479882, -0.3451219, 1.60731, 0, 0.7490196, 1, 1,
0.1500339, 0.6318615, -0.4843519, 0, 0.7411765, 1, 1,
0.1515509, -0.5071004, 4.123976, 0, 0.7372549, 1, 1,
0.1562389, -0.01759562, 2.655485, 0, 0.7294118, 1, 1,
0.1574094, 1.010214, -1.360106, 0, 0.7254902, 1, 1,
0.1582868, 1.026623, -1.063285, 0, 0.7176471, 1, 1,
0.1596095, -0.1607226, 1.300315, 0, 0.7137255, 1, 1,
0.1609786, 0.7645158, 0.879541, 0, 0.7058824, 1, 1,
0.1619061, -0.5940115, 2.008864, 0, 0.6980392, 1, 1,
0.1642427, -1.039668, 1.375946, 0, 0.6941177, 1, 1,
0.1671258, 1.362673, -0.06898779, 0, 0.6862745, 1, 1,
0.1738313, 1.893245, -0.9095967, 0, 0.682353, 1, 1,
0.1751844, -1.565039, 3.544471, 0, 0.6745098, 1, 1,
0.1790165, 0.3425129, 1.245548, 0, 0.6705883, 1, 1,
0.1797581, 0.6898682, 1.76172, 0, 0.6627451, 1, 1,
0.180195, 0.4129863, 1.246284, 0, 0.6588235, 1, 1,
0.1832808, -0.2623515, 1.853672, 0, 0.6509804, 1, 1,
0.1850137, 1.476819, 0.8616939, 0, 0.6470588, 1, 1,
0.186807, -1.281319, 3.045462, 0, 0.6392157, 1, 1,
0.1890521, -0.4019958, 2.714367, 0, 0.6352941, 1, 1,
0.1986503, 1.440624, -0.4181037, 0, 0.627451, 1, 1,
0.2070081, -0.5345893, 1.782776, 0, 0.6235294, 1, 1,
0.2088891, -0.7136586, 2.331338, 0, 0.6156863, 1, 1,
0.2106198, 0.09917245, 0.01618371, 0, 0.6117647, 1, 1,
0.2118352, -0.03784145, 2.112904, 0, 0.6039216, 1, 1,
0.2163383, 0.2562096, 1.151391, 0, 0.5960785, 1, 1,
0.2169823, 0.1882263, 1.815094, 0, 0.5921569, 1, 1,
0.2170445, 0.001501578, 1.136865, 0, 0.5843138, 1, 1,
0.2223745, -0.36455, 0.7130109, 0, 0.5803922, 1, 1,
0.2240792, -1.537236, 3.815052, 0, 0.572549, 1, 1,
0.2253917, 0.3262015, -0.167463, 0, 0.5686275, 1, 1,
0.2262262, 0.01190418, 1.302211, 0, 0.5607843, 1, 1,
0.2284579, -0.9245306, 2.732121, 0, 0.5568628, 1, 1,
0.2302963, -0.2468217, 1.460641, 0, 0.5490196, 1, 1,
0.2375063, 0.2541189, -1.720863, 0, 0.5450981, 1, 1,
0.2386821, -1.361086, 2.555187, 0, 0.5372549, 1, 1,
0.2388487, 1.285623, 0.04595884, 0, 0.5333334, 1, 1,
0.2394291, -0.5285976, 1.569991, 0, 0.5254902, 1, 1,
0.2395065, -0.1237861, 2.521293, 0, 0.5215687, 1, 1,
0.2416463, 0.6903501, 0.3540797, 0, 0.5137255, 1, 1,
0.241673, -0.1182898, 2.744984, 0, 0.509804, 1, 1,
0.2417493, -1.529765, 4.256375, 0, 0.5019608, 1, 1,
0.2448079, -0.981506, 3.028948, 0, 0.4941176, 1, 1,
0.2454369, -1.282549, 4.685788, 0, 0.4901961, 1, 1,
0.2456482, 1.037214, -0.8937088, 0, 0.4823529, 1, 1,
0.2479793, -0.02773019, 1.559295, 0, 0.4784314, 1, 1,
0.2481665, -0.8460512, 2.674962, 0, 0.4705882, 1, 1,
0.2580326, -0.2881186, 2.722148, 0, 0.4666667, 1, 1,
0.2590386, -0.07793692, 0.8019031, 0, 0.4588235, 1, 1,
0.2596948, 0.0726681, 1.540373, 0, 0.454902, 1, 1,
0.2634826, -1.45698, 3.147043, 0, 0.4470588, 1, 1,
0.2643777, -0.1488041, 4.250426, 0, 0.4431373, 1, 1,
0.2693738, 1.676617, 0.8019165, 0, 0.4352941, 1, 1,
0.2717023, 0.3616574, -0.7755388, 0, 0.4313726, 1, 1,
0.2761988, 0.7915584, 0.2853427, 0, 0.4235294, 1, 1,
0.2782924, 0.918213, -1.459993, 0, 0.4196078, 1, 1,
0.2790363, -0.5702048, 2.392338, 0, 0.4117647, 1, 1,
0.2805743, -0.6357355, 2.325212, 0, 0.4078431, 1, 1,
0.2811799, -0.1633217, 2.005741, 0, 0.4, 1, 1,
0.2812454, -0.9286126, 3.211976, 0, 0.3921569, 1, 1,
0.2915189, 0.4834111, 1.660168, 0, 0.3882353, 1, 1,
0.2927316, 1.680484, 1.023282, 0, 0.3803922, 1, 1,
0.300692, -0.205034, 1.172593, 0, 0.3764706, 1, 1,
0.3018984, 0.983604, -0.3208252, 0, 0.3686275, 1, 1,
0.304235, -2.461863, 4.300397, 0, 0.3647059, 1, 1,
0.305895, -0.7855372, 2.748548, 0, 0.3568628, 1, 1,
0.310242, -0.5648254, 4.406215, 0, 0.3529412, 1, 1,
0.3144426, -1.101023, 2.408465, 0, 0.345098, 1, 1,
0.3144499, 1.109737, -1.1158, 0, 0.3411765, 1, 1,
0.3162188, -0.2529758, 1.766716, 0, 0.3333333, 1, 1,
0.3200566, 0.05566623, 2.819968, 0, 0.3294118, 1, 1,
0.3223082, -1.072961, 2.660875, 0, 0.3215686, 1, 1,
0.3265056, -1.440535, 3.344312, 0, 0.3176471, 1, 1,
0.3278515, -0.9883235, 2.135562, 0, 0.3098039, 1, 1,
0.3281908, 0.3685628, 0.357918, 0, 0.3058824, 1, 1,
0.3328927, -0.5664089, 3.074499, 0, 0.2980392, 1, 1,
0.3363447, -1.816959, 2.454043, 0, 0.2901961, 1, 1,
0.3397215, 1.346459, 0.9807365, 0, 0.2862745, 1, 1,
0.3426876, -0.423556, 2.621208, 0, 0.2784314, 1, 1,
0.3429584, 0.8024487, 0.06397672, 0, 0.2745098, 1, 1,
0.3483081, -1.828728, 2.596201, 0, 0.2666667, 1, 1,
0.3503027, 0.410105, 1.290884, 0, 0.2627451, 1, 1,
0.3600831, -0.4059255, 1.755152, 0, 0.254902, 1, 1,
0.360763, 0.8603489, 1.039483, 0, 0.2509804, 1, 1,
0.3614495, 0.7901187, 0.7334549, 0, 0.2431373, 1, 1,
0.3677909, -0.1051871, 2.965408, 0, 0.2392157, 1, 1,
0.3729075, -0.7938284, 1.73904, 0, 0.2313726, 1, 1,
0.3755433, -1.182441, 3.31319, 0, 0.227451, 1, 1,
0.3767729, 1.484162, 0.1221198, 0, 0.2196078, 1, 1,
0.3778939, 0.5252386, 0.924887, 0, 0.2156863, 1, 1,
0.3792234, 0.4232726, 1.587504, 0, 0.2078431, 1, 1,
0.3805334, -0.3362813, 2.663725, 0, 0.2039216, 1, 1,
0.3825741, -1.403926, 2.417433, 0, 0.1960784, 1, 1,
0.3853669, 0.2740992, 1.587377, 0, 0.1882353, 1, 1,
0.3866324, -0.5219905, 1.645059, 0, 0.1843137, 1, 1,
0.3932742, 0.4283281, 0.3250433, 0, 0.1764706, 1, 1,
0.3977, 0.04355769, 3.776878, 0, 0.172549, 1, 1,
0.3982761, 0.2194645, 1.249547, 0, 0.1647059, 1, 1,
0.4026287, -0.5499022, 3.199029, 0, 0.1607843, 1, 1,
0.402896, 0.3373716, 2.663612, 0, 0.1529412, 1, 1,
0.4052926, -0.1169129, 1.838544, 0, 0.1490196, 1, 1,
0.4054868, -0.05056955, 1.042613, 0, 0.1411765, 1, 1,
0.4062722, 1.633211, -0.2194889, 0, 0.1372549, 1, 1,
0.4072618, 0.7174723, 1.793736, 0, 0.1294118, 1, 1,
0.4106647, 0.1670806, 1.267905, 0, 0.1254902, 1, 1,
0.413974, -0.7011276, 1.69145, 0, 0.1176471, 1, 1,
0.4143082, 1.319091, 0.7276236, 0, 0.1137255, 1, 1,
0.418425, 0.1957304, -0.1443316, 0, 0.1058824, 1, 1,
0.4184836, -0.5440748, 3.173666, 0, 0.09803922, 1, 1,
0.4277451, -0.06741179, 2.19199, 0, 0.09411765, 1, 1,
0.4296704, -0.09071705, 2.250899, 0, 0.08627451, 1, 1,
0.432719, 0.03471288, 1.718819, 0, 0.08235294, 1, 1,
0.4390555, 1.566541, -0.2520552, 0, 0.07450981, 1, 1,
0.4407173, -0.1651742, 2.833077, 0, 0.07058824, 1, 1,
0.4415884, 1.025105, 1.01858, 0, 0.0627451, 1, 1,
0.4432399, -0.1059235, -1.793317, 0, 0.05882353, 1, 1,
0.4460446, 0.2467028, 0.7214228, 0, 0.05098039, 1, 1,
0.4490237, -1.069846, 2.996137, 0, 0.04705882, 1, 1,
0.4508156, -0.3840816, 0.6919564, 0, 0.03921569, 1, 1,
0.4568683, 1.033167, 1.774413, 0, 0.03529412, 1, 1,
0.4587143, -0.1293423, 2.172375, 0, 0.02745098, 1, 1,
0.4594164, -0.1083937, 1.497495, 0, 0.02352941, 1, 1,
0.4606718, -0.9707715, 5.124704, 0, 0.01568628, 1, 1,
0.4607726, 0.5371728, -0.4939085, 0, 0.01176471, 1, 1,
0.4644588, -0.8810063, 2.105641, 0, 0.003921569, 1, 1,
0.4664979, 0.8053225, -0.1837748, 0.003921569, 0, 1, 1,
0.4674317, 0.04462596, 1.517558, 0.007843138, 0, 1, 1,
0.4677033, 0.9117113, 0.9545959, 0.01568628, 0, 1, 1,
0.4677853, 1.349813, 0.3073652, 0.01960784, 0, 1, 1,
0.4681217, -0.4419325, 2.610687, 0.02745098, 0, 1, 1,
0.4718335, 1.172607, 1.507291, 0.03137255, 0, 1, 1,
0.4719213, 0.7960854, 1.67596, 0.03921569, 0, 1, 1,
0.4725556, -1.20034, 2.930158, 0.04313726, 0, 1, 1,
0.4766639, 1.322085, 1.080737, 0.05098039, 0, 1, 1,
0.477657, -0.4030918, 1.77994, 0.05490196, 0, 1, 1,
0.4782702, -0.1589929, 1.218222, 0.0627451, 0, 1, 1,
0.4832602, 0.07256737, -1.237339, 0.06666667, 0, 1, 1,
0.4902961, 1.610792, -1.814245, 0.07450981, 0, 1, 1,
0.4912559, -0.2945366, 1.09809, 0.07843138, 0, 1, 1,
0.4970548, 0.5346679, 2.358896, 0.08627451, 0, 1, 1,
0.502735, 0.3223694, 0.7406628, 0.09019608, 0, 1, 1,
0.5039539, 1.301179, -0.1736831, 0.09803922, 0, 1, 1,
0.5074033, 1.487291, 0.1342219, 0.1058824, 0, 1, 1,
0.5098605, 1.231941, 1.037615, 0.1098039, 0, 1, 1,
0.5117477, -0.1596729, 1.854526, 0.1176471, 0, 1, 1,
0.5130914, -0.1422068, 2.292044, 0.1215686, 0, 1, 1,
0.5194581, -0.2012281, 1.926518, 0.1294118, 0, 1, 1,
0.521907, 0.2961963, 2.15541, 0.1333333, 0, 1, 1,
0.5222993, -1.104158, 3.293644, 0.1411765, 0, 1, 1,
0.5252532, 0.9490528, 2.776532, 0.145098, 0, 1, 1,
0.5273494, 1.804972, -0.5156441, 0.1529412, 0, 1, 1,
0.5274965, -1.050061, 2.279464, 0.1568628, 0, 1, 1,
0.5313425, -0.2271249, 2.349569, 0.1647059, 0, 1, 1,
0.5344164, 0.9048209, -0.4281448, 0.1686275, 0, 1, 1,
0.5362464, 0.2927836, 1.427553, 0.1764706, 0, 1, 1,
0.536878, -0.4640202, 1.666905, 0.1803922, 0, 1, 1,
0.5376821, 0.484106, 1.334435, 0.1882353, 0, 1, 1,
0.5458715, 0.8210652, 1.08294, 0.1921569, 0, 1, 1,
0.5459582, -0.3997523, 3.044127, 0.2, 0, 1, 1,
0.5559372, -0.3418396, 0.9000624, 0.2078431, 0, 1, 1,
0.5565504, 1.742875, -1.44162, 0.2117647, 0, 1, 1,
0.5588937, 3.570951, -1.303901, 0.2196078, 0, 1, 1,
0.5600141, 0.3516784, 2.192703, 0.2235294, 0, 1, 1,
0.5606468, 0.3542456, -0.2969643, 0.2313726, 0, 1, 1,
0.5651973, -1.385678, 2.634556, 0.2352941, 0, 1, 1,
0.572349, -0.1443937, 1.545589, 0.2431373, 0, 1, 1,
0.5753112, 0.4062653, 0.7071627, 0.2470588, 0, 1, 1,
0.5805497, -1.094998, 4.746701, 0.254902, 0, 1, 1,
0.5805758, 0.5094376, -0.3137478, 0.2588235, 0, 1, 1,
0.5824274, 0.5211765, 0.5725616, 0.2666667, 0, 1, 1,
0.5859079, -0.5423478, 2.340552, 0.2705882, 0, 1, 1,
0.5877299, 1.236862, 1.269278, 0.2784314, 0, 1, 1,
0.5889181, -0.803529, 2.169021, 0.282353, 0, 1, 1,
0.5915279, 0.05709748, 1.035844, 0.2901961, 0, 1, 1,
0.5916185, 0.09629901, 2.925809, 0.2941177, 0, 1, 1,
0.597403, -0.0767082, 2.256031, 0.3019608, 0, 1, 1,
0.5978844, 1.645303, 0.139244, 0.3098039, 0, 1, 1,
0.6059677, -1.297494, 3.608111, 0.3137255, 0, 1, 1,
0.6066887, 0.7770407, 0.04953221, 0.3215686, 0, 1, 1,
0.6222226, -1.070313, 2.323726, 0.3254902, 0, 1, 1,
0.6244729, -0.4074804, 1.854488, 0.3333333, 0, 1, 1,
0.6266789, -0.1692031, 2.166676, 0.3372549, 0, 1, 1,
0.6269544, 2.515976, -0.2569471, 0.345098, 0, 1, 1,
0.6309796, -0.8944812, 0.9955844, 0.3490196, 0, 1, 1,
0.6327966, -0.03489801, 4.465998, 0.3568628, 0, 1, 1,
0.6345887, 0.2077344, 1.451622, 0.3607843, 0, 1, 1,
0.6352468, 1.281763, 0.8590235, 0.3686275, 0, 1, 1,
0.6366656, 0.4007857, -0.9091743, 0.372549, 0, 1, 1,
0.6371582, -0.1981668, 2.477997, 0.3803922, 0, 1, 1,
0.642714, -0.2976292, 2.660854, 0.3843137, 0, 1, 1,
0.6531302, -0.5615262, 2.030538, 0.3921569, 0, 1, 1,
0.6533384, -0.9180637, 2.932726, 0.3960784, 0, 1, 1,
0.6561804, 1.222596, -1.375235, 0.4039216, 0, 1, 1,
0.6565229, 2.167235, 1.218133, 0.4117647, 0, 1, 1,
0.663293, 0.1905027, -0.1267313, 0.4156863, 0, 1, 1,
0.6638833, -0.1437443, -0.6766939, 0.4235294, 0, 1, 1,
0.6702431, -0.8545245, 1.960983, 0.427451, 0, 1, 1,
0.671711, -0.05869723, 4.357966, 0.4352941, 0, 1, 1,
0.6728612, -0.2695411, 4.14907, 0.4392157, 0, 1, 1,
0.6740399, 1.3098, 0.6348456, 0.4470588, 0, 1, 1,
0.6741259, 2.016897, 2.304085, 0.4509804, 0, 1, 1,
0.6811104, 0.1840817, -0.5289167, 0.4588235, 0, 1, 1,
0.6895736, -1.485102, 3.072969, 0.4627451, 0, 1, 1,
0.7009429, 0.09927152, 3.191487, 0.4705882, 0, 1, 1,
0.703773, -0.3413633, 2.285758, 0.4745098, 0, 1, 1,
0.7040817, -0.1985271, 1.892109, 0.4823529, 0, 1, 1,
0.7040936, 1.29471, 1.212785, 0.4862745, 0, 1, 1,
0.7044988, -0.3712557, 1.398846, 0.4941176, 0, 1, 1,
0.7169413, 0.5185273, 1.55824, 0.5019608, 0, 1, 1,
0.7181186, 0.3734831, 0.8090848, 0.5058824, 0, 1, 1,
0.7216871, -0.3464023, 0.9544389, 0.5137255, 0, 1, 1,
0.722755, -0.387344, 2.743796, 0.5176471, 0, 1, 1,
0.7290398, 0.4307345, 0.9417327, 0.5254902, 0, 1, 1,
0.7316583, -0.05997498, 1.441935, 0.5294118, 0, 1, 1,
0.7322662, -0.2266594, 2.70668, 0.5372549, 0, 1, 1,
0.7329232, -0.2907748, 3.250977, 0.5411765, 0, 1, 1,
0.7344703, -0.28827, 0.6193829, 0.5490196, 0, 1, 1,
0.7351348, -0.2687388, 1.461576, 0.5529412, 0, 1, 1,
0.7384526, 0.4417132, -0.1262851, 0.5607843, 0, 1, 1,
0.7477306, 0.5151429, 2.64205, 0.5647059, 0, 1, 1,
0.7595313, -1.958052, 2.021171, 0.572549, 0, 1, 1,
0.7600106, -0.4613451, 1.224291, 0.5764706, 0, 1, 1,
0.7613974, -0.8833527, -0.1805254, 0.5843138, 0, 1, 1,
0.7652556, 0.3145017, 1.75384, 0.5882353, 0, 1, 1,
0.7670718, 0.4319018, 0.4557814, 0.5960785, 0, 1, 1,
0.7697849, 1.593914, 0.6080804, 0.6039216, 0, 1, 1,
0.7719389, 0.9230648, 1.310104, 0.6078432, 0, 1, 1,
0.7761971, -1.041237, 3.658193, 0.6156863, 0, 1, 1,
0.7774855, 1.118402, 1.302291, 0.6196079, 0, 1, 1,
0.7799014, -0.3843771, 2.48461, 0.627451, 0, 1, 1,
0.7849361, -2.405556, 1.959612, 0.6313726, 0, 1, 1,
0.7868428, -0.3794557, 1.93493, 0.6392157, 0, 1, 1,
0.788176, -1.281518, 2.124774, 0.6431373, 0, 1, 1,
0.7917203, 1.108804, -0.8528084, 0.6509804, 0, 1, 1,
0.7921804, 0.6387648, 0.9657167, 0.654902, 0, 1, 1,
0.7935226, 0.7602713, 0.7194637, 0.6627451, 0, 1, 1,
0.803231, 0.8583095, -0.4593617, 0.6666667, 0, 1, 1,
0.8046447, 0.4562312, 1.300347, 0.6745098, 0, 1, 1,
0.8052009, -1.926686, 1.711106, 0.6784314, 0, 1, 1,
0.8116095, -1.258246, 3.178259, 0.6862745, 0, 1, 1,
0.8133769, -0.6144347, 0.3950968, 0.6901961, 0, 1, 1,
0.8141194, -0.6209852, 1.370853, 0.6980392, 0, 1, 1,
0.8158516, -0.2108672, 0.2225551, 0.7058824, 0, 1, 1,
0.8192642, 0.7072425, 0.7164007, 0.7098039, 0, 1, 1,
0.8228869, -1.271569, 4.994891, 0.7176471, 0, 1, 1,
0.8235553, 1.556151, 1.227484, 0.7215686, 0, 1, 1,
0.8320717, 0.7701588, 1.069646, 0.7294118, 0, 1, 1,
0.8325401, -0.4722113, 0.6910413, 0.7333333, 0, 1, 1,
0.8346882, -0.6728833, 0.5620326, 0.7411765, 0, 1, 1,
0.8350447, -0.5472618, 0.8052387, 0.7450981, 0, 1, 1,
0.8376545, -1.499838, 2.702225, 0.7529412, 0, 1, 1,
0.8420547, 0.3927556, 0.3799883, 0.7568628, 0, 1, 1,
0.8439741, 0.607194, 0.005050407, 0.7647059, 0, 1, 1,
0.8442615, 0.3821188, 1.87634, 0.7686275, 0, 1, 1,
0.8556856, -0.2602195, 2.732713, 0.7764706, 0, 1, 1,
0.8560798, -0.6637748, 2.453184, 0.7803922, 0, 1, 1,
0.8568428, -0.6749535, 1.627583, 0.7882353, 0, 1, 1,
0.8587933, 0.3911714, 1.421781, 0.7921569, 0, 1, 1,
0.8593135, 0.7870951, 2.432254, 0.8, 0, 1, 1,
0.8601807, 0.8679076, 0.05551848, 0.8078431, 0, 1, 1,
0.8623638, -2.15812, 2.999223, 0.8117647, 0, 1, 1,
0.8706464, 0.7469128, -0.3461083, 0.8196079, 0, 1, 1,
0.8740401, 0.00393803, 0.1525276, 0.8235294, 0, 1, 1,
0.8763667, 0.9510688, 0.7366989, 0.8313726, 0, 1, 1,
0.8777222, 0.6242693, 1.106976, 0.8352941, 0, 1, 1,
0.8787332, -0.7294032, 3.18635, 0.8431373, 0, 1, 1,
0.88116, -1.243116, 4.19031, 0.8470588, 0, 1, 1,
0.8825011, -0.3106608, 1.338132, 0.854902, 0, 1, 1,
0.8871377, 0.09181948, 0.8066643, 0.8588235, 0, 1, 1,
0.8888275, -0.715811, 1.690926, 0.8666667, 0, 1, 1,
0.8949831, 0.6866434, 1.722386, 0.8705882, 0, 1, 1,
0.8979546, -0.1247973, 1.721107, 0.8784314, 0, 1, 1,
0.9043537, 1.082939, 1.498837, 0.8823529, 0, 1, 1,
0.909138, -0.5049813, 1.952029, 0.8901961, 0, 1, 1,
0.9108133, 0.8937462, 1.049746, 0.8941177, 0, 1, 1,
0.9124148, 0.6791112, -1.165219, 0.9019608, 0, 1, 1,
0.9130315, -0.5007005, 4.228268, 0.9098039, 0, 1, 1,
0.914826, 2.796377, 1.119871, 0.9137255, 0, 1, 1,
0.9158705, 1.053851, 1.176525, 0.9215686, 0, 1, 1,
0.9254629, -0.1465934, 1.242356, 0.9254902, 0, 1, 1,
0.9331573, 0.3703271, 1.128505, 0.9333333, 0, 1, 1,
0.9451855, 1.166358, -0.3202948, 0.9372549, 0, 1, 1,
0.9474815, -1.079575, 3.088935, 0.945098, 0, 1, 1,
0.951604, 0.3675253, 1.665783, 0.9490196, 0, 1, 1,
0.9531655, -0.4637321, 1.648405, 0.9568627, 0, 1, 1,
0.9535258, -0.6903673, 2.508871, 0.9607843, 0, 1, 1,
0.9578307, 1.524013, 2.176907, 0.9686275, 0, 1, 1,
0.9662913, -1.168306, 2.752086, 0.972549, 0, 1, 1,
0.9740581, -0.4609704, 1.709154, 0.9803922, 0, 1, 1,
0.9746704, -1.825651, 2.634467, 0.9843137, 0, 1, 1,
0.9752488, 0.3417, 1.14686, 0.9921569, 0, 1, 1,
0.9804983, -0.4152463, 1.314747, 0.9960784, 0, 1, 1,
0.9822966, 0.7254902, 1.196817, 1, 0, 0.9960784, 1,
0.9836224, -0.6476364, 4.402454, 1, 0, 0.9882353, 1,
0.9925017, -0.3724634, 1.340778, 1, 0, 0.9843137, 1,
0.9970592, 0.3169716, 1.824552, 1, 0, 0.9764706, 1,
1.002882, 0.02305958, 1.280374, 1, 0, 0.972549, 1,
1.018342, -0.4727331, 1.750527, 1, 0, 0.9647059, 1,
1.026605, 0.4427667, 1.193199, 1, 0, 0.9607843, 1,
1.026799, -0.07682846, 0.962226, 1, 0, 0.9529412, 1,
1.026923, -0.4273348, 1.022726, 1, 0, 0.9490196, 1,
1.030897, 0.1949355, 1.141436, 1, 0, 0.9411765, 1,
1.032392, -0.1110694, 1.309272, 1, 0, 0.9372549, 1,
1.03719, 0.5065939, 2.269865, 1, 0, 0.9294118, 1,
1.038679, -0.4696332, 2.752999, 1, 0, 0.9254902, 1,
1.038833, -0.6372257, 1.159247, 1, 0, 0.9176471, 1,
1.044317, 0.7331949, 1.217244, 1, 0, 0.9137255, 1,
1.059613, -1.410258, 3.491914, 1, 0, 0.9058824, 1,
1.068118, -1.749345, 2.185095, 1, 0, 0.9019608, 1,
1.075758, 0.022452, 0.7744582, 1, 0, 0.8941177, 1,
1.076001, -0.316032, 0.1026415, 1, 0, 0.8862745, 1,
1.077515, 0.7627251, 0.1753733, 1, 0, 0.8823529, 1,
1.078673, -1.996916, 3.266615, 1, 0, 0.8745098, 1,
1.092012, -0.2333865, 1.709803, 1, 0, 0.8705882, 1,
1.09314, 0.1165801, 1.581793, 1, 0, 0.8627451, 1,
1.098494, 0.003945169, 1.694743, 1, 0, 0.8588235, 1,
1.099335, 0.9471313, 0.8483238, 1, 0, 0.8509804, 1,
1.103427, 0.718739, 2.396757, 1, 0, 0.8470588, 1,
1.106067, -0.5537891, 2.850237, 1, 0, 0.8392157, 1,
1.111424, 0.5337486, 1.889245, 1, 0, 0.8352941, 1,
1.11607, 0.7576866, 1.081327, 1, 0, 0.827451, 1,
1.116463, -2.619163, 1.242709, 1, 0, 0.8235294, 1,
1.120743, 0.6235652, 1.338952, 1, 0, 0.8156863, 1,
1.121585, -2.230095, 1.124457, 1, 0, 0.8117647, 1,
1.122582, 0.4924834, 1.751903, 1, 0, 0.8039216, 1,
1.123228, 1.020544, 1.331491, 1, 0, 0.7960784, 1,
1.126626, 0.3026868, 0.7877848, 1, 0, 0.7921569, 1,
1.131763, 0.9909825, 1.727026, 1, 0, 0.7843137, 1,
1.138561, 0.8507158, 1.934151, 1, 0, 0.7803922, 1,
1.142049, -2.464788, 2.214427, 1, 0, 0.772549, 1,
1.145149, 0.1129498, 1.251074, 1, 0, 0.7686275, 1,
1.157859, 1.468816, -0.036622, 1, 0, 0.7607843, 1,
1.16202, 1.676997, -0.4065772, 1, 0, 0.7568628, 1,
1.164469, 0.2748234, 1.521465, 1, 0, 0.7490196, 1,
1.169233, 0.94167, 0.1747795, 1, 0, 0.7450981, 1,
1.170712, 1.158814, -1.011114, 1, 0, 0.7372549, 1,
1.174462, 0.8426729, 0.1597764, 1, 0, 0.7333333, 1,
1.1768, 0.2792417, 0.6587631, 1, 0, 0.7254902, 1,
1.180447, -0.7346112, 3.224797, 1, 0, 0.7215686, 1,
1.186555, -1.254592, 0.3433858, 1, 0, 0.7137255, 1,
1.190017, -1.333509, 2.520589, 1, 0, 0.7098039, 1,
1.191371, -0.7542939, 2.303557, 1, 0, 0.7019608, 1,
1.192922, 0.326075, 0.9967586, 1, 0, 0.6941177, 1,
1.19857, 0.8890311, 1.098086, 1, 0, 0.6901961, 1,
1.204836, -0.534295, 1.754516, 1, 0, 0.682353, 1,
1.209895, 0.6209375, 1.527453, 1, 0, 0.6784314, 1,
1.214286, 1.610751, 0.6036699, 1, 0, 0.6705883, 1,
1.216681, 2.224326, -0.9108556, 1, 0, 0.6666667, 1,
1.217916, 1.005193, 1.166256, 1, 0, 0.6588235, 1,
1.225355, -0.1567361, 1.905278, 1, 0, 0.654902, 1,
1.227206, 0.7541822, -0.0591423, 1, 0, 0.6470588, 1,
1.227626, 0.8957484, -0.6811976, 1, 0, 0.6431373, 1,
1.228588, 0.6697828, 1.419646, 1, 0, 0.6352941, 1,
1.23174, 1.081483, 2.067304, 1, 0, 0.6313726, 1,
1.235917, 0.4632417, 2.19324, 1, 0, 0.6235294, 1,
1.242409, -1.62083, 2.81641, 1, 0, 0.6196079, 1,
1.246817, 1.251462, 0.5892951, 1, 0, 0.6117647, 1,
1.248881, -1.277197, 3.050622, 1, 0, 0.6078432, 1,
1.276179, 1.104727, 1.518412, 1, 0, 0.6, 1,
1.284068, 0.4483165, 1.804822, 1, 0, 0.5921569, 1,
1.284636, -0.5407287, 1.689075, 1, 0, 0.5882353, 1,
1.290341, -1.867323, 1.415563, 1, 0, 0.5803922, 1,
1.300742, 2.062061, 1.713692, 1, 0, 0.5764706, 1,
1.309369, 1.76421, 0.3242071, 1, 0, 0.5686275, 1,
1.313556, -0.308425, 0.8375338, 1, 0, 0.5647059, 1,
1.31786, -0.5450026, 2.045238, 1, 0, 0.5568628, 1,
1.32106, -0.1931043, 2.696524, 1, 0, 0.5529412, 1,
1.327648, 0.1412383, 1.965608, 1, 0, 0.5450981, 1,
1.328278, -0.1400693, 1.079433, 1, 0, 0.5411765, 1,
1.337813, -0.1754397, 0.8356711, 1, 0, 0.5333334, 1,
1.338629, 0.8866054, -0.2827574, 1, 0, 0.5294118, 1,
1.340289, 0.00385681, 2.297196, 1, 0, 0.5215687, 1,
1.3476, -0.6225564, 1.494596, 1, 0, 0.5176471, 1,
1.347968, 1.433003, -1.853388, 1, 0, 0.509804, 1,
1.353085, 0.5500516, 3.183161, 1, 0, 0.5058824, 1,
1.357192, 0.4825048, 3.243726, 1, 0, 0.4980392, 1,
1.365558, -0.2723922, 0.2832181, 1, 0, 0.4901961, 1,
1.372182, -0.3365328, 1.726077, 1, 0, 0.4862745, 1,
1.384356, 1.610803, 0.6176409, 1, 0, 0.4784314, 1,
1.400246, -0.2366731, 0.846126, 1, 0, 0.4745098, 1,
1.408065, 0.6520159, 0.8892931, 1, 0, 0.4666667, 1,
1.413823, 0.1346525, 0.6821183, 1, 0, 0.4627451, 1,
1.427835, 1.357945, -0.4244276, 1, 0, 0.454902, 1,
1.437066, 0.1611355, 2.301479, 1, 0, 0.4509804, 1,
1.440521, 0.193784, 1.00188, 1, 0, 0.4431373, 1,
1.454666, -1.326584, 4.735445, 1, 0, 0.4392157, 1,
1.454905, -1.262756, 2.414212, 1, 0, 0.4313726, 1,
1.467633, -0.2925064, 0.9310595, 1, 0, 0.427451, 1,
1.473728, -0.2203678, 2.425394, 1, 0, 0.4196078, 1,
1.486493, 1.538122, 2.236271, 1, 0, 0.4156863, 1,
1.489937, 1.393762, 2.434672, 1, 0, 0.4078431, 1,
1.491197, 0.2575457, 3.267052, 1, 0, 0.4039216, 1,
1.49571, 0.1423242, 0.1569623, 1, 0, 0.3960784, 1,
1.500118, 1.625324, -0.2358518, 1, 0, 0.3882353, 1,
1.507504, 0.522005, 0.3388911, 1, 0, 0.3843137, 1,
1.515497, 1.363768, -0.5429205, 1, 0, 0.3764706, 1,
1.519202, -0.8250606, 2.752337, 1, 0, 0.372549, 1,
1.527921, -0.4772162, 1.004661, 1, 0, 0.3647059, 1,
1.530668, 0.2027092, 1.422041, 1, 0, 0.3607843, 1,
1.541633, -0.7954285, 2.415352, 1, 0, 0.3529412, 1,
1.541784, 2.00711, -0.8676505, 1, 0, 0.3490196, 1,
1.547196, -1.815424, 4.168152, 1, 0, 0.3411765, 1,
1.550857, -1.722038, 1.637186, 1, 0, 0.3372549, 1,
1.555053, 0.7301099, 1.868024, 1, 0, 0.3294118, 1,
1.574172, 0.04995674, 3.269221, 1, 0, 0.3254902, 1,
1.576045, 1.381745, 3.092446, 1, 0, 0.3176471, 1,
1.581777, 0.7476292, 0.5645781, 1, 0, 0.3137255, 1,
1.584566, -1.727616, 1.89715, 1, 0, 0.3058824, 1,
1.592947, 0.09671423, 1.396408, 1, 0, 0.2980392, 1,
1.596146, 0.7193841, 1.698821, 1, 0, 0.2941177, 1,
1.609994, 1.677897, 0.9914821, 1, 0, 0.2862745, 1,
1.616749, -0.9226457, 4.027055, 1, 0, 0.282353, 1,
1.634057, 0.4451924, 0.9029022, 1, 0, 0.2745098, 1,
1.671216, 0.2994605, 2.697325, 1, 0, 0.2705882, 1,
1.685835, -0.3516828, 1.621932, 1, 0, 0.2627451, 1,
1.701123, -1.433026, 2.316654, 1, 0, 0.2588235, 1,
1.710593, 0.22588, 1.85935, 1, 0, 0.2509804, 1,
1.717855, -1.588309, 1.84251, 1, 0, 0.2470588, 1,
1.746979, 2.156313, 2.302341, 1, 0, 0.2392157, 1,
1.788265, -2.114854, 1.817252, 1, 0, 0.2352941, 1,
1.80638, -2.315591, 2.879388, 1, 0, 0.227451, 1,
1.810091, 0.9240656, 1.456747, 1, 0, 0.2235294, 1,
1.810928, 0.1386161, 0.3332871, 1, 0, 0.2156863, 1,
1.811807, -0.7500847, 1.593704, 1, 0, 0.2117647, 1,
1.832962, 0.6127405, 0.8961031, 1, 0, 0.2039216, 1,
1.845351, -1.36583, 2.11147, 1, 0, 0.1960784, 1,
1.852054, -0.6635078, 0.05640683, 1, 0, 0.1921569, 1,
1.855691, -1.419302, 2.484217, 1, 0, 0.1843137, 1,
1.877943, 0.8957496, 1.584253, 1, 0, 0.1803922, 1,
1.889007, -0.2113431, 0.8862596, 1, 0, 0.172549, 1,
1.889124, 0.6283394, 0.11271, 1, 0, 0.1686275, 1,
1.902955, -0.4633988, 1.396065, 1, 0, 0.1607843, 1,
1.912481, 0.3986021, 1.223334, 1, 0, 0.1568628, 1,
1.920168, -0.1146936, 2.989515, 1, 0, 0.1490196, 1,
1.939258, 1.222615, 1.652537, 1, 0, 0.145098, 1,
1.948453, -1.124258, 1.838644, 1, 0, 0.1372549, 1,
1.952384, 1.090142, 0.5037969, 1, 0, 0.1333333, 1,
1.981331, 0.4935656, 1.669238, 1, 0, 0.1254902, 1,
2.003312, 2.14112, 0.6628144, 1, 0, 0.1215686, 1,
2.006065, 0.06715004, 0.5544393, 1, 0, 0.1137255, 1,
2.037076, 3.665871, -1.611183, 1, 0, 0.1098039, 1,
2.064125, -0.04398598, 2.385973, 1, 0, 0.1019608, 1,
2.065104, -1.006326, 2.148466, 1, 0, 0.09411765, 1,
2.132858, -1.429365, 3.194762, 1, 0, 0.09019608, 1,
2.193403, -0.09334441, 1.891285, 1, 0, 0.08235294, 1,
2.203673, 0.203541, 1.765934, 1, 0, 0.07843138, 1,
2.237995, 0.6714665, 1.790451, 1, 0, 0.07058824, 1,
2.333715, 0.6183879, 1.630017, 1, 0, 0.06666667, 1,
2.425336, -1.905425, 2.480716, 1, 0, 0.05882353, 1,
2.444395, -0.94235, 1.215494, 1, 0, 0.05490196, 1,
2.454326, -1.065006, 0.6663888, 1, 0, 0.04705882, 1,
2.558388, 0.2864597, 0.8376251, 1, 0, 0.04313726, 1,
2.717619, 1.260482, 1.780892, 1, 0, 0.03529412, 1,
2.764874, 0.3764563, 1.105346, 1, 0, 0.03137255, 1,
2.871198, -1.482493, 1.298153, 1, 0, 0.02352941, 1,
2.973911, -0.8559733, 0.4094783, 1, 0, 0.01960784, 1,
2.978131, 0.05984185, 1.510407, 1, 0, 0.01176471, 1,
3.498029, -0.906711, 3.177307, 1, 0, 0.007843138, 1
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
-0.3997291, -3.799664, -7.217427, 0, -0.5, 0.5, 0.5,
-0.3997291, -3.799664, -7.217427, 1, -0.5, 0.5, 0.5,
-0.3997291, -3.799664, -7.217427, 1, 1.5, 0.5, 0.5,
-0.3997291, -3.799664, -7.217427, 0, 1.5, 0.5, 0.5
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
-5.618827, 0.4741071, -7.217427, 0, -0.5, 0.5, 0.5,
-5.618827, 0.4741071, -7.217427, 1, -0.5, 0.5, 0.5,
-5.618827, 0.4741071, -7.217427, 1, 1.5, 0.5, 0.5,
-5.618827, 0.4741071, -7.217427, 0, 1.5, 0.5, 0.5
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
-5.618827, -3.799664, 0.3632011, 0, -0.5, 0.5, 0.5,
-5.618827, -3.799664, 0.3632011, 1, -0.5, 0.5, 0.5,
-5.618827, -3.799664, 0.3632011, 1, 1.5, 0.5, 0.5,
-5.618827, -3.799664, 0.3632011, 0, 1.5, 0.5, 0.5
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
-4, -2.813409, -5.468051,
2, -2.813409, -5.468051,
-4, -2.813409, -5.468051,
-4, -2.977785, -5.759614,
-2, -2.813409, -5.468051,
-2, -2.977785, -5.759614,
0, -2.813409, -5.468051,
0, -2.977785, -5.759614,
2, -2.813409, -5.468051,
2, -2.977785, -5.759614
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
"-4",
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
-4, -3.306537, -6.34274, 0, -0.5, 0.5, 0.5,
-4, -3.306537, -6.34274, 1, -0.5, 0.5, 0.5,
-4, -3.306537, -6.34274, 1, 1.5, 0.5, 0.5,
-4, -3.306537, -6.34274, 0, 1.5, 0.5, 0.5,
-2, -3.306537, -6.34274, 0, -0.5, 0.5, 0.5,
-2, -3.306537, -6.34274, 1, -0.5, 0.5, 0.5,
-2, -3.306537, -6.34274, 1, 1.5, 0.5, 0.5,
-2, -3.306537, -6.34274, 0, 1.5, 0.5, 0.5,
0, -3.306537, -6.34274, 0, -0.5, 0.5, 0.5,
0, -3.306537, -6.34274, 1, -0.5, 0.5, 0.5,
0, -3.306537, -6.34274, 1, 1.5, 0.5, 0.5,
0, -3.306537, -6.34274, 0, 1.5, 0.5, 0.5,
2, -3.306537, -6.34274, 0, -0.5, 0.5, 0.5,
2, -3.306537, -6.34274, 1, -0.5, 0.5, 0.5,
2, -3.306537, -6.34274, 1, 1.5, 0.5, 0.5,
2, -3.306537, -6.34274, 0, 1.5, 0.5, 0.5
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
-4.41442, -2, -5.468051,
-4.41442, 3, -5.468051,
-4.41442, -2, -5.468051,
-4.615155, -2, -5.759614,
-4.41442, -1, -5.468051,
-4.615155, -1, -5.759614,
-4.41442, 0, -5.468051,
-4.615155, 0, -5.759614,
-4.41442, 1, -5.468051,
-4.615155, 1, -5.759614,
-4.41442, 2, -5.468051,
-4.615155, 2, -5.759614,
-4.41442, 3, -5.468051,
-4.615155, 3, -5.759614
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
-5.016623, -2, -6.34274, 0, -0.5, 0.5, 0.5,
-5.016623, -2, -6.34274, 1, -0.5, 0.5, 0.5,
-5.016623, -2, -6.34274, 1, 1.5, 0.5, 0.5,
-5.016623, -2, -6.34274, 0, 1.5, 0.5, 0.5,
-5.016623, -1, -6.34274, 0, -0.5, 0.5, 0.5,
-5.016623, -1, -6.34274, 1, -0.5, 0.5, 0.5,
-5.016623, -1, -6.34274, 1, 1.5, 0.5, 0.5,
-5.016623, -1, -6.34274, 0, 1.5, 0.5, 0.5,
-5.016623, 0, -6.34274, 0, -0.5, 0.5, 0.5,
-5.016623, 0, -6.34274, 1, -0.5, 0.5, 0.5,
-5.016623, 0, -6.34274, 1, 1.5, 0.5, 0.5,
-5.016623, 0, -6.34274, 0, 1.5, 0.5, 0.5,
-5.016623, 1, -6.34274, 0, -0.5, 0.5, 0.5,
-5.016623, 1, -6.34274, 1, -0.5, 0.5, 0.5,
-5.016623, 1, -6.34274, 1, 1.5, 0.5, 0.5,
-5.016623, 1, -6.34274, 0, 1.5, 0.5, 0.5,
-5.016623, 2, -6.34274, 0, -0.5, 0.5, 0.5,
-5.016623, 2, -6.34274, 1, -0.5, 0.5, 0.5,
-5.016623, 2, -6.34274, 1, 1.5, 0.5, 0.5,
-5.016623, 2, -6.34274, 0, 1.5, 0.5, 0.5,
-5.016623, 3, -6.34274, 0, -0.5, 0.5, 0.5,
-5.016623, 3, -6.34274, 1, -0.5, 0.5, 0.5,
-5.016623, 3, -6.34274, 1, 1.5, 0.5, 0.5,
-5.016623, 3, -6.34274, 0, 1.5, 0.5, 0.5
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
-4.41442, -2.813409, -4,
-4.41442, -2.813409, 6,
-4.41442, -2.813409, -4,
-4.615155, -2.977785, -4,
-4.41442, -2.813409, -2,
-4.615155, -2.977785, -2,
-4.41442, -2.813409, 0,
-4.615155, -2.977785, 0,
-4.41442, -2.813409, 2,
-4.615155, -2.977785, 2,
-4.41442, -2.813409, 4,
-4.615155, -2.977785, 4,
-4.41442, -2.813409, 6,
-4.615155, -2.977785, 6
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
"4",
"6"
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
-5.016623, -3.306537, -4, 0, -0.5, 0.5, 0.5,
-5.016623, -3.306537, -4, 1, -0.5, 0.5, 0.5,
-5.016623, -3.306537, -4, 1, 1.5, 0.5, 0.5,
-5.016623, -3.306537, -4, 0, 1.5, 0.5, 0.5,
-5.016623, -3.306537, -2, 0, -0.5, 0.5, 0.5,
-5.016623, -3.306537, -2, 1, -0.5, 0.5, 0.5,
-5.016623, -3.306537, -2, 1, 1.5, 0.5, 0.5,
-5.016623, -3.306537, -2, 0, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 0, 0, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 0, 1, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 0, 1, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 0, 0, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 2, 0, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 2, 1, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 2, 1, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 2, 0, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 4, 0, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 4, 1, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 4, 1, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 4, 0, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 6, 0, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 6, 1, -0.5, 0.5, 0.5,
-5.016623, -3.306537, 6, 1, 1.5, 0.5, 0.5,
-5.016623, -3.306537, 6, 0, 1.5, 0.5, 0.5
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
-4.41442, -2.813409, -5.468051,
-4.41442, 3.761624, -5.468051,
-4.41442, -2.813409, 6.194454,
-4.41442, 3.761624, 6.194454,
-4.41442, -2.813409, -5.468051,
-4.41442, -2.813409, 6.194454,
-4.41442, 3.761624, -5.468051,
-4.41442, 3.761624, 6.194454,
-4.41442, -2.813409, -5.468051,
3.614962, -2.813409, -5.468051,
-4.41442, -2.813409, 6.194454,
3.614962, -2.813409, 6.194454,
-4.41442, 3.761624, -5.468051,
3.614962, 3.761624, -5.468051,
-4.41442, 3.761624, 6.194454,
3.614962, 3.761624, 6.194454,
3.614962, -2.813409, -5.468051,
3.614962, 3.761624, -5.468051,
3.614962, -2.813409, 6.194454,
3.614962, 3.761624, 6.194454,
3.614962, -2.813409, -5.468051,
3.614962, -2.813409, 6.194454,
3.614962, 3.761624, -5.468051,
3.614962, 3.761624, 6.194454
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
var radius = 8.336189;
var distance = 37.08865;
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
mvMatrix.translate( 0.3997291, -0.4741071, -0.3632011 );
mvMatrix.scale( 1.122534, 1.37083, 0.77284 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.08865);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
triasulfuron<-read.table("triasulfuron.xyz")
```

```
## Error in read.table("triasulfuron.xyz"): no lines available in input
```

```r
x<-triasulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'triasulfuron' not found
```

```r
y<-triasulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'triasulfuron' not found
```

```r
z<-triasulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'triasulfuron' not found
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
-4.297487, -0.01672683, -1.954809, 0, 0, 1, 1, 1,
-3.400929, -0.2467751, -3.115328, 1, 0, 0, 1, 1,
-3.005961, -0.8218457, -1.67689, 1, 0, 0, 1, 1,
-2.941981, 0.3071758, -2.055364, 1, 0, 0, 1, 1,
-2.809507, -0.5075753, -1.555893, 1, 0, 0, 1, 1,
-2.754887, -0.7032771, -1.534332, 1, 0, 0, 1, 1,
-2.533386, 0.684353, -2.62819, 0, 0, 0, 1, 1,
-2.481954, -0.6396868, -2.037063, 0, 0, 0, 1, 1,
-2.446776, 0.3634859, -0.1418634, 0, 0, 0, 1, 1,
-2.373072, 0.2024729, 0.06909147, 0, 0, 0, 1, 1,
-2.339641, -0.6566103, 1.015049, 0, 0, 0, 1, 1,
-2.244106, -0.6066417, -0.7256861, 0, 0, 0, 1, 1,
-2.207765, -0.3453602, -2.13555, 0, 0, 0, 1, 1,
-2.19357, -0.9054358, -2.197235, 1, 1, 1, 1, 1,
-2.175637, -0.6728808, -0.8210413, 1, 1, 1, 1, 1,
-2.11289, -0.764966, -1.139558, 1, 1, 1, 1, 1,
-2.112159, -0.3474888, -1.642076, 1, 1, 1, 1, 1,
-2.104766, 1.266061, -0.5322675, 1, 1, 1, 1, 1,
-2.103954, 0.5398023, -2.125592, 1, 1, 1, 1, 1,
-2.090063, -0.6228122, -1.407193, 1, 1, 1, 1, 1,
-2.031801, -1.27637, -1.462552, 1, 1, 1, 1, 1,
-2.00733, -0.8285405, -1.948986, 1, 1, 1, 1, 1,
-1.981625, -0.5842714, -2.443064, 1, 1, 1, 1, 1,
-1.940621, -1.290297, 0.1167944, 1, 1, 1, 1, 1,
-1.921946, -0.8478994, -1.129365, 1, 1, 1, 1, 1,
-1.901288, -0.3020543, -1.781417, 1, 1, 1, 1, 1,
-1.895843, 0.2972996, -2.194629, 1, 1, 1, 1, 1,
-1.876419, -1.061743, -3.797185, 1, 1, 1, 1, 1,
-1.866377, -0.6736068, -1.23693, 0, 0, 1, 1, 1,
-1.833206, -0.9490034, -2.910162, 1, 0, 0, 1, 1,
-1.82639, -1.930819, -3.221967, 1, 0, 0, 1, 1,
-1.819306, -0.2673917, -2.794359, 1, 0, 0, 1, 1,
-1.812714, -1.691693, -3.243136, 1, 0, 0, 1, 1,
-1.799502, 0.2349237, -0.5788884, 1, 0, 0, 1, 1,
-1.793142, -1.005424, -1.337225, 0, 0, 0, 1, 1,
-1.768212, -0.04855759, -2.517165, 0, 0, 0, 1, 1,
-1.734311, -0.4169121, -1.674884, 0, 0, 0, 1, 1,
-1.731062, -0.1815828, -0.5265166, 0, 0, 0, 1, 1,
-1.730384, -1.917531, -2.074325, 0, 0, 0, 1, 1,
-1.716054, -0.4135414, -2.075714, 0, 0, 0, 1, 1,
-1.711967, 0.8174549, -0.3633802, 0, 0, 0, 1, 1,
-1.711208, 1.241161, -0.4731352, 1, 1, 1, 1, 1,
-1.708408, -0.6394337, -1.318955, 1, 1, 1, 1, 1,
-1.690313, -0.1506515, -0.7995318, 1, 1, 1, 1, 1,
-1.681157, 0.7948543, -2.377027, 1, 1, 1, 1, 1,
-1.641573, 0.9848356, -0.8911354, 1, 1, 1, 1, 1,
-1.631247, -0.8850096, -1.487073, 1, 1, 1, 1, 1,
-1.615039, -1.478782, -1.678869, 1, 1, 1, 1, 1,
-1.608965, 0.1026767, -1.04735, 1, 1, 1, 1, 1,
-1.599334, 0.3574339, -1.232554, 1, 1, 1, 1, 1,
-1.597444, 1.721471, -2.58093, 1, 1, 1, 1, 1,
-1.582553, -1.968869, -1.245925, 1, 1, 1, 1, 1,
-1.582551, 0.5556858, -0.5099434, 1, 1, 1, 1, 1,
-1.549509, -0.6018947, -1.211611, 1, 1, 1, 1, 1,
-1.539944, 0.2837066, -0.3180668, 1, 1, 1, 1, 1,
-1.539262, -0.04199448, -3.501874, 1, 1, 1, 1, 1,
-1.520288, -0.1258396, -1.790779, 0, 0, 1, 1, 1,
-1.50462, -1.062905, -2.420542, 1, 0, 0, 1, 1,
-1.498674, -1.523036, -0.1363482, 1, 0, 0, 1, 1,
-1.485633, -0.3404515, -0.6943115, 1, 0, 0, 1, 1,
-1.480174, -1.27844, -2.154441, 1, 0, 0, 1, 1,
-1.456021, 1.181724, -1.406139, 1, 0, 0, 1, 1,
-1.449259, 0.3034251, -3.799036, 0, 0, 0, 1, 1,
-1.448834, 0.4357318, -1.386113, 0, 0, 0, 1, 1,
-1.442422, 1.044346, -0.8730435, 0, 0, 0, 1, 1,
-1.440094, 0.6731254, -1.537352, 0, 0, 0, 1, 1,
-1.438707, -0.9953981, -1.234508, 0, 0, 0, 1, 1,
-1.433838, -0.7579588, -3.176699, 0, 0, 0, 1, 1,
-1.428702, -0.6069167, -2.402016, 0, 0, 0, 1, 1,
-1.427152, -2.717656, -3.522953, 1, 1, 1, 1, 1,
-1.420648, 0.1421491, -1.389924, 1, 1, 1, 1, 1,
-1.414885, 0.2463447, -1.602144, 1, 1, 1, 1, 1,
-1.410043, 0.03046064, -1.689707, 1, 1, 1, 1, 1,
-1.40346, 1.127895, -1.54575, 1, 1, 1, 1, 1,
-1.393112, -1.302527, -2.138707, 1, 1, 1, 1, 1,
-1.377693, 0.5488672, -1.586821, 1, 1, 1, 1, 1,
-1.369976, -0.605469, -3.821421, 1, 1, 1, 1, 1,
-1.369495, -0.1585215, -1.414715, 1, 1, 1, 1, 1,
-1.350177, -0.5732337, -1.630018, 1, 1, 1, 1, 1,
-1.341913, 0.728766, -1.018574, 1, 1, 1, 1, 1,
-1.341567, 0.2117636, -0.6571405, 1, 1, 1, 1, 1,
-1.338642, 0.6557461, -1.288928, 1, 1, 1, 1, 1,
-1.326293, -1.976721, -1.977618, 1, 1, 1, 1, 1,
-1.325187, -0.2512023, -1.690701, 1, 1, 1, 1, 1,
-1.32074, -0.3777469, -0.5599079, 0, 0, 1, 1, 1,
-1.318301, -0.9947627, -1.594311, 1, 0, 0, 1, 1,
-1.297598, -0.8095936, -2.543679, 1, 0, 0, 1, 1,
-1.291106, -1.093408, -1.040359, 1, 0, 0, 1, 1,
-1.287863, -2.052046, -1.823394, 1, 0, 0, 1, 1,
-1.286104, -0.4136418, -0.8447962, 1, 0, 0, 1, 1,
-1.285532, -0.9196858, -2.043736, 0, 0, 0, 1, 1,
-1.283536, -0.5525796, -1.882581, 0, 0, 0, 1, 1,
-1.282502, 0.8856634, -2.714352, 0, 0, 0, 1, 1,
-1.281625, -0.879377, -1.474408, 0, 0, 0, 1, 1,
-1.27963, 0.2033604, -0.661485, 0, 0, 0, 1, 1,
-1.263741, 0.9105245, 0.3965145, 0, 0, 0, 1, 1,
-1.25266, -0.406136, -2.396684, 0, 0, 0, 1, 1,
-1.252457, -0.282073, -1.563925, 1, 1, 1, 1, 1,
-1.248618, -1.278973, -3.172644, 1, 1, 1, 1, 1,
-1.24771, 1.167161, 0.08238392, 1, 1, 1, 1, 1,
-1.246223, -0.173868, -1.698021, 1, 1, 1, 1, 1,
-1.238853, -1.711992, -3.50947, 1, 1, 1, 1, 1,
-1.234992, 1.242451, -0.9562929, 1, 1, 1, 1, 1,
-1.231917, -0.8873402, -3.584233, 1, 1, 1, 1, 1,
-1.215733, 0.1767772, -1.991152, 1, 1, 1, 1, 1,
-1.215669, 0.1863993, -1.640204, 1, 1, 1, 1, 1,
-1.212428, 0.7959887, -0.5526461, 1, 1, 1, 1, 1,
-1.203605, -0.0207388, -2.660972, 1, 1, 1, 1, 1,
-1.199776, -0.4628118, -0.7031925, 1, 1, 1, 1, 1,
-1.175827, -0.794112, -2.359632, 1, 1, 1, 1, 1,
-1.17558, -0.5229285, -2.714188, 1, 1, 1, 1, 1,
-1.170006, 0.309606, -0.5924551, 1, 1, 1, 1, 1,
-1.151505, 0.7617381, -1.092287, 0, 0, 1, 1, 1,
-1.151132, -0.5291709, -1.903384, 1, 0, 0, 1, 1,
-1.145657, 0.607305, -0.4866215, 1, 0, 0, 1, 1,
-1.145215, -0.4390307, -1.993792, 1, 0, 0, 1, 1,
-1.141292, 0.3474182, 0.1600191, 1, 0, 0, 1, 1,
-1.1284, -0.8458857, -4.176539, 1, 0, 0, 1, 1,
-1.126229, -0.9226819, -0.693488, 0, 0, 0, 1, 1,
-1.121485, -0.9125309, -1.436473, 0, 0, 0, 1, 1,
-1.118189, 2.495927, -1.566639, 0, 0, 0, 1, 1,
-1.117522, -0.3834157, -1.6364, 0, 0, 0, 1, 1,
-1.116074, -0.1375329, -1.167281, 0, 0, 0, 1, 1,
-1.112017, -0.3560044, -1.773538, 0, 0, 0, 1, 1,
-1.110623, 0.8604831, -1.436795, 0, 0, 0, 1, 1,
-1.110595, -0.3258968, -1.125277, 1, 1, 1, 1, 1,
-1.109893, -0.9114089, -3.431522, 1, 1, 1, 1, 1,
-1.109765, 0.02882925, -2.082349, 1, 1, 1, 1, 1,
-1.106648, 0.5356459, -1.919828, 1, 1, 1, 1, 1,
-1.101509, 1.249408, -0.8954241, 1, 1, 1, 1, 1,
-1.098242, -1.284727, -1.924675, 1, 1, 1, 1, 1,
-1.091696, -2.110343, -2.065375, 1, 1, 1, 1, 1,
-1.090427, 1.194396, -1.234483, 1, 1, 1, 1, 1,
-1.090201, 1.279939, -0.9614751, 1, 1, 1, 1, 1,
-1.087607, 0.4626987, -0.7804126, 1, 1, 1, 1, 1,
-1.084416, -1.712877, -1.826301, 1, 1, 1, 1, 1,
-1.083028, 0.3672396, -0.7327911, 1, 1, 1, 1, 1,
-1.080189, -0.3073552, -0.1126824, 1, 1, 1, 1, 1,
-1.074271, -0.3086671, -2.111558, 1, 1, 1, 1, 1,
-1.073962, 0.9745963, 0.4375301, 1, 1, 1, 1, 1,
-1.071853, -1.384297, -3.185296, 0, 0, 1, 1, 1,
-1.066602, -0.09081804, -1.735674, 1, 0, 0, 1, 1,
-1.054887, -1.66644, -1.414369, 1, 0, 0, 1, 1,
-1.054386, 0.1787896, 0.1541478, 1, 0, 0, 1, 1,
-1.049677, 2.429575, 0.8252234, 1, 0, 0, 1, 1,
-1.046525, -0.7377095, -0.3969317, 1, 0, 0, 1, 1,
-1.045845, 0.4584534, -0.6821064, 0, 0, 0, 1, 1,
-1.045106, 0.4763308, -2.243232, 0, 0, 0, 1, 1,
-1.0388, -1.632461, -3.857714, 0, 0, 0, 1, 1,
-1.028708, -0.1665936, -2.965952, 0, 0, 0, 1, 1,
-1.021749, -1.818068, -1.092203, 0, 0, 0, 1, 1,
-1.018637, 1.297674, -0.6953518, 0, 0, 0, 1, 1,
-1.015425, -1.993796, -2.992148, 0, 0, 0, 1, 1,
-1.013965, -0.6200195, -2.890306, 1, 1, 1, 1, 1,
-1.006207, 1.398813, -1.431212, 1, 1, 1, 1, 1,
-1.000403, 0.4202993, -1.654246, 1, 1, 1, 1, 1,
-0.9926606, 1.383827, -1.666589, 1, 1, 1, 1, 1,
-0.9915428, -0.2371266, -0.2170272, 1, 1, 1, 1, 1,
-0.9915121, -1.832355, -3.94203, 1, 1, 1, 1, 1,
-0.9909125, -0.804581, -2.923544, 1, 1, 1, 1, 1,
-0.9897968, -0.8590643, -2.293467, 1, 1, 1, 1, 1,
-0.9845837, -1.00142, -3.536484, 1, 1, 1, 1, 1,
-0.9777117, -1.218604, -3.729379, 1, 1, 1, 1, 1,
-0.9740617, -0.7863839, -3.749315, 1, 1, 1, 1, 1,
-0.9693825, -1.238159, -2.71466, 1, 1, 1, 1, 1,
-0.9545258, 0.4578654, -0.8900458, 1, 1, 1, 1, 1,
-0.9529605, 0.09837899, -2.16081, 1, 1, 1, 1, 1,
-0.9467776, -0.9579472, -0.4586371, 1, 1, 1, 1, 1,
-0.9322838, -0.0145071, -2.356527, 0, 0, 1, 1, 1,
-0.9303939, -0.3082082, -1.132774, 1, 0, 0, 1, 1,
-0.929087, 0.8561505, 0.059188, 1, 0, 0, 1, 1,
-0.9200463, -0.3406473, -2.77106, 1, 0, 0, 1, 1,
-0.9198028, 0.1240313, 0.2849856, 1, 0, 0, 1, 1,
-0.9120771, 0.330679, -3.030864, 1, 0, 0, 1, 1,
-0.9115129, 1.875606, -1.351836, 0, 0, 0, 1, 1,
-0.9093168, -0.1680263, -0.5299882, 0, 0, 0, 1, 1,
-0.9072616, -0.3615336, -1.780231, 0, 0, 0, 1, 1,
-0.9056473, 0.8261235, -0.570678, 0, 0, 0, 1, 1,
-0.9053766, -0.9013304, -2.179172, 0, 0, 0, 1, 1,
-0.9047425, 1.904358, 1.237574, 0, 0, 0, 1, 1,
-0.899462, 0.2002509, -0.800297, 0, 0, 0, 1, 1,
-0.8955476, 0.4544654, -0.2813152, 1, 1, 1, 1, 1,
-0.8943413, 0.3268813, -0.8417521, 1, 1, 1, 1, 1,
-0.8939838, 1.253443, 0.7890099, 1, 1, 1, 1, 1,
-0.8888095, -1.287157, -1.517076, 1, 1, 1, 1, 1,
-0.8864871, 0.09271909, -1.695128, 1, 1, 1, 1, 1,
-0.8753374, -1.090439, -2.694916, 1, 1, 1, 1, 1,
-0.8741661, 0.8677043, -2.409901, 1, 1, 1, 1, 1,
-0.8694536, -1.273967, -2.709309, 1, 1, 1, 1, 1,
-0.8624142, 1.049976, -0.08652978, 1, 1, 1, 1, 1,
-0.8608308, 0.5984885, 0.1950148, 1, 1, 1, 1, 1,
-0.8542621, 0.8848649, -0.2863807, 1, 1, 1, 1, 1,
-0.8501192, -0.01039015, -1.533297, 1, 1, 1, 1, 1,
-0.8460339, 0.139093, -2.26096, 1, 1, 1, 1, 1,
-0.8431661, -0.7283411, -3.524345, 1, 1, 1, 1, 1,
-0.8413559, -0.0147704, -1.307665, 1, 1, 1, 1, 1,
-0.8390115, -1.004138, -2.943382, 0, 0, 1, 1, 1,
-0.8304451, 1.074346, -0.1144967, 1, 0, 0, 1, 1,
-0.8284106, -0.2132234, -0.3026155, 1, 0, 0, 1, 1,
-0.8257538, 1.365272, -0.09216952, 1, 0, 0, 1, 1,
-0.8227258, -0.6213616, -2.535417, 1, 0, 0, 1, 1,
-0.8218569, 0.3309689, -1.253867, 1, 0, 0, 1, 1,
-0.8173779, 0.3129215, -2.595842, 0, 0, 0, 1, 1,
-0.8158208, 1.234537, -3.030043, 0, 0, 0, 1, 1,
-0.8147651, -0.7081947, -2.867992, 0, 0, 0, 1, 1,
-0.8046809, 0.5184979, -1.396561, 0, 0, 0, 1, 1,
-0.7996942, 0.662518, 0.03031666, 0, 0, 0, 1, 1,
-0.7962965, -0.1314418, 0.2636776, 0, 0, 0, 1, 1,
-0.7929984, -0.6522521, -3.180504, 0, 0, 0, 1, 1,
-0.7906426, -1.163535, -1.484775, 1, 1, 1, 1, 1,
-0.7851542, -0.5753328, -3.189743, 1, 1, 1, 1, 1,
-0.7842352, -0.508099, -0.4301208, 1, 1, 1, 1, 1,
-0.7837381, 0.6624013, -1.869241, 1, 1, 1, 1, 1,
-0.7825763, 0.991626, -0.9698718, 1, 1, 1, 1, 1,
-0.7822441, 0.4821988, 0.1075002, 1, 1, 1, 1, 1,
-0.7798162, -0.08904488, -1.583606, 1, 1, 1, 1, 1,
-0.7778459, -0.6829183, -2.624071, 1, 1, 1, 1, 1,
-0.7754186, -0.2459529, -3.409889, 1, 1, 1, 1, 1,
-0.77409, -0.196437, 0.1910968, 1, 1, 1, 1, 1,
-0.7642802, -0.3304498, -0.2693478, 1, 1, 1, 1, 1,
-0.7590521, 0.08978201, -0.2830647, 1, 1, 1, 1, 1,
-0.7590492, 0.3066905, -0.2369246, 1, 1, 1, 1, 1,
-0.7552398, 0.6010635, -2.499991, 1, 1, 1, 1, 1,
-0.754628, -0.8281425, -2.370416, 1, 1, 1, 1, 1,
-0.7539849, -0.04184651, -1.772506, 0, 0, 1, 1, 1,
-0.7538127, 0.7302516, -0.6667903, 1, 0, 0, 1, 1,
-0.7536039, 0.3931261, -1.774421, 1, 0, 0, 1, 1,
-0.7533957, 1.35807, 1.872558, 1, 0, 0, 1, 1,
-0.750024, -1.252013, -0.9814471, 1, 0, 0, 1, 1,
-0.7491129, 1.708484, -1.35728, 1, 0, 0, 1, 1,
-0.7479963, 0.1824487, -1.287892, 0, 0, 0, 1, 1,
-0.7477112, -0.1668437, -1.771679, 0, 0, 0, 1, 1,
-0.747695, 0.9395043, -0.8991482, 0, 0, 0, 1, 1,
-0.7429261, -0.006896816, -0.8238373, 0, 0, 0, 1, 1,
-0.7382616, -1.200464, -0.4525071, 0, 0, 0, 1, 1,
-0.737273, -0.3778568, -1.609237, 0, 0, 0, 1, 1,
-0.7356951, -1.454732, -2.279551, 0, 0, 0, 1, 1,
-0.7333962, 2.76458, -0.8002692, 1, 1, 1, 1, 1,
-0.731868, -1.841039, -2.98951, 1, 1, 1, 1, 1,
-0.7247796, -1.329099, -3.521228, 1, 1, 1, 1, 1,
-0.7227088, -0.1655176, -2.322866, 1, 1, 1, 1, 1,
-0.7185617, -0.310058, -4.218706, 1, 1, 1, 1, 1,
-0.7163373, -0.8108006, -1.587588, 1, 1, 1, 1, 1,
-0.711339, -0.3778895, -2.623994, 1, 1, 1, 1, 1,
-0.7094544, -2.089524, -2.082401, 1, 1, 1, 1, 1,
-0.7089257, -0.7409595, -2.364504, 1, 1, 1, 1, 1,
-0.7066059, 0.7170828, -0.7254881, 1, 1, 1, 1, 1,
-0.7052932, -1.91958, -2.551218, 1, 1, 1, 1, 1,
-0.7019373, 0.1063013, -0.1398751, 1, 1, 1, 1, 1,
-0.6839302, -1.254307, -3.524587, 1, 1, 1, 1, 1,
-0.6801307, -0.9713768, -2.003479, 1, 1, 1, 1, 1,
-0.6735166, -1.307265, -1.017324, 1, 1, 1, 1, 1,
-0.6734192, 1.349681, 0.353727, 0, 0, 1, 1, 1,
-0.6708089, 0.4917641, -2.25606, 1, 0, 0, 1, 1,
-0.668773, -1.379012, -1.85497, 1, 0, 0, 1, 1,
-0.6686695, -0.7563688, -1.847917, 1, 0, 0, 1, 1,
-0.6645935, -0.4772412, -3.257127, 1, 0, 0, 1, 1,
-0.6617529, 0.2575739, -1.353803, 1, 0, 0, 1, 1,
-0.6611762, 0.3436842, -1.430539, 0, 0, 0, 1, 1,
-0.6611369, 1.51999, 0.6651658, 0, 0, 0, 1, 1,
-0.6561928, 0.1303182, -3.388776, 0, 0, 0, 1, 1,
-0.65325, -1.74463, -3.801939, 0, 0, 0, 1, 1,
-0.6521643, -1.841828, -4.214338, 0, 0, 0, 1, 1,
-0.65084, 0.1725263, -0.401239, 0, 0, 0, 1, 1,
-0.6480671, 0.9764028, -0.8250793, 0, 0, 0, 1, 1,
-0.6449462, 0.6192127, 0.2927247, 1, 1, 1, 1, 1,
-0.6344969, 0.6777559, 0.4614059, 1, 1, 1, 1, 1,
-0.6332983, 0.283578, -0.1061314, 1, 1, 1, 1, 1,
-0.6331324, 0.01288436, -1.210164, 1, 1, 1, 1, 1,
-0.6329903, 0.3272474, -0.3001506, 1, 1, 1, 1, 1,
-0.6292647, -0.1230338, -2.773675, 1, 1, 1, 1, 1,
-0.6291763, -0.2734556, -0.1556465, 1, 1, 1, 1, 1,
-0.6255416, -1.287199, -2.571203, 1, 1, 1, 1, 1,
-0.6182643, -0.2484836, -3.365622, 1, 1, 1, 1, 1,
-0.6181732, -0.3408468, -2.356693, 1, 1, 1, 1, 1,
-0.6126471, 0.1321253, -1.114598, 1, 1, 1, 1, 1,
-0.6108286, 0.5009856, -0.7005862, 1, 1, 1, 1, 1,
-0.6069731, -0.0853744, -0.3330524, 1, 1, 1, 1, 1,
-0.604715, -0.7147703, -2.511002, 1, 1, 1, 1, 1,
-0.6032089, 0.4280888, -0.03618577, 1, 1, 1, 1, 1,
-0.6021183, -2.23771, -3.282979, 0, 0, 1, 1, 1,
-0.6013424, 0.7154051, -1.586677, 1, 0, 0, 1, 1,
-0.5992833, -0.4404046, -1.4976, 1, 0, 0, 1, 1,
-0.5990095, 1.967608, -0.8905236, 1, 0, 0, 1, 1,
-0.5871602, -1.136573, -4.20381, 1, 0, 0, 1, 1,
-0.5792189, -1.195697, -2.558232, 1, 0, 0, 1, 1,
-0.5692775, -1.637322, -3.156382, 0, 0, 0, 1, 1,
-0.5645049, -0.1170805, -0.5111407, 0, 0, 0, 1, 1,
-0.562964, 1.156416, -0.04654782, 0, 0, 0, 1, 1,
-0.5610359, -0.151175, -1.570219, 0, 0, 0, 1, 1,
-0.5591735, 1.284626, 1.507109, 0, 0, 0, 1, 1,
-0.5569641, 0.2614423, -2.69133, 0, 0, 0, 1, 1,
-0.555773, 1.216901, 0.5376055, 0, 0, 0, 1, 1,
-0.5518304, -0.8206214, -3.443285, 1, 1, 1, 1, 1,
-0.5493207, -0.5008531, -1.850184, 1, 1, 1, 1, 1,
-0.5377242, 0.04888666, -0.5574406, 1, 1, 1, 1, 1,
-0.5335053, 1.610317, -1.434904, 1, 1, 1, 1, 1,
-0.5329248, 1.903067, -0.2706292, 1, 1, 1, 1, 1,
-0.5285457, 0.8683205, -1.552307, 1, 1, 1, 1, 1,
-0.5253164, -1.633722, -5.298209, 1, 1, 1, 1, 1,
-0.5251998, 1.149555, 0.1970126, 1, 1, 1, 1, 1,
-0.5247395, -0.9020576, -0.8949659, 1, 1, 1, 1, 1,
-0.5247247, 0.03514133, 0.001954831, 1, 1, 1, 1, 1,
-0.5236081, -1.776643, -2.652488, 1, 1, 1, 1, 1,
-0.5227672, -2.510618, -2.047371, 1, 1, 1, 1, 1,
-0.5055882, -0.6803934, -1.9767, 1, 1, 1, 1, 1,
-0.5040473, 2.749297, 0.167409, 1, 1, 1, 1, 1,
-0.5020368, 1.31334, -1.056259, 1, 1, 1, 1, 1,
-0.4993105, 2.273048, 1.573766, 0, 0, 1, 1, 1,
-0.4983555, 0.7922276, 0.2755454, 1, 0, 0, 1, 1,
-0.4976243, 0.1998371, -2.888818, 1, 0, 0, 1, 1,
-0.4960136, -0.4541493, -1.765149, 1, 0, 0, 1, 1,
-0.4940648, -1.119996, -1.652995, 1, 0, 0, 1, 1,
-0.4938101, 1.187418, -1.035691, 1, 0, 0, 1, 1,
-0.4937063, 1.020198, 0.1613902, 0, 0, 0, 1, 1,
-0.4934384, 0.2280401, -1.507424, 0, 0, 0, 1, 1,
-0.4896255, -1.659872, -3.649174, 0, 0, 0, 1, 1,
-0.4857073, 1.261777, -0.7244051, 0, 0, 0, 1, 1,
-0.4839306, -1.23203, -2.369262, 0, 0, 0, 1, 1,
-0.4814834, -0.5942577, -4.409252, 0, 0, 0, 1, 1,
-0.4791417, 2.494385, -0.6034896, 0, 0, 0, 1, 1,
-0.4694741, 0.7932202, -2.140589, 1, 1, 1, 1, 1,
-0.4681448, -0.5440245, -3.392858, 1, 1, 1, 1, 1,
-0.4522338, 0.7382963, 0.8644651, 1, 1, 1, 1, 1,
-0.4510171, 1.616156, -1.784302, 1, 1, 1, 1, 1,
-0.4507327, -2.138783, -2.558159, 1, 1, 1, 1, 1,
-0.4462858, 1.315454, -0.8569226, 1, 1, 1, 1, 1,
-0.4424432, -0.9963968, -3.238422, 1, 1, 1, 1, 1,
-0.441184, -1.101082, -4.199131, 1, 1, 1, 1, 1,
-0.4408758, 1.006285, 0.3183725, 1, 1, 1, 1, 1,
-0.43727, -0.05630489, -2.04654, 1, 1, 1, 1, 1,
-0.4357429, -0.5417327, -2.485998, 1, 1, 1, 1, 1,
-0.4351773, 1.27442, -0.8669269, 1, 1, 1, 1, 1,
-0.4340975, -0.3233736, -3.405914, 1, 1, 1, 1, 1,
-0.4280045, -0.8471849, -2.016897, 1, 1, 1, 1, 1,
-0.4269727, -0.680702, -2.969155, 1, 1, 1, 1, 1,
-0.4260047, 2.342776, 0.3181961, 0, 0, 1, 1, 1,
-0.4241625, 1.020966, -1.110223, 1, 0, 0, 1, 1,
-0.4220478, 0.6948642, -1.934484, 1, 0, 0, 1, 1,
-0.4212505, 0.6627815, -1.860989, 1, 0, 0, 1, 1,
-0.4202606, 0.3799893, 0.9103161, 1, 0, 0, 1, 1,
-0.4187479, -0.02549638, -2.735189, 1, 0, 0, 1, 1,
-0.4183384, -0.8781343, -1.90298, 0, 0, 0, 1, 1,
-0.4156139, 1.563678, -0.3938993, 0, 0, 0, 1, 1,
-0.4145475, -2.05118, -2.539062, 0, 0, 0, 1, 1,
-0.4144529, 0.04631443, -1.634645, 0, 0, 0, 1, 1,
-0.40571, -1.488358, -3.50848, 0, 0, 0, 1, 1,
-0.4055786, -1.541752, -2.050213, 0, 0, 0, 1, 1,
-0.4036686, -0.05133052, -0.4867184, 0, 0, 0, 1, 1,
-0.3963333, 0.2927302, -1.266429, 1, 1, 1, 1, 1,
-0.3960209, 0.3024318, -0.183137, 1, 1, 1, 1, 1,
-0.3956747, -0.3609105, -3.1856, 1, 1, 1, 1, 1,
-0.392782, -0.970116, -3.516839, 1, 1, 1, 1, 1,
-0.3912174, -0.2957079, -0.313402, 1, 1, 1, 1, 1,
-0.3901855, -1.592636, -2.331861, 1, 1, 1, 1, 1,
-0.3875987, -0.5687444, -2.657894, 1, 1, 1, 1, 1,
-0.3872918, 0.8941911, 1.784068, 1, 1, 1, 1, 1,
-0.3836144, 0.6016924, -0.9209742, 1, 1, 1, 1, 1,
-0.3777077, 0.7362702, -0.09424917, 1, 1, 1, 1, 1,
-0.3740553, -0.7009971, -3.054567, 1, 1, 1, 1, 1,
-0.3730664, -0.35352, -2.597406, 1, 1, 1, 1, 1,
-0.3729694, -0.2426735, -1.418811, 1, 1, 1, 1, 1,
-0.3699742, 0.2815416, -1.675131, 1, 1, 1, 1, 1,
-0.3664459, 0.6169583, -1.356446, 1, 1, 1, 1, 1,
-0.3650911, -1.089321, -2.279621, 0, 0, 1, 1, 1,
-0.355538, 0.2014001, -1.904034, 1, 0, 0, 1, 1,
-0.3433044, -0.6463426, -1.863, 1, 0, 0, 1, 1,
-0.3428932, -0.5396895, -4.328453, 1, 0, 0, 1, 1,
-0.3412393, 2.573004, -0.004084095, 1, 0, 0, 1, 1,
-0.341076, -0.2115173, -2.683533, 1, 0, 0, 1, 1,
-0.3392749, -0.08010518, -2.596642, 0, 0, 0, 1, 1,
-0.3363279, 1.584629, -0.1456511, 0, 0, 0, 1, 1,
-0.3299629, 1.00243, 0.8673096, 0, 0, 0, 1, 1,
-0.3272339, 1.020217, 0.01122444, 0, 0, 0, 1, 1,
-0.3204629, 1.154513, 0.608309, 0, 0, 0, 1, 1,
-0.31797, -0.2486536, -0.4755054, 0, 0, 0, 1, 1,
-0.3139752, 0.1607675, -3.405547, 0, 0, 0, 1, 1,
-0.3122901, 1.367532, 0.1386459, 1, 1, 1, 1, 1,
-0.3111688, 0.2091136, -2.300726, 1, 1, 1, 1, 1,
-0.3109665, -1.855824, -2.847879, 1, 1, 1, 1, 1,
-0.3081772, -1.065267, -3.906476, 1, 1, 1, 1, 1,
-0.2985007, 0.8271942, -0.5782432, 1, 1, 1, 1, 1,
-0.2930677, 0.855857, -1.885458, 1, 1, 1, 1, 1,
-0.2906514, 1.074706, 1.063982, 1, 1, 1, 1, 1,
-0.2905943, -1.062783, -2.691368, 1, 1, 1, 1, 1,
-0.2878785, -0.7032862, -2.681986, 1, 1, 1, 1, 1,
-0.2872683, 2.415939, 0.2603611, 1, 1, 1, 1, 1,
-0.2849934, 0.05468553, -0.454303, 1, 1, 1, 1, 1,
-0.282317, 0.672614, -0.2318687, 1, 1, 1, 1, 1,
-0.2813987, 0.09603653, -1.926259, 1, 1, 1, 1, 1,
-0.2776699, 0.580146, -1.827042, 1, 1, 1, 1, 1,
-0.2771525, 1.501988, 1.632361, 1, 1, 1, 1, 1,
-0.2739573, -0.03103179, -1.897699, 0, 0, 1, 1, 1,
-0.2737063, -1.752092, -3.311297, 1, 0, 0, 1, 1,
-0.2726946, -0.868051, -2.479351, 1, 0, 0, 1, 1,
-0.2722512, -0.2555731, -2.838825, 1, 0, 0, 1, 1,
-0.2692285, -0.9271878, -3.526055, 1, 0, 0, 1, 1,
-0.2690556, -0.2716809, -0.01978353, 1, 0, 0, 1, 1,
-0.2689309, -2.150366, -3.579171, 0, 0, 0, 1, 1,
-0.2681667, 0.2292487, -2.201153, 0, 0, 0, 1, 1,
-0.2651501, -0.8619165, -2.785944, 0, 0, 0, 1, 1,
-0.2624865, -0.3998742, -0.5237194, 0, 0, 0, 1, 1,
-0.2509229, 1.135471, -0.3400183, 0, 0, 0, 1, 1,
-0.2469268, -0.7060972, -2.270315, 0, 0, 0, 1, 1,
-0.2400398, -1.565847, -1.657027, 0, 0, 0, 1, 1,
-0.2379014, 0.8214775, 1.568822, 1, 1, 1, 1, 1,
-0.2374323, -0.03894694, -1.292485, 1, 1, 1, 1, 1,
-0.2369789, 0.2771965, -2.241345, 1, 1, 1, 1, 1,
-0.2369483, 2.273987, -0.8319153, 1, 1, 1, 1, 1,
-0.2359182, -0.9392901, -2.101497, 1, 1, 1, 1, 1,
-0.23429, -1.078735, -3.318423, 1, 1, 1, 1, 1,
-0.2320896, -0.2009955, -2.11332, 1, 1, 1, 1, 1,
-0.2308863, -0.3767856, -2.532439, 1, 1, 1, 1, 1,
-0.227754, -0.7994089, -2.685446, 1, 1, 1, 1, 1,
-0.2275643, -0.1012963, -2.175606, 1, 1, 1, 1, 1,
-0.225113, -0.2221138, -2.734573, 1, 1, 1, 1, 1,
-0.2249814, 2.124134, 0.4950825, 1, 1, 1, 1, 1,
-0.2142304, -0.4605631, -1.904028, 1, 1, 1, 1, 1,
-0.213523, 0.1526718, -2.317216, 1, 1, 1, 1, 1,
-0.2114164, -0.3208493, -2.481472, 1, 1, 1, 1, 1,
-0.2069281, -0.07862052, -0.623196, 0, 0, 1, 1, 1,
-0.2006226, -0.05684892, -1.023126, 1, 0, 0, 1, 1,
-0.1958411, -1.519105, -3.029582, 1, 0, 0, 1, 1,
-0.1908509, 2.281507, -0.6393189, 1, 0, 0, 1, 1,
-0.1907042, -0.309254, -0.6682279, 1, 0, 0, 1, 1,
-0.189076, -0.8777721, -2.793866, 1, 0, 0, 1, 1,
-0.1843781, 0.7437682, -0.8868889, 0, 0, 0, 1, 1,
-0.1824431, 0.05196811, -1.278686, 0, 0, 0, 1, 1,
-0.1802965, -0.2416587, -2.627351, 0, 0, 0, 1, 1,
-0.179775, 0.4629664, -0.1800536, 0, 0, 0, 1, 1,
-0.174272, -1.440642, -1.190781, 0, 0, 0, 1, 1,
-0.1729649, -1.353966, -4.401998, 0, 0, 0, 1, 1,
-0.1692807, 0.3676389, -0.3894795, 0, 0, 0, 1, 1,
-0.1690577, -0.5428613, -4.068017, 1, 1, 1, 1, 1,
-0.1657395, 0.003106921, -2.789938, 1, 1, 1, 1, 1,
-0.1651025, 2.62165, -0.3714828, 1, 1, 1, 1, 1,
-0.1645126, 0.4240708, -0.367687, 1, 1, 1, 1, 1,
-0.1597834, 0.9750741, -0.4824581, 1, 1, 1, 1, 1,
-0.1563417, -0.01946513, -0.84594, 1, 1, 1, 1, 1,
-0.151456, 1.815803, 0.6543803, 1, 1, 1, 1, 1,
-0.1501308, 0.1579428, -1.478591, 1, 1, 1, 1, 1,
-0.1437258, -0.4014756, -2.370876, 1, 1, 1, 1, 1,
-0.1403988, -1.286376, -2.091585, 1, 1, 1, 1, 1,
-0.138348, -0.7359136, -2.133085, 1, 1, 1, 1, 1,
-0.1336004, 0.5813223, -1.220018, 1, 1, 1, 1, 1,
-0.1315504, 1.125275, -0.7236261, 1, 1, 1, 1, 1,
-0.1261778, -0.5542926, -3.154109, 1, 1, 1, 1, 1,
-0.1257811, 0.3447349, -0.5603433, 1, 1, 1, 1, 1,
-0.1232667, -0.459527, -2.248077, 0, 0, 1, 1, 1,
-0.1215867, 0.1764829, 1.03895, 1, 0, 0, 1, 1,
-0.1215345, -0.3711811, -2.301739, 1, 0, 0, 1, 1,
-0.1213873, -0.27542, -0.9813155, 1, 0, 0, 1, 1,
-0.1205361, 0.4769374, -0.08153723, 1, 0, 0, 1, 1,
-0.1187976, -0.9784866, -2.965301, 1, 0, 0, 1, 1,
-0.1137397, -0.7208552, -2.050033, 0, 0, 0, 1, 1,
-0.1134784, -1.226492, -2.978666, 0, 0, 0, 1, 1,
-0.1130133, 1.844207, -0.6963885, 0, 0, 0, 1, 1,
-0.1120651, -1.052022, -3.983732, 0, 0, 0, 1, 1,
-0.1071448, -0.08725268, -3.760956, 0, 0, 0, 1, 1,
-0.1071325, 0.6874666, -1.311612, 0, 0, 0, 1, 1,
-0.1062299, -0.7507407, -1.758165, 0, 0, 0, 1, 1,
-0.1031089, -1.203934, -4.354495, 1, 1, 1, 1, 1,
-0.101877, -1.248006, -2.636677, 1, 1, 1, 1, 1,
-0.09173041, -0.628386, -1.261239, 1, 1, 1, 1, 1,
-0.08370655, -0.5028127, -4.422282, 1, 1, 1, 1, 1,
-0.08357254, -0.2022075, -3.681784, 1, 1, 1, 1, 1,
-0.07683878, -1.329987, -2.106162, 1, 1, 1, 1, 1,
-0.07002081, 0.8066024, -0.6240321, 1, 1, 1, 1, 1,
-0.06962867, -1.972785, -2.053012, 1, 1, 1, 1, 1,
-0.06834119, 0.4275088, -0.9989098, 1, 1, 1, 1, 1,
-0.06649657, 0.4288158, -0.7409597, 1, 1, 1, 1, 1,
-0.06513492, 0.9953746, -0.750181, 1, 1, 1, 1, 1,
-0.06180215, 1.509038, -1.031503, 1, 1, 1, 1, 1,
-0.05771516, 0.651892, -1.338987, 1, 1, 1, 1, 1,
-0.05584544, -1.06118, -4.049853, 1, 1, 1, 1, 1,
-0.05466875, 0.7695993, -0.2116861, 1, 1, 1, 1, 1,
-0.05442828, -0.4903952, -1.910684, 0, 0, 1, 1, 1,
-0.05410442, -0.3411369, -3.45408, 1, 0, 0, 1, 1,
-0.05132615, 0.9184877, -1.425653, 1, 0, 0, 1, 1,
-0.04687983, 0.162384, 0.5521874, 1, 0, 0, 1, 1,
-0.04584217, -0.1027974, -2.542998, 1, 0, 0, 1, 1,
-0.04525721, -0.3157552, -3.035144, 1, 0, 0, 1, 1,
-0.0428947, -0.3258178, -1.478225, 0, 0, 0, 1, 1,
-0.04016633, -1.475445, -4.65293, 0, 0, 0, 1, 1,
-0.03289379, -1.156108, -2.846093, 0, 0, 0, 1, 1,
-0.03166695, 0.04947696, -1.726496, 0, 0, 0, 1, 1,
-0.02964306, 1.352409, -0.513131, 0, 0, 0, 1, 1,
-0.0259697, -1.109726, -4.526481, 0, 0, 0, 1, 1,
-0.02463924, 0.7708603, -0.3149137, 0, 0, 0, 1, 1,
-0.01891949, -0.741798, -1.9727, 1, 1, 1, 1, 1,
-0.01516926, -0.3337298, -1.790504, 1, 1, 1, 1, 1,
-0.01304091, -0.1055477, -4.314676, 1, 1, 1, 1, 1,
-0.01044749, -0.5602325, -3.088905, 1, 1, 1, 1, 1,
-0.01022909, 1.079691, 0.8880695, 1, 1, 1, 1, 1,
-0.01013146, -1.153877, -1.778778, 1, 1, 1, 1, 1,
-0.007024006, -0.6159772, -1.290297, 1, 1, 1, 1, 1,
-0.006172031, -0.0100903, -2.689396, 1, 1, 1, 1, 1,
-0.006164823, 0.3329297, -1.01695, 1, 1, 1, 1, 1,
-0.006076517, -0.6046489, -2.696002, 1, 1, 1, 1, 1,
-0.003608079, -1.036265, -3.09815, 1, 1, 1, 1, 1,
0.004456926, -1.549862, 1.910711, 1, 1, 1, 1, 1,
0.01988482, -2.173468, 3.204129, 1, 1, 1, 1, 1,
0.02480204, -0.3771445, 3.637228, 1, 1, 1, 1, 1,
0.02967839, -0.4526703, 1.961697, 1, 1, 1, 1, 1,
0.03406771, 0.2656917, 0.2624575, 0, 0, 1, 1, 1,
0.03507671, 1.00861, -0.2604623, 1, 0, 0, 1, 1,
0.037687, 0.5969669, -1.6265, 1, 0, 0, 1, 1,
0.04093667, 0.8947771, 0.007334234, 1, 0, 0, 1, 1,
0.04224231, 0.9503123, -0.379961, 1, 0, 0, 1, 1,
0.04350517, -1.213359, 3.51642, 1, 0, 0, 1, 1,
0.05031333, 1.334694, -0.3613752, 0, 0, 0, 1, 1,
0.05248886, -0.4859335, 2.766168, 0, 0, 0, 1, 1,
0.06188953, -0.01761962, 1.336232, 0, 0, 0, 1, 1,
0.06235842, -0.1804453, 3.792408, 0, 0, 0, 1, 1,
0.06328939, 1.318031, -0.6135417, 0, 0, 0, 1, 1,
0.06529387, -0.26566, 2.481848, 0, 0, 0, 1, 1,
0.06573042, 1.615205, -0.2703978, 0, 0, 0, 1, 1,
0.07152922, 0.705131, -0.3702564, 1, 1, 1, 1, 1,
0.07527556, -1.067081, 1.499323, 1, 1, 1, 1, 1,
0.07886992, 1.761594, 0.1424988, 1, 1, 1, 1, 1,
0.0790801, -0.3449284, 2.398291, 1, 1, 1, 1, 1,
0.08064277, -1.089401, 2.534387, 1, 1, 1, 1, 1,
0.08165288, 0.6750159, 0.9026947, 1, 1, 1, 1, 1,
0.0925016, 0.2361913, -2.017502, 1, 1, 1, 1, 1,
0.0942407, -0.7730692, 3.27478, 1, 1, 1, 1, 1,
0.09443826, -1.860794, 3.052029, 1, 1, 1, 1, 1,
0.09459674, 0.8176081, 1.094986, 1, 1, 1, 1, 1,
0.1017437, 1.795736, 0.114816, 1, 1, 1, 1, 1,
0.1028646, -1.011687, 6.024611, 1, 1, 1, 1, 1,
0.103772, -0.3490141, 3.97121, 1, 1, 1, 1, 1,
0.1059254, -0.02262591, 1.540518, 1, 1, 1, 1, 1,
0.1060123, 1.030614, 1.299848, 1, 1, 1, 1, 1,
0.1092873, 1.738586, -2.462441, 0, 0, 1, 1, 1,
0.1106477, 0.2443374, -0.9641926, 1, 0, 0, 1, 1,
0.122202, -0.8372523, 3.625483, 1, 0, 0, 1, 1,
0.1238813, 0.01109676, 2.131697, 1, 0, 0, 1, 1,
0.1303364, -1.322402, 3.851234, 1, 0, 0, 1, 1,
0.1358787, 2.005397, 0.7771522, 1, 0, 0, 1, 1,
0.1365287, -1.013521, 3.441691, 0, 0, 0, 1, 1,
0.1428884, -0.01414595, 1.40658, 0, 0, 0, 1, 1,
0.1462817, -0.4251888, 1.93403, 0, 0, 0, 1, 1,
0.1478098, 0.2477305, 0.6326391, 0, 0, 0, 1, 1,
0.1479882, -0.3451219, 1.60731, 0, 0, 0, 1, 1,
0.1500339, 0.6318615, -0.4843519, 0, 0, 0, 1, 1,
0.1515509, -0.5071004, 4.123976, 0, 0, 0, 1, 1,
0.1562389, -0.01759562, 2.655485, 1, 1, 1, 1, 1,
0.1574094, 1.010214, -1.360106, 1, 1, 1, 1, 1,
0.1582868, 1.026623, -1.063285, 1, 1, 1, 1, 1,
0.1596095, -0.1607226, 1.300315, 1, 1, 1, 1, 1,
0.1609786, 0.7645158, 0.879541, 1, 1, 1, 1, 1,
0.1619061, -0.5940115, 2.008864, 1, 1, 1, 1, 1,
0.1642427, -1.039668, 1.375946, 1, 1, 1, 1, 1,
0.1671258, 1.362673, -0.06898779, 1, 1, 1, 1, 1,
0.1738313, 1.893245, -0.9095967, 1, 1, 1, 1, 1,
0.1751844, -1.565039, 3.544471, 1, 1, 1, 1, 1,
0.1790165, 0.3425129, 1.245548, 1, 1, 1, 1, 1,
0.1797581, 0.6898682, 1.76172, 1, 1, 1, 1, 1,
0.180195, 0.4129863, 1.246284, 1, 1, 1, 1, 1,
0.1832808, -0.2623515, 1.853672, 1, 1, 1, 1, 1,
0.1850137, 1.476819, 0.8616939, 1, 1, 1, 1, 1,
0.186807, -1.281319, 3.045462, 0, 0, 1, 1, 1,
0.1890521, -0.4019958, 2.714367, 1, 0, 0, 1, 1,
0.1986503, 1.440624, -0.4181037, 1, 0, 0, 1, 1,
0.2070081, -0.5345893, 1.782776, 1, 0, 0, 1, 1,
0.2088891, -0.7136586, 2.331338, 1, 0, 0, 1, 1,
0.2106198, 0.09917245, 0.01618371, 1, 0, 0, 1, 1,
0.2118352, -0.03784145, 2.112904, 0, 0, 0, 1, 1,
0.2163383, 0.2562096, 1.151391, 0, 0, 0, 1, 1,
0.2169823, 0.1882263, 1.815094, 0, 0, 0, 1, 1,
0.2170445, 0.001501578, 1.136865, 0, 0, 0, 1, 1,
0.2223745, -0.36455, 0.7130109, 0, 0, 0, 1, 1,
0.2240792, -1.537236, 3.815052, 0, 0, 0, 1, 1,
0.2253917, 0.3262015, -0.167463, 0, 0, 0, 1, 1,
0.2262262, 0.01190418, 1.302211, 1, 1, 1, 1, 1,
0.2284579, -0.9245306, 2.732121, 1, 1, 1, 1, 1,
0.2302963, -0.2468217, 1.460641, 1, 1, 1, 1, 1,
0.2375063, 0.2541189, -1.720863, 1, 1, 1, 1, 1,
0.2386821, -1.361086, 2.555187, 1, 1, 1, 1, 1,
0.2388487, 1.285623, 0.04595884, 1, 1, 1, 1, 1,
0.2394291, -0.5285976, 1.569991, 1, 1, 1, 1, 1,
0.2395065, -0.1237861, 2.521293, 1, 1, 1, 1, 1,
0.2416463, 0.6903501, 0.3540797, 1, 1, 1, 1, 1,
0.241673, -0.1182898, 2.744984, 1, 1, 1, 1, 1,
0.2417493, -1.529765, 4.256375, 1, 1, 1, 1, 1,
0.2448079, -0.981506, 3.028948, 1, 1, 1, 1, 1,
0.2454369, -1.282549, 4.685788, 1, 1, 1, 1, 1,
0.2456482, 1.037214, -0.8937088, 1, 1, 1, 1, 1,
0.2479793, -0.02773019, 1.559295, 1, 1, 1, 1, 1,
0.2481665, -0.8460512, 2.674962, 0, 0, 1, 1, 1,
0.2580326, -0.2881186, 2.722148, 1, 0, 0, 1, 1,
0.2590386, -0.07793692, 0.8019031, 1, 0, 0, 1, 1,
0.2596948, 0.0726681, 1.540373, 1, 0, 0, 1, 1,
0.2634826, -1.45698, 3.147043, 1, 0, 0, 1, 1,
0.2643777, -0.1488041, 4.250426, 1, 0, 0, 1, 1,
0.2693738, 1.676617, 0.8019165, 0, 0, 0, 1, 1,
0.2717023, 0.3616574, -0.7755388, 0, 0, 0, 1, 1,
0.2761988, 0.7915584, 0.2853427, 0, 0, 0, 1, 1,
0.2782924, 0.918213, -1.459993, 0, 0, 0, 1, 1,
0.2790363, -0.5702048, 2.392338, 0, 0, 0, 1, 1,
0.2805743, -0.6357355, 2.325212, 0, 0, 0, 1, 1,
0.2811799, -0.1633217, 2.005741, 0, 0, 0, 1, 1,
0.2812454, -0.9286126, 3.211976, 1, 1, 1, 1, 1,
0.2915189, 0.4834111, 1.660168, 1, 1, 1, 1, 1,
0.2927316, 1.680484, 1.023282, 1, 1, 1, 1, 1,
0.300692, -0.205034, 1.172593, 1, 1, 1, 1, 1,
0.3018984, 0.983604, -0.3208252, 1, 1, 1, 1, 1,
0.304235, -2.461863, 4.300397, 1, 1, 1, 1, 1,
0.305895, -0.7855372, 2.748548, 1, 1, 1, 1, 1,
0.310242, -0.5648254, 4.406215, 1, 1, 1, 1, 1,
0.3144426, -1.101023, 2.408465, 1, 1, 1, 1, 1,
0.3144499, 1.109737, -1.1158, 1, 1, 1, 1, 1,
0.3162188, -0.2529758, 1.766716, 1, 1, 1, 1, 1,
0.3200566, 0.05566623, 2.819968, 1, 1, 1, 1, 1,
0.3223082, -1.072961, 2.660875, 1, 1, 1, 1, 1,
0.3265056, -1.440535, 3.344312, 1, 1, 1, 1, 1,
0.3278515, -0.9883235, 2.135562, 1, 1, 1, 1, 1,
0.3281908, 0.3685628, 0.357918, 0, 0, 1, 1, 1,
0.3328927, -0.5664089, 3.074499, 1, 0, 0, 1, 1,
0.3363447, -1.816959, 2.454043, 1, 0, 0, 1, 1,
0.3397215, 1.346459, 0.9807365, 1, 0, 0, 1, 1,
0.3426876, -0.423556, 2.621208, 1, 0, 0, 1, 1,
0.3429584, 0.8024487, 0.06397672, 1, 0, 0, 1, 1,
0.3483081, -1.828728, 2.596201, 0, 0, 0, 1, 1,
0.3503027, 0.410105, 1.290884, 0, 0, 0, 1, 1,
0.3600831, -0.4059255, 1.755152, 0, 0, 0, 1, 1,
0.360763, 0.8603489, 1.039483, 0, 0, 0, 1, 1,
0.3614495, 0.7901187, 0.7334549, 0, 0, 0, 1, 1,
0.3677909, -0.1051871, 2.965408, 0, 0, 0, 1, 1,
0.3729075, -0.7938284, 1.73904, 0, 0, 0, 1, 1,
0.3755433, -1.182441, 3.31319, 1, 1, 1, 1, 1,
0.3767729, 1.484162, 0.1221198, 1, 1, 1, 1, 1,
0.3778939, 0.5252386, 0.924887, 1, 1, 1, 1, 1,
0.3792234, 0.4232726, 1.587504, 1, 1, 1, 1, 1,
0.3805334, -0.3362813, 2.663725, 1, 1, 1, 1, 1,
0.3825741, -1.403926, 2.417433, 1, 1, 1, 1, 1,
0.3853669, 0.2740992, 1.587377, 1, 1, 1, 1, 1,
0.3866324, -0.5219905, 1.645059, 1, 1, 1, 1, 1,
0.3932742, 0.4283281, 0.3250433, 1, 1, 1, 1, 1,
0.3977, 0.04355769, 3.776878, 1, 1, 1, 1, 1,
0.3982761, 0.2194645, 1.249547, 1, 1, 1, 1, 1,
0.4026287, -0.5499022, 3.199029, 1, 1, 1, 1, 1,
0.402896, 0.3373716, 2.663612, 1, 1, 1, 1, 1,
0.4052926, -0.1169129, 1.838544, 1, 1, 1, 1, 1,
0.4054868, -0.05056955, 1.042613, 1, 1, 1, 1, 1,
0.4062722, 1.633211, -0.2194889, 0, 0, 1, 1, 1,
0.4072618, 0.7174723, 1.793736, 1, 0, 0, 1, 1,
0.4106647, 0.1670806, 1.267905, 1, 0, 0, 1, 1,
0.413974, -0.7011276, 1.69145, 1, 0, 0, 1, 1,
0.4143082, 1.319091, 0.7276236, 1, 0, 0, 1, 1,
0.418425, 0.1957304, -0.1443316, 1, 0, 0, 1, 1,
0.4184836, -0.5440748, 3.173666, 0, 0, 0, 1, 1,
0.4277451, -0.06741179, 2.19199, 0, 0, 0, 1, 1,
0.4296704, -0.09071705, 2.250899, 0, 0, 0, 1, 1,
0.432719, 0.03471288, 1.718819, 0, 0, 0, 1, 1,
0.4390555, 1.566541, -0.2520552, 0, 0, 0, 1, 1,
0.4407173, -0.1651742, 2.833077, 0, 0, 0, 1, 1,
0.4415884, 1.025105, 1.01858, 0, 0, 0, 1, 1,
0.4432399, -0.1059235, -1.793317, 1, 1, 1, 1, 1,
0.4460446, 0.2467028, 0.7214228, 1, 1, 1, 1, 1,
0.4490237, -1.069846, 2.996137, 1, 1, 1, 1, 1,
0.4508156, -0.3840816, 0.6919564, 1, 1, 1, 1, 1,
0.4568683, 1.033167, 1.774413, 1, 1, 1, 1, 1,
0.4587143, -0.1293423, 2.172375, 1, 1, 1, 1, 1,
0.4594164, -0.1083937, 1.497495, 1, 1, 1, 1, 1,
0.4606718, -0.9707715, 5.124704, 1, 1, 1, 1, 1,
0.4607726, 0.5371728, -0.4939085, 1, 1, 1, 1, 1,
0.4644588, -0.8810063, 2.105641, 1, 1, 1, 1, 1,
0.4664979, 0.8053225, -0.1837748, 1, 1, 1, 1, 1,
0.4674317, 0.04462596, 1.517558, 1, 1, 1, 1, 1,
0.4677033, 0.9117113, 0.9545959, 1, 1, 1, 1, 1,
0.4677853, 1.349813, 0.3073652, 1, 1, 1, 1, 1,
0.4681217, -0.4419325, 2.610687, 1, 1, 1, 1, 1,
0.4718335, 1.172607, 1.507291, 0, 0, 1, 1, 1,
0.4719213, 0.7960854, 1.67596, 1, 0, 0, 1, 1,
0.4725556, -1.20034, 2.930158, 1, 0, 0, 1, 1,
0.4766639, 1.322085, 1.080737, 1, 0, 0, 1, 1,
0.477657, -0.4030918, 1.77994, 1, 0, 0, 1, 1,
0.4782702, -0.1589929, 1.218222, 1, 0, 0, 1, 1,
0.4832602, 0.07256737, -1.237339, 0, 0, 0, 1, 1,
0.4902961, 1.610792, -1.814245, 0, 0, 0, 1, 1,
0.4912559, -0.2945366, 1.09809, 0, 0, 0, 1, 1,
0.4970548, 0.5346679, 2.358896, 0, 0, 0, 1, 1,
0.502735, 0.3223694, 0.7406628, 0, 0, 0, 1, 1,
0.5039539, 1.301179, -0.1736831, 0, 0, 0, 1, 1,
0.5074033, 1.487291, 0.1342219, 0, 0, 0, 1, 1,
0.5098605, 1.231941, 1.037615, 1, 1, 1, 1, 1,
0.5117477, -0.1596729, 1.854526, 1, 1, 1, 1, 1,
0.5130914, -0.1422068, 2.292044, 1, 1, 1, 1, 1,
0.5194581, -0.2012281, 1.926518, 1, 1, 1, 1, 1,
0.521907, 0.2961963, 2.15541, 1, 1, 1, 1, 1,
0.5222993, -1.104158, 3.293644, 1, 1, 1, 1, 1,
0.5252532, 0.9490528, 2.776532, 1, 1, 1, 1, 1,
0.5273494, 1.804972, -0.5156441, 1, 1, 1, 1, 1,
0.5274965, -1.050061, 2.279464, 1, 1, 1, 1, 1,
0.5313425, -0.2271249, 2.349569, 1, 1, 1, 1, 1,
0.5344164, 0.9048209, -0.4281448, 1, 1, 1, 1, 1,
0.5362464, 0.2927836, 1.427553, 1, 1, 1, 1, 1,
0.536878, -0.4640202, 1.666905, 1, 1, 1, 1, 1,
0.5376821, 0.484106, 1.334435, 1, 1, 1, 1, 1,
0.5458715, 0.8210652, 1.08294, 1, 1, 1, 1, 1,
0.5459582, -0.3997523, 3.044127, 0, 0, 1, 1, 1,
0.5559372, -0.3418396, 0.9000624, 1, 0, 0, 1, 1,
0.5565504, 1.742875, -1.44162, 1, 0, 0, 1, 1,
0.5588937, 3.570951, -1.303901, 1, 0, 0, 1, 1,
0.5600141, 0.3516784, 2.192703, 1, 0, 0, 1, 1,
0.5606468, 0.3542456, -0.2969643, 1, 0, 0, 1, 1,
0.5651973, -1.385678, 2.634556, 0, 0, 0, 1, 1,
0.572349, -0.1443937, 1.545589, 0, 0, 0, 1, 1,
0.5753112, 0.4062653, 0.7071627, 0, 0, 0, 1, 1,
0.5805497, -1.094998, 4.746701, 0, 0, 0, 1, 1,
0.5805758, 0.5094376, -0.3137478, 0, 0, 0, 1, 1,
0.5824274, 0.5211765, 0.5725616, 0, 0, 0, 1, 1,
0.5859079, -0.5423478, 2.340552, 0, 0, 0, 1, 1,
0.5877299, 1.236862, 1.269278, 1, 1, 1, 1, 1,
0.5889181, -0.803529, 2.169021, 1, 1, 1, 1, 1,
0.5915279, 0.05709748, 1.035844, 1, 1, 1, 1, 1,
0.5916185, 0.09629901, 2.925809, 1, 1, 1, 1, 1,
0.597403, -0.0767082, 2.256031, 1, 1, 1, 1, 1,
0.5978844, 1.645303, 0.139244, 1, 1, 1, 1, 1,
0.6059677, -1.297494, 3.608111, 1, 1, 1, 1, 1,
0.6066887, 0.7770407, 0.04953221, 1, 1, 1, 1, 1,
0.6222226, -1.070313, 2.323726, 1, 1, 1, 1, 1,
0.6244729, -0.4074804, 1.854488, 1, 1, 1, 1, 1,
0.6266789, -0.1692031, 2.166676, 1, 1, 1, 1, 1,
0.6269544, 2.515976, -0.2569471, 1, 1, 1, 1, 1,
0.6309796, -0.8944812, 0.9955844, 1, 1, 1, 1, 1,
0.6327966, -0.03489801, 4.465998, 1, 1, 1, 1, 1,
0.6345887, 0.2077344, 1.451622, 1, 1, 1, 1, 1,
0.6352468, 1.281763, 0.8590235, 0, 0, 1, 1, 1,
0.6366656, 0.4007857, -0.9091743, 1, 0, 0, 1, 1,
0.6371582, -0.1981668, 2.477997, 1, 0, 0, 1, 1,
0.642714, -0.2976292, 2.660854, 1, 0, 0, 1, 1,
0.6531302, -0.5615262, 2.030538, 1, 0, 0, 1, 1,
0.6533384, -0.9180637, 2.932726, 1, 0, 0, 1, 1,
0.6561804, 1.222596, -1.375235, 0, 0, 0, 1, 1,
0.6565229, 2.167235, 1.218133, 0, 0, 0, 1, 1,
0.663293, 0.1905027, -0.1267313, 0, 0, 0, 1, 1,
0.6638833, -0.1437443, -0.6766939, 0, 0, 0, 1, 1,
0.6702431, -0.8545245, 1.960983, 0, 0, 0, 1, 1,
0.671711, -0.05869723, 4.357966, 0, 0, 0, 1, 1,
0.6728612, -0.2695411, 4.14907, 0, 0, 0, 1, 1,
0.6740399, 1.3098, 0.6348456, 1, 1, 1, 1, 1,
0.6741259, 2.016897, 2.304085, 1, 1, 1, 1, 1,
0.6811104, 0.1840817, -0.5289167, 1, 1, 1, 1, 1,
0.6895736, -1.485102, 3.072969, 1, 1, 1, 1, 1,
0.7009429, 0.09927152, 3.191487, 1, 1, 1, 1, 1,
0.703773, -0.3413633, 2.285758, 1, 1, 1, 1, 1,
0.7040817, -0.1985271, 1.892109, 1, 1, 1, 1, 1,
0.7040936, 1.29471, 1.212785, 1, 1, 1, 1, 1,
0.7044988, -0.3712557, 1.398846, 1, 1, 1, 1, 1,
0.7169413, 0.5185273, 1.55824, 1, 1, 1, 1, 1,
0.7181186, 0.3734831, 0.8090848, 1, 1, 1, 1, 1,
0.7216871, -0.3464023, 0.9544389, 1, 1, 1, 1, 1,
0.722755, -0.387344, 2.743796, 1, 1, 1, 1, 1,
0.7290398, 0.4307345, 0.9417327, 1, 1, 1, 1, 1,
0.7316583, -0.05997498, 1.441935, 1, 1, 1, 1, 1,
0.7322662, -0.2266594, 2.70668, 0, 0, 1, 1, 1,
0.7329232, -0.2907748, 3.250977, 1, 0, 0, 1, 1,
0.7344703, -0.28827, 0.6193829, 1, 0, 0, 1, 1,
0.7351348, -0.2687388, 1.461576, 1, 0, 0, 1, 1,
0.7384526, 0.4417132, -0.1262851, 1, 0, 0, 1, 1,
0.7477306, 0.5151429, 2.64205, 1, 0, 0, 1, 1,
0.7595313, -1.958052, 2.021171, 0, 0, 0, 1, 1,
0.7600106, -0.4613451, 1.224291, 0, 0, 0, 1, 1,
0.7613974, -0.8833527, -0.1805254, 0, 0, 0, 1, 1,
0.7652556, 0.3145017, 1.75384, 0, 0, 0, 1, 1,
0.7670718, 0.4319018, 0.4557814, 0, 0, 0, 1, 1,
0.7697849, 1.593914, 0.6080804, 0, 0, 0, 1, 1,
0.7719389, 0.9230648, 1.310104, 0, 0, 0, 1, 1,
0.7761971, -1.041237, 3.658193, 1, 1, 1, 1, 1,
0.7774855, 1.118402, 1.302291, 1, 1, 1, 1, 1,
0.7799014, -0.3843771, 2.48461, 1, 1, 1, 1, 1,
0.7849361, -2.405556, 1.959612, 1, 1, 1, 1, 1,
0.7868428, -0.3794557, 1.93493, 1, 1, 1, 1, 1,
0.788176, -1.281518, 2.124774, 1, 1, 1, 1, 1,
0.7917203, 1.108804, -0.8528084, 1, 1, 1, 1, 1,
0.7921804, 0.6387648, 0.9657167, 1, 1, 1, 1, 1,
0.7935226, 0.7602713, 0.7194637, 1, 1, 1, 1, 1,
0.803231, 0.8583095, -0.4593617, 1, 1, 1, 1, 1,
0.8046447, 0.4562312, 1.300347, 1, 1, 1, 1, 1,
0.8052009, -1.926686, 1.711106, 1, 1, 1, 1, 1,
0.8116095, -1.258246, 3.178259, 1, 1, 1, 1, 1,
0.8133769, -0.6144347, 0.3950968, 1, 1, 1, 1, 1,
0.8141194, -0.6209852, 1.370853, 1, 1, 1, 1, 1,
0.8158516, -0.2108672, 0.2225551, 0, 0, 1, 1, 1,
0.8192642, 0.7072425, 0.7164007, 1, 0, 0, 1, 1,
0.8228869, -1.271569, 4.994891, 1, 0, 0, 1, 1,
0.8235553, 1.556151, 1.227484, 1, 0, 0, 1, 1,
0.8320717, 0.7701588, 1.069646, 1, 0, 0, 1, 1,
0.8325401, -0.4722113, 0.6910413, 1, 0, 0, 1, 1,
0.8346882, -0.6728833, 0.5620326, 0, 0, 0, 1, 1,
0.8350447, -0.5472618, 0.8052387, 0, 0, 0, 1, 1,
0.8376545, -1.499838, 2.702225, 0, 0, 0, 1, 1,
0.8420547, 0.3927556, 0.3799883, 0, 0, 0, 1, 1,
0.8439741, 0.607194, 0.005050407, 0, 0, 0, 1, 1,
0.8442615, 0.3821188, 1.87634, 0, 0, 0, 1, 1,
0.8556856, -0.2602195, 2.732713, 0, 0, 0, 1, 1,
0.8560798, -0.6637748, 2.453184, 1, 1, 1, 1, 1,
0.8568428, -0.6749535, 1.627583, 1, 1, 1, 1, 1,
0.8587933, 0.3911714, 1.421781, 1, 1, 1, 1, 1,
0.8593135, 0.7870951, 2.432254, 1, 1, 1, 1, 1,
0.8601807, 0.8679076, 0.05551848, 1, 1, 1, 1, 1,
0.8623638, -2.15812, 2.999223, 1, 1, 1, 1, 1,
0.8706464, 0.7469128, -0.3461083, 1, 1, 1, 1, 1,
0.8740401, 0.00393803, 0.1525276, 1, 1, 1, 1, 1,
0.8763667, 0.9510688, 0.7366989, 1, 1, 1, 1, 1,
0.8777222, 0.6242693, 1.106976, 1, 1, 1, 1, 1,
0.8787332, -0.7294032, 3.18635, 1, 1, 1, 1, 1,
0.88116, -1.243116, 4.19031, 1, 1, 1, 1, 1,
0.8825011, -0.3106608, 1.338132, 1, 1, 1, 1, 1,
0.8871377, 0.09181948, 0.8066643, 1, 1, 1, 1, 1,
0.8888275, -0.715811, 1.690926, 1, 1, 1, 1, 1,
0.8949831, 0.6866434, 1.722386, 0, 0, 1, 1, 1,
0.8979546, -0.1247973, 1.721107, 1, 0, 0, 1, 1,
0.9043537, 1.082939, 1.498837, 1, 0, 0, 1, 1,
0.909138, -0.5049813, 1.952029, 1, 0, 0, 1, 1,
0.9108133, 0.8937462, 1.049746, 1, 0, 0, 1, 1,
0.9124148, 0.6791112, -1.165219, 1, 0, 0, 1, 1,
0.9130315, -0.5007005, 4.228268, 0, 0, 0, 1, 1,
0.914826, 2.796377, 1.119871, 0, 0, 0, 1, 1,
0.9158705, 1.053851, 1.176525, 0, 0, 0, 1, 1,
0.9254629, -0.1465934, 1.242356, 0, 0, 0, 1, 1,
0.9331573, 0.3703271, 1.128505, 0, 0, 0, 1, 1,
0.9451855, 1.166358, -0.3202948, 0, 0, 0, 1, 1,
0.9474815, -1.079575, 3.088935, 0, 0, 0, 1, 1,
0.951604, 0.3675253, 1.665783, 1, 1, 1, 1, 1,
0.9531655, -0.4637321, 1.648405, 1, 1, 1, 1, 1,
0.9535258, -0.6903673, 2.508871, 1, 1, 1, 1, 1,
0.9578307, 1.524013, 2.176907, 1, 1, 1, 1, 1,
0.9662913, -1.168306, 2.752086, 1, 1, 1, 1, 1,
0.9740581, -0.4609704, 1.709154, 1, 1, 1, 1, 1,
0.9746704, -1.825651, 2.634467, 1, 1, 1, 1, 1,
0.9752488, 0.3417, 1.14686, 1, 1, 1, 1, 1,
0.9804983, -0.4152463, 1.314747, 1, 1, 1, 1, 1,
0.9822966, 0.7254902, 1.196817, 1, 1, 1, 1, 1,
0.9836224, -0.6476364, 4.402454, 1, 1, 1, 1, 1,
0.9925017, -0.3724634, 1.340778, 1, 1, 1, 1, 1,
0.9970592, 0.3169716, 1.824552, 1, 1, 1, 1, 1,
1.002882, 0.02305958, 1.280374, 1, 1, 1, 1, 1,
1.018342, -0.4727331, 1.750527, 1, 1, 1, 1, 1,
1.026605, 0.4427667, 1.193199, 0, 0, 1, 1, 1,
1.026799, -0.07682846, 0.962226, 1, 0, 0, 1, 1,
1.026923, -0.4273348, 1.022726, 1, 0, 0, 1, 1,
1.030897, 0.1949355, 1.141436, 1, 0, 0, 1, 1,
1.032392, -0.1110694, 1.309272, 1, 0, 0, 1, 1,
1.03719, 0.5065939, 2.269865, 1, 0, 0, 1, 1,
1.038679, -0.4696332, 2.752999, 0, 0, 0, 1, 1,
1.038833, -0.6372257, 1.159247, 0, 0, 0, 1, 1,
1.044317, 0.7331949, 1.217244, 0, 0, 0, 1, 1,
1.059613, -1.410258, 3.491914, 0, 0, 0, 1, 1,
1.068118, -1.749345, 2.185095, 0, 0, 0, 1, 1,
1.075758, 0.022452, 0.7744582, 0, 0, 0, 1, 1,
1.076001, -0.316032, 0.1026415, 0, 0, 0, 1, 1,
1.077515, 0.7627251, 0.1753733, 1, 1, 1, 1, 1,
1.078673, -1.996916, 3.266615, 1, 1, 1, 1, 1,
1.092012, -0.2333865, 1.709803, 1, 1, 1, 1, 1,
1.09314, 0.1165801, 1.581793, 1, 1, 1, 1, 1,
1.098494, 0.003945169, 1.694743, 1, 1, 1, 1, 1,
1.099335, 0.9471313, 0.8483238, 1, 1, 1, 1, 1,
1.103427, 0.718739, 2.396757, 1, 1, 1, 1, 1,
1.106067, -0.5537891, 2.850237, 1, 1, 1, 1, 1,
1.111424, 0.5337486, 1.889245, 1, 1, 1, 1, 1,
1.11607, 0.7576866, 1.081327, 1, 1, 1, 1, 1,
1.116463, -2.619163, 1.242709, 1, 1, 1, 1, 1,
1.120743, 0.6235652, 1.338952, 1, 1, 1, 1, 1,
1.121585, -2.230095, 1.124457, 1, 1, 1, 1, 1,
1.122582, 0.4924834, 1.751903, 1, 1, 1, 1, 1,
1.123228, 1.020544, 1.331491, 1, 1, 1, 1, 1,
1.126626, 0.3026868, 0.7877848, 0, 0, 1, 1, 1,
1.131763, 0.9909825, 1.727026, 1, 0, 0, 1, 1,
1.138561, 0.8507158, 1.934151, 1, 0, 0, 1, 1,
1.142049, -2.464788, 2.214427, 1, 0, 0, 1, 1,
1.145149, 0.1129498, 1.251074, 1, 0, 0, 1, 1,
1.157859, 1.468816, -0.036622, 1, 0, 0, 1, 1,
1.16202, 1.676997, -0.4065772, 0, 0, 0, 1, 1,
1.164469, 0.2748234, 1.521465, 0, 0, 0, 1, 1,
1.169233, 0.94167, 0.1747795, 0, 0, 0, 1, 1,
1.170712, 1.158814, -1.011114, 0, 0, 0, 1, 1,
1.174462, 0.8426729, 0.1597764, 0, 0, 0, 1, 1,
1.1768, 0.2792417, 0.6587631, 0, 0, 0, 1, 1,
1.180447, -0.7346112, 3.224797, 0, 0, 0, 1, 1,
1.186555, -1.254592, 0.3433858, 1, 1, 1, 1, 1,
1.190017, -1.333509, 2.520589, 1, 1, 1, 1, 1,
1.191371, -0.7542939, 2.303557, 1, 1, 1, 1, 1,
1.192922, 0.326075, 0.9967586, 1, 1, 1, 1, 1,
1.19857, 0.8890311, 1.098086, 1, 1, 1, 1, 1,
1.204836, -0.534295, 1.754516, 1, 1, 1, 1, 1,
1.209895, 0.6209375, 1.527453, 1, 1, 1, 1, 1,
1.214286, 1.610751, 0.6036699, 1, 1, 1, 1, 1,
1.216681, 2.224326, -0.9108556, 1, 1, 1, 1, 1,
1.217916, 1.005193, 1.166256, 1, 1, 1, 1, 1,
1.225355, -0.1567361, 1.905278, 1, 1, 1, 1, 1,
1.227206, 0.7541822, -0.0591423, 1, 1, 1, 1, 1,
1.227626, 0.8957484, -0.6811976, 1, 1, 1, 1, 1,
1.228588, 0.6697828, 1.419646, 1, 1, 1, 1, 1,
1.23174, 1.081483, 2.067304, 1, 1, 1, 1, 1,
1.235917, 0.4632417, 2.19324, 0, 0, 1, 1, 1,
1.242409, -1.62083, 2.81641, 1, 0, 0, 1, 1,
1.246817, 1.251462, 0.5892951, 1, 0, 0, 1, 1,
1.248881, -1.277197, 3.050622, 1, 0, 0, 1, 1,
1.276179, 1.104727, 1.518412, 1, 0, 0, 1, 1,
1.284068, 0.4483165, 1.804822, 1, 0, 0, 1, 1,
1.284636, -0.5407287, 1.689075, 0, 0, 0, 1, 1,
1.290341, -1.867323, 1.415563, 0, 0, 0, 1, 1,
1.300742, 2.062061, 1.713692, 0, 0, 0, 1, 1,
1.309369, 1.76421, 0.3242071, 0, 0, 0, 1, 1,
1.313556, -0.308425, 0.8375338, 0, 0, 0, 1, 1,
1.31786, -0.5450026, 2.045238, 0, 0, 0, 1, 1,
1.32106, -0.1931043, 2.696524, 0, 0, 0, 1, 1,
1.327648, 0.1412383, 1.965608, 1, 1, 1, 1, 1,
1.328278, -0.1400693, 1.079433, 1, 1, 1, 1, 1,
1.337813, -0.1754397, 0.8356711, 1, 1, 1, 1, 1,
1.338629, 0.8866054, -0.2827574, 1, 1, 1, 1, 1,
1.340289, 0.00385681, 2.297196, 1, 1, 1, 1, 1,
1.3476, -0.6225564, 1.494596, 1, 1, 1, 1, 1,
1.347968, 1.433003, -1.853388, 1, 1, 1, 1, 1,
1.353085, 0.5500516, 3.183161, 1, 1, 1, 1, 1,
1.357192, 0.4825048, 3.243726, 1, 1, 1, 1, 1,
1.365558, -0.2723922, 0.2832181, 1, 1, 1, 1, 1,
1.372182, -0.3365328, 1.726077, 1, 1, 1, 1, 1,
1.384356, 1.610803, 0.6176409, 1, 1, 1, 1, 1,
1.400246, -0.2366731, 0.846126, 1, 1, 1, 1, 1,
1.408065, 0.6520159, 0.8892931, 1, 1, 1, 1, 1,
1.413823, 0.1346525, 0.6821183, 1, 1, 1, 1, 1,
1.427835, 1.357945, -0.4244276, 0, 0, 1, 1, 1,
1.437066, 0.1611355, 2.301479, 1, 0, 0, 1, 1,
1.440521, 0.193784, 1.00188, 1, 0, 0, 1, 1,
1.454666, -1.326584, 4.735445, 1, 0, 0, 1, 1,
1.454905, -1.262756, 2.414212, 1, 0, 0, 1, 1,
1.467633, -0.2925064, 0.9310595, 1, 0, 0, 1, 1,
1.473728, -0.2203678, 2.425394, 0, 0, 0, 1, 1,
1.486493, 1.538122, 2.236271, 0, 0, 0, 1, 1,
1.489937, 1.393762, 2.434672, 0, 0, 0, 1, 1,
1.491197, 0.2575457, 3.267052, 0, 0, 0, 1, 1,
1.49571, 0.1423242, 0.1569623, 0, 0, 0, 1, 1,
1.500118, 1.625324, -0.2358518, 0, 0, 0, 1, 1,
1.507504, 0.522005, 0.3388911, 0, 0, 0, 1, 1,
1.515497, 1.363768, -0.5429205, 1, 1, 1, 1, 1,
1.519202, -0.8250606, 2.752337, 1, 1, 1, 1, 1,
1.527921, -0.4772162, 1.004661, 1, 1, 1, 1, 1,
1.530668, 0.2027092, 1.422041, 1, 1, 1, 1, 1,
1.541633, -0.7954285, 2.415352, 1, 1, 1, 1, 1,
1.541784, 2.00711, -0.8676505, 1, 1, 1, 1, 1,
1.547196, -1.815424, 4.168152, 1, 1, 1, 1, 1,
1.550857, -1.722038, 1.637186, 1, 1, 1, 1, 1,
1.555053, 0.7301099, 1.868024, 1, 1, 1, 1, 1,
1.574172, 0.04995674, 3.269221, 1, 1, 1, 1, 1,
1.576045, 1.381745, 3.092446, 1, 1, 1, 1, 1,
1.581777, 0.7476292, 0.5645781, 1, 1, 1, 1, 1,
1.584566, -1.727616, 1.89715, 1, 1, 1, 1, 1,
1.592947, 0.09671423, 1.396408, 1, 1, 1, 1, 1,
1.596146, 0.7193841, 1.698821, 1, 1, 1, 1, 1,
1.609994, 1.677897, 0.9914821, 0, 0, 1, 1, 1,
1.616749, -0.9226457, 4.027055, 1, 0, 0, 1, 1,
1.634057, 0.4451924, 0.9029022, 1, 0, 0, 1, 1,
1.671216, 0.2994605, 2.697325, 1, 0, 0, 1, 1,
1.685835, -0.3516828, 1.621932, 1, 0, 0, 1, 1,
1.701123, -1.433026, 2.316654, 1, 0, 0, 1, 1,
1.710593, 0.22588, 1.85935, 0, 0, 0, 1, 1,
1.717855, -1.588309, 1.84251, 0, 0, 0, 1, 1,
1.746979, 2.156313, 2.302341, 0, 0, 0, 1, 1,
1.788265, -2.114854, 1.817252, 0, 0, 0, 1, 1,
1.80638, -2.315591, 2.879388, 0, 0, 0, 1, 1,
1.810091, 0.9240656, 1.456747, 0, 0, 0, 1, 1,
1.810928, 0.1386161, 0.3332871, 0, 0, 0, 1, 1,
1.811807, -0.7500847, 1.593704, 1, 1, 1, 1, 1,
1.832962, 0.6127405, 0.8961031, 1, 1, 1, 1, 1,
1.845351, -1.36583, 2.11147, 1, 1, 1, 1, 1,
1.852054, -0.6635078, 0.05640683, 1, 1, 1, 1, 1,
1.855691, -1.419302, 2.484217, 1, 1, 1, 1, 1,
1.877943, 0.8957496, 1.584253, 1, 1, 1, 1, 1,
1.889007, -0.2113431, 0.8862596, 1, 1, 1, 1, 1,
1.889124, 0.6283394, 0.11271, 1, 1, 1, 1, 1,
1.902955, -0.4633988, 1.396065, 1, 1, 1, 1, 1,
1.912481, 0.3986021, 1.223334, 1, 1, 1, 1, 1,
1.920168, -0.1146936, 2.989515, 1, 1, 1, 1, 1,
1.939258, 1.222615, 1.652537, 1, 1, 1, 1, 1,
1.948453, -1.124258, 1.838644, 1, 1, 1, 1, 1,
1.952384, 1.090142, 0.5037969, 1, 1, 1, 1, 1,
1.981331, 0.4935656, 1.669238, 1, 1, 1, 1, 1,
2.003312, 2.14112, 0.6628144, 0, 0, 1, 1, 1,
2.006065, 0.06715004, 0.5544393, 1, 0, 0, 1, 1,
2.037076, 3.665871, -1.611183, 1, 0, 0, 1, 1,
2.064125, -0.04398598, 2.385973, 1, 0, 0, 1, 1,
2.065104, -1.006326, 2.148466, 1, 0, 0, 1, 1,
2.132858, -1.429365, 3.194762, 1, 0, 0, 1, 1,
2.193403, -0.09334441, 1.891285, 0, 0, 0, 1, 1,
2.203673, 0.203541, 1.765934, 0, 0, 0, 1, 1,
2.237995, 0.6714665, 1.790451, 0, 0, 0, 1, 1,
2.333715, 0.6183879, 1.630017, 0, 0, 0, 1, 1,
2.425336, -1.905425, 2.480716, 0, 0, 0, 1, 1,
2.444395, -0.94235, 1.215494, 0, 0, 0, 1, 1,
2.454326, -1.065006, 0.6663888, 0, 0, 0, 1, 1,
2.558388, 0.2864597, 0.8376251, 1, 1, 1, 1, 1,
2.717619, 1.260482, 1.780892, 1, 1, 1, 1, 1,
2.764874, 0.3764563, 1.105346, 1, 1, 1, 1, 1,
2.871198, -1.482493, 1.298153, 1, 1, 1, 1, 1,
2.973911, -0.8559733, 0.4094783, 1, 1, 1, 1, 1,
2.978131, 0.05984185, 1.510407, 1, 1, 1, 1, 1,
3.498029, -0.906711, 3.177307, 1, 1, 1, 1, 1
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
var radius = 10.19702;
var distance = 35.81661;
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
mvMatrix.translate( 0.3997293, -0.4741071, -0.3632011 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.81661);
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
