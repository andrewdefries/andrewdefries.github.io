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
-3.162351, 0.857271, -1.93333, 1, 0, 0, 1,
-2.938293, 0.7935864, -0.4782302, 1, 0.007843138, 0, 1,
-2.805963, 0.6600336, -2.616686, 1, 0.01176471, 0, 1,
-2.702675, 0.166463, -2.532225, 1, 0.01960784, 0, 1,
-2.683706, -0.2247028, -3.950657, 1, 0.02352941, 0, 1,
-2.613687, 0.8317655, -2.508692, 1, 0.03137255, 0, 1,
-2.509501, -0.2559486, -1.100786, 1, 0.03529412, 0, 1,
-2.493979, 0.7959266, -1.111021, 1, 0.04313726, 0, 1,
-2.457578, -0.7862318, -2.259369, 1, 0.04705882, 0, 1,
-2.42083, -1.106852, -1.235679, 1, 0.05490196, 0, 1,
-2.337271, 0.7942414, -1.16294, 1, 0.05882353, 0, 1,
-2.317068, 1.105757, -1.21857, 1, 0.06666667, 0, 1,
-2.28369, 0.1230756, 0.1642192, 1, 0.07058824, 0, 1,
-2.272318, 0.0660753, -2.490655, 1, 0.07843138, 0, 1,
-2.249454, 1.568775, -0.7924972, 1, 0.08235294, 0, 1,
-2.23244, 0.7779258, -1.208541, 1, 0.09019608, 0, 1,
-2.217818, -0.5121026, -1.869794, 1, 0.09411765, 0, 1,
-2.154715, -0.7521023, -3.158452, 1, 0.1019608, 0, 1,
-2.111822, -0.1789761, 0.5593821, 1, 0.1098039, 0, 1,
-2.07555, -0.8873719, -4.751626, 1, 0.1137255, 0, 1,
-2.061072, -0.2349234, -0.97338, 1, 0.1215686, 0, 1,
-2.001677, -0.2248989, -1.587768, 1, 0.1254902, 0, 1,
-1.976054, -0.4918729, -2.43542, 1, 0.1333333, 0, 1,
-1.963824, -0.6180243, -0.9038808, 1, 0.1372549, 0, 1,
-1.962202, 1.247117, -1.126098, 1, 0.145098, 0, 1,
-1.900189, 0.4187158, -1.275435, 1, 0.1490196, 0, 1,
-1.885745, 1.370215, 0.1638512, 1, 0.1568628, 0, 1,
-1.833152, -0.615351, -1.033898, 1, 0.1607843, 0, 1,
-1.815909, -0.1494998, -3.139956, 1, 0.1686275, 0, 1,
-1.784451, -0.828732, -2.871485, 1, 0.172549, 0, 1,
-1.777275, -0.5571418, -5.169246, 1, 0.1803922, 0, 1,
-1.7518, -0.6679345, -0.54616, 1, 0.1843137, 0, 1,
-1.731265, 0.2790635, -0.557365, 1, 0.1921569, 0, 1,
-1.720509, -0.2168062, -2.471403, 1, 0.1960784, 0, 1,
-1.713456, -0.4667561, -2.950926, 1, 0.2039216, 0, 1,
-1.697896, 0.4108622, -0.1202797, 1, 0.2117647, 0, 1,
-1.690952, -0.006766686, -1.949685, 1, 0.2156863, 0, 1,
-1.689616, 1.108807, -0.249788, 1, 0.2235294, 0, 1,
-1.689607, -0.008386354, -1.108648, 1, 0.227451, 0, 1,
-1.684055, -0.9482442, -3.584233, 1, 0.2352941, 0, 1,
-1.683667, 0.3162267, 0.3299232, 1, 0.2392157, 0, 1,
-1.660156, 1.095526, -0.5296463, 1, 0.2470588, 0, 1,
-1.656449, 0.4949944, -1.283919, 1, 0.2509804, 0, 1,
-1.64175, 0.819899, -1.902505, 1, 0.2588235, 0, 1,
-1.63981, 0.005167958, -1.139235, 1, 0.2627451, 0, 1,
-1.62709, 0.4288659, -0.2155003, 1, 0.2705882, 0, 1,
-1.608433, -0.4665177, -3.031563, 1, 0.2745098, 0, 1,
-1.582139, 2.228343, 0.4135261, 1, 0.282353, 0, 1,
-1.58115, 1.566823, -0.5165964, 1, 0.2862745, 0, 1,
-1.579318, -0.2752502, -2.150483, 1, 0.2941177, 0, 1,
-1.578663, -0.1550075, -1.406184, 1, 0.3019608, 0, 1,
-1.578221, 0.4896495, -1.235944, 1, 0.3058824, 0, 1,
-1.575718, 0.3919831, -1.276599, 1, 0.3137255, 0, 1,
-1.565963, 0.1965035, -1.721553, 1, 0.3176471, 0, 1,
-1.564014, 0.2623147, -1.518581, 1, 0.3254902, 0, 1,
-1.549879, 0.08759406, -1.703774, 1, 0.3294118, 0, 1,
-1.54128, -0.2445192, 0.1901685, 1, 0.3372549, 0, 1,
-1.527028, -1.012599, -0.9170848, 1, 0.3411765, 0, 1,
-1.517251, -0.4109839, -1.009892, 1, 0.3490196, 0, 1,
-1.509061, -1.147145, -1.330285, 1, 0.3529412, 0, 1,
-1.507671, 0.3043448, -2.519001, 1, 0.3607843, 0, 1,
-1.498076, -0.8680776, -1.692359, 1, 0.3647059, 0, 1,
-1.49459, 0.8380663, -1.317379, 1, 0.372549, 0, 1,
-1.481142, -1.124651, 0.08889949, 1, 0.3764706, 0, 1,
-1.476605, 0.1822901, -1.806058, 1, 0.3843137, 0, 1,
-1.473515, -0.6246115, -2.969137, 1, 0.3882353, 0, 1,
-1.468078, -0.9309043, -2.90649, 1, 0.3960784, 0, 1,
-1.466971, 1.249558, 0.1286018, 1, 0.4039216, 0, 1,
-1.456754, -0.03860607, -1.153225, 1, 0.4078431, 0, 1,
-1.437532, 0.257796, -2.776383, 1, 0.4156863, 0, 1,
-1.433354, -1.012849, -2.201119, 1, 0.4196078, 0, 1,
-1.419517, 2.420107, -1.300949, 1, 0.427451, 0, 1,
-1.414286, -0.3176877, -2.366751, 1, 0.4313726, 0, 1,
-1.412621, -1.466874, -2.098766, 1, 0.4392157, 0, 1,
-1.412063, -1.487495, 0.0346788, 1, 0.4431373, 0, 1,
-1.397008, 0.0258645, -2.058414, 1, 0.4509804, 0, 1,
-1.39533, -1.082877, -2.96951, 1, 0.454902, 0, 1,
-1.393275, -0.393223, -3.170139, 1, 0.4627451, 0, 1,
-1.37851, -0.04598571, -3.503788, 1, 0.4666667, 0, 1,
-1.375631, -0.3229921, -0.2572432, 1, 0.4745098, 0, 1,
-1.354786, -0.1584612, -2.522687, 1, 0.4784314, 0, 1,
-1.354344, -0.3771319, -3.06565, 1, 0.4862745, 0, 1,
-1.348839, -1.669969, -2.212007, 1, 0.4901961, 0, 1,
-1.347569, -1.171133, -1.647771, 1, 0.4980392, 0, 1,
-1.345306, 0.888039, 0.7475467, 1, 0.5058824, 0, 1,
-1.34506, 0.1784361, -0.5452472, 1, 0.509804, 0, 1,
-1.340263, -0.9002284, -1.928727, 1, 0.5176471, 0, 1,
-1.336214, -0.1473829, -0.9354995, 1, 0.5215687, 0, 1,
-1.32963, -0.8594874, -2.09182, 1, 0.5294118, 0, 1,
-1.323375, 0.3753454, -0.9443206, 1, 0.5333334, 0, 1,
-1.322417, -1.109081, -1.714477, 1, 0.5411765, 0, 1,
-1.318145, 0.2762631, -2.49378, 1, 0.5450981, 0, 1,
-1.316275, -0.9437634, -1.730215, 1, 0.5529412, 0, 1,
-1.295872, -0.1128191, -3.261169, 1, 0.5568628, 0, 1,
-1.29262, 3.007574, -0.4657012, 1, 0.5647059, 0, 1,
-1.291778, -0.514544, -2.136947, 1, 0.5686275, 0, 1,
-1.283327, -0.1582588, -1.024964, 1, 0.5764706, 0, 1,
-1.278468, 0.9327996, -0.1448665, 1, 0.5803922, 0, 1,
-1.274708, -1.18958, -1.889623, 1, 0.5882353, 0, 1,
-1.270304, -0.5464202, -3.708527, 1, 0.5921569, 0, 1,
-1.262833, -0.6435744, -0.4173883, 1, 0.6, 0, 1,
-1.26199, -1.169521, -3.552183, 1, 0.6078432, 0, 1,
-1.261845, 1.130634, -2.240028, 1, 0.6117647, 0, 1,
-1.260263, -1.916456, -2.755566, 1, 0.6196079, 0, 1,
-1.258099, -1.167991, -2.945797, 1, 0.6235294, 0, 1,
-1.251004, 0.269994, -1.881843, 1, 0.6313726, 0, 1,
-1.246209, -0.3301981, -1.792363, 1, 0.6352941, 0, 1,
-1.239954, -1.114099, -1.851687, 1, 0.6431373, 0, 1,
-1.239917, 0.494165, -1.32222, 1, 0.6470588, 0, 1,
-1.231888, -0.8952227, -0.7910378, 1, 0.654902, 0, 1,
-1.22939, -1.302005, -4.203501, 1, 0.6588235, 0, 1,
-1.216019, -1.727763, -0.9903966, 1, 0.6666667, 0, 1,
-1.213558, -1.63041, -3.256642, 1, 0.6705883, 0, 1,
-1.208492, -0.5961598, -3.218698, 1, 0.6784314, 0, 1,
-1.206805, 1.343846, 0.3409866, 1, 0.682353, 0, 1,
-1.200831, -0.05805053, -1.046629, 1, 0.6901961, 0, 1,
-1.194035, -0.2711693, -0.04406788, 1, 0.6941177, 0, 1,
-1.190722, -0.5561924, -3.70101, 1, 0.7019608, 0, 1,
-1.184347, -1.344762, -2.359479, 1, 0.7098039, 0, 1,
-1.183846, 0.6003749, -0.9228813, 1, 0.7137255, 0, 1,
-1.183827, -0.42634, -1.737507, 1, 0.7215686, 0, 1,
-1.173134, 0.298118, -1.449831, 1, 0.7254902, 0, 1,
-1.162288, -0.0997863, -0.6637492, 1, 0.7333333, 0, 1,
-1.153111, -0.1754688, -2.458381, 1, 0.7372549, 0, 1,
-1.142233, -0.175271, -0.987227, 1, 0.7450981, 0, 1,
-1.136033, 0.7842233, 0.9102678, 1, 0.7490196, 0, 1,
-1.131402, 1.436666, -0.06031359, 1, 0.7568628, 0, 1,
-1.092448, -0.7648239, -2.990608, 1, 0.7607843, 0, 1,
-1.075768, 2.652534, -1.068616, 1, 0.7686275, 0, 1,
-1.06622, -0.3469588, -1.117908, 1, 0.772549, 0, 1,
-1.064072, -1.241342, -2.710694, 1, 0.7803922, 0, 1,
-1.062096, 0.6340077, -0.6100757, 1, 0.7843137, 0, 1,
-1.058803, 1.230084, -0.506331, 1, 0.7921569, 0, 1,
-1.057345, 0.1313015, -1.731119, 1, 0.7960784, 0, 1,
-1.052099, -1.828186, -2.112174, 1, 0.8039216, 0, 1,
-1.045612, -0.6116896, 0.004071941, 1, 0.8117647, 0, 1,
-1.043997, -0.7281532, -4.747442, 1, 0.8156863, 0, 1,
-1.041006, 0.643076, -3.45004, 1, 0.8235294, 0, 1,
-1.04054, 0.1508566, -1.208234, 1, 0.827451, 0, 1,
-1.037592, 0.07194952, 0.2701864, 1, 0.8352941, 0, 1,
-1.03652, 0.1514217, -0.7262792, 1, 0.8392157, 0, 1,
-1.036305, -1.867511, -2.333794, 1, 0.8470588, 0, 1,
-1.032048, 1.069638, 2.448967, 1, 0.8509804, 0, 1,
-1.026055, 1.590518, -0.4233945, 1, 0.8588235, 0, 1,
-1.025484, -0.04986966, -2.529866, 1, 0.8627451, 0, 1,
-1.021498, 1.691384, -0.7236547, 1, 0.8705882, 0, 1,
-1.02077, 2.299053, 0.3910013, 1, 0.8745098, 0, 1,
-1.020737, 2.726266, 0.3607538, 1, 0.8823529, 0, 1,
-1.02053, -1.301633, -2.15369, 1, 0.8862745, 0, 1,
-1.013082, 1.351499, -1.579652, 1, 0.8941177, 0, 1,
-1.012604, 1.253663, -0.3089206, 1, 0.8980392, 0, 1,
-1.011269, -0.493487, -2.296607, 1, 0.9058824, 0, 1,
-1.007431, 0.01156477, -0.217758, 1, 0.9137255, 0, 1,
-1.004387, -0.4399233, -3.458829, 1, 0.9176471, 0, 1,
-0.9978914, -0.4643356, -2.204985, 1, 0.9254902, 0, 1,
-0.9954795, 0.3797878, -0.6059619, 1, 0.9294118, 0, 1,
-0.9899315, 0.02048328, -2.222648, 1, 0.9372549, 0, 1,
-0.9844722, 1.256676, -2.031955, 1, 0.9411765, 0, 1,
-0.9807256, 0.9701326, -0.07646198, 1, 0.9490196, 0, 1,
-0.9757494, -0.7852105, -1.984838, 1, 0.9529412, 0, 1,
-0.9751496, -0.3008432, -2.271568, 1, 0.9607843, 0, 1,
-0.9737924, -0.4297783, -2.353248, 1, 0.9647059, 0, 1,
-0.9708877, -1.210038, -3.587432, 1, 0.972549, 0, 1,
-0.9634824, 0.09978084, -2.802311, 1, 0.9764706, 0, 1,
-0.9594247, 0.2052687, 0.1322369, 1, 0.9843137, 0, 1,
-0.9574124, -0.9540785, -1.6541, 1, 0.9882353, 0, 1,
-0.9559537, 1.084615, 0.4578719, 1, 0.9960784, 0, 1,
-0.9432601, -0.0846425, -2.548995, 0.9960784, 1, 0, 1,
-0.9409831, 1.314707, 0.2034518, 0.9921569, 1, 0, 1,
-0.9407162, -0.1781643, -0.5993553, 0.9843137, 1, 0, 1,
-0.9388862, 0.1389822, -2.312324, 0.9803922, 1, 0, 1,
-0.936343, 0.2028439, -0.497756, 0.972549, 1, 0, 1,
-0.9246649, -1.855799, -2.393731, 0.9686275, 1, 0, 1,
-0.9189952, 0.9218539, -0.8386697, 0.9607843, 1, 0, 1,
-0.9173272, 0.2271413, -0.3417461, 0.9568627, 1, 0, 1,
-0.9026363, 1.050939, -2.31621, 0.9490196, 1, 0, 1,
-0.8918257, 1.093527, 0.3258083, 0.945098, 1, 0, 1,
-0.8890713, -0.03791214, -1.510001, 0.9372549, 1, 0, 1,
-0.8814908, -0.1639845, -1.38335, 0.9333333, 1, 0, 1,
-0.8814757, 0.9922401, -0.6155644, 0.9254902, 1, 0, 1,
-0.8804432, 0.7905262, -1.268874, 0.9215686, 1, 0, 1,
-0.8797796, 0.8488255, -1.833803, 0.9137255, 1, 0, 1,
-0.8766195, 0.1664679, -1.189897, 0.9098039, 1, 0, 1,
-0.875457, 0.7625428, -1.48758, 0.9019608, 1, 0, 1,
-0.8740966, -0.5926005, -2.185716, 0.8941177, 1, 0, 1,
-0.8711525, 2.407532, 0.2564016, 0.8901961, 1, 0, 1,
-0.8704796, -1.31381, -3.655426, 0.8823529, 1, 0, 1,
-0.8500829, 0.9032102, 0.4472141, 0.8784314, 1, 0, 1,
-0.8464436, -1.204937, -3.087617, 0.8705882, 1, 0, 1,
-0.8429958, -0.708878, -2.04353, 0.8666667, 1, 0, 1,
-0.8366395, -0.6219853, -0.3871125, 0.8588235, 1, 0, 1,
-0.8343329, 0.9986543, 0.4581717, 0.854902, 1, 0, 1,
-0.8311653, -0.0571725, -1.689659, 0.8470588, 1, 0, 1,
-0.8303543, -1.124465, -1.908791, 0.8431373, 1, 0, 1,
-0.8286749, 0.4986535, 0.7700018, 0.8352941, 1, 0, 1,
-0.8153799, 0.6180915, -1.00224, 0.8313726, 1, 0, 1,
-0.8152758, 1.105972, 0.5140682, 0.8235294, 1, 0, 1,
-0.8146446, 1.104051, -0.3816741, 0.8196079, 1, 0, 1,
-0.8103178, -2.026247, -3.631586, 0.8117647, 1, 0, 1,
-0.8065686, -1.715036, -3.574728, 0.8078431, 1, 0, 1,
-0.8018236, -1.051024, -4.082877, 0.8, 1, 0, 1,
-0.8016782, -1.19928, -2.733428, 0.7921569, 1, 0, 1,
-0.8015728, -0.352001, -1.929787, 0.7882353, 1, 0, 1,
-0.795305, -0.4293386, -2.68487, 0.7803922, 1, 0, 1,
-0.7898873, -0.5777781, -1.886662, 0.7764706, 1, 0, 1,
-0.7887668, 0.03701555, -1.170123, 0.7686275, 1, 0, 1,
-0.7874675, -0.2770079, -1.490727, 0.7647059, 1, 0, 1,
-0.7830824, -1.329995, -3.027509, 0.7568628, 1, 0, 1,
-0.7714948, -1.565162, -2.952922, 0.7529412, 1, 0, 1,
-0.7646624, 1.076682, -0.5102885, 0.7450981, 1, 0, 1,
-0.7594411, 0.8979068, 0.06026047, 0.7411765, 1, 0, 1,
-0.7580619, 0.1944343, -3.395446, 0.7333333, 1, 0, 1,
-0.7577977, 0.2718159, -1.063348, 0.7294118, 1, 0, 1,
-0.7563649, -1.156533, -0.9932228, 0.7215686, 1, 0, 1,
-0.7553346, 0.5246048, -0.2442173, 0.7176471, 1, 0, 1,
-0.7550254, 0.404319, -1.962869, 0.7098039, 1, 0, 1,
-0.7542466, 0.2687238, -2.702681, 0.7058824, 1, 0, 1,
-0.7541059, 1.073317, 0.2875625, 0.6980392, 1, 0, 1,
-0.7524958, -1.358293, -3.27011, 0.6901961, 1, 0, 1,
-0.7427642, -1.164225, -1.35796, 0.6862745, 1, 0, 1,
-0.7414083, 1.483877, -0.6601915, 0.6784314, 1, 0, 1,
-0.7388301, -0.6138232, -3.32269, 0.6745098, 1, 0, 1,
-0.7385482, 1.660592, -2.298592, 0.6666667, 1, 0, 1,
-0.7341914, -0.3298975, -2.315457, 0.6627451, 1, 0, 1,
-0.7326851, -1.919033, -3.568705, 0.654902, 1, 0, 1,
-0.7311519, -0.7909422, -0.9611276, 0.6509804, 1, 0, 1,
-0.7293766, 0.3870794, 0.07788769, 0.6431373, 1, 0, 1,
-0.7272265, 0.1634182, -2.792317, 0.6392157, 1, 0, 1,
-0.7166553, -1.176064, -2.042062, 0.6313726, 1, 0, 1,
-0.7149069, -1.143647, -3.111981, 0.627451, 1, 0, 1,
-0.7141206, -1.172368, -3.405244, 0.6196079, 1, 0, 1,
-0.7128312, 0.4975367, -1.240263, 0.6156863, 1, 0, 1,
-0.7109932, 0.979763, -0.07150224, 0.6078432, 1, 0, 1,
-0.7098143, -0.732031, -2.078061, 0.6039216, 1, 0, 1,
-0.70677, 0.09716263, -1.252306, 0.5960785, 1, 0, 1,
-0.7066478, -0.8388939, -2.941795, 0.5882353, 1, 0, 1,
-0.7063541, -0.9023904, -2.153768, 0.5843138, 1, 0, 1,
-0.7032201, 0.2772195, -2.816303, 0.5764706, 1, 0, 1,
-0.7014144, 0.2165491, -2.324543, 0.572549, 1, 0, 1,
-0.7006102, -0.5910037, -3.094373, 0.5647059, 1, 0, 1,
-0.6939591, -0.2435814, -1.675258, 0.5607843, 1, 0, 1,
-0.6779662, 0.1211657, -0.6235762, 0.5529412, 1, 0, 1,
-0.6770259, 0.7275459, -2.757831, 0.5490196, 1, 0, 1,
-0.6769935, -0.307359, -1.360767, 0.5411765, 1, 0, 1,
-0.6758571, -0.2745926, -0.7273045, 0.5372549, 1, 0, 1,
-0.6683775, 0.5911671, -1.359439, 0.5294118, 1, 0, 1,
-0.6614723, -0.1293447, -1.756424, 0.5254902, 1, 0, 1,
-0.6604618, 0.7952449, -1.220274, 0.5176471, 1, 0, 1,
-0.6602646, 0.7618842, -0.07006348, 0.5137255, 1, 0, 1,
-0.6469358, -0.9329962, -3.135183, 0.5058824, 1, 0, 1,
-0.6465635, -0.6787017, -1.827778, 0.5019608, 1, 0, 1,
-0.6425059, 0.1494873, -1.285725, 0.4941176, 1, 0, 1,
-0.6353164, -0.6179498, -3.334158, 0.4862745, 1, 0, 1,
-0.6337292, 0.2538012, -1.327986, 0.4823529, 1, 0, 1,
-0.6292279, -0.191461, -2.4562, 0.4745098, 1, 0, 1,
-0.6259807, 0.2529261, -0.2349844, 0.4705882, 1, 0, 1,
-0.6180103, -1.390436, -2.899918, 0.4627451, 1, 0, 1,
-0.6150552, 0.7008291, -0.6146107, 0.4588235, 1, 0, 1,
-0.6104537, -0.3326194, -2.823771, 0.4509804, 1, 0, 1,
-0.6072396, 0.005360663, -1.541079, 0.4470588, 1, 0, 1,
-0.606054, 0.1584142, -2.555692, 0.4392157, 1, 0, 1,
-0.6030834, 2.782877, -0.7839904, 0.4352941, 1, 0, 1,
-0.6012025, 0.8754808, -0.1139162, 0.427451, 1, 0, 1,
-0.5938053, -0.7120217, -1.348881, 0.4235294, 1, 0, 1,
-0.5898805, 1.060291, 0.09662528, 0.4156863, 1, 0, 1,
-0.5874122, -0.3094334, -3.330287, 0.4117647, 1, 0, 1,
-0.5821913, -1.070674, -0.4144142, 0.4039216, 1, 0, 1,
-0.5811956, 1.373327, -1.585779, 0.3960784, 1, 0, 1,
-0.5805534, 1.019239, -0.6683787, 0.3921569, 1, 0, 1,
-0.5787895, -0.9585228, -1.705048, 0.3843137, 1, 0, 1,
-0.5762233, 1.196578, 1.269968, 0.3803922, 1, 0, 1,
-0.571996, 0.1706734, -1.592158, 0.372549, 1, 0, 1,
-0.5715898, -0.7261692, -1.884648, 0.3686275, 1, 0, 1,
-0.5597075, -0.173542, -2.233686, 0.3607843, 1, 0, 1,
-0.5519795, -2.176029, -1.860982, 0.3568628, 1, 0, 1,
-0.5413492, -1.368899, -3.189874, 0.3490196, 1, 0, 1,
-0.5365809, 0.1276278, -1.62444, 0.345098, 1, 0, 1,
-0.5327844, -1.795469, -2.631054, 0.3372549, 1, 0, 1,
-0.5266242, 0.2359135, 0.06380109, 0.3333333, 1, 0, 1,
-0.5203453, 0.2896161, -1.411385, 0.3254902, 1, 0, 1,
-0.5162731, 0.3376838, 0.7087905, 0.3215686, 1, 0, 1,
-0.5103964, 0.6461477, -1.658421, 0.3137255, 1, 0, 1,
-0.508276, 1.214299, -0.1419672, 0.3098039, 1, 0, 1,
-0.5075065, -1.299629, -2.600289, 0.3019608, 1, 0, 1,
-0.5037597, 0.7782675, -2.584728, 0.2941177, 1, 0, 1,
-0.5030439, -1.314947, -3.95142, 0.2901961, 1, 0, 1,
-0.5016568, -1.071179, -1.684332, 0.282353, 1, 0, 1,
-0.5007336, 0.1748051, -1.380349, 0.2784314, 1, 0, 1,
-0.4991613, -0.5558264, -2.764719, 0.2705882, 1, 0, 1,
-0.4991474, -0.0964582, -2.066229, 0.2666667, 1, 0, 1,
-0.4936393, -0.4459193, -2.857044, 0.2588235, 1, 0, 1,
-0.4927202, 0.0492043, -2.840557, 0.254902, 1, 0, 1,
-0.4880397, -0.7463815, -3.658521, 0.2470588, 1, 0, 1,
-0.4872579, 0.7411044, 0.7918078, 0.2431373, 1, 0, 1,
-0.4861727, 0.2153591, -2.093214, 0.2352941, 1, 0, 1,
-0.4808221, -1.12071, -4.350406, 0.2313726, 1, 0, 1,
-0.4800246, 0.4760789, 0.6902125, 0.2235294, 1, 0, 1,
-0.4793449, 0.3992016, -0.3197621, 0.2196078, 1, 0, 1,
-0.478091, -0.8460571, -4.705626, 0.2117647, 1, 0, 1,
-0.4769938, -2.35796, -2.53409, 0.2078431, 1, 0, 1,
-0.4764201, 0.2421165, -1.172388, 0.2, 1, 0, 1,
-0.4738116, 0.8039013, -0.5853325, 0.1921569, 1, 0, 1,
-0.4710516, 0.5356437, -0.2116707, 0.1882353, 1, 0, 1,
-0.4696905, -1.641672, -4.241374, 0.1803922, 1, 0, 1,
-0.468992, -0.9285126, -3.12293, 0.1764706, 1, 0, 1,
-0.4682054, 0.2006955, -1.344164, 0.1686275, 1, 0, 1,
-0.4639239, 0.8845924, 0.7598377, 0.1647059, 1, 0, 1,
-0.454491, 1.566803, -0.5880318, 0.1568628, 1, 0, 1,
-0.445043, -0.7115883, -2.35724, 0.1529412, 1, 0, 1,
-0.4437714, -0.6504456, -1.364788, 0.145098, 1, 0, 1,
-0.4429617, -1.479201, -2.364443, 0.1411765, 1, 0, 1,
-0.442517, -1.226663, -2.825252, 0.1333333, 1, 0, 1,
-0.4358442, 1.28523, 0.2402388, 0.1294118, 1, 0, 1,
-0.4358175, -0.5524489, -4.217839, 0.1215686, 1, 0, 1,
-0.4357785, 0.6060981, -1.145042, 0.1176471, 1, 0, 1,
-0.4344106, 0.6523332, -0.7284234, 0.1098039, 1, 0, 1,
-0.4321232, -0.05565065, -0.08437389, 0.1058824, 1, 0, 1,
-0.4320792, -1.645136, -2.539333, 0.09803922, 1, 0, 1,
-0.4295835, 0.08457271, -1.653273, 0.09019608, 1, 0, 1,
-0.4280518, 0.105843, -0.8340557, 0.08627451, 1, 0, 1,
-0.4175325, 0.1487102, -2.877, 0.07843138, 1, 0, 1,
-0.4130171, -0.6627831, -3.916172, 0.07450981, 1, 0, 1,
-0.4125196, 0.5893829, -0.2053098, 0.06666667, 1, 0, 1,
-0.4109886, -0.6742197, -1.314619, 0.0627451, 1, 0, 1,
-0.4099867, 1.493015, 0.5845205, 0.05490196, 1, 0, 1,
-0.4081698, 1.172014, -0.5495303, 0.05098039, 1, 0, 1,
-0.4079112, 0.9953046, -1.040029, 0.04313726, 1, 0, 1,
-0.4069175, 0.8365405, 1.847517, 0.03921569, 1, 0, 1,
-0.3999655, 0.1346034, -2.682924, 0.03137255, 1, 0, 1,
-0.3846316, 0.7648625, -1.201733, 0.02745098, 1, 0, 1,
-0.3823116, -0.8582245, -2.785076, 0.01960784, 1, 0, 1,
-0.3803135, -0.2675779, -2.073253, 0.01568628, 1, 0, 1,
-0.3798724, 0.4353235, -0.2634863, 0.007843138, 1, 0, 1,
-0.3763933, 1.747473, -0.2711736, 0.003921569, 1, 0, 1,
-0.3763594, 0.9735553, 1.683918, 0, 1, 0.003921569, 1,
-0.3758725, -0.4099827, -1.906241, 0, 1, 0.01176471, 1,
-0.3705574, -1.969839, -4.296936, 0, 1, 0.01568628, 1,
-0.3602651, -1.428061, -4.924286, 0, 1, 0.02352941, 1,
-0.3590159, 0.8063361, -1.10397, 0, 1, 0.02745098, 1,
-0.3466013, -0.1077846, -1.623125, 0, 1, 0.03529412, 1,
-0.3449702, 0.0295848, -2.855024, 0, 1, 0.03921569, 1,
-0.3443626, 0.8327985, -0.6873161, 0, 1, 0.04705882, 1,
-0.3413744, 1.344116, -1.096289, 0, 1, 0.05098039, 1,
-0.3402643, 0.5084609, 0.285506, 0, 1, 0.05882353, 1,
-0.3391642, 1.43777, -0.1228736, 0, 1, 0.0627451, 1,
-0.3387694, 0.9882944, -0.0203704, 0, 1, 0.07058824, 1,
-0.3350395, -0.01454381, -1.33058, 0, 1, 0.07450981, 1,
-0.3347011, 0.9027678, 0.09758834, 0, 1, 0.08235294, 1,
-0.3303569, -0.5244493, -2.966395, 0, 1, 0.08627451, 1,
-0.3266714, -2.112977, -3.184507, 0, 1, 0.09411765, 1,
-0.3245019, -0.8432045, -3.138311, 0, 1, 0.1019608, 1,
-0.3231761, -2.501896, -2.510581, 0, 1, 0.1058824, 1,
-0.322528, -0.2783411, -1.208351, 0, 1, 0.1137255, 1,
-0.321636, -1.565653, -3.087758, 0, 1, 0.1176471, 1,
-0.3201404, -0.03177445, -0.7770105, 0, 1, 0.1254902, 1,
-0.31931, 0.2247583, 0.2055905, 0, 1, 0.1294118, 1,
-0.3188526, 0.7272949, -0.4727735, 0, 1, 0.1372549, 1,
-0.3155945, -1.06019, -2.739423, 0, 1, 0.1411765, 1,
-0.3121355, -0.06414488, -0.8339125, 0, 1, 0.1490196, 1,
-0.3111703, 1.399025, 0.5468465, 0, 1, 0.1529412, 1,
-0.3110363, 0.6688184, 0.4143679, 0, 1, 0.1607843, 1,
-0.3096501, 0.7300687, -0.5989277, 0, 1, 0.1647059, 1,
-0.3064189, -0.40919, -2.890754, 0, 1, 0.172549, 1,
-0.3055297, -0.442657, -2.773507, 0, 1, 0.1764706, 1,
-0.3015912, 1.299361, -0.7214334, 0, 1, 0.1843137, 1,
-0.300443, 0.45921, -1.419958, 0, 1, 0.1882353, 1,
-0.3003432, -0.4534184, -3.032076, 0, 1, 0.1960784, 1,
-0.2955471, 0.2298286, -0.3658108, 0, 1, 0.2039216, 1,
-0.2950381, 0.5160957, -1.015147, 0, 1, 0.2078431, 1,
-0.2935737, 0.07403665, -1.550561, 0, 1, 0.2156863, 1,
-0.2894141, 0.1564209, -2.02171, 0, 1, 0.2196078, 1,
-0.2889722, -0.9222067, -3.604806, 0, 1, 0.227451, 1,
-0.2863625, 1.210971, 1.205707, 0, 1, 0.2313726, 1,
-0.2838996, 0.6185598, -0.7439563, 0, 1, 0.2392157, 1,
-0.2813833, 0.4821204, -0.8043889, 0, 1, 0.2431373, 1,
-0.2780631, -1.073165, -3.858137, 0, 1, 0.2509804, 1,
-0.2778252, -2.026936, -3.450735, 0, 1, 0.254902, 1,
-0.2763926, 1.811496, -0.891142, 0, 1, 0.2627451, 1,
-0.2761815, 1.55204, -0.8436834, 0, 1, 0.2666667, 1,
-0.2751198, 1.239293, 0.09970564, 0, 1, 0.2745098, 1,
-0.2704318, 0.4406409, -0.2403179, 0, 1, 0.2784314, 1,
-0.2685543, -1.243655, -3.787415, 0, 1, 0.2862745, 1,
-0.2664917, -1.88308, -3.578594, 0, 1, 0.2901961, 1,
-0.2655485, 0.0412435, -2.71547, 0, 1, 0.2980392, 1,
-0.2623461, 1.062093, 0.9423296, 0, 1, 0.3058824, 1,
-0.2592363, -0.4001626, -1.447086, 0, 1, 0.3098039, 1,
-0.2578401, 1.329911, -0.01572046, 0, 1, 0.3176471, 1,
-0.2570942, 0.5816103, 1.298368, 0, 1, 0.3215686, 1,
-0.2547179, -0.604475, -3.877826, 0, 1, 0.3294118, 1,
-0.2543245, -0.8100816, -3.280409, 0, 1, 0.3333333, 1,
-0.2541943, -1.458466, -3.039356, 0, 1, 0.3411765, 1,
-0.2502099, 0.4023551, -1.5767, 0, 1, 0.345098, 1,
-0.2489344, -1.06875, -1.950282, 0, 1, 0.3529412, 1,
-0.2483305, -0.00614963, -2.214188, 0, 1, 0.3568628, 1,
-0.2461866, 0.5506124, 0.2284763, 0, 1, 0.3647059, 1,
-0.2413542, -1.36411, -2.967028, 0, 1, 0.3686275, 1,
-0.2400359, -0.1435035, -0.66964, 0, 1, 0.3764706, 1,
-0.2342907, 0.5542269, 0.8665806, 0, 1, 0.3803922, 1,
-0.2325321, -0.6715921, -4.233435, 0, 1, 0.3882353, 1,
-0.2301746, 0.05034655, -1.070847, 0, 1, 0.3921569, 1,
-0.2300005, 1.064174, -2.854568, 0, 1, 0.4, 1,
-0.2299484, -1.383072, -2.375429, 0, 1, 0.4078431, 1,
-0.2293006, -0.288844, -2.735904, 0, 1, 0.4117647, 1,
-0.2275026, 0.8630332, -0.9416409, 0, 1, 0.4196078, 1,
-0.2238092, 0.09902682, -0.6164693, 0, 1, 0.4235294, 1,
-0.2218787, 1.16641, -2.716759, 0, 1, 0.4313726, 1,
-0.2200774, -0.02868639, -2.585786, 0, 1, 0.4352941, 1,
-0.219386, 0.6516686, 0.7661046, 0, 1, 0.4431373, 1,
-0.2173394, -0.03405315, -0.8907067, 0, 1, 0.4470588, 1,
-0.2169692, -0.3801138, -2.124275, 0, 1, 0.454902, 1,
-0.2134843, 0.1682801, -1.271671, 0, 1, 0.4588235, 1,
-0.2046756, -0.3435531, -1.481556, 0, 1, 0.4666667, 1,
-0.2002104, 0.8100502, 0.1730151, 0, 1, 0.4705882, 1,
-0.1973541, -0.5678672, -3.900459, 0, 1, 0.4784314, 1,
-0.1913745, 1.107479, -0.6856066, 0, 1, 0.4823529, 1,
-0.1892205, 0.3954076, -0.7037959, 0, 1, 0.4901961, 1,
-0.1869521, 1.332984, 0.6189944, 0, 1, 0.4941176, 1,
-0.1863083, -0.04261585, -3.27536, 0, 1, 0.5019608, 1,
-0.1793877, 0.3527943, -0.8054191, 0, 1, 0.509804, 1,
-0.1790378, 1.202597, 0.4770062, 0, 1, 0.5137255, 1,
-0.1782099, 1.208227, -2.033178, 0, 1, 0.5215687, 1,
-0.1772439, 1.947473, -1.544302, 0, 1, 0.5254902, 1,
-0.1728854, -1.34435, -2.871579, 0, 1, 0.5333334, 1,
-0.1723033, 0.2698646, -1.509147, 0, 1, 0.5372549, 1,
-0.170399, -0.2669038, -2.189868, 0, 1, 0.5450981, 1,
-0.1679826, -0.7987279, -3.82905, 0, 1, 0.5490196, 1,
-0.1649082, 0.1069041, -0.03035097, 0, 1, 0.5568628, 1,
-0.1629333, -0.4007878, -2.454404, 0, 1, 0.5607843, 1,
-0.1581846, -1.411297, -0.8771597, 0, 1, 0.5686275, 1,
-0.1537279, 0.016972, -0.2338025, 0, 1, 0.572549, 1,
-0.1526237, 0.5951594, -1.296548, 0, 1, 0.5803922, 1,
-0.1510293, 1.828923, 0.8741534, 0, 1, 0.5843138, 1,
-0.1508858, 1.019199, 0.431161, 0, 1, 0.5921569, 1,
-0.1483092, 1.645344, -1.834743, 0, 1, 0.5960785, 1,
-0.1474144, -1.543165, -2.703933, 0, 1, 0.6039216, 1,
-0.1468543, 1.15059, 0.2796977, 0, 1, 0.6117647, 1,
-0.1465333, 0.6005282, -0.6459863, 0, 1, 0.6156863, 1,
-0.1453209, 0.2104004, -0.5489401, 0, 1, 0.6235294, 1,
-0.1435265, -0.7745659, -2.608222, 0, 1, 0.627451, 1,
-0.140908, -0.8344276, -1.724707, 0, 1, 0.6352941, 1,
-0.1361039, -1.035072, -2.455539, 0, 1, 0.6392157, 1,
-0.1341368, 0.4601404, -2.102986, 0, 1, 0.6470588, 1,
-0.1333304, 0.7218736, -0.9371546, 0, 1, 0.6509804, 1,
-0.1239823, 1.677983, -0.4131762, 0, 1, 0.6588235, 1,
-0.1230698, -0.9258622, -0.9328721, 0, 1, 0.6627451, 1,
-0.1175237, -0.8299454, -2.31807, 0, 1, 0.6705883, 1,
-0.1174416, -0.2914425, -3.298845, 0, 1, 0.6745098, 1,
-0.1141317, 0.3032711, 0.5062824, 0, 1, 0.682353, 1,
-0.1062109, -0.03908337, 0.7107639, 0, 1, 0.6862745, 1,
-0.1048216, -1.069576, -3.514439, 0, 1, 0.6941177, 1,
-0.1011034, -0.8298756, -2.672714, 0, 1, 0.7019608, 1,
-0.1009988, 0.2775685, 1.174412, 0, 1, 0.7058824, 1,
-0.09895532, -1.301413, -3.795915, 0, 1, 0.7137255, 1,
-0.09700087, 1.400049, -0.1875644, 0, 1, 0.7176471, 1,
-0.09386615, 0.3329803, -1.087927, 0, 1, 0.7254902, 1,
-0.0934211, 0.0819901, 0.1708377, 0, 1, 0.7294118, 1,
-0.08893037, 1.032696, 0.7492261, 0, 1, 0.7372549, 1,
-0.08871969, 0.8117638, -0.5547282, 0, 1, 0.7411765, 1,
-0.08779961, 0.2313186, -0.8651605, 0, 1, 0.7490196, 1,
-0.08513809, -0.3588665, -1.924101, 0, 1, 0.7529412, 1,
-0.08100217, -0.08686816, -3.388547, 0, 1, 0.7607843, 1,
-0.06763992, -1.267664, -0.994252, 0, 1, 0.7647059, 1,
-0.06719994, 1.556075, -0.8893536, 0, 1, 0.772549, 1,
-0.06309282, 0.4668348, -0.8149771, 0, 1, 0.7764706, 1,
-0.0559762, 0.3467002, -0.3007816, 0, 1, 0.7843137, 1,
-0.05296337, -0.9472678, -3.76788, 0, 1, 0.7882353, 1,
-0.05213379, 0.5897368, -1.186957, 0, 1, 0.7960784, 1,
-0.04993806, -1.77211, -3.402287, 0, 1, 0.8039216, 1,
-0.04833402, 1.712088, -1.066899, 0, 1, 0.8078431, 1,
-0.04367418, -0.4560415, -2.401293, 0, 1, 0.8156863, 1,
-0.0427315, -0.2351633, -2.091558, 0, 1, 0.8196079, 1,
-0.03906741, 0.3887153, -0.6861167, 0, 1, 0.827451, 1,
-0.0386107, 0.20248, -1.66546, 0, 1, 0.8313726, 1,
-0.03301129, -1.48751, -2.166986, 0, 1, 0.8392157, 1,
-0.03298235, 1.090205, -1.539708, 0, 1, 0.8431373, 1,
-0.03044098, 1.389596, -0.09274954, 0, 1, 0.8509804, 1,
-0.02666044, -1.31318, -2.256641, 0, 1, 0.854902, 1,
-0.0260605, 1.226855, 0.2041829, 0, 1, 0.8627451, 1,
-0.02595275, 0.5431961, -0.1639244, 0, 1, 0.8666667, 1,
-0.02178522, 0.130849, 0.05128345, 0, 1, 0.8745098, 1,
-0.01754754, -1.471871, -2.43609, 0, 1, 0.8784314, 1,
-0.01332799, -0.3393773, -3.685086, 0, 1, 0.8862745, 1,
-0.01127234, -1.037356, -2.901165, 0, 1, 0.8901961, 1,
-0.01100994, -0.9307585, -3.41433, 0, 1, 0.8980392, 1,
-0.01022685, 1.082521, 0.4436461, 0, 1, 0.9058824, 1,
-0.009098587, -1.544867, -2.984338, 0, 1, 0.9098039, 1,
-0.008505731, 0.1564339, 0.1146502, 0, 1, 0.9176471, 1,
-0.007595294, -1.411942, -3.508549, 0, 1, 0.9215686, 1,
-0.007039862, 1.237475, 1.296586, 0, 1, 0.9294118, 1,
-0.006967452, 0.5852943, 1.330023, 0, 1, 0.9333333, 1,
-0.005253147, -0.05401484, -3.218549, 0, 1, 0.9411765, 1,
-0.005015404, -0.8971114, -3.630392, 0, 1, 0.945098, 1,
-0.004291164, 0.7193324, 0.3146217, 0, 1, 0.9529412, 1,
0.009841498, 0.3246645, 0.2857873, 0, 1, 0.9568627, 1,
0.01092252, 2.23059, 0.4248965, 0, 1, 0.9647059, 1,
0.01367975, 0.5870867, -1.758097, 0, 1, 0.9686275, 1,
0.02365781, -1.103616, 4.46214, 0, 1, 0.9764706, 1,
0.02655128, -0.4111174, 3.819623, 0, 1, 0.9803922, 1,
0.02928637, -1.506451, 2.827231, 0, 1, 0.9882353, 1,
0.03003078, 0.488075, 2.402056, 0, 1, 0.9921569, 1,
0.03707035, -0.6443656, 3.241319, 0, 1, 1, 1,
0.04089117, 0.4037402, -0.3470049, 0, 0.9921569, 1, 1,
0.04243512, -0.007854642, 1.555992, 0, 0.9882353, 1, 1,
0.04264618, -0.7044893, 3.454922, 0, 0.9803922, 1, 1,
0.04315547, -2.556175, 2.995378, 0, 0.9764706, 1, 1,
0.04418468, -0.7658639, 2.115551, 0, 0.9686275, 1, 1,
0.04673716, -0.1668998, 3.425627, 0, 0.9647059, 1, 1,
0.05465711, -0.9011437, 5.446351, 0, 0.9568627, 1, 1,
0.05547119, 0.09803153, 1.23151, 0, 0.9529412, 1, 1,
0.05622497, -0.6118304, 3.064705, 0, 0.945098, 1, 1,
0.0563263, 1.745743, 2.027093, 0, 0.9411765, 1, 1,
0.05687748, 1.331446, 1.342696, 0, 0.9333333, 1, 1,
0.06120619, -1.412999, 1.850112, 0, 0.9294118, 1, 1,
0.06237905, -1.382722, 1.397793, 0, 0.9215686, 1, 1,
0.0636302, -0.9188258, 3.519403, 0, 0.9176471, 1, 1,
0.06426079, 0.9326374, -0.960776, 0, 0.9098039, 1, 1,
0.06782271, 0.287782, 1.144359, 0, 0.9058824, 1, 1,
0.07244159, -0.778748, 2.935235, 0, 0.8980392, 1, 1,
0.08008719, -0.1238345, 1.798576, 0, 0.8901961, 1, 1,
0.08215756, 0.6731133, 1.384113, 0, 0.8862745, 1, 1,
0.08368187, 1.783253, 0.006309867, 0, 0.8784314, 1, 1,
0.0851574, 1.449483, -1.198736, 0, 0.8745098, 1, 1,
0.08831773, -1.62777, 2.707131, 0, 0.8666667, 1, 1,
0.09161558, 0.0880607, 0.9179836, 0, 0.8627451, 1, 1,
0.09300777, 1.018223, 0.288939, 0, 0.854902, 1, 1,
0.09306134, -0.08799579, 1.514517, 0, 0.8509804, 1, 1,
0.09312004, 0.1229035, 1.719816, 0, 0.8431373, 1, 1,
0.09735812, -0.431313, 2.253928, 0, 0.8392157, 1, 1,
0.1016083, 0.4487534, 0.1480206, 0, 0.8313726, 1, 1,
0.1110405, 0.947071, 0.2919583, 0, 0.827451, 1, 1,
0.1137613, 1.089928, 0.7627415, 0, 0.8196079, 1, 1,
0.1149206, -0.27346, 0.281532, 0, 0.8156863, 1, 1,
0.1174014, -0.999312, 2.814726, 0, 0.8078431, 1, 1,
0.1178413, 0.5651287, 0.9623612, 0, 0.8039216, 1, 1,
0.1183251, -0.1452193, 2.27257, 0, 0.7960784, 1, 1,
0.1187532, 0.3977862, 0.3285925, 0, 0.7882353, 1, 1,
0.1188397, 2.006499, 1.001784, 0, 0.7843137, 1, 1,
0.1210814, 1.133629, -1.997113, 0, 0.7764706, 1, 1,
0.12509, 1.114393, -0.8883442, 0, 0.772549, 1, 1,
0.1258687, 0.3727697, 0.1011255, 0, 0.7647059, 1, 1,
0.1269135, 0.06295896, 1.084327, 0, 0.7607843, 1, 1,
0.1280572, 0.7672679, 2.12043, 0, 0.7529412, 1, 1,
0.1290496, -0.3808355, 2.232655, 0, 0.7490196, 1, 1,
0.1300083, 1.251366, 2.739125, 0, 0.7411765, 1, 1,
0.1372086, 0.4685759, -1.645123, 0, 0.7372549, 1, 1,
0.1411882, -0.2252331, 1.521097, 0, 0.7294118, 1, 1,
0.1460042, -1.747297, 2.084971, 0, 0.7254902, 1, 1,
0.1476921, -0.1281732, 3.439395, 0, 0.7176471, 1, 1,
0.1510855, -0.3095855, 2.997276, 0, 0.7137255, 1, 1,
0.1557184, 0.854592, 1.392668, 0, 0.7058824, 1, 1,
0.1601669, -0.1739851, 2.160846, 0, 0.6980392, 1, 1,
0.1666031, -0.3418885, 1.829354, 0, 0.6941177, 1, 1,
0.1680946, 1.321701, 0.3112911, 0, 0.6862745, 1, 1,
0.1706302, -0.3753972, 1.924921, 0, 0.682353, 1, 1,
0.1717425, -0.04898294, 3.327653, 0, 0.6745098, 1, 1,
0.1729921, 2.515547, -0.8327177, 0, 0.6705883, 1, 1,
0.175944, 0.3370627, 1.00119, 0, 0.6627451, 1, 1,
0.1765888, -0.6254823, 2.349804, 0, 0.6588235, 1, 1,
0.1821912, -1.356977, 3.499053, 0, 0.6509804, 1, 1,
0.1840979, -0.8617313, 3.482153, 0, 0.6470588, 1, 1,
0.1859854, -0.1262073, 2.823799, 0, 0.6392157, 1, 1,
0.1875917, 1.066587, 1.314139, 0, 0.6352941, 1, 1,
0.1888182, -0.4356329, 2.31829, 0, 0.627451, 1, 1,
0.1901664, -0.4351, 1.574166, 0, 0.6235294, 1, 1,
0.191331, -0.8185456, 3.81809, 0, 0.6156863, 1, 1,
0.1919772, -1.948578, 2.48356, 0, 0.6117647, 1, 1,
0.1942266, -0.1742199, 4.574231, 0, 0.6039216, 1, 1,
0.1952705, 0.6491129, -0.3922124, 0, 0.5960785, 1, 1,
0.1977904, -2.11811, 2.758995, 0, 0.5921569, 1, 1,
0.1986322, -0.9777004, 3.001044, 0, 0.5843138, 1, 1,
0.2038002, 0.6662145, 1.657059, 0, 0.5803922, 1, 1,
0.2054881, -2.002404, 2.656609, 0, 0.572549, 1, 1,
0.2110656, 0.3554445, 0.4269681, 0, 0.5686275, 1, 1,
0.2188866, -0.01237135, 0.6548237, 0, 0.5607843, 1, 1,
0.2208578, 0.3800147, 1.284139, 0, 0.5568628, 1, 1,
0.2215758, -1.097041, 2.315994, 0, 0.5490196, 1, 1,
0.221993, -0.6382026, 2.259071, 0, 0.5450981, 1, 1,
0.2228059, 1.472571, 0.4029416, 0, 0.5372549, 1, 1,
0.2256799, -0.3858026, 3.115004, 0, 0.5333334, 1, 1,
0.2273805, -0.09308489, 1.925242, 0, 0.5254902, 1, 1,
0.2292644, 0.5569422, 0.5427384, 0, 0.5215687, 1, 1,
0.2294089, -1.365688, 2.752982, 0, 0.5137255, 1, 1,
0.2307454, 0.1125433, 0.06859996, 0, 0.509804, 1, 1,
0.2367269, 2.906393, 0.7844518, 0, 0.5019608, 1, 1,
0.2370639, -1.882368, 1.067146, 0, 0.4941176, 1, 1,
0.2388353, -0.9194322, 2.894459, 0, 0.4901961, 1, 1,
0.2389315, -0.2226883, 3.092033, 0, 0.4823529, 1, 1,
0.2393396, -0.7682248, 2.8411, 0, 0.4784314, 1, 1,
0.2397526, -0.7418933, 4.468593, 0, 0.4705882, 1, 1,
0.2399054, -1.065401, 2.334419, 0, 0.4666667, 1, 1,
0.2415553, 1.969383, -0.2531332, 0, 0.4588235, 1, 1,
0.2435403, 1.150935, -0.165395, 0, 0.454902, 1, 1,
0.2451127, 0.4279485, 0.9413071, 0, 0.4470588, 1, 1,
0.2497651, -1.299002, 3.685767, 0, 0.4431373, 1, 1,
0.2574962, 1.530505, 1.140836, 0, 0.4352941, 1, 1,
0.270024, -0.1443128, 2.936228, 0, 0.4313726, 1, 1,
0.2702051, -0.9782733, 4.686899, 0, 0.4235294, 1, 1,
0.2776884, -0.8219944, 2.939504, 0, 0.4196078, 1, 1,
0.2792335, 1.337949, 1.405705, 0, 0.4117647, 1, 1,
0.2811821, -0.2634032, 3.026391, 0, 0.4078431, 1, 1,
0.282188, 0.7985653, 0.04078132, 0, 0.4, 1, 1,
0.2870664, -0.2944071, 4.44694, 0, 0.3921569, 1, 1,
0.2901407, -0.6390748, 2.340702, 0, 0.3882353, 1, 1,
0.2903204, 1.82132, -0.4124885, 0, 0.3803922, 1, 1,
0.2914114, -0.9780871, 2.244092, 0, 0.3764706, 1, 1,
0.2935841, 1.027507, 0.6236749, 0, 0.3686275, 1, 1,
0.2954242, -1.868574, 2.336421, 0, 0.3647059, 1, 1,
0.2988002, -1.271001, 3.375459, 0, 0.3568628, 1, 1,
0.300421, -0.4528851, 0.6213886, 0, 0.3529412, 1, 1,
0.3017885, 0.256297, 2.467594, 0, 0.345098, 1, 1,
0.3044944, -0.5804081, 1.845058, 0, 0.3411765, 1, 1,
0.3053779, 1.178023, 0.3531795, 0, 0.3333333, 1, 1,
0.3053944, 0.04497205, -0.1985358, 0, 0.3294118, 1, 1,
0.3070485, 1.536999, 1.874298, 0, 0.3215686, 1, 1,
0.3076994, 0.7895, 0.1784613, 0, 0.3176471, 1, 1,
0.3081318, -1.420511, 3.914522, 0, 0.3098039, 1, 1,
0.3088027, 0.9239836, 1.490212, 0, 0.3058824, 1, 1,
0.3131295, 0.6473773, 0.7186185, 0, 0.2980392, 1, 1,
0.3180377, -0.308046, 1.18124, 0, 0.2901961, 1, 1,
0.3184105, -0.2279642, 3.824912, 0, 0.2862745, 1, 1,
0.3196885, 0.4044412, 2.828192, 0, 0.2784314, 1, 1,
0.3204753, 1.375414, 2.324083, 0, 0.2745098, 1, 1,
0.3210691, -1.357901, 3.426764, 0, 0.2666667, 1, 1,
0.3234141, 1.287497, 1.011129, 0, 0.2627451, 1, 1,
0.3240771, 1.445598, -1.000752, 0, 0.254902, 1, 1,
0.3276314, -0.984697, 3.073996, 0, 0.2509804, 1, 1,
0.3308459, 1.074299, -0.85896, 0, 0.2431373, 1, 1,
0.3353377, -0.4641892, 3.111921, 0, 0.2392157, 1, 1,
0.3413059, 0.2854076, -0.09287312, 0, 0.2313726, 1, 1,
0.3418005, -0.1608264, 2.011867, 0, 0.227451, 1, 1,
0.3428385, 1.464781, 0.666261, 0, 0.2196078, 1, 1,
0.3440649, -1.141844, 2.029584, 0, 0.2156863, 1, 1,
0.3444945, -0.0828173, 1.703227, 0, 0.2078431, 1, 1,
0.3456627, -1.313319, 3.262061, 0, 0.2039216, 1, 1,
0.3468198, -0.2069518, 2.152024, 0, 0.1960784, 1, 1,
0.3492832, -1.11853, 3.17389, 0, 0.1882353, 1, 1,
0.3529376, 0.4087333, 0.008306995, 0, 0.1843137, 1, 1,
0.357168, -0.4788754, 2.512289, 0, 0.1764706, 1, 1,
0.3622795, 2.004766, -0.3627394, 0, 0.172549, 1, 1,
0.3624373, 0.7834347, 0.8101979, 0, 0.1647059, 1, 1,
0.3652143, -0.700092, 3.212321, 0, 0.1607843, 1, 1,
0.3655669, -1.204204, 1.907694, 0, 0.1529412, 1, 1,
0.366905, -2.231155, 1.493739, 0, 0.1490196, 1, 1,
0.3721781, 1.328313, -0.9590236, 0, 0.1411765, 1, 1,
0.3745153, 0.5153343, 1.169537, 0, 0.1372549, 1, 1,
0.3750859, 1.312269, -0.1547785, 0, 0.1294118, 1, 1,
0.3831459, 1.243946, 0.761785, 0, 0.1254902, 1, 1,
0.3848381, 0.4113704, 1.882545, 0, 0.1176471, 1, 1,
0.3851661, 1.469095, 0.2939594, 0, 0.1137255, 1, 1,
0.3857786, 0.3742655, 0.2823409, 0, 0.1058824, 1, 1,
0.3882808, -0.4515475, 1.887164, 0, 0.09803922, 1, 1,
0.3901144, 0.5630718, 0.6303783, 0, 0.09411765, 1, 1,
0.3912873, 0.2963761, 0.6417813, 0, 0.08627451, 1, 1,
0.3913794, 0.3729719, 1.036154, 0, 0.08235294, 1, 1,
0.3937861, -1.411203, 1.187673, 0, 0.07450981, 1, 1,
0.3951666, -2.142526, 2.841475, 0, 0.07058824, 1, 1,
0.3958136, 0.2521313, 1.073936, 0, 0.0627451, 1, 1,
0.407057, -0.5347667, 2.154142, 0, 0.05882353, 1, 1,
0.4078861, -0.3436103, 2.713407, 0, 0.05098039, 1, 1,
0.4081076, -0.1999749, 1.03779, 0, 0.04705882, 1, 1,
0.4104204, 0.1096701, 2.387168, 0, 0.03921569, 1, 1,
0.4195147, -0.2653022, 2.066458, 0, 0.03529412, 1, 1,
0.4254225, 1.78857, -0.2067352, 0, 0.02745098, 1, 1,
0.4364278, -0.1814164, 1.757377, 0, 0.02352941, 1, 1,
0.4368673, 0.5796482, -0.6457356, 0, 0.01568628, 1, 1,
0.4408576, -0.5634648, 2.406937, 0, 0.01176471, 1, 1,
0.4462439, -1.500193, 2.206806, 0, 0.003921569, 1, 1,
0.4474299, -0.174483, 1.022434, 0.003921569, 0, 1, 1,
0.4481174, -0.4828955, 3.983421, 0.007843138, 0, 1, 1,
0.4534458, -1.905162, 4.277557, 0.01568628, 0, 1, 1,
0.4548447, 1.213779, 0.2409515, 0.01960784, 0, 1, 1,
0.459626, 0.03923983, 2.009173, 0.02745098, 0, 1, 1,
0.461711, -1.342215, 3.742369, 0.03137255, 0, 1, 1,
0.4625887, 1.621463, 0.9449355, 0.03921569, 0, 1, 1,
0.4639426, 1.101254, 0.559579, 0.04313726, 0, 1, 1,
0.4695251, 0.3589835, 2.0337, 0.05098039, 0, 1, 1,
0.4698389, -0.02899382, 1.435835, 0.05490196, 0, 1, 1,
0.4715901, -0.762149, 3.126449, 0.0627451, 0, 1, 1,
0.4748709, 0.7839097, -1.137778, 0.06666667, 0, 1, 1,
0.475684, -0.783498, 3.060792, 0.07450981, 0, 1, 1,
0.4782164, -0.05227195, 0.7103058, 0.07843138, 0, 1, 1,
0.479402, 0.6260385, 1.563238, 0.08627451, 0, 1, 1,
0.481618, 1.010355, -0.5142691, 0.09019608, 0, 1, 1,
0.4829357, 0.2415028, 0.2498945, 0.09803922, 0, 1, 1,
0.484219, 1.040357, -0.2946859, 0.1058824, 0, 1, 1,
0.484311, 2.567221, 0.2916823, 0.1098039, 0, 1, 1,
0.4881792, -1.63663, 2.615847, 0.1176471, 0, 1, 1,
0.4904082, 0.03196038, -0.1954907, 0.1215686, 0, 1, 1,
0.4909848, 0.1115538, 3.502439, 0.1294118, 0, 1, 1,
0.4914248, 0.683736, -0.5572423, 0.1333333, 0, 1, 1,
0.4925019, -0.7735989, 2.909736, 0.1411765, 0, 1, 1,
0.4947738, 1.023378, -0.2896091, 0.145098, 0, 1, 1,
0.4959419, -0.6410037, 1.083787, 0.1529412, 0, 1, 1,
0.4970747, 0.175255, 0.2127711, 0.1568628, 0, 1, 1,
0.5031005, -1.672282, 3.393912, 0.1647059, 0, 1, 1,
0.5041703, 0.9634515, 1.207029, 0.1686275, 0, 1, 1,
0.5064389, -0.4143644, 2.203666, 0.1764706, 0, 1, 1,
0.5083628, 0.4944905, 0.4208659, 0.1803922, 0, 1, 1,
0.5136546, 1.711715, -0.6712226, 0.1882353, 0, 1, 1,
0.517934, 0.07854743, 1.174004, 0.1921569, 0, 1, 1,
0.5210454, 1.192011, -1.214101, 0.2, 0, 1, 1,
0.526567, -1.237017, 1.452556, 0.2078431, 0, 1, 1,
0.5276913, -2.130955, 3.145524, 0.2117647, 0, 1, 1,
0.5311208, -0.9480134, 2.262408, 0.2196078, 0, 1, 1,
0.5327839, -0.8034344, 4.321076, 0.2235294, 0, 1, 1,
0.5330819, -0.3140714, 1.006243, 0.2313726, 0, 1, 1,
0.5334606, 0.7636955, 2.494684, 0.2352941, 0, 1, 1,
0.5370576, 1.825176, 1.368211, 0.2431373, 0, 1, 1,
0.5405432, -0.6111708, 2.351562, 0.2470588, 0, 1, 1,
0.5408244, 0.9043198, -1.274401, 0.254902, 0, 1, 1,
0.5455178, -0.2063554, 3.183169, 0.2588235, 0, 1, 1,
0.5465528, -1.080865, 3.068253, 0.2666667, 0, 1, 1,
0.5483476, 1.459024, 1.522056, 0.2705882, 0, 1, 1,
0.5528004, 0.4350688, 0.4115317, 0.2784314, 0, 1, 1,
0.5534585, -0.6115199, 3.748418, 0.282353, 0, 1, 1,
0.5601386, -1.344084, 1.566458, 0.2901961, 0, 1, 1,
0.5742653, -1.505899, 2.693888, 0.2941177, 0, 1, 1,
0.5765947, -0.12447, 0.5929162, 0.3019608, 0, 1, 1,
0.5781997, -2.129005, 3.753206, 0.3098039, 0, 1, 1,
0.5820811, 1.059521, 1.117964, 0.3137255, 0, 1, 1,
0.6013867, -1.280667, 2.918401, 0.3215686, 0, 1, 1,
0.6018569, 0.08646117, 1.453145, 0.3254902, 0, 1, 1,
0.6033209, -0.09353198, 3.000129, 0.3333333, 0, 1, 1,
0.6033251, 0.1445948, 1.82584, 0.3372549, 0, 1, 1,
0.6086389, -0.5419042, 4.485397, 0.345098, 0, 1, 1,
0.6126717, 0.3601877, 2.211517, 0.3490196, 0, 1, 1,
0.6191813, 0.7501366, 1.063725, 0.3568628, 0, 1, 1,
0.6194783, -0.9385816, 0.8169281, 0.3607843, 0, 1, 1,
0.6207131, 1.351256, 0.377212, 0.3686275, 0, 1, 1,
0.6339296, -0.150743, 1.721717, 0.372549, 0, 1, 1,
0.640029, -0.7420156, 1.850167, 0.3803922, 0, 1, 1,
0.6451962, -0.1039354, 1.41998, 0.3843137, 0, 1, 1,
0.6468701, -0.8897519, 3.921853, 0.3921569, 0, 1, 1,
0.6506835, -0.4212399, 1.476852, 0.3960784, 0, 1, 1,
0.6541513, -1.654436, 1.986223, 0.4039216, 0, 1, 1,
0.6571025, 1.412807, 1.486348, 0.4117647, 0, 1, 1,
0.6580932, 1.258463, 1.131783, 0.4156863, 0, 1, 1,
0.6738994, -1.452189, 2.593358, 0.4235294, 0, 1, 1,
0.6837212, 2.045618, -0.9816719, 0.427451, 0, 1, 1,
0.6849048, -0.4672701, 2.664023, 0.4352941, 0, 1, 1,
0.6861101, -2.443475, 1.937769, 0.4392157, 0, 1, 1,
0.690829, -1.49834, 3.000575, 0.4470588, 0, 1, 1,
0.6916761, -0.4649937, 2.629371, 0.4509804, 0, 1, 1,
0.6996765, 0.6868566, -0.5683228, 0.4588235, 0, 1, 1,
0.7038425, -0.829115, 0.9292307, 0.4627451, 0, 1, 1,
0.7048048, 0.5205303, -0.4927252, 0.4705882, 0, 1, 1,
0.7062312, 0.5056082, 0.139125, 0.4745098, 0, 1, 1,
0.7140732, -0.779717, 1.443487, 0.4823529, 0, 1, 1,
0.7177706, -1.035804, 1.671159, 0.4862745, 0, 1, 1,
0.7202371, 1.254942, -0.2604856, 0.4941176, 0, 1, 1,
0.724445, -0.3873832, 2.472189, 0.5019608, 0, 1, 1,
0.7293531, -0.2021008, 2.416474, 0.5058824, 0, 1, 1,
0.7347818, -2.28002, 3.731272, 0.5137255, 0, 1, 1,
0.7386624, 0.9836342, 1.215091, 0.5176471, 0, 1, 1,
0.7402707, -0.4822345, 1.769604, 0.5254902, 0, 1, 1,
0.7487696, 1.046189, 2.405219, 0.5294118, 0, 1, 1,
0.751757, -2.515566, 2.994073, 0.5372549, 0, 1, 1,
0.7529683, -0.5577245, 1.076059, 0.5411765, 0, 1, 1,
0.754988, -0.7621464, 3.310639, 0.5490196, 0, 1, 1,
0.7564614, -0.8296782, 2.168585, 0.5529412, 0, 1, 1,
0.7608429, 0.1782881, 1.55576, 0.5607843, 0, 1, 1,
0.7681853, 0.3612418, 0.9331698, 0.5647059, 0, 1, 1,
0.7699235, -0.8610264, 2.002537, 0.572549, 0, 1, 1,
0.7736657, -0.1191678, 1.704479, 0.5764706, 0, 1, 1,
0.7802432, -1.059482, 3.309568, 0.5843138, 0, 1, 1,
0.7830387, 0.6179441, -0.5218238, 0.5882353, 0, 1, 1,
0.7871444, -0.01015796, 0.8422631, 0.5960785, 0, 1, 1,
0.7877842, 0.7397286, 0.6514689, 0.6039216, 0, 1, 1,
0.7880604, 1.148384, -0.2218271, 0.6078432, 0, 1, 1,
0.7880792, -0.05179815, 3.891415, 0.6156863, 0, 1, 1,
0.7899833, -0.4016562, 3.573258, 0.6196079, 0, 1, 1,
0.7953189, 0.946223, -0.2139127, 0.627451, 0, 1, 1,
0.8022559, -0.4144317, 1.25481, 0.6313726, 0, 1, 1,
0.8042592, 1.05656, 2.825047, 0.6392157, 0, 1, 1,
0.8054758, -0.4348374, 2.891723, 0.6431373, 0, 1, 1,
0.806906, -0.1184106, 1.254411, 0.6509804, 0, 1, 1,
0.8113801, -1.368009, 1.978678, 0.654902, 0, 1, 1,
0.813059, 1.895597, -1.695781, 0.6627451, 0, 1, 1,
0.8140491, 1.227964, -0.4529214, 0.6666667, 0, 1, 1,
0.8149055, 2.822671, -2.262843, 0.6745098, 0, 1, 1,
0.8206248, -0.1384756, 3.491765, 0.6784314, 0, 1, 1,
0.8252833, -0.01229163, 1.068906, 0.6862745, 0, 1, 1,
0.8254735, -1.474229, 2.220712, 0.6901961, 0, 1, 1,
0.8256164, 0.21919, 2.181181, 0.6980392, 0, 1, 1,
0.8312662, 0.3373008, 1.861895, 0.7058824, 0, 1, 1,
0.8330185, -0.6644898, 2.455198, 0.7098039, 0, 1, 1,
0.839016, 1.34343, 2.030684, 0.7176471, 0, 1, 1,
0.8434635, 0.8252671, 1.242248, 0.7215686, 0, 1, 1,
0.8485418, -0.5374391, 2.060048, 0.7294118, 0, 1, 1,
0.853867, -1.656457, 3.783026, 0.7333333, 0, 1, 1,
0.8562873, 1.790985, 0.39118, 0.7411765, 0, 1, 1,
0.8563941, 1.468468, 2.838233, 0.7450981, 0, 1, 1,
0.8565627, -0.5648502, 3.175198, 0.7529412, 0, 1, 1,
0.8601757, 0.3744831, 1.402066, 0.7568628, 0, 1, 1,
0.8623225, 0.03416346, 2.30168, 0.7647059, 0, 1, 1,
0.8668853, -0.3692732, 0.2724344, 0.7686275, 0, 1, 1,
0.869569, 0.8468448, 0.05803958, 0.7764706, 0, 1, 1,
0.8714867, 0.7861152, 0.6425108, 0.7803922, 0, 1, 1,
0.8783488, -0.984176, 3.685945, 0.7882353, 0, 1, 1,
0.8884504, -0.02624379, 0.6316984, 0.7921569, 0, 1, 1,
0.8896477, -1.05853, 2.928451, 0.8, 0, 1, 1,
0.9094293, 0.00552104, 3.557565, 0.8078431, 0, 1, 1,
0.9104733, 1.083747, 0.00764627, 0.8117647, 0, 1, 1,
0.913218, 0.05362806, 0.8376396, 0.8196079, 0, 1, 1,
0.9150973, 1.713048, -0.4842041, 0.8235294, 0, 1, 1,
0.9164281, 0.7965108, 1.232998, 0.8313726, 0, 1, 1,
0.9211811, 0.7995706, 2.83794, 0.8352941, 0, 1, 1,
0.9294984, 0.1512083, 1.052167, 0.8431373, 0, 1, 1,
0.9380839, -0.6201692, 0.9738591, 0.8470588, 0, 1, 1,
0.9398638, 1.101848, 0.2072143, 0.854902, 0, 1, 1,
0.9405631, 0.6327543, 3.809143, 0.8588235, 0, 1, 1,
0.9434092, 0.7077998, 2.390108, 0.8666667, 0, 1, 1,
0.9446644, -0.5591235, 1.134037, 0.8705882, 0, 1, 1,
0.958368, -0.4071423, 2.253706, 0.8784314, 0, 1, 1,
0.9607221, 1.138182, -0.2453561, 0.8823529, 0, 1, 1,
0.9640378, 0.3776362, 3.784011, 0.8901961, 0, 1, 1,
0.9705293, 0.6390807, 2.485269, 0.8941177, 0, 1, 1,
0.9723547, -0.2004302, 1.076999, 0.9019608, 0, 1, 1,
0.9726506, 1.294425, -0.05833611, 0.9098039, 0, 1, 1,
0.9755632, 1.054179, 0.5942895, 0.9137255, 0, 1, 1,
0.9799738, 1.162761, 0.4342468, 0.9215686, 0, 1, 1,
0.9818102, 0.3427522, 3.215423, 0.9254902, 0, 1, 1,
0.983256, 0.1936217, 1.595316, 0.9333333, 0, 1, 1,
0.9834402, 1.085142, 1.321406, 0.9372549, 0, 1, 1,
0.983929, 0.1390369, 2.046858, 0.945098, 0, 1, 1,
0.9888966, -1.532801, 2.161531, 0.9490196, 0, 1, 1,
0.9914441, 0.6484576, 1.591056, 0.9568627, 0, 1, 1,
0.9923289, 1.178105, 0.5652034, 0.9607843, 0, 1, 1,
0.999907, 0.7318423, -0.09086506, 0.9686275, 0, 1, 1,
1.000448, 0.5089818, -0.06892484, 0.972549, 0, 1, 1,
1.001846, 0.2355044, 3.332626, 0.9803922, 0, 1, 1,
1.00458, 1.589964, -0.959977, 0.9843137, 0, 1, 1,
1.012096, 0.236394, 0.1275227, 0.9921569, 0, 1, 1,
1.013452, 1.589119, -0.9758128, 0.9960784, 0, 1, 1,
1.014347, -0.9604793, 3.788547, 1, 0, 0.9960784, 1,
1.020612, 1.235264, -1.071411, 1, 0, 0.9882353, 1,
1.021465, 0.8585655, -0.01548533, 1, 0, 0.9843137, 1,
1.022801, -0.3532038, 1.474357, 1, 0, 0.9764706, 1,
1.022897, 2.321031, -0.07551455, 1, 0, 0.972549, 1,
1.024147, 1.370316, 2.002237, 1, 0, 0.9647059, 1,
1.024799, -0.3250397, 0.297702, 1, 0, 0.9607843, 1,
1.025243, -1.286892, 2.861491, 1, 0, 0.9529412, 1,
1.027417, -0.3129661, 3.571251, 1, 0, 0.9490196, 1,
1.029988, -0.4059635, 1.650419, 1, 0, 0.9411765, 1,
1.030084, -0.1269437, 2.603208, 1, 0, 0.9372549, 1,
1.030502, -1.612144, 3.059432, 1, 0, 0.9294118, 1,
1.03217, -0.0178005, 2.298988, 1, 0, 0.9254902, 1,
1.036561, 0.1989518, 0.2821473, 1, 0, 0.9176471, 1,
1.042488, -0.1329185, 0.7606809, 1, 0, 0.9137255, 1,
1.048535, 0.6760862, -0.1775293, 1, 0, 0.9058824, 1,
1.055304, 2.081282, -0.5266865, 1, 0, 0.9019608, 1,
1.057503, 0.6660312, 1.167554, 1, 0, 0.8941177, 1,
1.057708, 1.234344, 0.8339794, 1, 0, 0.8862745, 1,
1.0578, -0.5156843, 1.877867, 1, 0, 0.8823529, 1,
1.059094, -0.6680944, 1.030775, 1, 0, 0.8745098, 1,
1.067484, -1.285526, 1.829009, 1, 0, 0.8705882, 1,
1.06835, -1.528813, 2.707972, 1, 0, 0.8627451, 1,
1.069096, 2.296954, 0.2144129, 1, 0, 0.8588235, 1,
1.076996, 0.5312141, 1.354323, 1, 0, 0.8509804, 1,
1.082752, 0.2930532, 1.978889, 1, 0, 0.8470588, 1,
1.086936, 1.042412, 0.09959839, 1, 0, 0.8392157, 1,
1.097839, 0.3366508, 0.9538684, 1, 0, 0.8352941, 1,
1.101537, 0.5161089, -0.06521358, 1, 0, 0.827451, 1,
1.102473, 0.08862311, 2.044959, 1, 0, 0.8235294, 1,
1.113271, -1.222635, 1.218502, 1, 0, 0.8156863, 1,
1.122587, 1.281425, -0.525456, 1, 0, 0.8117647, 1,
1.12333, -1.346593, 3.87386, 1, 0, 0.8039216, 1,
1.13366, -0.263631, 1.707636, 1, 0, 0.7960784, 1,
1.133969, -0.6913303, 3.278229, 1, 0, 0.7921569, 1,
1.142303, -0.4645229, 0.4417979, 1, 0, 0.7843137, 1,
1.145355, -0.7704365, 0.389638, 1, 0, 0.7803922, 1,
1.148488, 0.6706831, 1.67305, 1, 0, 0.772549, 1,
1.153792, 0.1351953, 1.138756, 1, 0, 0.7686275, 1,
1.163351, 0.3923874, -0.3987735, 1, 0, 0.7607843, 1,
1.163851, 0.9587182, 2.380145, 1, 0, 0.7568628, 1,
1.167921, -0.1089121, 1.854973, 1, 0, 0.7490196, 1,
1.176598, -1.123265, 1.090247, 1, 0, 0.7450981, 1,
1.17947, 1.59025, 2.712187, 1, 0, 0.7372549, 1,
1.18853, 1.211103, -1.086495, 1, 0, 0.7333333, 1,
1.191446, -1.088251, 2.513623, 1, 0, 0.7254902, 1,
1.193654, 1.441908, 0.5919144, 1, 0, 0.7215686, 1,
1.196183, 0.1302626, 1.529618, 1, 0, 0.7137255, 1,
1.198311, -1.125499, 2.787116, 1, 0, 0.7098039, 1,
1.200324, -0.124902, 1.340218, 1, 0, 0.7019608, 1,
1.201043, -0.8496223, 2.262503, 1, 0, 0.6941177, 1,
1.201781, 0.4163847, 1.154429, 1, 0, 0.6901961, 1,
1.204305, 0.2357737, 3.128452, 1, 0, 0.682353, 1,
1.207349, 0.9580638, -0.4667123, 1, 0, 0.6784314, 1,
1.213161, 3.081894, -0.8110833, 1, 0, 0.6705883, 1,
1.213863, -0.6780016, 2.567369, 1, 0, 0.6666667, 1,
1.221142, -1.644843, 2.131831, 1, 0, 0.6588235, 1,
1.226246, -0.4210809, 2.824179, 1, 0, 0.654902, 1,
1.227209, -0.7645099, 1.381346, 1, 0, 0.6470588, 1,
1.227238, -0.8176746, 1.822556, 1, 0, 0.6431373, 1,
1.227794, -0.3075891, 1.826398, 1, 0, 0.6352941, 1,
1.239699, -2.83037, 1.626031, 1, 0, 0.6313726, 1,
1.240037, 1.164366, -0.4605586, 1, 0, 0.6235294, 1,
1.243279, 0.3439227, 0.441434, 1, 0, 0.6196079, 1,
1.250073, 0.2327172, 2.714218, 1, 0, 0.6117647, 1,
1.265329, 0.5688268, -0.3265566, 1, 0, 0.6078432, 1,
1.267525, -2.31794, 2.219705, 1, 0, 0.6, 1,
1.268785, 1.380634, 1.119425, 1, 0, 0.5921569, 1,
1.270638, -0.6708362, 1.782534, 1, 0, 0.5882353, 1,
1.271667, -1.729273, 2.55924, 1, 0, 0.5803922, 1,
1.273169, 0.09943578, 1.564005, 1, 0, 0.5764706, 1,
1.275567, -0.3038315, 3.944334, 1, 0, 0.5686275, 1,
1.278951, -1.822269, 2.512312, 1, 0, 0.5647059, 1,
1.281394, -0.6487206, 1.014592, 1, 0, 0.5568628, 1,
1.282472, -0.4351571, 1.282741, 1, 0, 0.5529412, 1,
1.29419, 1.662186, -0.1002021, 1, 0, 0.5450981, 1,
1.296156, -0.7131372, 1.197925, 1, 0, 0.5411765, 1,
1.31757, 0.4638856, 1.400542, 1, 0, 0.5333334, 1,
1.318745, 0.380589, 0.3207052, 1, 0, 0.5294118, 1,
1.338421, 0.191654, 0.9055039, 1, 0, 0.5215687, 1,
1.350949, -0.9018136, 3.25936, 1, 0, 0.5176471, 1,
1.352613, -1.531642, 1.863223, 1, 0, 0.509804, 1,
1.357407, 0.6940362, 0.6900835, 1, 0, 0.5058824, 1,
1.372439, 0.4843114, 2.419076, 1, 0, 0.4980392, 1,
1.38809, -2.238319, 2.966099, 1, 0, 0.4901961, 1,
1.388548, 0.4715795, 0.8656708, 1, 0, 0.4862745, 1,
1.395096, -0.1858767, 0.4678098, 1, 0, 0.4784314, 1,
1.40834, -1.361239, 3.304631, 1, 0, 0.4745098, 1,
1.410109, 0.9346002, 0.3781578, 1, 0, 0.4666667, 1,
1.414072, 1.248175, 0.7590625, 1, 0, 0.4627451, 1,
1.42477, -0.5862603, 2.450603, 1, 0, 0.454902, 1,
1.429542, 0.3510933, 1.050911, 1, 0, 0.4509804, 1,
1.43119, -0.9538873, 3.504271, 1, 0, 0.4431373, 1,
1.44032, 1.35497, -0.7116998, 1, 0, 0.4392157, 1,
1.449793, 1.317181, 2.537818, 1, 0, 0.4313726, 1,
1.479234, 0.5177855, 2.398558, 1, 0, 0.427451, 1,
1.482364, -0.6813925, 0.7219685, 1, 0, 0.4196078, 1,
1.488891, 2.617435, 0.4992224, 1, 0, 0.4156863, 1,
1.489028, 2.255691, 1.143565, 1, 0, 0.4078431, 1,
1.494006, 0.6679555, 2.244594, 1, 0, 0.4039216, 1,
1.498399, -0.5639605, 1.894977, 1, 0, 0.3960784, 1,
1.513234, -2.379581, 4.236804, 1, 0, 0.3882353, 1,
1.517141, 0.6838394, 1.293625, 1, 0, 0.3843137, 1,
1.518483, -0.7213174, 2.290022, 1, 0, 0.3764706, 1,
1.520251, 0.05340008, 0.625528, 1, 0, 0.372549, 1,
1.527629, -0.2280032, 2.629645, 1, 0, 0.3647059, 1,
1.528918, 0.2887666, 2.506413, 1, 0, 0.3607843, 1,
1.539165, -1.561149, 1.914337, 1, 0, 0.3529412, 1,
1.575515, 0.06880524, 1.858229, 1, 0, 0.3490196, 1,
1.576514, 0.2891029, 0.4920588, 1, 0, 0.3411765, 1,
1.592583, 0.3196759, 1.698618, 1, 0, 0.3372549, 1,
1.597023, 2.30503, 0.4123013, 1, 0, 0.3294118, 1,
1.598293, 1.994796, 0.2057412, 1, 0, 0.3254902, 1,
1.600119, 0.2327465, 1.599565, 1, 0, 0.3176471, 1,
1.603983, -1.540769, 2.731558, 1, 0, 0.3137255, 1,
1.612961, -0.1203556, 2.488879, 1, 0, 0.3058824, 1,
1.624343, 1.094942, -0.280183, 1, 0, 0.2980392, 1,
1.638529, 0.4517192, 1.39241, 1, 0, 0.2941177, 1,
1.638637, -0.7277204, 1.483667, 1, 0, 0.2862745, 1,
1.652167, -1.67145, 2.622445, 1, 0, 0.282353, 1,
1.655267, -1.092465, 1.126156, 1, 0, 0.2745098, 1,
1.679117, -0.01364076, 2.144284, 1, 0, 0.2705882, 1,
1.683542, 0.5187832, -0.1965979, 1, 0, 0.2627451, 1,
1.713489, -0.7368999, 2.533306, 1, 0, 0.2588235, 1,
1.728763, -1.480201, 2.326448, 1, 0, 0.2509804, 1,
1.74474, -0.2380988, 2.239403, 1, 0, 0.2470588, 1,
1.74782, -0.217077, 1.780284, 1, 0, 0.2392157, 1,
1.759506, 0.1930977, 2.941539, 1, 0, 0.2352941, 1,
1.777655, -0.9067982, 3.746345, 1, 0, 0.227451, 1,
1.784056, 1.418908, 1.837073, 1, 0, 0.2235294, 1,
1.796512, -1.299792, 3.573198, 1, 0, 0.2156863, 1,
1.802677, -0.06273961, 2.864525, 1, 0, 0.2117647, 1,
1.804449, 0.9885914, 0.7367149, 1, 0, 0.2039216, 1,
1.834623, 0.1544686, 2.760133, 1, 0, 0.1960784, 1,
1.836122, 1.875268, 1.875347, 1, 0, 0.1921569, 1,
1.858106, 0.4482407, 1.824572, 1, 0, 0.1843137, 1,
1.86143, -0.6968933, 2.767282, 1, 0, 0.1803922, 1,
1.870214, 2.362567, 0.02344696, 1, 0, 0.172549, 1,
1.874, -0.2354759, 2.480785, 1, 0, 0.1686275, 1,
1.896532, 0.9520325, -0.4811898, 1, 0, 0.1607843, 1,
1.935942, -1.090515, 1.32442, 1, 0, 0.1568628, 1,
1.95248, 1.077145, 0.8520963, 1, 0, 0.1490196, 1,
1.96041, 0.1408016, 2.83358, 1, 0, 0.145098, 1,
1.964373, -0.06383802, 2.342144, 1, 0, 0.1372549, 1,
2.001976, -0.8737157, 1.647012, 1, 0, 0.1333333, 1,
2.015951, -0.4390892, 1.147469, 1, 0, 0.1254902, 1,
2.02119, -0.3130819, 3.537481, 1, 0, 0.1215686, 1,
2.083282, -0.7218386, 1.466365, 1, 0, 0.1137255, 1,
2.090676, -1.15048, 0.1967194, 1, 0, 0.1098039, 1,
2.136163, -0.4995973, 2.441907, 1, 0, 0.1019608, 1,
2.146427, 0.2309752, 1.557384, 1, 0, 0.09411765, 1,
2.161306, 1.782018, 1.379521, 1, 0, 0.09019608, 1,
2.216846, -0.35394, 1.572723, 1, 0, 0.08235294, 1,
2.250155, -0.2497564, 0.3253491, 1, 0, 0.07843138, 1,
2.280996, 0.5004132, 0.3885607, 1, 0, 0.07058824, 1,
2.330473, 1.26069, 1.933835, 1, 0, 0.06666667, 1,
2.345214, 2.09762, 1.728449, 1, 0, 0.05882353, 1,
2.36309, 0.7625176, 2.632786, 1, 0, 0.05490196, 1,
2.375118, 0.5111066, 2.654008, 1, 0, 0.04705882, 1,
2.413676, 1.25694, 2.993413, 1, 0, 0.04313726, 1,
2.453443, 0.4203067, 0.8857287, 1, 0, 0.03529412, 1,
2.482852, 0.9884353, 1.549089, 1, 0, 0.03137255, 1,
2.59302, -1.392981, 2.965879, 1, 0, 0.02352941, 1,
2.963292, -1.040556, 3.688466, 1, 0, 0.01960784, 1,
3.01616, -0.9191414, 2.430692, 1, 0, 0.01176471, 1,
3.414186, 1.194072, 1.615482, 1, 0, 0.007843138, 1
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
0.1259172, -3.832499, -6.968589, 0, -0.5, 0.5, 0.5,
0.1259172, -3.832499, -6.968589, 1, -0.5, 0.5, 0.5,
0.1259172, -3.832499, -6.968589, 1, 1.5, 0.5, 0.5,
0.1259172, -3.832499, -6.968589, 0, 1.5, 0.5, 0.5
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
-4.277074, 0.1257621, -6.968589, 0, -0.5, 0.5, 0.5,
-4.277074, 0.1257621, -6.968589, 1, -0.5, 0.5, 0.5,
-4.277074, 0.1257621, -6.968589, 1, 1.5, 0.5, 0.5,
-4.277074, 0.1257621, -6.968589, 0, 1.5, 0.5, 0.5
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
-4.277074, -3.832499, 0.1385527, 0, -0.5, 0.5, 0.5,
-4.277074, -3.832499, 0.1385527, 1, -0.5, 0.5, 0.5,
-4.277074, -3.832499, 0.1385527, 1, 1.5, 0.5, 0.5,
-4.277074, -3.832499, 0.1385527, 0, 1.5, 0.5, 0.5
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
-3, -2.919054, -5.32848,
3, -2.919054, -5.32848,
-3, -2.919054, -5.32848,
-3, -3.071295, -5.601831,
-2, -2.919054, -5.32848,
-2, -3.071295, -5.601831,
-1, -2.919054, -5.32848,
-1, -3.071295, -5.601831,
0, -2.919054, -5.32848,
0, -3.071295, -5.601831,
1, -2.919054, -5.32848,
1, -3.071295, -5.601831,
2, -2.919054, -5.32848,
2, -3.071295, -5.601831,
3, -2.919054, -5.32848,
3, -3.071295, -5.601831
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
-3, -3.375776, -6.148534, 0, -0.5, 0.5, 0.5,
-3, -3.375776, -6.148534, 1, -0.5, 0.5, 0.5,
-3, -3.375776, -6.148534, 1, 1.5, 0.5, 0.5,
-3, -3.375776, -6.148534, 0, 1.5, 0.5, 0.5,
-2, -3.375776, -6.148534, 0, -0.5, 0.5, 0.5,
-2, -3.375776, -6.148534, 1, -0.5, 0.5, 0.5,
-2, -3.375776, -6.148534, 1, 1.5, 0.5, 0.5,
-2, -3.375776, -6.148534, 0, 1.5, 0.5, 0.5,
-1, -3.375776, -6.148534, 0, -0.5, 0.5, 0.5,
-1, -3.375776, -6.148534, 1, -0.5, 0.5, 0.5,
-1, -3.375776, -6.148534, 1, 1.5, 0.5, 0.5,
-1, -3.375776, -6.148534, 0, 1.5, 0.5, 0.5,
0, -3.375776, -6.148534, 0, -0.5, 0.5, 0.5,
0, -3.375776, -6.148534, 1, -0.5, 0.5, 0.5,
0, -3.375776, -6.148534, 1, 1.5, 0.5, 0.5,
0, -3.375776, -6.148534, 0, 1.5, 0.5, 0.5,
1, -3.375776, -6.148534, 0, -0.5, 0.5, 0.5,
1, -3.375776, -6.148534, 1, -0.5, 0.5, 0.5,
1, -3.375776, -6.148534, 1, 1.5, 0.5, 0.5,
1, -3.375776, -6.148534, 0, 1.5, 0.5, 0.5,
2, -3.375776, -6.148534, 0, -0.5, 0.5, 0.5,
2, -3.375776, -6.148534, 1, -0.5, 0.5, 0.5,
2, -3.375776, -6.148534, 1, 1.5, 0.5, 0.5,
2, -3.375776, -6.148534, 0, 1.5, 0.5, 0.5,
3, -3.375776, -6.148534, 0, -0.5, 0.5, 0.5,
3, -3.375776, -6.148534, 1, -0.5, 0.5, 0.5,
3, -3.375776, -6.148534, 1, 1.5, 0.5, 0.5,
3, -3.375776, -6.148534, 0, 1.5, 0.5, 0.5
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
-3.260999, -2, -5.32848,
-3.260999, 3, -5.32848,
-3.260999, -2, -5.32848,
-3.430345, -2, -5.601831,
-3.260999, -1, -5.32848,
-3.430345, -1, -5.601831,
-3.260999, 0, -5.32848,
-3.430345, 0, -5.601831,
-3.260999, 1, -5.32848,
-3.430345, 1, -5.601831,
-3.260999, 2, -5.32848,
-3.430345, 2, -5.601831,
-3.260999, 3, -5.32848,
-3.430345, 3, -5.601831
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
-3.769037, -2, -6.148534, 0, -0.5, 0.5, 0.5,
-3.769037, -2, -6.148534, 1, -0.5, 0.5, 0.5,
-3.769037, -2, -6.148534, 1, 1.5, 0.5, 0.5,
-3.769037, -2, -6.148534, 0, 1.5, 0.5, 0.5,
-3.769037, -1, -6.148534, 0, -0.5, 0.5, 0.5,
-3.769037, -1, -6.148534, 1, -0.5, 0.5, 0.5,
-3.769037, -1, -6.148534, 1, 1.5, 0.5, 0.5,
-3.769037, -1, -6.148534, 0, 1.5, 0.5, 0.5,
-3.769037, 0, -6.148534, 0, -0.5, 0.5, 0.5,
-3.769037, 0, -6.148534, 1, -0.5, 0.5, 0.5,
-3.769037, 0, -6.148534, 1, 1.5, 0.5, 0.5,
-3.769037, 0, -6.148534, 0, 1.5, 0.5, 0.5,
-3.769037, 1, -6.148534, 0, -0.5, 0.5, 0.5,
-3.769037, 1, -6.148534, 1, -0.5, 0.5, 0.5,
-3.769037, 1, -6.148534, 1, 1.5, 0.5, 0.5,
-3.769037, 1, -6.148534, 0, 1.5, 0.5, 0.5,
-3.769037, 2, -6.148534, 0, -0.5, 0.5, 0.5,
-3.769037, 2, -6.148534, 1, -0.5, 0.5, 0.5,
-3.769037, 2, -6.148534, 1, 1.5, 0.5, 0.5,
-3.769037, 2, -6.148534, 0, 1.5, 0.5, 0.5,
-3.769037, 3, -6.148534, 0, -0.5, 0.5, 0.5,
-3.769037, 3, -6.148534, 1, -0.5, 0.5, 0.5,
-3.769037, 3, -6.148534, 1, 1.5, 0.5, 0.5,
-3.769037, 3, -6.148534, 0, 1.5, 0.5, 0.5
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
-3.260999, -2.919054, -4,
-3.260999, -2.919054, 4,
-3.260999, -2.919054, -4,
-3.430345, -3.071295, -4,
-3.260999, -2.919054, -2,
-3.430345, -3.071295, -2,
-3.260999, -2.919054, 0,
-3.430345, -3.071295, 0,
-3.260999, -2.919054, 2,
-3.430345, -3.071295, 2,
-3.260999, -2.919054, 4,
-3.430345, -3.071295, 4
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
-3.769037, -3.375776, -4, 0, -0.5, 0.5, 0.5,
-3.769037, -3.375776, -4, 1, -0.5, 0.5, 0.5,
-3.769037, -3.375776, -4, 1, 1.5, 0.5, 0.5,
-3.769037, -3.375776, -4, 0, 1.5, 0.5, 0.5,
-3.769037, -3.375776, -2, 0, -0.5, 0.5, 0.5,
-3.769037, -3.375776, -2, 1, -0.5, 0.5, 0.5,
-3.769037, -3.375776, -2, 1, 1.5, 0.5, 0.5,
-3.769037, -3.375776, -2, 0, 1.5, 0.5, 0.5,
-3.769037, -3.375776, 0, 0, -0.5, 0.5, 0.5,
-3.769037, -3.375776, 0, 1, -0.5, 0.5, 0.5,
-3.769037, -3.375776, 0, 1, 1.5, 0.5, 0.5,
-3.769037, -3.375776, 0, 0, 1.5, 0.5, 0.5,
-3.769037, -3.375776, 2, 0, -0.5, 0.5, 0.5,
-3.769037, -3.375776, 2, 1, -0.5, 0.5, 0.5,
-3.769037, -3.375776, 2, 1, 1.5, 0.5, 0.5,
-3.769037, -3.375776, 2, 0, 1.5, 0.5, 0.5,
-3.769037, -3.375776, 4, 0, -0.5, 0.5, 0.5,
-3.769037, -3.375776, 4, 1, -0.5, 0.5, 0.5,
-3.769037, -3.375776, 4, 1, 1.5, 0.5, 0.5,
-3.769037, -3.375776, 4, 0, 1.5, 0.5, 0.5
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
-3.260999, -2.919054, -5.32848,
-3.260999, 3.170578, -5.32848,
-3.260999, -2.919054, 5.605585,
-3.260999, 3.170578, 5.605585,
-3.260999, -2.919054, -5.32848,
-3.260999, -2.919054, 5.605585,
-3.260999, 3.170578, -5.32848,
-3.260999, 3.170578, 5.605585,
-3.260999, -2.919054, -5.32848,
3.512834, -2.919054, -5.32848,
-3.260999, -2.919054, 5.605585,
3.512834, -2.919054, 5.605585,
-3.260999, 3.170578, -5.32848,
3.512834, 3.170578, -5.32848,
-3.260999, 3.170578, 5.605585,
3.512834, 3.170578, 5.605585,
3.512834, -2.919054, -5.32848,
3.512834, 3.170578, -5.32848,
3.512834, -2.919054, 5.605585,
3.512834, 3.170578, 5.605585,
3.512834, -2.919054, -5.32848,
3.512834, -2.919054, 5.605585,
3.512834, 3.170578, -5.32848,
3.512834, 3.170578, 5.605585
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
var radius = 7.599094;
var distance = 33.80922;
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
mvMatrix.translate( -0.1259172, -0.1257621, -0.1385527 );
mvMatrix.scale( 1.212945, 1.349226, 0.7514396 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80922);
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
zinc_dimethyldithioc<-read.table("zinc_dimethyldithioc.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-zinc_dimethyldithioc$V2
```

```
## Error in eval(expr, envir, enclos): object 'zinc_dimethyldithioc' not found
```

```r
y<-zinc_dimethyldithioc$V3
```

```
## Error in eval(expr, envir, enclos): object 'zinc_dimethyldithioc' not found
```

```r
z<-zinc_dimethyldithioc$V4
```

```
## Error in eval(expr, envir, enclos): object 'zinc_dimethyldithioc' not found
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
-3.162351, 0.857271, -1.93333, 0, 0, 1, 1, 1,
-2.938293, 0.7935864, -0.4782302, 1, 0, 0, 1, 1,
-2.805963, 0.6600336, -2.616686, 1, 0, 0, 1, 1,
-2.702675, 0.166463, -2.532225, 1, 0, 0, 1, 1,
-2.683706, -0.2247028, -3.950657, 1, 0, 0, 1, 1,
-2.613687, 0.8317655, -2.508692, 1, 0, 0, 1, 1,
-2.509501, -0.2559486, -1.100786, 0, 0, 0, 1, 1,
-2.493979, 0.7959266, -1.111021, 0, 0, 0, 1, 1,
-2.457578, -0.7862318, -2.259369, 0, 0, 0, 1, 1,
-2.42083, -1.106852, -1.235679, 0, 0, 0, 1, 1,
-2.337271, 0.7942414, -1.16294, 0, 0, 0, 1, 1,
-2.317068, 1.105757, -1.21857, 0, 0, 0, 1, 1,
-2.28369, 0.1230756, 0.1642192, 0, 0, 0, 1, 1,
-2.272318, 0.0660753, -2.490655, 1, 1, 1, 1, 1,
-2.249454, 1.568775, -0.7924972, 1, 1, 1, 1, 1,
-2.23244, 0.7779258, -1.208541, 1, 1, 1, 1, 1,
-2.217818, -0.5121026, -1.869794, 1, 1, 1, 1, 1,
-2.154715, -0.7521023, -3.158452, 1, 1, 1, 1, 1,
-2.111822, -0.1789761, 0.5593821, 1, 1, 1, 1, 1,
-2.07555, -0.8873719, -4.751626, 1, 1, 1, 1, 1,
-2.061072, -0.2349234, -0.97338, 1, 1, 1, 1, 1,
-2.001677, -0.2248989, -1.587768, 1, 1, 1, 1, 1,
-1.976054, -0.4918729, -2.43542, 1, 1, 1, 1, 1,
-1.963824, -0.6180243, -0.9038808, 1, 1, 1, 1, 1,
-1.962202, 1.247117, -1.126098, 1, 1, 1, 1, 1,
-1.900189, 0.4187158, -1.275435, 1, 1, 1, 1, 1,
-1.885745, 1.370215, 0.1638512, 1, 1, 1, 1, 1,
-1.833152, -0.615351, -1.033898, 1, 1, 1, 1, 1,
-1.815909, -0.1494998, -3.139956, 0, 0, 1, 1, 1,
-1.784451, -0.828732, -2.871485, 1, 0, 0, 1, 1,
-1.777275, -0.5571418, -5.169246, 1, 0, 0, 1, 1,
-1.7518, -0.6679345, -0.54616, 1, 0, 0, 1, 1,
-1.731265, 0.2790635, -0.557365, 1, 0, 0, 1, 1,
-1.720509, -0.2168062, -2.471403, 1, 0, 0, 1, 1,
-1.713456, -0.4667561, -2.950926, 0, 0, 0, 1, 1,
-1.697896, 0.4108622, -0.1202797, 0, 0, 0, 1, 1,
-1.690952, -0.006766686, -1.949685, 0, 0, 0, 1, 1,
-1.689616, 1.108807, -0.249788, 0, 0, 0, 1, 1,
-1.689607, -0.008386354, -1.108648, 0, 0, 0, 1, 1,
-1.684055, -0.9482442, -3.584233, 0, 0, 0, 1, 1,
-1.683667, 0.3162267, 0.3299232, 0, 0, 0, 1, 1,
-1.660156, 1.095526, -0.5296463, 1, 1, 1, 1, 1,
-1.656449, 0.4949944, -1.283919, 1, 1, 1, 1, 1,
-1.64175, 0.819899, -1.902505, 1, 1, 1, 1, 1,
-1.63981, 0.005167958, -1.139235, 1, 1, 1, 1, 1,
-1.62709, 0.4288659, -0.2155003, 1, 1, 1, 1, 1,
-1.608433, -0.4665177, -3.031563, 1, 1, 1, 1, 1,
-1.582139, 2.228343, 0.4135261, 1, 1, 1, 1, 1,
-1.58115, 1.566823, -0.5165964, 1, 1, 1, 1, 1,
-1.579318, -0.2752502, -2.150483, 1, 1, 1, 1, 1,
-1.578663, -0.1550075, -1.406184, 1, 1, 1, 1, 1,
-1.578221, 0.4896495, -1.235944, 1, 1, 1, 1, 1,
-1.575718, 0.3919831, -1.276599, 1, 1, 1, 1, 1,
-1.565963, 0.1965035, -1.721553, 1, 1, 1, 1, 1,
-1.564014, 0.2623147, -1.518581, 1, 1, 1, 1, 1,
-1.549879, 0.08759406, -1.703774, 1, 1, 1, 1, 1,
-1.54128, -0.2445192, 0.1901685, 0, 0, 1, 1, 1,
-1.527028, -1.012599, -0.9170848, 1, 0, 0, 1, 1,
-1.517251, -0.4109839, -1.009892, 1, 0, 0, 1, 1,
-1.509061, -1.147145, -1.330285, 1, 0, 0, 1, 1,
-1.507671, 0.3043448, -2.519001, 1, 0, 0, 1, 1,
-1.498076, -0.8680776, -1.692359, 1, 0, 0, 1, 1,
-1.49459, 0.8380663, -1.317379, 0, 0, 0, 1, 1,
-1.481142, -1.124651, 0.08889949, 0, 0, 0, 1, 1,
-1.476605, 0.1822901, -1.806058, 0, 0, 0, 1, 1,
-1.473515, -0.6246115, -2.969137, 0, 0, 0, 1, 1,
-1.468078, -0.9309043, -2.90649, 0, 0, 0, 1, 1,
-1.466971, 1.249558, 0.1286018, 0, 0, 0, 1, 1,
-1.456754, -0.03860607, -1.153225, 0, 0, 0, 1, 1,
-1.437532, 0.257796, -2.776383, 1, 1, 1, 1, 1,
-1.433354, -1.012849, -2.201119, 1, 1, 1, 1, 1,
-1.419517, 2.420107, -1.300949, 1, 1, 1, 1, 1,
-1.414286, -0.3176877, -2.366751, 1, 1, 1, 1, 1,
-1.412621, -1.466874, -2.098766, 1, 1, 1, 1, 1,
-1.412063, -1.487495, 0.0346788, 1, 1, 1, 1, 1,
-1.397008, 0.0258645, -2.058414, 1, 1, 1, 1, 1,
-1.39533, -1.082877, -2.96951, 1, 1, 1, 1, 1,
-1.393275, -0.393223, -3.170139, 1, 1, 1, 1, 1,
-1.37851, -0.04598571, -3.503788, 1, 1, 1, 1, 1,
-1.375631, -0.3229921, -0.2572432, 1, 1, 1, 1, 1,
-1.354786, -0.1584612, -2.522687, 1, 1, 1, 1, 1,
-1.354344, -0.3771319, -3.06565, 1, 1, 1, 1, 1,
-1.348839, -1.669969, -2.212007, 1, 1, 1, 1, 1,
-1.347569, -1.171133, -1.647771, 1, 1, 1, 1, 1,
-1.345306, 0.888039, 0.7475467, 0, 0, 1, 1, 1,
-1.34506, 0.1784361, -0.5452472, 1, 0, 0, 1, 1,
-1.340263, -0.9002284, -1.928727, 1, 0, 0, 1, 1,
-1.336214, -0.1473829, -0.9354995, 1, 0, 0, 1, 1,
-1.32963, -0.8594874, -2.09182, 1, 0, 0, 1, 1,
-1.323375, 0.3753454, -0.9443206, 1, 0, 0, 1, 1,
-1.322417, -1.109081, -1.714477, 0, 0, 0, 1, 1,
-1.318145, 0.2762631, -2.49378, 0, 0, 0, 1, 1,
-1.316275, -0.9437634, -1.730215, 0, 0, 0, 1, 1,
-1.295872, -0.1128191, -3.261169, 0, 0, 0, 1, 1,
-1.29262, 3.007574, -0.4657012, 0, 0, 0, 1, 1,
-1.291778, -0.514544, -2.136947, 0, 0, 0, 1, 1,
-1.283327, -0.1582588, -1.024964, 0, 0, 0, 1, 1,
-1.278468, 0.9327996, -0.1448665, 1, 1, 1, 1, 1,
-1.274708, -1.18958, -1.889623, 1, 1, 1, 1, 1,
-1.270304, -0.5464202, -3.708527, 1, 1, 1, 1, 1,
-1.262833, -0.6435744, -0.4173883, 1, 1, 1, 1, 1,
-1.26199, -1.169521, -3.552183, 1, 1, 1, 1, 1,
-1.261845, 1.130634, -2.240028, 1, 1, 1, 1, 1,
-1.260263, -1.916456, -2.755566, 1, 1, 1, 1, 1,
-1.258099, -1.167991, -2.945797, 1, 1, 1, 1, 1,
-1.251004, 0.269994, -1.881843, 1, 1, 1, 1, 1,
-1.246209, -0.3301981, -1.792363, 1, 1, 1, 1, 1,
-1.239954, -1.114099, -1.851687, 1, 1, 1, 1, 1,
-1.239917, 0.494165, -1.32222, 1, 1, 1, 1, 1,
-1.231888, -0.8952227, -0.7910378, 1, 1, 1, 1, 1,
-1.22939, -1.302005, -4.203501, 1, 1, 1, 1, 1,
-1.216019, -1.727763, -0.9903966, 1, 1, 1, 1, 1,
-1.213558, -1.63041, -3.256642, 0, 0, 1, 1, 1,
-1.208492, -0.5961598, -3.218698, 1, 0, 0, 1, 1,
-1.206805, 1.343846, 0.3409866, 1, 0, 0, 1, 1,
-1.200831, -0.05805053, -1.046629, 1, 0, 0, 1, 1,
-1.194035, -0.2711693, -0.04406788, 1, 0, 0, 1, 1,
-1.190722, -0.5561924, -3.70101, 1, 0, 0, 1, 1,
-1.184347, -1.344762, -2.359479, 0, 0, 0, 1, 1,
-1.183846, 0.6003749, -0.9228813, 0, 0, 0, 1, 1,
-1.183827, -0.42634, -1.737507, 0, 0, 0, 1, 1,
-1.173134, 0.298118, -1.449831, 0, 0, 0, 1, 1,
-1.162288, -0.0997863, -0.6637492, 0, 0, 0, 1, 1,
-1.153111, -0.1754688, -2.458381, 0, 0, 0, 1, 1,
-1.142233, -0.175271, -0.987227, 0, 0, 0, 1, 1,
-1.136033, 0.7842233, 0.9102678, 1, 1, 1, 1, 1,
-1.131402, 1.436666, -0.06031359, 1, 1, 1, 1, 1,
-1.092448, -0.7648239, -2.990608, 1, 1, 1, 1, 1,
-1.075768, 2.652534, -1.068616, 1, 1, 1, 1, 1,
-1.06622, -0.3469588, -1.117908, 1, 1, 1, 1, 1,
-1.064072, -1.241342, -2.710694, 1, 1, 1, 1, 1,
-1.062096, 0.6340077, -0.6100757, 1, 1, 1, 1, 1,
-1.058803, 1.230084, -0.506331, 1, 1, 1, 1, 1,
-1.057345, 0.1313015, -1.731119, 1, 1, 1, 1, 1,
-1.052099, -1.828186, -2.112174, 1, 1, 1, 1, 1,
-1.045612, -0.6116896, 0.004071941, 1, 1, 1, 1, 1,
-1.043997, -0.7281532, -4.747442, 1, 1, 1, 1, 1,
-1.041006, 0.643076, -3.45004, 1, 1, 1, 1, 1,
-1.04054, 0.1508566, -1.208234, 1, 1, 1, 1, 1,
-1.037592, 0.07194952, 0.2701864, 1, 1, 1, 1, 1,
-1.03652, 0.1514217, -0.7262792, 0, 0, 1, 1, 1,
-1.036305, -1.867511, -2.333794, 1, 0, 0, 1, 1,
-1.032048, 1.069638, 2.448967, 1, 0, 0, 1, 1,
-1.026055, 1.590518, -0.4233945, 1, 0, 0, 1, 1,
-1.025484, -0.04986966, -2.529866, 1, 0, 0, 1, 1,
-1.021498, 1.691384, -0.7236547, 1, 0, 0, 1, 1,
-1.02077, 2.299053, 0.3910013, 0, 0, 0, 1, 1,
-1.020737, 2.726266, 0.3607538, 0, 0, 0, 1, 1,
-1.02053, -1.301633, -2.15369, 0, 0, 0, 1, 1,
-1.013082, 1.351499, -1.579652, 0, 0, 0, 1, 1,
-1.012604, 1.253663, -0.3089206, 0, 0, 0, 1, 1,
-1.011269, -0.493487, -2.296607, 0, 0, 0, 1, 1,
-1.007431, 0.01156477, -0.217758, 0, 0, 0, 1, 1,
-1.004387, -0.4399233, -3.458829, 1, 1, 1, 1, 1,
-0.9978914, -0.4643356, -2.204985, 1, 1, 1, 1, 1,
-0.9954795, 0.3797878, -0.6059619, 1, 1, 1, 1, 1,
-0.9899315, 0.02048328, -2.222648, 1, 1, 1, 1, 1,
-0.9844722, 1.256676, -2.031955, 1, 1, 1, 1, 1,
-0.9807256, 0.9701326, -0.07646198, 1, 1, 1, 1, 1,
-0.9757494, -0.7852105, -1.984838, 1, 1, 1, 1, 1,
-0.9751496, -0.3008432, -2.271568, 1, 1, 1, 1, 1,
-0.9737924, -0.4297783, -2.353248, 1, 1, 1, 1, 1,
-0.9708877, -1.210038, -3.587432, 1, 1, 1, 1, 1,
-0.9634824, 0.09978084, -2.802311, 1, 1, 1, 1, 1,
-0.9594247, 0.2052687, 0.1322369, 1, 1, 1, 1, 1,
-0.9574124, -0.9540785, -1.6541, 1, 1, 1, 1, 1,
-0.9559537, 1.084615, 0.4578719, 1, 1, 1, 1, 1,
-0.9432601, -0.0846425, -2.548995, 1, 1, 1, 1, 1,
-0.9409831, 1.314707, 0.2034518, 0, 0, 1, 1, 1,
-0.9407162, -0.1781643, -0.5993553, 1, 0, 0, 1, 1,
-0.9388862, 0.1389822, -2.312324, 1, 0, 0, 1, 1,
-0.936343, 0.2028439, -0.497756, 1, 0, 0, 1, 1,
-0.9246649, -1.855799, -2.393731, 1, 0, 0, 1, 1,
-0.9189952, 0.9218539, -0.8386697, 1, 0, 0, 1, 1,
-0.9173272, 0.2271413, -0.3417461, 0, 0, 0, 1, 1,
-0.9026363, 1.050939, -2.31621, 0, 0, 0, 1, 1,
-0.8918257, 1.093527, 0.3258083, 0, 0, 0, 1, 1,
-0.8890713, -0.03791214, -1.510001, 0, 0, 0, 1, 1,
-0.8814908, -0.1639845, -1.38335, 0, 0, 0, 1, 1,
-0.8814757, 0.9922401, -0.6155644, 0, 0, 0, 1, 1,
-0.8804432, 0.7905262, -1.268874, 0, 0, 0, 1, 1,
-0.8797796, 0.8488255, -1.833803, 1, 1, 1, 1, 1,
-0.8766195, 0.1664679, -1.189897, 1, 1, 1, 1, 1,
-0.875457, 0.7625428, -1.48758, 1, 1, 1, 1, 1,
-0.8740966, -0.5926005, -2.185716, 1, 1, 1, 1, 1,
-0.8711525, 2.407532, 0.2564016, 1, 1, 1, 1, 1,
-0.8704796, -1.31381, -3.655426, 1, 1, 1, 1, 1,
-0.8500829, 0.9032102, 0.4472141, 1, 1, 1, 1, 1,
-0.8464436, -1.204937, -3.087617, 1, 1, 1, 1, 1,
-0.8429958, -0.708878, -2.04353, 1, 1, 1, 1, 1,
-0.8366395, -0.6219853, -0.3871125, 1, 1, 1, 1, 1,
-0.8343329, 0.9986543, 0.4581717, 1, 1, 1, 1, 1,
-0.8311653, -0.0571725, -1.689659, 1, 1, 1, 1, 1,
-0.8303543, -1.124465, -1.908791, 1, 1, 1, 1, 1,
-0.8286749, 0.4986535, 0.7700018, 1, 1, 1, 1, 1,
-0.8153799, 0.6180915, -1.00224, 1, 1, 1, 1, 1,
-0.8152758, 1.105972, 0.5140682, 0, 0, 1, 1, 1,
-0.8146446, 1.104051, -0.3816741, 1, 0, 0, 1, 1,
-0.8103178, -2.026247, -3.631586, 1, 0, 0, 1, 1,
-0.8065686, -1.715036, -3.574728, 1, 0, 0, 1, 1,
-0.8018236, -1.051024, -4.082877, 1, 0, 0, 1, 1,
-0.8016782, -1.19928, -2.733428, 1, 0, 0, 1, 1,
-0.8015728, -0.352001, -1.929787, 0, 0, 0, 1, 1,
-0.795305, -0.4293386, -2.68487, 0, 0, 0, 1, 1,
-0.7898873, -0.5777781, -1.886662, 0, 0, 0, 1, 1,
-0.7887668, 0.03701555, -1.170123, 0, 0, 0, 1, 1,
-0.7874675, -0.2770079, -1.490727, 0, 0, 0, 1, 1,
-0.7830824, -1.329995, -3.027509, 0, 0, 0, 1, 1,
-0.7714948, -1.565162, -2.952922, 0, 0, 0, 1, 1,
-0.7646624, 1.076682, -0.5102885, 1, 1, 1, 1, 1,
-0.7594411, 0.8979068, 0.06026047, 1, 1, 1, 1, 1,
-0.7580619, 0.1944343, -3.395446, 1, 1, 1, 1, 1,
-0.7577977, 0.2718159, -1.063348, 1, 1, 1, 1, 1,
-0.7563649, -1.156533, -0.9932228, 1, 1, 1, 1, 1,
-0.7553346, 0.5246048, -0.2442173, 1, 1, 1, 1, 1,
-0.7550254, 0.404319, -1.962869, 1, 1, 1, 1, 1,
-0.7542466, 0.2687238, -2.702681, 1, 1, 1, 1, 1,
-0.7541059, 1.073317, 0.2875625, 1, 1, 1, 1, 1,
-0.7524958, -1.358293, -3.27011, 1, 1, 1, 1, 1,
-0.7427642, -1.164225, -1.35796, 1, 1, 1, 1, 1,
-0.7414083, 1.483877, -0.6601915, 1, 1, 1, 1, 1,
-0.7388301, -0.6138232, -3.32269, 1, 1, 1, 1, 1,
-0.7385482, 1.660592, -2.298592, 1, 1, 1, 1, 1,
-0.7341914, -0.3298975, -2.315457, 1, 1, 1, 1, 1,
-0.7326851, -1.919033, -3.568705, 0, 0, 1, 1, 1,
-0.7311519, -0.7909422, -0.9611276, 1, 0, 0, 1, 1,
-0.7293766, 0.3870794, 0.07788769, 1, 0, 0, 1, 1,
-0.7272265, 0.1634182, -2.792317, 1, 0, 0, 1, 1,
-0.7166553, -1.176064, -2.042062, 1, 0, 0, 1, 1,
-0.7149069, -1.143647, -3.111981, 1, 0, 0, 1, 1,
-0.7141206, -1.172368, -3.405244, 0, 0, 0, 1, 1,
-0.7128312, 0.4975367, -1.240263, 0, 0, 0, 1, 1,
-0.7109932, 0.979763, -0.07150224, 0, 0, 0, 1, 1,
-0.7098143, -0.732031, -2.078061, 0, 0, 0, 1, 1,
-0.70677, 0.09716263, -1.252306, 0, 0, 0, 1, 1,
-0.7066478, -0.8388939, -2.941795, 0, 0, 0, 1, 1,
-0.7063541, -0.9023904, -2.153768, 0, 0, 0, 1, 1,
-0.7032201, 0.2772195, -2.816303, 1, 1, 1, 1, 1,
-0.7014144, 0.2165491, -2.324543, 1, 1, 1, 1, 1,
-0.7006102, -0.5910037, -3.094373, 1, 1, 1, 1, 1,
-0.6939591, -0.2435814, -1.675258, 1, 1, 1, 1, 1,
-0.6779662, 0.1211657, -0.6235762, 1, 1, 1, 1, 1,
-0.6770259, 0.7275459, -2.757831, 1, 1, 1, 1, 1,
-0.6769935, -0.307359, -1.360767, 1, 1, 1, 1, 1,
-0.6758571, -0.2745926, -0.7273045, 1, 1, 1, 1, 1,
-0.6683775, 0.5911671, -1.359439, 1, 1, 1, 1, 1,
-0.6614723, -0.1293447, -1.756424, 1, 1, 1, 1, 1,
-0.6604618, 0.7952449, -1.220274, 1, 1, 1, 1, 1,
-0.6602646, 0.7618842, -0.07006348, 1, 1, 1, 1, 1,
-0.6469358, -0.9329962, -3.135183, 1, 1, 1, 1, 1,
-0.6465635, -0.6787017, -1.827778, 1, 1, 1, 1, 1,
-0.6425059, 0.1494873, -1.285725, 1, 1, 1, 1, 1,
-0.6353164, -0.6179498, -3.334158, 0, 0, 1, 1, 1,
-0.6337292, 0.2538012, -1.327986, 1, 0, 0, 1, 1,
-0.6292279, -0.191461, -2.4562, 1, 0, 0, 1, 1,
-0.6259807, 0.2529261, -0.2349844, 1, 0, 0, 1, 1,
-0.6180103, -1.390436, -2.899918, 1, 0, 0, 1, 1,
-0.6150552, 0.7008291, -0.6146107, 1, 0, 0, 1, 1,
-0.6104537, -0.3326194, -2.823771, 0, 0, 0, 1, 1,
-0.6072396, 0.005360663, -1.541079, 0, 0, 0, 1, 1,
-0.606054, 0.1584142, -2.555692, 0, 0, 0, 1, 1,
-0.6030834, 2.782877, -0.7839904, 0, 0, 0, 1, 1,
-0.6012025, 0.8754808, -0.1139162, 0, 0, 0, 1, 1,
-0.5938053, -0.7120217, -1.348881, 0, 0, 0, 1, 1,
-0.5898805, 1.060291, 0.09662528, 0, 0, 0, 1, 1,
-0.5874122, -0.3094334, -3.330287, 1, 1, 1, 1, 1,
-0.5821913, -1.070674, -0.4144142, 1, 1, 1, 1, 1,
-0.5811956, 1.373327, -1.585779, 1, 1, 1, 1, 1,
-0.5805534, 1.019239, -0.6683787, 1, 1, 1, 1, 1,
-0.5787895, -0.9585228, -1.705048, 1, 1, 1, 1, 1,
-0.5762233, 1.196578, 1.269968, 1, 1, 1, 1, 1,
-0.571996, 0.1706734, -1.592158, 1, 1, 1, 1, 1,
-0.5715898, -0.7261692, -1.884648, 1, 1, 1, 1, 1,
-0.5597075, -0.173542, -2.233686, 1, 1, 1, 1, 1,
-0.5519795, -2.176029, -1.860982, 1, 1, 1, 1, 1,
-0.5413492, -1.368899, -3.189874, 1, 1, 1, 1, 1,
-0.5365809, 0.1276278, -1.62444, 1, 1, 1, 1, 1,
-0.5327844, -1.795469, -2.631054, 1, 1, 1, 1, 1,
-0.5266242, 0.2359135, 0.06380109, 1, 1, 1, 1, 1,
-0.5203453, 0.2896161, -1.411385, 1, 1, 1, 1, 1,
-0.5162731, 0.3376838, 0.7087905, 0, 0, 1, 1, 1,
-0.5103964, 0.6461477, -1.658421, 1, 0, 0, 1, 1,
-0.508276, 1.214299, -0.1419672, 1, 0, 0, 1, 1,
-0.5075065, -1.299629, -2.600289, 1, 0, 0, 1, 1,
-0.5037597, 0.7782675, -2.584728, 1, 0, 0, 1, 1,
-0.5030439, -1.314947, -3.95142, 1, 0, 0, 1, 1,
-0.5016568, -1.071179, -1.684332, 0, 0, 0, 1, 1,
-0.5007336, 0.1748051, -1.380349, 0, 0, 0, 1, 1,
-0.4991613, -0.5558264, -2.764719, 0, 0, 0, 1, 1,
-0.4991474, -0.0964582, -2.066229, 0, 0, 0, 1, 1,
-0.4936393, -0.4459193, -2.857044, 0, 0, 0, 1, 1,
-0.4927202, 0.0492043, -2.840557, 0, 0, 0, 1, 1,
-0.4880397, -0.7463815, -3.658521, 0, 0, 0, 1, 1,
-0.4872579, 0.7411044, 0.7918078, 1, 1, 1, 1, 1,
-0.4861727, 0.2153591, -2.093214, 1, 1, 1, 1, 1,
-0.4808221, -1.12071, -4.350406, 1, 1, 1, 1, 1,
-0.4800246, 0.4760789, 0.6902125, 1, 1, 1, 1, 1,
-0.4793449, 0.3992016, -0.3197621, 1, 1, 1, 1, 1,
-0.478091, -0.8460571, -4.705626, 1, 1, 1, 1, 1,
-0.4769938, -2.35796, -2.53409, 1, 1, 1, 1, 1,
-0.4764201, 0.2421165, -1.172388, 1, 1, 1, 1, 1,
-0.4738116, 0.8039013, -0.5853325, 1, 1, 1, 1, 1,
-0.4710516, 0.5356437, -0.2116707, 1, 1, 1, 1, 1,
-0.4696905, -1.641672, -4.241374, 1, 1, 1, 1, 1,
-0.468992, -0.9285126, -3.12293, 1, 1, 1, 1, 1,
-0.4682054, 0.2006955, -1.344164, 1, 1, 1, 1, 1,
-0.4639239, 0.8845924, 0.7598377, 1, 1, 1, 1, 1,
-0.454491, 1.566803, -0.5880318, 1, 1, 1, 1, 1,
-0.445043, -0.7115883, -2.35724, 0, 0, 1, 1, 1,
-0.4437714, -0.6504456, -1.364788, 1, 0, 0, 1, 1,
-0.4429617, -1.479201, -2.364443, 1, 0, 0, 1, 1,
-0.442517, -1.226663, -2.825252, 1, 0, 0, 1, 1,
-0.4358442, 1.28523, 0.2402388, 1, 0, 0, 1, 1,
-0.4358175, -0.5524489, -4.217839, 1, 0, 0, 1, 1,
-0.4357785, 0.6060981, -1.145042, 0, 0, 0, 1, 1,
-0.4344106, 0.6523332, -0.7284234, 0, 0, 0, 1, 1,
-0.4321232, -0.05565065, -0.08437389, 0, 0, 0, 1, 1,
-0.4320792, -1.645136, -2.539333, 0, 0, 0, 1, 1,
-0.4295835, 0.08457271, -1.653273, 0, 0, 0, 1, 1,
-0.4280518, 0.105843, -0.8340557, 0, 0, 0, 1, 1,
-0.4175325, 0.1487102, -2.877, 0, 0, 0, 1, 1,
-0.4130171, -0.6627831, -3.916172, 1, 1, 1, 1, 1,
-0.4125196, 0.5893829, -0.2053098, 1, 1, 1, 1, 1,
-0.4109886, -0.6742197, -1.314619, 1, 1, 1, 1, 1,
-0.4099867, 1.493015, 0.5845205, 1, 1, 1, 1, 1,
-0.4081698, 1.172014, -0.5495303, 1, 1, 1, 1, 1,
-0.4079112, 0.9953046, -1.040029, 1, 1, 1, 1, 1,
-0.4069175, 0.8365405, 1.847517, 1, 1, 1, 1, 1,
-0.3999655, 0.1346034, -2.682924, 1, 1, 1, 1, 1,
-0.3846316, 0.7648625, -1.201733, 1, 1, 1, 1, 1,
-0.3823116, -0.8582245, -2.785076, 1, 1, 1, 1, 1,
-0.3803135, -0.2675779, -2.073253, 1, 1, 1, 1, 1,
-0.3798724, 0.4353235, -0.2634863, 1, 1, 1, 1, 1,
-0.3763933, 1.747473, -0.2711736, 1, 1, 1, 1, 1,
-0.3763594, 0.9735553, 1.683918, 1, 1, 1, 1, 1,
-0.3758725, -0.4099827, -1.906241, 1, 1, 1, 1, 1,
-0.3705574, -1.969839, -4.296936, 0, 0, 1, 1, 1,
-0.3602651, -1.428061, -4.924286, 1, 0, 0, 1, 1,
-0.3590159, 0.8063361, -1.10397, 1, 0, 0, 1, 1,
-0.3466013, -0.1077846, -1.623125, 1, 0, 0, 1, 1,
-0.3449702, 0.0295848, -2.855024, 1, 0, 0, 1, 1,
-0.3443626, 0.8327985, -0.6873161, 1, 0, 0, 1, 1,
-0.3413744, 1.344116, -1.096289, 0, 0, 0, 1, 1,
-0.3402643, 0.5084609, 0.285506, 0, 0, 0, 1, 1,
-0.3391642, 1.43777, -0.1228736, 0, 0, 0, 1, 1,
-0.3387694, 0.9882944, -0.0203704, 0, 0, 0, 1, 1,
-0.3350395, -0.01454381, -1.33058, 0, 0, 0, 1, 1,
-0.3347011, 0.9027678, 0.09758834, 0, 0, 0, 1, 1,
-0.3303569, -0.5244493, -2.966395, 0, 0, 0, 1, 1,
-0.3266714, -2.112977, -3.184507, 1, 1, 1, 1, 1,
-0.3245019, -0.8432045, -3.138311, 1, 1, 1, 1, 1,
-0.3231761, -2.501896, -2.510581, 1, 1, 1, 1, 1,
-0.322528, -0.2783411, -1.208351, 1, 1, 1, 1, 1,
-0.321636, -1.565653, -3.087758, 1, 1, 1, 1, 1,
-0.3201404, -0.03177445, -0.7770105, 1, 1, 1, 1, 1,
-0.31931, 0.2247583, 0.2055905, 1, 1, 1, 1, 1,
-0.3188526, 0.7272949, -0.4727735, 1, 1, 1, 1, 1,
-0.3155945, -1.06019, -2.739423, 1, 1, 1, 1, 1,
-0.3121355, -0.06414488, -0.8339125, 1, 1, 1, 1, 1,
-0.3111703, 1.399025, 0.5468465, 1, 1, 1, 1, 1,
-0.3110363, 0.6688184, 0.4143679, 1, 1, 1, 1, 1,
-0.3096501, 0.7300687, -0.5989277, 1, 1, 1, 1, 1,
-0.3064189, -0.40919, -2.890754, 1, 1, 1, 1, 1,
-0.3055297, -0.442657, -2.773507, 1, 1, 1, 1, 1,
-0.3015912, 1.299361, -0.7214334, 0, 0, 1, 1, 1,
-0.300443, 0.45921, -1.419958, 1, 0, 0, 1, 1,
-0.3003432, -0.4534184, -3.032076, 1, 0, 0, 1, 1,
-0.2955471, 0.2298286, -0.3658108, 1, 0, 0, 1, 1,
-0.2950381, 0.5160957, -1.015147, 1, 0, 0, 1, 1,
-0.2935737, 0.07403665, -1.550561, 1, 0, 0, 1, 1,
-0.2894141, 0.1564209, -2.02171, 0, 0, 0, 1, 1,
-0.2889722, -0.9222067, -3.604806, 0, 0, 0, 1, 1,
-0.2863625, 1.210971, 1.205707, 0, 0, 0, 1, 1,
-0.2838996, 0.6185598, -0.7439563, 0, 0, 0, 1, 1,
-0.2813833, 0.4821204, -0.8043889, 0, 0, 0, 1, 1,
-0.2780631, -1.073165, -3.858137, 0, 0, 0, 1, 1,
-0.2778252, -2.026936, -3.450735, 0, 0, 0, 1, 1,
-0.2763926, 1.811496, -0.891142, 1, 1, 1, 1, 1,
-0.2761815, 1.55204, -0.8436834, 1, 1, 1, 1, 1,
-0.2751198, 1.239293, 0.09970564, 1, 1, 1, 1, 1,
-0.2704318, 0.4406409, -0.2403179, 1, 1, 1, 1, 1,
-0.2685543, -1.243655, -3.787415, 1, 1, 1, 1, 1,
-0.2664917, -1.88308, -3.578594, 1, 1, 1, 1, 1,
-0.2655485, 0.0412435, -2.71547, 1, 1, 1, 1, 1,
-0.2623461, 1.062093, 0.9423296, 1, 1, 1, 1, 1,
-0.2592363, -0.4001626, -1.447086, 1, 1, 1, 1, 1,
-0.2578401, 1.329911, -0.01572046, 1, 1, 1, 1, 1,
-0.2570942, 0.5816103, 1.298368, 1, 1, 1, 1, 1,
-0.2547179, -0.604475, -3.877826, 1, 1, 1, 1, 1,
-0.2543245, -0.8100816, -3.280409, 1, 1, 1, 1, 1,
-0.2541943, -1.458466, -3.039356, 1, 1, 1, 1, 1,
-0.2502099, 0.4023551, -1.5767, 1, 1, 1, 1, 1,
-0.2489344, -1.06875, -1.950282, 0, 0, 1, 1, 1,
-0.2483305, -0.00614963, -2.214188, 1, 0, 0, 1, 1,
-0.2461866, 0.5506124, 0.2284763, 1, 0, 0, 1, 1,
-0.2413542, -1.36411, -2.967028, 1, 0, 0, 1, 1,
-0.2400359, -0.1435035, -0.66964, 1, 0, 0, 1, 1,
-0.2342907, 0.5542269, 0.8665806, 1, 0, 0, 1, 1,
-0.2325321, -0.6715921, -4.233435, 0, 0, 0, 1, 1,
-0.2301746, 0.05034655, -1.070847, 0, 0, 0, 1, 1,
-0.2300005, 1.064174, -2.854568, 0, 0, 0, 1, 1,
-0.2299484, -1.383072, -2.375429, 0, 0, 0, 1, 1,
-0.2293006, -0.288844, -2.735904, 0, 0, 0, 1, 1,
-0.2275026, 0.8630332, -0.9416409, 0, 0, 0, 1, 1,
-0.2238092, 0.09902682, -0.6164693, 0, 0, 0, 1, 1,
-0.2218787, 1.16641, -2.716759, 1, 1, 1, 1, 1,
-0.2200774, -0.02868639, -2.585786, 1, 1, 1, 1, 1,
-0.219386, 0.6516686, 0.7661046, 1, 1, 1, 1, 1,
-0.2173394, -0.03405315, -0.8907067, 1, 1, 1, 1, 1,
-0.2169692, -0.3801138, -2.124275, 1, 1, 1, 1, 1,
-0.2134843, 0.1682801, -1.271671, 1, 1, 1, 1, 1,
-0.2046756, -0.3435531, -1.481556, 1, 1, 1, 1, 1,
-0.2002104, 0.8100502, 0.1730151, 1, 1, 1, 1, 1,
-0.1973541, -0.5678672, -3.900459, 1, 1, 1, 1, 1,
-0.1913745, 1.107479, -0.6856066, 1, 1, 1, 1, 1,
-0.1892205, 0.3954076, -0.7037959, 1, 1, 1, 1, 1,
-0.1869521, 1.332984, 0.6189944, 1, 1, 1, 1, 1,
-0.1863083, -0.04261585, -3.27536, 1, 1, 1, 1, 1,
-0.1793877, 0.3527943, -0.8054191, 1, 1, 1, 1, 1,
-0.1790378, 1.202597, 0.4770062, 1, 1, 1, 1, 1,
-0.1782099, 1.208227, -2.033178, 0, 0, 1, 1, 1,
-0.1772439, 1.947473, -1.544302, 1, 0, 0, 1, 1,
-0.1728854, -1.34435, -2.871579, 1, 0, 0, 1, 1,
-0.1723033, 0.2698646, -1.509147, 1, 0, 0, 1, 1,
-0.170399, -0.2669038, -2.189868, 1, 0, 0, 1, 1,
-0.1679826, -0.7987279, -3.82905, 1, 0, 0, 1, 1,
-0.1649082, 0.1069041, -0.03035097, 0, 0, 0, 1, 1,
-0.1629333, -0.4007878, -2.454404, 0, 0, 0, 1, 1,
-0.1581846, -1.411297, -0.8771597, 0, 0, 0, 1, 1,
-0.1537279, 0.016972, -0.2338025, 0, 0, 0, 1, 1,
-0.1526237, 0.5951594, -1.296548, 0, 0, 0, 1, 1,
-0.1510293, 1.828923, 0.8741534, 0, 0, 0, 1, 1,
-0.1508858, 1.019199, 0.431161, 0, 0, 0, 1, 1,
-0.1483092, 1.645344, -1.834743, 1, 1, 1, 1, 1,
-0.1474144, -1.543165, -2.703933, 1, 1, 1, 1, 1,
-0.1468543, 1.15059, 0.2796977, 1, 1, 1, 1, 1,
-0.1465333, 0.6005282, -0.6459863, 1, 1, 1, 1, 1,
-0.1453209, 0.2104004, -0.5489401, 1, 1, 1, 1, 1,
-0.1435265, -0.7745659, -2.608222, 1, 1, 1, 1, 1,
-0.140908, -0.8344276, -1.724707, 1, 1, 1, 1, 1,
-0.1361039, -1.035072, -2.455539, 1, 1, 1, 1, 1,
-0.1341368, 0.4601404, -2.102986, 1, 1, 1, 1, 1,
-0.1333304, 0.7218736, -0.9371546, 1, 1, 1, 1, 1,
-0.1239823, 1.677983, -0.4131762, 1, 1, 1, 1, 1,
-0.1230698, -0.9258622, -0.9328721, 1, 1, 1, 1, 1,
-0.1175237, -0.8299454, -2.31807, 1, 1, 1, 1, 1,
-0.1174416, -0.2914425, -3.298845, 1, 1, 1, 1, 1,
-0.1141317, 0.3032711, 0.5062824, 1, 1, 1, 1, 1,
-0.1062109, -0.03908337, 0.7107639, 0, 0, 1, 1, 1,
-0.1048216, -1.069576, -3.514439, 1, 0, 0, 1, 1,
-0.1011034, -0.8298756, -2.672714, 1, 0, 0, 1, 1,
-0.1009988, 0.2775685, 1.174412, 1, 0, 0, 1, 1,
-0.09895532, -1.301413, -3.795915, 1, 0, 0, 1, 1,
-0.09700087, 1.400049, -0.1875644, 1, 0, 0, 1, 1,
-0.09386615, 0.3329803, -1.087927, 0, 0, 0, 1, 1,
-0.0934211, 0.0819901, 0.1708377, 0, 0, 0, 1, 1,
-0.08893037, 1.032696, 0.7492261, 0, 0, 0, 1, 1,
-0.08871969, 0.8117638, -0.5547282, 0, 0, 0, 1, 1,
-0.08779961, 0.2313186, -0.8651605, 0, 0, 0, 1, 1,
-0.08513809, -0.3588665, -1.924101, 0, 0, 0, 1, 1,
-0.08100217, -0.08686816, -3.388547, 0, 0, 0, 1, 1,
-0.06763992, -1.267664, -0.994252, 1, 1, 1, 1, 1,
-0.06719994, 1.556075, -0.8893536, 1, 1, 1, 1, 1,
-0.06309282, 0.4668348, -0.8149771, 1, 1, 1, 1, 1,
-0.0559762, 0.3467002, -0.3007816, 1, 1, 1, 1, 1,
-0.05296337, -0.9472678, -3.76788, 1, 1, 1, 1, 1,
-0.05213379, 0.5897368, -1.186957, 1, 1, 1, 1, 1,
-0.04993806, -1.77211, -3.402287, 1, 1, 1, 1, 1,
-0.04833402, 1.712088, -1.066899, 1, 1, 1, 1, 1,
-0.04367418, -0.4560415, -2.401293, 1, 1, 1, 1, 1,
-0.0427315, -0.2351633, -2.091558, 1, 1, 1, 1, 1,
-0.03906741, 0.3887153, -0.6861167, 1, 1, 1, 1, 1,
-0.0386107, 0.20248, -1.66546, 1, 1, 1, 1, 1,
-0.03301129, -1.48751, -2.166986, 1, 1, 1, 1, 1,
-0.03298235, 1.090205, -1.539708, 1, 1, 1, 1, 1,
-0.03044098, 1.389596, -0.09274954, 1, 1, 1, 1, 1,
-0.02666044, -1.31318, -2.256641, 0, 0, 1, 1, 1,
-0.0260605, 1.226855, 0.2041829, 1, 0, 0, 1, 1,
-0.02595275, 0.5431961, -0.1639244, 1, 0, 0, 1, 1,
-0.02178522, 0.130849, 0.05128345, 1, 0, 0, 1, 1,
-0.01754754, -1.471871, -2.43609, 1, 0, 0, 1, 1,
-0.01332799, -0.3393773, -3.685086, 1, 0, 0, 1, 1,
-0.01127234, -1.037356, -2.901165, 0, 0, 0, 1, 1,
-0.01100994, -0.9307585, -3.41433, 0, 0, 0, 1, 1,
-0.01022685, 1.082521, 0.4436461, 0, 0, 0, 1, 1,
-0.009098587, -1.544867, -2.984338, 0, 0, 0, 1, 1,
-0.008505731, 0.1564339, 0.1146502, 0, 0, 0, 1, 1,
-0.007595294, -1.411942, -3.508549, 0, 0, 0, 1, 1,
-0.007039862, 1.237475, 1.296586, 0, 0, 0, 1, 1,
-0.006967452, 0.5852943, 1.330023, 1, 1, 1, 1, 1,
-0.005253147, -0.05401484, -3.218549, 1, 1, 1, 1, 1,
-0.005015404, -0.8971114, -3.630392, 1, 1, 1, 1, 1,
-0.004291164, 0.7193324, 0.3146217, 1, 1, 1, 1, 1,
0.009841498, 0.3246645, 0.2857873, 1, 1, 1, 1, 1,
0.01092252, 2.23059, 0.4248965, 1, 1, 1, 1, 1,
0.01367975, 0.5870867, -1.758097, 1, 1, 1, 1, 1,
0.02365781, -1.103616, 4.46214, 1, 1, 1, 1, 1,
0.02655128, -0.4111174, 3.819623, 1, 1, 1, 1, 1,
0.02928637, -1.506451, 2.827231, 1, 1, 1, 1, 1,
0.03003078, 0.488075, 2.402056, 1, 1, 1, 1, 1,
0.03707035, -0.6443656, 3.241319, 1, 1, 1, 1, 1,
0.04089117, 0.4037402, -0.3470049, 1, 1, 1, 1, 1,
0.04243512, -0.007854642, 1.555992, 1, 1, 1, 1, 1,
0.04264618, -0.7044893, 3.454922, 1, 1, 1, 1, 1,
0.04315547, -2.556175, 2.995378, 0, 0, 1, 1, 1,
0.04418468, -0.7658639, 2.115551, 1, 0, 0, 1, 1,
0.04673716, -0.1668998, 3.425627, 1, 0, 0, 1, 1,
0.05465711, -0.9011437, 5.446351, 1, 0, 0, 1, 1,
0.05547119, 0.09803153, 1.23151, 1, 0, 0, 1, 1,
0.05622497, -0.6118304, 3.064705, 1, 0, 0, 1, 1,
0.0563263, 1.745743, 2.027093, 0, 0, 0, 1, 1,
0.05687748, 1.331446, 1.342696, 0, 0, 0, 1, 1,
0.06120619, -1.412999, 1.850112, 0, 0, 0, 1, 1,
0.06237905, -1.382722, 1.397793, 0, 0, 0, 1, 1,
0.0636302, -0.9188258, 3.519403, 0, 0, 0, 1, 1,
0.06426079, 0.9326374, -0.960776, 0, 0, 0, 1, 1,
0.06782271, 0.287782, 1.144359, 0, 0, 0, 1, 1,
0.07244159, -0.778748, 2.935235, 1, 1, 1, 1, 1,
0.08008719, -0.1238345, 1.798576, 1, 1, 1, 1, 1,
0.08215756, 0.6731133, 1.384113, 1, 1, 1, 1, 1,
0.08368187, 1.783253, 0.006309867, 1, 1, 1, 1, 1,
0.0851574, 1.449483, -1.198736, 1, 1, 1, 1, 1,
0.08831773, -1.62777, 2.707131, 1, 1, 1, 1, 1,
0.09161558, 0.0880607, 0.9179836, 1, 1, 1, 1, 1,
0.09300777, 1.018223, 0.288939, 1, 1, 1, 1, 1,
0.09306134, -0.08799579, 1.514517, 1, 1, 1, 1, 1,
0.09312004, 0.1229035, 1.719816, 1, 1, 1, 1, 1,
0.09735812, -0.431313, 2.253928, 1, 1, 1, 1, 1,
0.1016083, 0.4487534, 0.1480206, 1, 1, 1, 1, 1,
0.1110405, 0.947071, 0.2919583, 1, 1, 1, 1, 1,
0.1137613, 1.089928, 0.7627415, 1, 1, 1, 1, 1,
0.1149206, -0.27346, 0.281532, 1, 1, 1, 1, 1,
0.1174014, -0.999312, 2.814726, 0, 0, 1, 1, 1,
0.1178413, 0.5651287, 0.9623612, 1, 0, 0, 1, 1,
0.1183251, -0.1452193, 2.27257, 1, 0, 0, 1, 1,
0.1187532, 0.3977862, 0.3285925, 1, 0, 0, 1, 1,
0.1188397, 2.006499, 1.001784, 1, 0, 0, 1, 1,
0.1210814, 1.133629, -1.997113, 1, 0, 0, 1, 1,
0.12509, 1.114393, -0.8883442, 0, 0, 0, 1, 1,
0.1258687, 0.3727697, 0.1011255, 0, 0, 0, 1, 1,
0.1269135, 0.06295896, 1.084327, 0, 0, 0, 1, 1,
0.1280572, 0.7672679, 2.12043, 0, 0, 0, 1, 1,
0.1290496, -0.3808355, 2.232655, 0, 0, 0, 1, 1,
0.1300083, 1.251366, 2.739125, 0, 0, 0, 1, 1,
0.1372086, 0.4685759, -1.645123, 0, 0, 0, 1, 1,
0.1411882, -0.2252331, 1.521097, 1, 1, 1, 1, 1,
0.1460042, -1.747297, 2.084971, 1, 1, 1, 1, 1,
0.1476921, -0.1281732, 3.439395, 1, 1, 1, 1, 1,
0.1510855, -0.3095855, 2.997276, 1, 1, 1, 1, 1,
0.1557184, 0.854592, 1.392668, 1, 1, 1, 1, 1,
0.1601669, -0.1739851, 2.160846, 1, 1, 1, 1, 1,
0.1666031, -0.3418885, 1.829354, 1, 1, 1, 1, 1,
0.1680946, 1.321701, 0.3112911, 1, 1, 1, 1, 1,
0.1706302, -0.3753972, 1.924921, 1, 1, 1, 1, 1,
0.1717425, -0.04898294, 3.327653, 1, 1, 1, 1, 1,
0.1729921, 2.515547, -0.8327177, 1, 1, 1, 1, 1,
0.175944, 0.3370627, 1.00119, 1, 1, 1, 1, 1,
0.1765888, -0.6254823, 2.349804, 1, 1, 1, 1, 1,
0.1821912, -1.356977, 3.499053, 1, 1, 1, 1, 1,
0.1840979, -0.8617313, 3.482153, 1, 1, 1, 1, 1,
0.1859854, -0.1262073, 2.823799, 0, 0, 1, 1, 1,
0.1875917, 1.066587, 1.314139, 1, 0, 0, 1, 1,
0.1888182, -0.4356329, 2.31829, 1, 0, 0, 1, 1,
0.1901664, -0.4351, 1.574166, 1, 0, 0, 1, 1,
0.191331, -0.8185456, 3.81809, 1, 0, 0, 1, 1,
0.1919772, -1.948578, 2.48356, 1, 0, 0, 1, 1,
0.1942266, -0.1742199, 4.574231, 0, 0, 0, 1, 1,
0.1952705, 0.6491129, -0.3922124, 0, 0, 0, 1, 1,
0.1977904, -2.11811, 2.758995, 0, 0, 0, 1, 1,
0.1986322, -0.9777004, 3.001044, 0, 0, 0, 1, 1,
0.2038002, 0.6662145, 1.657059, 0, 0, 0, 1, 1,
0.2054881, -2.002404, 2.656609, 0, 0, 0, 1, 1,
0.2110656, 0.3554445, 0.4269681, 0, 0, 0, 1, 1,
0.2188866, -0.01237135, 0.6548237, 1, 1, 1, 1, 1,
0.2208578, 0.3800147, 1.284139, 1, 1, 1, 1, 1,
0.2215758, -1.097041, 2.315994, 1, 1, 1, 1, 1,
0.221993, -0.6382026, 2.259071, 1, 1, 1, 1, 1,
0.2228059, 1.472571, 0.4029416, 1, 1, 1, 1, 1,
0.2256799, -0.3858026, 3.115004, 1, 1, 1, 1, 1,
0.2273805, -0.09308489, 1.925242, 1, 1, 1, 1, 1,
0.2292644, 0.5569422, 0.5427384, 1, 1, 1, 1, 1,
0.2294089, -1.365688, 2.752982, 1, 1, 1, 1, 1,
0.2307454, 0.1125433, 0.06859996, 1, 1, 1, 1, 1,
0.2367269, 2.906393, 0.7844518, 1, 1, 1, 1, 1,
0.2370639, -1.882368, 1.067146, 1, 1, 1, 1, 1,
0.2388353, -0.9194322, 2.894459, 1, 1, 1, 1, 1,
0.2389315, -0.2226883, 3.092033, 1, 1, 1, 1, 1,
0.2393396, -0.7682248, 2.8411, 1, 1, 1, 1, 1,
0.2397526, -0.7418933, 4.468593, 0, 0, 1, 1, 1,
0.2399054, -1.065401, 2.334419, 1, 0, 0, 1, 1,
0.2415553, 1.969383, -0.2531332, 1, 0, 0, 1, 1,
0.2435403, 1.150935, -0.165395, 1, 0, 0, 1, 1,
0.2451127, 0.4279485, 0.9413071, 1, 0, 0, 1, 1,
0.2497651, -1.299002, 3.685767, 1, 0, 0, 1, 1,
0.2574962, 1.530505, 1.140836, 0, 0, 0, 1, 1,
0.270024, -0.1443128, 2.936228, 0, 0, 0, 1, 1,
0.2702051, -0.9782733, 4.686899, 0, 0, 0, 1, 1,
0.2776884, -0.8219944, 2.939504, 0, 0, 0, 1, 1,
0.2792335, 1.337949, 1.405705, 0, 0, 0, 1, 1,
0.2811821, -0.2634032, 3.026391, 0, 0, 0, 1, 1,
0.282188, 0.7985653, 0.04078132, 0, 0, 0, 1, 1,
0.2870664, -0.2944071, 4.44694, 1, 1, 1, 1, 1,
0.2901407, -0.6390748, 2.340702, 1, 1, 1, 1, 1,
0.2903204, 1.82132, -0.4124885, 1, 1, 1, 1, 1,
0.2914114, -0.9780871, 2.244092, 1, 1, 1, 1, 1,
0.2935841, 1.027507, 0.6236749, 1, 1, 1, 1, 1,
0.2954242, -1.868574, 2.336421, 1, 1, 1, 1, 1,
0.2988002, -1.271001, 3.375459, 1, 1, 1, 1, 1,
0.300421, -0.4528851, 0.6213886, 1, 1, 1, 1, 1,
0.3017885, 0.256297, 2.467594, 1, 1, 1, 1, 1,
0.3044944, -0.5804081, 1.845058, 1, 1, 1, 1, 1,
0.3053779, 1.178023, 0.3531795, 1, 1, 1, 1, 1,
0.3053944, 0.04497205, -0.1985358, 1, 1, 1, 1, 1,
0.3070485, 1.536999, 1.874298, 1, 1, 1, 1, 1,
0.3076994, 0.7895, 0.1784613, 1, 1, 1, 1, 1,
0.3081318, -1.420511, 3.914522, 1, 1, 1, 1, 1,
0.3088027, 0.9239836, 1.490212, 0, 0, 1, 1, 1,
0.3131295, 0.6473773, 0.7186185, 1, 0, 0, 1, 1,
0.3180377, -0.308046, 1.18124, 1, 0, 0, 1, 1,
0.3184105, -0.2279642, 3.824912, 1, 0, 0, 1, 1,
0.3196885, 0.4044412, 2.828192, 1, 0, 0, 1, 1,
0.3204753, 1.375414, 2.324083, 1, 0, 0, 1, 1,
0.3210691, -1.357901, 3.426764, 0, 0, 0, 1, 1,
0.3234141, 1.287497, 1.011129, 0, 0, 0, 1, 1,
0.3240771, 1.445598, -1.000752, 0, 0, 0, 1, 1,
0.3276314, -0.984697, 3.073996, 0, 0, 0, 1, 1,
0.3308459, 1.074299, -0.85896, 0, 0, 0, 1, 1,
0.3353377, -0.4641892, 3.111921, 0, 0, 0, 1, 1,
0.3413059, 0.2854076, -0.09287312, 0, 0, 0, 1, 1,
0.3418005, -0.1608264, 2.011867, 1, 1, 1, 1, 1,
0.3428385, 1.464781, 0.666261, 1, 1, 1, 1, 1,
0.3440649, -1.141844, 2.029584, 1, 1, 1, 1, 1,
0.3444945, -0.0828173, 1.703227, 1, 1, 1, 1, 1,
0.3456627, -1.313319, 3.262061, 1, 1, 1, 1, 1,
0.3468198, -0.2069518, 2.152024, 1, 1, 1, 1, 1,
0.3492832, -1.11853, 3.17389, 1, 1, 1, 1, 1,
0.3529376, 0.4087333, 0.008306995, 1, 1, 1, 1, 1,
0.357168, -0.4788754, 2.512289, 1, 1, 1, 1, 1,
0.3622795, 2.004766, -0.3627394, 1, 1, 1, 1, 1,
0.3624373, 0.7834347, 0.8101979, 1, 1, 1, 1, 1,
0.3652143, -0.700092, 3.212321, 1, 1, 1, 1, 1,
0.3655669, -1.204204, 1.907694, 1, 1, 1, 1, 1,
0.366905, -2.231155, 1.493739, 1, 1, 1, 1, 1,
0.3721781, 1.328313, -0.9590236, 1, 1, 1, 1, 1,
0.3745153, 0.5153343, 1.169537, 0, 0, 1, 1, 1,
0.3750859, 1.312269, -0.1547785, 1, 0, 0, 1, 1,
0.3831459, 1.243946, 0.761785, 1, 0, 0, 1, 1,
0.3848381, 0.4113704, 1.882545, 1, 0, 0, 1, 1,
0.3851661, 1.469095, 0.2939594, 1, 0, 0, 1, 1,
0.3857786, 0.3742655, 0.2823409, 1, 0, 0, 1, 1,
0.3882808, -0.4515475, 1.887164, 0, 0, 0, 1, 1,
0.3901144, 0.5630718, 0.6303783, 0, 0, 0, 1, 1,
0.3912873, 0.2963761, 0.6417813, 0, 0, 0, 1, 1,
0.3913794, 0.3729719, 1.036154, 0, 0, 0, 1, 1,
0.3937861, -1.411203, 1.187673, 0, 0, 0, 1, 1,
0.3951666, -2.142526, 2.841475, 0, 0, 0, 1, 1,
0.3958136, 0.2521313, 1.073936, 0, 0, 0, 1, 1,
0.407057, -0.5347667, 2.154142, 1, 1, 1, 1, 1,
0.4078861, -0.3436103, 2.713407, 1, 1, 1, 1, 1,
0.4081076, -0.1999749, 1.03779, 1, 1, 1, 1, 1,
0.4104204, 0.1096701, 2.387168, 1, 1, 1, 1, 1,
0.4195147, -0.2653022, 2.066458, 1, 1, 1, 1, 1,
0.4254225, 1.78857, -0.2067352, 1, 1, 1, 1, 1,
0.4364278, -0.1814164, 1.757377, 1, 1, 1, 1, 1,
0.4368673, 0.5796482, -0.6457356, 1, 1, 1, 1, 1,
0.4408576, -0.5634648, 2.406937, 1, 1, 1, 1, 1,
0.4462439, -1.500193, 2.206806, 1, 1, 1, 1, 1,
0.4474299, -0.174483, 1.022434, 1, 1, 1, 1, 1,
0.4481174, -0.4828955, 3.983421, 1, 1, 1, 1, 1,
0.4534458, -1.905162, 4.277557, 1, 1, 1, 1, 1,
0.4548447, 1.213779, 0.2409515, 1, 1, 1, 1, 1,
0.459626, 0.03923983, 2.009173, 1, 1, 1, 1, 1,
0.461711, -1.342215, 3.742369, 0, 0, 1, 1, 1,
0.4625887, 1.621463, 0.9449355, 1, 0, 0, 1, 1,
0.4639426, 1.101254, 0.559579, 1, 0, 0, 1, 1,
0.4695251, 0.3589835, 2.0337, 1, 0, 0, 1, 1,
0.4698389, -0.02899382, 1.435835, 1, 0, 0, 1, 1,
0.4715901, -0.762149, 3.126449, 1, 0, 0, 1, 1,
0.4748709, 0.7839097, -1.137778, 0, 0, 0, 1, 1,
0.475684, -0.783498, 3.060792, 0, 0, 0, 1, 1,
0.4782164, -0.05227195, 0.7103058, 0, 0, 0, 1, 1,
0.479402, 0.6260385, 1.563238, 0, 0, 0, 1, 1,
0.481618, 1.010355, -0.5142691, 0, 0, 0, 1, 1,
0.4829357, 0.2415028, 0.2498945, 0, 0, 0, 1, 1,
0.484219, 1.040357, -0.2946859, 0, 0, 0, 1, 1,
0.484311, 2.567221, 0.2916823, 1, 1, 1, 1, 1,
0.4881792, -1.63663, 2.615847, 1, 1, 1, 1, 1,
0.4904082, 0.03196038, -0.1954907, 1, 1, 1, 1, 1,
0.4909848, 0.1115538, 3.502439, 1, 1, 1, 1, 1,
0.4914248, 0.683736, -0.5572423, 1, 1, 1, 1, 1,
0.4925019, -0.7735989, 2.909736, 1, 1, 1, 1, 1,
0.4947738, 1.023378, -0.2896091, 1, 1, 1, 1, 1,
0.4959419, -0.6410037, 1.083787, 1, 1, 1, 1, 1,
0.4970747, 0.175255, 0.2127711, 1, 1, 1, 1, 1,
0.5031005, -1.672282, 3.393912, 1, 1, 1, 1, 1,
0.5041703, 0.9634515, 1.207029, 1, 1, 1, 1, 1,
0.5064389, -0.4143644, 2.203666, 1, 1, 1, 1, 1,
0.5083628, 0.4944905, 0.4208659, 1, 1, 1, 1, 1,
0.5136546, 1.711715, -0.6712226, 1, 1, 1, 1, 1,
0.517934, 0.07854743, 1.174004, 1, 1, 1, 1, 1,
0.5210454, 1.192011, -1.214101, 0, 0, 1, 1, 1,
0.526567, -1.237017, 1.452556, 1, 0, 0, 1, 1,
0.5276913, -2.130955, 3.145524, 1, 0, 0, 1, 1,
0.5311208, -0.9480134, 2.262408, 1, 0, 0, 1, 1,
0.5327839, -0.8034344, 4.321076, 1, 0, 0, 1, 1,
0.5330819, -0.3140714, 1.006243, 1, 0, 0, 1, 1,
0.5334606, 0.7636955, 2.494684, 0, 0, 0, 1, 1,
0.5370576, 1.825176, 1.368211, 0, 0, 0, 1, 1,
0.5405432, -0.6111708, 2.351562, 0, 0, 0, 1, 1,
0.5408244, 0.9043198, -1.274401, 0, 0, 0, 1, 1,
0.5455178, -0.2063554, 3.183169, 0, 0, 0, 1, 1,
0.5465528, -1.080865, 3.068253, 0, 0, 0, 1, 1,
0.5483476, 1.459024, 1.522056, 0, 0, 0, 1, 1,
0.5528004, 0.4350688, 0.4115317, 1, 1, 1, 1, 1,
0.5534585, -0.6115199, 3.748418, 1, 1, 1, 1, 1,
0.5601386, -1.344084, 1.566458, 1, 1, 1, 1, 1,
0.5742653, -1.505899, 2.693888, 1, 1, 1, 1, 1,
0.5765947, -0.12447, 0.5929162, 1, 1, 1, 1, 1,
0.5781997, -2.129005, 3.753206, 1, 1, 1, 1, 1,
0.5820811, 1.059521, 1.117964, 1, 1, 1, 1, 1,
0.6013867, -1.280667, 2.918401, 1, 1, 1, 1, 1,
0.6018569, 0.08646117, 1.453145, 1, 1, 1, 1, 1,
0.6033209, -0.09353198, 3.000129, 1, 1, 1, 1, 1,
0.6033251, 0.1445948, 1.82584, 1, 1, 1, 1, 1,
0.6086389, -0.5419042, 4.485397, 1, 1, 1, 1, 1,
0.6126717, 0.3601877, 2.211517, 1, 1, 1, 1, 1,
0.6191813, 0.7501366, 1.063725, 1, 1, 1, 1, 1,
0.6194783, -0.9385816, 0.8169281, 1, 1, 1, 1, 1,
0.6207131, 1.351256, 0.377212, 0, 0, 1, 1, 1,
0.6339296, -0.150743, 1.721717, 1, 0, 0, 1, 1,
0.640029, -0.7420156, 1.850167, 1, 0, 0, 1, 1,
0.6451962, -0.1039354, 1.41998, 1, 0, 0, 1, 1,
0.6468701, -0.8897519, 3.921853, 1, 0, 0, 1, 1,
0.6506835, -0.4212399, 1.476852, 1, 0, 0, 1, 1,
0.6541513, -1.654436, 1.986223, 0, 0, 0, 1, 1,
0.6571025, 1.412807, 1.486348, 0, 0, 0, 1, 1,
0.6580932, 1.258463, 1.131783, 0, 0, 0, 1, 1,
0.6738994, -1.452189, 2.593358, 0, 0, 0, 1, 1,
0.6837212, 2.045618, -0.9816719, 0, 0, 0, 1, 1,
0.6849048, -0.4672701, 2.664023, 0, 0, 0, 1, 1,
0.6861101, -2.443475, 1.937769, 0, 0, 0, 1, 1,
0.690829, -1.49834, 3.000575, 1, 1, 1, 1, 1,
0.6916761, -0.4649937, 2.629371, 1, 1, 1, 1, 1,
0.6996765, 0.6868566, -0.5683228, 1, 1, 1, 1, 1,
0.7038425, -0.829115, 0.9292307, 1, 1, 1, 1, 1,
0.7048048, 0.5205303, -0.4927252, 1, 1, 1, 1, 1,
0.7062312, 0.5056082, 0.139125, 1, 1, 1, 1, 1,
0.7140732, -0.779717, 1.443487, 1, 1, 1, 1, 1,
0.7177706, -1.035804, 1.671159, 1, 1, 1, 1, 1,
0.7202371, 1.254942, -0.2604856, 1, 1, 1, 1, 1,
0.724445, -0.3873832, 2.472189, 1, 1, 1, 1, 1,
0.7293531, -0.2021008, 2.416474, 1, 1, 1, 1, 1,
0.7347818, -2.28002, 3.731272, 1, 1, 1, 1, 1,
0.7386624, 0.9836342, 1.215091, 1, 1, 1, 1, 1,
0.7402707, -0.4822345, 1.769604, 1, 1, 1, 1, 1,
0.7487696, 1.046189, 2.405219, 1, 1, 1, 1, 1,
0.751757, -2.515566, 2.994073, 0, 0, 1, 1, 1,
0.7529683, -0.5577245, 1.076059, 1, 0, 0, 1, 1,
0.754988, -0.7621464, 3.310639, 1, 0, 0, 1, 1,
0.7564614, -0.8296782, 2.168585, 1, 0, 0, 1, 1,
0.7608429, 0.1782881, 1.55576, 1, 0, 0, 1, 1,
0.7681853, 0.3612418, 0.9331698, 1, 0, 0, 1, 1,
0.7699235, -0.8610264, 2.002537, 0, 0, 0, 1, 1,
0.7736657, -0.1191678, 1.704479, 0, 0, 0, 1, 1,
0.7802432, -1.059482, 3.309568, 0, 0, 0, 1, 1,
0.7830387, 0.6179441, -0.5218238, 0, 0, 0, 1, 1,
0.7871444, -0.01015796, 0.8422631, 0, 0, 0, 1, 1,
0.7877842, 0.7397286, 0.6514689, 0, 0, 0, 1, 1,
0.7880604, 1.148384, -0.2218271, 0, 0, 0, 1, 1,
0.7880792, -0.05179815, 3.891415, 1, 1, 1, 1, 1,
0.7899833, -0.4016562, 3.573258, 1, 1, 1, 1, 1,
0.7953189, 0.946223, -0.2139127, 1, 1, 1, 1, 1,
0.8022559, -0.4144317, 1.25481, 1, 1, 1, 1, 1,
0.8042592, 1.05656, 2.825047, 1, 1, 1, 1, 1,
0.8054758, -0.4348374, 2.891723, 1, 1, 1, 1, 1,
0.806906, -0.1184106, 1.254411, 1, 1, 1, 1, 1,
0.8113801, -1.368009, 1.978678, 1, 1, 1, 1, 1,
0.813059, 1.895597, -1.695781, 1, 1, 1, 1, 1,
0.8140491, 1.227964, -0.4529214, 1, 1, 1, 1, 1,
0.8149055, 2.822671, -2.262843, 1, 1, 1, 1, 1,
0.8206248, -0.1384756, 3.491765, 1, 1, 1, 1, 1,
0.8252833, -0.01229163, 1.068906, 1, 1, 1, 1, 1,
0.8254735, -1.474229, 2.220712, 1, 1, 1, 1, 1,
0.8256164, 0.21919, 2.181181, 1, 1, 1, 1, 1,
0.8312662, 0.3373008, 1.861895, 0, 0, 1, 1, 1,
0.8330185, -0.6644898, 2.455198, 1, 0, 0, 1, 1,
0.839016, 1.34343, 2.030684, 1, 0, 0, 1, 1,
0.8434635, 0.8252671, 1.242248, 1, 0, 0, 1, 1,
0.8485418, -0.5374391, 2.060048, 1, 0, 0, 1, 1,
0.853867, -1.656457, 3.783026, 1, 0, 0, 1, 1,
0.8562873, 1.790985, 0.39118, 0, 0, 0, 1, 1,
0.8563941, 1.468468, 2.838233, 0, 0, 0, 1, 1,
0.8565627, -0.5648502, 3.175198, 0, 0, 0, 1, 1,
0.8601757, 0.3744831, 1.402066, 0, 0, 0, 1, 1,
0.8623225, 0.03416346, 2.30168, 0, 0, 0, 1, 1,
0.8668853, -0.3692732, 0.2724344, 0, 0, 0, 1, 1,
0.869569, 0.8468448, 0.05803958, 0, 0, 0, 1, 1,
0.8714867, 0.7861152, 0.6425108, 1, 1, 1, 1, 1,
0.8783488, -0.984176, 3.685945, 1, 1, 1, 1, 1,
0.8884504, -0.02624379, 0.6316984, 1, 1, 1, 1, 1,
0.8896477, -1.05853, 2.928451, 1, 1, 1, 1, 1,
0.9094293, 0.00552104, 3.557565, 1, 1, 1, 1, 1,
0.9104733, 1.083747, 0.00764627, 1, 1, 1, 1, 1,
0.913218, 0.05362806, 0.8376396, 1, 1, 1, 1, 1,
0.9150973, 1.713048, -0.4842041, 1, 1, 1, 1, 1,
0.9164281, 0.7965108, 1.232998, 1, 1, 1, 1, 1,
0.9211811, 0.7995706, 2.83794, 1, 1, 1, 1, 1,
0.9294984, 0.1512083, 1.052167, 1, 1, 1, 1, 1,
0.9380839, -0.6201692, 0.9738591, 1, 1, 1, 1, 1,
0.9398638, 1.101848, 0.2072143, 1, 1, 1, 1, 1,
0.9405631, 0.6327543, 3.809143, 1, 1, 1, 1, 1,
0.9434092, 0.7077998, 2.390108, 1, 1, 1, 1, 1,
0.9446644, -0.5591235, 1.134037, 0, 0, 1, 1, 1,
0.958368, -0.4071423, 2.253706, 1, 0, 0, 1, 1,
0.9607221, 1.138182, -0.2453561, 1, 0, 0, 1, 1,
0.9640378, 0.3776362, 3.784011, 1, 0, 0, 1, 1,
0.9705293, 0.6390807, 2.485269, 1, 0, 0, 1, 1,
0.9723547, -0.2004302, 1.076999, 1, 0, 0, 1, 1,
0.9726506, 1.294425, -0.05833611, 0, 0, 0, 1, 1,
0.9755632, 1.054179, 0.5942895, 0, 0, 0, 1, 1,
0.9799738, 1.162761, 0.4342468, 0, 0, 0, 1, 1,
0.9818102, 0.3427522, 3.215423, 0, 0, 0, 1, 1,
0.983256, 0.1936217, 1.595316, 0, 0, 0, 1, 1,
0.9834402, 1.085142, 1.321406, 0, 0, 0, 1, 1,
0.983929, 0.1390369, 2.046858, 0, 0, 0, 1, 1,
0.9888966, -1.532801, 2.161531, 1, 1, 1, 1, 1,
0.9914441, 0.6484576, 1.591056, 1, 1, 1, 1, 1,
0.9923289, 1.178105, 0.5652034, 1, 1, 1, 1, 1,
0.999907, 0.7318423, -0.09086506, 1, 1, 1, 1, 1,
1.000448, 0.5089818, -0.06892484, 1, 1, 1, 1, 1,
1.001846, 0.2355044, 3.332626, 1, 1, 1, 1, 1,
1.00458, 1.589964, -0.959977, 1, 1, 1, 1, 1,
1.012096, 0.236394, 0.1275227, 1, 1, 1, 1, 1,
1.013452, 1.589119, -0.9758128, 1, 1, 1, 1, 1,
1.014347, -0.9604793, 3.788547, 1, 1, 1, 1, 1,
1.020612, 1.235264, -1.071411, 1, 1, 1, 1, 1,
1.021465, 0.8585655, -0.01548533, 1, 1, 1, 1, 1,
1.022801, -0.3532038, 1.474357, 1, 1, 1, 1, 1,
1.022897, 2.321031, -0.07551455, 1, 1, 1, 1, 1,
1.024147, 1.370316, 2.002237, 1, 1, 1, 1, 1,
1.024799, -0.3250397, 0.297702, 0, 0, 1, 1, 1,
1.025243, -1.286892, 2.861491, 1, 0, 0, 1, 1,
1.027417, -0.3129661, 3.571251, 1, 0, 0, 1, 1,
1.029988, -0.4059635, 1.650419, 1, 0, 0, 1, 1,
1.030084, -0.1269437, 2.603208, 1, 0, 0, 1, 1,
1.030502, -1.612144, 3.059432, 1, 0, 0, 1, 1,
1.03217, -0.0178005, 2.298988, 0, 0, 0, 1, 1,
1.036561, 0.1989518, 0.2821473, 0, 0, 0, 1, 1,
1.042488, -0.1329185, 0.7606809, 0, 0, 0, 1, 1,
1.048535, 0.6760862, -0.1775293, 0, 0, 0, 1, 1,
1.055304, 2.081282, -0.5266865, 0, 0, 0, 1, 1,
1.057503, 0.6660312, 1.167554, 0, 0, 0, 1, 1,
1.057708, 1.234344, 0.8339794, 0, 0, 0, 1, 1,
1.0578, -0.5156843, 1.877867, 1, 1, 1, 1, 1,
1.059094, -0.6680944, 1.030775, 1, 1, 1, 1, 1,
1.067484, -1.285526, 1.829009, 1, 1, 1, 1, 1,
1.06835, -1.528813, 2.707972, 1, 1, 1, 1, 1,
1.069096, 2.296954, 0.2144129, 1, 1, 1, 1, 1,
1.076996, 0.5312141, 1.354323, 1, 1, 1, 1, 1,
1.082752, 0.2930532, 1.978889, 1, 1, 1, 1, 1,
1.086936, 1.042412, 0.09959839, 1, 1, 1, 1, 1,
1.097839, 0.3366508, 0.9538684, 1, 1, 1, 1, 1,
1.101537, 0.5161089, -0.06521358, 1, 1, 1, 1, 1,
1.102473, 0.08862311, 2.044959, 1, 1, 1, 1, 1,
1.113271, -1.222635, 1.218502, 1, 1, 1, 1, 1,
1.122587, 1.281425, -0.525456, 1, 1, 1, 1, 1,
1.12333, -1.346593, 3.87386, 1, 1, 1, 1, 1,
1.13366, -0.263631, 1.707636, 1, 1, 1, 1, 1,
1.133969, -0.6913303, 3.278229, 0, 0, 1, 1, 1,
1.142303, -0.4645229, 0.4417979, 1, 0, 0, 1, 1,
1.145355, -0.7704365, 0.389638, 1, 0, 0, 1, 1,
1.148488, 0.6706831, 1.67305, 1, 0, 0, 1, 1,
1.153792, 0.1351953, 1.138756, 1, 0, 0, 1, 1,
1.163351, 0.3923874, -0.3987735, 1, 0, 0, 1, 1,
1.163851, 0.9587182, 2.380145, 0, 0, 0, 1, 1,
1.167921, -0.1089121, 1.854973, 0, 0, 0, 1, 1,
1.176598, -1.123265, 1.090247, 0, 0, 0, 1, 1,
1.17947, 1.59025, 2.712187, 0, 0, 0, 1, 1,
1.18853, 1.211103, -1.086495, 0, 0, 0, 1, 1,
1.191446, -1.088251, 2.513623, 0, 0, 0, 1, 1,
1.193654, 1.441908, 0.5919144, 0, 0, 0, 1, 1,
1.196183, 0.1302626, 1.529618, 1, 1, 1, 1, 1,
1.198311, -1.125499, 2.787116, 1, 1, 1, 1, 1,
1.200324, -0.124902, 1.340218, 1, 1, 1, 1, 1,
1.201043, -0.8496223, 2.262503, 1, 1, 1, 1, 1,
1.201781, 0.4163847, 1.154429, 1, 1, 1, 1, 1,
1.204305, 0.2357737, 3.128452, 1, 1, 1, 1, 1,
1.207349, 0.9580638, -0.4667123, 1, 1, 1, 1, 1,
1.213161, 3.081894, -0.8110833, 1, 1, 1, 1, 1,
1.213863, -0.6780016, 2.567369, 1, 1, 1, 1, 1,
1.221142, -1.644843, 2.131831, 1, 1, 1, 1, 1,
1.226246, -0.4210809, 2.824179, 1, 1, 1, 1, 1,
1.227209, -0.7645099, 1.381346, 1, 1, 1, 1, 1,
1.227238, -0.8176746, 1.822556, 1, 1, 1, 1, 1,
1.227794, -0.3075891, 1.826398, 1, 1, 1, 1, 1,
1.239699, -2.83037, 1.626031, 1, 1, 1, 1, 1,
1.240037, 1.164366, -0.4605586, 0, 0, 1, 1, 1,
1.243279, 0.3439227, 0.441434, 1, 0, 0, 1, 1,
1.250073, 0.2327172, 2.714218, 1, 0, 0, 1, 1,
1.265329, 0.5688268, -0.3265566, 1, 0, 0, 1, 1,
1.267525, -2.31794, 2.219705, 1, 0, 0, 1, 1,
1.268785, 1.380634, 1.119425, 1, 0, 0, 1, 1,
1.270638, -0.6708362, 1.782534, 0, 0, 0, 1, 1,
1.271667, -1.729273, 2.55924, 0, 0, 0, 1, 1,
1.273169, 0.09943578, 1.564005, 0, 0, 0, 1, 1,
1.275567, -0.3038315, 3.944334, 0, 0, 0, 1, 1,
1.278951, -1.822269, 2.512312, 0, 0, 0, 1, 1,
1.281394, -0.6487206, 1.014592, 0, 0, 0, 1, 1,
1.282472, -0.4351571, 1.282741, 0, 0, 0, 1, 1,
1.29419, 1.662186, -0.1002021, 1, 1, 1, 1, 1,
1.296156, -0.7131372, 1.197925, 1, 1, 1, 1, 1,
1.31757, 0.4638856, 1.400542, 1, 1, 1, 1, 1,
1.318745, 0.380589, 0.3207052, 1, 1, 1, 1, 1,
1.338421, 0.191654, 0.9055039, 1, 1, 1, 1, 1,
1.350949, -0.9018136, 3.25936, 1, 1, 1, 1, 1,
1.352613, -1.531642, 1.863223, 1, 1, 1, 1, 1,
1.357407, 0.6940362, 0.6900835, 1, 1, 1, 1, 1,
1.372439, 0.4843114, 2.419076, 1, 1, 1, 1, 1,
1.38809, -2.238319, 2.966099, 1, 1, 1, 1, 1,
1.388548, 0.4715795, 0.8656708, 1, 1, 1, 1, 1,
1.395096, -0.1858767, 0.4678098, 1, 1, 1, 1, 1,
1.40834, -1.361239, 3.304631, 1, 1, 1, 1, 1,
1.410109, 0.9346002, 0.3781578, 1, 1, 1, 1, 1,
1.414072, 1.248175, 0.7590625, 1, 1, 1, 1, 1,
1.42477, -0.5862603, 2.450603, 0, 0, 1, 1, 1,
1.429542, 0.3510933, 1.050911, 1, 0, 0, 1, 1,
1.43119, -0.9538873, 3.504271, 1, 0, 0, 1, 1,
1.44032, 1.35497, -0.7116998, 1, 0, 0, 1, 1,
1.449793, 1.317181, 2.537818, 1, 0, 0, 1, 1,
1.479234, 0.5177855, 2.398558, 1, 0, 0, 1, 1,
1.482364, -0.6813925, 0.7219685, 0, 0, 0, 1, 1,
1.488891, 2.617435, 0.4992224, 0, 0, 0, 1, 1,
1.489028, 2.255691, 1.143565, 0, 0, 0, 1, 1,
1.494006, 0.6679555, 2.244594, 0, 0, 0, 1, 1,
1.498399, -0.5639605, 1.894977, 0, 0, 0, 1, 1,
1.513234, -2.379581, 4.236804, 0, 0, 0, 1, 1,
1.517141, 0.6838394, 1.293625, 0, 0, 0, 1, 1,
1.518483, -0.7213174, 2.290022, 1, 1, 1, 1, 1,
1.520251, 0.05340008, 0.625528, 1, 1, 1, 1, 1,
1.527629, -0.2280032, 2.629645, 1, 1, 1, 1, 1,
1.528918, 0.2887666, 2.506413, 1, 1, 1, 1, 1,
1.539165, -1.561149, 1.914337, 1, 1, 1, 1, 1,
1.575515, 0.06880524, 1.858229, 1, 1, 1, 1, 1,
1.576514, 0.2891029, 0.4920588, 1, 1, 1, 1, 1,
1.592583, 0.3196759, 1.698618, 1, 1, 1, 1, 1,
1.597023, 2.30503, 0.4123013, 1, 1, 1, 1, 1,
1.598293, 1.994796, 0.2057412, 1, 1, 1, 1, 1,
1.600119, 0.2327465, 1.599565, 1, 1, 1, 1, 1,
1.603983, -1.540769, 2.731558, 1, 1, 1, 1, 1,
1.612961, -0.1203556, 2.488879, 1, 1, 1, 1, 1,
1.624343, 1.094942, -0.280183, 1, 1, 1, 1, 1,
1.638529, 0.4517192, 1.39241, 1, 1, 1, 1, 1,
1.638637, -0.7277204, 1.483667, 0, 0, 1, 1, 1,
1.652167, -1.67145, 2.622445, 1, 0, 0, 1, 1,
1.655267, -1.092465, 1.126156, 1, 0, 0, 1, 1,
1.679117, -0.01364076, 2.144284, 1, 0, 0, 1, 1,
1.683542, 0.5187832, -0.1965979, 1, 0, 0, 1, 1,
1.713489, -0.7368999, 2.533306, 1, 0, 0, 1, 1,
1.728763, -1.480201, 2.326448, 0, 0, 0, 1, 1,
1.74474, -0.2380988, 2.239403, 0, 0, 0, 1, 1,
1.74782, -0.217077, 1.780284, 0, 0, 0, 1, 1,
1.759506, 0.1930977, 2.941539, 0, 0, 0, 1, 1,
1.777655, -0.9067982, 3.746345, 0, 0, 0, 1, 1,
1.784056, 1.418908, 1.837073, 0, 0, 0, 1, 1,
1.796512, -1.299792, 3.573198, 0, 0, 0, 1, 1,
1.802677, -0.06273961, 2.864525, 1, 1, 1, 1, 1,
1.804449, 0.9885914, 0.7367149, 1, 1, 1, 1, 1,
1.834623, 0.1544686, 2.760133, 1, 1, 1, 1, 1,
1.836122, 1.875268, 1.875347, 1, 1, 1, 1, 1,
1.858106, 0.4482407, 1.824572, 1, 1, 1, 1, 1,
1.86143, -0.6968933, 2.767282, 1, 1, 1, 1, 1,
1.870214, 2.362567, 0.02344696, 1, 1, 1, 1, 1,
1.874, -0.2354759, 2.480785, 1, 1, 1, 1, 1,
1.896532, 0.9520325, -0.4811898, 1, 1, 1, 1, 1,
1.935942, -1.090515, 1.32442, 1, 1, 1, 1, 1,
1.95248, 1.077145, 0.8520963, 1, 1, 1, 1, 1,
1.96041, 0.1408016, 2.83358, 1, 1, 1, 1, 1,
1.964373, -0.06383802, 2.342144, 1, 1, 1, 1, 1,
2.001976, -0.8737157, 1.647012, 1, 1, 1, 1, 1,
2.015951, -0.4390892, 1.147469, 1, 1, 1, 1, 1,
2.02119, -0.3130819, 3.537481, 0, 0, 1, 1, 1,
2.083282, -0.7218386, 1.466365, 1, 0, 0, 1, 1,
2.090676, -1.15048, 0.1967194, 1, 0, 0, 1, 1,
2.136163, -0.4995973, 2.441907, 1, 0, 0, 1, 1,
2.146427, 0.2309752, 1.557384, 1, 0, 0, 1, 1,
2.161306, 1.782018, 1.379521, 1, 0, 0, 1, 1,
2.216846, -0.35394, 1.572723, 0, 0, 0, 1, 1,
2.250155, -0.2497564, 0.3253491, 0, 0, 0, 1, 1,
2.280996, 0.5004132, 0.3885607, 0, 0, 0, 1, 1,
2.330473, 1.26069, 1.933835, 0, 0, 0, 1, 1,
2.345214, 2.09762, 1.728449, 0, 0, 0, 1, 1,
2.36309, 0.7625176, 2.632786, 0, 0, 0, 1, 1,
2.375118, 0.5111066, 2.654008, 0, 0, 0, 1, 1,
2.413676, 1.25694, 2.993413, 1, 1, 1, 1, 1,
2.453443, 0.4203067, 0.8857287, 1, 1, 1, 1, 1,
2.482852, 0.9884353, 1.549089, 1, 1, 1, 1, 1,
2.59302, -1.392981, 2.965879, 1, 1, 1, 1, 1,
2.963292, -1.040556, 3.688466, 1, 1, 1, 1, 1,
3.01616, -0.9191414, 2.430692, 1, 1, 1, 1, 1,
3.414186, 1.194072, 1.615482, 1, 1, 1, 1, 1
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
var radius = 9.451589;
var distance = 33.19831;
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
mvMatrix.translate( -0.125917, -0.125762, -0.1385527 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.19831);
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