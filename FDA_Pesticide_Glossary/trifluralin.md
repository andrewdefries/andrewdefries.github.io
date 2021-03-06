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
-3.216061, -0.9114721, -3.127218, 1, 0, 0, 1,
-2.600776, -1.019748, -1.562423, 1, 0.007843138, 0, 1,
-2.528097, 0.3775073, -2.080755, 1, 0.01176471, 0, 1,
-2.501437, -2.224519, -3.140841, 1, 0.01960784, 0, 1,
-2.49833, 1.785334, -1.10246, 1, 0.02352941, 0, 1,
-2.446357, 0.9050702, -2.84632, 1, 0.03137255, 0, 1,
-2.439442, 1.425714, -0.8801067, 1, 0.03529412, 0, 1,
-2.413728, -1.157349, -2.300203, 1, 0.04313726, 0, 1,
-2.388944, 1.228393, -1.593129, 1, 0.04705882, 0, 1,
-2.329948, -0.1307829, -2.18738, 1, 0.05490196, 0, 1,
-2.304724, 1.271353, -2.034736, 1, 0.05882353, 0, 1,
-2.262995, 1.376552, -1.7992, 1, 0.06666667, 0, 1,
-2.253628, 1.051072, -0.6146775, 1, 0.07058824, 0, 1,
-2.237692, -0.2709254, -3.118436, 1, 0.07843138, 0, 1,
-2.157368, 1.576076, 0.03998737, 1, 0.08235294, 0, 1,
-2.110146, 0.7547477, -2.20198, 1, 0.09019608, 0, 1,
-2.106427, -0.7356957, -3.241958, 1, 0.09411765, 0, 1,
-2.102732, -1.139687, 0.6220627, 1, 0.1019608, 0, 1,
-2.032942, -0.05039981, -2.018142, 1, 0.1098039, 0, 1,
-2.016137, -1.618926, -4.807341, 1, 0.1137255, 0, 1,
-2.013591, 1.638872, -0.738297, 1, 0.1215686, 0, 1,
-1.962975, 1.332078, -0.01431662, 1, 0.1254902, 0, 1,
-1.949564, -0.4765075, -2.658202, 1, 0.1333333, 0, 1,
-1.947497, 0.3284937, -0.786813, 1, 0.1372549, 0, 1,
-1.925475, -0.05965282, -1.308612, 1, 0.145098, 0, 1,
-1.920575, 0.9739929, -2.065286, 1, 0.1490196, 0, 1,
-1.917014, 1.004362, -1.216937, 1, 0.1568628, 0, 1,
-1.885888, -1.5103, -1.560426, 1, 0.1607843, 0, 1,
-1.864164, 0.5456709, -2.46213, 1, 0.1686275, 0, 1,
-1.846136, 1.081881, -1.667381, 1, 0.172549, 0, 1,
-1.838088, 1.140035, -1.024066, 1, 0.1803922, 0, 1,
-1.830318, -0.3148484, -2.067721, 1, 0.1843137, 0, 1,
-1.811149, 1.318965, -1.050307, 1, 0.1921569, 0, 1,
-1.792618, -0.8647735, -1.187376, 1, 0.1960784, 0, 1,
-1.778338, 1.296734, -1.137267, 1, 0.2039216, 0, 1,
-1.775318, -1.197688, -3.463631, 1, 0.2117647, 0, 1,
-1.770766, 0.5878539, -2.86653, 1, 0.2156863, 0, 1,
-1.768549, 0.05113575, -0.8551511, 1, 0.2235294, 0, 1,
-1.767936, -0.2351168, -1.754273, 1, 0.227451, 0, 1,
-1.765362, 0.954001, -1.518371, 1, 0.2352941, 0, 1,
-1.745056, 1.818863, -0.8389582, 1, 0.2392157, 0, 1,
-1.727055, -0.7673194, -1.766691, 1, 0.2470588, 0, 1,
-1.716271, -0.3542221, -1.771796, 1, 0.2509804, 0, 1,
-1.70985, 0.8561231, -0.9678337, 1, 0.2588235, 0, 1,
-1.704437, 0.2034501, -2.235423, 1, 0.2627451, 0, 1,
-1.683076, 1.104593, 0.04969667, 1, 0.2705882, 0, 1,
-1.670759, 0.3480301, -0.6254457, 1, 0.2745098, 0, 1,
-1.667206, -0.9495071, -2.173389, 1, 0.282353, 0, 1,
-1.648854, 0.8837282, -1.463349, 1, 0.2862745, 0, 1,
-1.644733, 0.9059394, -0.7818645, 1, 0.2941177, 0, 1,
-1.640607, 1.416424, -0.268395, 1, 0.3019608, 0, 1,
-1.635895, 1.392386, -1.232149, 1, 0.3058824, 0, 1,
-1.627703, 0.5929049, -3.669321, 1, 0.3137255, 0, 1,
-1.613676, -0.6363191, -0.9808744, 1, 0.3176471, 0, 1,
-1.605798, -0.6978593, -1.434167, 1, 0.3254902, 0, 1,
-1.588434, -0.6297997, -1.275882, 1, 0.3294118, 0, 1,
-1.564114, -0.7134247, -1.598586, 1, 0.3372549, 0, 1,
-1.55936, -0.3210575, -3.820344, 1, 0.3411765, 0, 1,
-1.538781, 2.501555, -1.05641, 1, 0.3490196, 0, 1,
-1.538229, -0.1941388, -3.72241, 1, 0.3529412, 0, 1,
-1.537087, -1.74204, -1.001421, 1, 0.3607843, 0, 1,
-1.535167, -2.985998, -2.117288, 1, 0.3647059, 0, 1,
-1.533199, -0.1861332, -3.228378, 1, 0.372549, 0, 1,
-1.520482, 1.737262, -3.116416, 1, 0.3764706, 0, 1,
-1.519324, 1.242138, -0.6809196, 1, 0.3843137, 0, 1,
-1.514742, 0.9188836, 0.7517424, 1, 0.3882353, 0, 1,
-1.51432, 1.589441, -1.024929, 1, 0.3960784, 0, 1,
-1.508318, -0.1479712, -2.276162, 1, 0.4039216, 0, 1,
-1.502554, -2.007, -3.018595, 1, 0.4078431, 0, 1,
-1.501597, 0.6179663, -1.810424, 1, 0.4156863, 0, 1,
-1.494515, -1.123143, -1.67523, 1, 0.4196078, 0, 1,
-1.492528, -1.334422, -3.429111, 1, 0.427451, 0, 1,
-1.487216, 0.06032259, -0.8798993, 1, 0.4313726, 0, 1,
-1.469561, -0.2739725, -3.419814, 1, 0.4392157, 0, 1,
-1.46251, 1.196286, -0.02938114, 1, 0.4431373, 0, 1,
-1.45894, 2.860181, -1.637403, 1, 0.4509804, 0, 1,
-1.441575, 0.5165015, -2.295632, 1, 0.454902, 0, 1,
-1.438305, -0.6837765, -3.097257, 1, 0.4627451, 0, 1,
-1.436762, -0.9636793, -1.995241, 1, 0.4666667, 0, 1,
-1.433576, 0.5399876, 0.2171724, 1, 0.4745098, 0, 1,
-1.421742, -1.076797, -1.622411, 1, 0.4784314, 0, 1,
-1.418824, -0.07406209, -1.748041, 1, 0.4862745, 0, 1,
-1.416156, 1.476427, 0.05903397, 1, 0.4901961, 0, 1,
-1.407907, -1.819078, -1.983703, 1, 0.4980392, 0, 1,
-1.394137, 0.6851818, -0.2919099, 1, 0.5058824, 0, 1,
-1.38661, 0.1739726, -2.448666, 1, 0.509804, 0, 1,
-1.384275, 0.3079364, -1.653618, 1, 0.5176471, 0, 1,
-1.37903, -0.1647014, -1.831414, 1, 0.5215687, 0, 1,
-1.375601, 0.2777148, -2.438196, 1, 0.5294118, 0, 1,
-1.375461, 1.08654, -1.537347, 1, 0.5333334, 0, 1,
-1.373794, 0.7879537, -2.620552, 1, 0.5411765, 0, 1,
-1.369652, 0.06677455, -0.289588, 1, 0.5450981, 0, 1,
-1.353181, 1.268222, 0.7155871, 1, 0.5529412, 0, 1,
-1.34846, 0.747439, 0.01193195, 1, 0.5568628, 0, 1,
-1.343118, 0.1363937, -2.509177, 1, 0.5647059, 0, 1,
-1.339496, -0.5720574, -2.245802, 1, 0.5686275, 0, 1,
-1.31449, 2.08417, 0.4702917, 1, 0.5764706, 0, 1,
-1.305184, -0.04311644, -1.869234, 1, 0.5803922, 0, 1,
-1.295255, -0.9922043, -0.5890408, 1, 0.5882353, 0, 1,
-1.287365, -0.1285393, -2.740594, 1, 0.5921569, 0, 1,
-1.282163, -0.8580959, -2.771806, 1, 0.6, 0, 1,
-1.275243, -0.3209552, -3.626618, 1, 0.6078432, 0, 1,
-1.27256, 0.7056702, -1.00422, 1, 0.6117647, 0, 1,
-1.269587, 1.050239, -0.6566588, 1, 0.6196079, 0, 1,
-1.25964, -0.008116079, -1.603835, 1, 0.6235294, 0, 1,
-1.24666, -0.9752761, -3.754299, 1, 0.6313726, 0, 1,
-1.245658, -0.3608153, -1.751459, 1, 0.6352941, 0, 1,
-1.241159, -0.1332328, -0.1943228, 1, 0.6431373, 0, 1,
-1.234718, -0.429241, -2.601873, 1, 0.6470588, 0, 1,
-1.224219, -0.6482545, -2.082325, 1, 0.654902, 0, 1,
-1.213703, 2.420323, 0.4159735, 1, 0.6588235, 0, 1,
-1.207581, -1.784758, -4.125988, 1, 0.6666667, 0, 1,
-1.202563, 0.7386434, -1.47328, 1, 0.6705883, 0, 1,
-1.201201, -0.5708091, -2.498423, 1, 0.6784314, 0, 1,
-1.19579, 1.419363, -0.2000787, 1, 0.682353, 0, 1,
-1.191959, 0.5357144, -0.9666324, 1, 0.6901961, 0, 1,
-1.189656, 0.9847808, 0.5792495, 1, 0.6941177, 0, 1,
-1.174846, -1.076515, -0.8083653, 1, 0.7019608, 0, 1,
-1.170551, -0.5070836, -2.275282, 1, 0.7098039, 0, 1,
-1.168864, 0.9592027, -2.305865, 1, 0.7137255, 0, 1,
-1.160779, 0.5920835, -0.1866845, 1, 0.7215686, 0, 1,
-1.155523, -0.7241855, -1.089096, 1, 0.7254902, 0, 1,
-1.153763, 0.2648846, -3.127331, 1, 0.7333333, 0, 1,
-1.152408, 1.388051, -0.9861692, 1, 0.7372549, 0, 1,
-1.149639, 0.1902092, -1.435204, 1, 0.7450981, 0, 1,
-1.14604, 2.01589, -0.9325534, 1, 0.7490196, 0, 1,
-1.142919, 0.7518138, -0.7928599, 1, 0.7568628, 0, 1,
-1.140503, -0.6252354, -0.7891977, 1, 0.7607843, 0, 1,
-1.11871, -0.1835667, -2.646367, 1, 0.7686275, 0, 1,
-1.116984, 0.03301229, -1.309657, 1, 0.772549, 0, 1,
-1.109059, -0.3557974, -1.639104, 1, 0.7803922, 0, 1,
-1.106975, -0.1968616, -0.1636138, 1, 0.7843137, 0, 1,
-1.106712, 0.1189589, -3.184929, 1, 0.7921569, 0, 1,
-1.106324, -0.3535306, -1.335854, 1, 0.7960784, 0, 1,
-1.103553, -1.624107, -1.911687, 1, 0.8039216, 0, 1,
-1.102952, -0.1959758, -1.349743, 1, 0.8117647, 0, 1,
-1.10258, 1.321538, -0.4004852, 1, 0.8156863, 0, 1,
-1.101399, -1.704418, -2.836968, 1, 0.8235294, 0, 1,
-1.099461, 0.7862219, -2.337187, 1, 0.827451, 0, 1,
-1.097971, -0.5642834, -1.019941, 1, 0.8352941, 0, 1,
-1.096894, -0.8367702, -2.50414, 1, 0.8392157, 0, 1,
-1.082684, -0.384775, -0.9777355, 1, 0.8470588, 0, 1,
-1.081605, 0.1461288, -0.4610075, 1, 0.8509804, 0, 1,
-1.080297, -0.815899, -3.259871, 1, 0.8588235, 0, 1,
-1.079749, -1.409467, -3.089308, 1, 0.8627451, 0, 1,
-1.067403, -0.7654899, -0.8695498, 1, 0.8705882, 0, 1,
-1.066374, -1.005471, -2.861919, 1, 0.8745098, 0, 1,
-1.064305, -1.983465, -2.886364, 1, 0.8823529, 0, 1,
-1.056082, -2.083786, -0.2710617, 1, 0.8862745, 0, 1,
-1.055412, 1.895042, 0.2091481, 1, 0.8941177, 0, 1,
-1.049359, 0.7086844, -1.542252, 1, 0.8980392, 0, 1,
-1.046107, -1.844628, -2.688582, 1, 0.9058824, 0, 1,
-1.03995, 0.6906797, -1.18066, 1, 0.9137255, 0, 1,
-1.02562, -1.855309, -3.329839, 1, 0.9176471, 0, 1,
-1.021649, -1.496495, -0.9364903, 1, 0.9254902, 0, 1,
-1.020993, 0.9503166, -1.659379, 1, 0.9294118, 0, 1,
-1.019357, 0.729022, -1.990181, 1, 0.9372549, 0, 1,
-1.008778, 2.540292, 0.7439119, 1, 0.9411765, 0, 1,
-1.002928, -0.2277415, -3.350561, 1, 0.9490196, 0, 1,
-0.9969929, -0.292061, -2.89089, 1, 0.9529412, 0, 1,
-0.9911945, -0.1125073, -0.2536052, 1, 0.9607843, 0, 1,
-0.9877662, 0.7483951, -1.985867, 1, 0.9647059, 0, 1,
-0.9861756, 0.3723895, -0.6336311, 1, 0.972549, 0, 1,
-0.985917, -0.08835337, -1.657779, 1, 0.9764706, 0, 1,
-0.9839517, -0.364706, -1.528837, 1, 0.9843137, 0, 1,
-0.9768142, -1.680897, -1.442436, 1, 0.9882353, 0, 1,
-0.9700174, 0.05893321, -0.8085417, 1, 0.9960784, 0, 1,
-0.9636728, 0.6832056, -0.8145646, 0.9960784, 1, 0, 1,
-0.9580072, -2.367154, -1.815303, 0.9921569, 1, 0, 1,
-0.9460351, 1.015023, -0.1531278, 0.9843137, 1, 0, 1,
-0.9320668, -0.3810543, -2.486409, 0.9803922, 1, 0, 1,
-0.9115143, 0.2930294, -2.022617, 0.972549, 1, 0, 1,
-0.9111389, 1.123281, -0.34635, 0.9686275, 1, 0, 1,
-0.910448, 0.1968082, -1.272319, 0.9607843, 1, 0, 1,
-0.8995619, 2.023363, -0.6433877, 0.9568627, 1, 0, 1,
-0.8921109, 1.420239, -2.397313, 0.9490196, 1, 0, 1,
-0.8919458, 1.487589, -1.558663, 0.945098, 1, 0, 1,
-0.8900709, -1.737396, -2.069323, 0.9372549, 1, 0, 1,
-0.8892997, 0.5082293, -0.4168835, 0.9333333, 1, 0, 1,
-0.8736917, -1.521028, -3.741082, 0.9254902, 1, 0, 1,
-0.8690891, 1.440014, -0.9521785, 0.9215686, 1, 0, 1,
-0.8671395, 0.04658682, -0.7204474, 0.9137255, 1, 0, 1,
-0.8656161, -0.2405165, -3.514035, 0.9098039, 1, 0, 1,
-0.854485, 0.7354037, -0.1524319, 0.9019608, 1, 0, 1,
-0.852012, -0.73423, -3.000597, 0.8941177, 1, 0, 1,
-0.8516977, -0.1486017, -0.7937037, 0.8901961, 1, 0, 1,
-0.8514043, -1.661422, -2.48674, 0.8823529, 1, 0, 1,
-0.850441, 0.08859538, -2.570701, 0.8784314, 1, 0, 1,
-0.8466425, 0.0903564, -1.166634, 0.8705882, 1, 0, 1,
-0.8396234, 0.9303252, -0.1032782, 0.8666667, 1, 0, 1,
-0.8395501, 0.150714, -0.8391989, 0.8588235, 1, 0, 1,
-0.8395422, 1.732973, -0.639132, 0.854902, 1, 0, 1,
-0.8333881, 0.4565004, -0.214396, 0.8470588, 1, 0, 1,
-0.8326476, 1.687166, -0.9322498, 0.8431373, 1, 0, 1,
-0.8324795, -0.9898098, -2.645217, 0.8352941, 1, 0, 1,
-0.8272884, -1.649076, -4.286541, 0.8313726, 1, 0, 1,
-0.8227509, -0.5419871, -0.1355811, 0.8235294, 1, 0, 1,
-0.821388, 0.4137343, -1.559789, 0.8196079, 1, 0, 1,
-0.8208823, -0.8040343, -2.421964, 0.8117647, 1, 0, 1,
-0.8167389, 0.1237693, -1.244531, 0.8078431, 1, 0, 1,
-0.815658, -0.5447022, -1.676664, 0.8, 1, 0, 1,
-0.8084726, -0.5155202, -4.565213, 0.7921569, 1, 0, 1,
-0.8078774, 0.2752406, -0.8220018, 0.7882353, 1, 0, 1,
-0.8045042, -0.08126601, -1.767799, 0.7803922, 1, 0, 1,
-0.7948068, -0.4450822, -2.467007, 0.7764706, 1, 0, 1,
-0.7930226, -1.322462, -2.695633, 0.7686275, 1, 0, 1,
-0.7928388, -1.068871, -1.960717, 0.7647059, 1, 0, 1,
-0.7922119, -0.2780083, -2.364473, 0.7568628, 1, 0, 1,
-0.7880923, -0.6932729, -1.866489, 0.7529412, 1, 0, 1,
-0.7877769, 1.639413, -0.4581124, 0.7450981, 1, 0, 1,
-0.779807, 0.589845, -2.021391, 0.7411765, 1, 0, 1,
-0.7572147, -0.9017937, -2.094982, 0.7333333, 1, 0, 1,
-0.7521289, 0.01681392, -0.780203, 0.7294118, 1, 0, 1,
-0.7491691, -0.1451198, -3.173615, 0.7215686, 1, 0, 1,
-0.7451199, -0.006601885, -0.2544737, 0.7176471, 1, 0, 1,
-0.7437416, -1.191311, -1.960494, 0.7098039, 1, 0, 1,
-0.7429879, 1.476709, 0.2833863, 0.7058824, 1, 0, 1,
-0.7417285, -0.4615697, -1.057485, 0.6980392, 1, 0, 1,
-0.7405939, 0.1890026, -0.2492496, 0.6901961, 1, 0, 1,
-0.7379832, -0.8102957, -3.207837, 0.6862745, 1, 0, 1,
-0.7372488, -1.073636, -2.748864, 0.6784314, 1, 0, 1,
-0.7343723, -1.328967, -2.17451, 0.6745098, 1, 0, 1,
-0.7334858, 0.5923822, 1.018269, 0.6666667, 1, 0, 1,
-0.7258999, -0.03067964, 0.9162473, 0.6627451, 1, 0, 1,
-0.7213487, 0.1586717, -0.954518, 0.654902, 1, 0, 1,
-0.7183834, -0.4965499, -1.717156, 0.6509804, 1, 0, 1,
-0.7154504, 0.8041095, -0.5432326, 0.6431373, 1, 0, 1,
-0.7136481, 0.8106959, -0.6078299, 0.6392157, 1, 0, 1,
-0.711394, 0.2280186, -1.623725, 0.6313726, 1, 0, 1,
-0.7092232, 1.140654, -0.2723598, 0.627451, 1, 0, 1,
-0.7075052, 0.2740765, -1.977755, 0.6196079, 1, 0, 1,
-0.7001776, 0.04805667, -0.5531989, 0.6156863, 1, 0, 1,
-0.6997369, -0.07681603, -1.62205, 0.6078432, 1, 0, 1,
-0.6977875, -0.4252937, -2.379379, 0.6039216, 1, 0, 1,
-0.6971529, 3.079221, 1.823775, 0.5960785, 1, 0, 1,
-0.6944945, 0.1301281, -0.2108919, 0.5882353, 1, 0, 1,
-0.6840143, -0.5822996, -4.230646, 0.5843138, 1, 0, 1,
-0.6813955, -0.3158302, -2.48998, 0.5764706, 1, 0, 1,
-0.6783478, 0.1630557, -0.968631, 0.572549, 1, 0, 1,
-0.6780205, -1.020837, -3.389895, 0.5647059, 1, 0, 1,
-0.6733168, -0.5724729, -3.844435, 0.5607843, 1, 0, 1,
-0.6730788, -2.013624, -2.331999, 0.5529412, 1, 0, 1,
-0.6702929, 1.680126, 0.09795476, 0.5490196, 1, 0, 1,
-0.669719, -0.7993453, -2.853315, 0.5411765, 1, 0, 1,
-0.6694558, 2.513797, 0.6428832, 0.5372549, 1, 0, 1,
-0.6636326, 0.9645329, -1.629584, 0.5294118, 1, 0, 1,
-0.6607779, 0.2750125, -2.187138, 0.5254902, 1, 0, 1,
-0.6597149, -0.8126912, -2.090992, 0.5176471, 1, 0, 1,
-0.6534688, 0.4579034, -1.615126, 0.5137255, 1, 0, 1,
-0.6485646, -1.77913, -3.783668, 0.5058824, 1, 0, 1,
-0.646404, -0.5679499, -2.877587, 0.5019608, 1, 0, 1,
-0.646099, 0.8317478, -2.066868, 0.4941176, 1, 0, 1,
-0.6449475, 1.167301, -0.9012874, 0.4862745, 1, 0, 1,
-0.6447539, 0.5535836, 0.7736784, 0.4823529, 1, 0, 1,
-0.6358865, -0.5589995, -1.279607, 0.4745098, 1, 0, 1,
-0.6338238, 0.3710862, -1.929882, 0.4705882, 1, 0, 1,
-0.6319321, -0.4228958, -1.279934, 0.4627451, 1, 0, 1,
-0.6315584, 0.7306357, -2.632591, 0.4588235, 1, 0, 1,
-0.6265148, 0.8360332, -1.468506, 0.4509804, 1, 0, 1,
-0.6176468, -0.4746692, -2.473908, 0.4470588, 1, 0, 1,
-0.6059235, 2.135458, -0.3516743, 0.4392157, 1, 0, 1,
-0.6052572, 1.092241, -2.27751, 0.4352941, 1, 0, 1,
-0.6047848, -1.043972, -4.872659, 0.427451, 1, 0, 1,
-0.5993496, -1.135562, -1.654039, 0.4235294, 1, 0, 1,
-0.598676, 1.115984, -1.749487, 0.4156863, 1, 0, 1,
-0.5949942, 1.05637, 1.692114, 0.4117647, 1, 0, 1,
-0.59184, 0.144014, -1.131414, 0.4039216, 1, 0, 1,
-0.5860726, -0.4321986, -2.680827, 0.3960784, 1, 0, 1,
-0.5842167, -0.8167273, -0.9566068, 0.3921569, 1, 0, 1,
-0.5828287, 0.3223779, -0.521304, 0.3843137, 1, 0, 1,
-0.5813314, 0.5301494, -1.35162, 0.3803922, 1, 0, 1,
-0.5760413, 0.1801797, -1.490445, 0.372549, 1, 0, 1,
-0.5754058, -0.580625, -3.433279, 0.3686275, 1, 0, 1,
-0.5675203, 0.5592897, -0.7232355, 0.3607843, 1, 0, 1,
-0.5599222, 3.146621, 1.208488, 0.3568628, 1, 0, 1,
-0.5587714, 0.7882997, -0.1956482, 0.3490196, 1, 0, 1,
-0.5571226, 0.3886116, -1.568094, 0.345098, 1, 0, 1,
-0.5505447, 1.010988, 0.1331819, 0.3372549, 1, 0, 1,
-0.5493327, -1.490183, -2.310694, 0.3333333, 1, 0, 1,
-0.5457219, 0.9269912, -1.91138, 0.3254902, 1, 0, 1,
-0.5448739, -1.463466, -2.359384, 0.3215686, 1, 0, 1,
-0.5430099, -0.7891095, -1.922254, 0.3137255, 1, 0, 1,
-0.5416055, 0.3091805, 0.05688611, 0.3098039, 1, 0, 1,
-0.5416005, -1.288065, -4.276594, 0.3019608, 1, 0, 1,
-0.5302761, -2.105773, -2.543575, 0.2941177, 1, 0, 1,
-0.5262493, -0.9017496, -2.698422, 0.2901961, 1, 0, 1,
-0.5206402, -0.3184133, -3.36014, 0.282353, 1, 0, 1,
-0.5190826, 0.2949938, 0.06014417, 0.2784314, 1, 0, 1,
-0.5156551, -2.504696, -2.689208, 0.2705882, 1, 0, 1,
-0.512877, -0.1175916, -3.993971, 0.2666667, 1, 0, 1,
-0.5122129, -0.248169, -2.64747, 0.2588235, 1, 0, 1,
-0.5121127, -0.03931995, -1.141772, 0.254902, 1, 0, 1,
-0.5111103, 1.028737, 0.0433588, 0.2470588, 1, 0, 1,
-0.5043607, 1.660783, -0.001128345, 0.2431373, 1, 0, 1,
-0.4983062, 0.6301375, -0.6183797, 0.2352941, 1, 0, 1,
-0.4956812, -0.03682932, 0.5190996, 0.2313726, 1, 0, 1,
-0.495293, 0.7437403, 0.3007266, 0.2235294, 1, 0, 1,
-0.4916631, 0.4367369, -1.349793, 0.2196078, 1, 0, 1,
-0.4897739, -0.6764836, -1.765825, 0.2117647, 1, 0, 1,
-0.4864227, -0.327285, -2.305666, 0.2078431, 1, 0, 1,
-0.4805888, 1.393822, -1.287591, 0.2, 1, 0, 1,
-0.4787926, -1.568392, -2.533641, 0.1921569, 1, 0, 1,
-0.4749194, 0.9924735, 0.5395911, 0.1882353, 1, 0, 1,
-0.4690887, -0.1185542, -3.010072, 0.1803922, 1, 0, 1,
-0.465529, -1.241664, -2.250263, 0.1764706, 1, 0, 1,
-0.4617797, 0.3836462, 0.5539632, 0.1686275, 1, 0, 1,
-0.4602534, 1.213501, -1.208842, 0.1647059, 1, 0, 1,
-0.458548, -0.02816392, -2.650592, 0.1568628, 1, 0, 1,
-0.4569801, 0.2865129, -0.321808, 0.1529412, 1, 0, 1,
-0.4511622, 0.04684283, -1.399052, 0.145098, 1, 0, 1,
-0.4506539, 0.4519018, -1.267676, 0.1411765, 1, 0, 1,
-0.4501889, 0.6056146, 0.2657928, 0.1333333, 1, 0, 1,
-0.4493988, -0.02990557, -3.519881, 0.1294118, 1, 0, 1,
-0.4467, 1.1269, -2.057056, 0.1215686, 1, 0, 1,
-0.444844, -0.2126105, -2.761108, 0.1176471, 1, 0, 1,
-0.4445316, -0.7853878, -2.939068, 0.1098039, 1, 0, 1,
-0.4419034, -0.3369995, -2.439548, 0.1058824, 1, 0, 1,
-0.4395838, -0.1477571, -2.159276, 0.09803922, 1, 0, 1,
-0.4362763, 1.436071, -0.6239554, 0.09019608, 1, 0, 1,
-0.4230921, 1.052811, -0.4990809, 0.08627451, 1, 0, 1,
-0.4218858, -1.090823, -3.748126, 0.07843138, 1, 0, 1,
-0.4176549, 0.01286581, -1.906238, 0.07450981, 1, 0, 1,
-0.415182, -0.7005609, -2.933462, 0.06666667, 1, 0, 1,
-0.413955, 0.02362676, -2.730725, 0.0627451, 1, 0, 1,
-0.4105439, -2.084249, -2.320613, 0.05490196, 1, 0, 1,
-0.4014263, -1.156298, -2.66563, 0.05098039, 1, 0, 1,
-0.3997878, 1.092811, -1.93156, 0.04313726, 1, 0, 1,
-0.3985138, 1.198745, -1.805174, 0.03921569, 1, 0, 1,
-0.3984939, 0.9748155, -2.100188, 0.03137255, 1, 0, 1,
-0.3954118, -0.637271, -3.302685, 0.02745098, 1, 0, 1,
-0.3924826, -1.263591, -3.017409, 0.01960784, 1, 0, 1,
-0.3917042, 0.9910511, 0.1735017, 0.01568628, 1, 0, 1,
-0.3832371, 1.162589, 1.82302, 0.007843138, 1, 0, 1,
-0.3777832, -0.8698614, -2.925299, 0.003921569, 1, 0, 1,
-0.3736928, 0.1087668, -1.577932, 0, 1, 0.003921569, 1,
-0.3704138, -0.948962, -1.816499, 0, 1, 0.01176471, 1,
-0.3694789, 0.6507301, -1.464394, 0, 1, 0.01568628, 1,
-0.3682904, 0.1460894, -1.251174, 0, 1, 0.02352941, 1,
-0.3673342, 1.62948, 0.8394197, 0, 1, 0.02745098, 1,
-0.3602599, -0.6487576, -0.8308086, 0, 1, 0.03529412, 1,
-0.3588882, 0.2807882, -1.120066, 0, 1, 0.03921569, 1,
-0.3585234, 0.1033438, -0.9153975, 0, 1, 0.04705882, 1,
-0.348332, 1.882351, -0.4390151, 0, 1, 0.05098039, 1,
-0.3429718, 1.299535, -0.03646197, 0, 1, 0.05882353, 1,
-0.3356462, 0.5801941, 0.2102347, 0, 1, 0.0627451, 1,
-0.3355187, -0.436083, -2.261678, 0, 1, 0.07058824, 1,
-0.3295277, -1.06238, -0.7670141, 0, 1, 0.07450981, 1,
-0.3264919, -0.2719567, -2.071916, 0, 1, 0.08235294, 1,
-0.3261594, 0.1138507, -1.022156, 0, 1, 0.08627451, 1,
-0.3239341, 1.158058, -2.288863, 0, 1, 0.09411765, 1,
-0.3205858, 1.63339, -0.8412415, 0, 1, 0.1019608, 1,
-0.3140796, 0.3713376, -1.799402, 0, 1, 0.1058824, 1,
-0.3104751, -0.9260799, -2.967975, 0, 1, 0.1137255, 1,
-0.3089599, 0.6422404, 0.5588704, 0, 1, 0.1176471, 1,
-0.3045631, 0.2462634, -1.495337, 0, 1, 0.1254902, 1,
-0.3038124, 2.014046, 1.032104, 0, 1, 0.1294118, 1,
-0.2974283, -1.360569, -3.87946, 0, 1, 0.1372549, 1,
-0.2894522, -0.3928103, -3.505775, 0, 1, 0.1411765, 1,
-0.2871332, -0.02138567, -2.246798, 0, 1, 0.1490196, 1,
-0.2867983, 0.8925892, -0.08130553, 0, 1, 0.1529412, 1,
-0.2849312, -1.216073, -3.32412, 0, 1, 0.1607843, 1,
-0.2790743, -1.438844, -2.293597, 0, 1, 0.1647059, 1,
-0.2781858, -0.3073749, -2.865367, 0, 1, 0.172549, 1,
-0.2762849, 2.257897, -0.2482355, 0, 1, 0.1764706, 1,
-0.2757874, 0.3748533, -0.4997946, 0, 1, 0.1843137, 1,
-0.2702106, 1.338871, 0.3530021, 0, 1, 0.1882353, 1,
-0.266454, 0.9046, 1.337498, 0, 1, 0.1960784, 1,
-0.2656371, -0.1059043, 0.1242368, 0, 1, 0.2039216, 1,
-0.2634094, -0.1919642, -3.601525, 0, 1, 0.2078431, 1,
-0.2614469, -0.9343576, -3.209078, 0, 1, 0.2156863, 1,
-0.2573405, 0.9181148, -0.7335536, 0, 1, 0.2196078, 1,
-0.2562199, -0.7992309, -2.941996, 0, 1, 0.227451, 1,
-0.2553788, 1.17985, -0.9582003, 0, 1, 0.2313726, 1,
-0.2553674, -0.1155626, -2.477985, 0, 1, 0.2392157, 1,
-0.2543221, -1.351464, -2.500602, 0, 1, 0.2431373, 1,
-0.2525177, -0.1690416, -0.1296087, 0, 1, 0.2509804, 1,
-0.2514215, -0.9897313, -3.221599, 0, 1, 0.254902, 1,
-0.2472497, 0.6037699, -1.392542, 0, 1, 0.2627451, 1,
-0.2461428, 0.4586764, -0.2826319, 0, 1, 0.2666667, 1,
-0.2437484, -0.7662371, -2.098308, 0, 1, 0.2745098, 1,
-0.2381755, -0.4719421, -3.137233, 0, 1, 0.2784314, 1,
-0.2328387, 1.070667, -0.6022184, 0, 1, 0.2862745, 1,
-0.2260251, -0.2154638, -2.122556, 0, 1, 0.2901961, 1,
-0.2239602, -0.7472495, -3.276211, 0, 1, 0.2980392, 1,
-0.2202892, -1.492203, -1.285367, 0, 1, 0.3058824, 1,
-0.2175865, 0.04625838, -2.118266, 0, 1, 0.3098039, 1,
-0.2168832, 0.31595, -0.5266306, 0, 1, 0.3176471, 1,
-0.2163963, 2.110773, -0.1643046, 0, 1, 0.3215686, 1,
-0.2122371, 0.9037266, -0.5039034, 0, 1, 0.3294118, 1,
-0.2117161, -0.1442632, -2.006821, 0, 1, 0.3333333, 1,
-0.2099295, 1.000582, 0.3665352, 0, 1, 0.3411765, 1,
-0.2085227, -0.3555134, -3.629422, 0, 1, 0.345098, 1,
-0.2075396, 0.4355091, -0.7302949, 0, 1, 0.3529412, 1,
-0.2070333, 1.35254, 0.7333294, 0, 1, 0.3568628, 1,
-0.2036991, -0.4871428, -2.829533, 0, 1, 0.3647059, 1,
-0.2016838, 0.2205683, -3.140163, 0, 1, 0.3686275, 1,
-0.2006294, 0.7723239, -0.322912, 0, 1, 0.3764706, 1,
-0.1992484, -0.924558, -2.517309, 0, 1, 0.3803922, 1,
-0.1988614, -1.324657, -3.492206, 0, 1, 0.3882353, 1,
-0.1979898, -0.6641396, -2.62891, 0, 1, 0.3921569, 1,
-0.1966581, -0.786613, -2.288468, 0, 1, 0.4, 1,
-0.1882043, -2.025033, -3.447078, 0, 1, 0.4078431, 1,
-0.1859758, -1.031548, -1.91597, 0, 1, 0.4117647, 1,
-0.1853895, 0.1658462, -1.105615, 0, 1, 0.4196078, 1,
-0.1745969, 0.3919201, -0.6715599, 0, 1, 0.4235294, 1,
-0.1735407, -0.826535, -3.153424, 0, 1, 0.4313726, 1,
-0.1716074, -0.05437382, -2.460066, 0, 1, 0.4352941, 1,
-0.1701957, 0.7403317, -0.5400281, 0, 1, 0.4431373, 1,
-0.1685957, -0.4481515, -1.737669, 0, 1, 0.4470588, 1,
-0.1683708, 0.532268, -1.03864, 0, 1, 0.454902, 1,
-0.1660605, -0.3319152, -2.055429, 0, 1, 0.4588235, 1,
-0.1618639, -0.5758444, -0.8841585, 0, 1, 0.4666667, 1,
-0.1613227, 0.3712935, -2.04592, 0, 1, 0.4705882, 1,
-0.1576716, -0.99524, -3.034685, 0, 1, 0.4784314, 1,
-0.1553428, -0.08399799, -2.379865, 0, 1, 0.4823529, 1,
-0.1539982, 0.9966039, -0.6339613, 0, 1, 0.4901961, 1,
-0.1534482, 0.9185696, -0.4601124, 0, 1, 0.4941176, 1,
-0.1484135, -0.4201345, -2.816502, 0, 1, 0.5019608, 1,
-0.1474422, -1.387051, -3.206742, 0, 1, 0.509804, 1,
-0.1470594, 0.07885229, -0.04648266, 0, 1, 0.5137255, 1,
-0.1430603, -0.6898919, -2.715065, 0, 1, 0.5215687, 1,
-0.1382218, -0.6502027, -0.9643672, 0, 1, 0.5254902, 1,
-0.1344173, -0.625272, -2.448292, 0, 1, 0.5333334, 1,
-0.1267642, -1.669105, -0.9093291, 0, 1, 0.5372549, 1,
-0.1265337, 1.381841, -1.457057, 0, 1, 0.5450981, 1,
-0.1238457, 0.7099478, 0.2964925, 0, 1, 0.5490196, 1,
-0.1238307, 0.8199735, -1.207011, 0, 1, 0.5568628, 1,
-0.1212183, 1.445292, -0.1640521, 0, 1, 0.5607843, 1,
-0.1208702, 0.430108, -0.695472, 0, 1, 0.5686275, 1,
-0.1185352, 0.2400364, -1.770906, 0, 1, 0.572549, 1,
-0.1168603, 1.294678, -0.1452557, 0, 1, 0.5803922, 1,
-0.1119357, 1.416155, -0.5351589, 0, 1, 0.5843138, 1,
-0.1012627, -1.318299, -2.305174, 0, 1, 0.5921569, 1,
-0.1010235, -1.192302, -3.915546, 0, 1, 0.5960785, 1,
-0.09998401, -0.05134356, -2.484009, 0, 1, 0.6039216, 1,
-0.09834731, -0.2484417, -4.857665, 0, 1, 0.6117647, 1,
-0.09521507, -0.03018298, -2.170202, 0, 1, 0.6156863, 1,
-0.09455986, -0.4394564, -3.206032, 0, 1, 0.6235294, 1,
-0.09317552, 0.9050456, 0.6369243, 0, 1, 0.627451, 1,
-0.0922231, -1.745503, -2.372139, 0, 1, 0.6352941, 1,
-0.08694319, -0.1489879, -0.7877371, 0, 1, 0.6392157, 1,
-0.08678266, -0.7248026, -2.733402, 0, 1, 0.6470588, 1,
-0.0847271, 1.10216, 0.01874502, 0, 1, 0.6509804, 1,
-0.08279181, 0.4072193, -0.8135391, 0, 1, 0.6588235, 1,
-0.08192565, -0.09101865, -3.673043, 0, 1, 0.6627451, 1,
-0.08156781, 0.6153136, -0.7291073, 0, 1, 0.6705883, 1,
-0.08136526, 2.888161, 0.1222137, 0, 1, 0.6745098, 1,
-0.08047986, -1.785729, -3.869182, 0, 1, 0.682353, 1,
-0.06757555, 2.017884, 0.1809257, 0, 1, 0.6862745, 1,
-0.06719799, -0.7830185, -4.331955, 0, 1, 0.6941177, 1,
-0.0658507, 0.6050534, 1.744308, 0, 1, 0.7019608, 1,
-0.06461685, -0.3334363, -3.013446, 0, 1, 0.7058824, 1,
-0.06249873, -0.9373692, -3.885406, 0, 1, 0.7137255, 1,
-0.06067938, -1.756188, -3.515302, 0, 1, 0.7176471, 1,
-0.05882546, 0.5960083, -0.2374471, 0, 1, 0.7254902, 1,
-0.05648304, 0.3406732, 1.073199, 0, 1, 0.7294118, 1,
-0.05608582, 0.1776727, 1.643947, 0, 1, 0.7372549, 1,
-0.05415215, -1.993776, -3.06643, 0, 1, 0.7411765, 1,
-0.04892351, -1.696916, -2.407047, 0, 1, 0.7490196, 1,
-0.04099955, 0.7208976, -2.134081, 0, 1, 0.7529412, 1,
-0.03949279, -0.06446215, -2.278863, 0, 1, 0.7607843, 1,
-0.03640053, 1.970615, -0.3341444, 0, 1, 0.7647059, 1,
-0.03579469, -0.01308187, -1.390748, 0, 1, 0.772549, 1,
-0.03479856, -0.8255049, -4.215016, 0, 1, 0.7764706, 1,
-0.03039757, 1.769246, -1.533496, 0, 1, 0.7843137, 1,
-0.02978962, -2.020166, -1.459534, 0, 1, 0.7882353, 1,
-0.02799832, -0.002857946, -2.031149, 0, 1, 0.7960784, 1,
-0.02230232, -1.7687, -3.000324, 0, 1, 0.8039216, 1,
-0.02064143, 1.441595, -2.10101, 0, 1, 0.8078431, 1,
-0.02058847, 0.1589005, -2.046875, 0, 1, 0.8156863, 1,
-0.02046328, -0.1709813, -3.296171, 0, 1, 0.8196079, 1,
-0.01995451, 0.02774448, 0.8873149, 0, 1, 0.827451, 1,
-0.0175227, 0.09103601, -0.2249969, 0, 1, 0.8313726, 1,
-0.01650418, 0.5823729, -1.17436, 0, 1, 0.8392157, 1,
-0.01356496, -0.7221146, -3.759103, 0, 1, 0.8431373, 1,
-0.01271713, 0.9160015, 1.515798, 0, 1, 0.8509804, 1,
-0.007477691, 0.2861912, -2.326716, 0, 1, 0.854902, 1,
-0.005172056, -0.5964281, -3.653542, 0, 1, 0.8627451, 1,
-0.0001335816, 1.528755, 1.564551, 0, 1, 0.8666667, 1,
0.002495508, -1.42787, 3.17035, 0, 1, 0.8745098, 1,
0.003614829, 0.5450193, 0.04557141, 0, 1, 0.8784314, 1,
0.01023575, 1.089398, -0.002865247, 0, 1, 0.8862745, 1,
0.02647073, -0.9840807, 3.83237, 0, 1, 0.8901961, 1,
0.02705151, 0.4779622, -0.9058798, 0, 1, 0.8980392, 1,
0.02805146, 0.8507705, 1.677255, 0, 1, 0.9058824, 1,
0.02963735, -0.468274, 4.618294, 0, 1, 0.9098039, 1,
0.03145087, 0.3194035, -1.911417, 0, 1, 0.9176471, 1,
0.03277273, 0.2551455, 1.283345, 0, 1, 0.9215686, 1,
0.03295698, -1.142532, 1.439297, 0, 1, 0.9294118, 1,
0.03381583, 0.1500075, -0.3422371, 0, 1, 0.9333333, 1,
0.03463645, -0.2098201, 0.6255041, 0, 1, 0.9411765, 1,
0.03593211, 1.015962, 0.6919842, 0, 1, 0.945098, 1,
0.03976156, 0.4316588, 1.601642, 0, 1, 0.9529412, 1,
0.04128328, 1.023816, -1.487089, 0, 1, 0.9568627, 1,
0.04279808, 0.3486456, 0.2576588, 0, 1, 0.9647059, 1,
0.04745752, 1.716988, -0.2105468, 0, 1, 0.9686275, 1,
0.0488456, 1.268576, -1.717868, 0, 1, 0.9764706, 1,
0.05187528, 0.1784972, -0.2625874, 0, 1, 0.9803922, 1,
0.0693512, -0.6212466, 3.632321, 0, 1, 0.9882353, 1,
0.07276496, 0.872373, -0.395254, 0, 1, 0.9921569, 1,
0.07432447, -0.4628135, 4.244594, 0, 1, 1, 1,
0.07458691, -0.4061468, 2.41003, 0, 0.9921569, 1, 1,
0.08585223, -0.4472064, 2.610349, 0, 0.9882353, 1, 1,
0.08879802, -0.8318907, 2.333133, 0, 0.9803922, 1, 1,
0.09667542, -0.09751941, -0.06546237, 0, 0.9764706, 1, 1,
0.09730256, 0.4346613, 1.471743, 0, 0.9686275, 1, 1,
0.09890708, -0.7916135, 3.434198, 0, 0.9647059, 1, 1,
0.1008425, -2.339209, 2.688962, 0, 0.9568627, 1, 1,
0.1083281, -0.2882479, 3.597124, 0, 0.9529412, 1, 1,
0.1095634, 1.329332, 0.08009133, 0, 0.945098, 1, 1,
0.1096408, 0.05034774, 1.070077, 0, 0.9411765, 1, 1,
0.1129931, 1.000693, 0.4623208, 0, 0.9333333, 1, 1,
0.1174467, -0.7538768, 2.939656, 0, 0.9294118, 1, 1,
0.1206628, 1.894809, 0.07662768, 0, 0.9215686, 1, 1,
0.1217151, -0.01475557, 1.520459, 0, 0.9176471, 1, 1,
0.1231207, -0.5675471, 2.812512, 0, 0.9098039, 1, 1,
0.1252131, -0.4799474, 2.923992, 0, 0.9058824, 1, 1,
0.1262788, -0.5119137, 2.914828, 0, 0.8980392, 1, 1,
0.1264459, 0.2517248, 0.8237296, 0, 0.8901961, 1, 1,
0.1284054, -1.487347, 4.116911, 0, 0.8862745, 1, 1,
0.1333833, 0.4934811, 1.418207, 0, 0.8784314, 1, 1,
0.1381863, -1.299193, 3.113076, 0, 0.8745098, 1, 1,
0.1403246, 1.823593, -0.2810346, 0, 0.8666667, 1, 1,
0.1475857, 1.386001, -0.6335288, 0, 0.8627451, 1, 1,
0.1488634, -0.03866726, 2.926056, 0, 0.854902, 1, 1,
0.1498348, -0.3338836, 4.097423, 0, 0.8509804, 1, 1,
0.1509783, 0.02551044, 0.544329, 0, 0.8431373, 1, 1,
0.1547228, 1.94305, 0.3351375, 0, 0.8392157, 1, 1,
0.1552712, -0.7303944, 1.817302, 0, 0.8313726, 1, 1,
0.1564541, 0.8282483, 0.485823, 0, 0.827451, 1, 1,
0.1635872, -0.003068655, 2.161286, 0, 0.8196079, 1, 1,
0.1637863, 0.1588543, 1.882215, 0, 0.8156863, 1, 1,
0.1643243, -0.8023288, 3.297234, 0, 0.8078431, 1, 1,
0.16998, -0.1910234, 1.512442, 0, 0.8039216, 1, 1,
0.1713808, 0.9147075, -0.9237401, 0, 0.7960784, 1, 1,
0.1722302, -1.498454, 3.878507, 0, 0.7882353, 1, 1,
0.1728033, 0.2869442, 1.100421, 0, 0.7843137, 1, 1,
0.1741913, 0.5304549, 0.9983435, 0, 0.7764706, 1, 1,
0.1751512, -0.6994804, 2.747467, 0, 0.772549, 1, 1,
0.1752995, 0.6030988, -0.3306171, 0, 0.7647059, 1, 1,
0.1814066, 1.327226, -0.9568489, 0, 0.7607843, 1, 1,
0.1820524, -0.4933262, 3.319292, 0, 0.7529412, 1, 1,
0.1829542, 0.4174334, 0.5134138, 0, 0.7490196, 1, 1,
0.1841427, -0.1391849, 3.550968, 0, 0.7411765, 1, 1,
0.1852572, -2.807585, 3.265729, 0, 0.7372549, 1, 1,
0.1875691, 0.868758, -0.3206439, 0, 0.7294118, 1, 1,
0.1912573, 0.1962877, 0.253526, 0, 0.7254902, 1, 1,
0.1938944, 1.436677, 1.205531, 0, 0.7176471, 1, 1,
0.1981227, 0.5137818, -0.5286801, 0, 0.7137255, 1, 1,
0.1985867, 0.8310689, 0.07144793, 0, 0.7058824, 1, 1,
0.1990654, -2.435992, 1.753954, 0, 0.6980392, 1, 1,
0.215866, 1.37, -0.89694, 0, 0.6941177, 1, 1,
0.2240376, -0.6825505, 3.252698, 0, 0.6862745, 1, 1,
0.2289179, -0.8377154, 2.211339, 0, 0.682353, 1, 1,
0.235561, -1.366893, 3.468492, 0, 0.6745098, 1, 1,
0.2373005, -0.4442993, 1.364225, 0, 0.6705883, 1, 1,
0.2389664, -1.148464, 1.916362, 0, 0.6627451, 1, 1,
0.241974, 1.315206, 0.6368092, 0, 0.6588235, 1, 1,
0.2491642, 0.6558185, 0.6871575, 0, 0.6509804, 1, 1,
0.2547681, -1.21857, 2.545576, 0, 0.6470588, 1, 1,
0.2573386, -0.7949168, 4.548645, 0, 0.6392157, 1, 1,
0.2576289, -0.9990163, 5.006768, 0, 0.6352941, 1, 1,
0.259416, 0.7367136, 1.079956, 0, 0.627451, 1, 1,
0.265644, -1.657927, 2.550488, 0, 0.6235294, 1, 1,
0.2674561, 0.1803247, 0.02426706, 0, 0.6156863, 1, 1,
0.2692953, 0.06444457, 0.111943, 0, 0.6117647, 1, 1,
0.2761824, 0.3008395, 2.80283, 0, 0.6039216, 1, 1,
0.2809575, -0.4078109, 1.401023, 0, 0.5960785, 1, 1,
0.2826281, 0.7443134, 0.1648443, 0, 0.5921569, 1, 1,
0.2842785, 1.208745, -1.225184, 0, 0.5843138, 1, 1,
0.2853018, -1.539474, 3.073916, 0, 0.5803922, 1, 1,
0.2866387, -0.4806849, 1.38784, 0, 0.572549, 1, 1,
0.2866523, 0.2356675, 1.158962, 0, 0.5686275, 1, 1,
0.2916751, 0.4035985, -1.753233, 0, 0.5607843, 1, 1,
0.2918566, 0.1806192, 0.8807376, 0, 0.5568628, 1, 1,
0.292434, -0.5212458, 3.559216, 0, 0.5490196, 1, 1,
0.2934972, 0.9533817, 2.246827, 0, 0.5450981, 1, 1,
0.2938701, 0.1735478, -1.109567, 0, 0.5372549, 1, 1,
0.2976838, -1.559238, 1.452364, 0, 0.5333334, 1, 1,
0.298431, -1.210585, 4.121159, 0, 0.5254902, 1, 1,
0.298608, -0.2569879, 1.283107, 0, 0.5215687, 1, 1,
0.3074622, -0.4756852, 2.555263, 0, 0.5137255, 1, 1,
0.3086893, 3.176171, 0.5892858, 0, 0.509804, 1, 1,
0.3088388, -0.5920066, 3.8705, 0, 0.5019608, 1, 1,
0.3102407, -1.635527, 3.072132, 0, 0.4941176, 1, 1,
0.3111665, -1.552734, 3.039844, 0, 0.4901961, 1, 1,
0.3129885, -1.049643, 2.588761, 0, 0.4823529, 1, 1,
0.3201111, -0.06453259, 0.5302905, 0, 0.4784314, 1, 1,
0.3226533, -0.6610547, 0.7707713, 0, 0.4705882, 1, 1,
0.3226842, -1.645428, 2.7799, 0, 0.4666667, 1, 1,
0.3351581, 1.344242, -0.6747856, 0, 0.4588235, 1, 1,
0.3442538, -1.395955, 4.100168, 0, 0.454902, 1, 1,
0.3454275, -0.7434494, 2.262677, 0, 0.4470588, 1, 1,
0.3490261, -1.051763, 2.701342, 0, 0.4431373, 1, 1,
0.3490709, -0.01631594, 1.563782, 0, 0.4352941, 1, 1,
0.3537974, -0.7068809, 0.9201736, 0, 0.4313726, 1, 1,
0.3543006, -0.6101599, 3.260791, 0, 0.4235294, 1, 1,
0.3550115, 0.4128874, 2.220272, 0, 0.4196078, 1, 1,
0.3572654, 0.2424277, -0.03108669, 0, 0.4117647, 1, 1,
0.35808, 1.22715, 1.652617, 0, 0.4078431, 1, 1,
0.3615095, -1.852612, 2.423042, 0, 0.4, 1, 1,
0.3630264, -0.2886844, 0.8671083, 0, 0.3921569, 1, 1,
0.3635613, -0.08354946, 0.8174728, 0, 0.3882353, 1, 1,
0.3678451, -1.161749, 4.342608, 0, 0.3803922, 1, 1,
0.368325, 1.432128, -1.067298, 0, 0.3764706, 1, 1,
0.3690947, -0.1515927, 2.814125, 0, 0.3686275, 1, 1,
0.3711138, 1.335847, 0.2138805, 0, 0.3647059, 1, 1,
0.3749334, -0.4616953, 1.834008, 0, 0.3568628, 1, 1,
0.3801338, 0.815782, 1.036638, 0, 0.3529412, 1, 1,
0.3824269, -0.4089885, 1.578792, 0, 0.345098, 1, 1,
0.385283, 0.7919869, 0.3196332, 0, 0.3411765, 1, 1,
0.3862405, -0.7004691, 3.830458, 0, 0.3333333, 1, 1,
0.386583, -1.663673, 2.726883, 0, 0.3294118, 1, 1,
0.3867066, 0.4594576, 1.342484, 0, 0.3215686, 1, 1,
0.3893417, -1.861094, 4.390442, 0, 0.3176471, 1, 1,
0.3897287, 0.4432373, 2.698404, 0, 0.3098039, 1, 1,
0.3947432, -0.05793567, 3.184484, 0, 0.3058824, 1, 1,
0.3950325, 0.5869195, 0.3989607, 0, 0.2980392, 1, 1,
0.3954236, 1.248122, 0.7187464, 0, 0.2901961, 1, 1,
0.3974929, 1.079929, 0.6203897, 0, 0.2862745, 1, 1,
0.4000167, -0.01332692, 1.08802, 0, 0.2784314, 1, 1,
0.4029392, 1.973097, -0.8403739, 0, 0.2745098, 1, 1,
0.4039354, -1.528141, 5.658632, 0, 0.2666667, 1, 1,
0.4068884, 0.1362285, 1.99374, 0, 0.2627451, 1, 1,
0.4095447, -1.031521, 3.001888, 0, 0.254902, 1, 1,
0.4116111, 1.632997, 0.3283446, 0, 0.2509804, 1, 1,
0.4148114, 1.339874, 1.405757, 0, 0.2431373, 1, 1,
0.4154984, 0.2361032, 0.9124059, 0, 0.2392157, 1, 1,
0.4195152, 2.266413, -0.4701684, 0, 0.2313726, 1, 1,
0.4241796, 0.6916766, 1.047274, 0, 0.227451, 1, 1,
0.4271662, 1.596537, 1.309777, 0, 0.2196078, 1, 1,
0.4335562, -0.0643409, 2.388476, 0, 0.2156863, 1, 1,
0.4338471, -1.733155, 1.540673, 0, 0.2078431, 1, 1,
0.4341417, 0.04394956, 1.978736, 0, 0.2039216, 1, 1,
0.4377849, -1.122225, 3.618817, 0, 0.1960784, 1, 1,
0.4401675, -0.2919683, 3.53784, 0, 0.1882353, 1, 1,
0.4417057, -0.05326771, 0.8959259, 0, 0.1843137, 1, 1,
0.4422061, 0.5773686, 1.467256, 0, 0.1764706, 1, 1,
0.4458969, 0.1328285, 1.192568, 0, 0.172549, 1, 1,
0.4462675, 0.1814434, 1.004119, 0, 0.1647059, 1, 1,
0.4468239, -0.3213881, 1.830692, 0, 0.1607843, 1, 1,
0.4491303, -0.1192295, 1.710589, 0, 0.1529412, 1, 1,
0.4515705, -0.9964094, 2.618786, 0, 0.1490196, 1, 1,
0.4523617, 0.780262, -0.4458487, 0, 0.1411765, 1, 1,
0.4537304, -1.079005, 2.788582, 0, 0.1372549, 1, 1,
0.4548408, -2.436274, 2.608717, 0, 0.1294118, 1, 1,
0.4572974, -0.2109926, 3.087417, 0, 0.1254902, 1, 1,
0.4600939, 1.065685, 0.1943813, 0, 0.1176471, 1, 1,
0.4661161, 0.06595843, 0.8583415, 0, 0.1137255, 1, 1,
0.4669695, 0.6216674, 1.671524, 0, 0.1058824, 1, 1,
0.4723938, 0.9439727, 0.7675566, 0, 0.09803922, 1, 1,
0.4749707, 1.467495, -0.5645374, 0, 0.09411765, 1, 1,
0.4763145, -0.3196212, 2.632327, 0, 0.08627451, 1, 1,
0.4790098, -0.05432464, 3.215717, 0, 0.08235294, 1, 1,
0.4795532, 0.0012537, 1.26677, 0, 0.07450981, 1, 1,
0.4796129, -0.02437417, 0.8270322, 0, 0.07058824, 1, 1,
0.4800143, -1.632811, 2.779368, 0, 0.0627451, 1, 1,
0.4857042, 0.4921224, 0.09372927, 0, 0.05882353, 1, 1,
0.486265, 0.6951842, 0.6762849, 0, 0.05098039, 1, 1,
0.4927092, -1.119662, 2.508879, 0, 0.04705882, 1, 1,
0.4961594, -0.5140998, 3.180436, 0, 0.03921569, 1, 1,
0.5055053, 2.929691, -2.179511, 0, 0.03529412, 1, 1,
0.5101545, -0.5468443, 2.949135, 0, 0.02745098, 1, 1,
0.5107198, 0.4070271, 1.328228, 0, 0.02352941, 1, 1,
0.5110633, 2.288198, 1.316283, 0, 0.01568628, 1, 1,
0.5180225, -1.636384, 2.153965, 0, 0.01176471, 1, 1,
0.5194415, -1.734252, 2.282881, 0, 0.003921569, 1, 1,
0.5216869, 2.016027, -1.889585, 0.003921569, 0, 1, 1,
0.5257968, 1.56673, -1.010913, 0.007843138, 0, 1, 1,
0.5272222, 0.4256338, 1.280851, 0.01568628, 0, 1, 1,
0.5338111, 0.4875598, -0.2547784, 0.01960784, 0, 1, 1,
0.5350273, -0.2130183, 3.623755, 0.02745098, 0, 1, 1,
0.538782, -1.868151, 4.40287, 0.03137255, 0, 1, 1,
0.5419462, -0.6750499, 3.670583, 0.03921569, 0, 1, 1,
0.5422831, 0.7998988, -0.01283823, 0.04313726, 0, 1, 1,
0.5515554, 0.1660947, 1.86759, 0.05098039, 0, 1, 1,
0.5569211, -2.853638, 5.921389, 0.05490196, 0, 1, 1,
0.559756, -0.6115419, 1.244232, 0.0627451, 0, 1, 1,
0.5608513, -0.8817145, 2.971197, 0.06666667, 0, 1, 1,
0.5626456, 0.09712768, 0.9697208, 0.07450981, 0, 1, 1,
0.572961, 0.4804586, -0.4258958, 0.07843138, 0, 1, 1,
0.5733809, 0.3770147, 1.113542, 0.08627451, 0, 1, 1,
0.5745764, 1.516209, -2.807878, 0.09019608, 0, 1, 1,
0.5762814, 0.3383924, 0.7476227, 0.09803922, 0, 1, 1,
0.5803103, 0.8452904, -0.5966702, 0.1058824, 0, 1, 1,
0.581432, 0.1379701, 2.46616, 0.1098039, 0, 1, 1,
0.5867237, 0.487161, 0.5819218, 0.1176471, 0, 1, 1,
0.5905484, 0.02329029, 1.249912, 0.1215686, 0, 1, 1,
0.5970156, 0.7766805, 0.9943479, 0.1294118, 0, 1, 1,
0.5975501, 0.7991061, 0.664265, 0.1333333, 0, 1, 1,
0.5987511, 0.4582529, 0.4168527, 0.1411765, 0, 1, 1,
0.6016671, 0.6698749, 0.5115172, 0.145098, 0, 1, 1,
0.604418, -0.7972383, 1.703755, 0.1529412, 0, 1, 1,
0.6097201, -1.13271, 2.087034, 0.1568628, 0, 1, 1,
0.6126279, 0.1885216, 2.101129, 0.1647059, 0, 1, 1,
0.6145777, 0.7121838, 0.6628386, 0.1686275, 0, 1, 1,
0.6152975, 2.422721, 0.7272255, 0.1764706, 0, 1, 1,
0.6174964, 1.422561, 0.4899035, 0.1803922, 0, 1, 1,
0.6196249, -2.311126, 2.778696, 0.1882353, 0, 1, 1,
0.6201575, -0.005066713, 2.277645, 0.1921569, 0, 1, 1,
0.6224039, -0.785714, 2.985431, 0.2, 0, 1, 1,
0.6226432, 1.120757, 0.2460753, 0.2078431, 0, 1, 1,
0.6241488, 0.9170527, 1.03612, 0.2117647, 0, 1, 1,
0.6279269, -1.224535, 3.183195, 0.2196078, 0, 1, 1,
0.6320168, -2.629703, 3.698581, 0.2235294, 0, 1, 1,
0.6382129, 1.297614, -1.754161, 0.2313726, 0, 1, 1,
0.6411815, 1.512862, 1.044838, 0.2352941, 0, 1, 1,
0.6414417, 0.001715001, 0.2648195, 0.2431373, 0, 1, 1,
0.6506814, 0.001876716, 1.950142, 0.2470588, 0, 1, 1,
0.6536195, 0.4315619, 1.728487, 0.254902, 0, 1, 1,
0.655916, 1.032296, 0.8593735, 0.2588235, 0, 1, 1,
0.65813, 0.774882, -0.3010293, 0.2666667, 0, 1, 1,
0.6591889, -0.3469454, 2.913416, 0.2705882, 0, 1, 1,
0.6615353, 0.6383705, -1.643563, 0.2784314, 0, 1, 1,
0.6648727, -0.129175, 2.697731, 0.282353, 0, 1, 1,
0.6655838, -2.673114, 2.512071, 0.2901961, 0, 1, 1,
0.6697435, 0.6516179, 0.901527, 0.2941177, 0, 1, 1,
0.6716671, 0.4083013, 0.813829, 0.3019608, 0, 1, 1,
0.67345, 1.021316, 1.484918, 0.3098039, 0, 1, 1,
0.6755036, -0.2174388, 1.622535, 0.3137255, 0, 1, 1,
0.6761038, -0.8106854, 3.438633, 0.3215686, 0, 1, 1,
0.6764346, 0.3374586, 2.918913, 0.3254902, 0, 1, 1,
0.6776052, -0.4323784, 0.8827468, 0.3333333, 0, 1, 1,
0.6780361, 1.600314, 0.4596252, 0.3372549, 0, 1, 1,
0.6831942, -0.3030409, 2.879606, 0.345098, 0, 1, 1,
0.6863168, -0.5934997, 3.405843, 0.3490196, 0, 1, 1,
0.686345, -0.9495957, 0.9041139, 0.3568628, 0, 1, 1,
0.6911852, -1.469002, 3.543272, 0.3607843, 0, 1, 1,
0.6923829, 0.1046759, -0.1660202, 0.3686275, 0, 1, 1,
0.6950663, -0.02101683, -0.8229629, 0.372549, 0, 1, 1,
0.696348, 0.5530654, 1.323889, 0.3803922, 0, 1, 1,
0.6966723, 1.097063, 0.2206748, 0.3843137, 0, 1, 1,
0.6983675, -1.908098, 2.411361, 0.3921569, 0, 1, 1,
0.7069055, -0.6855493, 2.460348, 0.3960784, 0, 1, 1,
0.710912, -0.2428662, 1.885629, 0.4039216, 0, 1, 1,
0.7117227, 0.9831268, 0.691705, 0.4117647, 0, 1, 1,
0.7132002, -1.703043, 3.140035, 0.4156863, 0, 1, 1,
0.7132763, 1.330438, -1.349245, 0.4235294, 0, 1, 1,
0.7151698, 0.4658491, 0.8345233, 0.427451, 0, 1, 1,
0.7171317, -0.8760188, 3.177184, 0.4352941, 0, 1, 1,
0.7182026, 0.9959779, 1.585571, 0.4392157, 0, 1, 1,
0.7198674, -0.791222, 2.83931, 0.4470588, 0, 1, 1,
0.725419, 0.2855418, 0.8201079, 0.4509804, 0, 1, 1,
0.7273474, 0.2613561, 1.385581, 0.4588235, 0, 1, 1,
0.7356313, -1.356499, 1.83501, 0.4627451, 0, 1, 1,
0.7364017, -0.2379038, 1.249176, 0.4705882, 0, 1, 1,
0.738412, -1.631846, 2.202112, 0.4745098, 0, 1, 1,
0.7439815, -0.1786198, 3.324569, 0.4823529, 0, 1, 1,
0.7484366, 0.1595771, 2.272539, 0.4862745, 0, 1, 1,
0.7501457, -0.8043427, 3.365151, 0.4941176, 0, 1, 1,
0.7514021, 0.4809973, 1.146428, 0.5019608, 0, 1, 1,
0.7534603, 0.01635889, 0.2934744, 0.5058824, 0, 1, 1,
0.7569423, 0.4851602, 0.03765691, 0.5137255, 0, 1, 1,
0.7585152, 0.4092122, 1.047211, 0.5176471, 0, 1, 1,
0.7604998, 0.3177899, 3.039552, 0.5254902, 0, 1, 1,
0.7611102, -1.422312, 3.682175, 0.5294118, 0, 1, 1,
0.7672277, 0.6360027, 1.24262, 0.5372549, 0, 1, 1,
0.7695803, -0.7064141, 2.056605, 0.5411765, 0, 1, 1,
0.7744896, 0.05744831, 2.133467, 0.5490196, 0, 1, 1,
0.7770435, -0.7207245, 0.6220867, 0.5529412, 0, 1, 1,
0.7775826, 0.008995179, 2.110429, 0.5607843, 0, 1, 1,
0.7942227, -1.078617, 1.659939, 0.5647059, 0, 1, 1,
0.7950618, 2.177891, -1.960307, 0.572549, 0, 1, 1,
0.8000525, 0.6066844, 2.285007, 0.5764706, 0, 1, 1,
0.804437, -0.1616501, 1.031665, 0.5843138, 0, 1, 1,
0.8045601, -0.01874789, 1.893539, 0.5882353, 0, 1, 1,
0.8078035, -1.284295, 2.672777, 0.5960785, 0, 1, 1,
0.8110983, 0.936441, 0.1599124, 0.6039216, 0, 1, 1,
0.8126485, -1.477687, 3.5699, 0.6078432, 0, 1, 1,
0.8141264, 1.334694, 0.1041994, 0.6156863, 0, 1, 1,
0.8145853, 0.2401374, -0.1840899, 0.6196079, 0, 1, 1,
0.8150467, -1.192265, 4.301555, 0.627451, 0, 1, 1,
0.8178268, 0.5078354, 2.829844, 0.6313726, 0, 1, 1,
0.8196611, -0.1299208, 1.64038, 0.6392157, 0, 1, 1,
0.8221086, 0.8962647, -0.386296, 0.6431373, 0, 1, 1,
0.8253849, -1.629029, 3.234105, 0.6509804, 0, 1, 1,
0.8276814, 0.7787827, -1.44847, 0.654902, 0, 1, 1,
0.8289563, -0.578041, 0.2019123, 0.6627451, 0, 1, 1,
0.8307071, 0.6729951, 0.7042463, 0.6666667, 0, 1, 1,
0.8321563, 0.2687067, 0.9120234, 0.6745098, 0, 1, 1,
0.834397, -0.6841989, 2.722669, 0.6784314, 0, 1, 1,
0.834801, 1.610512, 1.341834, 0.6862745, 0, 1, 1,
0.8348173, 0.02842642, 2.634885, 0.6901961, 0, 1, 1,
0.8371377, 1.004696, 2.013333, 0.6980392, 0, 1, 1,
0.8504187, -0.4365047, -0.6978108, 0.7058824, 0, 1, 1,
0.8521579, -0.5443385, 0.9795789, 0.7098039, 0, 1, 1,
0.8559176, -0.3016467, 2.691191, 0.7176471, 0, 1, 1,
0.8561035, 0.4076481, 2.764383, 0.7215686, 0, 1, 1,
0.8609129, 0.2789662, 0.6973269, 0.7294118, 0, 1, 1,
0.8672566, -1.435606, 1.506329, 0.7333333, 0, 1, 1,
0.873825, -1.804602, 3.251986, 0.7411765, 0, 1, 1,
0.8849558, 0.1551111, 1.070906, 0.7450981, 0, 1, 1,
0.8917996, 1.854247, 0.9874989, 0.7529412, 0, 1, 1,
0.8923356, -0.4525158, 2.228814, 0.7568628, 0, 1, 1,
0.8933803, 1.276978, 0.6339588, 0.7647059, 0, 1, 1,
0.8967832, 1.368764, 0.2454407, 0.7686275, 0, 1, 1,
0.8979974, 1.342369, 1.263084, 0.7764706, 0, 1, 1,
0.9044653, 0.7645267, 1.022548, 0.7803922, 0, 1, 1,
0.9130213, 0.4958781, 1.845712, 0.7882353, 0, 1, 1,
0.9137987, 0.7957597, 2.358252, 0.7921569, 0, 1, 1,
0.9161405, -1.612916, 3.388493, 0.8, 0, 1, 1,
0.9198645, -1.215368, 2.500522, 0.8078431, 0, 1, 1,
0.9199795, 0.755851, -1.137216, 0.8117647, 0, 1, 1,
0.9234038, -0.1715924, 2.142949, 0.8196079, 0, 1, 1,
0.9262323, -1.20768, 3.017867, 0.8235294, 0, 1, 1,
0.9268116, 0.8819399, 0.36189, 0.8313726, 0, 1, 1,
0.9268267, 1.071705, 1.78655, 0.8352941, 0, 1, 1,
0.9288716, 0.3177328, 1.351743, 0.8431373, 0, 1, 1,
0.9326784, -1.585096, 3.99986, 0.8470588, 0, 1, 1,
0.9332719, 1.382608, 1.52857, 0.854902, 0, 1, 1,
0.9384876, 0.4231404, 1.235674, 0.8588235, 0, 1, 1,
0.942579, -0.4105448, 0.986284, 0.8666667, 0, 1, 1,
0.9532875, 0.05865829, 3.143576, 0.8705882, 0, 1, 1,
0.954551, -0.6476711, 4.49789, 0.8784314, 0, 1, 1,
0.9703657, 0.3785154, 0.5053101, 0.8823529, 0, 1, 1,
0.9752749, -0.7939345, 2.46853, 0.8901961, 0, 1, 1,
0.978905, 1.140841, 2.124669, 0.8941177, 0, 1, 1,
0.9791031, -0.1659836, -1.249801, 0.9019608, 0, 1, 1,
0.9839776, 1.253586, 0.8928114, 0.9098039, 0, 1, 1,
0.9869994, 0.9554871, 1.579297, 0.9137255, 0, 1, 1,
0.9877572, 0.2809097, 2.049044, 0.9215686, 0, 1, 1,
0.9927143, 1.42143, 0.8729863, 0.9254902, 0, 1, 1,
0.994857, -1.302383, 1.859438, 0.9333333, 0, 1, 1,
0.9951853, -0.3312217, 4.298106, 0.9372549, 0, 1, 1,
0.9959605, -1.150669, 2.887975, 0.945098, 0, 1, 1,
0.9966972, 0.422671, 0.3009162, 0.9490196, 0, 1, 1,
0.997807, -0.9623668, 2.98594, 0.9568627, 0, 1, 1,
0.998695, -1.176327, 1.802011, 0.9607843, 0, 1, 1,
1.000831, -0.7922746, 1.398833, 0.9686275, 0, 1, 1,
1.007213, -0.8147425, 3.532084, 0.972549, 0, 1, 1,
1.011036, -0.3628672, 3.13655, 0.9803922, 0, 1, 1,
1.011546, -0.3181338, 1.544769, 0.9843137, 0, 1, 1,
1.026643, -0.7408741, 1.676536, 0.9921569, 0, 1, 1,
1.03817, -0.6389873, 2.734765, 0.9960784, 0, 1, 1,
1.039664, -0.1648002, 1.961013, 1, 0, 0.9960784, 1,
1.042473, 0.01222751, 2.771569, 1, 0, 0.9882353, 1,
1.04674, 0.634806, 0.7040141, 1, 0, 0.9843137, 1,
1.056929, -1.00018, 1.578364, 1, 0, 0.9764706, 1,
1.070233, -0.6895863, 2.055994, 1, 0, 0.972549, 1,
1.073622, -0.1101896, 1.309682, 1, 0, 0.9647059, 1,
1.076884, 0.2234322, 1.205488, 1, 0, 0.9607843, 1,
1.081166, 0.007138367, 1.979403, 1, 0, 0.9529412, 1,
1.085791, -0.8898785, 2.177198, 1, 0, 0.9490196, 1,
1.086905, -1.404983, 2.901199, 1, 0, 0.9411765, 1,
1.088472, -0.8452156, 1.335145, 1, 0, 0.9372549, 1,
1.092024, 1.494372, 0.8971339, 1, 0, 0.9294118, 1,
1.100788, 0.7077481, 0.8953951, 1, 0, 0.9254902, 1,
1.103684, 1.153931, 0.8807652, 1, 0, 0.9176471, 1,
1.106422, 0.7098707, 1.61098, 1, 0, 0.9137255, 1,
1.108691, 1.680387, -0.2189052, 1, 0, 0.9058824, 1,
1.115152, -0.6211724, 3.081538, 1, 0, 0.9019608, 1,
1.115751, -0.2562183, -0.06067755, 1, 0, 0.8941177, 1,
1.122839, 0.2201155, 1.259311, 1, 0, 0.8862745, 1,
1.128667, -1.175991, 2.487134, 1, 0, 0.8823529, 1,
1.129111, -0.1530211, 0.1354972, 1, 0, 0.8745098, 1,
1.137308, 2.859013, 1.953188, 1, 0, 0.8705882, 1,
1.138412, -1.785853, 2.405869, 1, 0, 0.8627451, 1,
1.140812, 0.9154273, -0.7983606, 1, 0, 0.8588235, 1,
1.145101, 1.453699, 3.245986, 1, 0, 0.8509804, 1,
1.154283, 1.127766, 0.9382336, 1, 0, 0.8470588, 1,
1.155879, -0.7058098, 2.287969, 1, 0, 0.8392157, 1,
1.164599, 0.8671249, 0.6757759, 1, 0, 0.8352941, 1,
1.164815, -1.04305, 2.268539, 1, 0, 0.827451, 1,
1.165509, -1.195448, 2.794273, 1, 0, 0.8235294, 1,
1.167594, -0.4684979, 1.308453, 1, 0, 0.8156863, 1,
1.168816, -1.307601, 3.143707, 1, 0, 0.8117647, 1,
1.179538, -0.8572966, 2.685398, 1, 0, 0.8039216, 1,
1.182197, -1.808901, 2.397273, 1, 0, 0.7960784, 1,
1.187228, -1.071082, 2.413161, 1, 0, 0.7921569, 1,
1.187479, -1.89565, 4.192083, 1, 0, 0.7843137, 1,
1.187778, -0.5297283, 2.607411, 1, 0, 0.7803922, 1,
1.190186, -0.05111441, 1.068043, 1, 0, 0.772549, 1,
1.190649, 0.04699978, -0.4375576, 1, 0, 0.7686275, 1,
1.21071, -0.1837231, 0.8764512, 1, 0, 0.7607843, 1,
1.213066, -0.02365491, 1.052994, 1, 0, 0.7568628, 1,
1.226203, 0.3540555, 1.322267, 1, 0, 0.7490196, 1,
1.226407, 0.762266, 1.113875, 1, 0, 0.7450981, 1,
1.236754, -1.129775, 3.530279, 1, 0, 0.7372549, 1,
1.242027, 1.374834, 1.943385, 1, 0, 0.7333333, 1,
1.242662, -3.175009, 5.223134, 1, 0, 0.7254902, 1,
1.242957, 1.638852, 0.2572366, 1, 0, 0.7215686, 1,
1.243275, -0.9054523, 1.752215, 1, 0, 0.7137255, 1,
1.247943, 0.1020015, 1.551404, 1, 0, 0.7098039, 1,
1.251831, -0.4028541, 1.874137, 1, 0, 0.7019608, 1,
1.255785, -0.03821506, 0.6161675, 1, 0, 0.6941177, 1,
1.263771, -0.5659435, 1.865033, 1, 0, 0.6901961, 1,
1.268746, 0.2716331, 1.330549, 1, 0, 0.682353, 1,
1.26974, 0.2619255, 2.487355, 1, 0, 0.6784314, 1,
1.270064, 0.05293258, 0.4641803, 1, 0, 0.6705883, 1,
1.270734, 0.9173153, 1.277349, 1, 0, 0.6666667, 1,
1.278047, 1.259592, -0.07709786, 1, 0, 0.6588235, 1,
1.286379, 0.3539768, 1.395449, 1, 0, 0.654902, 1,
1.302284, 1.194606, 1.132109, 1, 0, 0.6470588, 1,
1.302411, 0.2167753, 1.814233, 1, 0, 0.6431373, 1,
1.304246, 0.9256188, -0.3254992, 1, 0, 0.6352941, 1,
1.30906, -0.8702546, 2.729307, 1, 0, 0.6313726, 1,
1.317271, 0.6974419, 2.409454, 1, 0, 0.6235294, 1,
1.317876, 0.4044354, 2.869097, 1, 0, 0.6196079, 1,
1.321109, 0.8225831, 1.276071, 1, 0, 0.6117647, 1,
1.341676, 0.8935157, 0.5867845, 1, 0, 0.6078432, 1,
1.345187, -0.05160205, 3.364075, 1, 0, 0.6, 1,
1.347754, -0.1796068, 1.211362, 1, 0, 0.5921569, 1,
1.347973, -1.472975, 2.747416, 1, 0, 0.5882353, 1,
1.35082, 0.9209409, 2.079696, 1, 0, 0.5803922, 1,
1.367866, 2.050152, 0.8789471, 1, 0, 0.5764706, 1,
1.383666, 0.2491912, 0.9683595, 1, 0, 0.5686275, 1,
1.387006, 0.8682202, 1.703061, 1, 0, 0.5647059, 1,
1.387947, 1.295695, 1.809179, 1, 0, 0.5568628, 1,
1.394963, 0.08944599, 1.101037, 1, 0, 0.5529412, 1,
1.396032, 0.3229089, 1.469147, 1, 0, 0.5450981, 1,
1.397291, 1.332184, 0.6638311, 1, 0, 0.5411765, 1,
1.410629, -1.341477, 2.556765, 1, 0, 0.5333334, 1,
1.414635, -2.933616, 3.01269, 1, 0, 0.5294118, 1,
1.433809, -1.269003, 0.9708104, 1, 0, 0.5215687, 1,
1.435497, -0.1190337, 0.7611526, 1, 0, 0.5176471, 1,
1.435663, -1.46987, 1.259618, 1, 0, 0.509804, 1,
1.455856, 0.6622509, -0.8887688, 1, 0, 0.5058824, 1,
1.462217, -0.2791813, 0.9197801, 1, 0, 0.4980392, 1,
1.46971, 0.8590199, 0.3890783, 1, 0, 0.4901961, 1,
1.479095, -0.8518399, 4.046122, 1, 0, 0.4862745, 1,
1.47939, -0.768226, 1.832391, 1, 0, 0.4784314, 1,
1.491471, 2.145293, 1.572716, 1, 0, 0.4745098, 1,
1.495709, -0.1287119, 2.683089, 1, 0, 0.4666667, 1,
1.49666, -2.291123, 1.842061, 1, 0, 0.4627451, 1,
1.508892, -0.4533603, 1.096023, 1, 0, 0.454902, 1,
1.547505, -0.9037328, 0.06259943, 1, 0, 0.4509804, 1,
1.559126, 0.576967, -1.544391, 1, 0, 0.4431373, 1,
1.560085, 0.4069328, 2.610286, 1, 0, 0.4392157, 1,
1.575345, -0.9129543, 3.001438, 1, 0, 0.4313726, 1,
1.581998, -2.378254, 2.84079, 1, 0, 0.427451, 1,
1.582717, -1.942242, 2.167395, 1, 0, 0.4196078, 1,
1.58508, -1.478702, 2.557475, 1, 0, 0.4156863, 1,
1.585186, 0.6832919, 0.1644416, 1, 0, 0.4078431, 1,
1.590409, 0.4937237, 1.114207, 1, 0, 0.4039216, 1,
1.59106, -1.166396, 2.00397, 1, 0, 0.3960784, 1,
1.597797, -0.09646138, 1.987131, 1, 0, 0.3882353, 1,
1.623439, 0.5074396, 2.368857, 1, 0, 0.3843137, 1,
1.632032, 1.501154, 2.362584, 1, 0, 0.3764706, 1,
1.637913, 1.079789, 1.580113, 1, 0, 0.372549, 1,
1.655422, 1.244949, 1.028235, 1, 0, 0.3647059, 1,
1.696458, -0.6677167, 0.8105122, 1, 0, 0.3607843, 1,
1.698647, -1.942755, 2.079167, 1, 0, 0.3529412, 1,
1.715374, -2.324733, 2.479091, 1, 0, 0.3490196, 1,
1.719176, -0.4010968, 2.265827, 1, 0, 0.3411765, 1,
1.719614, 0.704746, 0.1254589, 1, 0, 0.3372549, 1,
1.733725, -0.9640572, 2.414163, 1, 0, 0.3294118, 1,
1.737382, -0.8874173, 0.7863364, 1, 0, 0.3254902, 1,
1.742426, 0.1280075, 0.5183895, 1, 0, 0.3176471, 1,
1.757879, 0.6387186, 3.132424, 1, 0, 0.3137255, 1,
1.761989, 0.4919592, 1.789505, 1, 0, 0.3058824, 1,
1.779014, 0.3278697, 0.6559681, 1, 0, 0.2980392, 1,
1.780442, 0.08679923, 1.617124, 1, 0, 0.2941177, 1,
1.790491, -0.3549818, 2.18787, 1, 0, 0.2862745, 1,
1.797747, 1.033851, 1.477958, 1, 0, 0.282353, 1,
1.802578, -1.267375, 4.094596, 1, 0, 0.2745098, 1,
1.810176, 1.510208, 0.4509024, 1, 0, 0.2705882, 1,
1.810487, -0.01329116, 2.235178, 1, 0, 0.2627451, 1,
1.813909, 0.4373237, 1.564821, 1, 0, 0.2588235, 1,
1.816539, 1.600427, 1.198517, 1, 0, 0.2509804, 1,
1.832445, -0.0138882, 1.299881, 1, 0, 0.2470588, 1,
1.843743, -0.499921, 1.460972, 1, 0, 0.2392157, 1,
1.850447, -0.639205, 2.40697, 1, 0, 0.2352941, 1,
1.850447, -0.4808036, 2.506822, 1, 0, 0.227451, 1,
1.880892, -0.5468073, 3.076169, 1, 0, 0.2235294, 1,
1.88885, 1.570844, 1.040982, 1, 0, 0.2156863, 1,
1.889736, -0.6464803, 4.344314, 1, 0, 0.2117647, 1,
1.915074, -0.1144143, 2.338139, 1, 0, 0.2039216, 1,
1.923648, -0.05256489, 0.3516912, 1, 0, 0.1960784, 1,
1.940094, -0.340809, 1.968789, 1, 0, 0.1921569, 1,
1.944654, -0.2929489, 2.217473, 1, 0, 0.1843137, 1,
1.972219, -1.788217, 1.402695, 1, 0, 0.1803922, 1,
1.983452, 0.9899763, 1.843882, 1, 0, 0.172549, 1,
2.010408, -0.5880734, 2.3492, 1, 0, 0.1686275, 1,
2.016119, -1.035962, 2.45324, 1, 0, 0.1607843, 1,
2.026797, -0.7531639, 0.8063762, 1, 0, 0.1568628, 1,
2.030141, -1.974995, 3.105582, 1, 0, 0.1490196, 1,
2.048224, -0.008218873, 2.422707, 1, 0, 0.145098, 1,
2.061563, 0.09376507, 0.6731357, 1, 0, 0.1372549, 1,
2.103251, -0.07426489, 1.120493, 1, 0, 0.1333333, 1,
2.109081, -0.1796219, 1.360942, 1, 0, 0.1254902, 1,
2.112715, -2.662893, 2.993517, 1, 0, 0.1215686, 1,
2.12875, -0.6424243, 1.115515, 1, 0, 0.1137255, 1,
2.129814, 0.328459, -0.1496796, 1, 0, 0.1098039, 1,
2.140979, -0.3917924, -0.2110771, 1, 0, 0.1019608, 1,
2.199092, 1.263342, 1.670171, 1, 0, 0.09411765, 1,
2.219292, 0.6963289, 1.970671, 1, 0, 0.09019608, 1,
2.263564, 0.735794, 1.384609, 1, 0, 0.08235294, 1,
2.268183, 0.617333, -0.9819999, 1, 0, 0.07843138, 1,
2.301158, 0.3871143, -0.002498467, 1, 0, 0.07058824, 1,
2.308238, 0.2058785, 2.15043, 1, 0, 0.06666667, 1,
2.325239, 1.69425, 3.030569, 1, 0, 0.05882353, 1,
2.349584, -0.02616156, 1.475835, 1, 0, 0.05490196, 1,
2.354307, -0.02552396, 1.924236, 1, 0, 0.04705882, 1,
2.428141, -2.263744, 1.720252, 1, 0, 0.04313726, 1,
2.456262, -0.9642015, 2.796973, 1, 0, 0.03529412, 1,
2.54989, -1.792966, 0.8216167, 1, 0, 0.03137255, 1,
2.719133, -0.461879, 1.917862, 1, 0, 0.02352941, 1,
2.734865, -0.7370464, 3.765804, 1, 0, 0.01960784, 1,
2.87644, -0.7288308, 2.149466, 1, 0, 0.01176471, 1,
3.29788, 0.2287079, 3.442131, 1, 0, 0.007843138, 1
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
0.04090953, -4.251534, -6.70225, 0, -0.5, 0.5, 0.5,
0.04090953, -4.251534, -6.70225, 1, -0.5, 0.5, 0.5,
0.04090953, -4.251534, -6.70225, 1, 1.5, 0.5, 0.5,
0.04090953, -4.251534, -6.70225, 0, 1.5, 0.5, 0.5
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
-4.320174, 0.0005807877, -6.70225, 0, -0.5, 0.5, 0.5,
-4.320174, 0.0005807877, -6.70225, 1, -0.5, 0.5, 0.5,
-4.320174, 0.0005807877, -6.70225, 1, 1.5, 0.5, 0.5,
-4.320174, 0.0005807877, -6.70225, 0, 1.5, 0.5, 0.5
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
-4.320174, -4.251534, 0.5243649, 0, -0.5, 0.5, 0.5,
-4.320174, -4.251534, 0.5243649, 1, -0.5, 0.5, 0.5,
-4.320174, -4.251534, 0.5243649, 1, 1.5, 0.5, 0.5,
-4.320174, -4.251534, 0.5243649, 0, 1.5, 0.5, 0.5
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
-3, -3.270277, -5.03457,
3, -3.270277, -5.03457,
-3, -3.270277, -5.03457,
-3, -3.43382, -5.312517,
-2, -3.270277, -5.03457,
-2, -3.43382, -5.312517,
-1, -3.270277, -5.03457,
-1, -3.43382, -5.312517,
0, -3.270277, -5.03457,
0, -3.43382, -5.312517,
1, -3.270277, -5.03457,
1, -3.43382, -5.312517,
2, -3.270277, -5.03457,
2, -3.43382, -5.312517,
3, -3.270277, -5.03457,
3, -3.43382, -5.312517
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
-3, -3.760906, -5.86841, 0, -0.5, 0.5, 0.5,
-3, -3.760906, -5.86841, 1, -0.5, 0.5, 0.5,
-3, -3.760906, -5.86841, 1, 1.5, 0.5, 0.5,
-3, -3.760906, -5.86841, 0, 1.5, 0.5, 0.5,
-2, -3.760906, -5.86841, 0, -0.5, 0.5, 0.5,
-2, -3.760906, -5.86841, 1, -0.5, 0.5, 0.5,
-2, -3.760906, -5.86841, 1, 1.5, 0.5, 0.5,
-2, -3.760906, -5.86841, 0, 1.5, 0.5, 0.5,
-1, -3.760906, -5.86841, 0, -0.5, 0.5, 0.5,
-1, -3.760906, -5.86841, 1, -0.5, 0.5, 0.5,
-1, -3.760906, -5.86841, 1, 1.5, 0.5, 0.5,
-1, -3.760906, -5.86841, 0, 1.5, 0.5, 0.5,
0, -3.760906, -5.86841, 0, -0.5, 0.5, 0.5,
0, -3.760906, -5.86841, 1, -0.5, 0.5, 0.5,
0, -3.760906, -5.86841, 1, 1.5, 0.5, 0.5,
0, -3.760906, -5.86841, 0, 1.5, 0.5, 0.5,
1, -3.760906, -5.86841, 0, -0.5, 0.5, 0.5,
1, -3.760906, -5.86841, 1, -0.5, 0.5, 0.5,
1, -3.760906, -5.86841, 1, 1.5, 0.5, 0.5,
1, -3.760906, -5.86841, 0, 1.5, 0.5, 0.5,
2, -3.760906, -5.86841, 0, -0.5, 0.5, 0.5,
2, -3.760906, -5.86841, 1, -0.5, 0.5, 0.5,
2, -3.760906, -5.86841, 1, 1.5, 0.5, 0.5,
2, -3.760906, -5.86841, 0, 1.5, 0.5, 0.5,
3, -3.760906, -5.86841, 0, -0.5, 0.5, 0.5,
3, -3.760906, -5.86841, 1, -0.5, 0.5, 0.5,
3, -3.760906, -5.86841, 1, 1.5, 0.5, 0.5,
3, -3.760906, -5.86841, 0, 1.5, 0.5, 0.5
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
-3.31377, -3, -5.03457,
-3.31377, 3, -5.03457,
-3.31377, -3, -5.03457,
-3.481504, -3, -5.312517,
-3.31377, -2, -5.03457,
-3.481504, -2, -5.312517,
-3.31377, -1, -5.03457,
-3.481504, -1, -5.312517,
-3.31377, 0, -5.03457,
-3.481504, 0, -5.312517,
-3.31377, 1, -5.03457,
-3.481504, 1, -5.312517,
-3.31377, 2, -5.03457,
-3.481504, 2, -5.312517,
-3.31377, 3, -5.03457,
-3.481504, 3, -5.312517
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
-3.816972, -3, -5.86841, 0, -0.5, 0.5, 0.5,
-3.816972, -3, -5.86841, 1, -0.5, 0.5, 0.5,
-3.816972, -3, -5.86841, 1, 1.5, 0.5, 0.5,
-3.816972, -3, -5.86841, 0, 1.5, 0.5, 0.5,
-3.816972, -2, -5.86841, 0, -0.5, 0.5, 0.5,
-3.816972, -2, -5.86841, 1, -0.5, 0.5, 0.5,
-3.816972, -2, -5.86841, 1, 1.5, 0.5, 0.5,
-3.816972, -2, -5.86841, 0, 1.5, 0.5, 0.5,
-3.816972, -1, -5.86841, 0, -0.5, 0.5, 0.5,
-3.816972, -1, -5.86841, 1, -0.5, 0.5, 0.5,
-3.816972, -1, -5.86841, 1, 1.5, 0.5, 0.5,
-3.816972, -1, -5.86841, 0, 1.5, 0.5, 0.5,
-3.816972, 0, -5.86841, 0, -0.5, 0.5, 0.5,
-3.816972, 0, -5.86841, 1, -0.5, 0.5, 0.5,
-3.816972, 0, -5.86841, 1, 1.5, 0.5, 0.5,
-3.816972, 0, -5.86841, 0, 1.5, 0.5, 0.5,
-3.816972, 1, -5.86841, 0, -0.5, 0.5, 0.5,
-3.816972, 1, -5.86841, 1, -0.5, 0.5, 0.5,
-3.816972, 1, -5.86841, 1, 1.5, 0.5, 0.5,
-3.816972, 1, -5.86841, 0, 1.5, 0.5, 0.5,
-3.816972, 2, -5.86841, 0, -0.5, 0.5, 0.5,
-3.816972, 2, -5.86841, 1, -0.5, 0.5, 0.5,
-3.816972, 2, -5.86841, 1, 1.5, 0.5, 0.5,
-3.816972, 2, -5.86841, 0, 1.5, 0.5, 0.5,
-3.816972, 3, -5.86841, 0, -0.5, 0.5, 0.5,
-3.816972, 3, -5.86841, 1, -0.5, 0.5, 0.5,
-3.816972, 3, -5.86841, 1, 1.5, 0.5, 0.5,
-3.816972, 3, -5.86841, 0, 1.5, 0.5, 0.5
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
-3.31377, -3.270277, -4,
-3.31377, -3.270277, 4,
-3.31377, -3.270277, -4,
-3.481504, -3.43382, -4,
-3.31377, -3.270277, -2,
-3.481504, -3.43382, -2,
-3.31377, -3.270277, 0,
-3.481504, -3.43382, 0,
-3.31377, -3.270277, 2,
-3.481504, -3.43382, 2,
-3.31377, -3.270277, 4,
-3.481504, -3.43382, 4
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
-3.816972, -3.760906, -4, 0, -0.5, 0.5, 0.5,
-3.816972, -3.760906, -4, 1, -0.5, 0.5, 0.5,
-3.816972, -3.760906, -4, 1, 1.5, 0.5, 0.5,
-3.816972, -3.760906, -4, 0, 1.5, 0.5, 0.5,
-3.816972, -3.760906, -2, 0, -0.5, 0.5, 0.5,
-3.816972, -3.760906, -2, 1, -0.5, 0.5, 0.5,
-3.816972, -3.760906, -2, 1, 1.5, 0.5, 0.5,
-3.816972, -3.760906, -2, 0, 1.5, 0.5, 0.5,
-3.816972, -3.760906, 0, 0, -0.5, 0.5, 0.5,
-3.816972, -3.760906, 0, 1, -0.5, 0.5, 0.5,
-3.816972, -3.760906, 0, 1, 1.5, 0.5, 0.5,
-3.816972, -3.760906, 0, 0, 1.5, 0.5, 0.5,
-3.816972, -3.760906, 2, 0, -0.5, 0.5, 0.5,
-3.816972, -3.760906, 2, 1, -0.5, 0.5, 0.5,
-3.816972, -3.760906, 2, 1, 1.5, 0.5, 0.5,
-3.816972, -3.760906, 2, 0, 1.5, 0.5, 0.5,
-3.816972, -3.760906, 4, 0, -0.5, 0.5, 0.5,
-3.816972, -3.760906, 4, 1, -0.5, 0.5, 0.5,
-3.816972, -3.760906, 4, 1, 1.5, 0.5, 0.5,
-3.816972, -3.760906, 4, 0, 1.5, 0.5, 0.5
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
-3.31377, -3.270277, -5.03457,
-3.31377, 3.271439, -5.03457,
-3.31377, -3.270277, 6.0833,
-3.31377, 3.271439, 6.0833,
-3.31377, -3.270277, -5.03457,
-3.31377, -3.270277, 6.0833,
-3.31377, 3.271439, -5.03457,
-3.31377, 3.271439, 6.0833,
-3.31377, -3.270277, -5.03457,
3.395589, -3.270277, -5.03457,
-3.31377, -3.270277, 6.0833,
3.395589, -3.270277, 6.0833,
-3.31377, 3.271439, -5.03457,
3.395589, 3.271439, -5.03457,
-3.31377, 3.271439, 6.0833,
3.395589, 3.271439, 6.0833,
3.395589, -3.270277, -5.03457,
3.395589, 3.271439, -5.03457,
3.395589, -3.270277, 6.0833,
3.395589, 3.271439, 6.0833,
3.395589, -3.270277, -5.03457,
3.395589, -3.270277, 6.0833,
3.395589, 3.271439, -5.03457,
3.395589, 3.271439, 6.0833
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
var radius = 7.764169;
var distance = 34.54367;
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
mvMatrix.translate( -0.04090953, -0.0005807877, -0.5243649 );
mvMatrix.scale( 1.251203, 1.283268, 0.7550701 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54367);
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
trifluralin<-read.table("trifluralin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trifluralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'trifluralin' not found
```

```r
y<-trifluralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'trifluralin' not found
```

```r
z<-trifluralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'trifluralin' not found
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
-3.216061, -0.9114721, -3.127218, 0, 0, 1, 1, 1,
-2.600776, -1.019748, -1.562423, 1, 0, 0, 1, 1,
-2.528097, 0.3775073, -2.080755, 1, 0, 0, 1, 1,
-2.501437, -2.224519, -3.140841, 1, 0, 0, 1, 1,
-2.49833, 1.785334, -1.10246, 1, 0, 0, 1, 1,
-2.446357, 0.9050702, -2.84632, 1, 0, 0, 1, 1,
-2.439442, 1.425714, -0.8801067, 0, 0, 0, 1, 1,
-2.413728, -1.157349, -2.300203, 0, 0, 0, 1, 1,
-2.388944, 1.228393, -1.593129, 0, 0, 0, 1, 1,
-2.329948, -0.1307829, -2.18738, 0, 0, 0, 1, 1,
-2.304724, 1.271353, -2.034736, 0, 0, 0, 1, 1,
-2.262995, 1.376552, -1.7992, 0, 0, 0, 1, 1,
-2.253628, 1.051072, -0.6146775, 0, 0, 0, 1, 1,
-2.237692, -0.2709254, -3.118436, 1, 1, 1, 1, 1,
-2.157368, 1.576076, 0.03998737, 1, 1, 1, 1, 1,
-2.110146, 0.7547477, -2.20198, 1, 1, 1, 1, 1,
-2.106427, -0.7356957, -3.241958, 1, 1, 1, 1, 1,
-2.102732, -1.139687, 0.6220627, 1, 1, 1, 1, 1,
-2.032942, -0.05039981, -2.018142, 1, 1, 1, 1, 1,
-2.016137, -1.618926, -4.807341, 1, 1, 1, 1, 1,
-2.013591, 1.638872, -0.738297, 1, 1, 1, 1, 1,
-1.962975, 1.332078, -0.01431662, 1, 1, 1, 1, 1,
-1.949564, -0.4765075, -2.658202, 1, 1, 1, 1, 1,
-1.947497, 0.3284937, -0.786813, 1, 1, 1, 1, 1,
-1.925475, -0.05965282, -1.308612, 1, 1, 1, 1, 1,
-1.920575, 0.9739929, -2.065286, 1, 1, 1, 1, 1,
-1.917014, 1.004362, -1.216937, 1, 1, 1, 1, 1,
-1.885888, -1.5103, -1.560426, 1, 1, 1, 1, 1,
-1.864164, 0.5456709, -2.46213, 0, 0, 1, 1, 1,
-1.846136, 1.081881, -1.667381, 1, 0, 0, 1, 1,
-1.838088, 1.140035, -1.024066, 1, 0, 0, 1, 1,
-1.830318, -0.3148484, -2.067721, 1, 0, 0, 1, 1,
-1.811149, 1.318965, -1.050307, 1, 0, 0, 1, 1,
-1.792618, -0.8647735, -1.187376, 1, 0, 0, 1, 1,
-1.778338, 1.296734, -1.137267, 0, 0, 0, 1, 1,
-1.775318, -1.197688, -3.463631, 0, 0, 0, 1, 1,
-1.770766, 0.5878539, -2.86653, 0, 0, 0, 1, 1,
-1.768549, 0.05113575, -0.8551511, 0, 0, 0, 1, 1,
-1.767936, -0.2351168, -1.754273, 0, 0, 0, 1, 1,
-1.765362, 0.954001, -1.518371, 0, 0, 0, 1, 1,
-1.745056, 1.818863, -0.8389582, 0, 0, 0, 1, 1,
-1.727055, -0.7673194, -1.766691, 1, 1, 1, 1, 1,
-1.716271, -0.3542221, -1.771796, 1, 1, 1, 1, 1,
-1.70985, 0.8561231, -0.9678337, 1, 1, 1, 1, 1,
-1.704437, 0.2034501, -2.235423, 1, 1, 1, 1, 1,
-1.683076, 1.104593, 0.04969667, 1, 1, 1, 1, 1,
-1.670759, 0.3480301, -0.6254457, 1, 1, 1, 1, 1,
-1.667206, -0.9495071, -2.173389, 1, 1, 1, 1, 1,
-1.648854, 0.8837282, -1.463349, 1, 1, 1, 1, 1,
-1.644733, 0.9059394, -0.7818645, 1, 1, 1, 1, 1,
-1.640607, 1.416424, -0.268395, 1, 1, 1, 1, 1,
-1.635895, 1.392386, -1.232149, 1, 1, 1, 1, 1,
-1.627703, 0.5929049, -3.669321, 1, 1, 1, 1, 1,
-1.613676, -0.6363191, -0.9808744, 1, 1, 1, 1, 1,
-1.605798, -0.6978593, -1.434167, 1, 1, 1, 1, 1,
-1.588434, -0.6297997, -1.275882, 1, 1, 1, 1, 1,
-1.564114, -0.7134247, -1.598586, 0, 0, 1, 1, 1,
-1.55936, -0.3210575, -3.820344, 1, 0, 0, 1, 1,
-1.538781, 2.501555, -1.05641, 1, 0, 0, 1, 1,
-1.538229, -0.1941388, -3.72241, 1, 0, 0, 1, 1,
-1.537087, -1.74204, -1.001421, 1, 0, 0, 1, 1,
-1.535167, -2.985998, -2.117288, 1, 0, 0, 1, 1,
-1.533199, -0.1861332, -3.228378, 0, 0, 0, 1, 1,
-1.520482, 1.737262, -3.116416, 0, 0, 0, 1, 1,
-1.519324, 1.242138, -0.6809196, 0, 0, 0, 1, 1,
-1.514742, 0.9188836, 0.7517424, 0, 0, 0, 1, 1,
-1.51432, 1.589441, -1.024929, 0, 0, 0, 1, 1,
-1.508318, -0.1479712, -2.276162, 0, 0, 0, 1, 1,
-1.502554, -2.007, -3.018595, 0, 0, 0, 1, 1,
-1.501597, 0.6179663, -1.810424, 1, 1, 1, 1, 1,
-1.494515, -1.123143, -1.67523, 1, 1, 1, 1, 1,
-1.492528, -1.334422, -3.429111, 1, 1, 1, 1, 1,
-1.487216, 0.06032259, -0.8798993, 1, 1, 1, 1, 1,
-1.469561, -0.2739725, -3.419814, 1, 1, 1, 1, 1,
-1.46251, 1.196286, -0.02938114, 1, 1, 1, 1, 1,
-1.45894, 2.860181, -1.637403, 1, 1, 1, 1, 1,
-1.441575, 0.5165015, -2.295632, 1, 1, 1, 1, 1,
-1.438305, -0.6837765, -3.097257, 1, 1, 1, 1, 1,
-1.436762, -0.9636793, -1.995241, 1, 1, 1, 1, 1,
-1.433576, 0.5399876, 0.2171724, 1, 1, 1, 1, 1,
-1.421742, -1.076797, -1.622411, 1, 1, 1, 1, 1,
-1.418824, -0.07406209, -1.748041, 1, 1, 1, 1, 1,
-1.416156, 1.476427, 0.05903397, 1, 1, 1, 1, 1,
-1.407907, -1.819078, -1.983703, 1, 1, 1, 1, 1,
-1.394137, 0.6851818, -0.2919099, 0, 0, 1, 1, 1,
-1.38661, 0.1739726, -2.448666, 1, 0, 0, 1, 1,
-1.384275, 0.3079364, -1.653618, 1, 0, 0, 1, 1,
-1.37903, -0.1647014, -1.831414, 1, 0, 0, 1, 1,
-1.375601, 0.2777148, -2.438196, 1, 0, 0, 1, 1,
-1.375461, 1.08654, -1.537347, 1, 0, 0, 1, 1,
-1.373794, 0.7879537, -2.620552, 0, 0, 0, 1, 1,
-1.369652, 0.06677455, -0.289588, 0, 0, 0, 1, 1,
-1.353181, 1.268222, 0.7155871, 0, 0, 0, 1, 1,
-1.34846, 0.747439, 0.01193195, 0, 0, 0, 1, 1,
-1.343118, 0.1363937, -2.509177, 0, 0, 0, 1, 1,
-1.339496, -0.5720574, -2.245802, 0, 0, 0, 1, 1,
-1.31449, 2.08417, 0.4702917, 0, 0, 0, 1, 1,
-1.305184, -0.04311644, -1.869234, 1, 1, 1, 1, 1,
-1.295255, -0.9922043, -0.5890408, 1, 1, 1, 1, 1,
-1.287365, -0.1285393, -2.740594, 1, 1, 1, 1, 1,
-1.282163, -0.8580959, -2.771806, 1, 1, 1, 1, 1,
-1.275243, -0.3209552, -3.626618, 1, 1, 1, 1, 1,
-1.27256, 0.7056702, -1.00422, 1, 1, 1, 1, 1,
-1.269587, 1.050239, -0.6566588, 1, 1, 1, 1, 1,
-1.25964, -0.008116079, -1.603835, 1, 1, 1, 1, 1,
-1.24666, -0.9752761, -3.754299, 1, 1, 1, 1, 1,
-1.245658, -0.3608153, -1.751459, 1, 1, 1, 1, 1,
-1.241159, -0.1332328, -0.1943228, 1, 1, 1, 1, 1,
-1.234718, -0.429241, -2.601873, 1, 1, 1, 1, 1,
-1.224219, -0.6482545, -2.082325, 1, 1, 1, 1, 1,
-1.213703, 2.420323, 0.4159735, 1, 1, 1, 1, 1,
-1.207581, -1.784758, -4.125988, 1, 1, 1, 1, 1,
-1.202563, 0.7386434, -1.47328, 0, 0, 1, 1, 1,
-1.201201, -0.5708091, -2.498423, 1, 0, 0, 1, 1,
-1.19579, 1.419363, -0.2000787, 1, 0, 0, 1, 1,
-1.191959, 0.5357144, -0.9666324, 1, 0, 0, 1, 1,
-1.189656, 0.9847808, 0.5792495, 1, 0, 0, 1, 1,
-1.174846, -1.076515, -0.8083653, 1, 0, 0, 1, 1,
-1.170551, -0.5070836, -2.275282, 0, 0, 0, 1, 1,
-1.168864, 0.9592027, -2.305865, 0, 0, 0, 1, 1,
-1.160779, 0.5920835, -0.1866845, 0, 0, 0, 1, 1,
-1.155523, -0.7241855, -1.089096, 0, 0, 0, 1, 1,
-1.153763, 0.2648846, -3.127331, 0, 0, 0, 1, 1,
-1.152408, 1.388051, -0.9861692, 0, 0, 0, 1, 1,
-1.149639, 0.1902092, -1.435204, 0, 0, 0, 1, 1,
-1.14604, 2.01589, -0.9325534, 1, 1, 1, 1, 1,
-1.142919, 0.7518138, -0.7928599, 1, 1, 1, 1, 1,
-1.140503, -0.6252354, -0.7891977, 1, 1, 1, 1, 1,
-1.11871, -0.1835667, -2.646367, 1, 1, 1, 1, 1,
-1.116984, 0.03301229, -1.309657, 1, 1, 1, 1, 1,
-1.109059, -0.3557974, -1.639104, 1, 1, 1, 1, 1,
-1.106975, -0.1968616, -0.1636138, 1, 1, 1, 1, 1,
-1.106712, 0.1189589, -3.184929, 1, 1, 1, 1, 1,
-1.106324, -0.3535306, -1.335854, 1, 1, 1, 1, 1,
-1.103553, -1.624107, -1.911687, 1, 1, 1, 1, 1,
-1.102952, -0.1959758, -1.349743, 1, 1, 1, 1, 1,
-1.10258, 1.321538, -0.4004852, 1, 1, 1, 1, 1,
-1.101399, -1.704418, -2.836968, 1, 1, 1, 1, 1,
-1.099461, 0.7862219, -2.337187, 1, 1, 1, 1, 1,
-1.097971, -0.5642834, -1.019941, 1, 1, 1, 1, 1,
-1.096894, -0.8367702, -2.50414, 0, 0, 1, 1, 1,
-1.082684, -0.384775, -0.9777355, 1, 0, 0, 1, 1,
-1.081605, 0.1461288, -0.4610075, 1, 0, 0, 1, 1,
-1.080297, -0.815899, -3.259871, 1, 0, 0, 1, 1,
-1.079749, -1.409467, -3.089308, 1, 0, 0, 1, 1,
-1.067403, -0.7654899, -0.8695498, 1, 0, 0, 1, 1,
-1.066374, -1.005471, -2.861919, 0, 0, 0, 1, 1,
-1.064305, -1.983465, -2.886364, 0, 0, 0, 1, 1,
-1.056082, -2.083786, -0.2710617, 0, 0, 0, 1, 1,
-1.055412, 1.895042, 0.2091481, 0, 0, 0, 1, 1,
-1.049359, 0.7086844, -1.542252, 0, 0, 0, 1, 1,
-1.046107, -1.844628, -2.688582, 0, 0, 0, 1, 1,
-1.03995, 0.6906797, -1.18066, 0, 0, 0, 1, 1,
-1.02562, -1.855309, -3.329839, 1, 1, 1, 1, 1,
-1.021649, -1.496495, -0.9364903, 1, 1, 1, 1, 1,
-1.020993, 0.9503166, -1.659379, 1, 1, 1, 1, 1,
-1.019357, 0.729022, -1.990181, 1, 1, 1, 1, 1,
-1.008778, 2.540292, 0.7439119, 1, 1, 1, 1, 1,
-1.002928, -0.2277415, -3.350561, 1, 1, 1, 1, 1,
-0.9969929, -0.292061, -2.89089, 1, 1, 1, 1, 1,
-0.9911945, -0.1125073, -0.2536052, 1, 1, 1, 1, 1,
-0.9877662, 0.7483951, -1.985867, 1, 1, 1, 1, 1,
-0.9861756, 0.3723895, -0.6336311, 1, 1, 1, 1, 1,
-0.985917, -0.08835337, -1.657779, 1, 1, 1, 1, 1,
-0.9839517, -0.364706, -1.528837, 1, 1, 1, 1, 1,
-0.9768142, -1.680897, -1.442436, 1, 1, 1, 1, 1,
-0.9700174, 0.05893321, -0.8085417, 1, 1, 1, 1, 1,
-0.9636728, 0.6832056, -0.8145646, 1, 1, 1, 1, 1,
-0.9580072, -2.367154, -1.815303, 0, 0, 1, 1, 1,
-0.9460351, 1.015023, -0.1531278, 1, 0, 0, 1, 1,
-0.9320668, -0.3810543, -2.486409, 1, 0, 0, 1, 1,
-0.9115143, 0.2930294, -2.022617, 1, 0, 0, 1, 1,
-0.9111389, 1.123281, -0.34635, 1, 0, 0, 1, 1,
-0.910448, 0.1968082, -1.272319, 1, 0, 0, 1, 1,
-0.8995619, 2.023363, -0.6433877, 0, 0, 0, 1, 1,
-0.8921109, 1.420239, -2.397313, 0, 0, 0, 1, 1,
-0.8919458, 1.487589, -1.558663, 0, 0, 0, 1, 1,
-0.8900709, -1.737396, -2.069323, 0, 0, 0, 1, 1,
-0.8892997, 0.5082293, -0.4168835, 0, 0, 0, 1, 1,
-0.8736917, -1.521028, -3.741082, 0, 0, 0, 1, 1,
-0.8690891, 1.440014, -0.9521785, 0, 0, 0, 1, 1,
-0.8671395, 0.04658682, -0.7204474, 1, 1, 1, 1, 1,
-0.8656161, -0.2405165, -3.514035, 1, 1, 1, 1, 1,
-0.854485, 0.7354037, -0.1524319, 1, 1, 1, 1, 1,
-0.852012, -0.73423, -3.000597, 1, 1, 1, 1, 1,
-0.8516977, -0.1486017, -0.7937037, 1, 1, 1, 1, 1,
-0.8514043, -1.661422, -2.48674, 1, 1, 1, 1, 1,
-0.850441, 0.08859538, -2.570701, 1, 1, 1, 1, 1,
-0.8466425, 0.0903564, -1.166634, 1, 1, 1, 1, 1,
-0.8396234, 0.9303252, -0.1032782, 1, 1, 1, 1, 1,
-0.8395501, 0.150714, -0.8391989, 1, 1, 1, 1, 1,
-0.8395422, 1.732973, -0.639132, 1, 1, 1, 1, 1,
-0.8333881, 0.4565004, -0.214396, 1, 1, 1, 1, 1,
-0.8326476, 1.687166, -0.9322498, 1, 1, 1, 1, 1,
-0.8324795, -0.9898098, -2.645217, 1, 1, 1, 1, 1,
-0.8272884, -1.649076, -4.286541, 1, 1, 1, 1, 1,
-0.8227509, -0.5419871, -0.1355811, 0, 0, 1, 1, 1,
-0.821388, 0.4137343, -1.559789, 1, 0, 0, 1, 1,
-0.8208823, -0.8040343, -2.421964, 1, 0, 0, 1, 1,
-0.8167389, 0.1237693, -1.244531, 1, 0, 0, 1, 1,
-0.815658, -0.5447022, -1.676664, 1, 0, 0, 1, 1,
-0.8084726, -0.5155202, -4.565213, 1, 0, 0, 1, 1,
-0.8078774, 0.2752406, -0.8220018, 0, 0, 0, 1, 1,
-0.8045042, -0.08126601, -1.767799, 0, 0, 0, 1, 1,
-0.7948068, -0.4450822, -2.467007, 0, 0, 0, 1, 1,
-0.7930226, -1.322462, -2.695633, 0, 0, 0, 1, 1,
-0.7928388, -1.068871, -1.960717, 0, 0, 0, 1, 1,
-0.7922119, -0.2780083, -2.364473, 0, 0, 0, 1, 1,
-0.7880923, -0.6932729, -1.866489, 0, 0, 0, 1, 1,
-0.7877769, 1.639413, -0.4581124, 1, 1, 1, 1, 1,
-0.779807, 0.589845, -2.021391, 1, 1, 1, 1, 1,
-0.7572147, -0.9017937, -2.094982, 1, 1, 1, 1, 1,
-0.7521289, 0.01681392, -0.780203, 1, 1, 1, 1, 1,
-0.7491691, -0.1451198, -3.173615, 1, 1, 1, 1, 1,
-0.7451199, -0.006601885, -0.2544737, 1, 1, 1, 1, 1,
-0.7437416, -1.191311, -1.960494, 1, 1, 1, 1, 1,
-0.7429879, 1.476709, 0.2833863, 1, 1, 1, 1, 1,
-0.7417285, -0.4615697, -1.057485, 1, 1, 1, 1, 1,
-0.7405939, 0.1890026, -0.2492496, 1, 1, 1, 1, 1,
-0.7379832, -0.8102957, -3.207837, 1, 1, 1, 1, 1,
-0.7372488, -1.073636, -2.748864, 1, 1, 1, 1, 1,
-0.7343723, -1.328967, -2.17451, 1, 1, 1, 1, 1,
-0.7334858, 0.5923822, 1.018269, 1, 1, 1, 1, 1,
-0.7258999, -0.03067964, 0.9162473, 1, 1, 1, 1, 1,
-0.7213487, 0.1586717, -0.954518, 0, 0, 1, 1, 1,
-0.7183834, -0.4965499, -1.717156, 1, 0, 0, 1, 1,
-0.7154504, 0.8041095, -0.5432326, 1, 0, 0, 1, 1,
-0.7136481, 0.8106959, -0.6078299, 1, 0, 0, 1, 1,
-0.711394, 0.2280186, -1.623725, 1, 0, 0, 1, 1,
-0.7092232, 1.140654, -0.2723598, 1, 0, 0, 1, 1,
-0.7075052, 0.2740765, -1.977755, 0, 0, 0, 1, 1,
-0.7001776, 0.04805667, -0.5531989, 0, 0, 0, 1, 1,
-0.6997369, -0.07681603, -1.62205, 0, 0, 0, 1, 1,
-0.6977875, -0.4252937, -2.379379, 0, 0, 0, 1, 1,
-0.6971529, 3.079221, 1.823775, 0, 0, 0, 1, 1,
-0.6944945, 0.1301281, -0.2108919, 0, 0, 0, 1, 1,
-0.6840143, -0.5822996, -4.230646, 0, 0, 0, 1, 1,
-0.6813955, -0.3158302, -2.48998, 1, 1, 1, 1, 1,
-0.6783478, 0.1630557, -0.968631, 1, 1, 1, 1, 1,
-0.6780205, -1.020837, -3.389895, 1, 1, 1, 1, 1,
-0.6733168, -0.5724729, -3.844435, 1, 1, 1, 1, 1,
-0.6730788, -2.013624, -2.331999, 1, 1, 1, 1, 1,
-0.6702929, 1.680126, 0.09795476, 1, 1, 1, 1, 1,
-0.669719, -0.7993453, -2.853315, 1, 1, 1, 1, 1,
-0.6694558, 2.513797, 0.6428832, 1, 1, 1, 1, 1,
-0.6636326, 0.9645329, -1.629584, 1, 1, 1, 1, 1,
-0.6607779, 0.2750125, -2.187138, 1, 1, 1, 1, 1,
-0.6597149, -0.8126912, -2.090992, 1, 1, 1, 1, 1,
-0.6534688, 0.4579034, -1.615126, 1, 1, 1, 1, 1,
-0.6485646, -1.77913, -3.783668, 1, 1, 1, 1, 1,
-0.646404, -0.5679499, -2.877587, 1, 1, 1, 1, 1,
-0.646099, 0.8317478, -2.066868, 1, 1, 1, 1, 1,
-0.6449475, 1.167301, -0.9012874, 0, 0, 1, 1, 1,
-0.6447539, 0.5535836, 0.7736784, 1, 0, 0, 1, 1,
-0.6358865, -0.5589995, -1.279607, 1, 0, 0, 1, 1,
-0.6338238, 0.3710862, -1.929882, 1, 0, 0, 1, 1,
-0.6319321, -0.4228958, -1.279934, 1, 0, 0, 1, 1,
-0.6315584, 0.7306357, -2.632591, 1, 0, 0, 1, 1,
-0.6265148, 0.8360332, -1.468506, 0, 0, 0, 1, 1,
-0.6176468, -0.4746692, -2.473908, 0, 0, 0, 1, 1,
-0.6059235, 2.135458, -0.3516743, 0, 0, 0, 1, 1,
-0.6052572, 1.092241, -2.27751, 0, 0, 0, 1, 1,
-0.6047848, -1.043972, -4.872659, 0, 0, 0, 1, 1,
-0.5993496, -1.135562, -1.654039, 0, 0, 0, 1, 1,
-0.598676, 1.115984, -1.749487, 0, 0, 0, 1, 1,
-0.5949942, 1.05637, 1.692114, 1, 1, 1, 1, 1,
-0.59184, 0.144014, -1.131414, 1, 1, 1, 1, 1,
-0.5860726, -0.4321986, -2.680827, 1, 1, 1, 1, 1,
-0.5842167, -0.8167273, -0.9566068, 1, 1, 1, 1, 1,
-0.5828287, 0.3223779, -0.521304, 1, 1, 1, 1, 1,
-0.5813314, 0.5301494, -1.35162, 1, 1, 1, 1, 1,
-0.5760413, 0.1801797, -1.490445, 1, 1, 1, 1, 1,
-0.5754058, -0.580625, -3.433279, 1, 1, 1, 1, 1,
-0.5675203, 0.5592897, -0.7232355, 1, 1, 1, 1, 1,
-0.5599222, 3.146621, 1.208488, 1, 1, 1, 1, 1,
-0.5587714, 0.7882997, -0.1956482, 1, 1, 1, 1, 1,
-0.5571226, 0.3886116, -1.568094, 1, 1, 1, 1, 1,
-0.5505447, 1.010988, 0.1331819, 1, 1, 1, 1, 1,
-0.5493327, -1.490183, -2.310694, 1, 1, 1, 1, 1,
-0.5457219, 0.9269912, -1.91138, 1, 1, 1, 1, 1,
-0.5448739, -1.463466, -2.359384, 0, 0, 1, 1, 1,
-0.5430099, -0.7891095, -1.922254, 1, 0, 0, 1, 1,
-0.5416055, 0.3091805, 0.05688611, 1, 0, 0, 1, 1,
-0.5416005, -1.288065, -4.276594, 1, 0, 0, 1, 1,
-0.5302761, -2.105773, -2.543575, 1, 0, 0, 1, 1,
-0.5262493, -0.9017496, -2.698422, 1, 0, 0, 1, 1,
-0.5206402, -0.3184133, -3.36014, 0, 0, 0, 1, 1,
-0.5190826, 0.2949938, 0.06014417, 0, 0, 0, 1, 1,
-0.5156551, -2.504696, -2.689208, 0, 0, 0, 1, 1,
-0.512877, -0.1175916, -3.993971, 0, 0, 0, 1, 1,
-0.5122129, -0.248169, -2.64747, 0, 0, 0, 1, 1,
-0.5121127, -0.03931995, -1.141772, 0, 0, 0, 1, 1,
-0.5111103, 1.028737, 0.0433588, 0, 0, 0, 1, 1,
-0.5043607, 1.660783, -0.001128345, 1, 1, 1, 1, 1,
-0.4983062, 0.6301375, -0.6183797, 1, 1, 1, 1, 1,
-0.4956812, -0.03682932, 0.5190996, 1, 1, 1, 1, 1,
-0.495293, 0.7437403, 0.3007266, 1, 1, 1, 1, 1,
-0.4916631, 0.4367369, -1.349793, 1, 1, 1, 1, 1,
-0.4897739, -0.6764836, -1.765825, 1, 1, 1, 1, 1,
-0.4864227, -0.327285, -2.305666, 1, 1, 1, 1, 1,
-0.4805888, 1.393822, -1.287591, 1, 1, 1, 1, 1,
-0.4787926, -1.568392, -2.533641, 1, 1, 1, 1, 1,
-0.4749194, 0.9924735, 0.5395911, 1, 1, 1, 1, 1,
-0.4690887, -0.1185542, -3.010072, 1, 1, 1, 1, 1,
-0.465529, -1.241664, -2.250263, 1, 1, 1, 1, 1,
-0.4617797, 0.3836462, 0.5539632, 1, 1, 1, 1, 1,
-0.4602534, 1.213501, -1.208842, 1, 1, 1, 1, 1,
-0.458548, -0.02816392, -2.650592, 1, 1, 1, 1, 1,
-0.4569801, 0.2865129, -0.321808, 0, 0, 1, 1, 1,
-0.4511622, 0.04684283, -1.399052, 1, 0, 0, 1, 1,
-0.4506539, 0.4519018, -1.267676, 1, 0, 0, 1, 1,
-0.4501889, 0.6056146, 0.2657928, 1, 0, 0, 1, 1,
-0.4493988, -0.02990557, -3.519881, 1, 0, 0, 1, 1,
-0.4467, 1.1269, -2.057056, 1, 0, 0, 1, 1,
-0.444844, -0.2126105, -2.761108, 0, 0, 0, 1, 1,
-0.4445316, -0.7853878, -2.939068, 0, 0, 0, 1, 1,
-0.4419034, -0.3369995, -2.439548, 0, 0, 0, 1, 1,
-0.4395838, -0.1477571, -2.159276, 0, 0, 0, 1, 1,
-0.4362763, 1.436071, -0.6239554, 0, 0, 0, 1, 1,
-0.4230921, 1.052811, -0.4990809, 0, 0, 0, 1, 1,
-0.4218858, -1.090823, -3.748126, 0, 0, 0, 1, 1,
-0.4176549, 0.01286581, -1.906238, 1, 1, 1, 1, 1,
-0.415182, -0.7005609, -2.933462, 1, 1, 1, 1, 1,
-0.413955, 0.02362676, -2.730725, 1, 1, 1, 1, 1,
-0.4105439, -2.084249, -2.320613, 1, 1, 1, 1, 1,
-0.4014263, -1.156298, -2.66563, 1, 1, 1, 1, 1,
-0.3997878, 1.092811, -1.93156, 1, 1, 1, 1, 1,
-0.3985138, 1.198745, -1.805174, 1, 1, 1, 1, 1,
-0.3984939, 0.9748155, -2.100188, 1, 1, 1, 1, 1,
-0.3954118, -0.637271, -3.302685, 1, 1, 1, 1, 1,
-0.3924826, -1.263591, -3.017409, 1, 1, 1, 1, 1,
-0.3917042, 0.9910511, 0.1735017, 1, 1, 1, 1, 1,
-0.3832371, 1.162589, 1.82302, 1, 1, 1, 1, 1,
-0.3777832, -0.8698614, -2.925299, 1, 1, 1, 1, 1,
-0.3736928, 0.1087668, -1.577932, 1, 1, 1, 1, 1,
-0.3704138, -0.948962, -1.816499, 1, 1, 1, 1, 1,
-0.3694789, 0.6507301, -1.464394, 0, 0, 1, 1, 1,
-0.3682904, 0.1460894, -1.251174, 1, 0, 0, 1, 1,
-0.3673342, 1.62948, 0.8394197, 1, 0, 0, 1, 1,
-0.3602599, -0.6487576, -0.8308086, 1, 0, 0, 1, 1,
-0.3588882, 0.2807882, -1.120066, 1, 0, 0, 1, 1,
-0.3585234, 0.1033438, -0.9153975, 1, 0, 0, 1, 1,
-0.348332, 1.882351, -0.4390151, 0, 0, 0, 1, 1,
-0.3429718, 1.299535, -0.03646197, 0, 0, 0, 1, 1,
-0.3356462, 0.5801941, 0.2102347, 0, 0, 0, 1, 1,
-0.3355187, -0.436083, -2.261678, 0, 0, 0, 1, 1,
-0.3295277, -1.06238, -0.7670141, 0, 0, 0, 1, 1,
-0.3264919, -0.2719567, -2.071916, 0, 0, 0, 1, 1,
-0.3261594, 0.1138507, -1.022156, 0, 0, 0, 1, 1,
-0.3239341, 1.158058, -2.288863, 1, 1, 1, 1, 1,
-0.3205858, 1.63339, -0.8412415, 1, 1, 1, 1, 1,
-0.3140796, 0.3713376, -1.799402, 1, 1, 1, 1, 1,
-0.3104751, -0.9260799, -2.967975, 1, 1, 1, 1, 1,
-0.3089599, 0.6422404, 0.5588704, 1, 1, 1, 1, 1,
-0.3045631, 0.2462634, -1.495337, 1, 1, 1, 1, 1,
-0.3038124, 2.014046, 1.032104, 1, 1, 1, 1, 1,
-0.2974283, -1.360569, -3.87946, 1, 1, 1, 1, 1,
-0.2894522, -0.3928103, -3.505775, 1, 1, 1, 1, 1,
-0.2871332, -0.02138567, -2.246798, 1, 1, 1, 1, 1,
-0.2867983, 0.8925892, -0.08130553, 1, 1, 1, 1, 1,
-0.2849312, -1.216073, -3.32412, 1, 1, 1, 1, 1,
-0.2790743, -1.438844, -2.293597, 1, 1, 1, 1, 1,
-0.2781858, -0.3073749, -2.865367, 1, 1, 1, 1, 1,
-0.2762849, 2.257897, -0.2482355, 1, 1, 1, 1, 1,
-0.2757874, 0.3748533, -0.4997946, 0, 0, 1, 1, 1,
-0.2702106, 1.338871, 0.3530021, 1, 0, 0, 1, 1,
-0.266454, 0.9046, 1.337498, 1, 0, 0, 1, 1,
-0.2656371, -0.1059043, 0.1242368, 1, 0, 0, 1, 1,
-0.2634094, -0.1919642, -3.601525, 1, 0, 0, 1, 1,
-0.2614469, -0.9343576, -3.209078, 1, 0, 0, 1, 1,
-0.2573405, 0.9181148, -0.7335536, 0, 0, 0, 1, 1,
-0.2562199, -0.7992309, -2.941996, 0, 0, 0, 1, 1,
-0.2553788, 1.17985, -0.9582003, 0, 0, 0, 1, 1,
-0.2553674, -0.1155626, -2.477985, 0, 0, 0, 1, 1,
-0.2543221, -1.351464, -2.500602, 0, 0, 0, 1, 1,
-0.2525177, -0.1690416, -0.1296087, 0, 0, 0, 1, 1,
-0.2514215, -0.9897313, -3.221599, 0, 0, 0, 1, 1,
-0.2472497, 0.6037699, -1.392542, 1, 1, 1, 1, 1,
-0.2461428, 0.4586764, -0.2826319, 1, 1, 1, 1, 1,
-0.2437484, -0.7662371, -2.098308, 1, 1, 1, 1, 1,
-0.2381755, -0.4719421, -3.137233, 1, 1, 1, 1, 1,
-0.2328387, 1.070667, -0.6022184, 1, 1, 1, 1, 1,
-0.2260251, -0.2154638, -2.122556, 1, 1, 1, 1, 1,
-0.2239602, -0.7472495, -3.276211, 1, 1, 1, 1, 1,
-0.2202892, -1.492203, -1.285367, 1, 1, 1, 1, 1,
-0.2175865, 0.04625838, -2.118266, 1, 1, 1, 1, 1,
-0.2168832, 0.31595, -0.5266306, 1, 1, 1, 1, 1,
-0.2163963, 2.110773, -0.1643046, 1, 1, 1, 1, 1,
-0.2122371, 0.9037266, -0.5039034, 1, 1, 1, 1, 1,
-0.2117161, -0.1442632, -2.006821, 1, 1, 1, 1, 1,
-0.2099295, 1.000582, 0.3665352, 1, 1, 1, 1, 1,
-0.2085227, -0.3555134, -3.629422, 1, 1, 1, 1, 1,
-0.2075396, 0.4355091, -0.7302949, 0, 0, 1, 1, 1,
-0.2070333, 1.35254, 0.7333294, 1, 0, 0, 1, 1,
-0.2036991, -0.4871428, -2.829533, 1, 0, 0, 1, 1,
-0.2016838, 0.2205683, -3.140163, 1, 0, 0, 1, 1,
-0.2006294, 0.7723239, -0.322912, 1, 0, 0, 1, 1,
-0.1992484, -0.924558, -2.517309, 1, 0, 0, 1, 1,
-0.1988614, -1.324657, -3.492206, 0, 0, 0, 1, 1,
-0.1979898, -0.6641396, -2.62891, 0, 0, 0, 1, 1,
-0.1966581, -0.786613, -2.288468, 0, 0, 0, 1, 1,
-0.1882043, -2.025033, -3.447078, 0, 0, 0, 1, 1,
-0.1859758, -1.031548, -1.91597, 0, 0, 0, 1, 1,
-0.1853895, 0.1658462, -1.105615, 0, 0, 0, 1, 1,
-0.1745969, 0.3919201, -0.6715599, 0, 0, 0, 1, 1,
-0.1735407, -0.826535, -3.153424, 1, 1, 1, 1, 1,
-0.1716074, -0.05437382, -2.460066, 1, 1, 1, 1, 1,
-0.1701957, 0.7403317, -0.5400281, 1, 1, 1, 1, 1,
-0.1685957, -0.4481515, -1.737669, 1, 1, 1, 1, 1,
-0.1683708, 0.532268, -1.03864, 1, 1, 1, 1, 1,
-0.1660605, -0.3319152, -2.055429, 1, 1, 1, 1, 1,
-0.1618639, -0.5758444, -0.8841585, 1, 1, 1, 1, 1,
-0.1613227, 0.3712935, -2.04592, 1, 1, 1, 1, 1,
-0.1576716, -0.99524, -3.034685, 1, 1, 1, 1, 1,
-0.1553428, -0.08399799, -2.379865, 1, 1, 1, 1, 1,
-0.1539982, 0.9966039, -0.6339613, 1, 1, 1, 1, 1,
-0.1534482, 0.9185696, -0.4601124, 1, 1, 1, 1, 1,
-0.1484135, -0.4201345, -2.816502, 1, 1, 1, 1, 1,
-0.1474422, -1.387051, -3.206742, 1, 1, 1, 1, 1,
-0.1470594, 0.07885229, -0.04648266, 1, 1, 1, 1, 1,
-0.1430603, -0.6898919, -2.715065, 0, 0, 1, 1, 1,
-0.1382218, -0.6502027, -0.9643672, 1, 0, 0, 1, 1,
-0.1344173, -0.625272, -2.448292, 1, 0, 0, 1, 1,
-0.1267642, -1.669105, -0.9093291, 1, 0, 0, 1, 1,
-0.1265337, 1.381841, -1.457057, 1, 0, 0, 1, 1,
-0.1238457, 0.7099478, 0.2964925, 1, 0, 0, 1, 1,
-0.1238307, 0.8199735, -1.207011, 0, 0, 0, 1, 1,
-0.1212183, 1.445292, -0.1640521, 0, 0, 0, 1, 1,
-0.1208702, 0.430108, -0.695472, 0, 0, 0, 1, 1,
-0.1185352, 0.2400364, -1.770906, 0, 0, 0, 1, 1,
-0.1168603, 1.294678, -0.1452557, 0, 0, 0, 1, 1,
-0.1119357, 1.416155, -0.5351589, 0, 0, 0, 1, 1,
-0.1012627, -1.318299, -2.305174, 0, 0, 0, 1, 1,
-0.1010235, -1.192302, -3.915546, 1, 1, 1, 1, 1,
-0.09998401, -0.05134356, -2.484009, 1, 1, 1, 1, 1,
-0.09834731, -0.2484417, -4.857665, 1, 1, 1, 1, 1,
-0.09521507, -0.03018298, -2.170202, 1, 1, 1, 1, 1,
-0.09455986, -0.4394564, -3.206032, 1, 1, 1, 1, 1,
-0.09317552, 0.9050456, 0.6369243, 1, 1, 1, 1, 1,
-0.0922231, -1.745503, -2.372139, 1, 1, 1, 1, 1,
-0.08694319, -0.1489879, -0.7877371, 1, 1, 1, 1, 1,
-0.08678266, -0.7248026, -2.733402, 1, 1, 1, 1, 1,
-0.0847271, 1.10216, 0.01874502, 1, 1, 1, 1, 1,
-0.08279181, 0.4072193, -0.8135391, 1, 1, 1, 1, 1,
-0.08192565, -0.09101865, -3.673043, 1, 1, 1, 1, 1,
-0.08156781, 0.6153136, -0.7291073, 1, 1, 1, 1, 1,
-0.08136526, 2.888161, 0.1222137, 1, 1, 1, 1, 1,
-0.08047986, -1.785729, -3.869182, 1, 1, 1, 1, 1,
-0.06757555, 2.017884, 0.1809257, 0, 0, 1, 1, 1,
-0.06719799, -0.7830185, -4.331955, 1, 0, 0, 1, 1,
-0.0658507, 0.6050534, 1.744308, 1, 0, 0, 1, 1,
-0.06461685, -0.3334363, -3.013446, 1, 0, 0, 1, 1,
-0.06249873, -0.9373692, -3.885406, 1, 0, 0, 1, 1,
-0.06067938, -1.756188, -3.515302, 1, 0, 0, 1, 1,
-0.05882546, 0.5960083, -0.2374471, 0, 0, 0, 1, 1,
-0.05648304, 0.3406732, 1.073199, 0, 0, 0, 1, 1,
-0.05608582, 0.1776727, 1.643947, 0, 0, 0, 1, 1,
-0.05415215, -1.993776, -3.06643, 0, 0, 0, 1, 1,
-0.04892351, -1.696916, -2.407047, 0, 0, 0, 1, 1,
-0.04099955, 0.7208976, -2.134081, 0, 0, 0, 1, 1,
-0.03949279, -0.06446215, -2.278863, 0, 0, 0, 1, 1,
-0.03640053, 1.970615, -0.3341444, 1, 1, 1, 1, 1,
-0.03579469, -0.01308187, -1.390748, 1, 1, 1, 1, 1,
-0.03479856, -0.8255049, -4.215016, 1, 1, 1, 1, 1,
-0.03039757, 1.769246, -1.533496, 1, 1, 1, 1, 1,
-0.02978962, -2.020166, -1.459534, 1, 1, 1, 1, 1,
-0.02799832, -0.002857946, -2.031149, 1, 1, 1, 1, 1,
-0.02230232, -1.7687, -3.000324, 1, 1, 1, 1, 1,
-0.02064143, 1.441595, -2.10101, 1, 1, 1, 1, 1,
-0.02058847, 0.1589005, -2.046875, 1, 1, 1, 1, 1,
-0.02046328, -0.1709813, -3.296171, 1, 1, 1, 1, 1,
-0.01995451, 0.02774448, 0.8873149, 1, 1, 1, 1, 1,
-0.0175227, 0.09103601, -0.2249969, 1, 1, 1, 1, 1,
-0.01650418, 0.5823729, -1.17436, 1, 1, 1, 1, 1,
-0.01356496, -0.7221146, -3.759103, 1, 1, 1, 1, 1,
-0.01271713, 0.9160015, 1.515798, 1, 1, 1, 1, 1,
-0.007477691, 0.2861912, -2.326716, 0, 0, 1, 1, 1,
-0.005172056, -0.5964281, -3.653542, 1, 0, 0, 1, 1,
-0.0001335816, 1.528755, 1.564551, 1, 0, 0, 1, 1,
0.002495508, -1.42787, 3.17035, 1, 0, 0, 1, 1,
0.003614829, 0.5450193, 0.04557141, 1, 0, 0, 1, 1,
0.01023575, 1.089398, -0.002865247, 1, 0, 0, 1, 1,
0.02647073, -0.9840807, 3.83237, 0, 0, 0, 1, 1,
0.02705151, 0.4779622, -0.9058798, 0, 0, 0, 1, 1,
0.02805146, 0.8507705, 1.677255, 0, 0, 0, 1, 1,
0.02963735, -0.468274, 4.618294, 0, 0, 0, 1, 1,
0.03145087, 0.3194035, -1.911417, 0, 0, 0, 1, 1,
0.03277273, 0.2551455, 1.283345, 0, 0, 0, 1, 1,
0.03295698, -1.142532, 1.439297, 0, 0, 0, 1, 1,
0.03381583, 0.1500075, -0.3422371, 1, 1, 1, 1, 1,
0.03463645, -0.2098201, 0.6255041, 1, 1, 1, 1, 1,
0.03593211, 1.015962, 0.6919842, 1, 1, 1, 1, 1,
0.03976156, 0.4316588, 1.601642, 1, 1, 1, 1, 1,
0.04128328, 1.023816, -1.487089, 1, 1, 1, 1, 1,
0.04279808, 0.3486456, 0.2576588, 1, 1, 1, 1, 1,
0.04745752, 1.716988, -0.2105468, 1, 1, 1, 1, 1,
0.0488456, 1.268576, -1.717868, 1, 1, 1, 1, 1,
0.05187528, 0.1784972, -0.2625874, 1, 1, 1, 1, 1,
0.0693512, -0.6212466, 3.632321, 1, 1, 1, 1, 1,
0.07276496, 0.872373, -0.395254, 1, 1, 1, 1, 1,
0.07432447, -0.4628135, 4.244594, 1, 1, 1, 1, 1,
0.07458691, -0.4061468, 2.41003, 1, 1, 1, 1, 1,
0.08585223, -0.4472064, 2.610349, 1, 1, 1, 1, 1,
0.08879802, -0.8318907, 2.333133, 1, 1, 1, 1, 1,
0.09667542, -0.09751941, -0.06546237, 0, 0, 1, 1, 1,
0.09730256, 0.4346613, 1.471743, 1, 0, 0, 1, 1,
0.09890708, -0.7916135, 3.434198, 1, 0, 0, 1, 1,
0.1008425, -2.339209, 2.688962, 1, 0, 0, 1, 1,
0.1083281, -0.2882479, 3.597124, 1, 0, 0, 1, 1,
0.1095634, 1.329332, 0.08009133, 1, 0, 0, 1, 1,
0.1096408, 0.05034774, 1.070077, 0, 0, 0, 1, 1,
0.1129931, 1.000693, 0.4623208, 0, 0, 0, 1, 1,
0.1174467, -0.7538768, 2.939656, 0, 0, 0, 1, 1,
0.1206628, 1.894809, 0.07662768, 0, 0, 0, 1, 1,
0.1217151, -0.01475557, 1.520459, 0, 0, 0, 1, 1,
0.1231207, -0.5675471, 2.812512, 0, 0, 0, 1, 1,
0.1252131, -0.4799474, 2.923992, 0, 0, 0, 1, 1,
0.1262788, -0.5119137, 2.914828, 1, 1, 1, 1, 1,
0.1264459, 0.2517248, 0.8237296, 1, 1, 1, 1, 1,
0.1284054, -1.487347, 4.116911, 1, 1, 1, 1, 1,
0.1333833, 0.4934811, 1.418207, 1, 1, 1, 1, 1,
0.1381863, -1.299193, 3.113076, 1, 1, 1, 1, 1,
0.1403246, 1.823593, -0.2810346, 1, 1, 1, 1, 1,
0.1475857, 1.386001, -0.6335288, 1, 1, 1, 1, 1,
0.1488634, -0.03866726, 2.926056, 1, 1, 1, 1, 1,
0.1498348, -0.3338836, 4.097423, 1, 1, 1, 1, 1,
0.1509783, 0.02551044, 0.544329, 1, 1, 1, 1, 1,
0.1547228, 1.94305, 0.3351375, 1, 1, 1, 1, 1,
0.1552712, -0.7303944, 1.817302, 1, 1, 1, 1, 1,
0.1564541, 0.8282483, 0.485823, 1, 1, 1, 1, 1,
0.1635872, -0.003068655, 2.161286, 1, 1, 1, 1, 1,
0.1637863, 0.1588543, 1.882215, 1, 1, 1, 1, 1,
0.1643243, -0.8023288, 3.297234, 0, 0, 1, 1, 1,
0.16998, -0.1910234, 1.512442, 1, 0, 0, 1, 1,
0.1713808, 0.9147075, -0.9237401, 1, 0, 0, 1, 1,
0.1722302, -1.498454, 3.878507, 1, 0, 0, 1, 1,
0.1728033, 0.2869442, 1.100421, 1, 0, 0, 1, 1,
0.1741913, 0.5304549, 0.9983435, 1, 0, 0, 1, 1,
0.1751512, -0.6994804, 2.747467, 0, 0, 0, 1, 1,
0.1752995, 0.6030988, -0.3306171, 0, 0, 0, 1, 1,
0.1814066, 1.327226, -0.9568489, 0, 0, 0, 1, 1,
0.1820524, -0.4933262, 3.319292, 0, 0, 0, 1, 1,
0.1829542, 0.4174334, 0.5134138, 0, 0, 0, 1, 1,
0.1841427, -0.1391849, 3.550968, 0, 0, 0, 1, 1,
0.1852572, -2.807585, 3.265729, 0, 0, 0, 1, 1,
0.1875691, 0.868758, -0.3206439, 1, 1, 1, 1, 1,
0.1912573, 0.1962877, 0.253526, 1, 1, 1, 1, 1,
0.1938944, 1.436677, 1.205531, 1, 1, 1, 1, 1,
0.1981227, 0.5137818, -0.5286801, 1, 1, 1, 1, 1,
0.1985867, 0.8310689, 0.07144793, 1, 1, 1, 1, 1,
0.1990654, -2.435992, 1.753954, 1, 1, 1, 1, 1,
0.215866, 1.37, -0.89694, 1, 1, 1, 1, 1,
0.2240376, -0.6825505, 3.252698, 1, 1, 1, 1, 1,
0.2289179, -0.8377154, 2.211339, 1, 1, 1, 1, 1,
0.235561, -1.366893, 3.468492, 1, 1, 1, 1, 1,
0.2373005, -0.4442993, 1.364225, 1, 1, 1, 1, 1,
0.2389664, -1.148464, 1.916362, 1, 1, 1, 1, 1,
0.241974, 1.315206, 0.6368092, 1, 1, 1, 1, 1,
0.2491642, 0.6558185, 0.6871575, 1, 1, 1, 1, 1,
0.2547681, -1.21857, 2.545576, 1, 1, 1, 1, 1,
0.2573386, -0.7949168, 4.548645, 0, 0, 1, 1, 1,
0.2576289, -0.9990163, 5.006768, 1, 0, 0, 1, 1,
0.259416, 0.7367136, 1.079956, 1, 0, 0, 1, 1,
0.265644, -1.657927, 2.550488, 1, 0, 0, 1, 1,
0.2674561, 0.1803247, 0.02426706, 1, 0, 0, 1, 1,
0.2692953, 0.06444457, 0.111943, 1, 0, 0, 1, 1,
0.2761824, 0.3008395, 2.80283, 0, 0, 0, 1, 1,
0.2809575, -0.4078109, 1.401023, 0, 0, 0, 1, 1,
0.2826281, 0.7443134, 0.1648443, 0, 0, 0, 1, 1,
0.2842785, 1.208745, -1.225184, 0, 0, 0, 1, 1,
0.2853018, -1.539474, 3.073916, 0, 0, 0, 1, 1,
0.2866387, -0.4806849, 1.38784, 0, 0, 0, 1, 1,
0.2866523, 0.2356675, 1.158962, 0, 0, 0, 1, 1,
0.2916751, 0.4035985, -1.753233, 1, 1, 1, 1, 1,
0.2918566, 0.1806192, 0.8807376, 1, 1, 1, 1, 1,
0.292434, -0.5212458, 3.559216, 1, 1, 1, 1, 1,
0.2934972, 0.9533817, 2.246827, 1, 1, 1, 1, 1,
0.2938701, 0.1735478, -1.109567, 1, 1, 1, 1, 1,
0.2976838, -1.559238, 1.452364, 1, 1, 1, 1, 1,
0.298431, -1.210585, 4.121159, 1, 1, 1, 1, 1,
0.298608, -0.2569879, 1.283107, 1, 1, 1, 1, 1,
0.3074622, -0.4756852, 2.555263, 1, 1, 1, 1, 1,
0.3086893, 3.176171, 0.5892858, 1, 1, 1, 1, 1,
0.3088388, -0.5920066, 3.8705, 1, 1, 1, 1, 1,
0.3102407, -1.635527, 3.072132, 1, 1, 1, 1, 1,
0.3111665, -1.552734, 3.039844, 1, 1, 1, 1, 1,
0.3129885, -1.049643, 2.588761, 1, 1, 1, 1, 1,
0.3201111, -0.06453259, 0.5302905, 1, 1, 1, 1, 1,
0.3226533, -0.6610547, 0.7707713, 0, 0, 1, 1, 1,
0.3226842, -1.645428, 2.7799, 1, 0, 0, 1, 1,
0.3351581, 1.344242, -0.6747856, 1, 0, 0, 1, 1,
0.3442538, -1.395955, 4.100168, 1, 0, 0, 1, 1,
0.3454275, -0.7434494, 2.262677, 1, 0, 0, 1, 1,
0.3490261, -1.051763, 2.701342, 1, 0, 0, 1, 1,
0.3490709, -0.01631594, 1.563782, 0, 0, 0, 1, 1,
0.3537974, -0.7068809, 0.9201736, 0, 0, 0, 1, 1,
0.3543006, -0.6101599, 3.260791, 0, 0, 0, 1, 1,
0.3550115, 0.4128874, 2.220272, 0, 0, 0, 1, 1,
0.3572654, 0.2424277, -0.03108669, 0, 0, 0, 1, 1,
0.35808, 1.22715, 1.652617, 0, 0, 0, 1, 1,
0.3615095, -1.852612, 2.423042, 0, 0, 0, 1, 1,
0.3630264, -0.2886844, 0.8671083, 1, 1, 1, 1, 1,
0.3635613, -0.08354946, 0.8174728, 1, 1, 1, 1, 1,
0.3678451, -1.161749, 4.342608, 1, 1, 1, 1, 1,
0.368325, 1.432128, -1.067298, 1, 1, 1, 1, 1,
0.3690947, -0.1515927, 2.814125, 1, 1, 1, 1, 1,
0.3711138, 1.335847, 0.2138805, 1, 1, 1, 1, 1,
0.3749334, -0.4616953, 1.834008, 1, 1, 1, 1, 1,
0.3801338, 0.815782, 1.036638, 1, 1, 1, 1, 1,
0.3824269, -0.4089885, 1.578792, 1, 1, 1, 1, 1,
0.385283, 0.7919869, 0.3196332, 1, 1, 1, 1, 1,
0.3862405, -0.7004691, 3.830458, 1, 1, 1, 1, 1,
0.386583, -1.663673, 2.726883, 1, 1, 1, 1, 1,
0.3867066, 0.4594576, 1.342484, 1, 1, 1, 1, 1,
0.3893417, -1.861094, 4.390442, 1, 1, 1, 1, 1,
0.3897287, 0.4432373, 2.698404, 1, 1, 1, 1, 1,
0.3947432, -0.05793567, 3.184484, 0, 0, 1, 1, 1,
0.3950325, 0.5869195, 0.3989607, 1, 0, 0, 1, 1,
0.3954236, 1.248122, 0.7187464, 1, 0, 0, 1, 1,
0.3974929, 1.079929, 0.6203897, 1, 0, 0, 1, 1,
0.4000167, -0.01332692, 1.08802, 1, 0, 0, 1, 1,
0.4029392, 1.973097, -0.8403739, 1, 0, 0, 1, 1,
0.4039354, -1.528141, 5.658632, 0, 0, 0, 1, 1,
0.4068884, 0.1362285, 1.99374, 0, 0, 0, 1, 1,
0.4095447, -1.031521, 3.001888, 0, 0, 0, 1, 1,
0.4116111, 1.632997, 0.3283446, 0, 0, 0, 1, 1,
0.4148114, 1.339874, 1.405757, 0, 0, 0, 1, 1,
0.4154984, 0.2361032, 0.9124059, 0, 0, 0, 1, 1,
0.4195152, 2.266413, -0.4701684, 0, 0, 0, 1, 1,
0.4241796, 0.6916766, 1.047274, 1, 1, 1, 1, 1,
0.4271662, 1.596537, 1.309777, 1, 1, 1, 1, 1,
0.4335562, -0.0643409, 2.388476, 1, 1, 1, 1, 1,
0.4338471, -1.733155, 1.540673, 1, 1, 1, 1, 1,
0.4341417, 0.04394956, 1.978736, 1, 1, 1, 1, 1,
0.4377849, -1.122225, 3.618817, 1, 1, 1, 1, 1,
0.4401675, -0.2919683, 3.53784, 1, 1, 1, 1, 1,
0.4417057, -0.05326771, 0.8959259, 1, 1, 1, 1, 1,
0.4422061, 0.5773686, 1.467256, 1, 1, 1, 1, 1,
0.4458969, 0.1328285, 1.192568, 1, 1, 1, 1, 1,
0.4462675, 0.1814434, 1.004119, 1, 1, 1, 1, 1,
0.4468239, -0.3213881, 1.830692, 1, 1, 1, 1, 1,
0.4491303, -0.1192295, 1.710589, 1, 1, 1, 1, 1,
0.4515705, -0.9964094, 2.618786, 1, 1, 1, 1, 1,
0.4523617, 0.780262, -0.4458487, 1, 1, 1, 1, 1,
0.4537304, -1.079005, 2.788582, 0, 0, 1, 1, 1,
0.4548408, -2.436274, 2.608717, 1, 0, 0, 1, 1,
0.4572974, -0.2109926, 3.087417, 1, 0, 0, 1, 1,
0.4600939, 1.065685, 0.1943813, 1, 0, 0, 1, 1,
0.4661161, 0.06595843, 0.8583415, 1, 0, 0, 1, 1,
0.4669695, 0.6216674, 1.671524, 1, 0, 0, 1, 1,
0.4723938, 0.9439727, 0.7675566, 0, 0, 0, 1, 1,
0.4749707, 1.467495, -0.5645374, 0, 0, 0, 1, 1,
0.4763145, -0.3196212, 2.632327, 0, 0, 0, 1, 1,
0.4790098, -0.05432464, 3.215717, 0, 0, 0, 1, 1,
0.4795532, 0.0012537, 1.26677, 0, 0, 0, 1, 1,
0.4796129, -0.02437417, 0.8270322, 0, 0, 0, 1, 1,
0.4800143, -1.632811, 2.779368, 0, 0, 0, 1, 1,
0.4857042, 0.4921224, 0.09372927, 1, 1, 1, 1, 1,
0.486265, 0.6951842, 0.6762849, 1, 1, 1, 1, 1,
0.4927092, -1.119662, 2.508879, 1, 1, 1, 1, 1,
0.4961594, -0.5140998, 3.180436, 1, 1, 1, 1, 1,
0.5055053, 2.929691, -2.179511, 1, 1, 1, 1, 1,
0.5101545, -0.5468443, 2.949135, 1, 1, 1, 1, 1,
0.5107198, 0.4070271, 1.328228, 1, 1, 1, 1, 1,
0.5110633, 2.288198, 1.316283, 1, 1, 1, 1, 1,
0.5180225, -1.636384, 2.153965, 1, 1, 1, 1, 1,
0.5194415, -1.734252, 2.282881, 1, 1, 1, 1, 1,
0.5216869, 2.016027, -1.889585, 1, 1, 1, 1, 1,
0.5257968, 1.56673, -1.010913, 1, 1, 1, 1, 1,
0.5272222, 0.4256338, 1.280851, 1, 1, 1, 1, 1,
0.5338111, 0.4875598, -0.2547784, 1, 1, 1, 1, 1,
0.5350273, -0.2130183, 3.623755, 1, 1, 1, 1, 1,
0.538782, -1.868151, 4.40287, 0, 0, 1, 1, 1,
0.5419462, -0.6750499, 3.670583, 1, 0, 0, 1, 1,
0.5422831, 0.7998988, -0.01283823, 1, 0, 0, 1, 1,
0.5515554, 0.1660947, 1.86759, 1, 0, 0, 1, 1,
0.5569211, -2.853638, 5.921389, 1, 0, 0, 1, 1,
0.559756, -0.6115419, 1.244232, 1, 0, 0, 1, 1,
0.5608513, -0.8817145, 2.971197, 0, 0, 0, 1, 1,
0.5626456, 0.09712768, 0.9697208, 0, 0, 0, 1, 1,
0.572961, 0.4804586, -0.4258958, 0, 0, 0, 1, 1,
0.5733809, 0.3770147, 1.113542, 0, 0, 0, 1, 1,
0.5745764, 1.516209, -2.807878, 0, 0, 0, 1, 1,
0.5762814, 0.3383924, 0.7476227, 0, 0, 0, 1, 1,
0.5803103, 0.8452904, -0.5966702, 0, 0, 0, 1, 1,
0.581432, 0.1379701, 2.46616, 1, 1, 1, 1, 1,
0.5867237, 0.487161, 0.5819218, 1, 1, 1, 1, 1,
0.5905484, 0.02329029, 1.249912, 1, 1, 1, 1, 1,
0.5970156, 0.7766805, 0.9943479, 1, 1, 1, 1, 1,
0.5975501, 0.7991061, 0.664265, 1, 1, 1, 1, 1,
0.5987511, 0.4582529, 0.4168527, 1, 1, 1, 1, 1,
0.6016671, 0.6698749, 0.5115172, 1, 1, 1, 1, 1,
0.604418, -0.7972383, 1.703755, 1, 1, 1, 1, 1,
0.6097201, -1.13271, 2.087034, 1, 1, 1, 1, 1,
0.6126279, 0.1885216, 2.101129, 1, 1, 1, 1, 1,
0.6145777, 0.7121838, 0.6628386, 1, 1, 1, 1, 1,
0.6152975, 2.422721, 0.7272255, 1, 1, 1, 1, 1,
0.6174964, 1.422561, 0.4899035, 1, 1, 1, 1, 1,
0.6196249, -2.311126, 2.778696, 1, 1, 1, 1, 1,
0.6201575, -0.005066713, 2.277645, 1, 1, 1, 1, 1,
0.6224039, -0.785714, 2.985431, 0, 0, 1, 1, 1,
0.6226432, 1.120757, 0.2460753, 1, 0, 0, 1, 1,
0.6241488, 0.9170527, 1.03612, 1, 0, 0, 1, 1,
0.6279269, -1.224535, 3.183195, 1, 0, 0, 1, 1,
0.6320168, -2.629703, 3.698581, 1, 0, 0, 1, 1,
0.6382129, 1.297614, -1.754161, 1, 0, 0, 1, 1,
0.6411815, 1.512862, 1.044838, 0, 0, 0, 1, 1,
0.6414417, 0.001715001, 0.2648195, 0, 0, 0, 1, 1,
0.6506814, 0.001876716, 1.950142, 0, 0, 0, 1, 1,
0.6536195, 0.4315619, 1.728487, 0, 0, 0, 1, 1,
0.655916, 1.032296, 0.8593735, 0, 0, 0, 1, 1,
0.65813, 0.774882, -0.3010293, 0, 0, 0, 1, 1,
0.6591889, -0.3469454, 2.913416, 0, 0, 0, 1, 1,
0.6615353, 0.6383705, -1.643563, 1, 1, 1, 1, 1,
0.6648727, -0.129175, 2.697731, 1, 1, 1, 1, 1,
0.6655838, -2.673114, 2.512071, 1, 1, 1, 1, 1,
0.6697435, 0.6516179, 0.901527, 1, 1, 1, 1, 1,
0.6716671, 0.4083013, 0.813829, 1, 1, 1, 1, 1,
0.67345, 1.021316, 1.484918, 1, 1, 1, 1, 1,
0.6755036, -0.2174388, 1.622535, 1, 1, 1, 1, 1,
0.6761038, -0.8106854, 3.438633, 1, 1, 1, 1, 1,
0.6764346, 0.3374586, 2.918913, 1, 1, 1, 1, 1,
0.6776052, -0.4323784, 0.8827468, 1, 1, 1, 1, 1,
0.6780361, 1.600314, 0.4596252, 1, 1, 1, 1, 1,
0.6831942, -0.3030409, 2.879606, 1, 1, 1, 1, 1,
0.6863168, -0.5934997, 3.405843, 1, 1, 1, 1, 1,
0.686345, -0.9495957, 0.9041139, 1, 1, 1, 1, 1,
0.6911852, -1.469002, 3.543272, 1, 1, 1, 1, 1,
0.6923829, 0.1046759, -0.1660202, 0, 0, 1, 1, 1,
0.6950663, -0.02101683, -0.8229629, 1, 0, 0, 1, 1,
0.696348, 0.5530654, 1.323889, 1, 0, 0, 1, 1,
0.6966723, 1.097063, 0.2206748, 1, 0, 0, 1, 1,
0.6983675, -1.908098, 2.411361, 1, 0, 0, 1, 1,
0.7069055, -0.6855493, 2.460348, 1, 0, 0, 1, 1,
0.710912, -0.2428662, 1.885629, 0, 0, 0, 1, 1,
0.7117227, 0.9831268, 0.691705, 0, 0, 0, 1, 1,
0.7132002, -1.703043, 3.140035, 0, 0, 0, 1, 1,
0.7132763, 1.330438, -1.349245, 0, 0, 0, 1, 1,
0.7151698, 0.4658491, 0.8345233, 0, 0, 0, 1, 1,
0.7171317, -0.8760188, 3.177184, 0, 0, 0, 1, 1,
0.7182026, 0.9959779, 1.585571, 0, 0, 0, 1, 1,
0.7198674, -0.791222, 2.83931, 1, 1, 1, 1, 1,
0.725419, 0.2855418, 0.8201079, 1, 1, 1, 1, 1,
0.7273474, 0.2613561, 1.385581, 1, 1, 1, 1, 1,
0.7356313, -1.356499, 1.83501, 1, 1, 1, 1, 1,
0.7364017, -0.2379038, 1.249176, 1, 1, 1, 1, 1,
0.738412, -1.631846, 2.202112, 1, 1, 1, 1, 1,
0.7439815, -0.1786198, 3.324569, 1, 1, 1, 1, 1,
0.7484366, 0.1595771, 2.272539, 1, 1, 1, 1, 1,
0.7501457, -0.8043427, 3.365151, 1, 1, 1, 1, 1,
0.7514021, 0.4809973, 1.146428, 1, 1, 1, 1, 1,
0.7534603, 0.01635889, 0.2934744, 1, 1, 1, 1, 1,
0.7569423, 0.4851602, 0.03765691, 1, 1, 1, 1, 1,
0.7585152, 0.4092122, 1.047211, 1, 1, 1, 1, 1,
0.7604998, 0.3177899, 3.039552, 1, 1, 1, 1, 1,
0.7611102, -1.422312, 3.682175, 1, 1, 1, 1, 1,
0.7672277, 0.6360027, 1.24262, 0, 0, 1, 1, 1,
0.7695803, -0.7064141, 2.056605, 1, 0, 0, 1, 1,
0.7744896, 0.05744831, 2.133467, 1, 0, 0, 1, 1,
0.7770435, -0.7207245, 0.6220867, 1, 0, 0, 1, 1,
0.7775826, 0.008995179, 2.110429, 1, 0, 0, 1, 1,
0.7942227, -1.078617, 1.659939, 1, 0, 0, 1, 1,
0.7950618, 2.177891, -1.960307, 0, 0, 0, 1, 1,
0.8000525, 0.6066844, 2.285007, 0, 0, 0, 1, 1,
0.804437, -0.1616501, 1.031665, 0, 0, 0, 1, 1,
0.8045601, -0.01874789, 1.893539, 0, 0, 0, 1, 1,
0.8078035, -1.284295, 2.672777, 0, 0, 0, 1, 1,
0.8110983, 0.936441, 0.1599124, 0, 0, 0, 1, 1,
0.8126485, -1.477687, 3.5699, 0, 0, 0, 1, 1,
0.8141264, 1.334694, 0.1041994, 1, 1, 1, 1, 1,
0.8145853, 0.2401374, -0.1840899, 1, 1, 1, 1, 1,
0.8150467, -1.192265, 4.301555, 1, 1, 1, 1, 1,
0.8178268, 0.5078354, 2.829844, 1, 1, 1, 1, 1,
0.8196611, -0.1299208, 1.64038, 1, 1, 1, 1, 1,
0.8221086, 0.8962647, -0.386296, 1, 1, 1, 1, 1,
0.8253849, -1.629029, 3.234105, 1, 1, 1, 1, 1,
0.8276814, 0.7787827, -1.44847, 1, 1, 1, 1, 1,
0.8289563, -0.578041, 0.2019123, 1, 1, 1, 1, 1,
0.8307071, 0.6729951, 0.7042463, 1, 1, 1, 1, 1,
0.8321563, 0.2687067, 0.9120234, 1, 1, 1, 1, 1,
0.834397, -0.6841989, 2.722669, 1, 1, 1, 1, 1,
0.834801, 1.610512, 1.341834, 1, 1, 1, 1, 1,
0.8348173, 0.02842642, 2.634885, 1, 1, 1, 1, 1,
0.8371377, 1.004696, 2.013333, 1, 1, 1, 1, 1,
0.8504187, -0.4365047, -0.6978108, 0, 0, 1, 1, 1,
0.8521579, -0.5443385, 0.9795789, 1, 0, 0, 1, 1,
0.8559176, -0.3016467, 2.691191, 1, 0, 0, 1, 1,
0.8561035, 0.4076481, 2.764383, 1, 0, 0, 1, 1,
0.8609129, 0.2789662, 0.6973269, 1, 0, 0, 1, 1,
0.8672566, -1.435606, 1.506329, 1, 0, 0, 1, 1,
0.873825, -1.804602, 3.251986, 0, 0, 0, 1, 1,
0.8849558, 0.1551111, 1.070906, 0, 0, 0, 1, 1,
0.8917996, 1.854247, 0.9874989, 0, 0, 0, 1, 1,
0.8923356, -0.4525158, 2.228814, 0, 0, 0, 1, 1,
0.8933803, 1.276978, 0.6339588, 0, 0, 0, 1, 1,
0.8967832, 1.368764, 0.2454407, 0, 0, 0, 1, 1,
0.8979974, 1.342369, 1.263084, 0, 0, 0, 1, 1,
0.9044653, 0.7645267, 1.022548, 1, 1, 1, 1, 1,
0.9130213, 0.4958781, 1.845712, 1, 1, 1, 1, 1,
0.9137987, 0.7957597, 2.358252, 1, 1, 1, 1, 1,
0.9161405, -1.612916, 3.388493, 1, 1, 1, 1, 1,
0.9198645, -1.215368, 2.500522, 1, 1, 1, 1, 1,
0.9199795, 0.755851, -1.137216, 1, 1, 1, 1, 1,
0.9234038, -0.1715924, 2.142949, 1, 1, 1, 1, 1,
0.9262323, -1.20768, 3.017867, 1, 1, 1, 1, 1,
0.9268116, 0.8819399, 0.36189, 1, 1, 1, 1, 1,
0.9268267, 1.071705, 1.78655, 1, 1, 1, 1, 1,
0.9288716, 0.3177328, 1.351743, 1, 1, 1, 1, 1,
0.9326784, -1.585096, 3.99986, 1, 1, 1, 1, 1,
0.9332719, 1.382608, 1.52857, 1, 1, 1, 1, 1,
0.9384876, 0.4231404, 1.235674, 1, 1, 1, 1, 1,
0.942579, -0.4105448, 0.986284, 1, 1, 1, 1, 1,
0.9532875, 0.05865829, 3.143576, 0, 0, 1, 1, 1,
0.954551, -0.6476711, 4.49789, 1, 0, 0, 1, 1,
0.9703657, 0.3785154, 0.5053101, 1, 0, 0, 1, 1,
0.9752749, -0.7939345, 2.46853, 1, 0, 0, 1, 1,
0.978905, 1.140841, 2.124669, 1, 0, 0, 1, 1,
0.9791031, -0.1659836, -1.249801, 1, 0, 0, 1, 1,
0.9839776, 1.253586, 0.8928114, 0, 0, 0, 1, 1,
0.9869994, 0.9554871, 1.579297, 0, 0, 0, 1, 1,
0.9877572, 0.2809097, 2.049044, 0, 0, 0, 1, 1,
0.9927143, 1.42143, 0.8729863, 0, 0, 0, 1, 1,
0.994857, -1.302383, 1.859438, 0, 0, 0, 1, 1,
0.9951853, -0.3312217, 4.298106, 0, 0, 0, 1, 1,
0.9959605, -1.150669, 2.887975, 0, 0, 0, 1, 1,
0.9966972, 0.422671, 0.3009162, 1, 1, 1, 1, 1,
0.997807, -0.9623668, 2.98594, 1, 1, 1, 1, 1,
0.998695, -1.176327, 1.802011, 1, 1, 1, 1, 1,
1.000831, -0.7922746, 1.398833, 1, 1, 1, 1, 1,
1.007213, -0.8147425, 3.532084, 1, 1, 1, 1, 1,
1.011036, -0.3628672, 3.13655, 1, 1, 1, 1, 1,
1.011546, -0.3181338, 1.544769, 1, 1, 1, 1, 1,
1.026643, -0.7408741, 1.676536, 1, 1, 1, 1, 1,
1.03817, -0.6389873, 2.734765, 1, 1, 1, 1, 1,
1.039664, -0.1648002, 1.961013, 1, 1, 1, 1, 1,
1.042473, 0.01222751, 2.771569, 1, 1, 1, 1, 1,
1.04674, 0.634806, 0.7040141, 1, 1, 1, 1, 1,
1.056929, -1.00018, 1.578364, 1, 1, 1, 1, 1,
1.070233, -0.6895863, 2.055994, 1, 1, 1, 1, 1,
1.073622, -0.1101896, 1.309682, 1, 1, 1, 1, 1,
1.076884, 0.2234322, 1.205488, 0, 0, 1, 1, 1,
1.081166, 0.007138367, 1.979403, 1, 0, 0, 1, 1,
1.085791, -0.8898785, 2.177198, 1, 0, 0, 1, 1,
1.086905, -1.404983, 2.901199, 1, 0, 0, 1, 1,
1.088472, -0.8452156, 1.335145, 1, 0, 0, 1, 1,
1.092024, 1.494372, 0.8971339, 1, 0, 0, 1, 1,
1.100788, 0.7077481, 0.8953951, 0, 0, 0, 1, 1,
1.103684, 1.153931, 0.8807652, 0, 0, 0, 1, 1,
1.106422, 0.7098707, 1.61098, 0, 0, 0, 1, 1,
1.108691, 1.680387, -0.2189052, 0, 0, 0, 1, 1,
1.115152, -0.6211724, 3.081538, 0, 0, 0, 1, 1,
1.115751, -0.2562183, -0.06067755, 0, 0, 0, 1, 1,
1.122839, 0.2201155, 1.259311, 0, 0, 0, 1, 1,
1.128667, -1.175991, 2.487134, 1, 1, 1, 1, 1,
1.129111, -0.1530211, 0.1354972, 1, 1, 1, 1, 1,
1.137308, 2.859013, 1.953188, 1, 1, 1, 1, 1,
1.138412, -1.785853, 2.405869, 1, 1, 1, 1, 1,
1.140812, 0.9154273, -0.7983606, 1, 1, 1, 1, 1,
1.145101, 1.453699, 3.245986, 1, 1, 1, 1, 1,
1.154283, 1.127766, 0.9382336, 1, 1, 1, 1, 1,
1.155879, -0.7058098, 2.287969, 1, 1, 1, 1, 1,
1.164599, 0.8671249, 0.6757759, 1, 1, 1, 1, 1,
1.164815, -1.04305, 2.268539, 1, 1, 1, 1, 1,
1.165509, -1.195448, 2.794273, 1, 1, 1, 1, 1,
1.167594, -0.4684979, 1.308453, 1, 1, 1, 1, 1,
1.168816, -1.307601, 3.143707, 1, 1, 1, 1, 1,
1.179538, -0.8572966, 2.685398, 1, 1, 1, 1, 1,
1.182197, -1.808901, 2.397273, 1, 1, 1, 1, 1,
1.187228, -1.071082, 2.413161, 0, 0, 1, 1, 1,
1.187479, -1.89565, 4.192083, 1, 0, 0, 1, 1,
1.187778, -0.5297283, 2.607411, 1, 0, 0, 1, 1,
1.190186, -0.05111441, 1.068043, 1, 0, 0, 1, 1,
1.190649, 0.04699978, -0.4375576, 1, 0, 0, 1, 1,
1.21071, -0.1837231, 0.8764512, 1, 0, 0, 1, 1,
1.213066, -0.02365491, 1.052994, 0, 0, 0, 1, 1,
1.226203, 0.3540555, 1.322267, 0, 0, 0, 1, 1,
1.226407, 0.762266, 1.113875, 0, 0, 0, 1, 1,
1.236754, -1.129775, 3.530279, 0, 0, 0, 1, 1,
1.242027, 1.374834, 1.943385, 0, 0, 0, 1, 1,
1.242662, -3.175009, 5.223134, 0, 0, 0, 1, 1,
1.242957, 1.638852, 0.2572366, 0, 0, 0, 1, 1,
1.243275, -0.9054523, 1.752215, 1, 1, 1, 1, 1,
1.247943, 0.1020015, 1.551404, 1, 1, 1, 1, 1,
1.251831, -0.4028541, 1.874137, 1, 1, 1, 1, 1,
1.255785, -0.03821506, 0.6161675, 1, 1, 1, 1, 1,
1.263771, -0.5659435, 1.865033, 1, 1, 1, 1, 1,
1.268746, 0.2716331, 1.330549, 1, 1, 1, 1, 1,
1.26974, 0.2619255, 2.487355, 1, 1, 1, 1, 1,
1.270064, 0.05293258, 0.4641803, 1, 1, 1, 1, 1,
1.270734, 0.9173153, 1.277349, 1, 1, 1, 1, 1,
1.278047, 1.259592, -0.07709786, 1, 1, 1, 1, 1,
1.286379, 0.3539768, 1.395449, 1, 1, 1, 1, 1,
1.302284, 1.194606, 1.132109, 1, 1, 1, 1, 1,
1.302411, 0.2167753, 1.814233, 1, 1, 1, 1, 1,
1.304246, 0.9256188, -0.3254992, 1, 1, 1, 1, 1,
1.30906, -0.8702546, 2.729307, 1, 1, 1, 1, 1,
1.317271, 0.6974419, 2.409454, 0, 0, 1, 1, 1,
1.317876, 0.4044354, 2.869097, 1, 0, 0, 1, 1,
1.321109, 0.8225831, 1.276071, 1, 0, 0, 1, 1,
1.341676, 0.8935157, 0.5867845, 1, 0, 0, 1, 1,
1.345187, -0.05160205, 3.364075, 1, 0, 0, 1, 1,
1.347754, -0.1796068, 1.211362, 1, 0, 0, 1, 1,
1.347973, -1.472975, 2.747416, 0, 0, 0, 1, 1,
1.35082, 0.9209409, 2.079696, 0, 0, 0, 1, 1,
1.367866, 2.050152, 0.8789471, 0, 0, 0, 1, 1,
1.383666, 0.2491912, 0.9683595, 0, 0, 0, 1, 1,
1.387006, 0.8682202, 1.703061, 0, 0, 0, 1, 1,
1.387947, 1.295695, 1.809179, 0, 0, 0, 1, 1,
1.394963, 0.08944599, 1.101037, 0, 0, 0, 1, 1,
1.396032, 0.3229089, 1.469147, 1, 1, 1, 1, 1,
1.397291, 1.332184, 0.6638311, 1, 1, 1, 1, 1,
1.410629, -1.341477, 2.556765, 1, 1, 1, 1, 1,
1.414635, -2.933616, 3.01269, 1, 1, 1, 1, 1,
1.433809, -1.269003, 0.9708104, 1, 1, 1, 1, 1,
1.435497, -0.1190337, 0.7611526, 1, 1, 1, 1, 1,
1.435663, -1.46987, 1.259618, 1, 1, 1, 1, 1,
1.455856, 0.6622509, -0.8887688, 1, 1, 1, 1, 1,
1.462217, -0.2791813, 0.9197801, 1, 1, 1, 1, 1,
1.46971, 0.8590199, 0.3890783, 1, 1, 1, 1, 1,
1.479095, -0.8518399, 4.046122, 1, 1, 1, 1, 1,
1.47939, -0.768226, 1.832391, 1, 1, 1, 1, 1,
1.491471, 2.145293, 1.572716, 1, 1, 1, 1, 1,
1.495709, -0.1287119, 2.683089, 1, 1, 1, 1, 1,
1.49666, -2.291123, 1.842061, 1, 1, 1, 1, 1,
1.508892, -0.4533603, 1.096023, 0, 0, 1, 1, 1,
1.547505, -0.9037328, 0.06259943, 1, 0, 0, 1, 1,
1.559126, 0.576967, -1.544391, 1, 0, 0, 1, 1,
1.560085, 0.4069328, 2.610286, 1, 0, 0, 1, 1,
1.575345, -0.9129543, 3.001438, 1, 0, 0, 1, 1,
1.581998, -2.378254, 2.84079, 1, 0, 0, 1, 1,
1.582717, -1.942242, 2.167395, 0, 0, 0, 1, 1,
1.58508, -1.478702, 2.557475, 0, 0, 0, 1, 1,
1.585186, 0.6832919, 0.1644416, 0, 0, 0, 1, 1,
1.590409, 0.4937237, 1.114207, 0, 0, 0, 1, 1,
1.59106, -1.166396, 2.00397, 0, 0, 0, 1, 1,
1.597797, -0.09646138, 1.987131, 0, 0, 0, 1, 1,
1.623439, 0.5074396, 2.368857, 0, 0, 0, 1, 1,
1.632032, 1.501154, 2.362584, 1, 1, 1, 1, 1,
1.637913, 1.079789, 1.580113, 1, 1, 1, 1, 1,
1.655422, 1.244949, 1.028235, 1, 1, 1, 1, 1,
1.696458, -0.6677167, 0.8105122, 1, 1, 1, 1, 1,
1.698647, -1.942755, 2.079167, 1, 1, 1, 1, 1,
1.715374, -2.324733, 2.479091, 1, 1, 1, 1, 1,
1.719176, -0.4010968, 2.265827, 1, 1, 1, 1, 1,
1.719614, 0.704746, 0.1254589, 1, 1, 1, 1, 1,
1.733725, -0.9640572, 2.414163, 1, 1, 1, 1, 1,
1.737382, -0.8874173, 0.7863364, 1, 1, 1, 1, 1,
1.742426, 0.1280075, 0.5183895, 1, 1, 1, 1, 1,
1.757879, 0.6387186, 3.132424, 1, 1, 1, 1, 1,
1.761989, 0.4919592, 1.789505, 1, 1, 1, 1, 1,
1.779014, 0.3278697, 0.6559681, 1, 1, 1, 1, 1,
1.780442, 0.08679923, 1.617124, 1, 1, 1, 1, 1,
1.790491, -0.3549818, 2.18787, 0, 0, 1, 1, 1,
1.797747, 1.033851, 1.477958, 1, 0, 0, 1, 1,
1.802578, -1.267375, 4.094596, 1, 0, 0, 1, 1,
1.810176, 1.510208, 0.4509024, 1, 0, 0, 1, 1,
1.810487, -0.01329116, 2.235178, 1, 0, 0, 1, 1,
1.813909, 0.4373237, 1.564821, 1, 0, 0, 1, 1,
1.816539, 1.600427, 1.198517, 0, 0, 0, 1, 1,
1.832445, -0.0138882, 1.299881, 0, 0, 0, 1, 1,
1.843743, -0.499921, 1.460972, 0, 0, 0, 1, 1,
1.850447, -0.639205, 2.40697, 0, 0, 0, 1, 1,
1.850447, -0.4808036, 2.506822, 0, 0, 0, 1, 1,
1.880892, -0.5468073, 3.076169, 0, 0, 0, 1, 1,
1.88885, 1.570844, 1.040982, 0, 0, 0, 1, 1,
1.889736, -0.6464803, 4.344314, 1, 1, 1, 1, 1,
1.915074, -0.1144143, 2.338139, 1, 1, 1, 1, 1,
1.923648, -0.05256489, 0.3516912, 1, 1, 1, 1, 1,
1.940094, -0.340809, 1.968789, 1, 1, 1, 1, 1,
1.944654, -0.2929489, 2.217473, 1, 1, 1, 1, 1,
1.972219, -1.788217, 1.402695, 1, 1, 1, 1, 1,
1.983452, 0.9899763, 1.843882, 1, 1, 1, 1, 1,
2.010408, -0.5880734, 2.3492, 1, 1, 1, 1, 1,
2.016119, -1.035962, 2.45324, 1, 1, 1, 1, 1,
2.026797, -0.7531639, 0.8063762, 1, 1, 1, 1, 1,
2.030141, -1.974995, 3.105582, 1, 1, 1, 1, 1,
2.048224, -0.008218873, 2.422707, 1, 1, 1, 1, 1,
2.061563, 0.09376507, 0.6731357, 1, 1, 1, 1, 1,
2.103251, -0.07426489, 1.120493, 1, 1, 1, 1, 1,
2.109081, -0.1796219, 1.360942, 1, 1, 1, 1, 1,
2.112715, -2.662893, 2.993517, 0, 0, 1, 1, 1,
2.12875, -0.6424243, 1.115515, 1, 0, 0, 1, 1,
2.129814, 0.328459, -0.1496796, 1, 0, 0, 1, 1,
2.140979, -0.3917924, -0.2110771, 1, 0, 0, 1, 1,
2.199092, 1.263342, 1.670171, 1, 0, 0, 1, 1,
2.219292, 0.6963289, 1.970671, 1, 0, 0, 1, 1,
2.263564, 0.735794, 1.384609, 0, 0, 0, 1, 1,
2.268183, 0.617333, -0.9819999, 0, 0, 0, 1, 1,
2.301158, 0.3871143, -0.002498467, 0, 0, 0, 1, 1,
2.308238, 0.2058785, 2.15043, 0, 0, 0, 1, 1,
2.325239, 1.69425, 3.030569, 0, 0, 0, 1, 1,
2.349584, -0.02616156, 1.475835, 0, 0, 0, 1, 1,
2.354307, -0.02552396, 1.924236, 0, 0, 0, 1, 1,
2.428141, -2.263744, 1.720252, 1, 1, 1, 1, 1,
2.456262, -0.9642015, 2.796973, 1, 1, 1, 1, 1,
2.54989, -1.792966, 0.8216167, 1, 1, 1, 1, 1,
2.719133, -0.461879, 1.917862, 1, 1, 1, 1, 1,
2.734865, -0.7370464, 3.765804, 1, 1, 1, 1, 1,
2.87644, -0.7288308, 2.149466, 1, 1, 1, 1, 1,
3.29788, 0.2287079, 3.442131, 1, 1, 1, 1, 1
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
var radius = 9.619767;
var distance = 33.78902;
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
mvMatrix.translate( -0.04090977, -0.0005807877, -0.5243649 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.78902);
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
